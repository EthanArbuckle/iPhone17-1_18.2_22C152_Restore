void *cryptex_trampoline_upgrade_wait_options_create()
{
  void *result;
  uint64_t v1;
  _OWORD v2[5];
  uint64_t v3;

  v3 = *MEMORY[0x263EF8340];
  result = malloc_type_calloc(1uLL, 8uLL, 0x61D5536CuLL);
  if (!result) {
    cryptex_trampoline_upgrade_wait_options_create_cold_1(&v1, v2);
  }
  return result;
}

void cryptex_trampoline_upgrade_wait_options_destroy(void **a1)
{
  v2 = *a1;
  if (v2) {
    free(v2);
  }

  free(a1);
}

void cryptex_trampoline_upgrade_wait_options_set_cryptex_name(void **a1, const char *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = *a1;
  if (v4)
  {
    free(v4);
    *a1 = 0;
  }
  if (a2)
  {
    if (_dispatch_is_multithreaded())
    {
      while (1)
      {
        v5 = strdup(a2);
        if (v5) {
          break;
        }
        __os_temporary_resource_shortage();
      }
    }
    else
    {
      v5 = strdup(a2);
      if (!v5) {
        cryptex_trampoline_upgrade_wait_options_set_cryptex_name_cold_1(a2, &v6, v7);
      }
    }
    *a1 = v5;
  }
}

uint64_t cryptex_trampoline_upgrade_wait(char *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v13 = 0;
  uint64_t is_ongoing = sysctl_upgrade_is_ongoing(&v13);
  if (is_ongoing)
  {
    uint64_t v3 = is_ongoing;
    int v4 = *__error();
    if (cryptex_trampoline_osl_onceToken != -1) {
      dispatch_once(&cryptex_trampoline_osl_onceToken, &__block_literal_global);
    }
    v5 = cryptex_trampoline_osl_trampoline_log;
    if (os_log_type_enabled((os_log_t)cryptex_trampoline_osl_trampoline_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      _os_log_impl(&dword_2638D0000, v5, OS_LOG_TYPE_ERROR, "Failed to read upgrade sysctl.: %{darwin.errno}d", buf, 8u);
    }
    a1 = 0;
  }
  else
  {
    if (!v13)
    {
      a1 = 0;
      uint64_t v3 = 0;
      goto LABEL_8;
    }
    if (a1)
    {
      v7 = *(const char **)a1;
      if (*(void *)a1)
      {
        if (_dispatch_is_multithreaded())
        {
          a1 = strdup(v7);
          if (!a1)
          {
            do
            {
              __os_temporary_resource_shortage();
              uint64_t v8 = strdup(v7);
            }
            while (!v8);
            a1 = v8;
          }
        }
        else
        {
          a1 = strdup(v7);
          if (!a1) {
            cryptex_trampoline_upgrade_wait_options_set_cryptex_name_cold_1(v7, &v14, buf);
          }
        }
      }
      else
      {
        a1 = 0;
      }
    }
    int v9 = *__error();
    if (cryptex_trampoline_osl_onceToken != -1) {
      dispatch_once(&cryptex_trampoline_osl_onceToken, &__block_literal_global);
    }
    v10 = cryptex_trampoline_osl_trampoline_log;
    if (os_log_type_enabled((os_log_t)cryptex_trampoline_osl_trampoline_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = a1;
      _os_log_impl(&dword_2638D0000, v10, OS_LOG_TYPE_INFO, "Blocking on upgrade for cryptex '%{public}s.", buf, 0xCu);
    }
    *__error() = v9;
    uint64_t v3 = cryptex_trampoline_upgrade_interface_wait();
    int v4 = *__error();
    if (v3)
    {
      if (cryptex_trampoline_osl_onceToken != -1) {
        dispatch_once(&cryptex_trampoline_osl_onceToken, &__block_literal_global);
      }
      v11 = cryptex_trampoline_osl_trampoline_log;
      if (os_log_type_enabled((os_log_t)cryptex_trampoline_osl_trampoline_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        _os_log_impl(&dword_2638D0000, v11, OS_LOG_TYPE_ERROR, "Error encountered blocking on cryptex upgrade.: %{darwin.errno}d", buf, 8u);
      }
    }
    else
    {
      if (cryptex_trampoline_osl_onceToken != -1) {
        dispatch_once(&cryptex_trampoline_osl_onceToken, &__block_literal_global);
      }
      v12 = cryptex_trampoline_osl_trampoline_log;
      if (os_log_type_enabled((os_log_t)cryptex_trampoline_osl_trampoline_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = a1;
        _os_log_impl(&dword_2638D0000, v12, OS_LOG_TYPE_INFO, "Unblocked after upgrade for cryptex '%{public}s.", buf, 0xCu);
      }
      uint64_t v3 = 0;
    }
  }
  *__error() = v4;
LABEL_8:
  free(a1);
  return v3;
}

os_log_t __cryptex_trampoline_osl_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libcryptex", "trampoline");
  cryptex_trampoline_osl_trampoline_log = (uint64_t)result;
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

uint64_t sysctl_upgrade_is_ongoing(BOOL *a1)
{
  int v4 = 0;
  size_t v3 = 4;
  if (sysctlbyname("kern.proc_rsr_in_progress", &v4, &v3, 0, 0)) {
    return *__error();
  }
  uint64_t result = 0;
  if (a1) {
    *a1 = v4 != 0;
  }
  return result;
}

void cryptex_trampoline_upgrade_wait_options_create_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_trampoline_upgrade_wait_options_set_cryptex_name_cold_1(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  v5 = __error();
  strerror(*v5);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
  __error();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __os_temporary_resource_shortage()
{
  return MEMORY[0x270ED7E58]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x270ED7F50]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

uint64_t cryptex_trampoline_upgrade_interface_wait()
{
  return MEMORY[0x270F99200]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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