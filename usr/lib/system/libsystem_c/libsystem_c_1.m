BOOL _UTF2_mbsinit(uint64_t a1)
{
  return !a1 || *(_DWORD *)(a1 + 4) == 0;
}

uint64_t _UTF2_mbsnrtowcs(int *a1, const char **a2, unint64_t a3, uint64_t a4, int *a5)
{
  unint64_t v6 = a3;
  int v16 = 0;
  v7 = *a2;
  if (a1)
  {
    uint64_t v8 = a4;
    v10 = a1;
    if (!a3 || !a4)
    {
      if (!a4)
      {
LABEL_20:
        *a2 = v7;
        return v8;
      }
      goto LABEL_12;
    }
    if (a5[1] < 1 || *v7 < 1)
    {
LABEL_12:
      uint64_t v11 = 0;
      uint64_t v12 = -a4;
      while (1)
      {
        if (v6 && *v7 >= 1)
        {
          int *v10 = *(unsigned __int8 *)v7;
          uint64_t v13 = 1;
        }
        else
        {
          uint64_t v13 = _UTF2_mbrtowc(v10, v7, v6, a5);
          switch(v13)
          {
            case -2:
              *a2 = &v7[v6];
              return -v11;
            case 0:
              *a2 = 0;
              return -v11;
            case -1:
              *a2 = v7;
              return -1;
          }
        }
        v7 += v13;
        v6 -= v13;
        ++v10;
        if (v12 == --v11) {
          goto LABEL_20;
        }
      }
    }
LABEL_10:
    *__error() = 92;
    return -1;
  }
  if (a3 && a5[1] >= 1 && *v7 >= 1) {
    goto LABEL_10;
  }
  uint64_t v8 = 0;
  if (!a3) {
    goto LABEL_24;
  }
LABEL_22:
  if (*v7 > 0)
  {
    uint64_t v14 = 1;
    goto LABEL_27;
  }
LABEL_24:
  while (1)
  {
    uint64_t v14 = _UTF2_mbrtowc(&v16, v7, v6, a5);
    switch(v14)
    {
      case -2:
        return v8;
      case -1:
        return -1;
      case 0:
        return v8;
    }
LABEL_27:
    v7 += v14;
    v6 -= v14;
    ++v8;
    if (v6) {
      goto LABEL_22;
    }
  }
}

uint64_t _UTF2_wcsnrtombs(unsigned char *a1, unsigned int **a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (*(_DWORD *)(a5 + 4))
  {
    *__error() = 22;
    return -1;
  }
  else
  {
    v9 = a1;
    v10 = *a2;
    uint64_t v5 = 0;
    if (a1)
    {
      unint64_t v11 = a4;
      if (a4)
      {
        while (a3)
        {
          unsigned int v12 = *v10;
          if (*v10 > 0x7F)
          {
            if (v11 < 4)
            {
              unint64_t v14 = _UTF2_wcrtomb(path, v12, a5);
              if (v14 == -1)
              {
LABEL_30:
                *a2 = v10;
                return -1;
              }
              uint64_t v13 = v14;
              if (v14 > v11) {
                break;
              }
              j__mkdtempat_np((int)v9, path);
            }
            else
            {
              uint64_t v13 = _UTF2_wcrtomb(v9, v12, a5);
              if (v13 == -1) {
                goto LABEL_30;
              }
            }
          }
          else
          {
            unsigned char *v9 = v12;
            uint64_t v13 = 1;
          }
          if (!*v10)
          {
            *a2 = 0;
            uint64_t v17 = v5 + v13;
            return v17 - 1;
          }
          ++v10;
          v9 += v13;
          v5 += v13;
          --a3;
          v11 -= v13;
          if (!v11) {
            break;
          }
        }
      }
      *a2 = v10;
    }
    else
    {
      while (a3)
      {
        unsigned int v15 = *v10;
        if (*v10 >= 0x80)
        {
          uint64_t v16 = _UTF2_wcrtomb(path, v15, a5);
          if (v16 == -1) {
            return -1;
          }
          if (!*v10)
          {
LABEL_27:
            uint64_t v17 = v5 + v16;
            return v17 - 1;
          }
        }
        else
        {
          uint64_t v16 = 1;
          if (!v15) {
            goto LABEL_27;
          }
        }
        ++v10;
        v5 += v16;
        --a3;
      }
    }
  }
  return v5;
}

uint64_t a64l(const char *a1)
{
  if (a1)
  {
    char v1 = *a1;
    if (*a1)
    {
      uint64_t v2 = 0;
      int v3 = 0;
      int v4 = 0;
      do
      {
        int v5 = -46;
        if ((v1 & 0xFE) != 0x2E && (v1 - 48) >= 0xAu)
        {
          if ((v1 - 65) >= 0x1A)
          {
            if ((v1 - 97) >= 0x1A) {
              goto LABEL_16;
            }
            int v5 = -59;
          }
          else
          {
            int v5 = -53;
          }
        }
        v4 |= (v5 + v1) << v3;
        v3 += 6;
        char v1 = a1[v2 + 1];
        if (v1) {
          BOOL v6 = v2 >= 5;
        }
        else {
          BOOL v6 = 1;
        }
        ++v2;
      }
      while (!v6);
      return v4;
    }
    else
    {
      return 0;
    }
  }
  else
  {
LABEL_16:
    *__error() = 22;
    return -1;
  }
}

void _Exit(int a1)
{
}

long double abs(long double __lcpp_x)
{
  return __lcpp_x;
}

int atoi_l(const char *a1, locale_t a2)
{
  return strtol_l(a1, 0, 10, a2);
}

uint64_t atol_l(const char *a1, locale_t a2)
{
  return strtol_l(a1, 0, 10, a2);
}

uint64_t atoll_l(const char *a1, locale_t a2)
{
  return strtoll_l(a1, 0, 10, a2);
}

void __environ_lock_fork_child()
{
  __environ_lock_obj = 0;
}

unsigned char *_getenvp(unsigned char *a1, char **a2)
{
  os_unfair_lock_lock_with_options();
  int v4 = __findenv_locked(a1, &v6, *a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&__environ_lock_obj);
  return v4;
}

int getopt(int a1, char *const a2[], const char *a3)
{
  if (!optreset)
  {
    uint64_t v9 = *getopt_place;
    if (*getopt_place)
    {
      v7 = ++getopt_place;
      optopt = v9;
LABEL_12:
      if (v9 == 58) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }
  }
  optreset = 0;
  if (optind < a1 && (int v6 = a2[optind], *v6 == 45))
  {
    v7 = v6 + 2;
    getopt_place = v6 + 2;
    int v8 = v6[1];
    uint64_t v9 = (char)v8;
    optopt = (char)v8;
    if (v8)
    {
      if (v8 != 45) {
        goto LABEL_12;
      }
      if (*v7)
      {
        uint64_t v9 = 45;
        goto LABEL_16;
      }
      ++optind;
      getopt_place = &EMSG;
    }
    else
    {
      getopt_place = &EMSG;
      uint64_t v9 = 45;
      if (j__strncasecmp(a3, (const char *)0x2D, (size_t)a3))
      {
        optopt = 45;
        v7 = &EMSG;
LABEL_16:
        uint64_t v10 = j__strncasecmp(a3, (const char *)v9, (size_t)a3);
        if (v10)
        {
          if (*(unsigned char *)(v10 + 1) == 58)
          {
            if (!*v7)
            {
              if (*(unsigned char *)(v10 + 2) == 58)
              {
                v7 = 0;
              }
              else
              {
                int v11 = optind;
                int v12 = optind + 1;
                optind = v12;
                if (v12 >= a1)
                {
                  optind = v11 + 2;
                  optarg = 0;
                  getopt_place = &EMSG;
                  if (*a3 == 58)
                  {
                    LODWORD(v9) = 58;
                    return v9;
                  }
                  if (opterr) {
                    fprintf(__stderrp, "%s: option requires an argument -- %c\n");
                  }
                  goto LABEL_26;
                }
                v7 = a2[v12];
              }
            }
            optarg = v7;
            getopt_place = &EMSG;
          }
          else
          {
            optarg = 0;
            if (*v7) {
              return v9;
            }
          }
          ++optind;
          return v9;
        }
LABEL_21:
        if (!*v7) {
          ++optind;
        }
        if (opterr && *a3 != 58) {
          fprintf(__stderrp, "%s: illegal option -- %c\n");
        }
LABEL_26:
        LODWORD(v9) = 63;
        return v9;
      }
    }
  }
  else
  {
    getopt_place = &EMSG;
  }
  LODWORD(v9) = -1;
  return v9;
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return getopt_internal(*(uint64_t *)&a1, (uint64_t)a2, (size_t)a3, a4, a5, 1u);
}

uint64_t permute_args(uint64_t result, int a2, int a3, uint64_t a4)
{
  int v4 = (a2 - (int)result) % (a3 - a2);
  if (v4)
  {
    int v5 = a3 - a2;
    do
    {
      int v6 = v4;
      int v4 = v5 % v4;
      int v5 = v6;
    }
    while (v4);
  }
  else
  {
    int v6 = a3 - a2;
  }
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    int v8 = result - a2;
    uint64_t v9 = v6;
    int v10 = (a3 - (int)result) / v6;
    do
    {
      if (v10 >= 1)
      {
        uint64_t v11 = *(void *)(a4 + 8 * (v7 + a2));
        int v12 = v10;
        int v13 = v7 + a2;
        do
        {
          if (v13 >= a2) {
            int v14 = v8;
          }
          else {
            int v14 = a3 - a2;
          }
          v13 += v14;
          result = *(void *)(a4 + 8 * v13);
          *(void *)(a4 + 8 * v13) = v11;
          *(void *)(a4 + 8 * (v7 + a2)) = result;
          uint64_t v11 = result;
          --v12;
        }
        while (v12);
      }
      ++v7;
    }
    while (v7 != v9);
  }
  return result;
}

uint64_t parse_long_options(uint64_t a1, unsigned char *a2, void *a3, int *a4, int a5, char a6)
{
  uint64_t v9 = place;
  if (dash_prefix > 2) {
    int v10 = "";
  }
  else {
    int v10 = off_1E543F0A0[dash_prefix];
  }
  int v11 = optind++;
  int v12 = optind;
  uint64_t v13 = j__strncasecmp(place, (const char *)0x3D, (size_t)a3);
  int v45 = v12;
  if (v13)
  {
    size_t v18 = v13 - (void)v9;
    v49 = (char *)(v13 + 1);
  }
  else
  {
    size_t v18 = j__strsignal_r((int)v9, v14, v15);
    v49 = 0;
  }
  v19 = (const char *)*a3;
  if (!*a3)
  {
LABEL_40:
    if (a5)
    {
      optind = v11;
      return 0xFFFFFFFFLL;
    }
    if (opterr && *a2 != 58) {
LABEL_45:
    }
    optopt = 0;
    return 63;
  }
  int v43 = v11;
  v44 = v10;
  v48 = a2;
  int v20 = 0;
  int v21 = 0;
  if (a5) {
    BOOL v22 = v18 == 1;
  }
  else {
    BOOL v22 = 0;
  }
  char v23 = v22;
  v24 = a3 + 4;
  int v25 = -1;
  do
  {
    if (!j__strsvisx(v9, v19, v18, v16, v17))
    {
      if (j__strsignal_r((int)v19, v26, v27) == v18)
      {
        int v25 = v20;
        a2 = v48;
        v30 = v44;
        goto LABEL_32;
      }
      if ((v23 & 1) == 0)
      {
        if (v25 == -1)
        {
          int v25 = v20;
        }
        else if ((a6 & 4) != 0 {
               || (v28 = &a3[4 * v25], *((_DWORD *)v24 - 6) != *((_DWORD *)v28 + 2))
        }
               || *(v24 - 2) != v28[2]
               || *((_DWORD *)v24 - 2) != LODWORD(a3[4 * v25 + 3]))
        {
          int v21 = 1;
        }
      }
    }
    v29 = (const char *)*v24;
    v24 += 4;
    v19 = v29;
    ++v20;
  }
  while (v29);
  if (v21)
  {
    if (opterr)
    {
      if (*v48 != 58) {
    }
      }
    goto LABEL_45;
  }
  a2 = v48;
  v30 = v44;
  int v11 = v43;
  if (v25 == -1) {
    goto LABEL_40;
  }
LABEL_32:
  v31 = &a3[4 * v25];
  int v34 = *((_DWORD *)v31 + 2);
  v32 = (int *)(v31 + 1);
  int v33 = v34;
  if (v34) {
    BOOL v35 = 1;
  }
  else {
    BOOL v35 = v49 == 0;
  }
  if (!v35)
  {
    if (opterr && *a2 != 58) {
    v37 = &a3[4 * v25];
    }
    if (v37[2]) {
      int v38 = 0;
    }
    else {
      int v38 = *((_DWORD *)v37 + 6);
    }
    optopt = v38;
    return 63;
  }
  if ((v33 - 1) > 1) {
    goto LABEL_64;
  }
  if (v49)
  {
    optarg = v49;
  }
  else
  {
    if (v33 != 1) {
      goto LABEL_64;
    }
    optind = v43 + 2;
    optarg = *(char **)(a1 + 8 * v45);
    int v33 = *v32;
  }
  if (v33 == 1 && !optarg)
  {
    if (opterr && *a2 != 58) {
    v39 = &a3[4 * v25];
    }
    if (v39[2]) {
      int v40 = 0;
    }
    else {
      int v40 = *((_DWORD *)v39 + 6);
    }
    optopt = v40;
    --optind;
    if (*a2 == 58) {
      return 58;
    }
    else {
      return 63;
    }
  }
LABEL_64:
  if (a4) {
    *a4 = v25;
  }
  v41 = &a3[4 * v25];
  v42 = (_DWORD *)v41[2];
  uint64_t result = *((unsigned int *)v41 + 6);
  if (v42)
  {
    _DWORD *v42 = result;
    return 0;
  }
  return result;
}

int getsubopt(char **a1, char *const *a2, char **a3)
{
  *a3 = 0;
  suboptarg = 0;
  if (!a1) {
    goto LABEL_32;
  }
  int v4 = *a1;
  if (!*a1) {
    goto LABEL_32;
  }
  while (1)
  {
    unsigned int v5 = *v4;
    if (v5 <= 0x1F) {
      break;
    }
    if (v5 != 44 && v5 != 32) {
      goto LABEL_11;
    }
LABEL_8:
    ++v4;
  }
  if (v5 == 9) {
    goto LABEL_8;
  }
  if (!*v4)
  {
    *a1 = v4;
    goto LABEL_32;
  }
LABEL_11:
  suboptarg = v4;
  int v6 = v4 + 1;
  do
  {
    while (1)
    {
      int v8 = *v6++;
      int v7 = v8;
      if (v8 <= 31) {
        break;
      }
      if (v7 == 32 || v7 == 44) {
        goto LABEL_19;
      }
      if (v7 == 61)
      {
        *(v6 - 1) = 0;
        *a3 = v6;
        for (i = v6; ; ++i)
        {
          unsigned int v10 = *i;
          if (v10 > 0x1F)
          {
            if (v10 == 32 || v10 == 44) {
              goto LABEL_34;
            }
          }
          else
          {
            if (!*i) {
              goto LABEL_36;
            }
            if (v10 == 9)
            {
LABEL_34:
              int v6 = i + 1;
              goto LABEL_35;
            }
          }
        }
      }
    }
    if (!v7)
    {
      i = v6 - 1;
      goto LABEL_28;
    }
  }
  while (v7 != 9);
LABEL_19:
  i = v6 - 1;
LABEL_35:
  char *i = 0;
  i = v6;
LABEL_36:
  while (1)
  {
    unsigned int v16 = *i;
    BOOL v17 = v16 > 0x2C;
    uint64_t v18 = (1 << v16) & 0x100100000200;
    if (v17 || v18 == 0) {
      break;
    }
    ++i;
  }
LABEL_28:
  *a1 = i;
  int v11 = *a2;
  if (!*a2)
  {
LABEL_32:
    LODWORD(v12) = -1;
    return v12;
  }
  uint64_t v12 = 0;
  uint64_t v13 = suboptarg;
  int v14 = a2 + 1;
  while (j__strncasecmp_l(v13, v11, (size_t)a3, v3))
  {
    int v11 = v14[v12++];
    if (!v11) {
      goto LABEL_32;
    }
  }
  return v12;
}

int hcreate(size_t a1)
{
  if (htable)
  {
    char v1 = __error();
    int result = 0;
    int v3 = 22;
LABEL_3:
    *char v1 = v3;
    return result;
  }
  size_t v4 = 16;
  if (a1 > 0x10) {
    size_t v4 = a1;
  }
  if (v4 >= 0x400000000000000) {
    size_t v4 = 0x400000000000000;
  }
  if ((v4 & (v4 - 1)) != 0)
  {
    char v5 = -1;
    do
    {
      ++v5;
      BOOL v6 = v4 > 1;
      v4 >>= 1;
    }
    while (v6);
    size_t v4 = 2 << v5;
  }
  htablesize = v4;
  htable = (uint64_t)malloc_type_malloc(8 * v4, 0x2004093837F09uLL);
  if (!htable)
  {
    char v1 = __error();
    int result = 0;
    int v3 = 12;
    goto LABEL_3;
  }
  if (htablesize) {
    MEMORY[0x18C122530]();
  }
  return 1;
}

void hdestroy_0(void)
{
  v0 = (void *)htable;
  if (htable)
  {
    unint64_t v1 = htablesize;
    if (htablesize)
    {
      unint64_t v2 = 0;
      do
      {
        int v3 = (void *)v0[v2];
        if (v3)
        {
          do
          {
            size_t v4 = (void *)v3[1];
            v0[v2] = *v3;
            free(v4);
            free(v3);
            int v3 = (void *)v0[v2];
          }
          while (v3);
          unint64_t v1 = htablesize;
        }
        ++v2;
      }
      while (v2 < v1);
    }
    free(v0);
    htable = 0;
  }
}

ENTRY *__cdecl hsearch(ENTRY a1, ACTION a2)
{
  data = (char *)a1.data;
  key = (unsigned __int8 *)a1.key;
  uint64_t v5 = j__strsignal_r((int)a1.key, (char *)a1.data, *(size_t *)&a2);
  int v8 = (char **)(htable
               + 8
               * ((htablesize - 1) & ((unsigned int (*)(unsigned __int8 *, uint64_t))__default_hash[0])(key, v5)));
  uint64_t v9 = v8;
  while (1)
  {
    uint64_t v9 = (char **)*v9;
    if (!v9) {
      break;
    }
    if (!j__strncasecmp_l(v9[1], (const char *)key, v6, v7)) {
      return (ENTRY *)(v9 + 1);
    }
  }
  if (a2 == FIND) {
    return 0;
  }
  int result = (ENTRY *)malloc_type_malloc(0x18uLL, 0xB00404D7CA56CuLL);
  if (result)
  {
    int v11 = result;
    result->data = key;
    int result = (ENTRY *)((char *)result + 8);
    v11[1].key = data;
    v11->key = *v8;
    *int v8 = (char *)v11;
  }
  return result;
}

intmax_t imaxabs(intmax_t j)
{
  if (j < 0) {
    return -j;
  }
  return j;
}

imaxdiv_t imaxdiv(intmax_t __numer, intmax_t __denom)
{
  intmax_t v2 = __numer / __denom;
  uint64_t v3 = (__numer >= 0) & (__numer % __denom < 0);
  if (__numer >= 0 && __numer % __denom < 0) {
    intmax_t v4 = __denom;
  }
  else {
    intmax_t v4 = 0;
  }
  intmax_t v5 = __numer % __denom - v4;
  intmax_t v6 = v2 + v3;
  result.rem = v5;
  result.quot = v6;
  return result;
}

void insque(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)a2;
    if (*(void *)a2) {
      *(void *)(v2 + 8) = a1;
    }
    *(void *)a2 = a1;
    *(void *)a1 = v2;
    *((void *)a1 + 1) = a2;
  }
  else
  {
    *(void *)a1 = 0;
    *((void *)a1 + 1) = 0;
  }
}

uint64_t labs(uint64_t result)
{
  if (result < 0) {
    return -result;
  }
  return result;
}

uint64_t llabs(uint64_t result)
{
  if (result < 0) {
    return -result;
  }
  return result;
}

void *__cdecl lsearch(const void *a1, void *a2, size_t *a3, size_t a4, int (__cdecl *a5)(const void *, const void *))
{
  int64_t v8 = *a3 * a4;
  uint64_t v9 = (char *)a2 + v8;
  if (v8 < 1)
  {
LABEL_5:
    j__mkdtempat_np((int)v9, (char *)a1);
    ++*a3;
    return v9;
  }
  else
  {
    int v11 = (char *)a2;
    while (((unsigned int (*)(const void *, char *))a5)(a1, v11))
    {
      v11 += a4;
      if (v11 >= v9) {
        goto LABEL_5;
      }
    }
  }
  return v11;
}

void *__cdecl lfind(const void *a1, const void *a2, size_t *a3, size_t a4, int (__cdecl *a5)(const void *, const void *))
{
  int64_t v5 = *a3 * a4;
  if (v5 < 1) {
    return 0;
  }
  int64_t v8 = (char *)a2;
  unsigned int v10 = (char *)a2 + v5;
  while (((unsigned int (*)(const void *, char *))a5)(a1, v8))
  {
    v8 += a4;
    if (v8 >= v10) {
      return 0;
    }
  }
  return v8;
}

uint64_t _putenvp(char *a1, char **a2, uint64_t a3)
{
  environ_lock_np();
  if (__init__env_owned_locked(1))
  {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  else
  {
    if (a3) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = __env_owned;
    }
    uint64_t v6 = __setenv_locked(a1, 0, 1, 0, a2, v7);
  }
  environ_unlock_np();
  return v6;
}

int putenv(char *a1)
{
  if (!a1 || !*a1 || !j__inet_lnaof((in_addr)a1))
  {
    *__error() = 22;
    return -1;
  }
  environ_lock_np();
  if (__init__env_owned_locked(1))
  {
    environ_unlock_np();
    return -1;
  }
  uint64_t v3 = (char **)_NSGetEnviron();
  int v4 = __setenv_locked(a1, 0, 1, 0, v3, __env_owned);
  environ_unlock_np();
  return v4;
}

int radixsort(const unsigned __int8 **__base, int __nel, const unsigned __int8 *__table, unsigned int __endbyte)
{
  if (!__table)
  {
    if (__endbyte)
    {
      uint64_t v7 = 0;
      uint64_t v8 = __endbyte;
      do
      {
        v10[v7] = v7 + 1;
        ++v7;
      }
      while (__endbyte != v7);
      int v4 = v10;
      v10[__endbyte] = 0;
      if (__endbyte > 0xFE) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v8 = 0;
      v10[0] = 0;
    }
    uint64_t v9 = v8 + 1;
    do
    {
      int v4 = v10;
      v10[v9] = v9;
      ++v9;
    }
    while (v9 != 256);
LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  int v4 = __table;
  uint64_t v5 = __table[__endbyte];
  if ((v5 - 1) <= 0xFD)
  {
    *__error() = 22;
    return -1;
  }
LABEL_13:
  r_sort_a(__base, *(void *)&__nel, 0, v4, v5);
  return 0;
}

#error "18A9E6F9C: call analysis failed (funcsize=258)"

int sradixsort(const unsigned __int8 **__base, int __nel, const unsigned __int8 *__table, unsigned int __endbyte)
{
  uint64_t v4 = *(void *)&__nel;
  if (!__table)
  {
    if (__endbyte)
    {
      uint64_t v8 = 0;
      uint64_t v9 = __endbyte;
      do
      {
        v26[v8] = v8 + 1;
        ++v8;
      }
      while (__endbyte != v8);
      uint64_t v6 = v26;
      v26[__endbyte] = 0;
      if (__endbyte > 0xFE) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v9 = 0;
      v26[0] = 0;
    }
    uint64_t v10 = v9 + 1;
    do
    {
      uint64_t v6 = v26;
      v26[v10] = v10;
      ++v10;
    }
    while (v10 != 256);
LABEL_12:
    uint64_t v7 = 0;
LABEL_13:
    if (__nel > 19)
    {
      char v23 = malloc_type_malloc(8 * __nel, 0x80040B8603338uLL);
      if (!v23) {
        return -1;
      }
      v24 = v23;
      r_sort_b(__base, v23, v4, 0, v6, v7);
      free(v24);
    }
    else if (__nel >= 2)
    {
      int v11 = __base;
      do
      {
        if (++v11 > __base)
        {
          uint64_t v12 = *v11;
          uint64_t v13 = (uint64_t)(*v11 + 1);
          int v14 = v11;
          unint64_t v15 = (unint64_t)v11;
          do
          {
            BOOL v17 = *(unsigned __int8 **)(v15 - 8);
            v15 -= 8;
            unsigned int v16 = v17;
            unsigned int v18 = v6[*v12];
            if (v7 == v18)
            {
              v19 = v16;
            }
            else
            {
              int v20 = (unsigned __int8 *)v13;
              v19 = v16;
              do
              {
                if (v18 != v6[*v19]) {
                  break;
                }
                ++v19;
                int v21 = *v20++;
                unsigned int v18 = v6[v21];
              }
              while (v7 != v18);
            }
            if (v18 >= v6[*v19]) {
              break;
            }
            *(v14 - 1) = v12;
            *int v14 = v16;
            int v14 = (void *)v15;
          }
          while (v15 > (unint64_t)__base);
        }
        BOOL v22 = (int)v4 <= 2;
        LODWORD(v4) = v4 - 1;
      }
      while (!v22);
    }
    return 0;
  }
  uint64_t v6 = __table;
  uint64_t v7 = __table[__endbyte];
  if ((v7 - 1) > 0xFD) {
    goto LABEL_13;
  }
  *__error() = 22;
  return -1;
}

#error "18A9E73D4: call analysis failed (funcsize=227)"

void *r_sort_count_allocate()
{
  r_sort_a_count = (uint64_t)malloc_type_calloc(0x100uLL, 4uLL, 0x100004052888210uLL);
  imaxdiv_t result = malloc_type_calloc(0x100uLL, 4uLL, 0x100004052888210uLL);
  r_sort_b_count = (uint64_t)result;
  return result;
}

void sranddev(void)
{
  if ((open_NOCANCEL() & 0x80000000) != 0 || (uint64_t NOCANCEL = read_NOCANCEL(), close_NOCANCEL(), NOCANCEL != 8))
  {
    v1.tv_sec = 0;
    *(void *)&v1.tv_usec = 0;
    gettimeofday(&v1, 0);
    next = LODWORD(v1.tv_sec) ^ (getpid() << 16) ^ v1.tv_usec;
  }
}

void srandom(unsigned int a1)
{
  timeval v1 = state;
  *state = a1;
  if (!rand_type)
  {
    int v7 = 50;
    do
    {
LABEL_13:
      random();
      --v7;
    }
    while (v7);
    return;
  }
  int v2 = rand_deg;
  if (rand_deg > 1)
  {
    uint64_t v3 = (unsigned int *)(v1 + 1);
    uint64_t v4 = rand_deg - 1;
    do
    {
      if (a1) {
        signed int v5 = a1;
      }
      else {
        signed int v5 = 123459876;
      }
      signed int v6 = 16807 * (v5 % 127773) - 2836 * (v5 / 127773);
      a1 = v6 + 0x7FFFFFFF;
      if (v6 >= 0) {
        a1 = v6;
      }
      *v3++ = a1;
      --v4;
    }
    while (v4);
  }
  fptr = &v1[rand_sep];
  rptr[0] = v1;
  if (v2 >= 1)
  {
    int v7 = 10 * v2;
    goto LABEL_13;
  }
}

char *__cdecl initstate(unsigned int a1, char *a2, size_t a3)
{
  signed int v5 = (char *)(state - 1);
  if (rand_type) {
    int v6 = 5 * ((unint64_t)((char *)rptr[0] - (char *)state) >> 2) + rand_type;
  }
  else {
    int v6 = 0;
  }
  *(_DWORD *)signed int v5 = v6;
  if (a3 > 7)
  {
    if (a3 >= 0x20)
    {
      int v9 = 3;
      if (a3 >= 0x40)
      {
        if (a3 < 0x100) {
          int v11 = 3;
        }
        else {
          int v11 = 4;
        }
        uint64_t v12 = 63;
        if (a3 >= 0x100) {
          int v13 = 63;
        }
        else {
          int v13 = 31;
        }
        if (a3 >= 0x100) {
          int v9 = 1;
        }
        else {
          int v9 = 3;
        }
        if (a3 < 0x100) {
          uint64_t v12 = 31;
        }
        if (a3 >= 0x80) {
          int v7 = v11;
        }
        else {
          int v7 = 2;
        }
        if (a3 >= 0x80) {
          int v8 = v13;
        }
        else {
          int v8 = 15;
        }
        if (a3 >= 0x80)
        {
          uint64_t v10 = v12;
        }
        else
        {
          int v9 = 1;
          uint64_t v10 = 15;
        }
      }
      else
      {
        int v8 = 7;
        int v7 = 1;
        uint64_t v10 = 7;
      }
    }
    else
    {
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      uint64_t v10 = 0;
    }
    rand_type = v7;
    rand_deg = v8;
    rand_sep = v9;
    state = (int *)(a2 + 4);
    end_ptr = (uint64_t)&a2[4 * v10 + 4];
    srandom(a1);
    if (a3 >= 0x20) {
      int v14 = 5 * ((unint64_t)((char *)rptr[0] - (a2 + 4)) >> 2) + v7;
    }
    else {
      int v14 = 0;
    }
    *(_DWORD *)a2 = v14;
  }
  else
  {
    fprintf(__stderrp, "random: not enough state (%ld bytes); ignored.\n", a3);
    return 0;
  }
  return v5;
}

char *__cdecl setstate(const char *a1)
{
  unsigned int v2 = *(_DWORD *)a1 / 5u;
  unsigned int v3 = *(_DWORD *)a1 % 5u;
  imaxdiv_t result = (char *)(state - 1);
  if (rand_type) {
    int v5 = 5 * ((unint64_t)((char *)rptr[0] - (char *)state) >> 2) + rand_type;
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)imaxdiv_t result = v5;
  rand_type = v3;
  uint64_t v6 = degrees[v3];
  rand_deg = degrees[v3];
  int v7 = seps[v3];
  rand_sep = v7;
  int v8 = (int *)(a1 + 4);
  state = v8;
  if (v3)
  {
    rptr[0] = &v8[v2];
    fptr = &v8[(v7 + v2) % v6];
  }
  end_ptr = (uint64_t)&v8[v6];
  return result;
}

void remque(void *a1)
{
  uint64_t v2 = *(void *)a1;
  timeval v1 = (void *)*((void *)a1 + 1);
  if (v1) {
    *timeval v1 = v2;
  }
  if (v2) {
    *(void *)(v2 + 8) = v1;
  }
}

uint64_t _do_nothing()
{
  return 0;
}

uint64_t __init__env_owned_locked(int a1)
{
  if (__env_owned) {
    return 0;
  }
  if (a1) {
    int v3 = 0;
  }
  else {
    int v3 = *__error();
  }
  uint64_t v4 = _owned_ptr_alloc();
  __env_owned = (uint64_t)v4;
  if (v4) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = 0xFFFFFFFFLL;
  }
  if (!a1 && !v4)
  {
    *__error() = v3;
    return 0xFFFFFFFFLL;
  }
  return result;
}

char *_copyenv(void *a1)
{
  if (a1)
  {
    int v1 = (int)a1;
    if (*a1)
    {
      size_t v2 = 1;
      while (a1[v2++])
        ;
    }
    else
    {
      size_t v2 = 1;
    }
    uint64_t v6 = (char *)malloc_type_malloc(v2 * 8, 0x467D4C97uLL);
    int v5 = v6;
    if (v6) {
      j__mkostemp(v6, v1);
    }
  }
  else
  {
    uint64_t v4 = (char *)malloc_type_malloc(8uLL, 0x467D4C97uLL);
    int v5 = v4;
    if (v4) {
      *(void *)uint64_t v4 = 0;
    }
  }
  return v5;
}

uint64_t _deallocenvstate(void **a1)
{
  if (!a1 || (void **)__env_owned == a1)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  else
  {
    free(*a1);
    free(a1);
    return 0;
  }
}

uint64_t _setenvp(char *a1, unsigned __int8 *a2, int a3, char **a4, uint64_t a5)
{
  environ_lock_np();
  uint64_t v10 = (void *)__env_owned;
  if (__env_owned || (uint64_t v10 = _owned_ptr_alloc(), (__env_owned = (uint64_t)v10) != 0))
  {
    if (a5) {
      uint64_t v11 = a5;
    }
    else {
      uint64_t v11 = (uint64_t)v10;
    }
    uint64_t v12 = __setenv_locked(a1, a2, a3, 1, a4, v11);
  }
  else
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  environ_unlock_np();
  return v12;
}

uint64_t _unsetenvp(unsigned char *a1, char **a2, uint64_t a3)
{
  environ_lock_np();
  uint64_t v6 = (void *)__env_owned;
  if (__env_owned || (uint64_t v6 = _owned_ptr_alloc(), (__env_owned = (uint64_t)v6) != 0))
  {
    if (a3) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = (uint64_t)v6;
    }
    __unsetenv_locked(a1, *a2, v7);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  environ_unlock_np();
  return v8;
}

hash_table *__cdecl hash_create(int size)
{
  LODWORD(v1) = size;
  size_t v2 = (hash_table *)malloc_type_malloc(0x10uLL, 0x10800407411B482uLL);
  uint64_t result = 0;
  if ((v1 & 0x80000000) == 0 && v2)
  {
    if (v1) {
      uint64_t v1 = v1;
    }
    else {
      uint64_t v1 = 97;
    }
    uint64_t result = (hash_table *)malloc_type_malloc(8 * v1, 0x2004093837F09uLL);
    v2->buckets = (hash_node **)result;
    if (result)
    {
      for (uint64_t i = 0; i != v1; ++i)
        v2->buckets[i] = 0;
      v2->size = v1;
      return v2;
    }
  }
  return result;
}

void hash_destroy(hash_table *table, char *key, void (__cdecl *nukefunc)(char *, void *))
{
  int v6 = *key;
  if (*key)
  {
    unsigned int v7 = 0;
    uint64_t v8 = key + 1;
    do
    {
      v7 ^= v6 ^ (2 * v7);
      int v9 = *v8++;
      int v6 = v9;
    }
    while (v9);
  }
  else
  {
    unsigned int v7 = 0;
  }
  p_next = &table->buckets[v7 % table->size];
  uint64_t v11 = *p_next;
  if (*p_next)
  {
    if (j__strncasecmp_l(v11->key, key, (size_t)nukefunc, v3))
    {
      while (1)
      {
        int v14 = v11;
        uint64_t v11 = v11->next;
        if (!v11) {
          break;
        }
        if (!j__strncasecmp_l(v11->key, key, v12, v13))
        {
          p_next = &v14->next;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      *p_next = v11->next;
      if (nukefunc) {
        ((void (*)(char *, void *))nukefunc)(v11->key, v11->data);
      }
      free(v11);
    }
  }
}

void *__cdecl hash_search(hash_table *table, char *key, void *datum, void (__cdecl *replace_func)(void *))
{
  unsigned int size = table->size;
  int v9 = *key;
  if (*key)
  {
    unsigned int v10 = 0;
    uint64_t v11 = key + 1;
    do
    {
      v10 ^= v9 ^ (2 * v10);
      int v12 = *v11++;
      int v9 = v12;
    }
    while (v12);
  }
  else
  {
    unsigned int v10 = 0;
  }
  int v13 = v10 % size;
  int v14 = table->buckets[v10 % size];
  if (!v14)
  {
LABEL_9:
    if (datum)
    {
      data = (hash_node *)malloc_type_malloc(0x18uLL, 0xB0040E10B54BDuLL);
      if (!data) {
        return data;
      }
      uint64_t v18 = j__strsignal_r((int)key, v15, v16);
      v19 = (char *)malloc_type_malloc(v18 + 1, 0xE3A9D695uLL);
      data->key = v19;
      if (v19)
      {
        char *v19 = 0;
        strcat(data->key, key);
        data->data = datum;
        buckets = table->buckets;
        data->next = buckets[v13];
        buckets[v13] = data;
        return data;
      }
    }
    return 0;
  }
  while (j__strncasecmp_l(v14->key, key, (size_t)datum, (locale_t)replace_func))
  {
    int v14 = v14->next;
    if (!v14) {
      goto LABEL_9;
    }
  }
  data = (hash_node *)v14->data;
  if (replace_func)
  {
    ((void (*)(void *))replace_func)(v14->data);
    data = 0;
    v14->data = datum;
  }
  return data;
}

void hash_traverse(hash_table *table, int (__cdecl *func)(char *, void *, void *), void *arg)
{
  if (func)
  {
    uint64_t size = table->size;
    if ((int)size >= 1)
    {
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = table->buckets[v7];
        if (v8) {
          break;
        }
LABEL_7:
        if (++v7 == size) {
          return;
        }
      }
      while (((unsigned int (*)(char *, void *, void *))func)(v8->key, v8->data, arg))
      {
        uint64_t v8 = v8->next;
        if (!v8) {
          goto LABEL_7;
        }
      }
    }
  }
}

void hash_purge(hash_table *table, void (__cdecl *purge_func)(char *, void *))
{
  uint64_t size = table->size;
  if ((int)size >= 1)
  {
    for (uint64_t i = 0; i != size; ++i)
    {
      int v6 = table->buckets[i];
      if (v6)
      {
        do
        {
          if (purge_func) {
            ((void (*)(char *, void *))purge_func)(v6->key, v6->data);
          }
          next = v6->next;
          free(v6);
          int v6 = next;
        }
        while (next);
        table->buckets[i] = 0;
      }
    }
  }
}

uint64_t hash_stats(int *a1, int a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = malloc_type_malloc(4 * v3, 0x100004052888210uLL);
  if (!v4)
  {
    fwrite("malloc returns 0\n", 0x11uLL, 1uLL, __stderrp);
    exit(1);
  }
  uint64_t v18 = v3;
  if ((int)v3 <= 0)
  {
    putchar(10);
    return printf("%d element%s in storage.\n");
  }
  int v5 = v4;
  uint64_t v6 = 0;
  int v7 = 0;
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  do
  {
    int v19 = v7;
    int v20 = v8;
    uint64_t v11 = *(void *)(*((void *)a1 + 1) + 8 * v6);
    v5[v6] = 0;
    int v12 = 0;
    if (v11)
    {
      char v13 = 1;
      do
      {
        if (v13)
        {
          ++v9;
          if (a2)
          {
            printf("bucket %2d: ", v6);
LABEL_10:
            printf(" %s", *(const char **)v11);
            int v12 = v5[v6];
          }
        }
        else if (a2)
        {
          goto LABEL_10;
        }
        char v13 = 0;
        v5[v6] = ++v12;
        uint64_t v11 = *(void *)(v11 + 16);
      }
      while (v11);
    }
    if (v12 == v8) {
      int v14 = v19 + 1;
    }
    else {
      int v14 = v19;
    }
    if (v12 > v8) {
      int v8 = v12;
    }
    if (v12 > v20) {
      int v7 = 1;
    }
    else {
      int v7 = v14;
    }
    if (a2 && v12) {
      printf(" (%d)\n", v12);
    }
    v10 += v12;
    ++v6;
  }
  while (v6 != v18);
  putchar(10);
  unint64_t v15 = "s";
  if (v10 == 1) {
    unint64_t v15 = "";
  }
  uint64_t result = printf("%d element%s in storage.\n", v10, v15);
  if (v10)
  {
    printf("%d of %d (%.2f%%) buckets are in use\n", v9, v18, (double)v9 * 100.0 / (double)(int)v18);
    printf("the maximum number of elements in a bucket is %d (%d times)\n", v8, v7);
    printf("average per bucket is %f\n", (double)v10 / (double)v9);
    return printf("optimal would be %f\n");
  }
  return result;
}

intmax_t strtoimax(const char *__nptr, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  uint64_t v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtoimax_l(__nptr, __endptr, __base, v5);
}

uintmax_t strtoumax(const char *__nptr, char **__endptr, int __base)
{
  uint64_t v3 = __locale_key;
  uint64_t v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = (_xlocale *)&__global_locale;
  }
  return strtoumax_l(__nptr, __endptr, __base, v5);
}

char *system_NOCANCEL(char *result)
{
  __argv[0] = "sh";
  __argv[1] = "-c";
  __argv[2] = result;
  __argv[3] = 0;
  if (!*MEMORY[0x1E4F14CA8]) {
    *MEMORY[0x1E4F14CA8] = 1;
  }
  if (result)
  {
    *(void *)int v14 = 0;
    v13.__sigaction_u.__sa_handler = 0;
    *(void *)&v13.sa_mask = 0;
    v12.__sigaction_u.__sa_handler = 0;
    *(void *)&v12.sa_mask = 0;
    v11.__sigaction_u.__sa_handler = 0;
    *(void *)&v11.sa_mask = 0;
    *(void *)int v10 = 0;
    posix_spawnattr_t v8 = 0;
    int v1 = posix_spawnattr_init(&v8);
    if (v1)
    {
      *__error() = v1;
      return (char *)0xFFFFFFFFLL;
    }
    sigset_t v9 = 0;
    pthread_mutex_lock(&__systemfn_mutex);
    v13.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
    *(void *)&v13.sa_mask = 0;
    sigaction(2, &v13, &v12);
    if (v12.__sigaction_u.__sa_handler == (void (__cdecl *)(int))1)
    {
      __int16 v2 = 8;
      sigset_t v3 = 4;
    }
    else
    {
      sigset_t v9 = 2;
      __int16 v2 = 12;
      sigset_t v3 = 6;
    }
    sigaction(3, &v13, &v11);
    if (v11.__sigaction_u.__sa_handler != (void (__cdecl *)(int))1)
    {
      sigset_t v9 = v3;
      __int16 v2 = 12;
    }
    v10[1] = 0x80000;
    sigprocmask(1, &v10[1], v10);
    posix_spawnattr_setsigmask(&v8, v10);
    if ((v2 & 4) != 0) {
      posix_spawnattr_setsigdefault(&v8, &v9);
    }
    posix_spawnattr_setflags(&v8, v2);
    uint64_t v4 = _NSGetEnviron();
    int v5 = posix_spawn(&v14[1], "/bin/sh", 0, &v8, __argv, *v4);
    posix_spawnattr_destroy(&v8);
    if (v5 == 35 || v5 == 12)
    {
      pid_t v7 = -1;
    }
    else
    {
      if (!v5)
      {
        pid_t v6 = v14[1];
        while (1)
        {
          v14[1] = wait4(v6, v14, 0, 0);
          if (v14[1] != -1) {
            goto LABEL_24;
          }
          if (*__error() != 4)
          {
            pid_t v7 = v14[1];
            if (v14[1] != -1) {
              goto LABEL_24;
            }
            goto LABEL_23;
          }
        }
      }
      pid_t v7 = 32512;
    }
LABEL_23:
    v14[0] = v7;
LABEL_24:
    sigaction(2, &v12, 0);
    sigaction(3, &v11, 0);
    sigprocmask(3, v10, 0);
    pthread_mutex_unlock(&__systemfn_mutex);
    return (char *)v14[0];
  }
  return result;
}

void *__cdecl tdelete(const void *a1, void **a2, int (__cdecl *a3)(const void *, const void *))
{
  if (!a2) {
    return 0;
  }
  sigset_t v3 = a2;
  uint64_t v4 = *a2;
  if (*a2)
  {
    for (int i = ((uint64_t (*)(const void *, void))a3)(a1, *v4);
          i;
          int i = ((uint64_t (*)(const void *, void))a3)(a1, *v9))
    {
      uint64_t v4 = *v3;
      uint64_t v8 = i >= 0 ? 16 : 8;
      sigset_t v3 = (void **)(i >= 0 ? (char *)*v3 + 16 : (char *)*v3 + 8);
      sigset_t v9 = *(void **)((char *)v4 + v8);
      if (!v9) {
        return 0;
      }
    }
    uint64_t v10 = *((void *)*v3 + 1);
    sigaction v11 = (void *)*((void *)*v3 + 2);
    if (v10)
    {
      if (v11)
      {
        sigaction v12 = (void *)v11[1];
        if (v12)
        {
          do
          {
            sigaction v13 = v11;
            sigaction v11 = v12;
            sigaction v12 = (void *)v12[1];
          }
          while (v12);
          v13[1] = v11[2];
          v11[1] = *((void *)*v3 + 1);
          v11[2] = *((void *)*v3 + 2);
        }
        else
        {
          v11[1] = v10;
        }
      }
      else
      {
        sigaction v11 = (void *)*((void *)*v3 + 1);
      }
    }
    free(*v3);
    *sigset_t v3 = v11;
  }
  return v4;
}

void *__cdecl tfind(const void *a1, void *const *a2, int (__cdecl *a3)(const void *, const void *))
{
  if (!a2) {
    return 0;
  }
  sigset_t v3 = a2;
  uint64_t v4 = *a2;
  if (!*a2) {
    return 0;
  }
  while (1)
  {
    int v7 = ((uint64_t (*)(const void *, void))a3)(a1, *v4);
    if (!v7) {
      break;
    }
    uint64_t v8 = (char *)*v3;
    if (v7 >= 0) {
      uint64_t v9 = 16;
    }
    else {
      uint64_t v9 = 8;
    }
    if (v7 >= 0) {
      sigset_t v3 = (void *const *)((char *)*v3 + 16);
    }
    else {
      sigset_t v3 = (void *const *)((char *)*v3 + 8);
    }
    uint64_t v4 = *(void **)&v8[v9];
    if (!v4) {
      return 0;
    }
  }
  return *v3;
}

void *__cdecl tsearch(const void *a1, void **a2, int (__cdecl *a3)(const void *, const void *))
{
  if (!a2) {
    return 0;
  }
  sigset_t v3 = a2;
  int v5 = *a2;
  if (*a2)
  {
    while (1)
    {
      int v7 = ((uint64_t (*)(const void *, void))a3)(a1, *v5);
      if (!v7) {
        return *v3;
      }
      uint64_t v8 = (char *)*v3;
      if (v7 >= 0) {
        uint64_t v9 = 16;
      }
      else {
        uint64_t v9 = 8;
      }
      if (v7 >= 0) {
        sigset_t v3 = (void **)((char *)*v3 + 16);
      }
      else {
        sigset_t v3 = (void **)((char *)*v3 + 8);
      }
      int v5 = *(void **)&v8[v9];
      if (!v5) {
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    uint64_t result = malloc_type_malloc(0x18uLL, 0x30040D3A788E3uLL);
    if (result)
    {
      *sigset_t v3 = result;
      *((void *)result + 1) = 0;
      *((void *)result + 2) = 0;
      *(void *)uint64_t result = a1;
    }
  }
  return result;
}

void twalk(const void *a1, void (__cdecl *a2)(const void *, VISIT, int))
{
  if (a1)
  {
    if (a2) {
      trecurse((uint64_t)a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))a2, 0);
    }
  }
}

uint64_t trecurse(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v4 = a2;
  if (*(void *)(a1 + 8) || *(void *)(a1 + 16))
  {
    a2(a1, 0, a3);
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6) {
      trecurse(v6, a2, (a3 + 1));
    }
    a2(a1, 1, a3);
    uint64_t v7 = *(void *)(a1 + 16);
    if (v7) {
      trecurse(v7, a2, (a3 + 1));
    }
    uint64_t v8 = 2;
    uint64_t v4 = a2;
  }
  else
  {
    uint64_t v8 = 3;
  }

  return v4(a1, v8, a3);
}

int posix_openpt(int a1)
{
  int result = open_NOCANCEL();
  if (result < 0) {
    return -1;
  }
  return result;
}

int grantpt(int a1)
{
  return ioctl(a1, 0x20007454uLL);
}

char *__cdecl ptsname(int a1)
{
  if (ptsname_once != -1) {
    _os_once();
  }
  __int16 v2 = (char *)pthread_getspecific(ptsname_buffer_specific_key);
  if (!v2)
  {
    sigset_t v3 = (char *)malloc_type_malloc(0x80uLL, 0x9A601A37uLL);
    if (!v3) {
      fts_build_cold_1();
    }
    __int16 v2 = v3;
    if (pthread_setspecific(ptsname_buffer_specific_key, v3)) {
      ptsname_cold_2();
    }
  }
  if (ptsname_r(a1, v2, 0x80uLL)) {
    return 0;
  }
  else {
    return v2;
  }
}

uint64_t ptsname_once_init()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&ptsname_buffer_specific_key, MEMORY[0x1E4F14C90]);
  if (result) {
    ptsname_cold_2();
  }
  return result;
}

int ptsname_r(int fildes, char *buffer, size_t buflen)
{
  memset(&v10, 0, sizeof(v10));
  if (buffer)
  {
    int v4 = (int)buffer;
    if (ioctl(fildes, 0x40807453uLL, path) || stat(path, &v10)) {
      return -1;
    }
    if (j__strsignal_r((int)path, v5, v6) + 1 <= buflen)
    {
      j__mkdtempat_np(v4, path);
      return 0;
    }
    uint64_t v7 = __error();
    int v8 = 34;
  }
  else
  {
    uint64_t v7 = __error();
    int v8 = 22;
  }
  int *v7 = v8;
  return -1;
}

int unlockpt(int a1)
{
  return ioctl(a1, 0x20007452uLL);
}

char *__cdecl l64a(uint64_t a1)
{
  int v1 = l64a_buf;
  if (a1)
  {
    uint64_t v2 = 0;
    do
    {
      unsigned int v3 = a1 & 0x3F;
      char v4 = (a1 & 0x3F) + 59;
      if (v3 <= 0x25) {
        char v4 = (a1 & 0x3F) + 53;
      }
      if (v3 <= 0xB) {
        char v4 = v3 + 46;
      }
      if (v3 <= 1) {
        char v5 = v3 + 46;
      }
      else {
        char v5 = v4;
      }
      l64a_buf[v2] = v5;
      uint64_t v6 = v2 + 1;
      if (a1 < 0x40) {
        break;
      }
      LODWORD(a1) = (int)a1 >> 6;
    }
    while (v2++ < 5);
    int v1 = &l64a_buf[v6];
  }
  *int v1 = 0;
  return l64a_buf;
}

char *__cdecl ecvt(double a1, int a2, int *a3, int *a4)
{
  return __cvt(a2, a3, a4, 0, a1);
}

char *__cvt(int a1, int *a2, _DWORD *a3, int a4, double a5)
{
  if (!a1)
  {
    *a3 = a5 < 0.0;
    *a2 = 0;
    return "";
  }
  if (__cvt_s)
  {
    free((void *)__cvt_s);
    __cvt_s = 0;
  }
  int v20 = 0;
  if (a1 >= 0) {
    int v10 = a1;
  }
  else {
    int v10 = -a1;
  }
  size_t v11 = (v10 + 1);
  if (a5 == 0.0)
  {
    *a2 = 1 - a4;
    *a3 = 0;
    uint64_t result = (char *)malloc_type_malloc(v11, 0xDC031092uLL);
    __cvt_s = (uint64_t)result;
    if (!result) {
      return result;
    }
    sigaction v13 = result + 1;
    int v20 = result + 1;
    *(_WORD *)uint64_t result = 48;
  }
  else
  {
    uint64_t result = __dtoa(a4 + 2, a1, a2, a3, &v20, a5);
    if (!result) {
      return result;
    }
    uint64_t v16 = (uint64_t)result;
    int v17 = *a2;
    if (*a2 == 9999)
    {
      *a2 = 0;
      int v18 = *result;
      __freedtoa((uint64_t)result);
      if (v18 == 73) {
        return "inf";
      }
      else {
        return "nan";
      }
    }
    if (!a4) {
      int v17 = 0;
    }
    v11 += v17;
    int v19 = malloc_type_malloc(v11, 0x97679A8FuLL);
    __cvt_s = (uint64_t)v19;
    if (!v19)
    {
      __freedtoa(v16);
      return 0;
    }
    MEMORY[0x18C122F90](v19, v16, v11);
    int v20 = &v20[__cvt_s - v16];
    __freedtoa(v16);
    sigaction v13 = v20;
    uint64_t result = (char *)__cvt_s;
  }
  uint64_t v14 = (uint64_t)&result[v11 - (void)v13 - 1];
  if (&result[v11 - (void)v13] != (char *)1)
  {
    do
    {
      unint64_t v15 = v20++;
      *unint64_t v15 = 48;
      --v14;
    }
    while (v14);
    sigaction v13 = v20;
  }
  *sigaction v13 = 0;
  return (char *)__cvt_s;
}

char *__cdecl fcvt(double a1, int a2, int *a3, int *a4)
{
  return __cvt(a2, a3, a4, 1, a1);
}

char *__cdecl gcvt(double a1, int a2, char *a3)
{
  uint64_t v6 = localeconv();
  if (a2)
  {
    p_decimal_point = (const char **)&v6->decimal_point;
    unint64_t v35 = 0;
    int v8 = __dtoa(2u, a2, (_DWORD *)&v35 + 1, &v35, 0, a1);
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = HIDWORD(v35);
      if (HIDWORD(v35) == 9999)
      {
        size_t v11 = "-";
        if (!v35) {
          size_t v11 = "";
        }
        if (*v8 == 73) {
          sigaction v12 = "inf";
        }
        else {
          sigaction v12 = "nan";
        }
        snprintf(a3, a2 + 1, "%s%s", v11, v12);
      }
      else
      {
        sigaction v13 = a3;
        if (v35)
        {
          *a3 = 45;
          sigaction v13 = a3 + 1;
        }
        if (v10 < 0 || v10 > a2)
        {
          int v17 = 1 - v10;
          BOOL v18 = __OFSUB__(v10, 1);
          int v19 = v10 - 1;
          BOOL v20 = v19 < 0 != v18;
          if (v19 < 0 != v18) {
            int v19 = v17;
          }
          unint64_t v35 = __PAIR64__(v19, v20);
          *sigaction v13 = *v9;
          int v21 = stpcpy(v13 + 1, *p_decimal_point);
          char v22 = v9[1];
          if (v22)
          {
            char v23 = (unsigned __int8 *)(v9 + 2);
            do
            {
              *v21++ = v22;
              int v24 = *v23++;
              char v22 = v24;
            }
            while (v24);
          }
          *int v21 = 101;
          if (v35) {
            char v25 = 45;
          }
          else {
            char v25 = 43;
          }
          v21[1] = v25;
          int v26 = HIDWORD(v35);
          if (SHIDWORD(v35) >= 10)
          {
            size_t v27 = v21 + 1;
            do
            {
              unsigned int v28 = v26 + 9;
              v26 /= 10;
              ++v27;
            }
            while (v28 > 0x12);
            LODWORD(v35) = v26;
            v27[1] = 0;
            int v29 = HIDWORD(v35);
            if (HIDWORD(v35))
            {
              do
              {
                *v27-- = v29 - 10 * (((unint64_t)(1717986919 * v29) >> 34) + (1717986919 * v29 < 0)) + 48;
                int v30 = HIDWORD(v35);
                int v29 = SHIDWORD(v35) / 10;
                SHIDWORD(v35) /= 10;
              }
              while ((v30 + 9) >= 0x13);
            }
            goto LABEL_50;
          }
          v21[2] = 48;
          sigaction v13 = v21 + 4;
          v21[3] = BYTE4(v35) + 48;
        }
        else
        {
          if (v10)
          {
            uint64_t v14 = v9;
            do
            {
              int v15 = *v14;
              BOOL v16 = v15 == 0;
              if (!*v14) {
                LOBYTE(v15) = 48;
              }
              if (!v16) {
                ++v14;
              }
              *v13++ = v15;
              --v10;
            }
            while (v10);
          }
          else
          {
            uint64_t v14 = v9;
          }
          if (*v14)
          {
            if (v14 == v9) {
              *v13++ = 48;
            }
            sigaction v13 = stpcpy(v13, *p_decimal_point);
            char v31 = v9[SHIDWORD(v35)];
            if (v31)
            {
              v32 = &v9[SHIDWORD(v35) + 1];
              do
              {
                *v13++ = v31;
                int v33 = *v32++;
                char v31 = v33;
              }
              while (v33);
            }
          }
        }
        *sigaction v13 = 0;
      }
LABEL_50:
      __freedtoa((uint64_t)v9);
      return a3;
    }
    return 0;
  }
  else
  {
    *a3 = 0;
  }
  return a3;
}

char *__ldtoa(double *a1, unsigned int a2, int a3, _DWORD *a4, _DWORD *a5, char **a6)
{
  uint64_t result = __dtoa(a2, a3, a4, a5, a6, *a1);
  if (*a4 == 9999) {
    *a4 = 0x7FFFFFFF;
  }
  return result;
}

int timespec_get(timespec *ts, int base)
{
  return base == 1 && clock_gettime(_CLOCK_REALTIME, ts) != -1;
}

char *_Read_RuneMagi(FILE *a1)
{
  memset(&v126, 0, sizeof(v126));
  int v2 = fileno(a1);
  if (fstat(v2, &v126) < 0) {
    return 0;
  }
  st_uint64_t size = v126.st_size;
  if (v126.st_size <= 0xC3BuLL)
  {
LABEL_3:
    char v4 = __error();
    char v5 = 0;
    int v6 = 79;
LABEL_10:
    *char v4 = v6;
    return v5;
  }
  int v7 = fileno(a1);
  int v8 = mmap(0, st_size, 3, 2, v7, 0);
  if (v8 == (_DWORD *)-1)
  {
    char v4 = __error();
    char v5 = 0;
    int v6 = 22;
    goto LABEL_10;
  }
  uint64_t v9 = (char *)v8;
  unint64_t v10 = (unint64_t)v8 + v126.st_size;
  if (*(void *)v8 == 0x4167614D656E7552)
  {
    if (v126.st_size <= 0xC5BuLL) {
      goto LABEL_3;
    }
    v8[12] = bswap32(v8[12]);
    signed int v14 = bswap32(v8[788]);
    v8[788] = v14;
    signed int v15 = bswap32(v8[789]);
    v8[789] = v15;
    uint64_t v16 = bswap32(v8[781]);
    v8[781] = v16;
    signed int v17 = bswap32(v8[783]);
    v8[783] = v17;
    signed int v18 = bswap32(v8[785]);
    v8[785] = v18;
    int v19 = (int8x8_t *)&v8[4 * (int)v16 + 791];
    if ((unint64_t)v19 > v10) {
      goto LABEL_56;
    }
    BOOL v20 = &v19[2 * v17];
    if ((unint64_t)v20 > v10) {
      goto LABEL_56;
    }
    int v21 = &v20[2 * v18];
    if ((unint64_t)v21 > v10) {
      goto LABEL_56;
    }
    if ((int)v16 < 1)
    {
      int v22 = 0;
    }
    else
    {
      int v22 = 0;
      char v23 = v8 + 793;
      uint64_t v24 = v16;
      do
      {
        unsigned int v25 = bswap32(*(v23 - 2));
        unsigned int v26 = bswap32(*(v23 - 1));
        *(v23 - 2) = v25;
        *(v23 - 1) = v26;
        unsigned int v27 = *v23;
        *char v23 = bswap32(*v23);
        if (!v27)
        {
          int v28 = v26 - v25 + 1;
          int v21 = (int8x8_t *)((char *)v21 + 4 * v28);
          if ((unint64_t)v21 > v10) {
            goto LABEL_56;
          }
          v22 += v28;
        }
        v23 += 4;
        --v24;
      }
      while (v24);
    }
    if ((unint64_t)v21 + 20 * v15 + v14 > v10)
    {
LABEL_56:
      v71 = __error();
      char v5 = 0;
      v72 = 0;
LABEL_57:
      int *v71 = 22;
LABEL_58:
      int v73 = *__error();
      free(v72);
      free(v5);
      char v5 = 0;
      *__error() = v73;
LABEL_59:
      int v74 = *__error();
      munmap(v9, v126.st_size);
      if (!v5) {
        *__error() = v74;
      }
      return v5;
    }
    int v75 = v14 + 20 * v15 + 24 * (v17 + v16 + v18) + 4 * v22 + 128;
    v76 = (char *)malloc_type_calloc(1uLL, v14 + 20 * v15 + 24 * (v17 + (int)v16 + v18) + 4 * v22 + 128, 0x3D73B203uLL);
    char v5 = v76;
    if (!v76)
    {
      v72 = 0;
      goto LABEL_58;
    }
    *(_DWORD *)v76 = 1;
    *((void *)v76 + 1) = destruct_ctype;
    v77 = (char *)malloc_type_calloc(1uLL, 0xC88uLL, 0x10A0040C89F755AuLL);
    v72 = (int *)v77;
    *((void *)v5 + 15) = v77;
    if (!v77)
    {
      free(v5);
      goto LABEL_58;
    }
    uint64_t v78 = 0;
    v79 = v5 + 128;
    *((void *)v77 + 398) = v5 + 128;
    *(void *)v77 = 0x4167614D656E7552;
    long long v80 = *(_OWORD *)(v9 + 8);
    *(_OWORD *)(v77 + 24) = *(_OWORD *)(v9 + 24);
    *(_OWORD *)(v77 + 8) = v80;
    *((_DWORD *)v77 + 14) = *((_DWORD *)v9 + 12);
    *((_DWORD *)v77 + 784) = *((_DWORD *)v9 + 781);
    *((_DWORD *)v77 + 788) = *((_DWORD *)v9 + 783);
    *((_DWORD *)v77 + 792) = *((_DWORD *)v9 + 785);
    *((void *)v77 + 399) = *((void *)v9 + 394);
    do
    {
      v81 = &v77[v78];
      *((_DWORD *)v81 + 15) = bswap32(*(_DWORD *)&v9[v78 + 52]);
      *((_DWORD *)v81 + 271) = bswap32(*(_DWORD *)&v9[v78 + 1076]);
      *((_DWORD *)v81 + 527) = bswap32(*(_DWORD *)&v9[v78 + 2100]);
      v78 += 4;
    }
    while (v78 != 1024);
    *((void *)v77 + 393) = v79;
    int v82 = *((_DWORD *)v77 + 784);
    int v83 = v82;
    v84 = &v79[24 * v82];
    *((void *)v77 + 395) = v84;
    int v85 = *((_DWORD *)v77 + 788);
    v86 = &v84[24 * v85];
    *((void *)v77 + 397) = v86;
    v87 = &v86[24 * *((int *)v77 + 792)];
    *((void *)v77 + 400) = v87;
    v88 = &v87[20 * *((int *)v77 + 799)];
    *((void *)v72 + 398) = v88;
    v89 = &v20[2 * *((int *)v9 + 785)];
    if (v82 < 1)
    {
      LODWORD(v100) = v85;
    }
    else
    {
      for (uint64_t i = 0; i < v82; ++i)
      {
        uint64_t v91 = (uint64_t)&v9[16 * i + 3164];
        v92 = &v79[24 * i];
        int32x2_t v93 = *(int32x2_t *)v91;
        *(void *)v92 = *(void *)v91;
        LODWORD(v91) = *(_DWORD *)(v91 + 8);
        *((_DWORD *)v92 + 2) = v91;
        if (v91)
        {
          *(void *)&v79[24 * i + 16] = 0;
        }
        else
        {
          unsigned __int32 v94 = vsub_s32(vdup_lane_s32(v93, 1), v93).u32[0];
          v95 = (int8x8_t *)((char *)v89 + 4 * (int)(v94 + 1));
          *(void *)&v79[24 * i + 16] = v88;
          *((void *)v72 + 398) = &v88[4 * (v94 + 1)];
          if ((v94 & 0x80000000) == 0)
          {
            int v96 = v94 + 2;
            v97 = &v88[4 * v94];
            v98 = (unsigned int *)v89 + v94;
            do
            {
              unsigned int v99 = *v98--;
              *(_DWORD *)v97 = bswap32(v99);
              v97 -= 4;
              --v96;
            }
            while (v96 > 1);
            int v82 = v72[784];
          }
          v88 += 4 * (int)(v94 + 1);
          v89 = v95;
        }
      }
      LODWORD(v100) = v72[788];
    }
    if ((int)v100 >= 1)
    {
      uint64_t v100 = v100;
      v113 = (int8x8_t *)&v5[24 * v83 + 136];
      do
      {
        v113[-1] = vrev32_s8(*v19);
        v113->i32[0] = bswap32(v19[1].u32[0]);
        v113 += 3;
        v19 += 2;
        --v100;
      }
      while (v100);
    }
    uint64_t v114 = *((unsigned int *)v9 + 785);
    if ((int)v114 >= 1)
    {
      uint64_t v115 = 0;
      int v116 = v85;
      uint64_t v117 = 24 * v114;
      v118 = &v5[24 * v116 + 24 * v83];
      do
      {
        v119 = (int8x8_t *)&v118[v115];
        v119[16] = vrev32_s8(*v20);
        v119[17].i32[0] = bswap32(v20[1].u32[0]);
        v115 += 24;
        v20 += 2;
      }
      while (v117 != v115);
    }
    int v120 = *((_DWORD *)v9 + 789);
    if (v120 < 1)
    {
      v121 = (char *)v89;
    }
    else
    {
      v121 = (char *)v89 + 20 * v120;
      if ((unint64_t)v121 > v10)
      {
        v71 = __error();
        goto LABEL_57;
      }
      unint64_t v122 = 0;
      uint64_t v123 = 0;
      *((void *)v72 + 400) = v88;
      *((void *)v72 + 398) = &v88[20 * v72[799]];
      do
      {
        v124 = &v88[v122];
        uint64_t v125 = *(uint64_t *)((char *)v89 + v122);
        *(int8x8_t *)(v124 + 6) = *(int8x8_t *)((char *)v89 + v122 + 6);
        *(void *)v124 = v125;
        v88 = (char *)*((void *)v72 + 400);
        *(_DWORD *)&v88[v122 + 16] = bswap32(v89[2].u32[v122 / 4]);
        ++v123;
        v122 += 20;
      }
      while (v123 < *((int *)v9 + 789));
      v88 = (char *)*((void *)v72 + 398);
    }
    j__mkdtempat_np((int)v88, v121);
    if (!v72[798]) {
      *((void *)v72 + 398) = 0;
    }
    if (!v72[784]) {
      *((void *)v72 + 393) = 0;
    }
    if (!v72[788]) {
      *((void *)v72 + 395) = 0;
    }
    if (!v72[792]) {
      *((void *)v72 + 397) = 0;
    }
    *((_DWORD *)v5 + 28) = v75;
    goto LABEL_59;
  }
  if (*(void *)v8 != 0x4267614D656E7552)
  {
    size_t v11 = __error();
    char v5 = 0;
    sigaction v12 = 0;
    int v13 = 79;
LABEL_36:
    *size_t v11 = v13;
LABEL_37:
    int v42 = *__error();
    munmap(v9, v126.st_size);
    free(v12);
    free(v5);
    char v5 = 0;
    *__error() = v42;
    return v5;
  }
  unint64_t v29 = (unint64_t)&v8[3 * v8[778] + 783];
  if (v29 > v10) {
    goto LABEL_34;
  }
  uint64_t v30 = (int)v8[779];
  unint64_t v31 = v29 + 12 * (int)v30;
  if (v31 > v10) {
    goto LABEL_34;
  }
  uint64_t v32 = (int)v8[780];
  unint64_t v33 = v31 + 12 * (int)v32;
  if (v33 > v10) {
    goto LABEL_34;
  }
  int v34 = v8[778];
  if (v34 < 1)
  {
    int v35 = 0;
  }
  else
  {
    int v35 = 0;
    v36 = v8 + 785;
    uint64_t v37 = v8[778];
    do
    {
      if (!*v36)
      {
        int v38 = *(v36 - 1) - *(v36 - 2) + 1;
        v33 += 4 * v38;
        if (v33 > v10) {
          goto LABEL_34;
        }
        v35 += v38;
      }
      v36 += 3;
      --v37;
    }
    while (v37);
  }
  int v39 = v8[782];
  unint64_t v40 = v33 + 20 * v39;
  uint64_t v41 = (int)v8[781];
  if (v40 + v41 > v10)
  {
LABEL_34:
    size_t v11 = __error();
    char v5 = 0;
    sigaction v12 = 0;
LABEL_35:
    int v13 = 22;
    goto LABEL_36;
  }
  int v44 = 20 * v39 + 4 * v35 + v41 + 24 * (v30 + v34 + v32) + 128;
  int v45 = (char *)malloc_type_calloc(1uLL, 20 * v39 + 4 * v35 + v41 + 24 * (v30 + v34 + v32) + 128, 0xEAC7157EuLL);
  char v5 = v45;
  if (!v45)
  {
    sigaction v12 = 0;
    goto LABEL_37;
  }
  *(_DWORD *)int v45 = 1;
  *((void *)v45 + 1) = destruct_ctype;
  v46 = (char *)malloc_type_calloc(1uLL, 0xC88uLL, 0x10A0040C89F755AuLL);
  sigaction v12 = (int *)v46;
  *((void *)v5 + 15) = v46;
  if (!v46)
  {
    free(v5);
    goto LABEL_37;
  }
  v47 = v5 + 128;
  *((void *)v46 + 398) = v5 + 128;
  *(void *)v46 = 0x4167614D656E7552;
  long long v48 = *(_OWORD *)(v9 + 8);
  *(_OWORD *)(v46 + 24) = *(_OWORD *)(v9 + 24);
  *(_OWORD *)(v46 + 8) = v48;
  *((_DWORD *)v46 + 14) = 0;
  *((_DWORD *)v46 + 784) = *((_DWORD *)v9 + 778);
  *((_DWORD *)v46 + 788) = *((_DWORD *)v9 + 779);
  *((_DWORD *)v46 + 792) = *((_DWORD *)v9 + 780);
  *((void *)v46 + 399) = *(void *)(v9 + 3124);
  uint64_t v49 = -1024;
  do
  {
    v50 = &v46[v49];
    *((_DWORD *)v50 + 271) = *(_DWORD *)&v9[v49 + 1064];
    *((_DWORD *)v50 + 527) = *(_DWORD *)&v9[v49 + 2088];
    *((_DWORD *)v50 + 783) = *(_DWORD *)&v9[v49 + 3112];
    v49 += 4;
  }
  while (v49);
  *((void *)v46 + 393) = v47;
  int v51 = *((_DWORD *)v46 + 784);
  int v52 = v51;
  v53 = &v47[24 * v51];
  *((void *)v46 + 395) = v53;
  int v54 = *((_DWORD *)v46 + 788);
  v55 = &v53[24 * v54];
  *((void *)v46 + 397) = v55;
  v56 = &v55[24 * *((int *)v46 + 792)];
  *((void *)v46 + 400) = v56;
  v57 = &v56[20 * *((int *)v46 + 799)];
  *((void *)v12 + 398) = v57;
  v58 = (char *)(v31 + 12 * *((int *)v9 + 780));
  if (v51 < 1)
  {
    LODWORD(v70) = v54;
  }
  else
  {
    for (uint64_t j = 0; j < v51; ++j)
    {
      uint64_t v60 = (uint64_t)&v9[12 * j + 3132];
      v61 = &v47[24 * j];
      int32x2_t v62 = *(int32x2_t *)v60;
      *(void *)v61 = *(void *)v60;
      LODWORD(v60) = *(_DWORD *)(v60 + 8);
      *((_DWORD *)v61 + 2) = v60;
      if (v60)
      {
        *(void *)&v47[24 * j + 16] = 0;
      }
      else
      {
        unsigned __int32 v63 = vsub_s32(vdup_lane_s32(v62, 1), v62).u32[0];
        v64 = &v58[4 * (v63 + 1)];
        *(void *)&v47[24 * j + 16] = v57;
        v65 = &v57[4 * (v63 + 1)];
        *((void *)v12 + 398) = v65;
        if ((v63 & 0x80000000) == 0)
        {
          int v66 = v63 + 2;
          v67 = &v57[4 * v63];
          v68 = &v58[4 * v63];
          do
          {
            int v69 = *(_DWORD *)v68;
            v68 -= 4;
            *(_DWORD *)v67 = v69;
            v67 -= 4;
            --v66;
          }
          while (v66 > 1);
          int v51 = v12[784];
        }
        v57 = v65;
        v58 = v64;
      }
    }
    LODWORD(v70) = v12[788];
  }
  if ((int)v70 >= 1)
  {
    uint64_t v70 = v70;
    v101 = &v5[24 * v52 + 136];
    do
    {
      *((void *)v101 - 1) = *(void *)v29;
      *(_DWORD *)v101 = *(_DWORD *)(v29 + 8);
      v101 += 24;
      v29 += 12;
      --v70;
    }
    while (v70);
  }
  uint64_t v102 = *((unsigned int *)v9 + 780);
  if ((int)v102 >= 1)
  {
    uint64_t v103 = 0;
    v104 = &v5[24 * v54 + 24 * v52];
    uint64_t v105 = 24 * v102;
    do
    {
      v106 = &v104[v103];
      *((void *)v106 + 16) = *(void *)v31;
      *((_DWORD *)v106 + 34) = *(_DWORD *)(v31 + 8);
      v103 += 24;
      v31 += 12;
    }
    while (v105 != v103);
  }
  int v107 = *((_DWORD *)v9 + 782);
  if (v107 < 1)
  {
    v108 = v58;
  }
  else
  {
    v108 = &v58[20 * v107];
    if ((unint64_t)v108 > v10)
    {
      size_t v11 = __error();
      goto LABEL_35;
    }
    uint64_t v109 = 0;
    uint64_t v110 = 0;
    *((void *)v12 + 400) = v57;
    *((void *)v12 + 398) = &v57[20 * v12[799]];
    do
    {
      v111 = &v57[v109];
      uint64_t v112 = *(void *)&v58[v109];
      *(void *)(v111 + 6) = *(void *)&v58[v109 + 6];
      *(void *)v111 = v112;
      v57 = (char *)*((void *)v12 + 400);
      *(_DWORD *)&v57[v109 + 16] = *(_DWORD *)&v58[v109 + 16];
      ++v110;
      v109 += 20;
    }
    while (v110 < *((int *)v9 + 782));
    v57 = (char *)*((void *)v12 + 398);
  }
  j__mkdtempat_np((int)v57, v108);
  munmap(v9, v126.st_size);
  if (!v12[798]) {
    *((void *)v12 + 398) = 0;
  }
  if (!v12[784]) {
    *((void *)v12 + 393) = 0;
  }
  if (!v12[788]) {
    *((void *)v12 + 395) = 0;
  }
  if (!v12[792]) {
    *((void *)v12 + 397) = 0;
  }
  *((_DWORD *)v5 + 28) = v44;
  return v5;
}

void destruct_ctype(void *a1)
{
  int v2 = (_RuneLocale *)a1[15];
  if (v2 != &_DefaultRuneLocale) {
    free(v2);
  }

  free(a1);
}

void *getargs(uint64_t a1)
{
  int v2 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  unsigned int v3 = *(void **)(a1 + 8);
  if (!v3)
  {
    char v4 = mmap(0, 0x1000uLL, 3, 4098, -1, 0);
    if (!v4) {
      return 0;
    }
    char v5 = 0;
    *char v4 = *(void *)(a1 + 16);
    unsigned int v3 = v4 - 3;
    *(void *)(a1 + 16) = v4;
    int v6 = v4 + 1;
    for (unsigned int i = 128; i > 1; --i)
    {
      v3[4] = v5;
      v3 += 4;
      char v5 = v6;
      v6 += 4;
    }
    *(void *)(a1 + 8) = v3;
  }
  *(void *)(a1 + 8) = *v3;
  os_unfair_lock_unlock(v2);
  return v3;
}

void _psort_parallel(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  _psort(*(char **)(a1 + 8), *(void *)(a1 + 16), *(void *)(v2 + 32), *(int (__cdecl **)(const void *, const void *))(v2 + 24), *(_DWORD *)(a1 + 24), v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  *(void *)a1 = *(void *)(v2 + 8);
  *(void *)(v2 + 8) = a1;

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
}

void _psort(char *a1, size_t a2, int64_t a3, int (__cdecl *a4)(const void *, const void *), int a5, uint64_t a6)
{
  if (a5 < 1)
  {
LABEL_136:
    heapsort(a1, a2, a3, a4);
    return;
  }
  int v9 = a5;
  int64_t v10 = -a3;
  BOOL v106 = a3 != 8;
  uint64_t v104 = (int)a3;
  uint64_t v118 = (int)a3 + 1;
  unint64_t v105 = (unint64_t)(int)a3 >> 3;
  size_t __width = a3;
  while (1)
  {
    uint64_t v119 = (a1 | a3) & 7;
    if (((a1 | a3) & 7) != 0) {
      int v11 = 2;
    }
    else {
      int v11 = v106;
    }
    int64_t v109 = a2 * a3;
    if (a2 <= 6)
    {
      if (v109 > a3)
      {
        uint64_t v91 = &a1[__width];
        v92 = a1;
        do
        {
          if (v91 > a1)
          {
            int32x2_t v93 = v92;
            unsigned __int32 v94 = v91;
            do
            {
              v95 = v94;
              v94 += v10;
              if (((int (*)(char *, char *))a4)(v94, v95) < 1) {
                break;
              }
              if (v11)
              {
                uint64_t v96 = v119;
                if (v119)
                {
                  uint64_t v97 = 0;
                  uint64_t v98 = v104 + 1;
                  do
                  {
                    char v99 = v95[v97];
                    v95[v97] = *((unsigned char *)v93 + v97);
                    *((unsigned char *)v93 + v97) = v99;
                    --v98;
                    ++v97;
                  }
                  while (v98 > 1);
                }
                else
                {
                  size_t v101 = (size_t)v93 + __width;
                  unint64_t v102 = v105 + 1;
                  do
                  {
                    uint64_t v103 = *(void *)(v101 + v96);
                    *(void *)(v101 + v96) = *(void *)((char *)v93 + v96);
                    *(void *)((char *)v93 + v96) = v103;
                    v96 += 8;
                    --v102;
                  }
                  while (v102 > 1);
                }
              }
              else
              {
                uint64_t v100 = *(void *)v95;
                *(void *)v95 = *(void *)v94;
                *(void *)unsigned __int32 v94 = v100;
              }
              int32x2_t v93 = (void *)((char *)v93 + v10);
            }
            while (v94 > a1);
          }
          v91 += __width;
          v92 = (void *)((char *)v92 + __width);
        }
        while (v91 < &a1[v109]);
      }
      return;
    }
    sigaction v12 = &a1[(a2 >> 1) * a3];
    size_t v112 = a2;
    int v110 = v9;
    if (a2 != 7)
    {
      int v13 = &a1[(a2 - 1) * a3];
      if (a2 < 0x29)
      {
        signed int v18 = a1;
        int v19 = &a1[(a2 - 1) * a3];
LABEL_39:
        int v25 = ((uint64_t (*)(char *, char *))a4)(v18, v12);
        int v26 = ((uint64_t (*)(char *, char *))a4)(v12, v19);
        if (v25 < 0)
        {
          a2 = v112;
          if ((v26 & 0x80000000) == 0)
          {
            if (((int (*)(char *, char *))a4)(v18, v19) >= 0) {
              sigaction v12 = v18;
            }
            else {
              sigaction v12 = v19;
            }
          }
        }
        else
        {
          a2 = v112;
          if (v26 <= 0)
          {
            if (((int (*)(char *, char *))a4)(v18, v19) >= 0) {
              sigaction v12 = v19;
            }
            else {
              sigaction v12 = v18;
            }
          }
        }
        goto LABEL_48;
      }
      size_t v14 = (a2 >> 3) * a3;
      int v15 = ((uint64_t (*)(char *, char *))a4)(a1, &a1[v14]);
      uint64_t v115 = &a1[v14];
      int v16 = ((uint64_t (*)(char *, char *))a4)(&a1[v14], &a1[2 * v14]);
      if (v15 < 0)
      {
        if ((v16 & 0x80000000) == 0)
        {
          if (((int (*)(char *, char *))a4)(a1, &a1[2 * v14]) >= 0) {
            signed int v17 = a1;
          }
          else {
            signed int v17 = &a1[2 * v14];
          }
          goto LABEL_19;
        }
      }
      else if (v16 <= 0)
      {
        if (((int (*)(char *, char *))a4)(a1, &a1[2 * v14]) >= 0) {
          signed int v17 = &a1[2 * v14];
        }
        else {
          signed int v17 = a1;
        }
LABEL_19:
        uint64_t v115 = v17;
      }
      int v20 = ((uint64_t (*)(char *, char *))a4)(&v12[-v14], v12);
      int v21 = ((uint64_t (*)(char *, char *))a4)(v12, &v12[v14]);
      if (v20 < 0)
      {
        if ((v21 & 0x80000000) == 0)
        {
          if (((int (*)(char *, char *))a4)(&v12[-v14], &v12[v14]) >= 0) {
            v12 -= v14;
          }
          else {
            v12 += v14;
          }
        }
      }
      else if (v21 <= 0)
      {
        if (((int (*)(char *, char *))a4)(&v12[-v14], &v12[v14]) >= 0) {
          v12 += v14;
        }
        else {
          v12 -= v14;
        }
      }
      int v22 = &v13[-2 * v14];
      int v19 = &v13[-v14];
      int v23 = ((uint64_t (*)(char *, char *))a4)(v22, &v13[-v14]);
      int v24 = ((uint64_t (*)(char *, char *))a4)(&v13[-v14], v13);
      if (v23 < 0)
      {
        signed int v18 = v115;
        if ((v24 & 0x80000000) == 0)
        {
          if (((int (*)(char *, char *))a4)(v22, v13) >= 0) {
            int v19 = v22;
          }
          else {
            int v19 = v13;
          }
        }
      }
      else
      {
        signed int v18 = v115;
        if (v24 <= 0)
        {
          if (((int (*)(char *, char *))a4)(v22, v13) >= 0) {
            int v19 = v13;
          }
          else {
            int v19 = v22;
          }
        }
      }
      int v9 = v110;
      goto LABEL_39;
    }
LABEL_48:
    if (v11)
    {
      if (v119)
      {
        uint64_t v27 = v118;
        int v28 = a1;
        do
        {
          char v29 = *v28;
          *v28++ = *v12;
          *v12++ = v29;
          --v27;
        }
        while (v27 > 1);
      }
      else
      {
        unint64_t v31 = v105 + 1;
        uint64_t v32 = a1;
        do
        {
          uint64_t v33 = *(void *)v32;
          *(void *)uint64_t v32 = *(void *)v12;
          v32 += 8;
          *(void *)sigaction v12 = v33;
          v12 += 8;
          --v31;
        }
        while (v31 > 1);
      }
    }
    else
    {
      uint64_t v30 = *(void *)a1;
      *(void *)a1 = *(void *)v12;
      *(void *)sigaction v12 = v30;
    }
    int v34 = 0;
    unsigned int v111 = v9 - 1;
    int v35 = &a1[(a2 - 1) * __width];
    v36 = v35;
    uint64_t v37 = &a1[__width];
    int v38 = &a1[__width];
LABEL_57:
    while (v37 <= v36)
    {
      int v39 = ((uint64_t (*)(char *, char *))a4)(v37, a1);
      if (v39 > 0) {
        break;
      }
      if (!v39)
      {
        if (v11)
        {
          uint64_t v40 = v119;
          if (v119)
          {
            uint64_t v41 = 0;
            uint64_t v42 = v118;
            do
            {
              char v43 = v38[v41];
              v38[v41] = v37[v41];
              v37[v41] = v43;
              --v42;
              ++v41;
            }
            while (v42 > 1);
          }
          else
          {
            unint64_t v57 = v105 + 1;
            do
            {
              uint64_t v58 = *(void *)&v38[v40];
              *(void *)&v38[v40] = *(void *)&v37[v40];
              *(void *)&v37[v40] = v58;
              v40 += 8;
              --v57;
            }
            while (v57 > 1);
          }
        }
        else
        {
          uint64_t v56 = *(void *)v38;
          *(void *)int v38 = *(void *)v37;
          *(void *)uint64_t v37 = v56;
        }
        v38 += __width;
        int v34 = 1;
      }
      v37 += __width;
    }
    while (v37 <= v36)
    {
      int v51 = ((uint64_t (*)(char *, char *))a4)(v36, a1);
      if (v51 < 0)
      {
        if (v11)
        {
          uint64_t v52 = v119;
          if (v119)
          {
            uint64_t v53 = 0;
            uint64_t v54 = v118;
            do
            {
              char v55 = v37[v53];
              v37[v53] = v36[v53];
              v36[v53] = v55;
              --v54;
              ++v53;
            }
            while (v54 > 1);
          }
          else
          {
            unint64_t v60 = v105 + 1;
            do
            {
              uint64_t v61 = *(void *)&v37[v52];
              *(void *)&v37[v52] = *(void *)&v36[v52];
              *(void *)&v36[v52] = v61;
              v52 += 8;
              --v60;
            }
            while (v60 > 1);
          }
        }
        else
        {
          uint64_t v59 = *(void *)v37;
          *(void *)uint64_t v37 = *(void *)v36;
          *(void *)v36 = v59;
        }
        v37 += __width;
        v36 += v10;
        int v34 = 1;
        goto LABEL_57;
      }
      if (!v51)
      {
        if (v11)
        {
          uint64_t v44 = v119;
          if (v119)
          {
            uint64_t v45 = 0;
            uint64_t v46 = v118;
            do
            {
              char v47 = v36[v45];
              v36[v45] = v35[v45];
              v35[v45] = v47;
              --v46;
              ++v45;
            }
            while (v46 > 1);
          }
          else
          {
            unint64_t v49 = v105 + 1;
            do
            {
              uint64_t v50 = *(void *)&v36[v44];
              *(void *)&v36[v44] = *(void *)&v35[v44];
              *(void *)&v35[v44] = v50;
              v44 += 8;
              --v49;
            }
            while (v49 > 1);
          }
        }
        else
        {
          uint64_t v48 = *(void *)v36;
          *(void *)v36 = *(void *)v35;
          *(void *)int v35 = v48;
        }
        v35 += v10;
        int v34 = 1;
      }
      v36 += v10;
    }
    int64_t v62 = v37 - v38;
    size_t v108 = v37 - v38;
    if (v38 - a1 < v37 - v38) {
      int64_t v62 = v38 - a1;
    }
    if (v62)
    {
      unsigned __int32 v63 = &v37[-v62];
      if (v119)
      {
        uint64_t v64 = (int)v62 + 1;
        v65 = a1;
        do
        {
          char v66 = *v65;
          *v65++ = *v63;
          *v63++ = v66;
          --v64;
        }
        while (v64 > 1);
      }
      else
      {
        unint64_t v67 = ((unint64_t)(int)v62 >> 3) + 1;
        v68 = a1;
        do
        {
          uint64_t v69 = *(void *)v68;
          *(void *)v68 = *(void *)v63;
          v68 += 8;
          *(void *)unsigned __int32 v63 = v69;
          v63 += 8;
          --v67;
        }
        while (v67 > 1);
      }
    }
    int64_t v70 = v35 - v36;
    int v116 = &a1[v109];
    size_t v113 = v35 - v36;
    if (v35 - v36 >= (unint64_t)(&a1[v109] - &v35[__width])) {
      int64_t v70 = &a1[v109] - &v35[__width];
    }
    if (v70)
    {
      v71 = &v116[-v70];
      if (v119)
      {
        uint64_t v72 = (int)v70 + 1;
        do
        {
          char v73 = *v37;
          *v37++ = *v71;
          *v71++ = v73;
          --v72;
        }
        while (v72 > 1);
      }
      else
      {
        unint64_t v74 = ((unint64_t)(int)v70 >> 3) + 1;
        do
        {
          uint64_t v75 = *(void *)v37;
          *(void *)uint64_t v37 = *(void *)v71;
          v37 += 8;
          *(void *)v71 = v75;
          v71 += 8;
          --v74;
        }
        while (v74 > 1);
      }
    }
    if (!v34) {
      break;
    }
LABEL_111:
    if (v108 > __width)
    {
      size_t v76 = v108 / __width;
      if (a6 && v76 > *(void *)(a6 + 40))
      {
        v77 = getargs(a6);
        if (!v77) {
          _psort_cold_1();
        }
        void *v77 = a6;
        v77[1] = a1;
        v77[2] = v76;
        *((_DWORD *)v77 + 6) = v111;
        dispatch_group_async_f(*(dispatch_group_t *)(a6 + 56), *(dispatch_queue_t *)(a6 + 48), v77, (dispatch_function_t)_psort_parallel);
      }
      else
      {
        _psort(a1, v108 / __width, __width, a4, v111, 0);
      }
    }
    if (v113 <= __width) {
      return;
    }
    a1 = &v116[-v113];
    a3 = __width;
    a2 = v113 / __width;
    int v9 = v111;
    if (v110 < 2) {
      goto LABEL_136;
    }
  }
  uint64_t v78 = &a1[__width];
  if (v109 > (uint64_t)__width)
  {
    LODWORD(v79) = 0;
    long long v80 = a1;
    do
    {
      unint64_t v79 = (int)v79;
      v81 = v80;
      uint64_t v114 = v78;
      while (v78 > a1)
      {
        int v82 = v78;
        v78 += v10;
        if (((int (*)(char *, char *))a4)(v78, v82) < 1) {
          break;
        }
        if (v11)
        {
          uint64_t v83 = v119;
          if (v119)
          {
            uint64_t v84 = 0;
            uint64_t v85 = v118;
            do
            {
              char v86 = v82[v84];
              v82[v84] = *((unsigned char *)v81 + v84);
              *((unsigned char *)v81 + v84) = v86;
              --v85;
              ++v84;
            }
            while (v85 > 1);
          }
          else
          {
            unint64_t v88 = v105 + 1;
            size_t v89 = (size_t)v81 + __width;
            do
            {
              uint64_t v90 = *(void *)(v89 + v83);
              *(void *)(v89 + v83) = *(void *)((char *)v81 + v83);
              *(void *)((char *)v81 + v83) = v90;
              v83 += 8;
              --v88;
            }
            while (v88 > 1);
          }
        }
        else
        {
          uint64_t v87 = *(void *)v82;
          *(void *)int v82 = *(void *)v78;
          *(void *)uint64_t v78 = v87;
        }
        ++v79;
        v81 = (void *)((char *)v81 + v10);
        if ((v112 >> 2) + 1 < v79) {
          goto LABEL_111;
        }
      }
      uint64_t v78 = (char *)v114 + __width;
      long long v80 = (void *)((char *)v80 + __width);
    }
    while ((char *)v114 + __width < v116);
  }
}

void _psort_parallel_0(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  _psort_0(*(char **)(a1 + 8), *(void *)(a1 + 16), *(void *)(v2 + 32), *(int (***)(void, void, void))(v2 + 24), *(_DWORD *)(a1 + 24), v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  *(void *)a1 = *(void *)(v2 + 8);
  *(void *)(v2 + 8) = a1;

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
}

void _psort_0(char *a1, size_t a2, int64_t a3, int (**a4)(void, void, void), int a5, uint64_t a6)
{
  if (a5 < 1)
  {
LABEL_135:
    heapsort_b(a1, a2, a3, a4);
    return;
  }
  int v9 = a5;
  int64_t v10 = -a3;
  BOOL v106 = a3 != 8;
  uint64_t v104 = (int)a3;
  unint64_t v105 = (unint64_t)(int)a3 >> 3;
  size_t __width = a3;
  uint64_t v118 = (int)a3 + 1;
  while (1)
  {
    uint64_t v119 = (a1 | a3) & 7;
    int v11 = v106;
    if (((a1 | a3) & 7) != 0) {
      int v11 = 2;
    }
    int v120 = v11;
    int64_t v109 = a2 * a3;
    if (a2 <= 6)
    {
      if (v109 > a3)
      {
        uint64_t v91 = &a1[__width];
        v92 = a1;
        do
        {
          if (v91 > a1)
          {
            int32x2_t v93 = v92;
            unsigned __int32 v94 = v91;
            do
            {
              v95 = v94;
              v94 += v10;
              if (((int (**)(void, char *, char *))a4)[2](a4, v94, v95) < 1) {
                break;
              }
              if (v120)
              {
                uint64_t v96 = v119;
                if (v119)
                {
                  uint64_t v97 = 0;
                  uint64_t v98 = v104 + 1;
                  do
                  {
                    char v99 = v95[v97];
                    v95[v97] = *((unsigned char *)v93 + v97);
                    *((unsigned char *)v93 + v97) = v99;
                    --v98;
                    ++v97;
                  }
                  while (v98 > 1);
                }
                else
                {
                  unint64_t v101 = v105 + 1;
                  size_t v102 = (size_t)v93 + __width;
                  do
                  {
                    uint64_t v103 = *(void *)(v102 + v96);
                    *(void *)(v102 + v96) = *(void *)((char *)v93 + v96);
                    *(void *)((char *)v93 + v96) = v103;
                    v96 += 8;
                    --v101;
                  }
                  while (v101 > 1);
                }
              }
              else
              {
                uint64_t v100 = *(void *)v95;
                *(void *)v95 = *(void *)v94;
                *(void *)unsigned __int32 v94 = v100;
              }
              int32x2_t v93 = (void *)((char *)v93 + v10);
            }
            while (v94 > a1);
          }
          v91 += __width;
          v92 = (void *)((char *)v92 + __width);
        }
        while (v91 < &a1[v109]);
      }
      return;
    }
    sigaction v12 = &a1[(a2 >> 1) * a3];
    size_t v112 = a2;
    int v110 = v9;
    if (a2 != 7)
    {
      int v13 = &a1[(a2 - 1) * a3];
      if (a2 < 0x29)
      {
        signed int v18 = a1;
        int v19 = &a1[(a2 - 1) * a3];
LABEL_38:
        int v25 = ((int (**)(void, char *, char *))a4)[2](a4, v18, v12);
        int v26 = ((int (**)(void, char *, char *))a4)[2](a4, v12, v19);
        if (v25 < 0)
        {
          a2 = v112;
          if ((v26 & 0x80000000) == 0)
          {
            if (((int (**)(void, char *, char *))a4)[2](a4, v18, v19) >= 0) {
              sigaction v12 = v18;
            }
            else {
              sigaction v12 = v19;
            }
          }
        }
        else
        {
          a2 = v112;
          if (v26 <= 0)
          {
            if (((int (**)(void, char *, char *))a4)[2](a4, v18, v19) >= 0) {
              sigaction v12 = v19;
            }
            else {
              sigaction v12 = v18;
            }
          }
        }
        goto LABEL_47;
      }
      size_t v14 = (a2 >> 3) * a3;
      int v15 = ((int (**)(void, char *, char *))a4)[2](a4, a1, &a1[v14]);
      uint64_t v115 = &a1[v14];
      int v16 = ((int (**)(void, char *, char *))a4)[2](a4, &a1[v14], &a1[2 * v14]);
      if (v15 < 0)
      {
        if ((v16 & 0x80000000) == 0)
        {
          if (((int (**)(void, char *, char *))a4)[2](a4, a1, &a1[2 * v14]) >= 0) {
            signed int v17 = a1;
          }
          else {
            signed int v17 = &a1[2 * v14];
          }
          goto LABEL_18;
        }
      }
      else if (v16 <= 0)
      {
        if (((int (**)(void, char *, char *))a4)[2](a4, a1, &a1[2 * v14]) >= 0) {
          signed int v17 = &a1[2 * v14];
        }
        else {
          signed int v17 = a1;
        }
LABEL_18:
        uint64_t v115 = v17;
      }
      int v20 = ((int (**)(void, char *, char *))a4)[2](a4, &v12[-v14], v12);
      int v21 = ((int (**)(void, char *, char *))a4)[2](a4, v12, &v12[v14]);
      if (v20 < 0)
      {
        if ((v21 & 0x80000000) == 0)
        {
          if (((int (**)(void, char *, char *))a4)[2](a4, &v12[-v14], &v12[v14]) >= 0) {
            v12 -= v14;
          }
          else {
            v12 += v14;
          }
        }
      }
      else if (v21 <= 0)
      {
        if (((int (**)(void, char *, char *))a4)[2](a4, &v12[-v14], &v12[v14]) >= 0) {
          v12 += v14;
        }
        else {
          v12 -= v14;
        }
      }
      int v22 = &v13[-2 * v14];
      int v19 = &v13[-v14];
      int v23 = ((int (**)(void, char *, char *))a4)[2](a4, v22, &v13[-v14]);
      int v24 = ((int (**)(void, char *, char *))a4)[2](a4, &v13[-v14], v13);
      if (v23 < 0)
      {
        signed int v18 = v115;
        if ((v24 & 0x80000000) == 0)
        {
          if (((int (**)(void, char *, char *))a4)[2](a4, v22, v13) >= 0) {
            int v19 = v22;
          }
          else {
            int v19 = v13;
          }
        }
      }
      else
      {
        signed int v18 = v115;
        if (v24 <= 0)
        {
          if (((int (**)(void, char *, char *))a4)[2](a4, v22, v13) >= 0) {
            int v19 = v13;
          }
          else {
            int v19 = v22;
          }
        }
      }
      int v9 = v110;
      goto LABEL_38;
    }
LABEL_47:
    if (v120)
    {
      if (v119)
      {
        uint64_t v27 = v118;
        int v28 = a1;
        do
        {
          char v29 = *v28;
          *v28++ = *v12;
          *v12++ = v29;
          --v27;
        }
        while (v27 > 1);
      }
      else
      {
        unint64_t v31 = v105 + 1;
        uint64_t v32 = a1;
        do
        {
          uint64_t v33 = *(void *)v32;
          *(void *)uint64_t v32 = *(void *)v12;
          v32 += 8;
          *(void *)sigaction v12 = v33;
          v12 += 8;
          --v31;
        }
        while (v31 > 1);
      }
    }
    else
    {
      uint64_t v30 = *(void *)a1;
      *(void *)a1 = *(void *)v12;
      *(void *)sigaction v12 = v30;
    }
    int v34 = 0;
    unsigned int v111 = v9 - 1;
    int v35 = &a1[(a2 - 1) * __width];
    v36 = v35;
    uint64_t v37 = &a1[__width];
    int v38 = &a1[__width];
LABEL_56:
    while (v37 <= v36)
    {
      int v39 = ((int (**)(void, char *, char *))a4)[2](a4, v37, a1);
      if (v39 > 0) {
        break;
      }
      if (!v39)
      {
        if (v120)
        {
          uint64_t v40 = v119;
          if (v119)
          {
            uint64_t v41 = 0;
            uint64_t v42 = v118;
            do
            {
              char v43 = v38[v41];
              v38[v41] = v37[v41];
              v37[v41] = v43;
              --v42;
              ++v41;
            }
            while (v42 > 1);
          }
          else
          {
            unint64_t v57 = v105 + 1;
            do
            {
              uint64_t v58 = *(void *)&v38[v40];
              *(void *)&v38[v40] = *(void *)&v37[v40];
              *(void *)&v37[v40] = v58;
              v40 += 8;
              --v57;
            }
            while (v57 > 1);
          }
        }
        else
        {
          uint64_t v56 = *(void *)v38;
          *(void *)int v38 = *(void *)v37;
          *(void *)uint64_t v37 = v56;
        }
        v38 += __width;
        int v34 = 1;
      }
      v37 += __width;
    }
    while (v37 <= v36)
    {
      int v51 = ((int (**)(void, char *, char *))a4)[2](a4, v36, a1);
      if (v51 < 0)
      {
        if (v120)
        {
          uint64_t v52 = v119;
          if (v119)
          {
            uint64_t v53 = 0;
            uint64_t v54 = v118;
            do
            {
              char v55 = v37[v53];
              v37[v53] = v36[v53];
              v36[v53] = v55;
              --v54;
              ++v53;
            }
            while (v54 > 1);
          }
          else
          {
            unint64_t v60 = v105 + 1;
            do
            {
              uint64_t v61 = *(void *)&v37[v52];
              *(void *)&v37[v52] = *(void *)&v36[v52];
              *(void *)&v36[v52] = v61;
              v52 += 8;
              --v60;
            }
            while (v60 > 1);
          }
        }
        else
        {
          uint64_t v59 = *(void *)v37;
          *(void *)uint64_t v37 = *(void *)v36;
          *(void *)v36 = v59;
        }
        v37 += __width;
        v36 += v10;
        int v34 = 1;
        goto LABEL_56;
      }
      if (!v51)
      {
        if (v120)
        {
          uint64_t v44 = v119;
          if (v119)
          {
            uint64_t v45 = 0;
            uint64_t v46 = v118;
            do
            {
              char v47 = v36[v45];
              v36[v45] = v35[v45];
              v35[v45] = v47;
              --v46;
              ++v45;
            }
            while (v46 > 1);
          }
          else
          {
            unint64_t v49 = v105 + 1;
            do
            {
              uint64_t v50 = *(void *)&v36[v44];
              *(void *)&v36[v44] = *(void *)&v35[v44];
              *(void *)&v35[v44] = v50;
              v44 += 8;
              --v49;
            }
            while (v49 > 1);
          }
        }
        else
        {
          uint64_t v48 = *(void *)v36;
          *(void *)v36 = *(void *)v35;
          *(void *)int v35 = v48;
        }
        v35 += v10;
        int v34 = 1;
      }
      v36 += v10;
    }
    int64_t v62 = v37 - v38;
    size_t v108 = v37 - v38;
    if (v38 - a1 < v37 - v38) {
      int64_t v62 = v38 - a1;
    }
    if (v62)
    {
      unsigned __int32 v63 = &v37[-v62];
      if (v119)
      {
        uint64_t v64 = (int)v62 + 1;
        v65 = a1;
        do
        {
          char v66 = *v65;
          *v65++ = *v63;
          *v63++ = v66;
          --v64;
        }
        while (v64 > 1);
      }
      else
      {
        unint64_t v67 = ((unint64_t)(int)v62 >> 3) + 1;
        v68 = a1;
        do
        {
          uint64_t v69 = *(void *)v68;
          *(void *)v68 = *(void *)v63;
          v68 += 8;
          *(void *)unsigned __int32 v63 = v69;
          v63 += 8;
          --v67;
        }
        while (v67 > 1);
      }
    }
    int64_t v70 = v35 - v36;
    int v116 = &a1[v109];
    size_t v113 = v35 - v36;
    if (v35 - v36 >= (unint64_t)(&a1[v109] - &v35[__width])) {
      int64_t v70 = &a1[v109] - &v35[__width];
    }
    if (v70)
    {
      v71 = &v116[-v70];
      if (v119)
      {
        uint64_t v72 = (int)v70 + 1;
        do
        {
          char v73 = *v37;
          *v37++ = *v71;
          *v71++ = v73;
          --v72;
        }
        while (v72 > 1);
      }
      else
      {
        unint64_t v74 = ((unint64_t)(int)v70 >> 3) + 1;
        do
        {
          uint64_t v75 = *(void *)v37;
          *(void *)uint64_t v37 = *(void *)v71;
          v37 += 8;
          *(void *)v71 = v75;
          v71 += 8;
          --v74;
        }
        while (v74 > 1);
      }
    }
    if (!v34) {
      break;
    }
LABEL_110:
    if (v108 > __width)
    {
      size_t v76 = v108 / __width;
      if (a6 && v76 > *(void *)(a6 + 40))
      {
        v77 = getargs(a6);
        if (!v77) {
          _psort_cold_1_0();
        }
        void *v77 = a6;
        v77[1] = a1;
        v77[2] = v76;
        *((_DWORD *)v77 + 6) = v111;
        dispatch_group_async_f(*(dispatch_group_t *)(a6 + 56), *(dispatch_queue_t *)(a6 + 48), v77, (dispatch_function_t)_psort_parallel_0);
      }
      else
      {
        _psort_0(a1, v108 / __width, __width, a4, v111, 0);
      }
    }
    if (v113 <= __width) {
      return;
    }
    a1 = &v116[-v113];
    a3 = __width;
    a2 = v113 / __width;
    int v9 = v111;
    if (v110 < 2) {
      goto LABEL_135;
    }
  }
  uint64_t v78 = &a1[__width];
  if (v109 > (uint64_t)__width)
  {
    LODWORD(v79) = 0;
    long long v80 = a1;
    do
    {
      unint64_t v79 = (int)v79;
      v81 = v80;
      uint64_t v114 = v78;
      while (v78 > a1)
      {
        int v82 = v78;
        v78 += v10;
        if (((int (**)(void, char *, char *))a4)[2](a4, v78, v82) < 1) {
          break;
        }
        if (v120)
        {
          uint64_t v83 = v119;
          if (v119)
          {
            uint64_t v84 = 0;
            uint64_t v85 = v118;
            do
            {
              char v86 = v82[v84];
              v82[v84] = *((unsigned char *)v81 + v84);
              *((unsigned char *)v81 + v84) = v86;
              --v85;
              ++v84;
            }
            while (v85 > 1);
          }
          else
          {
            unint64_t v88 = v105 + 1;
            size_t v89 = (size_t)v81 + __width;
            do
            {
              uint64_t v90 = *(void *)(v89 + v83);
              *(void *)(v89 + v83) = *(void *)((char *)v81 + v83);
              *(void *)((char *)v81 + v83) = v90;
              v83 += 8;
              --v88;
            }
            while (v88 > 1);
          }
        }
        else
        {
          uint64_t v87 = *(void *)v82;
          *(void *)int v82 = *(void *)v78;
          *(void *)uint64_t v78 = v87;
        }
        ++v79;
        v81 = (void *)((char *)v81 + v10);
        if ((v112 >> 2) + 1 < v79) {
          goto LABEL_110;
        }
      }
      uint64_t v78 = (char *)v114 + __width;
      long long v80 = (void *)((char *)v80 + __width);
    }
    while ((char *)v114 + __width < v116);
  }
}

void psort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
  if (__nel >= 0x7D0
    && (_get_cpu_capabilities() & 0xFE0000) != 0
    && (long long v19 = 0u, *(_OWORD *)group = 0u,
                  *(_OWORD *)signed int v17 = 0u,
                  long long v18 = 0u,
                  long long v16 = 0u,
                  (int64_t v10 = getargs_0((uint64_t)&v16)) != 0))
  {
    uint64_t v11 = (uint64_t)v10;
    *(void *)&long long v16 = "psort_r";
    v17[1] = a4;
    *(void *)&long long v18 = __compar;
    *((void *)&v18 + 1) = __width;
    *((void *)&v19 + 1) = dispatch_get_global_queue(0, 0);
    group[0] = dispatch_group_create();
    *(void *)(v11 + 8) = __base;
    *(void *)(v11 + 16) = __nel;
    *(_DWORD *)(v11 + 24) = 2 * flsl(__nel) - 2;
    *(void *)uint64_t v11 = &v16;
    int v12 = flsl(__nel);
    if (v12 >= 0) {
      int v13 = v12;
    }
    else {
      int v13 = v12 + 1;
    }
    *(void *)&long long v19 = ((1 << (v13 >> 1)) + (__nel >> (v13 >> 1))) >> 1;
    _psort_parallel_1(v11);
    dispatch_group_wait(group[0], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(group[0]);
    size_t v14 = v17[0];
    if (v17[0])
    {
      do
      {
        int v15 = (void *)*v14;
        munmap(v14, 0x1000uLL);
        size_t v14 = v15;
      }
      while (v15);
    }
  }
  else
  {
    qsort_r(__base, __nel, __width, a4, __compar);
  }
}

void *getargs_0(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 72);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  unsigned int v3 = *(void **)(a1 + 8);
  if (!v3)
  {
    char v4 = mmap(0, 0x1000uLL, 3, 4098, -1, 0);
    if (!v4) {
      return 0;
    }
    char v5 = 0;
    *char v4 = *(void *)(a1 + 16);
    unsigned int v3 = v4 - 3;
    *(void *)(a1 + 16) = v4;
    int v6 = v4 + 1;
    for (unsigned int i = 128; i > 1; --i)
    {
      v3[4] = v5;
      v3 += 4;
      char v5 = v6;
      v6 += 4;
    }
    *(void *)(a1 + 8) = v3;
  }
  *(void *)(a1 + 8) = *v3;
  os_unfair_lock_unlock(v2);
  return v3;
}

void _psort_parallel_1(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  _psort_1(*(char **)(a1 + 8), *(void *)(a1 + 16), *(void *)(v2 + 40), *(void *)(v2 + 24), *(uint64_t (**)(uint64_t, char *, char *))(v2 + 32), *(_DWORD *)(a1 + 24), v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 72));
  *(void *)a1 = *(void *)(v2 + 8);
  *(void *)(v2 + 8) = a1;

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 72));
}

void _psort_1(char *a1, unint64_t a2, int64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, char *, char *), int a6, uint64_t a7)
{
  if (a6 < 1)
  {
LABEL_135:
    __heapsort_r(a1, a2, a3, a4, a5);
    return;
  }
  int v11 = a6;
  int64_t v12 = -a3;
  BOOL v107 = a3 != 8;
  uint64_t v105 = (int)a3;
  unint64_t v106 = (unint64_t)(int)a3 >> 3;
  size_t size = a3;
  uint64_t v120 = (int)a3 + 1;
  while (1)
  {
    uint64_t v121 = (a1 | a3) & 7;
    int v13 = v107;
    if (((a1 | a3) & 7) != 0) {
      int v13 = 2;
    }
    int v122 = v13;
    int64_t v111 = a2 * a3;
    if (a2 <= 6)
    {
      if (v111 > a3)
      {
        v92 = &a1[size];
        int32x2_t v93 = a1;
        do
        {
          if (v92 > a1)
          {
            unsigned __int32 v94 = v93;
            v95 = v92;
            do
            {
              uint64_t v96 = v95;
              v95 += v12;
              if ((int)a5(a4, v95, v96) < 1) {
                break;
              }
              if (v122)
              {
                uint64_t v97 = v121;
                if (v121)
                {
                  uint64_t v98 = 0;
                  uint64_t v99 = v105 + 1;
                  do
                  {
                    char v100 = v96[v98];
                    v96[v98] = v94[v98];
                    v94[v98] = v100;
                    --v99;
                    ++v98;
                  }
                  while (v99 > 1);
                }
                else
                {
                  unint64_t v102 = v106 + 1;
                  uint64_t v103 = &v94[size];
                  do
                  {
                    uint64_t v104 = *(void *)&v103[v97];
                    *(void *)&v103[v97] = *(void *)&v94[v97];
                    *(void *)&v94[v97] = v104;
                    v97 += 8;
                    --v102;
                  }
                  while (v102 > 1);
                }
              }
              else
              {
                uint64_t v101 = *(void *)v96;
                *(void *)uint64_t v96 = *(void *)v95;
                *(void *)v95 = v101;
              }
              v94 += v12;
            }
            while (v95 > a1);
          }
          v92 += size;
          v93 += size;
        }
        while (v92 < &a1[v111]);
      }
      return;
    }
    size_t v14 = &a1[(a2 >> 1) * a3];
    int v112 = v11;
    unint64_t v109 = a2;
    if (a2 != 7)
    {
      int v15 = &a1[(a2 - 1) * a3];
      if (a2 < 0x29)
      {
        int v20 = a1;
LABEL_38:
        int v26 = a5(a4, v20, v14);
        int v27 = a5(a4, v14, v15);
        if (v26 < 0)
        {
          if ((v27 & 0x80000000) == 0)
          {
            if ((int)a5(a4, v20, v15) >= 0) {
              size_t v14 = v20;
            }
            else {
              size_t v14 = v15;
            }
          }
        }
        else if (v27 <= 0)
        {
          if ((int)a5(a4, v20, v15) >= 0) {
            size_t v14 = v15;
          }
          else {
            size_t v14 = v20;
          }
        }
        goto LABEL_47;
      }
      uint64_t v115 = &a1[(a2 - 1) * a3];
      unint64_t v16 = (a2 >> 3) * a3;
      int v17 = a5(a4, a1, &a1[v16]);
      uint64_t v117 = &a1[v16];
      int v18 = a5(a4, &a1[v16], &a1[2 * v16]);
      if (v17 < 0)
      {
        if ((v18 & 0x80000000) == 0)
        {
          if ((int)a5(a4, a1, &a1[2 * v16]) >= 0) {
            long long v19 = a1;
          }
          else {
            long long v19 = &a1[2 * v16];
          }
          goto LABEL_18;
        }
      }
      else if (v18 <= 0)
      {
        if ((int)a5(a4, a1, &a1[2 * v16]) >= 0) {
          long long v19 = &a1[2 * v16];
        }
        else {
          long long v19 = a1;
        }
LABEL_18:
        uint64_t v117 = v19;
      }
      int v21 = a5(a4, &v14[-v16], v14);
      int v22 = a5(a4, v14, &v14[v16]);
      if (v21 < 0)
      {
        if ((v22 & 0x80000000) == 0)
        {
          if ((int)a5(a4, &v14[-v16], &v14[v16]) >= 0) {
            v14 -= v16;
          }
          else {
            v14 += v16;
          }
        }
      }
      else if (v22 <= 0)
      {
        if ((int)a5(a4, &v14[-v16], &v14[v16]) >= 0) {
          v14 += v16;
        }
        else {
          v14 -= v16;
        }
      }
      int v23 = &v115[-2 * v16];
      int v15 = &v115[-v16];
      int v24 = a5(a4, v23, &v115[-v16]);
      int v25 = a5(a4, &v115[-v16], v115);
      if (v24 < 0)
      {
        int v20 = v117;
        if ((v25 & 0x80000000) == 0)
        {
          if ((int)a5(a4, v23, v115) >= 0) {
            int v15 = v23;
          }
          else {
            int v15 = v115;
          }
        }
      }
      else
      {
        int v20 = v117;
        if (v25 <= 0)
        {
          if ((int)a5(a4, v23, v115) >= 0) {
            int v15 = v115;
          }
          else {
            int v15 = v23;
          }
        }
      }
      int v11 = v112;
      a2 = v109;
      goto LABEL_38;
    }
LABEL_47:
    if (v122)
    {
      if (v121)
      {
        uint64_t v28 = v120;
        char v29 = a1;
        do
        {
          char v30 = *v29;
          *v29++ = *v14;
          *v14++ = v30;
          --v28;
        }
        while (v28 > 1);
      }
      else
      {
        unint64_t v32 = v106 + 1;
        uint64_t v33 = a1;
        do
        {
          uint64_t v34 = *(void *)v33;
          *(void *)uint64_t v33 = *(void *)v14;
          v33 += 8;
          *(void *)size_t v14 = v34;
          v14 += 8;
          --v32;
        }
        while (v32 > 1);
      }
    }
    else
    {
      uint64_t v31 = *(void *)a1;
      *(void *)a1 = *(void *)v14;
      *(void *)size_t v14 = v31;
    }
    int v35 = 0;
    unsigned int v113 = v11 - 1;
    v36 = &a1[size];
    uint64_t v37 = &a1[(a2 - 1) * size];
    int v38 = v37;
    int v39 = &a1[size];
LABEL_56:
    while (v39 <= v38)
    {
      int v40 = a5(a4, v39, a1);
      if (v40 > 0) {
        break;
      }
      if (!v40)
      {
        if (v122)
        {
          uint64_t v41 = v121;
          if (v121)
          {
            uint64_t v42 = 0;
            uint64_t v43 = v120;
            do
            {
              char v44 = v36[v42];
              v36[v42] = v39[v42];
              v39[v42] = v44;
              --v43;
              ++v42;
            }
            while (v43 > 1);
          }
          else
          {
            unint64_t v58 = v106 + 1;
            do
            {
              uint64_t v59 = *(void *)&v36[v41];
              *(void *)&v36[v41] = *(void *)&v39[v41];
              *(void *)&v39[v41] = v59;
              v41 += 8;
              --v58;
            }
            while (v58 > 1);
          }
        }
        else
        {
          uint64_t v57 = *(void *)v36;
          *(void *)v36 = *(void *)v39;
          *(void *)int v39 = v57;
        }
        v36 += size;
        int v35 = 1;
      }
      v39 += size;
    }
    while (v39 <= v38)
    {
      int v52 = a5(a4, v38, a1);
      if (v52 < 0)
      {
        if (v122)
        {
          uint64_t v53 = v121;
          if (v121)
          {
            uint64_t v54 = 0;
            uint64_t v55 = v120;
            do
            {
              char v56 = v39[v54];
              v39[v54] = v38[v54];
              v38[v54] = v56;
              --v55;
              ++v54;
            }
            while (v55 > 1);
          }
          else
          {
            unint64_t v61 = v106 + 1;
            do
            {
              uint64_t v62 = *(void *)&v39[v53];
              *(void *)&v39[v53] = *(void *)&v38[v53];
              *(void *)&v38[v53] = v62;
              v53 += 8;
              --v61;
            }
            while (v61 > 1);
          }
        }
        else
        {
          uint64_t v60 = *(void *)v39;
          *(void *)int v39 = *(void *)v38;
          *(void *)int v38 = v60;
        }
        v39 += size;
        v38 += v12;
        int v35 = 1;
        goto LABEL_56;
      }
      if (!v52)
      {
        if (v122)
        {
          uint64_t v45 = v121;
          if (v121)
          {
            uint64_t v46 = 0;
            uint64_t v47 = v120;
            do
            {
              char v48 = v38[v46];
              v38[v46] = v37[v46];
              v37[v46] = v48;
              --v47;
              ++v46;
            }
            while (v47 > 1);
          }
          else
          {
            unint64_t v50 = v106 + 1;
            do
            {
              uint64_t v51 = *(void *)&v38[v45];
              *(void *)&v38[v45] = *(void *)&v37[v45];
              *(void *)&v37[v45] = v51;
              v45 += 8;
              --v50;
            }
            while (v50 > 1);
          }
        }
        else
        {
          uint64_t v49 = *(void *)v38;
          *(void *)int v38 = *(void *)v37;
          *(void *)uint64_t v37 = v49;
        }
        v37 += v12;
        int v35 = 1;
      }
      v38 += v12;
    }
    int64_t v63 = v39 - v36;
    size_t v110 = v39 - v36;
    if (v36 - a1 < v39 - v36) {
      int64_t v63 = v36 - a1;
    }
    if (v63)
    {
      uint64_t v64 = &v39[-v63];
      if (v121)
      {
        uint64_t v65 = (int)v63 + 1;
        char v66 = a1;
        do
        {
          char v67 = *v66;
          *v66++ = *v64;
          *v64++ = v67;
          --v65;
        }
        while (v65 > 1);
      }
      else
      {
        unint64_t v68 = ((unint64_t)(int)v63 >> 3) + 1;
        uint64_t v69 = a1;
        do
        {
          uint64_t v70 = *(void *)v69;
          *(void *)uint64_t v69 = *(void *)v64;
          v69 += 8;
          *(void *)uint64_t v64 = v70;
          v64 += 8;
          --v68;
        }
        while (v68 > 1);
      }
    }
    int64_t v71 = v37 - v38;
    uint64_t v118 = &a1[v111];
    size_t v114 = v37 - v38;
    if (v37 - v38 >= (unint64_t)(&a1[v111] - &v37[size])) {
      int64_t v71 = &a1[v111] - &v37[size];
    }
    if (v71)
    {
      uint64_t v72 = &v118[-v71];
      if (v121)
      {
        uint64_t v73 = (int)v71 + 1;
        do
        {
          char v74 = *v39;
          *v39++ = *v72;
          *v72++ = v74;
          --v73;
        }
        while (v73 > 1);
      }
      else
      {
        unint64_t v75 = ((unint64_t)(int)v71 >> 3) + 1;
        do
        {
          uint64_t v76 = *(void *)v39;
          *(void *)int v39 = *(void *)v72;
          v39 += 8;
          *(void *)uint64_t v72 = v76;
          v72 += 8;
          --v75;
        }
        while (v75 > 1);
      }
    }
    if (!v35) {
      break;
    }
LABEL_110:
    if (v110 > size)
    {
      size_t v77 = v110 / size;
      if (a7 && v77 > *(void *)(a7 + 48))
      {
        uint64_t v78 = getargs_0(a7);
        if (!v78) {
          _psort_cold_1_1();
        }
        *uint64_t v78 = a7;
        v78[1] = a1;
        v78[2] = v77;
        *((_DWORD *)v78 + 6) = v113;
        dispatch_group_async_f(*(dispatch_group_t *)(a7 + 64), *(dispatch_queue_t *)(a7 + 56), v78, (dispatch_function_t)_psort_parallel_1);
      }
      else
      {
        _psort_1(a1, v110 / size, size, a4, a5, v113, 0);
      }
    }
    if (v114 <= size) {
      return;
    }
    a1 = &v118[-v114];
    a3 = size;
    a2 = v114 / size;
    int v11 = v113;
    if (v112 < 2) {
      goto LABEL_135;
    }
  }
  unint64_t v79 = &a1[size];
  if (v111 > (uint64_t)size)
  {
    LODWORD(v80) = 0;
    v81 = a1;
    do
    {
      unint64_t v80 = (int)v80;
      int v82 = v81;
      int v116 = v79;
      while (v79 > a1)
      {
        uint64_t v83 = v79;
        v79 += v12;
        if ((int)a5(a4, v79, v83) < 1) {
          break;
        }
        if (v122)
        {
          uint64_t v84 = v121;
          if (v121)
          {
            uint64_t v85 = 0;
            uint64_t v86 = v120;
            do
            {
              char v87 = v83[v85];
              v83[v85] = v82[v85];
              v82[v85] = v87;
              --v86;
              ++v85;
            }
            while (v86 > 1);
          }
          else
          {
            unint64_t v89 = v106 + 1;
            uint64_t v90 = &v82[size];
            do
            {
              uint64_t v91 = *(void *)&v90[v84];
              *(void *)&v90[v84] = *(void *)&v82[v84];
              *(void *)&v82[v84] = v91;
              v84 += 8;
              --v89;
            }
            while (v89 > 1);
          }
        }
        else
        {
          uint64_t v88 = *(void *)v83;
          *(void *)uint64_t v83 = *(void *)v79;
          *(void *)unint64_t v79 = v88;
        }
        ++v80;
        v82 += v12;
        if ((v109 >> 2) + 1 < v80) {
          goto LABEL_110;
        }
      }
      unint64_t v79 = &v116[size];
      v81 += size;
    }
    while (&v116[size] < v118);
  }
}

int scandir_b(const char *a1, dirent ***a2, void *a3, void *a4)
{
  int v7 = opendir(a1);
  if (!v7) {
    goto LABEL_20;
  }
  int v8 = v7;
  int v9 = malloc_type_malloc(0x100uLL, 0x2004093837F09uLL);
  if (!v9)
  {
LABEL_19:
    free(v9);
    closedir(v8);
LABEL_20:
    LODWORD(v10) = -1;
    return v10;
  }
  long long v19 = a2;
  size_t v10 = 0;
  uint64_t v11 = -1;
  unint64_t v12 = 32;
  while (1)
  {
    int v13 = readdir(v8);
    if (!v13) {
      break;
    }
    size_t v14 = v13;
    if (!a3 || (*((unsigned int (**)(void *, dirent *))a3 + 2))(a3, v13))
    {
      int v15 = (char *)malloc_type_malloc(((v14->d_namlen + 4) & 0x1FFFC) + 24, 0xD5DB3AF2uLL);
      if (!v15) {
        goto LABEL_17;
      }
      unint64_t v16 = v15;
      *(void *)int v15 = v14->d_ino;
      v15[20] = v14->d_type;
      *((_WORD *)v15 + 8) = v14->d_reclen;
      *((_WORD *)v15 + 9) = v14->d_namlen;
      j__mkostemp(v15 + 21, v14 + 21);
      if (v10 >= v12)
      {
        int v17 = malloc_type_realloc(v9, 16 * v12, 0x2004093837F09uLL);
        if (!v17)
        {
          free(v16);
LABEL_17:
          if (v10)
          {
            do
              free(*((void **)v9 + v11--));
            while (v11 != -1);
          }
          goto LABEL_19;
        }
        v12 *= 2;
        int v9 = v17;
      }
      *((void *)v9 + v10++) = v16;
      ++v11;
    }
  }
  closedir(v8);
  if (a4 && v10) {
    qsort_b(v9, v10, 8uLL, a4);
  }
  char *v19 = (dirent **)v9;
  return v10;
}

uint64_t __printf_arginfo_errno(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_errno_cold_1();
  }
  *a3 = 1;
  return 1;
}

uint64_t __printf_render_errno(uint64_t *a1, uint64_t a2, int **a3)
{
  int v5 = **a3;
  if (v5 < 0 || v5 >= 107)
  {
    sprintf(v15, "errno=%d/0x%x", **a3, v5);
    uint64_t v13 = j__strsignal_r((int)v15, v11, v12);
    uint64_t v14 = __printf_out((uint64_t)a1, a2, (uint64_t)v15, v13);
    __printf_flush(a1);
    return v14;
  }
  else
  {
    int v6 = strerror(v5);
    uint64_t v9 = j__strsignal_r((int)v6, v7, v8);
    return __printf_out((uint64_t)a1, a2, (uint64_t)v6, v9);
  }
}

uint64_t __printf_arginfo_float(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_float_cold_1();
  }
  if (*(__int16 *)(a1 + 40) < 0)
  {
    int v3 = 256;
  }
  else
  {
    *a3 = 128;
    if (*(_WORD *)(a1 + 40)) {
      int v3 = 65664;
    }
    else {
      int v3 = 128;
    }
  }
  *a3 = v3;
  return 1;
}

uint64_t __printf_render_float(uint64_t *a1, uint64_t a2, double **a3)
{
  if (*(__int16 *)(a2 + 40) < 0)
  {
    return __xprintf_vector(a1, a2, (_DWORD **)a3);
  }
  else
  {
    int v6 = *(_DWORD *)(a2 + 20);
    char v74 = 0;
    char v76 = *(_DWORD *)(a2 + 36);
    thousands_sep = localeconv_l(*(locale_t *)(a2 + 8))->thousands_sep;
    uint64_t v71 = j__strsignal_r((int)thousands_sep, v7, v8);
    if ((*(_WORD *)(a2 + 40) & 0x100) != 0)
    {
      uint64_t v11 = localeconv_l(*(locale_t *)(a2 + 8));
      fixed = __fix_nogrouping(v11->grouping);
    }
    else
    {
      fixed = 0;
    }
    int v78 = 0;
    int v79 = 0;
    size_t v77 = 0;
    double v75 = 0.0;
    decimal_point = localeconv_l(*(locale_t *)(a2 + 8))->decimal_point;
    uint64_t v15 = j__strsignal_r((int)decimal_point, v13, v14);
    LOBYTE(v16) = 0;
    int v17 = *(_DWORD *)(a2 + 28);
    uint64_t v65 = decimal_point;
    uint64_t v66 = v15;
    if (!(!v19 & v18))
    {
      switch(v17)
      {
        case 'A':
          goto LABEL_12;
        case 'B':
        case 'C':
        case 'D':
          goto LABEL_179;
        case 'E':
          goto LABEL_23;
        case 'F':
          goto LABEL_29;
        case 'G':
          goto LABEL_27;
        default:
          JUMPOUT(0);
      }
    }
    switch(v17)
    {
      case 'a':
LABEL_12:
        BOOL v19 = v17 == 97;
        if (v17 == 97) {
          char v20 = 120;
        }
        else {
          char v20 = 88;
        }
        if (v19) {
          LOBYTE(v16) = 112;
        }
        else {
          LOBYTE(v16) = 80;
        }
        if (v19) {
          int v21 = &__lowercase_hex;
        }
        else {
          int v21 = &__uppercase_hex;
        }
        char v74 = v20;
        uint64_t v22 = v6 + (v6 >= 0);
        if (*(_WORD *)(a2 + 40))
        {
          double v75 = **a3;
          int v23 = (char *)__hldtoa(v21, v22, &v79, &v78, &v77);
        }
        else
        {
          int v23 = __hdtoa((uint64_t)v21, v22, &v79, &v78, &v77, **a3);
        }
        int v26 = v23;
        if ((int)v22 >= 0) {
          int v24 = v22;
        }
        else {
          int v24 = v77 - v23;
        }
        if (v79 == 0x7FFFFFFF) {
          char v74 = 0;
        }
        goto LABEL_48;
      case 'e':
LABEL_23:
        if (v6 >= 0) {
          ++v6;
        }
        else {
          int v6 = 7;
        }
        int v16 = *(_DWORD *)(a2 + 28);
        goto LABEL_29;
      case 'f':
        goto LABEL_29;
      case 'g':
LABEL_27:
        LOBYTE(v16) = v17 - 2;
        if (v6 <= 1) {
          int v6 = 1;
        }
LABEL_29:
        if (v6 >= 0) {
          int v24 = v6;
        }
        else {
          int v24 = 6;
        }
        if (*(_WORD *)(a2 + 40))
        {
          double v75 = **a3;
          if ((_BYTE)v16) {
            unsigned int v27 = 2;
          }
          else {
            unsigned int v27 = 3;
          }
          int v26 = __ldtoa(&v75, v27, v24, &v79, &v78, &v77);
        }
        else
        {
          if ((_BYTE)v16) {
            unsigned int v25 = 2;
          }
          else {
            unsigned int v25 = 3;
          }
          int v26 = __dtoa(v25, v24, &v79, &v78, &v77, **a3);
          if (v79 == 9999) {
            int v79 = 0x7FFFFFFF;
          }
        }
LABEL_48:
        if (v78) {
          char v76 = 45;
        }
        int v28 = v79;
        uint64_t v70 = v26;
        if (v79 == 0x7FFFFFFF)
        {
          char v67 = v16;
          int v29 = *(_DWORD *)(a2 + 28);
          if (*v26 == 78)
          {
            uint64_t v64 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            if (v29 <= 96) {
              int v26 = "NAN";
            }
            else {
              int v26 = "nan";
            }
            char v76 = 0;
          }
          else
          {
            uint64_t v64 = 0;
            int v30 = 0;
            int v31 = 0;
            int v32 = 0;
            if (v29 <= 96) {
              int v26 = "INF";
            }
            else {
              int v26 = "inf";
            }
          }
          uint64_t v34 = 3;
          int v68 = v24;
          goto LABEL_115;
        }
        LODWORD(v64) = v77 - v26;
        if ((*(_DWORD *)(a2 + 28) | 0x20) == 0x67)
        {
          if ((*(_WORD *)(a2 + 40) & 0x10) != 0) {
            int v33 = v24;
          }
          else {
            int v33 = v77 - v26;
          }
          if (v79 >= -3 && v79 <= v24)
          {
            int v33 = (v33 - v79) & ~((v33 - v79) >> 31);
LABEL_82:
            if (v79 <= 0) {
              uint64_t v34 = 1;
            }
            else {
              uint64_t v34 = v79;
            }
            if (v33 || (*(_WORD *)(a2 + 40) & 0x10) != 0) {
              uint64_t v34 = (v34 + v33 + 1);
            }
            int v31 = 0;
            int v68 = v33;
            if (fixed && v79 >= 1)
            {
              int v30 = 0;
              int v45 = (char)*fixed;
              if (v45 == 127 || v79 <= v45)
              {
                int v31 = 0;
                int v32 = v79;
              }
              else
              {
                int v31 = 0;
                int v30 = 0;
                int v32 = v79;
                do
                {
                  v32 -= v45;
                  if (fixed[1]) {
                    ++v30;
                  }
                  else {
                    ++v31;
                  }
                  if (fixed[1]) {
                    ++fixed;
                  }
                  int v45 = (char)*fixed;
                }
                while (v45 != 127 && v32 > v45);
              }
              char v67 = 0;
              HIDWORD(v64) = 0;
              uint64_t v34 = (v30 + v34 + v31);
            }
            else
            {
              HIDWORD(v64) = 0;
              int v30 = 0;
              char v67 = 0;
              int v32 = v79;
            }
            goto LABEL_115;
          }
        }
        else
        {
          int v33 = v24;
        }
        if (!(_BYTE)v16) {
          goto LABEL_82;
        }
        unsigned int v35 = v79 - 1;
        v83[0] = v16;
        if (v79 >= 1) {
          char v36 = 43;
        }
        else {
          char v36 = 45;
        }
        if (v79 - 1 < 0) {
          unsigned int v35 = 1 - v79;
        }
        uint64_t v37 = &v84;
        v83[1] = v36;
        if (v35 < 0xA)
        {
          if ((v16 & 0xDF) == 0x45)
          {
            uint64_t v37 = v85;
            char v84 = 48;
          }
          char *v37 = v35 + 48;
          LODWORD(v37) = v37 + 1;
        }
        else
        {
          uint64_t v38 = 0;
          do
          {
            unsigned int v39 = v35;
            v35 /= 0xAu;
            v81[v38-- + 4] = (v39 - 10 * v35) | 0x30;
          }
          while (v39 > 0x63);
          uint64_t v40 = v38 + 5;
          uint64_t v41 = v81 + v38 + 4;
          char *v41 = v35 + 48;
          if (v38 + 7 <= 7)
          {
            uint64_t v42 = &v83[-v38 - 2];
            int v43 = v33;
            j__mkdtempat_np((int)&v84, v41);
            if (v40 <= 5) {
              int v44 = 5;
            }
            else {
              int v44 = v40;
            }
            int v33 = v43;
            LODWORD(v37) = v42 + v44;
          }
        }
        HIDWORD(v64) = v37 - (&vars0 - 104);
        uint64_t v34 = (v33 + HIDWORD(v64));
        int v68 = v33;
        if (v33 > 1 || (*(_WORD *)(a2 + 40) & 0x10) != 0)
        {
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
          uint64_t v34 = (v34 + 1);
        }
        else
        {
          int v30 = 0;
          int v31 = 0;
          int v32 = 0;
        }
        char v67 = 1;
LABEL_115:
        if ((int)v34 < 0) {
          int v47 = -1;
        }
        else {
          int v47 = v34;
        }
        if (v76) {
          ++v47;
        }
        if (v74) {
          v47 += 2;
        }
        int v69 = v47;
        if (*(_DWORD *)(a2 + 32) == 48 || (*(_WORD *)(a2 + 40) & 0x40) != 0)
        {
          int v48 = 0;
          if (!v76) {
            goto LABEL_128;
          }
        }
        else
        {
          int v48 = __printf_pad((uint64_t)a1, (*(_DWORD *)(a2 + 24) - v47), 0);
          if (!v76) {
            goto LABEL_128;
          }
        }
        v48 += __printf_puts((uint64_t)a1, (uint64_t)&v76, 1);
LABEL_128:
        if (v74)
        {
          char v73 = 48;
          v48 += __printf_puts((uint64_t)a1, (uint64_t)&v73, 2);
        }
        if (*(_DWORD *)(a2 + 32) == 48 && (*(_WORD *)(a2 + 40) & 0x40) == 0) {
          v48 += __printf_pad((uint64_t)a1, (*(_DWORD *)(a2 + 24) - v69), 1);
        }
        int v49 = __printf_pad((uint64_t)a1, ~v34, 1) + v48;
        if (v28 == 0x7FFFFFFF)
        {
          uint64_t v50 = __printf_puts((uint64_t)a1, (uint64_t)v26, v34) + v49;
LABEL_141:
          uint64_t v54 = (uint64_t)v70;
          goto LABEL_142;
        }
        if (v67)
        {
          if (v68 > 1 || (*(_WORD *)(a2 + 40) & 0x10) != 0)
          {
            char v80 = *v26;
            j__mkdtempat_np((int)v81, v65);
            int v52 = __printf_puts((uint64_t)a1, (uint64_t)&v80, (v66 + 1));
            int v53 = v52 + __printf_puts((uint64_t)a1, (uint64_t)(v26 + 1), (v64 - 1));
            int v51 = v53 + __printf_pad((uint64_t)a1, (v68 - v64), 1) + v49;
          }
          else
          {
            int v51 = __printf_puts((uint64_t)a1, (uint64_t)v26, 1) + v49;
          }
          uint64_t v50 = __printf_puts((uint64_t)a1, (uint64_t)v83, HIDWORD(v64)) + v51;
          goto LABEL_141;
        }
        if (v79 <= 0)
        {
          int v62 = __printf_puts((uint64_t)a1, (uint64_t)"0", 1) + v49;
          if (v68 || (*(_WORD *)(a2 + 40) & 0x10) != 0) {
            v62 += __printf_puts((uint64_t)a1, (uint64_t)v65, v66);
          }
          int v56 = __printf_pad((uint64_t)a1, -v79, 1) + v62;
          int v61 = v79 + v68;
        }
        else
        {
          if (v32 >= (int)v77 - (int)v26) {
            uint64_t v55 = (v77 - v26);
          }
          else {
            uint64_t v55 = v32;
          }
          if ((int)v55 >= 1) {
            v49 += __printf_puts((uint64_t)a1, (uint64_t)v26, v55);
          }
          int v56 = __printf_pad((uint64_t)a1, v32 - (v55 & ~((int)v55 >> 31)), 1) + v49;
          v26 += v32;
          if (fixed)
          {
            BOOL v57 = v31 > 0;
            if (v30 > 0 || v31 >= 1)
            {
              do
              {
                fixed -= !v57;
                int v58 = __printf_puts((uint64_t)a1, (uint64_t)thousands_sep, v71) + v56;
                int v59 = (char)*fixed;
                if ((int)v77 - (int)v26 >= v59) {
                  uint64_t v60 = v59;
                }
                else {
                  uint64_t v60 = (v77 - v26);
                }
                if ((int)v60 >= 1)
                {
                  v58 += __printf_puts((uint64_t)a1, (uint64_t)v26, v60);
                  int v59 = (char)*fixed;
                }
                v30 -= !v57;
                v31 -= v57;
                int v56 = __printf_pad((uint64_t)a1, v59 - (v60 & ~((int)v60 >> 31)), 1) + v58;
                v26 += (char)*fixed;
                BOOL v57 = v31 > 0;
              }
              while (v30 > 0 || v31 > 0);
            }
            if (v26 > v77) {
              int v26 = v77;
            }
          }
          int v61 = v68;
          if (v68 || (*(_WORD *)(a2 + 40) & 0x10) != 0) {
            v56 += __printf_puts((uint64_t)a1, (uint64_t)v65, v66);
          }
          else {
            int v61 = 0;
          }
        }
        if (v61 >= (int)v77 - (int)v26) {
          uint64_t v63 = (v77 - v26);
        }
        else {
          uint64_t v63 = v61;
        }
        if ((int)v63 >= 1) {
          v56 += __printf_puts((uint64_t)a1, (uint64_t)v26, v63);
        }
        uint64_t v54 = (uint64_t)v70;
        uint64_t v50 = __printf_pad((uint64_t)a1, v61 - (v63 & ~((int)v63 >> 31)), 1) + v56;
LABEL_142:
        if ((*(_WORD *)(a2 + 40) & 0x40) != 0) {
          uint64_t v50 = __printf_pad((uint64_t)a1, (*(_DWORD *)(a2 + 24) - v69), 0)
        }
              + v50;
        __printf_flush(a1);
        if (v54) {
          __freedtoa(v54);
        }
        uint64_t result = v50;
        break;
      default:
LABEL_179:
        __printf_render_float_cold_1();
    }
  }
  return result;
}

uint64_t __printf_arginfo_hexdump(uint64_t a1, unint64_t a2, void *a3)
{
  if (a2 <= 1) {
    __printf_arginfo_hexdump_cold_1();
  }
  *a3 = 0x100000020;
  return 2;
}

uint64_t __printf_render_hexdump(uint64_t *a1, uint64_t a2, unsigned __int8 ***a3)
{
  int v3 = *(_DWORD *)(a2 + 24);
  unsigned int v4 = v3 - 1;
  if ((v3 - 1) >= 0xF) {
    int v3 = 16;
  }
  unsigned int v28 = v3;
  unsigned int v5 = *(_DWORD *)a3[1];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = a2;
  LODWORD(v7) = 0;
  int v8 = 0;
  uint64_t v9 = **a3;
  if (v4 >= 0xF) {
    unsigned int v4 = 15;
  }
  unsigned int v26 = v4;
  unsigned int v25 = v4 + 1;
  do
  {
    if ((*(_WORD *)(v6 + 40) & 0x80) != 0) {
      size_t v10 = &v30[sprintf(&v29, " %04x", v8) - 1];
    }
    else {
      size_t v10 = &v29;
    }
    uint64_t v11 = v6;
    if (v28 >= v5) {
      uint64_t v12 = v5;
    }
    else {
      uint64_t v12 = v28;
    }
    if (v12)
    {
      uint64_t v13 = v12;
      size_t v14 = v9;
      do
      {
        int v15 = *v14++;
        v10 += sprintf(v10, " %02x", v15);
        --v13;
      }
      while (v13);
    }
    uint64_t v6 = v11;
    if ((*(_WORD *)(v11 + 40) & 0x10) != 0)
    {
      if (v28 > v5)
      {
        int v16 = v25 - v12;
        do
        {
          *(_DWORD *)size_t v10 = 2105376;
          v10 += 3;
          --v16;
        }
        while (v16);
      }
      *(_DWORD *)size_t v10 = 8134688;
      int v17 = v10 + 3;
      if (v12)
      {
        uint64_t v18 = v12;
        BOOL v19 = v9;
        do
        {
          int v21 = *v19++;
          char v20 = v21;
          if ((v21 - 127) < 0xFFFFFFA1) {
            char v20 = 46;
          }
          *v17++ = v20;
          --v18;
        }
        while (v18);
      }
      if (v28 > v5)
      {
        uint64_t v22 = v26 - v12;
        uint64_t v23 = v22 + 1;
        j__mkostemps(v17, 32, v22 + 1);
        v17 += v23;
      }
      *int v17 = 124;
      size_t v10 = v17 + 1;
    }
    v5 -= v12;
    if (v5)
    {
      char *v10 = 10;
      LODWORD(v10) = v10 + 1;
    }
    v9 += v12;
    v8 += v12;
    uint64_t v7 = __printf_puts((uint64_t)a1, (uint64_t)v30, v10 - v30)
       + v7;
    __printf_flush(a1);
  }
  while (v5);
  return v7;
}

uint64_t __printf_arginfo_int(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_int_cold_1();
  }
  *a3 = 1;
  if (*(__int16 *)(a1 + 40) < 0)
  {
    int v4 = 256;
    goto LABEL_19;
  }
  __int16 v3 = *(_WORD *)(a1 + 40);
  int v4 = 65537;
  if ((v3 & 0x2000) != 0)
  {
    int v4 = 8388609;
    goto LABEL_19;
  }
  if ((*(_WORD *)(a1 + 40) & 0x4000) != 0)
  {
    int v4 = 4194305;
    goto LABEL_19;
  }
  if ((v3 & 8) != 0)
  {
    int v4 = 131073;
    goto LABEL_19;
  }
  if ((*(_WORD *)(a1 + 40) & 0x1000) != 0)
  {
    int v4 = 2097153;
    goto LABEL_19;
  }
  if ((*(_WORD *)(a1 + 40) & 0x800) != 0)
  {
    int v4 = 1048577;
    goto LABEL_19;
  }
  if (v3)
  {
LABEL_19:
    *a3 = v4;
    return 1;
  }
  if ((v3 & 4) != 0)
  {
    int v4 = 262145;
    goto LABEL_19;
  }
  if ((v3 & 2) != 0)
  {
    int v4 = 2;
    goto LABEL_19;
  }
  return 1;
}

uint64_t __printf_render_int(uint64_t *a1, uint64_t a2, unint64_t **a3)
{
  int v6 = *(__int16 *)(a2 + 40);
  if ((v6 & 0x80000000) == 0)
  {
    __int16 v7 = *(_WORD *)(a2 + 40);
    char v61 = 0;
    if ((v6 & 0x100) != 0)
    {
      path = localeconv_l(*(locale_t *)(a2 + 8))->thousands_sep;
      int v8 = j__strsignal_r((int)path, v11, v12);
      uint64_t v13 = localeconv_l(*(locale_t *)(a2 + 8));
      fixed = __fix_nogrouping(v13->grouping);
    }
    else
    {
      path = 0;
      int v8 = 0;
      fixed = 0;
    }
    uint64_t v14 = *(unsigned int *)(a2 + 28);
    if ((int)v14 > 104)
    {
      if ((int)v14 <= 116)
      {
        if (v14 != 105)
        {
          if (v14 != 111) {
            goto LABEL_141;
          }
          goto LABEL_16;
        }
LABEL_19:
        BOOL v19 = *a3;
        char v61 = *(_DWORD *)(a2 + 36);
        __int16 v20 = *(_WORD *)(a2 + 40);
        if ((v20 & 0x7801) != 0 || (v20 & 8) != 0)
        {
          unint64_t v22 = *v19;
          if ((*v19 & 0x8000000000000000) == 0)
          {
            int v15 = 0;
            int v18 = 0;
            goto LABEL_49;
          }
          int v15 = 0;
          int v18 = 0;
          unint64_t v22 = -(uint64_t)v22;
        }
        else if ((v20 & 4) != 0)
        {
          unsigned int v57 = *(_DWORD *)v19;
          int v15 = 0;
          int v18 = 0;
          if (((v57 << 16) & 0x80000000) == 0)
          {
            unsigned int v21 = (unsigned __int16)v57;
            int v17 = 10;
            int v16 = &__lowercase_hex;
            goto LABEL_133;
          }
          unint64_t v22 = -(__int16)v57;
        }
        else
        {
          unsigned int v21 = *(_DWORD *)v19;
          if ((v20 & 2) != 0)
          {
            if (((v21 << 24) & 0x80000000) == 0)
            {
              int v18 = 0;
              int v15 = 0;
              int v16 = &__lowercase_hex;
              int v17 = 10;
              goto LABEL_37;
            }
            int v15 = 0;
            int v18 = 0;
            unint64_t v22 = -(char)v21;
          }
          else
          {
            if ((v21 & 0x80000000) == 0)
            {
              int v18 = 0;
              int v15 = 0;
              int v16 = &__lowercase_hex;
              int v17 = 10;
              goto LABEL_133;
            }
            int v15 = 0;
            int v18 = 0;
            unint64_t v22 = -v21;
          }
        }
        char v61 = 45;
        goto LABEL_49;
      }
      if (v14 == 117)
      {
LABEL_28:
        int v18 = 0;
        int v15 = 0;
        int v16 = &__lowercase_hex;
        int v17 = 10;
        goto LABEL_33;
      }
      if (v14 != 120) {
        goto LABEL_141;
      }
      int v18 = 0;
      int v16 = &__lowercase_hex;
    }
    else
    {
      if ((int)v14 <= 87)
      {
        if (v14 != 79)
        {
          if (v14 != 85) {
LABEL_141:
          }
            __printf_render_int_cold_1(v14);
          goto LABEL_28;
        }
LABEL_16:
        int v15 = 0;
        int v16 = &__lowercase_hex;
        int v17 = 8;
        int v18 = 1;
LABEL_33:
        uint64_t v23 = *a3;
        __int16 v24 = *(_WORD *)(a2 + 40);
        if ((v24 & 0x7801) != 0 || (v24 & 8) != 0)
        {
          unint64_t v22 = *v23;
          goto LABEL_39;
        }
        if ((v24 & 4) != 0)
        {
          unsigned int v21 = *(unsigned __int16 *)v23;
        }
        else
        {
          unsigned int v21 = *(_DWORD *)v23;
          if ((v24 & 2) != 0)
          {
LABEL_37:
            unint64_t v22 = v21;
LABEL_39:
            if (v17 == 8)
            {
              unint64_t v28 = v22;
              unsigned int v26 = &v64;
              do
              {
                *--unsigned int v26 = v28 & 7 | 0x30;
                BOOL v27 = v28 >= 8;
                v28 >>= 3;
              }
              while (v27);
              goto LABEL_51;
            }
            if (v17 != 10)
            {
              unint64_t v25 = v22;
              unsigned int v26 = &v64;
              do
              {
                *--unsigned int v26 = v16[v25 & 0xF];
                BOOL v27 = v25 >= 0x10;
                v25 >>= 4;
              }
              while (v27);
              goto LABEL_51;
            }
LABEL_49:
            if (v22 > 9)
            {
              int v58 = v18;
              int v59 = v15;
              if ((v22 & 0x8000000000000000) != 0)
              {
                unsigned int v26 = &v63;
                char v63 = (v22 % 0xA) | 0x30;
                int v31 = 1;
                v22 /= 0xAuLL;
              }
              else
              {
                int v31 = 0;
                unsigned int v26 = &v64;
              }
              uint64_t v32 = -(uint64_t)v8;
              do
              {
                *--unsigned int v26 = (v22 % 0xA) | 0x30;
                ++v31;
                if ((v7 & 0x100) != 0 && v31 == (char)*fixed)
                {
                  BOOL v33 = *fixed == 127 || (uint64_t)v22 < 10;
                  if (!v33)
                  {
                    v26 += v32;
                    j__mkdtempat_np((int)v26, path);
                    int v31 = 0;
                    if (fixed[1]) {
                      ++fixed;
                    }
                  }
                }
                BOOL v27 = v22 >= 0xA;
                v22 /= 0xAuLL;
              }
              while (v27);
              int v18 = v58;
              int v15 = v59;
              goto LABEL_52;
            }
            unsigned int v26 = &v63;
            char v63 = v22 + 48;
LABEL_51:
            if (!v22)
            {
              if (!*(_DWORD *)(a2 + 20))
              {
                int v30 = 0;
                char v29 = 0;
                if ((v18 & ((*(_WORD *)(a2 + 40) & 0x10) >> 4)) == 0) {
                  unsigned int v26 = &v64;
                }
LABEL_76:
                uint64_t v34 = (unsigned char *)(&v64 - v26);
                int v35 = &v64 - v26 + v30;
                if (v61) {
                  int v36 = v35 + 1;
                }
                else {
                  int v36 = v35;
                }
                uint64_t v37 = *(int *)(a2 + 20);
                if ((uint64_t)v34 >= v37)
                {
                  if (v37 != -1
                    || *(_DWORD *)(a2 + 32) != 48
                    || (int v43 = *(_DWORD *)(a2 + 24),
                        BOOL v44 = __OFSUB__(v43, v36),
                        int v45 = v43 - v36,
                        (v45 < 0) ^ v44 | (v45 == 0)))
                  {
                    uint64_t v38 = 0;
                    BOOL v39 = 0;
                    goto LABEL_98;
                  }
                  if ((*(_WORD *)(a2 + 40) & 0x40) != 0) {
                    uint64_t v38 = 0;
                  }
                  else {
                    uint64_t v38 = v45;
                  }
                }
                else
                {
                  uint64_t v38 = (v37 - v34);
                }
                v36 += v38;
                BOOL v39 = (int)v38 > 0;
                if (v26 > v62 && (int)v38 >= 1)
                {
                  unint64_t v41 = (unint64_t)&v26[~(unint64_t)v62];
                  if (v41 >= (v38 - 1)) {
                    unint64_t v41 = (v38 - 1);
                  }
                  j__mkostemps(&v26[~v41], 48, v41 + 1);
                  do
                  {
                    --v26;
                    uint64_t v42 = (v38 - 1);
                    BOOL v39 = v38 > 1;
                    if (v26 <= v62) {
                      break;
                    }
                    BOOL v33 = v38 > 1;
                    LODWORD(v38) = v38 - 1;
                  }
                  while (v33);
                  uint64_t v38 = v42;
                }
LABEL_98:
                if (v36 <= 127)
                {
                  if (v61)
                  {
                    *--unsigned int v26 = v61;
                  }
                  else if (v29)
                  {
                    *(v26 - 1) = v29[1];
                    *(v26 - 2) = *v29;
                    v26 -= 2;
                  }
                  uint64_t v51 = *(int *)(a2 + 24);
                  if (&v64 - v26 >= v51 || (*(_WORD *)(a2 + 40) & 0x40) != 0) {
                    goto LABEL_119;
                  }
                  uint64_t v52 = v51 - (&v64 - v26);
                  if (v26 > v62 && (int)v52 >= 1)
                  {
                    unint64_t v53 = v51 + v26 - v62 - 128;
                    if ((unint64_t)&v26[~(unint64_t)v62] >= v53) {
                      unint64_t v54 = v51 + v26 - v62 - 128;
                    }
                    else {
                      unint64_t v54 = (unint64_t)&v26[~(unint64_t)v62];
                    }
                    v26 += ~v54;
                    j__mkostemps(v26, 32, v54 + 1);
                    uint64_t v52 = (v53 - v54);
                  }
                  if (!v52) {
LABEL_119:
                  }
                    int v47 = 0;
                  else {
                    int v47 = __printf_pad((uint64_t)a1, v52, 0);
                  }
LABEL_125:
                  uint64_t v55 = __printf_puts((uint64_t)a1, (uint64_t)v26, &v64 - v26)
                      + v47;
                  int v56 = *(_DWORD *)(a2 + 24);
                  if (v56 > (int)v55 && (*(_WORD *)(a2 + 40) & 0x40) != 0) {
                    uint64_t v55 = __printf_pad((uint64_t)a1, (v56 - v55), 0) + v55;
                  }
                  __printf_flush(a1);
                  return v55;
                }
                if ((*(_WORD *)(a2 + 40) & 0x40) != 0 || (int v46 = *(_DWORD *)(a2 + 24), v46 <= v36)) {
                  int v47 = 0;
                }
                else {
                  int v47 = __printf_pad((uint64_t)a1, (v46 - v36), 0);
                }
                if (v61)
                {
                  int v48 = &v61;
                  uint64_t v49 = (uint64_t)a1;
                  uint64_t v50 = 1;
                }
                else
                {
                  if (!v29) {
                    goto LABEL_123;
                  }
                  uint64_t v49 = (uint64_t)a1;
                  int v48 = (char *)v29;
                  uint64_t v50 = 2;
                }
                v47 += __printf_puts(v49, (uint64_t)v48, v50);
LABEL_123:
                if (v39) {
                  v47 += __printf_pad((uint64_t)a1, v38, 1);
                }
                goto LABEL_125;
              }
LABEL_75:
              int v30 = 0;
              char v29 = 0;
              goto LABEL_76;
            }
LABEL_52:
            if ((*(_WORD *)(a2 + 40) & 0x10) != 0)
            {
              if (v18) {
                *--unsigned int v26 = 48;
              }
              if (v15)
              {
                if (*(_DWORD *)(a2 + 28) == 120) {
                  char v29 = "0x";
                }
                else {
                  char v29 = "0X";
                }
                int v30 = 2;
                goto LABEL_76;
              }
            }
            goto LABEL_75;
          }
        }
LABEL_133:
        unint64_t v22 = v21;
        goto LABEL_39;
      }
      if (v14 != 88)
      {
        if (v14 != 100) {
          goto LABEL_141;
        }
        goto LABEL_19;
      }
      int v18 = 0;
      int v16 = &__uppercase_hex;
    }
    int v17 = 16;
    int v15 = 1;
    goto LABEL_33;
  }

  return __xprintf_vector();
}

uint64_t __printf_arginfo_ptr(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_ptr_cold_1();
  }
  if (*(__int16 *)(a1 + 40) < 0) {
    int v3 = 256;
  }
  else {
    int v3 = 32;
  }
  *a3 = v3;
  return 1;
}

uint64_t __printf_render_ptr(uint64_t *a1, long long *a2, uint64_t **a3)
{
  if (*((__int16 *)a2 + 20) < 0)
  {
    return __xprintf_vector();
  }
  else
  {
    uint64_t v3 = **a3;
    long long v4 = a2[3];
    long long v11 = a2[2];
    long long v12 = v4;
    long long v13 = a2[4];
    uint64_t v14 = *((void *)a2 + 10);
    long long v5 = a2[1];
    long long v9 = *a2;
    long long v10 = v5;
    HIDWORD(v10) = 120;
    WORD4(v11) |= 0x11u;
    __int16 v7 = (unint64_t *)&v8;
    uint64_t v8 = v3;
    return __printf_render_int(a1, (uint64_t)&v9, &v7);
  }
}

uint64_t __printf_arginfo_quote(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_quote_cold_1();
  }
  *a3 = 32;
  return 1;
}

uint64_t __printf_render_quote(uint64_t a1, char *a2, unsigned __int8 ***a3)
{
  uint64_t v3 = (uint64_t)a2;
  long long v4 = (uint64_t *)a1;
  long long v5 = **a3;
  if (!v5)
  {
    __int16 v24 = "\"(null)\"";
    uint64_t v25 = 8;
LABEL_42:
    return __printf_out(a1, (uint64_t)a2, (uint64_t)v24, v25);
  }
  LOBYTE(v6) = *v5;
  if (!*v5)
  {
    __int16 v24 = "\"\"";
    uint64_t v25 = 2;
    goto LABEL_42;
  }
  int v7 = 0;
  uint64_t v8 = 1;
  do
  {
    int v9 = (char)v6;
    if ((v6 & 0x80) != 0) {
      __uint32_t v10 = ___runetype((char)v6);
    }
    else {
      __uint32_t v10 = _DefaultRuneLocale.__runetype[(char)v6];
    }
    int v11 = (v10 >> 14) & 1;
    if (v9 == 92) {
      int v11 = 1;
    }
    if (v9 == 34) {
      int v11 = 1;
    }
    v7 += v11;
    int v6 = v5[v8++];
  }
  while (v6);
  if (!v7)
  {
    uint64_t v25 = j__strsignal_r((int)v5, a2, (size_t)a3);
    a1 = (uint64_t)v4;
    a2 = (char *)v3;
    __int16 v24 = (const char *)v5;
    goto LABEL_42;
  }
  int v14 = __printf_out((uint64_t)v4, v3, (uint64_t)"\"", 1);
  char v15 = *v5;
  if (!*v5) {
    goto LABEL_38;
  }
  int v16 = v5 + 1;
  int v17 = (int)v5;
  do
  {
    if (v15 <= 0x1Fu)
    {
      switch(v15)
      {
        case 9:
          int v18 = "\\t";
          goto LABEL_32;
        case 10:
          int v18 = "\\n";
          goto LABEL_32;
        case 13:
          int v18 = "\\r";
          goto LABEL_32;
      }
LABEL_23:
      int v19 = v15;
      if (v15 < 0)
      {
        if ((___runetype(v15) & 0x4000) == 0) {
          goto LABEL_35;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v15] & 0x4000) == 0)
      {
        goto LABEL_35;
      }
      int v26 = v19;
      int v18 = v27;
      sprintf(v27, "\\%03o", v26);
      goto LABEL_32;
    }
    if (v15 == 32)
    {
      int v18 = " ";
      goto LABEL_32;
    }
    if (v15 == 34)
    {
      int v18 = "\\\"";
      goto LABEL_32;
    }
    int v18 = "\\\\"";
    if (v15 != 92) {
      goto LABEL_23;
    }
LABEL_32:
    if (v16 - 1 != v5) {
      v14 += __printf_out((uint64_t)v4, v3, (uint64_t)v5, (v17 - v5));
    }
    uint64_t v20 = j__strsignal_r((int)v18, v12, v13);
    v14 += __printf_out((uint64_t)v4, v3, (uint64_t)v18, v20);
    long long v5 = v16;
LABEL_35:
    int v21 = *v16++;
    char v15 = v21;
    ++v17;
  }
  while (v21);
  if (v16 - 1 != v5) {
    v14 += __printf_out((uint64_t)v4, v3, (uint64_t)v5, (v17 - v5));
  }
LABEL_38:
  uint64_t v22 = __printf_out((uint64_t)v4, v3, (uint64_t)"\"", 1) + v14;
  __printf_flush(v4);
  return v22;
}

uint64_t __printf_arginfo_str(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_str_cold_1();
  }
  int v3 = 16;
  if ((*(_WORD *)(a1 + 40) & 8) == 0)
  {
    if (*(_DWORD *)(a1 + 28) == 67) {
      int v3 = 16;
    }
    else {
      int v3 = 8;
    }
  }
  *a3 = v3;
  return 1;
}

uint64_t __printf_render_str(uint64_t a1, uint64_t a2, const __int32 ***a3)
{
  uint64_t v3 = a2;
  long long v4 = (uint64_t *)a1;
  if ((*(_WORD *)(a2 + 40) & 8) != 0 || *(_DWORD *)(a2 + 28) == 83)
  {
    long long v5 = **a3;
    if (v5)
    {
      size_t v6 = *(unsigned int *)(a2 + 20);
      int v7 = *(_xlocale **)(a2 + 8);
      memset(&v29, 0, sizeof(v29));
      BOOL v27 = 0;
      if ((v6 & 0x80000000) != 0)
      {
        BOOL v27 = (__int32 *)v5;
        memset(&v29, 0, sizeof(v29));
        size_t v8 = wcsrtombs_l(0, (const __int32 **)&v27, 0, &v29, v7);
        if (v8 == -1) {
          return 0xFFFFFFFFLL;
        }
      }
      else if (v6 > 0x7F)
      {
        size_t v16 = 0;
        BOOL v27 = (__int32 *)v5;
        memset(&v29, 0, sizeof(v29));
        do
        {
          size_t v8 = v16;
          __int32 v17 = *v27++;
          size_t v18 = wcrtomb_l(v28, v17, &v29, v7);
          size_t v16 = v18 + v8;
        }
        while (v18 + 1 >= 2 && (int)v6 >= (int)v16);
      }
      else
      {
        size_t v8 = v6;
      }
      uint64_t v20 = (char *)malloc_type_malloc(v8 + 1, 0xD1E79035uLL);
      if (v20)
      {
        int v21 = v20;
        BOOL v27 = (__int32 *)v5;
        memset(&v29, 0, sizeof(v29));
        size_t v22 = wcsrtombs_l(v20, (const __int32 **)&v27, v8, &v29, v7);
        if (v22 != -1)
        {
          v21[v22] = 0;
          uint64_t v25 = j__strsignal_r((int)v21, v23, v24);
          uint64_t v26 = __printf_out((uint64_t)v4, v3, (uint64_t)v21, v25);
          __printf_flush(v4);
          free(v21);
          return v26;
        }
        free(v21);
      }
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    int v9 = (const char *)**a3;
    if (v9)
    {
      int v10 = j__strsignal_r((int)**a3, (char *)a2, (size_t)a3);
      int v11 = *(_DWORD *)(v3 + 20);
      if (v11 >= v10 || v11 <= -1) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = v11;
      }
      a1 = (uint64_t)v4;
      a2 = v3;
      int v14 = v9;
      goto LABEL_16;
    }
  }
  int v14 = "(null)";
  uint64_t v13 = 6;
LABEL_16:

  return __printf_out(a1, a2, (uint64_t)v14, v13);
}

uint64_t __printf_arginfo_chr(uint64_t a1, uint64_t a2, int *a3)
{
  if (!a2) {
    __printf_arginfo_chr_cold_1();
  }
  if (*(__int16 *)(a1 + 40) < 0)
  {
    int v3 = 256;
  }
  else
  {
    int v3 = 4;
    if ((*(_WORD *)(a1 + 40) & 8) == 0)
    {
      if (*(_DWORD *)(a1 + 28) == 67) {
        int v3 = 4;
      }
      else {
        int v3 = 1;
      }
    }
  }
  *a3 = v3;
  return 1;
}

uint64_t __printf_render_chr(uint64_t *a1, uint64_t a2)
{
  char v19 = 0;
  memset(&v20, 0, sizeof(v20));
  MEMORY[0x1F41887A8](a1, a2);
  int v7 = (char *)&v18 - ((v6 + 15) & 0x1FFFFFFF0);
  int v9 = *(__int16 *)(v8 + 40);
  if (v9 < 0) {
    return __xprintf_vector(a1, a2);
  }
  if ((v9 & 8) == 0 && *(_DWORD *)(a2 + 28) != 67)
  {
    char v19 = **v4;
    char v15 = &v19;
    uint64_t v13 = (uint64_t)a1;
    uint64_t v14 = a2;
    uint64_t v12 = 1;
    goto LABEL_9;
  }
  __int32 v10 = **v4;
  *(_OWORD *)v20.__mbstate8 = v5;
  *((_OWORD *)&v20._mbstateL + 1) = v5;
  *((_OWORD *)&v20._mbstateL + 2) = v5;
  *((_OWORD *)&v20._mbstateL + 3) = v5;
  *((_OWORD *)&v20._mbstateL + 4) = v5;
  *((_OWORD *)&v20._mbstateL + 5) = v5;
  *((_OWORD *)&v20._mbstateL + 6) = v5;
  *((_OWORD *)&v20._mbstateL + 7) = v5;
  size_t v11 = wcrtomb_l(v7, v10, &v20, *(locale_t *)(a2 + 8));
  if (v11 != -1)
  {
    uint64_t v12 = v11;
    uint64_t v13 = (uint64_t)a1;
    uint64_t v14 = a2;
    char v15 = v7;
LABEL_9:
    uint64_t v16 = __printf_out(v13, v14, (uint64_t)v15, v12);
    __printf_flush(a1);
    return v16;
  }
  return 0xFFFFFFFFLL;
}

uint64_t __printf_arginfo_time(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_time_cold_1();
  }
  *a3 = 32;
  return 1;
}

uint64_t __printf_render_time(uint64_t *a1, uint64_t a2, uint64_t **a3)
{
  __int16 v5 = *(_WORD *)(a2 + 40);
  if ((v5 & 8) != 0)
  {
    uint64_t v9 = **a3;
    int v8 = 1000 * *(_DWORD *)(v9 + 8);
    uint64_t v10 = *(void *)v9;
    int v7 = 6;
  }
  else
  {
    uint64_t v6 = **a3;
    if (v5)
    {
      int v8 = *(_DWORD *)(v6 + 8);
      int v7 = 9;
    }
    else
    {
      int v7 = 0;
      int v8 = 0;
    }
    uint64_t v10 = *(void *)v6;
    if ((v5 & 9) == 0) {
      goto LABEL_11;
    }
  }
  if (*(int *)(a2 + 20) >= 0) {
    int v7 = *(_DWORD *)(a2 + 20);
  }
  if (!v7) {
    int v8 = 0;
  }
LABEL_11:
  if ((v5 & 0x10) == 0)
  {
    size_t v11 = v20;
    int v12 = sprintf(v20, "%jd");
    goto LABEL_34;
  }
  if (v10 <= 31535999)
  {
    size_t v11 = v20;
    LODWORD(v13) = v10;
    if (v10 <= 86399)
    {
      if (v10 <= 3599)
      {
        uint64_t v14 = v10;
        if (v10 <= 59) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  size_t v11 = &v20[sprintf(v20, "%jdy", v10 / 0x1E13380uLL)];
  unint64_t v13 = v10 % 0x1E13380uLL;
  if (v7 || v13)
  {
LABEL_18:
    v11 += sprintf(v11, "%jdd", v13 / 0x15180uLL);
    unint64_t v13 = v13 % 0x15180;
    if (v7) {
      goto LABEL_22;
    }
  }
  if (!v13)
  {
LABEL_23:
    if (!v13)
    {
      uint64_t v14 = 0;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_22:
  v11 += sprintf(v11, "%jdh", v13 / 0xE10uLL);
  unint64_t v13 = v13 % 0xE10;
  if (!v7) {
    goto LABEL_23;
  }
LABEL_26:
  v11 += sprintf(v11, "%jdm", (unsigned __int16)v13 / 0x3Cu);
  uint64_t v14 = (unsigned __int16)v13 % 0x3Cu;
LABEL_27:
  if (!v7 && !v14 && v10 != 0) {
    goto LABEL_40;
  }
  int v12 = sprintf(v11, "%jds");
LABEL_34:
  v11 += v12;
  if (v7)
  {
    if (v7 <= 8)
    {
      int v16 = v7 - 9;
      do
        v8 /= 10;
      while (!__CFADD__(v16++, 1));
    }
    LODWORD(v11) = v11 + sprintf(v11, ".%.*d", v7, v8);
  }
LABEL_40:
  uint64_t v18 = __printf_out((uint64_t)a1, a2, (uint64_t)v20, v11 - v20);
  __printf_flush(a1);
  return v18;
}

uint64_t __printf_arginfo_vis(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_vis_cold_1();
  }
  *a3 = 32;
  return 1;
}

uint64_t __printf_render_vis(uint64_t *a1, uint64_t a2, const char ***a3)
{
  __int16 v5 = **a3;
  if (v5)
  {
    unsigned int v6 = *(_DWORD *)(a2 + 20);
    if ((v6 & 0x80000000) != 0) {
      unsigned int v6 = j__strsignal_r((int)**a3, (char *)a2, (size_t)a3);
    }
    int v7 = (char *)malloc_type_malloc((4 * v6) | 1, 0x67A33A66uLL);
    if (!v7) {
      return 0xFFFFFFFFLL;
    }
    int v8 = v7;
    __int16 v9 = *(_WORD *)(a2 + 40);
    if ((v9 & 0x80) != 0)
    {
      size_t v10 = v6;
      size_t v11 = v5;
      int v12 = 156;
    }
    else if (*(_DWORD *)(a2 + 32) == 48)
    {
      size_t v10 = v6;
      size_t v11 = v5;
      int v12 = 29;
    }
    else
    {
      size_t v10 = v6;
      size_t v11 = v5;
      if ((v9 & 0x10) != 0) {
        int v12 = 28;
      }
      else {
        int v12 = 31;
      }
    }
    uint64_t v15 = strvisx(v7, v11, v10, v12);
    uint64_t v14 = __printf_out((uint64_t)a1, a2, (uint64_t)v8, v15) + v15;
    __printf_flush(a1);
    free(v8);
    return v14;
  }
  else
  {
    return __printf_out((uint64_t)a1, a2, (uint64_t)"(null)", 6);
  }
}

uint64_t __printf_flush(uint64_t *a1)
{
  uint64_t result = __sfvwrite(*a1, (uint64_t)(a1 + 1));
  a1[19] = (uint64_t)(a1 + 3);
  a1[1] = (uint64_t)(a1 + 3);
  a1[2] = 0;
  return result;
}

uint64_t __printf_puts(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    __int16 v5 = *(void **)(a1 + 152);
    *__int16 v5 = a2;
    v5[1] = (int)a3;
    int v6 = *(_DWORD *)(a1 + 16);
    int v7 = *(_DWORD *)(a1 + 20) + a3;
    *(void *)(a1 + 152) = v5 + 2;
    *(_DWORD *)(a1 + 16) = v6 + 1;
    *(_DWORD *)(a1 + 20) = v7;
    if (v6 >= 7)
    {
      __sfvwrite(*(void *)a1, a1 + 8);
      *(void *)(a1 + 152) = a1 + 24;
      *(void *)(a1 + 8) = a1 + 24;
      *(void *)(a1 + 16) = 0;
    }
  }
  return a3;
}

uint64_t __printf_pad(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    int v3 = &zeroes_1;
  }
  else {
    int v3 = &blanks_1;
  }
  if ((int)a2 < 1) {
    return 0;
  }
  uint64_t v4 = a2;
  if (a2 < 0x11)
  {
    int v8 = 0;
  }
  else
  {
    int v6 = 0;
    do
    {
      __printf_puts(a1, (uint64_t)v3, 16);
      v6 -= 16;
      uint64_t v7 = (v4 + v6);
    }
    while ((v7 + 16) > 0x20);
    int v8 = -v6;
    uint64_t v4 = v7;
  }
  __printf_puts(a1, (uint64_t)v3, v4);
  return (v8 + v4);
}

uint64_t __printf_out(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((*(_WORD *)(a2 + 40) & 0x40) != 0 || (int v8 = *(_DWORD *)(a2 + 24), v8 <= (int)a4)) {
    int v9 = 0;
  }
  else {
    int v9 = __printf_pad(a1, (v8 - a4), *(_DWORD *)(a2 + 32) == 48);
  }
  __printf_puts(a1, a3, a4);
  uint64_t v10 = (v9 + a4);
  if ((*(_WORD *)(a2 + 40) & 0x40) != 0)
  {
    int v11 = *(_DWORD *)(a2 + 24);
    if (v11 > (int)a4) {
      return __printf_pad(a1, (v11 - a4), *(_DWORD *)(a2 + 32) == 48) + v10;
    }
  }
  return v10;
}

uint64_t __printf_arginfo_pct()
{
  return 0;
}

uint64_t __printf_render_pct(uint64_t a1)
{
  return __printf_puts(a1, (uint64_t)"%", 1);
}

uint64_t __printf_arginfo_n(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2) {
    __printf_arginfo_n_cold_1();
  }
  *a3 = 32;
  return 1;
}

uint64_t __printf_render_n(uint64_t a1, uint64_t a2, unsigned char **a3)
{
  int v3 = *a3;
  __int16 v4 = *(_WORD *)(a2 + 40);
  if ((v4 & 2) != 0)
  {
    int v6 = *(_DWORD *)(a2 + 44);
    if (off_1E911B948) {
      ((void (*)(unsigned char *, uint64_t))off_1E911B948)(v3, 1);
    }
    *int v3 = v6;
  }
  else if ((v4 & 4) != 0)
  {
    int v7 = *(_DWORD *)(a2 + 44);
    if (off_1E911B948) {
      ((void (*)(unsigned char *, uint64_t))off_1E911B948)(v3, 2);
    }
    *(_WORD *)int v3 = v7;
  }
  else
  {
    if ((v4 & 8) != 0
      || (v4 & 1) != 0
      || (*(_WORD *)(a2 + 40) & 0x1000) != 0
      || (*(_WORD *)(a2 + 40) & 0x2000) != 0
      || (*(_WORD *)(a2 + 40) & 0x800) != 0)
    {
      uint64_t v5 = *(int *)(a2 + 44);
    }
    else
    {
      LODWORD(v5) = *(_DWORD *)(a2 + 44);
      if ((*(_WORD *)(a2 + 40) & 0x4000) == 0)
      {
        if (off_1E911B948) {
          ((void (*)(unsigned char *, uint64_t))off_1E911B948)(v3, 4);
        }
        *(_DWORD *)int v3 = v5;
        return 0;
      }
      uint64_t v5 = (int)v5;
    }
    if (off_1E911B948) {
      ((void (*)(unsigned char *, uint64_t))off_1E911B948)(v3, 8);
    }
    *(void *)int v3 = v5;
  }
  return 0;
}

uint64_t __printf_comp(uint64_t a1, uint64_t a2)
{
  __int16 v4 = *(unsigned char **)(a1 + 64);
  uint64_t v5 = malloc_type_calloc(8uLL, 0x58uLL, 0x34914BBAuLL);
  v54[0] = v5;
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  v54[1] = (void *)0x800000058;
  v53[0] = malloc_type_calloc(8uLL, 4uLL, 0x34914BBAuLL);
  if (!v53[0])
  {
    BOOL v44 = v6;
    goto LABEL_110;
  }
  v53[1] = (void *)0x800000004;
  int v7 = arrayget((char **)v54, 0);
  if (!v7) {
    goto LABEL_109;
  }
  int v8 = v7;
  int v9 = 0;
  int v52 = 0;
  uint64_t v10 = 1;
LABEL_5:
  if (!*v4) {
    goto LABEL_96;
  }
  *((_DWORD *)v8 + 8) = 32;
  *((void *)v8 + 2) = -4294967208;
  int v11 = v4 + 1;
  *((void *)v8 + 7) = v4;
  for (*((void *)v8 + 8) = v4; ; *((void *)v8 + 8) = v11++)
  {
    if (!*(v11 - 1))
    {
      v8 += 88;
LABEL_96:
      if ((int)v10 <= v9) {
        int v45 = v9;
      }
      else {
        int v45 = v10;
      }
      int v46 = v53[0];
      *(void *)(a1 + 96) = v8;
      *(void *)(a1 + 104) = v46;
      int v47 = (char *)v54[0];
      *(void **)(a1 + 88) = v54[0];
      *(_DWORD *)(a1 + 120) = v45;
      if (v45 <= 1) {
        int v45 = 1;
      }
      int v48 = (char *)malloc_type_malloc(16 * v45, 0x1092040C99D0F4CuLL);
      *(void *)(a1 + 112) = v48;
      if (!v48) {
        goto LABEL_109;
      }
      for (; v47 < v8; v47 += 88)
      {
        uint64_t v49 = *((void *)v47 + 9);
        if (v49) {
          *((void *)v47 + 9) = &v48[16 * v49];
        }
        uint64_t v50 = *((void *)v47 + 10);
        if (v50) {
          *((void *)v47 + 10) = &v48[16 * v50];
        }
      }
      uint64_t result = 0;
      *(void *)(a1 + 72) = a2;
      return result;
    }
    if (*(v11 - 1) == 37) {
      break;
    }
  }
  while (2)
  {
    while (1)
    {
      uint64_t v12 = *v11;
      *((_DWORD *)v8 + 7) = v12;
      if ((int)v12 > 94) {
        break;
      }
      switch((int)v12)
      {
        case ' ':
          __int16 v19 = *((_WORD *)v8 + 20);
          if ((v19 & 0x80) == 0)
          {
            *((_WORD *)v8 + 20) = v19 | 0x20;
            *((_DWORD *)v8 + 9) = 32;
          }
          goto LABEL_58;
        case '#':
          __int16 v18 = *((_WORD *)v8 + 20) | 0x10;
          goto LABEL_57;
        case '\'':
          __int16 v18 = *((_WORD *)v8 + 20) | 0x100;
          goto LABEL_57;
        case '*':
          mbstate_t v20 = v11 + 1;
          int v21 = v11[1];
          if (!v11[1]) {
            goto LABEL_72;
          }
          int v22 = v21 - 48;
          if ((v21 - 48) > 9)
          {
            int v23 = 0;
            int v25 = v11[1];
          }
          else
          {
            int v23 = 0;
            mbstate_t v20 = v11 + 2;
            do
            {
              int v24 = *v20;
              if (!*v20) {
                goto LABEL_72;
              }
              int v23 = v22 + 10 * v23;
              int v22 = v24 - 48;
              ++v20;
            }
            while ((v24 - 48) <= 9);
            int v25 = v24;
            int v11 = v20 - 2;
            --v20;
          }
          if (v25 != 36)
          {
LABEL_72:
            uint64_t v35 = (v10 + 1);
            int v11 = v20;
            goto LABEL_73;
          }
          if (v23 >= v9) {
            int v9 = v23 + 1;
          }
          v11 += 2;
          uint64_t v35 = v10;
          LODWORD(v10) = v23;
LABEL_73:
          *((_DWORD *)v8 + 12) = v10;
          goto LABEL_82;
        case '+':
          *((_WORD *)v8 + 20) |= 0x80u;
          *((_DWORD *)v8 + 9) = 43;
          goto LABEL_58;
        case ',':
        case ':':
        case ';':
          goto LABEL_30;
        case '-':
          __int16 v18 = *((_WORD *)v8 + 20) | 0x40;
          goto LABEL_57;
        case '.':
          *((_DWORD *)v8 + 5) = 0;
          __int32 v17 = v11 + 1;
          int v26 = v11[1];
          if (v26 == 42)
          {
            char v27 = v11[2];
            if (v27)
            {
              int v28 = 0;
              v11 += 3;
              while (1)
              {
                unsigned int v29 = v27 - 48;
                if (v29 > 9) {
                  break;
                }
                int v28 = v29 + 10 * v28;
                int v30 = *v11++;
                char v27 = v30;
                if (!v30) {
                  goto LABEL_79;
                }
              }
              if (v27 != 36)
              {
LABEL_79:
                --v11;
                goto LABEL_80;
              }
              if (v28 >= v9) {
                int v9 = v28 + 1;
              }
              uint64_t v35 = v10;
              LODWORD(v10) = v28;
            }
            else
            {
              v11 += 2;
LABEL_80:
              uint64_t v35 = (v10 + 1);
            }
            *((_DWORD *)v8 + 13) = v10;
LABEL_82:
            int v36 = arrayget((char **)v53, v10);
            if (!v36) {
              goto LABEL_109;
            }
            *(_DWORD *)int v36 = 1;
            uint64_t v10 = v35;
          }
          else
          {
            ++v11;
            if ((v26 - 48) <= 9)
            {
              int v32 = 0;
              do
              {
                int v33 = 5 * v32;
                *((_DWORD *)v8 + 5) = 2 * v33;
                int v32 = *v17 + 2 * v33 - 48;
                *((_DWORD *)v8 + 5) = v32;
                int v34 = *++v17;
              }
              while ((v34 - 48) < 0xA);
LABEL_62:
              int v11 = v17;
            }
          }
          continue;
        case '0':
          *((_DWORD *)v8 + 8) = 48;
          goto LABEL_58;
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          char v13 = *v11;
          if (!*v11)
          {
            LODWORD(v14) = 0;
LABEL_26:
            *((_DWORD *)v8 + 6) = v14;
            continue;
          }
          uint64_t v14 = 0;
          ++v11;
          while (1)
          {
            unsigned int v15 = v13 - 48;
            if (v15 > 9) {
              break;
            }
            uint64_t v14 = v15 + 10 * v14;
            int v16 = *v11++;
            char v13 = v16;
            if (!v16) {
              goto LABEL_25;
            }
          }
          if (v13 != 36)
          {
LABEL_25:
            --v11;
            goto LABEL_26;
          }
          if ((int)v10 > v9) {
            int v9 = v10;
          }
          uint64_t v10 = v14;
          break;
        case 'L':
          __int16 v18 = *((_WORD *)v8 + 20) | 1;
          goto LABEL_57;
        default:
          goto LABEL_84;
      }
    }
    switch((int)v12)
    {
      case 'h':
        __int32 v17 = v11 + 1;
        if (v11[1] == 104)
        {
          v11 += 2;
          *((_WORD *)v8 + 20) |= 2u;
          continue;
        }
        __int16 v31 = *((_WORD *)v8 + 20) | 4;
        goto LABEL_61;
      case 'i':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
      case 's':
      case 'u':
        goto LABEL_84;
      case 'j':
        __int16 v18 = *((_WORD *)v8 + 20) | 0x1000;
        goto LABEL_57;
      case 'l':
        __int32 v17 = v11 + 1;
        if (v11[1] == 108)
        {
          v11 += 2;
          *((_WORD *)v8 + 20) = *((_WORD *)v8 + 20) & 0xF7FE | 1;
          continue;
        }
        __int16 v31 = *((_WORD *)v8 + 20) & 0xF7F7 | 8;
LABEL_61:
        *((_WORD *)v8 + 20) = v31;
        goto LABEL_62;
      case 'q':
        __int16 v18 = *((_WORD *)v8 + 20) & 0xF7F7 | 0x800;
        goto LABEL_57;
      case 't':
        __int16 v18 = *((_WORD *)v8 + 20) | 0x2000;
        goto LABEL_57;
      case 'v':
        __int16 v18 = *((_WORD *)v8 + 20) | 0x8000;
        goto LABEL_57;
      default:
        if (v12 == 95)
        {
LABEL_30:
          *((_DWORD *)v8 + 4) = v12;
          goto LABEL_58;
        }
        if (v12 == 122)
        {
          __int16 v18 = *((_WORD *)v8 + 20) | 0x4000;
LABEL_57:
          *((_WORD *)v8 + 20) = v18;
LABEL_58:
          ++v11;
          continue;
        }
LABEL_84:
        uint64_t v37 = (v12 - 33);
        if (v37 > 0x5D) {
          goto LABEL_92;
        }
        int v38 = *(char *)(a2 + v37 + 200);
        if ((v38 - 1) < 2)
        {
          if (arrayget((char **)v53, (int)v10 + 1))
          {
            uint64_t v39 = a2 + 24 * *((int *)v8 + 7) - 792;
            uint64_t v40 = *(void *)(a1 + 80);
            *(void *)int v8 = *(void *)(a2 + 24 * *((int *)v8 + 7) - 480);
            *((void *)v8 + 1) = v40;
            unint64_t v41 = *(uint64_t (**)(char *, uint64_t, char *))(v39 + 296);
            uint64_t v42 = arrayget((char **)v53, v10);
            int v43 = v41(v8, 2, v42);
            if (v43 >= 1)
            {
              *((void *)v8 + 9) = (int)v10;
              if (v43 != 1) {
                *((void *)v8 + 10) = (int)v10 + 1;
              }
            }
            uint64_t v10 = (v43 + v10);
            goto LABEL_92;
          }
          goto LABEL_109;
        }
        if (v38 == 3) {
          errx(1, "Unexpected flag: %c", v12);
        }
LABEL_92:
        __int16 v4 = v11 + 1;
        int v8 = arrayget((char **)v54, ++v52);
        if (v8) {
          goto LABEL_5;
        }
LABEL_109:
        free(v54[0]);
        BOOL v44 = v53[0];
LABEL_110:
        free(v44);
        return 0xFFFFFFFFLL;
    }
  }
}

char *arrayget(char **a1, int a2)
{
  int v4 = *((_DWORD *)a1 + 3);
  uint64_t v5 = *a1;
  if (v4 <= a2)
  {
    int v6 = *((_DWORD *)a1 + 2);
    int v7 = a2 + 8;
    int v8 = v6 * (a2 + 8);
    uint64_t result = (char *)malloc_type_realloc(*a1, v8, 0x58E55244uLL);
    if (!result) {
      return result;
    }
    uint64_t v5 = result;
    MEMORY[0x18C122530](&result[v6 * v4], v8 - v6 * v4);
    *a1 = v5;
    *((_DWORD *)a1 + 3) = v7;
  }
  return &v5[*((int *)a1 + 2) * (uint64_t)a2];
}

uint64_t __printf_exec(uint64_t a1, uint64_t a2, __int16 *a3)
{
  memset(v38, 0, sizeof(v38));
  uint64_t v39 = v38;
  uint64_t v40 = a3;
  int v36 = v38;
  uint64_t v37 = 0;
  uint64_t v35 = a2;
  if (*(int *)(a1 + 120) >= 2)
  {
    uint64_t v5 = 1;
    uint64_t v6 = 16;
    uint64_t v7 = *(void *)(a1 + 104);
    do
    {
      int v8 = *(_DWORD *)(v7 + 4 * v5);
      if (v8 > 0x10000)
      {
        if (v8 > 0x100000)
        {
          if (v8 > 0x400000)
          {
            if (v8 != 4194305)
            {
              int v11 = 8388609;
LABEL_27:
              if (v8 != v11) {
LABEL_59:
              }
                errx(1, "argtype = %x (fmt = \"%s\")\n", *(_DWORD *)(v7 + 4 * v5), *(const char **)(a1 + 64));
            }
          }
          else if (v8 != 1048577)
          {
            int v11 = 2097153;
            goto LABEL_27;
          }
        }
        else if (v8 > 0x20000)
        {
          if (v8 != 131073)
          {
            if (v8 != 262145) {
              goto LABEL_59;
            }
            uint64_t v12 = v40;
            v40 += 4;
            int v10 = *v12;
LABEL_31:
            *(_DWORD *)(*(void *)(a1 + 112) + v6) = v10;
            goto LABEL_37;
          }
        }
        else if (v8 != 65537)
        {
          if (v8 != 65664) {
            goto LABEL_59;
          }
LABEL_29:
          unsigned int v15 = v40;
          v40 += 4;
          *(void *)(*(void *)(a1 + 112) + v6) = *v15;
          goto LABEL_37;
        }
      }
      else
      {
        if (v8 <= 15)
        {
          switch(v8)
          {
            case 1:
            case 4:
              int v9 = (int *)v40;
              v40 += 4;
              int v10 = *v9;
              goto LABEL_31;
            case 2:
              int v16 = (char *)v40;
              v40 += 4;
              int v10 = *v16;
              goto LABEL_31;
            case 8:
              __int32 v17 = (uint64_t *)v40;
              v40 += 4;
              uint64_t v18 = *v17;
              __int16 v19 = (void (*)(uint64_t))off_1E911B938;
              if (off_1E911B938) {
                goto LABEL_35;
              }
              goto LABEL_36;
            default:
              goto LABEL_59;
          }
        }
        if (v8 > 127)
        {
          if (v8 != 128)
          {
            if (v8 != 256) {
              goto LABEL_59;
            }
            char v13 = (_OWORD *)(((unint64_t)v40 + 15) & 0xFFFFFFFFFFFFFFF0);
            uint64_t v40 = (__int16 *)(v13 + 1);
            *(_OWORD *)(*(void *)(a1 + 112) + v6) = *v13;
            goto LABEL_37;
          }
          goto LABEL_29;
        }
        if (v8 == 16)
        {
          mbstate_t v20 = (uint64_t *)v40;
          v40 += 4;
          uint64_t v18 = *v20;
          __int16 v19 = (void (*)(uint64_t))off_1E911B940;
          if (off_1E911B940) {
LABEL_35:
          }
            v19(v18);
LABEL_36:
          *(void *)(*(void *)(a1 + 112) + v6) = v18;
          goto LABEL_37;
        }
        if (v8 != 32) {
          goto LABEL_59;
        }
      }
      uint64_t v14 = v40;
      v40 += 4;
      *(void *)(*(void *)(a1 + 112) + v6) = *v14;
LABEL_37:
      ++v5;
      v6 += 16;
    }
    while (v5 < *(int *)(a1 + 120));
  }
  unint64_t v21 = *(void *)(a1 + 88);
  if (v21 < *(void *)(a1 + 96))
  {
    LODWORD(v22) = 0;
    while (1)
    {
      uint64_t v23 = *(unsigned int *)(v21 + 48);
      if (v23)
      {
        int v24 = *(_DWORD *)(*(void *)(a1 + 112) + 16 * v23);
        *(_DWORD *)(v21 + 24) = v24;
        if (v24 < 0)
        {
          *(_WORD *)(v21 + 40) |= 0x40u;
          *(_DWORD *)(v21 + 24) = -v24;
        }
      }
      uint64_t v25 = *(unsigned int *)(v21 + 52);
      if (v25) {
        *(_DWORD *)(v21 + 20) = *(_DWORD *)(*(void *)(a1 + 112) + 16 * v25);
      }
      uint64_t v26 = *(void *)(v21 + 56);
      unsigned int v27 = *(_DWORD *)(v21 + 64) - v26;
      __printf_puts((uint64_t)&v35, v26, v27);
      uint64_t v22 = v22 + v27;
      int v28 = *(_DWORD *)(v21 + 28);
      if (!v28) {
        goto LABEL_52;
      }
      unsigned int v29 = v28 - 33;
      if ((v28 - 33) > 0x5D) {
        break;
      }
      uint64_t v30 = *(void *)(a1 + 72);
      int v31 = *(char *)(v30 + v29 + 200);
      if (v31 == 2)
      {
        *(_DWORD *)(v21 + 44) = v22;
        int v32 = (*(uint64_t (**)(uint64_t *, unint64_t, unint64_t))(v30 + 24 * v29 + 304))(&v35, v21, v21 + 72);
        if (v32 < 0)
        {
          *(_WORD *)(v35 + 16) |= 0x40u;
          goto LABEL_52;
        }
        goto LABEL_51;
      }
      if (v31 == 1)
      {
        __sfvwrite(v35, (uint64_t)&v36);
        uint64_t v39 = v38;
        int v36 = v38;
        uint64_t v37 = 0;
        *(_DWORD *)(v21 + 44) = v22;
        int v32 = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(v30
                                                                                     + 24 * *(int *)(v21 + 28)
                                                                                     - 488))(a2, v21, v21 + 72);
        goto LABEL_51;
      }
      if (!*(unsigned char *)(v30 + v29 + 200)) {
        break;
      }
LABEL_52:
      v21 += 88;
      if (v21 >= *(void *)(a1 + 96)) {
        goto LABEL_58;
      }
    }
    char v34 = *(_DWORD *)(v21 + 28);
    int v32 = __printf_out((uint64_t)&v35, v21, (uint64_t)&v34, 1);
LABEL_51:
    uint64_t v22 = (v32 + v22);
    goto LABEL_52;
  }
  uint64_t v22 = 0;
LABEL_58:
  __sfvwrite(v35, (uint64_t)&v36);
  return v22;
}

uint64_t __xprintf_vector(uint64_t *a1, uint64_t a2, _DWORD **a3)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v32 = *(_OWORD *)(a2 + 32);
  long long v33 = v4;
  long long v34 = *(_OWORD *)(a2 + 64);
  uint64_t v35 = *(void *)(a2 + 80);
  long long v5 = *(_OWORD *)(a2 + 16);
  v31[0] = *(_OWORD *)a2;
  v31[1] = v5;
  uint64_t v6 = *a3;
  char v36 = *(_DWORD *)(a2 + 16);
  if (v36 == 88)
  {
    if (*(_DWORD *)(a2 + 28) == 99)
    {
      char v36 = 0;
      *((void *)&v33 + 1) = &v36;
      *(void *)&long long v34 = &v36;
      goto LABEL_8;
    }
    char v36 = 32;
    *((void *)&v33 + 1) = &v36;
    goto LABEL_7;
  }
  *((void *)&v33 + 1) = &v36;
  *(void *)&long long v34 = &v36;
  if (v36) {
LABEL_7:
  }
    *(void *)&long long v34 = &v37;
LABEL_8:
  __int16 v7 = WORD4(v32);
  __int16 v8 = WORD4(v32) & 0x7FFF;
  WORD4(v32) &= ~0x8000u;
  __int16 v9 = *(_WORD *)(a2 + 40);
  if ((v9 & 4) != 0)
  {
    if (*(_DWORD *)(a2 + 28) == 112)
    {
      unint64_t v30 = *(unsigned __int16 *)v6;
      unsigned int v29 = &v30;
      LODWORD(v11) = __printf_render_ptr(a1, v31, (uint64_t **)&v29);
      for (uint64_t i = 2; i != 16; i += 2)
      {
        int v15 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        unint64_t v30 = *(unsigned __int16 *)((char *)v6 + i);
        uint64_t v11 = v11 + __printf_render_ptr(a1, v31, (uint64_t **)&v29) + v15;
      }
    }
    else
    {
      LODWORD(v29) = *(unsigned __int16 *)v6;
      *(double *)&unint64_t v30 = COERCE_DOUBLE(&v29);
      LODWORD(v11) = __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30);
      for (uint64_t j = 2; j != 16; j += 2)
      {
        int v19 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        LODWORD(v29) = *(unsigned __int16 *)((char *)v6 + j);
        uint64_t v11 = v11 + __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30) + v19;
      }
    }
  }
  else if ((v9 & 8) != 0)
  {
    WORD4(v32) = v7 & 0x7FF7;
    if (*(_DWORD *)(a2 + 28) == 112)
    {
      unint64_t v30 = *v6;
      unsigned int v29 = &v30;
      LODWORD(v11) = __printf_render_ptr(a1, v31, (uint64_t **)&v29);
      for (uint64_t k = 1; k != 4; ++k)
      {
        int v17 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        unint64_t v30 = v6[k];
        uint64_t v11 = v11 + __printf_render_ptr(a1, v31, (uint64_t **)&v29) + v17;
      }
    }
    else
    {
      LODWORD(v29) = *v6;
      *(double *)&unint64_t v30 = COERCE_DOUBLE(&v29);
      LODWORD(v11) = __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30);
      for (uint64_t m = 1; m != 4; ++m)
      {
        int v21 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        LODWORD(v29) = v6[m];
        uint64_t v11 = v11 + __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30) + v21;
      }
    }
  }
  else
  {
    uint64_t v10 = (*(_DWORD *)(a2 + 28) - 65);
    if (v10 > 0x37)
    {
LABEL_37:
      unint64_t v30 = *(unsigned __int8 *)v6;
      unsigned int v29 = &v30;
      LODWORD(v11) = __printf_render_ptr(a1, v31, (uint64_t **)&v29);
      for (uint64_t n = 1; n != 16; ++n)
      {
        int v28 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        unint64_t v30 = *((unsigned __int8 *)v6 + n);
        uint64_t v11 = v11 + __printf_render_ptr(a1, v31, (uint64_t **)&v29) + v28;
      }
      return v11;
    }
    if (((1 << (*(unsigned char *)(a2 + 28) - 65)) & 0x7100000051) == 0)
    {
      if (((1 << (*(unsigned char *)(a2 + 28) - 65)) & 0x90410800800000) != 0)
      {
        WORD4(v32) = v8 | 2;
        LODWORD(v29) = *(unsigned __int8 *)v6;
        *(double *)&unint64_t v30 = COERCE_DOUBLE(&v29);
        LODWORD(v11) = __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30);
        for (iuint64_t i = 1; ii != 16; ++ii)
        {
          int v13 = v34 - DWORD2(v33);
          __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
          LODWORD(v29) = *((unsigned __int8 *)v6 + ii);
          uint64_t v11 = v11 + __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30) + v13;
        }
        return v11;
      }
      if (v10 == 34)
      {
        LODWORD(v29) = *(unsigned __int8 *)v6;
        *(double *)&unint64_t v30 = COERCE_DOUBLE(&v29);
        LODWORD(v11) = __printf_render_chr(a1, (uint64_t)v31);
        for (juint64_t j = 1; jj != 16; ++jj)
        {
          int v26 = v34 - DWORD2(v33);
          __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
          LODWORD(v29) = *((unsigned __int8 *)v6 + jj);
          uint64_t v11 = v11 + __printf_render_chr(a1, (uint64_t)v31) + v26;
        }
        return v11;
      }
      goto LABEL_37;
    }
    *(double *)&unint64_t v30 = *(float *)v6;
    unsigned int v29 = &v30;
    LODWORD(v11) = __printf_render_float(a1, v31, &v29);
    for (kuint64_t k = 1; kk != 4; ++kk)
    {
      int v23 = v34 - DWORD2(v33);
      __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
      *(double *)&unint64_t v30 = *(float *)&v6[kk];
      uint64_t v11 = v11 + __printf_render_float(a1, v31, &v29) + v23;
    }
  }
  return v11;
}

uint64_t at_quick_exit(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  v2[1] = a1;
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  atomic_compare_exchange_strong(&handlers, (unint64_t *)&v4, (unint64_t)v2);
  if (v4 != v3)
  {
    uint64_t v5 = v4;
    do
    {
      *uint64_t v2 = v4;
      atomic_compare_exchange_strong(&handlers, (unint64_t *)&v5, (unint64_t)v2);
      BOOL v6 = v5 == v4;
      uint64_t v4 = v5;
    }
    while (!v6);
  }
  return 0;
}

void quick_exit(int a1)
{
  for (unint64_t i = atomic_load_explicit(&handlers, memory_order_acquire); i; unint64_t i = *(void *)i)
    (*(void (**)(void))(i + 8))();
  _Exit(a1);
}

uint64_t __default_utx()
{
  return __utx__;
}

uint64_t __default_utx_init()
{
  v0 = (char *)malloc_type_calloc(1uLL, 0x2E0uLL, 0x10300404E040BDAuLL);
  __utx__ = (uint64_t)v0;
  *(void *)v0 = 0x17600787475;
  uint64_t result = pthread_mutex_init((pthread_mutex_t *)(v0 + 648), 0);
  uint64_t v2 = __utx__;
  *(void *)(__utx__ + 712) = "/var/run/utmpx";
  *(unsigned char *)(v2 + 728) |= 1u;
  return result;
}

uint64_t _setutxent(uint64_t a1)
{
  if (!a1) {
    _setutxent_cold_1();
  }
  if (*(void *)a1 != 0x17600787475) {
    _setutxent_cold_2();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  MEMORY[0x18C122530](a1 + 8, 640);
  uint64_t v2 = *(FILE **)(a1 + 720);
  if (v2) {
    fseeko(v2, 628, 0);
  }

  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
}

void setutxent(void)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  uint64_t v0 = __utx__;

  _setutxent(v0);
}

int *__endutxent(uint64_t a1)
{
  uint64_t result = (int *)MEMORY[0x18C122530](a1 + 8, 640);
  if (*(void *)(a1 + 720))
  {
    int v3 = *__error();
    fclose(*(FILE **)(a1 + 720));
    uint64_t result = __error();
    *uint64_t result = v3;
    *(void *)(a1 + 720) = 0;
    *(unsigned char *)(a1 + 728) &= ~2u;
  }
  return result;
}

uint64_t _endutxent(uint64_t a1)
{
  if (!a1) {
    _endutxent_cold_1();
  }
  if (*(void *)a1 != 0x17600787475) {
    _endutxent_cold_2();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  __endutxent(a1);

  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
}

void endutxent(void)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  uint64_t v0 = __utx__;

  _endutxent(v0);
}

uint64_t __getutxent(uint64_t a1)
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  memset(__ptr, 0, sizeof(__ptr));
  uint64_t v2 = *(FILE **)(a1 + 720);
  if (!v2)
  {
    memset(&v8, 0, sizeof(v8));
    uint64_t v4 = fopen(*(const char **)(a1 + 712), "r+");
    *(void *)(a1 + 720) = v4;
    if (!v4)
    {
      uint64_t v4 = fopen(*(const char **)(a1 + 712), "w+");
      *(void *)(a1 + 720) = v4;
      if (!v4)
      {
        uint64_t v4 = fopen(*(const char **)(a1 + 712), "r");
        *(void *)(a1 + 720) = v4;
        if (!v4) {
          goto LABEL_17;
        }
        *(unsigned char *)(a1 + 728) |= 2u;
      }
    }
    fileno(v4);
    fcntl_NOCANCEL();
    int v5 = fileno(*(FILE **)(a1 + 720));
    if (fstat(v5, &v8) != -1)
    {
      if (!v8.st_size)
      {
        MEMORY[0x18C122530]((char *)__ptr + 8, 620);
        WORD4(v10) = 10;
        strcpy((char *)__ptr, "utmpx-1.00");
        if (fwrite(__ptr, 0x274uLL, 1uLL, *(FILE **)(a1 + 720)) != 1) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      if (fread(__ptr, 0x274uLL, 1uLL, *(FILE **)(a1 + 720)) == 1)
      {
        if (*(void *)&__ptr[0] ^ 0x2E312D78706D7475 | *(void *)((char *)__ptr + 3) ^ 0x30302E312D7870
          || WORD4(v10) != 10)
        {
          *__error() = 22;
          goto LABEL_16;
        }
LABEL_15:
        uint64_t v2 = *(FILE **)(a1 + 720);
        goto LABEL_2;
      }
    }
LABEL_16:
    int v6 = *__error();
    fclose(*(FILE **)(a1 + 720));
    *__error() = v6;
    *(void *)(a1 + 720) = 0;
    goto LABEL_17;
  }
LABEL_2:
  if (fread(__ptr, 0x274uLL, 1uLL, v2) != 1)
  {
LABEL_17:
    MEMORY[0x18C122530](a1 + 8, 640);
    return 0;
  }
  uint64_t v3 = a1 + 8;
  _utmpx32_64((uint64_t)__ptr, v3);
  return v3;
}

uint64_t _getutxent(uint64_t a1)
{
  if (!a1) {
    _getutxent_cold_1();
  }
  if (*(void *)a1 != 0x17600787475) {
    _getutxent_cold_2();
  }
  uint64_t v2 = (pthread_mutex_t *)(a1 + 648);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  uint64_t v3 = __getutxent(a1);
  pthread_mutex_unlock(v2);
  return v3;
}

utmpx *getutxent(void)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  uint64_t v0 = __utx__;

  return (utmpx *)_getutxent(v0);
}

uint64_t _getutxid(uint64_t a1, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 296)) {
    return 0;
  }
  if (!a1) {
    _getutxid_cold_1();
  }
  if (*(void *)a1 != 0x17600787475) {
    _getutxid_cold_2();
  }
  uint64_t v4 = (pthread_mutex_t *)(a1 + 648);
  memset(v8, 0, 512);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  int v5 = _utmpx_working_copy((char *)a2, (uint64_t)v8, 1);
  if (v5) {
    uint64_t v6 = __getutxid(a1, (uint64_t)v5);
  }
  else {
    uint64_t v6 = 0;
  }
  pthread_mutex_unlock(v4);
  return v6;
}

uint64_t __getutxid(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v4 = *(__int16 *)(a1 + 304);
    if (!*(_WORD *)(a1 + 304)) {
      goto LABEL_8;
    }
    int v5 = *(__int16 *)(a2 + 296);
    if ((v5 - 5) >= 4) {
      break;
    }
    if ((v4 - 5) <= 3 && *(_DWORD *)(a1 + 264) == *(_DWORD *)(a2 + 256)) {
      return a1 + 8;
    }
LABEL_8:
    uint64_t result = __getutxent(a1);
    if (!result) {
      return result;
    }
  }
  if ((v5 - 1) <= 3)
  {
    if (*(unsigned __int16 *)(a2 + 296) == (unsigned __int16)v4) {
      return a1 + 8;
    }
    goto LABEL_8;
  }
  return 0;
}

utmpx *__cdecl getutxid(const utmpx *a1)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  uint64_t v2 = __utx__;

  return (utmpx *)_getutxid(v2, (uint64_t)a1);
}

uint64_t _getutxline(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    _getutxline_cold_1();
  }
  if (*(void *)a1 != 0x17600787475) {
    _getutxline_cold_2();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  uint64_t v6 = a1 + 8;
  __int16 v7 = (const char *)(a2 + 260);
  while ((*(_WORD *)(a1 + 304) & 0xFFFE) != 6 || j__strsvisx((char *)(a1 + 268), v7, 0x20uLL, v4, v5))
  {
    if (!__getutxent(a1))
    {
      uint64_t v6 = 0;
      break;
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
  return v6;
}

utmpx *__cdecl getutxline(const utmpx *a1)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  uint64_t v2 = __utx__;

  return (utmpx *)_getutxline(v2, (uint64_t)a1);
}

char *_pututxline(uint64_t a1, char *a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    if (!a1) {
      _pututxline_cold_1();
    }
    if (*(void *)a1 != 0x17600787475) {
      _pututxline_cold_2();
    }
    uint64_t v3 = (pthread_mutex_t *)(a1 + 648);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
    pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
    uint64_t v2 = (char *)__pututxline(__utx__, v2);
    if (v2)
    {
      pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
      if (*(unsigned char *)(__utx__ + 728)) {
        _utmpx_asl((uint64_t)v2);
      }
    }
    pthread_mutex_unlock(v3);
  }
  else
  {
    *__error() = 22;
  }
  return v2;
}

uint64_t __pututxline(uint64_t a1, char *path)
{
  memset(v18, 0, 512);
  memset(__ptr, 0, 512);
  off_t v16 = -1;
  if ((*(unsigned char *)(a1 + 728) & 1) != 0
    && ((uint64_t v4 = *(void *)(a1 + 720), (*(unsigned char *)(a1 + 728) & 2) != 0) && v4 || !v4 && geteuid())
    || !*(void *)(a1 + 720) && ((__getutxent(a1), !*(void *)(a1 + 720)) || (*(unsigned char *)(a1 + 728) & 2) != 0))
  {
    long long v11 = __error();
    uint64_t v9 = 0;
    int v12 = 1;
LABEL_28:
    *long long v11 = v12;
    return v9;
  }
  int v5 = _utmpx_working_copy(path, (uint64_t)v18, 0);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t)v5;
  uint64_t v7 = __getutxid(a1, (uint64_t)v5);
  if (v7) {
    goto LABEL_11;
  }
  MEMORY[0x18C122530](a1 + 8, 640);
  stat v8 = *(FILE **)(a1 + 720);
  if (v8) {
    fseeko(v8, 628, 0);
  }
  uint64_t v7 = __getutxid(a1, v6);
  if (v7) {
    goto LABEL_11;
  }
  if (*(_WORD *)(v6 + 296) == 8 && (*((_WORD *)path + 148) & 0x4000) != 0) {
    goto LABEL_37;
  }
  int v13 = fileno(*(FILE **)(a1 + 720));
  off_t v16 = lseek(v13, 0, 1);
  if (v16 < 0) {
    return 0;
  }
  fileno(*(FILE **)(a1 + 720));
  if (fcntl_NOCANCEL() == -1) {
    return 0;
  }
  int v14 = fseeko(*(FILE **)(a1 + 720), 0, 2);
  uint64_t v7 = 0;
  uint64_t v9 = 0;
  if (v14 != -1)
  {
LABEL_11:
    if ((v16 & 0x8000000000000000) == 0)
    {
LABEL_16:
      _utmpx64_32(v6, (uint64_t)__ptr);
      if (fwrite(__ptr, 0x274uLL, 1uLL, *(FILE **)(a1 + 720)) != 1 || fflush(*(FILE **)(a1 + 720)) == -1)
      {
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = a1 + 8;
        j__mkdtempat_np(a1 + 8, (char *)v6);
        notify_post("com.apple.system.utmpx");
      }
      goto LABEL_23;
    }
    if (*(_WORD *)(v6 + 296) != 8 || (*((_WORD *)path + 148) & 0x4000) == 0 || *(_WORD *)(v7 + 296) == 7)
    {
      if (fseeko(*(FILE **)(a1 + 720), -628, 1) == -1) {
        return 0;
      }
      goto LABEL_16;
    }
LABEL_37:
    long long v11 = __error();
    uint64_t v9 = 0;
    int v12 = 22;
    goto LABEL_28;
  }
LABEL_23:
  if ((v16 & 0x8000000000000000) == 0)
  {
    int v10 = *__error();
    fileno(*(FILE **)(a1 + 720));
    if (fcntl_NOCANCEL() != -1)
    {
      *__error() = v10;
      return v9;
    }
    return 0;
  }
  return v9;
}

utmpx *__cdecl pututxline(const utmpx *a1)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  uint64_t v2 = __utx__;

  return (utmpx *)_pututxline(v2, a1->ut_user);
}

uint64_t __utmpxname(uint64_t a1, char *__sig, size_t a3)
{
  if (!__sig)
  {
    char v9 = *(unsigned char *)(a1 + 728);
    if ((v9 & 1) == 0)
    {
      free(*(void **)(a1 + 712));
      char v9 = *(unsigned char *)(a1 + 728);
    }
    *(void *)(a1 + 712) = "/var/run/utmpx";
    *(unsigned char *)(a1 + 728) = v9 | 1;
    goto LABEL_13;
  }
  unint64_t v5 = j__strsignal_r((int)__sig, __sig, a3);
  if (v5 > 0x3FF || __sig[v5 - 1] != 120) {
    return 0;
  }
  char v6 = *(unsigned char *)(a1 + 728);
  if (v6)
  {
    uint64_t v7 = 0;
    *(void *)(a1 + 712) = 0;
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 712);
  }
  *(unsigned char *)(a1 + 728) = v6 & 0xFE;
  uint64_t result = (uint64_t)reallocf(v7, v5 + 1);
  *(void *)(a1 + 712) = result;
  if (result)
  {
    j__strnstr((const char *)result, __sig, v10);
LABEL_13:
    __endutxent(a1);
    return 1;
  }
  return result;
}

uint64_t _utmpxname(uint64_t a1, char *a2)
{
  if (!a1) {
    _utmpxname_cold_1();
  }
  if (*(void *)a1 != 0x17600787475) {
    _utmpxname_cold_2();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  uint64_t v5 = __utmpxname(a1, a2, v4);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
  return v5;
}

int utmpxname(const char *a1)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  uint64_t v2 = __utx__;

  return _utmpxname(v2, (char *)a1);
}

ssize_t strfmon(char *a1, size_t a2, const char *a3, ...)
{
  va_start(va, a3);
  uint64_t v4 = __locale_key;
  uint64_t v5 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v4);
  if (v5) {
    char v6 = v5;
  }
  else {
    char v6 = (_xlocale *)&__global_locale;
  }
  return _strfmon(a1, a2, v6, (unsigned __int8 *)a3, (double *)va);
}

uint64_t _strfmon(char *a1, unint64_t a2, locale_t a3, unsigned __int8 *a4, double *a5)
{
  v141 = a5;
  __int16 v140 = 0;
  unsigned __int8 v139 = 0;
  v138 = 0;
  char v9 = localeconv_l(a3);
  size_t v10 = 0;
  int v11 = 0;
  int v12 = 0;
  unint64_t v136 = a2;
  int v13 = &a1[a2];
  locale_t v14 = (locale_t)&__global_locale;
  if (a3 != (locale_t)-1) {
    locale_t v14 = a3;
  }
  v137 = a3;
  if (a3) {
    long long v15 = (char *)v14;
  }
  else {
    long long v15 = __c_locale;
  }
  off_t v16 = a1;
  int v17 = 32;
LABEL_7:
  while (2)
  {
    while (2)
    {
      uint64_t v18 = -(uint64_t)v16;
      for (unint64_t i = v16; ; ++i)
      {
        int v20 = *a4;
        if (v20 == 37) {
          break;
        }
        if (!*a4)
        {
          if (i < v13)
          {
            char *i = 0;
            free(v10);
            free(v12);
            return i - a1;
          }
          goto LABEL_256;
        }
LABEL_13:
        if (i >= v13) {
          goto LABEL_256;
        }
        ++a4;
        char *i = v20;
        --v18;
      }
      if (a4[1] == 37)
      {
        ++a4;
        goto LABEL_13;
      }
      v135 = a1;
      int v21 = 32;
      int v22 = 5;
      while (2)
      {
        while (2)
        {
          while (2)
          {
            ++a4;
            while (1)
            {
              uint64_t v23 = *a4;
              if (v23 != 61) {
                break;
              }
              int v21 = a4[1];
              a4 += 2;
              if (!v21) {
                goto LABEL_263;
              }
            }
            unsigned __int8 v24 = *a4;
            if ((char)v23 > 42)
            {
              if ((char)v23 != 43)
              {
                if ((char)v23 == 45)
                {
                  v22 |= 0x20u;
                  continue;
                }
                if ((char)v23 == 94)
                {
                  v22 &= ~1u;
                  continue;
                }
                goto LABEL_33;
              }
              if ((v22 & 2) == 0)
              {
                v22 |= 6u;
                continue;
              }
LABEL_263:
              int v119 = 22;
              goto LABEL_257;
            }
            break;
          }
          if ((char)v23 == 33)
          {
            v22 |= 0x10u;
            continue;
          }
          break;
        }
        if ((char)v23 == 40)
        {
          if ((v22 & 2) == 0)
          {
            v22 |= 0xAu;
            continue;
          }
          goto LABEL_263;
        }
        break;
      }
LABEL_33:
      uint64_t v25 = &_DefaultRuneLocale;
      if ((char)v23 < 0) {
        uint64_t v25 = *(_RuneLocale **)(*((void *)v15 + 166) + 120);
      }
      if ((v25->__runetype[v23] & 0x400) == 0)
      {
        int v26 = -1;
        goto LABEL_44;
      }
      int v26 = 0;
      while (1)
      {
        unsigned int v27 = &_DefaultRuneLocale;
        if ((v24 & 0x80) != 0) {
          unsigned int v27 = *(_RuneLocale **)(*((void *)v15 + 166) + 120);
        }
        if ((v27->__runetype[v24] & 0x400) == 0) {
          break;
        }
        int v26 = 10 * v26 + (char)v24 - 48;
        if (v26 > 0xFFFFFF) {
          goto LABEL_256;
        }
        unsigned __int8 v28 = *++a4;
        unsigned __int8 v24 = v28;
      }
      if (i - v135 + v26 >= v136) {
        goto LABEL_256;
      }
LABEL_44:
      if (v24 == 35)
      {
        int v29 = (char)*++a4;
        unsigned __int8 v24 = v29;
        unint64_t v30 = &_DefaultRuneLocale;
        if (v29 < 0) {
          unint64_t v30 = *(_RuneLocale **)(*((void *)v15 + 166) + 120);
        }
        if ((v30->__runetype[v24] & 0x400) == 0) {
          goto LABEL_263;
        }
        int v31 = 0;
        while (1)
        {
          long long v32 = &_DefaultRuneLocale;
          if ((v24 & 0x80) != 0) {
            long long v32 = *(_RuneLocale **)(*((void *)v15 + 166) + 120);
          }
          if ((v32->__runetype[v24] & 0x400) == 0) {
            break;
          }
          int v31 = 10 * v31 + (char)v24 - 48;
          if (v31 > 0xFFFFFF) {
            goto LABEL_256;
          }
          unsigned __int8 v33 = *++a4;
          unsigned __int8 v24 = v33;
        }
      }
      else
      {
        int v31 = -1;
      }
      if (v24 == 46)
      {
        int v34 = (char)*++a4;
        unsigned __int8 v24 = v34;
        uint64_t v35 = &_DefaultRuneLocale;
        if (v34 < 0) {
          uint64_t v35 = *(_RuneLocale **)(*((void *)v15 + 166) + 120);
        }
        if ((v35->__runetype[v24] & 0x400) == 0) {
          goto LABEL_263;
        }
        uint64_t v36 = 0;
        while (1)
        {
          uint64_t v37 = &_DefaultRuneLocale;
          if ((v24 & 0x80) != 0) {
            uint64_t v37 = *(_RuneLocale **)(*((void *)v15 + 166) + 120);
          }
          if ((v37->__runetype[v24] & 0x400) == 0) {
            break;
          }
          uint64_t v36 = (10 * v36 + (char)v24 - 48);
          if ((int)v36 > 0xFFFFFF) {
            goto LABEL_256;
          }
          unsigned __int8 v38 = *++a4;
          unsigned __int8 v24 = v38;
        }
      }
      else
      {
        uint64_t v36 = 0xFFFFFFFFLL;
      }
      int v129 = v31;
      v131 = v10;
      uint64_t v125 = v15;
      int v127 = v11;
      if (v24 == 110)
      {
        uint64_t v39 = (uint64_t)v9;
        unsigned int v40 = v22 & 0xFFFFFFBF;
      }
      else
      {
        if (v24 != 105) {
          goto LABEL_263;
        }
        uint64_t v39 = (uint64_t)v9;
        unsigned int v40 = v22 | 0x40;
      }
      if (v12)
      {
        unint64_t v41 = v12;
        int v42 = v17;
        free(v41);
        int v17 = v42;
      }
      if ((v40 & 0x40) != 0)
      {
        int v43 = strdup(*(const char **)(v39 + 24));
        if (!v43) {
          goto LABEL_264;
        }
        int v126 = v43[3];
        v43[3] = 0;
      }
      else
      {
        int v126 = v17;
        int v43 = strdup(*(const char **)(v39 + 32));
        if (!v43)
        {
LABEL_264:
          int v12 = 0;
          size_t v10 = v131;
          goto LABEL_258;
        }
      }
      v130 = v43;
      BOOL v44 = v141++;
      double v45 = *v44;
      if (*v44 >= 0.0) {
        uint64_t v46 = v40;
      }
      else {
        uint64_t v46 = v40 | 0x80;
      }
      if (v45 >= 0.0) {
        double v47 = *v44;
      }
      else {
        double v47 = -v45;
      }
      if ((v129 & 0x80000000) == 0)
      {
        int v133 = __calc_left_pad(v46 ^ 0x80, (int)v43, v39);
        int v48 = __calc_left_pad(v46, (int)v130, v39);
        int v127 = (v133 - v48) & ~((v133 - v48) >> 31);
      }
      unsigned int v134 = v46;
      v142 = 0;
      fixed = __fix_nogrouping(*(unsigned char **)(v39 + 56));
      char v50 = **(unsigned char **)(v39 + 40);
      if (!v50) {
        char v50 = **(unsigned char **)v39;
      }
      uint64_t v51 = *(unsigned char **)(v39 + 48);
      int v52 = *v51;
      uint64_t v53 = 80;
      int v12 = v130;
      if (!*v51) {
        int v52 = **(unsigned __int8 **)(v39 + 8);
      }
      if (v129 == -1) {
        int v54 = 0;
      }
      else {
        int v54 = v129;
      }
      if (v36 == -1)
      {
        if ((v134 & 0x40) == 0) {
          uint64_t v53 = 81;
        }
        int v55 = *(unsigned __int8 *)(v39 + v53);
        if (v55 == 127) {
          LOBYTE(v55) = 2;
        }
        uint64_t v36 = (char)v55;
      }
      uint64_t v128 = v39;
      v124 = (char *)fixed;
      int v123 = v52;
      char v121 = v50;
      if (v134)
      {
        unsigned __int8 v56 = *fixed;
        if ((*fixed - 127) >= 0x82u)
        {
          uint64_t v57 = 0;
          int v58 = v54;
          while (v58 > (char)v56)
          {
            int v59 = fixed[++v57];
            if (v59 == 127) {
              break;
            }
            int v60 = (char)v56;
            v58 -= (char)v56;
            unsigned __int8 v56 = v59;
            if (!v59)
            {
              LODWORD(v57) = (v58 - 1) / v60 + v57;
              break;
            }
          }
        }
        else
        {
          LODWORD(v57) = 0;
        }
        v54 += v57;
      }
      snprintf_l(v143, 0x20uLL, v137, "%%%d.%df", (v36 + v54 + 1), v36);
      int v61 = asprintf_l(&v142, v137, v143, *(void *)&v47);
      if (v61 < 0)
      {
LABEL_266:
        int v120 = *__error();
        goto LABEL_261;
      }
      int v64 = v61;
      size_t v65 = (2 * j__strsignal_r((int)v142, v62, v63)) | 1;
      uint64_t v66 = malloc_type_malloc(v65, 0x11D53FB7uLL);
      if (!v66)
      {
        free(v142);
        goto LABEL_266;
      }
      v132 = v66;
      MEMORY[0x18C122530](v66, v65);
      if (*v142 == 32)
      {
        uint64_t v67 = 0;
        do
          int v68 = v142[++v67];
        while (v68 == 32);
        v64 -= v67;
        unsigned int v69 = v67;
      }
      else
      {
        unsigned int v69 = 0;
        uint64_t v67 = 0;
      }
      unsigned int v122 = v69;
      uint64_t v70 = &v132[v65 - 1];
      if ((int)v36 >= 1)
      {
        uint64_t v71 = &v70[-v36];
        j__mkdtempat_np((int)v71, &v142[v64 + v67 - v36]);
        *(v71 - 1) = v121;
        uint64_t v70 = v71 - 1;
        v64 += ~v36;
      }
      uint64_t v72 = v124;
      if ((v134 & 1) != 0 && v123 && (int v73 = *v124, (v73 - 1) <= 0x7D))
      {
        if (v64 <= v73)
        {
          int v74 = 0;
          uint64_t v76 = v134;
        }
        else
        {
          int v74 = 0;
          uint64_t v75 = v67 - 1;
          uint64_t v76 = v134;
          do
          {
            if (v73 >= 1)
            {
              uint64_t v77 = v75 + v64;
              unsigned int v78 = v73 + 1;
              v64 -= v73;
              do
              {
                *--uint64_t v70 = v142[v77--];
                --v78;
              }
              while (v78 > 1);
            }
            *--uint64_t v70 = v123;
            ++v74;
            int v73 = v72[1];
            if (v72[1])
            {
              if (v73 == 127) {
                break;
              }
              int v73 = (char)v73;
              ++v72;
            }
            else
            {
              while (1)
              {
                int v73 = *v72;
                if (v64 <= v73) {
                  break;
                }
                if (v73 >= 1)
                {
                  uint64_t v79 = v75 + v64;
                  unsigned int v80 = v73 + 1;
                  v64 -= v73;
                  do
                  {
                    *--uint64_t v70 = v142[v79--];
                    --v80;
                  }
                  while (v80 > 1);
                }
                *--uint64_t v70 = v123;
                ++v74;
              }
            }
          }
          while (v64 > v73);
        }
        if (v64 < 1)
        {
          int v12 = v130;
          size_t v10 = v132;
          unsigned int v84 = v122;
        }
        else
        {
          uint64_t v82 = v67 + v64 - 1;
          int v83 = v64 + 1;
          int v12 = v130;
          size_t v10 = v132;
          unsigned int v84 = v122;
          do
          {
            *--uint64_t v70 = v142[v82--];
            --v83;
          }
          while (v83 > 1);
        }
        int v81 = v84 - v74;
      }
      else
      {
        v70 -= v64;
        j__mkdtempat_np((int)v70, &v142[v67]);
        int v81 = (__PAIR64__(v122, v36) - 1) >> 32;
        int v12 = v130;
        size_t v10 = v132;
        uint64_t v76 = v134;
      }
      if (v81 >= 1)
      {
        v70 -= v81;
        j__mkostemps(v70, v21, v81);
      }
      a1 = v135;
      j__mkostemp(v10, (int)v70);
      free(v142);
      __setup_vars(v76, (unsigned char *)&v140 + 1, &v140, &v139, &v138, v128);
      int v85 = v127;
      off_t v16 = i;
      if (v127 >= 1)
      {
        char v9 = (lconv *)v128;
        long long v15 = v125;
        int v17 = v126;
        while (v16 < v13)
        {
          *v16++ = 32;
          BOOL v86 = __OFSUB__(v85--, 1);
          if ((v85 < 0) ^ v86 | (v85 == 0))
          {
            int v11 = v85 - 1;
            goto LABEL_151;
          }
        }
        goto LABEL_256;
      }
      int v11 = v127 - 1;
      char v9 = (lconv *)v128;
      long long v15 = v125;
      int v17 = v126;
LABEL_151:
      if (v139) {
        BOOL v87 = 1;
      }
      else {
        BOOL v87 = (v76 & 0x80) == 0;
      }
      if (!v87)
      {
        if (v16 >= v13) {
          goto LABEL_256;
        }
        *v16++ = 40;
      }
      if (HIBYTE(v140) != 1)
      {
        if (v139 != 1) {
          goto LABEL_193;
        }
        char v96 = *v138;
        if (*v138)
        {
          uint64_t v97 = v138 + 1;
          while (v16 < v13)
          {
            *v16++ = v96;
            int v98 = *(unsigned __int8 *)v97++;
            char v96 = v98;
            if (!v98) {
              goto LABEL_187;
            }
          }
          goto LABEL_256;
        }
LABEL_187:
        if (v140 != 2) {
          goto LABEL_193;
        }
LABEL_188:
        if (v16 >= v13) {
          goto LABEL_256;
        }
        *v16++ = 32;
        goto LABEL_193;
      }
      if ((v139 & 0xFD) == 1)
      {
        char v88 = *v138;
        if (*v138)
        {
          unint64_t v89 = v138 + 1;
          while (v16 < v13)
          {
            *v16++ = v88;
            int v90 = *(unsigned __int8 *)v89++;
            char v88 = v90;
            if (!v90) {
              goto LABEL_163;
            }
          }
          goto LABEL_256;
        }
LABEL_163:
        if (v140 == 2)
        {
          if (v16 >= v13) {
            goto LABEL_256;
          }
          *v16++ = 32;
        }
      }
      if ((v76 & 0x10) == 0)
      {
        LOBYTE(v91) = *v12;
        if (*v12)
        {
          uint64_t v92 = 0;
          while (&v16[v92] < v13)
          {
            v16[v92] = v91;
            int v91 = v12[++v92];
            if (!v91)
            {
              v16 += v92;
              goto LABEL_172;
            }
          }
          goto LABEL_256;
        }
LABEL_172:
        if (v139 != 4)
        {
          if (v140 == 1)
          {
            if (v16 >= v13) {
              goto LABEL_256;
            }
            *v16++ = v17;
          }
          goto LABEL_193;
        }
        if (v140 == 2)
        {
          if (v16 >= v13) {
            goto LABEL_256;
          }
          *v16++ = v17;
        }
        char v93 = *v138;
        if (*v138)
        {
          unsigned __int32 v94 = v138 + 1;
          while (v16 < v13)
          {
            *v16++ = v93;
            int v95 = *(unsigned __int8 *)v94++;
            char v93 = v95;
            if (!v95) {
              goto LABEL_180;
            }
          }
          goto LABEL_256;
        }
LABEL_180:
        if (v140 == 1) {
          goto LABEL_188;
        }
      }
LABEL_193:
      LOBYTE(v99) = *v10;
      if (*v10)
      {
        uint64_t v100 = 0;
        while (&v16[v100] < v13)
        {
          v16[v100] = v99;
          int v99 = v10[++v100];
          if (!v99)
          {
            v16 += v100;
            goto LABEL_198;
          }
        }
        goto LABEL_256;
      }
LABEL_198:
      if (HIBYTE(v140)) {
        goto LABEL_230;
      }
      if (v139 == 3)
      {
        if (v140 == 1)
        {
          if (v16 >= v13) {
            goto LABEL_256;
          }
          *v16++ = 32;
        }
        char v101 = *v138;
        if (*v138)
        {
          unint64_t v102 = v138 + 1;
          while (v16 < v13)
          {
            *v16++ = v101;
            int v103 = *(unsigned __int8 *)v102++;
            char v101 = v103;
            if (!v103) {
              goto LABEL_207;
            }
          }
          goto LABEL_256;
        }
      }
LABEL_207:
      if ((v76 & 0x10) != 0)
      {
LABEL_230:
        int v107 = v139;
      }
      else
      {
        BOOL v104 = v139 == 3 && v140 == 2;
        if (v104 || v140 == 1 && v139 <= 4u && v139 != 3)
        {
          if (v16 >= v13) {
            goto LABEL_256;
          }
          *v16++ = v17;
        }
        LOBYTE(v105) = *v12;
        if (*v12)
        {
          uint64_t v106 = 0;
          while (&v16[v106] < v13)
          {
            v16[v106] = v105;
            int v105 = v12[++v106];
            if (!v105)
            {
              v16 += v106;
              goto LABEL_222;
            }
          }
          goto LABEL_256;
        }
LABEL_222:
        int v107 = v139;
        if (v139 == 4)
        {
          if (v140 == 2)
          {
            if (v16 >= v13) {
              goto LABEL_256;
            }
            *v16++ = 32;
          }
          char v108 = *v138;
          if (*v138)
          {
            unint64_t v109 = v138 + 1;
            while (v16 < v13)
            {
              *v16++ = v108;
              int v110 = *(unsigned __int8 *)v109++;
              char v108 = v110;
              if (!v110) {
                goto LABEL_230;
              }
            }
            goto LABEL_256;
          }
          goto LABEL_230;
        }
      }
      if (v107 == 2)
      {
        if (v140 == 2)
        {
          if (v16 >= v13) {
            goto LABEL_256;
          }
          *v16++ = 32;
        }
        char v111 = *v138;
        if (*v138)
        {
          int v112 = v138 + 1;
          while (v16 < v13)
          {
            *v16++ = v111;
            int v113 = *(unsigned __int8 *)v112++;
            char v111 = v113;
            if (!v113) {
              goto LABEL_239;
            }
          }
          goto LABEL_256;
        }
      }
LABEL_239:
      if (!v139)
      {
        if ((v76 & 0x80) != 0)
        {
          if (v16 >= v13) {
            goto LABEL_256;
          }
          char v114 = 41;
LABEL_246:
          *v16++ = v114;
        }
        else if ((v129 & 0x80000000) == 0)
        {
          if (v16 >= v13) {
            goto LABEL_256;
          }
          char v114 = 32;
          goto LABEL_246;
        }
      }
      ++a4;
      int v115 = v16 - i;
      if (v16 - i >= v26) {
        continue;
      }
      break;
    }
    if ((v134 & 0x20) == 0)
    {
      int v116 = v15;
      j__mkostemp(&i[v26 - v115], (int)i);
      j__mkostemps(i, 32, v26 - v115);
      int v17 = v126;
      long long v15 = v116;
      char v9 = (lconv *)v128;
      v16 += v26 - (uint64_t)v115;
      size_t v10 = v132;
      int v11 = v115;
      continue;
    }
    break;
  }
  uint64_t v117 = &v16[v18];
  while (v16 < v13)
  {
    *v16++ = 32;
    if ((uint64_t)++v117 >= v26) {
      goto LABEL_7;
    }
  }
LABEL_256:
  int v119 = 7;
LABEL_257:
  *__error() = v119;
LABEL_258:
  int v120 = *__error();
  if (v10) {
    free(v10);
  }
  if (v12) {
LABEL_261:
  }
    free(v12);
  *__error() = v120;
  return -1;
}

ssize_t strfmon_l(char *a1, size_t a2, locale_t a3, const char *a4, ...)
{
  va_start(va, a4);
  locale_t v4 = (locale_t)&__global_locale;
  if (a3 != (locale_t)-1) {
    locale_t v4 = a3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = (_xlocale *)__c_locale;
  }
  return _strfmon(a1, a2, v5, (unsigned __int8 *)a4, (double *)va);
}

uint64_t __calc_left_pad(uint64_t a1, int a2, uint64_t a3)
{
  unsigned int v4 = a1;
  __int16 v13 = 0;
  char v12 = 0;
  *(void *)__sig = 0;
  __setup_vars(a1, (unsigned char *)&v13 + 1, &v13, &v12, (const char **)__sig, a3);
  int v7 = HIBYTE(v13);
  if (HIBYTE(v13))
  {
    unsigned int v8 = j__strsignal_r(a2, v5, v6);
    if ((_BYTE)v13) {
      uint64_t v9 = v8 + 1;
    }
    else {
      uint64_t v9 = v8;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ((v12 - 3) < 2)
  {
    if (!v7) {
      return v9;
    }
    return (v9 + j__strsignal_r(__sig[0], v5, v6));
  }
  if (v12 == 1) {
    return (v9 + j__strsignal_r(__sig[0], v5, v6));
  }
  if (v12) {
    return v9;
  }
  else {
    return v9 + ((v4 >> 7) & 1);
  }
}

uint64_t __setup_vars(uint64_t result, unsigned char *a2, unsigned char *a3, unsigned char *a4, const char **a5, uint64_t a6)
{
  if ((~result & 0xC0) == 0)
  {
    *a2 = *(unsigned char *)(a6 + 89);
    *a3 = *(unsigned char *)(a6 + 91);
    if ((result & 8) == 0)
    {
      char v6 = *(unsigned char *)(a6 + 93);
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ((result & 0x40) != 0)
  {
    *a2 = *(unsigned char *)(a6 + 88);
    *a3 = *(unsigned char *)(a6 + 90);
    if ((result & 8) == 0)
    {
      char v7 = *(unsigned char *)(a6 + 92);
      goto LABEL_11;
    }
LABEL_10:
    char v7 = 0;
    goto LABEL_11;
  }
  if ((result & 0x80) == 0)
  {
    *a2 = *(unsigned char *)(a6 + 82);
    *a3 = *(unsigned char *)(a6 + 83);
    if ((result & 8) == 0)
    {
      char v7 = *(unsigned char *)(a6 + 86);
LABEL_11:
      *a4 = v7;
      unsigned int v8 = *(const char **)(a6 + 64);
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  *a2 = *(unsigned char *)(a6 + 84);
  *a3 = *(unsigned char *)(a6 + 85);
  if ((result & 8) == 0)
  {
    char v6 = *(unsigned char *)(a6 + 87);
    goto LABEL_15;
  }
LABEL_14:
  char v6 = 0;
LABEL_15:
  *a4 = v6;
  unsigned int v8 = *(const char **)(a6 + 72);
  if (!*v8) {
    unsigned int v8 = "-";
  }
LABEL_17:
  *a5 = v8;
  if (*a2) {
    *a2 = 1;
  }
  if (*a3 == 127) {
    *a3 = 0;
  }
  if (*a4 == 127) {
    *a4 = 0;
  }
  return result;
}

void *__cdecl rb_tree_find_node_geq(rb_tree_t *a1, const void *a2)
{
  uint64_t v2 = a1->opaque[0];
  if (!a1->opaque[0]) {
    return 0;
  }
  unsigned int v4 = 0;
  uint64_t v5 = a1->opaque[1];
  char v6 = (uint64_t (*)(void, char *, const void *))v5[1];
  while (1)
  {
    char v7 = (char *)v2 - v5[2];
    int v8 = v6(v5[3], v7, a2);
    if (!v8) {
      break;
    }
    if (v8 > 0) {
      unsigned int v4 = v2;
    }
    uint64_t v2 = (void *)v2[v8 >> 31];
    if (!v2)
    {
      if (!v4) {
        return 0;
      }
      return (char *)v4 - v5[2];
    }
  }
  return v7;
}

void *__cdecl rb_tree_find_node_leq(rb_tree_t *a1, const void *a2)
{
  uint64_t v2 = a1->opaque[0];
  if (!a1->opaque[0]) {
    return 0;
  }
  unsigned int v4 = 0;
  uint64_t v5 = a1->opaque[1];
  char v6 = (uint64_t (*)(void, char *, const void *))v5[1];
  while (1)
  {
    char v7 = (char *)v2 - v5[2];
    int v8 = v6(v5[3], v7, a2);
    if (!v8) {
      break;
    }
    if (v8 < 0) {
      unsigned int v4 = v2;
    }
    uint64_t v2 = (void *)v2[v8 >> 31];
    if (!v2)
    {
      if (!v4) {
        return 0;
      }
      return (char *)v4 - v5[2];
    }
  }
  return v7;
}

int regncomp_l(regex_t *a1, const char *a2, size_t a3, int a4, locale_t a5)
{
  unint64_t v7 = a3;
  size_t v10 = malloc_type_malloc(4 * a3 + 4, 0x100004052888210uLL);
  if (!v10) {
    return 12;
  }
  int v11 = v10;
  locale_t v12 = (locale_t)&__global_locale;
  if (a5 != (locale_t)-1) {
    locale_t v12 = a5;
  }
  if (a5) {
    __int16 v13 = v12;
  }
  else {
    __int16 v13 = (_xlocale *)&__c_locale;
  }
  if (*(_DWORD *)(*((void *)v13 + 166) + 64) == 1)
  {
    if (v7)
    {
      uint64_t v14 = 0;
      do
      {
        *(_DWORD *)&v10[4 * v14] = a2[v14];
        ++v14;
      }
      while (v7 > v14);
    }
    goto LABEL_22;
  }
  off_t v16 = (__int32 *)v10;
  memset(&v19, 0, sizeof(v19));
  if (!v7)
  {
LABEL_21:
    unint64_t v7 = ((char *)v16 - v11) >> 2;
LABEL_22:
    *(_DWORD *)&v11[4 * v7] = 0;
    int v15 = tre_compile((uint64_t)a1, (uint64_t)v11, v7, a4, (size_t)v13);
    goto LABEL_23;
  }
  off_t v16 = (__int32 *)v10;
  while (1)
  {
    size_t v17 = mbrtowc_l(v16, a2, v7, &v19, v13);
    if (!v17) {
      break;
    }
    if (v17 >= 0xFFFFFFFFFFFFFFFELL)
    {
      int v15 = 17;
      goto LABEL_23;
    }
LABEL_20:
    a2 += v17;
    ++v16;
    v7 -= v17;
    if (!v7) {
      goto LABEL_21;
    }
  }
  if (!*a2)
  {
    size_t v17 = 1;
    goto LABEL_20;
  }
  int v15 = 2;
LABEL_23:
  free(v11);
  return v15;
}

int regncomp(regex_t *a1, const char *a2, size_t a3, int a4)
{
  uint64_t v4 = __locale_key;
  uint64_t v5 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v4);
  if (v5) {
    char v6 = v5;
  }
  else {
    char v6 = (_xlocale *)&__global_locale;
  }
  return regncomp_l(a1, a2, a3, a4, v6);
}

int regcomp_l(regex_t *a1, const char *a2, int a3, locale_t a4)
{
  if ((a3 & 0x20) != 0)
  {
    re_endp = a1->re_endp;
    size_t v8 = re_endp - a2;
    if (re_endp < a2) {
      return 16;
    }
  }
  else
  {
    size_t v8 = j__strsignal_r((int)a2, (char *)a2, *(size_t *)&a3);
  }

  return regncomp_l(a1, a2, v8, a3, a4);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  uint64_t v3 = __locale_key;
  uint64_t v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = (_xlocale *)&__global_locale;
  }
  return regcomp_l(a1, a2, a3, v5);
}

uint64_t regwncomp_l(uint64_t a1, uint64_t a2, int a3, unsigned int a4, char *a5)
{
  uint64_t v5 = (char *)&__global_locale;
  if (a5 != (char *)-1) {
    uint64_t v5 = a5;
  }
  if (a5) {
    char v6 = v5;
  }
  else {
    char v6 = __c_locale;
  }
  return tre_compile(a1, a2, a3, a4, (size_t)v6);
}

int regwncomp(regex_t *a1, const __int32 *a2, size_t a3, int a4)
{
  uint64_t v4 = __locale_key;
  uint64_t v5 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v4);
  if (v5) {
    char v6 = v5;
  }
  else {
    char v6 = &__global_locale;
  }
  return tre_compile((uint64_t)a1, (uint64_t)a2, a3, a4, (size_t)v6);
}

int regwcomp_l(regex_t *a1, const __int32 *a2, int a3, locale_t a4)
{
  locale_t v7 = (locale_t)&__global_locale;
  if (a4 != (locale_t)-1) {
    locale_t v7 = a4;
  }
  if (a4) {
    size_t v8 = (char *)v7;
  }
  else {
    size_t v8 = __c_locale;
  }
  int v9 = wcslen(a2);

  return tre_compile((uint64_t)a1, (uint64_t)a2, v9, a3, (size_t)v8);
}

int regwcomp(regex_t *a1, const __int32 *a2, int a3)
{
  int v6 = wcslen(a2);
  uint64_t v7 = __locale_key;
  size_t v8 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v7);
  if (v8) {
    int v9 = v8;
  }
  else {
    int v9 = &__global_locale;
  }

  return tre_compile((uint64_t)a1, (uint64_t)a2, v6, a3, (size_t)v9);
}

uint64_t tre_fill_pmatch(unint64_t a1, void *a2, char a3, uint64_t a4, char *a5, unsigned int a6)
{
  if ((a3 & 4) != 0) {
    return 0;
  }
  unsigned int v9 = 0;
  if (a5 && (a6 & 0x80000000) == 0)
  {
    uint64_t v12 = *(void *)(a4 + 48);
    __int16 v13 = a5;
    if (v12)
    {
      __int16 v13 = a5;
      if (*(int *)(v12 + 16) >= 1)
      {
        uint64_t v14 = (char *)malloc_type_malloc(16 * *(int *)(a4 + 80), 0x1000040451B5BE8uLL);
        if (!v14) {
          return 12;
        }
        __int16 v13 = v14;
        j__mkdtempat_np((int)v14, a5);
        tre_reset_last_matched_branches((uint64_t)v13, *(int **)(*(void *)(a4 + 48) + 8), *(_DWORD *)(*(void *)(a4 + 48) + 16), 0, 0);
      }
    }
    unsigned int v9 = 0;
    int v15 = *(_DWORD *)(a4 + 72);
    if (v15 && a1)
    {
      int v16 = *(_DWORD *)(a4 + 88);
      unint64_t v17 = (v15 - 1);
      if (a1 - 1 < v17) {
        unint64_t v17 = a1 - 1;
      }
      unint64_t v18 = v17 + 1;
      mbstate_t v19 = (int *)(*(void *)(a4 + 24) + 4);
      int v20 = a2;
      do
      {
        uint64_t v21 = *(v19 - 1);
        uint64_t v22 = a6;
        if (v21 != v16)
        {
          if (*(int *)&v13[16 * v21] < 1) {
            LODWORD(v22) = -1;
          }
          else {
            LODWORD(v22) = *(_DWORD *)&v13[16 * v21 + 8];
          }
          uint64_t v22 = (int)v22;
        }
        *int v20 = v22;
        uint64_t v23 = *v19;
        uint64_t v24 = a6;
        if (v23 != v16)
        {
          if (*(int *)&v13[16 * v23] < 1) {
            LODWORD(v24) = -1;
          }
          else {
            LODWORD(v24) = *(_DWORD *)&v13[16 * v23 + 8];
          }
          uint64_t v24 = (int)v24;
        }
        v20[1] = v24;
        if (v22 == -1 || v24 == -1)
        {
          *int v20 = -1;
          v20[1] = -1;
        }
        v20 += 2;
        v19 += 2;
        --v18;
      }
      while (v18);
      unsigned int v9 = v17 + 1;
    }
    if (v13 != a5) {
      free(v13);
    }
  }
  unint64_t v25 = v9;
  if (v9 < a1)
  {
    unsigned int v26 = v9 + 1;
    do
    {
      unsigned int v27 = &a2[2 * v25];
      unint64_t v25 = v26;
      *unsigned int v27 = -1;
      v27[1] = -1;
      ++v26;
    }
    while (v25 < a1);
  }
  return 0;
}

uint64_t tre_reset_last_matched_branches(uint64_t result, int *a2, int a3, int a4, int a5)
{
  if (a3 >= 1)
  {
    int v7 = a3;
    uint64_t v9 = result;
    int v10 = 0;
    int v11 = (_DWORD *)(result + 16 * a4 + 12);
    do
    {
      int v12 = a2[2];
      if (v12 == 1)
      {
        __int16 v13 = *(int ***)a2;
        if (a4 >= 1 && (a5 || *(_DWORD *)(v9 + 16 * *((int *)v13 + 5) + 12) < *v11))
        {
          int v14 = *((_DWORD *)v13 + 6);
          if (v14 >= 1)
          {
            int v15 = *v13;
            unsigned int v16 = v14 + 1;
            do
            {
              uint64_t v17 = *v15++;
              *(_DWORD *)(v9 + 16 * v17) = 0;
              --v16;
            }
            while (v16 > 1);
          }
        }
        if (*((int *)v13 + 4) >= 1) {
          uint64_t result = tre_reset_last_matched_branches(v9, v13[1]);
        }
      }
      else
      {
        if (a5) {
          goto LABEL_17;
        }
        if (v12 >= 1)
        {
          int v10 = 0;
          unint64_t v18 = (int *)(*(void *)a2 + 20);
          unsigned int v19 = v12 + 1;
          do
          {
            uint64_t v20 = *v18;
            v18 += 8;
            int v21 = *(_DWORD *)(v9 + 16 * v20 + 12);
            if (v21 > v10) {
              int v10 = v21;
            }
            --v19;
          }
          while (v19 > 1);
LABEL_17:
          if (v12 >= 1)
          {
            uint64_t v22 = *(int ***)a2;
            do
            {
              if (a5 || *(_DWORD *)(v9 + 16 * *((int *)v22 + 5) + 12) < v10)
              {
                int v23 = *((_DWORD *)v22 + 6);
                if (v23 >= 1)
                {
                  uint64_t v24 = *v22;
                  unsigned int v25 = v23 + 1;
                  do
                  {
                    uint64_t v26 = *v24++;
                    *(_DWORD *)(v9 + 16 * v26) = 0;
                    --v25;
                  }
                  while (v25 > 1);
                }
              }
              if (*((int *)v22 + 4) >= 1) {
                uint64_t result = tre_reset_last_matched_branches(v9, v22[1]);
              }
              v22 += 4;
              BOOL v27 = __OFSUB__(v12--, 1);
            }
            while (!((v12 < 0) ^ v27 | (v12 == 0)));
          }
          goto LABEL_32;
        }
        int v10 = 0;
      }
LABEL_32:
      a2 += 4;
    }
    while (v7-- > 1);
  }
  return result;
}

int regnexec(const regex_t *a1, const char *a2, size_t a3, size_t a4, regmatch_t __pmatch[], int a6)
{
  if (a1->re_magic != 62053) {
    return 2;
  }
  re_g = a1->re_g;
  if (*(_DWORD *)(*(void *)(*((void *)re_g + 7) + 1328) + 64) == 1) {
    int v10 = 1;
  }
  else {
    int v10 = 2;
  }
  return tre_match((unsigned int *)re_g, (uint64_t)a2, a3, v10, a4, &__pmatch->rm_so, a6);
}

uint64_t tre_match(unsigned int *a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, uint64_t *a6, unsigned int a7)
{
  __int16 v7 = a7;
  unint64_t v9 = a5;
  int v11 = a3;
  if (a6) {
    int v14 = (a7 >> 2) & 1;
  }
  else {
    int v14 = 0;
  }
  if (v14 != 1)
  {
    int v28 = v14;
    uint64_t v18 = 0;
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  uint64_t v15 = *a6;
  if (*a6 < 0) {
    return 16;
  }
  if (a3 != -1 || (v16 = a6[1], v17 = 16, (v16 & 0x8000000000000000) == 0) && (int v11 = v16 - v15, v16 >= v15))
  {
    int v28 = 1;
    if (a4) {
      uint64_t v18 = *a6;
    }
    else {
      uint64_t v18 = 4 * v15;
    }
LABEL_13:
    unsigned int v19 = 0;
    if (a5 && (uint64_t v20 = a1[20], (int)v20 >= 1) && (v19 = (int *)malloc_type_malloc(16 * v20, 0x1000040451B5BE8uLL)) == 0)
    {
      return 12;
    }
    else
    {
      unsigned int v29 = 0;
      int v21 = (char *)(a2 + v18);
      if (a1[25] | v7 & 0x400) {
        uint64_t v22 = tre_tnfa_run_backtrack((uint64_t)a1, v21, v11, a4, (uint64_t)v19, v7, &v29);
      }
      else {
        uint64_t v22 = tre_tnfa_run_parallel((uint64_t)a1, v21, v11, a4, v19, v7, &v29);
      }
      uint64_t v17 = v22;
      if (!v22)
      {
        uint64_t v17 = tre_fill_pmatch(v9, a6, a1[24], (uint64_t)a1, (char *)v19, v29);
        if (!v17)
        {
          BOOL v23 = (a1[24] & 4) != 0 || v9 == 0;
          int v24 = v28;
          if (v23) {
            int v24 = 0;
          }
          if (v24 == 1)
          {
            unsigned int v25 = a6 + 1;
            do
            {
              uint64_t v26 = *(v25 - 1);
              if ((v26 & 0x8000000000000000) == 0) {
                *(v25 - 1) = v26 + v15;
              }
              if ((*v25 & 0x8000000000000000) == 0) {
                *v25 += v15;
              }
              v25 += 2;
              --v9;
            }
            while (v9);
          }
          uint64_t v17 = 0;
        }
      }
      if (v19) {
        free(v19);
      }
    }
  }
  return v17;
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return regnexec(a1, a2, 0xFFFFFFFFFFFFFFFFLL, a3, __pmatch, a5);
}

int regwnexec(const regex_t *a1, const __int32 *a2, size_t a3, size_t a4, regmatch_t __pmatch[], int a6)
{
  if (a1->re_magic == 62053) {
    return tre_match((unsigned int *)a1->re_g, (uint64_t)a2, a3, 0, a4, &__pmatch->rm_so, a6);
  }
  else {
    return 2;
  }
}

int regwexec(const regex_t *a1, const __int32 *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  if (a1->re_magic == 62053) {
    return tre_match((unsigned int *)a1->re_g, (uint64_t)a2, -1, 0, a3, &__pmatch->rm_so, a5);
  }
  else {
    return 2;
  }
}

char *tre_ast_new_node(uint64_t a1, int a2, size_t a3)
{
  int v6 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x48uLL);
  if (v6)
  {
    __int16 v7 = tre_mem_alloc_impl(a1, 0, 0, 1, a3);
    *(void *)int v6 = v7;
    if (v7)
    {
      *((_WORD *)v6 + 32) = -1;
      *((_DWORD *)v6 + 12) = a2;
      *((_DWORD *)v6 + 13) = -1;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

char *tre_ast_new_literal(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t result = tre_ast_new_node(a1, 0, 0x18uLL);
  if (result)
  {
    size_t v8 = *(_DWORD **)result;
    *size_t v8 = a2;
    v8[1] = a3;
    v8[2] = a4;
  }
  return result;
}

char *tre_ast_new_iter(uint64_t a1, uint64_t a2, int a3, int a4, char a5)
{
  uint64_t result = tre_ast_new_node(a1, 2, 0x20uLL);
  if (result)
  {
    uint64_t v10 = *(void *)result;
    *(void *)uint64_t v10 = a2;
    *(_DWORD *)(v10 + 8) = a3;
    *(_DWORD *)(v10 + 12) = a4;
    *(unsigned char *)(v10 + 16) = *(unsigned char *)(v10 + 16) & 0xFE | a5 & 1;
    *((_DWORD *)result + 14) = *(_DWORD *)(a2 + 56);
  }
  return result;
}

char *tre_ast_new_union(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = tre_ast_new_node(a1, 3, 0x18uLL);
  if (result)
  {
    int v6 = *(void **)result;
    *int v6 = a2;
    v6[1] = a3;
    *((_DWORD *)result + 14) = *(_DWORD *)(a3 + 56) + *(_DWORD *)(a2 + 56);
  }
  return result;
}

char *tre_ast_new_catenation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = tre_ast_new_node(a1, 1, 0x10uLL);
  if (result)
  {
    int v6 = *(void **)result;
    *int v6 = a2;
    v6[1] = a3;
    *((_DWORD *)result + 14) = *(_DWORD *)(a3 + 56) + *(_DWORD *)(a2 + 56);
  }
  return result;
}

uint64_t tre_compile(uint64_t a1, uint64_t a2, int a3, unsigned int a4, size_t a5)
{
  uint64_t v10 = (void **)tre_stack_new(512, 10240, 128);
  if (!v10) {
    return 12;
  }
  int v11 = v10;
  int v12 = (uint64_t *)tre_mem_new_impl(0, 0);
  if (!v12)
  {
    tre_stack_destroy(v11);
    return 12;
  }
  __int16 v13 = v12;
  *(_OWORD *)count = 0u;
  memset(v87, 0, sizeof(v87));
  uint64_t v83 = 0;
  long long v85 = 0u;
  v82[0] = v12;
  v82[1] = v11;
  uint64_t v84 = a2;
  if ((~a4 & 0x101) != 0) {
    unsigned int v14 = a4 & 0xFFFFFFBF;
  }
  else {
    unsigned int v14 = a4;
  }
  DWORD1(v87[1]) = v14;
  DWORD2(v87[0]) = -1;
  count[0] = a5;
  LODWORD(count[1]) = a3;
  LODWORD(v87[0]) = 0x40000000;
  uint64_t v15 = tre_parse((uint64_t)v82);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
LABEL_48:
    tre_mem_destroy(v13);
    tre_stack_destroy(v11);
    if (v17) {
      free(v17);
    }
    if (v18) {
      free(v18);
    }
    *(void *)(a1 + 24) = v19;
    if (v19) {
      *(void *)(v19 + 56) = 0;
    }
    tre_free(a1);
    return v16;
  }
  int v20 = HIDWORD(count[1]);
  int v21 = DWORD2(v87[0]);
  *(void *)(a1 + 8) = SHIDWORD(count[1]) - 1;
  uint64_t v22 = v83;
  if ((v21 & 0x80000000) == 0 && LODWORD(v87[1]))
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v16 = 2;
    goto LABEL_48;
  }
  if (v21 >= v20)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v16 = 6;
    goto LABEL_48;
  }
  BOOL v23 = malloc_type_calloc(1uLL, 0x78uLL, 0x1030040C46BC5F1uLL);
  uint64_t v19 = (uint64_t)v23;
  if (!v23) {
    goto LABEL_45;
  }
  v23[25] = (DWORD2(v87[0]) & 0x80000000) == 0;
  int v24 = LODWORD(v87[0]) - 0x40000000;
  v23[18] = HIDWORD(count[1]);
  v23[19] = v24;
  int v25 = HIDWORD(v87[0]);
  *((void *)v23 + 13) = *(void *)((char *)v87 + 12);
  *((void *)v23 + 7) = count[0];
  if ((v14 & 4) != 0 && v25 < 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v26 = tre_add_tags(0, (int *)v11, v22, (uint64_t)v23);
    if (v26) {
      goto LABEL_33;
    }
    uint64_t v34 = *(unsigned int *)(v19 + 80);
    if ((int)v34 < 1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v35 = (char *)malloc_type_malloc(4 * v34 + 4, 0x100004052888210uLL);
      uint64_t v17 = v35;
      if (!v35) {
        goto LABEL_46;
      }
      *(void *)(v19 + 32) = v35;
      j__mkostemps(v35, 255, 4 * *(_DWORD *)(v19 + 80) + 4);
      LODWORD(v34) = *(_DWORD *)(v19 + 80);
    }
    uint64_t v36 = malloc_type_calloc((2 * v34 + 3), 4uLL, 0x100004052888210uLL);
    *(void *)(v19 + 40) = v36;
    if (!v36) {
      goto LABEL_45;
    }
    uint64_t v37 = (char *)malloc_type_calloc(HIDWORD(count[1]), 8uLL, 0x100004000313F17uLL);
    if (!v37) {
      goto LABEL_45;
    }
    uint64_t v38 = HIDWORD(count[1]);
    if (SHIDWORD(count[1]) >= 1)
    {
      uint64_t v39 = v37 + 4;
      do
      {
        _DWORD *v39 = -1;
        v39 += 2;
        --v38;
      }
      while (v38);
    }
    *(void *)(v19 + 24) = v37;
    uint64_t v26 = tre_add_tags((uint64_t)v13, (int *)v11, v22, v19);
    if (v26) {
      goto LABEL_33;
    }
  }
  uint64_t v26 = tre_expand_ast((uint64_t)v13, (int *)v11, v22, (int *)v87 + 1, (uint64_t)v17);
  if (v26)
  {
LABEL_33:
    uint64_t v16 = v26;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_48;
  }
  int v27 = DWORD1(v87[0])++;
  int v28 = tre_ast_new_literal((uint64_t)v13, 0, 0, v27);
  if (!v28 || (unsigned int v29 = tre_ast_new_catenation((uint64_t)v13, v22, (uint64_t)v28)) == 0)
  {
LABEL_45:
    uint64_t v17 = 0;
    goto LABEL_46;
  }
  unint64_t v30 = v29;
  uint64_t v26 = tre_compute_nfl((uint64_t)v13, (int *)v11, (uint64_t)v29);
  if (v26) {
    goto LABEL_33;
  }
  uint64_t v17 = malloc_type_malloc(4 * SDWORD1(v87[0]), 0x100004052888210uLL);
  if (!v17)
  {
LABEL_46:
    uint64_t v18 = 0;
LABEL_47:
    uint64_t v16 = 12;
    goto LABEL_48;
  }
  uint64_t v18 = (int *)malloc_type_malloc(4 * SDWORD1(v87[0]), 0x100004052888210uLL);
  if (!v18) {
    goto LABEL_47;
  }
  if (SDWORD1(v87[0]) >= 1)
  {
    uint64_t v31 = 0;
    do
      *((_DWORD *)v17 + v31++) = 0;
    while (v31 < SDWORD1(v87[0]));
  }
  tre_ast_to_tnfa(v30, 0, (uint64_t)v17, 0);
  if (SDWORD1(v87[0]) < 1)
  {
    int v33 = 0;
  }
  else
  {
    uint64_t v32 = 0;
    int v33 = 0;
    do
    {
      v18[v32] = v33;
      v33 += *((_DWORD *)v17 + v32) + 1;
      *((_DWORD *)v17 + v32++) = 0;
    }
    while (v32 < SDWORD1(v87[0]));
  }
  unint64_t v41 = malloc_type_calloc((v33 + 1), 0x38uLL, 0x1032040B21D0138uLL);
  if (!v41) {
    goto LABEL_47;
  }
  *(void *)uint64_t v19 = v41;
  *(_DWORD *)(v19 + 64) = v33;
  unsigned int v80 = v41;
  uint64_t v42 = tre_ast_to_tnfa(v30, (uint64_t)v41, (uint64_t)v17, (uint64_t)v18);
  if (v42)
  {
    uint64_t v16 = v42;
    goto LABEL_48;
  }
  *(_DWORD *)(v19 + 68) = -1;
  unsigned int v78 = v30;
  int v43 = (_DWORD *)*((void *)v30 + 3);
  if (*(_WORD *)(v22 + 64)) {
    goto LABEL_77;
  }
  uint64_t v44 = *v43;
  if ((v44 & 0x80000000) != 0) {
    goto LABEL_77;
  }
  int v45 = -1;
  uint64_t v46 = *((void *)v30 + 3);
  do
  {
    int v47 = v18[v44];
    if (v80[7 * v47 + 1])
    {
      int v48 = (char *)&v80[7 * v47];
      do
      {
        int v49 = *(_DWORD *)v48;
        int v50 = *((_DWORD *)v48 + 1);
        if (*(_DWORD *)v48 <= v50)
        {
          if (v49 == -1 || v50 != v49 || v45 != -1)
          {
            *(_DWORD *)(v19 + 68) = -1;
            goto LABEL_77;
          }
          *(_DWORD *)(v19 + 68) = v49;
          int v45 = v49;
        }
        uint64_t v53 = *((void *)v48 + 8);
        v48 += 56;
      }
      while (v53);
    }
    unsigned int v54 = *(_DWORD *)(v46 + 64);
    v46 += 64;
    uint64_t v44 = v54;
  }
  while ((v54 & 0x80000000) == 0);
LABEL_77:
  if ((*v43 & 0x80000000) != 0)
  {
    size_t v56 = 1;
  }
  else
  {
    int v55 = v43 + 16;
    size_t v56 = 1;
    do
    {
      int v57 = *v55;
      v55 += 16;
      ++v56;
    }
    while ((v57 & 0x80000000) == 0);
  }
  uint64_t v79 = malloc_type_calloc(v56, 0x38uLL, 0x1032040B21D0138uLL);
  if (!v79) {
    goto LABEL_47;
  }
  *(void *)(v19 + 8) = v79;
  int v58 = (unsigned int *)*((void *)v30 + 3);
  uint64_t v59 = *v58;
  if ((v59 & 0x80000000) != 0)
  {
    unsigned int v76 = 0;
  }
  else
  {
    uint64_t v60 = 0;
    int v61 = v79;
    do
    {
      int v62 = (char *)&v80[7 * v18[v59]];
      size_t v63 = &v61[7 * v60];
      v63[3] = 0;
      int v64 = v63 + 3;
      *(v64 - 2) = v62;
      *((_DWORD *)v64 - 2) = v59;
      uint64_t v65 = *((void *)v58 + 2);
      uint64_t v81 = v60;
      if (v65)
      {
        uint64_t v66 = 0;
        do
        {
          int v67 = *(_DWORD *)(v65 + v66);
          v66 += 4;
        }
        while ((v67 & 0x80000000) == 0);
        int v68 = malloc_type_malloc(v66 & 0x3FFFFFFFCLL, 0x100004052888210uLL);
        void *v64 = v68;
        if (!v68) {
          goto LABEL_47;
        }
        j__mkdtempat_np((int)v68, *((char **)v58 + 2));
        int v61 = v79;
        uint64_t v60 = v81;
      }
      unsigned int v69 = &v61[7 * v60];
      v69[4] = 0;
      uint64_t v70 = v69 + 4;
      if (*((void *)v58 + 6))
      {
        uint64_t v71 = malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
        *uint64_t v70 = v71;
        if (!v71) {
          goto LABEL_47;
        }
        uint64_t v72 = (long long *)*((void *)v58 + 6);
        long long v73 = *v72;
        long long v74 = v72[1];
        v71[8] = *((_DWORD *)v72 + 8);
        *(_OWORD *)uint64_t v71 = v73;
        *((_OWORD *)v71 + 1) = v74;
        uint64_t v60 = v81;
        int v61 = v79;
      }
      unsigned int v75 = v58[16];
      v58 += 16;
      uint64_t v59 = v75;
      LODWORD(v61[7 * v60++ + 5]) = *(v58 - 10);
    }
    while ((v75 & 0x80000000) == 0);
    unsigned int v76 = v60;
  }
  v79[7 * v76 + 1] = 0;
  *(_DWORD *)(v19 + 64) = v33;
  *(void *)(v19 + 16) = &v80[7 * v18[**((int **)v78 + 4)]];
  *(_DWORD *)(v19 + 92) = DWORD1(v87[0]);
  *(_DWORD *)(v19 + 96) = v14;
  tre_mem_destroy(v13);
  tre_stack_destroy(v11);
  free(v17);
  free(v18);
  *(_DWORD *)a1 = 62053;
  *(void *)(a1 + 24) = v19;
  uint64_t v77 = *(atomic_uint **)(v19 + 56);
  uint64_t v16 = 0;
  if (v77) {
    atomic_fetch_add(v77, 1u);
  }
  return v16;
}

uint64_t tre_add_tags(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v208 = tre_stack_num_objects((uint64_t)a2);
  if (a1)
  {
    *(_DWORD *)(a4 + 88) = 0;
    **(_DWORD **)(a4 + 40) = -1;
  }
  size_t v8 = (unsigned int *)malloc_type_malloc(4 * (2 * (*(_DWORD *)(a4 + 76) + *(_DWORD *)(a4 + 72)) + 2), 0x100004052888210uLL);
  if (!v8) {
    return 12;
  }
  unint64_t v9 = v8;
  *size_t v8 = -1;
  if (a1)
  {
    uint64_t v10 = (unsigned int *)malloc_type_malloc(4 * (*(_DWORD *)(a4 + 80) + 2 * *(_DWORD *)(a4 + 104) + 1), 0x100004052888210uLL);
    if (!v10)
    {
      uint64_t v12 = 12;
      goto LABEL_391;
    }
    int v11 = (signed int *)v10;
    uint64_t v199 = (uint64_t)&v10[2 * *(int *)(a4 + 104) + 1];
  }
  else
  {
    int v11 = 0;
    uint64_t v199 = 0;
  }
  uint64_t v197 = a3;
  tre_stack_push_voidptr(a2, a3);
  uint64_t v12 = tre_stack_push_int(a2, 0);
  int v13 = tre_stack_num_objects((uint64_t)a2);
  BOOL v14 = v12 != 0;
  int v202 = 2;
  int v204 = 0;
  uint64_t v15 = v9;
  if (v13 <= v208)
  {
    int v200 = 0;
    signed int v206 = 0;
    v201 = v11;
  }
  else
  {
    int v200 = 0;
    signed int v206 = 0;
    v201 = v11;
    if (!v12)
    {
      signed int v206 = 0;
      int v207 = 0;
      int v200 = 0;
      int v204 = 0;
      v201 = v11;
      int v205 = -1;
      int v202 = 2;
      int v203 = 1;
      uint64_t v15 = v9;
      uint64_t v198 = a4;
      v194 = (unsigned int *)v11;
      v195 = v9;
      while (1)
      {
        char v16 = 1;
        switch(tre_stack_pop_int((uint64_t)a2))
        {
          case 0u:
            char v16 = 0;
            goto LABEL_14;
          case 1u:
LABEL_14:
            uint64_t v17 = (uint64_t **)tre_stack_pop_voidptr((uint64_t)a2);
            unsigned int v18 = *((_DWORD *)v17 + 13);
            if ((v18 & 0x80000000) == 0)
            {
              uint64_t v19 = 0;
              do
                unsigned int v20 = v15[v19++];
              while (v20 != -1);
              v15[v19 - 1] = 2 * v18;
              v15[v19] = -1;
              v207 |= 1u;
              tre_stack_push_voidptr(a2, v17);
              uint64_t v21 = tre_stack_push_int(a2, v18);
              if (v21) {
                goto LABEL_257;
              }
              uint64_t v21 = tre_stack_push_int(a2, 7u);
              if (v21) {
                goto LABEL_257;
              }
            }
            break;
          case 2u:
            uint64_t v33 = tre_stack_pop_voidptr((uint64_t)a2);
            uint64_t v34 = v33;
            uint64_t v35 = *(unsigned char ***)(v33 + 40);
            if (!v35) {
              uint64_t v35 = (unsigned char **)v33;
            }
            uint64_t v36 = *v35;
            int v37 = tre_stack_pop_int((uint64_t)a2);
            int v38 = v205;
            if (v36[16]) {
              int v38 = v37;
            }
            int v205 = v38;
            uint64_t v39 = *(void *)v36;
            if (!a1)
            {
              int v86 = *(_DWORD *)(v39 + 60);
              uint64_t v12 = 0;
              int v87 = tre_stack_pop_int((uint64_t)a2) + v86;
LABEL_112:
              *(_DWORD *)(v34 + 60) = v87;
              goto LABEL_258;
            }
            unsigned int v40 = *(_DWORD **)(v39 + 8);
            if (v40 && (int)v40[6] >= 1)
            {
              if (v204 < 0)
              {
LABEL_56:
                LODWORD(v41) = -1;
              }
              else
              {
                uint64_t v41 = 0;
                uint64_t v42 = (unsigned __int8 *)(v40 + 10);
                while (1)
                {
                  unsigned int v44 = *v42++;
                  unsigned int v43 = v44;
                  if (v44) {
                    break;
                  }
                  v41 += 8;
                  if ((v204 & 0xFFFFFFF8) + 8 == v41) {
                    goto LABEL_56;
                  }
                }
                if ((v43 & 1) == 0)
                {
                  do
                  {
                    char v117 = v43;
                    LODWORD(v41) = v41 + 1;
                    v43 >>= 1;
                  }
                  while ((v117 & 2) == 0);
                }
              }
              v40[5] = v41;
              int v45 = tre_mem_alloc_impl(a1, 0, 0, 1, ((*(_DWORD *)(a4 + 80) + 7) >> 3) + 80);
              if (!v45) {
                goto LABEL_101;
              }
              *((void *)v45 + 1) = v40;
              int v46 = v40[5];
              *((_DWORD *)v45 + 4) = 1;
              *((_DWORD *)v45 + 5) = v46;
              int v47 = v40[7];
              int v48 = v40[8] + 1;
              *((_DWORD *)v45 + 6) = v47;
              *((_DWORD *)v45 + 7) = v48;
              int v49 = v40[9];
              *((_DWORD *)v45 + 8) = v49;
              *((void *)v45 + 6) = v45;
              *((_DWORD *)v45 + 14) = 1;
              *((_DWORD *)v45 + 17) = v47 + 1;
              *((_DWORD *)v45 + 18) = v48;
              *((_DWORD *)v45 + 19) = v49;
              uint64_t v39 = *(void *)v36;
              *(void *)(*(void *)v36 + 8) = v45 + 40;
            }
            uint64_t v21 = tre_merge_branches(a1, v34, v39, 0, *(_DWORD *)(a4 + 80));
            if (v21) {
              goto LABEL_257;
            }
            if ((v36[16] & 1) == 0) {
              goto LABEL_108;
            }
            if (!*((_DWORD *)v36 + 2) && *((int *)v36 + 3) <= 1)
            {
              int v50 = tre_ast_new_literal(a1, -1, -1, -1);
              if (v50)
              {
                uint64_t v51 = tre_ast_new_union(a1, (uint64_t)v50, *(void *)v36);
                if (v51)
                {
                  int v202 = 0;
                  uint64_t v12 = 0;
                  *(void *)uint64_t v36 = v51;
                  goto LABEL_258;
                }
              }
LABEL_101:
              uint64_t v12 = 12;
              goto LABEL_258;
            }
            int v202 = 0;
            goto LABEL_195;
          case 3u:
            --v15;
            do
            {
              unsigned int v52 = v15[1];
              ++v15;
            }
            while (v52 != -1);
LABEL_68:
            int v207 = 0;
            goto LABEL_195;
          case 4u:
            uint64_t v53 = tre_stack_pop_voidptr((uint64_t)a2);
            uint64_t v54 = v53;
            int v55 = *(_DWORD ***)(v53 + 40);
            if (!v55) {
              int v55 = (_DWORD **)v53;
            }
            size_t v56 = *v55;
            int v57 = tre_stack_pop_int((uint64_t)a2);
            if (!a1)
            {
              int v88 = *(_DWORD *)(*(void *)v56 + 60) + v57 + *(_DWORD *)(*((void *)v56 + 1) + 60);
              *(_DWORD *)(v54 + 60) = v88;
              if ((int)v56[4] >= 1) {
                *(_DWORD *)(v54 + 60) = ++v88;
              }
              if ((int)v56[5] >= 1) {
                *(_DWORD *)(v54 + 60) = v88 + 1;
              }
              uint64_t v15 = (unsigned int *)tre_stack_pop_voidptr((uint64_t)a2);
LABEL_108:
              uint64_t v12 = 0;
LABEL_109:
              int v89 = 1;
LABEL_110:
              int v202 = v89;
              goto LABEL_258;
            }
            uint64_t v15 = (unsigned int *)tre_stack_pop_voidptr((uint64_t)a2);
            if (!*(_WORD *)(v54 + 66)) {
              goto LABEL_108;
            }
            uint64_t v58 = *((void *)v56 + 1);
            int32x2_t v60 = *(int32x2_t *)(*(void *)v56 + 8);
            uint64_t v59 = *(int32x2_t **)(*(void *)v56 + 16);
            int32x2_t v61 = *(int32x2_t *)(v58 + 8);
            int v62 = *(int32x2_t **)(v58 + 16);
            int v63 = v56[4];
            if (v63 >= 1)
            {
              uint64_t v64 = tre_add_tag_right(a1, *(void *)v56, v63);
              if (v64) {
                goto LABEL_75;
              }
              *(_DWORD *)(*(void *)(v198 + 32) + 4 * (int)v56[4]) = 1;
              if (!*(void *)&v60)
              {
                uint64_t v64 = tre_merge_branches(a1, *(void *)v56, 0, -1, *(_DWORD *)(v198 + 80));
                if (v64)
                {
LABEL_75:
                  uint64_t v12 = v64;
                  int v11 = (signed int *)v194;
                  unint64_t v9 = v195;
                  goto LABEL_193;
                }
                int32x2_t v60 = *(int32x2_t *)(*(void *)v56 + 8);
              }
              *(_DWORD *)(*(void *)&v60 + 20) = v56[4];
              a4 = v198;
            }
            int v115 = v56[5];
            if (v115 < 1) {
              goto LABEL_203;
            }
            uint64_t v116 = tre_add_tag_right(a1, *((void *)v56 + 1), v115);
            if (v116)
            {
              uint64_t v12 = v116;
              int v11 = (signed int *)v194;
              unint64_t v9 = v195;
              goto LABEL_193;
            }
            *(_DWORD *)(*(void *)(v198 + 32) + 4 * (int)v56[5]) = 1;
            a4 = v198;
            if (v61) {
              goto LABEL_202;
            }
            uint64_t v124 = tre_merge_branches(a1, *((void *)v56 + 1), 0, -1, *(_DWORD *)(v198 + 80));
            if (v124)
            {
              uint64_t v12 = v124;
            }
            else
            {
              int32x2_t v61 = *(int32x2_t *)(*((void *)v56 + 1) + 8);
LABEL_202:
              *(_DWORD *)(*(void *)&v61 + 20) = v56[5];
LABEL_203:
              if (v59)
              {
                if (v62)
                {
                  uint64_t v118 = (int32x2_t *)v59[1];
                  int32x2_t v119 = v62[1];
                  unint64_t v9 = v195;
                  if (v118)
                  {
                    if (v119)
                    {
                      do
                      {
                        int v120 = v118;
                        uint64_t v118 = (int32x2_t *)*v118;
                      }
                      while (v118);
                      *int v120 = v119;
                      int v121 = v59[2].i32[0] + v62[2].i32[0];
LABEL_235:
                      v59[2].i32[0] = v121;
                    }
                  }
                  else if (v119)
                  {
                    v59[1] = v119;
                    int v121 = v62[2].i32[0];
                    goto LABEL_235;
                  }
                  int v125 = v62[3].i32[1] + v59[3].i32[1] - 1;
                  v59[3].i32[0] += v62[3].i32[0];
                  v59[3].i32[1] = v125;
                  __int32 v122 = v62[4].i32[0];
LABEL_237:
                  v59[4].i32[0] += v122;
                }
                else
                {
                  unint64_t v9 = v195;
                  if (v61)
                  {
                    **(int32x2_t **)&int32x2_t v61 = v59[1];
                    v59[1] = v61;
                    ++v59[2].i32[0];
                    v59[3] = vadd_s32(v59[3], *(int32x2_t *)(*(void *)&v61 + 28));
                    __int32 v122 = *(_DWORD *)(*(void *)&v61 + 36);
                    goto LABEL_237;
                  }
                }
LABEL_238:
                int v11 = (signed int *)v194;
                goto LABEL_239;
              }
              if (v62)
              {
                if (v60)
                {
                  **(int32x2_t **)&int32x2_t v60 = v62[1];
                  v62[1] = v60;
                  ++v62[2].i32[0];
                  v62[3] = vadd_s32(v62[3], *(int32x2_t *)(*(void *)&v60 + 28));
                  v62[4].i32[0] += *(_DWORD *)(*(void *)&v60 + 36);
                }
                uint64_t v59 = v62;
                unint64_t v9 = v195;
                goto LABEL_238;
              }
              int v126 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x28uLL);
              if (v126)
              {
                uint64_t v59 = (int32x2_t *)v126;
                *((_DWORD *)v126 + 7) = 1;
                int v11 = (signed int *)v194;
                if (v60)
                {
                  *((int32x2_t *)v126 + 1) = v60;
                  *((_DWORD *)v126 + 4) = 1;
                  v127.i32[1] = 1;
                  v127.i32[0] = *((_DWORD *)v126 + 6);
                  int32x2_t v128 = vadd_s32(*(int32x2_t *)(*(void *)&v60 + 28), v127);
                  *((int32x2_t *)v126 + 3) = v128;
                  int v129 = *((_DWORD *)v126 + 8) + *(_DWORD *)(*(void *)&v60 + 36);
                  *((_DWORD *)v126 + 8) = v129;
                  if (v61)
                  {
                    **(int32x2_t **)&int32x2_t v60 = v61;
                    *((_DWORD *)v126 + 4) = 2;
                    *((int32x2_t *)v126 + 3) = vadd_s32(*(int32x2_t *)(*(void *)&v61 + 28), v128);
                    int v130 = *(_DWORD *)(*(void *)&v61 + 36);
                    goto LABEL_249;
                  }
                }
                else if (v61)
                {
                  *((int32x2_t *)v126 + 1) = v61;
                  *((_DWORD *)v126 + 4) = 1;
                  v131.i32[1] = 1;
                  v131.i32[0] = *((_DWORD *)v126 + 6);
                  *((int32x2_t *)v126 + 3) = vadd_s32(*(int32x2_t *)(*(void *)&v61 + 28), v131);
                  int v129 = *(_DWORD *)(*(void *)&v61 + 36);
                  int v130 = *((_DWORD *)v126 + 8);
LABEL_249:
                  *((_DWORD *)v126 + 8) = v130 + v129;
                }
                unint64_t v9 = v195;
LABEL_239:
                uint64_t v12 = 0;
                *(void *)(v54 + 16) = v59;
                goto LABEL_109;
              }
              uint64_t v12 = 12;
            }
            int v11 = (signed int *)v194;
            unint64_t v9 = v195;
            goto LABEL_258;
          case 5u:
            int v65 = tre_stack_pop_int((uint64_t)a2);
            int v203 = tre_stack_pop_int((uint64_t)a2);
            uint64_t v12 = 0;
            signed int v66 = v206;
            if (v65 >= 0) {
              signed int v66 = v65;
            }
            signed int v206 = v66;
            goto LABEL_258;
          case 6u:
            uint64_t v34 = tre_stack_pop_voidptr((uint64_t)a2);
            int v67 = *(uint64_t **)v34;
            uint64_t v68 = **(void **)v34;
            if (!a1)
            {
              uint64_t v12 = 0;
              int v87 = *(_DWORD *)(v67[1] + 60) + *(_DWORD *)(v68 + 60);
              goto LABEL_112;
            }
            uint64_t v21 = tre_merge_branches(a1, v68, v67[1], 0, *(_DWORD *)(a4 + 80));
            if (!v21) {
              uint64_t v21 = tre_merge_branches(a1, v34, *v67, 0, *(_DWORD *)(a4 + 80));
            }
            goto LABEL_257;
          case 7u:
            int v69 = tre_stack_pop_int((uint64_t)a2);
            uint64_t v70 = tre_stack_pop_voidptr((uint64_t)a2);
            uint64_t v71 = v70;
            uint64_t v72 = 0;
            do
              unsigned int v73 = v15[v72++];
            while (v73 != -1);
            v15[v72 - 1] = (2 * v69) | 1;
            v15[v72] = -1;
            v207 |= 2u;
            if (v205 < 0) {
              goto LABEL_195;
            }
            if (a1)
            {
              uint64_t v21 = tre_merge_branches(a1, v70, 0, v206, *(_DWORD *)(a4 + 80));
              if (v21) {
                goto LABEL_257;
              }
              uint64_t v21 = tre_add_tag_right(a1, v71, v206);
              if (v21) {
                goto LABEL_257;
              }
              uint64_t v74 = 0;
              *(_DWORD *)(*(void *)(a4 + 32) + 4 * v206) = 0;
              uint64_t v75 = *(void *)(a4 + 40);
              do
                int v76 = *(_DWORD *)(v75 + 4 * v74++);
              while ((v76 & 0x80000000) == 0);
              *(_DWORD *)(v75 + 4 * v74 - 4) = v206;
              *(_DWORD *)(v75 + 4 * v74) = v205;
              *(_DWORD *)(v75 + 4 * (v74 + 1)) = -1;
              signed int *v201 = v206;
              v201[1] = v205;
              ++v200;
              unsigned int v77 = *v15;
              int v78 = v204;
              if (*v15 != -1)
              {
                uint64_t v79 = v15 + 1;
                do
                {
                  if ((v77 & 0x80000000) == 0)
                  {
                    if (v77) {
                      unsigned int v80 = (signed int *)(*(void *)(a4 + 24) + 8 * (v77 >> 1) + 4);
                    }
                    else {
                      unsigned int v80 = (signed int *)(*(void *)(a4 + 24) + 8 * (v77 >> 1));
                    }
                    *unsigned int v80 = v206;
                  }
                  unsigned int v81 = *v79++;
                  unsigned int v77 = v81;
                }
                while (v81 != -1);
              }
              v201 += 2;
            }
            else
            {
              ++*(_DWORD *)(v70 + 60);
              int v78 = v204;
            }
            int v207 = 0;
            uint64_t v12 = 0;
            int v205 = -1;
            *uint64_t v15 = -1;
            int v204 = v78 + 1;
LABEL_115:
            signed int v206 = v203++;
            goto LABEL_258;
          case 0xAu:
            uint64_t v82 = tre_stack_pop_voidptr((uint64_t)a2);
            int v83 = tre_stack_pop_int((uint64_t)a2);
            uint64_t v84 = tre_mem_alloc_impl(a1, 0, 0, 1, ((*(_DWORD *)(a4 + 80) + 7) >> 3) + 40);
            if (!v84) {
              goto LABEL_101;
            }
            uint64_t v12 = 0;
            uint64_t v85 = *(void *)(v82 + 16);
            *(_DWORD *)(v85 + 20) = v83;
            *((_DWORD *)v84 + 7) = *(_DWORD *)(v85 + 24) + 1;
            *((void *)v84 + 4) = *(void *)(v85 + 28);
            *((void *)v84 + 1) = v85;
            *((_DWORD *)v84 + 4) = 1;
            *(void *)(v82 + 8) = v84;
            *(void *)(v82 + 16) = 0;
            goto LABEL_258;
          default:
            goto LABEL_195;
        }
        switch(*((_DWORD *)v17 + 12))
        {
          case 0:
            uint64_t v22 = *v17;
            int v23 = *(_DWORD *)*v17;
            if ((v23 & 0x80000000) == 0 || (v23 != -4 ? (BOOL v24 = v23 == -1) : (BOOL v24 = 1), v24))
            {
              if (!v207) {
                goto LABEL_68;
              }
            }
            else if (v23 != -2 || v207 == 0)
            {
LABEL_195:
              uint64_t v12 = 0;
              goto LABEL_258;
            }
            if (!a1)
            {
              *((_DWORD *)v17 + 15) = 1;
              int v30 = v204;
LABEL_214:
              int v207 = 0;
              uint64_t v12 = 0;
              *uint64_t v15 = -1;
              int v204 = v30 + 1;
              goto LABEL_115;
            }
            uint64_t v21 = tre_merge_branches(a1, (uint64_t)v17, 0, v206, *(_DWORD *)(a4 + 80));
            if (v21) {
              goto LABEL_257;
            }
            uint64_t v21 = tre_add_tag_left(a1, (uint64_t)v17, v206);
            if (v21) {
              goto LABEL_257;
            }
            if (v207 == 1) {
              int v25 = 2;
            }
            else {
              int v25 = v202;
            }
            *(_DWORD *)(*(void *)(a4 + 32) + 4 * v206) = v25;
            unsigned int v26 = *v15;
            if (*v15 != -1)
            {
              int v27 = v15 + 1;
              do
              {
                if ((v26 & 0x80000000) == 0)
                {
                  if (v26) {
                    int v28 = (signed int *)(*(void *)(a4 + 24) + 8 * (v26 >> 1) + 4);
                  }
                  else {
                    int v28 = (signed int *)(*(void *)(a4 + 24) + 8 * (v26 >> 1));
                  }
                  signed int *v28 = v206;
                }
                unsigned int v29 = *v27++;
                unsigned int v26 = v29;
              }
              while (v29 != -1);
            }
            *uint64_t v15 = -1;
            int v30 = v204;
            if (*(_DWORD *)v22 != -4) {
              goto LABEL_214;
            }
            uint64_t v31 = (signed int *)(*(void *)(a4 + 24) + 8 * *((int *)v22 + 1));
            if ((v31[1] & 0x80000000) == 0)
            {
              signed int v32 = *v31;
              if (v32 < v206)
              {
                signed int *v201 = v206;
                v201[1] = v32 - (v32 > 0);
                v201 += 2;
              }
              goto LABEL_214;
            }
            uint64_t v12 = 6;
            goto LABEL_258;
          case 1:
            uint64_t v91 = **v17;
            uint64_t v90 = (*v17)[1];
            uint64_t v21 = tre_stack_push_voidptr(a2, v17);
            if (!v21)
            {
              uint64_t v21 = tre_stack_push_int(a2, 6u);
              if (!v21)
              {
                uint64_t v21 = tre_stack_push_voidptr(a2, v90);
                if (!v21)
                {
                  uint64_t v21 = tre_stack_push_int(a2, 0);
                  if (!v21)
                  {
                    uint64_t v21 = tre_stack_push_int(a2, *(_DWORD *)(v91 + 60) + v203);
                    if (!v21)
                    {
                      if (*(int *)(v91 + 60) < 1)
                      {
                        unsigned int v93 = -1;
                      }
                      else
                      {
                        int v92 = v203;
                        if (*(int *)(v90 + 60) <= 0) {
                          unsigned int v93 = -1;
                        }
                        else {
                          unsigned int v93 = v203;
                        }
                        if (*(int *)(v90 + 60) > 0) {
                          int v92 = v203 + 1;
                        }
                        int v203 = v92;
                      }
                      uint64_t v21 = tre_stack_push_int(a2, v93);
                      if (!v21)
                      {
                        uint64_t v21 = tre_stack_push_int(a2, 5u);
                        if (!v21)
                        {
                          uint64_t v21 = tre_stack_push_voidptr(a2, v91);
                          if (!v21) {
                            uint64_t v21 = tre_stack_push_int(a2, 0);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            goto LABEL_257;
          case 2:
            unsigned __int32 v94 = *v17;
            if (!a1)
            {
              uint64_t v21 = tre_stack_push_int(a2, v207 != 0);
              if (v21) {
                goto LABEL_257;
              }
            }
            uint64_t v21 = tre_stack_push_int(a2, v206);
            if (v21) {
              goto LABEL_257;
            }
            uint64_t v21 = tre_stack_push_voidptr(a2, v17);
            if (v21) {
              goto LABEL_257;
            }
            uint64_t v21 = tre_stack_push_int(a2, 2u);
            if (v21) {
              goto LABEL_257;
            }
            uint64_t v21 = tre_stack_push_voidptr(a2, *v94);
            if (v21) {
              goto LABEL_257;
            }
            uint64_t v21 = tre_stack_push_int(a2, 0);
            if (v21) {
              goto LABEL_257;
            }
            if (!v207)
            {
              int v207 = 0;
              uint64_t v12 = 0;
              int v89 = 2;
              goto LABEL_110;
            }
            int v95 = v204;
            if (!a1) {
              goto LABEL_149;
            }
            uint64_t v21 = tre_merge_branches(a1, (uint64_t)v17, 0, v206, *(_DWORD *)(a4 + 80));
            if (!v21)
            {
              uint64_t v21 = tre_add_tag_left(a1, (uint64_t)v17, v206);
              if (!v21)
              {
                if (v207 == 1 && v206) {
                  int v202 = ~(2 * *((unsigned __int8 *)v94 + 16)) & 2;
                }
                a4 = v198;
                *(_DWORD *)(*(void *)(v198 + 32) + 4 * v206) = v202;
                unsigned int v96 = *v15;
                int v95 = v204;
                if (*v15 != -1)
                {
                  uint64_t v97 = v15 + 1;
                  do
                  {
                    if ((v96 & 0x80000000) == 0)
                    {
                      if (v96) {
                        int v98 = (signed int *)(*(void *)(v198 + 24) + 8 * (v96 >> 1) + 4);
                      }
                      else {
                        int v98 = (signed int *)(*(void *)(v198 + 24) + 8 * (v96 >> 1));
                      }
                      signed int *v98 = v206;
                    }
                    unsigned int v99 = *v97++;
                    unsigned int v96 = v99;
                  }
                  while (v99 != -1);
                }
LABEL_149:
                uint64_t v12 = 0;
                *uint64_t v15 = -1;
                int v204 = v95 + 1;
                signed int v206 = v203;
                int v207 = 0;
                int v202 = 2;
                ++v203;
                goto LABEL_258;
              }
            }
            goto LABEL_257;
          case 3:
            if (v207) {
              int v100 = v204 + 1;
            }
            else {
              int v100 = v204;
            }
            int v101 = v203;
            if (v207) {
              signed int v102 = v203;
            }
            else {
              signed int v102 = v206;
            }
            if (v207) {
              int v101 = v203 + 1;
            }
            int v203 = v101;
            if (v207) {
              int v103 = v206;
            }
            else {
              int v103 = -1;
            }
            int v204 = v100;
            signed int v193 = v103;
            if ((v16 & 1) != 0 || (int)((__PAIR64__(*((_DWORD *)v17 + 14), *((_DWORD *)v17 + 13) >> 30) - 1) >> 32) < 1)
            {
              signed int v206 = v102;
LABEL_178:
              uint64_t v113 = **v17;
              uint64_t v112 = (*v17)[1];
              uint64_t v21 = tre_stack_push_voidptr(a2, v15);
              if (!v21)
              {
                uint64_t v21 = tre_stack_push_int(a2, v207 != 0);
                if (!v21)
                {
                  uint64_t v21 = tre_stack_push_voidptr(a2, v17);
                  if (!v21)
                  {
                    uint64_t v21 = tre_stack_push_int(a2, 4u);
                    if (!v21)
                    {
                      uint64_t v21 = tre_stack_push_voidptr(a2, v112);
                      if (!v21)
                      {
                        uint64_t v21 = tre_stack_push_int(a2, 1u);
                        if (!v21)
                        {
                          uint64_t v21 = tre_stack_push_int(a2, 3u);
                          if (!v21)
                          {
                            uint64_t v21 = tre_stack_push_voidptr(a2, v113);
                            if (!v21)
                            {
                              uint64_t v114 = tre_stack_push_int(a2, 1u);
                              if (v114) {
                                goto LABEL_187;
                              }
                              if (v207)
                              {
                                if (a1)
                                {
                                  uint64_t v114 = tre_merge_branches(a1, (uint64_t)v17, 0, v193, *(_DWORD *)(v198 + 80));
                                  if (v114 || (uint64_t v114 = tre_add_tag_left(a1, (uint64_t)v17, v193), v114))
                                  {
LABEL_187:
                                    uint64_t v12 = v114;
                                    goto LABEL_193;
                                  }
                                  if (v207 == 1) {
                                    int v133 = 2;
                                  }
                                  else {
                                    int v133 = v202;
                                  }
                                  *(_DWORD *)(*(void *)(v198 + 32) + 4 * v193) = v133;
                                  unsigned int v134 = *v15;
                                  if (*v15 != -1)
                                  {
                                    v135 = v15 + 1;
                                    do
                                    {
                                      if ((v134 & 0x80000000) == 0)
                                      {
                                        if (v134) {
                                          unint64_t v136 = (signed int *)(*(void *)(v198 + 24) + 8 * (v134 >> 1) + 4);
                                        }
                                        else {
                                          unint64_t v136 = (signed int *)(*(void *)(v198 + 24) + 8 * (v134 >> 1));
                                        }
                                        *unint64_t v136 = v193;
                                      }
                                      unsigned int v137 = *v135++;
                                      unsigned int v134 = v137;
                                    }
                                    while (v137 != -1);
                                  }
                                }
                                int v207 = 0;
                                uint64_t v12 = 0;
                                *uint64_t v15 = -1;
                              }
                              else
                              {
                                int v207 = 0;
                                uint64_t v12 = 0;
                              }
LABEL_193:
                              a4 = v198;
                              goto LABEL_258;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              goto LABEL_257;
            }
            int v104 = tre_stack_num_objects((uint64_t)a2);
            tre_stack_push_voidptr(a2, v17);
            tre_stack_push_int(a2, 8u);
            if ((int)tre_stack_num_objects((uint64_t)a2) > v104)
            {
              signed int v206 = v102;
              while (1)
              {
                int v105 = tre_stack_pop_int((uint64_t)a2);
                if (v105 == 9) {
                  break;
                }
                if (v105 == 8)
                {
                  uint64_t v106 = tre_stack_pop_voidptr((uint64_t)a2);
                  int v107 = *(uint64_t **)v106;
                  uint64_t v108 = **(void **)v106;
                  *(_WORD *)(v106 + 66) = 1;
                  tre_stack_push_voidptr(a2, v106);
                  tre_stack_push_int(a2, 9u);
                  if (*(_DWORD *)(v108 + 48) != 3)
                  {
                    *((_DWORD *)v107 + 4) = v206;
LABEL_174:
                    ++v204;
                    signed int v206 = v203++;
                    goto LABEL_175;
                  }
                  unint64_t v109 = a2;
                  uint64_t v110 = v108;
LABEL_171:
                  tre_stack_push_voidptr(v109, v110);
                  tre_stack_push_int(a2, 8u);
                }
LABEL_175:
                if ((int)tre_stack_num_objects((uint64_t)a2) <= v104) {
                  goto LABEL_218;
                }
              }
              uint64_t v111 = tre_stack_pop_voidptr((uint64_t)a2);
              uint64_t v110 = *(void *)(*(void *)v111 + 8);
              if (*(_DWORD *)(v110 + 48) != 3)
              {
                *(_DWORD *)(*(void *)v111 + 20) = v206;
                goto LABEL_174;
              }
              unint64_t v109 = a2;
              goto LABEL_171;
            }
            signed int v206 = v102;
LABEL_218:
            if (!a1) {
              goto LABEL_178;
            }
            uint64_t v21 = tre_stack_push_int(a2, v193);
            if (!v21)
            {
              uint64_t v21 = tre_stack_push_voidptr(a2, v17);
              if (!v21)
              {
                uint64_t v21 = tre_stack_push_int(a2, 0xAu);
                if (!v21) {
                  goto LABEL_178;
                }
              }
            }
LABEL_257:
            uint64_t v12 = v21;
LABEL_258:
            int v132 = tre_stack_num_objects((uint64_t)a2);
            BOOL v14 = v12 != 0;
            if (v132 <= v208 || v12) {
              goto LABEL_281;
            }
            break;
          default:
            goto LABEL_195;
        }
      }
    }
  }
LABEL_281:
  if (v14) {
    goto LABEL_390;
  }
  int v138 = v204;
  if (a1)
  {
    if (v204 != *(_DWORD *)(a4 + 80)) {
      goto LABEL_293;
    }
    unsigned int v139 = *v15;
    if (*v15 != -1)
    {
      __int16 v140 = v15 + 1;
      do
      {
        if ((v139 & 0x80000000) == 0)
        {
          if (v139) {
            v141 = (signed int *)(*(void *)(a4 + 24) + 8 * (v139 >> 1) + 4);
          }
          else {
            v141 = (signed int *)(*(void *)(a4 + 24) + 8 * (v139 >> 1));
          }
          signed int *v141 = v206;
        }
        unsigned int v142 = *v140++;
        unsigned int v139 = v142;
      }
      while (v142 != -1);
    }
    *uint64_t v15 = -1;
    *(_DWORD *)(*(void *)(a4 + 32) + 4 * v204) = v202;
    if (v201 > &v11[2 * *(int *)(a4 + 104)])
    {
LABEL_293:
      uint64_t v12 = 2;
      goto LABEL_390;
    }
    signed int *v201 = -1;
    if (v204 >= 1)
    {
      for (uint64_t i = 0; i != v204; ++i)
        *(_DWORD *)(v199 + 4 * i) = i;
    }
    uint64_t v144 = *v11;
    if ((v144 & 0x80000000) == 0)
    {
      v145 = (unsigned int *)v11;
      do
      {
        if ((int)v144 < v204)
        {
          int v146 = *(_DWORD *)(v199 + 4 * v144);
          int v147 = *(_DWORD *)(v199 + 4 * (int)v145[1]);
          if (v147 <= v146)
          {
            if (v204 >= 1)
            {
              uint64_t v148 = v204;
              v149 = (int *)v199;
              do
              {
                int v150 = *v149;
                if (*v149 > v147 && v150 < v146) {
                  int *v149 = v150 + 1;
                }
                ++v149;
                --v148;
              }
              while (v148);
            }
            *(_DWORD *)(v199 + 4 * v144) = v147 + 1;
          }
        }
        unsigned int v152 = v145[2];
        v145 += 2;
        uint64_t v144 = v152;
      }
      while ((v152 & 0x80000000) == 0);
    }
    if (v204 < 1)
    {
LABEL_316:
      free(v11);
      int v138 = v204;
      int v11 = 0;
LABEL_344:
      uint64_t v155 = v197;
      goto LABEL_345;
    }
    uint64_t v153 = 0;
    while (v153 == *(_DWORD *)(v199 + 4 * v153))
    {
      if (v204 == ++v153) {
        goto LABEL_316;
      }
    }
  }
  if (!v11) {
    goto LABEL_344;
  }
  uint64_t v154 = *(unsigned int *)(a4 + 72);
  uint64_t v155 = v197;
  if ((int)v154 >= 1)
  {
    v156 = (int *)(*(void *)(a4 + 24) + 4);
    do
    {
      int v157 = *v156;
      *(v156 - 1) = *(_DWORD *)(v199 + 4 * *(v156 - 1));
      if (v157 < v204) {
        int v157 = *(_DWORD *)(v199 + 4 * v157);
      }
      int *v156 = v157;
      v156 += 2;
      --v154;
    }
    while (v154);
  }
  v158 = (char *)malloc_type_malloc(4 * v204, 0x100004052888210uLL);
  if (!v158) {
    goto LABEL_350;
  }
  v159 = v158;
  if (v204 >= 1)
  {
    uint64_t v160 = 0;
    do
    {
      *(_DWORD *)&v158[4 * *(int *)(v199 + v160)] = *(_DWORD *)(*(void *)(a4 + 32) + v160);
      v160 += 4;
    }
    while (4 * v204 != v160);
  }
  j__mkdtempat_np(*(void *)(a4 + 32), v158);
  free(v159);
  v161 = *(unsigned int **)(a4 + 40);
  uint64_t v162 = *v161;
  if ((v162 & 0x80000000) == 0)
  {
    v163 = v161 + 1;
    do
    {
      if ((int)v162 < v204) {
        LODWORD(v162) = *(_DWORD *)(v199 + 4 * v162);
      }
      *(v163 - 1) = v162;
      unsigned int v164 = *v163++;
      uint64_t v162 = v164;
    }
    while ((v164 & 0x80000000) == 0);
  }
  uint64_t v165 = tre_stack_push_voidptr(a2, v197);
  if (v165) {
    goto LABEL_349;
  }
  while ((int)tre_stack_num_objects((uint64_t)a2) > v208)
  {
    uint64_t v166 = tre_stack_pop_voidptr((uint64_t)a2);
    switch(*(_DWORD *)(v166 + 48))
    {
      case 0:
        if (**(_DWORD **)v166 == -3) {
          *(_DWORD *)(*(void *)v166 + 4) = *(_DWORD *)(v199 + 4 * *(int *)(*(void *)v166 + 4));
        }
        continue;
      case 1:
      case 3:
        v167 = *(uint64_t **)v166;
        uint64_t v165 = tre_stack_push_voidptr(a2, *(void *)(*(void *)v166 + 8));
        if (v165) {
          goto LABEL_349;
        }
        uint64_t v168 = *v167;
        break;
      case 2:
        uint64_t v168 = **(void **)v166;
        break;
      default:
        continue;
    }
    uint64_t v12 = tre_stack_push_voidptr(a2, v168);
    if (v12) {
      goto LABEL_390;
    }
  }
  int v138 = v204;
LABEL_345:
  if (!a1 || (v169 = *(int **)(v155 + 8)) == 0)
  {
LABEL_389:
    uint64_t v12 = 0;
    *(_DWORD *)(a4 + 80) = v138;
    *(_DWORD *)(a4 + 84) = v200;
    *(_DWORD *)(a4 + 88) = v138;
    goto LABEL_390;
  }
  v170 = (char *)malloc_type_calloc(1uLL, 32 * v169[7] + 16 * v169[8] + 4 * v169[9], 0x3E577DE0uLL);
  if (!v170)
  {
LABEL_350:
    uint64_t v12 = 12;
    goto LABEL_390;
  }
  v171 = v170;
  uint64_t v172 = *(void *)(v155 + 8);
  uint64_t v174 = *(int *)(v172 + 28);
  uint64_t v173 = *(int *)(v172 + 32);
  tre_stack_push_voidptr(a2, v172);
  tre_stack_push_int(a2, 1u);
  uint64_t v165 = tre_stack_push_int(a2, 0);
  if (v165)
  {
LABEL_349:
    uint64_t v12 = v165;
    goto LABEL_390;
  }
  v196 = v9;
  v175 = &v171[32 * v174];
  v176 = &v175[16 * v173];
  v177 = v171;
  v178 = (unsigned int *)v11;
  while (1)
  {
    if ((int)tre_stack_num_objects((uint64_t)a2) <= v208)
    {
      *(void *)(a4 + 48) = v171;
      unint64_t v9 = v196;
      int v138 = v204;
      goto LABEL_389;
    }
    switch(tre_stack_pop_int((uint64_t)a2))
    {
      case 0u:
        int v179 = tre_stack_pop_int((uint64_t)a2);
        uint64_t v180 = tre_stack_push_voidptr(a2, v177);
        if (v180) {
          goto LABEL_393;
        }
        uint64_t v12 = tre_stack_push_int(a2, 1u);
        if (v12) {
          goto LABEL_394;
        }
        v177 += 32 * v179;
        goto LABEL_384;
      case 1u:
        uint64_t v181 = tre_stack_pop_voidptr((uint64_t)a2);
        uint64_t v182 = tre_stack_pop_voidptr((uint64_t)a2);
        uint64_t v183 = v182;
        *(void *)(v181 + 16) = *(void *)(v182 + 16);
        int v184 = *(_DWORD *)(v182 + 24);
        if (v184 < 1) {
          goto LABEL_365;
        }
        *(_DWORD *)(v181 + 24) = v184;
        *(void *)uint64_t v181 = v176;
        if (v204 < 1) {
          goto LABEL_365;
        }
        unsigned int v185 = 0;
        break;
      case 2u:
        int v189 = tre_stack_pop_int((uint64_t)a2);
        uint64_t v180 = tre_stack_push_voidptr(a2, v175);
        if (v180) {
          goto LABEL_393;
        }
        uint64_t v12 = tre_stack_push_int(a2, 3u);
        if (v12) {
          goto LABEL_394;
        }
        v175 += 16 * v189;
        goto LABEL_384;
      case 3u:
        v190 = (void *)tre_stack_pop_voidptr((uint64_t)a2);
        uint64_t v191 = tre_stack_pop_voidptr((uint64_t)a2);
        void *v190 = v177;
        v190[1] = *(void *)(v191 + 16);
        if (*(void *)v191)
        {
          uint64_t v186 = tre_stack_push_voidptr(a2, *(void *)v191);
          if (v186) {
            goto LABEL_387;
          }
          uint64_t v186 = tre_stack_push_voidptr(a2, v190 + 2);
          if (v186) {
            goto LABEL_387;
          }
          uint64_t v186 = tre_stack_push_int(a2, 3u);
          if (v186) {
            goto LABEL_387;
          }
        }
        uint64_t v186 = tre_stack_push_voidptr(a2, *(void *)(v191 + 8));
        if (v186) {
          goto LABEL_387;
        }
        uint64_t v180 = tre_stack_push_int(a2, *(_DWORD *)(v191 + 16));
        int v11 = (signed int *)v178;
        if (v180) {
          goto LABEL_393;
        }
        v187 = a2;
        unsigned int v188 = 0;
        goto LABEL_383;
      default:
        uint64_t v12 = 0;
        goto LABEL_384;
    }
    do
    {
      if ((*(unsigned __int8 *)(v182 + (v185 >> 3) + 40) >> (v185 & 7)))
      {
        *(_DWORD *)v176 = v185;
        v176 += 4;
        if (v184 < 2) {
          break;
        }
        --v184;
      }
      ++v185;
    }
    while (v204 != v185);
LABEL_365:
    if (*(void *)v182)
    {
      uint64_t v186 = tre_stack_push_voidptr(a2, *(void *)v182);
      if (v186
        || (uint64_t v186 = tre_stack_push_voidptr(a2, v181 + 32), v186)
        || (uint64_t v186 = tre_stack_push_int(a2, 1u), v186))
      {
LABEL_387:
        uint64_t v12 = v186;
        unint64_t v9 = v196;
        int v11 = (signed int *)v178;
        goto LABEL_390;
      }
    }
    if (*(int *)(v183 + 16) >= 1) {
      break;
    }
    uint64_t v12 = 0;
    int v11 = (signed int *)v178;
LABEL_384:
    if (v12) {
      goto LABEL_394;
    }
  }
  *(void *)(v181 + 8) = v175;
  uint64_t v186 = tre_stack_push_voidptr(a2, *(void *)(v183 + 8));
  if (v186) {
    goto LABEL_387;
  }
  uint64_t v180 = tre_stack_push_int(a2, *(_DWORD *)(v183 + 16));
  int v11 = (signed int *)v178;
  if (!v180)
  {
    v187 = a2;
    unsigned int v188 = 2;
LABEL_383:
    uint64_t v12 = tre_stack_push_int(v187, v188);
    goto LABEL_384;
  }
LABEL_393:
  uint64_t v12 = v180;
LABEL_394:
  unint64_t v9 = v196;
LABEL_390:
  free(v11);
LABEL_391:
  free(v9);
  return v12;
}

uint64_t tre_expand_ast(uint64_t a1, int *a2, uint64_t a3, int *a4, uint64_t a5)
{
  int v10 = tre_stack_num_objects((uint64_t)a2);
  int v51 = 0;
  uint64_t result = tre_stack_push_voidptr(a2, a3);
  if (result) {
    return result;
  }
  uint64_t result = tre_stack_push_int(a2, 0);
  if (result) {
    return result;
  }
  unsigned int v44 = a4;
  unsigned int v12 = 0;
  unsigned int v13 = 0;
  int v47 = v10;
  int v48 = 0;
  uint64_t v14 = 0;
  while (1)
  {
    while (1)
    {
      if ((int)tre_stack_num_objects((uint64_t)a2) <= v10)
      {
        uint64_t result = 0;
LABEL_81:
        int v42 = *v44 + v14;
        if (v51 > v42) {
          int v42 = v51;
        }
        int *v44 = v42;
        return result;
      }
      int v15 = tre_stack_pop_int((uint64_t)a2);
      uint64_t v16 = tre_stack_pop_voidptr((uint64_t)a2);
      uint64_t v17 = v16;
      if (v15 == 1) {
        break;
      }
      if (!v15)
      {
        switch(*(_DWORD *)(v16 + 48))
        {
          case 0:
            int v28 = *(int **)v16;
            int v29 = **(_DWORD **)v16;
            if (v29 < 0 && v29 != -4) {
              continue;
            }
            int v32 = v28[2] + v12;
            v28[2] = v32;
            int v33 = v51;
            if (v32 > v51) {
              int v33 = v32;
            }
            int v51 = v33;
            goto LABEL_78;
          case 1:
          case 3:
            unsigned int v18 = *(int **)v16;
            uint64_t result = tre_stack_push_voidptr(a2, *(void *)(*(void *)v16 + 8));
            if (result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            if (result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_voidptr(a2, *(void *)v18);
            if (result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            if (result) {
              goto LABEL_81;
            }
            continue;
          case 2:
            int v30 = *(int **)v16;
            uint64_t result = tre_stack_push_int(a2, v13);
            if (result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_voidptr(a2, v17);
            if (result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_int(a2, 1u);
            if (result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_voidptr(a2, *(void *)v30);
            if (result) {
              goto LABEL_81;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            if (result) {
              goto LABEL_81;
            }
            if (v30[2] > 1 || v30[3] >= 2)
            {
              unsigned int v12 = 0;
              unsigned int v13 = 0;
              unsigned int v52 = 0;
            }
            ++v48;
            continue;
          default:
            continue;
        }
      }
    }
    uint64_t v19 = *(int **)v16;
    unsigned int v20 = tre_stack_pop_int((uint64_t)a2);
    unsigned int v21 = v20;
    unsigned int v52 = v20;
    int v22 = v19[2];
    if (!v22)
    {
      int v23 = v19[3];
      if (v23)
      {
        if (v23 >= 2)
        {
          BOOL v24 = 0;
          int v22 = 0;
          int v50 = 0;
          goto LABEL_52;
        }
      }
      else
      {
        uint64_t v31 = tre_ast_new_literal(a1, -1, -1, -1);
        if (!v31) {
          return 12;
        }
        *(void *)uint64_t v17 = *(void *)v31;
        *(_DWORD *)(v17 + 48) = *((_DWORD *)v31 + 12);
      }
      goto LABEL_47;
    }
    if (v22 >= 2) {
      break;
    }
    if (v19[3] > 1)
    {
      int v50 = 0;
      if (v22 >= 1) {
        goto LABEL_22;
      }
      BOOL v24 = 0;
LABEL_52:
      unsigned int v27 = v20;
LABEL_53:
      int v34 = v19[3];
      unsigned int v46 = v21;
      if (v34 == -1)
      {
        unsigned int v27 = v52;
        uint64_t result = tre_copy_ast(a1, a2, *(void *)v19, 0, &v52, 0, &v50, &v51);
        int v10 = v47;
        if (result) {
          return result;
        }
        unsigned int v40 = tre_ast_new_iter(a1, (uint64_t)v50, 0, -1, 0);
        int v50 = v40;
        if (!v40) {
          return 12;
        }
        uint64_t v35 = v40;
      }
      else
      {
        if (v22 < v34)
        {
          uint64_t v35 = 0;
          uint64_t v43 = a5;
          while (1)
          {
            int v49 = 0;
            unsigned int v27 = v52;
            uint64_t result = tre_copy_ast(a1, a2, *(void *)v19, 0, &v52, 0, &v49, &v51);
            if (result) {
              return result;
            }
            uint64_t v36 = v14;
            int v37 = v49;
            if (v35) {
              int v37 = tre_ast_new_catenation(a1, (uint64_t)v49, (uint64_t)v35);
            }
            if (!v37) {
              return 12;
            }
            int v38 = tre_ast_new_literal(a1, -1, -1, -1);
            if (!v38) {
              return 12;
            }
            uint64_t v39 = tre_ast_new_union(a1, (uint64_t)v38, (uint64_t)v37);
            if (!v39) {
              return 12;
            }
            uint64_t v35 = v39;
            ++v22;
            uint64_t v14 = v36;
            a5 = v43;
            if (v22 >= v19[3]) {
              goto LABEL_68;
            }
          }
        }
        uint64_t v35 = 0;
LABEL_68:
        int v50 = v35;
        int v10 = v47;
      }
      if (v24)
      {
        if (v35)
        {
          uint64_t v35 = tre_ast_new_catenation(a1, (uint64_t)v24, (uint64_t)v35);
          goto LABEL_72;
        }
      }
      else
      {
LABEL_72:
        BOOL v24 = v35;
        if (!v35) {
          return 12;
        }
      }
      *(void *)uint64_t v17 = *(void *)v24;
      *(_DWORD *)(v17 + 48) = *((_DWORD *)v24 + 12);
      unsigned int v21 = v46;
      goto LABEL_74;
    }
LABEL_47:
    unsigned int v27 = v21;
    int v10 = v47;
LABEL_74:
    BOOL v41 = v48-- == 1;
    uint64_t v14 = v27 - v21 + v14;
    if (v41) {
      unsigned int v12 = v14;
    }
    else {
      unsigned int v12 = v27;
    }
    unsigned int v52 = v12;
LABEL_78:
    unsigned int v13 = v12;
  }
  int v50 = 0;
LABEL_22:
  unsigned int v45 = v20;
  int v25 = 0;
  BOOL v24 = 0;
  while (1)
  {
    int v49 = 0;
    char v26 = ++v25 < v22 ? 1 : 2;
    unsigned int v27 = v52;
    uint64_t result = tre_copy_ast(a1, a2, *(void *)v19, v26, &v52, a5, &v49, &v51);
    if (result) {
      return result;
    }
    if (v24) {
      BOOL v24 = tre_ast_new_catenation(a1, (uint64_t)v24, (uint64_t)v49);
    }
    else {
      BOOL v24 = v49;
    }
    if (!v24) {
      return 12;
    }
    int v22 = v19[2];
    if (v25 >= v22)
    {
      unsigned int v21 = v45;
      goto LABEL_53;
    }
  }
}

uint64_t tre_compute_nfl(uint64_t a1, int *a2, uint64_t a3)
{
  int v6 = tre_stack_num_objects((uint64_t)a2);
  uint64_t v7 = tre_stack_push_voidptr(a2, a3);
  if (v7) {
    return v7;
  }
  uint64_t v7 = tre_stack_push_int(a2, 0);
  if (v7) {
    return v7;
  }
  if ((int)tre_stack_num_objects((uint64_t)a2) <= v6) {
    return 0;
  }
  while (2)
  {
    int v8 = tre_stack_pop_int((uint64_t)a2);
    uint64_t v9 = tre_stack_pop_voidptr((uint64_t)a2);
    int v10 = (void *)v9;
    switch(v8)
    {
      case 0:
        switch(*(_DWORD *)(v9 + 48))
        {
          case 0:
            int v11 = *(int **)v9;
            int v12 = **(_DWORD **)v9;
            if (v12 != -4)
            {
              if (v12 < 0)
              {
                *(_WORD *)(v9 + 64) = 1;
                tre_set_empty(a1);
                v10[3] = v47;
                if (!v47) {
                  return 12;
                }
                tre_set_empty(a1);
              }
              else
              {
                *(_WORD *)(v9 + 64) = 0;
                int v44 = v11[1];
                int v45 = v11[2];
                unsigned int v46 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x80uLL);
                if (!v46)
                {
LABEL_80:
                  v10[3] = 0;
                  return 12;
                }
                *(_DWORD *)unsigned int v46 = v45;
                *((_DWORD *)v46 + 1) = v12;
                *((_DWORD *)v46 + 2) = v44;
                *((void *)v46 + 4) = 0;
                *((_DWORD *)v46 + 10) = -1;
                *((void *)v46 + 8) = -1;
                *((_DWORD *)v46 + 18) = -1;
                v10[3] = v46;
                tre_set_one(a1, v11[2], *v11, v11[1], *((void *)v11 + 2), -1);
              }
LABEL_31:
              v10[4] = v35;
              if (!v35) {
                return 12;
              }
LABEL_68:
              uint64_t v7 = 0;
              if ((int)tre_stack_num_objects((uint64_t)a2) <= v6) {
                return v7;
              }
              continue;
            }
            *(_WORD *)(v9 + 64) = 0;
            int v13 = v11[2];
            uint64_t v14 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x80uLL);
            if (!v14) {
              goto LABEL_80;
            }
            *(_DWORD *)uint64_t v14 = v13;
            *(void *)(v14 + 4) = 0x7FFFFFFF00000000;
            *((void *)v14 + 4) = 0;
            *((_DWORD *)v14 + 10) = -1;
            *((void *)v14 + 8) = -1;
            *((_DWORD *)v14 + 18) = -1;
            v10[3] = v14;
            uint64_t v17 = v11 + 1;
            int v15 = v11[1];
            int v16 = v17[1];
            unsigned int v18 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x80uLL);
            if (v18)
            {
              *(_DWORD *)unsigned int v18 = v16;
              *(void *)(v18 + 4) = 0x7FFFFFFF00000000;
              *((void *)v18 + 4) = 0;
              *((_DWORD *)v18 + 10) = v15;
              *((void *)v18 + 8) = -1;
              *((_DWORD *)v18 + 18) = -1;
              v10[4] = v18;
              goto LABEL_68;
            }
            v10[4] = 0;
            return 12;
          case 1:
            uint64_t matched = tre_stack_push_voidptr(a2, v9);
            if (matched) {
              return matched;
            }
            unsigned int v40 = a2;
            unsigned int v41 = 2;
            goto LABEL_56;
          case 2:
            uint64_t matched = tre_stack_push_voidptr(a2, v9);
            if (matched) {
              return matched;
            }
            int v42 = a2;
            unsigned int v43 = 3;
            goto LABEL_59;
          case 3:
            uint64_t matched = tre_stack_push_voidptr(a2, v9);
            if (matched) {
              return matched;
            }
            unsigned int v40 = a2;
            unsigned int v41 = 1;
LABEL_56:
            uint64_t matched = tre_stack_push_int(v40, v41);
            if (matched) {
              return matched;
            }
            uint64_t matched = tre_stack_push_voidptr(a2, *(void *)(*v10 + 8));
            if (matched) {
              return matched;
            }
            int v42 = a2;
            unsigned int v43 = 0;
LABEL_59:
            uint64_t matched = tre_stack_push_int(v42, v43);
            if (matched) {
              return matched;
            }
            uint64_t matched = tre_stack_push_voidptr(a2, *(void *)*v10);
            if (matched) {
              return matched;
            }
            uint64_t matched = tre_stack_push_int(a2, 0);
            if (matched) {
              return matched;
            }
            goto LABEL_68;
          default:
            goto LABEL_68;
        }
      case 1:
        uint64_t v19 = *(int **)v9;
        uint64_t v20 = **(void **)v9;
        uint64_t v21 = *(void *)(*(void *)v9 + 8);
        if (*(_WORD *)(v20 + 64)) {
          __int16 v22 = 1;
        }
        else {
          __int16 v22 = *(_WORD *)(v21 + 64) != 0;
        }
        *(_WORD *)(v9 + 64) = v22;
        int v34 = tre_set_union(a1, *(int **)(v20 + 24), *(int **)(v21 + 24), 0, 0, 0);
        v10[3] = v34;
        if (!v34) {
          return 12;
        }
        uint64_t v35 = tre_set_union(a1, *(int **)(*(void *)v19 + 32), *(int **)(*((void *)v19 + 1) + 32), 0, 0, 0);
        goto LABEL_31;
      case 2:
        uint64_t v50 = 0;
        int v49 = 0;
        int v23 = *(uint64_t **)v9;
        uint64_t v24 = **(void **)v9;
        __int16 v25 = *(_WORD *)(v24 + 64);
        if (v25) {
          __int16 v25 = *(_WORD *)(v23[1] + 64) != 0;
        }
        *(_WORD *)(v9 + 64) = v25;
        if (*(_WORD *)(v24 + 64))
        {
          uint64_t matched = tre_match_empty((uint64_t)a2, v24, 0, 0, 0, (_DWORD *)&v50 + 1, &v49);
          if (matched) {
            return matched;
          }
          unsigned int v27 = (int *)malloc_type_malloc(4 * SHIDWORD(v50) + 4, 0x100004052888210uLL);
          if (!v27) {
            return 12;
          }
          int v28 = v27;
          *unsigned int v27 = -1;
          LODWORD(v50) = 0;
          if (v49)
          {
            int v29 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
            if (!v29) {
              goto LABEL_78;
            }
          }
          else
          {
            int v29 = 0;
          }
          uint64_t v36 = tre_match_empty((uint64_t)a2, *v23, v28, &v50, (uint64_t)v29, 0, 0);
          if (v36) {
            goto LABEL_77;
          }
          v10[3] = tre_set_union(a1, *(int **)(v23[1] + 24), *(int **)(*v23 + 24), (unint64_t)v28, v50, v29);
          free(v28);
          if (!v10[3]) {
            return 12;
          }
        }
        else
        {
          *(void *)(v9 + 24) = *(void *)(v24 + 24);
        }
        uint64_t v37 = v23[1];
        if (*(_WORD *)(v37 + 64))
        {
          uint64_t matched = tre_match_empty((uint64_t)a2, v37, 0, 0, 0, (_DWORD *)&v50 + 1, &v49);
          if (matched) {
            return matched;
          }
          int v38 = (int *)malloc_type_malloc(4 * SHIDWORD(v50) + 4, 0x100004052888210uLL);
          if (!v38) {
            return 12;
          }
          int v28 = v38;
          *int v38 = -1;
          LODWORD(v50) = 0;
          if (v49)
          {
            uint64_t v39 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
            if (!v39)
            {
LABEL_78:
              uint64_t v7 = 12;
LABEL_79:
              free(v28);
              return v7;
            }
          }
          else
          {
            uint64_t v39 = 0;
          }
          uint64_t v36 = tre_match_empty((uint64_t)a2, v23[1], v28, &v50, (uint64_t)v39, 0, 0);
          if (v36) {
            goto LABEL_77;
          }
          v10[4] = tre_set_union(a1, *(int **)(*v23 + 32), *(int **)(v23[1] + 32), (unint64_t)v28, v50, v39);
          free(v28);
          if (!v10[4]) {
            return 12;
          }
        }
        else
        {
          v10[4] = *(void *)(v37 + 32);
        }
        goto LABEL_68;
      case 3:
        uint64_t v50 = 0;
        int v49 = 0;
        int v30 = *(uint64_t **)v9;
        uint64_t v31 = **(void **)v9;
        if (*(_DWORD *)(*(void *)v9 + 8) && !*(_WORD *)(v31 + 64))
        {
          *(_WORD *)(v9 + 64) = 0;
LABEL_35:
          *(void *)(v9 + 32) = *(void *)(v31 + 32);
          goto LABEL_67;
        }
        *(_WORD *)(v9 + 64) = 1;
        if (!*(_WORD *)(v31 + 64)) {
          goto LABEL_35;
        }
        uint64_t matched = tre_match_empty((uint64_t)a2, v31, 0, 0, 0, (_DWORD *)&v50 + 1, &v49);
        if (matched) {
          return matched;
        }
        int v32 = (int *)malloc_type_malloc(4 * SHIDWORD(v50) + 4, 0x100004052888210uLL);
        if (!v32) {
          return 12;
        }
        int v28 = v32;
        int *v32 = -1;
        LODWORD(v50) = 0;
        if (v49)
        {
          int v33 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
          if (!v33) {
            goto LABEL_78;
          }
        }
        else
        {
          int v33 = 0;
        }
        uint64_t v36 = tre_match_empty((uint64_t)a2, *v30, v28, &v50, (uint64_t)v33, 0, 0);
        if (v36)
        {
LABEL_77:
          uint64_t v7 = v36;
          goto LABEL_79;
        }
        v10[4] = tre_set_union(a1, *(int **)(*v30 + 32), *(int **)(*v30 + 32), (unint64_t)v28, v50, v33);
        free(v28);
        if (!v10[4]) {
          return 12;
        }
        uint64_t v31 = *v30;
LABEL_67:
        v10[3] = *(void *)(v31 + 24);
        goto LABEL_68;
      default:
        goto LABEL_68;
    }
  }
}

uint64_t tre_ast_to_tnfa(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  while (1)
  {
    int v7 = a1[12];
    if (v7 != 1) {
      break;
    }
    int v11 = *(void **)a1;
    uint64_t v10 = *(void *)a1 + 8;
    uint64_t result = tre_make_trans(*(int **)(**(void **)a1 + 32), *(int **)(*(void *)v10 + 24), a2, a3, a4);
    if (result) {
      return result;
    }
    uint64_t result = tre_ast_to_tnfa(*v11, a2, a3, a4);
    if (result) {
      return result;
    }
LABEL_11:
    a1 = *(_DWORD **)v10;
  }
  if (v7 == 2)
  {
    uint64_t v10 = *(void *)a1;
    if (*(_DWORD *)(*(void *)a1 + 12) == -1)
    {
      uint64_t result = tre_make_trans(*(int **)(*(void *)v10 + 32), *(int **)(*(void *)v10 + 24), a2, a3, a4);
      if (result) {
        return result;
      }
    }
    goto LABEL_11;
  }
  if (v7 == 3)
  {
    uint64_t v8 = *(void *)a1;
    uint64_t result = tre_ast_to_tnfa(**(void **)a1, a2, a3, a4);
    if (result) {
      return result;
    }
    uint64_t v10 = v8 + 8;
    goto LABEL_11;
  }
  return 0;
}

void tre_free(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  uint64_t v1 = *(void *)(a1 + 24);
  if (v1)
  {
    *(void *)(a1 + 24) = 0;
    if (*(_DWORD *)(v1 + 64))
    {
      uint64_t v2 = 0;
      unint64_t v3 = 0;
      do
      {
        uint64_t v4 = *(unsigned char **)v1;
        uint64_t v5 = *(void *)v1 + v2;
        if (*(void *)(v5 + 8))
        {
          int v6 = *(void **)(v5 + 24);
          if (v6)
          {
            free(v6);
            uint64_t v4 = *(unsigned char **)v1;
          }
          if ((v4[v2 + 40] & 4) != 0)
          {
            free(*(void **)&v4[v2 + 48]);
            uint64_t v4 = *(unsigned char **)v1;
          }
          int v7 = *(void **)&v4[v2 + 32];
          if (v7) {
            free(v7);
          }
        }
        ++v3;
        v2 += 56;
      }
      while (v3 < *(unsigned int *)(v1 + 64));
    }
    if (*(void *)v1) {
      free(*(void **)v1);
    }
    uint64_t v8 = *(void ***)(v1 + 8);
    if (v8)
    {
      if (v8[1])
      {
        uint64_t v9 = v8 + 4;
        do
        {
          uint64_t v10 = *(v9 - 1);
          if (v10) {
            free(v10);
          }
          if (*v9) {
            free(*v9);
          }
          int v11 = v9[4];
          v9 += 7;
        }
        while (v11);
        uint64_t v8 = *(void ***)(v1 + 8);
      }
      free(v8);
    }
    int v12 = *(void **)(v1 + 24);
    if (v12) {
      free(v12);
    }
    int v13 = *(void **)(v1 + 32);
    if (v13) {
      free(v13);
    }
    uint64_t v14 = *(void **)(v1 + 40);
    if (v14) {
      free(v14);
    }
    uint64_t v15 = *(void *)(v1 + 56);
    if (v15)
    {
      if (atomic_fetch_add((atomic_uint *volatile)v15, 0xFFFFFFFF) == 1)
      {
        int v16 = *(void (**)(void))(v15 + 8);
        if (v16) {
          v16();
        }
      }
    }
    uint64_t v17 = *(void **)(v1 + 48);
    if (v17) {
      free(v17);
    }
    free((void *)v1);
  }
}

uint64_t tre_merge_branches(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v8 = *(char **)(a2 + 8);
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 8);
    if (!v8)
    {
      uint64_t v8 = *(char **)(a3 + 8);
      goto LABEL_18;
    }
    if (!v9) {
      goto LABEL_18;
    }
    if (a5 >= 1)
    {
      uint64_t v10 = (char *)(v9 + 40);
      int v11 = v8 + 40;
      unsigned int v12 = ((a5 + 7) >> 3) + 1;
      do
      {
        char v13 = *v10++;
        *v11++ |= v13;
        --v12;
      }
      while (v12 > 1);
    }
    *((_DWORD *)v8 + 6) += *(_DWORD *)(v9 + 24);
    *((_DWORD *)v8 + 9) += *(_DWORD *)(v9 + 36);
    uint64_t v14 = (void *)*((void *)v8 + 1);
    uint64_t v15 = *(void *)(v9 + 8);
    if (v14)
    {
      if (!v15) {
        goto LABEL_18;
      }
      do
      {
        int v16 = v14;
        uint64_t v14 = (void *)*v14;
      }
      while (v14);
      *int v16 = v15;
      *((_DWORD *)v8 + 4) += *(_DWORD *)(v9 + 16);
      int32x2_t v17 = vadd_s32(*(int32x2_t *)(v8 + 28), *(int32x2_t *)(v9 + 28));
    }
    else
    {
      if (!v15) {
        goto LABEL_18;
      }
      *((void *)v8 + 1) = v15;
      *((_DWORD *)v8 + 4) = *(_DWORD *)(v9 + 16);
      int32x2_t v17 = *(int32x2_t *)(v9 + 28);
    }
    *(int32x2_t *)(v8 + 28) = v17;
  }
  else if (!v8)
  {
    if (a4) {
      goto LABEL_20;
    }
    uint64_t v8 = 0;
    goto LABEL_24;
  }
LABEL_18:
  if (a4)
  {
    if (v8)
    {
LABEL_22:
      if (a4 >= 1)
      {
        v8[(a4 >> 3) + 40] |= 1 << (a4 & 7);
        ++*((_DWORD *)v8 + 6);
        ++*((_DWORD *)v8 + 9);
      }
      goto LABEL_24;
    }
LABEL_20:
    uint64_t v8 = tre_mem_alloc_impl(a1, 0, 0, 1, ((a5 + 7) >> 3) + 40);
    if (!v8) {
      return 12;
    }
    *((_DWORD *)v8 + 7) = 1;
    goto LABEL_22;
  }
LABEL_24:
  uint64_t v18 = 0;
  *(void *)(a2 + 8) = v8;
  return v18;
}

uint64_t tre_add_tag_right(uint64_t a1, uint64_t a2, int a3)
{
  int v6 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x10uLL);
  if (!v6) {
    return 12;
  }
  int v7 = v6;
  uint64_t v8 = tre_ast_new_literal(a1, -3, a3, -1);
  v7[1] = v8;
  if (!v8) {
    return 12;
  }
  uint64_t v9 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x48uLL);
  void *v7 = v9;
  if (!v9) {
    return 12;
  }
  uint64_t v10 = v9;
  uint64_t result = 0;
  int v12 = *(_DWORD *)(a2 + 48);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)a2;
  *((_WORD *)v10 + 32) = -1;
  *((_DWORD *)v10 + 12) = v12;
  *((_DWORD *)v10 + 13) = -1;
  *(void *)a2 = v7;
  *(_DWORD *)(a2 + 48) = 1;
  *(void *)(a2 + 40) = v10;
  return result;
}

uint64_t tre_add_tag_left(uint64_t a1, uint64_t a2, int a3)
{
  int v6 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x10uLL);
  if (!v6) {
    return 12;
  }
  int v7 = v6;
  uint64_t v8 = tre_ast_new_literal(a1, -3, a3, -1);
  void *v7 = v8;
  if (!v8) {
    return 12;
  }
  uint64_t v9 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x48uLL);
  v7[1] = v9;
  if (!v9) {
    return 12;
  }
  uint64_t v10 = v9;
  uint64_t result = 0;
  int v12 = *(_DWORD *)(a2 + 48);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)a2;
  *((_WORD *)v10 + 32) = -1;
  *((_DWORD *)v10 + 12) = v12;
  *((_DWORD *)v10 + 13) = -1;
  *(void *)a2 = v7;
  *(_DWORD *)(a2 + 48) = 1;
  *(void *)(a2 + 40) = v10;
  return result;
}

uint64_t tre_copy_ast(uint64_t a1, int *a2, uint64_t a3, char a4, _DWORD *a5, uint64_t a6, void *a7, int *a8)
{
  int v16 = tre_stack_num_objects((uint64_t)a2);
  tre_stack_push_voidptr(a2, a3);
  uint64_t result = tre_stack_push_int(a2, 0);
  if (result)
  {
    int v18 = 0;
  }
  else
  {
    uint64_t v37 = a6;
    int v18 = 0;
    int v38 = 1;
    char v39 = a4;
    while ((int)tre_stack_num_objects((uint64_t)a2) > v16)
    {
      int v19 = tre_stack_pop_int((uint64_t)a2);
      if (v19)
      {
        if (v19 == 1) {
          a7 = (void *)tre_stack_pop_voidptr((uint64_t)a2);
        }
LABEL_9:
        uint64_t result = 0;
      }
      else
      {
        uint64_t v20 = (int **)tre_stack_pop_voidptr((uint64_t)a2);
        switch(*((_DWORD *)v20 + 12))
        {
          case 0:
            uint64_t v21 = *v20;
            int v22 = (*v20)[1];
            int v23 = (*v20)[2];
            int v24 = **v20;
            if ((v24 & 0x80000000) == 0)
            {
              uint64_t v25 = *((void *)v21 + 2);
LABEL_33:
              v23 += *a5;
              ++v18;
              goto LABEL_34;
            }
            if (v24 == -4)
            {
              uint64_t v25 = 0;
              goto LABEL_33;
            }
            if ((v39 & 1) != 0 && v24 == -3)
            {
              uint64_t v25 = 0;
              int v23 = -1;
              int v24 = -1;
              int v22 = -1;
            }
            else if (v24 == -3)
            {
              uint64_t v25 = 0;
              if ((v39 & 2) != 0 && v38)
              {
                uint64_t v25 = 0;
                int v38 = 0;
                if (*(_DWORD *)(v37 + 4 * v22) == 2) {
                  *(_DWORD *)(v37 + 4 * v22) = 1;
                }
                int v24 = -3;
              }
            }
            else
            {
              uint64_t v25 = 0;
            }
LABEL_34:
            uint64_t v36 = tre_ast_new_literal(a1, v24, v22, v23);
            *a7 = v36;
            if (v36) {
              uint64_t result = 0;
            }
            else {
              uint64_t result = 12;
            }
            if (v23 > *a8) {
              *a8 = v23;
            }
            if ((*v21 & 0x80000000) == 0) {
              *(void *)(*(void *)v36 + 16) = v25;
            }
            break;
          case 1:
            char v26 = (uint64_t *)*v20;
            unsigned int v27 = tre_ast_new_catenation(a1, *(void *)*v20, *((void *)*v20 + 1));
            *a7 = v27;
            if (!v27) {
              goto LABEL_52;
            }
            a7 = *(void **)v27;
            int v28 = *(void **)v27;
            v28[1] = 0;
            int v29 = v28 + 1;
            *a7 = 0;
            uint64_t result = tre_stack_push_voidptr(a2, v26[1]);
            if (result) {
              goto LABEL_3;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            if (result) {
              goto LABEL_3;
            }
            int v30 = a2;
            uint64_t v31 = v29;
            goto LABEL_27;
          case 2:
            int v32 = (uint64_t *)*v20;
            uint64_t result = tre_stack_push_voidptr(a2, *(void *)*v20);
            if (result) {
              goto LABEL_3;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            if (result) {
              goto LABEL_3;
            }
            int v33 = tre_ast_new_iter(a1, *v32, *((_DWORD *)v32 + 2), *((_DWORD *)v32 + 3), v32[2] & 1);
            *a7 = v33;
            if (!v33)
            {
LABEL_52:
              uint64_t result = 12;
              goto LABEL_3;
            }
            int v34 = v33;
            uint64_t result = 0;
            a7 = *(void **)v34;
            break;
          case 3:
            char v26 = (uint64_t *)*v20;
            uint64_t v35 = tre_ast_new_union(a1, *(void *)*v20, *((void *)*v20 + 1));
            *a7 = v35;
            if (!v35) {
              goto LABEL_52;
            }
            a7 = *(void **)v35;
            uint64_t result = tre_stack_push_voidptr(a2, v26[1]);
            if (result) {
              goto LABEL_3;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            if (result) {
              goto LABEL_3;
            }
            uint64_t v31 = a7 + 1;
            int v30 = a2;
LABEL_27:
            uint64_t result = tre_stack_push_voidptr(v30, v31);
            if (result) {
              goto LABEL_3;
            }
            uint64_t result = tre_stack_push_int(a2, 1u);
            if (result) {
              goto LABEL_3;
            }
            uint64_t result = tre_stack_push_voidptr(a2, *v26);
            if (result) {
              goto LABEL_3;
            }
            uint64_t result = tre_stack_push_int(a2, 0);
            break;
          default:
            goto LABEL_9;
        }
      }
      if (result) {
        goto LABEL_3;
      }
    }
    uint64_t result = 0;
  }
LABEL_3:
  *a5 += v18;
  return result;
}

double tre_set_one(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6)
{
  int v11 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x80uLL);
  if (v11)
  {
    *(_DWORD *)int v11 = a2;
    *((_DWORD *)v11 + 1) = a3;
    *((_DWORD *)v11 + 2) = a4;
    *((void *)v11 + 4) = a5;
    *((_DWORD *)v11 + 10) = a6;
    double result = NAN;
    *((void *)v11 + 8) = -1;
    *((_DWORD *)v11 + 18) = -1;
  }
  return result;
}

double tre_set_empty(uint64_t a1)
{
  uint64_t v1 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x40uLL);
  if (v1)
  {
    double result = NAN;
    *(void *)uint64_t v1 = -1;
    *((_DWORD *)v1 + 2) = -1;
  }
  return result;
}

char *tre_set_union(uint64_t a1, int *a2, int *a3, unint64_t a4, int a5, char *a6)
{
  if (a4)
  {
    unsigned int v10 = -1;
    int v11 = (int *)a4;
    do
    {
      int v12 = *v11++;
      ++v10;
    }
    while ((v12 & 0x80000000) == 0);
  }
  else
  {
    unsigned int v10 = 0;
  }
  uint64_t v13 = 0;
  do
  {
    int v14 = a2[v13];
    v13 += 16;
  }
  while ((v14 & 0x80000000) == 0);
  uint64_t v15 = v13 * 4 - 64;
  int v16 = a3;
  do
  {
    int v17 = *v16;
    v16 += 16;
    v15 += 64;
  }
  while ((v17 & 0x80000000) == 0);
  int v18 = tre_mem_alloc_impl(a1, 0, 0, 1, v15 & 0x3FFFFFFFC0);
  if (v18)
  {
    int v19 = *a2;
    if ((*a2 & 0x80000000) == 0)
    {
      uint64_t v20 = 0;
      int v69 = a5;
      while (1)
      {
        uint64_t v21 = &a2[16 * v20];
        unint64_t v24 = *((void *)v21 + 2);
        int v23 = v21 + 4;
        int v22 = (int *)v24;
        uint64_t v25 = &v18[64 * v20];
        *(_DWORD *)uint64_t v25 = v19;
        *(void *)(v25 + 4) = *(void *)(v23 - 3);
        *((_DWORD *)v25 + 6) = v23[2] | a5;
        *((void *)v25 + 4) = *((void *)v23 + 2);
        *((_DWORD *)v25 + 10) = v23[6];
        if (a4 | v24)
        {
          if (v22)
          {
            unsigned int v27 = -1;
            do
            {
              int v28 = *v22++;
              ++v27;
            }
            while ((v28 & 0x80000000) == 0);
          }
          else
          {
            unsigned int v27 = 0;
          }
          char v26 = tre_mem_alloc_impl(a1, 0, 0, 0, 4 * (v10 + 1 + v27));
          if (!v26) {
            return 0;
          }
          if (v27)
          {
            int v29 = *(int **)v23;
            uint64_t v30 = v27;
            uint64_t v31 = v26;
            do
            {
              int v32 = *v29++;
              *(_DWORD *)uint64_t v31 = v32;
              v31 += 4;
              --v30;
            }
            while (v30);
          }
          if (v10)
          {
            int v33 = &v26[4 * v27];
            uint64_t v34 = v10;
            uint64_t v35 = (int *)a4;
            do
            {
              int v36 = *v35++;
              *(_DWORD *)int v33 = v36;
              v33 += 4;
              --v34;
            }
            while (v34);
          }
          *(_DWORD *)&v26[4 * v10 + 4 * v27] = -1;
          a5 = v69;
        }
        else
        {
          char v26 = 0;
        }
        *((void *)v25 + 2) = v26;
        uint64_t v37 = *(void *)&a2[16 * v20 + 12];
        if (v37) {
          *(void *)&v18[64 * v20 + 48] = v37;
        }
        if (a6)
        {
          int v38 = &v18[64 * v20];
          uint64_t v40 = *((void *)v38 + 6);
          char v39 = (char **)(v38 + 48);
          if (v40)
          {
            unsigned int v41 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
            char *v39 = v41;
            if (!v41) {
              return 0;
            }
            for (uint64_t i = 0; i != 36; i += 4)
            {
              int v43 = *(_DWORD *)&a6[i];
              if (v43 != -1) {
                *(_DWORD *)&v41[i] = v43;
              }
            }
          }
          else
          {
            char *v39 = a6;
          }
        }
        int v19 = a2[16 * ++v20];
        if (v19 < 0) {
          goto LABEL_42;
        }
      }
    }
    LODWORD(v20) = 0;
LABEL_42:
    int v44 = a3;
    int v45 = *a3;
    if (*a3 < 0)
    {
      LODWORD(v46) = 0;
    }
    else
    {
      uint64_t v46 = 0;
      do
      {
        uint64_t v47 = v46 + v20;
        int v48 = &v18[64 * v47];
        *(_DWORD *)int v48 = v45;
        int v49 = &v44[16 * v46];
        uint64_t v50 = *((void *)v49 + 2);
        *(void *)(v48 + 4) = *(void *)(v49 + 1);
        *((_DWORD *)v48 + 6) = v49[6];
        *((void *)v48 + 4) = *((void *)v49 + 4);
        *((_DWORD *)v48 + 10) = v49[10];
        if (v50)
        {
          uint64_t v51 = 0;
          uint64_t v52 = 0;
          uint64_t v53 = -1;
          do
          {
            uint64_t v54 = v51;
            int v55 = *(_DWORD *)(v50 + v52);
            ++v53;
            v52 += 4;
            ++v51;
          }
          while ((v55 & 0x80000000) == 0);
          size_t v56 = tre_mem_alloc_impl(a1, 0, 0, 0, v52 & 0x3FFFFFFFCLL);
          if (!v56) {
            return 0;
          }
          if (v53)
          {
            int v57 = (int *)*((void *)v49 + 2);
            uint64_t v58 = v56;
            do
            {
              int v59 = *v57++;
              *(_DWORD *)uint64_t v58 = v59;
              v58 += 4;
              --v54;
            }
            while (v54);
            uint64_t v60 = v53;
          }
          else
          {
            uint64_t v60 = 0;
          }
          int v44 = a3;
          *(_DWORD *)&v56[4 * v60] = -1;
        }
        else
        {
          size_t v56 = 0;
        }
        *((void *)v48 + 2) = v56;
        uint64_t v61 = *((void *)v49 + 6);
        if (v61) {
          *(void *)&v18[64 * v47 + 48] = v61;
        }
        if (a6)
        {
          int v62 = &v18[64 * v47];
          uint64_t v64 = *((void *)v62 + 6);
          int v63 = (char **)(v62 + 48);
          if (v64)
          {
            int v65 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
            *int v63 = v65;
            if (!v65) {
              return 0;
            }
            for (uint64_t j = 0; j != 36; j += 4)
            {
              int v67 = *(_DWORD *)&a6[j];
              if (v67 != -1) {
                *(_DWORD *)&v65[j] = v67;
              }
            }
          }
          else
          {
            *int v63 = a6;
          }
        }
        int v45 = v44[16 * ++v46];
      }
      while ((v45 & 0x80000000) == 0);
    }
    *(_DWORD *)&v18[64 * (unint64_t)(v46 + v20)] = -1;
  }
  return v18;
}

uint64_t tre_match_empty(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4, uint64_t a5, _DWORD *a6, _DWORD *a7)
{
  int v14 = tre_stack_num_objects(a1);
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  uint64_t result = tre_stack_push_voidptr(a1, a2);
  if (!result)
  {
    while ((int)tre_stack_num_objects(a1) > v14)
    {
      int v16 = (int **)tre_stack_pop_voidptr(a1);
      switch(*((_DWORD *)v16 + 12))
      {
        case 0:
          int v17 = *v16;
          int v18 = **v16;
          switch(v18)
          {
            case -5:
              if (a5)
              {
                for (uint64_t i = 0; i != 36; i += 4)
                  *(_DWORD *)(a5 + i) = *(_DWORD *)(*((void *)v17 + 2) + i);
              }
              if (a7) {
                *a7 = 1;
              }
              break;
            case -2:
              if (a4) {
                *a4 |= v17[1];
              }
              break;
            case -3:
              int v19 = v17[1];
              if ((v19 & 0x80000000) == 0)
              {
                if (a3)
                {
                  int v20 = *a3;
                  if (*a3 < 0)
                  {
                    uint64_t v22 = 0;
LABEL_34:
                    a3[v22] = v19;
                    a3[(v22 + 1)] = -1;
                  }
                  else
                  {
                    uint64_t v21 = 0;
                    while (v20 != v19)
                    {
                      uint64_t v22 = v21 + 1;
                      int v20 = a3[++v21];
                      if (v20 < 0) {
                        goto LABEL_34;
                      }
                    }
                  }
                }
                if (a6) {
                  ++*a6;
                }
                continue;
              }
              break;
          }
          break;
        case 1:
          int v23 = *v16;
          uint64_t result = tre_stack_push_voidptr(a1, *(void *)*v16);
          if (result) {
            return result;
          }
          uint64_t v24 = *((void *)v23 + 1);
          goto LABEL_24;
        case 2:
          uint64_t v24 = *(void *)*v16;
          goto LABEL_23;
        case 3:
          uint64_t v24 = *(void *)*v16;
          if (*(_WORD *)(v24 + 64)) {
            goto LABEL_24;
          }
          uint64_t v24 = *((void *)*v16 + 1);
LABEL_23:
          if (!*(_WORD *)(v24 + 64)) {
            continue;
          }
LABEL_24:
          uint64_t result = tre_stack_push_voidptr(a1, v24);
          if (result) {
            return result;
          }
          continue;
        default:
          continue;
      }
    }
    return 0;
  }
  return result;
}

uint64_t tre_make_trans(int *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6 = a1;
  int v7 = *a1;
  if (!a3)
  {
    if ((v7 & 0x80000000) == 0)
    {
      do
      {
        if ((*a2 & 0x80000000) == 0)
        {
          int v48 = a2 + 16;
          do
          {
            ++*(_DWORD *)(a4 + 4 * *v6);
            int v49 = *v48;
            v48 += 16;
          }
          while ((v49 & 0x80000000) == 0);
        }
        int v50 = v6[16];
        v6 += 16;
      }
      while ((v50 & 0x80000000) == 0);
    }
    return 0;
  }
  if (v7 < 0) {
    return 0;
  }
  uint64_t v52 = a3 - 56;
  while (1)
  {
    int v10 = *a2;
    if ((*a2 & 0x80000000) == 0) {
      break;
    }
LABEL_65:
    int v47 = v6[16];
    v6 += 16;
    if (v47 < 0) {
      return 0;
    }
  }
  int v11 = -1;
  int v12 = a2;
  while (1)
  {
    int v13 = v11;
    v12 += 16;
    int v11 = v10;
    while (v11 == v13)
    {
      int v14 = *v12;
      v12 += 16;
      int v11 = v14;
      if (v14 < 0) {
        goto LABEL_65;
      }
    }
    uint64_t v15 = v52 + 56 * *(int *)(a5 + 4 * *v6);
    do
    {
      uint64_t v16 = *(void *)(v15 + 64);
      v15 += 56;
    }
    while (v16);
    *(void *)(v15 + 64) = 0;
    *(void *)uint64_t v15 = *(void *)(v6 + 1);
    *(void *)(v15 + 8) = a3 + 56 * *(int *)(a5 + 4 * v11);
    *(_DWORD *)(v15 + 16) = v11;
    int v17 = (int *)*((void *)v6 + 4);
    int v18 = *(v12 - 10) | v6[6] | (4 * (v17 != 0));
    *(_DWORD *)(v15 + 40) = v18;
    int v19 = v6[10];
    if ((v19 & 0x80000000) == 0)
    {
      *(_DWORD *)(v15 + 48) = v19;
      *(_DWORD *)(v15 + 40) = v18 | 0x80;
      int v17 = (int *)*((void *)v6 + 4);
    }
    if (v17)
    {
      int v20 = malloc_type_malloc(8 * *v17 + 8, 0x85422E0AuLL);
      *(void *)(v15 + 48) = v20;
      if (!v20) {
        return 12;
      }
      j__mkdtempat_np((int)v20, *((char **)v6 + 4));
    }
    uint64_t v21 = (int *)*((void *)v6 + 2);
    if (v21)
    {
      int v22 = -1;
      do
      {
        int v23 = *v21++;
        ++v22;
      }
      while ((v23 & 0x80000000) == 0);
    }
    else
    {
      int v22 = 0;
    }
    uint64_t v24 = (int *)*((void *)v12 - 6);
    if (v24)
    {
      int v25 = -1;
      do
      {
        int v26 = *v24++;
        ++v25;
      }
      while ((v26 & 0x80000000) == 0);
    }
    else
    {
      int v25 = 0;
    }
    unsigned int v27 = *(void **)(v15 + 24);
    if (v27) {
      free(v27);
    }
    *(void *)(v15 + 24) = 0;
    if (v25 + v22)
    {
      int v28 = (int *)malloc_type_malloc(4 * (v25 + v22 + 1), 0x100004052888210uLL);
      *(void *)(v15 + 24) = v28;
      if (!v28) {
        return 12;
      }
      int v29 = (int *)*((void *)v6 + 2);
      if (!v29 || (int v30 = *v29, *v29 < 0))
      {
        LODWORD(v31) = 0;
      }
      else
      {
        uint64_t v31 = 0;
        int v32 = v29 + 1;
        do
        {
          v28[v31] = v30;
          int v30 = v32[v31++];
        }
        while ((v30 & 0x80000000) == 0);
      }
      int v33 = (int *)*((void *)v12 - 6);
      if (!v33 || (int v34 = *v33, *v33 < 0))
      {
        int v36 = v31;
      }
      else
      {
        uint64_t v35 = 0;
        int v36 = v31;
        do
        {
          uint64_t v37 = v31;
          int v38 = v28;
          if (v31)
          {
            while (1)
            {
              int v39 = *v38++;
              if (v39 == v34) {
                break;
              }
              if (!--v37) {
                goto LABEL_43;
              }
            }
          }
          else
          {
LABEL_43:
            v28[v36++] = v34;
          }
          int v34 = v33[++v35];
        }
        while ((v34 & 0x80000000) == 0);
      }
      v28[v36] = -1;
    }
    if (!*((void *)v6 + 6) && !*((void *)v12 - 2))
    {
      uint64_t v46 = *(void **)(v15 + 32);
      if (v46) {
        free(v46);
      }
      *(void *)(v15 + 32) = 0;
      goto LABEL_60;
    }
    uint64_t v40 = *(char **)(v15 + 32);
    if (!v40)
    {
      uint64_t v40 = (char *)malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
      *(void *)(v15 + 32) = v40;
      if (!v40) {
        return 12;
      }
    }
    uint64_t v41 = 0;
    uint64_t v42 = *((void *)v6 + 6);
    uint64_t v43 = *((void *)v12 - 2);
    do
    {
      *(_DWORD *)&v40[v41] = -1;
      if (v42)
      {
        int v44 = *(_DWORD *)(v42 + v41);
        if (v44 != -1) {
          *(_DWORD *)&v40[v41] = v44;
        }
      }
      if (v43)
      {
        int v45 = *(_DWORD *)(v43 + v41);
        if (v45 != -1) {
          *(_DWORD *)&v40[v41] = v45;
        }
      }
      v41 += 4;
    }
    while (v41 != 36);
LABEL_60:
    int v10 = *v12;
    if (*v12 < 0) {
      goto LABEL_65;
    }
  }
}

uint64_t tre_tnfa_run_backtrack(uint64_t a1, char *a2, int a3, int a4, uint64_t a5, char a6, unsigned int *a7)
{
  uint64_t v10 = a1;
  __darwin_ct_rune_t v357 = 0;
  unsigned int v11 = *(_DWORD *)(a1 + 96);
  memset(&v360[1], 0, 128);
  int v12 = (uint64_t *)tre_mem_new_impl(0, 0);
  uint64_t v13 = *(int *)(v10 + 80);
  memset(&v361, 0, sizeof(v361));
  if (!v12) {
    return 12;
  }
  int v14 = v12;
  uint64_t v15 = tre_mem_alloc_impl((uint64_t)v12, 0, 0, 0, 0xC0uLL);
  if (!v15)
  {
    tre_mem_destroy(v14);
    return 12;
  }
  uint64_t v16 = v15;
  v334 = v14;
  int v344 = a3;
  *((void *)v15 + 22) = 0;
  *((void *)v15 + 23) = 0;
  int v17 = *(_DWORD *)(v10 + 72);
  uint64_t v18 = 16 * (int)v13;
  int v19 = (char *)malloc_type_malloc((v18 + 16 * v17 + 4 * *(_DWORD *)(v10 + 92) + 14), 0xBA4DF49BuLL);
  if (!v19) {
    return 12;
  }
  int v20 = v19;
  v297 = a7;
  int v338 = a6 & 2;
  uint64_t v21 = 16 * v13;
  int v22 = 16 * v17;
  int v23 = &v19[v18];
  uint64_t v24 = 8 - ((unint64_t)&v19[v18] & 7);
  if (((unint64_t)&v19[v18] & 7) == 0) {
    uint64_t v24 = 0;
  }
  v327 = &v23[v24];
  uint64_t v25 = (uint64_t)&v23[v24 + v22];
  uint64_t v26 = 8 - (v25 & 7);
  if ((v25 & 7) == 0) {
    uint64_t v26 = 0;
  }
  v329 = (_DWORD *)(v25 + v26);
  unsigned int v27 = &v19[v24 + v18 + v26 + v22];
  v298 = (int *)(v19 + 8);
  v299 = (int *)(a5 + 8);
  signed int v28 = -1;
  unsigned int v340 = -1;
  int v29 = a2;
  v333 = (__darwin_ct_rune_t *)a2;
  int v356 = 1;
  LODWORD(v348) = 1;
  uint64_t v349 = v10;
  *(void *)dfd = a5;
  int v30 = v344;
  size_t v343 = v21;
  unsigned int v309 = v11;
  v308 = v27;
LABEL_9:
  MEMORY[0x18C122530](v20, v21);
  if (a5) {
    MEMORY[0x18C122530](a5, v21);
  }
  size_t v31 = v21;
  if (*(int *)(v10 + 92) >= 1)
  {
    uint64_t v32 = 0;
    do
      *(_DWORD *)&v27[4 * v32++] = 0;
    while (v32 < *(int *)(v10 + 92));
  }
  *(void *)v350 = v357;
  if (!a4)
  {
    ++v28;
    if (v30 < 0 || v28 < v30)
    {
      __darwin_ct_rune_t v35 = *v333++;
      __darwin_ct_rune_t v313 = v35;
      __darwin_ct_rune_t v357 = v35;
      goto LABEL_30;
    }
    goto LABEL_22;
  }
  if (a4 != 2)
  {
    if (a4 != 1)
    {
      __darwin_ct_rune_t v313 = v357;
      goto LABEL_30;
    }
    ++v28;
    if (v30 < 0 || v28 < v30)
    {
      __darwin_ct_rune_t v33 = *(unsigned __int8 *)v29++;
      __darwin_ct_rune_t v313 = v33;
      __darwin_ct_rune_t v357 = v33;
      goto LABEL_30;
    }
LABEL_22:
    __darwin_ct_rune_t v313 = 0;
    __darwin_ct_rune_t v357 = 0;
    goto LABEL_30;
  }
  v28 += v348;
  if (v30 < 0 || v30 > v28)
  {
    int v34 = *v29;
    if (v34 < 0)
    {
      int v109 = v30 - v28;
      if (v30 < 0) {
        int v109 = 32;
      }
      size_t v110 = mbrtowc_l(&v357, v29, v109, &v361, *(locale_t *)(v10 + 56));
      if (v110 > 0xFFFFFFFFFFFFFFFDLL) {
        return 17;
      }
      if (v30 < 0 || v110)
      {
        v29 += v110;
        __darwin_ct_rune_t v313 = v357;
        LODWORD(v348) = v110;
      }
      else
      {
        __darwin_ct_rune_t v313 = 0;
        __darwin_ct_rune_t v357 = 0;
        ++v29;
        LODWORD(v348) = 1;
      }
      uint64_t v10 = v349;
      size_t v31 = v343;
      goto LABEL_30;
    }
    ++v29;
    __darwin_ct_rune_t v313 = v34;
    __darwin_ct_rune_t v357 = v34;
  }
  else
  {
    __darwin_ct_rune_t v313 = 0;
    __darwin_ct_rune_t v357 = 0;
  }
  LODWORD(v348) = 1;
LABEL_30:
  v335 = (char *)v29;
  *(mbstate_t *)&v360[1] = v361;
  uint64_t v36 = *(void *)(v10 + 8);
  uint64_t v37 = (void *)(v36 + 8);
  int v330 = v28;
  int v345 = (v11 >> 3) & 1;
  uint64_t v38 = 0;
  int v39 = 0;
  if (*(void *)(v36 + 8))
  {
    BOOL v41 = (a6 & 1) == 0 && v28 < 1;
    if (v350[0] == 10) {
      int v42 = (v11 >> 3) & 1;
    }
    else {
      int v42 = 0;
    }
    v346 = &_DefaultRuneLocale.__runetype[*(void *)v350];
    size_t v43 = v31;
    BOOL v353 = v41;
    while (1)
    {
      int v44 = *(_DWORD *)(v36 + 40);
      if (!v44) {
        goto LABEL_126;
      }
      int v45 = (v44 & 1) == 0 || v41;
      if ((v45 | v42) != 1) {
        goto LABEL_141;
      }
      if ((v44 & 2) != 0)
      {
        int v46 = v345;
        if (v357 != 10) {
          int v46 = 0;
        }
        BOOL v47 = v357 | v338 && v46 == 0;
        if (v47) {
          goto LABEL_141;
        }
      }
      if ((v44 & 8) != 0)
      {
        if (v350[0] == 95) {
          goto LABEL_141;
        }
        if (v350[0] > 0x7Fu)
        {
          uint64_t v53 = *(_xlocale **)(v349 + 56);
          if (v350[0] < 0x100u)
          {
            size_t v56 = &__global_locale;
            if (v53 != (_xlocale *)-1) {
              size_t v56 = *(void **)(v349 + 56);
            }
            if (!v53) {
              size_t v56 = &__c_locale;
            }
            __uint32_t v51 = *(_DWORD *)(*(void *)(v56[166] + 120) + 4 * *(void *)v350 + 60);
          }
          else
          {
            LOWORD(v51) = ___runetype_l(v350[0], v53);
            BOOL v41 = v353;
          }
        }
        else
        {
          __uint32_t v51 = *v346;
        }
        if ((v51 & 0x500) != 0) {
          goto LABEL_141;
        }
        if (v357 != 95) {
          break;
        }
      }
LABEL_54:
      int v48 = *(_DWORD *)(v36 + 40);
      if ((v48 & 0x10) != 0)
      {
        if (v350[0] != 95)
        {
          if (v350[0] > 0x7Fu)
          {
            int v55 = *(_xlocale **)(v349 + 56);
            if (v350[0] < 0x100u)
            {
              uint64_t v60 = &__global_locale;
              if (v55 != (_xlocale *)-1) {
                uint64_t v60 = *(void **)(v349 + 56);
              }
              if (!v55) {
                uint64_t v60 = &__c_locale;
              }
              __uint32_t v52 = *(_DWORD *)(*(void *)(v60[166] + 120) + 4 * *(void *)v350 + 60);
            }
            else
            {
              LOWORD(v52) = ___runetype_l(v350[0], v55);
              BOOL v41 = v353;
            }
          }
          else
          {
            __uint32_t v52 = *v346;
          }
          if ((v52 & 0x500) == 0) {
            goto LABEL_141;
          }
        }
        if (v357 == 95) {
          goto LABEL_141;
        }
        if (v357 <= 0x7F)
        {
          uint64_t v61 = &_DefaultRuneLocale;
          goto LABEL_100;
        }
        int v62 = *(_xlocale **)(v349 + 56);
        if (v357 < 0x100)
        {
          uint64_t v64 = &__global_locale;
          if (v62 != (_xlocale *)-1) {
            uint64_t v64 = *(void **)(v349 + 56);
          }
          if (!v62) {
            uint64_t v64 = &__c_locale;
          }
          uint64_t v61 = *(_RuneLocale **)(v64[166] + 120);
LABEL_100:
          __uint32_t v63 = v61->__runetype[v357];
        }
        else
        {
          LOWORD(v63) = ___runetype_l(v357, v62);
          BOOL v41 = v353;
        }
        if ((v63 & 0x500) != 0) {
          goto LABEL_141;
        }
        if ((*(_DWORD *)(v36 + 40) & 0x20) == 0) {
          goto LABEL_125;
        }
        goto LABEL_56;
      }
      if ((v48 & 0x20) == 0) {
        goto LABEL_125;
      }
LABEL_56:
      if (!v28) {
        goto LABEL_125;
      }
      unsigned int v49 = v357;
      if (!v357) {
        goto LABEL_125;
      }
      if (v350[0] == 95)
      {
        if (v357 == 95) {
          goto LABEL_141;
        }
        BOOL v50 = 1;
LABEL_114:
        if (v49 <= 0x7F)
        {
          int v69 = &_DefaultRuneLocale;
          goto LABEL_123;
        }
        uint64_t v70 = *(_xlocale **)(v349 + 56);
        if (v49 < 0x100)
        {
          uint64_t v72 = &__global_locale;
          if (v70 != (_xlocale *)-1) {
            uint64_t v72 = *(void **)(v349 + 56);
          }
          if (!v70) {
            uint64_t v72 = &__c_locale;
          }
          int v69 = *(_RuneLocale **)(v72[166] + 120);
LABEL_123:
          __uint32_t v71 = v69->__runetype[v49];
        }
        else
        {
          LOWORD(v71) = ___runetype_l(v49, v70);
          BOOL v41 = v353;
        }
        BOOL v47 = v50 == ((v71 & 0x500) != 0);
        signed int v28 = v330;
        if (v47) {
          goto LABEL_141;
        }
        goto LABEL_125;
      }
      if (v350[0] > 0x7Fu)
      {
        uint64_t v58 = *(_xlocale **)(v349 + 56);
        if (v350[0] < 0x100u)
        {
          int v67 = &__global_locale;
          if (v58 != (_xlocale *)-1) {
            int v67 = *(void **)(v349 + 56);
          }
          if (!v58) {
            int v67 = &__c_locale;
          }
          __uint32_t v54 = *(_DWORD *)(*(void *)(v67[166] + 120) + 4 * *(void *)v350 + 60);
        }
        else
        {
          __int16 v59 = ___runetype_l(v350[0], v58);
          BOOL v41 = v353;
          LOWORD(v54) = v59;
          unsigned int v49 = v357;
        }
      }
      else
      {
        __uint32_t v54 = *v346;
      }
      int v68 = v54 & 0x500;
      BOOL v50 = v68 != 0;
      if (v49 != 95) {
        goto LABEL_114;
      }
      signed int v28 = v330;
      if (v68) {
        goto LABEL_141;
      }
LABEL_125:
      if ((*(unsigned char *)(v36 + 40) & 0x40) != 0)
      {
        if (!v28) {
          goto LABEL_141;
        }
        unsigned int v90 = v357;
        if (!v357) {
          goto LABEL_141;
        }
        if (v350[0] != 95)
        {
          if (v350[0] > 0x7Fu)
          {
            unsigned int v93 = *(_xlocale **)(v349 + 56);
            if (v350[0] < 0x100u)
            {
              unsigned int v96 = &__global_locale;
              if (v93 != (_xlocale *)-1) {
                unsigned int v96 = *(void **)(v349 + 56);
              }
              if (!v93) {
                unsigned int v96 = &__c_locale;
              }
              __uint32_t v92 = *(_DWORD *)(*(void *)(v96[166] + 120) + 4 * *(void *)v350 + 60);
            }
            else
            {
              __int16 v94 = ___runetype_l(v350[0], v93);
              BOOL v41 = v353;
              LOWORD(v92) = v94;
              unsigned int v90 = v357;
            }
          }
          else
          {
            __uint32_t v92 = *v346;
          }
          int v97 = v92 & 0x500;
          BOOL v91 = v97 != 0;
          if (v90 == 95)
          {
            signed int v28 = v330;
            if (!v97) {
              goto LABEL_141;
            }
            goto LABEL_126;
          }
LABEL_168:
          if (v90 <= 0x7F)
          {
            int v98 = &_DefaultRuneLocale;
            goto LABEL_177;
          }
          unsigned int v99 = *(_xlocale **)(v349 + 56);
          if (v90 < 0x100)
          {
            int v101 = &__global_locale;
            if (v99 != (_xlocale *)-1) {
              int v101 = *(void **)(v349 + 56);
            }
            if (!v99) {
              int v101 = &__c_locale;
            }
            int v98 = *(_RuneLocale **)(v101[166] + 120);
LABEL_177:
            __uint32_t v100 = v98->__runetype[v90];
          }
          else
          {
            LOWORD(v100) = ___runetype_l(v90, v99);
            BOOL v41 = v353;
          }
          char v102 = v91 ^ ((v100 & 0x500) != 0);
          signed int v28 = v330;
          if (v102) {
            goto LABEL_141;
          }
          goto LABEL_126;
        }
        if (v357 != 95)
        {
          BOOL v91 = 1;
          goto LABEL_168;
        }
      }
LABEL_126:
      if (v38)
      {
        uint64_t v73 = *((void *)v16 + 23);
        if (v73)
        {
          uint64_t v74 = *(char **)(v73 + 40);
          uint64_t v16 = (char *)*((void *)v16 + 23);
        }
        else
        {
          uint64_t v75 = tre_mem_alloc_impl((uint64_t)v334, 0, 0, 0, 0xC0uLL);
          if (!v75)
          {
            v294 = v334;
LABEL_624:
            tre_mem_destroy(v294);
            v292 = v20;
            goto LABEL_625;
          }
          int v76 = v75;
          *((void *)v75 + 22) = v16;
          *((void *)v75 + 23) = 0;
          uint64_t v74 = tre_mem_alloc_impl((uint64_t)v334, 0, 0, 0, v343);
          *((void *)v76 + 5) = v74;
          if (!v74)
          {
            v294 = v334;
            goto LABEL_624;
          }
          *((void *)v16 + 23) = v76;
          uint64_t v16 = v76;
          size_t v43 = v343;
          signed int v28 = v330;
        }
        *(_DWORD *)uint64_t v16 = v28;
        *((_DWORD *)v16 + 1) = v348;
        *((void *)v16 + 1) = v29;
        *((void *)v16 + 2) = v333;
        *((void *)v16 + 3) = *v37;
        __darwin_ct_rune_t v77 = v357;
        *((_DWORD *)v16 + 8) = *(_DWORD *)(v36 + 16);
        *((_DWORD *)v16 + 9) = v77;
        j__mkdtempat_np((int)v74, v20);
        long long v78 = *((_OWORD *)&v361._mbstateL + 3);
        *((_OWORD *)v16 + 5) = *((_OWORD *)&v361._mbstateL + 2);
        *((_OWORD *)v16 + 6) = v78;
        long long v79 = *((_OWORD *)&v361._mbstateL + 1);
        *((_OWORD *)v16 + 3) = *(_OWORD *)v361.__mbstate8;
        *((_OWORD *)v16 + 4) = v79;
        long long v80 = *((_OWORD *)&v361._mbstateL + 7);
        *((_OWORD *)v16 + 9) = *((_OWORD *)&v361._mbstateL + 6);
        *((_OWORD *)v16 + 10) = v80;
        long long v81 = *((_OWORD *)&v361._mbstateL + 5);
        *((_OWORD *)v16 + 7) = *((_OWORD *)&v361._mbstateL + 4);
        *((_OWORD *)v16 + 8) = v81;
        uint64_t v82 = *(unsigned int **)(v36 + 24);
        if (v82)
        {
          uint64_t v83 = *v82;
          if ((v83 & 0x80000000) == 0)
          {
            uint64_t v84 = *((void *)v16 + 5);
            uint64_t v85 = v82 + 1;
            do
            {
              int v86 = *(_DWORD *)(v84 + 16 * v83);
              *(_DWORD *)(v84 + 16 * v83) = v86 + 1;
              if (!v86) {
                *(_DWORD *)(v84 + 16 * v83 + 4) = v28;
              }
              uint64_t v87 = v84 + 16 * v83;
              *(_DWORD *)(v87 + 8) = v28;
              *(_DWORD *)(v87 + 12) = v356;
              unsigned int v88 = *v85++;
              uint64_t v83 = v88;
            }
            while ((v88 & 0x80000000) == 0);
          }
          ++v356;
        }
        BOOL v41 = v353;
      }
      else
      {
        uint64_t v38 = *v37;
        int v39 = *(unsigned int **)(v36 + 24);
      }
LABEL_141:
      uint64_t v89 = *(void *)(v36 + 64);
      uint64_t v37 = (void *)(v36 + 64);
      v36 += 56;
      if (!v89)
      {
        uint64_t v103 = *(void *)dfd;
        if (v39)
        {
          uint64_t v104 = *v39;
          int v30 = v344;
          if ((v104 & 0x80000000) != 0)
          {
            uint64_t v10 = v349;
          }
          else
          {
            uint64_t v10 = v349;
            do
            {
              int v105 = *(_DWORD *)&v20[16 * v104];
              *(_DWORD *)&v20[16 * v104] = v105 + 1;
              if (!v105) {
                *(_DWORD *)&v20[16 * v104 + 4] = v28;
              }
              uint64_t v106 = &v20[16 * v104];
              *((_DWORD *)v106 + 2) = v28;
              *((_DWORD *)v106 + 3) = v356;
              unsigned int v107 = v39[1];
              ++v39;
              uint64_t v104 = v107;
            }
            while ((v107 & 0x80000000) == 0);
          }
          ++v356;
        }
        else
        {
          int v30 = v344;
          uint64_t v10 = v349;
        }
        goto LABEL_191;
      }
    }
    if (v357 > 0x7F)
    {
      int v65 = *(_xlocale **)(v349 + 56);
      if (v357 >= 0x100)
      {
        LOWORD(v66) = ___runetype_l(v357, v65);
        BOOL v41 = v353;
        goto LABEL_158;
      }
      int v95 = &__global_locale;
      if (v65 != (_xlocale *)-1) {
        int v95 = *(void **)(v349 + 56);
      }
      if (!v65) {
        int v95 = &__c_locale;
      }
      int v57 = *(_RuneLocale **)(v95[166] + 120);
    }
    else
    {
      int v57 = &_DefaultRuneLocale;
    }
    __uint32_t v66 = v57->__runetype[v357];
LABEL_158:
    if ((v66 & 0x500) == 0) {
      goto LABEL_141;
    }
    goto LABEL_54;
  }
  uint64_t v103 = *(void *)dfd;
  int v30 = v344;
  size_t v43 = v31;
LABEL_191:
  v347 = v333;
  uint64_t v108 = v29;
  if (v38) {
    goto LABEL_202;
  }
  while (1)
  {
    while (1)
    {
LABEL_598:
      if (!*((void *)v16 + 22))
      {
        uint64_t v21 = v43;
        unsigned int v11 = v309;
        unsigned int v27 = v308;
        int v29 = v335;
        if ((v340 & 0x80000000) == 0) {
          goto LABEL_628;
        }
        if (v28 == v330)
        {
          if (v30 < 0)
          {
            if (!v357)
            {
LABEL_628:
              uint64_t v293 = v340 >> 31;
              unsigned int *v297 = v340;
              goto LABEL_629;
            }
          }
          else if (v330 >= v30)
          {
            goto LABEL_628;
          }
        }
        __darwin_ct_rune_t v357 = v313;
        mbstate_t v361 = *(mbstate_t *)&v360[1];
        signed int v28 = v330;
        a5 = v103;
        goto LABEL_9;
      }
      uint64_t v282 = v103;
      uint64_t v38 = *((void *)v16 + 3);
      if ((*(unsigned char *)(v38 + 40) & 0x80) != 0) {
        v329[*((int *)v16 + 8)] = 0;
      }
      signed int v28 = *(_DWORD *)v16;
      v283 = (const char *)*((void *)v16 + 1);
      v347 = (__darwin_ct_rune_t *)*((void *)v16 + 2);
      LODWORD(v348) = *((_DWORD *)v16 + 1);
      __darwin_ct_rune_t v357 = *((_DWORD *)v16 + 9);
      j__mkdtempat_np((int)v20, *((char **)v16 + 5));
      uint64_t v108 = v283;
      long long v284 = *((_OWORD *)v16 + 3);
      long long v285 = *((_OWORD *)v16 + 6);
      long long v286 = *((_OWORD *)v16 + 8);
      long long v287 = *((_OWORD *)v16 + 9);
      *((_OWORD *)&v361._mbstateL + 4) = *((_OWORD *)v16 + 7);
      *((_OWORD *)&v361._mbstateL + 5) = v286;
      long long v288 = *((_OWORD *)v16 + 10);
      *((_OWORD *)&v361._mbstateL + 6) = v287;
      *((_OWORD *)&v361._mbstateL + 7) = v288;
      long long v289 = *((_OWORD *)v16 + 4);
      long long v290 = *((_OWORD *)v16 + 5);
      *(_OWORD *)v361.__mbstate8 = v284;
      *((_OWORD *)&v361._mbstateL + 1) = v289;
      *((_OWORD *)&v361._mbstateL + 2) = v290;
      *((_OWORD *)&v361._mbstateL + 3) = v285;
      uint64_t v16 = (char *)*((void *)v16 + 22);
      uint64_t v103 = v282;
LABEL_202:
      if ((v340 & 0x80000000) != 0)
      {
        int v30 = v344;
        if (v38 == *(void *)(v10 + 16)) {
          goto LABEL_565;
        }
        break;
      }
      int v30 = v344;
      if (!*(_DWORD *)(v10 + 84))
      {
        if (v38 == *(void *)(v10 + 16)) {
          goto LABEL_565;
        }
        break;
      }
      uint64_t v111 = *(unsigned int **)(v10 + 40);
      uint64_t v112 = *v111;
      if ((v112 & 0x80000000) == 0)
      {
        uint64_t v113 = v111 + 2;
        do
        {
          uint64_t v114 = (int)*(v113 - 1);
          if (*(_DWORD *)(v103 + 16 * v114)
            && *(_DWORD *)&v20[16 * v114]
            && *(_DWORD *)(v103 + 16 * v114 + 8) == *(_DWORD *)&v20[16 * v114 + 8])
          {
            int v115 = *(_DWORD *)&v20[16 * v112];
            if (*(_DWORD *)(v103 + 16 * v112))
            {
              if (!v115) {
                goto LABEL_598;
              }
LABEL_211:
              if (*(_DWORD *)&v20[16 * v112 + 8] > *(_DWORD *)(v103 + 16 * v112 + 8)) {
                goto LABEL_598;
              }
              goto LABEL_214;
            }
            if (!v115) {
              goto LABEL_211;
            }
          }
LABEL_214:
          unsigned int v116 = *v113;
          v113 += 2;
          uint64_t v112 = v116;
        }
        while ((v116 & 0x80000000) == 0);
      }
      if (v38 != *(void *)(v10 + 16)) {
        break;
      }
      v260 = *(unsigned int **)(v10 + 40);
      uint64_t v261 = *v260;
      if ((v261 & 0x80000000) != 0)
      {
LABEL_565:
        int v267 = v340;
        goto LABEL_566;
      }
      v262 = v260 + 2;
      while (1)
      {
        uint64_t v263 = (int)*(v262 - 1);
        if (*(_DWORD *)(v103 + 16 * v263)
          && *(_DWORD *)&v20[16 * v263]
          && *(_DWORD *)(v103 + 16 * v263 + 8) == *(_DWORD *)&v20[16 * v263 + 8])
        {
          int v264 = *(_DWORD *)&v20[16 * v261];
          if (*(_DWORD *)(v103 + 16 * v261))
          {
            if (!v264) {
              goto LABEL_598;
            }
          }
          else if (v264)
          {
            int v267 = -1;
            goto LABEL_566;
          }
          int v265 = *(_DWORD *)&v20[16 * v261 + 8] - *(_DWORD *)(v103 + 16 * v261 + 8);
          if (v265) {
            break;
          }
        }
        unsigned int v266 = *v262;
        v262 += 2;
        uint64_t v261 = v266;
        if ((v266 & 0x80000000) != 0) {
          goto LABEL_565;
        }
      }
      int v267 = v340;
      if (v265 < 0) {
        int v267 = -1;
      }
      if (v265 <= 0)
      {
LABEL_566:
        if (v267 < v28)
        {
          if (!v103) {
            goto LABEL_569;
          }
          goto LABEL_568;
        }
        if (v103 && v267 == v28)
        {
          uint64_t v269 = *(unsigned int *)(v10 + 80);
          if ((int)v269 < 1) {
            goto LABEL_569;
          }
          v270 = *(int **)(v10 + 32);
          v271 = v298;
          v272 = v299;
          while (2)
          {
            int v274 = *v270++;
            int v273 = v274;
            if (v274 == 2)
            {
              int v277 = *(v271 - 2);
              int v278 = *(v272 - 2);
              if (v277)
              {
                if (!v278) {
                  goto LABEL_568;
                }
                int v279 = *(v272 - 1);
                int v280 = *(v271 - 1);
                goto LABEL_584;
              }
            }
            else
            {
              if (v273 != 1)
              {
                if (!v273)
                {
                  int v275 = *v272;
                  int v276 = *v271;
LABEL_588:
                  int v281 = v275 - v276;
                  if (v281) {
                    goto LABEL_610;
                  }
                }
                goto LABEL_594;
              }
              int v277 = *(v271 - 2);
              int v278 = *(v272 - 2);
              if (v277)
              {
                if (!v278) {
                  goto LABEL_568;
                }
                int v279 = *(v271 - 1);
                int v280 = *(v272 - 1);
LABEL_584:
                int v281 = v279 - v280;
                if (v281) {
                  goto LABEL_610;
                }
                int v281 = v278 - v277;
                if (v278 != v277) {
                  goto LABEL_610;
                }
                if (v277 != 1)
                {
                  int v275 = *v271;
                  int v276 = *v272;
                  goto LABEL_588;
                }
LABEL_594:
                v272 += 4;
                v271 += 4;
                if (!--v269) {
                  goto LABEL_569;
                }
                continue;
              }
            }
            break;
          }
          if (v278) {
            int v281 = -1;
          }
          else {
            int v281 = 0;
          }
          if (v281)
          {
LABEL_610:
            if (v281 < 1)
            {
LABEL_569:
              unsigned int v340 = v28;
              continue;
            }
LABEL_568:
            uint64_t v268 = v103;
            j__mkdtempat_np(v103, v20);
            uint64_t v103 = v268;
            goto LABEL_569;
          }
          goto LABEL_594;
        }
        unsigned int v340 = v267;
      }
    }
    char v117 = (uint64_t *)(v38 + 8);
    if (!*(void *)(v38 + 8) || (*(unsigned char *)(v38 + 40) & 0x80) == 0) {
      break;
    }
    uint64_t v120 = v103;
    v354 = v108;
    uint64_t v121 = *(int *)(v38 + 48);
    uint64_t v122 = tre_fill_pmatch(v121 + 1, v327, *(_DWORD *)(v349 + 96) & 0xFB, v349, v20, v28);
    if (v122)
    {
      uint64_t v293 = v122;
LABEL_629:
      tre_mem_destroy(v334);
      free(v20);
      return v293;
    }
    int v125 = &v327[16 * v121];
    uint64_t v126 = *(void *)v125;
    if ((*(void *)v125 & 0x80000000) == 0)
    {
      uint64_t v127 = *(void *)v125;
      int v128 = *((_DWORD *)v125 + 2);
      int v129 = v128 - v126;
      if (v344 < 0)
      {
        if (a4) {
          int v130 = j__strsvisx(&a2[v127], v354 - 1, v129, v123, v124);
        }
        else {
          int v130 = wcsncmp((const __int32 *)&a2[4 * v127], v347 - 1, v129);
        }
        size_t v43 = v343;
      }
      else
      {
        if (v344 - v28 < v129)
        {
          uint64_t v103 = *(void *)dfd;
          int v30 = v344;
          size_t v43 = v343;
          goto LABEL_553;
        }
        size_t v43 = v343;
        if (a4) {
          int v130 = j__mkdtemp(&a2[v127]);
        }
        else {
          int v130 = wmemcmp((const __int32 *)&a2[4 * v127], v347 - 1, v129);
        }
      }
      if (v130 || (uint64_t v135 = *(int *)(v38 + 16), v128 == v126) && v329[v135])
      {
        uint64_t v103 = *(void *)dfd;
        goto LABEL_552;
      }
      v329[v135] = v128 == v126;
      uint64_t v108 = &v354[v129 - 1];
      unsigned __int32 v119 = v357;
      v347 += v129 - 1;
      if (a4)
      {
        if (a4 == 2)
        {
          v28 += v129 - 1 + v348;
          if (v344 < 0 || v344 > v28)
          {
            int v131 = *v108;
            if (v131 < 0)
            {
              int v258 = v344 - v28;
              if (v344 < 0) {
                int v258 = 32;
              }
              v259 = &v354[v129 - 1];
              size_t v348 = mbrtowc_l(&v357, v108, v258, &v361, *(locale_t *)(v349 + 56));
              if (v348 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                if (v344 < 0 || v348)
                {
                  uint64_t v108 = &v259[v348];
                }
                else
                {
                  __darwin_ct_rune_t v357 = 0;
                  uint64_t v108 = v259 + 1;
                  LODWORD(v348) = 1;
                }
                int v138 = v345;
                size_t v43 = v343;
                goto LABEL_276;
              }
              return 17;
            }
LABEL_272:
            ++v108;
            __darwin_ct_rune_t v357 = v131;
            goto LABEL_273;
          }
LABEL_540:
          __darwin_ct_rune_t v357 = 0;
          goto LABEL_273;
        }
        if (a4 != 1)
        {
          v28 += v129 - 1;
          goto LABEL_275;
        }
        v28 += v129;
        if ((v344 & 0x80000000) == 0 && v28 >= v344) {
          goto LABEL_266;
        }
LABEL_263:
        __darwin_ct_rune_t v137 = *(unsigned __int8 *)v108++;
        __darwin_ct_rune_t v136 = v137;
LABEL_268:
        __darwin_ct_rune_t v357 = v136;
        goto LABEL_275;
      }
      v28 += v129;
      if ((v344 & 0x80000000) == 0 && v28 >= v344) {
        goto LABEL_266;
      }
LABEL_267:
      __darwin_ct_rune_t v136 = *v347++;
      goto LABEL_268;
    }
    int v30 = v344;
    size_t v43 = v343;
    uint64_t v10 = v349;
    uint64_t v103 = v120;
  }
  if (v30 < 0)
  {
    unsigned __int32 v119 = v357;
    int v118 = a4;
    if (!v357) {
      goto LABEL_553;
    }
  }
  else
  {
    int v118 = a4;
    if (v30 <= v28) {
      goto LABEL_553;
    }
    unsigned __int32 v119 = v357;
  }
  switch(v118)
  {
    case 0:
      ++v28;
      if ((v30 & 0x80000000) == 0 && v28 >= v30) {
        goto LABEL_266;
      }
      goto LABEL_267;
    case 2:
      v28 += v348;
      if (v30 < 0 || v30 > v28)
      {
        int v131 = *v108;
        if (v131 < 0)
        {
          int v132 = v30 - v28;
          if (v30 < 0) {
            int v132 = 32;
          }
          int v133 = v108;
          size_t v134 = mbrtowc_l(&v357, v108, v132, &v361, *(locale_t *)(v349 + 56));
          if (v134 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            if (v30 < 0 || v134)
            {
              uint64_t v108 = &v133[v134];
              LODWORD(v348) = v134;
              break;
            }
            __darwin_ct_rune_t v357 = 0;
            uint64_t v108 = v133 + 1;
LABEL_273:
            LODWORD(v348) = 1;
            break;
          }
          return 17;
        }
        goto LABEL_272;
      }
      goto LABEL_540;
    case 1:
      ++v28;
      if (v30 < 0 || v28 < v30) {
        goto LABEL_263;
      }
LABEL_266:
      __darwin_ct_rune_t v357 = 0;
      break;
  }
LABEL_275:
  int v138 = v345;
LABEL_276:
  if (!*v117)
  {
    uint64_t v139 = 0;
    uint64_t v144 = v39;
    goto LABEL_531;
  }
  uint64_t v139 = 0;
  BOOL v141 = (a6 & 1) == 0 && v28 < 1;
  if (v119 == 10) {
    int v142 = v138;
  }
  else {
    int v142 = 0;
  }
  v143 = &_DefaultRuneLocale.__magic[4 * v119];
  v336 = (int *)(v143 + 60);
  v331 = (__darwin_ct_rune_t *)(v143 + 1084);
  v332 = (__darwin_ct_rune_t *)(v143 + 2108);
  uint64_t v144 = v39;
  uint64_t v145 = v141;
  v355 = v108;
  int v341 = v142;
LABEL_287:
  if (*(_DWORD *)v38 > (signed __int32)v119 || *(_DWORD *)(v38 + 4) < (signed __int32)v119) {
    goto LABEL_526;
  }
  int v146 = *(_DWORD *)(v38 + 40);
  if (!v146) {
    goto LABEL_512;
  }
  if (v146) {
    int v147 = v145;
  }
  else {
    int v147 = 1;
  }
  if ((v147 | v142) != 1) {
    goto LABEL_526;
  }
  if ((v146 & 2) != 0)
  {
    int v148 = v345;
    if (v357 != 10) {
      int v148 = 0;
    }
    if (v357 | v338 && !v148) {
      goto LABEL_526;
    }
  }
  if ((v146 & 8) != 0)
  {
    if (v119 == 95) {
      goto LABEL_526;
    }
    if (v119 > 0x7F)
    {
      uint64_t v154 = *(_xlocale **)(v349 + 56);
      if (v119 < 0x100)
      {
        v159 = &__global_locale;
        if (v154 != (_xlocale *)-1) {
          v159 = *(void **)(v349 + 56);
        }
        if (!v154) {
          v159 = &__c_locale;
        }
        int v152 = *(_DWORD *)(*(void *)(v159[166] + 120) + 4 * v119 + 60);
      }
      else
      {
        uint64_t v155 = v139;
        LOWORD(v152) = ___runetype_l(v119, v154);
        uint64_t v139 = v155;
        int v142 = v341;
        uint64_t v108 = v355;
      }
    }
    else
    {
      int v152 = *v336;
    }
    if ((v152 & 0x500) != 0) {
      goto LABEL_526;
    }
    if (v357 != 95)
    {
      if (v357 <= 0x7F)
      {
        uint64_t v160 = &_DefaultRuneLocale;
        goto LABEL_396;
      }
      v170 = *(_xlocale **)(v349 + 56);
      if (v357 < 0x100)
      {
        uint64_t v191 = &__global_locale;
        if (v170 != (_xlocale *)-1) {
          uint64_t v191 = *(void **)(v349 + 56);
        }
        if (!v170) {
          uint64_t v191 = &__c_locale;
        }
        uint64_t v160 = *(_RuneLocale **)(v191[166] + 120);
LABEL_396:
        __uint32_t v172 = v160->__runetype[v357];
      }
      else
      {
        uint64_t v171 = v139;
        LOWORD(v172) = ___runetype_l(v357, v170);
        uint64_t v139 = v171;
        int v142 = v341;
        uint64_t v108 = v355;
      }
      if ((v172 & 0x500) == 0) {
        goto LABEL_526;
      }
    }
  }
  int v149 = *(_DWORD *)(v38 + 40);
  if ((v149 & 0x10) != 0)
  {
    if (v119 != 95)
    {
      if (v119 > 0x7F)
      {
        int v157 = *(_xlocale **)(v349 + 56);
        if (v119 < 0x100)
        {
          unsigned int v164 = &__global_locale;
          if (v157 != (_xlocale *)-1) {
            unsigned int v164 = *(void **)(v349 + 56);
          }
          if (!v157) {
            unsigned int v164 = &__c_locale;
          }
          int v153 = *(_DWORD *)(*(void *)(v164[166] + 120) + 4 * v119 + 60);
        }
        else
        {
          uint64_t v158 = v139;
          LOWORD(v153) = ___runetype_l(v119, v157);
          uint64_t v139 = v158;
          int v142 = v341;
          uint64_t v108 = v355;
        }
      }
      else
      {
        int v153 = *v336;
      }
      if ((v153 & 0x500) == 0) {
        goto LABEL_526;
      }
    }
    if (v357 == 95) {
      goto LABEL_526;
    }
    if (v357 > 0x7F)
    {
      uint64_t v166 = *(_xlocale **)(v349 + 56);
      if (v357 >= 0x100)
      {
        uint64_t v167 = v139;
        LOWORD(v168) = ___runetype_l(v357, v166);
        uint64_t v139 = v167;
        int v142 = v341;
        uint64_t v108 = v355;
        goto LABEL_347;
      }
      v169 = &__global_locale;
      if (v166 != (_xlocale *)-1) {
        v169 = *(void **)(v349 + 56);
      }
      if (!v166) {
        v169 = &__c_locale;
      }
      uint64_t v165 = *(_RuneLocale **)(v169[166] + 120);
    }
    else
    {
      uint64_t v165 = &_DefaultRuneLocale;
    }
    __uint32_t v168 = v165->__runetype[v357];
LABEL_347:
    if ((v168 & 0x500) != 0) {
      goto LABEL_526;
    }
    if ((*(_DWORD *)(v38 + 40) & 0x20) == 0) {
      goto LABEL_371;
    }
LABEL_302:
    if (!v28) {
      goto LABEL_371;
    }
    unsigned int v150 = v357;
    if (!v357) {
      goto LABEL_371;
    }
    if (v119 == 95)
    {
      if (v357 == 95) {
        goto LABEL_526;
      }
      BOOL v151 = 1;
    }
    else
    {
      if (v119 > 0x7F)
      {
        v161 = *(_xlocale **)(v349 + 56);
        if (v119 < 0x100)
        {
          uint64_t v173 = &__global_locale;
          if (v161 != (_xlocale *)-1) {
            uint64_t v173 = *(void **)(v349 + 56);
          }
          if (!v161) {
            uint64_t v173 = &__c_locale;
          }
          int v156 = *(_DWORD *)(*(void *)(v173[166] + 120) + 4 * v119 + 60);
        }
        else
        {
          uint64_t v162 = v139;
          __int16 v163 = ___runetype_l(v119, v161);
          uint64_t v139 = v162;
          int v142 = v341;
          uint64_t v108 = v355;
          LOWORD(v156) = v163;
          unsigned int v150 = v357;
        }
      }
      else
      {
        int v156 = *v336;
      }
      int v174 = v156 & 0x500;
      BOOL v151 = v174 != 0;
      if (v150 == 95)
      {
        size_t v43 = v343;
        if (v174) {
          goto LABEL_526;
        }
        goto LABEL_371;
      }
    }
    if (v150 > 0x7F)
    {
      v176 = *(_xlocale **)(v349 + 56);
      if (v150 >= 0x100)
      {
        uint64_t v177 = v139;
        LOWORD(v178) = ___runetype_l(v150, v176);
        uint64_t v139 = v177;
        int v142 = v341;
        uint64_t v108 = v355;
        goto LABEL_370;
      }
      int v179 = &__global_locale;
      if (v176 != (_xlocale *)-1) {
        int v179 = *(void **)(v349 + 56);
      }
      if (!v176) {
        int v179 = &__c_locale;
      }
      v175 = *(_RuneLocale **)(v179[166] + 120);
    }
    else
    {
      v175 = &_DefaultRuneLocale;
    }
    __uint32_t v178 = v175->__runetype[v150];
LABEL_370:
    BOOL v47 = v151 == ((v178 & 0x500) != 0);
    size_t v43 = v343;
    if (v47) {
      goto LABEL_526;
    }
    goto LABEL_371;
  }
  if ((v149 & 0x20) != 0) {
    goto LABEL_302;
  }
LABEL_371:
  if ((*(unsigned char *)(v38 + 40) & 0x40) != 0)
  {
    if (!v28) {
      goto LABEL_526;
    }
    unsigned int v181 = v357;
    if (!v357) {
      goto LABEL_526;
    }
    if (v119 == 95)
    {
      if (v357 == 95) {
        goto LABEL_372;
      }
      BOOL v182 = 1;
    }
    else
    {
      if (v119 > 0x7F)
      {
        unsigned int v188 = *(_xlocale **)(v349 + 56);
        if (v119 < 0x100)
        {
          v194 = &__global_locale;
          if (v188 != (_xlocale *)-1) {
            v194 = *(void **)(v349 + 56);
          }
          if (!v188) {
            v194 = &__c_locale;
          }
          int v184 = *(_DWORD *)(*(void *)(v194[166] + 120) + 4 * v119 + 60);
        }
        else
        {
          uint64_t v189 = v139;
          __int16 v190 = ___runetype_l(v119, v188);
          uint64_t v139 = v189;
          int v142 = v341;
          uint64_t v108 = v355;
          LOWORD(v184) = v190;
          unsigned int v181 = v357;
        }
      }
      else
      {
        int v184 = *v336;
      }
      int v195 = v184 & 0x500;
      BOOL v182 = v195 != 0;
      if (v181 == 95)
      {
        size_t v43 = v343;
        if (!v195) {
          goto LABEL_526;
        }
        goto LABEL_372;
      }
    }
    if (v181 > 0x7F)
    {
      uint64_t v197 = *(_xlocale **)(v349 + 56);
      if (v181 >= 0x100)
      {
        uint64_t v198 = v139;
        LOWORD(v199) = ___runetype_l(v181, v197);
        uint64_t v139 = v198;
        int v142 = v341;
        uint64_t v108 = v355;
        goto LABEL_427;
      }
      int v200 = &__global_locale;
      if (v197 != (_xlocale *)-1) {
        int v200 = *(void **)(v349 + 56);
      }
      if (!v197) {
        int v200 = &__c_locale;
      }
      v196 = *(_RuneLocale **)(v200[166] + 120);
    }
    else
    {
      v196 = &_DefaultRuneLocale;
    }
    __uint32_t v199 = v196->__runetype[v181];
LABEL_427:
    char v201 = v182 ^ ((v199 & 0x500) != 0);
    size_t v43 = v343;
    if (v201) {
      goto LABEL_526;
    }
  }
LABEL_372:
  if ((*(unsigned char *)(v38 + 40) & 4) == 0) {
    goto LABEL_512;
  }
  uint64_t v320 = *(void *)(v38 + 48);
  v360[0] = v119;
  __darwin_ct_rune_t v359 = 0;
  __darwin_ct_rune_t v358 = 0;
  int v307 = *(_DWORD *)(v349 + 96);
  if ((v307 & 2) == 0)
  {
LABEL_374:
    char v180 = 1;
    goto LABEL_431;
  }
  if (v119 < 0x80)
  {
    if ((*v336 & 0x1000) == 0)
    {
      if ((*v336 & 0x8000) == 0) {
        goto LABEL_374;
      }
      __darwin_ct_rune_t v359 = v119;
      __darwin_ct_rune_t v183 = *v331;
LABEL_430:
      char v180 = 0;
      __darwin_ct_rune_t v358 = v183;
      goto LABEL_431;
    }
    __darwin_ct_rune_t v358 = v119;
    __darwin_ct_rune_t v192 = *v332;
LABEL_408:
    char v180 = 0;
    __darwin_ct_rune_t v359 = v192;
    goto LABEL_431;
  }
  unsigned int v310 = v145;
  unsigned int v185 = *(_xlocale **)(v349 + 56);
  uint64_t v186 = v139;
  if (v119 < 0x100)
  {
    signed int v193 = &__global_locale;
    if (v185 != (_xlocale *)-1) {
      signed int v193 = *(void **)(v349 + 56);
    }
    if (!v185) {
      signed int v193 = &__c_locale;
    }
    int v187 = *(_DWORD *)(*(void *)(v193[166] + 120) + 4 * v119 + 60);
    if ((v187 & 0x1000) == 0) {
      goto LABEL_405;
    }
LABEL_407:
    __darwin_ct_rune_t v358 = v119;
    __darwin_ct_rune_t v192 = ___toupper_l(v119, v185);
    uint64_t v108 = v355;
    uint64_t v139 = v186;
    uint64_t v145 = v310;
    int v142 = v341;
    goto LABEL_408;
  }
  if ((___runetype_l(v119, *(locale_t *)(v349 + 56)) & 0x1000) != 0) {
    goto LABEL_407;
  }
  LOWORD(v187) = ___runetype_l(v119, v185);
LABEL_405:
  if ((v187 & 0x8000) != 0)
  {
    __darwin_ct_rune_t v359 = v119;
    __darwin_ct_rune_t v183 = ___tolower_l(v119, v185);
    uint64_t v108 = v355;
    uint64_t v139 = v186;
    uint64_t v145 = v310;
    int v142 = v341;
    goto LABEL_430;
  }
  char v180 = 1;
  uint64_t v108 = v355;
  uint64_t v139 = v186;
  uint64_t v145 = v310;
  int v142 = v341;
LABEL_431:
  int v202 = *(_DWORD *)v320;
  if (*(int *)v320 < 1)
  {
    int v203 = 0;
    int v235 = 1;
    goto LABEL_508;
  }
  unsigned int v311 = v145;
  int v203 = 0;
  uint64_t v204 = 0;
  int v205 = 0;
  int v206 = 0;
  int v207 = 0;
  int v208 = (_DWORD *)(v320 + 8);
  int v314 = *(_DWORD *)v320;
  char v315 = v180;
  v312 = v16;
  *(void *)v351 = v139;
  while (2)
  {
    switch(*v208)
    {
      case 1:
        int v209 = v208[1];
        if (v180)
        {
          if (v209 != v360[0]) {
            goto LABEL_498;
          }
          goto LABEL_501;
        }
        if (v209 == v359 || v209 == v358) {
          goto LABEL_501;
        }
        goto LABEL_498;
      case 2:
        if (++v207 >= v202) {
          goto LABEL_499;
        }
        v210 = v208 + 2;
        if (v208[2] != 3)
        {
          int v203 = 0;
          int v235 = 1;
          goto LABEL_506;
        }
        int v211 = v208[1];
        int v212 = v208[3];
        if (v203)
        {
          if ((v180 & 1) == 0)
          {
LABEL_474:
            if (v211 <= v205 && v205 <= v212)
            {
              int v235 = 0;
              int v203 = 1;
              goto LABEL_506;
            }
            int v203 = 1;
            if (v211 <= (int)v204 && (int)v204 <= v212) {
              goto LABEL_504;
            }
            goto LABEL_478;
          }
        }
        else
        {
          int v304 = v211;
          uint64_t v221 = *(void *)(v349 + 56);
          if ((v180 & 1) == 0)
          {
            int v318 = v206;
            int v325 = __collate_equiv_value(*(void *)(v349 + 56), &v359, 1uLL);
            uint64_t v229 = __collate_equiv_value(v221, &v358, 1uLL);
            char v180 = v315;
            int v206 = v318;
            int v205 = v325;
            uint64_t v204 = v229;
            uint64_t v139 = *(void *)v351;
            uint64_t v108 = v355;
            int v142 = v341;
            int v202 = v314;
            int v211 = v304;
            goto LABEL_474;
          }
          int v322 = v205;
          uint64_t v222 = v204;
          int v223 = __collate_equiv_value(*(void *)(v349 + 56), v360, 1uLL);
          uint64_t v204 = v222;
          int v205 = v322;
          int v206 = v223;
          uint64_t v139 = *(void *)v351;
          uint64_t v108 = v355;
          int v142 = v341;
          int v202 = v314;
          char v180 = v315;
          int v211 = v304;
        }
        int v203 = 1;
        if (v211 > v206 || v206 > v212)
        {
LABEL_478:
          int v208 = v210;
          uint64_t v16 = v312;
LABEL_498:
          ++v207;
          v208 += 2;
          if (v207 >= v202)
          {
LABEL_499:
            int v203 = 0;
            int v235 = 1;
            goto LABEL_507;
          }
          continue;
        }
LABEL_504:
        int v235 = 0;
LABEL_506:
        uint64_t v16 = v312;
LABEL_507:
        size_t v43 = v343;
        uint64_t v145 = v311;
LABEL_508:
        if ((*(unsigned char *)(v320 + 4) & 1) == 0)
        {
LABEL_511:
          if (!v203) {
            goto LABEL_526;
          }
          goto LABEL_512;
        }
        if ((v307 & 8) != 0)
        {
          int v203 = v235;
          if (v360[0] != 10) {
            goto LABEL_511;
          }
LABEL_526:
          uint64_t v254 = *(void *)(v38 + 64);
          char v117 = (uint64_t *)(v38 + 64);
          v38 += 56;
          if (!v254)
          {
LABEL_531:
            uint64_t v103 = *(void *)dfd;
            if (v139)
            {
              int v39 = 0;
              uint64_t v38 = v139;
              uint64_t v10 = v349;
              if (v144)
              {
                uint64_t v255 = *v144;
                if ((v255 & 0x80000000) != 0)
                {
                  int v39 = v144;
                }
                else
                {
                  do
                  {
                    int v256 = *(_DWORD *)&v20[16 * v255];
                    *(_DWORD *)&v20[16 * v255] = v256 + 1;
                    if (!v256) {
                      *(_DWORD *)&v20[16 * v255 + 4] = v28;
                    }
                    int v39 = v144 + 1;
                    v257 = &v20[16 * v255];
                    *((_DWORD *)v257 + 2) = v28;
                    *((_DWORD *)v257 + 3) = v356;
                    uint64_t v255 = v144[1];
                    ++v144;
                  }
                  while ((v255 & 0x80000000) == 0);
                }
                ++v356;
                uint64_t v38 = v139;
              }
              goto LABEL_202;
            }
            int v39 = v144;
LABEL_552:
            int v30 = v344;
LABEL_553:
            uint64_t v10 = v349;
            goto LABEL_598;
          }
          goto LABEL_287;
        }
        if (!v235) {
          goto LABEL_526;
        }
LABEL_512:
        if (!v139)
        {
          uint64_t v139 = *v117;
          uint64_t v144 = *(unsigned int **)(v38 + 24);
          goto LABEL_526;
        }
        *(void *)v352 = v139;
        uint64_t v236 = *((void *)v16 + 23);
        if (v236)
        {
          v237 = *(char **)(v236 + 40);
          uint64_t v16 = (char *)*((void *)v16 + 23);
          goto LABEL_519;
        }
        v238 = v20;
        uint64_t v239 = v145;
        v240 = tre_mem_alloc_impl((uint64_t)v334, 0, 0, 0, 0xC0uLL);
        if (v240)
        {
          v241 = v240;
          *((void *)v240 + 22) = v16;
          *((void *)v240 + 23) = 0;
          v237 = tre_mem_alloc_impl((uint64_t)v334, 0, 0, 0, v343);
          *((void *)v241 + 5) = v237;
          if (v237)
          {
            *((void *)v16 + 23) = v241;
            uint64_t v16 = v241;
            size_t v43 = v343;
            uint64_t v108 = v355;
            uint64_t v145 = v239;
            int v20 = v238;
            int v142 = v341;
LABEL_519:
            *(_DWORD *)uint64_t v16 = v28;
            *((_DWORD *)v16 + 1) = v348;
            *((void *)v16 + 1) = v108;
            *((void *)v16 + 2) = v347;
            *((void *)v16 + 3) = *v117;
            __darwin_ct_rune_t v242 = v357;
            *((_DWORD *)v16 + 8) = *(_DWORD *)(v38 + 16);
            *((_DWORD *)v16 + 9) = v242;
            j__mkdtempat_np((int)v237, v20);
            long long v243 = *((_OWORD *)&v361._mbstateL + 3);
            *((_OWORD *)v16 + 5) = *((_OWORD *)&v361._mbstateL + 2);
            *((_OWORD *)v16 + 6) = v243;
            long long v244 = *((_OWORD *)&v361._mbstateL + 1);
            *((_OWORD *)v16 + 3) = *(_OWORD *)v361.__mbstate8;
            *((_OWORD *)v16 + 4) = v244;
            long long v245 = *((_OWORD *)&v361._mbstateL + 7);
            *((_OWORD *)v16 + 9) = *((_OWORD *)&v361._mbstateL + 6);
            *((_OWORD *)v16 + 10) = v245;
            long long v246 = *((_OWORD *)&v361._mbstateL + 5);
            *((_OWORD *)v16 + 7) = *((_OWORD *)&v361._mbstateL + 4);
            *((_OWORD *)v16 + 8) = v246;
            v247 = *(unsigned int **)(v38 + 24);
            if (v247)
            {
              uint64_t v248 = *v247;
              if ((v248 & 0x80000000) == 0)
              {
                uint64_t v249 = *((void *)v16 + 5);
                v250 = v247 + 1;
                do
                {
                  int v251 = *(_DWORD *)(v249 + 16 * v248);
                  *(_DWORD *)(v249 + 16 * v248) = v251 + 1;
                  if (!v251) {
                    *(_DWORD *)(v249 + 16 * v248 + 4) = v28;
                  }
                  uint64_t v252 = v249 + 16 * v248;
                  *(_DWORD *)(v252 + 8) = v28;
                  *(_DWORD *)(v252 + 12) = v356;
                  unsigned int v253 = *v250++;
                  uint64_t v248 = v253;
                }
                while ((v253 & 0x80000000) == 0);
              }
            }
            uint64_t v108 = v355;
            ++v356;
            uint64_t v139 = *(void *)v352;
            goto LABEL_526;
          }
          v291 = v334;
        }
        else
        {
          v291 = v334;
        }
        tre_mem_destroy(v291);
        v292 = v238;
LABEL_625:
        free(v292);
        free(v327);
        free(v329);
        return 12;
      case 4:
        int v213 = v208[1];
        v214 = *(_xlocale **)(v349 + 56);
        if (v180)
        {
          uint64_t v215 = v360[0];
        }
        else
        {
          if (v359 > 0x7F)
          {
            if (v359 < 0x100)
            {
              v230 = &__global_locale;
              if (v214 != (_xlocale *)-1) {
                v230 = *(void **)(v349 + 56);
              }
              if (!v214) {
                v230 = &__c_locale;
              }
              int v225 = *(_DWORD *)(*(void *)(v230[166] + 120) + 4 * v359 + 60);
            }
            else
            {
              int v323 = v205;
              uint64_t v224 = v139;
              unsigned int v302 = v204;
              int v305 = v203;
              int v316 = v206;
              int v300 = v208[1];
              v296 = *(_xlocale **)(v349 + 56);
              int v225 = ___runetype_l(v359, v214);
              v214 = v296;
              int v213 = v300;
              uint64_t v204 = v302;
              char v180 = v315;
              int v206 = v316;
              int v205 = v323;
              int v203 = v305;
              int v202 = v314;
              uint64_t v139 = v224;
              int v142 = v341;
              uint64_t v108 = v355;
            }
            uint64_t v217 = v225 & v213;
          }
          else
          {
            uint64_t v217 = _DefaultRuneLocale.__runetype[v359] & v213;
          }
          if (v217)
          {
LABEL_501:
            int v235 = 0;
            int v203 = 1;
            goto LABEL_507;
          }
          uint64_t v215 = v358;
        }
        if (v215 > 0x7F)
        {
          if (v215 < 0x100)
          {
            v234 = (_xlocale *)&__global_locale;
            if (v214 != (_xlocale *)-1) {
              v234 = v214;
            }
            if (!v214) {
              v234 = (_xlocale *)&__c_locale;
            }
            int v233 = *(_DWORD *)(*(void *)(*((void *)v234 + 166) + 120) + 4 * v215 + 60);
          }
          else
          {
            int v326 = v205;
            uint64_t v232 = v139;
            unsigned int v303 = v204;
            int v306 = v203;
            int v319 = v206;
            int v301 = v213;
            int v233 = ___runetype_l(v215, v214);
            int v213 = v301;
            uint64_t v204 = v303;
            char v180 = v315;
            int v206 = v319;
            int v205 = v326;
            int v203 = v306;
            int v202 = v314;
            uint64_t v139 = v232;
            int v142 = v341;
            uint64_t v108 = v355;
          }
          uint64_t v231 = v233 & v213;
        }
        else
        {
          uint64_t v231 = _DefaultRuneLocale.__runetype[v215] & v213;
        }
        if (v231) {
          goto LABEL_501;
        }
        goto LABEL_498;
      case 5:
        if (v203)
        {
          if (v180) {
            goto LABEL_457;
          }
        }
        else
        {
          uint64_t v218 = *(void *)(v349 + 56);
          if (v180)
          {
            int v321 = v205;
            uint64_t v219 = v204;
            int v220 = __collate_equiv_value(*(void *)(v349 + 56), v360, 1uLL);
            uint64_t v204 = v219;
            int v205 = v321;
            int v206 = v220;
            uint64_t v139 = *(void *)v351;
            uint64_t v108 = v355;
            int v142 = v341;
            int v202 = v314;
            char v180 = v315;
LABEL_457:
            int v203 = 1;
            if (v208[1] == v206) {
              goto LABEL_502;
            }
            goto LABEL_498;
          }
          int v317 = v206;
          int v324 = __collate_equiv_value(*(void *)(v349 + 56), &v359, 1uLL);
          uint64_t v226 = __collate_equiv_value(v218, &v358, 1uLL);
          char v180 = v315;
          int v206 = v317;
          int v205 = v324;
          uint64_t v204 = v226;
          uint64_t v139 = *(void *)v351;
          uint64_t v108 = v355;
          int v142 = v341;
          int v202 = v314;
        }
        int v227 = v208[1];
        int v203 = 1;
        if (v227 == v205 || v227 == v204)
        {
LABEL_502:
          int v235 = 0;
          goto LABEL_507;
        }
        goto LABEL_498;
      default:
        goto LABEL_498;
    }
  }
}

uint64_t tre_tnfa_run_parallel(uint64_t a1, const char *a2, int a3, int a4, int *a5, char a6, unsigned int *a7)
{
  __int32 v289 = 0;
  unsigned int v10 = *(_DWORD *)(a1 + 96);
  memset(&v292, 0, sizeof(v292));
  if (a5) {
    int v11 = *(_DWORD *)(a1 + 80);
  }
  else {
    int v11 = 0;
  }
  uint64_t v12 = 16 * v11;
  uint64_t v13 = *(int *)(a1 + 92);
  uint64_t v14 = 16 * v13;
  uint64_t v15 = 16 * v13 + 16;
  uint64_t v16 = (char *)malloc_type_malloc(16 * v13 + v12 + 2 * (v15 + v12 * v13) + 28, 0x4C34470BuLL);
  if (!v16) {
    return 12;
  }
  unsigned int v285 = v10;
  uint64_t v236 = a7;
  uint64_t v17 = v11;
  uint64_t v281 = 16 * v11;
  uint64_t v18 = &v16[v12];
  if (((unint64_t)&v16[v12] & 7) != 0) {
    uint64_t v19 = 8 - ((unint64_t)&v16[v12] & 7);
  }
  else {
    uint64_t v19 = 0;
  }
  unsigned int v253 = &v18[v19];
  uint64_t v20 = (uint64_t)&v18[v19 + v15];
  uint64_t v21 = 8 - (v20 & 7);
  if ((v20 & 7) == 0) {
    uint64_t v21 = 0;
  }
  uint64_t v283 = v21;
  int v22 = (char *)(v20 + v21);
  uint64_t v23 = v20 + v21 + v15;
  if ((v23 & 7) != 0) {
    uint64_t v24 = 8 - (v23 & 7);
  }
  else {
    uint64_t v24 = 0;
  }
  v237 = v16;
  MEMORY[0x18C122530]();
  int v280 = (_DWORD *)(v23 + v24);
  uint64_t v288 = a1;
  uint64_t v26 = *(unsigned int *)(a1 + 92);
  int v27 = a4;
  if ((int)v26 >= 1)
  {
    if ((((_BYTE)v280 + (_BYTE)v14) & 7) != 0) {
      uint64_t v28 = 8 - (((_BYTE)v280 + (_BYTE)v14) & 7);
    }
    else {
      uint64_t v28 = 0;
    }
    uint64_t v29 = (uint64_t)v237 + v281 + v283 + v14 + 24;
    uint64_t v30 = (uint64_t)v237 + v281 + 8;
    uint64_t v31 = v28 + v24 + v283 + 48 * (int)v13;
    uint64_t v32 = (uint64_t)v237 + v281 + v31 + 32;
    uint64_t v33 = 32 * v17;
    uint64_t v34 = (uint64_t)v237 + 32 * v17 + v31 + 32;
    uint64_t v35 = *(unsigned int *)(a1 + 92);
    do
    {
      *(void *)(v29 + v19) = v32 + v19;
      *(void *)(v30 + v19) = v34 + v19;
      v29 += 16;
      v30 += 16;
      v32 += v33;
      v34 += v33;
      --v35;
    }
    while (v35);
    uint64_t v36 = v280;
    do
    {
      _DWORD *v36 = -1;
      v36 += 4;
      --v26;
    }
    while (v26);
  }
  int v37 = a3;
  if (a2)
  {
    uint64_t v38 = (char *)*(unsigned int *)(a1 + 68);
    if ((v38 & 0x80000000) == 0)
    {
      if (a4 != 2)
      {
        if (a4 != 1)
        {
          unsigned int v44 = 0;
          unint64_t v39 = (unint64_t)a2;
          goto LABEL_61;
        }
        if (a3 < 0)
        {
          unint64_t v39 = j__strncasecmp(a2, v38, v25);
          if (!v39) {
            goto LABEL_56;
          }
        }
        else
        {
          unint64_t v39 = j__mkdirx_np(a2, (filesec_t)v38);
          if (!v39) {
            goto LABEL_56;
          }
        }
LABEL_58:
        if (v39 >= (unint64_t)(a2 + 1)) {
          unsigned int v44 = *(unsigned __int8 *)(v39 - 1);
        }
        else {
          unsigned int v44 = 0;
        }
LABEL_61:
        __int32 v289 = *(unsigned __int8 *)v39;
        int v51 = v39 - a2;
        if (a3 < 0 || v51 < a3) {
          ++v39;
        }
        long long v243 = (char *)v39;
        goto LABEL_84;
      }
      if (v38 <= 0x7F)
      {
        if (a3 < 0)
        {
          char v47 = *a2;
          if (*a2)
          {
            int v48 = (char *)a2;
            do
            {
              long long v243 = v48;
              if (v38 == v47) {
                goto LABEL_57;
              }
              if (v47 < 0) {
                goto LABEL_68;
              }
              ++v48;
              char v47 = v243[1];
            }
            while (v47);
          }
        }
        else if (a3)
        {
          int v41 = a3;
          int v42 = (char *)a2;
          while (1)
          {
            long long v243 = v42;
            int v43 = *v42;
            if (v38 == v43) {
              break;
            }
            if ((v43 & 0x80) != 0) {
              goto LABEL_68;
            }
            int v42 = v243 + 1;
            if (!--v41) {
              goto LABEL_56;
            }
          }
LABEL_57:
          unint64_t v39 = (unint64_t)v243;
          goto LABEL_58;
        }
LABEL_56:
        free(v237);
        return 1;
      }
      if (a3 < 0)
      {
        char v49 = *a2;
        if (!*a2) {
          goto LABEL_56;
        }
        BOOL v50 = (char *)a2;
        while (1)
        {
          long long v243 = v50;
          if (v49 < 0) {
            break;
          }
          ++v50;
          char v49 = v243[1];
          if (!v49) {
            goto LABEL_56;
          }
        }
      }
      else
      {
        if (!a3) {
          goto LABEL_56;
        }
        int v45 = a3;
        int v46 = (char *)a2;
        while ((*v46 & 0x80000000) == 0)
        {
          ++v46;
          if (!--v45) {
            goto LABEL_56;
          }
        }
        long long v243 = v46;
      }
LABEL_68:
      if (v243 != a2)
      {
        unsigned int v44 = *(v243 - 1);
        __int32 v289 = v44;
        int v51 = v243 - a2;
        if (a3 < 0 || a3 > v51)
        {
          int v53 = *v243;
          __uint32_t v54 = v253;
          if ((v53 & 0x80000000) == 0)
          {
            ++v243;
            __int32 v289 = v53;
            LODWORD(v239) = 1;
            goto LABEL_89;
          }
          int v235 = a3 - v51;
          if (a3 < 0) {
            int v235 = 32;
          }
          size_t v232 = mbrtowc_l(&v289, v243, v235, &v292, *(locale_t *)(a1 + 56));
          if (v232 > 0xFFFFFFFFFFFFFFFDLL) {
            return 17;
          }
          if ((a3 & 0x80000000) == 0 && !v232)
          {
            __int32 v289 = 0;
            int v233 = v243;
            goto LABEL_583;
          }
          v234 = v243;
          goto LABEL_585;
        }
        __int32 v289 = 0;
LABEL_84:
        LODWORD(v239) = 1;
        goto LABEL_88;
      }
    }
  }
  unsigned int v44 = v289;
  if (a4)
  {
    if (a4 == 2)
    {
      if (a3)
      {
        if (*a2 < 0)
        {
          if (a3 < 0) {
            size_t v231 = 32;
          }
          else {
            size_t v231 = a3;
          }
          size_t v232 = mbrtowc_l(&v289, a2, v231, &v292, *(locale_t *)(a1 + 56));
          if (v232 > 0xFFFFFFFFFFFFFFFDLL) {
            return 17;
          }
          if ((a3 & 0x80000000) == 0 && !v232)
          {
            int v51 = 0;
            __int32 v289 = 0;
            int v233 = (char *)a2;
LABEL_583:
            long long v243 = v233 + 1;
            LODWORD(v239) = 1;
LABEL_586:
            int v27 = a4;
            int v37 = a3;
            goto LABEL_88;
          }
          int v51 = 0;
          v234 = (char *)a2;
LABEL_585:
          long long v243 = &v234[v232];
          LODWORD(v239) = v232;
          goto LABEL_586;
        }
        int v51 = 0;
        __int32 v55 = *(unsigned __int8 *)a2;
        long long v243 = (char *)(a2 + 1);
        goto LABEL_83;
      }
    }
    else
    {
      if (a4 != 1)
      {
        int v51 = 0;
LABEL_87:
        LODWORD(v239) = 1;
        long long v243 = (char *)a2;
        goto LABEL_88;
      }
      if (a3)
      {
        int v51 = 0;
        __int32 v55 = *(unsigned __int8 *)a2;
        long long v243 = (char *)(a2 + 1);
LABEL_83:
        __int32 v289 = v55;
        goto LABEL_84;
      }
    }
LABEL_86:
    int v51 = 0;
    __int32 v289 = 0;
    goto LABEL_87;
  }
  if (!a3) {
    goto LABEL_86;
  }
  int v51 = 0;
  long long v243 = (char *)a2;
  __int32 v289 = *(_DWORD *)a2;
  a2 += 4;
  LODWORD(v239) = 1;
LABEL_88:
  __uint32_t v54 = v253;
LABEL_89:
  int v276 = a6 & 2;
  int v278 = v54;
  uint64_t v273 = 1;
  unsigned int v279 = -1;
  int v277 = (v285 >> 3) & 1;
  size_t v56 = (char *)v237;
  while (2)
  {
    int v256 = v22;
    uint64_t v254 = v54;
    if ((v279 & 0x80000000) == 0)
    {
      if (v17 && v278 != v54)
      {
        if (v37 < 0) {
          goto LABEL_244;
        }
LABEL_94:
        uint64_t v57 = v273;
        if (v51 < v37)
        {
          unsigned int v44 = v289;
          goto LABEL_245;
        }
      }
LABEL_575:
      *uint64_t v236 = v279;
      free(v237);
      return v279 >> 31;
    }
    uint64_t v58 = *(int **)(v288 + 8);
    if (!*((void *)v58 + 1)) {
      goto LABEL_243;
    }
    BOOL v60 = (a6 & 1) == 0 && v51 < 1;
    if (v44 == 10) {
      int v61 = v277;
    }
    else {
      int v61 = 0;
    }
    uint64_t v62 = v44;
    long long v286 = &_DefaultRuneLocale.__runetype[v44];
    do
    {
      __uint32_t v63 = v58 + 10;
      while (v280[4 * *(v63 - 6)] < v51)
      {
        int v64 = *v63;
        if (!*v63) {
          goto LABEL_230;
        }
        int v65 = (v64 & 1) == 0 || v60;
        if ((v65 | v61) != 1) {
          goto LABEL_220;
        }
        if ((v64 & 2) != 0)
        {
          int v66 = v277;
          if (v289 != 10) {
            int v66 = 0;
          }
          if (v289 | v276 && !v66) {
            goto LABEL_220;
          }
        }
        if ((v64 & 8) != 0)
        {
          if (v44 == 95) {
            goto LABEL_220;
          }
          if (v44 > 0x7F)
          {
            __uint32_t v71 = *(_xlocale **)(v288 + 56);
            if (v44 < 0x100)
            {
              uint64_t v74 = &__global_locale;
              if (v71 != (_xlocale *)-1) {
                uint64_t v74 = *(void **)(v288 + 56);
              }
              if (!v71) {
                uint64_t v74 = &__c_locale;
              }
              __uint32_t v69 = *(_DWORD *)(*(void *)(v74[166] + 120) + 4 * v62 + 60);
            }
            else
            {
              LOWORD(v69) = ___runetype_l(v44, v71);
            }
          }
          else
          {
            __uint32_t v69 = *v286;
          }
          if ((v69 & 0x500) != 0) {
            goto LABEL_220;
          }
          if (v289 != 95)
          {
            if (v289 <= 0x7F)
            {
              uint64_t v75 = &_DefaultRuneLocale;
              goto LABEL_227;
            }
            uint64_t v82 = *(_xlocale **)(v288 + 56);
            if (v289 < 0x100)
            {
              int v101 = &__global_locale;
              if (v82 != (_xlocale *)-1) {
                int v101 = *(void **)(v288 + 56);
              }
              if (!v82) {
                int v101 = &__c_locale;
              }
              uint64_t v75 = *(_RuneLocale **)(v101[166] + 120);
LABEL_227:
              __uint32_t v83 = v75->__runetype[v289];
            }
            else
            {
              LOWORD(v83) = ___runetype_l(v289, v82);
            }
            if ((v83 & 0x500) == 0) {
              goto LABEL_220;
            }
          }
        }
        if ((*v63 & 0x10) != 0)
        {
          if (v44 != 95)
          {
            if (v44 > 0x7F)
            {
              uint64_t v73 = *(_xlocale **)(v288 + 56);
              if (v44 < 0x100)
              {
                __darwin_ct_rune_t v77 = &__global_locale;
                if (v73 != (_xlocale *)-1) {
                  __darwin_ct_rune_t v77 = *(void **)(v288 + 56);
                }
                if (!v73) {
                  __darwin_ct_rune_t v77 = &__c_locale;
                }
                __uint32_t v70 = *(_DWORD *)(*(void *)(v77[166] + 120) + 4 * v62 + 60);
              }
              else
              {
                LOWORD(v70) = ___runetype_l(v44, v73);
              }
            }
            else
            {
              __uint32_t v70 = *v286;
            }
            if ((v70 & 0x500) == 0) {
              goto LABEL_220;
            }
          }
          if (v289 == 95) {
            goto LABEL_220;
          }
          if (v289 <= 0x7F)
          {
            long long v78 = &_DefaultRuneLocale;
            goto LABEL_166;
          }
          long long v79 = *(_xlocale **)(v288 + 56);
          if (v289 < 0x100)
          {
            long long v81 = &__global_locale;
            if (v79 != (_xlocale *)-1) {
              long long v81 = *(void **)(v288 + 56);
            }
            if (!v79) {
              long long v81 = &__c_locale;
            }
            long long v78 = *(_RuneLocale **)(v81[166] + 120);
LABEL_166:
            __uint32_t v80 = v78->__runetype[v289];
          }
          else
          {
            LOWORD(v80) = ___runetype_l(v289, v79);
          }
          if ((v80 & 0x500) != 0) {
            goto LABEL_220;
          }
          if ((*v63 & 0x20) == 0) {
            goto LABEL_191;
          }
          goto LABEL_122;
        }
        if ((*v63 & 0x20) == 0) {
          goto LABEL_191;
        }
LABEL_122:
        if (!v51) {
          goto LABEL_191;
        }
        unsigned int v67 = v289;
        if (!v289) {
          goto LABEL_191;
        }
        if (v44 == 95)
        {
          if (v289 == 95) {
            goto LABEL_220;
          }
          BOOL v68 = 1;
LABEL_180:
          if (v67 <= 0x7F)
          {
            int v86 = &_DefaultRuneLocale;
            goto LABEL_189;
          }
          uint64_t v87 = *(_xlocale **)(v288 + 56);
          if (v67 < 0x100)
          {
            uint64_t v89 = &__global_locale;
            if (v87 != (_xlocale *)-1) {
              uint64_t v89 = *(void **)(v288 + 56);
            }
            if (!v87) {
              uint64_t v89 = &__c_locale;
            }
            int v86 = *(_RuneLocale **)(v89[166] + 120);
LABEL_189:
            __uint32_t v88 = v86->__runetype[v67];
          }
          else
          {
            LOWORD(v88) = ___runetype_l(v67, v87);
          }
          if (v68 == ((v88 & 0x500) != 0)) {
            goto LABEL_220;
          }
          goto LABEL_191;
        }
        if (v44 > 0x7F)
        {
          int v76 = *(_xlocale **)(v288 + 56);
          if (v44 < 0x100)
          {
            uint64_t v84 = &__global_locale;
            if (v76 != (_xlocale *)-1) {
              uint64_t v84 = *(void **)(v288 + 56);
            }
            if (!v76) {
              uint64_t v84 = &__c_locale;
            }
            __uint32_t v72 = *(_DWORD *)(*(void *)(v84[166] + 120) + 4 * v62 + 60);
          }
          else
          {
            LOWORD(v72) = ___runetype_l(v44, v76);
            unsigned int v67 = v289;
          }
        }
        else
        {
          __uint32_t v72 = *v286;
        }
        int v85 = v72 & 0x500;
        BOOL v68 = v85 != 0;
        if (v67 != 95) {
          goto LABEL_180;
        }
        if (v85) {
          goto LABEL_220;
        }
LABEL_191:
        if ((*(unsigned char *)v63 & 0x40) == 0) {
          goto LABEL_230;
        }
        if (!v51) {
          goto LABEL_220;
        }
        unsigned int v90 = v289;
        if (!v289) {
          goto LABEL_220;
        }
        if (v44 == 95)
        {
          if (v289 == 95) {
            goto LABEL_230;
          }
          BOOL v91 = 1;
        }
        else
        {
          if (v44 > 0x7F)
          {
            unsigned int v93 = *(_xlocale **)(v288 + 56);
            if (v44 < 0x100)
            {
              __int16 v94 = &__global_locale;
              if (v93 != (_xlocale *)-1) {
                __int16 v94 = *(void **)(v288 + 56);
              }
              if (!v93) {
                __int16 v94 = &__c_locale;
              }
              __uint32_t v92 = *(_DWORD *)(*(void *)(v94[166] + 120) + 4 * v62 + 60);
            }
            else
            {
              LOWORD(v92) = ___runetype_l(v44, v93);
              unsigned int v90 = v289;
            }
          }
          else
          {
            __uint32_t v92 = *v286;
          }
          int v95 = v92 & 0x500;
          BOOL v91 = v95 != 0;
          if (v90 == 95)
          {
            if (v95) {
              goto LABEL_230;
            }
            goto LABEL_220;
          }
        }
        if (v90 > 0x7F)
        {
          int v97 = *(_xlocale **)(v288 + 56);
          if (v90 >= 0x100)
          {
            LOWORD(v98) = ___runetype_l(v90, v97);
            goto LABEL_219;
          }
          unsigned int v99 = &__global_locale;
          if (v97 != (_xlocale *)-1) {
            unsigned int v99 = *(void **)(v288 + 56);
          }
          if (!v97) {
            unsigned int v99 = &__c_locale;
          }
          unsigned int v96 = *(_RuneLocale **)(v99[166] + 120);
        }
        else
        {
          unsigned int v96 = &_DefaultRuneLocale;
        }
        __uint32_t v98 = v96->__runetype[v90];
LABEL_219:
        if (v91 == ((v98 & 0x500) != 0))
        {
LABEL_230:
          *(void *)int v278 = *((void *)v63 - 4);
          char v102 = (char **)(v278 + 8);
          MEMORY[0x18C122530](*((void *)v278 + 1), v281);
          uint64_t v103 = (unsigned int *)*((void *)v63 - 2);
          if (v103)
          {
            uint64_t v104 = *v103;
            if ((v104 & 0x80000000) == 0)
            {
              int v105 = v103 + 1;
              do
              {
                if ((int)v104 < (int)v17)
                {
                  uint64_t v106 = *v102;
                  int v107 = *(_DWORD *)&(*v102)[16 * v104];
                  *(_DWORD *)&(*v102)[16 * v104] = v107 + 1;
                  if (!v107) {
                    *(_DWORD *)&v106[16 * v104 + 4] = v51;
                  }
                  uint64_t v108 = &v106[16 * v104];
                  *((_DWORD *)v108 + 2) = v51;
                  *((_DWORD *)v108 + 3) = v273;
                }
                unsigned int v109 = *v105++;
                uint64_t v104 = v109;
              }
              while ((v109 & 0x80000000) == 0);
            }
            uint64_t v273 = (v273 + 1);
          }
          if (*(void *)v278 == *(void *)(v288 + 16))
          {
            j__mkdtempat_np((int)a5, *v102);
            unsigned int v279 = v51;
          }
          size_t v110 = &v280[4 * *(v63 - 6)];
          *size_t v110 = v51;
          *((void *)v110 + 1) = v102;
          v278 += 16;
          uint64_t v62 = v44;
          break;
        }
LABEL_220:
        uint64_t v100 = *((void *)v63 + 3);
        v63 += 14;
        if (!v100) {
          goto LABEL_243;
        }
      }
      uint64_t v58 = v63 + 4;
    }
    while (*((void *)v63 + 3));
LABEL_243:
    *(void *)int v278 = 0;
    int v27 = a4;
    int v37 = a3;
    __uint32_t v54 = v254;
    if ((a3 & 0x80000000) == 0) {
      goto LABEL_94;
    }
LABEL_244:
    unsigned int v44 = v289;
    uint64_t v57 = v273;
    if (!v289) {
      goto LABEL_575;
    }
LABEL_245:
    if (!v27)
    {
      ++v51;
      if ((v37 & 0x80000000) == 0 && v51 >= v37) {
        goto LABEL_253;
      }
      __int32 v111 = *(_DWORD *)a2;
      a2 += 4;
LABEL_260:
      __int32 v289 = v111;
      goto LABEL_261;
    }
    if (v27 != 2)
    {
      if (v27 == 1)
      {
        ++v51;
        if (v37 < 0 || v51 < v37)
        {
          __int32 v111 = *v243++;
          goto LABEL_260;
        }
LABEL_253:
        __int32 v289 = 0;
      }
LABEL_261:
      uint64_t v113 = *(void *)v54;
      if (!*(void *)v54)
      {
        int v278 = v256;
LABEL_566:
        uint64_t v273 = v57;
        *(void *)int v278 = 0;
        int v22 = v254;
        __uint32_t v54 = v256;
        int v27 = a4;
        int v37 = a3;
        continue;
      }
      BOOL v115 = (a6 & 1) == 0 && v51 < 1;
      BOOL v287 = v115;
      int v116 = v277;
      if (v44 != 10) {
        int v116 = 0;
      }
      int v284 = v116;
      char v117 = &_DefaultRuneLocale.__magic[4 * v44];
      int v275 = (int *)(v117 + 60);
      __darwin_ct_rune_t v242 = (__darwin_ct_rune_t *)(v117 + 2108);
      v240 = (__darwin_ct_rune_t *)(v117 + 1084);
      int v278 = v256;
      int v118 = v54;
      while (1)
      {
        unsigned __int32 v119 = (uint64_t *)(v113 + 8);
        if (*(void *)(v113 + 8)) {
          break;
        }
LABEL_563:
        uint64_t v229 = *((void *)v118 + 2);
        v118 += 16;
        uint64_t v113 = v229;
        if (!v229) {
          goto LABEL_566;
        }
      }
      uint64_t v282 = v118;
      while (2)
      {
        if (*(_DWORD *)v113 > (signed int)v44 || *(_DWORD *)(v113 + 4) < (signed int)v44) {
          goto LABEL_559;
        }
        int v120 = *(_DWORD *)(v113 + 40);
        if (!v120) {
          goto LABEL_494;
        }
        int v121 = v287;
        if ((v120 & 1) == 0) {
          int v121 = 1;
        }
        if ((v121 | v284) != 1) {
          goto LABEL_559;
        }
        if ((v120 & 2) != 0)
        {
          int v126 = v277;
          if (v289 != 10) {
            int v126 = 0;
          }
          if (v289 | v276 && !v126) {
            goto LABEL_559;
          }
        }
        if ((v120 & 8) != 0)
        {
          if (v44 == 95) {
            goto LABEL_559;
          }
          if (v44 > 0x7F)
          {
            int v129 = *(_xlocale **)(v288 + 56);
            if (v44 < 0x100)
            {
              int v132 = &__global_locale;
              if (v129 != (_xlocale *)-1) {
                int v132 = *(void **)(v288 + 56);
              }
              if (!v129) {
                int v132 = &__c_locale;
              }
              int v127 = *(_DWORD *)(*(void *)(v132[166] + 120) + 4 * v44 + 60);
            }
            else
            {
              LOWORD(v127) = ___runetype_l(v44, v129);
            }
          }
          else
          {
            int v127 = *v275;
          }
          if ((v127 & 0x500) != 0) {
            goto LABEL_559;
          }
          if (v289 != 95)
          {
            if (v289 <= 0x7F)
            {
              int v133 = &_DefaultRuneLocale;
              goto LABEL_382;
            }
            __int16 v140 = *(_xlocale **)(v288 + 56);
            if (v289 < 0x100)
            {
              uint64_t v158 = &__global_locale;
              if (v140 != (_xlocale *)-1) {
                uint64_t v158 = *(void **)(v288 + 56);
              }
              if (!v140) {
                uint64_t v158 = &__c_locale;
              }
              int v133 = *(_RuneLocale **)(v158[166] + 120);
LABEL_382:
              __uint32_t v141 = v133->__runetype[v289];
            }
            else
            {
              LOWORD(v141) = ___runetype_l(v289, v140);
            }
            if ((v141 & 0x500) == 0) {
              goto LABEL_559;
            }
          }
        }
        int v122 = *(_DWORD *)(v113 + 40);
        if ((v122 & 0x10) == 0)
        {
          if ((v122 & 0x20) != 0) {
            goto LABEL_283;
          }
LABEL_357:
          if ((*(unsigned char *)(v113 + 40) & 0x40) == 0)
          {
LABEL_358:
            if ((*(unsigned char *)(v113 + 40) & 4) == 0) {
              goto LABEL_494;
            }
            uint64_t v267 = *(void *)(v113 + 48);
            unsigned int v291 = v44;
            uint64_t v290 = 0;
            int v255 = *(_DWORD *)(v288 + 96);
            if ((v255 & 2) == 0)
            {
LABEL_360:
              char v148 = 1;
              goto LABEL_417;
            }
            if (v44 < 0x80)
            {
              if ((*v275 & 0x1000) == 0)
              {
                if ((*v275 & 0x8000) == 0) {
                  goto LABEL_360;
                }
                HIDWORD(v290) = v44;
                __darwin_ct_rune_t v152 = *v240;
LABEL_416:
                char v148 = 0;
                LODWORD(v290) = v152;
                goto LABEL_417;
              }
              LODWORD(v290) = v44;
              __darwin_ct_rune_t v159 = *v242;
LABEL_394:
              char v148 = 0;
              HIDWORD(v290) = v159;
              goto LABEL_417;
            }
            uint64_t v154 = v57;
            uint64_t v155 = *(_xlocale **)(v288 + 56);
            if (v44 < 0x100)
            {
              uint64_t v160 = &__global_locale;
              if (v155 != (_xlocale *)-1) {
                uint64_t v160 = *(void **)(v288 + 56);
              }
              if (!v155) {
                uint64_t v160 = &__c_locale;
              }
              int v156 = *(_DWORD *)(*(void *)(v160[166] + 120) + 4 * v44 + 60);
              if ((v156 & 0x1000) == 0) {
                goto LABEL_391;
              }
            }
            else if ((___runetype_l(v44, *(locale_t *)(v288 + 56)) & 0x1000) == 0)
            {
              LOWORD(v156) = ___runetype_l(v44, v155);
LABEL_391:
              if ((v156 & 0x8000) != 0)
              {
                HIDWORD(v290) = v44;
                __darwin_ct_rune_t v152 = ___tolower_l(v44, v155);
                uint64_t v57 = v154;
                int v118 = v282;
                goto LABEL_416;
              }
              char v148 = 1;
              uint64_t v57 = v154;
              int v118 = v282;
LABEL_417:
              int v168 = *(_DWORD *)v267;
              if (*(int *)v267 < 1)
              {
                int v169 = 0;
                int v196 = 1;
                goto LABEL_490;
              }
              uint64_t v274 = v57;
              int v169 = 0;
              int v170 = 0;
              uint64_t v171 = 0;
              int v172 = 0;
              int v173 = 0;
              int v174 = (_DWORD *)(v267 + 8);
              int v257 = *(_DWORD *)v267;
              char v258 = v148;
LABEL_419:
              switch(*v174)
              {
                case 1:
                  int v175 = v174[1];
                  if (v148)
                  {
                    if (v175 != v291) {
                      goto LABEL_484;
                    }
                    goto LABEL_487;
                  }
                  BOOL v182 = v175 == HIDWORD(v290) || v175 == v290;
                  if (v182) {
                    goto LABEL_487;
                  }
                  goto LABEL_484;
                case 2:
                  if (++v173 >= v168) {
                    goto LABEL_485;
                  }
                  v176 = v174 + 2;
                  if (v174[2] != 3) {
                    goto LABEL_485;
                  }
                  int v177 = v174[1];
                  int v178 = v174[3];
                  if (v169)
                  {
                    if ((v148 & 1) == 0) {
                      goto LABEL_461;
                    }
                  }
                  else
                  {
                    int v250 = v177;
                    uint64_t v186 = *(void *)(v288 + 56);
                    if ((v148 & 1) == 0)
                    {
                      uint64_t v248 = *(void *)(v288 + 56);
                      int v265 = v172;
                      unsigned int v271 = __collate_equiv_value(v186, (const __int32 *)&v290 + 1, 1uLL);
                      int v192 = __collate_equiv_value(v248, (const __int32 *)&v290, 1uLL);
                      int v172 = v265;
                      uint64_t v171 = v271;
                      int v170 = v192;
                      int v168 = v257;
                      char v148 = v258;
                      int v177 = v250;
LABEL_461:
                      if (v177 <= (int)v171 && (int)v171 <= v178) {
                        goto LABEL_487;
                      }
                      int v169 = 1;
                      if (v177 <= v170 && v170 <= v178) {
                        goto LABEL_488;
                      }
                      goto LABEL_465;
                    }
                    int v260 = v170;
                    unsigned int v268 = v171;
                    int v187 = __collate_equiv_value(v186, (const __int32 *)&v291, 1uLL);
                    char v148 = v258;
                    int v170 = v260;
                    uint64_t v171 = v268;
                    int v172 = v187;
                    int v168 = v257;
                    int v177 = v250;
                  }
                  int v169 = 1;
                  if (v177 <= v172 && v172 <= v178) {
                    goto LABEL_488;
                  }
LABEL_465:
                  int v174 = v176;
                  goto LABEL_484;
                case 4:
                  int v179 = v174[1];
                  char v180 = *(_xlocale **)(v288 + 56);
                  if (v148)
                  {
                    uint64_t v181 = v291;
                  }
                  else
                  {
                    if (HIDWORD(v290) > 0x7F)
                    {
                      if (HIDWORD(v290) < 0x100)
                      {
                        signed int v193 = &__global_locale;
                        if (v180 != (_xlocale *)-1) {
                          signed int v193 = *(void **)(v288 + 56);
                        }
                        if (!v180) {
                          signed int v193 = &__c_locale;
                        }
                        int v188 = *(_DWORD *)(*(void *)(v193[166] + 120) + 4 * HIDWORD(v290) + 60);
                      }
                      else
                      {
                        int v261 = v170;
                        int v263 = v172;
                        int v251 = v169;
                        unsigned int v269 = v171;
                        int v247 = v174[1];
                        v241 = *(_xlocale **)(v288 + 56);
                        int v188 = ___runetype_l(SHIDWORD(v290), v180);
                        char v180 = v241;
                        int v179 = v247;
                        int v170 = v261;
                        int v172 = v263;
                        uint64_t v171 = v269;
                        int v169 = v251;
                        int v168 = v257;
                        char v148 = v258;
                      }
                      if ((v188 & v179) != 0)
                      {
LABEL_487:
                        int v196 = 0;
                        int v169 = 1;
                        goto LABEL_489;
                      }
                    }
                    else if ((_DefaultRuneLocale.__runetype[HIDWORD(v290)] & v179) != 0)
                    {
                      goto LABEL_487;
                    }
                    uint64_t v181 = v290;
                  }
                  if (v181 > 0x7F)
                  {
                    if (v181 < 0x100)
                    {
                      int v195 = (_xlocale *)&__global_locale;
                      if (v180 != (_xlocale *)-1) {
                        int v195 = v180;
                      }
                      if (!v180) {
                        int v195 = (_xlocale *)&__c_locale;
                      }
                      int v194 = *(_DWORD *)(*(void *)(*((void *)v195 + 166) + 120) + 4 * v181 + 60);
                    }
                    else
                    {
                      int v262 = v170;
                      int v266 = v172;
                      int v252 = v169;
                      unsigned int v272 = v171;
                      int v249 = v179;
                      int v194 = ___runetype_l(v181, v180);
                      int v179 = v249;
                      int v170 = v262;
                      int v172 = v266;
                      uint64_t v171 = v272;
                      int v169 = v252;
                      int v168 = v257;
                      char v148 = v258;
                    }
                    if ((v194 & v179) != 0) {
                      goto LABEL_487;
                    }
                  }
                  else if ((_DefaultRuneLocale.__runetype[v181] & v179) != 0)
                  {
                    goto LABEL_487;
                  }
                  goto LABEL_484;
                case 5:
                  if (v169)
                  {
                    if ((v148 & 1) == 0) {
                      goto LABEL_454;
                    }
                  }
                  else
                  {
                    uint64_t v183 = *(void *)(v288 + 56);
                    if ((v148 & 1) == 0)
                    {
                      int v264 = v172;
                      unsigned int v270 = __collate_equiv_value(*(void *)(v288 + 56), (const __int32 *)&v290 + 1, 1uLL);
                      int v189 = __collate_equiv_value(v183, (const __int32 *)&v290, 1uLL);
                      int v172 = v264;
                      uint64_t v171 = v270;
                      int v170 = v189;
                      int v168 = v257;
                      char v148 = v258;
LABEL_454:
                      int v190 = v174[1];
                      int v169 = 1;
                      if (v190 != v171 && v190 != v170) {
                        goto LABEL_484;
                      }
LABEL_488:
                      int v196 = 0;
LABEL_489:
                      uint64_t v57 = v274;
                      int v118 = v282;
LABEL_490:
                      if (*(unsigned char *)(v267 + 4))
                      {
                        if ((v255 & 8) != 0)
                        {
                          int v169 = v196;
                          if (v291 == 10) {
                            goto LABEL_559;
                          }
                          goto LABEL_493;
                        }
                        if (!v196) {
                          goto LABEL_559;
                        }
                      }
                      else
                      {
LABEL_493:
                        if (!v169) {
                          goto LABEL_559;
                        }
                      }
LABEL_494:
                      j__mkdtempat_np((int)v56, *((char **)v118 + 1));
                      uint64_t v197 = *(unsigned int **)(v113 + 24);
                      if (v197)
                      {
                        uint64_t v198 = *v197;
                        uint64_t v199 = 16 * v17;
                        if ((v198 & 0x80000000) == 0)
                        {
                          int v200 = v197 + 1;
                          do
                          {
                            if ((int)v198 < (int)v17)
                            {
                              int v201 = *(_DWORD *)&v56[16 * v198];
                              *(_DWORD *)&v56[16 * v198] = v201 + 1;
                              if (!v201) {
                                *(_DWORD *)&v56[16 * v198 + 4] = v51;
                              }
                              int v202 = &v56[16 * v198];
                              *((_DWORD *)v202 + 2) = v51;
                              *((_DWORD *)v202 + 3) = v57;
                            }
                            unsigned int v203 = *v200++;
                            uint64_t v198 = v203;
                          }
                          while ((v203 & 0x80000000) == 0);
                        }
                        uint64_t v57 = (v57 + 1);
                      }
                      else
                      {
                        uint64_t v199 = 16 * v17;
                      }
                      if (*(_DWORD *)(v288 + 84))
                      {
                        if ((v279 & 0x80000000) == 0)
                        {
                          uint64_t v204 = *(unsigned int **)(v288 + 40);
                          uint64_t v205 = *v204;
                          if ((v205 & 0x80000000) == 0)
                          {
                            int v206 = v204 + 2;
                            do
                            {
                              uint64_t v207 = (int)*(v206 - 1);
                              if (a5[4 * v207]
                                && *(_DWORD *)&v56[16 * v207]
                                && a5[4 * v207 + 2] == *(_DWORD *)&v56[16 * v207 + 8])
                              {
                                int v208 = *(_DWORD *)&v56[16 * v205];
                                if (a5[4 * v205])
                                {
                                  if (!v208) {
                                    goto LABEL_559;
                                  }
LABEL_513:
                                  if (*(_DWORD *)&v56[16 * v205 + 8] > a5[4 * v205 + 2]) {
                                    goto LABEL_559;
                                  }
                                  goto LABEL_516;
                                }
                                if (!v208) {
                                  goto LABEL_513;
                                }
                              }
LABEL_516:
                              unsigned int v209 = *v206;
                              v206 += 2;
                              uint64_t v205 = v209;
                            }
                            while ((v209 & 0x80000000) == 0);
                          }
                        }
                      }
                      v210 = &v280[4 * *(int *)(v113 + 16)];
                      if (*v210 < v51)
                      {
                        uint64_t v211 = v57;
                        uint64_t v212 = *v119;
                        int v213 = (char *)*((void *)v278 + 1);
                        *(void *)int v278 = *v119;
                        *((void *)v278 + 1) = v56;
                        int *v210 = v51;
                        *((void *)v210 + 1) = v278 + 8;
                        if (v212 == *(void *)(v288 + 16))
                        {
                          if (v279 == -1
                            || (int)v17 >= 1
                            && (*(int *)v56 < 1 ? (int v214 = -1) : (int v214 = *((_DWORD *)v56 + 2)),
                                *a5 < 1 ? (int v227 = -1) : (int v227 = a5[2]),
                                v214 <= v227))
                          {
                            j__mkdtempat_np((int)a5, v56);
                            unsigned int v279 = v51;
                          }
                        }
                        v278 += 16;
                        goto LABEL_557;
                      }
                      if ((int)v17 < 1)
                      {
LABEL_559:
                        uint64_t v228 = *(void *)(v113 + 64);
                        unsigned __int32 v119 = (uint64_t *)(v113 + 64);
                        v113 += 56;
                        if (!v228) {
                          goto LABEL_563;
                        }
                        continue;
                      }
                      uint64_t v211 = v57;
                      unint64_t v215 = 0;
                      v216 = *(int **)(v288 + 32);
                      uint64_t v217 = (void **)*((void *)v210 + 1);
                      int v213 = (char *)*v217;
                      while (1)
                      {
                        int v219 = *v216++;
                        int v218 = v219;
                        if (v219 == 2)
                        {
                          int v222 = *(_DWORD *)&v56[v215];
                          int v223 = *(_DWORD *)&v213[v215];
                          if (!v222) {
                            goto LABEL_541;
                          }
                          if (!v223) {
                            goto LABEL_548;
                          }
                          int v224 = *(_DWORD *)&v213[v215 + 4];
                          int v225 = &v56[v215];
                        }
                        else
                        {
                          if (v218 != 1)
                          {
                            if (v218) {
                              goto LABEL_545;
                            }
                            int v220 = *(_DWORD *)&v213[v215 + 8];
                            uint64_t v221 = &v56[v215];
                            goto LABEL_539;
                          }
                          int v222 = *(_DWORD *)&v56[v215];
                          int v223 = *(_DWORD *)&v213[v215];
                          if (!v222)
                          {
LABEL_541:
                            if (v223) {
                              int v226 = -1;
                            }
                            else {
                              int v226 = 0;
                            }
                            if (v226)
                            {
LABEL_547:
                              if (v226 < 1) {
                                goto LABEL_558;
                              }
LABEL_548:
                              *uint64_t v217 = v56;
                              if (*v119 == *(void *)(v288 + 16))
                              {
                                j__mkdtempat_np((int)a5, v56);
                                unsigned int v279 = v51;
                              }
LABEL_557:
                              size_t v56 = v213;
LABEL_558:
                              uint64_t v57 = v211;
                              int v118 = v282;
                              goto LABEL_559;
                            }
                            goto LABEL_545;
                          }
                          if (!v223) {
                            goto LABEL_548;
                          }
                          int v224 = *(_DWORD *)&v56[v215 + 4];
                          int v225 = &v213[v215];
                        }
                        int v226 = v224 - *((_DWORD *)v225 + 1);
                        if (v226) {
                          goto LABEL_547;
                        }
                        int v226 = v223 - v222;
                        if (v223 != v222) {
                          goto LABEL_547;
                        }
                        if (v222 != 1)
                        {
                          int v220 = *(_DWORD *)&v56[v215 + 8];
                          uint64_t v221 = &v213[v215];
LABEL_539:
                          int v226 = v220 - *((_DWORD *)v221 + 2);
                          if (v226) {
                            goto LABEL_547;
                          }
                        }
LABEL_545:
                        v215 += 16;
                        if (v199 == v215) {
                          goto LABEL_558;
                        }
                      }
                    }
                    int v259 = v170;
                    uint64_t v184 = v171;
                    int v185 = __collate_equiv_value(*(void *)(v288 + 56), (const __int32 *)&v291, 1uLL);
                    char v148 = v258;
                    int v170 = v259;
                    uint64_t v171 = v184;
                    int v172 = v185;
                    int v168 = v257;
                  }
                  int v169 = 1;
                  if (v174[1] == v172) {
                    goto LABEL_488;
                  }
LABEL_484:
                  ++v173;
                  v174 += 2;
                  if (v173 >= v168)
                  {
LABEL_485:
                    int v169 = 0;
                    int v196 = 1;
                    goto LABEL_489;
                  }
                  goto LABEL_419;
                default:
                  goto LABEL_484;
              }
            }
            LODWORD(v290) = v44;
            __darwin_ct_rune_t v159 = ___toupper_l(v44, v155);
            uint64_t v57 = v154;
            int v118 = v282;
            goto LABEL_394;
          }
          if (!v51) {
            goto LABEL_559;
          }
          unsigned int v149 = v289;
          if (!v289) {
            goto LABEL_559;
          }
          if (v44 == 95)
          {
            if (v289 == 95) {
              goto LABEL_358;
            }
            uint64_t v150 = v57;
            BOOL v151 = 1;
          }
          else
          {
            if (v44 > 0x7F)
            {
              int v157 = *(_xlocale **)(v288 + 56);
              uint64_t v150 = v57;
              if (v44 < 0x100)
              {
                v161 = &__global_locale;
                if (v157 != (_xlocale *)-1) {
                  v161 = *(void **)(v288 + 56);
                }
                if (!v157) {
                  v161 = &__c_locale;
                }
                int v153 = *(_DWORD *)(*(void *)(v161[166] + 120) + 4 * v44 + 60);
              }
              else
              {
                LOWORD(v153) = ___runetype_l(v44, v157);
                unsigned int v149 = v289;
              }
            }
            else
            {
              uint64_t v150 = v57;
              int v153 = *v275;
            }
            int v162 = v153 & 0x500;
            BOOL v151 = v162 != 0;
            if (v149 == 95)
            {
              uint64_t v57 = v150;
              int v118 = v282;
              if (!v162) {
                goto LABEL_559;
              }
              goto LABEL_358;
            }
          }
          if (v149 > 0x7F)
          {
            unsigned int v164 = *(_xlocale **)(v288 + 56);
            if (v149 >= 0x100)
            {
              LOWORD(v165) = ___runetype_l(v149, v164);
              goto LABEL_413;
            }
            uint64_t v166 = &__global_locale;
            if (v164 != (_xlocale *)-1) {
              uint64_t v166 = *(void **)(v288 + 56);
            }
            if (!v164) {
              uint64_t v166 = &__c_locale;
            }
            __int16 v163 = *(_RuneLocale **)(v166[166] + 120);
          }
          else
          {
            __int16 v163 = &_DefaultRuneLocale;
          }
          __uint32_t v165 = v163->__runetype[v149];
LABEL_413:
          char v167 = v151 ^ ((v165 & 0x500) != 0);
          uint64_t v57 = v150;
          int v118 = v282;
          if (v167) {
            goto LABEL_559;
          }
          goto LABEL_358;
        }
        break;
      }
      if (v44 != 95)
      {
        if (v44 > 0x7F)
        {
          int v131 = *(_xlocale **)(v288 + 56);
          if (v44 < 0x100)
          {
            uint64_t v135 = &__global_locale;
            if (v131 != (_xlocale *)-1) {
              uint64_t v135 = *(void **)(v288 + 56);
            }
            if (!v131) {
              uint64_t v135 = &__c_locale;
            }
            int v128 = *(_DWORD *)(*(void *)(v135[166] + 120) + 4 * v44 + 60);
          }
          else
          {
            LOWORD(v128) = ___runetype_l(v44, v131);
          }
        }
        else
        {
          int v128 = *v275;
        }
        if ((v128 & 0x500) == 0) {
          goto LABEL_559;
        }
      }
      if (v289 == 95) {
        goto LABEL_559;
      }
      if (v289 > 0x7F)
      {
        __darwin_ct_rune_t v137 = *(_xlocale **)(v288 + 56);
        if (v289 >= 0x100)
        {
          LOWORD(v138) = ___runetype_l(v289, v137);
          goto LABEL_333;
        }
        uint64_t v139 = &__global_locale;
        if (v137 != (_xlocale *)-1) {
          uint64_t v139 = *(void **)(v288 + 56);
        }
        if (!v137) {
          uint64_t v139 = &__c_locale;
        }
        __darwin_ct_rune_t v136 = *(_RuneLocale **)(v139[166] + 120);
      }
      else
      {
        __darwin_ct_rune_t v136 = &_DefaultRuneLocale;
      }
      __uint32_t v138 = v136->__runetype[v289];
LABEL_333:
      if ((v138 & 0x500) != 0) {
        goto LABEL_559;
      }
      if ((*(_DWORD *)(v113 + 40) & 0x20) == 0) {
        goto LABEL_357;
      }
LABEL_283:
      if (!v51) {
        goto LABEL_357;
      }
      unsigned int v123 = v289;
      if (!v289) {
        goto LABEL_357;
      }
      if (v44 == 95)
      {
        if (v289 == 95) {
          goto LABEL_559;
        }
        uint64_t v124 = v57;
        BOOL v125 = 1;
      }
      else
      {
        if (v44 > 0x7F)
        {
          size_t v134 = *(_xlocale **)(v288 + 56);
          uint64_t v124 = v57;
          if (v44 < 0x100)
          {
            int v142 = &__global_locale;
            if (v134 != (_xlocale *)-1) {
              int v142 = *(void **)(v288 + 56);
            }
            if (!v134) {
              int v142 = &__c_locale;
            }
            int v130 = *(_DWORD *)(*(void *)(v142[166] + 120) + 4 * v44 + 60);
          }
          else
          {
            LOWORD(v130) = ___runetype_l(v44, v134);
            unsigned int v123 = v289;
          }
        }
        else
        {
          uint64_t v124 = v57;
          int v130 = *v275;
        }
        int v143 = v130 & 0x500;
        BOOL v125 = v143 != 0;
        if (v123 == 95)
        {
          uint64_t v57 = v124;
          int v118 = v282;
          if (v143) {
            goto LABEL_559;
          }
          goto LABEL_357;
        }
      }
      if (v123 > 0x7F)
      {
        uint64_t v145 = *(_xlocale **)(v288 + 56);
        if (v123 >= 0x100)
        {
          LOWORD(v146) = ___runetype_l(v123, v145);
          goto LABEL_356;
        }
        int v147 = &__global_locale;
        if (v145 != (_xlocale *)-1) {
          int v147 = *(void **)(v288 + 56);
        }
        if (!v145) {
          int v147 = &__c_locale;
        }
        uint64_t v144 = *(_RuneLocale **)(v147[166] + 120);
      }
      else
      {
        uint64_t v144 = &_DefaultRuneLocale;
      }
      __uint32_t v146 = v144->__runetype[v123];
LABEL_356:
      BOOL v182 = v125 == ((v146 & 0x500) != 0);
      uint64_t v57 = v124;
      int v118 = v282;
      if (v182) {
        goto LABEL_559;
      }
      goto LABEL_357;
    }
    break;
  }
  v51 += v239;
  if ((v37 & 0x80000000) == 0 && v37 <= v51)
  {
    __int32 v289 = 0;
    goto LABEL_258;
  }
  int v112 = *v243;
  if ((v112 & 0x80000000) == 0)
  {
    ++v243;
    __int32 v289 = v112;
    goto LABEL_258;
  }
  int v230 = v37 - v51;
  if (v37 < 0) {
    int v230 = 32;
  }
  size_t v239 = mbrtowc_l(&v289, v243, v230, &v292, *(locale_t *)(v288 + 56));
  if (v239 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v37 < 0 || v239)
    {
      v243 += v239;
      goto LABEL_261;
    }
    __int32 v289 = 0;
    ++v243;
LABEL_258:
    LODWORD(v239) = 1;
    goto LABEL_261;
  }
  return 17;
}

_OWORD *tre_mem_new_impl(int a1, _OWORD *a2)
{
  if (!a1) {
    return malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040729534FEuLL);
  }
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return a2;
}

void tre_mem_destroy(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    do
    {
      free(*(void **)v2);
      uint64_t v3 = *(void *)(v2 + 8);
      free((void *)v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }

  free(a1);
}

char *tre_mem_alloc_impl(uint64_t a1, int a2, char *a3, int a4, size_t a5)
{
  if (*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  size_t v9 = *(void *)(a1 + 24);
  if (v9 >= a5)
  {
    uint64_t v5 = *(char **)(a1 + 16);
    goto LABEL_8;
  }
  if (!a2)
  {
    if (8 * a5 <= 0x400) {
      size_t v9 = 1024;
    }
    else {
      size_t v9 = 8 * a5;
    }
    int v11 = malloc_type_malloc(0x10uLL, 0xA0040BD48D6D6uLL);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v5 = (char *)malloc_type_malloc(v9, 0x12C1A002uLL);
      *uint64_t v12 = v5;
      if (v5)
      {
        v12[1] = 0;
        uint64_t v13 = *(void *)(a1 + 8);
        if (v13) {
          *(void *)(v13 + 8) = v12;
        }
        if (!*(void *)a1) {
          *(void *)a1 = v12;
        }
        *(void *)(a1 + 8) = v12;
        goto LABEL_8;
      }
      free(v12);
    }
    else
    {
      uint64_t v5 = 0;
    }
LABEL_25:
    *(_DWORD *)(a1 + 32) = 1;
    return v5;
  }
  uint64_t v5 = a3;
  if (!a3) {
    goto LABEL_25;
  }
  size_t v9 = 1024;
LABEL_8:
  if ((((_BYTE)v5 + (_BYTE)a5) & 7) != 0) {
    uint64_t v10 = 8 - (((_BYTE)v5 + (_BYTE)a5) & 7);
  }
  else {
    uint64_t v10 = 0;
  }
  *(void *)(a1 + 16) = &v5[v10 + a5];
  *(void *)(a1 + 24) = v9 - (v10 + a5);
  if (a4) {
    MEMORY[0x18C122530](v5);
  }
  return v5;
}

uint64_t tre_parse(uint64_t a1)
{
  uint64_t v204 = 0;
  uint64_t v2 = *(int **)(a1 + 8);
  int v3 = tre_stack_num_objects((uint64_t)v2);
  if (*(int *)(a1 + 56) < 1) {
    return 14;
  }
  int v4 = v3;
  if (!*(_DWORD *)(a1 + 88))
  {
    tre_stack_push_int(v2, *(_DWORD *)(a1 + 84));
    tre_stack_push_int(v2, *(_DWORD *)(a1 + 60));
    tre_stack_push_int(v2, 2u);
    ++*(_DWORD *)(a1 + 60);
  }
  tre_stack_push_int(v2, 0);
  uint64_t v5 = tre_stack_push_int(v2, 0);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = v6 + 4 * *(int *)(a1 + 56);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  if ((int)tre_stack_num_objects((uint64_t)v2) <= v4 || v5 != 0)
  {
    if (v5) {
      return v5;
    }
    goto LABEL_9;
  }
  int v9 = 0;
  int v10 = 0;
  int v11 = &__c_locale;
LABEL_11:
  switch(tre_stack_pop_int((uint64_t)v2))
  {
    case 0u:
      unsigned int v12 = tre_stack_pop_int((uint64_t)v2);
      int v13 = *(_DWORD *)(a1 + 84);
      if ((v13 & 0x10) == 0 && (v13 & 0x101) != 0)
      {
        uint64_t v14 = tre_stack_push_int(v2, 7u);
        if (v14) {
          goto LABEL_294;
        }
      }
      uint64_t v14 = tre_stack_push_int(v2, v12);
      if (v14) {
        goto LABEL_294;
      }
      uint64_t v15 = v2;
      unsigned int v16 = 3;
      goto LABEL_46;
    case 1u:
      int v17 = tre_stack_pop_int((uint64_t)v2);
      uint64_t v18 = *(int **)(a1 + 24);
      unint64_t v19 = *(void *)(a1 + 40);
      if ((unint64_t)v18 >= v19) {
        goto LABEL_305;
      }
      unsigned int v20 = *(_DWORD *)(a1 + 84);
      if ((v20 & 0x10) != 0) {
        goto LABEL_305;
      }
      int v21 = *v18;
      if (*v18 <= 45)
      {
        if (v21 == 36)
        {
          if ((v20 & 1) == 0)
          {
            if ((unint64_t)(v18 + 2) < v19 && v18[1] == 92)
            {
              if (v18[2] != 41 && v18 + 1 != (int *)v19) {
                goto LABEL_305;
              }
            }
            else if (v18 + 1 != (int *)v19)
            {
              goto LABEL_305;
            }
          }
          uint64_t v59 = *(void *)a1;
          int v60 = 2;
          goto LABEL_375;
        }
        if (v21 != 40)
        {
          if (v21 != 41 || (v20 & 1) == 0 || v10 <= 0) {
            goto LABEL_305;
          }
LABEL_100:
          uint64_t v204 = tre_ast_new_literal(*(void *)a1, -1, -1, -1);
          if (!v204) {
            return 12;
          }
          if (*(unsigned char *)(a1 + 84)) {
            goto LABEL_380;
          }
          goto LABEL_142;
        }
        if ((~v20 & 0x101) == 0 && v18[1] == 63)
        {
          int v66 = v11;
          unsigned int v67 = v18 + 2;
          BOOL v68 = v18 + 3;
          int v69 = 1;
          unsigned int v70 = *(_DWORD *)(a1 + 84);
          while (1)
          {
            int v71 = *v67;
            if (*v67 > 84)
            {
              switch(v71)
              {
                case 'U':
                  unsigned int v70 = v70 & 0xFFFFFFBF | ((v69 != 0) << 6);
                  break;
                case 'i':
                  unsigned int v70 = v70 & 0xFFFFFFFD | (2 * (v69 != 0));
                  break;
                case 'n':
                  unsigned int v70 = v70 & 0xFFFFFFF7 | (8 * (v69 != 0));
                  break;
                default:
                  goto LABEL_510;
              }
            }
            else
            {
              if (v71 <= 44)
              {
                if (v71 == 35)
                {
                  *(void *)(a1 + 24) = v67;
                  do
                  {
                    if ((unint64_t)(v68 - 1) >= v19) {
                      return 2;
                    }
                    *(void *)(a1 + 24) = v68;
                    int v158 = *v68++;
                  }
                  while (v158 != 41);
                  unsigned int v67 = v68 - 1;
                  if ((unint64_t)(v68 - 1) >= v19) {
                    return 2;
                  }
                }
                else
                {
                  if (v71 != 41) {
                    goto LABEL_510;
                  }
                  *(void *)(a1 + 24) = v67;
                }
                *(void *)(a1 + 24) = v67 + 1;
                uint64_t v153 = tre_stack_push_int(v2, 0);
                if (v153) {
                  goto LABEL_422;
                }
                uint64_t v154 = v2;
                unsigned int v155 = 1;
LABEL_421:
                uint64_t v153 = tre_stack_push_int(v154, v155);
                if (v153)
                {
LABEL_422:
                  uint64_t v5 = v153;
                }
                else
                {
                  uint64_t v5 = 0;
                  *(_DWORD *)(a1 + 84) = v70;
                }
                int v11 = v66;
LABEL_381:
                if ((int)tre_stack_num_objects((uint64_t)v2) <= v4 || v5)
                {
                  if (v5) {
                    return v5;
                  }
                  if (v10 > 0) {
                    return 8;
                  }
LABEL_9:
                  uint64_t v5 = 0;
                  *(void *)(a1 + 16) = v204;
                  return v5;
                }
                goto LABEL_11;
              }
              if (v71 != 45)
              {
                if (v71 == 58)
                {
                  *(void *)(a1 + 24) = v67 + 1;
                  ++v10;
                  uint64_t v153 = tre_stack_push_int(v2, v20);
                  if (!v153)
                  {
                    uint64_t v153 = tre_stack_push_int(v2, *(_DWORD *)(a1 + 64));
                    if (!v153)
                    {
                      uint64_t v153 = tre_stack_push_int(v2, 2u);
                      if (!v153)
                      {
                        ++*(_DWORD *)(a1 + 64);
                        uint64_t v153 = tre_stack_push_int(v2, 0);
                        if (!v153)
                        {
                          uint64_t v154 = v2;
                          unsigned int v155 = 0;
                          goto LABEL_421;
                        }
                      }
                    }
                  }
                  goto LABEL_422;
                }
LABEL_510:
                *(void *)(a1 + 24) = v67;
                return 13;
              }
              int v69 = 0;
            }
            ++v67;
            ++v68;
          }
        }
        if ((v20 & 1) == 0) {
          goto LABEL_305;
        }
        __uint32_t v72 = *(int **)(a1 + 24);
        goto LABEL_290;
      }
      if (v21 > 91)
      {
        if (v21 != 92)
        {
          if (v21 == 94 && (*(_DWORD *)(a1 + 84) & 1 | v17 || v18 == *(int **)(a1 + 32)))
          {
            uint64_t v59 = *(void *)a1;
            int v60 = 1;
LABEL_375:
            uint64_t v204 = tre_ast_new_literal(v59, -2, v60, -1);
            if (!v204) {
              return 12;
            }
            uint64_t v5 = 0;
            goto LABEL_368;
          }
LABEL_305:
          if (v9 && (unint64_t)(v18 + 1) < v19 && *v18 == 92 && v18[1] == 69)
          {
            *(_DWORD *)(a1 + 84) &= ~v9;
            *(void *)(a1 + 24) = v18 + 2;
            if ((unint64_t)(v18 + 2) >= v19)
            {
              uint64_t v204 = tre_ast_new_literal(*(void *)a1, -1, -1, -1);
              if (!v204) {
                return 12;
              }
              uint64_t v5 = 0;
            }
            else
            {
              uint64_t v120 = tre_stack_push_int(v2, 0);
              if (!v120) {
                uint64_t v120 = tre_stack_push_int(v2, 1u);
              }
              uint64_t v5 = v120;
            }
            int v9 = 0;
            goto LABEL_381;
          }
          int v121 = *(_DWORD *)(a1 + 84);
          if ((v121 & 0x10) != 0)
          {
LABEL_329:
            if ((v121 & 2) == 0) {
              goto LABEL_330;
            }
            uint64_t v125 = *v18;
            if (v125 > 0x7F)
            {
              int v127 = *(_xlocale **)(a1 + 48);
              if (v125 >= 0x100)
              {
                __int16 v128 = ___runetype_l(v125, v127);
                uint64_t v18 = *(int **)(a1 + 24);
                if (v128 < 0) {
                  goto LABEL_353;
                }
LABEL_343:
                uint64_t v130 = *v18;
                int v131 = &_DefaultRuneLocale;
                if (v130 > 0x7F)
                {
                  int v132 = *(_xlocale **)(a1 + 48);
                  if (v130 >= 0x100)
                  {
                    __int16 v133 = ___runetype_l(v130, v132);
                    uint64_t v18 = *(int **)(a1 + 24);
                    if ((v133 & 0x1000) != 0)
                    {
LABEL_353:
                      uint64_t v135 = *(void *)a1;
                      uint64_t v136 = *v18;
                      if (v136 > 0x7F)
                      {
                        __darwin_ct_rune_t v137 = ___toupper_l(v136, *(locale_t *)(a1 + 48));
                        LODWORD(v136) = **(_DWORD **)(a1 + 24);
                        if (v136 > 0x7F)
                        {
                          __darwin_ct_rune_t v138 = ___toupper_l(v136, *(locale_t *)(a1 + 48));
LABEL_358:
                          uint64_t v139 = tre_ast_new_literal(v135, v137, v138, *(_DWORD *)(a1 + 68));
                          if (!v139) {
                            return 12;
                          }
                          uint64_t v140 = (uint64_t)v139;
                          __uint32_t v141 = v11;
                          uint64_t v142 = *(void *)a1;
                          uint64_t v143 = **(unsigned int **)(a1 + 24);
                          if (v143 > 0x7F)
                          {
                            __darwin_ct_rune_t v144 = ___tolower_l(v143, *(locale_t *)(a1 + 48));
                            LODWORD(v143) = **(_DWORD **)(a1 + 24);
                            if (v143 > 0x7F)
                            {
                              __darwin_ct_rune_t v145 = ___tolower_l(v143, *(locale_t *)(a1 + 48));
                              goto LABEL_364;
                            }
                          }
                          else
                          {
                            __darwin_ct_rune_t v144 = _DefaultRuneLocale.__maplower[v143];
                          }
                          __darwin_ct_rune_t v145 = _DefaultRuneLocale.__maplower[v143];
LABEL_364:
                          __uint32_t v146 = tre_ast_new_literal(v142, v144, v145, *(_DWORD *)(a1 + 68));
                          if (!v146) {
                            return 12;
                          }
                          uint64_t v204 = tre_ast_new_union(*(void *)a1, v140, (uint64_t)v146);
                          int v11 = v141;
                          if (!v204) {
                            return 12;
                          }
LABEL_366:
                          uint64_t v5 = 0;
                          int v115 = *(_DWORD *)(a1 + 68) + 1;
LABEL_367:
                          *(_DWORD *)(a1 + 68) = v115;
LABEL_368:
                          unsigned int v44 = *(int **)(a1 + 24);
LABEL_369:
                          int v41 = v44 + 1;
                          goto LABEL_370;
                        }
                      }
                      else
                      {
                        __darwin_ct_rune_t v137 = _DefaultRuneLocale.__mapupper[v136];
                      }
                      __darwin_ct_rune_t v138 = _DefaultRuneLocale.__mapupper[v136];
                      goto LABEL_358;
                    }
LABEL_330:
                    uint64_t v204 = tre_ast_new_literal(*(void *)a1, *v18, *v18, *(_DWORD *)(a1 + 68));
                    if (!v204) {
                      return 12;
                    }
                    goto LABEL_366;
                  }
                  size_t v134 = &__global_locale;
                  if (v132 != (_xlocale *)-1) {
                    size_t v134 = *(void **)(a1 + 48);
                  }
                  if (!v132) {
                    size_t v134 = v11;
                  }
                  int v131 = *(_RuneLocale **)(v134[166] + 120);
                }
                if ((v131->__runetype[v130] & 0x1000) != 0) {
                  goto LABEL_353;
                }
                goto LABEL_330;
              }
              int v129 = &__global_locale;
              if (v127 != (_xlocale *)-1) {
                int v129 = *(void **)(a1 + 48);
              }
              if (!v127) {
                int v129 = v11;
              }
              int v126 = *(_RuneLocale **)(v129[166] + 120);
            }
            else
            {
              int v126 = &_DefaultRuneLocale;
            }
            if ((v126->__runetype[v125] & 0x8000) != 0) {
              goto LABEL_353;
            }
            goto LABEL_343;
          }
          if ((unint64_t)v18 >= v19)
          {
            if (v10 <= 0) {
              return 14;
            }
            else {
              return 8;
            }
          }
          if ((v121 & 1) == 0)
          {
            if ((unint64_t)(v18 + 1) >= v19 || *v18 != 92 || v18[1] != 123) {
              goto LABEL_329;
            }
            uint64_t v122 = 2;
            goto LABEL_323;
          }
          int v123 = *v18;
          if (*v18 <= 122)
          {
            if ((v123 - 42) < 2 || v123 == 63) {
              return 13;
            }
            goto LABEL_329;
          }
          if (v123 == 123)
          {
            uint64_t v122 = 1;
LABEL_323:
            *(void *)(a1 + 24) = &v18[v122];
            uint64_t v124 = tre_parse_bound(a1, 0);
            if (v124 != 1)
            {
              uint64_t v5 = v124;
              if (v124) {
                return v5;
              }
              return 13;
            }
            uint64_t v18 = (int *)(*(void *)(a1 + 24) - 4);
            *(void *)(a1 + 24) = v18;
            int v121 = *(_DWORD *)(a1 + 84);
            goto LABEL_329;
          }
          if (v123 != 124) {
            goto LABEL_329;
          }
          return 14;
        }
        if ((v20 & 1) != 0 || (__uint32_t v72 = v18 + 1, (unint64_t)(v18 + 1) >= v19))
        {
LABEL_183:
          int v202 = v11;
          uint64_t v74 = v18 + 1;
          if ((unint64_t)(v18 + 1) >= v19) {
            return 5;
          }
          if ((v20 & 0x100) == 0)
          {
            *(void *)(a1 + 24) = v74;
LABEL_186:
            if ((v20 & 0x101) == 1
              || (v75 = iswdigit_l(*v74, *(locale_t *)(a1 + 48)), uint64_t v74 = *(int **)(a1 + 24), !v75)
              || (int v76 = *v74 - 48, *v74 == 48))
            {
              uint64_t v24 = tre_ast_new_literal(*(void *)a1, *v74, *v74, *(_DWORD *)(a1 + 68));
              uint64_t v204 = v24;
              ++*(_DWORD *)(a1 + 68);
            }
            else
            {
              uint64_t v24 = tre_ast_new_literal(*(void *)a1, -4, *v74 - 48, *(_DWORD *)(a1 + 68));
              uint64_t v204 = v24;
              if (!v24) {
                return 12;
              }
              int32x2_t v159 = *(int32x2_t *)(a1 + 64);
              *((_DWORD *)v24 + 13) = v159.i32[0];
              *(int32x2_t *)(a1 + 64) = vadd_s32(v159, (int32x2_t)0x100000001);
              int v160 = *(_DWORD *)(a1 + 72);
              int v161 = *(_DWORD *)(a1 + 76) + 1;
              if (v76 > v160) {
                int v160 = v76;
              }
              *(_DWORD *)(a1 + 72) = v160;
              *(_DWORD *)(a1 + 76) = v161;
            }
            int v11 = v202;
            uint64_t v25 = *(void *)(a1 + 24) + 4;
LABEL_191:
            *(void *)(a1 + 24) = v25;
            goto LABEL_192;
          }
          tre_expand_macro(v18 + 1, v19, __str);
          if (*(_DWORD *)__str)
          {
            long long v116 = *(_OWORD *)(a1 + 80);
            *((_OWORD *)&v210._mbstateL + 4) = *(_OWORD *)(a1 + 64);
            *((_OWORD *)&v210._mbstateL + 5) = v116;
            long long v117 = *(_OWORD *)(a1 + 112);
            *((_OWORD *)&v210._mbstateL + 6) = *(_OWORD *)(a1 + 96);
            *((_OWORD *)&v210._mbstateL + 7) = v117;
            long long v118 = *(_OWORD *)(a1 + 16);
            *(_OWORD *)v210.__mbstate8 = *(_OWORD *)a1;
            *((_OWORD *)&v210._mbstateL + 1) = v118;
            long long v119 = *(_OWORD *)(a1 + 48);
            *((_OWORD *)&v210._mbstateL + 2) = *(_OWORD *)(a1 + 32);
            *((_OWORD *)&v210._mbstateL + 3) = v119;
            *(&v210._mbstateL + 3) = (uint64_t)__str;
            *((_DWORD *)&v210._mbstateL + 14) = wcslen((const __int32 *)__str);
            *((_DWORD *)&v210._mbstateL + 22) = 1;
            uint64_t v5 = tre_parse(&v210);
            if (v5) {
              return v5;
            }
            *(void *)(a1 + 24) += 8;
            *(_DWORD *)(a1 + 68) = *((_DWORD *)&v210._mbstateL + 17);
            uint64_t v204 = (char *)*(&v210._mbstateL + 2);
            goto LABEL_400;
          }
          int v151 = *v74;
          if (*v74 == 81)
          {
            *(_DWORD *)(a1 + 84) = v20 | 0x10;
            v9 |= 0x10u;
            *(void *)(a1 + 24) = v18 + 2;
            uint64_t v152 = tre_stack_push_int(v2, 0);
            if (!v152) {
              uint64_t v152 = tre_stack_push_int(v2, 1u);
            }
            uint64_t v5 = v152;
LABEL_400:
            int v11 = v202;
            goto LABEL_381;
          }
          *(void *)(a1 + 24) = v74;
          if (v151 <= 65)
          {
            if (v151 == 60)
            {
              uint64_t v156 = *(void *)a1;
              int v157 = 8;
            }
            else
            {
              if (v151 != 62) {
                goto LABEL_186;
              }
              uint64_t v156 = *(void *)a1;
              int v157 = 16;
            }
          }
          else
          {
            switch(v151)
            {
              case 'B':
                uint64_t v156 = *(void *)a1;
                int v157 = 64;
                break;
              case 'x':
                uint64_t v74 = v18 + 2;
                wint_t v183 = v18[2];
                *(void *)(a1 + 24) = v18 + 2;
                if (v183 == 123 || (unint64_t)v74 >= v19)
                {
                  if ((unint64_t)v74 >= v19) {
                    goto LABEL_186;
                  }
                  int v192 = v18 + 3;
                  *(void *)(a1 + 24) = v18 + 3;
                  if ((uint64_t)(v19 - (void)(v18 + 3)) < 0)
                  {
                    LODWORD(v193) = 0;
                  }
                  else
                  {
                    uint64_t v193 = 0;
                    do
                    {
                      if (v193 == 32) {
                        return 9;
                      }
                      if (*v192 == 125) {
                        break;
                      }
                      if (!iswxdigit_l(*v192, *(locale_t *)(a1 + 48))) {
                        return 9;
                      }
                      uint64_t v74 = *(int **)(a1 + 24);
                      int v192 = v74 + 1;
                      __str[v193++] = *v74;
                      *(void *)(a1 + 24) = v74 + 1;
                    }
                    while ((uint64_t)(*(void *)(a1 + 40) - (void)(v74 + 1)) >= 0);
                  }
                  *(void *)(a1 + 24) = v74 + 2;
                  __str[v193] = 0;
                  int v194 = strtol(__str, 0, 16);
                  uint64_t v24 = tre_ast_new_literal(*(void *)a1, v194, v194, *(_DWORD *)(a1 + 68));
                  uint64_t v204 = v24;
                  ++*(_DWORD *)(a1 + 68);
                  int v11 = v202;
LABEL_192:
                  if (!v24) {
                    return 12;
                  }
LABEL_380:
                  uint64_t v5 = 0;
                  goto LABEL_381;
                }
                __str[2] = 0;
                *(_WORD *)__str = 0;
                int v184 = iswxdigit_l(v183, *(locale_t *)(a1 + 48));
                int v185 = *(wint_t **)(a1 + 24);
                if (v184 && (unint64_t)v185 < *(void *)(a1 + 40))
                {
                  wint_t v186 = *v185++;
                  __str[0] = v186;
                  *(void *)(a1 + 24) = v185;
                }
                if (iswxdigit_l(*v185, *(locale_t *)(a1 + 48)))
                {
                  int v187 = *(_DWORD **)(a1 + 24);
                  if ((unint64_t)v187 < *(void *)(a1 + 40))
                  {
                    __str[1] = *v187;
                    *(void *)(a1 + 24) = v187 + 1;
                  }
                }
                int v188 = strtol(__str, 0, 16);
                uint64_t v24 = tre_ast_new_literal(*(void *)a1, v188, v188, *(_DWORD *)(a1 + 68));
                uint64_t v204 = v24;
                ++*(_DWORD *)(a1 + 68);
LABEL_472:
                int v11 = v202;
                goto LABEL_192;
              case 'b':
                uint64_t v156 = *(void *)a1;
                int v157 = 32;
                break;
              default:
                goto LABEL_186;
            }
          }
          uint64_t v24 = tre_ast_new_literal(v156, -2, v157, -1);
          uint64_t v204 = v24;
          *(void *)(a1 + 24) += 4;
          goto LABEL_472;
        }
        int v73 = *v72;
        if (*v72 != 40)
        {
          if (v73 != 41)
          {
            if (v73 == 123) {
              goto LABEL_305;
            }
            goto LABEL_183;
          }
          *(void *)(a1 + 24) = v72;
          if (!v10) {
            return 8;
          }
          goto LABEL_100;
        }
LABEL_290:
        *(void *)(a1 + 24) = v72 + 1;
        uint64_t v14 = tre_stack_push_int(v2, v20);
        if (!v14)
        {
          uint64_t v14 = tre_stack_push_int(v2, *(_DWORD *)(a1 + 60));
          if (!v14)
          {
            uint64_t v14 = tre_stack_push_int(v2, 2u);
            if (!v14)
            {
              uint64_t v14 = tre_stack_push_int(v2, (*(_DWORD *)(a1 + 84) & 1) == 0);
              if (!v14)
              {
                uint64_t v5 = tre_stack_push_int(v2, 0);
                if (!v5)
                {
                  ++*(_DWORD *)(a1 + 60);
                  ++v10;
                }
                goto LABEL_381;
              }
            }
          }
        }
LABEL_294:
        uint64_t v5 = v14;
        goto LABEL_381;
      }
      if (v21 == 46)
      {
        uint64_t v63 = *(void *)a1;
        int v64 = *(_DWORD *)(a1 + 68);
        if ((v20 & 8) != 0)
        {
          int v112 = tre_ast_new_literal(v63, 0, 9, v64);
          if (!v112) {
            return 12;
          }
          uint64_t v113 = (uint64_t)v112;
          uint64_t v114 = tre_ast_new_literal(*(void *)a1, 11, 0x7FFFFFFF, *(_DWORD *)(a1 + 68) + 1);
          if (!v114) {
            return 12;
          }
          uint64_t v204 = tre_ast_new_union(*(void *)a1, v113, (uint64_t)v114);
          if (!v204) {
            return 12;
          }
          int v65 = 2;
        }
        else
        {
          uint64_t v204 = tre_ast_new_literal(v63, 0, 0x7FFFFFFF, v64);
          if (!v204) {
            return 12;
          }
          int v65 = 1;
        }
        uint64_t v5 = 0;
        int v115 = *(_DWORD *)(a1 + 68) + v65;
        goto LABEL_367;
      }
      if (v21 != 91) {
        goto LABEL_305;
      }
      *(void *)(a1 + 24) = v18 + 1;
      if ((uint64_t)(v19 - (void)(v18 + 1)) >= 21 && v18[1] == 91 && v18[2] == 58)
      {
        int v22 = v18[3];
        if ((v22 | 2) == 0x3E && v18[4] == 58 && v18[5] == 93 && v18[6] == 93)
        {
          if (v22 == 60) {
            int v23 = 8;
          }
          else {
            int v23 = 16;
          }
          uint64_t v24 = tre_ast_new_literal(*(void *)a1, -2, v23, -1);
          uint64_t v204 = v24;
          uint64_t v25 = *(void *)(a1 + 24) + 24;
          goto LABEL_191;
        }
      }
      __darwin_ct_rune_t v77 = malloc_type_calloc(1uLL, 0x108uLL, 0xFFF5826CuLL);
      uint64_t v205 = v77;
      if (!v77) {
        return 12;
      }
      long long v78 = *(__int32 **)(a1 + 24);
      if (*v78 == 94)
      {
        v77[1] |= 1u;
        *(void *)(a1 + 24) = ++v78;
      }
      unint64_t v79 = *(void *)(a1 + 40);
      int v209 = 32;
      unsigned int v203 = v11;
      if ((unint64_t)v78 >= v79)
      {
        uint64_t v5 = 7;
        goto LABEL_437;
      }
      int v201 = 0;
      int v80 = 0;
      *(_DWORD *)&v197[8] = 0;
      uint64_t v198 = 0;
      ptr = 0;
      __int32 v207 = 0;
      __int32 v208 = 0;
      *(void *)uint64_t v197 = v77[1];
      int v81 = -1;
      while (1)
      {
        __int32 v82 = *v78;
        if (*v78 == 93)
        {
          if (v78 != *(__int32 **)(a1 + 24))
          {
            if (v201)
            {
              unsigned int v164 = ptr;
              if (ptr)
              {
                *(void *)ptr = v78 + 1;
                *((_DWORD *)ptr + 2) = v80;
                *uint64_t v198 = 0;
                long long v217 = 0u;
                long long v218 = 0u;
                long long v215 = 0u;
                long long v216 = 0u;
                long long v213 = 0u;
                long long v214 = 0u;
                *(_OWORD *)__str = 0u;
                long long v212 = 0u;
                free(v205);
                __uint32_t v165 = malloc_type_malloc(*(void *)ptr - *(void *)(a1 + 24) + 8, 0x100004052888210uLL);
                if (!v165)
                {
                  free(ptr);
                  uint64_t v5 = 12;
                  goto LABEL_439;
                }
                uint64_t v166 = v165;
                char v167 = (char *)v165;
                if (*((int *)ptr + 2) >= 1)
                {
                  *__uint32_t v165 = 91;
                  int v168 = v165 + 1;
                  int v169 = *(char **)(a1 + 24);
                  uint64_t v170 = *((void *)ptr + 2);
                  if (v170)
                  {
                    uint64_t v171 = (uint64_t *)(ptr + 32);
                    do
                    {
                      if (v170 - (uint64_t)v169 >= 9)
                      {
                        uint64_t v172 = v170 - (void)v169 - 8;
                        j__mkdtempat_np((int)v168, v169);
                        int v168 = (_DWORD *)((char *)v168 + v172);
                        uint64_t v170 = *(v171 - 2);
                      }
                      int v169 = (char *)(v170 + 4 * *((int *)v171 - 2) + 8);
                      uint64_t v173 = *v171;
                      v171 += 2;
                      uint64_t v170 = v173;
                    }
                    while (v173);
                  }
                  uint64_t v174 = *(void *)ptr - (void)v169;
                  j__mkdtempat_np((int)v168, v169);
                  int v175 = (_DWORD *)((char *)v168 + v174);
                  unsigned int v164 = ptr;
                  _DWORD *v175 = 124;
                  char v167 = (char *)(v175 + 1);
                }
                v176 = (char *)*((void *)v164 + 2);
                if (v176)
                {
                  int v177 = (char **)(ptr + 32);
                  do
                  {
                    j__mkdtempat_np((int)v167, v176);
                    v167 += 4 * *((int *)v177 - 2);
                    if (*v177)
                    {
                      *(_DWORD *)char v167 = 124;
                      v167 += 4;
                    }
                    int v178 = *v177;
                    v177 += 2;
                    v176 = v178;
                  }
                  while (v178);
                }
                *(_DWORD *)char v167 = 0;
                long long v179 = *(_OWORD *)(a1 + 80);
                long long v215 = *(_OWORD *)(a1 + 64);
                long long v216 = v179;
                long long v180 = *(_OWORD *)(a1 + 112);
                long long v217 = *(_OWORD *)(a1 + 96);
                long long v218 = v180;
                long long v181 = *(_OWORD *)(a1 + 16);
                *(_OWORD *)__str = *(_OWORD *)a1;
                long long v212 = v181;
                long long v182 = *(_OWORD *)(a1 + 48);
                long long v213 = *(_OWORD *)(a1 + 32);
                long long v214 = v182;
                *((void *)&v212 + 1) = v166;
                DWORD2(v216) = 1;
                DWORD2(v214) = (unint64_t)(v167 - v166) >> 2;
                DWORD1(v216) |= 1u;
                uint64_t v5 = tre_parse(__str);
                free(v166);
                if (v5)
                {
                  free(ptr);
                }
                else
                {
                  *(void *)(a1 + 24) = *(void *)ptr;
                  *(_DWORD *)(a1 + 68) = DWORD1(v215);
                  free(ptr);
                  uint64_t v204 = (char *)v212;
                }
                int v11 = v203;
                goto LABEL_440;
              }
            }
            else
            {
              if (!v81)
              {
                uint64_t v5 = tre_new_item(1, v208, &v209, (int **)&v205);
                if (v5) {
                  goto LABEL_435;
                }
              }
              *(void *)(a1 + 24) = v78 + 1;
            }
            int v189 = tre_ast_new_literal(*(void *)a1, 0, 0x7FFFFFFF, *(_DWORD *)(a1 + 68));
            int v162 = v189;
            __int16 v163 = (char *)v205;
            if (v189
              && (uint64_t v190 = *(void *)v189,
                  uint64_t v191 = tre_mem_alloc_impl(*(void *)a1, 0, 0, 0, 8 * *(int *)v205 + 8),
                  (*(void *)(v190 + 16) = v191) != 0))
            {
              j__mkdtempat_np((int)v191, v163);
              uint64_t v5 = 0;
            }
            else
            {
              uint64_t v5 = 12;
            }
            goto LABEL_438;
          }
          int v81 = 0;
          __int32 v83 = 93;
          goto LABEL_234;
        }
        if (v82 == 91) {
          break;
        }
        if (v82 != 45) {
          goto LABEL_251;
        }
        if (v78 != *(__int32 **)(a1 + 24))
        {
          if (v81 >= 1)
          {
            __int32 v207 = 45;
LABEL_253:
            int v100 = __collate_equiv_value(*(void *)(a1 + 48), &v208, 1uLL);
            int v101 = __collate_equiv_value(*(void *)(a1 + 48), &v207, 1uLL);
            if (v101 < v100) {
              goto LABEL_430;
            }
            if (!v201)
            {
              int v102 = v101;
              uint64_t v90 = tre_new_item(2, v100, &v209, (int **)&v205);
              if (v90 || (uint64_t v90 = tre_new_item(3, v102, &v209, (int **)&v205), v90))
              {
LABEL_434:
                uint64_t v5 = v90;
                goto LABEL_435;
              }
            }
            int v81 = -1;
            goto LABEL_264;
          }
          if ((unint64_t)(v78 + 1) >= v79) {
            goto LABEL_409;
          }
          if (v78[1] != 93)
          {
            if (v81 < 0) {
              goto LABEL_430;
            }
            int v81 = 1;
            goto LABEL_265;
          }
          __int32 v82 = 45;
          __int32 v207 = 45;
          goto LABEL_258;
        }
        int v81 = 0;
        __int32 v83 = 45;
LABEL_234:
        __int32 v208 = v83;
LABEL_264:
        ++v80;
LABEL_265:
        if ((unint64_t)++v78 >= v79)
        {
LABEL_409:
          uint64_t v5 = 7;
          goto LABEL_435;
        }
      }
      uint64_t v84 = v78 + 1;
      if ((unint64_t)(v78 + 1) >= v79) {
        goto LABEL_409;
      }
      int v199 = v80;
      int v85 = *v84;
      if (*v84 == 61 || v85 == 58)
      {
        if (v81 > 0) {
          goto LABEL_430;
        }
        if (!(v81 | v201))
        {
          uint64_t v90 = tre_new_item(1, v208, &v209, (int **)&v205);
          if (v90) {
            goto LABEL_434;
          }
        }
        BOOL v91 = v78 + 2;
        if ((unint64_t)(v78 + 2) >= v79) {
          goto LABEL_390;
        }
        uint64_t v92 = 0;
        uint64_t v93 = 0;
        uint64_t v94 = 0;
        while (1)
        {
          if (v78[v94 + 2] == v85)
          {
            int v95 = &v78[v94 + 3];
            if ((unint64_t)v95 >= v79) {
              goto LABEL_390;
            }
            if (*v95 == 93) {
              break;
            }
          }
          ++v94;
          v93 += 0x100000000;
          --v92;
          if ((unint64_t)&v78[v94 + 2] >= v79) {
            goto LABEL_390;
          }
        }
        if (!v92)
        {
LABEL_390:
          if (v85 == 61) {
            uint64_t v5 = 3;
          }
          else {
            uint64_t v5 = 4;
          }
          goto LABEL_435;
        }
        long long v78 = (__int32 *)((char *)v78 + v94 * 4 + 12);
        if (v85 != 61)
        {
          int v80 = v199;
          if (!v201)
          {
            uint64_t v103 = v93 >> 32;
            if ((unint64_t)(v94 * 4 + 8) >= 0x108) {
              size_t v104 = 63;
            }
            else {
              size_t v104 = v103;
            }
            wcsncpy((__int32 *)__str, v91, v104);
            *(_DWORD *)&__str[4 * v104] = 0;
            int v206 = (__int32 *)__str;
            memset(&v210, 0, sizeof(v210));
            v219[(int)wcsrtombs_l(v219, (const __int32 **)&v206, 0x40uLL, &v210, *(locale_t *)(a1 + 48))] = 0;
            wctype_t v105 = wctype_l(v219, *(locale_t *)(a1 + 48));
            if (!v105)
            {
              uint64_t v5 = 4;
              goto LABEL_435;
            }
            int v98 = v105;
            int v99 = 4;
LABEL_273:
            uint64_t v90 = tre_new_item(v99, v98, &v209, (int **)&v205);
            if (v90) {
              goto LABEL_434;
            }
          }
LABEL_274:
          ++v80;
          int v81 = -1;
          goto LABEL_265;
        }
        size_t v96 = (v94 * 4) >> 2;
        int v97 = __collate_equiv_value(*(void *)(a1 + 48), v91, (v94 * 4) >> 2);
        int v80 = v199;
        if (v97 > 0)
        {
          if (!v201)
          {
            int v98 = v97;
            int v99 = 5;
            goto LABEL_273;
          }
          goto LABEL_274;
        }
        __int32 v82 = tre_search_cnames(v91, v96);
        __int32 v207 = v82;
        if (v82 == -1) {
          goto LABEL_401;
        }
        if (!v201) {
          goto LABEL_263;
        }
        goto LABEL_259;
      }
      if (v85 != 46)
      {
        __int32 v82 = 91;
        __int32 v207 = 91;
        int v80 = v199;
LABEL_252:
        if (v81 >= 1) {
          goto LABEL_253;
        }
LABEL_258:
        if (!v201)
        {
          if (!v81)
          {
            uint64_t v90 = tre_new_item(1, v208, &v209, (int **)&v205);
            if (v90) {
              goto LABEL_434;
            }
            __int32 v82 = v207;
          }
LABEL_263:
          int v81 = 0;
          __int32 v208 = v82;
          goto LABEL_264;
        }
LABEL_259:
        int v81 = 0;
        goto LABEL_264;
      }
      int v86 = v78 + 2;
      int v80 = v199;
      if ((unint64_t)(v78 + 2) < v79)
      {
        uint64_t v87 = 0;
        uint64_t v88 = 0;
        while (1)
        {
          if (v78[v88 + 2] == 46)
          {
            uint64_t v89 = &v78[v88 + 3];
            if ((unint64_t)v89 >= v79) {
              goto LABEL_401;
            }
            if (*v89 == 93) {
              break;
            }
          }
          ++v88;
          --v87;
          if ((unint64_t)&v78[v88 + 2] >= v79) {
            goto LABEL_401;
          }
        }
        if (v87)
        {
          long long v78 = (__int32 *)((char *)v78 + v88 * 4 + 12);
          int v196 = v86;
          __int32 v82 = tre_search_cnames(v86, (v88 * 4) >> 2);
          __int32 v207 = v82;
          if (v82 == -1)
          {
            if ((int)__collate_equiv_value(*(void *)(a1 + 48), v196, (v88 * 4) >> 2) < 1) {
              goto LABEL_401;
            }
            if (v88 != 1)
            {
              if (v197[0]) {
                goto LABEL_401;
              }
              if (v81 > 0)
              {
LABEL_430:
                uint64_t v5 = 11;
                goto LABEL_435;
              }
              uint64_t v106 = ptr;
              uint64_t v107 = *(void *)&v197[4];
              uint64_t v108 = (uint64_t)v198;
              if (!v198)
              {
                unsigned int v109 = (char *)malloc_type_malloc(0x120uLL, 0x1050040DB1D6C16uLL);
                if (!v109) {
                  goto LABEL_498;
                }
                uint64_t v106 = v109;
                uint64_t v108 = (uint64_t)(v109 + 16);
                uint64_t v107 = 16;
              }
              ptr = v106;
              uint64_t v110 = (int)v107;
              if ((int)v107 >= (v108 - (uint64_t)v106) >> 4)
              {
                *(void *)&v197[4] = v107;
              }
              else
              {
                *(void *)&v197[4] = (2 * v107);
                __int32 v111 = (char *)malloc_type_realloc(v106, 16 * (*(_DWORD *)&v197[4] + 2), 0x1050040DB1D6C16uLL);
                if (!v111)
                {
                  free(ptr);
LABEL_498:
                  uint64_t v5 = 12;
                  goto LABEL_437;
                }
                uint64_t v108 = (uint64_t)&v111[16 * v110 + 16];
                ptr = v111;
              }
              *(void *)uint64_t v108 = v196;
              *(_DWORD *)(v108 + 8) = (unint64_t)(v88 * 4) >> 2;
              uint64_t v198 = (void *)(v108 + 16);
              int v201 = 1;
              int v81 = -1;
              int v80 = v199;
              goto LABEL_265;
            }
            __int32 v82 = *v196;
LABEL_251:
            __int32 v207 = v82;
          }
          goto LABEL_252;
        }
      }
LABEL_401:
      uint64_t v5 = 3;
LABEL_435:
      if (ptr) {
        free(ptr);
      }
LABEL_437:
      int v162 = 0;
      __int16 v163 = (char *)v205;
LABEL_438:
      free(v163);
      ++*(_DWORD *)(a1 + 68);
      uint64_t v204 = v162;
LABEL_439:
      int v11 = v203;
LABEL_440:
      if (!v5) {
        goto LABEL_381;
      }
      return v5;
    case 2u:
      int v26 = tre_stack_pop_int((uint64_t)v2);
      *(_DWORD *)(a1 + 84) = tre_stack_pop_int((uint64_t)v2);
      int v27 = v204;
      if (*((_DWORD *)v204 + 13) >> 30)
      {
        *((_DWORD *)v204 + 13) = v26;
        if (v26 > 0x3FFFFFFF) {
          goto LABEL_380;
        }
        int v29 = *((_DWORD *)v27 + 14);
      }
      else
      {
        if (v26 > 0x3FFFFFFF) {
          goto LABEL_380;
        }
        uint64_t v28 = tre_ast_new_literal(*(void *)a1, -1, -1, -1);
        if (!v28) {
          return 12;
        }
        int v27 = tre_ast_new_catenation(*(void *)a1, (uint64_t)v28, (uint64_t)v204);
        if (!v27) {
          return 12;
        }
        int v29 = *((_DWORD *)v204 + 14);
        uint64_t v204 = v27;
        *((_DWORD *)v27 + 13) = v26;
        *((_DWORD *)v27 + 14) = v29;
      }
      uint64_t v5 = 0;
      *((_DWORD *)v27 + 14) = v29 + 1;
      goto LABEL_381;
    case 3u:
      unsigned int v30 = tre_stack_pop_int((uint64_t)v2);
      uint64_t v14 = tre_stack_push_int(v2, 5u);
      if (v14) {
        goto LABEL_294;
      }
      uint64_t v31 = v2;
      unsigned int v32 = v30;
      goto LABEL_41;
    case 4u:
      unsigned int v33 = tre_stack_pop_int((uint64_t)v2);
      uint64_t v14 = tre_stack_push_int(v2, 9u);
      if (v14) {
        goto LABEL_294;
      }
      uint64_t v14 = tre_stack_push_int(v2, v33);
      if (v14) {
        goto LABEL_294;
      }
      uint64_t v15 = v2;
      unsigned int v16 = 1;
      goto LABEL_46;
    case 5u:
      uint64_t v34 = *(int **)(a1 + 24);
      unint64_t v35 = *(void *)(a1 + 40);
      if ((unint64_t)v34 >= v35) {
        goto LABEL_380;
      }
      int v36 = *(_DWORD *)(a1 + 84);
      if ((v36 & 0x10) != 0) {
        goto LABEL_132;
      }
      int v37 = *v34;
      if ((v36 & 1) != 0 && v37 == 124) {
        goto LABEL_380;
      }
      uint64_t v38 = v34 + 1;
      BOOL v39 = (*(_DWORD *)(a1 + 84) & 0x101) != 0x100 || (unint64_t)v38 >= v35;
      if (v39 || v37 != 92)
      {
        if ((v36 & 1) != 0 && v37 == 41 && v10 > 0) {
          goto LABEL_61;
        }
      }
      else if (*v38 == 124)
      {
        goto LABEL_380;
      }
      if ((v36 & 1) != 0 || (unint64_t)(v34 + 1) >= v35 || v37 != 92 || v34[1] != 41)
      {
LABEL_132:
        uint64_t v14 = tre_stack_push_voidptr(v2, v204);
        if (!v14)
        {
          uint64_t v14 = tre_stack_push_int(v2, 6u);
          if (!v14)
          {
            uint64_t v14 = tre_stack_push_int(v2, 5u);
            if (!v14)
            {
              uint64_t v31 = v2;
              unsigned int v32 = 0;
LABEL_41:
              uint64_t v14 = tre_stack_push_int(v31, v32);
              if (!v14)
              {
                uint64_t v15 = v2;
                unsigned int v16 = 4;
LABEL_46:
                uint64_t v14 = tre_stack_push_int(v15, v16);
              }
            }
          }
        }
        goto LABEL_294;
      }
      if (!v10) {
        return 8;
      }
LABEL_61:
      --v10;
      if ((v36 & 0x101) != 0) {
        goto LABEL_380;
      }
      uint64_t v5 = 0;
      int v41 = v34 + 2;
LABEL_370:
      *(void *)(a1 + 24) = v41;
      goto LABEL_381;
    case 6u:
      uint64_t v42 = tre_stack_pop_voidptr((uint64_t)v2);
      int v43 = tre_ast_new_catenation(*(void *)a1, v42, (uint64_t)v204);
      if (!v43) {
        return 12;
      }
      goto LABEL_84;
    case 7u:
      unsigned int v44 = *(int **)(a1 + 24);
      unint64_t v45 = *(void *)(a1 + 40);
      if ((unint64_t)v44 >= v45) {
        goto LABEL_380;
      }
      int v46 = *(_DWORD *)(a1 + 84);
      if ((v46 & 0x10) != 0) {
        goto LABEL_380;
      }
      if (v46) {
        goto LABEL_73;
      }
      int v47 = *v44++;
      if (v47 != 92 || (unint64_t)v44 >= v45) {
        goto LABEL_380;
      }
      *(void *)(a1 + 24) = v44;
LABEL_73:
      if (*v44 == 41)
      {
        uint64_t v5 = 0;
        goto LABEL_369;
      }
      if (*v44 != 124)
      {
        if (v46) {
          goto LABEL_380;
        }
        uint64_t v5 = 0;
        goto LABEL_143;
      }
      uint64_t v14 = tre_stack_push_int(v2, 7u);
      if (v14) {
        goto LABEL_294;
      }
      uint64_t v14 = tre_stack_push_voidptr(v2, *(void *)(a1 + 24));
      if (v14) {
        goto LABEL_294;
      }
      uint64_t v14 = tre_stack_push_voidptr(v2, v204);
      if (v14) {
        goto LABEL_294;
      }
      uint64_t v14 = tre_stack_push_int(v2, 8u);
      if (v14) {
        goto LABEL_294;
      }
      uint64_t v14 = tre_stack_push_int(v2, (*(_DWORD *)(a1 + 84) & 0x101) == 256);
      if (v14) {
        goto LABEL_294;
      }
      uint64_t v5 = tre_stack_push_int(v2, 3u);
      if (v5) {
        goto LABEL_381;
      }
      goto LABEL_368;
    case 8u:
      uint64_t v49 = tre_stack_pop_voidptr((uint64_t)v2);
      if (tre_stack_pop_voidptr((uint64_t)v2) == *(void *)(a1 + 24) - 4) {
        return 14;
      }
      int v43 = tre_ast_new_union(*(void *)a1, v49, (uint64_t)v204);
      if (!v43) {
        return 12;
      }
LABEL_84:
      uint64_t v5 = 0;
      uint64_t v204 = v43;
      goto LABEL_381;
    case 9u:
      BOOL v50 = *(int **)(a1 + 24);
      unint64_t v51 = *(void *)(a1 + 40);
      if ((unint64_t)v50 >= v51) {
        goto LABEL_380;
      }
      unsigned int v52 = *(_DWORD *)(a1 + 84);
      if ((v52 & 0x10) != 0) {
        goto LABEL_380;
      }
      uint64_t v5 = 0;
      int v53 = *v50;
      if (*v50 <= 62)
      {
        if (v53 != 42)
        {
          if (v53 != 43) {
            goto LABEL_381;
          }
LABEL_105:
          if ((v52 & 1) == 0) {
            goto LABEL_380;
          }
        }
LABEL_106:
        __uint32_t v54 = v204;
        if (!*((_DWORD *)v204 + 12) && (*((_DWORD *)v204 + 13) & 0x80000000) != 0 && **(_DWORD **)v204 == -2)
        {
          if (v52) {
            return 13;
          }
          goto LABEL_380;
        }
        int v55 = (v52 >> 6) & 1;
        BOOL v56 = v53 == 43;
        if (v53 == 63) {
          int v57 = 1;
        }
        else {
          int v57 = -1;
        }
        uint64_t v58 = v50 + 1;
        if (v52)
        {
          if ((unint64_t)v58 < v51)
          {
            if (*v58 == 63)
            {
              if ((v52 & 0x100) == 0) {
                return 13;
              }
              int v55 = (v52 & 0x40) == 0;
              ++v50;
            }
            else if ((*v58 - 42) < 2)
            {
              return 13;
            }
          }
        }
        else if ((unint64_t)v58 < v51 && *v58 == 42 {
               || (unint64_t)(v50 + 2) < v51 && *v58 == 92 && v50[2] == 43)
        }
        {
          return 13;
        }
        if (v55) {
          ++*(_DWORD *)(a1 + 76);
        }
        *(void *)(a1 + 24) = v50 + 1;
        unsigned int v149 = tre_ast_new_iter(*(void *)a1, (uint64_t)v54, v56, v57, v55);
        if (v149)
        {
          uint64_t v5 = 0;
          uint64_t v204 = v149;
          int v150 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)(a1 + 64) = v150 + 1;
          *((_DWORD *)v149 + 13) = v150;
          goto LABEL_381;
        }
        return 12;
      }
      switch(v53)
      {
        case '{':
          if ((v52 & 1) == 0) {
            goto LABEL_380;
          }
          break;
        case '\\':
          if (v52) {
            goto LABEL_380;
          }
          if ((unint64_t)++v50 >= v51) {
            goto LABEL_380;
          }
          int v53 = *v50;
          if (*v50 == 43) {
            goto LABEL_149;
          }
          if (v53 != 123)
          {
            if (v53 != 63) {
              goto LABEL_380;
            }
LABEL_149:
            if ((v52 & 0x100) == 0) {
              goto LABEL_380;
            }
            *(void *)(a1 + 24) = v50;
            goto LABEL_106;
          }
          break;
        case '?':
          goto LABEL_105;
        default:
          goto LABEL_381;
      }
      BOOL v61 = !*((_DWORD *)v204 + 12) && (*((_DWORD *)v204 + 13) & 0x80000000) != 0 && **(_DWORD **)v204 == -2;
      *(void *)(a1 + 24) = v50 + 1;
      uint64_t v62 = tre_parse_bound(a1, (uint64_t *)&v204);
      if (!v62)
      {
        if (v61) {
          return 13;
        }
        int v147 = v204;
        if (*((_DWORD *)v204 + 12) == 2)
        {
          uint64_t v5 = 0;
          int v148 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)(a1 + 64) = v148 + 1;
          *((_DWORD *)v147 + 13) = v148;
          goto LABEL_381;
        }
        goto LABEL_380;
      }
      uint64_t v5 = v62;
      if (v62 != 1) {
        return v5;
      }
LABEL_142:
      uint64_t v5 = 0;
      unsigned int v44 = *(int **)(a1 + 24);
LABEL_143:
      int v41 = v44 - 1;
      goto LABEL_370;
    default:
      goto LABEL_380;
  }
}

uint64_t tre_parse_bound(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(_DWORD **)(a1 + 24);
  unsigned int v3 = *(_DWORD *)(a1 + 84);
  unint64_t v4 = *(void *)(a1 + 40);
  if ((unint64_t)v2 >= v4)
  {
    BOOL v13 = (*(_DWORD *)(a1 + 84) & 1) == 0;
    unsigned int v14 = 9;
    goto LABEL_14;
  }
  if ((*v2 - 48) > 9)
  {
    BOOL v13 = (*(_DWORD *)(a1 + 84) & 1) == 0;
    unsigned int v14 = 10;
LABEL_14:
    if (v13) {
      return v14;
    }
    else {
      return 1;
    }
  }
  int v7 = (v3 >> 6) & 1;
  int v8 = -1;
  int v9 = *(_DWORD **)(a1 + 24);
  do
  {
    unsigned int v10 = *v9 - 48;
    if (v10 > 9) {
      break;
    }
    int v8 = v10 + 10 * (v8 & ~(v8 >> 31));
    ++v9;
  }
  while ((unint64_t)v9 < v4);
  if ((unint64_t)v9 < v4 && *v9 == 44)
  {
    ++v9;
    int v11 = -1;
    if ((unint64_t)v9 >= v4) {
      goto LABEL_24;
    }
    do
    {
      unsigned int v12 = *v9 - 48;
      if (v12 > 9) {
        break;
      }
      int v11 = v12 + 10 * (v11 & ~(v11 >> 31));
      ++v9;
    }
    while ((unint64_t)v9 < v4);
  }
  else
  {
    int v11 = v8;
  }
  if ((v11 & 0x80000000) == 0)
  {
    uint64_t result = 10;
    if (v11 > 0xFF || v8 > 255 || v8 > v11) {
      return result;
    }
    goto LABEL_25;
  }
LABEL_24:
  if (v8 > 255) {
    return 10;
  }
LABEL_25:
  if ((unint64_t)v9 >= v4) {
    return 9;
  }
  if (v9 == v2) {
    return 10;
  }
  if ((v3 & 1) == 0)
  {
    if ((unint64_t)(v9 + 1) < v4 && *v9 == 92 && v9[1] == 125)
    {
      unsigned int v16 = v9 + 2;
      if ((unint64_t)(v9 + 2) >= v4 || *v16 != 42) {
        goto LABEL_43;
      }
      return 13;
    }
    return 10;
  }
  if (*v9 != 125) {
    return 10;
  }
  unsigned int v16 = v9 + 1;
  if ((unint64_t)(v9 + 1) < v4)
  {
    if ((*v16 - 42) < 2) {
      return 13;
    }
    if (*v16 == 63)
    {
      if ((v3 & 0x100) == 0) {
        return 13;
      }
      int v7 = (v3 & 0x40) == 0;
      unsigned int v16 = v9 + 2;
    }
  }
LABEL_43:
  if (v7) {
    ++*(_DWORD *)(a1 + 76);
  }
  if (a2)
  {
    int v17 = tre_ast_new_iter(*(void *)a1, *a2, v8, v11, v7);
    *a2 = (uint64_t)v17;
    if (!v17) {
      return 12;
    }
  }
  uint64_t result = 0;
  *(void *)(a1 + 24) = v16;
  return result;
}

_DWORD *tre_expand_macro(_DWORD *result, unint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  if ((unint64_t)result < a2)
  {
    uint64_t v3 = 0;
    while (*result != tre_macros[v3])
    {
      v3 += 16;
      if (v3 == 192) {
        return result;
      }
    }
    unint64_t v4 = *(unsigned char **)&tre_macros[v3 + 8];
    LOBYTE(v5) = *v4;
    if (*v4)
    {
      unint64_t v6 = 0;
      int v7 = v4 + 1;
      do
      {
        a3[v6] = (char)v5;
        unint64_t v8 = v6 + 1;
        if (v6 > 0x3E) {
          break;
        }
        int v5 = v7[v6++];
      }
      while (v5);
    }
    else
    {
      unint64_t v8 = 0;
    }
    a3[v8] = 0;
  }
  return result;
}

uint64_t tre_search_cnames(__int32 *a1, size_t a2)
{
  unint64_t v4 = 0;
  unint64_t v5 = 95;
  while (1)
  {
    unint64_t v6 = (v5 + v4) >> 1;
    int v7 = (const __int32 *)*(&cnames + 2 * v6);
    int v8 = wcsncmp(a1, v7, a2);
    if (!v8 && !v7[a2]) {
      break;
    }
    if (v8 <= 0) {
      unint64_t v5 = v6 - 1;
    }
    else {
      unint64_t v4 = v6 + 1;
    }
    if (v4 > v5) {
      return 0xFFFFFFFFLL;
    }
  }
  return *((unsigned int *)&cnames + 4 * v6 + 2);
}

uint64_t tre_new_item(int a1, int a2, int *a3, int **a4)
{
  unint64_t v6 = *a4;
  int v7 = **a4;
  uint64_t v8 = *a3;
  if (v7 >= (int)v8)
  {
    if ((int)v8 > 1023) {
      return 12;
    }
    *a3 = 2 * v8;
    unint64_t v6 = malloc_type_realloc(v6, (16 * v8) | 8, 0x681DC935uLL);
    if (!v6) {
      return 12;
    }
    *a4 = v6;
    int v9 = *v6;
  }
  else
  {
    int v9 = **a4;
  }
  uint64_t v11 = 0;
  unsigned int v12 = &v6[2 * v7];
  v12[2] = a1;
  v12[3] = a2;
  *unint64_t v6 = v9 + 1;
  return v11;
}

void *tre_stack_new(int a1, int a2, int a3)
{
  unint64_t v6 = malloc_type_malloc(0x18uLL, 0x10200403ED2C137uLL);
  if (v6)
  {
    int v7 = malloc_type_malloc(8 * a1, 0x108204023715A0EuLL);
    v6[2] = v7;
    if (v7)
    {
      *(_DWORD *)unint64_t v6 = a1;
      *((_DWORD *)v6 + 1) = a2;
      *((_DWORD *)v6 + 2) = a3;
      *((_DWORD *)v6 + 3) = 0;
    }
    else
    {
      free(v6);
      return 0;
    }
  }
  return v6;
}

void tre_stack_destroy(void **a1)
{
  free(a1[2]);

  free(a1);
}

uint64_t tre_stack_num_objects(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t tre_stack_push_int(int *a1, unsigned int a2)
{
  return tre_stack_push(a1, a2);
}

uint64_t tre_stack_push(int *a1, uint64_t a2)
{
  int v4 = a1[3];
  int v5 = *a1;
  BOOL v6 = v4 >= *a1;
  if (v4 < *a1)
  {
    int v9 = (void *)*((void *)a1 + 2);
LABEL_12:
    unsigned int v10 = 0;
    v9[v4] = a2;
    ++a1[3];
    char v8 = v6;
  }
  else
  {
    int v7 = a1[1];
    if (v5 >= v7)
    {
      char v8 = 0;
    }
    else
    {
      char v8 = 0;
      do
      {
        if (a1[2] + v5 >= v7) {
          int v5 = v7;
        }
        else {
          v5 += a1[2];
        }
        int v9 = malloc_type_realloc(*((void **)a1 + 2), 8 * v5, 0x108204023715A0EuLL);
        if (!v9) {
          break;
        }
        *a1 = v5;
        *((void *)a1 + 2) = v9;
        int v4 = a1[3];
        if (v4 < v5) {
          goto LABEL_12;
        }
        int v7 = a1[1];
        char v8 = 1;
      }
      while (v5 < v7);
    }
    unsigned int v10 = 12;
  }
  if (v8) {
    return 0;
  }
  else {
    return v10;
  }
}

uint64_t tre_stack_pop_int(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(int *)(a1 + 12) - 1;
  *(_DWORD *)(a1 + 12) = v2;
  return *(unsigned int *)(v1 + 8 * v2);
}

uint64_t tre_stack_pop_voidptr(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(int *)(a1 + 12) - 1;
  *(_DWORD *)(a1 + 12) = v2;
  return *(void *)(v1 + 8 * v2);
}

int creat(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CFDE0](a1, 1537, a2);
}

int sigpause(int a1)
{
  if (!*MEMORY[0x1E4F14CA8]) {
    *MEMORY[0x1E4F14CA8] = 1;
  }
  sigset_t v3 = 0;
  pthread_testcancel();
  if ((a1 - 32) > 0xFFFFFFE0)
  {
    if ((sigprocmask(1, 0, &v3) & 0x80000000) == 0)
    {
      v3 &= ~(1 << (a1 - 1));
      return sigsuspend_NOCANCEL();
    }
  }
  else
  {
    *__error() = 22;
  }
  return -1;
}

int lockf(int a1, int a2, off_t a3)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
      int result = __fcntl();
      break;
    case 3:
      int result = __fcntl();
      if (result != -1)
      {
        if (getpid())
        {
          int v4 = __error();
          int v5 = 35;
          goto LABEL_4;
        }
        int result = 0;
      }
      break;
    default:
      int v4 = __error();
      int v5 = 22;
LABEL_4:
      *int v4 = v5;
      int result = -1;
      break;
  }
  return result;
}

int pause(void)
{
  sigset_t v1 = 0;
  sigprocmask(0, 0, &v1);
  return sigsuspend(&v1);
}

int tcdrain(int a1)
{
  return ioctl(a1, 0x2000745EuLL, 0);
}

pid_t wait(int *a1)
{
  return MEMORY[0x1F40CFE78](0xFFFFFFFFLL, a1, 0, 0);
}

int system(const char *a1)
{
  __argv[0] = "sh";
  __argv[1] = "-c";
  __argv[2] = (char *)a1;
  __argv[3] = 0;
  if (!*MEMORY[0x1E4F14CA8]) {
    *MEMORY[0x1E4F14CA8] = 1;
  }
  pthread_testcancel();
  if (!a1) {
    return 0;
  }
  *(void *)unsigned int v16 = 0;
  v15.__sigaction_u.__sa_handler = 0;
  *(void *)&v15.sa_masuint64_t k = 0;
  v14.__sigaction_u.__sa_handler = 0;
  *(void *)&v14.sa_masuint64_t k = 0;
  v13.__sigaction_u.__sa_handler = 0;
  *(void *)&v13.sa_masuint64_t k = 0;
  *(void *)unsigned int v12 = 0;
  posix_spawnattr_t v10 = 0;
  int v2 = posix_spawnattr_init(&v10);
  if (v2)
  {
    *__error() = v2;
    return -1;
  }
  sigset_t v11 = 0;
  pthread_mutex_lock(&__systemfn_mutex_0);
  v15.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v15.sa_masuint64_t k = 0;
  sigaction(2, &v15, &v14);
  if (v14.__sigaction_u.__sa_handler == (void (__cdecl *)(int))1)
  {
    __int16 v4 = 8;
    sigset_t v5 = 4;
  }
  else
  {
    sigset_t v11 = 2;
    __int16 v4 = 12;
    sigset_t v5 = 6;
  }
  sigaction(3, &v15, &v13);
  if (v13.__sigaction_u.__sa_handler != (void (__cdecl *)(int))1)
  {
    sigset_t v11 = v5;
    __int16 v4 = 12;
  }
  v12[1] = 0x80000;
  sigprocmask(1, &v12[1], v12);
  posix_spawnattr_setsigmask(&v10, v12);
  if ((v4 & 4) != 0) {
    posix_spawnattr_setsigdefault(&v10, &v11);
  }
  posix_spawnattr_setflags(&v10, v4);
  BOOL v6 = _NSGetEnviron();
  int v7 = posix_spawn(&v16[1], "/bin/sh", 0, &v10, __argv, *v6);
  posix_spawnattr_destroy(&v10);
  if (v7 == 35 || v7 == 12)
  {
    pid_t v9 = -1;
  }
  else
  {
    if (!v7)
    {
      pid_t v8 = v16[1];
      while (1)
      {
        v16[1] = wait4(v8, v16, 0, 0);
        if (v16[1] != -1) {
          goto LABEL_25;
        }
        if (*__error() != 4)
        {
          pid_t v9 = v16[1];
          if (v16[1] != -1) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
      }
    }
    pid_t v9 = 32512;
  }
LABEL_24:
  v16[0] = v9;
LABEL_25:
  sigaction(2, &v14, 0);
  sigaction(3, &v13, 0);
  sigprocmask(3, v12, 0);
  pthread_mutex_unlock(&__systemfn_mutex_0);
  return v16[0];
}

FILE *popen_DARWIN_EXTSN(unint64_t a1, char *a2, size_t a3, _xlocale *a4)
{
  if (off_1E911B938)
  {
    ((void (*)(unint64_t))off_1E911B938)(a1);
    if (off_1E911B938) {
      ((void (*)(char *))off_1E911B938)(a2);
    }
  }
  pid_t v20 = 0;
  *(_OWORD *)__argv = 0u;
  long long v22 = 0u;
  posix_spawn_file_actions_t v19 = 0;
  if (!a2) {
    goto LABEL_9;
  }
  int v6 = j__strncasecmp_l(a2, "r+", a3, a4);
  if (!v6)
  {
    if ((socketpair(1, 1, 0, &v23) & 0x80000000) == 0)
    {
      a2 = "r+";
      goto LABEL_13;
    }
    return 0;
  }
  int v7 = *a2;
  if (v7 != 119 && v7 != 114 || a2[1])
  {
LABEL_9:
    pid_t v8 = 0;
    *__error() = 22;
    return v8;
  }
  if (pipe(&v23) < 0) {
    return 0;
  }
LABEL_13:
  if (*a2 == 114)
  {
    pid_t v8 = (FILE *)fdopen_DARWIN_EXTSN(v23, a2);
    if (v8) {
      goto LABEL_15;
    }
LABEL_19:
    close_NOCANCEL();
    close_NOCANCEL();
    return v8;
  }
  pid_t v8 = (FILE *)fdopen_DARWIN_EXTSN(v24, a2);
  if (!v8) {
    goto LABEL_19;
  }
LABEL_15:
  pid_t v9 = malloc_type_malloc(0x18uLL, 0x102004062D53EE8uLL);
  if (!v9)
  {
    fclose(v8);
    close_NOCANCEL();
    return 0;
  }
  posix_spawnattr_t v10 = v9;
  int v11 = posix_spawn_file_actions_init(&v19);
  if (v11)
  {
    int v12 = v11;
    fclose(v8);
    close_NOCANCEL();
    free(v10);
    pid_t v8 = 0;
    *__error() = v12;
  }
  else
  {
    if (*a2 == 114)
    {
      posix_spawn_file_actions_addclose(&v19, v23);
      if (v24 != 1)
      {
        posix_spawn_file_actions_adddup2(&v19, v24, 1);
        posix_spawn_file_actions_addclose(&v19, v24);
      }
      if (!v6) {
        posix_spawn_file_actions_adddup2(&v19, 1, 0);
      }
    }
    else
    {
      if (v23)
      {
        posix_spawn_file_actions_adddup2(&v19, v23, 0);
        posix_spawn_file_actions_addclose(&v19, v23);
      }
      posix_spawn_file_actions_addclose(&v19, v24);
    }
    pthread_mutex_lock(&__popen_pidlist_mutex);
    for (uint64_t i = __popen_pidlist; i; uint64_t i = *(void *)i)
      posix_spawn_file_actions_addclose(&v19, *(_DWORD *)(i + 16));
    __argv[0] = "sh";
    __argv[1] = "-c";
    long long v22 = a1;
    sigaction v15 = _NSGetEnviron();
    int v16 = posix_spawn(&v20, "/bin/sh", &v19, 0, __argv, *v15);
    pthread_mutex_unlock(&__popen_pidlist_mutex);
    posix_spawn_file_actions_destroy(&v19);
    if (v16)
    {
      if (v16 == 35 || v16 == 12)
      {
        fclose(v8);
        close_NOCANCEL();
        free(v10);
        pid_t v8 = 0;
        *__error() = v16;
        return v8;
      }
      pid_t v20 = -1;
    }
    if (*a2 == 114) {
      int v18 = v23;
    }
    else {
      int v18 = v24;
    }
    *((_DWORD *)v10 + 4) = v18;
    close_NOCANCEL();
    v10[1] = v8;
    *((_DWORD *)v10 + 5) = v20;
    pthread_mutex_lock(&__popen_pidlist_mutex);
    void *v10 = __popen_pidlist;
    __popen_pidlist = (uint64_t)v10;
    pthread_mutex_unlock(&__popen_pidlist_mutex);
    fwide(v8, -1);
  }
  return v8;
}

uint64_t fdopen_DARWIN_EXTSN(int a1, char *a2)
{
  if (off_1E911B938) {
    ((void (*)(char *))off_1E911B938)(a2);
  }
  int v11 = 0;
  if (a1 >= 0x8000)
  {
    __int16 v4 = __error();
    uint64_t result = 0;
    int v6 = 24;
LABEL_5:
    *__int16 v4 = v6;
    return result;
  }
  int v7 = __sflags(a2, &v11);
  if (!v7) {
    return 0;
  }
  __int16 v8 = v7;
  int v9 = fcntl_NOCANCEL();
  if (v9 < 0) {
    return 0;
  }
  char v10 = v9;
  if ((v9 & 3) != 2 && (v9 & 3) != (v11 & 3))
  {
    __int16 v4 = __error();
    uint64_t result = 0;
    int v6 = 22;
    goto LABEL_5;
  }
  uint64_t result = __sfp(0);
  if (result)
  {
    *(_WORD *)(result + 16) = v8;
    if ((v10 & 8) == 0 && (v11 & 8) != 0) {
      *(_WORD *)(result + 16) = v8 | 0x100;
    }
    *(_WORD *)(result + 18) = a1;
    *(void *)(result + 64) = __sread;
    *(void *)(result + 80) = __swrite;
    *(void *)(result + 72) = __sseek;
    *(void *)(result + 48) = result;
    *(void *)(result + 56) = __sclose;
  }
  return result;
}

uint64_t fopen_DARWIN_EXTSN(uint64_t a1, char *a2)
{
  if (off_1E911B938)
  {
    ((void (*)(uint64_t))off_1E911B938)(a1);
    if (off_1E911B938) {
      ((void (*)(char *))off_1E911B938)(a2);
    }
  }
  int v8 = 0;
  int v3 = __sflags(a2, &v8);
  if (!v3) {
    return 0;
  }
  __int16 v4 = v3;
  uint64_t v5 = __sfp(0);
  if (!v5) {
    return v5;
  }
  unsigned int v6 = open_NOCANCEL();
  if ((v6 & 0x80000000) != 0)
  {
    __sfprelease(v5);
    return 0;
  }
  if (v6 < 0x8000)
  {
    *(_WORD *)(v5 + 18) = v6;
    *(_WORD *)(v5 + 16) = v4;
    *(void *)(v5 + 64) = __sread;
    *(void *)(v5 + 80) = __swrite;
    *(void *)(v5 + 72) = __sseek;
    *(void *)(v5 + 48) = v5;
    *(void *)(v5 + 56) = __sclose;
    if ((v8 & 8) != 0) {
      _sseek(v5, 0, 2);
    }
  }
  else
  {
    *(_WORD *)(v5 + 16) = 0;
    close_NOCANCEL();
    uint64_t v5 = 0;
    *__error() = 24;
  }
  return v5;
}

uint64_t getgroups_DARWIN_EXTSN(unsigned int a1, uint64_t a2)
{
  uid_t v4 = getuid();
  uint64_t v5 = getpwuid(v4);
  if (v5)
  {
    if (a1)
    {
      unsigned int v7 = a1;
      if ((MEMORY[0x18C1227C0](v5->pw_name, v5->pw_gid, a2, &v7) & 0x80000000) == 0) {
        return v7;
      }
    }
    else
    {
      uint64_t result = getgroupcount();
      if (result) {
        return result;
      }
    }
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

void __chk_fail_overflow()
{
}

void __chk_fail_overlap()
{
}

unint64_t __strncat_chk(unint64_t a1, char *a2, size_t a3, unint64_t a4)
{
  uint64_t v8 = j__strsignal_r(a1, a2, a3);
  uint64_t v9 = MEMORY[0x18C122FD0](a2, a3);
  uint64_t v10 = v9 + v8;
  unint64_t v11 = v9 + v8 + 1;
  if (v11 > a4) {
    __chk_fail_overflow();
  }
  if (__chk_assert_no_overlap) {
    __chk_overlap(a1, v11, (unint64_t)a2, v9 + 1);
  }
  j__mkdtempat_np(a1 + v8, a2);
  *(unsigned char *)(a1 + v10) = 0;
  return a1;
}

uint64_t __memccpy_chk(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  if (a5 < a4) {
    __chk_fail_overflow();
  }
  uint64_t v8 = MEMORY[0x18C122A00]();
  uint64_t v9 = v8;
  if (v8) {
    uint64_t v10 = v8 - a1;
  }
  else {
    uint64_t v10 = a4;
  }
  __chk_overlap(a1, v10, a2, v10);
  return v9;
}

uint64_t __snprintf_object_size_chk(char *a1, size_t a2, size_t __size, char *__format, ...)
{
  va_start(va, __format);
  if (a2 < __size) {
    __chk_fail_overflow();
  }
  return vsnprintf(a1, __size, __format, va);
}

int __vsprintf_chk(char *a1, int a2, size_t a3, const char *a4, va_list a5)
{
  if (a3 >> 31)
  {
    return vsprintf(a1, a4, a5);
  }
  else
  {
    int result = vsnprintf(a1, a3, a4, a5);
    if ((result & 0x80000000) == 0 && result >= a3) {
      __chk_fail_overflow();
    }
  }
  return result;
}

uint64_t __sprintf_object_size_chk(char *a1, size_t a2, char *a3, ...)
{
  va_start(va, a3);
  if (a2 >> 31) {
    return vsprintf(a1, a3, va);
  }
  uint64_t result = vsnprintf(a1, a2, a3, va);
  if ((result & 0x80000000) == 0 && (int)result >= a2) {
    __chk_fail_overflow();
  }
  return result;
}

char *__stpncpy_chk(char *a1, const char *a2, size_t a3, size_t a4)
{
  if (a4 < a3) {
    __chk_fail_overflow();
  }
  unsigned int v7 = stpncpy(a1, a2, a3);
  uint64_t v8 = v7;
  if (__chk_assert_no_overlap)
  {
    if (v7 - a1 == a3) {
      uint64_t v9 = v7 - a1;
    }
    else {
      uint64_t v9 = v7 - a1 + 1;
    }
    __chk_overlap((unint64_t)a1, v9, (unint64_t)a2, v9);
  }
  return v8;
}

int __vsnprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, va_list a6)
{
  if (a4 < a2) {
    __chk_fail_overflow();
  }
  return vsnprintf(a1, a2, a5, a6);
}

void _ffpp_strtoencf32_l_cold_1()
{
  __assert_rtn("_ffpp_strtoencf32_l", "strtofp.c", 2901, "normalizeDigits <= 4 || info.digitCount < 20");
}

void _ffpp_strtoencf32_l_cold_2()
{
  __assert_rtn("_ffpp_strtoencf32_l", "strtofp.c", 2919, "normalizeProduct <= 1");
}

void _ffpp_strtoencf64_l_cold_1()
{
  __assert_rtn("_ffpp_strtoencf64_l", "strtofp.c", 3156, "normalizeDigits <= 4 || info.digitCount < 20");
}

void _ffpp_strtoencf64_l_cold_2()
{
  __assert_rtn("_ffpp_strtoencf64_l", "strtofp.c", 3176, "normalizeProduct <= 2");
}

void _ffpp_strtoencf64_l_cold_3()
{
}

void generalSlowpath_cold_1()
{
}

void generalSlowpath_cold_2()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1879, "(workMP.msw - workMP.lsw) <= totalWordsNeeded");
}

void generalSlowpath_cold_3()
{
}

void generalSlowpath_cold_4()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1940, "(denominator.msw - denominator.lsw) <= denominatorWordsNeeded");
}

void generalSlowpath_cold_5()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1941, "denominator.msw[-1] != 0");
}

void generalSlowpath_cold_6()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1946, "numerator.msw[-1] != 0");
}

void generalSlowpath_cold_7()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1950, "numerator.msw[-1] != 0");
}

void generalSlowpath_cold_8()
{
  __assert_rtn("divideMPByMP", "strtofp.c", 1345, "numerator.msw[-1] != 0");
}

void generalSlowpath_cold_9()
{
  __assert_rtn("divideMPByMP", "strtofp.c", 1346, "denominator.msw[-1] != 0");
}

void generalSlowpath_cold_10()
{
}

void generalSlowpath_cold_11()
{
}

void generalSlowpath_cold_12()
{
}

void generalSlowpath_cold_13()
{
}

void bitCountMP_cold_1()
{
  __assert_rtn("bitCountMP", "strtofp.c", 1056, "work.msw[-1] != 0");
}

void fts_build_cold_1()
{
  uint64_t v0 = _os_assert_log();
  _os_crash((uint64_t)v0);
  __break(1u);
}

uint64_t _os_debug_log_error_str(char *__sig)
{
  return _os_debug_log_write(3, __sig, v1);
}

void _os_debug_log(char *a1, ...)
{
  va_start(va, a1);
  uint64_t v3 = MEMORY[0x1E4F14C38];
  if (*(void *)(MEMORY[0x1E4F14C38] + 192) == -1) {
    uint64_t v4 = *(void *)(MEMORY[0x1E4F14C38] + 200);
  }
  else {
    uint64_t v4 = _os_alloc_once();
  }
  if ((*(unsigned char *)(v4 + 20) & 2) == 0)
  {
    unint64_t v11 = 0;
    unsigned int v5 = vasprintf(&v11, a1, va);
    uint64_t v6 = v11;
    if (v11)
    {
      unsigned int v7 = v11;
      if (v5 >= 0x15)
      {
        if (*(unsigned char *)(v4 + 20))
        {
          char v8 = v11[16];
          uint64_t v9 = mach_absolute_time();
          if (*(void *)(v3 + 192) == -1) {
            uint64_t v10 = *(void **)(v3 + 200);
          }
          else {
            uint64_t v10 = (void *)_os_alloc_once();
          }
          snprintf(v6, 0x11uLL, "%16llu", v9 - *v10);
          unsigned int v7 = v11;
          v11[16] = v8;
        }
        else
        {
          unsigned int v7 = v11 + 20;
          v11 += 20;
        }
      }
      _os_debug_log_write(7, v7, v1);
      free(v6);
    }
  }
}

void __xprintf_domain_init_cold_1()
{
}

void libc_set_introspection_hooks_cold_1()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 33, "size >= sizeof(libc_hooks_version)");
}

void libc_set_introspection_hooks_cold_2()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 50, "new_hooks->version >= libc_hooks_version");
}

void libc_set_introspection_hooks_cold_3()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 54, "size >= sizeof(libc_hooks)");
}

void libc_set_introspection_hooks_cold_4()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 37, "size >= sizeof(libc_hooks)");
}

uint64_t _os_crash(uint64_t result)
{
  qword_1E9119F68 = result;
  if (_os_crash_callback) {
    return _os_crash_callback();
  }
  return result;
}

char *_os_assert_log()
{
  memset(&v16, 0, sizeof(v16));
  memset(out, 0, 37);
  uint64_t v2 = dladdr(v1, &v16);
  if (v2)
  {
    *(void *)uu = 0;
    uint64_t v19 = 0;
    _os_get_image_uuid((uint64_t)v16.dli_fbase, uu);
    uuid_unparse(uu, out);
    dli_fname = v16.dli_fname;
    strrchr((char *)v16.dli_fname, 47);
    OUTLINED_FUNCTION_2();
  }
  else
  {
    uint64_t v0 = 0;
    dli_fname = 0;
  }
  uint64_t v5 = OUTLINED_FUNCTION_5(v2, v3, "%s:%lu");
  OUTLINED_FUNCTION_7(v5, v6, "0x%llx");
  int build = _os_get_build(v20);
  OUTLINED_FUNCTION_6(build, v8, "assertion failed: %s: %s + %lu [%s]: %s", v9, v10, v11, v12, v13, (uint64_t)v20, (uint64_t)dli_fname, v0, (uint64_t)out, (uint64_t)v21, v15, (uint64_t)v16.dli_fname, (uint64_t)v16.dli_fbase, (uint64_t)v16.dli_sname, (uint64_t)v16.dli_saddr, v17,
    uu[0]);
  if ((_os_log_redirect((const mach_header_64 *)v16.dli_fbase, (uint64_t)uu) & 1) == 0) {
    _os_debug_log_error_offset((char *)uu, (size_t)v1);
  }
  return strdup((const char *)uu);
}

char *_os_assert_log_ctx(void (*a1)(void))
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_3(__stack_chk_guard[0]);
  uint64_t v12 = OUTLINED_FUNCTION_0(v4, v5, v6, v7, v8, v9, v10, v11, v31, v33, v35, v37, v39, v41, __s, v46);
  if (v12)
  {
    OUTLINED_FUNCTION_4(v12, v13, v14, v15, v16, v17, v18, v19, v32, v34, v36, v38, v40, v42, (uint64_t)__sa, v45);
    uuid_unparse(uu, out);
    uint64_t v20 = (uint64_t)__sa;
    strrchr(__sa, 47);
    OUTLINED_FUNCTION_1();
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v20 = 0;
  }
  uint64_t v21 = OUTLINED_FUNCTION_5(v12, v13, "%s:%lu");
  OUTLINED_FUNCTION_7(v21, v22, "0x%llx");
  int build = _os_get_build(v51);
  OUTLINED_FUNCTION_6(build, v24, "assertion failed: %s: %s + %lu [%s]: %s", v25, v26, v27, v28, v29, (uint64_t)v51, v20, v2, (uint64_t)out, (uint64_t)v52, v42, (uint64_t)__sa, v45, v47, v48, v49,
    __s1[0]);
  _simple_asl_msg_new();
  a1();
  _simple_sfree();
  return strdup(__s1);
}

void _os_crash_fmt_cold_1()
{
}

void mpool_new_cold_1()
{
}

void arc4_init_cold_1(uint64_t *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14CD0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg(*a1);
  __break(1u);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  if (a1)
  {
    if (a1 == (const char *)-1)
    {
      _simple_dprintf();
      if (qword_1E9119F68) {
        goto LABEL_13;
      }
      if (!_simple_salloc()) {
        goto LABEL_12;
      }
    }
    else
    {
      _simple_dprintf();
      if (qword_1E9119F68) {
        goto LABEL_13;
      }
      if (!_simple_salloc())
      {
LABEL_12:
        qword_1E9119F68 = (uint64_t)a4;
LABEL_13:
        abort();
      }
    }
  }
  else
  {
    _simple_dprintf();
    if (qword_1E9119F68) {
      goto LABEL_13;
    }
    if (!_simple_salloc()) {
      goto LABEL_12;
    }
  }
  _simple_sprintf();
  a4 = (const char *)_simple_string();
  goto LABEL_12;
}

void err(int a1, const char *a2, ...)
{
  va_start(va, a2);
  uint64_t v4 = __error();
  verrc(a1, *v4, a2, va);
}

void verrc(int a1, int a2, const char *a3, __darwin_va_list a4)
{
  uint64_t v7 = *(void *)&a1;
  uint64_t v8 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    uint64_t v8 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }
  uint64_t v9 = getprogname();
  fprintf(v8, "%s: ", v9);
  if (a3)
  {
    _e_visprintf((FILE *)_e_err_file, a3, a4);
    fwrite(": ", 2uLL, 1uLL, (FILE *)_e_err_file);
  }
  int v10 = (FILE *)_e_err_file;
  uint64_t v11 = strerror(a2);
  fprintf(v10, "%s\n", v11);
  if (_e_err_exit)
  {
    if (_e_err_exit == 1) {
      (*((void (**)(uint64_t (*)(void), uint64_t))off_1E911B8E0 + 2))(off_1E911B8E0, v7);
    }
    else {
      off_1E911B8E0(v7);
    }
  }
  exit(v7);
}

void verr(int a1, const char *a2, __darwin_va_list a3)
{
  uint64_t v6 = __error();
  verrc(a1, *v6, a2, a3);
}

void errc(int a1, int a2, const char *a3, ...)
{
  va_start(va, a3);
  verrc(a1, a2, a3, va);
}

void errx(int a1, const char *a2, ...)
{
  va_start(va, a2);
  verrx(a1, a2, va);
}

void verrx(int a1, const char *a2, __darwin_va_list a3)
{
  uint64_t v5 = *(void *)&a1;
  uint64_t v6 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    uint64_t v6 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }
  uint64_t v7 = getprogname();
  fprintf(v6, "%s: ", v7);
  if (a2) {
    _e_visprintf((FILE *)_e_err_file, a2, a3);
  }
  fputc(10, (FILE *)_e_err_file);
  if (_e_err_exit)
  {
    if (_e_err_exit == 1) {
      (*((void (**)(uint64_t (*)(void), uint64_t))off_1E911B8E0 + 2))(off_1E911B8E0, v5);
    }
    else {
      off_1E911B8E0(v5);
    }
  }
  exit(v5);
}

void warn(const char *a1, ...)
{
  va_start(va, a1);
  uint64_t v2 = __error();
  vwarnc(*v2, a1, va);
}

void vwarnc(int a1, const char *a2, __darwin_va_list a3)
{
  uint64_t v6 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    uint64_t v6 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }
  uint64_t v7 = getprogname();
  fprintf(v6, "%s: ", v7);
  if (a2)
  {
    _e_visprintf((FILE *)_e_err_file, a2, a3);
    fwrite(": ", 2uLL, 1uLL, (FILE *)_e_err_file);
  }
  uint64_t v8 = (FILE *)_e_err_file;
  uint64_t v9 = strerror(a1);
  fprintf(v8, "%s\n", v9);
}

void vwarn(const char *a1, __darwin_va_list a2)
{
  int v4 = *__error();

  vwarnc(v4, a1, a2);
}

void warnc(int a1, const char *a2, ...)
{
  va_start(va, a2);
  vwarnc(a1, a2, va);
}

void warnx(const char *a1, ...)
{
  va_start(va, a1);
  vwarnx(a1, va);
}

void vwarnx(const char *a1, __darwin_va_list a2)
{
  int v4 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    int v4 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }
  uint64_t v5 = getprogname();
  fprintf(v4, "%s: ", v5);
  if (a1) {
    _e_visprintf((FILE *)_e_err_file, a1, a2);
  }
  uint64_t v6 = (FILE *)_e_err_file;

  fputc(10, v6);
}

void sl_init_cold_1()
{
}

void unvis_cold_1()
{
  __assert_rtn("unvis", "unvis.c", 210, "cp != ((void *)0)");
}

void unvis_cold_2()
{
  __assert_rtn("unvis", "unvis.c", 211, "astate != ((void *)0)");
}

void strnunvisx_cold_1()
{
  __assert_rtn("strnunvisx", "unvis.c", 504, "src != ((void *)0)");
}

void strnunvisx_cold_2()
{
  __assert_rtn("strnunvisx", "unvis.c", 505, "dst != ((void *)0)");
}

void strnunvisx_cold_3()
{
}

void istrsenvisx_cold_1()
{
  __assert_rtn("istrsenvisx", "vis.c", 394, "mbdstp != ((void *)0)");
}

void istrsenvisx_cold_2()
{
  __assert_rtn("istrsenvisx", "vis.c", 395, "mbsrc != ((void *)0) || mblength == 0");
}

void istrsenvisx_cold_3()
{
  __assert_rtn("istrsenvisx", "vis.c", 396, "mbextra != ((void *)0)");
}

void istrsenvisx_cold_4()
{
}

void lookup_substsearch_cold_1()
{
  __assert_rtn("lookup_substsearch", "collate.c", 596, "p->val == key");
}

void localeconv_l_cold_2()
{
}

void memstream_update_cold_1()
{
  __assert_rtn("memstream_update", "open_memstream.c", 96, "ms->len >= 0 && ms->offset >= 0");
}

void memstream_seek_cold_1()
{
  __assert_rtn("memstream_seek", "open_memstream.c", 136, "pos >= 0");
}

void memstream_seek_cold_2()
{
  __assert_rtn("memstream_seek", "open_memstream.c", 141, "pos == 0");
}

void inet_net_pton_cold_1()
{
  __assert_rtn("inet_net_pton_ipv4", "inet_net_pton.c", 110, "n >= 0 && n <= 9");
}

void inet_net_pton_cold_2()
{
  __assert_rtn("inet_net_pton_ipv4", "inet_net_pton.c", 139, "n >= 0 && n <= 9");
}

void inet_net_pton_cold_3()
{
  __assert_rtn("inet_net_pton_ipv4", "inet_net_pton.c", 87, "n >= 0 && n <= 15");
}

void setipv4sourcefilter_cold_1()
{
  __assert_rtn("setipv4sourcefilter", "sourcefilter.c", 160, "s != -1");
}

void __inaddr_to_index_cold_1()
{
  __assert_rtn("__inaddr_to_index", "sourcefilter.c", 134, "ifindex != 0");
}

void getipv4sourcefilter_cold_1()
{
  __assert_rtn("getipv4sourcefilter", "sourcefilter.c", 229, "s != -1");
}

void getipv4sourcefilter_cold_2()
{
  __assert_rtn("getipv4sourcefilter", "sourcefilter.c", 230, "fmode != NULL");
}

void getipv4sourcefilter_cold_3()
{
  __assert_rtn("getipv4sourcefilter", "sourcefilter.c", 231, "numsrc != NULL");
}

void _mkstemp_dprotected_np_action_cold_1()
{
  __assert_rtn("_mkstemp_dprotected_np_action", "mktemp.c", 321, "dfd == AT_FDCWD");
}

void perror(const char *a1)
{
  if (a1)
  {
    uint64_t v3 = (char **)v10;
    if (*a1)
    {
      v10[0] = a1;
      v10[1] = j__strsignal_r((int)a1, v1, v2);
      sigset_t v10[2] = ": ";
      v10[3] = 2;
      uint64_t v3 = (char **)&v11;
    }
  }
  else
  {
    uint64_t v3 = (char **)v10;
  }
  int v4 = __error();
  strerror_r(*v4, __strerrbuf, 0x800uLL);
  *uint64_t v3 = __strerrbuf;
  uint64_t v7 = j__strsignal_r((int)__strerrbuf, v5, v6);
  v3[2] = "\n";
  uint64_t v8 = v3 + 2;
  *(v8 - 1) = v7;
  v8[1] = 1;
  flockfile(__stderrp);
  __sflush((uint64_t)__stderrp);
  writev_NOCANCEL();
  uint64_t v9 = __stderrp;
  __stderrp->_flags &= ~0x1000u;
  funlockfile(v9);
}

void __vfprintf_cold_1(uint64_t *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14CD0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg(*a1);
  __break(1u);
}

void wmemstream_update_cold_1()
{
  __assert_rtn("wmemstream_update", "open_wmemstream.c", 86, "ms->len >= 0 && ms->offset >= 0");
}

void wmemstream_seek_cold_1()
{
  __assert_rtn("wmemstream_seek", "open_wmemstream.c", 183, "pos >= 0");
}

void wmemstream_seek_cold_2()
{
  __assert_rtn("wmemstream_seek", "open_wmemstream.c", 188, "pos == 0");
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  if (a1 != 255)
  {
    uint64_t v12 = &rerrs;
    do
    {
      int v14 = *v12;
      v12 += 6;
      int v13 = v14;
      if (v14) {
        BOOL v15 = v13 == (a1 & 0xFFFFFEFF);
      }
      else {
        BOOL v15 = 1;
      }
    }
    while (!v15);
    if ((a1 & 0x100) == 0)
    {
      uint64_t v9 = (char *)*((void *)v12 - 1);
      goto LABEL_21;
    }
    if (v13)
    {
      uint64_t v9 = __big;
      j__strnstr(__big, *((const char **)v12 - 2), (size_t)a3);
      goto LABEL_21;
    }
    uint64_t v20 = a1 & 0xFFFFFEFF;
    uint64_t v16 = "REG_0x%x";
    goto LABEL_20;
  }
  re_endp = a2->re_endp;
  if (!j__strncasecmp_l("REG_NOMATCH", re_endp, (size_t)a3, (locale_t)a4))
  {
    uint64_t v10 = 1;
LABEL_18:
    uint64_t v20 = v10;
    uint64_t v16 = "%d";
LABEL_20:
    uint64_t v9 = __big;
    sprintf(__big, v16, v20);
    goto LABEL_21;
  }
  uint64_t v8 = (const char **)off_1E543EF10;
  uint64_t v9 = "0";
  while (1)
  {
    uint64_t v10 = *((unsigned int *)v8 - 2);
    if (!v10) {
      break;
    }
    uint64_t v11 = *v8;
    v8 += 3;
    if (!j__strncasecmp_l(v11, re_endp, (size_t)a3, v7)) {
      goto LABEL_18;
    }
  }
LABEL_21:
  unint64_t v18 = j__strsignal_r((int)v9, (char *)a2, (size_t)a3) + 1;
  if (a4)
  {
    if (v18 >= a4)
    {
      j__strtod(a3, (char **)v9);
      a3[a4 - 1] = 0;
    }
    else
    {
      j__strnstr(a3, v9, v17);
    }
  }
  return v18;
}

void abort(void)
{
  if (!qword_1E9119F68) {
    qword_1E9119F68 = (uint64_t)"abort() called";
  }
  uint64_t v0 = pthread_self();
  if (__cleanup) {
    _cleanup();
  }
  OUTLINED_FUNCTION_0_0(-1569, v1, v2, HIDWORD(v2), 0, 0);
  __pthread_workqueue_setkill();
  pthread_sigmask(3, (const sigset_t *)&v3, 0);
  pthread_kill(v0, 6);
  usleep_NOCANCEL(0x2710u);
  __abort();
}

void __abort()
{
  if (!qword_1E9119F68) {
    qword_1E9119F68 = (uint64_t)"__abort() called";
  }
  uint64_t v0 = pthread_self();
  v3.__sigaction_u.__sa_handler = 0;
  *(void *)&v3.sa_masuint64_t k = 0xFFFFFFFFLL;
  sigaction(6, &v3, 0);
  OUTLINED_FUNCTION_0_0(v3.sa_mask & 0xFFFFFFDF, v1, v2, HIDWORD(v2), (uint64_t)v3.__sigaction_u.__sa_handler, v3.sa_mask);
  __pthread_workqueue_setkill();
  pthread_sigmask(3, &v3.sa_mask, 0);
  pthread_kill(v0, 6);
  usleep_NOCANCEL(0x2710u);
  v3.sa_masuint64_t k = -25;
  sigprocmask(3, &v3.sa_mask, 0);
  __break(1u);
}

void abort_report_np(uint64_t a1)
{
  if (_simple_salloc())
  {
    _simple_vsprintf();
    a1 = _simple_string();
  }
  qword_1E9119F68 = a1;
  abort();
}

void atexit_register_cold_1()
{
}

void getopt_internal_cold_1()
{
  if (getopt_internal_posixly_correct) {
    warnx("illegal option -- %c");
  }
  else {
    warnx("invalid option -- %c");
  }
}

void ptsname_cold_2()
{
  uint64_t v0 = _os_assert_log();
  _os_crash((uint64_t)v0);
  __break(1u);
}

void _psort_cold_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  abort_report_np((uint64_t)"%s:%s:%u: %s: getargs: %s");
}

void _psort_cold_1_0()
{
  uint64_t v0 = __error();
  strerror(*v0);
  abort_report_np((uint64_t)"%s:%s:%u: %s: getargs: %s");
}

void _psort_cold_1_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  abort_report_np((uint64_t)"%s:%s:%u: %s: getargs: %s");
}

void __printf_arginfo_errno_cold_1()
{
  __assert_rtn("__printf_arginfo_errno", "xprintf_errno.c", 44, "n >= 1");
}

void __printf_arginfo_float_cold_1()
{
}

void __printf_render_float_cold_1()
{
  __assert_rtn("__printf_render_float", "xprintf_float.c", 263, "pi->spec == 'f'");
}

void __printf_arginfo_hexdump_cold_1()
{
  __assert_rtn("__printf_arginfo_hexdump", "xprintf_hexdump.c", 42, "n >= 2");
}

void __printf_arginfo_int_cold_1()
{
}

void __printf_render_int_cold_1(uint64_t a1)
{
  fprintf(__stderrp, "pi->spec = '%c'\n", a1);
  __assert_rtn("__printf_render_int", "xprintf_int.c", 328, "1 == 0");
}

void __printf_render_int_cold_2()
{
  __assert_rtn("__ultoa", "xprintf_int.c", 162, "base == 16");
}

void __printf_arginfo_ptr_cold_1()
{
}

void __printf_arginfo_quote_cold_1()
{
  __assert_rtn("__printf_arginfo_quote", "xprintf_quote.c", 45, "n >= 1");
}

void __printf_arginfo_str_cold_1()
{
}

void __printf_arginfo_chr_cold_1()
{
}

void __printf_arginfo_time_cold_1()
{
  __assert_rtn("__printf_arginfo_time", "xprintf_time.c", 48, "n >= 1");
}

void __printf_arginfo_vis_cold_1()
{
  __assert_rtn("__printf_arginfo_vis", "xprintf_vis.c", 44, "n >= 1");
}

void __printf_arginfo_n_cold_1()
{
  __assert_rtn("__printf_arginfo_n", "xprintf.c", 233, "n >= 1");
}

void _setutxent_cold_1()
{
}

void _setutxent_cold_2()
{
}

void _endutxent_cold_1()
{
}

void _endutxent_cold_2()
{
}

void _getutxent_cold_1()
{
}

void _getutxent_cold_2()
{
}

void _getutxid_cold_1()
{
}

void _getutxid_cold_2()
{
}

void _getutxline_cold_1()
{
}

void _getutxline_cold_2()
{
}

void _pututxline_cold_1()
{
}

void _pututxline_cold_2()
{
}

void _utmpxname_cold_1()
{
}

void _utmpxname_cold_2()
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40CF6D8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t __commpage_gettimeofday()
{
  return MEMORY[0x1F40CFD50]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40CFD60]();
}

void __exit()
{
}

uint64_t __fcntl()
{
  return MEMORY[0x1F40CFD78]();
}

uint64_t __fcntl_nocancel()
{
  return MEMORY[0x1F40CFD80]();
}

uint64_t __fork()
{
  return MEMORY[0x1F40CFD88]();
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x1F40D0618](a1);
}

uint64_t __getdirentries64()
{
  return MEMORY[0x1F40CFD98]();
}

uint64_t __getlogin()
{
  return MEMORY[0x1F40CFDA0]();
}

uint64_t __gettimeofday()
{
  return MEMORY[0x1F40CFDA8]();
}

uint64_t __mkdir_extended()
{
  return MEMORY[0x1F40CFDD0]();
}

uint64_t __mkfifo_extended()
{
  return MEMORY[0x1F40CFDD8]();
}

uint64_t __open_extended()
{
  return MEMORY[0x1F40CFDE8]();
}

uint64_t __os_log_simple_offset()
{
  return MEMORY[0x1F40D0708]();
}

uint64_t __pthread_workqueue_setkill()
{
  return MEMORY[0x1F40D0868]();
}

uint64_t __semwait_signal()
{
  return MEMORY[0x1F40CFE10]();
}

uint64_t __semwait_signal_nocancel()
{
  return MEMORY[0x1F40CFE18]();
}

uint64_t __setlogin()
{
  return MEMORY[0x1F40CFE30]();
}

uint64_t __settimeofday()
{
  return MEMORY[0x1F40CFE38]();
}

uint64_t __sysctl()
{
  return MEMORY[0x1F40CFE50]();
}

uint64_t __thread_selfusage()
{
  return MEMORY[0x1F40CFE58]();
}

uint64_t __umask_extended()
{
  return MEMORY[0x1F40CFE70]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1F40CF5B8]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1F40CF5C8]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1F40CF5D0]();
}

uint64_t _dyld_images_for_addresses()
{
  return MEMORY[0x1F40CF5E0]();
}

void _exit(int a1)
{
}

uint64_t _get_cpu_capabilities()
{
  return MEMORY[0x1F40CFE98]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1F40D0718]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40D0AD8]();
}

uint64_t _os_once()
{
  return MEMORY[0x1F40D0728]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1F40D0798]();
}

uint64_t _simple_asl_log_prog()
{
  return MEMORY[0x1F40D07A0]();
}

uint64_t _simple_asl_msg_new()
{
  return MEMORY[0x1F40D07A8]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x1F40D07B0]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1F40D07B8]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x1F40D07C8]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x1F40D07D0]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x1F40D07D8]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x1F40D07E0]();
}

uint64_t _simple_string()
{
  return MEMORY[0x1F40D07F0]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x1F40D0800]();
}

uint64_t _tlv_exit()
{
  return MEMORY[0x1F40CF600]();
}

uint64_t abort_with_payload()
{
  return MEMORY[0x1F40CFEA0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CFEB8](a1, *(void *)&a2);
}

void asl_append(asl_object_t obj, asl_object_t obj_to_add)
{
}

const char *__cdecl asl_get(asl_object_t msg, const char *key)
{
  return (const char *)MEMORY[0x1F40CF680](msg, key);
}

asl_object_t asl_match(asl_object_t data, asl_object_t querylist, size_t *last, size_t start, size_t count, uint32_t duration, int32_t direction)
{
  return (asl_object_t)MEMORY[0x1F40CF688](data, querylist, last, start, count, *(void *)&duration, *(void *)&direction);
}

asl_object_t asl_new(uint32_t type)
{
  return (asl_object_t)MEMORY[0x1F40CF690](*(void *)&type);
}

asl_object_t asl_next(asl_object_t obj)
{
  return (asl_object_t)MEMORY[0x1F40CF698](obj);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x1F40CF6A0](ident, facility, *(void *)&opts);
}

void asl_release(asl_object_t obj)
{
}

int asl_send(asl_object_t obj, asl_object_t msg)
{
  return MEMORY[0x1F40CF6B0](obj, msg);
}

int asl_set(asl_object_t obj, const char *key, const char *value)
{
  return MEMORY[0x1F40CF6B8](obj, key, value);
}

int asl_set_query(asl_object_t msg, const char *key, const char *value, uint32_t op)
{
  return MEMORY[0x1F40CF6C8](msg, key, value, *(void *)&op);
}

kern_return_t bootstrap_parent(mach_port_t bp, mach_port_t *parent_port)
{
  return MEMORY[0x1F40D0B50](*(void *)&bp, parent_port);
}

char *__cdecl j__catgets(nl_catd a1, int a2, int a3, const char *a4)
{
  while (1)
    ;
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CF3C0]();
}

uint64_t ccrng_uniform()
{
  return MEMORY[0x1F40CF3C8]();
}

int chdir(const char *a1)
{
  return MEMORY[0x1F40CFED0](a1);
}

kern_return_t clock_get_time(clock_serv_t clock_serv, mach_timespec_t *cur_time)
{
  return MEMORY[0x1F40CFEE0](*(void *)&clock_serv, cur_time);
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1F40CFEF0]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CF448](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CF458]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CF460](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CF608](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CF620](__path, *(void *)&__mode);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1F40CFF20](*(void *)&a1, *(void *)&a2);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1F40CF638]();
}

int execve(const char *__file, char *const *__argv, char *const *__envp)
{
  return MEMORY[0x1F40CFF28](__file, __argv, __envp);
}

int fchdir(int a1)
{
  return MEMORY[0x1F40CFF30](*(void *)&a1);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x1F40CFF38](*(void *)&a1, a2, a3, *(void *)&a4);
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x1F40CFF50]();
}

int fegetenv(fenv_t *a1)
{
  return MEMORY[0x1F40D0620](a1);
}

int fegetround(void)
{
  return MEMORY[0x1F40D0628]();
}

int fesetenv(const fenv_t *a1)
{
  return MEMORY[0x1F40D0630](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CFF58](*(void *)&a1, a2, a3, *(void *)&a4);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1F40D0810](a1);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CFF78](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CFF88](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1F40CFF90](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1F40CFF98](*(void *)&a1, a2);
}

uint64_t fsync_NOCANCEL()
{
  return MEMORY[0x1F40CFFA8]();
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CFFB0](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CFFB8](a1, a2, a3, a4, *(void *)&a5);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1F40CFFC0](*(void *)&a1, a2, a3, a4, a5);
}

int getdtablesize(void)
{
  return MEMORY[0x1F40CFFC8]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CFFE0]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1F40CFFE8](a1, *(void *)&a2, *(void *)&a3);
}

group *__cdecl getgrgid(gid_t a1)
{
  return (group *)MEMORY[0x1F40CFCD8](*(void *)&a1);
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x1F40CFCE0](a1);
}

uint64_t getgroupcount()
{
  return MEMORY[0x1F40CFCE8]();
}

int getgrouplist(const char *a1, int a2, int *a3, int *a4)
{
  return MEMORY[0x1F40CFCF0](a1, *(void *)&a2, a3, a4);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CFCF8](a1);
}

pid_t getpgrp(void)
{
  return MEMORY[0x1F40CFFF8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40D0000]();
}

int getpriority(int a1, id_t a2)
{
  return MEMORY[0x1F40D0008](*(void *)&a1, *(void *)&a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CFD00](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CFD10](*(void *)&a1);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CFD18](*(void *)&a1, a2, a3, a4, a5);
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1F40D0010](*(void *)&a1, a2);
}

int getrusage(int a1, rusage *a2)
{
  return MEMORY[0x1F40D0018](*(void *)&a1, a2);
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1F40CF668](mhp, segname, sectname, size);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1F40D0028](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40D0030]();
}

kern_return_t host_get_clock_service(host_t host, clock_id_t clock_id, clock_serv_t *clock_serv)
{
  return MEMORY[0x1F40D0050](*(void *)&host, *(void *)&clock_id, clock_serv);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1F40CFD20](a1);
}

in_addr_t j__inet_lnaof(in_addr a1)
{
  while (1)
    ;
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40D0078](*(void *)&a1, a2);
}

int issetugid(void)
{
  return MEMORY[0x1F40D0080]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1F40D00A8](*(void *)&a1, *(void *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40D00E8](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40D00F0](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40D00F8]();
}

uint64_t mach_approximate_time(void)
{
  return MEMORY[0x1F40D0100]();
}

uint64_t mach_boottime_usec()
{
  return MEMORY[0x1F40D0108]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1F40D0110]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40D0118]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40D0120](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40D0170]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40D01A8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40D01E8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0670](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0678](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0688](ptr, size, type_id);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1F40CFD28](*(void *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1F40CFD30](*(void *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x1F40CFD38](uu, uid_or_gid, id_type);
}

int j__mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  while (1)
    ;
}

int j__mkdirx_np(const char *a1, filesec_t a2)
{
  while (1)
    ;
}

char *__cdecl j__mkdtemp(char *a1)
{
  while (1)
    ;
}

char *__cdecl j__mkdtempat_np(int dfd, char *path)
{
  while (1)
    ;
}

int j__mkostemp(char *path, int oflags)
{
  while (1)
    ;
}

int j__mkostemps(char *path, int slen, int oflags)
{
  while (1)
    ;
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1F40D02D8](*(void *)&a1, a2, a3);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40D02E0](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40D02F8](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40D06B8](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1F40D06C0](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40D06C8](*(void *)&token, state64);
}

uint64_t notify_monitor_file()
{
  return MEMORY[0x1F40D06D0]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40D06E0](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40D06E8](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40D0700](*(void *)&token, state64);
}

uint64_t open_NOCANCEL()
{
  return MEMORY[0x1F40D0310]();
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40D0318](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

uint64_t openat_NOCANCEL()
{
  return MEMORY[0x1F40D0328]();
}

uint64_t os_log_pack_send_and_compose()
{
  return MEMORY[0x1F40D0B00]();
}

uint64_t os_log_simple_type_from_asl()
{
  return MEMORY[0x1F40D0818]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40D0B10](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40D0838]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pathconf(const char *a1, int a2)
{
  return MEMORY[0x1F40D0340](a1, *(void *)&a2);
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40D0350](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1F40D0358](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1F40D0360](a1, *(void *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1F40D0368](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1F40D0370](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1F40D0378](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x1F40D0380](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x1F40D0388](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x1F40D0390](a1, a2);
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x1F40D0398](a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x1F40D03A0](a1, a2);
}

uint64_t pread_NOCANCEL()
{
  return MEMORY[0x1F40D03B0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40D03B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t pthread_fchdir_np()
{
  return MEMORY[0x1F40D0958]();
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  return (void *)MEMORY[0x1F40D0960](a1);
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  return MEMORY[0x1F40D0968](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40D0970](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40D0988](a1, a2);
}

uint64_t pthread_key_init_np()
{
  return MEMORY[0x1F40D0990]();
}

int pthread_kill(pthread_t a1, int a2)
{
  return MEMORY[0x1F40D0998](a1, *(void *)&a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40D09A8](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40D09B0](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40D09B8](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40D09C0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40D09C8](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40D09D0](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40D09E0](a1);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40D09E8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40D09F0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40D09F8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40D0A00]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40D0A10](a1, a2);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1F40D0A18](*(void *)&a1, a2, a3);
}

uintptr_t pthread_stack_frame_decode_np(uintptr_t frame_addr, uintptr_t *return_addr)
{
  return MEMORY[0x1F40D0A20](frame_addr, return_addr);
}

void pthread_testcancel(void)
{
}

uint64_t pwrite_NOCANCEL()
{
  return MEMORY[0x1F40D03D8]();
}

uint64_t read_NOCANCEL()
{
  return MEMORY[0x1F40D03E0]();
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40D03E8](a1, a2, a3);
}

uint64_t reallocarray_DARWIN_EXTSN()
{
  return MEMORY[0x1F40D06A8]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40D06B0](__ptr, __size);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1F40D03F8](a1);
}

uint64_t select_NOCANCEL()
{
  return MEMORY[0x1F40D0400]();
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1F40D0408](*(void *)&task, semaphore, *(void *)&policy, *(void *)&value);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40D0438](a1, a2, a3, a4, *(void *)&a5);
}

int setitimer(int a1, const itimerval *a2, itimerval *a3)
{
  return MEMORY[0x1F40D0448](*(void *)&a1, a2, a3);
}

int setpgid(pid_t a1, pid_t a2)
{
  return MEMORY[0x1F40D0450](*(void *)&a1, *(void *)&a2);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x1F40D0458](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int setregid(gid_t a1, gid_t a2)
{
  return MEMORY[0x1F40D0460](*(void *)&a1, *(void *)&a2);
}

int setreuid(uid_t a1, uid_t a2)
{
  return MEMORY[0x1F40D0468](*(void *)&a1, *(void *)&a2);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x1F40D0470](*(void *)&a1, a2);
}

pid_t setsid(void)
{
  return MEMORY[0x1F40D0478]();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40D0480](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1F40D0490](*(void *)&a1, a2, a3);
}

int sigsuspend(const sigset_t *a1)
{
  return MEMORY[0x1F40D0498](a1);
}

uint64_t sigsuspend_NOCANCEL()
{
  return MEMORY[0x1F40D04A0]();
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40D04A8](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x1F40D04B0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40D04B8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40D04C0](a1, a2);
}

int j__strncasecmp(const char *a1, const char *a2, size_t a3)
{
  while (1)
    ;
}

int j__strncasecmp_l(const char *a1, const char *a2, size_t a3, locale_t a4)
{
  while (1)
    ;
}

char *__cdecl j__strnstr(const char *__big, const char *__little, size_t __len)
{
  while (1)
    ;
}

char *__cdecl j__strsep(char **__stringp, const char *__delim)
{
  while (1)
    ;
}

char *__cdecl j__strsignal(int __sig)
{
  while (1)
    ;
}

int j__strsignal_r(int __sig, char *__strsignalbuf, size_t __buflen)
{
  while (1)
    ;
}

int j__strsvisx(char *a1, const char *a2, size_t a3, int a4, const char *a5)
{
  while (1)
    ;
}

double j__strtod(const char *a1, char **a2)
{
  while (1)
    ;
}

void j__strtoencf16()
{
  while (1)
    ;
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return MEMORY[0x1F40D04F8](*(void *)&task, *(void *)&which_port, *(void *)&special_port);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1F40D0518](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40D0520](a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1F40D0528](a1, a2);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40D0530](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_region_64(vm_map_read_t target_task, vm_address_t *address, vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x1F40D0550](*(void *)&target_task, address, size, *(void *)&flavor, info, infoCnt, object_name);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return MEMORY[0x1F40D0560](*(void *)&a1, a2, *(void *)&a3, a4);
}

uint64_t write_NOCANCEL()
{
  return MEMORY[0x1F40D0600]();
}

uint64_t writev_NOCANCEL()
{
  return MEMORY[0x1F40D0610]();
}