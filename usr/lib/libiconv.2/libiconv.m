uint64_t __bsd_iconv_open(const char *a1, uint64_t a2)
{
  return __bsd___iconv_open(a1, a2, 0);
}

uint64_t __bsd___iconv_open(const char *a1, uint64_t a2, uint64_t *a3)
{
  v12 = a3;
  int v4 = *__error();
  int v5 = _citrus_iconv_open((void **)&v12);
  if (v5)
  {
    if (v5 == 2) {
      int v6 = 22;
    }
    else {
      int v6 = v5;
    }
    *__error() = v6;
    return -1;
  }
  else
  {
    *__error() = v4;
    BOOL v8 = strcasestr(a1, "//IGNORE") != 0;
    uint64_t v9 = *v12;
    *(unsigned char *)(v9 + 72) = v8;
    *(unsigned char *)(v9 + 88) = 1;
    BOOL v10 = strcasestr(a1, "//TRANSLIT") != 0;
    uint64_t result = (uint64_t)v12;
    uint64_t v11 = *v12;
    *(unsigned char *)(v11 + 73) = v10;
    *(void *)(v11 + 80) = 0;
  }
  return result;
}

uint64_t __bsd_iconv_close(uint64_t *a1)
{
  if ((unint64_t)a1 + 1 > 1)
  {
    _citrus_iconv_close(a1);
    return 0;
  }
  else
  {
    *__error() = 9;
    return 0xFFFFFFFFLL;
  }
}

void _citrus_iconv_close(uint64_t *a1)
{
  if (a1)
  {
    (*(void (**)(void))(*(void *)*a1 + 24))();
    release_shared(*a1);
    free(a1);
  }
}

uint64_t release_shared(uint64_t a1)
{
  pthread_rwlock_wrlock(&ci_lock);
  int v2 = *(_DWORD *)(a1 + 56) - 1;
  *(_DWORD *)(a1 + 56) = v2;
  if (!v2)
  {
    int v3 = shared_num_unused;
    int v4 = ++shared_num_unused;
    *(void *)(a1 + 32) = 0;
    int v5 = (void *)qword_26ACCA8A8;
    *(void *)(a1 + 40) = qword_26ACCA8A8;
    *int v5 = a1;
    qword_26ACCA8A8 = a1 + 32;
    int v6 = shared_max_reuse;
    if (v3 >= shared_max_reuse)
    {
      do
      {
        v7 = (void *)shared_unused;
        uint64_t v8 = *(void *)(shared_unused + 32);
        uint64_t v9 = *(void **)(shared_unused + 40);
        if (v8)
        {
          *(void *)(v8 + 40) = v9;
          uint64_t v9 = (void *)v7[5];
        }
        else
        {
          qword_26ACCA8A8 = *(void *)(shared_unused + 40);
        }
        *uint64_t v9 = v8;
        uint64_t v10 = v7[2];
        if (v10) {
          *(void *)(v10 + 24) = v7[3];
        }
        *(void *)v7[3] = v10;
        shared_num_unused = --v4;
        uint64_t v11 = (void *)v7[6];
        if (v11)
        {
          v12 = (void (**)(void))*v7;
          if (*v7)
          {
            if (v7[1])
            {
              ((void (**)(void *))v12)[1](v7);
              v12 = (void (**)(void))*v7;
            }
            free(v12);
            uint64_t v11 = (void *)v7[6];
          }
          _citrus_unload_module(v11);
          int v4 = shared_num_unused;
          int v6 = shared_max_reuse;
        }
        free(v7);
      }
      while (v4 > v6);
    }
  }

  return pthread_rwlock_unlock(&ci_lock);
}

uint64_t _citrus_iconv_open(void **a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  pthread_rwlock_wrlock(&ci_lock);
  if ((isinit & 1) == 0)
  {
    bzero(&shared_pool, 0x328uLL);
    shared_unused = 0;
    qword_26ACCA8A8 = (uint64_t)&shared_unused;
    shared_max_reuse = -1;
    if (issetugid() || (v7 = getenv("ICONV_MAX_REUSE")) == 0)
    {
      if ((shared_max_reuse & 0x80000000) == 0)
      {
LABEL_5:
        isinit = 1;
        goto LABEL_6;
      }
    }
    else
    {
      shared_max_reuse = atoi(v7);
      if ((shared_max_reuse & 0x80000000) == 0) {
        goto LABEL_5;
      }
    }
    shared_max_reuse = 5;
    goto LABEL_5;
  }
LABEL_6:
  pthread_rwlock_unlock(&ci_lock);
  __strlcpy_chk();
  int v2 = strstr(__s1, "//");
  if (v2) {
    *int v2 = 0;
  }
  __strlcpy_chk();
  int v3 = strstr(__s, "//");
  if (v3) {
    *int v3 = 0;
  }
  if (!__s1[0] || !strcasecmp(__s1, "char"))
  {
    locale_charset();
    int v4 = 0;
LABEL_15:
    __strlcpy_chk();
    goto LABEL_16;
  }
  if (!strcasecmp(__s1, "wchar_t"))
  {
    nl_langinfo(0);
    int v4 = 1;
    goto LABEL_15;
  }
  int v4 = 0;
LABEL_16:
  if (!__s[0] || !strcasecmp(__s, "char"))
  {
    locale_charset();
    goto LABEL_21;
  }
  if (!strcasecmp(__s, "wchar_t"))
  {
    v4 |= 2u;
    nl_langinfo(0);
LABEL_21:
    __strlcpy_chk();
  }
  if (strchr(__s1, 47) || strchr(__s, 47)) {
    return 22;
  }
  snprintf(__str, 0x400uLL, "%s/%s", __s1, __s);
  pthread_rwlock_wrlock(&ci_lock);
  uint64_t v8 = (uint64_t *)((char *)&shared_pool + 8 * (int)_string_hash_func(__str, 0x65u));
  uint64_t v9 = *v8;
  if (*v8)
  {
    while (strcmp(*(const char **)(v9 + 64), __str))
    {
      uint64_t v9 = *(void *)(v9 + 16);
      if (!v9) {
        goto LABEL_33;
      }
    }
    int v17 = *(_DWORD *)(v9 + 56);
    if (!v17)
    {
      uint64_t v18 = *(void *)(v9 + 32);
      v19 = *(void **)(v9 + 40);
      if (v18)
      {
        *(void *)(v18 + 40) = v19;
        v19 = *(void **)(v9 + 40);
      }
      else
      {
        qword_26ACCA8A8 = *(void *)(v9 + 40);
      }
      void *v19 = v18;
      --shared_num_unused;
    }
    int v21 = v17 + 1;
    goto LABEL_68;
  }
LABEL_33:
  if (v4 == 3) {
    uint64_t v10 = "iconv_none";
  }
  else {
    uint64_t v10 = "iconv_std";
  }
  size_t v11 = strlen(__str);
  v12 = malloc_type_malloc(v11 + 97, 0xDDD4E586uLL);
  if (v12)
  {
    uint64_t v9 = (uint64_t)v12;
    v12[6] = 0;
    v13 = (void **)(v12 + 6);
    v14 = v12 + 12;
    *(void *)uint64_t v9 = 0;
    *(void *)(v9 + 8) = 0;
    *(void *)(v9 + 64) = v14;
    memcpy(v14, __str, v11 + 1);
    uint64_t module = _citrus_load_module(v13, v10);
    if (!module)
    {
      getops = (uint64_t (*)(void))_citrus_find_getops(*v13, v10, "iconv");
      if (getops)
      {
        v23 = getops;
        v24 = malloc_type_malloc(0x28uLL, 0x800402FCC0CB6uLL);
        *(void *)uint64_t v9 = v24;
        if (v24)
        {
          uint64_t module = v23();
          if (!module)
          {
            v25 = *(uint64_t (***)(uint64_t, char *, char *))v9;
            v26 = **(uint64_t (***)(uint64_t, char *, char *))v9;
            if (v26 && v25[1] && v25[2] && v25[3] && v25[4])
            {
              uint64_t module = v26(v9, __s1, __s);
              if (!module) {
                goto LABEL_51;
              }
            }
            else
            {
              uint64_t module = 22;
            }
          }
        }
        else
        {
          uint64_t module = *__error();
        }
      }
      else
      {
        uint64_t module = 102;
      }
    }
    v15 = *v13;
    if (*v13)
    {
      v16 = *(uint64_t (***)(uint64_t, char *, char *))v9;
      if (*(void *)v9)
      {
        if (*(void *)(v9 + 8))
        {
          ((void (*)(uint64_t))v16[1])(v9);
          v16 = *(uint64_t (***)(uint64_t, char *, char *))v9;
        }
        free(v16);
        v15 = *v13;
      }
      _citrus_unload_module(v15);
    }
    free((void *)v9);
    if (module) {
      goto LABEL_45;
    }
  }
  else
  {
    uint64_t module = *__error();
    if (module)
    {
LABEL_45:
      pthread_rwlock_unlock(&ci_lock);
      return module;
    }
  }
  uint64_t v9 = 0;
LABEL_51:
  uint64_t v20 = *v8;
  *(void *)(v9 + 16) = *v8;
  if (v20) {
    *(void *)(v20 + 24) = v9 + 16;
  }
  *uint64_t v8 = v9;
  *(void *)(v9 + 24) = v8;
  int v21 = 1;
LABEL_68:
  *(_DWORD *)(v9 + 56) = v21;
  pthread_rwlock_unlock(&ci_lock);
  v27 = *a1;
  if (*a1)
  {
    v28 = 0;
  }
  else
  {
    v29 = malloc_type_malloc(0x20uLL, 0x10A00409968B0C6uLL);
    if (!v29)
    {
      uint64_t module = *__error();
      release_shared(v9);
      return module;
    }
    v27 = v29;
    *a1 = v29;
    v28 = v29;
  }
  void *v27 = v9;
  uint64_t module = (*(uint64_t (**)(void *))(*(void *)v9 + 16))(v27);
  v27[2] = 0;
  *((_DWORD *)v27 + 6) = v4;
  if (module)
  {
    release_shared(v9);
    free(v28);
  }
  return module;
}

uint64_t _string_hash_func(const char *a1, unsigned int a2)
{
  v4[0] = a1;
  v4[1] = strlen(a1);
  return _citrus_db_hash_std((uint64_t)v4) % a2;
}

uint64_t _citrus_db_hash_std(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  if (!v1) {
    return 0;
  }
  int v2 = (unsigned __int8 **)result;
  LODWORD(result) = 0;
  int v3 = *v2;
  do
  {
    unsigned __int8 v5 = *v3++;
    unsigned __int8 v4 = v5;
    unsigned __int8 v6 = v5 + 32;
    if ((v5 - 91) >= 0xE6u) {
      unsigned __int8 v4 = v6;
    }
    unsigned int v7 = 16 * result + v4;
    if ((v7 & 0xF0000000) != 0) {
      uint64_t result = v7 & 0xFFFFFFF ^ ((v7 & 0xF0000000) >> 24);
    }
    else {
      uint64_t result = v7;
    }
    --v1;
  }
  while (v1);
  return result;
}

uint64_t __bsd_iconv(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 1)
  {
    int v1 = (*(uint64_t (**)(void))(**(void **)a1 + 32))();
    if (!v1) {
      return 0;
    }
    *__error() = v1;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

uint64_t seq_lookup_db(uint64_t a1, const char *a2, void *a3)
{
  *(_DWORD *)(a1 + 52) = 0;
  free(*(void **)(a1 + 56));
  unsigned __int8 v6 = (unsigned __int8 *)strdup(a2);
  unsigned int v7 = (char *)v6;
  *(void *)(a1 + 56) = v6;
  if (*(_DWORD *)(a1 + 48))
  {
    _citrus_bcs_convert_to_lower(v6);
    unsigned int v7 = *(char **)(a1 + 56);
  }
  *(void *)(a1 + 64) = strlen(v7);
  *(_DWORD *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  uint64_t v8 = *(uint64_t **)a1;

  return _citrus_db_lookup_by_string(v8, v7, a3, a1 + 32);
}

void *seq_close_db(void **a1)
{
  uint64_t v1 = (uint64_t)(a1 + 1);
  _citrus_db_close(*a1);

  return _citrus_unmap_file(v1);
}

uint64_t mapper_open(uint64_t a1, void *a2, const char *a3, const char *a4)
{
  uint64_t v8 = (char *)malloc_type_malloc(0x48uLL, 0x10B0040655B139FuLL);
  if (!v8) {
    return *__error();
  }
  uint64_t v9 = v8;
  *((_OWORD *)v8 + 1) = 0u;
  uint64_t v10 = (void **)(v8 + 16);
  *((_DWORD *)v8 + 12) = 0;
  *((void *)v8 + 7) = 0;
  *((_DWORD *)v8 + 16) = 0;
  *(_OWORD *)uint64_t v8 = 0u;
  uint64_t module = _citrus_load_module((void *)v8 + 2, a3);
  if (!module)
  {
    getops = (uint64_t (*)(void))_citrus_find_getops(*v10, a3, "mapper");
    if (!getops)
    {
      uint64_t module = 102;
      goto LABEL_3;
    }
    v14 = getops;
    v15 = malloc_type_malloc(0x20uLL, 0x8004018A671A6uLL);
    *uint64_t v9 = v15;
    if (v15)
    {
      uint64_t module = v14();
      if (module) {
        goto LABEL_3;
      }
      v16 = (void *)*v9;
      if (!*(void *)*v9 || !v16[1] || !v16[2] || !v16[3])
      {
        uint64_t module = 22;
        goto LABEL_3;
      }
      int v17 = malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL);
      v9[3] = v17;
      if (v17)
      {
        uint64_t v18 = v17;
        size_t v19 = strlen(a4);
        uint64_t module = (*(uint64_t (**)(uint64_t, void *, void, const char *, size_t, void *, uint64_t))*v9)(a1, v9, *(void *)(a1 + 808), a4, v19 + 1, v18, 24);
        if (!module)
        {
          *a2 = v9;
          return module;
        }
        goto LABEL_3;
      }
    }
    uint64_t module = *__error();
  }
LABEL_3:
  mapper_close(v9);
  return module;
}

void *_citrus_unmap_file(uint64_t a1)
{
  uint64_t result = *(void **)a1;
  if (result)
  {
    uint64_t result = (void *)munmap(result, *(void *)(a1 + 8));
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  return result;
}

uint64_t _citrus_stdenc_open(long long **a1, char *__s1, uint64_t a3, uint64_t a4)
{
  int v21 = 0;
  int v8 = strcmp(__s1, "NONE");
  uint64_t v9 = (long long *)malloc_type_malloc(0x20uLL, 0xA00404900C826uLL);
  uint64_t v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      long long v13 = *(_OWORD *)algn_26771D488;
      *uint64_t v9 = _citrus_stdenc_default;
      v9[1] = v13;
      goto LABEL_7;
    }
LABEL_21:
    uint64_t v12 = *__error();
    goto LABEL_22;
  }
  if (!v9) {
    goto LABEL_21;
  }
  *uint64_t v9 = 0u;
  v9[1] = 0u;
  uint64_t v11 = _citrus_load_module(&v21, __s1);
  if (v11)
  {
LABEL_4:
    uint64_t v12 = v11;
LABEL_22:
    _citrus_stdenc_close(v10);
    return v12;
  }
  v15 = v21;
  *((void *)v10 + 2) = v21;
  getops = (uint64_t (*)(void *, uint64_t))_citrus_find_getops(v15, __s1, "stdenc");
  if (!getops)
  {
LABEL_20:
    uint64_t v12 = 22;
    goto LABEL_22;
  }
  int v17 = getops;
  uint64_t v18 = malloc_type_malloc(0x58uLL, 0x80040512DBC69uLL);
  *(void *)uint64_t v10 = v18;
  if (!v18) {
    goto LABEL_21;
  }
  uint64_t v11 = v17(v18, 88);
  if (v11) {
    goto LABEL_4;
  }
  size_t v19 = *(void **)v10;
  if (!**(void **)v10 || !v19[1] || !v19[3] || !v19[4] || !v19[5] || !v19[6] || !v19[8]) {
    goto LABEL_20;
  }
LABEL_7:
  v14 = malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL);
  *((void *)v10 + 3) = v14;
  if (!v14) {
    goto LABEL_21;
  }
  uint64_t v12 = (**(uint64_t (***)(long long *, uint64_t, uint64_t, void *))v10)(v10, a3, a4, v14);
  if (v12) {
    goto LABEL_22;
  }
  *a1 = v10;
  return v12;
}

uint64_t _citrus_mapper_set_persistent(uint64_t a1)
{
  pthread_rwlock_wrlock(&cm_lock);
  *(_DWORD *)(a1 + 48) = -1;

  return pthread_rwlock_unlock(&cm_lock);
}

uint64_t _citrus_mapper_create_area(void *a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(&v9, 0, sizeof(v9));
  pthread_rwlock_wrlock(&cm_lock);
  if (*a1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    snprintf(__str, 0x400uLL, "%s/%s", a2, "mapper.dir");
    uint64_t v4 = stat(__str, &v9);
    if (!v4)
    {
      unsigned __int8 v6 = malloc_type_malloc(0x330uLL, 0x30040220BCB0CuLL);
      if (v6)
      {
        unsigned int v7 = v6;
        int v8 = strdup(a2);
        v7[101] = v8;
        if (v8)
        {
          bzero(v7, 0x328uLL);
          uint64_t v4 = 0;
          *a1 = v7;
        }
        else
        {
          uint64_t v4 = *__error();
          free(v7);
        }
      }
      else
      {
        uint64_t v4 = *__error();
      }
    }
  }
  pthread_rwlock_unlock(&cm_lock);
  return v4;
}

uint64_t _citrus_map_file(void *a1, char *a2)
{
  memset(&v9, 0, sizeof(v9));
  *a1 = 0;
  a1[1] = 0;
  int v3 = open(a2, 0x1000000, *(_OWORD *)&v9.st_dev, *(_OWORD *)&v9.st_uid, *(_OWORD *)&v9.st_atimespec, *(_OWORD *)&v9.st_mtimespec, *(_OWORD *)&v9.st_ctimespec, *(_OWORD *)&v9.st_birthtimespec);
  if (v3 != -1)
  {
    int v4 = v3;
    if (fstat(v3, &v9) == -1) {
      goto LABEL_7;
    }
    if ((v9.st_mode & 0xF000) != 0x8000)
    {
      uint64_t v6 = 102;
      goto LABEL_9;
    }
    unsigned __int8 v5 = mmap(0, v9.st_size, 1, 2, v4, 0);
    if (v5 == (void *)-1)
    {
LABEL_7:
      uint64_t v6 = *__error();
    }
    else
    {
      uint64_t v6 = 0;
      off_t st_size = v9.st_size;
      *a1 = v5;
      a1[1] = st_size;
    }
LABEL_9:
    close(v4);
    return v6;
  }
  return *__error();
}

char *_citrus_lookup_simple(char *a1, uint64_t a2, char *a3, size_t a4, int a5)
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  int v8 = _citrus_lookup_seq_open(&v13, a1, a5);
  uint64_t result = 0;
  if (!v8)
  {
    uint64_t v10 = v13;
    if ((*(unsigned int (**)(uint64_t, uint64_t, const char **))(v13 + 80))(v13, a2, &v11)) {
      a3 = 0;
    }
    else {
      snprintf(a3, a4, "%.*s", v12, v11);
    }
    free(*(void **)(v10 + 56));
    (*(void (**)(uint64_t))(v10 + 96))(v10);
    free((void *)v10);
    return a3;
  }
  return result;
}

uint64_t _citrus_lookup_seq_open(void *a1, char *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = malloc_type_malloc(0x68uLL, 0x10B20404D61ED97uLL);
  if (!v6) {
    return *__error();
  }
  unsigned int v7 = v6;
  v6[7] = 0;
  v6[8] = 0;
  *((_DWORD *)v6 + 12) = a3;
  long long v12 = 0uLL;
  snprintf(__str, 0x400uLL, "%s.db", a2);
  uint64_t v8 = _citrus_map_file(&v12, __str);
  if (!v8)
  {
    uint64_t v9 = _citrus_db_open(v7, (uint64_t)&v12, "LOOKUP", (uint64_t)_citrus_db_hash_std, 0);
    if (!v9)
    {
      *(_OWORD *)(v7 + 1) = v12;
      *((_DWORD *)v7 + 6) = _citrus_db_get_number_of_entries(*v7);
      *((_DWORD *)v7 + 7) = 0;
      *((_DWORD *)v7 + 13) = 1;
      v7[10] = seq_lookup_db;
      v7[9] = seq_next_db;
      v7[11] = seq_get_num_entries_db;
      uint64_t v10 = seq_close_db;
      goto LABEL_11;
    }
    uint64_t v8 = v9;
    _citrus_unmap_file((uint64_t)&v12);
  }
  if (v8 == 2)
  {
    uint64_t v8 = _citrus_map_file(v7, a2);
    if (!v8)
    {
      *((_DWORD *)v7 + 13) = 1;
      v7[9] = seq_next_plain;
      v7[10] = seq_lookup_plain;
      v7[11] = seq_get_num_entries_plain;
      uint64_t v10 = (void *(*)(void **))seq_close_plain;
LABEL_11:
      v7[12] = v10;
      uint64_t v8 = 0;
      *a1 = v7;
      return v8;
    }
  }
  free(v7);
  return v8;
}

uint64_t _citrus_load_module(void *a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!_pathI18nModule)
  {
    int v4 = getenv("PATH_I18NMODULE");
    if (v4 && (unsigned __int8 v5 = v4, !issetugid()))
    {
      _pathI18nModule = (uint64_t)strdup(v5);
      if (!_pathI18nModule) {
        return 12;
      }
    }
    else
    {
      _pathI18nModule = (uint64_t)"/usr/lib/i18n";
    }
  }
  snprintf(__str, 0x400uLL, "lib%s", a2);
  _findshlib_path = 0;
  unsigned int v6 = snprintf(&_findshlib_path, 0x400uLL, "%s/%s.dylib", (const char *)_pathI18nModule, __str);
  uint64_t result = 22;
  if (v6 <= 0x3FF && _findshlib_path)
  {
    uint64_t v8 = dlopen(&_findshlib_path, 1);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t result = 0;
      *a1 = v9;
    }
    else
    {
      uint64_t v10 = dlerror();
      printf("%s", v10);
      return 22;
    }
  }
  return result;
}

void *_citrus_find_getops(void *a1, const char *a2, const char *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x400uLL, "_citrus_%s_%s_getops", a2, a3);
  return dlsym(a1, __str);
}

uint64_t _citrus_esdb_open(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v21[0] = 0;
  v21[1] = 0;
  snprintf(__str, 0x400uLL, "%s/%s", "/usr/share/i18n/esdb", "esdb.alias");
  int v4 = _citrus_lookup_simple(__str, a2, v28, 0x400uLL, 1);
  if (v4) {
    a2 = (uint64_t)v4;
  }
  snprintf(__str, 0x400uLL, "%s/%s", "/usr/share/i18n/esdb", "esdb.dir");
  unsigned __int8 v5 = _citrus_lookup_simple(__str, a2, v27, 0x400uLL, 1);
  if (!v5) {
    return 2;
  }
  snprintf(__str, 0x400uLL, "%s/%s", "/usr/share/i18n/esdb", v5);
  uint64_t v6 = _citrus_map_file(v21, __str);
  if (!v6)
  {
    __s1 = 0;
    v25 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v6 = _citrus_db_open(&v25, (uint64_t)v21, "ESDB", (uint64_t)_citrus_db_hash_std, 0);
    if (!v6)
    {
      LODWORD(v6) = _citrus_db_lookup32_by_string((uint64_t *)v25, "version", &v22, 0);
      if (v6) {
        goto LABEL_7;
      }
      if (v22 == 1)
      {
        LODWORD(v6) = _citrus_db_lookup_string_by_string((uint64_t *)v25, "encoding", &__s1, 0);
        if (v6) {
          goto LABEL_7;
        }
        uint64_t v8 = strdup(__s1);
        *(void *)a1 = v8;
        if (!v8)
        {
          LODWORD(v6) = *__error();
          goto LABEL_7;
        }
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        int v9 = _citrus_db_lookup_string_by_string((uint64_t *)v25, "variable", &__s1, 0);
        if (v9 != 2)
        {
          LODWORD(v6) = v9;
          if (v9)
          {
LABEL_27:
            free(*(void **)a1);
LABEL_7:
            _citrus_db_close(v25);
            if (v6 == 2) {
              uint64_t v6 = 79;
            }
            else {
              uint64_t v6 = v6;
            }
            goto LABEL_10;
          }
          uint64_t v10 = __s1;
          *(void *)(a1 + 16) = strlen(__s1) + 1;
          uint64_t v11 = strdup(v10);
          *(void *)(a1 + 8) = v11;
          if (!v11)
          {
            LODWORD(v6) = *__error();
            goto LABEL_27;
          }
        }
        LODWORD(v6) = _citrus_db_lookup32_by_string((uint64_t *)v25, "num_charsets", &v23, 0);
        if (v6)
        {
LABEL_20:
          free(*(void **)(a1 + 8));
          goto LABEL_27;
        }
        *(_DWORD *)(a1 + 24) = v23;
        int v12 = _citrus_db_lookup32_by_string((uint64_t *)v25, "invalid", (_DWORD *)&v22 + 1, 0);
        if (v12 == 2)
        {
          *(_DWORD *)(a1 + 40) = 0;
        }
        else
        {
          LODWORD(v6) = v12;
          if (v12) {
            goto LABEL_20;
          }
          int v13 = HIDWORD(v22);
          *(_DWORD *)(a1 + 40) = 1;
          *(_DWORD *)(a1 + 44) = v13;
        }
        uint64_t v14 = malloc_type_malloc(16 * v23, 0x101004082113244uLL);
        *(void *)(a1 + 32) = v14;
        if (!v14)
        {
          LODWORD(v6) = *__error();
          goto LABEL_20;
        }
        if (v23)
        {
          uint64_t v15 = 0;
          unint64_t v16 = 0;
          while (1)
          {
            snprintf(__s, 0x64uLL, "csid_%d", v16);
            int v17 = _citrus_db_lookup32_by_string((uint64_t *)v25, __s, (_DWORD *)&v23 + 1, 0);
            if (v17
              || (*(_DWORD *)(*(void *)(a1 + 32) + v15) = HIDWORD(v23),
                  snprintf(__s, 0x64uLL, "csname_%d", v16),
                  (int v17 = _citrus_db_lookup_string_by_string((uint64_t *)v25, __s, &__s1, 0)) != 0))
            {
              LODWORD(v6) = v17;
              goto LABEL_40;
            }
            uint64_t v18 = strdup(__s1);
            *(void *)(*(void *)(a1 + 32) + v15 + 8) = v18;
            if (!v18) {
              break;
            }
            ++v16;
            v15 += 16;
            if (v16 >= v23) {
              goto LABEL_36;
            }
          }
          LODWORD(v6) = *__error();
LABEL_40:
          if (v16)
          {
            unsigned int v19 = v16 - 1;
            do
            {
              uint64_t v20 = v19;
              free(*(void **)(*(void *)(a1 + 32) + 16 * v19-- + 8));
            }
            while (v20);
          }
          free(*(void **)(a1 + 32));
          goto LABEL_20;
        }
LABEL_36:
        _citrus_db_close(v25);
        uint64_t v6 = 0;
      }
      else
      {
        _citrus_db_close(v25);
        uint64_t v6 = 79;
      }
    }
LABEL_10:
    _citrus_unmap_file((uint64_t)v21);
  }
  return v6;
}

void _citrus_esdb_close(uint64_t a1)
{
  if (*(int *)(a1 + 24) >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 8;
    do
    {
      free(*(void **)(*(void *)(a1 + 32) + v3));
      ++v2;
      v3 += 16;
    }
    while (v2 < *(int *)(a1 + 24));
  }
  *(_DWORD *)(a1 + 24) = 0;
  free(*(void **)(a1 + 32));
  *(void *)(a1 + 32) = 0;
  free(*(void **)a1);
  *(void *)a1 = 0;
  *(void *)(a1 + 16) = 0;
  free(*(void **)(a1 + 8));
  *(void *)(a1 + 8) = 0;
}

uint64_t _citrus_db_open(void *a1, uint64_t a2, char *__s2, uint64_t a4, uint64_t a5)
{
  unsigned __int8 v5 = *(const char **)a2;
  unint64_t v6 = *(void *)(a2 + 8);
  if (v6 < 0x10 || v5 == 0) {
    return 79;
  }
  if (strncmp(*(const char **)a2, __s2, 8uLL)) {
    return 79;
  }
  unint64_t v12 = bswap32(*((_DWORD *)v5 + 3));
  if (v6 <= v12) {
    return 79;
  }
  unint64_t v13 = 24 * bswap32(*((_DWORD *)v5 + 2));
  BOOL v14 = v6 >= v12;
  unint64_t v15 = v6 - v12;
  if (!v14) {
    unint64_t v15 = 0;
  }
  if (v15 < v13) {
    return 79;
  }
  int v17 = malloc_type_malloc(0x20uLL, 0x1080040EE4F9096uLL);
  if (!v17) {
    return *__error();
  }
  uint64_t v18 = v17;
  uint64_t result = 0;
  *(_OWORD *)uint64_t v18 = *(_OWORD *)a2;
  v18[2] = a4;
  v18[3] = a5;
  *a1 = v18;
  return result;
}

uint64_t _citrus_db_lookup_string_by_string(uint64_t *a1, char *__s, void *a3, uint64_t a4)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v10[0] = __s;
  v10[1] = strlen(__s);
  uint64_t result = _citrus_db_lookup(a1, (uint64_t)v10, &v8, a4);
  if (!result)
  {
    if (v9 && !*(unsigned char *)(v8 + v9 - 1))
    {
      uint64_t result = 0;
      if (a3) {
        *a3 = v8;
      }
    }
    else
    {
      return 79;
    }
  }
  return result;
}

uint64_t _citrus_db_lookup_by_string(uint64_t *a1, char *__s, void *a3, uint64_t a4)
{
  v8[0] = __s;
  v8[1] = strlen(__s);
  return _citrus_db_lookup(a1, (uint64_t)v8, a3, a4);
}

uint64_t _citrus_db_lookup32_by_string(uint64_t *a1, char *__s, _DWORD *a3, uint64_t a4)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v10[0] = __s;
  v10[1] = strlen(__s);
  uint64_t result = _citrus_db_lookup(a1, (uint64_t)v10, &v8, a4);
  if (!result)
  {
    if (v9 == 4)
    {
      uint64_t result = 0;
      if (a3) {
        *a3 = bswap32(*v8);
      }
    }
    else
    {
      return 79;
    }
  }
  return result;
}

uint64_t _citrus_db_lookup(uint64_t *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  unsigned int v5 = *(_DWORD *)(*a1 + 8);
  if (!v5) {
    return 2;
  }
  unint64_t v10 = a1[1];
  if (a4)
  {
    unint64_t v11 = *(void *)(a4 + 8);
    if (v11)
    {
      if (v11 < v10)
      {
        unsigned int v12 = *(_DWORD *)a4;
        goto LABEL_8;
      }
      return 2;
    }
  }
  unsigned int v12 = ((unsigned int (*)(uint64_t))a1[2])(a2) % bswap32(v5);
  unint64_t v11 = bswap32(*(_DWORD *)(v4 + 12)) + 24 * v12;
  if (a4) {
    *(_DWORD *)a4 = v12;
  }
LABEL_8:
  while (1)
  {
    uint64_t result = 79;
    if (v10 <= v11 || v11 + 24 > v10) {
      break;
    }
    BOOL v14 = (unsigned int *)(v4 + v11);
    unsigned int v15 = *(_DWORD *)(v4 + v11 + 4);
    unint64_t v11 = bswap32(v15);
    if (a4)
    {
      *(void *)(a4 + 8) = v11;
      if (!v15) {
        *(void *)(a4 + 8) = a1[1];
      }
    }
    if (bswap32(*v14) != v12) {
      return 2;
    }
    size_t v16 = bswap32(v14[3]);
    if (*(void *)(a2 + 8) == v16)
    {
      unint64_t v17 = bswap32(v14[2]);
      if (v10 <= v17 || v16 + v17 > v10) {
        return result;
      }
      if (!memcmp((const void *)(v4 + v17), *(const void **)a2, v16))
      {
        unint64_t v19 = bswap32(v14[4]);
        if (v10 <= v19) {
          return 79;
        }
        uint64_t v20 = bswap32(v14[5]);
        if (v20 + v19 > v10) {
          return 79;
        }
        uint64_t result = 0;
        if (a3)
        {
          *a3 = v4 + v19;
          a3[1] = v20;
        }
        return result;
      }
    }
    if (!v15) {
      return 2;
    }
  }
  return result;
}

uint64_t _citrus_db_get_number_of_entries(uint64_t a1)
{
  return bswap32(*(_DWORD *)(*(void *)a1 + 8));
}

uint64_t _citrus_csmapper_open()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  char v6 = v5;
  uint64_t v8 = v7;
  unint64_t v10 = v9;
  unint64_t v11 = (uint64_t *)v0;
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t area = _citrus_mapper_create_area(&maparea, "/usr/share/i18n/csmapper");
  if (area) {
    return area;
  }
  BOOL v14 = _citrus_lookup_simple("/usr/share/i18n/csmapper/charset.alias", (uint64_t)v10, v44, 0x400uLL, 1);
  if (v14) {
    unint64_t v10 = v14;
  }
  unsigned int v15 = _citrus_lookup_simple("/usr/share/i18n/csmapper/charset.alias", (uint64_t)v8, v43, 0x400uLL, 1);
  if (v15) {
    uint64_t v8 = v15;
  }
  if (!strcmp(v10, v8))
  {
    uint64_t v17 = maparea;
    pthread_rwlock_wrlock(&ma_lock);
    uint64_t v18 = csm_none;
    if (!csm_none)
    {
      uint64_t area = _citrus_mapper_open_direct(v17, &csm_none, "mapper_none", &unk_20D93FABA);
      if (area) {
        goto LABEL_20;
      }
      _citrus_mapper_set_persistent(csm_none);
      uint64_t v18 = csm_none;
    }
    uint64_t area = 0;
    *unint64_t v11 = v18;
LABEL_20:
    pthread_rwlock_unlock(&ma_lock);
    if (!v4 || area)
    {
      if (area) {
        return area;
      }
    }
    else
    {
      *uint64_t v4 = 0;
    }
    uint64_t area = 0;
    *uint64_t v2 = 1;
    return area;
  }
  *uint64_t v2 = 0;
  snprintf(__str, 0x400uLL, "%s/%s", v10, v8);
  uint64_t v16 = _citrus_mapper_open(maparea, v11, __str);
  if (v16 != 2)
  {
    uint64_t area = v16;
    if (!v16)
    {
      uint64_t area = 0;
      if (v4) {
        *uint64_t v4 = 0;
      }
    }
    return area;
  }
  if (v6) {
    return 2;
  }
  v36[0] = 0;
  uint64_t v39 = 0;
  v40 = 0;
  v37 = 0;
  v38 = 0;
  v49[0] = 0uLL;
  uint64_t v48 = 0;
  v47 = 0;
  uint64_t v19 = _citrus_map_file(v49, "/usr/share/i18n/csmapper/charset.pivot.pvdb");
  if (v19 == 2)
  {
    unint64_t v20 = 0;
LABEL_47:
    v36[1] = 0;
    v37 = 0;
    v36[0] = 0;
    memset(v49, 0, 512);
    uint64_t v29 = _citrus_lookup_seq_open(&v37, "/usr/share/i18n/csmapper/charset.pivot", 1);
    if (v29)
    {
      uint64_t area = v29;
    }
    else
    {
      uint64_t v30 = _citrus_lookup_seq_lookup((uint64_t)v37);
      if (v30)
      {
        uint64_t area = v30;
        unint64_t v31 = -1;
      }
      else
      {
        unint64_t v31 = -1;
LABEL_52:
        uint64_t v32 = parse_line((uint64_t)v49, (uint64_t)v36);
        if (v32
          || (uint64_t v39 = 0,
              v40 = 0,
              v38 = 0,
              uint64_t v32 = _citrus_lookup_seq_open(&v40, "/usr/share/i18n/csmapper/charset.pivot", 1),
              v32))
        {
          uint64_t area = v32;
        }
        else
        {
          uint64_t v33 = _citrus_lookup_seq_lookup((uint64_t)v40);
          if (!v33)
          {
            memset(v45, 0, 512);
            do
            {
              uint64_t v33 = parse_line((uint64_t)v45, (uint64_t)&v38);
              if (v33) {
                break;
              }
              if (!strcmp(v8, (const char *)v45))
              {
                v50 += v46;
                _citrus_lookup_seq_close((uint64_t)v40);
                unint64_t v34 = v50;
                if (v50 < v31)
                {
                  __strlcpy_chk();
                  unint64_t v31 = v34;
                }
                uint64_t area = _citrus_lookup_seq_next((uint64_t)v37);
                if (!area) {
                  goto LABEL_52;
                }
                goto LABEL_65;
              }
              uint64_t v33 = _citrus_lookup_seq_next((uint64_t)v40);
            }
            while (!v33);
          }
          uint64_t area = v33;
          _citrus_lookup_seq_close((uint64_t)v40);
        }
      }
LABEL_65:
      _citrus_lookup_seq_close((uint64_t)v37);
      if (area == 2)
      {
        if (v31 == -1)
        {
          uint64_t area = 2;
        }
        else
        {
          __strlcpy_chk();
          uint64_t area = 0;
          unint64_t v20 = v31;
        }
      }
    }
LABEL_71:
    if (!area) {
      goto LABEL_72;
    }
    return area;
  }
  uint64_t area = v19;
  unint64_t v20 = 0;
  if (v19) {
    goto LABEL_46;
  }
  uint64_t v21 = _citrus_db_open(v36, (uint64_t)v49, "CSPIVOT", (uint64_t)_citrus_db_hash_std, 0);
  if (v21)
  {
    uint64_t area = v21;
    _citrus_unmap_file((uint64_t)v49);
    unint64_t v20 = 0;
    goto LABEL_46;
  }
  uint64_t v22 = open_subdb(&v40, (uint64_t *)v36[0], v10);
  if (v22)
  {
    uint64_t area = v22;
    unint64_t v20 = 0;
    goto LABEL_45;
  }
  int number_of_entries = _citrus_db_get_number_of_entries((uint64_t)v40);
  if (number_of_entries < 1)
  {
    uint64_t area = 0;
    unint64_t v20 = -1;
    goto LABEL_44;
  }
  int v24 = number_of_entries;
  unsigned int v25 = 0;
  unint64_t v20 = -1;
  while (1)
  {
    uint64_t entry = _citrus_db_get_entry(v40, v25, &v47, &v38);
    if (entry) {
      goto LABEL_41;
    }
    if (v39 != 4) {
      goto LABEL_43;
    }
    unsigned int v27 = *v38;
    snprintf((char *)v45, 0x800uLL, "%.*s", v48, v47);
    uint64_t entry = open_subdb(&v37, (uint64_t *)v36[0], (char *)v45);
    if (entry)
    {
LABEL_41:
      uint64_t area = entry;
      goto LABEL_44;
    }
    if (!_citrus_db_lookup_by_string((uint64_t *)v37, v8, &v38, 0)) {
      break;
    }
LABEL_38:
    _citrus_db_close(v37);
    if (v24 == ++v25)
    {
      uint64_t area = 0;
      goto LABEL_44;
    }
  }
  if (v39 == 4)
  {
    unint64_t v28 = bswap32(*v38) + (unint64_t)bswap32(v27);
    if (v28 < v20)
    {
      __strlcpy_chk();
      unint64_t v20 = v28;
    }
    goto LABEL_38;
  }
  _citrus_db_close(v37);
LABEL_43:
  uint64_t area = 79;
LABEL_44:
  _citrus_db_close(v40);
LABEL_45:
  _citrus_db_close(v36[0]);
  _citrus_unmap_file((uint64_t)v49);
  if (area)
  {
LABEL_46:
    if (area == 102) {
      goto LABEL_47;
    }
    goto LABEL_71;
  }
  if (v20 == -1) {
    return 2;
  }
LABEL_72:
  uint64_t v35 = open_serial_mapper(maparea, (uint64_t)v11, v10, v41, v8);
  uint64_t area = v35;
  if (v4 && !v35) {
    *uint64_t v4 = v20;
  }
  return area;
}

unsigned __int8 *_citrus_bcs_convert_to_lower(unsigned __int8 *result)
{
  unsigned __int8 v1 = *result;
  if (*result)
  {
    uint64_t v2 = result + 1;
    do
    {
      if ((v1 - 91) >= 0xE6u) {
        v1 += 32;
      }
      *(v2 - 1) = v1;
      int v3 = *v2++;
      unsigned __int8 v1 = v3;
    }
    while (v3);
  }
  return result;
}

uint64_t __bsd_iconv_open_into(const char *a1, uint64_t a2, uint64_t *a3)
{
  if (__bsd___iconv_open(a1, a2, a3) == -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t __bsd___iconv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if ((unint64_t)(a1 + 1) > 1)
  {
    int v8 = (*(uint64_t (**)(void))(**(void **)a1 + 32))();
    if (a7) {
      *a7 = 0;
    }
    if (!v8) {
      return 0;
    }
    *__error() = v8;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

uint64_t __bsd___iconv_get_list(void *a1, uint64_t *a2, char a3)
{
  uint64_t result = _citrus_esdb_get_list(a1, a2, a3);
  if (result)
  {
    *__error() = result;
    return 0xFFFFFFFFLL;
  }
  return result;
}

void __bsd_iconvlist(void (*a1)(uint64_t, char **, uint64_t), uint64_t a2)
{
  unint64_t v25 = 0;
  v26 = 0;
  int list = _citrus_esdb_get_list(&v26, (uint64_t *)&v25, 1);
  if (list)
  {
    *__error() = list;
  }
  else
  {
    qsort(v26, v25, 8uLL, (int (__cdecl *)(const void *, const void *))qsort_helper);
    unint64_t v5 = v25;
    if (v25)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        int v8 = strchr(*((char **)v26 + v6), 47);
        uint64_t v9 = (char **)malloc_type_malloc(8 * v5, 0x10040436913F5uLL);
        if (!v9) {
          break;
        }
        unint64_t v10 = v9;
        unint64_t v11 = strndup(*((const char **)v26 + v6), (size_t)&v8[-*((void *)v26 + v6)]);
        if (!v11)
        {
LABEL_25:
          free(v10);
          break;
        }
        unsigned int v12 = v11;
        *unint64_t v10 = v11;
        unint64_t v13 = v25;
        if (v25 <= v7)
        {
          LODWORD(v15) = 1;
          a1(1, v10, a2);
        }
        else
        {
          unint64_t v14 = v7;
          uint64_t v15 = 1;
          while (1)
          {
            uint64_t v16 = (char *)*((void *)v26 + v14);
            size_t v17 = strlen(v12);
            if (strncmp(v12, v16, v17)) {
              break;
            }
            uint64_t v18 = strchr(v16, 47) + 1;
            if (strcmp(v12, v18))
            {
              uint64_t v19 = strdup(v18);
              if (!v19)
              {
                if (v15)
                {
                  uint64_t v22 = v15;
                  uint64_t v23 = (void **)v10;
                  do
                  {
                    int v24 = *v23++;
                    free(v24);
                    --v22;
                  }
                  while (v22);
                }
                goto LABEL_25;
              }
              v10[v15] = v19;
              uint64_t v15 = (v15 + 1);
            }
            unint64_t v14 = (v7 + 1);
            unint64_t v7 = v14;
            if (v13 <= v14) {
              goto LABEL_17;
            }
          }
          unint64_t v14 = v7;
LABEL_17:
          a1(v15, v10, a2);
          unint64_t v7 = v14;
          if (!v15) {
            goto LABEL_20;
          }
        }
        uint64_t v15 = v15;
        unint64_t v20 = (void **)v10;
        do
        {
          uint64_t v21 = *v20++;
          free(v21);
          --v15;
        }
        while (v15);
LABEL_20:
        free(v10);
        uint64_t v6 = v7;
        unint64_t v5 = v25;
      }
      while (v25 > v7);
    }
    if (v26) {
      _citrus_esdb_free_list((void **)v26, v25);
    }
  }
}

uint64_t qsort_helper(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

double __bsd_iconvctl(void *a1, int a2, long long *a3)
{
  if ((unint64_t)a1 + 1 > 1)
  {
    switch(a2)
    {
      case 0:
        int v8 = *(char **)(*a1 + 64);
        uint64_t v9 = strchr(v8, 47);
        size_t v10 = v9 - v8;
        unint64_t v11 = v9 + 1;
        int v12 = v9 - v8 == strlen(v9 + 1) && memcmp(v8, v11, v10) == 0;
        goto LABEL_23;
      case 1:
        int v12 = *(unsigned __int8 *)(*a1 + 73);
        goto LABEL_23;
      case 2:
        *(unsigned char *)(*a1 + 73) = *(_DWORD *)a3 != 0;
        return *(double *)&v4;
      case 3:
        int v12 = *(unsigned __int8 *)(*a1 + 72);
        goto LABEL_23;
      case 4:
        *(unsigned char *)(*a1 + 72) = *(_DWORD *)a3 != 0;
        return *(double *)&v4;
      case 5:
        *(void *)(*a1 + 80) = a3;
        return *(double *)&v4;
      case 6:
        unint64_t v13 = (void *)a1[2];
        if (a3)
        {
          if (v13 || (unint64_t v13 = malloc_type_malloc(0x28uLL, 0x800402FCC0CB6uLL), (a1[2] = v13) != 0))
          {
            long long v4 = *a3;
            long long v14 = a3[1];
            v13[4] = *((void *)a3 + 4);
            *(_OWORD *)unint64_t v13 = v4;
            *((_OWORD *)v13 + 1) = v14;
          }
        }
        else if (v13)
        {
          v13[4] = 0;
          *(void *)&long long v4 = 0;
          *(_OWORD *)unint64_t v13 = 0u;
          *((_OWORD *)v13 + 1) = 0u;
        }
        return *(double *)&v4;
      default:
        if (a2 == 128)
        {
          int v12 = *(unsigned __int8 *)(*a1 + 88);
LABEL_23:
          *(_DWORD *)a3 = v12;
          return *(double *)&v4;
        }
        if (a2 == 129)
        {
          *(unsigned char *)(*a1 + 88) = *(_DWORD *)a3 != 0;
          return *(double *)&v4;
        }
        int v3 = __error();
        int v5 = 22;
        break;
    }
  }
  else
  {
    int v3 = __error();
    int v5 = 9;
  }
  *int v3 = v5;
  return *(double *)&v4;
}

int64_t _citrus_bcs_strtol(unsigned __int8 *a1, unsigned __int8 **a2, int a3)
{
  int v3 = a2;
  long long v4 = a1;
  int v5 = a1;
  if (a3)
  {
    int v5 = a1;
    if ((a3 - 37) < 0xFFFFFFDD)
    {
      uint64_t v6 = __error();
      int64_t result = 0;
      *uint64_t v6 = 22;
      if (v3) {
        goto LABEL_58;
      }
      return result;
    }
  }
  do
  {
    unsigned int v9 = *v5++;
    unsigned int v8 = v9;
    BOOL v10 = v9 == 11;
    uint64_t v11 = (1 << v9) & 0x100003600;
  }
  while (v9 <= 0x20 && v11 != 0 || v10);
  if (v8 == 43 || v8 == 45)
  {
    unsigned __int8 v15 = *v5++;
    unsigned __int8 v14 = v15;
  }
  else
  {
    unsigned __int8 v14 = v8;
  }
  if ((a3 & 0xFFFFFFEF) != 0 || v14 != 48)
  {
    BOOL v17 = a3 == 0;
    if (v14 != 48)
    {
      int v16 = 10;
      goto LABEL_24;
    }
LABEL_23:
    int v16 = 8;
LABEL_24:
    if (!v17) {
      int v16 = a3;
    }
    goto LABEL_26;
  }
  if ((*v5 | 0x20) != 0x78)
  {
    BOOL v17 = a3 == 0;
    unsigned __int8 v14 = 48;
    goto LABEL_23;
  }
  unsigned __int8 v14 = v5[1];
  v5 += 2;
  int v16 = 16;
LABEL_26:
  int64_t result = 0;
  int v18 = 0;
  int64_t v19 = 0xFFFFFFFF80000000;
  if (v8 != 45) {
    int64_t v19 = 0x7FFFFFFFLL;
  }
  uint64_t v20 = v16;
  int64_t v21 = v19 / v16;
  int v22 = v19 % v16;
  if (v22 > 0)
  {
    BOOL v23 = v8 == 45;
  }
  else
  {
    int v16 = 0;
    BOOL v23 = 0;
  }
  int v24 = v16 - v22;
  int64_t v25 = v21 + v23;
  for (i = v5 - 1; ; ++i)
  {
    if ((v14 - 58) >= 0xF6u)
    {
      int v28 = v14 - 48;
    }
    else
    {
      if (((v14 & 0xDF) - 91) < 0xE6u) {
        break;
      }
      int v27 = (v14 - 91) >= 0xE6u ? -55 : -87;
      int v28 = v27 + v14;
    }
    if (v28 >= (int)v20) {
      break;
    }
    if (v18 < 0)
    {
      int v18 = -1;
      goto LABEL_54;
    }
    if (v8 == 45)
    {
      if (result < v25 || result == v25 && v28 > v24)
      {
        *__error() = 34;
        int v18 = -1;
        int64_t result = 0xFFFFFFFF80000000;
        goto LABEL_54;
      }
      int64_t result = result * v20 - v28;
    }
    else
    {
      if (result > v25 || result == v25 && v28 > v22)
      {
        *__error() = 34;
        int v18 = -1;
        int64_t result = 0x7FFFFFFFLL;
        goto LABEL_54;
      }
      int64_t result = result * v20 + v28;
    }
    int v18 = 1;
LABEL_54:
    unsigned __int8 v29 = i[1];
    unsigned __int8 v14 = v29;
  }
  int v3 = a2;
  if (a2)
  {
    if (v18) {
      long long v4 = i;
    }
LABEL_58:
    *int v3 = v4;
  }
  return result;
}

unint64_t _citrus_bcs_strtoul(unsigned __int8 *a1, unsigned __int8 **a2, int a3)
{
  int v5 = a1;
  if (a3)
  {
    int v5 = a1;
    if ((a3 - 37) < 0xFFFFFFDD)
    {
      uint64_t v6 = __error();
      unint64_t result = 0;
      *uint64_t v6 = 22;
      return result;
    }
  }
  do
  {
    unsigned int v9 = *v5++;
    unsigned int v8 = v9;
    BOOL v10 = v9 == 11;
    uint64_t v11 = (1 << v9) & 0x100003600;
  }
  while (v9 <= 0x20 && v11 != 0 || v10);
  if (v8 == 43 || v8 == 45)
  {
    unsigned __int8 v15 = *v5++;
    unsigned __int8 v14 = v15;
  }
  else
  {
    unsigned __int8 v14 = v8;
  }
  if ((a3 & 0xFFFFFFEF) != 0 || v14 != 48)
  {
    BOOL v17 = a3 == 0;
    if (v14 != 48)
    {
      int v18 = 10;
      goto LABEL_23;
    }
LABEL_22:
    int v18 = 8;
LABEL_23:
    if (v17) {
      int v16 = v18;
    }
    else {
      int v16 = a3;
    }
    goto LABEL_26;
  }
  if ((*v5 | 0x20) != 0x78)
  {
    BOOL v17 = a3 == 0;
    unsigned __int8 v14 = 48;
    goto LABEL_22;
  }
  unsigned __int8 v14 = v5[1];
  v5 += 2;
  int v16 = 16;
LABEL_26:
  unint64_t v19 = 0;
  int v20 = 0;
  uint64_t v21 = v16;
  unint64_t v22 = 0xFFFFFFFFuLL / v16;
  int v23 = ~(v22 * v16);
  for (i = v5 - 1; ; ++i)
  {
    if ((v14 - 58) >= 0xF6u)
    {
      int v26 = v14 - 48;
    }
    else
    {
      if (((v14 & 0xDF) - 91) < 0xE6u) {
        break;
      }
      int v25 = (v14 - 91) >= 0xE6u ? -55 : -87;
      int v26 = v25 + v14;
    }
    if (v26 >= (int)v21) {
      break;
    }
    if (v20 < 0) {
      goto LABEL_40;
    }
    if (v19 > v22 || v19 == v22 && v26 > v23)
    {
      *__error() = 34;
      unint64_t v19 = 0xFFFFFFFFLL;
LABEL_40:
      int v20 = -1;
      goto LABEL_41;
    }
    unint64_t v19 = v19 * v21 + v26;
    int v20 = 1;
LABEL_41:
    unsigned __int8 v27 = i[1];
    unsigned __int8 v14 = v27;
  }
  if (v20 > 0 && v8 == 45) {
    unint64_t result = -(uint64_t)v19;
  }
  else {
    unint64_t result = v19;
  }
  if (a2)
  {
    if (v20) {
      unsigned __int8 v29 = i;
    }
    else {
      unsigned __int8 v29 = a1;
    }
    *a2 = v29;
  }
  return result;
}

uint64_t _citrus_bcs_strcasecmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  do
  {
    unsigned __int8 v3 = *a1++;
    unsigned __int8 v2 = v3;
    unsigned __int8 v4 = v3 - 32;
    if ((v3 - 123) >= 0xE6u) {
      unsigned __int8 v2 = v4;
    }
    unsigned __int8 v6 = *a2++;
    unsigned __int8 v5 = v6;
    unsigned __int8 v7 = v6 - 32;
    if ((v6 - 123) >= 0xE6u) {
      unsigned __int8 v5 = v7;
    }
    if (v2) {
      BOOL v8 = v5 == 0;
    }
    else {
      BOOL v8 = 1;
    }
  }
  while (!v8 && v2 == v5);
  BOOL v9 = v2 == v5;
  if (v2 > v5) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = -1;
  }
  if (v9) {
    return 0;
  }
  else {
    return v10;
  }
}

uint64_t _citrus_bcs_strncasecmp(char *a1, char *a2, uint64_t a3)
{
  unsigned int v3 = 1;
  unsigned int v4 = 1;
  do
  {
    BOOL v6 = a3-- != 0;
    if (v4 != v3 || !v6) {
      break;
    }
    char v7 = *a1++;
    LOBYTE(v4) = v7;
    char v8 = v7 - 32;
    if ((v7 - 123) >= 0xE6u) {
      LOBYTE(v4) = v8;
    }
    unsigned int v4 = v4;
    char v9 = *a2++;
    LOBYTE(v3) = v9;
    char v10 = v9 - 32;
    if ((v9 - 123) >= 0xE6u) {
      LOBYTE(v3) = v10;
    }
    unsigned int v3 = v3;
  }
  while ((_BYTE)v4 && v3 != 0);
  BOOL v12 = v4 == v3;
  if (v4 > v3) {
    unsigned int v13 = 1;
  }
  else {
    unsigned int v13 = -1;
  }
  if (v12) {
    return 0;
  }
  else {
    return v13;
  }
}

unsigned __int8 *_citrus_bcs_skip_ws(unsigned __int8 *result)
{
  while (1)
  {
    int v1 = *result;
    if ((v1 - 9) >= 5 && v1 != 32) {
      break;
    }
    ++result;
  }
  return result;
}

unsigned __int8 *_citrus_bcs_skip_nonws(unsigned __int8 *result)
{
  while (1)
  {
    unsigned int v1 = *result;
    BOOL v2 = v1 > 0x20;
    uint64_t v3 = (1 << v1) & 0x100003E01;
    if (!v2 && v3 != 0) {
      break;
    }
    ++result;
  }
  return result;
}

unsigned __int8 *_citrus_bcs_skip_ws_len(unsigned __int8 *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = &result[v2];
    uint64_t v4 = v2 - 1;
    while (1)
    {
      int v5 = *result;
      if ((v5 - 9) >= 5 && v5 != 32) {
        break;
      }
      ++result;
      *a2 = v4--;
      if (v4 == -1) {
        return v3;
      }
    }
  }
  return result;
}

unsigned __int8 *_citrus_bcs_skip_nonws_len(unsigned __int8 *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = &result[v2];
    uint64_t v4 = v2 - 1;
    while (1)
    {
      unsigned int v5 = *result;
      BOOL v6 = v5 > 0x20;
      uint64_t v7 = (1 << v5) & 0x100003E01;
      if (!v6 && v7 != 0) {
        break;
      }
      ++result;
      *a2 = v4--;
      if (v4 == -1) {
        return v3;
      }
    }
  }
  return result;
}

uint64_t _citrus_bcs_trunc_rws_len(uint64_t result, void *a2)
{
  if (*a2)
  {
    uint64_t v2 = *a2 - 1;
    do
    {
      int v3 = *(unsigned __int8 *)(result + v2);
      if ((v3 - 9) >= 5 && v3 != 32) {
        break;
      }
      *a2 = v2--;
    }
    while (v2 != -1);
  }
  return result;
}

unsigned __int8 *_citrus_bcs_convert_to_upper(unsigned __int8 *result)
{
  unsigned __int8 v1 = *result;
  if (*result)
  {
    uint64_t v2 = result + 1;
    do
    {
      if ((v1 - 123) >= 0xE6u) {
        v1 -= 32;
      }
      *(v2 - 1) = v1;
      int v3 = *v2++;
      unsigned __int8 v1 = v3;
    }
    while (v3);
  }
  return result;
}

uint64_t open_serial_mapper(uint64_t a1, uint64_t a2, const char *a3, const char *a4, const char *a5)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x400uLL, "%s/%s,%s/%s", a3, a4, a4, a5);
  return _citrus_mapper_open_direct(a1, a2, "mapper_serial", __str);
}

uint64_t open_subdb(void *a1, uint64_t *a2, char *__s)
{
  v5[0] = 0;
  v5[1] = 0;
  uint64_t result = _citrus_db_lookup_by_string(a2, __s, v5, 0);
  if (!result) {
    return _citrus_db_open(a1, (uint64_t)v5, "CSPIVSUB", (uint64_t)_citrus_db_hash_std, 0);
  }
  return result;
}

uint64_t parse_line(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v3 = *(unsigned __int8 **)a2;
  uint64_t v13 = *(void *)(a2 + 8);
  uint64_t v4 = _citrus_bcs_skip_ws_len(v3, &v13);
  if (!v13) {
    return 79;
  }
  unsigned int v5 = (const char *)v4;
  BOOL v6 = _citrus_bcs_skip_nonws_len(v4, &v13);
  if (!v13) {
    return 79;
  }
  int v7 = (int)v6;
  char v8 = _citrus_bcs_skip_ws_len(v6, &v13);
  if (!v13) {
    return 79;
  }
  uint64_t v9 = (const char *)v8;
  unsigned int v10 = _citrus_bcs_skip_nonws_len(v8, &v13);
  snprintf((char *)a1, 0x400uLL, "%.*s", v7 - v5, v5);
  snprintf(__str, 0x14uLL, "%.*s", v10 - v9, v9);
  unint64_t v11 = _citrus_bcs_strtoul((unsigned __int8 *)__str, 0, 0);
  uint64_t result = 0;
  *(void *)(a1 + 1024) = v11;
  return result;
}

uint64_t _citrus_db_lookup8_by_string(uint64_t *a1, char *__s, unsigned char *a3, uint64_t a4)
{
  char v8 = 0;
  uint64_t v9 = 0;
  v10[0] = __s;
  v10[1] = strlen(__s);
  uint64_t result = _citrus_db_lookup(a1, (uint64_t)v10, &v8, a4);
  if (!result)
  {
    if (v9 == 1)
    {
      uint64_t result = 0;
      if (a3) {
        *a3 = *v8;
      }
    }
    else
    {
      return 79;
    }
  }
  return result;
}

uint64_t _citrus_db_lookup16_by_string(uint64_t *a1, char *__s, _WORD *a3, uint64_t a4)
{
  char v8 = 0;
  uint64_t v9 = 0;
  v10[0] = __s;
  v10[1] = strlen(__s);
  uint64_t result = _citrus_db_lookup(a1, (uint64_t)v10, &v8, a4);
  if (!result)
  {
    if (v9 == 2)
    {
      uint64_t result = 0;
      if (a3) {
        *a3 = bswap32(*v8) >> 16;
      }
    }
    else
    {
      return 79;
    }
  }
  return result;
}

uint64_t _citrus_db_get_entry(void *a1, unsigned int a2, void *a3, void *a4)
{
  uint64_t result = 22;
  if ((a2 & 0x80000000) == 0)
  {
    uint64_t v6 = *a1;
    if (bswap32(*(_DWORD *)(*a1 + 8)) > a2)
    {
      unint64_t v7 = a1[1];
      unint64_t v8 = bswap32(*(_DWORD *)(v6 + 12)) + 24 * a2;
      if (v7 <= v8 || v8 + 24 > v7) {
        return 79;
      }
      unsigned int v10 = (unsigned int *)(v6 + v8);
      unint64_t v11 = bswap32(v10[2]);
      if (v7 <= v11) {
        return 79;
      }
      uint64_t v12 = bswap32(v10[3]);
      if (v12 + v11 > v7) {
        return 79;
      }
      if (a3)
      {
        *a3 = v6 + v11;
        a3[1] = v12;
      }
      unint64_t v13 = bswap32(v10[4]);
      if (v7 <= v13) {
        return 79;
      }
      uint64_t v14 = bswap32(v10[5]);
      if (v14 + v13 > v7)
      {
        return 79;
      }
      else
      {
        uint64_t result = 0;
        if (a4)
        {
          *a4 = v6 + v13;
          a4[1] = v14;
        }
      }
    }
  }
  return result;
}

uint64_t _citrus_db_factory_create(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = malloc_type_malloc(0x38uLL, 0x10A00402683DD91uLL);
  if (!v6) {
    return *__error();
  }
  unint64_t v7 = v6;
  uint64_t result = 0;
  void *v7 = 0;
  v7[1] = 0;
  v7[2] = v7 + 1;
  v7[3] = 0;
  v7[4] = 0;
  v7[5] = a2;
  v7[6] = a3;
  *a1 = v7;
  return result;
}

void _citrus_db_factory_free(void ***a1)
{
  int v3 = a1 + 1;
  uint64_t v2 = a1[1];
  if (v2)
  {
    do
    {
      uint64_t v4 = *v2;
      *int v3 = (void **)*v2;
      if (!v4) {
        a1[2] = (void **)v3;
      }
      if (*((_DWORD *)v2 + 10)) {
        free(v2[3]);
      }
      if (*((_DWORD *)v2 + 16)) {
        free(v2[6]);
      }
      free(v2);
      uint64_t v2 = *v3;
    }
    while (*v3);
  }

  free(a1);
}

uint64_t _citrus_db_factory_add(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  unsigned int v10 = malloc_type_malloc(0x48uLL, 0x10A0040BA52E972uLL);
  uint64_t v11 = 0xFFFFFFFFLL;
  if (v10)
  {
    uint64_t v12 = v10;
    v10[4] = (*(uint64_t (**)(uint64_t))(a1 + 40))(a2);
    *(_OWORD *)(v12 + 6) = *(_OWORD *)a2;
    v12[10] = a3;
    *((_OWORD *)v12 + 3) = *(_OWORD *)a4;
    v12[16] = a5;
    v12[17] = -1;
    *(void *)uint64_t v12 = 0;
    uint64_t v13 = *(void *)(a1 + 24);
    **(void **)(a1 + 16) = v12;
    uint64_t v14 = v13 + *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v12;
    *(void *)(a1 + 24) = v14;
    *(void *)(a1 + 32) += (*(void *)(a4 + 8) + 15) & 0xFFFFFFFFFFFFFFF0;
    ++*(void *)a1;
    return 0;
  }
  return v11;
}

uint64_t _citrus_db_factory_add_by_string(uint64_t a1, char *__s1, uint64_t a3, int a4)
{
  unint64_t v8 = strdup(__s1);
  if (!v8) {
    return *__error();
  }
  v10[0] = v8;
  v10[1] = strlen(__s1);
  return _citrus_db_factory_add(a1, (uint64_t)v10, 1, a3, a4);
}

uint64_t _citrus_db_factory_add8_by_string(uint64_t a1, char *a2, char a3)
{
  uint64_t v6 = malloc_type_malloc(1uLL, 0x100004077774924uLL);
  if (!v6) {
    return *__error();
  }
  *uint64_t v6 = a3;
  v8[0] = v6;
  v8[1] = 1;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v8, 1);
}

uint64_t _citrus_db_factory_add16_by_string(uint64_t a1, char *a2, unsigned int a3)
{
  uint64_t v6 = malloc_type_malloc(2uLL, 0x1000040BDFB0063uLL);
  if (!v6) {
    return *__error();
  }
  *uint64_t v6 = __rev16(a3);
  v8[0] = v6;
  v8[1] = 2;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v8, 1);
}

uint64_t _citrus_db_factory_add32_by_string(uint64_t a1, char *a2, unsigned int a3)
{
  uint64_t v6 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  if (!v6) {
    return *__error();
  }
  *uint64_t v6 = bswap32(a3);
  v8[0] = v6;
  v8[1] = 4;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v8, 1);
}

uint64_t _citrus_db_factory_add_string_by_string(uint64_t a1, char *a2, char *__s1)
{
  unsigned int v5 = strdup(__s1);
  if (!v5) {
    return *__error();
  }
  v7[0] = v5;
  v7[1] = strlen(v5) + 1;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v7, 1);
}

unint64_t _citrus_db_factory_calc_size(void *a1)
{
  return a1[4] + ((a1[3] + 15) & 0xFFFFFFFFFFFFFFF0) + ((24 * *a1 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
}

uint64_t _citrus_db_factory_serialize(size_t *a1, uint64_t a2, uint64_t a3)
{
  size_t v6 = *a1;
  if (v6)
  {
    unint64_t v7 = malloc_type_calloc(v6, 8uLL, 0x2004093837F09uLL);
    if (v7)
    {
      unint64_t v8 = v7;
      size_t v9 = a1[1];
      if (v9)
      {
        size_t v10 = *a1;
        do
        {
          unint64_t v11 = *(unsigned int *)(v9 + 16) % v10;
          *(_DWORD *)(v9 + 16) = v11;
          *(_DWORD *)(v9 + 68) = -1;
          *(void *)(v9 + 8) = 0;
          if (!v7[v11])
          {
            v7[v11] = v9;
            *(_DWORD *)(v9 + 68) = v11;
          }
          size_t v9 = *(void *)v9;
        }
        while (v9);
        size_t v12 = a1[1];
        if (v12)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(_DWORD *)(v12 + 68) == -1)
            {
              uint64_t v14 = v7[*(unsigned int *)(v12 + 16)];
              do
              {
                uint64_t v15 = v14;
                uint64_t v14 = *(void *)(v14 + 8);
              }
              while (v14);
              *(void *)(v15 + 8) = v12;
              while (v7[v13++])
                ;
              v7[--v13] = v12;
              *(_DWORD *)(v12 + 68) = v13;
            }
            size_t v12 = *(void *)v12;
          }
          while (v12);
        }
      }
      uint64_t v17 = 0;
      size_t v18 = *a1;
      unint64_t v19 = (24 * *a1 + 15) & 0xFFFFFFFFFFFFFFF0;
      unint64_t v20 = (a1[3] + 15) & 0xFFFFFFFFFFFFFFF0;
      do
      {
        *(unsigned char *)(*(void *)a3 + v17) = *(unsigned char *)(a2 + v17);
        ++v17;
      }
      while (v17 != 8);
      if (HIDWORD(v18)) {
        _citrus_db_factory_serialize_cold_1();
      }
      unint64_t v21 = v19 + 16;
      *(_DWORD *)(*(void *)a3 + 8) = bswap32(v18);
      *(_DWORD *)(*(void *)a3 + 12) = 0x10000000;
      if (*a1)
      {
        size_t v22 = 0;
        unint64_t v23 = v21 + v20;
        uint64_t v24 = 16;
        do
        {
          uint64_t v25 = v8[v22];
          uint64_t v26 = *(void *)(v25 + 8);
          if (v26)
          {
            int v27 = *(_DWORD *)(v26 + 68);
            *(_DWORD *)(*(void *)a3 + v24) = bswap32(*(_DWORD *)(v25 + 16));
            if (v27 < 0) {
              _citrus_db_factory_serialize_cold_6();
            }
            LODWORD(v26) = 24 * v27 + 16;
          }
          else
          {
            *(_DWORD *)(*(void *)a3 + v24) = bswap32(*(_DWORD *)(v25 + 16));
          }
          *(_DWORD *)(*(void *)a3 + (v24 | 4)) = bswap32(v26);
          if (HIDWORD(v21)) {
            _citrus_db_factory_serialize_cold_2();
          }
          *(_DWORD *)(v24 + *(void *)a3 + 8) = bswap32(v21);
          unint64_t v28 = *(void *)(v25 + 32);
          if (HIDWORD(v28)) {
            _citrus_db_factory_serialize_cold_3();
          }
          *(_DWORD *)(v24 + *(void *)a3 + 12) = bswap32(v28);
          if (HIDWORD(v23)) {
            _citrus_db_factory_serialize_cold_4();
          }
          *(_DWORD *)(v24 + *(void *)a3 + 16) = bswap32(v23);
          unint64_t v29 = *(void *)(v25 + 56);
          if (HIDWORD(v29)) {
            _citrus_db_factory_serialize_cold_5();
          }
          *(_DWORD *)(v24 + *(void *)a3 + 20) = bswap32(v29);
          memcpy((void *)(*(void *)a3 + v21), *(const void **)(v25 + 24), *(void *)(v25 + 32));
          uint64_t v30 = *(void *)(v25 + 32);
          memcpy((void *)(*(void *)a3 + v23), *(const void **)(v25 + 48), *(void *)(v25 + 56));
          v23 += *(void *)(v25 + 56);
          unint64_t v31 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
          while (v31 != v23)
            *(unsigned char *)(*(void *)a3 + v23++) = 0;
          v24 += 24;
          v21 += v30;
          ++v22;
        }
        while (v22 < *a1);
      }
      else
      {
        uint64_t v24 = 16;
      }
      unint64_t v34 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
      while (v34 != v24)
        *(unsigned char *)(*(void *)a3 + v24++) = 0;
      unint64_t v35 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
      while (v35 != v21)
        *(unsigned char *)(*(void *)a3 + v21++) = 0;
      free(v8);
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    for (uint64_t i = 0; i != 8; ++i)
      *(unsigned char *)(*(void *)a3 + i) = *(unsigned char *)(a2 + i);
    uint64_t result = 0;
    *(_DWORD *)(*(void *)a3 + 8) = 0;
    *(_DWORD *)(*(void *)a3 + 12) = 0x10000000;
  }
  return result;
}

char *_citrus_esdb_alias(uint64_t a1, char *a2, size_t a3)
{
  uint64_t result = _citrus_lookup_simple("/usr/share/i18n/esdb/esdb.alias", a1, a2, a3, 1);
  if (!result) {
    return (char *)a1;
  }
  return result;
}

void _citrus_esdb_free_list(void **a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = a2;
    uint64_t v4 = a1;
    do
    {
      unsigned int v5 = *v4++;
      free(v5);
      --v3;
    }
    while (v3);
  }

  free(a1);
}

uint64_t _citrus_esdb_get_list(void *a1, uint64_t *a2, char a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v6 = _citrus_lookup_seq_open(&v21, "/usr/share/i18n/esdb/esdb.alias", 1);
  if (v6) {
    return v6;
  }
  uint64_t v6 = _citrus_lookup_seq_open(&v20, "/usr/share/i18n/esdb/esdb.dir", 1);
  if (v6) {
    goto LABEL_25;
  }
  int number_of_entries = _citrus_lookup_get_number_of_entries(v21);
  int v8 = _citrus_lookup_get_number_of_entries(v20) + number_of_entries;
  _citrus_lookup_seq_rewind(v21);
  _citrus_lookup_seq_rewind(v20);
  size_t v9 = malloc_type_malloc(8 * v8, 0x10040436913F5uLL);
  uint64_t v10 = 0;
  if (!v9)
  {
LABEL_21:
    uint64_t v6 = *__error();
LABEL_22:
    if (!v6) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = _citrus_lookup_seq_next(v21);
    if (v11) {
      break;
    }
    snprintf(__str, 0x400uLL, "%.*s/%.*s", 0, 0, 0, 0);
    _citrus_bcs_convert_to_upper((unsigned __int8 *)__str);
    size_t v12 = strdup(__str);
    v9[v10] = v12;
    if (!v12) {
      goto LABEL_21;
    }
    ++v10;
  }
  uint64_t v6 = v11;
  if (v11 != 2) {
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v13 = _citrus_lookup_seq_next(v20);
    if (v13) {
      break;
    }
    if ((a3 & 1) == 0)
    {
      snprintf(__str, 0x400uLL, "%.*s");
      goto LABEL_17;
    }
    snprintf(__s, 0x400uLL, "%.*s", 0, 0);
    uint64_t v14 = strchr(__s, 47);
    if (v14)
    {
      strlen(v14);
      __memmove_chk();
    }
    uint64_t v15 = strstr(__s, ".esdb");
    if (v15) {
      char *v15 = 0;
    }
    if (!strchr(__s, 64))
    {
      snprintf(__str, 0x400uLL, "%s/%.*s");
LABEL_17:
      _citrus_bcs_convert_to_upper((unsigned __int8 *)__str);
      uint64_t v16 = _citrus_lookup_seq_lookup(v21);
      if (v16)
      {
        uint64_t v6 = v16;
        if (v16 != 2) {
          goto LABEL_22;
        }
        uint64_t v17 = strdup(__str);
        v9[v10] = v17;
        if (!v17) {
          goto LABEL_21;
        }
        ++v10;
      }
    }
  }
  uint64_t v6 = v13;
  if (v13 != 2) {
    goto LABEL_22;
  }
  unint64_t v19 = malloc_type_realloc(v9, 8 * v10, 0x10040436913F5uLL);
  if (!v19)
  {
    uint64_t v6 = 12;
LABEL_23:
    _citrus_esdb_free_list((void **)v9, v10);
    goto LABEL_24;
  }
  uint64_t v6 = 0;
  *a1 = v19;
  *a2 = v10;
LABEL_24:
  _citrus_lookup_seq_close(v20);
LABEL_25:
  _citrus_lookup_seq_close(v21);
  return v6;
}

char *_citrus_iconv_canonicalize(uint64_t a1)
{
  uint64_t v2 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
  if (v2) {
    _citrus_esdb_alias(a1, v2, 0x400uLL);
  }
  return v2;
}

uint64_t _citrus_lookup_factory_convert()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v3 = (FILE *)v0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  size_t v19 = 0;
  uint64_t v20 = 0;
  size_t __n = 0;
  size_t v18 = 0;
  uint64_t v4 = _citrus_db_factory_create(&v20, (uint64_t)_citrus_db_hash_std, 0);
  if (!v4)
  {
    while (1)
    {
      unsigned int v5 = fgetln(v2, &__n);
      uint64_t v6 = (size_t *)v20;
      if (!v5) {
        break;
      }
      unint64_t v7 = (unsigned __int8 *)v5;
      size_t v21 = __n;
      int v8 = memchr(v5, 35, __n);
      if (v8) {
        size_t v21 = v8 - v7;
      }
      size_t v9 = _citrus_bcs_skip_ws_len(v7, (uint64_t *)&v21);
      if (v21)
      {
        uint64_t v10 = (const char *)v9;
        uint64_t v11 = _citrus_bcs_skip_nonws_len(v9, (uint64_t *)&v21);
        if (v11 != (unsigned __int8 *)v10)
        {
          size_t v12 = v11;
          snprintf(__str, 0x800uLL, "%.*s", v11 - v10, v10);
          _citrus_bcs_convert_to_lower((unsigned __int8 *)__str);
          uint64_t v13 = _citrus_bcs_skip_ws_len(v12, (uint64_t *)&v21);
          _citrus_bcs_trunc_rws_len((uint64_t)v13, &v21);
          snprintf(__s1, 0x800uLL, "%.*s", v21, (const char *)v13);
          uint64_t v4 = _citrus_db_factory_add_string_by_string((uint64_t)v6, __str, __s1);
          if (v4)
          {
            _citrus_db_factory_free((void ***)v20);
            return v4;
          }
        }
      }
    }
    size_t v14 = _citrus_db_factory_calc_size(v20);
    uint64_t v15 = malloc_type_malloc(v14, 0x8366329DuLL);
    if (v15)
    {
      size_t v18 = v15;
      size_t v19 = v14;
      uint64_t v4 = _citrus_db_factory_serialize(v6, (uint64_t)"LOOKUP", (uint64_t)&v18);
    }
    else
    {
      uint64_t v4 = *__error();
    }
    _citrus_db_factory_free((void ***)v20);
    if (!v4)
    {
      if (fwrite(v18, v19, 1uLL, v3) == 1) {
        return 0;
      }
      else {
        return *__error();
      }
    }
  }
  return v4;
}

void _citrus_lookup_seq_rewind(uint64_t a1)
{
  *(_DWORD *)(a1 + 52) = 1;
  free(*(void **)(a1 + 56));
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
}

uint64_t _citrus_lookup_seq_next(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t _citrus_lookup_seq_lookup(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t _citrus_lookup_get_number_of_entries(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 88))();
}

void _citrus_lookup_seq_close(uint64_t a1)
{
  free(*(void **)(a1 + 56));
  (*(void (**)(uint64_t))(a1 + 96))(a1);

  free((void *)a1);
}

uint64_t seq_next_db(uint64_t a1, char **a2, void *a3)
{
  uint64_t v6 = *(char **)(a1 + 56);
  if (v6)
  {
    if (a2)
    {
      unint64_t v7 = *(char **)(a1 + 64);
      *a2 = v6;
      a2[1] = v7;
    }
    return _citrus_db_lookup_by_string(*(uint64_t **)a1, v6, a3, a1 + 32);
  }
  else
  {
    if (*(_DWORD *)(a1 + 52))
    {
      signed int v9 = 0;
      *(_DWORD *)(a1 + 28) = 0;
    }
    else
    {
      signed int v9 = *(_DWORD *)(a1 + 28);
    }
    *(_DWORD *)(a1 + 52) = 0;
    if (v9 >= *(_DWORD *)(a1 + 24))
    {
      return 2;
    }
    else
    {
      uint64_t v10 = *(uint64_t **)a1;
      *(_DWORD *)(a1 + 28) = v9 + 1;
      return _citrus_db_get_entry(v10, v9, a2, a3);
    }
  }
}

uint64_t seq_get_num_entries_db(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t seq_next_plain(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  if (*(_DWORD *)(a1 + 52))
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)a1;
    *(void *)(a1 + 32) = 0;
  }
  size_t __n = 0;
  *(_DWORD *)(a1 + 52) = 0;
  unint64_t v6 = _citrus_memory_stream_getln((void *)(a1 + 16), &__n);
  if (!v6) {
    return 2;
  }
  unint64_t v7 = (void *)v6;
  while (1)
  {
    int v8 = memchr(v7, 35, __n);
    if (v8) {
      size_t __n = v8 - (unsigned char *)v7;
    }
    _citrus_bcs_trunc_rws_len((uint64_t)v7, &__n);
    signed int v9 = _citrus_bcs_skip_ws_len((unsigned __int8 *)v7, (uint64_t *)&__n);
    uint64_t v10 = _citrus_bcs_skip_nonws_len(v9, (uint64_t *)&__n);
    if (v9 != v10)
    {
      uint64_t v11 = v10;
      size_t v12 = *(const void **)(a1 + 56);
      if (!v12 || v10 - v9 == *(void *)(a1 + 64) && !memcmp(v9, v12, v10 - v9)) {
        break;
      }
    }
    unint64_t v7 = (void *)_citrus_memory_stream_getln((void *)(a1 + 16), &__n);
    if (!v7) {
      return 2;
    }
  }
  if (a2)
  {
    *a2 = v9;
    a2[1] = (unsigned __int8 *)(v11 - v9);
  }
  size_t v14 = _citrus_bcs_skip_ws_len(v11, (uint64_t *)&__n);
  if (!a3) {
    return 0;
  }
  uint64_t v15 = v14;
  uint64_t result = 0;
  size_t v16 = __n;
  if (!__n) {
    uint64_t v15 = 0;
  }
  *a3 = v15;
  a3[1] = (unsigned __int8 *)v16;
  return result;
}

uint64_t seq_lookup_plain(uint64_t a1, const char *a2, void *a3)
{
  *(_DWORD *)(a1 + 52) = 0;
  free(*(void **)(a1 + 56));
  unint64_t v6 = (unsigned __int8 *)strdup(a2);
  unint64_t v7 = (char *)v6;
  *(void *)(a1 + 56) = v6;
  if (*(_DWORD *)(a1 + 48))
  {
    _citrus_bcs_convert_to_lower(v6);
    unint64_t v7 = *(char **)(a1 + 56);
  }
  size_t v12 = 0;
  *(void *)(a1 + 64) = strlen(v7);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a1;
  *(void *)(a1 + 32) = 0;
  int v8 = _citrus_memory_stream_matchline((void *)(a1 + 16), v7, &v12, 0);
  if (!v8) {
    return 2;
  }
  if (!a3) {
    return 0;
  }
  signed int v9 = v8;
  uint64_t result = 0;
  size_t v11 = v12;
  *a3 = v9;
  a3[1] = v11;
  return result;
}

uint64_t seq_get_num_entries_plain(uint64_t a1)
{
  LODWORD(v2) = -1;
  do
    uint64_t v2 = (v2 + 1);
  while (!seq_next_plain(a1, 0, 0));
  return v2;
}

uint64_t _citrus_mapper_get_mapdir_from_key(char *a1)
{
  if (!strncmp(a1, "UCS:", 4uLL) || !strncmp(a1, "UCS/", 4uLL)) {
    return 1;
  }
  uint64_t result = (uint64_t)strchr(a1, 47);
  if (result)
  {
    uint64_t v3 = (const char *)(result + 1);
    if (!strncmp((const char *)(result + 1), "UCS", 4uLL)) {
      return 2;
    }
    else {
      return 2 * (strncmp(v3, "UCS:", 4uLL) == 0);
    }
  }
  return result;
}

uint64_t _citrus_mapper_open(uint64_t a1, uint64_t *a2, char *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  pthread_rwlock_wrlock(&cm_lock);
  unint64_t v6 = (uint64_t *)(a1 + 8 * (int)_string_hash_func(a3, 0x65u));
  uint64_t v7 = *v6;
  if (!*v6)
  {
LABEL_4:
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    int v8 = *(const char **)(a1 + 808);
    long long v25 = 0uLL;
    snprintf(__str, 0x400uLL, "%s/%s", v8, "mapper.dir");
    uint64_t v9 = _citrus_map_file(&v25, __str);
    if (v9)
    {
      uint64_t v10 = v9;
      goto LABEL_20;
    }
    long long v23 = v25;
    uint64_t v24 = 0;
    size_t v11 = (unsigned __int8 *)_citrus_memory_stream_matchline(&v23, a3, (size_t *)&v22, 0);
    if (v11)
    {
      if ((unint64_t)(v22 - 1024) > 0xFFFFFFFFFFFFFC00)
      {
        size_t v12 = v11;
        uint64_t v13 = _citrus_bcs_skip_nonws_len(v11, &v22);
        uint64_t v14 = v13 - v12 + 1;
        __strlcpy_chk();
        uint64_t v15 = _citrus_bcs_skip_ws_len(v13, &v22);
        strlcpy(&v26[v14], (const char *)v15, v22 + 1);
        _citrus_unmap_file((uint64_t)&v25);
        pthread_rwlock_unlock(&cm_lock);
        uint64_t v10 = mapper_open(a1, &v21, v26, &v26[v14]);
        pthread_rwlock_wrlock(&cm_lock);
        if (!v10)
        {
          size_t v16 = strdup(a3);
          uint64_t v17 = v21;
          *(void *)(v21 + 56) = v16;
          if (v16)
          {
            *(_DWORD *)(v17 + 48) = 1;
            if (!*(_DWORD *)(v17 + 64))
            {
              int mapdir_from_key = _citrus_mapper_get_mapdir_from_key(v16);
              *(_DWORD *)(v17 + 64) = mapdir_from_key;
              if (((mapdir_from_key + 3) & mapdir_from_key) != 0) {
                _citrus_mapper_open_cold_1();
              }
            }
            uint64_t v19 = *v6;
            *(void *)(v17 + 32) = *v6;
            if (v19) {
              *(void *)(v19 + 40) = v17 + 32;
            }
            uint64_t v10 = 0;
            *unint64_t v6 = v17;
            *(void *)(v17 + 40) = v6;
            *a2 = v17;
          }
          else
          {
            uint64_t v10 = *__error();
            _citrus_mapper_close(v17);
          }
        }
        goto LABEL_20;
      }
      uint64_t v10 = 22;
    }
    else
    {
      uint64_t v10 = 2;
    }
    _citrus_unmap_file((uint64_t)&v25);
    goto LABEL_20;
  }
  while (strcmp(*(const char **)(v7 + 56), a3))
  {
    uint64_t v7 = *(void *)(v7 + 32);
    if (!v7) {
      goto LABEL_4;
    }
  }
  uint64_t v10 = 0;
  ++*(_DWORD *)(v7 + 48);
  *a2 = v7;
LABEL_20:
  pthread_rwlock_unlock(&cm_lock);
  return v10;
}

void _citrus_mapper_close(uint64_t a1)
{
  if (!a1) {
    return;
  }
  pthread_rwlock_wrlock(&cm_lock);
  int v2 = *(_DWORD *)(a1 + 48);
  if (v2 != -1)
  {
    BOOL v3 = __OFSUB__(v2, 1);
    int v4 = v2 - 1;
    if (v4 < 0 != v3)
    {
LABEL_8:
      pthread_rwlock_unlock(&cm_lock);
      mapper_close((void *)a1);
      return;
    }
    *(_DWORD *)(a1 + 48) = v4;
    if (!v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        *(void *)(v5 + 40) = *(void *)(a1 + 40);
      }
      **(void **)(a1 + 40) = v5;
      free(*(void **)(a1 + 56));
      goto LABEL_8;
    }
  }

  pthread_rwlock_unlock(&cm_lock);
}

void mapper_close(void *a1)
{
  int v2 = (void *)*((void *)a1 + 2);
  if (v2)
  {
    BOOL v3 = *(void (***)(void))a1;
    if (*(void *)a1)
    {
      if (*((void *)a1 + 1))
      {
        ((void (**)(void *))v3)[1](a1);
        BOOL v3 = *(void (***)(void))a1;
      }
      free(v3);
      int v2 = (void *)*((void *)a1 + 2);
    }
    _citrus_unload_module(v2);
  }
  free(*((void **)a1 + 3));

  free(a1);
}

unint64_t _citrus_memory_stream_getln(void *a1, unint64_t *a2)
{
  unint64_t v3 = a1[1];
  unint64_t v2 = a1[2];
  if (v3 <= v2) {
    return 0;
  }
  unint64_t v4 = *a1 + v2;
  unint64_t v5 = v3 - v2;
  if (v5)
  {
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = v6 + 1;
      int v8 = *(unsigned __int8 *)(v4 + v6);
      if (v8 == 10 || v8 == 13) {
        break;
      }
      unint64_t v6 = v7;
      if (v5 == v7) {
        goto LABEL_12;
      }
    }
    unint64_t v5 = v7;
  }
LABEL_12:
  a1[2] = v5 + v2;
  *a2 = v5;
  return v4;
}

void *_citrus_memory_stream_matchline(void *a1, char *__s, size_t *a3, int a4)
{
  size_t __n = 0;
  size_t v8 = strlen(__s);
  uint64_t result = (void *)_citrus_memory_stream_getln(a1, &__n);
  if (result)
  {
    uint64_t v10 = result;
    do
    {
      size_t v11 = memchr(v10, 35, __n);
      if (v11) {
        size_t __n = v11 - (unsigned char *)v10;
      }
      _citrus_bcs_trunc_rws_len((uint64_t)v10, &__n);
      if (__n)
      {
        size_t v12 = _citrus_bcs_skip_ws_len((unsigned __int8 *)v10, (uint64_t *)&__n);
        uint64_t v13 = _citrus_bcs_skip_nonws_len(v12, (uint64_t *)&__n);
        if (v13 - v12 == v8)
        {
          uint64_t v14 = v13;
          if (a4)
          {
            if (!memcmp(__s, v12, v8)) {
              goto LABEL_13;
            }
          }
          else if (!_citrus_bcs_strncasecmp(__s, (char *)v12, v8))
          {
LABEL_13:
            uint64_t result = _citrus_bcs_skip_ws_len(v14, (uint64_t *)&__n);
            *a3 = __n;
            return result;
          }
        }
      }
      uint64_t result = (void *)_citrus_memory_stream_getln(a1, &__n);
      uint64_t v10 = result;
    }
    while (result);
  }
  return result;
}

char *_citrus_memory_stream_chr(void *a1, unint64_t *a2, int __c)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[2];
  if (v4 >= v3) {
    return 0;
  }
  unint64_t v7 = *a1 + v4;
  BOOL v8 = v3 >= v4;
  size_t v9 = v3 - v4;
  if (v8) {
    size_t v10 = v9;
  }
  else {
    size_t v10 = 0;
  }
  uint64_t result = (char *)memchr((void *)(*a1 + v4), __c, v10);
  *a2 = v7;
  if (result)
  {
    a2[1] = (unint64_t)&result[-v7];
    uint64_t v12 = (uint64_t)&result[v4 - v7 + 1];
  }
  else
  {
    a2[1] = v10;
    uint64_t v12 = a1[1];
  }
  a1[2] = v12;
  return result;
}

uint64_t *_citrus_memory_stream_skip_ws(uint64_t *result)
{
  unint64_t v1 = result[1];
  unint64_t v2 = result[2];
  if (v2 < v1)
  {
    uint64_t v3 = *result;
    do
    {
      int v4 = *(unsigned __int8 *)(v3 + v2);
      if ((v4 - 9) >= 5 && v4 != 32) {
        break;
      }
      result[2] = ++v2;
    }
    while (v1 != v2);
  }
  return result;
}

void *_citrus_unload_module(void *result)
{
  if (result)
  {
    if (result == (void *)-3) {
      _citrus_unload_module_cold_1();
    }
    return (void *)dlclose(result);
  }
  return result;
}

uint64_t _citrus_NONE_stdenc_init(uint64_t a1, char *a2, unint64_t a3, uint64_t a4)
{
  BOOL v8 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (!v8) {
    return *__error();
  }
  for (uint64_t i = v8; a3; --a3)
  {
    char v10 = *a2;
    if ((*a2 - 91) >= 0xE6u) {
      char v10 = *a2 + 32;
    }
    if (a3 >= 4 && v10 == 55 && !_citrus_bcs_strncasecmp(a2, "7bit", 4))
    {
      _DWORD *i = 2139062143;
      a2 += 4;
      a3 -= 4;
    }
    ++a2;
  }
  if (!*i) {
    _DWORD *i = -1;
  }
  uint64_t result = 0;
  *(void *)(a1 + 8) = i;
  *(void *)(a4 + 16) = 1;
  *(_OWORD *)a4 = xmmword_20D93FE00;
  return result;
}

void _citrus_NONE_stdenc_uninit(uint64_t a1)
{
}

uint64_t _citrus_NONE_stdenc_mbtocs(uint64_t a1, _DWORD *a2, _DWORD *a3, void *a4, uint64_t a5, uint64_t a6, BOOL *a7, void (**a8)(void))
{
  if (a5)
  {
    *a2 = 0;
    BOOL v8 = (unsigned char *)(*a4)++;
    int v9 = *v8;
    BOOL v10 = *v8 != 0;
    *a3 = v9;
    *a7 = v10;
    if (a8 && *a8) {
      (*a8)();
    }
  }
  else
  {
    *a7 = -2;
  }
  return 0;
}

uint64_t _citrus_NONE_stdenc_cstomb(uint64_t a1, uint64_t a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  if (a4 != -1)
  {
    if (a4 || (a5 & ~**(_DWORD **)(a1 + 8)) != 0) {
      return 92;
    }
    if (a5 > 0xFF)
    {
      if (HIWORD(a5))
      {
        if (HIBYTE(a5))
        {
          if (a3 >= 4)
          {
            uint64_t result = 0;
            *(_DWORD *)a2 = a5;
            uint64_t v8 = 4;
            goto LABEL_6;
          }
        }
        else if (a3 >= 3)
        {
          uint64_t result = 0;
          *(_WORD *)a2 = a5;
          *(unsigned char *)(a2 + 2) = BYTE2(a5);
          uint64_t v8 = 3;
          goto LABEL_6;
        }
      }
      else if (a3 >= 2)
      {
        uint64_t result = 0;
        *(_WORD *)a2 = a5;
        uint64_t v8 = 2;
        goto LABEL_6;
      }
    }
    else if (a3)
    {
      uint64_t result = 0;
      *(unsigned char *)a2 = a5;
      uint64_t v8 = 1;
      goto LABEL_6;
    }
    uint64_t result = 7;
    uint64_t v8 = -1;
    goto LABEL_6;
  }
  uint64_t v8 = 0;
  uint64_t result = 0;
LABEL_6:
  *a7 = v8;
  return result;
}

uint64_t _citrus_NONE_stdenc_mbtowc(uint64_t a1, _DWORD *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  if (*a3)
  {
    if (a4)
    {
      int v7 = *(unsigned __int8 *)*a3;
      if (a2) {
        *a2 = v7;
      }
      *a6 = v7 != 0;
      if (a7)
      {
        uint64_t v8 = *(void (**)(void, void))(a7 + 8);
        if (v8) {
          v8(*a2, *(void *)(a7 + 16));
        }
      }
    }
    else
    {
      *a6 = -2;
    }
  }
  else
  {
    *a6 = 0;
  }
  return 0;
}

uint64_t _citrus_NONE_stdenc_wctomb(uint64_t a1, unsigned char *a2, uint64_t a3, unsigned int a4, uint64_t a5, void *a6)
{
  if (a4 >= 0x100)
  {
    *a6 = -1;
    return 92;
  }
  else if (a3)
  {
    *a6 = 1;
    uint64_t result = 0;
    if (a2) {
      *a2 = a4;
    }
  }
  else
  {
    *a6 = -1;
    return 7;
  }
  return result;
}

uint64_t _citrus_NONE_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_NONE_stdenc_get_state_desc(uint64_t a1, uint64_t a2, int a3, _DWORD *a4)
{
  if (a3) {
    return 102;
  }
  uint64_t result = 0;
  *a4 = 1;
  return result;
}

uint64_t _citrus_pivot_factory_convert()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  unint64_t v2 = v1;
  uint64_t v3 = (FILE *)v0;
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v33 = 0;
  size_t v34 = 0;
  size_t __n = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  while (1)
  {
    int v4 = fgetln(v2, &__n);
    if (!v4) {
      break;
    }
    unint64_t v5 = (unsigned __int8 *)v4;
    size_t v38 = __n;
    unint64_t v6 = memchr(v4, 35, __n);
    if (v6) {
      size_t v38 = v6 - v5;
    }
    int v7 = _citrus_bcs_skip_ws_len(v5, (uint64_t *)&v38);
    if (v38)
    {
      uint64_t v8 = (const char *)v7;
      int v9 = _citrus_bcs_skip_nonws_len(v7, (uint64_t *)&v38);
      if (v9 != (unsigned __int8 *)v8)
      {
        BOOL v10 = v9;
        snprintf((char *)&v41, 0x800uLL, "%.*s", v9 - v8, v8);
        size_t v11 = _citrus_bcs_skip_ws_len(v10, (uint64_t *)&v38);
        if (v38)
        {
          uint64_t v12 = (const char *)v11;
          uint64_t v13 = _citrus_bcs_skip_nonws_len(v11, (uint64_t *)&v38);
          if (v13 != (unsigned __int8 *)v12)
          {
            uint64_t v14 = v13;
            __endptr = 0;
            snprintf(__str, 0x800uLL, "%.*s", v13 - v12, v12);
            uint64_t v15 = _citrus_bcs_skip_ws_len(v14, (uint64_t *)&v38);
            _citrus_bcs_trunc_rws_len((uint64_t)v15, &v38);
            snprintf(v39, 0x800uLL, "%.*s", v38, (const char *)v15);
            unsigned int v16 = strtoul(v39, &__endptr, 0);
            if (*__endptr)
            {
              uint64_t v22 = 79;
              goto LABEL_35;
            }
            unsigned int v17 = v16;
            uint64_t v18 = v35;
            if (v35)
            {
              while (_citrus_bcs_strcasecmp(*(unsigned __int8 **)v18, (unsigned __int8 *)&v41))
              {
                uint64_t v18 = *(void *)(v18 + 16);
                if (!v18) {
                  goto LABEL_13;
                }
              }
            }
            else
            {
LABEL_13:
              uint64_t v19 = malloc_type_malloc(0x18uLL, 0x30040D3A788E3uLL);
              if (!v19)
              {
                uint64_t v22 = *__error();
                goto LABEL_35;
              }
              uint64_t v18 = (uint64_t)v19;
              uint64_t v20 = strdup((const char *)&v41);
              *(void *)uint64_t v18 = v20;
              if (!v20)
              {
                uint64_t v22 = *__error();
                goto LABEL_34;
              }
              uint64_t v21 = _citrus_db_factory_create((void *)(v18 + 8), (uint64_t)_citrus_db_hash_std, 0);
              if (v21)
              {
                uint64_t v22 = v21;
                free(*(void **)v18);
LABEL_34:
                free((void *)v18);
LABEL_35:
                free_src(&v35);
                return v22;
              }
              *(void *)(v18 + 16) = 0;
              uint64_t *v36 = v18;
              v36 = (uint64_t *)(v18 + 16);
            }
            uint64_t v22 = _citrus_db_factory_add32_by_string(*(void *)(v18 + 8), __str, v17);
            if (v22) {
              goto LABEL_35;
            }
          }
        }
      }
    }
  }
  *(void *)__str = 0;
  size_t v42 = 0;
  v41 = 0;
  uint64_t v23 = _citrus_db_factory_create(__str, (uint64_t)_citrus_db_hash_std, 0);
  if (v23)
  {
    uint64_t v22 = v23;
    goto LABEL_35;
  }
  uint64_t v24 = v35;
  if (v35)
  {
    while (1)
    {
      size_t v25 = _citrus_db_factory_calc_size(*(void **)(v24 + 8));
      uint64_t v26 = malloc_type_malloc(v25, 0xECAF80FCuLL);
      int v27 = v26;
      if (!v26) {
        break;
      }
      v41 = v26;
      size_t v42 = v25;
      uint64_t v28 = _citrus_db_factory_serialize(*(size_t **)(v24 + 8), (uint64_t)"CSPIVSUB", (uint64_t)&v41);
      if (v28
        || (uint64_t v28 = _citrus_db_factory_add_by_string(*(uint64_t *)__str, *(char **)v24, (uint64_t)&v41, 1), v28))
      {
        uint64_t v22 = v28;
        goto LABEL_39;
      }
      uint64_t v24 = *(void *)(v24 + 16);
      if (!v24) {
        goto LABEL_27;
      }
    }
  }
  else
  {
LABEL_27:
    size_t v29 = _citrus_db_factory_calc_size(*(void **)__str);
    uint64_t v30 = malloc_type_malloc(v29, 0x8B0617E8uLL);
    if (v30)
    {
      uint64_t v33 = v30;
      size_t v34 = v29;
      uint64_t v22 = _citrus_db_factory_serialize(*(size_t **)__str, (uint64_t)"CSPIVOT", (uint64_t)&v33);
      int v27 = 0;
      goto LABEL_39;
    }
    int v27 = 0;
  }
  uint64_t v22 = 0;
LABEL_39:
  free(v27);
  _citrus_db_factory_free(*(void ****)__str);
  free_src(&v35);
  if (!v22)
  {
    if (fwrite(v33, v34, 1uLL, v3) == 1) {
      return 0;
    }
    else {
      return *__error();
    }
  }
  return v22;
}

void free_src(uint64_t *a1)
{
  for (uint64_t i = *a1; *a1; uint64_t i = *a1)
  {
    uint64_t v3 = *(void *)(i + 16);
    *a1 = v3;
    if (!v3) {
      a1[1] = (uint64_t)a1;
    }
    _citrus_db_factory_free(*(void ****)(i + 8));
    free(*(void **)i);
    free((void *)i);
  }
}

uint64_t _citrus_prop_parse_variable(unsigned __int8 **a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v25 = a3;
  unint64_t v26 = a4;
  unint64_t v27 = 0;
  _citrus_memory_stream_skip_ws(&v25);
  unint64_t v7 = v26;
  unint64_t v6 = v27;
  if (v27 >= v26) {
    return 0;
  }
  do
  {
    unint64_t v27 = v6 + 1;
    uint64_t v8 = v25;
    if (!*(unsigned char *)(v25 + v6)) {
      return 0;
    }
    uint64_t v9 = 0;
    unint64_t v27 = v6;
    uint64_t v28 = 0;
    uint64_t v30 = 0;
    unint64_t v31 = 0;
    size_t v29 = 0;
    do
    {
      if (v6 >= v7)
      {
        int v10 = -1;
      }
      else
      {
        unint64_t v27 = v6 + 1;
        int v10 = *(unsigned __int8 *)(v8 + v6++);
        if (v10 == 95) {
          goto LABEL_13;
        }
      }
      if (v10 - 58 <= 0xFFFFFFF5 && (v10 & 0xDFu) - 91 < 0xFFFFFFE6) {
        goto LABEL_21;
      }
LABEL_13:
      v32[v9++] = v10;
    }
    while (v9 != 256);
    if (v6 < v7)
    {
      unint64_t v27 = v6 + 1;
      int v10 = *(unsigned __int8 *)(v8 + v6);
      if (v10 != 95)
      {
        ++v6;
        goto LABEL_18;
      }
      return 22;
    }
    int v10 = -1;
LABEL_18:
    uint64_t v12 = 22;
    if (v10 - 58 > 0xFFFFFFF5 || (v10 & 0xDFu) - 91 > 0xFFFFFFE5) {
      return v12;
    }
    uint64_t v9 = 256;
LABEL_21:
    if (v10 != -1 && v6) {
      unint64_t v27 = v6 - 1;
    }
    v32[v9] = 0;
    uint64_t v13 = *a1;
    if (!*a1) {
      return 22;
    }
    uint64_t v14 = a1 + 2;
    while (_citrus_bcs_strcasecmp(v32, v13))
    {
      uint64_t v13 = v14[1];
      v14 += 3;
      if (!v13) {
        return 22;
      }
    }
    _citrus_memory_stream_skip_ws(&v25);
    unint64_t v15 = v27;
    if (v27 < v26)
    {
      ++v27;
      int v16 = *(unsigned __int8 *)(v25 + v15);
      if (v16 != 58 && v16 != 61) {
        unint64_t v27 = v15;
      }
    }
    uint64_t v17 = *((unsigned int *)v14 - 2);
    uint64_t v18 = (uint64_t (*)(uint64_t *, uint64_t *))*(&readers + v17);
    while (2)
    {
      LODWORD(v30) = v17;
      unint64_t v31 = 0;
      LODWORD(v28) = v17;
      size_t v29 = 0;
      uint64_t v19 = v18(&v25, &v30);
      if (v19) {
        return v19;
      }
      _citrus_memory_stream_skip_ws(&v25);
      unint64_t v20 = v27;
      if (v27 >= v26) {
        goto LABEL_41;
      }
      ++v27;
      int v21 = *(unsigned __int8 *)(v25 + v20);
      if (v17 >= 2 && v21 == 45)
      {
        uint64_t v19 = v18(&v25, &v28);
        if (v19) {
          return v19;
        }
        _citrus_memory_stream_skip_ws(&v25);
        unint64_t v22 = v27;
        if (v27 < v26)
        {
          ++v27;
          int v21 = *(unsigned __int8 *)(v25 + v22);
          goto LABEL_42;
        }
LABEL_41:
        int v21 = -1;
      }
LABEL_42:
      switch((int)v17)
      {
        case 0:
          uint64_t v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void))*v14)(a2, v13, v31);
          break;
        case 1:
          uint64_t v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void *))*v14)(a2, v13, v31);
          break;
        case 2:
          uint64_t v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void, void))*v14)(a2, v13, v31, v29);
          break;
        case 3:
          uint64_t v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void *, void *))*v14)(a2, v13, v31, v29);
          break;
        default:
          abort();
      }
      uint64_t v12 = v23;
      if (v30 == 1) {
        free(v31);
      }
      if (v28 == 1) {
        free(v29);
      }
      if (v12) {
        return v12;
      }
      if (v21 == 44) {
        continue;
      }
      break;
    }
    if (v21 != -1 && v21 != 59 && v27) {
      --v27;
    }
    _citrus_memory_stream_skip_ws(&v25);
    uint64_t v12 = 0;
    unint64_t v7 = v26;
    unint64_t v6 = v27;
  }
  while (v27 < v26);
  return v12;
}

uint64_t _citrus_prop_read_BOOL(uint64_t *a1, uint64_t a2)
{
  _citrus_memory_stream_skip_ws(a1);
  unint64_t v5 = a1[1];
  unint64_t v4 = a1[2];
  if (v4 >= v5)
  {
    char v6 = -1;
  }
  else
  {
    a1[2] = v4 + 1;
    char v6 = *(unsigned char *)(*a1 + v4++);
  }
  if ((v6 - 91) >= 0xE6u) {
    v6 += 32;
  }
  if (v6 == 102)
  {
    if (v4 >= v5)
    {
      char v8 = -1;
    }
    else
    {
      a1[2] = v4 + 1;
      char v8 = *(unsigned char *)(*a1 + v4++);
    }
    if ((v8 - 91) >= 0xE6u) {
      v8 += 32;
    }
    if (v8 == 97)
    {
      if (v4 >= v5)
      {
        char v10 = -1;
      }
      else
      {
        a1[2] = v4 + 1;
        char v10 = *(unsigned char *)(*a1 + v4++);
      }
      if ((v10 - 91) >= 0xE6u) {
        v10 += 32;
      }
      if (v10 == 108)
      {
        if (v4 >= v5)
        {
          char v12 = -1;
        }
        else
        {
          a1[2] = v4 + 1;
          char v12 = *(unsigned char *)(*a1 + v4++);
        }
        if ((v12 - 91) >= 0xE6u) {
          v12 += 32;
        }
        if (v12 == 115)
        {
          if (v4 >= v5)
          {
            char v14 = -1;
          }
          else
          {
            a1[2] = v4 + 1;
            char v14 = *(unsigned char *)(*a1 + v4);
          }
          if ((v14 - 91) >= 0xE6u) {
            v14 += 32;
          }
          if (v14 == 101)
          {
            char v13 = 0;
            goto LABEL_52;
          }
        }
      }
    }
  }
  else if (v6 == 116)
  {
    if (v4 >= v5)
    {
      char v7 = -1;
    }
    else
    {
      a1[2] = v4 + 1;
      char v7 = *(unsigned char *)(*a1 + v4++);
    }
    if ((v7 - 91) >= 0xE6u) {
      v7 += 32;
    }
    if (v7 == 114)
    {
      if (v4 >= v5)
      {
        char v9 = -1;
      }
      else
      {
        a1[2] = v4 + 1;
        char v9 = *(unsigned char *)(*a1 + v4++);
      }
      if ((v9 - 91) >= 0xE6u) {
        v9 += 32;
      }
      if (v9 == 117)
      {
        if (v4 >= v5)
        {
          char v11 = -1;
        }
        else
        {
          a1[2] = v4 + 1;
          char v11 = *(unsigned char *)(*a1 + v4);
        }
        if ((v11 - 91) >= 0xE6u) {
          v11 += 32;
        }
        if (v11 == 101)
        {
          char v13 = 1;
LABEL_52:
          uint64_t result = 0;
          *(unsigned char *)(a2 + 8) = v13;
          return result;
        }
      }
    }
  }
  return 22;
}

uint64_t _citrus_prop_read_str(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = malloc_type_malloc(0x200uLL, 0x9CC340E3uLL);
  if (!v4) {
    return 12;
  }
  unint64_t v5 = v4;
  _citrus_memory_stream_skip_ws(a1);
  unint64_t v6 = a1[2];
  if (v6 >= a1[1])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    a1[2] = v6 + 1;
    int v8 = *(unsigned __int8 *)(*a1 + v6);
    uint64_t v9 = 512;
    if (v8 != 34 && v8 != 39)
    {
      if (v8 == 92)
      {
        uint64_t v7 = 0;
        a1[2] = v6;
        int v8 = -1;
        uint64_t v9 = 512;
      }
      else
      {
        *unint64_t v5 = v8;
        int v8 = -1;
        uint64_t v7 = 1;
        uint64_t v9 = 511;
      }
    }
    while (1)
    {
      unint64_t v11 = a1[2];
      if (v11 >= a1[1])
      {
        int v12 = -1;
      }
      else
      {
        a1[2] = v11 + 1;
        int v12 = *(unsigned __int8 *)(*a1 + v11++);
      }
      int v14 = v12;
      if (v8 == v12 || v8 == -1 && (v12 == 59 || v12 <= 0x20u && ((1 << v12) & 0x100003E00) != 0)) {
        break;
      }
      if (v12 != -1)
      {
        if (v11) {
          a1[2] = v11 - 1;
        }
      }
      _citrus_prop_read_character_common(a1, &v14);
      v5[v7++] = v14;
      if (!--v9)
      {
        char v10 = malloc_type_realloc(v5, v7 + 512, 0xCDD31E71uLL);
        if (!v10)
        {
          free(v5);
          return 12;
        }
        unint64_t v5 = v10;
        uint64_t v9 = 512;
      }
    }
  }
  uint64_t result = 0;
  v5[v7] = 0;
  *(void *)(a2 + 8) = v5;
  return result;
}

uint64_t _citrus_prop_read_character(uint64_t *a1, uint64_t a2)
{
  _citrus_memory_stream_skip_ws(a1);
  unint64_t v4 = a1[2];
  if (v4 < a1[1])
  {
    a1[2] = v4 + 1;
    int v18 = *(unsigned __int8 *)(*a1 + v4);
    if (v18 == 39)
    {
      _citrus_prop_read_character_common(a1, &v18);
      *(_DWORD *)(a2 + 8) = v18;
      unint64_t v5 = a1[2];
      uint64_t result = 22;
      if (v5 < a1[1])
      {
        a1[2] = v5 + 1;
        if (*(unsigned char *)(*a1 + v5) == 39) {
          return 0;
        }
        else {
          return 22;
        }
      }
      return result;
    }
    a1[2] = v4;
  }
  _citrus_memory_stream_skip_ws(a1);
  unint64_t v7 = a1[1];
  unint64_t v8 = a1[2];
  if (v8 >= v7) {
    return 22;
  }
  int v9 = 0;
  unint64_t v10 = v8 + 1;
  a1[2] = v8 + 1;
  uint64_t v11 = *a1;
  int v12 = *(unsigned __int8 *)(*a1 + v8);
  if (v12 != 43)
  {
    if (v12 != 45) {
      goto LABEL_14;
    }
    int v9 = 1;
  }
  if (v10 >= v7) {
    return 22;
  }
  uint64_t v13 = v8 + 2;
  a1[2] = v13;
  int v12 = *(unsigned __int8 *)(v11 + v10);
  unint64_t v10 = v13;
LABEL_14:
  if (v12 != 48)
  {
    if ((v12 - 58) >= 0xFFFFFFF6)
    {
      unsigned int v17 = 10;
      unint64_t v14 = v10;
LABEL_31:
      a1[2] = v14 - 1;
      goto LABEL_32;
    }
    return 22;
  }
  if (v10 >= v7)
  {
    unsigned int v17 = 8;
    goto LABEL_32;
  }
  unint64_t v14 = v10 + 1;
  a1[2] = v10 + 1;
  if ((*(unsigned char *)(v11 + v10) & 0xDF) != 0x58)
  {
    unsigned int v17 = 8;
    goto LABEL_31;
  }
  if (v14 >= v7)
  {
    int v16 = -1;
  }
  else
  {
    unint64_t v15 = v10 + 2;
    a1[2] = v10 + 2;
    int v16 = *(unsigned __int8 *)(v11 + v14);
    unint64_t v14 = v15;
  }
  if (v16 - 58 > 0xFFFFFFF5 || (v16 & 0xDFu) - 71 > 0xFFFFFFF9)
  {
    unsigned int v17 = 16;
    if (v16 != -1) {
      goto LABEL_31;
    }
LABEL_32:
    _citrus_prop_read_chr_common(a1, (int *)(a2 + 8), v17, v9);
    return 0;
  }
  if (v16 != -1) {
    a1[2] = v14 - 1;
  }
  uint64_t result = 0;
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t _citrus_prop_read_num(uint64_t *a1, uint64_t a2)
{
  _citrus_memory_stream_skip_ws(a1);
  unint64_t v5 = a1[1];
  unint64_t v4 = a1[2];
  if (v4 >= v5) {
    return 22;
  }
  int v6 = 0;
  unint64_t v7 = v4 + 1;
  a1[2] = v4 + 1;
  uint64_t v8 = *a1;
  int v9 = *(unsigned __int8 *)(*a1 + v4);
  if (v9 != 43)
  {
    if (v9 != 45) {
      goto LABEL_7;
    }
    int v6 = 1;
  }
  if (v7 >= v5) {
    return 22;
  }
  uint64_t v10 = v4 + 2;
  a1[2] = v10;
  int v9 = *(unsigned __int8 *)(v8 + v7);
  unint64_t v7 = v10;
LABEL_7:
  if (v9 != 48)
  {
    if ((v9 - 58) >= 0xFFFFFFF6)
    {
      int v25 = v6;
      uint64_t v26 = a2;
      unsigned int v14 = 10;
LABEL_24:
      a1[2] = --v7;
      goto LABEL_25;
    }
    return 22;
  }
  uint64_t v26 = a2;
  int v25 = v6;
  if (v7 >= v5)
  {
    unsigned int v14 = 8;
    goto LABEL_25;
  }
  unint64_t v11 = v7 + 1;
  a1[2] = v7 + 1;
  if ((*(unsigned char *)(v8 + v7) & 0xDF) != 0x58)
  {
    unsigned int v14 = 8;
    ++v7;
    goto LABEL_24;
  }
  if (v11 >= v5)
  {
    int v12 = -1;
    ++v7;
  }
  else
  {
    v7 += 2;
    a1[2] = v7;
    int v12 = *(unsigned __int8 *)(v8 + v11);
  }
  if (v12 - 58 <= 0xFFFFFFF5 && (v12 & 0xDFu) - 71 <= 0xFFFFFFF9)
  {
    if (v12 != -1) {
      a1[2] = v7 - 1;
    }
    uint64_t result = 0;
    *(void *)(a2 + 8) = 0;
    return result;
  }
  unsigned int v14 = 16;
  if (v12 != -1) {
    goto LABEL_24;
  }
LABEL_25:
  unint64_t v15 = 0;
  uint64_t v16 = v14;
  unint64_t v17 = 0xFFFFFFFFFFFFFFFFLL / v14;
  int v18 = ~(v17 * v14);
  while (1)
  {
    if (v7 >= v5)
    {
      int v19 = -1;
    }
    else
    {
      int v19 = *(unsigned __int8 *)(v8 + v7++);
      a1[2] = v7;
    }
    unsigned __int8 v20 = v19 - 123 >= 0xFFFFFFE6 ? v19 - 32 : v19;
    int v21 = memchr("0123456789ABCDEF", v20, 0x11uLL);
    if (!v21) {
      break;
    }
    int v22 = v21 - "0123456789ABCDEF";
    if (v22 >= (int)v16 || v15 > v17) {
      break;
    }
    if (v15 == v17 && v22 > v18)
    {
      unint64_t v15 = v17;
      break;
    }
    unint64_t v15 = v15 * v16 + v22;
  }
  if (v19 != -1 && v7) {
    a1[2] = v7 - 1;
  }
  uint64_t result = 0;
  if (v25) {
    unint64_t v24 = -(uint64_t)v15;
  }
  else {
    unint64_t v24 = v15;
  }
  *(void *)(v26 + 8) = v24;
  return result;
}

uint64_t *_citrus_prop_read_character_common(uint64_t *result, int *a2)
{
  unint64_t v3 = result[1];
  unint64_t v2 = result[2];
  if (v2 >= v3)
  {
    int v6 = -1;
    goto LABEL_9;
  }
  unint64_t v4 = v2 + 1;
  result[2] = v2 + 1;
  uint64_t v5 = *result;
  int v6 = *(unsigned __int8 *)(*result + v2);
  if (v6 != 92)
  {
LABEL_9:
    *a2 = v6;
    return result;
  }
  if (v4 >= v3)
  {
    unsigned int v7 = -1;
LABEL_11:
    *a2 = v7;
    return result;
  }
  result[2] = v2 + 2;
  unsigned int v7 = *(unsigned __int8 *)(v5 + v4);
  if (v7 > 0x61)
  {
    unsigned int v8 = 16;
    switch(*(unsigned char *)(v5 + v4))
    {
      case 'n':
        unsigned int v7 = 10;
        goto LABEL_11;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
      case 'w':
        goto LABEL_11;
      case 'r':
        unsigned int v7 = 13;
        goto LABEL_11;
      case 't':
        unsigned int v7 = 9;
        goto LABEL_11;
      case 'v':
        unsigned int v7 = 11;
        goto LABEL_11;
      case 'x':
        return (uint64_t *)_citrus_prop_read_chr_common(result, a2, v8, 0);
      default:
        if (v7 == 98)
        {
          unsigned int v7 = 8;
        }
        else if (v7 == 102)
        {
          unsigned int v7 = 12;
        }
        goto LABEL_11;
    }
  }
  if (v7 - 48 >= 8)
  {
    if (v7 == 97) {
      unsigned int v7 = 7;
    }
    goto LABEL_11;
  }
  result[2] = v4;
  unsigned int v8 = 8;
  return (uint64_t *)_citrus_prop_read_chr_common(result, a2, v8, 0);
}

void *_citrus_prop_read_chr_common(void *a1, int *a2, unsigned int a3, int a4)
{
  signed int v7 = 0;
  signed int v8 = 0xFF / a3;
  signed int v9 = 0xFF % a3;
  unint64_t v11 = a1[1];
  unint64_t v10 = a1[2];
  while (1)
  {
    if (v10 >= v11)
    {
      int v12 = -1;
    }
    else
    {
      int v12 = *(unsigned __int8 *)(*a1 + v10++);
      a1[2] = v10;
    }
    unsigned __int8 v13 = v12 - 123 >= 0xFFFFFFE6 ? v12 - 32 : v12;
    uint64_t result = memchr("0123456789ABCDEF", v13, 0x11uLL);
    if (!result) {
      break;
    }
    signed int v15 = result - "0123456789ABCDEF";
    if (v15 >= (int)a3 || v7 > v8) {
      break;
    }
    if (v7 == v8 && v15 > v9)
    {
      signed int v7 = v8;
      break;
    }
    signed int v7 = v15 + v7 * a3;
  }
  if (v12 != -1 && v10) {
    a1[2] = v10 - 1;
  }
  if (a4) {
    int v17 = -v7;
  }
  else {
    int v17 = v7;
  }
  *a2 = v17;
  return result;
}

void _citrus_stdenc_close(long long *a1)
{
  if (a1 != &_citrus_stdenc_default)
  {
    uint64_t v2 = *((void *)a1 + 2);
    unint64_t v3 = *(void **)a1;
    if (v2)
    {
      if (v3)
      {
        if (*((void *)a1 + 1))
        {
          unint64_t v4 = (void (*)(long long *))v3[1];
          if (v4)
          {
            v4(a1);
            unint64_t v3 = *(void **)a1;
          }
        }
        free(v3);
      }
      free(*((void **)a1 + 3));
      _citrus_unload_module(*((void **)a1 + 2));
    }
    else
    {
      uint64_t v5 = *((void *)a1 + 1);
      if (v3)
      {
        if (v5)
        {
          int v6 = (void (*)(long long *))v3[1];
          if (v6) {
            v6(a1);
          }
        }
        free(*((void **)a1 + 3));
      }
      else if (v5)
      {
        _citrus_stdenc_close_cold_1();
      }
    }
    free(a1);
  }
}

void _citrus_db_factory_serialize_cold_1()
{
  __assert_rtn("dump_header", "citrus_db_factory.c", 270, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_2()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 339, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_3()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 340, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_4()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 341, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_5()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 342, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_6()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 338, "_v <= UINT_MAX");
}

void _citrus_mapper_open_cold_1()
{
  __assert_rtn("_citrus_mapper_open", "citrus_mapper.c", 428, "cm->cm_dir == 0 || powerof2(cm->cm_dir)");
}

void _citrus_unload_module_cold_1()
{
  __assert_rtn("_citrus_unload_module", "citrus_module.c", 390, "handle != RTLD_SELF");
}

void _citrus_stdenc_close_cold_1()
{
  __assert_rtn("_citrus_stdenc_close", "citrus_stdenc.c", 180, "ce->ce_closure == NULL");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void abort(void)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x270ED9958](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int issetugid(void)
{
  return MEMORY[0x270ED9F18]();
}

const char *locale_charset(void)
{
  return (const char *)MEMORY[0x270F98F40]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x270EDA730](*(void *)&a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x270EDB598](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x270EDB650](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}