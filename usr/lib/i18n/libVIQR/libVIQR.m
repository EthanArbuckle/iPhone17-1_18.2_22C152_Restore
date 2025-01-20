uint64_t _citrus_VIQR_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unsigned __int8 *v13;
  size_t v14;
  int v15;
  _DWORD *v16;
  void *v17;
  int v18;
  unsigned __int8 *v19;
  int v20;
  _DWORD *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;

  v6 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040A122CEF7uLL);
  if (!v6) {
    return *__error();
  }
  v7 = v6;
  v6[2] = 1;
  *((_DWORD *)v6 + 2) = -1;
  v8 = malloc_type_malloc(0x30uLL, 0x10A004016FBAF26uLL);
  if (!v8)
  {
    v24 = 12;
    goto LABEL_29;
  }
  v9 = v8;
  v27 = a1;
  v28 = a4;
  v10 = 0;
  v8[5] = 0xFFFFFFFFLL;
  v8[3] = 0;
  v11 = v8 + 3;
  v8[2] = 0;
  v8[4] = v8 + 3;
  *v7 = v8;
  v12 = 1;
  while (1)
  {
    v13 = (unsigned __int8 *)*((void *)&mnemonic_rfc1456 + v10);
    if (v13) {
      break;
    }
LABEL_23:
    if (++v10 == 256)
    {
      v24 = 0;
      *(void *)(v27 + 8) = v7;
      v25 = v7[2];
      *v28 = 12;
      v28[1] = v25;
      v28[2] = 1;
      return v24;
    }
  }
  v14 = strlen(*((const char **)&mnemonic_rfc1456 + v10));
  if (v12 < v14)
  {
    v7[2] = v14;
    v12 = v14;
  }
  v15 = *v13;
  if (*v13)
  {
    v16 = v11;
    while (1)
    {
      v16 = *(_DWORD **)v16;
      if (!v16) {
        break;
      }
      if (v16[11] == v15) {
        goto LABEL_14;
      }
    }
    v16 = malloc_type_malloc(0x30uLL, 0x10A004016FBAF26uLL);
    if (!v16)
    {
LABEL_26:
      v24 = 12;
      goto LABEL_27;
    }
    *((void *)v16 + 2) = v9;
    v16[10] = v15;
    v16[11] = v15;
    *((void *)v16 + 3) = 0;
    *((void *)v16 + 4) = v16 + 6;
    v17 = (void *)v9[4];
    *(void *)v16 = 0;
    *((void *)v16 + 1) = v17;
    *v17 = v16;
    v9[4] = v16;
LABEL_14:
    v20 = v13[1];
    v19 = v13 + 1;
    v18 = v20;
    if (!v20) {
      goto LABEL_31;
    }
    do
    {
      v21 = v16;
      v16 += 6;
      while (1)
      {
        v16 = *(_DWORD **)v16;
        if (!v16) {
          break;
        }
        if (v16[11] == v18) {
          goto LABEL_21;
        }
      }
      v16 = malloc_type_malloc(0x30uLL, 0x10A004016FBAF26uLL);
      if (!v16) {
        goto LABEL_26;
      }
      *((void *)v16 + 2) = v21;
      v16[10] = -1;
      v16[11] = v18;
      *((void *)v16 + 3) = 0;
      *((void *)v16 + 4) = v16 + 6;
      v22 = (void *)*((void *)v21 + 4);
      *(void *)v16 = 0;
      *((void *)v16 + 1) = v22;
      *v22 = v16;
      *((void *)v21 + 4) = v16;
LABEL_21:
      v23 = *++v19;
      v18 = v23;
    }
    while (v23);
    v16[10] = v10;
    goto LABEL_23;
  }
LABEL_31:
  v24 = 22;
LABEL_27:
  mnemonic_destroy(v9);
LABEL_29:
  free(v7);
  return v24;
}

void _citrus_VIQR_stdenc_uninit(uint64_t a1)
{
  if (a1)
  {
    v1 = *(void ***)(a1 + 8);
    mnemonic_destroy(*v1);
    free(v1);
  }
}

uint64_t _citrus_VIQR_stdenc_mbtocs(uint64_t a1, _DWORD *a2, int *a3, unsigned __int8 **a4, uint64_t a5, int *a6, uint64_t *a7, uint64_t a8)
{
  int v15 = 0;
  uint64_t v12 = _citrus_VIQR_mbrtowc_priv(*(uint64_t **)(a1 + 8), &v15, a4, a5, a6, a7);
  if (!v12)
  {
    if (*a7 != -2)
    {
      int v13 = v15;
      *a2 = 0;
      *a3 = v13;
    }
    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }
  return v12;
}

uint64_t _citrus_VIQR_stdenc_cstomb(uint64_t a1, void *a2, uint64_t a3, int a4, unsigned int a5, char *__src, size_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }
  else if (a4)
  {
    return 92;
  }
  return _citrus_VIQR_wcrtomb_priv(*(uint64_t ***)(a1 + 8), a2, a3, a5, __src, a7);
}

uint64_t _citrus_VIQR_stdenc_mbtowc(uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_VIQR_mbrtowc_priv(*(uint64_t **)(a1 + 8), a2, a3, a4, a5, a6);
  uint64_t v10 = v9;
  if (a7)
  {
    if (!v9)
    {
      v11 = *(void (**)(void, void))(a7 + 8);
      if (v11) {
        v11(*a2, *(void *)(a7 + 16));
      }
    }
  }
  return v10;
}

uint64_t _citrus_VIQR_stdenc_wctomb(uint64_t a1, void *a2, uint64_t a3, unsigned int a4, char *a5, size_t *a6)
{
  return _citrus_VIQR_wcrtomb_priv(*(uint64_t ***)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t _citrus_VIQR_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, void *a5)
{
  if (*a4 > 1u) {
    return 22;
  }
  uint64_t result = 0;
  *a5 = 0;
  *a4 = 0;
  return result;
}

uint64_t _citrus_VIQR_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
{
  if (a3) {
    return 102;
  }
  uint64_t result = 0;
  if (*a2) {
    int v5 = 3;
  }
  else {
    int v5 = 1;
  }
  *a4 = v5;
  return result;
}

uint64_t _citrus_VIQR_stdenc_getops(uint64_t a1)
{
  long long v1 = *(_OWORD *)algn_26BD2F128;
  *(_OWORD *)a1 = _citrus_VIQR_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  long long v2 = xmmword_26BD2F138;
  long long v3 = *(_OWORD *)&off_26BD2F148;
  long long v4 = xmmword_26BD2F158;
  *(void *)(a1 + 80) = qword_26BD2F168;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

void mnemonic_destroy(void *a1)
{
  long long v2 = (void *)a1[3];
  if (v2)
  {
    do
    {
      long long v3 = (void *)*v2;
      mnemonic_destroy();
      long long v2 = v3;
    }
    while (v3);
  }

  free(a1);
}

uint64_t _citrus_VIQR_mbrtowc_priv(uint64_t *a1, int *a2, unsigned __int8 **a3, uint64_t a4, int *a5, uint64_t *a6)
{
  v7 = *a3;
  if (*a3)
  {
    uint64_t v10 = 0;
    v11 = (uint64_t *)*a1;
    uint64_t v12 = (uint64_t *)*a1;
    int v13 = *a3;
LABEL_3:
    char v14 = 1;
    while (1)
    {
      uint64_t v15 = v10;
      uint64_t v16 = *a5;
      if (v15 == v16)
      {
        if (!a4)
        {
          uint64_t result = 0;
          *a3 = v13;
          uint64_t v21 = -2;
          goto LABEL_19;
        }
        if (v16 == 6)
        {
          *a6 = -1;
          return 92;
        }
        --a4;
        int v18 = *v13++;
        int v17 = v18;
        *a5 = v16 + 1;
        *((unsigned char *)a5 + v15 + 4) = v18;
      }
      else
      {
        int v17 = *((unsigned __int8 *)a5 + v15 + 4);
      }
      if (v17 != 92) {
        break;
      }
      char v14 = 0;
      uint64_t v10 = v15 + 1;
      if (v12 != v11)
      {
        int v22 = 92;
        goto LABEL_22;
      }
    }
    if (v14)
    {
      uint64_t v10 = v15 + 1;
      v19 = v12 + 3;
      while (1)
      {
        v19 = (uint64_t *)*v19;
        if (!v19) {
          break;
        }
        if (*((_DWORD *)v19 + 11) == v17)
        {
          uint64_t v12 = v19;
          goto LABEL_3;
        }
      }
    }
    int v22 = v17;
LABEL_22:
    if (v12 == v11)
    {
      BOOL v26 = 0;
      uint64_t v24 = v15 + 1;
    }
    else
    {
      int v23 = *((_DWORD *)a1 + 2);
      while (1)
      {
        uint64_t v24 = v15;
        int v25 = *((_DWORD *)v12 + 10);
        BOOL v26 = v25 != v23;
        if (v25 != v23) {
          break;
        }
        uint64_t v12 = (uint64_t *)v12[2];
        uint64_t v15 = v24 - 1;
        if (v12 == v11) {
          goto LABEL_29;
        }
      }
      v11 = v12;
    }
LABEL_29:
    BOOL v27 = v17 == 92 && v26;
    uint64_t v28 = v24 + v27;
    int v29 = *a5 - v28;
    *a5 = v29;
    memmove(a5 + 1, (char *)a5 + v28 + 4, v29);
    if (v26) {
      int v22 = *((_DWORD *)v11 + 10);
    }
    if (a2) {
      *a2 = v22;
    }
    uint64_t result = 0;
    v30 = (unsigned __int8 *)(v13 - v7);
    if (!v22) {
      v30 = 0;
    }
    *a6 = (uint64_t)v30;
    *a3 = v13;
  }
  else
  {
    uint64_t result = 0;
    a5[2] = 0;
    *(void *)a5 = 0;
    uint64_t v21 = 1;
LABEL_19:
    *a6 = v21;
  }
  return result;
}

uint64_t _citrus_VIQR_wcrtomb_priv(uint64_t **a1, void *__dst, uint64_t a3, unsigned int a4, char *__src, size_t *a6)
{
  int v6 = *(_DWORD *)__src;
  if (*(_DWORD *)__src > 1u) {
    return 22;
  }
  char v8 = a4;
  if (a4 > 0xFF)
  {
    *a6 = -1;
    return 92;
  }
  v11 = (unsigned char *)mnemonic_rfc1456[a4];
  if (!v11)
  {
    if (!a3)
    {
LABEL_21:
      *a6 = -1;
      return 7;
    }
    uint64_t v16 = *a1;
    if (!v6)
    {
LABEL_16:
      int v18 = v16 + 3;
      while (1)
      {
        int v18 = (uint64_t *)*v18;
        if (!v18) {
          break;
        }
        if (*((_DWORD *)v18 + 11) == a4) {
          goto LABEL_23;
        }
      }
      int v6 = 0;
      uint64_t v16 = 0;
LABEL_23:
      *(_DWORD *)__src = v6 + 1;
      __src[v6 + 4] = a4;
      goto LABEL_24;
    }
    v16 += 3;
    while (1)
    {
      uint64_t v16 = (uint64_t *)*v16;
      if (!v16) {
        return 22;
      }
      if (*((_DWORD *)v16 + 11) == __src[4])
      {
        __src[4] = 92;
        goto LABEL_16;
      }
    }
  }
  *(_DWORD *)__src = 0;
  char v12 = *v11;
  if (*v11)
  {
    int v13 = v11 + 1;
    while (a3)
    {
      --a3;
      uint64_t v14 = *(int *)__src;
      *(_DWORD *)__src = v14 + 1;
      __src[v14 + 4] = v12;
      int v15 = *v13++;
      char v12 = v15;
      if (!v15) {
        goto LABEL_8;
      }
    }
    goto LABEL_21;
  }
LABEL_8:
  uint64_t v16 = 0;
  char v8 = 0;
LABEL_24:
  size_t v19 = *(int *)__src;
  memcpy(__dst, __src + 4, v19);
  *a6 = v19;
  if (v16 == *a1)
  {
    __src[4] = v8;
    int v20 = 1;
  }
  else
  {
    int v20 = 0;
  }
  uint64_t result = 0;
  *(_DWORD *)__src = v20;
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}