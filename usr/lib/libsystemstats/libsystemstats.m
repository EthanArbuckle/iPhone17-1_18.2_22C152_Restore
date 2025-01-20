unint64_t systemstats_foreach_micro(unint64_t a1, uint64_t a2, char a3, void *a4)
{
  unsigned int (**v7)(id, unint64_t, unint64_t, unint64_t, unint64_t);
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;

  v7 = a4;
  if ((a2 & 0x8000000000000000) == 0)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = a1 + a2;
    v13 = a1;
    while (v13 != v12 || (a3 & 1) == 0)
    {
      if (v13 != v12)
      {
        if (v13 + 4 > v12) {
          break;
        }
        v8 = *(_DWORD *)v13;
      }
      v14 = v8 == 835010577 || v13 == v12;
      if (v14 && v11)
      {
        if (!v7[2](v7, v11, v10, v9, v13 - v11)) {
          break;
        }
        v11 = 0;
        v10 = 0;
        v9 = 0;
        a1 = v13;
      }
      if (v13 == v12) {
        break;
      }
      switch(v8)
      {
        case -557122643:
          v15 = v13 + 293;
          if (v13 + 293 <= v12)
          {
            v16 = *(_DWORD *)(v13 + 56);
            v17 = v15 + 20 * v16;
            v15 += 24 * v16;
            if ((*(unsigned char *)(v13 + 80) & 1) == 0) {
              v15 = v17;
            }
          }
          v10 = v13;
          break;
        case -17958194:
          v15 = v13 + 316;
          if (v13 + 316 <= v12)
          {
            v18 = 324;
            if ((*(unsigned char *)(v13 + 68) & 4) == 0) {
              v18 = 316;
            }
            if ((*(unsigned char *)(v13 + 68) & 2) != 0) {
              v19 = 4;
            }
            else {
              v19 = 3;
            }
            v20 = v13 + v18 + ((unint64_t)*(unsigned int *)(v13 + 4) << v19);
            if (*(unsigned char *)(v13 + 68))
            {
              if ((*(unsigned char *)(v13 + 68) & 8) != 0) {
                v21 = 3;
              }
              else {
                v21 = 4;
              }
            }
            else
            {
              v21 = 2;
              if ((*(unsigned char *)(v13 + 68) & 8) == 0) {
                v21 = 3;
              }
            }
            v15 = v20 + ((unint64_t)*(unsigned int *)(v13 + 8) << v21);
          }
          v9 = v13;
          break;
        case 835010577:
          v15 = v13 + 27;
          v11 = v13;
          break;
        default:
          a1 = 0;
          goto LABEL_44;
      }
      if (v15 <= v12)
      {
        v13 = v15;
        if (v15 >= a1) {
          continue;
        }
      }
      break;
    }
  }
LABEL_44:

  return a1;
}

unint64_t sub_21FAB232C(unint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 200))
  {
    unint64_t v1 = result;
    uint64_t v2 = now_in_absolute_milliseconds();
    v5.tv_sec = 0;
    *(void *)&v5.tv_usec = 0;
    systemstats_gettimeofday(&v5, 0);
    BOOL v3 = sub_21FAB25EC(*(void **)(v1 + 32), v2, &v5);
    uint64_t v4 = *(void *)(v1 + 32);
    if (v3)
    {
      sub_21FAB5E50(v4, v2, &v5, 0);
      uint64_t v4 = *(void *)(v1 + 32);
      if (*(unsigned char *)(*(void *)(v4 + 8) + 16))
      {
        sub_21FAB5FD4(v4, 0, 0, 0, 0);
        uint64_t v4 = *(void *)(v1 + 32);
      }
    }
    result = _systemstats_retried_write(v4, *(void **)(v1 + 40), *(void *)(v1 + 48));
    *(void *)(*(void *)(v1 + 32) + 176) = v2;
  }
  return result;
}

unint64_t _systemstats_retried_write(uint64_t a1, void *a2, size_t __nbyte)
{
  int v4 = *(_DWORD *)(a1 + 88);
  if (v4 == -1 || *(unsigned char *)(a1 + 200)) {
    return 0;
  }
  unint64_t v5 = __nbyte;
  if ((*(unsigned char *)(*(void *)(a1 + 8) + 16) & 2) == 0)
  {
    sub_21FAB5D5C(v4, a2, __nbyte);
    *(int64x2_t *)(a1 + 112) = vaddq_s64(*(int64x2_t *)(a1 + 112), vdupq_n_s64(v5));
LABEL_11:
    nullsub_1(*(unsigned int *)(a1 + 88));
    return v5;
  }
  gzwrite(*(gzFile *)(a1 + 184), a2, __nbyte);
  uint64_t v6 = MEMORY[0x223C58730](*(void *)(a1 + 184));
  if (v6 < 1) {
    goto LABEL_11;
  }
  uint64_t v7 = *(void *)(a1 + 112);
  BOOL v8 = __OFSUB__(v6, v7);
  uint64_t v9 = v6 - v7;
  if (v9 < 0 == v8)
  {
    uint64_t v11 = v9 + *(void *)(a1 + 120);
    *(void *)(a1 + 112) = v6;
    *(void *)(a1 + 120) = v11;
    goto LABEL_11;
  }
  *(unsigned char *)(a1 + 200) = 1;
  v10 = *(NSObject **)(a1 + 104);
  if (v10)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_21FAB5DF4;
    block[3] = &unk_264526F70;
    block[4] = a1;
    dispatch_async(v10, block);
    goto LABEL_11;
  }
  return 0;
}

void systemstats_write_microstackshot(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = *(NSObject **)(a1 + 104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_21FAB232C;
  block[3] = &unk_264526F90;
  block[4] = a1;
  void block[5] = a2;
  block[6] = a3;
  dispatch_sync(v3, block);
}

uint64_t now_in_absolute_milliseconds()
{
  uint64_t v0 = systemstats_mach_absolute_time();
  unint64_t v1 = sub_21FAB25A4();
  return *v1 * v0 / v1[1];
}

uint64_t *sub_21FAB25A4()
{
  if (qword_26AC12B38 != -1) {
    dispatch_once(&qword_26AC12B38, &unk_26D14E8D8);
  }
  return &qword_26AC12B40;
}

BOOL sub_21FAB25EC(void *a1, unint64_t a2, void *a3)
{
  unint64_t v3 = a1[22];
  if (a2 < v3) {
    sub_21FAB8250();
  }
  uint64_t v4 = a1[1];
  if ((*(unsigned char *)(v4 + 16) & 4) != 0) {
    return 0;
  }
  if (v3 && a2 - v3 < *(void *)(v4 + 24))
  {
    unint64_t v5 = a1[14];
  }
  else
  {
    unint64_t v5 = a1[14];
    if (v5 >= a1[16]) {
      return 1;
    }
  }
  if (v5 < *(void *)(v4 + 32)) {
    return *a3 - a1[17] > 86400;
  }
  return 1;
}

unint64_t absolute_time_to_absolute_milliseconds(uint64_t a1)
{
  uint64_t v2 = sub_21FAB25A4();
  return *v2 * a1 / (unint64_t)v2[1];
}

double absolute_time_to_absolute_milliseconds_double(unint64_t a1)
{
  uint64_t v2 = (unint64_t *)sub_21FAB25A4();
  return (double)a1 * (double)*v2 / (double)v2[1];
}

uint64_t now_in_continuous_milliseconds()
{
  uint64_t v0 = systemstats_mach_continuous_time();
  unint64_t v1 = sub_21FAB25A4();
  return *v1 * v0 / v1[1];
}

void *_systemstats_writers()
{
  if (qword_267EF5A30 != -1) {
    dispatch_once(&qword_267EF5A30, &unk_26D14E8B8);
  }
  return &unk_267EF54F0;
}

uint64_t sub_21FAB2764()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  if (result) {
    qword_267EF5810 = 0x40000000;
  }
  return result;
}

double sub_21FAB2794(uint64_t a1, int a2)
{
  *(void *)&double result = 4;
  *(_OWORD *)a1 = xmmword_21FAB8B20;
  *(_DWORD *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a1 + 32;
  return result;
}

void sub_21FAB27B0(void *a1)
{
  if (*a1 >= 0x4000uLL) {
    sub_21FAB7128();
  }
  uint64_t v2 = (void *)a1[3];
  if (v2 != a1 + 4)
  {
    free(v2);
  }
}

uint64_t sub_21FAB2800(uint64_t result, size_t *a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = a3;
    unint64_t v5 = (8 * result);
    do
    {
      char __src = v5 & 0x7F | ((v5 > 0x7F) << 7);
      sub_21FAB29E8(a2, &__src, 1uLL);
      BOOL v6 = v5 >= 0x7F;
      BOOL v7 = v5 == 127;
      v5 >>= 7;
    }
    while (!v7 && v6);
    do
    {
      char v9 = v3 & 0x7F | ((v3 > 0x7F) << 7);
      double result = (uint64_t)sub_21FAB29E8(a2, &v9, 1uLL);
      BOOL v6 = v3 >= 0x7F;
      BOOL v7 = v3 == 127;
      v3 >>= 7;
    }
    while (!v7 && v6);
  }
  return result;
}

void *sub_21FAB28A0(void *result, size_t *a2, void *a3, size_t a4)
{
  if (a3 && a4)
  {
    unint64_t v7 = (8 * result) | 2u;
    do
    {
      char __src = v7 & 0x7F | ((v7 > 0x7F) << 7);
      sub_21FAB29E8(a2, &__src, 1uLL);
      BOOL v8 = v7 > 0x7F;
      v7 >>= 7;
    }
    while (v8);
    size_t v9 = 16382 - *a2;
    if (a4 >= v9)
    {
      if (a4 != v9) {
        _os_assumes_log();
      }
      unint64_t v12 = v9;
      do
      {
        char v15 = v12 & 0x7F | ((v12 > 0x7F) << 7);
        sub_21FAB29E8(a2, &v15, 1uLL);
        BOOL v8 = v12 > 0x7F;
        v12 >>= 7;
      }
      while (v8);
    }
    else
    {
      unint64_t v10 = a4;
      do
      {
        char v14 = v10 & 0x7F | ((v10 > 0x7F) << 7);
        sub_21FAB29E8(a2, &v14, 1uLL);
        BOOL v11 = v10 >= 0x80;
        v10 >>= 7;
      }
      while (v11);
      size_t v9 = a4;
    }
    return sub_21FAB29E8(a2, a3, v9);
  }
  return result;
}

void *sub_21FAB29E8(size_t *a1, void *__src, size_t __n)
{
  if (__n >> 14 || (size_t v5 = *a1, v6 = *a1 + __n, v6 >= 0x4000)) {
    abort();
  }
  unint64_t v8 = a1[1];
  size_t v9 = (size_t *)a1[3];
  if (v6 > v8)
  {
    if (v9 == a1 + 4) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = (void *)a1[3];
    }
    unint64_t v11 = 2 * v8;
    if (v11 > v6) {
      unint64_t v6 = v11;
    }
    if (v6 >= 0x3FFF) {
      size_t v12 = 0x3FFFLL;
    }
    else {
      size_t v12 = v6;
    }
    a1[1] = v12;
    v13 = (size_t *)reallocf(v10, v12);
    a1[3] = (size_t)v13;
    if (!v13) {
      sub_21FAB7128();
    }
    size_t v9 = v13;
    size_t v5 = *a1;
    if (!v10) {
      memcpy(v13, a1 + 4, *a1);
    }
  }
  double result = memcpy((char *)v9 + v5, __src, __n);
  size_t v15 = a1[1];
  size_t v16 = *a1 + __n;
  *a1 = v16;
  if (v16 > v15) {
    sub_21FAB7128();
  }
  return result;
}

void *sub_21FAB2AD4(void *result, size_t *a2, char *__s)
{
  if (__s)
  {
    size_t v5 = result;
    size_t v6 = strlen(__s);
    return sub_21FAB28A0(v5, a2, __s, v6);
  }
  return result;
}

uint64_t sub_21FAB2B34(uint64_t a1)
{
  uint64_t v2 = *(void *)a1 - 4;
  if (*(void *)a1 == 4) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = (flsll(*(void *)a1 - 4) - 1) / 7 + 1;
  }
  unint64_t v4 = (8 * *(_DWORD *)(a1 + 16)) | 2u;
  int v5 = (flsll(v4) - 1) / 7 + 1;
  unint64_t v6 = v3 + v5;
  if (v6 >= 5) {
    sub_21FAB7128();
  }
  uint64_t v7 = 4 - v3;
  *(void *)a1 = v7 - v5;
  do
  {
    char __src = v4 & 0x7F | ((v4 > 0x7F) << 7);
    sub_21FAB29E8((size_t *)a1, &__src, 1uLL);
    BOOL v8 = v4 > 0x7F;
    v4 >>= 7;
  }
  while (v8);
  if (*(void *)a1 != v7) {
    sub_21FAB7128();
  }
  unint64_t v9 = v2;
  do
  {
    char v12 = v9 & 0x7F | ((v9 > 0x7F) << 7);
    sub_21FAB29E8((size_t *)a1, &v12, 1uLL);
    BOOL v8 = v9 > 0x7F;
    v9 >>= 7;
  }
  while (v8);
  if (*(void *)a1 != 4) {
    sub_21FAB7128();
  }
  *(void *)a1 = v6 + v2;
  return *(void *)(a1 + 24) - v6 + 4;
}

double systemstats_create_record(int a1)
{
  uint64_t v2 = malloc_type_malloc(0xA0uLL, 0x10100405638ECB9uLL);
  *(void *)&double result = 4;
  *(_OWORD *)uint64_t v2 = xmmword_21FAB8B20;
  v2[4] = a1;
  *((void *)v2 + 3) = v2 + 8;
  return result;
}

void systemstats_insert_and_dispose_subrecord(size_t *a1, uint64_t a2)
{
  sub_21FAB28A0((void *)*(unsigned int *)(a2 + 16), a1, (void *)(*(void *)(a2 + 24) + 4), *(void *)a2 - 4);
  sub_21FAB27B0((void *)a2);

  free((void *)a2);
}

void systemstats_write_and_dispose_record(unsigned char *a1, uint64_t *a2)
{
  if (a1 && *a1)
  {
    uint64_t v4 = sub_21FAB2B34((uint64_t)a2);
    _systemstats_queued_write((uint64_t)a1, v4, *a2);
    sub_21FAB27B0(a2);
    free(a2);
  }
  else
  {
    _os_assumes_log();
  }
}

void systemstats_dispose_record(void *a1)
{
  sub_21FAB27B0(a1);

  free(a1);
}

uint64_t systemstats_write_checkpoint(unsigned char *a1)
{
  uint64_t v2 = now_in_absolute_milliseconds();
  uint64_t v3 = malloc_type_malloc(0xA0uLL, 0x10100405638ECB9uLL);
  *(_OWORD *)uint64_t v3 = xmmword_21FAB8B20;
  v3[4] = 36;
  *((void *)v3 + 3) = v3 + 8;
  sub_21FAB2800(1, (size_t *)v3, v2);
  systemstats_write_and_dispose_record(a1, (uint64_t *)v3);
  return v2;
}

void _systemstats_enumerate_files(const char *a1, const char *a2, const char *a3, const char **a4, size_t *a5, uint64_t a6, void *a7)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  char v12 = a7;
  if (a1) {
    v13 = a1;
  }
  else {
    v13 = "/private/var/db/systemstats";
  }
  char v14 = opendir(v13);
  if (v14)
  {
    size_t v15 = v14;
    int v34 = (int)v13;
    int v33 = dirfd(v14);
    size_t v16 = readdir(v15);
    v17 = a2;
    if (v16)
    {
      v18 = v16;
      do
      {
        if (v18->d_type == 8 && v18->d_namlen > 0x27u)
        {
          *(_OWORD *)in = 0u;
          memset(v39, 0, sizeof(v39));
          __strlcpy_chk();
          memset(uu, 0, sizeof(uu));
          if (!uuid_parse(in, uu)
            && (!v17 || !strncmp(v17, in, 0x25uLL))
            && (!a3 || strncmp(a3, in, 0x25uLL))
            && v18->d_name[36] == 46)
          {
            if (!a6) {
              goto LABEL_24;
            }
            v28 = a3;
            uint64_t v31 = a6;
            v32 = v12;
            char v19 = 0;
            v20 = a4;
            unint64_t d_namlen = v18->d_namlen;
            v29 = v20;
            v30 = a5;
            v22 = a5;
            uint64_t v23 = a6;
            v24 = v20;
            do
            {
              size_t v26 = *v22++;
              size_t v25 = v26;
              if (v26 + 38 <= d_namlen && !strncmp(&v18->d_name[37], *v24, v25)) {
                v19 |= v18->d_name[v25 + 37] == 46;
              }
              ++v24;
              --v23;
            }
            while (v23);
            a6 = v31;
            char v12 = v32;
            a4 = v29;
            a5 = v30;
            a3 = v28;
            v17 = a2;
            if (v19)
            {
LABEL_24:
              memset(&v36, 0, sizeof(v36));
              int v27 = sub_21FAB3590(v34, v33, v18->d_name, &v36);
              if (v27)
              {
                if (v27 == -1) {
                  sub_21FAB7144();
                }
              }
              else
              {
                v12[2](v12, (uint64_t)v18->d_name, v18->d_namlen, &v36);
              }
            }
          }
        }
        v18 = readdir(v15);
      }
      while (v18);
    }
    closedir(v15);
  }
  else if (*__error())
  {
    _os_assumes_log();
  }
}

void systemstats_delete_old_files(const char *a1, const char *a2, char *__s, uint64_t a4, void *a5)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v48 = __s;
  if (a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = "/private/var/db/systemstats";
  }
  uint64_t v8 = *a5 - 345600;
  size_t v47 = strlen(__s);
  context = (void *)MEMORY[0x223C58870]();
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = sub_21FAB348C;
  v36[3] = &unk_264526DA8;
  v41 = v7;
  uint64_t v42 = v8;
  id v12 = v9;
  id v37 = v12;
  id v13 = v10;
  id v38 = v13;
  id v14 = v11;
  id v39 = v14;
  uint64_t v40 = &v43;
  _systemstats_enumerate_files(v7, 0, a2, &v48, &v47, 1, v36);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v33;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v15);
        }
        unlink((const char *)[*(id *)(*((void *)&v32 + 1) + 8 * v18++) UTF8String]);
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v50 count:16];
    }
    while (v16);
  }

  unint64_t v19 = 4 * a4;
  if (v44[3] > (unint64_t)(4 * a4))
  {
    [v13 keysSortedByValueUsingSelector:sel_compare_];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v29;
LABEL_14:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = *(id *)(*((void *)&v28 + 1) + 8 * v23);
        unlink((const char *)[v24 UTF8String]);
        size_t v25 = [v14 objectForKeyedSubscript:v24];
        uint64_t v26 = [v25 unsignedIntegerValue];
        v44[3] -= v26;

        if (v44[3] <= v19) {
          break;
        }
        if (v21 == ++v23)
        {
          uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v49 count:16];
          if (v21) {
            goto LABEL_14;
          }
          break;
        }
      }
    }
  }
  _Block_object_dispose(&v43, 8);
}

void sub_21FAB3450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_21FAB348C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 48);
  id v9 = [(id)[NSString alloc] initWithFormat:@"%s/%s", *(void *)(a1 + 64), a2];
  if (v6 >= *(void *)(a1 + 72))
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSince1970:(double)v6];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v9];

    uint64_t v8 = [NSNumber numberWithLongLong:*(void *)(a4 + 96)];
    [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v9];

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += *(void *)(a4 + 96);
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v9];
  }
}

uint64_t sub_21FAB3590(int a1, int a2, char *a3, stat *a4)
{
  return fstatat(a2, a3, a4, 32);
}

uint64_t sub_21FAB35A4()
{
  uint64_t v0 = 1000000;
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  if (result)
  {
    uint64_t result = _os_assumes_log();
    goto LABEL_5;
  }
  if (!info.denom)
  {
LABEL_5:
    qword_26AC12B40 = 1;
    goto LABEL_6;
  }
  qword_26AC12B40 = info.numer;
  uint64_t v0 = 1000000 * info.denom;
LABEL_6:
  qword_26AC12B48 = v0;
  return result;
}

BOOL _systemstats_get_system_version(char *a1, size_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  size_t v6 = a2;
  *(void *)uint64_t v7 = 0x4100000001;
  int v4 = sysctl(v7, 2u, a1, &v6, 0, 0);
  if (v4 == -1) {
    sub_21FAB7144();
  }
  a1[a2 - 1] = 0;
  return v4 == 0;
}

uint64_t sub_21FAB36C8(unsigned __int8 *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(_OWORD *)in = 0u;
  memset(v6, 0, sizeof(v6));
  size_t v4 = 37;
  int v2 = sysctlbyname("kern.bootsessionuuid", in, &v4, 0, 0);
  if (v2 || (v6[20] = 0, (int v2 = uuid_parse(in, a1)) != 0))
  {
    if (v2 == -1) {
      sub_21FAB7144();
    }
    uuid_generate_random(a1);
  }
  return 1;
}

unint64_t now_in_wall_milliseconds()
{
  v3.tv_sec = 0;
  *(void *)&v3.tv_usec = 0;
  int v0 = systemstats_gettimeofday(&v3, 0);
  if (!v0) {
    return 1000 * v3.tv_sec + v3.tv_usec / 0x3E8uLL;
  }
  int v1 = v0;
  unint64_t result = 0;
  if (v1 == -1)
  {
    sub_21FAB7144();
    return 0;
  }
  return result;
}

uint64_t sub_21FAB37F8(const char *a1, void *a2, size_t a3)
{
  int v5 = open(a1, 0);
  if (v5 < 0) {
    return -1;
  }
  int v6 = v5;
  do
    ssize_t v7 = read(v6, a2, a3);
  while (v7 == -1 && *__error() == 4);
  if (close(v6) == -1) {
    sub_21FAB7144();
  }
  return v7;
}

uint64_t _systemstats_read_uuid(const char *a1, unsigned __int8 *a2, unsigned char *a3)
{
  uint64_t v5 = sub_21FAB37F8(a1, a3, 0x25uLL);
  if (v5 == 37)
  {
    a3[36] = 0;
    if (uuid_parse(a3, a2))
    {
      _os_assumes_log();
      return 0;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    if (v5 == -1 && *__error() != 2) {
      sub_21FAB7144();
    }
    _os_assumes_log();
    uint64_t result = 0;
    *a3 = 0;
  }
  return result;
}

BOOL _systemstats_read_current_build(const char *a1, unsigned char *a2, size_t a3)
{
  BOOL v3 = 0;
  if (a2 && a3)
  {
    size_t v4 = a2;
    uint64_t v6 = sub_21FAB37F8(a1, a2, a3);
    BOOL v3 = v6 != -1;
    if (v6 == -1)
    {
      int v7 = *__error();
      BOOL v8 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
      if (v7 == 2)
      {
        if (v8) {
          sub_21FAB7164((uint64_t)a1);
        }
      }
      else if (v8)
      {
        sub_21FAB71E4((uint64_t)a1);
      }
    }
    else
    {
      size_t v4 = &v4[v6 - 1];
    }
    *size_t v4 = 0;
  }
  return v3;
}

char *_systemstats_copy_cookie_path(const char *a1, const char *a2)
{
  size_t v4 = 0;
  int v2 = "/private/var/db/systemstats";
  if (a1) {
    int v2 = a1;
  }
  asprintf(&v4, "%s/%s", v2, a2);
  return v4;
}

uint64_t _systemstats_read_uuid_from_cookie_path(const char *a1, const char *a2, unsigned __int8 *a3, unsigned char *a4)
{
  uint64_t uuid = 0;
  if (a2 && a3 && a4)
  {
    id v10 = 0;
    int v7 = "/private/var/db/systemstats";
    if (a1) {
      int v7 = a1;
    }
    asprintf(&v10, "%s/%s", v7, a2);
    BOOL v8 = v10;
    if (v10)
    {
      uint64_t uuid = _systemstats_read_uuid(v10, a3, a4);
      free(v8);
    }
    else
    {
      return 0;
    }
  }
  return uuid;
}

void systemstats_unlink_if_present(const char *a1, const char *a2)
{
  *(void *)&v5.st_dev = 0;
  BOOL v3 = "/private/var/db/systemstats";
  if (a1) {
    BOOL v3 = a1;
  }
  asprintf((char **)&v5, "%s/%s", v3, a2);
  if (a2)
  {
    size_t v4 = *(char **)&v5.st_dev;
    memset(&v5, 0, sizeof(v5));
    if (!stat(v4, &v5)) {
      unlink(v4);
    }
    free(v4);
  }
}

BOOL sub_21FAB3B30()
{
  if (getenv("DISABLE_FDR") || getenv("DISABLE_SYSTEMSTATS")) {
    return 0;
  }
  memset(&v1, 0, sizeof(v1));
  return stat("/private/var/db/systemstats/disabled", &v1) != 0;
}

void get_microstackshots_from_files(const char *a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
  if (v7) {
    sub_21FAB7300(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if (!v5)
  {
    uint64_t uint64 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    int v16 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    long long v47 = 0u;
    memset(v48, 0, sizeof(v48));
    goto LABEL_9;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "time");
  int v16 = xpc_dictionary_get_uint64(v5, "pid");
  uint64_t v17 = xpc_dictionary_get_uint64(v5, "uniqueid");
  uint64_t v18 = xpc_dictionary_get_uint64(v5, "type");
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  long long v47 = 0u;
  memset(v48, 0, sizeof(v48));
  if (!xpc_dictionary_get_BOOL(v5, "currentBoot"))
  {
LABEL_9:
    unint64_t v19 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    goto LABEL_10;
  }
  unint64_t v19 = (const char *)&v47;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  if (!_systemstats_read_uuid_from_cookie_path(a1, "current_boot_uuid", (unsigned __int8 *)&v49, &v47)) {
    unint64_t v19 = 0;
  }
LABEL_10:
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_21FAB3EE8;
  v32[3] = &unk_264526DF0;
  int v38 = v16;
  uint64_t v35 = v17;
  uint64_t v36 = v18;
  uint64_t v37 = uint64;
  id v20 = v6;
  id v33 = v20;
  long long v34 = &v39;
  uint64_t v21 = v32;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = sub_21FAB5068;
  v45[3] = &unk_264526E68;
  id v46 = v21;
  uint64_t v22 = v21;
  uint64_t v23 = (void *)MEMORY[0x223C58960](v45);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_21FAB5268;
  v43[3] = &unk_264526E90;
  id v44 = v23;
  id v24 = v23;
  sub_21FAB5090(a1, v19, uint64, v43);

  (*((void (**)(id, uint64_t, void, void))v20 + 2))(v20, 1, 0, 0);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    sub_21FAB7284((uint64_t)&v40, v25, v26, v27, v28, v29, v30, v31);
  }

  _Block_object_dispose(&v39, 8);
}

void sub_21FAB3EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FAB3EE8(uint64_t a1, void *bytes, uint64_t a3, int a4, size_t length)
{
  if ((!a3 || (int v6 = *(_DWORD *)(a1 + 72)) == 0 || *(_DWORD *)(a3 + 4) == v6)
    && (!a3 || (uint64_t v7 = *(void *)(a1 + 48)) == 0 || *(void *)(a3 + 8) == v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    if ((!v8 || (v8 & *((unsigned char *)bytes + 24)) != 0) && *((void *)bytes + 1) >= *(void *)(a1 + 64))
    {
      id v9 = xpc_data_create(bytes, length);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

uint64_t systemstats_microstackshot_checkpoint_async(void *a1)
{
  id v1 = a1;
  int out_token = 0;
  int v2 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  int v7[2] = sub_21FAB40C0;
  v7[3] = &unk_264526E18;
  id v3 = v1;
  id v8 = v3;
  uint32_t v4 = notify_register_dispatch("com.apple.telemetry.immediate-done", &out_token, v2, v7);

  uint64_t v5 = 0;
  if (!v4)
  {
    if (notify_post("com.apple.telemetry.immediate"))
    {
      notify_cancel(out_token);
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }

  return v5;
}

uint64_t sub_21FAB40C0(uint64_t a1, int token)
{
  notify_cancel(token);
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

uint64_t systemstats_persistence_is_allowed()
{
  v17[1] = *MEMORY[0x263EF8340];
  CFPropertyListRef v0 = CFPreferencesCopyValue(@"allowMicrostackshotPersistence", @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  if (v0)
  {
    id v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFNumberGetTypeID())
    {
      v17[0] = 0;
      if (CFNumberGetValue((CFNumberRef)v1, kCFNumberSInt64Type, v17) && v17[0] < 2uLL)
      {
        BOOL v3 = v17[0] == 0;
LABEL_8:
        uint64_t v5 = !v3;
        CFRelease(v1);
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          LODWORD(v17[0]) = 67109120;
          HIDWORD(v17[0]) = v5;
          _os_log_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "allowMicrostackshotPersistence setting: %d", (uint8_t *)v17, 8u);
        }
        return v5;
      }
    }
    else
    {
      CFTypeID v4 = CFGetTypeID(v1);
      if (v4 == CFBooleanGetTypeID())
      {
        BOOL v3 = CFBooleanGetValue((CFBooleanRef)v1) == 0;
        goto LABEL_8;
      }
    }
    CFTypeID v6 = CFGetTypeID(v1);
    CFStringRef v7 = CFCopyTypeIDDescription(v6);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      sub_21FAB73B4();
    }
    CFRelease(v7);
    CFRelease(v1);
  }
  BOOL v8 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
  if (v8) {
    sub_21FAB733C(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  return 1;
}

BOOL systemstats_cpu_hotspot_report_allowed_by_tasking()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v12 = 0.0;
  if (!sub_21FAB43F4(@"cpuHotspotReportPercentage", &v12))
  {
LABEL_8:
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    BOOL v3 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
    if (has_internal_diagnostics)
    {
      if (v3) {
        sub_21FAB7430(v3, v4, v5, v6, v7, v8, v9, v10);
      }
      double v0 = 100.0;
    }
    else
    {
      double v0 = 0.0;
      if (v3) {
        sub_21FAB74A8(v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    return sub_21FAB44E4(v0);
  }
  double v0 = v12;
  if (v12 < 0.0 || v12 > 100.0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      sub_21FAB751C(v0);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v14 = v0;
    _os_log_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "cpuHotspotReportPercentage setting: %.1f", buf, 0xCu);
  }
  return sub_21FAB44E4(v0);
}

uint64_t sub_21FAB43F4(const __CFString *a1, void *a2)
{
  CFPropertyListRef v4 = CFPreferencesCopyValue(a1, @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFNumberGetTypeID() && (uint64_t valuePtr = 0, CFNumberGetValue((CFNumberRef)v5, kCFNumberDoubleType, &valuePtr)))
  {
    *a2 = valuePtr;
    uint64_t v7 = 1;
  }
  else
  {
    CFTypeID v8 = CFGetTypeID(v5);
    CFStringRef v9 = CFCopyTypeIDDescription(v8);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      sub_21FAB759C((uint64_t)a1, (uint64_t)v9, (uint64_t)v5, v10, v11, v12, v13, v14);
    }
    CFRelease(v9);
    uint64_t v7 = 0;
  }
  CFRelease(v5);
  return v7;
}

BOOL sub_21FAB44E4(double a1)
{
  if (a1 <= 0.0) {
    return 0;
  }
  if (a1 >= 100.0) {
    return 1;
  }
  if (qword_267EF5A38 != -1) {
    dispatch_once(&qword_267EF5A38, &unk_26D14E8F8);
  }
  double v2 = (double)rand() * 100.0 / 2147483650.0;
  BOOL result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
  if (v2 <= a1)
  {
    if (result) {
      sub_21FAB7624();
    }
    return 1;
  }
  if (result)
  {
    sub_21FAB76A0();
    return 0;
  }
  return result;
}

BOOL systemstats_io_hotspot_report_allowed_by_tasking()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v12 = 0.0;
  if (!sub_21FAB43F4(@"ioHotspotReportPercentage", &v12))
  {
LABEL_8:
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    BOOL v3 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
    if (has_internal_diagnostics)
    {
      if (v3) {
        sub_21FAB771C(v3, v4, v5, v6, v7, v8, v9, v10);
      }
      double v0 = 100.0;
    }
    else
    {
      double v0 = 0.0;
      if (v3) {
        sub_21FAB7794(v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    return sub_21FAB44E4(v0);
  }
  double v0 = v12;
  if (v12 < 0.0 || v12 > 100.0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      sub_21FAB7808(v0);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v14 = v0;
    _os_log_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "cpuHotspotReportPercentage setting: %.1f", buf, 0xCu);
  }
  return sub_21FAB44E4(v0);
}

uint64_t systemstats_get_pmi_cycle_interval()
{
  uint64_t v0 = 10000000000;
  CFPropertyListRef v1 = CFPreferencesCopyValue(@"microstackshotPMICycleInterval", @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  if (v1)
  {
    double v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFNumberGetTypeID()
      && (unint64_t valuePtr = 0, CFNumberGetValue((CFNumberRef)v2, kCFNumberSInt64Type, &valuePtr)))
    {
      unint64_t v4 = valuePtr;
      CFRelease(v2);
      if (v4 - 1 < 0x3B9AC9FF) {
        uint64_t v5 = 1000000000;
      }
      else {
        uint64_t v5 = v4;
      }
      if (v4 <= 0x174876E800) {
        return v5;
      }
      else {
        return 100000000000;
      }
    }
    else
    {
      CFTypeID v6 = CFGetTypeID(v2);
      CFStringRef v7 = CFCopyTypeIDDescription(v6);
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
        sub_21FAB7888();
      }
      CFRelease(v7);
      CFRelease(v2);
    }
  }
  return v0;
}

void systemstats_get_microstackshots(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (systemstats_persistence_is_allowed())
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_21FAB4AE8;
    v35[3] = &unk_264526E40;
    CFTypeID v6 = v5;
    uint64_t v36 = v6;
    if (systemstats_microstackshot_checkpoint_async(v35))
    {
      dispatch_time_t v7 = dispatch_time(0, 10000000000);
      intptr_t v8 = dispatch_semaphore_wait(v6, v7);
      BOOL v9 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        if (v9) {
          sub_21FAB7940(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
      else if (v9)
      {
        sub_21FAB7904(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    get_microstackshots_from_files("/private/var/db/systemstats", v3, v4);
  }
  else
  {
    CFTypeID v6 = v3;
    id v17 = v4;
    BOOL v18 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
    if (v18) {
      sub_21FAB79EC(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    uint64_t v26 = malloc_type_malloc(0x10000uLL, 0x385B420AuLL);
    if (v26)
    {
      uint64_t v27 = v26;
      unsigned int v28 = __microstackshot();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
        sub_21FAB797C();
      }
      if (v28 <= 0x10000)
      {
        if (v6)
        {
          uint64_t uint64 = xpc_dictionary_get_uint64(v6, "time");
          int v30 = xpc_dictionary_get_uint64(v6, "pid");
          uint64_t v31 = xpc_dictionary_get_uint64(v6, "uniqueid");
          uint64_t v32 = xpc_dictionary_get_uint64(v6, "type");
        }
        else
        {
          uint64_t uint64 = 0;
          uint64_t v31 = 0;
          uint64_t v32 = 0;
          int v30 = 0;
        }
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = sub_21FAB556C;
        v37[3] = &unk_264526F00;
        int v42 = v30;
        uint64_t v39 = v31;
        uint64_t v40 = v32;
        uint64_t v41 = uint64;
        id v33 = v17;
        id v38 = v33;
        long long v34 = (void *)MEMORY[0x223C58960](v37);
        systemstats_foreach_micro((unint64_t)v27, v28, 0, v34);
        (*((void (**)(id, uint64_t, void, void))v33 + 2))(v33, 1, 0, 0);
      }
      free(v27);
    }
  }
}

intptr_t sub_21FAB4AE8(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
  if (v2) {
    sub_21FAB7A28(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t systemstats_copy_microstackshots_to_file(void *a1, int a2)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if ((a2 & 0x80000000) == 0)
  {
    if (systemstats_persistence_is_allowed())
    {
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = sub_21FAB5024;
      v47[3] = &unk_264526E40;
      uint64_t v5 = v4;
      v48 = v5;
      if (systemstats_microstackshot_checkpoint_async(v47))
      {
        dispatch_time_t v6 = dispatch_time(0, 10000000000);
        intptr_t v7 = dispatch_semaphore_wait(v5, v6);
        BOOL v8 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
        if (v7)
        {
          if (v8) {
            sub_21FAB7940(v8, v9, v10, v11, v12, v13, v14, v15);
          }
        }
        else if (v8)
        {
          sub_21FAB7904(v8, v9, v10, v11, v12, v13, v14, v15);
        }
      }
      id v33 = v3;
      BOOL v34 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
      if (v34) {
        sub_21FAB7AA8(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      if (v33)
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(v33, "time");
        BOOL v43 = xpc_dictionary_get_BOOL(v33, "currentBoot");
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        long long v61 = 0u;
        memset(v62, 0, sizeof(v62));
        if (v43)
        {
          id v44 = (const char *)&v61;
          if (!_systemstats_read_uuid_from_cookie_path("/private/var/db/systemstats", "current_boot_uuid", (unsigned __int8 *)&v63, &v61))id v44 = 0; {
        }
          }
        else
        {
          id v44 = 0;
        }
      }
      else
      {
        uint64_t uint64 = 0;
        id v44 = 0;
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        long long v61 = 0u;
        memset(v62, 0, sizeof(v62));
      }
      uint64_t v45 = malloc_type_malloc(0x100000uLL, 0x4A187E97uLL);
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x2020000000;
      int v60 = 1;
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v50 = 3221225472;
      uint64_t v51 = sub_21FAB5614;
      v52 = &unk_264526F50;
      v53 = &v57;
      v54 = v45;
      int v55 = a2;
      int v56 = 0x100000;
      sub_21FAB5090("/private/var/db/systemstats", v44, uint64, buf);
      free(v45);
      uint64_t v16 = *((unsigned int *)v58 + 6);
      _Block_object_dispose(&v57, 8);

      goto LABEL_50;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Persistence disallowed, copying only live microstackshots", buf, 2u);
    }
    BOOL v17 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
    if (v17) {
      sub_21FAB79EC(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    uint64_t v25 = malloc_type_malloc(0x10000uLL, 0x51422A9AuLL);
    if (v25)
    {
      unsigned int v26 = __microstackshot();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
        sub_21FAB797C();
      }
      if (v26 <= 0x10000)
      {
        int v27 = dup(a2);
        if (v27 < 0)
        {
          uint64_t v16 = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            sub_21FAB7B54();
          }
        }
        else
        {
          unsigned int v28 = gzdopen(a2, "ab");
          uint64_t v29 = v28;
          if (v28)
          {
            *(_DWORD *)buf = 0;
            if (gzwrite(v28, v25, 0x10000u) != 0x10000)
            {
              int v30 = gzerror(v29, (int *)buf);
              int v31 = *(_DWORD *)buf;
              if (*(_DWORD *)buf == -1)
              {
                *(_DWORD *)buf = *__error();
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                  sub_21FAB7BC4();
                }
              }
              else
              {
                uint64_t v32 = (uint64_t)v30;
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                  sub_21FAB7C34(v32, v31);
                }
              }
            }
            gzclose(v29);
            free(v25);
            uint64_t v16 = *(unsigned int *)buf;
            goto LABEL_49;
          }
          uint64_t v16 = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            sub_21FAB7B54();
          }
          close(v27);
        }
        free(v25);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          sub_21FAB7AE4();
        }
        free(v25);
        uint64_t v16 = 7;
      }
    }
    else
    {
      uint64_t v16 = 12;
    }
LABEL_49:
    close(a2);
    goto LABEL_50;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    sub_21FAB7A64();
  }
  uint64_t v16 = 22;
LABEL_50:

  return v16;
}

void sub_21FAB5004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_21FAB5024(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
  if (v2) {
    sub_21FAB7A28(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_21FAB5068(uint64_t a1)
{
  return 1;
}

void sub_21FAB5090(const char *a1, const char *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v7 = a4;
  size_t v24 = 15;
  uint64_t v25 = "microstackshots";
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_21FAB54C0;
  v20[3] = &unk_264526EB8;
  uint64_t v22 = a1;
  uint64_t v23 = a3;
  id v9 = v8;
  id v21 = v9;
  _systemstats_enumerate_files(a1, a2, 0, &v25, &v24, 1, v20);
  uint64_t v10 = (void *)MEMORY[0x223C58870]();
  uint64_t v11 = [v9 keysSortedByValueUsingSelector:sel_compare_];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        v7[2](v7, *(void *)(*((void *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v13);
  }
}

void sub_21FAB5268(uint64_t a1, void *a2)
{
}

void sub_21FAB5278(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  gzFile v6 = gzopen((const char *)[v5 UTF8String], "rb");
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (void *)MEMORY[0x223C58870]();
    id v9 = (char *)malloc_type_malloc(0x40000uLL, 0x1319781DuLL);
    if (!v9) {
      sub_21FAB7128();
    }
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    unsigned int v12 = 0;
    unsigned int v13 = 0x40000;
    uint64_t v14 = MEMORY[0x263EF8438];
    while (1)
    {
      if (v12 == v13)
      {
        if (v11 != v10) {
          sub_21FAB7128();
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_21FAB7D98(&buf, v31);
        }
        if (v12 > 0x100000)
        {
          BOOL v21 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
          if (v21) {
            sub_21FAB7CC0(v21, v22, v23, v24, v25, v26, v27, v28);
          }
LABEL_25:
          uint64_t v10 = v11;
          goto LABEL_26;
        }
        if (!v12) {
          goto LABEL_25;
        }
        unsigned int v13 = 2 * v12;
        uint64_t v15 = (char *)reallocf(v11, 2 * v12);
        if (!v15) {
          sub_21FAB7128();
        }
        uint64_t v10 = v15;
      }
      else if (v12)
      {
        memmove(v10, v11, v12);
      }
      int v16 = gzread(v7, &v10[v12], v13 - v12);
      if (v16 < 0) {
        break;
      }
      if (v16 != v13 - v12)
      {
        systemstats_foreach_micro((unint64_t)v10, v16 + v12, 0, v4);
        goto LABEL_26;
      }
      unint64_t v17 = systemstats_foreach_micro((unint64_t)v10, v13, 1, v4);
      if (!v17) {
        goto LABEL_26;
      }
      uint64_t v11 = (char *)v17;
      unsigned int v12 = v10 + v13 - v17;
    }
    systemstats_foreach_micro((unint64_t)v10, v12, 0, v4);
    int errnum = 0;
    long long v18 = (void *)gzerror(v7, &errnum);
    if (errnum == -1)
    {
      int errnum = *__error();
      long long v19 = __error();
      long long v18 = strerror(*v19);
    }
    uint64_t v20 = (uint64_t)v18;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      sub_21FAB7CFC((uint64_t)v5, &errnum, v20);
    }
LABEL_26:
    free(v10);
    gzclose(v7);
  }
}

void sub_21FAB54C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + 48);
  gzFile v6 = [NSString initWithFormat:@"%s/%s", *(void *)(a1 + 40), a2];
  if (v5 >= *(void *)(a1 + 48))
  {
    id v8 = v6;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSince1970:(double)v5];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];

    gzFile v6 = v8;
  }
}

uint64_t sub_21FAB556C(uint64_t a1, void *bytes, uint64_t a3, int a4, size_t length)
{
  if ((!a3 || (int v6 = *(_DWORD *)(a1 + 64)) == 0 || *(_DWORD *)(a3 + 4) == v6)
    && (!a3 || (uint64_t v7 = *(void *)(a1 + 40)) == 0 || *(void *)(a3 + 8) == v7))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if ((!v8 || (v8 & *((unsigned char *)bytes + 24)) != 0) && *((void *)bytes + 1) >= *(void *)(a1 + 56))
    {
      xpc_object_t v9 = xpc_data_create(bytes, length);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  return 1;
}

void sub_21FAB5614(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (char *)[v3 UTF8String];
  if (v4)
  {
    uint64_t v5 = v4;
    if (strstr(v4, "XXXXXX") || strstr(v5, "truncated"))
    {
      int v6 = dup(*(_DWORD *)(a1 + 48));
      if (v6 < 0)
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *__error();
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          sub_21FAB7EF8();
        }
      }
      else
      {
        int v7 = v6;
        gzFile v8 = gzdopen(v6, "ab");
        if (v8)
        {
          xpc_object_t v9 = v8;
          *(void *)uint8_t buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LODWORD(v26) = 0;
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = sub_21FAB5B30;
          v21[3] = &unk_264526F28;
          gzFile v24 = v8;
          id v10 = v3;
          id v22 = v10;
          uint64_t v23 = buf;
          sub_21FAB5278(v10, v21);
          if (*(_DWORD *)(*(void *)&buf[8] + 24))
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
              sub_21FAB7FF0((uint64_t)&buf[8], (uint64_t)v10);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v29 = 138412290;
            id v30 = v10;
            _os_log_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Read 0 bytes from microstackshots file %@", v29, 0xCu);
          }
          gzclose(v9);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            sub_21FAB7F74();
          }
          close(v7);
        }
      }
      goto LABEL_39;
    }
    id v11 = v3;
    int v12 = open((const char *)[v11 UTF8String], 0);
    if ((v12 & 0x80000000) == 0)
    {
      int v13 = v12;
      LODWORD(v14) = *(_DWORD *)(a1 + 52);
      uint64_t v15 = MEMORY[0x263EF8438];
      while (1)
      {
        ssize_t v16 = read(v13, *(void **)(a1 + 40), (int)v14);
        ssize_t v17 = v16;
        if (v16 < 0)
        {
          if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *__error();
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v19 = *__error();
            *(_DWORD *)uint8_t buf = 138412546;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            _os_log_error_impl(&dword_21FAB1000, v15, OS_LOG_TYPE_ERROR, "Failed to read microstackshots file %@: %{errno}d", buf, 0x12u);
          }
          goto LABEL_34;
        }
        if (!v16)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            *(void *)&uint8_t buf[4] = v11;
            _os_log_impl(&dword_21FAB1000, v15, OS_LOG_TYPE_INFO, "Read 0 bytes from microstackshots file %@", buf, 0xCu);
          }
          goto LABEL_34;
        }
        ssize_t v18 = write(*(_DWORD *)(a1 + 48), *(const void **)(a1 + 40), v16);
        if (v18 == v17)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint8_t buf = 134218242;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v11;
            _os_log_debug_impl(&dword_21FAB1000, v15, OS_LOG_TYPE_DEBUG, "Copied %ld bytes of microstackshots from file %@", buf, 0x16u);
          }
          goto LABEL_34;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v20 = *__error();
          *(_DWORD *)uint8_t buf = 138413058;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2048;
          ssize_t v26 = v17;
          __int16 v27 = 1024;
          int v28 = v20;
          _os_log_error_impl(&dword_21FAB1000, v15, OS_LOG_TYPE_ERROR, "Failed to write microstackshots from file %@, only wrote %ld out of %ld bytes: %{errno}d", buf, 0x26u);
          if (v18 < 0)
          {
LABEL_33:
            *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *__error();
            goto LABEL_34;
          }
        }
        else if (v18 < 0)
        {
          goto LABEL_33;
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 28;
LABEL_34:
        uint64_t v14 = *(int *)(a1 + 52);
        if (v17 != v14)
        {
          close(v13);
          goto LABEL_39;
        }
      }
    }
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        sub_21FAB7E58((uint64_t)v11);
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    sub_21FAB7DDC();
  }
LABEL_39:
}

void sub_21FAB5B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_21FAB5B30(uint64_t a1, const void *a2, int a3, int a4, unint64_t len)
{
  if (len >> 31) {
    sub_21FAB8084();
  }
  int v5 = len;
  int v7 = gzwrite(*(gzFile *)(a1 + 48), a2, len);
  int v8 = v7;
  if (v7 == v5)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
  }
  else if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      sub_21FAB81AC();
    }
  }
  else
  {
    int errnum = 0;
    gzerror(*(gzFile *)(a1 + 48), &errnum);
    if (errnum == -1)
    {
      int errnum = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        sub_21FAB80B0();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      sub_21FAB8128();
    }
  }
  return v8 == v5;
}

void sub_21FAB5C4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_21FAB5C68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_21FAB5C84(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21FAB5D0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_21FAB5D28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void sub_21FAB5D44(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

size_t sub_21FAB5D5C(int __fd, void *__buf, size_t __nbyte)
{
  if (__fd == -1) {
    return 0;
  }
  size_t v6 = 0;
  while (1)
  {
    ssize_t v7 = write(__fd, __buf, __nbyte);
    if (v7 == -1) {
      break;
    }
LABEL_6:
    v6 += v7;
    if (v6 >= __nbyte) {
      return v6;
    }
  }
  if (*__error() == 4)
  {
    ssize_t v7 = 0;
    goto LABEL_6;
  }
  if (*__error()) {
    _os_assumes_log();
  }
  return v6;
}

uint64_t sub_21FAB5DF4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
  v5.tv_sec = 0;
  *(void *)&v5.tv_usec = 0;
  systemstats_gettimeofday(&v5, 0);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = now_in_absolute_milliseconds();
  return sub_21FAB5E50(v2, v3, &v5, 0);
}

uint64_t sub_21FAB5E50(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t result = geteuid();
  if (!*(void *)(a1 + 96))
  {
    *(_DWORD *)(a1 + 88) = -1;
    return result;
  }
  int v9 = result;
  uint64_t v10 = a1;
  if (*(_DWORD *)(a1 + 88) == -1)
  {
    uint64_t result = sub_21FAB6FB4(a1, v9);
    if (!result) {
      return result;
    }
    if (a4)
    {
      uint64_t v14 = *(void *)(a1 + 112);
      if (!v14)
      {
        uint64_t result = sub_21FAB25EC((void *)a1, a2, a3);
        if ((result & 1) == 0) {
          return result;
        }
        uint64_t v14 = *(void *)(a1 + 112);
      }
      BOOL v13 = v14 != 0;
    }
    else
    {
      uint64_t result = sub_21FAB25EC((void *)a1, a2, a3);
      if ((result & 1) == 0) {
        return result;
      }
      BOOL v13 = 0;
    }
    uint64_t v10 = a1;
    uint64_t v11 = a2;
    int v12 = a3;
  }
  else
  {
    uint64_t v11 = a2;
    int v12 = a3;
    BOOL v13 = 0;
  }
  uint64_t result = sub_21FAB6D78(v10, v11, v12, v13);
  if (result)
  {
    return sub_21FAB6FB4(a1, v9);
  }
  return result;
}

void _systemstats_queued_write(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(NSObject **)(a1 + 104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_21FAB232C;
  block[3] = &unk_264526F90;
  block[4] = a1;
  void block[5] = a2;
  block[6] = a3;
  dispatch_sync(v3, block);
}

void sub_21FAB5FD4(uint64_t a1, unsigned int a2, void *a3, char *a4, uint64_t a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 200))
  {
    uint64_t v10 = *(NSObject **)(a1 + 104);
    if (v10) {
      dispatch_assert_queue_V2(v10);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    *(_OWORD *)__nbyte = 0u;
    long long v17 = 0u;
    sub_21FAB2794((uint64_t)__nbyte, 12);
    sub_21FAB2AD4((void *)1, __nbyte, "systemstats_v1");
    uint64_t v11 = now_in_absolute_milliseconds();
    sub_21FAB2800(2, __nbyte, v11);
    unint64_t v12 = now_in_wall_milliseconds();
    sub_21FAB2800(3, __nbyte, v12);
    sub_21FAB2800(4, __nbyte, **(unsigned int **)(a1 + 8));
    sub_21FAB28A0((void *)5, __nbyte, (void *)(a1 + 24), 0x10uLL);
    if (_systemstats_get_system_version(__s, 0x20uLL)) {
      sub_21FAB2AD4((void *)6, __nbyte, __s);
    }
    if (a3) {
      sub_21FAB28A0((void *)7, __nbyte, a3, 0x10uLL);
    }
    sub_21FAB2800(8, __nbyte, a2);
    if (a4) {
      sub_21FAB2AD4((void *)9, __nbyte, a4);
    }
    if (a5)
    {
      sub_21FAB2AD4((void *)0xA, __nbyte, (char *)a5);
      unint64_t v13 = *(unsigned int *)(a5 + 528);
      if (v13) {
        sub_21FAB2800(11, __nbyte, v13);
      }
      unint64_t v14 = *(void *)(a5 + 512);
      if (v14) {
        sub_21FAB2800(12, __nbyte, v14);
      }
      sub_21FAB2800(13, __nbyte, *(unsigned int *)(a5 + 536));
      if (*(unsigned char *)(a5 + 536))
      {
        sub_21FAB2AD4((void *)0xE, __nbyte, (char *)(a5 + 128));
        sub_21FAB2AD4((void *)0xF, __nbyte, (char *)(a5 + 256));
      }
      sub_21FAB2AD4((void *)0x10, __nbyte, (char *)(a5 + 384));
      sub_21FAB2800(17, __nbyte, *(void *)(a5 + 520));
    }
    uint64_t v15 = (void *)sub_21FAB2B34((uint64_t)__nbyte);
    *(void *)(a1 + 112) += _systemstats_retried_write(a1, v15, __nbyte[0]);
    sub_21FAB27B0(__nbyte);
  }
}

void _systemstats_write_logstarts_queued(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned char *)(*(void *)(a1 + 8) + 16))
  {
    timeval v5 = *(NSObject **)(a1 + 104);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = sub_21FAB6288;
    block[3] = &unk_264526FB0;
    char v7 = a2;
    block[4] = a1;
    void block[5] = a3;
    block[6] = a4;
    void block[7] = a5;
    dispatch_sync(v5, block);
  }
}

void sub_21FAB6288(uint64_t a1)
{
}

uint64_t _systemstats_stream_init(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)a1) {
    sub_21FAB8284();
  }
  if (a3) {
    char v7 = a3;
  }
  else {
    char v7 = "/private/var/db/systemstats";
  }
  uint64_t result = sub_21FAB3B30();
  if (result)
  {
    *(void *)(a1 + 16) = a4;
    uint64_t result = (uint64_t)_systemstats_writers();
    if (a2 - 5 < 0x17 || !a2 || a2 == 3)
    {
      *(void *)(a1 + 8) = result + 48 * a2;
      if (result)
      {
        *(void *)(a1 + 80) = v7;
        uint64_t result = _systemstats_read_uuid_from_cookie_path(v7, "current_boot_uuid", (unsigned __int8 *)(a1 + 24), (unsigned char *)(a1 + 40));
        if (result)
        {
          *(_DWORD *)(a1 + 88) = -1;
          *(void *)(a1 + 184) = 0;
          *(void *)(a1 + 120) = 0;
          systemstats_gettimeofday((timeval *)(a1 + 152), 0);
          *(void *)(a1 + 168) = now_in_absolute_milliseconds();
          int v9 = ".gz";
          uint64_t v10 = 0x40000;
          switch(*(void *)(*(void *)(a1 + 8) + 16))
          {
            case 0:
              sub_21FAB7128();
            case 1:
              int v9 = ".stats";
              goto LABEL_16;
            case 2:
              goto LABEL_17;
            case 3:
              int v9 = ".stats.gz";
              goto LABEL_16;
            case 4:
              int v9 = ".oneshot";
LABEL_16:
              uint64_t v10 = 0x20000;
LABEL_17:
              *(void *)(a1 + 192) = v9;
              *(void *)(a1 + 128) = v10;
              long long v18 = 0;
              memset(out, 0, sizeof(out));
              uuid_unparse((const unsigned __int8 *)(a1 + 24), out);
              uint64_t v11 = (const char **)_systemstats_writers();
              asprintf(&v18, "%s/%s.%s.XXXXXX%s", v7, out, v11[6 * a2 + 1], v9);
              *(void *)(a1 + 96) = v18;
              uint64_t v12 = *(void *)(a1 + 8);
              if (!*(unsigned char *)(v12 + 42))
              {
                systemstats_delete_old_files(*(const char **)(a1 + 80), 0, *(char **)(v12 + 8), *(void *)(v12 + 32), (void *)(a1 + 152));
                uint64_t v12 = *(void *)(a1 + 8);
              }
              sub_21FAB5E50(a1, *(void *)(a1 + 168), (void *)(a1 + 152), (*(void *)(v12 + 16) >> 1) & 1);
              if ((*(_DWORD *)(a1 + 88) & 0x80000000) != 0)
              {
                free(*(void **)(a1 + 96));
                uint64_t result = 0;
              }
              else
              {
                if ((a2 & 0xFFFFFFEF) == 5)
                {
                  *(void *)(a1 + 104) = 0;
                }
                else
                {
                  uint64_t v13 = *(void *)(a1 + 8);
                  if (*(unsigned char *)(v13 + 44))
                  {
                    if (qword_267EF5A48 != -1) {
                      dispatch_once(&qword_267EF5A48, &unk_26D14E918);
                    }
                    unint64_t v14 = qword_267EF5A40;
                    *(void *)(a1 + 104) = qword_267EF5A40;
                    dispatch_retain(v14);
                  }
                  else
                  {
                    *(void *)uuid_string_t out = 0;
                    asprintf((char **)out, "com.apple.systemstats.filestream.%s", *(const char **)(v13 + 8));
                    uint64_t v15 = *(const char **)out;
                    ssize_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    long long v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_BACKGROUND, 0);
                    *(void *)(a1 + 104) = dispatch_queue_create(v15, v17);
                    free(*(void **)out);
                  }
                }
                uint64_t result = 1;
                *(unsigned char *)a1 = 1;
              }
              break;
            default:
              sub_21FAB826C();
          }
        }
      }
    }
    else
    {
      uint64_t result = 0;
      *(void *)(a1 + 8) = 0;
    }
  }
  return result;
}

dispatch_queue_t sub_21FAB65A4()
{
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.systemstats.filestream", v1);
  qword_267EF5A40 = (uint64_t)result;
  return result;
}

uint64_t _systemstats_stream_teardown(uint64_t a1)
{
  if (!a1) {
    sub_21FAB7128();
  }
  free(*(void **)(a1 + 96));
  uint64_t v2 = *(NSObject **)(a1 + 104);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 104) = 0;
  }
  if ((*(unsigned char *)(*(void *)(a1 + 8) + 16) & 2) != 0)
  {
    uint64_t result = gzclose_w(*(gzFile *)(a1 + 184));
    if (result) {
      uint64_t result = _os_assumes_log();
    }
    *(void *)(a1 + 184) = 0;
  }
  else
  {
    uint64_t result = close(*(_DWORD *)(a1 + 88));
    if (result == -1) {
      uint64_t result = sub_21FAB7144();
    }
  }
  *(_DWORD *)(a1 + 88) = -1;
  *(void *)(a1 + 120) = 0;
  *(unsigned char *)a1 = 0;
  return result;
}

void *_systemstats_stream_create(unsigned int a1, const char *a2, uint64_t a3)
{
  size_t v6 = malloc_type_calloc(1uLL, 0xD0uLL, 0x107004075F51AE9uLL);
  char v7 = v6;
  if (v6)
  {
    if (_systemstats_stream_init((uint64_t)v6, a1, a2, a3))
    {
      _systemstats_write_logstarts_queued((uint64_t)v7, 1, 0, 0, 0);
    }
    else
    {
      free(v7);
      return 0;
    }
  }
  return v7;
}

void systemstats_stream_delete(void *a1)
{
  _systemstats_stream_teardown((uint64_t)a1);

  free(a1);
}

void systemstats_stream_flush(uint64_t a1)
{
  if (*(unsigned char *)a1)
  {
    if ((*(unsigned char *)(*(void *)(a1 + 8) + 16) & 2) != 0)
    {
      uint64_t v1 = *(NSObject **)(a1 + 104);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = sub_21FAB67D0;
      block[3] = &unk_264526FF0;
      block[4] = a1;
      dispatch_sync(v1, block);
    }
  }
}

uint64_t sub_21FAB67D0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 200)) {
    return gzflush(*(gzFile *)(v1 + 184), 2);
  }
  return result;
}

uint64_t systemstats_stream_get_attr(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t _systemstats_save_current_boot_uuid(const char *a1, unsigned __int8 *a2, char *a3)
{
  uid_t v6 = geteuid();
  int v7 = sub_21FAB6898(a1, 1537, v6);
  if (v7 == -1) {
    return sub_21FAB7144();
  }
  int v8 = v7;
  sub_21FAB36C8(a2);
  uuid_unparse(a2, a3);
  a3[36] = 10;
  sub_21FAB5D5C(v8, a3, 0x25uLL);

  return close(v8);
}

uint64_t sub_21FAB6898(const char *a1, int a2, int a3)
{
  __int16 v4 = a2;
  memset(&v14, 0, sizeof(v14));
  memset(&v13.st_atimespec, 0, 112);
  if ((a2 & 0x200) != 0) {
    int v6 = -3585;
  }
  else {
    int v6 = -1025;
  }
  int v7 = v6 & a2;
  memset(&v13, 0, 32);
  if (lstat(a1, &v13) < 0)
  {
    uint64_t v10 = __error();
    uint64_t v8 = 0xFFFFFFFFLL;
    if ((v4 & 0x200) != 0 && *v10 == 2)
    {
      uint64_t v11 = open(a1, v7 | 0xA00, 420);
      if ((v11 & 0x80000000) == 0)
      {
        uint64_t v8 = v11;
        ((void (*)(void))nullsub_1)();
        goto LABEL_22;
      }
    }
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
    if ((v13.st_mode & 0xF000) == 0x8000 && v13.st_nlink == 1 && (v13.st_mode & 0xFFF) == 0x1A4 && v13.st_uid == a3)
    {
      uint64_t v9 = open(a1, v7, 0);
      if ((v9 & 0x80000000) == 0)
      {
        uint64_t v8 = v9;
        if (fstat(v9, &v14)
          || v14.st_nlink != v13.st_nlink
          || v14.st_uid != v13.st_uid
          || v14.st_mode != v13.st_mode
          || v14.st_ino != v13.st_ino
          || v14.st_dev != v13.st_dev)
        {
          close(v8);
          return 0xFFFFFFFFLL;
        }
        if ((v4 & 0x400) != 0)
        {
          ftruncate(v8, 0);
LABEL_22:
          nullsub_1(v8);
        }
      }
    }
  }
  return v8;
}

uint64_t _systemstats_boot(const char *a1, int a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  memset(&v25, 0, sizeof(v25));
  if (a1) {
    uint64_t v3 = a1;
  }
  else {
    uint64_t v3 = "/private/var/db/systemstats";
  }
  memset(v30, 0, sizeof(v30));
  if (stat(v3, &v25) == -1 && mkpath_np(v3, 0x1EDu) == -1) {
    sub_21FAB82A0();
  }
  if (sub_21FAB3B30())
  {
    __int16 v4 = (std::__fs::filesystem::path *)_systemstats_copy_cookie_path(v3, "current_boot_uuid");
    timeval v5 = (std::__fs::filesystem::path *)_systemstats_copy_cookie_path(v3, "last_boot_uuid");
    int v6 = (std::__fs::filesystem::path *)_systemstats_copy_cookie_path(v3, "current_build");
    int v7 = (std::__fs::filesystem::path *)_systemstats_copy_cookie_path(v3, "last_build");
    rename(v4, v5, v8);
    if (v9 == -1 && *__error() != 2) {
      sub_21FAB7144();
    }
    _systemstats_save_current_boot_uuid((const char *)v4, (unsigned __int8 *)&v30[1] + 8, (char *)&v30[2] + 8);
    rename(v6, v7, v10);
    int v12 = v11;
    if (v11 == -1 && *__error() != 2) {
      sub_21FAB7144();
    }
    if (_systemstats_get_system_version(__s, 0x20uLL))
    {
      uid_t v13 = geteuid();
      int v14 = sub_21FAB6898((const char *)v6, 1537, v13);
      if (v14 == -1)
      {
        sub_21FAB7144();
        if (a2)
        {
LABEL_17:
          v28[0] = 0;
          v28[1] = 0;
          memset(v27, 0, 37);
          if ((_systemstats_read_uuid((const char *)v5, (unsigned __int8 *)v28, v27) & 1) == 0)
          {
            long long v17 = __error();
            if (v12 == -1 && *v17 != 2) {
              sub_21FAB7144();
            }
          }
          uint64_t v18 = sub_21FAB37F8((const char *)v7, v26, 0x1FuLL);
          uint64_t v19 = v18;
          if (v18 < 1)
          {
            if (v18 == -1 && *__error() != 2) {
              sub_21FAB7144();
            }
          }
          else
          {
            v26[v18] = 0;
            uint64_t v20 = strchr(v26, 10);
            if (v20) {
              *uint64_t v20 = 0;
            }
          }
          uint64_t v21 = _systemstats_stream_init((uint64_t)v30, 5u, v3, 20180126);
          if (v21)
          {
            if (v12) {
              long long v22 = 0;
            }
            else {
              long long v22 = v28;
            }
            if (v19 <= 0) {
              long long v23 = 0;
            }
            else {
              long long v23 = v26;
            }
            sub_21FAB5FD4((uint64_t)v30, 1u, v22, v23, 0);
            _systemstats_stream_teardown((uint64_t)v30);
          }
          goto LABEL_38;
        }
LABEL_37:
        uint64_t v21 = 1;
LABEL_38:
        free(v4);
        free(v5);
        free(v6);
        free(v7);
        return v21;
      }
      int v15 = v14;
      size_t v16 = strlen(__s);
      sub_21FAB5D5C(v15, __s, v16);
      sub_21FAB5D5C(v15, "\n", 1uLL);
      close(v15);
    }
    if (a2) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
  return 0;
}

uint64_t sub_21FAB6D78(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  int v5 = *(_DWORD *)(a1 + 88);
  if (v5 == -1) {
    sub_21FAB7128();
  }
  if ((*(unsigned char *)(*(void *)(a1 + 8) + 16) & 2) != 0)
  {
    if (!gzclose_w(*(gzFile *)(a1 + 184))) {
      goto LABEL_6;
    }
  }
  else
  {
    if (close(v5) != -1) {
      goto LABEL_6;
    }
    __error();
  }
  _os_assumes_log();
LABEL_6:
  *(_DWORD *)(a1 + 88) = -1;
  *(void *)(a1 + 184) = 0;
  if ((*(unsigned char *)(*(void *)(a1 + 8) + 16) & 4) != 0) {
    return 0;
  }
  int v9 = (std::__fs::filesystem::path *)strdup(*(const char **)(a1 + 96));
  int v10 = strlen(*(const char **)(a1 + 192));
  if (a4)
  {
    int v11 = strstr((char *)v9, "XXXXXX");
    int v12 = strrchr((char *)v9, 46);
    long long v22 = 0;
    if (v11 && v12 && v11 < v12)
    {
      *int v12 = 0;
      asprintf(&v22, "%s.truncated.%s");
    }
    else
    {
      asprintf(&v22, "%s.truncated");
    }
    uid_t v13 = v22;
    if (v22)
    {
      free(v9);
      v10 += 10;
      int v9 = (std::__fs::filesystem::path *)v13;
    }
  }
  int v14 = mkstemps((char *)v9, v10);
  if (v14 < 0)
  {
    if (*__error()) {
      _os_assumes_log();
    }
    free(v9);
    return 0;
  }
  if (close(v14) == -1) {
    sub_21FAB7144();
  }
  rename(*(const std::__fs::filesystem::path **)(a1 + 96), v9, v15);
  int v17 = v16;
  free(v9);
  if (!v17)
  {
    if ((uint64_t)(*a3 - *(void *)(a1 + 152)) < 86401 || (unint64_t)(a2 - *(void *)(a1 + 168)) < 0x36EE81)
    {
      uint64_t v19 = *(void *)(a1 + 8);
      unint64_t v20 = *(void *)(v19 + 32);
      if (*(void *)(a1 + 120) < v20) {
        return 1;
      }
    }
    else
    {
      uint64_t v19 = *(void *)(a1 + 8);
      unint64_t v20 = *(void *)(v19 + 32);
    }
    if (*(unsigned char *)(v19 + 42)) {
      uint64_t v21 = (const char *)(a1 + 40);
    }
    else {
      uint64_t v21 = 0;
    }
    systemstats_delete_old_files(*(const char **)(a1 + 80), v21, *(char **)(v19 + 8), v20, a3);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)a3;
    *(void *)(a1 + 120) = 0;
    *(void *)(a1 + 168) = a2;
    return 1;
  }
  uint64_t result = *__error();
  if (!result) {
    return result;
  }
  _os_assumes_log();
  return 0;
}

uint64_t sub_21FAB6FB4(uint64_t a1, int a2)
{
  *(void *)(a1 + 112) = 0;
  if ((*(void *)(*(void *)(a1 + 8) + 16) & 4) != 0) {
    int v4 = 1537;
  }
  else {
    int v4 = 521;
  }
  int v5 = sub_21FAB6898(*(const char **)(a1 + 96), v4, a2);
  *(_DWORD *)(a1 + 88) = v5;
  if (v5 != -1)
  {
    memset(&v10, 0, sizeof(v10));
    if (_systemstats_get_file_stats(v5, &v10) || v10.st_size < 0)
    {
      if (close(*(_DWORD *)(a1 + 88)) != -1)
      {
LABEL_21:
        uint64_t result = 0;
        *(_DWORD *)(a1 + 88) = -1;
        return result;
      }
    }
    else
    {
      int tv_nsec = v10.st_birthtimespec.tv_nsec;
      *(void *)(a1 + 136) = v10.st_birthtimespec.tv_sec;
      *(_DWORD *)(a1 + 144) = tv_nsec / 1000;
      *(void *)(a1 + 176) = 0;
      if (fcntl(*(_DWORD *)(a1 + 88), 2, 1) == -1) {
        sub_21FAB7144();
      }
      if ((*(unsigned char *)(*(void *)(a1 + 8) + 16) & 2) == 0)
      {
        *(void *)(a1 + 112) = v10.st_size;
        return 1;
      }
      gzFile v8 = gzdopen(*(_DWORD *)(a1 + 88), "ab");
      *(void *)(a1 + 184) = v8;
      if (v8)
      {
        uint64_t v9 = MEMORY[0x223C58730]();
        if ((v9 & 0x8000000000000000) == 0)
        {
          *(void *)(a1 + 112) = v9;
          return 1;
        }
      }
      if (close(*(_DWORD *)(a1 + 88)) != -1) {
        goto LABEL_21;
      }
    }
    sub_21FAB7144();
    goto LABEL_21;
  }
  uint64_t result = *__error();
  if (result)
  {
    _os_assumes_log();
    return 0;
  }
  return result;
}

void sub_21FAB7128()
{
}

uint64_t sub_21FAB7144()
{
  return _os_assumes_log();
}

void sub_21FAB7164(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Could not find the file for current build at path: %s", (uint8_t *)&v1, 0xCu);
}

void sub_21FAB71E4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  v3[0] = 67109378;
  v3[1] = v2;
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Error reading current build from file with errno %d at path: %s", (uint8_t *)v3, 0x12u);
}

void sub_21FAB7284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB7300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB733C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB73B4()
{
  sub_21FAB5CC0();
  sub_21FAB5D28(&dword_21FAB1000, MEMORY[0x263EF8438], v0, "Invalid value for tasking setting %{public}@: (%{public}@)%{public}@", v1, v2, v3, v4, 2u);
}

void sub_21FAB7430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB74A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB751C(double a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  double v2 = a1;
  _os_log_fault_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "Bad cpuHotspotReportPercentage setting: %.1f", (uint8_t *)&v1, 0xCu);
}

void sub_21FAB759C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB7624()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_21FAB5CE8();
  _os_log_debug_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Rand %.1f passed threshold %.1f", v0, 0x16u);
}

void sub_21FAB76A0()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  sub_21FAB5CE8();
  _os_log_debug_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Rand %.1f failed threshold %.1f", v0, 0x16u);
}

void sub_21FAB771C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB7794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB7808(double a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  double v2 = a1;
  _os_log_fault_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "Bad ioHotspotReportPercentage setting: %.1f", (uint8_t *)&v1, 0xCu);
}

void sub_21FAB7888()
{
  sub_21FAB5CC0();
  sub_21FAB5D28(&dword_21FAB1000, MEMORY[0x263EF8438], v0, "Invalid value for tasking setting %{public}@: (%{public}@)%{public}@", v1, v2, v3, v4, 2u);
}

void sub_21FAB7904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB7940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB797C()
{
  sub_21FAB5CDC();
  sub_21FAB5D0C(&dword_21FAB1000, MEMORY[0x263EF8438], v0, "Fetched %d bytes of microstackshots from the kernel", v1, v2, v3, v4, v5);
}

void sub_21FAB79EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB7A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB7A64()
{
  sub_21FAB5D00();
  _os_log_error_impl(v0, v1, v2, v3, v4, 2u);
}

void sub_21FAB7AA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB7AE4()
{
  sub_21FAB5CDC();
  sub_21FAB5C68(&dword_21FAB1000, MEMORY[0x263EF8438], v0, "Unable to copy bad size of %d bytes of microstackshots from kernel", v1, v2, v3, v4, v5);
}

void sub_21FAB7B54()
{
  sub_21FAB5CDC();
  sub_21FAB5C68(&dword_21FAB1000, MEMORY[0x263EF8438], v0, "Unable to dup fd for saving: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_21FAB7BC4()
{
  sub_21FAB5CDC();
  sub_21FAB5C68(&dword_21FAB1000, MEMORY[0x263EF8438], v0, "Unable to write microstackshots from kernel: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_21FAB7C34(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2082;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to write microstackshots from kernel: %d (%{public}s)", (uint8_t *)v2, 0x12u);
}

void sub_21FAB7CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FAB7CFC(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = *a2;
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 2080;
  uint64_t v9 = a3;
  _os_log_debug_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Read failed for microstackshots for file %@: %d %s", (uint8_t *)&v4, 0x1Cu);
}

void sub_21FAB7D98(uint8_t *buf, unsigned char *a2)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Unexpected: a single microstackshot was larger than TELEMETRY_DATA_HIGHWATER_SIZE", buf, 2u);
}

void sub_21FAB7DDC()
{
  sub_21FAB5D00();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xCu);
}

void sub_21FAB7E58(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", (uint8_t *)&v3, 0x12u);
}

void sub_21FAB7EF8()
{
  __error();
  sub_21FAB5C68(&dword_21FAB1000, MEMORY[0x263EF8438], v0, "Unable to get dup fd: %{errno}d", v1, v2, v3, v4, 0);
}

void sub_21FAB7F74()
{
  __error();
  sub_21FAB5C68(&dword_21FAB1000, MEMORY[0x263EF8438], v0, "Unable to gzdopen fd: %{errno}d", v1, v2, v3, v4, 0);
}

void sub_21FAB7FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(*(void *)a1 + 24);
  v3[0] = 67109378;
  v3[1] = v2;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_21FAB1000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Copied %d (uncompressed) bytes of microstackshots from file %@", (uint8_t *)v3, 0x12u);
}

void sub_21FAB8084()
{
  __assert_rtn("microstackshots_copy_files_block_invoke", "micro.m", 381, "len <= INT_MAX");
}

void sub_21FAB80B0()
{
  sub_21FAB5D44(*MEMORY[0x263EF8340]);
  sub_21FAB5CA0();
  sub_21FAB5D00();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
}

void sub_21FAB8128()
{
  sub_21FAB5D44(*MEMORY[0x263EF8340]);
  sub_21FAB5CA0();
  sub_21FAB5D00();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x22u);
}

void sub_21FAB81AC()
{
  sub_21FAB5D00();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Eu);
}

void sub_21FAB8250()
{
}

void sub_21FAB826C()
{
}

void sub_21FAB8284()
{
}

void sub_21FAB82A0()
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __microstackshot()
{
  return MEMORY[0x270ED7E50]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x270ED8058]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x270ED9188](dirp);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x270ED99B8](a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x270ED9AF8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x270F9C6D0](file);
}

int gzclose_w(gzFile file)
{
  return MEMORY[0x270F9C6D8](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x270F9C6E0](*(void *)&fd, mode);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x270F9C6F0](file, errnum);
}

int gzflush(gzFile file, int flush)
{
  return MEMORY[0x270F9C6F8](file, *(void *)&flush);
}

uint64_t gzoffset(gzFile a1)
{
  return MEMORY[0x270F9C708](a1);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x270F9C710](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x270F9C718](file, buf, *(void *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x270F9C728](file, buf, *(void *)&len);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x270EDA550](path, omode);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x270EDA570](a1, *(void *)&a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void sranddev(void)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

void uuid_generate_random(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}