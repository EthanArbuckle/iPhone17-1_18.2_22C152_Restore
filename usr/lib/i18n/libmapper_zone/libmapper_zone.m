double _citrus_mapper_zone_mapper_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  int *v13;
  int *v14;
  _DWORD *v15;
  double result;
  int tok;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24[3];
  void v25[10];

  if (a7 >= 0x18)
  {
    v25[8] = v7;
    v25[9] = v8;
    v13 = (int *)malloc_type_malloc(0x1CuLL, 0x100004027586B93uLL);
    if (v13)
    {
      v14 = v13;
      *((void *)v13 + 1) = 0;
      v15 = v13 + 2;
      *(void *)v13 = 0;
      v13[6] = 0;
      *((void *)v13 + 2) = 0;
      v24[0] = a4;
      v24[1] = a5;
      v24[2] = 0;
      v25[0] = 0;
      v25[1] = 0;
      if (parse_zone(v24, v25, (unsigned int *)v13))
      {
LABEL_4:
        free(v14);
        return result;
      }
      tok = get_tok(v24, v25);
      v18 = tok;
      if (tok == 47)
      {
        *((void *)v14 + 1) = *(void *)v14;
        if (parse_zone(v24, v25, (unsigned int *)v14)) {
          goto LABEL_4;
        }
        if (get_tok(v24, v25) != 47) {
          goto LABEL_4;
        }
        if (get_tok(v24, v25) != 257) {
          goto LABEL_4;
        }
        v19 = HIDWORD(v25[0]);
        v14[6] = HIDWORD(v25[0]);
        if (v19 > 0x20) {
          goto LABEL_4;
        }
        tok = get_tok(v24, v25);
      }
      else
      {
        v14[6] = 32;
        *((void *)v14 + 1) = 0;
      }
      if (tok == 58)
      {
        LODWORD(v25[0]) = 1;
        if (get_tok(v24, v25) != 257) {
          goto LABEL_4;
        }
        v20 = HIDWORD(v25[0]);
        v14[4] = HIDWORD(v25[0]);
        if (v18 == 47)
        {
          v14[5] = v20;
          if (get_tok(v24, v25) != 47 || get_tok(v24, v25) != 257) {
            goto LABEL_4;
          }
          v14[4] = HIDWORD(v25[0]);
        }
        else
        {
          v14[5] = 0;
        }
        tok = get_tok(v24, v25);
      }
      if (tok != -1) {
        goto LABEL_4;
      }
      v21 = v14[6];
      v22 = v21 == 32 ? 0 : 1 << v21;
      if (check_rowcol(v14, v14[4], v22)) {
        goto LABEL_4;
      }
      v23 = v21 ? 1 << -(char)v21 : 0;
      if (check_rowcol(v15, v14[5], v23)) {
        goto LABEL_4;
      }
      *(void *)(a2 + 8) = v14;
      *(void *)(a6 + 16) = 1;
      result = 0.0;
      *(_OWORD *)a6 = xmmword_263654F80;
    }
    else
    {
      __error();
    }
  }
  return result;
}

uint64_t _citrus_mapper_zone_mapper_convert(uint64_t a1, uint64_t *a2)
{
  v2 = (int *)a2[2];
  if (*v2 < 1) {
    return 0;
  }
  uint64_t v3 = 0;
  v4 = *(unsigned int **)(a1 + 8);
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  int v7 = *(_DWORD *)(a1 + 64);
  while (1)
  {
    unsigned int v8 = v4[6];
    unsigned int v9 = *(_DWORD *)(v6 + 4 * v3);
    if (v8 != 32) {
      break;
    }
    if (v9 < *v4 || v9 > v4[1]) {
      goto LABEL_14;
    }
    int v10 = v4[4] + v9;
LABEL_12:
    *(_DWORD *)(v5 + 4 * v3++) = v10;
    if (v3 >= *v2) {
      return 0;
    }
  }
  unsigned int v11 = v9 >> v8;
  if (v9 >> v8 >= v4[2] && v11 <= v4[3])
  {
    unsigned int v12 = v9 & ~(-1 << v8);
    if (v12 >= *v4 && v12 <= v4[1])
    {
      int v10 = ((v4[5] + v11) << v8) | (v4[4] + v12);
      goto LABEL_12;
    }
  }
LABEL_14:
  int *v2 = v3;
  return ((v7 & 3) << 29) | 1u;
}

uint64_t _citrus_mapper_zone_mapper_getops(_OWORD *a1)
{
  long long v1 = *(_OWORD *)&off_26BD2F308;
  *a1 = _citrus_mapper_zone_mapper_ops;
  a1[1] = v1;
  return 0;
}

uint64_t parse_zone(uint64_t *a1, _DWORD *a2, unsigned int *a3)
{
  if (get_tok(a1, a2) != 257) {
    return 0xFFFFFFFFLL;
  }
  *a3 = a2[1];
  if (get_tok(a1, a2) != 45 || get_tok(a1, a2) != 257) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = a2[1];
  a3[1] = v6;
  if (*a3 <= v6) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t get_tok(uint64_t *a1, _DWORD *a2)
{
  unint64_t v2 = a1[1];
  unint64_t v3 = a1[2];
  if (v3 >= v2)
  {
    BOOL v5 = 0;
    uint64_t v6 = 0xFFFFFFFFLL;
    goto LABEL_10;
  }
  uint64_t v4 = *a1;
  BOOL v5 = 1;
  while (1)
  {
    uint64_t v6 = *(unsigned __int8 *)(v4 + v3);
    if ((v6 - 9) >= 5 && v6 != 32) {
      break;
    }
    a1[2] = ++v3;
    BOOL v5 = v3 < v2;
    if (v2 == v3)
    {
      BOOL v5 = 0;
      uint64_t v6 = 0xFFFFFFFFLL;
      unint64_t v3 = v2;
      goto LABEL_10;
    }
  }
  if (*(unsigned char *)(v4 + v3))
  {
LABEL_10:
    if (*a2 == 1)
    {
      if ((v6 - 48) < 0xA || v6 == 43 || v6 == 45) {
        return get_imm(a1, (uint64_t)a2);
      }
      if (v6 == 47)
      {
        if (v5) {
          a1[2] = v3 + 1;
        }
        return 47;
      }
    }
    else if (!*a2)
    {
      if ((v6 - 48) >= 0xA)
      {
        uint64_t v7 = 256;
        if (v6 <= 0x3A && ((1 << v6) & 0x400A00000000000) != 0)
        {
          if (v5) {
            a1[2] = v3 + 1;
          }
          return v6;
        }
        return v7;
      }
      return get_imm(a1, (uint64_t)a2);
    }
    return 256;
  }
  return 0xFFFFFFFFLL;
}

uint64_t check_rowcol(_DWORD *a1, int a2, unsigned int a3)
{
  if (a3)
  {
    unsigned int v3 = a1[1];
    BOOL v4 = a3 >= v3;
    unsigned int v5 = a3 - v3;
    if (v5 == 0 || !v4) {
      return 0xFFFFFFFFLL;
    }
    if (a2 <= 0) {
      goto LABEL_12;
    }
  }
  else
  {
    if (a2 <= 0)
    {
LABEL_12:
      if (a2 < 0 && *a1 < -a2) {
        return 0xFFFFFFFFLL;
      }
      return 0;
    }
    int v6 = a1[1];
    if (v6) {
      unsigned int v5 = -v6;
    }
    else {
      unsigned int v5 = -1;
    }
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t get_imm(void *a1, uint64_t a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v5 = a1[1];
  unint64_t v6 = a1[2];
  while (1)
  {
    unint64_t v7 = v6;
    uint64_t v8 = v4;
LABEL_3:
    uint64_t v9 = v8;
    while (1)
    {
      if (v7 >= v5)
      {
        uint64_t v8 = 0xFFFFFFFFLL;
        if (v3)
        {
LABEL_15:
          if (v8 - 58 > 0xFFFFFFF5
            || (v8 & 0xDF) - 71 > 0xFFFFFFF9
            || v3 == 1 && v8 == 120)
          {
            goto LABEL_19;
          }
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v8 = *(unsigned __int8 *)(*a1 + v7);
        if (v3) {
          goto LABEL_15;
        }
      }
      if (v9 || v8 != 45 && v8 != 43) {
        break;
      }
      uint64_t v9 = v8;
      if (v7 < v5)
      {
        a1[2] = ++v7;
        goto LABEL_3;
      }
    }
    if (v8 - 58 < 0xFFFFFFF6) {
      break;
    }
    unint64_t v6 = v7;
    uint64_t v4 = v9;
LABEL_19:
    if (v7 >= v5)
    {
      char v10 = -1;
    }
    else
    {
      a1[2] = v6 + 1;
      char v10 = *(unsigned char *)(*a1 + v6++);
    }
    __str[v3++] = v10;
    if (v3 == 20)
    {
LABEL_23:
      LODWORD(v9) = v4;
      goto LABEL_25;
    }
  }
  LODWORD(v3) = 0;
LABEL_25:
  __endptr = 0;
  __str[v3] = 0;
  int v11 = strtoul(__str, &__endptr, 0);
  *(_DWORD *)(a2 + 4) = v11;
  if (__endptr - __str != v3) {
    return 256;
  }
  if (v9 == 45) {
    *(_DWORD *)(a2 + 4) = -v11;
  }
  return 257;
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}