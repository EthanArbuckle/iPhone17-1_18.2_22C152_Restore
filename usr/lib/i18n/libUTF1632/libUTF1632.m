uint64_t _citrus_UTF1632_stdenc_init(uint64_t a1, char *a2, unint64_t a3, void *a4)
{
  void *v8;
  _DWORD *v9;
  BOOL v10;
  int v11;
  int v12;
  unint64_t v13;
  int v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;

  v8 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  if (!v8) {
    return *__error();
  }
  v9 = v8;
  *v8 = 0;
  v8[1] = 0;
  v10 = 1;
  if (a3)
  {
    v11 = 0;
    while (1)
    {
      v12 = *a2;
      if (v12 <= 97) {
        break;
      }
      if (v12 > 107)
      {
        switch(v12)
        {
          case 'l':
            goto LABEL_34;
          case 's':
            goto LABEL_37;
          case 'u':
            goto LABEL_24;
        }
      }
      else
      {
        switch(v12)
        {
          case 'b':
            goto LABEL_27;
          case 'f':
            goto LABEL_30;
          case 'i':
            goto LABEL_14;
        }
      }
LABEL_41:
      ++a2;
      if (!--a3)
      {
        v14 = v9[3];
        v10 = *v9 == 0;
        goto LABEL_45;
      }
    }
    if (v12 > 75)
    {
      if (v12 == 76)
      {
LABEL_34:
        v13 = a3 - 6;
        if (a3 < 6 || _citrus_bcs_strncasecmp()) {
          goto LABEL_41;
        }
        *v9 = 2;
        a2 += 6;
        goto LABEL_40;
      }
      if (v12 == 83)
      {
LABEL_37:
        v13 = a3 - 7;
        if (a3 < 7 || _citrus_bcs_strncasecmp()) {
          goto LABEL_41;
        }
        *v9 = 1;
        a2 += 7;
        goto LABEL_40;
      }
      if (v12 != 85) {
        goto LABEL_41;
      }
LABEL_24:
      v13 = a3 - 5;
      if (a3 < 5 || _citrus_bcs_strncasecmp()) {
        goto LABEL_41;
      }
      v11 |= 1u;
    }
    else
    {
      if (v12 == 66)
      {
LABEL_27:
        v13 = a3 - 3;
        if (a3 < 3 || _citrus_bcs_strncasecmp()) {
          goto LABEL_41;
        }
        *v9 = 1;
        a2 += 3;
        goto LABEL_40;
      }
      if (v12 != 70)
      {
        if (v12 != 73) {
          goto LABEL_41;
        }
LABEL_14:
        v13 = a3 - 8;
        if (a3 < 8 || _citrus_bcs_strncasecmp()) {
          goto LABEL_41;
        }
        *v9 = 2;
        a2 += 8;
LABEL_40:
        a3 = v13;
        goto LABEL_41;
      }
LABEL_30:
      v13 = a3 - 5;
      if (a3 < 5 || _citrus_bcs_strncasecmp()) {
        goto LABEL_41;
      }
      v11 |= 2u;
    }
    v9[3] = v11;
    a2 += 5;
    goto LABEL_40;
  }
  LOBYTE(v14) = 0;
LABEL_45:
  if (v14) {
    v16 = 4;
  }
  else {
    v16 = 2;
  }
  if (v14) {
    v17 = 8;
  }
  else {
    v17 = 6;
  }
  v9[1] = v17;
  v9[2] = v16;
  if ((v14 & 2) != 0)
  {
    if (v10)
    {
      free(v9);
      return 22;
    }
  }
  else if (v10)
  {
    *v9 = 1;
  }
  result = 0;
  *(void *)(a1 + 8) = v9;
  *a4 = 12;
  a4[1] = v17;
  a4[2] = v16;
  return result;
}

void _citrus_UTF1632_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_UTF1632_stdenc_mbtocs(uint64_t a1, _DWORD *a2, unsigned int *a3, uint64_t *a4, uint64_t a5, unsigned int *a6, void *a7, uint64_t a8)
{
  unsigned int v15 = 0;
  uint64_t v12 = _citrus_UTF1632_mbrtowc_priv(*(unsigned int **)(a1 + 8), &v15, a4, a5, a6, a7);
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

uint64_t _citrus_UTF1632_stdenc_cstomb(uint64_t a1, char *a2, unint64_t a3, int a4, int a5, uint64_t a6, uint64_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }
  else if (a4)
  {
    return 92;
  }
  return _citrus_UTF1632_wcrtomb_priv(*(int **)(a1 + 8), a2, a3, a5, a6, a7);
}

uint64_t _citrus_UTF1632_stdenc_mbtowc(uint64_t a1, unsigned int *a2, uint64_t *a3, uint64_t a4, unsigned int *a5, void *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_UTF1632_mbrtowc_priv(*(unsigned int **)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_UTF1632_stdenc_wctomb(uint64_t a1, char *a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_UTF1632_wcrtomb_priv(*(int **)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t _citrus_UTF1632_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_UTF1632_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_UTF1632_stdenc_mbtocsn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t *a6, unint64_t a7, unsigned int *a8, void *a9, void (**a10)(void), void (*a11)(uint64_t), uint64_t a12)
{
  unint64_t v12 = *a6;
  *a9 = 0;
  unint64_t v30 = 0;
  if (*a5 >= a7) {
    unint64_t v13 = a7;
  }
  else {
    unint64_t v13 = *a5;
  }
  if (v13)
  {
    unint64_t v14 = a7;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    __int16 v24 = v12;
    unsigned int v31 = 0;
    while (1)
    {
      a11(a12);
      uint64_t result = _citrus_UTF1632_mbrtowc_priv(*(unsigned int **)(a1 + 8), &v31, a6, v14, a8, &v30);
      if (result) {
        break;
      }
      unint64_t v19 = v30;
      if (v30 == -2)
      {
        uint64_t result = 0;
        *a9 = -2;
        break;
      }
      unsigned int v20 = v31;
      *(_DWORD *)(a2 + 4 * v17) = 0;
      *(_DWORD *)(a3 + 4 * v17) = v20;
      if (v19 > v14) {
        _citrus_UTF1632_stdenc_mbtocsn_cold_1();
      }
      v16 += v19;
      *a9 = v16;
      uint64_t v21 = *a6;
      if (*a6 < v12) {
        _citrus_UTF1632_stdenc_mbtocsn_cold_2();
      }
      *(_WORD *)(a4 + 2 * v17) = v21 - v24;
      if (a10 && *a10) {
        (*a10)();
      }
      uint64_t result = 0;
      if (++v17 < v13)
      {
        unint64_t v22 = v14 + v12;
        unint64_t v12 = v21;
        unint64_t v14 = v22 - v21;
        if (v22 != v21) {
          continue;
        }
      }
      break;
    }
  }
  else
  {
    LODWORD(v17) = 0;
    uint64_t result = 0;
  }
  *a5 = v17;
  return result;
}

uint64_t _citrus_UTF1632_stdenc_cstombn(uint64_t a1, char *a2, unint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, void *a8, uint64_t a9, void (*a10)(uint64_t), uint64_t a11)
{
  unint64_t v25 = 0;
  unint64_t v11 = *a6;
  if ((int)v11 < 1)
  {
    uint64_t v18 = 0;
    LODWORD(v17) = 0;
    uint64_t result = 0;
    goto LABEL_15;
  }
  unint64_t v22 = a6;
  v23 = a8;
  unint64_t v17 = 0;
  uint64_t v18 = 0;
  while (1)
  {
    a10(a11);
    int v19 = *(_DWORD *)(a4 + 4 * v17);
    if (v19 != -1) {
      break;
    }
    int v20 = 0;
LABEL_7:
    uint64_t result = _citrus_UTF1632_wcrtomb_priv(*(int **)(a1 + 8), a2, a3, v20, a7, (uint64_t *)&v25);
    if (!result)
    {
      if (a3 < v25) {
        _citrus_UTF1632_stdenc_cstombn_cold_1();
      }
      uint64_t result = 0;
      ++v17;
      v18 += v25;
      a3 -= v25;
      if (a3)
      {
        a2 += v25;
        if (v17 < v11) {
          continue;
        }
      }
    }
    goto LABEL_14;
  }
  if (!v19)
  {
    int v20 = *(_DWORD *)(a5 + 4 * v17);
    goto LABEL_7;
  }
  uint64_t result = 92;
LABEL_14:
  a6 = v22;
  a8 = v23;
LABEL_15:
  *a6 = v17;
  *a8 = v18;
  return result;
}

uint64_t _citrus_UTF1632_stdenc_getops(uint64_t a1)
{
  long long v1 = *(_OWORD *)algn_26BD2EFC8;
  *(_OWORD *)a1 = _citrus_UTF1632_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  long long v2 = xmmword_26BD2EFD8;
  long long v3 = *(_OWORD *)&off_26BD2EFE8;
  long long v4 = xmmword_26BD2EFF8;
  *(void *)(a1 + 80) = off_26BD2F008;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_UTF1632_mbrtowc_priv(unsigned int *a1, unsigned int *a2, uint64_t *a3, uint64_t a4, unsigned int *a5, void *a6)
{
  uint64_t v6 = *a3;
  if (!*a3)
  {
    uint64_t result = 0;
    a5[2] = 0;
    *(void *)a5 = 0;
    *a6 = 0;
    return result;
  }
  uint64_t v7 = *a5;
  unsigned int v8 = a1[3];
  if ((v8 & 2) != 0)
  {
    unsigned int v9 = *a1;
    a5[1] = *a1;
  }
  else
  {
    unsigned int v9 = 0;
  }
  uint64_t v11 = 0;
  unsigned int v12 = 0;
  unint64_t v13 = a5 + 2;
  unint64_t v14 = (char *)a5 + 9;
  unsigned int v15 = (char *)a5 + 10;
  uint64_t v16 = (char *)a5 + 11;
  while (2)
  {
    for (uint64_t i = v7; ; uint64_t i = 0)
    {
      BOOL v18 = (v8 & 1) == 0 && (int)i < 2;
      if (v18) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 4;
      }
      if ((int)i < (int)v7)
      {
        uint64_t v19 = 0;
        while (a4 != v19)
        {
          v13[(int)i + v19] = *(unsigned char *)(v6 + v19);
          if (!(i - v7 + ++v19))
          {
            unsigned int v8 = a1[3];
            v11 += v19;
            v6 += v19;
            a4 -= v19;
            goto LABEL_17;
          }
        }
        uint64_t result = 0;
        *a6 = -2;
        *a5 = i + v19;
        v6 += v19;
        goto LABEL_48;
      }
      uint64_t v7 = i;
LABEL_17:
      if ((v8 & 2) != 0) {
        goto LABEL_38;
      }
      int v20 = *v13;
      if (v8) {
        break;
      }
      if (v20 == 255)
      {
        if (*v14 != 254) {
          goto LABEL_36;
        }
        goto LABEL_34;
      }
      if (v20 != 254) {
        goto LABEL_36;
      }
      int v21 = *v14;
LABEL_27:
      if (v21 != 255) {
        goto LABEL_36;
      }
      int v22 = 1;
LABEL_35:
      a5[1] = v22;
    }
    if (v20 != 255)
    {
      if (*v13 || *v14 || *v15 != 254) {
        goto LABEL_36;
      }
      int v21 = *v16;
      goto LABEL_27;
    }
    if (*v14 == 254 && !*v15 && !*v16)
    {
LABEL_34:
      int v22 = 2;
      goto LABEL_35;
    }
LABEL_36:
    unsigned int v9 = a5[1];
    if (!v9)
    {
      unsigned int v9 = *a1;
LABEL_38:
      if (!v9) {
        _citrus_UTF1632_mbrtowc_priv_cold_1();
      }
    }
    if (v8)
    {
      if (v9 == 1)
      {
        unsigned int v12 = *v16 | (*v15 << 8) | (*v14 << 16) | (*v13 << 24);
      }
      else
      {
        if (v9 != 2) {
          break;
        }
        unsigned int v12 = *(_DWORD *)v13;
      }
      if (v12 >> 11 != 27) {
        goto LABEL_62;
      }
    }
    else if (v18)
    {
      v23 = (unsigned __int8 *)a5 + 9;
      __int16 v24 = (unsigned __int8 *)(a5 + 2);
      if (v9 == 2) {
        goto LABEL_44;
      }
      if (v9 == 1)
      {
        v23 = (unsigned __int8 *)(a5 + 2);
        __int16 v24 = (unsigned __int8 *)a5 + 9;
LABEL_44:
        int v25 = *v23;
        unsigned int v12 = *v24 | (v25 << 8);
        int v26 = (v25 << 8) & 0xFC00;
        if (v26 == 55296) {
          continue;
        }
        if (v26 != 56320)
        {
LABEL_62:
          uint64_t result = 0;
          *a2 = v12;
          *a5 = 0;
          *a6 = v11;
LABEL_48:
          *a3 = v6;
          return result;
        }
      }
    }
    else
    {
      if (v9 == 1)
      {
        char v27 = *v15;
        unsigned int v28 = (*v15 + 32);
        unsigned int v15 = (char *)a5 + 11;
      }
      else
      {
        if (v9 != 2) {
          break;
        }
        char v27 = *v16;
        unsigned int v28 = (*v16 + 32);
      }
      if (v28 >= 0xFC)
      {
        unsigned int v12 = (*v15 | ((v27 & 3) << 8) | ((v12 << 10) - 56623104)) + 0x10000;
        goto LABEL_62;
      }
    }
    break;
  }
  *a6 = -1;
  *a5 = 0;
  return 92;
}

uint64_t _citrus_UTF1632_wcrtomb_priv(int *a1, char *__dst, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  unint64_t v9 = a3;
  int v12 = *(_DWORD *)(a5 + 4);
  if (v12)
  {
    size_t v13 = 0;
    unint64_t v14 = __dst;
  }
  else
  {
    int v15 = a1[3];
    if ((v15 & 2) != 0)
    {
      size_t v13 = 0;
      unint64_t v14 = __dst;
    }
    else
    {
      if (v15) {
        size_t v13 = 4;
      }
      else {
        size_t v13 = 2;
      }
      unint64_t v9 = a3 - v13;
      if (a3 < v13) {
        goto LABEL_31;
      }
      if (v15) {
        uint64_t v16 = &_citrus_UTF1632_wcrtomb_priv__bom;
      }
      else {
        uint64_t v16 = &unk_26363FF6C;
      }
      memcpy(__dst, v16, v13);
      unint64_t v14 = &__dst[v13];
    }
    int v12 = *a1;
    *(_DWORD *)(a5 + 4) = *a1;
  }
  if ((a1[3] & 1) == 0)
  {
    if (a4 < 0x10000)
    {
      if (v9 >= 2)
      {
        LODWORD(result) = 0;
        uint64_t v17 = v13 + 2;
LABEL_23:
        uint64_t v19 = v14 + 1;
        do
        {
          int v20 = result;
          int v21 = *(_DWORD *)(a5 + 4);
          if (v21 == 2)
          {
            *(_WORD *)(v19 - 1) = a4;
          }
          else if (v21 == 1)
          {
            *(_WORD *)(v19 - 1) = bswap32(a4) >> 16;
          }
          uint64_t result = 0;
          v19 += 2;
          a4 = v20;
        }
        while (v20);
        goto LABEL_33;
      }
      goto LABEL_31;
    }
    if (HIWORD(a4) <= 0x10u)
    {
      if (v9 >= 4)
      {
        uint64_t v17 = v13 + 4;
        LODWORD(result) = a4 & 0x3FF | 0xDC00;
        a4 = ((a4 - 0x10000) >> 10) | 0xD800;
        goto LABEL_23;
      }
      goto LABEL_31;
    }
LABEL_20:
    uint64_t result = 92;
LABEL_32:
    uint64_t v17 = -1;
    goto LABEL_33;
  }
  if (a4 >> 11 == 27) {
    goto LABEL_20;
  }
  if (v9 < 4)
  {
LABEL_31:
    uint64_t result = 7;
    goto LABEL_32;
  }
  uint64_t v17 = v13 + 4;
  if (v12 == 2)
  {
    uint64_t result = 0;
    __dst[v13] = a4;
    v14[1] = BYTE1(a4);
    v14[2] = BYTE2(a4);
    v14[3] = HIBYTE(a4);
  }
  else
  {
    uint64_t result = 0;
    if (v12 == 1)
    {
      *((_WORD *)v14 + 1) = bswap32(a4) >> 16;
      v14[1] = BYTE2(a4);
      __dst[v13] = HIBYTE(a4);
    }
  }
LABEL_33:
  *a6 = v17;
  return result;
}

void _citrus_UTF1632_stdenc_mbtocsn_cold_1()
{
  __assert_rtn("_citrus_UTF1632_stdenc_mbtocsn", "citrus_stdenc_template.h", 219, "accum <= n");
}

void _citrus_UTF1632_stdenc_mbtocsn_cold_2()
{
  __assert_rtn("_citrus_UTF1632_stdenc_mbtocsn", "citrus_stdenc_template.h", 221, "*s >= last");
}

void _citrus_UTF1632_stdenc_cstombn_cold_1()
{
  __assert_rtn("_citrus_UTF1632_stdenc_cstombn", "citrus_stdenc_template.h", 265, "tmp <= n");
}

void _citrus_UTF1632_mbrtowc_priv_cold_1()
{
  __assert_rtn("_citrus_UTF1632_mbrtowc_priv", "citrus_utf1632.c", 199, "endian != _ENDIAN_UNKNOWN");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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