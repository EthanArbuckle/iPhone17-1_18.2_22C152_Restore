char *mdb_strerror(int a1)
{
  if (!a1) {
    return "Successful return: 0";
  }
  if ((a1 + 30799) > 0x13) {
    return strerror(a1);
  }
  return off_2655E71D8[a1 + 30799];
}

uint64_t mdb_cmp(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 80) + 48 * a2 + 16))(a3, a4);
}

uint64_t mdb_dcmp(uint64_t a1, unsigned int a2, void *a3, uint64_t a4)
{
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 80) + 48 * a2 + 24);
  if (v4 == sub_263D8B990)
  {
    if (*a3 == 8) {
      return sub_263D8B9B0(a3, a4);
    }
    v4 = sub_263D8B990;
  }
  return v4((uint64_t)a3, a4);
}

uint64_t sub_263D8B990(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = **(_DWORD **)(a1 + 8);
  unsigned int v3 = **(_DWORD **)(a2 + 8);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_263D8B9B0(void *a1, uint64_t a2)
{
  unint64_t v2 = a1[1];
  uint64_t v3 = *a1 - 2;
  BOOL v4 = (unsigned __int16 *)(v2 + v3);
  BOOL v5 = (unsigned __int16 *)(*(void *)(a2 + 8) + v3);
  v6 = v4;
  do
  {
    int v8 = *v6--;
    int v7 = v8;
    int v9 = *v5--;
    uint64_t result = (v7 - v9);
    BOOL v11 = v7 == v9 && (unint64_t)v4 > v2;
    BOOL v4 = v6;
  }
  while (v11);
  return result;
}

uint64_t mdb_env_sync(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if ((v2 & 0x20000) != 0) {
    return 13;
  }
  if (!a2 && (v2 & 0x10000) != 0) {
    return 0;
  }
  if ((v2 & 0x80000) == 0)
  {
    uint64_t result = fsync(*(_DWORD *)a1);
    if (!result) {
      return result;
    }
    return *__error();
  }
  if (((a2 == 0) & ((v2 & 0x100000u) >> 20)) != 0) {
    int v4 = 1;
  }
  else {
    int v4 = 16;
  }
  uint64_t result = msync(*(void **)(a1 + 56), *(void *)(a1 + 112), v4);
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t mdb_txn_renew(uint64_t a1)
{
  if (!a1 || (~*(_DWORD *)(a1 + 124) & 0x20001) != 0) {
    return 22;
  }
  else {
    return sub_263D8BA84(a1);
  }
}

uint64_t sub_263D8BA84(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  int v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) == 0)
  {
    if (v3)
    {
      BOOL v5 = *(sem_t **)(v2 + 240);
      while (sem_wait(v5))
      {
        uint64_t v6 = *__error();
        if (v6 != 4)
        {
          if (v6) {
            return v6;
          }
          break;
        }
      }
      uint64_t v7 = *(void *)(v3 + 40);
      uint64_t v8 = *(void *)(v2 + 8 * (v7 & 1) + 72);
    }
    else
    {
      uint64_t v8 = *(void *)(v2
                     + 72
                     + 8 * (*(void *)(*(void *)(v2 + 72) + 128) < *(void *)(*(void *)(v2 + 80) + 128)));
      uint64_t v7 = *(void *)(v8 + 128);
    }
    *(void *)(a1 + 24) = v7 + 1;
    *(void *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    *(_DWORD *)(a1 + 128) = 0x1FFFF;
    v10 = *(void **)(v2 + 208);
    *(void *)(a1 + 72) = v10;
    void *v10 = 0;
    BOOL v11 = *(void **)(v2 + 200);
    *(void *)(a1 + 40) = v11;
    *(void *)(a1 + 48) = 0;
    *BOOL v11 = 0;
    *(void *)(a1 + 64) = 0;
    *(void *)(v2 + 96) = a1;
    memcpy(*(void **)(a1 + 96), *(const void **)(v2 + 152), 4 * *(unsigned int *)(v2 + 36));
    int v12 = 0;
    goto LABEL_41;
  }
  if (v3)
  {
    if ((*(unsigned char *)(v2 + 14) & 0x20) != 0)
    {
      int v9 = *(_DWORD **)(a1 + 72);
      if (v9) {
        goto LABEL_11;
      }
    }
    else
    {
      int v9 = pthread_getspecific(*(void *)(v2 + 160));
      if (v9)
      {
LABEL_11:
        if (v9[2] != *(_DWORD *)(v2 + 40) || *(void *)v9 != -1) {
          return 4294936513;
        }
        goto LABEL_37;
      }
    }
    int v13 = *(_DWORD *)(v2 + 40);
    pthread_t v14 = pthread_self();
    v15 = *(sem_t **)(v2 + 232);
    if (*(_DWORD *)(v2 + 224)) {
      goto LABEL_19;
    }
    uint64_t v6 = sub_263D93574(v2, 8, v13);
    if (v6) {
      return v6;
    }
    *(_DWORD *)(v2 + 224) = 1;
LABEL_19:
    while (sem_wait(v15))
    {
      uint64_t v6 = *__error();
      if (v6 != 4)
      {
        if (v6) {
          return v6;
        }
        break;
      }
    }
    uint64_t v16 = *(unsigned int *)(v3 + 48);
    if (v16)
    {
      uint64_t v17 = 0;
      v18 = (int *)(v3 + 136);
      while (1)
      {
        int v19 = *v18;
        v18 += 16;
        if (!v19) {
          break;
        }
        if (v16 == ++v17)
        {
          LODWORD(v17) = *(_DWORD *)(v3 + 48);
          break;
        }
      }
    }
    else
    {
      LODWORD(v17) = 0;
    }
    if (v17 == *(_DWORD *)(v2 + 24))
    {
      sem_post(v15);
      return 4294936506;
    }
    uint64_t v20 = v3 + ((unint64_t)v17 << 6);
    *(_DWORD *)(v20 + 136) = 0;
    *(void *)(v20 + 128) = -1;
    int v9 = (_DWORD *)(v20 + 128);
    *((void *)v9 + 2) = v14;
    if (v17 == v16)
    {
      LODWORD(v16) = v16 + 1;
      *(_DWORD *)(v3 + 48) = v16;
    }
    *(_DWORD *)(v2 + 28) = v16;
    v9[2] = v13;
    sem_post(v15);
    int v21 = *(_DWORD *)(v2 + 12);
    if ((v21 & 0x200000) != 0)
    {
      int v12 = v21 & 0x200000;
      goto LABEL_39;
    }
    uint64_t v22 = pthread_setspecific(*(void *)(v2 + 160), v9);
    if (v22)
    {
      uint64_t v6 = v22;
      v9[2] = 0;
      return v6;
    }
LABEL_37:
    int v12 = 0;
    do
LABEL_39:
      *(void *)int v9 = *(void *)(v3 + 40);
    while (*(void *)v9 != *(void *)(v3 + 40));
    uint64_t v23 = *(void *)v9;
    *(void *)(a1 + 24) = *(void *)v9;
    *(void *)(a1 + 72) = v9;
    uint64_t v8 = *(void *)(v2 + 8 * (v23 & 1) + 72);
    goto LABEL_41;
  }
  int v12 = 0;
  uint64_t v8 = *(void *)(v2
                 + 72
                 + 8 * (*(void *)(*(void *)(v2 + 72) + 128) < *(void *)(*(void *)(v2 + 80) + 128)));
  *(void *)(a1 + 24) = *(void *)(v8 + 128);
  *(void *)(a1 + 72) = 0;
LABEL_41:
  v24 = *(_OWORD **)(a1 + 88);
  long long v25 = *(_OWORD *)(v8 + 40);
  _OWORD *v24 = *(_OWORD *)(v8 + 24);
  v24[1] = v25;
  long long v26 = *(_OWORD *)(v8 + 56);
  long long v27 = *(_OWORD *)(v8 + 72);
  long long v28 = *(_OWORD *)(v8 + 104);
  v24[4] = *(_OWORD *)(v8 + 88);
  v24[5] = v28;
  v24[2] = v26;
  v24[3] = v27;
  *(void *)(a1 + 16) = *(void *)(v8 + 120) + 1;
  LODWORD(v24) = *(_DWORD *)(v2 + 32);
  *(_DWORD *)(a1 + 120) = v24;
  *(_DWORD *)(a1 + 124) = v4 & 0x20000;
  if (v24 >= 3)
  {
    unint64_t v29 = 2;
    uint64_t v30 = 100;
    do
    {
      int v31 = *(__int16 *)(*(void *)(v2 + 144) + 2 * v29);
      *(_WORD *)(*(void *)(a1 + 88) + v30) = *(_WORD *)(*(void *)(v2 + 144) + 2 * v29) & 0x7FFF;
      if (v31 < 0) {
        char v32 = 26;
      }
      else {
        char v32 = 0;
      }
      *(unsigned char *)(*(void *)(a1 + 112) + v29++) = v32;
      v30 += 48;
    }
    while (v29 < *(unsigned int *)(a1 + 120));
  }
  *(unsigned char *)(*(void *)(a1 + 112) + 1) = 24;
  **(unsigned char **)(a1 + 112) = 8;
  if ((*(_DWORD *)(v2 + 12) & 0x80000000) != 0)
  {
    uint64_t v6 = 4294936501;
  }
  else
  {
    if (*(void *)(v2 + 128) >= *(void *)(a1 + 16)) {
      return 0;
    }
    uint64_t v6 = 4294936511;
  }
  sub_263D8C1C0((unsigned int *)a1, v12 | 5);
  return v6;
}

uint64_t mdb_txn_begin(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  int v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & ~a3 & 0x20000) != 0) {
    return 13;
  }
  int v10 = v4 & 0x80000 | a3 & 0x20000;
  if (a2)
  {
    int v11 = *(_DWORD *)(a2 + 124);
    v10 |= v11;
    if ((v10 & 0xA0013) != 0)
    {
      if ((v11 & 0x20000) != 0) {
        return 22;
      }
      else {
        return 4294936514;
      }
    }
    int v13 = 152;
    int v14 = 57;
    uint64_t v15 = 19;
  }
  else
  {
    if ((a3 & 0x20000) == 0)
    {
      int v12 = *(void **)(a1 + 104);
      goto LABEL_35;
    }
    uint64_t v15 = 17;
    int v14 = 49;
    int v13 = 136;
  }
  size_t v16 = v13 + *(_DWORD *)(a1 + 36) * v14;
  uint64_t v17 = malloc_type_calloc(1uLL, v16, 0x8FD23A97uLL);
  if (!v17) {
    return 12;
  }
  int v12 = v17;
  v17[10] = *(void *)(a1 + 136);
  v17[11] = &v17[v15];
  uint64_t v18 = *(unsigned int *)(a1 + 36);
  v17[14] = (char *)v17 + v16 - v18;
  *((_DWORD *)v17 + 31) = v10;
  v17[4] = a1;
  if (!a2)
  {
    v17[12] = *(void *)(a1 + 152);
LABEL_35:
    uint64_t v5 = sub_263D8BA84((uint64_t)v12);
    if (v5) {
      goto LABEL_42;
    }
    goto LABEL_36;
  }
  v17[12] = *(void *)(a2 + 96);
  v17[13] = &v17[6 * v18 + v15];
  int v19 = malloc_type_malloc(0x200000uLL, 0x108004057E67DB5uLL);
  v12[9] = v19;
  if (!v19)
  {
LABEL_38:
    free(v19);
    free(v12);
    return 12;
  }
  uint64_t v20 = malloc_type_malloc(0x100008uLL, 0x100004000313F17uLL);
  if (!v20)
  {
    v12[5] = 0;
    int v19 = (void *)v12[9];
    goto LABEL_38;
  }
  *uint64_t v20 = xmmword_263D98830;
  v12[5] = (char *)v20 + 8;
  int v21 = (void *)v12[9];
  *((_DWORD *)v12 + 32) = *(_DWORD *)(a2 + 128);
  *int v21 = 0;
  v12[8] = 0;
  *((_OWORD *)v12 + 1) = *(_OWORD *)(a2 + 16);
  uint64_t v22 = *(unsigned int *)(a2 + 120);
  *(_DWORD *)(a2 + 124) |= 0x10u;
  *(void *)(a2 + 8) = v12;
  *int v12 = a2;
  *((_DWORD *)v12 + 30) = v22;
  memcpy((void *)v12[11], *(const void **)(a2 + 88), 48 * v22);
  if (*((_DWORD *)v12 + 30))
  {
    unint64_t v23 = 0;
    do
    {
      *(unsigned char *)(v12[14] + v23) = *(unsigned char *)(*(void *)(a2 + 112) + v23) & 0xFB;
      ++v23;
    }
    while (v23 < *((unsigned int *)v12 + 30));
  }
  *(_OWORD *)(v12 + 17) = *(_OWORD *)(a1 + 176);
  v24 = *(uint64_t **)(a1 + 176);
  if (!v24)
  {
LABEL_23:
    uint64_t v29 = *(unsigned int *)(a2 + 120);
    if ((int)v29 >= 1)
    {
      while (1)
      {
        uint64_t v36 = v29;
        uint64_t v37 = v29 - 1;
        uint64_t v30 = *(void **)(*(void *)(a2 + 104) + 8 * (v29 - 1));
        if (v30) {
          break;
        }
LABEL_32:
        uint64_t v29 = v37;
        if (v36 <= 1) {
          goto LABEL_36;
        }
      }
      if (v30[2]) {
        size_t v31 = 888;
      }
      else {
        size_t v31 = 392;
      }
      while (1)
      {
        char v32 = (void **)malloc_type_malloc(v31, 0x51FB5308uLL);
        if (!v32) {
          goto LABEL_41;
        }
        v33 = v32;
        memcpy(v32, v30, 0x188uLL);
        v30[1] = v33;
        v30[5] = v12[11] + 48 * v37;
        v30[3] = v12;
        v30[7] = v12[14] + v37;
        uint64_t v34 = v30[2];
        if (v34)
        {
          memcpy(v33 + 49, (const void *)v30[2], 0x1F0uLL);
          *(void *)(v34 + 24) = v12;
        }
        uint64_t v35 = v12[13];
        *uint64_t v30 = *(void *)(v35 + 8 * v37);
        *(void *)(v35 + 8 * v37) = v30;
        uint64_t v30 = *v33;
        if (!*v33) {
          goto LABEL_32;
        }
      }
    }
LABEL_36:
    uint64_t v5 = 0;
    *((_DWORD *)v12 + 31) |= v10;
    *a4 = v12;
    return v5;
  }
  long long v25 = (void *)(a1 + 176);
  uint64_t v26 = *v24;
  long long v27 = malloc_type_malloc(((*v24 << 32) + 0x200000000) >> 29, 0x100004000313F17uLL);
  if (v27)
  {
    *long long v27 = (int)v26;
    v27[1] = 0;
    long long v28 = v27 + 1;
    *long long v25 = v28;
    memcpy(v28, (const void *)v12[17], 8 * (int)v26 + 8);
    goto LABEL_23;
  }
  *long long v25 = 0;
LABEL_41:
  sub_263D8C1C0((unsigned int *)v12, 6);
  uint64_t v5 = 12;
LABEL_42:
  if (v12 != *(void **)(a1 + 104)) {
    free(v12);
  }
  return v5;
}

void sub_263D8C1C0(unsigned int *a1, int a2)
{
  uint64_t v4 = *((void *)a1 + 4);
  uint64_t v5 = a1[30];
  if ((int)v5 >= 3)
  {
    uint64_t v6 = *((void *)a1 + 14);
    unint64_t v7 = v5 + 1;
    do
    {
      uint64_t v8 = (v7 - 2);
      if ((*(unsigned char *)(v6 + v8) & 4) != 0)
      {
        if ((a2 & 0x10) != 0)
        {
          *(_WORD *)(*(void *)(v4 + 144) + 2 * v8) = *(_WORD *)(*((void *)a1 + 11) + 48 * v8 + 4) | 0x8000;
        }
        else
        {
          uint64_t v9 = *(void *)(v4 + 136);
          int v10 = *(void **)(v9 + 48 * v8 + 8);
          if (v10)
          {
            int v11 = (void *)(v9 + 48 * v8);
            *int v11 = 0;
            v11[1] = 0;
            uint64_t v12 = *(void *)(v4 + 152);
            *(_WORD *)(*(void *)(v4 + 144) + 2 * v8) = 0;
            ++*(_DWORD *)(v12 + 4 * v8);
            free(v10);
          }
        }
      }
      --v7;
    }
    while (v7 > 3);
  }
  if ((a2 & 0x10) != 0 && *(_DWORD *)(v4 + 32) < v5) {
    *(_DWORD *)(v4 + 32) = v5;
  }
  unsigned int v13 = a1[31];
  if ((v13 & 0x20000) != 0)
  {
    unint64_t v23 = (void *)*((void *)a1 + 9);
    if (v23)
    {
      *unint64_t v23 = -1;
      if ((*(unsigned char *)(v4 + 14) & 0x20) == 0)
      {
LABEL_33:
        *((void *)a1 + 9) = 0;
        goto LABEL_34;
      }
      if ((a2 & 0x200000) != 0)
      {
        *(_DWORD *)(*((void *)a1 + 9) + 8) = 0;
        goto LABEL_33;
      }
    }
LABEL_34:
    int v24 = a1[31] | 1;
    a1[30] = 0;
    a1[31] = v24;
    goto LABEL_42;
  }
  if ((v13 & 1) == 0)
  {
    uint64_t v15 = (_OWORD *)(v4 + 176);
    uint64_t v14 = *(void *)(v4 + 176);
    if ((a2 & 0x10) == 0) {
      sub_263D8D200(*((void *)a1 + 13), a1[30], 0);
    }
    if ((*(unsigned char *)(v4 + 14) & 8) == 0)
    {
      size_t v16 = (unsigned int *)*((void *)a1 + 9);
      unsigned int v17 = *v16;
      if (*v16)
      {
        uint64_t v18 = *((void *)a1 + 4);
        unsigned int v19 = 1;
        do
        {
          uint64_t v20 = *(void **)&v16[4 * v19 + 2];
          if ((*((_WORD *)v20 + 5) & 4) != 0 && *((_DWORD *)v20 + 3) != 1)
          {
            free(v20);
          }
          else
          {
            *uint64_t v20 = *(void *)(v18 + 192);
            *(void *)(v18 + 192) = v20;
          }
          ++v19;
        }
        while (v19 <= v17);
      }
      *(void *)size_t v16 = 0;
    }
    *((void *)a1 + 15) = 0x100000000;
    uint64_t v21 = *(void *)a1;
    if (*(void *)a1)
    {
      *(void *)(v21 + 8) = 0;
      *(_DWORD *)(v21 + 124) &= ~0x10u;
      _OWORD *v15 = *(_OWORD *)(a1 + 34);
      uint64_t v22 = *((void *)a1 + 5);
      if (v22) {
        free((void *)(v22 - 8));
      }
      free(*((void **)a1 + 9));
    }
    else
    {
      mdb_midl_shrink((uint64_t *)a1 + 5);
      *(void *)(v4 + 200) = *((void *)a1 + 5);
      *(void *)(v4 + 96) = 0;
      *(void *)uint64_t v15 = 0;
      *(void *)(v4 + 184) = 0;
      if (*(void *)(v4 + 64)) {
        sem_post(*(sem_t **)(v4 + 240));
      }
      LOBYTE(a2) = 0;
    }
    uint64_t v25 = *((void *)a1 + 8);
    if (v25) {
      free((void *)(v25 - 8));
    }
    if (v14) {
      free((void *)(v14 - 8));
    }
  }
LABEL_42:
  if ((a2 & 0x20) != 0)
  {
    free(a1);
  }
}

uint64_t mdb_txn_env(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t mdb_txn_id(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void mdb_txn_reset(uint64_t a1)
{
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 126) & 2) != 0) {
      sub_263D8C1C0((unsigned int *)a1, 3);
    }
  }
}

void mdb_txn_abort(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 8)) {
      mdb_txn_abort();
    }
    sub_263D8C1C0((unsigned int *)a1, 2097186);
  }
}

uint64_t mdb_txn_commit(uint64_t a1)
{
  if (!a1) {
    return 22;
  }
  if (*(void *)(a1 + 8))
  {
    uint64_t appended = mdb_txn_commit();
    if (appended) {
      goto LABEL_9;
    }
  }
  int v3 = 2097201;
  int v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) != 0) {
    goto LABEL_217;
  }
  uint64_t v5 = *(void *)a1;
  if ((v4 & 3) != 0)
  {
    if (v5) {
      *(_DWORD *)(v5 + 124) |= 2u;
    }
    uint64_t appended = 4294936514;
    goto LABEL_9;
  }
  if (!v5)
  {
    uint64_t v21 = *(void *)(a1 + 32);
    if (*(void *)(v21 + 96) != a1)
    {
      uint64_t appended = 22;
      goto LABEL_9;
    }
    sub_263D8D200(*(void *)(a1 + 104), *(_DWORD *)(a1 + 120), 0);
    if (**(void **)(a1 + 72) || (*(unsigned char *)(a1 + 124) & 0xC) != 0)
    {
      if (*(_DWORD *)(a1 + 120) >= 3u)
      {
        uint64_t v164 = 0;
        long long v162 = 0u;
        long long v163 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        memset(v147, 0, sizeof(v147));
        long long v146 = 0u;
        long long v144 = xmmword_263D98840;
        sub_263D8D2EC((uint64_t)&v146, (void *)a1, 1u, 0);
        unint64_t v22 = *(unsigned int *)(a1 + 120);
        if (v22 >= 3)
        {
          unint64_t v23 = 2;
          uint64_t v24 = 96;
          do
          {
            if (*(unsigned char *)(*(void *)(a1 + 112) + v23))
            {
              if (*(_DWORD *)(*(void *)(a1 + 96) + 4 * v23) != *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 152)
                                                                            + 4 * v23))
              {
                uint64_t appended = 4294936516;
                goto LABEL_9;
              }
              uint64_t v25 = *(void *)(a1 + 80);
              *((void *)&v144 + 1) = *(void *)(a1 + 88) + v24;
              uint64_t v26 = mdb_cursor_put((uint64_t)&v146, (size_t *)(v25 + v24), (uint64_t)&v144, 2);
              if (v26) {
                goto LABEL_191;
              }
              unint64_t v22 = *(unsigned int *)(a1 + 120);
            }
            ++v23;
            v24 += 48;
          }
          while (v23 < v22);
        }
      }
      uint64_t v164 = 0;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      memset(v147, 0, sizeof(v147));
      long long v146 = 0u;
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(int *)(v27 + 216);
      unint64_t v145 = 0;
      sub_263D8D2EC((uint64_t)&v146, (void *)a1, 0, 0);
      uint64_t v140 = v28;
      if (!*(void *)(v27 + 176)) {
        goto LABEL_48;
      }
      uint64_t v29 = sub_263D93614((uint64_t)&v146, 0, 5);
      if (v29)
      {
        uint64_t appended = v29;
        if (v29 != -30798)
        {
LABEL_9:
          mdb_txn_abort(a1);
          return appended;
        }
      }
      LODWORD(v28) = v140;
      if (!*(void *)(v27 + 176))
      {
LABEL_48:
        uint64_t v30 = *(void *)(a1 + 48);
        if (v30)
        {
          uint64_t v31 = *(void *)(a1 + 72);
          uint64_t appended = mdb_midl_need((_DWORD **)(a1 + 40), *(_DWORD *)(a1 + 56));
          if (appended) {
            goto LABEL_9;
          }
          do
          {
            char v32 = *(uint64_t **)(a1 + 40);
            uint64_t v33 = *v32 + 1;
            *char v32 = v33;
            v32[v33] = *(void *)v30;
            if ((*(unsigned char *)(a1 + 126) & 8) != 0)
            {
              if (*(void *)v31)
              {
                unint64_t v34 = 1;
                do
                {
                  if (*(void *)(v31 + 16 * v34) == *(void *)v30) {
                    break;
                  }
                  unint64_t v34 = (v34 + 1);
                }
                while (*(void *)v31 >= v34);
              }
              else
              {
                LODWORD(v34) = 1;
              }
            }
            else
            {
              LODWORD(v34) = mdb_mid2l_search((unsigned int *)v31, *(void *)v30);
              if ((*(_WORD *)(v30 + 10) & 4) != 0 && *(_DWORD *)(v30 + 12) != 1)
              {
                free((void *)v30);
              }
              else
              {
                *(void *)uint64_t v30 = *(void *)(v27 + 192);
                *(void *)(v27 + 192) = v30;
              }
            }
            *(void *)(v31 + 16 * v34 + 8) = 0;
            uint64_t v30 = *(void *)(v30 + 32);
          }
          while (v30);
          unint64_t v35 = *(void *)v31;
          LODWORD(v28) = v140;
          if (*(void *)(v31 + 24))
          {
            unint64_t v36 = 1;
            while (v35 >= v36)
            {
              unint64_t v36 = (v36 + 1);
              unsigned int v37 = v36;
              if (!*(void *)(v31 + 16 * v36 + 8)) {
                goto LABEL_123;
              }
            }
            unsigned int v37 = v36;
          }
          else
          {
            unsigned int v37 = 1;
            unint64_t v36 = 1;
          }
LABEL_123:
          if (v35 >= v36)
          {
            LODWORD(v73) = v37;
            while (1)
            {
              do
              {
                unint64_t v73 = (v73 + 1);
                if (*(void *)(v31 + 16 * v73 + 8)) {
                  BOOL v74 = 0;
                }
                else {
                  BOOL v74 = v35 >= v73;
                }
              }
              while (v74);
              if (v35 < v73) {
                break;
              }
              *(_OWORD *)(v31 + 16 * v37++) = *(_OWORD *)(v31 + 16 * v73);
              unint64_t v35 = *(void *)v31;
            }
            uint64_t v72 = v37 - 1;
          }
          else
          {
            uint64_t v72 = 0;
          }
          *(void *)uint64_t v31 = v72;
          *(void *)(a1 + 48) = 0;
          *(_DWORD *)(a1 + 56) = 0;
        }
      }
      v139 = (uint64_t **)(v27 + 176);
      uint64_t v134 = v21;
      unint64_t v75 = 0;
      unint64_t v76 = 0;
      uint64_t v77 = 0;
      uint64_t v78 = 0;
      int v137 = *(_DWORD *)(v27 + 12) & 0x1080000;
      v79 = (int **)(a1 + 40);
      uint64_t v136 = (int)v28 + 1;
      v80 = (void *)(a1 + 24);
      int v138 = 1;
      while (1)
      {
LABEL_135:
        long long v144 = 0uLL;
        size_t v142 = 0;
        v143 = 0;
        if (v75 < *(void *)(v27 + 184))
        {
          while (1)
          {
            uint64_t v26 = sub_263D8F70C((uint64_t)&v146, &v144, 0);
            if (v26) {
              goto LABEL_191;
            }
            unint64_t v75 = **((void **)&v144 + 1);
            unint64_t v145 = **((void **)&v144 + 1);
            uint64_t v26 = mdb_cursor_del((uint64_t)&v146, 0);
            if (v26) {
              goto LABEL_191;
            }
            if (v75 >= *(void *)(v27 + 184))
            {
              uint64_t v77 = 0;
              uint64_t v78 = 0;
              break;
            }
          }
        }
        if (v76 < *(void *)*v79) {
          break;
        }
        v135 = v80;
        v85 = *v139;
        if (*v139) {
          uint64_t v86 = *v85;
        }
        else {
          uint64_t v86 = 0;
        }
        uint64_t v87 = *(int *)(a1 + 56);
        uint64_t v88 = v86 + v87;
        if (v78 >= v86 + v87)
        {
          BOOL v90 = v78 == v86 + v87 || v138 < 1;
          if (v90)
          {
            v96 = *(void **)(a1 + 48);
            if (v96)
            {
              uint64_t v97 = *(unsigned int *)(a1 + 56);
              uint64_t appended = mdb_midl_need((_DWORD **)v139, (2 * v87) | 1);
              if (appended) {
                goto LABEL_9;
              }
              v85 = *v139;
              v98 = (int *)&v85[*(v85 - 1) - v97];
              unsigned int v99 = 1;
              do
              {
                unsigned int v100 = v99;
                *(void *)&v98[2 * v99] = *v96;
                v96 = (void *)v96[4];
                ++v99;
              }
              while (v96);
              *(void *)v98 = v100;
              mdb_midl_sort(v98);
              mdb_midl_xmerge(v85, (uint64_t *)v98);
              *(void *)(a1 + 48) = 0;
              *(_DWORD *)(a1 + 56) = 0;
              uint64_t v101 = *v85;
            }
            else
            {
              uint64_t v101 = v86 + v87;
            }
            if (!v101) {
              goto LABEL_221;
            }
            long long v144 = 0uLL;
            size_t v142 = 0;
            v143 = 0;
            uint64_t appended = sub_263D8F70C((uint64_t)&v146, &v144, &v142);
            if (!appended)
            {
              v102 = &v85[v101];
              while (1)
              {
                uint64_t v141 = 0;
                uint64_t v141 = **((void **)&v144 + 1);
                int64_t v103 = (v142 >> 3) - 1;
                *((void *)&v144 + 1) = &v141;
                uint64_t v104 = v101;
                if (v103 > v101)
                {
                  size_t v142 = 8 * v101 + 8;
                  int64_t v103 = v101;
                }
                v102 -= v103;
                v143 = v102;
                int64_t v105 = *v102;
                int64_t *v102 = v103;
                uint64_t v106 = mdb_cursor_put((uint64_t)&v146, (size_t *)&v144, (uint64_t)&v142, 64);
                int64_t *v102 = v105;
                uint64_t v101 = v104 - v103;
                if (v104 == v103 || v106 != 0) {
                  break;
                }
                uint64_t v26 = sub_263D8EFCC((uint64_t)&v146, &v144, &v142, 8);
                if (v26) {
                  goto LABEL_191;
                }
              }
              uint64_t appended = v106;
              if (!v106)
              {
LABEL_221:
                uint64_t v108 = *(void *)(v134 + 176);
                if (v108) {
                  free((void *)(v108 - 8));
                }
                *(void *)(v134 + 176) = 0;
                mdb_midl_shrink((uint64_t *)(a1 + 40));
                uint64_t appended = sub_263D8E1CC(a1, 0);
                if (!appended)
                {
                  uint64_t appended = mdb_env_sync(v134, 0);
                  if (!appended)
                  {
                    long long v146 = 0uLL;
                    uint64_t v109 = *(void *)(a1 + 24);
                    uint64_t v110 = *(void *)(a1 + 32);
                    int v111 = *(_DWORD *)(v110 + 12);
                    uint64_t v112 = *(void *)(v110 + 72 + 8 * (v109 & 1));
                    unint64_t v113 = *(void *)(*(void *)(v110 + 72 + 8 * !(v109 & 1)) + 16);
                    if (v113 <= *(void *)(v110 + 112)) {
                      unint64_t v113 = *(void *)(v110 + 112);
                    }
                    if ((v111 & 0x80000) == 0)
                    {
                      *(void *)&long long v144 = *(void *)(v112 + 128);
                      uint64_t v114 = *(void *)(v112 + 120);
                      *(void *)&v147[0] = v113;
                      v115 = *(long long **)(a1 + 88);
                      long long v116 = *v115;
                      long long v117 = v115[1];
                      *(_OWORD *)((char *)&v147[2] + 8) = v115[2];
                      *(_OWORD *)((char *)&v147[1] + 8) = v117;
                      *(_OWORD *)((char *)v147 + 8) = v116;
                      long long v119 = v115[4];
                      long long v118 = v115[5];
                      *(_OWORD *)((char *)&v147[3] + 8) = v115[3];
                      *(_OWORD *)((char *)&v147[5] + 8) = v118;
                      *(_OWORD *)((char *)&v147[4] + 8) = v119;
                      *((void *)&v147[6] + 1) = *(void *)(a1 + 16) - 1;
                      *(void *)&long long v148 = v109;
                      off_t v120 = v112 - *(void *)(v110 + 56) + 16;
                      int v121 = *(_DWORD *)(v110 + 8 * ((v111 & 0x50000) == 0));
                      while (1)
                      {
                        int v122 = pwrite(v121, v147, 0x78uLL, v120);
                        if (v122 == 120) {
                          break;
                        }
                        if ((v122 & 0x80000000) == 0)
                        {
                          uint64_t appended = 5;
LABEL_214:
                          *((void *)&v147[6] + 1) = v114;
                          *(void *)&long long v148 = v144;
                          pwrite(*(_DWORD *)v110, v147, 0x78uLL, v120);
                          goto LABEL_215;
                        }
                        uint64_t appended = *__error();
                        if (appended != 4) {
                          goto LABEL_214;
                        }
                      }
LABEL_206:
                      uint64_t v129 = *(void *)(v110 + 64);
                      if (v129) {
                        *(void *)(v129 + 40) = *v135;
                      }
                      goto LABEL_216;
                    }
                    *(void *)(v112 + 16) = v113;
                    v123 = *(long long **)(a1 + 88);
                    long long v124 = *v123;
                    long long v125 = v123[1];
                    *(_OWORD *)(v112 + 56) = v123[2];
                    *(_OWORD *)(v112 + 40) = v125;
                    *(_OWORD *)(v112 + 24) = v124;
                    v126 = *(_OWORD **)(a1 + 88);
                    long long v127 = v126[3];
                    long long v128 = v126[4];
                    *(_OWORD *)(v112 + 104) = v126[5];
                    *(_OWORD *)(v112 + 88) = v128;
                    *(_OWORD *)(v112 + 72) = v127;
                    *(void *)(v112 + 120) = *(void *)(a1 + 16) - 1;
                    *(void *)(v112 + 128) = *(void *)(a1 + 24);
                    if ((v111 & 0x50000) != 0) {
                      goto LABEL_206;
                    }
                    int v130 = (*(_DWORD *)(v110 + 12) & 0x100000) != 0 ? 1 : 16;
                    uint64_t v131 = v112 - 16;
                    int v132 = (*(_DWORD *)(v110 + 20) - 1) & (v131 - *(_DWORD *)(v110 + 56));
                    if (!msync((void *)(v131 - v132), (v132 + *(_DWORD *)(v110 + 16)), v130)) {
                      goto LABEL_206;
                    }
                    uint64_t appended = *__error();
LABEL_215:
                    *(_DWORD *)(v110 + 12) |= 0x80000000;
                    if (!appended)
                    {
LABEL_216:
                      int v3 = 16;
                      goto LABEL_217;
                    }
                  }
                }
              }
            }
            goto LABEL_9;
          }
          int v138 = 0;
          unint64_t v89 = v145;
          v80 = v135;
        }
        else
        {
          unint64_t v89 = v145;
          v80 = v135;
          if (v77 >= v140 && v145 >= 2)
          {
            uint64_t v77 = 0;
            unint64_t v89 = --v145;
          }
        }
        uint64_t v91 = v78 - v77;
        uint64_t v92 = v88 - v91;
        if (v88 - v91 > v140 && v89 >= 2) {
          uint64_t v77 = v140 + (uint64_t)(v92 / v89) / v136 * v136;
        }
        else {
          uint64_t v77 = v92 & ~(v92 >> 63);
        }
        *(void *)&long long v144 = 8;
        *((void *)&v144 + 1) = &v145;
        size_t v142 = 8 * v77 + 8;
        uint64_t v26 = mdb_cursor_put((uint64_t)&v146, (size_t *)&v144, (uint64_t)&v142, 0x10000);
        if (v26) {
          goto LABEL_191;
        }
        if (v77 > v140 && v137 == 0) {
          uint64_t v95 = v77;
        }
        else {
          uint64_t v95 = 0;
        }
        bzero(&v143[v95 & (v95 >> 63)], 8 * (v95 - (v95 & (v95 >> 63))) + 8);
        uint64_t v78 = v77 + v91;
      }
      if (!v76)
      {
        uint64_t v81 = sub_263D93614((uint64_t)&v146, 0, 9);
        if (v81)
        {
          uint64_t appended = v81;
          if (v81 != -30798) {
            goto LABEL_9;
          }
        }
      }
      v82 = *v79;
      *(void *)&long long v144 = 8;
      *((void *)&v144 + 1) = v80;
      unint64_t v83 = *(void *)v82;
      while (1)
      {
        unint64_t v76 = v83;
        size_t v142 = 8 * v83 + 8;
        uint64_t v26 = mdb_cursor_put((uint64_t)&v146, (size_t *)&v144, (uint64_t)&v142, 0x10000);
        if (v26) {
          break;
        }
        v84 = *v79;
        unint64_t v83 = *(void *)*v79;
        if (v76 >= v83)
        {
          mdb_midl_sort(*v79);
          memcpy(v143, v84, v142);
          goto LABEL_135;
        }
      }
LABEL_191:
      uint64_t appended = v26;
      goto LABEL_9;
    }
LABEL_217:
    sub_263D8C1C0((unsigned int *)a1, v3);
    return 0;
  }
  uint64_t appended = mdb_midl_append_list((uint64_t **)(v5 + 40), *(uint64_t **)(a1 + 40));
  if (appended) {
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    free((void *)(v6 - 8));
  }
  *(void *)(v5 + 16) = *(void *)(a1 + 16);
  *(_DWORD *)(v5 + 124) = *(_DWORD *)(a1 + 124);
  sub_263D8D200(*(void *)(a1 + 104), *(_DWORD *)(a1 + 120), 1);
  memcpy(*(void **)(v5 + 88), *(const void **)(a1 + 88), 48 * *(unsigned int *)(a1 + 120));
  *(_DWORD *)(v5 + 120) = *(_DWORD *)(a1 + 120);
  **(unsigned char **)(v5 + 112) = **(unsigned char **)(a1 + 112);
  *(unsigned char *)(*(void *)(v5 + 112) + 1) = *(unsigned char *)(*(void *)(a1 + 112) + 1);
  if (*(_DWORD *)(a1 + 120) >= 3u)
  {
    unint64_t v7 = 2;
    do
    {
      *(unsigned char *)(*(void *)(v5 + 112) + v7) = *(unsigned char *)(*(void *)(a1 + 112) + v7) | *(unsigned char *)(*(void *)(v5 + 112)
                                                                                                 + v7) & 4;
      ++v7;
    }
    while (v7 < *(unsigned int *)(a1 + 120));
  }
  uint64_t v8 = *(unsigned int **)(v5 + 64);
  int v10 = *(unsigned int **)(v5 + 72);
  uint64_t v9 = (int **)(v5 + 64);
  int v11 = *(unsigned int **)(a1 + 72);
  if (v8)
  {
    unsigned int v12 = *v8;
    if (*v8)
    {
      *(void *)uint64_t v8 = -1;
      unsigned int v13 = *v11;
      if (*v11)
      {
        if (v13 + 1 > 2) {
          uint64_t v14 = v13 + 1;
        }
        else {
          uint64_t v14 = 2;
        }
        uint64_t v15 = 1;
        unsigned int v16 = v12;
        int v17 = v12;
        do
        {
          unint64_t v18 = 2 * *(void *)&v11[4 * v15];
          do
          {
            int v19 = v17;
            unint64_t v20 = *(void *)&v8[2 * v17--];
          }
          while (v18 > v20);
          if (v18 == v20)
          {
            *(void *)&v8[2 * v19] = 1;
            unsigned int v16 = v17;
          }
          else
          {
            ++v17;
          }
          ++v15;
        }
        while (v15 != v14);
      }
      else
      {
        unsigned int v16 = v12;
      }
      for (unsigned int i = v16 + 1; i <= v12; ++i)
      {
        uint64_t v39 = *(void *)&v8[2 * i];
        if ((v39 & 1) == 0) {
          *(void *)&v8[2 * ++v16] = v39;
        }
      }
      *(void *)uint64_t v8 = v16;
    }
  }
  v40 = *(unint64_t **)(a1 + 64);
  if (v40)
  {
    unint64_t v41 = *v40;
    if (*v40)
    {
      unint64_t v42 = 1;
      do
      {
        unint64_t v43 = v40[v42];
        if ((v43 & 1) == 0)
        {
          unint64_t v44 = v43 >> 1;
          unsigned int v45 = mdb_mid2l_search(v10, v43 >> 1);
          if (*(void *)v10 >= (unint64_t)v45)
          {
            unint64_t v46 = v45;
            if (*(void *)&v10[4 * v45] == v44)
            {
              free(*(void **)&v10[4 * v45 + 2]);
              uint64_t v47 = *(void *)v10;
              if (*(void *)v10 > v46)
              {
                unsigned int v48 = v46 + 1;
                do
                {
                  *(_OWORD *)&v10[4 * v46] = *(_OWORD *)&v10[4 * v48];
                  unint64_t v46 = v48;
                  uint64_t v47 = *(void *)v10;
                  BOOL v90 = *(void *)v10 > (unint64_t)v48++;
                }
                while (v90);
              }
              *(void *)int v10 = v47 - 1;
              v40 = *(unint64_t **)(a1 + 64);
              unint64_t v41 = *v40;
            }
          }
        }
        unint64_t v42 = (v42 + 1);
      }
      while (v41 >= v42);
    }
  }
  uint64_t v49 = *(void *)v10;
  *(void *)int v10 = 0;
  if (*(void *)v5)
  {
    uint64_t v50 = *(void *)v11;
    unsigned int v51 = *(void *)v11 + v49;
    int v52 = mdb_mid2l_search(v11, *(void *)&v10[4 * v49] + 1);
    int v53 = v52 - 1;
    if (v52 != 1 && v49 != 0)
    {
      int v55 = v49;
      do
      {
        unint64_t v56 = *(void *)&v11[4 * v53];
        int v57 = v55 + 1;
        do
          unint64_t v58 = *(void *)&v10[4 * --v57];
        while (v56 < v58);
        int v59 = v56 == v58;
        v51 -= v59;
        if (!--v53) {
          break;
        }
        int v55 = v57 - v59;
      }
      while (v55);
    }
  }
  else
  {
    unsigned int v51 = 0x1FFFF - *(_DWORD *)(a1 + 128);
    LODWORD(v50) = *v11;
  }
  uint64_t v50 = v50;
  if (v50)
  {
    unsigned int v60 = v51;
    do
    {
      v61 = &v11[4 * v50];
      unint64_t v62 = *(void *)v61;
      v63 = &v10[4 * v49];
      uint64_t v64 = *(void *)v63;
      if (*(void *)v61 >= *(void *)v63)
      {
        uint64_t v65 = v49;
      }
      else
      {
        do
        {
          *(_OWORD *)&v10[4 * v60--] = *(_OWORD *)v63;
          uint64_t v49 = (v49 - 1);
          v63 = &v10[4 * v49];
          uint64_t v64 = *(void *)v63;
        }
        while (v62 < *(void *)v63);
        uint64_t v65 = v49;
      }
      if (v62 == v64)
      {
        LODWORD(v49) = v49 - 1;
        free(*(void **)&v10[4 * v65 + 2]);
      }
      *(_OWORD *)&v10[4 * v60--] = *(_OWORD *)v61;
      --v50;
    }
    while (v50);
  }
  *(void *)int v10 = v51;
  free(*(void **)(a1 + 72));
  *(_DWORD *)(v5 + 128) = *(_DWORD *)(a1 + 128);
  v66 = *(uint64_t **)(a1 + 64);
  if (v66)
  {
    if (*v9)
    {
      uint64_t appended = mdb_midl_append_list((uint64_t **)(v5 + 64), v66);
      if (appended) {
        *(_DWORD *)(v5 + 124) |= 2u;
      }
      uint64_t v67 = *(void *)(a1 + 64);
      if (v67) {
        free((void *)(v67 - 8));
      }
      mdb_midl_sort(*v9);
    }
    else
    {
      uint64_t appended = 0;
      *uint64_t v9 = (int *)v66;
    }
  }
  else
  {
    uint64_t appended = 0;
  }
  v68 = (void *)(v5 + 48);
  do
  {
    v69 = v68;
    uint64_t v70 = *v68;
    v68 = (void *)(*v68 + 32);
  }
  while (v70);
  void *v69 = *(void *)(a1 + 48);
  *(_DWORD *)(v5 + 56) += *(_DWORD *)(a1 + 56);
  *(void *)(v5 + 8) = 0;
  uint64_t v71 = *(void *)(a1 + 136);
  if (v71) {
    free((void *)(v71 - 8));
  }
  free((void *)a1);
  return appended;
}

void sub_263D8D200(uint64_t a1, int a2, int a3)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    do
    {
      uint64_t v6 = *(void **)(a1 + 8 * (v5 - 1));
      while (v6)
      {
        unint64_t v7 = v6;
        uint64_t v6 = (void *)*v6;
        uint64_t v8 = (void *)v7[1];
        if (v8)
        {
          if (a3)
          {
            *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
            v7[3] = v8[3];
            v7[5] = v8[5];
            v7[7] = v8[7];
            uint64_t v9 = v7[2];
            if (v9) {
              *(void *)(v9 + 24) = v8[3];
            }
          }
          else
          {
            memcpy(v7, (const void *)v7[1], 0x188uLL);
            int v10 = (void *)v7[2];
            if (v10) {
              memcpy(v10, v8 + 49, 0x1F0uLL);
            }
          }
        }
        else
        {
          uint64_t v8 = v7;
        }
        free(v8);
      }
      *(void *)(a1 + 8 * (v5 - 1)) = 0;
    }
    while (v5-- > 1);
  }
}

uint64_t sub_263D8D2EC(uint64_t result, void *a2, unsigned int a3, uint64_t a4)
{
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 32) = a3;
  *(void *)(result + 24) = a2;
  uint64_t v4 = a2[10] + 48 * a3;
  *(void *)(result + 40) = a2[11] + 48 * a3;
  *(void *)(result + 48) = v4;
  uint64_t v5 = (unsigned char *)(a2[14] + a3);
  *(_WORD *)(result + 328) = 0;
  *(void *)(result + 64) = 0;
  *(void *)(result + 72) = 0;
  *(void *)(result + 56) = v5;
  if ((*(unsigned char *)(a2[11] + 48 * a3 + 4) & 4) != 0)
  {
    *(void *)(result + 16) = a4;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = a2;
    *(void *)(a4 + 40) = a4 + 392;
    *(void *)(a4 + 48) = a4 + 440;
    *(_DWORD *)(a4 + 32) = a3;
    *(void *)(a4 + 56) = a4 + 488;
    *(void *)(a4 + 64) = 0x400000000;
    *(void *)(a4 + 440) = 0;
    *(void *)(a4 + 448) = 0;
    uint64_t v6 = *(void *)(result + 48);
    uint64_t v5 = *(unsigned char **)(result + 56);
    uint64_t v8 = *(void *)(v6 + 24);
    uint64_t v7 = *(void *)(v6 + 32);
    *(void *)(a4 + 456) = v8;
    *(void *)(a4 + 464) = 0;
    *(void *)(a4 + 472) = v7;
  }
  else
  {
    *(void *)(result + 16) = 0;
  }
  if ((*v5 & 2) != 0) {
    return sub_263D93614(result, 0, 2);
  }
  return result;
}

uint64_t mdb_cursor_put(uint64_t a1, size_t *a2, uint64_t a3, int a4)
{
  long long v127 = 0;
  uint64_t result = 22;
  if (a1 && a2)
  {
    uint64_t v125 = 0;
    v126 = 0;
    size_t v123 = 0;
    long long v124 = 0;
    size_t v121 = 0;
    int v122 = 0;
    long long v120 = 0u;
    memset(v119, 0, sizeof(v119));
    uint64_t v9 = *(void *)(a1 + 24);
    uint64_t v10 = *(void *)(v9 + 32);
    if ((a4 & 0x80000) != 0)
    {
      unsigned int v11 = *(_DWORD *)(a3 + 16);
      *(void *)(a3 + 16) = 0;
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) == 0) {
        return 4294936512;
      }
    }
    else
    {
      unsigned int v11 = 0;
    }
    int v12 = *(_DWORD *)(v9 + 124);
    if ((v12 & 0x20013) != 0)
    {
      if ((v12 & 0x20000) != 0) {
        return 13;
      }
      else {
        return 4294936514;
      }
    }
    if (*a2 - 512 < 0xFFFFFFFFFFFFFE01) {
      return 4294936515;
    }
    uint64_t v13 = *(void *)(a1 + 40);
    unint64_t v14 = 511;
    if ((*(_WORD *)(v13 + 4) & 4) == 0) {
      unint64_t v14 = 0xFFFFFFFFLL;
    }
    if (*(void *)a3 > v14) {
      return 4294936515;
    }
    size_t v123 = 0;
    if ((a4 & 0x40) != 0)
    {
      unsigned int v17 = *(_DWORD *)(a1 + 68);
      if ((v17 & 1) == 0) {
        return result;
      }
      LODWORD(v16) = 0;
    }
    else if (*(void *)(v13 + 40) == -1)
    {
      unsigned int v17 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
      *(_DWORD *)(a1 + 64) = 0;
      *(_DWORD *)(a1 + 68) = v17;
      LODWORD(v16) = -30770;
    }
    else
    {
      int v118 = 0;
      long long v117 = 0uLL;
      if ((a4 & 0x20000) != 0)
      {
        v116[0] = 0;
        v116[1] = 0;
        uint64_t v16 = sub_263D8F220(a1, v116, &v117);
        if (!v16)
        {
          if ((*(int (**)(size_t *, char **))(*(void *)(a1 + 48) + 16))(a2, v116) < 1)
          {
            uint64_t v16 = 4294936497;
          }
          else
          {
            uint64_t v18 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
            ++*(_WORD *)(v18 + 328);
            uint64_t v16 = 4294936498;
          }
        }
      }
      else
      {
        uint64_t v15 = sub_263D8E6F4(a1, a2, &v117, 15, &v118);
        uint64_t v16 = v15;
        if ((a4 & 0x10) != 0 && !v15)
        {
          *(_OWORD *)a3 = v117;
          return 4294936497;
        }
      }
      if (v16 != -30798 && v16) {
        return v16;
      }
      unsigned int v17 = *(_DWORD *)(a1 + 68);
    }
    if ((v17 & 8) != 0) {
      *(_DWORD *)(a1 + 68) = v17 ^ 8;
    }
    if ((a4 & 0x8000) != 0) {
      goto LABEL_39;
    }
    int v19 = (uint64_t *)a3;
    if ((a4 & 0x80000) != 0)
    {
      uint64_t v125 = *(void *)a3 * v11;
      int v19 = &v125;
    }
    uint64_t result = sub_263D8F82C(a1, a2, v19);
    if (!result)
    {
LABEL_39:
      unsigned int v20 = a4 & 0xFFFF7FFF;
      if (v16 == -30770)
      {
        *(void *)&long long v117 = 0;
        uint64_t result = sub_263D8FA98(a1, 2, 1, (char **)&v117);
        if (result) {
          return result;
        }
        uint64_t v21 = *(unsigned __int16 *)(a1 + 64);
        if (v21 < 0x20)
        {
          uint64_t v22 = v117;
          *(_WORD *)(a1 + 64) = v21 + 1;
          *(_WORD *)(a1 + 66) = v21;
          *(void *)(a1 + 8 * v21 + 72) = v22;
          *(_WORD *)(a1 + 2 * v21 + 328) = 0;
        }
        else
        {
          *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
          uint64_t v22 = v117;
        }
        uint64_t v24 = *(void *)(a1 + 40);
        *(void *)(v24 + 40) = *(void *)v22;
        ++*(_WORD *)(v24 + 6);
        **(unsigned char **)(a1 + 56) |= 1u;
        uint64_t v23 = *(void *)(a1 + 40);
        if ((*(_WORD *)(v23 + 4) & 0x14) == 0x10) {
          *(_WORD *)(v22 + 10) |= 0x20u;
        }
        *(_DWORD *)(a1 + 68) |= 1u;
LABEL_51:
        if ((*(_WORD *)(v23 + 4) & 4) == 0 || *a2 + *(void *)a3 + 8 <= *(unsigned int *)(v10 + 220))
        {
          int v113 = 0;
          uint64_t v114 = 0;
          int v27 = 0;
          uint64_t v28 = (size_t *)a3;
          goto LABEL_129;
        }
        int v111 = v16;
        int v113 = 0;
        uint64_t v25 = *(char **)(v10 + 88);
        *((_WORD *)v25 + 4) = *(void *)a3;
        *((_DWORD *)v25 + 3) = 1048592;
        size_t v121 = 16;
        __int16 v26 = 18;
        goto LABEL_112;
      }
      uint64_t result = sub_263D8FB5C(a1);
      if (result) {
        return result;
      }
      if (v16)
      {
        uint64_t v23 = *(void *)(a1 + 40);
        goto LABEL_51;
      }
      uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v30 = *(void *)(a1 + 8 * v29 + 72);
      uint64_t v31 = *(unsigned int **)(a1 + 40);
      if ((*(_WORD *)(v30 + 10) & 0x20) != 0)
      {
        uint64_t v32 = *v31;
        size_t v33 = *a2;
        if (*a2 != v32) {
          return 4294936515;
        }
        unint64_t v34 = (void *)(v30 + v32 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16);
        unint64_t v35 = (const void *)a2[1];
LABEL_59:
        memcpy(v34, v35, v33);
        uint64_t v36 = *(unsigned __int16 *)(a1 + 66);
        if (*(_WORD *)(a1 + 66) && !*(_WORD *)(a1 + 2 * v36 + 328))
        {
          int v37 = v36 - 1;
          *(_WORD *)(a1 + 66) = v36 - 1;
          if ((_WORD)v36 == 1)
          {
            LOWORD(v37) = 0;
            LOWORD(v36) = 1;
          }
          else
          {
            __int16 v38 = 1;
            while (!*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
            {
              *(_WORD *)(a1 + 66) = --v37;
              ++v38;
              if (!(_WORD)v37)
              {
                LOWORD(v37) = 0;
                goto LABEL_68;
              }
            }
            LOWORD(v36) = v38;
          }
LABEL_68:
          if (*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
          {
            uint64_t result = sub_263D8FCBC(a1, (const void **)a2);
            *(_WORD *)(a1 + 66) += v36;
            if (result) {
              return result;
            }
          }
          else
          {
            *(_WORD *)(a1 + 66) = v36 + v37;
          }
        }
        return 0;
      }
      unsigned int v115 = a4 & 0xFFFF7FFF;
      int v113 = 0;
      uint64_t v114 = 0;
      int v27 = 0;
      while (1)
      {
        uint64_t v39 = (unsigned int *)(v30 + *(unsigned __int16 *)(v30 + 2 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16));
        size_t v121 = *v39;
        int v122 = (char *)v39 + *((unsigned __int16 *)v39 + 3) + 8;
        if ((v31[1] & 4) == 0) {
          goto LABEL_90;
        }
        v40 = *(char **)(v10 + 88);
        v126 = v40;
        long long v127 = v40;
        *(void *)v40 = *(void *)v30;
        __int16 v41 = *((_WORD *)v39 + 2);
        if ((v41 & 4) != 0)
        {
          if ((v41 & 2) != 0)
          {
            int v112 = v27;
            int v48 = 0;
            unsigned int v20 = v115 | 6;
            goto LABEL_162;
          }
          uint64_t v25 = v122;
          if (v115 == 64)
          {
LABEL_85:
            int v112 = v27;
            int v48 = 0;
            *((_WORD *)v122 + 5) |= 0x10u;
            *(_WORD *)uint64_t v25 = *(_WORD *)v40;
            *((_WORD *)v25 + 1) = *((_WORD *)v40 + 1);
            *((_WORD *)v25 + 2) = *((_WORD *)v40 + 2);
            *((_WORD *)v25 + 3) = *((_WORD *)v40 + 3);
            *(void *)(*(void *)(a1 + 16) + 72) = v25;
            unsigned int v20 = v115 | 4;
            goto LABEL_162;
          }
          uint64_t v23 = *(void *)(a1 + 40);
          if ((*(_WORD *)(v23 + 4) & 0x10) != 0)
          {
            unsigned int v62 = *((unsigned __int16 *)v122 + 4);
            if (v62 <= (unsigned __int16)(*((_WORD *)v122 + 7) - *((_WORD *)v122 + 6))) {
              goto LABEL_85;
            }
            unsigned int v49 = 4 * v62;
          }
          else
          {
            unsigned int v49 = (*(_DWORD *)a3 + 11) & 0xFFFFFFFE;
          }
          size_t v60 = v121;
          size_t v61 = v121 + v49;
          uint64_t v125 = v61;
          __int16 v26 = *((_WORD *)v122 + 5);
        }
        else
        {
          if (v115 == 64) {
            goto LABEL_90;
          }
          unint64_t v42 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 48) + 24);
          if (v121 == 8 && v42 == sub_263D8B990) {
            unint64_t v42 = (uint64_t (*)(uint64_t, uint64_t))sub_263D8B9B0;
          }
          if (!v42(a3, (uint64_t)&v121))
          {
            if ((v115 & 0x40020) != 0) {
              return 4294936497;
            }
LABEL_90:
            int v50 = *((unsigned __int16 *)v39 + 2);
            if (((v115 ^ v50) & 2) != 0) {
              return 4294936512;
            }
            if (v50)
            {
              v116[0] = 0;
              int v118 = 0;
              uint64_t v54 = *(void *)a3;
              unint64_t v55 = *(unsigned int *)(v10 + 16);
              unint64_t v56 = *(void *)v122;
              uint64_t result = sub_263D903E0(*(uint64_t **)(a1 + 24), *(void *)v122, (unint64_t *)v116, &v118);
              if (result) {
                return result;
              }
              int v57 = (v54 + 15) / v55 + 1;
              unint64_t v58 = v116[0];
              uint64_t v59 = *((int *)v116[0] + 3);
              if ((int)v59 >= v57)
              {
                if ((*((_WORD *)v116[0] + 5) & 0x10) != 0)
                {
                  if (v118 <= 1)
                  {
LABEL_216:
                    int v110 = v115 & 0x10000;
                    uint64_t v108 = v58;
                  }
                  else
                  {
                    uint64_t v106 = *(unsigned int *)(v10 + 16);
                    v107 = sub_263D9072C(*(void *)(a1 + 24), *((_DWORD *)v116[0] + 3));
                    if (!v107) {
                      return 12;
                    }
                    uint64_t v108 = v107;
                    size_t v109 = v106 * v59;
                    *(void *)&long long v117 = v56;
                    *((void *)&v117 + 1) = v107;
                    mdb_mid2l_insert(*(unint64_t **)(*(void *)(a1 + 24) + 72), (unint64_t *)&v117);
                    int v110 = v115 & 0x10000;
                    if ((v115 & 0x10000) == 0)
                    {
                      memcpy(&v108[(*(void *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], &v58[(*(void *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], v109 - ((*(void *)a3 & 0xFFFFFFFFFFFFFFF8) + 16));
                      size_t v109 = 16;
                    }
                    memcpy(v108, v58, v109);
                  }
                  size_t v51 = *(void *)a3;
                  *uint64_t v39 = *(void *)a3;
                  int64_t v105 = v108 + 16;
                  if (v110)
                  {
                    uint64_t result = 0;
                    goto LABEL_219;
                  }
                  int v53 = *(const void **)(a3 + 8);
                  int v52 = v108 + 16;
LABEL_221:
                  memcpy(v52, v53, v51);
                  return 0;
                }
                if (v118 || (*(unsigned char *)(v10 + 14) & 8) != 0)
                {
                  uint64_t result = sub_263D9054C(*(void *)(a1 + 24), (uint64_t)v116[0], v116);
                  if (result) {
                    return result;
                  }
                  int v118 = 0;
                  unint64_t v58 = v116[0];
                  if ((*((_WORD *)v116[0] + 5) & 0x10) != 0) {
                    goto LABEL_216;
                  }
                }
              }
              uint64_t result = sub_263D907DC(a1, (uint64_t)v58);
              if (result) {
                return result;
              }
            }
            else
            {
              size_t v51 = *(void *)a3;
              if (*(void *)a3 == v121)
              {
                if ((v115 & 0x10000) != 0)
                {
                  uint64_t result = 0;
                  int64_t v105 = v122;
LABEL_219:
                  *(void *)(a3 + 8) = v105;
                  return result;
                }
                if ((*(unsigned char *)(a1 + 68) & 4) == 0)
                {
                  int v52 = v122;
                  int v53 = *(const void **)(a3 + 8);
                  goto LABEL_221;
                }
                size_t v33 = *a2;
                unint64_t v35 = (const void *)a2[1];
                unint64_t v34 = v39 + 2;
                goto LABEL_59;
              }
            }
            sub_263D9029C((void *)a1, 0);
            LODWORD(v16) = 0;
            uint64_t v28 = (size_t *)a3;
            unsigned int v20 = v115;
            goto LABEL_129;
          }
          size_t v44 = v121;
          size_t v123 = v121;
          memcpy(v40 + 16, v122, v121);
          long long v124 = v40 + 16;
          *(_DWORD *)(v40 + 10) = 1048658;
          uint64_t v45 = *(void *)a3;
          uint64_t v46 = v44 + *(void *)a3 + 16;
          uint64_t v23 = *(void *)(a1 + 40);
          if ((*(unsigned char *)(v23 + 4) & 0x10) != 0)
          {
            __int16 v26 = 114;
            *((_WORD *)v40 + 5) = 114;
            *((_WORD *)v40 + 4) = v45;
            uint64_t v47 = 2 * v45;
          }
          else
          {
            uint64_t v47 = ((*(void *)a3 & 1) + (v44 & 1)) | 0x14;
            __int16 v26 = 82;
          }
          LOWORD(v49) = 0;
          size_t v60 = v46 + v47;
          uint64_t v125 = v60;
          *((_WORD *)v40 + 7) = v60;
          size_t v121 = v60;
          size_t v61 = v60;
          uint64_t v25 = v40;
        }
        int v111 = 0;
        if (v61 + *((unsigned __int16 *)v39 + 3) + 8 <= *(unsigned int *)(v10 + 220))
        {
          int v64 = v115;
        }
        else
        {
          int v111 = 0;
          v26 &= ~0x40u;
          unsigned int v20 = v115;
LABEL_112:
          if ((*(_WORD *)(v23 + 4) & 0x10) != 0)
          {
            v26 |= 0x20u;
            LODWORD(v119[0]) = *((unsigned __int16 *)v25 + 4);
            WORD2(v119[0]) = 16;
            if ((*(_WORD *)(v23 + 4) & 0x20) != 0) {
              __int16 v63 = 24;
            }
            else {
              __int16 v63 = 16;
            }
            WORD2(v119[0]) = v63;
          }
          else
          {
            LODWORD(v119[0]) = 0;
            WORD2(v119[0]) = 0;
          }
          WORD3(v119[0]) = 1;
          *(_OWORD *)((char *)v119 + 8) = xmmword_263D98850;
          *((void *)&v119[1] + 1) = 0;
          *(void *)&long long v120 = (*((unsigned __int16 *)v25 + 6) - 16) >> 1;
          uint64_t v125 = 48;
          v126 = (char *)v119;
          uint64_t result = sub_263D8FE24(a1, 1, &v127);
          if (result) {
            return result;
          }
          size_t v60 = v121;
          unsigned int v49 = *(_DWORD *)(v10 + 16) - v121;
          int v64 = v20 | 6;
          v40 = v127;
          *((void *)&v120 + 1) = *(void *)v127;
          uint64_t v114 = v127;
        }
        if (v40 != v25)
        {
          *((_WORD *)v40 + 5) = v26 | 0x10;
          *((_WORD *)v40 + 4) = *((_WORD *)v25 + 4);
          *((_WORD *)v40 + 6) = *((_WORD *)v25 + 6);
          unsigned __int16 v65 = *((_WORD *)v25 + 7) + v49;
          *((_WORD *)v40 + 7) = v65;
          if ((v26 & 0x20) != 0)
          {
            memcpy(v40 + 16, v25 + 16, ((*((unsigned __int16 *)v25 + 6) - 16) >> 1) * *((unsigned __int16 *)v25 + 4));
          }
          else
          {
            memcpy(&v40[v65], &v25[*((unsigned __int16 *)v25 + 7)], v60 - *((unsigned __int16 *)v25 + 7));
            v66 = v40 + 16;
            memcpy(v66, v25 + 16, (*((unsigned __int16 *)v25 + 6) - 16) & 0xFFFFFFFE);
            if ((*((_WORD *)v25 + 6) & 0xFFFE) != 0x10)
            {
              unint64_t v67 = 0;
              do
                *((_WORD *)v66 + v67++) += v49;
              while (v67 < (*((unsigned __int16 *)v25 + 6) - 16) >> 1);
            }
          }
        }
        unsigned int v20 = v64 | 4;
        int v27 = 1;
        uint64_t v28 = (size_t *)&v125;
        LODWORD(v16) = v111;
        if (!v111)
        {
          sub_263D9029C((void *)a1, 0);
          uint64_t v28 = (size_t *)&v125;
        }
LABEL_129:
        uint64_t v68 = *(unsigned __int16 *)(a1 + 66);
        v69 = *(_WORD **)(a1 + 8 * v68 + 72);
        unint64_t v70 = *a2;
        if ((v69[5] & 0x20) == 0)
        {
          unint64_t v71 = v70 + *v28 + 8;
          uint64_t v72 = 8 - *v28;
          if (v71 <= *(unsigned int *)(v10 + 220)) {
            uint64_t v72 = 0;
          }
          unint64_t v70 = (v71 + v72 + 3) & 0xFFFFFFFFFFFFFFFELL;
        }
        if (v70 <= (unsigned __int16)(v69[7] - v69[6]))
        {
          uint64_t result = sub_263D91934(a1, *(unsigned __int16 *)(a1 + 2 * v68 + 328), (const void **)a2, v28, 0, v20 & 0x30006);
          if (result) {
            goto LABEL_209;
          }
          unint64_t v75 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
          if (v75)
          {
            uint64_t v76 = *(unsigned __int16 *)(a1 + 66);
            uint64_t v77 = *(void *)(a1 + 8 * v76 + 72);
            int v78 = *(_DWORD *)(a1 + 68);
            do
            {
              v79 = v75;
              if ((v78 & 4) != 0) {
                v79 = (void *)v75[2];
              }
              if (v79 != (void *)a1
                && *((unsigned __int16 *)v79 + 32) >= *(unsigned __int16 *)(a1 + 64)
                && v79[v76 + 9] == v77)
              {
                v80 = (char *)v79 + 2 * v76;
                unsigned int v81 = *((unsigned __int16 *)v80 + 164);
                if (v16 && v81 >= *(unsigned __int16 *)(a1 + 2 * v76 + 328))
                {
                  LOWORD(v81) = v81 + 1;
                  *((_WORD *)v80 + 164) = v81;
                }
                uint64_t v82 = v79[2];
                if (v82)
                {
                  if ((*(unsigned char *)(v82 + 68) & 1) != 0
                    && (*(unsigned __int16 *)(v77 + 12) - 16) >> 1 > (unsigned __int16)v81)
                  {
                    uint64_t v83 = v77 + *(unsigned __int16 *)(v77 + 2 * (unsigned __int16)v81 + 16);
                    if ((*(_WORD *)(v83 + 4) & 6) == 4) {
                      *(void *)(v82 + 72) = v83 + *(unsigned __int16 *)(v83 + 6) + 8;
                    }
                  }
                }
              }
              unint64_t v75 = (void *)*v75;
            }
            while (v75);
          }
        }
        else
        {
          if ((v20 & 6) == 4) {
            int v73 = v20 & 0x10006;
          }
          else {
            int v73 = v20 & 0x30006;
          }
          if (v16) {
            int v74 = v73;
          }
          else {
            int v74 = v73 | 0x40000;
          }
          uint64_t result = sub_263D90A58(a1, (const void **)a2, v28, 0xFFFFFFFFFFFFFFFFLL, v74);
          if (result) {
            goto LABEL_209;
          }
        }
        if (!v27)
        {
          uint64_t result = 0;
          int v103 = v16;
          goto LABEL_196;
        }
        int v48 = v16;
        int v112 = 1;
LABEL_162:
        uint64_t v125 = 0;
        v126 = (char *)&unk_263D988C3;
        uint64_t v84 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
            + *(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
                                  + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
                                  + 16);
        uint64_t v85 = 32832;
        if ((v20 & 0x40040) != 0x40)
        {
          sub_263D91BE0(a1, *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)+ *(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)+ 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)+ 16));
          if ((v20 & 0x20) != 0) {
            uint64_t v85 = 32784;
          }
          else {
            uint64_t v85 = 0x8000;
          }
        }
        uint64_t v86 = v114;
        if (v114) {
          *(void *)(*(void *)(a1 + 16) + 72) = v114;
        }
        int v87 = v123;
        if (v123)
        {
          LODWORD(result) = mdb_cursor_put(*(void *)(a1 + 16), &v123, &v125, v85);
          if (result) {
            goto LABEL_206;
          }
          size_t v123 = 0;
          uint64_t v86 = v114;
        }
        if (v86 || (*(_WORD *)(v84 + 4) & 2) == 0)
        {
          uint64_t v88 = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
          if (v88)
          {
            uint64_t v89 = *(unsigned __int16 *)(a1 + 66);
            uint64_t v90 = *(void *)(a1 + 8 * v89 + 72);
            uint64_t v91 = *(void *)(a1 + 16);
            while (1)
            {
              if (v88 == (uint64_t *)a1
                || *((unsigned __int16 *)v88 + 32) < *(unsigned __int16 *)(a1 + 64)
                || (*((unsigned char *)v88 + 68) & 1) == 0
                || v88[v89 + 9] != v90)
              {
                goto LABEL_191;
              }
              unsigned int v92 = *((unsigned __int16 *)v88 + v89 + 164);
              if (v92 != *(unsigned __int16 *)(a1 + 2 * v89 + 328)) {
                break;
              }
              uint64_t v93 = v88[2];
              if (v87)
              {
                int v94 = *(_DWORD *)(v93 + 68) | 1;
                *(_DWORD *)(v93 + 64) = 1;
                *(_DWORD *)(v93 + 68) = v94;
                *(_WORD *)(v93 + 328) = 0;
                *(unsigned char *)(v93 + 488) = 56;
                *(void *)(v93 + 456) = *(void *)(v91 + 456);
LABEL_189:
                long long v97 = *(_OWORD *)(v91 + 392);
                long long v98 = *(_OWORD *)(v91 + 424);
                *(_OWORD *)(v93 + 408) = *(_OWORD *)(v91 + 408);
                *(_OWORD *)(v93 + 424) = v98;
                *(_OWORD *)(v93 + 392) = v97;
                uint64_t v96 = *(void *)(v91 + 72);
LABEL_190:
                *(void *)(v93 + 72) = v96;
                goto LABEL_191;
              }
              if (*(unsigned char *)(v93 + 68)) {
                goto LABEL_189;
              }
LABEL_191:
              uint64_t v88 = (uint64_t *)*v88;
              if (!v88) {
                goto LABEL_192;
              }
            }
            if (v48) {
              goto LABEL_191;
            }
            uint64_t v93 = v88[2];
            if (!v93) {
              goto LABEL_191;
            }
            if ((*(unsigned char *)(v93 + 68) & 1) == 0) {
              goto LABEL_191;
            }
            if (v92 >= (*(unsigned __int16 *)(v90 + 12) - 16) >> 1) {
              goto LABEL_191;
            }
            uint64_t v95 = v90 + *(unsigned __int16 *)(v90 + 2 * *((unsigned __int16 *)v88 + v89 + 164) + 16);
            if ((*(_WORD *)(v95 + 4) & 6) != 4) {
              goto LABEL_191;
            }
            uint64_t v96 = v95 + *(unsigned __int16 *)(v95 + 6) + 8;
            goto LABEL_190;
          }
        }
LABEL_192:
        uint64_t v99 = *(void *)(a1 + 16);
        uint64_t v16 = *(void *)(v99 + 424);
        uint64_t result = mdb_cursor_put(v99, a3, &v125, v85 | (v20 >> 1) & 0x20000);
        if ((v20 & 2) != 0)
        {
          uint64_t v100 = v84 + *(unsigned __int16 *)(v84 + 6);
          long long v102 = *(_OWORD *)(*(void *)(a1 + 16) + 408);
          long long v101 = *(_OWORD *)(*(void *)(a1 + 16) + 424);
          *(_OWORD *)(v100 + 8) = *(_OWORD *)(*(void *)(a1 + 16) + 392);
          *(_OWORD *)(v100 + 24) = v102;
          *(_OWORD *)(v100 + 40) = v101;
        }
        int v103 = *(_DWORD *)(*(void *)(a1 + 16) + 424) - v16;
        LODWORD(v16) = v48;
        int v27 = v112;
LABEL_196:
        if (v103) {
          ++*(void *)(*(void *)(a1 + 40) + 32);
        }
        if (v16)
        {
          if (result)
          {
LABEL_206:
            if (result == -30799) {
              uint64_t result = 4294936500;
            }
            else {
              uint64_t result = result;
            }
LABEL_209:
            *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
            return result;
          }
          *(_DWORD *)(a1 + 68) |= 1u;
        }
        if ((v20 & 0x80000) == 0 || result) {
          return result;
        }
        uint64_t v104 = (v113 + 1);
        *(void *)(a3 + 16) = v104;
        if (v104 >= v11) {
          return 0;
        }
        ++v113;
        unsigned int v115 = v20;
        *(void *)(a3 + 8) += *(void *)a3;
        uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
        uint64_t v30 = *(void *)(a1 + 8 * v29 + 72);
        uint64_t v31 = *(unsigned int **)(a1 + 40);
      }
    }
  }
  return result;
}

uint64_t sub_263D8E1CC(uint64_t a1, int a2)
{
  uint64_t v2 = a1;
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(uint64_t **)(a1 + 72);
  uint64_t v5 = *v4;
  if ((*(unsigned char *)(v3 + 14) & 8) == 0)
  {
    int v37 = a2;
    unint64_t v6 = 0;
    off_t v7 = 0;
    uint64_t v8 = 0;
    off_t v9 = 0;
    size_t v10 = 0;
    int v11 = 0;
    unint64_t v12 = *(unsigned int *)(v3 + 16);
    uint64_t v41 = *v4;
    uint64_t v42 = (int)v5;
    int v43 = v5 + 1;
    uint64_t v13 = (v5 - 1);
    __int16 v38 = v4 + 5;
    unint64_t v39 = v12;
    uint64_t v14 = 1;
    int v15 = a2;
    v40 = *(uint64_t **)(a1 + 72);
    while (1)
    {
      if (v15 >= (int)v5)
      {
        BOOL v19 = 0;
        ++v15;
      }
      else
      {
        uint64_t v16 = v15 + 1;
        unsigned int v17 = &v4[2 * v16];
        uint64_t v8 = v17[1];
        unsigned int v18 = *(unsigned __int16 *)(v8 + 10);
        if (v18 >= 0x4000)
        {
          *(_WORD *)(v8 + 10) = v18 & 0x7FFF;
          *unsigned int v17 = 0;
          if (v43 == v15 + 2)
          {
LABEL_11:
            BOOL v19 = v16 < v42;
            int v15 = v43;
            goto LABEL_16;
          }
          unsigned int v20 = &v38[2 * v15];
          while (1)
          {
            uint64_t v8 = *v20;
            unsigned int v18 = *(unsigned __int16 *)(*v20 + 10);
            if (v18 < 0x4000) {
              break;
            }
            *(_WORD *)(v8 + 10) = v18 & 0x7FFF;
            *(v20 - 1) = 0;
            ++v15;
            ++v16;
            v20 += 2;
            if (v13 == v15) {
              goto LABEL_11;
            }
          }
          BOOL v19 = v16 < v42;
          v15 += 2;
          unsigned int v17 = v20 - 1;
        }
        else
        {
          BOOL v19 = 1;
          ++v15;
        }
        uint64_t v21 = *v17;
        *(_WORD *)(v8 + 10) = v18 & 0x3FEF;
        off_t v7 = v21 * v12;
        if ((v18 & 4) != 0) {
          unint64_t v6 = *(unsigned int *)(v8 + 12) * (unint64_t)v12;
        }
        else {
          unint64_t v6 = v12;
        }
      }
LABEL_16:
      if (v7 != v14 || v11 == 64 || v6 + v10 >= 0x40000001)
      {
        if (v11)
        {
          uint64_t v22 = v13;
          while (1)
          {
            if (v11 == 1)
            {
              ssize_t v23 = pwrite(*(_DWORD *)v3, __buf[0].iov_base, v10, v9);
            }
            else
            {
              while (lseek(*(_DWORD *)v3, v9, 0) == -1)
              {
                uint64_t result = *__error();
                if (result != 4) {
                  return result;
                }
              }
              ssize_t v23 = writev(*(_DWORD *)v3, __buf, v11);
            }
            unint64_t v12 = v39;
            uint64_t v4 = v40;
            uint64_t v13 = v22;
            if (v23 == v10) {
              break;
            }
            if ((v23 & 0x8000000000000000) == 0) {
              return 5;
            }
            uint64_t result = *__error();
            if (result != 4) {
              return result;
            }
          }
        }
        if (!v19)
        {
          a2 = v37;
          if ((int)v41 <= v37)
          {
            unsigned int v26 = v37;
          }
          else
          {
            unsigned int v26 = v37;
            uint64_t v31 = v4 + 2;
            int v32 = v37;
            do
            {
              uint64_t v33 = v32;
              unint64_t v34 = &v31[2 * v32];
              while (1)
              {
                unint64_t v35 = (uint64_t *)v34[1];
                if (!*v34) {
                  break;
                }
                if ((*((_WORD *)v35 + 5) & 4) != 0 && *((_DWORD *)v35 + 3) != 1)
                {
                  free(v35);
                  uint64_t v4 = v40;
                }
                else
                {
                  *unint64_t v35 = *(void *)(v3 + 192);
                  *(void *)(v3 + 192) = v35;
                }
                ++v33;
                v34 += 2;
                if (v33 >= v42)
                {
                  a2 = v33;
                  goto LABEL_58;
                }
              }
              int v32 = v33 + 1;
              *(_OWORD *)&v4[2 * ++v26] = *(_OWORD *)v34;
              v4[2 * v26] = *v35;
            }
            while ((int)v33 + 1 < (int)v41);
            a2 = v33 + 1;
          }
LABEL_58:
          uint64_t v2 = a1;
          goto LABEL_42;
        }
        size_t v10 = 0;
        int v11 = 0;
        off_t v9 = v7;
        LODWORD(v5) = v41;
      }
      uint64_t v14 = v7 + v6;
      uint64_t v25 = &__buf[v11];
      v25->iov_base = (void *)v8;
      v25->iov_len = v6;
      v10 += v6;
      ++v11;
    }
  }
  if ((int)v5 <= a2)
  {
    unsigned int v26 = a2;
  }
  else
  {
    unsigned int v26 = a2;
    do
    {
      uint64_t v27 = a2;
      uint64_t v28 = (uint64_t)&v4[2 * a2 + 3];
      while (1)
      {
        uint64_t v29 = *(void *)v28;
        unsigned int v30 = *(unsigned __int16 *)(*(void *)v28 + 10);
        if (v30 >= 0x4000) {
          break;
        }
        ++v27;
        *(_WORD *)(v29 + 10) = v30 & 0xFFEF;
        v28 += 16;
        if (v27 >= (int)v5)
        {
          a2 = v27;
          goto LABEL_42;
        }
      }
      a2 = v27 + 1;
      *(_WORD *)(v29 + 10) = v30 & 0x7FFF;
      *(_OWORD *)&v4[2 * ++v26] = *(_OWORD *)(v28 - 8);
    }
    while ((int)v27 + 1 < (int)v5);
  }
LABEL_42:
  uint64_t result = 0;
  *(_DWORD *)(v2 + 128) += a2 - v26;
  *uint64_t v4 = v26;
  return result;
}

uint64_t sub_263D8E5B4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = **(void **)(a1 + 8);
  unint64_t v3 = **(void **)(a2 + 8);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t mdb_get(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  int v9 = 0;
  uint64_t result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          uint64_t v12 = 0;
          memset(v11, 0, sizeof(v11));
          memset(v10, 0, sizeof(v10));
          if ((*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
          {
            if ((*(unsigned char *)(a1 + 124) & 0x13) != 0)
            {
              return 4294936514;
            }
            else
            {
              sub_263D8D2EC((uint64_t)v11, (void *)a1, a2, (uint64_t)v10);
              return sub_263D8E6F4((uint64_t)v11, a3, a4, 15, &v9);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_263D8E6F4(uint64_t a1, void *a2, void *a3, int a4, int *a5)
{
  if (!*a2) {
    return 4294936515;
  }
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10) {
    *(_DWORD *)(v10 + 68) &= 0xFFFFFFFC;
  }
  if ((*(unsigned char *)(a1 + 68) & 1) == 0)
  {
    *(void *)(a1 + 72) = 0;
LABEL_6:
    uint64_t result = sub_263D93614(a1, a2, 0);
    if (result) {
      return result;
    }
    uint64_t v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    goto LABEL_8;
  }
  long long v35 = 0uLL;
  uint64_t v15 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v12 = *(_WORD **)(a1 + 8 * v15 + 72);
  if ((v12[6] & 0xFFFE) == 0x10)
  {
    *(_WORD *)(a1 + 2 * v15 + 328) = 0;
    return 4294936498;
  }
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t v14 = 0;
    uint64_t v16 = **(unsigned int **)(a1 + 40);
    unsigned int v17 = v12 + 8;
  }
  else
  {
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
    uint64_t v16 = *(unsigned __int16 *)(v14 + 6);
    unsigned int v17 = (_WORD *)(v14 + 8);
  }
  *(void *)&long long v35 = v16;
  *((void *)&v35 + 1) = v17;
  int v18 = (*(uint64_t (**)(void *, long long *))(*(void *)(a1 + 48) + 16))(a2, &v35);
  if (!v18)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    goto LABEL_27;
  }
  if (v18 <= 0)
  {
    LODWORD(v22) = *(unsigned __int16 *)(a1 + 66);
    goto LABEL_41;
  }
  unsigned int v19 = (unsigned __int16)v12[6] - 16;
  unsigned int v20 = v19 >> 1;
  if (v19 < 4)
  {
LABEL_33:
    uint64_t v22 = *(unsigned __int16 *)(a1 + 66);
    if (*(_WORD *)(a1 + 66))
    {
      uint64_t v24 = 0;
      while (((*(unsigned __int16 *)(*(void *)(a1 + 328 + 8 * v24 - 256) + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 328 + 2 * v24))
      {
        if (v22 == ++v24) {
          goto LABEL_40;
        }
      }
    }
    else
    {
      LODWORD(v24) = 0;
    }
    if (v24 == v22)
    {
LABEL_40:
      *(_WORD *)(a1 + 2 * v22 + 328) = v20;
      return 4294936498;
    }
LABEL_41:
    if (!v22)
    {
      *(_WORD *)(a1 + 328) = 0;
      if (a4 != 17 || a5) {
        return 4294936498;
      }
      goto LABEL_46;
    }
    goto LABEL_6;
  }
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t v21 = (uint64_t)v12 + v35 * (v20 - 1) + 16;
  }
  else
  {
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[v20 + 7];
    *(void *)&long long v35 = *(unsigned __int16 *)(v14 + 6);
    uint64_t v21 = v14 + 8;
  }
  *((void *)&v35 + 1) = v21;
  int v23 = (*(uint64_t (**)(void *, long long *))(*(void *)(a1 + 48) + 16))(a2, &v35);
  if (!v23)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v20 - 1;
    goto LABEL_27;
  }
  if ((v23 & 0x80000000) == 0) {
    goto LABEL_33;
  }
  uint64_t v33 = *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328);
  if (v33 < ((unsigned __int16)v12[6] - 16) >> 1)
  {
    if ((v12[5] & 0x20) != 0)
    {
      uint64_t v34 = (uint64_t)v12 + v35 * v33 + 16;
    }
    else
    {
      uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[v33 + 8];
      *(void *)&long long v35 = *(unsigned __int16 *)(v14 + 6);
      uint64_t v34 = v14 + 8;
    }
    *((void *)&v35 + 1) = v34;
    if (!(*(unsigned int (**)(void *, long long *))(*(void *)(a1 + 48) + 16))(a2, &v35))
    {
LABEL_27:
      if (a5) {
        *a5 = 1;
      }
      goto LABEL_46;
    }
  }
  *(_DWORD *)(a1 + 68) &= ~2u;
LABEL_8:
  uint64_t v13 = sub_263D93800(a1, a2, a5);
  uint64_t v14 = (uint64_t)v13;
  if (a5 && !*a5) {
    return 4294936498;
  }
  if (!v13)
  {
    uint64_t result = sub_263D8F35C(a1, 1);
    if (result)
    {
      *(_DWORD *)(a1 + 68) |= 2u;
      return result;
    }
    uint64_t v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
  }
LABEL_46:
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t result = 0;
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      uint64_t v30 = **(unsigned int **)(a1 + 40);
      *a2 = v30;
      a2[1] = (char *)v12
            + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
            * (unint64_t)v30
            + 16;
    }
    return result;
  }
  if ((*(_WORD *)(v14 + 4) & 4) != 0)
  {
    sub_263D91BE0(a1, v14);
    if ((a4 - 15) > 2)
    {
      LODWORD(v35) = 0;
      if (a4 == 2) {
        uint64_t v31 = &v35;
      }
      else {
        uint64_t v31 = 0;
      }
      uint64_t result = sub_263D8E6F4(*(void *)(a1 + 16), a3, 0, 17, v31);
      if (!result) {
        goto LABEL_79;
      }
      return result;
    }
    uint64_t result = sub_263D8F70C(*(void *)(a1 + 16), a3, 0);
LABEL_79:
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      *a2 = *(unsigned __int16 *)(v14 + 6);
      a2[1] = v14 + 8;
    }
    return result;
  }
  if (!a3)
  {
    uint64_t result = 0;
    goto LABEL_79;
  }
  if ((a4 & 0xFFFFFFFE) == 2)
  {
    long long v35 = 0uLL;
    uint64_t result = sub_263D8EF48(a1, (unsigned int *)v14, &v35);
    if (result) {
      return result;
    }
    uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 48) + 24);
    if ((void)v35 == 8 && v25 == sub_263D8B990) {
      uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t))sub_263D8B9B0;
    }
    int v27 = v25((uint64_t)a3, (uint64_t)&v35);
    BOOL v29 = a4 == 2 || v27 > 0;
    if (!v27 || !v29)
    {
      uint64_t result = 0;
      *(_OWORD *)a3 = v35;
      goto LABEL_79;
    }
    return 4294936498;
  }
  uint64_t v32 = *(void *)(a1 + 16);
  if (v32) {
    *(_DWORD *)(v32 + 68) &= 0xFFFFFFFC;
  }
  uint64_t result = sub_263D8EF48(a1, (unsigned int *)v14, a3);
  if (!result) {
    goto LABEL_79;
  }
  return result;
}

uint64_t mdb_cursor_get(uint64_t a1, void *a2, void *a3, int a4)
{
  int v29 = 0;
  if (!a1) {
    return 22;
  }
  if ((*(unsigned char *)(*(void *)(a1 + 24) + 124) & 0x13) != 0) {
    return 4294936514;
  }
  off_t v7 = (uint64_t (*)(void))sub_263D8F70C;
  switch(a4)
  {
    case 0:
      uint64_t result = sub_263D8F70C(a1, a2, a3);
      break;
    case 1:
      goto LABEL_32;
    case 2:
    case 3:
      if (!a3) {
        goto LABEL_58;
      }
      if (!*(void *)(a1 + 16)) {
        goto LABEL_47;
      }
LABEL_10:
      if (!a2) {
        goto LABEL_58;
      }
      if (a4 == 17) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = &v29;
      }
      uint64_t result = sub_263D8E6F4(a1, a2, a3, a4, v8);
      break;
    case 4:
      if ((*(unsigned char *)(a1 + 68) & 1) == 0) {
        goto LABEL_58;
      }
      uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
      unsigned int v11 = *(unsigned __int16 *)(v10 + 12) - 16;
      unsigned int v12 = v11 >> 1;
      if (v11 < 2 || (uint64_t v13 = *(unsigned __int16 *)(a1 + 2 * v9 + 328), v12 <= v13))
      {
        *(_WORD *)(a1 + 2 * v9 + 328) = v12;
        goto LABEL_56;
      }
      if ((*(_WORD *)(v10 + 10) & 0x20) != 0)
      {
        uint64_t result = 0;
        uint64_t v28 = **(unsigned int **)(a1 + 40);
        *a2 = v28;
        a2[1] = v10 + v28 * (unint64_t)v13 + 16;
      }
      else
      {
        uint64_t v14 = v10 + *(unsigned __int16 *)(v10 + 2 * v13 + 16);
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
        if (a3)
        {
          if ((*(_WORD *)(v14 + 4) & 4) == 0) {
            goto LABEL_39;
          }
          uint64_t result = mdb_cursor_get(*(void *)(a1 + 16), a3, 0, 4);
        }
        else
        {
LABEL_29:
          uint64_t result = 0;
        }
      }
      break;
    case 5:
      if (!a3 || (*(unsigned char *)(a1 + 68) & 1) == 0) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) == 0) {
        goto LABEL_47;
      }
      uint64_t v15 = *(void *)(a1 + 16);
      if ((*(_DWORD *)(v15 + 68) & 3) != 1) {
        goto LABEL_29;
      }
      goto LABEL_54;
    case 6:
      uint64_t result = sub_263D8F220(a1, a2, a3);
      break;
    case 7:
      off_t v7 = (uint64_t (*)(void))sub_263D8F220;
LABEL_32:
      if (!a3) {
        goto LABEL_58;
      }
      int v16 = *(_DWORD *)(a1 + 68);
      if ((v16 & 1) == 0) {
        goto LABEL_58;
      }
      uint64_t v17 = *(void *)(a1 + 16);
      if (!v17) {
        goto LABEL_47;
      }
      uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v19 = a1 + 2 * v18;
      uint64_t v20 = *(unsigned __int16 *)(v19 + 328);
      uint64_t v21 = *(void *)(a1 + 8 * v18 + 72);
      unsigned int v22 = *(unsigned __int16 *)(v21 + 12) - 16;
      if (v20 >= v22 >> 1)
      {
        *(_WORD *)(v19 + 328) = v22 >> 1;
        goto LABEL_56;
      }
      *(_DWORD *)(a1 + 68) = v16 & 0xFFFFFFFD;
      uint64_t v14 = v21 + *(unsigned __int16 *)(v21 + 2 * v20 + 16);
      if ((*(_WORD *)(v14 + 4) & 4) != 0)
      {
        if (*(unsigned char *)(v17 + 68)) {
          uint64_t result = v7();
        }
        else {
LABEL_58:
        }
          uint64_t result = 22;
      }
      else
      {
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
LABEL_39:
        uint64_t result = sub_263D8EF48(a1, (unsigned int *)v14, a3);
      }
      break;
    case 8:
    case 9:
    case 11:
      uint64_t result = sub_263D8EFCC(a1, a2, a3, a4);
      break;
    case 10:
      if (!a3) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) == 0) {
        goto LABEL_47;
      }
      uint64_t result = sub_263D8EFCC(a1, a2, a3, 9);
      if (result) {
        break;
      }
      uint64_t v15 = *(void *)(a1 + 16);
      if ((*(unsigned char *)(v15 + 68) & 1) == 0) {
        goto LABEL_56;
      }
      goto LABEL_54;
    case 12:
    case 13:
    case 14:
      uint64_t result = sub_263D8F4DC(a1, a2, a3, a4);
      break;
    case 15:
    case 16:
    case 17:
      goto LABEL_10;
    case 18:
      if (!a3) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) != 0)
      {
        if ((*(unsigned char *)(a1 + 68) & 1) != 0 || (uint64_t result = sub_263D8F220(a1, a2, a3), !result))
        {
          uint64_t v23 = *(void *)(a1 + 16);
          if (*(unsigned char *)(v23 + 68))
          {
            uint64_t result = sub_263D8F35C(v23, 0);
            if (!result)
            {
              uint64_t v15 = *(void *)(a1 + 16);
LABEL_54:
              uint64_t result = 0;
              uint64_t v24 = *(unsigned __int16 *)(v15 + 66);
              uint64_t v25 = v15 + 8 * v24;
              uint64_t v26 = *(void *)(v25 + 72);
              *a3 = ((*(unsigned __int16 *)(v26 + 12) - 16) >> 1) * **(_DWORD **)(v15 + 40);
              a3[1] = v26 + 16;
              *(_WORD *)(v15 + 2 * v24 + 328) = ((*(unsigned __int16 *)(*(void *)(v25 + 72) + 12)
                                                + 131056) >> 1)
                                              - 1;
            }
          }
          else
          {
LABEL_56:
            uint64_t result = 4294936498;
          }
        }
      }
      else
      {
LABEL_47:
        uint64_t result = 4294936512;
      }
      break;
    default:
      goto LABEL_29;
  }
  int v27 = *(_DWORD *)(a1 + 68);
  if ((v27 & 8) != 0) {
    *(_DWORD *)(a1 + 68) = v27 ^ 8;
  }
  return result;
}

uint64_t sub_263D8EF48(uint64_t a1, unsigned int *a2, void *a3)
{
  if (a2[1])
  {
    unint64_t v6 = 0;
    *a3 = *a2;
    uint64_t result = sub_263D903E0(*(uint64_t **)(a1 + 24), *(void *)((char *)a2 + *((unsigned __int16 *)a2 + 3) + 8), &v6, 0);
    if (result) {
      return result;
    }
    uint64_t v4 = v6 + 16;
  }
  else
  {
    *a3 = *a2;
    uint64_t v4 = (uint64_t)a2 + *((unsigned __int16 *)a2 + 3) + 8;
  }
  uint64_t result = 0;
  a3[1] = v4;
  return result;
}

uint64_t sub_263D8EFCC(uint64_t a1, void *a2, void *a3, int a4)
{
  int v8 = *(_DWORD *)(a1 + 68);
  if (a4 == 9 && (v8 & 8) != 0) {
    return 4294936498;
  }
  if (v8)
  {
    uint64_t v10 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v11 = *(void *)(a1 + 8 * v10 + 72);
    if ((v8 & 2) != 0)
    {
      if (((*(unsigned __int16 *)(v11 + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 2 * v10 + 328)) {
        return 4294936498;
      }
      *(_DWORD *)(a1 + 68) = v8 ^ 2;
    }
    if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 4) == 0) {
      goto LABEL_19;
    }
    uint64_t v12 = v11 + *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * v10 + 328) + 16);
    if ((*(_WORD *)(v12 + 4) & 4) != 0)
    {
      if ((a4 & 0xFFFFFFFE) == 8)
      {
        uint64_t result = sub_263D8EFCC(*(void *)(a1 + 16), a3, 0, 8);
        if (a4 != 8 || result != -30798)
        {
          if (!a2 || result) {
            return result;
          }
          uint64_t v17 = *(unsigned __int16 *)(v12 + 6);
          unint64_t v18 = v12 + 8;
LABEL_38:
          *a2 = v17;
          a2[1] = v18;
          return result;
        }
      }
LABEL_19:
      int v13 = *(_DWORD *)(a1 + 68);
      if ((v13 & 8) != 0)
      {
        *(_DWORD *)(a1 + 68) = v13 ^ 8;
      }
      else
      {
        uint64_t v14 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
        unsigned int v15 = *(unsigned __int16 *)(v14 + 328) + 1;
        if (v15 >= (*(unsigned __int16 *)(v11 + 12) - 16) >> 1)
        {
          uint64_t result = sub_263D8F35C(a1, 1);
          if (result)
          {
            *(_DWORD *)(a1 + 68) |= 2u;
            return result;
          }
          uint64_t v11 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
        }
        else
        {
          *(_WORD *)(v14 + 328) = v15;
        }
      }
      if ((*(_WORD *)(v11 + 10) & 0x20) != 0)
      {
        uint64_t result = 0;
        uint64_t v17 = **(unsigned int **)(a1 + 40);
        unint64_t v18 = v11
            + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
            * (unint64_t)v17
            + 16;
      }
      else
      {
        uint64_t v16 = v11
            + *(unsigned __int16 *)(v11
                                  + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
                                  + 16);
        if ((*(_WORD *)(v16 + 4) & 4) != 0)
        {
          sub_263D91BE0(a1, v11+ *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) + 16));
          uint64_t result = sub_263D8F70C(*(void *)(a1 + 16), a3, 0);
          if (result) {
            return result;
          }
        }
        else if (a3)
        {
          uint64_t result = sub_263D8EF48(a1, (unsigned int *)(v11+ *(unsigned __int16 *)(v11+ 2* *(unsigned __int16 *)(a1+ 2 * *(unsigned __int16 *)(a1 + 66)+ 328)+ 16)), a3);
          if (result) {
            return result;
          }
        }
        uint64_t result = 0;
        if (!a2) {
          return result;
        }
        uint64_t v17 = *(unsigned __int16 *)(v16 + 6);
        unint64_t v18 = v16 + 8;
      }
      goto LABEL_38;
    }
    *(_DWORD *)(*(void *)(a1 + 16) + 68) &= 0xFFFFFFFC;
    if (a4 != 9) {
      goto LABEL_19;
    }
    return 4294936498;
  }

  return sub_263D8F70C(a1, a2, a3);
}

uint64_t sub_263D8F220(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  }
  int v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t result = sub_263D93614(a1, 0, 8);
    if (result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    int v7 = *(_DWORD *)(a1 + 68);
  }
  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  unsigned int v11 = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_DWORD *)(a1 + 68) = v7 | 3;
  if ((*(unsigned char *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      uint64_t v13 = **(unsigned int **)(a1 + 40);
      *a2 = v13;
      unint64_t v14 = v10 + v13 * (unint64_t)(unsigned __int16)v11 + 16;
LABEL_18:
      uint64_t result = 0;
      a2[1] = v14;
      return result;
    }
    return 0;
  }
  uint64_t v12 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v11 + 16);
  if ((*(_WORD *)(v12 + 4) & 4) != 0)
  {
    sub_263D91BE0(a1, v12);
    uint64_t result = sub_263D8F220(*(void *)(a1 + 16), a3, 0);
    if (result) {
      return result;
    }
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v12 + 6);
      unint64_t v14 = v12 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3) {
    goto LABEL_16;
  }
  uint64_t result = sub_263D8EF48(a1, (unsigned int *)v12, a3);
  if (!result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_263D8F35C(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 64);
  if (v2 < 2) {
    return 4294936498;
  }
  int v4 = a2;
  *(_WORD *)(a1 + 64) = v2 - 1;
  unsigned __int16 v6 = *(_WORD *)(a1 + 66) - 1;
  *(_WORD *)(a1 + 66) = v6;
  uint64_t v7 = v6;
  int v8 = (_WORD *)(a1 + 2 * v6 + 328);
  int v9 = (unsigned __int16)*v8;
  if (a2)
  {
    if (++v9 >= (*(unsigned __int16 *)(*(void *)(a1 + 8 * v7 + 72) + 12) - 16) >> 1) {
      goto LABEL_9;
    }
LABEL_8:
    *int v8 = v9;
    goto LABEL_12;
  }
  if (*v8)
  {
    LOWORD(v9) = v9 - 1;
    goto LABEL_8;
  }
LABEL_9:
  uint64_t result = sub_263D8F35C(a1, a2);
  uint64_t v7 = *(unsigned __int16 *)(a1 + 66);
  if (result)
  {
    *(_WORD *)(a1 + 66) = v7 + 1;
    ++*(_WORD *)(a1 + 64);
    return result;
  }
  LOWORD(v9) = *(_WORD *)(a1 + 2 * v7 + 328);
LABEL_12:
  unint64_t v13 = 0;
  uint64_t v10 = (unsigned int *)(*(void *)(a1 + 8 * v7 + 72)
                       + *(unsigned __int16 *)(*(void *)(a1 + 8 * v7 + 72) + 2 * (unsigned __int16)v9 + 16));
  uint64_t result = sub_263D903E0(*(uint64_t **)(a1 + 24), *v10 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), &v13, 0);
  if (result)
  {
    *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
  }
  else
  {
    uint64_t v11 = *(unsigned __int16 *)(a1 + 64);
    if (v11 < 0x20)
    {
      unint64_t v12 = v13;
      *(_WORD *)(a1 + 64) = v11 + 1;
      *(_WORD *)(a1 + 66) = v11;
      *(void *)(a1 + 8 * v11 + 72) = v12;
      *(_WORD *)(a1 + 2 * v11 + 328) = 0;
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    }
    uint64_t result = 0;
    if (!v4) {
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = ((*(unsigned __int16 *)(v13 + 12)
    }
                                                                    + 131056) >> 1)
                                                                  - 1;
  }
  return result;
}

uint64_t sub_263D8F4DC(uint64_t a1, void *a2, void *a3, int a4)
{
  if (*(unsigned char *)(a1 + 68))
  {
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
  }
  else
  {
    uint64_t result = sub_263D8F220(a1, a2, a3);
    if (result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    ++*(_WORD *)(a1 + 2 * v9 + 328);
  }
  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 4) != 0)
  {
    uint64_t v11 = *(unsigned __int16 *)(a1 + 2 * v9 + 328);
    if (v11 < (*(unsigned __int16 *)(v10 + 12) - 16) >> 1)
    {
      uint64_t v12 = v10 + *(unsigned __int16 *)(v10 + 2 * v11 + 16);
      if ((*(_WORD *)(v12 + 4) & 4) != 0)
      {
        if ((a4 & 0xFFFFFFFE) == 0xC)
        {
          uint64_t result = sub_263D8F4DC(*(void *)(a1 + 16), a3, 0, 12);
          if (a4 != 12 || result != -30798)
          {
            if (!result)
            {
              if (a2)
              {
                *a2 = *(unsigned __int16 *)(v12 + 6);
                a2[1] = v12 + 8;
              }
              uint64_t result = 0;
              *(_DWORD *)(a1 + 68) &= ~2u;
            }
            return result;
          }
          uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(a1 + 16) + 68) &= 0xFFFFFFFC;
        if (a4 == 13) {
          return 4294936498;
        }
      }
    }
  }
  *(_DWORD *)(a1 + 68) &= 0xFFFFFFF5;
  uint64_t v13 = a1 + 2 * v9;
  __int16 v14 = *(_WORD *)(v13 + 328);
  if (v14)
  {
    unsigned int v15 = (_WORD *)(v13 + 328);
    LOWORD(v13) = v14 - 1;
    _WORD *v15 = v14 - 1;
  }
  else
  {
    uint64_t result = sub_263D8F35C(a1, 0);
    if (result) {
      return result;
    }
    uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v10 = *(void *)(a1 + 8 * v18 + 72);
    LODWORD(v13) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
    *(_WORD *)(a1 + 2 * v18 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  }
  __int16 v16 = *(_WORD *)(v10 + 10);
  if ((v16 & 2) == 0) {
    return 4294936500;
  }
  if ((v16 & 0x20) != 0)
  {
    uint64_t result = 0;
    uint64_t v19 = **(unsigned int **)(a1 + 40);
    *a2 = v19;
    a2[1] = v10 + v19 * (unint64_t)(unsigned __int16)v13 + 16;
    return result;
  }
  uint64_t v17 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v13 + 16);
  if ((*(_WORD *)(v17 + 4) & 4) != 0)
  {
    sub_263D91BE0(a1, v17);
    uint64_t result = sub_263D8F220(*(void *)(a1 + 16), a3, 0);
    if (result) {
      return result;
    }
    goto LABEL_27;
  }
  if (!a3 || (uint64_t result = sub_263D8EF48(a1, (unsigned int *)v17, a3), !result))
  {
LABEL_27:
    uint64_t result = 0;
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v17 + 6);
      a2[1] = v17 + 8;
    }
  }
  return result;
}

uint64_t sub_263D8F70C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  }
  int v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t result = sub_263D93614(a1, 0, 4);
    if (result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    int v7 = *(_DWORD *)(a1 + 68);
  }
  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  uint64_t v11 = v10 + 16;
  uint64_t v12 = *(unsigned __int16 *)(v10 + 16);
  *(_DWORD *)(a1 + 68) = v7 & 0xFFFFFFFC | 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = 0;
  if ((*(unsigned char *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      *a2 = **(unsigned int **)(a1 + 40);
LABEL_18:
      uint64_t result = 0;
      a2[1] = v11;
      return result;
    }
    return 0;
  }
  uint64_t v13 = v10 + v12;
  if ((*(_WORD *)(v10 + v12 + 4) & 4) != 0)
  {
    sub_263D91BE0(a1, v10 + v12);
    uint64_t result = sub_263D8F70C(*(void *)(a1 + 16), a3, 0);
    if (result) {
      return result;
    }
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v13 + 6);
      uint64_t v11 = v13 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3) {
    goto LABEL_16;
  }
  uint64_t result = sub_263D8EF48(a1, (unsigned int *)(v10 + v12), a3);
  if (!result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_263D8F82C(uint64_t a1, void *a2, void *a3)
{
  if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = *(unsigned __int16 *)(*(void *)(a1 + 40) + 6);
  if (*(_DWORD *)(a1 + 32) >= 2u) {
    v5 += *(unsigned __int16 *)(*(void *)(v4 + 88) + 54);
  }
  if (a2)
  {
    unint64_t v6 = *(unsigned int *)(*(void *)(v4 + 32) + 16);
    v5 += (*a2 + *a3 + v6 + 8) / v6;
  }
  if (*(_DWORD *)(v4 + 128) > (2 * v5)) {
    return 0;
  }
  int v8 = *(_DWORD **)(v4 + 72);
  uint64_t v10 = (void *)(v4 + 64);
  uint64_t v9 = *(_DWORD **)(v4 + 64);
  if (v9)
  {
    int v11 = *v9;
    if (*v9)
    {
      unsigned int v12 = 0;
      if ((v11 + 1) > 2) {
        uint64_t v13 = (v11 + 1);
      }
      else {
        uint64_t v13 = 2;
      }
      uint64_t v14 = v13 - 1;
      unsigned int v15 = (uint64_t *)(v9 + 2);
      do
      {
        uint64_t v17 = *v15++;
        uint64_t v16 = v17;
        if ((v17 & 1) == 0) {
          *(void *)&v9[2 * ++v12] = v16;
        }
        --v14;
      }
      while (v14);
    }
    else
    {
      unsigned int v12 = 0;
    }
    *(void *)uint64_t v9 = v12;
  }
  else
  {
    uint64_t v18 = malloc_type_malloc(0x100008uLL, 0x100004000313F17uLL);
    if (!v18)
    {
      void *v10 = 0;
      return 12;
    }
    _OWORD *v18 = xmmword_263D98830;
    void *v10 = (char *)v18 + 8;
  }
  uint64_t result = sub_263D93FC0((uint64_t *)a1, 16, 1);
  if (!result)
  {
    uint64_t v19 = *v8;
    if (*v8)
    {
      if ((2 * v5) < 0x4000) {
        int v20 = 0x3FFF;
      }
      else {
        int v20 = 2 * v5;
      }
      do
      {
        uint64_t v21 = &v8[4 * v19];
        uint64_t v22 = v21[1];
        unsigned int v23 = *(unsigned __int16 *)(v22 + 10);
        if (!(v23 >> 14))
        {
          unint64_t v24 = 2 * *v21;
          uint64_t v25 = *(void **)v4;
          if (*(void *)v4)
          {
            while (1)
            {
              uint64_t v26 = (uint64_t *)v25[8];
              if (v26)
              {
                if (*v26)
                {
                  int v27 = 0;
                  uint64_t v28 = *v26;
                  do
                  {
                    unsigned int v29 = v28 >> 1;
                    unsigned int v30 = v27 + (v28 >> 1) + 1;
                    unint64_t v31 = v26[v30];
                    if (v31 >= v24)
                    {
                      if (v31 <= v24) {
                        goto LABEL_40;
                      }
                      unsigned int v29 = v28 + ~v29;
                      v27 += (v28 >> 1) + 1;
                    }
                    LODWORD(v28) = v29;
                  }
                  while (v29);
                  if (v31 > v24) {
                    ++v30;
                  }
                }
                else
                {
                  unsigned int v30 = 1;
                }
LABEL_40:
                if (*v26 >= (unint64_t)v30 && v26[v30] == v24) {
                  break;
                }
              }
              uint64_t v25 = (void *)*v25;
              if (!v25) {
                goto LABEL_43;
              }
            }
            *(_WORD *)(v22 + 10) = v23 | 0x8000;
          }
          else
          {
LABEL_43:
            uint64_t result = mdb_midl_append((unint64_t **)(v4 + 64), v24);
            if (result) {
              goto LABEL_51;
            }
            --v20;
          }
        }
        --v19;
      }
      while (v19 && v20);
    }
    mdb_midl_sort(*(int **)(v4 + 64));
    uint64_t result = sub_263D8E1CC(v4, v19);
    if (!result) {
      uint64_t result = sub_263D93FC0((uint64_t *)a1, 32784, v19);
    }
  }
LABEL_51:
  if (result) {
    int v32 = 2;
  }
  else {
    int v32 = 8;
  }
  *(_DWORD *)(v4 + 124) |= v32;
  return result;
}

uint64_t sub_263D8FA98(uint64_t a1, __int16 a2, signed int a3, char **a4)
{
  uint64_t v10 = 0;
  uint64_t result = sub_263D8FE24(a1, a3, &v10);
  if (!result)
  {
    uint64_t v9 = v10;
    *((_WORD *)v10 + 5) = a2 | 0x10;
    *((_WORD *)v9 + 6) = 16;
    *((_WORD *)v9 + 7) = *(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 32) + 16);
    if (a2)
    {
      ++*(void *)(*(void *)(a1 + 40) + 8);
    }
    else if ((a2 & 2) != 0)
    {
      ++*(void *)(*(void *)(a1 + 40) + 16);
    }
    else if ((a2 & 4) != 0)
    {
      *(void *)(*(void *)(a1 + 40) + 24) += a3;
      *((_DWORD *)v9 + 3) = a3;
    }
    *a4 = v9;
  }
  return result;
}

uint64_t sub_263D8FB5C(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  if (v2 >= 2 && (**(unsigned char **)(a1 + 56) & 0x21) == 0)
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    memset(v7, 0, sizeof(v7));
    unint64_t v6 = *(void **)(a1 + 24);
    if (*(_DWORD *)(v6[12] + 4 * v2) != *(_DWORD *)(*(void *)(v6[4] + 152) + 4 * v2)) {
      return 4294936516;
    }
    sub_263D8D2EC((uint64_t)v8, v6, 1u, (uint64_t)v7);
    uint64_t result = sub_263D93614((uint64_t)v8, *(void **)(a1 + 48), 1);
    if (result) {
      return result;
    }
    **(unsigned char **)(a1 + 56) |= 1u;
  }
  *(_WORD *)(a1 + 66) = 0;
  if (!*(_WORD *)(a1 + 64)) {
    return 0;
  }
  do
  {
    uint64_t result = sub_263D93A44(a1);
    unsigned int v4 = *(unsigned __int16 *)(a1 + 64);
    if (result) {
      break;
    }
    unsigned __int16 v5 = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v5;
  }
  while (v4 > v5);
  *(_WORD *)(a1 + 66) = v4 - 1;
  return result;
}

uint64_t sub_263D8FCBC(uint64_t a1, const void **a2)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  unsigned int v4 = *(unsigned __int16 **)(a1 + 8 * v3 + 72);
  unsigned __int16 v5 = &v4[*(unsigned __int16 *)(a1 + 2 * v3 + 328)];
  unsigned int v8 = v5[8];
  int v7 = v5 + 8;
  uint64_t v6 = v8;
  uint64_t v9 = (unsigned __int16 *)((char *)v4 + v8);
  uint64_t v10 = *a2;
  unsigned int v11 = (*a2 + 1) & 0xFFFFFFFE;
  unsigned int v12 = v9[3];
  int v13 = (v12 + 1) & 0x1FFFE;
  int v14 = v11 - v13;
  if (v11 != v13)
  {
    if (v14 <= 0)
    {
      int v15 = v4[6];
    }
    else
    {
      int v15 = v4[6];
      if (v14 > (unsigned __int16)(v4[7] - v15))
      {
        size_t v17 = *(unsigned int *)v9 | ((unint64_t)v9[2] << 32);
        sub_263D9029C((void *)a1, 0);
        return sub_263D90A58(a1, a2, 0, v17, 0x40000);
      }
    }
    uint64_t v19 = (unsigned __int16)((v15 + 131056) >> 1);
    if ((unsigned __int16)((v15 + 131056) >> 1))
    {
      int v20 = v4 + 8;
      do
      {
        unsigned int v21 = (unsigned __int16)*v20;
        if (v21 <= v6) {
          *int v20 = v21 - v14;
        }
        ++v20;
        --v19;
      }
      while (v19);
    }
    memmove((char *)v4 + v4[7] - v14, (char *)v4 + v4[7], v6 - v4[7] + 8);
    v4[7] -= v14;
    uint64_t v9 = (unsigned __int16 *)((char *)v4 + *v7);
    unsigned int v12 = v9[3];
    uint64_t v10 = *a2;
  }
  if (v10 != (const void *)v12) {
    v9[3] = (unsigned __int16)v10;
  }
  if (v10) {
    memcpy(v9 + 4, a2[1], (size_t)v10);
  }
  return 0;
}

uint64_t sub_263D8FE24(uint64_t a1, signed int a2, char **a3)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  uint64_t v6 = (uint64_t **)(v4 + 176);
  unsigned __int16 v5 = *(uint64_t **)(v4 + 176);
  if (v5) {
    unsigned int v7 = *(_DWORD *)v5;
  }
  else {
    unsigned int v7 = 0;
  }
  unint64_t v52 = 0;
  uint64_t v51 = 0;
  memset(v50, 0, sizeof(v50));
  uint64_t v8 = (a2 - 1);
  if (a2 == 1)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    if (v9)
    {
      uint64_t result = 0;
      *(void *)(v3 + 48) = *(void *)(v9 + 32);
      --*(_DWORD *)(v3 + 56);
      *a3 = (char *)v9;
      return result;
    }
  }
  *a3 = 0;
  if (!*(_DWORD *)(v3 + 128))
  {
    uint64_t result = 4294936508;
LABEL_56:
    *(_DWORD *)(v3 + 124) |= 2u;
    return result;
  }
  unint64_t v11 = 0;
  int v12 = 0;
  char v13 = 1;
  int v14 = 1 - a2;
  int v46 = 60 * a2;
  int v47 = 0;
  while (1)
  {
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v48 = 0;
    unsigned int v49 = 0;
    if (v7 > v8)
    {
      unsigned int v15 = v7;
      do
      {
        uint64_t v16 = v5[v15];
        if (v5[v14 + v15] == v16 + v8)
        {
          signed int v36 = a2;
          goto LABEL_52;
        }
        --v15;
      }
      while (v15 > v8);
      if (v46-- < 1) {
        goto LABEL_68;
      }
    }
    if (v13)
    {
      unint64_t v52 = *(void *)(v4 + 184);
      unint64_t v11 = *(void *)(v4 + 168);
      sub_263D8D2EC(v50, v3, 0, 0);
      unint64_t v18 = v52;
      if (v52)
      {
        uint64_t v54 = (char *)&v52;
        uint64_t v53 = 8;
        int v12 = 17;
      }
      else
      {
        int v12 = 0;
      }
    }
    else
    {
      unint64_t v18 = v52;
    }
    unint64_t v19 = v18 + 1;
    unint64_t v52 = v19;
    if (v11 <= v19)
    {
      if (!v47)
      {
        unint64_t v11 = *(void *)(v3 + 24) - 1;
        uint64_t v20 = *(void *)(*(void *)(v3 + 32) + 64);
        if (v20)
        {
          uint64_t v21 = *(unsigned int *)(v20 + 48);
          if ((int)v21 >= 1)
          {
            uint64_t v22 = v20 + 128;
            unint64_t v23 = v21 + 1;
            do
            {
              uint64_t v24 = v22 + ((unint64_t)(v23 - 2) << 6);
              if (*(_DWORD *)(v24 + 8))
              {
                unint64_t v25 = *(void *)v24;
                if (v11 >= v25) {
                  unint64_t v11 = v25;
                }
              }
              --v23;
            }
            while (v23 > 1);
          }
        }
        *(void *)(v4 + 168) = v11;
      }
      if (v11 <= v19) {
        goto LABEL_68;
      }
      int v47 = 1;
    }
    uint64_t result = mdb_cursor_get((uint64_t)v50, &v53, 0, v12);
    if (result) {
      break;
    }
    unint64_t v26 = *(void *)v54;
    unint64_t v52 = v26;
    if (v11 <= v26)
    {
      if (!v47)
      {
        unint64_t v11 = *(void *)(v3 + 24) - 1;
        uint64_t v27 = *(void *)(*(void *)(v3 + 32) + 64);
        if (v27)
        {
          uint64_t v28 = *(unsigned int *)(v27 + 48);
          if ((int)v28 >= 1)
          {
            uint64_t v29 = v27 + 128;
            unint64_t v30 = v28 + 1;
            do
            {
              uint64_t v31 = v29 + ((unint64_t)(v30 - 2) << 6);
              if (*(_DWORD *)(v31 + 8))
              {
                unint64_t v32 = *(void *)v31;
                if (v11 >= v32) {
                  unint64_t v11 = v32;
                }
              }
              --v30;
            }
            while (v30 > 1);
          }
        }
        *(void *)(v4 + 168) = v11;
      }
      if (v11 <= v26) {
        goto LABEL_68;
      }
      int v47 = 1;
    }
    uint64_t result = sub_263D8EF48((uint64_t)v50, (unsigned int *)(*((void *)&v50[4] + WORD1(v50[4]) + 1)+ *(unsigned __int16 *)(*((void *)&v50[4] + WORD1(v50[4]) + 1)+ 2 * *((unsigned __int16 *)&v50[20] + WORD1(v50[4]) + 4)+ 16)), &v48);
    if (result) {
      goto LABEL_56;
    }
    uint64_t v33 = v49;
    uint64_t v34 = *v49;
    if (v5)
    {
      uint64_t result = mdb_midl_need((_DWORD **)v6, *v49);
      if (result) {
        goto LABEL_56;
      }
      unsigned __int16 v5 = *v6;
    }
    else
    {
      long long v35 = malloc_type_malloc(((v34 << 32) + 0x200000000) >> 29, 0x100004000313F17uLL);
      if (!v35)
      {
        void *v6 = 0;
        goto LABEL_54;
      }
      v35[1] = 0;
      unsigned __int16 v5 = v35 + 1;
      *long long v35 = (int)v34;
      void *v6 = v35 + 1;
    }
    *(void *)(v4 + 184) = v52;
    mdb_midl_xmerge(v5, v33);
    char v13 = 0;
    unsigned int v7 = *(_DWORD *)v5;
    int v12 = 8;
  }
  if (result != -30798) {
    goto LABEL_56;
  }
LABEL_68:
  uint64_t v16 = *(void *)(v3 + 16);
  signed int v36 = a2;
  if ((unint64_t)(v16 + a2) >= *(void *)(v4 + 128))
  {
    uint64_t result = 4294936504;
    goto LABEL_56;
  }
  unsigned int v15 = 0;
LABEL_52:
  if ((*(unsigned char *)(v4 + 14) & 8) != 0)
  {
    int v37 = (char *)(*(void *)(v4 + 56) + v16 * *(unsigned int *)(v4 + 16));
  }
  else
  {
    int v37 = sub_263D9072C(v3, v36);
    if (!v37)
    {
LABEL_54:
      uint64_t result = 12;
      goto LABEL_56;
    }
  }
  if (v15)
  {
    uint64_t v38 = v7 - v36;
    *unsigned __int16 v5 = v38;
    unsigned int v39 = v15 - v36;
    if (v15 - v36 < v38)
    {
      uint64_t v40 = v38 - v39;
      uint64_t v41 = &v5[v39 + 1];
      unsigned int v42 = v15 + 1;
      do
      {
        *v41++ = v5[v42++];
        --v40;
      }
      while (v40);
    }
  }
  else
  {
    *(void *)(v3 + 16) = v16 + v36;
  }
  *(void *)int v37 = v16;
  int v43 = (void (*)(void, uint64_t *))mdb_mid2l_append;
  if ((*(_DWORD *)(v3 + 124) & 0x80000) == 0) {
    int v43 = (void (*)(void, uint64_t *))mdb_mid2l_insert;
  }
  uint64_t v53 = v16;
  uint64_t v54 = v37;
  v43(*(void *)(v3 + 72), &v53);
  uint64_t result = 0;
  --*(_DWORD *)(v3 + 128);
  *a3 = v37;
  return result;
}

void *sub_263D9029C(void *result, int a2)
{
  uint64_t v2 = *((unsigned __int16 *)result + 33);
  uint64_t v3 = (_WORD *)result[v2 + 9];
  uint64_t v4 = *((unsigned __int16 *)result + v2 + 164);
  uint64_t v5 = (unsigned __int16)v3[6];
  unint64_t v6 = v5 + 131056;
  __int16 v7 = v3[5];
  if ((v7 & 0x20) != 0)
  {
    __int16 v12 = a2;
    int v13 = ~v4 + (unsigned __int16)(v6 >> 1);
    if (v13)
    {
      int v14 = (char *)v3 + (int)v4 * (uint64_t)a2 + 16;
      uint64_t result = memmove(v14, &v14[a2], v13 * a2);
      LOWORD(v5) = v3[6];
    }
    __int16 v17 = v3[7];
    unsigned int v15 = v3 + 7;
    LOWORD(v16) = v17;
    *(v15 - 1) = v5 - 2;
    __int16 v18 = v12 - 2;
  }
  else
  {
    uint64_t v8 = (unsigned __int16)v3[v4 + 8];
    uint64_t v9 = (char *)v3 + v8;
    int v10 = *(unsigned __int16 *)((char *)v3 + v8 + 6);
    int v11 = v10 + 8;
    if ((v7 & 2) != 0)
    {
      if (*((_WORD *)v9 + 2)) {
        int v11 = v10 + 16;
      }
      else {
        v11 += *(_DWORD *)v9;
      }
    }
    unsigned int v16 = (v11 + 1) & 0xFFFFFFFE;
    uint64_t v19 = (unsigned __int16)(v6 >> 1);
    if (v19)
    {
      unsigned __int16 v20 = 0;
      uint64_t v21 = v3 + 8;
      do
      {
        if (v4)
        {
          __int16 v22 = *v21;
          unint64_t v23 = &v3[v20];
          v23[8] = *v21;
          uint64_t v24 = v23 + 8;
          if (*v21 < v8) {
            _WORD *v24 = v22 + v16;
          }
          ++v20;
        }
        ++v21;
        --v4;
        --v19;
      }
      while (v19);
    }
    uint64_t result = memmove((char *)v3 + (unsigned __int16)v3[7] + v16, (char *)v3 + (unsigned __int16)v3[7], v8 - (unsigned __int16)v3[7]);
    v3[6] -= 2;
    __int16 v18 = v3[7];
    unsigned int v15 = v3 + 7;
  }
  _WORD *v15 = v18 + v16;
  return result;
}

uint64_t sub_263D903E0(uint64_t *a1, unint64_t a2, unint64_t *a3, int *a4)
{
  uint64_t v7 = a1[4];
  int v8 = *((_DWORD *)a1 + 31);
  if ((v8 & 0xA0000) != 0)
  {
LABEL_20:
    if (a1[2] <= a2)
    {
      *((_DWORD *)a1 + 31) = v8 | 2;
      return 4294936499;
    }
    int v10 = 0;
  }
  else
  {
    unint64_t v9 = 2 * a2;
    int v10 = 1;
    int v11 = (uint64_t **)a1;
    while (1)
    {
      __int16 v12 = v11[8];
      int v13 = (unint64_t *)v11[9];
      if (v12)
      {
        if (*v12)
        {
          int v14 = 0;
          uint64_t v15 = *v12;
          do
          {
            unsigned int v16 = v15 >> 1;
            unsigned int v17 = v14 + (v15 >> 1) + 1;
            unint64_t v18 = v12[v17];
            if (v18 >= v9)
            {
              if (v18 <= v9) {
                goto LABEL_14;
              }
              unsigned int v16 = v15 + ~v16;
              v14 += (v15 >> 1) + 1;
            }
            LODWORD(v15) = v16;
          }
          while (v16);
          if (v18 > v9) {
            ++v17;
          }
        }
        else
        {
          unsigned int v17 = 1;
        }
LABEL_14:
        if (*v12 >= (unint64_t)v17 && v12[v17] == v9) {
          break;
        }
      }
      unint64_t v19 = *v13;
      if (*v13)
      {
        unsigned int v20 = mdb_mid2l_search((unsigned int *)v11[9], a2);
        if (v19 >= v20 && v13[2 * v20] == a2)
        {
          unint64_t v21 = v13[2 * v20 + 1];
          goto LABEL_23;
        }
      }
      ++v10;
      int v11 = (uint64_t **)*v11;
      if (!v11) {
        goto LABEL_20;
      }
    }
  }
  unint64_t v21 = *(void *)(v7 + 56) + *(unsigned int *)(v7 + 16) * a2;
LABEL_23:
  *a3 = v21;
  uint64_t result = 0;
  if (a4) {
    *a4 = v10;
  }
  return result;
}

uint64_t sub_263D9054C(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = 2 * *(void *)a2;
  int v8 = (void *)a1;
  while (1)
  {
    unint64_t v9 = (uint64_t *)v8[8];
    if (v9)
    {
      if (*v9)
      {
        int v10 = 0;
        uint64_t v11 = *v9;
        do
        {
          unsigned int v12 = v11 >> 1;
          unsigned int v13 = v10 + (v11 >> 1) + 1;
          unint64_t v14 = v9[v13];
          if (v14 >= v7)
          {
            if (v14 <= v7) {
              goto LABEL_13;
            }
            unsigned int v12 = v11 + ~v12;
            v10 += (v11 >> 1) + 1;
          }
          LODWORD(v11) = v12;
        }
        while (v12);
        if (v14 > v7) {
          ++v13;
        }
      }
      else
      {
        unsigned int v13 = 1;
      }
LABEL_13:
      if (*v9 >= (unint64_t)v13)
      {
        uint64_t v15 = v13;
        if (v9[v13] == v7) {
          break;
        }
      }
    }
    int v8 = (void *)*v8;
    if (!v8) {
      return 0;
    }
  }
  if (!*(_DWORD *)(a1 + 128)) {
    return 4294936508;
  }
  if ((*(_WORD *)(a2 + 10) & 4) != 0) {
    signed int v17 = *(_DWORD *)(a2 + 12);
  }
  else {
    signed int v17 = 1;
  }
  if ((*(unsigned char *)(v6 + 14) & 8) != 0)
  {
    unint64_t v19 = (char *)a2;
  }
  else
  {
    unint64_t v18 = sub_263D9072C(a1, v17);
    if (!v18) {
      return 12;
    }
    unint64_t v19 = v18;
    int v20 = *(_DWORD *)(v6 + 16);
    if (v17 < 2) {
      sub_263D93EFC(v18, (_WORD *)a2, v20);
    }
    else {
      memcpy(v18, (const void *)a2, (v20 * v17));
    }
  }
  if (v8 == (void *)a1)
  {
    unint64_t v21 = *(void **)(a1 + 64);
    if (*v21 == v15) {
      *unint64_t v21 = v15 - 1;
    }
    else {
      v21[v15] |= 1uLL;
    }
  }
  __int16 v22 = mdb_mid2l_append;
  if ((*(_DWORD *)(a1 + 124) & 0x80000) == 0) {
    __int16 v22 = mdb_mid2l_insert;
  }
  v23[0] = *(void *)v19;
  v23[1] = v19;
  ((void (*)(void, void *))v22)(*(void *)(a1 + 72), v23);
  uint64_t result = 0;
  --*(_DWORD *)(a1 + 128);
  *((_WORD *)v19 + 5) |= 0x10u;
  *a3 = v19;
  return result;
}

char *sub_263D9072C(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  size_t v4 = *(unsigned int *)(v3 + 16);
  if (a2 == 1)
  {
    uint64_t v5 = *(char **)(v3 + 192);
    if (v5)
    {
      *(void *)(v3 + 192) = *(void *)v5;
      return v5;
    }
    size_t v7 = v4 - 16;
    uint64_t v6 = 16;
  }
  else
  {
    uint64_t v6 = v4 * (unint64_t)a2 - v4;
    size_t v7 = *(unsigned int *)(v3 + 16);
    size_t v4 = v4 * (unint64_t)a2;
  }
  int v8 = (char *)malloc_type_malloc(v4, 0xC0CB8A6BuLL);
  uint64_t v5 = v8;
  if (v8)
  {
    if ((*(unsigned char *)(v3 + 15) & 1) == 0)
    {
      bzero(&v8[v6], v7);
      *((_WORD *)v5 + 4) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 124) |= 2u;
  }
  return v5;
}

uint64_t sub_263D907DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)a2;
  uint64_t v5 = *(unsigned int *)(a2 + 12);
  uint64_t v6 = *(void *)(v3 + 32);
  size_t v7 = (unsigned int **)(v6 + 176);
  if (!*(void *)(v6 + 176) || *(void *)v3) {
    goto LABEL_3;
  }
  int v10 = *(uint64_t **)(v3 + 64);
  if ((*(_WORD *)(a2 + 10) & 0x10) != 0)
  {
    unsigned int v15 = 0;
  }
  else
  {
    if (!v10) {
      goto LABEL_3;
    }
    unint64_t v11 = 2 * v4;
    if (*v10)
    {
      int v12 = 0;
      uint64_t v13 = *v10;
      do
      {
        unsigned int v14 = v13 >> 1;
        unsigned int v15 = v12 + (v13 >> 1) + 1;
        unint64_t v16 = v10[v15];
        if (v16 >= v11)
        {
          if (v16 <= v11) {
            goto LABEL_23;
          }
          unsigned int v14 = v13 + ~v14;
          v12 += (v13 >> 1) + 1;
        }
        LODWORD(v13) = v14;
      }
      while (v14);
      if (v16 > v11) {
        ++v15;
      }
    }
    else
    {
      unsigned int v15 = 1;
    }
LABEL_23:
    if (*v10 < (unint64_t)v15 || v10[v15] != v11)
    {
LABEL_3:
      uint64_t result = mdb_midl_append_range((unint64_t **)(v3 + 40), *(void *)a2, v5);
      if (result) {
        return result;
      }
      goto LABEL_4;
    }
  }
  uint64_t result = mdb_midl_need(v7, *(_DWORD *)(a2 + 12));
  if (!result)
  {
    __int16 v17 = *(_WORD *)(a2 + 10);
    if ((v17 & 0x10) == 0)
    {
      if (*v10 == v15) {
        uint64_t *v10 = v15 - 1;
      }
      else {
        v10[v15] |= 1uLL;
      }
LABEL_35:
      uint64_t v28 = *v7;
      unsigned int v29 = **v7;
      if (v29)
      {
        while (1)
        {
          unsigned int v30 = v5 + v29;
          unint64_t v31 = *(void *)&v28[2 * v29];
          if (v31 >= v4) {
            break;
          }
          *(void *)&v28[2 * v30] = v31;
          if (!--v29)
          {
            unsigned int v30 = v5;
            break;
          }
        }
      }
      else
      {
        unsigned int v30 = v5;
      }
      if (v30 > v29)
      {
        unint64_t v32 = &v28[2 * v30];
        do
        {
          *(void *)unint64_t v32 = v4;
          v32 -= 2;
          ++v4;
          --v30;
        }
        while (v29 < v30);
      }
      *(void *)v28 += v5;
LABEL_4:
      uint64_t result = 0;
      *(void *)(*(void *)(a1 + 40) + 24) -= v5;
      return result;
    }
    unint64_t v18 = *(uint64_t **)(v3 + 72);
    uint64_t v19 = (*v18)--;
    int v20 = &v18[2 * v19];
    uint64_t v21 = v20[1];
    if (v21 == a2)
    {
LABEL_30:
      ++*(_DWORD *)(v3 + 128);
      if ((*(unsigned char *)(v6 + 14) & 8) == 0)
      {
        if ((v17 & 4) != 0 && *(_DWORD *)(a2 + 12) != 1)
        {
          free((void *)a2);
        }
        else
        {
          *(void *)a2 = *(void *)(v6 + 192);
          *(void *)(v6 + 192) = a2;
        }
      }
      goto LABEL_35;
    }
    uint64_t v22 = v19;
    uint64_t v23 = *v20;
    uint64_t v24 = &v18[2 * v22 - 1];
    uint64_t v25 = v22 + 1;
    while ((unint64_t)--v25 >= 2)
    {
      uint64_t v26 = *(v24 - 1);
      uint64_t v27 = *v24;
      *(v24 - 1) = v23;
      uint64_t *v24 = v21;
      v24 -= 2;
      uint64_t v21 = v27;
      uint64_t v23 = v26;
      if (v27 == a2) {
        goto LABEL_30;
      }
    }
    uint64_t v33 = *v18 + 1;
    uint64_t *v18 = v33;
    uint64_t v34 = &v18[2 * v33];
    *uint64_t v34 = v23;
    v34[1] = v21;
    *(_DWORD *)(v3 + 124) |= 2u;
    return 4294936500;
  }
  return result;
}

uint64_t sub_263D90A58(uint64_t a1, const void **a2, size_t *a3, size_t a4, int a5)
{
  uint64_t v10 = *(void *)(*(void *)(a1 + 24) + 32);
  v212[0] = 0uLL;
  v210 = 0;
  v211 = 0;
  uint64_t v208 = 0;
  v209 = 0;
  v206 = 0;
  v207 = 0;
  uint64_t v205 = 0;
  memset(v204, 0, sizeof(v204));
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  uint64_t v11 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v12 = *(void *)(a1 + 8 * v11 + 72);
  uint64_t v13 = (void *)(a1 + 328);
  uint64_t v14 = *(unsigned __int16 *)(a1 + 328 + 2 * v11);
  int v15 = *(unsigned __int16 *)(v12 + 12);
  uint64_t result = sub_263D8FA98(a1, *(_WORD *)(v12 + 10), 1, &v207);
  if (result) {
    return result;
  }
  v173 = v207;
  v174 = a2;
  *((_WORD *)v207 + 4) = *(_WORD *)(v12 + 8);
  unsigned int v17 = *(unsigned __int16 *)(a1 + 66);
  if (*(_WORD *)(a1 + 66))
  {
    size_t v168 = a4;
    v170 = a3;
    uint64_t v18 = v10;
    unsigned int v165 = 0;
    unsigned int v19 = v17 - 1;
  }
  else
  {
    uint64_t result = sub_263D8FA98(a1, 1, 1, &v206);
    if (result) {
      goto LABEL_168;
    }
    uint64_t v29 = *(unsigned __int16 *)(a1 + 64);
    if (*(_WORD *)(a1 + 64))
    {
      unint64_t v30 = v29 + 1;
      unint64_t v31 = (_WORD *)(a1 + 2 * v29 + 328);
      unint64_t v32 = (void *)(a1 + 8 * v29 + 72);
      uint64_t v33 = v32;
      uint64_t v34 = v31;
      do
      {
        uint64_t v35 = *--v33;
        *unint64_t v32 = v35;
        LOWORD(v35) = *--v34;
        *unint64_t v31 = v35;
        --v30;
        unint64_t v32 = v33;
        unint64_t v31 = v34;
      }
      while (v30 > 1);
    }
    signed int v36 = v206;
    *(void *)(a1 + 72) = v206;
    *(_WORD *)(a1 + 328) = 0;
    uint64_t v37 = *(void *)(a1 + 40);
    *(void *)(v37 + 40) = *(void *)v36;
    unsigned int v17 = *(unsigned __int16 *)(v37 + 6);
    *(_WORD *)(v37 + 6) = v17 + 1;
    uint64_t result = sub_263D91934(a1, 0, 0, 0, *(void *)v12, 0);
    if (result)
    {
      *(void *)(a1 + 72) = *(void *)(a1 + 80);
      *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
      uint64_t v38 = *(void *)(a1 + 40);
      *(void *)(v38 + 40) = *(void *)v12;
      --*(_WORD *)(v38 + 6);
      goto LABEL_168;
    }
    size_t v168 = a4;
    v170 = a3;
    uint64_t v18 = v10;
    unsigned int v165 = v17;
    unsigned int v19 = 0;
    ++*(_WORD *)(a1 + 64);
    LOWORD(v17) = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v17;
  }
  sub_263D94E38(a1, (uint64_t)&v200);
  *(void *)&long long v201 = 0;
  uint64_t v20 = WORD1(v204[0]);
  uint64_t v21 = (size_t *)v173;
  *((void *)v204 + WORD1(v204[0]) + 1) = v173;
  uint64_t v22 = (char *)&v200 + 2 * v19;
  *((_WORD *)v22 + 164) = *(_WORD *)(a1 + 2 * v19 + 328) + 1;
  int v167 = a5;
  unsigned int v169 = v19;
  signed int v166 = v14;
  if ((a5 & 0x20000) != 0)
  {
    unsigned int v39 = v19;
    unsigned int v171 = 0;
    signed int v172 = v14;
    uint64_t v40 = 0;
    *((_WORD *)&v204[16] + v20 + 4) = 0;
    v212[0] = *(_OWORD *)v174;
    size_t v41 = *(void *)&v212[0];
    uint64_t v26 = v18;
    goto LABEL_71;
  }
  unsigned int v23 = v15 - 16;
  unsigned int v24 = v23 >> 1;
  unsigned int v25 = ((v23 >> 1) + 1) >> 1;
  uint64_t v26 = v18;
  unsigned int v171 = v23 >> 1;
  if ((*((_WORD *)v173 + 5) & 0x20) == 0)
  {
    long long v161 = v22;
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      unsigned int v27 = (v24 + 1) >> 1;
      unint64_t v51 = (unint64_t)*v174 + *v170 + 8;
      uint64_t v52 = 8 - *v170;
      if (v51 <= *(unsigned int *)(v26 + 220)) {
        LODWORD(v52) = 0;
      }
      LODWORD(v28) = (v51 + v52 + 3) & 0xFFFFFFFE;
    }
    else
    {
      unsigned int v27 = (v24 + 1) >> 1;
      if (v174) {
        uint64_t v28 = (uint64_t)*v174 + 10;
      }
      else {
        LODWORD(v28) = 10;
      }
    }
    int v58 = *(_DWORD *)(v26 + 16);
    uint64_t v59 = sub_263D9072C(*(void *)(a1 + 24), 1u);
    if (v59)
    {
      uint64_t v40 = v59;
      int v60 = v58 - 16;
      int v61 = (v28 + 1) & 0xFFFFFFFE;
      *(void *)uint64_t v59 = *(void *)v12;
      *((_WORD *)v59 + 5) = *(_WORD *)(v12 + 10);
      *((_WORD *)v59 + 6) = 16;
      *((_WORD *)v59 + 7) = *(_DWORD *)(v26 + 16);
      if (v23 > 1)
      {
        int v67 = 0;
        if (v171 <= 1) {
          uint64_t v68 = 1;
        }
        else {
          uint64_t v68 = v171;
        }
        v69 = (__int16 *)(v12 + 16);
        uint64_t v70 = v14;
        do
        {
          if (!v70)
          {
            unint64_t v71 = &v59[2 * v67++];
            *((_WORD *)v71 + 8) = 0;
          }
          __int16 v72 = *v69++;
          int v73 = &v59[2 * v67++];
          *((_WORD *)v73 + 8) = v72;
          --v70;
          --v68;
        }
        while (v68);
        if (v60 >= 0) {
          int v74 = v58 - 16;
        }
        else {
          int v74 = v58 - 1;
        }
        BOOL v62 = v171 > v14;
        unsigned int v39 = v169;
        unsigned int v63 = v27;
        if (v23 >= 0x40 && v61 <= v74 >> 4 && v171 > v14) {
          goto LABEL_67;
        }
      }
      else
      {
        BOOL v62 = v171 > v14;
        unsigned int v39 = v169;
        unsigned int v63 = v27;
      }
      if (v63 < v14 && v62)
      {
        int v64 = v63 - 1;
        int v65 = -1;
        BOOL v62 = 1;
        LODWORD(v66) = v23 >> 1;
      }
      else
      {
        if (v62)
        {
          BOOL v62 = 0;
          LODWORD(v66) = 0;
          int v64 = v63 + ((*(unsigned __int16 *)(v12 + 10) >> 1) & 1) + 1;
          int v65 = 1;
          goto LABEL_54;
        }
        LODWORD(v66) = 0;
        int v65 = 1;
        int v64 = v23 >> 1;
      }
      if (v66 != v64)
      {
LABEL_54:
        signed int v75 = 0;
        uint64_t v76 = v64 - v65;
        int v77 = -(int)v66;
        int v78 = -v64;
        uint64_t v66 = v66;
        while (1)
        {
          if (v14 == v66)
          {
            v75 += v61;
          }
          else
          {
            uint64_t v79 = v12 + *(unsigned __int16 *)&v40[2 * v66 + 16];
            int v80 = v75 + *(unsigned __int16 *)(v79 + 6) + 10;
            if ((*(_WORD *)(v12 + 10) & 2) != 0)
            {
              if (*(_WORD *)(v79 + 4)) {
                v80 += 8;
              }
              else {
                v80 += *(_DWORD *)v79;
              }
            }
            signed int v75 = (v80 + 1) & 0xFFFFFFFE;
          }
          if (v75 > v60 || v76 == v66) {
            break;
          }
          v66 += v65;
          v77 -= v65;
          if (v78 == v77) {
            goto LABEL_67;
          }
        }
        unsigned int v63 = v62 - v77;
      }
LABEL_67:
      if (v63 == v14)
      {
        size_t v41 = (size_t)*v174;
        unsigned int v81 = v174[1];
        *(void *)&v212[0] = *v174;
        *((void *)&v212[0] + 1) = v81;
        signed int v172 = v14;
      }
      else
      {
        signed int v172 = v63;
        uint64_t v82 = v12 + *(unsigned __int16 *)&v40[2 * v63 + 16];
        size_t v41 = *(unsigned __int16 *)(v82 + 6);
        *(void *)&v212[0] = v41;
        *((void *)&v212[0] + 1) = v82 + 8;
      }
      uint64_t v21 = (size_t *)v173;
      uint64_t v22 = v161;
      goto LABEL_71;
    }
    uint64_t result = 12;
LABEL_168:
    *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    return result;
  }
  int v42 = *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v17 + 328);
  int v43 = v42 - v25;
  size_t v41 = **(unsigned int **)(a1 + 40);
  size_t v44 = (char *)(v12 + 16 + v41 * v25);
  unsigned int v45 = v24 - v25;
  int v46 = v14;
  size_t v47 = v41 * v45;
  *(_WORD *)(v12 + 12) -= 2 * v45;
  *((_WORD *)v173 + 6) += 2 * v45;
  LOWORD(v45) = v41 * v45 - 2 * v45;
  *(_WORD *)(v12 + 14) += v45;
  *((_WORD *)v173 + 7) -= v45;
  *(void *)&v212[0] = v41;
  uint64_t v48 = v44;
  signed int v172 = (v24 + 1) >> 1;
  if (v172 == v46) {
    uint64_t v48 = (char *)v174[1];
  }
  *((void *)&v212[0] + 1) = v48;
  uint64_t v160 = v18;
  if (v43 < 0)
  {
    uint64_t v53 = (char *)(v12 + 16 + v41 * *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)));
    uint64_t v54 = v44;
    unint64_t v55 = v22;
    memcpy(v173 + 16, v54, v47);
    *((void *)&v212[0] + 1) = v173 + 16;
    memmove(&v53[v41], v53, (v172 - *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66))) * v41);
    unint64_t v56 = v53;
    uint64_t v26 = v18;
    memcpy(v56, v174[1], v41);
    uint64_t v22 = v55;
    uint64_t v21 = (size_t *)v173;
    unsigned int v39 = v169;
    uint64_t v40 = 0;
    *(_WORD *)(v12 + 12) += 2;
    *(_WORD *)(v12 + 14) = *(_WORD *)(v12 + 14) - v41 + 2;
  }
  else
  {
    unsigned int v49 = v22;
    uint64_t v50 = (v43 * v41);
    if (v42 != v172)
    {
      memcpy(v173 + 16, v44, (v43 * v41));
      uint64_t v21 = (size_t *)v173;
    }
    int v57 = (char *)v21 + v50 + 16;
    memcpy(v57, v174[1], v41);
    memcpy(&v57[v41], &v44[v50], (v47 - v50));
    uint64_t v21 = (size_t *)v173;
    uint64_t v40 = 0;
    *((_WORD *)v173 + 6) += 2;
    *((_WORD *)v173 + 7) = *((_WORD *)v173 + 7) - v41 + 2;
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v43;
    uint64_t v26 = v160;
    unsigned int v39 = v169;
    uint64_t v22 = v49;
  }
LABEL_71:
  unint64_t v83 = v41 + 10;
  unsigned __int16 v164 = *(_WORD *)(*((void *)v204 + v39 + 1) + 14) - *(_WORD *)(*((void *)v204 + v39 + 1) + 12);
  if (v41 + 10 <= v164)
  {
    --WORD1(v204[0]);
    uint64_t result = sub_263D91934((uint64_t)&v200, *((unsigned __int16 *)v22 + 164), (const void **)v212, 0, *v21, 0);
    ++WORD1(v204[0]);
    if (result) {
      goto LABEL_165;
    }
  }
  else
  {
    uint64_t v84 = v26;
    unsigned int v162 = *(unsigned __int16 *)(a1 + 64);
    --LOWORD(v204[0]);
    --WORD1(v204[0]);
    uint64_t v199 = 0;
    long long v197 = 0u;
    long long v198 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    uint64_t v85 = *(void *)(*((void *)&v201 + 1) + 104);
    uint64_t v86 = v202;
    int v87 = &v200;
    if ((BYTE4(v204[0]) & 4) != 0)
    {
      DWORD1(v179) = 1;
      *(void *)&long long v176 = &v200;
      int v87 = &v175;
    }
    *(void *)int v87 = *(void *)(v85 + 8 * v202);
    *(void *)(v85 + 8 * v86) = v87;
    uint64_t result = sub_263D90A58(&v200, v212, 0, *v21, 0);
    *(void *)(v85 + 8 * v86) = *(void *)v87;
    uint64_t v26 = v84;
    if (result) {
      goto LABEL_165;
    }
    if (*(unsigned __int16 *)(a1 + 64) <= v162) {
      uint64_t v88 = v169;
    }
    else {
      uint64_t v88 = v169 + 1;
    }
    uint64_t v89 = *((void *)v204 + v88 + 1);
    uint64_t v90 = a1 + 8 * v88;
    uint64_t v93 = *(void *)(v90 + 72);
    uint64_t v91 = (void *)(v90 + 72);
    uint64_t v92 = v93;
    unsigned int v169 = v88;
    if (v89 != v93)
    {
      uint64_t v94 = a1 + 2 * v88;
      if (*(unsigned __int16 *)(v94 + 328) >= (*(unsigned __int16 *)(v92 + 12) - 16) >> 1)
      {
        if ((int)v88 >= 1)
        {
          uint64_t v95 = 0;
          uint64_t v96 = a1 + 328;
          do
          {
            *(void *)(v96 + 8 * v95 - 256) = *((void *)v204 + v95 + 1);
            *(_WORD *)(v96 + 2 * v95) = *((_WORD *)&v204[16] + v95 + 4);
            ++v95;
          }
          while (v88 != v95);
        }
        long long v97 = (_WORD *)(v94 + 328);
        *uint64_t v91 = v89;
        if (*((_WORD *)&v204[16] + v88 + 4))
        {
          *long long v97 = *((_WORD *)&v204[16] + v88 + 4) - 1;
        }
        else
        {
          *long long v97 = 0;
          sub_263D8F35C(a1, 0);
        }
      }
    }
  }
  int v98 = v167;
  if ((v167 & 0x20000) != 0)
  {
    uint64_t v118 = *(unsigned __int16 *)(a1 + 66);
    *(void *)(a1 + 8 * v118 + 72) = v173;
    *(_WORD *)(a1 + 2 * v118 + 328) = 0;
    uint64_t result = sub_263D91934(a1, 0, v174, v170, v168, v167);
    if (result) {
      goto LABEL_165;
    }
    int v98 = v167;
    unsigned int v104 = v166;
    unsigned int v117 = v169;
    if (*(_WORD *)(a1 + 66))
    {
      memcpy(v13, (char *)&v204[16] + 8, 2 * *(unsigned __int16 *)(a1 + 66));
      unsigned int v117 = v169;
    }
    goto LABEL_130;
  }
  if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
  {
    unsigned int v104 = v166;
    unsigned int v117 = v169;
    if (v172 <= v166)
    {
      *(void *)(a1 + 72 + 8 * *(unsigned __int16 *)(a1 + 66)) = v173;
      uint64_t v119 = a1 + 2 * v169;
      unsigned __int16 v120 = *(_WORD *)(v119 + 328) + 1;
      *(_WORD *)(v119 + 328) = v120;
      uint64_t v121 = *(void *)(a1 + 72 + 8 * v169);
      if (*((void *)v204 + v169 + 1) != v121 && (*(unsigned __int16 *)(v121 + 12) - 16) >> 1 <= v120)
      {
        uint64_t v122 = 164;
        uint64_t v123 = 72;
        do
        {
          *(void *)(a1 + v123) = *(void *)((char *)&v200 + v123);
          *(_WORD *)(a1 + 2 * v122) = *((_WORD *)&v200 + v122);
          ++v122;
          v123 += 8;
        }
        while (v122 - v169 != 165);
      }
    }
LABEL_130:
    uint64_t v131 = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (!v131)
    {
LABEL_164:
      uint64_t result = 0;
      goto LABEL_165;
    }
    unsigned int v132 = *(unsigned __int16 *)(v12 + 12) - 16;
    unsigned int v133 = v132 >> 1;
    int v134 = *(_DWORD *)(a1 + 68);
    v135 = v207;
    uint64_t v136 = 2 * v165 + 330;
    uint64_t v137 = 8 * v165 + 80;
    while (1)
    {
      int v138 = v131;
      if ((v134 & 4) != 0) {
        int v138 = (uint64_t *)v131[2];
      }
      if (v138 == (uint64_t *)a1 || (*((_DWORD *)v131 + 17) & *((_DWORD *)v138 + 17) & 1) == 0) {
        goto LABEL_163;
      }
      if (!v165) {
        break;
      }
      if (v138[9] == v12)
      {
        v139 = (_WORD *)((char *)v138 + v136);
        uint64_t v140 = (uint64_t *)((char *)v138 + v137);
        uint64_t v141 = v165 + 1;
        size_t v142 = (_WORD *)((char *)v138 + v136);
        v143 = (uint64_t *)((char *)v138 + v137);
        do
        {
          __int16 v144 = *--v142;
          _WORD *v139 = v144;
          uint64_t v145 = *--v143;
          *uint64_t v140 = v145;
          uint64_t v140 = v143;
          v139 = v142;
        }
        while (v141-- > 1);
        *((_WORD *)v138 + 164) = v133 <= *((unsigned __int16 *)v138 + 164);
        v138[9] = *(void *)(a1 + 72);
        ++*((_WORD *)v138 + 32);
        unsigned __int16 v147 = *((_WORD *)v138 + 33) + 1;
        *((_WORD *)v138 + 33) = v147;
        goto LABEL_143;
      }
LABEL_163:
      uint64_t v131 = (uint64_t *)*v131;
      if (!v131) {
        goto LABEL_164;
      }
    }
    unsigned __int16 v147 = *((_WORD *)v138 + 33);
LABEL_143:
    uint64_t v148 = *(unsigned __int16 *)(a1 + 66);
    if (v148 <= v147 && v138[v148 + 9] == v12)
    {
      uint64_t v151 = (uint64_t)v138 + 2 * v148;
      unsigned int v152 = *(unsigned __int16 *)(v151 + 328);
      if ((v98 & 0x40000) == 0 && v152 >= v104)
      {
        *(_WORD *)(v151 + 328) = v152 + 1;
        uint64_t v148 = *(unsigned __int16 *)(a1 + 66);
        unsigned int v152 = *((unsigned __int16 *)v138 + v148 + 164);
      }
      if (v133 <= v152)
      {
        v138[v148 + 9] = (uint64_t)v135;
        *((_WORD *)v138 + v148 + 164) = v152 - (v132 >> 1);
        if (*(_WORD *)(a1 + 66))
        {
          unint64_t v153 = 0;
          long long v154 = v138 + 41;
          do
          {
            *((_WORD *)v154 + v153) = *((_WORD *)&v204[16] + v153 + 4);
            v154[v153 - 32] = *((void *)v204 + v153 + 1);
            ++v153;
          }
          while (v153 < *(unsigned __int16 *)(a1 + 66));
        }
      }
    }
    else if (v83 <= v164 && (int)v117 <= v147 && v138[v117 + 9] == *(void *)(a1 + 8 * v117 + 72))
    {
      uint64_t v149 = (uint64_t)v138 + 2 * v117;
      unsigned int v150 = *(unsigned __int16 *)(v149 + 328);
      if (v150 >= *(unsigned __int16 *)(a1 + 2 * v117 + 328)) {
        *(_WORD *)(v149 + 328) = v150 + 1;
      }
    }
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      uint64_t v155 = v138[2];
      if (v155)
      {
        if (*(unsigned char *)(v155 + 68))
        {
          uint64_t v156 = *(unsigned __int16 *)(a1 + 66);
          uint64_t v157 = v138[v156 + 9];
          uint64_t v158 = *((unsigned __int16 *)v138 + v156 + 164);
          if (v158 < (*(unsigned __int16 *)(v157 + 12) - 16) >> 1)
          {
            uint64_t v159 = v157 + *(unsigned __int16 *)(v157 + 2 * v158 + 16);
            if ((*(_WORD *)(v159 + 4) & 6) == 4) {
              *(void *)(v155 + 72) = v159 + *(unsigned __int16 *)(v159 + 6) + 8;
            }
          }
        }
      }
    }
    goto LABEL_163;
  }
  unint64_t v163 = v83;
  uint64_t v99 = v26;
  size_t v100 = 0;
  int v101 = 0;
  *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v173;
  long long v102 = (size_t *)&v208;
  signed int v103 = v172;
  unsigned int v104 = v166;
  while (1)
  {
    if (v103 == v166)
    {
      int64_t v105 = (unsigned int *)v174[1];
      v210 = *v174;
      v211 = v105;
      if ((*(_WORD *)(v12 + 10) & 2) != 0) {
        long long v102 = v170;
      }
      else {
        size_t v100 = v168;
      }
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v101;
      __int16 v106 = *(_WORD *)(v12 + 10);
      LODWORD(v107) = v167;
    }
    else
    {
      uint64_t v108 = (unsigned int *)(v12 + *(unsigned __int16 *)&v40[2 * v103 + 16]);
      v211 = v108 + 2;
      size_t v109 = (char *)*((unsigned __int16 *)v108 + 3);
      v210 = v109;
      __int16 v106 = *(_WORD *)(v12 + 10);
      if ((v106 & 2) != 0)
      {
        uint64_t v208 = *v108;
        v209 = &v109[(void)(v108 + 2)];
        LODWORD(v107) = *((unsigned __int16 *)v108 + 2);
        long long v102 = (size_t *)&v208;
      }
      else
      {
        uint64_t v107 = *((unsigned __int16 *)v108 + 2);
        size_t v100 = *v108 | (unint64_t)(v107 << 32);
      }
    }
    if (!(v106 & 2 | v101)) {
      v210 = 0;
    }
    uint64_t result = sub_263D91934(a1, (unsigned __int16)v101, &v210, v102, v100, v107);
    if (result) {
      break;
    }
    if (v103 == v171)
    {
      signed int v103 = 0;
      int v101 = 0;
      *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v40;
    }
    else
    {
      ++v103;
      ++v101;
    }
    if (v103 == v172)
    {
      LODWORD(v110) = *((unsigned __int16 *)v40 + 6);
      unsigned int v111 = (v110 - 16) >> 1;
      uint64_t v26 = v99;
      unint64_t v83 = v163;
      if ((v110 - 16) >= 2)
      {
        if (v111 <= 1) {
          uint64_t v112 = 1;
        }
        else {
          uint64_t v112 = v111;
        }
        int v113 = (_WORD *)(v12 + 16);
        uint64_t v114 = (__int16 *)(v40 + 16);
        do
        {
          __int16 v115 = *v114++;
          *v113++ = v115;
          --v112;
        }
        while (v112);
        uint64_t v110 = *((unsigned __int16 *)v40 + 6);
      }
      *(_WORD *)(v12 + 12) = v110;
      *(_WORD *)(v12 + 14) = *((_WORD *)v40 + 7);
      memcpy((void *)(v12 + *(unsigned __int16 *)(v12 + 2 * v111 - 2 + 16)), &v40[*(unsigned __int16 *)&v40[2 * v111 + 14]], *(_DWORD *)(v99 + 16) - *((unsigned __int16 *)v40 + 7));
      if (v172 <= v166)
      {
        uint64_t v116 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 72 + 8 * v116) = v207;
        unsigned int v117 = v169;
        uint64_t v124 = a1 + 2 * v169;
        unsigned __int16 v125 = *(_WORD *)(v124 + 328) + 1;
        *(_WORD *)(v124 + 328) = v125;
        uint64_t v126 = *(void *)(a1 + 72 + 8 * v169);
        if (*((void *)v204 + v169 + 1) != v126 && (*(unsigned __int16 *)(v126 + 12) - 16) >> 1 <= v125)
        {
          uint64_t v127 = 164;
          uint64_t v128 = 72;
          do
          {
            *(void *)(a1 + v128) = *(void *)((char *)&v200 + v128);
            *(_WORD *)(a1 + 2 * v127) = *((_WORD *)&v200 + v127);
            ++v127;
            v128 += 8;
          }
          while (v127 - v169 != 165);
        }
      }
      else
      {
        uint64_t v116 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 8 * v116 + 72) = v12;
        unsigned int v117 = v169;
      }
      if ((v167 & 0x10000) != 0)
      {
        uint64_t v129 = *(void *)(a1 + 8 * v116 + 72);
        uint64_t v130 = v129
             + *(unsigned __int16 *)(v129 + 2 * *(unsigned __int16 *)(a1 + 2 * v116 + 328) + 16);
        if ((*(_WORD *)(v130 + 4) & 1) == 0) {
          v170[1] = v130 + *(unsigned __int16 *)(v130 + 6) + 8;
        }
      }
      goto LABEL_130;
    }
  }
  uint64_t v26 = v99;
LABEL_165:
  if (v40)
  {
    *(void *)uint64_t v40 = *(void *)(v26 + 192);
    *(void *)(v26 + 192) = v40;
  }
  if (result) {
    goto LABEL_168;
  }
  return result;
}

uint64_t sub_263D91934(uint64_t a1, int a2, const void **a3, size_t *a4, size_t a5, int a6)
{
  int v8 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t v35 = 0;
  __int16 v9 = v8[5];
  if ((v9 & 0x20) != 0)
  {
    size_t v15 = **(int **)(a1 + 40);
    int v16 = (((unsigned __int16)v8[6] - 16) >> 1) - a2;
    if (v16 >= 1) {
      memmove((char *)v8 + (int)v15 * (uint64_t)a2 + v15 + 16, (char *)v8 + (int)v15 * (uint64_t)a2 + 16, v16 * (int)v15);
    }
    memcpy((char *)v8 + (int)v15 * (uint64_t)a2 + 16, a3[1], v15);
    uint64_t result = 0;
    v8[6] += 2;
    v8[7] = v8[7] - v15 + 2;
    return result;
  }
  int v10 = a6;
  int v13 = (unsigned __int16)v8[6];
  if (a3) {
    uint64_t v14 = (uint64_t)*a3 + 8;
  }
  else {
    uint64_t v14 = 8;
  }
  uint64_t v18 = (unsigned __int16)(v8[7] - v13) - 2;
  if ((v9 & 2) == 0)
  {
    unint64_t v19 = v14;
    goto LABEL_16;
  }
  if (a6)
  {
    unint64_t v19 = v14 + 8;
LABEL_16:
    int64_t v22 = (v19 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if (v22 > v18)
    {
      uint64_t v20 = *(void *)(a1 + 24);
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unint64_t v19 = *a4 + v14;
  uint64_t v20 = *(void *)(a1 + 24);
  uint64_t v21 = *(void *)(v20 + 32);
  if (v19 <= *(unsigned int *)(v21 + 220)) {
    goto LABEL_16;
  }
  int64_t v22 = (v14 + 9) & 0xFFFFFFFFFFFFFFFELL;
  if (v22 > v18)
  {
LABEL_18:
    *(_DWORD *)(v20 + 124) |= 2u;
    return 4294936510;
  }
  uint64_t result = sub_263D8FA98(a1, 4, ((*a4 + 15) / *(unsigned int *)(v21 + 16)) + 1, &v35);
  if (result) {
    return result;
  }
  v10 |= 1u;
  int v13 = (unsigned __int16)v8[6];
LABEL_19:
  unsigned int v23 = (v13 - 16) >> 1;
  if (v23 > a2)
  {
    unsigned int v24 = &v8[v23 + 8];
    unsigned int v25 = &v8[v23 + 7];
    do
    {
      --v23;
      __int16 v26 = *v25--;
      *v24-- = v26;
    }
    while (v23 > a2);
    LOWORD(v13) = v8[6];
  }
  unsigned __int16 v27 = v8[7] - v22;
  v8[a2 + 8] = v27;
  v8[7] = v27;
  v8[6] = v13 + 2;
  uint64_t v28 = (char *)v8 + v27;
  if (a3) {
    unsigned __int16 v29 = *(_WORD *)a3;
  }
  else {
    unsigned __int16 v29 = 0;
  }
  *((_WORD *)v28 + 3) = v29;
  *((_WORD *)v28 + 2) = v10;
  if ((v8[5] & 2) != 0) {
    a5 = *a4;
  }
  else {
    *((_WORD *)v28 + 2) = WORD2(a5);
  }
  *(_DWORD *)uint64_t v28 = a5;
  if (a3) {
    memcpy(v28 + 8, a3[1], (size_t)*a3);
  }
  if ((v8[5] & 2) != 0)
  {
    unint64_t v30 = &v28[v29 + 8];
    if (v35)
    {
      unint64_t v31 = v35 + 16;
      *(void *)unint64_t v30 = *(void *)v35;
      if ((v10 & 0x10000) != 0)
      {
        uint64_t result = 0;
        a4[1] = (size_t)v31;
        return result;
      }
      size_t v33 = *a4;
      unint64_t v32 = (const void *)a4[1];
      uint64_t v34 = v31;
    }
    else
    {
      if (v10)
      {
        uint64_t result = 0;
        *(void *)unint64_t v30 = *(void *)a4[1];
        return result;
      }
      if ((v10 & 0x10000) != 0)
      {
        uint64_t result = 0;
        a4[1] = (size_t)v30;
        return result;
      }
      size_t v33 = *a4;
      unint64_t v32 = (const void *)a4[1];
      uint64_t v34 = &v28[v29 + 8];
    }
    memcpy(v34, v32, v33);
  }
  return 0;
}

uint64_t sub_263D91BE0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if ((*(_WORD *)(a2 + 4) & 2) != 0)
  {
    uint64_t v8 = a2 + *(unsigned __int16 *)(a2 + 6);
    long long v9 = *(_OWORD *)(v8 + 8);
    long long v10 = *(_OWORD *)(v8 + 40);
    *(_OWORD *)(v2 + 408) = *(_OWORD *)(v8 + 24);
    *(_OWORD *)(v2 + 424) = v10;
    *(_OWORD *)(v2 + 392) = v9;
    *(void *)(v2 + 64) = 0x400000000;
    *(void *)(v2 + 72) = 0;
  }
  else
  {
    uint64_t v3 = a2 + *(unsigned __int16 *)(a2 + 6);
    *(void *)(v2 + 392) = 0x1000000000000;
    __int16 v5 = *(_WORD *)(v3 + 8);
    unint64_t v4 = (_WORD *)(v3 + 8);
    *(_OWORD *)(v2 + 400) = xmmword_263D98850;
    uint64_t v6 = ((unsigned __int16)v4[6] - 16) >> 1;
    *(void *)(v2 + 416) = 0;
    *(void *)(v2 + 424) = v6;
    *(_WORD *)(v2 + 432) = v5;
    *(_WORD *)(v2 + 434) = v4[1];
    *(_WORD *)(v2 + 436) = v4[2];
    *(_WORD *)(v2 + 438) = v4[3];
    *(_DWORD *)(v2 + 64) = 1;
    *(_DWORD *)(v2 + 68) = 5;
    *(void *)(v2 + 72) = v4;
    *(_WORD *)(v2 + 328) = 0;
    uint64_t v7 = *(void *)(result + 40);
    if ((*(unsigned char *)(v7 + 4) & 0x10) != 0)
    {
      *(_WORD *)(v2 + 396) = 16;
      *(_DWORD *)(v2 + 392) = (unsigned __int16)v4[4];
      if ((*(_WORD *)(v7 + 4) & 0x20) != 0) {
        *(_WORD *)(v2 + 396) = 24;
      }
    }
  }
  *(unsigned char *)(v2 + 488) = 56;
  if (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 456) == sub_263D8B990 && *(_DWORD *)(v2 + 392) == 8) {
    *(void *)(v2 + 456) = sub_263D8B9B0;
  }
  return result;
}

uint64_t mdb_cursor_del(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 124);
  if ((v2 & 0x20013) != 0)
  {
    if ((v2 & 0x20000) != 0) {
      return 13;
    }
    else {
      return 4294936514;
    }
  }
  __int16 v5 = (unsigned char *)(a1 + 68);
  if ((*(unsigned char *)(a1 + 68) & 1) == 0) {
    return 22;
  }
  if (*(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) >= (*(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                                - 16) >> 1)
    return 4294936498;
  if ((a2 & 0x8000) != 0 || (uint64_t result = sub_263D8F82C(a1, 0, 0), !result))
  {
    uint64_t result = sub_263D8FB5C(a1);
    if (!result)
    {
      uint64_t v7 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v8 = *(void *)(a1 + 8 * v7 + 72);
      __int16 v9 = *(_WORD *)(v8 + 10);
      if ((v9 & 2) == 0) {
        return 4294936500;
      }
      if ((v9 & 0x20) != 0)
      {
LABEL_33:
        uint64_t v26 = *(unsigned int *)(a1 + 32);
        uint64_t v27 = *(unsigned __int16 *)(a1 + 66);
        unsigned int v28 = *(unsigned __int16 *)(a1 + 2 * v27 + 328);
        uint64_t v29 = *(void *)(a1 + 8 * v27 + 72);
        sub_263D9029C((void *)a1, **(_DWORD **)(a1 + 40));
        --*(void *)(*(void *)(a1 + 40) + 32);
        for (unsigned int i = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * v26); i; unsigned int i = (uint64_t *)*i)
        {
          unint64_t v31 = i;
          if ((*v5 & 4) != 0) {
            unint64_t v31 = (uint64_t *)i[2];
          }
          if (v31 != (uint64_t *)a1)
          {
            int v32 = *((_DWORD *)v31 + 17);
            if ((*((_DWORD *)i + 17) & v32 & 1) != 0
              && *((unsigned __int16 *)v31 + 32) >= *(unsigned __int16 *)(a1 + 64))
            {
              uint64_t v33 = *(unsigned __int16 *)(a1 + 66);
              if (v31[v33 + 9] == v29)
              {
                uint64_t v34 = (uint64_t)v31 + 2 * v33;
                unsigned int v35 = *(unsigned __int16 *)(v34 + 328);
                if (v35 == v28)
                {
                  *((_DWORD *)v31 + 17) = v32 | 8;
                  if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 4) != 0) {
                    *(_DWORD *)(v31[2] + 68) &= 0xFFFFFFFC;
                  }
                }
                else
                {
                  if (v35 > v28) {
                    *(_WORD *)(v34 + 328) = v35 - 1;
                  }
                  uint64_t v36 = v31[2];
                  if (v36)
                  {
                    if (*(unsigned char *)(v36 + 68))
                    {
                      uint64_t v37 = *((unsigned __int16 *)v31 + *(unsigned __int16 *)(a1 + 66) + 164);
                      if (v37 < (*(unsigned __int16 *)(v29 + 12) - 16) >> 1)
                      {
                        uint64_t v38 = v29 + *(unsigned __int16 *)(v29 + 2 * v37 + 16);
                        if ((*(_WORD *)(v38 + 4) & 6) == 4) {
                          *(void *)(v36 + 72) = v38 + *(unsigned __int16 *)(v38 + 6) + 8;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t result = sub_263D94164(a1);
        if (result)
        {
LABEL_53:
          __int16 v5 = (unsigned char *)(*(void *)(a1 + 24) + 124);
LABEL_54:
          int v39 = 2;
LABEL_80:
          *(_DWORD *)v5 |= v39;
          return result;
        }
        if (!*(_WORD *)(a1 + 64))
        {
          uint64_t result = 0;
          goto LABEL_54;
        }
        uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * v26);
        if (!v40)
        {
LABEL_79:
          uint64_t result = 0;
          int v39 = 8;
          goto LABEL_80;
        }
        uint64_t v41 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
        unsigned int v42 = (*(unsigned __int16 *)(v41 + 12) - 16) >> 1;
        while (1)
        {
          uint64_t v43 = v40;
          if ((*v5 & 4) != 0) {
            uint64_t v43 = *(void *)(v40 + 16);
          }
          size_t v44 = (unsigned char *)(v43 + 68);
          if ((*(_DWORD *)(v40 + 68) & *(_DWORD *)(v43 + 68) & 1) == 0) {
            goto LABEL_78;
          }
          if (*(unsigned __int16 *)(v43 + 64) < *(unsigned __int16 *)(a1 + 64)) {
            goto LABEL_78;
          }
          uint64_t v45 = *(unsigned __int16 *)(a1 + 66);
          if (*(void *)(v43 + 8 * v45 + 72) != v41) {
            goto LABEL_78;
          }
          unsigned int v46 = *(unsigned __int16 *)(v43 + 2 * v45 + 328);
          if (v46 < *(unsigned __int16 *)(a1 + 2 * v45 + 328)) {
            goto LABEL_78;
          }
          if (v42 <= v46)
          {
            uint64_t result = sub_263D8F35C(v43, 1);
            if (result == -30798)
            {
              int v50 = 2;
              goto LABEL_77;
            }
            if (result) {
              goto LABEL_53;
            }
          }
          uint64_t v47 = *(void *)(v43 + 16);
          if (!v47 || (*v44 & 2) != 0) {
            goto LABEL_78;
          }
          uint64_t v48 = *(void *)(v43 + 8 * *(unsigned __int16 *)(v43 + 66) + 72)
              + *(unsigned __int16 *)(*(void *)(v43 + 8 * *(unsigned __int16 *)(v43 + 66) + 72)
                                    + 2 * *(unsigned __int16 *)(v43 + 2 * *(unsigned __int16 *)(v43 + 66) + 328)
                                    + 16);
          __int16 v49 = *(_WORD *)(v48 + 4);
          if ((v49 & 4) != 0)
          {
            if (*(unsigned char *)(v47 + 68))
            {
              if ((v49 & 2) == 0) {
                *(void *)(v47 + 72) = v48 + *(unsigned __int16 *)(v48 + 6) + 8;
              }
            }
            else
            {
              sub_263D91BE0(v43, v48);
              uint64_t result = sub_263D8F70C(*(void *)(v43 + 16), 0, 0);
              if (result) {
                goto LABEL_53;
              }
            }
          }
          size_t v44 = (unsigned char *)(*(void *)(v43 + 16) + 68);
          int v50 = 8;
LABEL_77:
          *(_DWORD *)v44 |= v50;
LABEL_78:
          uint64_t v40 = *(void *)v40;
          if (!v40) {
            goto LABEL_79;
          }
        }
      }
      uint64_t v10 = v8 + *(unsigned __int16 *)(v8 + 2 * *(unsigned __int16 *)(a1 + 2 * v7 + 328) + 16);
      int v11 = *(unsigned __int16 *)(v10 + 4);
      if ((v11 & 4) == 0)
      {
        if (((v11 ^ a2) & 2) != 0)
        {
          uint64_t result = 4294936512;
LABEL_83:
          *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
          return result;
        }
        goto LABEL_32;
      }
      if ((a2 & 0x20) != 0)
      {
        uint64_t v12 = *(void *)(a1 + 16);
        *(void *)(*(void *)(a1 + 40) + 32) = *(void *)(*(void *)(a1 + 40) + 32)
                                                 - *(void *)(v12 + 424)
                                                 + 1;
        *(_DWORD *)(v12 + 68) &= ~1u;
        if ((v11 & 2) == 0) {
          goto LABEL_32;
        }
        goto LABEL_29;
      }
      if ((v11 & 2) == 0) {
        *(void *)(*(void *)(a1 + 16) + 72) = v10 + *(unsigned __int16 *)(v10 + 6) + 8;
      }
      uint64_t result = mdb_cursor_del(*(void *)(a1 + 16), 0x8000);
      if (!result)
      {
        uint64_t v12 = *(void *)(a1 + 16);
        if (*(void *)(v12 + 424))
        {
          if ((*(_WORD *)(v10 + 4) & 2) != 0)
          {
            uint64_t v51 = v10 + *(unsigned __int16 *)(v10 + 6);
            long long v53 = *(_OWORD *)(v12 + 408);
            long long v52 = *(_OWORD *)(v12 + 424);
            *(_OWORD *)(v51 + 8) = *(_OWORD *)(v12 + 392);
            *(_OWORD *)(v51 + 24) = v53;
            *(_OWORD *)(v51 + 40) = v52;
LABEL_108:
            uint64_t result = 0;
            --*(void *)(*(void *)(a1 + 40) + 32);
            return result;
          }
          uint64_t v13 = *(unsigned __int16 *)(a1 + 66);
          uint64_t v14 = v8 + 2 * *(unsigned __int16 *)(a1 + 2 * v13 + 328);
          unsigned int v17 = *(unsigned __int16 *)(v14 + 16);
          int v16 = (unsigned __int16 *)(v14 + 16);
          uint64_t v15 = v17;
          uint64_t v18 = (_WORD *)(v8 + v17);
          uint64_t v19 = (unsigned __int16)v18[3];
          uint64_t v20 = (void *)((char *)v18 + v19 + 8);
          int v21 = *(unsigned __int16 *)((char *)v18 + v19 + 20);
          unsigned __int16 v22 = *(_WORD *)((char *)v18 + v19 + 22) - v21;
          __int16 v23 = *v18 - v22;
          if ((*(_WORD *)((char *)v18 + v19 + 18) & 0x20) != 0)
          {
            if (v23)
            {
LABEL_96:
              *(void *)(v12 + 72) = v8 + v15 + v19 + 8;
              for (j = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
                    j;
                    j = (uint64_t *)*j)
              {
                if (j != (uint64_t *)a1
                  && *((unsigned __int16 *)j + 32) >= *(unsigned __int16 *)(a1 + 64)
                  && (*((unsigned char *)j + 68) & 1) != 0
                  && j[v13 + 9] == v8)
                {
                  uint64_t v63 = j[2];
                  if (v63)
                  {
                    if (*(unsigned char *)(v63 + 68))
                    {
                      uint64_t v64 = *((unsigned __int16 *)j + v13 + 164);
                      if (v64 < (*(unsigned __int16 *)(v8 + 12) - 16) >> 1)
                      {
                        uint64_t v65 = v8 + *(unsigned __int16 *)(v8 + 2 * v64 + 16);
                        if ((*(_WORD *)(v65 + 4) & 6) == 4) {
                          *(void *)(v63 + 72) = v65 + *(unsigned __int16 *)(v65 + 6) + 8;
                        }
                      }
                    }
                  }
                }
              }
              goto LABEL_108;
            }
            uint64_t v24 = (unsigned __int16)(*(_WORD *)((char *)v18 + v19 + 22) - v21);
            uint64_t v25 = (unsigned __int16)(*v18 - v22);
          }
          else
          {
            uint64_t v24 = (unsigned __int16)(*(_WORD *)((char *)v18 + v19 + 22) - v21);
            if ((v21 - 16) >= 2)
            {
              unint64_t v54 = ((v21 - 16) >> 1) + 1;
              uint64_t v25 = 16;
              do
              {
                *(_WORD *)((char *)v20 + 2 * (v54 - 2) + v22 + 16) = *((_WORD *)v20
                                                                                   + (v54 - 2)
                                                                                   + 8)
                                                                                 - v22;
                --v54;
              }
              while (v54 > 1);
            }
            else
            {
              uint64_t v25 = 16;
            }
          }
          *(_WORD *)((char *)v18 + v19 + 22) = v21;
          *uint64_t v20 = *(void *)v8;
          _WORD *v18 = v23;
          v18[1] = 0;
          memmove((void *)(v8 + *(unsigned __int16 *)(v8 + 14) + v24), (const void *)(v8 + *(unsigned __int16 *)(v8 + 14)), (size_t)v20 + v25 - v8 - *(unsigned __int16 *)(v8 + 14));
          unsigned int v55 = *(unsigned __int16 *)(v8 + 12) - 16;
          if (v55 >= 2)
          {
            unsigned int v56 = *v16;
            unint64_t v57 = (v55 >> 1) + 1;
            do
            {
              uint64_t v58 = v8 + 2 * (v57 - 2);
              unsigned int v61 = *(unsigned __int16 *)(v58 + 16);
              uint64_t v59 = (_WORD *)(v58 + 16);
              __int16 v60 = v61;
              if (v61 <= v56) {
                *uint64_t v59 = v60 + v22;
              }
              --v57;
            }
            while (v57 > 1);
          }
          *(_WORD *)(v8 + 14) += v22;
          uint64_t v13 = *(unsigned __int16 *)(a1 + 66);
          uint64_t v15 = *(unsigned __int16 *)(v8 + 2 * *(unsigned __int16 *)(a1 + 2 * v13 + 328) + 16);
          uint64_t v19 = *(unsigned __int16 *)(v8 + v15 + 6);
          uint64_t v12 = *(void *)(a1 + 16);
          goto LABEL_96;
        }
        *(_DWORD *)(v12 + 68) &= ~1u;
        LOWORD(v11) = *(_WORD *)(v10 + 4);
        if ((v11 & 2) == 0)
        {
LABEL_32:
          if (v11)
          {
            uint64_t v66 = 0;
            uint64_t result = sub_263D903E0(*(uint64_t **)(a1 + 24), *(void *)(v10 + *(unsigned __int16 *)(v10 + 6) + 8), (unint64_t *)&v66, 0);
            if (result) {
              goto LABEL_83;
            }
            uint64_t result = sub_263D907DC(a1, v66);
            if (result) {
              goto LABEL_83;
            }
          }
          goto LABEL_33;
        }
LABEL_29:
        uint64_t result = sub_263D923E0(v12, 0);
        if (result) {
          goto LABEL_83;
        }
        LOWORD(v11) = *(_WORD *)(v10 + 4);
        goto LABEL_32;
      }
    }
  }
  return result;
}

uint64_t sub_263D923E0(uint64_t a1, int a2)
{
  LODWORD(result) = sub_263D93614(a1, 0, 4);
  if (result)
  {
    if (result == -30798) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = result;
    }
    goto LABEL_61;
  }
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v36 = 0;
  memset(v35, 0, sizeof(v35));
  memset(v34, 0, sizeof(v34));
  int v6 = *(_DWORD *)(a1 + 68);
  if (((v6 & 4) != 0 || !a2 && !*(void *)(*(void *)(a1 + 40) + 24)) && *(_WORD *)(a1 + 64))
  {
    __int16 v7 = *(_WORD *)(a1 + 64) - 1;
    *(_WORD *)(a1 + 64) = v7;
    if (v7) {
      --*(_WORD *)(a1 + 66);
    }
    else {
      *(_DWORD *)(a1 + 68) = v6 & 0xFFFFFFFE;
    }
  }
  sub_263D94E38(a1, (uint64_t)v34);
  if (!*(_WORD *)(a1 + 64)) {
    goto LABEL_58;
  }
  uint64_t v31 = v5;
  int v32 = (unint64_t **)(v5 + 40);
  uint64_t v8 = a1 + 330;
  while (1)
  {
    __int16 v9 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    unsigned int v10 = (unsigned __int16)v9[6] - 16;
    unsigned int v11 = v10 >> 1;
    if ((v9[5] & 2) != 0)
    {
      if (v10 >= 2)
      {
        uint64_t v13 = 0;
        if (v11 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v11;
        }
        do
        {
          uint64_t v14 = (uint64_t)v9 + (unsigned __int16)v9[v13 + 8];
          __int16 v15 = *(_WORD *)(v14 + 4);
          if (v15)
          {
            unint64_t v33 = 0;
            unint64_t v16 = *(void *)(v14 + *(unsigned __int16 *)(v14 + 6) + 8);
            uint64_t result = sub_263D903E0(*(uint64_t **)(a1 + 24), v16, &v33, 0);
            if (result
              || (v17 = v33, uint64_t result = mdb_midl_append_range(v32, v16, *(_DWORD *)(v33 + 12)), result))
            {
LABEL_55:
              uint64_t v5 = v31;
              goto LABEL_60;
            }
            uint64_t v18 = *(void *)(a1 + 40);
            uint64_t v19 = *(void *)(v18 + 24) - *(unsigned int *)(v17 + 12);
            *(void *)(v18 + 24) = v19;
            if (!a2 && !v19)
            {
              uint64_t v5 = v31;
              goto LABEL_47;
            }
          }
          else if (a2)
          {
            if ((v15 & 2) != 0)
            {
              sub_263D91BE0(a1, v14);
              uint64_t result = sub_263D923E0(*(void *)(a1 + 16), 0);
              if (result) {
                goto LABEL_55;
              }
            }
          }
          ++v13;
        }
        while (v12 != v13);
        uint64_t v5 = v31;
        if (a2) {
          goto LABEL_42;
        }
LABEL_35:
        if (!*(void *)(*(void *)(a1 + 40) + 24)) {
          goto LABEL_47;
        }
        goto LABEL_42;
      }
      LOWORD(v12) = 0;
      if (!a2) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t result = mdb_midl_need((_DWORD **)v32, v10 >> 1);
      if (result) {
        goto LABEL_60;
      }
      if (v10 >= 2)
      {
        uint64_t v20 = *v32;
        uint64_t v21 = v11 <= 1 ? 1 : v11;
        LOWORD(v12) = v21;
        unsigned __int16 v22 = v9 + 8;
        do
        {
          unsigned int v23 = *v22++;
          unint64_t v24 = *(unsigned int *)((char *)v9 + v23) | ((unint64_t)*(unsigned __int16 *)((char *)v9 + v23 + 4) << 32);
          uint64_t v25 = *v20 + 1;
          *uint64_t v20 = v25;
          v20[v25] = v24;
          --v21;
        }
        while (v21);
      }
      else
      {
        LOWORD(v12) = 0;
      }
    }
LABEL_42:
    if (!*(_WORD *)(a1 + 66)) {
      goto LABEL_58;
    }
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v12;
    uint64_t result = sub_263D8F35C(a1, 1);
    if (result != -30798)
    {
      if (result) {
        goto LABEL_59;
      }
      int v26 = *(unsigned __int16 *)(a1 + 64);
      goto LABEL_53;
    }
LABEL_47:
    __int16 v27 = *(_WORD *)(a1 + 64);
    if (!v27) {
      goto LABEL_57;
    }
    unsigned __int16 v28 = v27 - 1;
    *(_WORD *)(a1 + 64) = v27 - 1;
    if (v27 == 1) {
      break;
    }
    --*(_WORD *)(a1 + 66);
    *(_WORD *)(a1 + 328) = 0;
    int v26 = (unsigned __int16)(v27 - 1);
    if (v28 != 1)
    {
      uint64_t v29 = 0;
      uint64_t v30 = v28 - 1;
      do
      {
        *(_WORD *)(v8 + 2 * v29) = 0;
        *(void *)(v8 + 8 * v29 - 250) = *((void *)v35 + v29);
        ++v29;
      }
      while (v30 != v29);
      int v26 = 1;
    }
LABEL_53:
    if (!v26) {
      goto LABEL_58;
    }
  }
  *(_DWORD *)(a1 + 68) &= ~1u;
LABEL_57:
  *(_WORD *)(a1 + 328) = 0;
LABEL_58:
  uint64_t result = mdb_midl_append((unint64_t **)(v5 + 40), *(void *)(*(void *)(a1 + 40) + 40));
LABEL_59:
  if (result) {
LABEL_60:
  }
    *(_DWORD *)(v5 + 124) |= 2u;
LABEL_61:
  *(_DWORD *)(a1 + 68) &= ~1u;
  return result;
}

uint64_t mdb_cursor_open(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t result = 22;
  if (a1 && a3 && *(_DWORD *)(a1 + 120) > a2 && (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 8) != 0)
  {
    int v7 = *(_DWORD *)(a1 + 124);
    if ((v7 & 0x13) != 0)
    {
      return 4294936514;
    }
    else if (v7 & 0x20000 | a2)
    {
      if ((*(_WORD *)(*(void *)(a1 + 88) + 48 * a2 + 4) & 4) != 0) {
        size_t v8 = 888;
      }
      else {
        size_t v8 = 392;
      }
      __int16 v9 = malloc_type_malloc(v8, 0xB36E93DDuLL);
      if (v9)
      {
        unsigned int v10 = v9;
        sub_263D8D2EC((uint64_t)v9, (void *)a1, a2, (uint64_t)(v9 + 98));
        uint64_t v11 = *(void *)(a1 + 104);
        if (v11)
        {
          *(void *)unsigned int v10 = *(void *)(v11 + 8 * a2);
          *(void *)(v11 + 8 * a2) = v10;
          v10[17] |= 0x40u;
        }
        uint64_t result = 0;
        *a3 = v10;
      }
      else
      {
        return 12;
      }
    }
  }
  return result;
}

uint64_t mdb_cursor_renew(uint64_t a1, uint64_t a2)
{
  uint64_t result = 22;
  if (a1 && a2)
  {
    uint64_t v4 = *(unsigned int *)(a2 + 32);
    if (v4 >= *(_DWORD *)(a1 + 120)
      || (*(unsigned char *)(*(void *)(a1 + 112) + v4) & 8) == 0
      || (*(unsigned char *)(a2 + 68) & 0x40) != 0
      || *(void *)(a1 + 104))
    {
      return 22;
    }
    else if ((*(unsigned char *)(a1 + 124) & 0x13) != 0)
    {
      return 4294936514;
    }
    else
    {
      sub_263D8D2EC(a2, (void *)a1, v4, *(void *)(a2 + 16));
      return 0;
    }
  }
  return result;
}

uint64_t mdb_cursor_count(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = 22;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (!v3) {
      return 4294936512;
    }
    if ((*(unsigned char *)(*(void *)(a1 + 24) + 124) & 0x13) != 0) {
      return 4294936514;
    }
    int v4 = *(_DWORD *)(a1 + 68);
    if ((v4 & 1) == 0) {
      return 22;
    }
    if (*(_WORD *)(a1 + 64))
    {
      uint64_t v5 = *(unsigned __int16 *)(a1 + 66);
      if ((v4 & 2) == 0)
      {
        uint64_t v6 = *(void *)(a1 + 8 * v5 + 72);
        unsigned int v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
        goto LABEL_14;
      }
      unsigned int v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
      uint64_t v6 = *(void *)(a1 + 8 * v5 + 72);
      if (v7 < (*(unsigned __int16 *)(v6 + 12) - 16) >> 1)
      {
        *(_DWORD *)(a1 + 68) = v4 ^ 2;
LABEL_14:
        if ((*(_WORD *)(v6 + *(unsigned __int16 *)(v6 + 2 * v7 + 16) + 4) & 4) != 0)
        {
          if ((*(unsigned char *)(v3 + 68) & 1) == 0) {
            return 22;
          }
          uint64_t v8 = *(void *)(v3 + 424);
        }
        else
        {
          uint64_t v8 = 1;
        }
        uint64_t v2 = 0;
        *a2 = v8;
        return v2;
      }
    }
    return 4294936498;
  }
  return v2;
}

void mdb_cursor_close(void *a1)
{
  if (a1 && !*((void *)a1 + 1))
  {
    if ((*((unsigned char *)a1 + 68) & 0x40) != 0)
    {
      uint64_t v1 = *(void *)(*((void *)a1 + 3) + 104);
      if (v1)
      {
        uint64_t v2 = (void *)(v1 + 8 * *((unsigned int *)a1 + 8));
        do
        {
          uint64_t v3 = v2;
          uint64_t v2 = (void *)*v2;
          if (v2) {
            BOOL v4 = v2 == a1;
          }
          else {
            BOOL v4 = 1;
          }
        }
        while (!v4);
        if (v2 == a1) {
          *uint64_t v3 = *(void *)a1;
        }
      }
    }
    free(a1);
  }
}

uint64_t mdb_cursor_txn(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t mdb_cursor_dbi(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t mdb_del(uint64_t a1, unsigned int a2, void *a3, long long *a4)
{
  uint64_t v4 = 22;
  if (!a1 || !a3) {
    return v4;
  }
  if (*(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  int v6 = *(_DWORD *)(a1 + 124);
  if ((v6 & 0x20013) != 0)
  {
    if ((v6 & 0x20000) != 0) {
      return 13;
    }
    else {
      return 4294936514;
    }
  }
  if ((*(_WORD *)(*(void *)(a1 + 88) + 48 * a2 + 4) & 4) == 0) {
    a4 = 0;
  }
  return sub_263D92A84((void *)a1, a2, a3, a4, 0);
}

uint64_t sub_263D92A84(void *a1, unsigned int a2, void *a3, long long *a4, int a5)
{
  uint64_t v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, sizeof(v16));
  long long v15 = 0uLL;
  int v14 = 0;
  sub_263D8D2EC((uint64_t)v17, a1, a2, (uint64_t)v16);
  if (a4)
  {
    long long v15 = *a4;
    unsigned int v10 = &v15;
    int v11 = 2;
  }
  else
  {
    unsigned int v10 = 0;
    a5 |= 0x20u;
    int v11 = 15;
  }
  uint64_t result = sub_263D8E6F4((uint64_t)v17, a3, v10, v11, &v14);
  if (!result)
  {
    DWORD1(v18) |= 0x40u;
    uint64_t v13 = a1[13];
    v17[0] = *(void *)(v13 + 8 * a2);
    *(void *)(v13 + 8 * a2) = v17;
    uint64_t result = mdb_cursor_del((uint64_t)v17, a5);
    *(void *)(a1[13] + 8 * a2) = v17[0];
  }
  return result;
}

uint64_t mdb_put(uint64_t a1, unsigned int a2, size_t *a3, uint64_t a4, int a5)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          uint64_t v15 = 0;
          memset(v14, 0, sizeof(v14));
          memset(v13, 0, sizeof(v13));
          if ((a5 & 0xFFF8FFCF) == 0 && (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
          {
            int v10 = *(_DWORD *)(a1 + 124);
            if ((v10 & 0x20013) != 0)
            {
              if ((v10 & 0x20000) != 0) {
                return 13;
              }
              else {
                return 4294936514;
              }
            }
            else
            {
              uint64_t v11 = a2;
              sub_263D8D2EC((uint64_t)v14, (void *)a1, a2, (uint64_t)v13);
              uint64_t v12 = *(void *)(a1 + 104);
              *(void *)&v14[0] = *(void *)(v12 + 8 * v11);
              *(void *)(v12 + 8 * v11) = v14;
              uint64_t result = mdb_cursor_put((uint64_t)v14, a3, a4, a5);
              *(void *)(*(void *)(a1 + 104) + 8 * v11) = *(void *)&v14[0];
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdb_dbi_open(uint64_t a1, char *__s, int a3, unsigned int *a4)
{
  if ((a3 & 0xFFFBFF81) != 0) {
    return 22;
  }
  if ((*(unsigned char *)(a1 + 124) & 0x13) != 0) {
    return 4294936514;
  }
  uint64_t v69 = 0;
  memset(v68, 0, sizeof(v68));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  if (!__s)
  {
    *a4 = 1;
    if ((a3 & 0x7FFF) != 0)
    {
      uint64_t v18 = *(void *)(a1 + 88);
      int v19 = *(unsigned __int16 *)(v18 + 52);
      int v20 = a3 & 0x7FFF | v19;
      if (v20 != v19)
      {
        *(_WORD *)(v18 + 52) = v20;
        *(_DWORD *)(a1 + 124) |= 4u;
      }
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 88);
    }
    sub_263D93164(*(void *)(a1 + 80), v18, 1u);
    return 0;
  }
  uint64_t v10 = *(void *)(a1 + 80);
  if (!*(void *)(v10 + 64)) {
    sub_263D93164(v10, *(void *)(a1 + 88), 1u);
  }
  uint64_t v70 = 0;
  unint64_t v71 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  size_t v11 = strlen(__s);
  uint64_t v12 = *(unsigned int *)(a1 + 120);
  if (v12 < 3) {
    goto LABEL_20;
  }
  unsigned int v13 = 0;
  int v14 = (const char **)(*(void *)(a1 + 80) + 104);
  for (uint64_t i = 2; i != v12; ++i)
  {
    uint64_t v16 = (uint64_t)*(v14 - 1);
    if (v16)
    {
      if (v11 == v16 && !strncmp(__s, *v14, v11))
      {
        uint64_t v4 = 0;
        *a4 = i;
        return v4;
      }
    }
    else if (!v13)
    {
      unsigned int v13 = i;
    }
    v14 += 6;
  }
  if (v13)
  {
    int v17 = 0;
  }
  else
  {
LABEL_20:
    if (v12 >= *(_DWORD *)(*(void *)(a1 + 32) + 36)) {
      return 4294936505;
    }
    unsigned int v13 = 0;
    int v17 = 1;
  }
  if ((*(_WORD *)(*(void *)(a1 + 88) + 52) & 0xC) == 0)
  {
    int v60 = 0;
    v72[0] = v11;
    v72[1] = (size_t)__s;
    sub_263D8D2EC((uint64_t)&v64, (void *)a1, 1u, 0);
    uint64_t v21 = sub_263D8E6F4((uint64_t)&v64, v72, &v70, 15, &v60);
    if (v21 == -30798)
    {
      if ((a3 & 0x40000) == 0) {
        return 4294936498;
      }
      if ((*(unsigned char *)(a1 + 126) & 2) != 0) {
        return 13;
      }
      long long v30 = strdup(__s);
      if (v30)
      {
        long long v23 = v30;
        uint64_t v70 = 48;
        unint64_t v71 = &v61;
        long long v61 = 0u;
        long long v62 = 0u;
        *(void *)&long long v63 = 0;
        *((void *)&v63 + 1) = -1;
        WORD2(v61) = a3 & 0x7FFF;
        uint64_t v59 = 0;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v31 = *(void *)(*((void *)&v65 + 1) + 104);
        uint64_t v32 = v66;
        long long v33 = &v64;
        if ((BYTE4(v68[0]) & 4) != 0)
        {
          DWORD1(v39) = 1;
          *(void *)&long long v36 = &v64;
          long long v33 = &v35;
        }
        *(void *)long long v33 = *(void *)(v31 + 8 * v66);
        *(void *)(v31 + 8 * v32) = v33;
        uint64_t v34 = mdb_cursor_put((uint64_t)&v64, v72, (uint64_t)&v70, 2);
        *(void *)(v31 + 8 * v32) = *(void *)v33;
        if (v34)
        {
          uint64_t v4 = v34;
          free(v23);
          return v4;
        }
        char v24 = 29;
        if (!v17)
        {
LABEL_39:
          long long v25 = (size_t *)(*(void *)(a1 + 80) + 48 * v13);
          *long long v25 = v11;
          v25[1] = (size_t)v23;
          v25[4] = 0;
          *(unsigned char *)(*(void *)(a1 + 112) + v13) = v24;
          uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 152);
          LODWORD(v25) = *(_DWORD *)(v26 + 4 * v13) + 1;
          *(_DWORD *)(v26 + 4 * v13) = v25;
          *(_DWORD *)(*(void *)(a1 + 96) + 4 * v13) = v25;
          long long v27 = (_OWORD *)(*(void *)(a1 + 88) + 48 * v13);
          long long v28 = *v71;
          long long v29 = v71[2];
          v27[1] = v71[1];
          v27[2] = v29;
          *long long v27 = v28;
          *a4 = v13;
          sub_263D93164(*(void *)(a1 + 80), *(void *)(a1 + 88), v13);
          if (v17)
          {
            uint64_t v4 = 0;
            ++*(_DWORD *)(a1 + 120);
            return v4;
          }
          return 0;
        }
LABEL_38:
        unsigned int v13 = *(_DWORD *)(a1 + 120);
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v4 = v21;
      if (v21) {
        return v4;
      }
      if ((*(_WORD *)(*((void *)v68 + WORD1(v68[0]) + 1)
                     + *(unsigned __int16 *)(*((void *)v68 + WORD1(v68[0]) + 1)
                                           + 2 * *((unsigned __int16 *)&v68[16] + WORD1(v68[0]) + 4)
                                           + 16)
                     + 4) & 6) != 2)
        return 4294936512;
      long long v22 = strdup(__s);
      if (v22)
      {
        long long v23 = v22;
        char v24 = 28;
        if (!v17) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
    }
    return 12;
  }
  if ((a3 & 0x40000) != 0) {
    return 4294936512;
  }
  else {
    return 4294936498;
  }
}

uint64_t sub_263D93164(uint64_t result, uint64_t a2, unsigned int a3)
{
  __int16 v3 = *(_WORD *)(a2 + 48 * a3 + 4);
  uint64_t v4 = sub_263D8B9B0;
  if ((v3 & 8) == 0) {
    uint64_t v4 = sub_263D954BC;
  }
  if ((v3 & 2) != 0) {
    uint64_t v4 = sub_263D9546C;
  }
  *(void *)(result + 48 * a3 + 16) = v4;
  if ((v3 & 4) != 0)
  {
    if ((v3 & 0x20) != 0)
    {
      BOOL v6 = (v3 & 0x10) == 0;
      uint64_t v5 = sub_263D8B990;
      unsigned int v7 = sub_263D8B9B0;
    }
    else
    {
      BOOL v6 = (v3 & 0x40) == 0;
      uint64_t v5 = sub_263D9546C;
      unsigned int v7 = sub_263D954BC;
    }
    if (v6) {
      uint64_t v5 = v7;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  *(void *)(result + 48 * a3 + 24) = v5;
  return result;
}

void mdb_dbi_close(uint64_t a1, unsigned int a2)
{
  if (a2 >= 2 && *(_DWORD *)(a1 + 36) > a2)
  {
    uint64_t v2 = *(void *)(a1 + 136);
    __int16 v3 = *(void **)(v2 + 48 * a2 + 8);
    if (v3)
    {
      uint64_t v4 = (void *)(v2 + 48 * a2);
      *uint64_t v4 = 0;
      v4[1] = 0;
      uint64_t v5 = *(void *)(a1 + 152);
      *(_WORD *)(*(void *)(a1 + 144) + 2 * a2) = 0;
      ++*(_DWORD *)(v5 + 4 * a2);
      free(v3);
    }
  }
}

uint64_t mdb_dbi_flags(uint64_t a1, unsigned int a2, int *a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *a3 = *(_WORD *)(*(void *)(a1 + 88) + 48 * a2 + 4) & 0x7FFF;
  return result;
}

uint64_t mdb_drop(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = 22;
  if (a1)
  {
    if (a3 <= 1 && *(_DWORD *)(a1 + 120) > a2)
    {
      uint64_t v12 = 0;
      if ((*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
      {
        if ((*(unsigned char *)(a1 + 126) & 2) != 0)
        {
          return 13;
        }
        else if (*(_DWORD *)(*(void *)(a1 + 96) + 4 * a2) == *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 152) {
                                                                            + 4 * a2))
        }
        {
          uint64_t v3 = mdb_cursor_open(a1, a2, &v12);
          if (!v3)
          {
            uint64_t v7 = sub_263D923E0((uint64_t)v12, *(_WORD *)(v12[5] + 4) & 4);
            uint64_t v3 = v7;
            for (uint64_t i = *(uint64_t **)(*(void *)(a1 + 104) + 8 * a2); i; uint64_t i = (uint64_t *)*i)
              *((_DWORD *)i + 17) &= 0xFFFFFFFC;
            if (v7) {
              goto LABEL_20;
            }
            if (a2 >= 2 && a3)
            {
              uint64_t v3 = sub_263D92A84((void *)a1, 1u, (void *)v12[6], 0, 2);
              if (!v3)
              {
                *(unsigned char *)(*(void *)(a1 + 112) + a2) = 2;
                mdb_dbi_close(*(void *)(a1 + 32), a2);
                goto LABEL_20;
              }
              int v9 = *(_DWORD *)(a1 + 124) | 2;
            }
            else
            {
              uint64_t v3 = 0;
              *(unsigned char *)(*(void *)(a1 + 112) + a2) |= 1u;
              uint64_t v10 = *(void *)(a1 + 88) + 48 * a2;
              *(_WORD *)(v10 + 38) = 0;
              *(_OWORD *)(v10 + 22) = 0u;
              *(_OWORD *)(v10 + 6) = 0u;
              *(void *)(v10 + 40) = -1;
              int v9 = *(_DWORD *)(a1 + 124) | 4;
            }
            *(_DWORD *)(a1 + 124) = v9;
LABEL_20:
            mdb_cursor_close(v12);
          }
        }
        else
        {
          return 4294936516;
        }
      }
    }
  }
  return v3;
}

uint64_t mdb_set_compare(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 16) = a3;
  return result;
}

uint64_t mdb_set_dupsort(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 24) = a3;
  return result;
}

uint64_t mdb_set_relfunc(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 32) = a3;
  return result;
}

uint64_t mdb_set_relctx(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 40) = a3;
  return result;
}

uint64_t sub_263D93574(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = a3;
  uint64_t v10 = a3;
  long long v11 = xmmword_263D98870;
  for (int i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10); i; int i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10))
  {
    uint64_t result = *__error();
    if (result != 4) {
      return result;
    }
    uint64_t v10 = v5;
    long long v11 = xmmword_263D98870;
  }
  int v9 = a2 == 7 && WORD6(v11) != 2;
  return (v9 << 31 >> 31);
}

uint64_t sub_263D93614(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if ((*(unsigned char *)(v4 + 124) & 0x13) != 0) {
    return 4294936514;
  }
  if ((**(unsigned char **)(a1 + 56) & 2) == 0) {
    goto LABEL_5;
  }
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  if (*(_DWORD *)(*(void *)(v4 + 96) + 4 * *(unsigned int *)(a1 + 32)) != *(_DWORD *)(*(void *)(*(void *)(v4 + 32) + 152)
                                                                                         + 4
                                                                                         * *(unsigned int *)(a1 + 32)))
    return 4294936516;
  sub_263D8D2EC(v17, v4, 1, 0);
  uint64_t result = sub_263D93614(v17, *(void *)(a1 + 48), 0);
  if (!result)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    int v14 = 0;
    uint64_t v10 = sub_263D93800((uint64_t)v17, *(void **)(a1 + 48), &v14);
    if (!v14) {
      return 4294936498;
    }
    if ((*((_WORD *)v10 + 2) & 6) != 2) {
      return 4294936512;
    }
    uint64_t result = sub_263D8EF48((uint64_t)v17, (unsigned int *)v10, &v15);
    if (result) {
      return result;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if ((*(_WORD *)(v11 + 4) & 0x7FFF) != *((_WORD *)v16 + 2)) {
      return 4294936512;
    }
    long long v12 = *v16;
    long long v13 = v16[2];
    *(_OWORD *)(v11 + 16) = v16[1];
    *(_OWORD *)(v11 + 32) = v13;
    *(_OWORD *)uint64_t v11 = v12;
    **(unsigned char **)(a1 + 56) &= ~2u;
LABEL_5:
    unint64_t v8 = *(void *)(*(void *)(a1 + 40) + 40);
    if (v8 != -1)
    {
      int v9 = *(void **)(a1 + 72);
      if (v9 && *v9 == v8
        || (uint64_t result = sub_263D903E0(*(uint64_t **)(a1 + 24), v8, (unint64_t *)(a1 + 72), 0), !result))
      {
        *(_DWORD *)(a1 + 64) = 1;
        if ((a3 & 1) == 0 || (uint64_t result = sub_263D93A44(a1), !result))
        {
          if ((a3 & 2) != 0) {
            return 0;
          }
          else {
            return sub_263D93D1C(a1, a2, a3);
          }
        }
      }
      return result;
    }
    return 4294936498;
  }
  return result;
}

char *sub_263D93800(uint64_t a1, void *a2, int *a3)
{
  uint64_t v5 = *(unsigned __int16 **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  unsigned int v6 = v5[6] - 16;
  unsigned int v7 = v6 >> 1;
  unsigned int v8 = v5[5];
  unsigned int v9 = ((v8 >> 1) & 1) == 0;
  int v10 = (v6 >> 1) - 1;
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t))(*(void *)(a1 + 48) + 16);
  if (v11 == sub_263D8B9B0)
  {
    if (v8)
    {
      if (*(unsigned __int16 *)((char *)v5 + v5[9] + 6) == 8) {
        uint64_t v11 = (uint64_t (*)(void *, uint64_t))sub_263D8E5B4;
      }
      else {
        uint64_t v11 = (uint64_t (*)(void *, uint64_t))sub_263D8B990;
      }
      if ((v8 & 0x20) == 0) {
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t v11 = sub_263D8B9B0;
      if ((v8 & 0x20) == 0) {
        goto LABEL_3;
      }
    }
  }
  else if ((v8 & 0x20) == 0)
  {
LABEL_3:
    if (v9 < v7)
    {
      int v19 = v5[6] - 16;
      long long v12 = a3;
      while (1)
      {
        LODWORD(v13) = (int)(v9 + v10) >> 1;
        int v14 = (char *)v5 + v5[v13 + 8];
        uint64_t v20 = *((unsigned __int16 *)v14 + 3);
        uint64_t v21 = (uint64_t)(v14 + 8);
        int v15 = v11(a2, (uint64_t)&v20);
        if (!v15) {
          break;
        }
        if (v15 <= 0) {
          int v10 = v13 - 1;
        }
        else {
          unsigned int v9 = v13 + 1;
        }
        if ((int)v9 > v10)
        {
          a3 = v12;
          goto LABEL_27;
        }
      }
      int v16 = 1;
      a3 = v12;
LABEL_43:
      unsigned int v6 = v19;
      if (!a3) {
        goto LABEL_36;
      }
LABEL_33:
      if (v6 <= 1) {
        int v16 = 0;
      }
      *a3 = v16;
      goto LABEL_36;
    }
    LODWORD(v13) = 0;
    int v14 = 0;
LABEL_32:
    int v16 = 1;
    if (!a3) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  uint64_t v20 = **(unsigned int **)(a1 + 40);
  int v14 = (char *)v5 + v5[8];
  if (v9 >= v7)
  {
    LODWORD(v13) = 0;
    goto LABEL_32;
  }
  int v19 = v6;
  uint64_t v18 = a3;
  do
  {
    uint64_t v13 = ((int)(v9 + v10) >> 1);
    uint64_t v21 = (uint64_t)v5 + v20 * v13 + 16;
    int v15 = v11(a2, (uint64_t)&v20);
    if (!v15)
    {
      int v16 = 1;
      a3 = v18;
      goto LABEL_43;
    }
    if (v15 <= 0) {
      int v10 = v13 - 1;
    }
    else {
      unsigned int v9 = v13 + 1;
    }
  }
  while ((int)v9 <= v10);
  a3 = v18;
LABEL_27:
  unsigned int v6 = v19;
  if (v15 < 1 || (LODWORD(v13) = v13 + 1, (v5[5] & 0x20) != 0))
  {
    int v16 = 0;
    if (a3) {
      goto LABEL_33;
    }
  }
  else
  {
    int v16 = 0;
    int v14 = (char *)v5 + v5[v13 + 8];
    if (a3) {
      goto LABEL_33;
    }
  }
LABEL_36:
  *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v13;
  if (v13 >= v7) {
    return 0;
  }
  else {
    return v14;
  }
}

uint64_t sub_263D93A44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  __dst = 0;
  uint64_t v3 = *(void *)(a1 + 24);
  __int16 v4 = *(_WORD *)(v2 + 10);
  if ((v4 & 0x10) == 0)
  {
    if ((*(unsigned char *)(v3 + 124) & 8) != 0)
    {
      uint64_t result = sub_263D9054C(*(void *)(a1 + 24), v2, (char **)&__dst);
      if (result) {
        goto LABEL_15;
      }
      unsigned int v7 = (char *)__dst;
      if (__dst)
      {
LABEL_20:
        uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 8 * v18 + 72) = v7;
        int v19 = *(uint64_t **)(*(void *)(v3 + 104) + 8 * *(unsigned int *)(a1 + 32));
        if ((*(unsigned char *)(a1 + 68) & 4) != 0)
        {
          if (v19)
          {
            unsigned int v27 = *(unsigned __int16 *)(a1 + 64);
            do
            {
              uint64_t v28 = v19[2];
              if (*(unsigned __int16 *)(v28 + 64) >= v27)
              {
                uint64_t v29 = v28 + 8 * v18;
                uint64_t v31 = *(void *)(v29 + 72);
                long long v30 = (char **)(v29 + 72);
                if (v31 == v2) {
                  *long long v30 = v7;
                }
              }
              int v19 = (uint64_t *)*v19;
            }
            while (v19);
          }
        }
        else if (v19)
        {
          unsigned int v20 = *(unsigned __int16 *)(a1 + 64);
          do
          {
            if (v19 != (uint64_t *)a1 && *((unsigned __int16 *)v19 + 32) >= v20)
            {
              uint64_t v21 = &v19[v18];
              uint64_t v23 = v21[9];
              long long v22 = (char **)(v21 + 9);
              if (v23 == v2)
              {
                *long long v22 = v7;
                if ((*((_WORD *)v7 + 5) & 2) != 0)
                {
                  uint64_t v24 = v19[2];
                  if (v24)
                  {
                    if (*(unsigned char *)(v24 + 68))
                    {
                      uint64_t v25 = *((unsigned __int16 *)v19 + v18 + 164);
                      if (v25 < (*((unsigned __int16 *)v7 + 6) - 16) >> 1)
                      {
                        uint64_t v26 = &v7[*(unsigned __int16 *)&v7[2 * v25 + 16]];
                        if ((*((_WORD *)v26 + 2) & 6) == 4) {
                          *(void *)(v24 + 72) = &v26[*((unsigned __int16 *)v26 + 3) + 8];
                        }
                      }
                    }
                  }
                }
              }
            }
            int v19 = (uint64_t *)*v19;
          }
          while (v19);
        }
        return 0;
      }
    }
    uint64_t v5 = (uint64_t **)(v3 + 40);
    uint64_t result = mdb_midl_need((_DWORD **)(v3 + 40), 1);
    if (!result)
    {
      uint64_t result = sub_263D8FE24(a1, 1, (char **)&__dst);
      if (!result)
      {
        unsigned int v7 = (char *)__dst;
        unint64_t v8 = *(void *)__dst;
        unsigned int v9 = *v5;
        uint64_t v10 = **v5 + 1;
        *unsigned int v9 = v10;
        v9[v10] = *(void *)v2;
        if (*(_WORD *)(a1 + 66))
        {
          unsigned int v11 = *(unsigned __int16 *)(a1 + 66) - 1;
          uint64_t v12 = *(void *)(a1 + 8 * v11 + 72);
          uint64_t v13 = v12 + *(unsigned __int16 *)(v12 + 2 * *(unsigned __int16 *)(a1 + 2 * v11 + 328) + 16);
          *(_DWORD *)uint64_t v13 = v8;
          *(_WORD *)(v13 + 4) = WORD2(v8);
        }
        else
        {
          *(void *)(*(void *)(a1 + 40) + 40) = v8;
        }
        goto LABEL_18;
      }
    }
LABEL_15:
    *(_DWORD *)(v3 + 124) |= 2u;
    return result;
  }
  uint64_t result = 0;
  if ((v4 & 0x40) == 0 && *(void *)v3)
  {
    int v14 = *(unint64_t **)(v3 + 72);
    unint64_t v8 = *(void *)v2;
    unint64_t v15 = *v14;
    if (*v14)
    {
      unsigned int v16 = mdb_mid2l_search(*(unsigned int **)(v3 + 72), *(void *)v2);
      if (v15 >= v16 && v14[2 * v16] == v8)
      {
        if (v2 != v14[2 * v16 + 1])
        {
          *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
          *(_DWORD *)(v3 + 124) |= 2u;
          return 4294936500;
        }
        return 0;
      }
    }
    int v17 = sub_263D9072C(v3, 1u);
    if (v17)
    {
      unsigned int v7 = v17;
      v32[0] = v8;
      v32[1] = (unint64_t)v17;
      mdb_mid2l_insert(v14, v32);
LABEL_18:
      sub_263D93EFC(v7, (_WORD *)v2, *(_DWORD *)(*(void *)(v3 + 32) + 16));
      *(void *)unsigned int v7 = v8;
      *((_WORD *)v7 + 5) |= 0x10u;
      goto LABEL_20;
    }
    return 12;
  }
  return result;
}

uint64_t sub_263D93D1C(uint64_t a1, void *a2, char a3)
{
  unint64_t v4 = *(unsigned __int16 *)(a1 + 66);
  unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
  unint64_t v14 = v5;
  __int16 v6 = *(_WORD *)(v5 + 10);
  if (v6)
  {
    int v9 = a3 & 0xC;
    do
    {
      if (v9)
      {
        if ((a3 & 8) != 0)
        {
          unsigned int v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
          if ((*(unsigned char *)(a1 + 68) & 1) != 0
            && *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v4 + 328) == (unsigned __int16)v10)
          {
            unint64_t v4 = *(unsigned __int16 *)(a1 + 64);
            *(_WORD *)(a1 + 64) = v4 + 1;
            *(_WORD *)(a1 + 66) = v4;
            unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
            unint64_t v14 = v5;
            if (a3) {
              goto LABEL_16;
            }
            goto LABEL_18;
          }
        }
        else
        {
          LOWORD(v10) = 0;
        }
      }
      else
      {
        int v13 = 0;
        if (sub_263D93800(a1, a2, &v13)) {
          LOWORD(v10) = *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) - (v13 == 0);
        }
        else {
          unsigned int v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
        }
      }
      unsigned int v11 = (unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 2 * (unsigned __int16)v10 + 16));
      uint64_t result = sub_263D903E0(*(uint64_t **)(a1 + 24), *v11 | ((unint64_t)*((unsigned __int16 *)v11 + 2) << 32), &v14, 0);
      if (result) {
        return result;
      }
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v10;
      unint64_t v4 = *(unsigned __int16 *)(a1 + 64);
      if (v4 > 0x1F)
      {
        *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
        return 4294936509;
      }
      unint64_t v5 = v14;
      *(_WORD *)(a1 + 64) = v4 + 1;
      *(_WORD *)(a1 + 66) = v4;
      *(void *)(a1 + 8 * v4 + 72) = v5;
      *(_WORD *)(a1 + 2 * v4 + 328) = 0;
      if (a3)
      {
LABEL_16:
        uint64_t result = sub_263D93A44(a1);
        if (result) {
          return result;
        }
        unint64_t v4 = *(unsigned __int16 *)(a1 + 66);
        unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
        unint64_t v14 = v5;
      }
LABEL_18:
      __int16 v6 = *(_WORD *)(v5 + 10);
    }
    while ((v6 & 1) != 0);
  }
  if ((v6 & 2) != 0)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    return 4294936500;
  }
  return result;
}

void *sub_263D93EFC(char *__dst, _WORD *__src, int a3)
{
  unint64_t v4 = __src;
  unint64_t v5 = __dst;
  unsigned __int16 v6 = __src[7];
  int v7 = (unsigned __int16)__src[6];
  if (((v6 - (_WORD)v7) & 0xFFF8) == 0 || (__src[5] & 0x20) != 0)
  {
    size_t v9 = a3 - ((v6 - (_WORD)v7) & 0xFFF8u);
  }
  else
  {
    uint64_t v8 = v6 & 0xFFF8;
    memcpy(__dst, __src, (v7 + 7) & 0x1FFF8);
    __dst = &v5[v8];
    __src = (_WORD *)((char *)v4 + v8);
    size_t v9 = (a3 - v8);
  }

  return memcpy(__dst, __src, v9);
}

uint64_t sub_263D93F8C(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  uint64_t result = getpid();
  if (v2 == result) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return result;
}

uint64_t sub_263D93FC0(uint64_t *a1, int a2, int a3)
{
  uint64_t v5 = a1[3];
  unint64_t v24 = 0;
  int v23 = 0;
  int v6 = *(_DWORD *)(v5 + 120);
  if ((*((unsigned char *)a1 + 68) & 0x40) != 0) {
    int v7 = 0;
  }
  else {
    int v7 = a1;
  }
  uint64_t v8 = *(unsigned int *)(v5 + 120);
  if (!v7) {
    goto LABEL_22;
  }
  do
  {
LABEL_5:
    if (*((unsigned char *)v7 + 68))
    {
      size_t v9 = v7;
      do
      {
        unsigned __int16 v10 = *((_WORD *)v9 + 32);
        if (v10)
        {
          for (unint64_t i = 0; i < v10; ++i)
          {
            uint64_t v12 = v9[i + 9];
            __int16 v13 = *(_WORD *)(v12 + 10);
            if ((v13 & 0xC050) == a2)
            {
              *(_WORD *)(v12 + 10) = v13 ^ 0x8000;
              unsigned __int16 v10 = *((_WORD *)v9 + 32);
            }
          }
          unsigned int v14 = i - 1;
        }
        else
        {
          uint64_t v12 = 0;
          unsigned int v14 = -1;
        }
        uint64_t v15 = v9[2];
        if (!v15) {
          break;
        }
        if (!v12) {
          break;
        }
        if ((*(_DWORD *)(v15 + 68) & 1) == 0) {
          break;
        }
        if ((*(_WORD *)(v12 + 10) & 2) == 0) {
          break;
        }
        __int16 v16 = *(_WORD *)(v12 + *(unsigned __int16 *)(v12 + 2 * *((unsigned __int16 *)v9 + v14 + 164) + 16) + 4);
        size_t v9 = (uint64_t *)v9[2];
      }
      while ((v16 & 2) != 0);
    }
    int v7 = (uint64_t *)*v7;
  }
  while (v7);
LABEL_22:
  while (v8)
  {
    --v8;
    int v7 = *(uint64_t **)(*(void *)(v5 + 104) + 8 * v8);
    if (v7) {
      goto LABEL_5;
    }
  }
  uint64_t result = 0;
  if (a3 && v6)
  {
    unint64_t v18 = 0;
    uint64_t v19 = 40;
    do
    {
      if (*(unsigned char *)(*(void *)(v5 + 112) + v18))
      {
        unint64_t v20 = *(void *)(*(void *)(v5 + 88) + v19);
        if (v20 != -1)
        {
          uint64_t result = sub_263D903E0((uint64_t *)a1[3], v20, &v24, &v23);
          if (result) {
            return result;
          }
          __int16 v21 = *(_WORD *)(v24 + 10);
          if ((v21 & 0xC050) == a2 && v23 <= 1) {
            *(_WORD *)(v24 + 10) = v21 ^ 0x8000;
          }
        }
      }
      ++v18;
      v19 += 48;
    }
    while (v18 < *(unsigned int *)(v5 + 120));
    return 0;
  }
  return result;
}

uint64_t sub_263D94164(uint64_t a1)
{
  uint64_t v122 = 0;
  memset(v121, 0, sizeof(v121));
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  int v2 = (unint64_t *)(a1 + 72);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  unint64_t v4 = *(_WORD **)(a1 + 72 + 8 * v3);
  if (v4[5]) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 1;
  }
  if (v4[5]) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = 250;
  }
  uint64_t v7 = *(void *)(a1 + 24);
  unint64_t v8 = (*(_DWORD *)(*(void *)(v7 + 32) + 16) - 16);
  __int16 v9 = v4[7];
  int v10 = (unsigned __int16)v4[6];
  if (1000 * (unint64_t)(v8 - (unsigned __int16)(v9 - v10)) / v8 >= v6
    && v5 <= (v10 - 16) >> 1)
  {
    return 0;
  }
  if (*(unsigned __int16 *)(a1 + 64) > 1u)
  {
    unsigned int v20 = v3 - 1;
    sub_263D94E38(a1, (uint64_t)&v117);
    int v21 = *(unsigned __int16 *)(a1 + 328 + 2 * v3);
    int v22 = *(unsigned __int16 *)(a1 + 328 + 2 * v20);
    *(void *)&long long v118 = 0;
    int v23 = (unsigned __int16 *)&v121[16] + v20 + 4;
    unsigned __int16 v24 = *v23;
    uint64_t v25 = (void *)(a1 + 8 * v20 + 72);
    if (v22)
    {
      unsigned __int16 v26 = v24 - 1;
      *int v23 = v26;
      unsigned int v27 = (unsigned int *)(*v25 + *(unsigned __int16 *)(*v25 + 2 * v26 + 16));
      uint64_t v15 = sub_263D903E0((uint64_t *)v7, *v27 | ((unint64_t)*((unsigned __int16 *)v27 + 2) << 32), (unint64_t *)v121 + WORD1(v121[0]) + 1, 0);
      if (v15) {
        return v15;
      }
      uint64_t v28 = WORD1(v121[0]);
      uint64_t v29 = *((void *)v121 + WORD1(v121[0]) + 1);
      unsigned int v30 = (*(unsigned __int16 *)(v29 + 12) + 131056) >> 1;
      *((_WORD *)&v121[16] + WORD1(v121[0]) + 4) = v30 - 1;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    }
    else
    {
      unsigned __int16 v31 = v24 + 1;
      *int v23 = v31;
      uint64_t v32 = (unsigned int *)(*v25 + *(unsigned __int16 *)(*v25 + 2 * v31 + 16));
      uint64_t v15 = sub_263D903E0((uint64_t *)v7, *v32 | ((unint64_t)*((unsigned __int16 *)v32 + 2) << 32), (unint64_t *)v121 + WORD1(v121[0]) + 1, 0);
      if (v15) {
        return v15;
      }
      uint64_t v28 = WORD1(v121[0]);
      *((_WORD *)&v121[16] + WORD1(v121[0]) + 4) = 0;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = (*(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                   + 131056) >> 1;
      uint64_t v29 = *((void *)v121 + v28 + 1);
      LOWORD(v30) = 1;
    }
    unint64_t v33 = (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 32) + 16) - 16);
    __int16 v34 = *(_WORD *)(v29 + 14);
    int v35 = *(unsigned __int16 *)(v29 + 12);
    if (1000 * (unint64_t)(v33 - (unsigned __int16)(v34 - v35)) / v33 < v6
      || v5 >= (v35 - 16) >> 1)
    {
      if (v22)
      {
        long long v46 = &v117;
        *((_WORD *)&v121[16] + v28 + 4) = v30 + *(_WORD *)(a1 + 2 * v28 + 328);
        uint64_t v172 = 0;
        long long v171 = 0u;
        long long v170 = 0u;
        v21 += (v35 + 131056) >> 1;
        long long v169 = 0u;
        long long v168 = 0u;
        long long v167 = 0u;
        long long v166 = 0u;
        long long v165 = 0u;
        long long v164 = 0u;
        long long v163 = 0u;
        long long v161 = 0u;
        long long v162 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        long long v148 = 0u;
        uint64_t v47 = *(void *)(*((void *)&v118 + 1) + 104);
        uint64_t v48 = v119;
        if ((BYTE4(v121[0]) & 4) != 0)
        {
          DWORD1(v152) = 1;
          *(void *)&long long v149 = &v117;
          long long v46 = &v148;
        }
        *(void *)long long v46 = *(void *)(v47 + 8 * v119);
        *(void *)(v47 + 8 * v48) = v46;
        uint64_t v15 = sub_263D94EA0(a1, (uint64_t)&v117);
        *(void *)(v47 + 8 * v48) = *(void *)v46;
        sub_263D94E38((uint64_t)&v117, a1);
      }
      else
      {
        uint64_t v15 = sub_263D94EA0((uint64_t)&v117, a1);
      }
      *(_DWORD *)(a1 + 68) &= ~2u;
      goto LABEL_119;
    }
    unint64_t v175 = 0;
    long long v176 = 0;
    uint64_t v172 = 0;
    long long v171 = 0u;
    long long v170 = 0u;
    long long v169 = 0u;
    long long v168 = 0u;
    long long v167 = 0u;
    long long v166 = 0u;
    long long v165 = 0u;
    long long v164 = 0u;
    long long v163 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v148 = 0u;
    uint64_t v15 = sub_263D93A44((uint64_t)&v117);
    if (v15) {
      goto LABEL_117;
    }
    uint64_t v15 = sub_263D93A44(a1);
    if (v15) {
      goto LABEL_117;
    }
    uint64_t v36 = *((void *)v121 + WORD1(v121[0]) + 1);
    __int16 v37 = *(_WORD *)(v36 + 10);
    if ((v37 & 0x20) != 0)
    {
      size_t v57 = 0;
      LODWORD(v40) = 0;
      unint64_t v58 = v36
          + *((unsigned __int16 *)&v121[16] + WORD1(v121[0]) + 4)
          * (unint64_t)**((_DWORD **)&v119 + 1)
          + 16;
      unint64_t v175 = **((_DWORD **)&v119 + 1);
      long long v176 = (unsigned int *)v58;
      size_t v173 = 0;
      uint64_t v174 = 0;
    }
    else
    {
      long long v38 = (unsigned int *)(v36
                           + *(unsigned __int16 *)(v36 + 2 * *((unsigned __int16 *)&v121[16] + WORD1(v121[0]) + 4) + 16));
      uint64_t v39 = *v38;
      uint64_t v40 = *((unsigned __int16 *)v38 + 2);
      if ((v37 & 1) == 0 || *((_WORD *)&v121[16] + WORD1(v121[0]) + 4))
      {
        int64_t v59 = *((unsigned __int16 *)v38 + 3);
        unint64_t v175 = v59;
        long long v176 = v38 + 2;
      }
      else
      {
        __int16 v41 = v121[0];
        uint64_t v15 = sub_263D95394((uint64_t)&v117);
        if (v15) {
          goto LABEL_117;
        }
        uint64_t v42 = *((void *)v121 + WORD1(v121[0]) + 1);
        if ((*(_WORD *)(v42 + 10) & 0x20) != 0)
        {
          unint64_t v44 = **((_DWORD **)&v119 + 1);
          long long v45 = (unsigned int *)(v42 + 16);
        }
        else
        {
          uint64_t v43 = v42 + *(unsigned __int16 *)(v42 + 16);
          unint64_t v44 = *(unsigned __int16 *)(v43 + 6);
          long long v45 = (unsigned int *)(v43 + 8);
        }
        unint64_t v175 = v44;
        long long v176 = v45;
        LOWORD(v121[0]) = v41;
        WORD1(v121[0]) = v41 - 1;
        int64_t v59 = *((unsigned __int16 *)v38 + 3);
      }
      size_t v57 = v39 | (v40 << 32);
      size_t v173 = *v38;
      uint64_t v174 = (uint64_t)v38 + v59 + 8;
    }
    *(void *)&long long v149 = 0;
    uint64_t v60 = *(unsigned __int16 *)(a1 + 66);
    if ((*(_WORD *)(*(void *)(a1 + 8 * v60 + 72) + 10) & 1) != 0 && !*(_WORD *)(a1 + 2 * v60 + 328))
    {
      int v78 = *(unsigned __int16 *)(a1 + 64);
      long long v123 = 0uLL;
      sub_263D94E38(a1, (uint64_t)&v148);
      uint64_t v79 = sub_263D95394((uint64_t)&v148);
      if (v79)
      {
        uint64_t v15 = v79;
        goto LABEL_117;
      }
      uint64_t v105 = *((void *)&v152 + WORD1(v152) + 1);
      if ((*(_WORD *)(v105 + 10) & 0x20) != 0)
      {
        uint64_t v107 = **((_DWORD **)&v150 + 1);
        uint64_t v108 = v105 + 16;
      }
      else
      {
        uint64_t v106 = v105 + *(unsigned __int16 *)(v105 + 16);
        uint64_t v107 = *(unsigned __int16 *)(v106 + 6);
        uint64_t v108 = v106 + 8;
      }
      *(void *)&long long v123 = v107;
      *((void *)&v123 + 1) = v108;
      LOWORD(v152) = v78;
      WORD1(v152) = v78 - 1;
      *((_WORD *)&v168 + (v78 - 1) + 4) = 0;
      uint64_t v15 = sub_263D8FCBC((uint64_t)&v148, (const void **)&v123);
      if (v15)
      {
LABEL_117:
        if (v22) {
          LOWORD(v21) = v21 + 1;
        }
LABEL_119:
        *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v21;
        return v15;
      }
      uint64_t v60 = *(unsigned __int16 *)(a1 + 66);
    }
    uint64_t v15 = sub_263D91934(a1, *(unsigned __int16 *)(a1 + 2 * v60 + 328), (const void **)&v175, &v173, v57, v40);
    if (!v15)
    {
      sub_263D9029C(&v117, v175);
      uint64_t v61 = *((void *)v121 + WORD1(v121[0]) + 1);
      if (v22)
      {
        long long v62 = *(long long **)(*(void *)(*((void *)&v118 + 1) + 104) + 8 * v119);
        if (v62)
        {
          uint64_t v63 = *(void *)(a1 + 8 * WORD1(v121[0]) + 72);
          char v64 = BYTE4(v121[0]);
          do
          {
            long long v65 = v62;
            if ((v64 & 4) != 0) {
              long long v65 = (long long *)*((void *)v62 + 2);
            }
            if ((*((unsigned char *)v65 + 68) & 1) != 0 && *((unsigned __int16 *)v65 + 33) >= WORD1(v121[0]))
            {
              if (v65 != (long long *)a1 && *((void *)v65 + WORD1(v121[0]) + 9) == v63)
              {
                long long v66 = (char *)v65 + 2 * WORD1(v121[0]);
                unsigned int v67 = *((unsigned __int16 *)v66 + 164);
                if (v67 >= *(unsigned __int16 *)(a1 + 2 * WORD1(v121[0]) + 328)) {
                  *((_WORD *)v66 + 164) = v67 + 1;
                }
              }
              if (v65 != &v117)
              {
                uint64_t v68 = (void *)v65 + WORD1(v121[0]);
                uint64_t v70 = v68[9];
                uint64_t v69 = v68 + 9;
                if (v70 == v61)
                {
                  unint64_t v71 = (char *)v65 + 2 * WORD1(v121[0]);
                  if (*((unsigned __int16 *)v71 + 164) == *((unsigned __int16 *)&v121[16] + WORD1(v121[0]) + 4))
                  {
                    __int16 v72 = v71 + 328;
                    uint64_t v73 = *(unsigned __int16 *)(a1 + 66);
                    void *v69 = *(void *)(a1 + 8 * v73 + 72);
                    *__int16 v72 = *(_WORD *)(a1 + 2 * v73 + 328);
                    ++*((_WORD *)v65 + WORD1(v121[0]) + 163);
                  }
                }
              }
              if ((*(_WORD *)(v61 + 10) & 2) != 0)
              {
                uint64_t v74 = *((void *)v65 + 2);
                if (v74)
                {
                  if (*(unsigned char *)(v74 + 68))
                  {
                    uint64_t v75 = *((void *)v65 + WORD1(v121[0]) + 9);
                    uint64_t v76 = *((unsigned __int16 *)v65 + WORD1(v121[0]) + 164);
                    if (v76 < (*(unsigned __int16 *)(v75 + 12) - 16) >> 1)
                    {
                      uint64_t v77 = v75 + *(unsigned __int16 *)(v75 + 2 * v76 + 16);
                      if ((*(_WORD *)(v77 + 4) & 6) == 4) {
                        *(void *)(v74 + 72) = v77 + *(unsigned __int16 *)(v77 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
            long long v62 = *(long long **)v62;
          }
          while (v62);
        }
      }
      else
      {
        int v80 = *(long long **)(*(void *)(*((void *)&v118 + 1) + 104) + 8 * v119);
        if (v80)
        {
          char v81 = BYTE4(v121[0]);
          do
          {
            uint64_t v82 = v80;
            if ((v81 & 4) != 0) {
              uint64_t v82 = (long long *)*((void *)v80 + 2);
            }
            if (v82 != &v117
              && (*((unsigned char *)v82 + 68) & 1) != 0
              && *((unsigned __int16 *)v82 + 33) >= WORD1(v121[0]))
            {
              unint64_t v83 = (void *)v82 + WORD1(v121[0]);
              uint64_t v85 = v83[9];
              uint64_t v84 = v83 + 9;
              if (v85 == v61)
              {
                uint64_t v86 = (__int16 *)v82 + WORD1(v121[0]) + 164;
                __int16 v87 = *v86;
                if (!*v86)
                {
                  uint64_t v88 = *(unsigned __int16 *)(a1 + 66);
                  void *v84 = *(void *)(a1 + 8 * v88 + 72);
                  *uint64_t v86 = *(_WORD *)(a1 + 2 * v88 + 328);
                  uint64_t v86 = (__int16 *)v82 + WORD1(v121[0]) + 163;
                  __int16 v87 = *v86;
                }
                *uint64_t v86 = v87 - 1;
                if ((*(_WORD *)(v61 + 10) & 2) != 0)
                {
                  uint64_t v89 = *((void *)v82 + 2);
                  if (v89)
                  {
                    if (*(unsigned char *)(v89 + 68))
                    {
                      uint64_t v90 = *((void *)v82 + WORD1(v121[0]) + 9);
                      uint64_t v91 = *((unsigned __int16 *)v82 + WORD1(v121[0]) + 164);
                      if (v91 < (*(unsigned __int16 *)(v90 + 12) - 16) >> 1)
                      {
                        uint64_t v92 = v90 + *(unsigned __int16 *)(v90 + 2 * v91 + 16);
                        if ((*(_WORD *)(v92 + 4) & 6) == 4) {
                          *(void *)(v89 + 72) = v92 + *(unsigned __int16 *)(v92 + 6) + 8;
                        }
                      }
                    }
                  }
                }
              }
            }
            int v80 = *(long long **)v80;
          }
          while (v80);
        }
      }
      uint64_t v93 = WORD1(v121[0]);
      uint64_t v94 = (char *)&v117 + 2 * WORD1(v121[0]);
      if (!*((_WORD *)v94 + 164))
      {
        if (*((_WORD *)v94 + 163))
        {
          uint64_t v98 = *((void *)v121 + WORD1(v121[0]) + 1);
          if ((*(_WORD *)(v98 + 10) & 0x20) != 0)
          {
            size_t v100 = (unsigned int *)(v98 + 16);
          }
          else
          {
            uint64_t v99 = v98 + *(unsigned __int16 *)(v98 + 16);
            unint64_t v175 = *(unsigned __int16 *)(v99 + 6);
            size_t v100 = (unsigned int *)(v99 + 8);
          }
          long long v176 = v100;
          size_t v109 = &v148;
          sub_263D94E38((uint64_t)&v117, (uint64_t)&v148);
          LOWORD(v152) = v152 - 1;
          --WORD1(v152);
          uint64_t v147 = 0;
          long long v145 = 0u;
          long long v146 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          uint64_t v110 = *(void *)(*((void *)&v149 + 1) + 104);
          uint64_t v111 = v150;
          if ((BYTE4(v152) & 4) != 0)
          {
            DWORD1(v127) = 1;
            *(void *)&long long v124 = &v148;
            size_t v109 = &v123;
          }
          *(void *)size_t v109 = *(void *)(v110 + 8 * v150);
          *(void *)(v110 + 8 * v111) = v109;
          uint64_t v15 = sub_263D8FCBC((uint64_t)&v148, (const void **)&v175);
          *(void *)(v110 + 8 * v111) = *(void *)v109;
          if (v15) {
            goto LABEL_117;
          }
          uint64_t v93 = WORD1(v121[0]);
        }
        if (*(_WORD *)(*((void *)v121 + v93 + 1) + 10))
        {
          __int16 v112 = *((_WORD *)&v121[16] + v93 + 4);
          long long v123 = 0uLL;
          *((_WORD *)&v121[16] + v93 + 4) = 0;
          sub_263D8FCBC((uint64_t)&v117, (const void **)&v123);
          LODWORD(v93) = WORD1(v121[0]);
          *((_WORD *)&v121[16] + WORD1(v121[0]) + 4) = v112;
        }
      }
      uint64_t v95 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v96 = a1 + 2 * v95;
      if (*(_WORD *)(v96 + 328)) {
        goto LABEL_116;
      }
      if (*(_WORD *)(v96 + 326))
      {
        __int16 v101 = *(_WORD *)(*((void *)v121 + v93 + 1) + 10);
        uint64_t v102 = *(void *)(a1 + 8 * v95 + 72);
        if ((v101 & 0x20) != 0)
        {
          unsigned int v104 = (unsigned int *)(v102 + 16);
        }
        else
        {
          uint64_t v103 = v102 + *(unsigned __int16 *)(v102 + 16);
          unint64_t v175 = *(unsigned __int16 *)(v103 + 6);
          unsigned int v104 = (unsigned int *)(v103 + 8);
        }
        long long v176 = v104;
        int v113 = &v148;
        sub_263D94E38(a1, (uint64_t)&v148);
        LOWORD(v152) = v152 - 1;
        --WORD1(v152);
        uint64_t v147 = 0;
        long long v145 = 0u;
        long long v146 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        uint64_t v114 = *(void *)(*((void *)&v149 + 1) + 104);
        uint64_t v115 = v150;
        if ((BYTE4(v152) & 4) != 0)
        {
          DWORD1(v127) = 1;
          *(void *)&long long v124 = &v148;
          int v113 = &v123;
        }
        *(void *)int v113 = *(void *)(v114 + 8 * v150);
        *(void *)(v114 + 8 * v115) = v113;
        uint64_t v15 = sub_263D8FCBC((uint64_t)&v148, (const void **)&v175);
        *(void *)(v114 + 8 * v115) = *(void *)v113;
        if (v15) {
          goto LABEL_117;
        }
        uint64_t v95 = *(unsigned __int16 *)(a1 + 66);
      }
      if ((*(_WORD *)(*(void *)(a1 + 8 * v95 + 72) + 10) & 1) == 0)
      {
LABEL_116:
        uint64_t v15 = 0;
      }
      else
      {
        __int16 v116 = *(_WORD *)(a1 + 328 + 2 * v95);
        long long v123 = 0uLL;
        *(_WORD *)(a1 + 328 + 2 * v95) = 0;
        sub_263D8FCBC(a1, (const void **)&v123);
        uint64_t v15 = 0;
        *(_WORD *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)) = v116;
      }
    }
    goto LABEL_117;
  }
  unint64_t v11 = *v2;
  __int16 v12 = *(_WORD *)(*v2 + 10);
  if ((v12 & 0x40) != 0) {
    return 0;
  }
  unsigned int v13 = *(unsigned __int16 *)(v11 + 12) - 16;
  if (v13 <= 1)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(void *)(v14 + 40) = -1;
    *(_WORD *)(v14 + 6) = 0;
    *(void *)(v14 + 16) = 0;
    uint64_t v15 = mdb_midl_append((unint64_t **)(v7 + 40), *(void *)v11);
    if (v15) {
      return v15;
    }
    unsigned int v16 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v16;
    int v17 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (v17)
    {
      do
      {
        unint64_t v18 = v17;
        if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
          unint64_t v18 = (void *)v17[2];
        }
        int v19 = *((_DWORD *)v18 + 17);
        if ((v19 & 1) != 0
          && *((unsigned __int16 *)v18 + 32) >= *(unsigned __int16 *)(a1 + 64)
          && v18[9] == v11)
        {
          *((_DWORD *)v18 + 16) = 0;
          *((_DWORD *)v18 + 17) = v19 & 0xFFFFFFFE;
        }
        uint64_t v15 = 0;
        int v17 = (void *)*v17;
      }
      while (v17);
      return v15;
    }
    return 0;
  }
  uint64_t v15 = 0;
  if ((v12 & 1) == 0) {
    return v15;
  }
  if ((v13 & 0xFFFFFFFE) != 2) {
    return v15;
  }
  uint64_t v15 = mdb_midl_append((unint64_t **)(v7 + 40), *(void *)v11);
  if (v15) {
    return v15;
  }
  unint64_t v49 = *(unsigned int *)(v11 + *(unsigned __int16 *)(v11 + 16)) | ((unint64_t)*(unsigned __int16 *)(v11 + *(unsigned __int16 *)(v11 + 16) + 4) << 32);
  *(void *)(*(void *)(a1 + 40) + 40) = v49;
  uint64_t v15 = sub_263D903E0(*(uint64_t **)(a1 + 24), v49, v2, 0);
  if (v15) {
    return v15;
  }
  uint64_t v50 = *(void *)(a1 + 40);
  --*(_WORD *)(v50 + 6);
  --*(void *)(v50 + 8);
  *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
  if (*(unsigned __int16 *)(v50 + 6) >= 2u)
  {
    uint64_t v51 = 0;
    do
    {
      *(void *)(a1 + 8 * v51 + 80) = *(void *)(a1 + 8 * v51 + 88);
      *(_WORD *)(a1 + 2 * v51 + 330) = *(_WORD *)(a1 + 2 * v51 + 332);
      unint64_t v52 = v51 + 2;
      ++v51;
    }
    while (v52 < *(unsigned __int16 *)(v50 + 6));
  }
  long long v53 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
  if (!v53) {
    return 0;
  }
  int v54 = *(_DWORD *)(a1 + 68);
  do
  {
    long long v55 = v53;
    if ((v54 & 4) != 0) {
      long long v55 = (void *)v53[2];
    }
    if (v55 != (void *)a1 && (*((unsigned char *)v55 + 68) & 1) != 0 && v55[9] == v11)
    {
      if (*(_WORD *)(v50 + 6))
      {
        unint64_t v56 = 0;
        do
        {
          v55[v56 + 9] = v55[v56 + 10];
          *((_WORD *)v55 + v56 + 164) = *((_WORD *)v55 + v56 + 165);
          uint64_t v50 = *(void *)(a1 + 40);
          ++v56;
        }
        while (v56 < *(unsigned __int16 *)(v50 + 6));
      }
      --*((_WORD *)v55 + 32);
      --*((_WORD *)v55 + 33);
    }
    uint64_t v15 = 0;
    long long v53 = (void *)*v53;
  }
  while (v53);
  return v15;
}

uint64_t sub_263D94E38(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(result + 24);
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(result + 32);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(result + 40);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(result + 64);
  *(_DWORD *)(a2 + 68) = *(_DWORD *)(result + 68);
  if (*(_WORD *)(result + 64))
  {
    unint64_t v2 = 0;
    uint64_t v3 = a2 + 328;
    uint64_t v4 = result + 328;
    do
    {
      __int16 v5 = *(_WORD *)(v4 + 2 * v2);
      *(void *)(v3 + 8 * v2 - 256) = *(void *)(v4 + 8 * v2 - 256);
      *(_WORD *)(v3 + 2 * v2++) = v5;
    }
    while (v2 < *(unsigned __int16 *)(result + 64));
  }
  return result;
}

uint64_t sub_263D94EA0(uint64_t a1, uint64_t a2)
{
  size_t v57 = 0;
  uint64_t v58 = 0;
  uint64_t v4 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t result = sub_263D93A44(a2);
  if (result) {
    return result;
  }
  unint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v6 = *(void *)(a2 + 8 * *(unsigned __int16 *)(a2 + 66) + 72);
  unsigned int v7 = *(unsigned __int16 *)(v6 + 12) + 131056;
  if ((*(unsigned char *)(v4 + 10) & 0x20) == 0)
  {
    if ((*(_WORD *)(v4 + 12) & 0xFFFE) != 0x10)
    {
      unsigned __int16 v8 = 0;
      unsigned int v9 = v7 >> 1;
      do
      {
        int v10 = (unsigned int *)(v4 + *(unsigned __int16 *)(v4 + 2 * v8 + 16));
        if (!v8 && (*(_WORD *)(v4 + 10) & 1) != 0)
        {
          uint64_t v56 = 0;
          memset(v55, 0, sizeof(v55));
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          sub_263D94E38(a1, (uint64_t)&v51);
          *(void *)&long long v52 = 0;
          uint64_t result = sub_263D95394((uint64_t)&v51);
          if (result) {
            return result;
          }
          uint64_t v12 = *((void *)v55 + WORD1(v55[0]) + 1);
          if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
          {
            unint64_t v14 = **((_DWORD **)&v53 + 1);
            uint64_t v15 = (unsigned int *)(v12 + 16);
          }
          else
          {
            uint64_t v13 = v12 + *(unsigned __int16 *)(v12 + 16);
            unint64_t v14 = *(unsigned __int16 *)(v13 + 6);
            uint64_t v15 = (unsigned int *)(v13 + 8);
          }
          unint64_t v59 = v14;
          uint64_t v60 = v15;
          int64_t v11 = *((unsigned __int16 *)v10 + 3);
        }
        else
        {
          int64_t v11 = *((unsigned __int16 *)v10 + 3);
          unint64_t v59 = v11;
          uint64_t v60 = v10 + 2;
        }
        size_t v57 = *v10;
        uint64_t v58 = (uint64_t)v10 + v11 + 8;
        uint64_t result = sub_263D91934(a2, (unsigned __int16)v9, (const void **)&v59, &v57, v57 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), *((unsigned __int16 *)v10 + 2));
        if (result) {
          return result;
        }
        ++v8;
        LOWORD(v9) = v9 + 1;
      }
      while ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 > v8);
    }
LABEL_21:
    --*(_WORD *)(a1 + 66);
    sub_263D9029C((void *)a1, 0);
    uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
    if (!*(_WORD *)(a1 + 2 * v18 + 328))
    {
      unint64_t v59 = 0;
      uint64_t result = sub_263D8FCBC(a1, (const void **)&v59);
      LOWORD(v18) = *(_WORD *)(a1 + 66);
      if (result)
      {
        *(_WORD *)(a1 + 66) = v18 + 1;
        return result;
      }
    }
    uint64_t v19 = v6;
    unsigned int v20 = v7;
    unsigned __int16 v21 = v18 + 1;
    *(_WORD *)(a1 + 66) = v21;
    uint64_t v22 = *(void *)(a1 + 8 * v21 + 72);
    unint64_t v23 = *(void *)v22;
    uint64_t v24 = *(void *)(a1 + 24);
    __int16 v25 = *(_WORD *)(v22 + 10);
    if ((v25 & 0x10) != 0)
    {
      unsigned int v26 = *(_DWORD *)(a1 + 32);
      if (v26)
      {
        if (!*(void *)v24)
        {
LABEL_34:
          *(void *)(v22 + 32) = *(void *)(v24 + 48);
          *(void *)(v24 + 48) = v22;
          ++*(_DWORD *)(v24 + 56);
          LOBYTE(v30) = v25;
          *(_WORD *)(v22 + 10) = v25 | 0x4000;
LABEL_35:
          BOOL v31 = (v30 & 2) == 0;
          uint64_t v32 = 16;
          if (v31) {
            uint64_t v32 = 8;
          }
          --*(void *)(*(void *)(a1 + 40) + v32);
          unint64_t v33 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * v26);
          if (v33)
          {
            uint64_t v34 = *(unsigned __int16 *)(a1 + 66);
            int v35 = *(_DWORD *)(a1 + 68);
            uint64_t v36 = (v34 - 1);
            do
            {
              __int16 v37 = v33;
              if ((v35 & 4) != 0) {
                __int16 v37 = (void *)v33[2];
              }
              if (v37 != (void *)a1
                && *((unsigned __int16 *)v37 + 32) >= *(unsigned __int16 *)(a1 + 64))
              {
                long long v38 = &v37[v34];
                uint64_t v41 = v38[9];
                uint64_t v40 = v38 + 9;
                uint64_t v39 = v41;
                if (v41 == v22)
                {
                  void *v40 = v19;
                  *((_WORD *)v37 + v34 + 164) += v20 >> 1;
                  *((_WORD *)v37 + v36 + 164) = *(_WORD *)(a2 + 2 * v36 + 328);
                  uint64_t v39 = v19;
                }
                else if (v37[v36 + 9] == *(void *)(a1 + 8 * v36 + 72))
                {
                  uint64_t v42 = (char *)v37 + 2 * v36;
                  unsigned int v43 = *((unsigned __int16 *)v42 + 164);
                  if (v43 > *(unsigned __int16 *)(a1 + 2 * v36 + 328)) {
                    *((_WORD *)v42 + 164) = v43 - 1;
                  }
                }
                if ((*(_WORD *)(v22 + 10) & 2) != 0)
                {
                  uint64_t v44 = v37[2];
                  if (v44)
                  {
                    if (*(unsigned char *)(v44 + 68))
                    {
                      uint64_t v45 = *((unsigned __int16 *)v37 + v34 + 164);
                      if (v45 < (*(unsigned __int16 *)(v39 + 12) - 16) >> 1)
                      {
                        uint64_t v46 = v39 + *(unsigned __int16 *)(v39 + 2 * v45 + 16);
                        if ((*(_WORD *)(v46 + 4) & 6) == 4) {
                          *(void *)(v44 + 72) = v46 + *(unsigned __int16 *)(v46 + 6) + 8;
                        }
                      }
                    }
                  }
                }
              }
              unint64_t v33 = (void *)*v33;
            }
            while (v33);
          }
          __int16 v47 = *(_WORD *)(a2 + 64);
          __int16 v48 = *(_WORD *)(*(void *)(a2 + 40) + 6);
          if (v47)
          {
            *(_WORD *)(a2 + 64) = v47 - 1;
            if (v47 == 1) {
              *(_DWORD *)(a2 + 68) &= ~1u;
            }
            else {
              --*(_WORD *)(a2 + 66);
            }
          }
          uint64_t result = sub_263D94164(a2);
          __int16 v49 = *(_WORD *)(*(void *)(a2 + 40) + 6) - v48 + v47;
          *(_WORD *)(a2 + 64) = v49;
          *(_WORD *)(a2 + 66) = v49 - 1;
          return result;
        }
        unsigned int v27 = *(unsigned int **)(v24 + 72);
        unint64_t v28 = *(void *)v27;
        if (*(void *)v27)
        {
          uint64_t v50 = *(void *)(v24 + 72);
          unsigned int v29 = mdb_mid2l_search(v27, *(void *)v22);
          if (v28 >= v29 && *(void *)(v50 + 16 * v29) == v23)
          {
            if (*(void *)(v50 + 16 * v29 + 8) != v22)
            {
              *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
              *(_DWORD *)(v24 + 124) |= 2u;
              return 4294936500;
            }
            goto LABEL_34;
          }
        }
      }
    }
    uint64_t result = mdb_midl_append((unint64_t **)(v24 + 40), v23);
    if (result) {
      return result;
    }
    __int16 v30 = *(_WORD *)(v22 + 10);
    unsigned int v26 = *(_DWORD *)(a1 + 32);
    goto LABEL_35;
  }
  unint64_t v59 = **(unsigned int **)(a1 + 40);
  uint64_t v60 = (unsigned int *)(v4 + 16);
  if ((*(_WORD *)(v4 + 12) & 0xFFFE) == 0x10) {
    goto LABEL_21;
  }
  int v16 = 0;
  unsigned int v17 = v7 >> 1;
  while (1)
  {
    uint64_t result = sub_263D91934(a2, (unsigned __int16)v17, (const void **)&v59, 0, 0, 0);
    if (result) {
      return result;
    }
    uint64_t v60 = (unsigned int *)((char *)v60 + v59);
    ++v16;
    LOWORD(v17) = v17 + 1;
    if ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 <= (unsigned __int16)v16) {
      goto LABEL_21;
    }
  }
}

uint64_t sub_263D95394(uint64_t a1)
{
  unint64_t v5 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t result = sub_263D903E0(*(uint64_t **)(a1 + 24), *(unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 16)) | ((unint64_t)*(unsigned __int16 *)(v5 + *(unsigned __int16 *)(v5 + 16) + 4) << 32), &v5, 0);
  if (!result)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    uint64_t v3 = *(unsigned __int16 *)(a1 + 64);
    if (v3 >= 0x20)
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
      return 4294936509;
    }
    else
    {
      unint64_t v4 = v5;
      *(_WORD *)(a1 + 64) = v3 + 1;
      *(_WORD *)(a1 + 66) = v3;
      *(void *)(a1 + 8 * v3 + 72) = v4;
      *(_WORD *)(a1 + 2 * v3 + 328) = 0;
      return sub_263D93D1C(a1, 0, 4);
    }
  }
  return result;
}

uint64_t sub_263D9546C(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = v2 + *a1;
  uint64_t v4 = *a1 - *a2;
  unint64_t v5 = v2 + (v4 & ~(v4 >> 63));
  if (v4 >= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = *a1 - *a2;
  }
  unsigned int v7 = (unsigned __int8 *)(*a2 + a2[1] - 1);
  while (v3 > v5)
  {
    int v9 = *(unsigned __int8 *)--v3;
    int v8 = v9;
    int v10 = *v7--;
    uint64_t result = (v8 - v10);
    if (v8 != v10) {
      return result;
    }
  }
  if (v6 < 0) {
    return -1;
  }
  else {
    return v6;
  }
}

uint64_t sub_263D954BC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = (const void *)a1[1];
  uint64_t v5 = *a2;
  uint64_t v4 = (const void *)a2[1];
  int v7 = v3 - v5;
  BOOL v6 = v3 <= v5;
  if (v3 < v5) {
    int v7 = -1;
  }
  if (v3 > v5) {
    LODWORD(v3) = v5;
  }
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 1;
  }
  LODWORD(result) = memcmp(v2, v4, v3);
  if (result) {
    return result;
  }
  else {
    return v8;
  }
}

uint64_t mdb_midl_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2 = *a1;
  if (!*a1) {
    return 1;
  }
  int v3 = 0;
  do
  {
    unsigned int v4 = v2 >> 1;
    uint64_t v5 = v3 + (v2 >> 1) + 1;
    unint64_t v6 = *(void *)&a1[2 * v5];
    if (v6 >= a2)
    {
      if (v6 <= a2) {
        return v5;
      }
      unsigned int v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    unsigned int v2 = v4;
  }
  while (v4);
  if (v6 <= a2) {
    return v5;
  }
  else {
    return (v5 + 1);
  }
}

void *mdb_midl_alloc(int a1)
{
  unsigned int v2 = malloc_type_malloc(8 * (a1 + 2), 0x100004000313F17uLL);
  if (!v2) {
    return 0;
  }
  v2[1] = 0;
  int v3 = v2 + 1;
  *unsigned int v2 = a1;
  return v3;
}

void mdb_midl_free(uint64_t a1)
{
  if (a1) {
    free((void *)(a1 - 8));
  }
}

void *mdb_midl_shrink(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v4 = *(void *)(v2 - 8);
  uint64_t result = (void *)(v2 - 8);
  if (v4 >= 0x20000)
  {
    uint64_t result = malloc_type_realloc(result, 0x100008uLL, 0x100004000313F17uLL);
    if (result)
    {
      *result++ = 0x1FFFFLL;
      *a1 = (uint64_t)result;
    }
  }
  return result;
}

uint64_t mdb_midl_need(_DWORD **a1, int a2)
{
  int v3 = *a1;
  unint64_t v4 = (*v3 + a2);
  unint64_t v6 = *((void *)v3 - 1);
  uint64_t v5 = v3 - 2;
  if (v6 >= v4) {
    return 0;
  }
  uint64_t v7 = (v4 + (v4 >> 2) + 258) & 0xFFFFFF00;
  unsigned int v8 = malloc_type_realloc(v5, 8 * v7, 0x100004000313F17uLL);
  if (!v8) {
    return 12;
  }
  int v9 = v8;
  uint64_t result = 0;
  *int v9 = (v7 - 2);
  *a1 = v9 + 1;
  return result;
}

uint64_t mdb_midl_append(unint64_t **a1, unint64_t a2)
{
  unint64_t v4 = *a1;
  unint64_t v5 = **a1;
  unint64_t v6 = *a1;
  unint64_t v9 = *(v6 - 1);
  uint64_t v7 = v6 - 1;
  unint64_t v8 = v9;
  if (v5 < v9) {
    goto LABEL_4;
  }
  int v10 = malloc_type_realloc(v7, 8 * v8 + 1048584, 0x100004000313F17uLL);
  if (v10)
  {
    unint64_t v4 = v10 + 1;
    unint64_t v5 = v10[1];
    *v10 += 0x1FFFFLL;
    *a1 = v10 + 1;
LABEL_4:
    uint64_t result = 0;
    unint64_t v12 = v5 + 1;
    *unint64_t v4 = v12;
    v4[v12] = a2;
    return result;
  }
  return 12;
}

uint64_t mdb_midl_append_list(uint64_t **a1, uint64_t *a2)
{
  unint64_t v4 = *a1;
  uint64_t v5 = **a1;
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  unint64_t v10 = *(v7 - 1);
  unint64_t v8 = v7 - 1;
  unint64_t v9 = v10;
  if (*a2 + v5 < v10) {
    goto LABEL_4;
  }
  int64_t v11 = malloc_type_realloc(v8, 8 * (v9 + (int)v6) + 16, 0x100004000313F17uLL);
  if (v11)
  {
    unint64_t v4 = v11 + 1;
    uint64_t v5 = v11[1];
    *v11 += (int)v6;
    *a1 = v11 + 1;
    uint64_t v6 = *a2;
LABEL_4:
    memcpy(&v4[v5 + 1], a2 + 1, 8 * v6);
    uint64_t result = 0;
    *v4 += *a2;
    return result;
  }
  return 12;
}

uint64_t mdb_midl_append_range(unint64_t **a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = *v6;
  unint64_t v8 = *v6 + a3;
  unint64_t v9 = *(v6 - 1);
  if (v8 > v9)
  {
    int v10 = a3 | 0x1FFFF;
    int64_t v11 = malloc_type_realloc(v6 - 1, 8 * (v9 + (int)(a3 | 0x1FFFF)) + 16, 0x100004000313F17uLL);
    if (!v11) {
      return 12;
    }
    *v11 += v10;
    uint64_t v6 = v11 + 1;
    *a1 = v6;
  }
  unint64_t *v6 = v8;
  if (a3)
  {
    uint64_t v12 = a3;
    do
      v6[v7 + v12--] = a2++;
    while (v12);
  }
  return 0;
}

uint64_t *mdb_midl_xmerge(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *result;
  uint64_t v4 = *result + *a2;
  *uint64_t result = -1;
  if (v2)
  {
    unint64_t v5 = result[v3];
    uint64_t v6 = v4;
    do
    {
      unint64_t v7 = a2[v2];
      if (v5 >= v7)
      {
        uint64_t v9 = v3;
        uint64_t v8 = v6;
      }
      else
      {
        do
        {
          uint64_t v8 = v6 - 1;
          result[v6] = v5;
          uint64_t v9 = v3 - 1;
          unint64_t v5 = result[v3 - 1];
          --v6;
          --v3;
        }
        while (v5 < v7);
      }
      uint64_t v6 = v8 - 1;
      result[v8] = v7;
      uint64_t v3 = v9;
      --v2;
    }
    while (v2);
  }
  *uint64_t result = v4;
  return result;
}

int *mdb_midl_sort(int *result)
{
  LODWORD(v1) = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v2 = *result;
  LODWORD(v3) = 1;
LABEL_2:
  while (2)
  {
    uint64_t v4 = (int)v3 + 1;
    while (v2 - (int)v3 > 7)
    {
      int v5 = (v2 + (int)v3) >> 1;
      unint64_t v6 = *(void *)&result[2 * v5];
      *(void *)&result[2 * v5] = *(void *)&result[2 * v4];
      *(void *)&result[2 * v4] = v6;
      unint64_t v7 = *(void *)&result[2 * (int)v3];
      unint64_t v8 = *(void *)&result[2 * v2];
      if (v7 < v8)
      {
        *(void *)&result[2 * (int)v3] = v8;
        *(void *)&result[2 * v2] = v7;
        unint64_t v6 = *(void *)&result[2 * v4];
        unint64_t v8 = v7;
      }
      if (v6 < v8)
      {
        *(void *)&result[2 * v4] = v8;
        *(void *)&result[2 * v2] = v6;
        unint64_t v6 = *(void *)&result[2 * v4];
      }
      unint64_t v9 = *(void *)&result[2 * (int)v3];
      if (v9 < v6)
      {
        *(void *)&result[2 * (int)v3] = v6;
        *(void *)&result[2 * v4] = v9;
        unint64_t v6 = v9;
      }
      int v10 = v3 + 1;
      int v11 = v2;
      while (1)
      {
        uint64_t v12 = &result[2 * v10 + 2];
        do
        {
          unint64_t v14 = *(void *)v12;
          v12 += 2;
          unint64_t v13 = v14;
          ++v10;
        }
        while (v14 > v6);
        uint64_t v15 = &result[2 * v11];
        do
        {
          unint64_t v17 = *((void *)v15 - 1);
          v15 -= 2;
          unint64_t v16 = v17;
          --v11;
        }
        while (v17 < v6);
        if (v11 + 1 <= v10) {
          break;
        }
        *((void *)v12 - 1) = v16;
        *(void *)uint64_t v15 = v13;
      }
      *(void *)&result[2 * v4] = v16;
      *(void *)uint64_t v15 = v6;
      uint64_t v18 = (int)v1;
      uint64_t v1 = (int)v1 + 2;
      if (v2 - v10 + 1 < v11 - (int)v3)
      {
        v23[(int)v1] = v11 - 1;
        v23[v18 + 1] = v3;
        LODWORD(v3) = v10;
        goto LABEL_2;
      }
      v23[v1] = v2;
      v23[v18 + 1] = v10;
      int v2 = v11 - 1;
    }
    if (v2 > (int)v3)
    {
      uint64_t v3 = (int)v3;
      do
      {
        uint64_t v19 = v3++;
        unint64_t v20 = *(void *)&result[2 * v3];
        if (v19 >= 1)
        {
          while (1)
          {
            unint64_t v21 = *(void *)&result[2 * v19];
            if (v21 >= v20) {
              break;
            }
            *(void *)&result[2 * (v19 + 1)] = v21;
            BOOL v22 = __OFSUB__(v19, 1);
            LODWORD(v19) = v19 - 1;
            if (((int)v19 < 0) ^ v22 | (v19 == 0))
            {
              LODWORD(v19) = 0;
              break;
            }
          }
        }
        *(void *)&result[2 * (int)v19 + 2] = v20;
      }
      while (v3 != v2);
    }
    if (v1)
    {
      LODWORD(v3) = v23[(int)v1 - 1];
      int v2 = v23[(int)v1];
      LODWORD(v1) = v1 - 2;
      continue;
    }
    return result;
  }
}

uint64_t mdb_mid2l_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2 = *a1;
  if (!*a1) {
    return 1;
  }
  int v3 = 0;
  do
  {
    unsigned int v4 = v2 >> 1;
    uint64_t v5 = v3 + (v2 >> 1) + 1;
    unint64_t v6 = *(void *)&a1[4 * v5];
    if (v6 <= a2)
    {
      if (v6 >= a2) {
        return v5;
      }
      unsigned int v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    unsigned int v2 = v4;
  }
  while (v4);
  if (v6 >= a2) {
    return v5;
  }
  else {
    return (v5 + 1);
  }
}

uint64_t mdb_mid2l_insert(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a2;
  unint64_t v3 = *a1;
  if (*a1)
  {
    int v4 = 0;
    unint64_t v5 = *a1;
    do
    {
      unsigned int v6 = v5 >> 1;
      unsigned int v7 = v4 + (v5 >> 1) + 1;
      unint64_t v8 = a1[2 * v7];
      if (v8 <= v2)
      {
        if (v8 >= v2) {
          goto LABEL_9;
        }
        unsigned int v6 = v5 + ~v6;
        v4 += (v5 >> 1) + 1;
      }
      LODWORD(v5) = v6;
    }
    while (v6);
    if (v8 < v2) {
      ++v7;
    }
LABEL_9:
    if (!v7) {
      return 4294967294;
    }
  }
  else
  {
    unsigned int v7 = 1;
  }
  uint64_t v9 = v7;
  if (v3 >= v7 && a1[2 * v7] == v2) {
    return 0xFFFFFFFFLL;
  }
  if (v3 > 0x1FFFE) {
    return 4294967294;
  }
  unsigned int v11 = v3 + 1;
  *a1 = v3 + 1;
  if (v7 < (int)v3 + 1)
  {
    uint64_t v12 = &a1[2 * v3];
    unint64_t v13 = &a1[2 * v3 + 2];
    do
    {
      long long v14 = *(_OWORD *)v12;
      v12 -= 2;
      *(_OWORD *)unint64_t v13 = v14;
      v13 -= 2;
      --v11;
    }
    while (v9 < v11);
  }
  uint64_t v10 = 0;
  *(_OWORD *)&a1[2 * v9] = *(_OWORD *)a2;
  return v10;
}

__n128 mdb_mid2l_append(uint64_t *a1, __n128 *a2)
{
  if ((unint64_t)*a1 <= 0x1FFFE)
  {
    uint64_t v2 = *a1 + 1;
    *a1 = v2;
    __n128 result = *a2;
    *(__n128 *)&a1[2 * v2] = *a2;
  }
  return result;
}

const char *mdb_version(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (a1) {
    *a1 = 0;
  }
  if (a2) {
    *a2 = 9;
  }
  if (a3) {
    *a3 = 29;
  }
  return "LMDB 0.9.29: (March 16, 2021)";
}

uint64_t mdb_env_create(void *a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x108uLL, 0x10B00408373FFB5uLL);
  if (!v2) {
    return 12;
  }
  unint64_t v3 = v2;
  v2[6] = 126;
  *((void *)v2 + 4) = 0x200000002;
  *(void *)uint64_t v2 = -1;
  v2[2] = -1;
  *((void *)v2 + 29) = -1;
  *((void *)v2 + 30) = -1;
  v2[10] = getpid();
  int v4 = sysconf(29);
  uint64_t result = 0;
  v3[5] = v4;
  *a1 = v3;
  return result;
}

uint64_t mdb_env_set_mapsize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(void **)(a1 + 56);
  if (!v4) {
    goto LABEL_12;
  }
  if (*(void *)(a1 + 96)) {
    return 22;
  }
  uint64_t v6 = *(void *)(a1
                 + 72
                 + 8 * (*(void *)(*(void *)(a1 + 72) + 128) < *(void *)(*(void *)(a1 + 80) + 128)));
  if (!a2) {
    unint64_t v2 = *(void *)(v6 + 16);
  }
  unint64_t v7 = *(unsigned int *)(a1 + 16) + *(unsigned int *)(a1 + 16) * *(void *)(v6 + 120);
  if (v2 <= v7) {
    unint64_t v2 = v7;
  }
  munmap(v4, *(void *)(a1 + 112));
  *(void *)(a1 + 112) = v2;
  unint64_t v8 = (*(unsigned char *)(a1 + 12) & 1) != 0 ? *(char **)(a1 + 56) : 0;
  uint64_t result = sub_263D95DF8(a1, v8);
  if (!result)
  {
LABEL_12:
    *(void *)(a1 + 112) = v2;
    unint64_t v9 = *(unsigned int *)(a1 + 16);
    uint64_t result = 0;
    if (v9) {
      *(void *)(a1 + 128) = v2 / v9;
    }
  }
  return result;
}

uint64_t sub_263D95DF8(uint64_t a1, char *a2)
{
  int v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & 0x80000) != 0)
  {
    if (ftruncate(*(_DWORD *)a1, *(void *)(a1 + 112)) < 0) {
      return *__error();
    }
    int v5 = 3;
  }
  else
  {
    int v5 = 1;
  }
  uint64_t v6 = (char *)mmap(a2, *(void *)(a1 + 112), v5, 1, *(_DWORD *)a1, 0);
  *(void *)(a1 + 56) = v6;
  if (v6 == (char *)-1)
  {
    *(void *)(a1 + 56) = 0;
    return *__error();
  }
  if ((v4 & 0x800000) != 0)
  {
    madvise(v6, *(void *)(a1 + 112), 1);
    uint64_t v6 = *(char **)(a1 + 56);
  }
  if (a2 && v6 != a2) {
    return 16;
  }
  uint64_t v7 = 0;
  uint64_t v8 = (uint64_t)&v6[*(unsigned int *)(a1 + 16) + 16];
  *(void *)(a1 + 72) = v6 + 16;
  *(void *)(a1 + 80) = v8;
  return v7;
}

uint64_t mdb_env_set_maxdbs(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 56)) {
    return 22;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 36) = a2 + 2;
  return result;
}

uint64_t mdb_env_set_maxreaders(uint64_t a1, int a2)
{
  uint64_t result = 22;
  if (a2)
  {
    if (!*(void *)(a1 + 56))
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 24) = a2;
    }
  }
  return result;
}

uint64_t mdb_env_get_maxreaders(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 24);
    }
  }
  return result;
}

uint64_t mdb_env_open(uint64_t a1, const char *a2, int a3, uint64_t a4)
{
  int v26 = -1;
  uint64_t v4 = 22;
  if ((a3 & 0xFE00BFFE) != 0) {
    return v4;
  }
  if (*(_DWORD *)a1 != -1) {
    return v4;
  }
  uint64_t v24 = 0;
  __int16 v25 = 0;
  int v9 = *(_DWORD *)(a1 + 12) | a3;
  uint64_t v4 = sub_263D96260(a2, v9, (uint64_t)&v24);
  if (v4) {
    return v4;
  }
  if ((v9 & 0x20000) != 0)
  {
    v9 &= ~0x80000u;
  }
  else
  {
    uint64_t v10 = malloc_type_malloc(0x100008uLL, 0x100004000313F17uLL);
    if (!v10)
    {
      *(void *)(a1 + 200) = 0;
LABEL_10:
      *(_DWORD *)(a1 + 12) = v9 | 0x20000000;
LABEL_13:
      uint64_t v4 = 12;
LABEL_14:
      sub_263D96B88(a1, v26);
      goto LABEL_15;
    }
    _OWORD *v10 = xmmword_263D98830;
    *(void *)(a1 + 200) = (char *)v10 + 8;
    unsigned int v11 = malloc_type_calloc(0x20000uLL, 0x10uLL, 0x108004057E67DB5uLL);
    *(void *)(a1 + 208) = v11;
    if (!v11) {
      goto LABEL_10;
    }
  }
  *(_DWORD *)(a1 + 12) = v9 | 0x20000000;
  *(void *)(a1 + 48) = strdup(a2);
  *(void *)(a1 + 136) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 0x30uLL, 0x1080040226B62D8uLL);
  *(void *)(a1 + 144) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 2uLL, 0x1000040BDFB0063uLL);
  uint64_t v12 = malloc_type_calloc(*(unsigned int *)(a1 + 36), 4uLL, 0x100004052888210uLL);
  *(void *)(a1 + 152) = v12;
  uint64_t v13 = *(void *)(a1 + 136);
  if (!v13 || !*(void *)(a1 + 48)) {
    goto LABEL_13;
  }
  uint64_t v4 = 12;
  if (!*(void *)(a1 + 144)) {
    goto LABEL_14;
  }
  if (!v12) {
    goto LABEL_14;
  }
  *(void *)(v13 + 16) = sub_263D8E5B4;
  if ((v9 & 0x420000) == 0)
  {
    uint64_t v4 = sub_263D962EC(a1, (int *)&v24, a4, &v26);
    if (v4) {
      goto LABEL_14;
    }
  }
  int v14 = v9 & 0x20000;
  int v15 = (v9 & 0x20000) != 0 ? 0 : 514;
  uint64_t v4 = sub_263D966F0((unsigned int *)a1, (int *)&v24, v15, a4, (int *)a1);
  if (v4) {
    goto LABEL_14;
  }
  if ((v9 & 0x420000) == 0x20000)
  {
    uint64_t v4 = sub_263D962EC(a1, (int *)&v24, a4, &v26);
    if (v4) {
      goto LABEL_14;
    }
  }
  uint64_t v16 = sub_263D967E0(a1);
  if (v16
    || (v9 & 0xA0000) == 0
    && (uint64_t v16 = sub_263D966F0((unsigned int *)a1, (int *)&v24, 20971521, a4, (int *)(a1 + 8)), v16))
  {
    uint64_t v4 = v16;
    goto LABEL_14;
  }
  if (v26 >= 1)
  {
    uint64_t v23 = sub_263D96AE4(a1, &v26);
    if (v23 | v14)
    {
      uint64_t v4 = v23;
      if (v23) {
        goto LABEL_14;
      }
      goto LABEL_15;
    }
  }
  else if (v14)
  {
    uint64_t v4 = 0;
    goto LABEL_15;
  }
  int v17 = *(_DWORD *)(a1 + 36);
  uint64_t v18 = malloc_type_calloc(1uLL, *(unsigned int *)(a1 + 16), 0xC4F7DA74uLL);
  *(void *)(a1 + 88) = v18;
  if (!v18) {
    goto LABEL_13;
  }
  uint64_t v19 = malloc_type_calloc(1uLL, 61 * v17 + 136, 0xDC78283AuLL);
  if (!v19) {
    goto LABEL_13;
  }
  uint64_t v4 = 0;
  v19[11] = v19 + 17;
  uint64_t v20 = *(unsigned int *)(a1 + 36);
  uint64_t v21 = (uint64_t)&v19[6 * v20 + 17];
  uint64_t v22 = v21 + 8 * v20;
  v19[12] = v22;
  v19[13] = v21;
  v19[14] = v22 + 4 * v20;
  v19[4] = a1;
  v19[10] = *(void *)(a1 + 136);
  *((_DWORD *)v19 + 31) = 1;
  *(void *)(a1 + 104) = v19;
LABEL_15:
  if (HIDWORD(v24)) {
    free(v25);
  }
  return v4;
}

uint64_t sub_263D96260(const char *a1, int a2, uint64_t a3)
{
  int v5 = ~a2 & 0x404000;
  *(_DWORD *)(a3 + 4) = 0;
  int v6 = strlen(a1);
  *(_DWORD *)a3 = v6;
  if (v5)
  {
    uint64_t v8 = (char *)malloc_type_malloc(v6 + 10, 0xC6B31FAuLL);
    *(void *)(a3 + 8) = v8;
    if (v8)
    {
      *(_DWORD *)(a3 + 4) = 1;
      strcpy(v8, a1);
      return 0;
    }
    else
    {
      return 12;
    }
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a3 + 8) = a1;
  }
  return result;
}

uint64_t sub_263D962EC(uint64_t a1, int *a2, uint64_t a3, int *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v7 = (int *)(a1 + 4);
  uint64_t result = sub_263D966F0((unsigned int *)a1, a2, 16777734, (unsigned __int16)a3, (int *)(a1 + 4));
  if (result)
  {
    if (result == 30)
    {
      if ((*(unsigned char *)(a1 + 14) & 2) != 0) {
        return 0;
      }
      else {
        return 30;
      }
    }
    return result;
  }
  if ((*(unsigned char *)(a1 + 14) & 0x20) == 0)
  {
    uint64_t result = pthread_key_create((pthread_key_t *)(a1 + 160), (void (__cdecl *)(void *))sub_263D93F8C);
    if (result) {
      return result;
    }
    *(_DWORD *)(a1 + 12) |= 0x10000000u;
  }
  uint64_t result = sub_263D97AE4(a1, a4);
  if (!result)
  {
    off_t v9 = lseek(*v7, 0, 2);
    if (v9 == -1) {
      return *__error();
    }
    int64_t v10 = ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 192;
    if (v9 >= v10 || *a4 < 1)
    {
      *(_DWORD *)(a1 + 24) = ((unint64_t)(v9 + 0x3FFFFFFF40) >> 6) + 1;
      int64_t v10 = v9;
    }
    else if (ftruncate(*v7, ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 192))
    {
      return *__error();
    }
    unsigned int v11 = mmap(0, v10, 3, 1, *v7, 0);
    if (v11 == (_DWORD *)-1) {
      return *__error();
    }
    *(void *)(a1 + 64) = v11;
    if (*a4 >= 1)
    {
      memset(&v24, 0, sizeof(v24));
      uint64_t v22 = 0;
      if (!fstat(*v7, &v24))
      {
        uint64_t v14 = 0;
        LODWORD(v22) = v24.st_dev;
        __darwin_ino64_t st_ino = v24.st_ino;
        unint64_t v15 = 0xCBF29CE484222325;
        do
          unint64_t v15 = 0x100000001B3 * (v15 ^ *((unsigned __int8 *)&v22 + v14++));
        while (v14 != 16);
        uint64_t v16 = 0;
        unint64_t v17 = v15;
        do
        {
          v25[v16++] = a0123456789abcd[v17 % 0x55];
          v17 /= 0x55uLL;
        }
        while (v16 != 5);
        unint64_t v18 = HIDWORD(v15);
        for (uint64_t i = 5; i != 10; ++i)
        {
          v25[i] = a0123456789abcd[v18 % 0x55];
          v18 /= 0x55uLL;
        }
        v25[10] = 0;
        snprintf((char *)(*(void *)(a1 + 64) + 8), 0x1FuLL, "/MDBr%s", v25);
        snprintf((char *)(*(void *)(a1 + 64) + 64), 0x1FuLL, "/MDBw%s", v25);
        sem_unlink((const char *)(*(void *)(a1 + 64) + 8));
        sem_unlink((const char *)(*(void *)(a1 + 64) + 64));
        uint64_t v20 = sem_open((const char *)(*(void *)(a1 + 64) + 8), 2560, a3, 1, v22, st_ino);
        *(void *)(a1 + 232) = v20;
        if (v20 != (sem_t *)-1)
        {
          uint64_t v21 = sem_open((const char *)(*(void *)(a1 + 64) + 64), 2560, a3, 1);
          *(void *)(a1 + 240) = v21;
          if (v21 != (sem_t *)-1)
          {
            uint64_t result = 0;
            **(_DWORD **)(a1 + 64) = -1091583778;
            *(_DWORD *)(*(void *)(a1 + 64) + 4) = 65537;
            *(void *)(*(void *)(a1 + 64) + 40) = 0;
            *(_DWORD *)(*(void *)(a1 + 64) + 48) = 0;
            return result;
          }
        }
      }
      return *__error();
    }
    if (*v11 != -1091583778) {
      return 4294936503;
    }
    if (v11[1] != 65537) {
      return 4294936502;
    }
    uint64_t result = *__error();
    if (result <= 0x23 && ((1 << result) & 0x800002001) != 0)
    {
      uint64_t v12 = sem_open((const char *)(*(void *)(a1 + 64) + 8), 0);
      *(void *)(a1 + 232) = v12;
      if (v12 == (sem_t *)-1) {
        return *__error();
      }
      uint64_t v13 = sem_open((const char *)(*(void *)(a1 + 64) + 64), 0);
      uint64_t result = 0;
      *(void *)(a1 + 240) = v13;
      if (v13 == (sem_t *)-1) {
        return *__error();
      }
    }
  }
  return result;
}

uint64_t sub_263D966F0(unsigned int *a1, int *a2, int a3, unsigned int a4, int *a5)
{
  if (a2[1]) {
    strcpy((char *)(*((void *)a2 + 1) + *a2), (&(&off_2655E7278)[2 * (a3 == 16777734)])[((unint64_t)a1[3] >> 14) & 1]);
  }
  int v10 = open(*((const char **)a2 + 1), a3 & 0x1400A03, a4);
  int v11 = v10;
  if (v10 == -1)
  {
    uint64_t result = *__error();
  }
  else
  {
    if (a3 == 16779777 && a1[4] >= a1[5]) {
      fcntl(v10, 48, 1);
    }
    uint64_t result = 0;
  }
  *a5 = v11;
  return result;
}

uint64_t sub_263D967E0(uint64_t a1)
{
  int v2 = 0;
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(a1 + 12);
  memset(v16, 0, 136);
  unint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v4 = 1;
  long long __buf = 0u;
  while (1)
  {
    char v5 = v4;
    int v6 = pread(*(_DWORD *)a1, &__buf, 0x98uLL, v2);
    if (v6 != 152) {
      break;
    }
    uint64_t result = 4294936503;
    if ((BYTE10(__buf) & 8) == 0 || v18 != -1091583778) {
      goto LABEL_17;
    }
    if (DWORD1(v18) != 1)
    {
      uint64_t result = 4294936502;
      goto LABEL_17;
    }
    if (!v2 || v26 > *(void *)&v16[8])
    {
      v16[0] = v18;
      v16[4] = v22;
      v16[3] = v21;
      v16[2] = v20;
      v16[1] = v19;
      *(void *)&v16[8] = v26;
      v16[7] = v25;
      v16[6] = v24;
      v16[5] = v23;
    }
    char v4 = 0;
    unsigned int v8 = DWORD2(v16[1]);
    v2 += DWORD2(v16[1]);
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
  }
  if (v2 | v6)
  {
    if (v6 < 0)
    {
      uint64_t result = *__error();
      if (!result)
      {
        unsigned int v8 = DWORD2(v16[1]);
LABEL_10:
        *(_DWORD *)(a1 + 16) = v8;
        unint64_t v9 = *(void *)(a1 + 112);
        char v10 = 1;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t result = 4294936503;
    }
  }
  else
  {
    uint64_t result = 2;
  }
LABEL_17:
  if (result != 2) {
    return result;
  }
  char v10 = 0;
  unsigned int v8 = *(_DWORD *)(a1 + 20);
  if (v8 >= 0x8000) {
    unsigned int v8 = 0x8000;
  }
  *(_DWORD *)(a1 + 16) = v8;
  memset((char *)&v16[1] + 8, 0, 112);
  *(_OWORD *)((char *)v16 + 8) = 0u;
  *(void *)&v16[0] = 0x1BEEFC0DELL;
  WORD6(v16[1]) = *(_WORD *)(a1 + 12) | 8;
  *(void *)&v16[4] = -1;
  *(void *)&v16[1] = 0x100000;
  unint64_t v9 = *(void *)(a1 + 112);
  DWORD2(v16[1]) = v8;
  v16[7] = xmmword_263D98860;
LABEL_22:
  if (!v9)
  {
    unint64_t v9 = *(void *)&v16[1];
    *(void *)(a1 + 112) = *(void *)&v16[1];
  }
  unint64_t v11 = v8 * *((void *)&v16[7] + 1) + v8;
  if (v9 < v11)
  {
    *(void *)(a1 + 112) = v11;
    unint64_t v9 = v11;
  }
  *(void *)&v16[1] = v9;
  int v12 = v3 & 1;
  if (v10)
  {
LABEL_27:
    char v13 = 1;
    goto LABEL_32;
  }
  if (!v12)
  {
    uint64_t result = sub_263D97BA8(a1, (uint64_t)v16);
    if (result) {
      return result;
    }
    int v12 = 0;
    goto LABEL_27;
  }
  char v13 = 0;
  int v12 = 1;
LABEL_32:
  if (v12) {
    uint64_t v14 = (char *)*((void *)&v16[0] + 1);
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t result = sub_263D95DF8(a1, v14);
  if (!result)
  {
    if (v13) {
      goto LABEL_37;
    }
    if (v12) {
      *((void *)&v16[0] + 1) = *(void *)(a1 + 56);
    }
    uint64_t result = sub_263D97BA8(a1, (uint64_t)v16);
    if (!result)
    {
LABEL_37:
      uint64_t result = 0;
      unint64_t v15 = *(unsigned int *)(a1 + 16);
      *(_DWORD *)(a1 + 216) = ((v15 - 16) >> 3) - 1;
      *(_DWORD *)(a1 + 220) = (((v15 - 16) >> 1) & 0x7FFFFFFE) - 2;
      *(void *)(a1 + 128) = *(void *)(a1 + 112) / v15;
    }
  }
  return result;
}

uint64_t sub_263D96AE4(uint64_t a1, int *a2)
{
  *(void *)(*(void *)(a1 + 64) + 40) = *(void *)(*(void *)(a1
                                                                   + 72
                                                                   + 8
                                                                   * (*(void *)(*(void *)(a1 + 72) + 128) < *(void *)(*(void *)(a1 + 80) + 128)))
                                                       + 128);
  uint64_t v7 = 0x100000000;
  long long v6 = xmmword_263D98850;
  do
  {
    uint64_t result = fcntl(*(_DWORD *)(a1 + 4), 8, &v6);
    if (!result) {
      break;
    }
    uint64_t result = *__error();
  }
  while (result == 4);
  if (result) {
    int v5 = -1;
  }
  else {
    int v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_263D96B88(uint64_t result, int a2)
{
  int v18 = a2;
  if ((*(unsigned char *)(result + 15) & 0x20) != 0)
  {
    int v2 = a2;
    uint64_t v3 = result;
    char v4 = *(void **)(result + 136);
    if (v4)
    {
      uint64_t v5 = *(unsigned int *)(v3 + 36);
      if ((int)v5 >= 3)
      {
        unint64_t v6 = v5 + 1;
        do
          free(*(void **)(*(void *)(v3 + 136) + 48 * (v6-- - 2) + 8));
        while (v6 > 3);
        char v4 = *(void **)(v3 + 136);
      }
      free(v4);
    }
    free(*(void **)(v3 + 88));
    free(*(void **)(v3 + 152));
    free(*(void **)(v3 + 144));
    free(*(void **)(v3 + 48));
    free(*(void **)(v3 + 208));
    free(*(void **)(v3 + 104));
    uint64_t v7 = *(void *)(v3 + 200);
    if (v7) {
      free((void *)(v7 - 8));
    }
    if ((*(unsigned char *)(v3 + 15) & 0x10) != 0) {
      pthread_key_delete(*(void *)(v3 + 160));
    }
    unsigned int v8 = *(void **)(v3 + 56);
    if (v8) {
      munmap(v8, *(void *)(v3 + 112));
    }
    int v9 = *(_DWORD *)(v3 + 8);
    if (v9 != -1) {
      close(v9);
    }
    if (*(_DWORD *)v3 != -1) {
      close(*(_DWORD *)v3);
    }
    if (*(void *)(v3 + 64))
    {
      pid_t v10 = getpid();
      uint64_t v11 = *(unsigned int *)(v3 + 28);
      if ((int)v11 >= 1)
      {
        unint64_t v12 = v11 + 1;
        do
        {
          unint64_t v13 = *(void *)(v3 + 64) + ((unint64_t)(v12 - 2) << 6);
          int v15 = *(_DWORD *)(v13 + 136);
          uint64_t v14 = (_DWORD *)(v13 + 136);
          if (v15 == v10) {
            *uint64_t v14 = 0;
          }
          --v12;
        }
        while (v12 > 1);
      }
      uint64_t v16 = *(sem_t **)(v3 + 232);
      if (v16 != (sem_t *)-1)
      {
        sem_close(v16);
        unint64_t v17 = *(sem_t **)(v3 + 240);
        if (v17 != (sem_t *)-1) {
          sem_close(v17);
        }
        if (!v2)
        {
          sub_263D97AE4(v3, &v18);
          int v2 = v18;
        }
        if (v2 >= 1)
        {
          sem_unlink((const char *)(*(void *)(v3 + 64) + 8));
          sem_unlink((const char *)(*(void *)(v3 + 64) + 64));
        }
      }
      munmap(*(void **)(v3 + 64), ((unint64_t)(*(_DWORD *)(v3 + 24) - 1) << 6) + 192);
    }
    uint64_t result = *(unsigned int *)(v3 + 4);
    if (result != -1) {
      uint64_t result = close(result);
    }
    *(_DWORD *)(v3 + 12) &= 0xCFFFFFFF;
  }
  return result;
}

void mdb_env_close(void *a1)
{
  if (a1)
  {
    while (1)
    {
      uint64_t v3 = (void *)a1[24];
      if (!v3) {
        break;
      }
      a1[24] = *v3;
      free(v3);
    }
    sub_263D96B88((uint64_t)a1, 0);
    free(a1);
  }
}

size_t mdb_env_copyfd2(sem_t **a1, int a2, char a3)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v73 = 0;
    long long v71 = 0u;
    long long v72 = 0u;
    *(_OWORD *)uint64_t v69 = 0u;
    long long v70 = 0u;
    memset(&v68, 0, sizeof(v68));
    *(_OWORD *)long long v66 = 0u;
    memset(&v67, 0, sizeof(v67));
    pthread_t v64 = 0;
    long long v65 = 0;
    unint64_t v63 = 0;
    size_t v5 = pthread_mutex_init(&v67, 0);
    if (v5) {
      return v5;
    }
    size_t v9 = pthread_cond_init(&v68, 0);
    if (v9)
    {
      size_t v5 = v9;
      pthread_mutex_destroy(&v67);
      return v5;
    }
    *(void *)&memptr.st_dev = 0;
    size_t v14 = malloc_type_posix_memalign((void **)&memptr, *((unsigned int *)a1 + 5), 0x200000uLL, 0x12F967E6uLL);
    if (v14)
    {
      size_t v5 = v14;
      goto LABEL_24;
    }
    uint64_t v15 = *(void *)&memptr.st_dev;
    v69[0] = *(void **)&memptr.st_dev;
    bzero(*(void **)&memptr.st_dev, 0x200000uLL);
    *(void *)&long long v72 = 2;
    v69[1] = (void *)(v15 + 0x100000);
    v66[0] = a1;
    DWORD2(v72) = a2;
    size_t v5 = pthread_create(&v64, 0, (void *(__cdecl *)(void *))sub_263D97D04, v66);
    if (v5)
    {
LABEL_24:
      free(v69[0]);
      pthread_cond_destroy(&v68);
      pthread_mutex_destroy(&v67);
      if (!v5) {
        return HIDWORD(v73);
      }
      return v5;
    }
    int v24 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, &v65);
    if (v24)
    {
      uint64_t v34 = v65;
      goto LABEL_68;
    }
    long long v25 = v69[0];
    bzero(v69[0], (2 * *((_DWORD *)a1 + 4)));
    *(void *)long long v25 = 0;
    v25[5] = 8;
    *((void *)v25 + 2) = 0x1BEEFC0DELL;
    *((void *)v25 + 4) = a1[14];
    uint64_t v26 = *((unsigned int *)a1 + 4);
    *((_DWORD *)v25 + 10) = v26;
    v25[22] = *((_WORD *)a1 + 6) | 8;
    *((void *)v25 + 10) = -1;
    *((_OWORD *)v25 + 8) = xmmword_263D98860;
    *((void *)v25 + 3) = *((void *)a1[9] + 1);
    uint64_t v27 = (char *)v69[0] + v26;
    *(void *)uint64_t v27 = 1;
    *((_WORD *)v27 + 5) = 8;
    *((_OWORD *)v27 + 1) = *((_OWORD *)v25 + 1);
    long long v28 = *((_OWORD *)v25 + 2);
    long long v29 = *((_OWORD *)v25 + 3);
    long long v30 = *((_OWORD *)v25 + 4);
    *((_OWORD *)v27 + 5) = *((_OWORD *)v25 + 5);
    *((_OWORD *)v27 + 4) = v30;
    *((_OWORD *)v27 + 3) = v29;
    *((_OWORD *)v27 + 2) = v28;
    long long v31 = *((_OWORD *)v25 + 6);
    long long v32 = *((_OWORD *)v25 + 7);
    long long v33 = *((_OWORD *)v25 + 8);
    *((void *)v27 + 18) = *((void *)v25 + 18);
    *((_OWORD *)v27 + 8) = v33;
    *((_OWORD *)v27 + 7) = v32;
    *((_OWORD *)v27 + 6) = v31;
    uint64_t v34 = v65;
    uint64_t v35 = v65[11];
    unint64_t v63 = *(void *)(v35 + 88);
    if (v63 == -1)
    {
      int v36 = *(unsigned __int16 *)(v35 + 52);
      *((_WORD *)v27 + 46) = v36;
      uint64_t v37 = -1;
      if (!v36)
      {
LABEL_65:
        LODWORD(v71) = 2 * *((_DWORD *)a1 + 4);
        v66[1] = v34;
        int v24 = sub_263D97E64((uint64_t)v66, &v63, 0);
        if (!v24)
        {
          if (v63 == v37)
          {
LABEL_69:
            sub_263D98424((uint64_t)v66, 17);
            size_t v5 = pthread_join(v64, 0);
            mdb_txn_abort((uint64_t)v34);
            goto LABEL_24;
          }
          int v24 = -30784;
        }
LABEL_68:
        HIDWORD(v73) = v24;
        goto LABEL_69;
      }
    }
    else
    {
      uint64_t v62 = 0;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      memset(&memptr, 0, sizeof(memptr));
      v45[0] = 0;
      v45[1] = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      sub_263D8D2EC((uint64_t)&memptr, v65, 0, 0);
      if ((*(unsigned char *)(*(void *)&memptr.st_rdev + 124) & 0x13) != 0)
      {
LABEL_61:
        int v24 = -30782;
        goto LABEL_68;
      }
      uint64_t v38 = 0;
      while (1)
      {
        int v24 = sub_263D8EFCC((uint64_t)&memptr, v45, &v43, 8);
        if ((memptr.st_ctimespec.tv_sec & 0x800000000) != 0) {
          HIDWORD(memptr.st_ctimespec.tv_sec) ^= 8u;
        }
        if (v24) {
          break;
        }
        v38 += *v44;
        if ((*(unsigned char *)(*(void *)&memptr.st_rdev + 124) & 0x13) != 0) {
          goto LABEL_61;
        }
      }
      if (v24 != -30798) {
        goto LABEL_68;
      }
      uint64_t v39 = v34[11];
      uint64_t v37 = v34[2] + ~(*(void *)(v39 + 8) + v38 + *(void *)(v39 + 16) + *(void *)(v39 + 24));
      *((void *)v27 + 17) = v37;
      long long v40 = *(_OWORD *)(v39 + 48);
      long long v41 = *(_OWORD *)(v39 + 64);
      uint64_t v42 = *(void *)(v39 + 80);
      *(_OWORD *)(v27 + 104) = v41;
      *(_OWORD *)(v27 + 88) = v40;
      *((void *)v27 + 15) = v42;
      *((void *)v27 + 16) = v37;
    }
    *((void *)v27 + 18) = 1;
    goto LABEL_65;
  }
  v66[0] = 0;
  size_t v5 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, v66);
  if (!v5)
  {
    if (a1[8])
    {
      unint64_t v6 = v66[0];
      sub_263D8C1C0((unsigned int *)v66[0], 4);
      uint64_t v7 = a1[30];
      while (sem_wait(v7))
      {
        size_t v5 = *__error();
        if (v5 != 4)
        {
          if (v5) {
            goto LABEL_31;
          }
          break;
        }
      }
      uint64_t v8 = sub_263D8BA84((uint64_t)v6);
      if (v8)
      {
        size_t v5 = v8;
        sem_post(v7);
LABEL_31:
        mdb_txn_abort((uint64_t)v66[0]);
        return v5;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    int v10 = *((_DWORD *)a1 + 4);
    uint64_t v11 = (2 * v10);
    unint64_t v12 = a1[7];
    if (v11)
    {
      size_t v5 = (2 * v10);
      while (1)
      {
        ssize_t v13 = write(a2, v12, v5);
        if (v13 < 0)
        {
          size_t v5 = *__error();
          goto LABEL_28;
        }
        if (!v13) {
          break;
        }
        unint64_t v12 = (sem_t *)((char *)v12 + v13);
        v5 -= v13;
        if (!v5) {
          goto LABEL_28;
        }
      }
      size_t v5 = 5;
    }
    else
    {
      size_t v5 = 0;
    }
LABEL_28:
    if (v7) {
      sem_post(v7);
    }
    if (v5) {
      goto LABEL_31;
    }
    uint64_t v17 = *((void *)v66[0] + 2);
    uint64_t v18 = *((unsigned int *)a1 + 4);
    int v19 = *(_DWORD *)a1;
    memset(&memptr, 0, sizeof(memptr));
    if (fstat(v19, &memptr))
    {
      size_t v5 = *__error();
      if (v5) {
        goto LABEL_31;
      }
      unint64_t st_size = 0;
    }
    else
    {
      unint64_t st_size = memptr.st_size;
    }
    if (v17 * v18 < st_size) {
      unint64_t st_size = v17 * v18;
    }
    unint64_t v21 = st_size - v11;
    if (st_size == v11)
    {
      size_t v5 = 0;
    }
    else
    {
      while (1)
      {
        if (v21 >= 0x40000000) {
          size_t v22 = 0x40000000;
        }
        else {
          size_t v22 = v21;
        }
        ssize_t v23 = write(a2, v12, v22);
        if (v23 < 0)
        {
          size_t v5 = *__error();
          goto LABEL_31;
        }
        if (!v23) {
          break;
        }
        size_t v5 = 0;
        unint64_t v12 = (sem_t *)((char *)v12 + v23);
        v21 -= v23;
        if (!v21) {
          goto LABEL_31;
        }
      }
      size_t v5 = 5;
    }
    goto LABEL_31;
  }
  return v5;
}

size_t mdb_env_copyfd(sem_t **a1, int a2)
{
  return mdb_env_copyfd2(a1, a2, 0);
}

size_t mdb_env_copy2(unsigned int *a1, const char *a2, char a3)
{
  uint64_t v9 = 0;
  int v10 = 0;
  int v8 = -1;
  size_t v5 = sub_263D96260(a2, a1[3] | 0x400000, (uint64_t)&v9);
  if (!v5)
  {
    size_t v5 = sub_263D966F0(a1, (int *)&v9, 16779777, 0x1B6u, &v8);
    if (HIDWORD(v9)) {
      free(v10);
    }
    if (!v5)
    {
      int v7 = v8;
      size_t v5 = mdb_env_copyfd2((sem_t **)a1, v8, a3);
      if (close(v7) < 0 && !v5) {
        return *__error();
      }
    }
  }
  return v5;
}

size_t mdb_env_copy(unsigned int *a1, const char *a2)
{
  return mdb_env_copy2(a1, a2, 0);
}

uint64_t mdb_env_set_flags(uint64_t a1, int a2, int a3)
{
  if ((a2 & 0xFEEAFFFF) != 0) {
    return 22;
  }
  uint64_t result = 0;
  if (a3) {
    int v5 = *(_DWORD *)(a1 + 12) | a2;
  }
  else {
    int v5 = *(_DWORD *)(a1 + 12) & ~a2;
  }
  *(_DWORD *)(a1 + 12) = v5;
  return result;
}

uint64_t mdb_env_get_flags(uint64_t a1, int *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 12) & 0x1FF4001;
    }
  }
  return result;
}

uint64_t mdb_env_set_userctx(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(a1 + 248) = a2;
  return result;
}

uint64_t mdb_env_get_userctx(uint64_t result)
{
  if (result) {
    return *(void *)(result + 248);
  }
  return result;
}

uint64_t mdb_env_set_assert(uint64_t a1)
{
  if (a1) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t mdb_env_get_path(uint64_t a1, void *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 48);
    }
  }
  return result;
}

uint64_t mdb_env_get_fd(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *a1;
    }
  }
  return result;
}

__n128 mdb_env_stat(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = *(void *)(a1
                     + 72
                     + 8 * (*(void *)(*(void *)(a1 + 72) + 128) < *(void *)(*(void *)(a1 + 80) + 128)));
      int v3 = *(unsigned __int16 *)(v2 + 78);
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a2 + 4) = v3;
      *(_OWORD *)(a2 + 8) = *(_OWORD *)(v2 + 80);
      __n128 result = *(__n128 *)(v2 + 96);
      *(__n128 *)(a2 + 24) = result;
    }
  }
  return result;
}

uint64_t mdb_env_info(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 22;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v3 = a1 + 72;
    unint64_t v6 = *(void **)(v3 + 8 * (*(void *)(v4 + 128) < *(void *)(v5 + 128)));
    *(void *)a2 = v6[1];
    *(void *)(a2 + 16) = v6[15];
    *(void *)(a2 + 24) = v6[16];
    *(void *)(a2 + 8) = *(void *)(v3 + 40);
    *(_DWORD *)(a2 + 32) = *(_DWORD *)(v3 - 48);
    uint64_t v7 = *(void *)(v3 - 8);
    if (v7) {
      int v8 = *(_DWORD *)(v7 + 48);
    }
    else {
      int v8 = 0;
    }
    uint64_t v2 = 0;
    *(_DWORD *)(a2 + 36) = v8;
  }
  return v2;
}

__n128 mdb_stat(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1
    && a3
    && *(_DWORD *)(a1 + 120) > a2
    && (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 8) != 0
    && (*(unsigned char *)(a1 + 124) & 0x13) == 0)
  {
    if ((*(unsigned char *)(*(void *)(a1 + 112) + a2) & 2) != 0)
    {
      uint64_t v11 = 0;
      memset(v10, 0, sizeof(v10));
      memset(v9, 0, sizeof(v9));
      sub_263D8D2EC((uint64_t)v10, (void *)a1, a2, (uint64_t)v9);
    }
    uint64_t v6 = *(void *)(a1 + 88);
    *(_DWORD *)a3 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
    uint64_t v7 = v6 + 48 * a2;
    *(_DWORD *)(a3 + 4) = *(unsigned __int16 *)(v7 + 6);
    *(_OWORD *)(a3 + 8) = *(_OWORD *)(v7 + 8);
    __n128 result = *(__n128 *)(v7 + 24);
    *(__n128 *)(a3 + 24) = result;
  }
  return result;
}

uint64_t mdb_env_get_maxkeysize()
{
  return 511;
}

uint64_t mdb_reader_list(uint64_t a1, uint64_t (*a2)(const char *, uint64_t), uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    uint64_t v6 = a2;
    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7)
      {
        uint64_t v8 = *(unsigned int *)(v7 + 48);
        if (v8)
        {
          uint64_t v9 = 0;
          char v10 = 0;
          uint64_t result = 0;
          uint64_t v11 = -v8;
          uint64_t v12 = v7 + 144;
          while (2)
          {
            for (uint64_t i = v12 + (v9++ << 6); !*(_DWORD *)(i - 8); i += 64)
            {
              ++v9;
              if (v11 + v9 == 1)
              {
                if (v10) {
                  return result;
                }
                return v6("(no active readers)\n", a3);
              }
            }
            size_t v14 = (uint64_t (*)(char *, uint64_t))v6;
            if (*(void *)(i - 16) == -1) {
              snprintf(__str, 0x3FuLL, "%10d %zx -\n");
            }
            else {
              snprintf(__str, 0x3FuLL, "%10d %zx %zu\n");
            }
            if ((v10 & 1) != 0 || (uint64_t result = v14("    pid     thread     txnid\n", a3), (result & 0x80000000) == 0))
            {
              uint64_t result = v14(__str, a3);
              if ((result & 0x80000000) == 0)
              {
                char v10 = 1;
                uint64_t v6 = (uint64_t (*)(const char *, uint64_t))v14;
                if (v11 + v9) {
                  continue;
                }
              }
            }
            break;
          }
        }
        else
        {
          return v6("(no active readers)\n", a3);
        }
      }
      else
      {
        return a2("(no reader locks)\n", a3);
      }
    }
  }
  return result;
}

uint64_t mdb_reader_check(uint64_t a1, _DWORD *a2)
{
  if (!a1) {
    return 22;
  }
  if (a2) {
    *a2 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(sem_t **)(a1 + 232);
  uint64_t v6 = *(unsigned int *)(v4 + 48);
  uint64_t v7 = (unsigned int *)malloc_type_malloc(4 * (v6 + 1), 0x100004052888210uLL);
  if (!v7) {
    return 12;
  }
  uint64_t v8 = v7;
  *uint64_t v7 = 0;
  if (v6)
  {
    uint64_t v9 = 0;
    int v10 = 0;
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = v11 + 128;
    uint64_t v28 = v11 + 136;
    do
    {
      int v13 = *(_DWORD *)(v12 + (v9 << 6) + 8);
      if (v13 && v13 != *(_DWORD *)(a1 + 40))
      {
        uint64_t v14 = *v8;
        if (v14)
        {
          unsigned int v15 = 0;
          unsigned int v16 = *v8;
          do
          {
            while (1)
            {
              unsigned int v17 = v16 >> 1;
              unsigned int v18 = v15 + (v16 >> 1) + 1;
              int v19 = v13 - v8[v18];
              if (v19 >= 0) {
                break;
              }
              v16 >>= 1;
              if (!v17) {
                goto LABEL_19;
              }
            }
            if (!v19) {
              goto LABEL_41;
            }
            v16 += ~v17;
            unsigned int v15 = v18;
          }
          while (v16);
        }
        else
        {
          int v19 = 0;
          unsigned int v18 = 1;
        }
LABEL_19:
        if (v19 > 0) {
          ++v18;
        }
        uint64_t v20 = (v14 + 1);
        *uint64_t v8 = v20;
        if (v20 > v18)
        {
          uint64_t v21 = v20;
          do
            v8[v21--] = v8[v14--];
          while (v18 < (int)v14 + 1);
          uint64_t v20 = v14 + 1;
        }
        v8[v20] = v13;
        if (!sub_263D93574(a1, 7, v13))
        {
          if (v5)
          {
            while (sem_wait(v5))
            {
              uint64_t v22 = *__error();
              if (v22 != 4)
              {
                if (v22) {
                  goto LABEL_48;
                }
                break;
              }
            }
            if (sub_263D93574(a1, 7, v13)) {
              unsigned int v23 = v6;
            }
            else {
              unsigned int v23 = v9;
            }
          }
          else
          {
            unsigned int v23 = v9;
          }
          if (v23 < v6)
          {
            uint64_t v24 = v23;
            int v25 = v6 - v23;
            uint64_t v26 = (_DWORD *)(v28 + (v24 << 6));
            do
            {
              if (*v26 == v13)
              {
                *uint64_t v26 = 0;
                ++v10;
              }
              v26 += 16;
              --v25;
            }
            while (v25);
          }
          if (v5) {
            sem_post(v5);
          }
        }
      }
LABEL_41:
      ++v9;
    }
    while (v9 != v6);
  }
  else
  {
    int v10 = 0;
  }
  uint64_t v22 = 0;
LABEL_48:
  free(v8);
  if (a2) {
    *a2 = v10;
  }
  return v22;
}

uint64_t sub_263D97AE4(uint64_t a1, _DWORD *a2)
{
  uint64_t v6 = 0x300000000;
  long long v5 = xmmword_263D98850;
  do
  {
    if (!fcntl(*(_DWORD *)(a1 + 4), 8, &v5)) {
      goto LABEL_5;
    }
    uint64_t result = *__error();
  }
  while (result == 4);
  if (!result)
  {
LABEL_5:
    LODWORD(result) = 1;
LABEL_6:
    *a2 = result;
    return 0;
  }
  if ((*a2 & 0x80000000) != 0)
  {
    WORD2(v6) = 1;
    while (1)
    {
      LODWORD(result) = fcntl(*(_DWORD *)(a1 + 4), 9, &v5);
      if (!result) {
        goto LABEL_6;
      }
      uint64_t result = *__error();
      if (result != 4)
      {
        if (!result) {
          goto LABEL_6;
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t sub_263D97BA8(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(unsigned int *)(a1 + 16);
  long long v5 = (char *)malloc_type_calloc(2uLL, v4, 0x8B3C1D53uLL);
  if (!v5) {
    return 12;
  }
  uint64_t v6 = v5;
  *(void *)long long v5 = 0;
  *((_WORD *)v5 + 5) = 8;
  *((_OWORD *)v5 + 1) = *(_OWORD *)a2;
  long long v7 = *(_OWORD *)(a2 + 16);
  long long v8 = *(_OWORD *)(a2 + 32);
  long long v9 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v5 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v5 + 4) = v9;
  *((_OWORD *)v5 + 3) = v8;
  *((_OWORD *)v5 + 2) = v7;
  long long v10 = *(_OWORD *)(a2 + 80);
  long long v11 = *(_OWORD *)(a2 + 96);
  long long v12 = *(_OWORD *)(a2 + 112);
  *((void *)v5 + 18) = *(void *)(a2 + 128);
  *((_OWORD *)v5 + 8) = v12;
  *((_OWORD *)v5 + 7) = v11;
  *((_OWORD *)v5 + 6) = v10;
  int v13 = &v5[v4];
  *(void *)int v13 = 1;
  *((_WORD *)v13 + 5) = 8;
  *((_OWORD *)v13 + 1) = *(_OWORD *)a2;
  long long v14 = *(_OWORD *)(a2 + 16);
  long long v15 = *(_OWORD *)(a2 + 32);
  long long v16 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v13 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v13 + 4) = v16;
  *((_OWORD *)v13 + 3) = v15;
  *((_OWORD *)v13 + 2) = v14;
  long long v17 = *(_OWORD *)(a2 + 80);
  long long v18 = *(_OWORD *)(a2 + 96);
  long long v19 = *(_OWORD *)(a2 + 112);
  *((void *)v13 + 18) = *(void *)(a2 + 128);
  *((_OWORD *)v13 + 8) = v19;
  *((_OWORD *)v13 + 7) = v18;
  *((_OWORD *)v13 + 6) = v17;
  size_t v20 = (2 * v4);
  while (1)
  {
    int v21 = pwrite(*(_DWORD *)a1, v6, v20, 0);
    if (v21 != -1) {
      break;
    }
    if (*__error() != 4) {
      goto LABEL_11;
    }
  }
  if (v21 < 0)
  {
LABEL_11:
    uint64_t v22 = *__error();
    goto LABEL_12;
  }
  if (v20 == v21) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = 28;
  }
LABEL_12:
  free(v6);
  return v22;
}

uint64_t sub_263D97D04(uint64_t a1)
{
  sigset_t v18 = 4096;
  int v2 = pthread_sigmask(1, &v18, 0);
  if (v2) {
    *(_DWORD *)(a1 + 196) = v2;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  for (uint64_t i = 0; ; i ^= 1uLL)
  {
    while (1)
    {
      int v4 = *(_DWORD *)(a1 + 192);
      if (v4) {
        break;
      }
      pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    }
    if (v4 == 16) {
      break;
    }
    uint64_t v5 = a1 + 4 * i;
    int v8 = *(_DWORD *)(v5 + 160);
    uint64_t v6 = (_DWORD *)(v5 + 160);
    int v7 = v8;
    uint64_t v9 = a1 + 8 * i;
    long long v10 = *(char **)(v9 + 128);
    long long v11 = v6 + 2;
    long long v12 = (const void **)(v9 + 144);
    while (1)
    {
      if (v7 >= 1)
      {
        while (1)
        {
          if (*(_DWORD *)(a1 + 196)) {
            goto LABEL_20;
          }
          unsigned int v13 = write(*(_DWORD *)(a1 + 184), v10, v7);
          if ((v13 & 0x80000000) != 0) {
            break;
          }
          if (!v13)
          {
            int v15 = 5;
LABEL_19:
            *(_DWORD *)(a1 + 196) = v15;
            goto LABEL_20;
          }
          v10 += v13;
          BOOL v14 = __OFSUB__(v7, v13);
          v7 -= v13;
          if ((v7 < 0) ^ v14 | (v7 == 0)) {
            goto LABEL_20;
          }
        }
        int v15 = *__error();
        if (!v15) {
          goto LABEL_20;
        }
        if (v15 == 32)
        {
          int v17 = 0;
          sigwait(&v18, &v17);
          int v15 = 32;
        }
        goto LABEL_19;
      }
LABEL_20:
      int v7 = *v11;
      if (!*v11) {
        break;
      }
      long long v10 = (char *)*v12;
      *long long v11 = 0;
    }
    _DWORD *v6 = 0;
    --*(_DWORD *)(a1 + 192);
    pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t sub_263D97E64(uint64_t a1, unint64_t *a2, char a3)
{
  uint64_t v70 = 0;
  memset(v69, 0, sizeof(v69));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  unint64_t v4 = *a2;
  if (v4 == -1) {
    return 0;
  }
  LOWORD(v69[0]) = 1;
  *((void *)&v66 + 1) = *(void *)(a1 + 8);
  uint64_t v7 = sub_263D903E0(*((uint64_t **)&v66 + 1), v4, (unint64_t *)v69 + 1, 0);
  if (!v7)
  {
    uint64_t v7 = sub_263D93D1C((uint64_t)&v65, 0, 4);
    if (!v7)
    {
      int v8 = malloc_type_malloc(*(_DWORD *)(*(void *)a1 + 16) * LOWORD(v69[0]), 0x4594012uLL);
      if (v8)
      {
        uint64_t v9 = v8;
        unsigned __int16 v10 = WORD1(v69[0]);
        if (WORD1(v69[0]))
        {
          unint64_t v11 = 0;
          LODWORD(v12) = *(_DWORD *)(*(void *)a1 + 16);
          unsigned int v13 = (char *)v8;
          do
          {
            sub_263D93EFC(v13, *((_WORD **)v69 + v11 + 1), v12);
            *((void *)v69 + v11 + 1) = v13;
            uint64_t v12 = *(unsigned int *)(*(void *)a1 + 16);
            v13 += v12;
            ++v11;
            unsigned __int16 v10 = WORD1(v69[0]);
          }
          while (v11 < WORD1(v69[0]));
        }
        else
        {
          unsigned int v13 = (char *)v8;
        }
        if (LOWORD(v69[0]))
        {
          uint64_t v15 = *(unsigned int *)(a1 + 188);
          int v60 = a3 & 4;
          long long v59 = v9;
          while (1)
          {
            long long v16 = (_WORD *)*((void *)v69 + v10 + 1);
            pthread_t v64 = v16;
            unsigned int v17 = (unsigned __int16)v16[6] - 16;
            unsigned int v18 = v17 >> 1;
            __int16 v19 = v16[5];
            if ((v19 & 2) != 0)
            {
              if (v19 & 0x20 | v60) {
                BOOL v27 = 0;
              }
              else {
                BOOL v27 = v17 >= 2;
              }
              if (v27)
              {
                if (v18 <= 1) {
                  uint64_t v36 = 1;
                }
                else {
                  uint64_t v36 = v18;
                }
                uint64_t v37 = -v36;
                for (uint64_t i = 8; v37 + i != 8; ++i)
                {
                  uint64_t v39 = v64;
                  long long v40 = (char *)v64 + *((unsigned __int16 *)v64 + i);
                  __int16 v41 = *((_WORD *)v40 + 2);
                  if (v41)
                  {
                    __src[0] = 0;
                    if (v64 != v13)
                    {
                      *((void *)v69 + WORD1(v69[0]) + 1) = v13;
                      sub_263D93EFC(v13, v39, *(_DWORD *)(*(void *)a1 + 16));
                      pthread_t v64 = v13;
                      long long v40 = &v13[*(unsigned __int16 *)&v13[2 * i]];
                    }
                    long long v48 = &v40[*((unsigned __int16 *)v40 + 3)];
                    unint64_t v49 = *((void *)v48 + 1);
                    *((void *)v48 + 1) = *(void *)(a1 + 176);
                    uint64_t v23 = sub_263D903E0(*((uint64_t **)&v66 + 1), v49, (unint64_t *)__src, 0);
                    if (v23) {
                      goto LABEL_59;
                    }
                    int v50 = *(_DWORD *)(a1 + 4 * (int)v15 + 160);
                    if (v50 >= 0x100000)
                    {
                      uint64_t v23 = sub_263D98424(a1, 1);
                      if (v23) {
                        goto LABEL_59;
                      }
                      uint64_t v52 = *(int *)(a1 + 188);
                      int v50 = *(_DWORD *)(a1 + 4 * v52 + 160);
                      uint64_t v51 = *(unsigned int *)(a1 + 188);
                    }
                    else
                    {
                      uint64_t v51 = v15;
                      uint64_t v52 = (int)v15;
                    }
                    uint64_t v53 = a1 + 8 * v52;
                    uint64_t v54 = a1 + 4 * v52;
                    long long v55 = (void *)(*(void *)(v53 + 128) + v50);
                    long long v56 = (unsigned int *)__src[0];
                    memcpy(v55, __src[0], *(unsigned int *)(*(void *)a1 + 16));
                    *long long v55 = *(void *)(a1 + 176);
                    *(void *)(a1 + 176) += v56[3];
                    uint64_t v57 = *(void *)a1;
                    *(_DWORD *)(v54 + 160) += *(_DWORD *)(*(void *)a1 + 16);
                    unsigned int v58 = v56[3];
                    if (v58 >= 2)
                    {
                      *(_DWORD *)(v54 + 168) = *(_DWORD *)(v57 + 16) * (v58 - 1);
                      *(void *)(v53 + 144) = (char *)v56 + *(unsigned int *)(v57 + 16);
                      uint64_t v23 = sub_263D98424(a1, 1);
                      if (v23) {
                        goto LABEL_59;
                      }
                      uint64_t v51 = *(unsigned int *)(a1 + 188);
                    }
                    uint64_t v15 = v51;
                  }
                  else if ((v41 & 2) != 0)
                  {
                    long long v62 = 0u;
                    long long v63 = 0u;
                    *(_OWORD *)__src = 0u;
                    if (v64 != v13)
                    {
                      *((void *)v69 + WORD1(v69[0]) + 1) = v13;
                      sub_263D93EFC(v13, v39, *(_DWORD *)(*(void *)a1 + 16));
                      pthread_t v64 = v13;
                      long long v40 = &v13[*(unsigned __int16 *)&v13[2 * i]];
                    }
                    uint64_t v42 = &v40[*((unsigned __int16 *)v40 + 3) + 8];
                    long long v43 = *(_OWORD *)v42;
                    long long v44 = *((_OWORD *)v42 + 2);
                    long long v62 = *((_OWORD *)v42 + 1);
                    long long v63 = v44;
                    *(_OWORD *)__src = v43;
                    *(_DWORD *)(a1 + 188) = v15;
                    uint64_t v23 = sub_263D97E64(a1, (char *)&v63 + 8, *((_WORD *)v40 + 2) & 4);
                    if (v23) {
                      goto LABEL_59;
                    }
                    uint64_t v15 = *(unsigned int *)(a1 + 188);
                    uint64_t v45 = &v40[*((unsigned __int16 *)v40 + 3) + 8];
                    long long v47 = v62;
                    long long v46 = v63;
                    *(_OWORD *)uint64_t v45 = *(_OWORD *)__src;
                    *((_OWORD *)v45 + 1) = v47;
                    *((_OWORD *)v45 + 2) = v46;
                  }
                }
              }
            }
            else
            {
              size_t v20 = (char *)&v65 + 2 * v10;
              unsigned __int16 v21 = *((_WORD *)v20 + 164) + 1;
              *((_WORD *)v20 + 164) = v21;
              if (v18 > v21)
              {
                for (j = (char *)v16 + (unsigned __int16)v16[v21 + 8];
                      ;
                      j = &v25[*(unsigned __int16 *)&v25[2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 4) + 16]])
                {
                  uint64_t v23 = sub_263D903E0(*((uint64_t **)&v66 + 1), *(unsigned int *)j | ((unint64_t)*((unsigned __int16 *)j + 2) << 32), (unint64_t *)&v64, 0);
                  if (v23) {
                    break;
                  }
                  unsigned __int16 v10 = WORD1(v69[0]) + 1;
                  WORD1(v69[0]) = v10;
                  __int16 v24 = ++LOWORD(v69[0]);
                  *((_WORD *)&v69[16] + v10 + 4) = 0;
                  int v25 = (char *)v64;
                  uint64_t v26 = (char **)v69 + v10 + 1;
                  if ((*((_WORD *)v64 + 5) & 1) == 0)
                  {
                    *uint64_t v26 = (char *)v64;
                    goto LABEL_31;
                  }
                  sub_263D93EFC(*v26, v64, *(_DWORD *)(*(void *)a1 + 16));
                }
LABEL_59:
                uint64_t v7 = v23;
                goto LABEL_60;
              }
            }
            int v28 = *(_DWORD *)(a1 + 4 * (int)v15 + 160);
            if (v28 >= 0x100000)
            {
              uint64_t v23 = sub_263D98424(a1, 1);
              if (v23) {
                goto LABEL_59;
              }
              uint64_t v29 = *(int *)(a1 + 188);
              int v28 = *(_DWORD *)(a1 + 4 * v29 + 160);
              uint64_t v15 = *(unsigned int *)(a1 + 188);
            }
            else
            {
              uint64_t v29 = (int)v15;
            }
            uint64_t v30 = a1 + 4 * v29;
            uint64_t v31 = *(void *)(a1 + 8 * v29 + 128) + v28;
            sub_263D93EFC((char *)v31, v64, *(_DWORD *)(*(void *)a1 + 16));
            uint64_t v32 = *(void *)(a1 + 176);
            *(void *)(a1 + 176) = v32 + 1;
            *(void *)uint64_t v31 = v32;
            *(_DWORD *)(v30 + 160) += *(_DWORD *)(*(void *)a1 + 16);
            __int16 v33 = WORD1(v69[0]);
            if (!WORD1(v69[0]))
            {
              uint64_t v7 = 0;
              *a2 = *(void *)v31;
              goto LABEL_60;
            }
            uint64_t v34 = *((void *)v69 + WORD1(v69[0]));
            uint64_t v35 = v34
                + *(unsigned __int16 *)(v34
                                      + 2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 3)
                                      + 16);
            *(_DWORD *)uint64_t v35 = *(void *)v31;
            *(_WORD *)(v35 + 4) = *(_DWORD *)(v31 + 4);
            if (!LOWORD(v69[0])) {
              goto LABEL_63;
            }
            if (!--LOWORD(v69[0])) {
              break;
            }
            unsigned __int16 v10 = v33 - 1;
            WORD1(v69[0]) = v10;
            __int16 v24 = 1;
LABEL_31:
            if (!v24)
            {
LABEL_63:
              uint64_t v7 = 0;
              goto LABEL_60;
            }
          }
          uint64_t v7 = 0;
          DWORD1(v69[0]) &= ~1u;
LABEL_60:
          uint64_t v9 = v59;
        }
        else
        {
          uint64_t v7 = 0;
        }
        free(v9);
      }
      else
      {
        return 12;
      }
    }
  }
  return v7;
}

uint64_t sub_263D98424(uint64_t a1, int a2)
{
  unint64_t v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  *(_DWORD *)(a1 + 192) += a2;
  pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  while ((*(unsigned char *)(a1 + 192) & 2) != 0)
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), v4);
  pthread_mutex_unlock(v4);
  int v5 = *(_DWORD *)(a1 + 188) ^ a2 & 1;
  *(_DWORD *)(a1 + 188) = v5;
  *(_DWORD *)(a1 + 4 * v5 + 160) = 0;
  return *(unsigned int *)(a1 + 196);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5E0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_key_delete(pthread_key_t a1)
{
  return MEMORY[0x270EDAF20](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x270EDB058](*(void *)&a1, a2, a3);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x270EDB330](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x270EDB348](a1, *(void *)&a2);
}

int sem_post(sem_t *a1)
{
  return MEMORY[0x270EDB350](a1);
}

int sem_unlink(const char *a1)
{
  return MEMORY[0x270EDB360](a1);
}

int sem_wait(sem_t *a1)
{
  return MEMORY[0x270EDB368](a1);
}

int sigwait(const sigset_t *a1, int *a2)
{
  return MEMORY[0x270EDB4E0](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
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

uint64_t sysconf(int a1)
{
  return MEMORY[0x270EDB7C8](*(void *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}