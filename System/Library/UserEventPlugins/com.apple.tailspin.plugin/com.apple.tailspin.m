uint64_t init_tailspin()
{
  int v0;
  uint64_t tailspin_ondisk_config;
  int v2;
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  _DWORD *v18;
  uint64_t tailspin_profile_config;
  uint64_t tailspin_tasking_config;
  uint64_t result;
  int v22;
  uint64_t v23;
  BOOL v24;
  int v25;
  int v26;
  NSObject *v27;
  size_t v28;
  uint8_t v29[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint8_t buf[4];
  unsigned char v34[10];
  int v35;
  __int16 v36;
  int v37;

  v0 = is_apple_internal_setting();
  tailspin_ondisk_config = get_tailspin_ondisk_config();
  if (tailspin_ondisk_config)
  {
    v2 = strncmp("Photos", (const char *)(tailspin_ondisk_config + 8361), 6uLL);
    v3 = tailspin_enabled_get();
    v4 = *__error();
    v5 = sub_38DC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v34 = v2 == 0;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "is Photos: %{BOOL}d, is tailspin enabled: %{BOOL}d", buf, 0xEu);
    }

    *__error() = v4;
    if (v2) {
      v6 = 0;
    }
    else {
      v6 = v3 ^ 1;
    }
    if (!v0) {
      goto LABEL_14;
    }
  }
  else
  {
    v7 = *__error();
    v8 = sub_38DC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Not Photos, no on-disk config", buf, 2u);
    }

    v6 = 0;
    *__error() = v7;
    if (!v0) {
      goto LABEL_14;
    }
  }
  if (!v6)
  {
    v9 = 0;
    goto LABEL_21;
  }
LABEL_14:
  bzero(buf, 0x400uLL);
  v28 = 1024;
  sysctlbyname("kern.osversion", buf, &v28, 0, 0);
  v10 = +[NSString stringWithUTF8String:buf];
  v11 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.tailspin"];
  v12 = [v11 stringForKey:@"tailspin_configuration_last_build_reset"];
  v13 = *__error();
  v14 = sub_38DC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v29 = 138543618;
    v30 = v12;
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "last build reset: %{public}@, current build: %{public}@", v29, 0x16u);
  }

  *__error() = v13;
  if (v12 && ([v12 isEqualToString:v10] & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    unlink("/var/db/tailspin_config.plist");
    [v11 setObject:v10 forKey:@"tailspin_configuration_last_build_reset"];
    v9 = 1;
  }

LABEL_21:
  v15 = *__error();
  v16 = sub_38DC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = "Didn't";
    *(_DWORD *)buf = 136446722;
    if (v9) {
      v17 = "Did";
    }
    *(void *)v34 = v17;
    *(_WORD *)&v34[8] = 1024;
    v35 = v0;
    v36 = 1024;
    v37 = v6;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}s reset on-disk tailspin configuration. Apple-Internal: %{BOOL}d, Is Photos: %{BOOL}d", buf, 0x18u);
  }

  *__error() = v15;
  v18 = (_DWORD *)get_tailspin_ondisk_config();
  tailspin_profile_config = get_tailspin_profile_config();
  tailspin_tasking_config = get_tailspin_tasking_config();
  result = tailspin_enabled_get_default();
  if (v18)
  {
    result = tailspin_enabled_get();
    v22 = result;
    switch(v18[2])
    {
      case 0:
        v23 = tailspin_profile_config | tailspin_tasking_config;
        goto LABEL_29;
      case 1:
        v25 = 1;
        if (tailspin_profile_config) {
          goto LABEL_45;
        }
        if (!tailspin_tasking_config) {
          goto LABEL_45;
        }
        result = bcmp((const void *)tailspin_tasking_config, v18, 0x2118uLL);
        if (result) {
          goto LABEL_45;
        }
        goto LABEL_43;
      case 2:
        v24 = tailspin_profile_config == 0;
        goto LABEL_35;
      case 3:
        if (tailspin_profile_config)
        {
          result = bcmp(v18, (const void *)tailspin_profile_config, 0x2118uLL);
          if (!result) {
            goto LABEL_43;
          }
        }
        v25 = 1;
        goto LABEL_45;
      default:
LABEL_43:
        v25 = 0;
        goto LABEL_44;
    }
  }
  v22 = result;
  v23 = tailspin_tasking_config | tailspin_profile_config;
LABEL_29:
  v24 = v23 == 0;
LABEL_35:
  v25 = !v24;
  if ((v25 & 1) == 0)
  {
LABEL_44:
    if (!v22) {
      goto LABEL_49;
    }
  }
LABEL_45:
  v26 = *__error();
  v27 = sub_38DC();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_3A10(v27);
  }

  *__error() = v26;
  result = tailspin_poke();
  if (v25) {
    result = tailspin_resolve_configs();
  }
LABEL_49:
  if (v18) {
    result = tailspin_config_free();
  }
  if (tailspin_profile_config) {
    result = tailspin_config_free();
  }
  if (tailspin_tasking_config) {
    return tailspin_config_free();
  }
  return result;
}

id sub_38DC()
{
  if (qword_4238 != -1) {
    dispatch_once(&qword_4238, &stru_4160);
  }
  v0 = (void *)qword_4230;

  return v0;
}

void sub_3930(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tailspin", "library");
  v2 = (void *)qword_4230;
  qword_4230 = (uint64_t)v1;

  id v3 = (id)qword_4230;
  if (!v3) {
    sub_3A54();
  }
}

uint64_t sub_3990(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = snprintf(byte_4240, 0x400uLL, "%d ", a1);
  if ((result - 1) <= 0x3FE) {
    uint64_t result = vsnprintf(&byte_4240[result], 1024 - result, a2, &a9);
  }
  qword_41F8 = (uint64_t)byte_4240;
  return result;
}

void sub_3A10(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Calling tailspin poke", v1, 2u);
}

void sub_3A54()
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return _bcmp(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t get_tailspin_ondisk_config()
{
  return _get_tailspin_ondisk_config();
}

uint64_t get_tailspin_profile_config()
{
  return _get_tailspin_profile_config();
}

uint64_t get_tailspin_tasking_config()
{
  return _get_tailspin_tasking_config();
}

uint64_t is_apple_internal_setting()
{
  return _is_apple_internal_setting();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tailspin_config_free()
{
  return _tailspin_config_free();
}

uint64_t tailspin_enabled_get()
{
  return _tailspin_enabled_get();
}

uint64_t tailspin_enabled_get_default()
{
  return _tailspin_enabled_get_default();
}

uint64_t tailspin_poke()
{
  return _tailspin_poke();
}

uint64_t tailspin_resolve_configs()
{
  return _tailspin_resolve_configs();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}