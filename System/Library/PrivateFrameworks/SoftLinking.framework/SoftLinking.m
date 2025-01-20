uint64_t _sl_dlopen(void *a1, char **a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void **v8;
  size_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  char **v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  size_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  void *v25;
  char **v27;
  void **v28;
  void *v29;
  unint64_t v30;
  uint8_t buf[4];
  char *v32;
  uint64_t v33;

  v3 = a1;
  v33 = *MEMORY[0x263EF8340];
  v4 = a1;
  if (!*a1)
  {
LABEL_5:
    if (!a2) {
      return 0;
    }
    v7 = (void **)malloc_type_calloc(v4 - v3, 8uLL, 0x10040436913F5uLL);
    v8 = v7;
    v30 = v4 - v3;
    if (v4 == v3)
    {
      v20 = (char *)malloc_type_calloc(0, 1uLL, 0x100004077774924uLL);
      if (v20) {
        goto LABEL_24;
      }
    }
    else
    {
      v27 = a2;
      v9 = 0;
      if ((unint64_t)(v4 - v3) <= 1) {
        v10 = 1;
      }
      else {
        v10 = v4 - v3;
      }
      v11 = &_os_log_internal;
      v29 = v3;
      v12 = v3;
      v13 = (char **)v7;
      v14 = v10;
      v28 = v7;
      do
      {
        v15 = dlopen_from();
        if (v15)
        {
          v22 = v15;
          v8 = v28;
          v3 = v29;
          goto LABEL_26;
        }
        v16 = dlerror();
        v17 = strdup(v16);
        *v13 = v17;
        v18 = strlen(v17);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446210;
          v32 = v17;
          _os_log_impl(&dword_23D3D4000, v11, OS_LOG_TYPE_INFO, "SoftLinking client failed to load dependency: %{public}s", buf, 0xCu);
        }
        v9 += v18 + 1;
        ++v13;
        ++v12;
        --v14;
      }
      while (v14);
      v19 = (char *)malloc_type_calloc(v9, 1uLL, 0x100004077774924uLL);
      v8 = v28;
      v3 = v29;
      a2 = v27;
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        do
        {
          strlcat(v20, (const char *)v28[v21++], v9);
          if (v21 < v30) {
            strlcat(v20, "\n", v9);
          }
        }
        while (v10 != v21);
LABEL_24:
        v22 = 0;
        *a2 = v20;
LABEL_26:
        if (v4 != v3)
        {
          if (v30 <= 1) {
            v23 = 1;
          }
          else {
            v23 = v30;
          }
          v24 = v8;
          do
          {
            v25 = *v24++;
            free(v25);
            --v23;
          }
          while (v23);
        }
        free(v8);
        return v22;
      }
    }
    _sl_dlopen_cold_1();
  }
  v4 = a1;
  while (1)
  {
    v5 = dlopen_from();
    if (v5) {
      return v5;
    }
    v6 = v4[1];
    ++v4;
    if (!v6) {
      goto LABEL_5;
    }
  }
}

uint64_t _sl_dlopen_audited(void *a1)
{
  return _sl_dlopen(a1, 0);
}

void _sl_dlopen_cold_1()
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

uint64_t dlopen_from()
{
  return MEMORY[0x270ED9630]();
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}