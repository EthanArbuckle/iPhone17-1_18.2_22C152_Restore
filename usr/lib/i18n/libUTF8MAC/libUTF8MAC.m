uint64_t _citrus_UTF8MAC_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t result;

  v6 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  if (!v6) {
    return *__error();
  }
  v7 = v6;
  result = 0;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)a4 = xmmword_263644A20;
  *(void *)(a4 + 16) = 1;
  return result;
}

void _citrus_UTF8MAC_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_UTF8MAC_stdenc_mbtocs(uint64_t a1, _DWORD *a2, int *a3, unsigned __int8 **a4, unint64_t a5, void *a6, void *a7, uint64_t a8)
{
  int v15 = 0;
  uint64_t v12 = _citrus_UTF8MAC_mbrtowc_priv(&v15, a4, a5, a6, a7);
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

uint64_t _citrus_UTF8MAC_stdenc_cstomb(uint64_t a1, unsigned char *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }
  else if (a4)
  {
    return 92;
  }
  return _citrus_UTF8MAC_wcrtomb_priv(a2, a3, a5, a7);
}

uint64_t _citrus_UTF8MAC_stdenc_mbtowc(uint64_t a1, int *a2, unsigned __int8 **a3, unint64_t a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_UTF8MAC_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_UTF8MAC_stdenc_wctomb(uint64_t a1, unsigned char *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_UTF8MAC_wcrtomb_priv(a2, a3, a4, a6);
}

uint64_t _citrus_UTF8MAC_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_UTF8MAC_stdenc_get_state_desc(uint64_t a1, void *a2, int a3, int *a4)
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

uint64_t _citrus_UTF8MAC_stdenc_mbtocsn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, unsigned __int8 **a6, unint64_t a7, void *a8, void *a9, void (**a10)(void), void (*a11)(uint64_t), uint64_t a12)
{
  uint64_t v12 = *a6;
  *a9 = 0;
  unint64_t v29 = 0;
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
    __int16 v24 = (__int16)v12;
    int v30 = 0;
    while (1)
    {
      a11(a12);
      uint64_t result = _citrus_UTF8MAC_mbrtowc_priv(&v30, a6, v14, a8, &v29);
      if (result) {
        break;
      }
      unint64_t v19 = v29;
      if (v29 == -2)
      {
        uint64_t result = 0;
        *a9 = -2;
        break;
      }
      int v20 = v30;
      *(_DWORD *)(a2 + 4 * v17) = 0;
      *(_DWORD *)(a3 + 4 * v17) = v20;
      if (v19 > v14) {
        _citrus_UTF8MAC_stdenc_mbtocsn_cold_1();
      }
      v16 += v19;
      *a9 = v16;
      v21 = *a6;
      if (*a6 < v12) {
        _citrus_UTF8MAC_stdenc_mbtocsn_cold_2();
      }
      *(_WORD *)(a4 + 2 * v17) = (_WORD)v21 - v24;
      if (a10 && *a10) {
        (*a10)();
      }
      uint64_t result = 0;
      if (++v17 < v13)
      {
        v22 = &v12[v14];
        uint64_t v12 = v21;
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

uint64_t _citrus_UTF8MAC_stdenc_cstombn(uint64_t a1, unsigned char *a2, unint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, void *a8, uint64_t a9, void (*a10)(uint64_t), uint64_t a11)
{
  unint64_t v23 = 0;
  unint64_t v12 = *a6;
  if ((int)v12 < 1)
  {
    uint64_t v18 = 0;
    LODWORD(v17) = 0;
    uint64_t result = 0;
    goto LABEL_15;
  }
  v22 = a8;
  unint64_t v17 = 0;
  uint64_t v18 = 0;
  while (1)
  {
    a10(a11);
    int v19 = *(_DWORD *)(a4 + 4 * v17);
    if (v19 != -1) {
      break;
    }
    unsigned int v20 = 0;
LABEL_7:
    uint64_t result = _citrus_UTF8MAC_wcrtomb_priv(a2, a3, v20, (uint64_t *)&v23);
    if (!result)
    {
      if (a3 < v23) {
        _citrus_UTF8MAC_stdenc_cstombn_cold_1();
      }
      uint64_t result = 0;
      ++v17;
      v18 += v23;
      a3 -= v23;
      if (a3)
      {
        a2 += v23;
        if (v17 < v12) {
          continue;
        }
      }
    }
    goto LABEL_14;
  }
  if (!v19)
  {
    unsigned int v20 = *(_DWORD *)(a5 + 4 * v17);
    goto LABEL_7;
  }
  uint64_t result = 92;
LABEL_14:
  a8 = v22;
LABEL_15:
  *a6 = v17;
  *a8 = v18;
  return result;
}

uint64_t _citrus_UTF8MAC_stdenc_getops(uint64_t a1)
{
  long long v1 = unk_26BD2F0D0;
  *(_OWORD *)a1 = _citrus_UTF8MAC_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  long long v2 = xmmword_26BD2F0E0;
  long long v3 = *(_OWORD *)&off_26BD2F0F0;
  long long v4 = xmmword_26BD2F100;
  *(void *)(a1 + 80) = off_26BD2F110;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_UTF8MAC_mbrtowc_priv(int *a1, unsigned __int8 **a2, unint64_t a3, void *a4, void *a5)
{
  *(void *)&v43[6] = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if (!*a2)
  {
    uint64_t result = 0;
    *a4 = 0;
    *a5 = 0;
    return result;
  }
  memset(v41, 0, sizeof(v41));
  __int16 v42 = 0;
  v6 = 0;
  if (!a3)
  {
    v7 = v41;
    uint64_t v9 = v5;
    goto LABEL_64;
  }
  v7 = v41;
  v8 = v5;
  do
  {
    if (v7 >= (void *)v43) {
      goto LABEL_72;
    }
    --a3;
    uint64_t v9 = v8 + 1;
    unint64_t v10 = *v8;
    if ((v10 & 0x80) != 0)
    {
      unint64_t v16 = utf_extrabytes[v10 >> 3];
      BOOL v17 = a3 >= v16;
      a3 -= v16;
      if (!v17) {
        goto LABEL_72;
      }
      switch(v16)
      {
        case 3:
          int v24 = *v9;
          if ((v24 & 0xC0) != 0x80) {
            goto LABEL_70;
          }
          int v25 = v8[2];
          if ((v25 & 0xC0) != 0x80) {
            goto LABEL_70;
          }
          int v26 = v8[3];
          if ((v26 & 0xC0) != 0x80) {
            goto LABEL_70;
          }
          unsigned int v27 = v26 + (((v24 << 6) + (v10 << 12) + v25) << 6) - 63512704;
          if (v27 >> 20) {
            goto LABEL_70;
          }
          *(_WORD *)v7 = bswap32((v27 >> 10) - 10240) >> 16;
          if ((char *)v7 + 2 < v43)
          {
            uint64_t v9 = v8 + 4;
            *((_WORD *)v7 + 1) = __rev16(v27 & 0x3FF | 0xDC00);
            v7 = (void *)((char *)v7 + 4);
            goto LABEL_60;
          }
LABEL_72:
          ++*a4;
          goto LABEL_68;
        case 2:
          int v28 = *v9;
          if ((v28 & 0xC0) != 0x80) {
            goto LABEL_70;
          }
          int v29 = v8[2];
          if ((v29 & 0xC0) != 0x80) {
            goto LABEL_70;
          }
          int v30 = (v28 << 6) + (v10 << 12) + v29;
          LODWORD(v10) = v30 - 925824;
          if ((v30 - 925824) < 0x800) {
            goto LABEL_70;
          }
          uint64_t v9 = v8 + 3;
          if (v10 >> 11 >= 0x1B && (v10 < 0xE000 || (v30 & 0x3FFFFE) == 0xF207E)) {
            goto LABEL_70;
          }
          break;
        case 1:
          int v18 = *v9;
          if ((v18 & 0xC0) != 0x80) {
            goto LABEL_70;
          }
          LODWORD(v10) = v18 + (v10 << 6) - 12416;
          if (v10 < 0x80) {
            goto LABEL_70;
          }
          uint64_t v9 = v8 + 2;
          break;
        default:
          goto LABEL_70;
      }
    }
    v11 = v41;
    if (v7 == v41) {
      goto LABEL_59;
    }
    unsigned int v12 = (unsigned __int16)v10;
    if ((unsigned __int16)v10 < 0x300u) {
      break;
    }
    int v13 = __CFUniCharCombiningBitmap[(unint64_t)(unsigned __int16)v10 >> 8];
    if (v13 != 255
      && (!__CFUniCharCombiningBitmap[(unint64_t)(unsigned __int16)v10 >> 8]
       || ((__CFUniCharCombiningBitmap[(v10 >> 3) + 256 + 32 * v13 - 32] >> (v10 & 7)) & 1) == 0))
    {
      break;
    }
    v11 = (_WORD *)v7 - 1;
    unsigned int v14 = bswap32(*((unsigned __int16 *)v7 - 1)) >> 16;
    if ((unsigned __int16)(v10 - 4449) > 0x61u)
    {
      if ((unsigned __int16)(v10 - 12443) < 0xD265u) {
        break;
      }
    }
    else
    {
      if ((unsigned __int16)((unsigned __int16)v10 >> 1) <= 0x8BAu && (unsigned __int16)(v14 - 4352) <= 0x12u)
      {
        unsigned __int16 v15 = 588 * v14 + 28 * v10 - 18076;
        goto LABEL_58;
      }
      if ((unsigned __int16)((unsigned __int16)v10 >> 3) >= 0x235u
        && (unsigned __int16)((unsigned __int16)(v14 + 21504) >> 2) <= 0xAE8u)
      {
        HIDWORD(v23) = -1227133513 * v14 - 1840706560;
        LODWORD(v23) = HIDWORD(v23);
        if ((v23 >> 2) <= 0x9249249)
        {
          unsigned __int16 v15 = v10 + v14 - 4519;
          goto LABEL_58;
        }
        break;
      }
    }
    int v19 = (unsigned int *)&unk_263644F70;
    unsigned int v20 = (unsigned int *)&__CFUniCharPrecompSourceTable;
    while (1)
    {
      uint64_t v21 = ((char *)v19 - (char *)v20) >> 4;
      v22 = &v20[2 * v21];
      if (*v22 <= v12) {
        break;
      }
      int v19 = v22 - 2;
LABEL_29:
      if (v20 > v19) {
        goto LABEL_64;
      }
    }
    if (*v22 < v12)
    {
      unsigned int v20 = v22 + 2;
      goto LABEL_29;
    }
    unsigned int v31 = v20[2 * v21 + 1];
    if (!v31) {
      break;
    }
    v32 = (char *)&__CFUniCharBMPPrecompDestinationTable + 4 * (unsigned __int16)v31;
    if (*(unsigned __int16 *)v32 > v14) {
      break;
    }
    v33 = (unsigned __int16 *)&v32[4 * HIWORD(v31) - 4];
    if (*v33 < v14) {
      break;
    }
LABEL_51:
    uint64_t v34 = ((char *)v33 - v32) >> 3;
    v35 = (unsigned __int16 *)&v32[4 * v34];
    unsigned int v36 = *v35;
    if (v36 > v14)
    {
      v33 = v35 - 2;
      goto LABEL_55;
    }
    if (v36 < v14)
    {
      v32 = (char *)(v35 + 2);
LABEL_55:
      if (v32 > (char *)v33) {
        break;
      }
      goto LABEL_51;
    }
    unsigned __int16 v15 = *(_WORD *)&v32[4 * v34 + 2];
    if (!v15) {
      break;
    }
LABEL_58:
    LODWORD(v10) = v15;
LABEL_59:
    _WORD *v11 = bswap32(v10) >> 16;
    v7 = v11 + 1;
    v6 = v9;
LABEL_60:
    v8 = v9;
  }
  while (a3);
LABEL_64:
  if (v6) {
    v38 = v6;
  }
  else {
    v38 = v9;
  }
  if ((unint64_t)((char *)v7 - (char *)v41) < 2)
  {
LABEL_68:
    uint64_t result = 0;
    *a5 = -2;
    return result;
  }
  char v39 = v41[0];
  *a1 = BYTE1(v41[0]) | (LOBYTE(v41[0]) << 8);
  if ((v39 & 0xF8) == 0xD8)
  {
LABEL_70:
    *a5 = -1;
    return 92;
  }
  else
  {
    uint64_t result = 0;
    uint64_t v40 = v38 - v5;
    *a5 = v40;
    *a2 = &v5[v40];
    *a4 = 0;
  }
  return result;
}

uint64_t _citrus_UTF8MAC_wcrtomb_priv(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t result = 92;
  uint64_t v7 = -1;
  if (a3 == 65279 || a3 == 65534) {
    goto LABEL_36;
  }
  if (a3 >> 11 == 27) {
    goto LABEL_35;
  }
  uint64_t v8 = 0;
  int v9 = 0;
  unint64_t v10 = 0;
  __int16 v26 = bswap32(a3) >> 16;
  unint64_t v11 = (unint64_t)&a1[a2];
  unsigned int v12 = (unsigned __int16 *)&v26;
  int v13 = a1;
  while (1)
  {
    if (v9 < 1)
    {
      unsigned int v16 = *v12++;
      unint64_t v14 = bswap32(v16) >> 16;
      if (v14 >= 0xC0)
      {
        int v17 = __CFUniCharDecomposableBitmap[v14 >> 8];
        if (!__CFUniCharDecomposableBitmap[v14 >> 8]
          || v17 != 255
          && ((__CFUniCharDecomposableBitmap[(v14 >> 3) + 256 + 32 * v17 - 32] >> (v14 & 7)) & 1) == 0)
        {
          goto LABEL_20;
        }
        unsigned __int16 v18 = v14 + 21504;
        if ((unsigned __int16)(v14 + 21504) > 0x2BA4u)
        {
          int v20 = unicode_recursive_decompose(v14, &v27);
          LODWORD(v14) = v27;
        }
        else
        {
          __int16 v19 = (unsigned __int16)(v14 + 21504) % 0x1Cu;
          LODWORD(v14) = ((28533 * (unsigned __int16)(v14 + 21504)) >> 24) | 0x1100;
          unsigned __int16 v27 = ((28533 * v18) >> 24) | 0x1100;
          v28[0] = v18 % 0x24Cu / 0x1C + 4449;
          if (v18 % 0x1Cu)
          {
            v28[1] = v19 + 4519;
            int v20 = 3;
          }
          else
          {
            int v20 = 2;
          }
        }
        int v9 = v20 - 1;
        v8 += v20 - 1;
        unint64_t v10 = v28;
      }
    }
    else
    {
      int v15 = *v10++;
      LODWORD(v14) = v15;
      --v9;
    }
    if (v14 < 0x80)
    {
      if ((unint64_t)v13 >= v11) {
        goto LABEL_34;
      }
      *v13++ = v14;
      goto LABEL_32;
    }
LABEL_20:
    if (v14 <= 0x7FF)
    {
      if ((unint64_t)(v13 + 1) >= v11) {
        goto LABEL_34;
      }
      *int v13 = (v14 >> 6) | 0xC0;
      v13[1] = v14 & 0x3F | 0x80;
      v13 += 2;
      goto LABEL_32;
    }
    if (v14 >> 10 != 54 || v8 == 0) {
      break;
    }
    unsigned int v22 = bswap32(*v12);
    if (v22 >> 26 != 55) {
      break;
    }
    if ((unint64_t)(v13 + 3) >= v11) {
      goto LABEL_34;
    }
    unsigned int v23 = HIWORD(v22);
    unsigned int v24 = v23 + (v14 << 10) - 56613888;
    --v8;
    ++v12;
    *int v13 = (v24 >> 18) | 0xF0;
    v13[1] = (v24 >> 12) & 0x3F | 0x80;
    v13[2] = (v24 >> 6) & 0x3F | 0x80;
    v13[3] = v23 & 0x3F | 0x80;
    v13 += 4;
LABEL_32:
    if (!v8--)
    {
      uint64_t result = 0;
      uint64_t v7 = v13 - a1;
      goto LABEL_36;
    }
  }
  if ((unint64_t)(v13 + 2) < v11)
  {
    *int v13 = (v14 >> 12) | 0xE0;
    v13[1] = (v14 >> 6) & 0x3F | 0x80;
    v13[2] = v14 & 0x3F | 0x80;
    v13 += 3;
    goto LABEL_32;
  }
LABEL_34:
  uint64_t result = 7;
LABEL_35:
  uint64_t v7 = -1;
LABEL_36:
  *a4 = v7;
  return result;
}

uint64_t unicode_recursive_decompose(unsigned int a1, _WORD *a2)
{
  long long v2 = a2;
  if ((unsigned __int16)(a1 + 1201) < 0x571u)
  {
LABEL_8:
    unsigned int v8 = 0;
    goto LABEL_9;
  }
  long long v3 = (unsigned __int16 *)&__CFUniCharDecompositionTable;
  long long v4 = (unsigned __int16 *)&unk_263647030;
  while (1)
  {
    uint64_t v5 = ((char *)v4 - (char *)v3) >> 3;
    v6 = &v3[2 * v5];
    unsigned int v7 = *v6;
    if (v7 <= a1) {
      break;
    }
    long long v4 = v6 - 2;
LABEL_7:
    if (v3 > v4) {
      goto LABEL_8;
    }
  }
  if (v7 < a1)
  {
    long long v3 = v6 + 2;
    goto LABEL_7;
  }
  unsigned int v8 = v3[2 * v5 + 1];
LABEL_9:
  int v9 = (v8 >> 12) & 7;
  __int16 v15 = v8 & 0xFFF;
  unint64_t v10 = (char *)&__CFUniCharMultipleDecompositionTable + 2 * (v8 & 0xFFF);
  unint64_t v11 = (unsigned __int16 *)&v15;
  if (v9 != 1) {
    unint64_t v11 = (unsigned __int16 *)((char *)&__CFUniCharMultipleDecompositionTable + 2 * (v8 & 0xFFF));
  }
  if ((v8 & 0x8000) == 0)
  {
    LODWORD(result) = 0;
    goto LABEL_17;
  }
  uint64_t result = unicode_recursive_decompose(*v11, a2);
  if (result)
  {
    --v9;
    int v13 = &v15;
    if (v9) {
      int v13 = (__int16 *)v10;
    }
    unint64_t v11 = (unsigned __int16 *)(v13 + 1);
    v2 += result;
LABEL_17:
    for (uint64_t result = (result + v9); v9; --v9)
    {
      __int16 v14 = *v11++;
      *v2++ = v14;
    }
  }
  return result;
}

void _citrus_UTF8MAC_stdenc_mbtocsn_cold_1()
{
  __assert_rtn("_citrus_UTF8MAC_stdenc_mbtocsn", "citrus_stdenc_template.h", 219, "accum <= n");
}

void _citrus_UTF8MAC_stdenc_mbtocsn_cold_2()
{
  __assert_rtn("_citrus_UTF8MAC_stdenc_mbtocsn", "citrus_stdenc_template.h", 221, "*s >= last");
}

void _citrus_UTF8MAC_stdenc_cstombn_cold_1()
{
  __assert_rtn("_citrus_UTF8MAC_stdenc_cstombn", "citrus_stdenc_template.h", 265, "tmp <= n");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void free(void *a1)
{
}