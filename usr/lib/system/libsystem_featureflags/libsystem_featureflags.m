char *_os_feature_enabled_envvar_check_once(unsigned char *a1)
{
  char *result;

  result = getenv("FEATUREFLAGS_ENABLED");
  if (result || (result = getenv("FEATUREFLAGS_DISABLED")) != 0) {
    *a1 = 1;
  }
  return result;
}

uint64_t _os_feature_table_once(void *a1)
{
  uint64_t result = shm_open("com.apple.featureflags.shm", 0);
  if ((result & 0x80000000) == 0)
  {
    int v3 = result;
    memset(&v5, 0, sizeof(v5));
    if ((fstat(result, &v5) & 0x80000000) == 0)
    {
      v4 = mmap(0, v5.st_size, 1, 1, v3, 0);
      if (v4 != (void *)-1)
      {
        if (v5.st_size >= 0x20uLL && *v4 == 0x47414C4654414546 && (unint64_t)(8 * v4[2] + 32) <= v5.st_size) {
          *a1 = v4;
        }
        else {
          munmap(v4, v5.st_size);
        }
      }
    }
    return close(v3);
  }
  return result;
}

BOOL _os_feature_enabled_simple_impl(const char *a1, const char *a2, BOOL a3)
{
  uint64_t v6 = _os_feature_table();
  if (!v6) {
    return a3;
  }
  uint64_t v7 = v6;
  size_t v8 = strlen(a1);
  size_t v9 = strlen(a2);
  unint64_t v10 = v8 + v9 + 1;
  unint64_t v11 = *(void *)(v7 + 24) ^ (0xC6A4A7935BD1E995 * v10);
  unint64_t v56 = v10;
  unint64_t v57 = v11;
  long long v58 = 0u;
  long long v59 = 0u;
  if (v10 < v8) {
    uint64_t v12 = v8 + v9 + 1;
  }
  else {
    uint64_t v12 = v8;
  }
  unint64_t v13 = (unint64_t)&a1[v12];
  if (v12 >= 16)
  {
    v15 = a1;
    do
    {
      unint64_t v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995
              * ((0xC6A4A7935BD1E995 * *(void *)v15) ^ ((0xC6A4A7935BD1E995 * *(void *)v15) >> 47))) ^ v11)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((void *)v15 + 1)) ^ ((0xC6A4A7935BD1E995 * *((void *)v15 + 1)) >> 47))));
      v14 = v15 + 16;
      v16 = v15 + 32;
      v15 += 16;
    }
    while ((unint64_t)v16 <= v13);
  }
  else
  {
    v14 = a1;
  }
  if ((unint64_t)(v14 + 8) <= v13)
  {
    do
    {
      v17 = v14 + 8;
      unint64_t v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995 * *(void *)v14) ^ ((0xC6A4A7935BD1E995 * *(void *)v14) >> 47))) ^ v11);
      BOOL v18 = (unint64_t)(v14 + 16) > v13;
      v14 += 8;
    }
    while (!v18);
  }
  else
  {
    v17 = v14;
  }
  if ((unint64_t)v17 >= v13)
  {
    uint64_t v20 = 0;
    unsigned int v19 = 0;
  }
  else
  {
    unsigned int v19 = 0;
    uint64_t v20 = 0;
    int64_t v21 = &a1[v12] - v17;
    do
    {
      unsigned int v22 = *(unsigned __int8 *)v17++;
      v20 |= (unint64_t)v22 << v19;
      v19 += 8;
      --v21;
    }
    while (v21);
  }
  unint64_t v23 = v10 - v12;
  unint64_t v56 = v23;
  unint64_t v57 = v11;
  *(void *)&long long v58 = v20;
  DWORD2(v58) = v19;
  BOOL v24 = v10 > v8;
  if (v10 <= v8) {
    v25 = &sep;
  }
  else {
    v25 = (uint64_t *)((char *)&sep + 1);
  }
  if (v19)
  {
    if (v10 <= v8 || v19 > 0x3F)
    {
      if (v19 < 0x40) {
        goto LABEL_45;
      }
      v27 = &sep;
    }
    else
    {
      uint64_t v26 = 0;
      v27 = &sep;
      do
      {
        unint64_t v28 = v19 + v26;
        unsigned int v29 = *(unsigned __int8 *)v27;
        v27 = (uint64_t *)((char *)v27 + 1);
        v20 |= (unint64_t)v29 << (v19 + v26);
        v26 += 8;
      }
      while (v27 < v25 && v28 < 0x38);
      if (v28 <= 0x37)
      {
        v19 += v26;
        goto LABEL_45;
      }
    }
    unint64_t v30 = 0xC6A4A7935BD1E995 * v20;
    uint64_t v20 = 0;
    unint64_t v11 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v30 ^ (v30 >> 47))) ^ v11);
  }
  else
  {
    v27 = &sep;
  }
  if (v27 + 2 <= v25)
  {
    do
    {
      unint64_t v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v27) ^ ((0xC6A4A7935BD1E995 * *v27) >> 47))) ^ v11)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v27[1]) ^ ((0xC6A4A7935BD1E995 * v27[1]) >> 47))));
      v31 = v27 + 2;
      v32 = v27 + 4;
      v27 += 2;
    }
    while (v32 <= v25);
  }
  else
  {
    v31 = v27;
  }
  if (v31 + 1 <= v25)
  {
    do
    {
      v33 = (char *)(v31 + 1);
      unint64_t v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v31) ^ ((0xC6A4A7935BD1E995 * *v31) >> 47))) ^ v11);
      BOOL v18 = v31 + 2 > v25;
      ++v31;
    }
    while (!v18);
  }
  else
  {
    v33 = (char *)v31;
  }
  if (v33 >= (char *)v25)
  {
    unsigned int v19 = 0;
  }
  else
  {
    unsigned int v19 = 0;
    v34 = (char *)((char *)&sep + v24 - v33);
    do
    {
      unsigned int v35 = *v33++;
      v20 |= (unint64_t)v35 << v19;
      v19 += 8;
      --v34;
    }
    while (v34);
  }
LABEL_45:
  size_t v36 = v23 - v24;
  unint64_t v56 = v36;
  unint64_t v57 = v11;
  *(void *)&long long v58 = v20;
  DWORD2(v58) = v19;
  if (v36 >= v9) {
    uint64_t v37 = v9;
  }
  else {
    uint64_t v37 = v36;
  }
  unint64_t v38 = (unint64_t)&a2[v37];
  if (v19)
  {
    if (v37 < 1 || v19 > 0x3F)
    {
      v40 = a2;
      if (v19 < 0x40) {
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v39 = 0;
      v40 = a2;
      do
      {
        unint64_t v41 = v19 + v39;
        unsigned int v42 = *(unsigned __int8 *)v40++;
        v20 |= (unint64_t)v42 << (v19 + v39);
        v39 += 8;
      }
      while ((unint64_t)v40 < v38 && v41 < 0x38);
      if (v41 <= 0x37)
      {
        v19 += v39;
        goto LABEL_71;
      }
    }
    unint64_t v43 = 0xC6A4A7935BD1E995 * v20;
    uint64_t v20 = 0;
    unint64_t v11 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v43 ^ (v43 >> 47))) ^ v11);
  }
  else
  {
    v40 = a2;
  }
  if ((unint64_t)(v40 + 16) <= v38)
  {
    do
    {
      unint64_t v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995
              * ((0xC6A4A7935BD1E995 * *(void *)v40) ^ ((0xC6A4A7935BD1E995 * *(void *)v40) >> 47))) ^ v11)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((void *)v40 + 1)) ^ ((0xC6A4A7935BD1E995 * *((void *)v40 + 1)) >> 47))));
      v44 = v40 + 16;
      v45 = v40 + 32;
      v40 += 16;
    }
    while ((unint64_t)v45 <= v38);
  }
  else
  {
    v44 = v40;
  }
  if ((unint64_t)(v44 + 8) <= v38)
  {
    do
    {
      v46 = v44 + 8;
      unint64_t v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995 * *(void *)v44) ^ ((0xC6A4A7935BD1E995 * *(void *)v44) >> 47))) ^ v11);
      BOOL v18 = (unint64_t)(v44 + 16) > v38;
      v44 += 8;
    }
    while (!v18);
  }
  else
  {
    v46 = v44;
  }
  if ((unint64_t)v46 >= v38)
  {
    unsigned int v19 = 0;
  }
  else
  {
    unsigned int v19 = 0;
    int64_t v47 = v46 - a2 - v37;
    do
    {
      unsigned int v48 = *(unsigned __int8 *)v46++;
      v20 |= (unint64_t)v48 << v19;
      v19 += 8;
      ++v47;
    }
    while (v47);
  }
LABEL_71:
  unint64_t v56 = v36 - v37;
  unint64_t v57 = v11;
  *(void *)&long long v58 = v20;
  DWORD2(v58) = v19;
  unint64_t v49 = simple_hash_final((uint64_t)&v56);
  uint64_t v50 = *(void *)(v7 + 16);
  if (!v50) {
    return 0;
  }
  uint64_t v51 = 0;
  uint64_t v52 = v50 - 1;
  while (1)
  {
    a3 = v51 <= v52;
    if (v51 > v52) {
      break;
    }
    uint64_t v53 = (v52 + v51) >> 1;
    unint64_t v54 = *(void *)(v7 + 32 + 8 * v53);
    if (v54 < v49)
    {
      uint64_t v51 = v53 + 1;
    }
    else
    {
      uint64_t v52 = v53 - 1;
      if (v54 <= v49) {
        return a3;
      }
    }
  }
  return a3;
}

BOOL _os_feature_enabled_impl(const char *a1, const char *a2)
{
  if (_os_feature_enabled_impl_envvar_once != -1) {
    _os_once();
  }
  uint64_t v4 = _os_feature_table();
  if (!v4 || _os_feature_enabled_impl__os_feature_enabled_envvar_present)
  {
    return _os_feature_enabled_SLOWPATH(a1, a2);
  }
  uint64_t v5 = v4;
  size_t v6 = strlen(a1);
  size_t v7 = strlen(a2);
  unint64_t v8 = v6 + v7 + 1;
  unint64_t v9 = *(void *)(v5 + 24) ^ (0xC6A4A7935BD1E995 * v8);
  unint64_t v54 = v8;
  unint64_t v55 = v9;
  long long v56 = 0u;
  long long v57 = 0u;
  if (v8 < v6) {
    uint64_t v10 = v6 + v7 + 1;
  }
  else {
    uint64_t v10 = v6;
  }
  unint64_t v11 = (unint64_t)&a1[v10];
  if (v10 >= 16)
  {
    unint64_t v13 = a1;
    do
    {
      unint64_t v9 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(void *)v13) ^ ((0xC6A4A7935BD1E995 * *(void *)v13) >> 47))) ^ v9)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((void *)v13 + 1)) ^ ((0xC6A4A7935BD1E995 * *((void *)v13 + 1)) >> 47))));
      uint64_t v12 = v13 + 16;
      v14 = v13 + 32;
      v13 += 16;
    }
    while ((unint64_t)v14 <= v11);
  }
  else
  {
    uint64_t v12 = a1;
  }
  if ((unint64_t)(v12 + 8) <= v11)
  {
    do
    {
      v15 = v12 + 8;
      unint64_t v9 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995 * *(void *)v12) ^ ((0xC6A4A7935BD1E995 * *(void *)v12) >> 47))) ^ v9);
      BOOL v16 = (unint64_t)(v12 + 16) > v11;
      v12 += 8;
    }
    while (!v16);
  }
  else
  {
    v15 = v12;
  }
  if ((unint64_t)v15 >= v11)
  {
    uint64_t v18 = 0;
    unsigned int v17 = 0;
  }
  else
  {
    unsigned int v17 = 0;
    uint64_t v18 = 0;
    int64_t v19 = &a1[v10] - v15;
    do
    {
      unsigned int v20 = *(unsigned __int8 *)v15++;
      v18 |= (unint64_t)v20 << v17;
      v17 += 8;
      --v19;
    }
    while (v19);
  }
  unint64_t v21 = v8 - v10;
  unint64_t v54 = v21;
  unint64_t v55 = v9;
  *(void *)&long long v56 = v18;
  DWORD2(v56) = v17;
  BOOL v22 = v8 > v6;
  if (v8 <= v6) {
    unint64_t v23 = &sep;
  }
  else {
    unint64_t v23 = (uint64_t *)((char *)&sep + 1);
  }
  if (v17)
  {
    if (v8 <= v6 || v17 > 0x3F)
    {
      if (v17 < 0x40) {
        goto LABEL_48;
      }
      v25 = &sep;
    }
    else
    {
      uint64_t v24 = 0;
      v25 = &sep;
      do
      {
        unint64_t v26 = v17 + v24;
        unsigned int v27 = *(unsigned __int8 *)v25;
        v25 = (uint64_t *)((char *)v25 + 1);
        v18 |= (unint64_t)v27 << (v17 + v24);
        v24 += 8;
      }
      while (v25 < v23 && v26 < 0x38);
      if (v26 <= 0x37)
      {
        v17 += v24;
        goto LABEL_48;
      }
    }
    unint64_t v28 = 0xC6A4A7935BD1E995 * v18;
    uint64_t v18 = 0;
    unint64_t v9 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v28 ^ (v28 >> 47))) ^ v9);
  }
  else
  {
    v25 = &sep;
  }
  if (v25 + 2 <= v23)
  {
    do
    {
      unint64_t v9 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v25) ^ ((0xC6A4A7935BD1E995 * *v25) >> 47))) ^ v9)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v25[1]) ^ ((0xC6A4A7935BD1E995 * v25[1]) >> 47))));
      unsigned int v29 = v25 + 2;
      unint64_t v30 = v25 + 4;
      v25 += 2;
    }
    while (v30 <= v23);
  }
  else
  {
    unsigned int v29 = v25;
  }
  if (v29 + 1 <= v23)
  {
    do
    {
      v31 = (char *)(v29 + 1);
      unint64_t v9 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v29) ^ ((0xC6A4A7935BD1E995 * *v29) >> 47))) ^ v9);
      BOOL v16 = v29 + 2 > v23;
      ++v29;
    }
    while (!v16);
  }
  else
  {
    v31 = (char *)v29;
  }
  if (v31 >= (char *)v23)
  {
    unsigned int v17 = 0;
  }
  else
  {
    unsigned int v17 = 0;
    v32 = (char *)((char *)&sep + v22 - v31);
    do
    {
      unsigned int v33 = *v31++;
      v18 |= (unint64_t)v33 << v17;
      v17 += 8;
      --v32;
    }
    while (v32);
  }
LABEL_48:
  size_t v34 = v21 - v22;
  unint64_t v54 = v34;
  unint64_t v55 = v9;
  *(void *)&long long v56 = v18;
  DWORD2(v56) = v17;
  if (v34 >= v7) {
    uint64_t v35 = v7;
  }
  else {
    uint64_t v35 = v34;
  }
  unint64_t v36 = (unint64_t)&a2[v35];
  if (!v17)
  {
    unint64_t v38 = a2;
LABEL_62:
    if ((unint64_t)(v38 + 16) <= v36)
    {
      do
      {
        unint64_t v9 = 0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995 * *(void *)v38) ^ ((0xC6A4A7935BD1E995 * *(void *)v38) >> 47))) ^ v9)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((void *)v38 + 1)) ^ ((0xC6A4A7935BD1E995 * *((void *)v38 + 1)) >> 47))));
        unsigned int v42 = v38 + 16;
        unint64_t v43 = v38 + 32;
        v38 += 16;
      }
      while ((unint64_t)v43 <= v36);
    }
    else
    {
      unsigned int v42 = v38;
    }
    if ((unint64_t)(v42 + 8) <= v36)
    {
      do
      {
        v44 = v42 + 8;
        unint64_t v9 = 0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(void *)v42) ^ ((0xC6A4A7935BD1E995 * *(void *)v42) >> 47))) ^ v9);
        BOOL v16 = (unint64_t)(v42 + 16) > v36;
        v42 += 8;
      }
      while (!v16);
    }
    else
    {
      v44 = v42;
    }
    if ((unint64_t)v44 >= v36)
    {
      unsigned int v17 = 0;
    }
    else
    {
      unsigned int v17 = 0;
      int64_t v45 = v44 - a2 - v35;
      do
      {
        unsigned int v46 = *(unsigned __int8 *)v44++;
        v18 |= (unint64_t)v46 << v17;
        v17 += 8;
        ++v45;
      }
      while (v45);
    }
    goto LABEL_74;
  }
  if (v35 < 1 || v17 > 0x3F)
  {
    unint64_t v38 = a2;
    if (v17 < 0x40) {
      goto LABEL_74;
    }
    goto LABEL_61;
  }
  uint64_t v37 = 0;
  unint64_t v38 = a2;
  do
  {
    unint64_t v39 = v17 + v37;
    unsigned int v40 = *(unsigned __int8 *)v38++;
    v18 |= (unint64_t)v40 << (v17 + v37);
    v37 += 8;
  }
  while ((unint64_t)v38 < v36 && v39 < 0x38);
  if (v39 > 0x37)
  {
LABEL_61:
    unint64_t v41 = 0xC6A4A7935BD1E995 * v18;
    uint64_t v18 = 0;
    unint64_t v9 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v41 ^ (v41 >> 47))) ^ v9);
    goto LABEL_62;
  }
  v17 += v37;
LABEL_74:
  unint64_t v54 = v34 - v35;
  unint64_t v55 = v9;
  *(void *)&long long v56 = v18;
  DWORD2(v56) = v17;
  unint64_t v47 = simple_hash_final((uint64_t)&v54);
  uint64_t v48 = *(void *)(v5 + 16);
  if (v48)
  {
    uint64_t v49 = 0;
    uint64_t v50 = v48 - 1;
    while (1)
    {
      uint64_t v48 = v49 <= v50;
      if (v49 > v50) {
        break;
      }
      uint64_t v51 = (v50 + v49) >> 1;
      unint64_t v52 = *(void *)(v5 + 32 + 8 * v51);
      if (v52 < v47)
      {
        uint64_t v49 = v51 + 1;
      }
      else
      {
        uint64_t v50 = v51 - 1;
        if (v52 <= v47) {
          return v48;
        }
      }
    }
  }
  return v48;
}

unint64_t simple_hash_final(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F14BF8];
  unint64_t v1 = *(void *)a1;
  if (!*(void *)a1)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    if (!*(_DWORD *)(a1 + 24)) {
      return (0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) >> 47);
    }
    goto LABEL_61;
  }
  memset(v29, 0, sizeof(v29));
  if (v1 > 0x1F)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(a1 + 16);
    unint64_t v4 = v1;
    unsigned int v5 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      uint64_t v6 = v1 >= 0x20 ? 32 : v1;
      size_t v7 = (char *)v29 + v6;
      if (!v5) {
        break;
      }
      if (v6 && v5 <= 0x3F)
      {
        uint64_t v8 = 0;
        unint64_t v9 = (char *)v29;
        do
        {
          unint64_t v10 = v5 + v8;
          unsigned int v11 = *v9++;
          v3 |= (unint64_t)v11 << (v5 + v8);
          v8 += 8;
        }
        while (v9 < v7 && v10 < 0x38);
        if (v10 > 0x37) {
          goto LABEL_18;
        }
        v5 += v8;
      }
      else if (v5 >= 0x40)
      {
        unint64_t v9 = (char *)v29;
LABEL_18:
        unint64_t v12 = 0xC6A4A7935BD1E995 * v3;
        uint64_t v3 = 0;
        unint64_t v2 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ v2);
LABEL_19:
        unint64_t v13 = v9 + 16;
        while (v13 <= v7)
        {
          unint64_t v2 = 0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995
                 * ((0xC6A4A7935BD1E995 * *(void *)v9) ^ ((0xC6A4A7935BD1E995 * *(void *)v9) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((void *)v9 + 1)) ^ ((0xC6A4A7935BD1E995 * *((void *)v9 + 1)) >> 47))));
          unint64_t v13 = v9 + 32;
          v9 += 16;
        }
        if (v9 + 8 <= v7)
        {
          do
          {
            unint64_t v2 = 0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995
                 * ((0xC6A4A7935BD1E995 * *(void *)v9) ^ ((0xC6A4A7935BD1E995 * *(void *)v9) >> 47))) ^ v2);
            BOOL v14 = v9 + 16 > v7;
            v9 += 8;
          }
          while (!v14);
        }
        if (v9 >= v7)
        {
          unsigned int v5 = 0;
        }
        else
        {
          unsigned int v5 = 0;
          v15 = (char *)((char *)v29 + v6 - v9);
          do
          {
            unsigned int v16 = *v9++;
            v3 |= (unint64_t)v16 << v5;
            v5 += 8;
            --v15;
          }
          while (v15);
        }
      }
      v1 -= v6;
      v4 -= 32;
      if (v4 <= 0x1F)
      {
        *(void *)a1 = v1;
        *(void *)(a1 + 8) = v2;
        *(void *)(a1 + 16) = v3;
        *(_DWORD *)(a1 + 24) = v5;
        goto LABEL_35;
      }
    }
    unint64_t v9 = (char *)v29;
    goto LABEL_19;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t v4 = v1;
  unsigned int v5 = *(_DWORD *)(a1 + 24);
LABEL_35:
  if (v1 < v4) {
    unint64_t v4 = v1;
  }
  unsigned int v17 = (unsigned __int8 *)v29;
  uint64_t v18 = (unsigned __int8 *)v29 + v4;
  if (v5)
  {
    if (v4 && v5 <= 0x3F)
    {
      uint64_t v19 = 0;
      unsigned int v17 = (unsigned __int8 *)v29;
      do
      {
        unint64_t v20 = v5 + v19;
        unsigned int v21 = *v17++;
        v3 |= (unint64_t)v21 << (v5 + v19);
        v19 += 8;
      }
      while (v17 < v18 && v20 < 0x38);
      if (v20 <= 0x37)
      {
        v5 += v19;
        goto LABEL_60;
      }
    }
    else
    {
      if (v5 < 0x40) {
        goto LABEL_60;
      }
      unsigned int v17 = (unsigned __int8 *)v29;
    }
    unint64_t v22 = 0xC6A4A7935BD1E995 * v3;
    uint64_t v3 = 0;
    unint64_t v2 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v22 ^ (v22 >> 47))) ^ v2);
  }
  if (v17 + 16 <= v18)
  {
    do
    {
      unint64_t v2 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(void *)v17) ^ ((0xC6A4A7935BD1E995 * *(void *)v17) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((void *)v17 + 1)) ^ ((0xC6A4A7935BD1E995 * *((void *)v17 + 1)) >> 47))));
      unint64_t v23 = (char *)(v17 + 16);
      uint64_t v24 = v17 + 32;
      v17 += 16;
    }
    while (v24 <= v18);
  }
  else
  {
    unint64_t v23 = (char *)v17;
  }
  if (v23 + 8 <= (char *)v18)
  {
    do
    {
      v25 = v23 + 8;
      unint64_t v2 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995 * *(void *)v23) ^ ((0xC6A4A7935BD1E995 * *(void *)v23) >> 47))) ^ v2);
      BOOL v14 = v23 + 16 > (char *)v18;
      v23 += 8;
    }
    while (!v14);
  }
  else
  {
    v25 = v23;
  }
  if (v25 >= (char *)v18)
  {
    unsigned int v5 = 0;
  }
  else
  {
    unsigned int v5 = 0;
    unint64_t v26 = (char *)((char *)v29 + v4 - v25);
    do
    {
      unsigned int v27 = *v25++;
      v3 |= (unint64_t)v27 << v5;
      v5 += 8;
      --v26;
    }
    while (v26);
  }
LABEL_60:
  *(void *)a1 = v1 - v4;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = v5;
  if (v5) {
LABEL_61:
  }
    unint64_t v2 = 0xC6A4A7935BD1E995 * (*(void *)(a1 + 16) ^ v2);
  return (0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) >> 47);
}

uint64_t _os_feature_table()
{
  if (_os_feature_table_table_once != -1) {
    _os_once();
  }
  return _os_feature_table_table;
}

BOOL _os_feature_enabled_SLOWPATH(const char *a1, const char *a2)
{
  uint64_t v80 = *MEMORY[0x1E4F14BF8];
  os_unfair_lock_lock((os_unfair_lock_t)&_slow_cache_lock);
  unint64_t v3 = 0x1EA6C8000uLL;
  if (_slow_cache)
  {
    uint64_t v4 = xpc_dictionary_get_value((xpc_object_t)_slow_cache, a1);
    xpc_object_t v5 = (xpc_object_t)v4;
    if (v4)
    {
      if (MEMORY[0x1D9444A00](v4) != MEMORY[0x1E4F14D40]) {
        goto LABEL_19;
      }
      uint64_t v6 = xpc_dictionary_get_value(v5, a2);
      size_t v7 = v6;
      BOOL v8 = v6 == (void *)MEMORY[0x1E4F14CF0];
      if (v6 == (void *)MEMORY[0x1E4F14CF0] || v6 == (void *)MEMORY[0x1E4F14CE8])
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_slow_cache_lock);

        goto LABEL_22;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_slow_cache_lock);
  unint64_t v10 = _os_feature_search_paths();
  if ((unint64_t)__strlcpy_chk() <= 0x3FF
    && (unint64_t)__strlcat_chk() <= 0x3FF
    && (unint64_t)__strlcat_chk() <= 0x3FF)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    __stringp[0] = (char *)MEMORY[0x1E4F14BE8];
    __stringp[1] = (char *)3221225472;
    __stringp[2] = (char *)___os_featureenabled_slow_load_disclosures_block_invoke;
    __stringp[3] = (char *)&unk_1E69E21A8;
    id v17 = empty;
    id v79 = v17;
    xpc_dictionary_applier_t applier = (xpc_dictionary_applier_t)MEMORY[0x1D9444840](__stringp);
    v76[0] = MEMORY[0x1E4F14BE8];
    v76[1] = 3221225472;
    v76[2] = ___os_featureenabled_slow_load_disclosures_block_invoke_2;
    v76[3] = &unk_1E69E21A8;
    id v69 = v17;
    id v77 = v69;
    xpc_dictionary_applier_t v70 = (xpc_dictionary_applier_t)MEMORY[0x1D9444840](v76);
    uint64_t v18 = _os_feature_search_paths();
    if (*v18)
    {
      uint64_t v19 = MEMORY[0x1E4F14D40];
      do
      {
        uint64_t v20 = _os_feature_enabled_load();
        unsigned int v21 = (void *)v20;
        if (v20 && MEMORY[0x1D9444A00](v20) == v19) {
          xpc_dictionary_apply(v21, applier);
        }
        _os_feature_internal_search_path();
        uint64_t v22 = _os_feature_enabled_load();
        unint64_t v23 = (void *)v22;
        if (v22 && MEMORY[0x1D9444A00](v22) == v19) {
          xpc_dictionary_apply(v23, v70);
        }
        if ((_os_feature_enabled_is_safe_mode() & 1) == 0)
        {
          uint64_t v24 = _os_feature_enabled_load();
          v25 = (void *)v24;
          if (v24 && MEMORY[0x1D9444A00](v24) == v19) {
            xpc_dictionary_apply(v25, applier);
          }
          uint64_t v26 = _os_feature_enabled_load();
          unsigned int v27 = (void *)v26;
          if (v26 && MEMORY[0x1D9444A00](v26) == v19) {
            xpc_dictionary_apply(v27, applier);
          }
        }
        unint64_t v28 = v18[1];
        ++v18;
      }
      while (v28);
    }
    id v29 = v69;

    if (*v10)
    {
      LOBYTE(v8) = 0;
      uint64_t v30 = "/Global.plist";
      do
      {
        _os_feature_enabled_load();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        id v32 = v29;
        if (v31 && MEMORY[0x1D9444A00](v31) == MEMORY[0x1E4F14D40])
        {
          uint64_t v33 = xpc_dictionary_get_value(v31, a2);
          size_t v34 = (void *)v33;
          if (v33 && MEMORY[0x1D9444A00](v33) == MEMORY[0x1E4F14D40])
          {
            uint64_t v35 = xpc_dictionary_get_value(v34, "DisclosureRequired");
            unint64_t v36 = (void *)v35;
            if (!v35
              || MEMORY[0x1D9444A00](v35) != MEMORY[0x1E4F14D78]
              || (uint64_t v37 = xpc_string_get_string_ptr(v36), xpc_dictionary_get_BOOL(v32, v37)))
            {
              xpc_dictionary_applier_t appliera = v32;
              unint64_t v38 = xpc_dictionary_get_value(v34, "Enabled");
              uint64_t v39 = xpc_dictionary_get_value(v34, "DevelopmentPhase");
              unsigned int v40 = (void *)v39;
              if (!v38 || !v39)
              {
                if (v38 && MEMORY[0x1D9444A00](v38) == MEMORY[0x1E4F14D20])
                {
                  LOBYTE(v8) = xpc_BOOL_get_value(v38);
                }
                else if (v40 && MEMORY[0x1D9444A00](v40) == MEMORY[0x1E4F14D78])
                {
                  string_ptr = xpc_string_get_string_ptr(v40);
                  LOBYTE(v8) = strcmp(string_ptr, "FeatureComplete") == 0;
                }
              }

              id v32 = appliera;
            }
          }
        }

        unsigned int v42 = _os_feature_enabled_load();
        unint64_t v43 = _os_feature_enabled_extract_domain(v42, a1);
        BOOL v8 = _os_feature_enabled_extract(v43, a2, v8, v32);

        if ((_os_feature_enabled_is_safe_mode() & 1) == 0)
        {
          _os_feature_enabled_load();
          xpc_dictionary_applier_t applierb = (xpc_dictionary_applier_t)objc_claimAutoreleasedReturnValue();
          v44 = _os_feature_enabled_extract_domain(applierb, a1);
          BOOL v45 = v8;
          unsigned int v46 = v32;
          unint64_t v47 = v44;
          BOOL v71 = _os_feature_enabled_extract(v44, a2, v45, v46);

          uint64_t v48 = _os_feature_enabled_load();
          _os_feature_enabled_extract_domain(v48, a1);
          id v49 = v31;
          uint64_t v50 = v30;
          uint64_t v51 = v10;
          unint64_t v52 = a1;
          v54 = id v53 = v29;
          BOOL v8 = _os_feature_enabled_extract(v54, a2, v71, v46);

          id v29 = v53;
          a1 = v52;
          unint64_t v10 = v51;
          uint64_t v30 = v50;
          id v31 = v49;
        }
        unint64_t v55 = v10[1];
        ++v10;
      }
      while (v55);
    }
    else
    {
      BOOL v8 = 0;
    }
    xpc_object_t v56 = xpc_dictionary_create_empty();
    long long v57 = getenv("FEATUREFLAGS_ENABLED");
    long long v58 = getenv("FEATUREFLAGS_DISABLED");
    if (v57)
    {
      long long v59 = strdup(v57);
      __stringp[0] = v59;
      v60 = strsep(__stringp, ":");
      if (v60)
      {
        v61 = v60;
        v62 = (void *)MEMORY[0x1E4F14CF0];
        do
        {
          _os_feature_enabled_write_nested_value_into_plist(v56, v61, v62);
          v61 = strsep(__stringp, ":");
        }
        while (v61);
      }
      free(v59);
    }
    if (v58)
    {
      v63 = strdup(v58);
      __stringp[0] = v63;
      v64 = strsep(__stringp, ":");
      if (v64)
      {
        v65 = v64;
        v66 = (void *)MEMORY[0x1E4F14CE8];
        do
        {
          _os_feature_enabled_write_nested_value_into_plist(v56, v65, v66);
          v65 = strsep(__stringp, ":");
        }
        while (v65);
      }
      free(v63);
    }
    if (v56)
    {
      v67 = xpc_dictionary_get_dictionary(v56, a1);
      v68 = v67;
      unint64_t v3 = 0x1EA6C8000;
      if (v67) {
        BOOL v8 = _os_feature_enabled_extract(v67, a2, v8, v29);
      }
    }
    else
    {
      unint64_t v3 = 0x1EA6C8000;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_slow_cache_lock);
  unsigned int v11 = *(void **)(v3 + 3168);
  if (!v11)
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    unint64_t v13 = *(void **)(v3 + 3168);
    *(void *)(v3 + 3168) = v12;

    unsigned int v11 = *(void **)(v3 + 3168);
  }
  uint64_t v14 = xpc_dictionary_get_value(v11, a1);
  if (v14)
  {
    xpc_object_t v5 = (xpc_object_t)v14;
    if (MEMORY[0x1D9444A00]() != MEMORY[0x1E4F14D40]) {
LABEL_19:
    }
      abort();
  }
  else
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(*(xpc_object_t *)(v3 + 3168), a1, v5);
  }
  xpc_dictionary_set_BOOL(v5, a2, v8);
  os_unfair_lock_unlock((os_unfair_lock_t)&_slow_cache_lock);
LABEL_22:

  return v8;
}

char **_os_feature_search_paths()
{
  return _os_feature_search_paths_paths;
}

const char *_os_feature_internal_search_path()
{
  return "/System/AppleInternal/Library/FeatureFlags";
}

id _os_feature_enabled_load()
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  if ((unint64_t)__strlcpy_chk() > 0x3FF || (unint64_t)__strlcat_chk() > 0x3FF)
  {
    v0 = 0;
    goto LABEL_4;
  }
  int v2 = open(v10, 16777476);
  if (v2 < 0)
  {
    v0 = 0;
    int v8 = *__error();
    if (v8) {
LABEL_26:
    }
      *__error() = v8;
  }
  else
  {
    int v3 = v2;
    size_t v4 = lseek(v2, 0, 2);
    if ((v4 & 0x8000000000000000) != 0)
    {
      v0 = 0;
      int v8 = *__error();
    }
    else
    {
      int64_t v5 = v4;
      uint64_t v6 = (char *)malloc_type_malloc(v4, 0xDAAF447uLL);
      if (v5)
      {
        off_t v7 = 0;
        int v8 = 0;
        while (1)
        {
          ssize_t v9 = pread(v3, &v6[v7], v5 - v7, v7);
          if (v9 < 0)
          {
            int v8 = *__error();
            if (v8 != 4)
            {
              v0 = 0;
              goto LABEL_24;
            }
          }
          else
          {
            if (!v9)
            {
              v0 = 0;
              int v8 = 70;
              goto LABEL_24;
            }
            v7 += v9;
          }
          if (v7 >= v5) {
            goto LABEL_21;
          }
        }
      }
      int v8 = 0;
LABEL_21:
      v0 = (void *)xpc_create_from_plist();
LABEL_24:
      free(v6);
    }
    close(v3);
    if (v8) {
      goto LABEL_26;
    }
  }
LABEL_4:

  return v0;
}

BOOL _os_feature_enabled_extract(void *a1, const char *a2, BOOL value, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = MEMORY[0x1D9444A00](v7);
    uint64_t v10 = MEMORY[0x1E4F14D40];
    if (v9 == MEMORY[0x1E4F14D40])
    {
      uint64_t v11 = xpc_dictionary_get_value(v7, a2);
      xpc_object_t v12 = (void *)v11;
      if (v11 && MEMORY[0x1D9444A00](v11) == v10)
      {
        uint64_t v13 = xpc_dictionary_get_value(v12, "DisclosureRequired");
        uint64_t v14 = (void *)v13;
        if (!v13
          || MEMORY[0x1D9444A00](v13) != MEMORY[0x1E4F14D78]
          || (string_ptr = xpc_string_get_string_ptr(v14), xpc_dictionary_get_BOOL(v8, string_ptr)))
        {
          uint64_t v16 = xpc_dictionary_get_value(v12, "Enabled");
          id v17 = (void *)v16;
          if (v16 && MEMORY[0x1D9444A00](v16) == MEMORY[0x1E4F14D20]) {
            value = xpc_BOOL_get_value(v17);
          }
        }
      }
    }
  }

  return value;
}

id _os_feature_enabled_extract_domain(void *a1, const char *a2)
{
  if (a1)
  {
    uint64_t v2 = xpc_dictionary_get_value(a1, a2);
    int v3 = (void *)v2;
    if (v2 && MEMORY[0x1D9444A00](v2) == MEMORY[0x1E4F14D40]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t ___os_featureenabled_slow_load_disclosures_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (MEMORY[0x1D9444A00]() == MEMORY[0x1E4F14D40] && xpc_dictionary_get_BOOL(v5, "Disclosed")) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), a2, 1);
  }

  return 1;
}

uint64_t ___os_featureenabled_slow_load_disclosures_block_invoke_2(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (MEMORY[0x1D9444A00]() == MEMORY[0x1E4F14D40])
  {
    uint64_t v6 = xpc_dictionary_get_value(v5, "Disclosed");

    if (v6)
    {
      BOOL v7 = xpc_dictionary_get_BOOL(v5, "Disclosed");
      xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), a2, v7);
    }
  }

  return 1;
}

void _os_feature_enabled_write_nested_value_into_plist(void *a1, const char *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  BOOL v7 = strdup(a2);
  __stringp = v7;
  id v8 = strsep(&__stringp, "/");
  if (v8 && (uint64_t v9 = v8, (v10 = strsep(&__stringp, "/")) != 0) && (v11 = v10, !strsep(&__stringp, "/")))
  {
    xpc_object_t empty = xpc_dictionary_get_dictionary(v5, v9);
    if (!empty)
    {
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(v5, v9, empty);
    }
    uint64_t v13 = xpc_dictionary_get_value(empty, v11);

    if (v13) {
      _os_feature_enabled_write_nested_value_into_plist_cold_1();
    }
    xpc_object_t v14 = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(v14, "Enabled", v6);
    xpc_dictionary_set_value(empty, v11, v14);
    free(v7);
  }
  else
  {
    free(v7);
  }
}

uint64_t _os_feature_enabled_is_safe_mode()
{
  return 0;
}

void _os_feature_enabled_write_nested_value_into_plist_cold_1()
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40CFD60]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40CF768]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40CF770]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40CF7A8]();
}

uint64_t _os_once()
{
  return MEMORY[0x1F40D0728]();
}

void abort(void)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CFEE8](*(void *)&a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CFF88](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CF8B8](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40D00E8](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0678](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40D02E0](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40D02F8](a1, a2);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40D0308](a1, *(void *)&a2);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1F40CFC58]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40D03A8](*(void *)&__fd, __buf, __nbyte, a4);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40D0488](a1, *(void *)&a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CFA20](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CFA38](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CFA60](__s);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CFAA0](__stringp, __delim);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40D0BB8](xBOOL);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1F40D0C60]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40D0C90](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40D0CA0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40D0CA8]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40D0CC0](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40D0CD8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40D0D00](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40D0D70](object);
}