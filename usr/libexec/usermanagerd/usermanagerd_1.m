uint64_t sub_1000AC144(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return _ccecb_one_shot(a1, a2, a3, a4 >> 4);
}

uint64_t sub_1000AC14C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return _cccbc_update(a1, a2, a3, a4 >> 4);
}

BOOL sub_1000AC154()
{
  return !ccec_import_pub() && ccn_read_uint() == 0;
}

uint64_t sub_1000AC1D0()
{
  return 1;
}

uint64_t sub_1000AC208(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a5 + 8) >= *(void *)a5)
  {
    char v13 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      BOOL v11 = sub_1000AC308(*(const void **)(*(void *)(a5 + 24) + v9), *(void *)(*(void *)(a5 + 24) + v9)+ *(unsigned __int8 *)(*(void *)(*(void *)(a5 + 24) + v9) + 1)+ 2, a1);
      if (v11) {
        break;
      }
      ++v10;
      v9 += 40;
      if (v10 >= *(void *)a5) {
        goto LABEL_10;
      }
    }
    v14 = (void *)(*(void *)(a5 + 24) + v9);
    if (v14[1])
    {
      char v12 = 0;
      *(unsigned char *)(a5 + 16) = 1;
    }
    else
    {
      ++*(void *)(a5 + 8);
      v14[1] = a3;
      v14[2] = a3 + a4;
      v14[3] = a3;
      v14[4] = a3 + a4;
      char v12 = 1;
    }
LABEL_10:
    char v13 = v12 | !v11;
  }
  return v13 & 1;
}

BOOL sub_1000AC2F0(unsigned __int8 *a1, const void *a2)
{
  return sub_1000AC308(a1, (uint64_t)&a1[a1[1] + 2], a2);
}

BOOL sub_1000AC308(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5 = sub_1000AC374((uint64_t)a1);
  return v5 == sub_1000AC374((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t sub_1000AC374(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len()) {
    return a1 - a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000AC3DC()
{
  uint64_t result = ccder_blob_decode_range();
  if (result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result) {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000AC4B4(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    sub_1000AC3DC();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL sub_1000AC52C(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v8 = sub_1000AC308(*(const void **)a5, *(void *)a5 + *(unsigned __int8 *)(*(void *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(unsigned char *)(a5 + 24) = 1;
    *(void *)(a5 + 8) = a3;
    *(void *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t sub_1000AC590(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 0;
  }
  if (result)
  {
    sub_1000AC3DC();
    return 0;
  }
  return result;
}

uint64_t sub_1000AC614()
{
  return 0;
}

uint64_t sub_1000AC680(uint64_t result)
{
  if (result)
  {
    sub_1000AC3DC();
    return 0;
  }
  return result;
}

double sub_1000AC724(long long *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  long long v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    double result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t sub_1000AC794(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, void, uint64_t), uint64_t a4)
{
  *(void *)&long long v12 = a1;
  *((void *)&v12 + 1) = a2;
  uint64_t v6 = ccder_blob_decode_range();
  if (v6)
  {
    uint64_t v11 = 0;
    uint64_t v7 = v12;
    if (sub_1000AC848(&v12, &v10, &v11))
    {
      do
      {
        uint64_t v8 = v12 + v11;
        if (!a3(v7, v12 + v11 - v7, a4)) {
          break;
        }
        *(void *)&long long v12 = v8;
        uint64_t v7 = v8;
      }
      while ((sub_1000AC848(&v12, &v10, &v11) & 1) != 0);
    }
  }
  return v6;
}

uint64_t sub_1000AC848(long long *a1, void *a2, void *a3)
{
  long long v7 = *a1;
  uint64_t result = ccder_blob_decode_tag();
  if (result)
  {
    uint64_t result = ccder_blob_decode_len();
    if (result)
    {
      *a1 = v7;
      *a2 = 0;
      *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000AC8C8()
{
  return 0;
}

uint64_t sub_1000AC924(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    v2 = *a1;
    if (!*a1) {
      break;
    }
    v3 = (void *)*((void *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((void *)v2 + 2), 0, *((void *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t sub_1000AC9A4(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  v2 = (void **)a1;
  uint64_t result = (uint64_t)sub_1000ACA40(a1, a2);
  if (result)
  {
    uint64_t v4 = result;
    for (i = *v2; i != (void *)result; i = (void *)*i)
      v2 = (void **)i;
    void *v2 = *(void **)result;
    uint64_t v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(void *)(v4 + 16), 0, *(void *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

void *sub_1000ACA40(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0;
  }
  v2 = (void *)*a1;
  if (*a1)
  {
    do
    {
      size_t v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && sub_1000AC308(a2, (uint64_t)&a2[a2[1] + 2], v5)) {
        break;
      }
      v2 = (void *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t sub_1000ACAC4(void *a1, unsigned __int8 *a2, int a3, void *a4, void *a5)
{
  uint64_t v8 = sub_1000ACA40(a1, a2);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = 1;
  if (a4)
  {
    if (a5)
    {
      uint64_t v10 = v8[1] + v8[2];
      *(void *)&long long v15 = v8[1];
      *((void *)&v15 + 1) = v10;
      uint64_t v9 = ccder_blob_decode_sequence_tl();
      if (v9)
      {
        if (sub_1000ACBA4(&v15, 12, 0, 0))
        {
          uint64_t v11 = v15;
          if (ccder_blob_decode_tag())
          {
            if (ccder_blob_decode_len())
            {
              uint64_t v13 = 0;
              uint64_t v12 = v15;
              if (a3)
              {
                uint64_t v13 = (v15 - v11);
                uint64_t v12 = v11;
              }
              *a4 = v12;
              *a5 = v13;
            }
          }
        }
      }
    }
  }
  return v9;
}

uint64_t sub_1000ACBA4(long long *a1, uint64_t a2, uint64_t a3, int a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0 || a3 && a4) {
    return 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t sub_1000ACC34(void *a1, char *__s, void *a3, size_t a4)
{
  memset(v18, 0, sizeof(v18));
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  v11[0] = 12;
  v11[1] = strlen(__s);
  long long v7 = (unsigned __int8 *)sub_1000ACD60((uint64_t)v11);
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v7)
  {
    __memcpy_chk();
    __src = 0;
    uint64_t v10 = 0;
    if (sub_1000ACAC4(a1, v7, 0, &__src, &v10))
    {
      if (v10 == a4)
      {
        memcpy(a3, __src, a4);
        return 0;
      }
      else
      {
        return 4294967277;
      }
    }
    else
    {
      return 4294967293;
    }
  }
  return result;
}

uint64_t sub_1000ACD60(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t sub_1000ACE60(void *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v4 = sub_1000ACAC4(a1, a2, 1, &v7, &v8);
  uint64_t v5 = v4;
  if (a3 && v4) {
    *a3 = sub_1000AC614();
  }
  return v5;
}

uint64_t sub_1000ACEBC(void *a1, unsigned __int8 *a2, unsigned char *a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v4 = sub_1000ACAC4(a1, a2, 1, &v7, &v8);
  uint64_t v5 = v4;
  if (a3 && v4) {
    *a3 = sub_1000AC8C8();
  }
  return v5;
}

uint64_t sub_1000ACF18(uint64_t a1)
{
  if (a1) {
    return sub_1000AC3DC() - 1;
  }
  else {
    return 4294967285;
  }
}

uint64_t sub_1000ACF60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (unsigned __int8 *)sub_1000ACD60(a1);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    if (!sub_1000AC9A4(a5, v8) && !sub_1000AD200(a5, v9, a3, a3 + a4)) {
      return 1;
    }
  }
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t sub_1000AD030(void *a1, void *a2, size_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v7 = (void *)*a1;
        if (*a1)
        {
          unint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          do
          {
            v10 += v7[2];
            uint64_t v7 = (void *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (rsize_t v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            long long v13 = v12;
            long long v14 = (void *)*a1;
            if (*a1)
            {
              long long v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                long long v14 = (void *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_1000AF4D0);
            size_t v16 = ccder_sizeof();
            long long v17 = (char *)calloc(v16, 1uLL);
            v18 = v17;
            if (v17)
            {
              v25 = v17;
              v26 = &v17[v16];
              unint64_t v19 = v8 - 1;
              uint64_t v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                uint64_t v22 = v20 - 16;
                char v23 = ccder_blob_encode_body();
                uint64_t v20 = v22;
                if ((v23 & 1) == 0) {
                  goto LABEL_16;
                }
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                uint64_t v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              uint64_t v3 = 0;
              *a2 = v18;
              *a3 = v16;
              v18 = 0;
            }
            else
            {
              uint64_t v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_1000AD200(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (sub_1000AC374(a3) <= (unint64_t)(a4 - a3))
    {
      size_t v6 = ccder_sizeof();
      uint64_t v7 = (char *)calloc(v6, 1uLL);
      if (!v7) {
        return 4294967279;
      }
      unint64_t v8 = v7;
      size_t v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        int v9 = ccder_blob_encode_body();
        uint64_t v10 = v16;
        if (!v9) {
          uint64_t v10 = 0;
        }
        long long v17 = v10;
        int v11 = ccder_blob_encode_tl();
        long long v12 = v17;
        if (!v11) {
          long long v12 = 0;
        }
        if (v12 && v12 == v8)
        {
          long long v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            long long v15 = v14;
            uint64_t result = 0;
            v15[1] = v8;
            v15[2] = v6;
            *long long v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000AD370(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000AD200(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_1000AD380(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    size_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      long long v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_19;
      }
      int v8 = ccder_blob_encode_body();
      int v9 = v15;
      if (!v8) {
        int v9 = 0;
      }
      size_t v16 = v9;
      int v10 = ccder_blob_encode_tl();
      int v11 = v16;
      if (!v10) {
        int v11 = 0;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (long long v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        long long v14 = v13;
        uint64_t result = 0;
        v14[1] = v7;
        v14[2] = v5;
        void *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000AD4F0(void *a1, char *__s, uint64_t a3)
{
  memset(v14, 0, sizeof(v14));
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  v7[0] = 12;
  v7[1] = strlen(__s);
  uint64_t v5 = sub_1000ACD60((uint64_t)v7);
  uint64_t result = 4294967285;
  if (a3)
  {
    if (v5)
    {
      __memcpy_chk();
      return sub_1000AD380(a1, v5, a3);
    }
  }
  return result;
}

uint64_t sub_1000AD5E0(void *a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v4 = ccder_sizeof();
    uint64_t v5 = (char *)calloc(v4, 1uLL);
    if (v5)
    {
      size_t v6 = v5;
      long long v14 = &v5[v4];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_18;
      }
      int v7 = ccder_blob_encode_body();
      long long v8 = v14;
      if (!v7) {
        long long v8 = 0;
      }
      long long v15 = v8;
      int v9 = ccder_blob_encode_tl();
      long long v10 = v15;
      if (!v9) {
        long long v10 = 0;
      }
      BOOL v11 = v10 && v10 == v6;
      if (v11 && (long long v12 = calloc(0x18uLL, 1uLL)) != 0)
      {
        long long v13 = v12;
        uint64_t result = 0;
        v13[1] = v6;
        v13[2] = v4;
        *long long v13 = *a1;
        *a1 = v13;
      }
      else
      {
LABEL_18:
        memset_s(v6, v4, 0, v4);
        free(v6);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000AD748(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unint64_t v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    uint64_t v10 = 8;
  }
  else
  {
    uint64_t v6 = 9;
    uint64_t v7 = 48;
    uint64_t v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      uint64_t v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if (v5 != v9)
      {
        uint64_t v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    uint64_t v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = v8;
    }
  }
  uint64_t v25 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v12 = ccder_sizeof();
    long long v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      long long v14 = v13;
      uint64_t v15 = v10;
      do
      {
        *((unsigned char *)&v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      char v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl()) {
        goto LABEL_30;
      }
      int v16 = ccder_blob_encode_body();
      long long v17 = v23;
      if (!v16) {
        long long v17 = 0;
      }
      v24 = v17;
      int v18 = ccder_blob_encode_tl();
      unint64_t v19 = v24;
      if (!v18) {
        unint64_t v19 = 0;
      }
      BOOL v20 = v19 && v19 == v14;
      if (v20 && (v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        uint64_t v22 = v21;
        uint64_t result = 0;
        v22[1] = v14;
        v22[2] = v12;
        *uint64_t v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000AD960(void *a1, uint64_t a2, char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && __s)
  {
    strlen(__s);
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    uint64_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_19;
      }
      int v8 = ccder_blob_encode_body();
      uint64_t v9 = v15;
      if (!v8) {
        uint64_t v9 = 0;
      }
      int v16 = v9;
      int v10 = ccder_blob_encode_tl();
      BOOL v11 = v16;
      if (!v10) {
        BOOL v11 = 0;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (long long v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        long long v14 = v13;
        uint64_t result = 0;
        v14[1] = v7;
        v14[2] = v5;
        void *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000ADAD8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = 0;
  __s = 0;
  rsize_t __n = 0;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    size_t v5 = 0;
    if (a3)
    {
      if (sub_1000AD030(a3, &__s, &__n))
      {
        uint64_t v3 = 0;
        size_t v5 = 0;
      }
      else
      {
        size_t v5 = ccder_sizeof();
        uint64_t v7 = (char *)calloc(v5, 1uLL);
        uint64_t v3 = v7;
        if (v7)
        {
          uint64_t v15 = &v7[v5];
          if (!ccder_blob_encode_body()) {
            goto LABEL_23;
          }
          int v18 = v3;
          unint64_t v19 = v15;
          int v8 = ccder_blob_encode_body();
          uint64_t v9 = v19;
          if (!v8) {
            uint64_t v9 = 0;
          }
          int v18 = v3;
          unint64_t v19 = v9;
          int v10 = ccder_blob_encode_tl();
          BOOL v11 = v19;
          if (!v10) {
            BOOL v11 = 0;
          }
          BOOL v12 = v11 && v11 == v3;
          if (v12 && (long long v13 = calloc(0x18uLL, 1uLL)) != 0)
          {
            uint64_t v4 = 0;
            v13[1] = v3;
            v13[2] = v5;
            *long long v13 = *a1;
            *a1 = v13;
            uint64_t v3 = 0;
          }
          else
          {
LABEL_23:
            uint64_t v4 = 0xFFFFFFFFLL;
          }
        }
        else
        {
          uint64_t v4 = 4294967279;
        }
      }
    }
  }
  else
  {
    size_t v5 = 0;
  }
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  if (v3)
  {
    memset_s(v3, v5, 0, v5);
    free(v3);
  }
  return v4;
}

BOOL sub_1000ADC78(void *a1)
{
  return *a1 == 0;
}

uint64_t sub_1000ADC88()
{
  return ccder_sizeof();
}

uint64_t sub_1000ADCA0()
{
  uint64_t v0 = ccder_sizeof();
  return ccder_sizeof() + v0;
}

uint64_t sub_1000ADCE8(long long *a1, uint64_t a2)
{
  long long v4 = *a1;
  if (a2)
  {
    uint64_t result = ccder_blob_encode_body_tl();
    if (!result) {
      return result;
    }
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0;
    }
  }
  else if (!ccder_blob_encode_body_tl() || (ccder_blob_encode_tl() & 1) == 0)
  {
    return 0;
  }
  *a1 = v4;
  return 1;
}

uint64_t sub_1000ADD94(long long *a1, int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a3;
  uint64_t v5 = *(void *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 20);
  long long v11 = *a1;
  if (a2)
  {
    long long v14 = *a1;
    BOOL v12 = 0;
    uint64_t v13 = 0;
    if ((ccder_blob_decode_range() & 1) == 0) {
      return 0;
    }
    uint64_t v6 = (uint64_t)v12;
    unsigned int v8 = v13 - v12;
    long long v11 = v14;
  }
  else
  {
    LODWORD(v14) = v5;
    uint64_t result = sub_1000ADE9C(&v11, 4, v6, &v14);
    if (!result) {
      return result;
    }
    unsigned int v8 = v14;
  }
  long long v14 = v11;
  BOOL v12 = 0;
  uint64_t v13 = 0;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  long long v11 = v14;
  if ((v13 - v12) > 4) {
    return 0;
  }
  int v10 = *v12;
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = v7;
  *a1 = v11;
  return 1;
}

uint64_t sub_1000ADE9C(long long *a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  if (a3)
  {
    if (a4) {
      *a4 = 0;
    }
  }
  *a1 = v8;
  return 1;
}

uint64_t sub_1000ADF38(long long *a1, uint64_t a2)
{
  long long v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t result = ccder_blob_encode_tl();
    if (!result) {
      return result;
    }
  }
  *a1 = v4;
  return 1;
}

uint64_t sub_1000ADFA8(long long *a1, int a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v5 = a3[1];
  long long v9 = *a1;
  if (a2)
  {
    long long v12 = *a1;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t result = ccder_blob_decode_range();
    if (!result) {
      return result;
    }
    uint64_t v6 = v10;
    unsigned int v8 = v11 - v10;
    long long v9 = v12;
  }
  else
  {
    LODWORD(v12) = v5;
    uint64_t result = sub_1000ADE9C(&v9, 4, v6, &v12);
    if (!result) {
      return result;
    }
    unsigned int v8 = v12;
  }
  *a3 = v6;
  a3[1] = v8;
  *a1 = v9;
  return 1;
}

uint64_t sub_1000AE058(long long *a1, uint64_t a2)
{
  long long v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t result = ccder_blob_encode_tl();
    if (!result) {
      return result;
    }
  }
  *a1 = v4;
  return 1;
}

uint64_t sub_1000AE0CC(long long *a1)
{
  long long v3 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  *a1 = v3;
  return 1;
}

uint64_t sub_1000AE150(unsigned int *a1, int a2, void *a3, _DWORD *a4)
{
  long long v12 = 0;
  if (sub_1000AD748(&v12, (uint64_t)off_1000E3A20, *a1)
    || sub_1000AD748(&v12, (uint64_t)off_1000E3A28, a1[1])
    || sub_1000AD748(&v12, (uint64_t)off_1000E3A30, *((void *)a1 + 1))
    || sub_1000AD748(&v12, (uint64_t)off_1000E3A40, a1[4])
    || sub_1000AD748(&v12, (uint64_t)off_1000E3A50, a1[5])
    || sub_1000AD748(&v12, (uint64_t)off_1000E3A68, *(void *)((char *)a1 + 26))
    || sub_1000AD748(&v12, (uint64_t)off_1000E3A70, *(void *)((char *)a1 + 34))
    || sub_1000AD748(&v12, (uint64_t)off_1000E3778, *(int *)((char *)a1 + 42))
    || sub_1000AD748(&v12, (uint64_t)off_1000E3940, *(unsigned int *)((char *)a1 + 46))
    || sub_1000AD380(&v12, (uint64_t)off_1000E3B38, (uint64_t)a1 + 50)
    || a2
    && (sub_1000AD748(&v12, (uint64_t)off_1000E3A58, *((char *)a1 + 66))
     || sub_1000AD748(&v12, (uint64_t)off_1000E3A60, *((char *)a1 + 67))
     || sub_1000AD748(&v12, (uint64_t)off_1000E3D38, *(void *)(a1 + 17))
     || sub_1000AD748(&v12, (uint64_t)off_1000E3D80, *(void *)(a1 + 19)))
    || (uint64_t v10 = 0, v11 = 0, sub_1000AD030(&v12, &v10, &v11)))
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = 0;
    *a3 = v10;
    *a4 = v11;
  }
  sub_1000AC924(&v12);
  return v8;
}

uint64_t sub_1000AE360(uint64_t a1, int a2, char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1)
  {
    if (__s)
    {
      memset_s(__s, 0x54uLL, 0, 0x54uLL);
      bzero(v7, 0x228uLL);
      v7[4] = off_1000E3A28;
      v7[9] = off_1000E3A30;
      v7[14] = off_1000E3A40;
      v7[19] = off_1000E3A50;
      v7[24] = off_1000E3A58;
      v7[29] = off_1000E3A60;
      v7[34] = off_1000E3A68;
      v7[39] = off_1000E3A70;
      v7[44] = off_1000E3778;
      v7[49] = off_1000E3940;
      v7[54] = off_1000E3B38;
      long long v9 = off_1000E3D38;
      uint64_t v10 = off_1000E3D80;
      sub_1000AC3DC();
      *(_DWORD *)__s = sub_1000AC614();
      *((_DWORD *)__s + 1) = sub_1000AC614();
      *((void *)__s + 1) = sub_1000AC614();
      *((_DWORD *)__s + 4) = sub_1000AC614();
      *((_DWORD *)__s + 5) = sub_1000AC614();
      *(void *)(__s + 26) = sub_1000AC614();
      *(void *)(__s + 34) = sub_1000AC614();
      *(_DWORD *)(__s + 42) = sub_1000AC614();
      *(_DWORD *)(__s + 46) = sub_1000AC614();
      sub_1000ACBA4(&v8, 4, (uint64_t)(__s + 50), 16);
      __s[66] = sub_1000AC614();
      __s[67] = sub_1000AC614();
      *(void *)(__s + 68) = sub_1000AC614();
      uint64_t v6 = sub_1000AC614();
      uint64_t result = 0;
      *(void *)(__s + 76) = v6;
    }
  }
  return result;
}

uint64_t sub_1000AE5D0(uint64_t a1, int a2, unsigned char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (sub_1000AC3DC())
    {
      void *__s = sub_1000AC614();
      *((_DWORD *)__s + 1) = sub_1000AC614();
      *((_DWORD *)__s + 2) = sub_1000AC614();
      int v6 = sub_1000AC614();
      uint64_t result = 0;
      *((_DWORD *)__s + 3) = v6;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_1000AE740(uint64_t a1, int a2, void *__s, void *a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s && a4)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    memset_s(a4, 0x10uLL, 0, 0x10uLL);
    uint64_t v12 = 0;
    v10[0] = 0u;
    long long v11 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v10[1] = (unint64_t)off_1000E3CE0;
    uint64_t v13 = off_1000E3818;
    sub_1000AC3DC();
    if (sub_1000ACBA4(v10, 4, (uint64_t)__s, 16)
      && sub_1000ACBA4((long long *)((char *)&v11 + 8), 4, (uint64_t)a4, 16))
    {
      return sub_1000ACBA4(&v15, 4, a5, 16) - 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_1000AE8C8(uint64_t a1, uint64_t a2, _DWORD *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    long long v24 = 0u;
    uint64_t v26 = 0;
    long long v27 = 0u;
    uint64_t v28 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v33 = 0;
    long long v34 = 0u;
    uint64_t v35 = 0;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v40 = 0;
    long long v41 = 0u;
    uint64_t v42 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v8 = 0u;
    uint64_t v9 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v15 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v21 = 0;
    long long v23 = 0u;
    uint64_t v10 = off_1000E37F8;
    *(void *)&long long v13 = off_1000E37F0;
    int v16 = off_1000E3810;
    *(void *)&long long v19 = off_1000E3A98;
    uint64_t v22 = off_1000E3A40;
    uint64_t v25 = off_1000E3A48;
    v29 = off_1000E3940;
    v32 = off_1000E3A30;
    v36 = off_1000E3A38;
    v39 = off_1000E3BF8;
    v43 = off_1000E3C60;
    sub_1000AC3DC();
    void *__s = sub_1000AC614();
    if (sub_1000ACBA4((long long *)((char *)&v8 + 8), 4, (uint64_t)(__s + 1), 16)
      && sub_1000ACBA4(&v12, 4, (uint64_t)(__s + 5), 16)
      && (__s[9] = sub_1000AC614(),
          __s[10] = sub_1000AC614(),
          __s[11] = sub_1000AC614(),
          __s[12] = sub_1000AC614(),
          __s[15] = sub_1000AC614(),
          __s[13] = sub_1000AC614(),
          __s[14] = sub_1000AC614(),
          sub_1000AEBB8((long long *)((char *)&v20 + 8))))
    {
      int v6 = __s[9];
      if ((v6 & 0x400) != 0)
      {
        *((void *)__s + 9) = sub_1000AC614();
        int v6 = __s[9];
      }
      if ((v6 & 0x800) != 0)
      {
        int v7 = sub_1000AC614();
        uint64_t result = 0;
        __s[20] = v7;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_1000AEBB8(long long *a1)
{
  long long v4 = *a1;
  uint64_t v2 = ccder_blob_decode_range();
  if (v2) {
    *a1 = v4;
  }
  return v2;
}

uint64_t sub_1000AEC40(int *a1, void *a2, _DWORD *a3)
{
  long long v11 = 0;
  uint64_t v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1 && (int v7 = *a1) != 0)
    {
      if (v7)
      {
        sub_1000AD4F0(&v11, "persona_uuid", (uint64_t)(a1 + 1));
        int v7 = *a1;
      }
      if ((v7 & 2) != 0) {
        sub_1000AD4F0(&v11, "volume_uuid", (uint64_t)(a1 + 5));
      }
      uint64_t v9 = 0;
      size_t v10 = 0;
      if (!sub_1000AD030(&v11, &v9, &v10))
      {
        uint64_t v3 = 0;
        *a2 = v9;
        *a3 = v10;
      }
    }
    else
    {
      uint64_t v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  sub_1000AC924(&v11);
  return v3;
}

uint64_t sub_1000AED18(uint64_t a1, uint64_t a2, char *__s)
{
  int v6 = 0;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x24uLL, 0, 0x24uLL);
    if (sub_1000AC3DC())
    {
      if (!sub_1000ACC34(&v6, "volume_uuid", __s + 20, 0x10uLL)) {
        *(_DWORD *)__s |= 2u;
      }
      uint64_t v3 = 0;
      if (!sub_1000ACC34(&v6, "persona_uuid", __s + 4, 0x10uLL)) {
        *(_DWORD *)__s |= 1u;
      }
    }
    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }
  sub_1000AC924(&v6);
  return v3;
}

uint64_t sub_1000AEE04(uint64_t a1, void *a2, _DWORD *a3)
{
  size_t v10 = 0;
  uint64_t v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1)
    {
      if (!sub_1000AD4F0(&v10, "options", a1) && !sub_1000AD4F0(&v10, "kc", a1 + 8))
      {
        uint64_t v8 = 0;
        size_t v9 = 0;
        if (!sub_1000AD030(&v10, &v8, &v9))
        {
          uint64_t v3 = 0;
          *a2 = v8;
          *a3 = v9;
        }
      }
    }
    else
    {
      uint64_t v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  sub_1000AC924(&v10);
  return v3;
}

uint64_t sub_1000AEED0(uint64_t a1, uint64_t a2, char *__s)
{
  int v6 = 0;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (sub_1000AC3DC())
    {
      sub_1000ACC34(&v6, "options", __s, 8uLL);
      sub_1000ACC34(&v6, "kc", __s + 8, 4uLL);
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }
  sub_1000AC924(&v6);
  return v3;
}

void *sub_1000AEF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = off_1000E3770;
      if (off_1000E3770)
      {
        sub_1000AC3DC();
        return 0;
      }
    }
  }
  return v2;
}

uint64_t sub_1000AF388(long long *a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0;
  }
  if (a3 && a4)
  {
    uint64_t result = (uint64_t)calloc(0, 1uLL);
    if (!result) {
      return result;
    }
    *a3 = result;
    *a4 = 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t sub_1000AF444(long long *a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = 0;
  }
  long long v6 = *a1;
  uint64_t result = ccder_blob_decode_range();
  if (result)
  {
    if (ccn_read_uint())
    {
      return 0;
    }
    else
    {
      *a1 = v6;
      if (a3) {
        *a3 = 0;
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000AF4D0(const void **a1, void **a2)
{
  uint64_t v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  int v2 = memcmp(v5, __s2, 0);
  if (v2 > 0) {
    return 1;
  }
  else {
    return ((v2 < 0) << 31 >> 31);
  }
}

uint64_t sub_1000AF5FC()
{
  sub_1000AB744(&off_1000D5DF0 != 0, 36, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return 4294967284;
}

uint64_t sub_1000AF740()
{
  sub_1000AB744(&off_1000D5DF0 != 0, 62, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(sub_10009B860 != 0, 63, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return sub_10009B860();
}

uint64_t sub_1000AF7F8(uint64_t a1, unsigned int a2)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 70, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(sub_10009B8D0 != 0, 71, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return sub_10009B8D0(a1, a2);
}

uint64_t sub_1000AF8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 78, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 79, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1000AF9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 86, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 87, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1000AFB08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 94, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 95, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1000AFC30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 106, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 107, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_1000AFD60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 115, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 116, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t sub_1000AFE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 123, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 124, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1, a2, a3, a4, a5);
}

uint64_t sub_1000AFF88()
{
  sub_1000AB744(&off_1000D5DF0 != 0, 131, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 132, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0]();
}

uint64_t sub_1000B0040(uint64_t a1, uint64_t a2)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 139, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 140, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1, a2);
}

uint64_t sub_1000B0110(uint64_t a1)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 147, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 148, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1);
}

uint64_t sub_1000B01D8(uint64_t a1)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 155, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 156, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1);
}

uint64_t sub_1000B02A0(uint64_t a1)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 163, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 164, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1);
}

uint64_t sub_1000B0368(uint64_t a1)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 172, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1);
}

uint64_t sub_1000B0430(uint64_t a1)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 179, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 180, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1);
}

uint64_t sub_1000B04F8(uint64_t a1)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 187, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 188, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1);
}

uint64_t sub_1000B05C0(uint64_t a1)
{
  sub_1000AB744(&off_1000D5DF0 != 0, 195, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000AB744(0, 196, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");

  return MEMORY[0](a1);
}

uint64_t sub_1000B0688(int a1)
{
  return -a1 & 3;
}

char *sub_1000B0694(_DWORD *a1, const void *a2, int a3)
{
  uint64_t v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    int v5 = -a3;
    size_t v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      int __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *sub_1000B071C(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v21 = &a9;
  unsigned int v12 = 4;
  if (a3)
  {
    int v13 = a3;
    do
    {
      long long v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  uint64_t result = (char *)calloc(1uLL, v12);
  int v16 = result;
  uint64_t v22 = (const void **)&a9;
  int v17 = 0;
  if (a3)
  {
    uint64_t v18 = 4;
    do
    {
      long long v19 = v22;
      long long v20 = *v22;
      v22 += 2;
      uint64_t result = sub_1000B0694(&v16[v18], v20, *((_DWORD *)v19 + 2));
      uint64_t v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)int v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t sub_1000B07FC(unsigned int *a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 < 4) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v9 = a3;
  if (*a1 >= a3)
  {
    long long v19 = (void **)&a9;
    if (!a3) {
      return 0;
    }
    long long v11 = (char *)(a1 + 1);
    while (1)
    {
      unsigned int v12 = v19;
      int v13 = *v19;
      v19 += 2;
      unsigned int v16 = *(_DWORD *)v11;
      long long v14 = v11 + 4;
      size_t v15 = v16;
      if (v16 > a2) {
        break;
      }
      if (v13)
      {
        int v17 = (size_t *)v12[1];
        if (*v17 < v15) {
          return 0xFFFFFFFFLL;
        }
        memcpy(v13, v14, v15);
        *int v17 = v15;
      }
      long long v11 = &v14[v15];
      if (!--v9) {
        return 0;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_1000B08C8()
{
}

void sub_1000B08E4(char a1)
{
  if ((a1 & 1) == 0) {
    goto LABEL_11;
  }
  while (1)
  {
    v1 = (id)qword_1000E4080;
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      unsigned int v2 = sub_100055404(0);
      BOOL v3 = os_log_type_enabled(v1, OS_LOG_TYPE_ERROR);
      long long v4 = 0;
      if (v3) {
        unsigned int v5 = v2;
      }
      else {
        unsigned int v5 = v2 & 0xFFFFFFFE;
      }
      if (v5)
      {
        size_t v6 = (const char *)_os_log_send_and_compose_impl();
        long long v4 = 0;
        if (v6)
        {
          int v7 = v6;
          sub_100055434(v6);
          long long v4 = (char *)v7;
        }
      }
      free(v4);
    }

    sub_100053B08();
LABEL_11:
    dispatch_once(&qword_1000E4088, &stru_1000D55D8);
  }
}

void sub_1000B09F0()
{
  uint64_t v0 = sub_100053B08();
  sub_1000B0A08(v0);
}

void sub_1000B0A08()
{
}

uint64_t AKSGetLastUser()
{
  return _AKSGetLastUser();
}

uint64_t AKSIdentityGetPrimary()
{
  return _AKSIdentityGetPrimary();
}

uint64_t AKSIdentityMigrateFirst()
{
  return _AKSIdentityMigrateFirst();
}

uint64_t AKSIdentityTransferPrimary()
{
  return _AKSIdentityTransferPrimary();
}

uint64_t APFSContainerGetBootDevice()
{
  return _APFSContainerGetBootDevice();
}

uint64_t APFSVolumeConvertToUserCrypto()
{
  return _APFSVolumeConvertToUserCrypto();
}

uint64_t APFSVolumeDelete()
{
  return _APFSVolumeDelete();
}

uint64_t APFSVolumeEnableUserProtectionWithOptions()
{
  return _APFSVolumeEnableUserProtectionWithOptions();
}

uint64_t APFSVolumeGetVEKState()
{
  return _APFSVolumeGetVEKState();
}

uint64_t APFSVolumeMigrateMediaKey()
{
  return _APFSVolumeMigrateMediaKey();
}

uint64_t APFSVolumeNeedsCryptoMigration()
{
  return _APFSVolumeNeedsCryptoMigration();
}

uint64_t APFSVolumeTranscribePFK()
{
  return _APFSVolumeTranscribePFK();
}

uint64_t CCRandomCopyBytes()
{
  return _CCRandomCopyBytes();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return _CFDictionaryContainsValue(theDict, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListWrite(propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFReadStreamCreateWithBytesNoCopy(alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopRun(void)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return _CFUUIDCreateFromString(alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return _CFWriteStreamCopyProperty(stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return _CFWriteStreamCreateWithAllocatedBuffers(alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return _CFWriteStreamOpen(stream);
}

uint64_t DDIInitializeLocalUsersAndGroups()
{
  return _DDIInitializeLocalUsersAndGroups();
}

uint64_t DDIUpdateLocalUsersAndGroups()
{
  return _DDIUpdateLocalUsersAndGroups();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return _IOConnectSetNotificationPort(connect, type, port, reference);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t IOUSBDeviceControllerCreate()
{
  return _IOUSBDeviceControllerCreate();
}

uint64_t IOUSBDeviceControllerForceOffBus()
{
  return _IOUSBDeviceControllerForceOffBus();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MKBKeyBagCopySystemOpaqueBlob()
{
  return _MKBKeyBagCopySystemOpaqueBlob();
}

uint64_t MKBLockDeviceNow()
{
  return _MKBLockDeviceNow();
}

uint64_t MKBUserSessionCreateKeybagForUser()
{
  return _MKBUserSessionCreateKeybagForUser();
}

uint64_t MKBUserSessionCreatePersonaKeyForUser()
{
  return _MKBUserSessionCreatePersonaKeyForUser();
}

uint64_t MKBUserSessionCreateSyncBagForUser()
{
  return _MKBUserSessionCreateSyncBagForUser();
}

uint64_t MKBUserSessionDeleteKeybagForUser()
{
  return _MKBUserSessionDeleteKeybagForUser();
}

uint64_t MKBUserSessionLoadKeybagForUser()
{
  return _MKBUserSessionLoadKeybagForUser();
}

uint64_t MKBUserSessionLoadSyncBagForUser()
{
  return _MKBUserSessionLoadSyncBagForUser();
}

uint64_t MKBUserSessionRemovePersonaKeyForUser()
{
  return _MKBUserSessionRemovePersonaKeyForUser();
}

uint64_t MKBUserSessionRemoveSyncBagForUser()
{
  return _MKBUserSessionRemoveSyncBagForUser();
}

uint64_t MKBUserSessionSetVolumeToPersona()
{
  return _MKBUserSessionSetVolumeToPersona();
}

uint64_t MKBUserSessionUnloadKeybagForUser()
{
  return _MKBUserSessionUnloadKeybagForUser();
}

uint64_t MKBUserSessionUnloadSessionBags()
{
  return _MKBUserSessionUnloadSessionBags();
}

uint64_t MKBUserSessionVerifySyncBagForUser()
{
  return _MKBUserSessionVerifySyncBagForUser();
}

void NSLog(NSString *format, ...)
{
}

uint64_t UMLSetInternalLogHandlers()
{
  return _UMLSetInternalLogHandlers();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesWriteUserPreferencesWithCorrectOwner()
{
  return __CFPreferencesWriteUserPreferencesWithCorrectOwner();
}

uint64_t _SecKeychainDeleteMultiUser()
{
  return __SecKeychainDeleteMultiUser();
}

uint64_t _SecSyncBubbleTransfer()
{
  return __SecSyncBubbleTransfer();
}

uint64_t _SecSyncDeleteUserViews()
{
  return __SecSyncDeleteUserViews();
}

uint64_t _SecSystemKeychainTransfer()
{
  return __SecSystemKeychainTransfer();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t __xpc_connection_set_logging()
{
  return ___xpc_connection_set_logging();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

uint64_t _os_log_get_nscf_formatter()
{
  return __os_log_get_nscf_formatter();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

uint64_t _os_log_set_nscf_formatter()
{
  return __os_log_set_nscf_formatter();
}

void abort(void)
{
}

uint64_t abort_with_reason()
{
  return _abort_with_reason();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

uint64_t cc_clear()
{
  return _cc_clear();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return _ccaes_cbc_decrypt_mode();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return _ccaes_cbc_encrypt_mode();
}

uint64_t cccbc_clear_iv()
{
  return _cccbc_clear_iv();
}

uint64_t cccbc_init()
{
  return _cccbc_init();
}

uint64_t cccurve25519()
{
  return _cccurve25519();
}

uint64_t cccurve25519_make_pub()
{
  return _cccurve25519_make_pub();
}

uint64_t ccder_blob_decode_len()
{
  return _ccder_blob_decode_len();
}

uint64_t ccder_blob_decode_range()
{
  return _ccder_blob_decode_range();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return _ccder_blob_decode_sequence_tl();
}

uint64_t ccder_blob_decode_tag()
{
  return _ccder_blob_decode_tag();
}

uint64_t ccder_blob_decode_tl()
{
  return _ccder_blob_decode_tl();
}

uint64_t ccder_blob_encode_body()
{
  return _ccder_blob_encode_body();
}

uint64_t ccder_blob_encode_body_tl()
{
  return _ccder_blob_encode_body_tl();
}

uint64_t ccder_blob_encode_implicit_raw_octet_string()
{
  return _ccder_blob_encode_implicit_raw_octet_string();
}

uint64_t ccder_blob_encode_implicit_uint64()
{
  return _ccder_blob_encode_implicit_uint64();
}

uint64_t ccder_blob_encode_tl()
{
  return _ccder_blob_encode_tl();
}

uint64_t ccder_decode_sequence_tl()
{
  return _ccder_decode_sequence_tl();
}

uint64_t ccder_decode_tl()
{
  return _ccder_decode_tl();
}

uint64_t ccder_encode_constructed_tl()
{
  return _ccder_encode_constructed_tl();
}

uint64_t ccder_encode_raw_octet_string()
{
  return _ccder_encode_raw_octet_string();
}

uint64_t ccder_encode_uint64()
{
  return _ccder_encode_uint64();
}

uint64_t ccder_sizeof()
{
  return _ccder_sizeof();
}

uint64_t ccder_sizeof_implicit_uint64()
{
  return _ccder_sizeof_implicit_uint64();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return _ccder_sizeof_raw_octet_string();
}

uint64_t ccder_sizeof_uint64()
{
  return _ccder_sizeof_uint64();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccec_export_pub()
{
  return _ccec_export_pub();
}

uint64_t ccec_import_pub()
{
  return _ccec_import_pub();
}

uint64_t cchkdf()
{
  return _cchkdf();
}

uint64_t cchmac()
{
  return _cchmac();
}

uint64_t ccn_read_uint()
{
  return _ccn_read_uint();
}

uint64_t ccn_write_uint_padded()
{
  return _ccn_write_uint_padded();
}

uint64_t ccpbkdf2_hmac()
{
  return _ccpbkdf2_hmac();
}

uint64_t ccrng()
{
  return _ccrng();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

uint64_t cczp_bitlen()
{
  return _cczp_bitlen();
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return _fts_set(a1, a2, a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return _gmtime_r(a1, a2);
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return _host_get_multiuser_config_flags(host, multiuser_flags);
}

kern_return_t host_set_multiuser_config_flags(host_priv_t host_priv, uint32_t multiuser_flags)
{
  return _host_set_multiuser_config_flags(host_priv, multiuser_flags);
}

uint64_t kpersona_alloc()
{
  return _kpersona_alloc();
}

uint64_t kpersona_dealloc()
{
  return _kpersona_dealloc();
}

uint64_t kpersona_info()
{
  return _kpersona_info();
}

uint64_t kpersona_palloc()
{
  return _kpersona_palloc();
}

uint64_t kpersona_pidinfo()
{
  return _kpersona_pidinfo();
}

uint64_t launch_active_user_login()
{
  return _launch_active_user_login();
}

uint64_t launch_active_user_logout()
{
  return _launch_active_user_logout();
}

uint64_t launch_create_persona()
{
  return _launch_create_persona();
}

uint64_t launch_destroy_persona()
{
  return _launch_destroy_persona();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return _lchflags(a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return _lchown(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return _mach_port_type(task, name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

uint64_t mach_voucher_persona_for_originator()
{
  return _mach_voucher_persona_for_originator();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

uint32_t notify_check(int token, int *check)
{
  return _notify_check(token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint64_t notify_register_plain()
{
  return _notify_register_plain();
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

void openlog(const char *a1, int a2, int a3)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

uint64_t os_log_set_client_type()
{
  return _os_log_set_client_type();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return _os_variant_uses_ephemeral_storage();
}

void perror(const char *a1)
{
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_listpidspath(uint32_t type, uint32_t typeinfo, const char *path, uint32_t pathflags, void *buffer, int buffersize)
{
  return _proc_listpidspath(type, typeinfo, path, pathflags, buffer, buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int reboot(int a1)
{
  return _reboot(a1);
}

uint64_t reboot3()
{
  return _reboot3();
}

int reboot_np(int howto, const char *message)
{
  return _reboot_np(howto, message);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return _removefile_state_alloc();
}

int removefile_state_free(removefile_state_t a1)
{
  return _removefile_state_free(a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return _removefile_state_get(state, key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

uint64_t sandbox_set_user_state_item()
{
  return _sandbox_set_user_state_item();
}

uint64_t sandbox_user_state_item_buffer_create()
{
  return _sandbox_user_state_item_buffer_create();
}

uint64_t sandbox_user_state_item_buffer_destroy()
{
  return _sandbox_user_state_item_buffer_destroy();
}

uint64_t sandbox_user_state_item_buffer_send()
{
  return _sandbox_user_state_item_buffer_send();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return _sysctlnametomib(a1, a2, a3);
}

void syslog(int a1, const char *a2, ...)
{
}

uint64_t terminate_with_reason()
{
  return _terminate_with_reason();
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int timespec_get(timespec *ts, int base)
{
  return _timespec_get(ts, base);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_mach_send_copy_right()
{
  return _xpc_mach_send_copy_right();
}

uint64_t xpc_mach_send_create()
{
  return _xpc_mach_send_create();
}

uint64_t xpc_user_sessions_enabled()
{
  return _xpc_user_sessions_enabled();
}

uint64_t xpc_user_sessions_get_session_uid()
{
  return _xpc_user_sessions_get_session_uid();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__allowlistedPreferencesKeys(void *a1, const char *a2, ...)
{
  return [a1 _allowlistedPreferencesKeys];
}

id objc_msgSend__broadcastBubbleDidPop(void *a1, const char *a2, ...)
{
  return [a1 _broadcastBubbleDidPop];
}

id objc_msgSend__broadcastDeviceLoginSessionStateDidUpdate(void *a1, const char *a2, ...)
{
  return [a1 _broadcastDeviceLoginSessionStateDidUpdate];
}

id objc_msgSend__broadcastUserSwitchTaskListDidUpdate(void *a1, const char *a2, ...)
{
  return [a1 _broadcastUserSwitchTaskListDidUpdate];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_anyBubblePopClients(void *a1, const char *a2, ...)
{
  return [a1 anyBubblePopClients];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asidMap(void *a1, const char *a2, ...)
{
  return [a1 asidMap];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bubbleDidPop(void *a1, const char *a2, ...)
{
  return [a1 bubbleDidPop];
}

id objc_msgSend_bubblePopstakeholderIsRegistered(void *a1, const char *a2, ...)
{
  return [a1 bubblePopstakeholderIsRegistered];
}

id objc_msgSend_bubbleShouldPop(void *a1, const char *a2, ...)
{
  return [a1 bubbleShouldPop];
}

id objc_msgSend_bubbleStakeHolder(void *a1, const char *a2, ...)
{
  return [a1 bubbleStakeHolder];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelMonitor(void *a1, const char *a2, ...)
{
  return [a1 cancelMonitor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_criticalStakeHolder(void *a1, const char *a2, ...)
{
  return [a1 criticalStakeHolder];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentPID(void *a1, const char *a2, ...)
{
  return [a1 currentPID];
}

id objc_msgSend_currentVersion(void *a1, const char *a2, ...)
{
  return [a1 currentVersion];
}

id objc_msgSend_dataValue(void *a1, const char *a2, ...)
{
  return [a1 dataValue];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deviceLoginSessionStateDidUpdate(void *a1, const char *a2, ...)
{
  return [a1 deviceLoginSessionStateDidUpdate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_fastLogoutTimer(void *a1, const char *a2, ...)
{
  return [a1 fastLogoutTimer];
}

id objc_msgSend_fetchUserBlockTaskList(void *a1, const char *a2, ...)
{
  return [a1 fetchUserBlockTaskList];
}

id objc_msgSend_fetchUserSyncTaskList(void *a1, const char *a2, ...)
{
  return [a1 fetchUserSyncTaskList];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return [a1 fullName];
}

id objc_msgSend_generation(void *a1, const char *a2, ...)
{
  return [a1 generation];
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return [a1 gid];
}

id objc_msgSend_hasUserSwitchTasks(void *a1, const char *a2, ...)
{
  return [a1 hasUserSwitchTasks];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_homeDirectory(void *a1, const char *a2, ...)
{
  return [a1 homeDirectory];
}

id objc_msgSend_ignoreIdentityMethods(void *a1, const char *a2, ...)
{
  return [a1 ignoreIdentityMethods];
}

id objc_msgSend_inLoginSession(void *a1, const char *a2, ...)
{
  return [a1 inLoginSession];
}

id objc_msgSend_inLogoutProcess(void *a1, const char *a2, ...)
{
  return [a1 inLogoutProcess];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logoutTimer(void *a1, const char *a2, ...)
{
  return [a1 logoutTimer];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_machPort(void *a1, const char *a2, ...)
{
  return [a1 machPort];
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return [a1 machServiceName];
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return [a1 manifest];
}

id objc_msgSend_memberships(void *a1, const char *a2, ...)
{
  return [a1 memberships];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_pidsToClients(void *a1, const char *a2, ...)
{
  return [a1 pidsToClients];
}

id objc_msgSend_platformClass(void *a1, const char *a2, ...)
{
  return [a1 platformClass];
}

id objc_msgSend_primaryGroupUUID(void *a1, const char *a2, ...)
{
  return [a1 primaryGroupUUID];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return [a1 proxy];
}

id objc_msgSend_remoteServiceName(void *a1, const char *a2, ...)
{
  return [a1 remoteServiceName];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resetStateForUserSwitch(void *a1, const char *a2, ...)
{
  return [a1 resetStateForUserSwitch];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_se(void *a1, const char *a2, ...)
{
  return [a1 se];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedBubbleXPCInterface(void *a1, const char *a2, ...)
{
  return [a1 sharedBubbleXPCInterface];
}

id objc_msgSend_sharedListener(void *a1, const char *a2, ...)
{
  return [a1 sharedListener];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharedXPCInterface(void *a1, const char *a2, ...)
{
  return [a1 sharedXPCInterface];
}

id objc_msgSend_shell(void *a1, const char *a2, ...)
{
  return [a1 shell];
}

id objc_msgSend_sideEffects(void *a1, const char *a2, ...)
{
  return [a1 sideEffects];
}

id objc_msgSend_splitUserVolumeEnabled(void *a1, const char *a2, ...)
{
  return [a1 splitUserVolumeEnabled];
}

id objc_msgSend_stakeholderIsRegistered(void *a1, const char *a2, ...)
{
  return [a1 stakeholderIsRegistered];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_switchState(void *a1, const char *a2, ...)
{
  return [a1 switchState];
}

id objc_msgSend_syncProxy(void *a1, const char *a2, ...)
{
  return [a1 syncProxy];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_userPersonas(void *a1, const char *a2, ...)
{
  return [a1 userPersonas];
}

id objc_msgSend_userSwitchTaskListDidUpdate(void *a1, const char *a2, ...)
{
  return [a1 userSwitchTaskListDidUpdate];
}

id objc_msgSend_userSwitchTasks(void *a1, const char *a2, ...)
{
  return [a1 userSwitchTasks];
}

id objc_msgSend_userSyncTasks(void *a1, const char *a2, ...)
{
  return [a1 userSyncTasks];
}

id objc_msgSend_userToSwitchTo(void *a1, const char *a2, ...)
{
  return [a1 userToSwitchTo];
}

id objc_msgSend_users(void *a1, const char *a2, ...)
{
  return [a1 users];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_wasToldWillSwitchUser(void *a1, const char *a2, ...)
{
  return [a1 wasToldWillSwitchUser];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}

id objc_msgSend_xpcListener(void *a1, const char *a2, ...)
{
  return [a1 xpcListener];
}