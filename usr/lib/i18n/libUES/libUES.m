uint64_t _citrus_UES_stdenc_init(uint64_t a1, char *a2, unint64_t a3, void *a4)
{
  uint64_t *v8;
  uint64_t *v9;
  char v10;
  uint64_t v11;
  uint64_t result;

  v8 = (uint64_t *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040D9A13B51uLL);
  if (!v8) {
    return *__error();
  }
  v9 = v8;
  *v8 = 0;
  v8[1] = 0;
  if (a3)
  {
    do
    {
      v10 = *a2;
      if ((*a2 - 123) >= 0xE6u) {
        v10 = *a2 - 32;
      }
      if (a3 >= 3 && v10 == 67 && !_citrus_bcs_strncasecmp())
      {
        *((_DWORD *)v9 + 2) |= 1u;
        a2 += 3;
        a3 -= 3;
      }
      ++a2;
      --a3;
    }
    while (a3);
    v11 = 10;
    if ((v9[1] & 1) == 0) {
      v11 = 12;
    }
  }
  else
  {
    v11 = 12;
  }
  result = 0;
  *v9 = v11;
  *(void *)(a1 + 8) = v9;
  *a4 = 16;
  a4[1] = v11;
  a4[2] = 1;
  return result;
}

void _citrus_UES_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_UES_stdenc_mbtocs(uint64_t a1, _DWORD *a2, unsigned int *a3, char **a4, uint64_t a5, int *a6, void *a7, uint64_t a8)
{
  unsigned int v15 = 0;
  uint64_t v12 = _citrus_UES_mbrtowc_priv(*(void *)(a1 + 8), &v15, a4, a5, a6, a7);
  if (!v12)
  {
    if (*a7 != -2)
    {
      unsigned int v13 = v15;
      *a2 = 0;
      *a3 = v13;
    }
    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }
  return v12;
}

uint64_t _citrus_UES_stdenc_cstomb(uint64_t a1, void *a2, unint64_t a3, int a4, int a5, uint64_t a6, void *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }
  else if (a4)
  {
    return 92;
  }
  return _citrus_UES_wcrtomb_priv(*(void *)(a1 + 8), a2, a3, a5, a6, a7);
}

uint64_t _citrus_UES_stdenc_mbtowc(uint64_t a1, unsigned int *a2, char **a3, uint64_t a4, int *a5, void *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_UES_mbrtowc_priv(*(void *)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_UES_stdenc_wctomb(uint64_t a1, void *a2, unint64_t a3, int a4, uint64_t a5, void *a6)
{
  return _citrus_UES_wcrtomb_priv(*(void *)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t _citrus_UES_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_UES_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_UES_stdenc_getops(uint64_t a1)
{
  long long v1 = unk_26BD2EF70;
  *(_OWORD *)a1 = _citrus_UES_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  long long v2 = xmmword_26BD2EF80;
  long long v3 = *(_OWORD *)&off_26BD2EF90;
  long long v4 = xmmword_26BD2EFA0;
  *(void *)(a1 + 80) = qword_26BD2EFB0;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_UES_mbrtowc_priv(uint64_t a1, unsigned int *a2, char **a3, uint64_t a4, int *a5, void *a6)
{
  v8 = *a3;
  if (!*a3)
  {
    uint64_t result = 0;
    *(void *)a5 = 0;
    *((void *)a5 + 1) = 0;
    *a6 = 0;
    return result;
  }
  uint64_t v11 = 0;
  unsigned int v12 = 0;
  unsigned int v13 = *a3;
  while (1)
  {
    uint64_t v14 = *a5;
    if (v14 == v11)
    {
      if (!a4) {
        goto LABEL_40;
      }
      --a4;
      int v16 = *v13++;
      int v15 = v16;
      uint64_t v14 = v11 | 1;
      *a5 = v11 | 1;
      *((unsigned char *)a5 + v11 + 4) = v16;
    }
    else
    {
      int v15 = *((unsigned __int8 *)a5 + v11 + 4);
    }
    if (v15 == 92)
    {
      if (v14 == (v11 | 1))
      {
        if (!a4)
        {
LABEL_40:
          uint64_t result = 0;
          *a3 = v13;
          *a6 = -2;
          return result;
        }
        --a4;
        int v18 = *v13++;
        int v17 = v18;
        *a5 = v14 + 1;
        *((unsigned char *)a5 + v14 + 4) = v18;
      }
      else
      {
        int v17 = *((unsigned __int8 *)a5 + (v11 | 1) + 4);
      }
      if (v17 == 85)
      {
        if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
          goto LABEL_45;
        }
        uint64_t v20 = 10;
      }
      else
      {
        if ((char)v17 != 117) {
          goto LABEL_45;
        }
        uint64_t v20 = v11 + 6;
      }
      unsigned int v19 = 0;
      do
      {
        uint64_t v21 = *a5;
        if (v11 + 2 == v21)
        {
          if (!a4) {
            goto LABEL_40;
          }
          --a4;
          char v22 = *v13++;
          *a5 = v21 + 1;
          *((unsigned char *)a5 + (int)v21 + 4) = v22;
        }
        unsigned int v23 = *((unsigned __int8 *)a5 + v11 + 6);
        unsigned int v24 = v23 - 48;
        if (v23 - 48 >= 0xA)
        {
          if (v23 - 65 > 5)
          {
            unsigned int v24 = v23 - 87;
            if (v23 < 0x57 || v23 - 103 < 0xFFFFFFFA) {
              goto LABEL_45;
            }
          }
          else
          {
            unsigned int v24 = v23 - 55;
          }
        }
        unsigned int v19 = v24 | (16 * v19);
        ++v11;
      }
      while (v20 - 2 != v11);
      uint64_t v11 = v20;
    }
    else
    {
      unsigned int v19 = 0;
    }
    if (v11 != 6) {
      break;
    }
    if (v12) {
      goto LABEL_45;
    }
    if (*(unsigned char *)(a1 + 8)) {
      goto LABEL_47;
    }
    uint64_t v11 = 6;
    unsigned int v12 = v19;
    if ((v19 & 0xFFFFFC00) != 0xD800)
    {
      if (v19 < 0x80 || (v19 & 0xFFFFFC00) == 0xDC00)
      {
LABEL_45:
        unsigned int v19 = *((unsigned __int8 *)a5 + 4);
        int v27 = *a5 - 1;
        if (*a5 >= 2) {
          memmove(a5 + 1, (char *)a5 + 5, (*a5 - 1));
        }
        goto LABEL_55;
      }
LABEL_54:
      int v27 = 0;
      goto LABEL_55;
    }
  }
  if (v11 == 10)
  {
LABEL_47:
    if (v19 > 0x9F)
    {
      if ((v19 & 0x80000000) != 0) {
        goto LABEL_53;
      }
    }
    else if (v19 - 36 > 0x3C || ((1 << (v19 - 36)) & 0x1000000010000001) == 0)
    {
      goto LABEL_53;
    }
    if ((v19 | 0x400) >> 10 != 55) {
      goto LABEL_54;
    }
LABEL_53:
    *a6 = -1;
    return 92;
  }
  if (v11 != 12 || v19 >> 10 != 55) {
    goto LABEL_45;
  }
  int v27 = 0;
  unsigned int v19 = ((v19 - 56320) | ((v12 << 10) - 56623104)) + 0x10000;
LABEL_55:
  *a5 = v27;
  if (a2) {
    *a2 = v19;
  }
  uint64_t result = 0;
  v28 = (unsigned char *)(v13 - v8);
  if (!v19) {
    v28 = 0;
  }
  *a6 = v28;
  *a3 = v13;
  return result;
}

uint64_t _citrus_UES_wcrtomb_priv(uint64_t a1, void *__dst, unint64_t a3, int a4, uint64_t a5, void *a6)
{
  if (*(_DWORD *)a5) {
    return 22;
  }
  if (*(_DWORD *)(a1 + 8))
  {
    if (a4 <= 0x9F)
    {
      if ((a4 - 36) > 0x3C || ((1 << (a4 - 36)) & 0x1000000010000001) == 0)
      {
LABEL_5:
        if (a3)
        {
          *(unsigned char *)(a5 + 4) = a4;
          int v9 = 1;
LABEL_16:
          uint64_t v12 = v9;
          memcpy(__dst, (const void *)(a5 + 4), v9);
          uint64_t result = 0;
          *a6 = v12;
          *(_DWORD *)a5 = 0;
          return result;
        }
        goto LABEL_28;
      }
LABEL_12:
      if (a3 >= 6)
      {
        *(_WORD *)(a5 + 4) = 30044;
        unsigned int v10 = 20;
        uint64_t v11 = 6;
        do
        {
          *(unsigned char *)(a5 + v11) = a0123456789abcd[(a4 >> (v10 - 8)) & 0xFLL];
          v10 -= 4;
          ++v11;
        }
        while (v10 > 4);
LABEL_15:
        int v9 = v11 - 4;
        goto LABEL_16;
      }
      goto LABEL_28;
    }
  }
  else if (a4 <= 0x7F)
  {
    goto LABEL_5;
  }
  if (!HIWORD(a4)) {
    goto LABEL_12;
  }
  int v13 = *(_DWORD *)(a1 + 8) & 1;
  if (HIWORD(a4) <= 0x10u && !v13)
  {
    if (a3 >= 0xC)
    {
      *(_WORD *)(a5 + 4) = 30044;
      unsigned int v14 = 20;
      uint64_t v15 = 6;
      do
      {
        *(unsigned char *)(a5 + v15) = a0123456789abcd[((((a4 - 0x10000) >> 10) + 55296) >> (v14 - 8)) & 0xFLL];
        v14 -= 4;
        ++v15;
      }
      while (v14 > 4);
      *(_DWORD *)a5 = *(_DWORD *)a5 + v15 - 4;
      *(_WORD *)(a5 + 10) = 30044;
      unsigned int v16 = 20;
      uint64_t v17 = 12;
      do
      {
        *(unsigned char *)(a5 + v17) = a0123456789abcd[((a4 & 0x3FF | 0xDC00u) >> (v16 - 8)) & 0xFLL];
        v16 -= 4;
        ++v17;
      }
      while (v16 > 4);
      int v9 = *(_DWORD *)a5 + v17 - 10;
      goto LABEL_16;
    }
    goto LABEL_28;
  }
  if ((a4 & 0x80000000) == 0 && v13)
  {
    if (a3 >= 0xA)
    {
      *(_WORD *)(a5 + 4) = 21852;
      unsigned int v18 = 36;
      uint64_t v11 = 6;
      do
      {
        *(unsigned char *)(a5 + v11) = a0123456789abcd[(a4 >> (v18 - 8)) & 0xFLL];
        v18 -= 4;
        ++v11;
      }
      while (v18 > 4);
      goto LABEL_15;
    }
LABEL_28:
    *a6 = -1;
    return 7;
  }
  *a6 = -1;
  return 92;
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _citrus_bcs_strncasecmp()
{
  return MEMORY[0x270F99410]();
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}