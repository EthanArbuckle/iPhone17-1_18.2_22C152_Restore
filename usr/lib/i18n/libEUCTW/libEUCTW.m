uint64_t _citrus_EUCTW_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t result;

  v6 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (!v6) {
    return *__error();
  }
  v7 = v6;
  result = 0;
  *v7 = 0;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)a4 = xmmword_263634F70;
  *(void *)(a4 + 16) = 1;
  return result;
}

void _citrus_EUCTW_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_EUCTW_stdenc_mbtocs(uint64_t a1, unsigned int *a2, int *a3, char **a4, uint64_t a5, int *a6, uint64_t *a7, uint64_t a8)
{
  unsigned int v15 = 0;
  uint64_t v12 = _citrus_EUCTW_mbrtowc_priv((int *)&v15, a4, a5, a6, a7);
  if (!v12)
  {
    if (*a7 != -2)
    {
      __int16 v13 = v15;
      *a2 = HIBYTE(v15);
      *a3 = v13 & 0x7F7F;
    }
    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }
  return v12;
}

uint64_t _citrus_EUCTW_stdenc_cstomb(uint64_t a1, unsigned char *a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
    return _citrus_EUCTW_wcrtomb_priv(a2, a3, a5, a7);
  }
  if (a4)
  {
    if ((a4 - 71) > 6 || (a5 & 0xFFFF8080) != 0) {
      return 22;
    }
    a5 |= a4 << 24;
    return _citrus_EUCTW_wcrtomb_priv(a2, a3, a5, a7);
  }
  if (a5 < 0x80) {
    return _citrus_EUCTW_wcrtomb_priv(a2, a3, a5, a7);
  }
  return 22;
}

uint64_t _citrus_EUCTW_stdenc_mbtowc(uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_EUCTW_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_EUCTW_stdenc_wctomb(uint64_t a1, unsigned char *a2, unint64_t a3, unsigned int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_EUCTW_wcrtomb_priv(a2, a3, a4, a6);
}

uint64_t _citrus_EUCTW_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_EUCTW_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_EUCTW_stdenc_getops(uint64_t a1)
{
  long long v1 = unk_26BD2ED60;
  *(_OWORD *)a1 = _citrus_EUCTW_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  long long v2 = xmmword_26BD2ED70;
  long long v3 = *(_OWORD *)&off_26BD2ED80;
  long long v4 = xmmword_26BD2ED90;
  *(void *)(a1 + 80) = qword_26BD2EDA0;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_EUCTW_mbrtowc_priv(int *a1, char **a2, uint64_t a3, int *a4, uint64_t *a5)
{
  int v5 = *a2;
  if (!*a2)
  {
    uint64_t v8 = 0;
    uint64_t result = 0;
    *(void *)a4 = 0;
    goto LABEL_28;
  }
  int v6 = *a4;
  if ((*a4 - 1) >= 2)
  {
    if (v6) {
      goto LABEL_26;
    }
    if (!a3)
    {
      uint64_t result = 0;
      goto LABEL_27;
    }
    char v10 = *v5++;
    *((unsigned char *)a4 + 4) = v10;
    int v7 = 1;
    *a4 = 1;
    --a3;
  }
  else
  {
    int v7 = *a4;
  }
  if (*((unsigned __int8 *)a4 + 4) == 142) {
    int v11 = 2;
  }
  else {
    int v11 = 1;
  }
  if (*((char *)a4 + 4) >= 0) {
    int v11 = 0;
  }
  int v12 = 1 << v11;
  if (v7 < (1 << v11))
  {
    while (a3)
    {
      char v13 = *v5++;
      *((unsigned char *)a4 + v7 + 4) = v13;
      int v7 = *a4 + 1;
      *a4 = v7;
      --a3;
      if (v7 >= v12) {
        goto LABEL_16;
      }
    }
    goto LABEL_26;
  }
LABEL_16:
  if (v11 == 2)
  {
    int v15 = *((unsigned __int8 *)a4 + 5);
    if ((v15 + 88) < 0xF9u
      || (*((unsigned char *)a4 + 6) & 0x80) == 0
      || (*((char *)a4 + 7) & 0x80000000) == 0)
    {
      goto LABEL_26;
    }
    int v14 = (*((unsigned __int8 *)a4 + 7) | (*((unsigned __int8 *)a4 + 6) << 8) | (v15 << 24)) - 1509949440;
  }
  else
  {
    if (v11 != 1)
    {
      int v14 = *((char *)a4 + 4);
      if ((v14 & 0x80) == 0) {
        goto LABEL_31;
      }
LABEL_26:
      *a4 = 0;
      uint64_t result = 92;
LABEL_27:
      uint64_t v8 = -1;
      goto LABEL_28;
    }
    if ((a4[1] & 0x80) == 0 || (*((char *)a4 + 5) & 0x80000000) == 0) {
      goto LABEL_26;
    }
    int v14 = *((unsigned __int8 *)a4 + 5) | (*((unsigned __int8 *)a4 + 4) << 8) | 0x47000000;
  }
LABEL_31:
  *a2 = v5;
  *a4 = 0;
  if (a1) {
    *a1 = v14;
  }
  uint64_t result = 0;
  LODWORD(v8) = v12 - v6;
  if (!v14) {
    LODWORD(v8) = 0;
  }
  uint64_t v8 = (int)v8;
LABEL_28:
  *a5 = v8;
  return result;
}

uint64_t _citrus_EUCTW_wcrtomb_priv(unsigned char *a1, unint64_t a2, unsigned int a3, uint64_t *a4)
{
  if ((a3 & 0x7F00) != 0) {
    int v4 = 2;
  }
  else {
    int v4 = 1;
  }
  if ((a3 & 0x7F0000) != 0) {
    int v5 = (a3 >> 23) & 1;
  }
  else {
    int v5 = 1;
  }
  if ((a3 & 0x7F007F80) == 0 && v5)
  {
    if (a2)
    {
      unsigned int v6 = a3 & 0x7F;
      uint64_t v7 = 1;
      goto LABEL_25;
    }
    goto LABEL_17;
  }
  int v8 = a3 & 0x7F000080;
  if ((a3 & 0x7F00) != 0) {
    int v9 = v5;
  }
  else {
    int v9 = 0;
  }
  if (v8 == 1191182336 && v9)
  {
    if (a2 < 2) {
      goto LABEL_17;
    }
    unsigned int v6 = (unsigned __int16)a3 | 0x8080;
    uint64_t v7 = 2;
  }
  else
  {
    if (!v9 || (v8 - 1207959552) >> 25 > 2)
    {
      uint64_t result = 92;
      goto LABEL_23;
    }
    if (a2 < 4)
    {
LABEL_17:
      uint64_t result = 7;
LABEL_23:
      uint64_t v7 = -1;
      goto LABEL_28;
    }
    *a1 = -114;
    a1[1] = HIBYTE(v8) + 90;
    a1 += 2;
    unsigned int v6 = (unsigned __int16)a3 | 0x8080;
    uint64_t v7 = 4;
  }
LABEL_25:
  unsigned int v11 = v4 + 1;
  int v12 = 8 * v4 - 8;
  do
  {
    *a1++ = v6 >> v12;
    --v11;
    v12 -= 8;
  }
  while (v11 > 1);
  uint64_t result = 0;
LABEL_28:
  *a4 = v7;
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void free(void *a1)
{
}