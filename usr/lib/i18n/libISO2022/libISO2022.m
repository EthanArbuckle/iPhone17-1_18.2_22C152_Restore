uint64_t _citrus_ISO2022_stdenc_init(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  unsigned int v9;
  const char *v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  char v16;
  uint64_t v17;
  const char *v18;
  char v19;
  int v20;
  BOOL v21;
  BOOL v22;
  char v23;
  char v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t result;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unsigned char __str[6];
  __int16 __c_2;
  char v39;
  char v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x263EF8340];
  v7 = malloc_type_calloc(1uLL, 0x58uLL, 0x10200402AC5C75EuLL);
  if (!v7) {
    return *__error();
  }
  v8 = v7;
  if (a2)
  {
    v35 = a1;
    v36 = a4;
    v7[10] = 0;
    *(_OWORD *)v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    v9 = *(unsigned __int8 *)a2;
    if (*a2)
    {
      v34 = 0;
      while (1)
      {
        v10 = a2;
        while (v9 == 9 || v9 == 32)
        {
          v11 = *(unsigned __int8 *)++v10;
          v9 = v11;
          ++a2;
        }
        v12 = 0;
        while (v9 > 0x20 || ((1 << v9) & 0x100000201) == 0)
          v9 = v10[++v12];
        if (!v12) {
          goto LABEL_96;
        }
        if (v12 > 0x13) {
          goto LABEL_97;
        }
        snprintf(__str, 0x14uLL, "%.*s", v12, v10);
        v13 = __str[0];
        if (memchr("0123", __str[0], 5uLL))
        {
          if (__str[1] == 61) {
            break;
          }
        }
        if (*(_DWORD *)__str == 1414090313 && (v20 = __str[4], memchr("0123", __str[4], 5uLL)) && __str[5] == 61)
        {
          v21 = __c_2 == 13369 && v39 == 36;
          if (v21 && (v23 = v40) != 0 && !v41)
          {
            v24 = 2;
          }
          else
          {
            v22 = __c_2 == 13881 && v39 == 36;
            if (v22 && (v23 = v40) != 0 && !v41)
            {
              v24 = 3;
            }
            else if (__c_2 != 13369 || (v23 = v39) == 0 || (v24 = v40) != 0)
            {
              if (__c_2 != 13881 || (v23 = v39) == 0 || v40)
              {
LABEL_97:
                free((void *)*v8);
                free((void *)v8[1]);
                free((void *)v8[2]);
                free((void *)v8[3]);
                goto LABEL_98;
              }
              v24 = 1;
            }
          }
          v32 = (char *)v8 + 4 * v20;
          *(v32 - 128) = v24;
          *(v32 - 127) = v23;
          *((_WORD *)v32 - 63) = 0;
        }
        else
        {
          if (*(_DWORD *)__str ^ 0x3158414D | __str[4])
          {
            if (*(_DWORD *)__str ^ 0x3258414D | __str[4])
            {
              if (*(_DWORD *)__str ^ 0x3358414D | __str[4])
              {
                v17 = 0;
                v18 = "DUMMY";
                while (strcmp(__str, v18))
                {
                  v18 = (&get_flags_tags)[v17 + 2];
                  v17 += 2;
                  if (v17 == 32) {
                    goto LABEL_97;
                  }
                }
                v34 |= LODWORD((&get_flags_tags)[v17 + 1]);
                *((_DWORD *)v8 + 21) = v34;
                goto LABEL_87;
              }
              v25 = 3;
            }
            else
            {
              v25 = 2;
            }
          }
          else
          {
            v25 = 1;
          }
          *((_DWORD *)v8 + 20) = v25;
        }
LABEL_87:
        a2 = &v10[v12];
        v9 = v10[v12];
        if (!v10[v12]) {
          goto LABEL_96;
        }
      }
      if (*(unsigned __int16 *)&__str[2] == 13369 && __str[4] == 36)
      {
        v19 = __str[5];
        if (__str[5])
        {
          if (!(_BYTE)__c_2)
          {
            v16 = 2;
LABEL_81:
            v27 = v13 - 48;
            v28 = (void *)v8[v27];
            if (v28)
            {
              v29 = v8[v27 + 4];
              v30 = (char *)malloc_type_realloc(v28, 4 * v29 + 4, 0x100004052888210uLL);
              if (!v30) {
                goto LABEL_97;
              }
              v8[v27] = v30;
            }
            else
            {
              v30 = (char *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
              v8[v27] = v30;
              if (!v30) {
                goto LABEL_97;
              }
              v29 = v8[v27 + 4];
            }
            v8[v27 + 4] = v29 + 1;
            v31 = &v30[4 * v29];
            v31[1] = v19;
            *((_WORD *)v31 + 1) = 0;
            *v31 = v16;
            goto LABEL_87;
          }
        }
      }
      if (*(unsigned __int16 *)&__str[2] == 13881 && __str[4] == 36)
      {
        v19 = __str[5];
        if (__str[5])
        {
          if (!(_BYTE)__c_2)
          {
            v16 = 3;
            goto LABEL_81;
          }
        }
      }
      if (*(unsigned __int16 *)&__str[2] == 13369)
      {
        v19 = __str[4];
        if (__str[4])
        {
          if (!__str[5])
          {
            v16 = 0;
            goto LABEL_81;
          }
        }
      }
      if (*(unsigned __int16 *)&__str[2] == 13881)
      {
        v19 = __str[4];
        if (__str[4])
        {
          if (!__str[5])
          {
            v16 = 1;
            goto LABEL_81;
          }
        }
      }
      if (*(unsigned __int16 *)&__str[2] ^ 0x3439 | __str[4])
      {
        if (*(unsigned __int16 *)&__str[2] ^ 0x3639 | __str[4])
        {
          if (*(_DWORD *)&__str[2] == 2372665)
          {
            v16 = 2;
          }
          else
          {
            if (*(_DWORD *)&__str[2] != 2373177) {
              goto LABEL_97;
            }
            v16 = 3;
          }
          v26 = 5;
          goto LABEL_80;
        }
        v16 = 1;
      }
      else
      {
        v16 = 0;
      }
      v26 = 4;
LABEL_80:
      v19 = __str[v26];
      goto LABEL_81;
    }
LABEL_96:
    result = 0;
    *(void *)(v35 + 8) = v8;
    *(_OWORD *)v36 = xmmword_26363AA60;
    *(void *)(v36 + 16) = 1;
  }
  else
  {
LABEL_98:
    free(v8);
    return 79;
  }
  return result;
}

void _citrus_ISO2022_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_ISO2022_stdenc_init_state(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v3 + 84)) {
    __int16 v4 = 8;
  }
  else {
    __int16 v4 = 56;
  }
  *(_WORD *)(a2 + 16) = v4 | *(_WORD *)(a2 + 16) & 0xFFC0;
  uint64_t v5 = v3 + 66;
  do
  {
    v6 = (unsigned char *)(v5 + v2);
    char v7 = *(unsigned char *)(v5 + v2 - 1);
    if (v7)
    {
      v8 = (unsigned char *)(a2 + 1 + v2);
      *(v8 - 1) = *(v6 - 2);
      unsigned char *v8 = v7;
      v8[1] = *v6;
    }
    v2 += 4;
  }
  while (v2 != 16);
  *(_WORD *)(a2 + 16) |= 0xFC0u;
  *(_DWORD *)(a2 + 40) |= 1u;
  return 0;
}

uint64_t _citrus_ISO2022_stdenc_mbtocs(uint64_t a1, int *a2, unsigned int *a3, char **a4, unint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  int v20 = 0;
  uint64_t v12 = _citrus_ISO2022_mbrtowc_priv(*(void *)(a1 + 8), &v20, a4, a5, a6, a7);
  if (!v12)
  {
    if (*a7 != -2)
    {
      if ((v20 & 0x800000) != 0) {
        int v13 = 2147451008;
      }
      else {
        int v13 = 2130739328;
      }
      int v14 = v13 & v20;
      if ((v20 & 0x800000) != 0) {
        int v15 = 32639;
      }
      else {
        int v15 = 8355711;
      }
      unsigned int v16 = v15 & v20;
      if ((v20 & 0x7F00) != 0) {
        int v17 = v14 | 0x7F00;
      }
      else {
        int v17 = v14;
      }
      int v18 = v14 | 0x7F0000;
      if (v16 >= 0x10000) {
        int v17 = v18;
      }
      *a2 = v17;
      *a3 = v16;
    }
    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }
  return v12;
}

uint64_t _citrus_ISO2022_stdenc_cstomb(uint64_t a1, void *a2, size_t a3, int a4, int a5, uint64_t a6, size_t *a7)
{
  if (a4 == -1) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = a4 & 0x7F808080 | a5;
  }
  return _citrus_ISO2022_wcrtomb_priv(*(void *)(a1 + 8), a2, a3, v7, a6, a7);
}

uint64_t _citrus_ISO2022_stdenc_mbtowc(uint64_t a1, _DWORD *a2, char **a3, unint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_ISO2022_mbrtowc_priv(*(void *)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_ISO2022_stdenc_wctomb(uint64_t a1, void *a2, size_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  return _citrus_ISO2022_wcrtomb_priv(*(void *)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t _citrus_ISO2022_stdenc_put_state_reset(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, size_t *a5)
{
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v13 = 0;
  unint64_t v11 = 0;
  uint64_t result = _ISO2022_sputwchar(v8, 0, __src, &v13, a4, (uint64_t *)&v11);
  size_t v10 = v11;
  if (!result)
  {
    if (v11 <= 6 && (size_t v10 = v11 - 1, v11 - 1 <= a3))
    {
      memcpy(a2, __src, v10);
      uint64_t result = 0;
    }
    else
    {
      uint64_t result = 7;
      size_t v10 = -1;
    }
  }
  *a5 = v10;
  return result;
}

uint64_t _citrus_ISO2022_stdenc_get_state_desc(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  if (a3) {
    return 102;
  }
  if (*(void *)(a2 + 32))
  {
    if (*(unsigned char *)(a2 + 18) == 27) {
      int v5 = 4;
    }
    else {
      int v5 = 3;
    }
  }
  else
  {
    int v5 = 2;
  }
  uint64_t result = 0;
  *a4 = v5;
  return result;
}

uint64_t _citrus_ISO2022_stdenc_getops(uint64_t a1)
{
  long long v1 = *(_OWORD *)&off_26BD2EE68;
  *(_OWORD *)a1 = _citrus_ISO2022_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  long long v2 = xmmword_26BD2EE78;
  long long v3 = *(_OWORD *)&off_26BD2EE88;
  long long v4 = xmmword_26BD2EE98;
  *(void *)(a1 + 80) = qword_26BD2EEA8;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_ISO2022_mbrtowc_priv(uint64_t a1, _DWORD *a2, char **a3, unint64_t a4, uint64_t a5, uint64_t *a6)
{
  v6 = a6;
  uint64_t v8 = *a3;
  if (*a3)
  {
    unint64_t v9 = *(void *)(a5 + 32);
    if (v9 >= 8)
    {
      v43 = a6;
      uint64_t v10 = 0;
      *(_OWORD *)(a5 + 16) = 0u;
      *(_OWORD *)(a5 + 32) = 0u;
      *(_OWORD *)a5 = 0u;
      if (*(_DWORD *)(a1 + 84)) {
        __int16 v11 = 8;
      }
      else {
        __int16 v11 = 56;
      }
      *(_WORD *)(a5 + 16) = v11 | *(_WORD *)(a5 + 16) & 0xFFC0;
      uint64_t v12 = a1 + 66;
      do
      {
        uint64_t v13 = (unsigned char *)(v12 + v10);
        char v14 = *(unsigned char *)(v12 + v10 - 1);
        if (v14)
        {
          int v15 = (unsigned char *)(a5 + 1 + v10);
          *(v15 - 1) = *(v13 - 2);
          *int v15 = v14;
          v15[1] = *v13;
        }
        v10 += 4;
      }
      while (v10 != 16);
      *(_WORD *)(a5 + 16) |= 0xFC0u;
      *(_DWORD *)(a5 + 40) |= 1u;
LABEL_11:
      *(void *)(a5 + 32) = 0;
      uint64_t result = 92;
      uint64_t v17 = -1;
      v6 = v43;
      goto LABEL_51;
    }
    __src = 0;
    if (v9)
    {
      v43 = a6;
      int v27 = 0;
      uint64_t v28 = a5 + 18;
      v29 = (char *)(a5 + 18);
      while (1)
      {
        unint64_t v30 = *(void *)(a5 + 32);
        if (v30 > 6) {
          goto LABEL_11;
        }
        if (a4)
        {
          char v31 = *v8++;
          *(void *)(a5 + 32) = v30 + 1;
          *(unsigned char *)(a5 + v30 + 18) = v31;
          --a4;
          unint64_t v30 = *(void *)(a5 + 32);
        }
        int v32 = _ISO2022_sgetwchar(v29, v28 - (void)v29 + v30, &__src, a5);
        v33 = (char *)((unsigned char *)__src - v29);
        v27 += __src - v29;
        if (v32 != -1)
        {
          int v39 = v32;
          unint64_t v40 = *(void *)(a5 + 32);
          if (v40 > v27)
          {
            memmove((void *)(a5 + 18), __src, v40 - v27);
            unint64_t v40 = *(void *)(a5 + 32);
          }
          BOOL v41 = v40 >= v27;
          unint64_t v42 = v40 - v27;
          if (!v41) {
            unint64_t v42 = 0;
          }
          v6 = v43;
          goto LABEL_40;
        }
        v29 = (char *)__src;
        if (!a4)
        {
          if (v33 == *(char **)(a5 + 32))
          {
            unint64_t v34 = 0;
            v35 = v8;
            goto LABEL_47;
          }
          v35 = v8;
          goto LABEL_49;
        }
      }
    }
    int v36 = 0;
    while (1)
    {
      int v37 = _ISO2022_sgetwchar(v8, a4, &__src, a5);
      v35 = (char *)__src;
      if (v37 != -1) {
        break;
      }
      int64_t v38 = (unsigned char *)__src - v8;
      if (__src <= v8)
      {
        v43 = v6;
        unint64_t v34 = a4 + v36;
        if (v34 > 6) {
          goto LABEL_11;
        }
        memcpy((void *)(a5 + 18), &v8[-v36], a4 + v36);
LABEL_47:
        *(void *)(a5 + 32) = v34;
LABEL_49:
        v6 = v43;
LABEL_50:
        uint64_t result = 0;
        *a3 = v35;
        uint64_t v17 = -2;
        goto LABEL_51;
      }
      v36 += v38;
      uint64_t v8 = (char *)__src;
      a4 -= v38;
      if (!a4) {
        goto LABEL_50;
      }
    }
    int v39 = v37;
    unint64_t v42 = 0;
    int v27 = __src - v8 + v36;
    uint64_t v8 = (char *)__src;
LABEL_40:
    *(void *)(a5 + 32) = v42;
    *a3 = v8;
    if (a2) {
      *a2 = v39;
    }
    uint64_t result = 0;
    uint64_t v17 = v27 - (int)v9;
    if (!v39) {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
    *(_OWORD *)(a5 + 16) = 0u;
    *(_OWORD *)(a5 + 32) = 0u;
    *(_OWORD *)a5 = 0u;
    if (*(_DWORD *)(a1 + 84)) {
      __int16 v19 = 8;
    }
    else {
      __int16 v19 = 56;
    }
    *(_WORD *)(a5 + 16) = v19 | *(_WORD *)(a5 + 16) & 0xFFC0;
    uint64_t v20 = a1 + 66;
    do
    {
      v21 = (unsigned char *)(v20 + v18);
      char v22 = *(unsigned char *)(v20 + v18 - 1);
      if (v22)
      {
        v23 = (unsigned char *)(a5 + 1 + v18);
        *(v23 - 1) = *(v21 - 2);
        unsigned char *v23 = v22;
        v23[1] = *v21;
      }
      v18 += 4;
    }
    while (v18 != 16);
    uint64_t result = 0;
    *(_WORD *)(a5 + 16) |= 0xFC0u;
    *(_DWORD *)(a5 + 40) |= 1u;
    uint64_t v17 = 1;
  }
LABEL_51:
  uint64_t *v6 = v17;
  return result;
}

uint64_t _ISO2022_sgetwchar(char *a1, unint64_t a2, void *a3, uint64_t a4)
{
  while (1)
  {
    while (1)
    {
LABEL_1:
      if (!a2) {
        goto LABEL_11;
      }
      int v8 = *a1;
      if (v8 == 14)
      {
        __int16 v10 = *(_WORD *)(a4 + 16) & 0xFFF8 | 1;
        goto LABEL_9;
      }
      uint64_t v9 = *a1;
      if (v9 != 15) {
        break;
      }
      __int16 v10 = *(_WORD *)(a4 + 16) & 0xFFF8;
LABEL_9:
      *(_WORD *)(a4 + 16) = v10;
      ++a1;
      --a2;
    }
    if (!*a1) {
      goto LABEL_101;
    }
    if (memchr("\x8F\x8E", v8, 3uLL))
    {
      __int16 v10 = *(_WORD *)(a4 + 16) & 0xF03F | ((((_BYTE)v9 + 4) & 7) << 9) | ((((_BYTE)v9 + 4) & 7) << 6);
      goto LABEL_9;
    }
    if (v9 != 27) {
      goto LABEL_47;
    }
LABEL_11:
    int v11 = 3;
    uint64_t v12 = &seqtable;
    while (1)
    {
      int v13 = seqmatch(a1, a2, (uint64_t)v12);
      if (a2 >= v11 && v11 == v13) {
        break;
      }
      int v11 = v12[21];
      v12 += 16;
      if (!v11) {
        goto LABEL_38;
      }
    }
    uint64_t v14 = *v12;
    if (v14 == -1) {
      break;
    }
    uint64_t v15 = v12[1];
    if (v15 == -1)
    {
      uint64_t v16 = 0;
    }
    else
    {
      if (v14 > 3) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v16 = qword_26363AEB0[v14] + a1[v15];
    }
    __int16 v19 = (unsigned char *)(a4 + 4 * v16);
    *__int16 v19 = v14;
    uint64_t v20 = v19 + 2;
    *(_WORD *)(v19 + 1) = 0;
    v21 = v19 + 1;
    v19[3] = 0;
    char v22 = v19 + 3;
    uint64_t v23 = v12[2];
    if (v23 != -1) {
      unsigned char *v21 = a1[v23];
    }
    uint64_t v24 = v12[3];
    if (v24 != -1) {
      *uint64_t v20 = a1[v24];
    }
    uint64_t v25 = v12[4];
    if (v25 != -1) {
      *char v22 = a1[v25];
    }
    a1 += v11;
    a2 -= v11;
  }
  if (a2 >= 2 && *a1 == 27)
  {
    int v17 = a1[1];
    if (a1[1])
    {
      if (memchr("no", a1[1], 3uLL))
      {
        __int16 v18 = *(_WORD *)(a4 + 16) & 0xFFF8 | (v17 + 4) & 7;
LABEL_37:
        *(_WORD *)(a4 + 16) = v18;
        a1 += 2;
        a2 -= 2;
        goto LABEL_1;
      }
      if (memchr("~}|", v17, 4uLL))
      {
        __int16 v18 = *(_WORD *)(a4 + 16) & 0xFFC7 | (56 - 8 * (_BYTE)v17) & 0x38;
        goto LABEL_37;
      }
      if (memchr("NO", v17, 3uLL))
      {
        __int16 v18 = *(_WORD *)(a4 + 16) & 0xFE3F | ((((_BYTE)v17 + 4) & 7) << 6);
        goto LABEL_37;
      }
    }
  }
LABEL_38:
  v26 = &seqtable;
  int v27 = 3;
  do
  {
    int v28 = seqmatch(a1, a2, (uint64_t)v26);
    if (v28)
    {
      if (a2 >= v27)
      {
        if (v28 == v27) {
          break;
        }
      }
      else if (a2 == v28)
      {
        goto LABEL_74;
      }
    }
    int v27 = v26[21];
    v26 += 16;
  }
  while (v27);
  if (!a2)
  {
LABEL_74:
    if (a3) {
      *a3 = a1;
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *a1;
LABEL_47:
  if (v9 < 0x20 || (v9 - 127) < 0x21u) {
    goto LABEL_101;
  }
  int v29 = *(unsigned __int16 *)(a4 + 16);
  char v30 = 4;
  if ((v9 & 0x80u) == 0) {
    char v30 = 7;
  }
  int v31 = v29 << v30 << 16 >> 29;
  char v32 = 10;
  if ((v9 & 0x80u) == 0) {
    char v32 = 13;
  }
  int v33 = v29 << v32 << 16 >> 29;
  if (v31 == -1) {
    int v31 = v33;
  }
  if (v31 == -1)
  {
LABEL_101:
    if (a3) {
      *a3 = a1 + 1;
    }
    __int16 v50 = *(_WORD *)(a4 + 16) | 0xFC0;
    goto LABEL_104;
  }
  uint64_t v34 = (__int16)v31;
  int v35 = *(unsigned __int8 *)(a4 + 4 * (__int16)v31);
  if ((v35 & 0xFE) != 2) {
    goto LABEL_64;
  }
  if ((*(unsigned char *)(a4 + 4 * v34 + 1) & 0xF0) != 0x60)
  {
    if (a2 >= 2 && ((a1[1] ^ v9) & 0x80) == 0) {
      goto LABEL_64;
    }
    goto LABEL_74;
  }
  if (a2 < 3 || (v9 & 0x80) != (a1[1] & 0x80) || (v9 & 0x80) != (a1[2] & 0x80)) {
    goto LABEL_74;
  }
LABEL_64:
  switch(v35)
  {
    case 0:
      if (((v9 & 0x7F) - 33) >= 0x5Eu) {
        goto LABEL_101;
      }
      uint64_t v36 = a4 + 4 * v34;
      int v37 = *(unsigned __int8 *)(v36 + 1);
      int v38 = *(unsigned __int8 *)(v36 + 2);
      if (v37 == 66 && v38 == 0)
      {
        ++a1;
        v9 &= 0x7Fu;
      }
      else
      {
        if (v38) {
          int v40 = (v38 << 16) | 0x800000;
        }
        else {
          int v40 = 0;
        }
        ++a1;
        uint64_t v9 = v40 | (v37 << 24) | (v9 & 0x7F);
      }
      break;
    case 1:
      if ((v9 & 0x60) == 0) {
        goto LABEL_101;
      }
      uint64_t v45 = a4 + 4 * v34;
      int v46 = *(unsigned __int8 *)(v45 + 1);
      int v47 = *(unsigned __int8 *)(v45 + 2);
      if (v46 == 65 && v47 == 0)
      {
        ++a1;
        uint64_t v9 = v9 | 0x80;
      }
      else
      {
        if (v47) {
          int v49 = (v47 << 16) | 0x800000;
        }
        else {
          int v49 = 0;
        }
        ++a1;
        uint64_t v9 = v49 | (v46 << 24) | v9 | 0x80;
      }
      break;
    case 2:
      int v41 = v9 & 0x7F;
      if (((v9 & 0x7F) - 33) > 0x5Du || (a1[1] & 0x7Fu) - 33 >= 0x5E) {
        goto LABEL_101;
      }
      goto LABEL_83;
    case 3:
      if ((v9 & 0x60) == 0 || (a1[1] & 0x60) == 0) {
        goto LABEL_101;
      }
      int v41 = v9 & 0x7F;
LABEL_83:
      int v42 = *(unsigned __int8 *)(a4 + 4 * v34 + 1);
      if ((v42 & 0xF0) == 0x60) {
        v43 = a1 + 1;
      }
      else {
        v43 = a1;
      }
      if ((v42 & 0xF0) != 0x60) {
        int v41 = 0;
      }
      a1 = v43 + 2;
      unsigned int v44 = (v42 << 24) | (v41 << 16) | ((*v43 & 0x7F) << 8) | v43[1] & 0x7F;
      if (v35 == 3) {
        uint64_t v9 = v44 | 0x80;
      }
      else {
        uint64_t v9 = v44;
      }
      break;
    default:
      uint64_t v9 = 0;
      break;
  }
  if (a3) {
    *a3 = a1;
  }
  __int16 v50 = v29 | 0xFC0;
LABEL_104:
  *(_WORD *)(a4 + 16) = v50;
  return v9;
}

uint64_t seqmatch(unsigned char *a1, unint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = 24;
  while (2)
  {
    if (v6 < v7)
    {
      int v9 = *(_DWORD *)(a3 + v8);
      switch(v9)
      {
        case -3:
          int v10 = (char)*a1;
          if (*a1)
          {
            int v11 = "@AB";
            size_t v12 = 4;
            goto LABEL_18;
          }
          break;
        case -2:
          if ((*a1 & 0xF0) == 0x20) {
            goto LABEL_19;
          }
          break;
        case -1:
          if ((char)*a1 > 47) {
            goto LABEL_19;
          }
          break;
        case 0:
          int v10 = (char)*a1;
          if (*a1)
          {
            int v11 = "()*+";
            goto LABEL_17;
          }
          break;
        case 1:
          int v10 = (char)*a1;
          if (*a1)
          {
            int v11 = ",-./";
LABEL_17:
            size_t v12 = 5;
LABEL_18:
            if (memchr(v11, v10, v12)) {
              goto LABEL_19;
            }
          }
          break;
        default:
          if (v9 == (char)*a1)
          {
LABEL_19:
            ++a1;
            uint64_t v6 = (v8 - 20) >> 2;
            v8 += 4;
            if (v6 < a2) {
              continue;
            }
          }
          break;
      }
    }
    return v6;
  }
}

uint64_t _citrus_ISO2022_wcrtomb_priv(uint64_t a1, void *a2, size_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  uint64_t v14 = 0;
  size_t __n = 0;
  uint64_t result = _ISO2022_sputwchar(a1, a4, __src, &v14, a5, (uint64_t *)&__n);
  size_t v10 = __n;
  if (!result)
  {
    if (__n > 6 || __n > a3)
    {
      uint64_t result = 7;
      size_t v10 = -1;
    }
    else
    {
      memcpy(a2, __src, __n);
      uint64_t result = 0;
    }
  }
  *a6 = v10;
  return result;
}

uint64_t _ISO2022_sputwchar(uint64_t a1, unsigned int a2, char *__dst, void *a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v7 = a1;
  unsigned int v8 = a2;
  if (a2 > 0x1Fu)
  {
    if ((char)a2 > -97)
    {
      if (a2 > 0xFF)
      {
        int v10 = HIBYTE(a2) & 0x7F;
        int v11 = HIWORD(a2) & ((int)(a2 << 8) >> 31) & 0x7F;
        if ((a2 & 0x7F00) != 0) {
          char v12 = 3;
        }
        else {
          char v12 = 1;
        }
        if ((a2 & 0x80) != 0) {
          LOBYTE(v9) = v12;
        }
        else {
          LOBYTE(v9) = 2 * ((a2 & 0x7F00) != 0);
        }
      }
      else
      {
        LOBYTE(v11) = 0;
        unsigned int v9 = (a2 & 0x80) >> 7;
        if ((a2 & 0x80) != 0) {
          LOBYTE(v10) = 65;
        }
        else {
          LOBYTE(v10) = 66;
        }
      }
      goto LABEL_20;
    }
    if (!*(unsigned char *)(a1 + 69))
    {
      LOBYTE(v11) = 0;
      LOBYTE(v9) = 1;
      LOBYTE(v10) = 65;
      goto LABEL_20;
    }
    unsigned int v9 = *(_DWORD *)(a1 + 68);
  }
  else
  {
    if (!*(unsigned char *)(a1 + 65))
    {
      LOBYTE(v11) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v10) = 66;
      goto LABEL_20;
    }
    unsigned int v9 = *(_DWORD *)(a1 + 64);
  }
  int v10 = v9 >> 8;
  int v11 = HIWORD(v9);
LABEL_20:
  uint64_t v13 = 0;
  while (1)
  {
    uint64_t v14 = (void *)(a1 + 8 * v13);
    uint64_t v15 = v14[4];
    if (v15) {
      break;
    }
LABEL_27:
    if (++v13 == 4)
    {
      uint64_t v13 = 0;
      while (1)
      {
        int v17 = (void *)(a1 + 8 * v13);
        uint64_t v18 = v17[4];
        if (v18) {
          break;
        }
LABEL_37:
        if (++v13 == 4)
        {
          if (*(_DWORD *)(a1 + 80)) {
            LODWORD(v13) = (((_BYTE)v9 - 1) & 0xFD) == 0;
          }
          else {
            LODWORD(v13) = 0;
          }
          goto LABEL_41;
        }
      }
      __int16 v19 = (unsigned __int8 *)(*v17 + 2);
      while (*(v19 - 2) != v9
           || (_BYTE)v10 && *(v19 - 1) != v10
           || (_BYTE)v11 && *v19 != v11)
      {
        v19 += 4;
        if (!--v18) {
          goto LABEL_37;
        }
      }
      goto LABEL_41;
    }
  }
  uint64_t v16 = (unsigned __int8 *)(*v14 + 2);
  while (*(v16 - 2) != v9 || *(v16 - 1) != v10 || *v16 != v11)
  {
    v16 += 4;
    if (!--v15) {
      goto LABEL_27;
    }
  }
LABEL_41:
  int v20 = *(_DWORD *)(a1 + 84);
  uint64_t v21 = (int)v13;
  char v22 = (unsigned char *)(a5 + 4 * (int)v13);
  if (*v22 != v9
    || (uint64_t v23 = a5 + 4 * (int)v13, *(unsigned __int8 *)(v23 + 1) != v10)
    || *(unsigned __int8 *)(v23 + 2) != v11)
  {
    char __src = 27;
    if ((v9 & 0xFE) == 2)
    {
      uint64_t v25 = (char *)&v52;
      char v51 = 36;
      if (v21) {
        goto LABEL_54;
      }
    }
    else
    {
      uint64_t v25 = &v51;
      if (v21) {
        goto LABEL_54;
      }
    }
    if (v9 == 2)
    {
      char v46 = v20;
      unsigned int v48 = a2;
      uint64_t v49 = a5;
      v26 = a4;
      int v27 = __dst;
      int v28 = a6;
      int v29 = memchr("@AB", v10, 4uLL);
      char v30 = "()*+";
      if (!v29 || (_BYTE)v11)
      {
        a6 = v28;
        __dst = v27;
        a4 = v26;
        a5 = v49;
        unsigned int v8 = v48;
        uint64_t v7 = a1;
        LOBYTE(v20) = v46;
      }
      else
      {
        a6 = v28;
        __dst = v27;
        a4 = v26;
        a5 = v49;
        unsigned int v8 = v48;
        uint64_t v7 = a1;
        LOBYTE(v20) = v46;
        if ((v46 & 2) == 0)
        {
LABEL_61:
          *uint64_t v25 = v10;
          p_src = v25 + 1;
          *char v22 = v9;
          uint64_t v31 = a5 + 4 * v21;
          *(unsigned char *)(v31 + 1) = v10;
          *(unsigned char *)(v31 + 2) = v11;
          goto LABEL_62;
        }
      }
LABEL_58:
      *uint64_t v25 = v30[v21];
      if ((_BYTE)v11)
      {
        v25[1] = v11;
        v25 += 2;
      }
      else
      {
        ++v25;
      }
      goto LABEL_61;
    }
LABEL_54:
    char v30 = ",-./";
    if ((v9 & 0xFD) == 0) {
      char v30 = "()*+";
    }
    goto LABEL_58;
  }
  p_src = &__src;
LABEL_62:
  unsigned int v32 = *(unsigned __int16 *)(a5 + 16);
  if (v21 != (int)(v32 << 29) >> 29 && ((v20 & 1) == 0 || v21 != (__int16)((_WORD)v32 << 10) >> 13))
  {
    switch((int)v21)
    {
      case 0:
        if ((*(unsigned char *)(v7 + 84) & 0x10) == 0) {
          goto LABEL_110;
        }
        *p_src++ = 15;
        unsigned int v32 = *(_WORD *)(a5 + 16) & 0xFFF8;
        goto LABEL_95;
      case 1:
        int v34 = *(_DWORD *)(v7 + 84);
        if ((v34 & 0x20) != 0)
        {
          *p_src++ = 14;
          unsigned int v32 = *(_WORD *)(a5 + 16) & 0xFFF8 | 1;
          goto LABEL_95;
        }
        uint64_t result = 92;
        uint64_t v36 = -1;
        if ((v20 & 1) != 0 && (v34 & 0x100) != 0)
        {
          *(_WORD *)p_src = 32283;
          p_src += 2;
          unsigned int v32 = *(_WORD *)(a5 + 16) & 0xFFC7 | 8;
          goto LABEL_95;
        }
        goto LABEL_122;
      case 2:
        int v33 = *(_DWORD *)(v7 + 84);
        if ((v33 & 0x40) != 0)
        {
          *(_WORD *)p_src = 28187;
          p_src += 2;
          unsigned int v32 = *(_WORD *)(a5 + 16) & 0xFFF8 | 2;
          goto LABEL_95;
        }
        if ((v20 & 1) != 0 && (v33 & 0x200) != 0)
        {
          *(_WORD *)p_src = 32027;
          p_src += 2;
          unsigned int v32 = *(_WORD *)(a5 + 16) & 0xFFC7 | 0x10;
          goto LABEL_95;
        }
        int v38 = *(_DWORD *)(v7 + 84);
        if ((v38 & 0x800) != 0)
        {
          *(_WORD *)p_src = 19995;
          p_src += 2;
          unsigned int v32 = *(_WORD *)(a5 + 16) & 0xFE3F | 0x80;
          goto LABEL_95;
        }
        uint64_t result = 92;
        uint64_t v36 = -1;
        if ((v20 & 1) != 0 && (v38 & 0x2000) != 0)
        {
          *(_WORD *)p_src = 20110;
          p_src += 2;
          int v39 = *(unsigned __int16 *)(a5 + 16);
          char v40 = 18;
          goto LABEL_91;
        }
        goto LABEL_122;
      case 3:
        int v37 = *(_DWORD *)(v7 + 84);
        if ((v37 & 0x80) != 0)
        {
          *(_WORD *)p_src = 28443;
          p_src += 2;
          unsigned int v32 = *(_WORD *)(a5 + 16) & 0xFFF8 | 3;
          goto LABEL_95;
        }
        if ((v20 & 1) == 0)
        {
          if ((v37 & 0x1000) == 0) {
            goto LABEL_110;
          }
          goto LABEL_92;
        }
        if ((v37 & 0x400) != 0)
        {
          *(_WORD *)p_src = 31771;
          p_src += 2;
          unsigned int v32 = *(_WORD *)(a5 + 16) & 0xFFC7 | 0x18;
        }
        else
        {
          if ((v37 & 0x1000) != 0)
          {
LABEL_92:
            *(_WORD *)p_src = 20251;
            p_src += 2;
            unsigned int v32 = *(_WORD *)(a5 + 16) & 0xFE3F | 0xC0;
            goto LABEL_95;
          }
          if ((v37 & 0x4000) == 0) {
            goto LABEL_110;
          }
          *(_WORD *)p_src = 20367;
          p_src += 2;
          int v39 = *(unsigned __int16 *)(a5 + 16);
          char v40 = 27;
LABEL_91:
          unsigned int v32 = v39 & 0xFFFFF03F | ((v40 & 0x3F) << 6);
        }
LABEL_95:
        *(_WORD *)(a5 + 16) = v32;
        break;
      default:
        goto LABEL_110;
    }
  }
  if (v21 != (__int16)((_WORD)v32 << 7) >> 13)
  {
    if (v21 == (__int16)(16 * v32) >> 13)
    {
LABEL_98:
      char v41 = 0x80;
      goto LABEL_101;
    }
    if (v21 != (int)(v32 << 29) >> 29)
    {
      if ((*(unsigned char *)(v7 + 84) & 1) == 0 || v21 != (__int16)((_WORD)v32 << 10) >> 13) {
        goto LABEL_110;
      }
      goto LABEL_98;
    }
  }
  char v41 = 0;
LABEL_101:
  if (v9 < 2u)
  {
    unsigned int v42 = 1;
  }
  else
  {
    if (v9 - 2 > 1) {
      goto LABEL_114;
    }
    unsigned int v42 = 1;
    if (v8 >= 0x20 && v8 - 127 >= 0x21)
    {
      if ((v10 & 0xF0) == 0x60) {
        unsigned int v42 = 3;
      }
      else {
        unsigned int v42 = 2;
      }
    }
  }
  if (&__src - p_src + 6 < (unint64_t)v42)
  {
LABEL_110:
    uint64_t result = 92;
LABEL_118:
    uint64_t v36 = -1;
    goto LABEL_122;
  }
  unsigned int v43 = v42 + 1;
  int v44 = 8 * v42 - 8;
  do
  {
    *p_src++ = ((int)a2 >> v44) & 0x7F | v41;
    --v43;
    v44 -= 8;
  }
  while (v43 > 1);
  LOWORD(v32) = *(_WORD *)(a5 + 16);
LABEL_114:
  *(_WORD *)(a5 + 16) = v32 | 0xFC0;
  uint64_t v36 = p_src - &__src;
  if ((unint64_t)(p_src - &__src) >= 7)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t result = 7;
    goto LABEL_118;
  }
  uint64_t v45 = a6;
  if (a4) {
    *a4 = &__dst[v36];
  }
  memcpy(__dst, &__src, p_src - &__src);
  uint64_t result = 0;
  a6 = v45;
LABEL_122:
  *a6 = v36;
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

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}