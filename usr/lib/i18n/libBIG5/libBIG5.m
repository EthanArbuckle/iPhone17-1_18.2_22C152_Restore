uint64_t _citrus_BIG5_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t result;

  v8 = malloc_type_calloc(1uLL, 0x410uLL, 0x10A0040E7A18792uLL);
  if (v8)
  {
    v9 = v8;
    bzero(v8, 0x410uLL);
    v9[1] = v9;
    if (a2 && a3 && *(unsigned char *)_citrus_bcs_skip_ws_len())
    {
      if (!_citrus_prop_parse_variable())
      {
LABEL_13:
        result = 0;
        *(void *)(a1 + 8) = v9;
        *(_OWORD *)a4 = xmmword_263630F50;
        *(void *)(a4 + 16) = 1;
        return result;
      }
      _citrus_BIG5_encoding_module_uninit((uint64_t)v9);
      bzero(v9, 0x410uLL);
      v9[1] = v9;
    }
    for (i = 0; i != 376; i += 4)
      *(_DWORD *)((char *)v9 + i + 660) |= 1u;
    for (j = 0; j != 252; j += 4)
      *(_DWORD *)((char *)v9 + j + 272) |= 2u;
    for (k = 0; k != 376; k += 4)
      *(_DWORD *)((char *)v9 + k + 660) |= 2u;
    goto LABEL_13;
  }
  return *__error();
}

void _citrus_BIG5_stdenc_uninit(uint64_t a1)
{
  if (a1)
  {
    v1 = *(void **)(a1 + 8);
    _citrus_BIG5_encoding_module_uninit((uint64_t)v1);
    free(v1);
  }
}

uint64_t _citrus_BIG5_stdenc_mbtocs(uint64_t a1, _DWORD *a2, int *a3, uint64_t *a4, uint64_t a5, int *a6, uint64_t *a7, uint64_t a8)
{
  int v15 = 0;
  uint64_t v12 = _citrus_BIG5_mbrtowc_priv(*(void **)(a1 + 8), &v15, a4, a5, a6, a7);
  if (!v12)
  {
    if (*a7 != -2)
    {
      int v13 = v15;
      *a2 = v15 > 255;
      *a3 = v13;
    }
    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }
  return v12;
}

uint64_t _citrus_BIG5_stdenc_cstomb(uint64_t a1, _WORD *a2, unint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }
  else if (a4 > 1)
  {
    return 92;
  }
  return _citrus_BIG5_wcrtomb_priv(*(void **)(a1 + 8), a2, a3, a5, a7);
}

uint64_t _citrus_BIG5_stdenc_mbtowc(uint64_t a1, _DWORD *a2, uint64_t *a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_BIG5_mbrtowc_priv(*(void **)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_BIG5_stdenc_wctomb(uint64_t a1, _WORD *a2, unint64_t a3, unsigned int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_BIG5_wcrtomb_priv(*(void **)(a1 + 8), a2, a3, a4, a6);
}

uint64_t _citrus_BIG5_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_BIG5_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_BIG5_stdenc_getops(uint64_t a1)
{
  long long v1 = unk_26BD2EC00;
  *(_OWORD *)a1 = _citrus_BIG5_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  long long v2 = xmmword_26BD2EC10;
  long long v3 = *(_OWORD *)&off_26BD2EC20;
  long long v4 = xmmword_26BD2EC30;
  *(void *)(a1 + 80) = qword_26BD2EC40;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t *_citrus_BIG5_encoding_module_uninit(uint64_t a1)
{
  uint64_t result = *(uint64_t **)a1;
  if (result)
  {
    do
    {
      uint64_t v3 = *result;
      long long v4 = (void *)result[1];
      if (*result)
      {
        *(void *)(v3 + 8) = v4;
        long long v4 = (void *)result[1];
      }
      else
      {
        *(void *)(a1 + 8) = v4;
      }
      *long long v4 = v3;
      free(result);
      uint64_t result = *(uint64_t **)a1;
    }
    while (*(void *)a1);
  }
  return result;
}

uint64_t _citrus_BIG5_fill_rowcol(uint64_t a1, const char *a2, unint64_t a3, unint64_t a4)
{
  if ((a4 | a3) > 0xFF) {
    return 22;
  }
  unint64_t v5 = a3;
  char v7 = strcmp("row", a2) != 0;
  if (v5 <= a4)
  {
    int v8 = 1 << v7;
    do
      *(_DWORD *)(a1 + 4 * v5++ + 16) |= v8;
    while (a4 + 1 != v5);
  }
  return 0;
}

uint64_t _citrus_BIG5_fill_excludes(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if ((a4 | a3) >> 16) {
    return 22;
  }
  int v4 = a4;
  int v5 = a3;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = **(void **)(v7 + 8);
  if (v8 && *(_DWORD *)(v8 + 20) >= (int)a3) {
    return 22;
  }
  uint64_t v9 = malloc_type_malloc(0x18uLL, 0x10A00404E934A1DuLL);
  if (!v9) {
    return 12;
  }
  uint64_t v10 = v9;
  uint64_t result = 0;
  v10[4] = v5;
  v10[5] = v4;
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = v7;
  *(void *)uint64_t v7 = v10;
  *(void *)(a1 + 8) = v10;
  return result;
}

uint64_t _citrus_BIG5_mbrtowc_priv(void *a1, _DWORD *a2, uint64_t *a3, uint64_t a4, int *a5, uint64_t *a6)
{
  uint64_t v6 = *a3;
  if (!*a3)
  {
    uint64_t result = 0;
    *(void *)a5 = 0;
    goto LABEL_29;
  }
  int v7 = *a5;
  if (*a5)
  {
    if (v7 != 1)
    {
LABEL_27:
      *a5 = 0;
      uint64_t result = 92;
      uint64_t v6 = -1;
      goto LABEL_29;
    }
    unsigned int v8 = *((unsigned __int8 *)a5 + 4);
  }
  else
  {
    if (!a4)
    {
LABEL_28:
      uint64_t result = 0;
      *a3 = v6;
      uint64_t v6 = -2;
      goto LABEL_29;
    }
    unsigned int v10 = *(unsigned __int8 *)v6++;
    unsigned int v8 = v10;
    *((unsigned char *)a5 + 4) = v10;
    *a5 = 1;
    --a4;
  }
  int v11 = *((_DWORD *)a1 + v8 + 4);
  if (v11) {
    int v12 = 2;
  }
  else {
    int v12 = 1;
  }
  if (v11)
  {
    int v15 = 1;
    while (a4)
    {
      char v16 = *(unsigned char *)v6++;
      *((unsigned char *)a5 + v15 + 4) = v16;
      int v15 = *a5 + 1;
      *a5 = v15;
      --a4;
      if (v15 >= v12)
      {
        if ((v11 & 1) == 0) {
          goto LABEL_12;
        }
        uint64_t v17 = *((unsigned __int8 *)a5 + 5);
        if ((*((_DWORD *)a1 + v17 + 4) & 2) != 0)
        {
          int v13 = v17 | (*((unsigned __int8 *)a5 + 4) << 8);
          goto LABEL_13;
        }
        goto LABEL_27;
      }
    }
    goto LABEL_28;
  }
LABEL_12:
  int v13 = *((unsigned __int8 *)a5 + 4);
LABEL_13:
  v14 = (uint64_t *)*a1;
  if (*a1)
  {
    while (*((_DWORD *)v14 + 4) > v13 || *((_DWORD *)v14 + 5) < v13)
    {
      v14 = (uint64_t *)*v14;
      if (!v14) {
        goto LABEL_17;
      }
    }
    goto LABEL_27;
  }
LABEL_17:
  *a3 = v6;
  *a5 = 0;
  if (a2) {
    *a2 = v13;
  }
  uint64_t result = 0;
  LODWORD(v6) = v12 - v7;
  if (!v13) {
    LODWORD(v6) = 0;
  }
  uint64_t v6 = (int)v6;
LABEL_29:
  *a6 = v6;
  return result;
}

uint64_t _citrus_BIG5_wcrtomb_priv(void *a1, _WORD *a2, unint64_t a3, unsigned int a4, uint64_t *a5)
{
  if (HIWORD(a4)) {
    goto LABEL_12;
  }
  int v5 = (uint64_t *)*a1;
  if (*a1)
  {
    while (*((_DWORD *)v5 + 4) > (signed int)a4 || *((_DWORD *)v5 + 5) < (signed int)a4)
    {
      int v5 = (uint64_t *)*v5;
      if (!v5) {
        goto LABEL_6;
      }
    }
    goto LABEL_12;
  }
LABEL_6:
  if ((a4 & 0x8000) != 0)
  {
    if ((*((_DWORD *)a1 + BYTE1(a4) + 4) & 1) != 0 && (*((_DWORD *)a1 + a4 + 4) & 2) != 0)
    {
      if (a3 >= 2)
      {
        uint64_t result = 0;
        *a2 = bswap32(a4) >> 16;
        uint64_t v7 = 2;
        goto LABEL_14;
      }
      goto LABEL_16;
    }
LABEL_12:
    uint64_t result = 92;
LABEL_13:
    uint64_t v7 = -1;
    goto LABEL_14;
  }
  if (a4 > 0xFF) {
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_16:
    uint64_t result = 7;
    goto LABEL_13;
  }
  uint64_t result = 0;
  *(unsigned char *)a2 = a4;
  uint64_t v7 = 1;
LABEL_14:
  *a5 = v7;
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _citrus_bcs_skip_ws_len()
{
  return MEMORY[0x270F99400]();
}

uint64_t _citrus_prop_parse_variable()
{
  return MEMORY[0x270F99490]();
}

void bzero(void *a1, size_t a2)
{
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