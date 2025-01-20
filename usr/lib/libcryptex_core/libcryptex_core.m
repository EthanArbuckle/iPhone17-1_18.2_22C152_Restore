void _cryptex_core_dealloc(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  cryptex_asset_array_destroy((uint64_t)(a1 + 8));
  v2 = (void *)a1[20];
  if (v2) {
    os_release(v2);
  }
  v3 = (void *)a1[21];
  if (v3) {
    os_release(v3);
  }
  v4 = (void *)a1[27];
  if (v4) {
    os_release(v4);
  }
  v5 = (void *)a1[26];
  if (v5) {
    xpc_release(v5);
  }

  object_proto_destroy((uint64_t)(a1 + 2));
}

void _cryptex_core_cx1_properties_dealloc(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 48) = 0;
  }
  v3 = *(void **)(a1 + 56);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 56) = 0;
  }

  object_proto_destroy(a1 + 16);
}

void *cryptex_core_create(uint64_t a1)
{
  v2 = (void *)_cryptex_core_alloc();
  v2[5] = a1;
  v2[22] = &_cryptex_asset_type_pdmg;
  v2[23] = &_cryptex_asset_type_c411;
  v2[24] = &_cryptex_asset_type_ltrs;
  v2[25] = &_cryptex_asset_type_roothash;
  v2[26] = 0;
  object_proto_init((uint64_t)(v2 + 2), (int)"com.apple.security.libcryptex.core", "cryptex.core");
  return v2;
}

int *cryptex_core_set_asset(int *result, uint64_t *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a2;
  v3 = *(void **)(*a2 + 8);
  if (*(void *)&result[2 * v3[3] + 16]) {
    cryptex_core_set_asset_cold_1(&v11, buf);
  }
  v5 = result;
  if (v3 == (void *)&_cryptex_asset_type_cpxd)
  {
    v7 = (const char *)*((void *)result + 2);
    *(void *)(v2 + 24) = v7;
    *((void *)result + 22) = &_cryptex_asset_type_cpxd;
    int v8 = *__error();
    v9 = *((void *)v5 + 4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = "[anonymous]";
      if (v7) {
        v10 = v7;
      }
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = v10;
      _os_log_impl(&dword_21CBD9000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: core has research dmg asset", buf, 0xCu);
    }
    result = __error();
    *result = v8;
    v3 = *(void **)(v2 + 8);
  }
  else
  {
    v6 = &_cryptex_asset_type_gdmg;
    if (v3 == (void *)&_cryptex_asset_type_gdmg)
    {
      *(void *)(v2 + 24) = *((void *)result + 2);
      *((void *)result + 22) = &_cryptex_asset_type_gdmg;
LABEL_16:
      v3 = v6;
      goto LABEL_17;
    }
  }
  v6 = &_cryptex_asset_type_ginf;
  if (v3 == (void *)&_cryptex_asset_type_ginf)
  {
    *((void *)v5 + 23) = &_cryptex_asset_type_ginf;
    goto LABEL_16;
  }
  v6 = &_cryptex_asset_type_gtcd;
  if (v3 == (void *)&_cryptex_asset_type_gtcd)
  {
    *((void *)v5 + 24) = &_cryptex_asset_type_gtcd;
    goto LABEL_16;
  }
  v6 = &_cryptex_asset_type_gtgv;
  if (v3 == (void *)&_cryptex_asset_type_gtgv)
  {
    *((void *)v5 + 25) = &_cryptex_asset_type_gtgv;
    goto LABEL_16;
  }
LABEL_17:
  *(void *)&v5[2 * v3[3] + 16] = v2;
  *a2 = 0;
  return result;
}

uint64_t cryptex_core_set_assets_from_directory(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  unsigned __int32 file = 2;
  v6 = &cryptex_asset_types;
  uint64_t v59 = *MEMORY[0x263EF8340];
  v7 = &_cryptex_asset_type_root;
  do
  {
    uint64_t v8 = (uint64_t)v6[v4];
    int v53 = -1;
    object = 0;
    if ((void *)v8 == v7)
    {
      int v53 = dup_np();
      v52 = cryptex_asset_new((uint64_t)v7);
LABEL_13:
      cryptex_core_set_asset((int *)a1, (uint64_t *)&v52);
      unsigned __int32 file = 0;
      int v19 = 0;
      goto LABEL_27;
    }
    int v53 = openat(a2, *(const char **)(v8 + 40), 0);
    if ((v53 & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v9 = *__error();
    if (!v9)
    {
      ++v5;
      v20 = cryptex_asset_new(v8);
      v21 = v20;
      v52 = v20;
      if ((_UNKNOWN *)v8 == &_cryptex_asset_type_im4m)
      {
        uint64_t v58 = 0;
        memset(buf, 0, sizeof(buf));
        unsigned __int32 file = _read_file(*((_DWORD *)v20 + 4), buf);
        if (!file)
        {
          unsigned __int32 v35 = signature_metadata_read_from_file(*((_DWORD *)v21 + 4), &object);
          if (v35)
          {
            unsigned __int32 v36 = v35;
            v37 = *(const char **)(a1 + 16);
            int v38 = *__error();
            v39 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v54 = 136446466;
              v40 = "[anonymous]";
              if (v37) {
                v40 = v37;
              }
              *(void *)&v54[4] = v40;
              __int16 v55 = 1024;
              unsigned __int32 v56 = v36;
              _os_log_impl(&dword_21CBD9000, v39, OS_LOG_TYPE_ERROR, "%{public}s: Failed to load metadata for Image4 manifest.: %{darwin.errno}d", v54, 0x12u);
            }
            *__error() = v38;
          }
          v41 = (void *)cryptex_signature_create(buf, 0, object);
          cryptex_core_attach_signature(a1, v41);
          if (v41) {
            os_release(v41);
          }
          goto LABEL_13;
        }
        v32 = *(const char **)(a1 + 16);
        int v23 = *__error();
        v33 = *(NSObject **)(a1 + 32);
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        *(_DWORD *)v54 = 136446466;
        v34 = "[anonymous]";
        if (v32) {
          v34 = v32;
        }
        *(void *)&v54[4] = v34;
        __int16 v55 = 1024;
        unsigned __int32 v56 = file;
        v26 = (__n128 *)v54;
        v27 = v33;
        v28 = "%{public}s: failed to read im4m: %{darwin.errno}d";
      }
      else
      {
        if ((_UNKNOWN *)v8 != &_cryptex_asset_type_cx1p) {
          goto LABEL_13;
        }
        *(void *)v54 = 0;
        unsigned __int32 file = cryptex_core_cx1_read_from_file(*((_DWORD *)v20 + 4), (void **)v54);
        if (!file)
        {
          *(void *)(a1 + 216) = os_retain(*(void **)v54);
          goto LABEL_13;
        }
        v22 = *(const char **)(a1 + 16);
        int v23 = *__error();
        v24 = *(NSObject **)(a1 + 32);
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        buf[0].n128_u32[0] = 136446466;
        v25 = "[anonymous]";
        if (v22) {
          v25 = v22;
        }
        *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v25;
        buf[0].n128_u16[6] = 1024;
        *(unsigned __int32 *)((char *)&buf[0].n128_u32[3] + 2) = file;
        v26 = buf;
        v27 = v24;
        v28 = "%{public}s: Failed to read Cryptex1 properties.: %{darwin.errno}d";
      }
      goto LABEL_25;
    }
    if (v9 != 2)
    {
      unsigned __int32 file = *__error();
      v29 = *(const char **)(a1 + 16);
      int v23 = *__error();
      v30 = *(NSObject **)(a1 + 32);
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        *__error() = v23;
        int v19 = 14;
        goto LABEL_27;
      }
      buf[0].n128_u32[0] = 136446466;
      v31 = "[anonymous]";
      if (v29) {
        v31 = v29;
      }
      *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v31;
      buf[0].n128_u16[6] = 1024;
      *(unsigned __int32 *)((char *)&buf[0].n128_u32[3] + 2) = file;
      v26 = buf;
      v27 = v30;
      v28 = "%{public}s: openat: %{darwin.errno}d";
LABEL_25:
      _os_log_impl(&dword_21CBD9000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)v26, 0x12u);
      goto LABEL_26;
    }
    uint64_t v10 = a2;
    uint64_t v11 = v7;
    v12 = v6;
    uint64_t v13 = v5;
    v14 = *(const char **)(a1 + 16);
    int v15 = *__error();
    v16 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v17 = *(void *)(v8 + 40);
      v18 = "[anonymous]";
      if (v14) {
        v18 = v14;
      }
      buf[0].n128_u32[0] = 136446466;
      *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v18;
      buf[0].n128_u16[6] = 2080;
      *(unint64_t *)((char *)&buf[0].n128_u64[1] + 6) = v17;
      _os_log_impl(&dword_21CBD9000, v16, OS_LOG_TYPE_DEBUG, "%{public}s: no asset of type: %s", (uint8_t *)buf, 0x16u);
    }
    *__error() = v15;
    int v19 = 4;
    uint64_t v5 = v13;
    v6 = v12;
    v7 = v11;
    a2 = v10;
LABEL_27:
    if (object) {
      os_release(object);
    }
    if (v53 != -1 && close(v53) == -1) {
      cryptex_core_set_assets_from_directory_cold_1(v54, buf);
    }
    if ((v19 | 4) != 4) {
      return file;
    }
    ++v4;
  }
  while (v4 != 12);
  if (v5)
  {
    if (!*(void *)(a1 + 8 * *(void *)(*(void *)(a1 + 176) + 24) + 64))
    {
      v42 = *(const char **)(a1 + 16);
      int v43 = *__error();
      v44 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = "[anonymous]";
        if (v42) {
          v45 = v42;
        }
        buf[0].n128_u32[0] = 136446466;
        *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v45;
        buf[0].n128_u16[6] = 1024;
        *(unsigned __int32 *)((char *)&buf[0].n128_u32[3] + 2) = 2;
        v46 = "%{public}s: No image asset was loaded from directory.: %{darwin.errno}d";
        goto LABEL_59;
      }
      goto LABEL_60;
    }
  }
  else
  {
    v47 = *(const char **)(a1 + 16);
    int v43 = *__error();
    v44 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v48 = "[anonymous]";
      if (v47) {
        v48 = v47;
      }
      buf[0].n128_u32[0] = 136446466;
      *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v48;
      buf[0].n128_u16[6] = 1024;
      *(unsigned __int32 *)((char *)&buf[0].n128_u32[3] + 2) = 2;
      v46 = "%{public}s: No cryptex assets were loaded from directory.: %{darwin.errno}d";
LABEL_59:
      _os_log_impl(&dword_21CBD9000, v44, OS_LOG_TYPE_ERROR, v46, (uint8_t *)buf, 0x12u);
    }
LABEL_60:
    *__error() = v43;
    return 2;
  }
  return file;
}

void *cryptex_core_attach_signature(uint64_t a1, void *object)
{
  uint64_t v4 = *(void **)(a1 + 160);
  if (v4) {
    os_release(v4);
  }
  result = os_retain(object);
  *(void *)(a1 + 160) = result;
  return result;
}

uint64_t cryptex_core_cx1_read_from_file(int a1, void **a2)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v38 = 0;
  CFErrorRef error = 0;
  memset(v37, 0, sizeof(v37));
  long long v72 = 0u;
  memset(v73, 0, sizeof(v73));
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v57 = 0u;
  memset(v58, 0, 31);
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
  *(_OWORD *)v44 = 0u;
  uint64_t file = _read_file(a1, v37);
  if (file)
  {
    uint64_t v4 = file;
    int v5 = *__error();
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      *__error() = v5;
      buff_destroy(v37);
      return v4;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v4;
    v6 = MEMORY[0x263EF8438];
    v7 = "Failed to read properties from file.: %{darwin.errno}d";
LABEL_4:
    _os_log_impl(&dword_21CBD9000, v6, OS_LOG_TYPE_ERROR, v7, buf, 8u);
    goto LABEL_5;
  }
  CFDataRef v9 = CFDataCreate(0, *(const UInt8 **)&v37[0], *((CFIndex *)&v37[0] + 1));
  if (!v9)
  {
    int v5 = *__error();
    uint64_t v4 = 12;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = 12;
    v6 = MEMORY[0x263EF8438];
    v7 = "Failed to create data.: %{darwin.errno}d";
    goto LABEL_4;
  }
  CFDataRef v10 = v9;
  CFDictionaryRef v11 = (const __CFDictionary *)CFPropertyListCreateWithData(0, v9, 0, 0, &error);
  if (v11)
  {
    CFDictionaryRef v12 = v11;
    CFTypeID v13 = CFGetTypeID(v11);
    if (v13 == CFDictionaryGetTypeID()) {
      CFDictionaryRef v14 = v12;
    }
    else {
      CFDictionaryRef v14 = 0;
    }
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v14, @"Cryptex1,NonceDomain");
    if (Value)
    {
      CFNumberRef v16 = Value;
      CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(v14, @"Cryptex1,SubType");
      if (v17)
      {
        CFNumberRef v18 = v17;
        CFStringRef v19 = (const __CFString *)CFDictionaryGetValue(v14, @"Cryptex1,Version");
        if (v19)
        {
          CFStringRef v20 = v19;
          CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(v14, @"Cryptex1,PreauthVersion");
          if (v21)
          {
            CFStringRef v22 = v21;
            CFBooleanRef v23 = (const __CFBoolean *)CFDictionaryGetValue(v14, @"MountedCryptex");
            if (v23)
            {
              CFBooleanRef v24 = v23;
              CFBooleanRef v25 = (const __CFBoolean *)CFDictionaryGetValue(v14, @"Cryptex1,UseProductClass");
              if (v25)
              {
                CFBooleanRef v26 = v25;
                CFStringGetCString(v20, buffer, 255, 0x8000100u);
                CFStringGetCString(v22, v44, 255, 0x8000100u);
                int UInt32 = _CFNumberGetUInt32(v16);
                int v28 = _CFNumberGetUInt32(v18);
                char v29 = CFBooleanGetValue(v24) != 0;
                char v30 = CFBooleanGetValue(v26) != 0;
                v31 = (void *)cryptex_core_cx1_properties_create(UInt32, v28, buffer, v44, v29, v30);
                if (v31)
                {
                  v32 = v31;
                  uint64_t v4 = 0;
                  if (a2) {
                    *a2 = os_retain(v31);
                  }
                }
                else
                {
                  int v36 = *__error();
                  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v41) = 12;
                    _os_log_impl(&dword_21CBD9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to create property object.: %{darwin.errno}d", buf, 8u);
                  }
                  v32 = 0;
                  *__error() = v36;
                  uint64_t v4 = 12;
                }
                goto LABEL_40;
              }
              int v34 = *__error();
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "Cryptex1,UseProductClass";
                __int16 v42 = 1024;
                int v43 = 22;
                unsigned __int32 v35 = MEMORY[0x263EF8438];
                goto LABEL_38;
              }
LABEL_39:
              v32 = 0;
              *__error() = v34;
              uint64_t v4 = 22;
LABEL_40:
              buff_destroy(v37);
              CFRelease(v12);
              CFRelease(v10);
              if (v32) {
                os_release(v32);
              }
              return v4;
            }
            int v34 = *__error();
            if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              goto LABEL_39;
            }
            *(_DWORD *)buf = 136315394;
            v41 = "MountedCryptex";
            __int16 v42 = 1024;
            int v43 = 22;
            unsigned __int32 v35 = MEMORY[0x263EF8438];
          }
          else
          {
            int v34 = *__error();
            if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              goto LABEL_39;
            }
            *(_DWORD *)buf = 136315394;
            v41 = "Cryptex1,PreauthVersion";
            __int16 v42 = 1024;
            int v43 = 22;
            unsigned __int32 v35 = MEMORY[0x263EF8438];
          }
        }
        else
        {
          int v34 = *__error();
          if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            goto LABEL_39;
          }
          *(_DWORD *)buf = 136315394;
          v41 = "Cryptex1,Version";
          __int16 v42 = 1024;
          int v43 = 22;
          unsigned __int32 v35 = MEMORY[0x263EF8438];
        }
      }
      else
      {
        int v34 = *__error();
        if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 136315394;
        v41 = "Cryptex1,SubType";
        __int16 v42 = 1024;
        int v43 = 22;
        unsigned __int32 v35 = MEMORY[0x263EF8438];
      }
    }
    else
    {
      int v34 = *__error();
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136315394;
      v41 = "Cryptex1,NonceDomain";
      __int16 v42 = 1024;
      int v43 = 22;
      unsigned __int32 v35 = MEMORY[0x263EF8438];
    }
LABEL_38:
    _os_log_impl(&dword_21CBD9000, v35, OS_LOG_TYPE_ERROR, "Cryptex1 property plist is missing expected key: %s: %{darwin.errno}d", buf, 0x12u);
    goto LABEL_39;
  }
  int v33 = *__error();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v41 = (const char *)error;
    __int16 v42 = 1024;
    int v43 = 12;
    _os_log_impl(&dword_21CBD9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to create property list: %{public}@: %{darwin.errno}d", buf, 0x12u);
  }
  *__error() = v33;
  buff_destroy(v37);
  CFRelease(v10);
  return 12;
}

void *cryptex_core_set_cryptex1_properties(uint64_t a1, void *object)
{
  result = os_retain(object);
  *(void *)(a1 + 216) = result;
  return result;
}

uint64_t cryptex_core_get_image_asset(uint64_t a1)
{
  return *(void *)(a1 + 8 * *(void *)(*(void *)(a1 + 176) + 24) + 64);
}

uint64_t cryptex_core_set_assets_from_fds(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(&cryptex_asset_types + a2);
  if ((*v8 & 0x20) != 0)
  {
    BOOL is_cryptex1 = cryptex_asset_type_is_cryptex1(*(&cryptex_asset_types + a2));
    CFStringRef v21 = &_cryptex_asset_type_ltrs;
    if (is_cryptex1) {
      CFStringRef v21 = &_cryptex_asset_type_gtcd;
    }
    uint64_t v44 = (uint64_t)v21;
    CFStringRef v22 = &_cryptex_asset_type_c411;
    if (is_cryptex1) {
      CFStringRef v22 = &_cryptex_asset_type_ginf;
    }
    uint64_t v46 = (uint64_t)v22;
    CFBooleanRef v23 = &_cryptex_asset_type_roothash;
    if (is_cryptex1) {
      CFBooleanRef v23 = &_cryptex_asset_type_gtgv;
    }
    uint64_t v45 = (uint64_t)v23;
    if ((*a3 & 0x80000000) != 0)
    {
      int v36 = *(const char **)(a1 + 16);
      int v37 = *__error();
      uint64_t v38 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = "[anonymous]";
        if (v36) {
          v39 = v36;
        }
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v39;
        __int16 v48 = 1024;
        LODWORD(v49) = 9;
        _os_log_impl(&dword_21CBD9000, v38, OS_LOG_TYPE_ERROR, "%{public}s: FD for image is invalid: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v37;
      return 9;
    }
    else
    {
      if (!a4 || (*a4 & 0x80000000) != 0)
      {
        CFBooleanRef v24 = *(const char **)(a1 + 16);
        int v25 = *__error();
        CFBooleanRef v26 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = "[anonymous]";
          if (v24) {
            v27 = v24;
          }
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = v27;
          _os_log_impl(&dword_21CBD9000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s: FD for ltrs is invalid. OK for no-code cryptexes.", buf, 0xCu);
        }
        *__error() = v25;
      }
      if (!a5 || (*a5 & 0x80000000) != 0)
      {
        int v28 = *(const char **)(a1 + 16);
        int v29 = *__error();
        char v30 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = "[anonymous]";
          if (v28) {
            v31 = v28;
          }
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = v31;
          _os_log_impl(&dword_21CBD9000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s: FD for c411 is invalid. Will generate one", buf, 0xCu);
        }
        *__error() = v29;
      }
      if ((*a6 & 0x80000000) != 0)
      {
        v40 = *(const char **)(a1 + 16);
        int v41 = *__error();
        __int16 v42 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          int v43 = "[anonymous]";
          if (v40) {
            int v43 = v40;
          }
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = v43;
          __int16 v48 = 1024;
          LODWORD(v49) = 81;
          _os_log_impl(&dword_21CBD9000, v42, OS_LOG_TYPE_ERROR, "%{public}s: FD for im4m is invalid: %{darwin.errno}d", buf, 0x12u);
        }
        *__error() = v41;
        return 81;
      }
      else
      {
        if (!a7 || (*a7 & 0x80000000) != 0)
        {
          v32 = *(const char **)(a1 + 16);
          int v33 = *__error();
          int v34 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int32 v35 = "[anonymous]";
            if (v32) {
              unsigned __int32 v35 = v32;
            }
            *(_DWORD *)buf = 136446210;
            *(void *)&uint8_t buf[4] = v35;
            _os_log_impl(&dword_21CBD9000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s: FD for volume hash is invalid. AuthAPFS will not be supported.", buf, 0xCu);
          }
          *__error() = v33;
        }
        *(void *)buf = cryptex_asset_new((uint64_t)v8);
        cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        if (a4 && (*a4 & 0x80000000) == 0)
        {
          *(void *)buf = cryptex_asset_new(v44);
          cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        }
        if (a7 && (*a7 & 0x80000000) == 0)
        {
          *(void *)buf = cryptex_asset_new(v45);
          cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        }
        if (a5 && (*a5 & 0x80000000) == 0)
        {
          *(void *)buf = cryptex_asset_new(v46);
          cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        }
        *(void *)buf = cryptex_asset_new((uint64_t)&_cryptex_asset_type_im4m);
        cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        return 0;
      }
    }
  }
  else
  {
    CFDataRef v10 = *(const char **)(a1 + 16);
    int v11 = *__error();
    CFDictionaryRef v12 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      CFTypeID v13 = "[anonymous]";
      *(_DWORD *)buf = 136446722;
      if (v10) {
        CFTypeID v13 = v10;
      }
      *(void *)&uint8_t buf[4] = v13;
      __int16 v48 = 2048;
      uint64_t v49 = a2;
      __int16 v50 = 1024;
      int v51 = 22;
      _os_log_impl(&dword_21CBD9000, v12, OS_LOG_TYPE_ERROR, "%{public}s: cryptex type is not image: %lld: %{darwin.errno}d", buf, 0x1Cu);
    }
    *__error() = v11;
    return 22;
  }
}

uint64_t cryptex_core_get_asset(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 8 * *(void *)(a2 + 24) + 64);
}

uint64_t cryptex_core_get_info_asset(uint64_t a1)
{
  return *(void *)(a1 + 8 * *(void *)(*(void *)(a1 + 184) + 24) + 64);
}

uint64_t cryptex_core_get_tc_asset(uint64_t a1)
{
  return *(void *)(a1 + 8 * *(void *)(*(void *)(a1 + 192) + 24) + 64);
}

uint64_t cryptex_core_get_volumehash_asset(uint64_t a1)
{
  return *(void *)(a1 + 8 * *(void *)(*(void *)(a1 + 200) + 24) + 64);
}

uint64_t cryptex_core_image_authapfs_enabled(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64 + 8 * *(void *)(*(void *)(a1 + 200) + 24));
  LODWORD(result) = cryptex_asset_type_is_cryptex1(*(void **)(*(void *)(a1
                                                                        + 64
                                                                        + 8
                                                                        * *(void *)(*(void *)(a1 + 176) + 24))
                                                            + 8));
  if (v1) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t cryptex_core_pop_asset(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 8 * *(void *)(a2 + 24);
  uint64_t result = *(void *)(v2 + 64);
  *(void *)(v2 + 64) = 0;
  return result;
}

void *cryptex_core_attach_host(uint64_t a1, void *object)
{
  uint64_t v4 = *(void **)(a1 + 168);
  if (v4) {
    os_release(v4);
  }
  uint64_t result = os_retain(object);
  *(void *)(a1 + 168) = result;
  return result;
}

char *cryptex_core_generate_identifier(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v5 = 0;
  uint64_t v1 = *(const char **)(a1 + 16);
  uint32_t v2 = arc4random();
  v3 = "anonymous";
  if (v1) {
    v3 = v1;
  }
  if (asprintf(&v5, "%s.%#x", v3, v2) < 0) {
    cryptex_core_generate_identifier_cold_1(&v6, v7);
  }
  return v5;
}

char *cryptex_core_generate_version()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t result = strdup("0.0.1");
  if (!result) {
    cryptex_core_generate_version_cold_1(&v1, v2);
  }
  return result;
}

BOOL cryptex_core_name_is_system_cryptex(char *a1)
{
  return cryptex_system_cryptex_lookup_by_name(a1) != 0;
}

uint64_t cryptex_core_get_nonce_domain_handle(void *a1, _DWORD *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (cryptex_core_is_cryptex1(a1))
    {
      uint64_t v4 = a1[27];
      if (v4)
      {
        uint64_t result = 0;
        *a2 = *(_DWORD *)(v4 + 40);
      }
      else
      {
        int v15 = (const char *)a1[2];
        int v16 = *__error();
        CFNumberRef v17 = a1[4];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          CFNumberRef v18 = "[anonymous]";
          if (v15) {
            CFNumberRef v18 = v15;
          }
          int v19 = 136446466;
          CFStringRef v20 = v18;
          __int16 v21 = 1024;
          LODWORD(v22) = 2;
          _os_log_impl(&dword_21CBD9000, v17, OS_LOG_TYPE_ERROR, "%{public}s: No Cryptex1 properties available.: %{darwin.errno}d", (uint8_t *)&v19, 0x12u);
        }
        *__error() = v16;
        return 2;
      }
    }
    else
    {
      CFDataRef v10 = (const char *)a1[2];
      int v11 = *__error();
      CFDictionaryRef v12 = a1[4];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        CFTypeID v13 = "[anonymous]";
        if (v10) {
          CFTypeID v13 = v10;
        }
        uint64_t v14 = *(void *)(a1[22] + 40);
        int v19 = 136446722;
        CFStringRef v20 = v13;
        __int16 v21 = 2080;
        uint64_t v22 = v14;
        __int16 v23 = 1024;
        int v24 = 45;
        _os_log_impl(&dword_21CBD9000, v12, OS_LOG_TYPE_ERROR, "%{public}s: not supported image type: %s: %{darwin.errno}d", (uint8_t *)&v19, 0x1Cu);
      }
      *__error() = v11;
      return 45;
    }
  }
  else
  {
    uint64_t v6 = (const char *)a1[2];
    int v7 = *__error();
    uint64_t v8 = a1[4];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CFDataRef v9 = "[anonymous]";
      if (v6) {
        CFDataRef v9 = v6;
      }
      int v19 = 136446466;
      CFStringRef v20 = v9;
      __int16 v21 = 1024;
      LODWORD(v22) = 22;
      _os_log_impl(&dword_21CBD9000, v8, OS_LOG_TYPE_ERROR, "%{public}s: Invalid input.: %{darwin.errno}d", (uint8_t *)&v19, 0x12u);
    }
    *__error() = v7;
    return 22;
  }
  return result;
}

BOOL cryptex_core_is_cryptex1(void *a1)
{
  uint64_t v1 = a1[*(void *)(a1[22] + 24) + 8];
  uint64_t v2 = a1[*(void *)(a1[23] + 24) + 8];
  uint64_t v3 = a1[*(void *)(a1[24] + 24) + 8];
  uint64_t v4 = a1[*(void *)(a1[25] + 24) + 8];
  if (v1) {
    BOOL is_cryptex1 = cryptex_asset_type_is_cryptex1(*(void **)(v1 + 8));
  }
  else {
    BOOL is_cryptex1 = 1;
  }
  if (v2) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = is_cryptex1;
  }
  if (v2) {
    BOOL v7 = !is_cryptex1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    BOOL v6 = cryptex_asset_type_is_cryptex1(*(void **)(v2 + 8));
  }
  if (v3) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6;
  }
  if (v3) {
    BOOL v9 = !v6;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    BOOL v8 = cryptex_asset_type_is_cryptex1(*(void **)(v3 + 8));
  }
  if (v4) {
    BOOL result = 0;
  }
  else {
    BOOL result = v8;
  }
  if (v4) {
    BOOL v11 = !v8;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    CFDictionaryRef v12 = *(void **)(v4 + 8);
    return cryptex_asset_type_is_cryptex1(v12);
  }
  return result;
}

uint64_t cryptex_core_copy_nonce_domain_desc(void *a1, char **a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)__str = 0u;
  long long v19 = 0u;
  uint64_t v17 = 0;
  int v16 = 0;
  if (!a1) {
    return 22;
  }
  if (cryptex_core_is_cryptex1(a1))
  {
    uint64_t nonce_domain_handle = cryptex_core_get_nonce_domain_handle(a1, &v16);
    if (nonce_domain_handle)
    {
      uint64_t v5 = nonce_domain_handle;
      BOOL v6 = (const char *)a1[2];
      int v7 = *__error();
      BOOL v8 = a1[4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        BOOL v9 = "[anonymous]";
        if (v6) {
          BOOL v9 = v6;
        }
        *(_DWORD *)buf = 136446466;
        CFBooleanRef v26 = v9;
        __int16 v27 = 1024;
        int v28 = v5;
        CFDataRef v10 = "%{public}s: Failed to get nonce domain handle.: %{darwin.errno}d";
LABEL_14:
        _os_log_impl(&dword_21CBD9000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    snprintf(__str, 0x64uLL, "Cryptex1 nonce domain = %u");
  }
  else
  {
    uint64_t nonce_domain_index = cryptex_core_get_nonce_domain_index(a1, &v17);
    if (nonce_domain_index)
    {
      uint64_t v5 = nonce_domain_index;
      CFDictionaryRef v12 = (const char *)a1[2];
      int v7 = *__error();
      BOOL v8 = a1[4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        CFTypeID v13 = "[anonymous]";
        if (v12) {
          CFTypeID v13 = v12;
        }
        *(_DWORD *)buf = 136446466;
        CFBooleanRef v26 = v13;
        __int16 v27 = 1024;
        int v28 = v5;
        CFDataRef v10 = "%{public}s: Failed to get nonce domain index.: %{darwin.errno}d";
        goto LABEL_14;
      }
LABEL_15:
      *__error() = v7;
      return v5;
    }
    snprintf(__str, 0x64uLL, "nonce domain index %llu");
  }
  if (!a2) {
    return 0;
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v14 = strdup(__str);
      if (v14) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v14 = strdup(__str);
    if (!v14) {
      cryptex_core_copy_nonce_domain_desc_cold_1(__str);
    }
  }
  uint64_t v5 = 0;
  *a2 = v14;
  return v5;
}

uint64_t cryptex_core_get_nonce_domain_index(void *a1, uint64_t *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[22];
  if (v2 == &_cryptex_asset_type_cpxd)
  {
    uint64_t result = 0;
    uint64_t v10 = 3;
LABEL_13:
    *a2 = v10;
    return result;
  }
  if (v2 == &_cryptex_asset_type_pdmg)
  {
    unint64_t v11 = a1[7];
    if (v11 >= 2)
    {
      uint64_t result = 0;
      if (v11 != 2) {
        return result;
      }
      uint64_t v10 = 4;
    }
    else
    {
      uint64_t result = 0;
      uint64_t v10 = 2;
    }
    goto LABEL_13;
  }
  uint64_t v4 = (const char *)a1[2];
  int v5 = *__error();
  BOOL v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    uint64_t v8 = *(void *)(a1[22] + 40);
    int v12 = 136446722;
    CFTypeID v13 = v7;
    __int16 v14 = 2080;
    uint64_t v15 = v8;
    __int16 v16 = 1024;
    int v17 = 45;
    _os_log_impl(&dword_21CBD9000, v6, OS_LOG_TYPE_ERROR, "%{public}s: not supported image type: %s: %{darwin.errno}d", (uint8_t *)&v12, 0x1Cu);
  }
  *__error() = v5;
  return 45;
}

uint64_t cryptex_core_get_nonce_domain(void *a1, uint64_t *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v17 = 0;
  int v16 = 0;
  uint64_t v2 = 22;
  if (a1 && a2)
  {
    if (cryptex_core_is_cryptex1(a1))
    {
      uint64_t nonce_domain_handle = cryptex_core_get_nonce_domain_handle(a1, &v16);
      if (nonce_domain_handle)
      {
        uint64_t v2 = nonce_domain_handle;
        BOOL v6 = (const char *)a1[2];
        int v7 = *__error();
        uint64_t v8 = a1[4];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          BOOL v9 = "[anonymous]";
          if (v6) {
            BOOL v9 = v6;
          }
          *(_DWORD *)buf = 136446466;
          long long v19 = v9;
          __int16 v20 = 1024;
          int v21 = v2;
          uint64_t v10 = "%{public}s: Failed to get nonce domain handle.: %{darwin.errno}d";
LABEL_14:
          _os_log_impl(&dword_21CBD9000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      uint64_t nonce_domain_from_index = img4_nonce_domain_get_from_handle();
    }
    else
    {
      uint64_t nonce_domain_index = cryptex_core_get_nonce_domain_index(a1, (uint64_t *)&v17);
      if (nonce_domain_index)
      {
        uint64_t v2 = nonce_domain_index;
        int v12 = (const char *)a1[2];
        int v7 = *__error();
        uint64_t v8 = a1[4];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          CFTypeID v13 = "[anonymous]";
          if (v12) {
            CFTypeID v13 = v12;
          }
          *(_DWORD *)buf = 136446466;
          long long v19 = v13;
          __int16 v20 = 1024;
          int v21 = v2;
          uint64_t v10 = "%{public}s: Failed to get nonce domain index.: %{darwin.errno}d";
          goto LABEL_14;
        }
LABEL_15:
        *__error() = v7;
        return v2;
      }
      uint64_t nonce_domain_from_index = _img4_get_nonce_domain_from_index(v17);
    }
    uint64_t v2 = 0;
    *a2 = nonce_domain_from_index;
  }
  return v2;
}

uint64_t cryptex_core_set_nonce_persistence(uint64_t result, uint64_t a2)
{
  *(void *)(result + 56) = a2;
  return result;
}

uint64_t cryptex_core_set_install_persistence(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = a2;
  return result;
}

uint64_t cryptex_core_get_cryptex1_properties(uint64_t a1)
{
  return *(void *)(a1 + 216);
}

uint64_t cryptex_core_cx1_properties_create(int a1, int a2, const char *a3, const char *a4, char a5, char a6)
{
  uint64_t v12 = _cryptex_core_cx1_properties_alloc();
  *(_DWORD *)(v12 + 40) = a1;
  *(_DWORD *)(v12 + 44) = a2;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      CFTypeID v13 = strdup(a3);
      if (v13) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    CFTypeID v13 = strdup(a3);
    if (!v13) {
      cryptex_core_copy_nonce_domain_desc_cold_1(a3);
    }
  }
  *(void *)(v12 + 48) = v13;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      __int16 v14 = strdup(a4);
      if (v14) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    __int16 v14 = strdup(a4);
    if (!v14) {
      cryptex_core_copy_nonce_domain_desc_cold_1(a4);
    }
  }
  *(void *)(v12 + 56) = v14;
  *(unsigned char *)(v12 + 64) = a5;
  *(unsigned char *)(v12 + 65) = a6;
  object_proto_init(v12 + 16, (int)"com.apple.security.libcryptex.core", "cryptex.core");
  return v12;
}

uint64_t cryptex_core_cx1_properties_create_with_xpc_dictionary(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  int v21 = 0;
  uint64_t v22 = 0;
  __int16 v20 = 0;
  int uint64 = _xpc_dictionary_try_get_uint64(a1, "Cryptex1,NonceDomain", &v24);
  if (uint64)
  {
    int v3 = uint64;
    int v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CFBooleanRef v26 = "Cryptex1,NonceDomain";
      __int16 v27 = 1024;
      int v28 = v3;
      int v5 = MEMORY[0x263EF8438];
      BOOL v6 = "Dictionary missing key: %s: %{darwin.errno}d";
LABEL_19:
      uint32_t v17 = 18;
LABEL_20:
      _os_log_impl(&dword_21CBD9000, v5, OS_LOG_TYPE_ERROR, v6, buf, v17);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  int v7 = _xpc_dictionary_try_get_uint64(a1, "Cryptex1,SubType", &v23);
  if (v7)
  {
    int v8 = v7;
    int v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CFBooleanRef v26 = "Cryptex1,SubType";
      __int16 v27 = 1024;
      int v28 = v8;
      int v5 = MEMORY[0x263EF8438];
      BOOL v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
LABEL_21:
    uint64_t v18 = __error();
    uint64_t result = 0;
    int *v18 = v4;
    return result;
  }
  int string = _xpc_dictionary_try_get_string(a1, "Cryptex1,Version", &v22);
  if (string)
  {
    int v10 = string;
    int v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CFBooleanRef v26 = "Cryptex1,Version";
      __int16 v27 = 1024;
      int v28 = v10;
      int v5 = MEMORY[0x263EF8438];
      BOOL v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  int v11 = _xpc_dictionary_try_get_string(a1, "Cryptex1,PreauthVersion", &v21);
  if (v11)
  {
    int v12 = v11;
    int v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CFBooleanRef v26 = "Cryptex1,PreauthVersion";
      __int16 v27 = 1024;
      int v28 = v12;
      int v5 = MEMORY[0x263EF8438];
      BOOL v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  int v13 = _xpc_dictionary_try_get_BOOL(a1, "MountedCryptex", (BOOL *)&v20 + 1);
  if (v13)
  {
    int v14 = v13;
    int v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CFBooleanRef v26 = "MountedCryptex";
      __int16 v27 = 1024;
      int v28 = v14;
      int v5 = MEMORY[0x263EF8438];
      BOOL v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  int v15 = _xpc_dictionary_try_get_BOOL(a1, "Cryptex1,UseProductClass", (BOOL *)&v20);
  if (v15)
  {
    int v16 = v15;
    int v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CFBooleanRef v26 = "Cryptex1,UseProductClass";
      __int16 v27 = 1024;
      int v28 = v16;
      int v5 = MEMORY[0x263EF8438];
      BOOL v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (HIDWORD(v24) || HIDWORD(v23))
  {
    int v4 = *__error();
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = 84;
    int v5 = MEMORY[0x263EF8438];
    BOOL v6 = "Integer overflow.: %{darwin.errno}d";
    goto LABEL_27;
  }
  uint64_t result = cryptex_core_cx1_properties_create(v24, v23, v22, v21, SHIBYTE(v20), v20);
  if (!result)
  {
    int v4 = *__error();
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = 12;
    int v5 = MEMORY[0x263EF8438];
    BOOL v6 = "Failed to create property object.: %{darwin.errno}d";
LABEL_27:
    uint32_t v17 = 8;
    goto LABEL_20;
  }
  return result;
}

xpc_object_t cryptex_core_cx1_copy_xpc_dictionary(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Cryptex1,NonceDomain", *(unsigned int *)(a1 + 40));
  xpc_dictionary_set_uint64(v2, "Cryptex1,SubType", *(unsigned int *)(a1 + 44));
  xpc_dictionary_set_string(v2, "Cryptex1,Version", *(const char **)(a1 + 48));
  xpc_dictionary_set_string(v2, "Cryptex1,PreauthVersion", *(const char **)(a1 + 56));
  xpc_dictionary_set_BOOL(v2, "MountedCryptex", *(unsigned char *)(a1 + 64));
  xpc_dictionary_set_BOOL(v2, "Cryptex1,UseProductClass", *(unsigned char *)(a1 + 65));
  return v2;
}

uint64_t cryptex_core_cx1_write_to_file(uint64_t a1, int a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  CFNumberRef v4 = _CFNumberCreateFromUInt32(*(_DWORD *)(a1 + 40));
  CFNumberRef v5 = _CFNumberCreateFromUInt32(*(_DWORD *)(a1 + 44));
  CFStringRef v6 = _CFStringCreateFromUTF8String(*(char **)(a1 + 48));
  CFStringRef v7 = _CFStringCreateFromUTF8String(*(char **)(a1 + 56));
  CFStringRef v8 = v7;
  if (*(unsigned char *)(a1 + 64)) {
    BOOL v9 = (void *)*MEMORY[0x263EFFB40];
  }
  else {
    BOOL v9 = (void *)*MEMORY[0x263EFFB38];
  }
  if (*(unsigned char *)(a1 + 65)) {
    int v10 = (void *)*MEMORY[0x263EFFB40];
  }
  else {
    int v10 = (void *)*MEMORY[0x263EFFB38];
  }
  uint64_t v23 = 0;
  memset(v22, 0, sizeof(v22));
  *(_OWORD *)keys = xmmword_264438D90;
  long long v31 = *(_OWORD *)&off_264438DA0;
  long long v32 = xmmword_264438DB0;
  values[0] = v4;
  values[1] = v5;
  values[2] = (void *)v6;
  values[3] = (void *)v7;
  values[4] = v9;
  values[5] = v10;
  CFDictionaryRef v11 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v11)
  {
    CFDictionaryRef v12 = v11;
    CFDataRef v13 = CFPropertyListCreateData(0, v11, kCFPropertyListXMLFormat_v1_0, 0, &error);
    if (v13)
    {
      CFDataRef v14 = v13;
      BytePtr = CFDataGetBytePtr(v13);
      CFIndex Length = CFDataGetLength(v14);
      buff_init_signed(v22, 0, 0, (uint64_t)BytePtr, Length);
      uint64_t v17 = _write_file(a2, (uint64_t)v22);
      if (v17)
      {
        int v18 = *__error();
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v26) = v17;
          _os_log_impl(&dword_21CBD9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to write properties to file.: %{darwin.errno}d", buf, 8u);
        }
        *__error() = v18;
      }
      buff_destroy(v22);
      CFRelease(v14);
    }
    else
    {
      int v20 = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        CFErrorRef v26 = error;
        __int16 v27 = 1024;
        int v28 = 12;
        _os_log_impl(&dword_21CBD9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to create property list data: %{public}@: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v20;
      buff_destroy(v22);
      uint64_t v17 = 12;
    }
    CFRelease(v12);
    if (v10) {
LABEL_22:
    }
      CFRelease(v10);
  }
  else
  {
    int v19 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = 12;
      _os_log_impl(&dword_21CBD9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to create dictionary.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v19;
    buff_destroy(v22);
    uint64_t v17 = 12;
    if (v10) {
      goto LABEL_22;
    }
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v17;
}

uint64_t cryptex_core_parse_info_asset(void *a1, char **a2, char ***a3, BOOL *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v35 = 0;
  memset(v34, 0, sizeof(v34));
  uint64_t v5 = a1[*(void *)(a1[23] + 24) + 8];
  if (v5)
  {
    uint64_t file = _read_file(*(_DWORD *)(v5 + 16), v34);
    if (file)
    {
      uint64_t v10 = file;
      CFDictionaryRef v11 = (const char *)a1[2];
      int v12 = *__error();
      CFDataRef v13 = a1[4];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        CFDataRef v14 = "[anonymous]";
        if (v11) {
          CFDataRef v14 = v11;
        }
        *(_DWORD *)buf = 136446466;
        int v37 = v14;
        __int16 v38 = 1024;
        LODWORD(v39) = v10;
        int v15 = "%{public}s: Failed to read info asset.: %{darwin.errno}d";
LABEL_11:
        _os_log_impl(&dword_21CBD9000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0x12u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    int v19 = (void *)xpc_create_from_plist();
    if (!v19)
    {
      CFErrorRef v26 = (const char *)a1[2];
      int v12 = *__error();
      CFDataRef v13 = a1[4];
      uint64_t v10 = 22;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      __int16 v27 = "[anonymous]";
      if (v26) {
        __int16 v27 = v26;
      }
      *(_DWORD *)buf = 136446466;
      int v37 = v27;
      __int16 v38 = 1024;
      LODWORD(v39) = 22;
      int v15 = "%{public}s: Failed to parse info asset as plist.: %{darwin.errno}d";
      goto LABEL_11;
    }
    int v20 = v19;
    int string = xpc_dictionary_get_string(v19, "CFBundleIdentifier");
    if (string)
    {
      uint64_t v22 = string;
      uint64_t v23 = xpc_dictionary_get_string(v20, "CFBundleVersion");
      if (v23)
      {
        uint64_t v24 = v23;
        if (a4) {
          _xpc_dictionary_try_get_BOOL(v20, "NoCode", a4);
        }
        if (a2)
        {
          if (_dispatch_is_multithreaded())
          {
            while (1)
            {
              uint64_t v25 = strdup(v22);
              if (v25) {
                break;
              }
              __os_temporary_resource_shortage();
            }
          }
          else
          {
            uint64_t v25 = strdup(v22);
            if (!v25) {
              cryptex_core_copy_nonce_domain_desc_cold_1(v22);
            }
          }
          *a2 = v25;
        }
        if (a3) {
          *a3 = cryptex_version_new(v24);
        }
        buff_destroy(v34);
        uint64_t v10 = 0;
        goto LABEL_42;
      }
      long long v32 = (const char *)a1[2];
      int v29 = *__error();
      char v30 = a1[4];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = "[anonymous]";
        *(_DWORD *)buf = 136446722;
        if (v32) {
          uint64_t v33 = v32;
        }
        int v37 = v33;
        __int16 v38 = 2080;
        v39 = "CFBundleVersion";
        __int16 v40 = 1024;
        int v41 = 22;
LABEL_35:
        _os_log_impl(&dword_21CBD9000, v30, OS_LOG_TYPE_ERROR, "%{public}s: Info dictionary missing expected key: '%s': %{darwin.errno}d", buf, 0x1Cu);
      }
    }
    else
    {
      int v28 = (const char *)a1[2];
      int v29 = *__error();
      char v30 = a1[4];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        long long v31 = "[anonymous]";
        *(_DWORD *)buf = 136446722;
        if (v28) {
          long long v31 = v28;
        }
        int v37 = v31;
        __int16 v38 = 2080;
        v39 = "CFBundleIdentifier";
        __int16 v40 = 1024;
        int v41 = 22;
        goto LABEL_35;
      }
    }
    *__error() = v29;
    buff_destroy(v34);
    uint64_t v10 = 22;
LABEL_42:
    os_release(v20);
    return v10;
  }
  int v16 = (const char *)a1[2];
  int v12 = *__error();
  CFDataRef v13 = a1[4];
  uint64_t v10 = 2;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = "[anonymous]";
    if (v16) {
      uint64_t v17 = v16;
    }
    *(_DWORD *)buf = 136446466;
    int v37 = v17;
    __int16 v38 = 1024;
    LODWORD(v39) = 2;
    int v15 = "%{public}s: Cryptex has no metadata.: %{darwin.errno}d";
    goto LABEL_11;
  }
LABEL_12:
  *__error() = v12;
  buff_destroy(v34);
  return v10;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_2()
{
  *uint64_t v0 = 0;
  double result = 0.0;
  *uint64_t v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_4()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return _os_crash_msg();
}

double OUTLINED_FUNCTION_6(void *a1, _OWORD *a2)
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

size_t OUTLINED_FUNCTION_7(const char *__s)
{
  return strlen(__s);
}

const char **cryptex_content_type_parse(char *__s2)
{
  uint64_t v2 = 0;
  while (1)
  {
    int v3 = (const char **)cryptex_content_types[v2];
    if (!strcmp(*v3, __s2)) {
      break;
    }
    if (++v2 == 7) {
      return 0;
    }
  }
  return v3;
}

const char *cryptex_session_state_to_string(unint64_t a1)
{
  if (a1 > 5) {
    return "UNK";
  }
  else {
    return off_264438E90[a1];
  }
}

const char *cryptex_session_event_to_string(uint64_t a1)
{
  if (a1 > 15)
  {
    switch(a1)
    {
      case 16:
        return "TERMINATED";
      case 32:
        return "FAIL";
      case 64:
        return "ALL";
      default:
        return "UNKNOWN";
    }
  }
  else
  {
    double result = "NONE";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        double result = "STAGING";
        break;
      case 2:
        double result = "START";
        break;
      case 4:
        double result = "READY";
        break;
      case 8:
        double result = "STOP";
        break;
      default:
        return "UNKNOWN";
    }
  }
  return result;
}

void _session_core_dealloc(void *a1)
{
  uint64_t v2 = (void *)a1[12];
  if (v2) {
    free(v2);
  }
  int v3 = (void *)a1[9];
  if (v3) {
    xpc_release(v3);
  }
  CFNumberRef v4 = (void *)a1[10];
  if (v4) {
    xpc_release(v4);
  }
  uint64_t v5 = (void *)a1[11];
  if (v5) {
    xpc_release(v5);
  }
  CFStringRef v6 = (void *)a1[13];
  if (v6) {
    free(v6);
  }
  CFStringRef v7 = (void *)a1[14];
  if (v7) {
    free(v7);
  }

  object_proto_destroy((uint64_t)(a1 + 2));
}

char *session_core_generate_username(const char *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  if (asprintf(&v2, "cryptex_%s", a1) < 0) {
    session_core_generate_username_cold_1(&v3, v4);
  }
  return v2;
}

uint64_t session_core_create(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = _session_core_alloc();
  object_proto_init(v2 + 16, (int)"com.apple.security.libcryptex.core", "cryptex.session");
  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = 0x100000000;
  *(void *)(v2 + 72) = xpc_array_create_empty();
  *(void *)(v2 + 80) = xpc_dictionary_create_empty();
  memset(out, 0, sizeof(out));
  memset(__s1, 0, 37);
  uuid_generate_random(out);
  uuid_unparse(out, __s1);
  uint64_t v3 = strdup(__s1);
  *(_DWORD *)(v2 + 40) = 0;
  *(void *)(v2 + 88) = 0;
  *(void *)(v2 + 96) = v3;
  username = session_core_generate_username(v3);
  *(void *)(v2 + 104) = username;
  CFStringRef v6 = 0;
  if (asprintf(&v6, "/Users/%s", username) < 0) {
    session_core_generate_username_cold_1(out, __s1);
  }
  *(void *)(v2 + 112) = v6;
  *(unsigned char *)(v2 + 120) = 0;
  return v2;
}

uint64_t cryptex_session_core_transition(void *a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1[6];
  if (v4 != 3 && a2 == 8) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 6;
  }
  switch(v4)
  {
    case 0:
      if (a2 == 1) {
        uint64_t v6 = 1;
      }
      goto LABEL_11;
    case 1:
LABEL_11:
      if (a2 == 2) {
        uint64_t v6 = 2;
      }
      break;
    case 2:
      BOOL v7 = a2 == 4;
      uint64_t v8 = 3;
      goto LABEL_15;
    case 3:
      if (a2 == 8) {
        uint64_t v6 = 4;
      }
      else {
        uint64_t v6 = 6;
      }
      break;
    case 4:
    case 5:
      BOOL v7 = a2 == 16;
      uint64_t v8 = 5;
LABEL_15:
      if (v7) {
        uint64_t v6 = v8;
      }
      break;
    default:
      break;
  }
  uint64_t v9 = (const char *)a1[2];
  int v10 = *__error();
  CFDictionaryRef v11 = a1[4];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (!v9) {
      uint64_t v9 = "[anonymous]";
    }
    unint64_t v12 = a1[6];
    if (v12 > 5) {
      CFDataRef v13 = "UNK";
    }
    else {
      CFDataRef v13 = off_264438E90[v12];
    }
    uint64_t v14 = a1[12];
    int v15 = cryptex_session_event_to_string(a2);
    if ((unint64_t)(v6 - 1) > 4) {
      int v16 = "UNK";
    }
    else {
      int v16 = off_264438E68[v6 - 1];
    }
    int v18 = 136447234;
    int v19 = v9;
    __int16 v20 = 2080;
    uint64_t v21 = v14;
    __int16 v22 = 2080;
    uint64_t v23 = v13;
    __int16 v24 = 2080;
    uint64_t v25 = v15;
    __int16 v26 = 2080;
    __int16 v27 = v16;
    _os_log_impl(&dword_21CBD9000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: %s: state %s, event %s -> state %s", (uint8_t *)&v18, 0x34u);
  }
  *__error() = v10;
  a1[6] = v6;
  return v6;
}

__n128 cryptex_session_core_merge(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(const char **)(a1 + 96);
  if (!v3)
  {
    CFDataRef v13 = *(const char **)(a1 + 16);
    int v14 = *__error();
    int v15 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = "[anonymous]";
      if (v13) {
        int v16 = v13;
      }
      int v42 = 136446210;
      int v43 = v16;
      uint64_t v17 = "%{public}s: Invalid session core main - failed to merge.";
      goto LABEL_17;
    }
LABEL_18:
    *__error() = v14;
    return result;
  }
  uint64_t v5 = *(const char **)(a2 + 96);
  if (!v5)
  {
    int v18 = *(const char **)(a1 + 16);
    int v14 = *__error();
    int v15 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = "[anonymous]";
      if (v18) {
        int v19 = v18;
      }
      int v42 = 136446210;
      int v43 = v19;
      uint64_t v17 = "%{public}s: Invalid session core update - failed to merge.";
LABEL_17:
      _os_log_impl(&dword_21CBD9000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v42, 0xCu);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (!strcmp(v3, v5))
  {
    if (*(void *)(a1 + 48) != *(void *)(a2 + 48))
    {
      __int16 v20 = *(const char **)(a1 + 16);
      int v21 = *__error();
      __int16 v22 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = "[anonymous]";
        if (v20) {
          uint64_t v23 = v20;
        }
        unint64_t v24 = *(void *)(a1 + 48);
        if (v24 > 5) {
          uint64_t v25 = "UNK";
        }
        else {
          uint64_t v25 = off_264438E90[v24];
        }
        uint64_t v26 = *(void *)(a1 + 96);
        unint64_t v27 = *(void *)(a2 + 48);
        if (v27 > 5) {
          uint64_t v28 = "UNK";
        }
        else {
          uint64_t v28 = off_264438E90[v27];
        }
        int v42 = 136447234;
        int v43 = v23;
        __int16 v44 = 2048;
        uint64_t v45 = a1;
        __int16 v46 = 2080;
        uint64_t v47 = v26;
        __int16 v48 = 2080;
        *(void *)uint64_t v49 = v25;
        *(_WORD *)&v49[8] = 2080;
        __int16 v50 = v28;
        _os_log_impl(&dword_21CBD9000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s: (%p) Updating %s state: %s -> %s", (uint8_t *)&v42, 0x34u);
      }
      *__error() = v21;
    }
    if (*(_DWORD *)(a1 + 40) != *(_DWORD *)(a2 + 40))
    {
      int v29 = *(const char **)(a1 + 16);
      int v30 = *__error();
      long long v31 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *(void *)(a1 + 96);
        uint64_t v33 = "[anonymous]";
        int v34 = *(_DWORD *)(a1 + 40);
        if (v29) {
          uint64_t v33 = v29;
        }
        int v35 = *(_DWORD *)(a2 + 40);
        int v42 = 136447234;
        int v43 = v33;
        __int16 v44 = 2048;
        uint64_t v45 = a1;
        __int16 v46 = 2080;
        uint64_t v47 = v32;
        __int16 v48 = 1024;
        *(_DWORD *)uint64_t v49 = v34;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v35;
        _os_log_impl(&dword_21CBD9000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s: (%p) Updating %s uid: %d -> %d", (uint8_t *)&v42, 0x2Cu);
      }
      *__error() = v30;
    }
    if (!*(void *)(a1 + 112) && *(void *)(a2 + 112))
    {
      int v36 = *(const char **)(a1 + 16);
      int v37 = *__error();
      __int16 v38 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = "[anonymous]";
        if (v36) {
          v39 = v36;
        }
        uint64_t v40 = *(void *)(a1 + 96);
        uint64_t v41 = *(void *)(a2 + 112);
        int v42 = 136446978;
        int v43 = v39;
        __int16 v44 = 2048;
        uint64_t v45 = a1;
        __int16 v46 = 2080;
        uint64_t v47 = v40;
        __int16 v48 = 2080;
        *(void *)uint64_t v49 = v41;
        _os_log_impl(&dword_21CBD9000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s: (%p) Updating %s homedir: (null) -> %s", (uint8_t *)&v42, 0x2Au);
      }
      *__error() = v37;
      *(void *)(a1 + 112) = strdup(*(const char **)(a2 + 112));
    }
    *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
    __n128 result = *(__n128 *)(a2 + 48);
    *(__n128 *)(a1 + 48) = result;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
  }
  else
  {
    uint64_t v6 = *(const char **)(a1 + 16);
    int v7 = *__error();
    uint64_t v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = "[anonymous]";
      if (v6) {
        uint64_t v9 = v6;
      }
      uint64_t v10 = *(void *)(a2 + 96);
      uint64_t v11 = *(void *)(a1 + 96);
      int v42 = 136446722;
      int v43 = v9;
      __int16 v44 = 2080;
      uint64_t v45 = v10;
      __int16 v46 = 2080;
      uint64_t v47 = v11;
      _os_log_impl(&dword_21CBD9000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Trying to merge %s onto different session %s", (uint8_t *)&v42, 0x20u);
    }
    *__error() = v7;
  }
  return result;
}

uint64_t cryptex_session_core_get_state(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t cryptex_session_core_get_uid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t cryptex_session_core_get_overrides(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

char *cryptex_session_core_copy_name(uint64_t a1)
{
  return strdup(*(const char **)(a1 + 96));
}

char *cryptex_session_core_copy_homedir(uint64_t a1)
{
  __n128 result = *(char **)(a1 + 112);
  if (result) {
    return strdup(result);
  }
  return result;
}

uint64_t cryptex_session_core_get_attributes(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t cryptex_session_core_get_homedir_size(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t cryptex_session_core_set_uid(uint64_t result, int a2)
{
  *(_DWORD *)(result + 40) = a2;
  return result;
}

void cryptex_session_core_set_homedir(uint64_t a1, char *__s1)
{
  uint64_t v4 = *(void **)(a1 + 112);
  if (v4) {
    free(v4);
  }
  uint64_t v5 = strdup(__s1);
  *(void *)(a1 + 112) = v5;
  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 80), "CRYPTEX_SESSION");
  if (!value)
  {
    xpc_object_t value = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 80), "CRYPTEX_SESSION", value);
  }

  xpc_dictionary_set_string(value, "~/", v5);
}

xpc_object_t cryptex_session_core_set_endpoint(uint64_t a1, xpc_object_t object)
{
  xpc_object_t result = xpc_copy(object);
  *(void *)(a1 + 88) = result;
  return result;
}

void cryptex_session_core_append_to_array(uint64_t a1, char *string)
{
}

xpc_object_t cryptex_session_core_copy_xpc_object(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "state", *(void *)(a1 + 48));
  xpc_dictionary_set_int64(v2, "uid", *(unsigned int *)(a1 + 40));
  xpc_dictionary_set_int64(v2, "attributes", *(void *)(a1 + 56));
  xpc_dictionary_set_uint64(v2, "homesize", *(void *)(a1 + 64));
  xpc_dictionary_set_BOOL(v2, "simple_session", *(unsigned char *)(a1 + 120));
  uint64_t v3 = *(const char **)(a1 + 96);
  if (v3) {
    xpc_dictionary_set_string(v2, "name", v3);
  }
  uint64_t v4 = *(void **)(a1 + 72);
  if (v4) {
    xpc_dictionary_set_value(v2, "cryptex_array", v4);
  }
  uint64_t v5 = *(void **)(a1 + 80);
  if (v5) {
    xpc_dictionary_set_value(v2, "overrides", v5);
  }
  uint64_t v6 = *(const char **)(a1 + 104);
  if (v6) {
    xpc_dictionary_set_string(v2, "username", v6);
  }
  int v7 = *(const char **)(a1 + 112);
  if (v7) {
    xpc_dictionary_set_string(v2, "home_directory", v7);
  }
  if (*(void *)(a1 + 88) && MEMORY[0x21D4B8200]() == MEMORY[0x263EF8718]) {
    xpc_dictionary_set_value(v2, "endpoint", *(xpc_object_t *)(a1 + 88));
  }
  return v2;
}

uint64_t cryptex_session_core_create_from_xpc(void *a1)
{
  uint64_t v2 = _session_core_alloc();
  object_proto_init(v2 + 16, (int)"com.apple.security.libcryptex.core", "cryptex.session");
  *(void *)(v2 + 48) = xpc_dictionary_get_int64(a1, "state");
  *(_DWORD *)(v2 + 40) = xpc_dictionary_get_int64(a1, "uid");
  *(void *)(v2 + 56) = xpc_dictionary_get_int64(a1, "attributes");
  *(void *)(v2 + 64) = xpc_dictionary_get_uint64(a1, "homesize");
  xpc_object_t array = xpc_dictionary_get_array(a1, "cryptex_array");
  if (!array) {
    cryptex_session_core_create_from_xpc_cold_1();
  }
  uint64_t v4 = array;
  if (xpc_array_get_count(array)) {
    xpc_object_t empty = xpc_copy(v4);
  }
  else {
    xpc_object_t empty = xpc_array_create_empty();
  }
  *(void *)(v2 + 72) = empty;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "overrides");
  if (!dictionary) {
    cryptex_session_core_create_from_xpc_cold_2();
  }
  *(void *)(v2 + 80) = xpc_copy(dictionary);
  int string = xpc_dictionary_get_string(a1, "username");
  if (!string) {
    cryptex_session_core_create_from_xpc_cold_3();
  }
  *(void *)(v2 + 104) = strdup(string);
  uint64_t v8 = xpc_dictionary_get_string(a1, "name");
  if (!v8) {
    cryptex_session_core_create_from_xpc_cold_4();
  }
  *(void *)(v2 + 96) = strdup(v8);
  uint64_t v9 = xpc_dictionary_get_string(a1, "home_directory");
  if (!v9) {
    cryptex_session_core_create_from_xpc_cold_5();
  }
  *(void *)(v2 + 112) = strdup(v9);
  if (xpc_dictionary_get_BOOL(a1, "simple_session")) {
    *(unsigned char *)(v2 + 120) = 1;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, "endpoint");
  if (value)
  {
    uint64_t v11 = value;
    if (MEMORY[0x21D4B8200]() == MEMORY[0x263EF8718]) {
      *(void *)(v2 + 88) = xpc_copy(v11);
    }
  }
  return v2;
}

uint64_t _IOErrorGetErrno(uint64_t result)
{
  switch(result)
  {
    case 0xE00002BD:
    case 0xE00002BE:
    case 0xE00002C8:
    case 0xE00002DE:
      xpc_object_t result = 12;
      break;
    case 0xE00002BF:
      xpc_object_t result = 72;
      break;
    case 0xE00002C0:
    case 0xE00002D7:
    case 0xE00002D9:
    case 0xE00002DA:
      xpc_object_t result = 19;
      break;
    case 0xE00002C1:
      xpc_object_t result = 1;
      break;
    case 0xE00002C2:
      xpc_object_t result = 22;
      break;
    case 0xE00002C3:
    case 0xE00002C4:
    case 0xE00002C5:
    case 0xE00002CC:
      xpc_object_t result = 35;
      break;
    case 0xE00002C6:
      xpc_object_t result = 94;
      break;
    case 0xE00002C7:
      xpc_object_t result = 45;
      break;
    case 0xE00002C9:
    case 0xE00002CA:
    case 0xE00002D3:
    case 0xE00002D4:
      xpc_object_t result = 5;
      break;
    case 0xE00002CB:
    case 0xE00002DC:
    case 0xE00002DF:
    case 0xE00002E0:
    case 0xE00002E3:
    case 0xE00002E4:
    case 0xE00002E5:
    case 0xE00002E6:
    case 0xE00002E7:
    case 0xE00002E8:
    case 0xE00002EA:
      goto LABEL_10;
    case 0xE00002CD:
      xpc_object_t result = 9;
      break;
    case 0xE00002CE:
    case 0xE00002CF:
    case 0xE00002E2:
      xpc_object_t result = 13;
      break;
    case 0xE00002D0:
      xpc_object_t result = 14;
      break;
    case 0xE00002D1:
    case 0xE00002E9:
      xpc_object_t result = 83;
      break;
    case 0xE00002D2:
    case 0xE00002D5:
      xpc_object_t result = 16;
      break;
    case 0xE00002D6:
      xpc_object_t result = 60;
      break;
    case 0xE00002D8:
      xpc_object_t result = 6;
      break;
    case 0xE00002DB:
      xpc_object_t result = 28;
      break;
    case 0xE00002DD:
      xpc_object_t result = 17;
      break;
    case 0xE00002E1:
      xpc_object_t result = 7;
      break;
    case 0xE00002EB:
      xpc_object_t result = 89;
      break;
    default:
      if (result) {
LABEL_10:
      }
        xpc_object_t result = 104;
      break;
  }
  return result;
}

void _cryptex_base_dealloc(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

void cryptex_init(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a1 + 16) = a4;
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  *(void *)(a1 + 24) = dispatch_queue_create("com.apple.security.libcryptex.core.dq", initially_inactive);
  *(void *)(a1 + 32) = dispatch_queue_create("com.apple.security.libcryptex.core.targetdq", 0);
  *(void *)(a1 + 40) = a3;
  if (a3)
  {
    os_retain((void *)a1);
    dispatch_async_f(*(dispatch_queue_t *)(a1 + 24), (void *)a1, (dispatch_function_t)_cryptex_init);
  }
  if (a2)
  {
    uint64_t v8 = *(NSObject **)(a1 + 24);
    dispatch_set_target_queue(v8, a2);
  }
}

void _cryptex_init(void (**a1)(void))
{
  a1[5]();

  os_release(a1);
}

void cryptex_set_target_object(uint64_t a1, uint64_t a2)
{
}

void cryptex_set_target_queue(uint64_t a1, NSObject *a2)
{
}

void cryptex_activate(uint64_t a1)
{
}

void cryptex_async_f(uint64_t a1, void *a2, void (__cdecl *a3)(void *))
{
}

void cryptex_async(uint64_t a1, void *a2)
{
}

void cryptex_sync_f(uint64_t a1, void *a2, void (__cdecl *a3)(void *))
{
}

void cryptex_sync(uint64_t a1, void *a2)
{
}

void cryptex_assert_queue(uint64_t a1)
{
}

void cryptex_target_async_f(uint64_t a1, void *a2, void (__cdecl *a3)(void *))
{
}

void cryptex_target_async(uint64_t a1, void *a2)
{
}

uint64_t cryptex_set_error(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = a2;
  return result;
}

dispatch_queue_t cryptex_queue_create_with_target(const char *a1, NSObject *a2, uint64_t a3)
{
  return dispatch_queue_create_with_target_V2(a1, a2, *(dispatch_queue_t *)(a3 + 32));
}

uint64_t cryptex_get_error(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t _cpxd_cdxn_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, uint64_t a5)
{
  return _shared_cdxn_stamp(a1, a2, a3, a4, a5, (uint64_t)&_cxdn_tag);
}

uint64_t _cpxd_evaluate(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 48)) {
    return 0;
  }
  if (*(unsigned char *)(a2 + 53)) {
    return 0;
  }
  return 13;
}

uint64_t _cryptex_asset_generic_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, const char **a5)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  uint64_t v9 = *a5;
  int v10 = *__error();
  uint64_t v11 = a5[2];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v12 = "[anonymous]";
    if (v9) {
      unint64_t v12 = v9;
    }
    CFDataRef v13 = *(const void **)(*(void *)(a1 + 8) + 40);
    *(_DWORD *)buf = 136446466;
    uint64_t v33 = v12;
    __int16 v34 = 2080;
    CFTypeRef v35 = v13;
    _os_log_impl(&dword_21CBD9000, v11, OS_LOG_TYPE_DEBUG, "%{public}s: initializing %s asset", buf, 0x16u);
  }
  *__error() = v10;
  uint64_t v14 = _CFURLCreateFromFileDescriptor(*(unsigned int *)(a1 + 16), (CFURLRef *)&cf);
  int v15 = *a5;
  int v16 = *__error();
  uint64_t v17 = a5[2];
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = "[anonymous]";
      if (v15) {
        int v18 = v15;
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v33 = v18;
      __int16 v34 = 1024;
      LODWORD(v35) = v14;
      _os_log_impl(&dword_21CBD9000, v17, OS_LOG_TYPE_ERROR, "%{public}s: _CFURLCreateFromFileDescriptor: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v16;
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v19 = "[anonymous]";
      if (v15) {
        int v19 = v15;
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v33 = v19;
      __int16 v34 = 2112;
      CFTypeRef v35 = cf;
      _os_log_impl(&dword_21CBD9000, v17, OS_LOG_TYPE_DEBUG, "%{public}s: created url: %@", buf, 0x16u);
    }
    *__error() = v16;
    unsigned int ImagePropertiesWithDeviceMapZipped = AMAuthInstallApCreateImagePropertiesWithDeviceMapZipped();
    if (ImagePropertiesWithDeviceMapZipped) {
      _cryptex_asset_generic_stamp_cold_2(&v31, buf, ImagePropertiesWithDeviceMapZipped);
    }
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, 0);
    if (!MutableCopy) {
      _cryptex_asset_generic_stamp_cold_1(&v31, buf);
    }
    CFMutableDictionaryRef v22 = MutableCopy;
    uint64_t v23 = _cftag(*(void *)(a1 + 8));
    CFDictionarySetValue(a3, v23, v22);
    unint64_t v24 = *a5;
    int v25 = *__error();
    uint64_t v26 = a5[2];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v27 = "[anonymous]";
      if (v24) {
        unint64_t v27 = v24;
      }
      uint64_t v28 = *(const void **)(*(void *)(a1 + 8) + 40);
      *(_DWORD *)buf = 136446722;
      uint64_t v33 = v27;
      __int16 v34 = 2080;
      CFTypeRef v35 = v28;
      __int16 v36 = 2112;
      CFMutableDictionaryRef v37 = v22;
      _os_log_impl(&dword_21CBD9000, v26, OS_LOG_TYPE_DEBUG, "%{public}s: %s image = %@", buf, 0x20u);
    }
    *__error() = v25;
    if (a4) {
      *a4 = CFRetain(v22);
    }
    if (v23) {
      CFRelease(v23);
    }
    CFRelease(v22);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v14;
}

uint64_t _pdmg_cdxn_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, uint64_t a5)
{
  return _shared_cdxn_stamp(a1, a2, a3, a4, a5, (uint64_t)&_pdnm_tag);
}

uint64_t _cryptex1_asset_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, uint64_t a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v9 = ccsha384_di();
  *(_OWORD *)length = 0u;
  memset(v35, 0, sizeof(v35));
  uint64_t generic_digest = cryptex_asset_create_generic_digest(a1, v9, (uint64_t)length, (const char **)a5);
  if (generic_digest)
  {
    uint64_t MutableForCFTypes = generic_digest;
    unint64_t v12 = *(const char **)a5;
    int v13 = *__error();
    uint64_t v14 = *(NSObject **)(a5 + 16);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      *__error() = v13;
      return MutableForCFTypes;
    }
    int v15 = "[anonymous]";
    if (v12) {
      int v15 = v12;
    }
    int v28 = 136446466;
    int v29 = v15;
    __int16 v30 = 1024;
    LODWORD(v31) = MutableForCFTypes;
    int v16 = "%{public}s: Failed to compute digest.: %{darwin.errno}d";
LABEL_6:
    _os_log_impl(&dword_21CBD9000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 0x12u);
    goto LABEL_7;
  }
  CFDataRef v18 = CFDataCreate(0, (const UInt8 *)v35, length[1]);
  if (!v18)
  {
    uint64_t v26 = *(const char **)a5;
    int v13 = *__error();
    uint64_t v14 = *(NSObject **)(a5 + 16);
    uint64_t MutableForCFTypes = 12;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    unint64_t v27 = "[anonymous]";
    if (v26) {
      unint64_t v27 = v26;
    }
    int v28 = 136446466;
    int v29 = v27;
    __int16 v30 = 1024;
    LODWORD(v31) = 12;
    int v16 = "%{public}s: Failed to create data.: %{darwin.errno}d";
    goto LABEL_6;
  }
  CFDataRef v19 = v18;
  uint64_t MutableForCFTypes = (uint64_t)_CFDictionaryCreateMutableForCFTypes();
  CFDictionarySetValue((CFMutableDictionaryRef)MutableForCFTypes, (const void *)*MEMORY[0x263F8BFC8], v19);
  __int16 v20 = _cftag(*(void *)(a1 + 8));
  CFDictionarySetValue(a3, v20, (const void *)MutableForCFTypes);
  int v21 = *(const char **)a5;
  int v22 = *__error();
  uint64_t v23 = *(NSObject **)(a5 + 16);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v24 = "[anonymous]";
    if (v21) {
      unint64_t v24 = v21;
    }
    uint64_t v25 = *(void *)(*(void *)(a1 + 8) + 40);
    int v28 = 136446722;
    int v29 = v24;
    __int16 v30 = 2080;
    uint64_t v31 = v25;
    __int16 v32 = 2112;
    uint64_t v33 = MutableForCFTypes;
    _os_log_impl(&dword_21CBD9000, v23, OS_LOG_TYPE_DEBUG, "%{public}s: %s image = %@", (uint8_t *)&v28, 0x20u);
  }
  *__error() = v22;
  if (a4) {
    *a4 = CFRetain((CFTypeRef)MutableForCFTypes);
  }
  CFRelease(v19);
  if (v20) {
    CFRelease(v20);
  }
  if (MutableForCFTypes)
  {
    CFRelease((CFTypeRef)MutableForCFTypes);
    return 0;
  }
  return MutableForCFTypes;
}

void *cryptex_asset_new(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!v2) {
    cryptex_asset_new_cold_1(&v5, v6);
  }
  uint64_t v3 = v2;
  v2[1] = a1;
  *((_DWORD *)v2 + 4) = claimfd_np();
  return v3;
}

void *cryptex_asset_new_borrowed(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  xpc_object_t result = malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!result) {
    cryptex_asset_new_cold_1(&v5, v6);
  }
  *result |= 1uLL;
  result[1] = a1;
  *((_DWORD *)result + 4) = a2;
  return result;
}

void *cryptex_asset_copy(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  xpc_object_t result = malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!result) {
    cryptex_asset_new_cold_1(&v3, v4);
  }
  result[1] = *(void *)(a1 + 8);
  *((_DWORD *)result + 4) = -1;
  return result;
}

uint64_t cryptex_asset_evaluate(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t cryptex_asset_create_generic_digest(uint64_t a1, uint64_t a2, uint64_t a3, const char **a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  memset(&v27, 0, sizeof(v27));
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v25 - v8;
  bzero((char *)&v25 - v8, v10);
  if (*(void *)a2 >= 0x31uLL) {
    cryptex_asset_create_generic_digest_cold_1(&v26, buf);
  }
  if (fstat(*(_DWORD *)(a1 + 16), &v27))
  {
    uint64_t v11 = *__error();
    unint64_t v12 = *a4;
    int v13 = *__error();
    uint64_t v14 = a4[2];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      *__error() = v13;
      return v11;
    }
    int v15 = "[anonymous]";
    if (v12) {
      int v15 = v12;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 8) + 40);
    *(_DWORD *)buf = 136446722;
    int v29 = v15;
    __int16 v30 = 2080;
    uint64_t v31 = v16;
    __int16 v32 = 1024;
    int v33 = v11;
    uint64_t v17 = "%{public}s: failed to stat object: %s: %{darwin.errno}d";
LABEL_7:
    _os_log_impl(&dword_21CBD9000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x1Cu);
    goto LABEL_8;
  }
  size_t st_size = v27.st_size;
  if (v27.st_size < 0) {
    cryptex_asset_create_generic_digest_cold_2();
  }
  CFDataRef v19 = mmap(0, v27.st_size, 1, 1, *(_DWORD *)(a1 + 16), 0);
  if (v19 == (void *)-1)
  {
    uint64_t v11 = *__error();
    int v22 = *a4;
    int v13 = *__error();
    uint64_t v14 = a4[2];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    uint64_t v23 = "[anonymous]";
    if (v22) {
      uint64_t v23 = v22;
    }
    uint64_t v24 = *(void *)(*(void *)(a1 + 8) + 40);
    *(_DWORD *)buf = 136446722;
    int v29 = v23;
    __int16 v30 = 2080;
    uint64_t v31 = v24;
    __int16 v32 = 1024;
    int v33 = v11;
    uint64_t v17 = "%{public}s: failed to map asset into memory: %s: %{darwin.errno}d";
    goto LABEL_7;
  }
  __int16 v20 = v19;
  ccdigest_init();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, uint64_t))(a2 + 56))(a2, v9, a3 + 16);
  *(void *)(a3 + 8) = *(void *)a2;
  if (munmap(v20, st_size) == -1) {
    cryptex_asset_create_generic_digest_cold_3(&v26, buf);
  }
  return 0;
}

off_t cryptex_asset_len(off_t result, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  memset(&v11, 0, sizeof(v11));
  if (result)
  {
    off_t v2 = result;
    int v3 = *(_DWORD *)(result + 16);
    if (v3 < 0)
    {
      return 0;
    }
    else if (fstat(v3, &v11))
    {
      uint64_t v5 = *(const char **)a2;
      int v6 = *__error();
      uint64_t v7 = *(NSObject **)(a2 + 16);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        if (!v5) {
          uint64_t v5 = "[anonymous]";
        }
        uint64_t v8 = *(void *)(*(void *)(v2 + 8) + 40);
        int v9 = *__error();
        *(_DWORD *)buf = 136446722;
        int v13 = v5;
        __int16 v14 = 2080;
        uint64_t v15 = v8;
        __int16 v16 = 1024;
        int v17 = v9;
        _os_log_impl(&dword_21CBD9000, v7, OS_LOG_TYPE_ERROR, "%{public}s: fstat %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      size_t v10 = __error();
      xpc_object_t result = 0;
      int *v10 = v6;
    }
    else
    {
      return v11.st_size;
    }
  }
  return result;
}

void cryptex_asset_destroy(unsigned char *a1)
{
  if (a1)
  {
    if ((*a1 & 1) == 0) {
      close_drop_optional_np();
    }
    free(a1);
  }
}

void cryptex_asset_array_destroy(uint64_t a1)
{
  for (uint64_t i = 0; i != 96; i += 8)
    cryptex_asset_destroy(*(unsigned char **)(a1 + i));
}

BOOL cryptex_asset_type_is_cryptex1(void *a1)
{
  return a1 == &_cryptex_asset_type_gdmg
      || a1 == &_cryptex_asset_type_gtgv
      || a1 == &_cryptex_asset_type_gtcd
      || a1 == &_cryptex_asset_type_ginf;
}

void *_cftag(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CFStringRef v2 = CFStringCreateWithCString(0, *(const char **)(a1 + 40), 0x8000100u);
  if (!v2) {
    _cftag_cold_1(&v8, v9);
  }
  CFStringRef v3 = v2;
  EntryNameForType = (const void *)AMAuthInstallApImg4GetEntryNameForType();
  if (EntryNameForType && (uint64_t v5 = EntryNameForType, !CFEqual(EntryNameForType, v3)))
  {
    int v6 = (void *)CFRetain(v5);
  }
  else
  {
    int v6 = (void *)CFStringCreateWithCString(0, *(const char **)(a1 + 48), 0x8000100u);
    if (!v6) {
      _cftag_cold_1(&v8, v9);
    }
  }
  CFRelease(v3);
  return v6;
}

uint64_t _shared_cdxn_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  uint64_t v10 = _cryptex_asset_generic_stamp(a1, a2, a3, &cf, (const char **)a5);
  if (!v10)
  {
    stat v11 = _cftag(a6);
    unint64_t v12 = *(char **)(a1 + 24);
    if (v12) {
      _CFDictionarySetString((__CFDictionary *)cf, v11, v12);
    }
    int v13 = *(const char **)a5;
    int v14 = *__error();
    uint64_t v15 = *(NSObject **)(a5 + 16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      __int16 v16 = "[anonymous]";
      if (v13) {
        __int16 v16 = v13;
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 8) + 40);
      *(_DWORD *)buf = 136446722;
      int v21 = v16;
      __int16 v22 = 2080;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      CFTypeRef v25 = cf;
      _os_log_impl(&dword_21CBD9000, v15, OS_LOG_TYPE_DEBUG, "%{public}s: %s image = %@", buf, 0x20u);
    }
    *__error() = v14;
    if (a4) {
      *a4 = CFRetain(cf);
    }
    if (v11) {
      CFRelease(v11);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return v10;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_3_0()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return _os_crash_msg();
}

uint64_t _cryptex_base_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_base_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_core_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_core_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_core_cx1_properties_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_core_cx1_properties_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_host_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_host_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_magister_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_magister_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_signature_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_signature_alloc_cold_1();
  }
  return result;
}

uint64_t _cryptex_scrivener_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _cryptex_scrivener_alloc_cold_1();
  }
  return result;
}

uint64_t _session_core_alloc()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    _session_core_alloc_cold_1();
  }
  return result;
}

uint64_t cryptex_core_parse_hdiid(char *a1, char **a2)
{
  __stringp = a1;
  CFStringRef v3 = strsep(&__stringp, ",");
  if (!v3) {
    return 22;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  do
  {
    int v6 = a2 + 1;
    switch(v5)
    {
      case 0:
        if (strcmp(v4, "cryptex")) {
          return 22;
        }
        break;
      case 1:
        goto LABEL_8;
      case 2:
        int v6 = a2 + 2;
        goto LABEL_8;
      case 3:
        size_t v7 = strlen(v4);
        int v6 = a2 + 3;
        if (v7 != 96) {
          return 22;
        }
LABEL_8:
        void *v6 = v4;
        break;
      default:
        break;
    }
    ++v5;
    uint64_t v4 = strsep(&__stringp, ",");
  }
  while (v4);
  if (v5 == 4) {
    return 0;
  }
  else {
    return 22;
  }
}

char *cryptex_core_unparse_hdiid(const char **a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  CFStringRef v2 = 0;
  if (asprintf(&v2, "%s,%s,%s,%s", *a1, a1[1], a1[2], a1[3]) < 0) {
    cryptex_core_unparse_hdiid_cold_1(&v3, v4);
  }
  return v2;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_2_1(void *a1, _OWORD *a2)
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

uint64_t _img4_get_nonce_domain_from_index(unint64_t a1)
{
  if (a1 > 0xA || a1 - 1 > 9) {
    return 0;
  }
  else {
    return qword_264438FD8[a1 - 1];
  }
}

void sub_21CBE04C0(_Unwind_Exception *a1)
{
}

void sub_21CBE0844(_Unwind_Exception *a1)
{
}

void sub_21CBE0E8C(_Unwind_Exception *a1)
{
}

void sub_21CBE1968(_Unwind_Exception *a1)
{
}

uint64_t cryptex_tss_create(uint64_t a1)
{
  CFStringRef v2 = [CryptexTSS alloc];

  return (uint64_t)[(CryptexTSS *)v2 initWithFlags:a1];
}

void cryptex_tss_set_url(void *a1, uint64_t a2)
{
  uint64_t v3 = NSString;
  id v4 = a1;
  id v5 = [v3 stringWithUTF8String:a2];
  [v4 setURL:v5];
}

void cryptex_tss_set_BOOL(void *a1, const char *a2, BOOL a3)
{
  [a1 tss_request];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v5, a2, a3);
}

void cryptex_tss_set_u32(void *a1, const char *a2, unsigned int a3)
{
  [a1 tss_request];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_int64(v5, a2, a3);
}

void cryptex_tss_set_u64(void *a1, const char *a2, int64_t a3)
{
  [a1 tss_request];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_int64(v5, a2, a3);
}

void cryptex_tss_set_dgst(void *a1, const char *a2, const void *a3, size_t a4)
{
  [a1 tss_request];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_data(v7, a2, a3, a4);
}

void cryptex_tss_set_data(void *a1, const char *a2, const void *a3, size_t a4)
{
  [a1 tss_request];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_data(v7, a2, a3, a4);
}

void cryptex_tss_set_string(void *a1, const char *a2, const char *a3)
{
  [a1 tss_request];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v5, a2, a3);
}

void cryptex_tss_set_object_BOOL(void *a1, const char *a2, const char *a3, BOOL a4)
{
  [a1 tss_request];
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  id v7 = xpc_dictionary_get_dictionary(xdict, a2);
  if (!v7)
  {
    id v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(xdict, a2, v7);
  }
  xpc_dictionary_set_BOOL(v7, a3, a4);
}

void cryptex_tss_set_object_dgst(void *a1, const char *a2, const char *a3, const void *a4, size_t a5)
{
  [a1 tss_request];
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  int v9 = xpc_dictionary_get_dictionary(xdict, a2);
  if (!v9)
  {
    int v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(xdict, a2, v9);
  }
  xpc_dictionary_set_data(v9, a3, a4, a5);
}

void cryptex_tss_set_c411_from_file(void *a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  if (_read_file(a2, v6)) {
    cryptex_tss_set_c411_from_file_cold_1(&v5, v8);
  }
  id v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v6[0]];
  [v3 setInfoData:v4];
  buff_destroy(v6);
}

uint64_t cryptex_tss_set_im4m_array(void *a1, const char *a2)
{
  return [a1 setManifestArray:a2];
}

void cryptex_tss_submit(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  int v6 = [v5 dq];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cryptex_tss_submit_block_invoke;
  block[3] = &unk_264439058;
  id v9 = v5;
  uint64_t v10 = a3;
  uint64_t v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __cryptex_tss_submit_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) tssSubmit];
  CFStringRef v2 = *(void **)(a1 + 32);
  id v3 = *(void (**)(void *, id, void *, void))(a1 + 40);
  [v2 tssp_sign];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [*(id *)(a1 + 32) nserr];
  v3(v2, v5, v4, *(void *)(a1 + 48));
}

void cryptex_tss_async(void *a1, void *a2, void (__cdecl *a3)(void *))
{
  id v5 = [a1 dq];
  dispatch_async_f(v5, a2, a3);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

char **cryptex_version_new(const char *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  memset(v11, 0, sizeof(v11));
  id v9 = (char *)v11;
  CFStringRef v2 = (char **)malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!v2) {
    cryptex_version_new_cold_1(&v10, v12);
  }
  id v3 = v2;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      id v4 = strdup(a1);
      if (v4) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    id v4 = strdup(a1);
    if (!v4) {
      cryptex_version_new_cold_2(a1, &v10, v12);
    }
  }
  void *v3 = v4;
  __strlcpy_chk();
  for (uint64_t i = 8; i != 28; i += 4)
  {
    *(void *)&v12[0] = 0;
    int v6 = strsep(&v9, ".");
    if (!v6) {
      break;
    }
    int v7 = _strtou32(v6, (char **)v12, 10);
    if (*(void *)&v12[0] && **(unsigned char **)&v12[0]) {
      int v7 = 0;
    }
    *(_DWORD *)((char *)v3 + i) = v7;
  }
  return v3;
}

uint64_t cryptex_version_compare(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v3 = 8;
  while (1)
  {
    unsigned int v4 = *(_DWORD *)(v2 + v3);
    unsigned int v5 = *(_DWORD *)(a2 + v3);
    BOOL v6 = v4 == v5;
    BOOL v7 = v4 > v5;
    unsigned int v8 = v4 < v5 ? -1 : result;
    double result = v7 ? 1 : v8;
    if (!v6) {
      break;
    }
    v3 += 4;
    if (v3 == 28) {
      return 0;
    }
  }
  return result;
}

void cryptex_version_destroy(void ***a1)
{
  uint64_t v2 = *a1;
  if (*a1) {
    free(*v2);
  }
  free(v2);
  *a1 = 0;
}

uint64_t cryptex_system_cryptex_lookup_by_name(char *__s)
{
  uint64_t v1 = _cryptex_system_cryptex_lookup((uint64_t)&cryptex_system_cryptexes_by_name, __s);
  if (v1) {
    return v1 - 152;
  }
  else {
    return 0;
  }
}

uint64_t _cryptex_system_cryptex_lookup(uint64_t a1, char *__s)
{
  if (_cryptex_system_cryptex_lookup_init_onceToken != -1) {
    dispatch_once(&_cryptex_system_cryptex_lookup_init_onceToken, &__block_literal_global);
  }

  return hash_lookup_cstr(a1, __s);
}

uint64_t cryptex_system_cryptex_lookup_by_graftpath(char *__s)
{
  uint64_t v1 = _cryptex_system_cryptex_lookup((uint64_t)&cryptex_system_cryptexes_by_graftpath, __s);
  if (v1) {
    return v1 - 184;
  }
  else {
    return 0;
  }
}

uint64_t cryptex_system_cryptex_copy_launchjob_tag_for_name(char *__s)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t result = _cryptex_system_cryptex_lookup((uint64_t)&cryptex_system_cryptexes_by_name, __s);
  if (result)
  {
    uint64_t v2 = *(const char **)(result - 144);
    if (_dispatch_is_multithreaded())
    {
      while (1)
      {
        uint64_t result = (uint64_t)strdup(v2);
        if (result) {
          break;
        }
        __os_temporary_resource_shortage();
      }
    }
    else
    {
      uint64_t result = (uint64_t)strdup(v2);
      if (!result) {
        cryptex_version_new_cold_2(v2, &v3, v4);
      }
    }
  }
  return result;
}

char *cryptex_system_cryptex_copy_graft_abspath(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  if (asprintf(&v2, "%s/%s", *(const char **)(a1 + 120), *(const char **)(a1 + 128)) < 0) {
    cryptex_core_unparse_hdiid_cold_1(&v3, v4);
  }
  return v2;
}

uint64_t ___cryptex_system_cryptex_lookup_init_block_invoke()
{
  hash_init(cryptex_system_cryptexes_by_name);
  hash_init(cryptex_system_cryptexes_by_graftpath);
  uint64_t v0 = cryptex_system_cryptexes;
  uint64_t v1 = cryptex_system_cryptexes + 152;
  uint64_t v2 = cryptex_system_cryptexes + 184;
  hash_node_init_cstr((uint64_t)(cryptex_system_cryptexes + 152), *(char **)cryptex_system_cryptexes);
  hash_insert((uint64_t)cryptex_system_cryptexes_by_name, (uint64_t)v1);
  uint64_t v3 = cryptex_system_cryptex_copy_graft_abspath((uint64_t)v0);
  hash_node_init_cstr((uint64_t)v2, v3);
  hash_insert((uint64_t)cryptex_system_cryptexes_by_graftpath, (uint64_t)v2);
  unsigned int v4 = off_267CA5AF0;
  uint64_t v5 = off_267CA5AF0 + 184;
  hash_node_init_cstr((uint64_t)(off_267CA5AF0 + 152), *(char **)off_267CA5AF0);
  hash_insert((uint64_t)cryptex_system_cryptexes_by_name, (uint64_t)(v4 + 152));
  BOOL v6 = cryptex_system_cryptex_copy_graft_abspath((uint64_t)v4);
  hash_node_init_cstr((uint64_t)v5, v6);

  return hash_insert((uint64_t)cryptex_system_cryptexes_by_graftpath, (uint64_t)v5);
}

void _cryptex_host_dealloc(uint64_t a1)
{
}

uint64_t cryptex_host_create(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _cryptex_host_alloc();
  uint64_t v5 = v4;
  *(void *)(v4 + 40) = a2;
  if (!a1) {
    goto LABEL_4;
  }
  *(_OWORD *)(v4 + 48) = *(_OWORD *)a1;
  long long v6 = *(_OWORD *)(a1 + 16);
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v4 + 96) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v4 + 112) = v8;
  *(_OWORD *)(v4 + 64) = v6;
  *(_OWORD *)(v4 + 80) = v7;
  long long v9 = *(_OWORD *)(a1 + 80);
  long long v10 = *(_OWORD *)(a1 + 96);
  long long v11 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v4 + 160) = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v4 + 176) = v11;
  *(_OWORD *)(v4 + 128) = v9;
  *(_OWORD *)(v4 + 144) = v10;
  *(void *)(v4 + 192) = v4 + 48;
  if (*(void *)(a1 + 8))
  {
    img4_chip_init_from_buff();
    uint64_t v12 = img4_chip_custom();
  }
  else
  {
LABEL_4:
    if ((a2 & 3) == 3)
    {
      uint64_t v12 = MEMORY[0x263F8C4D0];
    }
    else
    {
      if ((a2 & 2) != 0) {
        uint64_t v12 = MEMORY[0x263F8C4C8];
      }
      else {
        uint64_t v12 = MEMORY[0x263F8C4C0];
      }
      if ((a2 & 3) == 0) {
        uint64_t v12 = img4_chip_select_personalized_ap();
      }
    }
  }
  *(void *)(v5 + 1160) = v12;
  return v5;
}

uint64_t signature_metadata_read_from_file(int a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  uint64_t v5 = 0;
  char v6 = 1;
  do
  {
    char v7 = v6;
    memset(value, 0, sizeof(value));
    long long v8 = _cs_metadata_keys[v5];
    if ((fgetxattr(a1, v8, value, 0x100uLL, 0, 2) & 0x8000000000000000) == 0) {
      *__error() = 0;
    }
    int v9 = *__error();
    if (v9)
    {
      if (v9 == 93)
      {
        int v11 = *__error();
        if (sig_metadata_log_onceToken != -1) {
          dispatch_once(&sig_metadata_log_onceToken, &__block_literal_global_0);
        }
        uint64_t v12 = sig_metadata_log_logHandle;
        if (os_log_type_enabled((os_log_t)sig_metadata_log_logHandle, OS_LOG_TYPE_DEBUG))
        {
          int v16 = 136315138;
          uint64_t v17 = v8;
          _os_log_impl(&dword_21CBD9000, v12, OS_LOG_TYPE_DEBUG, "No xattr '%s'.", (uint8_t *)&v16, 0xCu);
        }
        *__error() = v11;
        uint64_t v10 = 0;
        if (a2) {
          *a2 = 0;
        }
      }
      else
      {
        uint64_t v10 = *__error();
        int v13 = *__error();
        if (sig_metadata_log_onceToken != -1) {
          dispatch_once(&sig_metadata_log_onceToken, &__block_literal_global_0);
        }
        int v14 = sig_metadata_log_logHandle;
        if (os_log_type_enabled((os_log_t)sig_metadata_log_logHandle, OS_LOG_TYPE_ERROR))
        {
          int v16 = 136315394;
          uint64_t v17 = v8;
          __int16 v18 = 1024;
          int v19 = v10;
          _os_log_impl(&dword_21CBD9000, v14, OS_LOG_TYPE_ERROR, "Failed to read xattr '%s'.: %{darwin.errno}d", (uint8_t *)&v16, 0x12u);
        }
        *__error() = v13;
      }
      goto LABEL_20;
    }
    xpc_dictionary_set_string(v4, v8, (const char *)value);
    char v6 = 0;
    uint64_t v5 = 1;
  }
  while ((v7 & 1) != 0);
  uint64_t v10 = 0;
  if (a2)
  {
    *a2 = v4;
    return v10;
  }
LABEL_20:
  if (v4) {
    os_release(v4);
  }
  return v10;
}

uint64_t signature_metadata_read_from_cryptex(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v14 = 0;
  uint64_t v15 = 0;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
  {
    int v10 = *__error();
    if (sig_metadata_log_onceToken != -1) {
      dispatch_once(&sig_metadata_log_onceToken, &__block_literal_global_0);
    }
    int v11 = sig_metadata_log_logHandle;
    if (os_log_type_enabled((os_log_t)sig_metadata_log_logHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = 12;
      _os_log_impl(&dword_21CBD9000, v11, OS_LOG_TYPE_ERROR, "Failed to create dictionary.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v10;
    uint64_t v7 = 12;
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  uint64_t v6 = cryptex_core_parse_info_asset(a1, (char **)&v15, (char ***)&v14, 0);
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = *__error();
    if (sig_metadata_log_onceToken != -1) {
      dispatch_once(&sig_metadata_log_onceToken, &__block_literal_global_0);
    }
    int v9 = sig_metadata_log_logHandle;
    if (os_log_type_enabled((os_log_t)sig_metadata_log_logHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = v7;
      _os_log_impl(&dword_21CBD9000, v9, OS_LOG_TYPE_ERROR, "Failed to extract cryptex identifier and version.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v8;
    goto LABEL_8;
  }
  uint64_t v12 = *v14;
  xpc_dictionary_set_string(v5, "com.apple.CryptexIdentifier", (const char *)v15);
  xpc_dictionary_set_string(v5, "com.apple.CryptexVersion", v12);
  uint64_t v7 = 0;
  if (a2)
  {
    *a2 = v5;
LABEL_16:
    cryptex_version_destroy((void ***)&v14);
    goto LABEL_17;
  }
LABEL_8:
  cryptex_version_destroy((void ***)&v14);
  os_release(v5);
LABEL_17:
  free(v15);
  return v7;
}

os_log_t __sig_metadata_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libcryptex", "signature_metadata");
  sig_metadata_log_logHandle = (uint64_t)result;
  return result;
}

void _cryptex_magister_dealloc(uint64_t a1)
{
  os_release(*(void **)(a1 + 88));
  uint64_t v2 = *(void **)(a1 + 96);
  if (v2) {
    os_release(v2);
  }
  uint64_t v3 = *(void **)(a1 + 104);
  if (v3) {
    os_release(v3);
  }

  object_proto_destroy(a1 + 56);
}

uint64_t cryptex_magister_create(void *a1, uint64_t a2)
{
  uint64_t v4 = _cryptex_magister_alloc();
  *(void *)(v4 + 80) = a2;
  *(void *)(v4 + 88) = os_retain(a1);
  uint64_t v5 = (void *)a1[20];
  if (v5) {
    *(void *)(v4 + 96) = os_retain(v5);
  }
  uint64_t v6 = (void *)a1[21];
  if (v6) {
    *(void *)(v4 + 104) = os_retain(v6);
  }
  *(_WORD *)(v4 + 120) = 0;
  *(_DWORD *)(v4 + 172) = 48;
  object_proto_init(v4 + 56, (int)"com.apple.security.libcryptex.core", "magister");
  cryptex_init(v4, 0, (uint64_t)_cryptex_magister_init, 0);
  return v4;
}

void _cryptex_magister_init(void *a1)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v52 = 0;
  memset(v51, 0, sizeof(v51));
  uint64_t v49 = 0;
  object = 0;
  uint64_t v48 = MEMORY[0x263F8C4D8];
  uint64_t v2 = a1[13];
  if (v2 && (*(unsigned char *)(v2 + 40) & 1) != 0)
  {
    uint64_t v3 = (const char *)a1[7];
    int v4 = *__error();
    uint64_t v5 = a1[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = "[anonymous]";
      if (v3) {
        uint64_t v6 = v3;
      }
      *(_DWORD *)buf = 136446210;
      long long v63 = v6;
      _os_log_impl(&dword_21CBD9000, v5, OS_LOG_TYPE_DEBUG, "%{public}s: checking for supplemental fallback", buf, 0xCu);
    }
    *__error() = v4;
    uint64_t v8 = a1[11];
    uint64_t v7 = a1[12];
    uint64_t v10 = *(void *)(v7 + 56);
    uint64_t v9 = *(void *)(v7 + 64);
    uint64_t v53 = 0;
    uint64_t v54 = v10;
    uint64_t v55 = v9;
    uint64_t v56 = 0;
    if ((*(unsigned char *)(v8 + 40) & 1) == 0)
    {
      bzero(buf, 0x600uLL);
      img4_firmware_init_from_buff();
      img4_firmware_init_sentinel();
      img4_firmware_attach_manifest();
      uint64_t v59 = *(void *)(a1[13] + 1160);
      uint64_t v60 = img4_chip_select_personalized_ap();
      uint64_t v61 = MEMORY[0x263F8C4C8];
      uint64_t v11 = img4_firmware_select_chip();
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)(a1[13] + 1160);
        int v14 = (const char *)a1[7];
        int v15 = *__error();
        int v16 = a1[9];
        if (v12 == v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v23 = "[anonymous]";
            if (v14) {
              uint64_t v23 = v14;
            }
            *(_DWORD *)long long v57 = 136446210;
            uint64_t v58 = v23;
            _os_log_impl(&dword_21CBD9000, v16, OS_LOG_TYPE_DEBUG, "%{public}s: validated supplemental environment", v57, 0xCu);
          }
          *__error() = v15;
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = "[anonymous]";
            if (v14) {
              int v17 = v14;
            }
            *(_DWORD *)long long v57 = 136446210;
            uint64_t v58 = v17;
            _os_log_impl(&dword_21CBD9000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: falling back from supplemental", v57, 0xCu);
          }
          *__error() = v15;
          uint64_t v18 = a1[13];
          *(void *)(v18 + 1160) = v12;
          *(void *)(v18 + 40) &= ~1uLL;
        }
      }
      else
      {
        int v19 = (const char *)a1[7];
        int v20 = *__error();
        uint64_t v21 = a1[9];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          __int16 v22 = "[anonymous]";
          if (v19) {
            __int16 v22 = v19;
          }
          *(_DWORD *)long long v57 = 136446210;
          uint64_t v58 = v22;
          _os_log_impl(&dword_21CBD9000, v21, OS_LOG_TYPE_ERROR, "%{public}s: unable to detect chip environment, proceeding anyway", v57, 0xCu);
        }
        *__error() = v20;
      }
    }
  }
  a1[14] = _cryptex_magister_select_chip((uint64_t)a1);
  int nonce_domain = cryptex_core_get_nonce_domain((void *)a1[11], &v48);
  if (nonce_domain)
  {
    int v25 = nonce_domain;
    uint64_t v26 = (const char *)a1[7];
    int v27 = *__error();
    int v28 = a1[9];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = "[anonymous]";
      if (v26) {
        int v29 = v26;
      }
      *(_DWORD *)buf = 136446466;
      long long v63 = v29;
      __int16 v64 = 1024;
      LODWORD(v65) = v25;
      __int16 v30 = "%{public}s: failed to get nonce domain from core: %{darwin.errno}d";
LABEL_44:
      _os_log_impl(&dword_21CBD9000, v28, OS_LOG_TYPE_ERROR, v30, buf, 0x12u);
      goto LABEL_45;
    }
    goto LABEL_45;
  }
  int v25 = cryptex_core_copy_nonce_domain_desc((void *)a1[11], (char **)&v49);
  uint64_t v31 = (const char *)a1[7];
  int v27 = *__error();
  int v28 = a1[9];
  if (v25)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = "[anonymous]";
      if (v31) {
        __int16 v32 = v31;
      }
      *(_DWORD *)buf = 136446466;
      long long v63 = v32;
      __int16 v64 = 1024;
      LODWORD(v65) = v25;
      __int16 v30 = "%{public}s: failed to get nonce domain description from core: %{darwin.errno}d";
      goto LABEL_44;
    }
LABEL_45:
    *__error() = v27;
    goto LABEL_46;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = "[anonymous]";
    if (v31) {
      int v33 = v31;
    }
    *(_DWORD *)buf = 136446466;
    long long v63 = v33;
    __int16 v64 = 2082;
    long long v65 = v49;
    _os_log_impl(&dword_21CBD9000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s: authenticating using nonce from %{public}s", buf, 0x16u);
  }
  *__error() = v27;
  int v34 = img4_nonce_domain_copy_nonce();
  if (v34)
  {
    int v25 = v34;
    CFTypeRef v35 = (const char *)a1[7];
    int v27 = *__error();
    int v28 = a1[9];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = "[anonymous]";
      if (v35) {
        uint64_t v36 = v35;
      }
      *(_DWORD *)buf = 136446466;
      long long v63 = v36;
      __int16 v64 = 1024;
      LODWORD(v65) = v25;
      __int16 v30 = "%{public}s: copying cryptex nonce failed: %{darwin.errno}d";
      goto LABEL_44;
    }
    goto LABEL_45;
  }
  if (a1[12])
  {
    int v25 = 0;
  }
  else
  {
    uint64_t asset = cryptex_core_get_asset(a1[11], (uint64_t)&_cryptex_asset_type_im4m);
    if (!asset) {
      _cryptex_magister_init_cold_1();
    }
    uint64_t v38 = asset;
    int file = _read_file(*(_DWORD *)(asset + 16), v51);
    if (file)
    {
      int v25 = file;
      uint64_t v40 = (const char *)a1[7];
      int v27 = *__error();
      int v28 = a1[9];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      uint64_t v41 = "[anonymous]";
      if (v40) {
        uint64_t v41 = v40;
      }
      *(_DWORD *)buf = 136446466;
      long long v63 = v41;
      __int16 v64 = 1024;
      LODWORD(v65) = v25;
      __int16 v30 = "%{public}s: read im4m: %{darwin.errno}d";
      goto LABEL_44;
    }
    int v42 = signature_metadata_read_from_file(*(_DWORD *)(v38 + 16), &object);
    if (v42)
    {
      int v43 = v42;
      __int16 v44 = (const char *)a1[7];
      int v45 = *__error();
      __int16 v46 = a1[9];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        uint64_t v47 = "[anonymous]";
        if (v44) {
          uint64_t v47 = v44;
        }
        *(_DWORD *)buf = 136446466;
        long long v63 = v47;
        __int16 v64 = 1024;
        LODWORD(v65) = v43;
        _os_log_impl(&dword_21CBD9000, v46, OS_LOG_TYPE_ERROR, "%{public}s: Failed to load metadata for Image4 manifest.: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v45;
    }
    int v25 = 0;
    a1[12] = cryptex_signature_create(v51, 0, object);
  }
LABEL_46:
  cryptex_set_error((uint64_t)a1, v25);
  buff_destroy(v51);
  free(v49);
  if (object) {
    os_release(object);
  }
}

void cryptex_magister_authenticate(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = ctx_new(a1, 0x80uLL);
  v8[3] = cryptex_core_get_asset(a1[11], a2);
  v8[14] = a3;
  v8[15] = a4;

  cryptex_async_f((uint64_t)a1, v8, (void (__cdecl *)(void *))_cryptex_magister_authenticate_continue);
}

void _cryptex_magister_authenticate_continue(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[3];
  uint64_t v4 = _cryptex_magister_select_chip(*a1);
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))_cryptex_magister_authenticate_toutoc;
  if ((**(void **)(v3 + 8) & 8) == 0) {
    uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))_cryptex_magister_authenticate;
  }
  uint64_t v6 = v5(v2, v4, v3, a1);
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    if (*(void *)(v2 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("_cryptex_magister_authenticate_continue", "magister.c", 378, "com.apple.security.cryptex", 12, v7, v8);
    free(v8);
    a1[2] = (uint64_t)Error;
    cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_magister_authenticate_callback);
    CFRelease(v7);
  }
  else
  {
    a1[2] = 0;
    cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_magister_authenticate_callback);
  }
}

void cryptex_magister_record_property(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = ctx_new(a1, 0x88uLL);
  v8[3] = a2;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 5) = 0u;
  *((unsigned char *)v8 + 96) = 0;
  v8[13] = 0;
  v8[14] = 0;
  v8[15] = a3;
  v8[16] = a4;

  cryptex_async_f((uint64_t)a1, v8, (void (__cdecl *)(void *))_cryptex_magister_record_property_continue);
}

void _cryptex_magister_record_property_continue(uint64_t *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = a1[3];
  uint64_t v4 = *(void *)(*a1 + 96);
  uint64_t v5 = *(const char **)(*a1 + 56);
  int v6 = *__error();
  uint64_t v7 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = "[anonymous]";
    uint64_t v9 = *(const char **)(v4 + 64);
    if (v5) {
      uint64_t v8 = v5;
    }
    *(_DWORD *)buf = 136446466;
    int v29 = v8;
    __int16 v30 = 2048;
    uint64_t v31 = v9;
    _os_log_impl(&dword_21CBD9000, v7, OS_LOG_TYPE_INFO, "%{public}s: im4m buff len: %zu", buf, 0x16u);
  }
  *__error() = v6;
  BOOL is_cryptex1 = cryptex_core_is_cryptex1(*(void **)(v2 + 88));
  uint64_t v11 = *(void *)(v2 + 104);
  if (!v11 || (*(unsigned char *)(v11 + 40) & 1) == 0)
  {
    if (cryptex_core_is_cryptex1(*(void **)(v2 + 88)))
    {
      uint64_t v12 = 3;
LABEL_19:
      int v15 = *(const char **)(v2 + 56);
      int v16 = *__error();
      int v17 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = "[anonymous]";
        if (v15) {
          uint64_t v18 = v15;
        }
        *(_DWORD *)buf = 136446722;
        int v29 = v18;
        if (is_cryptex1) {
          int v19 = "CRYPTEX1";
        }
        else {
          int v19 = "AP";
        }
        __int16 v30 = 2082;
        uint64_t v31 = v19;
        __int16 v32 = 2048;
        uint64_t v33 = v12;
        _os_log_impl(&dword_21CBD9000, v17, OS_LOG_TYPE_INFO, "%{public}s: Authenticating with coprocessor %{public}s and handle %llu", buf, 0x20u);
      }
      *__error() = v16;
      goto LABEL_27;
    }
    uint64_t v13 = *(void *)(v2 + 88);
    int v14 = *(void **)(v13 + 176);
    if (v14 == &_cryptex_asset_type_cpxd)
    {
      uint64_t v12 = 5;
      goto LABEL_19;
    }
    if (v14 == &_cryptex_asset_type_pdmg)
    {
      if (*(void *)(v13 + 56) == 2) {
        uint64_t v12 = 9;
      }
      else {
        uint64_t v12 = 4;
      }
      goto LABEL_19;
    }
LABEL_15:
    uint64_t v12 = 4;
    goto LABEL_19;
  }
  if (cryptex_core_is_cryptex1(*(void **)(v2 + 88))) {
    goto LABEL_15;
  }
  if (*(_UNKNOWN **)(*(void *)(v2 + 88) + 176) != &_cryptex_asset_type_cpxd)
  {
    uint64_t v12 = 7;
    goto LABEL_19;
  }
  if (*(void *)(v2 + 72))
  {
    os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    int v25 = *(const char **)(v2 + 56);
    if (!v25) {
      int v25 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446210;
    int v29 = v25;
  }
  else
  {
    uint64_t v26 = *(const char **)(v2 + 56);
    if (!v26) {
      uint64_t v26 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446210;
    int v29 = v26;
  }
  int v27 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef Error = createError("_cryptex_magister_select_image4_coproc_and_handle", "magister.c", 455, "com.apple.security.cryptex", 10, 0, v27);
  free(v27);
  if (Error)
  {
    image4_environment_destroy();
LABEL_42:
    a1[2] = (uint64_t)CFRetain(Error);
    cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_magister_record_property_callback);
    CFRelease(Error);
    return;
  }
LABEL_27:
  image4_environment_new();
  image4_trust_new();
  int v20 = *(_DWORD *)(v3 + 32);
  switch(v20)
  {
    case 2:
      image4_trust_record_property_integer();
      uint64_t v21 = 8;
      goto LABEL_32;
    case 1:
      image4_trust_record_property_data();
      goto LABEL_34;
    case 0:
      image4_trust_record_property_BOOL();
      uint64_t v21 = 1;
LABEL_32:
      a1[14] = v21;
LABEL_34:
      image4_trust_evaluate();
      image4_environment_destroy();
      return;
  }
  if (*(void *)(v2 + 72))
  {
    os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    __int16 v22 = *(const char **)(v2 + 56);
    if (!v22) {
      __int16 v22 = "[anonymous]";
    }
  }
  else
  {
    __int16 v22 = *(const char **)(v2 + 56);
    if (!v22) {
      __int16 v22 = "[anonymous]";
    }
  }
  *(_DWORD *)buf = 136446466;
  int v29 = v22;
  __int16 v30 = 1024;
  LODWORD(v31) = v20;
  uint64_t v23 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef Error = createError("_cryptex_magister_record_property_continue", "magister.c", 548, "com.apple.security.cryptex", 11, 0, v23);
  free(v23);
  image4_environment_destroy();
  if (Error) {
    goto LABEL_42;
  }
}

uint64_t _cryptex_magister_select_chip(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 104);
  if (v1) {
    return *(void *)(v1 + 1160);
  }
  if (cryptex_core_is_cryptex1(*(void **)(a1 + 88))) {
    return MEMORY[0x263F8C4C8];
  }

  return img4_chip_select_personalized_ap();
}

uint64_t _cryptex_magister_authenticate_toutoc(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = a1[12];
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v21 = 0;
  uint64_t v22 = v9;
  uint64_t v23 = v8;
  uint64_t v24 = 0;
  v19[3] = a4;
  uint64_t v20 = 0;
  v19[1] = 1;
  v19[2] = _cryptex_magister_firmware_execute_toutoc;
  uint64_t v10 = (const char *)a1[7];
  int v11 = *__error();
  uint64_t v12 = a1[9];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = "[anonymous]";
    if (v10) {
      uint64_t v13 = v10;
    }
    uint64_t v14 = *(void *)(*(void *)(a3 + 8) + 40);
    int v15 = *(_DWORD *)(a3 + 16);
    *(_DWORD *)buf = 136446722;
    uint64_t v26 = v13;
    __int16 v27 = 2082;
    uint64_t v28 = v14;
    __int16 v29 = 1024;
    int v30 = v15;
    _os_log_impl(&dword_21CBD9000, v12, OS_LOG_TYPE_DEBUG, "%{public}s: authenticating asset [toutoc]: 4cc = %{public}s, fd = %d", buf, 0x1Cu);
  }
  *__error() = v11;
  off_t v16 = lseek(*(_DWORD *)(a3 + 16), 0, 1);
  *(void *)(a4 + 104) = v16;
  if (v16 == -1) {
    _cryptex_magister_authenticate_toutoc_cold_1(v19, buf);
  }
  *(_DWORD *)buf = dup_np();
  if (*(unsigned char *)(a1[11] + 40))
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v20 = img4_firmware_new_from_fd_4MSM();
    img4_firmware_attach_manifest();
    img4_firmware_execute();
    uint64_t v17 = *(void *)(a4 + 16);
  }
  img4_firmware_destroy();
  return v17;
}

CFErrorRef _cryptex_magister_authenticate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)(v5 + 56);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v30 = 0;
  uint64_t v31 = v7;
  uint64_t v32 = v6;
  uint64_t v33 = 0;
  uint64_t v29 = 0;
  memset(v28, 0, sizeof(v28));
  if (!v6)
  {
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      int v19 = *(const char **)(a1 + 56);
      if (!v19) {
        int v19 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      CFTypeRef v35 = v19;
    }
    else
    {
      uint64_t v26 = *(const char **)(a1 + 56);
      if (!v26) {
        uint64_t v26 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      CFTypeRef v35 = v26;
    }
    uint64_t v22 = (char *)_os_log_send_and_compose_impl();
    uint64_t v24 = "com.apple.security.cryptex";
    int v25 = 184;
    CFIndex v23 = 12;
    goto LABEL_25;
  }
  uint64_t v10 = *(const char **)(a1 + 56);
  int v11 = *__error();
  uint64_t v12 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = "[anonymous]";
    if (v10) {
      uint64_t v13 = v10;
    }
    uint64_t v14 = *(void *)(*(void *)(a3 + 8) + 40);
    int v15 = *(_DWORD *)(a3 + 16);
    *(_DWORD *)buf = 136446722;
    CFTypeRef v35 = v13;
    __int16 v36 = 2082;
    uint64_t v37 = v14;
    __int16 v38 = 1024;
    int v39 = v15;
    _os_log_impl(&dword_21CBD9000, v12, OS_LOG_TYPE_DEBUG, "%{public}s: authenticating asset: 4cc = %{public}s, fd = %d", buf, 0x1Cu);
  }
  *__error() = v11;
  int file = _read_file(*(_DWORD *)(a3 + 16), v28);
  if (file)
  {
    int v17 = file;
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v18 = *(const char **)(a1 + 56);
      if (!v18) {
        uint64_t v18 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      CFTypeRef v35 = v18;
      __int16 v36 = 1024;
      LODWORD(v37) = v17;
    }
    else
    {
      uint64_t v21 = *(const char **)(a1 + 56);
      if (!v21) {
        uint64_t v21 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      CFTypeRef v35 = v21;
      __int16 v36 = 1024;
      LODWORD(v37) = file;
    }
    uint64_t v22 = (char *)_os_log_send_and_compose_impl();
    CFIndex v23 = v17;
    uint64_t v24 = "com.apple.security.cryptex.posix";
    int v25 = 194;
LABEL_25:
    CFErrorRef Error = createError("_cryptex_magister_authenticate", "magister.c", v25, v24, v23, 0, v22);
    free(v22);
    goto LABEL_26;
  }
  *(void *)(a4 + 32) = v28;
  if (*(unsigned char *)(*(void *)(a1 + 88) + 40))
  {
    CFErrorRef Error = 0;
  }
  else
  {
    img4_firmware_new();
    img4_firmware_attach_manifest();
    img4_firmware_execute();
    CFErrorRef Error = *(CFErrorRef *)(a4 + 16);
  }
LABEL_26:
  buff_destroy(v28);
  img4_firmware_destroy();
  return Error;
}

void _cryptex_magister_authenticate_callback(void **a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[12];
  ((void (*)(void *, void, void *, void *, void *))a1[15])(*a1, *((void *)a1[3] + 1), a1[12], a1[2], a1[14]);
  buff_destroy(v3);
  ctx_destroy(a1);
  if (v2)
  {
    CFRelease(v2);
  }
}

void _cryptex_magister_firmware_execute_toutoc(int a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a2) {
    _cryptex_magister_firmware_execute_toutoc_cold_2();
  }
  uint64_t v5 = a4[3];
  off_t v6 = a4[13];
  uint64_t v7 = *a4;
  CFErrorRef v8 = _cryptex_magister_firmware_execute_cferr(a3, *(os_log_t *)(*a4 + 72));
  if (v8)
  {
    CFErrorRef v9 = v8;
    if (*(void *)(v7 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v7 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v10 = *(const char **)(v7 + 56);
      if (!v10) {
        uint64_t v10 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v21 = v10;
    }
    else
    {
      off_t v16 = *(const char **)(v7 + 56);
      if (!v16) {
        off_t v16 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v21 = v16;
    }
    int v17 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("_cryptex_magister_firmware_execute_toutoc", "magister.c", 246, "com.apple.security.cryptex", 12, v9, v17);
    free(v17);
    a4[2] = Error;
    CFRelease(v9);
  }
  else
  {
    int v11 = *(const char **)(v7 + 56);
    int v12 = *__error();
    uint64_t v13 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = "[anonymous]";
      if (v11) {
        uint64_t v14 = v11;
      }
      uint64_t v15 = *(void *)(*(void *)(v5 + 8) + 40);
      *(_DWORD *)buf = 136446466;
      uint64_t v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = v15;
      _os_log_impl(&dword_21CBD9000, v13, OS_LOG_TYPE_DEBUG, "%{public}s: executing image: %{public}s", buf, 0x16u);
    }
    *__error() = v12;
    if (lseek(*(_DWORD *)(v5 + 16), v6, 0) == -1) {
      _cryptex_magister_firmware_execute_toutoc_cold_1(&v19, buf);
    }
    a4[2] = 0;
  }
}

CFErrorRef _cryptex_magister_firmware_execute_cferr(int a1, os_log_t oslog)
{
  if (a1 > 69)
  {
    if (a1 <= 79)
    {
      if (a1 == 70)
      {
        if (oslog) {
          os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
        }
        uint64_t v4 = (char *)_os_log_send_and_compose_impl();
        int v5 = 78;
        CFIndex v6 = 70;
        goto LABEL_41;
      }
      if (a1 == 79)
      {
        if (oslog) {
          os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
        }
        uint64_t v4 = (char *)_os_log_send_and_compose_impl();
        int v5 = 88;
        CFIndex v6 = 79;
        goto LABEL_41;
      }
    }
    else
    {
      switch(a1)
      {
        case 'P':
          if (oslog) {
            os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
          }
          uint64_t v4 = (char *)_os_log_send_and_compose_impl();
          int v5 = 95;
          CFIndex v6 = 80;
          goto LABEL_41;
        case 'R':
          if (oslog) {
            os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
          }
          uint64_t v4 = (char *)_os_log_send_and_compose_impl();
          int v5 = 81;
          CFIndex v6 = 82;
          goto LABEL_41;
        case '\\':
          if (oslog) {
            os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
          }
          uint64_t v4 = (char *)_os_log_send_and_compose_impl();
          int v5 = 84;
          CFIndex v6 = 92;
LABEL_41:
          CFErrorRef Error = createError("_cryptex_magister_firmware_execute_cferr", "magister.c", v5, "com.apple.security.cryptex.posix", v6, 0, v4);
          free(v4);
          return Error;
      }
    }
LABEL_30:
    if (oslog) {
      os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    CFIndex v6 = a1;
    int v5 = 107;
    goto LABEL_41;
  }
  if (a1 > 7)
  {
    if (a1 == 8)
    {
      if (oslog) {
        os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
      }
      uint64_t v4 = (char *)_os_log_send_and_compose_impl();
      int v5 = 104;
      CFIndex v6 = 8;
      goto LABEL_41;
    }
    if (a1 == 13)
    {
      if (oslog) {
        os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
      }
      uint64_t v4 = (char *)_os_log_send_and_compose_impl();
      int v5 = 99;
      CFIndex v6 = 13;
      goto LABEL_41;
    }
    goto LABEL_30;
  }
  if (a1)
  {
    if (a1 == 2)
    {
      if (oslog) {
        os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
      }
      uint64_t v4 = (char *)_os_log_send_and_compose_impl();
      int v5 = 92;
      CFIndex v6 = 2;
      goto LABEL_41;
    }
    goto LABEL_30;
  }
  return 0;
}

void _cryptex_magister_firmware_execute(int a1, int a2, int a3, uint64_t *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a4;
  uint64_t v7 = a4[3];
  CFIndex v6 = (__n128 *)a4[4];
  CFErrorRef v8 = _cryptex_magister_firmware_execute_cferr(a3, *(os_log_t *)(*a4 + 72));
  if (v8)
  {
    CFErrorRef v9 = v8;
    if (*(void *)(v5 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v10 = *(const char **)(v5 + 56);
      if (!v10) {
        uint64_t v10 = "[anonymous]";
      }
      LODWORD(buf[0]) = 136446210;
      *(void *)((char *)buf + 4) = v10;
    }
    else
    {
      uint64_t v19 = *(const char **)(v5 + 56);
      if (!v19) {
        uint64_t v19 = "[anonymous]";
      }
      LODWORD(buf[0]) = 136446210;
      *(void *)((char *)buf + 4) = v19;
    }
    uint64_t v20 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("_cryptex_magister_firmware_execute", "magister.c", 131, "com.apple.security.cryptex", 12, v9, v20);
    free(v20);
    a4[2] = (uint64_t)Error;
    CFRelease(v9);
  }
  else
  {
    uint64_t bytes = img4_image_get_bytes();
    int v12 = *(const char **)(v5 + 56);
    int v13 = *__error();
    uint64_t v14 = *(NSObject **)(v5 + 72);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = "[anonymous]";
      if (v12) {
        uint64_t v15 = v12;
      }
      uint64_t v16 = *(void *)(*(void *)(v7 + 8) + 40);
      LODWORD(buf[0]) = 136446466;
      *(void *)((char *)buf + 4) = v15;
      WORD6(buf[0]) = 2082;
      *(void *)((char *)buf + 14) = v16;
      _os_log_impl(&dword_21CBD9000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: executing image: %{public}s", (uint8_t *)buf, 0x16u);
    }
    *__error() = v13;
    uint64_t v17 = *(void *)(bytes + 8) - v6->n128_u64[0];
    if (v17 < 0 || (unint64_t v18 = *(void *)(bytes + 16), v18 > v6->n128_u64[1]))
    {
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }
    else
    {
      buff_xfer_subrange((__n128 *)(a4 + 5), v6, v17, v18);
      a4[12] = (uint64_t)(a4 + 5);
      a4[2] = 0;
    }
  }
}

void _cryptex_magister_record_property_continue2(uint64_t a1, uint64_t a2, uint64_t a3, int a4, __n128 *a5)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)__dst = 0u;
  uint64_t v6 = a5->n128_u64[0];
  if (a4)
  {
    if (*(void *)(v6 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 72), OS_LOG_TYPE_ERROR);
      CFErrorRef v8 = *(const char **)(v6 + 56);
      if (!v8) {
        CFErrorRef v8 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v38 = v8;
      __int16 v39 = 1024;
      LODWORD(v40) = a4;
    }
    else
    {
      int v13 = *(const char **)(v6 + 56);
      if (!v13) {
        int v13 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v38 = v13;
      __int16 v39 = 1024;
      LODWORD(v40) = a4;
    }
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    CFIndex v15 = a4;
    uint64_t v16 = "com.apple.security.cryptex.posix";
    int v17 = 403;
  }
  else
  {
    unint64_t v9 = a5[1].n128_u64[1];
    size_t v10 = *(void *)(v9 + 24);
    if (_dispatch_is_multithreaded())
    {
      int v11 = malloc_type_calloc(1uLL, v10, 0x1B044E25uLL);
      if (!v11)
      {
        do
        {
          __os_temporary_resource_shortage();
          int v12 = malloc_type_calloc(1uLL, v10, 0x1B044E25uLL);
        }
        while (!v12);
        int v11 = v12;
      }
    }
    else
    {
      int v11 = malloc_type_calloc(1uLL, v10, 0x61D5536CuLL);
      if (!v11) {
        _cryptex_magister_record_property_continue2_cold_1(&v36, buf);
      }
    }
    buff_init(__dst, 0, (uint64_t)_buff_destructor_free, (uint64_t)v11, *(void *)(v9 + 24));
    unint64_t v18 = a5[7].n128_u64[0];
    uint64_t v19 = *(void *)(v9 + 24);
    if (v18 == v19)
    {
      unint64_t v20 = a5[6].n128_u64[1];
      uint64_t v21 = *(const char **)(v6 + 56);
      int v22 = *__error();
      uint64_t v23 = *(NSObject **)(v6 + 72);
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v18 && v20)
      {
        if (v24)
        {
          int v25 = "[anonymous]";
          unint64_t v26 = *(void *)(v9 + 8);
          if (v21) {
            int v25 = v21;
          }
          *(_DWORD *)buf = 136446466;
          __int16 v38 = v25;
          __int16 v39 = 2082;
          unint64_t v40 = v26;
          _os_log_impl(&dword_21CBD9000, v23, OS_LOG_TYPE_INFO, "%{public}s: Successfully read property '%{public}s' from im4m", buf, 0x16u);
        }
        *__error() = v22;
        memcpy(__dst[0], (const void *)a5[6].n128_u64[1], a5[7].n128_u64[0]);
        buff_xfer(a5 + 2, (__n128 *)__dst);
      }
      else
      {
        if (v24)
        {
          uint64_t v28 = "[anonymous]";
          unint64_t v29 = *(void *)(v9 + 8);
          if (v21) {
            uint64_t v28 = v21;
          }
          *(_DWORD *)buf = 136446466;
          __int16 v38 = v28;
          __int16 v39 = 2082;
          unint64_t v40 = v29;
          _os_log_impl(&dword_21CBD9000, v23, OS_LOG_TYPE_INFO, "%{public}s: Property '%{public}s' not found in im4m", buf, 0x16u);
        }
        *__error() = v22;
      }
      buff_destroy(__dst);
      goto LABEL_39;
    }
    if (*(void *)(v6 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 72), OS_LOG_TYPE_ERROR);
      __int16 v27 = *(const char **)(v6 + 56);
      *(_DWORD *)buf = 136446722;
      if (!v27) {
        __int16 v27 = "[anonymous]";
      }
      __int16 v38 = v27;
      __int16 v39 = 2048;
      unint64_t v40 = v18;
      __int16 v41 = 2048;
      uint64_t v42 = v19;
    }
    else
    {
      uint64_t v30 = "[anonymous]";
      if (*(void *)(v6 + 56)) {
        uint64_t v30 = *(const char **)(v6 + 56);
      }
      *(_DWORD *)buf = 136446722;
      __int16 v38 = v30;
      __int16 v39 = 2048;
      unint64_t v40 = v18;
      __int16 v41 = 2048;
      uint64_t v42 = v19;
    }
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    uint64_t v16 = "com.apple.security.cryptex";
    int v17 = 411;
    CFIndex v15 = 24;
  }
  CFErrorRef Error = createError("_cryptex_magister_record_property_continue2", "magister.c", v17, v16, v15, 0, v14);
  free(v14);
  buff_destroy(__dst);
  if (Error)
  {
    a5[1].n128_u64[0] = (unint64_t)CFRetain(Error);
    cryptex_target_async_f(v6, a5, (void (__cdecl *)(void *))_cryptex_magister_record_property_callback);
    CFRelease(Error);
    return;
  }
LABEL_39:
  a5[1].n128_u64[0] = 0;
  cryptex_target_async_f(v6, a5, (void (__cdecl *)(void *))_cryptex_magister_record_property_callback);
}

void _cryptex_magister_record_property_callback(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(const void **)(a1 + 16);
  if (*(void *)(a1 + 32)) {
    uint64_t v4 = a1 + 32;
  }
  else {
    uint64_t v4 = 0;
  }
  (*(void (**)(void *, uint64_t, void, void))(a1 + 128))(v2, v4, *(void *)(a1 + 16), *(void *)(a1 + 120));
  buff_destroy((void *)(a1 + 32));
  ctx_destroy((void **)a1);
  if (v3)
  {
    CFRelease(v3);
  }
}

void _cryptex_signature_dealloc(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 264);
  if (v2) {
    os_release(v2);
  }
  buff_destroy((void *)(a1 + 56));

  object_proto_destroy(a1 + 16);
}

uint64_t cryptex_signature_seal()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = os_log_create("com.apple.libcryptex", "signature");
  long long v9 = xmmword_21CBF0D90;
  long long v10 = xmmword_21CBF0D80;
  uint64_t v1 = aks_sealed_hashes_set();
  if (v1 != -28)
  {
    uint64_t v2 = v1;
    if (v1)
    {
      if (v1 == -31) {
        cryptex_signature_seal_cold_1();
      }
      int v3 = *__error();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      {
        int v7 = 67109120;
        int v8 = v2;
        _os_log_impl(&dword_21CBD9000, v0, OS_LOG_TYPE_ERROR, "aks_sealed_hashes_set: %#x", (uint8_t *)&v7, 8u);
      }
      *__error() = v3;
      _IOErrorGetErrno(v2);
    }
  }
  uint64_t Errno = aks_seal_cryptex_manifest_lock();
  if (Errno)
  {
    int v5 = *__error();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      int v7 = 67109120;
      int v8 = Errno;
      _os_log_impl(&dword_21CBD9000, v0, OS_LOG_TYPE_ERROR, "aks_seal_cryptex_manifest_lock: %#x", (uint8_t *)&v7, 8u);
    }
    *__error() = v5;
    uint64_t Errno = _IOErrorGetErrno(Errno);
  }
  if (v0) {
    os_release(v0);
  }
  return Errno;
}

uint64_t cryptex_signature_create(__n128 *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = _cryptex_signature_alloc();
  *(void *)(v6 + 40) = a2;
  if (a3) {
    xpc_object_t v7 = xpc_retain(a3);
  }
  else {
    xpc_object_t v7 = 0;
  }
  *(void *)(v6 + 264) = v7;
  buff_xfer((__n128 *)(v6 + 56), a1);
  if (*(uint64_t (**)(void *, size_t))(v6 + 96) == _buff_destructor_munmap) {
    cryptex_signature_create_cold_1();
  }
  *(void *)(v6 + 48) = ccsha384_di();
  _cryptex_signature_compute_hash(v6);
  object_proto_init(v6 + 16, (int)"com.apple.security.libcryptex.core", "signature");
  return v6;
}

int *_cryptex_signature_compute_hash(uint64_t a1)
{
  *(void *)&v21[37] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 48);
  MEMORY[0x270FA5388]();
  bzero((char *)&v16 - v3, v4);
  if (*v2 >= 0x31uLL) {
    _cryptex_signature_compute_hash_cold_1(&v17, buf);
  }
  ccdigest_init();
  ccdigest_update();
  (*(void (**)(void))(*(void *)(a1 + 48) + 56))();
  int v5 = *(const char **)(a1 + 16);
  int v6 = *__error();
  xpc_object_t v7 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      int v8 = v5;
    }
    else {
      int v8 = "[anonymous]";
    }
    uint64_t v9 = **(void **)(a1 + 48);
    *(_DWORD *)buf = 136446722;
    uint64_t v19 = v8;
    __int16 v20 = 1040;
    *(_DWORD *)uint64_t v21 = v9;
    v21[2] = 2096;
    *(void *)&v21[3] = a1 + 112;
    _os_log_impl(&dword_21CBD9000, v7, OS_LOG_TYPE_DEBUG, "%{public}s: computed manifest hash: %.*P", buf, 0x1Cu);
  }
  *__error() = v6;
  uint64_t v10 = a1 + 160;
  _sprintdgst(a1 + 160, (unsigned __int8 *)(a1 + 112), **(void **)(a1 + 48));
  uint64_t v11 = *(const char **)(a1 + 16);
  int v12 = *__error();
  int v13 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if (v11) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v19 = v14;
    __int16 v20 = 2080;
    *(void *)uint64_t v21 = v10;
    _os_log_impl(&dword_21CBD9000, v13, OS_LOG_TYPE_DEBUG, "%{public}s: manifest hash cstring: %s", buf, 0x16u);
  }
  os_log_t result = __error();
  int *result = v12;
  return result;
}

uint64_t cryptex_signature_write(void *a1, int __fd)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v4 = _write_file(__fd, (uint64_t)(a1 + 7));
  if (v4)
  {
    int v5 = (const char *)a1[2];
    int v6 = *__error();
    xpc_object_t v7 = a1[4];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = "[anonymous]";
      if (v5) {
        int v8 = v5;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      uint64_t v9 = "%{public}s: Failed to write signature to file.: %{darwin.errno}d";
LABEL_26:
      _os_log_impl(&dword_21CBD9000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  uint64_t v25 = 0;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x2000000000;
  int v28 = 0;
  uint64_t v10 = (void *)a1[33];
  if (v10)
  {
    xpc_object_t v11 = xpc_retain(v10);
    if (MEMORY[0x21D4B8200](v11) == MEMORY[0x263EF8708])
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 0x40000000;
      *(void *)&buf[16] = __cryptex_signature_write_metadata_to_file_block_invoke;
      uint64_t v30 = &unk_264439250;
      uint64_t v31 = &v25;
      uint64_t v32 = a1;
      int v33 = __fd;
      xpc_dictionary_apply(v11, buf);
    }
    else
    {
      *((_DWORD *)v26 + 6) = 22;
      int v12 = (const char *)a1[2];
      int v13 = *__error();
      uint64_t v14 = a1[4];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        CFIndex v15 = "[anonymous]";
        if (v12) {
          CFIndex v15 = v12;
        }
        int v16 = *((_DWORD *)v26 + 6);
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v16;
        _os_log_impl(&dword_21CBD9000, v14, OS_LOG_TYPE_ERROR, "%{public}s: Signature has invalid metadata.: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v13;
    }
    int v21 = *((_DWORD *)v26 + 6);
    if (v11) {
      os_release(v11);
    }
  }
  else
  {
    uint64_t v17 = (const char *)a1[2];
    int v18 = *__error();
    uint64_t v19 = a1[4];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      __int16 v20 = "[anonymous]";
      if (v17) {
        __int16 v20 = v17;
      }
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_21CBD9000, v19, OS_LOG_TYPE_DEBUG, "%{public}s: Signature has no metadata.", buf, 0xCu);
    }
    *__error() = v18;
    int v21 = *((_DWORD *)v26 + 6);
  }
  _Block_object_dispose(&v25, 8);
  if (v21)
  {
    int v22 = (const char *)a1[2];
    int v6 = *__error();
    xpc_object_t v7 = a1[4];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = "[anonymous]";
      if (v22) {
        uint64_t v23 = v22;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = v21;
      uint64_t v9 = "%{public}s: Failed to write xattr metadata.: %{darwin.errno}d";
      goto LABEL_26;
    }
LABEL_27:
    *__error() = v6;
  }
  return v4;
}

CFTypeRef cryptex_signature_lock(uint64_t a1, int a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v35 = xmmword_21CBF0D80;
  uint64_t v4 = aks_sealed_hashes_set();
  if (v4 == -31)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      int v13 = *(const char **)(a1 + 16);
      if (!v13) {
        int v13 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v30 = v13;
    }
    else
    {
      uint64_t v17 = *(const char **)(a1 + 16);
      if (!v17) {
        uint64_t v17 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v30 = v17;
    }
    int v18 = (char *)_os_log_send_and_compose_impl();
    uint64_t v19 = "com.apple.security.cryptex";
    int v20 = 318;
    goto LABEL_33;
  }
  uint64_t v5 = v4;
  if (v4 == -28)
  {
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      uint64_t v14 = *(const char **)(a1 + 16);
      if (!v14) {
        uint64_t v14 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v30 = v14;
    }
    else
    {
      int v21 = *(const char **)(a1 + 16);
      if (!v21) {
        int v21 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v30 = v21;
    }
    int v18 = (char *)_os_log_send_and_compose_impl();
    uint64_t v19 = "com.apple.security.cryptex";
    int v20 = 313;
LABEL_33:
    CFIndex v22 = 36;
LABEL_39:
    CFErrorRef Error = createError("cryptex_signature_lock", "signature.c", v20, v19, v22, 0, v18);
    xpc_object_t v11 = 0;
    goto LABEL_40;
  }
  if (v4)
  {
    int Errno = _IOErrorGetErrno(v4);
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      if (*(void *)(a1 + 16)) {
        int v16 = *(const char **)(a1 + 16);
      }
      else {
        int v16 = "[anonymous]";
      }
    }
    else if (*(void *)(a1 + 16))
    {
      int v16 = *(const char **)(a1 + 16);
    }
    else
    {
      int v16 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v30 = v16;
    __int16 v31 = 1024;
    int v32 = v5;
    __int16 v33 = 1024;
    int v34 = _IOErrorGetErrno(v5);
    int v18 = (char *)_os_log_send_and_compose_impl();
    CFIndex v22 = Errno;
    uint64_t v19 = "com.apple.security.cryptex.posix";
    int v20 = 322;
    goto LABEL_39;
  }
  int v6 = *(const char **)(a1 + 16);
  int v7 = *__error();
  int v8 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = "[anonymous]";
    if (v6) {
      uint64_t v9 = v6;
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v30 = v9;
    _os_log_impl(&dword_21CBD9000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: successfully set cryptex sealed hash.", buf, 0xCu);
  }
  *__error() = v7;
  long long v27 = xmmword_21CBF0D90;
  long long v28 = xmmword_21CBF0D80;
  CFTypeRef v10 = cryptex_signature_secureconfig_add_entry((uint64_t)&v28, a1, a2, (uint64_t)&v27);
  if (!v10) {
    return 0;
  }
  xpc_object_t v11 = v10;
  if (*(void *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    int v12 = *(const char **)(a1 + 16);
    if (!v12) {
      int v12 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v30 = v12;
  }
  else
  {
    unint64_t v26 = *(const char **)(a1 + 16);
    if (!v26) {
      unint64_t v26 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v30 = v26;
  }
  int v18 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef Error = createError("cryptex_signature_lock", "signature.c", 334, "com.apple.security.cryptex", 36, v11, v18);
LABEL_40:
  free(v18);
  if (!Error)
  {
    CFTypeRef v23 = 0;
    if (!v11) {
      return v23;
    }
    goto LABEL_42;
  }
  CFTypeRef v23 = CFRetain(Error);
  CFRelease(Error);
  if (v11) {
LABEL_42:
  }
    CFRelease(v11);
  return v23;
}

CFTypeRef cryptex_signature_secureconfig_add_entry(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v49 = 0;
  memset(v48, 0, sizeof(v48));
  int v7 = *(const char **)(a2 + 16);
  int v8 = *__error();
  uint64_t v9 = *(NSObject **)(a2 + 32);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    CFTypeRef v10 = "[anonymous]";
    if (v7) {
      CFTypeRef v10 = v7;
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v51 = v10;
    _os_log_impl(&dword_21CBD9000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: Preparing to add entry to secure config.", buf, 0xCu);
  }
  *__error() = v8;
  if (!MEMORY[0x263F16C58])
  {
    xpc_object_t v11 = *(const char **)(a2 + 16);
    int v12 = *__error();
    int v13 = *(NSObject **)(a2 + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = "[anonymous]";
      if (v11) {
        uint64_t v14 = v11;
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v51 = v14;
      _os_log_impl(&dword_21CBD9000, v13, OS_LOG_TYPE_INFO, "%{public}s: SecureConfigDB not available", buf, 0xCu);
    }
    default_database = 0;
LABEL_11:
    slot_with_saltdata = 0;
    uint64_t v17 = 0;
    *__error() = v12;
LABEL_12:
    buff_destroy(v48);
    CFErrorRef Error = 0;
    goto LABEL_13;
  }
  default_database = (void *)secure_config_get_default_database();
  if (!default_database)
  {
    if (*(void *)(a2 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
      CFTypeRef v23 = *(const char **)(a2 + 16);
      if (!v23) {
        CFTypeRef v23 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v51 = v23;
    }
    else
    {
      long long v27 = *(const char **)(a2 + 16);
      if (!v27) {
        long long v27 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v51 = v27;
    }
    long long v28 = (char *)_os_log_send_and_compose_impl();
    int v29 = 235;
    goto LABEL_68;
  }
  if (MEMORY[0x263F16C50])
  {
    slot_with_saltdata = (void *)secure_config_database_create_slot_with_saltdata();
    if (!slot_with_saltdata)
    {
      if (*(void *)(a2 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
        CFIndex v22 = *(const char **)(a2 + 16);
        if (!v22) {
          CFIndex v22 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v51 = v22;
      }
      else
      {
        __int16 v41 = *(const char **)(a2 + 16);
        if (!v41) {
          __int16 v41 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v51 = v41;
      }
      long long v28 = (char *)_os_log_send_and_compose_impl();
      int v29 = 245;
LABEL_68:
      CFErrorRef Error = createError("cryptex_signature_secureconfig_add_entry", "signature.c", v29, "com.apple.security.cryptex", 36, 0, v28);
      slot_with_saltdata = 0;
LABEL_69:
      uint64_t v17 = 0;
      goto LABEL_87;
    }
  }
  else
  {
    if (a4)
    {
      BOOL v24 = *(const char **)(a2 + 16);
      int v12 = *__error();
      uint64_t v25 = *(NSObject **)(a2 + 32);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        unint64_t v26 = "[anonymous]";
        if (v24) {
          unint64_t v26 = v24;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v51 = v26;
        _os_log_impl(&dword_21CBD9000, v25, OS_LOG_TYPE_ERROR, "%{public}s: Unable to create SecureConfigDB slot with salt", buf, 0xCu);
      }
      goto LABEL_11;
    }
    slot_with_saltdata = (void *)secure_config_database_create_slot();
  }
  uint64_t v30 = secure_config_entry_create_with_buffer();
  if (!v30)
  {
    if (*(void *)(a2 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
      int v34 = *(const char **)(a2 + 16);
      if (!v34) {
        int v34 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v51 = v34;
    }
    else
    {
      uint64_t v42 = *(const char **)(a2 + 16);
      if (!v42) {
        uint64_t v42 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446210;
      uint64_t v51 = v42;
    }
    long long v28 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef Error = createError("cryptex_signature_secureconfig_add_entry", "signature.c", 260, "com.apple.security.cryptex", 36, 0, v28);
    goto LABEL_69;
  }
  uint64_t v17 = (void *)v30;
  if (a3 < 0) {
    goto LABEL_59;
  }
  int file = _read_file(a3, v48);
  if (!file)
  {
    int v35 = secure_config_entry_set_metadata();
    if (v35)
    {
      int v36 = v35;
      if (*(void *)(a2 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
        uint64_t v37 = *(const char **)(a2 + 16);
        if (!v37) {
          uint64_t v37 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446466;
        uint64_t v51 = v37;
        __int16 v52 = 1024;
        int v53 = v36;
      }
      else
      {
        uint64_t v47 = *(const char **)(a2 + 16);
        if (!v47) {
          uint64_t v47 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446466;
        uint64_t v51 = v47;
        __int16 v52 = 1024;
        int v53 = v35;
      }
      long long v28 = (char *)_os_log_send_and_compose_impl();
      CFIndex v44 = v36;
      int v45 = 277;
      goto LABEL_86;
    }
LABEL_59:
    int appended = secure_config_slot_append_entry();
    if (!appended) {
      goto LABEL_12;
    }
    int v39 = appended;
    if (*(void *)(a2 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
      unint64_t v40 = *(const char **)(a2 + 16);
      if (!v40) {
        unint64_t v40 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v51 = v40;
      __int16 v52 = 1024;
      int v53 = v39;
    }
    else
    {
      __int16 v46 = *(const char **)(a2 + 16);
      if (!v46) {
        __int16 v46 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v51 = v46;
      __int16 v52 = 1024;
      int v53 = appended;
    }
    long long v28 = (char *)_os_log_send_and_compose_impl();
    CFIndex v44 = v39;
    int v45 = 286;
    goto LABEL_86;
  }
  int v32 = file;
  if (*(void *)(a2 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
    __int16 v33 = *(const char **)(a2 + 16);
    if (!v33) {
      __int16 v33 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v51 = v33;
    __int16 v52 = 1024;
    int v53 = v32;
  }
  else
  {
    uint64_t v43 = *(const char **)(a2 + 16);
    if (!v43) {
      uint64_t v43 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v51 = v43;
    __int16 v52 = 1024;
    int v53 = file;
  }
  long long v28 = (char *)_os_log_send_and_compose_impl();
  CFIndex v44 = v32;
  int v45 = 269;
LABEL_86:
  CFErrorRef Error = createError("cryptex_signature_secureconfig_add_entry", "signature.c", v45, "com.apple.security.cryptex.posix", v44, 0, v28);
LABEL_87:
  free(v28);
  buff_destroy(v48);
  if (!Error)
  {
LABEL_13:
    CFTypeRef v19 = 0;
    char v20 = 1;
    if (!v17) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  CFTypeRef v19 = CFRetain(Error);
  char v20 = 0;
  if (v17) {
LABEL_14:
  }
    os_release(v17);
LABEL_15:
  if (slot_with_saltdata) {
    os_release(slot_with_saltdata);
  }
  if (default_database) {
    os_release(default_database);
  }
  if ((v20 & 1) == 0) {
    CFRelease(Error);
  }
  return v19;
}

CFTypeRef cryptex_signature_lock_with_sep(uint64_t a1, int a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v4 = aks_measure_and_seal_cryptex_manifest();
  uint64_t v5 = v4;
  if ((int)v4 > -536362987)
  {
    if (v4 == -536362986)
    {
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        CFTypeRef v19 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          CFTypeRef v19 = *(const char **)(a1 + 16);
        }
      }
      else
      {
        CFTypeRef v19 = "[anonymous]";
        if (*(void *)(a1 + 16)) {
          CFTypeRef v19 = *(const char **)(a1 + 16);
        }
      }
      *(_DWORD *)buf = 136446466;
      __int16 v31 = v19;
      __int16 v32 = 1024;
      int v33 = -536362986;
      CFIndex v22 = (char *)_os_log_send_and_compose_impl();
      CFTypeRef v23 = "com.apple.security.cryptex";
      int v24 = 381;
      goto LABEL_39;
    }
    if (!v4)
    {
      int v7 = *(const char **)(a1 + 16);
      int v8 = *__error();
      uint64_t v9 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        CFTypeRef v10 = "[anonymous]";
        if (v7) {
          CFTypeRef v10 = v7;
        }
        *(_DWORD *)buf = 136446210;
        __int16 v31 = v10;
        _os_log_impl(&dword_21CBD9000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: successfully sealed im4m.", buf, 0xCu);
      }
      *__error() = v8;
      long long v29 = xmmword_21CBF0DA0;
      CFTypeRef v11 = cryptex_signature_secureconfig_add_entry((uint64_t)&v29, a1, a2, 0);
      if (!v11) {
        return 0;
      }
      int v12 = v11;
      if (*(void *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        int v13 = *(const char **)(a1 + 16);
        if (!v13) {
          int v13 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446210;
        __int16 v31 = v13;
      }
      else
      {
        long long v28 = *(const char **)(a1 + 16);
        if (!v28) {
          long long v28 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446210;
        __int16 v31 = v28;
      }
      CFIndex v22 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef Error = createError("cryptex_signature_lock_with_sep", "signature.c", 399, "com.apple.security.cryptex", 36, v12, v22);
      goto LABEL_45;
    }
LABEL_28:
    int Errno = _IOErrorGetErrno(v4);
    if (*(void *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      if (*(void *)(a1 + 16)) {
        int v21 = *(const char **)(a1 + 16);
      }
      else {
        int v21 = "[anonymous]";
      }
    }
    else if (*(void *)(a1 + 16))
    {
      int v21 = *(const char **)(a1 + 16);
    }
    else
    {
      int v21 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446722;
    __int16 v31 = v21;
    __int16 v32 = 1024;
    int v33 = v5;
    __int16 v34 = 1024;
    int v35 = _IOErrorGetErrno(v5);
    CFIndex v22 = (char *)_os_log_send_and_compose_impl();
    CFIndex v25 = Errno;
    CFTypeRef v23 = "com.apple.security.cryptex.posix";
    int v24 = 386;
    goto LABEL_44;
  }
  if (v4 == -536870170)
  {
    uint64_t v14 = *(const char **)(a1 + 16);
    int v15 = *__error();
    int v16 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = "[anonymous]";
      if (v14) {
        uint64_t v17 = v14;
      }
      *(_DWORD *)buf = 136446210;
      __int16 v31 = v17;
      _os_log_impl(&dword_21CBD9000, v16, OS_LOG_TYPE_INFO, "%{public}s: sealing im4m with SEP is unsupported on this device.", buf, 0xCu);
    }
    CFTypeRef v18 = 0;
    *__error() = v15;
    return v18;
  }
  if (v4 != -536363000) {
    goto LABEL_28;
  }
  if (*(void *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    int v6 = *(const char **)(a1 + 16);
    if (!v6) {
      int v6 = "[anonymous]";
    }
  }
  else
  {
    int v6 = *(const char **)(a1 + 16);
    if (!v6) {
      int v6 = "[anonymous]";
    }
  }
  *(_DWORD *)buf = 136446466;
  __int16 v31 = v6;
  __int16 v32 = 1024;
  int v33 = -536363000;
  CFIndex v22 = (char *)_os_log_send_and_compose_impl();
  CFTypeRef v23 = "com.apple.security.cryptex";
  int v24 = 376;
LABEL_39:
  CFIndex v25 = 36;
LABEL_44:
  CFErrorRef Error = createError("cryptex_signature_lock_with_sep", "signature.c", v24, v23, v25, 0, v22);
  int v12 = 0;
LABEL_45:
  free(v22);
  if (!Error)
  {
    CFTypeRef v18 = 0;
    if (!v12) {
      return v18;
    }
    goto LABEL_47;
  }
  CFTypeRef v18 = CFRetain(Error);
  CFRelease(Error);
  if (v12) {
LABEL_47:
  }
    CFRelease(v12);
  return v18;
}

uint64_t __cryptex_signature_write_metadata_to_file_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v6 = MEMORY[0x21D4B8200](a3);
  BOOL v7 = v6 != MEMORY[0x263EF8798];
  if (v6 == MEMORY[0x263EF8798])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    size_t v15 = strlen(string_ptr);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = fsetxattr(*(_DWORD *)(a1 + 48), a2, string_ptr, v15 + 1, 0, 2);
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      return 1;
    }
    int v16 = *(const char **)(*(void *)(a1 + 40) + 16);
    int v9 = *__error();
    CFTypeRef v10 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = "[anonymous]";
      if (v16) {
        uint64_t v17 = v16;
      }
      int v18 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v20 = 136446722;
      int v21 = v17;
      __int16 v22 = 2080;
      CFTypeRef v23 = a2;
      __int16 v24 = 1024;
      int v25 = v18;
      int v13 = "%{public}s: Failed to apply xattr '%s'.: %{darwin.errno}d";
      goto LABEL_11;
    }
  }
  else
  {
    int v8 = *(const char **)(*(void *)(a1 + 40) + 16);
    int v9 = *__error();
    CFTypeRef v10 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CFTypeRef v11 = "[anonymous]";
      if (v8) {
        CFTypeRef v11 = v8;
      }
      int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v20 = 136446722;
      int v21 = v11;
      __int16 v22 = 2080;
      CFTypeRef v23 = a2;
      __int16 v24 = 1024;
      int v25 = v12;
      int v13 = "%{public}s: Unexpected value for metadata key '%s': %{darwin.errno}d";
LABEL_11:
      _os_log_impl(&dword_21CBD9000, v10, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v20, 0x1Cu);
    }
  }
  *__error() = v9;
  return v7;
}

char *_find_error(unsigned int a1)
{
  if (a1 < 0x1B)
  {
    uint64_t v1 = 0;
    uint64_t v2 = (char *)&_generic_errors;
    goto LABEL_7;
  }
  if (a1 - 3501 < 7)
  {
    uint64_t v1 = -3501;
    uint64_t v2 = (char *)&_http_errors;
    goto LABEL_7;
  }
  if (a1 - 5000 < 0xB)
  {
    uint64_t v1 = -5000;
    uint64_t v2 = (char *)&_zip_errors;
LABEL_7:
    uint64_t v3 = &v2[32 * v1 + 32 * a1];
    if (*((_DWORD *)v3 + 2) == a1) {
      return v3;
    }
    else {
      return (char *)&_unknown_error;
    }
  }
  switch(a1)
  {
    case 0x63u:
      return (char *)&_generic_error;
    case 0xDACu:
      return (char *)&_http_internal_error;
    case 0xC7Au:
      return (char *)&_tss_declined_error;
  }
  if (a1 - 3100 >= 0x356) {
    return (char *)&_unknown_error;
  }
  return (char *)&_tss_error;
}

char *_AMAuthInstallErrorString(unsigned int a1, char *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  CFErrorRef error = _find_error(a1);
  uint64_t v5 = error;
  if (!a2) {
    return (char *)*((void *)error + 2);
  }
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
  long long v9 = 0u;
  long long v10 = 0u;
  *(_OWORD *)__str = 0u;
  long long v8 = 0u;
  if (*error) {
    snprintf(__str, 0x200uLL, ": %#x [%d, %d]", a1 - *((_DWORD *)error + 6), a1 - *((_DWORD *)error + 6), a1);
  }
  snprintf(a2, 0x100uLL, "%s%s", *((const char **)v5 + 2), __str);
  return a2;
}

uint64_t _AMAuthInstallPOSIXError(unsigned int a1)
{
  return *((unsigned int *)_find_error(a1) + 3);
}

void _AMAuthInstallSetAPParamsFromHost(uint64_t a1, __CFDictionary *a2)
{
  if (*(void *)(a1 + 8) == MEMORY[0x263F8C4B0]) {
    uint64_t v4 = "sha1";
  }
  else {
    uint64_t v4 = "sha2-384";
  }
  _CFDictionarySetString(a2, (const void *)*MEMORY[0x263F8BE98], v4);
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x263F8BE70], *(_DWORD *)(a1 + 28));
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x263F8BE78], *(_DWORD *)(a1 + 32));
  _CFDictionarySetUInt64(a2, (const void *)*MEMORY[0x263F8BE80], *(void *)(a1 + 40));
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x263F8BEB0], *(_DWORD *)(a1 + 36));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x263F8BEA0], *(unsigned __int8 *)(a1 + 48));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x263F8BEB8], *(unsigned __int8 *)(a1 + 49));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x263F8BE88], *(unsigned __int8 *)(a1 + 50));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x263F8BE90], *(unsigned __int8 *)(a1 + 51));
  uint64_t v5 = (const void *)*MEMORY[0x263F8BEC8];

  _CFDictionarySetBool(a2, v5, 1);
}

CFDataRef _AMAuthInstallCryptex1CopyUDID(const __CFNumber *a1, const __CFNumber *a2)
{
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  CFNumberGetValue(a1, kCFNumberSInt32Type, (char *)&v4 + 4);
  CFNumberGetValue(a2, kCFNumberSInt64Type, &v5);
  HIDWORD(v4) = bswap32(HIDWORD(v4));
  unint64_t v5 = bswap64(v5);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&v4, 16);
}

void _AMAuthInstallSetCryptex1ParamsFromHost(uint64_t a1, __CFDictionary *a2)
{
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberLongType, (const void *)(a1 + 32));
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, (const void *)(a1 + 40));
  CFDataRef v6 = _AMAuthInstallCryptex1CopyUDID(v4, v5);
  CFDictionarySetValue(a2, (const void *)*MEMORY[0x263F8BFB0], v6);
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x263F8BF60], *(_DWORD *)(a1 + 128));
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x263F8BFA8], *(_DWORD *)(a1 + 132));
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x263F8BF88], *(_DWORD *)(a1 + 140));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x263F8BF90], *(unsigned __int8 *)(a1 + 48));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x263F8BFB8], 1);
  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v4)
  {
    CFRelease(v4);
  }
}

void _AMAuthInstallSetCryptex1ApParamsFromHost(uint64_t a1, CFMutableDictionaryRef theDict)
{
  CFDictionaryRemoveValue(theDict, (const void *)*MEMORY[0x263F8BFB8]);
  _CFDictionarySetUInt32(theDict, (const void *)*MEMORY[0x263F8BE70], *(_DWORD *)(a1 + 28));
  _CFDictionarySetUInt32(theDict, (const void *)*MEMORY[0x263F8BE78], *(_DWORD *)(a1 + 32));
  _CFDictionarySetUInt32(theDict, (const void *)*MEMORY[0x263F8BEB0], *(_DWORD *)(a1 + 36));
  CFNumberRef v4 = (const void *)*MEMORY[0x263F8BEA0];
  int v5 = *(unsigned __int8 *)(a1 + 48);

  _CFDictionarySetBool(theDict, v4, v5);
}

uint64_t _init_authinstall_log()
{
  return MEMORY[0x270F980F8](_authinstall_logger);
}

void _authinstall_logger(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = os_log_create("com.apple.libcryptex", "authinstall");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    uint64_t v5 = a2;
    _os_log_impl(&dword_21CBD9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }
}

void _cryptex_scrivener_dealloc(uint64_t a1)
{
  os_release(*(void **)(a1 + 88));
  uint64_t v2 = *(const void **)(a1 + 184);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 192);
  if (v3) {
    CFRelease(v3);
  }
  int v4 = *(const void **)(a1 + 200);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(const void **)(a1 + 208);
  if (v5) {
    CFRelease(v5);
  }
  free(*(void **)(a1 + 160));
  *(void *)(a1 + 160) = 0;
  uint64_t v6 = *(void **)(a1 + 216);
  if (v6) {
    os_release(v6);
  }
  free(*(void **)(a1 + 168));
  *(void *)(a1 + 168) = 0;

  object_proto_destroy(a1 + 56);
}

void *cryptex_scrivener_create(void *a1, uint64_t a2)
{
  int v4 = (void *)_cryptex_scrivener_alloc();
  v4[10] = a2;
  v4[11] = os_retain(a1);
  if (a2) {
    uint64_t v5 = "https://gs.apple.com:443";
  }
  else {
    uint64_t v5 = "http://gs.apple.com";
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v6 = strdup(v5);
      if (v6) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v6 = strdup(v5);
    if (!v6) {
      cryptex_scrivener_create_cold_1();
    }
  }
  v4[20] = v6;
  uint64_t v7 = a1[21];
  if (v7 && (*(unsigned char *)(v7 + 40) & 1) != 0) {
    cryptex_scrivener_set_url(v4, "https://diavlo.apple.com:443");
  }
  object_proto_init((uint64_t)(v4 + 7), (int)"com.apple.security.libcryptex.core", "scrivener");
  cryptex_init((uint64_t)v4, 0, (uint64_t)_cryptex_scrivener_init, 0);
  return v4;
}

void cryptex_scrivener_set_url(void *a1, const char *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v4 = (void *)a1[20];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v5 = strdup(a2);
      if (v5) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v5 = strdup(a2);
    if (!v5) {
      cryptex_scrivener_set_url_cold_1();
    }
  }
  a1[20] = v5;
  uint64_t v6 = (const char *)a1[7];
  int v7 = *__error();
  long long v8 = a1[9];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    long long v9 = "[anonymous]";
    *(_DWORD *)buf = 136446722;
    if (v6) {
      long long v9 = v6;
    }
    long long v11 = v9;
    __int16 v12 = 2080;
    long long v13 = v4;
    __int16 v14 = 2080;
    long long v15 = a2;
    _os_log_impl(&dword_21CBD9000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: signing service url: %s -> %s", buf, 0x20u);
  }
  *__error() = v7;
  free(v4);
}

uint64_t _cryptex_scrivener_init(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  uint64_t v2 = AMAuthInstallCreate();
  *(void *)(a1 + 192) = v2;
  if (!v2) {
    _cryptex_scrivener_init_cold_1(buf, &v78);
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 168);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v78 = 0u;
  LOWORD(v78) = 6;
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 192);
    uint64_t v5 = *(const char **)(a1 + 56);
    int v6 = *__error();
    int v7 = *(NSObject **)(a1 + 72);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v8)
      {
        long long v9 = "[anonymous]";
        if (v5) {
          long long v9 = v5;
        }
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_21CBD9000, v7, OS_LOG_TYPE_DEBUG, "%{public}s: using caller-provided chip instance", buf, 0xCu);
      }
      *__error() = v6;
      long long v10 = *(long long **)(*(void *)(*(void *)(a1 + 88) + 168) + 192);
LABEL_31:
      uint64_t v26 = *(void *)(a1 + 152);
      if (v26)
      {
LABEL_32:
        CFDataRef v27 = CFDataCreate(0, (const UInt8 *)(v26 + 2), *(unsigned int *)(v26 + 52));
        if (!v27) {
          _cryptex_scrivener_init_cold_2(v74, buf);
        }
        CFDataRef v28 = v27;
        uint64_t MutableForCFTypes = _CFDictionaryCreateMutableForCFTypes();
        uint64_t v30 = *(void *)(a1 + 80);
        long long v31 = *(const char **)(a1 + 56);
        int v32 = *__error();
        long long v33 = *(NSObject **)(a1 + 72);
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
        if ((v30 & 8) != 0)
        {
          if (v34)
          {
            int v53 = "[anonymous]";
            int v54 = *((_DWORD *)v10 + 32);
            int v55 = *((_DWORD *)v10 + 33);
            if (v31) {
              int v53 = v31;
            }
            int v56 = *((_DWORD *)v10 + 34);
            int v57 = *((_DWORD *)v10 + 35);
            *(_DWORD *)buf = 136447234;
            *(void *)&uint8_t buf[4] = v53;
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = v54;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v55;
            *(_WORD *)&unsigned char buf[24] = 1024;
            *(_DWORD *)&buf[26] = v56;
            *(_WORD *)&buf[30] = 1024;
            LODWORD(v88) = v57;
            _os_log_impl(&dword_21CBD9000, v33, OS_LOG_TYPE_DEBUG, "%{public}s: using Cryptex1 identity:\n    FCHP = %#x\n    TYPE = %#x\n    STYP = %#x\n    CLAS = %#x", buf, 0x24u);
          }
          *__error() = v32;
          _AMAuthInstallSetCryptex1ParamsFromHost((uint64_t)v10, MutableForCFTypes);
          uint64_t v58 = *(void *)(*(void *)(a1 + 88) + 216);
          if (v58 && !*(unsigned char *)(v58 + 65)) {
            _AMAuthInstallSetCryptex1ApParamsFromHost((uint64_t)v10, MutableForCFTypes);
          }
          int v45 = (const void **)MEMORY[0x263F8BF70];
        }
        else
        {
          if (v34)
          {
            long long v35 = "[anonymous]";
            int v36 = *((_DWORD *)v10 + 6);
            int v37 = *((_DWORD *)v10 + 7);
            if (v31) {
              long long v35 = v31;
            }
            int v38 = *((_DWORD *)v10 + 8);
            int v39 = *((_DWORD *)v10 + 9);
            uint64_t v40 = *((void *)v10 + 5);
            int v41 = *((unsigned __int8 *)v10 + 48);
            int v42 = *((unsigned __int8 *)v10 + 49);
            int v43 = *((unsigned __int8 *)v10 + 50);
            int v44 = *((unsigned __int8 *)v10 + 51);
            *(_DWORD *)buf = 136448514;
            *(void *)&uint8_t buf[4] = v35;
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = v36;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v37;
            *(_WORD *)&unsigned char buf[24] = 1024;
            *(_DWORD *)&buf[26] = v38;
            *(_WORD *)&buf[30] = 1024;
            LODWORD(v88) = v39;
            WORD2(v88) = 2048;
            *(void *)((char *)&v88 + 6) = v40;
            HIWORD(v88) = 1024;
            *(_DWORD *)v89 = v41;
            *(_WORD *)&v89[4] = 1024;
            *(_DWORD *)&v89[6] = v42;
            __int16 v90 = 1024;
            int v91 = v43;
            __int16 v92 = 1024;
            int v93 = v44;
            _os_log_impl(&dword_21CBD9000, v33, OS_LOG_TYPE_DEBUG, "%{public}s: using device identity:\n    CEPO = %#x\n    BORD = %#x\n    CHIP = %#x\n    SDOM = %#x\n    ECID = %#llx\n    CPRO = %#x\n    CSEC = %#x\n    EPRO = %#x\n    ESEC = %#x", buf, 0x46u);
          }
          *__error() = v32;
          _AMAuthInstallSetAPParamsFromHost((uint64_t)v10, MutableForCFTypes);
          int v45 = (const void **)MEMORY[0x263F8BE68];
        }
        CFDictionarySetValue(MutableForCFTypes, *v45, v28);
        if ((*(unsigned char *)(a1 + 80) & 2) != 0) {
          CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x263F8BE60], (const void *)*MEMORY[0x263EFFB40]);
        }
        uint64_t v59 = *(const char **)(a1 + 56);
        int v60 = *__error();
        uint64_t v61 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          long long v62 = "[anonymous]";
          if (v59) {
            long long v62 = v59;
          }
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = v62;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = MutableForCFTypes;
          _os_log_impl(&dword_21CBD9000, v61, OS_LOG_TYPE_DEBUG, "%{public}s: ap parameters = %@", buf, 0x16u);
        }
        *__error() = v60;
        *(void *)(a1 + 184) = CFDictionaryCreateCopy(0, MutableForCFTypes);
        CFRelease(v28);
        if (MutableForCFTypes) {
          CFRelease(MutableForCFTypes);
        }
        _init_authinstall_log();
        int v21 = 0;
        return cryptex_set_error(a1, v21);
      }
      long long v72 = 0;
      uint64_t v73 = MEMORY[0x263F8C4D8];
      *(void *)v89 = 0;
      long long v88 = 0u;
      memset(buf, 0, sizeof(buf));
      int nonce_domain = cryptex_core_get_nonce_domain(*(void **)(a1 + 88), &v73);
      if (nonce_domain)
      {
        int v21 = nonce_domain;
        uint64_t v47 = *(const char **)(a1 + 56);
        int v48 = *__error();
        uint64_t v49 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          __int16 v50 = "[anonymous]";
          if (v47) {
            __int16 v50 = v47;
          }
          *(_DWORD *)uint64_t v74 = 136446466;
          v75 = v50;
          __int16 v76 = 1024;
          LODWORD(v77) = v21;
          uint64_t v51 = "%{public}s: failed to get nonce domain from core: %{darwin.errno}d";
LABEL_44:
          __int16 v52 = v49;
LABEL_67:
          _os_log_impl(&dword_21CBD9000, v52, OS_LOG_TYPE_ERROR, v51, v74, 0x12u);
        }
      }
      else
      {
        int v21 = cryptex_core_copy_nonce_domain_desc(*(void **)(a1 + 88), (char **)&v72);
        long long v63 = *(const char **)(a1 + 56);
        int v48 = *__error();
        __int16 v64 = *(NSObject **)(a1 + 72);
        if (v21)
        {
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            long long v65 = "[anonymous]";
            if (v63) {
              long long v65 = v63;
            }
            *(_DWORD *)uint64_t v74 = 136446466;
            v75 = v65;
            __int16 v76 = 1024;
            LODWORD(v77) = v21;
            uint64_t v51 = "%{public}s: failed to get nonce domain description from core: %{darwin.errno}d";
            __int16 v52 = v64;
            goto LABEL_67;
          }
        }
        else
        {
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            long long v67 = "[anonymous]";
            if (v63) {
              long long v67 = v63;
            }
            *(_DWORD *)uint64_t v74 = 136446466;
            v75 = v67;
            __int16 v76 = 2082;
            v77 = v72;
            _os_log_impl(&dword_21CBD9000, v64, OS_LOG_TYPE_DEFAULT, "%{public}s: signing using nonce from %{public}s", v74, 0x16u);
          }
          *__error() = v48;
          int v68 = img4_nonce_domain_copy_nonce();
          if (!v68)
          {
            long long v71 = *(_OWORD *)&buf[16];
            *(_OWORD *)(a1 + 96) = *(_OWORD *)buf;
            *(_OWORD *)(a1 + 112) = v71;
            *(_OWORD *)(a1 + 128) = v88;
            *(void *)(a1 + 144) = *(void *)v89;
            *(void *)(a1 + 152) = a1 + 96;
            free(v72);
            uint64_t v26 = *(void *)(a1 + 152);
            goto LABEL_32;
          }
          int v21 = v68;
          long long v69 = *(const char **)(a1 + 56);
          int v48 = *__error();
          uint64_t v49 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            long long v70 = "[anonymous]";
            if (v69) {
              long long v70 = v69;
            }
            *(_DWORD *)uint64_t v74 = 136446466;
            v75 = v70;
            __int16 v76 = 1024;
            LODWORD(v77) = v21;
            uint64_t v51 = "%{public}s: img4_nonce_domain_copy_nonce: %{darwin.errno}d";
            goto LABEL_44;
          }
        }
      }
      *__error() = v48;
      free(v72);
      return cryptex_set_error(a1, v21);
    }
    if (v8)
    {
      long long v18 = "[anonymous]";
      if (v5) {
        long long v18 = v5;
      }
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_21CBD9000, v7, OS_LOG_TYPE_DEBUG, "%{public}s: using caller-provided chip environment", buf, 0xCu);
    }
    *__error() = v6;
    uint64_t v17 = *(void *)(v3 + 1160);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 80);
    __int16 v12 = *(const char **)(a1 + 56);
    int v13 = *__error();
    __int16 v14 = *(NSObject **)(a1 + 72);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if ((v11 & 8) != 0)
    {
      if (v15)
      {
        long long v19 = "[anonymous]";
        if (v12) {
          long long v19 = v12;
        }
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_21CBD9000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: using generic cryptex1 environment", buf, 0xCu);
      }
      *__error() = v13;
      uint64_t v17 = MEMORY[0x263F8C4C8];
    }
    else
    {
      if (v15)
      {
        uint64_t v16 = "[anonymous]";
        if (v12) {
          uint64_t v16 = v12;
        }
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_impl(&dword_21CBD9000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: using personalized chip environment", buf, 0xCu);
      }
      *__error() = v13;
      uint64_t v17 = img4_chip_select_personalized_ap();
    }
  }
  WORD3(v78) = 0;
  *(_DWORD *)((char *)&v78 + 2) = 0;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  LOWORD(v78) = 6;
  *((void *)&v78 + 1) = v17;
  long long v10 = &v78;
  int v20 = img4_chip_instantiate();
  if (!v20) {
    goto LABEL_31;
  }
  int v21 = v20;
  long long v22 = *(const char **)(a1 + 56);
  int v23 = *__error();
  long long v24 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    long long v25 = "[anonymous]";
    if (v22) {
      long long v25 = v22;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = v25;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v21;
    _os_log_impl(&dword_21CBD9000, v24, OS_LOG_TYPE_ERROR, "%{public}s: failed to instantiate chip: %{darwin.errno}d", buf, 0x12u);
  }
  *__error() = v23;
  return cryptex_set_error(a1, v21);
}

void cryptex_scrivener_sign(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v6 = ctx_new(a1, 0x30uLL);
  _OWORD v6[3] = 0;
  v6[4] = a2;
  _OWORD v6[5] = a3;
  int v7 = (const char *)a1[7];
  int v8 = *__error();
  long long v9 = a1[9];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v10 = "[anonymous]";
    if (v7) {
      long long v10 = v7;
    }
    int v11 = 136446210;
    __int16 v12 = v10;
    _os_log_impl(&dword_21CBD9000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: requesting signature", (uint8_t *)&v11, 0xCu);
  }
  *__error() = v8;
  cryptex_async_f((uint64_t)a1, v6, (void (__cdecl *)(void *))_cryptex_scrivener_sign_continue);
}

void _cryptex_scrivener_sign_continue(uint64_t *a1)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v86 = 0;
  object = 0;
  memset(v85, 0, sizeof(v85));
  memset(v90, 0, sizeof(v90));
  int error = cryptex_get_error(v2);
  if (error)
  {
    int v4 = error;
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v5 = *(const char **)(v2 + 56);
      if (!v5) {
        uint64_t v5 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      v95 = v5;
      __int16 v96 = 1024;
      *(_DWORD *)v97 = v4;
    }
    else
    {
      __int16 v12 = *(const char **)(v2 + 56);
      if (!v12) {
        __int16 v12 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      v95 = v12;
      __int16 v96 = 1024;
      *(_DWORD *)v97 = error;
    }
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();
    CFIndex v14 = v4;
    int v15 = 550;
    goto LABEL_87;
  }
  if ((*(unsigned char *)(v2 + 80) & 8) != 0)
  {
    CFDataRef v16 = CFDataCreate(0, 0, 0);
    int inited = _cryptex_scrivener_init_tss_common(v2);
    if (inited)
    {
      LODWORD(v8) = inited;
      uint64_t MutableForCFTypes = 0;
      if (!v16)
      {
LABEL_16:
        if (!MutableForCFTypes) {
          goto LABEL_72;
        }
        CFDictionaryRef v19 = MutableForCFTypes;
        goto LABEL_71;
      }
LABEL_15:
      CFRelease(v16);
      goto LABEL_16;
    }
    uint64_t MutableForCFTypes = _CFDictionaryCreateMutableForCFTypes();
    CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x263F8BF98], (const void *)*MEMORY[0x263EFFB40]);
    _CFDictionaryMergeDictionary(MutableForCFTypes, *(CFDictionaryRef *)(v2 + 184));
    uint64_t v29 = *(void *)(*(void *)(v2 + 88) + 216);
    if (v29)
    {
      _CFDictionarySetUInt32(MutableForCFTypes, (const void *)*MEMORY[0x263F8BF78], *(_DWORD *)(v29 + 40));
      _CFDictionarySetUInt32(MutableForCFTypes, (const void *)*MEMORY[0x263F8BFA0], *(_DWORD *)(*(void *)(*(void *)(v2 + 88) + 216) + 44));
      _CFDictionarySetString(MutableForCFTypes, (const void *)*MEMORY[0x263F8BFC0], *(char **)(*(void *)(*(void *)(v2 + 88) + 216) + 48));
      _CFDictionarySetString(MutableForCFTypes, (const void *)*MEMORY[0x263F8BF80], *(char **)(*(void *)(*(void *)(v2 + 88) + 216) + 56));
    }
    int v30 = _cryptex_scrivener_init_tss_assets((void *)v2, (uint64_t)MutableForCFTypes);
    if (v30)
    {
      LODWORD(v8) = v30;
      long long v31 = *(const char **)(v2 + 56);
      int v32 = *__error();
      long long v33 = *(NSObject **)(v2 + 72);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_135;
      }
      BOOL v34 = "[anonymous]";
      if (v31) {
        BOOL v34 = v31;
      }
      *(_DWORD *)buf = 136446466;
      v95 = v34;
      __int16 v96 = 1024;
      *(_DWORD *)v97 = v8;
      long long v35 = "%{public}s: Failed to attach asset measurement(s).: %{darwin.errno}d";
      goto LABEL_36;
    }
    bytes[0] = 0;
    if (cryptex_core_get_info_asset(*(void *)(v2 + 88)))
    {
      int v36 = cryptex_core_parse_info_asset(*(void **)(v2 + 88), 0, 0, (BOOL *)bytes);
      if (v36)
      {
        LODWORD(v8) = v36;
        int v37 = *(const char **)(v2 + 56);
        int v38 = *__error();
        int v39 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = "[anonymous]";
          if (v37) {
            uint64_t v40 = v37;
          }
          *(_DWORD *)buf = 136446466;
          v95 = v40;
          __int16 v96 = 1024;
          *(_DWORD *)v97 = v8;
          _os_log_impl(&dword_21CBD9000, v39, OS_LOG_TYPE_ERROR, "%{public}s: failed to parse cryptex info: %{darwin.errno}d", buf, 0x12u);
        }
        *__error() = v38;
        int v41 = *(const char **)(v2 + 56);
        int v32 = *__error();
        long long v33 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          int v42 = "[anonymous]";
          if (v41) {
            int v42 = v41;
          }
          *(_DWORD *)buf = 136446466;
          v95 = v42;
          __int16 v96 = 1024;
          *(_DWORD *)v97 = v8;
          long long v35 = "%{public}s: Failed to stamp DataOnly.: %{darwin.errno}d";
LABEL_36:
          _os_log_impl(&dword_21CBD9000, v33, OS_LOG_TYPE_ERROR, v35, buf, 0x12u);
        }
LABEL_135:
        *__error() = v32;
        if (!v16) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      if (bytes[0]) {
        _CFDictionarySetBool(MutableForCFTypes, @"Cryptex1,DataOnly", 1);
      }
    }
    CFDictionarySetValue(MutableForCFTypes, @"Cryptex1,UniqueTagList", v16);
    *(void *)(v2 + 200) = CFDictionaryCreateCopy(0, MutableForCFTypes);
    long long v80 = *(const char **)(v2 + 56);
    int v32 = *__error();
    long long v81 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      long long v82 = "[anonymous]";
      uint64_t v83 = *(void *)(v2 + 200);
      if (v80) {
        long long v82 = v80;
      }
      *(_DWORD *)buf = 136446466;
      v95 = v82;
      __int16 v96 = 2114;
      *(void *)v97 = v83;
      _os_log_impl(&dword_21CBD9000, v81, OS_LOG_TYPE_DEFAULT, "%{public}s: tss request = %{public}@", buf, 0x16u);
    }
    LODWORD(v8) = 0;
    goto LABEL_135;
  }
  CFDictionaryRef theDict = 0;
  *(void *)uint64_t bytes = 0;
  uint64_t v92 = 0;
  int v93 = 0;
  CFDataRef v6 = CFDataCreate(0, 0, 0);
  int v7 = _cryptex_scrivener_init_tss_common(v2);
  if (v7)
  {
    LODWORD(v8) = v7;
    CFDataRef v9 = 0;
    CFMutableDictionaryRef v10 = 0;
    CFMutableDictionaryRef MutableCopy = 0;
  }
  else
  {
    int v20 = *(const char **)(v2 + 56);
    int v21 = *__error();
    long long v22 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      int v23 = "[anonymous]";
      uint64_t v24 = *(void *)(v2 + 184);
      if (v20) {
        int v23 = v20;
      }
      *(_DWORD *)buf = 136446466;
      v95 = v23;
      __int16 v96 = 2112;
      *(void *)v97 = v24;
      _os_log_impl(&dword_21CBD9000, v22, OS_LOG_TYPE_DEBUG, "%{public}s: setting ap parameters = %@", buf, 0x16u);
    }
    *__error() = v21;
    if (AMAuthInstallApSetParameters()) {
      _cryptex_scrivener_sign_continue_cold_3();
    }
    CFMutableDictionaryRef v10 = _CFDictionaryCreateMutableForCFTypes();
    LODWORD(v8) = _cryptex_scrivener_init_tss_assets((void *)v2, (uint64_t)v10);
    long long v25 = *(const char **)(v2 + 56);
    int v26 = *__error();
    CFDataRef v27 = *(NSObject **)(v2 + 72);
    if (v8)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        CFDataRef v28 = "[anonymous]";
        if (v25) {
          CFDataRef v28 = v25;
        }
        *(_DWORD *)buf = 136446466;
        v95 = v28;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = v8;
        _os_log_impl(&dword_21CBD9000, v27, OS_LOG_TYPE_ERROR, "%{public}s: Failed to attach asset measurement(s).: %{darwin.errno}d", buf, 0x12u);
      }
      CFDataRef v9 = 0;
      CFMutableDictionaryRef MutableCopy = 0;
      *__error() = v26;
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        int v43 = "[anonymous]";
        if (v25) {
          int v43 = v25;
        }
        *(_DWORD *)buf = 136446210;
        v95 = v43;
        _os_log_impl(&dword_21CBD9000, v27, OS_LOG_TYPE_DEBUG, "%{public}s: creating server request dictionary", buf, 0xCu);
      }
      *__error() = v26;
      if (AMAuthInstallApImg4CreateServerRequestDictionary()) {
        _cryptex_scrivener_sign_continue_cold_2();
      }
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
      CFStringRef v44 = (const __CFString *)MGGetStringAnswer();
      CFStringRef v8 = v44;
      if (!v44 || !_CFStringLocalizeCaseInsensitiveContains(v44, @"z41")) {
        CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263F8BFF8], (const void *)*MEMORY[0x263EFFB38]);
      }
      CFDataRef v45 = CFDataCreate(0, bytes, 20);
      if (!v45) {
        _cryptex_scrivener_init_cold_2(&v89, buf);
      }
      CFDataRef v9 = v45;
      CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263F8BF50], v45);
      CFDictionarySetValue(MutableCopy, @"Ap,UniqueTagList", v6);
      *(void *)(v2 + 200) = CFDictionaryCreateCopy(0, MutableCopy);
      __int16 v46 = *(const char **)(v2 + 56);
      int v84 = *__error();
      uint64_t v47 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        int v48 = "[anonymous]";
        uint64_t v49 = *(void *)(v2 + 200);
        if (v46) {
          int v48 = v46;
        }
        *(_DWORD *)buf = 136446466;
        v95 = v48;
        __int16 v96 = 2114;
        *(void *)v97 = v49;
        _os_log_impl(&dword_21CBD9000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s: tss request = %{public}@", buf, 0x16u);
      }
      *__error() = v84;
      if (v8)
      {
        CFRelease(v8);
        LODWORD(v8) = 0;
      }
    }
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  CFDictionaryRef v19 = theDict;
  if (theDict) {
LABEL_71:
  }
    CFRelease(v19);
LABEL_72:
  if (v8)
  {
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      __int16 v50 = *(const char **)(v2 + 56);
      if (!v50) {
        __int16 v50 = "[anonymous]";
      }
    }
    else
    {
      __int16 v50 = *(const char **)(v2 + 56);
      if (!v50) {
        __int16 v50 = "[anonymous]";
      }
    }
    *(_DWORD *)buf = 136446466;
    v95 = v50;
    __int16 v96 = 1024;
    *(_DWORD *)v97 = v8;
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();
    CFIndex v14 = (int)v8;
    int v15 = 557;
    goto LABEL_87;
  }
  if ((*(unsigned char *)(v2 + 80) & 4) == 0)
  {
    uint64_t v51 = (CFDictionaryRef *)(v2 + 208);
    unsigned int PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
    if (PersonalizedResponse)
    {
      unsigned int v53 = PersonalizedResponse;
      int v54 = _AMAuthInstallPOSIXError(PersonalizedResponse);
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        if (*(void *)(v2 + 56)) {
          int v55 = *(const char **)(v2 + 56);
        }
        else {
          int v55 = "[anonymous]";
        }
        int v56 = _AMAuthInstallErrorString(v53, (char *)v90);
        *(_DWORD *)buf = 136446978;
        v95 = v55;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = v53;
        *(_WORD *)&v97[4] = 2082;
        *(void *)&v97[6] = v56;
        __int16 v98 = 1024;
        int v99 = v54;
      }
      else
      {
        if (*(void *)(v2 + 56)) {
          __int16 v76 = *(const char **)(v2 + 56);
        }
        else {
          __int16 v76 = "[anonymous]";
        }
        v77 = _AMAuthInstallErrorString(v53, (char *)v90);
        *(_DWORD *)buf = 136446978;
        v95 = v76;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = v53;
        *(_WORD *)&v97[4] = 2082;
        *(void *)&v97[6] = v77;
        __int16 v98 = 1024;
        int v99 = v54;
      }
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      CFIndex v14 = v54;
      int v15 = 568;
LABEL_87:
      CFErrorRef v57 = createError("_cryptex_scrivener_sign_continue", "scrivener.c", v15, "com.apple.security.cryptex.posix", v14, 0, v13);
      free(v13);
      goto LABEL_88;
    }
    if ((*(void *)(v2 + 80) & 8) != 0) {
      uint64_t v58 = (const void **)MEMORY[0x263F8BF68];
    }
    else {
      uint64_t v58 = (const void **)MEMORY[0x263F8BF18];
    }
    uint64_t v59 = *v58;
    int v60 = *(const char **)(v2 + 56);
    int v61 = *__error();
    long long v62 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      long long v63 = "[anonymous]";
      CFDictionaryRef v64 = *v51;
      if (v60) {
        long long v63 = v60;
      }
      *(_DWORD *)buf = 136446466;
      v95 = v63;
      __int16 v96 = 2112;
      *(void *)v97 = v64;
      _os_log_impl(&dword_21CBD9000, v62, OS_LOG_TYPE_DEBUG, "%{public}s: tss response: %@", buf, 0x16u);
    }
    *__error() = v61;
    CFNumberRef Value = CFDictionaryGetValue(*v51, v59);
    if (!Value || (uint64_t v66 = Value, v67 = CFGetTypeID(Value), v67 != CFDataGetTypeID()))
    {
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        uint64_t v74 = *(const char **)(v2 + 56);
        *(_DWORD *)buf = 136446722;
        if (v74) {
          v75 = v74;
        }
        else {
          v75 = "[anonymous]";
        }
        v95 = v75;
        __int16 v96 = 2114;
        *(void *)v97 = v59;
        *(_WORD *)&v97[8] = 1024;
        *(_DWORD *)&v97[10] = 94;
      }
      else
      {
        long long v79 = "[anonymous]";
        if (*(void *)(v2 + 56)) {
          long long v79 = *(const char **)(v2 + 56);
        }
        *(_DWORD *)buf = 136446722;
        v95 = v79;
        __int16 v96 = 2114;
        *(void *)v97 = v59;
        *(_WORD *)&v97[8] = 1024;
        *(_DWORD *)&v97[10] = 94;
      }
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      int v15 = 585;
      CFIndex v14 = 94;
      goto LABEL_87;
    }
    CFRetain(v66);
    BytePtr = CFDataGetBytePtr((CFDataRef)v66);
    CFIndex Length = CFDataGetLength((CFDataRef)v66);
    buff_init_signed(v85, (uint64_t)v66, (uint64_t)_buff_destroy_CFData, (uint64_t)BytePtr, Length);
  }
  if (cryptex_core_get_info_asset(*(void *)(v2 + 88)))
  {
    int v70 = signature_metadata_read_from_cryptex(*(void **)(v2 + 88), &object);
    if (v70)
    {
      int v71 = v70;
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        long long v72 = *(const char **)(v2 + 56);
        if (!v72) {
          long long v72 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446466;
        v95 = v72;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = v71;
      }
      else
      {
        long long v78 = *(const char **)(v2 + 56);
        if (!v78) {
          long long v78 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446466;
        v95 = v78;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = v70;
      }
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      CFIndex v14 = v71;
      int v15 = 598;
      goto LABEL_87;
    }
    uint64_t v73 = object;
  }
  else
  {
    uint64_t v73 = 0;
  }
  CFErrorRef v57 = 0;
  *(void *)(v2 + 216) = cryptex_signature_create(v85, *(void *)(v2 + 80) & 1, v73);
LABEL_88:
  buff_destroy(v85);
  a1[2] = (uint64_t)v57;
  cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_scrivener_sign_callback);
  if (object) {
    os_release(object);
  }
}

__n128 cryptex_scrivener_set_nonce(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 128) = v3;
  *(__n128 *)(a1 + 96) = result;
  *(void *)(a1 + 144) = v4;
  *(void *)(a1 + 152) = a1 + 96;
  return result;
}

void cryptex_scrivener_read_signature(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFDataRef v6 = ctx_new(a1, 0x30uLL);
  _OWORD v6[3] = 1;
  v6[4] = a2;
  _OWORD v6[5] = a3;
  int v7 = (const char *)a1[7];
  int v8 = *__error();
  CFDataRef v9 = a1[9];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    CFMutableDictionaryRef v10 = "[anonymous]";
    if (v7) {
      CFMutableDictionaryRef v10 = v7;
    }
    int v11 = 136446210;
    __int16 v12 = v10;
    _os_log_impl(&dword_21CBD9000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: reading signature", (uint8_t *)&v11, 0xCu);
  }
  *__error() = v8;
  cryptex_async_f((uint64_t)a1, v6, (void (__cdecl *)(void *))_cryptex_scrivener_read_continue);
}

void _cryptex_scrivener_read_continue(uint64_t *a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = a1[3];
  uint64_t v30 = 0;
  object = 0;
  memset(v29, 0, sizeof(v29));
  int error = cryptex_get_error(v2);
  if (error)
  {
    int v5 = error;
    if (error != 216 || v3 != 1)
    {
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        int v7 = *(const char **)(v2 + 56);
        if (!v7) {
          int v7 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446466;
        long long v33 = v7;
        __int16 v34 = 1024;
        int v35 = v5;
      }
      else
      {
        int v8 = *(const char **)(v2 + 56);
        if (!v8) {
          int v8 = "[anonymous]";
        }
        *(_DWORD *)buf = 136446466;
        long long v33 = v8;
        __int16 v34 = 1024;
        int v35 = error;
      }
      CFDataRef v9 = (char *)_os_log_send_and_compose_impl();
      CFIndex v10 = v5;
      int v11 = 640;
LABEL_36:
      CFErrorRef v27 = createError("_cryptex_scrivener_read_continue", "scrivener.c", v11, "com.apple.security.cryptex.posix", v10, 0, v9);
      free(v9);
      goto LABEL_37;
    }
    __int16 v12 = *(const char **)(v2 + 56);
    int v13 = *__error();
    CFIndex v14 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v15 = "[anonymous]";
      if (v12) {
        int v15 = v12;
      }
      *(_DWORD *)buf = 136446210;
      long long v33 = v15;
      _os_log_impl(&dword_21CBD9000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: ignoring ap environment", buf, 0xCu);
    }
    *__error() = v13;
  }
  uint64_t asset = cryptex_core_get_asset(*(void *)(v2 + 88), (uint64_t)&_cryptex_asset_type_im4m);
  if (!asset) {
    _cryptex_scrivener_read_continue_cold_1();
  }
  uint64_t v17 = asset;
  int file = _read_file(*(_DWORD *)(asset + 16), v29);
  if (file)
  {
    int v19 = file;
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      int v20 = *(const char **)(v2 + 56);
      if (!v20) {
        int v20 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      long long v33 = v20;
      __int16 v34 = 1024;
      int v35 = v19;
    }
    else
    {
      CFDataRef v28 = *(const char **)(v2 + 56);
      if (!v28) {
        CFDataRef v28 = "[anonymous]";
      }
      *(_DWORD *)buf = 136446466;
      long long v33 = v28;
      __int16 v34 = 1024;
      int v35 = file;
    }
    CFDataRef v9 = (char *)_os_log_send_and_compose_impl();
    CFIndex v10 = v19;
    int v11 = 651;
    goto LABEL_36;
  }
  int v21 = signature_metadata_read_from_file(*(_DWORD *)(v17 + 16), &object);
  if (v21)
  {
    int v22 = v21;
    int v23 = *(const char **)(v2 + 56);
    int v24 = *__error();
    long long v25 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = "[anonymous]";
      if (v23) {
        int v26 = v23;
      }
      *(_DWORD *)buf = 136446466;
      long long v33 = v26;
      __int16 v34 = 1024;
      int v35 = v22;
      _os_log_impl(&dword_21CBD9000, v25, OS_LOG_TYPE_ERROR, "%{public}s: Failed to load metadata for Image4 manifest.: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v24;
  }
  CFErrorRef v27 = 0;
  *(void *)(v2 + 216) = cryptex_signature_create(v29, *(void *)(v2 + 80) & 1, object);
LABEL_37:
  buff_destroy(v29);
  a1[2] = (uint64_t)v27;
  cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_scrivener_sign_callback);
  if (object) {
    os_release(object);
  }
}

void cryptex_scrivener_set_socks_proxy(uint64_t a1, const char *a2, int a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  CFDataRef v6 = *(void **)(a1 + 168);
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      int v7 = strdup(a2);
      if (v7) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    int v7 = strdup(a2);
    if (!v7) {
      cryptex_scrivener_set_url_cold_1();
    }
  }
  *(void *)(a1 + 168) = v7;
  int v8 = *(_DWORD *)(a1 + 176);
  *(_DWORD *)(a1 + 176) = a3;
  CFDataRef v9 = *(const char **)(a1 + 56);
  int v10 = *__error();
  int v11 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = "[anonymous]";
    *(_DWORD *)buf = 136447234;
    if (v9) {
      __int16 v12 = v9;
    }
    CFIndex v14 = v12;
    __int16 v15 = 2080;
    CFDataRef v16 = v6;
    __int16 v17 = 1024;
    int v18 = v8;
    __int16 v19 = 2080;
    int v20 = a2;
    __int16 v21 = 1024;
    int v22 = a3;
    _os_log_impl(&dword_21CBD9000, v11, OS_LOG_TYPE_DEBUG, "%{public}s: socks proxy: %s:%d -> %s:%d", buf, 0x2Cu);
  }
  *__error() = v10;
  free(v6);
}

void _buff_destroy_CFData(int a1, int a2, CFTypeRef cf)
{
}

void _cryptex_scrivener_sign_callback(void **a1)
{
  uint64_t v2 = a1[2];
  ((void (*)(void *, void, void *, void *))a1[5])(*a1, *((void *)*a1 + 27), a1[2], a1[4]);
  ctx_destroy(a1);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t _cryptex_scrivener_init_tss_common(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  memset(v46, 0, sizeof(v46));
  uint64_t v2 = *(const char **)(a1 + 56);
  int v3 = *__error();
  uint64_t v4 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = "[anonymous]";
    uint64_t v6 = *(void *)(a1 + 160);
    if (v2) {
      int v5 = v2;
    }
    *(_DWORD *)buf = 136446466;
    int v48 = v5;
    __int16 v49 = 2080;
    *(void *)__int16 v50 = v6;
    _os_log_impl(&dword_21CBD9000, v4, OS_LOG_TYPE_DEBUG, "%{public}s: setting url: %s", buf, 0x16u);
  }
  *__error() = v3;
  CFStringRef v7 = _CFStringCreateFromUTF8String(*(char **)(a1 + 160));
  CFURLRef v8 = CFURLCreateWithString(0, v7, 0);
  if (!v8) {
    _cryptex_scrivener_init_tss_common_cold_1(&v45, buf);
  }
  CFURLRef v9 = v8;
  if (AMAuthInstallSetSigningServerURL()) {
    _cryptex_scrivener_init_tss_common_cold_4();
  }
  if (!*(void *)(a1 + 168) || !*(_DWORD *)(a1 + 176)) {
    goto LABEL_23;
  }
  int v10 = *(const char **)(a1 + 56);
  int v11 = *__error();
  __int16 v12 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = "[anonymous]";
    if (v10) {
      int v13 = v10;
    }
    *(_DWORD *)buf = 136446210;
    int v48 = v13;
    _os_log_impl(&dword_21CBD9000, v12, OS_LOG_TYPE_DEBUG, "%{public}s: using socks proxy", buf, 0xCu);
  }
  *__error() = v11;
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, (const void *)(a1 + 176));
  if (!v15) {
    _cryptex_scrivener_init_tss_common_cold_2(&v45, buf);
  }
  CFNumberRef v16 = v15;
  CFStringRef v17 = CFStringCreateWithCString(v14, *(const char **)(a1 + 168), 0x8000100u);
  if (!v17) {
    _cryptex_scrivener_init_tss_common_cold_3(&v45, buf);
  }
  CFStringRef v18 = v17;
  unsigned int v19 = AMAuthInstallSetSOCKSProxyInformation();
  if (v19)
  {
    int v20 = *(const char **)(a1 + 56);
    int v21 = *__error();
    int v22 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      if (!v20) {
        int v20 = "[anonymous]";
      }
      uint64_t v23 = _AMAuthInstallErrorString(v19, (char *)v46);
      *(_DWORD *)buf = 136446722;
      int v48 = v20;
      __int16 v49 = 1024;
      *(_DWORD *)__int16 v50 = v19;
      *(_WORD *)&v50[4] = 2082;
      *(void *)&v50[6] = v23;
      _os_log_impl(&dword_21CBD9000, v22, OS_LOG_TYPE_ERROR, "%{public}s: AMAuthInstallSetSOCKSProxyInformation: [%d] %{public}s", buf, 0x1Cu);
    }
    *__error() = v21;
    uint64_t v24 = _AMAuthInstallPOSIXError(v19);
  }
  else
  {
    uint64_t v24 = 0xFFFFFFFFLL;
  }
  CFRelease(v18);
  CFRelease(v16);
  if (!v19)
  {
LABEL_23:
    if ((*(unsigned char *)(a1 + 80) & 1) == 0)
    {
LABEL_24:
      long long v25 = *(const char **)(a1 + 56);
      int v26 = *__error();
      CFErrorRef v27 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        CFDataRef v28 = "[anonymous]";
        uint64_t v29 = *(void *)(a1 + 192);
        if (v25) {
          CFDataRef v28 = v25;
        }
        *(_DWORD *)buf = 136446466;
        int v48 = v28;
        __int16 v49 = 2112;
        *(void *)__int16 v50 = v29;
        _os_log_impl(&dword_21CBD9000, v27, OS_LOG_TYPE_DEBUG, "%{public}s: auth install = %@", buf, 0x16u);
      }
      uint64_t v24 = 0;
      *__error() = v26;
      goto LABEL_45;
    }
    uint64_t v30 = *(const char **)(a1 + 56);
    int v31 = *__error();
    int v32 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      long long v33 = "[anonymous]";
      if (v30) {
        long long v33 = v30;
      }
      *(_DWORD *)buf = 136446210;
      int v48 = v33;
      _os_log_impl(&dword_21CBD9000, v32, OS_LOG_TYPE_DEBUG, "%{public}s: using sso", buf, 0xCu);
    }
    *__error() = v31;
    unsigned int v34 = AMAuthInstallSsoInitialize();
    if (v34)
    {
      unsigned int v35 = v34;
      uint64_t v36 = *(const char **)(a1 + 56);
      int v37 = *__error();
      int v38 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        if (!v36) {
          uint64_t v36 = "[anonymous]";
        }
        int v39 = _AMAuthInstallErrorString(v35, (char *)v46);
        *(_DWORD *)buf = 136446722;
        int v48 = v36;
        __int16 v49 = 1024;
        *(_DWORD *)__int16 v50 = v35;
        *(_WORD *)&v50[4] = 2082;
        *(void *)&v50[6] = v39;
        uint64_t v40 = "%{public}s: AMAuthInstallSsoInitialize: [%d] %{public}s";
LABEL_43:
        _os_log_impl(&dword_21CBD9000, v38, OS_LOG_TYPE_ERROR, v40, buf, 0x1Cu);
      }
    }
    else
    {
      unsigned int v41 = AMAuthInstallSsoEnable();
      if (!v41) {
        goto LABEL_24;
      }
      unsigned int v35 = v41;
      int v42 = *(const char **)(a1 + 56);
      int v37 = *__error();
      int v38 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        if (!v42) {
          int v42 = "[anonymous]";
        }
        int v43 = _AMAuthInstallErrorString(v35, (char *)v46);
        *(_DWORD *)buf = 136446722;
        int v48 = v42;
        __int16 v49 = 1024;
        *(_DWORD *)__int16 v50 = v35;
        *(_WORD *)&v50[4] = 2082;
        *(void *)&v50[6] = v43;
        uint64_t v40 = "%{public}s: AMAuthInstallSsoEnable: [%d] %{public}s";
        goto LABEL_43;
      }
    }
    *__error() = v37;
    uint64_t v24 = _AMAuthInstallPOSIXError(v35);
  }
LABEL_45:
  CFRelease(v9);
  if (v7) {
    CFRelease(v7);
  }
  return v24;
}

uint64_t _cryptex_scrivener_init_tss_assets(void *a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v39 = *MEMORY[0x263EF8340];
  int v5 = a1 + 7;
  while (1)
  {
    uint64_t v6 = a1[11];
    uint64_t v7 = *(void *)(v6 + v4 + 64);
    if (!v7)
    {
      CFNumberRef v16 = (const char *)a1[7];
      int v10 = *__error();
      CFStringRef v17 = a1[9];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v18 = "[anonymous]";
        if (v16) {
          CFStringRef v18 = v16;
        }
        uint64_t v19 = (*(void **)((char *)&cryptex_asset_types + v4))[5];
        *(_DWORD *)buf = 136446466;
        unsigned int v34 = v18;
        __int16 v35 = 2080;
        uint64_t v36 = v19;
        CFAllocatorRef v14 = v17;
        CFNumberRef v15 = "%{public}s: no asset of type: %s";
LABEL_14:
        _os_log_impl(&dword_21CBD9000, v14, OS_LOG_TYPE_DEBUG, v15, buf, 0x16u);
      }
LABEL_15:
      *__error() = v10;
      goto LABEL_21;
    }
    CFURLRef v8 = *(unsigned char **)(v7 + 8);
    if ((*v8 & 0x14) == 0) {
      break;
    }
LABEL_21:
    v4 += 8;
    if (v4 == 96) {
      return 0;
    }
  }
  if (v8 == (unsigned char *)&_cryptex_asset_type_gdmg && cryptex_core_image_authapfs_enabled(v6))
  {
    CFURLRef v9 = (const char *)a1[7];
    int v10 = *__error();
    int v11 = a1[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = "[anonymous]";
      if (v9) {
        __int16 v12 = v9;
      }
      uint64_t v13 = *(void *)(*(void *)(v7 + 8) + 40);
      *(_DWORD *)buf = 136446466;
      unsigned int v34 = v12;
      __int16 v35 = 2080;
      uint64_t v36 = v13;
      CFAllocatorRef v14 = v11;
      CFNumberRef v15 = "%{public}s: skip stamping asset: %s";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  int v20 = (const char *)a1[7];
  int v21 = *__error();
  int v22 = a1[9];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = "[anonymous]";
    if (v20) {
      uint64_t v23 = v20;
    }
    uint64_t v24 = *(void *)(*(void *)(v7 + 8) + 40);
    *(_DWORD *)buf = 136446466;
    unsigned int v34 = v23;
    __int16 v35 = 2080;
    uint64_t v36 = v24;
    _os_log_impl(&dword_21CBD9000, v22, OS_LOG_TYPE_DEBUG, "%{public}s: stamping asset: %s", buf, 0x16u);
  }
  *__error() = v21;
  uint64_t v25 = (*(uint64_t (**)(uint64_t, void, uint64_t, void, void *))(*(void *)(v7 + 8) + 8))(v7, a1[24], a2, 0, v5);
  if (!v25) {
    goto LABEL_21;
  }
  uint64_t v26 = v25;
  CFDataRef v28 = (const char *)a1[7];
  int v29 = *__error();
  uint64_t v30 = a1[9];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    int v31 = "[anonymous]";
    if (v28) {
      int v31 = v28;
    }
    uint64_t v32 = *(void *)(*(void *)(v7 + 8) + 40);
    *(_DWORD *)buf = 136446722;
    unsigned int v34 = v31;
    __int16 v35 = 2082;
    uint64_t v36 = v32;
    __int16 v37 = 1024;
    int v38 = v26;
    _os_log_impl(&dword_21CBD9000, v30, OS_LOG_TYPE_ERROR, "%{public}s: failed to stamp asset: %{public}s: %{darwin.errno}d", buf, 0x1Cu);
  }
  *__error() = v29;
  return v26;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1_3(void *a1, _OWORD *a2)
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

CFNumberRef _CFNumberCreateFromUInt32(int a1)
{
  int valuePtr = a1;
  return CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
}

unint64_t _CFNumberGetUInt32(const __CFNumber *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unint64_t valuePtr = -1;
  if (!CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr)) {
    _CFNumberGetUInt32_cold_1();
  }
  if (HIDWORD(valuePtr)) {
    _CFNumberGetUInt32_cold_2(&v2, v4);
  }
  return valuePtr;
}

CFStringRef _CFStringCreateFromUTF8String(char *cStr)
{
  return CFStringCreateWithCString(0, cStr, 0x8000100u);
}

BOOL _CFStringLocalizeCaseInsensitiveContains(const __CFString *a1, const __CFString *a2)
{
  v5.length = CFStringGetLength(a1);
  v5.location = 0;
  return CFStringFindWithOptions(a1, a2, v5, 0x21uLL, 0) != 0;
}

uint64_t _CFURLCreateFromFileDescriptor(uint64_t a1, CFURLRef *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  bzero(cStr, 0x400uLL);
  uint64_t v3 = realpath_np();
  if (!v3)
  {
    CFStringRef v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
    if (!v4) {
      _cryptex_scrivener_init_tss_common_cold_3(&v8, v10);
    }
    CFStringRef v5 = v4;
    CFURLRef v6 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
    if (!v6) {
      _cryptex_scrivener_init_tss_common_cold_1(&v8, v10);
    }
    *a2 = v6;
    CFRelease(v5);
  }
  return v3;
}

CFMutableDictionaryRef _CFDictionaryCreateMutableForCFTypes()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!result) {
    _CFDictionaryCreateMutableForCFTypes_cold_1(&v1, v2);
  }
  return result;
}

void _CFDictionarySetBool(__CFDictionary *a1, const void *a2, int a3)
{
  uint64_t v3 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    uint64_t v3 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(a1, a2, *v3);
}

void _CFDictionarySetUInt32(__CFDictionary *a1, const void *a2, int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v5) {
    _cryptex_scrivener_init_tss_common_cold_2(&v8, v9);
  }
  CFNumberRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void _CFDictionarySetUInt64(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (!v5) {
    _cryptex_scrivener_init_tss_common_cold_2(&v8, v9);
  }
  CFNumberRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void _CFDictionarySetString(__CFDictionary *a1, const void *a2, char *cStr)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v5) {
    _cryptex_scrivener_init_tss_common_cold_3(&v7, v8);
  }
  CFStringRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);

  CFRelease(v6);
}

void _CFDictionaryMergeDictionary(void *context, CFDictionaryRef theDict)
{
}

void _CFDictionaryMergeDictionaryKey(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

CFErrorRef createError(const char *a1, const char *a2, int a3, const char *a4, CFIndex a5, const void *a6, char *cStr)
{
  int valuePtr = a3;
  CFStringRef v12 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFStringRef v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  CFStringRef v14 = CFStringCreateWithCString(0, a4, 0x8000100u);
  CFStringRef v15 = CFStringCreateWithCString(0, a2, 0x8000100u);
  CFNumberRef v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  uint64_t MutableForCFTypes = _CFDictionaryCreateMutableForCFTypes();
  CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x263EFFC70], v12);
  if (os_variant_allows_internal_security_policies())
  {
    CFDictionarySetValue(MutableForCFTypes, @"FunctionName", v13);
    CFDictionarySetValue(MutableForCFTypes, @"FileName", v15);
    CFDictionarySetValue(MutableForCFTypes, @"LineNumber", v16);
  }
  if (a6) {
    CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x263EFFC88], a6);
  }
  CFErrorRef v18 = CFErrorCreate(0, v14, a5, MutableForCFTypes);
  CFRelease(MutableForCFTypes);
  CFRelease(v12);
  CFRelease(v13);
  CFRelease(v14);
  CFRelease(v15);
  CFRelease(v16);
  return v18;
}

double hash_init(_OWORD *a1)
{
  double result = 0.0;
  a1[17] = 0u;
  a1[18] = 0u;
  a1[15] = 0u;
  a1[16] = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

size_t hash_node_init_cstr(uint64_t a1, char *__s)
{
  size_t result = strlen(__s);
  *(_DWORD *)a1 |= 2u;
  *(void *)(a1 + 16) = __s;
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t hash_insert(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = os_simple_hash();
  if ((*(unsigned char *)a2 & 2) == 0) {
    hash_insert_cold_1();
  }
  unint64_t v5 = v4;
  uint64_t result = hash_lookup(a1, *(const void **)(a2 + 16), *(void *)(a2 + 24));
  if (result) {
    hash_insert_cold_3();
  }
  *(void *)(a2 + 8) = *(void *)(a1 + 8 * (v5 % 0x25));
  *(void *)(a1 + 8 * (v5 % 0x25)) = a2;
  if (*(_DWORD *)a2) {
    hash_insert_cold_2();
  }
  *(_DWORD *)a2 |= 1u;
  ++*(void *)(a1 + 296);
  return result;
}

uint64_t hash_lookup(uint64_t a1, const void *a2, size_t a3)
{
  for (uint64_t i = *(void *)(a1 + 8 * (os_simple_hash() % 0x25uLL)); i; uint64_t i = *(void *)(i + 8))
  {
    if (*(void *)(i + 24) == a3 && !memcmp(*(const void **)(i + 16), a2, a3)) {
      break;
    }
  }
  return i;
}

uint64_t hash_lookup_cstr(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);

  return hash_lookup(a1, __s, v4);
}

void hash_insert_cold_1()
{
}

void hash_insert_cold_2()
{
}

void hash_insert_cold_3()
{
}

os_log_t object_proto_init(uint64_t a1, int a2, char *category)
{
  os_log_t result = os_log_create("com.apple.libcryptex", category);
  *(void *)(a1 + 16) = result;
  return result;
}

void object_proto_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  uint64_t v2 = *(void **)(a1 + 16);

  os_release(v2);
}

uint64_t _sprintdgst(uint64_t __str, unsigned __int8 *a2, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3 >= 0x31) {
    _sprintdgst_cold_1(&v8, v9);
  }
  size_t v4 = (char *)__str;
  *(unsigned char *)(__str + 96) = 0;
  *(_OWORD *)(__str + 64) = 0u;
  *(_OWORD *)(__str + 80) = 0u;
  *(_OWORD *)(__str + 32) = 0u;
  *(_OWORD *)(__str + 48) = 0u;
  *(_OWORD *)__str = 0u;
  *(_OWORD *)(__str + 16) = 0u;
  if (a3)
  {
    size_t v6 = 97;
    do
    {
      int v7 = *a2++;
      __str = snprintf(v4, v6, "%02x", v7);
      v4 += 2;
      v6 -= 2;
      --v3;
    }
    while (v3);
  }
  return __str;
}

unint64_t _strtou32(const char *a1, char **a2, int a3)
{
  __endptr = 0;
  *__error() = 0;
  unint64_t result = strtoul(a1, &__endptr, a3);
  if (__endptr && *__endptr)
  {
    unint64_t result = 0;
    if (a2) {
      *a2 = __endptr;
    }
  }
  else if (HIDWORD(result))
  {
    *__error() = 34;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _read_file(int a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  memset(&v20, 0, sizeof(v20));
  if (fstat(a1, &v20))
  {
    uint64_t v4 = *__error();
    int v5 = *__error();
    size_t v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_21CBD9000, v6, OS_LOG_TYPE_ERROR, "stat: %{darwin.errno}d", buf, 8u);
    }
    off_t st_size = 0;
LABEL_5:
    uint64_t v8 = 0;
    *__error() = v5;
LABEL_6:
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  off_t st_size = v20.st_size;
  if (v20.st_size < 0) {
    cryptex_asset_create_generic_digest_cold_2();
  }
  uint64_t v10 = malloc_type_malloc(v20.st_size, 0xD8A116BDuLL);
  if (!v10)
  {
    uint64_t v4 = *__error();
    int v5 = *__error();
    CFStringRef v15 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_21CBD9000, v15, OS_LOG_TYPE_ERROR, "malloc: %{darwin.errno}d", buf, 8u);
    }
    goto LABEL_5;
  }
  uint64_t v8 = v10;
  while (1)
  {
    ssize_t v11 = pread(a1, v8, st_size, 0);
    if ((v11 & 0x8000000000000000) == 0) {
      break;
    }
    int v12 = *__error();
    CFStringRef v13 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v14;
      _os_log_impl(&dword_21CBD9000, v13, OS_LOG_TYPE_ERROR, "pread: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v12;
    uint64_t v4 = *__error();
    if (v4 != 4) {
      goto LABEL_6;
    }
  }
  ssize_t v16 = v11;
  int v17 = *__error();
  CFErrorRef v18 = os_log_create("com.apple.libcryptex", "utility");
  uint64_t v19 = v18;
  if (v16 == st_size)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      off_t v22 = st_size;
      _os_log_impl(&dword_21CBD9000, v19, OS_LOG_TYPE_DEBUG, "read %ld bytes", buf, 0xCu);
    }
    *__error() = v17;
LABEL_7:
    buff_init(a2, 0, (uint64_t)_buff_destructor_free, (uint64_t)v8, st_size);
    uint64_t v4 = 0;
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    off_t v22 = v16;
    __int16 v23 = 2048;
    off_t v24 = st_size;
    _os_log_impl(&dword_21CBD9000, v19, OS_LOG_TYPE_ERROR, "truncated read: actual = %ld, expected = %lu", buf, 0x16u);
  }
  *__error() = v17;
  uint64_t v4 = 5;
LABEL_8:
  free(v8);
  return v4;
}

uint64_t _write_file(int __fd, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  while (1)
  {
    ssize_t v4 = pwrite(__fd, *(const void **)a2, *(void *)(a2 + 8), 0);
    if ((v4 & 0x8000000000000000) == 0) {
      break;
    }
    int v5 = *__error();
    size_t v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v7;
      _os_log_impl(&dword_21CBD9000, v6, OS_LOG_TYPE_ERROR, "write: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v5;
    uint64_t v8 = *__error();
    if (v8 != 4) {
      return v8;
    }
  }
  ssize_t v9 = v4;
  uint64_t v10 = *(void *)(a2 + 8);
  int v11 = *__error();
  int v12 = os_log_create("com.apple.libcryptex", "utility");
  CFStringRef v13 = v12;
  if (v9 == v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      ssize_t v17 = v9;
      _os_log_impl(&dword_21CBD9000, v13, OS_LOG_TYPE_DEBUG, "wrote %ld bytes", buf, 0xCu);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a2 + 8);
      *(_DWORD *)buf = 134218496;
      ssize_t v17 = v9;
      __int16 v18 = 2048;
      uint64_t v19 = v14;
      __int16 v20 = 1024;
      int v21 = 5;
      _os_log_impl(&dword_21CBD9000, v13, OS_LOG_TYPE_ERROR, "truncated write: actual = %ld, expected = %ld: %{darwin.errno}d", buf, 0x1Cu);
    }
  }
  *__error() = v11;
  return v8;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return _os_crash_msg();
}

void _sprintdgst_cold_1(void *a1, _OWORD *a2)
{
}

uint64_t _buff_destructor_munmap(void *a1, size_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t result = munmap(a1, a2);
  if (result == -1) {
    _buff_destructor_munmap_cold_1(&v3, v4);
  }
  return result;
}

void *buff_init(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int *result = a4;
  result[1] = a5;
  result[2] = a4;
  result[3] = a5;
  result[4] = a2;
  result[5] = a3;
  if (a5 < 0) {
    buff_init_cold_1(&v5, v6);
  }
  return result;
}

void *buff_init_signed(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a5 < 0) {
    buff_init_signed_cold_1(&v6, v7);
  }

  return buff_init(a1, a2, a3, a4, a5);
}

double buff_xfer(__n128 *a1, __n128 *a2)
{
  *(void *)&double result = buff_xfer_subrange(a1, a2, 0, a2->n128_u64[1]).n128_u64[0];
  return result;
}

__n128 buff_xfer_subrange(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4)
{
  if (a4 + a3 > a2->n128_u64[1])
  {
    os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  a1->n128_u64[0] = a2->n128_u64[0] + a3;
  a1->n128_u64[1] = a4;
  a1[1].n128_u64[0] = a2->n128_u64[0];
  a1[1].n128_u64[1] = a2->n128_u64[1];
  __n128 result = a2[2];
  a1[2] = result;
  a2[2].n128_u64[1] = 0;
  return result;
}

void *buff_destroy(void *result)
{
  if (result)
  {
    if (*result)
    {
      uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))result[5];
      if (v1)
      {
        if (result[6]) {
          buff_destroy_cold_1();
        }
        uint64_t v2 = result[3];
        uint64_t v3 = result[4];
        uint64_t v4 = result[2];
        return (void *)v1(v4, v2, v3);
      }
    }
  }
  return result;
}

void _buff_destructor_munmap_cold_1(void *a1, _OWORD *a2)
{
}

void buff_init_cold_1(void *a1, _OWORD *a2)
{
}

void buff_init_signed_cold_1(void *a1, _OWORD *a2)
{
}

void buff_destroy_cold_1()
{
}

void *ctx_new(void *a1, size_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a2 <= 0x17) {
    ctx_new_cold_1(&v7, v8);
  }
  if (_dispatch_is_multithreaded())
  {
    uint64_t v4 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
    if (!v4)
    {
      do
      {
        __os_temporary_resource_shortage();
        uint64_t v5 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      }
      while (!v5);
      uint64_t v4 = v5;
    }
  }
  else
  {
    uint64_t v4 = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (!v4) {
      _cryptex_magister_record_property_continue2_cold_1(&v7, v8);
    }
  }
  if (a1) {
    *uint64_t v4 = os_retain(a1);
  }
  return v4;
}

void ctx_destroy(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      os_release(v2);
    }
    free(a1);
  }
}

void ctx_new_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

uint64_t _xpc_dictionary_try_get_uint64(void *a1, const char *a2, uint64_t *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (MEMORY[0x21D4B8200]() != MEMORY[0x263EF87A0]) {
    return 79;
  }
  uint64_t v7 = xpc_uint64_get_value(v5);
  uint64_t result = 0;
  *a3 = v7;
  return result;
}

uint64_t _xpc_dictionary_try_get_string(void *a1, const char *a2, const char **a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (MEMORY[0x21D4B8200]() != MEMORY[0x263EF8798]) {
    return 79;
  }
  string_ptr = xpc_string_get_string_ptr(v5);
  uint64_t result = 0;
  *a3 = string_ptr;
  return result;
}

uint64_t _xpc_dictionary_try_get_BOOL(void *a1, const char *a2, BOOL *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (MEMORY[0x21D4B8200]() != MEMORY[0x263EF86E0]) {
    return 79;
  }
  BOOL v7 = xpc_BOOL_get_value(v5);
  uint64_t result = 0;
  *a3 = v7;
  return result;
}

void cryptex_core_set_asset_cold_1(void *a1, _OWORD *a2)
{
}

void cryptex_core_set_assets_from_directory_cold_1(void *a1, _OWORD *a2)
{
}

void cryptex_core_generate_identifier_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_3();
  _os_crash_msg();
  __break(1u);
}

void cryptex_core_generate_version_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void cryptex_core_copy_nonce_domain_desc_cold_1(const char *a1)
{
  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = __error();
  strerror(*v1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void session_core_generate_username_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_3();
  _os_crash_msg();
  __break(1u);
}

void cryptex_session_core_create_from_xpc_cold_1()
{
}

void cryptex_session_core_create_from_xpc_cold_2()
{
}

void cryptex_session_core_create_from_xpc_cold_3()
{
}

void cryptex_session_core_create_from_xpc_cold_4()
{
}

void cryptex_session_core_create_from_xpc_cold_5()
{
}

void _cryptex_asset_generic_stamp_cold_1(void *a1, _OWORD *a2)
{
}

void _cryptex_asset_generic_stamp_cold_2(void *a1, _OWORD *a2, unsigned int a3)
{
}

void cryptex_asset_new_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_3_0();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void cryptex_asset_create_generic_digest_cold_1(void *a1, _OWORD *a2)
{
}

void cryptex_asset_create_generic_digest_cold_2()
{
}

void cryptex_asset_create_generic_digest_cold_3(void *a1, _OWORD *a2)
{
}

void _cftag_cold_1(void *a1, _OWORD *a2)
{
}

void _cryptex_base_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _cryptex_core_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _cryptex_core_cx1_properties_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _cryptex_host_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _cryptex_magister_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _cryptex_signature_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _cryptex_scrivener_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _session_core_alloc_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v0, v1);
  OUTLINED_FUNCTION_4();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void cryptex_core_unparse_hdiid_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_tss_set_c411_from_file_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_version_new_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_version_new_cold_2(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v5 = __error();
  strerror(*v5);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _cryptex_magister_init_cold_1()
{
}

void _cryptex_magister_authenticate_toutoc_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  __error();
  OUTLINED_FUNCTION_3();
  _os_crash_msg();
  __break(1u);
}

void _cryptex_magister_firmware_execute_toutoc_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  __error();
  OUTLINED_FUNCTION_3();
  _os_crash_msg();
  __break(1u);
}

void _cryptex_magister_firmware_execute_toutoc_cold_2()
{
}

void _cryptex_magister_record_property_continue2_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_signature_seal_cold_1()
{
}

void cryptex_signature_create_cold_1()
{
}

void _cryptex_signature_compute_hash_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_scrivener_create_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  *uint64_t v0 = 0;
  v1[3] = 0u;
  v1[4] = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  *uint64_t v1 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_7_0();
  _os_log_send_and_compose_impl();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void cryptex_scrivener_set_url_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  strlen(v4);
  void *v3 = 0;
  *uint64_t v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  OUTLINED_FUNCTION_4();
  uint64_t v5 = __error();
  strerror(*v5);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _cryptex_scrivener_init_cold_1(void *a1, _OWORD *a2)
{
}

void _cryptex_scrivener_init_cold_2(void *a1, _OWORD *a2)
{
}

void _cryptex_scrivener_sign_continue_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2);
  OUTLINED_FUNCTION_4();
  _AMAuthInstallErrorString(v0, 0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _cryptex_scrivener_sign_continue_cold_3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2);
  OUTLINED_FUNCTION_4();
  _AMAuthInstallErrorString(v0, 0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _cryptex_scrivener_read_continue_cold_1()
{
}

void _cryptex_scrivener_init_tss_common_cold_1(void *a1, _OWORD *a2)
{
}

void _cryptex_scrivener_init_tss_common_cold_2(void *a1, _OWORD *a2)
{
}

void _cryptex_scrivener_init_tss_common_cold_3(void *a1, _OWORD *a2)
{
}

void _cryptex_scrivener_init_tss_common_cold_4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2);
  OUTLINED_FUNCTION_4();
  _AMAuthInstallErrorString(v0, 0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5();
  __break(1u);
}

void _CFNumberGetUInt32_cold_1()
{
}

void _CFNumberGetUInt32_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _CFDictionaryCreateMutableForCFTypes_cold_1(void *a1, _OWORD *a2)
{
}

uint64_t AMAuthInstallApCreateImagePropertiesWithDeviceMapZipped()
{
  return MEMORY[0x270F980A8]();
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return MEMORY[0x270F980B0]();
}

uint64_t AMAuthInstallApImg4CreateServerRequestDictionary()
{
  return MEMORY[0x270F980B8]();
}

uint64_t AMAuthInstallApImg4GetEntryNameForType()
{
  return MEMORY[0x270F980C8]();
}

uint64_t AMAuthInstallApSetParameters()
{
  return MEMORY[0x270F980E0]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x270F980F0]();
}

uint64_t AMAuthInstallSetSOCKSProxyInformation()
{
  return MEMORY[0x270F98110]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x270F98118]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x270F98120]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x270F98128]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
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

uint64_t __os_temporary_resource_shortage()
{
  return MEMORY[0x270ED7E58]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x270ED7F50]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x270ED80E0]();
}

uint64_t aks_measure_and_seal_cryptex_manifest()
{
  return MEMORY[0x270F0E400]();
}

uint64_t aks_seal_cryptex_manifest_lock()
{
  return MEMORY[0x270F0E408]();
}

uint64_t aks_sealed_hashes_set()
{
  return MEMORY[0x270F0E410]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
}

uint64_t claimfd_np()
{
  return MEMORY[0x270ED8ED8]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t close_drop_optional_np()
{
  return MEMORY[0x270ED8F28]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

uint64_t dup_np()
{
  return MEMORY[0x270ED9688]();
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9970](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

void free(void *a1)
{
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9AE0](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

uint64_t image4_environment_destroy()
{
  return MEMORY[0x270F99A40]();
}

uint64_t image4_environment_new()
{
  return MEMORY[0x270F99A48]();
}

uint64_t image4_trust_evaluate()
{
  return MEMORY[0x270F99A58]();
}

uint64_t image4_trust_new()
{
  return MEMORY[0x270F99A60]();
}

uint64_t image4_trust_record_property_BOOL()
{
  return MEMORY[0x270F99A68]();
}

uint64_t image4_trust_record_property_data()
{
  return MEMORY[0x270F99A70]();
}

uint64_t image4_trust_record_property_integer()
{
  return MEMORY[0x270F99A78]();
}

uint64_t img4_chip_custom()
{
  return MEMORY[0x270F99A88]();
}

uint64_t img4_chip_init_from_buff()
{
  return MEMORY[0x270F99A90]();
}

uint64_t img4_chip_instantiate()
{
  return MEMORY[0x270F99A98]();
}

uint64_t img4_chip_select_personalized_ap()
{
  return MEMORY[0x270F99AA0]();
}

uint64_t img4_firmware_attach_manifest()
{
  return MEMORY[0x270F99AA8]();
}

uint64_t img4_firmware_destroy()
{
  return MEMORY[0x270F99AB0]();
}

uint64_t img4_firmware_execute()
{
  return MEMORY[0x270F99AB8]();
}

uint64_t img4_firmware_init_from_buff()
{
  return MEMORY[0x270F99AC0]();
}

uint64_t img4_firmware_init_sentinel()
{
  return MEMORY[0x270F99AC8]();
}

uint64_t img4_firmware_new()
{
  return MEMORY[0x270F99AD0]();
}

uint64_t img4_firmware_new_from_fd_4MSM()
{
  return MEMORY[0x270F99AD8]();
}

uint64_t img4_firmware_select_chip()
{
  return MEMORY[0x270F99AE0]();
}

uint64_t img4_image_get_bytes()
{
  return MEMORY[0x270F99AE8]();
}

uint64_t img4_nonce_domain_copy_nonce()
{
  return MEMORY[0x270F99AF0]();
}

uint64_t img4_nonce_domain_get_from_handle()
{
  return MEMORY[0x270F99AF8]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x270EDA840](*(void *)&a1, a2, *(void *)&a3);
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

uint64_t os_simple_hash()
{
  return MEMORY[0x270EDAA70]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

uint64_t realpath_np()
{
  return MEMORY[0x270EDB178]();
}

uint64_t secure_config_database_create_slot()
{
  return MEMORY[0x270EFD300]();
}

uint64_t secure_config_database_create_slot_with_saltdata()
{
  return MEMORY[0x270EFD308]();
}

uint64_t secure_config_entry_create_with_buffer()
{
  return MEMORY[0x270EFD310]();
}

uint64_t secure_config_entry_set_metadata()
{
  return MEMORY[0x270EFD318]();
}

uint64_t secure_config_get_default_database()
{
  return MEMORY[0x270EFD320]();
}

uint64_t secure_config_slot_append_entry()
{
  return MEMORY[0x270EFD328]();
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

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x270EDB688](__stringp, __delim);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

void uuid_generate(uuid_t out)
{
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDBF20](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x270EDBF70]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
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

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
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

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x270EDC180](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}