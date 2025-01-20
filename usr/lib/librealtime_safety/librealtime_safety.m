void *realtime_runtime_check_pop_authorization(void *result)
{
  void *v1;
  pthread_key_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  const void *v13;
  char v14;
  uint64_t vars8;

  if (checkers)
  {
    v1 = result;
    if (per_thread_key_once != -1) {
      dispatch_once_f(&per_thread_key_once, &per_thread_key_key, (dispatch_function_t)create_thread_key);
    }
    v2 = per_thread_key_key;
    result = pthread_getspecific(per_thread_key_key);
    if (result)
    {
      if (v1 == (void *)&root_node || result != v1) {
        realtime_runtime_check_crash("something went wrong", v3, v4, v5, v6, v7, v8, v9, v14);
      }
      v10 = checkers;
      if (checkers)
      {
        v11 = &qword_26AA37360;
        do
        {
          (*(void (**)(void *))(v10 + 24))(v1);
          v12 = *v11++;
          v10 = v12;
        }
        while (v12);
      }
      v13 = (const void *)v1[1];
      return (void *)pthread_setspecific(v2, v13);
    }
  }
  return result;
}

uint64_t realtime_runtime_check_push_authorization(uint64_t result, uint64_t a2, _DWORD *a3)
{
  if (checkers[0])
  {
    int v5 = result;
    if (per_thread_key_once != -1) {
      dispatch_once_f(&per_thread_key_once, &per_thread_key_key, (dispatch_function_t)create_thread_key);
    }
    pthread_key_t v6 = per_thread_key_key;
    result = (uint64_t)pthread_getspecific(per_thread_key_key);
    if (result)
    {
      int v7 = *(_DWORD *)(result + 4) | v5;
      *a3 = v5;
      a3[1] = v7;
      *((void *)a3 + 1) = result;
      result = pthread_setspecific(v6, a3);
      uint64_t v8 = checkers[0];
      if (checkers[0])
      {
        v9 = &qword_26AA37360;
        do
        {
          result = (*(uint64_t (**)(_DWORD *, uint64_t))(v8 + 16))(a3, a2);
          uint64_t v10 = *v9++;
          uint64_t v8 = v10;
        }
        while (v10);
      }
    }
  }
  return result;
}

void realtime_runtime_check_crash(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = checkers;
  if (checkers)
  {
    v11 = &qword_26AA37360;
    do
    {
      (*(void (**)(void))(v10 + 8))();
      uint64_t v12 = *v11++;
      uint64_t v10 = v12;
    }
    while (v12);
  }
  pthread_key_t v13 = per_thread_key();
  pthread_setspecific(v13, 0);
  vsnprintf(__str, 0xFFuLL, a1, &a9);
  _os_crash();
  __break(1u);
}

uint64_t per_thread_key()
{
  if (per_thread_key_once != -1) {
    dispatch_once_f(&per_thread_key_once, &per_thread_key_key, (dispatch_function_t)create_thread_key);
  }
  return per_thread_key_key;
}

void realtime_runtime_check_start()
{
  if (checkers)
  {
    if (per_thread_key_once != -1) {
      dispatch_once_f(&per_thread_key_once, &per_thread_key_key, (dispatch_function_t)create_thread_key);
    }
    pthread_key_t v0 = per_thread_key_key;
    if (pthread_getspecific(per_thread_key_key)) {
      realtime_runtime_check_crash("something went wrong", v1, v2, v3, v4, v5, v6, v7, v12);
    }
    uint64_t v8 = pthread_setspecific(v0, &root_node);
    v9 = (uint64_t (**)(uint64_t))checkers;
    if (checkers)
    {
      uint64_t v10 = &qword_26AA37360;
      do
      {
        uint64_t v8 = (*v9)(v8);
        v11 = (uint64_t (**)(uint64_t))*v10++;
        v9 = v11;
      }
      while (v11);
    }
  }
}

void realtime_runtime_check_stop()
{
  uint64_t v0 = checkers;
  if (checkers)
  {
    uint64_t v1 = &qword_26AA37360;
    do
    {
      (*(void (**)(void))(v0 + 8))();
      uint64_t v2 = *v1++;
      uint64_t v0 = v2;
    }
    while (v2);
    if (per_thread_key_once != -1) {
      dispatch_once_f(&per_thread_key_once, &per_thread_key_key, (dispatch_function_t)create_thread_key);
    }
    pthread_key_t v3 = per_thread_key_key;
    if (pthread_getspecific(per_thread_key_key) != &root_node) {
      realtime_runtime_check_crash("unpaired realtime_runtime_check_stop()", v4, v5, v6, v7, v8, v9, v10, v11);
    }
    pthread_setspecific(v3, 0);
  }
}

void *realtime_runtime_checker_get_current_thread_storage()
{
  if (per_thread_key_once != -1) {
    dispatch_once_f(&per_thread_key_once, &per_thread_key_key, (dispatch_function_t)create_thread_key);
  }
  pthread_key_t v0 = per_thread_key_key;

  return pthread_getspecific(v0);
}

uint64_t realtime_runtime_check_register_checker(uint64_t a1)
{
  if (realtime_runtime_check_register_checker_once != -1) {
    dispatch_once(&realtime_runtime_check_register_checker_once, &__block_literal_global);
  }
  if (realtime_runtime_check_register_checker_realtime_runtime_check_disabled)
  {
    uint64_t v2 = __error();
    uint64_t result = 0;
    int v4 = 1;
LABEL_9:
    *uint64_t v2 = v4;
  }
  else
  {
    uint64_t v5 = 0;
    while (checkers[v5])
    {
      if (++v5 == 4)
      {
        uint64_t v2 = __error();
        uint64_t result = 0;
        int v4 = 28;
        goto LABEL_9;
      }
    }
    checkers[v5] = a1;
    return 1;
  }
  return result;
}

void __realtime_runtime_check_register_checker_block_invoke()
{
  if (getenv("REALTIME_DISABLE_RUNTIME_CHECK"))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_263D9B000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "REALTIME_DISABLE_RUNTIME_CHECK is set, disabling realtime runtime checks", buf, 2u);
    }
    realtime_runtime_check_register_checker_realtime_runtime_check_disabled = 1;
  }
  if (getenv("METAL_CAPTURE_ENABLED"))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_263D9B000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Metal Capture is enabled, disabling realtime runtime checks", v1, 2u);
    }
    realtime_runtime_check_register_checker_realtime_runtime_check_disabled = 1;
  }
  if (getenv("MallocStackLogging"))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)pthread_key_t v0 = 0;
      _os_log_impl(&dword_263D9B000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "MallocStackLogging is enabled, disabling realtime runtime checks", v0, 2u);
    }
    realtime_runtime_check_register_checker_realtime_runtime_check_disabled = 1;
  }
  if (per_thread_key_once != -1) {
    dispatch_once_f(&per_thread_key_once, &per_thread_key_key, (dispatch_function_t)create_thread_key);
  }
}

uint64_t create_thread_key(pthread_key_t *a1)
{
  uint64_t result = pthread_key_create(a1, 0);
  if (result) {
    realtime_runtime_check_crash("can't create pthread key");
  }
  return result;
}

void __realtime_assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  v8[0] = 0;
  v8[1] = 0;
  realtime_runtime_check_push_authorization(0xFFFFFFFFLL, (uint64_t)"assert", v8);
  __assert_rtn(a1, a2, a3, a4);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}