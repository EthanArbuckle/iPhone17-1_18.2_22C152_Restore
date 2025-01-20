void *get_tailspin_ondisk_config()
{
  void *v0;
  _DWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned char __src[8192];
  uint64_t v54;

  MEMORY[0x1F4188790]();
  v54 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/var/db/tailspin_config.plist"];
  if (v0)
  {
    v1 = tailspin_config_create_with_default_config();
    if (v1)
    {
      v2 = v1;
      v3 = [v0 objectForKeyedSubscript:@"EnforcedByProfile"];
      v4 = [v0 objectForKeyedSubscript:@"EnforcedByTasking"];
      v5 = [v0 objectForKeyedSubscript:@"EnforcedByManualConfiguration"];
      v6 = v5;
      if (v3)
      {
        if (v4) {
          sub_1C86F45C0();
        }
        if (v5) {
          sub_1C86F45C0();
        }
        if (([v3 BOOLValue] & 1) == 0) {
          sub_1C86F45C0();
        }
        v7 = 3;
      }
      else if (v4)
      {
        if (v5) {
          sub_1C86F45C0();
        }
        if (([v4 BOOLValue] & 1) == 0) {
          sub_1C86F45C0();
        }
        v7 = 1;
      }
      else
      {
        if (!v5)
        {
          tailspin_config_free(v2);
          v2 = 0;
LABEL_73:

          goto LABEL_74;
        }
        if (([v5 BOOLValue] & 1) == 0) {
          sub_1C86F45C0();
        }
        v7 = 2;
      }
      *((_DWORD *)v2 + 2) = v7;
      v17 = [v0 objectForKeyedSubscript:@"Enabled"];
      if (v17)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          *((unsigned char *)v2 + 8360) = [v17 BOOLValue];
          *v2 |= 0x80uLL;
          v18 = [v0 objectForKeyedSubscript:@"EnabledModifier"];
          v19 = v18;
          if (v18)
          {
            [v18 UTF8String];
            __strlcpy_chk();
          }
        }
      }
      v52 = v17;
      v20 = [v0 objectForKeyedSubscript:@"KDebug"];
      v21 = v20;
      if (v20)
      {
        v22 = [v20 objectForKeyedSubscript:@"BufferSizeMegabytes"];
        if (v22)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v2[1030] = [v22 unsignedLongLongValue];
            *v2 |= 2uLL;
            v23 = [v21 objectForKeyedSubscript:@"BufferSizeModifier"];
            v24 = v23;
            if (v23)
            {
              [v23 UTF8String];
              __strlcpy_chk();
            }
          }
        }
        v25 = [v21 objectForKeyedSubscript:@"FilterDescriptor"];
        if (v25)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v26 = v25;
            if ([v26 UTF8String])
            {
              [v26 UTF8String];
              if (!trace_parse_filter())
              {
                memcpy((char *)v2 + 12, __src, 0x2000uLL);
                *v2 |= 1uLL;
                v27 = [v21 objectForKeyedSubscript:@"FilterDescriptorModifier"];
                v28 = v27;
                if (v27)
                {
                  [v27 UTF8String];
                  __strlcpy_chk();
                }
              }
            }
          }
        }
      }
      v29 = [v0 objectForKeyedSubscript:@"Sampling"];
      v30 = v29;
      if (v29)
      {
        v31 = [v29 objectForKeyedSubscript:@"OnCoreSamplingPeriodNanoseconds"];
        if (v31)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v2[1040] = [v31 unsignedLongLongValue];
            *v2 |= 0x10uLL;
            v32 = [v30 objectForKeyedSubscript:@"OnCoreSamplingPeriodModifier"];
            v33 = v32;
            if (v32)
            {
              [v32 UTF8String];
              __strlcpy_chk();
            }
          }
        }
        v51 = v6;
        v34 = [v30 objectForKeyedSubscript:@"FullSystemSamplingPeriodNanoseconds"];
        if (v34)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v2[1035] = [v34 unsignedLongLongValue];
            *v2 |= 8uLL;
            v35 = [v30 objectForKeyedSubscript:@"FullSystemSamplingPeriodModifier"];
            v36 = v35;
            if (v35)
            {
              [v35 UTF8String];
              __strlcpy_chk();
            }
          }
        }
        v50 = v31;
        v37 = [v30 objectForKeyedSubscript:@"IsCswitchSamplingEnabled"];
        if (v37)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *((_DWORD *)v2 + 2099) = *((_DWORD *)v2 + 2099) & 0xFFFFFFFE | [v37 BOOLValue];
            *v2 |= 0x20uLL;
            v38 = [v30 objectForKeyedSubscript:@"CswitchSamplingEnabledModifier"];
            v39 = v38;
            if (v38)
            {
              [v38 UTF8String];
              __strlcpy_chk();
            }
          }
        }
        v40 = [v30 objectForKeyedSubscript:@"IsSyscallSamplingEnabled"];
        if (v40)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v40 BOOLValue]) {
              v41 = 2;
            }
            else {
              v41 = 0;
            }
            *((_DWORD *)v2 + 2099) = *((_DWORD *)v2 + 2099) & 0xFFFFFFFD | v41;
            *v2 |= 0x20uLL;
            v42 = [v30 objectForKeyedSubscript:@"CswitchSamplingEnabledModifier"];
            v43 = v42;
            if (v42)
            {
              [v42 UTF8String];
              __strlcpy_chk();
            }
          }
        }
        v44 = [v30 objectForKeyedSubscript:@"IsVMFaultSamplingEnabled"];
        if (v44)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v49 = v3;
            if ([v44 BOOLValue]) {
              v45 = 4;
            }
            else {
              v45 = 0;
            }
            *((_DWORD *)v2 + 2099) = *((_DWORD *)v2 + 2099) & 0xFFFFFFFB | v45;
            *v2 |= 0x20uLL;
            v46 = [v30 objectForKeyedSubscript:@"CswitchSamplingEnabledModifier"];
            v47 = v46;
            if (v46)
            {
              [v46 UTF8String];
              __strlcpy_chk();
            }

            v3 = v49;
          }
        }

        v6 = v51;
      }
      if (!*v2) {
        sub_1C86F45C0();
      }

      goto LABEL_73;
    }
    v8 = *__error();
    v9 = sub_1C86DE154();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4588(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v2 = 0;
    *__error() = v8;
  }
  else
  {
    v2 = 0;
  }
LABEL_74:

  return v2;
}

_DWORD *tailspin_config_create_with_default_config()
{
  v0 = malloc_type_calloc(1uLL, 0x2118uLL, 0x10000409BDBFF31uLL);
  if (!v0) {
    sub_1C86F45C0();
  }
  v1 = v0;
  *(void *)v0 = 0;
  v0[2] = 0;
  *((unsigned char *)v0 + 8360) = tailspin_enabled_get_default();
  *((void *)v1 + 1030) = tailspin_buffer_size_get_default();
  v2 = tailspin_kdbg_filter_get_default();
  memcpy(v1 + 3, v2, 0x2000uLL);
  *((void *)v1 + 1035) = tailspin_full_sampling_period_get_default();
  *((void *)v1 + 1040) = tailspin_oncore_sampling_period_get_default();
  v1[2099] = tailspin_sampling_options_get_default();
  return v1;
}

void sub_1C86D8F2C()
{
  v0 = (void *)MEMORY[0x1C87CBD00]();
  v1 = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (v1)
  {
    v2 = v1;
    v3 = (uint64_t (*)(__CFString *, void))dlsym(v1, "MGCopyAnswer");
    if (!v3)
    {
LABEL_15:
      dlclose(v2);
      goto LABEL_16;
    }
    v4 = v3;
    v5 = (void *)v3(@"ProductType", 0);
    v6 = v5;
    if (v5
      && (([v5 containsString:@"iPhone"] & 1) != 0
       || ([v6 containsString:@"iPad"] & 1) != 0
       || ([v6 containsString:@"iPod"] & 1) != 0
       || ([v6 containsString:@"Watch"] & 1) != 0
       || ([v6 containsString:@"AppleTV"] & 1) != 0))
    {
      v7 = &byte_1EB59C8F1;
    }
    else
    {
      if ((byte_1EB59C8F1 & 1) != 0 || !v4(@"IsComputeNode", 0)) {
        goto LABEL_14;
      }
      byte_1EB59C8F1 = 1;
      v7 = &byte_1EA52E320;
    }
    char *v7 = 1;
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
}

uint64_t tailspin_enabled_get_default()
{
  if (qword_1EB59C920 != -1) {
    dispatch_once(&qword_1EB59C920, &unk_1F2318A80);
  }
  return byte_1EB59C928;
}

id tailspin_compress_file()
{
  v0 = (void *)MEMORY[0x1F4188790]();
  int v2 = v1;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = v0;
  id v4 = [v3 stringByAppendingString:@".tgz"];
  v5 = (const char *)[v4 UTF8String];
  int v6 = open(v5, 2562, 432);
  if (v6 < 0)
  {
    int v10 = *__error();
    v11 = sub_1C86DE154();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1C86F3E9C();
    }

    *__error() = v10;
LABEL_20:
    if (v6 != -1) {
      close(v6);
    }
LABEL_22:
    if (unlink(v5) && *__error() != 2)
    {
      int v13 = *__error();
      v14 = sub_1C86DE154();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1C86F3E20();
      }

      id v12 = 0;
      *__error() = v13;
    }
    else
    {
      id v12 = 0;
    }
    goto LABEL_28;
  }
  uint64_t v7 = archive_write_new();
  if (archive_write_add_filter_gzip())
  {
    int v8 = *__error();
    v9 = sub_1C86DE154();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1C86F44CC();
    }
LABEL_17:

    *__error() = v8;
LABEL_18:
    if (v7)
    {
      archive_write_close();
      archive_write_free();
    }
    goto LABEL_20;
  }
  if (archive_write_set_options())
  {
    int v8 = *__error();
    v9 = sub_1C86DE154();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4448();
    }
    goto LABEL_17;
  }
  if (archive_write_set_format_pax())
  {
    int v8 = *__error();
    v9 = sub_1C86DE154();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1C86F43C4();
    }
    goto LABEL_17;
  }
  if (archive_write_open_fd())
  {
    int v8 = *__error();
    v9 = sub_1C86DE154();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4340();
    }
    goto LABEL_17;
  }
  uint64_t v16 = archive_entry_new();
  memset(&v43, 0, sizeof(v43));
  id v17 = v3;
  if (stat((const char *)[v17 UTF8String], &v43))
  {
    int v18 = *__error();
    v19 = sub_1C86DE154();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1C86F42C4();
    }
LABEL_37:

    *__error() = v18;
LABEL_38:
    if (v16) {
      archive_entry_free();
    }
    goto LABEL_18;
  }
  archive_entry_copy_stat();
  id v20 = [v17 lastPathComponent];
  [v20 UTF8String];
  archive_entry_set_pathname();

  archive_entry_set_filetype();
  archive_entry_set_perm();
  if (archive_write_header())
  {
    int v18 = *__error();
    v19 = sub_1C86DE154();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4240();
    }
    goto LABEL_37;
  }
  id v21 = v17;
  int v22 = open((const char *)[v21 UTF8String], 0);
  if (v22 < 0)
  {
    int v27 = *__error();
    v28 = sub_1C86DE154();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1C86F3F18();
    }
    goto LABEL_48;
  }
  id v40 = v21;
  while (1)
  {
    ssize_t v23 = read(v22, v44, 0x2800uLL);
    ssize_t v24 = v23;
    if (v23 < 1) {
      break;
    }
    uint64_t v25 = archive_write_data();
    if (v25 != v24)
    {
      uint64_t v26 = v25;
      int v27 = *__error();
      v28 = sub_1C86DE154();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1C86F3F94(v7, v26, v28);
      }
      goto LABEL_48;
    }
  }
  if (v23 < 0 && *__error() != 4)
  {
    int v27 = *__error();
    v28 = sub_1C86DE154();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1C86F41C4();
    }
LABEL_48:

    *__error() = v27;
    if (v22 != -1) {
      close(v22);
    }
    goto LABEL_38;
  }
  archive_entry_free();
  close(v22);
  if (archive_write_close())
  {
    int v8 = *__error();
    v9 = sub_1C86DE154();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4140();
    }
    goto LABEL_17;
  }
  int v29 = archive_write_free();
  if (v29)
  {
    int v30 = v29;
    int v31 = *__error();
    v32 = sub_1C86DE154();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1C86F40C8(v30, v32);
    }

    *__error() = v31;
    goto LABEL_20;
  }
  close(v6);
  unsigned __int8 v42 = 0;
  v33 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v34 = [v33 fileExistsAtPath:v4 isDirectory:&v42];
  int v35 = v42;

  if (!v34 || v35) {
    goto LABEL_22;
  }
  int v36 = *__error();
  v37 = sub_1C86DE154();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C86D7000, v37, OS_LOG_TYPE_INFO, "Successfully compressed file", buf, 2u);
  }

  *__error() = v36;
  if (v2 && unlink((const char *)[v40 UTF8String]))
  {
    int v38 = *__error();
    v39 = sub_1C86DE154();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1C86F404C();
    }

    *__error() = v38;
  }
  id v12 = v4;
LABEL_28:

  return v12;
}

void sub_1C86D9778(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1C86D9798(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

uint64_t sub_1C86D97C8()
{
  return MEMORY[0x1F417E080](v0);
}

uint64_t tailspin_parse_stackshot_chunk(uint64_t *a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t result = 22;
  if (a1 && a2 >= 0x10)
  {
    *a3 = 0;
    *a4 = 0;
    int v6 = (char *)a1 + a2;
    uint64_t v9 = *a1;
    uint64_t v7 = a1 + 2;
    uint64_t v8 = v9;
    if ((char *)v7 + v9 <= v6)
    {
      uint64_t result = 0;
      *a3 = v7;
      *a4 = v8;
    }
  }
  return result;
}

size_t set_config_field_modifier(size_t result, const char *a2)
{
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  if (a2) {
    return strlcpy((char *)result, a2, 0x20uLL);
  }
  return result;
}

uint64_t get_responsible_pid_and_name(uint64_t a1, char *a2, uint32_t a3)
{
  if (!proc_name(a1, a2, a3)) {
    strlcpy(a2, "<unknown>", a3);
  }
  return a1;
}

char *get_tailspin_tasking_config()
{
  MEMORY[0x1F4188790]();
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (char *)tailspin_config_create_with_default_config();
  if (v0)
  {
    uint64_t v1 = v0;
    int v2 = OSAGetDATaskingValue();
    if (v2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v1[8360] = [v2 BOOLValue];
        *(void *)v1 |= 0x80uLL;
      }
    }
    id v3 = OSAGetDATaskingValue();
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *((void *)v1 + 1030) = [v3 unsignedLongLongValue];
        *(void *)v1 |= 2uLL;
      }
    }
    id v4 = OSAGetDATaskingValue();
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v4;
        if ([v5 UTF8String])
        {
          [v5 UTF8String];
          if (!trace_parse_filter())
          {
            memcpy(v1 + 12, v24, 0x2000uLL);
            *(void *)v1 |= 1uLL;
          }
        }
      }
    }
    int v6 = OSAGetDATaskingValue();
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *((void *)v1 + 1040) = [v6 unsignedLongLongValue];
        *(void *)v1 |= 0x10uLL;
      }
    }
    uint64_t v7 = OSAGetDATaskingValue();
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *((void *)v1 + 1035) = [v7 unsignedLongLongValue];
        *(void *)v1 |= 8uLL;
      }
    }
    uint64_t v8 = OSAGetDATaskingValue();
    uint64_t v9 = OSAGetDATaskingValue();
    uint64_t v10 = OSAGetDATaskingValue();
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *((_DWORD *)v1 + 2099) = *((_DWORD *)v1 + 2099) & 0xFFFFFFFE | [v8 BOOLValue];
        *(void *)v1 |= 0x20uLL;
      }
    }
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v9 BOOLValue]) {
          int v11 = 2;
        }
        else {
          int v11 = 0;
        }
        *((_DWORD *)v1 + 2099) = *((_DWORD *)v1 + 2099) & 0xFFFFFFFD | v11;
        *(void *)v1 |= 0x20uLL;
      }
    }
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ([v10 BOOLValue]) {
        int v12 = 4;
      }
      else {
        int v12 = 0;
      }
      *((_DWORD *)v1 + 2099) = *((_DWORD *)v1 + 2099) & 0xFFFFFFFB | v12;
      *(void *)v1 |= 0x20uLL;
      *((_DWORD *)v1 + 2) = 1;
    }
    else
    {
      uint64_t v13 = *(void *)v1;
      *((_DWORD *)v1 + 2) = 1;
      if (!v13)
      {
        tailspin_config_free(v1);
        uint64_t v1 = 0;
      }
    }
  }
  else
  {
    int v14 = *__error();
    v15 = sub_1C86DE154();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4550(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    uint64_t v1 = 0;
    *__error() = v14;
  }
  return v1;
}

char *get_tailspin_profile_config()
{
  MEMORY[0x1F4188790]();
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/com.apple.tailspin.plist"];
  uint64_t v1 = v0;
  if (v0 && [v0 count])
  {
    int v2 = (char *)tailspin_config_create_with_default_config();
    if (v2)
    {
      id v3 = v2;
      id v4 = [v1 objectForKeyedSubscript:@"Enabled"];
      if (v4)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v3[8360] = [v4 BOOLValue];
          *(void *)v3 |= 0x80uLL;
        }
      }
      id v5 = [v1 objectForKeyedSubscript:@"KDebug"];
      int v6 = v5;
      if (v5)
      {
        uint64_t v7 = [v5 objectForKeyedSubscript:@"BufferSizeMegabytes"];
        if (v7)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *((void *)v3 + 1030) = [v7 unsignedLongLongValue];
            *(void *)v3 |= 2uLL;
          }
        }
        uint64_t v8 = [v6 objectForKeyedSubscript:@"FilterDescriptor"];
        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
            if ([v9 UTF8String])
            {
              [v9 UTF8String];
              if (!trace_parse_filter())
              {
                memcpy(v3 + 12, __src, 0x2000uLL);
                *(void *)v3 |= 1uLL;
              }
            }
          }
        }
      }
      uint64_t v10 = [v1 objectForKeyedSubscript:@"Sampling"];
      int v11 = v10;
      if (v10)
      {
        int v12 = [v10 objectForKeyedSubscript:@"OnCoreSamplingPeriodNanoseconds"];
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *((void *)v3 + 1040) = [v12 unsignedLongLongValue];
            *(void *)v3 |= 0x10uLL;
          }
        }
        uint64_t v13 = [v11 objectForKeyedSubscript:@"FullSystemSamplingPeriodNanoseconds"];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *((void *)v3 + 1035) = [v13 unsignedLongLongValue];
            *(void *)v3 |= 8uLL;
          }
        }
        int v14 = [v11 objectForKeyedSubscript:@"IsCswitchSamplingEnabled"];
        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *((_DWORD *)v3 + 2099) = *((_DWORD *)v3 + 2099) & 0xFFFFFFFE | [v14 BOOLValue];
            *(void *)v3 |= 0x20uLL;
          }
        }
        v15 = [v11 objectForKeyedSubscript:@"IsSyscallSamplingEnabled"];
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v15 BOOLValue]) {
              int v16 = 2;
            }
            else {
              int v16 = 0;
            }
            *((_DWORD *)v3 + 2099) = *((_DWORD *)v3 + 2099) & 0xFFFFFFFD | v16;
            *(void *)v3 |= 0x20uLL;
          }
        }
        uint64_t v17 = [v11 objectForKeyedSubscript:@"IsVMFaultSamplingEnabled"];
        if (v17)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v17 BOOLValue]) {
              int v18 = 4;
            }
            else {
              int v18 = 0;
            }
            *((_DWORD *)v3 + 2099) = *((_DWORD *)v3 + 2099) & 0xFFFFFFFB | v18;
            *(void *)v3 |= 0x20uLL;
          }
        }
      }
      *((_DWORD *)v3 + 2) = 3;
      if (!*(void *)v3)
      {
        tailspin_config_free(v3);
        id v3 = 0;
      }
    }
    else
    {
      int v20 = *__error();
      uint64_t v21 = sub_1C86DE154();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1C86F4588(v21, v22, v23, v24, v25, v26, v27, v28);
      }

      id v3 = 0;
      *__error() = v20;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id tailspin_make_ondisk_config(uint64_t *a1, char a2)
{
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v4) {
    sub_1C86F45C0();
  }
  id v5 = v4;
  if ((a2 & 1) != 0 || (*(unsigned char *)a1 & 0x80) != 0)
  {
    if (*((unsigned char *)a1 + 8360)) {
      uint64_t v6 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CC28];
    }
    [v4 setObject:v6 forKeyedSubscript:@"Enabled"];
    uint64_t v7 = [NSString stringWithUTF8String:(char *)a1 + 8361];
    [v5 setObject:v7 forKeyedSubscript:@"EnabledModifier"];
  }
  unsigned int v8 = *((_DWORD *)a1 + 2) - 1;
  if (v8 <= 2) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:off_1E656FE80[v8]];
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v9) {
    sub_1C86F45C0();
  }
  uint64_t v10 = (void *)v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = *a1;
    if ((*a1 & 2) == 0)
    {
LABEL_15:
      if ((v11 & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
  }
  int v12 = [NSNumber numberWithUnsignedLong:a1[1030]];
  [v10 setObject:v12 forKeyedSubscript:@"BufferSizeMegabytes"];

  uint64_t v13 = [NSString stringWithUTF8String:a1 + 1031];
  [v10 setObject:v13 forKeyedSubscript:@"BufferSizeModifier"];

  if ((a2 & 1) == 0)
  {
    uint64_t v11 = *a1;
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v14 = MEMORY[0x1C87CC170]((char *)a1 + 12);
  if (!v14) {
    sub_1C86F45C0();
  }
  v15 = (void *)v14;
  int v16 = [NSString stringWithUTF8String:v14];
  [v10 setObject:v16 forKeyedSubscript:@"FilterDescriptor"];

  uint64_t v17 = [NSString stringWithUTF8String:(char *)a1 + 8204];
  [v10 setObject:v17 forKeyedSubscript:@"FilterDescriptorModifier"];

  free(v15);
LABEL_18:
  if ([v10 count]) {
    [v5 setObject:v10 forKeyedSubscript:@"KDebug"];
  }
  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v18) {
    sub_1C86F45C0();
  }
  uint64_t v19 = (void *)v18;
  if ((a2 & 1) != 0 || (uint64_t v20 = *a1, (*a1 & 0x10) != 0))
  {
    uint64_t v21 = [NSNumber numberWithUnsignedLongLong:a1[1040]];
    [v19 setObject:v21 forKeyedSubscript:@"OnCoreSamplingPeriodNanoseconds"];

    uint64_t v22 = [NSString stringWithUTF8String:a1 + 1041];
    [v19 setObject:v22 forKeyedSubscript:@"OnCoreSamplingPeriodModifier"];

    if (a2) {
      goto LABEL_26;
    }
    uint64_t v20 = *a1;
  }
  if ((v20 & 8) == 0) {
    goto LABEL_28;
  }
LABEL_26:
  uint64_t v23 = [NSNumber numberWithUnsignedLongLong:a1[1035]];
  [v19 setObject:v23 forKeyedSubscript:@"FullSystemSamplingPeriodNanoseconds"];

  uint64_t v24 = [NSString stringWithUTF8String:a1 + 1036];
  [v19 setObject:v24 forKeyedSubscript:@"FullSystemSamplingPeriodModifier"];

  if ((a2 & 1) == 0)
  {
    uint64_t v20 = *a1;
LABEL_28:
    if ((v20 & 0x20) == 0) {
      goto LABEL_30;
    }
  }
  uint64_t v25 = [NSNumber numberWithInt:*((_DWORD *)a1 + 2099) & 1];
  [v19 setObject:v25 forKeyedSubscript:@"IsCswitchSamplingEnabled"];

  uint64_t v26 = [NSNumber numberWithInt:(*((_DWORD *)a1 + 2099) >> 1) & 1];
  [v19 setObject:v26 forKeyedSubscript:@"IsSyscallSamplingEnabled"];

  uint64_t v27 = [NSNumber numberWithInt:(*((_DWORD *)a1 + 2099) >> 2) & 1];
  [v19 setObject:v27 forKeyedSubscript:@"IsVMFaultSamplingEnabled"];

  uint64_t v28 = [NSString stringWithUTF8String:a1 + 1050];
  [v19 setObject:v28 forKeyedSubscript:@"CswitchSamplingEnabledModifier"];

LABEL_30:
  if ([v19 count]) {
    [v5 setObject:v19 forKeyedSubscript:@"Sampling"];
  }
  if ([v5 count]) {
    int v29 = v5;
  }
  else {
    int v29 = 0;
  }
  id v30 = v29;

  return v30;
}

void sub_1C86DA504(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1C86DA520()
{
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_1C86DA868;
  v24[4] = sub_1C86DA878;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1C86DA868;
  v22[4] = sub_1C86DA878;
  id v23 = 0;
  CFTypeRef cf = 0;
  CFMutableDictionaryRef v0 = IOServiceMatching("AGXAccelerator");
  uint64_t v1 = (const void *)IOReportCopyChannelsForDrivers();
  CFRelease(v0);
  if (v1)
  {
    if (IOReportGetChannelCount())
    {
      Subscription = (const void *)IOReportCreateSubscription();
      int v13 = *__error();
      uint64_t v14 = sub_1C86DE154();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1C86F46F0((uint64_t)&cf, v14, v15, v16, v17, v18, v19, v20);
      }

      *__error() = v13;
    }
    else
    {
      int v11 = *__error();
      int v12 = sub_1C86DE154();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1C86F464C();
      }

      Subscription = 0;
      *__error() = v11;
    }
    if (cf) {
      CFRelease(cf);
    }
    if (Subscription) {
      CFRelease(Subscription);
    }
    CFRelease(v1);
  }
  else
  {
    int v3 = *__error();
    id v4 = sub_1C86DE154();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1C86F45DC((uint64_t)&cf, v4, v5, v6, v7, v8, v9, v10);
    }

    *__error() = v3;
  }
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
}

void sub_1C86DA824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86DA868(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C86DA878(uint64_t a1)
{
}

uint64_t sub_1C86DA880(uint64_t a1)
{
  CFStringRef Group = (const __CFString *)IOReportChannelGetGroup();
  if (IOReportChannelGetFormat() == 1
    && CFEqual(Group, @"Internal Statistics"))
  {
    ChannelName = (const void *)IOReportChannelGetChannelName();
    if (CFEqual(ChannelName, @"GPU Restart Count"))
    {
      uint64_t v4 = [NSNumber numberWithLongLong:IOReportSimpleGetIntegerValue()];
      uint64_t v5 = *(void *)(a1 + 32);
LABEL_7:
      uint64_t v6 = *(void *)(v5 + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v4;

      goto LABEL_8;
    }
    if (CFEqual(ChannelName, @"Last GPU Restart"))
    {
      uint64_t v4 = [NSNumber numberWithUnsignedLongLong:IOReportSimpleGetIntegerValue()];
      uint64_t v5 = *(void *)(a1 + 40);
      goto LABEL_7;
    }
  }
LABEL_8:
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    return 273;
  }
  else
  {
    return 0;
  }
}

uint64_t tailspin_write_metadata_chunk(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = MEMORY[0x1C87CBD00]();
  size_t v174 = 0;
  if (!a1) {
    sub_1C86F45C0();
  }
  context = (void *)v8;
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v10 = 0x1E4F29000uLL;
  if (a2)
  {
    int v11 = [NSString stringWithUTF8String:a2];
    [v9 setObject:v11 forKeyedSubscript:@"TailspinDumpReason"];
  }
  unint64_t v12 = 0x1E4F28000uLL;
  if ((a4 & 0x80000000) == 0)
  {
    int v13 = [NSNumber numberWithInt:a4];
    [v9 setObject:v13 forKeyedSubscript:@"TailspinTargetPID"];
  }
  uint64_t v14 = [NSNumber numberWithInt:sysconf(57)];
  [v9 setObject:v14 forKeyedSubscript:@"ncpus"];

  CFDictionaryRef v15 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v15)
  {
    CFDictionaryRef v16 = v15;
    [v9 setObject:CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E4F1CD10]) forKeyedSubscript:@"osversion"];
    [v9 setObject:CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E4F1CD18]) forKeyedSubscript:@"osproductname"];
    [v9 setObject:CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E4F1CD30]) forKeyedSubscript:@"osproductversion"];
    [v9 setObject:CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E4F1CD28]) forKeyedSubscript:@"osproductversionextra"];
    CFRelease(v16);
  }
  bzero(v184, 0x400uLL);
  size_t v174 = 1024;
  sysctlbyname("hw.model", v184, &v174, 0, 0);
  uint64_t v17 = [NSString stringWithUTF8String:v184];
  [v9 setObject:v17 forKeyedSubscript:@"hw.model"];

  unsigned int v173 = 0;
  size_t v172 = 4;
  if (!sysctlbyname("vm.pagesize", &v173, &v172, 0, 0))
  {
    uint64_t v18 = [NSNumber numberWithInt:v173];
    [v9 setObject:v18 forKeyedSubscript:@"vm.pagesize"];
  }
  unsigned int v171 = 0;
  size_t v170 = 4;
  if (!sysctlbyname("hw.pagesize", &v171, &v170, 0, 0))
  {
    uint64_t v19 = [NSNumber numberWithInt:v171];
    [v9 setObject:v19 forKeyedSubscript:@"hw.pagesize"];
  }
  unsigned int v169 = 0;
  size_t v168 = 4;
  if (!sysctlbyname("hw.memsize", &v169, &v168, 0, 0))
  {
    uint64_t v20 = [NSNumber numberWithInt:v169];
    [v9 setObject:v20 forKeyedSubscript:@"hw.memsize"];
  }
  mach_port_t v21 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v22 = IOServiceMatching("AGXAccelerator");
  io_service_t MatchingService = IOServiceGetMatchingService(v21, v22);
  if (MatchingService)
  {
    io_object_t v24 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"AGXTraceCodeVersion", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    IOObjectRelease(v24);
    if (CFProperty)
    {
      [v9 setObject:CFProperty forKeyedSubscript:@"AGXVersion"];
    }
  }
  [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsKPerfPETMode"];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v163 = v9;
  CFDictionaryRef AdvisoryDetailed = IOCopySystemLoadAdvisoryDetailed();
  v162 = v26;
  if (AdvisoryDetailed)
  {
    uint64_t v27 = [(__CFDictionary *)AdvisoryDetailed objectForKeyedSubscript:@"UserLevel"];
    uint64_t v28 = [(__CFDictionary *)AdvisoryDetailed objectForKeyedSubscript:@"BatteryLevel"];
    int v29 = [(__CFDictionary *)AdvisoryDetailed objectForKeyedSubscript:@"CombinedLevel"];
    if (v27)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = (void *)[v27 copy];
        [v162 setObject:v30 forKeyedSubscript:@"User"];

        uint64_t v9 = v163;
      }
    }
    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v31 = (void *)[v28 copy];
        [v162 setObject:v31 forKeyedSubscript:@"Battery"];

        uint64_t v9 = v163;
      }
    }
    if (v29)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = (void *)[v29 copy];
        [v162 setObject:v32 forKeyedSubscript:@"Combined"];

        uint64_t v9 = v163;
      }
    }

    id v26 = v162;
  }
  out_token[0] = 0;
  if (!notify_register_check((const char *)*MEMORY[0x1E4F14918], out_token))
  {
    *(void *)&state64.f_bsize = 0;
    uint32_t state = notify_get_state(out_token[0], (uint64_t *)&state64.f_bsize);
    uint64_t v34 = *(void *)&state64.f_bsize;
    notify_cancel(out_token[0]);
    if (!state)
    {
      int v35 = [NSNumber numberWithUnsignedInt:v34];
      [v26 setObject:v35 forKeyedSubscript:@"ThermalPressure"];
    }
  }
  if ([v26 count]) {
    [v9 setObject:v26 forKeyedSubscript:@"SystemAdvisoryLevels"];
  }
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:@"TailspinConfiguration"];
  }
  uint64_t v36 = NSHomeDirectoryForUser(&cfstr_Mobile.isa);
  if (v36)
  {
    v37 = (void *)v36;
    int v38 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v36 isDirectory:1];

    if (v38)
    {
      memset(&state64, 0, 512);
      id v39 = v38;
      if (!statfs((const char *)[v39 fileSystemRepresentation], &state64))
      {
        uint64_t v40 = state64.f_blocks * state64.f_bsize;
        uint64_t v41 = state64.f_bavail * state64.f_bsize;
        unsigned __int8 v42 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
        stat v43 = [NSNumber numberWithUnsignedLongLong:v40];
        [v42 setObject:v43 forKeyedSubscript:@"VolumeTotal"];

        uint64_t v44 = v41;
        uint64_t v9 = v163;
        uint64_t v45 = [NSNumber numberWithUnsignedLongLong:v44];
        [v42 setObject:v45 forKeyedSubscript:@"VolumeAvailable"];

        memset(buf, 0, sizeof(buf));
        out_token[3] = 0;
        *(void *)&long long v179 = 0;
        *(void *)out_token = 5;
        out_token[2] = 32;
        id v46 = v39;
        if (!getattrlist((const char *)[v46 fileSystemRepresentation], out_token, buf, 0xCuLL, 1u))
        {
          id v182 = 0;
          if (!fsctl((const char *)[v46 fileSystemRepresentation], 0x4004681BuLL, &v182, 0))
          {
            v47 = [NSNumber numberWithUnsignedLongLong:*(void *)&buf[4] * (void)v182];
            [v42 setObject:v47 forKeyedSubscript:@"VolumeLowSpaceThreshold"];
          }
        }
        [v163 setObject:v42 forKeyedSubscript:@"HomeVolumeSpace"];
      }
    }
  }
  id v165 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CFStringRef v160 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPropertyListRef v48 = CFPreferencesCopyValue(@"KeyboardsCurrentAndNext", @"com.apple.keyboard.preferences", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  v158 = (void *)v48;
  if (v48 && (v49 = (void *)v48, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v156 = v7;
    long long v180 = 0u;
    long long v181 = 0u;
    *(_OWORD *)out_token = 0u;
    long long v179 = 0u;
    id v50 = v49;
    uint64_t v51 = [v50 countByEnumeratingWithState:out_token objects:&state64 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v179;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v179 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = *(void **)(*(void *)&out_token[2] + 8 * i);
          if (v55 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            unint64_t v56 = v10;
            v57 = [v55 stringByReplacingOccurrencesOfString:@"@sw=" withString:@" "];
            v58 = [v57 stringByReplacingOccurrencesOfString:@"@hw=" withString:@" "];

            v59 = [v58 stringByReplacingOccurrencesOfString:@"hw=" withString:&stru_1F2319A00];;

            v60 = [v59 stringByReplacingOccurrencesOfString:@"sw=" withString:&stru_1F2319A00];;

            v61 = [v60 stringByReplacingOccurrencesOfString:@"Automatic" withString:&stru_1F2319A00];

            int v62 = *__error();
            v63 = sub_1C86DE154();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v55;
              __int16 v186 = 2112;
              v187 = v61;
              _os_log_debug_impl(&dword_1C86D7000, v63, OS_LOG_TYPE_DEBUG, "keyboard %@ -> %@", buf, 0x16u);
            }

            *__error() = v62;
            if (([v165 containsObject:v61] & 1) == 0) {
              [v165 addObject:v61];
            }

            unint64_t v10 = v56;
          }
          else
          {
            int v64 = *__error();
            v65 = sub_1C86DE154();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              sub_1C86F4CD4(&v175, v176, v65);
            }

            *__error() = v64;
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:out_token objects:&state64 count:16];
      }
      while (v52);
    }

    uint64_t v66 = [v165 copy];
    id v7 = v156;
    uint64_t v9 = v163;
    unint64_t v12 = 0x1E4F28000;
  }
  else
  {
    int v67 = *__error();
    v68 = sub_1C86DE154();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4CA0();
    }

    uint64_t v66 = 0;
    *__error() = v67;
  }

  if (v66) {
    [v9 setObject:v66 forKeyedSubscript:@"KeyboardLanguages"];
  }
  v166 = (void *)v66;
  v69 = sub_1C86DD4A0();
  v70 = v69;
  if (!v69 || ![v69 count])
  {
    int v74 = *__error();
    v75 = sub_1C86DE154();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4BF8();
    }

    *__error() = v74;
    goto LABEL_80;
  }
  int v71 = *__error();
  v72 = sub_1C86DE154();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
    sub_1C86F4C2C();
  }

  *__error() = v71;
  if ((unint64_t)[v70 count] < 2)
  {
    v76 = (void *)MEMORY[0x1E4F1C978];
    v77 = [v70 firstObject];
    uint64_t v73 = [v76 arrayWithObject:v77];
  }
  else
  {
    uint64_t v73 = [v70 subarrayWithRange:0, 2];
  }

  if (v73)
  {
    [v9 setObject:v73 forKeyedSubscript:@"PreferredLanguages"];
    v70 = (void *)v73;
LABEL_80:
  }
  v78 = sub_1C86DD4A0();
  v79 = (void *)MEMORY[0x1E4F1CA20];
  v80 = [v78 firstObject];
  v81 = [v79 localeWithLocaleIdentifier:v80];
  v82 = [v81 objectForKey:*MEMORY[0x1E4F1C400]];

  int v83 = *__error();
  v84 = sub_1C86DE154();
  BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG);
  if (v82)
  {
    if (v85) {
      sub_1C86F4B84();
    }

    *__error() = v83;
    id v86 = v82;

    [v9 setObject:v86 forKeyedSubscript:@"CountryCode"];
  }
  else
  {
    if (v85) {
      sub_1C86F4B50();
    }

    *__error() = v83;
  }
  uint64_t v177 = 0;
  *(void *)out_token = 0;
  *(void *)buf = 0;
  id v182 = 0;
  *(void *)&state64.f_bsize = 8;
  CFStringRef v87 = v160;
  if (sysctlbyname("kern.num_vnodes", out_token, (size_t *)&state64.f_bsize, 0, 0))
  {
    int v88 = *__error();
    v89 = sub_1C86DE154();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4AD4();
    }
LABEL_100:

    *__error() = v88;
    goto LABEL_101;
  }
  *(void *)&state64.f_bsize = 8;
  if (sysctlbyname("kern.free_vnodes", buf, (size_t *)&state64.f_bsize, 0, 0))
  {
    int v88 = *__error();
    v89 = sub_1C86DE154();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4A58();
    }
    goto LABEL_100;
  }
  *(void *)&state64.f_bsize = 8;
  if (sysctlbyname("kern.maxvnodes", &v182, (size_t *)&state64.f_bsize, 0, 0))
  {
    int v88 = *__error();
    v89 = sub_1C86DE154();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
      sub_1C86F49DC();
    }
    goto LABEL_100;
  }
  *(void *)&state64.f_bsize = 8;
  if (sysctlbyname("vfs.vnstats.vn_dealloc_level", &v177, (size_t *)&state64.f_bsize, 0, 0))
  {
    int v88 = *__error();
    v89 = sub_1C86DE154();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4960();
    }
    goto LABEL_100;
  }
  id v150 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v151 = [*(id *)(v12 + 3792) numberWithUnsignedLongLong:*(void *)out_token];
  v152 = [*(id *)(v12 + 3792) numberWithUnsignedLongLong:*(void *)buf];
  v153 = [*(id *)(v12 + 3792) numberWithUnsignedLongLong:v182];
  v154 = [NSNumber numberWithUnsignedLongLong:v177];
  unint64_t v12 = 0x1E4F28000;
  v155 = [v150 initWithObjectsAndKeys:v151, @"NumVnodesAllocated", v152, @"NumVnodesFree", v153, @"NumVnodesMax", v154, @"VnodeDeallocLevel", 0];

  uint64_t v9 = v163;
  CFStringRef v87 = v160;

  if (v155)
  {
    [v163 setObject:v155 forKeyedSubscript:@"VnodeInfo"];
  }
LABEL_101:
  CFBooleanRef v90 = (const __CFBoolean *)CFPreferencesCopyValue(@"HardwareKeyboardLastSeen", @"com.apple.keyboard.preferences", @"mobile", v87);
  BOOL v93 = 0;
  if (v90)
  {
    CFBooleanRef v91 = v90;
    int Value = CFBooleanGetValue(v90);
    CFRelease(v91);
    if (Value) {
      BOOL v93 = 1;
    }
  }
  v94 = [*(id *)(v12 + 3792) numberWithBool:v93];
  [v9 setObject:v94 forKeyedSubscript:@"HardwareKeyboard"];

  v164 = v82;
  if (qword_1EA52E300 != -1) {
    dispatch_once(&qword_1EA52E300, &unk_1F2318940);
  }
  id v95 = (id)qword_1EA52E308;
  if (v95) {
    [v9 setObject:v95 forKeyedSubscript:@"NonDefaultFeatureFlags"];
  }
  uint64_t v96 = is_apple_internal_setting();
  v97 = [*(id *)(v12 + 3792) numberWithBool:v96];
  [v9 setObject:v97 forKeyedSubscript:@"IsAppleInternal"];

  if (v96)
  {
    v98 = [MEMORY[0x1E4F83948] automatedDeviceGroup];
    if ([v98 length])
    {
      id v99 = v98;
      uint64_t v100 = 0;
    }
    else
    {
      v101 = (void *)CFPreferencesCopyValue(@"ExperimentGroup", @"com.apple.da", @"mobile", v87);
      v102 = [v101 lowercaseString];

      if ([v102 containsString:@"carry"]) {
        uint64_t v100 = 1;
      }
      else {
        uint64_t v100 = [v102 containsString:@"walkabout"];
      }

      id v99 = 0;
    }

    id v103 = v99;
    v104 = [*(id *)(v12 + 3792) numberWithBool:v100];
    [v9 setObject:v104 forKeyedSubscript:@"IsInternalCarryDevice"];

    if (v103) {
      [v9 setObject:v103 forKeyedSubscript:@"AutomatedDeviceGroup"];
    }
  }
  if (objc_opt_class())
  {
    id v105 = objc_alloc_init(MEMORY[0x1E4F5E7B8]);
    *(void *)buf = 0;
    int v106 = [v105 openAndReturnError:buf];
    id v107 = *(id *)buf;
    v108 = v107;
    if (v106)
    {
      id v182 = v107;
      v109 = [v105 allInstalledRootsAndReturnError:&v182];
      id v110 = v182;

      id v111 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      if (v109)
      {
        id v157 = v7;
        long long v180 = 0u;
        long long v181 = 0u;
        *(_OWORD *)out_token = 0u;
        long long v179 = 0u;
        id v112 = v109;
        uint64_t v113 = [v112 countByEnumeratingWithState:out_token objects:&state64 count:16];
        if (v113)
        {
          uint64_t v114 = v113;
          uint64_t v115 = *(void *)v179;
          do
          {
            for (uint64_t j = 0; j != v114; ++j)
            {
              if (*(void *)v179 != v115) {
                objc_enumerationMutation(v112);
              }
              v117 = [*(id *)(*(void *)&out_token[2] + 8 * j) name];
              [v111 addObject:v117];
            }
            uint64_t v114 = [v112 countByEnumeratingWithState:out_token objects:&state64 count:16];
          }
          while (v114);
        }

        id v7 = v157;
      }
      id v118 = (id)[v105 closeAndReturnError:0];
      v119 = [v111 array];

      v108 = v110;
    }
    else
    {
      int v120 = *__error();
      v121 = sub_1C86DE154();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
        sub_1C86F48F8();
      }

      v119 = 0;
      *__error() = v120;
    }

    uint64_t v9 = v163;
  }
  else
  {
    v119 = 0;
  }
  if ([v119 count])
  {
    [v9 setObject:v119 forKeyedSubscript:@"InstalledRootNames"];
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsRootInstalled"];
  }
  else
  {
    *(void *)out_token = 0;
    *(void *)buf = 8;
    int v122 = sysctlbyname("kern.roots_installed", out_token, (size_t *)buf, 0, 0);
    int v123 = *__error();
    v124 = sub_1C86DE154();
    v125 = v124;
    if (v122)
    {
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
        sub_1C86F487C();
      }

      *__error() = v123;
    }
    else
    {
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        state64.f_bsize = 134217984;
        *(void *)&state64.f_iosize = *(void *)out_token;
        _os_log_impl(&dword_1C86D7000, v125, OS_LOG_TYPE_DEFAULT, "Installed root info kern.roots_installed: %llu", (uint8_t *)&state64, 0xCu);
      }

      *__error() = v123;
      v126 = [NSNumber numberWithBool:*(void *)out_token != 0];
      [v9 setObject:v126 forKeyedSubscript:@"IsRootInstalled"];
    }
  }
  v127 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  v128 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.powerd.lowpowermode.state"];
  v129 = [v128 objectForKey:@"state"];

  if (v129) {
    uint64_t v130 = [v128 BOOLForKey:@"state"];
  }
  else {
    uint64_t v130 = 0;
  }
  v131 = [NSNumber numberWithBool:v130];
  [v127 setObject:v131 forKeyedSubscript:@"LowPowerMode"];

  v132 = [v128 objectForKey:@"stateChangeDate"];
  if (v132)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v133 = NSNumber;
      [v132 timeIntervalSinceReferenceDate];
      v134 = [v133 numberWithDouble:x0];
      [v127 setObject:v134 forKeyedSubscript:@"PowerModeTransitionTimestamp"];

      uint64_t v9 = v163;
    }
  }

  if (v127) {
    [v9 setObject:v127 forKeyedSubscript:@"MostRecentLowPowerModeTransition"];
  }
  if (qword_1EA52E2F8 != -1) {
    dispatch_once(&qword_1EA52E2F8, &unk_1F2318980);
  }
  if (qword_1EA52E2F0)
  {
    v135 = [NSNumber numberWithInteger:];
    [v9 setObject:v135 forKeyedSubscript:@"OSCryptexFileExtents"];
  }
  v167[1] = 0;
  v167[2] = 0;
  sub_1C86DA520();
  id v136 = 0;
  id v137 = 0;
  if (v136) {
    [v163 setObject:v136 forKeyedSubscript:@"GPURestartCount"];
  }
  if (v137) {
    [v163 setObject:v137 forKeyedSubscript:@"GPURestartLastMachAbs"];
  }
  *(void *)&state64.f_bsize = 0;
  if (kpersona_find_by_type() == -1)
  {
    int v138 = *__error();
    v139 = sub_1C86DE154();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4848();
    }

    *__error() = v138;
  }
  v140 = [NSNumber numberWithBool:*(void *)&state64.f_bsize != 0];
  [v163 setObject:v140 forKeyedSubscript:@"HasEnterprisePersona"];

  v167[0] = 0;
  v141 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v163 format:200 options:0 error:v167];
  id v142 = v167[0];
  if (v141)
  {
    id v143 = v141;
    [v143 bytes];
    [v143 length];
    uint64_t v144 = 0;
    if (!ktrace_file_append_chunk())
    {
      int v145 = *__error();
      v146 = sub_1C86DE154();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
        sub_1C86F47C8();
      }

      *__error() = v145;
      uint64_t v144 = *__error();
    }
  }
  else
  {
    int v147 = *__error();
    v148 = sub_1C86DE154();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR)) {
      sub_1C86F4760();
    }

    *__error() = v147;
    uint64_t v144 = 22;
  }

  return v144;
}

void sub_1C86DC20C()
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFMutableDictionaryRef v0 = [MEMORY[0x1E4F73A28] sharedDataAccessor];
  id v18 = 0;
  uint64_t v1 = (void *)[v0 copyPathForPersonalizedData:11 error:&v18];
  id v2 = v18;

  if (!v1)
  {
    int v10 = *__error();
    int v11 = sub_1C86DE154();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22.st_dev = 138412290;
      *(void *)&v22.st_mode = v2;
      _os_log_impl(&dword_1C86D7000, v11, OS_LOG_TYPE_DEFAULT, "Unable to get path for MSUDA_CRYPTEX1_OS_CRYPTEX with error: (%@)", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_30;
  }
  int v3 = (const char *)[v1 UTF8String];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    if (*v3)
    {
      int v5 = open(v3, 0, 0);
      if (v5 < 0)
      {
        int v12 = *__error();
        int v13 = sub_1C86DE154();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1C86F4DA0();
        }

        int v9 = 0;
        *__error() = v12;
      }
      else
      {
        int v6 = v5;
        memset(&v22, 0, sizeof(v22));
        if (fstat(v5, &v22))
        {
          int v7 = *__error();
          uint64_t v8 = sub_1C86DE154();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            sub_1C86F4F94();
          }
        }
        else
        {
          off_t st_size = v22.st_size;
          if (v22.st_size)
          {
            uint64_t v15 = 0;
            int v9 = 0;
            int v19 = 0;
            while (1)
            {
              off_t v20 = st_size;
              uint64_t v21 = v15;
              if (fcntl(v6, 65, &v19)) {
                break;
              }
              if (!v20)
              {
                int v16 = *__error();
                uint64_t v17 = sub_1C86DE154();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                  sub_1C86F4E88();
                }
                goto LABEL_26;
              }
              v15 += v20;
              ++v9;
              st_size -= v20;
              if (!st_size) {
                goto LABEL_27;
              }
            }
            int v16 = *__error();
            uint64_t v17 = sub_1C86DE154();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_1C86F4EFC();
            }
LABEL_26:

            *__error() = v16;
LABEL_27:
            close(v6);
            goto LABEL_28;
          }
          int v7 = *__error();
          uint64_t v8 = sub_1C86DE154();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            sub_1C86F4E20();
          }
        }

        *__error() = v7;
        close(v6);
        int v9 = 0;
      }
LABEL_28:
      qword_1EA52E2F0 = v9;
      int v10 = *__error();
      int v11 = sub_1C86DE154();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1C86F4D14(v4, v11);
      }
LABEL_30:

      *__error() = v10;
    }
  }
}

uint64_t tailspin_write_symbolless_binary_info_chunk(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F1CA60] dictionary];
    if (!v3) {
      sub_1C86F45C0();
    }
    uint64_t v4 = v3;
    add_binary_info_to_binary_dictionary(v3, v2);
    id v14 = 0;
    int v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v14];
    id v6 = v14;
    if (v5)
    {
      id v7 = v5;
      [v7 bytes];
      [v7 length];
      uint64_t v8 = 0;
      if (!ktrace_file_append_chunk())
      {
        int v9 = *__error();
        int v10 = sub_1C86DE154();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1C86F507C();
        }

        *__error() = v9;
        uint64_t v8 = *__error();
      }
    }
    else
    {
      int v11 = *__error();
      int v12 = sub_1C86DE154();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1C86F5014();
      }

      *__error() = v11;
      uint64_t v8 = 22;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t tailspin_write_os_signpost_support_chunks(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, int a7)
{
  id v10 = a3;
  id v11 = a4;
  if (!a2)
  {
    int v12 = [MEMORY[0x1E4F730C0] localStore];
    goto LABEL_6;
  }
  int v12 = [NSString stringWithUTF8String:a2];
  if (!v12)
  {
    int v21 = *__error();
    stat v22 = sub_1C86DE154();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1C86F50FC();
    }
    uint64_t appended = 22;
    goto LABEL_16;
  }
  int v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = [v13 fileExistsAtPath:v12];

  if ((v14 & 1) == 0)
  {
    int v21 = *__error();
    stat v22 = sub_1C86DE154();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1C86F5130();
    }
    uint64_t appended = 2;
LABEL_16:

    *__error() = v21;
    goto LABEL_17;
  }
  uint64_t v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
  uint64_t v16 = [MEMORY[0x1E4F730C0] storeWithArchiveURL:v15];

  int v12 = (void *)v16;
LABEL_6:
  if (a7)
  {
    uint64_t v17 = SignpostSupportAllowlistedStringSetForCurrentDevice();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1C86DC910;
    v24[3] = &unk_1E656FEE8;
    id v25 = v17;
    id v18 = v17;
    int v19 = (void *)MEMORY[0x1C87CBE90](v24);
  }
  else
  {
    int v19 = 0;
  }
  uint64_t appended = ktrace_file_append_log_content_from_store();

LABEL_17:
  return appended;
}

id sub_1C86DC910(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 decomposedMessage];
  int v5 = 0;
  if ([v4 placeholderCount])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v4 argumentAtIndex:v6];
      if ([v7 category] == 3
        || [v7 category] == 2
        && ([v7 objectRepresentation], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
        && (int v9 = (void *)v8,
            char v10 = [*(id *)(a1 + 32) containsObject:v8],
            v9,
            (v10 & 1) == 0))
      {
        if (v5)
        {
          [v5 addIndex:v6];
        }
        else
        {
          int v5 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v6];
        }
      }

      ++v6;
    }
    while (v6 < [v4 placeholderCount]);
  }

  return v5;
}

void tailspin_symbolicate_file_async(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v6 = a4;
  id v7 = a5;
  sub_1C86E9758();
}

uint64_t sub_1C86DD004(uint64_t a1)
{
  sub_1C86E986C(*(void *)(a1 + 40));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t sub_1C86DD04C(uint64_t a1)
{
  if (ktrace_chunk_size() == -1) {
    sub_1C86F45C0();
  }
  unint64_t v2 = ktrace_chunk_size();
  uint64_t result = ktrace_chunk_map_data();
  if (result)
  {
    uint64_t v4 = (uint64_t *)result;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    if (ktrace_chunk_tag() == 36864)
    {
      tailspin_parse_stackshot_chunk(v4, v2, &v8, &v7);
      unint64_t v6 = v7;
      uint64_t v5 = (uint64_t)v8;
      if (!v8) {
        return ktrace_chunk_unmap_data();
      }
    }
    else
    {
      unint64_t v7 = v2;
      uint64_t v8 = v4;
      unint64_t v6 = v2;
      uint64_t v5 = (uint64_t)v4;
    }
    if (v6) {
      sub_1C86E9918(*(void *)(a1 + 32), v5, v6);
    }
    return ktrace_chunk_unmap_data();
  }
  return result;
}

uint64_t sub_1C86DD118(uint64_t a1)
{
  if (ktrace_chunk_size() == -1) {
    sub_1C86F45C0();
  }
  unint64_t v2 = ktrace_chunk_size();
  uint64_t result = ktrace_chunk_map_data();
  if (result)
  {
    uint64_t v4 = (_OWORD *)result;
    uint64_t v5 = *(void *)(a1 + 32);
    if (ktrace_chunk_is_64_bit()) {
      int v6 = 64;
    }
    else {
      int v6 = 32;
    }
    sub_1C86EADD8(v5, v4, v2, v6);
    return ktrace_chunk_unmap_data();
  }
  return result;
}

uint64_t sub_1C86DD1D4(uint64_t a1)
{
  if (ktrace_chunk_size() == -1) {
    sub_1C86F45C0();
  }
  uint64_t v2 = ktrace_chunk_size();
  uint64_t result = ktrace_chunk_map_data();
  if (result)
  {
    sub_1C86EA87C(*(void *)(a1 + 32), result, v2);
    return ktrace_chunk_unmap_data();
  }
  return result;
}

void sub_1C86DD274(uint64_t a1)
{
  id v2 = (id)ktrace_chunk_copy_plist();
  sub_1C86EB4C4(*(void *)(a1 + 32), v2);
}

void sub_1C86DD2C8(uint64_t a1)
{
  id v2 = (id)ktrace_chunk_copy_plist();
  sub_1C86EB864(*(void *)(a1 + 32), v2);
}

void *sub_1C86DD31C(void *result, uint64_t *a2)
{
  if ((*(unsigned char *)a2 & 0xC0) != 0) {
    return sub_1C86EB188(result[4], a2);
  }
  return result;
}

double sub_1C86DD334(uint64_t a1, unint64_t a2, char *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  int pid_for_thread = ktrace_get_pid_for_thread();

  return sub_1C86EB370(v5, a2, a3, pid_for_thread);
}

uint64_t sub_1C86DD388(uint64_t a1)
{
  int v2 = *__error();
  id v3 = sub_1C86DE154();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1C86F5254();
  }

  *__error() = v2;
  return sub_1C86E98F4(*(void *)(a1 + 32));
}

uint64_t sub_1C86DD3F0(uint64_t a1)
{
  sub_1C86EBB70(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(void *)(a1 + 48));
  sub_1C86E986C(*(void *)(a1 + 40));
  ktrace_session_destroy();
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t sub_1C86DD458(uint64_t a1)
{
  sub_1C86E986C(*(void *)(a1 + 40));
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

id sub_1C86DD4A0()
{
  CFMutableDictionaryRef v0 = (void *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v1 = v0;
      if (![v1 count])
      {
LABEL_7:

        goto LABEL_12;
      }
      uint64_t v2 = 0;
      char v3 = 1;
      while (1)
      {
        uint64_t v4 = [v1 objectAtIndexedSubscript:v2];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          break;
        }
        char v6 = (v2 + 1 >= (unint64_t)[v1 count]) | ~v3;
        uint64_t v2 = 1;
        char v3 = 0;
        if (v6) {
          goto LABEL_7;
        }
      }
      int v7 = *__error();
      uint64_t v8 = sub_1C86DE154();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1C86F5288();
      }

      *__error() = v7;
    }
  }

  id v1 = [MEMORY[0x1E4F1CA20] preferredLanguages];
LABEL_12:

  return v1;
}

void sub_1C86DD608()
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class())
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v1 = (void *)qword_1EA52E308;
    qword_1EA52E308 = (uint64_t)v0;

    uint64_t v2 = [MEMORY[0x1E4F61898] shared];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = [v2 domains];
    uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v36;
      do
      {
        uint64_t v3 = 0;
        do
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = v3;
          uint64_t v4 = *(void *)(*((void *)&v35 + 1) + 8 * v3);
          context = (void *)MEMORY[0x1C87CBD00]();
          uint64_t v5 = [v2 featuresForDomain:v4];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v29 = v5;
          uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v7; ++i)
              {
                if (*(void *)v32 != v8) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                id v11 = [v2 stateForFeature:v10 domain:v4 level:4];
                if (v11)
                {
                  int v12 = [v2 defaultStateForFeature:v10 domain:v4];
                  int v13 = v12;
                  if (!v12 || (uint64_t v14 = [v12 value], v14 != objc_msgSend(v11, "value")))
                  {
                    uint64_t v15 = [v11 value];
                    uint64_t v16 = MEMORY[0x1E4F1CC28];
                    if (v15 == 1) {
                      uint64_t v16 = MEMORY[0x1E4F1CC38];
                    }
                    uint64_t v30 = v16;
                    uint64_t v17 = v7;
                    uint64_t v18 = v8;
                    int v19 = v2;
                    uint64_t v20 = qword_1EA52E308;
                    int v21 = (void *)[[NSString alloc] initWithFormat:@"%@.%@", v4, v10];
                    stat v22 = (void *)v20;
                    uint64_t v2 = v19;
                    uint64_t v8 = v18;
                    uint64_t v7 = v17;
                    [v22 setObject:v30 forKeyedSubscript:v21];
                  }
                }
              }
              uint64_t v7 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v7);
          }

          uint64_t v3 = v28 + 1;
        }
        while (v28 + 1 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v26);
    }

    if (![(id)qword_1EA52E308 count])
    {
      uint64_t v23 = (void *)qword_1EA52E308;
      qword_1EA52E308 = 0;
    }
    [v2 invalidateCache];
  }
}

void sub_1C86DD8F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1C86DD918(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1C86DD938(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1C86DD964(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1C86DD9B0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t is_apple_internal_setting()
{
  if (qword_1EB59C900 != -1) {
    dispatch_once(&qword_1EB59C900, &unk_1F23189A0);
  }
  return byte_1EB59C8F8;
}

uint64_t sub_1C86DDA14()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  byte_1EB59C8F8 = result;
  return result;
}

uint64_t tailspin_buffer_size_get_default()
{
  if (qword_1EB59C8E8 != -1) {
    dispatch_once(&qword_1EB59C8E8, &unk_1F2318AA0);
  }
  if (byte_1EB59C8F1 != 1) {
    return 0;
  }
  if (qword_1EB59C910 != -1) {
    dispatch_once(&qword_1EB59C910, &unk_1F2318AC0);
  }
  return qword_1EB59C918;
}

void sub_1C86DDAC0()
{
  if (qword_1EB59C8E8 != -1) {
    dispatch_once(&qword_1EB59C8E8, &unk_1F2318AA0);
  }
  if (qword_1EB59C908 != -1) {
    dispatch_once(&qword_1EB59C908, &unk_1F2318AE0);
  }
  unint64_t v0 = vcvtms_u32_f32(*(float *)&dword_1EB59C8C8 * 25.0);
  if (*(float *)&dword_1EB59C8C8 == 1.0) {
    unint64_t v0 = 25;
  }
  qword_1EB59C918 = v0;
}

void *tailspin_kdbg_filter_get_default()
{
  if (qword_1EB59C8E8 != -1) {
    dispatch_once(&qword_1EB59C8E8, &unk_1F2318AA0);
  }
  if (byte_1EB59C8F1 == 1 && qword_1EB59EA58 != -1) {
    dispatch_once(&qword_1EB59EA58, &unk_1F2318B00);
  }
  return &unk_1EB59C94C;
}

void sub_1C86DDBCC()
{
  if (trace_parse_filter()) {
    sub_1C86F45C0();
  }
  if (qword_1EB59C8E8 != -1) {
    dispatch_once(&qword_1EB59C8E8, &unk_1F2318AA0);
  }
  byte_1EB59CEB4 &= ~0x40u;
  byte_1EB59CF86 &= ~2u;
}

uint64_t sub_1C86DDC44()
{
  if (qword_1EB59C8E8 != -1) {
    dispatch_once(&qword_1EB59C8E8, &unk_1F2318AA0);
  }
  if (byte_1EB59C8F1 == 1 && qword_1EB59EA70 != -1) {
    dispatch_once(&qword_1EB59EA70, &unk_1F2318B20);
  }
  if (byte_1EB59C8D0) {
    return 50000000;
  }
  else {
    return 0;
  }
}

unint64_t sub_1C86DDCD0()
{
  byte_1EB59C8D0 = 1;
  unint64_t result = tailspin_full_sampling_period_get_default();
  if (result)
  {
    if (byte_1EB59C8D0 == 1) {
      byte_1EB59C8D0 = 0;
    }
  }
  return result;
}

unint64_t tailspin_full_sampling_period_get_default()
{
  unint64_t v0 = sub_1C86DDF90();
  if (v0)
  {
    if (qword_1EB59EA60 != -1) {
      dispatch_once(&qword_1EB59EA60, &unk_1F2318A60);
    }
    if (v0 < qword_1EB59EA68) {
      sub_1C86F45C0();
    }
  }
  return v0;
}

uint64_t tailspin_min_oncore_sampling_period_allowed()
{
  if (qword_1EA52E318 != -1) {
    dispatch_once(&qword_1EA52E318, &unk_1F2318A40);
  }
  return qword_1EA52E310;
}

uint64_t sub_1C86DDDBC()
{
  size_t v3 = 8;
  uint64_t result = sysctlbyname("kperf.limits.timer_min_bg_period_ns", &qword_1EA52E310, &v3, 0, 0);
  if (result)
  {
    int v1 = *__error();
    uint64_t v2 = sub_1C86DE154();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1C86F52BC(v2);
    }

    *__error() = v1;
    uint64_t result = sub_1C86DDC44();
    qword_1EA52E310 = result;
  }
  return result;
}

unint64_t tailspin_oncore_sampling_period_get_default()
{
  unint64_t v0 = sub_1C86DDC44();
  if (v0)
  {
    if (qword_1EA52E318 != -1) {
      dispatch_once(&qword_1EA52E318, &unk_1F2318A40);
    }
    if (v0 < qword_1EA52E310) {
      sub_1C86F45C0();
    }
  }
  return v0;
}

uint64_t tailspin_min_full_sampling_period_allowed()
{
  if (qword_1EB59EA60 != -1) {
    dispatch_once(&qword_1EB59EA60, &unk_1F2318A60);
  }
  return qword_1EB59EA68;
}

uint64_t sub_1C86DDEFC()
{
  size_t v3 = 8;
  uint64_t result = sysctlbyname("kperf.limits.timer_min_bg_pet_period_ns", &qword_1EB59EA68, &v3, 0, 0);
  if (result)
  {
    int v1 = *__error();
    uint64_t v2 = sub_1C86DE154();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1C86F5300(v2);
    }

    *__error() = v1;
    uint64_t result = sub_1C86DDF90();
    qword_1EB59EA68 = result;
  }
  return result;
}

uint64_t sub_1C86DDF90()
{
  if (qword_1EB59C8E8 != -1) {
    dispatch_once(&qword_1EB59C8E8, &unk_1F2318AA0);
  }
  if (byte_1EB59C8F1 != 1) {
    return 0;
  }
  if (qword_1EB59C930 != -1) {
    dispatch_once(&qword_1EB59C930, &unk_1F2318920);
  }
  if (byte_1EB59C938) {
    return 10000000;
  }
  else {
    return 0;
  }
}

uint64_t tailspin_sampling_options_get_default()
{
  return 0;
}

void sub_1C86DE02C()
{
  if (qword_1EB59C8E8 != -1) {
    dispatch_once(&qword_1EB59C8E8, &unk_1F2318AA0);
  }
  if (byte_1EB59C8F1 == 1 && (os_variant_is_darwinos() & 1) == 0)
  {
    if (qword_1EB59C900 != -1) {
      dispatch_once(&qword_1EB59C900, &unk_1F23189A0);
    }
    char v0 = byte_1EB59C8F8;
    if (byte_1EB59C8F8) {
      char v0 = (byte_1EA52E320 & 1) == 0;
    }
  }
  else
  {
    char v0 = 0;
  }
  byte_1EB59C928 = v0;
}

uint64_t sub_1C86DE0DC()
{
  size_t v2 = 8;
  uint64_t v3 = 0;
  uint64_t result = sysctlbyname("hw.memsize", &v3, &v2, 0, 0);
  if (result) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = v3 < 1;
  }
  if (!v1 && (int)((unint64_t)v3 >> 20) >= 1901) {
    dword_1EB59C8C8 = 0x40000000;
  }
  return result;
}

void sub_1C86DE144()
{
  byte_1EB59C938 = 1;
}

id sub_1C86DE154()
{
  if (qword_1EB59C8D8 != -1) {
    dispatch_once(&qword_1EB59C8D8, &unk_1F23189C0);
  }
  char v0 = (void *)qword_1EB59C8E0;

  return v0;
}

void sub_1C86DE1A8()
{
  os_log_t v0 = os_log_create("com.apple.tailspin", "library");
  BOOL v1 = (void *)qword_1EB59C8E0;
  qword_1EB59C8E0 = (uint64_t)v0;

  id v2 = (id)qword_1EB59C8E0;
  if (!v2) {
    sub_1C86F45C0();
  }
}

uint64_t sub_1C86DE208(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = snprintf(byte_1EA52E328, 0x400uLL, "%d ", a1);
  if ((result - 1) <= 0x3FE) {
    uint64_t result = vsnprintf(&byte_1EA52E328[result], 1024 - result, a2, &a9);
  }
  qword_1EA52E290 = (uint64_t)byte_1EA52E328;
  return result;
}

void tailspin_save_trace_with_standard_chunks(uint64_t a1, const char *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  target = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v45 = v16;
  int v19 = sub_1C86DE880(a1, (uint64_t)a2, a3, v15, v16, v17);
  if (v19)
  {
    size_t __sizep = 0;
    __bufp = 0;
    int v20 = *__error();
    int v21 = sub_1C86DE154();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1C86F546C();
    }

    *__error() = v20;
    if (ktrace_config_create_current())
    {
      stat v22 = open_memstream(&__bufp, &__sizep);
      if (v22)
      {
        if (ktrace_config_print_description())
        {
          int v23 = *__error();
          io_object_t v24 = sub_1C86DE154();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = __error();
            sub_1C86F542C(v25, (uint64_t)buf, v24);
          }

          *__error() = v23;
          fclose(v22);
        }
        else
        {
          fclose(v22);
          size_t v37 = __sizep;
          if (__sizep)
          {
            size_t v38 = 1000;
            do
            {
              if (v38 >= v37)
              {
                char v39 = 0;
              }
              else
              {
                char v39 = __bufp[v38];
                __bufp[v38] = 0;
              }
              if (v38 == 1000)
              {
                int v40 = *__error();
                uint64_t v41 = sub_1C86DE154();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446210;
                  v59 = __bufp;
                  _os_log_error_impl(&dword_1C86D7000, v41, OS_LOG_TYPE_ERROR, "Current system config = \n%{public}s", buf, 0xCu);
                }
              }
              else
              {
                int v40 = *__error();
                uint64_t v41 = sub_1C86DE154();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446210;
                  v59 = &__bufp[v38 - 1000];
                  _os_log_error_impl(&dword_1C86D7000, v41, OS_LOG_TYPE_ERROR, "Current system config = (continued)\n%{public}s", buf, 0xCu);
                }
              }

              *__error() = v40;
              size_t v37 = __sizep;
              if (v38 < __sizep)
              {
                __bufp[v38] = v39;
                size_t v37 = __sizep;
              }
              BOOL v42 = v38 >= v37;
              v38 += 1000;
            }
            while (!v42);
          }
          else
          {
            int v43 = *__error();
            uint64_t v44 = sub_1C86DE154();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              sub_1C86F53F8();
            }

            *__error() = v43;
          }
        }
        if (__bufp) {
          free(__bufp);
        }
      }
      else
      {
        int v34 = *__error();
        long long v35 = sub_1C86DE154();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          long long v36 = __error();
          sub_1C86F53B8(v36, (uint64_t)buf, v35);
        }

        *__error() = v34;
      }
      ktrace_config_destroy();
    }
    else
    {
      int v31 = *__error();
      long long v32 = sub_1C86DE154();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        long long v33 = __error();
        sub_1C86F5378(v33, (uint64_t)buf, v32);
      }

      *__error() = v31;
    }
    if (a1 != -1) {
      close(a1);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C86E03BC;
    block[3] = &unk_1E6570008;
    id v48 = v18;
    int v49 = v19;
    dispatch_async(target, block);
  }
  else
  {
    uint64_t v26 = strdup(a2);
    dispatch_queue_t v27 = dispatch_queue_create_with_target_V2("com.apple.tailspind.post-processing-queue", 0, target);
    int v28 = *__error();
    id v29 = sub_1C86DE154();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_1C86F5344();
    }

    *__error() = v28;
    uint64_t v30 = dup(a1);
    [v17 startRecordingTimeForAugmentPhase:v26 pid:a3 originalFd:a1 dupFd:v30];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = sub_1C86E01C8;
    v52[3] = &unk_1E656FFE0;
    v55 = v26;
    int v56 = a1;
    int v57 = a3;
    id v53 = v17;
    id v54 = v18;
    tailspin_augment_output_with_request_id(v30, v15, v27, v53, v52);
  }
}

void sub_1C86DE7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1C86DE880(int a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v218 = *MEMORY[0x1E4F143B8];
  id v135 = a4;
  id v133 = a5;
  uint64_t v198 = 0;
  v199 = &v198;
  uint64_t v200 = 0x2020000000;
  uint64_t v201 = 0;
  id v134 = a6;
  mach_timebase_info(&info);
  [v134 startRecordingTimeForSaveStandardChunksPhase:a2 pid:a3];
  int v132 = a1;
  uint64_t v129 = a2;
  int v128 = a3;
  if (v135)
  {
    id v11 = [v135 objectForKeyedSubscript:@"tailspin_dump_option_min_timestamp"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unint64_t v130 = [v11 unsignedLongLongValue];
    }
    else {
      unint64_t v130 = 0;
    }
    int v12 = [v135 objectForKeyedSubscript:@"tailspin_dump_option_max_timestamp"];

    int v13 = v12;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unint64_t v131 = [v12 unsignedLongLongValue];
    }
    else {
      unint64_t v131 = 0;
    }
    uint64_t v14 = [v135 objectForKeyedSubscript:@"tailspin_dump_option_reason_string"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v15 = [v14 UTF8String];
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = [v135 objectForKeyedSubscript:@"tailspin_dump_option_scrub_output"];

    id v17 = v16;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v18 = [v16 BOOLValue];
    }
    else {
      int v18 = 0;
    }
    int v19 = [v135 objectForKeyedSubscript:@"tailspin_dump_option_target_pid"];

    int v20 = v19;
    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v21 = [v19 intValue];
    }
    else {
      uint64_t v21 = 0xFFFFFFFFLL;
    }
    stat v22 = [v135 objectForKeyedSubscript:@"tailspin_dump_option_fullfsync_after_events"];

    int v23 = v22;
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        LOBYTE(v22) = [v22 BOOLValue];
      }
      else {
        LOBYTE(v22) = 0;
      }
    }
    uint64_t v25 = [v135 objectForKeyedSubscript:@"tailspin_dump_option_ktrace_compression_level"];

    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v25 intValue];
      }
    }
    uint64_t v26 = [v135 objectForKeyedSubscript:@"tailspin_dump_option_resample_truncated_stacks"];

    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v127 = [v26 BOOLValue];
    }
    else {
      int v127 = 1;
    }

    uint64_t v24 = v21;
  }
  else
  {
    LOBYTE(v22) = 0;
    int v18 = 0;
    uint64_t v15 = 0;
    unint64_t v130 = 0;
    unint64_t v131 = 0;
    int v127 = 1;
    uint64_t v24 = 0xFFFFFFFFLL;
  }
  uint64_t v27 = mach_absolute_time();
  if (v131 > v27)
  {
    unint64_t v28 = (v131 - v27) * info.numer / info.denom;
    if (v28 > 0x12A05F200)
    {
      int v29 = *__error();
      uint64_t v30 = sub_1C86DE154();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1C86F5794(v28, v30);
      }

      *__error() = v29;
      unint64_t v28 = 5000000000;
    }
    int v31 = *__error();
    long long v32 = sub_1C86DE154();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      buf.st_dev = 134217984;
      *(double *)&buf.st_mode = (double)v28 / 1000000000.0;
      _os_log_impl(&dword_1C86D7000, v32, OS_LOG_TYPE_INFO, "Tailspin requested with max time %.1fs in the future, sleeping until then...", (uint8_t *)&buf, 0xCu);
    }

    *__error() = v31;
    usleep(v28 / 0x3E8);
  }
  ktrace_session_create();
  ktrace_set_execnames_enabled();
  ktrace_session_set_event_names_enabled();
  ktrace_add_stackshot_flags();
  if (!ktrace_set_use_existing())
  {
    if (v15) {
      ktrace_set_reason();
    }
    uint64_t v216 = v129;
    uint64_t v217 = 0;
    ktrace_set_command_argv();
    ktrace_set_trigger_kind();
    if (v130) {
      int v36 = 1;
    }
    else {
      int v36 = v18;
    }
    if (v36 == 1)
    {
      uint64_t v191 = MEMORY[0x1E4F143A8];
      uint64_t v192 = 3221225472;
      v193 = sub_1C86E03D4;
      v194 = &unk_1E6570028;
      unint64_t v195 = v130;
      char v196 = v18;
      ktrace_set_writing_filter();
    }
    v189[0] = 0;
    v189[1] = v189;
    v189[2] = 0x2020000000;
    int v190 = 0;
    uint64_t v185 = 0;
    __int16 v186 = &v185;
    uint64_t v187 = 0x2020000000;
    int v188 = 0;
    uint64_t v181 = 0;
    id v182 = &v181;
    uint64_t v183 = 0x2020000000;
    uint64_t v184 = 0;
    v171[0] = MEMORY[0x1E4F143A8];
    v171[1] = 3221225472;
    v171[2] = sub_1C86E0404;
    v171[3] = &unk_1E6570050;
    uint64_t v177 = v15;
    id v172 = v133;
    unsigned int v173 = v189;
    char v180 = (char)v22;
    int v178 = v24;
    int v179 = v132;
    size_t v174 = &v185;
    uint8_t v175 = &v181;
    v176 = &v198;
    size_t v37 = (void *)MEMORY[0x1C87CBE90](v171);
    uint64_t v167 = 0;
    size_t v168 = &v167;
    uint64_t v169 = 0x2020000000;
    uint64_t v170 = 0;
    uint64_t v162 = MEMORY[0x1E4F143A8];
    uint64_t v163 = 3221225472;
    v164 = sub_1C86E0524;
    id v165 = &unk_1E6570078;
    v166 = &v167;
    ktrace_set_post_processing_handler();
    dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
    uint64_t v157 = MEMORY[0x1E4F143A8];
    uint64_t v158 = 3221225472;
    v159 = sub_1C86E0554;
    CFStringRef v160 = &unk_1E65700A0;
    char v39 = v38;
    v161 = v39;
    ktrace_set_completion_handler();
    if (fstat(v132, &buf)) {
      off_t st_size = -1;
    }
    else {
      off_t st_size = buf.st_size;
    }
    int v41 = dup(v132);
    uint64_t v126 = mach_absolute_time();
    int v42 = *__error();
    int v43 = sub_1C86DE154();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v211 = 136447234;
      *(void *)&v211[4] = v129;
      *(_WORD *)&v211[12] = 1024;
      *(_DWORD *)&v211[14] = v128;
      *(_WORD *)&v211[18] = 1024;
      *(_DWORD *)&v211[20] = v132;
      LOWORD(v212) = 1024;
      *(_DWORD *)((char *)&v212 + 2) = v41;
      HIWORD(v212) = 2048;
      v213 = (void (*)(uint64_t))st_size;
      _os_log_impl(&dword_1C86D7000, v43, OS_LOG_TYPE_DEFAULT, "Started write fd: %{public}s [%d], original fd: %d, duped fd: %d, size: %{bytes}lld", v211, 0x28u);
    }

    *__error() = v42;
    int started = ktrace_start_writing_fd();
    if (started)
    {
      int v45 = *__error();
      id v46 = sub_1C86DE154();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v211 = 67110146;
        *(_DWORD *)&v211[4] = v132;
        *(_WORD *)&v211[8] = 1024;
        *(_DWORD *)&v211[10] = v41;
        *(_WORD *)&v211[14] = 2082;
        *(void *)&v211[16] = v129;
        LOWORD(v212) = 1024;
        *(_DWORD *)((char *)&v212 + 2) = v128;
        HIWORD(v212) = 1024;
        LODWORD(v213) = started;
        _os_log_error_impl(&dword_1C86D7000, v46, OS_LOG_TYPE_ERROR, "ktrace_start_writing_fd() failed for original fd %d (dup %d) for client %{public}s [%d]: with errno %{errno}d", v211, 0x24u);
      }

      *__error() = v45;
      ktrace_session_destroy();
      int v47 = 15;
LABEL_63:
      *((_DWORD *)v186 + 6) = v47;
      goto LABEL_129;
    }
    dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
    ktrace_session_destroy();
    int v48 = *__error();
    int v49 = sub_1C86DE154();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v211 = 136446978;
      *(void *)&v211[4] = v129;
      *(_WORD *)&v211[12] = 1024;
      *(_DWORD *)&v211[14] = v128;
      *(_WORD *)&v211[18] = 1024;
      *(_DWORD *)&v211[20] = v132;
      LOWORD(v212) = 1024;
      *(_DWORD *)((char *)&v212 + 2) = v41;
      _os_log_impl(&dword_1C86D7000, v49, OS_LOG_TYPE_DEFAULT, "Ended writing fd: %{public}s [%d], original fd: %d, duped fd: %d", v211, 0x1Eu);
    }

    *__error() = v48;
    int v50 = v127;
    if ((int)v24 >= 0) {
      int v50 = 1;
    }
    if (v50 != 1) {
      goto LABEL_129;
    }
    int v51 = dup(v132);
    uint64_t v52 = ktrace_file_open_fd();
    if (!v52)
    {
      int v57 = *__error();
      v58 = sub_1C86DE154();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v211 = 67110146;
        *(_DWORD *)&v211[4] = v132;
        *(_WORD *)&v211[8] = 1024;
        *(_DWORD *)&v211[10] = v51;
        *(_WORD *)&v211[14] = 2082;
        *(void *)&v211[16] = v129;
        LOWORD(v212) = 1024;
        *(_DWORD *)((char *)&v212 + 2) = v128;
        HIWORD(v212) = 1024;
        LODWORD(v213) = 0;
        _os_log_fault_impl(&dword_1C86D7000, v58, OS_LOG_TYPE_FAULT, "Unable to get ktfile for original fd %d (duped fd %d) from client %{public}s [%d].: %{errno}d", v211, 0x24u);
      }

      *__error() = v57;
      int v47 = 26;
      goto LABEL_63;
    }
    uint64_t v125 = v52;
    *(void *)v211 = 0;
    *(void *)&v211[8] = v211;
    *(void *)&v211[16] = 0x3032000000;
    v212 = sub_1C86E055C;
    v213 = sub_1C86E056C;
    id v214 = 0;
    unint64_t v154 = 0;
    v155[0] = &v154;
    v155[1] = 0x3032000000;
    v155[2] = sub_1C86E055C;
    v155[3] = sub_1C86E056C;
    id v156 = 0;
    __uint64_t v150 = 0;
    v151 = &v150;
    uint64_t v152 = 0x2020000000;
    int v153 = 0;
    uint64_t v53 = ktrace_session_create();
    ktrace_set_execnames_enabled();
    ktrace_session_set_event_names_enabled();
    int v54 = ktrace_set_ktrace_file();
    if (v54)
    {
      int v55 = *__error();
      int v56 = sub_1C86DE154();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v204 = 67110146;
        *(_DWORD *)v205 = v132;
        *(_WORD *)&v205[4] = 1024;
        *(_DWORD *)&v205[6] = v51;
        *(_WORD *)v206 = 2082;
        *(void *)&v206[2] = v129;
        __int16 v207 = 1024;
        int v208 = v128;
        __int16 v209 = 1024;
        LODWORD(v210) = v54;
        _os_log_fault_impl(&dword_1C86D7000, v56, OS_LOG_TYPE_FAULT, "Unable to create read session for original fd %d (duped fd %d) from client %{public}s [%d].: %{errno}d", v204, 0x24u);
      }

      *__error() = v55;
      *((_DWORD *)v186 + 6) = 26;
    }
    else
    {
      dispatch_semaphore_t v124 = dispatch_semaphore_create(0);
      ktrace_events_single();
      uint64_t v141 = MEMORY[0x1E4F143A8];
      uint64_t v142 = 3221225472;
      id v143 = sub_1C86E0578;
      uint64_t v144 = &unk_1E6570138;
      int v148 = v24;
      char v149 = v127;
      int v145 = v211;
      v146 = &v154;
      int v147 = &v150;
      ktrace_stackshot();
      v136[1] = (id)MEMORY[0x1E4F143A8];
      v136[2] = (id)3221225472;
      v136[3] = sub_1C86E11D8;
      v136[4] = &unk_1E6570160;
      int v140 = v24;
      int v138 = v211;
      uint64_t v139 = v53;
      v59 = v124;
      id v137 = v59;
      ktrace_set_completion_handler();
      if (v127)
      {
        if ((v24 & 0x80000000) != 0)
        {
          int v60 = *__error();
          v61 = sub_1C86DE154();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
            sub_1C86F56C4();
          }
        }
        else
        {
          int v60 = *__error();
          v61 = sub_1C86DE154();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
            sub_1C86F5690();
          }
        }
      }
      else
      {
        int v60 = *__error();
        v61 = sub_1C86DE154();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
          sub_1C86F56F8();
        }
      }

      int v62 = v39;
      *__error() = v60;
      mach_absolute_time();
      if (fstat(v132, &buf)) {
        off_t v63 = -1;
      }
      else {
        off_t v63 = buf.st_size;
      }
      int v64 = *__error();
      v65 = sub_1C86DE154();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v204 = 136447234;
        *(void *)v205 = v129;
        *(_WORD *)&v205[8] = 1024;
        *(_DWORD *)v206 = v128;
        *(_WORD *)&v206[4] = 1024;
        *(_DWORD *)&v206[6] = v132;
        __int16 v207 = 1024;
        int v208 = v51;
        __int16 v209 = 2048;
        off_t v210 = v63;
        _os_log_impl(&dword_1C86D7000, v65, OS_LOG_TYPE_DEFAULT, "Started read session: %{public}s [%d], original fd: %d, duped fd: %d, size: %{bytes}lld", v204, 0x28u);
      }

      *__error() = v64;
      int v66 = ktrace_start();
      if (v66)
      {
        char v39 = v62;
        int v67 = *__error();
        v68 = sub_1C86DE154();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v204 = 67110146;
          *(_DWORD *)v205 = v132;
          *(_WORD *)&v205[4] = 1024;
          *(_DWORD *)&v205[6] = v51;
          *(_WORD *)v206 = 2082;
          *(void *)&v206[2] = v129;
          __int16 v207 = 1024;
          int v208 = v128;
          __int16 v209 = 1024;
          LODWORD(v210) = v66;
          _os_log_fault_impl(&dword_1C86D7000, v68, OS_LOG_TYPE_FAULT, "Unable to start read session for original fd %d (duped fd %d) from client %{public}s [%d].: %{errno}d", v204, 0x24u);
        }

        *__error() = v67;
        *((_DWORD *)v186 + 6) = 26;
      }
      else
      {
        dispatch_semaphore_wait(v59, 0xFFFFFFFFFFFFFFFFLL);
        char v39 = v62;
        int v69 = *__error();
        v70 = sub_1C86DE154();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v204 = 136446978;
          *(void *)v205 = v129;
          *(_WORD *)&v205[8] = 1024;
          *(_DWORD *)v206 = v128;
          *(_WORD *)&v206[4] = 1024;
          *(_DWORD *)&v206[6] = v132;
          __int16 v207 = 1024;
          int v208 = v51;
          _os_log_impl(&dword_1C86D7000, v70, OS_LOG_TYPE_DEFAULT, "Ended read session: %{public}s [%d], original fd: %d, duped fd: %d", v204, 0x1Eu);
        }

        *__error() = v69;
        if (v127)
        {
          int v71 = *__error();
          v72 = sub_1C86DE154();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            mach_absolute_time();
            SASecondsFromMachTimeUsingLiveTimebase();
            int v73 = *((_DWORD *)v151 + 6);
            *(_DWORD *)v204 = 134218240;
            *(void *)v205 = v74;
            *(_WORD *)&v205[8] = 1024;
            *(_DWORD *)v206 = v73;
            _os_log_impl(&dword_1C86D7000, v72, OS_LOG_TYPE_INFO, "Done parsing in %.2fs. Resampled %d truncated stacks", v204, 0x12u);
          }
        }
        else
        {
          int v71 = *__error();
          v72 = sub_1C86DE154();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            mach_absolute_time();
            SASecondsFromMachTimeUsingLiveTimebase();
            sub_1C86F564C(v203, v72, v75);
          }
        }

        *__error() = v71;
      }
    }
    ktrace_session_destroy();
    if ((v24 & 0x80000000) == 0)
    {
      v76 = *(void **)(*(void *)&v211[8] + 40);
      if (v76)
      {
        [v76 gatherInfoWithDataGatheringOptions:5 pid:v24];
        v77 = [*(id *)(*(void *)&v211[8] + 40) path];
        BOOL v78 = v77 == 0;

        if (v78)
        {
          int v88 = sub_1C86E1A40(v24);
          BOOL v89 = v88 == 0;

          if (!v89)
          {
            CFBooleanRef v90 = [*(id *)(*(void *)&v211[8] + 40) path];
            BOOL v91 = v90 == 0;

            if (v91)
            {
              int v120 = *__error();
              v121 = sub_1C86DE154();
              if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
              {
                int v122 = [*(id *)(*(void *)&v211[8] + 40) uuid];
                sub_1C86F55E4(v122, v204, v24, v121);
              }

              *__error() = v120;
            }
            else
            {
              [*(id *)(*(void *)&v211[8] + 40) gatherInfoWithDataGatheringOptions:5 pid:v24];
            }
          }
        }
        tailspin_write_symbolless_binary_info_chunk(v125, *(void **)(*(void *)&v211[8] + 40));
      }
      else
      {
        int v79 = *__error();
        v80 = sub_1C86DE154();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
          sub_1C86F557C();
        }

        *__error() = v79;
      }
    }
    uint64_t v81 = *(void *)(v155[0] + 40);
    if (!v81) {
      goto LABEL_117;
    }
    v136[0] = 0;
    v82 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v81 requiringSecureCoding:1 error:v136];
    id v83 = v136[0];
    if (v82)
    {
      id v84 = v82;
      [v84 bytes];
      [v84 length];
      if (ktrace_file_append_chunk())
      {

LABEL_117:
        ktrace_file_close();
        uint64_t v35 = 17;
        char v85 = 1;
        goto LABEL_128;
      }
      int v92 = *__error();
      BOOL v93 = sub_1C86DE154();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        v94 = __error();
        id v95 = strerror(*v94);
        sub_1C86F5534((uint64_t)v95, v202, v93);
      }

      *__error() = v92;
      uint64_t v35 = 17;
    }
    else
    {
      int v86 = *__error();
      CFStringRef v87 = sub_1C86DE154();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
        sub_1C86F54A4((uint64_t)v83, (uint64_t)v155, v87);
      }

      *__error() = v86;
      uint64_t v35 = 18;
    }

    char v85 = 0;
LABEL_128:
    _Block_object_dispose(&v150, 8);
    _Block_object_dispose(&v154, 8);

    _Block_object_dispose(v211, 8);
    if ((v85 & 1) == 0)
    {

LABEL_143:
      _Block_object_dispose(&v167, 8);

      _Block_object_dispose(&v181, 8);
      _Block_object_dispose(&v185, 8);
      _Block_object_dispose(v189, 8);
      goto LABEL_144;
    }
LABEL_129:

    [MEMORY[0x1E4F99C60] clearSymbolCaches];
    int v96 = *((_DWORD *)v186 + 6);
    [v134 stopRecordingTimeForSaveStandardChunksPhase:v96 == 0];
    [v134 recordTimeForSaveStandardChunksWithoutPostProcessing:v168[3]];
    *(void *)v211 = 0;
    unint64_t v154 = 0;
    if (mach_get_times() || !*(void *)v211 || v154 < *(void *)v211)
    {
      _os_assert_log();
      uint64_t v123 = _os_crash();
      sub_1C86F54A0(v123);
    }
    uint64_t v97 = v182[3];
    if (v97 && v126 > v97)
    {
      __uint64_t v150 = 0;
      pthread_threadid_np(0, &v150);
      unint64_t v98 = v154 - *(void *)v211 + v182[3];
      __darwin_ino64_t v99 = v154 - *(void *)v211 + v126;
      if (v96)
      {
        int v100 = *__error();
        v101 = sub_1C86DE154();
        v102 = v101;
        os_signpost_id_t v103 = v150;
        if (v150 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
        {
          uint64_t v104 = v199[3];
          buf.st_dev = 134349568;
          *(void *)&buf.st_mode = v98;
          WORD2(buf.st_ino) = 2050;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v99;
          HIWORD(buf.st_gid) = 2050;
          *(void *)&buf.st_rdev = v104;
          _os_signpost_emit_with_name_impl(&dword_1C86D7000, v102, OS_SIGNPOST_EVENT, v103, "TailspinFailed", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu numEvents=%{public,name=numEvents}llu enableTelemetry=YES ", (uint8_t *)&buf, 0x20u);
        }

        *__error() = v100;
      }
      else
      {
        int v108 = *__error();
        v109 = sub_1C86DE154();
        id v110 = v109;
        os_signpost_id_t v111 = v150;
        if (v150 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
        {
          uint64_t v112 = v199[3];
          buf.st_dev = 134349568;
          *(void *)&buf.st_mode = v98;
          WORD2(buf.st_ino) = 2050;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v99;
          HIWORD(buf.st_gid) = 2050;
          *(void *)&buf.st_rdev = v112;
          _os_signpost_emit_with_name_impl(&dword_1C86D7000, v110, OS_SIGNPOST_EVENT, v111, "TailspinSaved", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu numEvents=%{public,name=numEvents}llu enableTelemetry=YES ", (uint8_t *)&buf, 0x20u);
        }

        *__error() = v108;
        [v134 recordTailspinDurationWithStartMCT:v98 endMCT:v99];
        if (v130)
        {
          unint64_t v113 = v182[3];
          unint64_t v114 = v130 <= v113 ? v182[3] : v130;
          unint64_t v115 = v130 >= v113 ? 0 : v114 - v130;
          [v134 recordLostTimePeriodAtStart:v115, v124];
          if (v131)
          {
            if (v131 > v130)
            {
              unint64_t v116 = v131;
              if (v131 >= v126) {
                unint64_t v116 = v126;
              }
              BOOL v117 = v116 >= v114;
              unint64_t v118 = v116 - v114;
              if (!v117) {
                unint64_t v118 = 0;
              }
              [v134 recordRatioTimePeriodCovered:(double)v118 / (double)(v131 - v130)];
            }
          }
        }
      }
    }
    else
    {
      int v105 = *__error();
      int v106 = sub_1C86DE154();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        uint64_t v119 = v182[3];
        buf.st_dev = 134218752;
        *(void *)&buf.st_mode = v119;
        WORD2(buf.st_ino) = 2048;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v126;
        HIWORD(buf.st_gid) = 2048;
        *(void *)&buf.st_rdev = *(void *)v211;
        LOWORD(buf.st_atimespec.tv_sec) = 2048;
        *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 2) = v154;
        _os_log_error_impl(&dword_1C86D7000, v106, OS_LOG_TYPE_ERROR, "Bad timestamps from tailspin file: %llu %llu %llu %llu", (uint8_t *)&buf, 0x2Au);
      }

      *__error() = v105;
    }
    uint64_t v35 = *((unsigned int *)v186 + 6);
    goto LABEL_143;
  }
  int v33 = *__error();
  int v34 = sub_1C86DE154();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    sub_1C86F572C();
  }

  *__error() = v33;
  ktrace_session_destroy();
  uint64_t v35 = 14;
LABEL_144:
  _Block_object_dispose(&v198, 8);

  return v35;
}

void sub_1C86DFF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,id a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);

  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&a58, 8);

  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x228], 8);
  _Block_object_dispose(&STACK[0x248], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);

  _Unwind_Resume(a1);
}

uint64_t sub_1C86E01C8(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(a1 + 56);
  if (v4 == -1)
  {
    off_t st_size = 0;
  }
  else
  {
    if (fstat(v4, &v17))
    {
      int v5 = *__error();
      uint64_t v6 = sub_1C86DE154();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v8 = __error();
        sub_1C86F58C8(v7, v8, v16, v6);
      }

      off_t st_size = 0;
      *__error() = v5;
    }
    else
    {
      off_t st_size = v17.st_size;
    }
    close(*(_DWORD *)(a1 + 56));
  }
  int v10 = *__error();
  id v11 = sub_1C86DE154();
  int v12 = v11;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __darwin_ino64_t v13 = *(void *)(a1 + 48);
      dev_t v14 = *(_DWORD *)(a1 + 60);
      v17.st_dev = 134218498;
      *(void *)&v17.st_mode = st_size;
      WORD2(v17.st_ino) = 2082;
      *(__darwin_ino64_t *)((char *)&v17.st_ino + 6) = v13;
      HIWORD(v17.st_gid) = 1024;
      v17.st_rdev = v14;
      _os_log_impl(&dword_1C86D7000, v12, OS_LOG_TYPE_DEFAULT, "Saved %{bytes}lld tailspin on behalf of %{public}s [%d]", (uint8_t *)&v17, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_1C86F582C(a1, st_size, v12);
  }

  *__error() = v10;
  [*(id *)(a1 + 32) stopRecordingTimeForAugmentPhase:a2 == 1 finalSizeBytes:st_size];
  free(*(void **)(a1 + 48));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1C86E03A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1C86E03BC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

BOOL sub_1C86E03D4(uint64_t a1, unint64_t a2, unsigned int a3)
{
  if (*(void *)(a1 + 32) > a2) {
    return 0;
  }
  return a3 >> 2 != 12599332 || *(unsigned char *)(a1 + 40) == 0;
}

uint64_t sub_1C86E0404(uint64_t a1, uint64_t a2)
{
  int v3 = tailspin_write_metadata_chunk(a2, *(void *)(a1 + 72), *(void **)(a1 + 32), *(unsigned int *)(a1 + 80));
  if (v3)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 16;
  }
  if (*(unsigned char *)(a1 + 88))
  {
    fcntl(*(_DWORD *)(a1 + 84), 51);
    int v4 = *__error();
    int v5 = sub_1C86DE154();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1C86F598C();
    }

    *__error() = v4;
  }
  if (ktrace_file_earliest_timestamp())
  {
    int v6 = *__error();
    uint64_t v7 = sub_1C86DE154();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1C86F5924();
    }

    *__error() = v6;
  }
  uint64_t result = ktrace_file_ktrace_event_count();
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t sub_1C86E0524(uint64_t a1)
{
  uint64_t result = mach_continuous_time();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

intptr_t sub_1C86E0554(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1C86E055C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C86E056C(uint64_t a1)
{
}

void sub_1C86E0578(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2 + 16;
  if (a2 + 16 > a3 || (uint64_t v6 = a2, v4 + (unint64_t)*(unsigned int *)(a2 + 4) > a3))
  {
    id v7 = 0;
    id v8 = 0;
    goto LABEL_4;
  }
  __darwin_ino64_t v13 = 0;
  uint64_t v60 = 0;
  id v61 = 0;
  char v14 = 0;
  *(_DWORD *)&pid[8] = 0;
  *(void *)pid = *(unsigned int *)(a1 + 56);
  uint64_t v15 = 0xFFFFFFFFLL;
  do
  {
    uint64_t v16 = *(unsigned int *)(v6 + 4);
    if (v4 + v16 > a3) {
      break;
    }
    int v17 = *(_DWORD *)v6;
    if (*(_DWORD *)v6 == -242132755) {
      break;
    }
    if ((v17 & 0xFFFFFFF0) == 0x20) {
      int v18 = 17;
    }
    else {
      int v18 = *(_DWORD *)v6;
    }
    if (v18 <= 19)
    {
      if (v18 != 17)
      {
        if (v18 != 19) {
          goto LABEL_96;
        }
        if (v16 < 4 || v17 != 19)
        {
          _os_assert_log();
          uint64_t v53 = _os_crash();
          sub_1C86F54A0(v53);
        }
        if (*(_DWORD *)(v6 + 16) != 2307) {
          goto LABEL_96;
        }
        uint64_t v60 = *(void *)(v6 + 8);
        goto LABEL_95;
      }
      if (v17 != 17 && (v17 & 0xFFFFFFF0) != 0x20) {
        goto LABEL_124;
      }
      uint64_t v30 = *(void *)(v6 + 8);
      if (v30)
      {
        if (v17 == 17)
        {
          if (SHIDWORD(v30) <= 2310)
          {
            switch(HIDWORD(v30))
            {
              case 0x30:
                unsigned int v31 = 20;
                break;
              case 0x31:
                unsigned int v31 = 24;
                break;
              case 0x81A:
LABEL_64:
                unsigned int v31 = 8;
                break;
              default:
                goto LABEL_124;
            }
          }
          else
          {
            switch(HIDWORD(v30))
            {
              case 0x907:
                unsigned int v31 = 4;
                break;
              case 0x908:
              case 0x909:
                goto LABEL_124;
              case 0x90A:
              case 0x90C:
                goto LABEL_64;
              case 0x90B:
              case 0x90D:
                unsigned int v31 = 16;
                break;
              default:
                if (HIDWORD(v30) != 2369) {
                  goto LABEL_124;
                }
                unsigned int v31 = 48;
                break;
            }
          }
          if (v16 / v31 < v30 || v16 % v30 >= 0x10)
          {
LABEL_124:
            _os_assert_log();
            uint64_t v57 = _os_crash();
            sub_1C86F54A0(v57);
          }
          goto LABEL_80;
        }
        unsigned int v32 = *(_DWORD *)v6 & 0xF;
        BOOL v21 = v16 >= v32;
        unsigned int v33 = v16 - v32;
        if (!v21 || v33 < v30) {
          goto LABEL_124;
        }
        LODWORD(v16) = v33 % v30;
      }
      if (v16) {
        goto LABEL_124;
      }
LABEL_80:
      if (v14)
      {
        if (((v15 & 0x80000000) != 0 || v15 == *(_DWORD *)pid) && v30)
        {
          uint64_t v38 = v6 + 16;
          if (HIDWORD(v30) == 48)
          {
            unsigned int v58 = v15;
            char v39 = 0;
            uint64_t v41 = *(void *)(v6 + 8);
            while (*(_DWORD *)v38 && !uuid_is_null((const unsigned __int8 *)(v38 + 4)))
            {
              if (!v39 || *v39 > *(_DWORD *)v38) {
                char v39 = (_DWORD *)v38;
              }
              v38 += 20;
              if (!--v41) {
                goto LABEL_109;
              }
            }
            char v39 = 0;
LABEL_109:
            int v42 = v39 + 1;
            goto LABEL_110;
          }
          if (HIDWORD(v30) == 49)
          {
            unsigned int v58 = v15;
            char v39 = 0;
            uint64_t v40 = *(void *)(v6 + 8);
            while (*(void *)v38 && !uuid_is_null((const unsigned __int8 *)(v38 + 8)))
            {
              if (!v39 || *(void *)v39 > *(void *)v38) {
                char v39 = (_DWORD *)v38;
              }
              v38 += 24;
              if (!--v40) {
                goto LABEL_107;
              }
            }
            char v39 = 0;
LABEL_107:
            int v42 = v39 + 2;
LABEL_110:
            int v43 = *(_DWORD **)&pid[4];
            if (v39) {
              int v43 = v42;
            }
            *(void *)&pid[4] = v43;
            char v14 = 1;
            uint64_t v15 = v58;
            goto LABEL_96;
          }
        }
        goto LABEL_95;
      }
LABEL_94:
      char v14 = 0;
      goto LABEL_96;
    }
    switch(v18)
    {
      case 20:
        if ((v14 & 1) == 0) {
          goto LABEL_94;
        }
        if (*(void *)(v6 + 8) != v60) {
          goto LABEL_95;
        }
        if ((v15 & 0x80000000) != 0)
        {
          *(void *)&pid[4] = 0;
          char v14 = 0;
        }
        else
        {
          char v14 = 0;
          if (v15 == *(_DWORD *)pid && *(void *)&pid[4])
          {
            int v34 = malloc_type_calloc(1uLL, 0x400uLL, 0x16561153uLL);
            proc_pidpath(*(int *)pid, v34, 0x400u);
            if (*v34 == 47)
            {
              uint64_t v35 = [NSString stringWithUTF8String:v34];
            }
            else
            {
              uint64_t v35 = 0;
            }
            free(v34);
            uint64_t v44 = (void *)MEMORY[0x1E4F99C60];
            int v45 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*(void *)&pid[4]];
            uint64_t v46 = [v44 binaryWithUUID:v45 absolutePath:v35];

            *(void *)&pid[4] = 0;
            char v14 = 0;
            uint64_t v15 = 0xFFFFFFFFLL;
            __darwin_ino64_t v13 = (void *)v46;
            break;
          }
          *(void *)&pid[4] = 0;
        }
        uint64_t v15 = 0xFFFFFFFFLL;
        break;
      case 2309:
        if (v14)
        {
          unsigned int v28 = *(_DWORD *)(v6 + 8) & 0xF;
          BOOL v21 = v16 >= v28;
          unsigned int v29 = v16 - v28;
          if (!v21) {
            unsigned int v29 = 0;
          }
          if (v29 >= 0x78) {
            uint64_t v15 = *(unsigned int *)(v6 + 100);
          }
          goto LABEL_95;
        }
        goto LABEL_94;
      case 2310:
        if (v14)
        {
          uint64_t v19 = *(void *)(v6 + 8);
          if (v16 != 112 || (v19 & 0x8F) != 0)
          {
            unsigned int v20 = v19 & 0xF;
            BOOL v21 = v16 >= v20;
            unsigned int v22 = v16 - v20;
            if (!v21) {
              unsigned int v22 = 0;
            }
            if (v22 >= 0x78)
            {
              if ((v15 & 0x80000000) != 0)
              {
                int v36 = *__error();
                size_t v37 = sub_1C86DE154();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v47 = *(void *)(v6 + 16);
                  *(_DWORD *)stat buf = 134217984;
                  uint64_t v67 = v47;
                  _os_log_error_impl(&dword_1C86D7000, v37, OS_LOG_TYPE_ERROR, "No task shapshot before thread snapshot for thread %#llx", buf, 0xCu);
                }

                *__error() = v36;
              }
              else if ((*(unsigned char *)(v6 + 80) & 0x80) != 0)
              {
                if (!v61) {
                  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                }
                int v23 = [NSNumber numberWithInt:v15];
                uint64_t v24 = [v61 objectForKeyedSubscript:v23];

                if (!v24)
                {
                  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  uint64_t v26 = [NSNumber numberWithInt:v15];
                  [v61 setObject:v25 forKeyedSubscript:v26];

                  uint64_t v24 = v25;
                }
                uint64_t v27 = [NSNumber numberWithUnsignedLongLong:*(void *)(v6 + 16)];
                [v24 addObject:v27];
              }
            }
          }
LABEL_95:
          char v14 = 1;
          break;
        }
        goto LABEL_94;
    }
LABEL_96:
    uint64_t v6 = v4 + *(unsigned int *)(v6 + 4);
    uint64_t v4 = v6 + 16;
  }
  while (v6 + 16 <= a3);
  id v8 = v61;
  id v7 = v13;

LABEL_4:
  id v9 = v7;
  id v10 = v8;
  if ((*(_DWORD *)(a1 + 56) & 0x80000000) == 0)
  {
    if (v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7);
      int v11 = *__error();
      int v12 = sub_1C86DE154();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v54 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) debugDescription];
        uint64_t v55 = [v54 UTF8String];
        int v56 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)stat buf = 136315394;
        uint64_t v67 = v55;
        __int16 v68 = 1024;
        int v69 = v56;
        _os_log_debug_impl(&dword_1C86D7000, v12, OS_LOG_TYPE_DEBUG, "Got main binary %s for pid %d from stackshot", buf, 0x12u);
      }
      *__error() = v11;
    }
    else
    {
      int v48 = *__error();
      int v49 = sub_1C86DE154();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)stat buf = 67109120;
        LODWORD(v67) = v50;
        _os_log_impl(&dword_1C86D7000, v49, OS_LOG_TYPE_DEFAULT, "No main binary for pid %d in stackshot", buf, 8u);
      }

      *__error() = v48;
    }
  }
  if (*(unsigned char *)(a1 + 60) && v10)
  {
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = sub_1C86E0EBC;
    v62[3] = &unk_1E6570110;
    uint64_t v64 = *(void *)(a1 + 40);
    id v51 = v10;
    uint64_t v52 = *(void *)(a1 + 48);
    id v63 = v51;
    uint64_t v65 = v52;
    [v51 enumerateKeysAndObjectsUsingBlock:v62];
  }
}

void sub_1C86E0D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1C86E0EBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 intValue];
  if (v7 != getpid())
  {
    id v8 = *(id *)(a1 + 32);
    id v9 = v5;
    id v10 = v6;
    SAResampleThreads();
  }
}

void sub_1C86E0FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1C86E0FE8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:[*(id *)(a1 + 32) count]];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  id v17 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v17)
  {
    id v17 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:[*(id *)(a1 + 48) count]];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:forKeyedSubscript:];
  }
  uint64_t v12 = a4;
  __darwin_ino64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  if (a4)
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a3 + 8 * v14)];
      [v13 setObject:v15 atIndexedSubscript:v14];

      ++v14;
    }
    while (v12 != v14);
  }
  uint64_t v16 = [NSNumber numberWithUnsignedLongLong:a2];
  [v17 setObject:v13 forKeyedSubscript:v16];

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

void sub_1C86E1198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

intptr_t sub_1C86E11D8(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if ((v2 & 0x80000000) == 0 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v3 = main_binary_for_pid_in_ktrace(*(void *)(a1 + 48), v2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

id main_binary_for_pid_in_ktrace(uint64_t a1, int a2)
{
  id v2 = 0;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (a1 && (a2 & 0x80000000) == 0)
  {
    uint64_t v3 = (void *)ktrace_dumpbuffer_address_space_pid();
    v76 = v3;
    if (v3)
    {
      id v4 = v3;
      uint64_t v79 = [v4 bytes];
      unint64_t v80 = [v4 length];
      long long v81 = xmmword_1C86F7960;
      uint64_t v82 = 0;
      char v83 = 1;
      if (v80 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      if (sub_1C86E1F28(&v79, "SYMB", 0))
      {
        id v5 = (unsigned int *)[v4 bytes];
        uint64_t v6 = *v5;
        memset(dst, 0, sizeof(dst));
        memset(uu, 0, sizeof(uu));
        uint64_t v7 = *(unsigned __int16 *)((char *)v5 + v6 - *(int *)((char *)v5 + v6) + 4);
        id v8 = (unsigned int *)((char *)v5 + v6 + v7);
        uint64_t v9 = *v8;
        int v11 = (unsigned int *)((char *)v8 + v9 + 4);
        uint64_t v10 = *(unsigned int *)((char *)v8 + v9);
        if (v10)
        {
          uint64_t v74 = 0;
          uint64_t v12 = (uint64_t)v5 + v6 + v9 + v7 + 12;
          unint64_t v13 = -1;
          v77 = 0;
          BOOL v78 = &v11[v10];
          while (1)
          {
            uint64_t v14 = *v11;
            uint64_t v15 = (int *)((char *)v11 + v14);
            uint64_t v16 = sub_1C86E1DB4((int *)((char *)v11 + v14));
            if (v16)
            {
              id v17 = &v16[-*(int *)v16];
              if (*(unsigned __int16 *)v17 >= 0xBu && (uint64_t v18 = *((unsigned __int16 *)v17 + 5)) != 0)
              {
                uuid_parse(&v16[v18 + 4 + *(unsigned int *)&v16[v18]], uu);
              }
              else
              {
                int v19 = *__error();
                unsigned int v20 = sub_1C86DE154();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)uu2 = 67109120;
                  *(_DWORD *)&uu2[4] = a2;
                  _os_log_error_impl(&dword_1C86D7000, v20, OS_LOG_TYPE_ERROR, "No main uuid for target pid [%d] in ktrace flatbuffer", uu2, 8u);
                }

                *__error() = v19;
              }
            }
            BOOL v21 = (unsigned __int16 *)((char *)v15 - *v15);
            if (*v21 >= 9u)
            {
              uint64_t v22 = v21[4];
              if (v22)
              {
                uint64_t v23 = *(unsigned int *)((char *)v15 + v22);
                uint64_t v24 = (unsigned int *)((char *)v15 + v22 + v23);
                unsigned int v27 = *v24;
                uint64_t v26 = v24 + 1;
                uint64_t v25 = v27;
                if (v27) {
                  break;
                }
              }
            }
LABEL_62:
            ++v11;
            v12 += 4;
            if (v11 == v78) {
              goto LABEL_72;
            }
          }
          unsigned int v28 = &v26[v25];
          uint64_t v29 = v12 + v22 + v14 + v23;
          while (1)
          {
            uint64_t v30 = *v26;
            unsigned int v31 = (int *)((char *)v26 + v30);
            unsigned int v32 = sub_1C86E1DB4((int *)((char *)v26 + v30));
            unsigned int v33 = (int *)v32;
            if (!v32)
            {
              int v40 = *__error();
              uint64_t v41 = sub_1C86DE154();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
                sub_1C86F5A90(buf, v31, &v88, v41);
              }

              *__error() = v40;
              goto LABEL_36;
            }
            int v34 = &v32[-*(int *)v32];
            if (*(unsigned __int16 *)v34 >= 5u && *((_WORD *)v34 + 2))
            {
              uint64_t v35 = 0;
              *(void *)uu2 = 0;
              *(void *)&uu2[8] = 0;
              int v36 = &v32[-*(int *)v32];
              if (*(unsigned __int16 *)v36 >= 5u)
              {
                uint64_t v35 = *((unsigned __int16 *)v36 + 2);
                if (*((_WORD *)v36 + 2)) {
                  v35 += (uint64_t)&v32[*(unsigned int *)&v32[v35]];
                }
              }
              uuid_parse((const char *)(v35 + 4), uu2);
              if (!uuid_is_null(uu2)) {
                break;
              }
            }
LABEL_36:
            ++v26;
            v29 += 4;
            if (v26 == v28) {
              goto LABEL_62;
            }
          }
          if (!uuid_is_null(uu))
          {
            if (!uuid_compare(uu, uu2))
            {
              int v42 = (unsigned __int16 *)((char *)v33 - *v33);
              if (*v42 >= 7u)
              {
                uint64_t v43 = v42[3];
                if (v43)
                {
                  uint64_t v44 = (char *)v33 + v43 + *(unsigned int *)((char *)v33 + v43);
                  if (v44[4] == 47)
                  {
                    uint64_t v57 = [NSString stringWithUTF8String:v44 + 4];

                    uint64_t v74 = (void *)v57;
                    goto LABEL_62;
                  }
                }
              }
            }
            uint64_t v45 = (uint64_t)v77;
            goto LABEL_58;
          }
          unint64_t v37 = v13;
          uint64_t v38 = (unsigned __int16 *)((char *)v31 - *v31);
          unsigned int v39 = *v38;
          if (v39 < 0xD)
          {
            if (v39 < 9) {
              goto LABEL_57;
            }
          }
          else if (v38[6])
          {
            if (*((unsigned char *)v31 + v38[6]))
            {
              if (v38[5])
              {
                unint64_t v13 = *(void *)((char *)v31 + v38[5]);
                if (v13 != -1)
                {
LABEL_52:
                  if (v13 < v37)
                  {
                    uuid_copy(dst, uu2);
                    uint64_t v55 = (unsigned __int16 *)((char *)v33 - *v33);
                    if (*v55 >= 7u
                      && (uint64_t v56 = v55[3]) != 0
                      && *((unsigned char *)v33 + v56 + *(unsigned int *)((char *)v33 + v56) + 4) == 47)
                    {
                      uint64_t v45 = [NSString stringWithUTF8String:(char *)v33 + v56 + *(unsigned int *)((char *)v33 + v56) + 4];
                    }
                    else
                    {
                      uint64_t v45 = 0;
                    }

                    goto LABEL_58;
                  }
LABEL_57:
                  uint64_t v45 = (uint64_t)v77;
                  unint64_t v13 = v37;
LABEL_58:
                  v77 = (void *)v45;
                  goto LABEL_36;
                }
              }
            }
          }
          uint64_t v46 = v38[4];
          if (!v38[4]) {
            goto LABEL_57;
          }
          uint64_t v47 = *(unsigned int *)((char *)v31 + v46);
          uint64_t v48 = *(unsigned int *)((char *)v31 + v46 + v47);
          if (!v48) {
            goto LABEL_57;
          }
          uint64_t v49 = 0;
          uint64_t v50 = 4 * v48;
          uint64_t v51 = v29 + v30 + v47 + v46;
          unint64_t v13 = -1;
          do
          {
            uint64_t v52 = *(unsigned int *)(v51 + v49);
            uint64_t v53 = v52 - *(int *)(v51 + v49 + v52);
            if (*(unsigned __int16 *)(v51 + v49 + v53) >= 7u)
            {
              if (*(_WORD *)(v51 + v49 + v53 + 6))
              {
                unint64_t v54 = *(void *)(v51 + v52 + *(unsigned __int16 *)(v51 + v49 + v53 + 6) + v49);
                if (v54 < v13) {
                  unint64_t v13 = v54;
                }
              }
            }
            v49 += 4;
          }
          while (v50 != v49);
          goto LABEL_52;
        }
        v77 = 0;
        uint64_t v74 = 0;
        unint64_t v13 = -1;
LABEL_72:
        if (uuid_is_null(uu))
        {
          if (v13 == -1)
          {
            int v65 = *__error();
            uint64_t v70 = sub_1C86DE154();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              sub_1C86F5A28();
            }

            uint64_t v67 = __error();
            uint64_t v64 = 0;
          }
          else
          {
            int v62 = (void *)MEMORY[0x1E4F99C60];
            id v63 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:dst];
            uint64_t v64 = [v62 binaryWithUUID:v63 absolutePath:v77];

            int v65 = *__error();
            int v66 = sub_1C86DE154();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            {
              v72 = [v64 uuid];
              int v73 = [v72 UUIDString];
              *(_DWORD *)uu2 = 67109634;
              *(_DWORD *)&uu2[4] = a2;
              *(_WORD *)&uu2[8] = 2048;
              *(void *)&uu2[10] = v13;
              __int16 v85 = 2114;
              int v86 = v73;
              _os_log_debug_impl(&dword_1C86D7000, v66, OS_LOG_TYPE_DEBUG, "No MainBinaryUuid in ktrace flatbuffer for target pid [%d], assuming lowest binary %#llx %{public}@", uu2, 0x1Cu);
            }
            uint64_t v67 = __error();
          }
          *uint64_t v67 = v65;
        }
        else
        {
          __int16 v68 = (void *)MEMORY[0x1E4F99C60];
          int v69 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
          uint64_t v64 = [v68 binaryWithUUID:v69 absolutePath:v74];
        }
        id v2 = v64;

        goto LABEL_83;
      }
      int v58 = *__error();
      id v61 = sub_1C86DE154();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        sub_1C86F5B04();
      }

      uint64_t v60 = __error();
    }
    else
    {
      int v58 = *__error();
      v59 = sub_1C86DE154();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_1C86F59C0();
      }

      uint64_t v60 = __error();
    }
    id v2 = 0;
    int *v60 = v58;
LABEL_83:
  }

  return v2;
}

void sub_1C86E1984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_1C86E1A40(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (qword_1EA52E738 != -1) {
    dispatch_once(&qword_1EA52E738, &unk_1F2318B40);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EA52E730);
  id v2 = (void *)qword_1EA52E728;
  uint64_t v3 = [NSNumber numberWithInt:a1];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    int v5 = *__error();
    uint64_t v6 = sub_1C86DE154();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v21) = a1;
      _os_log_impl(&dword_1C86D7000, v6, OS_LOG_TYPE_INFO, "Using cached load infos for [%d]", buf, 8u);
    }

    *__error() = v5;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F99C68] binaryLoadInfoForLiveProcessWithPid:a1 dataGatheringOptions:1030];
    if (v4)
    {
      int v8 = *__error();
      uint64_t v9 = sub_1C86DE154();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 134218240;
        uint64_t v21 = [v4 count];
        __int16 v22 = 1024;
        int v23 = a1;
        _os_log_impl(&dword_1C86D7000, v9, OS_LOG_TYPE_DEFAULT, "Fetched %lu load infos for [%d] from live process", buf, 0x12u);
      }

      *__error() = v8;
      if (a1)
      {
        uint64_t v10 = (void *)qword_1EA52E728;
        int v11 = [NSNumber numberWithInt:a1];
        [v10 setObject:v4 forKeyedSubscript:v11];

        uint64_t v12 = dispatch_get_global_queue(9, 0);
        dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14470], a1, 0xA0000000uLL, v12);

        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = sub_1C86E4A20;
        v17[3] = &unk_1E6570188;
        dispatch_source_t v18 = v13;
        int v19 = a1;
        uint64_t v14 = v13;
        dispatch_source_set_event_handler(v14, v17);
        dispatch_activate(v14);
      }
    }
    else
    {
      int v15 = *__error();
      uint64_t v16 = sub_1C86DE154();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1C86F5B6C();
      }

      id v4 = 0;
      *__error() = v15;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EA52E730);

  return v4;
}

void sub_1C86E1D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *sub_1C86E1DB4(int *a1)
{
  BOOL v1 = (unsigned __int16 *)((char *)a1 - *a1);
  unsigned int v2 = *v1;
  if (v2 >= 5 && v1[2] && (v2 >= 7 ? (BOOL v3 = *((unsigned char *)a1 + v1[2]) == 1) : (BOOL v3 = 0), v3 && (v4 = v1[3]) != 0)) {
    return (char *)a1 + v4 + *(unsigned int *)((char *)a1 + v4);
  }
  else {
    return 0;
  }
}

void sub_1C86E1E00(void **a1, _DWORD *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    sub_1C86F45C0();
  }
  if (!a2) {
    sub_1C86F45C0();
  }
  size_t v8 = 1152000;
  uint64_t v4 = malloc_type_malloc(0x119400uLL, 0x565DA3C7uLL);
  *a1 = v4;
  if (!v4) {
    sub_1C86F45C0();
  }
  *(void *)uint64_t v9 = 0x1800000001;
  int v10 = 21;
  if (sysctl(v9, 3u, v4, &v8, 0, 0) < 0)
  {
    int v6 = *__error();
    uint64_t v7 = sub_1C86DE154();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1C86F5BD4();
    }

    *__error() = v6;
    free(*a1);
    LODWORD(v5) = 0;
    *a1 = 0;
  }
  else
  {
    size_t v5 = v8 >> 5;
  }
  *a2 = v5;
}

uint64_t sub_1C86E1F28(void *a1, const char *a2, unint64_t a3)
{
  if (a2 && (a1[1] < 8uLL || strncmp((const char *)(*a1 + a3 + 4), a2, 4uLL))) {
    return 0;
  }
  unsigned int v5 = sub_1C86E1FB4((uint64_t)a1, a3);
  if (!v5) {
    return 0;
  }
  int v6 = (int *)(*a1 + a3 + v5);

  return sub_1C86E2004(v6, (uint64_t)a1);
}

uint64_t sub_1C86E1FB4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 3) != 0 && *(unsigned char *)(a1 + 40)) {
    return 0;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 5 || v2 - 4 < a2) {
    return 0;
  }
  uint64_t v4 = *(unsigned int *)(*(void *)a1 + a2);
  if ((int)v4 < 1) {
    return 0;
  }
  if (v2 - 1 >= v4 + a2) {
    return v4;
  }
  return 0;
}

uint64_t sub_1C86E2004(int *a1, uint64_t a2)
{
  uint64_t result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    uint64_t result = sub_1C86E2170(a1, (void *)a2, 4u);
    if (result)
    {
      uint64_t v5 = *a1;
      uint64_t v6 = -v5;
      uint64_t v7 = (unsigned __int16 *)((char *)a1 - v5);
      if (*v7 >= 5u)
      {
        uint64_t v8 = v7[2];
        if (v8)
        {
          uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v8 + *(unsigned int *)((char *)a1 + v8)), 4uLL, 0);
          if (!result) {
            return result;
          }
          uint64_t v6 = -(uint64_t)*a1;
        }
      }
      uint64_t v9 = (unsigned __int16 *)((char *)a1 + v6);
      if (*v9 >= 5u && (uint64_t v10 = v9[2]) != 0) {
        uint64_t v11 = (int *)((char *)a1 + v10 + *(unsigned int *)((char *)a1 + v10));
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t result = sub_1C86E21C8(a2, v11);
      if (result)
      {
        uint64_t result = sub_1C86E2170(a1, (void *)a2, 6u);
        if (result)
        {
          uint64_t v12 = *a1;
          uint64_t v13 = -v12;
          uint64_t v14 = (unsigned __int16 *)((char *)a1 - v12);
          if (*v14 >= 7u)
          {
            uint64_t v15 = v14[3];
            if (v15)
            {
              uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v15 + *(unsigned int *)((char *)a1 + v15)), 4uLL, 0);
              if (!result) {
                return result;
              }
              uint64_t v13 = -(uint64_t)*a1;
            }
          }
          uint64_t v16 = (unsigned __int16 *)((char *)a1 + v13);
          if (*v16 >= 7u && (uint64_t v17 = v16[3]) != 0) {
            dispatch_source_t v18 = (int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17));
          }
          else {
            dispatch_source_t v18 = 0;
          }
          uint64_t result = sub_1C86E2244(a2, v18);
          if (result)
          {
            --*(_DWORD *)(a2 + 16);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1C86E2170(int *a1, void *a2, unsigned int a3)
{
  BOOL v3 = (unsigned __int16 *)((char *)a1 - *a1);
  return *v3 <= a3
      || (uint64_t v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || sub_1C86E1FB4((uint64_t)a2, (unint64_t)a1 + v4 - *a2) != 0;
}

uint64_t sub_1C86E21C8(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    uint64_t result = sub_1C86E23E8((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C86E2244(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  uint64_t v5 = a2 + 1;
  do
  {
    BOOL result = sub_1C86E4908((int *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C86E22C0(uint64_t *a1, int *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (unint64_t)a2 - *a1;
  if ((v3 & 3) != 0 && *((unsigned char *)a1 + 40)) {
    return 0;
  }
  unint64_t v4 = a1[1];
  BOOL v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *a2;
  unsigned int v7 = *((_DWORD *)a1 + 5);
  unsigned int v8 = *((_DWORD *)a1 + 4) + 1;
  *((_DWORD *)a1 + 4) = v8;
  unsigned int v9 = *((_DWORD *)a1 + 6) + 1;
  *((_DWORD *)a1 + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)a1 + 7)) {
    return 0;
  }
  unint64_t v10 = v3 - v6;
  if (v10)
  {
    uint64_t v11 = 0;
    if (*((unsigned char *)a1 + 40) || v4 - 2 < v10) {
      return v11;
    }
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  unint64_t v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((unsigned char *)a1 + 40)) {
    return 0;
  }
  BOOL v5 = v4 >= v12;
  unint64_t v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL sub_1C86E2378(uint64_t a1, unsigned int *a2, unint64_t a3, void *a4)
{
  unint64_t v4 = (unint64_t)a2 - *(void *)a1;
  if ((v4 & 3) != 0 && *(unsigned char *)(a1 + 40)) {
    return 0;
  }
  unint64_t v5 = *(void *)(a1 + 8);
  if (v5 < 5 || v5 - 4 < v4) {
    return 0;
  }
  unint64_t v7 = *a2;
  if (0x7FFFFFFF / a3 <= v7) {
    return 0;
  }
  unint64_t v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    unint64_t v5 = *(void *)(a1 + 8);
  }
  BOOL v9 = v5 > v8;
  unint64_t v10 = v5 - v8;
  return v9 && v10 >= v4;
}

uint64_t sub_1C86E23E8(int *a1, uint64_t a2)
{
  uint64_t result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (!result) {
    return result;
  }
  unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v5 >= 5u)
  {
    uint64_t v6 = v5[2];
    if (v6)
    {
      uint64_t result = 0;
      unint64_t v7 = *(void *)(a2 + 8);
      if (v7 < 2 || v7 - 1 < (unint64_t)a1 + v6 - *(void *)a2) {
        return result;
      }
    }
  }
  uint64_t result = sub_1C86E2170(a1, (void *)a2, 6u);
  if (!result) {
    return result;
  }
  unint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
  unsigned int v9 = *v8;
  if (v9 >= 7)
  {
    if (v8[3])
    {
      unint64_t v10 = (int *)((char *)a1 + v8[3] + *(unsigned int *)((char *)a1 + v8[3]));
      goto LABEL_12;
    }
LABEL_11:
    unint64_t v10 = 0;
LABEL_12:
    uint64_t v11 = v8[2];
    if (v11)
    {
      int v12 = *((unsigned __int8 *)a1 + v11);
      if (v12 == 3)
      {
        if (v10)
        {
          uint64_t result = sub_1C86E30FC(v10, a2);
          if (!result) {
            return result;
          }
        }
      }
      else if (v12 == 2)
      {
        if (v10 && !sub_1C86E2C7C(v10, a2)) {
          return 0;
        }
      }
      else
      {
        BOOL v13 = v12 != 1 || v10 == 0;
        if (!v13 && !sub_1C86E2740(v10, a2)) {
          return 0;
        }
      }
    }
    goto LABEL_26;
  }
  if (v9 >= 5) {
    goto LABEL_11;
  }
LABEL_26:
  uint64_t result = sub_1C86E2170(a1, (void *)a2, 8u);
  if (!result) {
    return result;
  }
  uint64_t v14 = *a1;
  uint64_t v15 = -v14;
  uint64_t v16 = (unsigned __int16 *)((char *)a1 - v14);
  if (*v16 >= 9u)
  {
    uint64_t v17 = v16[4];
    if (v17)
    {
      uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17)), 4uLL, 0);
      if (!result) {
        return result;
      }
      uint64_t v15 = -(uint64_t)*a1;
    }
  }
  dispatch_source_t v18 = (unsigned __int16 *)((char *)a1 + v15);
  if (*v18 >= 9u && (uint64_t v19 = v18[4]) != 0) {
    unsigned int v20 = (int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19));
  }
  else {
    unsigned int v20 = 0;
  }
  uint64_t result = sub_1C86E2648(a2, v20);
  if (result)
  {
    uint64_t result = sub_1C86E2170(a1, (void *)a2, 0xAu);
    if (result)
    {
      uint64_t v21 = *a1;
      uint64_t v22 = -v21;
      int v23 = (unsigned __int16 *)((char *)a1 - v21);
      if (*v23 >= 0xBu)
      {
        uint64_t v24 = v23[5];
        if (v24)
        {
          uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v24 + *(unsigned int *)((char *)a1 + v24)), 4uLL, 0);
          if (!result) {
            return result;
          }
          uint64_t v22 = -(uint64_t)*a1;
        }
      }
      uint64_t v25 = (unsigned __int16 *)((char *)a1 + v22);
      if (*v25 >= 0xBu && (uint64_t v26 = v25[5]) != 0) {
        unsigned int v27 = (int *)((char *)a1 + v26 + *(unsigned int *)((char *)a1 + v26));
      }
      else {
        unsigned int v27 = 0;
      }
      uint64_t result = sub_1C86E26C4(a2, v27);
      if (result)
      {
        --*(_DWORD *)(a2 + 16);
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_1C86E2648(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    uint64_t result = sub_1C86E33D8((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C86E26C4(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    BOOL result = sub_1C86E47C4((int *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C86E2740(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    BOOL result = sub_1C86E2170(a1, (void *)a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = sub_1C86E297C((void *)a2, v7);
      if (result)
      {
        unint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
        unsigned int v9 = *v8;
        if (v9 < 7
          || (!v8[3]
           || (result = 0, unint64_t v10 = *(void *)(a2 + 8), v10 >= 9)
           && v10 - 8 >= (unint64_t)a1 + v8[3] - *(void *)a2)
          && (v9 < 9
           || (uint64_t v11 = v8[4]) == 0
           || (result = 0, unint64_t v12 = *(void *)(a2 + 8), v12 >= 9)
           && v12 - 8 >= (unint64_t)a1 + v11 - *(void *)a2))
        {
          BOOL result = sub_1C86E2170(a1, (void *)a2, 0xAu);
          if (result)
          {
            BOOL v13 = (unsigned __int16 *)((char *)a1 - *a1);
            if (*v13 >= 0xBu && (uint64_t v14 = v13[5]) != 0) {
              uint64_t v15 = (unsigned int *)((char *)a1 + v14 + *(unsigned int *)((char *)a1 + v14));
            }
            else {
              uint64_t v15 = 0;
            }
            BOOL result = sub_1C86E297C((void *)a2, v15);
            if (result)
            {
              BOOL result = sub_1C86E2170(a1, (void *)a2, 0xCu);
              if (result)
              {
                uint64_t v16 = *a1;
                uint64_t v17 = -v16;
                dispatch_source_t v18 = (unsigned __int16 *)((char *)a1 - v16);
                if (*v18 >= 0xDu)
                {
                  uint64_t v19 = v18[6];
                  if (v19)
                  {
                    BOOL result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19)), 4uLL, 0);
                    if (!result) {
                      return result;
                    }
                    uint64_t v17 = -(uint64_t)*a1;
                  }
                }
                unsigned int v20 = (unsigned __int16 *)((char *)a1 + v17);
                if (*v20 >= 0xDu && (uint64_t v21 = v20[6]) != 0) {
                  uint64_t v22 = (int *)((char *)a1 + v21 + *(unsigned int *)((char *)a1 + v21));
                }
                else {
                  uint64_t v22 = 0;
                }
                BOOL result = sub_1C86E29F8(a2, v22);
                if (result)
                {
                  BOOL result = sub_1C86E2170(a1, (void *)a2, 0xEu);
                  if (result)
                  {
                    int v23 = (unsigned __int16 *)((char *)a1 - *a1);
                    if (*v23 < 0xFu
                      || (uint64_t v24 = v23[7]) == 0
                      || (BOOL result = sub_1C86E2BBC((int *)((char *)a1 + v24 + *(unsigned int *)((char *)a1 + v24)), a2)))
                    {
                      --*(_DWORD *)(a2 + 16);
                      return 1;
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
  return result;
}

BOOL sub_1C86E297C(void *a1, unsigned int *a2)
{
  if (!a2) {
    return 1;
  }
  unint64_t v6 = 0;
  BOOL result = sub_1C86E2378((uint64_t)a1, a2, 1uLL, &v6);
  if (result)
  {
    unint64_t v4 = a1[1];
    return v4 >= 2 && v4 - 1 >= v6 && *(unsigned char *)(*a1 + v6) == 0;
  }
  return result;
}

BOOL sub_1C86E29F8(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    BOOL result = sub_1C86E2A74((int *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C86E2A74(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, unint64_t v7 = *(void *)(a2 + 8), v7 >= 9) && v7 - 8 >= (unint64_t)a1 + v5[2] - *(void *)a2)
      && (v6 < 7
       || (!v5[3]
        || (result = 0, unint64_t v8 = *(void *)(a2 + 8), v8 >= 9) && v8 - 8 >= (unint64_t)a1 + v5[3] - *(void *)a2)
       && (v6 < 9
        || (uint64_t v9 = v5[4]) == 0
        || (result = 0, unint64_t v10 = *(void *)(a2 + 8), v10 >= 9) && v10 - 8 >= (unint64_t)a1 + v9 - *(void *)a2)))
    {
      BOOL result = sub_1C86E2170(a1, (void *)a2, 0xAu);
      if (result)
      {
        uint64_t v11 = (unsigned __int16 *)((char *)a1 - *a1);
        if (*v11 < 0xBu
          || (uint64_t v12 = v11[5]) == 0
          || (BOOL result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v12 + *(unsigned int *)((char *)a1 + v12)), 1uLL, 0)))
        {
          --*(_DWORD *)(a2 + 16);
          return 1;
        }
      }
    }
  }
  return result;
}

BOOL sub_1C86E2BBC(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, unint64_t v7 = *(void *)(a2 + 8), v7 >= 9) && v7 - 8 >= (unint64_t)a1 + v5[2] - *(void *)a2)
      && (v6 < 7
       || (uint64_t v8 = v5[3]) == 0
       || (BOOL result = 0, v9 = *(void *)(a2 + 8), v9 >= 9) && v9 - 8 >= (unint64_t)a1 + v8 - *(void *)a2))
    {
      --*(_DWORD *)(a2 + 16);
      return 1;
    }
  }
  return result;
}

BOOL sub_1C86E2C7C(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    BOOL result = sub_1C86E2170(a1, (void *)a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = sub_1C86E297C((void *)a2, v7);
      if (result)
      {
        BOOL result = sub_1C86E2170(a1, (void *)a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (unsigned int *)((char *)a1 + v9 + *(unsigned int *)((char *)a1 + v9));
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = sub_1C86E297C((void *)a2, v10);
          if (result)
          {
            uint64_t v11 = (unsigned __int16 *)((char *)a1 - *a1);
            unsigned int v12 = *v11;
            if (v12 < 9
              || (!v11[4]
               || (result = 0, unint64_t v13 = *(void *)(a2 + 8), v13 >= 9)
               && v13 - 8 >= (unint64_t)a1 + v11[4] - *(void *)a2)
              && (v12 < 0xB
               || (uint64_t v14 = v11[5]) == 0
               || (BOOL result = 0, v15 = *(void *)(a2 + 8), v15 >= 9)
               && v15 - 8 >= (unint64_t)a1 + v14 - *(void *)a2))
            {
              BOOL result = sub_1C86E2170(a1, (void *)a2, 0xCu);
              if (result)
              {
                uint64_t v16 = (unsigned __int16 *)((char *)a1 - *a1);
                if (*v16 < 0xDu
                  || (uint64_t v17 = v16[6]) == 0
                  || (BOOL result = sub_1C86E3004((int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17)), a2)))
                {
                  BOOL result = sub_1C86E2170(a1, (void *)a2, 0xEu);
                  if (result)
                  {
                    dispatch_source_t v18 = (unsigned __int16 *)((char *)a1 - *a1);
                    if (*v18 >= 0xFu && (uint64_t v19 = v18[7]) != 0) {
                      unsigned int v20 = (unsigned int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19));
                    }
                    else {
                      unsigned int v20 = 0;
                    }
                    BOOL result = sub_1C86E297C((void *)a2, v20);
                    if (result)
                    {
                      BOOL result = sub_1C86E2170(a1, (void *)a2, 0x10u);
                      if (result)
                      {
                        uint64_t v21 = (unsigned __int16 *)((char *)a1 - *a1);
                        if (*v21 >= 0x11u && (uint64_t v22 = v21[8]) != 0) {
                          int v23 = (unsigned int *)((char *)a1 + v22 + *(unsigned int *)((char *)a1 + v22));
                        }
                        else {
                          int v23 = 0;
                        }
                        BOOL result = sub_1C86E297C((void *)a2, v23);
                        if (result)
                        {
                          BOOL result = sub_1C86E2170(a1, (void *)a2, 0x12u);
                          if (result)
                          {
                            uint64_t v24 = (unsigned __int16 *)((char *)a1 - *a1);
                            if (*v24 >= 0x13u && (uint64_t v25 = v24[9]) != 0) {
                              uint64_t v26 = (unsigned int *)((char *)a1 + v25 + *(unsigned int *)((char *)a1 + v25));
                            }
                            else {
                              uint64_t v26 = 0;
                            }
                            BOOL result = sub_1C86E297C((void *)a2, v26);
                            if (result)
                            {
                              BOOL result = sub_1C86E2170(a1, (void *)a2, 0x14u);
                              if (result)
                              {
                                unsigned int v27 = (unsigned __int16 *)((char *)a1 - *a1);
                                if (*v27 >= 0x15u && (uint64_t v28 = v27[10]) != 0) {
                                  uint64_t v29 = (unsigned int *)((char *)a1 + v28 + *(unsigned int *)((char *)a1 + v28));
                                }
                                else {
                                  uint64_t v29 = 0;
                                }
                                BOOL result = sub_1C86E297C((void *)a2, v29);
                                if (result)
                                {
                                  BOOL result = sub_1C86E2170(a1, (void *)a2, 0x16u);
                                  if (result)
                                  {
                                    uint64_t v30 = (unsigned __int16 *)((char *)a1 - *a1);
                                    if (*v30 >= 0x17u && (uint64_t v31 = v30[11]) != 0) {
                                      unsigned int v32 = (unsigned int *)((char *)a1 + v31 + *(unsigned int *)((char *)a1 + v31));
                                    }
                                    else {
                                      unsigned int v32 = 0;
                                    }
                                    BOOL result = sub_1C86E297C((void *)a2, v32);
                                    if (result)
                                    {
                                      BOOL result = sub_1C86E2170(a1, (void *)a2, 0x18u);
                                      if (result)
                                      {
                                        unsigned int v33 = (unsigned __int16 *)((char *)a1 - *a1);
                                        if (*v33 >= 0x19u && (uint64_t v34 = v33[12]) != 0) {
                                          uint64_t v35 = (unsigned int *)((char *)a1 + v34 + *(unsigned int *)((char *)a1 + v34));
                                        }
                                        else {
                                          uint64_t v35 = 0;
                                        }
                                        BOOL result = sub_1C86E297C((void *)a2, v35);
                                        if (result)
                                        {
                                          --*(_DWORD *)(a2 + 16);
                                          return 1;
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
        }
      }
    }
  }
  return result;
}

BOOL sub_1C86E3004(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, unint64_t v7 = *(void *)(a2 + 8), v7 >= 5) && v7 - 4 >= (unint64_t)a1 + v5[2] - *(void *)a2)
      && (v6 < 7
       || (!v5[3]
        || (result = 0, unint64_t v8 = *(void *)(a2 + 8), v8 >= 5) && v8 - 4 >= (unint64_t)a1 + v5[3] - *(void *)a2)
       && (v6 < 9
        || (uint64_t v9 = v5[4]) == 0
        || (result = 0, unint64_t v10 = *(void *)(a2 + 8), v10 >= 5) && v10 - 4 >= (unint64_t)a1 + v9 - *(void *)a2)))
    {
      --*(_DWORD *)(a2 + 16);
      return 1;
    }
  }
  return result;
}

BOOL sub_1C86E30FC(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    BOOL result = sub_1C86E2170(a1, (void *)a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = sub_1C86E297C((void *)a2, v7);
      if (result)
      {
        BOOL result = sub_1C86E2170(a1, (void *)a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (unsigned int *)((char *)a1 + v9 + *(unsigned int *)((char *)a1 + v9));
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = sub_1C86E297C((void *)a2, v10);
          if (result)
          {
            uint64_t v11 = (unsigned __int16 *)((char *)a1 - *a1);
            unsigned int v12 = *v11;
            if (v12 < 9
              || (!v11[4]
               || (result = 0, unint64_t v13 = *(void *)(a2 + 8), v13 >= 9)
               && v13 - 8 >= (unint64_t)a1 + v11[4] - *(void *)a2)
              && (v12 < 0xB
               || (uint64_t v14 = v11[5]) == 0
               || (BOOL result = 0, v15 = *(void *)(a2 + 8), v15 >= 9)
               && v15 - 8 >= (unint64_t)a1 + v14 - *(void *)a2))
            {
              BOOL result = sub_1C86E2170(a1, (void *)a2, 0xCu);
              if (result)
              {
                uint64_t v16 = (unsigned __int16 *)((char *)a1 - *a1);
                if (*v16 < 0xDu
                  || (uint64_t v17 = v16[6]) == 0
                  || (BOOL result = sub_1C86E3004((int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17)), a2)))
                {
                  BOOL result = sub_1C86E2170(a1, (void *)a2, 0xEu);
                  if (result)
                  {
                    dispatch_source_t v18 = (unsigned __int16 *)((char *)a1 - *a1);
                    if (*v18 >= 0xFu && (uint64_t v19 = v18[7]) != 0) {
                      unsigned int v20 = (unsigned int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19));
                    }
                    else {
                      unsigned int v20 = 0;
                    }
                    BOOL result = sub_1C86E297C((void *)a2, v20);
                    if (result)
                    {
                      BOOL result = sub_1C86E2170(a1, (void *)a2, 0x10u);
                      if (result)
                      {
                        uint64_t v21 = (unsigned __int16 *)((char *)a1 - *a1);
                        if (*v21 >= 0x11u && (uint64_t v22 = v21[8]) != 0) {
                          int v23 = (unsigned int *)((char *)a1 + v22 + *(unsigned int *)((char *)a1 + v22));
                        }
                        else {
                          int v23 = 0;
                        }
                        BOOL result = sub_1C86E297C((void *)a2, v23);
                        if (result)
                        {
                          BOOL result = sub_1C86E2170(a1, (void *)a2, 0x12u);
                          if (result)
                          {
                            uint64_t v24 = (unsigned __int16 *)((char *)a1 - *a1);
                            if (*v24 >= 0x13u && (uint64_t v25 = v24[9]) != 0) {
                              uint64_t v26 = (unsigned int *)((char *)a1 + v25 + *(unsigned int *)((char *)a1 + v25));
                            }
                            else {
                              uint64_t v26 = 0;
                            }
                            BOOL result = sub_1C86E297C((void *)a2, v26);
                            if (result)
                            {
                              unsigned int v27 = (unsigned __int16 *)((char *)a1 - *a1);
                              if (*v27 < 0x15u
                                || (uint64_t v28 = v27[10]) == 0
                                || (result = 0, unint64_t v29 = *(void *)(a2 + 8), v29 >= 9)
                                && v29 - 8 >= (unint64_t)a1 + v28 - *(void *)a2)
                              {
                                --*(_DWORD *)(a2 + 16);
                                return 1;
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
  return result;
}

uint64_t sub_1C86E33D8(int *a1, uint64_t a2)
{
  uint64_t result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (!result) {
    return result;
  }
  unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v5 >= 5u)
  {
    uint64_t v6 = v5[2];
    if (v6)
    {
      uint64_t result = 0;
      unint64_t v7 = *(void *)(a2 + 8);
      if (v7 < 2 || v7 - 1 < (unint64_t)a1 + v6 - *(void *)a2) {
        return result;
      }
    }
  }
  uint64_t result = sub_1C86E2170(a1, (void *)a2, 6u);
  if (!result) {
    return result;
  }
  unint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
  unsigned int v9 = *v8;
  if (v9 >= 7)
  {
    if (v8[3])
    {
      unint64_t v10 = (int *)((char *)a1 + v8[3] + *(unsigned int *)((char *)a1 + v8[3]));
LABEL_12:
      uint64_t v11 = v8[2];
      if (v11)
      {
        if (v10)
        {
          if (*((unsigned char *)a1 + v11) == 1)
          {
            uint64_t result = sub_1C86E2C7C(v10, a2);
            if (!result) {
              return result;
            }
          }
        }
      }
      goto LABEL_16;
    }
LABEL_11:
    unint64_t v10 = 0;
    goto LABEL_12;
  }
  if (v9 >= 5) {
    goto LABEL_11;
  }
LABEL_16:
  uint64_t result = sub_1C86E2170(a1, (void *)a2, 8u);
  if (!result) {
    return result;
  }
  uint64_t v12 = *a1;
  uint64_t v13 = -v12;
  uint64_t v14 = (unsigned __int16 *)((char *)a1 - v12);
  if (*v14 >= 9u)
  {
    uint64_t v15 = v14[4];
    if (v15)
    {
      uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v15 + *(unsigned int *)((char *)a1 + v15)), 4uLL, 0);
      if (!result) {
        return result;
      }
      uint64_t v13 = -(uint64_t)*a1;
    }
  }
  uint64_t v16 = (unsigned __int16 *)((char *)a1 + v13);
  if (*v16 >= 9u && (uint64_t v17 = v16[4]) != 0) {
    dispatch_source_t v18 = (int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17));
  }
  else {
    dispatch_source_t v18 = 0;
  }
  uint64_t result = sub_1C86E3650(a2, v18);
  if (result)
  {
    uint64_t v19 = (unsigned __int16 *)((char *)a1 - *a1);
    unsigned int v20 = *v19;
    if (v20 < 0xB) {
      goto LABEL_42;
    }
    if (!v19[5]
      || (result = 0, unint64_t v21 = *(void *)(a2 + 8), v21 >= 9) && v21 - 8 >= (unint64_t)a1 + v19[5] - *(void *)a2)
    {
      if (v20 < 0xD
        || (!v19[6]
         || (result = 0, unint64_t v22 = *(void *)(a2 + 8), v22 >= 2)
         && v22 - 1 >= (unint64_t)a1 + v19[6] - *(void *)a2)
        && (v20 < 0xF
         || (!v19[7]
          || (result = 0, unint64_t v23 = *(void *)(a2 + 8), v23 >= 2)
          && v23 - 1 >= (unint64_t)a1 + v19[7] - *(void *)a2)
         && (v20 < 0x11
          || (uint64_t v24 = v19[8]) == 0
          || (result = 0, unint64_t v25 = *(void *)(a2 + 8), v25 >= 5)
          && v25 - 4 >= (unint64_t)a1 + v24 - *(void *)a2)))
      {
LABEL_42:
        --*(_DWORD *)(a2 + 16);
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_1C86E3650(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    uint64_t result = sub_1C86E36CC((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t sub_1C86E36CC(int *a1, uint64_t a2)
{
  uint64_t result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    uint64_t result = sub_1C86E2170(a1, (void *)a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      }
      else {
        unint64_t v7 = 0;
      }
      uint64_t result = sub_1C86E297C((void *)a2, v7);
      if (result)
      {
        unint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
        unsigned int v9 = *v8;
        if (v9 < 7
          || (!v8[3]
           || (result = 0, unint64_t v10 = *(void *)(a2 + 8), v10 >= 9)
           && v10 - 8 >= (unint64_t)a1 + v8[3] - *(void *)a2)
          && (v9 < 9
           || (uint64_t v11 = v8[4]) == 0
           || (result = 0, unint64_t v12 = *(void *)(a2 + 8), v12 >= 9)
           && v12 - 8 >= (unint64_t)a1 + v11 - *(void *)a2))
        {
          uint64_t result = sub_1C86E2170(a1, (void *)a2, 0xAu);
          if (result)
          {
            uint64_t v13 = *a1;
            uint64_t v14 = -v13;
            uint64_t v15 = (unsigned __int16 *)((char *)a1 - v13);
            if (*v15 >= 0xBu)
            {
              uint64_t v16 = v15[5];
              if (v16)
              {
                uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v16 + *(unsigned int *)((char *)a1 + v16)), 4uLL, 0);
                if (!result) {
                  return result;
                }
                uint64_t v14 = -(uint64_t)*a1;
              }
            }
            uint64_t v17 = (unsigned __int16 *)((char *)a1 + v14);
            if (*v17 >= 0xBu && (uint64_t v18 = v17[5]) != 0) {
              uint64_t v19 = (int *)((char *)a1 + v18 + *(unsigned int *)((char *)a1 + v18));
            }
            else {
              uint64_t v19 = 0;
            }
            uint64_t result = sub_1C86E3B70(a2, v19);
            if (result)
            {
              uint64_t result = sub_1C86E2170(a1, (void *)a2, 0xCu);
              if (result)
              {
                uint64_t v20 = *a1;
                uint64_t v21 = -v20;
                unint64_t v22 = (unsigned __int16 *)((char *)a1 - v20);
                if (*v22 >= 0xDu)
                {
                  uint64_t v23 = v22[6];
                  if (v23)
                  {
                    uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v23 + *(unsigned int *)((char *)a1 + v23)), 1uLL, 0);
                    if (!result) {
                      return result;
                    }
                    uint64_t v21 = -(uint64_t)*a1;
                  }
                }
                uint64_t v24 = (unsigned __int16 *)((char *)a1 + v21);
                unsigned int v25 = *v24;
                if (v25 < 0xF) {
                  goto LABEL_80;
                }
                if (!v24[7]
                  || (result = 0, unint64_t v26 = *(void *)(a2 + 8), v26 >= 9)
                  && v26 - 8 >= (unint64_t)a1 + v24[7] - *(void *)a2)
                {
                  if (v25 < 0x11
                    || (!v24[8]
                     || (result = 0, unint64_t v27 = *(void *)(a2 + 8), v27 >= 2)
                     && v27 - 1 >= (unint64_t)a1 + v24[8] - *(void *)a2)
                    && (v25 < 0x13
                     || (!v24[9]
                      || (uint64_t result = 0, v28 = *(void *)(a2 + 8), v28 >= 2)
                      && v28 - 1 >= (unint64_t)a1 + v24[9] - *(void *)a2)
                     && (v25 < 0x15
                      || (uint64_t v29 = v24[10]) == 0
                      || (result = 0, unint64_t v30 = *(void *)(a2 + 8), v30 >= 2)
                      && v30 - 1 >= (unint64_t)a1 + v29 - *(void *)a2)))
                  {
LABEL_80:
                    uint64_t result = sub_1C86E2170(a1, (void *)a2, 0x16u);
                    if (result)
                    {
                      uint64_t v31 = *a1;
                      uint64_t v32 = -v31;
                      unsigned int v33 = (unsigned __int16 *)((char *)a1 - v31);
                      if (*v33 >= 0x17u)
                      {
                        uint64_t v34 = v33[11];
                        if (v34)
                        {
                          uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v34 + *(unsigned int *)((char *)a1 + v34)), 4uLL, 0);
                          if (!result) {
                            return result;
                          }
                          uint64_t v32 = -(uint64_t)*a1;
                        }
                      }
                      uint64_t v35 = (unsigned __int16 *)((char *)a1 + v32);
                      if (*v35 >= 0x17u && (uint64_t v36 = v35[11]) != 0) {
                        unint64_t v37 = (int *)((char *)a1 + v36 + *(unsigned int *)((char *)a1 + v36));
                      }
                      else {
                        unint64_t v37 = 0;
                      }
                      uint64_t result = sub_1C86E3BEC(a2, v37);
                      if (result)
                      {
                        uint64_t result = sub_1C86E2170(a1, (void *)a2, 0x18u);
                        if (result)
                        {
                          uint64_t v38 = *a1;
                          uint64_t v39 = -v38;
                          int v40 = (unsigned __int16 *)((char *)a1 - v38);
                          if (*v40 >= 0x19u)
                          {
                            uint64_t v41 = v40[12];
                            if (v41)
                            {
                              uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v41 + *(unsigned int *)((char *)a1 + v41)), 4uLL, 0);
                              if (!result) {
                                return result;
                              }
                              uint64_t v39 = -(uint64_t)*a1;
                            }
                          }
                          int v42 = (unsigned __int16 *)((char *)a1 + v39);
                          if (*v42 >= 0x19u && (uint64_t v43 = v42[12]) != 0) {
                            uint64_t v44 = (int *)((char *)a1 + v43 + *(unsigned int *)((char *)a1 + v43));
                          }
                          else {
                            uint64_t v44 = 0;
                          }
                          uint64_t result = sub_1C86E3C68(a2, v44);
                          if (result)
                          {
                            uint64_t result = sub_1C86E2170(a1, (void *)a2, 0x1Au);
                            if (result)
                            {
                              uint64_t v45 = *a1;
                              uint64_t v46 = -v45;
                              uint64_t v47 = (unsigned __int16 *)((char *)a1 - v45);
                              if (*v47 >= 0x1Bu)
                              {
                                uint64_t v48 = v47[13];
                                if (v48)
                                {
                                  uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v48 + *(unsigned int *)((char *)a1 + v48)), 4uLL, 0);
                                  if (!result) {
                                    return result;
                                  }
                                  uint64_t v46 = -(uint64_t)*a1;
                                }
                              }
                              uint64_t v49 = (unsigned __int16 *)((char *)a1 + v46);
                              if (*v49 >= 0x1Bu && (uint64_t v50 = v49[13]) != 0) {
                                uint64_t v51 = (int *)((char *)a1 + v50 + *(unsigned int *)((char *)a1 + v50));
                              }
                              else {
                                uint64_t v51 = 0;
                              }
                              uint64_t result = sub_1C86E3C68(a2, v51);
                              if (result)
                              {
                                --*(_DWORD *)(a2 + 16);
                                return 1;
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
  return result;
}

uint64_t sub_1C86E3B70(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    uint64_t result = sub_1C86E3CE4((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C86E3BEC(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    BOOL result = sub_1C86E4530((int *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t sub_1C86E3C68(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    uint64_t result = sub_1C86E4690((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t sub_1C86E3CE4(int *a1, uint64_t a2)
{
  uint64_t result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, unint64_t v7 = *(void *)(a2 + 8), v7 >= 9) && v7 - 8 >= (unint64_t)a1 + v5[2] - *(void *)a2)
      && (v6 < 7
       || (uint64_t v8 = v5[3]) == 0
       || (uint64_t result = 0, v9 = *(void *)(a2 + 8), v9 >= 9) && v9 - 8 >= (unint64_t)a1 + v8 - *(void *)a2))
    {
      uint64_t result = sub_1C86E2170(a1, (void *)a2, 8u);
      if (result)
      {
        unint64_t v10 = (unsigned __int16 *)((char *)a1 - *a1);
        if (*v10 >= 9u && (uint64_t v11 = v10[4]) != 0) {
          unint64_t v12 = (unsigned int *)((char *)a1 + v11 + *(unsigned int *)((char *)a1 + v11));
        }
        else {
          unint64_t v12 = 0;
        }
        uint64_t result = sub_1C86E297C((void *)a2, v12);
        if (result)
        {
          uint64_t result = sub_1C86E2170(a1, (void *)a2, 0xAu);
          if (result)
          {
            uint64_t v13 = (unsigned __int16 *)((char *)a1 - *a1);
            if (*v13 >= 0xBu && (uint64_t v14 = v13[5]) != 0) {
              uint64_t v15 = (unsigned int *)((char *)a1 + v14 + *(unsigned int *)((char *)a1 + v14));
            }
            else {
              uint64_t v15 = 0;
            }
            uint64_t result = sub_1C86E297C((void *)a2, v15);
            if (result)
            {
              uint64_t result = sub_1C86E2170(a1, (void *)a2, 0xCu);
              if (result)
              {
                uint64_t v16 = *a1;
                uint64_t v17 = -v16;
                uint64_t v18 = (unsigned __int16 *)((char *)a1 - v16);
                if (*v18 >= 0xDu)
                {
                  uint64_t v19 = v18[6];
                  if (v19)
                  {
                    uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19)), 4uLL, 0);
                    if (!result) {
                      return result;
                    }
                    uint64_t v17 = -(uint64_t)*a1;
                  }
                }
                uint64_t v20 = (unsigned __int16 *)((char *)a1 + v17);
                if (*v20 >= 0xDu && (uint64_t v21 = v20[6]) != 0) {
                  unint64_t v22 = (int *)((char *)a1 + v21 + *(unsigned int *)((char *)a1 + v21));
                }
                else {
                  unint64_t v22 = 0;
                }
                uint64_t result = sub_1C86E4000(a2, v22);
                if (result)
                {
                  uint64_t result = sub_1C86E2170(a1, (void *)a2, 0xEu);
                  if (result)
                  {
                    uint64_t v23 = (unsigned __int16 *)((char *)a1 - *a1);
                    if (*v23 < 0xFu
                      || (uint64_t v24 = v23[7]) == 0
                      || (uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v24 + *(unsigned int *)((char *)a1 + v24)), 1uLL, 0), result))
                    {
                      uint64_t result = sub_1C86E2170(a1, (void *)a2, 0x10u);
                      if (result)
                      {
                        uint64_t v25 = *a1;
                        uint64_t v26 = -v25;
                        unint64_t v27 = (unsigned __int16 *)((char *)a1 - v25);
                        if (*v27 >= 0x11u)
                        {
                          uint64_t v28 = v27[8];
                          if (v28)
                          {
                            uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v28 + *(unsigned int *)((char *)a1 + v28)), 4uLL, 0);
                            if (!result) {
                              return result;
                            }
                            uint64_t v26 = -(uint64_t)*a1;
                          }
                        }
                        uint64_t v29 = (unsigned __int16 *)((char *)a1 + v26);
                        if (*v29 >= 0x11u && (uint64_t v30 = v29[8]) != 0) {
                          uint64_t v31 = (int *)((char *)a1 + v30 + *(unsigned int *)((char *)a1 + v30));
                        }
                        else {
                          uint64_t v31 = 0;
                        }
                        uint64_t result = sub_1C86E407C(a2, v31);
                        if (result)
                        {
                          uint64_t v32 = (unsigned __int16 *)((char *)a1 - *a1);
                          if (*v32 < 0x13u
                            || (uint64_t v33 = v32[9]) == 0
                            || (result = 0, unint64_t v34 = *(void *)(a2 + 8), v34 >= 9)
                            && v34 - 8 >= (unint64_t)a1 + v33 - *(void *)a2)
                          {
                            --*(_DWORD *)(a2 + 16);
                            return 1;
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
  return result;
}

BOOL sub_1C86E4000(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    BOOL result = sub_1C86E40F8((int *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t sub_1C86E407C(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    uint64_t result = sub_1C86E42B0((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C86E40F8(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    BOOL result = sub_1C86E2170(a1, (void *)a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = sub_1C86E297C((void *)a2, v7);
      if (result)
      {
        uint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
        unsigned int v9 = *v8;
        if (v9 < 7) {
          goto LABEL_28;
        }
        if (!v8[3]
          || (result = 0, unint64_t v10 = *(void *)(a2 + 8), v10 >= 5)
          && v10 - 4 >= (unint64_t)a1 + v8[3] - *(void *)a2)
        {
          if (v9 < 9) {
            goto LABEL_28;
          }
          if (!v8[4]
            || (BOOL result = 0, v11 = *(void *)(a2 + 8), v11 >= 5)
            && v11 - 4 >= (unint64_t)a1 + v8[4] - *(void *)a2)
          {
            if (v9 < 0xB
              || (!v8[5]
               || (result = 0, unint64_t v12 = *(void *)(a2 + 8), v12 >= 5)
               && v12 - 4 >= (unint64_t)a1 + v8[5] - *(void *)a2)
              && (v9 < 0xD
               || (!v8[6]
                || (result = 0, unint64_t v13 = *(void *)(a2 + 8), v13 >= 9)
                && v13 - 8 >= (unint64_t)a1 + v8[6] - *(void *)a2)
               && (v9 < 0xF
                || (uint64_t v14 = v8[7]) == 0
                || (BOOL result = 0, v15 = *(void *)(a2 + 8), v15 >= 5)
                && v15 - 4 >= (unint64_t)a1 + v14 - *(void *)a2)))
            {
LABEL_28:
              --*(_DWORD *)(a2 + 16);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C86E42B0(int *a1, uint64_t a2)
{
  uint64_t result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, unint64_t v7 = *(void *)(a2 + 8), v7 >= 9) && v7 - 8 >= (unint64_t)a1 + v5[2] - *(void *)a2)
      && (v6 < 7
       || (uint64_t v8 = v5[3]) == 0
       || (uint64_t result = 0, v9 = *(void *)(a2 + 8), v9 >= 9) && v9 - 8 >= (unint64_t)a1 + v8 - *(void *)a2))
    {
      uint64_t result = sub_1C86E2170(a1, (void *)a2, 8u);
      if (result)
      {
        unint64_t v10 = (unsigned __int16 *)((char *)a1 - *a1);
        if (*v10 >= 9u && (uint64_t v11 = v10[4]) != 0) {
          unint64_t v12 = (unsigned int *)((char *)a1 + v11 + *(unsigned int *)((char *)a1 + v11));
        }
        else {
          unint64_t v12 = 0;
        }
        uint64_t result = sub_1C86E297C((void *)a2, v12);
        if (result)
        {
          uint64_t result = sub_1C86E2170(a1, (void *)a2, 0xAu);
          if (result)
          {
            unint64_t v13 = (unsigned __int16 *)((char *)a1 - *a1);
            if (*v13 >= 0xBu && (uint64_t v14 = v13[5]) != 0) {
              unint64_t v15 = (unsigned int *)((char *)a1 + v14 + *(unsigned int *)((char *)a1 + v14));
            }
            else {
              unint64_t v15 = 0;
            }
            uint64_t result = sub_1C86E297C((void *)a2, v15);
            if (result)
            {
              uint64_t result = sub_1C86E2170(a1, (void *)a2, 0xCu);
              if (result)
              {
                uint64_t v16 = (unsigned __int16 *)((char *)a1 - *a1);
                if (*v16 < 0xDu
                  || (uint64_t v17 = v16[6]) == 0
                  || (uint64_t result = sub_1C86E40F8((int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17)), a2),
                      result))
                {
                  uint64_t result = sub_1C86E2170(a1, (void *)a2, 0xEu);
                  if (result)
                  {
                    uint64_t v18 = *a1;
                    uint64_t v19 = -v18;
                    uint64_t v20 = (unsigned __int16 *)((char *)a1 - v18);
                    if (*v20 >= 0xFu)
                    {
                      uint64_t v21 = v20[7];
                      if (v21)
                      {
                        uint64_t result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v21 + *(unsigned int *)((char *)a1 + v21)), 4uLL, 0);
                        if (!result) {
                          return result;
                        }
                        uint64_t v19 = -(uint64_t)*a1;
                      }
                    }
                    unint64_t v22 = (unsigned __int16 *)((char *)a1 + v19);
                    if (*v22 >= 0xFu && (uint64_t v23 = v22[7]) != 0) {
                      uint64_t v24 = (char *)a1 + v23 + *(unsigned int *)((char *)a1 + v23);
                    }
                    else {
                      uint64_t v24 = 0;
                    }
                    uint64_t result = sub_1C86E407C(a2, v24);
                    if (result)
                    {
                      uint64_t v25 = (unsigned __int16 *)((char *)a1 - *a1);
                      if (*v25 < 0x11u
                        || (uint64_t v26 = v25[8]) == 0
                        || (result = 0, unint64_t v27 = *(void *)(a2 + 8), v27 >= 9)
                        && v27 - 8 >= (unint64_t)a1 + v26 - *(void *)a2)
                      {
                        --*(_DWORD *)(a2 + 16);
                        return 1;
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
  return result;
}

BOOL sub_1C86E4530(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    BOOL result = sub_1C86E2170(a1, (void *)a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = sub_1C86E297C((void *)a2, v7);
      if (result)
      {
        uint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
        unsigned int v9 = *v8;
        if (v9 < 7
          || (!v8[3]
           || (result = 0, unint64_t v10 = *(void *)(a2 + 8), v10 >= 9)
           && v10 - 8 >= (unint64_t)a1 + v8[3] - *(void *)a2)
          && (v9 < 9
           || (uint64_t v11 = v8[4]) == 0
           || (result = 0, unint64_t v12 = *(void *)(a2 + 8), v12 >= 9)
           && v12 - 8 >= (unint64_t)a1 + v11 - *(void *)a2))
        {
          BOOL result = sub_1C86E2170(a1, (void *)a2, 0xAu);
          if (result)
          {
            unint64_t v13 = (unsigned __int16 *)((char *)a1 - *a1);
            if (*v13 < 0xBu
              || (uint64_t v14 = v13[5]) == 0
              || (BOOL result = sub_1C86E2378(a2, (unsigned int *)((char *)a1 + v14 + *(unsigned int *)((char *)a1 + v14)), 1uLL, 0)))
            {
              --*(_DWORD *)(a2 + 16);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C86E4690(int *a1, uint64_t a2)
{
  uint64_t result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    uint64_t result = sub_1C86E476C(a1, (void *)a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      }
      else {
        unint64_t v7 = 0;
      }
      uint64_t result = sub_1C86E297C((void *)a2, v7);
      if (result)
      {
        uint64_t result = sub_1C86E2170(a1, (void *)a2, 6u);
        if (result)
        {
          uint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
          if (*v8 < 7u
            || (uint64_t v9 = v8[3]) == 0
            || (uint64_t result = sub_1C86E3CE4((int *)((char *)a1 + v9 + *(unsigned int *)((char *)a1 + v9)), a2), result))
          {
            --*(_DWORD *)(a2 + 16);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1C86E476C(int *a1, void *a2, unsigned int a3)
{
  unint64_t v3 = (unsigned __int16 *)((char *)a1 - *a1);
  return *v3 > a3
      && (uint64_t v4 = *(unsigned __int16 *)((char *)v3 + a3)) != 0
      && sub_1C86E1FB4((uint64_t)a2, (unint64_t)a1 + v4 - *a2) != 0;
}

BOOL sub_1C86E47C4(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
    if (*v5 < 5u
      || (uint64_t v6 = v5[2]) == 0
      || (result = 0, unint64_t v7 = *(void *)(a2 + 8), v7 >= 2) && v7 - 1 >= (unint64_t)a1 + v6 - *(void *)a2)
    {
      BOOL result = sub_1C86E2170(a1, (void *)a2, 6u);
      if (result)
      {
        uint64_t v8 = *a1;
        uint64_t v9 = -v8;
        unint64_t v10 = (unsigned __int16 *)((char *)a1 - v8);
        unsigned int v11 = *v10;
        if (v11 < 7)
        {
          if (v11 < 5)
          {
LABEL_17:
            uint64_t v14 = (unsigned __int16 *)((char *)a1 + v9);
            if (*v14 < 9u
              || (uint64_t v15 = v14[4]) == 0
              || (result = 0, unint64_t v16 = *(void *)(a2 + 8), v16 >= 9)
              && v16 - 8 >= (unint64_t)a1 + v15 - *(void *)a2)
            {
              --*(_DWORD *)(a2 + 16);
              return 1;
            }
            return result;
          }
        }
        else if (v10[3])
        {
          unint64_t v12 = (int *)((char *)a1 + v10[3] + *(unsigned int *)((char *)a1 + v10[3]));
LABEL_12:
          uint64_t v13 = v10[2];
          if (v13 && v12 && *((unsigned char *)a1 + v13) == 1)
          {
            BOOL result = sub_1C86E30FC(v12, a2);
            if (!result) {
              return result;
            }
            uint64_t v9 = -(uint64_t)*a1;
          }
          goto LABEL_17;
        }
        unint64_t v12 = 0;
        goto LABEL_12;
      }
    }
  }
  return result;
}

BOOL sub_1C86E4908(int *a1, uint64_t a2)
{
  BOOL result = sub_1C86E22C0((uint64_t *)a2, a1);
  if (result)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)a1 - *a1);
    if (*v5 < 5u
      || (uint64_t v6 = v5[2]) == 0
      || (result = 0, unint64_t v7 = *(void *)(a2 + 8), v7 >= 5) && v7 - 4 >= (unint64_t)a1 + v6 - *(void *)a2)
    {
      BOOL result = sub_1C86E2170(a1, (void *)a2, 6u);
      if (result)
      {
        uint64_t v8 = (unsigned __int16 *)((char *)a1 - *a1);
        if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
          unint64_t v10 = (unsigned int *)((char *)a1 + v9 + *(unsigned int *)((char *)a1 + v9));
        }
        else {
          unint64_t v10 = 0;
        }
        BOOL result = sub_1C86E297C((void *)a2, v10);
        if (result)
        {
          --*(_DWORD *)(a2 + 16);
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C86E49E0()
{
  qword_1EA52E728 = [MEMORY[0x1E4F1CA60] dictionary];

  return MEMORY[0x1F41817F8]();
}

void sub_1C86E4A20(uint64_t a1)
{
  dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EA52E730);
  uint64_t v2 = (void *)qword_1EA52E728;
  unint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  int v5 = *__error();
  uint64_t v6 = sub_1C86DE154();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7) {
      sub_1C86F5C84();
    }

    *__error() = v5;
    uint64_t v8 = (void *)qword_1EA52E728;
    uint64_t v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    [v8 setObject:0 forKeyedSubscript:v9];
  }
  else
  {
    if (v7) {
      sub_1C86F5C08();
    }

    *__error() = v5;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EA52E730);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void sub_1C86E4B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C86E4B78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1C86E4BC0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_1C86E4BDC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

id tailspin_config_copy_description(uint64_t *a1, int a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a1 + 8204;
  uint64_t v5 = (void *)MEMORY[0x1C87CBD00]();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:4000];
  BOOL v7 = v6;
  int v8 = *((_DWORD *)a1 + 2);
  if (v8 == 3)
  {
    uint64_t v9 = @"tailspin configuration is enforced by profile\n\n";
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    uint64_t v9 = @"tailspin configuration is enforced by tasking\n\n";
LABEL_5:
    [v6 appendString:v9];
    int v10 = *((unsigned __int8 *)v4 + 156);
    unsigned int v11 = @"enabled";
    if (!v4[156]) {
      unsigned int v11 = @"disabled";
    }
    [v7 appendFormat:@"tailspin has been %@", v11];
    unint64_t v12 = @"\n";
LABEL_8:
    [v7 appendString:v12];
    if (!v10) {
      goto LABEL_101;
    }
LABEL_9:
    [v7 appendString:@"tailspin has been enabled with the following configurations:\n"];
    id v13 = v7;
    if (a2)
    {
      unsigned int v56 = -1;
      *(_OWORD *)__s1 = 0u;
      long long v58 = 0u;
      size_t __n = 32;
      size_t v54 = 4;
      if (sysctlbyname("ktrace.state", &v56, &v54, 0, 0))
      {
        int v14 = *__error();
        uint64_t v15 = sub_1C86DE154();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1C86F5DA0(v15);
        }

        *__error() = v14;
        [v13 appendFormat:@"Unable to get current ktrace state: %d\n", *__error(), v53];
      }
      else if (sysctlbyname("ktrace.configured_by", __s1, &__n, 0, 0))
      {
        int v19 = *__error();
        uint64_t v20 = sub_1C86DE154();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_1C86F5D00((int *)&v56, v20);
        }

        *__error() = v19;
        [v13 appendFormat:@"Unable to get current ktrace configured_by for state %d: %d\n", v56, *__error()];
      }
      else
      {
        [v13 appendString:@"\tkdebug status is: "];
        switch(v56)
        {
          case 0xFFFFFFFF:
            uint64_t v52 = @"unknown\n";
            goto LABEL_120;
          case 0u:
            [v13 appendString:@"uninitialized\n"];
            goto LABEL_33;
          case 1u:
            if (__n)
            {
              [v13 appendFormat:@"preempted [%s]\n", __s1, v53];
            }
            else
            {
              uint64_t v52 = @"preempted\n";
LABEL_120:
              [v13 appendString:v52];
            }
            break;
          case 2u:
            [v13 appendString:@"background\n"];
            if (__n && strncmp(__s1, "tailspind", __n)) {
              [v13 appendFormat:@"\tWARNING: there is another background tracing client: '%s'\n", __s1, v53];
            }
            break;
          default:
            break;
        }
      }
    }
    int v21 = *((_DWORD *)a1 + 2);
    [v13 appendFormat:@"\t    buffer size = %zu MB", a1[1030]];
    if ((v21 | 2) == 3)
    {
      unint64_t v22 = @"\n";
    }
    else
    {
      if ((*(unsigned char *)a1 & 2) != 0)
      {
        uint64_t v33 = v4 + 44;
        if (!v4[44]) {
          uint64_t v33 = "Unknown Process";
        }
        [v13 appendFormat:@" (overridden by %s)\n", v33];
LABEL_29:
        uint64_t v23 = (void *)MEMORY[0x1C87CC170]((char *)a1 + 12);
        [v13 appendFormat:@"\t    filter descriptor: %s", v23];
        if ((v21 | 2) == 3)
        {
          uint64_t v24 = @"\n";
        }
        else
        {
          if (*(unsigned char *)a1)
          {
            if (*v4) {
              unint64_t v34 = v4;
            }
            else {
              unint64_t v34 = "Unknown Process";
            }
            [v13 appendFormat:@" (overridden by %s)\n", v34];
            goto LABEL_32;
          }
          uint64_t v24 = @" (default behavior)\n";
        }
        [v13 appendString:v24];
LABEL_32:
        free(v23);
LABEL_33:

        [v13 appendString:@"\n"];
        id v25 = v13;
        int v26 = *((_DWORD *)a1 + 2);
        [v25 appendString:@"\tsampling:\n"];
        unint64_t v27 = a1[1040];
        unint64_t v28 = a1[1035];
        if (v27)
        {
          if (v27 >= 0x3B9ACA00)
          {
            float v29 = (float)v27 / 1000000000.0;
            uint64_t v31 = @"s";
          }
          else if (v27 >= 0xF4240)
          {
            float v29 = (float)v27 / 1000000.0;
            uint64_t v31 = @"ms";
          }
          else
          {
            float v29 = (float)v27;
            BOOL v30 = v27 >= 0x3E8;
            if (v27 >= 0x3E8) {
              float v29 = (float)v27 / 1000.0;
            }
            uint64_t v31 = @"µs";
            if (!v30) {
              uint64_t v31 = @"ns";
            }
          }
          [v25 appendFormat:@"\t    on-core sampling period        = %.2f %@", v29, v31];
        }
        else
        {
          uint64_t v32 = " (full-system includes on-core)";
          if (!v28) {
            uint64_t v32 = "";
          }
          [v25 appendFormat:@"\t    on-core sampling period        = disabled%s", v32, v53];
        }
        if ((v26 | 2) == 3)
        {
          uint64_t v35 = @"\n";
        }
        else
        {
          if ((*(unsigned char *)a1 & 0x10) != 0)
          {
            uint64_t v38 = v4 + 124;
            if (!v4[124]) {
              uint64_t v38 = "Unknown Process";
            }
            [v25 appendFormat:@" (overridden by %s)\n", v38];
            if (v28) {
              goto LABEL_63;
            }
            goto LABEL_74;
          }
          uint64_t v35 = @" (default behavior)\n";
        }
        [v25 appendString:v35];
        if (v28)
        {
LABEL_63:
          if (v28 >= 0x3B9ACA00)
          {
            float v36 = (float)v28 / 1000000000.0;
            unint64_t v37 = @"s";
          }
          else if (v28 >= 0xF4240)
          {
            float v36 = (float)v28 / 1000000.0;
            unint64_t v37 = @"ms";
          }
          else
          {
            float v36 = (float)v28;
            if (v28 >= 0x3E8) {
              float v36 = (float)v28 / 1000.0;
            }
            unint64_t v37 = @"µs";
            if (v28 < 0x3E8) {
              unint64_t v37 = @"ns";
            }
          }
          [v25 appendFormat:@"\t    full-system sampling period    = %.2f %@", v36, v37];
LABEL_77:
          if ((v26 | 2) == 3)
          {
            uint64_t v39 = @"\n";
          }
          else
          {
            if ((*(unsigned char *)a1 & 8) != 0)
            {
              uint64_t v48 = v4 + 84;
              if (!v4[84]) {
                uint64_t v48 = "Unknown Process";
              }
              [v25 appendFormat:@" (overridden by %s)\n", v48];
LABEL_82:

              id v40 = v25;
              int v41 = *((_DWORD *)a1 + 2);
              [v40 appendString:@"\t    sampling options               = "];
              int v42 = [MEMORY[0x1E4F28E78] string];
              uint64_t v43 = v42;
              int v44 = *((_DWORD *)a1 + 2099);
              if (v44)
              {
                [v42 appendString:@"cswitch-sampling"];
                int v44 = *((_DWORD *)a1 + 2099);
                if ((v44 & 2) == 0)
                {
LABEL_84:
                  if ((v44 & 4) == 0) {
                    goto LABEL_93;
                  }
                  goto LABEL_90;
                }
              }
              else if ((v44 & 2) == 0)
              {
                goto LABEL_84;
              }
              if ([v43 length]) {
                [v43 appendString:@","];
              }
              [v43 appendString:@"syscall-sampling"];
              if ((*((_DWORD *)a1 + 2099) & 4) == 0)
              {
LABEL_93:
                if (![v43 length]) {
                  [v43 appendString:@"none"];
                }
                [v40 appendString:v43];
                if ((v41 | 2) == 3)
                {
                  uint64_t v45 = @"\n";
                }
                else
                {
                  if ((*((unsigned char *)a1 + 8396) & 0x20) != 0)
                  {
                    int v50 = *((unsigned __int8 *)v4 + 196);
                    uint64_t v49 = v4 + 196;
                    if (v50) {
                      uint64_t v51 = v49;
                    }
                    else {
                      uint64_t v51 = "Unknown Process";
                    }
                    [v40 appendFormat:@" (overridden by %s)\n", v51];
                    goto LABEL_100;
                  }
                  uint64_t v45 = @" (default behavior)\n";
                }
                [v40 appendString:v45];
LABEL_100:

                goto LABEL_101;
              }
LABEL_90:
              if ([v43 length]) {
                [v43 appendString:@","];
              }
              [v43 appendString:@"vmfault-sampling"];
              goto LABEL_93;
            }
            uint64_t v39 = @" (default behavior)\n";
          }
          [v25 appendString:v39];
          goto LABEL_82;
        }
LABEL_74:
        [v25 appendString:@"\t    full-system sampling period    = disabled"];
        goto LABEL_77;
      }
      unint64_t v22 = @" (default behavior)\n";
    }
    [v13 appendString:v22];
    goto LABEL_29;
  }
  int v10 = *((unsigned __int8 *)v4 + 156);
  uint64_t v16 = *a1;
  uint64_t v17 = @"enabled";
  if (!v4[156]) {
    uint64_t v17 = @"disabled";
  }
  [v6 appendFormat:@"tailspin has been %@", v17];
  if ((v16 & 0x80) == 0)
  {
    unint64_t v12 = @" (default behavior)\n";
    goto LABEL_8;
  }
  uint64_t v18 = v4 + 157;
  if (!v4[157]) {
    uint64_t v18 = "Unknown Process";
  }
  [v7 appendFormat:@" (overridden by %s)\n", v18];
  if (v10) {
    goto LABEL_9;
  }
LABEL_101:
  uint64_t v46 = (void *)[v7 copy];

  return v46;
}

uint64_t tailspin_enabled_get(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8360);
}

BOOL tailspin_enabled_is_default(unsigned char *a1)
{
  return (*a1 & 0x80) == 0;
}

void *tailspin_config_create_with_current_state()
{
  sub_1C86E5674();
  os_log_t v0 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v1, "tailspin_request_type", 1uLL);
  xpc_object_t v2 = xpc_connection_send_message_with_reply_sync(v0, v1);

  if (MEMORY[0x1C87CC2E0](v2) != MEMORY[0x1E4F14590])
  {
    if (MEMORY[0x1C87CC2E0](v2) == MEMORY[0x1E4F145A8])
    {
      int v7 = *__error();
      int v8 = sub_1C86DE154();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1C86F5E90(v2, v8);
      }

      *__error() = v7;
      unint64_t v3 = 0;
      *__error() = 61;
    }
    else
    {
      unint64_t v3 = 0;
    }
    goto LABEL_16;
  }
  if (!xpc_dictionary_get_BOOL(v2, "tailspin_succeeded"))
  {
    int v9 = *__error();
    int v10 = sub_1C86DE154();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1C86F5E5C();
    }
    goto LABEL_15;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v2, "tailspin_config", &length);
  if (length != 8472)
  {
    int v9 = *__error();
    int v10 = sub_1C86DE154();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1C86F5E28();
    }
LABEL_15:

    unint64_t v3 = 0;
    *__error() = v9;
    goto LABEL_16;
  }
  uint64_t v5 = data;
  uint64_t v6 = malloc_type_calloc(1uLL, 0x2118uLL, 0x10000409BDBFF31uLL);
  if (!v6) {
    sub_1C86F45C0();
  }
  unint64_t v3 = v6;
  memcpy(v6, v5, 0x2118uLL);
LABEL_16:

  return v3;
}

id sub_1C86E5674()
{
  if (qword_1EB59EA78 != -1) {
    dispatch_once(&qword_1EB59EA78, &unk_1F2318A00);
  }
  os_log_t v0 = (void *)qword_1EB59EA80;

  return v0;
}

void *tailspin_config_create_with_config(const void *a1)
{
  xpc_object_t v2 = malloc_type_calloc(1uLL, 0x2118uLL, 0x10000409BDBFF31uLL);
  if (!v2) {
    sub_1C86F45C0();
  }

  return memcpy(v2, a1, 0x2118uLL);
}

char *tailspin_config_create_new()
{
  os_log_t v0 = (char *)malloc_type_calloc(1uLL, 0x2118uLL, 0x10000409BDBFF31uLL);
  if (!v0) {
    sub_1C86F45C0();
  }
  xpc_object_t v1 = v0;
  *(void *)os_log_t v0 = 187;
  sub_1C86E57BC(v0 + 8361);
  sub_1C86E57BC(v1 + 8248);
  sub_1C86E57BC(v1 + 8204);
  sub_1C86E57BC(v1 + 8288);
  sub_1C86E57BC(v1 + 8328);
  sub_1C86E57BC(v1 + 8400);
  return v1;
}

size_t sub_1C86E57BC(char *__dst)
{
  if (qword_1EA52E2E8 != -1) {
    dispatch_once(&qword_1EA52E2E8, &unk_1F2318B80);
  }
  *(_OWORD *)__uuid_t dst = 0u;
  *((_OWORD *)__dst + 1) = 0u;

  return strlcpy(__dst, byte_1EA52E2C8, 0x20uLL);
}

size_t tailspin_buffer_size_set(void *a1, uint64_t a2)
{
  if (!a2) {
    sub_1C86F45C0();
  }
  a1[1030] = a2;
  *a1 |= 2uLL;
  xpc_object_t v2 = (char *)(a1 + 1031);

  return sub_1C86E57BC(v2);
}

uint64_t tailspin_buffer_size_get(uint64_t a1)
{
  return *(void *)(a1 + 8240);
}

BOOL tailspin_buffer_size_is_default(unsigned char *a1)
{
  return (*a1 & 2) == 0;
}

double tailspin_buffer_size_reset(uint64_t a1)
{
  *(void *)(a1 + 8240) = tailspin_buffer_size_get_default();
  *(void *)a1 &= ~2uLL;
  double result = 0.0;
  *(_OWORD *)(a1 + 8248) = 0u;
  *(_OWORD *)(a1 + 8264) = 0u;
  return result;
}

size_t tailspin_kdbg_filter_class_set(uint64_t a1, int a2, char a3)
{
  unsigned int v3 = a2 << 8;
  uint64_t v4 = a1 + 12;
  int v5 = 0;
  if (a3)
  {
    do
    {
      *(unsigned char *)(v4 + ((unint64_t)(v5 & 0xF8 | v3) >> 3)) |= 1 << (v5 & 7);
      ++v5;
    }
    while (v5 != 256);
  }
  else
  {
    do
    {
      *(unsigned char *)(v4 + ((unint64_t)(v5 & 0xF8 | v3) >> 3)) &= ~(1 << (v5 & 7));
      ++v5;
    }
    while (v5 != 256);
  }
  *(void *)a1 |= 1uLL;
  return sub_1C86E57BC((char *)(a1 + 8204));
}

BOOL tailspin_kdbg_filter_class_get(uint64_t a1, unsigned int a2)
{
  if ((*(unsigned char *)(a1 + 12 + 32 * a2) & 1) == 0) {
    return 0;
  }
  unsigned int v3 = 0;
  do
  {
    unsigned int v4 = v3;
    if (v3 == 255) {
      break;
    }
    ++v3;
  }
  while (((*(unsigned __int8 *)(a1 + 12 + ((unint64_t)((v4 + 1) & 0xF8 | (a2 << 8)) >> 3)) >> ((v4 + 1) & 7)) & 1) != 0);
  return v4 > 0xFE;
}

BOOL tailspin_kdbg_filter_class_get_partial(uint64_t a1, unsigned int a2)
{
  if (*(unsigned char *)(a1 + 12 + 32 * a2)) {
    return 1;
  }
  unsigned int v2 = 0;
  do
  {
    unsigned int v3 = v2;
    if (v2 == 255) {
      break;
    }
    ++v2;
  }
  while (((*(unsigned __int8 *)(a1 + 12 + ((unint64_t)((v3 + 1) & 0xF8 | (a2 << 8)) >> 3)) >> ((v3 + 1) & 7)) & 1) == 0);
  return v3 < 0xFF;
}

size_t tailspin_kdbg_filter_subclass_set(uint64_t a1, int a2, int a3, int a4)
{
  int v4 = 1 << (a3 & 7);
  uint64_t v5 = a1 + ((unint64_t)(a3 | (a2 << 8)) >> 3);
  if (a4) {
    char v6 = *(unsigned char *)(v5 + 12) | v4;
  }
  else {
    char v6 = *(unsigned char *)(v5 + 12) & ~(_BYTE)v4;
  }
  *(unsigned char *)(v5 + 12) = v6;
  *(void *)a1 |= 1uLL;
  return sub_1C86E57BC((char *)(a1 + 8204));
}

uint64_t tailspin_kdbg_filter_subclass_get(uint64_t a1, int a2, int a3)
{
  return (*(unsigned __int8 *)(a1 + ((unint64_t)(a3 | (a2 << 8)) >> 3) + 12) >> (a3 & 7)) & 1;
}

size_t tailspin_kdbg_filter_clear(uint64_t a1)
{
  bzero((void *)(a1 + 12), 0x2000uLL);
  *(void *)a1 |= 1uLL;

  return sub_1C86E57BC((char *)(a1 + 8204));
}

void tailspin_kdbg_filter_copy_description()
{
}

BOOL tailspin_kdbg_filter_is_default(unsigned char *a1)
{
  return (*a1 & 1) == 0;
}

double tailspin_kdbg_filter_reset(uint64_t a1)
{
  unsigned int v2 = (void *)(a1 + 12);
  unsigned int v3 = tailspin_kdbg_filter_get_default();
  memcpy(v2, v3, 0x2000uLL);
  *(void *)a1 &= ~1uLL;
  double result = 0.0;
  *(_OWORD *)(a1 + 8204) = 0u;
  *(_OWORD *)(a1 + 8220) = 0u;
  return result;
}

size_t tailspin_sampling_option_set(uint64_t a1, int a2, int a3)
{
  if (a3) {
    int v3 = *(_DWORD *)(a1 + 8396) | a2;
  }
  else {
    int v3 = *(_DWORD *)(a1 + 8396) & ~a2;
  }
  *(_DWORD *)(a1 + 8396) = v3;
  *(void *)a1 |= 0x20uLL;
  return sub_1C86E57BC((char *)(a1 + 8400));
}

BOOL tailspin_sampling_option_get(uint64_t a1, int a2)
{
  return (a2 & ~*(_DWORD *)(a1 + 8396)) == 0;
}

BOOL tailspin_sampling_options_is_default(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 8396) & 0x20) == 0;
}

size_t tailspin_sampling_options_clear(uint64_t a1)
{
  *(_DWORD *)(a1 + 8396) = 0;
  *(void *)a1 |= 0x20uLL;
  return sub_1C86E57BC((char *)(a1 + 8400));
}

double tailspin_sampling_options_reset(uint64_t a1)
{
  *(_DWORD *)(a1 + 8396) = tailspin_sampling_options_get_default();
  *(void *)a1 &= ~0x20uLL;
  double result = 0.0;
  *(_OWORD *)(a1 + 8400) = 0u;
  *(_OWORD *)(a1 + 8416) = 0u;
  return result;
}

size_t tailspin_oncore_sampling_period_set(uint64_t a1, unint64_t a2)
{
  if (a2 && tailspin_min_oncore_sampling_period_allowed() > a2) {
    sub_1C86F45C0();
  }
  *(void *)(a1 + 8320) = a2;
  *(void *)a1 |= 0x10uLL;

  return sub_1C86E57BC((char *)(a1 + 8328));
}

uint64_t tailspin_oncore_sampling_period_get(uint64_t a1)
{
  return *(void *)(a1 + 8320);
}

BOOL tailspin_oncore_sampling_period_is_default(unsigned char *a1)
{
  return (*a1 & 0x10) == 0;
}

double tailspin_oncore_sampling_period_reset(uint64_t a1)
{
  *(void *)(a1 + 8320) = tailspin_oncore_sampling_period_get_default();
  *(void *)a1 &= ~0x10uLL;
  double result = 0.0;
  *(_OWORD *)(a1 + 8328) = 0u;
  *(_OWORD *)(a1 + 8344) = 0u;
  return result;
}

size_t tailspin_full_sampling_period_set(uint64_t a1, unint64_t a2)
{
  if (a2 && tailspin_min_full_sampling_period_allowed() > a2) {
    sub_1C86F45C0();
  }
  *(void *)(a1 + 8280) = a2;
  *(void *)a1 |= 8uLL;

  return sub_1C86E57BC((char *)(a1 + 8288));
}

uint64_t tailspin_full_sampling_period_get(uint64_t a1)
{
  return *(void *)(a1 + 8280);
}

BOOL tailspin_full_sampling_period_is_default(unsigned char *a1)
{
  return (*a1 & 8) == 0;
}

double tailspin_full_sampling_period_reset(uint64_t a1)
{
  *(void *)(a1 + 8280) = tailspin_full_sampling_period_get_default();
  *(void *)a1 &= ~8uLL;
  double result = 0.0;
  *(_OWORD *)(a1 + 8288) = 0u;
  *(_OWORD *)(a1 + 8304) = 0u;
  return result;
}

size_t tailspin_enabled_set(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 8360) = a2;
  *(void *)a1 |= 0x80uLL;
  return sub_1C86E57BC((char *)(a1 + 8361));
}

double tailspin_enabled_reset(uint64_t a1)
{
  *(unsigned char *)(a1 + 8360) = tailspin_enabled_get_default();
  *(void *)a1 &= ~0x80uLL;
  double result = 0.0;
  *(_OWORD *)(a1 + 8361) = 0u;
  *(_OWORD *)(a1 + 8377) = 0u;
  return result;
}

void tailspin_config_apply(_DWORD *a1, void *a2, void *a3)
{
  id v5 = a3;
  a1[2] = 2 * (*(void *)a1 != 0);
  char v6 = a2;
  sub_1C86E5674();
  int v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "tailspin_request_type", 0);
  xpc_dictionary_set_data(v8, "tailspin_config", a1, 0x2118uLL);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C86E5F84;
  v10[3] = &unk_1E65701B0;
  id v11 = v5;
  id v9 = v5;
  sub_1C86E5ED8(v7, v8, v6, v10);
}

void sub_1C86E5ED8(_xpc_connection_s *a1, void *a2, NSObject *a3, void *a4)
{
  id v7 = a4;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1C86E7B98;
  handler[3] = &unk_1E65703A0;
  id v10 = v7;
  id v8 = v7;
  xpc_connection_send_message_with_reply(a1, a2, a3, handler);
}

uint64_t sub_1C86E5F84(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL tailspin_config_apply_sync(_DWORD *a1)
{
  a1[2] = 2 * (*(void *)a1 != 0);
  sub_1C86E5674();
  unsigned int v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "tailspin_request_type", 0);
  xpc_dictionary_set_data(v3, "tailspin_config", a1, 0x2118uLL);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v2, v3);
  BOOL v5 = MEMORY[0x1C87CC2E0]() == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(v4, "tailspin_succeeded");

  return v5;
}

uint64_t tailspin_currently_running()
{
  if (!ktrace_config_create_current())
  {
    int v2 = *__error();
    xpc_object_t v3 = sub_1C86DE154();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1C86F5F1C(v3);
    }
    goto LABEL_13;
  }
  int owner_kind = ktrace_config_get_owner_kind();
  int state = ktrace_config_kdebug_get_state();
  ktrace_config_destroy();
  if (owner_kind != 2)
  {
    int v2 = *__error();
    xpc_object_t v3 = sub_1C86DE154();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1C86F600C();
    }
    goto LABEL_13;
  }
  int v2 = *__error();
  xpc_object_t v3 = sub_1C86DE154();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (state != 3)
  {
    if (v4) {
      sub_1C86F5FD8();
    }
LABEL_13:
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  if (v4) {
    sub_1C86F5FA4();
  }
  uint64_t v5 = 1;
LABEL_14:

  *__error() = v2;
  return v5;
}

uint64_t tailspin_dump_output(int a1, void *a2, void *a3)
{
  return tailspin_dump_output_with_options(a1, 0, a2, a3);
}

uint64_t tailspin_dump_output_with_options(int a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  sub_1C86E5674();
  id v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  id v11 = sub_1C86E6400(a1, v9);

  if (v11)
  {
    pid_t v12 = getpid();
    int v13 = *__error();
    int v14 = sub_1C86DE154();
    uint64_t v15 = v14;
    if ((v12 - 1) <= 0xFFFFFFFD && os_signpost_enabled(v14))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C86D7000, v15, OS_SIGNPOST_EVENT, v12, "ClientRequestedDump", (const char *)&unk_1C86FACE1, v18, 2u);
    }

    *__error() = v13;
    sub_1C86E5ED8(v10, v11, v7, v8);

    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 22;
  }

  return v16;
}

BOOL tailspin_dump_output_sync(int a1)
{
  return tailspin_dump_output_with_options_sync(a1, 0);
}

BOOL tailspin_dump_output_with_options_sync(int a1, void *a2)
{
  id v3 = a2;
  sub_1C86E5674();
  BOOL v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = sub_1C86E6400(a1, v3);

  pid_t v6 = getpid();
  int v7 = *__error();
  id v8 = sub_1C86DE154();
  id v9 = v8;
  if ((v6 - 1) <= 0xFFFFFFFD && os_signpost_enabled(v8))
  {
    *(_WORD *)int v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v9, OS_SIGNPOST_EVENT, v6, "ClientRequestedDumpSync", (const char *)&unk_1C86FACE1, v13, 2u);
  }

  *__error() = v7;
  xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v4, v5);
  xpc_dictionary_get_BOOL(v10, "tailspin_succeeded");
  BOOL v11 = MEMORY[0x1C87CC2E0](v10) == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(v10, "tailspin_succeeded");

  return v11;
}

id sub_1C86E6400(int a1, void *a2)
{
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "tailspin_request_type", 2uLL);
  xpc_dictionary_set_fd(v4, "tailspin_dump_fd", a1);
  uint64_t v5 = mach_continuous_time();
  xpc_dictionary_set_uint64(v4, "tailspin_dump_request_timestamp", v5);
  if (!v3) {
    goto LABEL_4;
  }
  id v13 = 0;
  pid_t v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:&v13];
  id v7 = v13;
  if (v6)
  {
    id v8 = v6;
    xpc_dictionary_set_data(v4, "tailspin_dump_options", (const void *)[v8 bytes], [v8 length]);

LABEL_4:
    id v9 = v4;
    goto LABEL_8;
  }
  int v10 = *__error();
  BOOL v11 = sub_1C86DE154();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1C86F6040(v7, v11);
  }

  *__error() = v10;
  id v9 = 0;
LABEL_8:

  return v9;
}

void tailspin_augment_output_with_request_id(int a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  dispatch_queue_t queue = a3;
  id v89 = a4;
  id v90 = a5;
  uint64_t v122 = 0;
  v123[0] = &v122;
  v123[1] = 0x2020000000;
  int v124 = 0;
  uint64_t v118 = 0;
  uint64_t v119 = &v118;
  uint64_t v120 = 0x2020000000;
  int v121 = 1;
  if (a1 == -1)
  {
    _os_assert_log();
    uint64_t v81 = _os_crash();
    sub_1C86F54A0(v81);
  }
  if (v9)
  {
    int v10 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_min_timestamp"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unint64_t v86 = [v10 unsignedLongLongValue];
    }
    else {
      unint64_t v86 = 0;
    }
    BOOL v11 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_no_symbolicate"];

    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v12 = [v11 BOOLValue] ^ 1;
    }
    else {
      int v12 = 0;
    }
    id v13 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_symbolicate"];

    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v12 = [v13 BOOLValue];
      }
    }
    int v14 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_use_dsymforuuid"];

    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      LOBYTE(v88) = [v14 BOOLValue];
    }
    else {
      LOBYTE(v88) = 0;
    }
    uint64_t v15 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_collect_os_logs"];

    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      HIDWORD(v88) = [v15 BOOLValue];
    }
    else {
      HIDWORD(v88) = 0;
    }
    uint64_t v16 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_collect_os_signposts"];

    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v17 = [v16 BOOLValue];
    }
    else {
      int v17 = 0;
    }
    uint64_t v18 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_os_log_archive"];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v85 = [v18 UTF8String];
    }
    else {
      uint64_t v85 = 0;
    }
    int v19 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_scrub_output"];

    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char v84 = [v19 BOOLValue];
    }
    else {
      char v84 = 0;
    }
    uint64_t v20 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_collect_ariadne_plists"];

    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v21 = [v20 BOOLValue];
    }
    else {
      int v21 = 0;
    }
    unint64_t v22 = [v9 objectForKeyedSubscript:@"tailspin_dump_option_collect_trials"];

    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v23 = [v22 BOOLValue];
    }
    else {
      int v23 = 0;
    }
    uint64_t v24 = [v9 objectForKeyedSubscript:@"cache_symbols"];

    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char v87 = [v24 BOOLValue];
    }
    else {
      char v87 = 0;
    }

    BOOL v25 = v12 != 0;
    if (v17) {
      goto LABEL_54;
    }
  }
  else
  {
    char v87 = 0;
    uint64_t v85 = 0;
    unint64_t v86 = 0;
    int v23 = 0;
    int v21 = 0;
    char v84 = 0;
    int v17 = 0;
    uint64_t v88 = 0;
    BOOL v25 = 0;
  }
  if ((v88 & 0x100000000) == 0 && !v25 && (v21 & 1) == 0 && (v23 & 1) == 0)
  {
    close(a1);
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = sub_1C86E7568;
    v116[3] = &unk_1E6570270;
    int v26 = &v117;
    id v117 = v90;
    unint64_t v27 = v116;
    goto LABEL_68;
  }
LABEL_54:
  uint64_t v28 = ktrace_file_open_fd();
  uint64_t v29 = v28;
  if (v28)
  {
    if (v21 && !MEMORY[0x1C87CBA70](v28))
    {
      int v44 = *__error();
      uint64_t v45 = sub_1C86DE154();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = __error();
        sub_1C86F63DC(v46, (uint64_t)v136, v45);
      }

      *__error() = v44;
      *((_DWORD *)v119 + 6) = 20;
      if (!v23) {
        goto LABEL_94;
      }
    }
    else if (!v23)
    {
      goto LABEL_94;
    }
    context = (void *)MEMORY[0x1C87CBD00]();
    if (!sub_1C86E8070()) {
      goto LABEL_69;
    }
    *(void *)uint64_t v142 = 0;
    id v143 = v142;
    uint64_t v144 = 0x2050000000;
    BOOL v30 = (void *)qword_1EA52E758;
    uint64_t v145 = qword_1EA52E758;
    if (!qword_1EA52E758)
    {
      *(void *)stat buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1C86E81B4;
      int v140 = &unk_1E6570458;
      uint64_t v141 = v142;
      sub_1C86E81B4((uint64_t)buf);
      BOOL v30 = (void *)*((void *)v143 + 3);
    }
    id v31 = v30;
    _Block_object_dispose(v142, 8);
    if (objc_opt_class())
    {
      uint64_t v82 = [v31 defaultProvider];
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v138[0] = 0;
      uint64_t v131 = MEMORY[0x1E4F143A8];
      uint64_t v132 = 3221225472;
      id v133 = sub_1C86E7C34;
      id v134 = &unk_1E65703C8;
      id v33 = v32;
      id v135 = v33;
      char v34 = [v82 enumerateActiveExperimentsForEnvironment:0 error:v138 block:&v131];
      id v35 = v138[0];
      int v36 = *__error();
      unint64_t v37 = sub_1C86DE154();
      uint64_t v38 = v37;
      if (v34)
      {
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          sub_1C86F6328(v142, [v33 count], v38);
        }
      }
      else if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        sub_1C86F6370();
      }

      *__error() = v36;
      id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

      id v130 = 0;
      uint64_t v125 = MEMORY[0x1E4F143A8];
      uint64_t v126 = 3221225472;
      int v127 = sub_1C86E7E98;
      int v128 = &unk_1E6570418;
      id v48 = v47;
      id v129 = v48;
      char v49 = [v82 enumerateActiveRolloutsWithError:&v130 block:&v125];
      id v50 = v130;
      int v51 = *__error();
      uint64_t v52 = sub_1C86DE154();
      uint64_t v53 = v52;
      if (v49)
      {
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
          sub_1C86F6274(v137, [v48 count], v53);
        }
      }
      else if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        sub_1C86F62BC();
      }

      *__error() = v51;
      size_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      [v54 setObject:v33 forKeyedSubscript:@"experiments"];
      [v54 setObject:v48 forKeyedSubscript:@"rollouts"];
      uint64_t v55 = (void *)[v54 copy];

      if (v55)
      {
        id v113 = 0;
        unsigned int v56 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v55 format:200 options:0 error:&v113];
        id v57 = v113;
        if (v56)
        {
          id v58 = v56;
          [v58 bytes];
          [v58 length];
          if (ktrace_file_append_chunk())
          {
LABEL_93:

            goto LABEL_94;
          }
          int v59 = *__error();
          uint64_t v60 = sub_1C86DE154();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            id v61 = __error();
            sub_1C86F6230(v61, (uint64_t)v138, v60);
          }
        }
        else
        {
          int v59 = *__error();
          uint64_t v60 = sub_1C86DE154();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            sub_1C86F61C4();
          }
        }

        *__error() = v59;
        *((_DWORD *)v119 + 6) = 24;
        goto LABEL_93;
      }
    }
    else
    {
LABEL_69:
    }
    int v42 = *__error();
    uint64_t v43 = sub_1C86DE154();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_1C86F6190();
    }

    *__error() = v42;
    *((_DWORD *)v119 + 6) = 24;
LABEL_94:
    if ((v17 | HIDWORD(v88)) != 1)
    {
LABEL_100:
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = sub_1C86E76BC;
      v92[3] = &unk_1E65702E8;
      BOOL v99 = v25;
      id v93 = v89;
      uint64_t v98 = v29;
      char v100 = v88;
      char v101 = v87;
      v94 = queue;
      int v96 = &v122;
      uint64_t v97 = &v118;
      id v95 = v90;
      dispatch_async(v94, v92);

      int v26 = &v93;
      goto LABEL_101;
    }
    uint64_t v131 = 0;
    uint64_t v132 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    int v62 = ktrace_file_earliest_walltime();
    *(_DWORD *)(v123[0] + 24) = v62;
    if (v62 || (int v63 = ktrace_file_latest_walltime(), (*(_DWORD *)(v123[0] + 24) = v63) != 0))
    {
      *((_DWORD *)v119 + 6) = 23;
      int v64 = *__error();
      int v65 = sub_1C86DE154();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        sub_1C86F6118((uint64_t)v123, v65, v66);
      }

      *__error() = v64;
      goto LABEL_100;
    }
    if (v86)
    {
      id v130 = 0;
      int v67 = ktrace_file_earliest_timestamp();
      *(_DWORD *)(v123[0] + 24) = v67;
      double v68 = 0.0;
      if (!v67 && (unint64_t)v130 > v86)
      {
        double v68 = sub_1C86E7590((uint64_t)v130 - v86);
        if (v68 > 60.0)
        {
          int v69 = *__error();
          uint64_t v70 = sub_1C86DE154();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)stat buf = 134217984;
            *(double *)&uint8_t buf[4] = v68;
            _os_log_impl(&dword_1C86D7000, v70, OS_LOG_TYPE_INFO, "Min timestamp %.0fs before start of ktrace data, capping signpost/logs to 60s before", buf, 0xCu);
          }

          *__error() = v69;
          double v68 = 60.0;
        }
        int v71 = *__error();
        v72 = sub_1C86DE154();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 134217984;
          *(double *)&uint8_t buf[4] = v68;
          _os_log_impl(&dword_1C86D7000, v72, OS_LOG_TYPE_INFO, "Min timestamp %.0fs before start of ktrace data, including signpost/logs from then", buf, 0xCu);
        }

        *__error() = v71;
      }
    }
    else
    {
      double v68 = 0.0;
    }
    id v73 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v74 = (void *)[v73 initWithTimeIntervalSince1970:(double)v131 - v68];
    id v75 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v76 = [v75 initWithTimeIntervalSince1970:(double)(v125 + 1)];
    v77 = (void *)v76;
    if (v74 && v76 && [v74 compare:v76] == -1)
    {
      [v77 timeIntervalSinceDate:v74];
      if (v80 <= 3600.0)
      {
        v102[0] = MEMORY[0x1E4F143A8];
        v102[1] = 3221225472;
        v102[2] = sub_1C86E7628;
        v102[3] = &unk_1E6570298;
        char v110 = v17;
        char v111 = BYTE4(v88);
        char v112 = v84;
        id v103 = v89;
        int v106 = &v122;
        uint64_t v108 = v29;
        uint64_t v109 = v85;
        id v104 = v74;
        id v105 = v77;
        id v107 = &v118;
        dispatch_async(queue, v102);

        goto LABEL_119;
      }
      int v78 = *__error();
      uint64_t v79 = sub_1C86DE154();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 138543874;
        *(void *)&uint8_t buf[4] = v74;
        *(_WORD *)&uint8_t buf[12] = 2114;
        *(void *)&buf[14] = v77;
        *(_WORD *)&buf[22] = 2114;
        int v140 = v9;
        _os_log_fault_impl(&dword_1C86D7000, v79, OS_LOG_TYPE_FAULT, "start (%{public}@) + 1h < end (%{public}@). Saved with %{public}@ options", buf, 0x20u);
      }
    }
    else
    {
      int v78 = *__error();
      uint64_t v79 = sub_1C86DE154();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 138543874;
        *(void *)&uint8_t buf[4] = v74;
        *(_WORD *)&uint8_t buf[12] = 2114;
        *(void *)&buf[14] = v77;
        *(_WORD *)&buf[22] = 2114;
        int v140 = v9;
        _os_log_fault_impl(&dword_1C86D7000, v79, OS_LOG_TYPE_FAULT, "start (%{public}@) >= end (%{public}@). Saved with %{public}@ options", buf, 0x20u);
      }
    }

    *__error() = v78;
LABEL_119:

    goto LABEL_100;
  }
  int v39 = *__error();
  id v40 = sub_1C86DE154();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    int v41 = __error();
    sub_1C86F60D4(v41, (uint64_t)buf, v40);
  }

  *__error() = v39;
  close(a1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C86E757C;
  block[3] = &unk_1E6570270;
  int v26 = &v115;
  id v115 = v90;
  unint64_t v27 = block;
LABEL_68:
  dispatch_async(queue, v27);
LABEL_101:

  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v122, 8);
}

void sub_1C86E74A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
}

uint64_t sub_1C86E7568(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1C86E757C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

double sub_1C86E7590(uint64_t a1)
{
  if (qword_1EA52E740 != -1) {
    dispatch_once(&qword_1EA52E740, &unk_1F2318960);
  }
  if (qword_1EA52E748) {
    BOOL v2 = HIDWORD(qword_1EA52E748) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    a1 = 0;
  }
  else if (qword_1EA52E748 != HIDWORD(qword_1EA52E748))
  {
    a1 = __udivti3();
  }
  return (double)(unint64_t)a1 / 1000000000.0;
}

uint64_t sub_1C86E7628(uint64_t a1)
{
  [*(id *)(a1 + 32) startRecordingTimeForAugmentLoggingPhase:*(unsigned __int8 *)(a1 + 88) collectOSLog:*(unsigned __int8 *)(a1 + 89) scrubData:*(unsigned __int8 *)(a1 + 90)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = tailspin_write_os_signpost_support_chunks(*(void *)(a1 + 72), *(void *)(a1 + 80), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(unsigned __int8 *)(a1 + 89), *(unsigned __int8 *)(a1 + 90));
  uint64_t result = [*(id *)(a1 + 32) stopRecordingTimeForAugmentLoggingPhase:*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 22;
  }
  return result;
}

uint64_t sub_1C86E76BC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    [*(id *)(a1 + 32) startRecordingTimeForAugmentSymbolicatePhase];
    uint64_t v2 = *(void *)(a1 + 72);
    uint64_t v3 = *(unsigned __int8 *)(a1 + 81);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 82);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1C86E77E8;
    v8[3] = &unk_1E65702C0;
    long long v9 = *(_OWORD *)(a1 + 56);
    uint64_t v10 = v2;
    uint64_t v5 = *(void **)(a1 + 40);
    v8[4] = *(id *)(a1 + 32);
    v8[5] = *(id *)(a1 + 48);
    tailspin_symbolicate_file_async(v2, v3, v4, v5, v8);
  }
  ktrace_file_close();
  pid_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v6();
}

uint64_t sub_1C86E77E8(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0x25 && ((1 << a2) & 0x2000000011) != 0) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(_DWORD *)(v3 + 24))
  {
    *(_DWORD *)(v3 + 24) = a2;
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      int v4 = 21;
    }
    else {
      int v4 = 1;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
  }
  ktrace_file_close();
  [*(id *)(a1 + 32) stopRecordingTimeForAugmentSymbolicatePhase];
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

void tailspin_augment_output(int a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  int v9[2] = sub_1C86E7954;
  v9[3] = &unk_1E6570310;
  id v10 = v7;
  id v8 = v7;
  tailspin_augment_output_with_request_id(a1, a2, a3, 0, v9);
}

uint64_t sub_1C86E7954(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

void tailspin_poke()
{
  sub_1C86E5674();
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "tailspin_request_type", 0xDEADCAFFuLL);
  xpc_connection_send_message(connection, v0);
}

void tailspin_resolve_configs()
{
  sub_1C86E5674();
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "tailspin_request_type", 0xDEADCB00uLL);
  xpc_connection_send_message(connection, v0);
}

void sub_1C86E7A64()
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.tailspind", 0, 2uLL);
  xpc_object_t v1 = (void *)qword_1EB59EA80;
  qword_1EB59EA80 = (uint64_t)mach_service;

  if (qword_1EB59EA80)
  {
    xpc_connection_set_event_handler((xpc_connection_t)qword_1EB59EA80, &unk_1F2318B60);
    uint64_t v2 = (_xpc_connection_s *)qword_1EB59EA80;
    xpc_connection_resume(v2);
  }
  else
  {
    int v3 = *__error();
    int v4 = sub_1C86DE154();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1C86F6420();
    }

    *__error() = v3;
  }
}

uint64_t sub_1C86E7B14()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = getpid();
  int responsible_pid_and_name = get_responsible_pid_and_name(v0, v3, 0x20u);
  return snprintf(byte_1EA52E2C8, 0x20uLL, "%s [%d]", v3, responsible_pid_and_name);
}

void sub_1C86E7B98(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x1C87CC2E0]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3 == MEMORY[0x1E4F14590])
  {
    if (!v4) {
      goto LABEL_7;
    }
    BOOL v5 = xpc_dictionary_get_BOOL(xdict, "tailspin_succeeded");
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    BOOL v5 = 0;
  }
  (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v5);
LABEL_7:
}

uint64_t sub_1C86E7C28()
{
  return mach_timebase_info((mach_timebase_info_t)&qword_1EA52E748);
}

void sub_1C86E7C34(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [v2 experimentId];
  BOOL v5 = (void *)[v4 copy];
  [v3 setObject:v5 forKeyedSubscript:@"experiment_id"];

  pid_t v6 = [NSNumber numberWithInt:[v2 deploymentId]];
  [v3 setObject:v6 forKeyedSubscript:@"deployment_id"];

  id v7 = [v2 treatmentId];
  id v8 = (void *)[v7 copy];
  [v3 setObject:v8 forKeyedSubscript:@"treatment_id"];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [v2 namespaces];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = [NSNumber numberWithUnsignedInt:[v15 compatibilityVersion]];
        int v17 = [v15 name];
        [v9 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  uint64_t v18 = (void *)[v9 copy];
  [v3 setObject:v18 forKeyedSubscript:@"namespace_ids"];

  int v19 = *(void **)(a1 + 32);
  uint64_t v20 = (void *)[v3 copy];
  [v19 addObject:v20];
}

void sub_1C86E7E98(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  pid_t v6 = [v4 rolloutId];
  id v7 = (void *)[v6 copy];
  [v5 setObject:v7 forKeyedSubscript:@"rollout_id"];

  id v8 = [NSNumber numberWithInt:[v4 deploymentId]];
  [v5 setObject:v8 forKeyedSubscript:@"deployment_id"];

  id v9 = [v4 rampId];
  id v10 = (void *)[v9 copy];
  [v5 setObject:v10 forKeyedSubscript:@"ramp_id"];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = [v4 factorPackIds];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C86E8064;
  v17[3] = &unk_1E65703F0;
  id v18 = v11;
  id v13 = v11;
  [v12 enumerateKeysAndObjectsUsingBlock:v17];

  int v14 = (void *)[v13 copy];
  [v5 setObject:v14 forKeyedSubscript:@"factor_pack_ids"];

  uint64_t v15 = *(void **)(a1 + 32);
  uint64_t v16 = (void *)[v5 copy];
  [v15 addObject:v16];
}

uint64_t sub_1C86E8064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

uint64_t sub_1C86E8070()
{
  if (!qword_1EA52E750) {
    qword_1EA52E750 = _sl_dlopen();
  }
  return qword_1EA52E750;
}

uint64_t sub_1C86E8140()
{
  uint64_t result = _sl_dlopen();
  qword_1EA52E750 = result;
  return result;
}

Class sub_1C86E81B4(uint64_t a1)
{
  id v3 = 0;
  if (!sub_1C86E8070()) {
    sub_1C86F6454(&v3);
  }
  Class result = objc_getClass("TRIAllocationStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1C86F64D4();
  }
  qword_1EA52E758 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C86E8238(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_1C86E8250(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

double sub_1C86E8268(unint64_t a1)
{
  if (qword_1EA52E768 != -1) {
    dispatch_once(&qword_1EA52E768, &unk_1F2318A20);
  }
  return *(double *)&qword_1EA52E760 * (double)a1 * 0.000000001;
}

double sub_1C86E82CC()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1;
  qword_1EA52E760 = *(void *)&result;
  return result;
}

void add_binary_info_to_binary_dictionary(void *a1, void *a2)
{
  id v21 = a1;
  id v3 = a2;
  if (v21 && v3)
  {
    id v4 = [v3 uuid];
    uint64_t v20 = [v3 name];
    int v19 = [v3 path];
    uint64_t v5 = [v3 bundleIdentifier];
    pid_t v6 = [v3 bundleVersion];
    id v7 = [v3 bundleShortVersion];
    id v8 = [v3 binaryVersion];
    id v9 = [v3 segmentWithName:@"__TEXT_EXEC"];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 length];
    }
    else
    {
      uint64_t v12 = [v3 segmentWithName:@"__TEXT"];
      id v13 = v12;
      if (!v12) {
        uint64_t v12 = v3;
      }
      uint64_t v11 = [v12 length];
    }
    uint64_t v14 = [NSNumber numberWithUnsignedLongLong:v11];
    if (!v14) {
      sub_1C86F45C0();
    }
    uint64_t v15 = (void *)v14;
    [v4 UUIDString];
    uint64_t v16 = v18 = v4;
    [v21 setObject:v16 forKeyedSubscript:@"UUID_String"];

    [v21 setObject:v15 forKeyedSubscript:@"Size"];
    int v17 = [NSNumber numberWithBool:v10 != 0];
    [v21 setObject:v17 forKeyedSubscript:@"TEXT_EXEC"];

    [v21 setObject:v20 forKeyedSubscript:@"Name"];
    [v21 setObject:v19 forKeyedSubscript:@"Path"];
    [v21 setObject:v5 forKeyedSubscript:@"BundleID"];
    [v21 setObject:v6 forKeyedSubscript:@"BundleVersion"];
    [v21 setObject:v7 forKeyedSubscript:@"BundleShortVersion"];
    [v21 setObject:v8 forKeyedSubscript:@"BinaryVersion"];
  }
}

id tailspin_symbolicator_copy_symbol_data_using_uuid_pid_path(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, void *a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v14 = a1;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3];
  if (a5)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CB10];
    int v17 = [NSString stringWithUTF8String:a5];
    a5 = [v16 fileURLWithPath:v17];
  }
  for (uint64_t i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a8];
  {
    uint64_t v19 = *a7++;
    uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v19];
    [i addObject:v20];
  }
  v27[0] = *MEMORY[0x1E4FAA5D8];
  id v21 = [NSNumber numberWithBool:a6];
  v28[0] = v21;
  v27[1] = *MEMORY[0x1E4FAA5E8];
  long long v22 = [NSNumber numberWithBool:a2];
  v27[2] = *MEMORY[0x1E4FAA5E0];
  v28[1] = v22;
  v28[2] = MEMORY[0x1E4F1CC28];
  long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

  long long v24 = [v14 symbolicateUUID:v15 pid:a4 path:a5 offsets:i options:v23];

  return v24;
}

void sub_1C86E9758()
{
}

void sub_1C86E981C(_Unwind_Exception *a1)
{
  sub_1C86ECE94(v6);
  sub_1C86ECEE0(v5);
  sub_1C86ECFA4(v4);
  sub_1C86ED034(v3);
  sub_1C86ED10C(v2);
  uint64_t v8 = sub_1C86ECE94(v1);
  MEMORY[0x1C87CB540](v8, 0x10A0C4049D157F1);
  _Unwind_Resume(a1);
}

void sub_1C86E986C(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 256))
    {
      MEMORY[0x1C87CB950]();
      *(void *)(a1 + 256) = 0;
    }
    sub_1C86ECE94(a1 + 200);
    sub_1C86ECEE0(a1 + 160);
    sub_1C86ECFA4(a1 + 120);
    sub_1C86ED034(a1 + 80);
    sub_1C86ED10C(a1 + 40);
    sub_1C86ECE94(a1);
    JUMPOUT(0x1C87CB540);
  }
  sub_1C86F45C0();
}

uint64_t sub_1C86E98F4(uint64_t result)
{
  if (!result) {
    sub_1C86F45C0();
  }
  *(unsigned char *)(result + 264) = 1;
  return result;
}

void sub_1C86E9918(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    sub_1C86F45C0();
  }
  uint64_t v3 = a2;
  if (!a2) {
    sub_1C86F45C0();
  }
  if (a3 <= 0xF) {
    sub_1C86F45C0();
  }
  if (*(unsigned char *)(a1 + 264))
  {
    int v6 = *__error();
    id v7 = sub_1C86DE154();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1C86D7000, v7, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_kcdata_stackshot] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v6;
    return;
  }
  *(_DWORD *)stat buf = 0;
  char v84 = (void *)(a1 + 80);
  uint64_t v8 = sub_1C86F03E0((void *)(a1 + 80), (int *)buf);
  if (v8)
  {
    uint64_t v83 = (uint64_t)(v8 + 3);
  }
  else
  {
    *(_DWORD *)uuid_t dst = 0;
    *(void *)stat buf = dst;
    id v9 = sub_1C86F0494((uint64_t)v84, (int *)dst, (uint64_t)&unk_1C86F79D0, (_DWORD **)buf);
    *((_DWORD *)v9 + 12) = 0;
    uint64_t v83 = (uint64_t)(v9 + 3);
    MEMORY[0x1C87CB500](v9 + 3, "kernel_task");
  }
  unint64_t v10 = v3 + a3;
  uint64_t v11 = v3 + 16;
  if (v3 + 16 <= v3 + a3)
  {
    BOOL v12 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    char v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v82 = (void *)(a1 + 120);
    do
    {
      uint64_t v17 = *(unsigned int *)(v3 + 4);
      uint64_t v18 = v11 + v17;
      if (v11 + v17 > v10) {
        return;
      }
      int v19 = *(_DWORD *)v3;
      if (*(_DWORD *)v3 == -242132755) {
        return;
      }
      if ((v19 & 0xFFFFFFF0) == 0x20) {
        int v20 = 17;
      }
      else {
        int v20 = *(_DWORD *)v3;
      }
      if ((v20 - 1) >= 6) {
        uint64_t v21 = v3 + 16;
      }
      else {
        uint64_t v21 = v3 + 48;
      }
      if (v12)
      {
        BOOL v12 = v20 != 20 || v86 != *(void *)(v3 + 8);
        goto LABEL_170;
      }
      BOOL v12 = 0;
      if (v20 > 19)
      {
        if (v20 == 20)
        {
          uint64_t v25 = *(void *)(v3 + 8);
          char v26 = v13 & (v25 == v14);
          uint64_t v27 = v85;
          int v28 = v16 & (v25 == v85);
          if (v28) {
            uint64_t v29 = 0;
          }
          else {
            uint64_t v29 = v85;
          }
          unsigned int v30 = v16 ^ v28;
          if ((v26 & 1) == 0) {
            uint64_t v27 = v29;
          }
          uint64_t v85 = v27;
          if (v26) {
            uint64_t v24 = v16;
          }
          else {
            uint64_t v24 = v30;
          }
          if (v26)
          {
            uint64_t v15 = 0;
            uint64_t v14 = 0;
            char v13 = 0;
          }
          BOOL v12 = 0;
          goto LABEL_171;
        }
        if (v20 == 2310)
        {
          if (((v21 != 0) & v13) == 1 && v15 != 0)
          {
            sub_1C86F0C64(v15 + 72, (unint64_t *)v21, (void *)v21);
            int v32 = *(_DWORD *)(v15 + 24);
            *(void *)stat buf = v21;
            id v33 = sub_1C86F0E80(a1, (unint64_t *)v21, (uint64_t)&unk_1C86F79D0, (void **)buf);
            BOOL v12 = 0;
            *((_DWORD *)v33 + 6) = v32;
            goto LABEL_56;
          }
LABEL_169:
          BOOL v12 = 0;
          goto LABEL_170;
        }
        if (v20 != 2312)
        {
LABEL_170:
          uint64_t v24 = v16;
          goto LABEL_171;
        }
        if (v13)
        {
          BOOL v12 = 0;
LABEL_56:
          char v13 = 1;
          goto LABEL_170;
        }
        if (!uuid_is_null((const unsigned __int8 *)(v21 + 8)))
        {
          uuid_copy(dst, (const unsigned __int8 *)(v21 + 8));
          long long v36 = *(_OWORD *)dst;
          *(_OWORD *)(a1 + 240) = *(_OWORD *)dst;
          *(_OWORD *)stat buf = v36;
          unint64_t v37 = sub_1C86F00FC(v82, buf);
          if (!v37)
          {
            *(_OWORD *)stat buf = *(_OWORD *)dst;
            char v87 = buf;
            unint64_t v37 = sub_1C86F085C((uint64_t)v82, buf, (uint64_t)&unk_1C86F79D0, (_OWORD **)&v87);
          }
          char v13 = 0;
          BOOL v12 = 0;
          *(_OWORD *)(v37 + 56) = *(_OWORD *)dst;
          *((void *)v37 + 9) = *(void *)v21;
          goto LABEL_170;
        }
LABEL_145:
        char v13 = 0;
        goto LABEL_169;
      }
      if (v20 == 17)
      {
        if (v19 != 17 && (v19 & 0xFFFFFFF0) != 0x20) {
          return;
        }
        uint64_t v34 = *(void *)(v3 + 8);
        if (v34)
        {
          if (v19 == 17)
          {
            if (SHIDWORD(v34) <= 2310)
            {
              switch(HIDWORD(v34))
              {
                case 0x30:
                  unsigned int v35 = 20;
                  break;
                case 0x31:
                  unsigned int v35 = 24;
                  break;
                case 0x81A:
LABEL_151:
                  unsigned int v35 = 8;
                  break;
                default:
                  return;
              }
            }
            else
            {
              switch(HIDWORD(v34))
              {
                case 0x907:
                  unsigned int v35 = 4;
                  break;
                case 0x908:
                case 0x909:
                  return;
                case 0x90A:
                case 0x90C:
                  goto LABEL_151;
                case 0x90B:
                case 0x90D:
                  unsigned int v35 = 16;
                  break;
                default:
                  if (HIDWORD(v34) != 2369) {
                    return;
                  }
                  unsigned int v35 = 48;
                  break;
              }
            }
            if (v17 / v35 < v34 || v17 % v34 >= 0x10) {
              return;
            }
          }
          else
          {
            unsigned int v40 = v17 - (*(_DWORD *)v3 & 0xF);
            if (v17 < (*(_DWORD *)v3 & 0xFu) || v40 < v34 || v40 % v34) {
              return;
            }
          }
        }
        else if (v17)
        {
          return;
        }
        switch(HIDWORD(v34))
        {
          case 0x913:
            if ((v16 & (v15 != 0)) != 1) {
              goto LABEL_169;
            }
            sub_1C86EA69C((void *)v21, v34, v83);
            break;
          case 0x914:
            if ((v16 & (v15 != 0)) != 1) {
              goto LABEL_169;
            }
            sub_1C86EA784((unint64_t *)v21, v34, 1, v83);
            break;
          case 0x915:
            if ((v16 & (v15 != 0)) != 1) {
              goto LABEL_169;
            }
            sub_1C86EA69C((void *)v21, v34, v15);
            break;
          case 0x916:
            if ((v16 & (v15 != 0)) != 1) {
              goto LABEL_169;
            }
            sub_1C86EA784((unint64_t *)v21, v34, 1, v15);
            break;
          default:
            goto LABEL_169;
        }
        BOOL v12 = 0;
        uint64_t v24 = 1;
      }
      else
      {
        if (v20 != 19) {
          goto LABEL_170;
        }
        if (v19 != 19 || v17 < 4) {
          return;
        }
        int v22 = *(_DWORD *)(v3 + 16);
        uint64_t v23 = *(void *)(v3 + 8);
        if (v22 == 2308)
        {
          if (v13)
          {
            if (v16) {
              uint64_t v38 = v85;
            }
            else {
              uint64_t v38 = *(void *)(v3 + 8);
            }
            uint64_t v39 = v86;
            if (v16) {
              uint64_t v39 = *(void *)(v3 + 8);
            }
            uint64_t v85 = v38;
            uint64_t v86 = v39;
            uint64_t v24 = 1;
            char v13 = 1;
            BOOL v12 = v16;
            goto LABEL_171;
          }
          char v13 = 0;
LABEL_147:
          BOOL v12 = 1;
          uint64_t v24 = v16;
          uint64_t v86 = *(void *)(v3 + 8);
          goto LABEL_171;
        }
        if (v22 != 2307) {
          goto LABEL_147;
        }
        if ((v13 & 1) == 0)
        {
          uint64_t v41 = v18 + 16;
          if (v18 + 16 > v10)
          {
LABEL_144:
            uint64_t v15 = 0;
            uint64_t v14 = 0;
            goto LABEL_145;
          }
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          int v44 = 0;
          uint64_t v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          BOOL v48 = 0;
          uint64_t v49 = 0;
          while (2)
          {
            uint64_t v50 = *(unsigned int *)(v18 + 4);
            uint64_t v51 = v41 + v50;
            if (v41 + v50 > v10) {
              goto LABEL_144;
            }
            int v52 = *(_DWORD *)v18;
            if (*(_DWORD *)v18 == -242132755) {
              goto LABEL_144;
            }
            if ((v52 & 0xFFFFFFF0) == 0x20) {
              int v53 = 17;
            }
            else {
              int v53 = *(_DWORD *)v18;
            }
            if ((v53 - 1) >= 6) {
              uint64_t v54 = v18 + 16;
            }
            else {
              uint64_t v54 = v18 + 48;
            }
            if (v48)
            {
              if (v53 == 20)
              {
                BOOL v48 = *(void *)(v18 + 8) != v49;
                goto LABEL_143;
              }
LABEL_100:
              BOOL v48 = 1;
            }
            else
            {
              BOOL v48 = 0;
              if (v53 <= 2308)
              {
                if (v53 == 17)
                {
                  if (v52 != 17 && (v52 & 0xFFFFFFF0) != 0x20) {
                    goto LABEL_144;
                  }
                  uint64_t v55 = *(void *)(v18 + 8);
                  if (v55)
                  {
                    if (v52 == 17)
                    {
                      char v13 = 0;
                      uint64_t v15 = 0;
                      if (SHIDWORD(v55) <= 2310)
                      {
                        switch(HIDWORD(v55))
                        {
                          case 0x30:
                            unsigned int v56 = 20;
                            break;
                          case 0x31:
                            unsigned int v56 = 24;
                            break;
                          case 0x81A:
LABEL_125:
                            unsigned int v56 = 8;
                            break;
                          default:
                            goto LABEL_195;
                        }
                      }
                      else
                      {
                        uint64_t v24 = v16;
                        uint64_t v14 = 0;
                        BOOL v12 = 0;
                        switch(HIDWORD(v55))
                        {
                          case 0x907:
                            unsigned int v56 = 4;
                            break;
                          case 0x908:
                          case 0x909:
                            goto LABEL_171;
                          case 0x90A:
                          case 0x90C:
                            goto LABEL_125;
                          case 0x90B:
                          case 0x90D:
                            unsigned int v56 = 16;
                            break;
                          default:
                            if (HIDWORD(v55) != 2369) {
                              goto LABEL_195;
                            }
                            unsigned int v56 = 48;
                            break;
                        }
                      }
                      if (v50 / v56 < v55 || v50 % v55 >= 0x10) {
                        goto LABEL_144;
                      }
                    }
                    else
                    {
                      unsigned int v57 = v50 - (*(_DWORD *)v18 & 0xF);
                      if (v50 < (*(_DWORD *)v18 & 0xFu)
                        || v57 < v55
                        || v57 % v55)
                      {
                        goto LABEL_144;
                      }
                    }
                  }
                  else if (v50)
                  {
                    goto LABEL_144;
                  }
                  if (HIDWORD(v55) == 48) {
                    uint64_t v58 = v54;
                  }
                  else {
                    uint64_t v58 = v45;
                  }
                  if (HIDWORD(v55) == 48) {
                    unsigned int v59 = v55;
                  }
                  else {
                    unsigned int v59 = v46;
                  }
                  if (HIDWORD(v55) == 49)
                  {
                    uint64_t v43 = v54;
                    int v44 = v55;
                  }
                  else
                  {
                    uint64_t v45 = v58;
                    unsigned int v46 = v59;
                  }
                  BOOL v48 = 0;
                  goto LABEL_143;
                }
                if (v53 != 19)
                {
                  if (v53 == 20)
                  {
                    uint64_t v73 = v47;
                    char v13 = 0;
                    uint64_t v15 = 0;
                    if (*(void *)(v18 + 8) != v23 || (v77 = v46, uint64_t v75 = v45, LODWORD(v81) = v44, v79 = v43, !v42))
                    {
LABEL_195:
                      uint64_t v24 = v16;
                      uint64_t v14 = 0;
                      BOOL v12 = 0;
                      goto LABEL_171;
                    }
                    uint64_t v60 = v42;
                    int v61 = *(_DWORD *)(v42 + 84);
                    *(_DWORD *)stat buf = v61;
                    int v62 = sub_1C86F03E0(v84, (int *)buf);
                    if (!v62)
                    {
                      *(_DWORD *)uuid_t dst = v61;
                      *(void *)stat buf = dst;
                      int v62 = sub_1C86F0494((uint64_t)v84, (int *)dst, (uint64_t)&unk_1C86F79D0, (_DWORD **)buf);
                    }
                    *((_DWORD *)v62 + 12) = v61;
                    int v63 = (char *)(v60 + 88);
                    size_t v64 = strnlen(v63, 0x20uLL);
                    sub_1C86F028C(buf, v63, v64);
                    uint64_t v15 = (uint64_t)(v62 + 3);
                    if (*((char *)v62 + 47) < 0) {
                      operator delete(*(void **)v15);
                    }
                    *(_OWORD *)uint64_t v15 = *(_OWORD *)buf;
                    v62[5] = v90[0];
                    BOOL v65 = v81 == 1 && v61 == 0;
                    if (v65 || !v81)
                    {
                      if (v77) {
                        sub_1C86EA470(a1, v77, v75, (uint64_t)(v62 + 3));
                      }
                    }
                    else
                    {
                      if (!v79) {
                        sub_1C86F45C0();
                      }
                      uint64_t v74 = v62 + 9;
                      uint64_t v76 = (uint64_t)(v62 + 11);
                      uint64_t v66 = (const unsigned __int8 *)(v79 + 8);
                      double v80 = v62;
                      uint64_t v81 = v81;
                      do
                      {
                        uuid_clear(buf);
                        memset(v90, 0, sizeof(v90));
                        int v91 = 1065353216;
                        uint64_t v92 = 0;
                        int v93 = -1;
                        BOOL v94 = 0;
                        long long v95 = 0u;
                        long long v96 = 0u;
                        uint64_t v67 = *((void *)v66 - 1);
                        uuid_copy(dst, v66);
                        if (v67)
                        {
                          int v93 = *((_DWORD *)v80 + 12);
                          *(_OWORD *)stat buf = *(_OWORD *)dst;
                          v90[0] = v67;
                          BOOL v94 = sub_1C86F00FC((void *)(a1 + 200), buf) != 0;
                          unint64_t v68 = v80[10];
                          if (v68 >= v80[11])
                          {
                            uint64_t v70 = sub_1C86F1180(v74, (long long *)buf);
                            int v69 = v80;
                          }
                          else
                          {
                            int v69 = v80;
                            uint64_t v78 = v80[10];
                            sub_1C86F12A8(v76, v68, (long long *)buf);
                            uint64_t v70 = v78 + 112;
                            v80[10] = v78 + 112;
                          }
                          v69[10] = v70;
                        }
                        if (SHIBYTE(v96) < 0) {
                          operator delete(*((void **)&v95 + 1));
                        }
                        sub_1C86ECE94((uint64_t)&v90[1]);
                        v66 += 24;
                        int v62 = v80;
                        --v81;
                      }
                      while (v81);
                    }
                    BOOL v12 = v73;
                    if (v73)
                    {
                      uuid_copy(dst, (const unsigned __int8 *)(v73 + 8));
                      long long v71 = *(_OWORD *)dst;
                      *(_OWORD *)((char *)v62 + 52) = *(_OWORD *)dst;
                      *(_OWORD *)stat buf = v71;
                      if (!sub_1C86F00FC(v82, buf))
                      {
                        v72 = sub_1C86EA62C((uint64_t)v82, *(uint64_t *)dst, *(uint64_t *)&dst[8]);
                        *(_OWORD *)(v72 + 24) = *(_OWORD *)dst;
                        *((void *)v72 + 5) = *(void *)v73;
                      }
                      BOOL v12 = 0;
                    }
                    char v13 = 1;
                    uint64_t v24 = v16;
                    uint64_t v14 = v23;
                    goto LABEL_171;
                  }
                  goto LABEL_143;
                }
                if (v50 < 4 || v52 != 19) {
                  goto LABEL_144;
                }
                uint64_t v49 = *(void *)(v18 + 8);
                goto LABEL_100;
              }
              switch(v53)
              {
                case 2309:
                  BOOL v48 = 0;
                  uint64_t v42 = v54;
                  break;
                case 2312:
                  BOOL v48 = 0;
                  uint64_t v47 = v54;
                  break;
                case 2368:
                  sub_1C86F657C();
              }
            }
LABEL_143:
            uint64_t v41 = v51 + 16;
            uint64_t v18 = v51;
            if (v51 + 16 > v10) {
              goto LABEL_144;
            }
            continue;
          }
        }
        char v13 = 1;
        uint64_t v24 = v16;
        uint64_t v86 = *(void *)(v3 + 8);
        BOOL v12 = 1;
      }
LABEL_171:
      uint64_t v3 = v11 + *(unsigned int *)(v3 + 4);
      uint64_t v11 = v3 + 16;
      uint64_t v16 = v24;
    }
    while (v3 + 16 <= v10);
  }
}

void sub_1C86EA3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  *(void *)(v31 + 80) = a13;
  sub_1C86EAD9C((uint64_t)&a31);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86EA470(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    sub_1C86F45C0();
  }
  if (!result) {
    sub_1C86F45C0();
  }
  if (!a3) {
    sub_1C86F45C0();
  }
  if (a2)
  {
    uint64_t v5 = (void *)(result + 200);
    uint64_t v11 = (uint64_t *)(a4 + 48);
    uint64_t v12 = a4 + 64;
    int v6 = (const unsigned __int8 *)(a3 + 4);
    uint64_t v7 = a2;
    do
    {
      uuid_clear(uu);
      memset(v15, 0, sizeof(v15));
      int v16 = 1065353216;
      uint64_t v17 = 0;
      int v18 = -1;
      BOOL v19 = 0;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v8 = *((unsigned int *)v6 - 1);
      uuid_copy(dst, v6);
      if (v8)
      {
        int v18 = *(_DWORD *)(a4 + 24);
        *(_OWORD *)uuid_t uu = *(_OWORD *)dst;
        v15[0] = v8;
        BOOL v19 = sub_1C86F00FC(v5, uu) != 0;
        unint64_t v9 = *(void *)(a4 + 56);
        if (v9 >= *(void *)(a4 + 64))
        {
          uint64_t v10 = sub_1C86F1180(v11, (long long *)uu);
        }
        else
        {
          sub_1C86F12A8(v12, *(void *)(a4 + 56), (long long *)uu);
          uint64_t v10 = v9 + 112;
          *(void *)(a4 + 56) = v9 + 112;
        }
        *(void *)(a4 + 56) = v10;
      }
      if (SHIBYTE(v21) < 0) {
        operator delete(*((void **)&v20 + 1));
      }
      v6 += 20;
      double result = sub_1C86ECE94((uint64_t)&v15[1]);
      --v7;
    }
    while (v7);
  }
  return result;
}

void sub_1C86EA600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  *(void *)(v5 + 56) = v6;
  sub_1C86EAD9C((uint64_t)va);
  _Unwind_Resume(a1);
}

const unsigned __int8 *sub_1C86EA62C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = a2;
  v5[1] = a3;
  uint64_t v4 = v5;
  return sub_1C86F085C(a1, (const unsigned __int8 *)v5, (uint64_t)&unk_1C86F79D0, &v4) + 32;
}

void *sub_1C86EA69C(void *result, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v11 = *(unsigned int *)result;
  if (v11 > 0x1000)
  {
    uint64_t v12 = &v11;
    double result = sub_1C86ED2B8(a3 + 112, &v11, (uint64_t)&unk_1C86F79D0, &v12);
    ++result[3];
  }
  if (a2 >= 2)
  {
    uint64_t v6 = a3 + 112;
    uint64_t v7 = a2;
    uint64_t v8 = (int *)v5 + 1;
    uint64_t v9 = v7 - 1;
    do
    {
      int v10 = *v8++;
      unint64_t v11 = (v10 - 1);
      if (v11 > 0x1000)
      {
        uint64_t v12 = &v11;
        double result = sub_1C86ED2B8(v6, &v11, (uint64_t)&unk_1C86F79D0, &v12);
        ++result[3];
      }
      --v9;
    }
    while (v9);
  }
  return result;
}

unint64_t *sub_1C86EA784(unint64_t *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v6 = result;
  unint64_t v7 = *result;
  unint64_t v14 = *result;
  if (a3) {
    unint64_t v8 = 0x100000000;
  }
  else {
    unint64_t v8 = 4096;
  }
  if (v8 < v7)
  {
    uint64_t v15 = &v14;
    double result = sub_1C86ED2B8(a4 + 112, &v14, (uint64_t)&unk_1C86F79D0, &v15);
    ++result[3];
  }
  if (a2 >= 2)
  {
    uint64_t v9 = a4 + 112;
    uint64_t v10 = a2;
    unint64_t v11 = (uint64_t *)(v6 + 1);
    uint64_t v12 = v10 - 1;
    do
    {
      uint64_t v13 = *v11++;
      unint64_t v14 = v13 - 1;
      if (v8 < v13 - 1)
      {
        uint64_t v15 = &v14;
        double result = sub_1C86ED2B8(v9, &v14, (uint64_t)&unk_1C86F79D0, &v15);
        ++result[3];
      }
      --v12;
    }
    while (v12);
  }
  return result;
}

void sub_1C86EA87C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    sub_1C86F45C0();
  }
  if (a2 && a3)
  {
    if (*(unsigned char *)(a1 + 264))
    {
      int v4 = *__error();
      uint64_t v5 = sub_1C86DE154();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_1C86D7000, v5, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_dscsym_data] Shortcircuit due to signal received", buf, 2u);
      }

      *__error() = v4;
    }
    else
    {
      *(void *)stat buf = 0;
      BOOL v19 = buf;
      uint64_t v20 = 0x7012000000;
      long long v21 = sub_1C86EAB84;
      uint64_t v22 = sub_1C86EABC0;
      uint64_t v23 = "";
      memset(v24, 0, sizeof(v24));
      uuid_clear(v25);
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      *(void *)uuid_t uu = 0;
      uint64_t v17 = 0;
      int v6 = dscsym_iterate_buffer();
      if (v6)
      {
        memset(out, 0, sizeof(out));
        uuid_unparse(uu, out);
        int v7 = *__error();
        unint64_t v8 = sub_1C86DE154();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1C86F6598((uint64_t)out, v6, v8);
        }

        *__error() = v7;
      }
      else
      {
        uuid_copy(dst, uu);
        long long v9 = *(_OWORD *)dst;
        *(_OWORD *)(v19 + 72) = *(_OWORD *)dst;
        uint64_t v10 = (void *)(a1 + 120);
        *(_OWORD *)uuid_string_t out = v9;
        unint64_t v11 = sub_1C86F00FC(v10, (const unsigned __int8 *)out);
        if (!v11)
        {
          *(_OWORD *)uuid_string_t out = *(_OWORD *)dst;
          uint64_t v13 = out;
          unint64_t v11 = sub_1C86F085C((uint64_t)v10, (const unsigned __int8 *)out, (uint64_t)&unk_1C86F79D0, (_OWORD **)&v13);
        }
        uint64_t v12 = (uint64_t)(v11 + 32);
        if ((uint8_t *)v12 != v19 + 48) {
          sub_1C86F1724(v12, *((long long **)v19 + 6), *((long long **)v19 + 7), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)v19 + 7) - *((void *)v19 + 6)) >> 4));
        }
      }
      _Block_object_dispose(buf, 8);
      *(void *)uuid_string_t out = v24;
      sub_1C86F10A4((void ***)out);
    }
  }
}

void sub_1C86EAB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void **a25,uint64_t a26,char a27)
{
}

__n128 sub_1C86EAB84(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  __n128 result = *(__n128 *)(a2 + 72);
  long long v3 = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v3;
  *(__n128 *)(a1 + 72) = result;
  return result;
}

void sub_1C86EABC0(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  sub_1C86F10A4(&v1);
}

uint64_t sub_1C86EABEC(uint64_t a1, const unsigned __int8 *a2, char *a3, char *__s1, uint64_t a5, void *a6)
{
  __p[5] = *(void **)MEMORY[0x1E4F143B8];
  if (!strcmp(__s1, "__TEXT"))
  {
    uuid_clear(uu);
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
    int v22 = 1065353216;
    uint64_t v23 = 0;
    int v24 = -1;
    char v25 = 0;
    memset(__p, 0, 32);
    uuid_copy(dst, a2);
    *(_OWORD *)uuid_t uu = *(_OWORD *)dst;
    *(void *)&v20[0] = a5;
    char v25 = 0;
    if (a3)
    {
      size_t v11 = strlen(a3);
      sub_1C86F028C(&__dst, a3, v11);
      if (SHIBYTE(__p[3]) < 0) {
        operator delete(__p[1]);
      }
      *(_OWORD *)&__p[1] = __dst;
      __p[3] = v17;
    }
    if (a6) {
      __p[0] = a6;
    }
    uint64_t v12 = *(uint64_t **)(*(void *)(a1 + 32) + 8);
    unint64_t v13 = v12[7];
    if (v13 >= v12[8])
    {
      uint64_t v14 = sub_1C86F1180(v12 + 6, (long long *)uu);
    }
    else
    {
      sub_1C86F12A8((uint64_t)(v12 + 8), v12[7], (long long *)uu);
      uint64_t v14 = v13 + 112;
      v12[7] = v13 + 112;
    }
    v12[7] = v14;
    if (SHIBYTE(__p[3]) < 0) {
      operator delete(__p[1]);
    }
    sub_1C86ECE94((uint64_t)v20 + 8);
  }
  return 0;
}

void sub_1C86EAD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  *(void *)(v8 + 56) = v7;
  sub_1C86EAD9C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86EAD9C(uint64_t a1)
{
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  sub_1C86ECE94(a1 + 24);
  return a1;
}

void sub_1C86EADD8(uint64_t a1, _OWORD *a2, unint64_t a3, int a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    sub_1C86F45C0();
  }
  int v4 = a2;
  if (!a2) {
    sub_1C86F45C0();
  }
  if (!a3) {
    sub_1C86F45C0();
  }
  if (*(unsigned char *)(a1 + 264))
  {
    int v6 = *__error();
    uint64_t v7 = sub_1C86DE154();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1C86D7000, v7, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_threadmap_data] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v6;
  }
  else if (a4 == 64)
  {
    if (a3 >= 0x20)
    {
      unint64_t v14 = a3 >> 5;
      do
      {
        long long v15 = v4[1];
        *(_OWORD *)stat buf = *v4;
        *(_OWORD *)&uint8_t buf[16] = v15;
        unint64_t v23 = *(void *)buf;
        int v16 = *(_DWORD *)&buf[8];
        if ((*(_DWORD *)&buf[8] & 0x80000000) == 0)
        {
          *(void *)&long long v21 = &v23;
          *((_DWORD *)sub_1C86F0E80(a1, &v23, (uint64_t)&unk_1C86F79D0, (void **)&v21) + 6) = v16;
          *(void *)&long long v21 = v23;
          if (!sub_1C86ED204((void *)(a1 + 40), (unint64_t *)&v21))
          {
            unint64_t v24 = v23;
            *(void *)&long long v21 = &v24;
            uint64_t v17 = sub_1C86F1C10(a1 + 40, &v24, (uint64_t)&unk_1C86F79D0, (void **)&v21);
            v17[3] = v23;
            *((_DWORD *)v17 + 8) = *(_DWORD *)&buf[8];
          }
          LODWORD(v21) = v16;
          if (!sub_1C86F03E0((void *)(a1 + 80), (int *)&v21))
          {
            LODWORD(v24) = v16;
            *(void *)&long long v21 = &v24;
            int v18 = sub_1C86F0494(a1 + 80, (int *)&v24, (uint64_t)&unk_1C86F79D0, (_DWORD **)&v21);
            *((_DWORD *)v18 + 12) = v16;
            size_t v19 = strnlen(&buf[12], 0x14uLL);
            sub_1C86F028C(&v21, &buf[12], v19);
            uint64_t v20 = (void **)(v18 + 3);
            if (*((char *)v18 + 47) < 0) {
              operator delete(*v20);
            }
            *(_OWORD *)uint64_t v20 = v21;
            v18[5] = v22;
          }
        }
        v4 += 2;
        --v14;
      }
      while (v14);
    }
  }
  else
  {
    if (a4 != 32) {
      sub_1C86F6620();
    }
    if (a3 >= 0x1C)
    {
      unint64_t v8 = a3 / 0x1C;
      do
      {
        *(_OWORD *)stat buf = *v4;
        *(_OWORD *)&uint8_t buf[12] = *(_OWORD *)((char *)v4 + 12);
        int v9 = *(_DWORD *)&buf[4];
        unint64_t v23 = *(unsigned int *)buf;
        if ((*(_DWORD *)&buf[4] & 0x80000000) == 0)
        {
          *(void *)&long long v21 = &v23;
          *((_DWORD *)sub_1C86F0E80(a1, &v23, (uint64_t)&unk_1C86F79D0, (void **)&v21) + 6) = v9;
          *(void *)&long long v21 = v23;
          if (!sub_1C86ED204((void *)(a1 + 40), (unint64_t *)&v21))
          {
            unint64_t v24 = v23;
            *(void *)&long long v21 = &v24;
            uint64_t v10 = sub_1C86F1C10(a1 + 40, &v24, (uint64_t)&unk_1C86F79D0, (void **)&v21);
            v10[3] = v23;
            *((_DWORD *)v10 + 8) = *(_DWORD *)&buf[4];
          }
          LODWORD(v21) = v9;
          if (!sub_1C86F03E0((void *)(a1 + 80), (int *)&v21))
          {
            LODWORD(v24) = v9;
            *(void *)&long long v21 = &v24;
            size_t v11 = sub_1C86F0494(a1 + 80, (int *)&v24, (uint64_t)&unk_1C86F79D0, (_DWORD **)&v21);
            *((_DWORD *)v11 + 12) = v9;
            size_t v12 = strnlen(&buf[8], 0x14uLL);
            sub_1C86F028C(&v21, &buf[8], v12);
            unint64_t v13 = (void **)(v11 + 3);
            if (*((char *)v11 + 47) < 0) {
              operator delete(*v13);
            }
            *(_OWORD *)unint64_t v13 = v21;
            v11[5] = v22;
          }
        }
        int v4 = (_OWORD *)((char *)v4 + 28);
        --v8;
      }
      while (v8);
    }
  }
}

void *sub_1C86EB188(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a1 + 80;
  LODWORD(v22) = 0;
  __n128 result = sub_1C86F03E0((void *)(a1 + 80), (int *)&v22);
  if (result)
  {
    uint64_t v6 = (uint64_t)(result + 3);
  }
  else
  {
    LODWORD(v21) = 0;
    uint64_t v22 = (unint64_t *)&v21;
    uint64_t v7 = sub_1C86F0494(v4, (int *)&v21, (uint64_t)&unk_1C86F79D0, (_DWORD **)&v22);
    uint64_t v6 = (uint64_t)(v7 + 3);
    *((_DWORD *)v7 + 12) = 0;
    __n128 result = (void *)MEMORY[0x1C87CB500](v7 + 3, "kernel_task");
  }
  uint64_t v8 = *a2;
  if ((*a2 & 0x40) != 0)
  {
    unsigned int v9 = *((_DWORD *)a2 + 541);
    if (v9)
    {
      __n128 result = sub_1C86EA784((unint64_t *)a2 + 271, v9, (*((_DWORD *)a2 + 540) >> 2) & 1, v6);
      uint64_t v8 = *a2;
    }
  }
  if ((v8 & 0x80) != 0 && *((_DWORD *)a2 + 27))
  {
    if ((v8 & 4) == 0) {
      sub_1C86F45C0();
    }
    int v10 = *((_DWORD *)a2 + 26);
    size_t v11 = (unint64_t *)a2[2];
    size_t v12 = (void *)(a1 + 40);
    uint64_t v22 = v11;
    __n128 result = sub_1C86ED204(v12, (unint64_t *)&v22);
    if (!result)
    {
      long long v21 = v11;
      uint64_t v22 = (unint64_t *)&v21;
      __n128 result = sub_1C86F1C10((uint64_t)v12, (unint64_t *)&v21, (uint64_t)&unk_1C86F79D0, &v22);
      result[3] = v11;
    }
    unint64_t v13 = (char *)(result + 3);
    uint64_t v14 = *((unsigned int *)a2 + 27);
    unint64_t v15 = a2[14];
    long long v21 = (unint64_t *)v15;
    if ((v10 & 4) != 0) {
      unint64_t v16 = 0x100000000;
    }
    else {
      unint64_t v16 = 4096;
    }
    if (v16 < v15)
    {
      uint64_t v22 = (unint64_t *)&v21;
      __n128 result = sub_1C86ED2B8((uint64_t)(result + 5), (unint64_t *)&v21, (uint64_t)&unk_1C86F79D0, &v22);
      ++result[3];
    }
    if (v14 >= 2)
    {
      uint64_t v17 = (uint64_t)(v13 + 16);
      uint64_t v18 = v14 - 1;
      size_t v19 = a2 + 15;
      do
      {
        uint64_t v20 = *v19++;
        long long v21 = (unint64_t *)(v20 - 1);
        if (v16 < v20 - 1)
        {
          uint64_t v22 = (unint64_t *)&v21;
          __n128 result = sub_1C86ED2B8(v17, (unint64_t *)&v21, (uint64_t)&unk_1C86F79D0, &v22);
          ++result[3];
        }
        --v18;
      }
      while (v18);
    }
  }
  return result;
}

double sub_1C86EB370(uint64_t a1, unint64_t a2, char *a3, int a4)
{
  unint64_t v15 = a2;
  if (a4 != -1)
  {
    *(void *)&long long v13 = &v15;
    *((_DWORD *)sub_1C86F0E80(a1, &v15, (uint64_t)&unk_1C86F79D0, (void **)&v13) + 6) = a4;
    *(void *)&long long v13 = v15;
    uint64_t v7 = sub_1C86ED204((void *)(a1 + 40), (unint64_t *)&v13);
    if (!v7)
    {
      unint64_t v16 = v15;
      *(void *)&long long v13 = &v16;
      uint64_t v7 = sub_1C86F1C10(a1 + 40, &v16, (uint64_t)&unk_1C86F79D0, (void **)&v13);
    }
    v7[3] = v15;
    *((_DWORD *)v7 + 8) = a4;
    uint64_t v8 = a1 + 80;
    LODWORD(v13) = a4;
    unsigned int v9 = sub_1C86F03E0((void *)(a1 + 80), (int *)&v13);
    if (!v9)
    {
      LODWORD(v16) = a4;
      *(void *)&long long v13 = &v16;
      unsigned int v9 = sub_1C86F0494(v8, (int *)&v16, (uint64_t)&unk_1C86F79D0, (_DWORD **)&v13);
    }
    *((_DWORD *)v9 + 12) = a4;
    if (a3)
    {
      size_t v11 = (void **)(v9 + 3);
      size_t v12 = strnlen(a3, 0x20uLL);
      sub_1C86F028C(&v13, a3, v12);
      if (*((char *)v9 + 47) < 0) {
        operator delete(*v11);
      }
      double result = *(double *)&v13;
      *(_OWORD *)size_t v11 = v13;
      v9[5] = v14;
    }
  }
  return result;
}

void sub_1C86EB4C4(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 264))
  {
    int v5 = *__error();
    uint64_t v6 = sub_1C86DE154();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1C86D7000, v6, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_process_info] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v5;
  }
  else
  {
    id v19 = v3;
    uint64_t v7 = [v3 objectForKeyedSubscript:@"Pid"];
    int v21 = [v7 intValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"LoadInfos"];
    if (v8)
    {
      *(_DWORD *)stat buf = v21;
      uint64_t v18 = v8;
      unsigned int v9 = sub_1C86F03E0((void *)(a1 + 80), (int *)buf);
      if (!v9)
      {
        LODWORD(v26) = v21;
        *(void *)stat buf = &v26;
        unsigned int v9 = sub_1C86F0494(a1 + 80, (int *)&v26, (uint64_t)&unk_1C86F79D0, (_DWORD **)buf);
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v35 count:16];
      if (v11)
      {
        size_t v12 = (void *)(a1 + 200);
        uint64_t v20 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            unint64_t v15 = [v10 objectForKey:v14, v18];
            uuid_clear(buf);
            memset(v28, 0, sizeof(v28));
            int v29 = 1065353216;
            uint64_t v30 = 0;
            int v31 = -1;
            BOOL v32 = 0;
            long long v33 = 0u;
            long long v34 = 0u;
            sub_1C86ED18C((uint64_t)&v26, v14);
            *(_OWORD *)stat buf = v26;
            v28[0] = [v15 unsignedLongLongValue];
            int v31 = v21;
            BOOL v32 = sub_1C86F00FC(v12, buf) != 0;
            unint64_t v16 = v9[10];
            if (v16 >= v9[11])
            {
              uint64_t v17 = sub_1C86F1180(v9 + 9, (long long *)buf);
            }
            else
            {
              sub_1C86F12A8((uint64_t)(v9 + 11), v9[10], (long long *)buf);
              uint64_t v17 = v16 + 112;
              v9[10] = v16 + 112;
            }
            v9[10] = v17;
            if (SHIBYTE(v34) < 0) {
              operator delete(*((void **)&v33 + 1));
            }
            sub_1C86ECE94((uint64_t)&v28[1]);
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v35 count:16];
        }
        while (v11);
      }

      uint64_t v8 = v18;
    }

    uint64_t v4 = v19;
  }
}

void sub_1C86EB7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C86EB864(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 264))
  {
    int v5 = *__error();
    uint64_t v6 = sub_1C86DE154();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1C86D7000, v6, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_process_info] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v5;
  }
  else
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"TEXT_EXEC"];
    char v8 = [v7 BOOLValue];

    if (v8)
    {
      id v9 = [v4 objectForKeyedSubscript:@"UUID_String"];
      id v10 = v9;
      if (!v9)
      {
        _os_assert_log();
        uint64_t v17 = _os_crash();
        sub_1C86F54A0(v17);
      }

      sub_1C86ED18C((uint64_t)buf, v10);
      if (!sub_1C86F00FC((void *)(a1 + 200), buf))
      {
        sub_1C86F1EE8(a1 + 200, buf, buf);
        for (uint64_t i = *(void **)(a1 + 96); i; uint64_t i = (void *)*i)
        {
          size_t v12 = (long long *)i[9];
          long long v13 = (long long *)i[10];
          while (v12 != v13)
          {
            long long v18 = *v12;
            if (!uuid_compare((const unsigned __int8 *)&v18, buf))
            {
              *((unsigned char *)v12 + 76) = 1;
              break;
            }
            v12 += 7;
          }
        }
        for (uint64_t j = *(void **)(a1 + 136); j; uint64_t j = (void *)*j)
        {
          unint64_t v15 = (long long *)j[4];
          unint64_t v16 = (long long *)j[5];
          while (v15 != v16)
          {
            long long v18 = *v15;
            if (!uuid_compare((const unsigned __int8 *)&v18, buf))
            {
              *((unsigned char *)v15 + 76) = 1;
              break;
            }
            v15 += 7;
          }
        }
      }
    }
  }
}

void sub_1C86EBA5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1C86EBAA8(void *result, uint64_t a2, void *a3, void *a4)
{
  if (!result) {
    sub_1C86F45C0();
  }
  if (!a3) {
    sub_1C86F45C0();
  }
  if (!a4) {
    sub_1C86F45C0();
  }
  *a3 = 0;
  *a4 = 0;
  uint64_t v7 = *(void *)(a2 + 48);
  if (v7)
  {
    double result = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    if (!result) {
      sub_1C86F45C0();
    }
    char v8 = *(void **)(a2 + 40);
    if (v8)
    {
      uint64_t v9 = 0;
      do
      {
        result[v9++] = v8[2];
        char v8 = (void *)*v8;
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }
    if (v9 != v7) {
      sub_1C86F45C0();
    }
    *a4 = result;
    *a3 = v7;
  }
  return result;
}

BOOL sub_1C86EBB5C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 64) > *(void *)(a2 + 64);
}

uint64_t sub_1C86EBB70(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    sub_1C86F45C0();
  }
  if (!a4) {
    sub_1C86F45C0();
  }
  unsigned int v138 = 0;
  id v135 = 0;
  id v136 = 0;
  unint64_t v137 = 0;
  if (*(unsigned char *)(a1 + 264))
  {
    int v5 = *__error();
    uint64_t v6 = sub_1C86DE154();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1C86D7000, v6, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_write_to_file] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v5;
    uint64_t v7 = 4;
    goto LABEL_178;
  }
  for (uint64_t i = *(void **)(a1 + 56); i; uint64_t i = (void *)*i)
  {
    if (i[8])
    {
      *(void *)stat buf = i[2];
      uint64_t v9 = sub_1C86ED204((void *)a1, (unint64_t *)buf);
      if (v9)
      {
        *(_DWORD *)stat buf = *((_DWORD *)v9 + 6);
        id v10 = sub_1C86F03E0((void *)(a1 + 80), (int *)buf);
        if (!v10)
        {
          _os_assert_log();
          uint64_t v127 = _os_crash();
          sub_1C86F54A0(v127);
        }
        uint64_t v11 = (void *)i[7];
        if (v11)
        {
          uint64_t v12 = (uint64_t)(v10 + 17);
          do
          {
            uint64_t v13 = v11[3];
            *(void *)uuid_t uu = v11[2];
            *(void *)stat buf = uu;
            uint64_t v14 = sub_1C86ED2B8(v12, (unint64_t *)uu, (uint64_t)&unk_1C86F79D0, (void **)buf);
            v14[3] += v13;
            uint64_t v11 = (void *)*v11;
          }
          while (v11);
        }
      }
      sub_1C86ED758(i + 5);
    }
  }
  sub_1C86ED7C0(a1 + 40);
  for (uint64_t j = *(void **)(a1 + 136); j; uint64_t j = (void *)*j)
  {
    unint64_t v16 = (long long *)j[4];
    uint64_t v17 = (long long *)j[5];
    if (v16 != v17)
    {
      uint64_t v18 = j[9];
      uint64_t v19 = j[4];
      do
      {
        *(void *)(v19 + 16) += v18;
        v19 += 112;
      }
      while ((long long *)v19 != v17);
      sub_1C86ED818(v16, v17, (uint64_t)buf, 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (v17 - v16)), 1);
      uint64_t v20 = j[5];
      j[10] = *(void *)(j[4] + 16);
      j[11] = *(void *)(v20 - 32) + *(void *)(v20 - 96);
    }
  }
  uint64_t v132 = (void *)(a1 + 120);
  int v21 = *(uint64_t **)(a1 + 96);
  uint64_t v131 = a1;
  if (!v21)
  {
    int v29 = 0;
LABEL_50:
    char v40 = 1;
    goto LABEL_51;
  }
  do
  {
    *(_OWORD *)uuid_t uu = *(_OWORD *)((char *)v21 + 52);
    if (uuid_is_null(uu))
    {
      *(_OWORD *)uuid_t uu = *(_OWORD *)(a1 + 240);
      *(_OWORD *)((char *)v21 + 52) = *(_OWORD *)uu;
    }
    if (!uuid_is_null(uu))
    {
      *(_OWORD *)stat buf = *(_OWORD *)uu;
      long long v22 = sub_1C86F00FC(v132, buf);
      if (!v22)
      {
        _os_assert_log();
        uint64_t v128 = _os_crash();
        sub_1C86F54A0(v128);
      }
      uuid_clear(buf);
      memset(v141, 0, sizeof(v141));
      int v142 = 1065353216;
      uint64_t v143 = 0;
      int v144 = -1;
      char v145 = 0;
      long long v146 = 0u;
      long long v147 = 0u;
      *(_OWORD *)stat buf = *(_OWORD *)uu;
      uint64_t v23 = *((void *)v22 + 11);
      *(void *)&uint8_t buf[16] = *((void *)v22 + 10);
      *(void *)&long long v146 = v23 - *(void *)&buf[16];
      MEMORY[0x1C87CB500]((char *)&v146 + 8, "shared_cache");
      unint64_t v24 = v21[10];
      if (v24 >= v21[11])
      {
        long long v25 = (long long *)sub_1C86F1180(v21 + 9, (long long *)buf);
      }
      else
      {
        sub_1C86F12A8((uint64_t)(v21 + 11), v21[10], (long long *)buf);
        long long v25 = (long long *)(v24 + 112);
        v21[10] = v24 + 112;
      }
      long long v26 = (long long *)v21[9];
      unint64_t v27 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (v25 - v26));
      v21[10] = (uint64_t)v25;
      if (v25 == v26) {
        uint64_t v28 = 0;
      }
      else {
        uint64_t v28 = v27;
      }
      sub_1C86ED818(v26, v25, (uint64_t)&v134, v28, 1);
      if (SHIBYTE(v147) < 0) {
        operator delete(*((void **)&v146 + 1));
      }
      sub_1C86ECE94((uint64_t)v141);
    }
    int v21 = (uint64_t *)*v21;
  }
  while (v21);
  int v29 = *(uint64_t **)(a1 + 96);
  if (!v29) {
    goto LABEL_50;
  }
  uint64_t v30 = *(void **)(a1 + 96);
  do
  {
    uint64_t v32 = v30[9];
    uint64_t v31 = v30[10];
    if (v31 != v32)
    {
      unint64_t v33 = 0x6DB6DB6DB6DB6DB7 * ((v31 - v32) >> 4);
      if (v33 >= 2)
      {
        uint64_t v34 = *(void *)(v32 + 16);
        unsigned int v35 = (void *)(v32 + 80);
        unsigned int v36 = 2;
        uint64_t v37 = 1;
        do
        {
          uint64_t v38 = *(void *)(v32 + 112 * v37 + 16);
          if (!*v35) {
            *unsigned int v35 = v38 - v34;
          }
          uint64_t v37 = v36;
          BOOL v39 = v33 > v36++;
          v35 += 14;
          uint64_t v34 = v38;
        }
        while (v39);
      }
      if (!*(void *)(v31 - 32)) {
        *(void *)(v31 - 32) = 0x10000000;
      }
    }
    uint64_t v30 = (void *)*v30;
  }
  while (v30);
  char v40 = 0;
LABEL_51:
  for (k = *(void **)(a1 + 136); k; k = (void *)*k)
  {
    uint64_t v43 = k[4];
    uint64_t v42 = k[5];
    if (v42 != v43 && !*(void *)(v43 + 80))
    {
      unint64_t v44 = 0x6DB6DB6DB6DB6DB7 * ((v42 - v43) >> 4);
      if (v44 >= 2)
      {
        uint64_t v45 = *(void *)(v43 + 16);
        unsigned int v46 = (void *)(v43 + 80);
        unsigned int v47 = 2;
        uint64_t v48 = 1;
        do
        {
          uint64_t v49 = *(void *)(v43 + 112 * v48 + 16);
          *unsigned int v46 = v49 - v45;
          v46 += 14;
          uint64_t v48 = v47;
          BOOL v39 = v44 > v47++;
          uint64_t v45 = v49;
        }
        while (v39);
      }
      *(void *)(v42 - 32) = 0x4000000;
    }
  }
  if ((v40 & 1) == 0)
  {
    while (1)
    {
      uint64_t v50 = (void *)v29[19];
      if (v50) {
        break;
      }
LABEL_102:
      sub_1C86ED758(v29 + 17);
      int v29 = (uint64_t *)*v29;
      if (!v29) {
        goto LABEL_103;
      }
    }
    uu2 = (const unsigned __int8 *)v29 + 52;
    while (1)
    {
      unint64_t v52 = v50[2];
      uint64_t v51 = v50[3];
      if (v52) {
        BOOL v53 = v51 == 0;
      }
      else {
        BOOL v53 = 1;
      }
      if (v53) {
        goto LABEL_94;
      }
      uint64_t v55 = (unsigned __int8 *)v29[9];
      uint64_t v54 = (unsigned __int8 *)v29[10];
      if (v54 != v55)
      {
        unint64_t v56 = 0x6DB6DB6DB6DB6DB7 * ((v54 - v55) >> 4);
        do
        {
          unint64_t v57 = v56 >> 1;
          uint64_t v58 = &v55[112 * (v56 >> 1)];
          unint64_t v59 = *((void *)v58 + 10) + *((void *)v58 + 2);
          uint64_t v60 = v58 + 112;
          v56 += ~(v56 >> 1);
          if (v59 < v52) {
            uint64_t v55 = v60;
          }
          else {
            unint64_t v56 = v57;
          }
        }
        while (v56);
      }
      if (v55 == v54)
      {
        int v65 = *__error();
        uint64_t v66 = sub_1C86DE154();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v77 = v29 + 3;
          if (*((char *)v29 + 47) < 0) {
            unsigned int v77 = (uint64_t *)v29[3];
          }
          *(_DWORD *)stat buf = 134218242;
          *(void *)&uint8_t buf[4] = v52;
          *(_WORD *)&uint8_t buf[12] = 2080;
          *(void *)&buf[14] = v77;
          _os_log_debug_impl(&dword_1C86D7000, v66, OS_LOG_TYPE_DEBUG, "Address %#llx is out of range of all binaries in proc %s", buf, 0x16u);
        }

        uint64_t v67 = __error();
      }
      else
      {
        int v61 = uuid_compare(v55, uu2);
        int v62 = *__error();
        int v63 = sub_1C86DE154();
        BOOL v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG);
        if (v61)
        {
          if (v64)
          {
            *(_DWORD *)stat buf = 134217984;
            *(void *)&uint8_t buf[4] = v52;
            _os_log_debug_impl(&dword_1C86D7000, v63, OS_LOG_TYPE_DEBUG, "Address %#llx is in non-shared-cache binary", buf, 0xCu);
          }

          *__error() = v62;
LABEL_93:
          sub_1C86EF4D8(v55, v52, v51);
          goto LABEL_94;
        }
        if (v64)
        {
          *(_DWORD *)stat buf = 134217984;
          *(void *)&uint8_t buf[4] = v52;
          _os_log_debug_impl(&dword_1C86D7000, v63, OS_LOG_TYPE_DEBUG, "Address %#llx is in shared cache", buf, 0xCu);
        }

        *__error() = v62;
        *(_OWORD *)stat buf = *(_OWORD *)uu2;
        unint64_t v68 = sub_1C86F00FC(v132, buf);
        if (!v68)
        {
          _os_assert_log();
          uint64_t v126 = _os_crash();
          sub_1C86F54A0(v126);
        }
        uint64_t v55 = (unsigned __int8 *)*((void *)v68 + 4);
        int v69 = (unsigned __int8 *)*((void *)v68 + 5);
        if (v69 != v55)
        {
          unint64_t v70 = 0x6DB6DB6DB6DB6DB7 * ((v69 - v55) >> 4);
          do
          {
            unint64_t v71 = v70 >> 1;
            v72 = &v55[112 * (v70 >> 1)];
            unint64_t v73 = *((void *)v72 + 10) + *((void *)v72 + 2);
            uint64_t v74 = v72 + 112;
            v70 += ~(v70 >> 1);
            if (v73 < v52) {
              uint64_t v55 = v74;
            }
            else {
              unint64_t v70 = v71;
            }
          }
          while (v70);
        }
        int v65 = *__error();
        uint64_t v75 = sub_1C86DE154();
        BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG);
        if (v55 != v69)
        {
          if (v76)
          {
            *(_DWORD *)stat buf = 134217984;
            *(void *)&uint8_t buf[4] = v52;
            _os_log_debug_impl(&dword_1C86D7000, v75, OS_LOG_TYPE_DEBUG, "Found a shared cache binary for %#llx", buf, 0xCu);
          }

          *__error() = v65;
          goto LABEL_93;
        }
        if (v76)
        {
          *(_DWORD *)stat buf = 134217984;
          *(void *)&uint8_t buf[4] = v52;
          _os_log_debug_impl(&dword_1C86D7000, v75, OS_LOG_TYPE_DEBUG, "Couldn't find a shared cache binary that %#llx falls into", buf, 0xCu);
        }

        uint64_t v67 = __error();
      }
      *uint64_t v67 = v65;
LABEL_94:
      uint64_t v50 = (void *)*v50;
      if (!v50) {
        goto LABEL_102;
      }
    }
  }
LABEL_103:
  uint64_t v78 = (void *)(v131 + 160);
  sub_1C86EF644(v131 + 160);
  for (m = *(void **)(v131 + 136); m; m = (void *)*m)
  {
    uint64_t v81 = (const unsigned __int8 *)m[4];
    double v80 = (long long *)m[5];
    while (v81 != (const unsigned __int8 *)v80)
    {
      *(void *)stat buf = v81;
      uint64_t v82 = sub_1C86EF69C((uint64_t)v78, v81, (uint64_t)&unk_1C86F79D0, (_OWORD **)buf);
      uint64_t v83 = v82;
      long long v84 = *(_OWORD *)v81;
      *((void *)v82 + 6) = *((void *)v81 + 2);
      *((_OWORD *)v82 + 2) = v84;
      if (v82 + 32 != v81)
      {
        *((_DWORD *)v82 + 22) = *((_DWORD *)v81 + 14);
        sub_1C86EFA7C((void *)v82 + 7, *((void **)v81 + 5), 0);
      }
      long long v85 = *((_OWORD *)v81 + 4);
      *((void *)v83 + 14) = *((void *)v81 + 10);
      *((_OWORD *)v83 + 6) = v85;
      std::string::operator=((std::string *)v83 + 5, (const std::string *)(v81 + 88));
      v81 += 112;
    }
  }
  sub_1C86F00A4((uint64_t)v132);
  for (n = *(const unsigned __int8 **)(v131 + 96); n; n = *(const unsigned __int8 **)n)
  {
    char v87 = (const unsigned __int8 *)*((void *)n + 9);
    for (iuint64_t i = (long long *)*((void *)n + 10); v87 != (const unsigned __int8 *)ii; v87 += 112)
    {
      *(_OWORD *)uuid_t uu = *(_OWORD *)v87;
      if (uuid_compare(uu, n + 52))
      {
        *(_OWORD *)stat buf = *(_OWORD *)uu;
        id v89 = sub_1C86F00FC(v78, buf);
        if (v89) {
          id v90 = v89 + 32;
        }
        else {
          id v90 = 0;
        }
        if (v89)
        {
          int v91 = (void *)*((void *)v87 + 5);
          if (v91)
          {
            uint64_t v92 = (uint64_t)(v89 + 56);
            do
            {
              *(void *)stat buf = v91[2];
              sub_1C86F0C64(v92, (unint64_t *)buf, buf);
              int v91 = (void *)*v91;
            }
            while (v91);
          }
          *((void *)v90 + 8) += *((void *)v87 + 8);
          if (*((_DWORD *)v90 + 18) == 1)
          {
            int v93 = *((_DWORD *)v87 + 18);
            if (v93 != 1) {
              *((_DWORD *)v90 + 18) = v93;
            }
          }
        }
        else
        {
          *(void *)stat buf = uu;
          BOOL v94 = sub_1C86EF69C((uint64_t)v78, uu, (uint64_t)&unk_1C86F79D0, (_OWORD **)buf);
          long long v95 = v94;
          long long v96 = *(_OWORD *)v87;
          *((void *)v94 + 6) = *((void *)v87 + 2);
          *((_OWORD *)v94 + 2) = v96;
          if (v94 + 32 != v87)
          {
            *((_DWORD *)v94 + 22) = *((_DWORD *)v87 + 14);
            sub_1C86EFA7C((void *)v94 + 7, *((void **)v87 + 5), 0);
          }
          long long v97 = *((_OWORD *)v87 + 4);
          *((void *)v95 + 14) = *((void *)v87 + 10);
          *((_OWORD *)v95 + 6) = v97;
          std::string::operator=((std::string *)v95 + 5, (const std::string *)(v87 + 88));
        }
        sub_1C86ED758((void *)v87 + 3);
        *((void *)v87 + 8) = 0;
      }
    }
  }
  sub_1C86F0234(v131 + 80);
  uint64_t v98 = *(long long **)(v131 + 176);
  if (v98)
  {
    BOOL v99 = v136;
    do
    {
      if ((unint64_t)v99 >= v137)
      {
        BOOL v99 = (long long *)sub_1C86F1180((uint64_t *)&v135, v98 + 2);
      }
      else
      {
        sub_1C86F12A8((uint64_t)&v137, (uint64_t)v99, v98 + 2);
        v99 += 7;
      }
      id v136 = v99;
      uint64_t v98 = *(long long **)v98;
    }
    while (v98);
  }
  else
  {
    BOOL v99 = v136;
  }
  unint64_t v100 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (v99 - v135));
  *(void *)stat buf = sub_1C86EBB5C;
  if (v99 == v135) {
    uint64_t v101 = 0;
  }
  else {
    uint64_t v101 = v100;
  }
  sub_1C86F2174(v135, v99, (uint64_t (**)(long long *, long long *))buf, v101, 1);
  id v102 = objc_alloc_init(MEMORY[0x1E4FAA5D0]);
  id v103 = v136;
  if (v135 != v136)
  {
    char v104 = 0;
    id v105 = v135 + 6;
    while (1)
    {
      *(_OWORD *)uuid_t uu = *(v105 - 6);
      if (*((char *)v105 + 15) < 0) {
        int v106 = *(void *)v105 ? (char *)*((void *)v105 - 1) : 0;
      }
      else {
        int v106 = *((unsigned char *)v105 + 15) ? (char *)v105 - 8 : 0;
      }
      id v107 = v105 - 6;
      unsigned int v108 = *((_DWORD *)v105 - 6);
      int v109 = *((unsigned __int8 *)v105 - 20);
      uint64_t v139 = 0;
      uint64_t v134 = 0;
      if (*(unsigned char *)(v131 + 264)) {
        break;
      }
      sub_1C86EBAA8((void *)v131, (uint64_t)(v105 - 6), &v134, &v139);
      int v110 = *__error();
      char v111 = sub_1C86DE154();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v116 = *((void *)v105 - 4);
        *(_DWORD *)stat buf = 136315394;
        *(void *)&uint8_t buf[4] = v106;
        *(_WORD *)&uint8_t buf[12] = 2048;
        *(void *)&buf[14] = v116;
        _os_log_debug_impl(&dword_1C86D7000, v111, OS_LOG_TYPE_DEBUG, "Frequency of offsets in binary %s: %llu", buf, 0x16u);
      }

      *__error() = v110;
      int v112 = *__error();
      id v113 = sub_1C86DE154();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 136315394;
        *(void *)&uint8_t buf[4] = v106;
        *(_WORD *)&uint8_t buf[12] = 2048;
        *(void *)&buf[14] = v134;
        _os_log_debug_impl(&dword_1C86D7000, v113, OS_LOG_TYPE_DEBUG, "Number of offsets in binary %s: %lu", buf, 0x16u);
      }

      id v114 = 0;
      *__error() = v112;
      if (v134 && *((void *)v105 - 4))
      {
        id v129 = &v138;
        id v115 = tailspin_symbolicator_copy_symbol_data_using_uuid_pid_path(v102, a2, (uint64_t)uu, v108, v106, v109 != 0, (uint64_t *)v139, v134);
        free(v139);
        if (v115)
        {
          id v114 = v115;
          [v114 bytes:&v138];
          [v114 length];
          if (!ktrace_file_append_chunk())
          {
            int v119 = *__error();
            uint64_t v120 = sub_1C86DE154();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
            {
              int v121 = __error();
              sub_1C86F663C((uint64_t)v106, v121, buf, v120);
            }

            *__error() = v119;
            int v122 = *__error();
            if (!v122) {
              int v122 = -1;
            }
            unsigned int v138 = v122;

            goto LABEL_175;
          }
          char v104 = 1;
        }
        else
        {
          if (v138) {
            goto LABEL_175;
          }
          id v114 = 0;
        }
      }

      v105 += 7;
      if (v107 + 7 == v103) {
        goto LABEL_175;
      }
    }
    if (v104)
    {
      int v117 = *__error();
      uint64_t v118 = sub_1C86DE154();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_1C86D7000, v118, OS_LOG_TYPE_INFO, "Signal received, skipping further symbolication", buf, 2u);
      }
    }
    else
    {
      int v117 = *__error();
      uint64_t v118 = sub_1C86DE154();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_1C86D7000, v118, OS_LOG_TYPE_INFO, "Signal received, skipping symbolication", buf, 2u);
      }
    }

    *__error() = v117;
  }
LABEL_175:
  [v102 invalidateConnection:v129];
  int v124 = v135;
  for (juint64_t j = (uint64_t)v136; (long long *)jj != v124; sub_1C86F113C((uint64_t)&v137, jj))
    jj -= 112;
  id v136 = v124;
  uint64_t v7 = v138;

LABEL_178:
  *(void *)uuid_t uu = &v135;
  sub_1C86F10A4((void ***)uu);
  return v7;
}

void sub_1C86ECA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,void **a28)
{
  a28 = (void **)&a24;
  sub_1C86F10A4(&a28);
  _Unwind_Resume(a1);
}

void sub_1C86ECAE8(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    sub_1C86F45C0();
  }
  puts("\nProcesses List");
  for (uint64_t i = *(uint64_t **)(a1 + 96); i; uint64_t i = (uint64_t *)*i)
  {
    uuid_unparse((const unsigned __int8 *)i + 52, out);
    id v3 = (const char *)(i + 3);
    if (*((char *)i + 47) < 0) {
      id v3 = *(const char **)v3;
    }
    printf("\t%s (%d) | Libs: %ld Addresses: %ld, shared_cache_uuid: %s\n", v3, *((_DWORD *)i + 12), 0x6DB6DB6DB6DB6DB7 * ((i[10] - i[9]) >> 4), i[20], out);
    puts("\t\tLibraries:");
    uint64_t v4 = i[9];
    uint64_t v5 = i[10];
    if (v4 != v5)
    {
      uint64_t v6 = v4 + 88;
      do
      {
        uint64_t v7 = v6 - 88;
        uuid_unparse((const unsigned __int8 *)(v6 - 88), out);
        if (*(char *)(v6 + 23) < 0)
        {
          char v8 = *(const char **)(v6 + 8);
          if (v8) {
            char v8 = *(const char **)v6;
          }
        }
        else if (*(unsigned char *)(v6 + 23))
        {
          char v8 = (const char *)v6;
        }
        else
        {
          char v8 = 0;
        }
        printf("\t\t\t%s - %llx - %s\n", out, *(void *)(v6 - 72), v8);
        v6 += 112;
      }
      while (v7 + 112 != v5);
    }
  }
  puts("\nShared Caches");
  for (uint64_t j = *(const unsigned __int8 **)(a1 + 136); j; uint64_t j = *(const unsigned __int8 **)j)
  {
    uuid_unparse(j + 16, out);
    sub_1C86F3D6C(__p, out);
    if (v23 >= 0) {
      id v10 = __p;
    }
    else {
      id v10 = (void **)__p[0];
    }
    printf("\tSharedCache: %s | Libraries: %ld\n", (const char *)v10, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)j + 5) - *((void *)j + 4)) >> 4));
    if (v23 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v11 = *((void *)j + 4);
    uint64_t v12 = *((void *)j + 5);
    if (v11 != v12)
    {
      uint64_t v13 = v11 + 88;
      do
      {
        uint64_t v14 = v13 - 88;
        uuid_unparse((const unsigned __int8 *)(v13 - 88), out);
        sub_1C86F3D6C(__p, out);
        if (v23 >= 0) {
          unint64_t v15 = __p;
        }
        else {
          unint64_t v15 = (void **)__p[0];
        }
        unint64_t v16 = (const char *)v13;
        if (*(char *)(v13 + 23) < 0) {
          unint64_t v16 = *(const char **)v13;
        }
        printf("\t\t%s - %llx - %s\n", (const char *)v15, *(void *)(v13 - 72), v16);
        if (v23 < 0) {
          operator delete(__p[0]);
        }
        v13 += 112;
      }
      while (v14 + 112 != v12);
    }
  }
  puts("\nDefault Shared Cache");
  *(_OWORD *)uuid_t uu = *(_OWORD *)(a1 + 240);
  uuid_unparse(uu, out);
  sub_1C86F3D6C(__p, out);
  if (v23 >= 0) {
    uint64_t v17 = __p;
  }
  else {
    uint64_t v17 = (void **)__p[0];
  }
  printf("\t%s\n", (const char *)v17);
  if (v23 < 0) {
    operator delete(__p[0]);
  }
  puts("\nSymbol Owners");
  for (k = *(uint64_t **)(a1 + 176); k; k = (uint64_t *)*k)
  {
    *(_OWORD *)uuid_t uu = *((_OWORD *)k + 1);
    uuid_unparse(uu, out);
    uint64_t v19 = k[10];
    if (v19)
    {
      putchar(9);
      sub_1C86F3D6C(__p, out);
      if (v23 >= 0) {
        uint64_t v20 = __p;
      }
      else {
        uint64_t v20 = (void **)__p[0];
      }
      int v21 = (const char *)(k + 15);
      if (*((char *)k + 143) < 0) {
        int v21 = *(const char **)v21;
      }
      printf(" %s | Size: %#-15llx - Offsets: %#-5lx | %s \n", (const char *)v20, k[14], v19, v21);
      if (v23 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_1C86ECE80(void *a1)
{
}

uint64_t sub_1C86ECE94(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      id v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_1C86ECEE0(uint64_t a1)
{
  sub_1C86ECF1C(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_1C86ECF1C(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      id v3 = (void *)*v2;
      sub_1C86ECF60((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_1C86ECF60(uint64_t a1)
{
  if (*(char *)(a1 + 127) < 0) {
    operator delete(*(void **)(a1 + 104));
  }

  return sub_1C86ECE94(a1 + 40);
}

uint64_t sub_1C86ECFA4(uint64_t a1)
{
  sub_1C86ECFE0(a1, *(char **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_1C86ECFE0(uint64_t a1, char *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      id v3 = *(char **)v2;
      uint64_t v4 = (void **)(v2 + 32);
      sub_1C86F10A4(&v4);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_1C86ED034(uint64_t a1)
{
  sub_1C86ED070(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_1C86ED070(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      id v3 = (void *)*v2;
      sub_1C86ED0B4((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void sub_1C86ED0B4(uint64_t a1)
{
  sub_1C86ECE94(a1 + 120);
  sub_1C86ECE94(a1 + 80);
  uint64_t v2 = (void **)(a1 + 56);
  sub_1C86F10A4(&v2);
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
}

uint64_t sub_1C86ED10C(uint64_t a1)
{
  sub_1C86ED148(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_1C86ED148(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      id v3 = (void *)*v2;
      sub_1C86ECE94((uint64_t)(v2 + 5));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_1C86ED18C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
  [v4 getUUIDBytes:a1];

  return a1;
}

void sub_1C86ED1E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1C86ED204(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  double result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      double result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *sub_1C86ED2B8(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    id v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_1C86ED50C(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  uint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t i = *v20;
LABEL_38:
    *uint64_t v20 = i;
    goto LABEL_39;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v21 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    uint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1C86ED4C4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C86ED4D8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void sub_1C86ED50C(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_1C86ED5FC(a1, prime);
    }
  }
}

void sub_1C86ED5FC(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_1C86ED4D8();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    id v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *sub_1C86ED758(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    double result = (void *)result[2];
    if (result)
    {
      do
      {
        int8x8_t v2 = (void *)*result;
        operator delete(result);
        double result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void sub_1C86ED7C0(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_1C86ED148(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

long long *sub_1C86ED818(long long *result, long long *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint8x8_t v9 = a2;
  id v10 = result;
  char v23 = a2;
  unint64_t v24 = result;
LABEL_2:
  for (uint64_t i = 1 - a4; ; ++i)
  {
    uint64_t v12 = (char *)v9 - (char *)v10;
    unint64_t v13 = 0x6DB6DB6DB6DB6DB7 * (v9 - v10);
    if (!(!v6 & v5))
    {
      switch(v13)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          char v23 = v9 - 7;
          if (*((void *)v9 - 12) < *((void *)v10 + 2)) {
            double result = (long long *)sub_1C86EDB24(&v24, &v23);
          }
          break;
        case 3uLL:
          char v23 = v9 - 7;
          double result = (long long *)sub_1C86EE080((uint64_t)v10, (uint64_t)(v10 + 7), (uint64_t)(v9 - 7));
          break;
        case 4uLL:
          char v23 = v9 - 7;
          double result = (long long *)sub_1C86EEA24((uint64_t)v10, (uint64_t)(v10 + 7), (uint64_t)(v10 + 14), (uint64_t)(v9 - 7));
          break;
        case 5uLL:
          char v23 = v9 - 7;
          double result = (long long *)sub_1C86EEACC((uint64_t)v10, (uint64_t)(v10 + 7), (uint64_t)(v10 + 14), (uint64_t)(v10 + 21), (uint64_t)(v9 - 7));
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v12 <= 2687)
    {
      if (a5) {
        return (long long *)sub_1C86EDCAC((uint64_t)v10, (uint64_t)v9);
      }
      else {
        return (long long *)sub_1C86EDEB0((uint64_t)v10, (uint64_t)v9);
      }
    }
    if (i == 1) {
      break;
    }
    unint64_t v14 = v13 >> 1;
    uint64_t v15 = (uint64_t)(v9 - 7);
    if ((unint64_t)v12 >= 0x3801)
    {
      sub_1C86EE080((uint64_t)v10, (uint64_t)&v10[7 * (v13 >> 1)], v15);
      uint64_t v16 = 7 * v14;
      uint64_t v17 = 112 * v14 - 112;
      size_t v18 = v23;
      sub_1C86EE080((uint64_t)(v24 + 7), (uint64_t)v24 + v17, (uint64_t)(v23 - 14));
      sub_1C86EE080((uint64_t)(v24 + 14), (uint64_t)&v24[v16 + 7], (uint64_t)(v18 - 21));
      sub_1C86EE080((uint64_t)v24 + v17, (uint64_t)&v24[v16], (uint64_t)&v24[v16 + 7]);
      long long v22 = &v24[v16];
      sub_1C86EDB24(&v24, &v22);
    }
    else
    {
      sub_1C86EE080((uint64_t)&v10[7 * (v13 >> 1)], (uint64_t)v10, v15);
    }
    if (a5)
    {
      uint8x8_t v9 = v23;
    }
    else
    {
      uint8x8_t v9 = v23;
      if (*((void *)v24 - 12) >= *((void *)v24 + 2))
      {
        double result = sub_1C86EE144((uint64_t)v24, v23);
        id v10 = result;
        goto LABEL_22;
      }
    }
    uint64_t v19 = sub_1C86EE3A4((uint64_t)v24, v9);
    if ((v20 & 1) == 0) {
      goto LABEL_20;
    }
    int v21 = sub_1C86EE610((uint64_t)v24, v19);
    id v10 = v19 + 7;
    double result = (long long *)sub_1C86EE610((uint64_t)(v19 + 7), v9);
    if (result)
    {
      if (v21) {
        return result;
      }
      char v23 = v19;
      id v10 = v24;
      uint8x8_t v9 = v19;
    }
    else
    {
      if (!v21)
      {
LABEL_20:
        double result = (long long *)sub_1C86ED818(v24, v19, a3, -i, a5 & 1);
        id v10 = v19 + 7;
LABEL_22:
        a5 = 0;
        unint64_t v24 = v10;
        a4 = -i;
        goto LABEL_2;
      }
      unint64_t v24 = v19 + 7;
    }
  }
  if (v10 != v9) {
    return sub_1C86EEBA4(v10, v9, v9, a3);
  }
  return result;
}

uint64_t sub_1C86EDB24(long long **a1, long long **a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v15 = *((void *)*a1 + 2);
  long long v14 = **a1;
  sub_1C86EE910((uint64_t)v16, (uint64_t *)*a1 + 3);
  long long v4 = v2[4];
  uint64_t v18 = *((void *)v2 + 10);
  long long v17 = v4;
  char v5 = (void **)v2 + 11;
  uint64_t v6 = *((void *)v2 + 13);
  long long v19 = *(long long *)((char *)v2 + 88);
  uint64_t v20 = v6;
  *((void *)v2 + 12) = 0;
  *((void *)v2 + 13) = 0;
  *((void *)v2 + 11) = 0;
  long long v7 = *v3;
  *((void *)v2 + 2) = *((void *)v3 + 2);
  long long *v2 = v7;
  sub_1C86EE980((uint64_t)v2 + 24, (uint64_t *)v3 + 3);
  long long v8 = v3[4];
  *((void *)v2 + 10) = *((void *)v3 + 10);
  v2[4] = v8;
  if (*((char *)v2 + 111) < 0) {
    operator delete(*v5);
  }
  uint8x8_t v9 = (void **)v3 + 11;
  long long v10 = *(long long *)((char *)v3 + 88);
  *((void *)v2 + 13) = *((void *)v3 + 13);
  *(_OWORD *)char v5 = v10;
  *((unsigned char *)v3 + 111) = 0;
  *((unsigned char *)v3 + 88) = 0;
  *uint64_t v3 = v14;
  *((void *)v3 + 2) = v15;
  sub_1C86EE980((uint64_t)v3 + 24, v16);
  long long v11 = v17;
  *((void *)v3 + 10) = v18;
  v3[4] = v11;
  if (*((char *)v3 + 111) < 0) {
    operator delete(*v9);
  }
  long long v12 = v19;
  *((void *)v3 + 13) = v20;
  *(_OWORD *)uint8x8_t v9 = v12;
  HIBYTE(v20) = 0;
  LOBYTE(v19) = 0;
  return sub_1C86ECE94((uint64_t)v16);
}

uint64_t sub_1C86EDCAC(uint64_t result, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 112;
    if (result + 112 != a2)
    {
      uint64_t v5 = 0;
      uint64_t v6 = result;
      do
      {
        uint64_t v7 = v4;
        if (*(void *)(v6 + 128) < *(void *)(v6 + 16))
        {
          long long v15 = *(_OWORD *)v4;
          unint64_t v16 = *(void *)(v4 + 16);
          sub_1C86EE910((uint64_t)v17, (uint64_t *)(v6 + 136));
          long long v18 = *(_OWORD *)(v6 + 176);
          uint64_t v19 = *(void *)(v6 + 192);
          long long v20 = *(_OWORD *)(v6 + 200);
          uint64_t v21 = *(void *)(v6 + 216);
          *(void *)(v6 + 200) = 0;
          *(void *)(v6 + 208) = 0;
          uint64_t v8 = v5;
          *(void *)(v6 + 216) = 0;
          while (1)
          {
            uint64_t v9 = v8;
            uint64_t v10 = v3 + v8;
            *(_OWORD *)(v10 + 112) = *(_OWORD *)(v3 + v8);
            *(void *)(v10 + 128) = *(void *)(v3 + v8 + 16);
            sub_1C86EE980(v3 + v8 + 136, (uint64_t *)(v3 + v8 + 24));
            *(_OWORD *)(v10 + 176) = *(_OWORD *)(v10 + 64);
            *(void *)(v10 + 192) = *(void *)(v10 + 80);
            long long v11 = (void **)(v10 + 200);
            if (*(char *)(v10 + 223) < 0) {
              operator delete(*v11);
            }
            *(_OWORD *)long long v11 = *(_OWORD *)(v10 + 88);
            *(void *)(v10 + 216) = *(void *)(v10 + 104);
            *(unsigned char *)(v10 + 111) = 0;
            *(unsigned char *)(v10 + 88) = 0;
            if (!v9) {
              break;
            }
            uint64_t v8 = v9 - 112;
            if (v16 >= *(void *)(v3 + v9 - 96))
            {
              uint64_t v12 = v3 + v9;
              goto LABEL_12;
            }
          }
          uint64_t v12 = v3;
LABEL_12:
          *(_OWORD *)uint64_t v12 = v15;
          *(void *)(v12 + 16) = v16;
          uint64_t v13 = v3 + v9;
          sub_1C86EE980(v13 + 24, v17);
          *(void *)(v13 + 80) = v19;
          *(_OWORD *)(v13 + 64) = v18;
          uint64_t v14 = v13 + 88;
          if (*(char *)(v12 + 111) < 0) {
            operator delete(*(void **)v14);
          }
          *(_OWORD *)uint64_t v14 = v20;
          *(void *)(v14 + 16) = v21;
          HIBYTE(v21) = 0;
          LOBYTE(v20) = 0;
          double result = sub_1C86ECE94((uint64_t)v17);
        }
        uint64_t v4 = v7 + 112;
        v5 += 112;
        uint64_t v6 = v7;
      }
      while (v7 + 112 != a2);
    }
  }
  return result;
}

uint64_t sub_1C86EDEB0(uint64_t result, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 112;
    if (result + 112 != a2)
    {
      uint64_t v5 = (char *)(result + 223);
      do
      {
        uint64_t v6 = v4;
        if (*(void *)(v3 + 128) < *(void *)(v3 + 16))
        {
          long long v10 = *(_OWORD *)v4;
          unint64_t v11 = *(void *)(v4 + 16);
          sub_1C86EE910((uint64_t)v12, (uint64_t *)(v3 + 136));
          long long v13 = *(_OWORD *)(v3 + 176);
          uint64_t v14 = *(void *)(v3 + 192);
          long long v15 = *(_OWORD *)(v3 + 200);
          uint64_t v16 = *(void *)(v3 + 216);
          *(void *)(v3 + 200) = 0;
          *(void *)(v3 + 208) = 0;
          uint64_t v7 = v5;
          *(void *)(v3 + 216) = 0;
          do
          {
            *(_OWORD *)(v7 - 111) = *(_OWORD *)(v7 - 223);
            *(void *)(v7 - 95) = *(void *)(v7 - 207);
            sub_1C86EE980((uint64_t)(v7 - 87), (uint64_t *)(v7 - 199));
            *(_OWORD *)(v7 - 47) = *(_OWORD *)(v7 - 159);
            *(void *)(v7 - 31) = *(void *)(v7 - 143);
            uint64_t v8 = (void **)(v7 - 23);
            if (*v7 < 0) {
              operator delete(*v8);
            }
            *(void *)(v7 - 7) = *(void *)(v7 - 119);
            *(v7 - 112) = 0;
            v7 -= 112;
            *(_OWORD *)uint64_t v8 = *(_OWORD *)(v7 - 23);
            *(v7 - 23) = 0;
          }
          while (v11 < *(void *)(v7 - 207));
          *(_OWORD *)(v7 - 111) = v10;
          *(void *)(v7 - 95) = v11;
          sub_1C86EE980((uint64_t)(v7 - 87), v12);
          *(_OWORD *)(v7 - 47) = v13;
          *(void *)(v7 - 31) = v14;
          uint64_t v9 = (void **)(v7 - 23);
          if (*v7 < 0) {
            operator delete(*v9);
          }
          *(_OWORD *)uint64_t v9 = v15;
          *(void *)(v7 - 7) = v16;
          HIBYTE(v16) = 0;
          LOBYTE(v15) = 0;
          double result = sub_1C86ECE94((uint64_t)v12);
        }
        uint64_t v4 = v6 + 112;
        v5 += 112;
        uint64_t v3 = v6;
      }
      while (v6 + 112 != a2);
    }
  }
  return result;
}

uint64_t sub_1C86EE080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v10 = (long long *)a1;
  uint64_t v8 = (long long *)a3;
  uint64_t v9 = (long long *)a2;
  unint64_t v3 = *(void *)(a2 + 16);
  unint64_t v4 = *(void *)(a3 + 16);
  if (v3 < *(void *)(a1 + 16))
  {
    if (v4 < v3)
    {
      sub_1C86EDB24(&v10, &v8);
      return 1;
    }
    sub_1C86EDB24(&v10, &v9);
    if (*((void *)v8 + 2) >= *((void *)v9 + 2)) {
      return 1;
    }
    uint64_t v5 = &v9;
    uint64_t v6 = &v8;
LABEL_9:
    sub_1C86EDB24(v5, v6);
    return 2;
  }
  if (v4 < v3)
  {
    sub_1C86EDB24(&v9, &v8);
    if (*((void *)v9 + 2) >= *((void *)v10 + 2)) {
      return 1;
    }
    uint64_t v5 = &v10;
    uint64_t v6 = &v9;
    goto LABEL_9;
  }
  return 0;
}

long long *sub_1C86EE144(uint64_t a1, long long *a2)
{
  uint64_t v2 = a2;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v25 = a2;
  long long v27 = *(_OWORD *)a1;
  unint64_t v28 = *(void *)(a1 + 16);
  uint64_t v4 = a1 + 24;
  sub_1C86EE910((uint64_t)v29, (uint64_t *)(a1 + 24));
  long long v30 = *(_OWORD *)(a1 + 64);
  uint64_t v31 = *(void *)(a1 + 80);
  long long v32 = *(_OWORD *)(a1 + 88);
  uint64_t v33 = *(void *)(a1 + 104);
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  if (v28 >= *((void *)v2 - 12))
  {
    unint64_t v8 = a1 + 112;
    do
    {
      uint64_t v6 = (long long *)v8;
      if (v8 >= (unint64_t)v2) {
        break;
      }
      unint64_t v9 = *(void *)(v8 + 16);
      v8 += 112;
    }
    while (v28 >= v9);
  }
  else
  {
    uint64_t v5 = a1;
    do
    {
      uint64_t v6 = (long long *)(v5 + 112);
      unint64_t v7 = *(void *)(v5 + 128);
      v5 += 112;
    }
    while (v28 >= v7);
  }
  uint64_t v26 = v6;
  if (v6 < v2)
  {
    do
    {
      unint64_t v10 = *((void *)v2 - 12);
      v2 -= 7;
    }
    while (v28 < v10);
    long long v25 = v2;
  }
  if (v6 < v2)
  {
    do
    {
      sub_1C86EDB24(&v26, &v25);
      uint64_t v6 = v26;
      do
      {
        unint64_t v11 = *((void *)v6 + 16);
        v6 += 7;
      }
      while (v28 >= v11);
      uint64_t v26 = v6;
      uint64_t v12 = v25;
      do
      {
        unint64_t v13 = *((void *)v12 - 12);
        v12 -= 7;
      }
      while (v28 < v13);
      long long v25 = v12;
    }
    while (v6 < v12);
  }
  uint64_t v14 = v6 - 7;
  if (v6 - 7 != (long long *)a1)
  {
    long long v15 = (void **)(a1 + 88);
    long long v16 = *v14;
    *(void *)(a1 + 16) = *((void *)v6 - 12);
    *(_OWORD *)a1 = v16;
    sub_1C86EE980(v4, (uint64_t *)v6 - 11);
    long long v17 = *(v6 - 3);
    *(void *)(a1 + 80) = *((void *)v6 - 4);
    *(_OWORD *)(a1 + 64) = v17;
    if (*(char *)(a1 + 111) < 0) {
      operator delete(*v15);
    }
    long long v18 = *(long long *)((char *)v6 - 24);
    *(void *)(a1 + 104) = *((void *)v6 - 1);
    *(_OWORD *)long long v15 = v18;
    *((unsigned char *)v6 - 1) = 0;
    *((unsigned char *)v6 - 24) = 0;
  }
  long long v19 = v27;
  *((void *)v6 - 12) = v28;
  long long *v14 = v19;
  sub_1C86EE980((uint64_t)v6 - 88, v29);
  long long v20 = v30;
  *((void *)v6 - 4) = v31;
  *(v6 - 3) = v20;
  uint64_t v21 = (void **)v6 - 3;
  if (*((char *)v6 - 1) < 0) {
    operator delete(*v21);
  }
  long long v22 = v32;
  *((void *)v6 - 1) = v33;
  *(_OWORD *)uint64_t v21 = v22;
  HIBYTE(v33) = 0;
  LOBYTE(v32) = 0;
  char v23 = v26;
  sub_1C86ECE94((uint64_t)v29);
  return v23;
}

long long *sub_1C86EE3A4(uint64_t a1, long long *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = *(_OWORD *)a1;
  unint64_t v28 = *(void *)(a1 + 16);
  uint64_t v4 = a1 + 24;
  sub_1C86EE910((uint64_t)v29, (uint64_t *)(a1 + 24));
  uint64_t v5 = 0;
  long long v30 = *(_OWORD *)(a1 + 64);
  uint64_t v31 = *(void *)(a1 + 80);
  uint64_t v6 = (void **)(a1 + 88);
  long long v32 = *(_OWORD *)(a1 + 88);
  uint64_t v33 = *(void *)(a1 + 104);
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  do
  {
    unint64_t v7 = *(void *)(a1 + v5 + 128);
    v5 += 112;
  }
  while (v7 < v28);
  unint64_t v8 = (long long *)(a1 + v5);
  uint64_t v26 = (long long *)(a1 + v5);
  if (v5 == 112)
  {
    while (v8 < a2)
    {
      unint64_t v9 = a2 - 7;
      unint64_t v11 = *((void *)a2 - 12);
      a2 -= 7;
      if (v11 < v28) {
        goto LABEL_9;
      }
    }
    unint64_t v9 = a2;
  }
  else
  {
    do
    {
      unint64_t v9 = a2 - 7;
      unint64_t v10 = *((void *)a2 - 12);
      a2 -= 7;
    }
    while (v10 >= v28);
  }
LABEL_9:
  long long v25 = v9;
  uint64_t v12 = v8;
  if (v8 < v9)
  {
    do
    {
      sub_1C86EDB24(&v26, &v25);
      uint64_t v12 = v26;
      do
      {
        unint64_t v13 = *((void *)v12 + 16);
        v12 += 7;
      }
      while (v13 < v28);
      uint64_t v26 = v12;
      uint64_t v14 = v25;
      do
      {
        unint64_t v15 = *((void *)v14 - 12);
        v14 -= 7;
      }
      while (v15 >= v28);
      long long v25 = v14;
    }
    while (v12 < v14);
  }
  long long v16 = v12 - 7;
  if (v12 - 7 != (long long *)a1)
  {
    long long v17 = *v16;
    *(void *)(a1 + 16) = *((void *)v12 - 12);
    *(_OWORD *)a1 = v17;
    sub_1C86EE980(v4, (uint64_t *)v12 - 11);
    long long v18 = *(v12 - 3);
    *(void *)(a1 + 80) = *((void *)v12 - 4);
    *(_OWORD *)(a1 + 64) = v18;
    if (*(char *)(a1 + 111) < 0) {
      operator delete(*v6);
    }
    long long v19 = *(long long *)((char *)v12 - 24);
    *(void *)(a1 + 104) = *((void *)v12 - 1);
    *(_OWORD *)uint64_t v6 = v19;
    *((unsigned char *)v12 - 1) = 0;
    *((unsigned char *)v12 - 24) = 0;
  }
  long long v20 = v27;
  *((void *)v12 - 12) = v28;
  *long long v16 = v20;
  sub_1C86EE980((uint64_t)v12 - 88, v29);
  long long v21 = v30;
  *((void *)v12 - 4) = v31;
  *(v12 - 3) = v21;
  long long v22 = (void **)v12 - 3;
  if (*((char *)v12 - 1) < 0) {
    operator delete(*v22);
  }
  long long v23 = v32;
  *((void *)v12 - 1) = v33;
  *(_OWORD *)long long v22 = v23;
  HIBYTE(v33) = 0;
  LOBYTE(v32) = 0;
  sub_1C86ECE94((uint64_t)v29);
  return v12 - 7;
}

uint64_t sub_1C86EE610(uint64_t a1, long long *a2)
{
  uint64_t v2 = a2;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = a2;
  long long v17 = (long long *)a1;
  BOOL v4 = 1;
  switch(0x6DB6DB6DB6DB6DB7 * (((uint64_t)a2 - a1) >> 4))
  {
    case 0:
    case 1:
      return v4;
    case 2:
      long long v16 = a2 - 7;
      if (*((void *)a2 - 12) < *(void *)(a1 + 16)) {
        sub_1C86EDB24(&v17, &v16);
      }
      return v4;
    case 3:
      sub_1C86EE080(a1, a1 + 112, (uint64_t)(a2 - 7));
      return v4;
    case 4:
      sub_1C86EEA24(a1, a1 + 112, a1 + 224, (uint64_t)(a2 - 7));
      return v4;
    case 5:
      sub_1C86EEACC(a1, a1 + 112, a1 + 224, a1 + 336, (uint64_t)(a2 - 7));
      return v4;
    default:
      uint64_t v5 = a1 + 224;
      sub_1C86EE080(a1, a1 + 112, a1 + 224);
      uint64_t v6 = a1 + 336;
      if ((long long *)(a1 + 336) == v2) {
        return 1;
      }
      int v7 = 0;
      break;
  }
  while (*(void *)(v6 + 16) >= *(void *)(v5 + 16))
  {
LABEL_16:
    uint64_t v5 = v6;
    v6 += 112;
    if ((long long *)v6 == v2) {
      return 1;
    }
  }
  long long v18 = *(_OWORD *)v6;
  unint64_t v19 = *(void *)(v6 + 16);
  sub_1C86EE910((uint64_t)v20, (uint64_t *)(v6 + 24));
  long long v21 = *(_OWORD *)(v6 + 64);
  uint64_t v22 = *(void *)(v6 + 80);
  long long v23 = *(_OWORD *)(v6 + 88);
  uint64_t v24 = *(void *)(v6 + 104);
  *(void *)(v6 + 88) = 0;
  *(void *)(v6 + 96) = 0;
  *(void *)(v6 + 104) = 0;
  do
  {
    uint64_t v8 = v5;
    *(_OWORD *)(v5 + 112) = *(_OWORD *)v5;
    *(void *)(v5 + 128) = *(void *)(v5 + 16);
    sub_1C86EE980(v5 + 136, (uint64_t *)(v5 + 24));
    *(_OWORD *)(v5 + 176) = *(_OWORD *)(v5 + 64);
    *(void *)(v5 + 192) = *(void *)(v5 + 80);
    uint64_t v9 = v5 + 200;
    if (*(char *)(v8 + 223) < 0) {
      operator delete(*(void **)v9);
    }
    *(_OWORD *)uint64_t v9 = *(_OWORD *)(v8 + 88);
    *(void *)(v9 + 16) = *(void *)(v8 + 104);
    *(unsigned char *)(v8 + 111) = 0;
    *(unsigned char *)(v8 + 88) = 0;
    if ((long long *)v8 == v17) {
      break;
    }
    uint64_t v5 = v8 - 112;
  }
  while (v19 < *(void *)(v8 - 96));
  long long v10 = v18;
  *(void *)(v8 + 16) = v19;
  *(_OWORD *)uint64_t v8 = v10;
  sub_1C86EE980(v8 + 24, v20);
  long long v11 = v21;
  *(void *)(v8 + 80) = v22;
  *(_OWORD *)(v8 + 64) = v11;
  int v12 = *(char *)(v8 + 111);
  uint64_t v13 = v8 + 88;
  if (v12 < 0) {
    operator delete(*(void **)v13);
  }
  long long v14 = v23;
  *(void *)(v13 + 16) = v24;
  *(_OWORD *)uint64_t v13 = v14;
  HIBYTE(v24) = 0;
  LOBYTE(v23) = 0;
  if (++v7 != 8)
  {
    sub_1C86ECE94((uint64_t)v20);
    uint64_t v2 = v16;
    goto LABEL_16;
  }
  BOOL v4 = v6 + 112 == (void)v16;
  sub_1C86ECE94((uint64_t)v20);
  return v4;
}

uint64_t sub_1C86EE910(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  *(void *)double result = v2;
  *(void *)(result + 8) = a2[1];
  a2[1] = 0;
  uint64_t v5 = a2[2];
  unint64_t v3 = a2 + 2;
  uint64_t v4 = v5;
  *(void *)(result + 16) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 16;
    *unint64_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

void sub_1C86EE980(uint64_t a1, uint64_t *a2)
{
  sub_1C86ED758((void *)a1);
  uint64_t v4 = *a2;
  *a2 = 0;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  unint64_t v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    void *v7 = 0;
    v7[1] = 0;
  }
}

uint64_t sub_1C86EEA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v11 = (long long *)a2;
  unint64_t v12 = (long long *)a1;
  uint64_t v9 = (long long *)a4;
  uint64_t v10 = (long long *)a3;
  uint64_t result = sub_1C86EE080(a1, a2, a3);
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    uint64_t result = sub_1C86EDB24(&v10, &v9);
    if (*((void *)v10 + 2) < *(void *)(a2 + 16))
    {
      uint64_t result = sub_1C86EDB24(&v11, &v10);
      if (*((void *)v11 + 2) < *(void *)(a1 + 16)) {
        return sub_1C86EDB24(&v12, &v11);
      }
    }
  }
  return result;
}

uint64_t sub_1C86EEACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  long long v14 = (long long *)a2;
  unint64_t v15 = (long long *)a1;
  unint64_t v12 = (long long *)a4;
  uint64_t v13 = (long long *)a3;
  unint64_t v11 = (long long *)a5;
  uint64_t result = sub_1C86EEA24(a1, a2, a3, a4);
  if (*(void *)(a5 + 16) < *(void *)(a4 + 16))
  {
    uint64_t result = sub_1C86EDB24(&v12, &v11);
    if (*((void *)v12 + 2) < *(void *)(a3 + 16))
    {
      uint64_t result = sub_1C86EDB24(&v13, &v12);
      if (*((void *)v13 + 2) < *(void *)(a2 + 16))
      {
        uint64_t result = sub_1C86EDB24(&v14, &v13);
        if (*((void *)v14 + 2) < *(void *)(a1 + 16)) {
          return sub_1C86EDB24(&v15, &v14);
        }
      }
    }
  }
  return result;
}

long long *sub_1C86EEBA4(long long *a1, long long *a2, long long *a3, uint64_t a4)
{
  unint64_t v19 = a1;
  if (a1 != a2)
  {
    uint64_t v6 = a2;
    unint64_t v7 = a1;
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) / 112;
    if ((char *)a2 - (char *)a1 >= 113)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unint64_t v12 = &a1[7 * v10];
      do
      {
        sub_1C86EED10((uint64_t)v7, a4, v9, v12);
        v12 -= 7;
        --v11;
      }
      while (v11);
    }
    long long v18 = v6;
    if (v6 == a3)
    {
      a3 = v6;
    }
    else
    {
      uint64_t v13 = v6;
      do
      {
        if (*((void *)v13 + 2) < *((void *)v19 + 2))
        {
          sub_1C86EDB24(&v18, &v19);
          sub_1C86EED10((uint64_t)v19, a4, v9, v19);
          uint64_t v13 = v18;
        }
        v13 += 7;
        long long v18 = v13;
      }
      while (v13 != a3);
      unint64_t v7 = v19;
      uint64_t v8 = (char *)v6 - (char *)v19;
    }
    if (v8 >= 113)
    {
      unint64_t v14 = (((unint64_t)v8 >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64;
      do
      {
        sub_1C86EEF88((uint64_t)v7, (uint64_t)v6, a4, v14);
        v6 -= 7;
        BOOL v15 = v14 >= 2;
        BOOL v16 = v14-- == 2;
      }
      while (!v16 && v15);
      return v18;
    }
  }
  return a3;
}

uint64_t sub_1C86EED10(uint64_t result, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v5 = (uint64_t)a4;
    uint64_t v6 = result;
    int64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= 0x6DB6DB6DB6DB6DB7 * (((uint64_t)a4 - result) >> 4))
    {
      int64_t v9 = (0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4)) | 1;
      uint64_t v10 = result + 112 * v9;
      if ((uint64_t)(0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4) + 2) < a3)
      {
        unint64_t v11 = *(void *)(result + 112 * v9 + 16);
        unint64_t v12 = *(void *)(v10 + 128);
        v10 += 112 * (v11 < v12);
        if (v11 < v12) {
          int64_t v9 = 0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4) + 2;
        }
      }
      if (*(void *)(v10 + 16) >= *((void *)a4 + 2))
      {
        long long v25 = *a4;
        unint64_t v26 = *((void *)a4 + 2);
        sub_1C86EE910((uint64_t)v27, (uint64_t *)a4 + 3);
        long long v28 = *(_OWORD *)(v5 + 64);
        uint64_t v29 = *(void *)(v5 + 80);
        long long v30 = *(_OWORD *)(v5 + 88);
        uint64_t v31 = *(void *)(v5 + 104);
        *(void *)(v5 + 88) = 0;
        *(void *)(v5 + 96) = 0;
        *(void *)(v5 + 104) = 0;
        do
        {
          uint64_t v13 = v10;
          long long v14 = *(_OWORD *)v10;
          *(void *)(v5 + 16) = *(void *)(v10 + 16);
          *(_OWORD *)uint64_t v5 = v14;
          uint64_t v15 = v10 + 24;
          sub_1C86EE980(v5 + 24, (uint64_t *)(v10 + 24));
          long long v16 = *(_OWORD *)(v10 + 64);
          *(void *)(v5 + 80) = *(void *)(v10 + 80);
          *(_OWORD *)(v5 + 64) = v16;
          long long v17 = (void **)(v5 + 88);
          if (*(char *)(v5 + 111) < 0) {
            operator delete(*v17);
          }
          long long v18 = *(_OWORD *)(v13 + 88);
          *(void *)(v5 + 104) = *(void *)(v13 + 104);
          *(_OWORD *)long long v17 = v18;
          *(unsigned char *)(v13 + 111) = 0;
          *(unsigned char *)(v13 + 88) = 0;
          if (v7 < v9) {
            break;
          }
          uint64_t v19 = (2 * v9) | 1;
          uint64_t v10 = v6 + 112 * v19;
          if (2 * v9 + 2 < a3)
          {
            unint64_t v20 = *(void *)(v6 + 112 * v19 + 16);
            unint64_t v21 = *(void *)(v10 + 128);
            v10 += 112 * (v20 < v21);
            if (v20 < v21) {
              uint64_t v19 = 2 * v9 + 2;
            }
          }
          uint64_t v5 = v13;
          int64_t v9 = v19;
        }
        while (*(void *)(v10 + 16) >= v26);
        uint64_t v22 = (void **)(v13 + 88);
        *(void *)(v13 + 16) = v26;
        *(_OWORD *)uint64_t v13 = v25;
        sub_1C86EE980(v15, v27);
        long long v23 = v28;
        *(void *)(v13 + 80) = v29;
        *(_OWORD *)(v13 + 64) = v23;
        if (*(char *)(v13 + 111) < 0) {
          operator delete(*v22);
        }
        long long v24 = v30;
        *(void *)(v13 + 104) = v31;
        *(_OWORD *)uint64_t v22 = v24;
        HIBYTE(v31) = 0;
        LOBYTE(v30) = 0;
        return sub_1C86ECE94((uint64_t)v27);
      }
    }
  }
  return result;
}

uint64_t sub_1C86EEF88(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a4 >= 2)
  {
    uint64_t v7 = result;
    long long v20 = *(_OWORD *)result;
    uint64_t v21 = *(void *)(result + 16);
    sub_1C86EE910((uint64_t)v22, (uint64_t *)(result + 24));
    long long v23 = *(_OWORD *)(v7 + 64);
    uint64_t v24 = *(void *)(v7 + 80);
    *(_OWORD *)__p = *(_OWORD *)(v7 + 88);
    uint64_t v26 = *(void *)(v7 + 104);
    *(void *)(v7 + 88) = 0;
    *(void *)(v7 + 96) = 0;
    *(void *)(v7 + 104) = 0;
    uint64_t v8 = sub_1C86EF1F8((long long *)v7, a3, a4);
    int64_t v9 = (long long *)(a2 - 112);
    uint64_t v10 = (uint64_t)v8 + 24;
    if (v8 == (long long *)(a2 - 112))
    {
      *((void *)v8 + 2) = v21;
      *uint64_t v8 = v20;
      sub_1C86EE980(v10, v22);
      long long v17 = v23;
      *((void *)v8 + 10) = v24;
      v8[4] = v17;
      long long v18 = (void **)v8 + 11;
      if (*((char *)v8 + 111) < 0) {
        operator delete(*v18);
      }
      long long v19 = *(_OWORD *)__p;
      *((void *)v8 + 13) = v26;
      *(_OWORD *)long long v18 = v19;
      HIBYTE(v26) = 0;
      LOBYTE(__p[0]) = 0;
    }
    else
    {
      long long v11 = *v9;
      *((void *)v8 + 2) = *(void *)(a2 - 96);
      *uint64_t v8 = v11;
      sub_1C86EE980(v10, (uint64_t *)(a2 - 88));
      long long v12 = *(_OWORD *)(a2 - 48);
      *((void *)v8 + 10) = *(void *)(a2 - 32);
      v8[4] = v12;
      uint64_t v13 = (void **)v8 + 11;
      if (*((char *)v8 + 111) < 0) {
        operator delete(*v13);
      }
      long long v14 = (void **)(a2 - 24);
      long long v15 = *(_OWORD *)(a2 - 24);
      *((void *)v8 + 13) = *(void *)(a2 - 8);
      *(_OWORD *)uint64_t v13 = v15;
      *(unsigned char *)(a2 - 1) = 0;
      *(unsigned char *)(a2 - 24) = 0;
      uint64_t v16 = (uint64_t)(v8 + 7);
      long long *v9 = v20;
      *(void *)(a2 - 96) = v21;
      sub_1C86EE980(a2 - 88, v22);
      *(_OWORD *)(a2 - 48) = v23;
      *(void *)(a2 - 32) = v24;
      if (*(char *)(a2 - 1) < 0) {
        operator delete(*v14);
      }
      *(_OWORD *)long long v14 = *(_OWORD *)__p;
      *(void *)(a2 - 8) = v26;
      HIBYTE(v26) = 0;
      LOBYTE(__p[0]) = 0;
      sub_1C86EF2F4(v7, v16, a3, 0x6DB6DB6DB6DB6DB7 * ((v16 - v7) >> 4));
      if (SHIBYTE(v26) < 0) {
        operator delete(__p[0]);
      }
    }
    return sub_1C86ECE94((uint64_t)v22);
  }
  return result;
}

void sub_1C86EF1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1C86EAD9C((uint64_t)va);
  _Unwind_Resume(a1);
}

long long *sub_1C86EF1F8(long long *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = a3 - 2;
  if (a3 < 2) {
    uint64_t v6 = a3 - 1;
  }
  uint64_t v7 = v6 >> 1;
  do
  {
    uint64_t v8 = v5 + 1;
    int64_t v9 = &a1[7 * v5 + 7];
    uint64_t v10 = 2 * v5;
    uint64_t v5 = (2 * v5) | 1;
    uint64_t v11 = v10 + 2;
    if (v10 + 2 < a3)
    {
      unint64_t v12 = *(void *)&a1[7 * v8 + 1];
      unint64_t v13 = *((void *)v9 + 16);
      v9 += 7 * (v12 < v13);
      if (v12 < v13) {
        uint64_t v5 = v11;
      }
    }
    long long v14 = *v9;
    *((void *)a1 + 2) = *((void *)v9 + 2);
    *a1 = v14;
    sub_1C86EE980((uint64_t)a1 + 24, (uint64_t *)v9 + 3);
    long long v15 = v9[4];
    *((void *)a1 + 10) = *((void *)v9 + 10);
    a1[4] = v15;
    uint64_t v16 = (void **)a1 + 11;
    if (*((char *)a1 + 111) < 0) {
      operator delete(*v16);
    }
    long long v17 = *(long long *)((char *)v9 + 88);
    *((void *)a1 + 13) = *((void *)v9 + 13);
    *(_OWORD *)uint64_t v16 = v17;
    *((unsigned char *)v9 + 111) = 0;
    *((unsigned char *)v9 + 88) = 0;
    a1 = v9;
  }
  while (v5 <= v7);
  return v9;
}

uint64_t sub_1C86EF2F4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v6 = result;
    unint64_t v7 = v4 >> 1;
    if (*(void *)(result + 112 * (v4 >> 1) + 16) < *(void *)(a2 - 96))
    {
      uint64_t v8 = a2 - 112;
      long long v16 = *(_OWORD *)(a2 - 112);
      unint64_t v17 = *(void *)(a2 - 96);
      sub_1C86EE910((uint64_t)v18, (uint64_t *)(a2 - 88));
      long long v19 = *(_OWORD *)(a2 - 48);
      uint64_t v20 = *(void *)(a2 - 32);
      long long v21 = *(_OWORD *)(a2 - 24);
      uint64_t v22 = *(void *)(a2 - 8);
      *(void *)(a2 - 24) = 0;
      *(void *)(a2 - 16) = 0;
      *(void *)(a2 - 8) = 0;
      do
      {
        uint64_t v9 = v8;
        uint64_t v8 = v6 + 112 * v7;
        long long v10 = *(_OWORD *)v8;
        *(void *)(v9 + 16) = *(void *)(v8 + 16);
        *(_OWORD *)uint64_t v9 = v10;
        sub_1C86EE980(v9 + 24, (uint64_t *)(v8 + 24));
        long long v11 = *(_OWORD *)(v8 + 64);
        *(void *)(v9 + 80) = *(void *)(v8 + 80);
        *(_OWORD *)(v9 + 64) = v11;
        unint64_t v12 = (void **)(v9 + 88);
        if (*(char *)(v9 + 111) < 0) {
          operator delete(*v12);
        }
        uint64_t v13 = v6 + 112 * v7;
        long long v14 = *(_OWORD *)(v13 + 88);
        *(void *)(v9 + 104) = *(void *)(v13 + 104);
        *(_OWORD *)unint64_t v12 = v14;
        *(unsigned char *)(v8 + 111) = 0;
        *(unsigned char *)(v13 + 88) = 0;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
      }
      while (*(void *)(v6 + 112 * v7 + 16) < v17);
      uint64_t v15 = v13 + 88;
      *(_OWORD *)uint64_t v8 = v16;
      *(void *)(v8 + 16) = v17;
      sub_1C86EE980(v8 + 24, v18);
      *(_OWORD *)(v8 + 64) = v19;
      *(void *)(v8 + 80) = v20;
      if (*(char *)(v8 + 111) < 0) {
        operator delete(*(void **)v15);
      }
      *(_OWORD *)uint64_t v15 = v21;
      *(void *)(v15 + 16) = v22;
      HIBYTE(v22) = 0;
      LOBYTE(v21) = 0;
      return sub_1C86ECE94((uint64_t)v18);
    }
  }
  return result;
}

int *sub_1C86EF4D8(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a1[2];
  unint64_t v6 = a1[10] + v5;
  if (a2 >= v5 && v6 > a2)
  {
    *(void *)uint64_t v15 = a2 - v5;
    sub_1C86F0C64((uint64_t)(a1 + 3), (unint64_t *)v15, v15);
    a1[8] += a3;
    int v8 = *__error();
    uint64_t v9 = sub_1C86DE154();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1C86F6698((uint64_t)a1, a2, v9);
    }
  }
  else
  {
    int v8 = *__error();
    uint64_t v9 = sub_1C86DE154();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v12 = (void *)a1[11];
      long long v11 = a1 + 11;
      long long v10 = v12;
      if (*((char *)v11 + 23) >= 0) {
        long long v10 = v11;
      }
      *(_DWORD *)uint64_t v15 = 134218754;
      *(void *)&v15[4] = a2;
      __int16 v16 = 2048;
      unint64_t v17 = v5;
      __int16 v18 = 2048;
      unint64_t v19 = v6;
      __int16 v20 = 2080;
      long long v21 = v10;
      _os_log_debug_impl(&dword_1C86D7000, v9, OS_LOG_TYPE_DEBUG, "Address %#llx doesn't fall into binary range [%#llx, %#llx) in %s", v15, 0x2Au);
    }
  }

  uint64_t result = __error();
  *uint64_t result = v8;
  return result;
}

void sub_1C86EF644(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_1C86ECF1C(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

const unsigned __int8 *sub_1C86EF69C(uint64_t a1, const unsigned __int8 *a2, uint64_t a3, _OWORD **a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uuid_copy(dst, a2);
  unint64_t v8 = (*(void *)dst + 8) ^ *(void *)dst;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      uint64_t v4 = (*(void *)dst + 8) ^ *(void *)dst;
      if (v8 >= v9) {
        uint64_t v4 = v8 % v9;
      }
    }
    else
    {
      uint64_t v4 = (v9 - 1) & v8;
    }
    unint64_t v12 = *(const unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = *(const unsigned __int8 **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v14 == v8)
        {
          if (!uuid_compare(i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  sub_1C86EF964(a1, v8, a4, (uint64_t)dst);
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if ((((float)(v16 * (float)v9) >= v15) & ~(v9 == 0)) == 0)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_1C86ED50C(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        uint64_t v4 = v8 % v9;
      }
      else {
        uint64_t v4 = v8;
      }
    }
    else
    {
      uint64_t v4 = (v9 - 1) & v8;
    }
  }
  long long v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    **(void **)uuid_t dst = *v21;
    *long long v21 = *(void *)dst;
  }
  else
  {
    **(void **)uuid_t dst = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = *(void *)dst;
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (**(void **)dst)
    {
      unint64_t v22 = *(void *)(**(void **)dst + 8);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v22 >= v9) {
          v22 %= v9;
        }
      }
      else
      {
        v22 &= v9 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = *(void *)dst;
    }
  }
  uint64_t i = *(const unsigned __int8 **)dst;
  *(void *)uuid_t dst = 0;
  ++*(void *)(a1 + 24);
  sub_1C86EFA24((uint64_t)dst, 0);
  return i;
}

void sub_1C86EF944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1C86EFA24((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

double sub_1C86EF964@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x90uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  *((_OWORD *)v8 + 1) = **a3;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 5) = 0u;
  *((_OWORD *)v8 + 6) = 0u;
  *((_OWORD *)v8 + 7) = 0u;
  *((_OWORD *)v8 + 8) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  uuid_clear((unsigned __int8 *)v8 + 32);
  *((void *)v8 + 10) = 0;
  double result = 0.0;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  *((_DWORD *)v8 + 22) = 1065353216;
  *((void *)v8 + 12) = 0;
  *((_DWORD *)v8 + 26) = -1;
  *((unsigned char *)v8 + 108) = 0;
  *((_OWORD *)v8 + 7) = 0u;
  *((_OWORD *)v8 + 8) = 0u;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1C86EFA0C(_Unwind_Exception *a1)
{
  sub_1C86EFA24(v1, 0);
  _Unwind_Resume(a1);
}

void sub_1C86EFA24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_1C86ECF60((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void sub_1C86EFA7C(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v6; *(void *)(*a1 + 8 * i++) = 0)
    ;
  unint64_t v8 = (void *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = a2[2];
      v8[2] = v9;
      uint8x8_t v10 = (void *)*v8;
      v8[1] = v9;
      unint64_t v11 = sub_1C86EFB88((uint64_t)a1, v9, v8 + 2);
      sub_1C86EFCE0(a1, v8, v11);
      a2 = (void *)*a2;
      unint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    do
    {
      unint64_t v12 = (void *)*v8;
      operator delete(v8);
      unint64_t v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      sub_1C86F002C(a1, a2 + 2);
      a2 = (void *)*a2;
    }
  }
}

void sub_1C86EFB54(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_1C86EFB74(_Unwind_Exception *a1)
{
}

void *sub_1C86EFB88(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_1C86EFDC8(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  float v16 = *(void **)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    double result = v16;
    float v16 = (void *)*v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = v16[1];
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && v16[2] == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

void *sub_1C86EFCE0(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_1C86EFDC8(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_1C86EFEB8(a1, prime);
    }
  }
}

void sub_1C86EFEB8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_1C86ED4D8();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = (void *)*v7; *v7; uint64_t i = (void *)*v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (void *)*v13;
            }
            while (v13 && i[2] == v13[2]);
            void *v7 = v13;
            void *v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *sub_1C86F002C(void *a1, unint64_t *a2)
{
  int8x8_t v4 = operator new(0x18uLL);
  unint64_t v5 = *a2;
  v4[2] = *a2;
  *int8x8_t v4 = 0;
  v4[1] = v5;
  uint64_t v6 = sub_1C86EFB88((uint64_t)a1, v5, v4 + 2);
  sub_1C86EFCE0(a1, v4, v6);
  return v4;
}

void sub_1C86F0090(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C86F00A4(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_1C86ECFE0(a1, *(char **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

const unsigned __int8 *sub_1C86F00FC(void *a1, const unsigned __int8 *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uuid_copy(dst, a2);
  int8x8_t v4 = (int8x8_t)a1[1];
  if (!*(void *)&v4) {
    return 0;
  }
  unint64_t v5 = (*(void *)dst + 8) ^ *(void *)dst;
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4);
  v6.i16[0] = vaddlv_u8(v6);
  unint64_t v7 = v6.u32[0];
  if (v6.u32[0] > 1uLL)
  {
    uint64_t v8 = (*(void *)dst + 8) ^ *(void *)dst;
    if (v5 >= *(void *)&v4) {
      uint64_t v8 = v5 % *(void *)&v4;
    }
  }
  else
  {
    uint64_t v8 = (*(void *)&v4 - 1) & v5;
  }
  uint8x8_t v9 = *(const unsigned __int8 ***)(*a1 + 8 * v8);
  if (!v9) {
    return 0;
  }
  for (uint64_t i = *v9; i; uint64_t i = *(const unsigned __int8 **)i)
  {
    unint64_t v11 = *((void *)i + 1);
    if (v11 == v5)
    {
      if (!uuid_compare(i + 16, a2)) {
        return i;
      }
    }
    else
    {
      if (v7 > 1)
      {
        if (v11 >= *(void *)&v4) {
          v11 %= *(void *)&v4;
        }
      }
      else
      {
        v11 &= *(void *)&v4 - 1;
      }
      if (v11 != v8) {
        return 0;
      }
    }
  }
  return i;
}

void sub_1C86F0234(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_1C86ED070(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void *sub_1C86F028C(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C86F0338();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint8x8_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__uuid_t dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint8x8_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void sub_1C86F0338()
{
}

void sub_1C86F0350(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1C86F03AC(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E656FAC8, MEMORY[0x1E4FBA1C8]);
}

void sub_1C86F0398(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1C86F03AC(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

uint64_t *sub_1C86F03E0(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint8x8_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (double result = *v6; result; double result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_1C86F0494(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)i + 4) == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  sub_1C86F06DC(a1, *a2, a4, (uint64_t)v21);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_1C86ED50C(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  unint64_t v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v21[0] = *v18;
    *unint64_t v18 = v21[0];
  }
  else
  {
    *(void *)v21[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v21[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v21[0])
    {
      unint64_t v19 = *(void *)(*(void *)v21[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v21[0];
    }
  }
  uint64_t i = (uint64_t *)v21[0];
  v21[0] = 0;
  ++*(void *)(a1 + 24);
  sub_1C86F0804((uint64_t)v21, 0);
  return i;
}

void sub_1C86F06C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1C86F0804((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86F06DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint8x8_t v8 = operator new(0xB0uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *uint8x8_t v8 = 0;
  v8[1] = a2;
  uint64_t result = sub_1C86F074C((uint64_t)(v8 + 2), *a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1C86F0734(_Unwind_Exception *a1)
{
  sub_1C86F0804(v1, 0);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86F074C(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 32) = -1;
  *(void *)(a1 + 152) = 0;
  uuid_clear((unsigned __int8 *)(a1 + 36));
  *(void *)(a1 + 104) = 0;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 152) = 1065353216;
  return a1;
}

void sub_1C86F07E8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C86F0804(uint64_t a1, uint64_t a2)
{
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_1C86ED0B4((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

const unsigned __int8 *sub_1C86F085C(uint64_t a1, const unsigned __int8 *a2, uint64_t a3, _OWORD **a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uuid_copy(dst, a2);
  unint64_t v8 = (*(void *)dst + 8) ^ *(void *)dst;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      uint64_t v4 = (*(void *)dst + 8) ^ *(void *)dst;
      if (v8 >= v9) {
        uint64_t v4 = v8 % v9;
      }
    }
    else
    {
      uint64_t v4 = (v9 - 1) & v8;
    }
    float v12 = *(const unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = *(const unsigned __int8 **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v14 == v8)
        {
          if (!uuid_compare(i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  sub_1C86F0B20(a1, v8, a4, (uint64_t)dst);
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if ((((float)(v16 * (float)v9) >= v15) & ~(v9 == 0)) == 0)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_1C86ED50C(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        uint64_t v4 = v8 % v9;
      }
      else {
        uint64_t v4 = v8;
      }
    }
    else
    {
      uint64_t v4 = (v9 - 1) & v8;
    }
  }
  BOOL v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    **(void **)uuid_t dst = *v21;
    *BOOL v21 = *(void *)dst;
  }
  else
  {
    **(void **)uuid_t dst = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = *(void *)dst;
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (**(void **)dst)
    {
      unint64_t v22 = *(void *)(**(void **)dst + 8);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v22 >= v9) {
          v22 %= v9;
        }
      }
      else
      {
        v22 &= v9 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = *(void *)dst;
    }
  }
  uint64_t i = *(const unsigned __int8 **)dst;
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1C86F0AF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void **__p, uint64_t a12)
{
  if (__p) {
    sub_1C86F0C18((uint64_t)&a12, __p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1C86F0B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x60uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *unint64_t v8 = 0;
  v8[1] = a2;
  uint64_t result = sub_1C86F0BA8((uint64_t)(v8 + 2), *a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1C86F0B8C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_1C86F0C18(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86F0BA8(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  uuid_clear((unsigned __int8 *)(a1 + 40));
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  return a1;
}

void sub_1C86F0C00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1C86F10A4((void ***)va);
  _Unwind_Resume(a1);
}

void sub_1C86F0C18(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = __p + 4;
    sub_1C86F10A4(&v3);
  }
  if (__p) {
    operator delete(__p);
  }
}

void *sub_1C86F0C64(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  *uint64_t i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_1C86ED50C(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t i = *v19;
LABEL_38:
    void *v19 = i;
    goto LABEL_39;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1C86F0E6C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1C86F0E80(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint8x8_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x20uLL);
  void *v11 = 0;
  v11[1] = v7;
  v11[2] = **a4;
  *((_DWORD *)v11 + 6) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_1C86ED50C(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    *unint64_t v20 = v11;
    goto LABEL_39;
  }
  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_1C86F1090(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C86F10A4(void ***a1)
{
  uint64_t v1 = *a1;
  int8x8_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 112;
        sub_1C86F113C((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_1C86F113C(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 111) < 0) {
    operator delete(*(void **)(a2 + 88));
  }

  return sub_1C86ECE94(a2 + 24);
}

uint64_t sub_1C86F1180(uint64_t *a1, long long *a2)
{
  uint64_t v3 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x249249249249249) {
    sub_1C86F14D4();
  }
  if (0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 4) > v4) {
    unint64_t v4 = 0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 4);
  }
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((a1[2] - *a1) >> 4)) >= 0x124924924924924) {
    unint64_t v6 = 0x249249249249249;
  }
  else {
    unint64_t v6 = v4;
  }
  float v14 = a1 + 2;
  if (v6) {
    unint64_t v7 = (char *)sub_1C86F14EC((uint64_t)(a1 + 2), v6);
  }
  else {
    unint64_t v7 = 0;
  }
  uint8x8_t v10 = v7;
  unint64_t v11 = &v7[112 * v3];
  float v13 = &v7[112 * v6];
  sub_1C86F12A8((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  unint64_t v12 = v11 + 112;
  sub_1C86F145C(a1, &v10);
  uint64_t v8 = a1[1];
  sub_1C86F16A8(&v10);
  return v8;
}

void sub_1C86F1294(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1C86F16A8((void **)va);
  _Unwind_Resume(a1);
}

unsigned char *sub_1C86F12A8(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v5 = *a3;
  *(void *)(a2 + 16) = *((void *)a3 + 2);
  *(_OWORD *)a2 = v5;
  sub_1C86F1344(a2 + 24, (uint64_t)a3 + 24);
  long long v6 = a3[4];
  *(void *)(a2 + 80) = *((void *)a3 + 10);
  *(_OWORD *)(a2 + 64) = v6;
  uint64_t result = (unsigned char *)(a2 + 88);
  if (*((char *)a3 + 111) < 0) {
    return sub_1C86F13BC(result, *((void **)a3 + 11), *((void *)a3 + 12));
  }
  long long v8 = *(long long *)((char *)a3 + 88);
  *(void *)(a2 + 104) = *((void *)a3 + 13);
  *(_OWORD *)uint64_t result = v8;
  return result;
}

void sub_1C86F1330(_Unwind_Exception *a1)
{
  sub_1C86ECE94(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86F1344(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_1C86ED50C(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
    sub_1C86F0C64(a1, i + 2, i + 2);
  return a1;
}

void sub_1C86F13A4(_Unwind_Exception *a1)
{
  sub_1C86ECE94(v1);
  _Unwind_Resume(a1);
}

void *sub_1C86F13BC(unsigned char *__dst, void *__src, unint64_t a3)
{
  long long v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1C86F0338();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    long long v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    long long v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_1C86F145C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1C86F1538((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void sub_1C86F14D4()
{
}

void *sub_1C86F14EC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL) {
    sub_1C86ED4D8();
  }
  return operator new(112 * a2);
}

uint64_t sub_1C86F1538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v18 = a6;
  *((void *)&v18 + 1) = a7;
  long long v17 = v18;
  v15[0] = a1;
  v15[1] = &v17;
  v15[2] = &v18;
  char v16 = 0;
  if (a3 == a5)
  {
    uint64_t v13 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      long long v10 = *(_OWORD *)(v9 - 112);
      *(void *)(v7 - 96) = *(void *)(v9 - 96);
      *(_OWORD *)(v7 - 112) = v10;
      sub_1C86EE910(v7 - 88, (uint64_t *)(v9 - 88));
      long long v11 = *(_OWORD *)(v9 - 48);
      *(void *)(v7 - 32) = *(void *)(v9 - 32);
      *(_OWORD *)(v7 - 48) = v11;
      long long v12 = *(_OWORD *)(v9 - 24);
      *(void *)(v7 - 8) = *(void *)(v9 - 8);
      *(_OWORD *)(v7 - 24) = v12;
      *(void *)(v9 - 24) = 0;
      *(void *)(v9 - 16) = 0;
      *(void *)(v9 - 8) = 0;
      uint64_t v7 = *((void *)&v18 + 1) - 112;
      *((void *)&v18 + 1) -= 112;
      v9 -= 112;
    }
    while (v9 != a5);
    uint64_t v13 = v18;
  }
  char v16 = 1;
  sub_1C86F161C((uint64_t)v15);
  return v13;
}

uint64_t sub_1C86F161C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1C86F1654((uint64_t *)a1);
  }
  return a1;
}

uint64_t *sub_1C86F1654(uint64_t *result)
{
  uint64_t v1 = *(void *)(result[2] + 8);
  uint64_t v2 = *(void *)(result[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *result;
    do
    {
      uint64_t result = (uint64_t *)sub_1C86F113C(v3, v1);
      v1 += 112;
    }
    while (v1 != v2);
  }
  return result;
}

void **sub_1C86F16A8(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

uint64_t sub_1C86F16DC(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 8);
  uint64_t v1 = *(void *)(result + 16);
  if (v1 != v2)
  {
    uint64_t v3 = result;
    do
    {
      uint64_t v4 = *(void *)(v3 + 32);
      *(void *)(v3 + 16) = v1 - 112;
      uint64_t result = sub_1C86F113C(v4, v1 - 112);
      uint64_t v1 = *(void *)(v3 + 16);
    }
    while (v1 != v2);
  }
  return result;
}

uint64_t sub_1C86F1724(uint64_t a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  uint64_t v9 = *(void **)a1;
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4) < a4)
  {
    sub_1C86F18C8((void **)a1);
    if (a4 > 0x249249249249249) {
      sub_1C86F14D4();
    }
    unint64_t v10 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4)) >= 0x124924924924924) {
      unint64_t v11 = 0x249249249249249;
    }
    else {
      unint64_t v11 = v10;
    }
    sub_1C86F1938((void *)a1, v11);
    uint64_t result = sub_1C86F1990(v8, a2, a3, *(void *)(a1 + 8));
    goto LABEL_11;
  }
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4) < a4)
  {
    uint64_t v13 = &a2[(uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4];
    sub_1C86F1B64((uint64_t)&v17, (uint64_t)a2, (uint64_t)v13, (uint64_t)v9);
    uint64_t result = sub_1C86F1990(v8, v13, a3, *(void *)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = result;
    return result;
  }
  uint64_t result = sub_1C86F1B64((uint64_t)&v18, (uint64_t)a2, (uint64_t)a3, (uint64_t)v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      v16 -= 112;
      uint64_t result = sub_1C86F113C(v8, v16);
    }
    while (v16 != v15);
  }
  *(void *)(a1 + 8) = v15;
  return result;
}

void sub_1C86F18B8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1C86F18C0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1C86F18C8(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    uint64_t v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 112;
        sub_1C86F113C((uint64_t)(a1 + 2), v3);
      }
      while ((void *)v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *sub_1C86F1938(void *a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL) {
    sub_1C86F14D4();
  }
  uint64_t result = (char *)sub_1C86F14EC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[112 * v4];
  return result;
}

uint64_t sub_1C86F1990(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v11 = a4;
  uint64_t v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  int v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      sub_1C86F1A3C(a1, v4, v6);
      v6 += 7;
      uint64_t v4 = v12 + 112;
      v12 += 112;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  sub_1C86F1AD8((uint64_t)v9);
  return v4;
}

void sub_1C86F1A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned char *sub_1C86F1A3C(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v5 = *a3;
  *(void *)(a2 + 16) = *((void *)a3 + 2);
  *(_OWORD *)a2 = v5;
  sub_1C86F1344(a2 + 24, (uint64_t)a3 + 24);
  long long v6 = a3[4];
  *(void *)(a2 + 80) = *((void *)a3 + 10);
  *(_OWORD *)(a2 + 64) = v6;
  uint64_t result = (unsigned char *)(a2 + 88);
  if (*((char *)a3 + 111) < 0) {
    return sub_1C86F13BC(result, *((void **)a3 + 11), *((void *)a3 + 12));
  }
  long long v8 = *(long long *)((char *)a3 + 88);
  *(void *)(a2 + 104) = *((void *)a3 + 13);
  *(_OWORD *)uint64_t result = v8;
  return result;
}

void sub_1C86F1AC4(_Unwind_Exception *a1)
{
  sub_1C86ECE94(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86F1AD8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1C86F1B10((uint64_t *)a1);
  }
  return a1;
}

uint64_t *sub_1C86F1B10(uint64_t *result)
{
  uint64_t v2 = (uint64_t *)result[1];
  uint64_t v1 = (uint64_t *)result[2];
  uint64_t v3 = *v1;
  uint64_t v4 = *v2;
  if (*v1 != *v2)
  {
    uint64_t v5 = *result;
    do
    {
      v3 -= 112;
      uint64_t result = (uint64_t *)sub_1C86F113C(v5, v3);
    }
    while (v3 != v4);
  }
  return result;
}

uint64_t sub_1C86F1B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 == a3) {
    return a2;
  }
  uint64_t v5 = a3;
  uint64_t v6 = a2 + 56;
  do
  {
    uint64_t v7 = v6 - 56;
    long long v8 = *(_OWORD *)(v6 - 56);
    *(void *)(a4 + 16) = *(void *)(v6 - 40);
    *(_OWORD *)a4 = v8;
    if (a4 != v6 - 56)
    {
      *(_DWORD *)(a4 + 56) = *(_DWORD *)v6;
      sub_1C86EFA7C((void *)(a4 + 24), *(void **)(v6 - 16), 0);
    }
    long long v9 = *(_OWORD *)(v6 + 8);
    *(void *)(a4 + 80) = *(void *)(v6 + 24);
    *(_OWORD *)(a4 + 64) = v9;
    std::string::operator=((std::string *)(a4 + 88), (const std::string *)(v6 + 32));
    a4 += 112;
    v6 += 112;
  }
  while (v7 + 112 != v5);
  return v5;
}

void *sub_1C86F1C10(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    char v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = a1 + 16;
  uint64_t v14 = (char *)operator new(0x50uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 24) = 0u;
  *((void *)v14 + 9) = 0;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 40) = 0u;
  *((_DWORD *)v14 + 8) = -1;
  *((_DWORD *)v14 + 18) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_1C86ED50C(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *unint64_t v21 = v24[0];
  }
  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }
  uint64_t v11 = (void *)v24[0];
  v24[0] = 0;
  ++*(void *)(a1 + 24);
  sub_1C86F1E90((uint64_t)v24, 0);
  return v11;
}

void sub_1C86F1E78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1C86F1E90((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_1C86F1E90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_1C86ECE94((uint64_t)v2 + 40);
    }
    operator delete(v2);
  }
}

void *sub_1C86F1EE8(uint64_t a1, const unsigned __int8 *a2, _OWORD *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uuid_copy(dst, a2);
  unint64_t v7 = (*(void *)dst + 8) ^ *(void *)dst;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    unint64_t v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      uint64_t v3 = (*(void *)dst + 8) ^ *(void *)dst;
      if (v7 >= v8) {
        uint64_t v3 = v7 % v8;
      }
    }
    else
    {
      uint64_t v3 = (v8 - 1) & v7;
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (uint64_t i = *v11; i; uint64_t i = *(void **)i)
      {
        unint64_t v13 = *((void *)i + 1);
        if (v13 == v7)
        {
          if (!uuid_compare((const unsigned __int8 *)i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v10 > 1)
          {
            if (v13 >= v8) {
              v13 %= v8;
            }
          }
          else
          {
            v13 &= v8 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v7;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  *((_OWORD *)i + 1) = *a3;
  float v15 = *(float *)(a1 + 32);
  if ((((float)(v15 * (float)v8) >= v14) & ~(v8 == 0)) == 0)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_1C86ED50C(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        uint64_t v3 = v7 % v8;
      }
      else {
        uint64_t v3 = v7;
      }
    }
    else
    {
      uint64_t v3 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *(void *)uint64_t i = *v21;
LABEL_37:
    *unint64_t v21 = i;
    goto LABEL_38;
  }
  *(void *)uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v20 + 8 * v3) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v22 = *(void *)(*(void *)i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_37;
  }
LABEL_38:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1C86F2158(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

long long *sub_1C86F2174(long long *result, long long *a2, uint64_t (**a3)(long long *, long long *), uint64_t a4, char a5)
{
  uint8x8_t v9 = a2;
  unint64_t v10 = result;
  uint64_t v25 = a2;
  uint64_t v26 = result;
LABEL_2:
  for (uint64_t i = 1 - a4; ; ++i)
  {
    uint64_t v12 = (char *)v9 - (char *)v10;
    unint64_t v13 = 0x6DB6DB6DB6DB6DB7 * (v9 - v10);
    if (!(!v6 & v5))
    {
      switch(v13)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v23 = *a3;
          uint64_t v25 = v9 - 7;
          uint64_t result = (long long *)((uint64_t (*)(void))v23)();
          if (result) {
            uint64_t result = (long long *)sub_1C86EDB24(&v26, &v25);
          }
          break;
        case 3uLL:
          uint64_t v25 = v9 - 7;
          uint64_t result = (long long *)sub_1C86F28C0(v10, v10 + 7, v9 - 7, a3);
          break;
        case 4uLL:
          uint64_t v25 = v9 - 7;
          uint64_t result = (long long *)sub_1C86F3240(v10, v10 + 7, v10 + 14, v9 - 7, a3);
          break;
        case 5uLL:
          uint64_t v25 = v9 - 7;
          uint64_t result = (long long *)sub_1C86F32F8(v10, v10 + 7, v10 + 14, v10 + 21, v9 - 7, a3);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v12 <= 2687)
    {
      if (a5) {
        return (long long *)sub_1C86F2488((uint64_t)v10, (uint64_t)v9, (uint64_t (**)(uint64_t, uint64_t))a3);
      }
      else {
        return (long long *)sub_1C86F26BC((uint64_t)v10, (uint64_t)v9, (uint64_t (**)(uint64_t, uint64_t))a3);
      }
    }
    if (i == 1) {
      break;
    }
    unint64_t v14 = v13 >> 1;
    float v15 = v9 - 7;
    if ((unint64_t)v12 >= 0x3801)
    {
      sub_1C86F28C0(v10, &v10[7 * (v13 >> 1)], v15, a3);
      uint64_t v16 = 7 * v14;
      uint64_t v17 = 112 * v14 - 112;
      unint64_t v18 = v25;
      sub_1C86F28C0(v26 + 7, (long long *)((char *)v26 + v17), v25 - 14, a3);
      sub_1C86F28C0(v26 + 14, &v26[v16 + 7], v18 - 21, a3);
      sub_1C86F28C0((long long *)((char *)v26 + v17), &v26[v16], &v26[v16 + 7], a3);
      uint64_t v24 = &v26[v16];
      sub_1C86EDB24(&v26, &v24);
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      sub_1C86F28C0(&v10[7 * (v13 >> 1)], v10, v15, a3);
      if (a5)
      {
LABEL_13:
        uint8x8_t v9 = v25;
        goto LABEL_14;
      }
    }
    char v19 = ((uint64_t (*)(long long *))*a3)(v26 - 7);
    uint8x8_t v9 = v25;
    if ((v19 & 1) == 0)
    {
      uint64_t result = sub_1C86F299C((uint64_t)v26, v25, (unsigned int (**)(long long *))a3);
      unint64_t v10 = result;
LABEL_22:
      a5 = 0;
      uint64_t v26 = v10;
      a4 = -i;
      goto LABEL_2;
    }
LABEL_14:
    uint64_t v20 = sub_1C86F2C58((uint64_t)v26, v9, (uint64_t (**)(void))a3);
    if ((v21 & 1) == 0) {
      goto LABEL_21;
    }
    int v22 = sub_1C86F2F18(v26, v20, a3);
    unint64_t v10 = v20 + 7;
    uint64_t result = (long long *)sub_1C86F2F18(v20 + 7, v9, a3);
    if (result)
    {
      if (v22) {
        return result;
      }
      uint64_t v25 = v20;
      unint64_t v10 = v26;
      uint8x8_t v9 = v20;
    }
    else
    {
      if (!v22)
      {
LABEL_21:
        uint64_t result = (long long *)sub_1C86F2174(v26, v20, a3, -i, a5 & 1);
        unint64_t v10 = v20 + 7;
        goto LABEL_22;
      }
      uint64_t v26 = v20 + 7;
    }
  }
  if (v10 != v9) {
    return sub_1C86F33D8(v10, v9, v9, (unsigned int (**)(uint64_t, uint64_t))a3);
  }
  return result;
}

uint64_t sub_1C86F2488(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result != a2)
  {
    uint64_t v3 = a2;
    uint64_t v4 = result;
    uint64_t v5 = result + 112;
    if (result + 112 != a2)
    {
      uint64_t v7 = 0;
      uint64_t v8 = result;
      do
      {
        uint64_t v9 = v5;
        uint64_t result = (*a3)(v5, v8);
        if (result)
        {
          long long v19 = *(_OWORD *)v9;
          uint64_t v20 = *(void *)(v9 + 16);
          sub_1C86EE910((uint64_t)v21, (uint64_t *)(v8 + 136));
          long long v22 = *(_OWORD *)(v8 + 176);
          uint64_t v23 = *(void *)(v8 + 192);
          long long v24 = *(_OWORD *)(v8 + 200);
          uint64_t v25 = *(void *)(v8 + 216);
          *(void *)(v8 + 200) = 0;
          *(void *)(v8 + 208) = 0;
          uint64_t v10 = v7;
          *(void *)(v8 + 216) = 0;
          while (1)
          {
            uint64_t v11 = v10;
            uint64_t v12 = v4 + v10;
            *(_OWORD *)(v12 + 112) = *(_OWORD *)(v4 + v10);
            *(void *)(v12 + 128) = *(void *)(v4 + v10 + 16);
            sub_1C86EE980(v4 + v10 + 136, (uint64_t *)(v4 + v10 + 24));
            *(_OWORD *)(v12 + 176) = *(_OWORD *)(v12 + 64);
            *(void *)(v12 + 192) = *(void *)(v12 + 80);
            unint64_t v13 = (void **)(v12 + 200);
            if (*(char *)(v12 + 223) < 0) {
              operator delete(*v13);
            }
            *(_OWORD *)unint64_t v13 = *(_OWORD *)(v12 + 88);
            *(void *)(v12 + 216) = *(void *)(v12 + 104);
            *(unsigned char *)(v12 + 111) = 0;
            *(unsigned char *)(v12 + 88) = 0;
            if (!v11) {
              break;
            }
            char v14 = (*a3)((uint64_t)&v19, v4 + v11 - 112);
            uint64_t v10 = v11 - 112;
            if ((v14 & 1) == 0)
            {
              uint64_t v15 = v4 + v11;
              goto LABEL_12;
            }
          }
          uint64_t v15 = v4;
LABEL_12:
          *(_OWORD *)uint64_t v15 = v19;
          *(void *)(v15 + 16) = v20;
          uint64_t v16 = v4 + v11;
          sub_1C86EE980(v4 + v11 + 24, v21);
          *(void *)(v16 + 80) = v23;
          *(_OWORD *)(v16 + 64) = v22;
          uint64_t v17 = (void **)(v4 + v11 + 88);
          if (*(char *)(v15 + 111) < 0) {
            operator delete(*v17);
          }
          *(_OWORD *)uint64_t v17 = v24;
          *(void *)(v4 + v11 + 104) = v25;
          HIBYTE(v25) = 0;
          LOBYTE(v24) = 0;
          uint64_t result = sub_1C86ECE94((uint64_t)v21);
          uint64_t v3 = a2;
        }
        uint64_t v5 = v9 + 112;
        v7 += 112;
        uint64_t v8 = v9;
      }
      while (v9 + 112 != v3);
    }
  }
  return result;
}

void sub_1C86F26A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t sub_1C86F26BC(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (result != a2)
  {
    uint64_t v4 = result;
    uint64_t v5 = result + 112;
    if (result + 112 != a2)
    {
      uint64_t v7 = (char *)(result + 223);
      do
      {
        uint64_t v8 = v5;
        uint64_t result = (*a3)(v5, v4);
        if (result)
        {
          long long v13 = *(_OWORD *)v8;
          uint64_t v14 = *(void *)(v8 + 16);
          sub_1C86EE910((uint64_t)v15, (uint64_t *)(v4 + 136));
          long long v16 = *(_OWORD *)(v4 + 176);
          uint64_t v17 = *(void *)(v4 + 192);
          long long v18 = *(_OWORD *)(v4 + 200);
          uint64_t v19 = *(void *)(v4 + 216);
          *(void *)(v4 + 200) = 0;
          *(void *)(v4 + 208) = 0;
          uint64_t v9 = v7;
          *(void *)(v4 + 216) = 0;
          do
          {
            *(_OWORD *)(v9 - 111) = *(_OWORD *)(v9 - 223);
            *(void *)(v9 - 95) = *(void *)(v9 - 207);
            sub_1C86EE980((uint64_t)(v9 - 87), (uint64_t *)(v9 - 199));
            *(_OWORD *)(v9 - 47) = *(_OWORD *)(v9 - 159);
            *(void *)(v9 - 31) = *(void *)(v9 - 143);
            uint64_t v10 = (void **)(v9 - 23);
            if (*v9 < 0) {
              operator delete(*v10);
            }
            *(_OWORD *)uint64_t v10 = *(_OWORD *)(v9 - 135);
            *(void *)(v9 - 7) = *(void *)(v9 - 119);
            *(v9 - 112) = 0;
            *(v9 - 135) = 0;
            char v11 = (*a3)((uint64_t)&v13, (uint64_t)(v9 - 335));
            v9 -= 112;
          }
          while ((v11 & 1) != 0);
          *(_OWORD *)(v9 - 111) = v13;
          *(void *)(v9 - 95) = v14;
          sub_1C86EE980((uint64_t)(v9 - 87), v15);
          *(_OWORD *)(v9 - 47) = v16;
          *(void *)(v9 - 31) = v17;
          uint64_t v12 = (void **)(v9 - 23);
          if (*v9 < 0) {
            operator delete(*v12);
          }
          *(_OWORD *)uint64_t v12 = v18;
          *(void *)(v9 - 7) = v19;
          HIBYTE(v19) = 0;
          LOBYTE(v18) = 0;
          uint64_t result = sub_1C86ECE94((uint64_t)v15);
        }
        uint64_t v5 = v8 + 112;
        v7 += 112;
        uint64_t v4 = v8;
      }
      while (v8 + 112 != a2);
    }
  }
  return result;
}

void sub_1C86F28A4(_Unwind_Exception *exception_object)
{
}

uint64_t sub_1C86F28C0(long long *a1, long long *a2, long long *a3, uint64_t (**a4)(long long *, long long *))
{
  uint64_t v12 = a2;
  long long v13 = a1;
  char v11 = a3;
  char v7 = (*a4)(a2, a1);
  uint64_t result = (*a4)(a3, a2);
  if ((v7 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    sub_1C86EDB24(&v12, &v11);
    if (!(*a4)(v12, v13)) {
      return 1;
    }
    uint64_t v9 = &v13;
    uint64_t v10 = &v12;
    goto LABEL_9;
  }
  if (!result)
  {
    sub_1C86EDB24(&v13, &v12);
    if (!(*a4)(v11, v12)) {
      return 1;
    }
    uint64_t v9 = &v12;
    uint64_t v10 = &v11;
LABEL_9:
    sub_1C86EDB24(v9, v10);
    return 2;
  }
  sub_1C86EDB24(&v13, &v11);
  return 1;
}

long long *sub_1C86F299C(uint64_t a1, long long *a2, unsigned int (**a3)(long long *))
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = a2;
  uint64_t v23 = (long long *)a1;
  long long v24 = *(_OWORD *)a1;
  uint64_t v25 = *(void *)(a1 + 16);
  uint64_t v6 = a1 + 24;
  sub_1C86EE910((uint64_t)v26, (uint64_t *)(a1 + 24));
  long long v27 = *(_OWORD *)(a1 + 64);
  uint64_t v28 = *(void *)(a1 + 80);
  long long v29 = *(_OWORD *)(a1 + 88);
  uint64_t v30 = *(void *)(a1 + 104);
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  if (((uint64_t (*)(long long *, long long *))*a3)(&v24, a2 - 7))
  {
    char v7 = (long long *)a1;
    do
    {
      v7 += 7;
      uint64_t v23 = v7;
    }
    while ((((uint64_t (*)(long long *, long long *))*a3)(&v24, v7) & 1) == 0);
  }
  else
  {
    uint64_t v8 = (long long *)(a1 + 112);
    do
    {
      char v7 = v8;
      uint64_t v23 = v8;
      if (v8 >= v22) {
        break;
      }
      int v9 = ((uint64_t (*)(long long *, long long *))*a3)(&v24, v8);
      uint64_t v8 = v7 + 7;
    }
    while (!v9);
  }
  uint64_t v10 = v22;
  if (v7 < v22)
  {
    do
    {
      v10 -= 7;
      long long v22 = v10;
    }
    while ((((uint64_t (*)(long long *, long long *))*a3)(&v24, v10) & 1) != 0);
    char v7 = v23;
  }
  if (v7 < v10)
  {
    do
    {
      sub_1C86EDB24(&v23, &v22);
      do
        v23 += 7;
      while (!(*a3)(&v24));
      do
        v22 -= 7;
      while ((((uint64_t (*)(long long *))*a3)(&v24) & 1) != 0);
      char v7 = v23;
    }
    while (v23 < v22);
  }
  char v11 = v7 - 7;
  if (v7 - 7 != (long long *)a1)
  {
    uint64_t v12 = (void **)(a1 + 88);
    long long v13 = *v11;
    *(void *)(a1 + 16) = *((void *)v7 - 12);
    *(_OWORD *)a1 = v13;
    sub_1C86EE980(v6, (uint64_t *)v7 - 11);
    long long v14 = *(v7 - 3);
    *(void *)(a1 + 80) = *((void *)v7 - 4);
    *(_OWORD *)(a1 + 64) = v14;
    if (*(char *)(a1 + 111) < 0) {
      operator delete(*v12);
    }
    long long v15 = *(long long *)((char *)v7 - 24);
    *(void *)(a1 + 104) = *((void *)v7 - 1);
    *(_OWORD *)uint64_t v12 = v15;
    *((unsigned char *)v7 - 1) = 0;
    *((unsigned char *)v7 - 24) = 0;
  }
  long long v16 = v24;
  *((void *)v7 - 12) = v25;
  long long *v11 = v16;
  sub_1C86EE980((uint64_t)v7 - 88, v26);
  long long v17 = v27;
  *((void *)v7 - 4) = v28;
  *(v7 - 3) = v17;
  long long v18 = (void **)v7 - 3;
  if (*((char *)v7 - 1) < 0) {
    operator delete(*v18);
  }
  long long v19 = v29;
  *((void *)v7 - 1) = v30;
  *(_OWORD *)long long v18 = v19;
  HIBYTE(v30) = 0;
  LOBYTE(v29) = 0;
  uint64_t v20 = v23;
  sub_1C86ECE94((uint64_t)v26);
  return v20;
}

void sub_1C86F2C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1C86EAD9C((uint64_t)va);
  _Unwind_Resume(a1);
}

long long *sub_1C86F2C58(uint64_t a1, long long *a2, uint64_t (**a3)(void))
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v24 = a2;
  long long v26 = *(_OWORD *)a1;
  uint64_t v27 = *(void *)(a1 + 16);
  uint64_t v5 = a1 + 24;
  sub_1C86EE910((uint64_t)v28, (uint64_t *)(a1 + 24));
  uint64_t v6 = 0;
  long long v29 = *(_OWORD *)(a1 + 64);
  uint64_t v30 = *(void *)(a1 + 80);
  uint64_t v32 = *(void *)(a1 + 104);
  char v7 = (void **)(a1 + 88);
  long long v31 = *(_OWORD *)(a1 + 88);
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  do
  {
    uint64_t v25 = (long long *)(a1 + v6 + 112);
    v6 += 112;
  }
  while (((*a3)() & 1) != 0);
  uint64_t v8 = v24;
  if (v6 == 112)
  {
    uint64_t v12 = (long long *)(a1 + 112);
    do
    {
      if (v12 >= v8) {
        break;
      }
      long long v13 = *a3;
      v8 -= 7;
      long long v24 = v8;
    }
    while ((((uint64_t (*)(long long *, long long *))v13)(v8, &v26) & 1) == 0);
    uint64_t v11 = a1 + 64;
  }
  else
  {
    int v9 = v24 - 7;
    do
    {
      long long v24 = v9;
      int v10 = ((uint64_t (*)(long long *, long long *))*a3)(v9, &v26);
      v9 -= 7;
    }
    while (!v10);
    uint64_t v11 = a1 + 64;
    uint64_t v12 = v25;
  }
  long long v14 = v12;
  if (v12 < v24)
  {
    do
    {
      sub_1C86EDB24(&v25, &v24);
      do
        v25 += 7;
      while (((*a3)() & 1) != 0);
      do
        v24 -= 7;
      while (!(*a3)());
      long long v14 = v25;
    }
    while (v25 < v24);
  }
  long long v15 = v14 - 7;
  if (v14 - 7 != (long long *)a1)
  {
    long long v16 = *v15;
    *(void *)(a1 + 16) = *((void *)v14 - 12);
    *(_OWORD *)a1 = v16;
    sub_1C86EE980(v5, (uint64_t *)v14 - 11);
    long long v17 = *(v14 - 3);
    *(void *)(v11 + 16) = *((void *)v14 - 4);
    *(_OWORD *)uint64_t v11 = v17;
    if (*(char *)(a1 + 111) < 0) {
      operator delete(*v7);
    }
    long long v18 = *(long long *)((char *)v14 - 24);
    *(void *)(a1 + 104) = *((void *)v14 - 1);
    *(_OWORD *)char v7 = v18;
    *((unsigned char *)v14 - 1) = 0;
    *((unsigned char *)v14 - 24) = 0;
  }
  long long v19 = v26;
  *((void *)v14 - 12) = v27;
  long long *v15 = v19;
  sub_1C86EE980((uint64_t)v14 - 88, v28);
  long long v20 = v29;
  *((void *)v14 - 4) = v30;
  *(v14 - 3) = v20;
  char v21 = (void **)v14 - 3;
  if (*((char *)v14 - 1) < 0) {
    operator delete(*v21);
  }
  long long v22 = v31;
  *((void *)v14 - 1) = v32;
  *(_OWORD *)char v21 = v22;
  HIBYTE(v32) = 0;
  LOBYTE(v31) = 0;
  sub_1C86ECE94((uint64_t)v28);
  return v14 - 7;
}

void sub_1C86F2EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_1C86EAD9C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86F2F18(long long *a1, long long *a2, uint64_t (**a3)(long long *, long long *))
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = a2;
  long long v19 = a1;
  BOOL v6 = 1;
  switch(0x6DB6DB6DB6DB6DB7 * (a2 - a1))
  {
    case 0:
    case 1:
      return v6;
    case 2:
      char v7 = *a3;
      long long v18 = a2 - 7;
      if (((unsigned int (*)(long long *))v7)(a2 - 7)) {
        sub_1C86EDB24(&v19, &v18);
      }
      return v6;
    case 3:
      sub_1C86F28C0(a1, a1 + 7, a2 - 7, a3);
      return v6;
    case 4:
      sub_1C86F3240(a1, a1 + 7, a1 + 14, a2 - 7, a3);
      return v6;
    case 5:
      sub_1C86F32F8(a1, a1 + 7, a1 + 14, a1 + 21, a2 - 7, a3);
      return v6;
    default:
      uint64_t v8 = a1 + 14;
      sub_1C86F28C0(a1, a1 + 7, a1 + 14, a3);
      int v9 = a1 + 21;
      if (a1 + 21 == a2) {
        return 1;
      }
      int v10 = 0;
      break;
  }
  while (!(*a3)(v9, v8))
  {
LABEL_16:
    uint64_t v8 = v9;
    v9 += 7;
    if (v9 == v18) {
      return 1;
    }
  }
  long long v20 = *v9;
  uint64_t v21 = *((void *)v9 + 2);
  sub_1C86EE910((uint64_t)v22, (uint64_t *)v9 + 3);
  long long v23 = v9[4];
  uint64_t v24 = *((void *)v9 + 10);
  long long v25 = *(long long *)((char *)v9 + 88);
  uint64_t v26 = *((void *)v9 + 13);
  *((void *)v9 + 11) = 0;
  *((void *)v9 + 12) = 0;
  *((void *)v9 + 13) = 0;
  do
  {
    uint64_t v11 = v8;
    v8[7] = *v8;
    *((void *)v8 + 16) = *((void *)v8 + 2);
    sub_1C86EE980((uint64_t)v8 + 136, (uint64_t *)v8 + 3);
    v8[11] = v8[4];
    *((void *)v8 + 24) = *((void *)v8 + 10);
    uint64_t v12 = (char *)v8 + 200;
    if (*((char *)v11 + 223) < 0) {
      operator delete(*(void **)v12);
    }
    *(_OWORD *)uint64_t v12 = *(long long *)((char *)v11 + 88);
    *((void *)v12 + 2) = *((void *)v11 + 13);
    *((unsigned char *)v11 + 111) = 0;
    *((unsigned char *)v11 + 88) = 0;
    if (v11 == v19) {
      break;
    }
    uint64_t v8 = v11 - 7;
  }
  while (((*a3)(&v20, v11 - 7) & 1) != 0);
  long long v13 = v20;
  *((void *)v11 + 2) = v21;
  long long *v11 = v13;
  sub_1C86EE980((uint64_t)v11 + 24, v22);
  long long v14 = v23;
  *((void *)v11 + 10) = v24;
  v11[4] = v14;
  long long v15 = (void **)v11 + 11;
  if (*((char *)v11 + 111) < 0) {
    operator delete(*v15);
  }
  long long v16 = v25;
  *((void *)v11 + 13) = v26;
  *(_OWORD *)long long v15 = v16;
  HIBYTE(v26) = 0;
  LOBYTE(v25) = 0;
  if (++v10 != 8)
  {
    sub_1C86ECE94((uint64_t)v22);
    goto LABEL_16;
  }
  BOOL v6 = v9 + 7 == v18;
  sub_1C86ECE94((uint64_t)v22);
  return v6;
}

void sub_1C86F320C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t sub_1C86F3240(long long *a1, long long *a2, long long *a3, long long *a4, uint64_t (**a5)(long long *, long long *))
{
  long long v13 = a2;
  long long v14 = a1;
  uint64_t v11 = a4;
  uint64_t v12 = a3;
  sub_1C86F28C0(a1, a2, a3, a5);
  uint64_t result = (*a5)(a4, a3);
  if (result)
  {
    sub_1C86EDB24(&v12, &v11);
    uint64_t result = (*a5)(v12, a2);
    if (result)
    {
      sub_1C86EDB24(&v13, &v12);
      uint64_t result = (*a5)(v13, a1);
      if (result) {
        return sub_1C86EDB24(&v14, &v13);
      }
    }
  }
  return result;
}

uint64_t sub_1C86F32F8(long long *a1, long long *a2, long long *a3, long long *a4, long long *a5, uint64_t (**a6)(long long *, long long *))
{
  long long v16 = a2;
  long long v17 = a1;
  long long v14 = a4;
  long long v15 = a3;
  long long v13 = a5;
  sub_1C86F3240(a1, a2, a3, a4, a6);
  uint64_t result = (*a6)(a5, a4);
  if (result)
  {
    sub_1C86EDB24(&v14, &v13);
    uint64_t result = (*a6)(v14, a3);
    if (result)
    {
      sub_1C86EDB24(&v15, &v14);
      uint64_t result = (*a6)(v15, a2);
      if (result)
      {
        sub_1C86EDB24(&v16, &v15);
        uint64_t result = (*a6)(v16, a1);
        if (result) {
          return sub_1C86EDB24(&v17, &v16);
        }
      }
    }
  }
  return result;
}

long long *sub_1C86F33D8(long long *a1, long long *a2, long long *a3, unsigned int (**a4)(uint64_t, uint64_t))
{
  long long v18 = a1;
  if (a1 != a2)
  {
    BOOL v6 = a2;
    char v7 = a1;
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) / 112;
    if ((char *)a2 - (char *)a1 >= 113)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[7 * v10];
      do
      {
        sub_1C86F3540((uint64_t)v7, a4, v9, v12);
        v12 -= 7;
        --v11;
      }
      while (v11);
    }
    long long v17 = v6;
    if (v6 == a3)
    {
      a3 = v6;
    }
    else
    {
      long long v13 = v6;
      do
      {
        if ((*a4)((uint64_t)v13, (uint64_t)v18))
        {
          sub_1C86EDB24(&v17, &v18);
          sub_1C86F3540((uint64_t)v18, a4, v9, v18);
        }
        long long v13 = v17 + 7;
        long long v17 = v13;
      }
      while (v13 != a3);
      char v7 = v18;
      uint64_t v8 = (char *)v6 - (char *)v18;
    }
    if (v8 >= 113)
    {
      unint64_t v14 = (((unint64_t)v8 >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64;
      do
      {
        sub_1C86F37E8((uint64_t)v7, (uint64_t)v6, a4, v14);
        v6 -= 7;
      }
      while (v14-- > 2);
      return v17;
    }
  }
  return a3;
}

uint64_t sub_1C86F3540(uint64_t result, unsigned int (**a2)(uint64_t, uint64_t), uint64_t a3, long long *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v5 = a4;
    uint64_t v6 = result;
    int64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= 0x6DB6DB6DB6DB6DB7 * (((uint64_t)a4 - result) >> 4))
    {
      int64_t v10 = (0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4)) | 1;
      uint64_t v11 = result + 112 * v10;
      int64_t v12 = 0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4) + 2;
      if (v12 < a3 && (*a2)(result + 112 * v10, v11 + 112))
      {
        v11 += 112;
        int64_t v10 = v12;
      }
      uint64_t result = ((uint64_t (*)(uint64_t, long long *))*a2)(v11, v5);
      if ((result & 1) == 0)
      {
        long long v24 = *v5;
        uint64_t v25 = *((void *)v5 + 2);
        sub_1C86EE910((uint64_t)v26, (uint64_t *)v5 + 3);
        long long v27 = v5[4];
        uint64_t v28 = *((void *)v5 + 10);
        long long v29 = *(long long *)((char *)v5 + 88);
        uint64_t v30 = *((void *)v5 + 13);
        *((void *)v5 + 11) = 0;
        *((void *)v5 + 12) = 0;
        *((void *)v5 + 13) = 0;
        do
        {
          uint64_t v13 = v11;
          long long v14 = *(_OWORD *)v11;
          *((void *)v5 + 2) = *(void *)(v11 + 16);
          long long *v5 = v14;
          uint64_t v15 = v11 + 24;
          sub_1C86EE980((uint64_t)v5 + 24, (uint64_t *)(v11 + 24));
          long long v16 = *(_OWORD *)(v11 + 64);
          *((void *)v5 + 10) = *(void *)(v11 + 80);
          v5[4] = v16;
          long long v17 = (void **)v5 + 11;
          if (*((char *)v5 + 111) < 0) {
            operator delete(*v17);
          }
          long long v18 = *(_OWORD *)(v11 + 88);
          *((void *)v5 + 13) = *(void *)(v11 + 104);
          *(_OWORD *)long long v17 = v18;
          *(unsigned char *)(v11 + 111) = 0;
          *(unsigned char *)(v11 + 88) = 0;
          if (v7 < v10) {
            break;
          }
          uint64_t v19 = (2 * v10) | 1;
          uint64_t v11 = v6 + 112 * v19;
          int64_t v10 = 2 * v10 + 2;
          if (v10 >= a3)
          {
            int64_t v10 = v19;
          }
          else if ((*a2)(v6 + 112 * v19, v11 + 112))
          {
            v11 += 112;
          }
          else
          {
            int64_t v10 = v19;
          }
          uint64_t v5 = (long long *)v13;
        }
        while (!(*a2)(v11, (uint64_t)&v24));
        long long v20 = (void **)(v13 + 88);
        long long v21 = v24;
        *(void *)(v13 + 16) = v25;
        *(_OWORD *)uint64_t v13 = v21;
        sub_1C86EE980(v15, v26);
        long long v22 = v27;
        *(void *)(v13 + 80) = v28;
        *(_OWORD *)(v13 + 64) = v22;
        if (*(char *)(v13 + 111) < 0) {
          operator delete(*v20);
        }
        long long v23 = v29;
        *(void *)(v13 + 104) = v30;
        *(_OWORD *)long long v20 = v23;
        HIBYTE(v30) = 0;
        LOBYTE(v29) = 0;
        return sub_1C86ECE94((uint64_t)v26);
      }
    }
  }
  return result;
}

void sub_1C86F37D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_1C86EAD9C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86F37E8(uint64_t result, uint64_t a2, unsigned int (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a4 >= 2)
  {
    uint64_t v7 = result;
    long long v20 = *(_OWORD *)result;
    uint64_t v21 = *(void *)(result + 16);
    sub_1C86EE910((uint64_t)v22, (uint64_t *)(result + 24));
    long long v23 = *(_OWORD *)(v7 + 64);
    uint64_t v24 = *(void *)(v7 + 80);
    *(_OWORD *)__p = *(_OWORD *)(v7 + 88);
    uint64_t v26 = *(void *)(v7 + 104);
    *(void *)(v7 + 88) = 0;
    *(void *)(v7 + 96) = 0;
    *(void *)(v7 + 104) = 0;
    uint64_t v8 = sub_1C86F3A58(v7, a3, a4);
    uint64_t v9 = (long long *)(a2 - 112);
    uint64_t v10 = v8 + 24;
    if (v8 == a2 - 112)
    {
      *(void *)(v8 + 16) = v21;
      *(_OWORD *)uint64_t v8 = v20;
      sub_1C86EE980(v10, v22);
      long long v17 = v23;
      *(void *)(v8 + 80) = v24;
      *(_OWORD *)(v8 + 64) = v17;
      long long v18 = (void **)(v8 + 88);
      if (*(char *)(v8 + 111) < 0) {
        operator delete(*v18);
      }
      long long v19 = *(_OWORD *)__p;
      *(void *)(v8 + 104) = v26;
      *(_OWORD *)long long v18 = v19;
      HIBYTE(v26) = 0;
      LOBYTE(__p[0]) = 0;
    }
    else
    {
      long long v11 = *v9;
      *(void *)(v8 + 16) = *(void *)(a2 - 96);
      *(_OWORD *)uint64_t v8 = v11;
      sub_1C86EE980(v10, (uint64_t *)(a2 - 88));
      long long v12 = *(_OWORD *)(a2 - 48);
      *(void *)(v8 + 80) = *(void *)(a2 - 32);
      *(_OWORD *)(v8 + 64) = v12;
      uint64_t v13 = (void **)(v8 + 88);
      if (*(char *)(v8 + 111) < 0) {
        operator delete(*v13);
      }
      long long v14 = (void **)(a2 - 24);
      long long v15 = *(_OWORD *)(a2 - 24);
      *(void *)(v8 + 104) = *(void *)(a2 - 8);
      *(_OWORD *)uint64_t v13 = v15;
      *(unsigned char *)(a2 - 1) = 0;
      *(unsigned char *)(a2 - 24) = 0;
      uint64_t v16 = v8 + 112;
      long long *v9 = v20;
      *(void *)(a2 - 96) = v21;
      sub_1C86EE980(a2 - 88, v22);
      *(_OWORD *)(a2 - 48) = v23;
      *(void *)(a2 - 32) = v24;
      if (*(char *)(a2 - 1) < 0) {
        operator delete(*v14);
      }
      *(_OWORD *)long long v14 = *(_OWORD *)__p;
      *(void *)(a2 - 8) = v26;
      HIBYTE(v26) = 0;
      LOBYTE(__p[0]) = 0;
      sub_1C86F3B64(v7, v16, (uint64_t (**)(uint64_t, uint64_t))a3, 0x6DB6DB6DB6DB6DB7 * ((v16 - v7) >> 4));
      if (SHIBYTE(v26) < 0) {
        operator delete(__p[0]);
      }
    }
    return sub_1C86ECE94((uint64_t)v22);
  }
  return result;
}

void sub_1C86F3A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1C86EAD9C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1C86F3A58(uint64_t a1, unsigned int (**a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = a1 + 112 * v6 + 112;
    uint64_t v10 = 2 * v6;
    uint64_t v6 = (2 * v6) | 1;
    uint64_t v11 = v10 + 2;
    if (v10 + 2 < a3 && (*a2)(v9, v9 + 112))
    {
      v9 += 112;
      uint64_t v6 = v11;
    }
    long long v12 = *(_OWORD *)v9;
    *(void *)(a1 + 16) = *(void *)(v9 + 16);
    *(_OWORD *)a1 = v12;
    sub_1C86EE980(a1 + 24, (uint64_t *)(v9 + 24));
    long long v13 = *(_OWORD *)(v9 + 64);
    *(void *)(a1 + 80) = *(void *)(v9 + 80);
    *(_OWORD *)(a1 + 64) = v13;
    long long v14 = (void **)(a1 + 88);
    if (*(char *)(a1 + 111) < 0) {
      operator delete(*v14);
    }
    long long v15 = *(_OWORD *)(v9 + 88);
    *(void *)(a1 + 104) = *(void *)(v9 + 104);
    *(_OWORD *)long long v14 = v15;
    *(unsigned char *)(v9 + 111) = 0;
    *(unsigned char *)(v9 + 88) = 0;
    a1 = v9;
  }
  while (v6 <= v8);
  return v9;
}

uint64_t sub_1C86F3B64(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v7 = result;
    unint64_t v8 = v4 >> 1;
    uint64_t v9 = result + 112 * (v4 >> 1);
    uint64_t v10 = (long long *)(a2 - 112);
    uint64_t result = (*a3)(v9, a2 - 112);
    if (result)
    {
      long long v18 = *v10;
      uint64_t v19 = *((void *)v10 + 2);
      sub_1C86EE910((uint64_t)v20, (uint64_t *)(a2 - 88));
      long long v21 = *(_OWORD *)(a2 - 48);
      uint64_t v22 = *(void *)(a2 - 32);
      long long v23 = *(_OWORD *)(a2 - 24);
      uint64_t v24 = *(void *)(a2 - 8);
      *(void *)(a2 - 24) = 0;
      *(void *)(a2 - 16) = 0;
      *(void *)(a2 - 8) = 0;
      do
      {
        uint64_t v11 = v9;
        long long v12 = *(_OWORD *)v9;
        *((void *)v10 + 2) = *(void *)(v9 + 16);
        *uint64_t v10 = v12;
        uint64_t v13 = v9 + 24;
        sub_1C86EE980((uint64_t)v10 + 24, (uint64_t *)(v9 + 24));
        long long v14 = *(_OWORD *)(v9 + 64);
        *((void *)v10 + 10) = *(void *)(v9 + 80);
        void v10[4] = v14;
        long long v15 = (void **)v10 + 11;
        if (*((char *)v10 + 111) < 0) {
          operator delete(*v15);
        }
        long long v16 = *(_OWORD *)(v11 + 88);
        *((void *)v10 + 13) = *(void *)(v11 + 104);
        *(_OWORD *)long long v15 = v16;
        *(unsigned char *)(v11 + 111) = 0;
        *(unsigned char *)(v11 + 88) = 0;
        if (!v8) {
          break;
        }
        unint64_t v8 = (v8 - 1) >> 1;
        uint64_t v9 = v7 + 112 * v8;
        uint64_t v10 = (long long *)v11;
      }
      while (((*a3)(v9, (uint64_t)&v18) & 1) != 0);
      long long v17 = (void **)(v11 + 88);
      *(_OWORD *)uint64_t v11 = v18;
      *(void *)(v11 + 16) = v19;
      sub_1C86EE980(v13, v20);
      *(_OWORD *)(v11 + 64) = v21;
      *(void *)(v11 + 80) = v22;
      if (*(char *)(v11 + 111) < 0) {
        operator delete(*v17);
      }
      *(_OWORD *)long long v17 = v23;
      *(void *)(v11 + 104) = v24;
      HIBYTE(v24) = 0;
      LOBYTE(v23) = 0;
      return sub_1C86ECE94((uint64_t)v20);
    }
  }
  return result;
}

void sub_1C86F3D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1C86EAD9C((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_1C86F3D6C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C86F0338();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_1C86F3E20()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Failed to remove compressed file: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F3E9C()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Error getting file descriptor: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F3F18()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Error getting fd: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F3F94(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  archive_errno();
  int v6 = 134218498;
  uint64_t v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 2082;
  uint64_t v11 = sub_1C86D97C8();
  _os_log_error_impl(&dword_1C86D7000, a3, OS_LOG_TYPE_ERROR, "Error writing data to: %zd byte written with err_num: %{errno}d, err_string: %{public}s", (uint8_t *)&v6, 0x1Cu);
}

void sub_1C86F404C()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Failed to remove original file after compression: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F40C8(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C86D7000, a2, OS_LOG_TYPE_ERROR, "Error creating compressed file (archive_write_free): %i", (uint8_t *)v2, 8u);
}

void sub_1C86F4140()
{
  sub_1C86D97B8();
  archive_errno();
  sub_1C86D97C8();
  sub_1C86D9754();
  sub_1C86D9798(&dword_1C86D7000, v0, v1, "Error creating compressed file (archive_write_close): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
}

void sub_1C86F41C4()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Error reading data: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F4240()
{
  sub_1C86D97B8();
  archive_errno();
  sub_1C86D97C8();
  sub_1C86D9754();
  sub_1C86D9798(&dword_1C86D7000, v0, v1, "Error creating compressed file (archive_write_header): %i, err_num: %{errorno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
}

void sub_1C86F42C4()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Error stating original file: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F4340()
{
  sub_1C86D97B8();
  archive_errno();
  sub_1C86D97C8();
  sub_1C86D9754();
  sub_1C86D9798(&dword_1C86D7000, v0, v1, "Error creating compressed file (archive_write_open_fd): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
}

void sub_1C86F43C4()
{
  sub_1C86D97B8();
  archive_errno();
  sub_1C86D97C8();
  sub_1C86D9754();
  sub_1C86D9798(&dword_1C86D7000, v0, v1, "Error creating compressed file (archive_write_set_format_pax): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
}

void sub_1C86F4448()
{
  sub_1C86D97B8();
  archive_errno();
  sub_1C86D97C8();
  sub_1C86D9754();
  sub_1C86D9798(&dword_1C86D7000, v0, v1, "Error creating compressed file (archive_write_set_options): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
}

void sub_1C86F44CC()
{
  sub_1C86D97B8();
  archive_errno();
  sub_1C86D97C8();
  sub_1C86D9754();
  sub_1C86D9798(&dword_1C86D7000, v0, v1, "Error creating compressed file (archive_write_set_compression_gzip): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
}

void sub_1C86F4550(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1C86F4588(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1C86F45C0()
{
}

void sub_1C86F45DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1C86F464C()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "No IOReport channels found", v2, v3, v4, v5, v6);
}

void sub_1C86F4680(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1C86F46F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1C86F4760()
{
  sub_1C86DD998();
  sub_1C86DD918(&dword_1C86D7000, v0, v1, "Unable to serialize tailspin metadata dictionary to plist (%@) - %@");
}

void sub_1C86F47C8()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1C86DD958();
  sub_1C86DD9B0(&dword_1C86D7000, v1, v2, "ktrace_file_append_chunk(TAILSPIN_METADATA_CHUNK) failed with error %s", v3, v4, v5, v6, v7);
}

void sub_1C86F4848()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Persona: failed gathering managed persona", v2, v3, v4, v5, v6);
}

void sub_1C86F487C()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Failed to get installed root info kern.roots_installed: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F48F8()
{
  sub_1C86DD958();
  sub_1C86DD8F0(&dword_1C86D7000, v0, v1, "Error opening/closing darwin session: %@", v2, v3, v4, v5, v6);
}

void sub_1C86F4960()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Unable to get vfs.vnstats.vn_dealloc_level: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F49DC()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Unable to get kern.maxvnodes: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F4A58()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Unable to get kern.free_vnodes: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F4AD4()
{
  __error();
  sub_1C86D97E0();
  sub_1C86D9778(&dword_1C86D7000, v0, v1, "Unable to get kern.num_vnodes: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F4B50()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "Country code not found!", v2, v3, v4, v5, v6);
}

void sub_1C86F4B84()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1C86DD958();
  _os_log_debug_impl(&dword_1C86D7000, v0, OS_LOG_TYPE_DEBUG, "Country code found: %@", v1, 0xCu);
}

void sub_1C86F4BF8()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Preferred languages are not found!", v2, v3, v4, v5, v6);
}

void sub_1C86F4C2C()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1C86DD958();
  _os_log_debug_impl(&dword_1C86D7000, v0, OS_LOG_TYPE_DEBUG, "Preferred languages found: %@", v1, 0xCu);
}

void sub_1C86F4CA0()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Keyboards are not of Class type NSArray!", v2, v3, v4, v5, v6);
}

void sub_1C86F4CD4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *stat buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "Keyboards are not of Class type NSString!", buf, 2u);
}

void sub_1C86F4D14(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109378;
  v2[1] = qword_1EA52E2F0;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_debug_impl(&dword_1C86D7000, a2, OS_LOG_TYPE_DEBUG, "Shared cache fragmentation OS Cryptex File Extents count is %d for file: (\"%s\")", (uint8_t *)v2, 0x12u);
}

void sub_1C86F4DA0()
{
  __error();
  sub_1C86DD980();
  sub_1C86DD938(&dword_1C86D7000, v0, v1, "FileExtent: error opening \"%s\": %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F4E20()
{
  sub_1C86DD958();
  sub_1C86DD8F0(&dword_1C86D7000, v0, v1, "FileExtent: no extents for \"%s\" (empty file)\n", v2, v3, v4, v5, v6);
}

void sub_1C86F4E88()
{
  sub_1C86DD958();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_1C86DD918(&dword_1C86D7000, v0, v1, "FileExtent: 0 contigbytes fcntl() at offset %lld out of %lld", v2, v3);
}

void sub_1C86F4EFC()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1C86DD938(&dword_1C86D7000, v1, v2, "FileExtent: error in fcntl() call errno: %d : %s", v3, v4, v5, v6, 2u);
}

void sub_1C86F4F94()
{
  __error();
  sub_1C86DD980();
  sub_1C86DD938(&dword_1C86D7000, v0, v1, "FileExtent: failed to get file size for \"%s\": %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F5014()
{
  sub_1C86DD998();
  sub_1C86DD918(&dword_1C86D7000, v0, v1, "Unable to serialize dictionary to plist (%@) - %@");
}

void sub_1C86F507C()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1C86DD958();
  sub_1C86DD9B0(&dword_1C86D7000, v1, v2, "ktrace_file_append_chunk(TAILSPIN_SYMBOLS_CHUNK_TAG) failed with error %s", v3, v4, v5, v6, v7);
}

void sub_1C86F50FC()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Logarchive path is invalid", v2, v3, v4, v5, v6);
}

void sub_1C86F5130()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Logarchive does not exist at specified path", v2, v3, v4, v5, v6);
}

void sub_1C86F5164(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C86D7000, a2, OS_LOG_TYPE_ERROR, "Unable to start a symbolication session. ktrace_start() returned %d", (uint8_t *)v2, 8u);
}

void sub_1C86F51DC(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C86D7000, a2, OS_LOG_TYPE_ERROR, "Unable to set ktrace file to symbolication session. ktrace_set_ktrace_file() returned %d", (uint8_t *)v2, 8u);
}

void sub_1C86F5254()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "tailspin has been interrupted during symbolication - wrapping up...", v2, v3, v4, v5, v6);
}

void sub_1C86F5288()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Found the preferred languages array but contents are not NSString", v2, v3, v4, v5, v6);
}

void sub_1C86F52BC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "Unable to get the min bg timer period from sysctl - setting to default value", v1, 2u);
}

void sub_1C86F5300(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "Unable to get the min bg PET timer period from sysctl - setting to default values", v1, 2u);
}

void sub_1C86F5344()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "Successfully saved the file, now augmenting it", v2, v3, v4, v5, v6);
}

void sub_1C86F5378(int *a1, uint64_t a2, NSObject *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C86E4BC0(&dword_1C86D7000, a2, a3, "Unable to get current system config: %{errno}d", (uint8_t *)a2);
}

void sub_1C86F53B8(int *a1, uint64_t a2, NSObject *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C86E4BC0(&dword_1C86D7000, a2, a3, "Unable to open memstream to print current system config: %{errnod}d", (uint8_t *)a2);
}

void sub_1C86F53F8()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Current system config description is empty", v2, v3, v4, v5, v6);
}

void sub_1C86F542C(int *a1, uint64_t a2, NSObject *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C86E4BC0(&dword_1C86D7000, a2, a3, "Unable to print current system config: %{errnod}d", (uint8_t *)a2);
}

void sub_1C86F546C()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Save was not successful, dumping out current ktrace/kperf configuration:", v2, v3, v4, v5, v6);
}

void sub_1C86F54A4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "Unable to serialize resampled stacks dictionary (%@) - %@", (uint8_t *)&v4, 0x16u);
}

void sub_1C86F5534(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)stat buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "ktrace_file_append_chunk(TAILSPIN_RESAMPLED_STACKS_CHUNK_TAG) failed with error %s", buf, 0xCu);
}

void sub_1C86F557C()
{
  sub_1C86E4B94();
  sub_1C86E4B78(&dword_1C86D7000, v0, v1, "Unable to determine main binary of target process [%d]", v2, v3, v4, v5, v6);
}

void sub_1C86F55E4(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)stat buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "Main binary %{public}@ not found in target process [%d]", buf, 0x12u);
}

void sub_1C86F564C(uint8_t *buf, NSObject *a2, double a3)
{
  *(_DWORD *)stat buf = 134217984;
  *(double *)(buf + 4) = a3;
  _os_log_debug_impl(&dword_1C86D7000, a2, OS_LOG_TYPE_DEBUG, "Done parsing in %.2fs", buf, 0xCu);
}

void sub_1C86F5690()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "Parsing file for main binary and truncated stacks", v2, v3, v4, v5, v6);
}

void sub_1C86F56C4()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "Parsing file for truncated stacks", v2, v3, v4, v5, v6);
}

void sub_1C86F56F8()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "Parsing file for main binary", v2, v3, v4, v5, v6);
}

void sub_1C86F572C()
{
  sub_1C86E4B94();
  sub_1C86E4B78(&dword_1C86D7000, v0, v1, "Unable to use existing ktrace buffer: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F5794(unint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  double v3 = (double)a1 / 1000000000.0;
  __int16 v4 = 1024;
  int v5 = 5;
  _os_log_error_impl(&dword_1C86D7000, a2, OS_LOG_TYPE_ERROR, "Tailspin requested with max time %.1fs in the future, restricting to %ds into the future", (uint8_t *)&v2, 0x12u);
}

void sub_1C86F582C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = *(_DWORD *)(a1 + 60);
  int v5 = 134218498;
  uint64_t v6 = a2;
  __int16 v7 = 2082;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "Saved %{bytes}lld tailspin on behalf of %{public}s [%d] (augment failed)", (uint8_t *)&v5, 0x1Cu);
}

void sub_1C86F58C8(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4 = *a2;
  *(_DWORD *)stat buf = 136446466;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "Unable to fstat %{public}s's saved tailspin file: %{errno}d", buf, 0x12u);
}

void sub_1C86F5924()
{
  sub_1C86E4B94();
  sub_1C86E4B78(&dword_1C86D7000, v0, v1, "Unable to get earliest ktrace timestamp: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_1C86F598C()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "Did initial fsync", v2, v3, v4, v5, v6);
}

void sub_1C86F59C0()
{
  sub_1C86E4B94();
  sub_1C86E4B78(&dword_1C86D7000, v0, v1, "No ktrace flatbuffer for target pid [%d]", v2, v3, v4, v5, v6);
}

void sub_1C86F5A28()
{
  sub_1C86E4B94();
  sub_1C86E4B78(&dword_1C86D7000, v0, v1, "No load info in ktrace flatbuffer for target pid [%d]", v2, v3, v4, v5, v6);
}

void sub_1C86F5A90(uint8_t *buf, int *a2, uint64_t *a3, os_log_t log)
{
  uint64_t v4 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v4 > 0xAu && (uint64_t v5 = v4[5]) != 0) {
    uint64_t v6 = *(void *)((char *)a2 + v5);
  }
  else {
    uint64_t v6 = -1;
  }
  *(_DWORD *)stat buf = 134217984;
  *a3 = v6;
  _os_log_debug_impl(&dword_1C86D7000, log, OS_LOG_TYPE_DEBUG, "No macho for symbol owner at %#llx", buf, 0xCu);
}

void sub_1C86F5B04()
{
  sub_1C86E4B94();
  sub_1C86E4B78(&dword_1C86D7000, v0, v1, "ktrace flatbuffer for target pid [%d] failed verification", v2, v3, v4, v5, v6);
}

void sub_1C86F5B6C()
{
  sub_1C86E4B94();
  sub_1C86E4B78(&dword_1C86D7000, v0, v1, "Failed to fetch load infos for [%d] from live process", v2, v3, v4, v5, v6);
}

void sub_1C86F5BD4()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "KDREADCURTHRMAP sysctl failed", v2, v3, v4, v5, v6);
}

void sub_1C86F5C08()
{
  sub_1C86E4BA0();
  sub_1C86E4BDC(&dword_1C86D7000, v0, v1, "[%d] %s, but no cache to throw out", v2, v3);
}

void sub_1C86F5C84()
{
  sub_1C86E4BA0();
  sub_1C86E4BDC(&dword_1C86D7000, v0, v1, "[%d] %s, throwing out cache", v2, v3);
}

void sub_1C86F5D00(int *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_1C86D7000, a2, OS_LOG_TYPE_ERROR, "Unable to get current ktrace configured_by for state %d: %{errno}d", (uint8_t *)v5, 0xEu);
}

void sub_1C86F5DA0(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1C86E8238(&dword_1C86D7000, a1, v3, "Unable to get current ktrace state: %{errno}d", (uint8_t *)v4);
}

void sub_1C86F5E28()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Server-client version mismatch: config sizes are different", v2, v3, v4, v5, v6);
}

void sub_1C86F5E5C()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Unable to get config from server", v2, v3, v4, v5, v6);
}

void sub_1C86F5E90(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E4F14530]);
  sub_1C86DD958();
  sub_1C86E8250(&dword_1C86D7000, a2, v3, "Unable to communicate with tailspin server: %s", v4);
}

void sub_1C86F5F1C(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1C86E8238(&dword_1C86D7000, a1, v3, "tailspin check: unable to check kdebug config %{errno}d", (uint8_t *)v4);
}

void sub_1C86F5FA4()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "tailspin check: tailspin is running", v2, v3, v4, v5, v6);
}

void sub_1C86F5FD8()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "tailspin check: trace is not enabled", v2, v3, v4, v5, v6);
}

void sub_1C86F600C()
{
  sub_1C86DD90C();
  sub_1C86DD964(&dword_1C86D7000, v0, v1, "tailspin check: trace is not background mode", v2, v3, v4, v5, v6);
}

void sub_1C86F6040(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 description];
  [v3 UTF8String];
  sub_1C86DD958();
  sub_1C86E8250(&dword_1C86D7000, a2, v4, "Unable to create plist out of options - %s", v5);
}

void sub_1C86F60D4(int *a1, uint64_t a2, NSObject *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C86E8238(&dword_1C86D7000, a3, (uint64_t)a3, "Unable to open saved ktrace file for augmenting: %{errno}d", (uint8_t *)a2);
}

void sub_1C86F6118(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(*(void *)a1 + 24);
  v4[0] = 67109120;
  v4[1] = v3;
  sub_1C86E8238(&dword_1C86D7000, a2, a3, "Unable to get earliest/latest wall time: %{errno}d", (uint8_t *)v4);
}

void sub_1C86F6190()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Unable to gather trial info", v2, v3, v4, v5, v6);
}

void sub_1C86F61C4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1C86DD958();
  sub_1C86E8250(&dword_1C86D7000, v0, v1, "Unable to serialize trial dict: %@", v2);
}

void sub_1C86F6230(int *a1, uint64_t a2, NSObject *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C86E8238(&dword_1C86D7000, a3, (uint64_t)a3, "Unable to append trial dict: %{errno}d", (uint8_t *)a2);
}

void sub_1C86F6274(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)stat buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_1C86D7000, log, OS_LOG_TYPE_DEBUG, "Found %lu active trial rollouts", buf, 0xCu);
}

void sub_1C86F62BC()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1C86DD958();
  sub_1C86E8250(&dword_1C86D7000, v0, v1, "Unable to determine active trial rollouts: %@", v2);
}

void sub_1C86F6328(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)stat buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_1C86D7000, log, OS_LOG_TYPE_DEBUG, "Found %lu active trial experiments", buf, 0xCu);
}

void sub_1C86F6370()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1C86DD958();
  sub_1C86E8250(&dword_1C86D7000, v0, v1, "Unable to determine active trial experiments: %@", v2);
}

void sub_1C86F63DC(int *a1, uint64_t a2, NSObject *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C86E8238(&dword_1C86D7000, a3, (uint64_t)a3, "Unable to append Ariadne plists: %{errno}d", (uint8_t *)a2);
}

void sub_1C86F6420()
{
  sub_1C86DD90C();
  sub_1C86DA504(&dword_1C86D7000, v0, v1, "Unable to allocate tailspin connection", v2, v3, v4, v5, v6);
}

void sub_1C86F6454(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *TrialLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"libtailspin_client.m" lineNumber:37 description:@"%s", *a1];

  __break(1u);
}

void sub_1C86F64D4()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getTRIAllocationStatusClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"libtailspin_client.m" lineNumber:38 description:@"Unable to find class %s", "TRIAllocationStatus"];

  __break(1u);
}

void sub_1C86F6550()
{
  __assert_rtn("-[TSPSaveMeasurements _stopRecordingTimeForPhase:]", "TSPSaveMeasurements.m", 226, "startTime != nil");
}

void sub_1C86F657C()
{
}

void sub_1C86F6598(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "Failed to parse dscsym data for shared cache %s: %d", (uint8_t *)&v3, 0x12u);
}

void sub_1C86F6620()
{
}

void sub_1C86F663C(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4 = *a2;
  *(_DWORD *)stat buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_1C86D7000, log, OS_LOG_TYPE_ERROR, "Unable to save symbols for binary %s: %{errno}d", buf, 0x12u);
}

void sub_1C86F6698(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v3 = a1 + 88;
  uint64_t v4 = v5;
  if (*(char *)(v3 + 23) >= 0) {
    uint64_t v4 = v3;
  }
  int v6 = 134218242;
  uint64_t v7 = a2;
  __int16 v8 = 2080;
  uint64_t v9 = v4;
  _os_log_debug_impl(&dword_1C86D7000, log, OS_LOG_TYPE_DEBUG, "Address %#llx is in binary %s", (uint8_t *)&v6, 0x16u);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFDictionaryRef IOCopySystemLoadAdvisoryDetailed(void)
{
  return (CFDictionaryRef)MEMORY[0x1F40E8740]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x1F417A738]();
}

uint64_t IOReportChannelGetFormat()
{
  return MEMORY[0x1F417A740]();
}

uint64_t IOReportChannelGetGroup()
{
  return MEMORY[0x1F417A748]();
}

uint64_t IOReportCopyChannelsForDrivers()
{
  return MEMORY[0x1F417A770]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x1F417A798]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x1F417A7A8]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x1F417A7B0]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x1F417A7D0]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x1F417A7F8]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1F40E7118](userName);
}

uint64_t OSAGetDATaskingValue()
{
  return MEMORY[0x1F4116E70]();
}

uint64_t SAResampleThreads()
{
  return MEMORY[0x1F414A6E8]();
}

uint64_t SASecondsFromMachTimeUsingLiveTimebase()
{
  return MEMORY[0x1F414A6F0]();
}

uint64_t SignpostSupportAllowlistedStringSetForCurrentDevice()
{
  return MEMORY[0x1F4150348]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1F40D8D08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
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

uint64_t __udivti3()
{
  return MEMORY[0x1F40C9D08]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40C9F90]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x1F417DFE0]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1F417DFF0]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1F417DFF8]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x1F417E030]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1F417E040]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1F417E048]();
}

uint64_t archive_errno()
{
  return MEMORY[0x1F417E078]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x1F417E1C0]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1F417E1D0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1F417E1D8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1F417E218]();
}

uint64_t archive_write_open_fd()
{
  return MEMORY[0x1F417E228]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x1F417E248]();
}

uint64_t archive_write_set_options()
{
  return MEMORY[0x1F417E268]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dscsym_iterate_buffer()
{
  return MEMORY[0x1F417F5F0]();
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kpdecode_cursor_free()
{
  return MEMORY[0x1F4177E00]();
}

uint64_t kpersona_find_by_type()
{
  return MEMORY[0x1F40CC730]();
}

uint64_t ktrace_add_stackshot_flags()
{
  return MEMORY[0x1F4177E28]();
}

uint64_t ktrace_chunk_copy_plist()
{
  return MEMORY[0x1F4177E38]();
}

uint64_t ktrace_chunk_is_64_bit()
{
  return MEMORY[0x1F4177E40]();
}

uint64_t ktrace_chunk_map_data()
{
  return MEMORY[0x1F4177E50]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x1F4177E58]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x1F4177E68]();
}

uint64_t ktrace_chunk_unmap_data()
{
  return MEMORY[0x1F4177E78]();
}

uint64_t ktrace_chunks()
{
  return MEMORY[0x1F4177E90]();
}

uint64_t ktrace_config_create_current()
{
  return MEMORY[0x1F4177EA0]();
}

uint64_t ktrace_config_destroy()
{
  return MEMORY[0x1F4177EA8]();
}

uint64_t ktrace_config_get_owner_kind()
{
  return MEMORY[0x1F4177EB8]();
}

uint64_t ktrace_config_kdebug_get_state()
{
  return MEMORY[0x1F4177EC8]();
}

uint64_t ktrace_config_print_description()
{
  return MEMORY[0x1F4177F00]();
}

uint64_t ktrace_dumpbuffer_address_space_pid()
{
  return MEMORY[0x1F4177F20]();
}

uint64_t ktrace_events_single()
{
  return MEMORY[0x1F4177F48]();
}

uint64_t ktrace_file_append_chunk()
{
  return MEMORY[0x1F4177F50]();
}

uint64_t ktrace_file_append_live_ariadne_signpost_specs()
{
  return MEMORY[0x1F4177F58]();
}

uint64_t ktrace_file_append_log_content_from_store()
{
  return MEMORY[0x1F4177F60]();
}

uint64_t ktrace_file_close()
{
  return MEMORY[0x1F4177F68]();
}

uint64_t ktrace_file_earliest_timestamp()
{
  return MEMORY[0x1F4177F70]();
}

uint64_t ktrace_file_earliest_walltime()
{
  return MEMORY[0x1F4177F78]();
}

uint64_t ktrace_file_ktrace_event_count()
{
  return MEMORY[0x1F4177F80]();
}

uint64_t ktrace_file_latest_walltime()
{
  return MEMORY[0x1F4177F88]();
}

uint64_t ktrace_file_open_fd()
{
  return MEMORY[0x1F4177F90]();
}

uint64_t ktrace_get_pid_for_thread()
{
  return MEMORY[0x1F4177FE0]();
}

uint64_t ktrace_kperf()
{
  return MEMORY[0x1F4177FF8]();
}

uint64_t ktrace_session_create()
{
  return MEMORY[0x1F4178078]();
}

uint64_t ktrace_session_destroy()
{
  return MEMORY[0x1F4178088]();
}

uint64_t ktrace_session_set_event_names_enabled()
{
  return MEMORY[0x1F4178090]();
}

uint64_t ktrace_set_command_argv()
{
  return MEMORY[0x1F41780A8]();
}

uint64_t ktrace_set_completion_handler()
{
  return MEMORY[0x1F41780B8]();
}

uint64_t ktrace_set_execnames_enabled()
{
  return MEMORY[0x1F41780C0]();
}

uint64_t ktrace_set_ktrace_file()
{
  return MEMORY[0x1F41780D8]();
}

uint64_t ktrace_set_post_processing_handler()
{
  return MEMORY[0x1F41780E0]();
}

uint64_t ktrace_set_reason()
{
  return MEMORY[0x1F41780E8]();
}

uint64_t ktrace_set_signal_handler()
{
  return MEMORY[0x1F41780F0]();
}

uint64_t ktrace_set_thread_exit_handler()
{
  return MEMORY[0x1F41780F8]();
}

uint64_t ktrace_set_trigger_kind()
{
  return MEMORY[0x1F4178100]();
}

uint64_t ktrace_set_use_existing()
{
  return MEMORY[0x1F4178108]();
}

uint64_t ktrace_set_writing_filter()
{
  return MEMORY[0x1F4178110]();
}

uint64_t ktrace_stackshot()
{
  return MEMORY[0x1F4178118]();
}

uint64_t ktrace_start()
{
  return MEMORY[0x1F4178120]();
}

uint64_t ktrace_start_writing_fd()
{
  return MEMORY[0x1F4178130]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
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

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return (FILE *)MEMORY[0x1F40CD0F8](__bufp, __sizep);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1F40CDB90](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
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

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

uint64_t trace_parse_filter()
{
  return MEMORY[0x1F4178138]();
}

uint64_t trace_print_filter()
{
  return MEMORY[0x1F4178140]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
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

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}