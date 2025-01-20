void *sub_213B107E0(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int64_t v4;
  void *result;
  int v6;

  v2 = *(void *)(a1 + 96);
  v3 = *(const void **)(a1 + 88);
  v4 = *(void *)(a1 + 104) - (void)v3;
  *(void *)(a1 + 912) = v4 >> 2;
  *(_DWORD *)(a1 + 920) = (unint64_t)(v2 - (void)v3) >> 2;
  result = memcpy(*(void **)(a1 + 928), v3, v4);
  v6 = *(_DWORD *)(a1 + 124);
  if (v6) {
    v6 = *(_DWORD *)(a1 + 128);
  }
  *(_DWORD *)(a1 + 992) = v6;
  *(_DWORD *)(a1 + 996) = *(_DWORD *)(a1 + 1000);
  *(void *)(a1 + 968) = *(void *)(a1 + 960);
  *(unsigned char *)(a1 + 984) = *(unsigned char *)(a1 + 137);
  *(_DWORD *)(a1 + 988) = *(_DWORD *)(a1 + 140);
  return result;
}

void *sub_213B10858(uint64_t a1, const void *a2, int a3)
{
  result = memcpy(*(void **)(a1 + 936), a2, 4 * a3);
  *(void *)(a1 + 944) = *(void *)(a1 + 936) + 4 * a3;
  return result;
}

uint64_t sub_213B10894(uint64_t result, int a2)
{
  uint64_t v2 = result;
  uint64_t v3 = a2;
  v4 = *(_DWORD **)(result + 104);
  if ((unint64_t)&v4[a2] >= *(void *)(result + 112))
  {
    result = sub_213B10908(result, a2);
    if (!result) {
      return result;
    }
    v4 = *(_DWORD **)(v2 + 104);
  }
  unint64_t v5 = *(void *)(v2 + 96);
  if (v5 < (unint64_t)v4)
  {
    v6 = v4;
    do
    {
      v6[v3] = *v6;
      --v6;
    }
    while ((unint64_t)v6 >= v5);
  }
  *(void *)(v2 + 104) = &v4[v3];
  return result;
}

uint64_t sub_213B10908(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 112);
  v4 = *(void **)(a1 + 88);
  uint64_t v5 = (v3 - (uint64_t)v4) >> 2;
  uint64_t v6 = v5 + 2;
  uint64_t v7 = 2 * (v5 + 2);
  if (v5 + 2 >= a2)
  {
    uint64_t v8 = 2 * (v5 + 2);
  }
  else
  {
    do
    {
      uint64_t v8 = v7;
      unint64_t v9 = v7 - v6;
      v7 *= 2;
    }
    while (v9 < a2);
  }
  uint64_t result = (uint64_t)malloc_type_realloc(v4, 4 * v8, 0x100004052888210uLL);
  if (result)
  {
    uint64_t v11 = result;
    bzero((void *)(result + 4 * v6), 4 * (v8 - v6));
    uint64_t v12 = *(void *)(a1 + 88);
    uint64_t v13 = v11 + *(void *)(a1 + 96) - v12;
    *(void *)(a1 + 88) = v11;
    *(void *)(a1 + 96) = v13;
    *(void *)(a1 + 104) = v11 + *(void *)(a1 + 104) - v12;
    *(void *)(a1 + 112) = v11 + 4 * v5;
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 936), 4 * v8, 0x100004052888210uLL);
    if (result)
    {
      uint64_t v14 = result;
      bzero((void *)(result + 4 * v6), 4 * (v8 - v6));
      uint64_t v15 = *(void *)(a1 + 936);
      *(void *)(a1 + 936) = v14;
      *(void *)(a1 + 944) = v14 + *(void *)(a1 + 944) - v15;
      *(void *)(a1 + 952) = *(void *)(a1 + 88) + *(void *)(a1 + 952) - v12;
      uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 928), 4 * v8, 0x100004052888210uLL);
      if (result)
      {
        uint64_t v16 = result;
        bzero((void *)(result + 4 * v6), 4 * (v8 - v6));
        *(void *)(a1 + 928) = v16;
        uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 960), 4 * v8, 0x100004052888210uLL);
        if (result)
        {
          uint64_t v17 = *(void *)(a1 + 960);
          *(void *)(a1 + 968) = result + *(void *)(a1 + 968) - v17;
          *(void *)(a1 + 976) = result + *(void *)(a1 + 976) - v17;
          *(void *)(a1 + 960) = result;
          uint64_t result = sub_213B14E6C(a1, v5 + 2, v8);
          if (result)
          {
            *(void *)(a1 + 112) = *(void *)(a1 + 88) + 4 * v8 - 8;
            v18 = *(void (**)(uint64_t, void))(a1 + 1032);
            if (v18) {
              v18(a1, *(void *)(a1 + 1040));
            }
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void *sub_213B10AEC(void *result, unsigned int a2)
{
  uint64_t v2 = result;
  uint64_t v3 = result[12];
  unint64_t v4 = result[13];
  unint64_t v5 = v3 + 4 * (int)a2;
  unint64_t v6 = (v4 - v3) >> 2;
  if (v5 <= v4) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = v6;
  }
  if (result[133] != result[134])
  {
    sub_213B107E0((uint64_t)result);
    uint64_t result = memcpy((void *)v2[117], (const void *)v2[12], 4 * (int)v7);
    v2[118] = v2[117] + 4 * (int)v7;
  }
  if ((int)v7 >= 1)
  {
    unint64_t v9 = (_DWORD *)v2[12];
    unint64_t v8 = v2[13];
    while ((unint64_t)v9 <= v8)
    {
      *unint64_t v9 = v9[v7];
      ++v9;
    }
    v2[13] = v8 - 4 * v7;
  }
  return result;
}

uint64_t sub_213B10B80(uint64_t result)
{
  uint64_t v2 = *(_DWORD **)(result + 96);
  unint64_t v1 = *(void *)(result + 104);
  if ((unint64_t)v2 <= v1)
  {
    uint64_t v3 = *(_DWORD **)(result + 96);
    do
    {
      int v4 = v3[1];
      ++v3;
      *uint64_t v2 = v4;
      uint64_t v2 = v3;
    }
    while ((unint64_t)v3 <= v1);
  }
  *(void *)(result + 104) = v1 - 4;
  return result;
}

void *sub_213B10BB0(void *result, unsigned int a2)
{
  uint64_t v2 = result;
  unint64_t v4 = result[11];
  uint64_t v3 = result[12];
  unint64_t v5 = v3 - 4 * (int)a2;
  unint64_t v6 = (v3 - v4) >> 2;
  if (v5 >= v4) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = v6;
  }
  if (result[133] != result[134])
  {
    sub_213B107E0((uint64_t)result);
    uint64_t result = memcpy((void *)v2[117], (const void *)(v2[12] - 4 * (int)v7), 4 * (int)v7);
    v2[118] = v2[117] + 4 * (int)v7;
  }
  if ((int)v7 >= 1)
  {
    unint64_t v8 = (_DWORD *)v2[12];
    unint64_t v9 = v2[13];
    if ((unint64_t)&v8[-v7] <= v9)
    {
      do
      {
        v8[-v7] = *v8;
        ++v8;
      }
      while ((unint64_t)&v8[-v7] <= v9);
    }
    v2[13] = v9 - 4 * v7;
  }
  return result;
}

uint64_t sub_213B10C64(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 104);
  uint64_t v2 = (_DWORD *)(*(void *)(result + 96) - 4);
  if ((unint64_t)v2 <= v1)
  {
    unint64_t v3 = *(void *)(result + 96) - 4;
    do
    {
      int v4 = *(_DWORD *)(v3 + 4);
      v3 += 4;
      *uint64_t v2 = v4;
      uint64_t v2 = (_DWORD *)v3;
    }
    while (v3 <= v1);
  }
  *(void *)(result + 104) = v1 - 4;
  return result;
}

BOOL sub_213B10C98(unsigned int __c)
{
  if (__c > 0x7F)
  {
    if (__maskrune(__c, 0x500uLL)) {
      return 1;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * __c + 60) & 0x500) != 0)
  {
    return 1;
  }
  return wcschr(dword_213B268F0, __c) != 0;
}

uint64_t sub_213B10D0C(unsigned int a1)
{
  if (a1 > 0x7F)
  {
    if (__maskrune(a1, 0x500uLL)) {
      return 1;
    }
    int v3 = __maskrune(a1, 0x800uLL);
    return 2 * (v3 != 0);
  }
  uint64_t result = 1;
  if (a1 != 95 && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * a1 + 60) & 0x500) == 0)
  {
    int v3 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a1 + 60) & 0x800;
    return 2 * (v3 != 0);
  }
  return result;
}

BOOL sub_213B10D94(unsigned int a1)
{
  if (a1 > 0x7F) {
    int v1 = __maskrune(a1, 0x4000uLL);
  }
  else {
    int v1 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a1 + 60) & 0x4000;
  }
  return v1 == 0;
}

unsigned int *sub_213B10DD8(uint64_t a1, unint64_t a2, int a3, unsigned int (*a4)(void))
{
  unint64_t v5 = (unsigned int *)(a1 - 4);
  if (a3)
  {
    int v7 = a3;
    do
    {
      while ((unint64_t)v5 >= a2 && !a4(*v5))
        --v5;
      while ((unint64_t)v5 >= a2 && a4(*v5))
        --v5;
      --v7;
    }
    while (v7);
  }
  if ((unint64_t)(v5 + 1) >= a2) {
    return v5 + 1;
  }
  else {
    return (unsigned int *)a2;
  }
}

unsigned int *sub_213B10E58(unsigned int *a1, unint64_t a2, int a3, unsigned int (*a4)(void))
{
  if (a3)
  {
    int v7 = a3;
    do
    {
      while ((unint64_t)a1 < a2 && !a4(*a1))
        ++a1;
      while ((unint64_t)a1 < a2 && a4(*a1))
        ++a1;
      --v7;
    }
    while (v7);
  }
  if ((unint64_t)a1 <= a2) {
    return a1;
  }
  else {
    return (unsigned int *)a2;
  }
}

unsigned int *sub_213B10ED4(uint64_t a1, unsigned int *a2, unint64_t a3, int a4, uint64_t (*a5)(void))
{
  if (a4)
  {
    int v8 = a4;
    uint64_t v10 = MEMORY[0x263EF8318];
    while (1)
    {
      int v11 = a5(*a2);
      if ((unint64_t)a2 < a3)
      {
        int v12 = v11;
        do
        {
          if (a5(*a2) != v12) {
            break;
          }
          ++a2;
        }
        while ((unint64_t)a2 < a3);
      }
      if (!--v8) {
        break;
      }
      while ((unint64_t)a2 < a3)
      {
LABEL_15:
        uint64_t v14 = *a2;
        if (v14 > 0x7F)
        {
          if (!__maskrune(v14, 0x4000uLL)) {
            break;
          }
        }
        else if ((*(_DWORD *)(v10 + 4 * v14 + 60) & 0x4000) == 0)
        {
          break;
        }
        ++a2;
      }
      if (!v8) {
        goto LABEL_20;
      }
    }
    if (*(_DWORD *)(a1 + 1000) != 3 && (unint64_t)a2 < a3) {
      goto LABEL_15;
    }
  }
LABEL_20:
  if ((unint64_t)a2 <= a3) {
    return a2;
  }
  else {
    return (unsigned int *)a3;
  }
}

unsigned int *sub_213B10FB8(uint64_t a1, unint64_t a2, int a3, uint64_t (*a4)(void))
{
  unint64_t v5 = (unsigned int *)(a1 - 4);
  if (a3)
  {
    int v7 = a3;
    uint64_t v8 = MEMORY[0x263EF8318];
    while (1)
    {
      if ((unint64_t)v5 <= a2) {
        goto LABEL_8;
      }
      uint64_t v9 = *v5;
      if (v9 > 0x7F)
      {
        if (!__maskrune(v9, 0x4000uLL)) {
          goto LABEL_8;
        }
LABEL_6:
        --v5;
      }
      else
      {
        if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000) != 0) {
          goto LABEL_6;
        }
LABEL_8:
        int v10 = a4(*v5);
        if ((unint64_t)v5 >= a2)
        {
          int v11 = v10;
          do
          {
            if (a4(*v5) != v11) {
              break;
            }
            --v5;
          }
          while ((unint64_t)v5 >= a2);
        }
        if (!--v7) {
          break;
        }
      }
    }
  }
  if ((unint64_t)(v5 + 1) >= a2) {
    return v5 + 1;
  }
  else {
    return (unsigned int *)a2;
  }
}

uint64_t sub_213B1107C(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 1000);
  if ((v2 & 2) != 0) {
    *(void *)(result + 1064) = *(void *)(result + 1056);
  }
  int v3 = *(char **)(result + 1008);
  if (v3)
  {
    if (((*(void *)(result + 96) - (void)v3) >> 2) <= 1) {
      signed int v4 = 1;
    }
    else {
      signed int v4 = (*(void *)(result + 96) - (void)v3) >> 2;
    }
    *(void *)(result + 96) = v3;
    if ((v2 & 4) != 0)
    {
      if (v4 < 1)
      {
        v3 += 4 * v4;
        signed int v4 = -v4;
      }
      uint64_t result = (uint64_t)memcpy(*(void **)(result + 936), v3, 4 * v4);
      *(void *)(v1 + 944) = *(void *)(v1 + 936) + 4 * v4;
    }
    else if (v4 < 1)
    {
      uint64_t result = (uint64_t)sub_213B10BB0((void *)result, -v4);
      *(void *)(v1 + 96) += 4 * v4;
    }
    else
    {
      sub_213B10AEC((void *)result, v4);
      uint64_t result = sub_213B1D13C(v1);
    }
    *(_DWORD *)(v1 + 1000) = 0;
  }
  return result;
}

unsigned int *sub_213B11134(uint64_t a1, unint64_t a2, int a3, uint64_t (*a4)(void))
{
  signed int v4 = (unsigned int *)(a1 + 4);
  if (a3)
  {
    int v6 = a3;
    uint64_t v8 = MEMORY[0x263EF8318];
    while (1)
    {
      if ((unint64_t)v4 >= a2) {
        goto LABEL_8;
      }
      uint64_t v9 = *v4;
      if (v9 > 0x7F)
      {
        if (!__maskrune(v9, 0x4000uLL)) {
          goto LABEL_8;
        }
LABEL_6:
        ++v4;
      }
      else
      {
        if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000) != 0) {
          goto LABEL_6;
        }
LABEL_8:
        int v10 = a4(*v4);
        if ((unint64_t)v4 < a2)
        {
          int v11 = v10;
          do
          {
            if (a4(*v4) != v11) {
              break;
            }
            ++v4;
          }
          while ((unint64_t)v4 < a2);
        }
        if (!--v6) {
          return v4 - 1;
        }
      }
    }
  }
  return v4 - 1;
}

uint64_t sub_213B111F0(uint64_t a1)
{
  int v2 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(void *)(a1 + 88) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  bzero(v2, 0x1000uLL);
  uint64_t v3 = *(void *)(a1 + 88);
  *(void *)(a1 + 96) = v3;
  *(void *)(a1 + 104) = v3;
  *(void *)(a1 + 112) = v3 + 4088;
  signed int v4 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(void *)(a1 + 928) = v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  bzero(v4, 0x1000uLL);
  *(void *)(a1 + 912) = -1;
  *(_DWORD *)(a1 + 920) = 0;
  unint64_t v5 = (char *)malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(void *)(a1 + 960) = v5;
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 968) = v5;
  *(void *)(a1 + 976) = v5 + 4096;
  *(unsigned char *)(a1 + 984) = 34;
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 1008) = *(void *)(a1 + 88);
  int v6 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(void *)(a1 + 936) = v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  bzero(v6, 0x1000uLL);
  *(void *)(a1 + 952) = *(void *)(a1 + 88);
  *(void *)(a1 + 944) = *(void *)(a1 + 936);
  *(void *)(a1 + 1040) = 0;
  *(void *)(a1 + 1032) = 0;
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  *(_OWORD *)(a1 + 120) = xmmword_213B268E0;
  *(unsigned char *)(a1 + 136) = 34;
  *(void *)(a1 + 1016) = 0xFFFFFFFFLL;
  int v7 = malloc_type_malloc(0x50uLL, 0x10040436913F5uLL);
  *(void *)(a1 + 1024) = v7;
  if (v7) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_213B11348(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 88);
  *(void *)(a1 + 96) = v2;
  *(void *)(a1 + 104) = v2;
  *(void *)(a1 + 912) = -1;
  *(_DWORD *)(a1 + 920) = 0;
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 1008) = v2;
  *(void *)(a1 + 952) = v2;
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  *(_OWORD *)(a1 + 120) = xmmword_213B268E0;
  *(unsigned char *)(a1 + 136) = 34;
  *(_DWORD *)(a1 + 1176) = 0;
  if (a2)
  {
    while (1)
    {
      unsigned int v4 = *(_DWORD *)(a1 + 1016);
      if ((v4 & 0x80000000) != 0) {
        break;
      }
      uint64_t v5 = *(void *)(a1 + 1024);
      *(_DWORD *)(a1 + 1016) = v4 - 1;
      free(*(void **)(v5 + 8 * v4));
    }
  }
}

void sub_213B113CC(uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 112) = 0;
  free(*(void **)(a1 + 928));
  *(void *)(a1 + 928) = 0;
  free(*(void **)(a1 + 960));
  *(void *)(a1 + 968) = 0;
  *(void *)(a1 + 960) = 0;
  *(void *)(a1 + 976) = 0;
  *(unsigned char *)(a1 + 984) = 34;
  free(*(void **)(a1 + 936));
  *(void *)(a1 + 936) = 0;
  sub_213B11348(a1, 1);
  free(*(void **)(a1 + 1024));
  *(void *)(a1 + 1024) = 0;
}

int el_winsertstr(EditLine *a1, const __int32 *a2)
{
  if (!a2) {
    return -1;
  }
  size_t v4 = wcslen(a2);
  if (!v4) {
    return -1;
  }
  int v5 = v4;
  if (*((void *)a1 + 13) + 4 * v4 >= *((void *)a1 + 14) && !sub_213B10908((uint64_t)a1, v4)) {
    return -1;
  }
  sub_213B10894((uint64_t)a1, v5);
  __int32 v6 = *a2;
  if (!*a2) {
    return 0;
  }
  int v7 = (__int32 *)*((void *)a1 + 12);
  uint64_t v8 = a2 + 1;
  do
  {
    *v7++ = v6;
    __int32 v9 = *v8++;
    __int32 v6 = v9;
  }
  while (v9);
  int result = 0;
  *((void *)a1 + 12) = v7;
  return result;
}

void el_deletestr(EditLine *a1, int a2)
{
  if (a2 >= 1 && *((void *)a1 + 12) >= *((void *)a1 + 11) + 4 * (unint64_t)a2)
  {
    uint64_t v3 = a2;
    sub_213B10BB0(a1, a2);
    unint64_t v4 = *((void *)a1 + 12) - 4 * v3;
    if (v4 < *((void *)a1 + 11)) {
      unint64_t v4 = *((void *)a1 + 11);
    }
    *((void *)a1 + 12) = v4;
  }
}

uint64_t sub_213B11550(uint64_t a1, uint64_t a2, __int32 *a3)
{
  int v5 = *(__int32 **)(a1 + 88);
  if (a3)
  {
    size_t v7 = wcslen(a3);
    memcpy(v5, a3, 4 * v7);
    v5 += v7;
  }
  __int32 v14 = 0;
  *int v5 = 32;
  *(void *)(a1 + 96) = v5;
  *(void *)(a1 + 104) = v5 + 1;
  sub_213B1C450(a1);
  if (el_wgetc((EditLine *)a1, &v14) == 1)
  {
    uint64_t v8 = 0;
    do
    {
      __int32 v9 = v14;
      if (v14 <= 12)
      {
        if (v14 == 8)
        {
LABEL_13:
          if (!v8) {
            goto LABEL_23;
          }
          *(v5 - 1) = 32;
          *(void *)(a1 + 96) = v5 - 1;
          *(void *)(a1 + 104) = v5;
          sub_213B1C450(a1);
          int v11 = el_wgetc((EditLine *)a1, &v14);
          --v5;
          continue;
        }
        if (v14 == 10) {
          goto LABEL_24;
        }
      }
      else
      {
        if (v14 == 127) {
          goto LABEL_13;
        }
        if (v14 == 13 || v14 == 27)
        {
LABEL_24:
          *(_DWORD *)(a2 + 4 * v8) = v14;
          goto LABEL_25;
        }
      }
      if (v8 < 1008)
      {
        *(_DWORD *)(a2 + 4 * v8) = v14;
        *v5++ = v9;
        ++v8;
      }
      else
      {
        el_beep_0((EditLine *)a1);
      }
      *int v5 = 32;
      *(void *)(a1 + 96) = v5;
      *(void *)(a1 + 104) = v5 + 1;
      sub_213B1C450(a1);
      int v11 = el_wgetc((EditLine *)a1, &v14);
    }
    while (v11 == 1);
  }
  sub_213B11718(a1);
LABEL_23:
  uint64_t v8 = -1;
LABEL_25:
  int v12 = *(_DWORD **)(a1 + 88);
  *int v12 = 0;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v12;
  return v8;
}

uint64_t sub_213B116C0(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 88);
  uint64_t v1 = *(void *)(a1 + 96);
  if (v1 == v2) {
    return 0;
  }
  uint64_t v3 = -4;
  do
  {
    uint64_t v4 = v3;
    int v5 = (int *)(v1 + v3);
    if ((unint64_t)v5 < v2) {
      break;
    }
    int v6 = *v5;
    uint64_t v3 = v4 - 4;
  }
  while (v6 != 10);
  return ((unint64_t)-v4 >> 2) - 1;
}

uint64_t sub_213B11708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 1032) = a2;
  *(void *)(a1 + 1040) = a3;
  return 0;
}

uint64_t sub_213B11718(uint64_t a1)
{
  **(_DWORD **)(a1 + 104) = 0;
  return 2;
}

uint64_t sub_213B11748(uint64_t a1, int a2)
{
  if (!a2) {
    return 6;
  }
  int v4 = *(_DWORD *)(a1 + 128);
  if ((unint64_t)(*(void *)(a1 + 104) + 4 * v4) >= *(void *)(a1 + 112)
    && !sub_213B10908(a1, v4))
  {
    return 6;
  }
  int v5 = *(_DWORD *)(a1 + 120);
  if (v4 == 1)
  {
    if (!v5 || (int v6 = *(_DWORD **)(a1 + 96), (unint64_t)v6 >= *(void *)(a1 + 104)))
    {
      sub_213B10894(a1, 1);
      int v6 = *(_DWORD **)(a1 + 96);
    }
    _DWORD *v6 = a2;
    *(void *)(a1 + 96) = v6 + 1;
    sub_213B1D2AC(a1);
  }
  else
  {
    if (v5 != 2) {
      sub_213B10894(a1, *(_DWORD *)(a1 + 128));
    }
    if (v4)
    {
      __int32 v9 = *(_DWORD **)(a1 + 96);
      unint64_t v8 = *(void *)(a1 + 104);
      do
      {
        if ((unint64_t)v9 >= v8) {
          break;
        }
        *v9++ = a2;
        *(void *)(a1 + 96) = v9;
        --v4;
      }
      while (v4);
    }
    sub_213B1C450(a1);
  }
  if (*(_DWORD *)(a1 + 120) != 2) {
    return 0;
  }

  return sub_213B22C98(a1);
}

uint64_t sub_213B11858(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 == v3) {
    return 6;
  }
  int v4 = sub_213B10DD8(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_213B10C98);
  int v5 = v4;
  int v6 = *(_DWORD **)(a1 + 936);
  unint64_t v7 = *(void *)(a1 + 96);
  if ((unint64_t)v4 < v7)
  {
    unint64_t v8 = v4;
    do
    {
      int v9 = *v8++;
      *v6++ = v9;
    }
    while ((unint64_t)v8 < v7);
  }
  *(void *)(a1 + 944) = v6;
  sub_213B10BB0((void *)a1, (v7 - (unint64_t)v4) >> 2);
  int v10 = *(unsigned int **)(a1 + 88);
  if (v5 >= v10) {
    int v10 = v5;
  }
  *(void *)(a1 + 96) = v10;
  return 4;
}

uint64_t sub_213B118F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (v2 == *(void *)(a1 + 104))
  {
    if (*(_DWORD *)(a1 + 1096) != 1 || v2 == *(void *)(a1 + 88)) {
      return 6;
    }
    *(void *)(a1 + 96) = v2 - 4;
  }
  sub_213B10AEC((void *)a1, *(_DWORD *)(a1 + 128));
  if (*(_DWORD *)(a1 + 1096) == 1)
  {
    unint64_t v4 = *(void *)(a1 + 96);
    unint64_t v3 = *(void *)(a1 + 104);
    if (v4 >= v3 && v4 > *(void *)(a1 + 88)) {
      *(void *)(a1 + 96) = v3 - 4;
    }
  }
  return 4;
}

uint64_t sub_213B1198C(void *a1)
{
  uint64_t v1 = (_DWORD *)a1[117];
  unint64_t v2 = a1[12];
  unint64_t v3 = a1[13];
  if (v2 < v3)
  {
    unint64_t v4 = (int *)a1[12];
    do
    {
      int v5 = *v4++;
      *v1++ = v5;
    }
    while ((unint64_t)v4 < v3);
  }
  a1[118] = v1;
  a1[13] = v2;
  return 4;
}

uint64_t sub_213B119C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 104);
  *(void *)(a1 + 96) = v1;
  if (*(_DWORD *)(a1 + 1096) == 1)
  {
    if (*(_DWORD *)(a1 + 1000))
    {
      sub_213B1107C(a1);
      return 4;
    }
    *(void *)(a1 + 96) = v1 - 4;
  }
  return 5;
}

uint64_t sub_213B11A08(uint64_t a1)
{
  uint64_t v1 = *(unsigned int **)(a1 + 88);
  *(void *)(a1 + 96) = v1;
  if (*(_DWORD *)(a1 + 1096) != 1) {
    return 5;
  }
  uint64_t v3 = MEMORY[0x263EF8318];
  while (1)
  {
    uint64_t v4 = *v1;
    if (v4 > 0x7F) {
      break;
    }
    if ((*(_DWORD *)(v3 + 4 * v4 + 60) & 0x4000) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v1 = (unsigned int *)(*(void *)(a1 + 96) + 4);
    *(void *)(a1 + 96) = v1;
  }
  if (__maskrune(v4, 0x4000uLL)) {
    goto LABEL_7;
  }
LABEL_8:
  if (*(_DWORD *)(a1 + 1000))
  {
    sub_213B1107C(a1);
    return 4;
  }
  return 5;
}

uint64_t sub_213B11A9C(void *a1)
{
  unint64_t v1 = a1[12];
  unint64_t v2 = a1[13];
  uint64_t v3 = a1[11];
  if (v1 < v2)
  {
    if (v2 <= v3 + 4) {
      return 6;
    }
    v1 += 4;
    a1[12] = v1;
  }
  if (v1 > v3 + 4)
  {
    *(int32x2_t *)(v1 - 8) = vrev64_s32(*(int32x2_t *)(v1 - 8));
    return 4;
  }
  return 6;
}

uint64_t sub_213B11AE8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 96);
  unint64_t v1 = *(void *)(a1 + 104);
  if (v2 >= v1) {
    return 6;
  }
  int v3 = *(_DWORD *)(a1 + 1096);
  if (v2 == v1 - 4)
  {
    if (v3 != 1)
    {
      unint64_t v7 = v2 + 4 * *(int *)(a1 + 128);
      if (v7 <= v1) {
        unint64_t v1 = v7;
      }
      *(void *)(a1 + 96) = v1;
      return 5;
    }
    if (*(_DWORD *)(a1 + 1000))
    {
      unint64_t v5 = v2 + 4 * *(int *)(a1 + 128);
      if (v5 <= v1) {
        unint64_t v1 = v5;
      }
      *(void *)(a1 + 96) = v1;
LABEL_12:
      if (*(_DWORD *)(a1 + 1000))
      {
        sub_213B1107C(a1);
        return 4;
      }
      return 5;
    }
    return 6;
  }
  unint64_t v4 = v2 + 4 * *(int *)(a1 + 128);
  if (v4 <= v1) {
    unint64_t v1 = v4;
  }
  *(void *)(a1 + 96) = v1;
  if (v3 == 1) {
    goto LABEL_12;
  }
  return 5;
}

uint64_t sub_213B11B90(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 == v3) {
    return 6;
  }
  *(void *)(a1 + 96) = sub_213B10DD8(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_213B10C98);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5;
  }
  sub_213B1107C(a1);
  return 4;
}

uint64_t sub_213B11C0C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 88);
  unint64_t v2 = *(void *)(a1 + 96);
  if (v2 <= v1) {
    return 6;
  }
  unint64_t v3 = v2 - 4 * *(int *)(a1 + 128);
  if (v3 >= v1) {
    unint64_t v1 = v3;
  }
  *(void *)(a1 + 96) = v1;
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5;
  }
  sub_213B1107C(a1);
  return 4;
}

uint64_t sub_213B11C6C(uint64_t a1)
{
  __int32 v5 = 0;
  sub_213B21EC4(a1);
  int v2 = el_wgetc((EditLine *)a1, &v5);
  int v3 = v5;
  sub_213B21FB4(a1);
  if (v2 == 1) {
    return sub_213B11748(a1, v3);
  }
  sub_213B1D088(a1);
  **(_DWORD **)(a1 + 104) = 0;
  return 2;
}

uint64_t sub_213B11CEC(uint64_t a1, unsigned int a2)
{
  if (a2 > 0xFF || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2 + 60) & 0x400) == 0) {
    return 6;
  }
  if (!*(_DWORD *)(a1 + 124)) {
    return sub_213B11748(a1, a2);
  }
  if (*(unsigned char *)(a1 + 136) == 52)
  {
    int v3 = a2 - 48;
  }
  else
  {
    int v4 = *(_DWORD *)(a1 + 128);
    if (v4 > 1000000) {
      return 6;
    }
    int v3 = a2 + 10 * v4 - 48;
  }
  *(_DWORD *)(a1 + 128) = v3;
  return 3;
}

uint64_t sub_213B11D5C(uint64_t a1, unsigned int a2)
{
  if (a2 > 0xFF || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2 + 60) & 0x400) == 0) {
    return 6;
  }
  if (*(_DWORD *)(a1 + 124))
  {
    int v2 = *(_DWORD *)(a1 + 128);
    if (v2 > 1000000) {
      return 6;
    }
    *(_DWORD *)(a1 + 128) = a2 + 10 * v2 - 48;
  }
  else
  {
    *(_DWORD *)(a1 + 124) = 1;
    *(_DWORD *)(a1 + 128) = a2 - 48;
  }
  return 3;
}

uint64_t sub_213B11DC4()
{
  return 6;
}

uint64_t sub_213B11DCC()
{
  return 0;
}

uint64_t sub_213B11DD4()
{
  return 0;
}

uint64_t sub_213B11DDC()
{
  return 0;
}

uint64_t sub_213B11DE4()
{
  return 0;
}

uint64_t sub_213B11DEC()
{
  return 0;
}

uint64_t sub_213B11DF4()
{
  return 0;
}

uint64_t sub_213B11DFC()
{
  return 0;
}

uint64_t sub_213B11E04(uint64_t a1)
{
  sub_213B1D088(a1);
  int v2 = *(void **)(a1 + 104);
  *int v2 = 10;
  *(void *)(a1 + 104) = (char *)v2 + 4;
  return 1;
}

uint64_t sub_213B11E40(uint64_t a1)
{
  if (*(void *)(a1 + 96) <= *(void *)(a1 + 88)) {
    return 6;
  }
  sub_213B10BB0((void *)a1, *(_DWORD *)(a1 + 128));
  unint64_t v2 = *(void *)(a1 + 96) - 4 * *(int *)(a1 + 128);
  if (v2 < *(void *)(a1 + 88)) {
    unint64_t v2 = *(void *)(a1 + 88);
  }
  *(void *)(a1 + 96) = v2;
  return 4;
}

uint64_t sub_213B11E98(void *a1)
{
  return 4;
}

uint64_t sub_213B11EC8()
{
  return 8;
}

uint64_t sub_213B11ED0(uint64_t a1)
{
  return 4;
}

uint64_t sub_213B11EF0()
{
  return 0;
}

uint64_t sub_213B11EF8(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1176);
  *(void *)(a1 + 912) = -1;
  **(_DWORD **)(a1 + 104) = 0;
  int v3 = *(_DWORD *)(a1 + 1176);
  if (!v3)
  {
    wcsncpy(*(__int32 **)(a1 + 1152), *(const __int32 **)(a1 + 88), 0x400uLL);
    *(void *)(a1 + 1168) = *(void *)(a1 + 1152) + *(void *)(a1 + 104) - *(void *)(a1 + 88);
    int v3 = *(_DWORD *)(a1 + 1176);
  }
  *(_DWORD *)(a1 + 1176) = v3 + *(_DWORD *)(a1 + 128);
  if (sub_213B14AA8(a1) != 6) {
    return 4;
  }
  if (*(_DWORD *)(a1 + 1096) == 1) {
    *(_DWORD *)(a1 + 1176) = v2;
  }
  sub_213B14AA8(a1);
  return 9;
}

uint64_t sub_213B11FA0(uint64_t a1)
{
  *(void *)(a1 + 912) = -1;
  **(_DWORD **)(a1 + 104) = 0;
  int v1 = *(_DWORD *)(a1 + 128);
  int v2 = *(_DWORD *)(a1 + 1176);
  BOOL v3 = __OFSUB__(v2, v1);
  int v5 = v2 - v1;
  char v4 = (v5 < 0) ^ v3;
  int v6 = v5 & ~(v5 >> 31);
  if (v4) {
    unsigned int v7 = 9;
  }
  else {
    unsigned int v7 = 4;
  }
  *(_DWORD *)(a1 + 1176) = v6;
  LODWORD(result) = sub_213B14AA8(a1);
  if (result == 4) {
    return v7;
  }
  else {
    return result;
  }
}

uint64_t sub_213B11FF8(size_t a1)
{
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 912) = -1;
  **(_DWORD **)(a1 + 104) = 0;
  int v2 = *(_DWORD *)(a1 + 1176);
  if (v2 < 0)
  {
    *(_DWORD *)(a1 + 1176) = 0;
    return 6;
  }
  if (!v2)
  {
    wcsncpy(*(__int32 **)(a1 + 1152), *(const __int32 **)(a1 + 88), 0x400uLL);
    *(void *)(a1 + 1168) = *(void *)(a1 + 1152) + *(void *)(a1 + 104) - *(void *)(a1 + 88);
  }
  uint64_t v3 = *(void *)(a1 + 1184);
  if (!v3) {
    return 6;
  }
  if ((*(unsigned char *)(a1 + 44) & 0x40) != 0)
  {
    char v4 = sub_213B14C70(a1, 3);
    if (v4) {
      goto LABEL_12;
    }
    return 6;
  }
  if ((*(unsigned int (**)(uint64_t))(a1 + 1192))(v3) == -1) {
    return 6;
  }
  char v4 = *(__int32 **)(a1 + 1208);
  if (!v4) {
    return 6;
  }
LABEL_12:
  sub_213B1D80C(a1);
  if (*(int *)(a1 + 1176) >= 1)
  {
    int v6 = 0;
    do
    {
      if ((*(unsigned char *)(a1 + 44) & 0x40) != 0)
      {
        char v4 = sub_213B14C70(a1, 6);
      }
      else if ((*(unsigned int (**)(void, size_t, uint64_t))(a1 + 1192))(*(void *)(a1 + 1184), a1 + 1200, 6) == -1)
      {
        char v4 = 0;
      }
      else
      {
        char v4 = *(__int32 **)(a1 + 1208);
      }
      ++v6;
    }
    while (v6 < *(_DWORD *)(a1 + 1176));
    if (v4)
    {
      int v7 = v6 + 1;
      goto LABEL_23;
    }
    return 6;
  }
  int v7 = 1;
LABEL_23:
  while (!wcsncmp(v4, *(const __int32 **)(a1 + 88), (uint64_t)(*(void *)(a1 + 104) - *(void *)(a1 + 88)) >> 2)
       && !*(__int32 *)((char *)v4 + *(void *)(a1 + 104) - *(void *)(a1 + 88))
       || !sub_213B1D7FC(a1, v4))
  {
    if ((*(unsigned char *)(a1 + 44) & 0x40) != 0)
    {
      char v4 = sub_213B14C70(a1, 6);
    }
    else
    {
      if ((*(unsigned int (**)(void, size_t, uint64_t))(a1 + 1192))(*(void *)(a1 + 1184), a1 + 1200, 6) == -1) {
        return 6;
      }
      char v4 = *(__int32 **)(a1 + 1208);
    }
    ++v7;
    if (!v4) {
      return 6;
    }
  }
  *(_DWORD *)(a1 + 1176) = v7;

  return sub_213B14AA8(a1);
}

uint64_t sub_213B12210(size_t a1)
{
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 912) = -1;
  **(_DWORD **)(a1 + 104) = 0;
  if (!*(_DWORD *)(a1 + 1176)) {
    return 6;
  }
  uint64_t v2 = *(void *)(a1 + 1184);
  if (!v2) {
    return 6;
  }
  if ((*(unsigned char *)(a1 + 44) & 0x40) != 0)
  {
    uint64_t v3 = sub_213B14C70(a1, 3);
    if (!v3) {
      return 6;
    }
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t))(a1 + 1192))(v2) == -1) {
      return 6;
    }
    uint64_t v3 = *(__int32 **)(a1 + 1208);
    if (!v3) {
      return 6;
    }
  }
  sub_213B1D80C(a1);
  if (*(int *)(a1 + 1176) >= 2)
  {
    int v4 = 0;
    int v5 = 2;
    do
    {
      if ((wcsncmp(v3, *(const __int32 **)(a1 + 88), (uint64_t)(*(void *)(a1 + 104) - *(void *)(a1 + 88)) >> 2)
         || *(__int32 *)((char *)v3 + *(void *)(a1 + 104) - *(void *)(a1 + 88)))
        && sub_213B1D7FC(a1, v3))
      {
        int v4 = v5 - 1;
      }
      if ((*(unsigned char *)(a1 + 44) & 0x40) != 0)
      {
        uint64_t v3 = sub_213B14C70(a1, 6);
      }
      else
      {
        if ((*(unsigned int (**)(void, size_t, uint64_t))(a1 + 1192))(*(void *)(a1 + 1184), a1 + 1200, 6) == -1)break; {
        uint64_t v3 = *(__int32 **)(a1 + 1208);
        }
      }
      if (v5 >= *(_DWORD *)(a1 + 1176)) {
        break;
      }
      ++v5;
    }
    while (v3);
    if (v4) {
      goto LABEL_23;
    }
  }
  if (!sub_213B1D7FC(a1, *(__int32 **)(a1 + 1152))) {
    return 6;
  }
  int v4 = 0;
LABEL_23:
  *(_DWORD *)(a1 + 1176) = v4;

  return sub_213B14AA8(a1);
}

uint64_t sub_213B123C0(uint64_t a1)
{
  int v2 = sub_213B116C0(a1);
  unint64_t v3 = *(void *)(a1 + 88);
  int v4 = *(_DWORD **)(a1 + 96);
  if (*v4 == 10) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = 0;
  }
  for (i = &v4[v5]; (unint64_t)i >= v3; --i)
  {
    if (*i == 10)
    {
      int v7 = *(_DWORD *)(a1 + 128);
      *(_DWORD *)(a1 + 128) = v7 - 1;
      if (v7 < 2) {
        goto LABEL_11;
      }
    }
  }
  if (*(int *)(a1 + 128) > 0) {
    return 6;
  }
LABEL_11:
  int v9 = i - 1;
  do
  {
    int v10 = v9;
    if ((unint64_t)v9 < v3) {
      break;
    }
    --v9;
  }
  while (*v10 != 10);
  int v11 = v10 + 1;
  do
  {
    int v12 = v11;
    BOOL v13 = __OFSUB__(v2--, 1);
    if (v2 < 0 != v13) {
      break;
    }
    if ((unint64_t)v11 >= *(void *)(a1 + 104)) {
      break;
    }
    ++v11;
  }
  while (*v12 != 10);
  *(void *)(a1 + 96) = v12;
  return 5;
}

uint64_t sub_213B12490(uint64_t a1)
{
  int v2 = sub_213B116C0(a1);
  int v4 = *(_DWORD **)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  while ((unint64_t)v4 < v3)
  {
    if (*v4 == 10)
    {
      int v5 = *(_DWORD *)(a1 + 128);
      *(_DWORD *)(a1 + 128) = v5 - 1;
      if (v5 < 2) {
        goto LABEL_8;
      }
    }
    ++v4;
  }
  if (*(int *)(a1 + 128) > 0) {
    return 6;
  }
LABEL_8:
  int v7 = v4 + 1;
  do
  {
    unint64_t v8 = v7;
    BOOL v9 = __OFSUB__(v2--, 1);
    if (v2 < 0 != v9) {
      break;
    }
    if ((unint64_t)v7 >= v3) {
      break;
    }
    ++v7;
  }
  while (*v8 != 10);
  *(void *)(a1 + 96) = v8;
  return 5;
}

uint64_t sub_213B1252C()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v1 = sub_213B11550(v0, (uint64_t)v3, dword_213B26920);
  sub_213B1F0BC(v0, 0xAu);
  if (v1 < 0 || (v3[v1] = 0, sub_213B17A54((EditLine *)v0, v3) == -1)) {
    el_beep_0((EditLine *)v0);
  }
  *(void *)(v0 + 1064) = *(void *)(v0 + 1056);
  sub_213B1D104(v0);
  return 4;
}

EditLine *__cdecl el_init(const char *a1, FILE *a2, FILE *a3, FILE *a4)
{
  unint64_t v8 = malloc_type_malloc(0x548uLL, 0x10F2040B13C76DEuLL);
  uint64_t v9 = (uint64_t)v8;
  if (!v8) {
    return (EditLine *)v9;
  }
  bzero(v8, 0x548uLL);
  *(void *)(v9 + 8) = a2;
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  *(_DWORD *)(v9 + 32) = fileno(a2);
  *(_DWORD *)(v9 + 36) = fileno(a3);
  *(_DWORD *)(v9 + 40) = fileno(a4);
  int v10 = sub_213B238D0((__int32 *)a1, v9 + 1264);
  int v11 = sub_213B24874(v10);
  *(void *)uint64_t v9 = v11;
  if (!v11)
  {
LABEL_13:
    free((void *)v9);
    return 0;
  }
  *(_DWORD *)(v9 + 44) = 0;
  int v12 = setlocale(2, 0);
  if (v12 && (strcmp(v12, "C") || setlocale(2, "")))
  {
    BOOL v13 = nl_langinfo(0);
    if (!strcmp(v13, "UTF-8")) {
      *(_DWORD *)(v9 + 44) |= 0x10u;
    }
  }
  if (sub_213B1E5C0((void *)v9) == -1)
  {
    free(*(void **)v9);
    goto LABEL_13;
  }
  sub_213B161B4(v9);
  sub_213B16D18(v9);
  if (sub_213B21450(v9) == -1) {
    *(_DWORD *)(v9 + 44) |= 2u;
  }
  sub_213B111F0(v9);
  sub_213B1D6C4(v9);
  sub_213B14A08((void *)v9);
  sub_213B18054(v9);
  sub_213B1E264(v9);
  sub_213B18148(v9);
  return (EditLine *)v9;
}

void el_end(EditLine *a1)
{
  if (a1)
  {
    sub_213B21E68((uint64_t)a1);
    sub_213B11348((uint64_t)a1, 0);
    sub_213B1EAA0((uint64_t)a1);
    sub_213B1623C((uint64_t)a1);
    sub_213B16EEC((uint64_t)a1);
    sub_213B21784((uint64_t)a1);
    sub_213B113CC((uint64_t)a1);
    sub_213B1D728((uint64_t)a1);
    sub_213B14A6C((uint64_t)a1);
    nullsub_1(a1);
    sub_213B1E310((uint64_t)a1);
    free(*(void **)a1);
    free(*((void **)a1 + 158));
    free(*((void **)a1 + 160));
    free(*((void **)a1 + 162));
    free(*((void **)a1 + 164));
    free(a1);
  }
}

void el_reset(EditLine *a1)
{
  sub_213B21E68((uint64_t)a1);

  sub_213B11348((uint64_t)a1, 0);
}

int el_wset(EditLine *a1, int a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  v21 = va_arg(va1, char *);
  v22 = va_arg(va1, FILE *);
  uint64_t v23 = va_arg(va1, void);
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!a1) {
    return -1;
  }
  va_copy(v18, va);
  int result = -1;
  switch(a2)
  {
    case 0:
    case 12:
      int v7 = (__int32 *)v21;
      unint64_t v8 = a1;
      int v9 = 0;
      return sub_213B180AC((uint64_t)v8, v7, v9, a2, 1);
    case 1:
      return sub_213B1E7B0((uint64_t)a1, v21);
    case 2:
      return sub_213B1717C((uint64_t)a1, (__int32 *)v21);
    case 3:
      int v10 = *((_DWORD *)a1 + 11);
      int result = 0;
      if (v21) {
        unsigned int v11 = v10 | 1;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      goto LABEL_39;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      uint64_t v5 = 1;
      memset(v19, 0, sizeof(v19));
      do
      {
        uint64_t v6 = va_arg(v18, void);
        *((void *)v19 + v5) = v6;
        if (!v6) {
          break;
        }
        ++v5;
      }
      while (v5 != 20);
      switch(a2)
      {
        case 4:
          *(void *)&v19[0] = &unk_213B26930;
          int result = sub_213B17224();
          break;
        case 5:
          *(void *)&v19[0] = &unk_213B26944;
          int result = sub_213B20394((uint64_t)a1);
          break;
        case 6:
          *(void *)&v19[0] = &unk_213B26960;
          int result = sub_213B20560((uint64_t)a1, v5, (uint64_t)v19);
          break;
        case 7:
          *(void *)&v19[0] = &unk_213B26978;
          int result = sub_213B207FC((uint64_t)a1, v5, (uint64_t)v19);
          break;
        case 8:
          *(void *)&v19[0] = &unk_213B26994;
          int result = sub_213B22018((uint64_t)a1, v5, (uint64_t)v19);
          break;
        default:
          abort();
      }
      return result;
    case 9:
      return sub_213B17818((uint64_t)a1, (uint64_t)v21, (uint64_t)v22, v23);
    case 10:
      int result = sub_213B14A98((uint64_t)a1, (uint64_t)v21, (uint64_t)v22);
      unsigned int v11 = *((_DWORD *)a1 + 11) & 0xFFFFFFBF;
      goto LABEL_39;
    case 11:
      int v12 = *((_DWORD *)a1 + 11);
      int result = 0;
      if (v21) {
        unsigned int v11 = v12 & 0xFFFFFFFB;
      }
      else {
        unsigned int v11 = v12 | 4;
      }
      goto LABEL_39;
    case 13:
      int result = sub_213B18348((uint64_t)a1, (uint64_t (*)(uint64_t, __int32 *))v21);
      unsigned int v11 = *((_DWORD *)a1 + 11) & 0xFFFFFF7F;
LABEL_39:
      *((_DWORD *)a1 + 11) = v11;
      return result;
    case 14:
      int result = 0;
      *((void *)a1 + 10) = v21;
      return result;
    case 15:
      int v13 = *((_DWORD *)a1 + 11);
      if (v21)
      {
        if ((v13 & 8) == 0)
        {
          *((_DWORD *)a1 + 11) = v13 | 8;
          sub_213B18540((uint64_t)a1);
        }
      }
      else if ((v13 & 8) != 0)
      {
        *((_DWORD *)a1 + 11) = v13 & 0xFFFFFFF7;
        sub_213B185D8((uint64_t)a1);
      }
      return 0;
    case 16:
      if (v21) {
        sub_213B21970((uint64_t)a1);
      }
      else {
        sub_213B21E68((uint64_t)a1);
      }
      return 0;
    case 19:
      __int32 v14 = v22;
      if (v21 == 2)
      {
        *((void *)a1 + 3) = v22;
        int v16 = fileno(v14);
        int result = 0;
        *((_DWORD *)a1 + 10) = v16;
      }
      else if (v21 == 1)
      {
        *((void *)a1 + 2) = v22;
        int v17 = fileno(v14);
        int result = 0;
        *((_DWORD *)a1 + 9) = v17;
      }
      else
      {
        if (v21) {
          return -1;
        }
        *((void *)a1 + 1) = v22;
        int v15 = fileno(v14);
        int result = 0;
        *((_DWORD *)a1 + 8) = v15;
      }
      break;
    case 20:
      sub_213B1D104((uint64_t)a1);
      sub_213B1C450((uint64_t)a1);
      sub_213B20308((uint64_t)a1);
      return 0;
    case 21:
    case 22:
      int v7 = (__int32 *)v21;
      int v9 = (int)v22;
      unint64_t v8 = a1;
      return sub_213B180AC((uint64_t)v8, v7, v9, a2, 1);
    case 23:
      return sub_213B11708((uint64_t)a1, (uint64_t)v21, (uint64_t)v22);
    default:
      return result;
  }
  return result;
}

int el_wget(EditLine *a1, int a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  v26 = va_arg(va1, uint64_t *);
  v27 = va_arg(va1, void *);
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!a1) {
    return -1;
  }
  va_copy(v13, va);
  int v3 = -1;
  switch(a2)
  {
    case 0:
    case 12:
      uint64_t v4 = v26;
      uint64_t v5 = 0;
      return sub_213B18104((uint64_t)a1, v4, v5, a2);
    case 1:
      sub_213B1F6DC((uint64_t)a1, v26);
      return 0;
    case 2:
      return sub_213B171E8((uint64_t)a1, v26);
    case 3:
      int v3 = 0;
      int v7 = *((_DWORD *)a1 + 11) & 1;
      goto LABEL_14;
    case 11:
      int v3 = 0;
      int v7 = ((*((_DWORD *)a1 + 11) >> 2) & 1) == 0;
      goto LABEL_14;
    case 13:
      uint64_t v8 = sub_213B18368((uint64_t)a1);
      int v3 = 0;
      uint64_t *v26 = v8;
      return v3;
    case 14:
      int v3 = 0;
      uint64_t *v26 = *((void *)a1 + 10);
      return v3;
    case 15:
      int v3 = 0;
      int v7 = (*((_DWORD *)a1 + 11) >> 3) & 1;
LABEL_14:
      *(_DWORD *)v26 = v7;
      return v3;
    case 17:
      uint64_t v24 = 0;
      long long v23 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v9 = 1;
      long long v15 = 0u;
      do
      {
        int v10 = va_arg(v13, char *);
        (&v14)[v9] = v10;
        if (!v10) {
          break;
        }
        ++v9;
      }
      while (v9 != 20);
      __int32 v14 = aGettc;
      return sub_213B206E0((uint64_t)a1, v9, (uint64_t)&v14);
    case 18:
      int v3 = (int)v26;
      if (v26 == 2)
      {
        int v3 = 0;
        uint64_t v11 = *((void *)a1 + 3);
      }
      else if (v26 == 1)
      {
        int v3 = 0;
        uint64_t v11 = *((void *)a1 + 2);
      }
      else
      {
        if (v26) {
          return -1;
        }
        uint64_t v11 = *((void *)a1 + 1);
      }
      void *v27 = v11;
      break;
    case 21:
    case 22:
      uint64_t v4 = v26;
      uint64_t v5 = v27;
      return sub_213B18104((uint64_t)a1, v4, v5, a2);
    default:
      return v3;
  }
  return v3;
}

const LineInfoW *__cdecl el_wline(EditLine *a1)
{
  return (const LineInfoW *)((char *)a1 + 88);
}

int el_source(EditLine *a1, const char *a2)
{
  if (a2)
  {
    int v3 = a2;
    uint64_t v4 = 0;
  }
  else
  {
    if (issetugid()) {
      return -1;
    }
    __int32 v14 = getenv("HOME");
    if (!v14) {
      return -1;
    }
    long long v15 = v14;
    size_t v16 = strlen(v14) + 9;
    long long v17 = (char *)malloc_type_malloc(v16, 0x100004077774924uLL);
    if (!v17) {
      return -1;
    }
    int v3 = v17;
    snprintf(v17, v16, "%s%s", v15, "/.editrc");
    uint64_t v4 = (char *)v3;
  }
  uint64_t v5 = fopen(v3, "r");
  if (!v5)
  {
    free(v4);
    return -1;
  }
  uint64_t v6 = v5;
  int v7 = 0;
  size_t v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8318];
  while (1)
  {
    uint64_t v9 = (__int32 *)fgetln(v6, &v19);
    if (!v9) {
      break;
    }
    if (*(unsigned char *)v9 != 10)
    {
      int v10 = sub_213B238D0(v9, (uint64_t)a1 + 1264);
      if (v10)
      {
        uint64_t v11 = v10;
        if (v19 && v10[v19 - 1] == 10) {
          --v19;
        }
        unsigned int v12 = *v10;
        if (v12)
        {
          while (v12 <= 0x7F)
          {
            if ((*(_DWORD *)(v8 + 4 * v12 + 60) & 0x4000) == 0) {
              goto LABEL_19;
            }
LABEL_16:
            unsigned int v13 = v11[1];
            ++v11;
            unsigned int v12 = v13;
            if (!v13) {
              goto LABEL_17;
            }
          }
          if (__maskrune(v12, 0x4000uLL)) {
            goto LABEL_16;
          }
LABEL_19:
          if (*v11 != 35) {
            goto LABEL_17;
          }
        }
        else
        {
LABEL_17:
          int v7 = sub_213B17A54(a1, v11);
          if (v7 == -1) {
            break;
          }
        }
      }
    }
  }
  free(v4);
  fclose(v6);
  return v7;
}

void el_resize(EditLine *a1)
{
  uint64_t v4 = 0;
  sigset_t v2 = 0x8000000;
  sigset_t v3 = 0;
  sigprocmask(1, &v2, &v3);
  if (sub_213B1FB04((uint64_t)a1, (_DWORD *)&v4 + 1, &v4)) {
    sub_213B1FBE8((uint64_t)a1, SHIDWORD(v4), v4);
  }
  sigprocmask(3, &v3, 0);
}

uint64_t sub_213B13220(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 == 2)
  {
    if (a3)
    {
      uint64_t v5 = *(const __int32 **)(a3 + 8);
      if (v5)
      {
        if (!wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"o"))
        {
          *(_DWORD *)(a1 + 44) &= ~4u;
          sub_213B21970(a1);
          return 0;
        }
        else if (!wcscmp(v5, (const __int32 *)"o"))
        {
          sub_213B21E68(a1);
          uint64_t result = 0;
          *(_DWORD *)(a1 + 44) |= 4u;
        }
        else
        {
          return 0xFFFFFFFFLL;
        }
      }
    }
  }
  return result;
}

uint64_t sub_213B132D8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 96);
  if (v3 == *(void *)(a1 + 104))
  {
    if (v3 == *(void *)(a1 + 88))
    {
      sub_213B20310(a1, a2);
      return 2;
    }
    else
    {
      el_beep_0((EditLine *)a1);
      return 6;
    }
  }
  else
  {
    if (*(_DWORD *)(a1 + 124)) {
      sub_213B10AEC((void *)a1, *(_DWORD *)(a1 + 128));
    }
    else {
      sub_213B10B80(a1);
    }
    unint64_t v5 = *(void *)(a1 + 104);
    if (*(void *)(a1 + 96) > v5) {
      *(void *)(a1 + 96) = v5;
    }
    return 4;
  }
}

uint64_t sub_213B13360(uint64_t a1)
{
  sigset_t v2 = *(unsigned int **)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  if (v2 == (unsigned int *)v3) {
    return 6;
  }
  uint64_t v4 = sub_213B10E58(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_213B10C98);
  unint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(_DWORD **)(a1 + 936);
  if (v5 < (unint64_t)v4)
  {
    int v7 = *(unsigned int **)(a1 + 96);
    do
    {
      int v8 = *v7++;
      *v6++ = v8;
    }
    while (v7 < v4);
  }
  *(void *)(a1 + 944) = v6;
  sub_213B10AEC((void *)a1, ((unint64_t)v4 - v5) >> 2);
  unint64_t v9 = *(void *)(a1 + 104);
  if (*(void *)(a1 + 96) > v9) {
    *(void *)(a1 + 96) = v9;
  }
  return 4;
}

uint64_t sub_213B133FC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 944) - *(void *)(a1 + 936);
  if (!v1) {
    return 0;
  }
  if (*(void *)(a1 + 104) + v1 >= *(void *)(a1 + 112)) {
    return 6;
  }
  unint64_t v3 = *(_DWORD **)(a1 + 96);
  *(void *)(a1 + 952) = v3;
  sub_213B10894(a1, v1 >> 2);
  uint64_t v4 = *(int **)(a1 + 936);
  unint64_t v5 = *(void *)(a1 + 944);
  while ((unint64_t)v4 < v5)
  {
    int v6 = *v4++;
    *v3++ = v6;
  }
  if (*(_DWORD *)(a1 + 128) == 1) {
    *(void *)(a1 + 96) = v3;
  }
  return 4;
}

uint64_t sub_213B13490(void *a1)
{
  unint64_t v1 = a1[11];
  sigset_t v2 = (_DWORD *)a1[117];
  unint64_t v3 = a1[13];
  if (v1 < v3)
  {
    uint64_t v4 = (int *)a1[11];
    do
    {
      int v5 = *v4++;
      *v2++ = v5;
    }
    while ((unint64_t)v4 < v3);
  }
  a1[118] = v2;
  a1[12] = v1;
  a1[13] = v1;
  return 4;
}

uint64_t sub_213B134C8(void *a1)
{
  unint64_t v1 = a1[119];
  if (!v1) {
    return 6;
  }
  unint64_t v3 = a1[12];
  uint64_t v4 = (_DWORD *)a1[117];
  if (v1 <= v3)
  {
    int v7 = (int *)a1[119];
    if (v1 < v3)
    {
      do
      {
        int v8 = *v7++;
        *v4++ = v8;
      }
      while ((unint64_t)v7 < v3);
    }
    a1[118] = v4;
    sub_213B10BB0(a1, ((unint64_t)v7 - v1) >> 2);
    a1[12] = a1[119];
  }
  else
  {
    uint64_t v5 = 0;
    do
    {
      v4[v5] = *(_DWORD *)(v3 + v5 * 4);
      ++v5;
    }
    while (v3 + v5 * 4 < v1);
    a1[118] = &v4[v5];
    sub_213B10AEC(a1, (unint64_t)(v5 * 4) >> 2);
  }
  return 4;
}

uint64_t sub_213B13574(void *a1)
{
  unint64_t v1 = (int *)a1[119];
  if (!v1) {
    return 6;
  }
  sigset_t v2 = (int *)a1[12];
  unint64_t v3 = (_DWORD *)a1[117];
  if (v1 <= v2)
  {
    for (; v1 < v2; ++v3)
    {
      int v6 = *v1++;
      *unint64_t v3 = v6;
    }
  }
  else
  {
    do
    {
      int v4 = *v2++;
      *v3++ = v4;
    }
    while (v2 < v1);
  }
  uint64_t v5 = 0;
  a1[118] = v3;
  return v5;
}

uint64_t sub_213B135CC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 96);
  if (v1 <= *(void *)(a1 + 88) + 4) {
    return 6;
  }
  *(int32x2_t *)(v1 - 8) = vrev64_s32(*(int32x2_t *)(v1 - 8));
  return 4;
}

uint64_t sub_213B135F8(uint64_t a1)
{
  sigset_t v2 = *(unsigned int **)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  if (v2 == (unsigned int *)v3) {
    return 6;
  }
  *(void *)(a1 + 96) = sub_213B10E58(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_213B10C98);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5;
  }
  sub_213B1107C(a1);
  return 4;
}

uint64_t sub_213B13674(uint64_t a1)
{
  sigset_t v2 = sub_213B10E58(*(unsigned int **)(a1 + 96), *(void *)(a1 + 104), *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_213B10C98);
  unint64_t v3 = *(__darwin_ct_rune_t **)(a1 + 96);
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    uint64_t v4 = MEMORY[0x263EF8318];
    while (1)
    {
      uint64_t v5 = *v3;
      if (v5 <= 0x7F) {
        break;
      }
      if (__maskrune(v5, 0x1000uLL)) {
        goto LABEL_7;
      }
LABEL_8:
      if (++v3 >= (__darwin_ct_rune_t *)v2) {
        goto LABEL_9;
      }
    }
    if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x1000) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    *unint64_t v3 = __toupper(*v3);
    goto LABEL_8;
  }
LABEL_9:
  int v6 = *(unsigned int **)(a1 + 104);
  if (v2 <= v6) {
    int v6 = v2;
  }
  *(void *)(a1 + 96) = v6;
  return 4;
}

uint64_t sub_213B1372C(uint64_t a1)
{
  sigset_t v2 = sub_213B10E58(*(unsigned int **)(a1 + 96), *(void *)(a1 + 104), *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_213B10C98);
  unint64_t v3 = *(__darwin_ct_rune_t **)(a1 + 96);
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    uint64_t v4 = MEMORY[0x263EF8318];
    do
    {
      uint64_t v5 = *v3;
      if (v5 > 0x7F)
      {
        if (__maskrune(v5, 0x100uLL))
        {
LABEL_9:
          uint64_t v6 = *v3;
          if (v6 > 0x7F)
          {
            if (!__maskrune(v6, 0x1000uLL)) {
              goto LABEL_14;
            }
          }
          else if ((*(_DWORD *)(v4 + 4 * v6 + 60) & 0x1000) == 0)
          {
LABEL_14:
            ++v3;
            break;
          }
          *unint64_t v3 = __toupper(*v3);
          goto LABEL_14;
        }
      }
      else if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x100) != 0)
      {
        goto LABEL_9;
      }
      ++v3;
    }
    while (v3 < (__darwin_ct_rune_t *)v2);
  }
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    uint64_t v7 = MEMORY[0x263EF8318];
    while (1)
    {
      uint64_t v8 = *v3;
      if (v8 <= 0x7F) {
        break;
      }
      if (__maskrune(v8, 0x8000uLL)) {
        goto LABEL_21;
      }
LABEL_22:
      if (++v3 >= (__darwin_ct_rune_t *)v2) {
        goto LABEL_23;
      }
    }
    if ((*(_DWORD *)(v7 + 4 * v8 + 60) & 0x8000) == 0) {
      goto LABEL_22;
    }
LABEL_21:
    *unint64_t v3 = __tolower(*v3);
    goto LABEL_22;
  }
LABEL_23:
  unint64_t v9 = *(unsigned int **)(a1 + 104);
  if (v2 <= v9) {
    unint64_t v9 = v2;
  }
  *(void *)(a1 + 96) = v9;
  return 4;
}

uint64_t sub_213B1386C(uint64_t a1)
{
  sigset_t v2 = sub_213B10E58(*(unsigned int **)(a1 + 96), *(void *)(a1 + 104), *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_213B10C98);
  unint64_t v3 = *(__darwin_ct_rune_t **)(a1 + 96);
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    uint64_t v4 = MEMORY[0x263EF8318];
    while (1)
    {
      uint64_t v5 = *v3;
      if (v5 <= 0x7F) {
        break;
      }
      if (__maskrune(v5, 0x8000uLL)) {
        goto LABEL_7;
      }
LABEL_8:
      if (++v3 >= (__darwin_ct_rune_t *)v2) {
        goto LABEL_9;
      }
    }
    if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x8000) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    *unint64_t v3 = __tolower(*v3);
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v6 = *(unsigned int **)(a1 + 104);
  if (v2 <= v6) {
    uint64_t v6 = v2;
  }
  *(void *)(a1 + 96) = v6;
  return 4;
}

uint64_t sub_213B13924(uint64_t a1)
{
  *(void *)(a1 + 952) = *(void *)(a1 + 96);
  return 0;
}

uint64_t sub_213B13934(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 96);
  *(void *)(a1 + 96) = *(void *)(a1 + 952);
  *(void *)(a1 + 952) = v1;
  return 5;
}

uint64_t sub_213B1394C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 128);
  if (v1 > 1000000) {
    return 6;
  }
  *(_DWORD *)(a1 + 124) = 1;
  *(_DWORD *)(a1 + 128) = 4 * v1;
  return 3;
}

uint64_t sub_213B1397C(uint64_t a1)
{
  *(_DWORD *)(a1 + 132) = 1;
  return 3;
}

uint64_t sub_213B1398C(uint64_t a1)
{
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a1 + 120) == 0;
  return 0;
}

uint64_t sub_213B139A4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 88);
  sigset_t v2 = *(unsigned int **)(a1 + 96);
  if (v2 == (unsigned int *)v1) {
    return 6;
  }
  uint64_t v4 = sub_213B10DD8(*(void *)(a1 + 96), v1, *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_213B10C98);
  sub_213B10894(a1, (unint64_t)((char *)v2 - (char *)v4) >> 2);
  if (v2 <= v4)
  {
    uint64_t v6 = v2;
  }
  else
  {
    unint64_t v5 = *(void *)(a1 + 104);
    uint64_t v6 = v2;
    do
    {
      if ((unint64_t)v6 >= v5) {
        break;
      }
      unsigned int v7 = *v4++;
      *v6++ = v7;
    }
    while (v4 < v2);
  }
  *(void *)(a1 + 96) = v6;
  return 4;
}

uint64_t sub_213B13A48(size_t a1)
{
  *(void *)(a1 + 1224) = 0;
  return sub_213B1D8A8(a1, 22);
}

uint64_t sub_213B13A54(size_t a1)
{
  *(void *)(a1 + 1224) = 0;
  return sub_213B1D8A8(a1, 23);
}

uint64_t sub_213B13A60(uint64_t a1)
{
  if (*(void *)(a1 + 96) <= *(void *)(a1 + 88)) {
    return 6;
  }
  if (*(_DWORD *)(a1 + 124)) {
    sub_213B10BB0((void *)a1, *(_DWORD *)(a1 + 128));
  }
  else {
    sub_213B10C64(a1);
  }
  unint64_t v3 = *(void *)(a1 + 96) - 4 * *(int *)(a1 + 128);
  if (v3 < *(void *)(a1 + 88)) {
    unint64_t v3 = *(void *)(a1 + 88);
  }
  *(void *)(a1 + 96) = v3;
  return 4;
}

char *__cdecl tilde_expand_0(char *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*a1 == 126)
  {
    memset(&v16, 0, sizeof(v16));
    long long v15 = 0;
    sigset_t v2 = strchr(a1 + 1, 47);
    if (v2)
    {
      int64_t v3 = v2 - a1;
      size_t v4 = v2 - a1 + 1;
      unint64_t v5 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL);
      if (v5)
      {
        uint64_t v6 = v5;
        strncpy(v5, a1 + 1, v3 - 1)[v3 - 1] = 0;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v8 = strdup(a1 + 1);
      if (v8)
      {
        uint64_t v6 = v8;
        size_t v4 = 0;
LABEL_10:
        if (*v6)
        {
          if (!getpwnam_r(v6, &v16, v17, 0x400uLL, &v15)) {
            goto LABEL_13;
          }
        }
        else
        {
          uid_t v14 = getuid();
          if (!getpwuid_r(v14, &v16, v17, 0x400uLL, &v15))
          {
LABEL_13:
            free(v6);
            if (!v15) {
              return strdup(a1);
            }
            unint64_t v9 = &a1[v4];
            size_t v10 = strlen(v15->pw_dir);
            size_t v11 = v10 + strlen(v9) + 2;
            unsigned int v12 = (char *)malloc_type_malloc(v11, 0x100004077774924uLL);
            unsigned int v13 = v12;
            if (v12) {
              snprintf(v12, v11, "%s/%s", v15->pw_dir, v9);
            }
            return v13;
          }
        }
        long long v15 = 0;
        goto LABEL_13;
      }
    }
    return 0;
  }

  return strdup(a1);
}

char *__cdecl filename_completion_function_0(const char *a1, int a2)
{
  int64_t v3 = (DIR *)qword_2677F4320;
  if (a2 && qword_2677F4320) {
    goto LABEL_3;
  }
  unint64_t v9 = strrchr((char *)a1, 47);
  if (!v9)
  {
    free((void *)qword_2677F4328);
    if (*a1)
    {
      qword_2677F4328 = (uint64_t)strdup(a1);
      if (!qword_2677F4328) {
        return 0;
      }
    }
    else
    {
      qword_2677F4328 = 0;
    }
    free((void *)qword_2677F4330);
    long long v15 = 0;
    qword_2677F4330 = 0;
    if (!v3) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  size_t v10 = v9 + 1;
  size_t v11 = strlen(v9 + 1);
  unsigned int v12 = (char *)malloc_type_realloc((void *)qword_2677F4328, v11 + 1, 0x100004077774924uLL);
  if (!v12)
  {
    free((void *)qword_2677F4328);
    uint64_t v8 = 0;
    qword_2677F4328 = 0;
    return v8;
  }
  qword_2677F4328 = (uint64_t)v12;
  strcpy(v12, v10);
  size_t v13 = v10 - a1;
  uid_t v14 = (char *)malloc_type_realloc((void *)qword_2677F4330, v13 + 1, 0x100004077774924uLL);
  if (!v14)
  {
    free((void *)qword_2677F4330);
    uint64_t v8 = 0;
    qword_2677F4330 = 0;
    return v8;
  }
  long long v15 = v14;
  qword_2677F4330 = (uint64_t)v14;
  strncpy(v14, a1, v13)[v13] = 0;
  int64_t v3 = (DIR *)qword_2677F4320;
  if (qword_2677F4320)
  {
LABEL_29:
    closedir(v3);
    qword_2677F4320 = 0;
    long long v15 = (char *)qword_2677F4330;
  }
LABEL_30:
  free((void *)qword_2677F4338);
  qword_2677F4338 = 0;
  if (!v15)
  {
    qword_2677F4330 = (uint64_t)strdup("");
    if (qword_2677F4330)
    {
      uint64_t v18 = "./";
      goto LABEL_35;
    }
    return 0;
  }
  uint64_t v18 = v15;
  if (*v15 != 126)
  {
LABEL_35:
    size_t v19 = strdup(v18);
    goto LABEL_36;
  }
  size_t v19 = tilde_expand_0(v15);
LABEL_36:
  qword_2677F4338 = (uint64_t)v19;
  if (!v19) {
    return 0;
  }
  long long v20 = opendir(v19);
  qword_2677F4320 = (uint64_t)v20;
  if (!v20) {
    return 0;
  }
  int64_t v3 = v20;
  size_t v21 = qword_2677F4328;
  if (qword_2677F4328) {
    size_t v21 = strlen((const char *)qword_2677F4328);
  }
  qword_2677F4340 = v21;
LABEL_3:
  size_t v4 = readdir(v3);
  if (!v4)
  {
LABEL_13:
    closedir((DIR *)qword_2677F4320);
    uint64_t v8 = 0;
    qword_2677F4320 = 0;
    return v8;
  }
  while (1)
  {
    d_name = v4->d_name;
    int v5 = v4->d_name[0];
    if (v5 == 46 && (!v4->d_name[1] || v4->d_name[1] == 46 && !v4->d_name[2])) {
      goto LABEL_12;
    }
    if (!qword_2677F4340) {
      break;
    }
    if (v5 == *(unsigned __int8 *)qword_2677F4328)
    {
      unint64_t d_namlen = v4->d_namlen;
      if (qword_2677F4340 <= d_namlen && !strncmp(v4->d_name, (const char *)qword_2677F4328, qword_2677F4340)) {
        goto LABEL_23;
      }
    }
LABEL_12:
    size_t v4 = readdir((DIR *)qword_2677F4320);
    if (!v4) {
      goto LABEL_13;
    }
  }
  unint64_t d_namlen = v4->d_namlen;
LABEL_23:
  size_t v16 = d_namlen + strlen((const char *)qword_2677F4330) + 1;
  long long v17 = (char *)malloc_type_malloc(v16, 0x100004077774924uLL);
  uint64_t v8 = v17;
  if (v17) {
    snprintf(v17, v16, "%s%s", (const char *)qword_2677F4330, d_name);
  }
  return v8;
}

char **__cdecl completion_matches(const char *a1, CPFunction *a2)
{
  uint64_t v4 = ((uint64_t (*)(const char *, void))a2)(a1, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    unsigned int v7 = 0;
    unint64_t v8 = 1;
    do
    {
      unint64_t v9 = v6;
      if (v6 + 3 >= v8)
      {
        do
        {
          unint64_t v11 = v8;
          v8 *= 2;
        }
        while (v6 + 3 >= v11);
        size_t v10 = malloc_type_realloc(v7, 8 * v11, 0x10040436913F5uLL);
        if (!v10)
        {
          free(v7);
          return (char **)v10;
        }
      }
      else
      {
        size_t v10 = v7;
        unint64_t v11 = v8;
      }
      ++v6;
      *((void *)v10 + v9 + 1) = v5;
      uint64_t v5 = ((uint64_t (*)(const char *, unint64_t))a2)(a1, v9 + 1);
      unint64_t v8 = v11;
      unsigned int v7 = v10;
    }
    while (v5);
    size_t v12 = strlen(*((const char **)v10 + 1));
    if (v6 >= 2)
    {
      for (unint64_t i = 2; i <= v6; ++i)
      {
        size_t v13 = 0;
        if (v12)
        {
          while (*(unsigned __int8 *)(*((void *)v10 + 1) + v13) == *(unsigned __int8 *)(*((void *)v10 + i) + v13))
          {
            if (v12 == ++v13)
            {
              size_t v13 = v12;
              break;
            }
          }
        }
        size_t v12 = v13;
      }
    }
    else
    {
      size_t v13 = v12;
    }
    uid_t v14 = (char *)malloc_type_malloc(v13 + 1, 0x100004077774924uLL);
    if (v14)
    {
      long long v15 = strncpy(v14, *((const char **)v10 + 1), v13);
      v15[v13] = 0;
      *(void *)size_t v10 = v15;
      *((void *)v10 + v9 + 2) = 0;
      return (char **)v10;
    }
    free(v10);
  }
  return 0;
}

void sub_213B1412C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = a4;
  unint64_t v6 = *(int *)(a1 + 152);
  uint64_t v7 = a2 + 8;
  unint64_t v8 = a3 - 1;
  if (a4 + 1 > v6) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = v6 / (a4 + 1);
  }
  unint64_t v10 = a3 - 2 + v9;
  BOOL v11 = __CFADD__(a3 - 2, v9);
  qsort((void *)(a2 + 8), a3 - 1, 8uLL, (int (__cdecl *)(const void *, const void *))sub_213B14250);
  if (!v11)
  {
    uint64_t v12 = 0;
    unint64_t v13 = v10 / v9;
    if (v13 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    uint64_t v20 = v14;
    do
    {
      uint64_t v15 = 0;
      do
      {
        unint64_t v16 = v12 + v15 * v13;
        if (v16 >= v8) {
          break;
        }
        uint64_t v17 = v15 + 1;
        BOOL v18 = v15 == 0;
        size_t v19 = " ";
        if (v18) {
          size_t v19 = "";
        }
        fprintf(*(FILE **)(a1 + 16), "%s%-*s", v19, v4, *(const char **)(v7 + 8 * v16));
        uint64_t v15 = v17;
      }
      while (v9 != v17);
      fputc(10, *(FILE **)(a1 + 16));
      ++v12;
    }
    while (v12 != v20);
  }
}

uint64_t sub_213B14250(const char **a1, const char **a2)
{
  return strcasecmp(*a1, *a2);
}

uint64_t sub_213B1425C(EditLine *a1, char *(__cdecl *a2)(const char *, int), uint64_t (*a3)(char *, void), __int32 *a4, __int32 *a5, const char *(*a6)(char *a1), unint64_t a7, int *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, uint64_t (*a12)(const __int32 *, const __int32 *), uint64_t (*a13)(char *), uint64_t (*a14)(void))
{
  int v18 = *((unsigned __int8 *)a1 + 136);
  int v19 = *((unsigned __int8 *)a1 + 137);
  if (a8)
  {
    if (v18 == v19) {
      int v20 = 63;
    }
    else {
      int v20 = 9;
    }
    *a8 = v20;
  }
  int v60 = v19;
  int v61 = v18;
  if (a2) {
    size_t v21 = a2;
  }
  else {
    size_t v21 = filename_completion_function_0;
  }
  if (a6) {
    long long v22 = a6;
  }
  else {
    long long v22 = sub_213B14660;
  }
  v58 = v22;
  long long v23 = el_wline(a1);
  uint64_t v24 = v23;
  if (a12)
  {
    unint64_t cursor = a12(v23->buffer, v23->cursor);
  }
  else
  {
    unint64_t cursor = (unint64_t)v23->cursor;
    if ((const __int32 *)cursor > v23->buffer)
    {
      v26 = v23->cursor;
      do
      {
        __int32 v27 = *--v26;
        if (wcschr(a4, v27) || a5 && wcschr(a5, *(_DWORD *)(cursor - 4))) {
          break;
        }
        unint64_t cursor = (unint64_t)v26;
      }
      while (v26 > v24->buffer);
    }
  }
  v28 = el_line(a1);
  buffer = (unsigned int *)v24->buffer;
  if (v24->buffer >= (const __int32 *)cursor)
  {
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v30 = 0;
    do
    {
      unsigned int v31 = *buffer++;
      v30 += sub_213B23A94(v31);
    }
    while ((unint64_t)buffer < cursor);
  }
  size_t v32 = &v28->cursor[-v30] - v28->buffer;
  rl_line_buffer = (char *)v28->buffer;
  v33 = (char *)malloc_type_malloc(v32 + 1, 0x100004077774924uLL);
  strncpy(v33, &v28->buffer[v30], v32)[v32] = 0;
  if (!a13)
  {
    v34 = 0;
LABEL_29:
    if (a10) {
      *a10 = LODWORD(v28->cursor) - LODWORD(v28->buffer);
    }
    if (a11) {
      *a11 = LODWORD(v28->lastchar) - LODWORD(v28->buffer);
    }
    if (a3)
    {
      if (v34) {
        v36 = v34;
      }
      else {
        v36 = v33;
      }
      uint64_t v37 = a3(v36, (LODWORD(v28->cursor) - LODWORD(v28->buffer) - v32));
      v38 = (char **)v37;
      if (!a9) {
        goto LABEL_45;
      }
      if (*a9 || v37)
      {
LABEL_44:
        *a9 = 0;
        goto LABEL_45;
      }
    }
    if (v34) {
      v39 = v34;
    }
    else {
      v39 = v33;
    }
    v38 = completion_matches(v39, v21);
    if (a9) {
      goto LABEL_44;
    }
LABEL_45:
    if (!v38)
    {
      uint64_t v35 = 0;
LABEL_78:
      free(v34);
      free(v33);
      return v35;
    }
    if (**v38)
    {
      if (a14)
      {
        v40 = (char *)a14();
        if (!v40) {
          goto LABEL_73;
        }
      }
      else
      {
        v40 = 0;
      }
      el_deletestr(a1, ((unint64_t)v24->cursor - cursor) >> 2);
      v41 = v40;
      if (!v40) {
        v41 = *v38;
      }
      v42 = sub_213B238D0((__int32 *)v41, (uint64_t)a1 + 1264);
      el_winsertstr(a1, v42);
      free(v40);
    }
    if (v61 != v60)
    {
      if (v38[2])
      {
        v49 = *v38;
      }
      else
      {
        v49 = *v38;
        v51 = v38[1];
        if (!v51 || !strcmp(*v38, v51))
        {
          v52 = (__int32 *)v58(v49);
          v53 = sub_213B238D0(v52, (uint64_t)a1 + 1264);
          el_winsertstr(a1, v53);
LABEL_73:
          uint64_t v35 = 4;
          goto LABEL_74;
        }
      }
      BOOL v50 = *v49 != 0;
      el_beep(a1);
      uint64_t v35 = (4 * v50);
LABEL_74:
      v54 = *v38;
      if (*v38)
      {
        v55 = v38 + 1;
        do
        {
          free(v54);
          v56 = *v55++;
          v54 = v56;
        }
        while (v56);
      }
      free(v38);
      goto LABEL_78;
    }
    v43 = v38[1];
    if (v43)
    {
      uint64_t v44 = 0;
      unint64_t v45 = 0;
      do
      {
        size_t v46 = strlen(v43);
        if (v46 > v45) {
          unint64_t v45 = v46;
        }
        v43 = v38[v44++ + 2];
      }
      while (v43);
      uint64_t v47 = v44;
      fputc(10, *((FILE **)a1 + 2));
      if (v44 > a7)
      {
        fprintf(*((FILE **)a1 + 2), "Display all %zu possibilities? (y or n) ", v44);
        fflush(*((FILE **)a1 + 2));
        int v48 = getc((FILE *)*MEMORY[0x263EF8350]);
        fputc(10, *((FILE **)a1 + 2));
        if (v48 != 121) {
          goto LABEL_69;
        }
      }
    }
    else
    {
      fputc(10, *((FILE **)a1 + 2));
      unint64_t v45 = 0;
      uint64_t v47 = 0;
    }
    sub_213B1412C((uint64_t)a1, (uint64_t)v38, v47 + 1, v45);
LABEL_69:
    uint64_t v35 = 8;
    goto LABEL_74;
  }
  v34 = (char *)a13(v33);
  if (v34) {
    goto LABEL_29;
  }
  return 0;
}

const char *sub_213B14660(char *a1)
{
  if (*a1 == 126) {
    sigset_t v2 = tilde_expand_0(a1);
  }
  else {
    sigset_t v2 = 0;
  }
  memset(&v8.st_uid, 0, 128);
  if (v2) {
    int64_t v3 = v2;
  }
  else {
    int64_t v3 = a1;
  }
  *(_OWORD *)&v8.st_dev = 0uLL;
  int v4 = stat(v3, &v8);
  mode_t st_mode = v8.st_mode;
  if (v2) {
    free(v2);
  }
  unint64_t v6 = "/";
  if ((st_mode & 0xF000) != 0x4000) {
    unint64_t v6 = " ";
  }
  if (v4 == -1) {
    return " ";
  }
  else {
    return v6;
  }
}

unsigned __int8 _el_fn_complete(EditLine *a1, int a2)
{
  return sub_213B1425C(a1, 0, 0, (__int32 *)" ", 0, 0, 0x64uLL, 0, 0, 0, 0, 0, 0, 0);
}

unsigned __int8 _el_fn_sh_complete(EditLine *a1, int a2)
{
  return sub_213B1425C(a1, 0, 0, (__int32 *)" ", 0, 0, 0x64uLL, 0, 0, 0, 0, (uint64_t (*)(const __int32 *, const __int32 *))sub_213B147D8, (uint64_t (*)(char *))sub_213B14850, (uint64_t (*)(void))sub_213B148F8);
}

__int32 *sub_213B147D8(__int32 *a1, unint64_t a2)
{
  sigset_t v2 = a1;
  if ((unint64_t)a1 < a2)
  {
    int v4 = a1;
    do
    {
      if (*v4 == 92)
      {
        ++v4;
      }
      else if (wcschr((__int32 *)" ", *v4))
      {
        sigset_t v2 = v4 + 1;
      }
      ++v4;
    }
    while ((unint64_t)v4 < a2);
  }
  return v2;
}

_WORD *sub_213B14850(const char *a1)
{
  unint64_t v1 = a1;
  size_t v2 = strlen(a1);
  uint64_t result = malloc_type_malloc(v2 + 2, 0x100004077774924uLL);
  if (result)
  {
    if (*v1 == 92)
    {
      int v4 = result;
      if (v1[1] == 126)
      {
        _WORD *result = 12078;
        int v4 = result + 1;
        ++v1;
      }
    }
    else
    {
      int v4 = result;
    }
    while (1)
    {
      int v5 = *(unsigned __int8 *)v1;
      if (v5 == 92)
      {
        int v6 = *(unsigned __int8 *)++v1;
        LOBYTE(v5) = v6;
        if (v6) {
          goto LABEL_8;
        }
      }
      else
      {
        if (!*v1)
        {
          unsigned char *v4 = 0;
          return result;
        }
LABEL_8:
        ++v1;
        *v4++ = v5;
      }
    }
  }
  return result;
}

unsigned char *sub_213B148F8(unsigned char *a1)
{
  unint64_t v1 = a1;
  char v2 = *a1;
  if (*a1)
  {
    int v3 = 0;
    int v4 = a1 + 1;
    do
    {
      if (wcschr((__int32 *)" ", v2) || wcschr((__int32 *)")", (char)*(v4 - 1))) {
        ++v3;
      }
      int v5 = *v4++;
      char v2 = v5;
    }
    while (v5);
  }
  else
  {
    int v3 = 0;
  }
  size_t v6 = strlen(v1);
  uint64_t v7 = malloc_type_malloc(v6 + v3 + 1, 0x100004077774924uLL);
  stat v8 = v7;
  if (v7)
  {
    char v9 = *v1;
    unint64_t v10 = v7;
    if (*v1)
    {
      unint64_t v10 = v7;
      do
      {
        if (wcschr((__int32 *)" ", v9) || wcschr((__int32 *)")", *v1)) {
          *v10++ = 92;
        }
        *v10++ = *v1;
        int v11 = *(unsigned __int8 *)++v1;
        char v9 = v11;
      }
      while (v11);
    }
    *unint64_t v10 = 0;
  }
  return v8;
}

uint64_t sub_213B14A08(void *a1)
{
  a1[149] = 0;
  a1[148] = 0;
  char v2 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  a1[144] = v2;
  a1[145] = 1024;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = v2;
  uint64_t result = 0;
  a1[146] = v3;
  return result;
}

void sub_213B14A6C(uint64_t a1)
{
  *(void *)(a1 + 1152) = 0;
}

uint64_t sub_213B14A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 1184) = a3;
  *(void *)(a1 + 1192) = a2;
  return 0;
}

uint64_t sub_213B14AA8(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 1176))
  {
    wcsncpy(*(__int32 **)(a1 + 88), *(const __int32 **)(a1 + 1152), *(void *)(a1 + 1160));
    int v4 = *(const __int32 **)(a1 + 88);
    int v5 = (char *)v4 + *(void *)(a1 + 1168) - *(void *)(a1 + 1152);
    *(void *)(a1 + 104) = v5;
    if (*(_DWORD *)(a1 + 1096) != 1)
    {
      *(void *)(a1 + 96) = v5;
      return 4;
    }
LABEL_26:
    *(void *)(a1 + 96) = v4;
    return 4;
  }
  uint64_t v2 = *(void *)(a1 + 1184);
  if (v2)
  {
    if ((*(unsigned char *)(a1 + 44) & 0x40) == 0)
    {
      if ((*(unsigned int (**)(uint64_t))(a1 + 1192))(v2) == -1) {
        return 6;
      }
      int v3 = *(__int32 **)(a1 + 1208);
      if (!v3) {
        return 6;
      }
LABEL_10:
      if (*(int *)(a1 + 1176) >= 2)
      {
        int v6 = 1;
        while (1)
        {
          if ((*(unsigned char *)(a1 + 44) & 0x40) != 0)
          {
            int v3 = sub_213B14C70(a1, 6);
          }
          else
          {
            if ((*(unsigned int (**)(void, uint64_t, uint64_t))(a1 + 1192))(*(void *)(a1 + 1184), a1 + 1200, 6) == -1)break; {
            int v3 = *(__int32 **)(a1 + 1208);
            }
          }
          if (!v3) {
            break;
          }
          if (++v6 >= *(_DWORD *)(a1 + 1176)) {
            goto LABEL_18;
          }
        }
        *(_DWORD *)(a1 + 1176) = v6;
        return 6;
      }
LABEL_18:
      wcsncpy(*(__int32 **)(a1 + 88), v3, (uint64_t)(*(void *)(a1 + 112) - *(void *)(a1 + 88)) >> 2);
      uint64_t v7 = *(const __int32 **)(a1 + 88);
      *(_DWORD *)(*(void *)(a1 + 112) - 4) = 0;
      int64_t v8 = wcslen(v7);
      int v4 = &v7[v8];
      *(void *)(a1 + 104) = v4;
      if (v8 >= 1 && *(v4 - 1) == 10) {
        *(void *)(a1 + 104) = --v4;
      }
      if (v4 > v7 && *(v4 - 1) == 32) {
        *(void *)(a1 + 104) = --v4;
      }
      if (*(_DWORD *)(a1 + 1096) == 1)
      {
        *(void *)(a1 + 96) = v7;
        return 4;
      }
      goto LABEL_26;
    }
    int v3 = sub_213B14C70(a1, 3);
    if (v3) {
      goto LABEL_10;
    }
  }
  return 6;
}

__int32 *sub_213B14C70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  int v5 = 0;
  if ((*(unsigned int (**)(void, uint64_t *, uint64_t))(a1 + 1192))(*(void *)(a1 + 1184), &v4, a2) == -1) {
    return 0;
  }
  else {
    return sub_213B238D0((__int32 *)v5, a1 + 1264);
  }
}

uint64_t sub_213B14CD4(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(void *)(a1 + 1184)) {
    return 0xFFFFFFFFLL;
  }
  if (a2 == 1 || !wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"l"))
  {
    if ((*(unsigned char *)(a1 + 44) & 0x40) != 0)
    {
      uint64_t result = (uint64_t)sub_213B14C70(a1, 4);
      while (result)
      {
LABEL_13:
        int64_t v8 = *(FILE **)(a1 + 16);
        int v9 = *(_DWORD *)(a1 + 1200);
        unint64_t v10 = sub_213B23790((unsigned __int32 *)result, a1 + 1264);
        fprintf(v8, "%d %s", v9, (const char *)v10);
        if ((*(unsigned char *)(a1 + 44) & 0x40) != 0)
        {
          uint64_t result = (uint64_t)sub_213B14C70(a1, 5);
        }
        else
        {
          if ((*(unsigned int (**)(void, uint64_t, uint64_t))(a1 + 1192))(*(void *)(a1 + 1184), a1 + 1200, 5) == -1)return 0; {
          uint64_t result = *(void *)(a1 + 1208);
          }
        }
      }
    }
    else if ((*(unsigned int (**)(void, uint64_t, uint64_t))(a1 + 1192))(*(void *)(a1 + 1184), a1 + 1200, 4) == -1)
    {
      return 0;
    }
    else
    {
      uint64_t result = *(void *)(a1 + 1208);
      if (result) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    if (a2 != 3) {
      return 0xFFFFFFFFLL;
    }
    *(void *)&v11.num = 0;
    v11.str = 0;
    uint64_t v6 = wcstol(*(const __int32 **)(a3 + 16), 0, 0);
    if (!wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"s"))
    {
      return history_w(*(HistoryW **)(a1 + 1184), &v11, 1, v6);
    }
    else
    {
      if (wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"u")) {
        return 0xFFFFFFFFLL;
      }
      return history_w(*(HistoryW **)(a1 + 1184), &v11, 20, v6);
    }
  }
  return result;
}

uint64_t sub_213B14E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 1152), 4 * a3, 0x100004052888210uLL);
  if (result)
  {
    uint64_t v7 = result;
    bzero((void *)(result + 4 * a2), 4 * (a3 - a2));
    *(void *)(a1 + 1168) = v7 + *(void *)(a1 + 1168) - *(void *)(a1 + 1152);
    *(void *)(a1 + 1152) = v7;
    *(void *)(a1 + 1160) = a3;
    return 1;
  }
  return result;
}

HistoryW *history_winit(void)
{
  uint64_t v0 = malloc_type_malloc(0x60uLL, 0x108004000789A1EuLL);
  unint64_t v1 = v0;
  if (v0)
  {
    if (sub_213B14FF8(v0) == -1)
    {
      free(v1);
      return 0;
    }
    else
    {
      *((_DWORD *)v1 + 2) = -1;
      v1[3] = sub_213B1505C;
      v1[2] = sub_213B150BC;
      v1[4] = sub_213B150F8;
      v1[5] = sub_213B15134;
      v1[6] = sub_213B151B0;
      v1[7] = sub_213B15208;
      v1[9] = sub_213B1528C;
      v1[10] = sub_213B152D4;
      v1[11] = sub_213B153F0;
      v1[8] = sub_213B15510;
    }
  }
  return (HistoryW *)v1;
}

uint64_t sub_213B14FF8(void *a1)
{
  uint64_t v2 = malloc_type_malloc(0x40uLL, 0x10F004084742EBCuLL);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = v2;
  uint64_t result = 0;
  v3[3] = v3;
  v3[4] = v3;
  v3[1] = 0;
  *(_DWORD *)int v3 = 0;
  v3[5] = v3;
  v3[6] = 0;
  v3[7] = 0;
  *a1 = v3;
  return result;
}

uint64_t sub_213B1505C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == a1)
  {
    *(_DWORD *)a2 = 5;
    uint64_t v6 = "e";
  }
  else
  {
    uint64_t v4 = *(_OWORD **)(v2 + 24);
    if (v4 != (_OWORD *)a1)
    {
      uint64_t result = 0;
      *(void *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }
    *(_DWORD *)a2 = 6;
    uint64_t v6 = "n";
  }
  *(void *)(a2 + 8) = v6;
  return 0xFFFFFFFFLL;
}

uint64_t sub_213B150BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 24);
  *(void *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 3;
    *(void *)(a2 + 8) = "f";
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_213B150F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 32);
  *(void *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 4;
    *(void *)(a2 + 8) = "l";
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_213B15134(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == a1)
  {
    int v6 = *(_DWORD *)(a1 + 52);
    BOOL v7 = v6 <= 0;
    if (v6 <= 0) {
      int v8 = 5;
    }
    else {
      int v8 = 6;
    }
    *(_DWORD *)a2 = v8;
    uint64_t v9 = 5;
    if (!v7) {
      uint64_t v9 = 6;
    }
    unint64_t v10 = off_2641D6BE8[v9];
  }
  else
  {
    uint64_t v4 = *(_OWORD **)(v3 + 32);
    if (v4 != (_OWORD *)a1)
    {
      uint64_t result = 0;
      *(void *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }
    *(_DWORD *)a2 = 7;
    unint64_t v10 = "n";
  }
  *(void *)(a2 + 8) = v10;
  return 0xFFFFFFFFLL;
}

uint64_t sub_213B151B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 40);
  if (v2 == (_OWORD *)a1)
  {
    int v4 = *(_DWORD *)(a1 + 52);
    BOOL v5 = v4 <= 0;
    if (v4 <= 0) {
      int v6 = 5;
    }
    else {
      int v6 = 8;
    }
    *(_DWORD *)a2 = v6;
    uint64_t v7 = 5;
    if (!v5) {
      uint64_t v7 = 8;
    }
    *(void *)(a2 + 8) = off_2641D6BE8[v7];
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_213B15208(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 52))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3 == a1 || *(_DWORD *)v3 != a3)
    {
      uint64_t v3 = a1;
      while (1)
      {
        uint64_t v3 = *(void *)(v3 + 24);
        if (v3 == a1) {
          break;
        }
        if (*(_DWORD *)v3 == a3) {
          goto LABEL_10;
        }
      }
      uint64_t v3 = a1;
LABEL_10:
      *(void *)(a1 + 40) = v3;
    }
    if (v3 != a1) {
      return 0;
    }
    int v4 = "e";
    int v5 = 9;
  }
  else
  {
    int v4 = "e";
    int v5 = 5;
  }
  *(_DWORD *)a2 = v5;
  *(void *)(a2 + 8) = v4;
  return 0xFFFFFFFFLL;
}

void sub_213B1528C(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 32); i != a1; uint64_t i = *(void *)(a1 + 32))
    sub_213B16130(a1, i);
  *(void *)(a1 + 40) = a1;
  *(_DWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 56) = 0;
}

uint64_t sub_213B152D4(uint64_t a1, uint64_t a2, __int32 *a3)
{
  if (*(unsigned char *)(a1 + 60))
  {
    uint64_t v6 = *(void *)(a1 + 24);
    if (v6 != a1)
    {
      uint64_t result = wcscmp(*(const __int32 **)(v6 + 8), a3);
      if (!result) {
        return result;
      }
    }
  }
  int v8 = malloc_type_malloc(0x28uLL, 0x10F00401F389D68uLL);
  if (!v8)
  {
LABEL_15:
    *(_DWORD *)a2 = 2;
    *(void *)(a2 + 8) = "m";
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  unint64_t v10 = sub_213B24874(a3);
  v9[1] = v10;
  if (!v10)
  {
    free(v9);
    goto LABEL_15;
  }
  uint64_t v11 = *(void *)(a1 + 24);
  v9[2] = 0;
  v9[3] = v11;
  v9[4] = a1;
  *(void *)(*(void *)(a1 + 24) + 32) = v9;
  int v12 = *(_DWORD *)(a1 + 52);
  LODWORD(v11) = *(_DWORD *)(a1 + 56) + 1;
  *(_DWORD *)uint64_t v9 = v11;
  *(void *)(a1 + 24) = v9;
  *(_DWORD *)(a1 + 52) = v12 + 1;
  *(_DWORD *)(a1 + 56) = v11;
  *(void *)(a1 + 40) = v9;
  *(_OWORD *)a2 = *(_OWORD *)v9;
  int v13 = *(_DWORD *)(a1 + 52);
  uint64_t result = 1;
  if (v13 >= 1 && v13 > *(_DWORD *)(a1 + 48))
  {
    do
    {
      sub_213B16130(a1, *(void *)(a1 + 32));
      int v14 = *(_DWORD *)(a1 + 52);
    }
    while (v14 >= 1 && v14 > *(_DWORD *)(a1 + 48));
    return 1;
  }
  return result;
}

uint64_t sub_213B153F0(uint64_t a1, uint64_t a2, __int32 *a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == a1)
  {
    return sub_213B152D4(a1, a2, a3);
  }
  else
  {
    size_t v7 = wcslen(*(const __int32 **)(v6 + 8));
    size_t v8 = wcslen(a3) + v7;
    uint64_t v9 = (__int32 *)malloc_type_malloc(4 * (v8 + 1), 0x100004052888210uLL);
    if (v9)
    {
      unint64_t v10 = v9;
      wcsncpy(v9, *(const __int32 **)(*(void *)(a1 + 40) + 8), v8 + 1);
      v10[v8] = 0;
      size_t v11 = wcslen(v10);
      wcsncat(v10, a3, v8 - v11);
      free(*(void **)(v6 + 8));
      uint64_t result = 0;
      *(void *)(v6 + 8) = v10;
      *(_OWORD *)a2 = *(_OWORD *)*(void *)(a1 + 40);
    }
    else
    {
      *(_DWORD *)a2 = 2;
      *(void *)(a2 + 8) = "m";
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_213B15510(uint64_t a1, uint64_t a2, int a3)
{
  if (sub_213B15208(a1, a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a2 + 8) = sub_213B24874(*(const __int32 **)(*(void *)(a1 + 40) + 8));
  uint64_t v6 = *(_DWORD **)(a1 + 40);
  *(_DWORD *)a2 = *v6;
  sub_213B16130(a1, (uint64_t)v6);
  return 0;
}

void history_wend(HistoryW *a1)
{
  if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_213B1505C) {
    sub_213B1528C(*(void *)a1);
  }
  free(*(void **)a1);

  free(a1);
}

int history_w(HistoryW *a1, HistEventW *a2, int a3, ...)
{
  va_start(va, a3);
  v82 = va_arg(va, const __int32 *);
  v83 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v84 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v85 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v86 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v87 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v88 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  v89 = va_arg(va, void (*)(uint64_t a1));
  v90 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, __int32 *a3));
  v91 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, __int32 *a3));
  v92 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  a2->num = 0;
  a2->str = (const __int32 *)"O";
  switch(a3)
  {
    case 0:
      *((_DWORD *)a1 + 2) = -1;
      int v5 = v83;
      uint64_t v6 = v84;
      size_t v7 = v85;
      size_t v8 = v86;
      uint64_t v9 = v87;
      unint64_t v10 = v88;
      size_t v11 = v89;
      int v12 = v90;
      int v13 = v91;
      int v14 = v92;
      if (v83) {
        BOOL v15 = v84 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      BOOL v24 = v15
         || v85 == 0
         || v86 == 0
         || v87 == 0
         || v88 == 0
         || v90 == 0
         || v91 == 0
         || v89 == 0
         || v92 == 0
         || v82 == 0;
      int v25 = v24;
      v26 = (uint64_t (*)(uint64_t, uint64_t))*((void *)a1 + 3);
      if (v24)
      {
        if (v26 == sub_213B1505C) {
          goto LABEL_123;
        }
        int v27 = v25;
        int v28 = sub_213B14FF8(a1);
        int v25 = v27;
        int v14 = sub_213B15510;
        int v13 = sub_213B153F0;
        int v12 = sub_213B152D4;
        size_t v11 = sub_213B1528C;
        unint64_t v10 = sub_213B15208;
        uint64_t v9 = sub_213B151B0;
        size_t v8 = sub_213B15134;
        size_t v7 = sub_213B150F8;
        uint64_t v6 = sub_213B1505C;
        if (v28 == -1)
        {
LABEL_123:
          a2->num = 12;
          v29 = "r";
          goto LABEL_138;
        }
        int v5 = sub_213B150BC;
      }
      else
      {
        if (v26 == sub_213B1505C)
        {
          int v77 = v25;
          sub_213B1528C(*(void *)a1);
          int v14 = v92;
          int v25 = v77;
          size_t v11 = v89;
        }
        *((_DWORD *)a1 + 2) = -1;
      }
      *((void *)a1 + 2) = v5;
      *((void *)a1 + 3) = v6;
      *((void *)a1 + 4) = v7;
      *((void *)a1 + 5) = v8;
      *((void *)a1 + 6) = v9;
      *((void *)a1 + 7) = v10;
      *((void *)a1 + 10) = v12;
      *((void *)a1 + 11) = v13;
      *((void *)a1 + 8) = v14;
      *((void *)a1 + 9) = v11;
      if (!v25) {
        return 0;
      }
      goto LABEL_123;
    case 1:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_213B1505C) {
        goto LABEL_94;
      }
      if ((v82 & 0x80000000) == 0)
      {
        int v30 = 0;
        *(_DWORD *)(*(void *)a1 + 48) = v82;
        return v30;
      }
      a2->num = 15;
      v29 = "b";
      goto LABEL_138;
    case 2:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_213B1505C)
      {
        v29 = "f";
        int v31 = 14;
        goto LABEL_137;
      }
      int v60 = *(_DWORD *)(*(void *)a1 + 52);
      a2->num = v60;
      if (v60 > -2) {
        return 0;
      }
      v29 = "h";
      int v31 = 13;
      goto LABEL_137;
    case 3:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 2))(*(void *)a1, a2);
    case 4:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 4))(*(void *)a1, a2);
    case 5:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 5))(*(void *)a1, a2);
    case 6:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 3))(*(void *)a1, a2);
    case 7:
      return (*((uint64_t (**)(void, HistEventW *, void))a1 + 7))(*(void *)a1, a2, v82);
    case 8:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
    case 9:
      return (*((uint64_t (**)(void, HistEventW *, const __int32 *))a1 + 11))(*(void *)a1, a2, v82);
    case 10:
      int v30 = (*((uint64_t (**)(void, HistEventW *, const __int32 *))a1 + 10))(*(void *)a1, a2, v82);
      if (v30 != -1) {
        *((_DWORD *)a1 + 2) = a2->num;
      }
      return v30;
    case 11:
      if ((*((unsigned int (**)(void, HistEventW *, void))a1 + 7))(*(void *)a1, a2, *((unsigned int *)a1 + 2)) == -1)return -1; {
      return (*((uint64_t (**)(void, HistEventW *, const __int32 *))a1 + 11))(*(void *)a1, a2, v82);
      }
    case 12:
      history_wend(a1);
      return 0;
    case 13:
      size_t v33 = wcslen(v82);
      int v34 = (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v34 == -1) {
          goto LABEL_103;
        }
        if (wcsncmp(v82, a2->str, v33))
        {
          int v34 = (*((uint64_t (**)(void, HistEventW *))a1 + 5))(*(void *)a1, a2);
          continue;
        }
        return 0;
      }
    case 14:
      size_t v35 = wcslen(v82);
      int v36 = (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v36 == -1) {
          goto LABEL_103;
        }
        if (wcsncmp(v82, a2->str, v35))
        {
          int v36 = (*((uint64_t (**)(void, HistEventW *))a1 + 3))(*(void *)a1, a2);
          continue;
        }
        return 0;
      }
    case 15:
      int v37 = (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v37 == -1) {
          goto LABEL_103;
        }
        if (a2->num != v82)
        {
          int v37 = (*((uint64_t (**)(void, HistEventW *))a1 + 3))(*(void *)a1, a2);
          continue;
        }
        return 0;
      }
    case 16:
      int v38 = (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v38 == -1) {
          goto LABEL_103;
        }
        if (a2->num != v82)
        {
          int v38 = (*((uint64_t (**)(void, HistEventW *))a1 + 5))(*(void *)a1, a2);
          continue;
        }
        return 0;
      }
    case 17:
      v39 = fopen((const char *)v82, "r");
      if (!v39) {
        goto LABEL_80;
      }
      v40 = v39;
      size_t __n = 0;
      uint64_t v80 = 0;
      v81 = 0;
      v41 = fgetln(v39, &__n);
      if (!v41
        || strncmp(v41, "_HiStOrY_V2_\n", __n)
        || (v64 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL)) == 0)
      {
        fclose(v40);
        goto LABEL_80;
      }
      v65 = v64;
      v66 = fgetln(v40, &__n);
      if (v66)
      {
        v67 = v66;
        int v30 = 0;
        size_t v68 = 1024;
        while (1)
        {
          size_t v69 = __n;
          if (__n && v67[__n - 1] == 10)
          {
            --__n;
            --v69;
          }
          if (v68 < v69)
          {
            size_t v68 = (v69 & 0xFFFFFFFFFFFFFC00) + 1024;
            v70 = malloc_type_realloc(v65, v68, 0x100004077774924uLL);
            if (!v70) {
              break;
            }
            size_t v69 = __n;
            v65 = v70;
          }
          int v79 = 0;
          v71 = (char *)v65;
          if (v69)
          {
            v71 = (char *)v65;
            do
            {
              --v69;
              int v73 = *v67++;
              int v72 = v73;
              while (1)
              {
                int v74 = unvis(v71, v72, &v79, 0);
                if (v74 != 2) {
                  break;
                }
                ++v71;
              }
              if (v74 && v74 != 3)
              {
                if (v74 != 1) {
                  goto LABEL_164;
                }
                ++v71;
              }
            }
            while (v69);
          }
          v75 = unvis(v71, 0, &v79, 2048) == 1 ? v71 + 1 : v71;
          char *v75 = 0;
LABEL_164:
          v76 = sub_213B238D0((__int32 *)v65, (uint64_t)&unk_2677F4348);
          if (!v76
            || (*((unsigned int (**)(void, uint64_t *, __int32 *))a1 + 10))(*(void *)a1, &v80, v76) == -1)
          {
            break;
          }
          ++v30;
          v67 = fgetln(v40, &__n);
          if (!v67) {
            goto LABEL_177;
          }
        }
        int v30 = -1;
      }
      else
      {
        int v30 = 0;
      }
LABEL_177:
      free(v65);
      fclose(v40);
      if (v30 == -1)
      {
LABEL_80:
        a2->num = 10;
        v29 = "c";
        goto LABEL_138;
      }
      return v30;
    case 18:
      v42 = fopen((const char *)v82, "w");
      if (!v42) {
        goto LABEL_125;
      }
      v43 = v42;
      uint64_t v80 = 0;
      v81 = 0;
      int v44 = fileno(v42);
      if (fchmod(v44, 0x180u) == -1
        || fputs("_HiStOrY_V2_\n", v43) == -1
        || (unint64_t v45 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL)) == 0)
      {
        fclose(v43);
        goto LABEL_125;
      }
      size_t v46 = v45;
      if ((*((unsigned int (**)(void, uint64_t *))a1 + 4))(*(void *)a1, &v80) == -1)
      {
        int v30 = 0;
        goto LABEL_174;
      }
      int v30 = 0;
      size_t v47 = 1024;
      while (2)
      {
        int v48 = sub_213B23790(v81, (uint64_t)&unk_2677F4368);
        size_t v49 = 4 * strlen((const char *)v48);
        if (v49 < v47) {
          goto LABEL_90;
        }
        size_t v47 = (v49 & 0xFFFFFFFFFFFFFC00) + 1024;
        BOOL v50 = malloc_type_realloc(v46, v47, 0x100004077774924uLL);
        if (v50)
        {
          size_t v46 = v50;
LABEL_90:
          strvis((char *)v46, (const char *)v48, 28);
          fprintf(v43, "%s\n", (const char *)v46);
          ++v30;
          if ((*((unsigned int (**)(void, uint64_t *))a1 + 5))(*(void *)a1, &v80) == -1) {
            goto LABEL_174;
          }
          continue;
        }
        break;
      }
      int v30 = -1;
LABEL_174:
      free(v46);
      fclose(v43);
      if (v30 == -1)
      {
LABEL_125:
        a2->num = 11;
        v29 = "c";
        goto LABEL_138;
      }
      return v30;
    case 19:
      (*((void (**)(void, HistEventW *))a1 + 9))(*(void *)a1, a2);
      return 0;
    case 20:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_213B1505C)
      {
LABEL_94:
        a2->num = 14;
        v29 = "f";
        goto LABEL_138;
      }
      int v61 = *(_DWORD *)(*(void *)a1 + 60);
      int v30 = 0;
      if (v82) {
        unsigned int v62 = v61 | 1;
      }
      else {
        unsigned int v62 = v61 & 0xFFFFFFFE;
      }
      *(_DWORD *)(*(void *)a1 + 60) = v62;
      return v30;
    case 21:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_213B1505C)
      {
        int v30 = 0;
        int v51 = *(_DWORD *)(*(void *)a1 + 60) & 1;
      }
      else
      {
        a2->str = (const __int32 *)"f";
        int v30 = -1;
        int v51 = 14;
      }
      a2->num = v51;
      return v30;
    case 22:
      return (*((uint64_t (**)(void, HistEventW *, void))a1 + 8))(*(void *)a1, a2, v82);
    case 23:
      if ((*((unsigned int (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2) == -1) {
        goto LABEL_103;
      }
      int v52 = v82 + 1;
      while (--v52 > 0)
      {
        if ((*((unsigned int (**)(void, HistEventW *))a1 + 5))(*(void *)a1, a2) == -1)
        {
LABEL_103:
          a2->num = 9;
          v29 = "e";
LABEL_138:
          a2->str = (const __int32 *)v29;
          return -1;
        }
      }
      if (!v83) {
        return 0;
      }
      int v30 = 0;
      *(void *)v83 = *(void *)(*(void *)(*(void *)a1 + 40) + 16);
      return v30;
    case 24:
      int v53 = (int)v82;
      uint64_t v54 = *(void *)a1;
      if (!*(_DWORD *)(*(void *)a1 + 52))
      {
        v29 = "e";
        int v31 = 5;
LABEL_137:
        a2->num = v31;
        goto LABEL_138;
      }
      uint64_t v55 = *(void *)a1;
      do
        uint64_t v55 = *(void *)(v55 + 32);
      while (v55 != v54 && v53-- > 0);
      *(void *)(v54 + 40) = v55;
      if (v55 == v54)
      {
        v29 = "e";
        int v31 = 9;
        goto LABEL_137;
      }
      if (v83 != (uint64_t (*)(uint64_t, uint64_t))-1)
      {
        a2->str = sub_213B24874(*(const __int32 **)(v55 + 8));
        uint64_t v57 = *(void *)(v54 + 40);
        a2->num = *(_DWORD *)v57;
        if (v83)
        {
          *(void *)v83 = *(void *)(v57 + 16);
          uint64_t v57 = *(void *)(v54 + 40);
        }
        sub_213B16130(v54, v57);
      }
      return 0;
    case 25:
      if (!v82) {
        return -1;
      }
      v58 = sub_213B24874(v82);
      if (!v58) {
        return -1;
      }
      int v30 = 0;
      uint64_t v59 = *(void *)(*(void *)a1 + 40);
      *(void *)(v59 + 8) = v58;
      *(void *)(v59 + 16) = v83;
      return v30;
    default:
      a2->num = 1;
      v29 = "u";
      goto LABEL_138;
  }
}

void sub_213B16130(uint64_t a1, uint64_t a2)
{
  if (a2 == a1) {
    abort();
  }
  uint64_t v4 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 40) == a2)
  {
    *(void *)(a1 + 40) = v4;
    if (v4 == a1)
    {
      *(void *)(a1 + 40) = *(void *)(a2 + 24);
      uint64_t v4 = a1;
    }
  }
  *(void *)(v4 + 24) = *(void *)(a2 + 24);
  *(void *)(*(void *)(a2 + 24) + 32) = v4;
  free(*(void **)(a2 + 8));
  free((void *)a2);
  --*(_DWORD *)(a1 + 52);
}

uint64_t sub_213B161B4(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(void *)(a1 + 1128) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 1136) = 0;
  sub_213B162E8(0);
  uint64_t result = 0;
  *(void *)(a1 + 1136) = 0;
  return result;
}

void sub_213B16210(uint64_t a1)
{
  *(void *)(a1 + 1136) = 0;
}

void sub_213B1623C(uint64_t a1)
{
  free(*(void **)(a1 + 1128));
  *(void *)(a1 + 1128) = 0;
  uint64_t v2 = *(void **)(a1 + 1136);

  sub_213B1627C(v2);
}

void sub_213B1627C(void *a1)
{
  if (a1)
  {
    sub_213B1627C(a1[3]);
    sub_213B1627C(a1[2]);
    free(a1);
  }
}

uint64_t sub_213B162C8(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 1144) = a2;
  return a1 + 1144;
}

uint64_t sub_213B162D8(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 1144) = a2;
  return a1 + 1144;
}

void sub_213B162E8(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 16))
    {
      ((void (*)(void))sub_213B162E8)();
      *(void *)(a1 + 16) = 0;
    }
    sub_213B162E8(*(void *)(a1 + 24));
    switch(*(_DWORD *)(a1 + 4))
    {
      case 0:
      case 2:
        break;
      case 1:
      case 3:
        uint64_t v2 = *(void **)(a1 + 8);
        if (v2) {
          free(v2);
        }
        break;
      default:
        abort();
    }
    free((void *)a1);
  }
}

uint64_t sub_213B16390(EditLine *a1, __int32 *a2, void *a3)
{
  uint64_t v6 = (uint64_t *)((char *)a1 + 1136);
  while (1)
  {
    uint64_t v7 = *v6;
    while (*(_DWORD *)v7 != *a2)
    {
      uint64_t v7 = *(void *)(v7 + 24);
      if (!v7)
      {
        *a3 = 0;
        return 1;
      }
    }
    uint64_t v6 = (uint64_t *)(v7 + 16);
    if (!*(void *)(v7 + 16)) {
      break;
    }
    if (el_wgetc(a1, a2) != 1)
    {
      uint64_t result = 0;
      *(unsigned char *)a3 = 7;
      return result;
    }
  }
  *a3 = *(void *)(v7 + 8);
  if (!*(_DWORD *)(v7 + 4)) {
    return 0;
  }
  *a2 = 0;
  return *(unsigned int *)(v7 + 4);
}

void sub_213B16440(uint64_t a1, int *a2, const __int32 **a3, int a4)
{
  int v5 = *a2;
  if (!*a2)
  {
    uint64_t v9 = *(FILE **)(a1 + 24);
    unint64_t v10 = "keymacro_add: Null extended-key not allowed.\n";
    size_t v11 = 45;
    goto LABEL_13;
  }
  if (!a4 && *(unsigned char *)a3 == 24)
  {
    uint64_t v9 = *(FILE **)(a1 + 24);
    unint64_t v10 = "keymacro_add: sequence-lead-in command not allowed\n";
    size_t v11 = 51;
LABEL_13:
    fwrite(v10, v11, 1uLL, v9);
    return;
  }
  int v12 = *(_DWORD **)(a1 + 1136);
  if (!v12)
  {
    int v12 = malloc_type_malloc(0x20uLL, 0x1032040358E0334uLL);
    if (v12)
    {
      *int v12 = v5;
      v12[1] = 2;
      *((void *)v12 + 2) = 0;
      *((void *)v12 + 3) = 0;
      *((void *)v12 + 1) = 0;
    }
    *(void *)(a1 + 1136) = v12;
  }

  sub_213B16534(v12, a2, a3, a4);
}

void sub_213B16534(_DWORD *a1, int *a2, const __int32 **a3, int a4)
{
  while (1)
  {
    int v8 = *a2;
    if (*a1 == *a2)
    {
      uint64_t v9 = a1;
    }
    else
    {
      while (1)
      {
        uint64_t v9 = (_DWORD *)*((void *)a1 + 3);
        if (!v9) {
          break;
        }
        a1 = (_DWORD *)*((void *)a1 + 3);
        if (*v9 == v8) {
          goto LABEL_9;
        }
      }
      unint64_t v10 = malloc_type_malloc(0x20uLL, 0x1032040358E0334uLL);
      uint64_t v9 = v10;
      if (v10)
      {
        *unint64_t v10 = v8;
        v10[1] = 2;
        *((void *)v10 + 2) = 0;
        *((void *)v10 + 3) = 0;
        *((void *)v10 + 1) = 0;
      }
      *((void *)a1 + 3) = v10;
    }
LABEL_9:
    int v12 = a2[1];
    ++a2;
    int v11 = v12;
    a1 = (_DWORD *)*((void *)v9 + 2);
    if (!v12) {
      break;
    }
    if (!a1)
    {
      int v13 = malloc_type_malloc(0x20uLL, 0x1032040358E0334uLL);
      a1 = v13;
      if (v13)
      {
        *int v13 = v11;
        v13[1] = 2;
        *((void *)v13 + 2) = 0;
        *((void *)v13 + 3) = 0;
        *((void *)v13 + 1) = 0;
      }
      *((void *)v9 + 2) = v13;
    }
  }
  if (a1)
  {
    sub_213B162E8(*((void *)v9 + 2));
    *((void *)v9 + 2) = 0;
  }
  switch(v9[1])
  {
    case 0:
    case 2:
      goto LABEL_19;
    case 1:
    case 3:
      int v14 = (void *)*((void *)v9 + 1);
      if (v14) {
        free(v14);
      }
LABEL_19:
      v9[1] = a4;
      if (a4 == 3 || a4 == 1)
      {
        *((void *)v9 + 1) = sub_213B24874(*a3);
      }
      else
      {
        if (a4) {
LABEL_24:
        }
          abort();
        *((void *)v9 + 1) = *a3;
      }
      return;
    default:
      goto LABEL_24;
  }
}

uint64_t sub_213B166B0(uint64_t result, uint64_t a2, int *a3)
{
  if (*a3 <= 256)
  {
    uint64_t v3 = *a3;
    if (*(unsigned char *)(a2 + v3) == 24)
    {
      uint64_t v4 = *(void *)(result + 1056);
      uint64_t v5 = *(void *)(result + 1048);
      if (v4 == a2 && *(unsigned char *)(v5 + v3) != 24) {
        return sub_213B16708(result, a3);
      }
      if (v5 == a2 && *(unsigned char *)(v4 + v3) != 24) {
        return sub_213B16708(result, a3);
      }
    }
  }
  return result;
}

uint64_t sub_213B16708(uint64_t a1, _DWORD *a2)
{
  if (*a2)
  {
    if (*(void *)(a1 + 1136)) {
      sub_213B16758((_DWORD **)(a1 + 1136), a2);
    }
    return 0;
  }
  else
  {
    fwrite("keymacro_delete: Null extended-key not allowed.\n", 0x30uLL, 1uLL, *(FILE **)(a1 + 24));
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_213B16758(_DWORD **a1, _DWORD *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *a1;
  if (**a1 != *a2)
  {
    while (1)
    {
      uint64_t v6 = v3;
      uint64_t v3 = (_DWORD *)*((void *)v3 + 3);
      if (!v3) {
        return 0;
      }
      if (*v3 == *a2)
      {
        int v7 = a2[1];
        uint64_t v4 = a2 + 1;
        if (v7) {
          goto LABEL_7;
        }
        uint64_t v2 = v6 + 6;
        goto LABEL_12;
      }
    }
  }
  int v5 = a2[1];
  uint64_t v4 = a2 + 1;
  if (v5)
  {
    uint64_t v6 = 0;
LABEL_7:
    if (!*((void *)v3 + 2)) {
      return 0;
    }
    uint64_t result = sub_213B16758(v3 + 4, v4);
    if (!result) {
      return result;
    }
    if (*((void *)v3 + 2)) {
      return 0;
    }
    uint64_t v9 = v6 + 6;
    if (!v6) {
      uint64_t v9 = v2;
    }
    *uint64_t v9 = *((void *)v3 + 3);
  }
  else
  {
LABEL_12:
    *uint64_t v2 = *((void *)v3 + 3);
  }
  *((void *)v3 + 3) = 0;
  sub_213B162E8((uint64_t)v3);
  return 1;
}

uint64_t sub_213B16820(uint64_t result, _DWORD *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(unsigned int **)(result + 1136);
  if (v4 || *a2)
  {
    **(_DWORD **)(result + 1128) = 34;
    unint64_t v5 = 1;
    uint64_t v6 = a2;
    while (2)
    {
      int v7 = v4;
      while (1)
      {
        if (!v7) {
          return fprintf(*(FILE **)(v3 + 24), "Unbound extended key \"%ls\"\n", a2);
        }
        if (!v6) {
          goto LABEL_15;
        }
        unint64_t v8 = *v6;
        if (!v8)
        {
          uint64_t v4 = v7;
LABEL_15:
          return sub_213B16C24(v3, v4, v5);
        }
        if (*v7 == v8) {
          break;
        }
        int v7 = (unsigned int *)*((void *)v7 + 3);
        if (!v7) {
          return fprintf(*(FILE **)(v3 + 24), "Unbound extended key \"%ls\"\n", a2);
        }
      }
      uint64_t v9 = sub_213B23C1C((_DWORD *)(*(void *)(v3 + 1128) + 4 * v5), 1024 - v5, v8);
      if (v9 == -1) {
        return fprintf(*(FILE **)(v3 + 24), "Unbound extended key \"%ls\"\n", a2);
      }
      uint64_t v4 = (unsigned int *)*((void *)v7 + 2);
      ++v6;
      if (v4)
      {
        v5 += v9;
        continue;
      }
      break;
    }
    if (*v6) {
      return fprintf(*(FILE **)(v3 + 24), "Unbound extended key \"%ls\"\n", a2);
    }
    unint64_t v10 = *(unsigned __int32 **)(v3 + 1128);
    *(void *)&v10[v9 + v5] = 34;
    int v11 = v7[1];
    return sub_213B16978(v3, v10, (unsigned int **)v7 + 1, v11);
  }
  return result;
}

uint64_t sub_213B16978(uint64_t result, unsigned __int32 *a2, unsigned int **a3, int a4)
{
  uint64_t v5 = result;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a4)
    {
      if (a4 != 3 && a4 != 1) {
        abort();
      }
      if (a4 == 1) {
        uint64_t v6 = "\"\"";
      }
      else {
        uint64_t v6 = "[]";
      }
      sub_213B16ABC(*a3, v16, 1024, v6);
      goto LABEL_9;
    }
    uint64_t v11 = *(void *)(result + 1104);
    int v12 = *(const __int32 **)v11;
    if (*(void *)v11)
    {
      int v13 = *(unsigned __int8 *)a3;
      if (*(_DWORD *)(v11 + 8) == v13)
      {
LABEL_17:
        wcstombs(v16, v12, 0x400uLL);
        v16[1023] = 0;
LABEL_9:
        int v7 = *(FILE **)(v5 + 16);
        unint64_t v8 = sub_213B23790(a2, v5 + 1264);
        return fprintf(v7, "%-15s->  %s\n", (const char *)v8, v16);
      }
      int v14 = (_DWORD *)(v11 + 32);
      while (1)
      {
        int v12 = (const __int32 *)*((void *)v14 - 1);
        if (!v12) {
          break;
        }
        int v15 = *v14;
        v14 += 6;
        if (v15 == v13) {
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
    uint64_t v9 = *(FILE **)(result + 16);
    unint64_t v10 = sub_213B23790(a2, result + 1264);
    return fprintf(v9, "%-15s->  %s\n", (const char *)v10, "no input");
  }
  return result;
}

unint64_t sub_213B16ABC(unsigned int *a1, char *a2, uint64_t a3, char *a4)
{
  int v7 = a1;
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v8 = a2;
  if (*a4)
  {
    unint64_t v8 = a2 + 1;
    if (a3 >= 1) {
      *a2 = *a4;
    }
  }
  uint64_t v9 = &a2[a3];
  unint64_t v10 = *a1;
  if (v10)
  {
    do
    {
      uint64_t v11 = v20;
      uint64_t v12 = sub_213B23C1C(v20, 8uLL, v10);
      int v13 = v8;
      while (1)
      {
        unint64_t v8 = v13;
        if (v12 <= 0) {
          break;
        }
        --v12;
        unsigned __int32 v14 = *v11++;
        uint64_t v15 = sub_213B23854(v13, v9 - v13, v14);
        int v13 = &v8[v15];
        if (v15 == -1) {
          goto LABEL_15;
        }
      }
      unsigned int v16 = v7[1];
      ++v7;
      unint64_t v10 = v16;
    }
    while (v16);
  }
  else
  {
    if (v8 < v9) {
      *unint64_t v8 = 94;
    }
    uint64_t v17 = v8 + 1;
    v8 += 2;
    if (v17 < v9) {
      *uint64_t v17 = 64;
    }
  }
LABEL_15:
  if (*a4 && a4[1])
  {
    int v18 = v8 + 1;
    if (v8 < v9) {
      *unint64_t v8 = a4[1];
    }
  }
  else
  {
    int v18 = v8;
  }
  if (v18 < v9) {
    *int v18 = 0;
  }
  unint64_t result = v18 - a2 + 1;
  if (result >= a3) {
    a2[a3 - 1] = 0;
  }
  return result;
}

uint64_t sub_213B16C24(uint64_t a1, unsigned int *a2, unint64_t a3)
{
  if (a3 > 0x3FA)
  {
    *(void *)(*(void *)(a1 + 1128) + 4 * a3 + 4) = 34;
    fwrite("Some extended keys too long for internal print buffer", 0x35uLL, 1uLL, *(FILE **)(a1 + 24));
    return fprintf(*(FILE **)(a1 + 24), " \"%ls...\"\n", *(const void **)(a1 + 1128));
  }
  else
  {
    do
    {
      uint64_t v6 = sub_213B23C1C((_DWORD *)(*(void *)(a1 + 1128) + 4 * a3), 1024 - a3, *a2);
      uint64_t v7 = *((void *)a2 + 2);
      if (v7)
      {
        uint64_t result = sub_213B16C24(a1, v7, v6 + a3);
      }
      else
      {
        uint64_t v9 = *(unsigned __int32 **)(a1 + 1128);
        *(void *)&v9[v6 + a3] = 34;
        uint64_t result = sub_213B16978(a1, v9, (unsigned int **)a2 + 1, a2[1]);
      }
      a2 = (unsigned int *)*((void *)a2 + 3);
    }
    while (a2);
  }
  return result;
}

uint64_t sub_213B16D18(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
  *(void *)(a1 + 1048) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
  *(void *)(a1 + 1056) = v3;
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 1072) = &unk_213B27010;
  *(void *)(a1 + 1080) = &unk_213B27110;
  *(void *)(a1 + 1088) = &unk_213B27210;
  uint64_t v4 = malloc_type_malloc(0x990uLL, 0x10500400D13D5BAuLL);
  *(void *)(a1 + 1104) = v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_213B236DC();
  memcpy(v5, v6, 0x990uLL);
  uint64_t v7 = malloc_type_malloc(0x330uLL, 0x80040B8603338uLL);
  *(void *)(a1 + 1112) = v7;
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v8 = v7;
  uint64_t v9 = sub_213B236D0();
  memcpy(v8, v9, 0x330uLL);
  *(_DWORD *)(a1 + 1120) = 102;
  sub_213B16E28(a1);
  return 0;
}

void sub_213B16E28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 1056);
  uint64_t v3 = *(void *)(a1 + 1048);
  uint64_t v4 = *(void *)(a1 + 1088);
  uint64_t v5 = *(void *)(a1 + 1080);
  *(_DWORD *)(a1 + 1096) = 1;
  *(void *)(a1 + 1064) = v2;
  sub_213B16210(a1);
  for (uint64_t i = 0; i != 256; ++i)
  {
    *(unsigned char *)(v2 + i) = *(unsigned char *)(v4 + i);
    *(unsigned char *)(v3 + i) = *(unsigned char *)(v5 + i);
  }
  sub_213B16F48(a1);
  uint64_t v7 = *(void *)(a1 + 1056);
  for (uint64_t j = 128; j != 256; ++j)
  {
    if (__maskrune(j, 0x40000uLL)) {
      *(unsigned char *)(v7 + j) = 8;
    }
  }
  sub_213B21800(a1, 1);

  sub_213B1FD9C(a1);
}

void sub_213B16EEC(uint64_t a1)
{
  *(void *)(a1 + 1048) = 0;
  free(*(void **)(a1 + 1056));
  *(void *)(a1 + 1056) = 0;
  *(void *)(a1 + 1072) = 0;
  *(void *)(a1 + 1088) = 0;
  *(void *)(a1 + 1080) = 0;
  free(*(void **)(a1 + 1104));
  *(void *)(a1 + 1104) = 0;
  free(*(void **)(a1 + 1112));
  *(void *)(a1 + 1112) = 0;
}

void sub_213B16F48(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 1048);
  do
  {
    if (*(unsigned char *)(*(void *)(a1 + 1056) + v2) == 48)
    {
      uint64_t v3 = *(void *)(a1 + 1056);
      goto LABEL_11;
    }
    ++v2;
  }
  while (v2 != 256);
  uint64_t v2 = 0;
  while (*(unsigned char *)(v3 + v2) != 48)
  {
    if (++v2 == 256)
    {
      if (*(_DWORD *)(a1 + 1096) != 1) {
        uint64_t v3 = *(void *)(a1 + 1056);
      }
      LODWORD(v2) = 27;
      break;
    }
  }
LABEL_11:
  uint64_t v4 = 0;
  v8[0] = v2;
  v8[2] = 0;
  do
  {
    unsigned int v5 = *(unsigned __int8 *)(v3 + 128 + v4);
    if (v5 > 0x22 || ((1 << v5) & 0x401000100) == 0)
    {
      v8[1] = v4;
      uint64_t v7 = (const __int32 **)sub_213B162C8(a1, v5);
      sub_213B16440(a1, v8, v7, 0);
    }
    ++v4;
  }
  while (v4 != 128);
  *(unsigned char *)(v3 + v8[0]) = 24;
}

void sub_213B17074(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 1056);
  uint64_t v3 = *(void *)(a1 + 1048);
  uint64_t v4 = *(void *)(a1 + 1072);
  *(_DWORD *)(a1 + 1096) = 0;
  *(void *)(a1 + 1064) = v2;
  sub_213B16210(a1);
  for (uint64_t i = 0; i != 256; ++i)
  {
    *(unsigned char *)(v2 + i) = *(unsigned char *)(v4 + i);
    *(unsigned char *)(v3 + i) = 34;
  }
  sub_213B16F48(a1);
  uint64_t v6 = *(void *)(a1 + 1056);
  for (uint64_t j = 128; j != 256; ++j)
  {
    if (__maskrune(j, 0x40000uLL)) {
      *(unsigned char *)(v6 + j) = 8;
    }
  }
  uint64_t v9 = 0x1800000018;
  int v10 = 0;
  unint64_t v8 = (const __int32 **)sub_213B162C8(a1, 41);
  sub_213B16440(a1, (int *)&v9, v8, 0);
  sub_213B21800(a1, 1);
  sub_213B1FD9C(a1);
}

uint64_t sub_213B1717C(uint64_t a1, __int32 *a2)
{
  if (!wcscmp(a2, dword_213B27310))
  {
    sub_213B17074(a1);
  }
  else
  {
    if (wcscmp(a2, dword_213B27328)) {
      return 0xFFFFFFFFLL;
    }
    sub_213B16E28(a1);
  }
  return 0;
}

uint64_t sub_213B171E8(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  int v2 = *(_DWORD *)(a1 + 1096);
  if (!v2)
  {
    uint64_t v3 = &unk_213B27310;
    goto LABEL_7;
  }
  if (v2 != 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = &unk_213B27328;
LABEL_7:
  uint64_t result = 0;
  *a2 = v3;
  return result;
}

uint64_t sub_213B17224()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = (const void **)v1;
  uint64_t v3 = v0;
  uint64_t v4 = *(__int32 **)(v1 + 8);
  if (!v4)
  {
LABEL_14:
    fwrite("Standard key bindings\n", 0x16uLL, 1uLL, *(FILE **)(v3 + 16));
    uint64_t v12 = 0;
    signed int v13 = 0;
    do
    {
      uint64_t v14 = *(void *)(v3 + 1056);
      if (*(unsigned __int8 *)(v14 + v13) != *(unsigned __int8 *)(v14 + v12))
      {
        sub_213B178F4(v3, v14, v13, v12 - 1);
        signed int v13 = v12;
      }
      ++v12;
    }
    while (v12 != 256);
    sub_213B178F4(v3, *(void *)(v3 + 1056), v13, 0xFFu);
    fwrite("Alternative key bindings\n", 0x19uLL, 1uLL, *(FILE **)(v3 + 16));
    uint64_t v15 = 0;
    signed int v16 = 0;
    do
    {
      uint64_t v17 = *(void *)(v3 + 1048);
      if (*(unsigned __int8 *)(v17 + v16) != *(unsigned __int8 *)(v17 + v15))
      {
        sub_213B178F4(v3, v17, v16, v15 - 1);
        signed int v16 = v15;
      }
      ++v15;
    }
    while (v15 != 256);
    sub_213B178F4(v3, *(void *)(v3 + 1048), v16, 0xFFu);
    fwrite("Multi-character bindings\n", 0x19uLL, 1uLL, *(FILE **)(v3 + 16));
    sub_213B16820(v3, &dword_213B27334);
    fwrite("Arrow key bindings\n", 0x13uLL, 1uLL, *(FILE **)(v3 + 16));
    uint64_t v18 = v3;
    int v19 = &dword_213B27334;
    goto LABEL_23;
  }
  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)(v0 + 1056);
  uint64_t v9 = 2;
  while (*v4 == 45)
  {
    uint64_t v10 = v4[1];
    uint64_t v11 = 1;
    switch((int)v10)
    {
      case 'k':
        int v5 = 1;
        goto LABEL_12;
      case 'l':
        int v24 = *(_DWORD *)(v3 + 1120);
        if (v24 < 1) {
          return 0;
        }
        int v25 = *(const void ***)(v3 + 1104);
        v26 = &v25[3 * v24];
        do
        {
          fprintf(*(FILE **)(v3 + 16), "%ls\n\t%ls\n", *v25, v25[2]);
          uint64_t result = 0;
          v25 += 3;
        }
        while (v25 < v26);
        return result;
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'q':
      case 't':
      case 'u':
        goto LABEL_9;
      case 'r':
        int v6 = 1;
        goto LABEL_12;
      case 's':
        goto LABEL_13;
      case 'v':
        sub_213B16E28(v3);
        return 0;
      default:
        if (v10 == 97)
        {
          uint64_t v8 = *(void *)(v3 + 1048);
        }
        else
        {
          if (v10 == 101)
          {
            sub_213B17074(v3);
            return 0;
          }
LABEL_9:
        }
LABEL_12:
        uint64_t v11 = v7;
LABEL_13:
        uint64_t v4 = (__int32 *)v2[v9++];
        uint64_t v7 = v11;
        if (!v4) {
          goto LABEL_14;
        }
        break;
    }
  }
  if (v5)
  {
    if (v6)
    {
      sub_213B20234(v3, v4);
      return 0xFFFFFFFFLL;
    }
    long long v23 = (__int32 *)v2[v9];
    if (!v23)
    {
      uint64_t v18 = v3;
      int v19 = v4;
LABEL_23:
      sub_213B20294(v18, v19);
      return 0;
    }
  }
  else
  {
    uint64_t v21 = sub_213B17E64(v37, v4);
    if (!v21)
    {
      fprintf(*(FILE **)(v3 + 24), "%ls: Invalid \\ or ^ in instring.\n");
      return 0xFFFFFFFFLL;
    }
    uint64_t v4 = v21;
    if (v6)
    {
      if (v21[1] || (uint64_t v22 = *(unsigned __int8 *)v21, *(unsigned char *)(v8 + v22) == 24))
      {
        sub_213B16708(v3, v21);
        return 0;
      }
      uint64_t result = 0;
      char v34 = 34;
      goto LABEL_59;
    }
    long long v23 = (__int32 *)v2[v9];
    if (!v23)
    {
      sub_213B176F0(v3, v8, (unsigned int *)v21);
      return 0;
    }
  }
  if (v7)
  {
    int v27 = sub_213B17E64(v36, v23);
    if (!v27)
    {
      fprintf(*(FILE **)(v3 + 24), "%ls: Invalid \\ or ^ in outstring.\n");
      return 0xFFFFFFFFLL;
    }
    int v28 = (const __int32 **)sub_213B162D8(v3, (uint64_t)v27);
    uint64_t v29 = v3;
    int v30 = v4;
    int v31 = 1;
    if (v5)
    {
      sub_213B201C0(v3, v4, v28, v7);
LABEL_58:
      uint64_t result = 0;
      uint64_t v22 = *(unsigned __int8 *)v4;
      char v34 = 24;
LABEL_59:
      *(unsigned char *)(v8 + v22) = v34;
      return result;
    }
LABEL_57:
    sub_213B16440(v29, v30, v28, v31);
    goto LABEL_58;
  }
  int v32 = sub_213B17F30(v3, v23);
  if (v32 == -1)
  {
    return 0xFFFFFFFFLL;
  }
  if (v5)
  {
    size_t v33 = (void *)sub_213B162D8(v3, 0);
    sub_213B201C0(v3, v4, v33, 0);
    return 0;
  }
  char v35 = v32;
  if (v4[1])
  {
    int v28 = (const __int32 **)sub_213B162C8(v3, v32);
    uint64_t v29 = v3;
    int v30 = v4;
    int v31 = 0;
    goto LABEL_57;
  }
  sub_213B166B0(v3, v8, v4);
  uint64_t result = 0;
  *(unsigned char *)(v8 + *(unsigned __int8 *)v4) = v35;
  return result;
}

unint64_t sub_213B176F0(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*a3 && a3[1])
  {
    return sub_213B16820(a1, a3);
  }
  else
  {
    unint64_t result = sub_213B16ABC(a3, v10, 1024, "");
    int v7 = *(_DWORD *)(a1 + 1120);
    if (v7 >= 1)
    {
      unint64_t v8 = *(void *)(a1 + 1104);
      unint64_t v9 = v8 + 24 * v7;
      while (*(_DWORD *)(v8 + 8) != *(unsigned __int8 *)(a2 + *(unsigned __int8 *)a3))
      {
        v8 += 24;
        if (v8 >= v9) {
          return result;
        }
      }
      return fprintf(*(FILE **)(a1 + 16), "%s\t->\t%ls\n", v10, *(const void **)v8);
    }
  }
  return result;
}

uint64_t sub_213B17818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a3 && a4)
  {
    uint64_t v9 = *(int *)(a1 + 1120) + 1;
    uint64_t v10 = malloc_type_realloc(*(void **)(a1 + 1112), 8 * v9, 0x80040B8603338uLL);
    if (v10
      && (*(void *)(a1 + 1112) = v10,
          (uint64_t v11 = malloc_type_realloc(*(void **)(a1 + 1104), 24 * v9, 0x10500400D13D5BAuLL)) != 0))
    {
      uint64_t v12 = v11;
      uint64_t result = 0;
      *(void *)(a1 + 1104) = v12;
      uint64_t v13 = *(int *)(a1 + 1120);
      *(void *)(*(void *)(a1 + 1112) + 8 * v13) = a4;
      uint64_t v14 = *(void *)(a1 + 1104) + 24 * (int)v13;
      *(void *)uint64_t v14 = a2;
      *(_DWORD *)(v14 + 8) = v13;
      *(void *)(v14 + 16) = a3;
      *(_DWORD *)(a1 + 1120) = v13 + 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_213B178F4(uint64_t result, uint64_t a2, signed int a3, unsigned int a4)
{
  uint64_t v6 = result;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v14[0] = a3;
  v14[1] = 0;
  v13[0] = a4;
  v13[1] = 0;
  int v7 = *(unsigned __int8 *)(a2 + a3);
  if (v7 == 34)
  {
    if (a3 == a4)
    {
      sub_213B16ABC(v14, v12, 1024, "\"\"");
      return fprintf(*(FILE **)(v6 + 16), "%-15s->  is undefined\n");
    }
  }
  else
  {
    int v8 = *(_DWORD *)(result + 1120);
    if (v8 < 1) {
LABEL_8:
    }
      abort();
    unint64_t v9 = *(void *)(result + 1104);
    unint64_t v10 = v9 + 24 * v8;
    while (*(_DWORD *)(v9 + 8) != v7)
    {
      v9 += 24;
      if (v9 >= v10) {
        goto LABEL_8;
      }
    }
    sub_213B16ABC(v14, v12, 1024, "\"\"");
    if (a3 == a4)
    {
      return fprintf(*(FILE **)(v6 + 16), "%-15s->  %ls\n");
    }
    else
    {
      sub_213B16ABC(v13, v11, 1024, "\"\"");
      return fprintf(*(FILE **)(v6 + 16), "%-4s to %-7s->  %ls\n");
    }
  }
  return result;
}

uint64_t sub_213B17A54(EditLine *a1, const __int32 *a2)
{
  int v7 = 0;
  int v6 = 0;
  uint64_t v4 = tok_winit(0);
  tok_wstr(v4, a2, &v6, (const __int32 ***)&v7);
  int v6 = el_wparse(a1, v6, (const __int32 **)v7);
  tok_wend(v4);
  return v6;
}

int el_wparse(EditLine *a1, int a2, const __int32 **a3)
{
  if (a2 < 1)
  {
    LODWORD(v10) = -1;
    return (int)v10;
  }
  uint64_t v4 = *(void *)&a2;
  int v6 = wcschr((__int32 *)*a3, 58);
  int v7 = *a3;
  if (v6)
  {
    int v8 = v6;
    uint64_t v9 = (char *)v6 - (char *)v7;
    if (v6 == v7) {
      goto LABEL_12;
    }
    unint64_t v10 = (__int32 *)malloc_type_malloc((char *)v6 - (char *)v7, 0x100004052888210uLL);
    if (!v10) {
      return (int)v10;
    }
    uint64_t v11 = v10;
    size_t v12 = (v9 >> 2) - 1;
    wcsncpy(v10, *a3, v12);
    v11[v12] = 0;
    LODWORD(v12) = sub_213B1D754(*(__int32 **)a1, v11);
    free(v11);
    if (!v12)
    {
LABEL_12:
      LODWORD(v10) = 0;
      return (int)v10;
    }
    int v7 = v8 + 1;
  }
  uint64_t v13 = 0;
  uint64_t v14 = (const __int32 *)&unk_213B2737C;
  while (wcscmp(v14, v7))
  {
    uint64_t v14 = *(const __int32 **)((char *)&off_26C499830 + v13 + 16);
    v13 += 16;
    if (v13 == 112)
    {
      LODWORD(v10) = -1;
      return (int)v10;
    }
  }
  LODWORD(v10) = -(*(int (**)(EditLine *, uint64_t, const __int32 **))((char *)&off_26C499830 + v13 + 8))(a1, v4, a3);
  return (int)v10;
}

uint64_t sub_213B17BF0(__int32 **a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  uint64_t v3 = *a1 + 1;
  int v2 = *v3;
  if (!*v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = *v1;
  if (v5 == 94)
  {
    if (v2 == 63) {
      uint64_t v5 = 127;
    }
    else {
      uint64_t v5 = v2 & 0x9F;
    }
    goto LABEL_14;
  }
  if (v5 == 92)
  {
    if (v2 > 96)
    {
      switch(v2)
      {
        case 'n':
          uint64_t v5 = 10;
          break;
        case 'r':
          uint64_t v5 = 13;
          break;
        case 't':
          uint64_t v5 = 9;
          break;
        case 'v':
          uint64_t v5 = 11;
          break;
        default:
          uint64_t v5 = (*a1)[1];
          break;
      }
      goto LABEL_14;
    }
    if ((v2 - 48) >= 8)
    {
      uint64_t v5 = (*a1)[1];
      if (v2 != 85) {
        goto LABEL_14;
      }
      int v13 = 0;
      v12[0] = xmmword_213B27338;
      v12[1] = unk_213B27348;
      v12[2] = xmmword_213B27358;
      v12[3] = unk_213B27368;
      if (v1[2] == 43)
      {
        LODWORD(v5) = 0;
        uint64_t v3 = v1 + 3;
        int v9 = 5;
        while (1)
        {
          unint64_t v10 = wcschr((__int32 *)v12, *v3);
          if (v9 != 1 && !v10) {
            break;
          }
          v3 += v10 != 0;
          if (v10) {
            uint64_t v5 = ((unint64_t)((char *)v10 - (char *)v12) >> 2) | (16 * v5);
          }
          else {
            uint64_t v5 = v5;
          }
          if (!--v9)
          {
            if ((int)v5 < 1114112) {
              goto LABEL_14;
            }
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
    else
    {
      uint64_t v5 = 0;
      int v6 = (unsigned int *)(v1 + 4);
      uint64_t v7 = 1;
      while (1)
      {
        unsigned int v8 = v1[v7];
        if (v8 - 56 < 0xFFFFFFF8) {
          break;
        }
        uint64_t v5 = (v8 - 48) | (8 * v5);
        if ((++v7 * 4) == 16) {
          goto LABEL_18;
        }
      }
      int v6 = (unsigned int *)&v1[v7];
LABEL_18:
      if (v5 < 0x100)
      {
        uint64_t v3 = (__int32 *)(v6 - 1);
        goto LABEL_14;
      }
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *a1;
LABEL_14:
  *a1 = v3 + 1;
  return v5;
}

__int32 *sub_213B17E64(__int32 *a1, __int32 *a2)
{
  int v2 = a1;
  uint64_t v7 = a2;
  for (uint64_t i = a1; ; ++i)
  {
    __int32 v4 = *a2;
    if (*a2 <= 91) {
      break;
    }
    if (v4 != 92 && v4 != 94) {
      goto LABEL_12;
    }
    __int32 v5 = sub_213B17BF0(&v7);
    if (v5 == -1) {
      return 0;
    }
    __int32 *i = v5;
    a2 = v7;
LABEL_13:
    ;
  }
  if (v4 == 77)
  {
    if (a2[1] == 45 && a2[2])
    {
      __int32 *i = 27;
      uint64_t v7 = a2 + 2;
      a2 += 2;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v4)
  {
LABEL_12:
    uint64_t v7 = ++a2;
    __int32 *i = v4;
    goto LABEL_13;
  }
  __int32 *i = 0;
  return v2;
}

uint64_t sub_213B17F30(uint64_t a1, __int32 *a2)
{
  if (!*(_DWORD *)(a1 + 1120)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = 0;
  for (uint64_t i = (const __int32 **)(*(void *)(a1 + 1104) + 8); wcscmp(*(i - 1), a2); i += 3)
  {
    if (++v4 >= (unint64_t)*(int *)(a1 + 1120)) {
      return 0xFFFFFFFFLL;
    }
  }
  return *(unsigned int *)i;
}

double sub_213B17FA0(uint64_t a1, int a2)
{
  uint64_t v3 = 888;
  if (a2)
  {
    uint64_t v4 = a1 + 888;
  }
  else
  {
    uint64_t v3 = 864;
    uint64_t v4 = a1 + 864;
  }
  int v5 = *(_DWORD *)(v4 + 20);
  int v6 = (__int32 *)(*(uint64_t (**)(void))(a1 + v3))();
  if (!v5) {
    int v6 = sub_213B238D0(v6, a1 + 1264);
  }
  unsigned __int32 v7 = *v6;
  if (*v6)
  {
    BOOL v8 = 0;
    int v9 = (unsigned __int32 *)(v6 + 1);
    do
    {
      if (*(_DWORD *)(v4 + 16) == v7)
      {
        BOOL v8 = !v8;
      }
      else if (v8)
      {
        sub_213B1F0BC(a1, v7);
        BOOL v8 = 1;
      }
      else
      {
        sub_213B1C2DC(a1, v7, 1);
        BOOL v8 = 0;
      }
      unsigned __int32 v10 = *v9++;
      unsigned __int32 v7 = v10;
    }
    while (v10);
  }
  double result = *(double *)(a1 + 848);
  *(double *)(v4 + 8) = result;
  return result;
}

uint64_t sub_213B18054(uint64_t a1)
{
  *(void *)(a1 + 864) = sub_213B18090;
  *(void *)(a1 + 872) = 0;
  *(_DWORD *)(a1 + 880) = 0;
  *(void *)(a1 + 888) = sub_213B1809C;
  *(void *)(a1 + 896) = 0;
  *(_DWORD *)(a1 + 904) = 0;
  return 0;
}

char *sub_213B18090()
{
  return asc_2677F42A0;
}

void *sub_213B1809C()
{
  return &unk_2677F4388;
}

uint64_t sub_213B180AC(uint64_t a1, void *a2, int a3, int a4, int a5)
{
  if (a4 != 21 && a4) {
    uint64_t v5 = a1 + 888;
  }
  else {
    uint64_t v5 = a1 + 864;
  }
  if (a4) {
    BOOL v6 = a4 == 21;
  }
  else {
    BOOL v6 = 1;
  }
  unsigned __int32 v7 = sub_213B1809C;
  if (v6) {
    unsigned __int32 v7 = sub_213B18090;
  }
  if (a2) {
    unsigned __int32 v7 = a2;
  }
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = 0;
  *(_DWORD *)(v5 + 16) = a3;
  *(_DWORD *)(v5 + 20) = a5;
  return 0;
}

uint64_t sub_213B18104(uint64_t a1, void *a2, _DWORD *a3, int a4)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = a1 + 864;
  uint64_t v5 = 888;
  if (a4) {
    uint64_t v4 = a1 + 888;
  }
  else {
    uint64_t v5 = 864;
  }
  *a2 = *(void *)(a1 + v5);
  uint64_t result = 0;
  if (a3) {
    *a3 = *(_DWORD *)(v4 + 16);
  }
  return result;
}

uint64_t sub_213B18148(uint64_t a1)
{
  *(void *)(a1 + 1256) = sub_213B18160;
  return 0;
}

uint64_t sub_213B18160(uint64_t a1, __int32 *a2)
{
  int v4 = 0;
  unint64_t v5 = 0;
  int v6 = 0;
  while (1)
  {
LABEL_2:
    *(_DWORD *)(*(void *)(a1 + 1248) + 116) = 0;
    while (1)
    {
      ssize_t v7 = read(*(_DWORD *)(a1 + 32), &v17[v5], 1uLL);
      if (v7 != -1) {
        break;
      }
      int v8 = *__error();
      int v9 = *(_DWORD *)(*(void *)(a1 + 1248) + 116);
      if (v9 == 28) {
        goto LABEL_19;
      }
      if (v9 == 19)
      {
        el_wset((EditLine *)a1, 20);
LABEL_19:
        sub_213B1E33C(a1);
        goto LABEL_2;
      }
      if (v4)
      {
LABEL_32:
        *__error() = v8;
LABEL_33:
        *a2 = 0;
        return 0xFFFFFFFFLL;
      }
      int v10 = *(_DWORD *)(a1 + 32);
      if (v8 == 35)
      {
LABEL_10:
        int v11 = fcntl(v10, 3, 0);
        if (v11 == -1) {
          goto LABEL_32;
        }
        int v4 = 1;
        if (fcntl(v10, 4, v11 & 0xFFFFFFFB) == -1) {
          goto LABEL_32;
        }
      }
      else
      {
        int v4 = 1;
        if (v8 != 4)
        {
          if (v8 != -1) {
            goto LABEL_32;
          }
          goto LABEL_10;
        }
      }
    }
    ssize_t v12 = v7;
    if (!v7) {
      return v12;
    }
    __int32 v13 = v17[0];
    if ((*(unsigned char *)(a1 + 44) & 0x10) == 0)
    {
      if (v17[0] < 0 && !v5)
      {
        int v14 = mbtowc(a2, v17, 1uLL);
        if (v14 == 1) {
          return v12;
        }
        int v6 = v14;
        __int32 v13 = v17[0];
      }
      *a2 = v13;
      goto LABEL_26;
    }
    if ((v17[0] & 0x80) == 0 || v17[0] - 245 >= 0xFFFFFFCD)
    {
      int v6 = mbtowc(a2, v17, v5 + 1);
      if (v6 == -1)
      {
        mbtowc(0, 0, 0);
        if (v5++ < 5) {
          continue;
        }
        *__error() = 92;
        goto LABEL_33;
      }
LABEL_26:
      if ((*(unsigned char *)(a1 + 44) & 0x20) == 0) {
        return v12;
      }
      unint64_t v5 = 0;
      if (v6 <= 1) {
        return v12;
      }
    }
  }
}

uint64_t sub_213B18348(uint64_t a1, uint64_t (*a2)(uint64_t a1, __int32 *a2))
{
  if (a2) {
    int v2 = a2;
  }
  else {
    int v2 = sub_213B18160;
  }
  *(void *)(a1 + 1256) = v2;
  return 0;
}

uint64_t sub_213B18368(uint64_t a1)
{
  if (*(uint64_t (**)(uint64_t, __int32 *))(a1 + 1256) == sub_213B18160) {
    return 0;
  }
  else {
    return *(void *)(a1 + 1256);
  }
}

void el_wpush(EditLine *a1, const __int32 *a2)
{
  if (a2)
  {
    int v3 = *((_DWORD *)a1 + 254);
    if (v3 <= 8)
    {
      *((_DWORD *)a1 + 254) = v3 + 1;
      int v4 = sub_213B24874(a2);
      uint64_t v5 = *((int *)a1 + 254);
      *(void *)(*((void *)a1 + 128) + 8 * v5) = v4;
      if (v4) {
        return;
      }
      *((_DWORD *)a1 + 254) = v5 - 1;
    }
  }
  el_beep_0(a1);

  sub_213B20308((uint64_t)a1);
}

int el_wgetc(EditLine *a1, __int32 *a2)
{
  sub_213B20308((uint64_t)a1);
  if ((*((_DWORD *)a1 + 254) & 0x80000000) != 0)
  {
LABEL_4:
    if ((sub_213B21970((uint64_t)a1) & 0x80000000) != 0)
    {
      return 0;
    }
    else
    {
      int v6 = (*((uint64_t (**)(EditLine *, __int32 *))a1 + 157))(a1, a2);
      if (v6 < 0) {
        *((_DWORD *)a1 + 12) = *__error();
      }
      if ((*((unsigned char *)a1 + 44) & 0x80) != 0) {
        *a2 = *(char *)a2;
      }
    }
  }
  else
  {
    while (1)
    {
      uint64_t v4 = **((void **)a1 + 128);
      uint64_t v5 = *((int *)a1 + 255);
      if (*(_DWORD *)(v4 + 4 * v5)) {
        break;
      }
      sub_213B184DC((void ***)a1 + 127);
      if ((*((_DWORD *)a1 + 254) & 0x80000000) != 0) {
        goto LABEL_4;
      }
    }
    *((_DWORD *)a1 + 255) = v5 + 1;
    *a2 = *(_DWORD *)(v4 + 4 * v5);
    if (!*(_DWORD *)(v4 + 4 * *((int *)a1 + 255))) {
      sub_213B184DC((void ***)a1 + 127);
    }
    return 1;
  }
  return v6;
}

void sub_213B184DC(void ***a1)
{
  free(*a1[1]);
  uint64_t v2 = *(unsigned int *)a1;
  if ((int)v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
      a1[1][i] = a1[1][i + 1];
  }
  *a1 = (void **)(v2 - 1);
}

uint64_t sub_213B18540(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 44);
  if (v2)
  {
    uint64_t result = sub_213B1E33C(result);
    int v2 = *(_DWORD *)(v1 + 44);
  }
  if ((v2 & 2) == 0)
  {
    if ((v2 & 0xC) == 8) {
      sub_213B21970(v1);
    }
    el_resize((EditLine *)v1);
    sub_213B1D104(v1);
    sub_213B11348(v1, 0);
    uint64_t result = sub_213B1C450(v1);
    if ((*(unsigned char *)(v1 + 44) & 8) != 0)
    {
      return sub_213B20308(v1);
    }
  }
  return result;
}

uint64_t sub_213B185D8(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 44);
  if ((v2 & 8) == 0)
  {
    uint64_t result = sub_213B21E68(result);
    int v2 = *(_DWORD *)(v1 + 44);
  }
  if (v2)
  {
    return sub_213B1E52C(v1);
  }
  return result;
}

const __int32 *__cdecl el_wgets(EditLine *a1, int *a2)
{
  if (a2) {
    *a2 = 0;
  }
  __int32 v34 = 0;
  int v4 = *((_DWORD *)a1 + 11);
  if ((v4 & 2) != 0)
  {
    uint64_t v17 = (int *)*((void *)a1 + 11);
    while (1)
    {
      int v18 = (*((uint64_t (**)(EditLine *, int *))a1 + 157))(a1, v17);
      if (v18 != 1) {
        goto LABEL_80;
      }
      if ((unint64_t)(v17 + 1) >= *((void *)a1 + 14))
      {
        uint64_t v20 = *((void *)a1 + 11);
        if (!sub_213B10908((uint64_t)a1, 2uLL)) {
          goto LABEL_79;
        }
        int v19 = (int *)((char *)v17 + *((void *)a1 + 11) - v20);
      }
      else
      {
        int v19 = v17;
      }
      uint64_t v17 = v19 + 1;
      if ((*((unsigned char *)a1 + 44) & 8) == 0)
      {
        int v21 = *v19;
        BOOL v22 = v21 == 10 || v21 == 13;
        if (!v22) {
          continue;
        }
      }
LABEL_79:
      LODWORD(v15) = 1;
      goto LABEL_95;
    }
  }
  if ((v4 & 8) == 0)
  {
    sub_213B18540((uint64_t)a1);
    int v4 = *((_DWORD *)a1 + 11);
  }
  if ((v4 & 4) != 0)
  {
    BOOL v22 = (v4 & 8) == 0;
    uint64_t v23 = 104;
    if (v22) {
      uint64_t v23 = 88;
    }
    uint64_t v17 = *(int **)((char *)a1 + v23);
    sub_213B20308((uint64_t)a1);
    while (1)
    {
      int v18 = (*((uint64_t (**)(EditLine *, int *))a1 + 157))(a1, v17);
      if (v18 != 1) {
        break;
      }
      if ((unint64_t)(v17 + 1) >= *((void *)a1 + 14))
      {
        uint64_t v25 = *((void *)a1 + 11);
        if (!sub_213B10908((uint64_t)a1, 2uLL)) {
          goto LABEL_79;
        }
        int v24 = (int *)((char *)v17 + *((void *)a1 + 11) - v25);
      }
      else
      {
        int v24 = v17;
      }
      uint64_t v17 = v24 + 1;
      if ((*((_DWORD *)a1 + 11) & 8) == 0)
      {
        int v26 = *v24;
        if (v26 != 10 && v26 != 13) {
          continue;
        }
      }
      goto LABEL_79;
    }
LABEL_80:
    LODWORD(v15) = v18;
    if (v18 == -1)
    {
      if (*__error() == 4) {
        uint64_t v17 = (int *)*((void *)a1 + 11);
      }
      *((_DWORD *)a1 + 12) = *__error();
      LODWORD(v15) = -1;
    }
    else if (!v18)
    {
      *((unsigned char *)a1 + 137) = -1;
    }
LABEL_95:
    *((void *)a1 + 12) = v17;
    *((void *)a1 + 13) = v17;
    *uint64_t v17 = 0;
    unint64_t v28 = ((unint64_t)v17 - *((void *)a1 + 11)) >> 2;
LABEL_96:
    LODWORD(v29) = v28;
    if (!a2) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
  uint64_t v5 = MEMORY[0x263EF8318];
  while (2)
  {
    while (2)
    {
      while (2)
      {
        *((_DWORD *)a1 + 12) = 0;
        do
        {
          int v6 = el_wgetc(a1, &v34);
          if (v6 != 1)
          {
            if (v6) {
              int v6 = *__error();
            }
            LODWORD(v15) = 0;
            *((_DWORD *)a1 + 12) = v6;
            *((unsigned char *)a1 + 137) = -1;
            goto LABEL_86;
          }
          if (*((_DWORD *)a1 + 33))
          {
            *((_DWORD *)a1 + 33) = 0;
            __int32 v7 = v34 | 0x80;
            v34 |= 0x80u;
          }
          else
          {
            __int32 v7 = v34;
          }
          if (v7 <= 255)
          {
            unsigned int v8 = *(unsigned __int8 *)(*((void *)a1 + 133) + v7);
            if (v8 == 24)
            {
              char v35 = 0;
              int v9 = sub_213B16390(a1, &v34, &v35);
              if (v9 == 1)
              {
                el_wpush(a1, v35);
                unsigned int v8 = 24;
              }
              else
              {
                if (v9) {
                  abort();
                }
                unsigned int v8 = v35;
              }
            }
          }
          else
          {
            unsigned int v8 = 8;
          }
          if (!*((void *)a1 + 131)) {
            *((void *)a1 + 133) = *((void *)a1 + 132);
          }
        }
        while (v8 == 24);
        if (*((_DWORD *)a1 + 12) == 4)
        {
          size_t v33 = (_DWORD *)*((void *)a1 + 11);
          _DWORD *v33 = 0;
          *((void *)a1 + 12) = v33;
          *((void *)a1 + 13) = v33;
          LODWORD(v15) = -1;
          goto LABEL_86;
        }
        if (*((_DWORD *)a1 + 280) <= v8) {
          continue;
        }
        break;
      }
      *((unsigned char *)a1 + 137) = v8;
      __int32 v10 = v34;
      *((_DWORD *)a1 + 35) = v34;
      if (*((_DWORD *)a1 + 274) == 1 && *((void *)a1 + 133) == *((void *)a1 + 132))
      {
        int v11 = (__int32 *)*((void *)a1 + 121);
        if ((unint64_t)v11 < *((void *)a1 + 122))
        {
          if (v8 == 64 && v11 != *((__int32 **)a1 + 120))
          {
            uint64_t v12 = *(v11 - 1);
            if (v12 > 0x7F) {
              int v13 = __maskrune(v12, 0x40000uLL);
            }
            else {
              int v13 = *(_DWORD *)(v5 + 4 * v12 + 60) & 0x40000;
            }
            if (v13)
            {
              *((void *)a1 + 121) -= 4;
              goto LABEL_37;
            }
            __int32 v10 = v34;
            int v11 = (__int32 *)*((void *)a1 + 121);
          }
          *int v11 = v10;
          *((void *)a1 + 121) = v11 + 1;
        }
      }
LABEL_37:
      int v14 = (*(uint64_t (**)(EditLine *, void))(*((void *)a1 + 139) + 8 * v8))(a1, v34);
      *((unsigned char *)a1 + 136) = v8;
      LODWORD(v15) = -1;
      switch(v14)
      {
        case 0:
          goto LABEL_48;
        case 1:
          uint64_t v15 = (*((void *)a1 + 13) - *((void *)a1 + 11)) >> 2;
          goto LABEL_48;
        case 2:
          if ((*((unsigned char *)a1 + 44) & 8) != 0)
          {
            signed int v16 = (_DWORD *)*((void *)a1 + 13);
            *v16++ = 4;
            *((void *)a1 + 12) = v16;
            *((void *)a1 + 13) = v16;
            LODWORD(v15) = 1;
          }
          else
          {
            LODWORD(v15) = 0;
          }
          goto LABEL_48;
        case 3:
          continue;
        case 4:
          goto LABEL_45;
        case 5:
          sub_213B1D13C((uint64_t)a1);
          goto LABEL_47;
        case 7:
          sub_213B1D104((uint64_t)a1);
          sub_213B11348((uint64_t)a1, 1);
          goto LABEL_45;
        case 8:
          sub_213B1D5A4((uint64_t)a1);
          sub_213B1D104((uint64_t)a1);
LABEL_45:
          sub_213B1C450((uint64_t)a1);
          break;
        case 9:
          sub_213B1C450((uint64_t)a1);
          el_beep_0(a1);
          break;
        default:
          el_beep_0(a1);
          sub_213B20308((uint64_t)a1);
          break;
      }
      break;
    }
LABEL_47:
    LODWORD(v15) = -1;
LABEL_48:
    *(void *)((char *)a1 + 124) = 0x100000000;
    *((_DWORD *)a1 + 250) = 0;
    if ((*((unsigned char *)a1 + 44) & 8) == 0 && v15 == -1) {
      continue;
    }
    break;
  }
LABEL_86:
  sub_213B20308((uint64_t)a1);
  if ((*((unsigned char *)a1 + 44) & 8) == 0)
  {
    sub_213B185D8((uint64_t)a1);
    if (v15 == -1) {
      LODWORD(v28) = 0;
    }
    else {
      LODWORD(v28) = v15;
    }
    goto LABEL_96;
  }
  uint64_t v29 = (*((void *)a1 + 13) - *((void *)a1 + 11)) >> 2;
  LODWORD(v28) = v29;
  if (a2)
  {
LABEL_97:
    *a2 = v28;
    LODWORD(v29) = v28;
  }
LABEL_98:
  if (v29)
  {
    uint64_t result = (const __int32 *)*((void *)a1 + 11);
    result[(int)v29] = 0;
  }
  else if (v15 == -1)
  {
    if (a2) {
      *a2 = -1;
    }
    int v31 = *((_DWORD *)a1 + 12);
    int v32 = __error();
    uint64_t result = 0;
    *int v32 = v31;
  }
  else
  {
    return 0;
  }
  return result;
}

void rl_prep_terminal(int a1)
{
}

void rl_deprep_terminal(void)
{
}

int rl_set_prompt(const char *a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = "";
  }
  int v2 = rl_prompt;
  if (rl_prompt)
  {
    LODWORD(i) = strcmp(rl_prompt, v1);
    if (!i) {
      return (int)i;
    }
    free(v2);
  }
  int v4 = strdup(v1);
  rl_prompt = v4;
  if (v4)
  {
    for (uint64_t i = strchr(v4, 2); i; uint64_t i = strchr(rl_prompt, 2))
      char *i = 1;
  }
  else
  {
    LODWORD(i) = -1;
  }
  return (int)i;
}

int rl_initialize(void)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (qword_2677F4398) {
    el_end((EditLine *)qword_2677F4398);
  }
  if (qword_2677F43A0) {
    history_end((History *)qword_2677F43A0);
  }
  uint64_t v0 = rl_instream;
  if (!rl_instream)
  {
    uint64_t v0 = (FILE *)*MEMORY[0x263EF8350];
    rl_instream = (FILE *)*MEMORY[0x263EF8350];
  }
  if (!rl_outstream) {
    rl_outstream = (FILE *)*MEMORY[0x263EF8358];
  }
  *(void *)&v9.num = 0;
  v9.str = 0;
  memset(&v10, 0, sizeof(v10));
  int v1 = fileno(v0);
  int v2 = tcgetattr(v1, &v10);
  char c_lflag = v10.c_lflag;
  int v4 = el_init(rl_readline_name, rl_instream, rl_outstream, (FILE *)*MEMORY[0x263EF8348]);
  qword_2677F4398 = (uint64_t)v4;
  if (v2 != -1 && (c_lflag & 8) == 0) {
    el_set(v4, 11, 0);
  }
  uint64_t v5 = history_init();
  qword_2677F43A0 = (uint64_t)v5;
  int result = -1;
  if (qword_2677F4398 && v5)
  {
    history(v5, &v9, 1, 0x7FFFFFFFLL);
    history_length = 0;
    max_input_history = 0x7FFFFFFF;
    el_set((EditLine *)qword_2677F4398, 10, history, qword_2677F43A0);
    el_set((EditLine *)qword_2677F4398, 23, sub_213B18FE8, &rl_line_buffer);
    if (rl_getc_function) {
      el_set((EditLine *)qword_2677F4398, 13, sub_213B19014);
    }
    if (rl_set_prompt("") == -1)
    {
      history_end((History *)qword_2677F43A0);
      el_end((EditLine *)qword_2677F4398);
      return -1;
    }
    else
    {
      el_set((EditLine *)qword_2677F4398, 21, sub_213B1905C, 1);
      el_set((EditLine *)qword_2677F4398, 3, dword_2677F4300);
      el_set((EditLine *)qword_2677F4398, 2, "emacs");
      if (rl_terminal_name) {
        el_set((EditLine *)qword_2677F4398, 1, rl_terminal_name);
      }
      else {
        el_get((EditLine *)qword_2677F4398, 1, &rl_terminal_name);
      }
      el_set((EditLine *)qword_2677F4398, 9, "rl_complete", "ReadLine compatible completion function", sub_213B19074);
      el_set((EditLine *)qword_2677F4398, 4, "^I", "rl_complete", 0);
      el_set((EditLine *)qword_2677F4398, 9, "rl_tstp", "ReadLine compatible suspend function", sub_213B19090);
      el_set((EditLine *)qword_2677F4398, 4, "^Z", "rl_tstp", 0);
      el_set((EditLine *)qword_2677F4398, 4, "^W", "ed-delete-prev-word", 0);
      el_source((EditLine *)qword_2677F4398, 0);
      rl_line_int buffer = (char *)el_line((EditLine *)qword_2677F4398)->buffer;
      __int32 v7 = el_line((EditLine *)qword_2677F4398);
      int buffer = (int)v7->buffer;
      rl_point = LODWORD(v7->cursor) - LODWORD(v7->buffer);
      rl_end = LODWORD(v7->lastchar) - buffer;
      if (rl_startup_hook) {
        rl_startup_hook(0, 0);
      }
      return 0;
    }
  }
  return result;
}

const LineInfo *sub_213B18FE8(EditLine *a1, const char **a2)
{
  int result = el_line(a1);
  *a2 = result->buffer;
  return result;
}

uint64_t sub_213B19014(uint64_t a1, unsigned char *a2)
{
  int v3 = rl_getc_function(0);
  if (v3 == -1) {
    return 0;
  }
  *a2 = v3;
  return 1;
}

char *sub_213B1905C()
{
  rl_already_prompted = 1;
  return rl_prompt;
}

uint64_t sub_213B19074(int a1, int a2)
{
  return rl_complete(a1, a2);
}

uint64_t sub_213B19090()
{
  return 0;
}

char *__cdecl readline(const char *a1)
{
  *(void *)&v10.num = 0;
  v10.str = 0;
  HistEvent v9 = (char *)a1;
  int v8 = 0;
  if (qword_2677F4398) {
    BOOL v1 = qword_2677F43A0 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    rl_initialize();
  }
  dword_2677F5168 = 0;
  setjmp(dword_2677F43AC);
  if (rl_set_prompt(v9) == -1) {
    return 0;
  }
  if (rl_pre_input_hook) {
    rl_pre_input_hook(0, 0);
  }
  int v2 = (EditLine *)qword_2677F4398;
  if (!off_2677F5170
    || (*(unsigned char *)(qword_2677F4398 + 44) & 2) == 0
    && (el_set((EditLine *)qword_2677F4398, 13, sub_213B1924C),
        byte_2677F43A8 = 1,
        int v2 = (EditLine *)qword_2677F4398,
        !off_2677F5170))
  {
    if (byte_2677F43A8)
    {
      el_set(v2, 13, 0);
      byte_2677F43A8 = 0;
      int v2 = (EditLine *)qword_2677F4398;
    }
  }
  rl_already_prompted = 0;
  int v4 = el_gets(v2, &v8);
  uint64_t v5 = 0;
  if (v4)
  {
    uint64_t v6 = (v8 - 1);
    if (v8 >= 1)
    {
      int result = strdup(v4);
      if (!result) {
        return result;
      }
      if (result[v6] == 10) {
        result[v6] = 0;
      }
      uint64_t v5 = result;
    }
  }
  __int32 v7 = v5;
  history((History *)qword_2677F43A0, &v10, 2);
  history_length = v10.num;
  return v7;
}

uint64_t sub_213B1924C(uint64_t a1, unsigned char *a2)
{
  int v8 = 0;
  *a2 = 0;
  int v3 = (void (*)(void))off_2677F5170;
  if (off_2677F5170)
  {
    while (1)
    {
      while (1)
      {
        v3();
        if (ioctl(*(_DWORD *)(a1 + 32), 0x4004667FuLL, &v8) < 0) {
          return 0xFFFFFFFFLL;
        }
        if (v8) {
          break;
        }
        ssize_t v5 = 0;
LABEL_9:
        int v3 = (void (*)(void))off_2677F5170;
        if (v5 || !off_2677F5170)
        {
LABEL_11:
          if (v3) {
            return v5;
          }
          goto LABEL_14;
        }
      }
      ssize_t v5 = read(*(_DWORD *)(a1 + 32), a2, 1uLL);
      if ((v5 & 0x8000000000000000) == 0) {
        goto LABEL_9;
      }
      uint64_t v6 = __error();
      int v3 = (void (*)(void))off_2677F5170;
      if (*v6 != 35) {
        goto LABEL_11;
      }
      if (!off_2677F5170) {
        goto LABEL_14;
      }
    }
  }
  ssize_t v5 = 0;
LABEL_14:
  el_set((EditLine *)a1, 13, 0);
  return v5;
}

void using_history(void)
{
  if (qword_2677F43A0) {
    BOOL v0 = qword_2677F4398 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0) {
    rl_initialize();
  }
}

const char *__cdecl get_history_event(const char *a1, int *a2, int a3)
{
  uint64_t v3 = *a2;
  int v4 = a1[v3];
  if (v4 != asc_2677F42CC[0]) {
    return 0;
  }
  *(void *)&v36.uint64_t num = 0;
  v36.str = 0;
  int v7 = a1[v3 + 1];
  if (v7 != v4 && v7 != 0)
  {
    if (v7 == 45) {
      int v11 = v3 + 2;
    }
    else {
      int v11 = v3 + 1;
    }
    int v12 = a1[v11];
    if ((v12 - 48) > 9)
    {
      size_t v18 = 0;
      if (v12 == 63) {
        int v19 = v11 + 1;
      }
      else {
        int v19 = v11;
      }
      uint64_t v20 = v19;
      int v21 = &a1[v19];
      while (1)
      {
        int v22 = v21[v18];
        unsigned int v23 = (char)v22;
        if (!v21[v18] || v22 == 10) {
          break;
        }
        if (v12 == 63 && (char)v22 == 63)
        {
          int v29 = v11 + 1 + v18;
          goto LABEL_51;
        }
        if (v12 != 63)
        {
          uint64_t v25 = (1 << v22) & 0x400000100000200;
          BOOL v26 = v23 > 0x3A || v25 == 0;
          if (!v26 || v23 == a3)
          {
            int v29 = v11 + v18;
            v18 += v19 - (uint64_t)v11;
            uint64_t v20 = v11;
            goto LABEL_48;
          }
        }
        ++v18;
      }
      if (v12 == 63) {
        int v28 = v11 + 1;
      }
      else {
        int v28 = v11;
      }
      int v29 = v28 + v18;
      if (v12 != 63)
      {
LABEL_48:
        int v30 = v29;
        if (v11 == v29) {
          return 0;
        }
        goto LABEL_59;
      }
LABEL_51:
      if ((char)v22 == 63) {
        int v30 = v29 + 1;
      }
      else {
        int v30 = v29;
      }
      if (v19 == v29)
      {
        int v31 = (char *)qword_2677F4470;
        if (qword_2677F4470)
        {
          if (*(unsigned char *)qword_2677F4470)
          {
            int v29 = v19;
            goto LABEL_61;
          }
        }
      }
      if (v19 == v29) {
        return 0;
      }
LABEL_59:
      int v32 = (char *)malloc_type_malloc(v18 + 1, 0x100004077774924uLL);
      if (!v32) {
        return 0;
      }
      int v31 = v32;
      strncpy(v32, &a1[v20], v18)[v18] = 0;
LABEL_61:
      if (!history((History *)qword_2677F43A0, &v36, 8))
      {
        uint64_t num = v36.num;
        if (v12 == 63)
        {
          if (v31 != (char *)qword_2677F4470)
          {
            if (qword_2677F4470) {
              free((void *)qword_2677F4470);
            }
            qword_2677F4470 = (uint64_t)v31;
          }
          int v34 = history_search(v31, -1);
        }
        else
        {
          *(void *)&v37.uint64_t num = 0;
          v37.str = 0;
          int v34 = history((History *)qword_2677F43A0, &v37, 14, v31);
        }
        if (v34 != -1)
        {
          if (v12 == 63 && v29 != v19)
          {
            if (qword_2677F4478 && (char *)qword_2677F4478 != v31) {
              free((void *)qword_2677F4478);
            }
            qword_2677F4478 = (uint64_t)v31;
          }
          if (v31 != (char *)qword_2677F4470) {
            free(v31);
          }
          if (!history((History *)qword_2677F43A0, &v36, 8))
          {
            *a2 = v30;
            str = v36.str;
            history((History *)qword_2677F43A0, &v36, 7, num);
            return str;
          }
          return 0;
        }
        history((History *)qword_2677F43A0, &v36, 3);
        fprintf(rl_outstream, "%s: Event not found\n", v31);
      }
      if (v31 != (char *)qword_2677F4470) {
        free(v31);
      }
    }
    else
    {
      int v13 = 0;
      int v14 = &a1[v11 + 1];
      do
      {
        int v13 = v12 + 10 * v13 - 48;
        int v15 = *(unsigned __int8 *)v14++;
        int v12 = v15;
        ++v11;
      }
      while ((v15 - 48) < 0xA);
      if (v7 == 45) {
        int v16 = history_length - v13 + 1;
      }
      else {
        int v16 = v13;
      }
      uint64_t v17 = history_get(v16);
      if (v17)
      {
        *a2 = v11;
        return v17->line;
      }
    }
    return 0;
  }
  if (history((History *)qword_2677F43A0, &v36, 3)) {
    return 0;
  }
  if (a1[v3 + 1]) {
    int v9 = v3 + 2;
  }
  else {
    int v9 = v3 + 1;
  }
  *a2 = v9;
  return v36.str;
}

HIST_ENTRY *__cdecl history_get(int a1)
{
  if (qword_2677F43A0) {
    BOOL v2 = qword_2677F4398 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    rl_initialize();
  }
  if (history_base <= a1)
  {
    *(void *)&v6.uint64_t num = 0;
    v6.str = 0;
    uint64_t v3 = 0;
    if (history((History *)qword_2677F43A0, &v6, 8)) {
      return v3;
    }
    uint64_t num = v6.num;
    if (!history((History *)qword_2677F43A0, &v6, 4)
      && !history((History *)qword_2677F43A0, &v6, 23, (a1 - history_base), &unk_2677F4488))
    {
      uint64_t v3 = (HIST_ENTRY *)&qword_2677F4480;
      qword_2677F4480 = (uint64_t)v6.str;
      history((History *)qword_2677F43A0, &v6, 7, num);
      return v3;
    }
  }
  return 0;
}

int history_search(const char *a1, int a2)
{
  *(void *)&v9.uint64_t num = 0;
  v9.int str = 0;
  if (history((History *)qword_2677F43A0, &v9, 8)) {
    return -1;
  }
  uint64_t num = v9.num;
  if (a2 >= 0) {
    int v5 = 5;
  }
  else {
    int v5 = 6;
  }
  while (1)
  {
    int str = (int)v9.str;
    int v7 = strstr((char *)v9.str, a1);
    if (v7) {
      break;
    }
    if (history((History *)qword_2677F43A0, &v9, v5))
    {
      history((History *)qword_2677F43A0, &v9, 7, num);
      return -1;
    }
  }
  return v7 - str;
}

int history_search_prefix(const char *a1, int a2)
{
  *(void *)&v3.uint64_t num = 0;
  v3.int str = 0;
  if (a2 >= 0) {
    return history((History *)qword_2677F43A0, &v3, 13, a1);
  }
  else {
    return history((History *)qword_2677F43A0, &v3, 14, a1);
  }
}

int history_expand(char *a1, char **a2)
{
  if (qword_2677F43A0) {
    BOOL v4 = qword_2677F4398 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    rl_initialize();
  }
  if (!asc_2677F42CC[0])
  {
    LODWORD(v8) = 0;
    *a2 = strdup(a1);
    return (int)v8;
  }
  *a2 = 0;
  if (*a1 == asc_2677F42CC[1])
  {
    size_t v5 = strlen(a1);
    HistEvent v6 = (char *)malloc_type_malloc(v5 + 5, 0x100004077774924uLL);
    *a2 = v6;
    if (v6)
    {
      char v7 = asc_2677F42CC[0];
      v6[1] = asc_2677F42CC[0];
      **a2 = v7;
      (*a2)[2] = 58;
      (*a2)[3] = 115;
      strcpy(*a2 + 4, a1);
      a1 = *a2;
      goto LABEL_13;
    }
LABEL_237:
    LODWORD(v8) = 0;
    return (int)v8;
  }
  HistEvent v9 = strdup(a1);
  *a2 = v9;
  if (!v9) {
    goto LABEL_237;
  }
LABEL_13:
  if (!*a1)
  {
    v103 = 0;
    LODWORD(v8) = 0;
    goto LABEL_234;
  }
  v106 = (void **)a2;
  size_t v112 = 0;
  ptr = 0;
  size_t v10 = 0;
  size_t v11 = 0;
  int v12 = a1;
  while (2)
  {
    int v13 = 0;
    char v14 = 0;
    size_t v15 = v10;
    __src = v12;
    size_t v118 = v10;
    char v16 = 1;
    for (size_t i = v10; ; size_t i = v10)
    {
      while (1)
      {
        size_t v10 = v15;
        int v12 = &a1[v15];
        uint64_t v18 = a1[v15];
        int v19 = (char)v18;
        if (v18 != 92) {
          break;
        }
        ++v15;
        int v22 = &a1[v10 + 1];
        if (*(unsigned __int8 *)v22 == asc_2677F42CC[0])
        {
          strcpy(v12, v22);
        }
        else
        {
          if (v14) {
            goto LABEL_24;
          }
          LOBYTE(v19) = 92;
LABEL_31:
          if (asc_2677F42CC[0] == v19)
          {
            size_t v15 = v10 + 1;
            if (!strchr((char *)qword_2677F42D8, a1[v10 + 1]))
            {
              if (!off_2677F5180) {
                goto LABEL_36;
              }
              if (!off_2677F5180(a1, v10))
              {
                LOBYTE(v19) = *v12;
                goto LABEL_36;
              }
            }
          }
          else
          {
            size_t v15 = v10 + 1;
          }
        }
      }
      if (!a1[v15]) {
        break;
      }
      if ((v14 & 1) == 0) {
        goto LABEL_31;
      }
      if ((char)v18 < 0)
      {
        int v20 = __maskrune(v18, 0x4000uLL);
        char v21 = *v12;
        goto LABEL_25;
      }
LABEL_24:
      int v20 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v18 + 60) & 0x4000;
      char v21 = v19;
LABEL_25:
      BOOL v23 = v13 != v19 && v20 == 0;
      LOBYTE(v19) = v21;
      if (v23) {
        goto LABEL_31;
      }
LABEL_36:
      if (v19 == 0 || (v16 & 1) == 0) {
        break;
      }
      if (v10)
      {
        if (a1[v10 - 1] == 34) {
          int v13 = 34;
        }
        else {
          int v13 = 0;
        }
      }
      else
      {
        int v13 = 0;
      }
      char v16 = 0;
      if (a1[v10 + 1] == asc_2677F42CC[0]) {
        size_t v15 = v10 + 2;
      }
      else {
        size_t v15 = v10 + 1;
      }
      char v14 = 1;
    }
    size_t v24 = i - v118;
    size_t v25 = i - v118 + v11;
    if (v25 + 1 <= v112)
    {
      int v8 = ptr;
    }
    else
    {
      v112 += v24 + 1;
      int v8 = (char *)malloc_type_realloc(ptr, v112, 0x100004077774924uLL);
      if (!v8)
      {
        free(*v106);
        return (int)v8;
      }
    }
    strncpy(&v8[v11], __src, v24);
    v8[v25] = 0;
    BOOL v26 = &a1[i];
    unint64_t v27 = v10 - i;
    if (!a1[i] || a1[i] != asc_2677F42CC[0])
    {
      v103 = v8;
      if (v27 + v25 + 1 <= v112)
      {
        a2 = (char **)v106;
      }
      else
      {
        v103 = (char *)malloc_type_realloc(v8, v27 + v112 + 1, 0x100004077774924uLL);
        a2 = (char **)v106;
        if (!v103)
        {
          v104 = *v106;
LABEL_236:
          free(v104);
          goto LABEL_237;
        }
      }
      strncpy(&v103[v25], v26, v10 - i);
      v103[v27 + v25] = 0;
      LODWORD(v8) = v118 != 0;
      goto LABEL_234;
    }
    ptr = v8;
    int v122 = 0;
    char v28 = a1[i + 1];
    if (!memchr(":^*$", v28, 5uLL))
    {
      size_t v109 = i - v118 + v11;
      int v35 = v28;
      BOOL v34 = v28 != 35;
      if (v28 == 35)
      {
        HistEvent v37 = (char *)malloc_type_malloc(i + 1, 0x100004077774924uLL);
        if (v37)
        {
          history_event = strncpy(v37, a1, i);
          int v31 = 0;
          history_event[i] = 0;
          LODWORD(v33) = 1;
          int v122 = 1;
          int v32 = (char *)history_event;
LABEL_67:
          if (a1[i + (int)v33] == 58)
          {
            uint64_t v33 = (int)v33;
            goto LABEL_69;
          }
          v43 = strdup(history_event);
          if (v35 == 35) {
            free(v32);
          }
          if (v43) {
            LODWORD(v8) = 1;
          }
          else {
            LODWORD(v8) = -1;
          }
          goto LABEL_213;
        }
      }
      else
      {
        if (i)
        {
          if (a1[i - 1] == 34) {
            int v36 = 34;
          }
          else {
            int v36 = 0;
          }
        }
        else
        {
          int v36 = 0;
        }
        history_event = get_history_event(&a1[i], &v122, v36);
        if (history_event)
        {
          int v32 = 0;
          LODWORD(v33) = v122;
          int v31 = history_event;
          goto LABEL_67;
        }
      }
      LODWORD(v8) = -1;
      size_t v25 = v109;
      goto LABEL_221;
    }
    qmemcpy(v121, "!!0", 3);
    int v29 = get_history_event(v121, &v122, 0);
    int v30 = a1[i + 1];
    int v122 = v30 == 58;
    if (!v29)
    {
      LODWORD(v8) = -1;
      goto LABEL_221;
    }
    int v31 = v29;
    size_t v109 = i - v118 + v11;
    int v32 = 0;
    uint64_t v33 = v30 == 58;
    BOOL v34 = 1;
LABEL_69:
    v39 = &v26[v33];
    v41 = (unsigned __int8 *)&v26[v33 + 1];
    int v40 = (char)*v41;
    if (v40 == 37)
    {
      if (qword_2677F4478) {
        v42 = (const char *)qword_2677F4478;
      }
      else {
        v42 = "";
      }
      v43 = strdup(v42);
      int v44 = v32;
      goto LABEL_110;
    }
    v119 = v31;
    if (!memchr("^*$-0123456789", v40, 0xFuLL))
    {
      int v44 = v32;
      if (v34) {
        int v48 = v119;
      }
      else {
        int v48 = v32;
      }
      v43 = strdup(v48);
      goto LABEL_110;
    }
    unsigned __int8 v45 = v40;
    if (v40 > 0x2Cu)
    {
      if (v40 == 45)
      {
        int v47 = 0;
        int v44 = v32;
        size_t v49 = v119;
        goto LABEL_94;
      }
      if (v40 != 94) {
        goto LABEL_98;
      }
      v41 = (unsigned __int8 *)(v39 + 2);
      int v47 = 1;
      int v46 = 1;
      goto LABEL_105;
    }
    if (v40 == 36)
    {
      v41 = (unsigned __int8 *)(v39 + 2);
LABEL_104:
      int v47 = -1;
      int v46 = -1;
LABEL_105:
      int v44 = v32;
      size_t v49 = v119;
      goto LABEL_106;
    }
    if (v40 == 42)
    {
      v41 = (unsigned __int8 *)(v39 + 2);
      int v46 = -1;
      int v47 = 1;
      goto LABEL_105;
    }
LABEL_98:
    if (v40 - 48 > 9) {
      goto LABEL_104;
    }
    int v44 = v32;
    size_t v49 = v119;
    int v47 = 0;
    unsigned __int8 v53 = v45;
    do
    {
      int v55 = *++v41;
      int v54 = v55;
      int v47 = 10 * v47 + v53 - 48;
      unsigned __int8 v53 = v55;
    }
    while ((v55 - 48) < 0xA);
    if (v54 != 42)
    {
      int v46 = v47;
      if (v54 != 45) {
        goto LABEL_106;
      }
LABEL_94:
      BOOL v50 = (char *)(v41 + 1);
      int v51 = v41[1];
      if ((v51 - 48) > 9)
      {
        if (v51 == 36) {
          v41 += 2;
        }
        else {
          ++v41;
        }
        if (v51 == 36) {
          int v46 = -1;
        }
        else {
          int v46 = -2;
        }
      }
      else
      {
        int v46 = 0;
        do
        {
          int v46 = v51 + 10 * v46 - 48;
          int v52 = *++v50;
          int v51 = v52;
        }
        while ((v52 - 48) < 0xA);
        v41 = (unsigned __int8 *)v50;
      }
      goto LABEL_106;
    }
    ++v41;
    int v46 = -1;
LABEL_106:
    if (v34) {
      v56 = v49;
    }
    else {
      v56 = v44;
    }
    v43 = history_arg_extract(v47, v46, v56);
    if (!v43)
    {
      fprintf(rl_outstream, "%s: Bad word specifier", &v26[v122]);
      LODWORD(v8) = -1;
      size_t v25 = v109;
      if (!v34) {
        goto LABEL_201;
      }
      goto LABEL_221;
    }
LABEL_110:
    if (!v34) {
      free(v44);
    }
    int v57 = *v41;
    LODWORD(v8) = 1;
    if (!*v41 || v41 - (unsigned __int8 *)v26 >= v27) {
      goto LABEL_213;
    }
    int v107 = 0;
    int v120 = 0;
LABEL_115:
    switch(v57)
    {
      case 'e':
        v58 = strrchr(v43, 46);
        if (v58) {
          goto LABEL_168;
        }
        goto LABEL_194;
      case 'f':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'q':
        goto LABEL_194;
      case 'g':
        int v120 = 2;
        goto LABEL_194;
      case 'h':
        uint64_t v59 = v43;
        int v60 = 47;
        goto LABEL_125;
      case 'p':
        int v107 = 1;
        goto LABEL_194;
      case 'r':
        uint64_t v59 = v43;
        int v60 = 46;
LABEL_125:
        int v61 = strrchr(v59, v60);
        if (v61) {
          *int v61 = 0;
        }
        goto LABEL_194;
      case 's':
        int v62 = v41[1];
        int v8 = (char *)malloc_type_realloc((void *)qword_2677F4CD0, 0x10uLL, 0x100004077774924uLL);
        if (!v8)
        {
          free((void *)qword_2677F4CD0);
          goto LABEL_196;
        }
        uint64_t v63 = 0;
        int v66 = v41[2];
        v65 = v41 + 2;
        int v64 = v66;
        if (v66 && v64 != v62)
        {
          uint64_t v67 = 0;
          size_t v68 = 16;
          do
          {
            if (v64 == 92)
            {
              if (v65[1] == v62) {
                ++v65;
              }
              LOBYTE(v64) = *v65;
            }
            uint64_t v63 = v67 + 1;
            v8[v67] = v64;
            if (v67 + 1 >= v68)
            {
              v68 *= 2;
              size_t v69 = (char *)malloc_type_realloc(v8, v68, 0x100004077774924uLL);
              if (!v69)
              {
                free(v8);
                LODWORD(v8) = 0;
LABEL_196:
                int v44 = v43;
                goto LABEL_200;
              }
              int v8 = v69;
            }
            int v70 = *++v65;
            int v64 = v70;
            if (v70) {
              BOOL v71 = v64 == v62;
            }
            else {
              BOOL v71 = 1;
            }
            uint64_t v67 = v63;
          }
          while (!v71);
        }
        v8[v63] = 0;
        qword_2677F4CD0 = (uint64_t)v8;
        if (!*v8)
        {
          free(v8);
          qword_2677F4CD0 = 0;
LABEL_224:
          LODWORD(v8) = -1;
          goto LABEL_196;
        }
        int v72 = v65[1];
        v41 = v65 + 1;
        if (!v72) {
          goto LABEL_194;
        }
        int v73 = malloc_type_realloc((void *)qword_2677F4CD8, 0x11uLL, 0x100004077774924uLL);
        if (!v73)
        {
          free((void *)qword_2677F4CD8);
          goto LABEL_224;
        }
        int v74 = v73;
        v75 = (const char *)qword_2677F4CD0;
        size_t __srca = strlen((const char *)qword_2677F4CD0);
        uint64_t v76 = 0;
        int v77 = *v41;
        if (!*v41 || v77 == v62)
        {
LABEL_165:
          v74[v76] = 0;
          qword_2677F4CD8 = (uint64_t)v74;
          goto LABEL_173;
        }
        __s1 = v43;
        uint64_t v76 = 0;
        unint64_t v78 = 16;
        while (2)
        {
          if (v76 + __srca + 1 < v78) {
            goto LABEL_152;
          }
          v78 += __srca + 1;
          int v79 = malloc_type_realloc(v74, v78 + 1, 0x100004077774924uLL);
          if (v79)
          {
            int v77 = *v41;
            int v74 = v79;
LABEL_152:
            if (v77 == 92)
            {
              int v80 = v41[1];
              if (v80 == 38 || v80 == v62) {
                ++v41;
              }
              LOBYTE(v77) = *v41;
            }
            else if (v77 == 38)
            {
              strcpy(&v74[v76], (const char *)qword_2677F4CD0);
              v76 += __srca;
LABEL_162:
              int v82 = *++v41;
              int v77 = v82;
              if (!v82 || v77 == v62)
              {
                v75 = (const char *)qword_2677F4CD0;
                v43 = __s1;
                goto LABEL_165;
              }
              continue;
            }
            v74[v76++] = v77;
            goto LABEL_162;
          }
          break;
        }
        free(v74);
        LODWORD(v8) = -1;
        int v44 = __s1;
LABEL_200:
        size_t v25 = v109;
LABEL_201:
        v99 = v44;
LABEL_220:
        free(v99);
LABEL_221:
        size_t v11 = v25;
        if (*v12) {
          continue;
        }
        a2 = (char **)v106;
        v103 = ptr;
        if (v8 == 2) {
          add_history(ptr);
        }
LABEL_234:
        free(*a2);
        *a2 = v103;
        return (int)v8;
      case 't':
        v83 = strrchr(v43, 47);
        if (v83)
        {
          v58 = v83 + 1;
LABEL_168:
          v84 = strdup(v58);
          free(v43);
          v43 = v84;
        }
        goto LABEL_194;
      default:
        if (v57 == 38)
        {
          v75 = (const char *)qword_2677F4CD0;
          int v74 = (unsigned char *)qword_2677F4CD8;
          if (qword_2677F4CD0) {
            BOOL v85 = qword_2677F4CD8 == 0;
          }
          else {
            BOOL v85 = 1;
          }
          if (!v85)
          {
LABEL_173:
            v86 = v43;
            size_t v87 = strlen(v43);
            size_t v88 = strlen(v74);
            size_t v89 = strlen(v75);
            size_t v90 = v89;
            int v91 = *(unsigned __int8 *)v86;
            size_t __n = v88;
            __s1a = (char *)v86;
            if (*v86)
            {
              size_t __srcb = v88 - v89;
              int v92 = *(unsigned __int8 *)v75;
              do
              {
                if (v91 == v92 && !strncmp(v86, v75, v90))
                {
                  v87 += __srcb;
                  uint64_t v93 = v90;
                  if (!v120) {
                    break;
                  }
                }
                else
                {
                  uint64_t v93 = 1;
                }
                v86 += v93;
                int v91 = *(unsigned __int8 *)v86;
              }
              while (*v86);
            }
            v94 = (char *)malloc_type_malloc(v87 + 1, 0x100004077774924uLL);
            if (v94)
            {
              int v95 = *__s1a;
              __srcc = v94;
              v96 = v94;
              if (*__s1a)
              {
                v96 = v94;
                v97 = __s1a;
                do
                {
                  if (v95 == *(unsigned __int8 *)v75 && !strncmp(v97, v75, v90))
                  {
                    strncpy(v96, v74, __n);
                    v96 += __n;
                    v97 += v90;
                    if (!v120)
                    {
                      strcpy(v96, v97);
                      goto LABEL_192;
                    }
                  }
                  else
                  {
                    ++v97;
                    *v96++ = v95;
                  }
                  int v95 = *(unsigned __int8 *)v97;
                }
                while (*v97);
              }
              char *v96 = 0;
LABEL_192:
              free(__s1a);
              int v120 = 0;
              v43 = __srcc;
            }
            else
            {
              int v120 = 0;
              v43 = __s1a;
            }
          }
        }
        else if (!v57)
        {
          if (v107) {
            LODWORD(v8) = 2;
          }
          else {
            LODWORD(v8) = 1;
          }
LABEL_213:
          size_t v25 = v109;
          if ((int)v8 < 1 || !v43)
          {
            if (!v43) {
              goto LABEL_221;
            }
LABEL_219:
            v99 = v43;
            goto LABEL_220;
          }
          size_t v100 = strlen(v43);
          size_t v101 = v100;
          size_t v102 = v100 + v109;
          if (v100 + v109 + 1 <= v112
            || (v112 += v100 + 1, (ptr = (char *)malloc_type_realloc(ptr, v112, 0x100004077774924uLL)) != 0))
          {
            strncpy(&ptr[v109], v43, v101);
            ptr[v102] = 0;
            size_t v25 = v102;
            goto LABEL_219;
          }
          free(*v106);
          v104 = v43;
          goto LABEL_236;
        }
LABEL_194:
        int v98 = *++v41;
        int v57 = v98;
        goto LABEL_115;
    }
  }
}

int add_history(const char *a1)
{
  if (a1)
  {
    BOOL v1 = a1;
    BOOL v2 = (History *)qword_2677F43A0;
    if (qword_2677F43A0) {
      BOOL v3 = qword_2677F4398 == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      rl_initialize();
      BOOL v2 = (History *)qword_2677F43A0;
    }
    *(void *)&v6.int num = 0;
    v6.int str = 0;
    history(v2, &v6, 10, v1);
    if (history((History *)qword_2677F43A0, &v6, 2))
    {
      int num = history_length;
    }
    else
    {
      int num = v6.num;
      history_length = v6.num;
    }
    LODWORD(ael_set((EditLine *)qword_2677F4398, 16, 1) = num < 1;
  }
  return (int)a1;
}

char *__cdecl history_arg_extract(int a1, int a2, const char *a3)
{
  size_t v5 = history_tokenize(a3);
  if (!v5) {
    return 0;
  }
  HistEvent v6 = (void **)v5;
  if (*v5)
  {
    uint64_t v7 = 0;
    while (v5[v7++])
      ;
    unint64_t v9 = v7 - 2;
    if (a1 == 36) {
      int v10 = v7 - 2;
    }
    else {
      int v10 = a1;
    }
    if (a2 == 36) {
      int v11 = v7 - 2;
    }
    else {
      int v11 = a2;
    }
    unint64_t v12 = v11 + ((v7 - 1) & (v11 >> 31));
    if (v10 >= 0) {
      unint64_t v13 = v10;
    }
    else {
      unint64_t v13 = v12;
    }
    if (((v13 | v12) & 0x80000000) != 0 || v9 < v13)
    {
      char v14 = 0;
    }
    else
    {
      char v14 = 0;
      if (v9 >= v12 && v13 <= v12)
      {
        uint64_t v19 = 0;
        uint64_t v20 = v12 - v13 + 1;
        char v21 = (const char **)&v5[v13];
        do
        {
          int v22 = *v21++;
          v19 += strlen(v22) + 1;
          --v20;
        }
        while (v20);
        char v14 = (char *)malloc_type_malloc(v19 + 1, 0x100004077774924uLL);
        if (v14)
        {
          uint64_t v23 = 0;
          do
          {
            strcpy(&v14[v23], (const char *)v6[v13]);
            v23 += strlen((const char *)v6[v13]);
            if (v13 < v12) {
              v14[v23++] = 32;
            }
            ++v13;
          }
          while (v12 + 1 != v13);
          v14[v23] = 0;
        }
      }
    }
    size_t v15 = *v6;
    if (*v6)
    {
      char v16 = v6 + 1;
      do
      {
        free(v15);
        uint64_t v17 = *v16++;
        size_t v15 = v17;
      }
      while (v17);
    }
  }
  else
  {
    char v14 = 0;
  }
  free(v6);
  return v14;
}

char **__cdecl history_tokenize(const char *a1)
{
  if (*a1)
  {
    uint64_t v2 = 0;
    char v3 = 0;
    BOOL v4 = 0;
    int v5 = 0;
    int v28 = 1;
    uint64_t v6 = MEMORY[0x263EF8318];
    while (1)
    {
      ptr = v4;
      uint64_t v30 = v2;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = v5;
      uint64_t v10 = ((uint64_t)v5 << 32) - 0x100000000;
      int v11 = &a1[v5];
      do
      {
        uint64_t v12 = v11[v7];
        if (v11[v7] < 0) {
          int v13 = __maskrune(v12, 0x4000uLL);
        }
        else {
          int v13 = *(_DWORD *)(v6 + 4 * v12 + 60) & 0x4000;
        }
        --v8;
        v10 += 0x100000000;
        ++v7;
      }
      while (v13);
      int v14 = v9 - 1 - v8;
      uint64_t v15 = v10 >> 32;
      char v16 = &a1[v10 >> 32];
      char v17 = *v16;
      if (*v16)
      {
        int v18 = v9 - 1 - v8;
        do
        {
          if (v17 == 92)
          {
            if (a1[v18 + 1]) {
              ++v18;
            }
          }
          else
          {
            int v19 = v17;
            if (v17 == v3)
            {
              char v3 = 0;
            }
            else if (!v3)
            {
              if (v17 < 0)
              {
                if (__maskrune(v17, 0x4000uLL)) {
                  goto LABEL_37;
                }
              }
              else if ((*(_DWORD *)(v6 + 4 * v17 + 60) & 0x4000) != 0)
              {
                goto LABEL_37;
              }
              if (memchr("()<>;&|$", v19, 9uLL))
              {
LABEL_37:
                char v3 = 0;
                int v14 = v18;
                break;
              }
              char v20 = *v16;
                char v3 = v20;
              else {
                char v3 = 0;
              }
            }
          }
          if (a1[v18]) {
            uint64_t v15 = v18 + 1;
          }
          else {
            uint64_t v15 = v18;
          }
          char v16 = &a1[v15];
          char v17 = a1[v15];
          int v18 = v15;
          int v14 = v15;
        }
        while (v17);
      }
      if ((int)v30 + 2 >= v28)
      {
        v28 *= 2;
        char v21 = ptr;
        int v22 = (char **)malloc_type_realloc(ptr, 8 * v28, 0x10040436913F5uLL);
        if (!v22) {
          goto LABEL_43;
        }
        ptr = v22;
      }
      uint64_t v23 = v15 - v9 + v8;
      size_t v24 = (char *)malloc_type_malloc(v23 + 2, 0x100004077774924uLL);
      if (!v24) {
        break;
      }
      size_t v25 = strncpy(v24, &a1[v9 + ~v8], v23 + 1);
      v25[v15 - v9 + 1 + v8] = 0;
      BOOL v4 = ptr;
      ptr[v30] = v25;
      uint64_t v2 = v30 + 1;
      ptr[v30 + 1] = 0;
      if (*v16) {
        int v5 = v14 + 1;
      }
      else {
        int v5 = v14;
      }
      if (!a1[v5]) {
        return v4;
      }
    }
    if (v30)
    {
      uint64_t v26 = 0;
      char v21 = ptr;
      do
        free(ptr[v26++]);
      while (v30 != v26);
    }
    else
    {
      char v21 = ptr;
    }
LABEL_43:
    free(v21);
  }
  return 0;
}

void stifle_history(int a1)
{
  uint64_t v1 = *(void *)&a1;
  uint64_t v2 = (History *)qword_2677F43A0;
  if (qword_2677F43A0) {
    BOOL v3 = qword_2677F4398 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    rl_initialize();
    uint64_t v2 = (History *)qword_2677F43A0;
  }
  *(void *)&v4.int num = 0;
  v4.int str = 0;
  if (!history(v2, &v4, 1, v1)) {
    max_input_history = v1;
  }
}

int unstifle_history(void)
{
  *(void *)&v1.int num = 0;
  v1.int str = 0;
  history((History *)qword_2677F43A0, &v1, 1, 0x7FFFFFFFLL);
  int result = max_input_history;
  max_input_history = 0x7FFFFFFF;
  return result;
}

int history_is_stifled(void)
{
  return max_input_history != 0x7FFFFFFF;
}

int history_truncate_file(const char *a1, int a2)
{
  uint64_t v2 = (char *)MEMORY[0x270FA5388](a1, *(void *)&a2);
  int v4 = v3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (v2 || (uint64_t v2 = sub_213B1AF04()) != 0)
  {
    int v5 = fopen(v2, "r+");
    if (v5)
    {
      uint64_t v6 = v5;
      strcpy(v25, "/tmp/.historyXXXXXX");
      int v7 = mkstemp(v25);
      if (v7 == -1)
      {
        int v12 = *__error();
LABEL_49:
        fclose(v6);
        return v12;
      }
      int v8 = v7;
      uint64_t v9 = fdopen(v7, "r+");
      if (!v9)
      {
        close(v8);
        int v12 = *__error();
LABEL_48:
        unlink(v25);
        goto LABEL_49;
      }
      uint64_t v10 = v9;
      if (fread(v24, 0x1000uLL, 1uLL, v6) == 1)
      {
        unsigned int v11 = 0;
        while (fwrite(v24, 0x1000uLL, 1uLL, v10) == 1)
        {
          ++v11;
          if (fread(v24, 0x1000uLL, 1uLL, v6) != 1) {
            goto LABEL_15;
          }
        }
LABEL_16:
        size_t v13 = 0;
        goto LABEL_17;
      }
      unsigned int v11 = 0;
LABEL_15:
      if (ferror(v6) || fseeko(v6, (unint64_t)v11 << 12, 0) == -1) {
        goto LABEL_16;
      }
      size_t v13 = fread(v24, 1uLL, 0x1000uLL, v6);
      if (!ferror(v6))
      {
        if (!v13)
        {
          --v11;
          size_t v13 = 4096;
LABEL_59:
          fflush(v10);
          goto LABEL_18;
        }
        if (fwrite(v24, v13, 1uLL, v10) == 1) {
          goto LABEL_59;
        }
      }
LABEL_17:
      int v12 = *__error();
      if (v12)
      {
LABEL_47:
        fclose(v10);
        goto LABEL_48;
      }
LABEL_18:
      uint64_t v14 = v13 - 1;
      if (v24[v13 - 1] != 10) {
        uint64_t v14 = v13;
      }
      uint64_t v15 = (int)v11;
      while (1)
      {
        if (v14 >= 1)
        {
          while (v24[v14 - 1] != 10 || --v4)
          {
            BOOL v18 = v14-- <= 1;
            if (v18)
            {
              char v16 = &v24[-1];
              goto LABEL_28;
            }
          }
          BOOL v18 = (unint64_t)v14 > 0xFFF;
          if ((unint64_t)v14 > 0xFFF) {
            uint64_t v14 = 0;
          }
          char v16 = &v24[v14];
          if (v18) {
            LODWORD(v15) = v15 + 1;
          }
          goto LABEL_38;
        }
        char v16 = &v24[v14 - 1];
LABEL_28:
        if (v4 < 1 || !v15) {
          break;
        }
        if (fseeko(v10, --v15 << 12, 0) < 0) {
          goto LABEL_46;
        }
        size_t v17 = fread(v24, 0x1000uLL, 1uLL, v10);
        uint64_t v14 = 4096;
        if (v17 != 1)
        {
          if (!ferror(v10))
          {
            int v12 = 35;
            goto LABEL_47;
          }
          goto LABEL_46;
        }
      }
      if (v4 > 0)
      {
        int v12 = 0;
        goto LABEL_47;
      }
LABEL_38:
      if (fseeko(v6, 0, 0) == -1
        || fseeko(v10, 0, 0) == -1
        || !fgets(v24, 4096, v10)
        || fputs(v24, v6) == -1
        || fseeko(v10, v16 - v24 + ((uint64_t)(int)v15 << 12), 0) == -1)
      {
LABEL_46:
        int v12 = *__error();
        goto LABEL_47;
      }
      while (1)
      {
        size_t v19 = fread(v24, 1uLL, 0x1000uLL, v10);
        if (!v19) {
          break;
        }
        if (fwrite(v24, v19, 1uLL, v6) != 1) {
          goto LABEL_61;
        }
      }
      if (ferror(v6))
      {
LABEL_61:
        int v12 = *__error();
        goto LABEL_62;
      }
      int v12 = 0;
LABEL_62:
      fflush(v6);
      off_t v21 = ftello(v6);
      if (v21 >= 1)
      {
        off_t v22 = v21;
        int v23 = fileno(v6);
        ftruncate(v23, v22);
      }
      goto LABEL_47;
    }
  }
  return *__error();
}

char *sub_213B1AF04()
{
  BOOL v0 = &byte_2677F4CE0;
  if (!byte_2677F4CE0)
  {
    uid_t v1 = getuid();
    uint64_t v2 = getpwuid(v1);
    if (v2) {
      snprintf(&byte_2677F4CE0, 0x400uLL, "%s/.history", v2->pw_dir);
    }
    else {
      return 0;
    }
  }
  return v0;
}

int read_history(const char *a1)
{
  if (qword_2677F43A0) {
    BOOL v2 = qword_2677F4398 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    rl_initialize();
  }
  *(void *)&v5.int num = 0;
  v5.int str = 0;
  if (!a1)
  {
    a1 = sub_213B1AF04();
    if (!a1) {
      return *__error();
    }
  }
  if (history((History *)qword_2677F43A0, &v5, 17, a1) == -1)
  {
    if (!*__error()) {
      return 22;
    }
    return *__error();
  }
  if (history((History *)qword_2677F43A0, &v5, 2))
  {
    int num = history_length;
  }
  else
  {
    int num = v5.num;
    history_length = v5.num;
  }
  return num < 1;
}

int write_history(const char *a1)
{
  if (qword_2677F43A0) {
    BOOL v2 = qword_2677F4398 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    rl_initialize();
  }
  *(void *)&v4.int num = 0;
  v4.int str = 0;
  if (!a1)
  {
    a1 = sub_213B1AF04();
    if (!a1) {
      return *__error();
    }
  }
  if (history((History *)qword_2677F43A0, &v4, 18, a1) != -1) {
    return 0;
  }
  if (!*__error()) {
    return 22;
  }
  else {
    return *__error();
  }
}

HIST_ENTRY *__cdecl remove_history(int a1)
{
  uint64_t v1 = *(void *)&a1;
  if (qword_2677F43A0) {
    BOOL v2 = qword_2677F4398 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    rl_initialize();
  }
  int v3 = (HIST_ENTRY *)malloc_type_malloc(0x10uLL, 0xD0040D45F9286uLL);
  if (v3)
  {
    *(void *)&v5.int num = 0;
    v5.int str = 0;
    if (history((History *)qword_2677F43A0, &v5, 24, v1, &v3->data))
    {
      free(v3);
      return 0;
    }
    else
    {
      v3->line = v5.str;
      if (!history((History *)qword_2677F43A0, &v5, 2)) {
        history_length = v5.num;
      }
    }
  }
  return v3;
}

HIST_ENTRY *__cdecl replace_history_entry(int a1, const char *a2, histdata_t a3)
{
  uint64_t v5 = *(void *)&a1;
  uint64_t v6 = (History *)qword_2677F43A0;
  if (qword_2677F43A0) {
    BOOL v7 = qword_2677F4398 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    rl_initialize();
    uint64_t v6 = (History *)qword_2677F43A0;
  }
  *(void *)&v12.uint64_t num = 0;
  v12.int str = 0;
  int v8 = 0;
  if (!history(v6, &v12, 8))
  {
    uint64_t num = v12.num;
    if (!history((History *)qword_2677F43A0, &v12, 4))
    {
      int v8 = (HIST_ENTRY *)malloc_type_malloc(0x10uLL, 0xD0040D45F9286uLL);
      if (!v8) {
        return v8;
      }
      if (!history((History *)qword_2677F43A0, &v12, 23, v5, &v8->data))
      {
        unsigned int v11 = strdup(v12.str);
        v8->line = v11;
        if (v11)
        {
          if (!history((History *)qword_2677F43A0, &v12, 25, a2, a3)
            && !history((History *)qword_2677F43A0, &v12, 7, num))
          {
            return v8;
          }
        }
      }
      free(v8);
    }
    return 0;
  }
  return v8;
}

void clear_history(void)
{
  *(void *)&v0.uint64_t num = 0;
  v0.int str = 0;
  history((History *)qword_2677F43A0, &v0, 19);
  history_length = 0;
}

int where_history(void)
{
  *(void *)&v4.int num = 0;
  v4.int str = 0;
  if (history((History *)qword_2677F43A0, &v4, 8)) {
    return 0;
  }
  int num = v4.num;
  history((History *)qword_2677F43A0, &v4, 3);
  int v3 = v4.num;
  int v0 = 1;
  while (v3 != num && !history((History *)qword_2677F43A0, &v4, 6))
  {
    ++v0;
    int v3 = v4.num;
  }
  return v0;
}

HIST_ENTRY *current_history(void)
{
  return (HIST_ENTRY *)sub_213B1B39C(8);
}

uint64_t *sub_213B1B39C(int a1)
{
  *(void *)&v3.int num = 0;
  v3.int str = 0;
  int v1 = history((History *)qword_2677F43A0, &v3, a1);
  int result = 0;
  if (!v1)
  {
    int result = &qword_2677F50E0;
    qword_2677F50E0 = (uint64_t)v3.str;
    *(void *)algn_2677F50E8 = 0;
  }
  return result;
}

int history_total_bytes(void)
{
  *(void *)&v3.uint64_t num = 0;
  v3.int str = 0;
  if (history((History *)qword_2677F43A0, &v3, 8))
  {
    LODWORD(vel_set((EditLine *)qword_2677F4398, 16, 0) = -1;
  }
  else
  {
    uint64_t num = v3.num;
    history((History *)qword_2677F43A0, &v3, 3);
    uint64_t v0 = 0;
    do
      v0 += strlen(v3.str);
    while (!history((History *)qword_2677F43A0, &v3, 6));
    history((History *)qword_2677F43A0, &v3, 16, num);
  }
  return v0;
}

int history_set_pos(int a1)
{
  uint64_t v1 = *(void *)&a1;
  int result = -1;
  if ((v1 & 0x80000000) == 0 && history_length > (int)v1)
  {
    *(void *)&v4.uint64_t num = 0;
    v4.int str = 0;
    history((History *)qword_2677F43A0, &v4, 8);
    uint64_t num = v4.num;
    int result = history((History *)qword_2677F43A0, &v4, 24, v1, -1);
    if (result)
    {
      history((History *)qword_2677F43A0, &v4, 7, num);
      return -1;
    }
  }
  return result;
}

HIST_ENTRY *previous_history(void)
{
  return (HIST_ENTRY *)sub_213B1B39C(5);
}

HIST_ENTRY *next_history(void)
{
  return (HIST_ENTRY *)sub_213B1B39C(6);
}

int history_search_pos(const char *a1, int a2, int a3)
{
  *(void *)&v9.uint64_t num = 0;
  v9.int str = 0;
  if (a3 >= 0) {
    int v5 = a3;
  }
  else {
    int v5 = -a3;
  }
  if (history((History *)qword_2677F43A0, &v9, 8)) {
    return -1;
  }
  uint64_t num = v9.num;
  if (history_set_pos(v5) || history((History *)qword_2677F43A0, &v9, 8)) {
    return -1;
  }
  if (a3 < 1) {
    int v7 = 5;
  }
  else {
    int v7 = 6;
  }
  while (!strstr((char *)v9.str, a1))
  {
    if (history((History *)qword_2677F43A0, &v9, v7))
    {
      if (a3 < 1) {
        history((History *)qword_2677F43A0, &v9, 15, num);
      }
      else {
        history((History *)qword_2677F43A0, &v9, 16, num);
      }
      return -1;
    }
  }
  return v5;
}

char *__cdecl username_completion_function(const char *a1, int a2)
{
  if (!*a1) {
    return 0;
  }
  if (*a1 == 126) {
    BOOL v2 = a1 + 1;
  }
  else {
    BOOL v2 = a1;
  }
  if (!a2) {
    setpwent();
  }
  do
  {
    HistEvent v3 = getpwent();
    if (!v3)
    {
      endpwent();
      return 0;
    }
    pw_name = v3->pw_name;
  }
  while (*(unsigned __int8 *)v2 == *(unsigned __int8 *)v3->pw_name && !strcmp(v2, pw_name));

  return strdup(pw_name);
}

void rl_display_match_list(char **a1, int a2, int a3)
{
}

int rl_complete(int a1, int a2)
{
  char v2 = a2;
  if (qword_2677F43A0) {
    BOOL v3 = qword_2677F4398 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    rl_initialize();
  }
  if (rl_inhibit_completion)
  {
    v12[0] = v2;
    v12[1] = 0;
    el_insertstr((EditLine *)qword_2677F4398, v12);
    return 4;
  }
  else
  {
    if (rl_completion_word_break_hook)
    {
      int v5 = (__int32 *)rl_completion_word_break_hook();
      uint64_t v6 = (__int32 *)rl_basic_word_break_characters;
    }
    else
    {
      uint64_t v6 = (__int32 *)rl_basic_word_break_characters;
      int v5 = (__int32 *)rl_basic_word_break_characters;
    }
    int v7 = (EditLine *)qword_2677F4398;
    int v8 = (char *(__cdecl *)(const char *, int))rl_completion_entry_function;
    HistEvent v9 = rl_attempted_completion_function;
    uint64_t v10 = sub_213B238D0(v6, (uint64_t)&unk_2677F4490);
    unsigned int v11 = sub_213B238D0(v5, (uint64_t)&unk_2677F44B0);
    return sub_213B1425C(v7, v8, (uint64_t (*)(char *, void))v9, v10, v11, (const char *(*)(char *))sub_213B1B7F8, rl_completion_query_items, &rl_completion_type, &rl_attempted_completion_over, &rl_point, &rl_end, 0, 0, 0);
  }
}

char *sub_213B1B7F8()
{
  int result = &byte_2677F50F0;
  byte_2677F50F0 = rl_completion_append_character;
  byte_2677F50F1 = 0;
  return result;
}

int rl_bind_key(int a1, rl_command_func_t *a2)
{
  if (qword_2677F43A0) {
    BOOL v4 = qword_2677F4398 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    rl_initialize();
  }
  if (a2 != rl_insert) {
    return -1;
  }
  int result = 0;
  *(unsigned char *)(*(void *)(qword_2677F4398 + 1056) + ael_set((EditLine *)qword_2677F4398, 16, 1) = 8;
  return result;
}

int rl_insert(int a1, int a2)
{
  char v2 = a2;
  if (qword_2677F43A0) {
    BOOL v4 = qword_2677F4398 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    rl_initialize();
  }
  v7[0] = v2;
  v7[1] = 0;
  if (a1 >= 1)
  {
    unsigned int v5 = a1 + 1;
    do
    {
      el_push((EditLine *)qword_2677F4398, v7);
      --v5;
    }
    while (v5 > 1);
  }
  return 0;
}

int rl_read_key(void)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = (EditLine *)qword_2677F4398;
  if (qword_2677F4398) {
    BOOL v1 = qword_2677F43A0 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    rl_initialize();
    uint64_t v0 = (EditLine *)qword_2677F4398;
  }
  return el_getc(v0, v3);
}

void rl_reset_terminal(const char *a1)
{
  BOOL v1 = (EditLine *)qword_2677F4398;
  if (qword_2677F43A0) {
    BOOL v2 = qword_2677F4398 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    rl_initialize();
    BOOL v1 = (EditLine *)qword_2677F4398;
  }

  el_reset(v1);
}

int rl_insert_text(const char *a1)
{
  if (a1)
  {
    BOOL v1 = a1;
    if (!*a1) {
      goto LABEL_11;
    }
    BOOL v2 = (EditLine *)qword_2677F4398;
    if (!qword_2677F43A0 || qword_2677F4398 == 0)
    {
      rl_initialize();
      BOOL v2 = (EditLine *)qword_2677F4398;
    }
    if (el_insertstr(v2, v1) < 0) {
LABEL_11:
    }
      LODWORD(ael_set((EditLine *)qword_2677F4398, 16, 1) = 0;
    else {
      LODWORD(ael_set((EditLine *)qword_2677F4398, 16, 1) = strlen(v1);
    }
  }
  return (int)a1;
}

int rl_newline(int a1, int a2)
{
  return 0;
}

int rl_add_defun(const char *a1, Function *a2, int a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3 > 0xFF) {
    return -1;
  }
  qword_2677F44D0[a3] = a2;
  el_set((EditLine *)qword_2677F4398, 9, a1, a1, sub_213B1BB44);
  vis(v6, a3, 92, 0);
  el_set((EditLine *)qword_2677F4398, 4, v6, a1, 0);
  return 0;
}

uint64_t sub_213B1BB44(uint64_t a1, uint64_t a2)
{
  if (!qword_2677F44D0[a2]) {
    return 6;
  }
  uint64_t v3 = a2;
  uint64_t v4 = el_line((EditLine *)qword_2677F4398);
  int buffer = (int)v4->buffer;
  rl_point = LODWORD(v4->cursor) - LODWORD(v4->buffer);
  rl_end = LODWORD(v4->lastchar) - buffer;
  ((void (*)(void, uint64_t))qword_2677F44D0[v3])(0, a2);
  return 2 * (dword_2677F5168 != 0);
}

void rl_callback_read_char(void)
{
  int v9 = 0;
  uint64_t v0 = el_gets((EditLine *)qword_2677F4398, &v9);
  if (v0 && (v1 = v9, unsigned int v2 = v9 - 1, --v9, v1 > 0))
  {
    uint64_t v3 = v0;
    if (v2) {
      int v4 = 0;
    }
    else {
      int v4 = *v0 == *(unsigned __int8 *)(qword_2677F4398 + 510);
    }
    int v7 = v0[v2];
    if (v7 == 13 || v7 == 10) {
      int v4 = 2;
    }
    if (v4 && off_26ACD7CC0)
    {
      el_set((EditLine *)qword_2677F4398, 15, 0);
      uint64_t v6 = 0;
      if (v4 == 2)
      {
        uint64_t v6 = strdup(v3);
        if (v6) {
          v6[v9] = 0;
        }
      }
      unsigned int v5 = (void (*)(char *))off_26ACD7CC0;
      goto LABEL_21;
    }
  }
  else
  {
    unsigned int v5 = (void (*)(char *))off_26ACD7CC0;
    if (off_26ACD7CC0 && *(unsigned __int8 *)(qword_2677F4398 + 137) == 255)
    {
      uint64_t v6 = 0;
LABEL_21:
      v5(v6);
    }
  }
}

void rl_callback_handler_install(const char *a1, VCPFunction *a2)
{
  if (!qword_2677F4398) {
    rl_initialize();
  }
  rl_set_prompt(a1);
  off_26ACD7CC0 = a2;
  el_set((EditLine *)qword_2677F4398, 15, 1);
}

void rl_callback_handler_remove(void)
{
  off_26ACD7CC0 = 0;
}

void rl_redisplay(void)
{
  __int16 v0 = *(unsigned __int8 *)(qword_2677F4398 + 521);
  el_push((EditLine *)qword_2677F4398, (const char *)&v0);
}

int rl_get_previous_history(int a1, int a2)
{
  v4[0] = a2;
  v4[1] = 0;
  if (a1)
  {
    int v2 = a1;
    do
    {
      --v2;
      el_push((EditLine *)qword_2677F4398, v4);
    }
    while (v2);
  }
  return 0;
}

int rl_read_init_file(const char *a1)
{
  return el_source((EditLine *)qword_2677F4398, a1);
}

int rl_parse_and_bind(const char *a1)
{
  unsigned int v5 = 0;
  int v4 = 0;
  int v2 = tok_init(0);
  tok_str(v2, a1, &v4, (const char ***)&v5);
  int v4 = el_parse((EditLine *)qword_2677F4398, v4, (const char **)v5);
  tok_end(v2);
  return v4 != 0;
}

int rl_variable_bind(const char *a1, const char *a2)
{
  return el_set((EditLine *)qword_2677F4398, 4, "", a1, a2, 0) == -1;
}

void rl_stuff_char(int a1)
{
  v1[0] = a1;
  v1[1] = 0;
  el_insertstr((EditLine *)qword_2677F4398, v1);
}

void rl_get_screen_size(int *a1, int *a2)
{
  if (a1) {
    el_get((EditLine *)qword_2677F4398, 17, "li", a1, 0);
  }
  if (a2) {
    el_get((EditLine *)qword_2677F4398, 17, "co", a2, 0);
  }
}

void rl_set_screen_size(int a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x40uLL, "%d", a1);
  el_set((EditLine *)qword_2677F4398, 6, "li", __str, 0);
  snprintf(__str, 0x40uLL, "%d", a2);
  el_set((EditLine *)qword_2677F4398, 6, "co", __str, 0);
}

char **__cdecl rl_completion_matches(const char *a1, rl_compentry_func_t *a2)
{
  uint64_t v4 = (char *)malloc_type_malloc(0x50uLL, 0x10040436913F5uLL);
  if (!v4) {
    return (char **)v4;
  }
  uint64_t v5 = ((uint64_t (*)(const char *, void))a2)(a1, 0);
  if (!v5) {
    goto LABEL_27;
  }
  size_t v6 = 0;
  uint64_t v7 = 10;
  do
  {
    *(void *)&v4[8 * v6 + 8] = v5;
    if (v6 + 2 == v7)
    {
      v7 += 10;
      int v8 = (char *)malloc_type_realloc(v4, 8 * v7, 0x10040436913F5uLL);
      if (!v8) {
        goto LABEL_27;
      }
      uint64_t v4 = v8;
    }
    uint64_t v5 = ((uint64_t (*)(const char *, size_t))a2)(a1, ++v6);
  }
  while (v5);
  if (!v6) {
    goto LABEL_27;
  }
  *(void *)&v4[8 * v6 + 8] = 0;
  if (v6 == 1)
  {
    int v9 = (const char *)*((void *)v4 + 1);
    goto LABEL_11;
  }
  qsort(v4 + 8, v6, 8uLL, (int (__cdecl *)(const void *, const void *))sub_213B1C210);
  unsigned int v11 = (unsigned char *)*((void *)v4 + 1);
  size_t v12 = -1;
  uint64_t v13 = 1;
  do
  {
    uint64_t v14 = v11;
    ++v13;
    unsigned int v11 = *(unsigned char **)&v4[8 * v13];
    int v15 = *v14;
    if (*v14)
    {
      size_t v16 = 0;
      size_t v17 = v14 + 1;
      while (v15 == v11[v16])
      {
        size_t v18 = v16 + 1;
        int v15 = v17[v16++];
        if (!v15) {
          goto LABEL_21;
        }
      }
      size_t v18 = v16;
    }
    else
    {
      size_t v18 = 0;
    }
LABEL_21:
    if (v12 >= v18) {
      size_t v12 = v18;
    }
  }
  while (v6 != v13);
  if (!v12)
  {
    if (*a1)
    {
      int v9 = a1;
LABEL_11:
      uint64_t v10 = strdup(v9);
      *(void *)uint64_t v4 = v10;
      if (!v10) {
        goto LABEL_27;
      }
      return (char **)v4;
    }
    size_t v12 = 0;
  }
  size_t v19 = malloc_type_malloc(v12 + 1, 0x100004077774924uLL);
  *(void *)uint64_t v4 = v19;
  if (!v19)
  {
LABEL_27:
    free(v4);
    return 0;
  }
  memcpy(v19, *((const void **)v4 + 1), v12);
  *(unsigned char *)(*(void *)v4 + v12) = 0;
  return (char **)v4;
}

uint64_t sub_213B1C210(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void rl_forced_update_display(void)
{
}

int _rl_abort_internal(void)
{
}

int _rl_qsort_string_compare(char **a1, char **a2)
{
  return strcoll(*a1, *a2);
}

HISTORY_STATE *history_get_history_state(void)
{
  int result = (HISTORY_STATE *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
  if (result) {
    result->length = history_length;
  }
  return result;
}

int rl_kill_text(int a1, int a2)
{
  return 0;
}

Keymap rl_make_bare_keymap(void)
{
  return 0;
}

Keymap rl_get_keymap(void)
{
  return 0;
}

int rl_generic_bind(int a1, const char *a2, const char *a3, Keymap a4)
{
  return 0;
}

int rl_bind_key_in_map(int a1, rl_command_func_t *a2, Keymap a3)
{
  return 0;
}

int rl_on_new_line(void)
{
  return 0;
}

uint64_t sub_213B1C2DC(uint64_t a1, __int32 a2, int a3)
{
  uint64_t result = wcwidth(a2);
  if ((int)result <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = result;
  }
  if (a3)
  {
    while (*(_DWORD *)(a1 + 848) + (int)v7 > *(_DWORD *)(a1 + 152))
      uint64_t result = sub_213B1C2DC(a1, 32, 1);
  }
  uint64_t v8 = *(void *)(a1 + 72);
  *(_DWORD *)(*(void *)(v8 + 8 * *(int *)(a1 + 852)) + 4 * *(int *)(a1 + 848)) = a2;
  if (v7 >= 2)
  {
    uint64_t v9 = -1;
    do
      *(_DWORD *)(*(void *)(v8 + 8 * *(int *)(a1 + 852)) + 4 * (v7 + v9-- + *(int *)(a1 + 848))) = -1;
    while ((int)v7 + (int)v9 + 2 > 2);
  }
  if (a3)
  {
    int v10 = *(_DWORD *)(a1 + 848) + v7;
    *(_DWORD *)(a1 + 848) = v10;
    uint64_t v11 = *(int *)(a1 + 152);
    if (v10 >= (int)v11)
    {
      *(_DWORD *)(*(void *)(v8 + 8 * *(int *)(a1 + 852)) + 4 * v1longjmp(dword_2677F43AC, 1) = 0;
      return sub_213B1C3E4(a1);
    }
  }
  return result;
}

uint64_t sub_213B1C3E4(uint64_t result)
{
  *(_DWORD *)(result + 848) = 0;
  int v1 = *(_DWORD *)(result + 852) + 1;
  uint64_t v2 = *(unsigned int *)(result + 156);
  if (v1 >= (int)v2)
  {
    uint64_t v3 = *(_DWORD ***)(result + 72);
    uint64_t v4 = *v3;
    if ((int)v2 < 2)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 0;
      do
      {
        *(void *)(*(void *)(result + 72) + 8 * v5) = *(void *)(*(void *)(result + 72) + 8 * v5 + 8);
        ++v5;
      }
      while (v2 - 1 != v5);
      uint64_t v3 = *(_DWORD ***)(result + 72);
    }
    _DWORD *v4 = 0;
    v3[v5] = v4;
  }
  else
  {
    *(_DWORD *)(result + 852) = v1;
  }
  return result;
}

uint64_t sub_213B1C450(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v148 = *MEMORY[0x263EF8340];
  *(void *)(a1 + 848) = 0;
  sub_213B17FA0(a1, 12);
  *(void *)(v1 + 848) = 0;
  unint64_t v2 = *(void *)(v1 + 104);
  if (*(void *)(v1 + 96) >= v2)
  {
    if (*(void *)(v1 + 1064) == *(void *)(v1 + 1048))
    {
      if (v2 == *(void *)(v1 + 88)) {
        uint64_t v3 = 0;
      }
      else {
        uint64_t v3 = -1;
      }
      v2 += 4 * v3;
    }
    *(void *)(v1 + 96) = v2;
  }
  sub_213B17FA0(v1, 0);
  uint64_t v4 = *(__int32 **)(v1 + 88);
  if ((unint64_t)v4 >= *(void *)(v1 + 104))
  {
    int v16 = *(_DWORD *)(v1 + 848);
  }
  else
  {
    int v5 = 0;
    int v6 = -1;
    do
    {
      if (v4 == *(__int32 **)(v1 + 96))
      {
        int v7 = wcwidth(*v4);
        unsigned int v8 = v7 <= 1 ? 1 : v7;
        int v6 = *(_DWORD *)(v1 + 848);
        int v5 = *(_DWORD *)(v1 + 852);
        if (v8 >= 2 && (signed int)(v6 + v8) > *(_DWORD *)(v1 + 152))
        {
          int v6 = 0;
          ++v5;
        }
      }
      unint64_t v9 = *v4;
      int v10 = sub_213B23DE4(*v4);
      if (v10 == -3)
      {
        int v11 = *(_DWORD *)(v1 + 852);
        sub_213B1C2DC(v1, 0, 0);
        if (v11 == *(_DWORD *)(v1 + 852)) {
          sub_213B1C3E4(v1);
        }
      }
      else if (v10)
      {
        if (v10 == -2)
        {
          do
            sub_213B1C2DC(v1, 32, 1);
          while ((*(unsigned char *)(v1 + 848) & 7) != 0);
        }
        else
        {
          uint64_t v12 = sub_213B23C1C(v147, 8uLL, v9);
          if (v12 >= 1)
          {
            uint64_t v13 = v12;
            uint64_t v14 = v147;
            do
            {
              __int32 v15 = *v14++;
              sub_213B1C2DC(v1, v15, 1);
              --v13;
            }
            while (v13);
          }
        }
      }
      else
      {
        sub_213B1C2DC(v1, v9, 1);
      }
      ++v4;
    }
    while ((unint64_t)v4 < *(void *)(v1 + 104));
    int v16 = *(_DWORD *)(v1 + 848);
    if (v6 != -1) {
      goto LABEL_33;
    }
  }
  int v5 = *(_DWORD *)(v1 + 852);
  int v6 = v16;
LABEL_33:
  int v17 = *(_DWORD *)(v1 + 896);
  if (!v17 || *(_DWORD *)(v1 + 900) || *(_DWORD *)(v1 + 852) || (int v127 = *(_DWORD *)(v1 + 152) - (v16 + v17), v127 < 2))
  {
    *(void *)(v1 + 896) = 0;
  }
  else
  {
    unsigned int v128 = v127 + 1;
    do
    {
      sub_213B1C2DC(v1, 32, 1);
      --v128;
    }
    while (v128 > 2);
    sub_213B17FA0(v1, 12);
  }
  sub_213B1C2DC(v1, 0, 0);
  LODWORD(vkill(0, 18) = *(_DWORD *)(v1 + 852);
  *(_DWORD *)(v1 + 86el_set((EditLine *)qword_2677F4398, 15, 0) = v18;
  if ((v18 & 0x80000000) != 0)
  {
    LODWORD(v19) = 0;
    goto LABEL_225;
  }
  int v129 = v5;
  int v130 = v6;
  uint64_t v19 = 0;
  uint64_t v144 = v1;
  do
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)(v1 + 72);
    off_t v22 = *(unsigned __int32 **)(*(void *)(v1 + 64) + 8 * v20);
    uint64_t v146 = v20;
    uint64_t v23 = *(void *)(v21 + 8 * v20);
    unsigned __int32 v24 = *v22;
    if (*v22)
    {
      size_t v25 = *(unsigned __int32 **)(v21 + 8 * v20);
      uint64_t v26 = *(unsigned __int32 **)(*(void *)(v1 + 64) + 8 * v20);
      do
      {
        if (v24 != *v25) {
          break;
        }
        unsigned __int32 v27 = v26[1];
        ++v26;
        unsigned __int32 v24 = v27;
        ++v25;
      }
      while (v27);
    }
    else
    {
      uint64_t v26 = *(unsigned __int32 **)(*(void *)(v1 + 64) + 8 * v20);
      size_t v25 = *(unsigned __int32 **)(v21 + 8 * v20);
    }
    int v28 = v26 - 1;
    uint64_t v29 = 4;
    do
    {
      uint64_t v30 = v29;
      unsigned __int32 v31 = v28[1];
      ++v28;
      v29 += 4;
    }
    while (v31);
    do
    {
      uint64_t v32 = v30;
      uint64_t v33 = (char *)v26 + v30;
      if (v26 >= (unsigned __int32 *)((char *)v26 + v30 - 4)) {
        break;
      }
      v30 -= 4;
    }
    while (*((_DWORD *)v33 - 2) == 32);
    *((_DWORD *)v33 - longjmp(dword_2677F43AC, 1) = 0;
    BOOL v34 = v33 - 4;
    int v35 = v25 - 1;
    uint64_t v36 = 4;
    do
    {
      uint64_t v37 = v36;
      unsigned __int32 v38 = v35[1];
      ++v35;
      v36 += 4;
    }
    while (v38);
    do
    {
      uint64_t v39 = v37;
      int v40 = (char *)v25 + v37;
      if (v25 >= (unsigned __int32 *)((char *)v25 + v37 - 4)) {
        break;
      }
      v37 -= 4;
    }
    while (*((_DWORD *)v40 - 2) == 32);
    *((_DWORD *)v40 - longjmp(dword_2677F43AC, 1) = 0;
    v41 = (unsigned __int32 *)(v40 - 4);
    unsigned __int32 v42 = *v26;
    if (!*v26 && !*v25) {
      goto LABEL_216;
    }
    unint64_t v43 = (unint64_t)v34;
    unint64_t v44 = (unint64_t)v41;
    do
    {
      if (v43 <= (unint64_t)v26) {
        break;
      }
      if (v44 <= (unint64_t)v25) {
        break;
      }
      int v46 = *(_DWORD *)(v43 - 4);
      v43 -= 4;
      int v45 = v46;
      int v47 = *(_DWORD *)(v44 - 4);
      v44 -= 4;
    }
    while (v45 == v47);
    unint64_t v48 = v43 + 4;
    unint64_t v49 = v44 + 4;
    uint64_t v143 = (uint64_t)v22;
    if (v42 && (unint64_t)v25 < v49)
    {
      BOOL v50 = (unsigned __int32 *)(v44 + 4);
      int v51 = (unsigned __int32 *)(v44 + 4);
      int v52 = (unsigned __int32 *)(v43 + 4);
      unsigned __int8 v53 = (unsigned __int32 *)(v43 + 4);
      int v54 = v25;
      do
      {
        if (v42 == *v54)
        {
          int v55 = v26;
          v56 = v54;
          if ((unint64_t)v54 < v49)
          {
            int v55 = v26;
            v56 = v54;
            if ((unint64_t)v26 < v48)
            {
              uint64_t v57 = 0;
              while (1)
              {
                v56 = &v54[v57];
                int v55 = &v26[v57];
                if (v26[v57] != v54[v57]) {
                  break;
                }
                ++v57;
                if ((unint64_t)v56 >= v44 || (unint64_t)v55 >= v43)
                {
                  v56 = &v54[v57];
                  int v55 = &v26[v57];
                  break;
                }
              }
            }
          }
          int64_t v58 = (char *)v56 - (char *)v54;
          uint64_t v59 = ((char *)v56 - (char *)v54) >> 1;
          BOOL v60 = v59 <= v54 - v25;
          if (v59 > v54 - v25) {
            int v61 = v26;
          }
          else {
            int v61 = v53;
          }
          if (v60)
          {
            int v55 = v52;
            int v62 = v51;
          }
          else
          {
            int v62 = v54;
          }
          if (v60) {
            v56 = v50;
          }
          if ((char *)v50 - (char *)v51 < v58)
          {
            unsigned __int8 v53 = v61;
            int v52 = v55;
            int v51 = v62;
            BOOL v50 = v56;
          }
        }
        BOOL v63 = (unint64_t)v54++ >= v44;
      }
      while (!v63);
    }
    else
    {
      unsigned __int8 v53 = (unsigned __int32 *)(v43 + 4);
      int v52 = (unsigned __int32 *)(v43 + 4);
      int v51 = (unsigned __int32 *)(v44 + 4);
      BOOL v50 = (unsigned __int32 *)(v44 + 4);
    }
    if (*v25) {
      BOOL v63 = (unint64_t)v26 >= v48;
    }
    else {
      BOOL v63 = 1;
    }
    if (!v63)
    {
      int v64 = v26;
      do
      {
        if (*v25 == *v64)
        {
          v65 = v25;
          int v66 = (char *)v64;
          if ((unint64_t)v64 < v48)
          {
            v65 = v25;
            int v66 = (char *)v64;
            if ((unint64_t)v25 < v49)
            {
              uint64_t v67 = 0;
              while (1)
              {
                int v66 = (char *)&v64[v67];
                v65 = &v25[v67];
                if (v64[v67] != v25[v67]) {
                  break;
                }
                ++v67;
                if ((unint64_t)v66 >= v43 || (unint64_t)v65 >= v44)
                {
                  int v66 = (char *)&v64[v67];
                  v65 = &v25[v67];
                  break;
                }
              }
            }
          }
          int64_t v68 = v66 - (char *)v64;
          uint64_t v69 = (v66 - (char *)v64) >> 1;
          BOOL v70 = v69 <= v64 - v26;
          if (v69 > v64 - v26) {
            BOOL v71 = v64;
          }
          else {
            BOOL v71 = v53;
          }
          if (v70)
          {
            int v66 = (char *)v52;
            int v72 = v51;
          }
          else
          {
            int v72 = v25;
          }
          if (v70) {
            v65 = v50;
          }
          if ((char *)v52 - (char *)v53 < v68)
          {
            unsigned __int8 v53 = v71;
            int v52 = (unsigned __int32 *)v66;
            int v51 = v72;
            BOOL v50 = v65;
          }
        }
        BOOL v63 = (unint64_t)v64++ >= v43;
      }
      while (!v63);
    }
    uint64_t v73 = (uint64_t)v26 + v32 - v43 - 8;
    if (v73 >= 16) {
      unint64_t v74 = v48;
    }
    else {
      unint64_t v74 = (unint64_t)v34;
    }
    if (v73 >= 16) {
      v75 = (unsigned __int32 *)(v44 + 4);
    }
    else {
      v75 = v41;
    }
    int v76 = ((unint64_t)((char *)v51 - (char *)v25) >> 2) - ((unint64_t)((char *)v53 - (char *)v26) >> 2);
    int v77 = ((unint64_t)((char *)v75 - (char *)v50) >> 2) - ((v74 - (unint64_t)v52) >> 2);
    int v78 = *(_DWORD *)(v1 + 160);
    if ((v78 & 1) == 0)
    {
      if (v76 >= 1)
      {
        unsigned __int8 v53 = (unsigned __int32 *)v74;
        int v52 = (unsigned __int32 *)v74;
        int v51 = v75;
        BOOL v50 = v75;
      }
      if (v77 > 0)
      {
        unint64_t v74 = (unint64_t)v34;
        v75 = v41;
      }
      if ((uint64_t)(v74 - (void)v26) < (char *)v75 - (char *)v25)
      {
        unint64_t v74 = (unint64_t)v34;
        v75 = v41;
      }
    }
    uint64_t v140 = v23;
    if ((v78 & 2) == 0)
    {
      if (v76 < 0)
      {
        unsigned __int8 v53 = (unsigned __int32 *)v74;
        int v52 = (unsigned __int32 *)v74;
        int v51 = v75;
        BOOL v50 = v75;
      }
      if (v77 >= 0) {
        unint64_t v79 = v74;
      }
      else {
        unint64_t v79 = (unint64_t)v34;
      }
      if (v77 < 0) {
        v75 = v41;
      }
      if ((uint64_t)(v79 - (void)v26) <= (char *)v75 - (char *)v25) {
        unint64_t v74 = v79;
      }
      else {
        unint64_t v74 = (unint64_t)v34;
      }
      if ((uint64_t)(v79 - (void)v26) > (char *)v75 - (char *)v25) {
        v75 = v41;
      }
    }
    uint64_t v80 = (char *)v52 - (char *)v53;
    if ((char *)v52 - (char *)v53 >= 16) {
      unint64_t v81 = (unint64_t)v52;
    }
    else {
      unint64_t v81 = v74;
    }
    if ((char *)v52 - (char *)v53 >= 16) {
      int v82 = (char *)v53;
    }
    else {
      int v82 = (char *)v74;
    }
    if ((char *)v52 - (char *)v53 >= 16) {
      v83 = v51;
    }
    else {
      v83 = v75;
    }
    if ((char *)v52 - (char *)v53 >= 16) {
      v84 = v50;
    }
    else {
      v84 = v75;
    }
    v131 = v82;
    unint64_t v133 = v81;
    v136 = v84;
    unint64_t v137 = v83 - v25;
    unint64_t v85 = v137 - ((v82 - (char *)v26) >> 2);
    v141 = (char *)v74;
    uint64_t v134 = v82 - (char *)v26;
    unint64_t v135 = v75 - v84;
    unint64_t v145 = v135 - ((v74 - v81) >> 2);
    sub_213B1EBB0(v144, v146);
    v142 = v83;
    int v139 = v85;
    if (v83 == v25 || (int)v85 < 1)
    {
      if ((v85 & 0x80000000) == 0) {
        goto LABEL_162;
      }
      unint64_t v96 = ((unint64_t)v26 - v143) >> 2;
      sub_213B1ED6C(v144, v96);
      int64_t v87 = v83 - v25;
      if (v34 != v131)
      {
        uint64_t v132 = -v139;
        sub_213B1F124((char *)v144, -v139);
        uint64_t v97 = *(int *)(v144 + 152);
        int v98 = (_DWORD *)(v143 + 4 * (int)v96);
        if ((int)v96 - v139 >= (int)v97)
        {
          uint64_t v100 = v140;
        }
        else
        {
          unint64_t v99 = v143 + 4 * v97;
          uint64_t v100 = v140;
          if ((unint64_t)&v98[v132] < v99)
          {
            do
            {
              *int v98 = v98[v132];
              ++v98;
            }
            while ((unint64_t)&v98[v132] < v99);
          }
          int v98 = (_DWORD *)v99;
        }
        *int v98 = 0;
        sub_213B1EFB0(v144, v25, v137);
        int v90 = v139;
        uint64_t v89 = v100;
        if (v83 != v25)
        {
          uint64_t v119 = v83 - v25;
          int v120 = v25;
          v121 = v26;
          do
          {
            unsigned __int32 v122 = *v120;
            if (!*v120) {
              break;
            }
            ++v120;
            *v121++ = v122;
            --v119;
          }
          while (v119);
          int v90 = v139;
        }
        goto LABEL_163;
      }
      sub_213B1EFB0(v144, v25, v137);
      int v102 = (((unint64_t)v26 + v32 - v143 - 4) >> 2) - (((unint64_t)v25 + v39 - v140 - 4) >> 2);
      if ((v145 & 0x80000000) == 0) {
        unsigned int v103 = v145;
      }
      else {
        unsigned int v103 = -(int)v145;
      }
      if (-v139 > v102) {
        int v102 = -v139;
      }
      if (v103 <= v102) {
        int v104 = v102;
      }
      else {
        int v104 = v103;
      }
      sub_213B1F4D4(v144, v104);
      uint64_t v1 = v144;
    }
    else
    {
      if (v80 >= 16) {
        v86 = (char *)v52;
      }
      else {
        v86 = v141;
      }
      if (v34 != v141) {
        v86 = v34;
      }
      uint64_t v1 = v144;
      if (((uint64_t)&v86[-v143] >> 2) + v85 > *(int *)(v144 + 152))
      {
LABEL_162:
        int v90 = 0;
        uint64_t v89 = v140;
        int64_t v87 = v137;
LABEL_163:
        uint64_t v1 = v144;
        if ((v145 & 0x80000000) != 0)
        {
          uint64_t v94 = ((uint64_t)(v133 - v143) >> 2) + v90;
          if (v94 < *(int *)(v144 + 152))
          {
            uint64_t v95 = v89;
            int v138 = v90;
            sub_213B1ED6C(v144, v94);
            if (v34 == v141)
            {
              sub_213B1EFB0(v144, v136, v135);
              unsigned int v105 = (((unint64_t)v26 + v32 - v143 - 4) >> 2) - (((unint64_t)v25 + v39 - v95 - 4) >> 2);
              if (v138 >= 0) {
                int v106 = v138;
              }
              else {
                int v106 = -v138;
              }
              if (v106 > (int)v105) {
                unsigned int v105 = v106;
              }
              if (-(int)v145 > v105) {
                int v107 = -(int)v145;
              }
              else {
                int v107 = v105;
              }
              sub_213B1F4D4(v144, v107);
              uint64_t v89 = v95;
              int v90 = v138;
            }
            else
            {
              sub_213B1F124((char *)v144, -(int)v145);
              sub_213B1EFB0(v144, v136, v135);
              int v90 = v138;
              uint64_t v89 = v95;
            }
          }
        }
        if (v142 != v25 && v87 >= v134 >> 2 && !v90)
        {
          uint64_t v108 = v89;
          sub_213B1ED6C(v144, ((unint64_t)v25 - v89) >> 2);
          if (v41 == v142)
          {
            sub_213B1EFB0(v144, v25, v87);
            uint64_t v89 = v108;
            if (v39 != 4)
            {
              do
              {
                unsigned __int32 v115 = *v25;
                if (!*v25) {
                  break;
                }
                ++v25;
                *v26++ = v115;
                --v87;
              }
              while (v87);
            }
          }
          else
          {
            int v109 = v139;
            if (v139 >= 1)
            {
              sub_213B1F298(v144, v25, v139);
              sub_213B1D640(v143, ((unint64_t)v26 - v143) >> 2, *(_DWORD *)(v144 + 152), (int *)v25, v139);
              int v109 = v139;
            }
            unint64_t v110 = v87 - v109;
            v111 = &v25[v109];
            sub_213B1EFB0(v144, v111, v110);
            uint64_t v89 = v108;
            if (v110)
            {
              size_t v112 = &v26[v139];
              int64_t v113 = v139 - v87;
              do
              {
                unsigned __int32 v114 = *v111;
                if (!*v111) {
                  break;
                }
                ++v111;
                *v112++ = v114;
                BOOL v63 = __CFADD__(v113++, 1);
              }
              while (!v63);
            }
          }
        }
        if ((v145 & 0x80000000) == 0)
        {
          sub_213B1ED6C(v144, ((unint64_t)v136 - v89) >> 2);
          if (v34 == v141)
          {
            uint64_t v118 = v144;
            v116 = v136;
            unint64_t v117 = v135;
          }
          else
          {
            if (v145) {
              sub_213B1F298(v144, v136, v145);
            }
            v116 = &v136[v145];
            unint64_t v117 = v135 - v145;
            uint64_t v118 = v144;
          }
          sub_213B1EFB0(v118, v116, v117);
        }
        goto LABEL_216;
      }
      sub_213B1ED6C(v144, ((unint64_t)v25 - v140) >> 2);
      int64_t v87 = v137;
      if (v41 != v142)
      {
        sub_213B1F298(v144, v25, v139);
        sub_213B1D640(v143, ((unint64_t)v26 - v143) >> 2, *(_DWORD *)(v144 + 152), (int *)v25, v139);
        size_t v88 = &v25[v139];
        sub_213B1EFB0(v144, v88, v137 - v139);
        uint64_t v89 = v140;
        int v90 = v139;
        if (v137 != v139)
        {
          int v91 = &v26[v139];
          unint64_t v92 = v139 - v137;
          do
          {
            unsigned __int32 v93 = *v88;
            if (!*v88) {
              break;
            }
            ++v88;
            *v91++ = v93;
            BOOL v63 = __CFADD__(v92++, 1);
          }
          while (!v63);
          int v90 = v139;
        }
        goto LABEL_163;
      }
      sub_213B1EFB0(v144, v25, v137);
      if (v39 != 4)
      {
        do
        {
          unsigned __int32 v101 = *v25;
          if (!*v25) {
            break;
          }
          ++v25;
          *v26++ = v101;
          --v87;
        }
        while (v87);
      }
    }
LABEL_216:
    sub_213B1D020(*(char **)(*(void *)(v1 + 64) + 8 * v146), *(void *)(*(void *)(v1 + 72) + 8 * v146), *(int *)(v1 + 152));
    uint64_t v19 = v146 + 1;
    uint64_t v18 = *(int *)(v1 + 860);
  }
  while (v146 < v18);
  int v5 = v129;
  int v6 = v130;
LABEL_225:
  int v123 = *(_DWORD *)(v1 + 856);
  if (v123 > (int)v18 && (int)v19 <= v123)
  {
    uint64_t v124 = v19;
    do
    {
      sub_213B1EBB0(v1, v124);
      sub_213B1ED6C(v1, 0);
      int v125 = wcslen(*(const __int32 **)(*(void *)(v1 + 64) + 8 * v124));
      sub_213B1F4D4(v1, v125);
      **(_DWORD **)(*(void *)(v1 + 64) + 8 * v124++) = 0;
    }
    while (*(_DWORD *)(v1 + 856) > (int)v124 - 1);
    LODWORD(vkill(0, 18) = *(_DWORD *)(v1 + 860);
  }
  *(_DWORD *)(v1 + 856) = v18;
  sub_213B1EBB0(v1, v5);
  return sub_213B1ED6C(v1, v6);
}

void sub_213B1D020(char *__b, uint64_t a2, unint64_t a3)
{
  unint64_t v4 = 0;
  if (a3)
  {
    while (1)
    {
      int v5 = *(_DWORD *)(a2 + 4 * v4);
      if (!v5) {
        break;
      }
      *(_DWORD *)__b = v5;
      __b += 4;
      if (a3 == ++v4) {
        goto LABEL_7;
      }
    }
  }
  unint64_t v6 = a3 - v4;
  if (a3 > v4)
  {
    memset_pattern16(__b, &unk_213B27440, 4 * v6);
    __b += 4 * v6;
  }
LABEL_7:
  *(_DWORD *)__b = 0;
}

uint64_t sub_213B1D088(uint64_t a1)
{
  sub_213B1EBB0(a1, *(_DWORD *)(a1 + 856));
  sub_213B1F0BC(a1, 0xAu);
  *(_DWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  if (*(int *)(a1 + 156) >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *(void *)(a1 + 64);
    do
      **(_DWORD **)(v3 + 8 * v2++) = 0;
    while (v2 < *(int *)(a1 + 156));
  }
  *(_DWORD *)(a1 + 856) = 0;

  return sub_213B20308(a1);
}

uint64_t sub_213B1D104(uint64_t result)
{
  *(_DWORD *)(result + 52) = 0;
  *(_DWORD *)(result + 56) = 0;
  if (*(int *)(result + 156) >= 1)
  {
    uint64_t v1 = 0;
    uint64_t v2 = *(void *)(result + 64);
    do
      **(_DWORD **)(v2 + 8 * v1++) = 0;
    while (v1 < *(int *)(result + 156));
  }
  *(_DWORD *)(result + 856) = 0;
  return result;
}

uint64_t sub_213B1D13C(uint64_t a1)
{
  unint64_t v3 = *(void *)(a1 + 96);
  unint64_t v2 = *(void *)(a1 + 104);
  if (v3 >= v2)
  {
    unint64_t v3 = *(void *)(a1 + 104);
    if (*(void *)(a1 + 1064) == *(void *)(a1 + 1048))
    {
      if (v2 == *(void *)(a1 + 88)) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = -1;
      }
      unint64_t v3 = v2 + 4 * v4;
    }
    *(void *)(a1 + 96) = v3;
  }
  int v5 = *(_DWORD *)(a1 + 872);
  int v6 = *(_DWORD *)(a1 + 876);
  int v7 = *(_DWORD *)(a1 + 152);
  unsigned int v8 = *(__darwin_ct_rune_t **)(a1 + 88);
  if ((unint64_t)v8 < v3)
  {
    do
    {
      int v9 = sub_213B23DE4(*v8);
      if (v9 == -3)
      {
        signed int v10 = 0;
        ++v6;
      }
      else if (v9 == -2)
      {
        signed int v10 = v5 - (v5 | 0xFFFFFFF8);
      }
      else
      {
        int v11 = wcwidth(*v8);
        if (v11 <= 1) {
          unsigned int v12 = 1;
        }
        else {
          unsigned int v12 = v11;
        }
        int v13 = v12 > 1 && (int)(v12 + v5) > v7;
        if (v13) {
          int v5 = 0;
        }
        v6 += v13;
        signed int v10 = v5 + sub_213B23D40(*v8);
      }
      if (v10 < v7) {
        int v14 = 0;
      }
      else {
        int v14 = v7;
      }
      if (v10 >= v7) {
        ++v6;
      }
      int v5 = v10 - v14;
      ++v8;
    }
    while ((unint64_t)v8 < *(void *)(a1 + 96));
    unint64_t v2 = *(void *)(a1 + 104);
  }
  if ((unint64_t)v8 < v2)
  {
    int v15 = wcwidth(*v8);
    if (v15 <= 1) {
      unsigned int v16 = 1;
    }
    else {
      unsigned int v16 = v15;
    }
    int v17 = v16 > 1 && (int)(v16 + v5) > v7;
    if (v17) {
      int v5 = 0;
    }
    v6 += v17;
  }
  sub_213B1EBB0(a1, v6);
  sub_213B1ED6C(a1, v5);

  return sub_213B20308(a1);
}

uint64_t sub_213B1D2AC(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(unsigned int *)(v2 - 4);
  if (v3 == 9
    || v2 != *(void *)(a1 + 104)
    || ((v4 = *(_DWORD *)(a1 + 896)) != 0 ? (BOOL v5 = *(_DWORD *)(a1 + 152) - (*(_DWORD *)(a1 + 52) + v4) <= 2) : (BOOL v5 = 0),
        v5))
  {
    return sub_213B1C450(a1);
  }
  else
  {
    switch(sub_213B23DE4(v3))
    {
      case 0xFFFFFFFC:
      case 0xFFFFFFFF:
        uint64_t v6 = sub_213B23C1C(v11, 8uLL, v3);
        if (v6 >= 1)
        {
          uint64_t v7 = v6;
          unsigned int v8 = v11;
          do
          {
            unsigned __int32 v9 = *v8++;
            sub_213B1D418(a1, v9);
            --v7;
          }
          while (v7);
        }
        break;
      case 0xFFFFFFFD:
      case 0u:
        sub_213B1D418(a1, v3);
        break;
      default:
        return sub_213B20308(a1);
    }
    return sub_213B20308(a1);
  }
}

uint64_t sub_213B1D418(uint64_t a1, unsigned __int32 a2)
{
  int v4 = wcwidth(a2);
  if (v4 <= 1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = v4;
  }
  if (v5 >= 2)
  {
    while ((signed int)(*(_DWORD *)(a1 + 52) + v5) > *(_DWORD *)(a1 + 152))
      sub_213B1D418(a1, 32);
  }
  uint64_t result = sub_213B1F0BC(a1, a2);
  uint64_t v7 = *(_DWORD ***)(a1 + 64);
  uint64_t v8 = *(int *)(a1 + 52);
  unsigned __int32 v9 = v7[*(int *)(a1 + 56)];
  *(_DWORD *)(a1 + 52) = v8 + 1;
  v9[v8] = a2;
  if (v5 >= 2)
  {
    int v10 = v5 + 1;
    do
    {
      uint64_t v11 = *(int *)(a1 + 52);
      uint64_t v12 = v7[*(int *)(a1 + 56)];
      *(_DWORD *)(a1 + 52) = v11 + 1;
      v12[v11] = -1;
      --v10;
    }
    while (v10 > 2);
  }
  if (*(_DWORD *)(a1 + 52) >= *(_DWORD *)(a1 + 152))
  {
    *(_DWORD *)(a1 + 52) = 0;
    int v13 = *(_DWORD *)(a1 + 56) + 1;
    uint64_t v14 = *(unsigned int *)(a1 + 156);
    if (v13 >= (int)v14)
    {
      int v15 = *v7;
      if ((int)v14 < 2)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = 0;
        do
        {
          *(void *)(*(void *)(a1 + 64) + 8 * v16) = *(void *)(*(void *)(a1 + 64) + 8 * v16 + 8);
          ++v16;
        }
        while (v14 - 1 != v16);
        uint64_t v7 = *(_DWORD ***)(a1 + 64);
      }
      *int v15 = 0;
      v7[v16] = v15;
    }
    else
    {
      *(_DWORD *)(a1 + 56) = v13;
      ++*(_DWORD *)(a1 + 856);
    }
    int v17 = *(_DWORD *)(a1 + 160);
    if ((v17 & 0x80) != 0)
    {
      if ((v17 & 0x100) == 0) {
        return result;
      }
      unsigned __int32 v18 = 8;
      unsigned __int32 v19 = 32;
    }
    else
    {
      unsigned __int32 v18 = 10;
      unsigned __int32 v19 = 13;
    }
    sub_213B1F0BC(a1, v19);
    return sub_213B1F0BC(a1, v18);
  }
  return result;
}

uint64_t sub_213B1D5A4(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 856);
  if ((*(unsigned char *)(result + 160) & 4) != 0)
  {
    if ((v2 & 0x80000000) == 0)
    {
      do
      {
        sub_213B1EBB0(v1, v2);
        sub_213B1ED6C(v1, 0);
        uint64_t result = sub_213B1F4D4(v1, *(_DWORD *)(v1 + 152));
        --v2;
      }
      while (v2 != -1);
    }
  }
  else
  {
    sub_213B1EBB0(result, *(_DWORD *)(result + 856));
    sub_213B1F0BC(v1, 0xDu);
    return sub_213B1F0BC(v1, 0xAu);
  }
  return result;
}

uint64_t sub_213B1D640(uint64_t result, int a2, int a3, int *a4, unsigned int a5)
{
  LODWORD(v5) = a3 - a2;
  if (a3 - a2 >= (int)a5) {
    uint64_t v5 = a5;
  }
  else {
    uint64_t v5 = v5;
  }
  if ((int)v5 >= 1)
  {
    uint64_t v6 = (_DWORD *)(result + 4 * a3);
    uint64_t v7 = v6 - 1;
    unint64_t v8 = result + 4 * a2;
    if ((unint64_t)&v6[-v5 - 1] >= v8)
    {
      do
      {
        *uint64_t v7 = v7[-v5];
        --v7;
      }
      while ((unint64_t)&v7[-v5] >= v8);
    }
    _DWORD *v6 = 0;
    if (a3 > a2)
    {
      unint64_t v9 = result + 4 * a2 + 4;
      do
      {
        int v10 = *a4++;
        *(_DWORD *)(v9 - 4) = v10;
        if (v9 >= (unint64_t)v6) {
          break;
        }
        v9 += 4;
        BOOL v11 = v5 > 1;
        LODWORD(v5) = v5 - 1;
      }
      while (v11);
    }
  }
  return result;
}

uint64_t sub_213B1D6C4(uint64_t a1)
{
  int v2 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
  *(void *)(a1 + 1216) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *(void *)(a1 + 1224) = 0;
  *(_DWORD *)(a1 + 124el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
  *(void *)(a1 + 1232) = 0x1FFFFFFFFLL;
  *(unsigned char *)(a1 + 1244) = 0;
  return result;
}

void sub_213B1D728(uint64_t a1)
{
  *(void *)(a1 + 1216) = 0;
}

uint64_t sub_213B1D754(__int32 *a1, __int32 *a2)
{
  if (wcsstr(a1, a2)) {
    return 1;
  }
  memset(&v8, 0, sizeof(v8));
  uint64_t v5 = sub_213B23790((unsigned __int32 *)a2, (uint64_t)&unk_2677F50F8);
  BOOL v4 = 0;
  if (!regcomp(&v8, (const char *)v5, 0))
  {
    uint64_t v6 = sub_213B23790((unsigned __int32 *)a1, (uint64_t)&unk_2677F50F8);
    BOOL v4 = regexec(&v8, (const char *)v6, 0, 0, 0) == 0;
    MEMORY[0x2166907B0](&v8);
  }
  return v4;
}

uint64_t sub_213B1D7FC(uint64_t a1, __int32 *a2)
{
  return sub_213B1D754(a2, *(__int32 **)(a1 + 1216));
}

size_t sub_213B1D80C(size_t result)
{
  if ((*(unsigned char *)(result + 136) & 0xFE) != 0x16)
  {
    size_t v1 = result;
    BOOL v2 = *(_DWORD *)(result + 1096) == 1 && *(void *)(result + 1064) == *(void *)(result + 1048);
    unint64_t v3 = *(const __int32 **)(result + 88);
    uint64_t v4 = *(void *)(result + 96) + 4 * v2 - (void)v3;
    if ((unint64_t)v4 <= 0xFFC) {
      size_t v5 = v4 >> 2;
    }
    else {
      size_t v5 = 1023;
    }
    *(void *)(result + 1224) = v5;
    uint64_t v6 = *(__int32 **)(result + 1216);
    if (v5)
    {
      uint64_t result = (size_t)wcsncpy(v6, v3, v5);
      *(_DWORD *)(*(void *)(v1 + 1216) + 4 * *(void *)(v1 + 1224)) = 0;
    }
    else
    {
      uint64_t result = wcslen(v6);
      *(void *)(v1 + 1224) = result;
    }
  }
  return result;
}

uint64_t sub_213B1D8A8(size_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 1224);
  if ((unint64_t)(*(void *)(a1 + 104) + 4 * v2 + 24) >= *(void *)(a1 + 112)) {
    return 6;
  }
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v5 = -1;
  if (a2 != 23) {
    uint64_t v5 = 1;
  }
  uint64_t v65 = v5;
  char v6 = byte_2677F5118;
  int v7 = *(_DWORD *)(a1 + 1176);
  if (a2 == 23) {
    int v8 = 0;
  }
  else {
    int v8 = 0x7FFFFFFF;
  }
  int v64 = v8;
  uint64_t v9 = 88;
  if (a2 == 23) {
    uint64_t v9 = 104;
  }
  uint64_t v63 = v9;
  int v66 = a2;
  __int32 v67 = 0;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t v11 = *(void *)(a1 + 1224);
    if (!v11)
    {
      byte_2677F5118 = 0;
      uint64_t v12 = *(void **)(a1 + 1216);
      *(void *)(a1 + 1224) = 2;
      *uint64_t v12 = 0x2A0000002ELL;
      uint64_t v11 = 2;
    }
    int v13 = *(_DWORD **)(a1 + 104);
    *int v13 = 10;
    uint64_t v14 = v13 + 1;
    int v15 = (int *)&unk_213B27470;
    if (v10 != 23) {
      int v15 = (int *)&unk_213B27460;
    }
    int v16 = *v15;
    if (*v15)
    {
      int v17 = v15 + 1;
      do
      {
        *v14++ = v16;
        int v18 = *v17++;
        int v16 = v18;
      }
      while (v18);
    }
    if (byte_2677F5118) {
      int v19 = 63;
    }
    else {
      int v19 = 58;
    }
    *uint64_t v14 = v19;
    uint64_t v20 = v14 + 1;
    *(void *)(a1 + 104) = v20;
    if (v11 >= 3)
    {
      uint64_t v21 = *(void *)(a1 + 1216);
      unint64_t v22 = v21 + 4 * v11;
      uint64_t v23 = (int *)(v21 + 8);
      do
      {
        int v24 = *v23++;
        *v20++ = v24;
      }
      while ((unint64_t)v23 < v22);
      *(void *)(a1 + 104) = v20;
    }
    *uint64_t v20 = 0;
    sub_213B1C450(a1);
    if (el_wgetc((EditLine *)a1, &v67) != 1) {
      return sub_213B11718(a1);
    }
    __int32 v25 = v67;
    unsigned int v26 = *(unsigned __int8 *)(*(void *)(a1 + 1064) + v67);
    if (v26 > 0x27)
    {
      if (v26 != 40)
      {
        if (v26 == 43)
        {
          uint64_t v31 = 0;
          int v32 = 0;
          char v33 = 1;
          uint64_t v10 = 22;
        }
        else
        {
          if (v26 != 44) {
            goto LABEL_42;
          }
          uint64_t v31 = 0;
          int v32 = 0;
          char v33 = 1;
          uint64_t v10 = 23;
        }
        goto LABEL_56;
      }
    }
    else if (v26 != 4)
    {
      if (v26 == 6 || v26 == 8)
      {
        unint64_t v28 = *(void *)(a1 + 1224);
        if (v28 >= 0x3FE)
        {
LABEL_54:
          el_beep_0((EditLine *)a1);
          goto LABEL_55;
        }
        uint64_t v29 = *(void *)(a1 + 1216);
        *(void *)(a1 + 1224) = v28 + 1;
        *(_DWORD *)(v29 + 4 * v28) = v25;
        uint64_t v30 = *(void **)(a1 + 104);
        *uint64_t v30 = v67;
        *(void *)(a1 + 104) = (char *)v30 + 4;
      }
      else
      {
LABEL_42:
        if (v67 == 7)
        {
          char v33 = 0;
          int v32 = 1;
          uint64_t v31 = 6;
          goto LABEL_56;
        }
        if (v67 == 27) {
          goto LABEL_107;
        }
        if (v67 != 23)
        {
          dword_2677F511C[0] = v67;
          el_wpush((EditLine *)a1, dword_2677F511C);
LABEL_107:
          char v33 = 0;
          int v32 = 1;
          uint64_t v31 = 4;
          goto LABEL_56;
        }
        uint64_t v34 = *(void *)(a1 + 1224);
        if (v34 >= 3)
        {
          uint64_t v35 = *(void *)(a1 + 1216);
          unint64_t v36 = v35 + 4 * v34;
          uint64_t v37 = (int *)(v35 + 8);
          while (!memchr("*[]?", *v37, 5uLL))
          {
            if ((unint64_t)++v37 >= v36) {
              goto LABEL_49;
            }
          }
          goto LABEL_54;
        }
LABEL_49:
        unint64_t v38 = *(void *)(a1 + 104);
        uint64_t v39 = (unsigned int *)(*(void *)(a1 + 96) + 4 * v34 - 12);
        *(void *)(a1 + 96) = v39;
        int v40 = sub_213B10E58(v39, v38, 1, (unsigned int (*)(void))sub_213B10C98);
        v41 = *(unsigned int **)(a1 + 96);
        while (v41 < v40)
        {
          unsigned int v42 = *v41;
          if (*v41 == 10) {
            break;
          }
          unint64_t v43 = *(void *)(a1 + 1224);
          if (v43 >= 0x3FE)
          {
            el_beep_0((EditLine *)a1);
            break;
          }
          uint64_t v44 = *(void *)(a1 + 1216);
          *(void *)(a1 + 1224) = v43 + 1;
          *(_DWORD *)(v44 + 4 * v43) = v42;
          int v45 = *v41++;
          int v46 = *(_DWORD **)(a1 + 104);
          *int v46 = v45;
          *(void *)(a1 + 96) = v41;
          *(void *)(a1 + 104) = v46 + 1;
        }
        *(void *)(a1 + 96) = v4;
        **(_DWORD **)(a1 + 104) = 0;
      }
      sub_213B1C450(a1);
LABEL_55:
      uint64_t v31 = 0;
      int v32 = 0;
      char v33 = 0;
      goto LABEL_56;
    }
    if (*(void *)(a1 + 1224) <= 2uLL) {
      goto LABEL_54;
    }
    uint64_t v31 = 0;
    char v33 = 0;
    int v32 = 1;
LABEL_56:
    unint64_t v47 = *(void *)(a1 + 88);
    for (size_t i = *(_DWORD **)(a1 + 104); (unint64_t)i > v47 && *i != 10; *(void *)(a1 + 104) = i)
      *i-- = 0;
    _DWORD *i = 0;
    if (v32) {
      goto LABEL_94;
    }
    uint64_t v49 = *(void *)(a1 + 1216);
    unint64_t v50 = *(void *)(a1 + 1224);
    __int32 v67 = 93;
    uint64_t v51 = v50 - 1;
    while (v51 >= 2)
    {
      __int32 v52 = *(_DWORD *)(v49 + 4 * v51);
      if (v52 != 93)
      {
        --v51;
        if (v52 != 91) {
          continue;
        }
      }
      __int32 v67 = v52;
      goto LABEL_67;
    }
    __int32 v52 = 93;
LABEL_67:
    if (v50 >= 3 && v52 != 91)
    {
      if (v10 != v66) {
        char v33 = 0;
      }
      if (v33)
      {
        if (byte_2677F5118 == 1)
        {
          *(_DWORD *)(a1 + 1176) = v64;
          if (sub_213B14AA8(a1) == 6) {
            sub_213B14AA8(a1);
          }
          unint64_t v53 = *(void *)(a1 + v63);
          *(void *)(a1 + 96) = v53;
          uint64_t v49 = *(void *)(a1 + 1216);
          unint64_t v50 = *(void *)(a1 + 1224);
          unint64_t v47 = *(void *)(a1 + 88);
        }
        else
        {
          unint64_t v53 = *(void *)(a1 + 96) + 4 * v65;
          *(void *)(a1 + 96) = v53;
        }
      }
      else
      {
        unint64_t v53 = *(void *)(a1 + 96);
      }
      uint64_t v54 = 4 * v50;
      unint64_t v55 = v50 + 2;
      *(void *)(a1 + 1224) = v55;
      *(void *)(v49 + v54) = 0x2A0000002ELL;
      *(_DWORD *)(v49 + 4 * v55) = 0;
      if (v53 < v47 || v53 > *(void *)(a1 + 104) || sub_213B1DE90((void *)a1, v10) == 6)
      {
        *(unsigned char *)(a1 + 136) = v10;
        if (v10 == 23) {
          int v56 = sub_213B11FF8(a1);
        }
        else {
          int v56 = sub_213B12210(a1);
        }
        if (v56 == 6)
        {
          uint64_t v57 = *(void *)(a1 + 1224) - 2;
          *(void *)(a1 + 1224) = v57;
          *(_DWORD *)(*(void *)(a1 + 1216) + 4 * v57) = 0;
          el_beep_0((EditLine *)a1);
          if (*(_DWORD *)(a1 + 1176) != v7)
          {
            *(_DWORD *)(a1 + 1176) = v7;
            if (sub_213B14AA8(a1) == 6) {
              return 6;
            }
          }
          *(void *)(a1 + 96) = v4;
          char v58 = 1;
          goto LABEL_92;
        }
        uint64_t v59 = 88;
        if (v10 == 23) {
          uint64_t v59 = 104;
        }
        *(void *)(a1 + 96) = *(void *)(a1 + v59);
        sub_213B1DE90((void *)a1, v10);
      }
      char v58 = 0;
      uint64_t v60 = *(void *)(a1 + 1224) - 2;
      *(void *)(a1 + 1224) = v60;
      *(_DWORD *)(*(void *)(a1 + 1216) + 4 * v6el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
LABEL_92:
      byte_2677F5118 = v58;
    }
    uint64_t v31 = sub_213B1D8A8(a1, v10);
    if (!((v31 != 6 || (byte_2677F5118 & 1) == 0) | v6 & 1))
    {
      int v61 = 0;
      uint64_t v31 = 0;
      goto LABEL_100;
    }
LABEL_94:
    if (v31)
    {
      if (v2 || v31 != 6) {
        return v31;
      }
      int v61 = 1;
    }
    else
    {
      int v61 = 0;
    }
LABEL_100:
    byte_2677F5118 = v6;
    *(void *)(a1 + 1224) = v2;
    if (*(_DWORD *)(a1 + 1176) != v7)
    {
      *(_DWORD *)(a1 + 1176) = v7;
      if (sub_213B14AA8(a1) == 6) {
        return 6;
      }
    }
    *(void *)(a1 + 96) = v4;
    if (v61) {
      break;
    }
    if (v32) {
      return v31;
    }
  }
  sub_213B1C450(a1);
  return 6;
}

uint64_t sub_213B1DE90(void *a1, int a2)
{
  unint64_t v3 = (__int32 *)a1[12];
  uint64_t v4 = a1[152];
  __int32 v7 = *(_DWORD *)(v4 + 4);
  uint64_t v5 = (__int32 *)(v4 + 4);
  __int32 v6 = v7;
  *uint64_t v5 = 94;
  if (a2 == 23)
  {
    while ((unint64_t)v3 >= a1[11])
    {
      if (sub_213B1D754(v3, v5)) {
        goto LABEL_10;
      }
      --v3;
    }
  }
  else if (*v3)
  {
    while ((unint64_t)v3 < a1[14])
    {
      if (sub_213B1D754(v3, v5))
      {
LABEL_10:
        uint64_t result = 0;
        *uint64_t v5 = v6;
        a1[12] = v3;
        return result;
      }
      __int32 v8 = v3[1];
      ++v3;
      if (!v8) {
        break;
      }
    }
  }
  *uint64_t v5 = v6;
  return 6;
}

uint64_t sub_213B1DF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x270FA5388](a1, a2);
  int v4 = v3;
  size_t v5 = v2;
  v22[511] = *MEMORY[0x263EF8340];
  *(void *)uint64_t v21 = 0x2A0000002ELL;
  *(_DWORD *)(v2 + 1232) = v3;
  if (v3 == 23) {
    __int32 v6 = (__int32 *)&unk_213B27480;
  }
  else {
    __int32 v6 = (__int32 *)&unk_213B2748C;
  }
  int v7 = sub_213B11550(v2, (uint64_t)v22, v6);
  if (v7 == -1) {
    return 4;
  }
  __int32 v8 = &v21[v7];
  __int32 v11 = v8[2];
  uint64_t v9 = v8 + 2;
  __int32 v10 = v11;
  *uint64_t v9 = 0;
  if (v7)
  {
    uint64_t v12 = v7 + 4;
    *(void *)uint64_t v9 = 0x2A0000002ELL;
    v21[v12] = 0;
    wcsncpy(*(__int32 **)(v5 + 1216), v21, 0x3FFuLL);
    *(void *)(v5 + 1224) = v12;
  }
  else
  {
    if (!*(void *)(v5 + 1224)) {
      goto LABEL_17;
    }
    int v16 = *(const __int32 **)(v5 + 1216);
    if ((*v16 | 4) != 0x2E)
    {
      wcsncpy(v21, v16, 0x3FFuLL);
      uint64_t v17 = *(void *)(v5 + 1216);
      *(void *)uint64_t v17 = 0x2A0000002ELL;
      wcsncpy((__int32 *)(v17 + 8), v21, 0x3FDuLL);
      uint64_t v18 = *(void *)(v5 + 1224);
      uint64_t v19 = *(void *)(v5 + 1216);
      uint64_t v20 = v19 + 4 * v18;
      v18 += 3;
      *(void *)(v5 + 1224) = v18;
      *(void *)(v20 + 4) = 0x2A0000002ELL;
      *(_DWORD *)(v19 + 4 * vkill(0, 18) = 0;
    }
  }
  *(unsigned char *)(v5 + 136) = v4;
  uint64_t v13 = *(void *)(v5 + 88);
  *(void *)(v5 + 96) = v13;
  *(void *)(v5 + 104) = v13;
  if (v4 == 23) {
    int v14 = sub_213B11FF8(v5);
  }
  else {
    int v14 = sub_213B12210(v5);
  }
  if (v14 != 6)
  {
    if (v10 == 27)
    {
      sub_213B1C450(v5);
      return sub_213B11E04(v5);
    }
    return 4;
  }
LABEL_17:
  sub_213B1C450(v5);
  return 6;
}

uint64_t sub_213B1E100(size_t a1, int a2)
{
  *(unsigned char *)(a1 + 136) = a2;
  *(void *)(a1 + 104) = *(void *)(a1 + 88);
  if (a2 == 23) {
    return sub_213B11FF8(a1);
  }
  if (a2 == 22) {
    return sub_213B12210(a1);
  }
  return 6;
}

uint64_t sub_213B1E134(EditLine *a1, int a2, __int32 a3, int a4, int a5)
{
  if (!a3) {
    return 6;
  }
  if (a3 == -1)
  {
    __int32 v16 = 0;
    if (el_wgetc(a1, &v16) != 1) {
      return sub_213B11718((uint64_t)a1);
    }
    a3 = v16;
  }
  *((_DWORD *)a1 + 31el_set((EditLine *)qword_2677F4398, 15, 0) = a3;
  *((_DWORD *)a1 + 309) = a2;
  *((unsigned char *)a1 + 1244) = a5;
  uint64_t v9 = (__int32 *)*((void *)a1 + 12);
  if (a4)
  {
    unint64_t v10 = *((void *)a1 + 13);
    __int32 v11 = *v9;
LABEL_7:
    if (v11 == a3) {
      uint64_t v12 = a2;
    }
    else {
      uint64_t v12 = 0;
    }
    v9 += v12;
    if ((unint64_t)v9 < v10)
    {
      --a4;
      while ((unint64_t)v9 >= *((void *)a1 + 11))
      {
        if (*v9 == a3)
        {
          __int32 v11 = a3;
          if (a4) {
            goto LABEL_7;
          }
          goto LABEL_17;
        }
        v9 += a2;
        if ((unint64_t)v9 >= v10) {
          return 6;
        }
      }
    }
    return 6;
  }
  else
  {
LABEL_17:
    if (a5) {
      uint64_t v13 = -(uint64_t)a2;
    }
    else {
      uint64_t v13 = 0;
    }
    int v14 = &v9[v13];
    *((void *)a1 + 12) = v14;
    if (*((_DWORD *)a1 + 250))
    {
      if (a2 >= 1) {
        *((void *)a1 + 12) = v14 + 1;
      }
      sub_213B1107C((uint64_t)a1);
      return 4;
    }
    else
    {
      return 5;
    }
  }
}

uint64_t sub_213B1E264(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x78uLL, 0x1080040455F1686uLL);
  *(void *)(a1 + 1248) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  sigset_t v6 = 0;
  *((_DWORD *)v2 + 28) = 134627335;
  sigprocmask(1, (const sigset_t *)v2 + 28, &v6);
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(a1 + 1248);
  do
  {
    *(void *)(v4 + v3) = -1;
    uint64_t v4 = *(void *)(a1 + 1248);
    *(void *)(v4 + v3 + 8) = 0;
    v3 += 16;
  }
  while (v3 != 112);
  sigprocmask(3, &v6, 0);
  return 0;
}

void sub_213B1E310(uint64_t a1)
{
  *(void *)(a1 + 1248) = 0;
}

uint64_t sub_213B1E33C(uint64_t a1)
{
  sigset_t v8 = 0;
  v7.__sigaction_u.__sa_handler = 0;
  *(void *)&v7.sa_mask = 0;
  v6.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_213B1E404;
  *(void *)&v6.sa_mask = 0;
  sigprocmask(1, (const sigset_t *)(*(void *)(a1 + 1248) + 112), &v8);
  uint64_t v2 = 0;
  qword_2677F5128 = a1;
  uint64_t v3 = dword_213B27498;
  do
  {
    int v4 = *v3++;
    if (sigaction(v4, &v6, &v7) != -1 && (uint64_t (*)(int))v7.__sigaction_u.__sa_handler != sub_213B1E404) {
      *(sigaction *)(*(void *)(a1 + 1248) + v2) = v7;
    }
    v2 += 16;
  }
  while (v2 != 112);
  return sigprocmask(3, &v8, 0);
}

uint64_t sub_213B1E404(int a1)
{
  sigset_t v2 = 1 << (a1 - 1);
  if (a1 > 32) {
    sigset_t v2 = 0;
  }
  sigset_t v7 = 0;
  sigset_t v8 = v2;
  sigprocmask(1, &v8, &v7);
  uint64_t v3 = (EditLine *)qword_2677F5128;
  *(_DWORD *)(*(void *)(qword_2677F5128 + 1248) + 116) = a1;
  if (a1 == 28)
  {
    el_resize(v3);
  }
  else if (a1 == 19)
  {
    sub_213B21970((uint64_t)v3);
    if (sub_213B11EC8() == 4) {
      sub_213B1C450(qword_2677F5128);
    }
    sub_213B20308(qword_2677F5128);
  }
  else
  {
    sub_213B21E68((uint64_t)v3);
  }
  for (uint64_t i = 0; i != 7; ++i)
  {
    if (dword_213B27498[i] == a1) {
      break;
    }
  }
  sigaction(a1, (const sigaction *)(*(void *)(qword_2677F5128 + 1248) + 16 * i), 0);
  uint64_t v5 = qword_2677F5128;
  *(void *)(*(void *)(qword_2677F5128 + 1248) + 16 * i) = -1;
  *(void *)(*(void *)(v5 + 1248) + 16 * i + 8) = 0;
  sigprocmask(3, &v7, 0);
  return kill(0, a1);
}

uint64_t sub_213B1E52C(uint64_t a1)
{
  sigset_t v8 = 0;
  sigprocmask(1, (const sigset_t *)(*(void *)(a1 + 1248) + 112), &v8);
  uint64_t v2 = 0;
  int v3 = 2;
  int v4 = &dword_213B2749C;
  do
  {
    uint64_t v5 = (const sigaction *)(*(void *)(a1 + 1248) + v2);
    if (v5->__sigaction_u.__sa_handler != (void (__cdecl *)(int))-1) {
      sigaction(v3, v5, 0);
    }
    int v6 = *v4++;
    int v3 = v6;
    v2 += 16;
  }
  while (v2 != 112);
  return sigprocmask(3, &v8, 0);
}

uint64_t sub_213B1E5C0(void *a1)
{
  uint64_t v2 = malloc_type_malloc(0x800uLL, 0x100004077774924uLL);
  a1[21] = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = malloc_type_malloc(0x800uLL, 0x100004077774924uLL);
  a1[25] = v3;
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  int v4 = malloc_type_malloc(0xE0uLL, 0x1052040397E700EuLL);
  a1[26] = v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  a1[22] = 0;
  uint64_t v5 = malloc_type_malloc(0x138uLL, 0x10040436913F5uLL);
  a1[23] = v5;
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  v5[38] = 0;
  *((_OWORD *)v5 + 17) = 0u;
  *((_OWORD *)v5 + kill(0, 18) = 0u;
  *((_OWORD *)v5 + 15) = 0u;
  *((_OWORD *)v5 + 16) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((_OWORD *)v5 + 1longjmp(dword_2677F43AC, 1) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 1el_set((EditLine *)qword_2677F4398, 15, 0) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + 8) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + longjmp(dword_2677F43AC, 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *(_OWORD *)uint64_t v5 = 0u;
  int v6 = malloc_type_malloc(0x20uLL, 0x100004052888210uLL);
  a1[24] = v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  sub_213B1E7B0((uint64_t)a1, 0);
  uint64_t result = 0;
  uint64_t v8 = a1[26];
  *(void *)uint64_t v8 = &unk_213B2756C;
  *(_DWORD *)(v8 + 8) = 16;
  *(unsigned char *)(v8 + 16) = 14;
  *(_DWORD *)(v8 + 24) = 0;
  *(void *)(v8 + 32) = &unk_213B27580;
  *(_DWORD *)(v8 + 4el_set((EditLine *)qword_2677F4398, 15, 0) = 19;
  *(void *)(v8 + 64) = &unk_213B2758C;
  *(unsigned char *)(v8 + 48) = 17;
  *(_DWORD *)(v8 + 56) = 0;
  *(_DWORD *)(v8 + 72) = 17;
  *(unsigned char *)(v8 + 8el_set((EditLine *)qword_2677F4398, 15, 0) = 16;
  *(_DWORD *)(v8 + 88) = 0;
  *(void *)(v8 + 96) = &unk_213B275A0;
  *(_DWORD *)(v8 + 104) = 18;
  *(unsigned char *)(v8 + 112) = 13;
  *(_DWORD *)(v8 + 12el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
  *(void *)(v8 + 128) = &unk_213B275B8;
  *(_DWORD *)(v8 + 136) = 36;
  *(unsigned char *)(v8 + 144) = 10;
  *(_DWORD *)(v8 + 152) = 0;
  *(void *)(v8 + 16el_set((EditLine *)qword_2677F4398, 15, 0) = &unk_213B275CC;
  *(_DWORD *)(v8 + 168) = 37;
  *(unsigned char *)(v8 + 176) = 11;
  *(_DWORD *)(v8 + 184) = 0;
  *(void *)(v8 + 192) = &unk_213B275DC;
  *(_DWORD *)(v8 + 20el_set((EditLine *)qword_2677F4398, 15, 0) = 38;
  *(unsigned char *)(v8 + 208) = 3;
  *(_DWORD *)(v8 + 216) = 0;
  return result;
}

uint64_t sub_213B1E7B0(uint64_t a1, char *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  sigset_t v18 = 0x8000000;
  sigset_t v19 = 0;
  sigprocmask(1, &v18, &v19);
  uint64_t v20 = &v21;
  if (!a2 && (a2 = getenv("TERM")) == 0 || !*a2) {
    a2 = "dumb";
  }
  uint64_t v17 = 0;
  if (!strcmp(a2, "emacs")) {
    *(_DWORD *)(a1 + 44) |= 4u;
  }
  bzero(*(void **)(a1 + 200), 0x800uLL);
  int v4 = tgetent(*(char **)(a1 + 200), a2);
  int v5 = v4;
  if (v4 <= 0)
  {
    if (v4)
    {
      if (v4 == -1) {
        fwrite("Cannot read termcap database;\n", 0x1EuLL, 1uLL, *(FILE **)(a1 + 24));
      }
    }
    else
    {
      fprintf(*(FILE **)(a1 + 24), "No entry for terminal type \"%s\";\n", a2);
    }
    fwrite("using dumb terminal settings.\n", 0x1EuLL, 1uLL, *(FILE **)(a1 + 24));
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)(a1 + 192);
    *(_OWORD *)(v12 + 4) = xmmword_213B274C0;
    *(_DWORD *)(v12 + 2el_set((EditLine *)qword_2677F4398, 15, 0) = *(_DWORD *)(v12 + 28);
    do
    {
      *(void *)(*(void *)(a1 + 184) + ((v11 * 8) >> 1)) = 0;
      uint64_t v13 = off_2641D6C68[v11 + 2];
      v11 += 2;
    }
    while (v13);
  }
  else
  {
    **(_DWORD **)(a1 + 192) = tgetflag("am");
    *(_DWORD *)(*(void *)(a1 + 192) + 24) = tgetflag("xn");
    *(_DWORD *)(*(void *)(a1 + 192) + 4) = tgetflag("pt");
    *(_DWORD *)(*(void *)(a1 + 192) + 2el_set((EditLine *)qword_2677F4398, 15, 0) = tgetflag("xt");
    *(_DWORD *)(*(void *)(a1 + 192) + 16) = tgetflag("km");
    *(_DWORD *)(*(void *)(a1 + 192) + 28) = tgetflag("MT");
    *(_DWORD *)(*(void *)(a1 + 192) + 12) = tgetnum("co");
    *(_DWORD *)(*(void *)(a1 + 192) + 8) = tgetnum("li");
    int v6 = off_2641D6C68;
    sigset_t v7 = "al";
    do
    {
      uint64_t v8 = strchr(v7, *v7);
      uint64_t v9 = tgetstr(v8, &v20);
      sub_213B1F6E8(a1, (uint64_t)v6, v9);
      unint64_t v10 = v6[2];
      v6 += 2;
      sigset_t v7 = v10;
    }
    while (v10);
  }
  uint64_t v14 = *(void *)(a1 + 192);
  int v15 = *(_DWORD *)(v14 + 12);
  if (v15 <= 1)
  {
    int v15 = 80;
    *(_DWORD *)(v14 + 12) = 80;
  }
  if (*(int *)(v14 + 8) < 1) {
    *(_DWORD *)(v14 + 8) = 24;
  }
  *(_DWORD *)(a1 + 156) = v15;
  *(_DWORD *)(a1 + 152) = *(_DWORD *)(v14 + 8);
  sub_213B1F910(a1);
  sub_213B1FB04(a1, (_DWORD *)&v17 + 1, &v17);
  uint64_t result = sub_213B1FBE8(a1, SHIDWORD(v17), v17);
  if (result != -1)
  {
    sigprocmask(3, &v19, 0);
    sub_213B1FD9C(a1);
    *(void *)(a1 + 144) = a2;
    if (v5 >= 1) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void sub_213B1EAA0(uint64_t a1)
{
  free(*(void **)(a1 + 168));
  *(void *)(a1 + 168) = 0;
  free(*(void **)(a1 + 200));
  *(void *)(a1 + 20el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
  *(void *)(a1 + 176) = 0;
  free(*(void **)(a1 + 184));
  *(void *)(a1 + 184) = 0;
  free(*(void **)(a1 + 192));
  *(void *)(a1 + 192) = 0;
  free(*(void **)(a1 + 208));
  *(void *)(a1 + 208) = 0;

  sub_213B1EB14(a1);
}

void sub_213B1EB14(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 64);
  *(void *)(a1 + 64) = 0;
  if (v2)
  {
    int v3 = *v2;
    if (*v2)
    {
      int v4 = v2 + 1;
      do
      {
        free(v3);
        int v5 = *v4++;
        int v3 = v5;
      }
      while (v5);
    }
    free(v2);
  }
  int v6 = *(void ***)(a1 + 72);
  *(void *)(a1 + 72) = 0;
  if (v6)
  {
    sigset_t v7 = *v6;
    if (*v6)
    {
      uint64_t v8 = v6 + 1;
      do
      {
        free(v7);
        uint64_t v9 = *v8++;
        sigset_t v7 = v9;
      }
      while (v9);
    }
    free(v6);
  }
}

uint64_t sub_213B1EBB0(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 56);
  int v3 = v2 - a2;
  if (v2 != a2)
  {
    uint64_t v5 = result;
    if (*(_DWORD *)(result + 156) >= a2)
    {
      int v6 = a2 - v2;
      if (a2 - v2 < 1)
      {
        uint64_t v12 = *(void *)(result + 184);
        uint64_t result = *(void *)(v12 + 280);
        if (!result || !*(unsigned char *)result || v6 >= -1 && (uint64_t v13 = *(unsigned char **)(v12 + 208)) != 0 && *v13)
        {
          uint64_t v14 = *(unsigned char **)(v12 + 208);
          if (v14 && v6 < 0 && *v14)
          {
            do
            {
              int v15 = *(const char **)(*(void *)(v5 + 184) + 208);
              qword_2677F5130 = *(void *)(v5 + 16);
              uint64_t result = tputs(v15, 1, (int (__cdecl *)(int))sub_213B20D84);
              --v3;
            }
            while (v3);
          }
          goto LABEL_32;
        }
        int v6 = -v6;
      }
      else
      {
        unsigned int v7 = v6 + 1;
        while ((*(unsigned char *)(v5 + 160) & 0x80) != 0)
        {
          uint64_t v8 = *(_DWORD **)(*(void *)(v5 + 64) + 8 * *(int *)(v5 + 56));
          if (!*v8) {
            break;
          }
          uint64_t v9 = *(int *)(v5 + 152);
          uint64_t v10 = v9 - 1;
          if (v9 == 1)
          {
            LODWORD(v1el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
          }
          else
          {
            do
            {
              if (v8[v10] != -1) {
                break;
              }
              --v10;
            }
            while (v10);
          }
          sub_213B1ED6C(v5, v10);
          uint64_t result = sub_213B1EFB0(v5, (unsigned __int32 *)(*(void *)(*(void *)(v5 + 64) + 8 * *(int *)(v5 + 56))+ 4 * *(int *)(v5 + 52)), *(int *)(v5 + 152) - (uint64_t)*(int *)(v5 + 52));
          --v7;
          BOOL v11 = __OFSUB__(v6--, 1);
          if ((v6 < 0) ^ v11 | (v6 == 0)) {
            goto LABEL_32;
          }
        }
        if (v6 < 2 || (uint64_t result = *(void *)(*(void *)(v5 + 184) + 248)) == 0 || !*(unsigned char *)result)
        {
          do
          {
            uint64_t result = sub_213B1F0BC(v5, 0xAu);
            --v7;
          }
          while (v7 > 1);
          *(_DWORD *)(v5 + 52) = 0;
          goto LABEL_32;
        }
      }
      __int32 v16 = tgoto((const char *)result, v6, v6);
      qword_2677F5130 = *(void *)(v5 + 16);
      uint64_t result = tputs(v16, v6, (int (__cdecl *)(int))sub_213B20D84);
LABEL_32:
      *(_DWORD *)(v5 + 56) = a2;
    }
  }
  return result;
}

uint64_t sub_213B1ED6C(uint64_t result, int a2)
{
  signed int v2 = *(_DWORD *)(result + 52);
  if (v2 != a2)
  {
    uint64_t v4 = result;
    if (*(_DWORD *)(result + 152) >= a2)
    {
      unsigned int v5 = (a2 & 7) + (a2 >> 3);
      while (1)
      {
        if (!a2)
        {
          uint64_t result = sub_213B1F0BC(v4, 0xDu);
          goto LABEL_39;
        }
        int v6 = a2 - v2;
        if ((a2 - v2 - 5) <= 0xFFFFFFF6)
        {
          uint64_t result = *(void *)(*(void *)(v4 + 184) + 32);
          if (result)
          {
            if (*(unsigned char *)result)
            {
              uint64_t v9 = tgoto((const char *)result, a2, a2);
              qword_2677F5130 = *(void *)(v4 + 16);
              int v10 = a2;
              goto LABEL_36;
            }
          }
        }
        if (v6 >= 1) {
          break;
        }
        int v7 = v2 - a2;
        if (v6 <= -5)
        {
          uint64_t result = *(void *)(*(void *)(v4 + 184) + 264);
          if (result)
          {
            if (*(unsigned char *)result)
            {
              uint64_t v9 = tgoto((const char *)result, v2 - a2, v2 - a2);
              qword_2677F5130 = *(void *)(v4 + 16);
              int v10 = -v6;
              goto LABEL_36;
            }
          }
        }
        if ((*(unsigned char *)(v4 + 160) & 8) != 0)
        {
          if (v5 >= v7)
          {
LABEL_23:
            if (v6 < 0)
            {
              if (v7 <= 1) {
                int v11 = 1;
              }
              else {
                int v11 = v2 - a2;
              }
              do
              {
                uint64_t result = sub_213B1F0BC(v4, 8u);
                --v11;
              }
              while (v11);
            }
            goto LABEL_39;
          }
        }
        else if (v7 <= a2)
        {
          goto LABEL_23;
        }
        uint64_t result = sub_213B1F0BC(v4, 0xDu);
        signed int v2 = 0;
        *(_DWORD *)(v4 + 52) = 0;
        if (*(_DWORD *)(v4 + 152) < a2) {
          return result;
        }
      }
      if (v6 >= 5)
      {
        uint64_t v8 = *(const char **)(*(void *)(v4 + 184) + 272);
        if (v8)
        {
          if (*v8)
          {
            uint64_t v9 = tgoto(v8, a2 - v2, a2 - v2);
            qword_2677F5130 = *(void *)(v4 + 16);
            int v10 = v6;
LABEL_36:
            uint64_t result = tputs(v9, v10, (int (__cdecl *)(int))sub_213B20D84);
            goto LABEL_39;
          }
        }
      }
      if ((*(unsigned char *)(v4 + 160) & 8) != 0)
      {
        int v12 = v2 & 0xF8;
        signed int v13 = a2 & 0xFFFFFFF8;
        if (v12 != (a2 & 0xFFFFFFF8)
          && *(_DWORD *)(*(void *)(*(void *)(v4 + 64) + 8 * *(int *)(v4 + 56)) + 4
                                                                                     * (a2 & 0xF8)) != -1)
        {
          while (v12 < v13)
          {
            sub_213B1F0BC(v4, 9u);
            v12 += 8;
          }
          *(_DWORD *)(v4 + 52) = v13;
          int v6 = a2 & 7;
          signed int v2 = a2 & 0xFFFFFFF8;
        }
      }
      uint64_t result = sub_213B1EFB0(v4, (unsigned __int32 *)(*(void *)(*(void *)(v4 + 64) + 8 * *(int *)(v4 + 56)) + 4 * v2), v6);
LABEL_39:
      *(_DWORD *)(v4 + 52) = a2;
    }
  }
  return result;
}

uint64_t sub_213B1EFB0(uint64_t result, unsigned __int32 *a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = a3;
    uint64_t v4 = result;
    if (*(int *)(result + 152) >= a3)
    {
      do
      {
        unsigned __int32 v6 = *a2++;
        uint64_t result = sub_213B1F0BC(v4, v6);
        int v7 = *(_DWORD *)(v4 + 52) + 1;
        *(_DWORD *)(v4 + 52) = v7;
        --v3;
      }
      while (v3);
      int v8 = *(_DWORD *)(v4 + 152);
      if (v7 >= v8)
      {
        int v9 = *(_DWORD *)(v4 + 160);
        if ((v9 & 0x80) == 0)
        {
          int v10 = v8 - 1;
LABEL_7:
          *(_DWORD *)(v4 + 52) = v10;
          return result;
        }
        uint64_t v11 = *(int *)(v4 + 56) + 1;
        *(_DWORD *)(v4 + 52) = 0;
        *(_DWORD *)(v4 + 56) = v11;
        if ((v9 & 0x100) != 0)
        {
          int v17 = **(_DWORD **)(*(void *)(v4 + 64) + 8 * v11);
          if (!v17)
          {
            uint64_t result = sub_213B1F0BC(v4, 0x20u);
            int v10 = 1;
            goto LABEL_7;
          }
          uint64_t result = sub_213B1EFB0(v4, &v17, 1);
          uint64_t v12 = *(int *)(v4 + 52);
          uint64_t v13 = *(void *)(*(void *)(v4 + 64) + 8 * *(int *)(v4 + 56));
          if (*(_DWORD *)(v13 + 4 * v12) == -1)
          {
            uint64_t v14 = (int *)(v13 + 4 * v12 + 4);
            int v15 = v12 + 1;
            do
            {
              *(_DWORD *)(v4 + 52) = v15;
              int v16 = *v14++;
              ++v15;
            }
            while (v16 == -1);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_213B1F0BC(uint64_t a1, unsigned __int32 a2)
{
  if (a2 == -1) {
    return 0;
  }
  uint64_t v7 = v2;
  uint64_t v8 = v3;
  uint64_t result = sub_213B23854(v6, 6uLL, a2);
  if (result > 0)
  {
    v6[result] = 0;
    return fputs(v6, *(FILE **)(a1 + 16));
  }
  return result;
}

char *sub_213B1F124(char *result, int a2)
{
  if (a2 < 1) {
    return result;
  }
  uint64_t v2 = result;
  if ((result[160] & 2) == 0) {
    return result;
  }
  int v3 = a2;
  if (*((_DWORD *)result + 38) < a2) {
    return result;
  }
  uint64_t v4 = (void *)*((void *)result + 23);
  unsigned int v5 = (const char *)v4[30];
  if (v5)
  {
    if (*v5)
    {
      if (a2 > 1 || (unsigned __int32 v6 = (unsigned char *)v4[6]) == 0 || !*v6)
      {
        uint64_t result = tgoto(v5, a2, a2);
        qword_2677F5130 = *((void *)v2 + 2);
        int v10 = v3;
        goto LABEL_21;
      }
    }
  }
  uint64_t v7 = (const char *)v4[8];
  if (v7 && *v7)
  {
    qword_2677F5130 = *((void *)v2 + 2);
    tputs(v7, 1, (int (__cdecl *)(int))sub_213B20D84);
    uint64_t v4 = (void *)*((void *)v2 + 23);
  }
  uint64_t v8 = (unsigned char *)v4[6];
  if (v8 && *v8)
  {
    do
    {
      --v3;
      int v9 = *(const char **)(*((void *)v2 + 23) + 48);
      qword_2677F5130 = *((void *)v2 + 2);
      tputs(v9, 1, (int (__cdecl *)(int))sub_213B20D84);
    }
    while (v3);
    uint64_t v4 = (void *)*((void *)v2 + 23);
  }
  uint64_t result = (char *)v4[9];
  if (result && *result)
  {
    qword_2677F5130 = *((void *)v2 + 2);
    int v10 = 1;
LABEL_21:
    return (char *)tputs(result, v10, (int (__cdecl *)(int))sub_213B20D84);
  }
  return result;
}

uint64_t sub_213B1F298(uint64_t result, unsigned __int32 *a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v3 = result;
    if (*(unsigned char *)(result + 160))
    {
      unsigned int v4 = a3;
      if (*(_DWORD *)(result + 152) >= a3)
      {
        unsigned __int32 v6 = *(void **)(result + 184);
        uint64_t v7 = (const char *)v6[32];
        if (v7 && *v7 && (a3 > 1 || (uint64_t v8 = (unsigned char *)v6[13]) == 0 || !*v8))
        {
          int v17 = tgoto(v7, a3, a3);
          qword_2677F5130 = *(void *)(v3 + 16);
          tputs(v17, v4, (int (__cdecl *)(int))sub_213B20D84);
          return sub_213B1EFB0(v3, a2, v4);
        }
        else
        {
          int v9 = (const char *)v6[14];
          if (v9 && *v9 && (int v10 = (unsigned char *)v6[10]) != 0 && *v10)
          {
            qword_2677F5130 = *(void *)(v3 + 16);
            tputs(v9, 1, (int (__cdecl *)(int))sub_213B20D84);
            *(_DWORD *)(v3 + 52) += v4;
            do
            {
              unsigned __int32 v11 = *a2++;
              sub_213B1F0BC(v3, v11);
              --v4;
            }
            while (v4);
            uint64_t v12 = *(void *)(v3 + 184);
            uint64_t v13 = *(const char **)(v12 + 120);
            if (v13 && *v13)
            {
              qword_2677F5130 = *(void *)(v3 + 16);
              tputs(v13, 1, (int (__cdecl *)(int))sub_213B20D84);
              uint64_t v12 = *(void *)(v3 + 184);
            }
            uint64_t v14 = *(const char **)(v12 + 80);
            qword_2677F5130 = *(void *)(v3 + 16);
            return tputs(v14, 1, (int (__cdecl *)(int))sub_213B20D84);
          }
          else
          {
            do
            {
              int v15 = *(const char **)(*(void *)(v3 + 184) + 104);
              if (v15 && *v15)
              {
                qword_2677F5130 = *(void *)(v3 + 16);
                tputs(v15, 1, (int (__cdecl *)(int))sub_213B20D84);
              }
              unsigned __int32 v16 = *a2++;
              sub_213B1F0BC(v3, v16);
              ++*(_DWORD *)(v3 + 52);
              uint64_t result = *(void *)(*(void *)(v3 + 184) + 120);
              if (result && *(unsigned char *)result)
              {
                qword_2677F5130 = *(void *)(v3 + 16);
                uint64_t result = tputs((const char *)result, 1, (int (__cdecl *)(int))sub_213B20D84);
              }
              --v4;
            }
            while (v4);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_213B1F4D4(uint64_t result, int a2)
{
  uint64_t v3 = result;
  if ((*(unsigned char *)(result + 160) & 4) != 0
    && (uint64_t result = *(void *)(*(void *)(result + 184) + 24)) != 0
    && *(unsigned char *)result)
  {
    qword_2677F5130 = *(void *)(v3 + 16);
    return tputs((const char *)result, 1, (int (__cdecl *)(int))sub_213B20D84);
  }
  else
  {
    if (a2 >= 1)
    {
      int v4 = a2;
      do
      {
        uint64_t result = sub_213B1F0BC(v3, 0x20u);
        --v4;
      }
      while (v4);
    }
    *(_DWORD *)(v3 + 52) += a2;
  }
  return result;
}

uint64_t sub_213B1F588(void *a1)
{
  uint64_t v2 = (void *)a1[23];
  uint64_t v3 = (const char *)v2[5];
  if (v3 && *v3)
  {
    int v4 = *(_DWORD *)(a1[24] + 8);
    qword_2677F5130 = a1[2];
LABEL_9:
    return tputs(v3, v4, (int (__cdecl *)(int))sub_213B20D84);
  }
  unsigned int v5 = (const char *)v2[12];
  if (v5)
  {
    if (*v5)
    {
      unsigned __int32 v6 = (unsigned char *)v2[2];
      if (v6)
      {
        if (*v6)
        {
          int v7 = *(_DWORD *)(a1[24] + 8);
          qword_2677F5130 = a1[2];
          tputs(v5, v7, (int (__cdecl *)(int))sub_213B20D84);
          uint64_t v3 = *(const char **)(a1[23] + 16);
          int v4 = *(_DWORD *)(a1[24] + 8);
          qword_2677F5130 = a1[2];
          goto LABEL_9;
        }
      }
    }
  }
  sub_213B1F0BC((uint64_t)a1, 0xDu);

  return sub_213B1F0BC((uint64_t)a1, 0xAu);
}

void el_beep_0(EditLine *a1)
{
  uint64_t v2 = *(const char **)(*((void *)a1 + 23) + 8);
  if (v2 && *v2)
  {
    qword_2677F5130 = *((void *)a1 + 2);
    tputs(v2, 1, (int (__cdecl *)(int))sub_213B20D84);
  }
  else
  {
    sub_213B1F0BC((uint64_t)a1, 7u);
  }
}

uint64_t sub_213B1F6DC(uint64_t result, void *a2)
{
  *a2 = *(void *)(result + 144);
  return result;
}

void sub_213B1F6E8(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 184);
  uint64_t v6 = (a2 - (uint64_t)off_2641D6C68) >> 4;
  bzero(__src, 0x800uLL);
  if (!a3 || !*a3)
  {
    *(void *)(v5 + 8 * v6) = 0;
    return;
  }
  size_t v7 = strlen(a3);
  size_t v8 = v7;
  int v9 = *(char **)(v5 + 8 * v6);
  if (v9)
  {
    if (v7 <= strlen(*(const char **)(v5 + 8 * v6)))
    {
      strcpy(v9, a3);
      return;
    }
  }
  else if (!v7)
  {
    return;
  }
  uint64_t v10 = *(void *)(a1 + 176);
  if ((unint64_t)(v10 + 3) < 0x800)
  {
    unsigned __int32 v11 = (char *)(*(void *)(a1 + 168) + v10);
LABEL_29:
    *(void *)(v5 + 8 * v6) = v11;
    strcpy(v11, a3);
    *(void *)(a1 + 176) += v8 + 1;
    return;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  do
  {
    uint64_t v14 = *(char **)(v5 + 8 * v12);
    if (v14) {
      BOOL v15 = v14 == v9;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      char v16 = *v14;
      if (*v14)
      {
        int v17 = (unsigned __int8 *)(v14 + 1);
        do
        {
          uint64_t v18 = v13 + 1;
          __src[v13] = v16;
          int v19 = *v17++;
          char v16 = v19;
          ++v13;
        }
        while (v19);
      }
      else
      {
        uint64_t v18 = v13;
      }
      uint64_t v13 = v18 + 1;
      __src[v18] = 0;
    }
    ++v12;
  }
  while (v12 != 39);
  memcpy(*(void **)(a1 + 168), __src, 0x800uLL);
  *(void *)(a1 + 176) = v13;
  if ((unint64_t)(v13 - 2045) > 0xFFFFFFFFFFFFF7FFLL)
  {
    unsigned __int32 v11 = (char *)(*(void *)(a1 + 168) + v13);
    goto LABEL_29;
  }
  uint64_t v20 = *(FILE **)(a1 + 24);

  fwrite("Out of termcap string space.\n", 0x1DuLL, 1uLL, v20);
}

uint64_t sub_213B1F910(uint64_t result)
{
  uint64_t v1 = result;
  *(_DWORD *)(result + 16el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
  int v2 = *(_DWORD *)(result + 824);
  uint64_t v3 = *(_DWORD **)(result + 192);
  if (v2)
  {
    int v2 = v3[1];
    if (v2) {
      int v2 = 8 * (v3[5] == 0);
    }
    *(_DWORD *)(result + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v2;
  }
  if (v3[4]) {
    int v4 = 64;
  }
  else {
    int v4 = (v3[7] != 0) << 6;
  }
  int v5 = v2 | v4;
  *(_DWORD *)(result + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v5;
  uint64_t v6 = *(void *)(result + 184);
  size_t v7 = *(unsigned char **)(v6 + 24);
  if (v7) {
    LODWORD(v7) = 4 * (*v7 != 0);
  }
  unsigned int v8 = v7 | v5;
  *(_DWORD *)(result + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v8;
  int v9 = *(unsigned char **)(v6 + 48);
  if (v9 && *v9)
  {
    LODWORD(v1el_set((EditLine *)qword_2677F4398, 15, 0) = 2;
  }
  else
  {
    uint64_t v10 = *(unsigned char **)(v6 + 240);
    if (v10) {
      LODWORD(v1el_set((EditLine *)qword_2677F4398, 15, 0) = 2 * (*v10 != 0);
    }
  }
  unsigned int v11 = v10 | v8;
  *(_DWORD *)(result + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v11;
  uint64_t v12 = *(unsigned char **)(v6 + 112);
  if (v12 && *v12 || (uint64_t v13 = *(unsigned char **)(v6 + 104)) != 0 && *v13)
  {
    LODWORD(v14) = 1;
  }
  else
  {
    uint64_t v14 = *(unsigned __int8 **)(v6 + 256);
    if (v14) {
      LODWORD(v14) = *v14 != 0;
    }
  }
  unsigned int v15 = v14 | v11;
  *(_DWORD *)(result + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v15;
  char v16 = *(unsigned char **)(v6 + 208);
  if (v16 && *v16)
  {
    LODWORD(v17) = 32;
  }
  else
  {
    int v17 = *(unsigned char **)(v6 + 280);
    if (v17) {
      LODWORD(v17) = 32 * (*v17 != 0);
    }
  }
  unsigned int v18 = v17 | v15;
  *(_DWORD *)(result + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v18;
  int v19 = v18 | ((*v3 != 0) << 7);
  *(_DWORD *)(result + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v19;
  int v20 = v19 | ((v3[6] != 0) << 8);
  *(_DWORD *)(result + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v20;
  char v21 = *(const char **)(v6 + 168);
  if (!v21)
  {
    unsigned int v25 = v20 & 0xFFFFFFEF;
    goto LABEL_38;
  }
  if (*v21 && (uint64_t v22 = *(const char **)(v6 + 224)) != 0 && *v22)
  {
    uint64_t result = strcmp(*(const char **)(v6 + 168), v22);
    unsigned int v23 = v20 | (16 * (result == 0));
  }
  else
  {
    unsigned int v23 = v20 & 0xFFFFFFEF;
  }
  *(_DWORD *)(v1 + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v23;
  if (*v21)
  {
    int v24 = *(const char **)(v6 + 184);
    if (v24)
    {
      if (*v24)
      {
        uint64_t result = strcmp(v21, v24);
        unsigned int v25 = v23 | (16 * (result == 0));
LABEL_38:
        *(_DWORD *)(v1 + 16el_set((EditLine *)qword_2677F4398, 15, 0) = v25;
      }
    }
  }
  return result;
}

BOOL sub_213B1FB04(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v6 = *(void *)(a1 + 192);
  *a3 = *(_DWORD *)(v6 + 12);
  *a2 = *(_DWORD *)(v6 + 8);
  int v7 = *(_DWORD *)(a1 + 32);
  uint64_t v11 = 0;
  if (ioctl(v7, 0x40087468uLL, &v11) != -1)
  {
    if (WORD1(v11)) {
      *a3 = WORD1(v11);
    }
    if ((_WORD)v11) {
      *a2 = (unsigned __int16)v11;
    }
  }
  int v8 = *(_DWORD *)(a1 + 32);
  uint64_t v11 = 0;
  if (ioctl(v8, 0x40087468uLL, &v11) != -1)
  {
    if (WORD1(v11)) {
      *a3 = WORD1(v11);
    }
    if ((_WORD)v11) {
      *a2 = (unsigned __int16)v11;
    }
  }
  uint64_t v9 = *(void *)(a1 + 192);
  return *(_DWORD *)(v9 + 12) != *a3 || *(_DWORD *)(v9 + 8) != *a2;
}

uint64_t sub_213B1FBE8(uint64_t a1, int a2, int a3)
{
  if (a3 >= 2) {
    int v4 = a3;
  }
  else {
    int v4 = 80;
  }
  uint64_t v5 = *(void *)(a1 + 192);
  if (a2 >= 1) {
    int v6 = a2;
  }
  else {
    int v6 = 24;
  }
  *(_DWORD *)(v5 + 8) = v6;
  *(_DWORD *)(v5 + 12) = v4;
  sub_213B1EB14(a1);
  uint64_t v7 = *(void *)(a1 + 192);
  *(_DWORD *)(a1 + 152) = *(_DWORD *)(v7 + 12);
  LODWORD(v7) = *(_DWORD *)(v7 + 8);
  *(_DWORD *)(a1 + 156) = v7;
  int v8 = malloc_type_malloc(8 * ((int)v7 + 1), 0x10040436913F5uLL);
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = *(_DWORD *)(a1 + 156);
    if (v10 < 1)
    {
      uint64_t v13 = v10;
LABEL_14:
      v9[v13] = 0;
      *(void *)(a1 + 64) = v9;
      uint64_t v14 = malloc_type_malloc(8 * (v10 + 1), 0x10040436913F5uLL);
      if (!v14) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v9 = v14;
      uint64_t v15 = *(int *)(a1 + 156);
      if ((int)v15 < 1)
      {
LABEL_19:
        v9[v15] = 0;
        *(void *)(a1 + 72) = v9;
        sub_213B1D104(a1);
        return 0;
      }
      uint64_t v16 = 0;
      while (1)
      {
        int v17 = malloc_type_malloc(4 * *(int *)(a1 + 152) + 4, 0x100004052888210uLL);
        v9[v16] = v17;
        if (!v17) {
          break;
        }
        ++v16;
        uint64_t v15 = *(int *)(a1 + 156);
        if (v16 >= v15) {
          goto LABEL_19;
        }
      }
      if (v16)
      {
        uint64_t v20 = v16 + 1;
        do
          free((void *)v9[(v20-- - 2)]);
        while (v20 > 1);
      }
    }
    else
    {
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = malloc_type_malloc(4 * *(int *)(a1 + 152) + 4, 0x100004052888210uLL);
        v9[v11] = v12;
        if (!v12) {
          break;
        }
        ++v11;
        int v10 = *(_DWORD *)(a1 + 156);
        if (v11 >= v10)
        {
          uint64_t v13 = v10;
          goto LABEL_14;
        }
      }
      if (v11)
      {
        uint64_t v19 = v11 + 1;
        do
          free((void *)v9[(v19-- - 2)]);
        while (v19 > 1);
      }
    }
    free(v9);
  }
  return 0xFFFFFFFFLL;
}

void sub_213B1FD9C(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 168))
  {
    uint64_t v2 = *(void *)(a1 + 1056);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 208);
      int v4 = *(_DWORD *)(a1 + 1096);
      if (v4 == 1) {
        uint64_t v2 = *(void *)(a1 + 1048);
      }
      BOOL v17 = v4 == 1;
      uint64_t v5 = 1072;
      if (v17) {
        uint64_t v5 = 1080;
      }
      uint64_t v6 = *(void *)(a1 + v5);
      sub_213B16440(a1, &dword_213B275F8, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
      sub_213B16440(a1, &dword_213B27608, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
      sub_213B16440(a1, &dword_213B27618, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
      sub_213B16440(a1, &dword_213B27628, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
      sub_213B16440(a1, &dword_213B27638, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
      sub_213B16440(a1, &dword_213B27648, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
      sub_213B16440(a1, &dword_213B27658, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
      sub_213B16440(a1, &dword_213B27668, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
      sub_213B16440(a1, &dword_213B27678, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
      sub_213B16440(a1, &dword_213B27688, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
      sub_213B16440(a1, &dword_213B27698, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
      sub_213B16440(a1, &dword_213B276A8, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
      if (*(_DWORD *)(a1 + 1096) == 1)
      {
        sub_213B16440(a1, dword_213B275FC, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
        sub_213B16440(a1, dword_213B2760C, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
        sub_213B16440(a1, dword_213B2761C, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
        sub_213B16440(a1, dword_213B2762C, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
        sub_213B16440(a1, dword_213B2763C, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
        sub_213B16440(a1, dword_213B2764C, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
        sub_213B16440(a1, dword_213B2765C, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
        sub_213B16440(a1, dword_213B2766C, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
        sub_213B16440(a1, dword_213B2767C, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
        sub_213B16440(a1, dword_213B2768C, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
        sub_213B16440(a1, dword_213B2769C, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
        sub_213B16440(a1, dword_213B276AC, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
      }
      for (uint64_t i = 0; i != 7; ++i)
      {
        int v8 = *(unsigned __int8 **)(*(void *)(a1 + 184) + 8 * *(int *)(v3 + 32 * i + 8));
        if (!v8 || !*v8) {
          continue;
        }
        uint64_t v9 = 0;
        unint64_t v10 = 0;
        while (v8[v10])
        {
          v20[v9++] = (char)v8[v10++];
          if (v10 == 8) {
            goto LABEL_18;
          }
        }
        if (v10 <= 7) {
          bzero(&v20[v9], 32 - v9 * 4);
        }
LABEL_18:
        uint64_t v11 = v3 + 32 * i;
        int v14 = *(_DWORD *)(v11 + 24);
        uint64_t v13 = (int *)(v11 + 24);
        int v12 = v14;
        if (v14 == 2)
        {
          sub_213B166B0(a1, v2, v20);
        }
        else
        {
          uint64_t v15 = *v8;
          if (v8[1])
          {
            int v16 = *(unsigned __int8 *)(v2 + v15);
            BOOL v17 = *(unsigned __int8 *)(v6 + v15) == v16 || v16 == 24;
            if (v17)
            {
              sub_213B16440(a1, v20, (const __int32 **)(v3 + 32 * i + 16), v12);
              char v18 = 24;
LABEL_32:
              *(unsigned char *)(v2 + v15) = v18;
              continue;
            }
          }
          else
          {
            int v16 = *(unsigned __int8 *)(v2 + v15);
          }
          if (v16 == 34)
          {
            sub_213B166B0(a1, v2, v20);
            uint64_t v19 = (const __int32 **)(v3 + 32 * i + 16);
            if (!*v13)
            {
              char v18 = *(unsigned char *)v19;
              goto LABEL_32;
            }
            sub_213B16440(a1, v20, v19, *v13);
          }
        }
      }
    }
  }
}

uint64_t sub_213B201C0(uint64_t a1, __int32 *a2, void *a3, int a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)(a1 + 208);
  while (1)
  {
    uint64_t result = wcscmp(a2, *(const __int32 **)(v8 + v7));
    if (!result) {
      break;
    }
    v7 += 32;
    if (v7 == 224) {
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t v10 = v8 + v7;
  *(void *)(v10 + 16) = *a3;
  *(_DWORD *)(v10 + 24) = a4;
  return result;
}

uint64_t sub_213B20234(uint64_t a1, __int32 *a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(a1 + 208);
  while (1)
  {
    uint64_t result = wcscmp(a2, *(const __int32 **)(v4 + v3));
    if (!result) {
      break;
    }
    v3 += 32;
    if (v3 == 224) {
      return 0xFFFFFFFFLL;
    }
  }
  *(_DWORD *)(v4 + v3 + 24) = 2;
  return result;
}

uint64_t sub_213B20294(uint64_t result, __int32 *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)(result + 208);
  do
  {
    if (!*a2 || (uint64_t result = wcscmp(a2, *(const __int32 **)(v5 + v4)), !result))
    {
      int v6 = *(_DWORD *)(v5 + v4 + 24);
      if (v6 != 2) {
        uint64_t result = sub_213B16978(v3, *(unsigned __int32 **)(v5 + v4), (unsigned int **)(v5 + v4 + 16), v6);
      }
    }
    v4 += 32;
  }
  while (v4 != 224);
  return result;
}

uint64_t sub_213B20308(uint64_t a1)
{
  return fflush(*(FILE **)(a1 + 16));
}

uint64_t sub_213B20310(uint64_t a1, unint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_213B23C1C(v6, 8uLL, a2);
  unint64_t v4 = v3 & ~(v3 >> 63);
  v6[v4] = 0;
  sub_213B1EFB0(a1, v6, v4);
  return fflush(*(FILE **)(a1 + 16));
}

uint64_t sub_213B20394(uint64_t a1)
{
  fwrite("\n\tYour terminal has the\n", 0x18uLL, 1uLL, *(FILE **)(a1 + 16));
  fwrite("\tfollowing characteristics:\n\n", 0x1DuLL, 1uLL, *(FILE **)(a1 + 16));
  fprintf(*(FILE **)(a1 + 16), "\tIt has %d columns and %d lines\n", *(_DWORD *)(*(void *)(a1 + 192) + 12), *(_DWORD *)(*(void *)(a1 + 192) + 8));
  if ((*(_DWORD *)(a1 + 160) & 0x40) != 0) {
    uint64_t v2 = "a";
  }
  else {
    uint64_t v2 = "no";
  }
  fprintf(*(FILE **)(a1 + 16), "\tIt has %s meta key\n", v2);
  if ((*(_DWORD *)(a1 + 160) & 8) != 0) {
    uint64_t v3 = " ";
  }
  else {
    uint64_t v3 = "not ";
  }
  fprintf(*(FILE **)(a1 + 16), "\tIt can%suse tabs\n", v3);
  if ((*(_DWORD *)(a1 + 160) & 0x80) != 0) {
    unint64_t v4 = "has";
  }
  else {
    unint64_t v4 = "does not have";
  }
  fprintf(*(FILE **)(a1 + 16), "\tIt %s automatic margins\n", v4);
  int v5 = *(_DWORD *)(a1 + 160);
  if ((v5 & 0x80) != 0)
  {
    if ((v5 & 0x100) != 0) {
      int v6 = "has";
    }
    else {
      int v6 = "does not have";
    }
    fprintf(*(FILE **)(a1 + 16), "\tIt %s magic margins\n", v6);
  }
  uint64_t v7 = *(__int32 ***)(a1 + 184);
  uint64_t v8 = "al";
  uint64_t v9 = off_2641D6C78;
  do
  {
    uint64_t v10 = *v7;
    if (*v7 && *(unsigned char *)v10)
    {
      uint64_t v11 = sub_213B238D0(v10, a1 + 1264);
      int v12 = sub_213B23AC8((unsigned int *)v11);
      uint64_t v13 = (const char *)sub_213B23790(v12, a1 + 1264);
    }
    else
    {
      uint64_t v13 = "(empty)";
    }
    fprintf(*(FILE **)(a1 + 16), "\t%25s (%s) == %s\n", *(v9 - 1), v8, v13);
    ++v7;
    int v14 = *v9;
    v9 += 2;
    uint64_t v8 = v14;
  }
  while (v14);
  fputc(10, *(FILE **)(a1 + 16));
  return 0;
}

uint64_t sub_213B20560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3)
  {
    int v5 = *(unsigned __int32 **)(a3 + 8);
    if (v5)
    {
      if (*(void *)(a3 + 16))
      {
        int v6 = sub_213B23790(v5, a1 + 1264);
        strncpy(__dst, (const char *)v6, 8uLL);
        __dst[7] = 0;
        uint64_t v7 = sub_213B23790(*(unsigned __int32 **)(a3 + 16), a1 + 1264);
        strncpy(__str, (const char *)v7, 8uLL);
        __str[7] = 0;
        uint64_t v8 = off_2641D6C68;
        uint64_t v9 = "al";
        do
        {
          if (!strcmp(v9, __dst))
          {
            sub_213B1F6E8(a1, (uint64_t)v8, __str);
            sub_213B1F910(a1);
            return 0;
          }
          uint64_t v10 = v8[2];
          v8 += 2;
          uint64_t v9 = v10;
        }
        while (v10);
        uint64_t v11 = "am";
        int v12 = off_2641D6EF8;
        while (strcmp(v11, __dst))
        {
          uint64_t v13 = *v12;
          v12 += 2;
          uint64_t v11 = v13;
          if (!v13)
          {
            __endptr = 0;
            int v14 = strtol(__str, &__endptr, 10);
            if (*__endptr)
            {
              return 0xFFFFFFFFLL;
            }
            int v16 = v14;
            uint64_t result = 0;
            BOOL v17 = *(_DWORD **)(a1 + 192);
            v17[8] = v16;
            *(_DWORD *)(a1 + 156) = v17[3];
            *(_DWORD *)(a1 + 152) = v17[2];
            return result;
          }
        }
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_213B206E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(const char **)(a3 + 8);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v4 = *(_DWORD **)(a3 + 16);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0;
  uint64_t v7 = "al";
  do
  {
    uint64_t result = strcmp(v7, v3);
    if (!result)
    {
      uint64_t v11 = *(void **)(*(void *)(a1 + 184) + ((v6 * 8) >> 1));
      goto LABEL_21;
    }
    uint64_t v7 = off_2641D6C68[v6 + 2];
    v6 += 2;
  }
  while (v7);
  uint64_t v9 = 0;
  uint64_t v10 = "am";
  while (strcmp(v10, v3))
  {
    uint64_t v10 = off_2641D6EE8[v9 + 2];
    v9 += 2;
    if (!v10) {
      return 0xFFFFFFFFLL;
    }
  }
  int v12 = *(_DWORD *)(*(void *)(a1 + 192) + ((v9 * 8) >> 2));
  if (v9 * 8 && v9 != 2 && v9 != 8 && v9 != 12)
  {
    uint64_t result = 0;
    _DWORD *v4 = v12;
    return result;
  }
  uint64_t result = 0;
  if (v12) {
    uint64_t v11 = &unk_2677F4310;
  }
  else {
    uint64_t v11 = &unk_2677F4314;
  }
LABEL_21:
  *(void *)unint64_t v4 = v11;
  return result;
}

uint64_t sub_213B207FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  unsigned int v42 = &v44;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = a3 + 8;
  uint64_t result = *(void *)(a3 + 8);
  if (!result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v43 = 0;
  if (*(_DWORD *)result == 45)
  {
    int v6 = *(_DWORD *)(result + 4);
    BOOL v7 = v6 != 115 && v6 == 118;
    BOOL v8 = v6 == 115;
    uint64_t v10 = *(void *)(a3 + 16);
    uint64_t v9 = a3 + 16;
    uint64_t result = v10;
    if (!v10) {
      return result;
    }
    uint64_t v5 = v9;
    if (!*(_DWORD *)result) {
      return 0;
    }
  }
  else
  {
    BOOL v8 = 0;
    BOOL v7 = 0;
    if (!*(_DWORD *)result) {
      return 0;
    }
  }
  if (!wcscmp((const __int32 *)result, dword_213B274D8))
  {
    int v16 = *(FILE **)(a1 + 16);
LABEL_27:
    fprintf(v16, "%s\n");
    return 0;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_213B274EC))
  {
    int v16 = *(FILE **)(a1 + 16);
    goto LABEL_27;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_213B27500))
  {
    int v16 = *(FILE **)(a1 + 16);
    goto LABEL_27;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_213B2750C))
  {
    int v16 = *(FILE **)(a1 + 16);
    goto LABEL_27;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_213B27518))
  {
    BOOL v17 = *(FILE **)(a1 + 16);
    goto LABEL_31;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_213B2752C) || !wcscmp(*(const __int32 **)v5, dword_213B27540))
  {
    BOOL v17 = *(FILE **)(a1 + 16);
LABEL_31:
    fprintf(v17, "%d\n");
    return 0;
  }
  if (!wcscmp(*(const __int32 **)v5, dword_213B27558))
  {
    BOOL v17 = *(FILE **)(a1 + 16);
    goto LABEL_31;
  }
  uint64_t v11 = 0;
  int v12 = "al";
  while (1)
  {
    uint64_t v13 = sub_213B23790(*(unsigned __int32 **)v5, a1 + 1264);
    if (!strcmp(v12, (const char *)v13)) {
      break;
    }
    int v12 = off_2641D6C68[v11 + 2];
    v11 += 2;
    if (!v12)
    {
      int v14 = sub_213B23790(*(unsigned __int32 **)v5, a1 + 1264);
      uint64_t v15 = tgetstr((char *)v14, &v42);
      goto LABEL_34;
    }
  }
  uint64_t v15 = *(char **)(*(void *)(a1 + 184) + ((v11 * 8) >> 1));
LABEL_34:
  if (!v15 || (int v18 = *v15, !*v15))
  {
    if (!v8) {
    return 0xFFFFFFFFLL;
    }
  }
  int v19 = 0;
  v41 = v15;
  uint64_t v20 = v15;
  while (v18 == 37)
  {
    unsigned int v22 = *++v20;
    uint64_t v21 = v22;
    char v23 = v22 - 37;
    if (v22 - 37 > 0x3F) {
      goto LABEL_44;
    }
    if (((1 << v23) & 0x8000000000006240) != 0)
    {
      ++v19;
      goto LABEL_52;
    }
    if (((1 << v23) & 0xA2000001) == 0)
    {
LABEL_44:
      if (((v21 - 105) > 9 || ((1 << (v21 - 105)) & 0x221) == 0) && v7) {
    }
      }
LABEL_52:
    int v26 = *++v20;
    int v18 = v26;
  }
  if (v18) {
    goto LABEL_52;
  }
  if (v19 == 2)
  {
LABEL_71:
    int v32 = *(const __int32 **)(v5 + 8);
    if (v32 && *v32)
    {
      uint64_t v33 = wcstol(v32, &v43, 10);
      if (*v43 || (int v34 = v33, v33 < 0))
      {
        if (!v8) {
        return 0xFFFFFFFFLL;
        }
      }
      uint64_t v35 = *(const __int32 **)(v5 + 16);
      if (v35)
      {
        if (*v35)
        {
          uint64_t v36 = wcstol(v35, &v43, 10);
          if (!*v43 && (v36 & 0x8000000000000000) == 0)
          {
            int v37 = v36;
            unint64_t v38 = *(_DWORD **)(v5 + 24);
            if (!v38 || !*v38)
            {
              uint64_t v31 = tgoto(v41, v34, v36);
              qword_2677F5130 = *(void *)(a1 + 16);
              int v39 = v37;
              goto LABEL_86;
            }
            goto LABEL_60;
          }
          if (v8) {
            return 0xFFFFFFFFLL;
          }
          int v40 = *(FILE **)(a1 + 24);
          goto LABEL_95;
        }
      }
    }
    goto LABEL_82;
  }
  if (v19 == 1)
  {
    unint64_t v28 = *(const __int32 **)(v5 + 8);
    if (v28 && *v28)
    {
      uint64_t v29 = wcstol(v28, &v43, 10);
      if (!*v43 && (v29 & 0x8000000000000000) == 0)
      {
        uint64_t v30 = *(_DWORD **)(v5 + 16);
        if (!v30 || !*v30)
        {
          uint64_t v31 = tgoto(v41, 0, v29);
          qword_2677F5130 = *(void *)(a1 + 16);
          goto LABEL_85;
        }
LABEL_60:
        if (!v8) {
        return 0xFFFFFFFFLL;
        }
      }
      if (v8) {
        return 0xFFFFFFFFLL;
      }
      int v40 = *(FILE **)(a1 + 24);
LABEL_95:
      return 0xFFFFFFFFLL;
    }
LABEL_82:
    if (!v8) {
      fwrite("echotc: Warning: Missing argument.\n", 0x23uLL, 1uLL, *(FILE **)(a1 + 24));
    }
    return 0xFFFFFFFFLL;
  }
  if (v19)
  {
    if (v7) {
      fprintf(*(FILE **)(a1 + 24), "echotc: Warning: Too many required arguments (%d).\n", v19);
    }
    goto LABEL_71;
  }
  unsigned __int32 v27 = *(_DWORD **)(v5 + 8);
  if (v27 && *v27) {
    goto LABEL_60;
  }
  qword_2677F5130 = *(void *)(a1 + 16);
  uint64_t v31 = v41;
LABEL_85:
  int v39 = 1;
LABEL_86:
  tputs(v31, v39, (int (__cdecl *)(int))sub_213B20D84);
  return 0;
}

uint64_t sub_213B20D84(int a1)
{
  if (qword_2677F5130) {
    return fputc(a1, (FILE *)qword_2677F5130);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

TokenizerW *__cdecl tok_winit(const __int32 *a1)
{
  uint64_t v2 = (char *)malloc_type_malloc(0x48uLL, 0x1090040E7945993uLL);
  if (v2)
  {
    if (a1) {
      uint64_t v3 = a1;
    }
    else {
      uint64_t v3 = (const __int32 *)&unk_213B276D0;
    }
    unint64_t v4 = sub_213B24874(v3);
    *(void *)uint64_t v2 = v4;
    if (v4)
    {
      *(_OWORD *)(v2 + 8) = xmmword_213B276C0;
      uint64_t v5 = malloc_type_malloc(0x50uLL, 0x10040436913F5uLL);
      *((void *)v2 + 3) = v5;
      if (v5)
      {
        *uint64_t v5 = 0;
        int v6 = (char *)malloc_type_malloc(0x50uLL, 0x100004052888210uLL);
        *((void *)v2 + 7) = v6;
        if (v6)
        {
          *((void *)v2 + 5) = v6 + 80;
          *((void *)v2 + 6) = v6;
          *((void *)v2 + 4) = v6;
          *((void *)v2 + 8) = 0;
          return (TokenizerW *)v2;
        }
        free(*((void **)v2 + 3));
      }
      free(*(void **)v2);
    }
    free(v2);
    return 0;
  }
  return (TokenizerW *)v2;
}

void tok_wreset(TokenizerW *a1)
{
  *((void *)a1 + longjmp(dword_2677F43AC, 1) = 0;
  uint64_t v1 = *((void *)a1 + 7);
  *((void *)a1 + 6) = v1;
  *((void *)a1 + 4) = v1;
  *((void *)a1 + 8) = 0;
}

void tok_wend(TokenizerW *a1)
{
  free(*(void **)a1);
  free(*((void **)a1 + 7));
  free(*((void **)a1 + 3));

  free(a1);
}

int tok_wline(TokenizerW *a1, const LineInfoW *a2, int *a3, const __int32 ***a4, int *a5, int *a6)
{
  int buffer = a2->buffer;
  int v11 = -1;
  LODWORD(v12) = -1;
  while (1)
  {
    if (buffer >= a2->lastchar) {
      uint64_t v13 = (const __int32 *)&unk_213B276E0;
    }
    else {
      uint64_t v13 = buffer;
    }
    if (v13 == a2->cursor)
    {
      int v11 = *((_DWORD *)a1 + 2);
      uint64_t v12 = (*((void *)a1 + 4) - *((void *)a1 + 6)) >> 2;
    }
    __int32 v14 = *v13;
    if (*v13 <= 33) {
      break;
    }
    if (v14 == 34)
    {
      int v19 = *((_DWORD *)a1 + 16);
      *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
      switch(v19)
      {
        case 0:
          goto LABEL_31;
        case 1:
          goto LABEL_27;
        case 2:
          goto LABEL_35;
        case 3:
LABEL_26:
          *((_DWORD *)a1 + 16) = 0;
          goto LABEL_27;
        case 4:
LABEL_25:
          *((_DWORD *)a1 + 16) = 2;
          goto LABEL_27;
        default:
          return -1;
      }
    }
    if (v14 != 92)
    {
      if (v14 == 39)
      {
        int v15 = *((_DWORD *)a1 + 16);
        *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
        switch(v15)
        {
          case 0:
            int v16 = 1;
            goto LABEL_33;
          case 1:
            goto LABEL_35;
          case 2:
            goto LABEL_27;
          case 3:
            goto LABEL_26;
          case 4:
            goto LABEL_25;
          default:
            return -1;
        }
      }
      goto LABEL_22;
    }
    int v20 = *((_DWORD *)a1 + 16);
    *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
    switch(v20)
    {
      case 0:
        int v16 = 3;
        break;
      case 1:
        goto LABEL_27;
      case 2:
        int v16 = 4;
        break;
      case 3:
        unsigned int v25 = (__int32 *)*((void *)a1 + 4);
        *unsigned int v25 = *v13;
        *((void *)a1 + 4) = v25 + 1;
        goto LABEL_35;
      case 4:
        goto LABEL_25;
      default:
        return -1;
    }
LABEL_33:
    *((_DWORD *)a1 + 16) = v16;
LABEL_36:
    uint64_t v26 = *((void *)a1 + 5);
    if (*((void *)a1 + 4) >= (unint64_t)(v26 - 16))
    {
      unsigned __int32 v27 = (void *)*((void *)a1 + 7);
      uint64_t v28 = ((v26 - (uint64_t)v27) >> 2) + 20;
      uint64_t v29 = (char *)malloc_type_realloc(v27, 4 * v28, 0x100004052888210uLL);
      if (!v29) {
        return -1;
      }
      uint64_t v30 = (char *)*((void *)a1 + 7);
      if (v29 != v30)
      {
        uint64_t v31 = *((void *)a1 + 1);
        if (v31)
        {
          for (uint64_t i = 0; i != v31; ++i)
            *(void *)(*((void *)a1 + 3) + 8 * i) = &v29[*(void *)(*((void *)a1 + 3) + 8 * i)
                                                          - *((void *)a1 + 7)];
          uint64_t v30 = (char *)*((void *)a1 + 7);
        }
        *((void *)a1 + 4) = &v29[*((void *)a1 + 4) - (void)v30];
        *((void *)a1 + 6) = &v29[*((void *)a1 + 6) - (void)v30];
        *((void *)a1 + 7) = v29;
      }
      *((void *)a1 + 5) = &v29[4 * v28];
    }
    uint64_t v33 = *((void *)a1 + 2);
    if (*((void *)a1 + 1) >= (unint64_t)(v33 - 4))
    {
      uint64_t v34 = v33 + 10;
      *((void *)a1 + 2) = v34;
      uint64_t v35 = malloc_type_realloc(*((void **)a1 + 3), 8 * v34, 0x10040436913F5uLL);
      if (!v35) {
        return -1;
      }
      *((void *)a1 + 3) = v35;
    }
    int buffer = v13 + 1;
  }
  if (!v14)
  {
    int result = *((_DWORD *)a1 + 16);
    switch(result)
    {
      case 0:
        int v38 = *((_DWORD *)a1 + 17);
        if ((v38 & 2) != 0)
        {
          *((_DWORD *)a1 + 17) = v38 & 0xFFFFFFFD;
          return 3;
        }
        else
        {
LABEL_53:
          if (v11 == -1)
          {
            int v40 = a5;
            int v39 = a6;
            if (v12 == -1)
            {
              int v11 = *((_DWORD *)a1 + 2);
              uint64_t v12 = (*((void *)a1 + 4) - *((void *)a1 + 6)) >> 2;
            }
          }
          else
          {
            int v40 = a5;
            int v39 = a6;
          }
          if (v40) {
            int *v40 = v11;
          }
          if (v39) {
            int *v39 = v12;
          }
          sub_213B21394((uint64_t)a1);
          int result = 0;
          *a4 = (const __int32 **)*((void *)a1 + 3);
          *a3 = *((void *)a1 + 1);
        }
        return result;
      case 1:
      case 2:
        return result;
      case 3:
        *((_DWORD *)a1 + 16) = 0;
        goto LABEL_29;
      case 4:
        *((_DWORD *)a1 + 16) = 2;
LABEL_29:
        int v24 = (_DWORD *)*((void *)a1 + 4);
        *int v24 = 0;
        *((void *)a1 + 4) = v24 + 1;
        break;
      default:
        return -1;
    }
    goto LABEL_36;
  }
  if (v14 != 10)
  {
LABEL_22:
    int v22 = *((_DWORD *)a1 + 16);
    *((_DWORD *)a1 + 17) &= ~2u;
    switch(v22)
    {
      case 0:
        if (!wcschr(*(__int32 **)a1, *v13)) {
          goto LABEL_27;
        }
        sub_213B21394((uint64_t)a1);
        break;
      case 1:
      case 2:
        goto LABEL_27;
      case 3:
        goto LABEL_26;
      case 4:
        uint64_t v36 = (_DWORD *)*((void *)a1 + 4);
        _DWORD *v36 = 92;
        *((_DWORD *)a1 + 16) = 2;
        __int32 v37 = *v13;
        *((void *)a1 + 4) = v36 + 2;
        v36[1] = v37;
        goto LABEL_36;
      default:
        return -1;
    }
    goto LABEL_36;
  }
  int v18 = *((_DWORD *)a1 + 16);
  int v17 = *((_DWORD *)a1 + 17);
  *((_DWORD *)a1 + 17) = v17 & 0xFFFFFFFD;
  switch(v18)
  {
    case 0:
      goto LABEL_53;
    case 1:
    case 2:
LABEL_27:
      char v23 = (__int32 *)*((void *)a1 + 4);
      *char v23 = *v13;
      *((void *)a1 + 4) = v23 + 1;
      goto LABEL_36;
    case 3:
      *((_DWORD *)a1 + 17) = v17 | 2;
LABEL_35:
      *((_DWORD *)a1 + 16) = 0;
      goto LABEL_36;
    case 4:
      *((_DWORD *)a1 + 17) = v17 | 2;
LABEL_31:
      *((_DWORD *)a1 + 16) = 2;
      goto LABEL_36;
    default:
      int result = 0;
      break;
  }
  return result;
}

uint64_t sub_213B21394(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)(result + 32);
  *uint64_t v1 = 0;
  int v2 = *(_DWORD *)(result + 68);
  uint64_t v3 = *(_DWORD **)(result + 48);
  if ((v2 & 1) != 0 || v1 != v3)
  {
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v5 = *(void *)(result + 8);
    *(void *)(result + 8) = v5 + 1;
    *(void *)(v4 + 8 * v5) = v3;
    *(void *)(*(void *)(result + 24) + 8 * (v5 + 1)) = 0;
    uint64_t v6 = *(void *)(result + 32) + 4;
    *(void *)(result + 32) = v6;
    *(void *)(result + 48) = v6;
  }
  *(_DWORD *)(result + 68) = v2 & 0xFFFFFFFE;
  return result;
}

int tok_wstr(TokenizerW *a1, const __int32 *a2, int *a3, const __int32 ***a4)
{
  v8.int buffer = a2;
  v8.unint64_t cursor = wcschr((__int32 *)a2, 0);
  v8.lastchar = v8.cursor;
  return tok_wline(a1, &v8, a3, a4, 0, 0);
}

uint64_t sub_213B21450(uint64_t a1)
{
  uint64_t result = 0;
  *(_OWORD *)(a1 + 392) = *(_OWORD *)&off_2641D7028;
  *(_OWORD *)(a1 + 408) = xmmword_2641D7038;
  *(_OWORD *)(a1 + 424) = *(_OWORD *)&off_2641D7048;
  *(_OWORD *)(a1 + 44el_set((EditLine *)qword_2677F4398, 15, 0) = xmmword_2641D7058;
  *(_OWORD *)(a1 + 328) = *(_OWORD *)&off_2641D6FE8;
  *(_OWORD *)(a1 + 344) = xmmword_2641D6FF8;
  *(_OWORD *)(a1 + 36el_set((EditLine *)qword_2677F4398, 15, 0) = *(_OWORD *)&off_2641D7008;
  *(_OWORD *)(a1 + 376) = xmmword_2641D7018;
  *(_OWORD *)(a1 + 264) = *(_OWORD *)&off_2641D6FA8;
  *(_OWORD *)(a1 + 28el_set((EditLine *)qword_2677F4398, 15, 0) = xmmword_2641D6FB8;
  *(_OWORD *)(a1 + 296) = *(_OWORD *)&off_2641D6FC8;
  *(_OWORD *)(a1 + 312) = xmmword_2641D6FD8;
  *(_OWORD *)(a1 + 216) = xmmword_2641D6F78;
  *(unsigned char *)(a1 + 844) = -1;
  *(_OWORD *)(a1 + 232) = *(_OWORD *)&off_2641D6F88;
  *(_OWORD *)(a1 + 248) = xmmword_2641D6F98;
  *(_OWORD *)(a1 + 488) = xmmword_213B27708;
  *(_OWORD *)(a1 + 504) = unk_213B27718;
  *(_OWORD *)(a1 + 515) = unk_213B27723;
  *(_DWORD *)(a1 + 84el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
  *(_OWORD *)(a1 + 456) = xmmword_213B276E8;
  *(_OWORD *)(a1 + 472) = unk_213B276F8;
  if ((*(unsigned char *)(a1 + 44) & 4) == 0)
  {
    if (!isatty(*(_DWORD *)(a1 + 36))) {
      return 0xFFFFFFFFLL;
    }
    int v19 = 0;
    if (ioctl(*(_DWORD *)(a1 + 36), 0x40047477uLL, &v19) < 0)
    {
      int v3 = *__error();
      uint64_t result = 0xFFFFFFFFLL;
      if (v3 != 25) {
        return result;
      }
      int v19 = -1;
    }
    else if ((v19 & 0x80000000) == 0 && getpgrp() != v19)
    {
      return 0xFFFFFFFFLL;
    }
    uint64_t v4 = (long long *)(a1 + 536);
    uint64_t result = sub_213B21CE8(a1, (termios *)(a1 + 536));
    if (result != -1)
    {
      long long v5 = *(_OWORD *)(a1 + 568);
      long long v6 = *(_OWORD *)(a1 + 584);
      *(_OWORD *)(a1 + 712) = v5;
      *(_OWORD *)(a1 + 728) = v6;
      uint64_t v7 = *(void *)(a1 + 600);
      *(void *)(a1 + 744) = v7;
      long long v9 = *v4;
      long long v8 = *(_OWORD *)(a1 + 552);
      *(_OWORD *)(a1 + 68el_set((EditLine *)qword_2677F4398, 15, 0) = *v4;
      *(_OWORD *)(a1 + 696) = v8;
      *(_OWORD *)(a1 + 64el_set((EditLine *)qword_2677F4398, 15, 0) = v5;
      *(_OWORD *)(a1 + 656) = v6;
      *(void *)(a1 + 672) = v7;
      *(_OWORD *)(a1 + 608) = v9;
      *(_OWORD *)(a1 + 624) = v8;
      *(_OWORD *)(a1 + 784) = v5;
      *(_OWORD *)(a1 + 80el_set((EditLine *)qword_2677F4398, 15, 0) = v6;
      *(_OWORD *)(a1 + 752) = v9;
      *(_OWORD *)(a1 + 768) = v8;
      *(void *)(a1 + 816) = v7;
      speed_t v10 = cfgetispeed((const termios *)(a1 + 608));
      if (!v10) {
        speed_t v10 = cfgetospeed((const termios *)(a1 + 608));
      }
      *(void *)(a1 + 832) = v10;
      uint64_t v11 = *(void *)(a1 + 616);
      *(_DWORD *)(a1 + 824) = (v11 & 4) == 0;
      uint64_t v12 = *(void *)(a1 + 624);
      *(_DWORD *)(a1 + 828) = (~*(_DWORD *)(a1 + 624) & 0x300) == 0;
      *(void *)(a1 + 608) = *(void *)(a1 + 608) & ~*(_DWORD *)(a1 + 228) | *(unsigned int *)(a1 + 224);
      *(void *)(a1 + 616) = v11 & ~*(_DWORD *)(a1 + 244) | (unint64_t)*(unsigned int *)(a1 + 240);
      *(void *)(a1 + 624) = v12 & ~*(_DWORD *)(a1 + 260) | (unint64_t)*(unsigned int *)(a1 + 256);
      *(void *)(a1 + 632) = *(void *)(a1 + 632) & ~*(_DWORD *)(a1 + 276) | *(unsigned int *)(a1 + 272);
      if (*(unsigned char *)(a1 + 777))
      {
        sub_213B21D40((unsigned char *)(a1 + 752), (unsigned char *)(a1 + 506));
        for (uint64_t i = 0; i != 23; ++i)
        {
          uint64_t v14 = a1 + i;
          int v15 = *(unsigned __int8 *)(a1 + i + 506);
          int v16 = *(unsigned __int8 *)(a1 + 844);
          if (v15 != v16 && *(unsigned __int8 *)(v14 + 481) != v16) {
            *(unsigned char *)(v14 + 48longjmp(dword_2677F43AC, 1) = v15;
          }
        }
        for (uint64_t j = 0; j != 25; ++j)
        {
          int v18 = *(unsigned __int8 *)(a1 + j + 506);
          if (v18 != *(unsigned __int8 *)(a1 + 844)) {
            *(unsigned char *)(a1 + j + 456) = v18;
          }
        }
      }
      sub_213B21DD4((unsigned char *)(a1 + 608), (unsigned char *)(a1 + 456));
      uint64_t result = sub_213B217A0(a1, 1, (termios *)(a1 + 608));
      if (result != -1)
      {
        *(void *)(a1 + 68el_set((EditLine *)qword_2677F4398, 15, 0) = *(void *)(a1 + 680) & ~*(_DWORD *)(a1 + 308) | *(unsigned int *)(a1 + 304);
        *(void *)(a1 + 688) = *(void *)(a1 + 688) & ~*(_DWORD *)(a1 + 324) | *(unsigned int *)(a1 + 320);
        *(void *)(a1 + 696) = *(void *)(a1 + 696) & ~*(_DWORD *)(a1 + 340) | *(unsigned int *)(a1 + 336);
        *(void *)(a1 + 704) = *(void *)(a1 + 704) & ~*(_DWORD *)(a1 + 356) | *(unsigned int *)(a1 + 352);
        sub_213B21DD4((unsigned char *)(a1 + 680), (unsigned char *)(a1 + 481));
        sub_213B21800(a1, 1);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_213B21784(uint64_t result)
{
  if ((*(unsigned char *)(result + 44) & 6) == 0) {
    return sub_213B217A0(result, 2, (termios *)(result + 536));
  }
  return result;
}

uint64_t sub_213B217A0(uint64_t a1, int a2, termios *a3)
{
  do
    uint64_t v6 = tcsetattr(*(_DWORD *)(a1 + 32), a2, a3);
  while (v6 == -1 && *__error() == 4);
  return v6;
}

uint64_t sub_213B21800(uint64_t result, int a2)
{
  uint64_t v3 = result;
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15[1] = 0;
  v16[1] = 0;
  uint64_t v4 = *(void *)(result + 1056);
  uint64_t v5 = *(void *)(result + 1048);
  if (*(_DWORD *)(result + 1096) == 1)
  {
    uint64_t v6 = (uint64_t *)(result + 1088);
    uint64_t v7 = *(void *)(result + 1080);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = (uint64_t *)(result + 1072);
  }
  uint64_t v8 = result + 712;
  uint64_t v9 = *v6;
  int v10 = 2;
  uint64_t v11 = &unk_213B27734;
  do
  {
    int v12 = *(unsigned __int8 *)(v3 + 481 + v10);
    v16[0] = v12;
    int v13 = *(unsigned __int8 *)(v8 + *((int *)v11 + 1));
    v15[0] = v13;
    if (a2 || v12 != v13)
    {
      sub_213B166B0(v3, v4, v15);
      *(unsigned char *)(v4 + v15[0]) = *(unsigned char *)(v9 + v15[0]);
      uint64_t result = sub_213B166B0(v3, v4, v16);
      *(unsigned char *)(v4 + v16[0]) = v11[*(int *)(v3 + 1096) + 8];
      if (v7)
      {
        sub_213B166B0(v3, v5, v15);
        *(unsigned char *)(v5 + v15[0]) = *(unsigned char *)(v7 + v15[0]);
        uint64_t result = sub_213B166B0(v3, v5, v16);
        *(unsigned char *)(v5 + v16[0]) = v11[*(int *)(v3 + 1096) + 9];
      }
    }
    int v14 = *((_DWORD *)v11 + 3);
    v11 += 12;
    int v10 = v14;
  }
  while (v14 != -1);
  return result;
}

uint64_t sub_213B21970(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 840) - 1) < 2 || (*(unsigned char *)(a1 + 44) & 6) != 0) {
    return 0;
  }
  uint64_t v3 = (uint64_t *)(a1 + 752);
  uint64_t result = sub_213B21CE8(a1, (termios *)(a1 + 752));
  if (result != -1)
  {
    *(_DWORD *)(a1 + 828) = (~*(_DWORD *)(a1 + 768) & 0x300) == 0;
    speed_t v4 = cfgetispeed((const termios *)(a1 + 752));
    if (!v4) {
      speed_t v4 = cfgetospeed((const termios *)(a1 + 752));
    }
    *(void *)(a1 + 832) = v4;
    speed_t v5 = cfgetispeed((const termios *)(a1 + 608));
    if (!v5) {
      speed_t v5 = cfgetospeed((const termios *)(a1 + 608));
    }
    speed_t v6 = *(void *)(a1 + 832);
    if (v5 != v6) {
      goto LABEL_14;
    }
    speed_t v7 = cfgetispeed((const termios *)(a1 + 680));
    if (!v7) {
      speed_t v7 = cfgetospeed((const termios *)(a1 + 680));
    }
    speed_t v6 = *(void *)(a1 + 832);
    if (v7 != v6)
    {
LABEL_14:
      cfsetispeed((termios *)(a1 + 608), v6);
      cfsetospeed((termios *)(a1 + 608), *(void *)(a1 + 832));
      cfsetispeed((termios *)(a1 + 680), *(void *)(a1 + 832));
      cfsetospeed((termios *)(a1 + 680), *(void *)(a1 + 832));
    }
    uint64_t v8 = *(void *)(a1 + 776);
    if ((v8 & 0x100) != 0)
    {
      uint64_t v9 = *(void *)(a1 + 768);
      if (v9 != *(void *)(a1 + 624))
      {
        *(void *)(a1 + 624) = v9 & ~*(_DWORD *)(a1 + 260) | (unint64_t)*(unsigned int *)(a1 + 256);
        *(void *)(a1 + 696) = v9 & ~*(_DWORD *)(a1 + 340) | (unint64_t)*(unsigned int *)(a1 + 336);
      }
      if (v8 != *(void *)(a1 + 632) && v8 != *(void *)(a1 + 704))
      {
        *(void *)(a1 + 632) = v8 & ~*(_DWORD *)(a1 + 276) | (unint64_t)*(unsigned int *)(a1 + 272);
        *(void *)(a1 + 704) = v8 & ~*(_DWORD *)(a1 + 356) | (unint64_t)*(unsigned int *)(a1 + 352);
      }
      uint64_t v10 = *v3;
      if (*v3 != *(void *)(a1 + 608) && v10 != *(void *)(a1 + 680))
      {
        *(void *)(a1 + 608) = v10 & ~*(_DWORD *)(a1 + 228) | (unint64_t)*(unsigned int *)(a1 + 224);
        *(void *)(a1 + 68el_set((EditLine *)qword_2677F4398, 15, 0) = v10 & ~*(_DWORD *)(a1 + 308) | (unint64_t)*(unsigned int *)(a1 + 304);
      }
      uint64_t v11 = *(void *)(a1 + 760);
      LOBYTE(v12) = v11;
      if (v11 != *(void *)(a1 + 616))
      {
        unint64_t v12 = *(void *)(a1 + 616);
        if (v11 != *(void *)(a1 + 688))
        {
          unint64_t v12 = v11 & ~*(_DWORD *)(a1 + 244) | (unint64_t)*(unsigned int *)(a1 + 240);
          *(void *)(a1 + 616) = v12;
          *(void *)(a1 + 688) = v11 & ~*(_DWORD *)(a1 + 324) | (unint64_t)*(unsigned int *)(a1 + 320);
        }
      }
      if ((v12 & 4) != 0) {
        int v13 = 0;
      }
      else {
        int v13 = (*(_DWORD *)(a1 + 160) >> 3) & 1;
      }
      *(_DWORD *)(a1 + 824) = v13;
      sub_213B21D40((unsigned char *)(a1 + 752), (unsigned char *)(a1 + 506));
      uint64_t v14 = 0;
      while (*(unsigned __int8 *)(a1 + v14 + 506) == *(unsigned __int8 *)(a1 + v14 + 456))
      {
        if (++v14 == 25) {
          goto LABEL_49;
        }
      }
      uint64_t v15 = 0;
      int v16 = *(_DWORD *)(a1 + 368);
      int v17 = *(_DWORD *)(a1 + 372);
      do
      {
        if ((v16 & (1 << v15)) == 0)
        {
          int v18 = *(unsigned __int8 *)(a1 + v15 + 506);
          if (v18 != *(unsigned __int8 *)(a1 + v15 + 456)) {
            *(unsigned char *)(a1 + v15 + 48longjmp(dword_2677F43AC, 1) = v18;
          }
        }
        if ((v17 & (1 << v15)) != 0) {
          *(unsigned char *)(a1 + v15 + 48longjmp(dword_2677F43AC, 1) = *(unsigned char *)(a1 + 844);
        }
        ++v15;
      }
      while (v15 != 25);
      sub_213B21800(a1, 0);
      sub_213B21DD4((unsigned char *)(a1 + 680), (unsigned char *)(a1 + 481));
      uint64_t v19 = 0;
      int v20 = *(_DWORD *)(a1 + 288);
      int v21 = *(_DWORD *)(a1 + 292);
      do
      {
        if ((v20 & (1 << v19)) == 0)
        {
          int v22 = *(unsigned __int8 *)(a1 + v19 + 506);
          if (v22 != *(unsigned __int8 *)(a1 + v19 + 456)) {
            *(unsigned char *)(a1 + v19 + 456) = v22;
          }
        }
        if ((v21 & (1 << v19)) != 0) {
          *(unsigned char *)(a1 + v19 + 456) = *(unsigned char *)(a1 + 844);
        }
        ++v19;
      }
      while (v19 != 25);
      sub_213B21DD4((unsigned char *)(a1 + 608), (unsigned char *)(a1 + 456));
    }
LABEL_49:
    uint64_t result = sub_213B217A0(a1, 1, (termios *)(a1 + 680));
    if (result != -1)
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 84el_set((EditLine *)qword_2677F4398, 15, 0) = 1;
    }
  }
  return result;
}

uint64_t sub_213B21CE8(uint64_t a1, termios *a2)
{
  do
    uint64_t v4 = tcgetattr(*(_DWORD *)(a1 + 32), a2);
  while (v4 == -1 && *__error() == 4);
  return v4;
}

unsigned char *sub_213B21D40(unsigned char *result, unsigned char *a2)
{
  *a2 = result[40];
  a2[1] = result[41];
  a2[2] = result[35];
  a2[3] = result[37];
  a2[4] = result[32];
  a2[5] = result[33];
  a2[6] = result[34];
  a2[10] = result[44];
  a2[11] = result[45];
  a2[12] = result[36];
  a2[13] = result[42];
  a2[14] = result[43];
  a2[15] = result[38];
  a2[16] = result[47];
  a2[17] = result[46];
  a2[18] = result[50];
  a2[23] = result[48];
  a2[24] = result[49];
  return result;
}

unsigned char *sub_213B21DD4(unsigned char *result, unsigned char *a2)
{
  result[40] = *a2;
  result[41] = a2[1];
  result[35] = a2[2];
  result[37] = a2[3];
  result[32] = a2[4];
  result[33] = a2[5];
  result[34] = a2[6];
  result[44] = a2[10];
  result[45] = a2[11];
  result[36] = a2[12];
  result[42] = a2[13];
  result[43] = a2[14];
  result[38] = a2[15];
  result[47] = a2[16];
  result[46] = a2[17];
  result[50] = a2[18];
  result[48] = a2[23];
  result[49] = a2[24];
  return result;
}

uint64_t sub_213B21E68(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 840) || (*(unsigned char *)(a1 + 44) & 6) != 0) {
    return 0;
  }
  uint64_t result = sub_213B217A0(a1, 1, (termios *)(a1 + 608));
  if (result != -1)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 84el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
  }
  return result;
}

uint64_t sub_213B21EC4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 840) == 2 || (*(unsigned char *)(a1 + 44) & 6) != 0) {
    return 0;
  }
  *(void *)(a1 + 816) = *(void *)(a1 + 744);
  long long v3 = *(_OWORD *)(a1 + 696);
  *(_OWORD *)(a1 + 752) = *(_OWORD *)(a1 + 680);
  *(_OWORD *)(a1 + 768) = v3;
  long long v4 = *(_OWORD *)(a1 + 728);
  *(_OWORD *)(a1 + 784) = *(_OWORD *)(a1 + 712);
  *(_OWORD *)(a1 + 80el_set((EditLine *)qword_2677F4398, 15, 0) = v4;
  *(void *)(a1 + 752) = *(void *)(a1 + 752) & ~*(_DWORD *)(a1 + 388) | *(unsigned int *)(a1 + 384);
  *(void *)(a1 + 76el_set((EditLine *)qword_2677F4398, 15, 0) = *(void *)(a1 + 760) & ~*(_DWORD *)(a1 + 404) | *(unsigned int *)(a1 + 400);
  *(void *)(a1 + 768) = *(void *)(a1 + 768) & ~*(_DWORD *)(a1 + 420) | *(unsigned int *)(a1 + 416);
  *(void *)(a1 + 776) = *(void *)(a1 + 776) & ~*(_DWORD *)(a1 + 436) | *(unsigned int *)(a1 + 432);
  uint64_t result = sub_213B217A0(a1, 1, (termios *)(a1 + 752));
  if (result != -1)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 84el_set((EditLine *)qword_2677F4398, 15, 0) = 2;
  }
  return result;
}

uint64_t sub_213B21FB4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 840) != 2 || (*(unsigned char *)(a1 + 44) & 6) != 0) {
    return 0;
  }
  uint64_t result = sub_213B217A0(a1, 1, (termios *)(a1 + 680));
  if (result != -1)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 84el_set((EditLine *)qword_2677F4398, 15, 0) = 1;
  }
  return result;
}

uint64_t sub_213B22018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)(a1 + 44) & 6) != 0) {
    return 0;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v47 = a1 + 216;
  speed_t v6 = sub_213B23790(*(unsigned __int32 **)a3, a1 + 1264);
  strncpy(__dst, (const char *)v6, 0x400uLL);
  __dst[1023] = 0;
  uint64_t v9 = *(__int32 **)(a3 + 8);
  speed_t v7 = (__int32 **)(a3 + 8);
  uint64_t v8 = v9;
  if (!v9)
  {
    int v11 = 0;
    unsigned int v10 = 0;
LABEL_52:
    size_t v28 = 0;
    size_t v29 = 0;
    int v30 = -1;
    uint64_t v31 = "ignbrk";
    int v32 = &off_2641D7078;
    do
    {
      int v33 = *((_DWORD *)v32 - 1);
      if (v33 != v30)
      {
        uint64_t v34 = "";
        if (v30 != -1) {
          uint64_t v34 = "\n";
        }
        uint64_t v35 = v47 + 80 * v10;
        fprintf(*(FILE **)(a1 + 16), "%s%s", v34, *(const char **)(v35 + 16 * v33));
        size_t v29 = strlen(*(const char **)(v35 + 16 * v33));
        int v30 = v33;
        size_t v28 = v29;
      }
      if (v30 == -1)
      {
        int v41 = 0;
      }
      else
      {
        uint64_t v36 = v47 + 80 * v10 + 16 * v30;
        int v37 = *((_DWORD *)v32 - 2);
        int v39 = *(_DWORD *)(v36 + 8);
        int v38 = *(_DWORD *)(v36 + 12);
        if ((v37 & v39) != 0) {
          int v40 = 43;
        }
        else {
          int v40 = 0;
        }
        if ((v38 & v37) != 0) {
          int v41 = 45;
        }
        else {
          int v41 = v40;
        }
      }
      if (v41 | v11)
      {
        size_t v42 = strlen(v31);
        uint64_t v43 = 1;
        if (v41) {
          uint64_t v43 = 2;
        }
        size_t v44 = v43 + v42;
        v29 += v43 + v42;
        if (v29 >= *(int *)(a1 + 152))
        {
          fprintf(*(FILE **)(a1 + 16), "\n%*s", v28, "");
          size_t v29 = v44 + v28;
        }
        uint64_t v45 = *(FILE **)(a1 + 16);
        if (v41) {
          fprintf(v45, "%c%s ");
        }
        else {
          fprintf(v45, "%s ");
        }
      }
      int v46 = *v32;
      v32 += 2;
      uint64_t v31 = v46;
    }
    while (v46);
    fputc(10, *(FILE **)(a1 + 16));
    return 0;
  }
  unsigned int v10 = 0;
  int v11 = 0;
  unint64_t v12 = (termios *)(a1 + 608);
  while (*v8 == 45 && !v8[2])
  {
    int v13 = v8[1];
    if (v13 > 112)
    {
      if (v13 == 113)
      {
        unsigned int v10 = 2;
        unint64_t v12 = (termios *)(a1 + 752);
      }
      else
      {
        if (v13 != 120)
        {
LABEL_75:
          return 0xFFFFFFFFLL;
        }
        unsigned int v10 = 0;
        unint64_t v12 = (termios *)(a1 + 608);
      }
    }
    else if (v13 == 97)
    {
      ++v11;
    }
    else
    {
      if (v13 != 100) {
        goto LABEL_75;
      }
      unsigned int v10 = 1;
      unint64_t v12 = (termios *)(a1 + 680);
    }
    uint64_t v14 = v7[1];
    ++v7;
    uint64_t v8 = v14;
    if (!v14) {
      goto LABEL_52;
    }
  }
  uint64_t v15 = "ignbrk";
  int v16 = &dword_2641D7070;
  while (2)
  {
    unint64_t v48 = 0;
    __int32 v17 = *v8;
    if (*v8 == 45 || v17 == 43) {
      ++v8;
    }
    else {
      LOBYTE(v17) = 0;
    }
    ++v7;
    int v18 = wcschr(v8, 61);
    unint64_t v48 = v18;
    while (1)
    {
      uint64_t v19 = sub_213B23790((unsigned __int32 *)v8, a1 + 1264);
      if (v18)
      {
        if (strncmp(v15, (const char *)v19, v48 - v8)) {
          goto LABEL_31;
        }
      }
      else if (strcmp(v15, (const char *)v19))
      {
        goto LABEL_31;
      }
      if (!v48)
      {
        if (v17 == 45)
        {
          uint64_t v26 = v47 + 80 * v10 + 16 * v16[1];
          int v27 = *(_DWORD *)(v26 + 12) | *v16;
          *(_DWORD *)(v26 + 8) &= ~*v16;
          *(_DWORD *)(v26 + 12) = v27;
          uint64_t v15 = "ignbrk";
        }
        else
        {
          uint64_t v15 = "ignbrk";
          int v20 = (int8x8_t *)(v47 + 80 * v10 + 16 * v16[1]);
          if ((char)v17 == 43)
          {
            int v21 = v20[1].i32[1] & ~*v16;
            v20[1].i32[0] |= *v16;
            v20[1].i32[1] = v21;
          }
          else
          {
            v20[1] = vand_s8(v20[1], (int8x8_t)vdup_n_s32(~*v16));
          }
        }
        goto LABEL_45;
      }
      if (v16[1] == 4) {
        break;
      }
LABEL_31:
      uint64_t v15 = (const char *)*((void *)v16 + 1);
      if (!v15)
      {
        return 0xFFFFFFFFLL;
      }
      int v18 = v48;
      v16 += 4;
    }
    unsigned int v22 = *v16;
    __int32 v23 = v48[1];
    ++v48;
    if (v23) {
      cc_t v24 = sub_213B17BF0(&v48);
    }
    else {
      cc_t v24 = *(unsigned char *)(a1 + 844);
    }
    uint64_t v15 = "ignbrk";
    if (!v22) {
      sub_213B26138();
    }
    unsigned int v25 = __clz(__rbit32(v22));
    if (v25 >= 0x19 || ((0x187FC7Fu >> v25) & 1) == 0) {
      sub_213B26164();
    }
    v12->c_cc[qword_213B27788[v25]] = v24;
LABEL_45:
    int v16 = &dword_2641D7070;
    uint64_t v8 = *v7;
    if (*v7) {
      continue;
    }
    break;
  }
  if (*(_DWORD *)(a1 + 840) != v10) {
    return 0;
  }
  uint64_t result = sub_213B217A0(a1, 1, v12);
  if (result != -1) {
    return 0;
  }
  return result;
}

uint64_t sub_213B22500(uint64_t a1)
{
  return sub_213B22508(a1, 0);
}

uint64_t sub_213B22508(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 944);
  uint64_t v3 = *(void *)(a1 + 936);
  if (v3) {
    BOOL v4 = v2 == v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 6;
  }
  size_t v7 = v2 - v3;
  uint64_t v8 = (v2 - v3) >> 2;
  sub_213B107E0(a1);
  if (!a2)
  {
    unint64_t v9 = *(void *)(a1 + 96);
    if (v9 < *(void *)(a1 + 104)) {
      *(void *)(a1 + 96) = v9 + 4;
    }
  }
  sub_213B10894(a1, v7 >> 2);
  unsigned int v10 = *(void **)(a1 + 96);
  if ((unint64_t)v10 + 4 * v8 > *(void *)(a1 + 104)) {
    return 6;
  }
  memcpy(v10, *(const void **)(a1 + 936), v7);
  return 4;
}

uint64_t sub_213B225A0(uint64_t a1)
{
  return sub_213B22508(a1, 1);
}

uint64_t sub_213B225A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 == v3) {
    return 6;
  }
  *(void *)(a1 + 96) = sub_213B10FB8(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_213B10D94);
  if (!*(_DWORD *)(a1 + 1000)) {
    return 5;
  }
  sub_213B1107C(a1);
  return 4;
}

uint64_t sub_213B22618(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 == v3) {
    return 6;
  }
  *(void *)(a1 + 96) = sub_213B10FB8(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_213B10D0C);
  if (!*(_DWORD *)(a1 + 1000)) {
    return 5;
  }
  sub_213B1107C(a1);
  return 4;
}

uint64_t sub_213B22688(uint64_t a1)
{
  uint64_t v1 = *(unsigned int **)(a1 + 96);
  unint64_t v2 = *(void *)(a1 + 104);
  if ((unint64_t)v1 >= v2 - 4) {
    return 6;
  }
  *(void *)(a1 + 96) = sub_213B10ED4(a1, v1, v2, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_213B10D94);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5;
  }
  sub_213B1107C(a1);
  return 4;
}

uint64_t sub_213B22704(uint64_t a1)
{
  uint64_t v1 = *(unsigned int **)(a1 + 96);
  unint64_t v2 = *(void *)(a1 + 104);
  if ((unint64_t)v1 >= v2 - 4) {
    return 6;
  }
  *(void *)(a1 + 96) = sub_213B10ED4(a1, v1, v2, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_213B10D0C);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5;
  }
  sub_213B1107C(a1);
  return 4;
}

uint64_t sub_213B22780(uint64_t a1)
{
  if (*(void *)(a1 + 96) >= *(void *)(a1 + 104)) {
    return 6;
  }
  sub_213B107E0(a1);
  if (*(int *)(a1 + 128) < 1) {
    return 0;
  }
  int v2 = 0;
  uint64_t v3 = MEMORY[0x263EF8318];
  while (1)
  {
    BOOL v4 = *(__darwin_ct_rune_t **)(a1 + 96);
    uint64_t v5 = *v4;
    if (v5 > 0x7F)
    {
      if (__maskrune(*v4, 0x8000uLL))
      {
LABEL_9:
        __darwin_ct_rune_t v7 = __tolower(v5);
        goto LABEL_10;
      }
      if (__maskrune(v5, 0x1000uLL)) {
        goto LABEL_7;
      }
    }
    else
    {
      int v6 = *(_DWORD *)(v3 + 4 * v5 + 60);
      if ((v6 & 0x8000) != 0) {
        goto LABEL_9;
      }
      if ((v6 & 0x1000) != 0)
      {
LABEL_7:
        __darwin_ct_rune_t v7 = __toupper(v5);
LABEL_10:
        uint64_t v8 = *(__darwin_ct_rune_t **)(a1 + 96);
        *uint64_t v8 = v7;
        goto LABEL_11;
      }
    }
    uint64_t v8 = *(__darwin_ct_rune_t **)(a1 + 96);
LABEL_11:
    *(void *)(a1 + 96) = v8 + 1;
    if ((unint64_t)(v8 + 1) >= *(void *)(a1 + 104)) {
      break;
    }
    sub_213B1D2AC(a1);
    if (++v2 >= *(_DWORD *)(a1 + 128)) {
      return 0;
    }
  }
  *(void *)(a1 + 96) = v8;
  sub_213B1D2AC(a1);
  return 0;
}

uint64_t sub_213B22880(uint64_t a1)
{
  return sub_213B22888(a1, 3);
}

uint64_t sub_213B22888(uint64_t a1, int a2)
{
  char v2 = a2;
  int v4 = *(_DWORD *)(a1 + 1000);
  if (v4)
  {
    if (v4 == a2)
    {
      if ((a2 & 4) == 0) {
        sub_213B107E0(a1);
      }
      sub_213B10858(a1, *(const void **)(a1 + 88), (*(void *)(a1 + 104) - *(void *)(a1 + 88)) >> 2);
      *(_DWORD *)(a1 + 100el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
      *(void *)(a1 + 1008) = 0;
      if ((v2 & 4) == 0)
      {
        uint64_t v5 = *(void *)(a1 + 88);
        *(void *)(a1 + 96) = v5;
        *(void *)(a1 + 104) = v5;
      }
      if ((v2 & 2) != 0) {
        *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
      }
      return 4;
    }
    else
    {
      return 6;
    }
  }
  else
  {
    *(void *)(a1 + 1008) = *(void *)(a1 + 96);
    *(_DWORD *)(a1 + 100el_set((EditLine *)qword_2677F4398, 15, 0) = a2;
    return 3;
  }
}

uint64_t sub_213B22920(void *a1)
{
  a1[12] = a1[11];
  sub_213B107E0((uint64_t)a1);
  a1[133] = a1[132];
  return 5;
}

uint64_t sub_213B22958(uint64_t a1)
{
  if (*(void *)(a1 + 96) >= *(void *)(a1 + 104)) {
    return 6;
  }
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  *(_DWORD *)(a1 + 12el_set((EditLine *)qword_2677F4398, 15, 0) = 2;
  sub_213B107E0(a1);
  return 3;
}

uint64_t sub_213B22998(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  *(_DWORD *)(a1 + 12el_set((EditLine *)qword_2677F4398, 15, 0) = 1;
  sub_213B107E0(a1);
  return 0;
}

uint64_t sub_213B229C4(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  return 4;
}

uint64_t sub_213B229F8(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  return 4;
}

uint64_t sub_213B22A4C(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  return 4;
}

uint64_t sub_213B22A9C(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  sub_213B107E0(a1);
  return 0;
}

uint64_t sub_213B22AC0(void *a1)
{
  a1[133] = a1[132];
  unint64_t v2 = a1[12];
  unint64_t v1 = a1[13];
  if (v2 >= v1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    unint64_t v3 = v2 + 4;
    if (v3 <= v1) {
      unint64_t v1 = v3;
    }
    a1[12] = v1;
    uint64_t v4 = 5;
  }
  sub_213B107E0((uint64_t)a1);
  return v4;
}

uint64_t sub_213B22B14(void *a1)
{
  a1[133] = a1[132];
  a1[12] = a1[13];
  sub_213B107E0((uint64_t)a1);
  return 5;
}

uint64_t sub_213B22B40(uint64_t a1)
{
  return sub_213B22888(a1, 1);
}

uint64_t sub_213B22B48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  if (v2 == v3) {
    return 6;
  }
  uint64_t v4 = sub_213B11134(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_213B10D94);
  *(void *)(a1 + 96) = v4;
  if (!*(_DWORD *)(a1 + 1000)) {
    return 5;
  }
  *(void *)(a1 + 96) = v4 + 1;
  sub_213B1107C(a1);
  return 4;
}

uint64_t sub_213B22BC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  if (v2 == v3) {
    return 6;
  }
  uint64_t v4 = sub_213B11134(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_213B10D0C);
  *(void *)(a1 + 96) = v4;
  if (!*(_DWORD *)(a1 + 1000)) {
    return 5;
  }
  *(void *)(a1 + 96) = v4 + 1;
  sub_213B1107C(a1);
  return 4;
}

uint64_t sub_213B22C38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 912);
  if (v1 == -1) {
    return 6;
  }
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 112);
  *(void *)(a1 + 912) = (*(void *)(a1 + 104) - v2) >> 2;
  uint64_t v5 = *(int *)(a1 + 920);
  *(_DWORD *)(a1 + 92el_set((EditLine *)qword_2677F4398, 15, 0) = (unint64_t)(v3 - v2) >> 2;
  uint64_t v6 = *(void *)(a1 + 928);
  *(void *)(a1 + 928) = v2;
  *(void *)(a1 + 88) = v6;
  *(void *)(a1 + 96) = v6 + 4 * v5;
  *(void *)(a1 + 104) = v6 + 4 * v1;
  *(void *)(a1 + 112) = v6 + v4 - v2;
  return 4;
}

uint64_t sub_213B22C98(uint64_t a1)
{
  *(_DWORD *)(a1 + 100el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
  *(void *)(a1 + 1008) = 0;
  *(void *)(a1 + 12el_set((EditLine *)qword_2677F4398, 15, 0) = 0;
  *(void *)(a1 + 1064) = *(void *)(a1 + 1048);
  unint64_t v1 = *(void *)(a1 + 96);
  if (v1 > *(void *)(a1 + 88)) {
    *(void *)(a1 + 96) = v1 - 4;
  }
  return 5;
}

uint64_t sub_213B22CC8(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 124))
  {
    return sub_213B11D5C(a1, a2);
  }
  else
  {
    *(void *)(a1 + 96) = *(void *)(a1 + 88);
    if (*(_DWORD *)(a1 + 1000))
    {
      sub_213B1107C(a1);
      return 4;
    }
    else
    {
      return 5;
    }
  }
}

uint64_t sub_213B22D1C(uint64_t a1)
{
  if (*(void *)(a1 + 96) <= *(void *)(a1 + 88)) {
    return 6;
  }
  sub_213B10C64(a1);
  *(void *)(a1 + 96) -= 4;
  return 4;
}

uint64_t sub_213B22D64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (v2 == *(void *)(a1 + 104) && v2 == *(void *)(a1 + 88))
  {
    sub_213B20310(a1, a2);
    return 2;
  }
  else
  {
    el_beep_0((EditLine *)a1);
    return 6;
  }
}

uint64_t sub_213B22DA4(void *a1)
{
  uint64_t v2 = (_DWORD *)a1[117];
  unint64_t v3 = a1[11];
  unint64_t v4 = a1[12];
  if (v3 < v4)
  {
    uint64_t v5 = (int *)a1[11];
    do
    {
      int v6 = *v5++;
      *v2++ = v6;
    }
    while ((unint64_t)v5 < v4);
  }
  a1[118] = v2;
  sub_213B10BB0(a1, (v4 - v3) >> 2);
  a1[12] = a1[11];
  return 4;
}

uint64_t sub_213B22E08(uint64_t a1)
{
  return sub_213B1DF3C(a1, 23);
}

uint64_t sub_213B22E10(uint64_t a1)
{
  return sub_213B1DF3C(a1, 22);
}

uint64_t sub_213B22E18(size_t a1)
{
  if (*(void *)(a1 + 1224)) {
    return sub_213B1E100(a1, *(_DWORD *)(a1 + 1232));
  }
  else {
    return 6;
  }
}

uint64_t sub_213B22E30(size_t a1)
{
  if (!*(void *)(a1 + 1224)) {
    return 6;
  }
  if (*(_DWORD *)(a1 + 1232) == 23) {
    int v1 = 22;
  }
  else {
    int v1 = 23;
  }
  return sub_213B1E100(a1, v1);
}

uint64_t sub_213B22E54(uint64_t a1)
{
  return sub_213B1E134((EditLine *)a1, 1, -1, *(_DWORD *)(a1 + 128), 0);
}

uint64_t sub_213B22E68(uint64_t a1)
{
  return sub_213B1E134((EditLine *)a1, -1, -1, *(_DWORD *)(a1 + 128), 0);
}

uint64_t sub_213B22E7C(uint64_t a1)
{
  return sub_213B1E134((EditLine *)a1, 1, -1, *(_DWORD *)(a1 + 128), 1);
}

uint64_t sub_213B22E90(uint64_t a1)
{
  return sub_213B1E134((EditLine *)a1, -1, -1, *(_DWORD *)(a1 + 128), 1);
}

uint64_t sub_213B22EA4(uint64_t a1)
{
  return sub_213B1E134((EditLine *)a1, *(_DWORD *)(a1 + 1236), *(_DWORD *)(a1 + 1240), *(_DWORD *)(a1 + 128), *(char *)(a1 + 1244));
}

uint64_t sub_213B22EB8(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1236);
  uint64_t result = sub_213B1E134((EditLine *)a1, -v2, *(_DWORD *)(a1 + 1240), *(_DWORD *)(a1 + 128), *(char *)(a1 + 1244));
  *(_DWORD *)(a1 + 1236) = v2;
  return result;
}

uint64_t sub_213B22EF4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(_OWORD *)int v16 = xmmword_213B27850;
  *(_OWORD *)&v16[3] = *(long long *)((char *)&xmmword_213B27850 + 12);
  **(_DWORD **)(a1 + 104) = 0;
  size_t v2 = wcscspn(*(const __int32 **)(a1 + 96), v16);
  __int32 v3 = *(_DWORD *)(*(void *)(a1 + 96) + 4 * v2);
  if (v3)
  {
    size_t v4 = v2;
    uint64_t v5 = wcschr(v16, v3);
    uint64_t v6 = *(void *)(a1 + 96) + 4 * v4 + 4;
    uint64_t v7 = ((unint64_t)((char *)v5 - (char *)v16) >> 2) & 1;
    uint64_t v8 = 4 - 8 * v7;
    uint64_t v9 = -8 * v7;
    uint64_t v10 = 1;
    while (1)
    {
      int v11 = (int *)(v6 + v9);
      if ((unint64_t)(v6 + v9) < *(void *)(a1 + 88) || (unint64_t)v11 >= *(void *)(a1 + 104)) {
        break;
      }
      int v12 = *v11;
      if (v12 == *(__int32 *)((char *)v16 + ((4 * ((unint64_t)((char *)v5 - (char *)v16) >> 2)) ^ 4))) {
        uint64_t v13 = -1;
      }
      else {
        uint64_t v13 = 0;
      }
      if (v12 == v3) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v13;
      }
      v6 += v8;
      v10 += v14;
      if (!v10)
      {
        *(void *)(a1 + 96) = v6 - 4;
        if (!*(_DWORD *)(a1 + 1000)) {
          return 5;
        }
        *(void *)(a1 + 96) = v6;
        sub_213B1107C(a1);
        return 4;
      }
    }
  }
  return 6;
}

uint64_t sub_213B23038(uint64_t a1)
{
  sub_213B107E0(a1);

  return sub_213B14AA8(a1);
}

uint64_t sub_213B23070(uint64_t a1)
{
  *(void *)(a1 + 96) = *(void *)(a1 + 88);
  --*(_DWORD *)(a1 + 128);
  return sub_213B11AE8(a1);
}

uint64_t sub_213B2308C(uint64_t a1)
{
  return 4;
}

uint64_t sub_213B230B4(uint64_t a1)
{
  return sub_213B22888(a1, 4);
}

uint64_t sub_213B230BC(uint64_t a1)
{
  *(void *)(a1 + 96) = *(void *)(a1 + 88);
  sub_213B10894(a1, 1);
  **(_DWORD **)(a1 + 96) = 35;
  sub_213B1C450(a1);

  return sub_213B11E04(a1);
}

uint64_t sub_213B23118()
{
  return 6;
}

uint64_t sub_213B23120(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1176);
  if (!v2)
  {
    wcsncpy(*(__int32 **)(a1 + 1152), *(const __int32 **)(a1 + 88), 0x400uLL);
    *(void *)(a1 + 1168) = *(void *)(a1 + 1152) + *(void *)(a1 + 104) - *(void *)(a1 + 88);
  }
  if (!*(_DWORD *)(a1 + 124))
  {
    *(_DWORD *)(a1 + 1176) = 0x7FFFFFFF;
    sub_213B14AA8(a1);
    goto LABEL_8;
  }
  *(_DWORD *)(a1 + 1176) = 1;
  uint64_t result = sub_213B14AA8(a1);
  if (result == 6) {
    return result;
  }
  int v4 = *(_DWORD *)(a1 + 1200) - *(_DWORD *)(a1 + 128) + 1;
  *(_DWORD *)(a1 + 1176) = v4;
  if (v4 >= 0)
  {
LABEL_8:
    uint64_t result = sub_213B14AA8(a1);
    if (result != 6) {
      return result;
    }
  }
  *(_DWORD *)(a1 + 1176) = v2;
  return 6;
}

uint64_t sub_213B231D4(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  strcpy(v19, "/tmp/histedit.XXXXXXXXXX");
  if (*(_DWORD *)(a1 + 124))
  {
    uint64_t result = sub_213B23120(a1);
    if (result == 6) {
      return result;
    }
  }
  int v18 = 0;
  int v3 = mkstemp(v19);
  if (v3 < 0) {
    return 6;
  }
  int v4 = v3;
  uint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v7 = malloc_type_malloc(0x1800uLL, 0x100004077774924uLL);
  if (!v7)
  {
    uint64_t v10 = 0;
LABEL_15:
    free(v10);
    free(v7);
    close(v4);
    unlink(v19);
    return 6;
  }
  uint64_t v8 = v5 - v6;
  uint64_t v9 = (__int32 *)malloc_type_malloc(v8 + 1, 0x5D7951AAuLL);
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_15;
  }
  size_t v11 = v8 >> 2;
  wcsncpy(v9, *(const __int32 **)(a1 + 88), v11);
  v10[v11] = 0;
  wcstombs(v7, v10, 0x17FFuLL);
  v7[6143] = 0;
  size_t v12 = strlen(v7);
  write(v4, v7, v12);
  write(v4, "\n", 1uLL);
  pid_t v13 = fork();
  if (v13 == -1) {
    goto LABEL_15;
  }
  pid_t v14 = v13;
  if (!v13)
  {
    close(v4);
    execlp("vi", "vi", v19, 0);
    exit(0);
  }
  while (waitpid(v14, &v18, 0) != v14)
    ;
  lseek(v4, 0, 0);
  ssize_t v15 = read(v4, v7, 0x1800uLL);
  int v16 = *(__int32 **)(a1 + 88);
  if (v15 < 1)
  {
    size_t v17 = 0;
  }
  else
  {
    size_t v17 = mbstowcs(v16, v7, (uint64_t)(*(void *)(a1 + 104) - (void)v16) >> 2);
    int v16 = *(__int32 **)(a1 + 88);
    if (v17)
    {
      if (v16[v17 - 1] == 10) {
        --v17;
      }
    }
  }
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = &v16[v17];
  free(v7);
  free(v10);
  close(v4);
  unlink(v19);
  return sub_213B11E04(a1);
}

uint64_t sub_213B23438(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 44) & 0x40) != 0)
  {
    int v2 = sub_213B14C70(a1, 3);
    if (!v2) {
      return 6;
    }
  }
  else
  {
    if ((*(unsigned int (**)(void, uint64_t, uint64_t))(a1 + 1192))(*(void *)(a1 + 1184), a1 + 1200, 3) == -1) {
      return 6;
    }
    int v2 = *(__int32 **)(a1 + 1208);
    if (!v2) {
      return 6;
    }
  }
  int v3 = 0;
  int v4 = 0;
  uint64_t v5 = MEMORY[0x263EF8318];
  while (1)
  {
    uint64_t v6 = v4;
    int v4 = (unsigned int *)(v2 - 1);
    do
    {
      uint64_t v7 = v2;
      uint64_t v8 = v4[1];
      if (v8 > 0x7F) {
        int v9 = __maskrune(v8, 0x4000uLL);
      }
      else {
        int v9 = *(_DWORD *)(v5 + 4 * v8 + 60) & 0x4000;
      }
      ++v2;
      ++v4;
    }
    while (v9);
    unsigned int v10 = *v4;
    int v2 = v3;
    if (!*v4)
    {
LABEL_22:
      if (!v6) {
        return 6;
      }
      goto LABEL_23;
    }
    int v2 = (__int32 *)v4;
    do
    {
      if (v10 > 0x7F)
      {
        if (__maskrune(v10, 0x4000uLL)) {
          break;
        }
      }
      else if ((*(_DWORD *)(v5 + 4 * v10 + 60) & 0x4000) != 0)
      {
        break;
      }
      unsigned int v11 = v2[1];
      ++v2;
      unsigned int v10 = v11;
    }
    while (v11);
    if (*(_DWORD *)(a1 + 124))
    {
      int v12 = *(_DWORD *)(a1 + 128);
      *(_DWORD *)(a1 + 128) = v12 - 1;
      if (v12 < 2) {
        break;
      }
    }
    int v3 = v2;
    uint64_t v6 = v4;
    if (!*v2) {
      goto LABEL_22;
    }
  }
  uint64_t v6 = (unsigned int *)v7;
  if (!v7) {
    return 6;
  }
LABEL_23:
  if (*(_DWORD *)(a1 + 124) && *(_DWORD *)(a1 + 128)) {
    return 6;
  }
  sub_213B107E0(a1);
  unint64_t v13 = *(void *)(a1 + 96);
  if (v13 < *(void *)(a1 + 104)) {
    *(void *)(a1 + 96) = v13 + 4;
  }
  sub_213B10894(a1, ((unint64_t)((char *)v2 - (char *)v6) >> 2) + 1);
  pid_t v14 = *(_DWORD **)(a1 + 96);
  unint64_t v15 = *(void *)(a1 + 112);
  if ((unint64_t)v14 < v15) {
    *v14++ = 32;
  }
  if (v6 < (unsigned int *)v2 && (unint64_t)v14 < v15)
  {
    unint64_t v16 = (unint64_t)(v6 + 1);
    do
    {
      *v14++ = *(_DWORD *)(v16 - 4);
      if (v16 >= (unint64_t)v2) {
        break;
      }
      v16 += 4;
    }
    while ((unint64_t)v14 < v15);
  }
  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  return 4;
}

uint64_t sub_213B23628(EditLine *a1)
{
  if (!*((_DWORD *)a1 + 31))
  {
    int v2 = *((_DWORD *)a1 + 248);
    if (v2)
    {
      *((_DWORD *)a1 + 3longjmp(dword_2677F43AC, 1) = 1;
      *((_DWORD *)a1 + 32) = v2;
    }
  }
  *((void *)a1 + 126) = *((void *)a1 + 12);
  *((_DWORD *)a1 + 25el_set((EditLine *)qword_2677F4398, 15, 0) = *((_DWORD *)a1 + 249);
  int v3 = (const __int32 *)*((void *)a1 + 121);
  int v4 = (const __int32 *)*((void *)a1 + 120);
  if (v3 != v4)
  {
    unint64_t v5 = *((void *)a1 + 122);
    if ((unint64_t)(v3 + 1) > v5)
    {
      int v3 = (const __int32 *)(v5 - 4);
      *((void *)a1 + 12longjmp(dword_2677F43AC, 1) = v5 - 4;
    }
    *int v3 = 0;
    el_wpush(a1, v4);
  }
  uint64_t v6 = *((unsigned __int8 *)a1 + 984);
  *((unsigned char *)a1 + 137) = v6;
  *((_DWORD *)a1 + 35) = *((_DWORD *)a1 + 247);
  uint64_t v7 = *(uint64_t (**)(EditLine *))(*((void *)a1 + 139) + 8 * v6);

  return v7(a1);
}

uint64_t (**sub_213B236D0())()
{
  return off_26C4998B0;
}

_UNKNOWN **sub_213B236DC()
{
  return &off_2641D7508;
}

void **sub_213B236E8(void **result, size_t a2, unint64_t a3)
{
  int v4 = result;
  if ((unint64_t)result[1] < a2)
  {
    result[1] = (void *)a2;
    uint64_t result = (void **)malloc_type_realloc(*result, a2, 0x100004077774924uLL);
    if (!result)
    {
      v4[1] = 0;
      free(*v4);
      uint64_t result = 0;
    }
    const __int32 *v4 = result;
  }
  if ((unint64_t)v4[3] < a3)
  {
    v4[3] = (void *)a3;
    uint64_t result = (void **)malloc_type_realloc(v4[2], 4 * a3, 0x100004052888210uLL);
    if (!result)
    {
      v4[3] = 0;
      free(v4[2]);
      uint64_t result = 0;
    }
    char v4[2] = result;
  }
  return result;
}

unsigned __int32 *sub_213B23790(unsigned __int32 *result, uint64_t a2)
{
  if (result)
  {
    int v3 = result;
    int v4 = *(char **)a2;
    if (*(void *)a2 || (sub_213B236E8((void **)a2, 0x400uLL, 0), (int v4 = *(char **)a2) != 0))
    {
      unsigned __int32 v5 = *v3;
      if (*v3)
      {
        uint64_t v6 = v3 + 1;
        do
        {
          uint64_t v7 = *(void *)(a2 + 8);
          uint64_t v8 = &v4[-*(void *)a2];
          if (v7 - (uint64_t)v8 <= 4)
          {
            sub_213B236E8((void **)a2, v7 + 1024, 0);
            if (!*(void *)a2) {
              return 0;
            }
            int v4 = &v8[*(void *)a2];
            unsigned __int32 v5 = *(v6 - 1);
          }
          uint64_t v9 = sub_213B23854(v4, 5uLL, v5);
          if (v9 == -1) {
            abort();
          }
          v4 += v9;
          unsigned __int32 v10 = *v6++;
          unsigned __int32 v5 = v10;
        }
        while (v10);
      }
      char *v4 = 0;
      return *(unsigned __int32 **)a2;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_213B23854(char *a1, unint64_t a2, unsigned __int32 a3)
{
  unint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  if (a3 >= 0x10000) {
    uint64_t v5 = 4 * (a3 < 0x110000);
  }
  if (a3 >= 0x800) {
    uint64_t v4 = v5;
  }
  if ((int)a3 >= 128) {
    unint64_t v3 = v4;
  }
  if (v3 > a2) {
    return -1;
  }
  LODWORD(result) = wctomb(a1, a3);
  if ((result & 0x80000000) == 0) {
    return result;
  }
  wctomb(0, 0);
  return 0;
}

__int32 *sub_213B238D0(__int32 *result, uint64_t a2)
{
  if (result)
  {
    unint64_t v3 = (const char *)result;
    if ((*(void *)(a2 + 16) || (sub_213B236E8((void **)a2, 0, 0x400uLL), *(void *)(a2 + 16)))
      && (size_t v4 = mbstowcs(0, v3, 0), v4 != -1))
    {
      if (v4 > *(void *)(a2 + 24)) {
        sub_213B236E8((void **)a2, 0, v4 + 1);
      }
      uint64_t result = *(__int32 **)(a2 + 16);
      if (result)
      {
        mbstowcs(result, v3, *(void *)(a2 + 24));
        return *(__int32 **)(a2 + 16);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *sub_213B23970(int a1, const char **a2, uint64_t a3)
{
  if (a1 < 1)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = 0;
    uint64_t v7 = a1;
    uint64_t v8 = a2;
    do
    {
      if (*v8) {
        size_t v9 = strlen(*v8) + 1;
      }
      else {
        size_t v9 = 0;
      }
      v6 += v9;
      ++v8;
      --v7;
    }
    while (v7);
  }
  sub_213B236E8((void **)a3, 0, v6);
  if (!*(void *)(a3 + 24)) {
    return 0;
  }
  unsigned __int32 v10 = malloc_type_malloc(8 * (a1 + 1), 0x10040436913F5uLL);
  v10[a1] = 0;
  if (a1 >= 1)
  {
    unint64_t v11 = 0;
    int v12 = *(__int32 **)(a3 + 16);
    uint64_t v13 = 8 * a1;
    do
    {
      if (a2[v11 / 8])
      {
        v10[v11 / 8] = v12;
        size_t v14 = mbstowcs(v12, a2[v11 / 8], v6);
        if (v14 == -1)
        {
          free(v10);
          return 0;
        }
        v6 -= v14 + 1;
        v12 += v14 + 1;
      }
      else
      {
        v10[v11 / 8] = 0;
      }
      v11 += 8;
    }
    while (v13 != v11);
  }
  return v10;
}

uint64_t sub_213B23A94(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  if (a1 >= 0x10000) {
    uint64_t v2 = 4 * (a1 < 0x110000);
  }
  if (a1 >= 0x800) {
    uint64_t v1 = v2;
  }
  if ((int)a1 >= 128) {
    return v1;
  }
  else {
    return 1;
  }
}

unsigned int *sub_213B23AC8(unsigned int *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (char *)qword_2677F5138;
    if (!qword_2677F5138)
    {
      qword_2677F5140 = 1024;
      uint64_t v2 = (char *)malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
      qword_2677F5138 = (uint64_t)v2;
    }
    unint64_t v3 = *v1;
    if (v3)
    {
      do
      {
        uint64_t result = (unsigned int *)qword_2677F5138;
        while (1)
        {
          uint64_t v4 = sub_213B23C1C(v2, qword_2677F5140 - ((v2 - (char *)result) >> 2), v3);
          if (v4 != -1) {
            break;
          }
          uint64_t v5 = qword_2677F5138;
          qword_2677F5140 += 1024;
          uint64_t result = (unsigned int *)malloc_type_realloc((void *)qword_2677F5138, 4 * qword_2677F5140, 0x100004052888210uLL);
          if (!result) {
            goto LABEL_17;
          }
          qword_2677F5138 = (uint64_t)result;
          uint64_t v2 = &v2[(void)result - v5];
          unint64_t v3 = *v1;
          if (!v3) {
            goto LABEL_13;
          }
        }
        unsigned int v6 = v1[1];
        ++v1;
        unint64_t v3 = v6;
        v2 += 4 * v4;
      }
      while (v6);
      uint64_t result = (unsigned int *)qword_2677F5138;
    }
    else
    {
      uint64_t result = (unsigned int *)v2;
    }
LABEL_13:
    uint64_t v7 = qword_2677F5140;
    if (v2 < (char *)&result[qword_2677F5140]) {
      goto LABEL_16;
    }
    ++qword_2677F5140;
    uint64_t result = (unsigned int *)malloc_type_realloc(result, 4 * (v7 + 1), 0x100004052888210uLL);
    if (result)
    {
      qword_2677F5138 = (uint64_t)result;
      uint64_t v2 = (char *)&result[qword_2677F5140 - 1];
LABEL_16:
      *(_DWORD *)uint64_t v2 = 0;
      return result;
    }
LABEL_17:
    free((void *)qword_2677F5138);
    uint64_t result = 0;
    qword_2677F5140 = 0;
  }
  return result;
}

uint64_t sub_213B23C1C(_DWORD *a1, unint64_t a2, unint64_t a3)
{
  unsigned int v6 = sub_213B23DE4(a3);
  if (v6 >= 0xFFFFFFFD)
  {
    if (a2 >= 2)
    {
      int v7 = a3 | 0x40;
      if (a3 == 127) {
        int v7 = 63;
      }
      *a1 = 94;
      a1[1] = v7;
      return 2;
    }
    return -1;
  }
  if (v6 != -4)
  {
    if (v6) {
      return 0;
    }
    if (a2)
    {
      *a1 = a3;
      return 1;
    }
    return -1;
  }
  if ((int)sub_213B23D40(a3) > (uint64_t)a2) {
    return -1;
  }
  *(void *)a1 = 0x550000005CLL;
  a1[2] = 43;
  if ((int)a3 < 0x10000)
  {
    size_t v9 = a1 + 3;
    uint64_t result = 7;
  }
  else
  {
    size_t v9 = a1 + 4;
    a1[3] = a0123456789abcd[(a3 >> 16) & 0xF];
    uint64_t result = 8;
  }
  *size_t v9 = a0123456789abcd[(unsigned __int16)a3 >> 12];
  v9[1] = a0123456789abcd[(a3 >> 8) & 0xF];
  v9[2] = a0123456789abcd[a3 >> 4];
  v9[3] = a0123456789abcd[a3 & 0xF];
  return result;
}

uint64_t sub_213B23D40(__darwin_ct_rune_t a1)
{
  int v2 = sub_213B23DE4(a1) + 4;
  uint64_t result = 2;
  switch(v2)
  {
    case 0:
      if (a1 < 0x10000) {
        uint64_t result = 7;
      }
      else {
        uint64_t result = 8;
      }
      break;
    case 2:
      uint64_t result = 1;
      break;
    case 3:
      return result;
    case 4:
      uint64_t result = wcwidth(a1);
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_213B23DE4(__darwin_ct_rune_t a1)
{
  if (a1 == 9) {
    return 4294967294;
  }
  if (a1 == 10) {
    return 4294967293;
  }
  if (a1 <= 255)
  {
    if (a1 <= 0x7F)
    {
      int v3 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a1 + 60);
      if ((v3 & 0x200) == 0)
      {
        int v4 = v3 & 0x40000;
        goto LABEL_12;
      }
      return 0xFFFFFFFFLL;
    }
    if (__maskrune(a1, 0x200uLL)) {
      return 0xFFFFFFFFLL;
    }
  }
  int v4 = __maskrune(a1, 0x40000uLL);
LABEL_12:
  if (v4) {
    return 0;
  }
  else {
    return 4294967292;
  }
}

int el_getc(EditLine *a1, char *a2)
{
  __int32 v7 = 0;
  int v4 = *((_DWORD *)a1 + 11);
  if ((v4 & 0x10) == 0) {
    *((_DWORD *)a1 + 1longjmp(dword_2677F43AC, 1) = v4 | 0x20;
  }
  int result = el_wgetc(a1, &v7);
  int v6 = *((_DWORD *)a1 + 11);
  if ((v6 & 0x10) == 0) {
    *((_DWORD *)a1 + 1longjmp(dword_2677F43AC, 1) = v6 & 0xFFFFFFDF;
  }
  if (result >= 1) {
    *a2 = v7;
  }
  return result;
}

void el_push(EditLine *a1, const char *a2)
{
  int v3 = sub_213B238D0((__int32 *)a2, (uint64_t)a1 + 1296);

  el_wpush(a1, v3);
}

const char *__cdecl el_gets(EditLine *a1, int *a2)
{
  int v4 = *((_DWORD *)a1 + 11);
  if ((v4 & 0x10) == 0) {
    *((_DWORD *)a1 + 1longjmp(dword_2677F43AC, 1) = v4 | 0x20;
  }
  uint64_t v5 = (unsigned __int32 *)el_wgets(a1, a2);
  int v6 = *((_DWORD *)a1 + 11);
  if ((v6 & 0x10) == 0) {
    *((_DWORD *)a1 + 1longjmp(dword_2677F43AC, 1) = v6 & 0xFFFFFFDF;
  }
  if (!v5) {
    return 0;
  }
  __int32 v7 = sub_213B23790(v5, (uint64_t)a1 + 1296);
  uint64_t v8 = (const char *)v7;
  if (v7) {
    *a2 = strlen((const char *)v7);
  }
  return v8;
}

int el_parse(EditLine *a1, int a2, const char **a3)
{
  uint64_t v5 = (const __int32 **)sub_213B23970(a2, a3, (uint64_t)a1 + 1296);
  if (!v5) {
    return -1;
  }
  int v6 = v5;
  int v7 = el_wparse(a1, a2, v5);
  free(v6);
  return v7;
}

int el_set(EditLine *a1, int a2, ...)
{
  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  int v37 = va_arg(va1, __int32 *);
  va_copy(va2, va1);
  uint64_t v38 = va_arg(va2, void);
  va_copy(va3, va2);
  uint64_t v39 = va_arg(va3, void);
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (!a1) {
    return -1;
  }
  va_copy(v24, va);
  int v3 = -1;
  switch(a2)
  {
    case 0:
    case 12:
      unint64_t v11 = v37;
      int v12 = 0;
      goto LABEL_13;
    case 1:
      int v10 = el_wset(a1, 1, v37, v23, va1);
      goto LABEL_14;
    case 2:
      unsigned int v22 = sub_213B238D0(v37, (uint64_t)a1 + 1296);
      int v10 = el_wset(a1, 2, v22, v23, va1);
      goto LABEL_14;
    case 3:
    case 11:
    case 15:
    case 16:
      int v10 = el_wset(a1, a2, v37, v23, va1);
      goto LABEL_14;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      uint64_t v35 = 0;
      long long v34 = 0u;
      long long v33 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v5 = 1;
      long long v26 = 0u;
      do
      {
        int v6 = va_arg(v24, const char *);
        (&v25)[v5] = v6;
        if (!v6) {
          break;
        }
        ++v5;
      }
      while (v5 != 20);
      unsigned int v25 = 0;
      int v7 = (const __int32 **)sub_213B23970((int)v5 + 1, &v25, (uint64_t)a1 + 1296);
      if (!v7) {
        return -1;
      }
      uint64_t v8 = v7;
      switch(a2)
      {
        case 4:
          *int v7 = (const __int32 *)&unk_213B2CC50;
          int v9 = sub_213B17224();
          goto LABEL_33;
        case 5:
          *int v7 = (const __int32 *)&unk_213B2CC64;
          int v9 = sub_213B20394((uint64_t)a1);
          goto LABEL_33;
        case 6:
          *int v7 = (const __int32 *)&unk_213B2CC80;
          int v9 = sub_213B20560((uint64_t)a1, v5, (uint64_t)v7);
          goto LABEL_33;
        case 7:
          *int v7 = (const __int32 *)&unk_213B2CC98;
          int v9 = sub_213B207FC((uint64_t)a1, v5, (uint64_t)v7);
          goto LABEL_33;
        case 8:
          *int v7 = (const __int32 *)&unk_213B2CCB4;
          int v9 = sub_213B22018((uint64_t)a1, v5, (uint64_t)v7);
LABEL_33:
          int v3 = v9;
          break;
        default:
          int v3 = -1;
          break;
      }
      int v18 = v8;
      goto LABEL_35;
    case 9:
      unsigned int v25 = (const char *)v37;
      *(void *)&long long v26 = v38;
      uint64_t v13 = v39;
      size_t v14 = (const __int32 **)sub_213B23970(2, &v25, (uint64_t)a1 + 1296);
      if (!v14) {
        return -1;
      }
      unint64_t v15 = v14;
      unint64_t v16 = sub_213B24874(*v14);
      size_t v17 = sub_213B24874(v15[1]);
      int v3 = sub_213B17818((uint64_t)a1, (uint64_t)v16, (uint64_t)v17, v13);
      int v18 = v15;
LABEL_35:
      free(v18);
      return v3;
    case 10:
      int v3 = sub_213B14A98((uint64_t)a1, (uint64_t)v37, v38);
      int v20 = *((_DWORD *)a1 + 11) | 0x40;
      goto LABEL_23;
    case 13:
      int v3 = el_wset(a1, 13, v37);
      int v20 = *((_DWORD *)a1 + 11) | 0x80;
LABEL_23:
      *((_DWORD *)a1 + 1longjmp(dword_2677F43AC, 1) = v20;
      return v3;
    case 14:
      int v10 = el_wset(a1, 14, v37, v23, va1);
      goto LABEL_14;
    case 19:
      int v10 = el_wset(a1, 19, v37, v38, va2);
      goto LABEL_14;
    case 20:
      int v10 = el_wset(a1, 20, v21, v23, va);
      goto LABEL_14;
    case 21:
    case 22:
      unint64_t v11 = v37;
      int v12 = (char)v38;
LABEL_13:
      int v10 = sub_213B180AC((uint64_t)a1, v11, v12, a2, 0);
      goto LABEL_14;
    case 23:
      int v10 = sub_213B11708((uint64_t)a1, (uint64_t)v37, v38);
LABEL_14:
      int v3 = v10;
      break;
    default:
      return v3;
  }
  return v3;
}

int el_get(EditLine *a1, int a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  long long v26 = va_arg(va1, unsigned __int32 **);
  va_copy(va2, va1);
  long long v27 = va_arg(va2, unsigned char *);
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!a1) {
    return -1;
  }
  va_copy(v12, va);
  int result = -1;
  switch(a2)
  {
    case 0:
    case 12:
      return sub_213B18104((uint64_t)a1, v26, 0, a2);
    case 1:
      va_copy(v13, va1);
      unint64_t v10 = (unint64_t)v26;
      int v4 = a1;
      a2 = 1;
      goto LABEL_4;
    case 2:
      int v6 = v26;
      size_t v14 = 0;
      int v7 = el_wget(a1, 2, &v14);
      const char *v6 = sub_213B23790(v14, (uint64_t)a1 + 1296);
      if (*((void *)a1 + 163)) {
        return v7;
      }
      else {
        return -1;
      }
    case 3:
    case 11:
    case 15:
    case 16:
      va_copy(v13, va1);
      unint64_t v10 = (unint64_t)v26;
      int v4 = a1;
      goto LABEL_4;
    case 13:
      va_copy(v13, va1);
      unint64_t v10 = (unint64_t)v26;
      int v4 = a1;
      a2 = 13;
      goto LABEL_4;
    case 14:
      va_copy(v13, va1);
      unint64_t v10 = (unint64_t)v26;
      int v4 = a1;
      a2 = 14;
      goto LABEL_4;
    case 17:
      uint64_t v24 = 0;
      long long v23 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v8 = 1;
      long long v15 = 0u;
      do
      {
        int v9 = va_arg(v12, unsigned __int32 *);
        (&v14)[v8] = v9;
        if (!v9) {
          break;
        }
        ++v8;
      }
      while (v8 != 20);
      size_t v14 = (unsigned __int32 *)aGettc_0;
      return sub_213B206E0((uint64_t)a1, v8, (uint64_t)&v14);
    case 18:
      va_copy(v13, va2);
      unint64_t v10 = v26;
      unint64_t v11 = v27;
      int v4 = a1;
      a2 = 18;
LABEL_4:
      int result = el_wget(v4, a2, v10, v11, v13);
      break;
    case 21:
    case 22:
      uint64_t v5 = v27;
      LODWORD(v14) = 0;
      int result = sub_213B18104((uint64_t)a1, v26, &v14, a2);
      *uint64_t v5 = (_BYTE)v14;
      break;
    default:
      return result;
  }
  return result;
}

const LineInfo *__cdecl el_line(EditLine *a1)
{
  int v2 = el_wline(a1);
  int v3 = (unsigned __int32 **)((char *)a1 + 1328);
  int v4 = sub_213B23790((unsigned __int32 *)v2->buffer, (uint64_t)a1 + 1296);
  *((void *)a1 + 166) = v4;
  int buffer = (unsigned int *)v2->buffer;
  if (v2->buffer >= v2->cursor)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      unsigned int v7 = *buffer++;
      v6 += sub_213B23A94(v7);
    }
    while ((const __int32 *)buffer < v2->cursor);
    int v4 = *v3;
    int buffer = (unsigned int *)v2->buffer;
  }
  *((void *)a1 + 167) = (char *)v4 + v6;
  if ((const __int32 *)buffer >= v2->lastchar)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    do
    {
      unsigned int v9 = *buffer++;
      v8 += sub_213B23A94(v9);
    }
    while ((const __int32 *)buffer < v2->lastchar);
    int v4 = *v3;
  }
  *((void *)a1 + 168) = (char *)v4 + v8;
  return (const LineInfo *)((char *)a1 + 1328);
}

int el_insertstr(EditLine *a1, const char *a2)
{
  int v3 = sub_213B238D0((__int32 *)a2, (uint64_t)a1 + 1296);

  return el_winsertstr(a1, v3);
}

__int32 *sub_213B24874(const __int32 *a1)
{
  size_t v2 = wcslen(a1) + 1;
  int result = (__int32 *)malloc_type_malloc(4 * v2, 0x100004052888210uLL);
  if (result)
  {
    return wmemcpy(result, a1, v2);
  }
  return result;
}

History *history_init(void)
{
  __int16 v0 = malloc_type_malloc(0x60uLL, 0x108004000789A1EuLL);
  uint64_t v1 = v0;
  if (v0)
  {
    if (sub_213B14FF8(v0) == -1)
    {
      free(v1);
      return 0;
    }
    else
    {
      *((_DWORD *)v1 + 2) = -1;
      v1[3] = sub_213B249E4;
      char v1[2] = sub_213B24A44;
      v1[4] = sub_213B24A80;
      v1[5] = sub_213B24ABC;
      v1[6] = sub_213B24B38;
      v1[7] = sub_213B24B90;
      v1[9] = sub_213B24C14;
      v1[10] = sub_213B24C5C;
      v1[11] = sub_213B24D78;
      v1[8] = sub_213B24E94;
    }
  }
  return (History *)v1;
}

uint64_t sub_213B249E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == a1)
  {
    *(_DWORD *)a2 = 5;
    uint64_t v6 = "empty list";
  }
  else
  {
    int v4 = *(_OWORD **)(v2 + 24);
    if (v4 != (_OWORD *)a1)
    {
      uint64_t result = 0;
      *(void *)(a1 + 4el_set((EditLine *)qword_2677F4398, 15, 0) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }
    *(_DWORD *)a2 = 6;
    uint64_t v6 = "no next event";
  }
  *(void *)(a2 + 8) = v6;
  return 0xFFFFFFFFLL;
}

uint64_t sub_213B24A44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 24);
  *(void *)(a1 + 4el_set((EditLine *)qword_2677F4398, 15, 0) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 3;
    *(void *)(a2 + 8) = "first event not found";
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_213B24A80(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 32);
  *(void *)(a1 + 4el_set((EditLine *)qword_2677F4398, 15, 0) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 4;
    *(void *)(a2 + 8) = "last event not found";
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_213B24ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == a1)
  {
    int v6 = *(_DWORD *)(a1 + 52);
    BOOL v7 = v6 <= 0;
    if (v6 <= 0) {
      int v8 = 5;
    }
    else {
      int v8 = 6;
    }
    *(_DWORD *)a2 = v8;
    uint64_t v9 = 5;
    if (!v7) {
      uint64_t v9 = 6;
    }
    unint64_t v10 = (&off_2641D7E98)[v9];
  }
  else
  {
    int v4 = *(_OWORD **)(v3 + 32);
    if (v4 != (_OWORD *)a1)
    {
      uint64_t result = 0;
      *(void *)(a1 + 4el_set((EditLine *)qword_2677F4398, 15, 0) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }
    *(_DWORD *)a2 = 7;
    unint64_t v10 = "no previous event";
  }
  *(void *)(a2 + 8) = v10;
  return 0xFFFFFFFFLL;
}

uint64_t sub_213B24B38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 40);
  if (v2 == (_OWORD *)a1)
  {
    int v4 = *(_DWORD *)(a1 + 52);
    BOOL v5 = v4 <= 0;
    if (v4 <= 0) {
      int v6 = 5;
    }
    else {
      int v6 = 8;
    }
    *(_DWORD *)a2 = v6;
    uint64_t v7 = 5;
    if (!v5) {
      uint64_t v7 = 8;
    }
    *(void *)(a2 + 8) = (&off_2641D7E98)[v7];
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
    *(_OWORD *)a2 = *v2;
  }
  return result;
}

uint64_t sub_213B24B90(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 52))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3 == a1 || *(_DWORD *)v3 != a3)
    {
      uint64_t v3 = a1;
      while (1)
      {
        uint64_t v3 = *(void *)(v3 + 24);
        if (v3 == a1) {
          break;
        }
        if (*(_DWORD *)v3 == a3) {
          goto LABEL_10;
        }
      }
      uint64_t v3 = a1;
LABEL_10:
      *(void *)(a1 + 4el_set((EditLine *)qword_2677F4398, 15, 0) = v3;
    }
    if (v3 != a1) {
      return 0;
    }
    int v4 = "event not found";
    int v5 = 9;
  }
  else
  {
    int v4 = "empty list";
    int v5 = 5;
  }
  *(_DWORD *)a2 = v5;
  *(void *)(a2 + 8) = v4;
  return 0xFFFFFFFFLL;
}

void sub_213B24C14(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 32); i != a1; uint64_t i = *(void *)(a1 + 32))
    sub_213B16130(a1, i);
  *(void *)(a1 + 4el_set((EditLine *)qword_2677F4398, 15, 0) = a1;
  *(_DWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 56) = 0;
}

uint64_t sub_213B24C5C(uint64_t a1, uint64_t a2, char *__s2)
{
  if (*(unsigned char *)(a1 + 60))
  {
    uint64_t v6 = *(void *)(a1 + 24);
    if (v6 != a1)
    {
      uint64_t result = strcmp(*(const char **)(v6 + 8), __s2);
      if (!result) {
        return result;
      }
    }
  }
  int v8 = malloc_type_malloc(0x28uLL, 0x10F00401F389D68uLL);
  if (!v8)
  {
LABEL_15:
    *(_DWORD *)a2 = 2;
    *(void *)(a2 + 8) = "malloc() failed";
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  unint64_t v10 = strdup(__s2);
  v9[1] = v10;
  if (!v10)
  {
    free(v9);
    goto LABEL_15;
  }
  uint64_t v11 = *(void *)(a1 + 24);
  v9[2] = 0;
  v9[3] = v11;
  v9[4] = a1;
  *(void *)(*(void *)(a1 + 24) + 32) = v9;
  int v12 = *(_DWORD *)(a1 + 52);
  LODWORD(v1longjmp(dword_2677F43AC, 1) = *(_DWORD *)(a1 + 56) + 1;
  *(_DWORD *)uint64_t v9 = v11;
  *(void *)(a1 + 24) = v9;
  *(_DWORD *)(a1 + 52) = v12 + 1;
  *(_DWORD *)(a1 + 56) = v11;
  *(void *)(a1 + 4el_set((EditLine *)qword_2677F4398, 15, 0) = v9;
  *(_OWORD *)a2 = *(_OWORD *)v9;
  int v13 = *(_DWORD *)(a1 + 52);
  uint64_t result = 1;
  if (v13 >= 1 && v13 > *(_DWORD *)(a1 + 48))
  {
    do
    {
      sub_213B16130(a1, *(void *)(a1 + 32));
      int v14 = *(_DWORD *)(a1 + 52);
    }
    while (v14 >= 1 && v14 > *(_DWORD *)(a1 + 48));
    return 1;
  }
  return result;
}

uint64_t sub_213B24D78(uint64_t a1, uint64_t a2, char *__s2)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == a1)
  {
    return sub_213B24C5C(a1, a2, __s2);
  }
  else
  {
    size_t v7 = strlen(*(const char **)(v6 + 8));
    size_t v8 = strlen(__s2) + v7;
    uint64_t v9 = (char *)malloc_type_malloc(v8 + 1, 0x100004077774924uLL);
    if (v9)
    {
      unint64_t v10 = v9;
      uint64_t v11 = strncpy(v9, *(const char **)(*(void *)(a1 + 40) + 8), v8 + 1);
      v11[v8] = 0;
      size_t v12 = strlen(v11);
      strncat(v10, __s2, v8 - v12);
      free(*(void **)(v6 + 8));
      uint64_t result = 0;
      *(void *)(v6 + 8) = v10;
      *(_OWORD *)a2 = *(_OWORD *)*(void *)(a1 + 40);
    }
    else
    {
      *(_DWORD *)a2 = 2;
      *(void *)(a2 + 8) = "malloc() failed";
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_213B24E94(uint64_t a1, uint64_t a2, int a3)
{
  if (sub_213B24B90(a1, a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  *(void *)(a2 + 8) = strdup(*(const char **)(v6 + 8));
  *(_DWORD *)a2 = *(_DWORD *)v6;
  sub_213B16130(a1, v6);
  return 0;
}

void history_end(History *a1)
{
  if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_213B249E4) {
    sub_213B24C14(*(void *)a1);
  }
  free(*(void **)a1);

  free(a1);
}

int history(History *a1, HistEvent *a2, int a3, ...)
{
  va_start(va, a3);
  uint64_t v80 = va_arg(va, const char *);
  unint64_t v81 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  int v82 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v83 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v84 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  unint64_t v85 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v86 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  int64_t v87 = va_arg(va, void (*)(uint64_t a1));
  size_t v88 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, char *__s2));
  uint64_t v89 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, char *__s2));
  int v90 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  a2->uint64_t num = 0;
  a2->int str = "OK";
  switch(a3)
  {
    case 0:
      *((_DWORD *)a1 + 2) = -1;
      int v5 = v81;
      uint64_t v6 = v82;
      size_t v7 = v83;
      size_t v8 = v84;
      uint64_t v9 = v85;
      unint64_t v10 = v86;
      uint64_t v11 = v87;
      size_t v12 = v88;
      int v13 = v89;
      int v14 = v90;
      if (v81) {
        BOOL v15 = v82 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      BOOL v24 = v15
         || v83 == 0
         || v84 == 0
         || v85 == 0
         || v86 == 0
         || v88 == 0
         || v89 == 0
         || v87 == 0
         || v90 == 0
         || v80 == 0;
      int v25 = v24;
      long long v26 = (uint64_t (*)(uint64_t, uint64_t))*((void *)a1 + 3);
      if (v24)
      {
        if (v26 == sub_213B249E4) {
          goto LABEL_123;
        }
        int v27 = v25;
        int v28 = sub_213B14FF8(a1);
        int v25 = v27;
        int v14 = sub_213B24E94;
        int v13 = sub_213B24D78;
        size_t v12 = sub_213B24C5C;
        uint64_t v11 = sub_213B24C14;
        unint64_t v10 = sub_213B24B90;
        uint64_t v9 = sub_213B24B38;
        size_t v8 = sub_213B24ABC;
        size_t v7 = sub_213B24A80;
        uint64_t v6 = sub_213B249E4;
        if (v28 == -1)
        {
LABEL_123:
          a2->uint64_t num = 12;
          long long v29 = "required parameter(s) not supplied";
          goto LABEL_138;
        }
        int v5 = sub_213B24A44;
      }
      else
      {
        if (v26 == sub_213B249E4)
        {
          int v75 = v25;
          sub_213B24C14(*(void *)a1);
          int v14 = v90;
          int v25 = v75;
          uint64_t v11 = v87;
        }
        *((_DWORD *)a1 + 2) = -1;
      }
      *((void *)a1 + 2) = v5;
      *((void *)a1 + 3) = v6;
      *((void *)a1 + 4) = v7;
      *((void *)a1 + 5) = v8;
      *((void *)a1 + 6) = v9;
      *((void *)a1 + 7) = v10;
      *((void *)a1 + 1el_set((EditLine *)qword_2677F4398, 15, 0) = v12;
      *((void *)a1 + 1longjmp(dword_2677F43AC, 1) = v13;
      *((void *)a1 + 8) = v14;
      *((void *)a1 + 9) = v11;
      if (!v25) {
        return 0;
      }
      goto LABEL_123;
    case 1:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_213B249E4) {
        goto LABEL_94;
      }
      if ((v80 & 0x80000000) == 0)
      {
        int v30 = 0;
        *(_DWORD *)(*(void *)a1 + 48) = v80;
        return v30;
      }
      a2->uint64_t num = 15;
      long long v29 = "bad parameters";
      goto LABEL_138;
    case 2:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_213B249E4)
      {
        long long v29 = "function not allowed with other history-functions-set the default";
        int v31 = 14;
        goto LABEL_137;
      }
      int v59 = *(_DWORD *)(*(void *)a1 + 52);
      a2->uint64_t num = v59;
      if (v59 > -2) {
        return 0;
      }
      long long v29 = "history size negative";
      int v31 = 13;
      goto LABEL_137;
    case 3:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 2))(*(void *)a1, a2);
    case 4:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 4))(*(void *)a1, a2);
    case 5:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 5))(*(void *)a1, a2);
    case 6:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 3))(*(void *)a1, a2);
    case 7:
      return (*((uint64_t (**)(void, HistEvent *, void))a1 + 7))(*(void *)a1, a2, v80);
    case 8:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
    case 9:
      return (*((uint64_t (**)(void, HistEvent *, const char *))a1 + 11))(*(void *)a1, a2, v80);
    case 10:
      int v30 = (*((uint64_t (**)(void, HistEvent *, const char *))a1 + 10))(*(void *)a1, a2, v80);
      if (v30 != -1) {
        *((_DWORD *)a1 + 2) = a2->num;
      }
      return v30;
    case 11:
      if ((*((unsigned int (**)(void, HistEvent *, void))a1 + 7))(*(void *)a1, a2, *((unsigned int *)a1 + 2)) == -1)return -1; {
      return (*((uint64_t (**)(void, HistEvent *, const char *))a1 + 11))(*(void *)a1, a2, v80);
      }
    case 12:
      history_end(a1);
      return 0;
    case 13:
      size_t v33 = strlen(v80);
      int v34 = (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v34 == -1) {
          goto LABEL_103;
        }
        if (strncmp(v80, a2->str, v33))
        {
          int v34 = (*((uint64_t (**)(void, HistEvent *))a1 + 5))(*(void *)a1, a2);
          continue;
        }
        return 0;
      }
    case 14:
      size_t v35 = strlen(v80);
      int v36 = (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v36 == -1) {
          goto LABEL_103;
        }
        if (strncmp(v80, a2->str, v35))
        {
          int v36 = (*((uint64_t (**)(void, HistEvent *))a1 + 3))(*(void *)a1, a2);
          continue;
        }
        return 0;
      }
    case 15:
      int v37 = (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v37 == -1) {
          goto LABEL_103;
        }
        if (a2->num != v80)
        {
          int v37 = (*((uint64_t (**)(void, HistEvent *))a1 + 3))(*(void *)a1, a2);
          continue;
        }
        return 0;
      }
    case 16:
      int v38 = (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v38 == -1) {
          goto LABEL_103;
        }
        if (a2->num != v80)
        {
          int v38 = (*((uint64_t (**)(void, HistEvent *))a1 + 5))(*(void *)a1, a2);
          continue;
        }
        return 0;
      }
    case 17:
      uint64_t v39 = fopen(v80, "r");
      if (!v39) {
        goto LABEL_80;
      }
      int v40 = v39;
      size_t __n = 0;
      uint64_t v78 = 0;
      __s = 0;
      int v41 = fgetln(v39, &__n);
      if (!v41
        || strncmp(v41, "_HiStOrY_V2_\n", __n)
        || (uint64_t v63 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL)) == 0)
      {
        fclose(v40);
        goto LABEL_80;
      }
      int v64 = v63;
      uint64_t v65 = fgetln(v40, &__n);
      if (v65)
      {
        int v66 = v65;
        int v30 = 0;
        size_t v67 = 1024;
        while (1)
        {
          size_t v68 = __n;
          if (__n && v66[__n - 1] == 10)
          {
            --__n;
            --v68;
          }
          if (v67 < v68)
          {
            size_t v67 = (v68 & 0xFFFFFFFFFFFFFC00) + 1024;
            uint64_t v69 = malloc_type_realloc(v64, v67, 0x100004077774924uLL);
            if (!v69) {
              break;
            }
            size_t v68 = __n;
            int v64 = v69;
          }
          int v77 = 0;
          BOOL v70 = (char *)v64;
          if (v68)
          {
            BOOL v70 = (char *)v64;
            do
            {
              --v68;
              int v72 = *v66++;
              int v71 = v72;
              while (1)
              {
                int v73 = unvis(v70, v71, &v77, 0);
                if (v73 != 2) {
                  break;
                }
                ++v70;
              }
              if (v73 && v73 != 3)
              {
                if (v73 != 1) {
                  goto LABEL_164;
                }
                ++v70;
              }
            }
            while (v68);
          }
          unint64_t v74 = unvis(v70, 0, &v77, 2048) == 1 ? v70 + 1 : v70;
          *unint64_t v74 = 0;
LABEL_164:
          if ((*((unsigned int (**)(void, uint64_t *, void *))a1 + 10))(*(void *)a1, &v78, v64) == -1) {
            break;
          }
          ++v30;
          int v66 = fgetln(v40, &__n);
          if (!v66) {
            goto LABEL_176;
          }
        }
        int v30 = -1;
      }
      else
      {
        int v30 = 0;
      }
LABEL_176:
      free(v64);
      fclose(v40);
      if (v30 == -1)
      {
LABEL_80:
        a2->uint64_t num = 10;
        long long v29 = "can't read history from file";
        goto LABEL_138;
      }
      return v30;
    case 18:
      size_t v42 = fopen(v80, "w");
      if (!v42) {
        goto LABEL_125;
      }
      uint64_t v43 = v42;
      uint64_t v78 = 0;
      __s = 0;
      int v44 = fileno(v42);
      if (fchmod(v44, 0x180u) == -1
        || fputs("_HiStOrY_V2_\n", v43) == -1
        || (uint64_t v45 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL)) == 0)
      {
        fclose(v43);
        goto LABEL_125;
      }
      int v46 = v45;
      if ((*((unsigned int (**)(void, uint64_t *))a1 + 4))(*(void *)a1, &v78) == -1)
      {
        int v30 = 0;
        goto LABEL_172;
      }
      int v30 = 0;
      size_t v47 = 1024;
      while (2)
      {
        unint64_t v48 = __s;
        size_t v49 = 4 * strlen(__s);
        if (v49 < v47) {
          goto LABEL_90;
        }
        size_t v47 = (v49 & 0xFFFFFFFFFFFFFC00) + 1024;
        uint64_t v50 = malloc_type_realloc(v46, v47, 0x100004077774924uLL);
        if (v50)
        {
          int v46 = v50;
LABEL_90:
          strvis((char *)v46, v48, 28);
          fprintf(v43, "%s\n", (const char *)v46);
          ++v30;
          if ((*((unsigned int (**)(void, uint64_t *))a1 + 5))(*(void *)a1, &v78) == -1) {
            goto LABEL_172;
          }
          continue;
        }
        break;
      }
      int v30 = -1;
LABEL_172:
      free(v46);
      fclose(v43);
      if (v30 == -1)
      {
LABEL_125:
        a2->uint64_t num = 11;
        long long v29 = "can't write history";
        goto LABEL_138;
      }
      return v30;
    case 19:
      (*((void (**)(void, HistEvent *))a1 + 9))(*(void *)a1, a2);
      return 0;
    case 20:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_213B249E4)
      {
LABEL_94:
        a2->uint64_t num = 14;
        long long v29 = "function not allowed with other history-functions-set the default";
        goto LABEL_138;
      }
      int v60 = *(_DWORD *)(*(void *)a1 + 60);
      int v30 = 0;
      if (v80) {
        unsigned int v61 = v60 | 1;
      }
      else {
        unsigned int v61 = v60 & 0xFFFFFFFE;
      }
      *(_DWORD *)(*(void *)a1 + 6el_set((EditLine *)qword_2677F4398, 15, 0) = v61;
      return v30;
    case 21:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_213B249E4)
      {
        int v30 = 0;
        int v51 = *(_DWORD *)(*(void *)a1 + 60) & 1;
      }
      else
      {
        a2->int str = "function not allowed with other history-functions-set the default";
        int v30 = -1;
        int v51 = 14;
      }
      a2->uint64_t num = v51;
      return v30;
    case 22:
      return (*((uint64_t (**)(void, HistEvent *, void))a1 + 8))(*(void *)a1, a2, v80);
    case 23:
      if ((*((unsigned int (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2) == -1) {
        goto LABEL_103;
      }
      int v52 = v80 + 1;
      while (--v52 > 0)
      {
        if ((*((unsigned int (**)(void, HistEvent *))a1 + 5))(*(void *)a1, a2) == -1)
        {
LABEL_103:
          a2->uint64_t num = 9;
          long long v29 = "event not found";
LABEL_138:
          a2->int str = v29;
          return -1;
        }
      }
      if (!v81) {
        return 0;
      }
      int v30 = 0;
      *(void *)unint64_t v81 = *(void *)(*(void *)(*(void *)a1 + 40) + 16);
      return v30;
    case 24:
      int v53 = (int)v80;
      uint64_t v54 = *(void *)a1;
      if (!*(_DWORD *)(*(void *)a1 + 52))
      {
        long long v29 = "empty list";
        int v31 = 5;
LABEL_137:
        a2->uint64_t num = v31;
        goto LABEL_138;
      }
      uint64_t v55 = *(void *)a1;
      do
        uint64_t v55 = *(void *)(v55 + 32);
      while (v55 != v54 && v53-- > 0);
      *(void *)(v54 + 4el_set((EditLine *)qword_2677F4398, 15, 0) = v55;
      if (v55 == v54)
      {
        long long v29 = "event not found";
        int v31 = 9;
        goto LABEL_137;
      }
      if (v81 != (uint64_t (*)(uint64_t, uint64_t))-1)
      {
        a2->int str = strdup(*(const char **)(v55 + 8));
        a2->uint64_t num = *(_DWORD *)v55;
        if (v81)
        {
          *(void *)unint64_t v81 = *(void *)(v55 + 16);
          uint64_t v55 = *(void *)(v54 + 40);
        }
        sub_213B16130(v54, v55);
      }
      return 0;
    case 25:
      if (!v80) {
        return -1;
      }
      uint64_t v57 = strdup(v80);
      if (!v57) {
        return -1;
      }
      int v30 = 0;
      uint64_t v58 = *(void *)(*(void *)a1 + 40);
      *(void *)(v58 + 8) = v57;
      *(void *)(v58 + 16) = v81;
      return v30;
    default:
      a2->uint64_t num = 1;
      long long v29 = "unknown error";
      goto LABEL_138;
  }
}

Tokenizer *__cdecl tok_init(const char *a1)
{
  uint64_t v2 = (char *)malloc_type_malloc(0x48uLL, 0x1090040E7945993uLL);
  if (v2)
  {
    if (a1) {
      uint64_t v3 = a1;
    }
    else {
      uint64_t v3 = "\t \n";
    }
    int v4 = strdup(v3);
    *(void *)uint64_t v2 = v4;
    if (v4)
    {
      *(_OWORD *)(v2 + 8) = xmmword_213B276C0;
      int v5 = malloc_type_malloc(0x50uLL, 0x10040436913F5uLL);
      *((void *)v2 + 3) = v5;
      if (v5)
      {
        *int v5 = 0;
        uint64_t v6 = (char *)malloc_type_malloc(0x14uLL, 0x100004077774924uLL);
        *((void *)v2 + 7) = v6;
        if (v6)
        {
          *((void *)v2 + 5) = v6 + 20;
          *((void *)v2 + 6) = v6;
          *((void *)v2 + 4) = v6;
          *((void *)v2 + 8) = 0;
          return (Tokenizer *)v2;
        }
        free(*((void **)v2 + 3));
      }
      free(*(void **)v2);
    }
    free(v2);
    return 0;
  }
  return (Tokenizer *)v2;
}

void tok_reset(Tokenizer *a1)
{
  *((void *)a1 + longjmp(dword_2677F43AC, 1) = 0;
  uint64_t v1 = *((void *)a1 + 7);
  *((void *)a1 + 6) = v1;
  *((void *)a1 + 4) = v1;
  *((void *)a1 + 8) = 0;
}

void tok_end(Tokenizer *a1)
{
  free(*(void **)a1);
  free(*((void **)a1 + 7));
  free(*((void **)a1 + 3));

  free(a1);
}

int tok_line(Tokenizer *a1, const LineInfo *a2, int *a3, const char ***a4, int *a5, int *a6)
{
  int buffer = a2->buffer;
  int v11 = -1;
  int v12 = -1;
  while (1)
  {
    if (buffer >= a2->lastchar) {
      int v13 = "";
    }
    else {
      int v13 = buffer;
    }
    if (v13 == a2->cursor)
    {
      int v11 = *((_DWORD *)a1 + 2);
      int v12 = *((_DWORD *)a1 + 8) - *((_DWORD *)a1 + 12);
    }
    int v14 = *v13;
    if (v14 <= 33) {
      break;
    }
    if (v14 == 34)
    {
      int v19 = *((_DWORD *)a1 + 16);
      *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
      switch(v19)
      {
        case 0:
          goto LABEL_26;
        case 1:
          goto LABEL_33;
        case 2:
          goto LABEL_30;
        case 3:
          goto LABEL_24;
        case 4:
          goto LABEL_32;
        default:
          return -1;
      }
    }
    if (v14 != 92)
    {
      if (v14 == 39)
      {
        int v15 = *((_DWORD *)a1 + 16);
        *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
        switch(v15)
        {
          case 0:
            int v16 = 1;
            goto LABEL_28;
          case 1:
            goto LABEL_30;
          case 2:
            goto LABEL_33;
          case 3:
            goto LABEL_24;
          case 4:
            goto LABEL_32;
          default:
            return -1;
        }
      }
LABEL_21:
      int v22 = *((_DWORD *)a1 + 16);
      *((_DWORD *)a1 + 17) &= ~2u;
      switch(v22)
      {
        case 0:
          char v23 = *v13;
          if (strchr(*(char **)a1, *v13))
          {
            sub_213B2606C((uint64_t)a1);
            goto LABEL_35;
          }
          char v27 = v23;
          break;
        case 1:
        case 2:
          goto LABEL_33;
        case 3:
          goto LABEL_24;
        case 4:
          long long v26 = (unsigned char *)*((void *)a1 + 4);
          *((void *)a1 + 4) = v26 + 1;
          unsigned char *v26 = 92;
          goto LABEL_32;
        default:
          return -1;
      }
LABEL_34:
      int v28 = (char *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v28 + 1;
      char *v28 = v27;
      goto LABEL_35;
    }
    int v20 = *((_DWORD *)a1 + 16);
    *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
    switch(v20)
    {
      case 0:
        int v16 = 3;
        break;
      case 1:
        goto LABEL_33;
      case 2:
        int v16 = 4;
        break;
      case 3:
        char v24 = *v13;
        int v25 = (char *)*((void *)a1 + 4);
        *((void *)a1 + 4) = v25 + 1;
        *int v25 = v24;
        goto LABEL_30;
      case 4:
        goto LABEL_32;
      default:
        return -1;
    }
LABEL_28:
    *((_DWORD *)a1 + 16) = v16;
LABEL_35:
    uint64_t v29 = *((void *)a1 + 5);
    if (*((void *)a1 + 4) >= (unint64_t)(v29 - 4))
    {
      int v30 = (void *)*((void *)a1 + 7);
      size_t v31 = v29 - (void)v30 + 20;
      long long v32 = (char *)malloc_type_realloc(v30, v31, 0x100004077774924uLL);
      if (!v32) {
        return -1;
      }
      size_t v33 = (char *)*((void *)a1 + 7);
      if (v32 != v33)
      {
        uint64_t v34 = *((void *)a1 + 1);
        if (v34)
        {
          for (uint64_t i = 0; i != v34; ++i)
            *(void *)(*((void *)a1 + 3) + 8 * i) = &v32[*(void *)(*((void *)a1 + 3) + 8 * i)
                                                          - *((void *)a1 + 7)];
          size_t v33 = (char *)*((void *)a1 + 7);
        }
        *((void *)a1 + 4) = &v32[*((void *)a1 + 4) - (void)v33];
        *((void *)a1 + 6) = &v32[*((void *)a1 + 6) - (void)v33];
        *((void *)a1 + 7) = v32;
      }
      *((void *)a1 + 5) = &v32[v31];
    }
    uint64_t v36 = *((void *)a1 + 2);
    if (*((void *)a1 + 1) >= (unint64_t)(v36 - 4))
    {
      uint64_t v37 = v36 + 10;
      *((void *)a1 + 2) = v37;
      int v38 = malloc_type_realloc(*((void **)a1 + 3), 8 * v37, 0x10040436913F5uLL);
      if (!v38) {
        return -1;
      }
      *((void *)a1 + 3) = v38;
    }
    int buffer = v13 + 1;
  }
  if (!*v13)
  {
    int result = *((_DWORD *)a1 + 16);
    switch(result)
    {
      case 0:
        int v39 = *((_DWORD *)a1 + 17);
        if ((v39 & 2) != 0)
        {
          *((_DWORD *)a1 + 17) = v39 & 0xFFFFFFFD;
          return 3;
        }
        else
        {
LABEL_52:
          if (v11 == -1)
          {
            int v41 = a5;
            int v40 = a6;
            if (v12 == -1)
            {
              int v11 = *((_DWORD *)a1 + 2);
              int v12 = *((_DWORD *)a1 + 8) - *((_DWORD *)a1 + 12);
            }
          }
          else
          {
            int v41 = a5;
            int v40 = a6;
          }
          if (v41) {
            int *v41 = v11;
          }
          if (v40) {
            int *v40 = v12;
          }
          sub_213B2606C((uint64_t)a1);
          int result = 0;
          *a4 = (const char **)*((void *)a1 + 3);
          *a3 = *((void *)a1 + 1);
        }
        return result;
      case 1:
      case 2:
        return result;
      case 3:
LABEL_24:
        *((_DWORD *)a1 + 16) = 0;
        goto LABEL_33;
      case 4:
LABEL_32:
        *((_DWORD *)a1 + 16) = 2;
LABEL_33:
        char v27 = *v13;
        break;
      default:
        return -1;
    }
    goto LABEL_34;
  }
  if (v14 != 10) {
    goto LABEL_21;
  }
  int v18 = *((_DWORD *)a1 + 16);
  int v17 = *((_DWORD *)a1 + 17);
  *((_DWORD *)a1 + 17) = v17 & 0xFFFFFFFD;
  switch(v18)
  {
    case 0:
      goto LABEL_52;
    case 1:
    case 2:
      goto LABEL_33;
    case 3:
      *((_DWORD *)a1 + 17) = v17 | 2;
LABEL_30:
      *((_DWORD *)a1 + 16) = 0;
      goto LABEL_35;
    case 4:
      *((_DWORD *)a1 + 17) = v17 | 2;
LABEL_26:
      *((_DWORD *)a1 + 16) = 2;
      goto LABEL_35;
    default:
      int result = 0;
      break;
  }
  return result;
}

uint64_t sub_213B2606C(uint64_t result)
{
  **(unsigned char **)(result + 32) = 0;
  int v1 = *(_DWORD *)(result + 68);
  if (v1)
  {
    uint64_t v2 = *(void *)(result + 48);
  }
  else
  {
    uint64_t v2 = *(void *)(result + 48);
    if (*(void *)(result + 32) == v2) {
      goto LABEL_6;
    }
  }
  uint64_t v3 = *(void *)(result + 24);
  uint64_t v4 = *(void *)(result + 8);
  *(void *)(result + 8) = v4 + 1;
  *(void *)(v3 + 8 * v4) = v2;
  *(void *)(*(void *)(result + 24) + 8 * (v4 + 1)) = 0;
  uint64_t v5 = *(void *)(result + 32) + 1;
  *(void *)(result + 32) = v5;
  *(void *)(result + 48) = v5;
LABEL_6:
  *(_DWORD *)(result + 68) = v1 & 0xFFFFFFFE;
  return result;
}

int tok_str(Tokenizer *a1, const char *a2, int *a3, const char ***a4)
{
  v8.int buffer = a2;
  v8.unint64_t cursor = &a2[strlen(a2)];
  v8.lastchar = v8.cursor;
  return tok_line(a1, &v8, a3, a4, 0, 0);
}

void sub_213B26138()
{
  __assert_rtn("tty_stty", "tty.c", 1345, "c != 0");
}

void sub_213B26164()
{
  __assert_rtn("tty_stty", "tty.c", 1348, "c != -1");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

speed_t cfgetispeed(const termios *a1)
{
  return MEMORY[0x270ED8E80](a1);
}

speed_t cfgetospeed(const termios *a1)
{
  return MEMORY[0x270ED8E88](a1);
}

int cfsetispeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8E98](a1, a2);
}

int cfsetospeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8EA0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

void endpwent(void)
{
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x270ED9828](__file, __arg0);
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x270ED98A0](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270ED98E8](*(void *)&a1, a2);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x270ED9958](a1, a2);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

pid_t fork(void)
{
  return MEMORY[0x270ED99F8]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270ED9AC8](__stream, a2, *(void *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x270ED9B20](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x270ED9BC0](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

pid_t getpgrp(void)
{
  return MEMORY[0x270ED9CD8]();
}

passwd *getpwent(void)
{
  return (passwd *)MEMORY[0x270ED9D20]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D30](a1, a2, a3, a4, a5);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x270ED9D38](*(void *)&a1);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D40](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x270ED9F18]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

void longjmp(jmp_buf a1, int a2)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

size_t mbstowcs(__int32 *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDA440](a1, a2, a3);
}

int mbtowc(__int32 *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDA448](a1, a2, a3);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x270EDA730](*(void *)&a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x270EDB1A8](a1, a2, *(void *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x270EDB1B8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x270EDB3F8](a1);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x270EDB408](*(void *)&a1, a2);
}

void setpwent(void)
{
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x270EDB4B8](*(void *)&a1, a2, a3);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x270EDB4D8](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strcoll(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B8](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x270EDB630](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int strvis(char *a1, const char *a2, int a3)
{
  return MEMORY[0x270EDB738](a1, a2, *(void *)&a3);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x270EDB8C8](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x270EDB8D0](*(void *)&a1, *(void *)&a2, a3);
}

int tgetent(char *a1, const char *a2)
{
  return MEMORY[0x270F9A108](a1, a2);
}

int tgetflag(char *a1)
{
  return MEMORY[0x270F9A110](a1);
}

int tgetnum(char *a1)
{
  return MEMORY[0x270F9A118](a1);
}

char *__cdecl tgetstr(char *a1, char **a2)
{
  return (char *)MEMORY[0x270F9A120](a1, a2);
}

char *__cdecl tgoto(const char *a1, int a2, int a3)
{
  return (char *)MEMORY[0x270F9A128](a1, *(void *)&a2, *(void *)&a3);
}

int tputs(const char *a1, int a2, int (__cdecl *a3)(int))
{
  return MEMORY[0x270F9A138](a1, *(void *)&a2, a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int unvis(char *a1, int a2, int *a3, int a4)
{
  return MEMORY[0x270EDB9D0](a1, *(void *)&a2, a3, *(void *)&a4);
}

char *__cdecl vis(char *a1, int a2, int a3, int a4)
{
  return (char *)MEMORY[0x270EDBA78](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}

__int32 *__cdecl wcschr(__int32 *__s, __int32 __c)
{
  return (__int32 *)MEMORY[0x270EDBB80](__s, *(void *)&__c);
}

int wcscmp(const __int32 *a1, const __int32 *a2)
{
  return MEMORY[0x270EDBB88](a1, a2);
}

size_t wcscspn(const __int32 *a1, const __int32 *a2)
{
  return MEMORY[0x270EDBB98](a1, a2);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x270EDBBA0](a1);
}

__int32 *__cdecl wcsncat(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x270EDBBA8](a1, a2, a3);
}

int wcsncmp(const __int32 *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x270EDBBB0](a1, a2, a3);
}

__int32 *__cdecl wcsncpy(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x270EDBBB8](a1, a2, a3);
}

__int32 *__cdecl wcsstr(__int32 *__s1, const __int32 *__s2)
{
  return (__int32 *)MEMORY[0x270EDBBC0](__s1, __s2);
}

uint64_t wcstol(const __int32 *a1, __int32 **a2, int a3)
{
  return MEMORY[0x270EDBBC8](a1, a2, *(void *)&a3);
}

size_t wcstombs(char *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x270EDBBD0](a1, a2, a3);
}

int wctomb(char *a1, __int32 a2)
{
  return MEMORY[0x270EDBBD8](a1, *(void *)&a2);
}

int wcwidth(__int32 a1)
{
  return MEMORY[0x270EDBBE0](*(void *)&a1);
}

__int32 *__cdecl wmemcpy(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x270EDBBF8](a1, a2, a3);
}