BOOL sandbox_enable_state_flag()
{
  return __sandbox_ms() == 0;
}

BOOL sandbox_enable_local_state_flag()
{
  return __sandbox_ms() == 0;
}

uint64_t sandbox_get_container_expected(unsigned char *a1, unsigned char *a2)
{
  if (__sandbox_ms()) {
    return 0xFFFFFFFFLL;
  }
  if (a1) {
    *a1 = 0;
  }
  uint64_t result = 0;
  if (a2) {
    *a2 = 0;
  }
  return result;
}

size_t _amkrtemp(const char *a1)
{
  v2 = (const char *)_amkrtemp_sentinel;
  if (!_amkrtemp_sentinel)
  {
    size_t size = 0;
    v5 = 0;
    if (sysctlbyname("security.mac.sandbox.sentinel", 0, &size, 0, 0)
      || (v5 = malloc_type_malloc(size, 0x8FE948CFuLL)) == 0
      || sysctlbyname("security.mac.sandbox.sentinel", v5, &size, 0, 0))
    {
      v4 = v5;
      goto LABEL_8;
    }
    uint64_t v6 = 0;
    atomic_compare_exchange_strong(&_amkrtemp_sentinel, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
      free(v5);
    }
    v2 = (const char *)_amkrtemp_sentinel;
  }
  size_t size = 0;
  if (asprintf((char **)&size, "%s%s-XXXXXX", a1, v2) != -1 && mktemp((char *)size)) {
    return size;
  }
  v4 = (void *)size;
LABEL_8:
  free(v4);
  return 0;
}

uint64_t sandbox_reference_retain_by_audit_token()
{
  if (__sandbox_ms()) {
    return -1;
  }
  else {
    return -1;
  }
}

uint64_t sandbox_passthrough_access()
{
  return __sandbox_ms();
}

uint64_t sandbox_spawnattrs_setprofilename(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 < 0x40)
  {
    int v6 = v4;
    memcpy((void *)(a1 + 16), __s, v4 + 1);
    uint64_t result = 0;
    *(_DWORD *)(a1 + 8) = v6;
  }
  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sandbox_extension_release()
{
  return __sandbox_ms();
}

BOOL _sandbox_in_a_container()
{
  uint64_t v3 = *MEMORY[0x263EF8C08];
  bzero(v2, 0x400uLL);
  pid_t v0 = getpid();
  return sandbox_container_path_for_pid(v0) == 0;
}

uint64_t sandbox_container_path_for_pid(int a1)
{
  if (!a1) {
    getpid();
  }
  return __sandbox_ms();
}

uint64_t rootless_check_protected_flag(const char *a1, const char *a2, int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8C08];
  memset(&v9, 0, sizeof(v9));
  uint64_t result = stat(a1, &v9);
  if (!result)
  {
    if (a3 == 0x80000 && is_path_on_authenticated_root_volume(a1)) {
      v9.st_flags |= 0x80000u;
    }
    if ((v9.st_flags & a3) == 0) {
      return 1;
    }
    if (a2)
    {
      memset(value, 0, sizeof(value));
      ssize_t v7 = getxattr(a1, "com.apple.rootless", value, 0x80uLL, 0, 0);
      if (v7 < 1) {
        return 1;
      }
      size_t v8 = v7;
      if (v7 != strlen(a2)) {
        return 1;
      }
      uint64_t result = memcmp(a2, value, v8);
      if (result) {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t rootless_trusted_by_self_token(unsigned int a1, int a2)
{
  uint64_t v4 = trusted_storage_classes_0;
  if (trusted_storage_classes_0)
  {
    while (*(_DWORD *)(v4 + 8) != a2 || rootless_check_trusted_internal(0, a1, v4 + 12))
    {
      uint64_t v4 = *(void *)v4;
      if (!v4) {
        return 0x80000000;
      }
    }
  }
  else if (rootless_check_trusted_internal(0, a1, 0))
  {
    return 0x80000000;
  }
  return (1 << a2) | 0x80000000;
}

uint64_t rootless_check_trusted_internal(const char *a1, unsigned int a2, uint64_t a3)
{
  if (a1)
  {
    if (is_path_on_authenticated_root_volume(a1)) {
      return 0;
    }
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v36 = 0;
    long long v35 = xmmword_20D746650;
    v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    if (fgetattrlist(a2, &v35, &v25, 0x28uLL, 0))
    {
      int v7 = *__error();
      size_t v8 = __error();
      strerror(*v8);
      rootless_log(7, "fgetattrlist failed: #%d: %s", v9, v10, v11, v12, v13, v14, v7);
    }
    else if ((BYTE5(v25) & 0x40) != 0 && (BYTE11(v25) & 2) != 0)
    {
      uint64_t v40 = 0x20000000000;
      long long v39 = xmmword_20D746668;
      int v38 = 0;
      uint64_t v37 = 0;
      if (fgetattrlist(a2, &v39, &v37, 0xCuLL, 0x20u))
      {
        int v17 = *__error();
        v18 = __error();
        strerror(*v18);
        rootless_log(7, "fgetattrlist failed: #%d: %s", v19, v20, v21, v22, v23, v24, v17);
        return 0;
      }
      if ((v37 & 0x2000000000) == 0) {
        return 0;
      }
    }
    uint64_t v15 = 240;
  }
  *(void *)&long long v39 = 0;
  *(void *)&long long v25 = &v39;
  *((void *)&v25 + 1) = 1;
  long long v28 = xmmword_20D746640;
  uint64_t v29 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v34 = 0;
  v16 = (const char *)a2;
  if (a1) {
    v16 = a1;
  }
  *(void *)&long long v26 = "file-write-data";
  *((void *)&v26 + 1) = v15;
  v27 = v16;
  if (__sandbox_ms()) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v39 != 1;
  }
}

void rootless_log(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v9[0] = 0;
  v9[1] = &a9;
  vasprintf((char **)v9, a2, &a9);
  if (!v9[0]) {
    rootless_register_trusted_storage_class_cold_1();
  }
  _simple_asl_log();
  free(v9[0]);
}

void *_sandbox_extension_issue(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  v5 = malloc_type_malloc(0x800uLL, 0x251263F9uLL);
  if (v5)
  {
    if (a4)
    {
      __strlcpy_chk();
    }
    else if (__sandbox_ms())
    {
      int v6 = *__error();
      free(v5);
      v5 = 0;
      *__error() = v6;
    }
  }
  return v5;
}

uint64_t sandbox_extension_consume(const char *a1)
{
  if (!strcmp(a1, "invalid")) {
    return 0;
  }
  strlen(a1);
  if (__sandbox_ms()) {
    return -1;
  }
  else {
    return 0;
  }
}

uint64_t sandbox_container_path_for_audit_token()
{
  return __sandbox_ms();
}

uint64_t sandbox_check(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v22 = a2;
  sandbox_operation_fixup(&v22);
  v12[0] = 0;
  long long v13 = 0u;
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v12[1] = a1;
  *(void *)&long long v13 = v22;
  uint64_t v21 = &a9;
  return sandbox_check_common(v12, a3, &a9);
}

uint64_t sandbox_check_by_audit_token(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v22 = 0;
  uint64_t v23 = a2;
  sandbox_operation_fixup(&v23);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *((void *)&v13 + 1) = *(unsigned int *)(a1 + 20);
  *(void *)&long long v14 = v23;
  uint64_t v11 = *(unsigned int *)(a1 + 28);
  *((void *)&v15 + 1) = 0x40000000;
  *(void *)&long long v16 = v11;
  uint64_t v22 = &a9;
  return sandbox_check_common(&v13, a3, &a9);
}

uint64_t sandbox_check_common(void *a1, int a2, unsigned int *a3)
{
  long long v18 = a3;
  *a1 = &v13;
  if ((a2 & 0x40000000) != 0)
  {
    a1[5] |= 1uLL;
    if ((a2 & 0x20000000) == 0)
    {
LABEL_3:
      if ((a2 & 0x10000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a2 & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  a1[5] |= 2uLL;
  if ((a2 & 0x10000000) == 0)
  {
LABEL_4:
    if ((a2 & 0x8000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  a1[5] |= 8uLL;
  if ((a2 & 0x8000000) == 0)
  {
LABEL_5:
    if ((a2 & 0x4000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  a1[5] |= 0x10uLL;
  if ((a2 & 0x4000000) == 0)
  {
LABEL_6:
    if ((a2 & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_14:
  a1[5] |= 0x20uLL;
  if ((a2 & 0x2000000) != 0) {
LABEL_7:
  }
    a1[5] |= 0x40uLL;
LABEL_8:
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v3 = a2 & 0x81FFFFFF;
  uint64_t v13 = 0;
  uint64_t v4 = 240;
  switch((int)v3)
  {
    case 0:
      a1[3] = 0;
      a1[4] = 0;
      goto LABEL_36;
    case 1:
      goto LABEL_32;
    case 2:
      uint64_t v3 = 6;
      goto LABEL_32;
    case 3:
      uint64_t v3 = 7;
      goto LABEL_32;
    case 4:
      uint64_t v3 = 25;
      goto LABEL_32;
    case 5:
      uint64_t v3 = 27;
      goto LABEL_32;
    case 6:
      uint64_t v3 = 28;
      goto LABEL_32;
    case 7:
      uint64_t v3 = 33;
      goto LABEL_32;
    case 8:
      uint64_t v3 = 34;
      goto LABEL_32;
    case 9:
      v5 = v18;
      v18 += 2;
      uint64_t v16 = *(void *)v5;
      long long v18 = v5 + 4;
      uint64_t v17 = (int)v5[2];
      a1[3] = 35;
      a1[4] = &v16;
      goto LABEL_36;
    case 10:
      goto LABEL_34;
    case 11:
      int v6 = v18;
      v18 += 2;
      int v7 = *(_DWORD **)v6;
      long long v18 = v6 + 4;
      size_t v8 = (uint64_t *)*((void *)v6 + 1);
      a1[3] = 241;
      LODWORD(v15) = *v7;
      uint64_t v14 = *v8;
      uint64_t v9 = &v14;
      goto LABEL_35;
    case 12:
      uint64_t v3 = 50;
      goto LABEL_32;
    case 13:
      uint64_t v3 = 19;
      goto LABEL_32;
    case 14:
      uint64_t v4 = 65;
      goto LABEL_34;
    case 15:
      uint64_t v3 = 45;
      goto LABEL_32;
    case 16:
      uint64_t v4 = 75;
      goto LABEL_34;
    case 17:
      uint64_t v3 = 5;
LABEL_32:
      a1[3] = v3;
      uint64_t v10 = (uint64_t **)v18;
      v18 += 2;
      uint64_t v9 = *v10;
      goto LABEL_35;
    case 18:
      uint64_t v4 = 52;
LABEL_34:
      a1[3] = v4;
      uint64_t v11 = v18;
      v18 += 2;
      uint64_t v9 = (uint64_t *)*v11;
LABEL_35:
      a1[4] = v9;
LABEL_36:
      if (__sandbox_ms()) {
        goto LABEL_37;
      }
      uint64_t result = v13 != 0;
      break;
    default:
      *__error() = 22;
LABEL_37:
      uint64_t result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

uint64_t sandbox_operation_fixup(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = strcmp((const char *)result, "iokit-open");
    if (!result)
    {
      uint64_t result = sandbox_warn();
      *a1 = (uint64_t)"iokit-open-user-client";
    }
  }
  return result;
}

void *sandbox_extension_issue_file_to_process(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 0, a2, a3);
}

void *sandbox_extension_issue_file(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 0, a2, a3);
}

void *sandbox_extension_issue_mach_to_process(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 1, a2, a3);
}

uint64_t rootless_check_datavault_flag(const char *a1, const char *a2)
{
  return rootless_check_protected_flag(a1, a2, 128);
}

void *sandbox_extension_issue_generic(uint64_t a1, char a2)
{
  return _sandbox_extension_issue(a1, 3, 0, a2);
}

double sandbox_spawnattrs_init(uint64_t a1)
{
  *(void *)&double result = 0x45000000000;
  *(void *)a1 = 0x45000000000;
  *(unsigned char *)(a1 + 80) = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  return result;
}

uint64_t sandbox_extension_release_file()
{
  return __sandbox_ms();
}

uint64_t sandbox_init_with_parameters(void *a1, uint64_t a2, void *a3, char **a4)
{
  v35[0] = 0;
  if (a4) {
    int v7 = a4;
  }
  else {
    int v7 = (char **)v35;
  }
  *int v7 = 0;
  size_t v8 = dlopen("/usr/lib/libsandbox.1.dylib", 261);
  if (!v8)
  {
    long long v20 = dlerror();
    asprintf(v7, "%s", v20);
    uint64_t v21 = 0xFFFFFFFFLL;
    goto LABEL_36;
  }
  uint64_t v9 = v8;
  if (!a3)
  {
    uint64_t v17 = 0;
    uint64_t v15 = 0;
LABEL_18:
    switch(a2)
    {
      case 0:
        long long v25 = "sandbox_compile_string";
        goto LABEL_25;
      case 1:
        long long v25 = "sandbox_compile_named";
        goto LABEL_25;
      case 2:
      case 4:
        v35[2] = 0;
        v35[3] = 0;
        v35[1] = a1;
        uint64_t v21 = __sandbox_ms();
        if (v21)
        {
          uint64_t v23 = __error();
          uint64_t v24 = strerror(*v23);
          asprintf(v7, "%s", v24);
        }
        goto LABEL_33;
      case 3:
        long long v25 = "sandbox_compile_file";
LABEL_25:
        long long v26 = (uint64_t (*)(void *, uint64_t, char **))dlsym(v9, v25);
        if (!v26)
        {
          dlerror();
          goto LABEL_31;
        }
        uint64_t v27 = v26(a1, v17, v7);
        if (!v27) {
          goto LABEL_32;
        }
        uint64_t v28 = v27;
        uint64_t v29 = (unsigned int (*)(uint64_t))dlsym(v9, "sandbox_apply");
        if (v29)
        {
          if (!v29(v28))
          {
            uint64_t v21 = 0;
LABEL_49:
            uint64_t v34 = (void (*)(uint64_t))dlsym(v9, "sandbox_free_profile");
            if (v34) {
              v34(v28);
            }
LABEL_33:
            if (v17) {
              v15(v17);
            }
            goto LABEL_35;
          }
          long long v30 = __error();
          long long v31 = strerror(*v30);
        }
        else
        {
          long long v31 = dlerror();
        }
        asprintf(v7, "%s", v31);
        uint64_t v21 = 0xFFFFFFFFLL;
        goto LABEL_49;
      default:
        asprintf(v7, "bad flags");
        goto LABEL_32;
    }
  }
  uint64_t v10 = (uint64_t (*)(void))dlsym(v8, "sandbox_create_params");
  if (v10
    && (uint64_t v11 = v10, (v12 = dlsym(v9, "sandbox_set_param")) != 0)
    && (uint64_t v13 = (uint64_t (*)(uint64_t, void, void))v12,
        (uint64_t v14 = (void (*)(uint64_t))dlsym(v9, "sandbox_free_params")) != 0))
  {
    uint64_t v15 = v14;
    uint64_t v16 = v11();
    if (v16)
    {
      uint64_t v17 = v16;
      do
      {
        if (!*a3) {
          goto LABEL_18;
        }
        int v18 = v13(v17, *a3, a3[1]);
        a3 += 2;
      }
      while (!v18);
      long long v19 = __error();
      strerror(*v19);
LABEL_31:
      asprintf(v7, "%s");
LABEL_32:
      uint64_t v21 = 0xFFFFFFFFLL;
      goto LABEL_33;
    }
    long long v33 = __error();
    uint64_t v22 = strerror(*v33);
  }
  else
  {
    uint64_t v22 = dlerror();
  }
  asprintf(v7, "%s", v22);
  uint64_t v21 = 0xFFFFFFFFLL;
LABEL_35:
  dlclose(v9);
LABEL_36:
  if (*v7) {
    sandbox_warn();
  }
  if (v7 == (char **)v35)
  {
    if (v35[0] != internal_error) {
      free(v35[0]);
    }
  }
  else if (v21 && !*v7)
  {
    __strlcpy_chk();
    *int v7 = internal_error;
  }
  return v21;
}

uint64_t sandbox_warn()
{
  return _simple_sfree();
}

void sandbox_free_error(char *errorbuf)
{
  if (errorbuf != internal_error) {
    free(errorbuf);
  }
}

int sandbox_init(const char *profile, uint64_t flags, char **errorbuf)
{
  return sandbox_init_with_parameters((void *)profile, flags, 0, errorbuf);
}

uint64_t sandbox_init_from_pid()
{
  return __sandbox_ms();
}

uint64_t sandbox_check_by_uniqueid(int a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v24 = a3;
  sandbox_operation_fixup(&v24);
  v13[0] = 0;
  long long v14 = 0u;
  uint64_t v15 = 0;
  long long v17 = 0u;
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v13[1] = a1;
  *(void *)&long long v14 = v24;
  uint64_t v16 = 0x80000000;
  *(void *)&long long v17 = a2;
  uint64_t v23 = &a9;
  return sandbox_check_common(v13, a4, &a9);
}

uint64_t sandbox_check_self_signal_target(unsigned int a1, uint64_t a2, int a3)
{
  v14[0] = 0;
  v14[1] = getpid();
  v14[2] = "signal";
  v14[3] = 0;
  v14[4] = 0;
  v14[5] = 0x1000000;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = *(unsigned int *)(a2 + 28);
  uint64_t v19 = *(unsigned int *)(a2 + 20);
  uint64_t v20 = v6;
  uint64_t v21 = 0;
  return sandbox_check_signal_target_internal(v14, a3 & 0x81FFFFED | 0x12, v7, v8, v9, v10, v11, v12, a1);
}

uint64_t sandbox_check_signal_target_internal(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  return sandbox_check_common(a1, a2, &a9);
}

uint64_t sandbox_check_process_signal_target(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 20);
  v11[0] = 0;
  v11[1] = v8;
  v11[2] = "signal";
  v11[3] = 0;
  v11[4] = 0;
  v11[5] = 1090519040;
  v11[6] = *(unsigned int *)(a1 + 28);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v9 = *(unsigned int *)(a3 + 20);
  uint64_t v15 = 0;
  uint64_t v16 = v9;
  uint64_t v17 = *(unsigned int *)(a3 + 28);
  uint64_t v18 = 0;
  return sandbox_check_signal_target_internal(v11, a4 & 0x81FFFFED | 0x12, a3, a4, a5, a6, a7, a8, a2);
}

uint64_t sandbox_query_approval_policy_for_path(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v14 = *MEMORY[0x263EF8C08];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  *(_OWORD *)__s1 = 0u;
  long long v7 = 0u;
  uint64_t v5 = a1;
  sandbox_operation_fixup(&v5);
  getpid();
  if (__sandbox_ms()) {
    return 0xFFFFFFFFLL;
  }
  if (a3) {
    *a3 = strdup(__s1);
  }
  return 0;
}

uint64_t sandbox_query_user_intent_for_process_with_audit_token(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = a2;
  sandbox_operation_fixup(&v8);
  if ((a3 & 0x81FFFFFE) != 0)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  if (__sandbox_ms()) {
    return 0xFFFFFFFFLL;
  }
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

uint64_t sandbox_check_finder_automation_for_path(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    sandbox_warn();
    abort();
  }
  if ((__sandbox_ms() & 0x80000000) == 0) {
    return 1;
  }
  uint64_t v4 = __error();
  strerror(*v4);
  __error();
  sandbox_warn();
  return 0;
}

uint64_t sandbox_check_bulk(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = a2;
  if ((a3 & 0x81FFFFFF) != 0) {
    return 22;
  }
  if ((a3 & 0x30000000) != 0) {
    return 45;
  }
  sandbox_operation_fixup(&v4);
  if (__sandbox_ms()) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sandbox_requests_integrity_protection_for_preference_domain()
{
  return 0;
}

uint64_t sandbox_reference_release()
{
  return __sandbox_ms();
}

uint64_t sandbox_check_by_reference(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v23 = a2;
  sandbox_operation_fixup(&v23);
  uint64_t v14 = 0;
  long long v16 = 0u;
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(void *)&long long v13 = v23;
  uint64_t v15 = 3221225472;
  *(void *)&long long v16 = a1;
  uint64_t v22 = &a9;
  return sandbox_check_common(&v12, a3, &a9);
}

uint64_t sandbox_set_container_path_for_signing_id()
{
  return __sandbox_ms();
}

uint64_t sandbox_set_container_path_for_signing_id_with_persona()
{
  return __sandbox_ms();
}

uint64_t sandbox_set_container_path_for_application_group()
{
  return __sandbox_ms();
}

uint64_t sandbox_set_container_path_for_application_group_with_persona()
{
  return __sandbox_ms();
}

uint64_t sandbox_set_container_path_for_audit_token()
{
  return __sandbox_ms();
}

void *sandbox_extension_issue_file_to_process_by_pid(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 0, a2, a3);
}

void *sandbox_extension_issue_file_to_self(uint64_t a1, uint64_t a2, char a3)
{
  getpid();

  return _sandbox_extension_issue(a1, 0, a2, a3);
}

void *sandbox_extension_issue_mach(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 1, a2, a3);
}

void *sandbox_extension_issue_mach_to_process_by_pid(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 1, a2, a3);
}

void *sandbox_extension_issue_iokit_registry_entry_class(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 2, a2, a3);
}

void *sandbox_extension_issue_iokit_registry_entry_class_to_process(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 2, a2, a3);
}

void *sandbox_extension_issue_iokit_registry_entry_class_to_process_by_pid(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 2, a2, a3);
}

void *sandbox_extension_issue_iokit_user_client_class(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 2, a2, a3);
}

void *sandbox_extension_issue_posix_ipc(uint64_t a1, uint64_t a2, char a3)
{
  return _sandbox_extension_issue(a1, 4, a2, a3);
}

void *sandbox_extension_issue_generic_to_process(uint64_t a1, char a2)
{
  return _sandbox_extension_issue(a1, 3, 0, a2);
}

void *sandbox_extension_issue_generic_to_process_by_pid(uint64_t a1, char a2)
{
  return _sandbox_extension_issue(a1, 3, 0, a2);
}

uint64_t sandbox_extension_release_and_detect_last_reference()
{
  return __sandbox_ms();
}

uint64_t sandbox_extension_update_file()
{
  return __sandbox_ms();
}

uint64_t sandbox_extension_update_file_by_fileid()
{
  return __sandbox_ms();
}

void *sandbox_extension_issue_related_file_to_process(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, long long *a6)
{
  uint64_t v12 = *((unsigned int *)a6 + 5);
  uint64_t v13 = *((unsigned int *)a6 + 7);
  uint64_t v37 = 0;
  uint64_t v38 = a4;
  uint64_t v36 = 0;
  sandbox_operation_fixup(&v38);
  *(void *)&long long v24 = &v36;
  *((void *)&v24 + 1) = v12;
  *(void *)&long long v25 = v38;
  *((void *)&v25 + 1) = 1;
  uint64_t v28 = v13;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = &v37;
  uint64_t v33 = 0;
  if ((a5 & 0x40000000) != 0) {
    uint64_t v14 = 1107296259;
  }
  else {
    uint64_t v14 = 1107296258;
  }
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v26 = a2;
  uint64_t v27 = v14 | (a5 >> 25) & 8 | (a5 >> 23) & 0x10;
  if ((a5 & 0x81FFFFFE) != 0)
  {
    *__error() = 22;
    return 0;
  }
  if (__sandbox_ms()) {
    return 0;
  }
  if (v36) {
    goto LABEL_9;
  }
  if (v37) {
    return _sandbox_extension_issue(a1, 0, a3, 2);
  }
  long long v22 = a6[1];
  long long v24 = *a6;
  long long v25 = v22;
  int v23 = sandbox_check_by_audit_token((uint64_t)&v24, a4, a5 | 0x20000001, v15, v16, v17, v18, v19, a3);
  if (v23 < 0) {
    return 0;
  }
  if (!v23) {
    return _sandbox_extension_issue(a1, 0, a3, 2);
  }
LABEL_9:
  uint64_t v21 = __error();
  double result = 0;
  *uint64_t v21 = 1;
  return result;
}

uint64_t sandbox_suspend()
{
  return __sandbox_ms();
}

uint64_t sandbox_unsuspend()
{
  return __sandbox_ms();
}

uint64_t sandbox_spawnattrs_getprofilename(uint64_t a1, void *a2)
{
  *a2 = a1 + 16;
  return 0;
}

uint64_t sandbox_spawnattrs_setcontainer(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 < 0x400)
  {
    int v6 = v4;
    memcpy((void *)(a1 + 80), __s, v4 + 1);
    uint64_t result = 0;
    *(_DWORD *)(a1 + 12) = v6;
  }
  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sandbox_spawnattrs_getcontainer(uint64_t a1, void *a2)
{
  *a2 = a1 + 80;
  return 0;
}

uint64_t sandbox_proc_getprofilename()
{
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_proc_getcontainer()
{
  return 0xFFFFFFFFLL;
}

void *sandbox_message_filter_query(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  long long v30 = 0;
  uint64_t v31 = a2;
  sandbox_operation_fixup(&v31);
  v20[0] = 0;
  long long v21 = 0u;
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v22 = 0;
  long long v24 = 0u;
  v20[1] = a1;
  *(void *)&long long v21 = v31;
  uint64_t v23 = 0x4000000;
  long long v11 = malloc_type_malloc(0x400uLL, 0xFF835187uLL);
  if (v11)
  {
    int v12 = 3;
    size_t v13 = 1024;
    while (1)
    {
      size_t v19 = v13;
      *((void *)&v26 + 1) = v11;
      *(void *)&long long v27 = &v19;
      long long v30 = &a9;
      int v14 = sandbox_check_common(v20, a3, &a9);
      size_t v13 = v19;
      if (!v14) {
        break;
      }
      int v15 = v14;
      uint64_t v16 = __error();
      if (v15 >= 1)
      {
        int *v16 = 1;
        goto LABEL_10;
      }
      if (*v16 == 34)
      {
        long long v11 = reallocf(v11, v13);
        if (v11)
        {
          if (--v12) {
            continue;
          }
        }
      }
      goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    int v17 = *__error();
    free(v11);
    long long v11 = 0;
    *__error() = v17;
  }
  return v11;
}

uint64_t sandbox_check_message_filter_string(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  if (!a5) {
    return 22;
  }
  if (!a2) {
    return 0;
  }
  if ((a4 & 0x40000000) != 0) {
    a4 &= ~0x40000000u;
  }
  if (a4)
  {
    sandbox_warn();
    *__error() = 45;
  }
  else if (!__sandbox_ms())
  {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_check_message_filter_integer(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (!a2) {
    return 0;
  }
  if ((a4 & 0x40000000) != 0) {
    a4 &= ~0x40000000u;
  }
  if (a4)
  {
    sandbox_warn();
    *__error() = 45;
  }
  else if (!__sandbox_ms())
  {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_message_filter_retain(uint64_t a1)
{
  if (a1 && __sandbox_ms()) {
    sandbox_message_filter_retain_cold_1();
  }
  return a1;
}

uint64_t sandbox_message_filter_release(uint64_t result)
{
  if (result)
  {
    uint64_t result = __sandbox_ms();
    if (result)
    {
      __error();
      v1 = __error();
      strerror(*v1);
      return sandbox_warn();
    }
  }
  return result;
}

uint64_t sandbox_apply_bytecode(uint64_t a1, int a2, char *__s)
{
  if (!a1) {
    return 22;
  }
  if (__s) {
    strlen(__s);
  }
  return __sandbox_ms();
}

uint64_t sandbox_note()
{
  return __sandbox_ms();
}

BOOL sandbox_builtin_query()
{
  return __sandbox_ms() == 0;
}

uint64_t sandbox_enable_root_translation()
{
  return __sandbox_ms();
}

uint64_t _sandbox_register_app_bundle_1(uint64_t a1, uint64_t a2)
{
  uint64_t result = _sandbox_register_app_bundle_0();
  if (!result)
  {
    if (!a2) {
      return 0;
    }
    uint64_t result = _sandbox_register_exception_common();
    if (!result)
    {
      uint64_t result = _sandbox_register_exception_common();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t _sandbox_register_app_bundle_0()
{
  uint64_t result = __sandbox_ms();
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t sandbox_unregister_app_bundle()
{
  uint64_t result = __sandbox_ms();
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t sandbox_register_app_bundle_exception()
{
  return _sandbox_register_exception_common();
}

uint64_t _sandbox_register_exception_common()
{
  if (!__sandbox_ms()) {
    return 0;
  }
  pid_t v0 = __error();
  uint64_t v1 = *v0;
  strerror(*v0);
  sandbox_warn();
  return v1;
}

uint64_t sandbox_register_app_bundle_package_exception()
{
  return _sandbox_register_exception_common();
}

uint64_t sandbox_register_app_container()
{
  uint64_t result = __sandbox_ms();
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t sandbox_unregister_app_container()
{
  uint64_t result = __sandbox_ms();
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t sandbox_check_protected_app_container(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t result = __sandbox_ms();
  if (result) {
    return *__error();
  }
  *a2 = 0;
  *a3 = 0;
  return result;
}

uint64_t sandbox_register_app_container_exception()
{
  return _sandbox_register_exception_common();
}

uint64_t sandbox_register_app_container_package_exception()
{
  return _sandbox_register_exception_common();
}

uint64_t sandbox_register_sync_root()
{
  uint64_t result = __sandbox_ms();
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t sandbox_register_bastion_profile()
{
  return 45;
}

uint64_t sandbox_unregister_bastion_profile()
{
  return 45;
}

uint64_t sandbox_init_with_extensions(const char *a1, uint64_t a2, uint64_t *a3, char **a4)
{
  if (*a3)
  {
    unint64_t v8 = 1;
    while (a3[v8++])
      ;
    if (v8 >> 61) {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v8 = 1;
  }
  long long v10 = (const char **)malloc_type_malloc(8 * v8, 0x10040436913F5uLL);
  if (v10)
  {
    long long v11 = v10;
    uint64_t v12 = *a3;
    if (*a3)
    {
      uint64_t v13 = 0;
      int v14 = a3 + 1;
      while (1)
      {
        int v15 = (const char *)sandbox_extension_issue_file((uint64_t)"com.apple.sandbox.container", v12, 0);
        v11[v13] = v15;
        if (!v15) {
          break;
        }
        uint64_t v16 = v13 + 1;
        uint64_t v12 = v14[v13++];
        if (!v12) {
          goto LABEL_15;
        }
      }
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v16 = 0;
LABEL_15:
      v11[v16] = 0;
      uint64_t v17 = sandbox_init(a1, a2, a4);
      if (!v17)
      {
        uint64_t v18 = *v11;
        if (!*v11)
        {
          uint64_t v17 = 0;
LABEL_25:
          free(v11);
          return v17;
        }
        size_t v19 = v11 + 1;
        do
        {
          if (sandbox_extension_consume(v18) == -1) {
            abort();
          }
          long long v20 = *v19++;
          uint64_t v18 = v20;
        }
        while (v20);
        uint64_t v17 = 0;
      }
    }
    long long v21 = (char *)*v11;
    if (*v11)
    {
      uint64_t v22 = (void **)(v11 + 1);
      do
      {
        free(v21);
        uint64_t v23 = (char *)*v22++;
        long long v21 = v23;
      }
      while (v23);
    }
    goto LABEL_25;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_issue_extension(uint64_t a1, void *a2)
{
  uint64_t v3 = sandbox_extension_issue_file((uint64_t)"com.apple.app-sandbox.read-write", a1, 0);
  *a2 = v3;
  if (v3) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sandbox_issue_fs_extension(uint64_t a1, char a2, void *a3)
{
  size_t v4 = APP_SANDBOX_READ_WRITE;
  if ((a2 & 8) == 0) {
    size_t v4 = APP_SANDBOX_READ;
  }
  uint64_t v5 = sandbox_extension_issue_file((uint64_t)*v4, a1, 0);
  *a3 = v5;
  if (v5) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sandbox_issue_fs_rw_extension(uint64_t a1, void *a2)
{
  uint64_t v3 = sandbox_extension_issue_file((uint64_t)"com.apple.app-sandbox.read-write", a1, 0);
  *a2 = v3;
  if (v3) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sandbox_issue_mach_extension(uint64_t a1, void *a2)
{
  uint64_t v3 = sandbox_extension_issue_mach((uint64_t)"com.apple.app-sandbox.mach", a1, 0);
  *a2 = v3;
  if (v3) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sandbox_consume_extension(uint64_t a1, const char *a2)
{
  if (sandbox_extension_consume(a2) == -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sandbox_consume_fs_extension(const char *a1, void *a2)
{
  uint64_t v3 = sandbox_extension_consume(a1);
  if (a2 && v3 != -1) {
    *a2 = 0;
  }
  if (v3 == -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sandbox_consume_mach_extension(const char *a1, void *a2)
{
  uint64_t v3 = sandbox_extension_consume(a1);
  if (a2 && v3 != -1) {
    *a2 = 0;
  }
  if (v3 == -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sandbox_release_fs_extension()
{
  return __sandbox_ms();
}

uint64_t rootless_allows_task_for_pid()
{
  return 1;
}

uint64_t rootless_check_restricted_flag(const char *a1, const char *a2)
{
  return rootless_check_protected_flag(a1, a2, 0x80000);
}

uint64_t rootless_mkdir_restricted(const char *a1, mode_t a2, const char *a3)
{
  return rootless_mkdir_protected(a1, a2, a3, 0x80000u);
}

uint64_t rootless_mkdir_protected(const char *a1, mode_t a2, const char *a3, __uint32_t a4)
{
  uint64_t v47 = *MEMORY[0x263EF8C08];
  bzero(v46, 0x400uLL);
  memset(&v30, 0, sizeof(v30));
  memset(&v29, 0, sizeof(v29));
  if (dirname_r(a1, v46))
  {
    int v8 = open(v46, 1074790400);
    if ((v8 & 0x80000000) == 0)
    {
      int v9 = v8;
      if (fstat(v8, &v30) < 0) {
        goto LABEL_19;
      }
      long long v44 = 0u;
      memset(v45, 0, sizeof(v45));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      *(_OWORD *)uint64_t v31 = 0u;
      if (!basename_r(a1, v31)
        || (v10 = mkdirat(v9, v31, a2)) != 0 && ((long long v11 = __error(), a4 != 0x100000) || *v11 != 17))
      {
LABEL_19:
        int v21 = *__error();
        goto LABEL_20;
      }
      int v12 = openat(v9, v31, 1611661312);
      unsigned int v13 = v12;
      if ((v12 & 0x80000000) == 0 && (fstat(v12, &v29) & 0x80000000) == 0)
      {
        if (v29.st_dev != v30.st_dev)
        {
          uint64_t v23 = "%s: failed: %s not on same filesystem as parent";
          uint64_t v24 = 3;
          goto LABEL_24;
        }
        long long v20 = "";
        if (a3) {
          long long v20 = a3;
        }
        uint64_t v27 = v13;
        long long v28 = v20;
        if (!__sandbox_ms() && !fchflags(v13, a4))
        {
          memset(&v26, 0, sizeof(v26));
          close(v13);
          int v25 = openat(v9, v31, 1611661312);
          unsigned int v13 = v25;
          if ((v25 & 0x80000000) == 0 && (fstat(v25, &v26) & 0x80000000) == 0)
          {
            if (v26.st_dev == v29.st_dev && v26.st_ino == v29.st_ino)
            {
              if ((a4 & ~v26.st_flags) == 0)
              {
                close(v9);
                close(v13);
                return 0;
              }
              uint64_t v23 = "%s: failed: %s not protected";
            }
            else
            {
              uint64_t v23 = "%s: failed: %s moved before protection";
            }
            uint64_t v24 = 1;
LABEL_24:
            rootless_log(v24, v23, v14, v15, v16, v17, v18, v19, (char)"rootless_mkdir_protected");
            *__error() = 89;
            int v21 = *__error();
            if (v10)
            {
LABEL_26:
              close(v13);
              goto LABEL_20;
            }
            goto LABEL_25;
          }
        }
      }
      int v21 = *__error();
      if (v10)
      {
        if ((v13 & 0x80000000) != 0) {
          goto LABEL_20;
        }
        goto LABEL_26;
      }
LABEL_25:
      unlinkat(v9, v31, 2176);
      if ((v13 & 0x80000000) == 0) {
        goto LABEL_26;
      }
LABEL_20:
      close(v9);
      goto LABEL_21;
    }
  }
  int v21 = *__error();
LABEL_21:
  *__error() = v21;
  return 0xFFFFFFFFLL;
}

uint64_t rootless_mkdir_datavault(const char *a1, mode_t a2, const char *a3)
{
  return rootless_mkdir_protected(a1, a2, a3, 0x80u);
}

uint64_t rootless_mkdir_nounlink(const char *a1, mode_t a2, const char *a3)
{
  return rootless_mkdir_protected(a1, a2, a3, 0x100000u);
}

uint64_t rootless_convert_to_datavault(const char *a1)
{
  v46[2] = *(char **)MEMORY[0x263EF8C08];
  int v2 = open(a1, 256);
  if (v2 == -1)
  {
    int v12 = __error();
    strerror(*v12);
    rootless_log(3, "%s: open(%s): %s", v13, v14, v15, v16, v17, v18, (char)"rootless_convert_to_datavault");
    return 0xFFFFFFFFLL;
  }
  int v3 = v2;
  if (__sandbox_ms())
  {
    size_t v4 = "%s: rootless_set_storage_class(%s): %s";
LABEL_4:
    uint64_t v5 = __error();
    strerror(*v5);
    rootless_log(3, v4, v6, v7, v8, v9, v10, v11, (char)"rootless_convert_to_datavault");
    close(v3);
    return 0xFFFFFFFFLL;
  }
  v46[0] = (char *)a1;
  v46[1] = 0;
  int v21 = fts_open(v46, 84, 0);
  if (!v21)
  {
    size_t v4 = "%s: fts_open(%s): %s";
    goto LABEL_4;
  }
  uint64_t v22 = v21;
  uint64_t v23 = fts_read(v21);
  if (v23)
  {
    stat v30 = v23;
    while (1)
    {
      switch(v30->fts_info)
      {
        case 4u:
        case 7u:
        case 0xAu:
          rootless_log(3, "%s: bad fts entity %d:%d at %s", v24, v25, v26, v27, v28, v29, (char)"rootless_convert_to_datavault");
          goto LABEL_19;
        case 6u:
          goto LABEL_14;
        default:
          __uint32_t st_flags = v30->fts_statp->st_flags;
          if ((st_flags & 0x80) == 0 && lchflags(v30->fts_accpath, st_flags | 0x80))
          {
            long long v39 = __error();
            strerror(*v39);
            rootless_log(3, "%s: lchflags(%s): %s", v40, v41, v42, v43, v44, v45, (char)"rootless_convert_to_datavault");
LABEL_19:
            uint64_t v19 = 0xFFFFFFFFLL;
            goto LABEL_21;
          }
LABEL_14:
          stat v30 = fts_read(v22);
          if (!v30) {
            goto LABEL_15;
          }
          break;
      }
    }
  }
LABEL_15:
  if (*__error())
  {
    long long v32 = __error();
    strerror(*v32);
    rootless_log(3, "%s: fts_read: %s", v33, v34, v35, v36, v37, v38, (char)"rootless_convert_to_datavault");
    goto LABEL_19;
  }
  uint64_t v19 = 0;
LABEL_21:
  close(v3);
  fts_close(v22);
  return v19;
}

uint64_t rootless_remove_datavault_in_favor_of_static_storage_class(const char *a1)
{
  return rootless_remove_in_favor_of_static_storage_class(a1, 128);
}

uint64_t rootless_remove_in_favor_of_static_storage_class(const char *a1, int a2)
{
  v55[2] = *(char **)MEMORY[0x263EF8C08];
  int v4 = open(a1, 256);
  if (v4 == -1)
  {
    uint64_t v14 = __error();
    strerror(*v14);
    rootless_log(3, "%s: open(%s): %s", v15, v16, v17, v18, v19, v20, (char)"rootless_remove_in_favor_of_static_storage_class");
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  if (__sandbox_ms())
  {
    uint64_t v6 = "%s: rootless_check_clear_storage_class(%s): %s";
LABEL_4:
    uint64_t v7 = __error();
    strerror(*v7);
    rootless_log(3, v6, v8, v9, v10, v11, v12, v13, (char)"rootless_remove_in_favor_of_static_storage_class");
    close(v5);
    return 0xFFFFFFFFLL;
  }
  v55[0] = (char *)a1;
  v55[1] = 0;
  uint64_t v23 = fts_open(v55, 84, 0);
  if (!v23)
  {
    uint64_t v6 = "%s: fts_open(%s): %s";
    goto LABEL_4;
  }
  uint64_t v24 = v23;
  uint64_t v25 = fts_read(v23);
  if (v25)
  {
    long long v32 = v25;
    while (1)
    {
      switch(v32->fts_info)
      {
        case 1u:
          goto LABEL_14;
        case 4u:
        case 7u:
        case 0xAu:
          rootless_log(3, "%s: bad fts entity %d:%d at %s", v26, v27, v28, v29, v30, v31, (char)"rootless_remove_in_favor_of_static_storage_class");
          goto LABEL_23;
        default:
          __uint32_t st_flags = v32->fts_statp->st_flags;
          if ((st_flags & a2) != 0 && lchflags(v32->fts_accpath, st_flags & ~a2))
          {
            v48 = __error();
            strerror(*v48);
            rootless_log(3, "%s: lchflags(%s): %s", v49, v50, v51, v52, v53, v54, (char)"rootless_remove_in_favor_of_static_storage_class");
LABEL_23:
            uint64_t v21 = 0xFFFFFFFFLL;
            goto LABEL_24;
          }
LABEL_14:
          long long v32 = fts_read(v24);
          if (!v32) {
            goto LABEL_15;
          }
          break;
      }
    }
  }
LABEL_15:
  if (*__error())
  {
    uint64_t v34 = __error();
    strerror(*v34);
    rootless_log(3, "%s: fts_read: %s", v35, v36, v37, v38, v39, v40, (char)"rootless_remove_in_favor_of_static_storage_class");
    goto LABEL_23;
  }
  if (__sandbox_ms())
  {
    uint64_t v41 = __error();
    strerror(*v41);
    rootless_log(3, "%s: rootless_clear_storage_class(%s): %s", v42, v43, v44, v45, v46, v47, (char)"rootless_remove_in_favor_of_static_storage_class");
    goto LABEL_23;
  }
  uint64_t v21 = 0;
LABEL_24:
  close(v5);
  fts_close(v24);
  return v21;
}

uint64_t rootless_remove_restricted_in_favor_of_static_storage_class(const char *a1)
{
  return rootless_remove_in_favor_of_static_storage_class(a1, 0x80000);
}

uint64_t rootless_restricted_environment()
{
  if (csops()) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t rootless_check_trusted(const char *a1)
{
  return rootless_check_trusted_internal(a1, 0xFFFFFFFF, 0);
}

uint64_t rootless_check_trusted_class(const char *a1, uint64_t a2)
{
  return rootless_check_trusted_internal(a1, 0xFFFFFFFF, a2);
}

uint64_t rootless_check_trusted_fd(unsigned int a1)
{
  return rootless_check_trusted_internal(0, a1, 0);
}

uint64_t rootless_protected_volume()
{
  if (__sandbox_ms()) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t rootless_protected_volume_fd()
{
  if (__sandbox_ms()) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t rootless_suspend()
{
  return 0;
}

uint64_t rootless_register_trusted_storage_class(char *__s, int a2)
{
  uint64_t v4 = trusted_storage_classes_0;
  if (trusted_storage_classes_0)
  {
    while (1)
    {
      if (*(_DWORD *)(v4 + 8) == a2)
      {
        uint64_t result = strcmp(__s, (const char *)(v4 + 12));
        if (!result) {
          break;
        }
      }
      uint64_t v4 = *(void *)v4;
      if (!v4) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    size_t v6 = strlen(__s);
    uint64_t v7 = malloc_type_calloc(1uLL, v6 + 13, 0x5B938CA2uLL);
    if (!v7) {
      rootless_register_trusted_storage_class_cold_1();
    }
    uint64_t v8 = v7;
    *((_DWORD *)v7 + 2) = a2;
    uint64_t result = (uint64_t)memcpy((char *)v7 + 12, __s, v6 + 1);
    *uint64_t v8 = trusted_storage_classes_0;
    trusted_storage_classes_0 = (uint64_t)v8;
  }
  return result;
}

uint64_t rootless_verify_trusted_by_self_token(unsigned int a1, char a2)
{
  if ((a1 & 0x80000000) == 0) {
    rootless_verify_trusted_by_self_token_cold_1();
  }
  return (a1 >> a2) & 1;
}

BOOL is_path_on_authenticated_root_volume(const char *a1)
{
  uint64_t v21 = 0;
  long long v20 = xmmword_20D746650;
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  if (getattrlist(a1, &v20, v18, 0x28uLL, 0))
  {
    __error();
    int v2 = __error();
    strerror(*v2);
    rootless_log(7, "getattrlist failed for %s: #%d: %s", v3, v4, v5, v6, v7, v8, (char)a1);
    return 0;
  }
  if ((BYTE5(v18[0]) & 0x40) == 0 || (BYTE11(v18[0]) & 2) == 0) {
    return 0;
  }
  uint64_t v25 = 0x20000000000;
  long long v24 = xmmword_20D746668;
  int v23 = 0;
  uint64_t v22 = 0;
  if (!getattrlist(a1, &v24, &v22, 0xCuLL, 0x20u)) {
    return (v22 & 0x2000000000) == 0;
  }
  int v10 = *__error();
  uint64_t v11 = __error();
  strerror(*v11);
  rootless_log(7, "getattrlist failed: #%d: %s", v12, v13, v14, v15, v16, v17, v10);
  return 1;
}

void sandbox_message_filter_retain_cold_1()
{
  __error();
  pid_t v0 = __error();
  strerror(*v0);
  sandbox_warn();
  abort();
}

void rootless_register_trusted_storage_class_cold_1()
{
}

void rootless_verify_trusted_by_self_token_cold_1()
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270EDD478]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x270EDD518]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270EDCF00]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270EDCF08]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270EDCF20]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x270EDDC10]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x270EDDC18]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x270EDDC30]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x270EDDC38]();
}

uint64_t _simple_string()
{
  return MEMORY[0x270EDDC48]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x270EDDC58]();
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270EDCFD8](a1, a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDD018](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270EDD5C8](*(void *)&a1);
}

uint64_t csops()
{
  return MEMORY[0x270EDD5E8]();
}

char *__cdecl dirname_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDD050](a1, a2);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270EDCE28](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270EDCE30]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270EDCE38](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270EDCE40](__handle, __symbol);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x270EDD608](*(void *)&a1, *(void *)&a2);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270EDD638](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270EDD688](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x270EDD108](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x270EDD110](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x270EDD118](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270EDD6B0](a1, a2, a3, a4, *(void *)&a5);
}

pid_t getpid(void)
{
  return MEMORY[0x270EDD6F0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDD710](path, name, value, size, *(void *)&position, *(void *)&options);
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x270EDD168](a1, *(void *)&a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB00](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDD180](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDD188](__dst, __src, __n);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x270EDD8B0](*(void *)&a1, a2, a3);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x270EDD1B0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDD8D0](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x270EDD8E8](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDDB28](__ptr, __size);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDD9E0](a1, a2);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDD2E0](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDD360](a1, a2, a3, a4, a5);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x270EDDA60](*(void *)&a1, a2, *(void *)&a3);
}