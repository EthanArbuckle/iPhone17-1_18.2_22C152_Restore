uint64_t _citrus_EUC_stdenc_init(uint64_t a1, unsigned __int8 *a2)
{
  void *v3;
  void *v4;
  int v5;

  v3 = malloc_type_calloc(1uLL, 0x28uLL, 0x10000400A747E1EuLL);
  if (!v3) {
    return *__error();
  }
  v4 = v3;
  if (a2)
  {
    while (1)
    {
      v5 = *a2;
      if (v5 != 32 && v5 != 9) {
        break;
      }
      ++a2;
    }
    *((_DWORD *)v3 + 9) = 1;
    *((_DWORD *)v3 + 5) = _citrus_bcs_strtol();
  }
  free(v4);
  return 79;
}

void _citrus_EUC_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_EUC_stdenc_mbtocs(uint64_t a1, int *a2, int *a3, char **a4, uint64_t a5, int *a6, void *a7, uint64_t a8)
{
  int v17 = 0;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = _citrus_EUC_mbrtowc_priv(v12, &v17, a4, a5, a6, a7);
  if (!v13)
  {
    if (*a7 != -2)
    {
      int v14 = *(_DWORD *)(v12 + 16) & v17;
      int v15 = v14 ^ v17;
      *a2 = v14;
      *a3 = v15;
    }
    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }
  return v13;
}

uint64_t _citrus_EUC_stdenc_cstomb(uint64_t a1, char *a2, unint64_t a3, int a4, int a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v7 = *(void *)(a1 + 8);
  if (a4 == -1)
  {
    int v9 = 0;
  }
  else
  {
    if (a4 & ~*(_DWORD *)(v7 + 16) | *(_DWORD *)(v7 + 16) & a5) {
      return 22;
    }
    int v9 = a5 | a4;
  }
  return _citrus_EUC_wcrtomb_priv(v7, a2, a3, v9, a7);
}

uint64_t _citrus_EUC_stdenc_mbtowc(uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, void *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_EUC_mbrtowc_priv(*(void *)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_EUC_stdenc_wctomb(uint64_t a1, char *a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_EUC_wcrtomb_priv(*(void *)(a1 + 8), a2, a3, a4, a6);
}

uint64_t _citrus_EUC_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_EUC_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_EUC_stdenc_getops(uint64_t a1)
{
  long long v1 = *(_OWORD *)algn_26BD2ED08;
  *(_OWORD *)a1 = _citrus_EUC_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  long long v2 = xmmword_26BD2ED18;
  long long v3 = *(_OWORD *)&off_26BD2ED28;
  long long v4 = xmmword_26BD2ED38;
  *(void *)(a1 + 80) = qword_26BD2ED48;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_EUC_mbrtowc_priv(uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, void *a6)
{
  v6 = *a3;
  if (!*a3)
  {
    uint64_t result = 0;
    *(void *)a5 = 0;
    *a6 = 0;
    return result;
  }
  int v7 = *a5;
  if ((*a5 - 1) >= 2)
  {
    if (v7)
    {
LABEL_20:
      *a5 = 0;
      *a6 = -1;
      return 92;
    }
    if (!a4)
    {
LABEL_30:
      uint64_t result = 0;
      *a6 = -2;
      *a3 = v6;
      return result;
    }
    char v10 = *v6++;
    *((unsigned char *)a5 + 4) = v10;
    int v8 = 1;
    *a5 = 1;
    --a4;
  }
  else
  {
    int v8 = *a5;
  }
  v11 = (unsigned __int8 *)(a5 + 1);
  if ((char)a5[1] < 0)
  {
    int v13 = *((unsigned __int8 *)a5 + 4);
    if (v13 == 142) {
      int v14 = 2;
    }
    else {
      int v14 = 1;
    }
    if (v13 == 143) {
      unsigned int v12 = 3;
    }
    else {
      unsigned int v12 = v14;
    }
  }
  else
  {
    unsigned int v12 = 0;
  }
  int v15 = *(_DWORD *)(a1 + 4 * v12 + 20);
  if (!v15) {
    goto LABEL_20;
  }
  while (v8 < v15)
  {
    if (!a4) {
      goto LABEL_30;
    }
    char v16 = *v6++;
    *((unsigned char *)a5 + v8 + 4) = v16;
    int v8 = *a5 + 1;
    *a5 = v8;
    --a4;
  }
  uint64_t v17 = v12;
  *a3 = v6;
  BOOL v18 = v12 > 1;
  if (v12 <= 1) {
    int v19 = 0;
  }
  else {
    int v19 = -1;
  }
  if (v15 - v18 < 1)
  {
    int v20 = 0;
  }
  else
  {
    int v20 = 0;
    if (v17 > 1) {
      v11 = (unsigned __int8 *)a5 + 5;
    }
    unsigned int v21 = v15 + v19 + 1;
    do
    {
      int v22 = *v11++;
      int v20 = v22 | (v20 << 8);
      --v21;
    }
    while (v21 > 1);
  }
  int v23 = v20 & ~*(_DWORD *)(a1 + 16) | *(_DWORD *)(a1 + 4 * v17);
  *a5 = 0;
  if (a2) {
    *a2 = v23;
  }
  uint64_t result = 0;
  int v24 = v15 - v7;
  if (!v23) {
    int v24 = 0;
  }
  *a6 = v24;
  return result;
}

uint64_t _citrus_EUC_wcrtomb_priv(uint64_t a1, char *a2, unint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v5 = 0;
  int v6 = *(_DWORD *)(a1 + 16) & a4;
  int v7 = v6 ^ a4;
  while (v6 != *(_DWORD *)(a1 + 4 * v5))
  {
    if (++v5 == 4)
    {
      unsigned int v8 = 1;
      goto LABEL_8;
    }
  }
  if (v5 == 4) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = v5;
  }
LABEL_8:
  uint64_t v9 = a1 + 4 * v8;
  int v12 = *(_DWORD *)(v9 + 20);
  char v10 = (unsigned int *)(v9 + 20);
  unsigned __int16 v11 = v12;
  if ((__int16)v12 > a3)
  {
    uint64_t result = 7;
    uint64_t v14 = -1;
    goto LABEL_23;
  }
  char v15 = v8 != 0;
  if (v8 == 2)
  {
    char v16 = -114;
    goto LABEL_14;
  }
  if (v8 == 3)
  {
    char v16 = -113;
LABEL_14:
    *a2++ = v16;
    --v11;
  }
  if ((__int16)v11 >= 1)
  {
    unint64_t v17 = 0;
    char v18 = v15 << 7;
    unsigned int v19 = v11;
    uint64x2_t v20 = (uint64x2_t)vdupq_n_s64((unint64_t)v11 - 1);
    uint64_t v21 = (v11 + 1) & 0x1FFFE;
    int32x2_t v22 = vadd_s32(vdup_n_s32(v19), (int32x2_t)0xFFFFFFFF00000000);
    do
    {
      int32x2_t v23 = vmovn_s64((int64x2_t)vcgeq_u64(v20, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v17), (int8x16_t)xmmword_263633F80)));
      int32x2_t v24 = vadd_s32(v22, (int32x2_t)-1);
      if (v23.i8[0]) {
        a2[v17] = (v7 >> (8 * v24.i8[0])) | v18;
      }
      if (v23.i8[4]) {
        a2[v17 + 1] = (v7 >> (8 * v24.i8[4])) | v18;
      }
      v17 += 2;
      int32x2_t v22 = vadd_s32(v22, (int32x2_t)0x100000001);
    }
    while (v21 != v17);
  }
  uint64_t result = 0;
  uint64_t v14 = *v10;
LABEL_23:
  *a5 = v14;
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _citrus_bcs_strtol()
{
  return MEMORY[0x270F99418]();
}

void free(void *a1)
{
}