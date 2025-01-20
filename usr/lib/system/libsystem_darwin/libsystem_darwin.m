unint64_t os_simple_hash(unsigned __int8 *a1, unint64_t a2)
{
  return os_simple_hash_with_seed(a1, a2, 0);
}

unint64_t os_simple_hash_with_seed(unsigned __int8 *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = (0xC6A4A7935BD1E995 * a2) ^ a3;
  if (a2 >= 8)
  {
    v4 = &a1[8 * (a2 >> 3)];
    uint64_t v5 = 8 * (a2 >> 3);
    do
    {
      uint64_t v6 = *(void *)a1;
      a1 += 8;
      unint64_t v3 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v6) ^ ((0xC6A4A7935BD1E995 * v6) >> 47))) ^ v3);
      v5 -= 8;
    }
    while (v5);
    a1 = v4;
  }
  switch(a2 & 7)
  {
    case 1uLL:
      goto LABEL_12;
    case 2uLL:
      goto LABEL_11;
    case 3uLL:
      goto LABEL_10;
    case 4uLL:
      goto LABEL_9;
    case 5uLL:
      goto LABEL_8;
    case 6uLL:
      goto LABEL_7;
    case 7uLL:
      v3 ^= (unint64_t)a1[6] << 48;
LABEL_7:
      v3 ^= (unint64_t)a1[5] << 40;
LABEL_8:
      v3 ^= (unint64_t)a1[4] << 32;
LABEL_9:
      v3 ^= (unint64_t)a1[3] << 24;
LABEL_10:
      v3 ^= (unint64_t)a1[2] << 16;
LABEL_11:
      v3 ^= (unint64_t)a1[1] << 8;
LABEL_12:
      unint64_t v3 = 0xC6A4A7935BD1E995 * (v3 ^ *a1);
      break;
    default:
      return (0xC6A4A7935BD1E995 * (v3 ^ (v3 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v3 ^ (v3 >> 47))) >> 47);
  }
  return (0xC6A4A7935BD1E995 * (v3 ^ (v3 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v3 ^ (v3 >> 47))) >> 47);
}

uint64_t os_variant_is_darwinos()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (darwin_release_type == 2) {
    return 0;
  }
  if (darwin_release_type != 3) {
    _check_internal_release_type_cold_1();
  }
  return 1;
}

int8x8_t ___initialize_status_block_invoke()
{
  v19[10] = *MEMORY[0x263EF8C08];
  size_t v18 = 8;
  v19[0] = 0;
  if (!sysctlbyname("kern.osvariant_status", v19, &v18, 0, 0) && v19[0])
  {
    if ((v19[0] & 8) != 0)
    {
      can_has_debugger = (LODWORD(v19[0]) >> 2) & 3;
      if ((v19[0] & 0x8000) == 0)
      {
LABEL_40:
        if ((v19[0] & 0x2000000) == 0) {
          goto LABEL_41;
        }
        goto LABEL_52;
      }
    }
    else if ((v19[0] & 0x8000) == 0)
    {
      goto LABEL_40;
    }
    is_ephemeral = LOWORD(v19[0]) >> 14;
    if ((v19[0] & 0x2000000) == 0)
    {
LABEL_41:
      if ((v19[0] & 0x20) == 0) {
        goto LABEL_42;
      }
      goto LABEL_53;
    }
LABEL_52:
    has_full_logging = HIBYTE(LODWORD(v19[0])) & 3;
    if ((v19[0] & 0x20) == 0)
    {
LABEL_42:
      if ((v19[0] & 0x800) == 0) {
        goto LABEL_43;
      }
      goto LABEL_54;
    }
LABEL_53:
    internal_release_type = (LODWORD(v19[0]) >> 4) & 3;
    if ((v19[0] & 0x800) == 0)
    {
LABEL_43:
      if ((v19[0] & 0x2000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_55;
    }
LABEL_54:
    factory_release_type = (LODWORD(v19[0]) >> 10) & 3;
    if ((v19[0] & 0x2000) == 0)
    {
LABEL_44:
      if ((v19[0] & 0x20000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_56;
    }
LABEL_55:
    darwin_release_type = (LODWORD(v19[0]) >> 12) & 3;
    if ((v19[0] & 0x20000) == 0)
    {
LABEL_45:
      if ((v19[0] & 0x200000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_57;
    }
LABEL_56:
    recovery_release_type = HIWORD(LODWORD(v19[0])) & 3;
    if ((v19[0] & 0x200000) == 0)
    {
LABEL_46:
      if ((v19[0] & 0x8000000) == 0)
      {
LABEL_48:
        int64x2_t v11 = vdupq_n_s64(v19[0]);
        int16x8_t v12 = (int16x8_t)vuzp1q_s32((int32x4_t)vtstq_s64(v11, (int64x2_t)xmmword_20D89C6A0), (int32x4_t)vtstq_s64(v11, (int64x2_t)xmmword_20D89C6B0));
        *(int8x8_t *)v12.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v12), (int8x8_t)0x1000100010001);
        int8x8_t result = vmovn_s16(v12);
        disabled_status = result.i32[0];
        return result;
      }
LABEL_47:
      allows_security_research = (LODWORD(v19[0]) >> 26) & 3;
      goto LABEL_48;
    }
LABEL_57:
    development_kernel = (LODWORD(v19[0]) >> 20) & 3;
    if ((v19[0] & 0x8000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  if (is_ephemeral) {
    ___initialize_status_block_invoke_cold_8(&v18, v19);
  }
  LODWORD(v18) = 0;
  v19[0] = 4;
  sysctlbyname("hw.ephemeral_storage", &v18, v19, 0, 0);
  if (v18) {
    int v0 = 3;
  }
  else {
    int v0 = 2;
  }
  is_ephemeral = v0;
  if (can_has_debugger) {
    ___initialize_status_block_invoke_cold_7(&v18, v19);
  }
  if (MEMORY[0xFFFFF4084]) {
    int v1 = 3;
  }
  else {
    int v1 = 2;
  }
  can_has_debugger = v1;
  if (internal_release_type) {
    ___initialize_status_block_invoke_cold_6(&v18, v19);
  }
  if (factory_release_type) {
    ___initialize_status_block_invoke_cold_5(&v18, v19);
  }
  if (darwin_release_type) {
    ___initialize_status_block_invoke_cold_4(&v18, v19);
  }
  if (recovery_release_type) {
    ___initialize_status_block_invoke_cold_3(&v18, v19);
  }
  v19[0] = 0x4000;
  file = _read_file((uint64_t)"/System/Library/CoreServices/SystemVersion.plist", v19);
  if (!file) {
    goto LABEL_19;
  }
  unint64_t v3 = file;
  uint64_t v4 = xpc_create_from_plist();
  if (!v4)
  {
LABEL_18:
    free(v3);
LABEL_19:
    if (access("/AppleInternal/Library/PreferenceBundles/Internal Settings.bundle", 0)) {
      int v6 = 2;
    }
    else {
      int v6 = 3;
    }
    internal_release_type = v6;
    factory_release_type = 2;
    darwin_release_type = 2;
    recovery_release_type = 2;
    goto LABEL_23;
  }
  uint64_t v5 = (void *)v4;
  if (MEMORY[0x21055F1A0]() != MEMORY[0x263EF8D00])
  {
    xpc_release(v5);
    goto LABEL_18;
  }
  free(v3);
  string = xpc_dictionary_get_string(v5, "ReleaseType");
  if (string)
  {
    v14 = (char *)string;
    if (strcmp(string, "NonUI"))
    {
      factory_release_type = 2;
      if (strstr(v14, "Internal")) {
        int v15 = 3;
      }
      else {
        int v15 = 2;
      }
      internal_release_type = v15;
      if (strstr(v14, "Darwin")) {
        int v16 = 3;
      }
      else {
        int v16 = 2;
      }
      darwin_release_type = v16;
      if (strstr(v14, "Recovery")) {
        int v17 = 3;
      }
      else {
        int v17 = 2;
      }
      goto LABEL_73;
    }
    factory_release_type = 3;
    internal_release_type = 3;
    int v17 = 2;
  }
  else
  {
    int v17 = 2;
    internal_release_type = 2;
    factory_release_type = 2;
  }
  darwin_release_type = 2;
LABEL_73:
  recovery_release_type = v17;
  xpc_release(v5);
LABEL_23:
  if (development_kernel) {
    ___initialize_status_block_invoke_cold_2(&v18, v19);
  }
  size_t v18 = 0;
  v19[0] = 0;
  int data_np = sysctlbyname_get_data_np("kern.osbuildconfig", v19, &v18);
  v8 = (char *)v19[0];
  if (!data_np
    && (!strcmp((const char *)v19[0], "development")
     || !strcmp(v8, "debug")
     || !strcmp(v8, "profile")
     || !strcmp(v8, "kasan")))
  {
    development_kernel = 3;
  }
  free(v8);
  if (!development_kernel) {
    development_kernel = 2;
  }
  if (allows_security_research) {
    ___initialize_status_block_invoke_cold_1(&v18, v19);
  }
  LODWORD(v18) = 0;
  v19[0] = 4;
  sysctlbyname("hw.features.allows_security_research", &v18, v19, 0, 0);
  if (v18) {
    int v9 = 3;
  }
  else {
    int v9 = 2;
  }
  allows_security_research = v9;
  _parse_disabled_status();
  return result;
}

uint64_t os_variant_has_factory_content()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (factory_release_type == 2) {
    return 0;
  }
  if (factory_release_type != 3) {
    _check_internal_release_type_cold_1();
  }
  return 1;
}

uint64_t os_variant_has_internal_ui()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (BYTE2(disabled_status)) {
    return 0;
  }

  return _check_internal_release_type();
}

uint64_t os_variant_allows_internal_security_policies()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (HIBYTE(disabled_status)) {
    return 0;
  }
  if (can_has_debugger == 2)
  {
    if (development_kernel == 2) {
      return 0;
    }
    if (development_kernel != 3) {
      _check_internal_release_type_cold_1();
    }
  }
  else if (can_has_debugger != 3)
  {
    _check_internal_release_type_cold_1();
  }
  return 1;
}

uint64_t os_variant_has_internal_content()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if ((_BYTE)disabled_status) {
    return 0;
  }

  return _check_internal_release_type();
}

uint64_t dirstatat_np()
{
  MEMORY[0x270FA53B0]();
  uint64_t v44 = *MEMORY[0x263EF8C08];
  if (v2)
  {
    *__error() = 45;
    return 0xFFFFFFFFLL;
  }
  size_t v3 = v1;
  uint64_t v4 = v0;
  int v5 = openat_NOCANCEL();
  if (v5 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  size_t v36 = v3;
  v37 = v4;
  long long __src = 0uLL;
  v7 = (char **)_dirstat_fileid_set_create();
  v41 = 0;
  v42 = &v41;
  long long v39 = xmmword_20D89C6C0;
  uint64_t v40 = 1029;
  bzero(v43, 0x8000uLL);
  v8 = 0;
  int v9 = 0;
  do
  {
    if (v8)
    {
      v41 = (void *)*v8;
      if (!v41) {
        v42 = &v41;
      }
      v10 = (char *)v8[1];
      free(v8);
      int v11 = openat_NOCANCEL();
      if ((v11 & 0x80000000) == 0)
      {
        int v12 = v11;
        goto LABEL_10;
      }
      goto LABEL_55;
    }
    v10 = 0;
    int v12 = v6;
LABEL_10:
    while (1)
    {
      int v13 = getattrlistbulk(v12, &v39, v43, 0x8000uLL, 0);
      if (v13 == -1) {
        break;
      }
      int v14 = v13;
      if (!v13) {
        goto LABEL_53;
      }
      if (v13 >= 1)
      {
        int v15 = (unsigned int *)v43;
        while (1)
        {
          unsigned int v16 = v15[1];
          unint64_t v17 = (unint64_t)v15 + *v15;
          unsigned int v19 = v15[3];
          unsigned int v18 = v15[4];
          if ((v16 & 0x20000000) == 0) {
            break;
          }
          if (!v15[6])
          {
            v20 = (int *)(v15 + 7);
            if (v16)
            {
LABEL_21:
              if ((unint64_t)v20 + *v20 + v20[1] <= v17) {
                v21 = (char *)v20 + *v20;
              }
              else {
                v21 = 0;
              }
              v20 += 2;
              if ((v16 & 8) == 0)
              {
LABEL_25:
                int v22 = 0;
                if ((v16 & 0x2000000) == 0)
                {
LABEL_26:
                  v24 = 0;
LABEL_27:
                  if (v22 == 2)
                  {
                    if (((v19 & 2) == 0 || *v20) && v21)
                    {
                      v29 = malloc_type_malloc(0x10uLL, 0x30040E4270A41uLL);
                      v30 = v29;
                      if (v10)
                      {
                        asprintf((char **)v29 + 1, "%s/%s", v10, v21);
                        if (v30[1]) {
                          goto LABEL_38;
                        }
LABEL_50:
                        free(v30);
                      }
                      else
                      {
                        v32 = strdup(v21);
                        v30[1] = v32;
                        if (!v32) {
                          goto LABEL_50;
                        }
LABEL_38:
                        void *v30 = 0;
                        void *v42 = v30;
                        v42 = v30;
                      }
                    }
LABEL_46:
                    ++*((void *)&__src + 1);
                    goto LABEL_47;
                  }
                  if (v18)
                  {
                    int v31 = *v20++;
                    int v26 = v31;
                    if ((v18 & 4) == 0) {
                      goto LABEL_40;
                    }
LABEL_32:
                    uint64_t v28 = *(void *)v20;
                    v20 += 2;
                    uint64_t v27 = v28;
                    if ((v18 & 0x400) != 0)
                    {
LABEL_41:
                      if (!v27) {
                        uint64_t v27 = *(void *)v20;
                      }
                    }
                  }
                  else
                  {
                    int v26 = 0;
                    if ((v18 & 4) != 0) {
                      goto LABEL_32;
                    }
LABEL_40:
                    uint64_t v27 = 0;
                    if ((v18 & 0x400) != 0) {
                      goto LABEL_41;
                    }
                  }
                  if (v26 == 1 || !_dirstat_fileid_set_add(v7, v24)) {
                    *(void *)&long long __src = __src + v27;
                  }
                  goto LABEL_46;
                }
LABEL_18:
                v25 = *(char **)v20;
                v20 += 2;
                v24 = v25;
                goto LABEL_27;
              }
LABEL_17:
              int v23 = *v20++;
              int v22 = v23;
              if ((v16 & 0x2000000) == 0) {
                goto LABEL_26;
              }
              goto LABEL_18;
            }
LABEL_16:
            v21 = 0;
            if ((v16 & 8) == 0) {
              goto LABEL_25;
            }
            goto LABEL_17;
          }
LABEL_47:
          int v15 = (unsigned int *)v17;
          if (!--v14) {
            goto LABEL_10;
          }
        }
        v20 = (int *)(v15 + 6);
        if (v16) {
          goto LABEL_21;
        }
        goto LABEL_16;
      }
    }
    if (v12 == v6) {
      int v9 = *__error();
    }
LABEL_53:
    if (v10)
    {
      close_NOCANCEL();
LABEL_55:
      free(v10);
    }
    v8 = v41;
  }
  while (v41);
  _dirstat_fileid_set_destroy(v7);
  if (v9)
  {
    *__error() = v9;
    uint64_t v33 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v33 = 0;
  }
  int v34 = *__error();
  if (v36 < 0x10) {
    memcpy(v37, &__src, v36);
  }
  else {
    _OWORD *v37 = __src;
  }
  close_NOCANCEL();
  *__error() = v34;
  return v33;
}

void _dirstat_fileid_set_destroy(char **a1)
{
  unint64_t v2 = (unint64_t)a1[2];
  size_t v3 = *a1;
  if (v2)
  {
    for (unint64_t i = 0; i < v2; ++i)
    {
      int v5 = &v3[8 * i];
      int v6 = *(void **)v5;
      if (*(void *)v5)
      {
        do
        {
          *(void *)int v5 = *v6;
          free(v6);
          size_t v3 = *a1;
          int v5 = &(*a1)[8 * i];
          int v6 = *(void **)v5;
        }
        while (*(void *)v5);
        unint64_t v2 = (unint64_t)a1[2];
      }
    }
  }
  free(v3);

  free(a1);
}

void *_dirstat_fileid_set_create()
{
  int v0 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A0040EE89F85BuLL);
  v0[2] = 0x2000;
  size_t v1 = malloc_type_calloc(0x2000uLL, 8uLL, 0x2004093837F09uLL);
  *int v0 = v1;
  if (!v1)
  {
    free(v0);
    return 0;
  }
  return v0;
}

uint64_t _check_internal_release_type()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (internal_release_type == 2) {
    return 0;
  }
  if (internal_release_type != 3) {
    _check_internal_release_type_cold_1();
  }
  return 1;
}

uint64_t os_parse_boot_arg_string(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[0] = 0;
  sysctlbyname_get_data_np("kern.bootargs", v10, &v9);
  int v6 = (char *)v10[0];
  v10[0] = a1;
  v10[1] = a2;
  v10[2] = a3;
  uint64_t v11 = 0;
  _enum_boot_arg_values(v6, (uint64_t)v10, (uint64_t (*)(uint64_t, unsigned __int8 *, const char *, BOOL))_check_boot_arg_value);
  uint64_t v7 = BYTE1(v11);
  free(v6);
  return v7;
}

BOOL os_parse_boot_arg_int(char *a1, uint64_t *a2)
{
  v8 = 0;
  sysctlbyname_get_data_np("kern.bootargs", &v8, &v7);
  uint64_t v4 = v8;
  BOOL v5 = _parse_boot_arg_int(v8, a1, a2);
  free(v4);
  return v5;
}

uint64_t sysctlbyname_get_data_np(const char *a1, void *a2, size_t *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8C08];
  size_t v6 = 4;
  if (sysctlnametomib(a1, v7, &v6)) {
    return *__error();
  }
  else {
    return sysctl_get_data_np(v7, v6, a2, a3);
  }
}

uint64_t sysctl_get_data_np(int *a1, u_int a2, void *a3, size_t *a4)
{
  size_t size = 0;
  uint64_t v8 = 0;
  if (sysctl(a1, a2, 0, &size, 0, 0)
    || (uint64_t v8 = malloc_type_malloc(size, 0x78E5241DuLL)) == 0
    || sysctl(a1, a2, v8, &size, 0, 0))
  {
    uint64_t v9 = *__error();
    if (v9) {
      free(v8);
    }
  }
  else
  {
    uint64_t v9 = 0;
    *a3 = v8;
    *a4 = size;
  }
  return v9;
}

BOOL _parse_boot_arg_int(char *a1, char *a2, uint64_t *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8C08];
  *(void *)__str = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  v6[0] = a2;
  v6[1] = __str;
  long long v7 = xmmword_20D89C6E0;
  _enum_boot_arg_values(a1, (uint64_t)v6, (uint64_t (*)(uint64_t, unsigned __int8 *, const char *, BOOL))_check_boot_arg_value);
  BOOL result = BYTE9(v7) != 0;
  if (a3 && BYTE9(v7))
  {
    if (BYTE8(v7))
    {
      uint64_t v5 = 1;
LABEL_5:
      *a3 = v5;
      return 1;
    }
    v6[0] = 0;
    uint64_t v5 = strtoll(__str, v6, 0);
    BOOL result = 0;
    if (!*v6[0]) {
      goto LABEL_5;
    }
  }
  return result;
}

char *_enum_boot_arg_values(char *a1, uint64_t a2, uint64_t (*a3)(uint64_t, unsigned __int8 *, const char *, BOOL))
{
  __stringp = a1;
  do
  {
    BOOL result = strsep(&__stringp, " \t");
    if (!result) {
      break;
    }
    size_t v6 = (unsigned __int8 *)result;
    long long v7 = strchr(result, 61);
    int v8 = *v6;
    if (v8 == 45)
    {
      uint64_t v9 = 0;
    }
    else if (v7)
    {
      *long long v7 = 0;
      uint64_t v9 = v7 + 1;
    }
    else
    {
      uint64_t v9 = "1";
    }
    BOOL result = (char *)a3(a2, v6, v9, v8 == 45);
  }
  while ((result & 1) != 0);
  return result;
}

BOOL _check_boot_arg_value(uint64_t a1, const char *a2, const char *a3, int a4)
{
  if (!strcmp(*(const char **)a1, a2))
  {
    *(unsigned char *)(a1 + 25) = 1;
    *(unsigned char *)(a1 + 24) = a4;
    long long v7 = *(char **)(a1 + 8);
    if (v7)
    {
      if (a3) {
        int v8 = a4;
      }
      else {
        int v8 = 1;
      }
      if (v8) {
        uint64_t v9 = "";
      }
      else {
        uint64_t v9 = a3;
      }
      strlcpy(v7, v9, *(void *)(a1 + 16));
    }
  }
  return *(unsigned char *)(a1 + 25) == 0;
}

uint64_t os_variant_has_internal_diagnostics()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (BYTE1(disabled_status)) {
    return 0;
  }

  return _check_internal_release_type();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (is_ephemeral == 2) {
    return 0;
  }
  if (is_ephemeral != 3) {
    _check_internal_release_type_cold_1();
  }
  return 1;
}

uint64_t dirstat_np()
{
  return dirstatat_np();
}

uint64_t os_variant_is_recovery()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (recovery_release_type == 2) {
    return 0;
  }
  if (recovery_release_type != 3) {
    _check_internal_release_type_cold_1();
  }
  return 1;
}

uint64_t os_mach_msg_get_trailer(uint64_t a1)
{
  return a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL);
}

uint64_t os_mach_msg_get_audit_trailer(uint64_t a1)
{
  size_t v1 = (_DWORD *)(a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL));
  if (*v1) {
    return 0;
  }
  if (v1[1] <= 0x33u) {
    return 0;
  }
  return a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL);
}

uint64_t os_mach_msg_get_context_trailer(uint64_t a1)
{
  size_t v1 = (_DWORD *)(a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL));
  if (*v1) {
    return 0;
  }
  if (v1[1] <= 0x3Bu) {
    return 0;
  }
  return a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL);
}

void os_assert_mach_port_status(uint64_t a1, mach_port_name_t a2, int *a3)
{
  kern_return_t attributes;
  int v5;
  int v7;
  int v8;
  integer_t v9;
  int v10;
  integer_t v11;
  int v12;
  integer_t v13;
  int v14;
  integer_t v15;
  int v16;
  integer_t v17;
  int v18;
  integer_t v19;
  int v20;
  integer_t v21;
  int v22;
  integer_t v23;
  int v24;
  integer_t v25;
  int v26;
  integer_t v27;
  int v28;
  integer_t v29;
  int v30;
  integer_t v31;
  int v32;
  integer_t v33;
  int v34;
  integer_t v35;
  int v36;
  integer_t v37;
  int v38;
  integer_t v39;
  int v40;
  integer_t v41;
  int v42;
  integer_t v43;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out[4];
  long long v46;
  uint64_t v47;
  int v48;
  integer_t v49;
  __int16 v50;
  int v51;
  long long v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  uint64_t v57;

  v57 = *MEMORY[0x263EF8C08];
  v47 = 0;
  *(_OWORD *)port_info_out = 0u;
  v46 = 0u;
  port_info_outCnt = 10;
  attributes = mach_port_get_attributes(*MEMORY[0x263EF8C60], a2, 2, port_info_out, &port_info_outCnt);
  if (attributes) {
    os_assert_mach((int)"get status", attributes);
  }
  uint64_t v5 = *a3;
  if (*a3 != -1 && v5 != port_info_out[0])
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v24 = v5;
    v25 = port_info_out[0];
    os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v25;
    v50 = 1024;
    v51 = v24;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  long long v7 = a3[1];
  if (v7 != -1 && v7 != port_info_out[1])
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    int v26 = v7;
    uint64_t v27 = port_info_out[1];
    os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v27;
    v50 = 1024;
    v51 = v26;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_28:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    uint64_t v28 = v8;
    v29 = v9;
    os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v29;
    v50 = 1024;
    v51 = v28;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_29:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v30 = v10;
    int v31 = v11;
    os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v31;
    v50 = 1024;
    v51 = v30;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_30:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v32 = v12;
    uint64_t v33 = v13;
    os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v33;
    v50 = 1024;
    v51 = v32;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_31:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    int v34 = v14;
    v35 = v15;
    os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v35;
    v50 = 1024;
    v51 = v34;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
    goto LABEL_32;
  }
  int v8 = a3[2];
  if (v8 != -1)
  {
    uint64_t v9 = port_info_out[2];
    if (v8 != port_info_out[2]) {
      goto LABEL_28;
    }
  }
  uint64_t v10 = a3[3];
  if (v10 != -1)
  {
    uint64_t v11 = port_info_out[3];
    if (v10 != port_info_out[3]) {
      goto LABEL_29;
    }
  }
  int v12 = a3[4];
  if (v12 != -1)
  {
    int v13 = v46;
    if (v12 != v46) {
      goto LABEL_30;
    }
  }
  int v14 = a3[5];
  if (v14 != -1)
  {
    int v15 = DWORD1(v46);
    if (v14 != DWORD1(v46)) {
      goto LABEL_31;
    }
  }
  unsigned int v16 = a3[6];
  if (v16 != 0x7FFFFFFF)
  {
    unint64_t v17 = DWORD2(v46);
    if (v16 != DWORD2(v46)) {
      goto LABEL_33;
    }
  }
  unsigned int v18 = a3[7];
  if (v18 != 0x7FFFFFFF)
  {
    unsigned int v19 = HIDWORD(v46);
    if (v18 != HIDWORD(v46)) {
      goto LABEL_34;
    }
  }
  v20 = a3[8];
  if (v20 != 0x7FFFFFFF)
  {
    v21 = v47;
    if (v20 != v47) {
      goto LABEL_35;
    }
  }
  int v22 = a3[9];
  if (v22)
  {
    int v23 = HIDWORD(v47);
    if (v22 != HIDWORD(v47))
    {
LABEL_32:
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      size_t v36 = v22;
      v37 = v23;
      os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
      v48 = 67109376;
      v49 = v37;
      v50 = 1024;
      v51 = v36;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
LABEL_33:
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      v38 = v16;
      long long v39 = v17;
      os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
      v48 = 67109376;
      v49 = v39;
      v50 = 1024;
      v51 = v38;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
LABEL_34:
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      uint64_t v40 = v18;
      v41 = v19;
      os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
      v48 = 67109376;
      v49 = v41;
      v50 = 1024;
      v51 = v40;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
LABEL_35:
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      v42 = v20;
      v43 = v21;
      os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
      v48 = 67109376;
      v49 = v43;
      v50 = 1024;
      v51 = v42;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }
  }
}

double OUTLINED_FUNCTION_0()
{
  double result = 0.0;
  *(_OWORD *)(v0 - 96) = 0u;
  *(_OWORD *)(v0 - 80) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  *(_OWORD *)(v0 - 144) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, float a2)
{
  *(float *)(v3 - 176) = a2;
  *(void *)(v2 + 4) = result;
  return result;
}

BOOL OUTLINED_FUNCTION_7()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

double OUTLINED_FUNCTION_8()
{
  double result = 0.0;
  v0[3] = 0u;
  v0[4] = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  *(_OWORD *)(v1 - 144) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_10(int a1@<W8>, float a2@<S0>)
{
  *(float *)(v2 - 64) = a2;
  *(_DWORD *)(v2 - 60) = a1;
}

double OUTLINED_FUNCTION_12()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 64) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return _os_crash_msg();
}

uint64_t os_variant_allows_security_research()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (allows_security_research == 2) {
    return 0;
  }
  if (allows_security_research != 3) {
    _check_internal_release_type_cold_1();
  }
  return 1;
}

uint64_t os_variant_check(uint64_t a1, const char *a2)
{
  uint64_t v4 = "AllowsInternalSecurityPolicies";
  for (unint64_t i = &off_26C22C508; ; i += 2)
  {
    size_t v6 = strlen(v4);
    if (!strncasecmp(v4, a2, v6)) {
      break;
    }
    long long v7 = *i;
    uint64_t v4 = v7;
    if (!v7) {
      return 0;
    }
  }
  uint64_t v9 = (uint64_t (*)(uint64_t))*(i - 1);

  return v9(a1);
}

char *os_variant_copy_description(uint64_t a1)
{
  size_t v10 = 0;
  __bufp = 0;
  double result = (char *)open_memstream(&__bufp, &v10);
  if (result)
  {
    uint64_t v3 = (FILE *)result;
    char v4 = 0;
    uint64_t v5 = "AllowsInternalSecurityPolicies";
    size_t v6 = &off_26C22C508;
    do
    {
      if (((unsigned int (*)(uint64_t))*(v6 - 1))(a1))
      {
        if ((v4 & 1) != 0 && fputc(32, v3) == -1 || fputs(v5, v3) == -1)
        {
          int v8 = *__error();
          fclose(v3);
          goto LABEL_13;
        }
        char v4 = 1;
      }
      long long v7 = *v6;
      v6 += 2;
      uint64_t v5 = v7;
    }
    while (v7);
    if (fclose(v3) != -1) {
      return __bufp;
    }
    int v8 = *__error();
LABEL_13:
    free(__bufp);
    uint64_t v9 = __error();
    double result = 0;
    *uint64_t v9 = v8;
  }
  return result;
}

uint64_t os_variant_init_4launchd()
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  if (getpid() != 1) {
    os_variant_init_4launchd_cold_10(&v5, v6);
  }
  has_full_logging = 3;
  _parse_disabled_status();
  uint64_t v4 = 0;
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (!can_has_debugger) {
    os_variant_init_4launchd_cold_1(&v5, v6);
  }
  if (!is_ephemeral) {
    os_variant_init_4launchd_cold_2(&v5, v6);
  }
  if (!has_full_logging) {
    os_variant_init_4launchd_cold_3(&v5, v6);
  }
  if (!internal_release_type) {
    os_variant_init_4launchd_cold_4(&v5, v6);
  }
  if (!factory_release_type) {
    os_variant_init_4launchd_cold_5(&v5, v6);
  }
  if (!darwin_release_type) {
    os_variant_init_4launchd_cold_6(&v5, v6);
  }
  if (!recovery_release_type) {
    os_variant_init_4launchd_cold_7(&v5, v6);
  }
  if (!development_kernel) {
    os_variant_init_4launchd_cold_8(&v5, v6);
  }
  if (!allows_security_research) {
    os_variant_init_4launchd_cold_9(&v5, v6);
  }
  uint64_t v0 = 0;
  uint64_t v1 = (is_ephemeral << 14) | (4 * can_has_debugger) | (has_full_logging << 24) | (16 * internal_release_type) | (factory_release_type << 10) | (darwin_release_type << 12) | (recovery_release_type << 16) | (development_kernel << 20) | (allows_security_research << 26) | 0x70000000F0000000;
  do
  {
    if (*((unsigned char *)&disabled_status + v0)) {
      uint64_t v2 = 0x100000000 << v0;
    }
    else {
      uint64_t v2 = 0;
    }
    v1 |= v2;
    ++v0;
  }
  while (v0 != 4);
  uint64_t v4 = v1;
  return sysctlbyname("kern.osvariant_status", 0, 0, &v4, 8uLL);
}

void _parse_disabled_status()
{
  __stringp[10] = *(char **)MEMORY[0x263EF8C08];
  disabled_status = 0;
  if (!access("/var/db/disableAppleInternal", 0) || !access("/usr/share/misc/os_variant_override", 0))
  {
    file = (char *)_read_file((uint64_t)"/usr/share/misc/os_variant_override", 0);
    if (!file)
    {
      file = strdup("content,diagnostics,ui,security");
      if (!file) {
        _parse_disabled_status_cold_1(&v3, __stringp);
      }
    }
    __stringp[0] = file;
    uint64_t v1 = strsep(__stringp, ",\n");
    if (v1)
    {
      uint64_t v2 = v1;
      do
      {
        if (!strcmp(v2, "content"))
        {
          LOBYTE(disabled_status) = 1;
        }
        else if (!strcmp(v2, "diagnostics"))
        {
          BYTE1(disabled_status) = 1;
        }
        else if (!strcmp(v2, "ui"))
        {
          BYTE2(disabled_status) = 1;
        }
        else if (!strcmp(v2, "security"))
        {
          HIBYTE(disabled_status) = 1;
        }
        uint64_t v2 = strsep(__stringp, ",\n");
      }
      while (v2);
    }
    free(file);
  }
}

void *_read_file(uint64_t a1, unint64_t *a2)
{
  int v3 = open_NOCANCEL();
  if (v3 == -1) {
    return 0;
  }
  memset(&v9, 0, sizeof(v9));
  uint64_t v4 = 0;
  if (fstat(v3, &v9) || (st_size_t size = v9.st_size) == 0)
  {
LABEL_14:
    close_NOCANCEL();
    free(v4);
    return 0;
  }
  if (a2)
  {
    unint64_t v6 = *a2;
    if (!*a2) {
      unint64_t v6 = 1024;
    }
    *a2 = v9.st_size;
  }
  else
  {
    unint64_t v6 = 1024;
  }
  if (st_size > v6)
  {
    uint64_t v4 = 0;
    goto LABEL_14;
  }
  uint64_t v4 = malloc_type_malloc(st_size + 1, 0x5A98C297uLL);
  if (!v4) {
    goto LABEL_14;
  }
  uint64_t NOCANCEL = read_NOCANCEL();
  *((unsigned char *)v4 + st_size) = 0;
  if (NOCANCEL != st_size) {
    goto LABEL_14;
  }
  close_NOCANCEL();
  return v4;
}

uint64_t os_variant_has_full_logging()
{
  if (_initialize_status_once != -1) {
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  }
  if (has_full_logging == 2) {
    return 0;
  }
  if (has_full_logging != 3) {
    _check_internal_release_type_cold_1();
  }
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1_0(void *a1, _OWORD *a2)
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

BOOL OUTLINED_FUNCTION_3_0()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return _os_crash_msg();
}

uint64_t os_localtime_file(char *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  v5.tv_sec = 0;
  *(void *)&v5.tv_usec = 0;
  memset(&v4, 0, sizeof(v4));
  if (gettimeofday(&v5, 0) == -1) {
    os_localtime_file_cold_1(&v3, v6);
  }
  localtime_r(&v5.tv_sec, &v4);
  return snprintf(a1, 0x20uLL, "%d-%02d-%02d_%02d.%02d.%02d.%06d", v4.tm_year + 1900, v4.tm_mon + 1, v4.tm_mday, v4.tm_hour, v4.tm_min, v4.tm_sec, v5.tv_usec);
}

unint64_t os_simple_hash_string_with_seed(char *a1, uint64_t a2)
{
  size_t v4 = strlen(a1);

  return os_simple_hash_with_seed((unsigned __int8 *)a1, v4, a2);
}

unint64_t os_simple_hash_string(char *a1)
{
  size_t v2 = strlen(a1);

  return os_simple_hash_with_seed((unsigned __int8 *)a1, v2, 0);
}

uint64_t realpath_np()
{
  uint64_t result = fcntl_NOCANCEL();
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t memdup_np(void *a1, const void *a2, size_t size)
{
  unint64_t v6 = malloc_type_malloc(size, 0x22C6FF7FuLL);
  if (!v6) {
    return *__error();
  }
  uint64_t v7 = v6;
  memcpy(v6, a2, size);
  uint64_t result = 0;
  *a1 = v7;
  return result;
}

void *memdup2_np(const void *a1, size_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8C08];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      size_t v4 = malloc_type_malloc(a2, 0x2D5C015EuLL);
      if (v4) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    size_t v4 = malloc_type_malloc(a2, 0x18EC0261uLL);
    if (!v4) {
      memdup2_np_cold_1(&v6, v7);
    }
  }

  return memcpy(v4, a1, a2);
}

uint64_t os_subcommand_main(int a1, uint64_t a2)
{
  uint64_t v42 = 5242904;
  __endptr = 0;
  size_t v4 = getenv("COLUMNS");
  if (v4)
  {
    timeval v5 = v4;
    __int16 v6 = strtoul(v4, &__endptr, 0);
    if (__endptr != v5 && *__endptr) {
      LOWORD(v42) = v6;
    }
  }
  else
  {
    v41 = &v42;
    if (ioctl(0, 0x40087468uLL)) {
      LODWORD(v42) = 5242904;
    }
  }
  __ttys = v42;
  uint64_t v7 = _NSGetMachExecuteHeader();
  __endptr = 0;
  uint64_t v8 = getsectdatafromheader_64(v7, "__DATA_CONST", "__subcommands", (uint64_t *)&__endptr);
  unint64_t v9 = (unint64_t)&v8[_dyld_get_image_slide()];
  size_t v10 = _NSGetMachExecuteHeader();
  __endptr = 0;
  uint64_t v11 = getsectdatafromheader_64(v10, "__DATA_CONST", "__subcommands", (uint64_t *)&__endptr);
  if ((char *)v9 < &v11[_dyld_get_image_slide() + (void)__endptr])
  {
    while ((*(unsigned char *)(*(void *)v9 + 8) & 8) == 0)
    {
      v9 += 8;
      int v12 = _NSGetMachExecuteHeader();
      __endptr = 0;
      int v13 = getsectdatafromheader_64(v12, "__DATA_CONST", "__subcommands", (uint64_t *)&__endptr);
      if ((char *)v9 >= &v13[_dyld_get_image_slide() + (void)__endptr]) {
        goto LABEL_12;
      }
    }
    _main_cmd = *(_UNKNOWN **)v9;
  }
LABEL_12:
  if (_os_subcommand_be_helpful((uint64_t)_main_cmd, a1, a2))
  {
    _print_subcommand_list((FILE *)*MEMORY[0x263EF8C18]);
    return 0;
  }
  uint64_t result = (*((uint64_t (**)(void))_main_cmd + 9))();
  if (result == 64) {
    goto LABEL_25;
  }
  if (result) {
    return result;
  }
  uint64_t v20 = (int)*MEMORY[0x263EF8C28];
  BOOL v21 = __OFSUB__(a1, v20);
  uint64_t v22 = (a1 - v20);
  if (((int)v22 < 0) ^ v21 | (v22 == 0))
  {
    uint64_t v33 = (FILE *)*MEMORY[0x263EF8C10];
    int v34 = "please provide a subcommand";
LABEL_24:
    os_subcommand_fprintf(result, v33, v34, v15, v16, v17, v18, v19, (char)v41);
LABEL_25:
    _print_subcommand_list((FILE *)*MEMORY[0x263EF8C10]);
    return 64;
  }
  int v23 = (char **)(a2 + 8 * v20);
  v24 = *v23;
  uint64_t result = (uint64_t)_os_subcommand_find(*v23);
  if (!result)
  {
    uint64_t v33 = (FILE *)*MEMORY[0x263EF8C10];
    LOBYTE(v41) = (_BYTE)v24;
    int v34 = "unknown subcommand: %s";
    goto LABEL_24;
  }
  uint64_t v25 = result;
  uint64_t v26 = *(void *)(result + 8);
  if (v26)
  {
    uint64_t v27 = geteuid();
    if (v27)
    {
      os_subcommand_fprintf(v27, (FILE *)*MEMORY[0x263EF8C10], "subcommand requires root: %s", v28, v29, v30, v31, v32, (char)v24);
      return 77;
    }
    uint64_t v26 = *(void *)(v25 + 8);
  }
  if ((v26 & 2) != 0)
  {
    uint64_t v35 = isatty(1);
    if (!v35 || (uint64_t v35 = isatty(0), !v35))
    {
      os_subcommand_fprintf(v35, (FILE *)*MEMORY[0x263EF8C10], "subcommand requires a tty: %s", v36, v37, v38, v39, v40, (char)v24);
      return 69;
    }
  }
  if (_os_subcommand_be_helpful(v25, v22, (uint64_t)v23)) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char **))(v25 + 72))(v25, v22, v23);
  if (result == 64)
  {
    _os_subcommand_print_usage(v25, (FILE *)*MEMORY[0x263EF8C10]);
    return 64;
  }
  return result;
}

uint64_t _os_subcommand_be_helpful(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (a2 == 1 && (v4 & 0x10) != 0)
  {
LABEL_3:
    _os_subcommand_print_usage(a1, (FILE *)*MEMORY[0x263EF8C18]);
    return 1;
  }
  uint64_t result = 0;
  if (a2 == 2 && (v4 & 0x20) != 0)
  {
    __int16 v6 = *(const char **)(a3 + 8);
    if (strcmp(v6, "help") && strcmp(v6, "-h") && strcmp(v6, "-help") && strcmp(v6, "--help")) {
      return 0;
    }
    goto LABEL_3;
  }
  return result;
}

void _print_subcommand_list(FILE *a1)
{
  char v16 = 0;
  size_t v2 = _NSGetMachExecuteHeader();
  uint64_t size = 0;
  uint64_t v3 = getsectdatafromheader_64(v2, "__DATA_CONST", "__subcommands", &size);
  uint64_t v4 = (uint64_t *)&v3[_dyld_get_image_slide()];
  timeval v5 = _NSGetMachExecuteHeader();
  uint64_t size = 0;
  __int16 v6 = getsectdatafromheader_64(v5, "__DATA_CONST", "__subcommands", &size);
  if (v4 < (uint64_t *)&v6[_dyld_get_image_slide() + size])
  {
    do
    {
      uint64_t v12 = *v4;
      _print_header(a1, (char)"SUBCOMMANDS", &v16, v7, v8, v9, v10, v11, v15);
      if ((*(unsigned char *)(v12 + 8) & 0xC) == 0) {
        _os_subcommand_print_help_line(v12, a1);
      }
      ++v4;
      int v13 = _NSGetMachExecuteHeader();
      uint64_t size = 0;
      int v14 = getsectdatafromheader_64(v13, "__DATA_CONST", "__subcommands", &size);
    }
    while (v4 < (uint64_t *)&v14[_dyld_get_image_slide() + size]);
  }
  _os_subcommand_print_help_line((uint64_t)&__help_cmd, a1);
}

uint64_t os_subcommand_fprintf(uint64_t a1, FILE *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return vcrfprintf_np(a2, a3, &a9);
}

void *_os_subcommand_find(char *__s2)
{
  if (!__s2) {
    return _main_cmd;
  }
  if (!strcmp("help", __s2)) {
    return &__help_cmd;
  }
  size_t v2 = _NSGetMachExecuteHeader();
  uint64_t size = 0;
  uint64_t v3 = getsectdatafromheader_64(v2, "__DATA_CONST", "__subcommands", &size);
  uint64_t v4 = (uint64_t)&v3[_dyld_get_image_slide()];
  timeval v5 = _NSGetMachExecuteHeader();
  uint64_t size = 0;
  __int16 v6 = getsectdatafromheader_64(v5, "__DATA_CONST", "__subcommands", &size);
  uint64_t v7 = 0;
  if (v4 < (unint64_t)&v6[_dyld_get_image_slide() + size])
  {
    while (1)
    {
      uint64_t v7 = *(void *)v4;
      if ((*(unsigned char *)(*(void *)v4 + 8) & 8) == 0 && !strcmp(*(const char **)(v7 + 16), __s2)) {
        break;
      }
      v4 += 8;
      uint64_t v8 = _NSGetMachExecuteHeader();
      uint64_t size = 0;
      uint64_t v9 = getsectdatafromheader_64(v8, "__DATA_CONST", "__subcommands", &size);
      if (v4 >= (unint64_t)&v9[_dyld_get_image_slide() + size]) {
        return 0;
      }
    }
  }
  return (void *)v7;
}

void _os_subcommand_print_usage(uint64_t a1, FILE *a2)
{
  uint64_t v100 = *MEMORY[0x263EF8C08];
  char v95 = 0;
  char v94 = 1;
  v97 = 0;
  if (*(void *)(a1 + 56)) {
    uint64_t v4 = " [options]";
  }
  else {
    uint64_t v4 = "";
  }
  if (_main_cmd == (_UNKNOWN *)a1) {
    __str[0] = 0;
  }
  else {
    snprintf(__str, 0x40uLL, " %s", *(const char **)(a1 + 16));
  }
  timeval v5 = getprogname();
  if (asprintf(&v97, "%s%s%s", v5, __str, v4) < 0) {
    _os_subcommand_print_usage_cold_1(&v96, v98);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 8;
    uint64_t v12 = *(void *)(a1 + 48);
    do
    {
      if (*(unsigned char *)(v12 + v11)) {
        break;
      }
      int v13 = v97;
      int v14 = _os_subcommand_copy_option_spec_long(v9);
      if (asprintf(&v97, "%s %s", v97, v14) < 0) {
        _os_subcommand_print_usage_cold_1(&v96, v98);
      }
      ++v10;
      free(v14);
      free(v13);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v9 = v12 + 40 * v10;
      v11 += 40;
    }
    while (v12);
  }
  uint64_t v15 = *(void *)(a1 + 64);
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 8;
    uint64_t v18 = *(void *)(a1 + 64);
    do
    {
      uint64_t v19 = *(void *)(v18 + v17);
      if (v19) {
        break;
      }
      if ((v19 & 2) != 0) {
        uint64_t v20 = "]";
      }
      else {
        uint64_t v20 = ">";
      }
      if ((v19 & 2) != 0) {
        BOOL v21 = "[";
      }
      else {
        BOOL v21 = "<";
      }
      uint64_t v22 = v97;
      int v23 = _os_subcommand_copy_option_spec_long(v15);
      if (asprintf(&v97, "%s %s%s%s", v97, v21, v23, v20) < 0) {
        _os_subcommand_print_usage_cold_1(&v96, v98);
      }
      ++v16;
      free(v23);
      free(v22);
      uint64_t v18 = *(void *)(a1 + 64);
      uint64_t v15 = v18 + 40 * v16;
      v17 += 40;
    }
    while (v18);
  }
  if ((_UNKNOWN *)a1 != &__main_cmd && _main_cmd == (_UNKNOWN *)a1)
  {
    v24 = v97;
    uint64_t v25 = _os_subcommand_copy_option_spec_long((uint64_t)&_main_positional);
    if (asprintf(&v97, "%s <%s>", v97, v25) < 0) {
      _os_subcommand_print_usage_cold_1(&v96, v98);
    }
    free(v25);
    free(v24);
  }
  uint64_t v26 = v97;
  wfprintf_np(a2, 0, 4uLL, WORD1(__ttys), "USAGE:", v6, v7, v8, v91);
  crfprintf_np(a2, "", v27, v28, v29, v30, v31, v32, v92);
  wfprintf_np(a2, 4, 4uLL, WORD1(__ttys), "%s", v33, v34, v35, (char)v26);
  if (*(void *)(a1 + 80))
  {
    _print_header(a2, (char)"DESCRIPTION", 0, v37, v38, v39, v40, v41, v93);
    wfprintf_np(a2, 4, 4uLL, WORD1(__ttys), "%s", v42, v43, v44, *(void *)(a1 + 80));
  }
  else if (*(void *)(a1 + 24))
  {
    crfprintf_np(a2, "", v36, v37, v38, v39, v40, v41, v93);
    wfprintf_np(a2, 0, 4uLL, WORD1(__ttys), "DESCRIPTION: %s", v45, v46, v47, *(void *)(a1 + 24));
  }
  uint64_t v48 = *(void *)(a1 + 48);
  if (v48)
  {
    uint64_t v49 = 0;
    uint64_t v50 = 8;
    uint64_t v51 = *(void *)(a1 + 48);
    do
    {
      if (*(unsigned char *)(v51 + v50)) {
        break;
      }
      ++v49;
      _print_header(a2, (char)"REQUIRED", &v95, v37, v38, v39, v40, v41, v93);
      _os_subcommand_print_option_usage(v48, a2, &v94, v52, v53, v54, v55, v56);
      uint64_t v51 = *(void *)(a1 + 48);
      uint64_t v48 = v51 + 40 * v49;
      v50 += 40;
    }
    while (v51);
    uint64_t v57 = *(void *)(a1 + 64);
  }
  else
  {
    uint64_t v57 = *(void *)(a1 + 64);
    if (!v57 && _main_cmd != (_UNKNOWN *)a1) {
      goto LABEL_48;
    }
  }
  if (v57)
  {
    uint64_t v58 = 0;
    uint64_t v59 = 8;
    uint64_t v60 = v57;
    do
    {
      uint64_t v61 = *(void *)(v57 + v59);
      if (v61) {
        break;
      }
      if ((v61 & 2) == 0)
      {
        _print_header(a2, (char)"REQUIRED", &v95, v37, v38, v39, v40, v41, v93);
        _os_subcommand_print_option_usage(v60, a2, &v94, v62, v63, v64, v65, v66);
        uint64_t v57 = *(void *)(a1 + 64);
      }
      ++v58;
      uint64_t v60 = v57 + 40 * v58;
      v59 += 40;
    }
    while (v57);
  }
  if ((_UNKNOWN *)a1 != &__main_cmd && _main_cmd == (_UNKNOWN *)a1)
  {
    _print_header(a2, (char)"REQUIRED", &v95, v37, v38, v39, v40, v41, v93);
    _os_subcommand_print_option_usage((uint64_t)&_main_positional, a2, &v94, v67, v68, v69, v70, v71);
  }
LABEL_48:
  char v95 = 0;
  char v94 = 1;
  uint64_t v72 = *(void *)(a1 + 56);
  if (v72)
  {
    uint64_t v73 = 0;
    uint64_t v74 = 8;
    uint64_t v75 = *(void *)(a1 + 56);
    do
    {
      if (*(unsigned char *)(v75 + v74)) {
        break;
      }
      ++v73;
      _print_header(a2, (char)"OPTIONAL", &v95, v37, v38, v39, v40, v41, v93);
      _os_subcommand_print_option_usage(v72, a2, &v94, v76, v77, v78, v79, v80);
      uint64_t v75 = *(void *)(a1 + 56);
      uint64_t v72 = v75 + 40 * v73;
      v74 += 40;
    }
    while (v75);
  }
  uint64_t v81 = *(void *)(a1 + 64);
  if (v81)
  {
    uint64_t v82 = 0;
    uint64_t v83 = 8;
    uint64_t v84 = *(void *)(a1 + 64);
    do
    {
      uint64_t v85 = *(void *)(v81 + v83);
      if (v85) {
        break;
      }
      if ((v85 & 2) != 0)
      {
        _print_header(a2, (char)"OPTIONAL", &v95, v37, v38, v39, v40, v41, v93);
        _os_subcommand_print_option_usage(v84, a2, &v94, v86, v87, v88, v89, v90);
        uint64_t v81 = *(void *)(a1 + 64);
      }
      ++v82;
      uint64_t v84 = v81 + 40 * v82;
      v83 += 40;
    }
    while (v81);
  }
  free(v26);
}

uint64_t os_subcommand_vfprintf(uint64_t a1, FILE *a2, const char *a3, va_list a4)
{
  if (!a1 || (*(unsigned char *)(a1 + 8) & 8) != 0)
  {
    getprogname();
    fprintf(a2, "%s: ");
  }
  else
  {
    getprogname();
    fprintf(a2, "%s-%s: ");
  }

  return vcrfprintf_np(a2, a3, a4);
}

uint64_t _main_invoke()
{
  return 0;
}

FILE *_print_header(FILE *result, char a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = result;
  if (a3)
  {
    if (!*a3)
    {
      crfprintf_np(result, "", (uint64_t)a3, a4, a5, a6, a7, a8, v36);
      crfprintf_np(v10, "%s:", v12, v13, v14, v15, v16, v17, a2);
      uint64_t result = (FILE *)crfprintf_np(v10, "", v18, v19, v20, v21, v22, v23, v37);
      *a3 = 1;
    }
  }
  else
  {
    crfprintf_np(result, "", 0, a4, a5, a6, a7, a8, v36);
    crfprintf_np(v10, "%s:", v24, v25, v26, v27, v28, v29, a2);
    return (FILE *)crfprintf_np(v10, "", v30, v31, v32, v33, v34, v35, a9);
  }
  return result;
}

void _os_subcommand_print_help_line(uint64_t a1, FILE *a2)
{
  fprintf(a2, "    %-8s    ", *(const char **)(a1 + 16));
  if (strlen(*(const char **)(a1 + 16)) < 0xC)
  {
    int64_t v10 = -16;
  }
  else
  {
    crfprintf_np(a2, "", v4, v5, v6, v7, v8, v9, v11);
    int64_t v10 = 16;
  }
  wfprintf_np(a2, v10, 0x10uLL, WORD1(__ttys), "%s", v7, v8, v9, *(void *)(a1 + 24));
}

uint64_t _help_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 < 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(char **)(a3 + 8);
  }
  uint64_t v4 = (FILE *)*MEMORY[0x263EF8C18];
  uint64_t v5 = _os_subcommand_find(v3);
  uint64_t v6 = v5;
  uint64_t v7 = (FILE **)MEMORY[0x263EF8C10];
  if (v5)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v5;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8C10], "unrecognized subcommand: %s\n", v3);
    uint64_t v9 = _main_cmd;
    uint64_t v8 = 69;
  }
  if (v6) {
    int64_t v10 = v4;
  }
  else {
    int64_t v10 = *v7;
  }
  _os_subcommand_print_usage((uint64_t)v9, v10);
  if (v9 == _main_cmd) {
    _print_subcommand_list(v10);
  }
  return v8;
}

void _os_subcommand_print_option_usage(uint64_t a1, FILE *a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = *MEMORY[0x263EF8C08];
  if (!*a3) {
    crfprintf_np(a2, "", (uint64_t)a3, a4, a5, a6, a7, a8, v22);
  }
  char v11 = _os_subcommand_copy_option_spec_long(a1);
  uint64_t v12 = v11;
  uint64_t v25 = v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    if (asprintf(&v25, "-%c | %s", *(unsigned int *)(v13 + 24), v11) < 0) {
      _os_subcommand_print_usage_cold_1(&v24, v26);
    }
    uint64_t v14 = v25;
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v12 = 0;
  }
  free(v12);
  fprintf(a2, "    %-8s    ", v14);
  if (strlen(v14) < 0xC)
  {
    int64_t v21 = -16;
  }
  else
  {
    crfprintf_np(a2, "", v15, v16, v17, v18, v19, v20, v23);
    int64_t v21 = 16;
  }
  wfprintf_np(a2, v21, 0x10uLL, WORD1(__ttys), "%s", v18, v19, v20, *(void *)(a1 + 32));
  *a3 = 0;
  free(v14);
}

char *_os_subcommand_copy_option_spec_long(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8C08];
  uint64_t v2 = *(void *)(a1 + 16);
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)__str = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)uint64_t v9 = 0u;
  long long v10 = 0u;
  uint64_t v7 = 0;
  if (v2)
  {
    snprintf(__str, 0x40uLL, "--%s", *(const char **)v2);
    int v3 = *(_DWORD *)(v2 + 8);
    if (v3)
    {
      if (v3 == 2) {
        snprintf(v9, 0x40uLL, "[=%s]");
      }
      else {
        snprintf(v9, 0x40uLL, "=<%s>");
      }
    }
    if ((*(unsigned char *)(a1 + 8) & 4) == 0)
    {
      uint64_t v4 = v9;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = __str;
    snprintf(__str, 0x40uLL, "%s", *(const char **)(a1 + 24));
    if ((*(unsigned char *)(a1 + 8) & 4) == 0) {
LABEL_10:
    }
      _stoupper(v4);
  }
  if (asprintf(&v7, "%s%s", __str, v9) < 0) {
    _os_subcommand_print_usage_cold_1(&v6, v8);
  }
  return v7;
}

size_t _stoupper(const char *a1)
{
  uint64_t v1 = (char *)a1;
  size_t result = strlen(a1);
  if (result)
  {
    size_t v3 = result;
    do
    {
      size_t result = ___toupper(*v1);
      *v1++ = result;
      --v3;
    }
    while (v3);
  }
  return result;
}

double OUTLINED_FUNCTION_0_1(void *a1, _OWORD *a2)
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

uint64_t OUTLINED_FUNCTION_1_1()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_3_1()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return _os_crash_msg();
}

uint64_t fcheck_np(FILE *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == a3) {
    return 0;
  }
  if (feof(a1)) {
    return 0xFFFFFFFFLL;
  }
  ferror(a1);
  return 1;
}

uint64_t dup_np(int a1)
{
  uint64_t v6 = *MEMORY[0x263EF8C08];
  while (1)
  {
    uint64_t result = dup(a1);
    if ((result & 0x80000000) == 0) {
      break;
    }
    int v3 = *__error();
    if (v3 != 4)
    {
      if ((v3 - 23) < 2) {
        dup_np_cold_3();
      }
      if (v3 == 9) {
        dup_np_cold_2();
      }
      dup_np_cold_1(&v4, v5);
    }
  }
  return result;
}

uint64_t claimfd_np(_DWORD *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  uint64_t v3 = *a1;
  if (a2 && change_fdguard_np()) {
    claimfd_np_cold_1(&v5, v6);
  }
  *a1 = -1;
  return v3;
}

uint64_t xferfd_np(_DWORD *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8C08];
  uint64_t v2 = *a1;
  if (change_fdguard_np()) {
    claimfd_np_cold_1(&v4, v5);
  }
  *a1 = -1;
  return v2;
}

uint64_t close_drop_np(_DWORD *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8C08];
  if (a2) {
    uint64_t result = guarded_close_np();
  }
  else {
    uint64_t result = close_NOCANCEL();
  }
  if (result == -1) {
    close_drop_np_cold_1(&v4, v5);
  }
  *a1 = -1;
  return result;
}

_DWORD *close_drop_optional_np(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) == 0) {
    return (_DWORD *)close_drop_np(a1, a2);
  }
  return a1;
}

uint64_t zsnprintf_np(char *a1, size_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = vsnprintf(a1, a2, a3, &a9);
  if (v10 >= a2) {
    int v11 = a2 - 1;
  }
  else {
    int v11 = v10;
  }
  if (v10 < 0) {
    return 0;
  }
  return v11;
}

uint64_t crfprintf_np(FILE *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return fputc(10, a1);
}

uint64_t vcrfprintf_np(FILE *a1, const char *a2, va_list a3)
{
  vfprintf(a1, a2, a3);

  return fputc(10, a1);
}

void wfprintf_np(FILE *a1, int64_t a2, size_t a3, unint64_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void vwfprintf_np(FILE *a1, int64_t a2, size_t a3, unint64_t a4, char *a5, va_list a6)
{
  uint64_t v27 = 0;
  if (a2 >= 0) {
    unint64_t v6 = a2;
  }
  else {
    unint64_t v6 = -a2;
  }
  size_t v26 = v6;
  if (a4 - 1 < a3) {
    vwfprintf_np_cold_1();
  }
  if (a2 >= 1 && a4 && v6 >= a4) {
    vwfprintf_np_cold_3();
  }
  if (a2 < 0 && a4 && v6 >= a4) {
    vwfprintf_np_cold_2();
  }
  unsigned int v10 = vasprintf(&v27, a5, a6);
  int v11 = 0;
  if ((v10 & 0x80000000) != 0)
  {
    uint64_t v13 = 0;
    long long v14 = 0;
    goto LABEL_39;
  }
  long long v12 = v27;
  uint64_t v13 = 0;
  long long v14 = 0;
  if (v27)
  {
    unint64_t v15 = v10;
    int v11 = (char *)malloc_type_malloc(v10 + 1, 0x92326105uLL);
    if (v11)
    {
      long long v16 = (char *)malloc_type_malloc(v26 + 1, 0x432809DCuLL);
      uint64_t v13 = v16;
      if (v16)
      {
        uint64_t v17 = v16;
        if ((a2 & 0x8000000000000000) == 0)
        {
          memset(v16, 32, a2);
          uint64_t v17 = &v13[a2];
        }
        *uint64_t v17 = 0;
        uint64_t v18 = (char *)malloc_type_malloc(a3 + 1, 0x686005C4uLL);
        long long v14 = v18;
        if (v18)
        {
          memset(v18, 32, a3);
          v14[a3] = 0;
          do
          {
            size_t v19 = v26;
            if (v12 == v27)
            {
              uint64_t v20 = v13;
            }
            else
            {
              size_t v19 = a3;
              uint64_t v20 = v14;
            }
            unint64_t v21 = a4 - v19;
            if (a4 - v19 >= v15) {
              int64_t v22 = v15;
            }
            else {
              int64_t v22 = a4 - v19;
            }
            if (a4) {
              int64_t v23 = v22;
            }
            else {
              int64_t v23 = v15;
            }
            strlcpy(v11, v12, v23 + 1);
            uint64_t v24 = strchr(v11, 10);
            if (!v24 && a4 && v21 < v15) {
              uint64_t v24 = strrchr(v11, 32);
            }
            if (v24)
            {
              char *v24 = 0;
              int64_t v23 = v24 - v11;
              v12 += v24 - v11 + 1;
            }
            fprintf(a1, "%s%s\n", v20, v11);
            v15 -= v23;
          }
          while (v15);
        }
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    long long v14 = 0;
  }
LABEL_39:
  free(v14);
  free(v13);
  free(v11);
  free(v27);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return _os_log_send_and_compose_impl();
}

uint64_t os_crash_set_reporter_port(host_priv_t a1, unsigned int a2, mach_port_t a3)
{
  if ((a2 & 8) != 0) {
    exception_mask_t v6 = (a2 << 11) & 0x1000 | (((a2 >> 2) & 1) << 11) | 0x2000;
  }
  else {
    exception_mask_t v6 = (a2 << 11) & 0x1000 | ((a2 & 1) << 10) & 0xF7FF | (((a2 >> 2) & 1) << 11);
  }
  mach_port_t port = 0;
  host_priv_t v7 = MEMORY[0x21055EF20]();
  uint64_t special_port = host_get_special_port(v7, -1, 2, &port);
  if (!a2) {
    return 0;
  }
  if (MEMORY[0x21055EF20](special_port) == a1 || port == a1) {
    return host_set_exception_ports(a1, v6, a3, -2147483645, 1);
  }
  return task_set_exception_ports(a1, v6, a3, -2147483645, 1);
}

uint64_t os_crash_get_reporter_port_array(task_t a1, _OWORD *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8C08];
  *(void *)mach_port_t port = 0;
  host_priv_t v4 = MEMORY[0x21055EF20]();
  uint64_t special_port = host_get_special_port(v4, -1, 2, port);
  if (MEMORY[0x21055EF20](special_port) == a1 || port[0] == a1)
  {
    host_priv_t v7 = MEMORY[0x21055EF20]();
    uint64_t exception_ports = host_get_exception_ports(v7, 0x3C00u, masks, &port[1], old_handlers, old_behaviors, old_flavors);
  }
  else
  {
    uint64_t exception_ports = task_get_exception_ports(a1, 0x3C00u, masks, &port[1], old_handlers, old_behaviors, old_flavors);
  }
  uint64_t v8 = exception_ports;
  if (!exception_ports)
  {
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
    if (!port[1]) {
      return 0;
    }
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    long long v12 = (ipc_space_t *)MEMORY[0x263EF8C60];
    do
    {
      exception_mask_t v13 = masks[v11];
      if ((v13 & 0x400) != 0)
      {
        uint64_t v17 = (_DWORD *)a2 + 2 * v10;
        mach_port_name_t v18 = old_handlers[v11];
        *uint64_t v17 = 1;
        v17[1] = v18;
        if (mach_port_mod_refs(*v12, v18, 0, 1)) {
          int v19 = -1;
        }
        else {
          int v19 = v18;
        }
        v17[1] = v19;
        ++v10;
        exception_mask_t v13 = masks[v11];
        if ((v13 & 0x1000) == 0)
        {
LABEL_11:
          if ((v13 & 0x800) == 0) {
            goto LABEL_12;
          }
          goto LABEL_29;
        }
      }
      else if ((v13 & 0x1000) == 0)
      {
        goto LABEL_11;
      }
      uint64_t v20 = (_DWORD *)a2 + 2 * v10;
      mach_port_name_t v21 = old_handlers[v11];
      _DWORD *v20 = 2;
      v20[1] = v21;
      if (mach_port_mod_refs(*v12, v21, 0, 1)) {
        int v22 = -1;
      }
      else {
        int v22 = v21;
      }
      v20[1] = v22;
      ++v10;
      exception_mask_t v13 = masks[v11];
      if ((v13 & 0x800) == 0)
      {
LABEL_12:
        if ((v13 & 0x2000) == 0) {
          goto LABEL_17;
        }
LABEL_13:
        long long v14 = (_DWORD *)a2 + 2 * v10;
        mach_port_name_t v15 = old_handlers[v11];
        _DWORD *v14 = 4;
        v14[1] = v15;
        if (mach_port_mod_refs(*v12, v15, 0, 1)) {
          int v16 = -1;
        }
        else {
          int v16 = v15;
        }
        v14[1] = v16;
        ++v10;
        goto LABEL_17;
      }
LABEL_29:
      int64_t v23 = (_DWORD *)a2 + 2 * v10;
      mach_port_name_t v24 = old_handlers[v11];
      *int64_t v23 = 3;
      v23[1] = v24;
      if (mach_port_mod_refs(*v12, v24, 0, 1)) {
        int v25 = -1;
      }
      else {
        int v25 = v24;
      }
      v23[1] = v25;
      ++v10;
      if ((masks[v11] & 0x2000) != 0) {
        goto LABEL_13;
      }
LABEL_17:
      uint64_t v8 = mach_port_deallocate(*v12, old_handlers[v11]);
      if (v8) {
        os_assert_mach((int)"deallocate port", v8);
      }
      ++v11;
    }
    while (v11 < port[1]);
  }
  return v8;
}

void os_crash_port_array_deallocate(uint64_t a1)
{
  kern_return_t v5;

  uint64_t v1 = 0;
  uint64_t v2 = a1 + 4;
  uint64_t v3 = (ipc_space_t *)MEMORY[0x263EF8C60];
  do
  {
    mach_port_name_t v4 = *(_DWORD *)(v2 + v1);
    if (v4 + 1 >= 2)
    {
      uint64_t v5 = mach_port_deallocate(*v3, v4);
      if (v5) {
        os_assert_mach((int)"deallocate port", v5);
      }
    }
    v1 += 8;
  }
  while (v1 != 128);
}

uint64_t os_crash_spawnattr_set_reporter_port(posix_spawnattr_t *a1, unsigned int a2, mach_port_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  exception_mask_t v3 = (a2 << 11) & 0x1000 | (((a2 >> 2) & 1) << 11) | 0x2000;
  if ((a2 & 8) == 0) {
    exception_mask_t v3 = (a2 << 11) & 0x1000 | ((a2 & 1) << 10) & 0xF7FF | (((a2 >> 2) & 1) << 11);
  }
  if (a3 - 1 > 0xFFFFFFFD) {
    return 15;
  }
  if (!a2) {
    return 0;
  }
  uint64_t result = posix_spawnattr_setexceptionports_np(a1, v3, a3, -2147483645, 1);
  if (result) {
    os_crash_spawnattr_set_reporter_port_cold_1(&v5, v6);
  }
  return result;
}

uint64_t __os_temporary_resource_shortage()
{
  uint64_t v0 = sleep_NOCANCEL();

  return MEMORY[0x270EDCF18](v0);
}

uint64_t _print_preamble(FILE *a1, const char *a2, va_list a3)
{
  exception_mask_t v6 = getprogname();
  fprintf(a1, "%s: ", v6);

  return vfprintf(a1, a2, a3);
}

BOOL os_parse_boot_arg_from_buffer_int(const char *a1, char *a2, uint64_t *a3)
{
  uint64_t v5 = strdup(a1);
  BOOL v6 = _parse_boot_arg_int(v5, a2, a3);
  free(v5);
  return v6;
}

uint64_t os_parse_boot_arg_from_buffer_string(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = strdup(a1);
  v10[0] = a2;
  v10[1] = a3;
  v10[2] = a4;
  uint64_t v11 = 0;
  _enum_boot_arg_values(v7, (uint64_t)v10, (uint64_t (*)(uint64_t, unsigned __int8 *, const char *, BOOL))_check_boot_arg_value);
  uint64_t v8 = BYTE1(v11);
  free(v7);
  return v8;
}

BOOL os_boot_arg_string_to_int(const char *a1, uint64_t *a2)
{
  __endptr = 0;
  uint64_t v3 = strtoll(a1, &__endptr, 0);
  int v4 = *__endptr;
  if (!*__endptr) {
    *a2 = v3;
  }
  return v4 == 0;
}

void os_enumerate_boot_args(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned __int8 *, const char *, BOOL))
{
  BOOL v6 = 0;
  sysctlbyname_get_data_np("kern.bootargs", &v6, &v5);
  int v4 = v6;
  _enum_boot_arg_values(v6, a1, a2);

  free(v4);
}

void os_enumerate_boot_args_from_buffer(const char *a1, uint64_t a2, uint64_t (*a3)(uint64_t, unsigned __int8 *, const char *, BOOL))
{
  size_t v5 = strdup(a1);
  _enum_boot_arg_values(v5, a2, a3);

  free(v5);
}

void os_enumerate_boot_args_b(uint64_t a1)
{
  __s1 = 0;
  sysctlbyname_get_data_np("kern.bootargs", &__s1, &v4);
  uint64_t v2 = __s1;
  uint64_t v3 = strdup(__s1);
  _enum_boot_arg_values(v3, a1, (uint64_t (*)(uint64_t, unsigned __int8 *, const char *, BOOL))_visit_boot_args_enumerator_block);
  free(v3);

  free(v2);
}

uint64_t _visit_boot_args_enumerator_block(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void os_enumerate_boot_args_from_buffer_b(const char *a1, uint64_t a2)
{
  uint64_t v3 = strdup(a1);
  _enum_boot_arg_values(v3, a2, (uint64_t (*)(uint64_t, unsigned __int8 *, const char *, BOOL))_visit_boot_args_enumerator_block);

  free(v3);
}

BOOL _dirstat_fileid_set_add(char **a1, char *a2)
{
  size_t v4 = (size_t)a1[2];
  if ((unint64_t)a1[3] > 10 * v4 && !*((unsigned char *)a1 + 32))
  {
    v4 *= 2;
    size_t v5 = (char *)malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
    if (v5) {
      goto LABEL_4;
    }
    exception_mask_t v13 = (char **)a1[1];
    if (!v13) {
      goto LABEL_16;
    }
    do
    {
      a1[1] = *v13;
      free(v13);
      exception_mask_t v13 = (char **)a1[1];
    }
    while (v13);
    size_t v5 = (char *)malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
    if (v5)
    {
LABEL_4:
      BOOL v6 = a1[2];
      uint64_t v7 = *a1;
      if (v6)
      {
        for (unint64_t i = 0; i != v6; ++i)
        {
          uint64_t v9 = &v7[8 * (void)i];
          uint64_t v10 = *(void **)v9;
          if (*(void *)v9)
          {
            uint64_t v11 = (int)((unint64_t)a2 % v4);
            do
            {
              *(void *)uint64_t v9 = *v10;
              uint64_t v12 = *(void *)&v5[8 * v11];
              if (v12)
              {
                *(void *)(v12 + 8) = v10;
                uint64_t v12 = *(void *)&v5[8 * v11];
              }
              void *v10 = v12;
              v10[1] = 0;
              *(void *)&v5[8 * v11] = v10;
              uint64_t v7 = *a1;
              uint64_t v9 = &(*a1)[8 * (void)i];
              uint64_t v10 = *(void **)v9;
            }
            while (*(void *)v9);
          }
        }
      }
      free(v7);
      *a1 = v5;
      a1[2] = (char *)v4;
    }
    else
    {
LABEL_16:
      *((unsigned char *)a1 + 32) = 1;
      size_t v4 = (size_t)a1[2];
    }
  }
  long long v14 = *a1;
  uint64_t v15 = (int)((unint64_t)a2 % v4);
  int v16 = &(*a1)[(uint64_t)(((unint64_t)a2 % v4) << 32) >> 29];
  while (1)
  {
    int v16 = *(char **)v16;
    if (!v16) {
      break;
    }
    if (*((char **)v16 + 2) == a2) {
      return v16 != 0;
    }
  }
  if (!*((unsigned char *)a1 + 32))
  {
    uint64_t v17 = (char **)a1[1];
    if (v17)
    {
      a1[1] = *v17;
    }
    else
    {
      uint64_t v17 = (char **)malloc_type_malloc(0x18uLL, 0x102004062D53EE8uLL);
      if (!v17)
      {
        *((unsigned char *)a1 + 32) = 1;
        return v16 != 0;
      }
      long long v14 = *a1;
    }
    v17[2] = a2;
    ++a1[3];
    *uint64_t v17 = *(char **)&v14[8 * v15];
    v17[1] = 0;
    uint64_t v18 = *(void *)&v14[8 * v15];
    if (v18) {
      *(void *)(v18 + 8) = v17;
    }
    *(void *)&v14[8 * v15] = v17;
  }
  return v16 != 0;
}

uint64_t sysexit_np(int a1)
{
  uint64_t v1 = (unsigned int *)&_negative_one;
  uint64_t v2 = (a1 - 200);
  uint64_t v3 = (char *)&unk_26411C108;
  if (a1 <= 0x6A) {
    uint64_t v3 = (char *)&_posix_errors + 32 * a1;
  }
  if (v2 <= 0x16) {
    size_t v4 = (char *)&_darwin_errors + 32 * v2;
  }
  else {
    size_t v4 = v3;
  }
  if (a1 >= 0) {
    uint64_t v1 = (unsigned int *)v4;
  }
  return v1[1];
}

char *os_flagset_copy_string(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8C08];
  bzero(&v21, 0x3FAuLL);
  qmemcpy(__s1, "[none]", sizeof(__s1));
  if (a1)
  {
    uint64_t v9 = (uint64_t *)(a1 + 8);
    uint64_t v10 = __s1;
    unint64_t v11 = -1;
    size_t v12 = 1024;
    do
    {
      uint64_t v13 = *(v9 - 1);
      if (!v13) {
        break;
      }
      if ((v13 & a2) != 0)
      {
        uint64_t v14 = *v9;
        uint64_t v15 = __s1;
        if (v10 != __s1)
        {
          uint64_t v16 = zsnprintf_np(v10, v12, "%s", v4, v5, v6, v7, v8, (char)"|");
          uint64_t v15 = &v10[v16];
          v12 -= v16;
        }
        uint64_t v17 = zsnprintf_np(v15, v12, "%s", v4, v5, v6, v7, v8, v14);
        uint64_t v10 = &v15[v17];
        v12 -= v17;
      }
      v9 += 2;
      ++v11;
    }
    while (v11 < 0x3F);
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t result = strdup(__s1);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t result = strdup(__s1);
    if (!result) {
      os_flagset_copy_string_cold_1(__s1, &v19, v22);
    }
  }
  return result;
}

char *os_mach_msg_copy_description(unsigned int *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8C08];
  unint64_t v2 = *a1;
  uint64_t v3 = (v2 >> 8) & 0x1F;
  unint64_t v4 = v2 & 0x1F;
  uint64_t v5 = (v2 >> 16) & 0x1F;
  if ((v3 - 27) >= 0xFFFFFFF5) {
    uint64_t v6 = (const char *)_mach_port_dispositions[2 * v3 + 1];
  }
  else {
    uint64_t v6 = "[invalid]";
  }
  if ((v4 - 27) >= 0xFFFFFFF5) {
    uint64_t v7 = (const char *)_mach_port_dispositions[2 * v4 + 1];
  }
  else {
    uint64_t v7 = "[invalid]";
  }
  if ((v5 - 27) >= 0xFFFFFFF5) {
    uint64_t v8 = (const char *)_mach_port_dispositions[2 * v5 + 1];
  }
  else {
    uint64_t v8 = "[invalid]";
  }
  uint64_t v14 = 0;
  if ((v2 & 0x80000000) != 0) {
    unsigned int v9 = a1[6];
  }
  else {
    unsigned int v9 = 0;
  }
  uint64_t v10 = os_flagset_copy_string((uint64_t)&_mach_msgh_bits, v2);
  if (asprintf(&v14, "id = %#x, uint64_t size = %u, bits = %s, local disp = %s, local port = %#x, remote disp = %s, remote port = %#x, voucher disp = %s, voucher port = %#x, out-of-line descriptor cnt = %u", a1[5], a1[1], v10, v6, a1[3], v7, a1[2], v8, a1[4], v9) == -1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_6();
    int v13 = *__error();
    int v15 = 67109120;
    int v16 = v13;
    OUTLINED_FUNCTION_2();
    _os_crash_msg();
    __break(1u);
  }
  unint64_t v11 = v14;
  free(v10);
  return v11;
}

char *os_mach_msg_trailer_copy_description(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x263EF8C08];
  uint64_t v54 = 0;
  unsigned int v2 = *(_DWORD *)(a1 + 4);
  if (!*(_DWORD *)a1)
  {
    if (v2 >= 8)
    {
      unsigned int v6 = snprintf(__str, 0x200uLL, "format = %u, size = %u", 0, v2);
      if ((v6 & 0x80000000) != 0)
      {
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_6();
        if (v25) {
          unsigned int v7 = v24;
        }
        else {
          unsigned int v7 = v24 + 1;
        }
        size_t v26 = __error();
        uint64_t v27 = strerror(*v26);
        OUTLINED_FUNCTION_3((uint64_t)v27, 4.8149e-34);
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_9();
        __break(1u);
      }
      else
      {
        unsigned int v7 = v6;
        if (v6 < 0x201)
        {
          if (*(_DWORD *)(a1 + 4) >= 0xCu)
          {
            uint64_t v8 = &__str[v6];
            size_t v9 = 512 - v6;
            unsigned int v10 = snprintf(v8, v9, ", seqno = %u", *(_DWORD *)(a1 + 8));
            if ((v10 & 0x80000000) != 0)
            {
LABEL_37:
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_7();
              OUTLINED_FUNCTION_6();
              if (v25) {
                size_t v9 = v33;
              }
              else {
                size_t v9 = v33 + 1;
              }
              uint64_t v34 = __error();
              uint64_t v35 = strerror(*v34);
              OUTLINED_FUNCTION_3((uint64_t)v35, 4.8149e-34);
              OUTLINED_FUNCTION_1();
              OUTLINED_FUNCTION_9();
              __break(1u);
              goto LABEL_41;
            }
            unsigned int v1 = v10;
            if (v9 < v10)
            {
LABEL_41:
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_7();
              OUTLINED_FUNCTION_6();
              *(_DWORD *)uint64_t v60 = v36;
              *(_DWORD *)&v60[4] = v1;
              *(_WORD *)&v60[8] = 2048;
              *(void *)&v60[10] = v9;
              OUTLINED_FUNCTION_4();
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_9();
              __break(1u);
              goto LABEL_42;
            }
            if (*(_DWORD *)(a1 + 4) >= 0x14u)
            {
              unint64_t v11 = &v8[v10];
              size_t v12 = v9 - v10;
              unsigned int v13 = snprintf(v11, v12, ", security.uid = %u, security.gid = %u", *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 16));
              if ((v13 & 0x80000000) != 0)
              {
LABEL_42:
                OUTLINED_FUNCTION_0();
                OUTLINED_FUNCTION_7();
                OUTLINED_FUNCTION_6();
                if (v25) {
                  size_t v12 = v37;
                }
                else {
                  size_t v12 = v37 + 1;
                }
                uint64_t v38 = __error();
                uint64_t v39 = strerror(*v38);
                OUTLINED_FUNCTION_3((uint64_t)v39, 4.8149e-34);
                OUTLINED_FUNCTION_1();
                OUTLINED_FUNCTION_9();
                __break(1u);
                goto LABEL_46;
              }
              unsigned int v1 = v13;
              if (v12 < v13)
              {
LABEL_46:
                OUTLINED_FUNCTION_0();
                OUTLINED_FUNCTION_7();
                OUTLINED_FUNCTION_6();
                *(_DWORD *)uint64_t v60 = v40;
                *(_DWORD *)&v60[4] = v1;
                *(_WORD *)&v60[8] = 2048;
                *(void *)&v60[10] = v12;
                OUTLINED_FUNCTION_4();
                OUTLINED_FUNCTION_2();
                OUTLINED_FUNCTION_9();
                __break(1u);
                goto LABEL_47;
              }
              if (*(_DWORD *)(a1 + 4) >= 0x34u)
              {
                uint64_t v14 = &v11[v13];
                size_t v15 = v12 - v13;
                unsigned int v16 = snprintf(v14, v15, ", audit.auid = %u, audit.euid = %u, audit.egid = %u, audit.ruid = %u, audit.rgid = %u, audit.pid = %u, audit.asid = %u, audit.pidvers = %u", *(_DWORD *)(a1 + 20), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48));
                if ((v16 & 0x80000000) != 0)
                {
LABEL_47:
                  OUTLINED_FUNCTION_0();
                  OUTLINED_FUNCTION_7();
                  OUTLINED_FUNCTION_6();
                  if (v25) {
                    size_t v15 = v41;
                  }
                  else {
                    size_t v15 = v41 + 1;
                  }
                  uint64_t v42 = __error();
                  uint64_t v43 = strerror(*v42);
                  OUTLINED_FUNCTION_3((uint64_t)v43, 4.8149e-34);
                  OUTLINED_FUNCTION_1();
                  OUTLINED_FUNCTION_9();
                  __break(1u);
                  goto LABEL_51;
                }
                if (v15 < v16)
                {
LABEL_51:
                  OUTLINED_FUNCTION_0();
                  LODWORD(v14) = v44;
                  OUTLINED_FUNCTION_7();
                  OUTLINED_FUNCTION_6();
                  *(_DWORD *)uint64_t v60 = v45;
                  *(_DWORD *)&v60[4] = v14;
                  *(_WORD *)&v60[8] = 2048;
                  *(void *)&v60[10] = v15;
                  OUTLINED_FUNCTION_4();
                  OUTLINED_FUNCTION_2();
                  OUTLINED_FUNCTION_9();
                  __break(1u);
                  goto LABEL_52;
                }
                if (*(_DWORD *)(a1 + 4) >= 0x3Cu)
                {
                  long long v17 = &v14[v16];
                  size_t v18 = v15 - v16;
                  unsigned int v19 = snprintf(v17, v18, ", context = %#llx", *(void *)(a1 + 52));
                  if ((v19 & 0x80000000) != 0)
                  {
LABEL_52:
                    OUTLINED_FUNCTION_0();
                    OUTLINED_FUNCTION_7();
                    OUTLINED_FUNCTION_6();
                    if (v25) {
                      size_t v18 = v46;
                    }
                    else {
                      size_t v18 = v46 + 1;
                    }
                    uint64_t v47 = __error();
                    uint64_t v48 = strerror(*v47);
                    OUTLINED_FUNCTION_3((uint64_t)v48, 4.8149e-34);
                    OUTLINED_FUNCTION_1();
                    OUTLINED_FUNCTION_9();
                    __break(1u);
                    goto LABEL_56;
                  }
                  LODWORD(v14) = v19;
                  if (v18 < v19)
                  {
LABEL_56:
                    OUTLINED_FUNCTION_0();
                    OUTLINED_FUNCTION_7();
                    OUTLINED_FUNCTION_6();
                    *(_DWORD *)uint64_t v60 = v49;
                    *(_DWORD *)&v60[4] = v14;
                    *(_WORD *)&v60[8] = 2048;
                    *(void *)&v60[10] = v18;
                    OUTLINED_FUNCTION_4();
                    OUTLINED_FUNCTION_2();
                    OUTLINED_FUNCTION_9();
                    __break(1u);
                    goto LABEL_57;
                  }
                  if (*(_DWORD *)(a1 + 4) >= 0x44u)
                  {
                    size_t v20 = v18 - v19;
                    unsigned int v21 = snprintf(&v17[v19], v20, ", labels.sender = %#x", *(_DWORD *)(a1 + 64));
                    if ((v21 & 0x80000000) != 0)
                    {
LABEL_57:
                      OUTLINED_FUNCTION_0();
                      unsigned int v22 = MEMORY[0x263EF8CC0];
                      OUTLINED_FUNCTION_7();
                      OUTLINED_FUNCTION_6();
                      if (v25) {
                        size_t v20 = v50;
                      }
                      else {
                        size_t v20 = v50 + 1;
                      }
                      uint64_t v51 = __error();
                      uint64_t v52 = strerror(*v51);
                      OUTLINED_FUNCTION_3((uint64_t)v52, 4.8149e-34);
                      OUTLINED_FUNCTION_1();
                      OUTLINED_FUNCTION_9();
                      __break(1u);
                      goto LABEL_61;
                    }
                    unsigned int v22 = v21;
                    if (v20 < v21)
                    {
LABEL_61:
                      OUTLINED_FUNCTION_0();
                      os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
                      OUTLINED_FUNCTION_6();
                      *(_DWORD *)uint64_t v60 = v53;
                      *(_DWORD *)&v60[4] = v22;
                      *(_WORD *)&v60[8] = 2048;
                      *(void *)&v60[10] = v20;
                      OUTLINED_FUNCTION_4();
                      _os_log_send_and_compose_impl();
                      uint64_t result = (char *)OUTLINED_FUNCTION_9();
                      __break(1u);
                      return result;
                    }
                  }
                }
              }
            }
          }
          goto LABEL_22;
        }
      }
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_6();
      *(_DWORD *)uint64_t v60 = v28;
      *(_DWORD *)&v60[4] = v7;
      *(_WORD *)&v60[8] = 2048;
      *(void *)&v60[10] = 512;
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_9();
      __break(1u);
LABEL_33:
      size_t v29 = strlen(__str);
      OUTLINED_FUNCTION_0();
      os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
      OUTLINED_FUNCTION_6();
      if (v25) {
        unsigned int v1 = v30;
      }
      else {
        unsigned int v1 = v30 + 1;
      }
      uint64_t v31 = __error();
      uint64_t v32 = strerror(*v31);
      *(_DWORD *)uint64_t v60 = 136315650;
      *(void *)&v60[4] = "known-constant allocation";
      *(_WORD *)&v60[12] = 2048;
      *(void *)&v60[14] = v29;
      __int16 v61 = 2080;
      uint64_t v62 = v32;
      OUTLINED_FUNCTION_4();
      _os_log_send_and_compose_impl();
      OUTLINED_FUNCTION_9();
      __break(1u);
      goto LABEL_37;
    }
LABEL_22:
    if (_dispatch_is_multithreaded())
    {
      while (1)
      {
        uint64_t result = strdup(__str);
        if (result) {
          break;
        }
        __os_temporary_resource_shortage();
      }
      return result;
    }
    uint64_t result = strdup(__str);
    if (result) {
      return result;
    }
    goto LABEL_33;
  }
  int v3 = asprintf(&v54, "type = %u, size = %u", *(_DWORD *)a1, v2);
  if (v3)
  {
    int v23 = v3;
    *(void *)uint64_t v60 = 0;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    *(_OWORD *)__str = 0u;
    os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
    OUTLINED_FUNCTION_6();
    int v63 = 134217984;
    uint64_t v64 = v23;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  return v54;
}

char *os_mach_port_copy_description(uint64_t name)
{
  kern_return_t v8;
  int attributes;
  char *v10;
  unsigned int v11;
  char v12;
  int *v13;
  unsigned int v14;
  int *v15;
  uint64_t v16;
  char *result;
  int *v18;
  int *v19;
  int *v20;
  int *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out[4];
  long long v28;
  uint64_t v29;
  mach_port_type_t ptype[2];
  unsigned char v31[12];
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  uint64_t v34 = *MEMORY[0x263EF8C08];
  size_t v29 = 0;
  *(void *)ptype = 0;
  *(_OWORD *)port_info_out = 0u;
  int v28 = 0u;
  port_info_outCnt = 10;
  unsigned int v24 = 0;
  char v25 = 0;
  unsigned int v22 = 0;
  int v23 = 0;
  if (name != -1)
  {
    uint64_t v1 = name;
    if (!name)
    {
      unsigned int v2 = strdup("null");
      if (v2)
      {
LABEL_6:
        unint64_t v4 = v2;
        uint64_t v5 = 0;
        unint64_t v6 = 0;
LABEL_36:
        free(v5);
        free(v23);
        free((void *)v6);
        free(v24);
        return v4;
      }
      unsigned int v33 = 0;
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_6();
      int v3 = __error();
      strerror(*v3);
      *(_DWORD *)uint64_t v31 = 136315650;
      *(void *)&v31[4] = "known-constant allocation";
      uint64_t v32 = 2048;
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_13();
      __break(1u);
      goto LABEL_5;
    }
    unsigned int v7 = (ipc_space_read_t *)MEMORY[0x263EF8C60];
    uint64_t v8 = mach_port_type(*MEMORY[0x263EF8C60], name, &ptype[1]);
    if (v8)
    {
      if (asprintf(&v24, "[%#x]", v8) == -1) {
        goto LABEL_38;
      }
      unint64_t v6 = 0;
    }
    else
    {
      unsigned int v24 = os_flagset_copy_string((uint64_t)&_mach_port_rights, ptype[1]);
      unint64_t v6 = (unint64_t)os_flagset_copy_string((uint64_t)&_mach_port_requests, ptype[1]);
    }
    attributes = mach_port_get_attributes(*v7, v1, 2, port_info_out, &port_info_outCnt);
    if (attributes == 17)
    {
      if ((ptype[1] & 0x20000) == 0)
      {
        unsigned int v10 = strdup("[none]");
        if (v10) {
          goto LABEL_27;
        }
        unsigned int v33 = 0;
        OUTLINED_FUNCTION_8();
        uint64_t v1 = MEMORY[0x263EF8CC0];
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_6();
        if (v12) {
          unint64_t v6 = v11;
        }
        else {
          unint64_t v6 = v11 + 1;
        }
        unsigned int v13 = __error();
        strerror(*v13);
        *(_DWORD *)uint64_t v31 = 136315650;
        *(void *)&v31[4] = "known-constant allocation";
        uint64_t v32 = 2048;
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_1();
        attributes = OUTLINED_FUNCTION_13();
        __break(1u);
      }
    }
    else if (!attributes)
    {
      if (HIDWORD(v29))
      {
        unsigned int v10 = os_flagset_copy_string((uint64_t)&_mach_port_status, HIDWORD(v29));
LABEL_27:
        int v23 = v10;
        goto LABEL_28;
      }
LABEL_26:
      unsigned int v10 = strdup("[none]");
      if (!v10) {
        goto LABEL_40;
      }
      goto LABEL_27;
    }
    if (asprintf(&v23, "[%#x]", attributes) != -1)
    {
LABEL_28:
      if ((ptype[1] & 0x10000) != 0) {
        unsigned int v16 = 0;
      }
      else {
        unsigned int v16 = (ptype[1] & 0x100000) >> 18;
      }
      if (MEMORY[0x21055EF50](*v7, v1, v16, ptype)) {
        asprintf(&v22, ", %s urefs = [%#x]");
      }
      else {
        asprintf(&v22, ", %s urefs = %u");
      }
      if (asprintf(&v25, "name = %#x, rights = %s, requests = %s, status = %s%s", v1, v24, (const char *)v6, v23, v22) != -1)
      {
        unint64_t v4 = v25;
        uint64_t v5 = v22;
        goto LABEL_36;
      }
      *(void *)uint64_t v31 = 0;
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_6();
      size_t v18 = __error();
      OUTLINED_FUNCTION_10(*v18, 1.5047e-36);
      OUTLINED_FUNCTION_1();
      _os_crash_msg();
      __break(1u);
LABEL_38:
      *(void *)uint64_t v31 = 0;
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_6();
      unsigned int v19 = __error();
      OUTLINED_FUNCTION_10(*v19, 1.5047e-36);
      OUTLINED_FUNCTION_1();
      _os_crash_msg();
      __break(1u);
    }
    *(void *)uint64_t v31 = 0;
    OUTLINED_FUNCTION_8();
    uint64_t v1 = MEMORY[0x263EF8CC0];
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_6();
    if (v12) {
      unint64_t v6 = v14;
    }
    else {
      unint64_t v6 = v14 + 1;
    }
    size_t v15 = __error();
    OUTLINED_FUNCTION_10(*v15, 1.5047e-36);
    OUTLINED_FUNCTION_1();
    _os_crash_msg();
    __break(1u);
    goto LABEL_26;
  }
LABEL_5:
  unsigned int v2 = strdup("dead-name");
  if (v2) {
    goto LABEL_6;
  }
  unsigned int v33 = 0;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  size_t v20 = __error();
  strerror(*v20);
  *(_DWORD *)uint64_t v31 = 136315650;
  *(void *)&v31[4] = "known-constant allocation";
  uint64_t v32 = 2048;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13();
  __break(1u);
LABEL_40:
  unsigned int v33 = 0;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  unsigned int v21 = __error();
  strerror(*v21);
  *(_DWORD *)uint64_t v31 = 136315650;
  *(void *)&v31[4] = "known-constant allocation";
  uint64_t v32 = 2048;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1();
  uint64_t result = (char *)OUTLINED_FUNCTION_13();
  __break(1u);
  return result;
}

void os_assert_mach(int a1, unsigned int r)
{
  uint64_t v6 = *MEMORY[0x263EF8C08];
  if (r)
  {
    unsigned int v2 = r;
    if (r - 1100 > 6)
    {
      int v3 = mach_error_string(r & 0xFFFFC1FF);
      if (!strcmp(v3, "unknown error code")) {
        snprintf(__str, 0x40uLL, "[%#x|%#x|%#x]", v2 >> 26, (v2 >> 14) & 0xFFF, v2 & 0x1FF);
      }
      if (v2 + 309 >= 0xA) {
        goto LABEL_9;
      }
    }
    else
    {
      bootstrap_strerror(r);
    }
    snprintf(v4, 0x10uLL, "%d", v2);
    do
    {
      OUTLINED_FUNCTION_12();
      unsigned int v2 = MEMORY[0x263EF8CC0];
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_2();
      _os_crash_msg();
      __break(1u);
LABEL_9:
      snprintf(v4, 0x10uLL, "%#x", v2);
    }
    while (!os_flagset_copy_string((uint64_t)&_mach_special_bits, v2 & 0x3E00));
    OUTLINED_FUNCTION_12();
    os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
    OUTLINED_FUNCTION_11();
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
}

void _check_internal_release_type_cold_1()
{
}

void os_variant_init_4launchd_cold_1(void *a1, _OWORD *a2)
{
}

void os_variant_init_4launchd_cold_2(void *a1, _OWORD *a2)
{
}

void os_variant_init_4launchd_cold_3(void *a1, _OWORD *a2)
{
}

void os_variant_init_4launchd_cold_4(void *a1, _OWORD *a2)
{
}

void os_variant_init_4launchd_cold_5(void *a1, _OWORD *a2)
{
}

void os_variant_init_4launchd_cold_6(void *a1, _OWORD *a2)
{
}

void os_variant_init_4launchd_cold_7(void *a1, _OWORD *a2)
{
}

void os_variant_init_4launchd_cold_8(void *a1, _OWORD *a2)
{
}

void os_variant_init_4launchd_cold_9(void *a1, _OWORD *a2)
{
}

void os_variant_init_4launchd_cold_10(void *a1, _OWORD *a2)
{
}

void _parse_disabled_status_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_3_0();
  unsigned int v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void ___initialize_status_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void ___initialize_status_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void ___initialize_status_block_invoke_cold_3(void *a1, _OWORD *a2)
{
}

void ___initialize_status_block_invoke_cold_4(void *a1, _OWORD *a2)
{
}

void ___initialize_status_block_invoke_cold_5(void *a1, _OWORD *a2)
{
}

void ___initialize_status_block_invoke_cold_6(void *a1, _OWORD *a2)
{
}

void ___initialize_status_block_invoke_cold_7(void *a1, _OWORD *a2)
{
}

void ___initialize_status_block_invoke_cold_8(void *a1, _OWORD *a2)
{
}

void os_localtime_file_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
  __error();
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void memdup2_np_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
  unsigned int v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _os_subcommand_print_usage_cold_1(void *a1, _OWORD *a2)
{
}

void dup_np_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  unsigned int v2 = __error();
  symerror_np(*v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void dup_np_cold_2()
{
}

void dup_np_cold_3()
{
}

void claimfd_np_cold_1(void *a1, _OWORD *a2)
{
}

void close_drop_np_cold_1(void *a1, _OWORD *a2)
{
}

void vwfprintf_np_cold_1()
{
}

void vwfprintf_np_cold_2()
{
}

void vwfprintf_np_cold_3()
{
}

void os_crash_spawnattr_set_reporter_port_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void err_np(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void verr_np(int a1, const char *a2, va_list a3)
{
  unint64_t v4 = (FILE **)MEMORY[0x263EF8C10];
  _print_preamble((FILE *)*MEMORY[0x263EF8C10], a2, a3);
  uint64_t v5 = *v4;
  uint64_t v6 = strerror_np(a1);
  fprintf(v5, ": %s\n", v6);
  int v7 = sysexit_np(a1);
  exit(v7);
}

void errc_np(int a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void verrc_np(int a1, int a2, const char *a3, va_list a4)
{
  uint64_t v6 = (FILE **)MEMORY[0x263EF8C10];
  _print_preamble((FILE *)*MEMORY[0x263EF8C10], a3, a4);
  int v7 = *v6;
  uint64_t v8 = strerror_np(a2);
  fprintf(v7, ": %s\n", v8);
  exit(a1);
}

uint64_t warn_np(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return vwarn_np(a1, a2, &a9);
}

uint64_t vwarn_np(int a1, const char *a2, va_list a3)
{
  unint64_t v4 = (FILE **)MEMORY[0x263EF8C10];
  _print_preamble((FILE *)*MEMORY[0x263EF8C10], a2, a3);
  uint64_t v5 = *v4;
  uint64_t v6 = strerror_np(a1);
  return fprintf(v5, ": %s\n", v6);
}

char *strerror_np(int a1)
{
  if (a1 <= 0x6A) {
    return strerror(a1);
  }
  unsigned int v2 = &_negative_one;
  uint64_t v3 = (a1 - 200);
  BOOL v4 = v3 >= 0x16;
  BOOL v5 = v3 == 22;
  uint64_t v6 = (char *)&_darwin_errors + 32 * v3;
  if (!v5 && v4) {
    uint64_t v6 = (char *)&unk_26411C108;
  }
  if (a1 >= 0) {
    unsigned int v2 = v6;
  }
  return (char *)v2[3];
}

uint64_t strexit_np(int a1)
{
  uint64_t v1 = &_zero;
  if ((a1 - 79) >= 0xFFFFFFF1) {
    unsigned int v2 = (char *)&_sysexits + 32 * (a1 - 64);
  }
  else {
    unsigned int v2 = (char *)&unk_26411C208;
  }
  if (a1 == 173) {
    unsigned int v2 = (char *)&_badreceipt;
  }
  if (a1) {
    uint64_t v1 = v2;
  }
  return v1[3];
}

uint64_t symerror_np(int a1)
{
  uint64_t v1 = &_negative_one;
  uint64_t v2 = (a1 - 200);
  uint64_t v3 = (char *)&unk_26411C108;
  if (a1 <= 0x6A) {
    uint64_t v3 = (char *)&_posix_errors + 32 * a1;
  }
  if (v2 <= 0x16) {
    BOOL v4 = (char *)&_darwin_errors + 32 * v2;
  }
  else {
    BOOL v4 = v3;
  }
  if (a1 >= 0) {
    uint64_t v1 = v4;
  }
  return v1[2];
}

uint64_t symexit_np(int a1)
{
  uint64_t v1 = &_zero;
  if ((a1 - 79) >= 0xFFFFFFF1) {
    uint64_t v2 = (char *)&_sysexits + 32 * (a1 - 64);
  }
  else {
    uint64_t v2 = (char *)&unk_26411C208;
  }
  if (a1 == 173) {
    uint64_t v2 = (char *)&_badreceipt;
  }
  if (a1) {
    uint64_t v1 = v2;
  }
  return v1[2];
}

void os_flagset_copy_string_cold_1(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x263EF8CC0], OS_LOG_TYPE_ERROR);
  BOOL v5 = __error();
  strerror(*v5);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
  _NSGetMachExecuteHeader();
}

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return (mach_header_64 *)MEMORY[0x270EDCEC0]();
}

__darwin_ct_rune_t ___toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270EDCEC8](*(void *)&a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x270EDD478]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x270EDCAB0]();
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x270EDCDC0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270EDCF20]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270EDCF28]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270EDDD20]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270EDD598](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270EDCFD8](a1, a2);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x270EDDDB8](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x270EDD5A0]();
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x270EDD5D0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dup(int a1)
{
  return MEMORY[0x270EDD5F8](*(void *)&a1);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270EDD068](a1);
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x270EDD628]();
}

int feof(FILE *a1)
{
  return MEMORY[0x270EDD078](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270EDD080](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270EDD0C8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270EDD0D0](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270EDD0D8](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270EDD688](*(void *)&a1, a2);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x270EDD6B8](*(void *)&a1, a2, a3, a4, a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270EDD130](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270EDD6D0]();
}

pid_t getpid(void)
{
  return MEMORY[0x270EDD6F0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270EDD140]();
}

char *__cdecl getsectdatafromheader_64(const mach_header_64 *mhp, const char *segname, const char *sectname, uint64_t *size)
{
  return (char *)MEMORY[0x270EDCE68](mhp, segname, sectname, size);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270EDD148](a1, a2);
}

uint64_t guarded_close_np()
{
  return MEMORY[0x270EDD718]();
}

kern_return_t host_get_exception_ports(host_priv_t host_priv, exception_mask_t exception_mask, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlers, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  return MEMORY[0x270EDD720](*(void *)&host_priv, *(void *)&exception_mask, masks, masksCnt, old_handlers, old_behaviors, old_flavors);
}

kern_return_t host_get_special_port(host_priv_t host_priv, int node, int which, mach_port_t *port)
{
  return MEMORY[0x270EDD728](*(void *)&host_priv, *(void *)&node, *(void *)&which, port);
}

kern_return_t host_set_exception_ports(host_priv_t host_priv, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  return MEMORY[0x270EDD738](*(void *)&host_priv, *(void *)&exception_mask, *(void *)&new_port, *(void *)&behavior, *(void *)&new_flavor);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270EDD740](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x270EDD160](*(void *)&a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDD170](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDD780](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDD788]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDD7C0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x270EDD7D0](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x270EDD7E0](*(void *)&task, *(void *)&name, *(void *)&right, refs);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDD800](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x270EDD818](*(void *)&task, *(void *)&name, ptype);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB00](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDD188](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDD198](__b, *(void *)&__c, __len);
}

uint64_t open_NOCANCEL()
{
  return MEMORY[0x270EDD8D8]();
}

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return (FILE *)MEMORY[0x270EDD1C0](__bufp, __sizep);
}

uint64_t openat_NOCANCEL()
{
  return MEMORY[0x270EDD8F0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDDD50](oslog, type);
}

int posix_spawnattr_setexceptionports_np(posix_spawnattr_t *a1, exception_mask_t a2, mach_port_t a3, exception_behavior_t a4, thread_state_flavor_t a5)
{
  return MEMORY[0x270EDD928](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4, *(void *)&a5);
}

uint64_t read_NOCANCEL()
{
  return MEMORY[0x270EDD968]();
}

uint64_t sleep_NOCANCEL()
{
  return MEMORY[0x270EDD260]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDD268](__str, __size, __format);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDD298](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDD2A0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDD2B0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDD2B8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDD2D8](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDD2E0](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDD2E8](a1, a2, a3);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDD320](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x270EDD328](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDD330](__s1, __s2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDD348](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDD350](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDD358](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDD360](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x270EDD368](a1, a2, a3);
}

kern_return_t task_get_exception_ports(task_t task, exception_mask_t exception_mask, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlers, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  return MEMORY[0x270EDDA00](*(void *)&task, *(void *)&exception_mask, masks, masksCnt, old_handlers, old_behaviors, old_flavors);
}

kern_return_t task_set_exception_ports(task_t task, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  return MEMORY[0x270EDDA20](*(void *)&task, *(void *)&exception_mask, *(void *)&new_port, *(void *)&behavior, *(void *)&new_flavor);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDD3C8](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDD3D0](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDD3D8](__str, __size, __format, a4);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x270EDDE30]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDDE80](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDDED0](object);
}