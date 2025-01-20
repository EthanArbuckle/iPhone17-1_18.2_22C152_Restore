_DWORD *os_set_32_ptr_find(uint64_t *a1, unsigned int a2)
{
  unsigned int v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  _DWORD *result;

  if (*((_DWORD *)a1 + 2))
  {
    v2 = *((_DWORD *)a1 + 3);
    if (!v2) {
LABEL_11:
    }
      os_set_32_ptr_find_cold_1();
    v3 = 0;
    v4 = *a1;
    v5 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
    v6 = (v5 ^ HIWORD(v5)) % v2;
    v7 = *((unsigned __int16 *)a1 + 9) + 1;
    while (v7 != v3)
    {
      result = *(_DWORD **)(v4 + 8 * v6);
      if (!result || *result == a2) {
        return result;
      }
      if (v6 + 1 < v2) {
        ++v6;
      }
      else {
        v6 = 0;
      }
      if (v2 == ++v3) {
        goto LABEL_11;
      }
    }
  }
  return 0;
}

void *os_set_64_ptr_find(uint64_t *a1, uint64_t a2)
{
  if (*((_DWORD *)a1 + 2))
  {
    unsigned int v2 = *((_DWORD *)a1 + 3);
    if (!v2) {
LABEL_11:
    }
      os_set_64_ptr_find_cold_1();
    int v3 = 0;
    uint64_t v4 = *a1;
    unsigned int v5 = 73244475 * ((73244475 * (a2 ^ WORD1(a2))) ^ ((73244475 * (a2 ^ WORD1(a2))) >> 16));
    unsigned int v6 = (v5 ^ HIWORD(v5)) % v2;
    int v7 = *((unsigned __int16 *)a1 + 9) + 1;
    while (v7 != v3)
    {
      result = *(void **)(v4 + 8 * v6);
      if (!result || *result == a2) {
        return result;
      }
      if (v6 + 1 < v2) {
        ++v6;
      }
      else {
        unsigned int v6 = 0;
      }
      if (v2 == ++v3) {
        goto LABEL_11;
      }
    }
  }
  return 0;
}

void os_map_str_destroy(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 12) = 0;
}

void *os_map_64_init(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 8);
    if (v3 <= 0x20) {
      unsigned int v3 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v3;
    *(_WORD *)(a1 + 18) = 0;
    if (v3 == -1) {
      os_map_64_init_cold_2();
    }
  }
  else
  {
    *(void *)(a1 + 8) = 0x2000000000;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v3 = 32;
  }
  result = malloc_type_calloc(v3, 0x10uLL, 0x1C4F2082uLL);
  if (!result) {
    os_map_64_init_cold_1();
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

uint64_t *os_set_64_ptr_insert(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    os_set_64_ptr_insert_cold_1();
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_set_64_ptr_rehash(a1, 1);
  }

  return _os_set_64_ptr_insert_no_rehash((uint64_t *)a1, a2, a2);
}

void _os_set_64_ptr_rehash(uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 12);
  if (a2 < 1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 12);
    if (a2 < 0)
    {
      unsigned int v6 = *(unsigned __int16 *)(a1 + 16);
      if (v6 >= 6)
      {
        LOWORD(v6) = v6 - 1;
        *(_WORD *)(a1 + 16) = v6;
      }
      int v7 = 1 << v6;
      int v8 = v7 - 1;
      unsigned int v9 = v7 - ((v7 - 1) & (v3 >> 1));
      if ((v8 & (v3 >> 1)) == 0) {
        unsigned int v9 = 0;
      }
      unsigned int v5 = v9 + (v3 >> 1);
      *(_DWORD *)(a1 + 12) = v5;
    }
  }
  else
  {
    __int16 v4 = *(_WORD *)(a1 + 16);
    unsigned int v5 = (1 << v4) + v3;
    *(_DWORD *)(a1 + 12) = v5;
    if (v5 == 8 << v4) {
      *(_WORD *)(a1 + 16) = v4 + 1;
    }
  }
  v10 = *(_DWORD ***)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v5 == -1) {
    os_set_64_ptr_init_cold_2();
  }
  v11 = malloc_type_calloc(v5, 8uLL, 0x10040436913F5uLL);
  if (!v11) {
    os_set_64_ptr_init_cold_1();
  }
  *(void *)a1 = v11;
  if (v3)
  {
    v12 = v10;
    do
    {
      if (*v12) {
        _os_set_64_ptr_insert_no_rehash((uint64_t *)a1, *v12, *v12);
      }
      ++v12;
      --v3;
    }
    while (v3);
  }

  free(v10);
}

uint64_t *_os_set_64_ptr_insert_no_rehash(uint64_t *result, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *((_DWORD *)result + 3);
  if (!v3) {
LABEL_18:
  }
    _os_set_64_ptr_insert_no_rehash_cold_1();
  unsigned int v4 = 0;
  uint64_t v5 = *result;
  unsigned int v6 = 73244475 * (*a2 ^ HIWORD(*a2));
  unsigned int v7 = ((73244475 * (v6 ^ HIWORD(v6))) ^ ((73244475 * (v6 ^ HIWORD(v6))) >> 16)) % v3;
  int v8 = *((_DWORD *)result + 3);
  while (1)
  {
    unsigned int v9 = *(_DWORD **)(v5 + 8 * v7);
    if (!v9) {
      break;
    }
    if (v4
      && ((unsigned int v10 = 73244475 * (*v9 ^ HIWORD(*v9)),
           unsigned int v11 = ((73244475 * (v10 ^ HIWORD(v10))) ^ ((73244475 * (v10 ^ HIWORD(v10))) >> 16)) % v3,
           BOOL v12 = v7 >= v11,
           unsigned int v13 = v7 - v11,
           v12)
        ? (unsigned int v14 = 0)
        : (unsigned int v14 = v3),
          unsigned int v15 = v14 + v13,
          v4 > v15))
    {
      if (v4 > *((unsigned __int16 *)result + 9))
      {
        if (v4 >= 0x10000) {
          _os_set_64_ptr_insert_no_rehash_cold_3();
        }
        *((_WORD *)result + 9) = v4;
      }
      *(void *)(v5 + 8 * v7) = a3;
      unsigned int v4 = v15;
    }
    else
    {
      unsigned int v9 = a3;
    }
    ++v4;
    if (v7 + 1 < v3) {
      ++v7;
    }
    else {
      unsigned int v7 = 0;
    }
    a3 = v9;
    if (!--v8) {
      goto LABEL_18;
    }
  }
  if (v4 > *((unsigned __int16 *)result + 9))
  {
    if (v4 >= 0x10000) {
      _os_set_64_ptr_insert_no_rehash_cold_2();
    }
    *((_WORD *)result + 9) = v4;
  }
  *(void *)(v5 + 8 * v7) = a3;
  ++*((_DWORD *)result + 2);
  return result;
}

void *os_map_str_init(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 8);
    if (v3 <= 0x20) {
      unsigned int v3 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v3;
    *(_WORD *)(a1 + 18) = 0;
    if (v3 == -1) {
      os_map_str_init_cold_2();
    }
  }
  else
  {
    *(void *)(a1 + 8) = 0x2000000000;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v3 = 32;
  }
  result = malloc_type_calloc(v3, 0x10uLL, 0x1C4F2082uLL);
  if (!result) {
    os_map_str_init_cold_1();
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_map_str_clear(char **a1, uint64_t a2)
{
  unsigned int v4 = *a1;
  uint64_t v5 = *((unsigned int *)a1 + 3);
  *((_WORD *)a1 + 9) = 0;
  a1[1] = (char *)0x2000000000;
  unsigned int v6 = (char *)malloc_type_calloc(0x20uLL, 0x10uLL, 0x1C4F2082uLL);
  if (!v6) {
    os_map_str_init_cold_1();
  }
  *a1 = v6;
  *((_WORD *)a1 + 8) = 5;
  if (a2 && v5)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 8 * v5;
    do
    {
      if (*(void *)&v4[v8 + v7]) {
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&v4[v7]);
      }
      v7 += 8;
    }
    while (v8 != v7);
  }

  free(v4);
}

void *os_set_64_ptr_init(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 8);
    if (v3 <= 0x20) {
      unsigned int v3 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v3;
    *(_WORD *)(a1 + 18) = 0;
    if (v3 == -1) {
      os_set_64_ptr_init_cold_2();
    }
  }
  else
  {
    *(void *)(a1 + 8) = 0x2000000000;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v3 = 32;
  }
  result = malloc_type_calloc(v3, 8uLL, 0x10040436913F5uLL);
  if (!result) {
    os_set_64_ptr_init_cold_1();
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void *os_set_str_ptr_init(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 8);
    if (v3 <= 0x20) {
      unsigned int v3 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v3;
    *(_WORD *)(a1 + 18) = 0;
    if (v3 == -1) {
      os_set_str_ptr_init_cold_2();
    }
  }
  else
  {
    *(void *)(a1 + 8) = 0x2000000000;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v3 = 32;
  }
  result = malloc_type_calloc(v3, 8uLL, 0x80040B8603338uLL);
  if (!result) {
    os_set_str_ptr_init_cold_1();
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void *os_set_32_ptr_init(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 8);
    if (v3 <= 0x20) {
      unsigned int v3 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v3;
    *(_WORD *)(a1 + 18) = 0;
    if (v3 == -1) {
      os_set_32_ptr_init_cold_2();
    }
  }
  else
  {
    *(void *)(a1 + 8) = 0x2000000000;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v3 = 32;
  }
  result = malloc_type_calloc(v3, 8uLL, 0x10040436913F5uLL);
  if (!result) {
    os_set_32_ptr_init_cold_1();
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

uint64_t *os_map_str_insert(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  if (!a3) {
    os_map_str_insert_cold_1();
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_map_str_rehash((char **)a1, 1);
  }

  return _os_map_str_insert_no_rehash((uint64_t *)a1, a2, a3);
}

void _os_map_str_rehash(char **a1, int a2)
{
  uint64_t v3 = *((unsigned int *)a1 + 3);
  if (a2 < 1)
  {
    unsigned int v5 = *((_DWORD *)a1 + 3);
    if (a2 < 0)
    {
      unsigned int v6 = *((unsigned __int16 *)a1 + 8);
      if (v6 >= 6)
      {
        LOWORD(v6) = v6 - 1;
        *((_WORD *)a1 + 8) = v6;
      }
      int v7 = 1 << v6;
      int v8 = v7 - 1;
      unsigned int v9 = v7 - ((v7 - 1) & (v3 >> 1));
      if ((v8 & (v3 >> 1)) == 0) {
        unsigned int v9 = 0;
      }
      unsigned int v5 = v9 + (v3 >> 1);
      *((_DWORD *)a1 + 3) = v5;
    }
  }
  else
  {
    __int16 v4 = *((_WORD *)a1 + 8);
    unsigned int v5 = (1 << v4) + v3;
    *((_DWORD *)a1 + 3) = v5;
    if (v5 == 8 << v4) {
      *((_WORD *)a1 + 8) = v4 + 1;
    }
  }
  unsigned int v10 = *a1;
  *((_DWORD *)a1 + 2) = 0;
  *((_WORD *)a1 + 9) = 0;
  if (v5 == -1) {
    os_map_str_init_cold_2();
  }
  unsigned int v11 = (char *)malloc_type_calloc(v5, 0x10uLL, 0x1C4F2082uLL);
  if (!v11) {
    os_map_str_init_cold_1();
  }
  *a1 = v11;
  if (v3)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 8 * v3;
    do
    {
      uint64_t v14 = *(void *)&v10[v13 + v12];
      if (v14) {
        _os_map_str_insert_no_rehash((uint64_t *)a1, *(unsigned char **)&v10[v12], v14);
      }
      v12 += 8;
    }
    while (v13 != v12);
  }

  free(v10);
}

uint64_t *_os_map_str_insert_no_rehash(uint64_t *result, unsigned char *a2, uint64_t a3)
{
  uint64_t v3 = *((unsigned int *)result + 3);
  int v4 = *a2;
  if (*a2)
  {
    unsigned int v5 = 0;
    unsigned int v6 = a2 + 1;
    do
    {
      unsigned int v5 = (1025 * (v5 + v4)) ^ ((1025 * (v5 + v4)) >> 6);
      int v7 = *v6++;
      int v4 = v7;
    }
    while (v7);
    unsigned int v8 = 9 * v5;
    if (!v3) {
LABEL_27:
    }
      _os_map_str_insert_no_rehash_cold_1();
  }
  else
  {
    unsigned int v8 = 0;
    if (!v3) {
      goto LABEL_27;
    }
  }
  unsigned int v9 = 0;
  uint64_t v10 = *result;
  uint64_t v11 = *result + 8 * v3;
  unsigned int v12 = 32769 * (v8 ^ (v8 >> 11)) % v3;
  int v13 = *((_DWORD *)result + 3);
  while (1)
  {
    uint64_t v14 = *(void *)(v11 + 8 * v12);
    if (!v14) {
      break;
    }
    if (v9)
    {
      unsigned int v15 = *(unsigned char **)(v10 + 8 * v12);
      int v16 = *v15;
      if (*v15)
      {
        unsigned int v17 = 0;
        v18 = v15 + 1;
        do
        {
          unsigned int v17 = (1025 * (v17 + v16)) ^ ((1025 * (v17 + v16)) >> 6);
          int v19 = *v18++;
          int v16 = v19;
        }
        while (v19);
        unsigned int v20 = 9 * v17;
      }
      else
      {
        unsigned int v20 = 0;
      }
      unsigned int v21 = 32769 * (v20 ^ (v20 >> 11)) % v3;
      BOOL v22 = v12 >= v21;
      unsigned int v23 = v12 - v21;
      int v24 = v22 ? 0 : v3;
      unsigned int v25 = v24 + v23;
      if (v9 > v25)
      {
        if (v9 > *((unsigned __int16 *)result + 9))
        {
          if (v9 >= 0x10000) {
            _os_map_str_insert_no_rehash_cold_3();
          }
          *((_WORD *)result + 9) = v9;
        }
        *(void *)(v10 + 8 * v12) = a2;
        *(void *)(v11 + 8 * v12) = a3;
        a2 = v15;
        a3 = v14;
        unsigned int v9 = v25;
      }
    }
    ++v9;
    if (v12 + 1 < v3) {
      ++v12;
    }
    else {
      unsigned int v12 = 0;
    }
    if (!--v13) {
      goto LABEL_27;
    }
  }
  if (v9 > *((unsigned __int16 *)result + 9))
  {
    if (v9 >= 0x10000) {
      _os_map_str_insert_no_rehash_cold_2();
    }
    *((_WORD *)result + 9) = v9;
  }
  *(void *)(v10 + 8 * v12) = a2;
  *(void *)(v11 + 8 * v12) = a3;
  ++*((_DWORD *)result + 2);
  return result;
}

void _os_map_str_insert_no_rehash_cold_1()
{
  __assert_rtn("_os_map_str_insert_no_rehash", "collections_common.in.c", 219, "loop_limit-- != 0");
}

const char **os_set_str_ptr_delete(uint64_t a1, char *__s1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 12);
    int v6 = *__s1;
    if (*__s1)
    {
      unsigned int v7 = 0;
      unsigned int v8 = __s1 + 1;
      do
      {
        unsigned int v7 = (1025 * (v7 + v6)) ^ ((1025 * (v7 + v6)) >> 6);
        int v9 = *v8++;
        int v6 = v9;
      }
      while (v9);
      unsigned int v10 = 9 * v7;
      if (!v5) {
LABEL_17:
      }
        os_set_str_ptr_find_cold_1();
    }
    else
    {
      unsigned int v10 = 0;
      if (!v5) {
        goto LABEL_17;
      }
    }
    int v11 = 0;
    uint64_t v12 = *(void *)a1;
    unsigned int v13 = 32769 * (v10 ^ (v10 >> 11)) % v5;
    int v14 = *(unsigned __int16 *)(a1 + 18) + 1;
    while (v14 != v11)
    {
      unsigned int v15 = *(const char ***)(v12 + 8 * v13);
      if (!v15) {
        return v15;
      }
      if (*v15 == __s1 || !strcmp(__s1, *v15))
      {
        if (v13 + 1 < v5) {
          unsigned int v16 = v13 + 1;
        }
        else {
          unsigned int v16 = 0;
        }
        unsigned int v17 = *(void **)(v12 + 8 * v16);
        if (v17)
        {
          while (1)
          {
            unsigned int v18 = v16;
            int v19 = *(unsigned __int8 *)*v17;
            if (*(unsigned char *)*v17)
            {
              unsigned int v20 = 0;
              unsigned int v21 = (unsigned __int8 *)(*v17 + 1);
              do
              {
                unsigned int v20 = (1025 * (v20 + v19)) ^ ((1025 * (v20 + v19)) >> 6);
                int v22 = *v21++;
                int v19 = v22;
              }
              while (v22);
              unsigned int v23 = 9 * v20;
            }
            else
            {
              unsigned int v23 = 0;
            }
            if (32769 * (v23 ^ (v23 >> 11)) % v5 == v18) {
              break;
            }
            *(void *)(v12 + 8 * v13) = v17;
            if (v18 + 1 < v5) {
              unsigned int v16 = v18 + 1;
            }
            else {
              unsigned int v16 = 0;
            }
            unsigned int v17 = *(void **)(v12 + 8 * v16);
            unsigned int v13 = v18;
            if (!v17) {
              goto LABEL_36;
            }
          }
          unsigned int v18 = v13;
LABEL_36:
          uint64_t v24 = v18;
        }
        else
        {
          uint64_t v24 = v13;
        }
        *(void *)(v12 + 8 * v24) = 0;
        *(_DWORD *)(a1 + 8) = v2 - 1;
        if (v5 >= 0x40 && v2 - 1 < v5 >> 3) {
          _os_set_str_ptr_rehash(a1, -1);
        }
        return v15;
      }
      if (v13 + 1 < v5) {
        ++v13;
      }
      else {
        unsigned int v13 = 0;
      }
      if (v5 == ++v11) {
        goto LABEL_17;
      }
    }
  }
  return 0;
}

uint64_t *os_set_str_ptr_insert(uint64_t a1, void *a2)
{
  if (!a2) {
    os_set_str_ptr_insert_cold_1();
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_set_str_ptr_rehash(a1, 1);
  }

  return _os_set_str_ptr_insert_no_rehash((uint64_t *)a1, a2, a2);
}

void _os_set_str_ptr_rehash(uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 12);
  if (a2 < 1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 12);
    if (a2 < 0)
    {
      unsigned int v6 = *(unsigned __int16 *)(a1 + 16);
      if (v6 >= 6)
      {
        LOWORD(v6) = v6 - 1;
        *(_WORD *)(a1 + 16) = v6;
      }
      int v7 = 1 << v6;
      int v8 = v7 - 1;
      unsigned int v9 = v7 - ((v7 - 1) & (v3 >> 1));
      if ((v8 & (v3 >> 1)) == 0) {
        unsigned int v9 = 0;
      }
      unsigned int v5 = v9 + (v3 >> 1);
      *(_DWORD *)(a1 + 12) = v5;
    }
  }
  else
  {
    __int16 v4 = *(_WORD *)(a1 + 16);
    unsigned int v5 = (1 << v4) + v3;
    *(_DWORD *)(a1 + 12) = v5;
    if (v5 == 8 << v4) {
      *(_WORD *)(a1 + 16) = v4 + 1;
    }
  }
  unsigned int v10 = *(void ***)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v5 == -1) {
    os_set_str_ptr_init_cold_2();
  }
  int v11 = malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
  if (!v11) {
    os_set_str_ptr_init_cold_1();
  }
  *(void *)a1 = v11;
  if (v3)
  {
    uint64_t v12 = v10;
    do
    {
      if (*v12) {
        _os_set_str_ptr_insert_no_rehash((uint64_t *)a1, *v12, *v12);
      }
      ++v12;
      --v3;
    }
    while (v3);
  }

  free(v10);
}

uint64_t *_os_set_str_ptr_insert_no_rehash(uint64_t *result, void *a2, void *a3)
{
  unsigned int v3 = *((_DWORD *)result + 3);
  unsigned int v4 = *(unsigned __int8 *)*a2;
  if (*(unsigned char *)*a2)
  {
    unsigned int v5 = 0;
    unsigned int v6 = (unsigned __int8 *)(*a2 + 1);
    do
    {
      unsigned int v5 = (1025 * (v5 + v4)) ^ ((1025 * (v5 + v4)) >> 6);
      unsigned int v7 = *v6++;
      unsigned int v4 = v7;
    }
    while (v7);
    unsigned int v4 = 9 * v5;
  }
  if (!v3) {
LABEL_27:
  }
    _os_set_str_ptr_insert_no_rehash_cold_1();
  unsigned int v8 = 0;
  uint64_t v9 = *result;
  unsigned int v10 = 32769 * (v4 ^ (v4 >> 11)) % v3;
  int v11 = *((_DWORD *)result + 3);
  while (1)
  {
    uint64_t v12 = *(void **)(v9 + 8 * v10);
    if (!v12) {
      break;
    }
    if (!v8) {
      goto LABEL_22;
    }
    int v13 = *(unsigned __int8 *)*v12;
    if (*(unsigned char *)*v12)
    {
      unsigned int v14 = 0;
      unsigned int v15 = (unsigned __int8 *)(*v12 + 1);
      do
      {
        unsigned int v14 = (1025 * (v14 + v13)) ^ ((1025 * (v14 + v13)) >> 6);
        int v16 = *v15++;
        int v13 = v16;
      }
      while (v16);
      unsigned int v17 = 9 * v14;
    }
    else
    {
      unsigned int v17 = 0;
    }
    unsigned int v18 = 32769 * (v17 ^ (v17 >> 11)) % v3;
    BOOL v19 = v10 >= v18;
    unsigned int v20 = v10 - v18;
    unsigned int v21 = v19 ? 0 : v3;
    unsigned int v22 = v21 + v20;
    if (v8 > v22)
    {
      if (v8 > *((unsigned __int16 *)result + 9))
      {
        if (v8 >= 0x10000) {
          _os_set_str_ptr_insert_no_rehash_cold_3();
        }
        *((_WORD *)result + 9) = v8;
      }
      *(void *)(v9 + 8 * v10) = a3;
      unsigned int v8 = v22;
    }
    else
    {
LABEL_22:
      uint64_t v12 = a3;
    }
    ++v8;
    if (v10 + 1 < v3) {
      ++v10;
    }
    else {
      unsigned int v10 = 0;
    }
    a3 = v12;
    if (!--v11) {
      goto LABEL_27;
    }
  }
  if (v8 > *((unsigned __int16 *)result + 9))
  {
    if (v8 >= 0x10000) {
      _os_set_str_ptr_insert_no_rehash_cold_2();
    }
    *((_WORD *)result + 9) = v8;
  }
  *(void *)(v9 + 8 * v10) = a3;
  ++*((_DWORD *)result + 2);
  return result;
}

void _os_set_str_ptr_insert_no_rehash_cold_1()
{
  __assert_rtn("_os_set_str_ptr_insert_no_rehash", "collections_common.in.c", 219, "loop_limit-- != 0");
}

uint64_t *os_set_32_ptr_insert(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    os_set_32_ptr_insert_cold_1();
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_set_32_ptr_rehash(a1, 1);
  }

  return _os_set_32_ptr_insert_no_rehash((uint64_t *)a1, a2, a2);
}

uint64_t os_map_str_delete(uint64_t a1, char *__s1)
{
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    int v5 = *__s1;
    int v27 = *(_DWORD *)(a1 + 8);
    unsigned int v6 = 0;
    if (*__s1)
    {
      unsigned int v7 = __s1 + 1;
      do
      {
        unsigned int v6 = (1025 * (v6 + v5)) ^ ((1025 * (v6 + v5)) >> 6);
        int v8 = *v7++;
        int v5 = v8;
      }
      while (v8);
      v6 *= 9;
    }
    if (!v4) {
LABEL_16:
    }
      os_map_str_find_cold_1();
    int v9 = 0;
    unsigned int v10 = *(char **)a1;
    uint64_t v11 = *(void *)a1 + 8 * v4;
    unsigned int v12 = 32769 * (v6 ^ (v6 >> 11)) % v4;
    int v13 = *(unsigned __int16 *)(a1 + 18) + 1;
    while (v13 != v9)
    {
      uint64_t v14 = *(void *)(v11 + 8 * v12);
      if (!v14) {
        return v14;
      }
      uint64_t v15 = v12;
      int v16 = *(char **)&v10[8 * v12];
      if (v16 == __s1 || !strcmp(__s1, v16))
      {
        if (v12 + 1 < v4) {
          uint64_t v17 = v12 + 1;
        }
        else {
          uint64_t v17 = 0;
        }
        uint64_t v18 = *(void *)(v11 + 8 * v17);
        if (v18)
        {
          while (1)
          {
            unsigned int v19 = v17;
            unsigned int v20 = *(unsigned char **)&v10[8 * v17];
            int v21 = *v20;
            if (*v20)
            {
              unsigned int v22 = 0;
              unsigned int v23 = v20 + 1;
              do
              {
                unsigned int v22 = (1025 * (v22 + v21)) ^ ((1025 * (v22 + v21)) >> 6);
                int v24 = *v23++;
                int v21 = v24;
              }
              while (v24);
              unsigned int v25 = 9 * v22;
            }
            else
            {
              unsigned int v25 = 0;
            }
            if (32769 * (v25 ^ (v25 >> 11)) % v4 == v19) {
              break;
            }
            *(void *)&v10[8 * v12] = v20;
            *(void *)(v11 + 8 * v12) = v18;
            if (v19 + 1 < v4) {
              uint64_t v17 = v19 + 1;
            }
            else {
              uint64_t v17 = 0;
            }
            uint64_t v18 = *(void *)(v11 + 8 * v17);
            unsigned int v12 = v19;
            if (!v18) {
              goto LABEL_34;
            }
          }
          unsigned int v19 = v12;
LABEL_34:
          uint64_t v15 = v19;
        }
        *(void *)(v11 + 8 * v15) = 0;
        *(_DWORD *)(a1 + 8) = v27 - 1;
        if (v4 >= 0x40 && v27 - 1 < v4 >> 3) {
          _os_map_str_rehash((char **)a1, -1);
        }
        return v14;
      }
      if (v12 + 1 < v4) {
        ++v12;
      }
      else {
        unsigned int v12 = 0;
      }
      if (v4 == ++v9) {
        goto LABEL_16;
      }
    }
  }
  return 0;
}

uint64_t os_map_str_find(uint64_t *a1, char *__s1)
{
  if (*((_DWORD *)a1 + 2))
  {
    uint64_t v3 = *((unsigned int *)a1 + 3);
    int v4 = *__s1;
    if (*__s1)
    {
      unsigned int v5 = 0;
      unsigned int v6 = __s1 + 1;
      do
      {
        unsigned int v5 = (1025 * (v5 + v4)) ^ ((1025 * (v5 + v4)) >> 6);
        int v7 = *v6++;
        int v4 = v7;
      }
      while (v7);
      unsigned int v8 = 9 * v5;
      if (!v3) {
LABEL_17:
      }
        os_map_str_find_cold_1();
    }
    else
    {
      unsigned int v8 = 0;
      if (!v3) {
        goto LABEL_17;
      }
    }
    int v9 = 0;
    uint64_t v10 = *a1;
    uint64_t v11 = *a1 + 8 * v3;
    unsigned int v12 = 32769 * (v8 ^ (v8 >> 11)) % v3;
    int v13 = *((unsigned __int16 *)a1 + 9) + 1;
    while (v13 != v9)
    {
      uint64_t v14 = *(void *)(v11 + 8 * v12);
      if (!v14) {
        return v14;
      }
      uint64_t v15 = *(char **)(v10 + 8 * v12);
      if (v15 == __s1 || !strcmp(__s1, v15)) {
        return v14;
      }
      if (v12 + 1 < v3) {
        ++v12;
      }
      else {
        unsigned int v12 = 0;
      }
      if (v3 == ++v9) {
        goto LABEL_17;
      }
    }
  }
  return 0;
}

const char **os_set_str_ptr_find(uint64_t *a1, char *__s1)
{
  if (*((_DWORD *)a1 + 2))
  {
    unsigned int v3 = *((_DWORD *)a1 + 3);
    int v4 = *__s1;
    if (*__s1)
    {
      unsigned int v5 = 0;
      unsigned int v6 = __s1 + 1;
      do
      {
        unsigned int v5 = (1025 * (v5 + v4)) ^ ((1025 * (v5 + v4)) >> 6);
        int v7 = *v6++;
        int v4 = v7;
      }
      while (v7);
      unsigned int v8 = 9 * v5;
      if (!v3) {
LABEL_17:
      }
        os_set_str_ptr_find_cold_1();
    }
    else
    {
      unsigned int v8 = 0;
      if (!v3) {
        goto LABEL_17;
      }
    }
    int v9 = 0;
    uint64_t v10 = *a1;
    unsigned int v11 = 32769 * (v8 ^ (v8 >> 11)) % v3;
    int v12 = *((unsigned __int16 *)a1 + 9) + 1;
    while (v12 != v9)
    {
      int v13 = *(const char ***)(v10 + 8 * v11);
      if (!v13 || *v13 == __s1 || !strcmp(__s1, *v13)) {
        return v13;
      }
      if (v11 + 1 < v3) {
        ++v11;
      }
      else {
        unsigned int v11 = 0;
      }
      if (v3 == ++v9) {
        goto LABEL_17;
      }
    }
  }
  return 0;
}

void _os_set_32_ptr_rehash(uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 12);
  if (a2 < 1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 12);
    if (a2 < 0)
    {
      unsigned int v6 = *(unsigned __int16 *)(a1 + 16);
      if (v6 >= 6)
      {
        LOWORD(v6) = v6 - 1;
        *(_WORD *)(a1 + 16) = v6;
      }
      int v7 = 1 << v6;
      int v8 = v7 - 1;
      unsigned int v9 = v7 - ((v7 - 1) & (v3 >> 1));
      if ((v8 & (v3 >> 1)) == 0) {
        unsigned int v9 = 0;
      }
      unsigned int v5 = v9 + (v3 >> 1);
      *(_DWORD *)(a1 + 12) = v5;
    }
  }
  else
  {
    __int16 v4 = *(_WORD *)(a1 + 16);
    unsigned int v5 = (1 << v4) + v3;
    *(_DWORD *)(a1 + 12) = v5;
    if (v5 == 8 << v4) {
      *(_WORD *)(a1 + 16) = v4 + 1;
    }
  }
  uint64_t v10 = *(_DWORD ***)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v5 == -1) {
    os_set_32_ptr_init_cold_2();
  }
  unsigned int v11 = malloc_type_calloc(v5, 8uLL, 0x10040436913F5uLL);
  if (!v11) {
    os_set_32_ptr_init_cold_1();
  }
  *(void *)a1 = v11;
  if (v3)
  {
    int v12 = v10;
    do
    {
      if (*v12) {
        _os_set_32_ptr_insert_no_rehash((uint64_t *)a1, *v12, *v12);
      }
      ++v12;
      --v3;
    }
    while (v3);
  }

  free(v10);
}

uint64_t *_os_set_32_ptr_insert_no_rehash(uint64_t *result, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *((_DWORD *)result + 3);
  if (!v3) {
LABEL_18:
  }
    _os_set_32_ptr_insert_no_rehash_cold_1();
  unsigned int v4 = 0;
  uint64_t v5 = *result;
  unsigned int v6 = 73244475 * (*a2 ^ HIWORD(*a2));
  unsigned int v7 = ((73244475 * (v6 ^ HIWORD(v6))) ^ ((73244475 * (v6 ^ HIWORD(v6))) >> 16)) % v3;
  int v8 = *((_DWORD *)result + 3);
  while (1)
  {
    unsigned int v9 = *(_DWORD **)(v5 + 8 * v7);
    if (!v9) {
      break;
    }
    if (v4
      && ((unsigned int v10 = 73244475 * (*v9 ^ HIWORD(*v9)),
           unsigned int v11 = ((73244475 * (v10 ^ HIWORD(v10))) ^ ((73244475 * (v10 ^ HIWORD(v10))) >> 16)) % v3,
           BOOL v12 = v7 >= v11,
           unsigned int v13 = v7 - v11,
           v12)
        ? (unsigned int v14 = 0)
        : (unsigned int v14 = v3),
          unsigned int v15 = v14 + v13,
          v4 > v15))
    {
      if (v4 > *((unsigned __int16 *)result + 9))
      {
        if (v4 >= 0x10000) {
          _os_set_32_ptr_insert_no_rehash_cold_3();
        }
        *((_WORD *)result + 9) = v4;
      }
      *(void *)(v5 + 8 * v7) = a3;
      unsigned int v4 = v15;
    }
    else
    {
      unsigned int v9 = a3;
    }
    ++v4;
    if (v7 + 1 < v3) {
      ++v7;
    }
    else {
      unsigned int v7 = 0;
    }
    a3 = v9;
    if (!--v8) {
      goto LABEL_18;
    }
  }
  if (v4 > *((unsigned __int16 *)result + 9))
  {
    if (v4 >= 0x10000) {
      _os_set_32_ptr_insert_no_rehash_cold_2();
    }
    *((_WORD *)result + 9) = v4;
  }
  *(void *)(v5 + 8 * v7) = a3;
  ++*((_DWORD *)result + 2);
  return result;
}

void os_set_str_ptr_find_cold_1()
{
  __assert_rtn("_os_set_str_ptr_find_helper", "collections_common.in.c", 312, "loop_limit-- != 0");
}

void _os_set_32_ptr_insert_no_rehash_cold_1()
{
  __assert_rtn("_os_set_32_ptr_insert_no_rehash", "collections_common.in.c", 219, "loop_limit-- != 0");
}

void os_map_str_find_cold_1()
{
  __assert_rtn("_os_map_str_find_helper", "collections_common.in.c", 312, "loop_limit-- != 0");
}

uint64_t os_map_str_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_map_32_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

_DWORD *os_set_32_ptr_delete(uint64_t a1, unsigned int a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 12);
    if (!v3) {
LABEL_11:
    }
      os_set_32_ptr_find_cold_1();
    int v4 = 0;
    uint64_t v5 = *(void *)a1;
    unsigned int v6 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
    unsigned int v7 = (v6 ^ HIWORD(v6)) % v3;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v4)
    {
      int v8 = *(_DWORD **)(v5 + 8 * v7);
      if (!v8) {
        return v8;
      }
      if (v7 + 1 < v3) {
        unsigned int v9 = v7 + 1;
      }
      else {
        unsigned int v9 = 0;
      }
      if (*v8 == a2)
      {
        unsigned int v11 = *(_DWORD **)(v5 + 8 * v9);
        if (v11)
        {
          while (1)
          {
            unsigned int v12 = v9;
            unsigned int v13 = 73244475 * (*v11 ^ HIWORD(*v11));
            if (((73244475 * (v13 ^ HIWORD(v13))) ^ ((73244475 * (v13 ^ HIWORD(v13))) >> 16)) % v3 == v12) {
              break;
            }
            *(void *)(v5 + 8 * v7) = v11;
            if (v12 + 1 < v3) {
              unsigned int v9 = v12 + 1;
            }
            else {
              unsigned int v9 = 0;
            }
            unsigned int v11 = *(_DWORD **)(v5 + 8 * v9);
            unsigned int v7 = v12;
            if (!v11) {
              goto LABEL_23;
            }
          }
          unsigned int v12 = v7;
LABEL_23:
          uint64_t v14 = v12;
        }
        else
        {
          uint64_t v14 = v7;
        }
        *(void *)(v5 + 8 * v14) = 0;
        unsigned int v15 = v2 - 1;
        *(_DWORD *)(a1 + 8) = v15;
        if (v3 >= 0x40 && v15 < v3 >> 3) {
          _os_set_32_ptr_rehash(a1, -1);
        }
        return v8;
      }
      ++v4;
      unsigned int v7 = v9;
      if (v3 == v4) {
        goto LABEL_11;
      }
    }
  }
  return 0;
}

void *os_set_64_ptr_delete(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 12);
    if (!v3) {
LABEL_11:
    }
      os_set_64_ptr_find_cold_1();
    int v4 = 0;
    uint64_t v5 = *(void *)a1;
    unsigned int v6 = 73244475 * ((73244475 * (a2 ^ WORD1(a2))) ^ ((73244475 * (a2 ^ WORD1(a2))) >> 16));
    unsigned int v7 = (v6 ^ HIWORD(v6)) % v3;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v4)
    {
      int v8 = *(void **)(v5 + 8 * v7);
      if (!v8) {
        return v8;
      }
      if (v7 + 1 < v3) {
        unsigned int v9 = v7 + 1;
      }
      else {
        unsigned int v9 = 0;
      }
      if (*v8 == a2)
      {
        unsigned int v11 = *(_DWORD **)(v5 + 8 * v9);
        if (v11)
        {
          while (1)
          {
            unsigned int v12 = v9;
            unsigned int v13 = 73244475 * (*v11 ^ HIWORD(*v11));
            if (((73244475 * (v13 ^ HIWORD(v13))) ^ ((73244475 * (v13 ^ HIWORD(v13))) >> 16)) % v3 == v12) {
              break;
            }
            *(void *)(v5 + 8 * v7) = v11;
            if (v12 + 1 < v3) {
              unsigned int v9 = v12 + 1;
            }
            else {
              unsigned int v9 = 0;
            }
            unsigned int v11 = *(_DWORD **)(v5 + 8 * v9);
            unsigned int v7 = v12;
            if (!v11) {
              goto LABEL_23;
            }
          }
          unsigned int v12 = v7;
LABEL_23:
          uint64_t v14 = v12;
        }
        else
        {
          uint64_t v14 = v7;
        }
        *(void *)(v5 + 8 * v14) = 0;
        unsigned int v15 = v2 - 1;
        *(_DWORD *)(a1 + 8) = v15;
        if (v3 >= 0x40 && v15 < v3 >> 3) {
          _os_set_64_ptr_rehash(a1, -1);
        }
        return v8;
      }
      ++v4;
      unsigned int v7 = v9;
      if (v3 == v4) {
        goto LABEL_11;
      }
    }
  }
  return 0;
}

uint64_t *os_map_32_insert(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a3) {
    os_map_32_insert_cold_1();
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_map_32_rehash(a1, 1);
  }

  return _os_map_32_insert_no_rehash((uint64_t *)a1, a2, a3);
}

uint64_t os_map_32_find(uint64_t *a1, unsigned int a2)
{
  if (*((_DWORD *)a1 + 2))
  {
    uint64_t v2 = *((unsigned int *)a1 + 3);
    if (!v2) {
LABEL_11:
    }
      os_map_32_find_cold_1();
    int v3 = 0;
    uint64_t v4 = *a1;
    uint64_t v5 = *a1 + 4 * v2;
    unsigned int v6 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
    unsigned int v7 = (v6 ^ HIWORD(v6)) % v2;
    int v8 = *((unsigned __int16 *)a1 + 9) + 1;
    while (v8 != v3)
    {
      uint64_t result = *(void *)(v5 + 8 * v7);
      if (!result || *(_DWORD *)(v4 + 4 * v7) == a2) {
        return result;
      }
      if (v7 + 1 < v2) {
        ++v7;
      }
      else {
        unsigned int v7 = 0;
      }
      if (v2 == ++v3) {
        goto LABEL_11;
      }
    }
  }
  return 0;
}

uint64_t *_os_map_32_insert_no_rehash(uint64_t *result, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *((unsigned int *)result + 3);
  if (!v3) {
LABEL_17:
  }
    _os_map_32_insert_no_rehash_cold_1();
  unsigned int v4 = 0;
  uint64_t v5 = *result;
  uint64_t v6 = *result + 4 * v3;
  unsigned int v7 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
  unsigned int v8 = (v7 ^ HIWORD(v7)) % v3;
  int v9 = *((_DWORD *)result + 3);
  while (1)
  {
    uint64_t v10 = *(void *)(v6 + 8 * v8);
    if (!v10) {
      break;
    }
    if (v4)
    {
      unsigned int v11 = *(_DWORD *)(v5 + 4 * v8);
      unsigned int v12 = 73244475 * ((73244475 * (v11 ^ HIWORD(v11))) ^ ((73244475 * (v11 ^ HIWORD(v11))) >> 16));
      unsigned int v13 = *((_DWORD *)result + 3);
      unsigned int v14 = (v12 ^ HIWORD(v12)) % v13;
      BOOL v15 = v8 >= v14;
      unsigned int v16 = v8 - v14;
      if (v15) {
        unsigned int v13 = 0;
      }
      unsigned int v17 = v13 + v16;
      if (v4 > v17)
      {
        if (v4 > *((unsigned __int16 *)result + 9))
        {
          if (v4 >= 0x10000) {
            _os_map_32_insert_no_rehash_cold_3();
          }
          *((_WORD *)result + 9) = v4;
        }
        *(_DWORD *)(v5 + 4 * v8) = a2;
        *(void *)(v6 + 8 * v8) = a3;
        a2 = v11;
        a3 = v10;
        unsigned int v4 = v17;
      }
    }
    ++v4;
    if (v8 + 1 < v3) {
      ++v8;
    }
    else {
      unsigned int v8 = 0;
    }
    if (!--v9) {
      goto LABEL_17;
    }
  }
  if (v4 > *((unsigned __int16 *)result + 9))
  {
    if (v4 >= 0x10000) {
      _os_map_32_insert_no_rehash_cold_2();
    }
    *((_WORD *)result + 9) = v4;
  }
  *(_DWORD *)(v5 + 4 * v8) = a2;
  *(void *)(v6 + 8 * v8) = a3;
  ++*((_DWORD *)result + 2);
  return result;
}

uint64_t os_map_str_foreach(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 12);
  if (v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)result;
    uint64_t v7 = *(void *)result + 8 * v2;
    do
    {
      if (*(void *)(v7 + 8 * v5))
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(v6 + 8 * v5));
        if (!result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v4 + 12);
      }
      ++v5;
    }
    while (v5 < v2);
  }
  return result;
}

uint64_t os_map_32_delete(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v2 = *(unsigned int *)(a1 + 12);
    if (!v2) {
LABEL_11:
    }
      os_map_32_find_cold_1();
    int v3 = 0;
    uint64_t v4 = *(void *)a1;
    uint64_t v5 = *(void *)a1 + 4 * v2;
    unsigned int v6 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
    unsigned int v7 = (v6 ^ HIWORD(v6)) % v2;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v3)
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7);
      if (!v8) {
        return v8;
      }
      if (v7 + 1 < v2) {
        uint64_t v9 = v7 + 1;
      }
      else {
        uint64_t v9 = 0;
      }
      if (*(_DWORD *)(v4 + 4 * v7) == a2)
      {
        uint64_t v11 = *(void *)(v5 + 8 * v9);
        if (v11)
        {
          while (1)
          {
            unsigned int v12 = v9;
            unsigned int v13 = *(_DWORD *)(v4 + 4 * v9);
            unsigned int v14 = 73244475 * ((73244475 * (v13 ^ HIWORD(v13))) ^ ((73244475 * (v13 ^ HIWORD(v13))) >> 16));
            if ((v14 ^ HIWORD(v14)) % *(_DWORD *)(a1 + 12) == v12) {
              break;
            }
            *(_DWORD *)(v4 + 4 * v7) = v13;
            *(void *)(v5 + 8 * v7) = v11;
            if (v12 + 1 < v2) {
              uint64_t v9 = v12 + 1;
            }
            else {
              uint64_t v9 = 0;
            }
            uint64_t v11 = *(void *)(v5 + 8 * v9);
            unsigned int v7 = v12;
            if (!v11)
            {
              LODWORD(v2) = *(_DWORD *)(a1 + 12);
              unsigned int v7 = v12;
              goto LABEL_22;
            }
          }
          LODWORD(v2) = *(_DWORD *)(a1 + 12);
        }
LABEL_22:
        *(void *)(v5 + 8 * v7) = 0;
        unsigned int v15 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v15;
        if (v2 >= 0x40 && v15 < v2 >> 3) {
          _os_map_32_rehash(a1, -1);
        }
        return v8;
      }
      ++v3;
      unsigned int v7 = v9;
      if (v2 == v3) {
        goto LABEL_11;
      }
    }
  }
  return 0;
}

void _os_set_64_ptr_insert_no_rehash_cold_1()
{
  __assert_rtn("_os_set_64_ptr_insert_no_rehash", "collections_common.in.c", 219, "loop_limit-- != 0");
}

void os_set_str_ptr_destroy(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 12) = 0;
}

void os_set_str_ptr_clear(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x263EF8BF8];
    v9[1] = 0x40000000;
    uint64_t v10 = __os_set_str_ptr_clear_block_invoke;
    uint64_t v11 = &unk_264DA2640;
    uint64_t v12 = a2;
    int v3 = *(void **)a1;
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000;
    uint64_t v5 = malloc_type_calloc(0x20uLL, 8uLL, 0x80040B8603338uLL);
    if (!v5) {
      os_set_str_ptr_init_cold_1();
    }
    *(void *)a1 = v5;
    *(_WORD *)(a1 + 16) = 5;
    if (v4)
    {
      unsigned int v6 = v3;
      do
      {
        if (*v6) {
          ((void (*)(void *, void, void))v10)(v9, *v6, *v6);
        }
        ++v6;
        --v4;
      }
      while (v4);
    }
    free(v3);
  }
  else
  {
    unsigned int v7 = *(void **)a1;
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000;
    uint64_t v8 = malloc_type_calloc(0x20uLL, 8uLL, 0x80040B8603338uLL);
    if (!v8) {
      os_set_str_ptr_init_cold_1();
    }
    *(void *)a1 = v8;
    *(_WORD *)(a1 + 16) = 5;
    free(v7);
  }
}

uint64_t __os_set_str_ptr_clear_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t os_set_str_ptr_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_set_str_ptr_foreach(uint64_t result, uint64_t a2)
{
  v7[0] = MEMORY[0x263EF8BF8];
  v7[1] = 0x40000000;
  uint64_t v8 = __os_set_str_ptr_foreach_block_invoke;
  uint64_t v9 = &unk_264DA2668;
  uint64_t v10 = a2;
  unint64_t v2 = *(unsigned int *)(result + 12);
  if (v2)
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    uint64_t v5 = *(void *)result;
    do
    {
      uint64_t v6 = *(void *)(v5 + 8 * v4);
      if (v6)
      {
        uint64_t result = ((uint64_t (*)(void *, uint64_t, void))v8)(v7, v6, *(void *)(v5 + 8 * v4));
        if (!result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v3 + 12);
      }
      ++v4;
    }
    while (v4 < v2);
  }
  return result;
}

uint64_t __os_set_str_ptr_foreach_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void os_set_32_ptr_destroy(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 12) = 0;
}

void os_set_32_ptr_clear(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x263EF8BF8];
    v9[1] = 0x40000000;
    uint64_t v10 = __os_set_32_ptr_clear_block_invoke;
    uint64_t v11 = &unk_264DA2690;
    uint64_t v12 = a2;
    uint64_t v3 = *(void **)a1;
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000;
    uint64_t v5 = malloc_type_calloc(0x20uLL, 8uLL, 0x10040436913F5uLL);
    if (!v5) {
      os_set_32_ptr_init_cold_1();
    }
    *(void *)a1 = v5;
    *(_WORD *)(a1 + 16) = 5;
    if (v4)
    {
      uint64_t v6 = v3;
      do
      {
        if (*v6) {
          ((void (*)(void *, void, void))v10)(v9, *v6, *v6);
        }
        ++v6;
        --v4;
      }
      while (v4);
    }
    free(v3);
  }
  else
  {
    unsigned int v7 = *(void **)a1;
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000;
    uint64_t v8 = malloc_type_calloc(0x20uLL, 8uLL, 0x10040436913F5uLL);
    if (!v8) {
      os_set_32_ptr_init_cold_1();
    }
    *(void *)a1 = v8;
    *(_WORD *)(a1 + 16) = 5;
    free(v7);
  }
}

uint64_t __os_set_32_ptr_clear_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t os_set_32_ptr_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_set_32_ptr_foreach(uint64_t result, uint64_t a2)
{
  v7[0] = MEMORY[0x263EF8BF8];
  v7[1] = 0x40000000;
  uint64_t v8 = __os_set_32_ptr_foreach_block_invoke;
  uint64_t v9 = &unk_264DA26B8;
  uint64_t v10 = a2;
  unint64_t v2 = *(unsigned int *)(result + 12);
  if (v2)
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    uint64_t v5 = *(void *)result;
    do
    {
      uint64_t v6 = *(void *)(v5 + 8 * v4);
      if (v6)
      {
        uint64_t result = ((uint64_t (*)(void *, uint64_t, void))v8)(v7, v6, *(void *)(v5 + 8 * v4));
        if (!result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v3 + 12);
      }
      ++v4;
    }
    while (v4 < v2);
  }
  return result;
}

uint64_t __os_set_32_ptr_foreach_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void os_set_64_ptr_destroy(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 12) = 0;
}

void os_set_64_ptr_clear(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x263EF8BF8];
    v9[1] = 0x40000000;
    uint64_t v10 = __os_set_64_ptr_clear_block_invoke;
    uint64_t v11 = &unk_264DA26E0;
    uint64_t v12 = a2;
    uint64_t v3 = *(void **)a1;
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000;
    uint64_t v5 = malloc_type_calloc(0x20uLL, 8uLL, 0x10040436913F5uLL);
    if (!v5) {
      os_set_64_ptr_init_cold_1();
    }
    *(void *)a1 = v5;
    *(_WORD *)(a1 + 16) = 5;
    if (v4)
    {
      uint64_t v6 = v3;
      do
      {
        if (*v6) {
          ((void (*)(void *, void, void))v10)(v9, *v6, *v6);
        }
        ++v6;
        --v4;
      }
      while (v4);
    }
    free(v3);
  }
  else
  {
    unsigned int v7 = *(void **)a1;
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000;
    uint64_t v8 = malloc_type_calloc(0x20uLL, 8uLL, 0x10040436913F5uLL);
    if (!v8) {
      os_set_64_ptr_init_cold_1();
    }
    *(void *)a1 = v8;
    *(_WORD *)(a1 + 16) = 5;
    free(v7);
  }
}

uint64_t __os_set_64_ptr_clear_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t os_set_64_ptr_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_set_64_ptr_foreach(uint64_t result, uint64_t a2)
{
  v7[0] = MEMORY[0x263EF8BF8];
  v7[1] = 0x40000000;
  uint64_t v8 = __os_set_64_ptr_foreach_block_invoke;
  uint64_t v9 = &unk_264DA2708;
  uint64_t v10 = a2;
  unint64_t v2 = *(unsigned int *)(result + 12);
  if (v2)
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    uint64_t v5 = *(void *)result;
    do
    {
      uint64_t v6 = *(void *)(v5 + 8 * v4);
      if (v6)
      {
        uint64_t result = ((uint64_t (*)(void *, uint64_t, void))v8)(v7, v6, *(void *)(v5 + 8 * v4));
        if (!result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v3 + 12);
      }
      ++v4;
    }
    while (v4 < v2);
  }
  return result;
}

uint64_t __os_set_64_ptr_foreach_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

char *os_map_str_entry(uint64_t *a1, char *__s1)
{
  if (*((_DWORD *)a1 + 2))
  {
    uint64_t v3 = *((unsigned int *)a1 + 3);
    int v4 = *__s1;
    if (*__s1)
    {
      unsigned int v5 = 0;
      uint64_t v6 = __s1 + 1;
      do
      {
        unsigned int v5 = (1025 * (v5 + v4)) ^ ((1025 * (v5 + v4)) >> 6);
        int v7 = *v6++;
        int v4 = v7;
      }
      while (v7);
      unsigned int v8 = 9 * v5;
      if (!v3) {
LABEL_17:
      }
        os_map_str_find_cold_1();
    }
    else
    {
      unsigned int v8 = 0;
      if (!v3) {
        goto LABEL_17;
      }
    }
    int v9 = 0;
    uint64_t v10 = *a1;
    uint64_t v11 = *a1 + 8 * v3;
    unsigned int v12 = 32769 * (v8 ^ (v8 >> 11)) % v3;
    int v13 = *((unsigned __int16 *)a1 + 9) + 1;
    while (v13 != v9 && *(void *)(v11 + 8 * v12))
    {
      unsigned int v14 = *(char **)(v10 + 8 * v12);
      if (v14 == __s1) {
        return __s1;
      }
      if (!strcmp(__s1, *(const char **)(v10 + 8 * v12))) {
        return v14;
      }
      if (v12 + 1 < v3) {
        ++v12;
      }
      else {
        unsigned int v12 = 0;
      }
      if (v3 == ++v9) {
        goto LABEL_17;
      }
    }
  }
  return 0;
}

void *os_map_32_init(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 8);
    if (v3 <= 0x20) {
      unsigned int v3 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v3;
    *(_WORD *)(a1 + 18) = 0;
    if (v3 == -1) {
      os_map_32_init_cold_2();
    }
  }
  else
  {
    *(void *)(a1 + 8) = 0x2000000000;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v3 = 32;
  }
  uint64_t result = malloc_type_calloc(v3, 0xCuLL, 0x1C4F2082uLL);
  if (!result) {
    os_map_32_init_cold_1();
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_map_32_destroy(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 12) = 0;
}

void os_map_32_clear(char **a1, uint64_t a2)
{
  int v4 = *a1;
  uint64_t v5 = *((unsigned int *)a1 + 3);
  *((_WORD *)a1 + 9) = 0;
  a1[1] = (char *)0x2000000000;
  uint64_t v6 = (char *)malloc_type_calloc(0x20uLL, 0xCuLL, 0x1C4F2082uLL);
  if (!v6) {
    os_map_32_init_cold_1();
  }
  *a1 = v6;
  *((_WORD *)a1 + 8) = 5;
  if (a2 && v5)
  {
    int v7 = &v4[4 * v5];
    unsigned int v8 = (unsigned int *)v4;
    do
    {
      if (*(void *)v7) {
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *v8);
      }
      ++v8;
      v7 += 8;
      --v5;
    }
    while (v5);
  }

  free(v4);
}

uint64_t os_map_32_foreach(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 12);
  if (v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)result;
    uint64_t v7 = *(void *)result + 4 * v2;
    do
    {
      if (*(void *)(v7 + 8 * v5))
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned int *)(v6 + 4 * v5));
        if (!result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v4 + 12);
      }
      ++v5;
    }
    while (v5 < v2);
  }
  return result;
}

void os_map_64_destroy(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 12) = 0;
}

uint64_t *os_map_64_insert(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    os_map_64_insert_cold_1();
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_map_64_rehash((char **)a1, 1);
  }

  return _os_map_64_insert_no_rehash((uint64_t *)a1, a2, a3);
}

uint64_t os_map_64_find(uint64_t *a1, uint64_t a2)
{
  if (*((_DWORD *)a1 + 2))
  {
    uint64_t v2 = *((unsigned int *)a1 + 3);
    if (!v2) {
LABEL_11:
    }
      os_map_64_find_cold_1();
    int v3 = 0;
    uint64_t v4 = *a1;
    unsigned int v5 = 73244475 * (HIDWORD(a2) ^ a2 ^ ((HIDWORD(a2) ^ a2) >> 16));
    unsigned int v6 = ((73244475 * (v5 ^ HIWORD(v5))) ^ ((73244475 * (v5 ^ HIWORD(v5))) >> 16)) % v2;
    uint64_t v7 = *a1 + 8 * v2;
    int v8 = *((unsigned __int16 *)a1 + 9) + 1;
    while (v8 != v3)
    {
      uint64_t result = *(void *)(v7 + 8 * v6);
      if (!result || *(void *)(v4 + 8 * v6) == a2) {
        return result;
      }
      if (v6 + 1 < v2) {
        ++v6;
      }
      else {
        unsigned int v6 = 0;
      }
      if (v2 == ++v3) {
        goto LABEL_11;
      }
    }
  }
  return 0;
}

uint64_t os_map_64_delete(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 12);
    if (!v3) {
LABEL_11:
    }
      os_map_64_find_cold_1();
    int v4 = 0;
    unsigned int v5 = *(char **)a1;
    uint64_t v6 = *(void *)a1 + 8 * v3;
    unsigned int v7 = 73244475 * (HIDWORD(a2) ^ a2 ^ ((HIDWORD(a2) ^ a2) >> 16));
    unsigned int v8 = ((73244475 * (v7 ^ HIWORD(v7))) ^ ((73244475 * (v7 ^ HIWORD(v7))) >> 16)) % v3;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v4)
    {
      uint64_t v9 = *(void *)(v6 + 8 * v8);
      if (!v9) {
        return v9;
      }
      uint64_t v10 = v8;
      if (v8 + 1 < v3) {
        uint64_t v11 = v8 + 1;
      }
      else {
        uint64_t v11 = 0;
      }
      if (*(void *)&v5[8 * v8] == a2)
      {
        uint64_t v13 = *(void *)(v6 + 8 * v11);
        if (v13)
        {
          while (1)
          {
            unsigned int v14 = v11;
            uint64_t v15 = *(void *)&v5[8 * v11];
            unsigned int v16 = 73244475 * (HIDWORD(v15) ^ v15 ^ ((HIDWORD(v15) ^ v15) >> 16));
            if (((73244475 * (v16 ^ HIWORD(v16))) ^ ((73244475 * (v16 ^ HIWORD(v16))) >> 16)) % v3 == v14) {
              break;
            }
            *(void *)&v5[8 * v8] = v15;
            *(void *)(v6 + 8 * v8) = v13;
            if (v14 + 1 < v3) {
              uint64_t v11 = v14 + 1;
            }
            else {
              uint64_t v11 = 0;
            }
            uint64_t v13 = *(void *)(v6 + 8 * v11);
            unsigned int v8 = v14;
            if (!v13) {
              goto LABEL_22;
            }
          }
          unsigned int v14 = v8;
LABEL_22:
          uint64_t v10 = v14;
        }
        *(void *)(v6 + 8 * v10) = 0;
        unsigned int v17 = v2 - 1;
        *(_DWORD *)(a1 + 8) = v17;
        if (v3 >= 0x40 && v17 < v3 >> 3) {
          _os_map_64_rehash((char **)a1, -1);
        }
        return v9;
      }
      ++v4;
      unsigned int v8 = v11;
      if (v3 == v4) {
        goto LABEL_11;
      }
    }
  }
  return 0;
}

void os_map_64_clear(char **a1, uint64_t a2)
{
  int v4 = *a1;
  uint64_t v5 = *((unsigned int *)a1 + 3);
  *((_WORD *)a1 + 9) = 0;
  a1[1] = (char *)0x2000000000;
  uint64_t v6 = (char *)malloc_type_calloc(0x20uLL, 0x10uLL, 0x1C4F2082uLL);
  if (!v6) {
    os_map_64_init_cold_1();
  }
  *a1 = v6;
  *((_WORD *)a1 + 8) = 5;
  if (a2 && v5)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 8 * v5;
    do
    {
      if (*(void *)&v4[v8 + v7]) {
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&v4[v7]);
      }
      v7 += 8;
    }
    while (v8 != v7);
  }

  free(v4);
}

uint64_t os_map_64_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_map_64_foreach(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 12);
  if (v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)result;
    uint64_t v7 = *(void *)result + 8 * v2;
    do
    {
      if (*(void *)(v7 + 8 * v5))
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(v6 + 8 * v5));
        if (!result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v4 + 12);
      }
      ++v5;
    }
    while (v5 < v2);
  }
  return result;
}

void *os_map_128_init(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 8);
    if (v3 <= 0x20) {
      unsigned int v3 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v3;
    *(_WORD *)(a1 + 18) = 0;
    if (v3 == -1) {
      os_map_128_init_cold_2();
    }
  }
  else
  {
    *(void *)(a1 + 8) = 0x2000000000;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v3 = 32;
  }
  uint64_t result = malloc_type_calloc(v3, 0x18uLL, 0x1C4F2082uLL);
  if (!result) {
    os_map_128_init_cold_1();
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_map_128_destroy(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 12) = 0;
}

uint64_t *os_map_128_insert(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (!a4) {
    os_map_128_insert_cold_1();
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_map_128_rehash(a1, 1);
  }

  return _os_map_128_insert_no_rehash((uint64_t *)a1, a2, a3, a4);
}

uint64_t os_map_128_find(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  if (*((_DWORD *)a1 + 2))
  {
    uint64_t v3 = *((unsigned int *)a1 + 3);
    if (!v3) {
LABEL_14:
    }
      os_map_128_find_cold_1();
    int v4 = 0;
    uint64_t v5 = *a1;
    unsigned int v6 = 73244475 * (((a2 ^ a3) >> 32) ^ a2 ^ a3 ^ ((((a2 ^ a3) >> 32) ^ a2 ^ a3) >> 16));
    unsigned int v7 = ((73244475 * (v6 ^ HIWORD(v6))) ^ ((73244475 * (v6 ^ HIWORD(v6))) >> 16)) % v3;
    uint64_t v8 = *a1 + 16 * v3;
    int v9 = *((unsigned __int16 *)a1 + 9) + 1;
    while (v9 != v4)
    {
      uint64_t result = *(void *)(v8 + 8 * v7);
      if (!result) {
        return result;
      }
      uint64_t v11 = (uint64_t *)(v5 + 16 * v7);
      uint64_t v13 = *v11;
      uint64_t v12 = v11[1];
      if (a2 == v13 && a3 == v12) {
        return result;
      }
      if (v7 + 1 < v3) {
        ++v7;
      }
      else {
        unsigned int v7 = 0;
      }
      if (v3 == ++v4) {
        goto LABEL_14;
      }
    }
  }
  return 0;
}

uint64_t os_map_128_delete(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v3 = *(unsigned int *)(a1 + 12);
    if (!v3) {
LABEL_14:
    }
      os_map_128_find_cold_1();
    int v4 = 0;
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = *(void *)a1 + 16 * v3;
    unsigned int v7 = 73244475 * (((a2 ^ a3) >> 32) ^ a2 ^ a3 ^ ((((a2 ^ a3) >> 32) ^ a2 ^ a3) >> 16));
    unsigned int v8 = ((73244475 * (v7 ^ HIWORD(v7))) ^ ((73244475 * (v7 ^ HIWORD(v7))) >> 16)) % v3;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v4)
    {
      uint64_t v9 = *(void *)(v6 + 8 * v8);
      if (!v9) {
        return v9;
      }
      uint64_t v10 = (uint64_t *)(v5 + 16 * v8);
      uint64_t v11 = *v10;
      uint64_t v12 = v10[1];
      if (v8 + 1 < v3) {
        uint64_t v13 = v8 + 1;
      }
      else {
        uint64_t v13 = 0;
      }
      if (a2 == v11 && a3 == v12)
      {
        uint64_t v16 = *(void *)(v6 + 8 * v13);
        if (v16)
        {
          while (1)
          {
            unsigned int v17 = v13;
            int64x2_t v18 = *(int64x2_t *)(v5 + 16 * v13);
            unint64_t v19 = veorq_s8((int8x16_t)v18, (int8x16_t)vdupq_laneq_s64(v18, 1)).u64[0];
            unsigned int v20 = 73244475 * (HIDWORD(v19) ^ v19 ^ ((HIDWORD(v19) ^ v19) >> 16));
            if (((73244475 * (v20 ^ HIWORD(v20))) ^ ((73244475 * (v20 ^ HIWORD(v20))) >> 16)) % *(_DWORD *)(a1 + 12) == v17) {
              break;
            }
            *(int64x2_t *)(v5 + 16 * v8) = v18;
            *(void *)(v6 + 8 * v8) = v16;
            if (v17 + 1 < v3) {
              uint64_t v13 = v17 + 1;
            }
            else {
              uint64_t v13 = 0;
            }
            uint64_t v16 = *(void *)(v6 + 8 * v13);
            unsigned int v8 = v17;
            if (!v16)
            {
              LODWORD(v3) = *(_DWORD *)(a1 + 12);
              unsigned int v8 = v17;
              goto LABEL_25;
            }
          }
          LODWORD(v3) = *(_DWORD *)(a1 + 12);
        }
LABEL_25:
        *(void *)(v6 + 8 * v8) = 0;
        unsigned int v21 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v21;
        if (v3 >= 0x40 && v21 < v3 >> 3) {
          _os_map_128_rehash(a1, -1);
        }
        return v9;
      }
      ++v4;
      unsigned int v8 = v13;
      if (v3 == v4) {
        goto LABEL_14;
      }
    }
  }
  return 0;
}

void os_map_128_clear(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  uint64_t v5 = *(unsigned int *)(a1 + 12);
  *(_WORD *)(a1 + 18) = 0;
  *(void *)(a1 + 8) = 0x2000000000;
  uint64_t v6 = malloc_type_calloc(0x20uLL, 0x18uLL, 0x1C4F2082uLL);
  if (!v6) {
    os_map_128_init_cold_1();
  }
  *(void *)a1 = v6;
  *(_WORD *)(a1 + 16) = 5;
  if (a2 && v5)
  {
    unsigned int v7 = &v4[2 * v5];
    unsigned int v8 = v4 + 1;
    do
    {
      if (*v7) {
        (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, *(v8 - 1), *v8);
      }
      v8 += 2;
      ++v7;
      --v5;
    }
    while (v5);
  }

  free(v4);
}

uint64_t os_map_128_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_map_128_foreach(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 12);
  if (v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)result + 16 * v2;
    unsigned int v7 = (void *)(*(void *)result + 8);
    do
    {
      if (*(void *)(v6 + 8 * v5))
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(v7 - 1), *v7);
        if (!result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v4 + 12);
      }
      ++v5;
      v7 += 2;
    }
    while (v5 < v2);
  }
  return result;
}

void _os_map_32_rehash(uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 12);
  if (a2 < 1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 12);
    if (a2 < 0)
    {
      unsigned int v6 = *(unsigned __int16 *)(a1 + 16);
      if (v6 >= 6)
      {
        LOWORD(v6) = v6 - 1;
        *(_WORD *)(a1 + 16) = v6;
      }
      int v7 = 1 << v6;
      int v8 = v7 - 1;
      unsigned int v9 = v7 - ((v7 - 1) & (v3 >> 1));
      if ((v8 & (v3 >> 1)) == 0) {
        unsigned int v9 = 0;
      }
      unsigned int v5 = v9 + (v3 >> 1);
      *(_DWORD *)(a1 + 12) = v5;
    }
  }
  else
  {
    __int16 v4 = *(_WORD *)(a1 + 16);
    unsigned int v5 = (1 << v4) + v3;
    *(_DWORD *)(a1 + 12) = v5;
    if (v5 == 8 << v4) {
      *(_WORD *)(a1 + 16) = v4 + 1;
    }
  }
  uint64_t v10 = *(unsigned int **)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v5 == -1) {
    os_map_32_init_cold_2();
  }
  uint64_t v11 = malloc_type_calloc(v5, 0xCuLL, 0x1C4F2082uLL);
  if (!v11) {
    os_map_32_init_cold_1();
  }
  *(void *)a1 = v11;
  if (v3)
  {
    uint64_t v12 = (uint64_t *)&v10[v3];
    uint64_t v13 = v10;
    do
    {
      if (*v12) {
        _os_map_32_insert_no_rehash((uint64_t *)a1, *v13, *v12);
      }
      ++v12;
      ++v13;
      --v3;
    }
    while (v3);
  }

  free(v10);
}

void _os_map_64_rehash(char **a1, int a2)
{
  uint64_t v3 = *((unsigned int *)a1 + 3);
  if (a2 < 1)
  {
    unsigned int v5 = *((_DWORD *)a1 + 3);
    if (a2 < 0)
    {
      unsigned int v6 = *((unsigned __int16 *)a1 + 8);
      if (v6 >= 6)
      {
        LOWORD(v6) = v6 - 1;
        *((_WORD *)a1 + 8) = v6;
      }
      int v7 = 1 << v6;
      int v8 = v7 - 1;
      unsigned int v9 = v7 - ((v7 - 1) & (v3 >> 1));
      if ((v8 & (v3 >> 1)) == 0) {
        unsigned int v9 = 0;
      }
      unsigned int v5 = v9 + (v3 >> 1);
      *((_DWORD *)a1 + 3) = v5;
    }
  }
  else
  {
    __int16 v4 = *((_WORD *)a1 + 8);
    unsigned int v5 = (1 << v4) + v3;
    *((_DWORD *)a1 + 3) = v5;
    if (v5 == 8 << v4) {
      *((_WORD *)a1 + 8) = v4 + 1;
    }
  }
  uint64_t v10 = *a1;
  *((_DWORD *)a1 + 2) = 0;
  *((_WORD *)a1 + 9) = 0;
  if (v5 == -1) {
    os_map_64_init_cold_2();
  }
  uint64_t v11 = (char *)malloc_type_calloc(v5, 0x10uLL, 0x1C4F2082uLL);
  if (!v11) {
    os_map_64_init_cold_1();
  }
  *a1 = v11;
  if (v3)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 8 * v3;
    do
    {
      uint64_t v14 = *(void *)&v10[v13 + v12];
      if (v14) {
        _os_map_64_insert_no_rehash((uint64_t *)a1, *(void *)&v10[v12], v14);
      }
      v12 += 8;
    }
    while (v13 != v12);
  }

  free(v10);
}

uint64_t *_os_map_64_insert_no_rehash(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *((unsigned int *)result + 3);
  if (!v3) {
LABEL_17:
  }
    _os_map_64_insert_no_rehash_cold_1();
  unsigned int v4 = 0;
  uint64_t v5 = *result;
  uint64_t v6 = *result + 8 * v3;
  unsigned int v7 = 73244475 * (HIDWORD(a2) ^ a2 ^ ((HIDWORD(a2) ^ a2) >> 16));
  unsigned int v8 = ((73244475 * (v7 ^ HIWORD(v7))) ^ ((73244475 * (v7 ^ HIWORD(v7))) >> 16)) % v3;
  int v9 = *((_DWORD *)result + 3);
  while (1)
  {
    uint64_t v10 = *(void *)(v6 + 8 * v8);
    if (!v10) {
      break;
    }
    if (v4)
    {
      uint64_t v11 = *(void *)(v5 + 8 * v8);
      unsigned int v12 = 73244475 * (HIDWORD(v11) ^ v11 ^ ((HIDWORD(v11) ^ v11) >> 16));
      unsigned int v13 = ((73244475 * (v12 ^ HIWORD(v12))) ^ ((73244475 * (v12 ^ HIWORD(v12))) >> 16)) % v3;
      BOOL v14 = v8 >= v13;
      unsigned int v15 = v8 - v13;
      int v16 = v14 ? 0 : v3;
      unsigned int v17 = v16 + v15;
      if (v4 > v17)
      {
        if (v4 > *((unsigned __int16 *)result + 9))
        {
          if (v4 >= 0x10000) {
            _os_map_64_insert_no_rehash_cold_3();
          }
          *((_WORD *)result + 9) = v4;
        }
        *(void *)(v5 + 8 * v8) = a2;
        *(void *)(v6 + 8 * v8) = a3;
        a2 = v11;
        a3 = v10;
        unsigned int v4 = v17;
      }
    }
    ++v4;
    if (v8 + 1 < v3) {
      ++v8;
    }
    else {
      unsigned int v8 = 0;
    }
    if (!--v9) {
      goto LABEL_17;
    }
  }
  if (v4 > *((unsigned __int16 *)result + 9))
  {
    if (v4 >= 0x10000) {
      _os_map_64_insert_no_rehash_cold_2();
    }
    *((_WORD *)result + 9) = v4;
  }
  *(void *)(v5 + 8 * v8) = a2;
  *(void *)(v6 + 8 * v8) = a3;
  ++*((_DWORD *)result + 2);
  return result;
}

void _os_map_128_rehash(uint64_t a1, int a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 12);
  if (a2 < 1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 12);
    if (a2 < 0)
    {
      unsigned int v6 = *(unsigned __int16 *)(a1 + 16);
      if (v6 >= 6)
      {
        LOWORD(v6) = v6 - 1;
        *(_WORD *)(a1 + 16) = v6;
      }
      int v7 = 1 << v6;
      int v8 = v7 - 1;
      unsigned int v9 = v7 - ((v7 - 1) & (v3 >> 1));
      if ((v8 & (v3 >> 1)) == 0) {
        unsigned int v9 = 0;
      }
      unsigned int v5 = v9 + (v3 >> 1);
      *(_DWORD *)(a1 + 12) = v5;
    }
  }
  else
  {
    __int16 v4 = *(_WORD *)(a1 + 16);
    unsigned int v5 = (1 << v4) + v3;
    *(_DWORD *)(a1 + 12) = v5;
    if (v5 == 8 << v4) {
      *(_WORD *)(a1 + 16) = v4 + 1;
    }
  }
  uint64_t v10 = *(unint64_t **)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v5 == -1) {
    os_map_128_init_cold_2();
  }
  uint64_t v11 = malloc_type_calloc(v5, 0x18uLL, 0x1C4F2082uLL);
  if (!v11) {
    os_map_128_init_cold_1();
  }
  *(void *)a1 = v11;
  if (v3)
  {
    unsigned int v12 = (uint64_t *)&v10[2 * v3];
    unsigned int v13 = v10 + 1;
    do
    {
      if (*v12) {
        _os_map_128_insert_no_rehash((uint64_t *)a1, *(v13 - 1), *v13, *v12);
      }
      ++v12;
      v13 += 2;
      --v3;
    }
    while (v3);
  }

  free(v10);
}

uint64_t *_os_map_128_insert_no_rehash(uint64_t *result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = *((unsigned int *)result + 3);
  if (!v4) {
LABEL_17:
  }
    _os_map_128_insert_no_rehash_cold_1();
  unsigned int v5 = 0;
  uint64_t v6 = *result;
  uint64_t v7 = *result + 16 * v4;
  unsigned int v8 = 73244475 * (((a2 ^ a3) >> 32) ^ a2 ^ a3 ^ ((((a2 ^ a3) >> 32) ^ a2 ^ a3) >> 16));
  unsigned int v9 = ((73244475 * (v8 ^ HIWORD(v8))) ^ ((73244475 * (v8 ^ HIWORD(v8))) >> 16)) % v4;
  int v10 = *((_DWORD *)result + 3);
  while (1)
  {
    uint64_t v11 = *(void *)(v7 + 8 * v9);
    if (!v11) {
      break;
    }
    if (v5)
    {
      unsigned int v12 = (uint64_t *)(v6 + 16 * v9);
      uint64_t v14 = *v12;
      unint64_t v13 = v12[1];
      unsigned int v15 = ((v13 ^ *v12) >> 32) ^ v13 ^ *(_DWORD *)v12;
      unsigned int v16 = 73244475 * ((73244475 * (v15 ^ HIWORD(v15))) ^ ((73244475 * (v15 ^ HIWORD(v15))) >> 16));
      unsigned int v17 = *((_DWORD *)result + 3);
      unsigned int v18 = (v16 ^ HIWORD(v16)) % v17;
      BOOL v19 = v9 >= v18;
      unsigned int v20 = v9 - v18;
      if (v19) {
        unsigned int v17 = 0;
      }
      unsigned int v21 = v17 + v20;
      if (v5 > v21)
      {
        if (v5 > *((unsigned __int16 *)result + 9))
        {
          if (v5 >= 0x10000) {
            _os_map_128_insert_no_rehash_cold_3();
          }
          *((_WORD *)result + 9) = v5;
        }
        *unsigned int v12 = a2;
        v12[1] = a3;
        a3 = v13;
        a2 = v14;
        *(void *)(v7 + 8 * v9) = a4;
        a4 = v11;
        unsigned int v5 = v21;
      }
    }
    ++v5;
    if (v9 + 1 < v4) {
      ++v9;
    }
    else {
      unsigned int v9 = 0;
    }
    if (!--v10) {
      goto LABEL_17;
    }
  }
  if (v5 > *((unsigned __int16 *)result + 9))
  {
    if (v5 >= 0x10000) {
      _os_map_128_insert_no_rehash_cold_2();
    }
    *((_WORD *)result + 9) = v5;
  }
  unsigned int v22 = (void *)(v6 + 16 * v9);
  *unsigned int v22 = a2;
  v22[1] = a3;
  *(void *)(v7 + 8 * v9) = a4;
  ++*((_DWORD *)result + 2);
  return result;
}

void os_set_str_ptr_init_cold_1()
{
  __assert_rtn("_os_set_str_ptr_alloc_data", "collections_set.in.c", 45, "result != NULL");
}

void os_set_str_ptr_init_cold_2()
{
}

void os_set_str_ptr_insert_cold_1()
{
  __assert_rtn("_common_os_set_str_ptr_insert", "collections_common.in.c", 414, "val != NULL");
}

void os_set_32_ptr_init_cold_1()
{
  __assert_rtn("_os_set_32_ptr_alloc_data", "collections_set.in.c", 45, "result != NULL");
}

void os_set_32_ptr_init_cold_2()
{
}

void os_set_32_ptr_insert_cold_1()
{
  __assert_rtn("_common_os_set_32_ptr_insert", "collections_common.in.c", 414, "val != NULL");
}

void os_set_32_ptr_find_cold_1()
{
  __assert_rtn("_os_set_32_ptr_find_helper", "collections_common.in.c", 312, "loop_limit-- != 0");
}

void os_set_64_ptr_init_cold_1()
{
  __assert_rtn("_os_set_64_ptr_alloc_data", "collections_set.in.c", 45, "result != NULL");
}

void os_set_64_ptr_init_cold_2()
{
}

void os_set_64_ptr_insert_cold_1()
{
  __assert_rtn("_common_os_set_64_ptr_insert", "collections_common.in.c", 414, "val != NULL");
}

void os_set_64_ptr_find_cold_1()
{
  __assert_rtn("_os_set_64_ptr_find_helper", "collections_common.in.c", 312, "loop_limit-- != 0");
}

void _os_set_str_ptr_insert_no_rehash_cold_2()
{
  __assert_rtn("_os_set_str_ptr_insert_no_rehash", "collections_common.in.c", 234, "bucket_offset <= UINT16_MAX");
}

void _os_set_str_ptr_insert_no_rehash_cold_3()
{
  __assert_rtn("_os_set_str_ptr_swap_if_needed", "collections_common.in.c", 190, "*bucket_offset <= UINT16_MAX");
}

void _os_set_32_ptr_insert_no_rehash_cold_2()
{
  __assert_rtn("_os_set_32_ptr_insert_no_rehash", "collections_common.in.c", 234, "bucket_offset <= UINT16_MAX");
}

void _os_set_32_ptr_insert_no_rehash_cold_3()
{
  __assert_rtn("_os_set_32_ptr_swap_if_needed", "collections_common.in.c", 190, "*bucket_offset <= UINT16_MAX");
}

void _os_set_64_ptr_insert_no_rehash_cold_2()
{
  __assert_rtn("_os_set_64_ptr_insert_no_rehash", "collections_common.in.c", 234, "bucket_offset <= UINT16_MAX");
}

void _os_set_64_ptr_insert_no_rehash_cold_3()
{
  __assert_rtn("_os_set_64_ptr_swap_if_needed", "collections_common.in.c", 190, "*bucket_offset <= UINT16_MAX");
}

void os_map_str_init_cold_1()
{
  __assert_rtn("_os_map_str_alloc_data", "collections_map.in.c", 46, "result != NULL");
}

void os_map_str_init_cold_2()
{
}

void os_map_str_insert_cold_1()
{
  __assert_rtn("_common_os_map_str_insert", "collections_common.in.c", 414, "val != NULL");
}

void os_map_32_init_cold_1()
{
  __assert_rtn("_os_map_32_alloc_data", "collections_map.in.c", 46, "result != NULL");
}

void os_map_32_init_cold_2()
{
}

void os_map_32_insert_cold_1()
{
  __assert_rtn("_common_os_map_32_insert", "collections_common.in.c", 414, "val != NULL");
}

void os_map_32_find_cold_1()
{
  __assert_rtn("_os_map_32_find_helper", "collections_common.in.c", 312, "loop_limit-- != 0");
}

void os_map_64_init_cold_1()
{
  __assert_rtn("_os_map_64_alloc_data", "collections_map.in.c", 46, "result != NULL");
}

void os_map_64_init_cold_2()
{
}

void os_map_64_insert_cold_1()
{
  __assert_rtn("_common_os_map_64_insert", "collections_common.in.c", 414, "val != NULL");
}

void os_map_64_find_cold_1()
{
  __assert_rtn("_os_map_64_find_helper", "collections_common.in.c", 312, "loop_limit-- != 0");
}

void os_map_128_init_cold_1()
{
  __assert_rtn("_os_map_128_alloc_data", "collections_map.in.c", 46, "result != NULL");
}

void os_map_128_init_cold_2()
{
}

void os_map_128_insert_cold_1()
{
  __assert_rtn("_common_os_map_128_insert", "collections_common.in.c", 414, "val != NULL");
}

void os_map_128_find_cold_1()
{
  __assert_rtn("_os_map_128_find_helper", "collections_common.in.c", 312, "loop_limit-- != 0");
}

void _os_map_str_insert_no_rehash_cold_2()
{
  __assert_rtn("_os_map_str_insert_no_rehash", "collections_common.in.c", 234, "bucket_offset <= UINT16_MAX");
}

void _os_map_str_insert_no_rehash_cold_3()
{
  __assert_rtn("_os_map_str_swap_if_needed", "collections_common.in.c", 190, "*bucket_offset <= UINT16_MAX");
}

void _os_map_32_insert_no_rehash_cold_1()
{
  __assert_rtn("_os_map_32_insert_no_rehash", "collections_common.in.c", 219, "loop_limit-- != 0");
}

void _os_map_32_insert_no_rehash_cold_2()
{
  __assert_rtn("_os_map_32_insert_no_rehash", "collections_common.in.c", 234, "bucket_offset <= UINT16_MAX");
}

void _os_map_32_insert_no_rehash_cold_3()
{
  __assert_rtn("_os_map_32_swap_if_needed", "collections_common.in.c", 190, "*bucket_offset <= UINT16_MAX");
}

void _os_map_64_insert_no_rehash_cold_1()
{
  __assert_rtn("_os_map_64_insert_no_rehash", "collections_common.in.c", 219, "loop_limit-- != 0");
}

void _os_map_64_insert_no_rehash_cold_2()
{
  __assert_rtn("_os_map_64_insert_no_rehash", "collections_common.in.c", 234, "bucket_offset <= UINT16_MAX");
}

void _os_map_64_insert_no_rehash_cold_3()
{
  __assert_rtn("_os_map_64_swap_if_needed", "collections_common.in.c", 190, "*bucket_offset <= UINT16_MAX");
}

void _os_map_128_insert_no_rehash_cold_1()
{
  __assert_rtn("_os_map_128_insert_no_rehash", "collections_common.in.c", 219, "loop_limit-- != 0");
}

void _os_map_128_insert_no_rehash_cold_2()
{
  __assert_rtn("_os_map_128_insert_no_rehash", "collections_common.in.c", 234, "bucket_offset <= UINT16_MAX");
}

void _os_map_128_insert_no_rehash_cold_3()
{
  __assert_rtn("_os_map_128_swap_if_needed", "collections_common.in.c", 190, "*bucket_offset <= UINT16_MAX");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB00](count, size, type_id);
}