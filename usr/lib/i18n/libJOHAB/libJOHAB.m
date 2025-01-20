uint64_t _citrus_JOHAB_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t result;

  v6 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (!v6) {
    return *__error();
  }
  v7 = v6;
  result = 0;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)a4 = xmmword_26363BF80;
  *(void *)(a4 + 16) = 1;
  return result;
}

void _citrus_JOHAB_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_JOHAB_stdenc_mbtocs(uint64_t a1, int *a2, unsigned int *a3, unsigned __int8 **a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  unsigned int v19 = 0;
  uint64_t result = _citrus_JOHAB_mbrtowc_priv((int *)&v19, a4, a5, a6, a7);
  if (result) {
    return result;
  }
  if (*a7 != -2)
  {
    unsigned int v13 = v19;
    if (v19 < 0x80)
    {
      int v14 = 0;
LABEL_5:
      *a3 = v13;
      *a2 = v14;
      goto LABEL_6;
    }
    if (!HIWORD(v19))
    {
      unsigned int v15 = v19 >> 8;
      if ((v19 >> 8) - 132 > 0x4F)
      {
        if (v15 != 216)
        {
          __int16 v16 = v15 - 217;
          if (v15 - 217 >= 6)
          {
            __int16 v16 = v15 - 224;
            if (v15 - 224 > 0x19) {
              return 92;
            }
            int v17 = 74;
          }
          else
          {
            int v17 = 33;
          }
          __int16 v18 = v19 - 49;
          if (v19 - 49 >= 0x4E)
          {
            uint64_t result = 92;
            if (v19 < 0x91u || v19 == 255) {
              return result;
            }
            __int16 v18 = v19 - 67;
          }
          unsigned int v13 = (unsigned __int16)((unsigned __int16)(v18 + 188 * v16) % 0x5Eu + 33) | ((v17
                                                                                       + (unsigned __int16)(v18 + 188 * v16)
                                                                                       / 0x5Eu) << 8);
          int v14 = 2;
          goto LABEL_5;
        }
        int v14 = 1;
        if (v19 - 49 < 0x4E || v19 - 145 < 0x6E) {
          goto LABEL_5;
        }
      }
      else
      {
        int v14 = 1;
        if (v19 - 65 < 0x3E || v19 - 129 < 0x7E) {
          goto LABEL_5;
        }
      }
    }
    return 92;
  }
LABEL_6:
  if (a8)
  {
    if (*(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }
  return 0;
}

uint64_t _citrus_JOHAB_stdenc_cstomb(uint64_t a1, unsigned char *a2, unint64_t a3, unsigned int a4, unsigned int a5, _DWORD *a6, uint64_t *a7)
{
  if (a4 < 2)
  {
    unsigned int v7 = a5;
  }
  else if (a4 == -1)
  {
    unsigned int v7 = 0;
  }
  else
  {
    if (a4 != 2) {
      return 92;
    }
    unsigned int v7 = 0;
    if (a5 - 8481 >= 0xB51 && a5 - 18977 >= 0x335E) {
      return 92;
    }
  }
  return _citrus_JOHAB_wcrtomb_priv(a2, a3, v7, a6, a7);
}

uint64_t _citrus_JOHAB_stdenc_mbtowc(uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_JOHAB_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_JOHAB_stdenc_wctomb(uint64_t a1, unsigned char *a2, unint64_t a3, unsigned int a4, _DWORD *a5, uint64_t *a6)
{
  return _citrus_JOHAB_wcrtomb_priv(a2, a3, a4, a5, a6);
}

uint64_t _citrus_JOHAB_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_JOHAB_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_JOHAB_stdenc_getops(uint64_t a1)
{
  long long v1 = unk_26BD2EEC0;
  *(_OWORD *)a1 = _citrus_JOHAB_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  long long v2 = xmmword_26BD2EED0;
  long long v3 = *(_OWORD *)&off_26BD2EEE0;
  long long v4 = xmmword_26BD2EEF0;
  *(void *)(a1 + 80) = qword_26BD2EF00;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_JOHAB_mbrtowc_priv(int *a1, unsigned __int8 **a2, uint64_t a3, uint64_t a4, void *a5)
{
  int v5 = *a2;
  if (!*a2)
  {
    uint64_t result = 0;
    *(void *)a4 = 0;
    *a5 = 0;
    return result;
  }
  if (*(_DWORD *)a4 == 1)
  {
    int v8 = *(unsigned __int8 *)(a4 + 4);
    v6 = *a2;
    if (!a3) {
      goto LABEL_28;
    }
  }
  else
  {
    if (*(_DWORD *)a4) {
      return 22;
    }
    if (!a3) {
      goto LABEL_29;
    }
    v6 = v5 + 1;
    int v7 = (char)*v5;
    int v8 = *v5;
    if ((v7 & 0x80000000) == 0)
    {
      if (a1) {
        *a1 = v8;
      }
      uint64_t result = 0;
      *a5 = v7 != 0;
      *a2 = v6;
      return result;
    }
    *(_DWORD *)a4 = 1;
    *(unsigned char *)(a4 + 4) = v7;
    if (a3 == 1)
    {
LABEL_28:
      int v5 = v6;
LABEL_29:
      uint64_t result = 0;
      *a5 = -2;
      *a2 = v5;
      return result;
    }
  }
  int v12 = *v6;
  uint64_t v10 = v6 + 1;
  int v11 = v12;
  if ((v8 - 132) > 0x4F)
  {
    if (v8 == 216 && ((v11 - 49) < 0x4E || (v11 - 145) < 0x6E)) {
      goto LABEL_24;
    }
LABEL_19:
    if ((v8 - 217) >= 6 && (v8 - 224) > 0x19
      || (v11 - 49) >= 0x4E && (v11 - 145) >= 0x6E)
    {
      *a5 = -1;
      return 92;
    }
    goto LABEL_24;
  }
  if ((v11 - 65) >= 0x3E && (v11 - 129) >= 0x7E) {
    goto LABEL_19;
  }
LABEL_24:
  if (a1) {
    *a1 = v11 | (v8 << 8);
  }
  uint64_t result = 0;
  *a5 = v10 - v5;
  *a2 = v10;
  *(_DWORD *)a4 = 0;
  return result;
}

uint64_t _citrus_JOHAB_wcrtomb_priv(unsigned char *a1, unint64_t a2, unsigned int a3, _DWORD *a4, uint64_t *a5)
{
  if (!*a4)
  {
    if (a3 <= 0x7F)
    {
      if (a2)
      {
        uint64_t v6 = 1;
LABEL_6:
        uint64_t v5 = 0;
        *a1 = a3;
LABEL_23:
        *a5 = v6;
        return v5;
      }
      goto LABEL_9;
    }
    if (!HIWORD(a3))
    {
      if (a2 < 2)
      {
LABEL_9:
        uint64_t v5 = 7;
LABEL_22:
        uint64_t v6 = -1;
        goto LABEL_23;
      }
      unsigned int v7 = a3 >> 8;
      if ((a3 >> 8) - 132 > 0x4F)
      {
        if (v7 == 216
          && (a3 - 49 < 0x4E || a3 - 145 < 0x6E))
        {
          goto LABEL_25;
        }
      }
      else if (a3 - 65 < 0x3E || a3 - 129 < 0x7E)
      {
LABEL_25:
        *a1++ = BYTE1(a3);
        uint64_t v6 = 2;
        goto LABEL_6;
      }
      if ((v7 - 217 < 6 || v7 - 224 <= 0x19)
        && (a3 - 49 < 0x4E || a3 - 145 <= 0x6D))
      {
        goto LABEL_25;
      }
    }
    uint64_t v5 = 92;
    goto LABEL_22;
  }
  return 22;
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void free(void *a1)
{
}