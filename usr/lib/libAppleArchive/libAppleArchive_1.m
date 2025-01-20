uint64_t AAPathListMerge(uint64_t a1, unsigned int *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int *v11;
  uint64_t v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  unint64_t v18;
  const char *v19;
  __int16 v20;
  char v21;
  int v22;

  result = 0;
  v22 = 0;
  if (*a2 != 1)
  {
    if ((StringTableAppendTable(*(void *)(a1 + 16), *((unsigned int **)a2 + 2), &v22) & 0x80000000) != 0)
    {
      v19 = "String table merge";
      v20 = 800;
    }
    else
    {
      v7 = *(_DWORD *)a1;
      if ((increaseCapacity(a1, *a2 + *(_DWORD *)a1) & 0x80000000) != 0)
      {
        v19 = "Capacity increase";
        v20 = 804;
      }
      else
      {
        if (*a2 >= 2)
        {
          v8 = 0;
          v9 = *(void *)(a1 + 8);
          v10 = *(_DWORD *)a1;
          v11 = (int *)(*((void *)a2 + 1) + 40);
          do
          {
            *(_DWORD *)a1 = v10 + v8 + 1;
            v12 = v9 + 24 * (v10 + v8);
            v13 = v22 + *(v11 - 1);
            v14 = *(v11 - 4);
            v15 = v14 == 0;
            v16 = v7 - 1 + v14;
            if (v15) {
              v16 = 0;
            }
            *(_DWORD *)v12 = v16;
            v17 = *v11;
            v11 += 6;
            *(_DWORD *)(v12 + 12) = v13;
            *(_DWORD *)(v12 + 16) = v17;
            *(_DWORD *)(v12 + 20) = -1;
            *(void *)(v12 + 4) = -1;
            v18 = v8 + 2;
            ++v8;
          }
          while (v18 < *a2);
        }
        if ((normalize((_DWORD *)a1) & 0x80000000) == 0) {
          return 0;
        }
        v19 = "Tree normalization";
        v20 = 816;
      }
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c", (uint64_t)"AAPathListMerge", v20, 60, 0, v19, v5, v6, v21);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t AAPathListNodeFirst(AAPathList path_list)
{
  if (*((_DWORD *)path_list + 6) == -1) {
    return -1;
  }
  else {
    return *((unsigned int *)path_list + 6);
  }
}

uint64_t AAPathListNodeNext(AAPathList path_list, uint64_t node)
{
  if (*(unsigned int *)path_list <= node)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c", (uint64_t)"AAPathListNodeNext", 826, 60, 0, "Invalid node: %llu", v2, v3, node);
    return -1;
  }
  else if (*(_DWORD *)(*((void *)path_list + 1) + 24 * node + 20) == -1)
  {
    return -1;
  }
  else
  {
    return *(unsigned int *)(*((void *)path_list + 1) + 24 * node + 20);
  }
}

uint64_t cmpNodesProc(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unsigned int v3 = *a2;
  unsigned int v4 = *a3;
  uint64_t v5 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v5 + 24 * v3) == *(_DWORD *)(v5 + 24 * *a3))
  {
    unsigned int v6 = *(_DWORD *)(v5 + 24 * v3 + 12);
    unsigned int v7 = *(_DWORD *)(v5 + 24 * v4 + 12);
    if (v6 < v7) {
      return 0xFFFFFFFFLL;
    }
    else {
      return v7 < v6;
    }
  }
  else
  {
    if (*(_DWORD *)a1 <= v3
      || (*(void *)__s2 = 0, (getPath(a1, v3, 0x400uLL, __s1, (size_t *)__s2) & 0x80000000) != 0)
      || *(void *)__s2 >= 0x400uLL)
    {
      __s1[0] = 0;
    }
    if (*(_DWORD *)a1 <= v4 || (size_t v10 = 0, (getPath(a1, v4, 0x400uLL, __s2, &v10) & 0x80000000) != 0) || v10 >= 0x400) {
      __s2[0] = 0;
    }
    return strcmp(__s1, __s2);
  }
}

void extractStreamAbort(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(a1 + 1600), (unsigned int *)&v1, 1u);
  if (!v1) {
    extractStreamStateFail(a1);
  }
}

uint64_t extractThreadFailEntry(uint64_t *a1)
{
  uint64_t v1 = a1[21];
  if (!v1) {
    return 0;
  }
  a1[21] = 0;
  uint64_t v3 = *a1;
  if (*(_DWORD *)(v1 + 2300) != -1)
  {
    *(_DWORD *)(v1 + 2300) = -1;
    unsigned int v4 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(v3 + 1040);
    if (v4)
    {
      v4(*(void *)(v3 + 1032), 22, v1, v1 + 2272);
      uint64_t v3 = *a1;
    }
  }
  atomic_fetch_add_explicit((atomic_uint *volatile)(v3 + 1604), 1u, memory_order_relaxed);
  AAByteStreamClose(*(AAByteStream *)(v1 + 2288));
  *(void *)(v1 + 2288) = 0;
  if ((retireThreadEnqueue(*a1 + 1200, v1) & 0x80000000) == 0) {
    return 0;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c", (uint64_t)"extractThreadFailEntry", 736, 72, 0, "sending entry to retire thread", v5, v6, v8);
  return 0xFFFFFFFFLL;
}

void extractStreamStateFail(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 1632);
  uint64_t v3 = *(void *)(a1 + 1632);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 1632);
    if (*(_DWORD *)(v3 + 2300) != -1)
    {
      *(_DWORD *)(v3 + 2300) = -1;
      uint64_t v5 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 1040);
      uint64_t v4 = v3;
      if (v5)
      {
        v5(*(void *)(a1 + 1032), 22, v3, v3 + 2272);
        uint64_t v4 = *(void *)(a1 + 1632);
      }
    }
    if ((retireThreadEnqueue(a1 + 1200, v4) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c", (uint64_t)"extractStreamSendEntryToRetireThread", 1163, 72, 0, "retireThreadEnqueue failed", v6, v7, v16);
      entryRelease(v3, v8, v9, v10, v11, v12, v13, v14);
    }
    atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 1604), 1u, memory_order_relaxed);
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 1640);
    if (v15) {
      extractThreadSendCommand(v15, 70, 0, 0);
    }
  }
  *(_DWORD *)(a1 + 1608) = 1;
  *uint64_t v2 = 0;
  v2[1] = 0;
}

uint64_t clusterEntryUpdateDAT(uint64_t a1, int a2, unint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  if (a3 == -1) {
    return 0;
  }
  uint64_t v9 = a1 + 1312;
  uint64_t v10 = (pthread_mutex_t *)(a1 + 1312 + 80 * a2);
  if (pthread_mutex_lock(v10) < 0)
  {
    int v20 = *__error();
    v23 = "pthread_mutex_lock";
    __int16 v24 = 514;
LABEL_27:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c", (uint64_t)"clusterEntryUpdateDAT", v24, 72, v20, v23, v21, v22, v36);
    return 0xFFFFFFFFLL;
  }
  int v11 = a2;
  uint64_t v12 = v9 + 80 * a2;
  unint64_t v15 = *(void *)(v12 + 64);
  uint64_t v13 = (unint64_t *)(v12 + 64);
  unint64_t v14 = v15;
  if (v15 <= a3)
  {
    unint64_t v25 = v14;
    do
    {
      if (v25) {
        v25 *= 2;
      }
      else {
        unint64_t v25 = 32;
      }
    }
    while (v25 <= a3);
    *uint64_t v13 = v25;
    uint64_t v26 = v9 + 80 * a2;
    v29 = *(void **)(v26 + 72);
    v28 = (void *)(v26 + 72);
    v27 = v29;
    if (32 * v25 < 0x2000000001)
    {
      char v16 = (char *)realloc(v27, 32 * v25);
      if (v16)
      {
        void *v28 = v16;
        unint64_t v30 = *v13 - v14;
        if (*v13 > v14)
        {
          v31 = &v16[32 * v14 + 16];
          do
          {
            *((void *)v31 - 2) = 0;
            *((void *)v31 - 1) = 0;
            *(void *)v31 = -1;
            *((void *)v31 + 1) = -1;
            v31 += 32;
            --v30;
          }
          while (v30);
        }
        goto LABEL_5;
      }
      free(v27);
    }
    else
    {
      *__error() = 12;
    }
    void *v28 = 0;
    v32 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c", (uint64_t)"clusterEntryUpdateDAT", 523, 72, *v32, "malloc", v33, v34, v36);
    *uint64_t v13 = 0;
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_25;
  }
  char v16 = *(char **)(v9 + 80 * a2 + 72);
LABEL_5:
  uint64_t v17 = 0;
  v18 = &v16[32 * a3];
  uint64_t v19 = *(void *)v18;
  if (a4 && !v19)
  {
    *(void *)v18 = a4;
    uint64_t v17 = 1;
    atomic_fetch_add((atomic_uint *volatile)(a4 + 2304), 1u);
    uint64_t v19 = *(void *)(*(void *)(v9 + 80 * v11 + 72) + 32 * a3);
  }
  *a5 = v19;
LABEL_25:
  if (pthread_mutex_unlock(v10) < 0)
  {
    int v20 = *__error();
    v23 = "pthread_mutex_unlock";
    __int16 v24 = 547;
    goto LABEL_27;
  }
  return v17;
}

uint64_t aaHeaderInitWithPath(AAHeader_impl *a1, AAFieldKeySet_impl *a2, char *a3, const char *a4)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  memset(&v79, 0, sizeof(v79));
  init_blob_with_magic((uint64_t)a1);
  *(_DWORD *)a1 = 0;
  *((void *)a1 + 5) = 0;
  if ((concatPath(v81, 0x800uLL, a3, a4) & 0x80000000) != 0)
  {
    LOBYTE(v76) = (_BYTE)a3;
    int v11 = "invalid path %s/%s";
    __int16 v12 = 196;
LABEL_7:
    int v10 = 0;
    goto LABEL_8;
  }
  if ((init_blob_with_magic((uint64_t)a1) & 0x80000000) != 0)
  {
    int v11 = "init_blob_with_magic";
    __int16 v12 = 199;
    goto LABEL_7;
  }
  *(_DWORD *)a1 = 0;
  *((void *)a1 + 5) = 0;
  if (lstat(v81, &v79))
  {
    int v10 = *__error();
    v76 = v81;
    int v11 = "lstat %s";
    __int16 v12 = 204;
LABEL_8:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"aaHeaderInitWithPath", v12, 101, v10, v11, v8, v9, (char)v76);
    *(_DWORD *)a1 = 0;
    *((void *)a1 + 2) = 0;
    uint64_t result = 0xFFFFFFFFLL;
    *((void *)a1 + 5) = 0;
    return result;
  }
  unsigned int v14 = aaEntryTypeFromMode(v79.st_mode);
  if (!v14)
  {
    v76 = v81;
    int v11 = "could not determine entry type: %s";
    __int16 v12 = 210;
    goto LABEL_7;
  }
  v15.ikey = 5265748;
  if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v15, v14) < 0)
  {
    v76 = v81;
    int v11 = "inserting TYP: %s";
    __int16 v12 = 211;
    goto LABEL_7;
  }
  size_t v16 = strlen(a4);
  v17.ikey = 5521744;
  if (AAHeaderSetFieldString(a1, 0xFFFFFFFF, v17, a4, v16) < 0)
  {
    v76 = v81;
    int v11 = "inserting PAT: %s";
    __int16 v12 = 217;
    goto LABEL_7;
  }
  int v18 = v79.st_mode & 0xF000;
  if (v18 == 40960)
  {
    ssize_t v19 = readlink(v81, value, 0x3FFuLL);
    if (v19 < 0)
    {
      int v10 = *__error();
      v76 = v81;
      int v11 = "readlink: %s";
      __int16 v12 = 225;
      goto LABEL_8;
    }
    value[v19] = 0;
    v20.ikey = 4935244;
    if (AAHeaderSetFieldString(a1, 0xFFFFFFFF, v20, value, v19) < 0)
    {
      v76 = v81;
      int v11 = "inserting LNK: %s";
      __int16 v12 = 227;
      goto LABEL_7;
    }
    int v18 = v79.st_mode & 0xF000;
  }
  if ((v18 | 0x4000) == 0x6000)
  {
    v21.ikey = 5653828;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v21, v79.st_rdev) < 0)
    {
      v76 = v81;
      int v11 = "inserting DEV: %s";
      __int16 v12 = 233;
      goto LABEL_7;
    }
  }
  v22.ikey = 4475221;
  if (AAFieldKeySetContainsKey(a2, v22))
  {
    v23.ikey = 4475221;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v23, v79.st_uid) < 0)
    {
      v76 = v81;
      int v11 = "inserting UID: %s";
      __int16 v12 = 239;
      goto LABEL_7;
    }
  }
  v24.ikey = 4475207;
  if (AAFieldKeySetContainsKey(a2, v24))
  {
    v25.ikey = 4475207;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v25, v79.st_gid) < 0)
    {
      v76 = v81;
      int v11 = "inserting GID: %s";
      __int16 v12 = 245;
      goto LABEL_7;
    }
  }
  v26.ikey = 4476749;
  if (AAFieldKeySetContainsKey(a2, v26))
  {
    v27.ikey = 4476749;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v27, v79.st_mode & 0xFFF) < 0)
    {
      v76 = v81;
      int v11 = "inserting MOD: %s";
      __int16 v12 = 251;
      goto LABEL_7;
    }
  }
  v28.ikey = 4672582;
  if (AAFieldKeySetContainsKey(a2, v28))
  {
    v29.ikey = 4672582;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v29, v79.st_flags) < 0)
    {
      v76 = v81;
      int v11 = "inserting FLG: %s";
      __int16 v12 = 259;
      goto LABEL_7;
    }
  }
  v30.ikey = 5067843;
  if (AAFieldKeySetContainsKey(a2, v30) || (v31.ikey = 5067842, AAFieldKeySetContainsKey(a2, v31)))
  {
    v78[1] = 0;
    v78[2] = 0;
    memset(value, 0, 64);
    v78[0] = 0x220000000005;
    if (!getattrlist(v81, v78, value, 0x40uLL, 1u) && *(_DWORD *)value == 36)
    {
      timespec v77 = *(timespec *)&value[4];
      v32.ikey = 5067843;
      if (AAFieldKeySetContainsKey(a2, v32))
      {
        if (v77.tv_sec)
        {
          v33.ikey = 5067843;
          if (AAHeaderSetFieldTimespec(a1, 0xFFFFFFFF, v33, &v77) < 0)
          {
            v76 = v81;
            int v11 = "inserting CTM: %s";
            __int16 v12 = 277;
            goto LABEL_7;
          }
        }
      }
      timespec v77 = *(timespec *)&value[20];
      v34.ikey = 5067842;
      if (AAFieldKeySetContainsKey(a2, v34))
      {
        if (v77.tv_sec)
        {
          v35.ikey = 5067842;
          if (AAHeaderSetFieldTimespec(a1, 0xFFFFFFFF, v35, &v77) < 0)
          {
            v76 = v81;
            int v11 = "inserting BTM: %s";
            __int16 v12 = 283;
            goto LABEL_7;
          }
        }
      }
    }
  }
  v36.ikey = 5067853;
  if (AAFieldKeySetContainsKey(a2, v36))
  {
    v37.ikey = 5067853;
    if (AAHeaderSetFieldTimespec(a1, 0xFFFFFFFF, v37, &v79.st_mtimespec) < 0)
    {
      v76 = v81;
      int v11 = "inserting MTM: %s";
      __int16 v12 = 291;
      goto LABEL_7;
    }
  }
  if ((v79.st_mode & 0xF000) != 0x8000) {
    goto LABEL_46;
  }
  v38.ikey = 5523009;
  if (AAFieldKeySetContainsKey(a2, v38) <= 0)
  {
    v39.ikey = 5391937;
    if (AAFieldKeySetContainsKey(a2, v39) < 1) {
      goto LABEL_46;
    }
  }
  *(void *)value = 0;
  LODWORD(v78[0]) = 0;
  LODWORD(v77.tv_sec) = 0;
  if ((ParallelCompressionAFSCGetMetadata(v81, (off_t *)value, (unsigned int *)v78, &v77) & 0x80000000) != 0)
  {
    int v11 = "querying AFSC metadata";
    __int16 v12 = 306;
    goto LABEL_7;
  }
  if (LODWORD(v78[0]) != -1)
  {
    v40.ikey = 5523009;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v40, SLODWORD(v78[0])) < 0)
    {
      v76 = v81;
      int v11 = "inserting AFT: %s";
      __int16 v12 = 309;
      goto LABEL_7;
    }
    v41.ikey = 5391937;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v41, LODWORD(v77.tv_sec)) < 0)
    {
      v76 = v81;
      int v11 = "inserting AFR: %s";
      __int16 v12 = 310;
      goto LABEL_7;
    }
  }
LABEL_46:
  int v42 = v79.st_mode & 0xF000;
  if (v42 == 0x8000 || v42 == 0x4000)
  {
    v43.ikey = 4803654;
    if (AAFieldKeySetContainsKey(a2, v43) >= 1)
    {
      uint64_t FileAPFSInternalFlagsFD = getFileAPFSInternalFlagsFD();
      if (FileAPFSInternalFlagsFD)
      {
        v45.ikey = 4803654;
        if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v45, FileAPFSInternalFlagsFD) < 0)
        {
          v76 = v81;
          int v11 = "inserting FLI: %s";
          __int16 v12 = 322;
          goto LABEL_7;
        }
      }
    }
  }
  if ((v79.st_mode & 0xF000) == 0x8000)
  {
    v46.ikey = 4411984;
    if (AAFieldKeySetContainsKey(a2, v46) >= 1)
    {
      uint64_t v47 = getFileProtectionClass(v81) - 1;
      if (v47 <= 5)
      {
        v48.ikey = 4411984;
        if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v48, v47 + 65) < 0)
        {
          v76 = v81;
          int v11 = "inserting PRC: %s";
          __int16 v12 = 342;
          goto LABEL_7;
        }
      }
    }
  }
  v49.ikey = 5197385;
  if (AAFieldKeySetContainsKey(a2, v49))
  {
    v50.ikey = 5197385;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v50, v79.st_ino) < 0)
    {
      v76 = v81;
      int v11 = "inserting INO: %s";
      __int16 v12 = 359;
      goto LABEL_7;
    }
  }
  v51.ikey = 4934734;
  if (AAFieldKeySetContainsKey(a2, v51))
  {
    v52.ikey = 4934734;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v52, v79.st_nlink) < 0)
    {
      v76 = v81;
      int v11 = "inserting LNK: %s";
      __int16 v12 = 365;
      goto LABEL_7;
    }
  }
  if ((v79.st_mode & 0xF000) == 0x8000)
  {
    v53.ikey = 5917011;
    if (AAFieldKeySetContainsKey(a2, v53))
    {
      v54.ikey = 5917011;
      if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v54, v79.st_size) < 0)
      {
        v76 = v81;
        int v11 = "inserting SIZ: %s";
        __int16 v12 = 371;
        goto LABEL_7;
      }
    }
  }
  int v55 = v79.st_mode & 0xF000;
  if (v55 == 0x4000 || v55 == 40960 || v55 == 0x8000)
  {
    v56.ikey = 5920068;
    if (AAFieldKeySetContainsKey(a2, v56))
    {
      unsigned int FilesystemBlockSize = getFilesystemBlockSize(a3);
      uint64_t FileDiskUsageBlocks2 = getFileDiskUsageBlocks2(a3, a4, FilesystemBlockSize);
      if ((FileDiskUsageBlocks2 & 0x8000000000000000) == 0)
      {
        v59.ikey = 5920068;
        if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v59, FileDiskUsageBlocks2) < 0)
        {
          v76 = v81;
          int v11 = "inserting DUZ: %s";
          __int16 v12 = 381;
          goto LABEL_7;
        }
      }
    }
  }
  v60.ikey = 5458755;
  char v61 = AAFieldKeySetContainsKey(a2, v60);
  v62.ikey = 3229779;
  char v63 = AAFieldKeySetContainsKey(a2, v62);
  v64.ikey = 3295315;
  char v65 = AAFieldKeySetContainsKey(a2, v64);
  v66.ikey = 3360851;
  char v67 = AAFieldKeySetContainsKey(a2, v66);
  v68.ikey = 3491923;
  char v69 = AAFieldKeySetContainsKey(a2, v68);
  uint64_t result = 0;
  if ((v79.st_mode & 0xF000) == 0x8000)
  {
    unsigned int v70 = ((v61 & 1) << 11) & 0xFFF | ((v63 & 1) << 12) & 0x1FFF | ((v65 & 1) << 13) & 0x3FFF | ((v67 & 1) << 14) & 0x7FFF | ((v69 & 1) << 15);
    if (v70)
    {
      memset(value, 0, 172);
      if ((aaEntryHashesInitWithPath(value, v70, a3, a4) & 0x80000000) != 0)
      {
        v76 = v81;
        int v11 = "computing file hashes: %s";
        __int16 v12 = 395;
      }
      else if ((v61 & 1) != 0 {
             && (v71.ikey = 5458755, AAHeaderSetFieldHash(a1, 0xFFFFFFFF, v71, 1u, (const uint8_t *)&value[4]) < 0))
      }
      {
        v76 = v81;
        int v11 = "inserting CKS: %s";
        __int16 v12 = 397;
      }
      else if ((v63 & 1) != 0 {
             && (v72.ikey = 3229779, AAHeaderSetFieldHash(a1, 0xFFFFFFFF, v72, 2u, (const uint8_t *)&value[8]) < 0))
      }
      {
        v76 = v81;
        int v11 = "inserting SH1: %s";
        __int16 v12 = 399;
      }
      else if ((v65 & 1) != 0 {
             && (v73.ikey = 3295315, AAHeaderSetFieldHash(a1, 0xFFFFFFFF, v73, 3u, (const uint8_t *)&value[28]) < 0))
      }
      {
        v76 = v81;
        int v11 = "inserting SH2: %s";
        __int16 v12 = 401;
      }
      else if ((v67 & 1) != 0 {
             && (v74.ikey = 3360851, AAHeaderSetFieldHash(a1, 0xFFFFFFFF, v74, 4u, (const uint8_t *)&value[60]) < 0))
      }
      {
        v76 = v81;
        int v11 = "inserting SH3: %s";
        __int16 v12 = 403;
      }
      else
      {
        if ((v69 & 1) == 0) {
          return 0;
        }
        v75.ikey = 3491923;
        if ((AAHeaderSetFieldHash(a1, 0xFFFFFFFF, v75, 5u, (const uint8_t *)&value[108]) & 0x80000000) == 0) {
          return 0;
        }
        v76 = v81;
        int v11 = "inserting SH5: %s";
        __int16 v12 = 405;
      }
      goto LABEL_7;
    }
  }
  return result;
}

uint64_t getFileDiskUsageBlocks2(char *a1, const char *a2, unsigned int a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  bzero(v7, 0x800uLL);
  if (concatPath(v7, 0x800uLL, a1, a2)) {
    return -1;
  }
  uint64_t result = getFileDiskUsage(v7);
  if (result >= 0) {
    return (result + a3 - 1) & -(uint64_t)a3;
  }
  return result;
}

uint64_t aaHeaderAppendEntryAttributes(AAHeader header, char *a2, char *a3)
{
  char v6 = *a2;
  if (*a2)
  {
    v7.ikey = 4475221;
    if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v7, *((unsigned int *)a2 + 1)) < 0)
    {
      AAFieldKey v22 = "append UID";
      __int16 v23 = 416;
      goto LABEL_44;
    }
    char v6 = *a2;
  }
  if ((v6 & 2) != 0)
  {
    v10.ikey = 4475207;
    if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v10, *((unsigned int *)a2 + 2)) < 0)
    {
      AAFieldKey v22 = "append GID";
      __int16 v23 = 417;
      goto LABEL_44;
    }
    char v6 = *a2;
  }
  if ((v6 & 8) != 0)
  {
    v11.ikey = 4476749;
    if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v11, *((unsigned int *)a2 + 4)) < 0)
    {
      AAFieldKey v22 = "append MOD";
      __int16 v23 = 418;
      goto LABEL_44;
    }
    char v6 = *a2;
  }
  if ((v6 & 4) != 0)
  {
    v12.ikey = 4672582;
    if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v12, *((unsigned int *)a2 + 3)) < 0)
    {
      AAFieldKey v22 = "append FLG";
      __int16 v23 = 419;
      goto LABEL_44;
    }
    char v6 = *a2;
  }
  if ((v6 & 0x40) != 0)
  {
    v13.ikey = 5067853;
    if (AAHeaderSetFieldTimespec(header, 0xFFFFFFFF, v13, (const timespec *)(a2 + 56)) < 0)
    {
      AAFieldKey v22 = "append MTM";
      __int16 v23 = 420;
      goto LABEL_44;
    }
    char v6 = *a2;
  }
  if ((v6 & 0x20) != 0)
  {
    v14.ikey = 5067843;
    if (AAHeaderSetFieldTimespec(header, 0xFFFFFFFF, v14, (const timespec *)(a2 + 40)) < 0)
    {
      AAFieldKey v22 = "append CTM";
      __int16 v23 = 421;
      goto LABEL_44;
    }
    char v6 = *a2;
  }
  if ((v6 & 0x10) != 0
    && (v15.ikey = 5067842, AAHeaderSetFieldTimespec(header, 0xFFFFFFFF, v15, (const timespec *)(a2 + 24)) < 0))
  {
    AAFieldKey v22 = "append BTM";
    __int16 v23 = 422;
  }
  else
  {
    char v16 = *a3;
    if (*a3)
    {
      v17.ikey = 5523009;
      if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v17, *((int *)a3 + 2)) < 0)
      {
        AAFieldKey v22 = "append AFT";
        __int16 v23 = 423;
        goto LABEL_44;
      }
      char v16 = *a3;
    }
    if ((v16 & 2) != 0)
    {
      v18.ikey = 5391937;
      if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v18, *((unsigned int *)a3 + 3)) < 0)
      {
        AAFieldKey v22 = "append AFR";
        __int16 v23 = 424;
        goto LABEL_44;
      }
      char v16 = *a3;
    }
    if ((v16 & 4) != 0)
    {
      v19.ikey = 4803654;
      if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v19, *((void *)a3 + 2)) < 0)
      {
        AAFieldKey v22 = "append FLI";
        __int16 v23 = 425;
        goto LABEL_44;
      }
      char v16 = *a3;
    }
    if ((v16 & 8) == 0) {
      return 0;
    }
    v20.ikey = 4411984;
    if ((AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v20, *((int *)a3 + 1)) & 0x80000000) == 0) {
      return 0;
    }
    AAFieldKey v22 = "append PRC";
    __int16 v23 = 426;
  }
LABEL_44:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"aaHeaderAppendEntryAttributes", v23, 101, 0, v22, v8, v9, v24);
  return 0xFFFFFFFFLL;
}

AAHeader AAHeaderCreateWithEncodedData(size_t data_size, const uint8_t *data)
{
  AAHeader v4 = AAHeaderCreate();
  uint64_t v5 = v4;
  if (v4 && (aaHeaderInitWithEncodedData((uint64_t)v4, (unsigned __int16 *)data, data_size) & 0x80000000) != 0)
  {
    AAHeaderDestroy(v5);
    return 0;
  }
  return v5;
}

AAHeader AAHeaderCreateWithPath(AAFieldKeySet key_set, const char *dir, const char *path, AAFlagSet flags)
{
  AAFieldKey v7 = AAHeaderCreate();
  uint64_t v8 = v7;
  if (v7 && (aaHeaderInitWithPath(v7, key_set, (char *)dir, path) & 0x80000000) != 0)
  {
    AAHeaderDestroy(v8);
    return 0;
  }
  return v8;
}

int AAHeaderRemoveField(AAHeader header, uint32_t i)
{
  if ((update_field_sizes((uint64_t)header, i, 0, 0, v2, v3, v4, v5) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderRemoveField", 546, 101, 0, "update_field_sizes failed", v8, v9, v12);
    return -1;
  }
  else
  {
    int v10 = *(_DWORD *)header;
    if (*(_DWORD *)header + ~i)
    {
      memmove((void *)(*((void *)header + 1) + 48 * i), (const void *)(*((void *)header + 1) + 48 * (i + 1)), 48 * (*(_DWORD *)header + ~i));
      int v10 = *(_DWORD *)header;
    }
    int result = 0;
    *(_DWORD *)header = v10 - 1;
  }
  return result;
}

uint64_t update_field_sizes(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)a1 <= a2)
  {
    AAFieldKey v20 = "invalid field index";
    __int16 v21 = 74;
    goto LABEL_5;
  }
  unsigned int v9 = a2;
  char v12 = (unint64_t *)(a1 + 16);
  unint64_t v11 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = v13 + 48 * a2;
  unsigned int v17 = *(_DWORD *)(v14 + 16);
  char v16 = (unsigned int *)(v14 + 16);
  uint64_t v15 = v17;
  unint64_t v18 = *(v16 - 1) + (unint64_t)v17;
  size_t v19 = v11 - v18;
  if (v11 < v18)
  {
LABEL_3:
    AAFieldKey v20 = "realloc blob";
    __int16 v21 = 78;
LABEL_5:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"update_field_sizes", v21, 101, 0, v20, a7, a8, (char)v41);
    return 0xFFFFFFFFLL;
  }
  if (v15 >= a3)
  {
    if (v15 <= a3) {
      goto LABEL_29;
    }
    uint64_t v29 = v15 - a3;
    if (v11 != v18)
    {
      memmove((void *)(*(void *)(a1 + 32) + v18 - v29), (const void *)(*(void *)(a1 + 32) + v18), v19);
      unint64_t v18 = *(void *)(a1 + 16);
    }
    unint64_t v11 = v18 - v29;
  }
  else
  {
    uint64_t v24 = a3 - v15;
    unint64_t v25 = v11 + v24;
    if ((uint64_t)(v11 + v24) < 0) {
      goto LABEL_3;
    }
    size_t v26 = *(void *)(a1 + 24);
    if (v26 < v25)
    {
      do
      {
        while (!v26)
        {
          size_t v26 = 0x4000;
          if (v25 <= 0x4000)
          {
            uint64_t v43 = v24;
            size_t v44 = v11 - v18;
            AAFieldKey v28 = (void **)(a1 + 32);
            size_t v26 = 0x4000;
            goto LABEL_23;
          }
        }
        size_t v27 = v26 >> 1;
        if ((v26 & (v26 >> 1)) != 0) {
          size_t v27 = v26 & (v26 >> 1);
        }
        v26 += v27;
      }
      while (v26 < v25);
      AAFieldKey v28 = (void **)(a1 + 32);
      if (v26 >= 0x2000000001)
      {
        AAFieldKey v30 = (void **)(a1 + 32);
        *__error() = 12;
        goto LABEL_36;
      }
      uint64_t v43 = v24;
      size_t v44 = v11 - v18;
LABEL_23:
      AAFieldKey v41 = v28;
      int v42 = *v28;
      AAFieldKey v31 = realloc(*v28, v26);
      if (v31)
      {
        *(void *)(a1 + 24) = v26;
        *(void *)(a1 + 32) = v31;
        uint64_t v24 = v43;
        size_t v19 = v44;
        goto LABEL_25;
      }
      AAFieldKey v30 = v41;
      free(v42);
LABEL_36:
      *AAFieldKey v30 = 0;
      *char v12 = 0;
      v12[1] = 0;
      goto LABEL_3;
    }
LABEL_25:
    if (v11 != v18)
    {
      AAFieldKey v32 = (char *)(*(void *)(a1 + 32) + v18);
      uint64_t v33 = v24;
      memmove(&v32[v24], v32, v19);
      uint64_t v24 = v33;
    }
    unint64_t v11 = *v12 + v24;
  }
  *char v12 = v11;
LABEL_29:
  uint64_t v34 = v13 + 48 * v9;
  uint64_t v36 = *(void *)(v34 + 32);
  AAFieldKey v35 = (void *)(v34 + 32);
  *(void *)(a1 + 40) = *(void *)(a1 + 40) + a4 - v36;
  if (v11 <= 5)
  {
    AAFieldKey v20 = "copy header size";
    __int16 v21 = 85;
    goto LABEL_5;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 4) = v11;
  *char v16 = a3;
  *AAFieldKey v35 = a4;
  if (v9 + 1 < *(_DWORD *)a1)
  {
    uint64_t v37 = *(void *)(a1 + 8);
    uint64_t v38 = v37 + 48 * (v9 + 1) + 12;
    int v39 = *(_DWORD *)a1 - 1;
    do
    {
      uint64_t v40 = v37 + 48 * v9;
      *(_DWORD *)uint64_t v38 = *(_DWORD *)(v40 + 16) + *(_DWORD *)(v40 + 12);
      *(void *)(v38 + 12) = *(void *)(v40 + 32) + *(void *)(v40 + 24);
      ++v9;
      v38 += 48;
    }
    while (v39 != v9);
  }
  return 0;
}

int AAHeaderClear(AAHeader header)
{
  *(_DWORD *)header = 0;
  *((void *)header + 5) = 0;
  return 0;
}

int AAHeaderGetFieldHash(AAHeader header, uint32_t i, size_t capacity, AAHashFunction *hash_function, uint8_t *value)
{
  if (*(_DWORD *)header <= i)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderGetFieldHash", 622, 101, 0, "invalid field index %u", v5, v6, i);
    return -1;
  }
  uint64_t v7 = *((void *)header + 1);
  if (*(_DWORD *)(v7 + 48 * i + 4) != 3)
  {
    int v19 = *(_DWORD *)(v7 + 48 * i + 4);
    unint64_t v11 = "invalid type %d, expected HASH";
    __int16 v12 = 624;
    goto LABEL_7;
  }
  size_t v10 = *(unsigned int *)(v7 + 48 * i + 40);
  if (v10 > capacity)
  {
    unint64_t v11 = "not enough capacity to store HASH";
    __int16 v12 = 627;
LABEL_7:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderGetFieldHash", v12, 101, 0, v11, v5, v6, v19);
    return -1;
  }
  uint64_t v14 = (*(_DWORD *)(v7 + 48 * i + 12) + 4);
  if (v10 + v14 > *((void *)header + 2))
  {
    unint64_t v11 = "invalid blob segment";
    __int16 v12 = 628;
    goto LABEL_7;
  }
  memcpy(value, (const void *)(*((void *)header + 4) + v14), v10);
  int result = 0;
  if (hash_function)
  {
    int v16 = *(_DWORD *)(v7 + 48 * i + 8);
    unsigned int v17 = v16 - 70;
    AAHashFunction v18 = v16 - 69;
    if (v17 >= 5) {
      AAHashFunction v18 = -1;
    }
    *hash_function = v18;
  }
  return result;
}

int AAHeaderSetFieldFlag(AAHeader header, uint32_t i, AAFieldKey key)
{
  uint64_t v10 = MEMORY[0x263EF8318];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_19;
  }
  unsigned int v11 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v11, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_19:
    AAHashFunction v18 = "invalid key";
    __int16 v19 = 669;
    goto LABEL_20;
  }
  if ((*(_DWORD *)(v10 + 4 * v11 + 60) & 0x500) == 0) {
    goto LABEL_19;
  }
LABEL_9:
  unsigned int v12 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v13 = __maskrune(v12, 0x500uLL);
  }
  else {
    int v13 = *(_DWORD *)(v10 + 4 * v12 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v13) {
    goto LABEL_19;
  }
  if (i == -1) {
    i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, 4u, 0, v3, v4, v5, v6) & 0x80000000) != 0)
  {
    AAHashFunction v18 = "update_field_sizes failed";
    __int16 v19 = 673;
  }
  else
  {
    uint64_t v14 = *((void *)header + 1) + 48 * i;
    *(AAFieldKey *)uint64_t v14 = key;
    *(void *)(v14 + 4) = 0x2A00000000;
    *(void *)(v14 + 40) = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    AAFieldKey __src = key;
    __src.skey[3] = 42;
    uint64_t v17 = v14 + 12;
    uint64_t v16 = *(unsigned int *)(v14 + 12);
    size_t v15 = *(unsigned int *)(v17 + 4);
    if (v16 + v15 <= *((void *)header + 2))
    {
      memcpy((void *)(*((void *)header + 4) + v16), &__src, v15);
      return 0;
    }
    AAHashFunction v18 = "invalid blob segment";
    __int16 v19 = 684;
  }
LABEL_20:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderSetFieldFlag", v19, 101, 0, v18, v5, v6, v21);
  return -1;
}

uint64_t append_field(unsigned int *a1)
{
  uint64_t v2 = *a1;
  if ((realloc_fields((uint64_t)a1, (int)v2 + 1) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"append_field", 46, 101, 0, "realloc_fields failed", v3, v4, v8);
    return 0xFFFFFFFFLL;
  }
  else
  {
    ++*a1;
    uint64_t v5 = *((void *)a1 + 1);
    if (v5) {
      memset_s((void *)(v5 + 48 * v2), 0x30uLL, 0, 0x30uLL);
    }
    uint64_t v6 = v5 + 48 * v2;
    *(_DWORD *)(v6 + 12) = *((void *)a1 + 2);
    *(void *)(v6 + 24) = *((void *)a1 + 5);
  }
  return v2;
}

int AAHeaderSetFieldUInt(AAHeader header, uint32_t i, AAFieldKey key, uint64_t value)
{
  uint64_t v12 = MEMORY[0x263EF8318];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_16;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_16;
  }
  unsigned int v13 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v13, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_16:
    AAHashFunction v18 = "invalid key";
    __int16 v19 = 691;
    goto LABEL_17;
  }
  if ((*(_DWORD *)(v12 + 4 * v13 + 60) & 0x500) == 0) {
    goto LABEL_16;
  }
LABEL_9:
  unsigned int v14 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v15 = __maskrune(v14, 0x500uLL);
  }
  else {
    int v15 = *(_DWORD *)(v12 + 4 * v14 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v15) {
    goto LABEL_16;
  }
  if (value >= 0x100)
  {
    if (value >= 0x10000)
    {
      if (HIDWORD(value)) {
        unsigned int v17 = 12;
      }
      else {
        unsigned int v17 = 8;
      }
      if (HIDWORD(value)) {
        int v16 = 56;
      }
      else {
        int v16 = 52;
      }
    }
    else
    {
      int v16 = 50;
      unsigned int v17 = 6;
    }
  }
  else
  {
    int v16 = 49;
    unsigned int v17 = 5;
  }
  if (i == -1) {
    i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, v17, 0, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    AAHashFunction v18 = "update_field_sizes failed";
    __int16 v19 = 701;
  }
  else
  {
    uint64_t v21 = *((void *)header + 1) + 48 * i;
    *(AAFieldKey *)uint64_t v21 = key;
    *(_DWORD *)(v21 + 4) = 1;
    *(_DWORD *)(v21 + 8) = v16;
    *(void *)(v21 + 40) = value;
    uint64_t v27 = value;
    uint64_t v28 = 0;
    AAFieldKey __src = key;
    __src.skey[3] = v16;
    uint64_t v24 = v21 + 12;
    uint64_t v23 = *(unsigned int *)(v21 + 12);
    size_t v22 = *(unsigned int *)(v24 + 4);
    if (v23 + v22 <= *((void *)header + 2))
    {
      memcpy((void *)(*((void *)header + 4) + v23), &__src, v22);
      return 0;
    }
    AAHashFunction v18 = "invalid blob segment";
    __int16 v19 = 713;
  }
LABEL_17:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderSetFieldUInt", v19, 101, 0, v18, v6, v7, v25);
  return -1;
}

int AAHeaderSetFieldString(AAHeader header, uint32_t i, AAFieldKey key, const char *value, size_t length)
{
  uint64_t v13 = MEMORY[0x263EF8318];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_16;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_16;
  }
  unsigned int v14 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v14, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_16:
    unsigned int v17 = "invalid key";
    __int16 v18 = 720;
    goto LABEL_17;
  }
  if ((*(_DWORD *)(v13 + 4 * v14 + 60) & 0x500) == 0) {
    goto LABEL_16;
  }
LABEL_9:
  unsigned int v15 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v16 = __maskrune(v15, 0x500uLL);
  }
  else {
    int v16 = *(_DWORD *)(v13 + 4 * v15 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v16) {
    goto LABEL_16;
  }
  if (length >= 0x10000)
  {
    unsigned int v17 = "string too long";
    __int16 v18 = 721;
LABEL_17:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderSetFieldString", v18, 101, 0, v17, v6, v7, v27);
    return -1;
  }
  if (i == -1) {
    i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, (int)length + 6, 0, length, v5, v6, v7) & 0x80000000) != 0)
  {
    unsigned int v17 = "update_field_sizes failed";
    __int16 v18 = 725;
    goto LABEL_17;
  }
  uint64_t v20 = *((void *)header + 1) + 48 * i;
  *(AAFieldKey *)uint64_t v20 = key;
  *(void *)(v20 + 4) = 0x5000000002;
  *(void *)(v20 + 40) = length;
  unsigned int v23 = *(_DWORD *)(v20 + 12);
  uint64_t v21 = (_DWORD *)(v20 + 12);
  uint64_t v22 = v23;
  if ((unint64_t)v23 + 6 > *((void *)header + 2)
    || (uint64_t v24 = *((void *)header + 4) + v22,
        *(_DWORD *)uint64_t v24 = key.ikey & 0xFFFFFF | 0x50000000,
        *(_WORD *)(v24 + 4) = length,
        uint64_t v25 = (*v21 + 6),
        v25 + length > *((void *)header + 2)))
  {
    unsigned int v17 = "invalid blob segment";
    __int16 v18 = 738;
    goto LABEL_17;
  }
  uint64_t v26 = *((void *)header + 4);
  if (value)
  {
    memcpy((void *)(v26 + v25), value, length);
  }
  else if (v26)
  {
    memset_s((void *)(v26 + v25), length, 0, length);
  }
  return 0;
}

int AAHeaderSetFieldHash(AAHeader header, uint32_t i, AAFieldKey key, AAHashFunction hash_function, const uint8_t *value)
{
  uint64_t v13 = MEMORY[0x263EF8318];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_21;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_21;
  }
  unsigned int v14 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v14, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_21:
    unsigned int v23 = "invalid key";
    __int16 v24 = 745;
    goto LABEL_22;
  }
  if ((*(_DWORD *)(v13 + 4 * v14 + 60) & 0x500) == 0) {
    goto LABEL_21;
  }
LABEL_9:
  unsigned int v15 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v16 = __maskrune(v15, 0x500uLL);
  }
  else {
    int v16 = *(_DWORD *)(v13 + 4 * v15 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v16) {
    goto LABEL_21;
  }
  if (hash_function - 1 >= 5)
  {
    int v25 = -1;
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderSetFieldHash", 748, 101, 0, "invalid HASH subtype: %d", v6, v7, -1);
    return v25;
  }
  size_t v17 = dword_214B130B8[hash_function - 1];
  if (i == -1) {
    i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, (int)v17 + 4, 0, (uint64_t)value, v5, v6, v7) & 0x80000000) != 0)
  {
    unsigned int v23 = "update_field_sizes failed";
    __int16 v24 = 752;
    goto LABEL_22;
  }
  uint64_t v18 = *((void *)header + 1) + 48 * i;
  *(AAFieldKey *)uint64_t v18 = key;
  *(_DWORD *)(v18 + 4) = 3;
  *(_DWORD *)(v18 + 8) = hash_function + 69;
  *(void *)(v18 + 40) = v17;
  unsigned int v21 = *(_DWORD *)(v18 + 12);
  __int16 v19 = (_DWORD *)(v18 + 12);
  uint64_t v20 = v21;
  if ((unint64_t)v21 + 4 > *((void *)header + 2)
    || (*(_DWORD *)(*((void *)header + 4) + v20) = key.ikey & 0xFFFFFF | ((hash_function + 69) << 24),
        uint64_t v22 = (*v19 + 4),
        v22 + v17 > *((void *)header + 2)))
  {
    unsigned int v23 = "invalid blob segment";
    __int16 v24 = 764;
LABEL_22:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderSetFieldHash", v24, 101, 0, v23, v6, v7, v28);
    return -1;
  }
  uint64_t v27 = *((void *)header + 4);
  if (value)
  {
    memcpy((void *)(v27 + v22), value, v17);
  }
  else if (v27)
  {
    memset_s((void *)(v27 + v22), v17, 0, v17);
  }
  return 0;
}

int AAHeaderSetFieldTimespec(AAHeader header, uint32_t i, AAFieldKey key, const timespec *value)
{
  uint64_t v12 = MEMORY[0x263EF8318];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_25;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_25;
  }
  unsigned int v13 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v13, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_25:
    unsigned int v23 = "invalid key";
    __int16 v24 = 771;
    goto LABEL_26;
  }
  if ((*(_DWORD *)(v12 + 4 * v13 + 60) & 0x500) == 0) {
    goto LABEL_25;
  }
LABEL_9:
  unsigned int v14 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v15 = __maskrune(v14, 0x500uLL);
  }
  else {
    int v15 = *(_DWORD *)(v12 + 4 * v14 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v15) {
    goto LABEL_25;
  }
  if (value->tv_nsec) {
    unsigned int v16 = 16;
  }
  else {
    unsigned int v16 = 12;
  }
  if (value->tv_nsec) {
    int v17 = 84;
  }
  else {
    int v17 = 83;
  }
  if (i == -1) {
    i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, v16, 0, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    unsigned int v23 = "update_field_sizes failed";
    __int16 v24 = 779;
  }
  else
  {
    uint64_t v18 = *((void *)header + 1) + 48 * i;
    *(AAFieldKey *)uint64_t v18 = key;
    *(_DWORD *)(v18 + 4) = 4;
    *(_DWORD *)(v18 + 8) = v17;
    *(void *)(v18 + 40) = 0;
    AAFieldKey __src = key;
    __src.skey[3] = v17;
    uint64_t tv_nsec = value->tv_nsec;
    __darwin_time_t tv_sec = value->tv_sec;
    int v29 = tv_nsec;
    int v30 = 0;
    uint64_t v22 = v18 + 12;
    uint64_t v21 = *(unsigned int *)(v18 + 12);
    size_t v20 = *(unsigned int *)(v22 + 4);
    if (v21 + v20 <= *((void *)header + 2))
    {
      memcpy((void *)(*((void *)header + 4) + v21), &__src, v20);
      return 0;
    }
    unsigned int v23 = "invalid blob segment";
    __int16 v24 = 792;
  }
LABEL_26:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderSetFieldTimespec", v24, 101, 0, v23, v6, v7, v26);
  return -1;
}

int AAHeaderSetFieldBlob(AAHeader header, uint32_t i, AAFieldKey key, uint64_t size)
{
  uint64_t v12 = MEMORY[0x263EF8318];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_31;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_31;
  }
  unsigned int v13 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v13, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_31:
    __int16 v24 = "invalid key";
    __int16 v25 = 799;
    goto LABEL_32;
  }
  if ((*(_DWORD *)(v12 + 4 * v13 + 60) & 0x500) == 0) {
    goto LABEL_31;
  }
LABEL_9:
  unsigned int v14 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v15 = __maskrune(v14, 0x500uLL);
  }
  else {
    int v15 = *(_DWORD *)(v12 + 4 * v14 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v15) {
    goto LABEL_31;
  }
  if (HIDWORD(size)) {
    int v16 = 12;
  }
  else {
    int v16 = 8;
  }
  if (HIDWORD(size)) {
    int v17 = 67;
  }
  else {
    int v17 = 66;
  }
  if (size >= 0x10000) {
    unsigned int v18 = v16;
  }
  else {
    unsigned int v18 = 6;
  }
  if (size >= 0x10000) {
    int v19 = v17;
  }
  else {
    int v19 = 65;
  }
  if (i == -1) {
    i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, v18, size, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    __int16 v24 = "update_field_sizes failed";
    __int16 v25 = 808;
  }
  else
  {
    uint64_t v20 = *((void *)header + 1) + 48 * i;
    *(AAFieldKey *)uint64_t v20 = key;
    *(_DWORD *)(v20 + 4) = 5;
    *(_DWORD *)(v20 + 8) = v19;
    *(void *)(v20 + 40) = 0;
    uint64_t v29 = size;
    uint64_t v30 = 0;
    AAFieldKey __src = key;
    __src.skey[3] = v19;
    uint64_t v23 = v20 + 12;
    uint64_t v22 = *(unsigned int *)(v20 + 12);
    size_t v21 = *(unsigned int *)(v23 + 4);
    if (v22 + v21 <= *((void *)header + 2))
    {
      memcpy((void *)(*((void *)header + 4) + v22), &__src, v21);
      return 0;
    }
    __int16 v24 = "invalid blob segment";
    __int16 v25 = 820;
  }
LABEL_32:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderSetFieldBlob", v25, 101, 0, v24, v6, v7, v27);
  return -1;
}

uint64_t AAHeaderGetPayloadSize(AAHeader header)
{
  return *((void *)header + 5);
}

size_t AAHeaderGetEncodedSize(AAHeader header)
{
  return *((void *)header + 2);
}

const uint8_t *__cdecl AAHeaderGetEncodedData(AAHeader header)
{
  return (const uint8_t *)*((void *)header + 4);
}

uint64_t aaEntryXATBlobInitWithEncodedData(unint64_t *a1, char *__src, rsize_t __smax, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a1 = 0;
  a1[3] = 0;
  char v8 = a1 + 3;
  if (!__smax) {
    return 0;
  }
  char v12 = 0;
  unsigned int v13 = a1 + 4;
  char v14 = 1;
  while (2)
  {
    rsize_t v15 = 0;
    unint64_t v16 = 0;
    char v17 = v14;
    do
    {
      if (v15 + 4 > __smax) {
        goto LABEL_77;
      }
      uint64_t v18 = *(unsigned int *)&__src[v15];
      if (v18 < 4) {
        goto LABEL_77;
      }
      BOOL v19 = __CFADD__(v18, v15);
      rsize_t v20 = v18 + v15;
      if (v19 || v20 > __smax) {
        goto LABEL_77;
      }
      if (v12)
      {
        unint64_t v21 = a1[2];
        unint64_t v22 = (*a1)++;
        *(void *)(v21 + 8 * v22) = v15;
      }
      ++v16;
      rsize_t v15 = v20;
    }
    while (v20 < __smax);
    if (v20 != __smax) {
      goto LABEL_77;
    }
    if ((v17 & 1) == 0) {
      break;
    }
    if (v16 > 0xFFFFFFFE) {
      goto LABEL_77;
    }
    unint64_t v23 = a1[1];
    if (v23 < v16)
    {
      unint64_t v24 = a1[1];
      do
      {
        if (v24) {
          v24 *= 2;
        }
        else {
          unint64_t v24 = 16;
        }
      }
      while (v24 < v16);
      if (v24 > v23)
      {
        a1[1] = v24;
        if (8 * v24 >= 0x2000000001)
        {
          *__error() = 12;
        }
        else
        {
          __int16 v25 = (void *)a1[2];
          char v26 = realloc(v25, 8 * v24);
          if (v26)
          {
            a1[2] = (unint64_t)v26;
            goto LABEL_24;
          }
          free(v25);
        }
        a1[2] = 0;
LABEL_77:
        *a1 = 0;
        a1[3] = 0;
        AAFieldKey v46 = "invalid XAT blob";
        __int16 v47 = 72;
LABEL_78:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithEncodedData", v47, 104, 0, v46, a7, a8, v48);
        *a1 = 0;
        a1[3] = 0;
        return 0xFFFFFFFFLL;
      }
    }
LABEL_24:
    if ((__smax & 0x8000000000000000) != 0) {
      goto LABEL_77;
    }
    rsize_t v27 = *v13;
    if (*v13 < __smax)
    {
      do
      {
        while (!v27)
        {
          rsize_t v27 = 0x4000;
          size_t v29 = 0x4000;
          if (__smax <= 0x4000) {
            goto LABEL_34;
          }
        }
        rsize_t v28 = v27 >> 1;
        if ((v27 & (v27 >> 1)) != 0) {
          rsize_t v28 = v27 & (v27 >> 1);
        }
        v27 += v28;
      }
      while (v27 < __smax);
      size_t v29 = v27;
      if (v27 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_71;
      }
LABEL_34:
      uint64_t v30 = (void *)a1[5];
      AAFieldKey v31 = realloc(v30, v29);
      if (v31)
      {
        a1[4] = v29;
        a1[5] = (unint64_t)v31;
        goto LABEL_36;
      }
      free(v30);
LABEL_71:
      *char v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      goto LABEL_77;
    }
LABEL_36:
    char v14 = 0;
    char v12 = 1;
    if (v17) {
      continue;
    }
    break;
  }
  *char v8 = 0;
  if ((__smax & 0x8000000000000000) != 0) {
    goto LABEL_77;
  }
  rsize_t v32 = *v13;
  if (*v13 < __smax)
  {
    size_t v33 = 0x4000;
    do
    {
      while (!v32)
      {
        rsize_t v32 = 0x4000;
        if (__smax <= 0x4000) {
          goto LABEL_50;
        }
      }
      rsize_t v34 = v32 >> 1;
      if ((v32 & (v32 >> 1)) != 0) {
        rsize_t v34 = v32 & (v32 >> 1);
      }
      v32 += v34;
    }
    while (v32 < __smax);
    size_t v33 = v32;
    if (v32 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_76;
    }
LABEL_50:
    AAFieldKey v35 = (void *)a1[5];
    uint64_t v36 = realloc(v35, v33);
    if (v36)
    {
      a1[4] = v33;
      a1[5] = (unint64_t)v36;
      goto LABEL_52;
    }
    free(v35);
LABEL_76:
    *unsigned int v13 = 0;
    v13[1] = 0;
    goto LABEL_77;
  }
LABEL_52:
  unint64_t v37 = a1[5];
  if (__src)
  {
    memcpy((void *)(v37 + *v8), __src, __smax);
  }
  else if (v37)
  {
    memset_s((void *)(v37 + *v8), __smax, 0, __smax);
  }
  a1[3] += __smax;
  unint64_t v38 = *a1;
  if (*a1)
  {
    unint64_t v39 = 0;
    while (1)
    {
      if (v38 <= v39)
      {
        uint64_t v40 = 0;
        uint64_t v41 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v40 = (unsigned int *)(a1[5] + *(void *)(a1[2] + 8 * v39));
        uint64_t v41 = *v40;
        if (v41 < 5)
        {
LABEL_69:
          AAFieldKey v46 = "invalid XAT key";
          __int16 v47 = 84;
          goto LABEL_78;
        }
      }
      int v42 = (unsigned __int8 *)(v40 + 1);
      uint64_t v43 = v41 - 4;
      while (*v42++)
      {
        if (!--v43) {
          goto LABEL_69;
        }
      }
      uint64_t result = 0;
      if (++v39 == v38) {
        return result;
      }
    }
  }
  return 0;
}

uint64_t aaEntryXATBlobInitWithPath(AAEntryXATBlob_impl *a1, char *__s, const char *a3)
{
  char v3 = (char)__s;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((concatPath(v16, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithPath", 99, 104, 0, "invalid path %s/%s", v5, v6, v3);
    return 0xFFFFFFFFLL;
  }
  int v7 = open(v16, 0x200000);
  if (v7 < 0)
  {
    int v12 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithPath", 110, 104, v12, "open: %s", v13, v14, (char)v16);
    return 0xFFFFFFFFLL;
  }
  int v8 = v7;
  if ((aaEntryXATBlobInitWithFD(a1, v7) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithPath", 112, 104, 0, "aaEntryXATBlobInitWithFD failed: %s", v9, v10, (char)v16);
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v11 = 0;
  }
  close(v8);
  return v11;
}

uint64_t aaEntryXATBlobInitWithFD(AAEntryXATBlob_impl *a1, int fd)
{
  *(void *)a1 = 0;
  *((void *)a1 + 3) = 0;
  ssize_t v4 = flistxattr(fd, 0, 0, 0);
  if (v4 < 1)
  {
    uint64_t v6 = 0;
    int v7 = 0;
LABEL_5:
    free(v6);
    free(v7);
    return 0;
  }
  size_t v5 = v4;
  if ((unint64_t)v4 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_27:
    unint64_t v21 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 144, 104, *v21, "malloc", v22, v23, v35);
    uint64_t v6 = 0;
    int v7 = 0;
    goto LABEL_28;
  }
  uint64_t v9 = (char *)malloc(v4);
  if (!v9) {
    goto LABEL_27;
  }
  int v7 = v9;
  ssize_t v10 = flistxattr(fd, v9, v5, 0);
  if (v10 < 1)
  {
    int v24 = *__error();
    rsize_t v27 = "listxattr";
    __int16 v28 = 153;
    goto LABEL_30;
  }
  uint64_t v11 = 0;
  uint64_t v6 = 0;
  size_t v12 = 0;
  uint64_t v13 = v7;
  ssize_t v36 = v10;
  while (v7[v11])
  {
    ++v11;
LABEL_25:
    if (v11 == v10) {
      goto LABEL_5;
    }
  }
  unint64_t v14 = fgetxattr(fd, v13, 0, 0, 0, 0);
  if ((v14 & 0x8000000000000000) != 0)
  {
    int v29 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 167, 104, v29, "getxattr failed for name=%s", v30, v31, (char)v13);
    goto LABEL_28;
  }
  unsigned int v17 = v14;
  if (v14 >= 0xFFFFFFFF)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 169, 104, 0, "attribute data is too large name=%s", v15, v16, (char)v13);
    goto LABEL_28;
  }
  if (v14 <= v12)
  {
    uint64_t v18 = v6;
    goto LABEL_22;
  }
  do
  {
    if (v12) {
      v12 += v12 >> 1;
    }
    else {
      size_t v12 = 256;
    }
  }
  while (v14 > v12);
  if (v12 < 0x2000000001)
  {
    uint64_t v18 = (uint8_t *)realloc(v6, v12);
    if (!v18)
    {
      free(v6);
      goto LABEL_37;
    }
LABEL_22:
    if (fgetxattr(fd, v13, v18, v12, 0, 0) < 0)
    {
      int v32 = *__error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 187, 104, v32, "getxattr failed for name=%s", v33, v34, (char)v13);
    }
    else
    {
      if ((AAEntryXATBlobAppendEntry(a1, v13, v18, v17) & 0x80000000) == 0)
      {
        uint64_t v13 = &v7[++v11];
        uint64_t v6 = v18;
        ssize_t v10 = v36;
        goto LABEL_25;
      }
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 190, 104, 0, "inserting XAT entry", v19, v20, v35);
    }
    uint64_t v6 = v18;
    goto LABEL_28;
  }
  *__error() = 12;
LABEL_37:
  int v24 = *__error();
  rsize_t v27 = "malloc";
  __int16 v28 = 178;
LABEL_30:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", v28, 104, v24, v27, v25, v26, v35);
  uint64_t v6 = 0;
LABEL_28:
  free(v6);
  free(v7);
  *(void *)a1 = 0;
  *((void *)a1 + 3) = 0;
  return 0xFFFFFFFFLL;
}

int AAEntryXATBlobAppendEntry(AAEntryXATBlob xat, const char *key, const uint8_t *data, size_t data_size)
{
  size_t v8 = strlen(key);
  size_t v11 = v8 + 1;
  size_t v12 = v8 + 5;
  if (v8 + 1 >= 0xFFFFFFFFFFFFFFFCLL || (rsize_t v15 = data_size + v12, __CFADD__(data_size, v12)) || v15 >= 0xFFFFFFFF)
  {
    uint64_t v13 = "invalid attribute size";
    __int16 v14 = 377;
LABEL_49:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobAppendEntry", v14, 104, 0, v13, v9, v10, (char)v43);
    return -1;
  }
  if (v15 < 4) {
    goto LABEL_48;
  }
  uint64_t v16 = (void *)((char *)xat + 24);
  unint64_t v17 = *((void *)xat + 3);
  unint64_t v18 = v17 + v15;
  if (__CFADD__(v17, v15)) {
    goto LABEL_48;
  }
  uint64_t v20 = *(void *)xat;
  unint64_t v19 = *((void *)xat + 1);
  unint64_t v21 = *(void *)xat + 1;
  if (v19 < v21)
  {
    unint64_t v22 = *((void *)xat + 1);
    do
    {
      if (v22) {
        v22 *= 2;
      }
      else {
        unint64_t v22 = 16;
      }
    }
    while (v22 < v21);
    if (v22 > v19)
    {
      int v24 = (void *)((char *)xat + 16);
      uint64_t v23 = (void **)*((void *)xat + 2);
      *((void *)xat + 1) = v22;
      if (8 * v22 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_47:
        *(void *)xat = 0;
        *int v24 = 0;
        *((void *)xat + 3) = 0;
        goto LABEL_48;
      }
      uint64_t v43 = v23;
      uint64_t v44 = v20;
      uint64_t v25 = realloc(v23, 8 * v22);
      if (!v25)
      {
        free(v43);
        goto LABEL_47;
      }
      *int v24 = v25;
      uint64_t v20 = v44;
    }
  }
  if ((v18 & 0x8000000000000000) != 0) {
    goto LABEL_43;
  }
  size_t v26 = *((void *)xat + 4);
  if (v26 < v18)
  {
    do
    {
      while (!v26)
      {
        size_t v26 = 0x4000;
        if (v18 <= 0x4000)
        {
          size_t v26 = 0x4000;
          goto LABEL_29;
        }
      }
      size_t v27 = v26 >> 1;
      if ((v26 & (v26 >> 1)) != 0) {
        size_t v27 = v26 & (v26 >> 1);
      }
      v26 += v27;
    }
    while (v26 < v18);
    if (v26 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_42;
    }
LABEL_29:
    uint64_t v45 = v20;
    __int16 v28 = (void *)*((void *)xat + 5);
    int v29 = realloc(v28, v26);
    if (v29)
    {
      *((void *)xat + 4) = v26;
      *((void *)xat + 5) = v29;
      uint64_t v20 = v45;
      goto LABEL_31;
    }
    free(v28);
LABEL_42:
    *((void *)xat + 4) = 0;
    *((void *)xat + 5) = 0;
LABEL_43:
    *(void *)xat = 0;
    *((void *)xat + 3) = 0;
    goto LABEL_48;
  }
LABEL_31:
  uint64_t v30 = *v16;
  unint64_t v31 = *v16 + v15;
  if (__CFADD__(*v16, v15) || (v31 & 0x8000000000000000) != 0) {
    goto LABEL_48;
  }
  if (v26 < v31)
  {
    do
    {
      while (!v26)
      {
        size_t v26 = 0x4000;
        if (v31 <= 0x4000)
        {
          uint64_t v46 = v20;
          uint64_t v33 = (void **)((char *)xat + 40);
          size_t v26 = 0x4000;
          goto LABEL_53;
        }
      }
      size_t v32 = v26 >> 1;
      if ((v26 & (v26 >> 1)) != 0) {
        size_t v32 = v26 & (v26 >> 1);
      }
      v26 += v32;
    }
    while (v26 < v31);
    uint64_t v33 = (void **)((char *)xat + 40);
    if (v26 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_61;
    }
    uint64_t v46 = v20;
LABEL_53:
    uint64_t v43 = v33;
    unint64_t v37 = *v33;
    uint64_t v34 = (char *)realloc(v37, v26);
    if (v34)
    {
      *((void *)xat + 5) = v34;
      char v35 = (void *)((char *)xat + 40);
      *((void *)xat + 4) = v26;
      uint64_t v30 = *((void *)xat + 3);
      goto LABEL_55;
    }
    free(v37);
    uint64_t v33 = v43;
LABEL_61:
    *uint64_t v33 = 0;
    *uint64_t v16 = 0;
    *((void *)xat + 4) = 0;
    goto LABEL_48;
  }
  uint64_t v46 = v20;
  char v35 = (void *)((char *)xat + 40);
  uint64_t v34 = (char *)*((void *)xat + 5);
  if (v34)
  {
LABEL_55:
    memset_s(&v34[v30], v15, 0, v15);
    uint64_t v30 = *v16;
  }
  *((void *)xat + 3) = v30 + v15;
  uint64_t v38 = *((void *)xat + 2);
  uint64_t v39 = (*(void *)xat)++;
  *(void *)(v38 + 8 * v39) = v17;
  if (v17 >= 0xFFFFFFFFFFFFFFFCLL || v17 + 4 > *v16 || (*(_DWORD *)(*v35 + v17) = v15, v46 < 0))
  {
LABEL_48:
    uint64_t v13 = "alloc XAT entry";
    __int16 v14 = 381;
    goto LABEL_49;
  }
  uint64_t v40 = *((void *)xat + 5);
  uint64_t v41 = *(void *)(*((void *)xat + 2) + 8 * v46);
  *(_DWORD *)(v40 + v41) = v15;
  int v42 = (char *)(v40 + v41 + 4);
  memcpy(v42, key, v11);
  memcpy(&v42[v11], data, data_size);
  return 0;
}

AAEntryXATBlob AAEntryXATBlobCreateWithEncodedData(const uint8_t *data, size_t data_size)
{
  ssize_t v4 = (unint64_t *)AAEntryXATBlobCreate();
  uint64_t v10 = (AAEntryXATBlob_impl *)v4;
  if (v4 && (aaEntryXATBlobInitWithEncodedData(v4, (char *)data, data_size, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    AAEntryXATBlobDestroy(v10);
    return 0;
  }
  return v10;
}

AAEntryXATBlob AAEntryXATBlobCreateWithPath(const char *dir, const char *path, AAFlagSet flags)
{
  uint64_t v5 = AAEntryXATBlobCreate();
  uint64_t v6 = v5;
  if (v5 && (aaEntryXATBlobInitWithPath(v5, (char *)dir, path) & 0x80000000) != 0)
  {
    AAEntryXATBlobDestroy(v6);
    return 0;
  }
  return v6;
}

int AAEntryXATBlobClear(AAEntryXATBlob xat)
{
  *(void *)xat = 0;
  *((void *)xat + 3) = 0;
  return 0;
}

int AAEntryXATBlobApplyToPath(AAEntryXATBlob xat, const char *dir, const char *path, AAFlagSet flags)
{
  char v4 = flags;
  char v5 = (char)dir;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((concatPath(v23, 0x800uLL, (char *)dir, path) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobApplyToPath", 299, 104, 0, "invalid path %s/%s", v7, v8, v5);
    return -1;
  }
  int v9 = open(v23, 0x200000);
  if (v9 < 0)
  {
    int v19 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobApplyToPath", 304, 104, v19, "open: %s", v20, v21, (char)v23);
    return -1;
  }
  int v15 = v9;
  if ((aaEntryXATBlobApplyToFD(xat, v9, v4, v10, v11, v12, v13, v14) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobApplyToPath", 306, 104, 0, "applying XAT blob: %s", v16, v17, (char)v23);
    int v18 = -1;
  }
  else
  {
    int v18 = 0;
  }
  close(v15);
  return v18;
}

uint32_t AAEntryXATBlobGetEntryCount(AAEntryXATBlob xat)
{
  return *(_DWORD *)xat;
}

int AAEntryXATBlobGetEntry(AAEntryXATBlob xat, uint32_t i, size_t key_capacity, char *key, size_t *key_length, size_t data_capacity, uint8_t *data, size_t *data_size)
{
  if (*(void *)xat <= (unint64_t)i)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobGetEntry", 328, 104, 0, "invalid XAT index %u", (uint64_t)data, (uint64_t)data_size, i);
    return -1;
  }
  uint64_t v8 = (unsigned int *)(*((void *)xat + 5) + *(void *)(*((void *)xat + 2) + 8 * i));
  int v9 = v8 + 1;
  unint64_t v10 = *v8;
  if (v10 < 5) {
    goto LABEL_15;
  }
  size_t v14 = 0;
  while (v9[v14])
  {
    if ((unint64_t)++v14 + 4 >= v10) {
      goto LABEL_15;
    }
  }
  if ((int)v10 - 5 - (int)v14 >= v10)
  {
LABEL_15:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobGetEntry", 338, 104, 0, "invalid XAT blob", (uint64_t)data, (uint64_t)data_size, v17);
    return -1;
  }
  size_t v15 = (v10 - 5 - v14);
  if (key_length) {
    *key_length = v14;
  }
  if (data_size) {
    *data_size = v15;
  }
  if (v14 >= key_capacity)
  {
    if (key_capacity) {
      return -1;
    }
  }
  else
  {
    memcpy(key, v9, v14);
    key[v14] = 0;
  }
  if (v15 > data_capacity)
  {
    if (!data_capacity) {
      return 0;
    }
    return -1;
  }
  memcpy(data, (char *)v8 + v10 - (v10 - 5 - v14), (v10 - 5 - v14));
  return 0;
}

int AAEntryXATBlobSetEntry(AAEntryXATBlob xat, uint32_t i, const char *key, const uint8_t *data, size_t data_size)
{
  if (*(void *)xat <= (unint64_t)i)
  {
    uint64_t v24 = "invalid XAT index";
    __int16 v25 = 401;
    goto LABEL_11;
  }
  size_t v12 = strlen(key);
  size_t v13 = v12 + 1;
  size_t v14 = v12 + 5;
  if (v12 + 1 >= 0xFFFFFFFFFFFFFFFCLL || (unint64_t v15 = data_size + v14, __CFADD__(data_size, v14)) || v15 >= 0xFFFFFFFF)
  {
    uint64_t v24 = "invalid attribute size";
    __int16 v25 = 409;
    goto LABEL_11;
  }
  if (v15 < 4) {
    goto LABEL_8;
  }
  unint64_t v16 = i;
  unint64_t v17 = *(void *)(*((void *)xat + 2) + 8 * i);
  int v18 = (char *)*((void *)xat + 5);
  unint64_t v19 = *(unsigned int *)&v18[v17];
  unint64_t v20 = v17 + v19;
  if (__CFADD__(v17, v19)
    || (uint64_t v21 = (unint64_t *)((char *)xat + 24), v22 = *((void *)xat + 3), v23 = v22 - v20, v22 < v20))
  {
LABEL_8:
    uint64_t v24 = "alloc XAT entry";
    __int16 v25 = 412;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobSetEntry", v25, 104, 0, v24, v5, v6, v48);
    return -1;
  }
  uint64_t v27 = v15 - v19;
  if (v15 > v19)
  {
    unint64_t v28 = v22 + v27;
    if ((uint64_t)(v22 + v27) < 0) {
      goto LABEL_8;
    }
    unint64_t v29 = *((void *)xat + 4);
    if (v29 < v28)
    {
      size_t v30 = 0x4000;
      do
      {
        while (!v29)
        {
          unint64_t v29 = 0x4000;
          if (v28 <= 0x4000) {
            goto LABEL_29;
          }
        }
        unint64_t v31 = v29 >> 1;
        if ((v29 & (v29 >> 1)) != 0) {
          unint64_t v31 = v29 & (v29 >> 1);
        }
        v29 += v31;
      }
      while (v29 < v28);
      size_t v30 = v29;
      if (v29 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_44;
      }
LABEL_29:
      uint64_t v50 = v27;
      unint64_t v51 = v16;
      size_t v49 = v30;
      unint64_t v37 = (char *)realloc(v18, v30);
      if (v37)
      {
        uint64_t v27 = v50;
        *((void *)xat + 4) = v49;
        *((void *)xat + 5) = v37;
        int v18 = v37;
        unint64_t v16 = v51;
        uint64_t v21 = (unint64_t *)((char *)xat + 24);
        size_t v23 = v22 - v20;
        goto LABEL_31;
      }
      free(v18);
LABEL_44:
      *((void *)xat + 3) = 0;
      *((void *)xat + 4) = 0;
      *((void *)xat + 5) = 0;
      goto LABEL_8;
    }
LABEL_31:
    if (v22 != v20)
    {
      uint64_t v38 = &v18[v20];
      uint64_t v39 = &v18[v20 + v27];
      uint64_t v40 = v21;
      unint64_t v41 = v16;
      uint64_t v42 = v27;
      memmove(v39, v38, v23);
      uint64_t v27 = v42;
      unint64_t v16 = v41;
      uint64_t v21 = v40;
    }
    unint64_t v22 = *v21 + v27;
    goto LABEL_34;
  }
  if (v15 < v19)
  {
    uint64_t v32 = v19 - v15;
    if (v22 != v20)
    {
      uint64_t v33 = &v18[v20];
      uint64_t v34 = &v18[v20 - v32];
      unint64_t v35 = v16;
      uint64_t v36 = v32;
      memmove(v34, v33, v23);
      uint64_t v32 = v36;
      unint64_t v16 = v35;
      uint64_t v21 = (unint64_t *)((char *)xat + 24);
      unint64_t v20 = *((void *)xat + 3);
    }
    unint64_t v22 = v20 - v32;
LABEL_34:
    *uint64_t v21 = v22;
  }
  if (v17 >= 0xFFFFFFFFFFFFFFFCLL || v17 + 4 > v22) {
    goto LABEL_8;
  }
  *(_DWORD *)(*((void *)xat + 5) + v17) = v15;
  if (*(void *)xat > v16)
  {
    unint64_t v43 = v16;
    while (v17 < 0xFFFFFFFFFFFFFFFCLL && v17 + 4 <= *v21)
    {
      uint64_t v44 = *(unsigned int *)(*((void *)xat + 5) + v17);
      *(void *)(*((void *)xat + 2) + 8 * v43) = v17;
      v17 += v44;
      if (++v43 >= *(void *)xat) {
        goto LABEL_42;
      }
    }
    goto LABEL_8;
  }
LABEL_42:
  uint64_t v45 = *((void *)xat + 5);
  uint64_t v46 = *(void *)(*((void *)xat + 2) + 8 * v16);
  *(_DWORD *)(v45 + v46) = v15;
  __int16 v47 = (char *)(v45 + v46 + 4);
  memcpy(v47, key, v13);
  memcpy(&v47[v13], data, data_size);
  return 0;
}

int AAEntryXATBlobRemoveEntry(AAEntryXATBlob xat, uint32_t i)
{
  uint64_t v4 = *(void *)xat;
  if (*(void *)xat <= (unint64_t)i
    || (unint64_t v6 = i,
        uint64_t v7 = *(void *)(*((void *)xat + 2) + 8 * i),
        uint64_t v8 = *((void *)xat + 5),
        uint64_t v9 = *(unsigned int *)(v8 + v7),
        BOOL v10 = __CFADD__(v7, v9),
        unint64_t v11 = v7 + v9,
        v10)
    || (unint64_t v12 = *((void *)xat + 3), v12 < v11))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobRemoveEntry", 426, 104, 0, "invalid XAT index %u", v2, v3, i);
    return -1;
  }
  else
  {
    if (v9)
    {
      if (v12 != v11)
      {
        memmove((void *)(v8 + v11 - v9), (const void *)(v8 + v11), v12 - v11);
        unint64_t v11 = *((void *)xat + 3);
        uint64_t v4 = *(void *)xat;
      }
      *((void *)xat + 3) = v11 - v9;
    }
    unint64_t v14 = v4 - 1;
    *(void *)xat = v14;
    if (v14 > v6)
    {
      uint64_t v15 = *((void *)xat + 2);
      do
      {
        *(void *)(v15 + 8 * v6) = *(void *)(v15 + 8 * v6 + 8) - v9;
        ++v6;
      }
      while (v6 < *(void *)xat);
    }
    return 0;
  }
}

size_t AAEntryXATBlobGetEncodedSize(AAEntryXATBlob xat)
{
  return *((void *)xat + 3);
}

const uint8_t *__cdecl AAEntryXATBlobGetEncodedData(AAEntryXATBlob xat)
{
  return (const uint8_t *)*((void *)xat + 5);
}

uint64_t loadAndDecodeHeader_Ustar(uint64_t a1, uint64_t *a2)
{
  *(void *)&v145[1022] = *MEMORY[0x263EF8340];
  if (AAHeaderAssign(*(AAHeader *)(a1 + 88), *(AAHeader *)(a1 + 96)) < 0)
  {
    unint64_t v16 = "init header";
    __int16 v17 = 199;
    goto LABEL_239;
  }
  if ((decodeStreamLoadHeader((void *)a1, 0x200uLL, v4, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    unint64_t v16 = "invalid tar archive";
    __int16 v17 = 202;
    goto LABEL_239;
  }
  BOOL v10 = *(unsigned char **)(a1 + 64);
  if (isZero(v10, 512))
  {
    if ((decodeStreamLoadHeader((void *)a1, 0x400uLL, v11, v12, v13, v14, v8, v9) & 0x80000000) != 0)
    {
      unint64_t v16 = "invalid tar archive";
      __int16 v17 = 207;
      goto LABEL_239;
    }
    if (!isZero(*(unsigned char **)(a1 + 64), 1024))
    {
      unint64_t v16 = "Invalid EOF record header";
      __int16 v17 = 209;
      goto LABEL_239;
    }
    return 1;
  }
  while (1)
  {
    while (1)
    {
      uint64_t v18 = *(void *)(a1 + 72);
      unint64_t v19 = &v10[v18];
      unint64_t v20 = &v10[v18 - 356];
      int v21 = *v20;
      if (v21 != 120 && v21 != 103) {
        break;
      }
      uint64_t v142 = 0;
      if ((tarParseInt(v19 - 388, 0xCuLL, &v142) & 0x80000000) != 0)
      {
        unint64_t v16 = "invalid pax header";
        __int16 v17 = 229;
        goto LABEL_239;
      }
      uint64_t v26 = v142;
      if (v21 == 103 && AAHeaderClear(*(AAHeader *)(a1 + 88)) < 0)
      {
        unint64_t v16 = "clear header";
        __int16 v17 = 233;
        goto LABEL_239;
      }
      if ((decodeStreamLoadHeader((void *)a1, v18 + ((v26 + 511) & 0xFFFFFFFFFFFFFE00) + 512, v22, v23, v24, v25, v8, v9) & 0x80000000) != 0)
      {
        unint64_t v16 = "truncated stream";
        __int16 v17 = 236;
        goto LABEL_239;
      }
      if (v26)
      {
        uint64_t v27 = 0;
        uint64_t v28 = *(void *)(a1 + 64) + v18;
        unint64_t v29 = v28 + v26;
        unint64_t v133 = v28 + v26;
        while (1)
        {
          __endptr = 0;
          uint64_t v30 = strtoll((const char *)(v28 + v27), &__endptr, 10);
          if (!v30
            || ((v27 += v30, unint64_t v31 = __endptr, v27 <= v26) ? (v32 = (unint64_t)__endptr > v29) : (v32 = 1),
                v32 || (uint64_t v33 = (char *)(v27 - 1), v34 = (char *)(v28 + v27 - 1), *v34 != 10)))
          {
            unint64_t v16 = "invalid xhdr entry";
            __int16 v17 = 249;
            goto LABEL_239;
          }
          v33[v28] = 0;
          unint64_t v35 = &v31[-v28];
          if (&v31[-v28] < v33)
          {
            while (1)
            {
              int v36 = *v31++;
              if (v36 != 32) {
                break;
              }
              if (++v35 >= v33) {
                goto LABEL_142;
              }
            }
          }
          if (v35 >= v33)
          {
LABEL_142:
            unint64_t v16 = "invalid xhdr entry";
            __int16 v17 = 257;
            goto LABEL_239;
          }
          uint64_t v37 = v28;
          while (v35[v37] != 61)
          {
            --v33;
            ++v37;
            if (v35 == v33) {
              goto LABEL_142;
            }
          }
          v132 = a2;
          v35[v37] = 0;
          uint64_t v38 = &v35[v37 + 1];
          fprintf((FILE *)*MEMORY[0x263EF8348], "xhdr %s: %s\n", &v35[v28], v38);
          if (!strcmp(&v35[v28], "size"))
          {
            v41.iAAFieldKey key = 5521732;
            int v39 = 5;
LABEL_42:
            char v40 = 1;
            goto LABEL_47;
          }
          if (!strcmp(&v35[v28], "path"))
          {
            char v40 = 0;
            int v39 = 2;
            v41.iAAFieldKey key = 5521744;
            goto LABEL_47;
          }
          if (!strcmp(&v35[v28], "uid")) {
            break;
          }
          if (!strcmp(&v35[v28], "gid"))
          {
            char v40 = 1;
            v41.iAAFieldKey key = 4475207;
            goto LABEL_46;
          }
          if (!strcmp(&v35[v28], "uname"))
          {
            v41.iAAFieldKey key = 5130581;
            int v39 = 2;
            goto LABEL_42;
          }
          if (!strcmp(&v35[v28], "gname"))
          {
            int v39 = 2;
            char v40 = 1;
            v41.iAAFieldKey key = 5130567;
          }
          else if (!strcmp(&v35[v28], "linkpath"))
          {
            char v40 = 0;
            int v39 = 2;
            v41.iAAFieldKey key = 4935244;
          }
          else
          {
            if (strcmp(&v35[v28], "mtime")) {
              goto LABEL_94;
            }
            int v39 = 4;
            char v40 = 1;
            v41.iAAFieldKey key = 5067853;
          }
LABEL_47:
          int v42 = *(unsigned __int8 *)v38;
          if (*v38)
          {
            switch(v39)
            {
              case 1:
                AAFieldKey v43 = v41;
                uint64_t v44 = strtoll(v38, &__endptr, 10);
                if (__endptr != v34)
                {
                  unint64_t v16 = "xhdr value parsing";
                  __int16 v17 = 295;
                  goto LABEL_239;
                }
                uint64_t v45 = v44;
                uint64_t v46 = *(AAHeader_impl **)(a1 + 88);
                AAFieldKey v47 = v43;
                int KeyIndex = AAHeaderGetKeyIndex(v46, v47);
                if (KeyIndex < 0) {
                  uint32_t v49 = -1;
                }
                else {
                  uint32_t v49 = KeyIndex;
                }
                AAFieldKey v50 = v43;
                if (AAHeaderSetFieldUInt(v46, v49, v50, v45) < 0)
                {
                  unint64_t v16 = "creating header";
                  __int16 v17 = 296;
                  goto LABEL_239;
                }
                break;
              case 2:
                AAFieldKey key = v41;
                char v53 = v40;
                size_t v54 = strlen(&v35[v37 + 1]);
                size_t v55 = v54;
                if (v53) {
                  goto LABEL_88;
                }
                AAFieldKey v56 = key;
                if (v54 == 1)
                {
                  if (v42 == 46)
                  {
                    size_t v55 = 0;
                    goto LABEL_89;
                  }
                  size_t v55 = 1;
LABEL_86:
                  if (v38[v55 - 1] == 47) {
                    --v55;
                  }
                  goto LABEL_88;
                }
                if (!v54) {
                  goto LABEL_89;
                }
                if (v42 != 46) {
                  goto LABEL_86;
                }
                if (v35[v37 + 2] != 47) {
                  goto LABEL_86;
                }
                uint64_t v38 = &v35[v37 + 3];
                size_t v55 = v54 - 2;
                if (v54 != 2) {
                  goto LABEL_86;
                }
LABEL_88:
                AAFieldKey v56 = key;
LABEL_89:
                AAFieldKey v72 = *(AAHeader_impl **)(a1 + 88);
                AAFieldKey v73 = v56;
                int v74 = AAHeaderGetKeyIndex(v72, v56);
                if (v74 < 0) {
                  uint32_t v75 = -1;
                }
                else {
                  uint32_t v75 = v74;
                }
                AAFieldKey v76 = v73;
                if (AAHeaderSetFieldString(v72, v75, v76, v38, v55) < 0)
                {
                  unint64_t v16 = "creating header";
                  __int16 v17 = 309;
                  goto LABEL_239;
                }
                uint64_t v26 = v142;
                break;
              case 4:
                AAFieldKey v57 = v41;
                value.unint64_t tv_sec = 0;
                value.uint64_t tv_nsec = 0;
                value.unint64_t tv_sec = strtoll(v38, &__endptr, 10);
                v58 = __endptr;
                if (__endptr && *__endptr == 46)
                {
                  value.uint64_t tv_nsec = strtoll(__endptr + 1, &__endptr, 10);
                  v58 = __endptr;
                }
                if (v58 != v34)
                {
                  unint64_t v16 = "xhdr value parsing";
                  __int16 v17 = 317;
                  goto LABEL_239;
                }
                AAFieldKey v59 = *(AAHeader_impl **)(a1 + 88);
                AAFieldKey v60 = v57;
                int v61 = AAHeaderGetKeyIndex(v59, v60);
                if (v61 < 0) {
                  uint32_t v62 = -1;
                }
                else {
                  uint32_t v62 = v61;
                }
                AAFieldKey v63 = v57;
                if (AAHeaderSetFieldTimespec(v59, v62, v63, &value) < 0)
                {
                  unint64_t v16 = "creating header";
                  __int16 v17 = 318;
                  goto LABEL_239;
                }
                break;
              case 5:
                AAFieldKey v64 = v41;
                uint64_t v65 = strtoll(v38, &__endptr, 10);
                if (__endptr != v34)
                {
                  unint64_t v16 = "xhdr value parsing";
                  __int16 v17 = 288;
                  goto LABEL_239;
                }
                uint64_t v66 = v65;
                char v67 = *(AAHeader_impl **)(a1 + 88);
                AAFieldKey v68 = v64;
                int v69 = AAHeaderGetKeyIndex(v67, v68);
                if (v69 < 0) {
                  uint32_t v70 = -1;
                }
                else {
                  uint32_t v70 = v69;
                }
                AAFieldKey v71 = v64;
                if (AAHeaderSetFieldBlob(v67, v70, v71, v66) < 0)
                {
                  unint64_t v16 = "creating header";
                  __int16 v17 = 289;
                  goto LABEL_239;
                }
                break;
              default:
                break;
            }
          }
          else
          {
            unint64_t v51 = *(AAHeader_impl **)(a1 + 88);
            uint32_t v52 = AAHeaderGetKeyIndex(v51, v41);
            if ((v52 & 0x80000000) == 0 && AAHeaderRemoveField(v51, v52) < 0)
            {
              unint64_t v16 = "removing header field";
              __int16 v17 = 278;
              goto LABEL_239;
            }
          }
LABEL_94:
          a2 = v132;
          unint64_t v29 = v133;
          if (v27 >= v26) {
            goto LABEL_95;
          }
        }
        v41.iAAFieldKey key = 4475221;
        char v40 = 1;
LABEL_46:
        int v39 = 1;
        goto LABEL_47;
      }
LABEL_95:
      if (*v20 == 103 && AAHeaderAssign(*(AAHeader *)(a1 + 96), *(AAHeader *)(a1 + 88)) < 0)
      {
        unint64_t v16 = "update global header";
        __int16 v17 = 330;
        goto LABEL_239;
      }
      BOOL v10 = *(unsigned char **)(a1 + 64);
    }
    if ((timespec v77 = *(AAHeader_impl **)(a1 + 88)) != 0
      && (v78.ikey = 5521744, uint32_t v79 = AAHeaderGetKeyIndex(*(AAHeader *)(a1 + 88), v78), (v79 & 0x80000000) == 0)
      && ((unsigned int FieldString = AAHeaderGetFieldString(v77, v79, 0x400uLL, &__s, 0), FieldString <= 1)
        ? (int v81 = 1)
        : (int v81 = FieldString),
          v81 < 0 || FieldString < 2))
    {
      if (v81 < 0) {
        goto LABEL_141;
      }
    }
    else
    {
      size_t v82 = 0;
      v83 = v19 - 512;
      do
      {
        if (!v83[v82]) {
          break;
        }
        ++v82;
      }
      while (v82 != 100);
      for (uint64_t i = 0; i != 155; ++i)
      {
        if (!v19[i - 167]) {
          break;
        }
      }
      do
      {
        size_t v85 = v82;
        if (!v82) {
          break;
        }
        --v82;
      }
      while (v83[v85 - 1] == 47);
      uint64_t v86 = i - 1022;
      while (v86 != -1022)
      {
        int v87 = v19[v86-- + 854];
        if (v87 != 47)
        {
          if (v85 + v86 >= 0xFFFFFFFFFFFFFBFFLL)
          {
            __memcpy_chk();
            uint64_t v88 = v86 + 1024;
            v145[v86 + 1021] = 47;
            goto LABEL_120;
          }
LABEL_141:
          unint64_t v16 = "invalid header";
          __int16 v17 = 337;
          goto LABEL_239;
        }
      }
      if (v85 - 1023 < 0xFFFFFFFFFFFFFBFFLL) {
        goto LABEL_141;
      }
      uint64_t v88 = 0;
LABEL_120:
      memcpy(&__s + v88, v19 - 512, v85);
      *(&__s + v88 + v85) = 0;
    }
    v89 = strrchr(&__s, 47);
    int v90 = (char)*v20;
    if (v90 != 48) {
      break;
    }
    if (v89) {
      p_s = v89 + 1;
    }
    else {
      p_s = &__s;
    }
    if (*p_s != 46) {
      goto LABEL_156;
    }
    v92 = v89 + 2;
    if (!v89) {
      v92 = &v144;
    }
    if (*v92 != 95)
    {
LABEL_156:
      int v100 = 0;
      int v101 = 0;
      int v102 = 0;
      int v103 = 0;
      int v104 = 1;
      uint64_t v105 = 70;
LABEL_157:
      v106.iAAFieldKey key = 5265748;
      if (AAHeaderSetFieldUInt(*(AAHeader *)(a1 + 88), 0xFFFFFFFF, v106, v105) < 0)
      {
        unint64_t v16 = "creating header";
        __int16 v17 = 394;
        goto LABEL_239;
      }
      v107.iAAFieldKey key = 5521744;
      if (AAHeaderGetKeyIndex(*(AAHeader *)(a1 + 88), v107) < 0)
      {
        v108 = &__s;
        size_t v109 = strlen(&__s);
        size_t v110 = v109;
        if (v109 == 1 && __s == 46)
        {
          size_t v110 = 0;
        }
        else
        {
          v108 = &__s;
          if (v109 >= 2 && __s == 46 && v144 == 47)
          {
            v108 = v145;
            size_t v110 = v109 - 2;
          }
        }
        v111.iAAFieldKey key = 5521744;
        if (AAHeaderSetFieldString(*(AAHeader *)(a1 + 88), 0xFFFFFFFF, v111, v108, v110) < 0)
        {
          unint64_t v16 = "creating header";
          __int16 v17 = 405;
          goto LABEL_239;
        }
      }
      if ((v100 | v101) == 1)
      {
        v112.iAAFieldKey key = 4935244;
        if (AAHeaderGetKeyIndex(*(AAHeader *)(a1 + 88), v112) < 0)
        {
          size_t v113 = 0;
          v114 = v19 - 355;
          while (v114[v113])
          {
            if (++v113 == 100) {
              goto LABEL_177;
            }
          }
          if (!v113)
          {
            unint64_t v16 = "invalid linkname";
            __int16 v17 = 412;
            goto LABEL_240;
          }
          if (v113 != 1)
          {
LABEL_177:
            if (*v114 == 46 && *(v19 - 354) == 47)
            {
              v114 = v19 - 353;
              v113 -= 2;
            }
          }
          v115.iAAFieldKey key = 4935244;
          if (AAHeaderSetFieldString(*(AAHeader *)(a1 + 88), 0xFFFFFFFF, v115, v114, v113) < 0)
          {
            unint64_t v16 = "creating header";
            __int16 v17 = 417;
            goto LABEL_239;
          }
        }
      }
      if ((v102 | v103) == 1)
      {
        value.unint64_t tv_sec = 0;
        uint64_t v142 = 0;
        if ((tarParseInt(v19 - 183, 8uLL, (unint64_t *)&value) & 0x80000000) != 0)
        {
          unint64_t v16 = "invalid header";
          __int16 v17 = 424;
          goto LABEL_239;
        }
        if ((tarParseInt(v19 - 175, 8uLL, &v142) & 0x80000000) != 0)
        {
          unint64_t v16 = "invalid header";
          __int16 v17 = 425;
          goto LABEL_239;
        }
        v116.iAAFieldKey key = 5653828;
        if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v116, value.tv_sec) & 0x80000000) != 0)
        {
          unint64_t v16 = "creating header";
          __int16 v17 = 426;
          goto LABEL_239;
        }
        v117.iAAFieldKey key = 3294532;
        if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v117, v142) & 0x80000000) != 0)
        {
          unint64_t v16 = "creating header";
          __int16 v17 = 427;
          goto LABEL_239;
        }
      }
      uint64_t size = 0;
      if ((tarParseInt(v19 - 388, 0xCuLL, &size) & 0x80000000) != 0)
      {
        unint64_t v16 = "invalid header";
        __int16 v17 = 432;
        goto LABEL_239;
      }
      if (v104)
      {
        v118.iAAFieldKey key = 5521732;
        uint32_t v119 = AAHeaderGetKeyIndex(*(AAHeader *)(a1 + 88), v118);
        if ((v119 & 0x80000000) != 0)
        {
          v120.iAAFieldKey key = 5521732;
          if (AAHeaderSetFieldBlob(*(AAHeader *)(a1 + 88), 0xFFFFFFFF, v120, size) < 0)
          {
            unint64_t v16 = "creating header";
            __int16 v17 = 438;
            goto LABEL_239;
          }
        }
        else
        {
          value.unint64_t tv_sec = 0;
          if (AAHeaderGetFieldBlob(*(AAHeader *)(a1 + 88), v119, &size, (uint64_t *)&value) < 0)
          {
            unint64_t v16 = "looking up header";
            __int16 v17 = 443;
            goto LABEL_239;
          }
        }
      }
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      uint64_t v136 = 0;
      if ((tarParseInt(v19 - 412, 8uLL, &v138) & 0x80000000) != 0)
      {
        unint64_t v16 = "invalid header";
        __int16 v17 = 449;
        goto LABEL_239;
      }
      if ((tarParseInt(v19 - 404, 8uLL, &v137) & 0x80000000) != 0)
      {
        unint64_t v16 = "invalid header";
        __int16 v17 = 450;
        goto LABEL_239;
      }
      if ((tarParseInt(v19 - 396, 8uLL, &v136) & 0x80000000) != 0)
      {
        unint64_t v16 = "invalid header";
        __int16 v17 = 451;
        goto LABEL_239;
      }
      v121.iAAFieldKey key = 4476749;
      if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v121, v138) & 0x80000000) != 0)
      {
        unint64_t v16 = "creating header";
        __int16 v17 = 452;
        goto LABEL_239;
      }
      v122.iAAFieldKey key = 4475221;
      if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v122, v137) & 0x80000000) != 0)
      {
        unint64_t v16 = "creating header";
        __int16 v17 = 453;
        goto LABEL_239;
      }
      v123.iAAFieldKey key = 4475207;
      if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v123, v136) & 0x80000000) != 0)
      {
        unint64_t v16 = "creating header";
        __int16 v17 = 454;
        goto LABEL_239;
      }
      v135.unint64_t tv_sec = 0;
      v135.uint64_t tv_nsec = 0;
      __darwin_time_t v134 = 0;
      if ((tarParseInt(v19 - 376, 0xCuLL, (unint64_t *)&v134) & 0x80000000) != 0)
      {
        unint64_t v16 = "invalid header";
        __int16 v17 = 459;
        goto LABEL_239;
      }
      v135.unint64_t tv_sec = v134;
      if ((appendFieldIfNotDefinedTimespec(*(AAHeader_impl **)(a1 + 88), &v135) & 0x80000000) != 0)
      {
        unint64_t v16 = "creating header";
        __int16 v17 = 461;
        goto LABEL_239;
      }
      size_t v124 = 0;
      v125 = v19 - 247;
      while (v125[v124])
      {
        if (++v124 == 32) {
          goto LABEL_229;
        }
      }
      if (v124)
      {
LABEL_229:
        v126.iAAFieldKey key = 5130581;
        if ((appendFieldIfNotDefinedString(*(AAHeader_impl **)(a1 + 88), v126, v125, v124) & 0x80000000) != 0)
        {
          unint64_t v16 = "creating header";
          __int16 v17 = 465;
          goto LABEL_239;
        }
      }
      size_t v127 = 0;
      v128 = v19 - 215;
      while (v128[v127])
      {
        if (++v127 == 32) {
          goto LABEL_235;
        }
      }
      if (v127)
      {
LABEL_235:
        v129.iAAFieldKey key = 5130567;
        if ((appendFieldIfNotDefinedString(*(AAHeader_impl **)(a1 + 88), v129, v128, v127) & 0x80000000) != 0)
        {
          unint64_t v16 = "creating header";
          __int16 v17 = 467;
          goto LABEL_239;
        }
      }
      uint64_t result = 0;
      *a2 = (size + 511) & 0xFFFFFFFFFFFFFE00;
      return result;
    }
    value.unint64_t tv_sec = 0;
    if ((tarParseInt(v19 - 388, 0xCuLL, (unint64_t *)&value) & 0x80000000) != 0)
    {
      unint64_t v16 = "invalid header";
      __int16 v17 = 346;
      goto LABEL_239;
    }
    unint64_t tv_sec = value.tv_sec;
    if ((decodeStreamLoadHeader((void *)a1, v18 + ((value.tv_sec + 511) & 0xFFFFFFFFFFFFFE00) + 512, v93, v94, v95, v96, v8, v9) & 0x80000000) != 0)
    {
      unint64_t v16 = "truncated stream";
      __int16 v17 = 350;
      goto LABEL_239;
    }
    if (tv_sec >= 0x18)
    {
      BOOL v10 = *(unsigned char **)(a1 + 64);
      BOOL v98 = *(void *)&v10[v18] == 0x20007160500 && *(void *)&v10[v18 + 8] == 0x5820534F2063614DLL;
      if (v98 && *(void *)&v10[v18 + 16] == 0x2020202020202020) {
        continue;
      }
    }
    unint64_t v16 = "invalid ._ entry";
    __int16 v17 = 361;
    goto LABEL_239;
  }
  int v100 = 0;
  int v101 = 0;
  int v102 = 0;
  int v103 = 0;
  int v104 = 0;
  uint64_t v105 = 68;
  switch(v90)
  {
    case '0':
    case '7':
      goto LABEL_156;
    case '1':
      int v100 = 0;
      int v102 = 0;
      int v103 = 0;
      int v104 = 0;
      int v101 = 1;
      uint64_t v105 = 72;
      goto LABEL_157;
    case '2':
      int v101 = 0;
      int v102 = 0;
      int v103 = 0;
      int v104 = 0;
      int v100 = 1;
      uint64_t v105 = 76;
      goto LABEL_157;
    case '3':
      int v100 = 0;
      int v101 = 0;
      int v102 = 0;
      int v104 = 0;
      int v103 = 1;
      uint64_t v105 = 67;
      goto LABEL_157;
    case '4':
      int v100 = 0;
      int v101 = 0;
      int v103 = 0;
      int v104 = 0;
      int v102 = 1;
      uint64_t v105 = 66;
      goto LABEL_157;
    case '5':
      goto LABEL_157;
    case '6':
      break;
    default:
      if (!v90) {
        goto LABEL_156;
      }
      break;
  }
  char v130 = v90;
  unint64_t v16 = "Non supported entry type %u";
  __int16 v17 = 392;
LABEL_239:
  LODWORD(v113) = 0;
LABEL_240:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStreamTar.c", (uint64_t)"loadAndDecodeHeader_Ustar", v17, 70, v113, v16, v8, v9, v130);
  return 0xFFFFFFFFLL;
}

uint64_t isZero(unsigned char *a1, uint64_t a2)
{
  unint64_t v2 = (unint64_t)&a1[a2];
  if (a2 >= 1 && (a1 & 7) != 0)
  {
    uint64_t v3 = a1 + 1;
    while (!*a1)
    {
      if ((unint64_t)++a1 < v2)
      {
        if ((unint64_t)(v3++ & 7)) {
          continue;
        }
      }
      goto LABEL_9;
    }
    return 0;
  }
  else
  {
LABEL_9:
    while ((unint64_t)(a1 + 8) <= v2)
    {
      uint64_t v5 = *(void *)a1;
      a1 += 8;
      if (v5) {
        return 0;
      }
    }
    while ((unint64_t)a1 < v2)
    {
      if (*a1) {
        return 0;
      }
      ++a1;
    }
    return 1;
  }
}

uint64_t tarParseInt(unsigned char *a1, unint64_t a2, unint64_t *a3)
{
  int v3 = *a1;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (*a1 && v3 != 128 && v3 != 255)
  {
    unint64_t v5 = 0;
    if (a2)
    {
      while (a1[v5] == 32)
      {
        if (a2 == ++v5) {
          return 0xFFFFFFFFLL;
        }
      }
    }
    unint64_t v6 = a2 - v5;
    if (a2 <= v5) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = -3 * v5 + 3 * a2;
    BOOL v10 = &a1[v5];
    while (1)
    {
      char v12 = *v10++;
      char v11 = v12;
      if ((v12 & 0xF8) != 0x30) {
        break;
      }
      v7 += 3;
      unint64_t v8 = v11 & 7 | (8 * v8);
      if (!--v6)
      {
        uint64_t v7 = v9;
        break;
      }
    }
    if ((unint64_t)(v7 - 65) >= 0xFFFFFFFFFFFFFFC0)
    {
      uint64_t v4 = 0;
      *a3 = v8;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return v4;
}

uint64_t appendFieldIfNotDefinedUInt(AAHeader_impl *a1, AAFieldKey a2, uint64_t a3)
{
  if ((AAHeaderGetKeyIndex(a1, a2) & 0x80000000) == 0) {
    return 0;
  }
  AAFieldKey v7 = a2;

  return AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v7, a3);
}

uint64_t appendFieldIfNotDefinedTimespec(AAHeader_impl *a1, const timespec *a2)
{
  v4.iAAFieldKey key = 5067853;
  if ((AAHeaderGetKeyIndex(a1, v4) & 0x80000000) == 0) {
    return 0;
  }
  v6.iAAFieldKey key = 5067853;

  return AAHeaderSetFieldTimespec(a1, 0xFFFFFFFF, v6, a2);
}

uint64_t appendFieldIfNotDefinedString(AAHeader_impl *a1, AAFieldKey a2, const char *a3, size_t a4)
{
  if ((AAHeaderGetKeyIndex(a1, a2) & 0x80000000) == 0) {
    return 0;
  }
  AAFieldKey v9 = a2;

  return AAHeaderSetFieldString(a1, 0xFFFFFFFF, v9, a3, a4);
}

uint64_t aaEntryACLBlobInitWithEncodedData(void *a1, char *__src, rsize_t __smax, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a1 = 0;
  a1[3] = 0;
  unint64_t v8 = a1 + 3;
  if (!__smax) {
    return 0;
  }
  char v12 = 0;
  uint64_t v13 = a1 + 4;
  char v14 = 1;
  while (2)
  {
    rsize_t v15 = 0;
    unint64_t v16 = 0;
    char v17 = v14;
    do
    {
      if (v15 + 4 > __smax) {
        goto LABEL_81;
      }
      uint64_t v18 = *(unsigned int *)&__src[v15];
      if (v18 < 4) {
        goto LABEL_81;
      }
      BOOL v19 = __CFADD__(v18, v15);
      rsize_t v20 = v18 + v15;
      if (v19 || v20 > __smax) {
        goto LABEL_81;
      }
      if (v12)
      {
        uint64_t v21 = a1[2];
        uint64_t v22 = (*a1)++;
        *(void *)(v21 + 8 * v22) = v15;
      }
      ++v16;
      rsize_t v15 = v20;
    }
    while (v20 < __smax);
    if (v20 != __smax) {
      goto LABEL_81;
    }
    if ((v17 & 1) == 0) {
      break;
    }
    if (v16 > 0xFFFFFFFE) {
      goto LABEL_81;
    }
    unint64_t v23 = a1[1];
    if (v23 < v16)
    {
      unint64_t v24 = a1[1];
      do
      {
        if (v24) {
          v24 *= 2;
        }
        else {
          unint64_t v24 = 16;
        }
      }
      while (v24 < v16);
      if (v24 > v23)
      {
        a1[1] = v24;
        if (8 * v24 >= 0x2000000001)
        {
          *__error() = 12;
        }
        else
        {
          uint64_t v25 = (void *)a1[2];
          uint64_t v26 = realloc(v25, 8 * v24);
          if (v26)
          {
            a1[2] = v26;
            goto LABEL_24;
          }
          free(v25);
        }
        a1[2] = 0;
LABEL_81:
        *a1 = 0;
        a1[3] = 0;
        __int16 v49 = 169;
LABEL_82:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", v49, 100, 0, "invalid ACL blob", a7, a8, v50);
LABEL_83:
        *a1 = 0;
        a1[3] = 0;
        return 0xFFFFFFFFLL;
      }
    }
LABEL_24:
    if ((__smax & 0x8000000000000000) != 0) {
      goto LABEL_81;
    }
    rsize_t v27 = *v13;
    if (*v13 < __smax)
    {
      do
      {
        while (!v27)
        {
          rsize_t v27 = 0x4000;
          size_t v29 = 0x4000;
          if (__smax <= 0x4000) {
            goto LABEL_34;
          }
        }
        rsize_t v28 = v27 >> 1;
        if ((v27 & (v27 >> 1)) != 0) {
          rsize_t v28 = v27 & (v27 >> 1);
        }
        v27 += v28;
      }
      while (v27 < __smax);
      size_t v29 = v27;
      if (v27 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_74;
      }
LABEL_34:
      uint64_t v30 = (void *)a1[5];
      unint64_t v31 = realloc(v30, v29);
      if (v31)
      {
        a1[4] = v29;
        a1[5] = v31;
        goto LABEL_36;
      }
      free(v30);
LABEL_74:
      *unint64_t v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      goto LABEL_81;
    }
LABEL_36:
    char v14 = 0;
    char v12 = 1;
    if (v17) {
      continue;
    }
    break;
  }
  *unint64_t v8 = 0;
  if ((__smax & 0x8000000000000000) != 0) {
    goto LABEL_81;
  }
  rsize_t v32 = *v13;
  if (*v13 < __smax)
  {
    size_t v33 = 0x4000;
    do
    {
      while (!v32)
      {
        rsize_t v32 = 0x4000;
        if (__smax <= 0x4000) {
          goto LABEL_50;
        }
      }
      rsize_t v34 = v32 >> 1;
      if ((v32 & (v32 >> 1)) != 0) {
        rsize_t v34 = v32 & (v32 >> 1);
      }
      v32 += v34;
    }
    while (v32 < __smax);
    size_t v33 = v32;
    if (v32 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_80;
    }
LABEL_50:
    unint64_t v35 = (void *)a1[5];
    int v36 = realloc(v35, v33);
    if (v36)
    {
      a1[4] = v33;
      a1[5] = v36;
      goto LABEL_52;
    }
    free(v35);
LABEL_80:
    *uint64_t v13 = 0;
    v13[1] = 0;
    goto LABEL_81;
  }
LABEL_52:
  uint64_t v37 = a1[5];
  if (__src)
  {
    memcpy((void *)(v37 + *v8), __src, __smax);
  }
  else if (v37)
  {
    memset_s((void *)(v37 + *v8), __smax, 0, __smax);
  }
  a1[3] += __smax;
  uint64_t v38 = *a1;
  if (*a1)
  {
    uint64_t v39 = 0;
    while (1)
    {
      if (v38 == v39 || (uint64_t v40 = a1[5] + *(void *)(a1[2] + 8 * v39), (*(_DWORD *)v40 + 1) <= 0x16))
      {
        __int16 v49 = 179;
        goto LABEL_82;
      }
      if ((*(char *)(v40 + 4) - 65) > 0x14 || ((1 << (*(unsigned char *)(v40 + 4) - 65)) & 0x100809) == 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", 188, 100, 0, "invalid ACL entry type %c", a7, a8, *(unsigned char *)(v40 + 4));
        goto LABEL_83;
      }
      HIDWORD(v43) = *(char *)(v40 + 21) - 71;
      LODWORD(v43) = HIDWORD(v43);
      unsigned int v42 = v43 >> 1;
      BOOL v44 = v42 > 7;
      int v45 = (1 << v42) & 0xC3;
      if (v44 || v45 == 0) {
        break;
      }
      if ((*(void *)(v40 + 5) & 0xFFFFFFFFFCFDFE0FLL) != 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", 199, 100, 0, "invalid ACL flags 0x%llx", a7, a8, *(void *)(v40 + 5));
        goto LABEL_83;
      }
      uint64_t v47 = *(void *)(v40 + 13);
      if ((v47 & 0xFFFFFFFFFFEFC001) != 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", 200, 100, 0, "invalid ACL perms 0x%llx", a7, a8, v47);
        goto LABEL_83;
      }
      uint64_t result = 0;
      if (v38 == ++v39) {
        return result;
      }
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", 197, 100, 0, "invalid ACL qualifier type %c", a7, a8, *(unsigned char *)(v40 + 21));
    goto LABEL_83;
  }
  return 0;
}

uint64_t aaEntryACLBlobInitWithPath(AAEntryACLBlob_impl *a1, char *__s, const char *a3, char a4)
{
  char v5 = (char)__s;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((concatPath(v18, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithPath", 215, 100, 0, "invalid path %s/%s", v7, v8, v5);
    return 0xFFFFFFFFLL;
  }
  int v9 = open(v18, 0x200000);
  if (v9 < 0)
  {
    int v14 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithPath", 219, 100, v14, "open: %s", v15, v16, (char)v18);
    return 0xFFFFFFFFLL;
  }
  int v10 = v9;
  if ((aaEntryACLBlobInitWithFD(a1, v9, a4) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithPath", 221, 100, 0, "initializing ACL blob: %s", v11, v12, (char)v18);
    uint64_t v13 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v13 = 0;
  }
  close(v10);
  return v13;
}

uint64_t aaEntryACLBlobInitWithFD(AAEntryACLBlob_impl *a1, int a2, char a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v6 = sysconf(71);
  uint64_t v7 = sysconf(70);
  if (v6 <= v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v6;
  }
  if (v8 <= 4096) {
    size_t v9 = 4096;
  }
  else {
    size_t v9 = v8;
  }
  if (v9 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_14:
    uint64_t v15 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithFD", 243, 100, *v15, "malloc", v16, v17, v33);
    goto LABEL_15;
  }
  int v10 = malloc(v9);
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  *(void *)a1 = 0;
  *((void *)a1 + 3) = 0;
  fd_np = acl_get_fd_np(a2, ACL_TYPE_EXTENDED);
  if (!fd_np)
  {
LABEL_13:
    free(v11);
    return 0;
  }
  uint64_t v13 = fd_np;
  acl_entry_t entry_p = 0;
  if (acl_get_entry(fd_np, 0, &entry_p))
  {
LABEL_12:
    acl_free(v13);
    goto LABEL_13;
  }
  while (1)
  {
    acl_tag_t tag_type_p = ACL_UNDEFINED_TAG;
    acl_flagset_t flagset_p = 0;
    acl_permset_mask_t mask_p = 0;
    *(void *)id_type = 0;
    memset(&sid, 0, sizeof(sid));
    memset(&ace, 0, sizeof(ace));
    memset(out, 0, 256);
    if (acl_get_tag_type(entry_p, &tag_type_p))
    {
      int v28 = *__error();
      unint64_t v31 = "acl_get_tag_type";
      __int16 v32 = 272;
LABEL_66:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithFD", v32, 100, v28, v31, v29, v30, v33);
      goto LABEL_67;
    }
    if (tag_type_p - 1 <= 1) {
      break;
    }
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithFD", 274, 100, "Warning: ACL tag type is not ALLOW/DENY (ignoring entry): %d\n", v18, v19, v20, tag_type_p);
LABEL_60:
    if (acl_get_entry(v13, -1, &entry_p)) {
      goto LABEL_12;
    }
  }
  ace.tag = tag_type_p;
  if (acl_get_flagset_np(entry_p, &flagset_p))
  {
    int v28 = *__error();
    unint64_t v31 = "acl_get_flagset_np";
    __int16 v32 = 278;
    goto LABEL_66;
  }
  if (acl_get_flag_np(flagset_p, ACL_FLAG_NO_INHERIT))
  {
    ace.flags = 0x20000;
    AAACEFlagSet v21 = 0x20000;
  }
  else
  {
    AAACEFlagSet v21 = 0;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_INHERITED))
  {
    v21 |= 0x10uLL;
    ace.flags = v21;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_FILE_INHERIT))
  {
    v21 |= 0x20uLL;
    ace.flags = v21;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_DIRECTORY_INHERIT))
  {
    v21 |= 0x40uLL;
    ace.flags = v21;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_LIMIT_INHERIT))
  {
    v21 |= 0x80uLL;
    ace.flags = v21;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_ONLY_INHERIT)) {
    ace.flags = v21 | 0x100;
  }
  if (acl_get_permset_mask_np(entry_p, &mask_p))
  {
    int v28 = *__error();
    unint64_t v31 = "acl_get_permset_mask_np";
    __int16 v32 = 289;
    goto LABEL_66;
  }
  ace.perms = mask_p & 0x103FFE;
  qualifier = (const unsigned __int8 *)acl_get_qualifier(entry_p);
  if (!qualifier)
  {
    int v28 = *__error();
    unint64_t v31 = "acl_get_qualifier";
    __int16 v32 = 294;
    goto LABEL_66;
  }
  unint64_t v23 = (unsigned __int8 *)qualifier;
  if ((a3 & 4) != 0) {
    goto LABEL_57;
  }
  if (mbr_uuid_to_id(qualifier, (id_t *)&id_type[1], id_type)) {
    goto LABEL_53;
  }
  if (id_type[0] == 1)
  {
    memset(&v35, 0, 32);
    rsize_t v34 = 0;
    AAACEQualifierType v24 = 0;
    if (!getgrgid_r(id_type[1], (group *)&v35, (char *)v11, v9, (group **)&v34) && v34 && v35.pw_name)
    {
      if (strlen(v35.pw_name) > 0xFF) {
        goto LABEL_51;
      }
      AAACEQualifierType v24 = 71;
LABEL_50:
      ace.qualifier_type = v24;
      __strlcpy_chk();
    }
  }
  else
  {
    if (id_type[0]) {
      goto LABEL_53;
    }
    memset(&v35, 0, sizeof(v35));
    rsize_t v34 = 0;
    AAACEQualifierType v24 = 0;
    if (!getpwuid_r(id_type[1], &v35, (char *)v11, v9, &v34) && v34 && v35.pw_name)
    {
      if (strlen(v35.pw_name) <= 0xFF)
      {
        AAACEQualifierType v24 = 85;
        goto LABEL_50;
      }
LABEL_51:
      AAACEQualifierType v24 = 0;
    }
  }
  if (!v24)
  {
LABEL_53:
    if (!mbr_uuid_to_sid(v23, &sid) && !mbr_sid_to_string(&sid, (char *)v11) && strlen((const char *)v11) <= 0xFF)
    {
      ace.qualifier_type = 83;
      __strlcpy_chk();
      goto LABEL_58;
    }
LABEL_57:
    ace.qualifier_type = 73;
    uuid_unparse_upper(v23, (char *)out);
  }
LABEL_58:
  unsigned int v25 = strlen((const char *)out);
  if ((AAEntryACLBlobAppendEntry(a1, &ace, out, v25) & 0x80000000) == 0)
  {
    acl_free(v23);
    goto LABEL_60;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithFD", 340, 100, 0, "encoding entry", v26, v27, v33);
  acl_free(v23);
LABEL_67:
  acl_free(v13);
  free(v11);
LABEL_15:
  *(void *)a1 = 0;
  *((void *)a1 + 3) = 0;
  return 0xFFFFFFFFLL;
}

int AAEntryACLBlobAppendEntry(AAEntryACLBlob acl, const AAAccessControlEntry *ace, const uint8_t *qualifier_value, size_t qualifier_size)
{
  if ((ace_check_entry((uint64_t)ace, (uint64_t)ace, (uint64_t)qualifier_value, qualifier_size, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    AAACEQualifierType v24 = "invalid ACL entry";
    __int16 v25 = 618;
LABEL_50:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobAppendEntry", v25, 100, 0, v24, v12, v13, v44);
    return -1;
  }
  if (qualifier_size > 0xFFFFFFE9 || (uint64_t v14 = (qualifier_size + 22), qualifier_size == -23))
  {
    AAACEQualifierType v24 = "ACL entry size out of range";
    __int16 v25 = 622;
    goto LABEL_50;
  }
  if (v14 < 4) {
    goto LABEL_49;
  }
  uint64_t v15 = (void *)((char *)acl + 24);
  unint64_t v16 = *((void *)acl + 3);
  unint64_t v17 = v16 + v14;
  if (__CFADD__(v16, v14)) {
    goto LABEL_49;
  }
  uint64_t v19 = *(void *)acl;
  unint64_t v18 = *((void *)acl + 1);
  unint64_t v20 = *(void *)acl + 1;
  if (v18 < v20)
  {
    unint64_t v21 = *((void *)acl + 1);
    do
    {
      if (v21) {
        v21 *= 2;
      }
      else {
        unint64_t v21 = 16;
      }
    }
    while (v21 < v20);
    if (v21 > v18)
    {
      uint64_t v45 = *(void *)acl;
      unint64_t v23 = (void *)((char *)acl + 16);
      uint64_t v22 = (void *)*((void *)acl + 2);
      *((void *)acl + 1) = v21;
      if (8 * v21 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_48:
        *(void *)acl = 0;
        void *v23 = 0;
        *((void *)acl + 3) = 0;
        goto LABEL_49;
      }
      uint64_t v26 = realloc(v22, 8 * v21);
      if (!v26)
      {
        free(v22);
        goto LABEL_48;
      }
      void *v23 = v26;
      uint64_t v19 = v45;
    }
  }
  if ((v17 & 0x8000000000000000) != 0) {
    goto LABEL_44;
  }
  size_t v27 = *((void *)acl + 4);
  if (v27 < v17)
  {
    do
    {
      while (!v27)
      {
        size_t v27 = 0x4000;
        if (v17 <= 0x4000)
        {
          size_t v27 = 0x4000;
          goto LABEL_30;
        }
      }
      size_t v28 = v27 >> 1;
      if ((v27 & (v27 >> 1)) != 0) {
        size_t v28 = v27 & (v27 >> 1);
      }
      v27 += v28;
    }
    while (v27 < v17);
    if (v27 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_43;
    }
LABEL_30:
    uint64_t v29 = (void *)*((void *)acl + 5);
    uint64_t v30 = realloc(v29, v27);
    if (v30)
    {
      *((void *)acl + 4) = v27;
      *((void *)acl + 5) = v30;
      goto LABEL_32;
    }
    free(v29);
LABEL_43:
    *((void *)acl + 4) = 0;
    *((void *)acl + 5) = 0;
LABEL_44:
    *(void *)acl = 0;
    *((void *)acl + 3) = 0;
    goto LABEL_49;
  }
LABEL_32:
  uint64_t v31 = *v15;
  unint64_t v32 = *v15 + v14;
  if (__CFADD__(*v15, v14) || (v32 & 0x8000000000000000) != 0) {
    goto LABEL_49;
  }
  if (v27 < v32)
  {
    do
    {
      while (!v27)
      {
        size_t v27 = 0x4000;
        if (v32 <= 0x4000)
        {
          rsize_t v34 = (void **)((char *)acl + 40);
          size_t v27 = 0x4000;
          goto LABEL_53;
        }
      }
      size_t v33 = v27 >> 1;
      if ((v27 & (v27 >> 1)) != 0) {
        size_t v33 = v27 & (v27 >> 1);
      }
      v27 += v33;
    }
    while (v27 < v32);
    rsize_t v34 = (void **)((char *)acl + 40);
    if (v27 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_69;
    }
LABEL_53:
    uint64_t v46 = v34;
    uint64_t v38 = *v34;
    passwd v35 = (char *)realloc(v38, v27);
    if (v35)
    {
      *((void *)acl + 5) = v35;
      int v36 = (void *)((char *)acl + 40);
      *((void *)acl + 4) = v27;
      uint64_t v31 = *((void *)acl + 3);
      goto LABEL_55;
    }
    free(v38);
    rsize_t v34 = v46;
LABEL_69:
    *rsize_t v34 = 0;
    *uint64_t v15 = 0;
    *((void *)acl + 4) = 0;
    goto LABEL_49;
  }
  int v36 = (void *)((char *)acl + 40);
  passwd v35 = (char *)*((void *)acl + 5);
  if (v35)
  {
LABEL_55:
    memset_s(&v35[v31], (qualifier_size + 22), 0, (qualifier_size + 22));
    uint64_t v31 = *v15;
  }
  *((void *)acl + 3) = v31 + v14;
  uint64_t v39 = *((void *)acl + 2);
  uint64_t v40 = (*(void *)acl)++;
  *(void *)(v39 + 8 * v40) = v16;
  if (v16 >= 0xFFFFFFFFFFFFFFFCLL || v16 + 4 > *v15 || (*(_DWORD *)(*v36 + v16) = v14, v19 < 0))
  {
LABEL_49:
    AAACEQualifierType v24 = "alloc ACL entry";
    __int16 v25 = 626;
    goto LABEL_50;
  }
  uint64_t v41 = *((void *)acl + 5) + *(void *)(*((void *)acl + 2) + 8 * v19);
  *(_DWORD *)uint64_t v41 = v14;
  if (ace->tag == ACL_EXTENDED_DENY) {
    char v42 = 68;
  }
  else {
    char v42 = 0;
  }
  if (ace->tag == ACL_EXTENDED_ALLOW) {
    char v43 = 65;
  }
  else {
    char v43 = v42;
  }
  *(unsigned char *)(v41 + 4) = v43;
  *(void *)(v41 + 5) = ace->flags;
  *(void *)(v41 + 13) = ace->perms;
  *(unsigned char *)(v41 + 21) = ace->qualifier_type;
  if (qualifier_size) {
    memcpy((void *)(v41 + 22), qualifier_value, qualifier_size);
  }
  return 0;
}

AAEntryACLBlob AAEntryACLBlobCreateWithEncodedData(const uint8_t *data, size_t data_size)
{
  AAEntryACLBlob v4 = AAEntryACLBlobCreate();
  int v10 = v4;
  if (v4 && (aaEntryACLBlobInitWithEncodedData(v4, (char *)data, data_size, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    AAEntryACLBlobDestroy(v10);
    return 0;
  }
  return v10;
}

AAEntryACLBlob AAEntryACLBlobCreateWithPath(const char *dir, const char *path, AAFlagSet flags)
{
  char v3 = flags;
  uint64_t v6 = AAEntryACLBlobCreate();
  uint64_t v7 = v6;
  if (v6 && (aaEntryACLBlobInitWithPath(v6, (char *)dir, path, v3) & 0x80000000) != 0)
  {
    AAEntryACLBlobDestroy(v7);
    return 0;
  }
  return v7;
}

int AAEntryACLBlobClear(AAEntryACLBlob acl)
{
  *(void *)acl = 0;
  *((void *)acl + 3) = 0;
  return 0;
}

int AAEntryACLBlobApplyToPath(AAEntryACLBlob acl, const char *dir, const char *path, AAFlagSet flags)
{
  char v4 = flags;
  char v5 = (char)dir;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((concatPath(v18, 0x800uLL, (char *)dir, path) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobApplyToPath", 569, 100, 0, "invalid path %s/%s", v7, v8, v5);
    return -1;
  }
  uint64_t v9 = open(v18, 0x200000);
  if ((v9 & 0x80000000) != 0)
  {
    int v14 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobApplyToPath", 571, 100, v14, "open: %s", v15, v16, (char)v18);
    return -1;
  }
  int v10 = v9;
  if ((aaEntryACLBlobApplyToFD((unint64_t *)acl, v9, v4) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobApplyToPath", 573, 100, 0, "applying ACL blob: %s", v11, v12, (char)v18);
    int v13 = -1;
  }
  else
  {
    int v13 = 0;
  }
  close(v10);
  return v13;
}

uint32_t AAEntryACLBlobGetEntryCount(AAEntryACLBlob acl)
{
  return *(_DWORD *)acl;
}

int AAEntryACLBlobGetEntry(AAEntryACLBlob acl, uint32_t i, AAAccessControlEntry *ace, size_t qualifier_capacity, uint8_t *qualifier_value, size_t *qualifier_size)
{
  if (*(void *)acl <= (unint64_t)i)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobGetEntry", 593, 100, 0, "invalid ACL index %u", v6, v7, i);
  }
  else
  {
    uint64_t v9 = *((void *)acl + 5) + *(void *)(*((void *)acl + 2) + 8 * i);
    size_t v10 = (*(_DWORD *)v9 - 22);
    int v11 = *(unsigned __int8 *)(v9 + 4);
    if (v11 == 65) {
      AAACETag v12 = ACL_EXTENDED_ALLOW;
    }
    else {
      AAACETag v12 = 2 * (v11 == 68);
    }
    ace->tag = v12;
    ace->qualifier_type = *(char *)(v9 + 21);
    ace->flags = *(void *)(v9 + 5);
    ace->perms = *(void *)(v9 + 13);
    if (qualifier_size) {
      *qualifier_uint64_t size = v10;
    }
    if (!qualifier_capacity) {
      return 0;
    }
    if (v10 <= qualifier_capacity)
    {
      memcpy(qualifier_value, (const void *)(v9 + 22), v10);
      return 0;
    }
  }
  return -1;
}

uint64_t ace_check_entry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_DWORD *)a1 - 3) > 0xFFFFFFFD)
  {
    int v8 = *(_DWORD *)(a1 + 24);
    HIDWORD(v10) = v8 - 71;
    LODWORD(v10) = v8 - 71;
    unsigned int v9 = v10 >> 1;
    BOOL v11 = v9 > 7;
    int v12 = (1 << v9) & 0xC3;
    if (v11 || v12 == 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"ace_check_entry", 156, 100, 0, "invalid ACL qualifier type %c", a7, a8, v8);
    }
    else if ((*(void *)(a1 + 16) & 0xFFFFFFFFFCFDFE0FLL) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"ace_check_entry", 158, 100, 0, "invalid ACL flags 0x%llx", a7, a8, *(void *)(a1 + 16));
    }
    else
    {
      if ((*(void *)(a1 + 8) & 0xFFFFFFFFFFEFC001) == 0) {
        return 0;
      }
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"ace_check_entry", 159, 100, 0, "invalid ACL perms 0x%llx", a7, a8, *(void *)(a1 + 8));
    }
  }
  else
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"ace_check_entry", 148, 100, 0, "invalid ACL entry tag %c", a7, a8, *(_DWORD *)a1);
  }
  return 0xFFFFFFFFLL;
}

int AAEntryACLBlobSetEntry(AAEntryACLBlob acl, uint32_t i, const AAAccessControlEntry *ace, const uint8_t *qualifier_value, size_t qualifier_size)
{
  if ((ace_check_entry((uint64_t)ace, *(uint64_t *)&i, (uint64_t)ace, (uint64_t)qualifier_value, qualifier_size, v5, v6, v7) & 0x80000000) != 0)
  {
    AAACEQualifierType v24 = "invalid ACL entry";
    __int16 v25 = 648;
    goto LABEL_11;
  }
  if (*(void *)acl <= (unint64_t)i)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobSetEntry", 649, 100, 0, "invalid ACL index %u", v13, v14, i);
    return -1;
  }
  if (qualifier_size > 0xFFFFFFE9 || (uint64_t v15 = (qualifier_size + 22), qualifier_size == -23))
  {
    AAACEQualifierType v24 = "ACL entry size out of range";
    __int16 v25 = 653;
    goto LABEL_11;
  }
  unint64_t v16 = i;
  unint64_t v17 = *(void *)(*((void *)acl + 2) + 8 * i);
  unint64_t v18 = (char *)*((void *)acl + 5);
  uint64_t v19 = *(unsigned int *)&v18[v17];
  unint64_t v20 = v17 + v19;
  if (__CFADD__(v17, v19)
    || (unint64_t v21 = (unint64_t *)((char *)acl + 24), v22 = *((void *)acl + 3), v23 = v22 - v20, v22 < v20))
  {
LABEL_7:
    AAACEQualifierType v24 = "alloc ACL entry";
    __int16 v25 = 656;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobSetEntry", v25, 100, 0, v24, v13, v14, v50);
    return -1;
  }
  if (v15 > v19)
  {
    uint64_t v27 = v15 - v19;
    unint64_t v28 = v22 + v15 - v19;
    if ((v28 & 0x8000000000000000) != 0) {
      goto LABEL_7;
    }
    unint64_t v29 = *((void *)acl + 4);
    if (v29 < v28)
    {
      size_t v30 = 0x4000;
      do
      {
        while (!v29)
        {
          unint64_t v29 = 0x4000;
          if (v28 <= 0x4000) {
            goto LABEL_30;
          }
        }
        unint64_t v31 = v29 >> 1;
        if ((v29 & (v29 >> 1)) != 0) {
          unint64_t v31 = v29 & (v29 >> 1);
        }
        v29 += v31;
      }
      while (v29 < v28);
      size_t v30 = v29;
      if (v29 >= 0x2000000001)
      {
        int v36 = __error();
        uint64_t v37 = (void *)((char *)acl + 24);
        *int v36 = 12;
        goto LABEL_55;
      }
LABEL_30:
      uint64_t v52 = v27;
      size_t v51 = v30;
      uint64_t v38 = (char *)realloc(v18, v30);
      if (v38)
      {
        uint64_t v27 = v52;
        *((void *)acl + 4) = v51;
        *((void *)acl + 5) = v38;
        unint64_t v18 = v38;
        size_t v23 = v22 - v20;
        unint64_t v21 = (unint64_t *)((char *)acl + 24);
        goto LABEL_32;
      }
      free(v18);
      uint64_t v37 = (void *)((char *)acl + 24);
LABEL_55:
      *uint64_t v37 = 0;
      v37[1] = 0;
      v37[2] = 0;
      goto LABEL_7;
    }
LABEL_32:
    if (v22 != v20)
    {
      uint64_t v39 = &v18[v20];
      uint64_t v40 = &v18[v20 + v27];
      uint64_t v41 = v21;
      uint64_t v42 = v27;
      memmove(v40, v39, v23);
      uint64_t v27 = v42;
      unint64_t v21 = v41;
    }
    unint64_t v22 = *v21 + v27;
    goto LABEL_35;
  }
  if (v15 < v19)
  {
    uint64_t v32 = v19 - v15;
    if (v22 != v20)
    {
      size_t v33 = &v18[v20];
      rsize_t v34 = &v18[v20 - v32];
      uint64_t v35 = v32;
      memmove(v34, v33, v23);
      uint64_t v32 = v35;
      unint64_t v21 = (unint64_t *)((char *)acl + 24);
      unint64_t v20 = *((void *)acl + 3);
    }
    unint64_t v22 = v20 - v32;
LABEL_35:
    *unint64_t v21 = v22;
  }
  if (v17 >= 0xFFFFFFFFFFFFFFFCLL || v17 + 4 > v22) {
    goto LABEL_7;
  }
  *(_DWORD *)(*((void *)acl + 5) + v17) = v15;
  if (*(void *)acl > v16)
  {
    unint64_t v43 = v16;
    while (v17 < 0xFFFFFFFFFFFFFFFCLL && v17 + 4 <= *v21)
    {
      uint64_t v44 = *((void *)acl + 5);
      uint64_t v45 = *(unsigned int *)(v44 + v17);
      uint64_t v46 = *((void *)acl + 2);
      *(void *)(v46 + 8 * v43) = v17;
      v17 += v45;
      if (++v43 >= *(void *)acl) {
        goto LABEL_45;
      }
    }
    goto LABEL_7;
  }
  uint64_t v44 = *((void *)acl + 5);
  uint64_t v46 = *((void *)acl + 2);
LABEL_45:
  uint64_t v47 = v44 + *(void *)(v46 + 8 * v16);
  *(_DWORD *)uint64_t v47 = v15;
  if (ace->tag == ACL_EXTENDED_DENY) {
    char v48 = 68;
  }
  else {
    char v48 = 0;
  }
  if (ace->tag == ACL_EXTENDED_ALLOW) {
    char v49 = 65;
  }
  else {
    char v49 = v48;
  }
  *(unsigned char *)(v47 + 4) = v49;
  *(void *)(v47 + 5) = ace->flags;
  *(void *)(v47 + 13) = ace->perms;
  *(unsigned char *)(v47 + 21) = ace->qualifier_type;
  if (qualifier_size) {
    memcpy((void *)(v47 + 22), qualifier_value, qualifier_size);
  }
  return 0;
}

int AAEntryACLBlobRemoveEntry(AAEntryACLBlob acl, uint32_t i)
{
  uint64_t v4 = *(void *)acl;
  if (*(void *)acl <= (unint64_t)i
    || (unint64_t v6 = i,
        uint64_t v7 = *(void *)(*((void *)acl + 2) + 8 * i),
        uint64_t v8 = *((void *)acl + 5),
        uint64_t v9 = *(unsigned int *)(v8 + v7),
        BOOL v10 = __CFADD__(v7, v9),
        unint64_t v11 = v7 + v9,
        v10)
    || (unint64_t v12 = *((void *)acl + 3), v12 < v11))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobRemoveEntry", 673, 100, 0, "invalid ACL index %u", v2, v3, i);
    return -1;
  }
  else
  {
    if (v9)
    {
      if (v12 != v11)
      {
        memmove((void *)(v8 + v11 - v9), (const void *)(v8 + v11), v12 - v11);
        unint64_t v11 = *((void *)acl + 3);
        uint64_t v4 = *(void *)acl;
      }
      *((void *)acl + 3) = v11 - v9;
    }
    unint64_t v14 = v4 - 1;
    *(void *)acl = v14;
    if (v14 > v6)
    {
      uint64_t v15 = *((void *)acl + 2);
      do
      {
        *(void *)(v15 + 8 * v6) = *(void *)(v15 + 8 * v6 + 8) - v9;
        ++v6;
      }
      while (v6 < *(void *)acl);
    }
    return 0;
  }
}

size_t AAEntryACLBlobGetEncodedSize(AAEntryACLBlob acl)
{
  return *((void *)acl + 3);
}

const uint8_t *__cdecl AAEntryACLBlobGetEncodedData(AAEntryACLBlob acl)
{
  return (const uint8_t *)*((void *)acl + 5);
}

uint64_t AAAssetBuilderGenerate(void *a1, uint64_t a2, int DefaultNThreads, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1[2];
  if (!v8 || v8 != a1[1] + 1)
  {
    v194 = "exactly one output, and 0 or more inputs expected";
    __int16 v195 = 1547;
LABEL_200:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"AAAssetBuilderGenerate", v195, 27, 0, v194, a7, a8, v266);
    uint64_t v13 = 0;
    goto LABEL_201;
  }
  unint64_t v12 = malloc(0x460uLL);
  uint64_t v13 = (uint64_t)v12;
  if (!v12)
  {
    int v196 = *__error();
    v197 = "malloc";
    __int16 v198 = 646;
LABEL_195:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCreate", v198, 27, v196, v197, v15, v16, v266);
LABEL_199:
    stateDestroy_0(v13);
    v194 = "stateCreate";
    __int16 v195 = 1550;
    goto LABEL_200;
  }
  memset_s(v12, 0x460uLL, 0, 0x460uLL);
  *(void *)(v13 + 32) = StringTableCreate();
  unint64_t v14 = StringTableCreate();
  *(void *)(v13 + 40) = v14;
  if (!*(void *)(v13 + 32) || !v14)
  {
    v197 = "StringTableCreate";
    __int16 v198 = 650;
    int v196 = 0;
    goto LABEL_195;
  }
  *(void *)uint64_t v13 = a2;
  *(void *)(v13 + 8) = a1;
  if (!DefaultNThreads) {
    DefaultNThreads = getDefaultNThreads();
  }
  uint64_t v17 = *a1;
  uint64_t v18 = *a1 >> 62;
  *(_DWORD *)(v13 + 20) = DefaultNThreads;
  *(_DWORD *)(v13 + 24) = v18;
  *(_DWORD *)(v13 + 16) = v17 & 1;
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(a1 + 1);
  if ((getTempDir((char *)(v13 + 92), 0x3F6uLL) & 0x80000000) != 0)
  {
    v199 = "getTempDir";
    __int16 v200 = 658;
    int v201 = 0;
LABEL_198:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCreate", v200, 27, v201, v199, v19, v20, v266);
    memset_s((void *)(v13 + 92), 0x400uLL, 0, 0x400uLL);
    goto LABEL_199;
  }
  __strlcat_chk();
  if (!mkdtemp((char *)(v13 + 92)))
  {
    int v201 = *__error();
    v199 = "mkdtemp";
    __int16 v200 = 660;
    goto LABEL_198;
  }
  uint64_t v21 = *(void *)(v13 + 56);
  uint64_t v22 = **(void **)(v13 + 8);
  if ((v22 & 0x10) != 0) {
    size_t v23 = "DAT,YEC";
  }
  else {
    size_t v23 = "DAT";
  }
  uint64_t v26 = AAFieldKeySetCreateWithString(v23);
  if (!v26)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", 863, 27, 0, "AAFieldKeySetCreateWithString", v24, v25, v266);
    uint64_t v38 = 0;
    unint64_t v31 = 0;
    goto LABEL_204;
  }
  if (!*(void *)(v13 + 56)) {
    goto LABEL_157;
  }
  uint64_t v27 = 0;
  uint64_t v28 = v21 - 1;
  uint64_t v29 = v22 & 0x10;
  uint64_t v296 = v29;
  uint64_t v297 = v21 - 1;
  do
  {
    if (*(_DWORD *)(v13 + 24)) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "Scanning archive for variant %zu...\n", v27);
    }
    AAByteStreamSeek(*(AAByteStream *)(*(void *)(v13 + 8) + 8 * v27 + 24), 0, 0);
    size_t v30 = (uint64_t **)malloc(0x38uLL);
    unint64_t v31 = v30;
    if (!v30)
    {
      v241 = v26;
      __int16 v242 = 376;
LABEL_271:
      v243 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCollectorStreamOpen", v242, 27, *v243, "malloc", v244, v245, v266);
      free(v31);
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", 874, 27, 0, "collector stream", v246, v247, v267);
      uint64_t v38 = 0;
      unint64_t v31 = 0;
      uint64_t v42 = 0;
      uint64_t v41 = 0;
      uint64_t v26 = v241;
      goto LABEL_208;
    }
    memset_s(v30, 0x38uLL, 0, 0x38uLL);
    uint64_t v32 = (uint64_t *)malloc(0x40uLL);
    if (!v32)
    {
      v241 = v26;
      __int16 v242 = 378;
      goto LABEL_271;
    }
    size_t v33 = v32;
    memset_s(v32, 0x40uLL, 0, 0x40uLL);
    BOOL v34 = v27 == v28 && v29 == 0;
    *size_t v33 = v13;
    v33[1] = v27;
    const char *v31 = v33;
    v31[1] = (uint64_t *)stateCollectorStreamClose;
    v31[3] = (uint64_t *)stateCollectorStreamWriteHeader;
    v31[4] = (uint64_t *)stateCollectorStreamWriteBlob;
    if (v34) {
      uint64_t v35 = "SH2,IDX,IDZ,SIZ,YEC";
    }
    else {
      uint64_t v35 = "SH2,IDX,IDZ,SIZ";
    }
    uint64_t v38 = AAFieldKeySetCreateWithString(v35);
    if (!v38)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", 880, 27, 0, "AAFieldKeySetCreateWithString", v36, v37, v266);
LABEL_204:
      uint64_t v42 = 0;
      uint64_t v41 = 0;
      goto LABEL_208;
    }
    uint64_t v41 = AADecodeArchiveInputStreamOpen(*(AAByteStream *)(*(void *)(v13 + 8) + 8 * v27 + 24), 0, 0, 0x100uLL, *(_DWORD *)(v13 + 20));
    if (!v41)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", 882, 27, 0, "AADecodeArchiveInputStreamOpen", v39, v40, v266);
      uint64_t v42 = 0;
      goto LABEL_208;
    }
    uint64_t v42 = AAConvertArchiveOutputStreamOpen((AAArchiveStream)v31, v38, v26, 0, 0, 0, *(_DWORD *)(v13 + 20));
    if (AAArchiveStreamProcess(v41, v42, 0, 0, 0, *(_DWORD *)(v13 + 20)) < 0)
    {
      v204 = "processing manifest";
      __int16 v205 = 885;
LABEL_207:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", v205, 27, 0, v204, v43, v44, v266);
LABEL_208:
      AAArchiveStreamClose((AAArchiveStream)v31);
      AAArchiveStreamClose(v42);
      AAArchiveStreamClose(v41);
      AAFieldKeySetDestroy(v38);
      AAFieldKeySetDestroy(v26);
      v208 = "loading manifests / scanning directories";
      __int16 v209 = 1553;
      goto LABEL_209;
    }
    v309 = 0;
    if ((StringTableSort(*(unsigned int **)(v13 + 32), &v309) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateAggregateEntries", 800, 27, 0, "StringTableSort", v45, v46, v266);
      goto LABEL_206;
    }
    size_t v48 = *(void *)(v13 + 72);
    uint64_t v47 = *(void **)(v13 + 80);
    if (v48)
    {
      char v49 = v309;
      char v50 = *(_DWORD **)(v13 + 80);
      uint64_t v51 = *(void *)(v13 + 72);
      do
      {
        *char v50 = v49[*v50];
        v50 += 246;
        --v51;
      }
      while (v51);
    }
    s = v42;
    v306 = v41;
    uint64_t v300 = v27;
    qsort(v47, v48, 0x3D8uLL, (int (__cdecl *)(const void *, const void *))entryVectorCmp);
    if (!*(void *)(v13 + 72))
    {
      uint64_t v55 = 0;
      goto LABEL_156;
    }
    unint64_t v54 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = 264;
    v299 = v38;
    do
    {
      uint64_t v57 = *(void *)(v13 + 80);
      v58 = (_DWORD *)(v57 + 984 * v54);
      if (!v55 || (uint64_t v59 = v55 - 1, *(_DWORD *)(v57 + 984 * (v55 - 1)) != *v58))
      {
        if (v54 != v55) {
          memcpy((void *)(v57 + 984 * v55), v58, 0x3D8uLL);
        }
        ++v55;
        goto LABEL_56;
      }
      uint64_t v60 = 0;
      uint64_t v61 = v57 + 984 * v59 + 264;
      uint64_t v62 = v57 + v56;
      do
      {
        if (*(_DWORD *)(v62 + v60))
        {
          if (*(_DWORD *)(v61 + v60))
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateAggregateEntries", 830, 27, 0, "entry defined multiple times in the same variant", v52, v53, v266);
            uint64_t v41 = v306;
            uint64_t v42 = s;
LABEL_206:
            free(v309);
            v204 = "aggregating entries";
            __int16 v205 = 888;
            goto LABEL_207;
          }
          uint64_t v63 = v61 + v60;
          *(_OWORD *)uint64_t v63 = *(_OWORD *)(v62 + v60);
          long long v64 = *(_OWORD *)(v62 + v60 + 16);
          long long v65 = *(_OWORD *)(v62 + v60 + 32);
          long long v66 = *(_OWORD *)(v62 + v60 + 48);
          *(void *)(v63 + 64) = *(void *)(v62 + v60 + 64);
          *(_OWORD *)(v63 + 32) = v65;
          *(_OWORD *)(v63 + 48) = v66;
          *(_OWORD *)(v63 + 16) = v64;
        }
        v60 += 72;
      }
      while (v60 != 720);
      uint64_t v67 = v57 + 984 * v59;
      uint64_t v69 = *(void *)(v67 + 56);
      AAFieldKey v68 = (void *)(v67 + 56);
      if (!v69)
      {
        uint64_t v70 = v57 + 984 * v54;
        uint64_t v72 = *(void *)(v70 + 56);
        AAFieldKey v71 = (size_t *)(v70 + 56);
        if (v72)
        {
          *AAFieldKey v68 = 0;
          uint64_t v73 = v57 + 984 * v54;
          AAFieldKey v76 = *(const void **)(v73 + 72);
          uint32_t v75 = (void **)(v73 + 72);
          int v74 = v76;
          char __s = v71;
          size_t v77 = *v71;
          if ((*v71 & 0x8000000000000000) == 0)
          {
            v284 = v75;
            v292 = v26;
            uint64_t v78 = v57 + 984 * v59;
            size_t v81 = *(void *)(v78 + 64);
            uint32_t v79 = (size_t *)(v78 + 64);
            size_t v80 = v81;
            if (v81 >= v77)
            {
LABEL_63:
              uint64_t v86 = *(void *)(v57 + 984 * v59 + 72);
              if (v74)
              {
                memcpy((void *)(v86 + *v68), v74, v77);
                uint64_t v26 = v292;
              }
              else
              {
                uint64_t v26 = v292;
                if (v86) {
                  memset_s((void *)(v86 + *v68), v77, 0, v77);
                }
              }
              *v68 += v77;
            }
            else
            {
              do
              {
                while (!v80)
                {
                  size_t v80 = 0x4000;
                  if (v77 <= 0x4000)
                  {
                    v272 = v79;
                    v276 = v74;
                    v83 = (void **)(v57 + 984 * v59 + 72);
                    size_t v80 = 0x4000;
                    goto LABEL_61;
                  }
                }
                size_t v82 = v80 >> 1;
                if ((v80 & (v80 >> 1)) != 0) {
                  size_t v82 = v80 & (v80 >> 1);
                }
                v80 += v82;
              }
              while (v80 < v77);
              v83 = (void **)(v57 + 984 * v59 + 72);
              if (v80 >= 0x2000000001)
              {
                v84 = (void **)(v57 + 984 * v59 + 72);
                *__error() = 12;
                goto LABEL_69;
              }
              v272 = v79;
              v276 = v74;
LABEL_61:
              v280 = v83;
              v268 = *v83;
              size_t v85 = realloc(*v83, v80);
              if (v85)
              {
                int v74 = v276;
                *v280 = v85;
                size_t *v272 = v80;
                goto LABEL_63;
              }
              v84 = v280;
              free(v268);
LABEL_69:
              *v84 = 0;
              *AAFieldKey v68 = 0;
              v68[1] = 0;
              uint64_t v26 = v292;
            }
            uint32_t v75 = v284;
          }
          free(*v75);
          memset_s(__s, 0x18uLL, 0, 0x18uLL);
          uint64_t v38 = v299;
        }
      }
      uint64_t v87 = v57 + 984 * v59;
      uint64_t v89 = *(void *)(v87 + 32);
      uint64_t v88 = (void *)(v87 + 32);
      if (!v89)
      {
        uint64_t v90 = v57 + 984 * v54;
        uint64_t v92 = *(void *)(v90 + 32);
        v91 = (size_t *)(v90 + 32);
        if (v92)
        {
          *uint64_t v88 = 0;
          uint64_t v93 = v57 + 984 * v54;
          uint64_t v96 = *(const void **)(v93 + 48);
          uint64_t v95 = (void **)(v93 + 48);
          uint64_t v94 = v96;
          __AAArchiveStream sa = v91;
          size_t v97 = *v91;
          if ((*v91 & 0x8000000000000000) == 0)
          {
            v285 = v95;
            v293 = v26;
            uint64_t v98 = v57 + 984 * v59;
            size_t v101 = *(void *)(v98 + 40);
            v99 = (size_t *)(v98 + 40);
            size_t v100 = v101;
            if (v101 >= v97)
            {
LABEL_88:
              uint64_t v106 = *(void *)(v57 + 984 * v59 + 48);
              if (v94)
              {
                memcpy((void *)(v106 + *v88), v94, v97);
                uint64_t v26 = v293;
              }
              else
              {
                uint64_t v26 = v293;
                if (v106) {
                  memset_s((void *)(v106 + *v88), v97, 0, v97);
                }
              }
              *v88 += v97;
            }
            else
            {
              do
              {
                while (!v100)
                {
                  size_t v100 = 0x4000;
                  if (v97 <= 0x4000)
                  {
                    v273 = v99;
                    v277 = v94;
                    int v103 = (void **)(v57 + 984 * v59 + 48);
                    size_t v100 = 0x4000;
                    goto LABEL_86;
                  }
                }
                size_t v102 = v100 >> 1;
                if ((v100 & (v100 >> 1)) != 0) {
                  size_t v102 = v100 & (v100 >> 1);
                }
                v100 += v102;
              }
              while (v100 < v97);
              int v103 = (void **)(v57 + 984 * v59 + 48);
              if (v100 >= 0x2000000001)
              {
                int v104 = (void **)(v57 + 984 * v59 + 48);
                *__error() = 12;
                goto LABEL_94;
              }
              v273 = v99;
              v277 = v94;
LABEL_86:
              v281 = v103;
              v269 = *v103;
              uint64_t v105 = realloc(*v103, v100);
              if (v105)
              {
                uint64_t v94 = v277;
                *v281 = v105;
                size_t *v273 = v100;
                goto LABEL_88;
              }
              int v104 = v281;
              free(v269);
LABEL_94:
              *int v104 = 0;
              *uint64_t v88 = 0;
              v88[1] = 0;
              uint64_t v26 = v293;
            }
            uint64_t v95 = v285;
          }
          free(*v95);
          memset_s(__sa, 0x18uLL, 0, 0x18uLL);
          uint64_t v38 = v299;
        }
      }
      uint64_t v107 = v57 + 984 * v59;
      uint64_t v109 = *(void *)(v107 + 80);
      v108 = (void *)(v107 + 80);
      if (!v109)
      {
        uint64_t v110 = v57 + 984 * v54;
        uint64_t v112 = *(void *)(v110 + 80);
        AAFieldKey v111 = (size_t *)(v110 + 80);
        if (v112)
        {
          void *v108 = 0;
          uint64_t v113 = v57 + 984 * v54;
          AAFieldKey v116 = *(const void **)(v113 + 96);
          AAFieldKey v115 = (void **)(v113 + 96);
          v114 = v116;
          __AAArchiveStream sb = v111;
          size_t v117 = *v111;
          if ((*v111 & 0x8000000000000000) == 0)
          {
            v286 = v115;
            v294 = v26;
            uint64_t v118 = v57 + 984 * v59;
            size_t v121 = *(void *)(v118 + 88);
            uint32_t v119 = (size_t *)(v118 + 88);
            size_t v120 = v121;
            if (v121 >= v117)
            {
LABEL_113:
              uint64_t v126 = *(void *)(v57 + 984 * v59 + 96);
              if (v114)
              {
                memcpy((void *)(v126 + *v108), v114, v117);
                uint64_t v26 = v294;
              }
              else
              {
                uint64_t v26 = v294;
                if (v126) {
                  memset_s((void *)(v126 + *v108), v117, 0, v117);
                }
              }
              *v108 += v117;
            }
            else
            {
              do
              {
                while (!v120)
                {
                  size_t v120 = 0x4000;
                  if (v117 <= 0x4000)
                  {
                    v274 = v119;
                    v278 = v114;
                    AAFieldKey v123 = (void **)(v57 + 984 * v59 + 96);
                    size_t v120 = 0x4000;
                    goto LABEL_111;
                  }
                }
                size_t v122 = v120 >> 1;
                if ((v120 & (v120 >> 1)) != 0) {
                  size_t v122 = v120 & (v120 >> 1);
                }
                v120 += v122;
              }
              while (v120 < v117);
              AAFieldKey v123 = (void **)(v57 + 984 * v59 + 96);
              if (v120 >= 0x2000000001)
              {
                size_t v124 = (void **)(v57 + 984 * v59 + 96);
                *__error() = 12;
                goto LABEL_119;
              }
              v274 = v119;
              v278 = v114;
LABEL_111:
              v282 = v123;
              v270 = *v123;
              v125 = realloc(*v123, v120);
              if (v125)
              {
                v114 = v278;
                *v282 = v125;
                size_t *v274 = v120;
                goto LABEL_113;
              }
              size_t v124 = v282;
              free(v270);
LABEL_119:
              *size_t v124 = 0;
              void *v108 = 0;
              v108[1] = 0;
              uint64_t v26 = v294;
            }
            AAFieldKey v115 = v286;
          }
          free(*v115);
          memset_s(__sb, 0x18uLL, 0, 0x18uLL);
          uint64_t v38 = v299;
        }
      }
      uint64_t v127 = v57 + 984 * v59;
      uint64_t v129 = *(void *)(v127 + 104);
      v128 = (void *)(v127 + 104);
      if (!v129)
      {
        uint64_t v130 = v57 + 984 * v54;
        uint64_t v132 = *(void *)(v130 + 104);
        v131 = (size_t *)(v130 + 104);
        if (v132)
        {
          void *v128 = 0;
          uint64_t v133 = v57 + 984 * v54;
          uint64_t v136 = *(const void **)(v133 + 120);
          timespec v135 = (void **)(v133 + 120);
          __darwin_time_t v134 = v136;
          __sc = v131;
          size_t v137 = *v131;
          if ((*v131 & 0x8000000000000000) == 0)
          {
            v287 = v135;
            v295 = v26;
            uint64_t v138 = v57 + 984 * v59;
            size_t v141 = *(void *)(v138 + 112);
            v139 = (size_t *)(v138 + 112);
            size_t v140 = v141;
            if (v141 >= v137)
            {
LABEL_138:
              uint64_t v146 = *(void *)(v57 + 984 * v59 + 120);
              if (v134)
              {
                memcpy((void *)(v146 + *v128), v134, v137);
                uint64_t v26 = v295;
              }
              else
              {
                uint64_t v26 = v295;
                if (v146) {
                  memset_s((void *)(v146 + *v128), v137, 0, v137);
                }
              }
              *v128 += v137;
            }
            else
            {
              do
              {
                while (!v140)
                {
                  size_t v140 = 0x4000;
                  if (v137 <= 0x4000)
                  {
                    v275 = v139;
                    v279 = v134;
                    v143 = (void **)(v57 + 984 * v59 + 120);
                    size_t v140 = 0x4000;
                    goto LABEL_136;
                  }
                }
                size_t v142 = v140 >> 1;
                if ((v140 & (v140 >> 1)) != 0) {
                  size_t v142 = v140 & (v140 >> 1);
                }
                v140 += v142;
              }
              while (v140 < v137);
              v143 = (void **)(v57 + 984 * v59 + 120);
              if (v140 >= 0x2000000001)
              {
                char v144 = (void **)(v57 + 984 * v59 + 120);
                *__error() = 12;
                goto LABEL_144;
              }
              v275 = v139;
              v279 = v134;
LABEL_136:
              v283 = v143;
              v271 = *v143;
              v145 = realloc(*v143, v140);
              if (v145)
              {
                __darwin_time_t v134 = v279;
                *v283 = v145;
                size_t *v275 = v140;
                goto LABEL_138;
              }
              char v144 = v283;
              free(v271);
LABEL_144:
              *char v144 = 0;
              void *v128 = 0;
              v128[1] = 0;
              uint64_t v26 = v295;
            }
            timespec v135 = v287;
          }
          free(*v135);
          memset_s(__sc, 0x18uLL, 0, 0x18uLL);
          uint64_t v38 = v299;
        }
      }
      uint64_t v147 = v57 + 984 * v59;
      int v149 = *(_DWORD *)(v147 + 136);
      uint64_t v148 = v147 + 136;
      if (!v149)
      {
        uint64_t v150 = v57 + 984 * v54;
        int v152 = *(_DWORD *)(v150 + 136);
        uint64_t v151 = v150 + 136;
        if (v152)
        {
          *(_OWORD *)uint64_t v148 = *(_OWORD *)v151;
          long long v153 = *(_OWORD *)(v151 + 16);
          long long v154 = *(_OWORD *)(v151 + 32);
          long long v155 = *(_OWORD *)(v151 + 48);
          *(void *)(v148 + 64) = *(void *)(v151 + 64);
          *(_OWORD *)(v148 + 32) = v154;
          *(_OWORD *)(v148 + 48) = v155;
          *(_OWORD *)(v148 + 16) = v153;
        }
      }
      uint64_t v156 = v57 + 984 * v59;
      int v158 = *(_DWORD *)(v156 + 208);
      uint64_t v157 = v156 + 208;
      if (!v158)
      {
        uint64_t v159 = v57 + 984 * v54;
        int v161 = *(_DWORD *)(v159 + 208);
        v160 = (long long *)(v159 + 208);
        if (v161)
        {
          long long v162 = *v160;
          long long v163 = v160[1];
          long long v164 = v160[2];
          *(void *)(v157 + 48) = *((void *)v160 + 6);
          *(_OWORD *)(v157 + 16) = v163;
          *(_OWORD *)(v157 + 32) = v164;
          *(_OWORD *)uint64_t v157 = v162;
        }
      }
      uint64_t v165 = v57 + 984 * v59;
      uint64_t v167 = *(void *)(v165 + 128);
      v166 = (void *)(v165 + 128);
      if (v167 == -1) {
        void *v166 = *(void *)(v57 + 984 * v54 + 128);
      }
LABEL_56:
      ++v54;
      v56 += 984;
    }
    while (v54 < *(void *)(v13 + 72));
LABEL_156:
    *(void *)(v13 + 72) = v55;
    free(v309);
    AAArchiveStreamClose((AAArchiveStream)v31);
    AAArchiveStreamClose(s);
    AAArchiveStreamClose(v306);
    AAFieldKeySetDestroy(v38);
    uint64_t v27 = v300 + 1;
    uint64_t v29 = v296;
    uint64_t v28 = v297;
  }
  while ((unint64_t)(v300 + 1) < *(void *)(v13 + 56));
LABEL_157:
  AAArchiveStreamClose(0);
  AAArchiveStreamClose(0);
  AAArchiveStreamClose(0);
  AAFieldKeySetDestroy(0);
  AAFieldKeySetDestroy(v26);
  uint64_t v172 = *(void *)(v13 + 72);
  if (v172)
  {
    v173 = *(unsigned int **)(v13 + 80);
    do
    {
      if (v173[18 * *(void *)(v13 + 56) + 48] == 70 && *((void *)v173 + 16) != -1)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"AAAssetBuilderGenerate", 1562, 27, 0, "HLC field found, not supported: %s", v170, v171, *(unsigned char *)(*(void *)(v13 + 32) + 32) + *(unsigned char *)(*(void *)(*(void *)(v13 + 32) + 8) + 16 * *v173));
        goto LABEL_201;
      }
      v173 += 246;
      --v172;
    }
    while (v172);
  }
  int v310 = -1;
  *(_DWORD *)(v13 + 88) = 1;
  if ((StringTableAppend(*(unsigned int **)(v13 + 40), "main", 4uLL, &v310, v168, v169, v170, v171) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateAssignLabels", 913, 27, 0, "string table", v177, v178, v266);
    v208 = "assigning labels";
    __int16 v209 = 1568;
    goto LABEL_209;
  }
  unint64_t v179 = *(void *)(v13 + 72);
  if (v179)
  {
    v180 = (int *)(*(void *)(v13 + 80) + 4);
    do
    {
      int *v180 = v310;
      v180 += 246;
      --v179;
    }
    while (v179);
    unint64_t v179 = *(void *)(v13 + 72);
  }
  if (*(_DWORD *)(v13 + 24))
  {
    if (v179)
    {
      unint64_t v181 = 0;
      uint64_t v182 = 0;
      uint64_t v183 = 0;
      v184 = 0;
      uint64_t v185 = *(void *)(v13 + 56) - 1;
      uint64_t v186 = 264;
      v187 = (FILE **)MEMORY[0x263EF8348];
      uint64_t v298 = v185;
      do
      {
        uint64_t v188 = *(void *)(v13 + 80);
        int v189 = *(_DWORD *)(v188 + 984 * v181 + 72 * v185 + 264);
        if (v189) {
          ++v182;
        }
        if (v189 == 70) {
          v184 = (AAArchiveStream_impl *)((char *)v184 + 1);
        }
        if (v189 == 68) {
          ++v183;
        }
        if (*(_DWORD *)(v13 + 24) >= 2u)
        {
          uint64_t v301 = v182;
          AAArchiveStream sa = v184;
          uint64_t v307 = v183;
          if (!v181) {
            fwrite("All entries:\n", 0xDuLL, 1uLL, *v187);
          }
          if (*(void *)(v13 + 56))
          {
            unint64_t v190 = 0;
            v191 = (int *)(v188 + v186);
            do
            {
              int v193 = *v191;
              v191 += 18;
              LODWORD(v192) = v193;
              if ((_BYTE)v193) {
                uint64_t v192 = v192;
              }
              else {
                uint64_t v192 = 45;
              }
              fprintf(*v187, " %c", v192);
              ++v190;
            }
            while (v190 < *(void *)(v13 + 56));
          }
          fprintf(*v187, " lbl=%s", (const char *)(*(void *)(*(void *)(v13 + 40) + 32)+ *(void *)(*(void *)(*(void *)(v13 + 40) + 8)+ 16 * *(unsigned int *)(v188 + 984 * v181 + 4))));
          if (v189 == 70)
          {
            uint64_t v185 = v298;
            fprintf(*v187, " siz=%llu yec=%zu", *(void *)(v188 + 984 * v181 + 72 * v298 + 280), *(void *)(v188 + 984 * v181 + 32));
            uint64_t v183 = v307;
          }
          else
          {
            uint64_t v183 = v307;
            uint64_t v185 = v298;
            if (v189 == 76) {
              fprintf(*v187, " lnk=%s", *(const char **)(v188 + 984 * v181 + 72));
            }
          }
          fprintf(*v187, " pat=%s", (const char *)(*(void *)(*(void *)(v13 + 32) + 32)+ *(void *)(*(void *)(*(void *)(v13 + 32) + 8)+ 16 * *(unsigned int *)(v188 + 984 * v181))));
          fputc(10, *v187);
          unint64_t v179 = *(void *)(v13 + 72);
          uint64_t v182 = v301;
          v184 = sa;
        }
        ++v181;
        v186 += 984;
      }
      while (v181 < v179);
    }
    else
    {
      v184 = 0;
      uint64_t v183 = 0;
      uint64_t v182 = 0;
    }
    v210 = (FILE **)MEMORY[0x263EF8348];
    v211 = v184;
    fprintf((FILE *)*MEMORY[0x263EF8348], "%12zu entries in output\n", v182);
    fprintf(*v210, "%12zu regular files\n", (size_t)v211);
    fprintf(*v210, "%12zu directories\n", v183);
    unint64_t v179 = *(void *)(v13 + 72);
  }
  if (!v179)
  {
LABEL_263:
    v240 = 0;
    goto LABEL_264;
  }
  unint64_t v212 = 0;
  uint64_t v308 = *(void *)(v13 + 56);
  uint64_t v213 = v308 - 1;
  uint64_t v214 = 264;
  uint64_t v215 = 304;
  uint64_t v216 = 280;
  while (2)
  {
    uint64_t v217 = *(void *)(v13 + 80);
    v218 = (unsigned int *)(v217 + 984 * v212);
    uint64_t v219 = *(void *)(v13 + 32);
    uint64_t v220 = *(void *)(v219 + 32);
    uint64_t v221 = *(void *)(*(void *)(v219 + 8) + 16 * *v218);
    unsigned int v222 = v218[18 * v213 + 66];
    if (!v222)
    {
      unsigned int v232 = *(_DWORD *)(v13 + 24);
      int v233 = 2;
      v234 = "REMOVE (not in output): %s\n";
      goto LABEL_251;
    }
    uint64_t v223 = *(void *)(v13 + 48);
    if (!v223)
    {
      unsigned int v232 = *(_DWORD *)(v13 + 24);
      int v233 = 3;
      v234 = "ARCHIVE (full replacement): %s\n";
      goto LABEL_251;
    }
    if (v222 != 70)
    {
      unsigned int v232 = *(_DWORD *)(v13 + 24);
      int v233 = 3;
      v234 = "ARCHIVE (not a regular file): %s\n";
LABEL_251:
      if (v232 <= 1) {
        goto LABEL_253;
      }
      goto LABEL_252;
    }
    v224 = (int *)(v217 + v214);
    uint64_t v225 = *(void *)(v13 + 48);
    do
    {
      int v226 = *v224;
      v224 += 18;
      if (v226 != 70)
      {
        unsigned int v232 = *(_DWORD *)(v13 + 24);
        int v233 = 3;
        v234 = "ARCHIVE (different type/missing in some inputs): %s\n";
        goto LABEL_251;
      }
      --v225;
    }
    while (v225);
    v227 = (void *)(v217 + v215);
    uint64_t v228 = *(void *)(v13 + 48);
    while (1)
    {
      uint64_t v174 = v227[3];
      uint64_t v175 = *(void *)(v217 + 984 * v212 + 72 * v213 + 320);
      uint64_t v176 = *(void *)(v217 + 984 * v212 + 72 * v213 + 328);
      BOOL v229 = *v227 == *(void *)(v217 + 984 * v212 + 72 * v213 + 304)
          && v227[1] == *(void *)(v217 + 984 * v212 + 72 * v213 + 312);
      BOOL v230 = v229 && v227[2] == v175;
      if (!v230 || v174 != v176) {
        break;
      }
      v227 += 9;
      if (!--v228)
      {
        unsigned int v232 = *(_DWORD *)(v13 + 24);
        int v233 = 1;
        v234 = "COPY: %s\n";
        goto LABEL_251;
      }
    }
    v235 = (uint64_t *)(v217 + v216);
    do
    {
      uint64_t v236 = *v235;
      v235 += 9;
      if (!v236)
      {
        unsigned int v232 = *(_DWORD *)(v13 + 24);
        int v233 = 3;
        v234 = "ARCHIVE (empty in some inputs): %s\n";
        goto LABEL_251;
      }
      --v223;
    }
    while (v223);
    if (*(void *)(v217 + 984 * v212 + 72 * v213 + 280) >= *(void *)(*(void *)(v13 + 8) + 104)) {
      v234 = "PATCH: %s\n";
    }
    else {
      v234 = "ARCHIVE (too small for patching): %s\n";
    }
    if (*(void *)(v217 + 984 * v212 + 72 * v213 + 280) < *(void *)(*(void *)(v13 + 8) + 104)) {
      int v233 = 3;
    }
    else {
      int v233 = 4;
    }
    if (*(_DWORD *)(v13 + 24) >= 2u)
    {
LABEL_252:
      fprintf((FILE *)*MEMORY[0x263EF8348], v234, v174, v175, v176, v220 + v221);
      unint64_t v179 = *(void *)(v13 + 72);
    }
LABEL_253:
    uint64_t v237 = v217 + 984 * v212++;
    *(_DWORD *)(v237 + 8) = v233;
    v214 += 984;
    v215 += 984;
    v216 += 984;
    if (v212 < v179) {
      continue;
    }
    break;
  }
  if (!v179) {
    goto LABEL_263;
  }
  size_t v238 = 0;
  uint64_t v239 = *(void *)(v13 + 80) + 192;
  do
  {
    if (*(_DWORD *)(v239 + 72 * v308) == 70 && *(void *)(v239 - 64) != -1) {
      ++v238;
    }
    v239 += 984;
    --v179;
  }
  while (v179);
  if (!v238) {
    goto LABEL_263;
  }
  if (v238 > 0x400000000)
  {
    *__error() = 12;
    goto LABEL_298;
  }
  v248 = (AAArchiveStream_impl *)calloc(v238, 8uLL);
  if (v248)
  {
    v240 = v248;
    unint64_t v250 = *(void *)(v13 + 72);
    v249 = *(char **)(v13 + 80);
    if (v250)
    {
      uint64_t v251 = 0;
      unint64_t v252 = 0;
      v253 = v249 + 192;
      do
      {
        if (*(_DWORD *)&v253[72 * v308] == 70 && *((void *)v253 - 8) != -1)
        {
          *((void *)v248 + v251++) = v252;
          unint64_t v250 = *(void *)(v13 + 72);
        }
        ++v252;
        v253 += 984;
      }
      while (v252 < v250);
    }
    qsort_r(v248, v238, 8uLL, v249, (int (__cdecl *)(void *, const void *, const void *))entryIndexCmpHLC);
    size_t v254 = 0;
    uint64_t v255 = -(uint64_t)v238;
    v302 = (char *)v240 + 8;
    AAArchiveStream sb = v240;
    do
    {
      size_t v256 = v254 + 1;
      if (v254 + 1 < v238)
      {
        unint64_t v257 = 1;
        while (*(void *)(*(void *)(v13 + 80) + 984 * *((void *)v240 + v254 + v257) + 128) == *(void *)(*(void *)(v13 + 80) + 984 * *((void *)v240 + v254) + 128))
        {
          ++v257;
          if (!(v255 + v254 + v257))
          {
            unint64_t v257 = v238 - v254;
            size_t v256 = v238;
            goto LABEL_290;
          }
        }
        size_t v256 = v254 + v257;
LABEL_290:
        if (v257 >= 2)
        {
          unint64_t v258 = v257 - 1;
          v259 = &v302[8 * v254];
          do
          {
            uint64_t v260 = *(void *)(v13 + 80);
            uint64_t v262 = *(void *)v259;
            v259 += 8;
            uint64_t v261 = v262;
            if (*(_DWORD *)(v13 + 24) >= 2u) {
              fprintf((FILE *)*MEMORY[0x263EF8348], "FIXUP (hard linked): %s\n", (const char *)(*(void *)(*(void *)(v13 + 32) + 32)+ *(void *)(*(void *)(*(void *)(v13 + 32) + 8)+ 16 * *(unsigned int *)(v260 + 984 * v261))));
            }
            *(_DWORD *)(v260 + 984 * v261 + 8) = 5;
            --v258;
          }
          while (v258);
          v240 = sb;
          uint64_t v255 = -(uint64_t)v238;
        }
      }
      size_t v254 = v256;
    }
    while (v256 < v238);
LABEL_264:
    free(v240);
    if ((stateComputePatches(v13) & 0x80000000) != 0)
    {
      v208 = "compute patches";
      __int16 v209 = 1601;
    }
    else
    {
      if ((stateGenerateArchive(v13) & 0x80000000) == 0)
      {
        uint64_t v202 = 0;
        goto LABEL_202;
      }
      v208 = "generate archive";
      __int16 v209 = 1602;
    }
  }
  else
  {
LABEL_298:
    v263 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateInitOps", 1029, 27, *v263, "malloc", v264, v265, v266);
    v208 = "init ops";
    __int16 v209 = 1600;
  }
LABEL_209:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"AAAssetBuilderGenerate", v209, 27, 0, v208, v206, v207, v266);
LABEL_201:
  uint64_t v202 = 0xFFFFFFFFLL;
LABEL_202:
  stateDestroy_0(v13);
  return v202;
}

uint64_t stateComputePatches(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  size_t v3 = *(unsigned int *)(a1 + 20);
  if (*(_DWORD *)(a1 + 24)) {
    fwrite("Computing patches...\n", 0x15uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  uint64_t v4 = (void **)calloc(v3, 8uLL);
  uint64_t v5 = v4;
  if (!v4)
  {
    int v37 = *__error();
    __int16 v40 = 1072;
    goto LABEL_28;
  }
  if (v3)
  {
    size_t v6 = v3;
    uint64_t v7 = v4;
    while (1)
    {
      uint64_t v8 = malloc(0x10uLL);
      *uint64_t v7 = v8;
      if (!v8) {
        break;
      }
      ++v7;
      if (!--v6) {
        goto LABEL_8;
      }
    }
    int v37 = *__error();
    __int16 v40 = 1076;
LABEL_28:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateComputePatches", v40, 27, v37, "malloc", v38, v39, v48[0]);
    uint64_t v16 = 0;
    goto LABEL_35;
  }
LABEL_8:
  uint64_t v16 = ThreadPoolCreate(v3, (uint64_t)v5, (uint64_t)computePatchesWorkerProc);
  if (!v16)
  {
    uint64_t v41 = "ThreadPoolCreate";
    __int16 v42 = 1081;
    goto LABEL_34;
  }
  unint64_t v17 = *(void *)(a1 + 72);
  if (v17)
  {
    uint64_t v18 = 0;
    for (unint64_t i = 0; i < v17; ++i)
    {
      uint64_t v20 = *(void *)(a1 + 80);
      if (*(_DWORD *)(v20 + v18 + 8) == 4
        && *(void *)(v20 + 72 * v2 + 208 + v18) < *(void *)(*(void *)(a1 + 8) + 152))
      {
        Worker = (void *)ThreadPoolGetWorker((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15);
        if (!Worker)
        {
          uint64_t v41 = "ThreadPoolGetWorker";
          __int16 v42 = 1089;
          goto LABEL_34;
        }
        void *Worker = a1;
        Worker[1] = i;
        if ((ThreadPoolRunWorker((uint64_t)v16, (uint64_t)Worker, v22, v23, v24, v25, v14, v15) & 0x80000000) != 0)
        {
          uint64_t v41 = "ThreadPoolRunWorker";
          __int16 v42 = 1093;
          goto LABEL_34;
        }
        unint64_t v17 = *(void *)(a1 + 72);
      }
      v18 += 984;
    }
  }
  if ((ThreadPoolSync(v16) & 0x80000000) != 0)
  {
    uint64_t v41 = "ThreadPoolSync";
    __int16 v42 = 1095;
    goto LABEL_34;
  }
  unint64_t v31 = *(void *)(a1 + 72);
  if (!v31)
  {
LABEL_25:
    int v36 = 1;
    goto LABEL_36;
  }
  uint64_t v32 = 0;
  unint64_t v33 = 0;
  uint64_t v34 = 72 * v2 + 208;
  while (1)
  {
    uint64_t v35 = *(void *)(a1 + 80);
    if (*(_DWORD *)(v35 + v32 + 8) != 4 || *(void *)(v35 + v34 + v32) < *(void *)(*(void *)(a1 + 8) + 152)) {
      goto LABEL_24;
    }
    v48[0] = a1;
    v48[1] = v33;
    if ((computePatchesWorkerProc((uint64_t)v48, v26, v27, v28, v29, v30, v14, v15) & 0x80000000) != 0) {
      break;
    }
    unint64_t v31 = *(void *)(a1 + 72);
LABEL_24:
    ++v33;
    v32 += 984;
    if (v33 >= v31) {
      goto LABEL_25;
    }
  }
  uint64_t v41 = "compute patch";
  __int16 v42 = 1105;
LABEL_34:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateComputePatches", v42, 27, 0, v41, v14, v15, v48[0]);
LABEL_35:
  int v36 = 0;
LABEL_36:
  if ((ThreadPoolDestroy((uint64_t)v16) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateComputePatches", 1109, 27, 0, "ThreadPoolDestroy", v43, v44, v48[0]);
    int v36 = 0;
  }
  if (v5)
  {
    if (v3)
    {
      uint64_t v45 = v5;
      do
      {
        uint64_t v46 = *v45++;
        free(v46);
        --v3;
      }
      while (v3);
    }
    free(v5);
  }
  if (v36) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t stateGenerateArchive(uint64_t a1)
{
  uint64_t v281 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  size_t v3 = *(uint64_t **)(a1 + 8);
  uint64_t v4 = v3[16];
  uint64_t v5 = *v3;
  if (*(_DWORD *)(a1 + 24))
  {
    fwrite("Generating asset...\n", 0x14uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    size_t v3 = *(uint64_t **)(a1 + 8);
  }
  AAByteStream ostream = (AAByteStream)AATempStreamOpen(v3[14]);
  if (!ostream)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1159, 27, 0, "AATempStreamOpen", v6, v7, v248);
    uint64_t v19 = 0;
    uint64_t v10 = 0;
LABEL_315:
    uint64_t v16 = 0;
    uint64_t v13 = 0;
LABEL_316:
    uint64_t v217 = 0;
    v218 = 0;
    uint64_t v216 = 0;
    uint64_t v24 = 0;
LABEL_317:
    uint64_t v159 = 0;
LABEL_318:
    uint64_t v224 = 0xFFFFFFFFLL;
    goto LABEL_319;
  }
  uint64_t v10 = AAHeaderCreate();
  if (!v10)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1161, 27, 0, "AAHeaderCreate", v8, v9, v248);
    uint64_t v19 = 0;
    goto LABEL_315;
  }
  uint64_t v13 = AAFieldKeySetCreateWithString("IDX,IDZ,SIZ");
  if (!v13)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1163, 27, 0, "AAFieldKeySetCreateWithString", v11, v12, v248);
    uint64_t v19 = 0;
    uint64_t v16 = 0;
    goto LABEL_316;
  }
  uint64_t v16 = AAFieldKeySetCreateWithString("DAT,YEC,UID,GID,FLG,AFT,AFR");
  if (!v16)
  {
    int v226 = "AAFieldKeySetCreateWithString";
    __int16 v227 = 1165;
    int v228 = 0;
LABEL_325:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v227, 27, v228, v226, v14, v15, v248);
    uint64_t v19 = 0;
    goto LABEL_316;
  }
  v274 = malloc(0x10000uLL);
  if (!v274)
  {
    int v228 = *__error();
    int v226 = "malloc";
    __int16 v227 = 1167;
    goto LABEL_325;
  }
  if (!*(_DWORD *)(a1 + 88))
  {
LABEL_304:
    uint64_t v159 = (AAByteStream *)subArchiveCreate(*(void *)(*(void *)(a1 + 8) + 112), 0, 0, 0);
    if (v159)
    {
      uint64_t v19 = v274;
      if (AAByteStreamSeek(ostream, 0, 0) < 0)
      {
        v231 = "seek";
        __int16 v232 = 1500;
LABEL_329:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v232, 27, 0, v231, v160, v161, v248);
        uint64_t v217 = 0;
LABEL_330:
        v218 = 0;
        uint64_t v216 = 0;
        uint64_t v24 = 0;
        goto LABEL_318;
      }
      uint64_t v215 = v159[4];
      if (!v215) {
        uint64_t v215 = v159[3];
      }
      uint64_t v216 = AAEncodeArchiveOutputStreamOpen(v215, 0, 0, 0, *(_DWORD *)(a1 + 20));
      uint64_t v217 = AAConvertArchiveOutputStreamOpen(v216, v13, v16, 0, 0, 0, *(_DWORD *)(a1 + 20));
      v218 = AADecodeArchiveInputStreamOpen(ostream, 0, 0, 0x100uLL, *(_DWORD *)(a1 + 20));
      if (AAArchiveStreamProcess(v218, v217, 0, 0, 0, *(_DWORD *)(a1 + 20)) < 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1507, 27, 0, "processing manifest", v219, v220, v248);
        goto LABEL_335;
      }
      AAArchiveStreamClose(v218);
      AAArchiveStreamClose(v217);
      AAArchiveStreamClose(v216);
      uint64_t v221 = *(AAByteStream_impl **)a1;
      AAByteStreamClose(v159[4]);
      v159[4] = 0;
      if ((encodeYOPEntry(v221, 0x4Du, 0, 0, v159[3]) & 0x80000000) == 0)
      {
        subArchiveDestroy(v159);
        uint64_t v19 = v274;
        if (AAByteStreamSeek(ostream, 0, 0) < 0)
        {
          uint64_t v239 = "seek";
          __int16 v240 = 1520;
        }
        else
        {
          if ((AAByteStreamProcess(ostream, *(AAByteStream *)a1) & 0x8000000000000000) == 0)
          {
            uint64_t v217 = 0;
            v218 = 0;
            uint64_t v216 = 0;
            uint64_t v24 = 0;
            uint64_t v159 = 0;
            uint64_t v224 = 0;
            goto LABEL_319;
          }
          uint64_t v239 = "writing archive";
          __int16 v240 = 1521;
        }
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v240, 27, 0, v239, v222, v223, v248);
        goto LABEL_316;
      }
      BOOL v229 = "encode entry";
      __int16 v230 = 1514;
    }
    else
    {
      BOOL v229 = "sub_asset";
      __int16 v230 = 1498;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v230, 27, 0, v229, v213, v214, v248);
    uint64_t v217 = 0;
    v218 = 0;
    uint64_t v216 = 0;
LABEL_335:
    uint64_t v24 = 0;
    uint64_t v224 = 0xFFFFFFFFLL;
    uint64_t v19 = v274;
    goto LABEL_319;
  }
  uint64_t v17 = 0;
  header = v10;
  uint64_t v276 = v2 - 1;
  char v255 = v5;
  uint64_t v256 = v4 != 0;
  v272 = v13;
  v273 = v16;
  uint64_t v262 = v4;
  BOOL v261 = v4 != 0;
LABEL_10:
  unsigned int v18 = 0;
  uint64_t v251 = v17;
  char __s = (char *)(*(void *)(*(void *)(a1 + 40) + 32)
               + *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 16 * v17));
  uint64_t v19 = v274;
  while (v18 <= 3 && !*(void *)(a1 + 48))
  {
LABEL_302:
    if (++v18 == 10)
    {
      uint64_t v17 = v251 + 1;
      if (v251 + 1 >= (unint64_t)*(unsigned int *)(a1 + 88)) {
        goto LABEL_304;
      }
      goto LABEL_10;
    }
  }
  unsigned int v264 = v18;
  uint64_t v21 = (AAByteStream *)subArchiveCreate(*(void *)(*(void *)(a1 + 8) + 112), *(_DWORD *)(*(void *)(a1 + 8) + 136), *(void *)(*(void *)(a1 + 8) + 144), *(_DWORD *)(a1 + 20));
  uint64_t v24 = v21;
  if (!v21)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1190, 27, 0, "subArchiveCreate", v22, v23, v248);
    uint64_t v217 = 0;
    v218 = 0;
    uint64_t v216 = 0;
    goto LABEL_317;
  }
  unint64_t v25 = *(void *)(a1 + 72);
  if (!v25)
  {
LABEL_301:
    AAByteStreamClose(v24[4]);
    AAByteStreamClose(v24[3]);
    free(v24);
    unsigned int v18 = v264;
    goto LABEL_302;
  }
  v263 = v21;
  uint64_t v271 = 0;
  int v26 = 0;
  unsigned int v27 = 0;
  unint64_t v258 = 0;
  unint64_t v28 = 0;
  uint64_t v29 = ostream;
  unsigned int v30 = v264;
  while (2)
  {
    unint64_t v31 = v25 + ~v28;
    if (v20) {
      unint64_t v32 = v31;
    }
    else {
      unint64_t v32 = v28;
    }
    uint64_t v13 = *(AAFieldKeySet_impl **)(a1 + 80);
    unint64_t v33 = (unsigned int *)((char *)v13 + 984 * v32);
    uint64_t v34 = (const char *)(*(void *)(*(void *)(a1 + 32) + 32)
                       + *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16 * *v33));
    uint64_t v35 = v33[18 * v276 + 66];
    switch(v30)
    {
      case 0u:
        if (v35 != 70)
        {
          unsigned int v27 = 73;
          int v26 = 1;
          goto LABEL_156;
        }
        int v36 = *((_DWORD *)v13 + 246 * v32 + 2);
        int v26 = 1;
        if (v36 != 1 && v36 != 4)
        {
          unsigned int v27 = 73;
          goto LABEL_156;
        }
        uint64_t v38 = v35;
        int buf = 1;
        goto LABEL_35;
      case 1u:
        int v39 = *((_DWORD *)v13 + 246 * v32 + 2);
        uint64_t v13 = v272;
        uint64_t v16 = v273;
        if (v39 != 2 && (v39 != 3 || v35 == 68))
        {
          unsigned int v27 = 82;
LABEL_233:
          int v26 = v261;
          goto LABEL_243;
        }
        if (!v262)
        {
          unsigned int v27 = 82;
          if ((encodeYOPEntry(v29, 0x52u, v34, __s, 0) & 0x80000000) != 0)
          {
            uint64_t v244 = "encode entry";
            __int16 v245 = 1341;
            goto LABEL_379;
          }
          goto LABEL_149;
        }
        uint64_t v92 = (uint64_t)v263[4];
        if (!v92) {
          uint64_t v92 = (uint64_t)v263[3];
        }
        if ((encodeEntry(v92, v35, v34) & 0x80000000) != 0)
        {
          uint64_t v244 = "encode entry";
          __int16 v245 = 1336;
          goto LABEL_379;
        }
        ++v271;
        unsigned int v27 = 82;
        goto LABEL_104;
      case 2u:
        if (*((_DWORD *)v13 + 246 * v32 + 2) != 4) {
          goto LABEL_156;
        }
        if (v27 == 79) {
          goto LABEL_89;
        }
        int buf = v26;
        if (v27 == 73)
        {
          uint64_t v38 = v33[18 * v276 + 66];
LABEL_35:
          int v40 = AAHeaderClear(v10);
          v41.iAAFieldKey key = 5265748;
          int v42 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v41, v38);
          size_t v43 = strlen(v34);
          v44.iAAFieldKey key = 5521744;
          BOOL v47 = (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v44, v34, v43) | v42 | v40) >= 0;
          unint64_t v48 = *(void *)(a1 + 48);
          if (v48)
          {
            for (unint64_t i = 0; i < v48; ++i)
            {
              if (*((_DWORD *)v13 + 246 * v32 + 18 * i + 66) == 70)
              {
                if (i)
                {
                  char v50 = (void *)((char *)v13 + 984 * v32 + 304);
                  unint64_t v51 = i;
                  while (1)
                  {
                    if (*((_DWORD *)v50 - 10) == 70)
                    {
                      BOOL v52 = *v50 == *((void *)v13 + 123 * v32 + 9 * i + 38)
                         && v50[1] == *((void *)v13 + 123 * v32 + 9 * i + 39);
                      BOOL v53 = v52 && v50[2] == *((void *)v13 + 123 * v32 + 9 * i + 40);
                      if (v53 && v50[3] == *((void *)v13 + 123 * v32 + 9 * i + 41)) {
                        break;
                      }
                    }
                    v50 += 9;
                    if (!--v51) {
                      goto LABEL_52;
                    }
                  }
                }
                else
                {
LABEL_52:
                  v55.iAAFieldKey key = 3295315;
                  if (AAHeaderSetFieldHash(header, 0xFFFFFFFF, v55, 3u, (const uint8_t *)v13 + 984 * v32 + 72 * i + 304) < 0)BOOL v47 = 0; {
                  unint64_t v48 = *(void *)(a1 + 48);
                  }
                }
              }
            }
          }
          if (!v47)
          {
            v235 = "setup header";
            __int16 v236 = 1284;
            goto LABEL_352;
          }
          uint64_t v56 = v29;
          size_t EncodedSize = AAHeaderGetEncodedSize(header);
          EncodedData = AAHeaderGetEncodedData(header);
          uint64_t v13 = v272;
          uint64_t v16 = v273;
          if (buf)
          {
            uint64_t v56 = v263[4];
            if (!v56) {
              uint64_t v56 = v263[3];
            }
          }
          if (*((void *)v56 + 3))
          {
            uint64_t v61 = 0;
            if (EncodedSize)
            {
              size_t v62 = EncodedSize;
              while (1)
              {
                uint64_t v63 = (*((uint64_t (**)(void, const uint8_t *, size_t))v56 + 3))(*(void *)v56, EncodedData, v62);
                if (v63 < 1) {
                  break;
                }
                EncodedData += v63;
                v61 += v63;
                v62 -= v63;
                if (!v62) {
                  goto LABEL_238;
                }
              }
              uint64_t v61 = v63;
            }
          }
          else
          {
            uint64_t v61 = -1;
          }
LABEL_238:
          if (v61 != EncodedSize)
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1290, 27, 0, "write header", v58, v59, v248);
            uint64_t v217 = 0;
            v218 = 0;
            uint64_t v216 = 0;
            uint64_t v24 = 0;
            uint64_t v224 = 0xFFFFFFFFLL;
            uint64_t v10 = header;
            goto LABEL_355;
          }
          int v26 = buf;
          uint64_t v165 = v271;
          if (buf) {
            uint64_t v165 = v271 + 1;
          }
          uint64_t v271 = v165;
          unsigned int v27 = 73;
          uint64_t v29 = ostream;
          uint64_t v19 = v274;
          uint64_t v10 = header;
          goto LABEL_242;
        }
        uint64_t v113 = (char *)v13 + 984 * v32;
        uint64_t v115 = *((void *)v113 + 3);
        uint64_t v114 = (uint64_t)(v113 + 24);
        uint64_t valueb = v114;
        if (v115)
        {
          uint64_t v24 = 0;
          off_t sizea = *(void *)(v114 - 8);
          goto LABEL_250;
        }
        if (snprintf(__str, 0x400uLL, "%s/0x%08zx", (const char *)(a1 + 92), v28) >= 0x400)
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1369, 27, 0, "patch path: %s", v166, v167, (char)v34);
        }
        else
        {
          memset(&offset, 0, sizeof(offset));
          if (stat(__str, &offset) < 0 || (offset.st_mode & 0xF000) != 0x8000)
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1371, 27, 0, "invalid patch: %s", v168, v169, (char)__str);
          }
          else
          {
            off_t sizea = offset.st_size;
            AAByteStream v170 = AAFileStreamOpenWithPath(__str, 0, 0);
            if (v170)
            {
              uint64_t v24 = (AAByteStream *)v170;
              uint64_t v114 = valueb;
LABEL_250:
              AAHeader v253 = (AAHeader)(v114 + 112);
              int v250 = AAHeaderClear(v10);
              v173.iAAFieldKey key = 5265748;
              int v249 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v173, 0x4DuLL);
              v174.iAAFieldKey key = 5263193;
              int v175 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v174, 0x50uLL);
              size_t v176 = strlen(v34);
              v177.iAAFieldKey key = 5521744;
              int v178 = AAHeaderSetFieldString(v10, 0xFFFFFFFF, v177, v34, v176);
              size_t v179 = strlen(__s);
              v180.iAAFieldKey key = 4997708;
              BOOL v181 = (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v180, __s, v179) | v175 | v249 | v250 | v178) >= 0;
              if ((*(unsigned char *)v253 & 4) != 0)
              {
                v182.iAAFieldKey key = 4672582;
                if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v182, *((unsigned int *)v13 + 246 * v32 + 37)) < 0) {
                  BOOL v181 = 0;
                }
              }
              char v183 = *(unsigned char *)(valueb + 184);
              if (v183)
              {
                v184.iAAFieldKey key = 5523009;
                if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v184, *((int *)v13 + 246 * v32 + 54)) < 0) {
                  BOOL v181 = 0;
                }
                char v183 = *(unsigned char *)(valueb + 184);
              }
              if ((v183 & 2) != 0)
              {
                uint64_t v10 = header;
                v185.iAAFieldKey key = 5391937;
                if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v185, *((unsigned int *)v13 + 246 * v32 + 55)) < 0) {
                  BOOL v181 = 0;
                }
              }
              else
              {
                uint64_t v10 = header;
              }
              v186.iAAFieldKey key = 5521732;
              if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v186, sizea) < 0) {
                BOOL v181 = 0;
              }
              int v189 = (char *)v13 + 984 * v32;
              uint64_t v192 = *((void *)v189 + 4);
              v191 = (AAHeader_impl *)(v189 + 32);
              uint64_t v190 = v192;
              if (!v192 || (v193.iAAFieldKey key = 4408665, (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v193, v190) & 0x80000000) == 0))
              {
                if (v181)
                {
                  AAHeader v254 = v191;
                  size_t v194 = AAHeaderGetEncodedSize(v10);
                  __int16 v195 = AAHeaderGetEncodedData(v10);
                  if (*((void *)ostream + 3))
                  {
                    if (v194)
                    {
                      __int16 v198 = v195;
                      uint64_t v199 = 0;
                      size_t v200 = v194;
                      while (1)
                      {
                        uint64_t v201 = (*((uint64_t (**)(void, const uint8_t *, size_t))ostream + 3))(*(void *)ostream, v198, v200);
                        if (v201 < 1) {
                          break;
                        }
                        v198 += v201;
                        v199 += v201;
                        v200 -= v201;
                        if (!v200) {
                          goto LABEL_276;
                        }
                      }
                      uint64_t v199 = v201;
                    }
                    else
                    {
                      uint64_t v199 = 0;
                    }
                  }
                  else
                  {
                    uint64_t v199 = -1;
                  }
LABEL_276:
                  if (v199 != v194)
                  {
                    __int16 v242 = "write header";
                    __int16 v243 = 1398;
                    goto LABEL_374;
                  }
                  uint64_t v202 = *(void *)valueb;
                  if (*(void *)valueb)
                  {
                    off_t v203 = sizea;
                    if (!*((void *)ostream + 3)) {
                      goto LABEL_366;
                    }
                    off_t v204 = 0;
                    if (!sizea)
                    {
LABEL_287:
                      if (v204 < 0 || v204 != v203)
                      {
LABEL_366:
                        __int16 v242 = "write patch payload";
                        __int16 v243 = 1404;
                      }
                      else
                      {
                        uint64_t v207 = *(void *)v254;
                        uint64_t v29 = ostream;
                        if (!*(void *)v254) {
                          goto LABEL_297;
                        }
                        if (*((void *)ostream + 3))
                        {
                          uint64_t v208 = 0;
                          uint64_t v209 = *((void *)v13 + 123 * v32 + 6);
                          while (1)
                          {
                            uint64_t v210 = (*((uint64_t (**)(void, uint64_t, uint64_t))ostream + 3))(*(void *)ostream, v209, v207);
                            if (v210 < 1) {
                              break;
                            }
                            v209 += v210;
                            v208 += v210;
                            v207 -= v210;
                            if (!v207) {
                              goto LABEL_296;
                            }
                          }
                          uint64_t v208 = v210;
LABEL_296:
                          uint64_t v29 = ostream;
                          if ((v208 & 0x8000000000000000) == 0)
                          {
LABEL_297:
                            AAByteStreamClose((AAByteStream)v24);
                            uint64_t v19 = v274;
                            uint64_t v10 = header;
                            uint64_t v13 = v272;
                            uint64_t v16 = v273;
                            unsigned int v30 = v264;
                            int v26 = buf;
                            goto LABEL_243;
                          }
                        }
                        __int16 v242 = "write YEC";
                        __int16 v243 = 1409;
                      }
LABEL_374:
                      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v243, 27, 0, v242, v196, v197, v248);
                      uint64_t v217 = 0;
                      v218 = 0;
                      uint64_t v216 = 0;
                      goto LABEL_353;
                    }
                    off_t v205 = sizea;
                    while (1)
                    {
                      off_t v206 = (*((uint64_t (**)(void, uint64_t, off_t))ostream + 3))(*(void *)ostream, v202, v205);
                      if (v206 < 1) {
                        break;
                      }
                      v202 += v206;
                      v204 += v206;
                      v205 -= v206;
                      if (!v205) {
                        goto LABEL_287;
                      }
                    }
                  }
                  else
                  {
                    off_t v203 = sizea;
                    if (!v24) {
                      goto LABEL_366;
                    }
                    off_t v206 = AAByteStreamProcess((AAByteStream)v24, ostream);
                  }
                  off_t v204 = v206;
                  goto LABEL_287;
                }
              }
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1392, 27, 0, "setup header", v187, v188, v248);
              uint64_t v217 = 0;
              v218 = 0;
              uint64_t v216 = 0;
LABEL_337:
              uint64_t v224 = 0xFFFFFFFFLL;
              goto LABEL_354;
            }
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1375, 27, 0, "open: %s", v171, v172, (char)__str);
          }
        }
        goto LABEL_360;
      case 3u:
        if (*((_DWORD *)v13 + 246 * v32 + 2) == 1)
        {
          uint64_t v13 = v272;
          uint64_t v16 = v273;
          if (v262)
          {
            uint64_t v64 = (uint64_t)v263[4];
            if (!v64) {
              uint64_t v64 = (uint64_t)v263[3];
            }
            if ((encodeEntry(v64, v35, v34) & 0x80000000) != 0)
            {
              uint64_t v244 = "encode entry";
              __int16 v245 = 1350;
              goto LABEL_379;
            }
            ++v271;
            unsigned int v27 = 67;
LABEL_104:
            int v26 = 1;
          }
          else
          {
            unsigned int v27 = 67;
            if ((encodeYOPEntry(v29, 0x43u, v34, __s, 0) & 0x80000000) != 0)
            {
              uint64_t v244 = "encode entry";
              __int16 v245 = 1355;
              goto LABEL_379;
            }
LABEL_149:
            int v26 = 0;
          }
          goto LABEL_243;
        }
        unsigned int v27 = 67;
LABEL_106:
        int v26 = v261;
        goto LABEL_156;
      case 4u:
        unsigned int v27 = 69;
        if (*((_DWORD *)v13 + 246 * v32 + 2) != 3 || v35 == 70) {
          goto LABEL_106;
        }
        goto LABEL_77;
      case 5u:
        unsigned int v27 = 69;
        if (*((_DWORD *)v13 + 246 * v32 + 2) != 3 || v35 != 70) {
          goto LABEL_106;
        }
LABEL_77:
        uint64_t size = *((void *)v13 + 123 * v32 + 9 * v276 + 35);
        uint64_t v67 = v33[18 * v276 + 66];
        int v68 = AAHeaderClear(v10);
        v69.iAAFieldKey key = 5265748;
        int v70 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v69, v67);
        size_t v71 = strlen(v34);
        v72.iAAFieldKey key = 5521744;
        BOOL v75 = (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v72, v34, v71) | v70 | v68) >= 0;
        if (!v262)
        {
          size_t v76 = strlen(__s);
          v77.iAAFieldKey key = 4997708;
          if (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v77, __s, v76) < 0) {
            BOOL v75 = 0;
          }
        }
        uint64_t v19 = v274;
        int value = v67;
        if (v67 == 70)
        {
          uint64_t v93 = (char *)v13 + 984 * v32;
          if ((v93[136] & 4) != 0)
          {
            v116.iAAFieldKey key = 4672582;
            if (AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v116, *((unsigned int *)v13 + 246 * v32 + 37)) < 0) {
              BOOL v75 = 0;
            }
          }
          char v119 = v93[208];
          uint64_t v118 = v93 + 208;
          char v117 = v119;
          if (v119)
          {
            v120.iAAFieldKey key = 5523009;
            if (AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v120, *((int *)v13 + 246 * v32 + 54)) < 0) {
              BOOL v75 = 0;
            }
            char v117 = *v118;
          }
          uint64_t v19 = v274;
          if ((v117 & 2) != 0)
          {
            v121.iAAFieldKey key = 5391937;
            if (AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v121, *((unsigned int *)v13 + 246 * v32 + 55)) < 0) {
              BOOL v75 = 0;
            }
          }
          v122.iAAFieldKey key = 5521732;
          if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v122, size) < 0) {
            BOOL v75 = 0;
          }
          uint64_t v123 = *((void *)v13 + 123 * v32 + 4);
          if (v123)
          {
            v124.iAAFieldKey key = 4408665;
            if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v124, v123) < 0)
            {
LABEL_338:
              int v233 = "setup header";
              __int16 v234 = 1442;
LABEL_359:
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v234, 27, 0, v233, v73, v74, v248);
LABEL_360:
              uint64_t v217 = 0;
              v218 = 0;
              uint64_t v216 = 0;
              uint64_t v24 = 0;
              uint64_t v224 = 0xFFFFFFFFLL;
              uint64_t v13 = v272;
              uint64_t v16 = v273;
              goto LABEL_361;
            }
          }
        }
        else if (v67 == 76)
        {
          if (*((void *)v13 + 123 * v32 + 7))
          {
            size_t v78 = strlen(*((const char **)v13 + 123 * v32 + 9));
            v79.iAAFieldKey key = 4935244;
            uint64_t v19 = v274;
            if (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v79, *((const char **)v13 + 123 * v32 + 9), v78) < 0) {
              goto LABEL_338;
            }
          }
        }
        if (!v75) {
          goto LABEL_338;
        }
        size_t v125 = AAHeaderGetEncodedSize(v10);
        uint64_t v126 = AAHeaderGetEncodedData(v10);
        uint64_t v127 = ostream;
        if (v262)
        {
          uint64_t v127 = v263[4];
          if (!v127) {
            uint64_t v127 = v263[3];
          }
        }
        if (v127[3])
        {
          uint64_t v128 = 0;
          if (v125)
          {
            size_t v129 = v125;
            while (1)
            {
              uint64_t v130 = ((uint64_t (*)(void, const uint8_t *, size_t))v127[3])(*v127, v126, v129);
              if (v130 < 1) {
                break;
              }
              v126 += v130;
              v128 += v130;
              v129 -= v130;
              if (!v129) {
                goto LABEL_185;
              }
            }
            uint64_t v128 = v130;
          }
        }
        else
        {
          uint64_t v128 = -1;
        }
LABEL_185:
        if (v128 != v125)
        {
          v235 = "write header";
          __int16 v236 = 1448;
          goto LABEL_352;
        }
        int v131 = value;
        uint64_t v19 = v274;
        uint64_t v10 = header;
        if (value != 70 || !size) {
          goto LABEL_215;
        }
        *(void *)&offset.st_dev = 0;
        uint64_t v279 = 0;
        EntryHeader = stateLoadEntryHeader(a1, v276, v28);
        timespec v135 = EntryHeader;
        if (!EntryHeader)
        {
          uint64_t v237 = "loading entry header";
          __int16 v238 = 767;
LABEL_350:
          int v241 = 0;
LABEL_357:
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateStreamEntryBlob", v238, 27, v241, v237, v133, v134, v248);
          bufb = 0;
LABEL_358:
          AAHeaderDestroy(v135);
          free(bufb);
          int v233 = "write DAT";
          __int16 v234 = 1453;
          goto LABEL_359;
        }
        v136.iAAFieldKey key = 5521732;
        uint32_t KeyIndex = AAHeaderGetKeyIndex(EntryHeader, v136);
        if ((KeyIndex & 0x80000000) != 0
          || ((unsigned int FieldBlob = AAHeaderGetFieldBlob(v135, KeyIndex, &v279, (uint64_t *)&offset), FieldBlob <= 1)
            ? (int v139 = 1)
            : (int v139 = FieldBlob),
              v139 <= 0))
        {
          uint64_t v237 = "blob not found";
          __int16 v238 = 768;
          goto LABEL_350;
        }
        bufb = (char *)malloc(0x40000uLL);
        if (!bufb)
        {
          int v241 = *__error();
          uint64_t v237 = "malloc";
          __int16 v238 = 771;
          goto LABEL_357;
        }
        uint64_t v140 = *(void *)(*(void *)(a1 + 80) + 984 * v28 + 72 * v276 + 288);
        unint64_t v252 = v135;
        size_t v141 = AAHeaderGetEncodedSize(v135);
        uint64_t v142 = v279;
        if (v279)
        {
          off_t v143 = v141 + v140 + *(void *)&offset.st_dev;
          while (1)
          {
            if (v142 >= 0x40000) {
              size_t v144 = 0x40000;
            }
            else {
              size_t v144 = v142;
            }
            ssize_t v145 = AAByteStreamPRead(*(AAByteStream *)(*(void *)(a1 + 8) + 8 * v276 + 24), bufb, v144, v143);
            uint64_t v19 = v274;
            if (v145 < 0)
            {
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateStreamEntryBlob", 779, 27, 0, "read blob from archive", v146, v147, v248);
              goto LABEL_333;
            }
            ssize_t v148 = v145;
            if (!v145) {
              goto LABEL_212;
            }
            if (v127[3])
            {
              uint64_t v149 = 0;
              uint64_t v150 = bufb;
              ssize_t v151 = v145;
              while (1)
              {
                uint64_t v152 = ((uint64_t (*)(void, char *, ssize_t))v127[3])(*v127, v150, v151);
                if (v152 < 1) {
                  break;
                }
                v150 += v152;
                v149 += v152;
                v151 -= v152;
                if (!v151) {
                  goto LABEL_209;
                }
              }
              uint64_t v149 = v152;
            }
            else
            {
              uint64_t v149 = -1;
            }
LABEL_209:
            if (v149 != v148) {
              break;
            }
            v143 += v148;
            uint64_t v142 = v279 - v148;
            BOOL v20 = v279 == v148;
            v279 -= v148;
            uint64_t v10 = header;
            if (v20) {
              goto LABEL_212;
            }
          }
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateStreamEntryBlob", 781, 27, 0, "write blob to stream", v146, v147, v248);
          uint64_t v19 = v274;
          uint64_t v10 = header;
LABEL_333:
          timespec v135 = v252;
          goto LABEL_358;
        }
LABEL_212:
        AAHeaderDestroy(v252);
        free(bufb);
        uint64_t v153 = size;
        if (!v262) {
          uint64_t v153 = 0;
        }
        v258 += v153;
        int v131 = value;
LABEL_215:
        unsigned int v30 = v264;
        if (v131 != 70) {
          goto LABEL_224;
        }
        uint64_t v154 = *((void *)v13 + 123 * v32 + 4);
        if (!v154) {
          goto LABEL_224;
        }
        if (v127[3])
        {
          uint64_t v155 = 0;
          uint64_t v156 = *((void *)v13 + 123 * v32 + 6);
          while (1)
          {
            uint64_t v157 = ((uint64_t (*)(void, uint64_t, uint64_t))v127[3])(*v127, v156, v154);
            if (v157 < 1) {
              break;
            }
            v156 += v157;
            v155 += v157;
            v154 -= v157;
            if (!v154) {
              goto LABEL_223;
            }
          }
          uint64_t v155 = v157;
LABEL_223:
          if ((v155 & 0x8000000000000000) == 0)
          {
LABEL_224:
            uint64_t v158 = v271 + v256;
            unsigned int v27 = 69;
            v271 += v256;
            if (!v262)
            {
              int v26 = v261;
              uint64_t v29 = ostream;
LABEL_236:
              uint64_t v19 = v274;
              uint64_t v10 = header;
              uint64_t v13 = v272;
              uint64_t v16 = v273;
              goto LABEL_243;
            }
            uint64_t v29 = ostream;
            if (!v158)
            {
              int v26 = v261;
              goto LABEL_236;
            }
            uint64_t v19 = v274;
            uint64_t v10 = header;
            uint64_t v13 = v272;
            uint64_t v16 = v273;
            if (v258 <= *(void *)(*(void *)(a1 + 8) + 128)) {
              goto LABEL_233;
            }
            uint64_t v159 = v263;
            AAByteStreamClose(v263[4]);
            v263[4] = 0;
            if ((encodeYOPEntry(ostream, 0x45u, 0, __s, v263[3]) & 0x80000000) != 0)
            {
              v231 = "encode entry";
              __int16 v232 = 1469;
              goto LABEL_329;
            }
            if ((AAByteStreamTruncate(v263[3]) & 0x80000000) != 0)
            {
              uint64_t v246 = "AAByteStreamTruncate";
              __int16 v247 = 195;
              goto LABEL_378;
            }
            if (AAByteStreamSeek(v263[3], 0, 0) < 0)
            {
              uint64_t v246 = "AAByteStreamSeek";
              __int16 v247 = 196;
              goto LABEL_378;
            }
            AAByteStreamClose(v263[4]);
            v263[4] = 0;
            if (!*(_DWORD *)v263)
            {
              unint64_t v258 = 0;
              uint64_t v271 = 0;
              int v26 = v261;
              uint64_t v29 = ostream;
LABEL_242:
              unsigned int v30 = v264;
              goto LABEL_243;
            }
            AAByteStream v164 = AACompressionOutputStreamOpen(v263[3], *(_DWORD *)v263, (size_t)v263[1], 0, *((_DWORD *)v263 + 4));
            v263[4] = v164;
            unsigned int v30 = v264;
            if (!v164)
            {
              uint64_t v246 = "AACompressionOutputStreamOpen";
              __int16 v247 = 201;
LABEL_378:
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"subArchiveReset", v247, 27, 0, v246, v162, v163, v248);
              uint64_t v244 = "truncating sub asset";
              __int16 v245 = 1472;
LABEL_379:
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v245, 27, 0, v244, v65, v66, v248);
              uint64_t v217 = 0;
              v218 = 0;
              uint64_t v216 = 0;
              uint64_t v24 = 0;
              uint64_t v224 = 0xFFFFFFFFLL;
              goto LABEL_361;
            }
            unint64_t v258 = 0;
            uint64_t v271 = 0;
            int v26 = v261;
            uint64_t v29 = ostream;
LABEL_243:
            ++v28;
            unint64_t v25 = *(void *)(a1 + 72);
            BOOL v20 = v28 == v25;
            if (v28 >= v25)
            {
              uint64_t v24 = v263;
              if (!v26) {
                goto LABEL_301;
              }
              if (!v271) {
                goto LABEL_301;
              }
              AAByteStreamClose(v263[4]);
              v263[4] = 0;
              if ((encodeYOPEntry(ostream, v27, 0, __s, v263[3]) & 0x80000000) == 0) {
                goto LABEL_301;
              }
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1488, 27, 0, "encode entry", v211, v212, v248);
              uint64_t v217 = 0;
              uint64_t v159 = v263;
              goto LABEL_330;
            }
            continue;
          }
        }
        v235 = "write YEC";
        __int16 v236 = 1460;
LABEL_352:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v236, 27, 0, v235, v45, v46, v248);
        uint64_t v217 = 0;
        v218 = 0;
        uint64_t v216 = 0;
        uint64_t v24 = 0;
LABEL_353:
        uint64_t v224 = 0xFFFFFFFFLL;
        uint64_t v10 = header;
LABEL_354:
        uint64_t v13 = v272;
        uint64_t v16 = v273;
LABEL_355:
        uint64_t v19 = v274;
LABEL_361:
        uint64_t v159 = v263;
LABEL_319:
        AAArchiveStreamClose(v216);
        AAArchiveStreamClose(v218);
        AAArchiveStreamClose(v217);
        AAByteStreamClose(ostream);
        if (v159)
        {
          AAByteStreamClose(v159[4]);
          AAByteStreamClose(v159[3]);
          free(v159);
        }
        AAByteStreamClose((AAByteStream)v24);
        AAHeaderDestroy(v10);
        AAFieldKeySetDestroy(v13);
        AAFieldKeySetDestroy(v16);
        free(v19);
        return v224;
      case 6u:
        unsigned int v27 = 79;
        int v26 = 1;
        if (v35 && v35 != 68) {
          goto LABEL_89;
        }
        goto LABEL_156;
      case 7u:
        int v26 = 1;
        if (v35 != 68)
        {
          unsigned int v27 = 79;
LABEL_156:
          uint64_t v13 = v272;
LABEL_157:
          uint64_t v16 = v273;
          goto LABEL_243;
        }
LABEL_89:
        int bufa = v26;
        uint64_t valuea = v33[18 * v276 + 66];
        int v80 = AAHeaderClear(v10);
        v81.iAAFieldKey key = 5265748;
        int v82 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v81, valuea);
        size_t v83 = strlen(v34);
        v84.iAAFieldKey key = 5521744;
        int v85 = AAHeaderSetFieldString(v10, 0xFFFFFFFF, v84, v34, v83);
        BOOL v88 = (int)(aaHeaderAppendEntryAttributes(v10, (char *)v13 + 984 * v32 + 136, (char *)v13 + 984 * v32 + 208) | v82 | v80 | v85) >= 0;
        if (valuea == 68)
        {
          uint64_t v10 = header;
        }
        else
        {
          if (valuea != 70)
          {
            uint64_t v10 = header;
            goto LABEL_118;
          }
          uint64_t v89 = *((void *)v13 + 123 * v32 + 16);
          uint64_t v10 = header;
          if (v89 != -1)
          {
            v90.iAAFieldKey key = 4410440;
            if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v90, v89) < 0) {
              BOOL v88 = 0;
            }
          }
          if ((v255 & 0x10) == 0)
          {
            v91.iAAFieldKey key = 3295315;
            if (AAHeaderSetFieldHash(header, 0xFFFFFFFF, v91, 3u, (const uint8_t *)v13 + 984 * v32 + 72 * v276 + 304) < 0) {
              BOOL v88 = 0;
            }
          }
        }
        uint64_t v94 = *((void *)v13 + 123 * v32 + 10);
        if (v94)
        {
          v95.iAAFieldKey key = 5521752;
          if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v95, v94) < 0) {
            BOOL v88 = 0;
          }
        }
        uint64_t v96 = *((void *)v13 + 123 * v32 + 13);
        if (v96)
        {
          v97.iAAFieldKey key = 4997953;
          if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v97, v96) < 0)
          {
LABEL_336:
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1312, 27, 0, "setup header", v86, v87, v248);
            uint64_t v217 = 0;
            v218 = 0;
            uint64_t v216 = 0;
            uint64_t v24 = 0;
            goto LABEL_337;
          }
        }
LABEL_118:
        if (!v88) {
          goto LABEL_336;
        }
        uint64_t v98 = v29;
        size_t v99 = AAHeaderGetEncodedSize(v10);
        size_t v100 = AAHeaderGetEncodedData(v10);
        if (bufa)
        {
          uint64_t v98 = v263[4];
          if (!v98) {
            uint64_t v98 = v263[3];
          }
        }
        if (*((void *)v98 + 3))
        {
          uint64_t v101 = 0;
          if (v99)
          {
            size_t v102 = v99;
            while (1)
            {
              uint64_t v103 = (*((uint64_t (**)(void, const uint8_t *, size_t))v98 + 3))(*(void *)v98, v100, v102);
              if (v103 < 1) {
                break;
              }
              v100 += v103;
              v101 += v103;
              v102 -= v103;
              if (!v102) {
                goto LABEL_130;
              }
            }
            uint64_t v101 = v103;
          }
        }
        else
        {
          uint64_t v101 = -1;
        }
LABEL_130:
        if (v101 != v99)
        {
          v235 = "write header";
          __int16 v236 = 1318;
          goto LABEL_352;
        }
        uint64_t v29 = ostream;
        int v26 = bufa;
        if ((valuea | 2) == 0x46)
        {
          uint64_t v104 = *((void *)v13 + 123 * v32 + 10);
          if (v104)
          {
            if (!*((void *)v98 + 3)) {
              goto LABEL_344;
            }
            uint64_t v105 = 0;
            uint64_t v106 = *((void *)v13 + 123 * v32 + 12);
            while (1)
            {
              uint64_t v107 = (*((uint64_t (**)(void, uint64_t, uint64_t))v98 + 3))(*(void *)v98, v106, v104);
              if (v107 < 1) {
                break;
              }
              v106 += v107;
              v105 += v107;
              v104 -= v107;
              if (!v104) {
                goto LABEL_139;
              }
            }
            uint64_t v105 = v107;
LABEL_139:
            uint64_t v29 = ostream;
            int v26 = bufa;
            if (v105 < 0)
            {
LABEL_344:
              v235 = "write XAT";
              __int16 v236 = 1322;
              goto LABEL_352;
            }
          }
          uint64_t v108 = *((void *)v13 + 123 * v32 + 13);
          if (v108)
          {
            if (!*((void *)v98 + 3)) {
              goto LABEL_345;
            }
            uint64_t v109 = 0;
            uint64_t v110 = *((void *)v13 + 123 * v32 + 15);
            while (1)
            {
              uint64_t v111 = (*((uint64_t (**)(void, uint64_t, uint64_t))v98 + 3))(*(void *)v98, v110, v108);
              if (v111 < 1) {
                break;
              }
              v110 += v111;
              v109 += v111;
              v108 -= v111;
              if (!v108) {
                goto LABEL_151;
              }
            }
            uint64_t v109 = v111;
LABEL_151:
            uint64_t v29 = ostream;
            int v26 = bufa;
            if (v109 < 0)
            {
LABEL_345:
              v235 = "write ACL";
              __int16 v236 = 1323;
              goto LABEL_352;
            }
          }
        }
        uint64_t v112 = v271;
        uint64_t v13 = v272;
        if (v26) {
          uint64_t v112 = v271 + 1;
        }
        uint64_t v271 = v112;
        unsigned int v27 = 79;
        uint64_t v19 = v274;
        uint64_t v10 = header;
        uint64_t v16 = v273;
        goto LABEL_242;
      default:
        goto LABEL_157;
    }
  }
}

void stateDestroy_0(uint64_t a1)
{
  if (a1)
  {
    int v3 = *(unsigned __int8 *)(a1 + 92);
    uint64_t v2 = (char *)(a1 + 92);
    if (v3) {
      removeTree(v2);
    }
    uint64_t v4 = *(void **)(a1 + 80);
    if (v4)
    {
      if (*(void *)(a1 + 72))
      {
        unint64_t v5 = 0;
        uint64_t v6 = 120;
        do
        {
          uint64_t v7 = (void **)(*(void *)(a1 + 80) + v6);
          free(*(v7 - 12));
          free(*(v7 - 9));
          memset_s(v7 - 11, 0x18uLL, 0, 0x18uLL);
          free(*(v7 - 3));
          memset_s(v7 - 5, 0x18uLL, 0, 0x18uLL);
          free(*v7);
          memset_s(v7 - 2, 0x18uLL, 0, 0x18uLL);
          free(*(v7 - 6));
          memset_s(v7 - 8, 0x18uLL, 0, 0x18uLL);
          ++v5;
          v6 += 984;
        }
        while (v5 < *(void *)(a1 + 72));
        uint64_t v4 = *(void **)(a1 + 80);
      }
      free(v4);
    }
    StringTableDestroy(*(void ***)(a1 + 32));
    StringTableDestroy(*(void ***)(a1 + 40));
    free((void *)a1);
  }
}

uint64_t stateCollectorStreamClose(void *a1)
{
  return 0;
}

uint64_t stateCollectorStreamWriteHeader(void *a1, AAHeader header)
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  uint64_t v131 = 0;
  uint64_t value = 0;
  uint64_t v129 = 0;
  uint64_t v130 = -1;
  uint64_t v128 = 0;
  AAHashFunction hash_function = 0;
  uint64_t v5 = *(void *)(v4 + 56);
  *((_OWORD *)a1 + 1) = 0u;
  uint64_t v6 = a1 + 2;
  uint64_t v7 = a1[1];
  *((_OWORD *)a1 + 2) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  v9.iAAFieldKey key = 5265748;
  uint32_t KeyIndex = AAHeaderGetKeyIndex(header, v9);
  if ((KeyIndex & 0x80000000) != 0
    || ((FieldUInt = AAHeaderGetFieldUInt(header, KeyIndex, &value), FieldUInt <= 1) ? (int v14 = 1) : (int v14 = FieldUInt),
        v14 <= 0))
  {
    uint64_t v16 = "no TYP";
    __int16 v17 = 245;
LABEL_9:
    int v18 = 0;
LABEL_10:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCollectorStreamWriteHeader", v17, 27, v18, v16, v11, v12, (char)v125);
    return 0xFFFFFFFFLL;
  }
  if (value == 77) {
    return 0;
  }
  v19.iAAFieldKey key = 5521744;
  uint32_t v20 = AAHeaderGetKeyIndex(header, v19);
  if ((v20 & 0x80000000) != 0
    || ((unsigned int FieldString = AAHeaderGetFieldString(header, v20, 0x400uLL, __s, 0), FieldString <= 1)
      ? (int v22 = 1)
      : (int v22 = FieldString),
        v22 <= 0))
  {
    uint64_t v16 = "no PAT";
    __int16 v17 = 247;
    goto LABEL_9;
  }
  v23.iAAFieldKey key = 5784649;
  uint32_t v24 = AAHeaderGetKeyIndex(header, v23);
  if ((v24 & 0x80000000) != 0
    || ((unsigned int v25 = AAHeaderGetFieldUInt(header, v24, &v129), v25 <= 1) ? (v26 = 1) : (v26 = v25), v26 <= 0))
  {
    uint64_t v16 = "no IDX";
    __int16 v17 = 248;
    goto LABEL_9;
  }
  v27.iAAFieldKey key = 5915721;
  uint32_t v28 = AAHeaderGetKeyIndex(header, v27);
  if ((v28 & 0x80000000) != 0
    || ((v29 = AAHeaderGetFieldUInt(header, v28, &v128), v29 <= 1) ? (int v30 = 1) : (int v30 = v29), v30 <= 0))
  {
    uint64_t v16 = "no IDZ";
    __int16 v17 = 249;
    goto LABEL_9;
  }
  uint64_t v31 = v5 - 1;
  uint64_t v32 = value;
  if (value != 70) {
    goto LABEL_51;
  }
  v33.iAAFieldKey key = 3295315;
  uint32_t v34 = AAHeaderGetKeyIndex(header, v33);
  if ((v34 & 0x80000000) != 0
    || ((unsigned int FieldHash = AAHeaderGetFieldHash(header, v34, 0x20uLL, &hash_function, v133), FieldHash <= 1)
      ? (int v36 = 1)
      : (int v36 = FieldHash),
        v36 <= 0))
  {
    size_t v125 = __s;
    uint64_t v16 = "no hash: %s";
    __int16 v17 = 254;
    goto LABEL_9;
  }
  v37.iAAFieldKey key = 5917011;
  uint32_t v38 = AAHeaderGetKeyIndex(header, v37);
  if ((v38 & 0x80000000) != 0
    || ((unsigned int v39 = AAHeaderGetFieldUInt(header, v38, &v131), v39 <= 1) ? (v40 = 1) : (v40 = v39), v40 <= 0))
  {
    size_t v125 = __s;
    uint64_t v16 = "no SIZ: %s";
    __int16 v17 = 255;
    goto LABEL_9;
  }
  v41.iAAFieldKey key = 4410440;
  uint32_t v42 = AAHeaderGetKeyIndex(header, v41);
  if ((v42 & 0x80000000) != 0
    || ((unsigned int v43 = AAHeaderGetFieldUInt(header, v42, &v130), v43 <= 1) ? (v44 = 1) : (v44 = v43), v44 <= 0))
  {
    uint64_t v130 = -1;
  }
  if (v7 != v31) {
    goto LABEL_65;
  }
  size[0] = 0;
  uint64_t offset = 0;
  v45.iAAFieldKey key = 4408665;
  uint32_t v46 = AAHeaderGetKeyIndex(header, v45);
  if ((v46 & 0x80000000) == 0)
  {
    unsigned int FieldBlob = AAHeaderGetFieldBlob(header, v46, size, &offset);
    int v48 = FieldBlob <= 1 ? 1 : FieldBlob;
    if (v48 >= 1) {
      *uint64_t v6 = size[0];
    }
  }
  uint64_t v32 = value;
LABEL_51:
  if ((v32 & 0xFFFFFFFFFFFFFFFDLL) != 0x44 || v7 != v31) {
    goto LABEL_66;
  }
  size[0] = 0;
  uint64_t offset = 0;
  v49.iAAFieldKey key = 5521752;
  uint32_t v50 = AAHeaderGetKeyIndex(header, v49);
  if ((v50 & 0x80000000) == 0)
  {
    unsigned int v51 = AAHeaderGetFieldBlob(header, v50, size, &offset);
    int v52 = v51 <= 1 ? 1 : v51;
    if (v52 >= 1) {
      a1[4] = size[0];
    }
  }
  v53.iAAFieldKey key = 4997953;
  uint32_t v54 = AAHeaderGetKeyIndex(header, v53);
  if ((v54 & 0x80000000) == 0)
  {
    unsigned int v55 = AAHeaderGetFieldBlob(header, v54, size, &offset);
    int v56 = v55 <= 1 ? 1 : v55;
    if (v56 >= 1) {
      a1[6] = size[0];
    }
  }
LABEL_65:
  uint64_t v32 = value;
LABEL_66:
  if (v32 == 76)
  {
    v57.iAAFieldKey key = 4935244;
    uint32_t v58 = AAHeaderGetKeyIndex(header, v57);
    if ((v58 & 0x80000000) != 0
      || ((unsigned int v59 = AAHeaderGetFieldString(header, v58, 0x400uLL, (char *)size, 0), v59 <= 1) ? (v60 = 1) : (v60 = v59),
          v60 <= 0))
    {
      uint64_t v16 = "no LNK";
      __int16 v17 = 283;
      goto LABEL_9;
    }
  }
  unint64_t v61 = *(void *)(v4 + 64);
  if (*(void *)(v4 + 72) >= v61)
  {
    uint64_t v62 = 2 * v61;
    BOOL v63 = v61 == 0;
    uint64_t v64 = 32;
    if (!v63) {
      uint64_t v64 = v62;
    }
    *(void *)(v4 + 64) = v64;
    if ((unint64_t)(984 * v64) >= 0x2000000001)
    {
      *__error() = 12;
LABEL_103:
      *(void *)(v4 + 80) = 0;
      int v18 = *__error();
      uint64_t v16 = "malloc";
      __int16 v17 = 291;
      goto LABEL_10;
    }
    uint64_t v65 = *(void **)(v4 + 80);
    uint64_t v66 = realloc(v65, 984 * v64);
    if (!v66)
    {
      free(v65);
      goto LABEL_103;
    }
    *(void *)(v4 + 80) = v66;
  }
  LODWORD(offset) = -1;
  size_t v67 = strlen(__s);
  if ((StringTableAppend(*(unsigned int **)(v4 + 32), __s, v67, &offset, v68, v69, v70, v71) & 0x80000000) != 0)
  {
    uint64_t v16 = "string table append";
    __int16 v17 = 294;
    goto LABEL_9;
  }
  uint64_t v73 = *(void *)(v4 + 72);
  uint64_t v72 = *(void *)(v4 + 80);
  *(void *)(v4 + 72) = v73 + 1;
  if (v72) {
    memset_s((void *)(v72 + 984 * v73), 0x3D8uLL, 0, 0x3D8uLL);
  }
  *(_DWORD *)(v72 + 984 * v73) = offset;
  uint64_t v74 = v72 + 984 * v73;
  *(void *)(v74 + 128) = -1;
  BOOL v75 = (uint64_t *)(v74 + 128);
  uint64_t v76 = a1[1];
  uint64_t v77 = v72 + 984 * v73 + 72 * v76;
  *(_DWORD *)(v77 + 264) = value;
  *(void *)(v77 + 280) = v131;
  *(void *)(v77 + 288) = v129;
  *(void *)(v77 + 296) = v128;
  if (hash_function)
  {
    long long v78 = v134;
    uint64_t v79 = v72 + 984 * v73 + 72 * v76;
    *(_OWORD *)(v79 + 304) = *(_OWORD *)v133;
    *(_OWORD *)(v79 + 320) = v78;
  }
  if (v7 != v31) {
    return 0;
  }
  unint64_t v80 = *v6;
  if (*v6)
  {
    if ((v80 & 0x8000000000000000) != 0)
    {
LABEL_152:
      uint64_t v16 = "YEC blob";
      __int16 v17 = 314;
      goto LABEL_9;
    }
    AAFieldKey v81 = (void *)(v72 + 984 * v73 + 32);
    uint64_t v82 = v72 + 984 * v73;
    size_t v85 = *(void *)(v82 + 40);
    AAFieldKey v84 = (size_t *)(v82 + 40);
    size_t v83 = v85;
    if (v85 < v80)
    {
      do
      {
        while (!v83)
        {
          size_t v83 = 0x4000;
          if (v80 <= 0x4000)
          {
            uint64_t v87 = (void **)(v72 + 984 * v73 + 48);
            size_t v83 = 0x4000;
            goto LABEL_106;
          }
        }
        size_t v86 = v83 >> 1;
        if ((v83 & (v83 >> 1)) != 0) {
          size_t v86 = v83 & (v83 >> 1);
        }
        v83 += v86;
      }
      while (v83 < v80);
      uint64_t v87 = (void **)(v72 + 984 * v73 + 48);
      if (v83 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_151;
      }
LABEL_106:
      BOOL v88 = *v87;
      size_t v89 = v83;
      AAFieldKey v90 = realloc(*v87, v83);
      if (v90)
      {
        *uint64_t v87 = v90;
        *AAFieldKey v84 = v89;
        goto LABEL_108;
      }
      free(v88);
LABEL_151:
      *uint64_t v87 = 0;
      *AAFieldKey v81 = 0;
      *(void *)(v72 + 984 * v73 + 40) = 0;
      goto LABEL_152;
    }
LABEL_108:
    a1[3] = v81;
  }
  unint64_t v91 = a1[4];
  if (v91)
  {
    if ((v91 & 0x8000000000000000) != 0)
    {
LABEL_155:
      uint64_t v16 = "XAT blob";
      __int16 v17 = 319;
      goto LABEL_9;
    }
    uint64_t v92 = (void *)(v72 + 984 * v73 + 80);
    uint64_t v93 = v72 + 984 * v73;
    size_t v96 = *(void *)(v93 + 88);
    AAFieldKey v95 = (size_t *)(v93 + 88);
    size_t v94 = v96;
    if (v96 < v91)
    {
      do
      {
        while (!v94)
        {
          size_t v94 = 0x4000;
          if (v91 <= 0x4000)
          {
            uint64_t v98 = (void **)(v72 + 984 * v73 + 96);
            size_t v94 = 0x4000;
            goto LABEL_121;
          }
        }
        size_t v97 = v94 >> 1;
        if ((v94 & (v94 >> 1)) != 0) {
          size_t v97 = v94 & (v94 >> 1);
        }
        v94 += v97;
      }
      while (v94 < v91);
      uint64_t v98 = (void **)(v72 + 984 * v73 + 96);
      if (v94 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_154;
      }
LABEL_121:
      size_t v99 = *v98;
      size_t v100 = realloc(*v98, v94);
      if (v100)
      {
        *uint64_t v98 = v100;
        *AAFieldKey v95 = v94;
        goto LABEL_123;
      }
      free(v99);
LABEL_154:
      *uint64_t v98 = 0;
      void *v92 = 0;
      *(void *)(v72 + 984 * v73 + 88) = 0;
      goto LABEL_155;
    }
LABEL_123:
    a1[5] = v92;
  }
  unint64_t v101 = a1[6];
  if (v101)
  {
    if ((v101 & 0x8000000000000000) != 0)
    {
LABEL_159:
      uint64_t v16 = "ACL blob";
      __int16 v17 = 324;
      goto LABEL_9;
    }
    size_t v102 = (void *)(v72 + 984 * v73 + 104);
    uint64_t v103 = v72 + 984 * v73;
    size_t v106 = *(void *)(v103 + 112);
    uint64_t v105 = (size_t *)(v103 + 112);
    size_t v104 = v106;
    if (v106 < v101)
    {
      do
      {
        while (!v104)
        {
          size_t v104 = 0x4000;
          if (v101 <= 0x4000)
          {
            uint64_t v108 = (void **)(v72 + 984 * v73 + 120);
            size_t v104 = 0x4000;
            goto LABEL_136;
          }
        }
        size_t v107 = v104 >> 1;
        if ((v104 & (v104 >> 1)) != 0) {
          size_t v107 = v104 & (v104 >> 1);
        }
        v104 += v107;
      }
      while (v104 < v101);
      uint64_t v108 = (void **)(v72 + 984 * v73 + 120);
      if (v104 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_158;
      }
LABEL_136:
      uint64_t v109 = *v108;
      uint64_t v110 = realloc(*v108, v104);
      if (v110)
      {
        void *v108 = v110;
        *uint64_t v105 = v104;
        goto LABEL_138;
      }
      free(v109);
LABEL_158:
      void *v108 = 0;
      *size_t v102 = 0;
      *(void *)(v72 + 984 * v73 + 112) = 0;
      goto LABEL_159;
    }
LABEL_138:
    a1[7] = v102;
  }
  if (value == 76)
  {
    size_t v111 = strlen((const char *)size) + 1;
    uint64_t v112 = v72 + 984 * v73;
    uint64_t v115 = *(void *)(v112 + 56);
    uint64_t v114 = (uint64_t *)(v112 + 56);
    uint64_t v113 = v115;
    unint64_t v116 = v115 + v111;
    if (__CFADD__(v115, v111) || (v116 & 0x8000000000000000) != 0) {
      goto LABEL_170;
    }
    uint64_t v117 = v72 + 984 * v73;
    size_t v120 = *(void *)(v117 + 64);
    char v119 = (size_t *)(v117 + 64);
    size_t v118 = v120;
    if (v120 < v116)
    {
      do
      {
        while (!v118)
        {
          size_t v118 = 0x4000;
          if (v116 <= 0x4000)
          {
            AAFieldKey v122 = (void **)(v72 + 984 * v73 + 72);
            size_t v118 = 0x4000;
            goto LABEL_162;
          }
        }
        size_t v121 = v118 >> 1;
        if ((v118 & (v118 >> 1)) != 0) {
          size_t v121 = v118 & (v118 >> 1);
        }
        v118 += v121;
      }
      while (v118 < v116);
      AAFieldKey v122 = (void **)(v72 + 984 * v73 + 72);
      if (v118 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_169;
      }
LABEL_162:
      AAFieldKey v124 = *v122;
      uint64_t v123 = (char *)realloc(*v122, v118);
      if (v123)
      {
        *AAFieldKey v122 = v123;
        *char v119 = v118;
        uint64_t v113 = *v114;
        goto LABEL_164;
      }
      free(v124);
LABEL_169:
      *AAFieldKey v122 = 0;
      uint64_t *v114 = 0;
      v114[1] = 0;
      goto LABEL_170;
    }
    uint64_t v123 = *(char **)(v72 + 984 * v73 + 72);
LABEL_164:
    memcpy(&v123[v113], size, v111);
    *v114 += v111;
    if ((v111 & 0x8000000000000000) != 0)
    {
LABEL_170:
      uint64_t v16 = "LNK blob";
      __int16 v17 = 330;
      goto LABEL_9;
    }
  }
  if ((aaEntryAttributesInitWithHeader((char *)(v72 + 984 * v73 + 136), (char *)(v72 + 984 * v73 + 208), 0, header) & 0x80000000) != 0)
  {
    uint64_t v16 = "attributes from header";
    __int16 v17 = 332;
    goto LABEL_9;
  }
  uint64_t result = 0;
  *BOOL v75 = v130;
  return result;
}

uint64_t stateCollectorStreamWriteBlob(void *a1, int a2, void *__src, rsize_t __smax, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (void *)a1[3];
  uint64_t v12 = *(void *)&a2 & 0xFFFFFFLL;
  if (v11) {
    BOOL v13 = v12 == 4408665;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13) {
    goto LABEL_5;
  }
  if (a1[2] < __smax)
  {
    int v18 = "invalid blob size";
    __int16 v19 = 344;
    goto LABEL_86;
  }
  unint64_t v20 = *v11 + __smax;
  if (__CFADD__(*v11, __smax) || (v20 & 0x8000000000000000) != 0) {
    goto LABEL_69;
  }
  size_t v21 = v11[1];
  if (v21 < v20)
  {
    do
    {
      while (!v21)
      {
        size_t v21 = 0x4000;
        if (v20 <= 0x4000)
        {
          size_t v21 = 0x4000;
          goto LABEL_49;
        }
      }
      size_t v22 = v21 >> 1;
      if ((v21 & (v21 >> 1)) != 0) {
        size_t v22 = v21 & (v21 >> 1);
      }
      v21 += v22;
    }
    while (v21 < v20);
    if (v21 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_68;
    }
LABEL_49:
    unsigned int v29 = (void *)v11[2];
    int v30 = realloc(v29, v21);
    if (v30)
    {
      v11[1] = v21;
      v11[2] = v30;
      goto LABEL_51;
    }
    free(v29);
LABEL_68:
    v11[1] = 0;
    v11[2] = 0;
    *uint64_t v11 = 0;
    goto LABEL_69;
  }
LABEL_51:
  uint64_t v31 = v11[2];
  if (__src)
  {
    memcpy((void *)(v31 + *v11), __src, __smax);
  }
  else if (v31)
  {
    memset_s((void *)(v31 + *v11), __smax, 0, __smax);
  }
  *v11 += __smax;
  if ((__smax & 0x8000000000000000) != 0)
  {
LABEL_69:
    int v18 = "blob append";
    __int16 v19 = 345;
    goto LABEL_86;
  }
  a1[2] -= __smax;
LABEL_5:
  int v14 = (void *)a1[5];
  if (v14) {
    BOOL v15 = v12 == 5521752;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    if (a1[4] >= __smax)
    {
      unint64_t v23 = *v14 + __smax;
      if (!__CFADD__(*v14, __smax) && (v23 & 0x8000000000000000) == 0)
      {
        size_t v24 = v14[1];
        if (v24 >= v23)
        {
LABEL_61:
          uint64_t v34 = v14[2];
          if (__src)
          {
            memcpy((void *)(v34 + *v14), __src, __smax);
          }
          else if (v34)
          {
            memset_s((void *)(v34 + *v14), __smax, 0, __smax);
          }
          *v14 += __smax;
          if ((__smax & 0x8000000000000000) == 0)
          {
            a1[4] -= __smax;
            goto LABEL_9;
          }
        }
        else
        {
          do
          {
            while (!v24)
            {
              size_t v24 = 0x4000;
              if (v23 <= 0x4000)
              {
                size_t v24 = 0x4000;
                goto LABEL_59;
              }
            }
            size_t v25 = v24 >> 1;
            if ((v24 & (v24 >> 1)) != 0) {
              size_t v25 = v24 & (v24 >> 1);
            }
            v24 += v25;
          }
          while (v24 < v23);
          if (v24 >= 0x2000000001)
          {
            *__error() = 12;
            goto LABEL_81;
          }
LABEL_59:
          uint64_t v32 = (void *)v14[2];
          AAFieldKey v33 = realloc(v32, v24);
          if (v33)
          {
            v14[1] = v24;
            v14[2] = v33;
            goto LABEL_61;
          }
          free(v32);
LABEL_81:
          v14[1] = 0;
          v14[2] = 0;
          *int v14 = 0;
        }
      }
      int v18 = "blob append";
      __int16 v19 = 351;
    }
    else
    {
      int v18 = "invalid blob size";
      __int16 v19 = 350;
    }
LABEL_86:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCollectorStreamWriteBlob", v19, 27, 0, v18, a7, a8, v38);
    return 0xFFFFFFFFLL;
  }
LABEL_9:
  uint64_t result = 0;
  __int16 v17 = (void *)a1[7];
  if (v17 && v12 == 4997953)
  {
    if (a1[6] >= __smax)
    {
      unint64_t v26 = *v17 + __smax;
      if (!__CFADD__(*v17, __smax) && (v26 & 0x8000000000000000) == 0)
      {
        size_t v27 = v17[1];
        if (v27 >= v26)
        {
LABEL_74:
          uint64_t v37 = v17[2];
          if (__src)
          {
            memcpy((void *)(v37 + *v17), __src, __smax);
          }
          else if (v37)
          {
            memset_s((void *)(v37 + *v17), __smax, 0, __smax);
          }
          *v17 += __smax;
          if ((__smax & 0x8000000000000000) == 0)
          {
            uint64_t result = 0;
            a1[6] -= __smax;
            return result;
          }
        }
        else
        {
          do
          {
            while (!v27)
            {
              size_t v27 = 0x4000;
              if (v26 <= 0x4000)
              {
                size_t v27 = 0x4000;
                goto LABEL_72;
              }
            }
            size_t v28 = v27 >> 1;
            if ((v27 & (v27 >> 1)) != 0) {
              size_t v28 = v27 & (v27 >> 1);
            }
            v27 += v28;
          }
          while (v27 < v26);
          if (v27 >= 0x2000000001)
          {
            *__error() = 12;
            goto LABEL_84;
          }
LABEL_72:
          uint64_t v35 = (void *)v17[2];
          int v36 = realloc(v35, v27);
          if (v36)
          {
            v17[1] = v27;
            v17[2] = v36;
            goto LABEL_74;
          }
          free(v35);
LABEL_84:
          v17[1] = 0;
          v17[2] = 0;
          *__int16 v17 = 0;
        }
      }
      int v18 = "blob append";
      __int16 v19 = 357;
    }
    else
    {
      int v18 = "invalid blob size";
      __int16 v19 = 356;
    }
    goto LABEL_86;
  }
  return result;
}

uint64_t entryVectorCmp(_DWORD *a1, _DWORD *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 < *a1;
  }
}

uint64_t entryIndexCmpHLC(uint64_t a1, void *a2, void *a3)
{
  unint64_t v3 = *(void *)(a1 + 984 * *a2 + 128);
  unint64_t v4 = *(void *)(a1 + 984 * *a3 + 128);
  if (v3 < v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v4 < v3;
  }
}

uint64_t computePatchesWorkerProc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (uint64_t *)MEMORY[0x270FA5388](a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v107 = *MEMORY[0x263EF8340];
  uint64_t v9 = *v8;
  bzero(v106, 0x400uLL);
  memset(v105, 0, sizeof(v105));
  memset(v104, 0, sizeof(v104));
  unint64_t v101 = 0;
  st_stat size = 0;
  uint64_t v100 = 0;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  *(_OWORD *)size_t v94 = 0u;
  *(_OWORD *)AAFieldKey v95 = 0u;
  unint64_t v15 = v8[1];
  if (v15 >= *(void *)(v9 + 72))
  {
    uint32_t v50 = "invalid entry";
    __int16 v51 = 509;
    goto LABEL_53;
  }
  uint64_t v16 = *(void *)(v9 + 80);
  uint64_t v89 = v16;
  char __s = (char *)(*(void *)(*(void *)(v9 + 32) + 32)
               + *(void *)(*(void *)(*(void *)(v9 + 32) + 8) + 16 * *(unsigned int *)(v16 + 984 * v15)));
  uint64_t v88 = *(void *)(v9 + 56);
  if (v88)
  {
    unint64_t v17 = 0;
    size_t v86 = v8;
    uint64_t v87 = v16 + 984 * v15;
    uint64_t v85 = v8[1];
    while (1)
    {
      uint64_t v18 = v8[1];
      *(void *)&offset[0] = 0;
      *(void *)&size.st_dev = 0;
      EntryHeader = stateLoadEntryHeader(v9, v17, v18);
      size_t v22 = EntryHeader;
      if (!EntryHeader)
      {
        int v52 = "loading entry header";
        __int16 v53 = 726;
        goto LABEL_51;
      }
      v23.iAAFieldKey key = 5521732;
      uint32_t KeyIndex = AAHeaderGetKeyIndex(EntryHeader, v23);
      if ((KeyIndex & 0x80000000) != 0
        || ((unsigned int FieldBlob = AAHeaderGetFieldBlob(v22, KeyIndex, (uint64_t *)&size, (uint64_t *)offset), FieldBlob <= 1)
          ? (int v26 = 1)
          : (int v26 = FieldBlob),
            v26 <= 0))
      {
        int v52 = "blob not found";
        __int16 v53 = 727;
        goto LABEL_51;
      }
      if (*(void *)&size.st_dev >= 0x2000000001uLL) {
        break;
      }
      size_t v27 = (char *)malloc(*(size_t *)&size.st_dev);
      if (!v27)
      {
        unsigned int v59 = __error();
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateLoadEntryBlob", 730, 27, *v59, "malloc", v60, v61, v84);
        goto LABEL_52;
      }
      uint64_t v28 = *(void *)(*(void *)(v9 + 80) + 984 * v18 + 72 * v17 + 288);
      header = v22;
      size_t EncodedSize = AAHeaderGetEncodedSize(v22);
      uint64_t v32 = *(void *)&size.st_dev;
      if (*(void *)&size.st_dev)
      {
        unint64_t v33 = 0;
        uint64_t v92 = EncodedSize + *(void *)&offset[0] + v28;
        while (1)
        {
          unint64_t v34 = v32 - v33;
          uint64_t v35 = v34 >= 0x7FFFFFFF ? 0x7FFFFFFFLL : v34;
          int v36 = *(void **)(*(void *)(v9 + 8) + 8 * v17 + 24);
          if (!v36[4]) {
            break;
          }
          uint64_t v37 = 0;
          if (v35)
          {
            char v38 = &v27[v33];
            uint64_t v39 = v92 + v33;
            uint64_t v40 = v35;
            while (1)
            {
              uint64_t v41 = ((uint64_t (*)(void, char *, uint64_t, uint64_t))v36[4])(*v36, v38, v40, v39);
              if (v41 < 0) {
                break;
              }
              if (v41)
              {
                v38 += v41;
                v37 += v41;
                v39 += v41;
                v40 -= v41;
                if (v40) {
                  continue;
                }
              }
              goto LABEL_25;
            }
            uint64_t v37 = v41;
          }
LABEL_25:
          if (v37 != v35) {
            break;
          }
          v33 += v35;
          uint64_t v32 = *(void *)&size.st_dev;
          if (v33 >= *(void *)&size.st_dev) {
            goto LABEL_27;
          }
        }
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateLoadEntryBlob", 740, 27, 0, "loading entry blob", v30, v31, v84);
        size_t v22 = header;
        goto LABEL_52;
      }
LABEL_27:
      AAHeaderDestroy(header);
      *((void *)v104 + v17) = v27;
      uint64_t v42 = *(void *)&size.st_dev;
      *((void *)v105 + v17) = *(void *)&size.st_dev;
      if (v42 != *(void *)(v87 + 72 * v17 + 280))
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 516, 27, 0, "size mismatch: %s", v13, v14, (char)__s);
        goto LABEL_54;
      }
      ++v17;
      unint64_t v15 = v85;
      uint64_t v8 = v86;
      uint64_t v16 = v89;
      if (v17 >= *(void *)(v9 + 56)) {
        goto LABEL_29;
      }
    }
    int v52 = "blob too large";
    __int16 v53 = 728;
LABEL_51:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateLoadEntryBlob", v53, 27, 0, v52, v20, v21, v84);
    size_t v27 = 0;
LABEL_52:
    AAHeaderDestroy(v22);
    free(v27);
    *((void *)v104 + v17) = 0;
    *((void *)v105 + v17) = 0;
    char v84 = (char)__s;
    uint32_t v50 = "loading file contents: %s";
    __int16 v51 = 515;
    goto LABEL_53;
  }
LABEL_29:
  uint64_t v43 = v88 - 1;
  if ((**(unsigned char **)(v9 + 8) & 4) == 0 || (int v44 = strrchr(__s, 46)) == 0 || strcasecmp(v44, ".dmg"))
  {
LABEL_32:
    char v45 = 1;
    HIDWORD(v100) = 1;
    uint64_t v46 = *((void *)v104 + v43);
    *(void *)&long long v97 = *(void *)(v9 + 48);
    *((void *)&v97 + 1) = v104;
    *(void *)&long long v98 = v105;
    *((void *)&v98 + 1) = v46;
    *(void *)&long long v99 = *((void *)v105 + v43);
    LODWORD(v100) = 2 * (*(_DWORD *)(*v8 + 16) != 0);
    if ((BXDiff5((uint64_t)&v97, &v101, &st_size, v10, v11, v12, v13, v14) & 0x80000000) == 0) {
      goto LABEL_33;
    }
    uint32_t v50 = "BXDiff5";
    __int16 v51 = 586;
LABEL_53:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", v51, 27, 0, v50, v13, v14, v84);
    goto LABEL_54;
  }
  if (snprintf(v106, 0x400uLL, "%s/0x%08zx", (const char *)(v9 + 92), v8[1]) >= 0x400)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 525, 27, 0, "patch path: %s", v55, v56, (char)__s);
    goto LABEL_54;
  }
  unint64_t v64 = v15;
  size_t v65 = strlen(v106);
  size_t v66 = v65 + 1;
  if (v65 + 1 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_73:
    v95[1] = 0;
    uint32_t v50 = "aaStrdup";
    __int16 v51 = 527;
    goto LABEL_53;
  }
  uint64_t v69 = (char *)malloc(v65 + 1);
  if (!v69) {
    goto LABEL_73;
  }
  uint64_t v70 = v69;
  memcpy(v69, v106, v66);
  v95[1] = v70;
  size_t v71 = *(void *)(v9 + 56);
  if (v71 >= 0x400000001)
  {
    *__error() = 12;
    v94[1] = 0;
LABEL_86:
    uint32_t v50 = "aaCalloc";
    __int16 v51 = 531;
    goto LABEL_53;
  }
  uint64_t v72 = calloc(v71, 8uLL);
  v94[1] = v72;
  if (!v72) {
    goto LABEL_86;
  }
  if (*(void *)(v9 + 56))
  {
    uint64_t v73 = (char **)v72;
    unint64_t v74 = 0;
    while (1)
    {
      snprintf(v106, 0x400uLL, "%s-%zd.dmg", v70, v74);
      size_t v75 = strlen(v106);
      size_t v76 = v75 + 1;
      if (v75 + 1 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_94:
        uint32_t v50 = "aaStrdup";
        __int16 v51 = 539;
        goto LABEL_53;
      }
      uint64_t v77 = (char *)malloc(v75 + 1);
      if (!v77) {
        goto LABEL_94;
      }
      long long v78 = v77;
      memcpy(v77, v106, v76);
      uint64_t v79 = v74 >= *(void *)(v9 + 56) - 1 ? v95 : v73;
      *uint64_t v79 = v78;
      if ((storeFileContents(v106, *((void *)v104 + v74), *((void *)v105 + v74)) & 0x80000000) != 0) {
        break;
      }
      ++v74;
      unint64_t v82 = *(void *)(v9 + 56);
      ++v73;
      if (v74 >= v82)
      {
        uint64_t v83 = v82 - 1;
        goto LABEL_88;
      }
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 546, 27, 0, "storeFileContents %s", v80, v81, (char)v106);
    goto LABEL_54;
  }
  uint64_t v83 = -1;
LABEL_88:
  v94[0] = (void *)v83;
  LODWORD(v96) = 1;
  DWORD2(v96) = 1;
  saveThreadErrorContext(offset);
  unint64_t v15 = v64;
  if (RawImageDiff((uint64_t)v94))
  {
    unlink(v95[1]);
    uint64_t v16 = v89;
    if ((**(unsigned char **)(v9 + 8) & 8) != 0)
    {
      uint32_t v50 = "RawImageDiff";
      __int16 v51 = 573;
      goto LABEL_53;
    }
    restoreThreadErrorContext(offset);
    goto LABEL_32;
  }
  memset(&size, 0, sizeof(size));
  if (stat(v95[1], &size))
  {
    uint32_t v50 = "stat";
    __int16 v51 = 563;
    goto LABEL_53;
  }
  char v45 = 0;
  st_stat size = size.st_size;
  uint64_t v16 = v89;
LABEL_33:
  uint64_t CompressedSize = ParallelCompressionGetCompressedSize(*((void *)v104 + v43), *((void *)v105 + v43), 1);
  if (CompressedSize <= 0) {
    uint64_t CompressedSize = *((void *)v105 + v43);
  }
  unint64_t v48 = st_size;
  if (CompressedSize >= st_size)
  {
    if ((v45 & 1) == 0)
    {
      uint64_t v54 = v16 + 984 * v15;
      free(*(void **)(v54 + 48));
      memset_s((void *)(v54 + 32), 0x18uLL, 0, 0x18uLL);
      uint64_t v49 = 0;
      *(void *)(v54 + 16) = st_size;
      goto LABEL_55;
    }
    if (st_size < *(void *)(*(void *)(v9 + 8) + 120))
    {
      *(void *)(v16 + 984 * v15 + 24) = v101;
      unint64_t v101 = 0;
LABEL_69:
      uint64_t v49 = 0;
      *(void *)(v16 + 984 * v15 + 16) = v48;
      goto LABEL_55;
    }
    if (snprintf(v106, 0x400uLL, "%s/0x%08zx", (const char *)(v9 + 92), v8[1]) >= 0x400)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 612, 27, 0, "patch path: %s", v62, v63, (char)__s);
      goto LABEL_54;
    }
    if ((storeFileContents(v106, (uint64_t)v101, st_size) & 0x80000000) == 0)
    {
      unint64_t v48 = st_size;
      goto LABEL_69;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 613, 27, 0, "storing patch: %s", v67, v68, (char)__s);
LABEL_54:
    uint64_t v49 = 0xFFFFFFFFLL;
    goto LABEL_55;
  }
  *(_DWORD *)(v16 + 984 * v15 + 8) = 3;
  if (*(_DWORD *)(v9 + 24) >= 2u) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "ARCHIVE (smaller than patch): %s\n", __s);
  }
  uint64_t v49 = 0;
LABEL_55:
  if (*(void *)(v9 + 56))
  {
    unint64_t v57 = 0;
    do
    {
      free(*((void **)v104 + v57));
      if (v94[1]) {
        free(*((void **)v94[1] + v57));
      }
      ++v57;
    }
    while (v57 < *(void *)(v9 + 56));
  }
  free(v94[1]);
  free(v95[0]);
  free(v95[1]);
  free(v101);
  return v49;
}

AAHeader stateLoadEntryHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 984 * a3 + 72 * a2 + 288);
  uint64_t v6 = (uint8_t *)malloc(0x10000uLL);
  uint64_t v9 = v6;
  if (v6)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 8) + 8 * a2 + 24);
    if (*(void *)(v10 + 32))
    {
      uint64_t v11 = 0;
      uint64_t v12 = 6;
      uint64_t v13 = (char *)v6;
      uint64_t v14 = v5;
      while (1)
      {
        uint64_t v15 = (*(uint64_t (**)(void, char *, uint64_t, uint64_t))(v10 + 32))(*(void *)v10, v13, v12, v14);
        if (v15 < 0) {
          break;
        }
        if (v15)
        {
          v13 += v15;
          v11 += v15;
          v14 += v15;
          v12 -= v15;
          if (v12) {
            continue;
          }
        }
        if (v11 != 6) {
          break;
        }
        if (*(_DWORD *)v9 != 826360153 && *(_DWORD *)v9 != 825246017)
        {
          uint64_t v16 = "invalid header magic";
          __int16 v17 = 704;
          goto LABEL_12;
        }
        uint64_t v21 = *(void **)(*(void *)(a1 + 8) + 8 * a2 + 24);
        if (!v21[4]) {
          goto LABEL_28;
        }
        size_t v22 = *((unsigned __int16 *)v9 + 2);
        if (*((_WORD *)v9 + 2))
        {
          uint64_t v23 = 0;
          size_t v24 = v9;
          uint64_t v25 = *((unsigned __int16 *)v9 + 2);
          while (1)
          {
            uint64_t v26 = ((uint64_t (*)(void, uint8_t *, uint64_t, uint64_t))v21[4])(*v21, v24, v25, v5);
            if (v26 < 0) {
              break;
            }
            if (v26)
            {
              v24 += v26;
              v23 += v26;
              v5 += v26;
              v25 -= v26;
              if (v25) {
                continue;
              }
            }
            goto LABEL_25;
          }
          uint64_t v23 = v26;
        }
        else
        {
          uint64_t v23 = 0;
        }
LABEL_25:
        if (v23 == v22)
        {
          AAHeader v27 = AAHeaderCreateWithEncodedData(v22, v9);
          if (v27)
          {
            AAHeader v19 = v27;
            free(v9);
            return v19;
          }
          uint64_t v16 = "invalid header";
          __int16 v17 = 709;
        }
        else
        {
LABEL_28:
          uint64_t v16 = "reading header";
          __int16 v17 = 706;
        }
        goto LABEL_12;
      }
    }
    uint64_t v16 = "reading header magic";
    __int16 v17 = 703;
LABEL_12:
    int v18 = 0;
  }
  else
  {
    int v18 = *__error();
    uint64_t v16 = "malloc";
    __int16 v17 = 700;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateLoadEntryHeader", v17, 27, v18, v16, v7, v8, v28);
  free(v9);
  AAHeaderDestroy(0);
  return 0;
}

void *subArchiveCreate(unint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = malloc(0x28uLL);
  uint64_t v9 = v8;
  if (v8)
  {
    memset_s(v8, 0x28uLL, 0, 0x28uLL);
    *(_DWORD *)uint64_t v9 = a2;
    *((void *)v9 + 1) = a3;
    *((_DWORD *)v9 + 4) = a4;
    uint64_t v10 = (AAByteStream_impl *)AATempStreamOpen(a1);
    *((void *)v9 + 3) = v10;
    if (!v10)
    {
      uint64_t v14 = "AATempStreamOpen";
      __int16 v15 = 165;
      goto LABEL_8;
    }
    if (*(_DWORD *)v9)
    {
      AAByteStream v13 = AACompressionOutputStreamOpen(v10, *(_DWORD *)v9, *((void *)v9 + 1), 0, *((_DWORD *)v9 + 4));
      *((void *)v9 + 4) = v13;
      if (!v13)
      {
        uint64_t v14 = "AACompressionOutputStreamOpen";
        __int16 v15 = 169;
LABEL_8:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"subArchiveCreate", v15, 27, 0, v14, v11, v12, v20);
        AAByteStreamClose(*((AAByteStream *)v9 + 4));
        AAByteStreamClose(*((AAByteStream *)v9 + 3));
        free(v9);
        return 0;
      }
    }
  }
  else
  {
    uint64_t v16 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"subArchiveCreate", 159, 27, *v16, "malloc", v17, v18, v20);
  }
  return v9;
}

uint64_t encodeEntry(uint64_t a1, unsigned int a2, const char *a3)
{
  uint64_t v6 = AAHeaderCreate();
  uint64_t v9 = v6;
  if (!v6)
  {
    char v20 = "AAHeaderCreate";
    __int16 v21 = 468;
LABEL_18:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"encodeEntry", v21, 27, 0, v20, v7, v8, v24);
    uint64_t v22 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }
  v10.iAAFieldKey key = 5265748;
  int v11 = AAHeaderSetFieldUInt(v6, 0xFFFFFFFF, v10, a2);
  size_t v12 = strlen(a3);
  v13.iAAFieldKey key = 5521744;
  if (AAHeaderSetFieldString(v9, 0xFFFFFFFF, v13, a3, v12) < 0 || v11 < 0)
  {
    char v20 = "setup header";
    __int16 v21 = 473;
    goto LABEL_18;
  }
  size_t EncodedSize = AAHeaderGetEncodedSize(v9);
  EncodedData = AAHeaderGetEncodedData(v9);
  if (*(void *)(a1 + 24))
  {
    if (EncodedSize)
    {
      uint64_t v16 = EncodedData;
      uint64_t v17 = 0;
      size_t v18 = EncodedSize;
      while (1)
      {
        uint64_t v19 = (*(uint64_t (**)(void, const uint8_t *, size_t))(a1 + 24))(*(void *)a1, v16, v18);
        if (v19 < 1) {
          break;
        }
        v16 += v19;
        v17 += v19;
        v18 -= v19;
        if (!v18) {
          goto LABEL_15;
        }
      }
      uint64_t v17 = v19;
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = -1;
  }
LABEL_15:
  if (v17 != EncodedSize)
  {
    char v20 = "write header";
    __int16 v21 = 477;
    goto LABEL_18;
  }
  uint64_t v22 = 0;
LABEL_19:
  AAHeaderDestroy(v9);
  return v22;
}

uint64_t encodeYOPEntry(AAByteStream_impl *a1, unsigned int a2, const char *a3, const char *a4, AAByteStream s)
{
  if (s)
  {
    off_t v12 = AAByteStreamSeek(s, 0, 2);
    if (v12 < 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"encodeYOPEntry", 416, 27, 0, "seek dat stream", v10, v11, v37);
      AAFieldKey v13 = 0;
LABEL_37:
      uint64_t v35 = 0xFFFFFFFFLL;
      goto LABEL_38;
    }
  }
  else
  {
    off_t v12 = -1;
  }
  uint64_t v14 = AAHeaderCreate();
  AAFieldKey v13 = v14;
  if (!v14)
  {
    uint64_t v32 = "AAHeaderCreate";
    __int16 v33 = 421;
    goto LABEL_36;
  }
  v17.iAAFieldKey key = 5265748;
  int v18 = AAHeaderSetFieldUInt(v14, 0xFFFFFFFF, v17, 0x4DuLL);
  v19.iAAFieldKey key = 5263193;
  BOOL v20 = (AAHeaderSetFieldUInt(v13, 0xFFFFFFFF, v19, a2) | v18) >= 0;
  if (a3)
  {
    size_t v21 = strlen(a3);
    v22.iAAFieldKey key = 5521744;
    if (AAHeaderSetFieldString(v13, 0xFFFFFFFF, v22, a3, v21) < 0) {
      BOOL v20 = 0;
    }
  }
  if (a4)
  {
    size_t v23 = strlen(a4);
    v24.iAAFieldKey key = 4997708;
    if (AAHeaderSetFieldString(v13, 0xFFFFFFFF, v24, a4, v23) < 0) {
      BOOL v20 = 0;
    }
  }
  if (v12 != -1 && (v25.iAAFieldKey key = 5521732, AAHeaderSetFieldBlob(v13, 0xFFFFFFFF, v25, v12) < 0) || !v20)
  {
    uint64_t v32 = "setup header";
    __int16 v33 = 427;
    goto LABEL_36;
  }
  size_t EncodedSize = AAHeaderGetEncodedSize(v13);
  EncodedData = AAHeaderGetEncodedData(v13);
  if (*((void *)a1 + 3))
  {
    if (EncodedSize)
    {
      char v28 = EncodedData;
      uint64_t v29 = 0;
      size_t v30 = EncodedSize;
      while (1)
      {
        uint64_t v31 = (*((uint64_t (**)(void, const uint8_t *, size_t))a1 + 3))(*(void *)a1, v28, v30);
        if (v31 < 1) {
          break;
        }
        v28 += v31;
        v29 += v31;
        v30 -= v31;
        if (!v30) {
          goto LABEL_26;
        }
      }
      uint64_t v29 = v31;
    }
    else
    {
      uint64_t v29 = 0;
    }
  }
  else
  {
    uint64_t v29 = -1;
  }
LABEL_26:
  if (v29 != EncodedSize)
  {
    uint64_t v32 = "write header";
    __int16 v33 = 431;
    goto LABEL_36;
  }
  if (v12 != -1)
  {
    if (s)
    {
      if (AAByteStreamSeek(s, 0, 0) < 0)
      {
        uint64_t v32 = "seek dat stream";
        __int16 v33 = 437;
        goto LABEL_36;
      }
      off_t v34 = AAByteStreamProcess(s, a1);
      if ((v34 & 0x8000000000000000) == 0 && v34 == v12) {
        goto LABEL_32;
      }
    }
    uint64_t v32 = "write blob";
    __int16 v33 = 440;
LABEL_36:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"encodeYOPEntry", v33, 27, 0, v32, v15, v16, v37);
    goto LABEL_37;
  }
LABEL_32:
  uint64_t v35 = 0;
LABEL_38:
  AAHeaderDestroy(v13);
  return v35;
}

void subArchiveDestroy(AAByteStream *a1)
{
  if (a1)
  {
    AAByteStreamClose(a1[4]);
    AAByteStreamClose(a1[3]);
    free(a1);
  }
}

uint64_t aaEntryYECBlobInitWithEncodedData(void *a1, void *__src, rsize_t __smax, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a1 = 0;
  if ((__smax & 0x8000000000000000) != 0)
  {
LABEL_21:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithEncodedData", 22, 105, 0, "malloc", a7, a8, v17);
    return 0xFFFFFFFFLL;
  }
  size_t v11 = a1[1];
  if (v11 < __smax)
  {
    do
    {
      while (!v11)
      {
        size_t v11 = 0x4000;
        if (__smax <= 0x4000)
        {
          size_t v11 = 0x4000;
          goto LABEL_12;
        }
      }
      size_t v12 = v11 >> 1;
      if ((v11 & (v11 >> 1)) != 0) {
        size_t v12 = v11 & (v11 >> 1);
      }
      v11 += v12;
    }
    while (v11 < __smax);
    if (v11 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_20;
    }
LABEL_12:
    AAFieldKey v13 = (void *)a1[2];
    uint64_t v14 = realloc(v13, v11);
    if (v14)
    {
      a1[1] = v11;
      a1[2] = v14;
      goto LABEL_14;
    }
    free(v13);
LABEL_20:
    a1[1] = 0;
    a1[2] = 0;
    *a1 = 0;
    goto LABEL_21;
  }
LABEL_14:
  uint64_t v15 = a1[2];
  if (__src)
  {
    memcpy((void *)(v15 + *a1), __src, __smax);
  }
  else if (v15)
  {
    memset_s((void *)(v15 + *a1), __smax, 0, __smax);
  }
  uint64_t result = 0;
  *a1 += __smax;
  return result;
}

uint64_t aaEntryYECBlobInitWithPath(void *a1, int a2, char *a3, const char *a4)
{
  char v4 = (char)a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((concatPath(v23, 0x800uLL, a3, a4) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithPath", 34, 105, 0, "invalid path %s/%s", v7, v8, v4);
    return 0xFFFFFFFFLL;
  }
  int v9 = open(v23, 0);
  if (v9 < 0)
  {
    int v19 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithPath", 38, 105, v19, "open: %s", v20, v21, (char)v23);
    return 0xFFFFFFFFLL;
  }
  int v15 = v9;
  if ((aaEntryYECBlobInitWithFD(a1, a2, v9, v10, v11, v12, v13, v14) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithPath", 40, 105, 0, "computing YEC blob: %s", v16, v17, (char)v23);
    uint64_t v18 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v18 = 0;
  }
  close(v15);
  return v18;
}

uint64_t aaEntryYECBlobInitWithFD(void *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 == 65552)
  {
    memset(&v39, 0, sizeof(v39));
    if (fstat(a3, &v39) || (v39.st_mode & 0xF000) != 0x8000)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", 71, 105, 0, "entry not found, or not a regular file", v10, v11, v38);
      AAFieldKey v22 = 0;
      uint64_t v18 = 0;
      int v15 = 0;
    }
    else
    {
      st_stat size = v39.st_size;
      int v15 = (char *)IFileStreamCreateWithFD(a3, 0, v39.st_size);
      if (v15)
      {
        uint64_t v18 = (void **)OECCStreamCreate(1, 0x4000u, st_size);
        if (v18)
        {
          int v19 = (unint64_t *)MemBufferCreate(0x10000uLL);
          AAFieldKey v22 = (void **)v19;
          if (v19)
          {
            uint64_t v23 = MemBufferTransmit(v19, st_size, (size_t (*)(int, void *, size_t))IFileStreamRead, (uint64_t)v15, (uint64_t (*)(uint64_t, uint64_t, uint64_t))OECCStreamWrite, (uint64_t)v18, v20, v21);
            if ((v23 & 0x8000000000000000) == 0 && v23 == st_size)
            {
              size_t DataSize = OECCStreamGetDataSize((uint64_t)v18);
              uint64_t DataPtr = OECCStreamGetDataPtr((uint64_t)v18);
              *a1 = 0;
              if ((DataSize & 0x8000000000000000) != 0)
              {
LABEL_40:
                uint64_t v29 = "alloc blob failed";
                __int16 v30 = 89;
                goto LABEL_19;
              }
              uint64_t v26 = (const void *)DataPtr;
              size_t v27 = a1[1];
              if (v27 < DataSize)
              {
                do
                {
                  while (!v27)
                  {
                    size_t v27 = 0x4000;
                    if (DataSize <= 0x4000)
                    {
                      size_t v27 = 0x4000;
                      goto LABEL_31;
                    }
                  }
                  size_t v28 = v27 >> 1;
                  if ((v27 & (v27 >> 1)) != 0) {
                    size_t v28 = v27 & (v27 >> 1);
                  }
                  v27 += v28;
                }
                while (v27 < DataSize);
                if (v27 >= 0x2000000001)
                {
                  *__error() = 12;
                  goto LABEL_39;
                }
LABEL_31:
                uint64_t v35 = (void *)a1[2];
                int v36 = realloc(v35, v27);
                if (v36)
                {
                  a1[1] = v27;
                  a1[2] = v36;
                  goto LABEL_33;
                }
                free(v35);
LABEL_39:
                a1[1] = 0;
                a1[2] = 0;
                *a1 = 0;
                goto LABEL_40;
              }
LABEL_33:
              uint64_t v37 = a1[2];
              if (v26)
              {
                memcpy((void *)(v37 + *a1), v26, DataSize);
              }
              else if (v37)
              {
                memset_s((void *)(v37 + *a1), DataSize, 0, DataSize);
              }
              uint64_t v31 = 0;
              *a1 += DataSize;
LABEL_22:
              IFileStreamDestroy(v15);
              OECCStreamDestroy(v18);
              MemBufferDestroy(v22);
              return v31;
            }
            __int16 v33 = "reading file data for ECC";
            __int16 v34 = 84;
          }
          else
          {
            __int16 v33 = "allocating mem buffer";
            __int16 v34 = 80;
          }
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", v34, 105, 0, v33, v20, v21, v38);
        }
        else
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", 78, 105, 0, "creating the ECC stream", v16, v17, v38);
          AAFieldKey v22 = 0;
        }
      }
      else
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", 76, 105, 0, "opening file", v13, v14, v38);
        AAFieldKey v22 = 0;
        uint64_t v18 = 0;
      }
    }
    uint64_t v31 = 0xFFFFFFFFLL;
    goto LABEL_22;
  }
  char v38 = a2;
  uint64_t v29 = "invalid YEC variant: %u";
  __int16 v30 = 57;
LABEL_19:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", v30, 105, 0, v29, a7, a8, v38);
  return 0xFFFFFFFFLL;
}

void *AAEntryYECBlobCreate()
{
  v0 = malloc(0x18uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    memset_s(v0, 0x18uLL, 0, 0x18uLL);
  }
  else
  {
    uint64_t v2 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobCreate", 105, 105, *v2, "malloc", v3, v4, v6);
  }
  return v1;
}

void **AAEntryYECBlobCreateWithEncodedData(void *a1, rsize_t a2)
{
  uint64_t v4 = (void **)AAEntryYECBlobCreate();
  uint64_t v10 = v4;
  if (v4 && (aaEntryYECBlobInitWithEncodedData(v4, a1, a2, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    AAEntryYECBlobDestroy(v10);
    return 0;
  }
  return v10;
}

void **AAEntryYECBlobCreateWithPath(int a1, char *a2, const char *a3)
{
  uint64_t v6 = (void **)AAEntryYECBlobCreate();
  uint64_t v7 = v6;
  if (v6 && (aaEntryYECBlobInitWithPath(v6, a1, a2, a3) & 0x80000000) != 0)
  {
    AAEntryYECBlobDestroy(v7);
    return 0;
  }
  return v7;
}

uint64_t AAEntryYECBlobApplyToPath(uint64_t a1, char *__s, const char *a3, int *a4, uint64_t a5, int a6)
{
  char v8 = (char)__s;
  uint64_t v33 = *MEMORY[0x263EF8340];
  memset(&v31, 0, sizeof(v31));
  __sa[0] = 0;
  __sa[1] = 0;
  uint64_t v30 = 0;
  if ((concatPath(v32, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    LOBYTE(v28) = v8;
    AAFieldKey v22 = "invalid path %s/%s";
    __int16 v23 = 153;
    goto LABEL_12;
  }
  if (lstat(v32, &v31) || (v31.st_mode & 0xF000) != 0x8000)
  {
    size_t v28 = v32;
    AAFieldKey v22 = "entry not found, or not a regular file: %s";
    __int16 v23 = 156;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobApplyToPath", v23, 105, 0, v22, v10, v11, (char)v28);
    goto LABEL_13;
  }
  st_stat size = v31.st_size;
  memset_s(__sa, 0x18uLL, 0, 0x18uLL);
  HIDWORD(__sa[0]) = a6;
  int v13 = open(v32, 2);
  if ((v13 & 0x80000000) == 0)
  {
    int v14 = v13;
    int v15 = ParallelArchiveECCFixFileSegment(v13, 0, st_size, *(long long **)(a1 + 16), *(void *)a1, (uint64_t)__sa);
    int v18 = HIDWORD(v30);
    if (v15 < 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobApplyToPath", 166, 105, 0, "file can't be fixed: %s", v16, v17, (char)v32);
    }
    else
    {
      if (!v15
        || !statIsCompressed(v31.st_flags)
        || (ParallelCompressionAFSCCompress(v32, 1) & 0x80000000) == 0)
      {
        uint64_t v21 = 0;
        goto LABEL_19;
      }
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobApplyToPath", 171, 105, 0, "file can't be re-compressed: %s", v19, v20, (char)v32);
    }
    uint64_t v21 = 0xFFFFFFFFLL;
LABEL_19:
    close(v14);
    if (!a4) {
      return v21;
    }
    goto LABEL_14;
  }
  int v25 = *__error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobApplyToPath", 163, 105, v25, "opening file RW: %s", v26, v27, (char)v32);
LABEL_13:
  uint64_t v21 = 0xFFFFFFFFLL;
  int v18 = -1;
  if (a4) {
LABEL_14:
  }
    *a4 = v18;
  return v21;
}

uint64_t AAEntryYECBlobGetEncodedSize(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t AAEntryYECBlobGetEncodedData(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

AAArchiveStream AAEncodeArchiveOutputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  uint64_t v10 = (uint64_t *)malloc(0x38uLL);
  uint64_t v11 = v10;
  if (v10) {
    memset_s(v10, 0x38uLL, 0, 0x38uLL);
  }
  uint64_t v12 = malloc(0x478uLL);
  uint64_t v13 = (uint64_t)v12;
  if (!v12 || (memset_s(v12, 0x478uLL, 0, 0x478uLL), !v11))
  {
    uint64_t v16 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"AAEncodeArchiveOutputStreamOpen", 246, 99, *v16, "malloc", v17, v18, v23);
LABEL_11:
    encoderStreamClose(v13);
    free(v11);
    return 0;
  }
  *(void *)uint64_t v13 = flags;
  if (!n_threads) {
    n_threads = getDefaultNThreads();
  }
  *(_DWORD *)(v13 + 8) = n_threads;
  *(void *)(v13 + 16) = stream;
  *(void *)(v13 + 80) = msg_data;
  *(void *)(v13 + 88) = msg_proc;
  double RealTime = getRealTime();
  *(_OWORD *)(v13 + 24) = xmmword_214B130D0;
  *(double *)(v13 + 1136) = RealTime;
  int v15 = malloc(0x40000uLL);
  *(void *)(v13 + 40) = v15;
  if (!v15)
  {
    uint64_t v19 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"AAEncodeArchiveOutputStreamOpen", 260, 99, *v19, "malloc", v20, v21, v23);
    *(void *)(v13 + 24) = 0;
    *(void *)(v13 + 32) = 0;
    goto LABEL_11;
  }
  v11[2] = (uint64_t)encoderStreamAbort;
  *uint64_t v11 = v13;
  v11[1] = (uint64_t)encoderStreamClose;
  v11[3] = (uint64_t)encoderStreamWriteHeader;
  v11[4] = (uint64_t)encoderStreamWriteBlob;
  return (AAArchiveStream)v11;
}

uint64_t encoderStreamClose(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    unint64_t v2 = *(void *)result;
    if ((flushOBuf(result) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamClose", 98, 99, 0, "flushing buffer", v3, v4, v8);
      int v5 = 0;
    }
    else
    {
      int v5 = 1;
    }
    if (*(void *)(v1 + 32))
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamClose", 99, 99, 0, "bytes remaining in obuf", v3, v4, v8);
      int v5 = 0;
    }
    if (*(_DWORD *)(v1 + 72))
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamClose", 100, 99, 0, "truncated entry when encoder destroyed", v3, v4, v8);
      int v5 = 0;
    }
    free(*(void **)(v1 + 56));
    memset_s((void *)(v1 + 48), 0x10uLL, 0, 0x10uLL);
    free(*(void **)(v1 + 40));
    if (v5 && v2 >> 62)
    {
      double v6 = getRealTime() - *(double *)(v1 + 1136);
      uint64_t v7 = (FILE **)MEMORY[0x263EF8348];
      fwrite("Encode archive\n", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      fprintf(*v7, "%12u entries in archive\n", *(_DWORD *)(v1 + 1128));
      fprintf(*v7, "%12llu bytes in archive (uncompressed)\n", *(void *)(v1 + 1120));
      fprintf(*v7, "%12.0f MB/s\n", (double)*(unint64_t *)(v1 + 1120) * 0.000000953674316 / v6);
      fprintf(*v7, "%12.2f encoding time (s)\n", v6);
    }
    free((void *)v1);
    if (v5) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void encoderStreamAbort(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 68))
  {
    *(_DWORD *)(a1 + 68) = 1;
    AAByteStreamCancel(*(AAByteStream *)(a1 + 16));
  }
}

uint64_t encoderStreamWriteHeader(uint64_t a1, AAHeader header, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 68)) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 72))
  {
    uint64_t v9 = "truncated entry when header encoded";
    __int16 v10 = 136;
LABEL_4:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteHeader", v10, 99, 0, v9, a7, a8, v24);
    return 0xFFFFFFFFLL;
  }
  *(unsigned char *)(a1 + 96) = 0;
  if (!*((void *)header + 2)) {
    return 0;
  }
  if (*(void *)(a1 + 88))
  {
    v14.iAAFieldKey key = 5521744;
    uint32_t KeyIndex = AAHeaderGetKeyIndex(header, v14);
    if ((KeyIndex & 0x80000000) == 0)
    {
      unsigned int FieldString = AAHeaderGetFieldString(header, KeyIndex, 0x400uLL, (char *)(a1 + 96), 0);
      int v17 = FieldString <= 1 ? 1 : FieldString;
      if (v17 >= 1
        && ((*(uint64_t (**)(void, uint64_t, uint64_t, void))(a1 + 88))(*(void *)(a1 + 80), 31, a1 + 96, 0) & 0x80000000) != 0)
      {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if ((aaHeaderBlobArrayInitWithHeader(a1 + 48, header) & 0x80000000) != 0)
  {
    uint64_t v9 = "initializing blob array";
    __int16 v10 = 159;
    goto LABEL_4;
  }
  if ((writeOBuf((void *)a1, *((char **)header + 4), *((void *)header + 2)) & 0x80000000) != 0)
  {
    uint64_t v9 = "writing header blob";
    __int16 v10 = 162;
    goto LABEL_4;
  }
  *(_DWORD *)(a1 + 64) = 0;
  uint64_t v18 = *(unsigned int *)(a1 + 48);
  if (v18 && (uint64_t v19 = *(void *)(a1 + 56), !*(void *)(v19 + 8)))
  {
    uint64_t v21 = (uint64_t *)(v19 + 32);
    uint64_t v22 = 1;
    do
    {
      unsigned int v20 = v22;
      if (v18 == v22) {
        break;
      }
      uint64_t v23 = *v21;
      v21 += 3;
      ++v22;
    }
    while (!v23);
    *(_DWORD *)(a1 + 64) = v20;
  }
  else
  {
    unsigned int v20 = 0;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 72) = v20 < v18;
  ++*(_DWORD *)(a1 + 1128);
  return result;
}

uint64_t encoderStreamWriteBlob(uint64_t a1, int a2, char *a3, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v36[2] = *MEMORY[0x263EF8340];
  int v35 = a2;
  if (*(_DWORD *)(a1 + 68)) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0;
  }
  if (!*(_DWORD *)(a1 + 72))
  {
    int v17 = "receiving blob data outside of entry";
    __int16 v18 = 187;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteBlob", v18, 99, 0, v17, a7, a8, (char)v34);
    return 0xFFFFFFFFLL;
  }
  unsigned int v11 = *(_DWORD *)(a1 + 64);
  if (v11 >= *(_DWORD *)(a1 + 48))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteBlob", 190, 99, 0, "unexpected blob data received: %llu B", a7, a8, a4);
    return 0xFFFFFFFFLL;
  }
  uint64_t v12 = *(void *)(a1 + 56);
  if (*(_DWORD *)(v12 + 24 * v11) != a2)
  {
    __int16 v34 = &v35;
    int v17 = "unexpected blob key: received %s, expecting %s";
    __int16 v18 = 192;
    goto LABEL_12;
  }
  uint64_t v13 = v12 + 24 * v11;
  size_t v15 = *(void *)(v13 + 8);
  AAFieldKey v14 = (void *)(v13 + 8);
  if (v15 >= a4)
  {
    int v21 = writeOBuf((void *)a1, a3, a4);
    if (v21 < 0) {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteBlob", 201, 99, 0, "writing data blob", v19, v20, (char)v34);
    }
    size_t v22 = *v14 - a4;
    BOOL v32 = *v14 == a4;
    *AAFieldKey v14 = v22;
    if (v32)
    {
      int v23 = *(_DWORD *)(a1 + 64);
      uint64_t v24 = (v23 + 1);
      *(_DWORD *)(a1 + 64) = v24;
      uint64_t v25 = *(unsigned int *)(a1 + 48);
      if (v24 < v25)
      {
        uint64_t v26 = *(void *)(a1 + 56);
        if (!*(void *)(v26 + 24 * v24 + 8))
        {
          uint64_t v27 = (uint64_t *)(v26 + 24 * v24 + 32);
          uint64_t v28 = ~v24 + v25;
          int v29 = v23 + 2;
          do
          {
            LODWORD(v24) = v29;
            if (!v28) {
              break;
            }
            uint64_t v30 = *v27;
            v27 += 3;
            --v28;
            ++v29;
          }
          while (!v30);
          *(_DWORD *)(a1 + 64) = v24;
        }
      }
      *(_DWORD *)(a1 + 72) = v24 < v25;
    }
    stat v31 = *(uint64_t (**)(void, uint64_t, uint64_t, void *))(a1 + 88);
    if (v31) {
      BOOL v32 = (a2 & 0xFFFFFF) == 5521732;
    }
    else {
      BOOL v32 = 0;
    }
    if (!v32) {
      return (v21 >> 31);
    }
    if (!*(unsigned char *)(a1 + 96)) {
      return (v21 >> 31);
    }
    size_t v33 = *(void *)(v12 + 24 * v11 + 16) - v22;
    v36[0] = *(void *)(v12 + 24 * v11 + 16);
    v36[1] = v33;
    if ((v31(*(void *)(a1 + 80), 31, a1 + 96, v36) & 0x80000000) == 0) {
      return (v21 >> 31);
    }
    int v17 = "client callback cancel";
    __int16 v18 = 220;
    goto LABEL_12;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteBlob", 193, 99, 0, "extra data received for blob %s: received %llu, expecting %llu", a7, a8, a4);
  return 0xFFFFFFFFLL;
}

uint64_t flushOBuf(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    return 0;
  }
  unint64_t v3 = 0;
  while (1)
  {
    ssize_t v4 = AAByteStreamWrite(*(AAByteStream *)(a1 + 16), (const void *)(*(void *)(a1 + 40) + v3), v1 - v3);
    if (v4 < 1) {
      break;
    }
    v3 += v4;
    *(void *)(a1 + 1120) += v4;
    unint64_t v1 = *(void *)(a1 + 32);
    if (v3 >= v1)
    {
      uint64_t result = 0;
      *(void *)(a1 + 32) = 0;
      return result;
    }
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"flushOBuf", 54, 99, 0, "Writing to ostream failed", v5, v6, v8);
  return 0xFFFFFFFFLL;
}

uint64_t writeOBuf(void *a1, char *__src, size_t a3)
{
  if (!a3) {
    return 0;
  }
  size_t v3 = a3;
  size_t v6 = a1[4];
  while (1)
  {
    size_t v7 = a1[3];
    if (v6 == v7) {
      break;
    }
LABEL_6:
    if (v6 + v3 <= v7) {
      size_t v10 = v3;
    }
    else {
      size_t v10 = v7 - v6;
    }
    memcpy((void *)(a1[5] + v6), __src, v10);
    size_t v6 = a1[4] + v10;
    a1[4] = v6;
    __src += v10;
    v3 -= v10;
    if (!v3) {
      return 0;
    }
  }
  if ((flushOBuf((uint64_t)a1) & 0x80000000) == 0)
  {
    size_t v7 = a1[3];
    size_t v6 = a1[4];
    goto LABEL_6;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"writeOBuf", 70, 99, 0, "flush output buffer failed", v8, v9, v12);
  return 0xFFFFFFFFLL;
}

uint64_t forceInPlaceControls(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  if (a1 <= a2) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = a1;
  }
  size_t v9 = ((v8 + 4095) >> 12) + 16;
  if (a5 >= 3) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Post-processing ctrl for in-place patching, %u pages\n", v9);
  }
  size_t v10 = calloc(v9, 4uLL);
  unsigned int v11 = (char *)calloc(v9, 4uLL);
  char v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if (a4)
    {
      uint64_t v19 = 0;
      unint64_t v20 = 0;
      int v21 = v9;
      do
      {
        size_t v22 = (unint64_t *)(a3 + 24 * v19);
        unint64_t v23 = *v22;
        if ((*v22 & 0x8000000000000000) != 0) {
          unint64_t v23 = 0x8000000000000000 - *v22;
        }
        uint64_t v24 = v22[2];
        if (v24 < 0) {
          uint64_t v24 = 0x8000000000000000 - v24;
        }
        unint64_t v25 = v20 >> 12;
        if (v23) {
          int v26 = ((v20 + v23 - 1) >> 12) - (v20 >> 12) + 1;
        }
        else {
          int v26 = 0;
        }
        uint64_t v27 = (v26 + v25);
        if (v27 > v25)
        {
          uint64_t v28 = &v10[v25];
          uint64_t v29 = v27 - v25;
          do
          {
            int v21 = (__PAIR64__(v21, (*v28++)++) - 1) >> 32;
            --v29;
          }
          while (v29);
        }
        v20 += v23 + v24;
        ++v19;
      }
      while (v19 != a4);
    }
    else
    {
      int v21 = v9;
    }
    if (a5 > 1) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "After input pages retained, %u free pages\n", v21);
    }
    if (a4)
    {
      uint64_t v30 = 0;
      unint64_t v31 = 0;
      unint64_t v32 = 0;
      int v33 = v21;
      do
      {
        __int16 v34 = (unint64_t *)(a3 + 24 * v30);
        uint64_t v35 = v34[1];
        unint64_t v36 = 0x8000000000000000 - *v34;
        if ((*v34 & 0x8000000000000000) == 0) {
          unint64_t v36 = *v34;
        }
        unint64_t v37 = 0x8000000000000000 - v35;
        if (v35 >= 0) {
          unint64_t v37 = v34[1];
        }
        uint64_t v38 = v34[2];
        if (v38 < 0) {
          uint64_t v38 = 0x8000000000000000 - v38;
        }
        if (v36)
        {
          unint64_t v39 = v36 + v31;
          do
          {
            unint64_t v40 = (v31 & 0xFFFFFFFFFFFFF000) + 4096;
            if (v40 >= v39) {
              unint64_t v40 = v39;
            }
            unint64_t v41 = v32 >> 12;
            unint64_t v42 = v40 - v31;
            if (v40 == v31) {
              int v43 = 0;
            }
            else {
              int v43 = ((v32 + v42 - 1) >> 12) - v41 + 1;
            }
            unint64_t v44 = v31 >> 12;
            int v45 = v10[v44] - 1;
            v10[v44] = v45;
            if (!v45) {
              ++v21;
            }
            uint64_t v46 = (v43 + v41);
            if (v46 > v41)
            {
              BOOL v47 = &v12[4 * v41];
              uint64_t v48 = v46 - v41;
              do
              {
                int v21 = (__PAIR64__(v21, (*(_DWORD *)v47)++) - 1) >> 32;
                v47 += 4;
                --v48;
              }
              while (v48);
            }
            v32 += v42;
            if (v21 < v33) {
              int v33 = v21;
            }
            unint64_t v31 = v40;
            v36 -= v42;
          }
          while (v36);
        }
        else
        {
          unint64_t v40 = v31;
        }
        unint64_t v31 = v40 + v38;
        v32 += v37;
        ++v30;
      }
      while (v30 != a4);
    }
    else
    {
      int v33 = v21;
    }
    if (a5 > 2)
    {
      uint64_t v49 = (FILE **)MEMORY[0x263EF8348];
      fprintf((FILE *)*MEMORY[0x263EF8348], "Free pages after diff controls: %u\n", v21);
      fprintf(*v49, "Min free pages reached: %d\n", v33);
    }
    bzero(v10, 4 * v9);
    if (a4)
    {
      uint64_t v50 = 0;
      unint64_t v51 = 0;
      do
      {
        int v52 = (unint64_t *)(a3 + 24 * v50);
        unint64_t v53 = *v52;
        if ((*v52 & 0x8000000000000000) != 0) {
          unint64_t v53 = 0x8000000000000000 - *v52;
        }
        uint64_t v54 = v52[2];
        if (v54 < 0) {
          uint64_t v54 = 0x8000000000000000 - v54;
        }
        unint64_t v55 = v51 >> 12;
        if (v53) {
          int v56 = ((v51 + v53 - 1) >> 12) - (v51 >> 12) + 1;
        }
        else {
          int v56 = 0;
        }
        uint64_t v57 = (v56 + v55);
        if (v57 > v55)
        {
          uint32_t v58 = &v10[v55];
          uint64_t v59 = v57 - v55;
          do
          {
            ++*v58++;
            --v59;
          }
          while (v59);
        }
        v51 += v53 + v54;
        ++v50;
      }
      while (v50 != a4);
      BOOL v60 = v33 < 4;
      uint64_t v81 = v12;
      if (v33 <= 3)
      {
        uint64_t v82 = a3;
        unint64_t v83 = a4;
        unint64_t v61 = 0;
        unint64_t v62 = 0;
        int64x2_t v63 = vdupq_n_s64(0x8000000000000000);
        int64x2_t v84 = v63;
        do
        {
          unint64_t v64 = (int64x2_t *)(v82 + 24 * v61);
          int64x2_t v65 = (int64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(*v64), (int8x16_t)vsubq_s64(v63, *v64), *(int8x16_t *)v64);
          uint64_t v66 = v64[1].i64[0];
          if (v66 >= 0) {
            uint64_t v67 = v64[1].i64[0];
          }
          else {
            uint64_t v67 = 0x8000000000000000 - v66;
          }
          if (a5 >= 3)
          {
            int64x2_t v87 = v65;
            fprintf((FILE *)*MEMORY[0x263EF8348], "ctrl[%zu]: ndiff=%llu nlit=%llu\n", v61, v65.i64[0], v65.i64[1]);
            int64x2_t v65 = v87;
            int64x2_t v63 = v84;
          }
          unint64_t v68 = v65.i64[0];
          if (v65.i64[0])
          {
            do
            {
              unint64_t v69 = v65.i64[0] + v62;
              unint64_t v70 = (v65.i64[0] + v62 - 1) & 0xFFFFFFFFFFFFF000;
              if (v70 <= v62) {
                unint64_t v70 = v62;
              }
              int v71 = v10[(v70 >> 12)] - 1;
              v10[(v70 >> 12)] = v71;
              if (!v71) {
                ++v33;
              }
              unint64_t v72 = v69 - v70;
              int64x2_t v73 = vdupq_n_s64(v69 - v70);
              unint64_t v74 = vsubq_s64(v65, v73).u64[0];
              if (a5 >= 3)
              {
                int64x2_t v88 = v65;
                int64x2_t v85 = v73;
                unint64_t v86 = v74;
                fprintf((FILE *)*MEMORY[0x263EF8348], "ctrl[%zu]: moving %llu bytes from diff to lit (minFree=%d, ndiff=%llu)\n", v61, v72, v33, v74);
                int64x2_t v73 = v85;
                unint64_t v74 = v86;
                int64x2_t v65 = v88;
                int64x2_t v63 = v84;
              }
              int64x2_t v75 = vaddq_s64(v65, v73);
              v65.i64[0] = v74;
              v65.i64[1] = v75.i64[1];
              v67 += v72;
              *(int8x16_t *)unint64_t v64 = vbslq_s8((int8x16_t)vcltzq_s64(v65), (int8x16_t)vsubq_s64(v63, v65), (int8x16_t)v65);
              uint64_t v76 = 0x8000000000000000 - v67;
              if (v67 >= 0) {
                uint64_t v76 = v67;
              }
              v64[1].i64[0] = v76;
              unint64_t v68 = v74;
            }
            while (v33 <= 3 && v74 != 0);
          }
          ++v61;
          BOOL v60 = v33 < 4;
          if (v61 >= v83) {
            break;
          }
          v62 += v68 + v67;
        }
        while (v33 <= 3);
      }
      char v12 = v81;
      if (v60) {
        goto LABEL_96;
      }
    }
    else if (v33 < 4)
    {
LABEL_96:
      char v80 = 4;
      int v17 = "Could not reduce minFree to %d, something is wrong";
      __int16 v18 = 264;
      int v14 = 0;
      goto LABEL_97;
    }
    uint64_t v78 = 0;
    goto LABEL_100;
  }
  int v14 = *__error();
  int v17 = "malloc";
  __int16 v18 = 139;
LABEL_97:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c", (uint64_t)"forceInPlaceControls", v18, 53, v14, v17, v15, v16, v80);
  uint64_t v78 = 0xFFFFFFFFLL;
LABEL_100:
  free(v10);
  free(v12);
  return v78;
}

void *initDiffSegmentVector(void *result)
{
  *uint64_t result = 0;
  result[1] = 0;
  result[2] = 0;
  return result;
}

uint64_t reserveDiffSegmentVector(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 8) >= a2) {
    return 0;
  }
  *(void *)(a1 + 8) = a2;
  size_t v3 = reallocf(*(void **)(a1 + 16), 24 * a2);
  *(void *)(a1 + 16) = v3;
  if (v3) {
    return 0;
  }
  uint64_t v5 = __error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c", (uint64_t)"reserveDiffSegmentVector", 327, 53, *v5, "reallocf", v6, v7, v8);
  return 0xFFFFFFFFLL;
}

__n128 pushDiffSegment(unint64_t *a1, __n128 *a2)
{
  if (!a2[1].n128_u64[0]) {
    return result;
  }
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (*a1 < v5)
  {
LABEL_10:
    unint64_t v8 = a1[2];
    *a1 = v4 + 1;
    size_t v9 = (__n128 *)(v8 + 24 * v4);
    __n128 result = *a2;
    v9[1].n128_u64[0] = a2[1].n128_u64[0];
    *size_t v9 = result;
    return result;
  }
  if (v5) {
    unint64_t v6 = v5 + (v5 >> 1);
  }
  else {
    unint64_t v6 = 64;
  }
  if (!reserveDiffSegmentVector((uint64_t)a1, v6))
  {
    unint64_t v4 = *a1;
    goto LABEL_10;
  }
  return result;
}

uint64_t pushControls(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  if (a3)
  {
    uint64_t v9 = 0;
    size_t v10 = (unint64_t *)(a2 + 16);
    int v11 = 1;
    do
    {
      uint64_t v12 = *(v10 - 2);
      uint64_t v13 = *(v10 - 1);
      if (v12 >= 0) {
        unint64_t v14 = *(v10 - 2);
      }
      else {
        unint64_t v14 = 0x8000000000000000 - v12;
      }
      if (v13 >= 0) {
        unint64_t v15 = *(v10 - 1);
      }
      else {
        unint64_t v15 = 0x8000000000000000 - v13;
      }
      if ((*v10 & 0x8000000000000000) == 0) {
        unint64_t v16 = *v10;
      }
      else {
        unint64_t v16 = 0x8000000000000000 - *v10;
      }
      v21.n128_u64[0] = a5;
      v21.n128_u64[1] = a4;
      unint64_t v22 = v14;
      pushDiffSegment(a1, &v21);
      if (v17) {
        break;
      }
      unint64_t v18 = v14 + a5;
      v21.n128_u64[0] = v18;
      v21.n128_u64[1] = -1;
      unint64_t v22 = v15;
      pushDiffSegment(a1, &v21);
      if (v19) {
        break;
      }
      v10 += 3;
      a4 += v14 + v16;
      a5 = v18 + v15;
      int v11 = ++v9 < a3;
    }
    while (a3 != v9);
  }
  else
  {
    int v11 = 0;
  }
  return (v11 << 31 >> 31);
}

uint64_t mergeDiffSegmentVectors(unint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0;
  }
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  long long v61 = 0uLL;
  unint64_t v62 = 0;
  do
  {
    unint64_t v14 = &a2[3 * v13];
    uint64_t v15 = *v14;
    if (!*v14)
    {
      uint64_t v38 = "empty segment vector";
      __int16 v39 = 429;
LABEL_62:
      int v37 = 0;
LABEL_32:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c", (uint64_t)"mergeDiffSegmentVectors", v39, 53, v37, v38, a7, a8, v56);
      goto LABEL_33;
    }
    unint64_t v16 = (void *)(v14[2] + 16);
    do
    {
      if (v10 + 4 > v11)
      {
        v11 += 0x4000;
        uint64_t v12 = (char *)reallocf(v12, 16 * v11);
        if (!v12)
        {
          int v37 = *__error();
          uint64_t v38 = "malloc";
          __int16 v39 = 437;
          goto LABEL_32;
        }
      }
      uint64_t v17 = *(v16 - 2);
      if (*(v16 - 1) == -1)
      {
        uint64_t v21 = *v16 + v17;
        uint64_t v20 = v10 + 1;
        unint64_t v22 = &v12[16 * v10];
        *(void *)unint64_t v22 = v17;
        *((void *)v22 + 1) = 1;
        int v19 = &v12[16 * v10 + 16];
        *(void *)int v19 = v21;
        int v18 = -1;
      }
      else
      {
        int v18 = 0;
        int v19 = &v12[16 * v10];
        *(void *)int v19 = v17;
        uint64_t v20 = v10;
      }
      *((_DWORD *)v19 + 2) = v18;
      *((_DWORD *)v19 + 3) = 0;
      uint64_t v10 = v20 + 1;
      v16 += 3;
      --v15;
    }
    while (v15);
    ++v13;
  }
  while (v13 != a1);
  uint64_t v23 = a2[2] + 24 * *a2;
  size_t v24 = v20 + 2;
  unint64_t v25 = &v12[16 * v10];
  *(void *)unint64_t v25 = *(void *)(v23 - 8) + *(void *)(v23 - 24);
  *((void *)v25 + 1) = 0;
  qsort(v12, v24, 0x10uLL, (int (__cdecl *)(const void *, const void *))mergeDiffSegmentEventCompareProc);
  if (v24)
  {
    size_t v26 = 0;
    unint64_t v27 = 0;
    int v28 = 0;
    while (1)
    {
      int v29 = 0;
      uint64_t v30 = *(void *)&v12[16 * v26];
      if (v24 <= v26 + 1) {
        size_t v31 = v26 + 1;
      }
      else {
        size_t v31 = v24;
      }
      unint64_t v32 = &v12[16 * v26 + 8];
      while (*((void *)v32 - 1) == v30)
      {
        int v33 = *(_DWORD *)v32;
        v32 += 16;
        v29 += v33;
        if (v31 == ++v26)
        {
          size_t v26 = v31;
          break;
        }
      }
      if (v29 | v28)
      {
        if (!v29) {
          goto LABEL_28;
        }
        if (!v28)
        {
          unint64_t v36 = &v12[16 * v27];
          *(void *)unint64_t v36 = v30;
          *((_DWORD *)v36 + 2) = 1;
          ++v27;
        }
        v28 += v29;
        if (v28) {
          goto LABEL_28;
        }
        int v34 = -1;
      }
      else
      {
        int v34 = 0;
      }
      int v28 = 0;
      uint64_t v35 = &v12[16 * v27];
      *(void *)uint64_t v35 = v30;
      *((_DWORD *)v35 + 2) = v34;
      ++v27;
LABEL_28:
      if (v26 >= v24) {
        goto LABEL_39;
      }
    }
  }
  unint64_t v27 = 0;
LABEL_39:
  uint64_t v42 = 0;
  if (a1 <= 1) {
    uint64_t v43 = 1;
  }
  else {
    uint64_t v43 = a1;
  }
  uint64_t v56 = v43;
  while (1)
  {
    unint64_t v44 = &a2[3 * v42];
    unint64_t v45 = *v44;
    unint64_t v58 = v44[2];
    if (reserveDiffSegmentVector((uint64_t)&v61, v27)) {
      break;
    }
    uint64_t v57 = v42;
    if (v27)
    {
      uint64_t v46 = 0;
      unint64_t v47 = 0;
      int v48 = 0;
      unint64_t v49 = 0;
      while (1)
      {
        uint64_t v50 = (unint64_t *)&v12[16 * v46];
        unint64_t v51 = *v50;
        if (v49 < v45)
        {
          int v52 = (void *)(v58 + 16 + 24 * v49);
          while (*v52 + *(v52 - 2) < v51)
          {
            v52 += 3;
            if (v45 == ++v49) {
              goto LABEL_61;
            }
          }
        }
        if (v49 == v45) {
          break;
        }
        if (v46)
        {
          if (v48) {
            unint64_t v53 = -1;
          }
          else {
            unint64_t v53 = *(void *)(v58 + 24 * v49 + 8) + v47 - *(void *)(v58 + 24 * v49);
          }
          v59.n128_u64[0] = v47;
          v59.n128_u64[1] = v53;
          unint64_t v60 = v51 - v47;
          pushDiffSegment((unint64_t *)&v61, &v59);
          unint64_t v47 = *v50;
        }
        else
        {
          unint64_t v47 = *v50;
        }
        v48 += *(_DWORD *)&v12[16 * v46++ + 8];
        if (v46 == v27) {
          goto LABEL_59;
        }
      }
LABEL_61:
      uint64_t v38 = "no overlapping segment found";
      __int16 v39 = 539;
      goto LABEL_62;
    }
LABEL_59:
    uint64_t v54 = v61;
    unint64_t v55 = reallocToFit(v62, 24 * v61);
    *((void *)&v61 + 1) = v54;
    unint64_t v62 = v55;
    free((void *)v44[2]);
    *(_OWORD *)unint64_t v44 = v61;
    v44[2] = (unint64_t)v62;
    unint64_t v62 = 0;
    long long v61 = 0uLL;
    uint64_t v42 = v57 + 1;
    if (v57 + 1 == v56)
    {
      uint64_t v40 = 0;
      goto LABEL_34;
    }
  }
LABEL_33:
  uint64_t v40 = 0xFFFFFFFFLL;
LABEL_34:
  free(v12);
  free(v62);
  return v40;
}

uint64_t mergeDiffSegmentEventCompareProc(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < *(void *)a2) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)a2 >= *(void *)a1) {
    return (*(_DWORD *)(a1 + 8) - *(_DWORD *)(a2 + 8));
  }
  return 1;
}

uint64_t getComboControlsFromMergedDiffSegmentVectors(char *a1, uint64_t *a2, void *a3, uint64_t *a4)
{
  if (!a1)
  {
    uint64_t v16 = 0;
LABEL_39:
    uint64_t v39 = 0;
    goto LABEL_40;
  }
  size_t v7 = (size_t)a1;
  uint64_t v8 = *a2;
  uint64_t v9 = a1 + 2;
  uint64_t v10 = (char *)calloc((size_t)&v9[(void)v9 * *a2], 8uLL);
  if (v10)
  {
    unint64_t v11 = calloc(v7, 8uLL);
    if (v11)
    {
      if (v8)
      {
        uint64_t v12 = 0;
        uint64_t v15 = a2[2];
        unint64_t v14 = a2 + 2;
        uint64_t v13 = v15;
        uint64_t v16 = 1;
        while (1)
        {
          uint64_t v17 = (uint64_t *)&v10[8 * v16 * (void)v9];
          int v18 = (uint64_t *)&v10[8 * (v16 - 1) * (void)v9];
          uint64_t v19 = *(void *)(v13 + 24 * v12 + 16);
          if (*(void *)(v13 + 24 * v12 + 8) == -1)
          {
            if (v19 < 0) {
              uint64_t v19 = 0x8000000000000000 - v19;
            }
            if (!v18[1])
            {
              v18[1] = v19;
              goto LABEL_25;
            }
            v17[1] = v19;
          }
          else
          {
            uint64_t v20 = (uint64_t *)&v10[8 * (void)v9 * (v16 - 1) + 16];
            int v21 = 1;
            unint64_t v22 = v14;
            uint64_t v23 = v11;
            size_t v24 = v7;
            do
            {
              uint64_t v25 = *v22;
              v22 += 3;
              uint64_t v26 = *(void *)(v25 + 24 * v12 + 8);
              uint64_t v27 = v26 - *v23;
              if (v26 != *v23) {
                int v21 = 0;
              }
              *v23++ = v26 + v19;
              uint64_t v28 = 0x8000000000000000 - v27;
              if (v27 >= 0) {
                uint64_t v28 = v27;
              }
              *v20++ = v28;
              --v24;
            }
            while (v24);
            if (v21)
            {
              uint64_t v29 = v18[1];
              if (v29 < 0) {
                uint64_t v29 = 0x8000000000000000 - v29;
              }
              if (!v29)
              {
                unint64_t v31 = *v18;
                if (*v18 < 0) {
                  unint64_t v31 = 0x8000000000000000 - *v18;
                }
                BOOL v32 = __OFADD__(v31, v19);
                uint64_t v33 = v31 + v19;
                if (v33 < 0 != v32) {
                  uint64_t v33 = 0x8000000000000000 - v33;
                }
                uint64_t *v18 = v33;
                goto LABEL_25;
              }
            }
            uint64_t v30 = 0x8000000000000000 - v19;
            if (v19 >= 0) {
              uint64_t v30 = v19;
            }
            *uint64_t v17 = v30;
          }
          ++v16;
LABEL_25:
          if (++v12 == v8) {
            goto LABEL_38;
          }
        }
      }
      uint64_t v16 = 1;
LABEL_38:
      free(v11);
      a1 = (char *)reallocToFit(v10, 8 * (void)v9 * v16);
      goto LABEL_39;
    }
    int v34 = *__error();
    int v37 = "calloc ipos";
    __int16 v38 = 600;
  }
  else
  {
    int v34 = *__error();
    int v37 = "calloc controls";
    __int16 v38 = 596;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c", (uint64_t)"getComboControlsFromMergedDiffSegmentVectors", v38, 53, v34, v37, v35, v36, v41);
  free(v10);
  a1 = 0;
  uint64_t v16 = 0;
  uint64_t v39 = 0xFFFFFFFFLL;
LABEL_40:
  *a3 = a1;
  *a4 = v16;
  return v39;
}

uint64_t decodeStreamHLCFromINO(void *a1, unint64_t a2, unint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v12 = a1[147];
  if (v12 && (uint64_t v13 = (unint64_t *)a1[149], *v13 < a2))
  {
    if (v12 < 2)
    {
      uint64_t v14 = 1;
LABEL_10:
      unint64_t v18 = a1[148];
      if (v12 >= v18)
      {
        uint64_t v19 = 2 * v18;
        if (!v18) {
          uint64_t v19 = 32;
        }
        a1[148] = v19;
        if ((unint64_t)(32 * v19) >= 0x2000000001)
        {
          *__error() = 12;
LABEL_31:
          a1[149] = 0;
          unint64_t v31 = __error();
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamHLCFromINO", 146, 61, *v31, "malloc", v32, v33, v34);
          a1[147] = 0;
          a1[148] = 0;
          return -1;
        }
        uint64_t v20 = (void *)a1[149];
        int v21 = realloc(v20, 32 * v19);
        if (!v21)
        {
          free(v20);
          goto LABEL_31;
        }
        a1[149] = v21;
        unint64_t v12 = a1[147];
      }
      uint64_t v22 = v14;
      unint64_t v23 = v12 - v14;
      if (v23)
      {
        memmove((void *)(a1[149] + 32 * v14 + 32), (const void *)(a1[149] + 32 * v14), 32 * v23);
        uint64_t v22 = a1[147];
      }
      a1[147] = v22 + 1;
      uint64_t v15 = a1[149];
      uint64_t v24 = v15 + 32 * v14;
      *(void *)uint64_t v24 = a2;
      *(void *)(v24 + 24) = v22;
      *(int64x2_t *)(v24 + 8) = vdupq_n_s64(a3);
      goto LABEL_20;
    }
    uint64_t v28 = 0;
    unint64_t v29 = a1[147];
    uint64_t v14 = v29;
    do
    {
      uint64_t v30 = v28 + (v29 >> 1);
      if (v13[4 * v30] >= a2) {
        uint64_t v14 = v30;
      }
      else {
        uint64_t v28 = v30;
      }
      unint64_t v29 = v14 - v28;
    }
    while ((unint64_t)(v14 - v28) > 1);
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (v14 == v12) {
    goto LABEL_10;
  }
  uint64_t v15 = a1[149];
  if (*(void *)(v15 + 32 * v14) != a2) {
    goto LABEL_10;
  }
  if (*(void *)(v15 + 32 * v14 + 8) == a3)
  {
LABEL_20:
    uint64_t v25 = v15 + 32 * v14;
    unint64_t v26 = *(void *)(v25 + 16) - 1;
    *(void *)(v25 + 16) = v26;
    if (v26 < a3)
    {
      *a4 = v26 == 0;
      return *(void *)(v25 + 24);
    }
    uint64_t v16 = "invalid nlink";
    __int16 v17 = 165;
    goto LABEL_23;
  }
  uint64_t v16 = "nlink mismatch";
  __int16 v17 = 163;
LABEL_23:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamHLCFromINO", v17, 61, 0, v16, a7, a8, v34);
  return -1;
}

void decodeStreamAbort(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 1132))
  {
    *(_DWORD *)(a1 + 1132) = 1;
    AAByteStreamCancel(*(AAByteStream *)(a1 + 8));
  }
}

uint64_t aaByteStreamSimulate(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[11];
  if (v1) {
    return v1(*a1);
  }
  else {
    return -1;
  }
}

uint64_t aaByteStreamPCWriteProc(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[3];
  if (v1) {
    return v1(*a1);
  }
  else {
    return -1;
  }
}

uint64_t aaFileStreamGetFD(unsigned int **a1)
{
  unint64_t v1 = (uint64_t (*)(int *))a1[1];
  if (v1 == aaFileStreamClose || (char *)v1 == (char *)aaTempFileStreamClose) {
    return **a1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t aaTempFileStreamClose(char *a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)a1;
    if ((v2 & 0x80000000) == 0)
    {
      close(v2);
      unlink(a1 + 12);
    }
    free(a1);
  }
  return 0;
}

ssize_t AAByteStreamPWrite(AAByteStream s, const void *buf, size_t nbyte, off_t offset)
{
  unint64_t v4 = (uint64_t (*)(void, const void *, size_t, off_t))*((void *)s + 5);
  if (v4) {
    return v4(*(void *)s, buf, nbyte, offset);
  }
  else {
    return -1;
  }
}

ssize_t AAByteStreamPRead(AAByteStream s, void *buf, size_t nbyte, off_t offset)
{
  unint64_t v4 = (uint64_t (*)(void, void *, size_t, off_t))*((void *)s + 4);
  if (v4) {
    return v4(*(void *)s, buf, nbyte, offset);
  }
  else {
    return -1;
  }
}

off_t AAByteStreamSeek(AAByteStream s, off_t offset, int whence)
{
  size_t v3 = (uint64_t (*)(void, off_t, void))*((void *)s + 6);
  if (v3) {
    return v3(*(void *)s, offset, *(void *)&whence);
  }
  else {
    return -1;
  }
}

void AAByteStreamCancel(AAByteStream s)
{
  unint64_t v1 = (void (*)(void))*((void *)s + 7);
  if (v1) {
    v1(*(void *)s);
  }
}

uint64_t AAByteStreamCloseWithState(uint64_t (**a1)(void))
{
  if (a1)
  {
    int v2 = a1[12];
    size_t v3 = *a1;
    if (v2)
    {
      if (v3)
      {
        uint64_t v4 = v2();
LABEL_8:
        uint64_t v5 = v4;
LABEL_10:
        free(a1);
        return v5;
      }
    }
    else if (v3)
    {
      uint64_t v4 = a1[1]();
      goto LABEL_8;
    }
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  return 0;
}

uint64_t AAByteStreamFlush(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[9];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t AAByteStreamTruncate(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[8];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t AAByteStreamPReadAsync(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[10];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t aaFileStreamWrite(int *a1, const void *a2, size_t a3)
{
  if (a1[2]) {
    return -1;
  }
  ssize_t v3 = write(*a1, a2, a3);
  if (v3 < 0) {
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"aaFileStreamWrite", 104, 17, "aaFileStreamWrite err=%zd buf=%p n=%zu", v4, v5, v6, v3);
  }
  return v3;
}

uint64_t aaFileStreamPRead(int *a1, void *a2, size_t a3, off_t a4)
{
  if (a1[2]) {
    return -1;
  }
  ssize_t v4 = pread(*a1, a2, a3, a4);
  if (v4 < 0) {
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"aaFileStreamPRead", 116, 17, "aaFileStreamPRead err=%zd buf=%p n=%zu off=%llu", v5, v6, v7, v4);
  }
  return v4;
}

uint64_t aaFileStreamPWrite(int *a1, const void *a2, size_t a3, off_t a4)
{
  if (a1[2]) {
    return -1;
  }
  ssize_t v4 = pwrite(*a1, a2, a3, a4);
  if (v4 < 0) {
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"aaFileStreamPWrite", 128, 17, "aaFileStreamPWrite err=%zd buf=%p n=%zu off=%llu", v5, v6, v7, v4);
  }
  return v4;
}

uint64_t aaFileStreamAbort(uint64_t result)
{
  *(_DWORD *)(result + 8) = 1;
  return result;
}

off_t aaFileStreamSeek(int *a1, off_t a2, int a3)
{
  if (a1[2]) {
    return -1;
  }
  else {
    return lseek(*a1, a2, a3);
  }
}

uint64_t aaFileStreamTruncate(int *a1, off_t a2)
{
  if (a1[2]) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ftruncate(*a1, a2);
  }
}

uint64_t aaFileStreamFlush(int *a1)
{
  if (!a1[2])
  {
    uint64_t result = fsync(*a1);
    if (!result) {
      return result;
    }
    int v2 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"aaFileStreamFlush", 151, 17, *v2, "fsync", v3, v4, vars0);
  }
  return 0xFFFFFFFFLL;
}

AAByteStream AATempFileStreamOpen(void)
{
  return (AAByteStream)AATempFileStreamOpenWithDirectory(0);
}

void *AATempFileStreamOpenWithDirectory(const char *a1)
{
  int v2 = calloc(1uLL, 0x68uLL);
  uint64_t v3 = (char *)malloc(0x40CuLL);
  uint64_t v4 = v3;
  if (!v2 || !v3)
  {
    int v9 = *__error();
    uint64_t v7 = "malloc";
    __int16 v8 = 447;
LABEL_16:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AATempFileStreamOpenWithDirectory", v8, 17, v9, v7, v5, v6, v12);
    free(v2);
    free(v4);
    return 0;
  }
  memset_s(v3, 0x40CuLL, 0, 0x40CuLL);
  if (a1)
  {
    memset(&v13, 0, sizeof(v13));
    if (!realpath_DARWIN_EXTSN(a1, v4 + 12) || stat(v4 + 12, &v13) || (v13.st_mode & 0xF000) != 0x4000)
    {
      char v12 = (char)a1;
      uint64_t v7 = "invalid temp_dir: %s";
      __int16 v8 = 457;
LABEL_15:
      int v9 = 0;
      goto LABEL_16;
    }
  }
  else if ((getTempDir(v4 + 12, 0x400uLL) & 0x80000000) != 0)
  {
    uint64_t v7 = "get temp dir";
    __int16 v8 = 462;
    goto LABEL_15;
  }
  if ((unint64_t)__strlcat_chk() >= 0x400)
  {
    char v12 = (_BYTE)v4 + 12;
    uint64_t v7 = "Invalid temp dir path: %s";
    __int16 v8 = 464;
    goto LABEL_15;
  }
  int v10 = mkostemp(v4 + 12, 0x1000000);
  *(_DWORD *)uint64_t v4 = v10;
  if (v10 < 0)
  {
    int v9 = *__error();
    uint64_t v7 = "mkostemp";
    __int16 v8 = 466;
    goto LABEL_16;
  }
  *int v2 = v4;
  v2[1] = aaTempFileStreamClose;
  v2[2] = aaFileStreamRead;
  v2[3] = aaFileStreamWrite;
  v2[4] = aaFileStreamPRead;
  v2[5] = aaFileStreamPWrite;
  v2[7] = aaFileStreamAbort;
  v2[6] = aaFileStreamSeek;
  v2[8] = aaFileStreamTruncate;
  v2[9] = aaFileStreamFlush;
  return v2;
}

void *AAMagicInputStreamOpen(void *a1, size_t a2, void *a3, size_t *a4)
{
  __int16 v8 = calloc(1uLL, 0x68uLL);
  int v9 = malloc(0x18uLL);
  int v10 = v9;
  if (!v8 || !v9)
  {
    int v11 = *__error();
    uint64_t v14 = "malloc";
    __int16 v15 = 552;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AAMagicInputStreamOpen", v15, 17, v11, v14, v12, v13, v21);
    free(v8);
    free(v10);
    return 0;
  }
  memset_s(v9, 0x18uLL, 0, 0x18uLL);
  *int v10 = a1;
  if (a2 >= 0x2000000001)
  {
    *__error() = 12;
    v10[2] = 0;
LABEL_10:
    int v11 = *__error();
    uint64_t v14 = "malloc";
    __int16 v15 = 558;
    goto LABEL_11;
  }
  uint64_t v16 = malloc(a2);
  v10[2] = v16;
  if (!v16) {
    goto LABEL_10;
  }
  __int16 v17 = (uint64_t (*)(void, void *, size_t))a1[2];
  if (!v17 || (size_t v18 = v17(*a1, v16, a2), (v18 & 0x8000000000000000) != 0))
  {
    uint64_t v14 = "reading magic bytes\n";
    __int16 v15 = 562;
    int v11 = 0;
    goto LABEL_11;
  }
  size_t v19 = v18;
  v10[1] = v18;
  memcpy(a3, (const void *)v10[2], v18);
  *a4 = v19;
  *__int16 v8 = v10;
  v8[1] = aaMagicStreamClose;
  v8[2] = aaMagicStreamRead;
  v8[7] = aaMagicStreamAbort;
  return v8;
}

uint64_t aaMagicStreamClose(void **a1)
{
  return 0;
}

uint64_t aaMagicStreamRead(uint64_t **a1, char *__dst, size_t a3)
{
  size_t v3 = a3;
  uint64_t v6 = a1[1];
  if (v6)
  {
    uint64_t v7 = 0;
    if (!a3) {
      return v7;
    }
    do
    {
      if ((unint64_t)v6 >= v3) {
        size_t v8 = v3;
      }
      else {
        size_t v8 = (size_t)v6;
      }
      memcpy(__dst, a1[2], v8);
      int v9 = a1[1];
      if ((unint64_t)v9 > v8)
      {
        memmove(a1[2], (char *)a1[2] + v8, (size_t)v9 - v8);
        int v9 = a1[1];
      }
      __dst += v8;
      v3 -= v8;
      v7 += v8;
      uint64_t v6 = (uint64_t *)((char *)v9 - v8);
      a1[1] = v6;
      if (v6) {
        BOOL v10 = v3 == 0;
      }
      else {
        BOOL v10 = 1;
      }
    }
    while (!v10);
    if (!v3) {
      return v7;
    }
    int v11 = (uint64_t (*)(uint64_t, char *, size_t))(*a1)[2];
    if (v11)
    {
      uint64_t v12 = v11(**a1, __dst, v3);
      if (v12 < 0) {
        return v12;
      }
      v7 += v12;
      return v7;
    }
    return -1;
  }
  uint64_t v13 = (uint64_t (*)(uint64_t))(*a1)[2];
  if (!v13) {
    return -1;
  }
  uint64_t v14 = **a1;

  return v13(v14);
}

void **aaMagicStreamAbort(void **result)
{
  unint64_t v1 = (uint64_t (*)(void))(*result)[7];
  if (v1) {
    return (void **)v1(**result);
  }
  return result;
}

void *AATeeOutputStreamOpen(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = calloc(1uLL, 0x68uLL);
  uint64_t v5 = malloc(0x10uLL);
  uint64_t v6 = v5;
  if (v5 && (memset_s(v5, 0x10uLL, 0, 0x10uLL), v4))
  {
    *uint64_t v6 = a1;
    v6[1] = a2;
    *uint64_t v4 = v6;
    v4[1] = aaTeeStreamClose;
    v4[3] = aaTeeStreamWrite;
    v4[5] = aaTeeStreamPWrite;
    v4[7] = aaTeeStreamAbort;
  }
  else
  {
    uint64_t v7 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AATeeOutputStreamOpen", 591, 17, *v7, "malloc", v8, v9, v11);
    free(v4);
    free(v6);
    return 0;
  }
  return v4;
}

uint64_t aaTeeStreamClose(void *a1)
{
  return 0;
}

uint64_t aaTeeStreamWrite(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *a1;
  if (*(void *)(*a1 + 24))
  {
    uint64_t v7 = 0;
    if (!a3)
    {
      if (*(void *)(a1[1] + 24)) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = -1;
      }
      goto LABEL_20;
    }
    uint64_t v8 = a2;
    uint64_t v9 = a3;
    while (1)
    {
      uint64_t v10 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v6 + 24))(*(void *)v6, v8, v9);
      if (v10 < 1) {
        break;
      }
      v8 += v10;
      v7 += v10;
      v9 -= v10;
      if (!v9) {
        goto LABEL_12;
      }
    }
    uint64_t v7 = v10;
  }
  else
  {
    uint64_t v7 = -1;
  }
LABEL_12:
  uint64_t v12 = a1[1];
  if (*(void *)(v12 + 24))
  {
    uint64_t v11 = 0;
    if (a3)
    {
      uint64_t v13 = a3;
      while (1)
      {
        uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v12 + 24))(*(void *)v12, v4, v13);
        if (v14 < 1) {
          break;
        }
        v4 += v14;
        v11 += v14;
        v13 -= v14;
        if (!v13) {
          goto LABEL_20;
        }
      }
      uint64_t v11 = v14;
    }
  }
  else
  {
    uint64_t v11 = -1;
  }
LABEL_20:
  if (v11 == a3 && v7 == a3) {
    return a3;
  }
  else {
    return -1;
  }
}

uint64_t aaTeeStreamPWrite(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v8 = *a1;
  if (*(void *)(*a1 + 40))
  {
    uint64_t v9 = 0;
    if (!a3)
    {
      if (*(void *)(a1[1] + 40)) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = -1;
      }
      goto LABEL_20;
    }
    uint64_t v10 = a2;
    uint64_t v11 = a4;
    uint64_t v12 = a3;
    while (1)
    {
      uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v8 + 40))(*(void *)v8, v10, v12, v11);
      if (v13 < 1) {
        break;
      }
      v10 += v13;
      v9 += v13;
      v11 += v13;
      v12 -= v13;
      if (!v12) {
        goto LABEL_12;
      }
    }
    uint64_t v9 = v13;
  }
  else
  {
    uint64_t v9 = -1;
  }
LABEL_12:
  uint64_t v15 = a1[1];
  if (*(void *)(v15 + 40))
  {
    uint64_t v14 = 0;
    if (a3)
    {
      uint64_t v16 = a3;
      while (1)
      {
        uint64_t v17 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v15 + 40))(*(void *)v15, v6, v16, v4);
        if (v17 < 1) {
          break;
        }
        v6 += v17;
        v14 += v17;
        v4 += v17;
        v16 -= v17;
        if (!v16) {
          goto LABEL_20;
        }
      }
      uint64_t v14 = v17;
    }
  }
  else
  {
    uint64_t v14 = -1;
  }
LABEL_20:
  if (v14 == a3 && v9 == a3) {
    return a3;
  }
  else {
    return -1;
  }
}

void **aaTeeStreamAbort(void **result)
{
  unint64_t v1 = result;
  int v2 = (uint64_t (*)(void))(*result)[7];
  if (v2) {
    uint64_t result = (void **)v2(**result);
  }
  size_t v3 = v1[1];
  uint64_t v4 = (uint64_t (*)(uint64_t))v3[7];
  if (v4)
  {
    uint64_t v5 = *v3;
    return (void **)v4(v5);
  }
  return result;
}

AAByteStream AACustomByteStreamOpen(void)
{
  v0 = (AAByteStream_impl *)calloc(1uLL, 0x68uLL);
  if (!v0)
  {
    unint64_t v1 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AACustomByteStreamOpen", 619, 17, *v1, "malloc", v2, v3, v5);
  }
  return v0;
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
  *(void *)s = data;
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
  *((void *)s + 1) = proc;
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
  *((void *)s + 2) = proc;
}

void AACustomByteStreamSetPReadProc(AAByteStream s, AAByteStreamPReadProc proc)
{
  *((void *)s + 4) = proc;
}

void AACustomByteStreamSetWriteProc(AAByteStream s, AAByteStreamWriteProc proc)
{
  *((void *)s + 3) = proc;
}

void AACustomByteStreamSetPWriteProc(AAByteStream s, AAByteStreamPWriteProc proc)
{
  *((void *)s + 5) = proc;
}

void AACustomByteStreamSetSeekProc(AAByteStream s, AAByteStreamSeekProc proc)
{
  *((void *)s + 6) = proc;
}

void AACustomByteStreamSetCancelProc(AAByteStream s, AAByteStreamCancelProc proc)
{
  *((void *)s + 7) = proc;
}

AAByteStream_impl *AAAFSCStreamOpen(int a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (AAByteStream_impl *)afscStreamOpen(a1, a2, a3, a4, a5, a6, a7, a8);
  if (!v11)
  {
    uint64_t v12 = "alloc stream";
    __int16 v13 = 1041;
    goto LABEL_5;
  }
  if ((stripAFSC(a1) & 0x80000000) != 0)
  {
    uint64_t v12 = "clearing file";
    __int16 v13 = 1043;
LABEL_5:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpen", v13, 55, 0, v12, v9, v10, v15);
    AAByteStreamClose(v11);
    return 0;
  }
  return v11;
}

void *afscStreamOpen(int a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2 || a2 >= 4194304001)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamOpen", 959, 55, 0, "invalid uncompressed size", a7, a8, v51);
    goto LABEL_7;
  }
  if (a3 < 0xF && ((0x7F99u >> a3) & 1) != 0)
  {
    int v22 = dword_214B13154[a3];
    uint64_t v17 = calloc(1uLL, 0x68uLL);
    unint64_t v23 = malloc(0x80uLL);
    uint64_t v18 = (uint64_t)v23;
    if (v23 && (memset_s(v23, 0x80uLL, 0, 0x80uLL), v17))
    {
      *(_DWORD *)uint64_t v18 = a1;
      *(void *)(v18 + 8) = a4;
      *(void *)(v18 + 16) = a2;
      *(_DWORD *)(v18 + 32) = v22;
      if ((unint64_t)(a2 + 0xFFFF) >> 48)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"chunkCount", 128, 55, 0, "invalid uncompressed size", v24, v25, v51);
        size_t v26 = 0;
        *(_DWORD *)(v18 + 44) = -1;
      }
      else
      {
        unint64_t v32 = (unint64_t)(a2 + 0xFFFF) >> 16;
        *(_DWORD *)(v18 + 44) = v32;
        size_t v26 = v32 + 1;
      }
      uint64_t v33 = calloc(v26, 4uLL);
      *(void *)(v18 + 48) = v33;
      if (v33)
      {
        compression_algorithm v36 = 1285;
        switch(v22)
        {
          case 4:
            goto LABEL_24;
          case 7:
          case 8:
            compression_algorithm v36 = 2304;
            goto LABEL_24;
          case 10:
            goto LABEL_28;
          case 11:
          case 12:
            compression_algorithm v36 = COMPRESSION_LZFSE;
            goto LABEL_24;
          case 13:
          case 14:
            compression_algorithm v36 = COMPRESSION_LZBITMAP;
            goto LABEL_24;
          default:
            compression_algorithm v36 = -1;
LABEL_24:
            size_t v37 = compression_encode_scratch_buffer_size(v36);
            if (!v37) {
              goto LABEL_28;
            }
            if (v37 >= 0x2000000001)
            {
              *__error() = 12;
              *(void *)(v18 + 56) = 0;
LABEL_50:
              int v27 = *__error();
              uint64_t v30 = "malloc";
              __int16 v31 = 1002;
              break;
            }
            __int16 v38 = malloc(v37);
            *(void *)(v18 + 56) = v38;
            if (!v38) {
              goto LABEL_50;
            }
LABEL_28:
            size_t v39 = *(void *)(v18 + 72);
            if (v39 >> 16) {
              goto LABEL_38;
            }
            uint64_t v40 = (void *)(v18 + 64);
            do
            {
              size_t v41 = (v39 >> 1) + v39;
              if (((v39 >> 1) & v39) != 0) {
                size_t v41 = ((v39 >> 1) & v39) + v39;
              }
              if (v39) {
                size_t v39 = v41;
              }
              else {
                size_t v39 = 0x4000;
              }
            }
            while (v39 < 0x10000);
            uint64_t v42 = *(void **)(v18 + 80);
            uint64_t v43 = realloc(v42, v39);
            if (!v43) {
              goto LABEL_51;
            }
            *(void *)(v18 + 72) = v39;
            *(void *)(v18 + 80) = v43;
LABEL_38:
            size_t v44 = *(void *)(v18 + 96);
            if (v44 >= 0x80008) {
              goto LABEL_48;
            }
            uint64_t v40 = (void *)(v18 + 88);
            do
            {
              size_t v45 = (v44 >> 1) + v44;
              if (((v44 >> 1) & v44) != 0) {
                size_t v45 = ((v44 >> 1) & v44) + v44;
              }
              if (v44) {
                size_t v44 = v45;
              }
              else {
                size_t v44 = 0x4000;
              }
            }
            while (v44 < 0x80008);
            uint64_t v42 = *(void **)(v18 + 104);
            uint64_t v46 = realloc(v42, v44);
            if (v46)
            {
              *(void *)(v18 + 96) = v44;
              *(void *)(v18 + 104) = v46;
LABEL_48:
              if ((v22 - 3) > 0xB) {
                unsigned __int8 v47 = 0;
              }
              else {
                unsigned __int8 v47 = byte_214B13190[v22 - 3];
              }
              *(unsigned char *)(v18 + 36) = v47;
              uint64_t v48 = *(unsigned int *)(v18 + 44);
              uint64_t v49 = 8 * v48 + 264;
              unint64_t v50 = 4 * v48 + 4;
              if (a3 < 7) {
                unint64_t v50 = v49;
              }
              if (v50 < 0xFFFFFFFF)
              {
                **(_DWORD **)(v18 + 48) = v50;
                *uint64_t v17 = v18;
                v17[1] = afscStreamClose;
                v17[7] = afscStreamCancel;
                v17[3] = afscStreamWrite;
                v17[12] = afscStreamCloseWithState;
                return v17;
              }
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkHeaderSize", 146, 55, 0, "invalid file size", v34, v35, v51);
              **(_DWORD **)(v18 + 48) = -1;
              __int16 v31 = 1010;
              int v27 = 0;
              uint64_t v30 = "invalid file size";
            }
            else
            {
LABEL_51:
              free(v42);
              *uint64_t v40 = 0;
              v40[1] = 0;
              v40[2] = 0;
              int v27 = *__error();
              uint64_t v30 = "malloc";
              __int16 v31 = 1005;
            }
            break;
        }
      }
      else
      {
        int v27 = *__error();
        uint64_t v30 = "malloc";
        __int16 v31 = 997;
      }
    }
    else
    {
      int v27 = *__error();
      uint64_t v30 = "malloc";
      __int16 v31 = 988;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamOpen", v31, 55, v27, v30, v28, v29, v51);
    goto LABEL_8;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamOpen", 981, 55, 0, "invalid compression type: %d", a7, a8, a3);
LABEL_7:
  uint64_t v17 = 0;
  uint64_t v18 = 0;
LABEL_8:
  afscStreamClose(v18, v10, v11, v12, v13, v14, v15, v16);
  free(v17);
  return 0;
}

uint64_t stripAFSC(int a1)
{
  memset(&v17, 0, sizeof(v17));
  if (fstat(a1, &v17))
  {
    int v2 = *__error();
    char v5 = "fstat";
    __int16 v6 = 100;
  }
  else
  {
    if ((v17.st_flags & 0x20) == 0 || (fchflags(a1, v17.st_flags & 0xFFFFFFDF) & 0x80000000) == 0)
    {
      int v9 = 1;
      goto LABEL_7;
    }
    int v2 = *__error();
    char v5 = "fchflags UF_COMPRESSED";
    __int16 v6 = 105;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"clearUFCompressedBit", v6, 55, v2, v5, v3, v4, v17.st_dev);
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"stripAFSC", 154, 55, 0, "clearing UF_COMPRESSED", v7, v8, v17.st_dev);
  int v9 = 0;
LABEL_7:
  if ((fgetxattr(a1, "com.apple.ResourceFork", 0, 0, 0, 32) & 0x8000000000000000) == 0
    && fremovexattr(a1, "com.apple.ResourceFork", 32) < 0)
  {
    uint64_t v10 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"stripAFSC", 159, 55, *v10, "fremovexattr", v11, v12, v17.st_dev);
    int v9 = 0;
  }
  if ((fgetxattr(a1, "com.apple.decmpfs", 0, 0, 0, 32) & 0x8000000000000000) == 0
    && fremovexattr(a1, "com.apple.decmpfs", 32) < 0)
  {
    uint64_t v13 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"stripAFSC", 161, 55, *v13, "fremovexattr", v14, v15, v17.st_dev);
    int v9 = 0;
  }
  if (v9) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

AAByteStream_impl *AAAFSCStreamOpenWithMetadata(int a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 > 0xE) {
    goto LABEL_4;
  }
  if (((1 << a3) & 0x2A88) != 0)
  {
    if (a4)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithMetadata", 1060, 55, 0, "invalid resource fork for type", a7, a8, v19);
      goto LABEL_7;
    }
  }
  else if (((1 << a3) & 0x5510) == 0)
  {
LABEL_4:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithMetadata", 1059, 55, 0, "invalid compression_type: %d", a7, a8, a3);
LABEL_7:
    uint64_t v11 = 0;
LABEL_13:
    AAByteStreamClose(v11);
    return 0;
  }
  uint64_t v12 = (AAByteStream_impl *)afscStreamOpen(a1, a2, a3, 0, a5, a6, a7, a8);
  uint64_t v11 = v12;
  if (!v12)
  {
    uint64_t v16 = "alloc stream";
    __int16 v17 = 1064;
    goto LABEL_12;
  }
  uint64_t v15 = *(void *)v12;
  *(_DWORD *)(v15 + 112) = a3;
  *(_DWORD *)(v15 + 116) = a4;
  if ((stripAFSC(a1) & 0x80000000) != 0)
  {
    uint64_t v16 = "clearing file";
    __int16 v17 = 1070;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithMetadata", v17, 55, 0, v16, v13, v14, v19);
    goto LABEL_13;
  }
  return v11;
}

AAByteStream_impl *AAAFSCStreamOpenWithState(int a1, AAByteStream_impl *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v55 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  if (!*((void *)a2 + 2)) {
    goto LABEL_69;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v54;
  uint64_t v13 = 48;
  do
  {
    uint64_t v14 = (*((uint64_t (**)(void, long long *, uint64_t))a2 + 2))(*(void *)a2, v12, v13);
    if (v14 < 0) {
      goto LABEL_69;
    }
    if (!v14) {
      break;
    }
    uint64_t v12 = (long long *)((char *)v12 + v14);
    v11 += v14;
    v13 -= v14;
  }
  while (v13);
  if (v11 < 0)
  {
LABEL_69:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithState", 1088, 55, 0, "loading state", a7, a8, v54);
    uint64_t v20 = 0;
LABEL_76:
    AAByteStreamClose(v20);
    return 0;
  }
  __int16 v17 = (AAByteStream_impl *)afscStreamOpen(a1, *((uint64_t *)&v54 + 1), DWORD2(v55), v54, v15, v16, a7, a8);
  uint64_t v20 = v17;
  if (!v17)
  {
    char v51 = "open AFSC stream";
    __int16 v52 = 1092;
LABEL_75:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithState", v52, 55, 0, v51, v18, v19, v54);
    goto LABEL_76;
  }
  uint64_t v21 = *(void *)v17;
  *(void *)(v21 + 24) = v55;
  *(_DWORD *)(v21 + 40) = HIDWORD(v55);
  *(void *)(v21 + 112) = v56;
  if (!*((void *)a2 + 2)) {
    goto LABEL_74;
  }
  int v22 = *(_DWORD *)(v21 + 44);
  BOOL v23 = __CFADD__(v22, 1);
  unsigned int v24 = v22 + 1;
  if (!v23)
  {
    uint64_t v25 = 0;
    uint64_t v26 = 4 * v24;
    uint64_t v27 = *(void *)(v21 + 48);
    do
    {
      uint64_t v28 = (*((uint64_t (**)(void, uint64_t, uint64_t))a2 + 2))(*(void *)a2, v27, v26);
      if (v28 < 0) {
        goto LABEL_74;
      }
      if (!v28) {
        break;
      }
      v27 += v28;
      v25 += v28;
      v26 -= v28;
    }
    while (v26);
    if (v25 < 0)
    {
LABEL_74:
      char v51 = "loading state";
      __int16 v52 = 1103;
      goto LABEL_75;
    }
  }
  size_t v29 = DWORD2(v56);
  if (!DWORD2(v56)) {
    goto LABEL_41;
  }
  uint64_t v30 = 0;
  __int16 v31 = (unint64_t *)(v21 + 64);
  unint64_t v33 = *(void *)(v21 + 64);
  unint64_t v32 = *(void *)(v21 + 72);
  do
  {
    if (v33 != v32) {
      goto LABEL_28;
    }
    unint64_t v34 = v32 + 0x40000;
    if ((uint64_t)(v32 + 0x40000) < 0) {
      goto LABEL_74;
    }
    if (v32 > 0xFFFFFFFFFFFBFFFFLL)
    {
      unint64_t v33 = v32;
LABEL_28:
      size_t v36 = v32;
      goto LABEL_32;
    }
    do
    {
      while (!v32)
      {
        unint64_t v32 = 0x4000;
        size_t v36 = 0x4000;
        if (v34 <= 0x4000) {
          goto LABEL_30;
        }
      }
      unint64_t v35 = v32 >> 1;
      if ((v32 & (v32 >> 1)) != 0) {
        unint64_t v35 = v32 & (v32 >> 1);
      }
      v32 += v35;
    }
    while (v32 < v34);
    size_t v36 = v32;
    if (v32 >= 0x2000000001)
    {
LABEL_72:
      *__error() = 12;
      goto LABEL_73;
    }
LABEL_30:
    size_t v37 = *(void **)(v21 + 80);
    __int16 v38 = realloc(v37, v36);
    if (!v38)
    {
LABEL_71:
      free(v37);
LABEL_73:
      unint64_t *v31 = 0;
      v31[1] = 0;
      v31[2] = 0;
      goto LABEL_74;
    }
    *(void *)(v21 + 72) = v36;
    *(void *)(v21 + 80) = v38;
    unint64_t v33 = *(void *)(v21 + 64);
LABEL_32:
    if (v36 - v33 >= v29) {
      size_t v39 = v29;
    }
    else {
      size_t v39 = v36 - v33;
    }
    ssize_t v40 = AAByteStreamRead(a2, (void *)(*(void *)(v21 + 80) + v33), v39);
    if (v40 < 0) {
      goto LABEL_74;
    }
    if (!v40) {
      break;
    }
    unint64_t v33 = *v31 + v40;
    if (!__CFADD__(*v31, v40))
    {
      unint64_t v32 = *(void *)(v21 + 72);
      if (v33 <= v32) {
        continue;
      }
    }
    goto LABEL_74;
    unint64_t *v31 = v33;
    v30 += v40;
    v29 -= v40;
  }
  while (v29);
  if (v30 < 0) {
    goto LABEL_74;
  }
LABEL_41:
  size_t v41 = HIDWORD(v56);
  if (HIDWORD(v56))
  {
    uint64_t v42 = 0;
    __int16 v31 = (unint64_t *)(v21 + 88);
    unint64_t v44 = *(void *)(v21 + 88);
    unint64_t v43 = *(void *)(v21 + 96);
    while (1)
    {
      if (v44 == v43)
      {
        unint64_t v45 = v43 + 0x40000;
        if ((uint64_t)(v43 + 0x40000) < 0) {
          goto LABEL_74;
        }
        if (v43 <= 0xFFFFFFFFFFFBFFFFLL)
        {
          do
          {
            while (!v43)
            {
              unint64_t v43 = 0x4000;
              size_t v47 = 0x4000;
              if (v45 <= 0x4000) {
                goto LABEL_56;
              }
            }
            unint64_t v46 = v43 >> 1;
            if ((v43 & (v43 >> 1)) != 0) {
              unint64_t v46 = v43 & (v43 >> 1);
            }
            v43 += v46;
          }
          while (v43 < v45);
          size_t v47 = v43;
          if (v43 >= 0x2000000001) {
            goto LABEL_72;
          }
LABEL_56:
          size_t v37 = *(void **)(v21 + 104);
          uint64_t v48 = realloc(v37, v47);
          if (!v48) {
            goto LABEL_71;
          }
          *(void *)(v21 + 96) = v47;
          *(void *)(v21 + 104) = v48;
          unint64_t v44 = *(void *)(v21 + 88);
          goto LABEL_58;
        }
        unint64_t v44 = v43;
      }
      size_t v47 = v43;
LABEL_58:
      if (v47 - v44 >= v41) {
        size_t v49 = v41;
      }
      else {
        size_t v49 = v47 - v44;
      }
      ssize_t v50 = AAByteStreamRead(a2, (void *)(*(void *)(v21 + 104) + v44), v49);
      if (v50 < 0) {
        goto LABEL_74;
      }
      if (v50)
      {
        unint64_t v44 = *v31 + v50;
        if (__CFADD__(*v31, v50)) {
          goto LABEL_74;
        }
        unint64_t v43 = *(void *)(v21 + 96);
        if (v44 > v43) {
          goto LABEL_74;
        }
        unint64_t *v31 = v44;
        v42 += v50;
        v41 -= v50;
        if (v41) {
          continue;
        }
      }
      if ((v42 & 0x8000000000000000) == 0) {
        break;
      }
      goto LABEL_74;
    }
  }
  if (a3) {
    *a3 = *(void *)(v21 + 24);
  }
  return v20;
}

uint64_t AAAFSCGetMetadata(int a1, _DWORD *a2, _DWORD *a3)
{
  memset(&v17, 0, sizeof(v17));
  __s[0] = 0;
  __s[1] = 0;
  uint64_t v16 = 0;
  if (!fstat(a1, &v17))
  {
    if (statIsCompressed(v17.st_flags))
    {
      if ((loadDecmpfsXattr(a1, a2, &v14, __s) & 0x80000000) != 0)
      {
        int v9 = "loading decmpfs";
        __int16 v10 = 1137;
      }
      else
      {
        if (*a2 <= 0xDu && ((1 << *a2) & 0x2A88) != 0)
        {
          uint64_t v11 = 0;
LABEL_10:
          *a3 = 0;
          goto LABEL_11;
        }
        int v13 = resourceForkSize(a1);
        *a3 = v13;
        if (v13 != -1)
        {
          uint64_t v11 = 0;
          goto LABEL_11;
        }
        int v9 = "invalid resource fork";
        __int16 v10 = 1140;
      }
      int v6 = 0;
      goto LABEL_3;
    }
    uint64_t v11 = 0;
    *a2 = -1;
    goto LABEL_10;
  }
  int v6 = *__error();
  int v9 = "fstat";
  __int16 v10 = 1123;
LABEL_3:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCGetMetadata", v10, 55, v6, v9, v7, v8, v14);
  uint64_t v11 = 0xFFFFFFFFLL;
LABEL_11:
  free(v16);
  memset_s(__s, 0x18uLL, 0, 0x18uLL);
  return v11;
}

uint64_t loadDecmpfsXattr(int a1, _DWORD *a2, void *a3, unint64_t *a4)
{
  *a4 = 0;
  size_t v8 = a4[1];
  if (v8 >> 16)
  {
    unint64_t v12 = 0;
    uint64_t v11 = (char *)a4[2];
  }
  else
  {
    do
    {
      size_t v9 = (v8 >> 1) + v8;
      if (((v8 >> 1) & v8) != 0) {
        size_t v9 = ((v8 >> 1) & v8) + v8;
      }
      if (v8) {
        size_t v8 = v9;
      }
      else {
        size_t v8 = 0x4000;
      }
    }
    while (v8 < 0x10000);
    __int16 v10 = (void *)a4[2];
    uint64_t v11 = (char *)realloc(v10, v8);
    if (!v11)
    {
      free(v10);
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
      stat v17 = "blob reserve";
      __int16 v18 = 255;
      goto LABEL_20;
    }
    a4[1] = v8;
    a4[2] = (unint64_t)v11;
    unint64_t v12 = *a4;
  }
  ssize_t v13 = fgetxattr(a1, "com.apple.decmpfs", &v11[v12], v8 - v12, 0, 32);
  if (v13 < 16 || (unint64_t v16 = *a4 + v13, __CFADD__(*a4, v13)) || v16 > a4[1])
  {
    stat v17 = "invalid/missing decmpfs";
    __int16 v18 = 261;
LABEL_20:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"loadDecmpfsXattr", v18, 55, 0, v17, v14, v15, v23);
    return 0xFFFFFFFFLL;
  }
  *a4 = v16;
  unint64_t v19 = a4[2];
  if (*(_DWORD *)v19 != 1668116582)
  {
    stat v17 = "Invalid decmpfs xattr";
    __int16 v18 = 263;
    goto LABEL_20;
  }
  uint64_t v20 = *(void *)(v19 + 8);
  *a2 = *(_DWORD *)(v19 + 4);
  *a3 = v20;
  unint64_t v21 = v16 - 16;
  if (v16 < 0x10)
  {
    stat v17 = "blob resize";
    __int16 v18 = 268;
    goto LABEL_20;
  }
  if (v16 != 16) {
    memmove((void *)v19, (const void *)(v19 + 16), v16 - 16);
  }
  uint64_t result = 0;
  *a4 = v21;
  return result;
}

unint64_t resourceForkSize(int a1)
{
  unint64_t result = fgetxattr(a1, "com.apple.ResourceFork", 0, 0, 0, 32);
  if ((result & 0x8000000000000000) != 0)
  {
    uint64_t v4 = "Missing resource fork xattr";
    __int16 v5 = 309;
  }
  else
  {
    if (!HIDWORD(result)) {
      return result;
    }
    uint64_t v4 = "Invalid resource fork xattr";
    __int16 v5 = 310;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkSize", v5, 55, 0, v4, v2, v3, vars0);
  return 0xFFFFFFFFLL;
}

uint64_t AAAFSCSetMetadata(int a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(&v43, 0, sizeof(v43));
  unsigned int v41 = 0;
  int v42 = -1;
  uint64_t __s = 0;
  size_t v39 = 0;
  ssize_t v40 = 0;
  if (a2 <= 0xD && ((1 << a2) & 0x2A88) != 0)
  {
    if (a3)
    {
      uint64_t v11 = "invalid resource fork size";
      __int16 v12 = 1169;
LABEL_5:
      int v13 = 0;
LABEL_10:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCSetMetadata", v12, 55, v13, v11, a7, a8, (char)v36);
      uint64_t v15 = 0;
LABEL_11:
      uint64_t v16 = 0xFFFFFFFFLL;
      goto LABEL_12;
    }
    BOOL v14 = 0;
  }
  else
  {
    BOOL v14 = a3 != 0;
  }
  if (fstat(a1, &v43))
  {
    int v13 = *__error();
    uint64_t v11 = "fstat";
    __int16 v12 = 1171;
    goto LABEL_10;
  }
  st_stat size = v43.st_size;
  if ((AAAFSCGetMetadata(a1, &v42, &v41) & 0x80000000) != 0)
  {
    uint64_t v11 = "reading current metadata";
    __int16 v12 = 1175;
    goto LABEL_5;
  }
  BOOL v21 = v42 != -1;
  BOOL v22 = v42 != a2 && v42 != -1;
  if (v42 != a2) {
    BOOL v21 = 0;
  }
  if (v41 <= a3) {
    BOOL v21 = 0;
  }
  if (v22 || v14 && v21)
  {
    if ((decompressToData(a1) & 0x80000000) != 0)
    {
      uint64_t v11 = "decompression failed";
      __int16 v12 = 1188;
      goto LABEL_5;
    }
    unsigned int v41 = 0;
    int v42 = -1;
    if (a2 == -1) {
      goto LABEL_61;
    }
  }
  else
  {
    if (v42 == a2) {
      goto LABEL_61;
    }
    if (v42 != -1)
    {
      uint64_t v11 = "invalid state";
      __int16 v12 = 1200;
      goto LABEL_5;
    }
  }
  uint64_t v15 = AAAFSCStreamOpenWithMetadata(a1, st_size, a2, a3, v19, v20, a7, a8);
  if (!v15)
  {
    unint64_t v34 = "open AFSC stream";
    __int16 v35 = 1202;
LABEL_75:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCSetMetadata", v35, 55, 0, v34, v23, v24, (char)v36);
    goto LABEL_11;
  }
  size_t v25 = 0;
  do
  {
    size_t v26 = (v25 >> 1) + v25;
    if (((v25 >> 1) & v25) != 0) {
      size_t v26 = ((v25 >> 1) & v25) + v25;
    }
    if (v25) {
      size_t v25 = v26;
    }
    else {
      size_t v25 = 0x4000;
    }
  }
  while (v25 < 0x80000);
  uint64_t v27 = (char *)malloc(v25);
  if (!v27)
  {
    uint64_t __s = 0;
    size_t v39 = 0;
    ssize_t v40 = 0;
    unint64_t v34 = "blob alloc";
    __int16 v35 = 1205;
    goto LABEL_75;
  }
  uint64_t v28 = v27;
  size_t v39 = v25;
  ssize_t v40 = v27;
  if (st_size)
  {
    unint64_t v29 = 0;
    size_t v36 = v27;
    unint64_t v37 = st_size;
    while (1)
    {
      uint64_t __s = 0;
      if (v25 >= st_size - v29) {
        size_t v30 = st_size - v29;
      }
      else {
        size_t v30 = v25;
      }
      if (pread(a1, v28, v30, v29) != v30)
      {
LABEL_72:
        unint64_t v34 = "read data";
        __int16 v35 = 1213;
        goto LABEL_75;
      }
      if (v30)
      {
        if (__CFADD__(__s, v30)) {
          goto LABEL_72;
        }
        size_t v25 = v39;
        if (__s + v30 > v39) {
          goto LABEL_72;
        }
        __s += v30;
        if (*((void *)v15 + 3))
        {
          uint64_t v31 = 0;
          size_t v32 = v30;
          while (1)
          {
            uint64_t v33 = (*((uint64_t (**)(void, char *, size_t))v15 + 3))(*(void *)v15, v28, v32);
            if (v33 < 1) {
              break;
            }
            v28 += v33;
            v31 += v33;
            v32 -= v33;
            if (!v32) {
              goto LABEL_57;
            }
          }
          uint64_t v31 = v33;
LABEL_57:
          uint64_t v28 = v36;
          st_stat size = v37;
        }
        else
        {
          uint64_t v31 = -1;
        }
      }
      else
      {
        uint64_t v31 = *((void *)v15 + 3) ? 0 : -1;
      }
      if (v31 != v30) {
        break;
      }
      v29 += v30;
      if (v29 >= st_size) {
        goto LABEL_60;
      }
    }
    unint64_t v34 = "write data";
    __int16 v35 = 1215;
    goto LABEL_75;
  }
LABEL_60:
  if (AAByteStreamClose(v15) < 0)
  {
    uint64_t v11 = "AFSC stream close";
    __int16 v12 = 1222;
    goto LABEL_5;
  }
LABEL_61:
  if ((AAAFSCGetMetadata(a1, &v42, &v41) & 0x80000000) != 0)
  {
    uint64_t v11 = "reading current metadata";
    __int16 v12 = 1229;
    goto LABEL_5;
  }
  if (v42 != a2 || (v16 = 0, uint64_t v15 = 0, a3) && v41 != a3)
  {
    if ((resizeResourceFork(a1, a3) & 0x80000000) == 0)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      goto LABEL_12;
    }
    uint64_t v11 = "resizing resource fork";
    __int16 v12 = 1236;
    goto LABEL_5;
  }
LABEL_12:
  free(v40);
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  AAByteStreamClose(v15);
  return v16;
}

uint64_t decompressToData(int a1)
{
  size_t v2 = 0;
  size_t __s = 0;
  size_t v70 = 0;
  size_t v71 = 0;
  unint64_t v72 = 0;
  int v69 = -1;
  uint64_t v68 = 0;
  do
  {
    size_t v3 = (v2 >> 1) + v2;
    if (((v2 >> 1) & v2) != 0) {
      size_t v3 = ((v2 >> 1) & v2) + v2;
    }
    if (v2) {
      size_t v2 = v3;
    }
    else {
      size_t v2 = 0x4000;
    }
  }
  while (v2 <= 0x10000);
  uint64_t v4 = (uint8_t *)malloc(v2);
  if (!v4)
  {
    p_s = &__s;
LABEL_22:
    size_t *p_s = 0;
    p_s[1] = 0;
    p_s[2] = 0;
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"decompressToData", 448, 55, 0, "blob alloc", v5, v6, (char)__src);
    __int16 v10 = 0;
LABEL_41:
    size_t v25 = 0;
LABEL_42:
    size_t v26 = 0;
    goto LABEL_43;
  }
  size_t v7 = 0;
  size_t v74 = v2;
  int64x2_t v75 = v4;
  do
  {
    size_t v8 = (v7 >> 1) + v7;
    if (((v7 >> 1) & v7) != 0) {
      size_t v8 = ((v7 >> 1) & v7) + v7;
    }
    if (v7) {
      size_t v7 = v8;
    }
    else {
      size_t v7 = 0x4000;
    }
  }
  while (v7 < 0x80000);
  size_t v9 = (char *)malloc(v7);
  if (!v9)
  {
    p_s = &v70;
    goto LABEL_22;
  }
  __int16 v10 = v9;
  size_t v71 = v7;
  unint64_t v72 = v9;
  if ((loadDecmpfsXattr(a1, &v69, &v68, &__s) & 0x80000000) != 0)
  {
    uint64_t v16 = "loading decmpfs xattr";
    __int16 v17 = 451;
LABEL_39:
    int v24 = 0;
LABEL_40:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"decompressToData", v17, 55, v24, v16, v11, v12, (char)__src);
    goto LABEL_41;
  }
  unsigned int v13 = v69;
  if ((v69 - 3) > 0xB) {
    int v14 = 0;
  }
  else {
    int v14 = byte_214B13190[v69 - 3];
  }
  char v18 = 0;
  compression_algorithm v19 = 1285;
  switch(v69)
  {
    case 3:
    case 4:
      break;
    case 7:
    case 8:
      char v18 = 0;
      compression_algorithm v19 = 2304;
      break;
    case 11:
    case 12:
      char v18 = 0;
      compression_algorithm v19 = COMPRESSION_LZFSE;
      break;
    case 13:
    case 14:
      char v18 = 0;
      compression_algorithm v19 = COMPRESSION_LZBITMAP;
      break;
    default:
      compression_algorithm v19 = -1;
      char v18 = 1;
      break;
  }
  uint64_t v20 = v68;
  if (!v68 || (unint64_t v21 = v68 + 0xFFFF, (unint64_t)(v68 + 0xFFFF) >> 48))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"chunkCount", 128, 55, 0, "invalid uncompressed size", v11, v12, (char)__src);
    goto LABEL_38;
  }
  unint64_t v22 = v21 >> 16;
  if ((v21 >> 16) == -1)
  {
LABEL_38:
    uint64_t v16 = "invalid uncompressed size";
    __int16 v17 = 457;
    goto LABEL_39;
  }
  if ((v18 & 1) != 0 || (size_t v23 = compression_decode_scratch_buffer_size(v19)) == 0)
  {
    size_t v25 = 0;
  }
  else
  {
    if (v23 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_60:
      int v24 = *__error();
      uint64_t v16 = "malloc";
      __int16 v17 = 463;
      goto LABEL_40;
    }
    size_t v25 = malloc(v23);
    if (!v25) {
      goto LABEL_60;
    }
  }
  if (v13 <= 0xD && ((1 << v13) & 0x2A88) != 0)
  {
    unint64_t v29 = v75;
    if (*v75 == v14)
    {
      size_t v30 = __s - 1;
      memcpy(v10, v75 + 1, __s - 1);
    }
    else
    {
      size_t v30 = compression_decode_buffer((uint8_t *)v10, 0x10000uLL, v75, __s, v25, v19);
    }
    if (v30 - 65537 <= 0xFFFFFFFFFFFEFFFFLL)
    {
      uint64_t v33 = "invalid chunk";
      __int16 v34 = 487;
LABEL_58:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"decompressToData", v34, 55, 0, v33, v31, v32, (char)__src);
      goto LABEL_42;
    }
    size_t v70 = v30;
    ssize_t v35 = pwrite(a1, v29, v30, 0);
    size_t v26 = 0;
    if (v35 != v30)
    {
      uint64_t v33 = "writing chunk";
      __int16 v34 = 490;
      goto LABEL_58;
    }
LABEL_54:
    if (fremovexattr(a1, "com.apple.ResourceFork", 32) < 0)
    {
      int v54 = *__error();
      long long v55 = "Removing xattr";
      __int16 v56 = 548;
      goto LABEL_104;
    }
    if (fremovexattr(a1, "com.apple.decmpfs", 32) < 0)
    {
      int v54 = *__error();
      long long v55 = "Removing xattr";
      __int16 v56 = 549;
      goto LABEL_104;
    }
    uint64_t v27 = 0;
    goto LABEL_44;
  }
  size_t v26 = calloc((v22 + 1), 4uLL);
  if (!v26)
  {
    int v54 = *__error();
    long long v55 = "malloc";
    __int16 v56 = 498;
    goto LABEL_104;
  }
  if ((loadChunkOffsets(a1, v13, v22, v26, v36, v37, v38, v39) & 0x80000000) != 0)
  {
    long long v55 = "loading chunk offsets";
    __int16 v56 = 499;
    goto LABEL_103;
  }
  if (!v22)
  {
    size_t v44 = 0;
    off_t v43 = 0;
LABEL_95:
    if (v43 != v20 || v44)
    {
      long long v55 = "corrupted resource fork";
      __int16 v56 = 544;
      goto LABEL_103;
    }
    goto LABEL_54;
  }
  uint64_t v42 = 0;
  off_t v43 = 0;
  size_t v44 = 0;
  uint64_t value = v75;
  AAFieldKey __src = (char *)(v75 + 1);
  unint64_t v58 = v22;
  size_t v60 = v74;
  unint64_t v61 = v22 - 1;
  int v59 = v14;
  while (1)
  {
    size_t __s = 0;
    if (!((v7 - v44) >> 16))
    {
      long long v55 = "obuf full";
      __int16 v56 = 507;
      goto LABEL_103;
    }
    off_t v62 = v43;
    unint64_t v45 = &v26[v42];
    u_int32_t v47 = *v45;
    u_int32_t v46 = v45[1];
    size_t v48 = v46 - *v45;
    if (v60 < v48)
    {
      long long v55 = "invalid chunk size";
      __int16 v56 = 510;
      goto LABEL_103;
    }
    size_t v63 = v7 - v44;
    uint64_t v65 = v42;
    size_t v66 = v44;
    if (fgetxattr(a1, "com.apple.ResourceFork", value, v46 - v47, v47, 32) != v48)
    {
      long long v55 = "read resource fork chunk";
      __int16 v56 = 513;
      goto LABEL_103;
    }
    if (v46 != v47) {
      size_t __s = v46 - v47;
    }
    size_t v49 = &v10[v66];
    if (*value == v59)
    {
      size_t v50 = (v48 - 1);
      memcpy(v49, __src, v50);
    }
    else
    {
      size_t v50 = compression_decode_buffer((uint8_t *)v49, 0x10000uLL, value, v48, v25, v19);
    }
    uint64_t v51 = v65;
    size_t v44 = v66;
    size_t v52 = v63;
    if (v50 == 0x10000) {
      goto LABEL_81;
    }
    if (v50) {
      BOOL v53 = v61 == v65;
    }
    else {
      BOOL v53 = 0;
    }
    if (!v53 || v50 > 0x10000)
    {
LABEL_98:
      long long v55 = "invalid chunk";
      __int16 v56 = 532;
      goto LABEL_103;
    }
    if (v50)
    {
LABEL_81:
      size_t v44 = v66 + v50;
      if (__CFADD__(v66, v50)) {
        goto LABEL_98;
      }
      size_t v52 = v7 - v44;
      if (v7 < v44) {
        goto LABEL_98;
      }
      size_t v70 = v66 + v50;
    }
    off_t v43 = v62;
    if (v61 == v65 || !(v52 >> 16)) {
      break;
    }
LABEL_88:
    uint64_t v42 = v51 + 1;
    if (v58 == v42) {
      goto LABEL_95;
    }
  }
  size_t v67 = v44;
  if (pwrite(a1, v10, v44, v62) == v44)
  {
    off_t v43 = v67 + v62;
    size_t v70 = 0;
    size_t v44 = 0;
    uint64_t v51 = v65;
    goto LABEL_88;
  }
  long long v55 = "writing chunk";
  __int16 v56 = 539;
LABEL_103:
  int v54 = 0;
LABEL_104:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"decompressToData", v56, 55, v54, v55, v40, v41, (char)__src);
LABEL_43:
  uint64_t v27 = 0xFFFFFFFFLL;
LABEL_44:
  free(v75);
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  free(v10);
  memset_s(&v70, 0x18uLL, 0, 0x18uLL);
  free(v25);
  free(v26);
  return v27;
}

uint64_t resizeResourceFork(int a1, unsigned int a2)
{
  unint64_t __s = 0;
  unint64_t v76 = 0;
  __ptr = 0;
  int v74 = -1;
  uint64_t v73 = 0;
  if ((loadDecmpfsXattr(a1, &v74, &v73, &__s) & 0x80000000) != 0)
  {
    size_t v8 = "loading decmpfs xattr";
    __int16 v9 = 574;
    goto LABEL_8;
  }
  int v6 = v74;
  if ((v74 + 1) <= 0xE && ((1 << (v74 + 1)) & 0x5511) != 0)
  {
    size_t v8 = "invalid compression type";
    __int16 v9 = 575;
LABEL_8:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resizeResourceFork", v9, 55, 0, v8, v4, v5, v66);
LABEL_9:
    __int16 v10 = 0;
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  unsigned int v14 = resourceForkSize(a1);
  if (v14 == -1)
  {
    size_t v8 = "invalid resource fork";
    __int16 v9 = 579;
    goto LABEL_8;
  }
  if (a2 < v14)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resizeResourceFork", 580, 55, 0, "can't resize resource fork %u to %u", v4, v5, v14);
    goto LABEL_9;
  }
  unsigned int v15 = a2 - v14;
  if (a2 == v14)
  {
    __int16 v10 = 0;
    uint64_t v11 = 0;
LABEL_18:
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  uint64_t v16 = v73;
  if (!v73 || (unint64_t v17 = v73 + 0xFFFF, (unint64_t)(v73 + 0xFFFF) >> 48))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"chunkCount", 128, 55, 0, "invalid uncompressed size", v4, v5, v66);
    goto LABEL_45;
  }
  unint64_t v18 = v17 >> 16;
  size_t v19 = (v17 >> 16) + 1;
  if (v19 <= 1)
  {
LABEL_45:
    size_t v8 = "invalid uncompressed size";
    __int16 v9 = 589;
    goto LABEL_8;
  }
  uint64_t v11 = calloc((v17 >> 16) + 1, 4uLL);
  uint64_t v20 = calloc(v19, 4uLL);
  __int16 v10 = v20;
  if (!v11 || !v20)
  {
    int v41 = *__error();
    unint64_t v64 = "malloc";
    __int16 v65 = 594;
    goto LABEL_91;
  }
  if ((loadChunkOffsets(a1, v6, v18, v11, v21, v22, v23, v24) & 0x80000000) != 0)
  {
    unint64_t v64 = "loading chunk offsets";
    __int16 v65 = 595;
    goto LABEL_90;
  }
  v10[v18] = v15 + v11[v18];
  int v29 = v18;
  while (v29)
  {
    uint64_t v30 = (v29 - 1);
    unint64_t v31 = v16 - (v30 << 16);
    if (v31 >= 0x10000) {
      LODWORD(v31) = 0x10000;
    }
    int v32 = v11[v29];
    int v33 = v11[v30];
    unsigned int v34 = v10[v29];
    unsigned int v35 = v32 - v33;
    unsigned int v36 = v34 - v33;
    if (v36 >= 0x10000) {
      unsigned int v36 = 0x10000;
    }
    BOOL v38 = v35 > v36 || (v35 & 0xFFFF0000) != 0 || v35 >= v31;
    if (v38) {
      unsigned int v39 = v35;
    }
    else {
      unsigned int v39 = v36;
    }
    BOOL v38 = v34 >= v39;
    unsigned int v40 = v34 - v39;
    v10[v30] = v40;
    if (!v38)
    {
      unint64_t v64 = "resource fork resize failed";
      __int16 v65 = 607;
      goto LABEL_90;
    }
    int v29 = v30;
    if (v40 < v11[v30])
    {
      unint64_t v64 = "invalid state when resizing resource fork";
      __int16 v65 = 608;
      goto LABEL_90;
    }
  }
  if (*v10 != *v11)
  {
    unint64_t v64 = "resource fork resize failed";
    __int16 v65 = 610;
    goto LABEL_90;
  }
  size_t v42 = v76;
  if (v76 <= 0x10000)
  {
    do
    {
      size_t v43 = (v42 >> 1) + v42;
      if (((v42 >> 1) & v42) != 0) {
        size_t v43 = ((v42 >> 1) & v42) + v42;
      }
      if (v42) {
        size_t v42 = v43;
      }
      else {
        size_t v42 = 0x4000;
      }
    }
    while (v42 < 0x10001);
    size_t v44 = __ptr;
    unint64_t v45 = realloc(__ptr, v42);
    if (!v45)
    {
      free(v44);
      unint64_t __s = 0;
      unint64_t v76 = 0;
      __ptr = 0;
      unint64_t v64 = "blob alloc";
      __int16 v65 = 613;
      goto LABEL_90;
    }
    __ptr = v45;
  }
  unint64_t v46 = __s;
  if (!v18) {
    goto LABEL_97;
  }
  u_int32_t v47 = (char *)__ptr;
  u_int32_t v48 = v11[(v18 - 1)];
  int __n = v11[v18];
  u_int32_t v49 = __n - v48;
  int size_4 = v18 - 1;
  uint64_t v68 = &v10[(v18 - 1)];
  int v50 = v10[v18] - *v68;
  if (v48 == *v68 && v49 == v50)
  {
LABEL_96:
    __ptr = v47;
LABEL_97:
    unint64_t __s = v46;
    unint64_t v76 = v42;
    if ((storeChunkOffsets(a1, v6, v18, v10, v25, v26, v27, v28) & 0x80000000) != 0)
    {
      unint64_t v64 = "storing new offsets";
      __int16 v65 = 635;
      goto LABEL_90;
    }
    goto LABEL_18;
  }
  unint64_t v52 = v42;
  while (1)
  {
    unsigned int size = v50;
    unint64_t v53 = v49;
    size_t v67 = v47;
    u_int32_t v54 = v49;
    ssize_t v55 = fgetxattr(a1, "com.apple.ResourceFork", v47, v49, v48, 32);
    unsigned int v56 = size;
    if (v55 != v54)
    {
LABEL_93:
      unint64_t v76 = v42;
      __ptr = v67;
      unint64_t __s = 0;
      unint64_t v64 = "read chunk";
      __int16 v65 = 628;
      goto LABEL_90;
    }
    if (__n == v48)
    {
      unint64_t v57 = 0;
    }
    else
    {
      unint64_t v57 = v53;
      if (v52 < v53) {
        goto LABEL_93;
      }
    }
    if (size <= v53)
    {
      unint64_t v46 = v57;
      int v59 = v67;
      size_t v60 = v68;
      goto LABEL_84;
    }
    unint64_t v46 = v57 + size - v53;
    rsize_t __na = size - v53;
    if (v52 < v46) {
      break;
    }
    unint64_t v61 = v67;
    if (v67)
    {
LABEL_82:
      memset_s(&v61[v57], __na, 0, __na);
      int v59 = v61;
    }
    else
    {
      int v59 = 0;
    }
    size_t v60 = v68;
    unsigned int v56 = size;
LABEL_84:
    off_t v62 = v59;
    if (fsetxattr(a1, "com.apple.ResourceFork", v59, v56, *v60, 0) < 0)
    {
      unint64_t v76 = v42;
      __ptr = v62;
      unint64_t __s = v46;
      unint64_t v64 = "write chunk";
      __int16 v65 = 631;
      goto LABEL_90;
    }
    if (!size_4)
    {
      u_int32_t v47 = v62;
      goto LABEL_96;
    }
    int v63 = size_4 - 1;
    u_int32_t v48 = v11[size_4 - 1];
    int __n = v11[size_4];
    u_int32_t v49 = __n - v48;
    uint64_t v68 = &v10[size_4 - 1];
    int v50 = v10[size_4--] - *v68;
    u_int32_t v47 = v62;
    if (v48 == *v68)
    {
      int size_4 = v63;
      if (v49 == v50) {
        goto LABEL_96;
      }
    }
  }
  do
  {
    while (!v52)
    {
      unint64_t v52 = 0x4000;
      size_t v42 = 0x4000;
      if (v46 <= 0x4000) {
        goto LABEL_81;
      }
    }
    unint64_t v58 = v52 >> 1;
    if ((v52 & (v52 >> 1)) != 0) {
      unint64_t v58 = v52 & (v52 >> 1);
    }
    v52 += v58;
  }
  while (v52 < v46);
  size_t v42 = v52;
  if (v52 >= 0x2000000001)
  {
    *__error() = 12;
    goto LABEL_101;
  }
LABEL_81:
  unint64_t v61 = (char *)realloc(v67, v42);
  unint64_t v52 = v42;
  if (v61) {
    goto LABEL_82;
  }
  free(v67);
LABEL_101:
  unint64_t __s = 0;
  unint64_t v76 = 0;
  __ptr = 0;
  unint64_t v64 = "store padding";
  __int16 v65 = 629;
LABEL_90:
  int v41 = 0;
LABEL_91:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resizeResourceFork", v65, 55, v41, v64, v27, v28, v66);
LABEL_10:
  uint64_t v12 = 0xFFFFFFFFLL;
LABEL_11:
  free(__ptr);
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  free(v11);
  free(v10);
  return v12;
}

uint64_t afscStreamClose(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    unsigned int v9 = atomic_load((unsigned int *)(result + 120));
    BOOL v10 = v9 == 0;
    unint64_t v11 = *(void *)(result + 16);
    if (*(void *)(result + 24) < v11 || *(void *)(result + 64)) {
      goto LABEL_4;
    }
    size_t v15 = *(void *)(result + 88);
    int v16 = *(_DWORD *)(result + 40);
    if (v15)
    {
      if (v16)
      {
LABEL_4:
        uint64_t v39 = *(void *)(result + 24);
        uint64_t v12 = "invalid final AFSC stream state, received %zu/%zu bytes";
        __int16 v13 = 826;
        goto LABEL_5;
      }
LABEL_17:
      int v18 = *(_DWORD *)(v8 + 32) - (v15 != 0);
      int v19 = *(_DWORD *)v8;
      long long __s = 0uLL;
      int v41 = 0;
      if ((v18 - 7) >= 8 && (v18 - 3) >= 2)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"storeDecmpfsXattr", 286, 55, 0, "unsupported compression type: %d", a7, a8, v18);
        uint64_t v23 = 0;
LABEL_55:
        free(v23);
        memset_s(&__s, 0x18uLL, 0, 0x18uLL);
        uint64_t v12 = "store decmpfs xattr";
        __int16 v13 = 837;
        goto LABEL_5;
      }
      uint64_t v20 = (char *)malloc(0x4000uLL);
      if (!v20) {
        goto LABEL_52;
      }
      uint64_t v23 = v20;
      int v41 = v20;
      *(_DWORD *)uint64_t v20 = 1668116582;
      *((_DWORD *)v20 + 1) = v18;
      *((void *)v20 + 1) = v11;
      long long __s = xmmword_214B13100;
      unint64_t v24 = v15 + 16;
      if (v15 >= 0xFFFFFFFFFFFFFFF0 || (v24 & 0x8000000000000000) != 0) {
        goto LABEL_53;
      }
      uint64_t v25 = *(const void **)(v8 + 104);
      if (v24 > 0x4000)
      {
        for (size_t i = 0x4000; i < v24; i += v27)
        {
          size_t v27 = i >> 1;
          if ((i & (i >> 1)) != 0) {
            size_t v27 = i & (i >> 1);
          }
        }
        if (i >= 0x2000000001)
        {
          *__error() = 12;
LABEL_52:
          uint64_t v23 = 0;
          long long __s = 0uLL;
          int v41 = 0;
          goto LABEL_53;
        }
        uint64_t v30 = (char *)realloc(v20, i);
        if (!v30)
        {
          free(v23);
          goto LABEL_52;
        }
        *((void *)&__s + 1) = i;
        int v41 = v30;
        uint64_t v23 = v30;
      }
      unint64_t v31 = v23 + 16;
      if (v25) {
        memcpy(v31, v25, v15);
      }
      else {
        memset_s(v31, v15, 0, v15);
      }
      *(void *)&long long __s = v15 + 16;
      if ((v15 & 0x8000000000000000) == 0)
      {
        if ((fsetxattr(v19, "com.apple.decmpfs", v23, v15 + 16, 0, 0) & 0x80000000) == 0)
        {
          free(v23);
          memset_s(&__s, 0x18uLL, 0, 0x18uLL);
          if (ftruncate(*(_DWORD *)v8, 0))
          {
            int v14 = *__error();
            uint64_t v12 = "ftruncate";
            __int16 v13 = 840;
            goto LABEL_6;
          }
          if ((*(unsigned char *)(v8 + 8) & 4) != 0
            || (unint64_t v35 = *(unsigned int *)(v8 + 40), !v35)
            || 93 * *(void *)(v8 + 16) / 0x64uLL >= v35
            || *(_DWORD *)(v8 + 32) == 10
            || *(_DWORD *)(v8 + 112))
          {
            int v36 = *(_DWORD *)(v8 + 112);
            if (!v36 || v36 == v18)
            {
              unsigned int v37 = *(_DWORD *)(v8 + 116);
              if (v37
                && (int v38 = *(_DWORD *)(v8 + 40)) != 0
                && v37 != v38
                && (resizeResourceFork(*(_DWORD *)v8, v37) & 0x80000000) != 0)
              {
                uint64_t v12 = "resizing resource fork";
                __int16 v13 = 861;
              }
              else
              {
                if ((setUFCompressedBit(*(_DWORD *)v8) & 0x80000000) == 0) {
                  goto LABEL_7;
                }
                uint64_t v12 = "set UF_COMPRESSED";
                __int16 v13 = 865;
              }
            }
            else
            {
              uint64_t v12 = "compression type mismatch";
              __int16 v13 = 858;
            }
          }
          else
          {
            if ((decompressToData(*(_DWORD *)v8) & 0x80000000) == 0) {
              goto LABEL_7;
            }
            uint64_t v12 = "decompressing to regular data file";
            __int16 v13 = 853;
          }
LABEL_5:
          int v14 = 0;
LABEL_6:
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamClose", v13, 55, v14, v12, a7, a8, v39);
          BOOL v10 = 0;
LABEL_7:
          free(*(void **)(v8 + 48));
          free(*(void **)(v8 + 56));
          free(*(void **)(v8 + 80));
          memset_s((void *)(v8 + 64), 0x18uLL, 0, 0x18uLL);
          free(*(void **)(v8 + 104));
          memset_s((void *)(v8 + 88), 0x18uLL, 0, 0x18uLL);
          free((void *)v8);
          return (v10 - 1);
        }
        int v32 = *__error();
        int v33 = "fsetxattr decmpfs";
        __int16 v34 = 297;
        goto LABEL_54;
      }
LABEL_53:
      int v33 = "prepare decmpfs header";
      __int16 v34 = 291;
      int v32 = 0;
LABEL_54:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"storeDecmpfsXattr", v34, 55, v32, v33, v21, v22, v39);
      goto LABEL_55;
    }
    if (!v16)
    {
      size_t v15 = 0;
      goto LABEL_17;
    }
    if ((storeChunkOffsets(*(_DWORD *)result, *(_DWORD *)(result + 32), *(_DWORD *)(result + 44), *(_DWORD **)(result + 48), a5, a6, a7, a8) & 0x80000000) != 0)
    {
      uint64_t v28 = "storing offsets";
      __int16 v29 = 796;
    }
    else
    {
      int v17 = resourceForkSize(*(_DWORD *)v8);
      *(_DWORD *)(v8 + 40) = v17;
      if (v17 != -1)
      {
        size_t v15 = *(void *)(v8 + 88);
        unint64_t v11 = *(void *)(v8 + 16);
        goto LABEL_17;
      }
      uint64_t v28 = "invalid resource fork";
      __int16 v29 = 800;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"finalizeResourceFork", v29, 55, 0, v28, a7, a8, v39);
    uint64_t v12 = "finalize resource fork";
    __int16 v13 = 832;
    goto LABEL_5;
  }
  return result;
}

void afscStreamCancel(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(a1 + 120), (unsigned int *)&v1, 1u);
}

uint64_t afscStreamWrite(uint64_t a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (atomic_load((unsigned int *)(a1 + 120))) {
    return -1;
  }
  unint64_t v10 = a3;
  uint64_t v12 = *(void *)(a1 + 24);
  BOOL v13 = __CFADD__(v12, a3);
  unint64_t v14 = v12 + a3;
  if (v13 || v14 > *(void *)(a1 + 16))
  {
    size_t v15 = "too many bytes received";
    __int16 v16 = 923;
LABEL_6:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamWrite", v16, 55, 0, v15, a7, a8, v44);
    uint64_t v9 = -1;
  }
  else
  {
    if (!a3) {
      return 0;
    }
    int v19 = __src;
    uint64_t v9 = 0;
    uint64_t v21 = (void *)(a1 + 64);
    size_t v20 = *(void *)(a1 + 64);
    unint64_t v45 = (void *)(a1 + 64);
    do
    {
      if (v10 >= 0x10000 - v20) {
        size_t v22 = 0x10000 - v20;
      }
      else {
        size_t v22 = v10;
      }
      unint64_t v23 = v20 + v22;
      if (__CFADD__(v20, v22) || (v23 & 0x8000000000000000) != 0) {
        goto LABEL_69;
      }
      unint64_t v24 = *(void *)(a1 + 72);
      if (v24 < v23)
      {
        do
        {
          while (!v24)
          {
            unint64_t v24 = 0x4000;
            size_t v26 = 0x4000;
            if (v23 <= 0x4000) {
              goto LABEL_25;
            }
          }
          unint64_t v25 = v24 >> 1;
          if ((v24 & (v24 >> 1)) != 0) {
            unint64_t v25 = v24 & (v24 >> 1);
          }
          v24 += v25;
        }
        while (v24 < v23);
        size_t v26 = v24;
        if (v24 >= 0x2000000001)
        {
          *__error() = 12;
          goto LABEL_68;
        }
LABEL_25:
        size_t v27 = *(void **)(a1 + 80);
        uint64_t v28 = realloc(v27, v26);
        if (v28)
        {
          *(void *)(a1 + 72) = v26;
          *(void *)(a1 + 80) = v28;
          goto LABEL_27;
        }
        free(v27);
LABEL_68:
        *uint64_t v21 = 0;
        v21[1] = 0;
        v21[2] = 0;
LABEL_69:
        size_t v15 = "append to ibuf";
        __int16 v16 = 928;
        goto LABEL_6;
      }
LABEL_27:
      uint64_t v29 = *(void *)(a1 + 80);
      if (v19)
      {
        memcpy((void *)(v29 + *v21), v19, v22);
      }
      else if (v29)
      {
        memset_s((void *)(v29 + *v21), v22, 0, v22);
      }
      size_t v20 = *v21 + v22;
      *uint64_t v21 = v20;
      if ((v22 & 0x8000000000000000) != 0) {
        goto LABEL_69;
      }
      size_t v30 = *(void *)(a1 + 24) + v22;
      *(void *)(a1 + 24) = v30;
      if (v20 == 0x10000 || v20 && v30 == *(void *)(a1 + 16))
      {
        unint64_t v31 = (v30 + 0xFFFFFFFFFFFFLL) >> 16;
        if (*(_DWORD *)(a1 + 44) <= v31)
        {
          size_t v42 = "invalid state";
          __int16 v43 = 740;
          goto LABEL_72;
        }
        uint64_t v32 = *(void *)(a1 + 88);
        if ((unint64_t)(*(void *)(a1 + 96) - v32) <= 0x10000)
        {
          if ((flushOBuf_0(a1, (uint64_t)__src, a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
          {
            size_t v42 = "flushing obuf";
            __int16 v43 = 744;
            goto LABEL_72;
          }
          size_t v20 = *(void *)(a1 + 64);
          uint64_t v32 = *(void *)(a1 + 88);
        }
        int v33 = *(const void **)(a1 + 80);
        __int16 v34 = (uint8_t *)(*(void *)(a1 + 104) + v32);
        int v35 = *(_DWORD *)(a1 + 32);
        if (v35 != 10
          && v20 >= 0x78
          && ((unsigned int v36 = v35 - 3, v36 > 0xB) ? (v37 = -1) : (v37 = dword_214B1319C[v36]),
              (size_t v38 = compression_encode_buffer(v34, 0x10000uLL, *(const uint8_t **)(a1 + 80), v20, *(void **)(a1 + 56), v37)) != 0&& ((*(unsigned char *)(a1 + 8) & 1) != 0 ? (__src = (char *)((v38 >> 6) + 32)) : (__src = 0), (v39 = &__src[v38]) != 0 && (unint64_t)v39 < v20)))
        {
          if ((unint64_t)v39 > v38) {
            memset_s(&v34[v38], (rsize_t)__src, 0, (rsize_t)__src);
          }
        }
        else
        {
          *__int16 v34 = *(unsigned char *)(a1 + 36);
          memcpy(v34 + 1, v33, v20);
          uint64_t v39 = (char *)(v20 + 1);
        }
        *(_DWORD *)(*(void *)(a1 + 48) + 4 * (v31 + 1)) = *(_DWORD *)(*(void *)(a1 + 48)
                                                                                      + 4 * v31)
                                                                          + v39;
        if (v39)
        {
          uint64_t v40 = *(void *)(a1 + 88);
          BOOL v13 = __CFADD__(v40, v39);
          int v41 = &v39[v40];
          if (v13 || (unint64_t)v41 > *(void *)(a1 + 96))
          {
            size_t v42 = "expand obuf";
            __int16 v43 = 780;
LABEL_72:
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"flushIBuf", v43, 55, 0, v42, a7, a8, v44);
            size_t v15 = "flushing ibuf";
            __int16 v16 = 938;
            goto LABEL_6;
          }
          *(void *)(a1 + 88) = v41;
        }
        if (*(void *)(a1 + 24) == *(void *)(a1 + 16)
          && (flushOBuf_0(a1, (uint64_t)__src, a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
        {
          size_t v42 = "flushing obuf";
          __int16 v43 = 784;
          goto LABEL_72;
        }
        size_t v20 = 0;
        uint64_t v21 = v45;
        *unint64_t v45 = 0;
      }
      v19 += v22;
      v9 += v22;
      v10 -= v22;
    }
    while (v10);
    if ((v9 & 0x8000000000000000) == 0) {
      return v9;
    }
  }
  int v17 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(a1 + 120), (unsigned int *)&v17, 1u);
  return v9;
}

uint64_t afscStreamCloseWithState(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (atomic_load((unsigned int *)(a1 + 120))) {
    return 0xFFFFFFFFLL;
  }
  BOOL v13 = (_DWORD *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 88);
  if (v12)
  {
    if ((flushOBuf_0(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
    {
      size_t v26 = "flushing obuf";
      __int16 v27 = 884;
LABEL_41:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamCloseWithState", v27, 55, 0, v26, a7, a8, v37);
      return 0xFFFFFFFFLL;
    }
    LODWORD(v12) = *v13;
  }
  uint64_t v14 = *(void *)(a1 + 64);
  long long v37 = *(_OWORD *)(a1 + 8);
  uint64_t v38 = *(void *)(a1 + 24);
  int v15 = *(_DWORD *)(a1 + 40);
  int v39 = *(_DWORD *)(a1 + 32);
  int v40 = v15;
  uint64_t v41 = *(void *)(a1 + 112);
  int v42 = v14;
  int v43 = v12;
  if (!a2[3]) {
    goto LABEL_40;
  }
  uint64_t v16 = 0;
  int v17 = *(_DWORD *)(a1 + 44);
  int v18 = &v37;
  uint64_t v19 = 48;
  while (1)
  {
    uint64_t v20 = ((uint64_t (*)(void, long long *, uint64_t))a2[3])(*a2, v18, v19);
    if (v20 < 1) {
      break;
    }
    int v18 = (long long *)((char *)v18 + v20);
    v16 += v20;
    v19 -= v20;
    if (!v19)
    {
      if (v16 < 0) {
        goto LABEL_40;
      }
      goto LABEL_12;
    }
  }
  if (v20 < 0) {
    goto LABEL_40;
  }
LABEL_12:
  if (!a2[3]) {
    goto LABEL_40;
  }
  unsigned int v21 = v17 + 1;
  if (v17 != -1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 4 * v21;
    uint64_t v24 = *(void *)(a1 + 48);
    while (1)
    {
      uint64_t v25 = ((uint64_t (*)(void, uint64_t, uint64_t))a2[3])(*a2, v24, v23);
      if (v25 < 1) {
        break;
      }
      v24 += v25;
      v22 += v25;
      v23 -= v25;
      if (!v23) {
        goto LABEL_20;
      }
    }
    uint64_t v22 = v25;
LABEL_20:
    if (v22 < 0 || !a2[3]) {
      goto LABEL_40;
    }
  }
  uint64_t v28 = *(void *)(a1 + 64);
  if (v28)
  {
    uint64_t v29 = 0;
    uint64_t v30 = *(void *)(a1 + 80);
    while (1)
    {
      uint64_t v31 = ((uint64_t (*)(void, uint64_t, uint64_t))a2[3])(*a2, v30, v28);
      if (v31 < 1) {
        break;
      }
      v30 += v31;
      v29 += v31;
      v28 -= v31;
      if (!v28) {
        goto LABEL_28;
      }
    }
    uint64_t v29 = v31;
LABEL_28:
    if (v29 < 0) {
      goto LABEL_40;
    }
  }
  if (!a2[3]) {
    goto LABEL_40;
  }
  uint64_t v32 = *(void *)v13;
  if (*(void *)v13)
  {
    uint64_t v33 = 0;
    uint64_t v34 = *(void *)(a1 + 104);
    while (1)
    {
      uint64_t v35 = ((uint64_t (*)(void, uint64_t, uint64_t))a2[3])(*a2, v34, v32);
      if (v35 < 1) {
        break;
      }
      v34 += v35;
      v33 += v35;
      v32 -= v35;
      if (!v32) {
        goto LABEL_36;
      }
    }
    uint64_t v33 = v35;
LABEL_36:
    if (v33 < 0)
    {
LABEL_40:
      size_t v26 = "serializing state";
      __int16 v27 = 901;
      goto LABEL_41;
    }
  }
  if (a3) {
    *a3 = *(void *)(a1 + 24);
  }
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 80));
  memset_s((void *)(a1 + 64), 0x18uLL, 0, 0x18uLL);
  free(*(void **)(a1 + 104));
  memset_s(v13, 0x18uLL, 0, 0x18uLL);
  free((void *)a1);
  return 0;
}

uint64_t setUFCompressedBit(int a1)
{
  memset(&v8, 0, sizeof(v8));
  if (fstat(a1, &v8))
  {
    int v2 = *__error();
    uint64_t v5 = "fstat";
    __int16 v6 = 115;
LABEL_3:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"setUFCompressedBit", v6, 55, v2, v5, v3, v4, v8.st_dev);
    return 0xFFFFFFFFLL;
  }
  if ((v8.st_flags & 0x20) == 0 && fchflags(a1, v8.st_flags | 0x20) < 0)
  {
    int v2 = *__error();
    uint64_t v5 = "fchflags UF_COMPRESSED";
    __int16 v6 = 120;
    goto LABEL_3;
  }
  return 0;
}

uint64_t storeChunkOffsets(int fd, int a2, unsigned int a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  long long v47 = 0uLL;
  uint64_t value = 0;
  unint64_t v9 = 8 * a3 + 264;
  if (a2 != 4) {
    unint64_t v9 = 4 * a3 + 4;
  }
  if (v9 >= 0xFFFFFFFF)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkHeaderSize", 146, 55, 0, "invalid file size", a7, a8, v47);
    __int16 v12 = 373;
    int v13 = 0;
    uint64_t v14 = "invalid file size";
LABEL_5:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"storeChunkOffsets", v12, 55, v13, v14, v10, v11, v47);
    int v15 = 0;
LABEL_54:
    uint64_t v42 = 0xFFFFFFFFLL;
    goto LABEL_55;
  }
  if (a2 == 4)
  {
    uint64_t v18 = a3;
    if (fsetxattr(fd, "com.apple.ResourceFork", &old_resource_fork_map_0, 0x32uLL, a4[a3], 0) < 0)
    {
      int v13 = *__error();
      uint64_t v14 = "fsetxattr resource fork";
      __int16 v12 = 379;
      goto LABEL_5;
    }
    unsigned int v19 = a4[a3];
    long long v62 = 0u;
    long long v63 = 0u;
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
    long long v49 = 0u;
    uint64_t v20 = (char *)malloc(0x4000uLL);
    int v15 = v20;
    if (!v20)
    {
      long long v47 = 0uLL;
      __int16 v45 = 399;
LABEL_49:
      uint64_t value = 0;
LABEL_52:
      char v44 = "prepare zlib header";
      int v43 = 0;
      goto LABEL_53;
    }
    uint64_t value = v20;
    *(_DWORD *)uint64_t v20 = 0x10000;
    *((_DWORD *)v20 + 1) = bswap32(v19);
    *((_DWORD *)v20 + 2) = bswap32(v19 - 256);
    *((_DWORD *)v20 + 3) = 838860800;
    long long v23 = v62;
    *((_OWORD *)v20 + 13) = v61;
    *((_OWORD *)v20 + 14) = v23;
    *((_OWORD *)v20 + 15) = v63;
    long long v24 = v58;
    *((_OWORD *)v20 + 9) = v57;
    *((_OWORD *)v20 + 10) = v24;
    long long v25 = v60;
    *((_OWORD *)v20 + 11) = v59;
    *((_OWORD *)v20 + 12) = v25;
    long long v26 = v54;
    *((_OWORD *)v20 + 5) = v53;
    *((_OWORD *)v20 + 6) = v26;
    long long v27 = v56;
    *((_OWORD *)v20 + 7) = v55;
    *((_OWORD *)v20 + 8) = v27;
    long long v28 = v50;
    *((_OWORD *)v20 + 1) = v49;
    *((_OWORD *)v20 + 2) = v28;
    long long v29 = v52;
    *((_OWORD *)v20 + 3) = v51;
    *((_OWORD *)v20 + 4) = v29;
    *((_DWORD *)v20 + 64) = bswap32(v19 - 260);
    *((_DWORD *)v20 + 65) = a3;
    long long v47 = xmmword_214B13110;
    if (a3)
    {
      uint64_t v30 = 0;
      rsize_t v31 = 264;
      unint64_t v32 = 0x4000;
      while (1)
      {
        unint64_t v33 = v31 + 8;
        if (v31 >= 0xFFFFFFFFFFFFFFF8 || (v33 & 0x8000000000000000) != 0)
        {
          __int16 v45 = 406;
          int v15 = (char *)value;
          goto LABEL_52;
        }
        int v34 = a4[v30++];
        int v35 = a4[v30];
        if (v32 < v33) {
          break;
        }
LABEL_24:
        *(void *)&v15[v31] = (v34 - 260) | ((unint64_t)(v35 - v34) << 32);
        rsize_t v31 = v47 + 8;
        *(void *)&long long v47 = v47 + 8;
        if (v30 == v18)
        {
          int v15 = (char *)value;
          goto LABEL_44;
        }
      }
      do
      {
        while (!v32)
        {
          unint64_t v32 = 0x4000;
          size_t v37 = 0x4000;
          if (v33 <= 0x4000) {
            goto LABEL_22;
          }
        }
        unint64_t v36 = v32 >> 1;
        if ((v32 & (v32 >> 1)) != 0) {
          unint64_t v36 = v32 & (v32 >> 1);
        }
        v32 += v36;
      }
      while (v32 < v33);
      size_t v37 = v32;
      if (v32 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_58;
      }
LABEL_22:
      uint64_t v38 = (char *)realloc(v15, v37);
      if (v38)
      {
        *((void *)&v47 + 1) = v37;
        uint64_t value = v38;
        int v15 = v38;
        unint64_t v32 = v37;
        goto LABEL_24;
      }
      free(v15);
LABEL_58:
      int v15 = 0;
      long long v47 = 0uLL;
      __int16 v45 = 406;
      goto LABEL_49;
    }
    rsize_t v31 = 264;
  }
  else
  {
    rsize_t v31 = v9 & 0xFFFFFFFC;
    if ((v9 & 0xFFFFFFFC) != 0)
    {
      size_t v39 = 0;
      do
      {
        while (!v39)
        {
          size_t v39 = 0x4000;
          if (v31 <= 0x4000)
          {
            size_t v39 = 0x4000;
            goto LABEL_37;
          }
        }
        size_t v40 = v39 >> 1;
        if ((v39 & (v39 >> 1)) != 0) {
          size_t v40 = v39 & (v39 >> 1);
        }
        v39 += v40;
      }
      while (v39 < v31);
      if (v39 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_46:
        uint64_t value = 0;
        long long v47 = 0uLL;
        uint64_t v14 = "prepare non zlib header";
        __int16 v12 = 411;
        int v13 = 0;
        goto LABEL_5;
      }
LABEL_37:
      uint64_t v41 = (char *)malloc(v39);
      if (!v41) {
        goto LABEL_46;
      }
      int v15 = v41;
      *((void *)&v47 + 1) = v39;
      uint64_t value = v41;
      if (a4) {
        goto LABEL_42;
      }
      memset_s(v41, v31, 0, v31);
    }
    else
    {
      int v15 = 0;
LABEL_42:
      memcpy(v15, a4, v31);
    }
    *(void *)&long long v47 = v31;
  }
LABEL_44:
  if (fsetxattr(fd, "com.apple.ResourceFork", v15, v31, 0, 0) < 0)
  {
    int v43 = *__error();
    char v44 = "fsetxattr resource fork";
    __int16 v45 = 420;
LABEL_53:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"storeChunkOffsets", v45, 55, v43, v44, v21, v22, v47);
    goto LABEL_54;
  }
  uint64_t v42 = 0;
LABEL_55:
  free(v15);
  memset_s(&v47, 0x18uLL, 0, 0x18uLL);
  return v42;
}

uint64_t flushOBuf_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v9 = (*(unsigned char *)(a1 + 8) & 2) != 0 && *(_DWORD *)(a1 + 32) != 10;
  unsigned int v10 = *(_DWORD *)(a1 + 112);
  if (v10)
  {
    if (v10 > 0xD || ((1 << v10) & 0x2A88) == 0)
    {
      int v13 = (_DWORD *)(a1 + 40);
      LODWORD(v12) = *(_DWORD *)(a1 + 40);
LABEL_15:
      BOOL v15 = v10 > 0xD;
      int v16 = (1 << v10) & 0x2A88;
      if (!v15 && v16 != 0)
      {
        uint64_t v18 = "requested compression type requests inline storage";
        __int16 v19 = 704;
        int v20 = 0;
        goto LABEL_31;
      }
LABEL_20:
      if (!v12)
      {
        uint64_t v21 = *(unsigned int *)(a1 + 44);
        uint64_t v22 = 8 * v21 + 264;
        uint64_t v23 = 4 * v21 + 4;
        if (*(_DWORD *)(a1 + 32) == 4) {
          unint64_t v12 = v22;
        }
        else {
          unint64_t v12 = v23;
        }
        uint64_t v14 = 0xFFFFFFFFLL;
        if (v12 >= 0xFFFFFFFF)
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkHeaderSize", 146, 55, 0, "invalid file size", a7, a8, v27);
          *int v13 = -1;
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"flushOBuf", 714, 55, 0, "File too large for AFSC", v24, v25, v28);
          return v14;
        }
        *int v13 = v12;
      }
      if ((fsetxattr(*(_DWORD *)a1, "com.apple.ResourceFork", *(const void **)(a1 + 104), *(void *)(a1 + 88), v12, 0) & 0x80000000) == 0)
      {
        uint64_t v14 = 0;
        *(_DWORD *)(a1 + 40) += *(_DWORD *)(a1 + 88);
        *(void *)(a1 + 88) = 0;
        return v14;
      }
      int v20 = *__error();
      uint64_t v18 = "fsetxattr resource fork";
      __int16 v19 = 723;
LABEL_31:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"flushOBuf", v19, 55, v20, v18, a7, a8, v27);
      return 0xFFFFFFFFLL;
    }
  }
  int v13 = (_DWORD *)(a1 + 40);
  LODWORD(v12) = *(_DWORD *)(a1 + 40);
  if (v12 | v9
    || *(_DWORD *)(a1 + 44) != 1
    || *(void *)(a1 + 24) != *(void *)(a1 + 16)
    || (unint64_t)(*(void *)(a1 + 88) + 16) >= 0xE01)
  {
    if (!v10) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  return 0;
}

uint64_t loadChunkOffsets(int fd, int a2, unsigned int a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t __s = 0;
  size_t v31 = 0;
  unint64_t v32 = 0;
  if (a2 == 4) {
    unint64_t v9 = 8 * a3 + 264;
  }
  else {
    unint64_t v9 = 4 * a3 + 4;
  }
  if (v9 >= 0xFFFFFFFF)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkHeaderSize", 146, 55, 0, "invalid file size", a7, a8, v29);
    __int16 v12 = 329;
    int v13 = "invalid file size";
LABEL_27:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"loadChunkOffsets", v12, 55, 0, v13, v10, v11, v29);
    uint64_t v21 = 0;
LABEL_28:
    uint64_t v27 = 0xFFFFFFFFLL;
    goto LABEL_29;
  }
  unint64_t v17 = v9 & 0xFFFFFFFC;
  if ((v9 & 0xFFFFFFFC) != 0)
  {
    size_t v18 = 0;
    do
    {
      while (!v18)
      {
        size_t v18 = 0x4000;
        if (v17 <= 0x4000)
        {
          size_t v18 = 0x4000;
          goto LABEL_17;
        }
      }
      size_t v19 = v18 >> 1;
      if ((v18 & (v18 >> 1)) != 0) {
        size_t v19 = v18 & (v18 >> 1);
      }
      v18 += v19;
    }
    while (v18 < v17);
    if (v18 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_26;
    }
LABEL_17:
    int v20 = (char *)malloc(v18);
    if (v20)
    {
      uint64_t v21 = v20;
      size_t v31 = v18;
      unint64_t v32 = v20;
      ssize_t v22 = fgetxattr(fd, "com.apple.ResourceFork", v20, v9 & 0xFFFFFFFC, 0, 32);
      goto LABEL_20;
    }
LABEL_26:
    size_t v31 = 0;
    unint64_t v32 = 0;
    uint64_t __s = 0;
    int v13 = "alloc buffer";
    __int16 v12 = 332;
    goto LABEL_27;
  }
  ssize_t v22 = fgetxattr(fd, "com.apple.ResourceFork", 0, 0, 0, 32);
  uint64_t v21 = 0;
LABEL_20:
  if (v22 != v17)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"loadChunkOffsets", 335, 55, 0, "read resource fork header", v23, v24, v29);
    goto LABEL_28;
  }
  uint64_t __s = v9 & 0xFFFFFFFC;
  if (a2 == 4)
  {
    *a4 = v9;
    if (a3)
    {
      uint64_t v25 = 0;
      long long v26 = a4 + 1;
      do
      {
        LODWORD(v9) = v9 + *(_DWORD *)&v21[v25 + 268];
        *v26++ = v9;
        v25 += 8;
      }
      while (8 * a3 != v25);
    }
  }
  else
  {
    memcpy(a4, v21, v9 & 0xFFFFFFFC);
  }
  uint64_t v27 = 0;
LABEL_29:
  free(v21);
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  return v27;
}

AAByteStream AACompressionOutputStreamOpen(AAByteStream compressed_stream, AACompressionAlgorithm compression_algorithm, size_t block_size, AAFlagSet flags, int n_threads)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v9 = calloc(1uLL, 0x68uLL);
  if (!v9)
  {
    int v16 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpen", 254, 19, *v16, "malloc", v17, v18, v32);
    uint64_t v10 = 0;
LABEL_37:
    free(v9);
    aaCompressionOutputStreamClose(v10, v24, v25, v26, v27, v28, v29, v30);
    return 0;
  }
  uint64_t v10 = (uint64_t *)calloc(1uLL, 0x30uLL);
  if (!v10)
  {
    int v19 = *__error();
    int v20 = "malloc";
    __int16 v21 = 256;
LABEL_36:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpen", v21, 19, v19, v20, v13, v14, v32);
    goto LABEL_37;
  }
  if (!n_threads) {
    n_threads = getDefaultNThreads();
  }
  *((_DWORD *)v10 + 2) = n_threads;
  uint64_t v11 = calloc(n_threads, 8uLL);
  v10[2] = (uint64_t)v11;
  if (*((_DWORD *)v10 + 2))
  {
    unint64_t v12 = 0;
    while (1)
    {
      *(void *)(v10[2] + 8 * v12) = CompressionWorkerDataCreate(block_size, (compression_algorithm)compression_algorithm);
      uint64_t v15 = v10[2];
      if (!*(void *)(v15 + 8 * v12)) {
        break;
      }
      ++v12;
      uint64_t v11 = (void *)*((unsigned int *)v10 + 2);
      if (v12 >= (unint64_t)v11) {
        goto LABEL_13;
      }
    }
    int v20 = "Worker data allocation";
    __int16 v21 = 264;
    goto LABEL_35;
  }
  uint64_t v15 = (uint64_t)v11;
  LODWORD(v11) = 0;
LABEL_13:
  ssize_t v22 = ThreadPipelineCreate(v11, v15, (uint64_t)CompressionWorkerProc, (uint64_t)v10, (uint64_t)CompressionConsumerProc, 0);
  *uint64_t v10 = (uint64_t)v22;
  if (!v22)
  {
    int v20 = "Thread allocation";
    __int16 v21 = 267;
LABEL_35:
    int v19 = 0;
    goto LABEL_36;
  }
  v10[3] = (uint64_t)compressed_stream;
  qmemcpy(buf, "pbz", sizeof(buf));
  char v23 = 122;
  if ((int)compression_algorithm <= 1284)
  {
    if (compression_algorithm)
    {
      if (compression_algorithm == 256)
      {
        char v23 = 52;
      }
      else
      {
        if (compression_algorithm != 774) {
          goto LABEL_34;
        }
        char v23 = 120;
      }
    }
    else
    {
      char v23 = 45;
    }
  }
  else
  {
    if ((int)compression_algorithm <= 2048)
    {
      if (compression_algorithm == 1285) {
        goto LABEL_31;
      }
      if (compression_algorithm == 1794)
      {
        char v23 = 98;
        goto LABEL_31;
      }
LABEL_34:
      int v20 = "Invalid compression algorithm";
      __int16 v21 = 274;
      goto LABEL_35;
    }
    if (compression_algorithm == 2049)
    {
      char v23 = 101;
    }
    else
    {
      if (compression_algorithm != 2304) {
        goto LABEL_34;
      }
      char v23 = 102;
    }
  }
LABEL_31:
  char v34 = v23;
  unint64_t v35 = bswap64(block_size);
  if (AAByteStreamWrite(compressed_stream, buf, 0xCuLL) != 12)
  {
    int v20 = "writing stream magic";
    __int16 v21 = 277;
    goto LABEL_35;
  }
  v9[3] = aaCompressionOutputStreamWrite;
  v9[7] = aaCompressionOutputStreamAbort;
  *unint64_t v9 = v10;
  v9[1] = aaCompressionOutputStreamClose;
  v9[9] = aaCompressionOutputStreamFlush;
  return (AAByteStream)v9;
}

void *CompressionWorkerDataCreate(size_t a1, compression_algorithm a2)
{
  __int16 v4 = 56;
  uint64_t v5 = calloc(1uLL, 0x38uLL);
  __int16 v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  v5[1] = 0;
  v5[2] = 0;
  *uint64_t v5 = a1;
  if (a1 >= 0x2000000001)
  {
    *__error() = 12;
    v6[3] = 0;
    *__error() = 12;
    size_t v7 = v6 + 4;
    __int16 v4 = 62;
LABEL_4:
    *size_t v7 = 0;
LABEL_5:
    stat v8 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"CompressionWorkerDataCreate", v4, 19, *v8, "malloc", v9, v10, v16);
    CompressionWorkerDataDestroy((void **)v6);
    return 0;
  }
  unint64_t v12 = malloc(a1);
  v6[3] = v12;
  uint64_t v13 = malloc(a1);
  v6[4] = v13;
  __int16 v4 = 62;
  if (!v12 || !v13) {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 10) = a2;
  if (a2)
  {
    if (a2 != COMPRESSION_LZMA)
    {
      size_t v14 = compression_encode_scratch_buffer_size(a2);
      if (v14)
      {
        if (v14 < 0x2000000001)
        {
          uint64_t v15 = malloc(v14);
          v6[6] = v15;
          if (v15) {
            return v6;
          }
          __int16 v4 = 68;
          goto LABEL_5;
        }
        *__error() = 12;
        size_t v7 = v6 + 6;
        __int16 v4 = 68;
        goto LABEL_4;
      }
    }
  }
  return v6;
}

uint64_t CompressionWorkerProc(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 8);
  compression_algorithm v3 = *(_DWORD *)(a1 + 40);
  if (!v3
    || (v3 != COMPRESSION_LZMA
      ? (v5 = compression_encode_buffer(*(uint8_t **)(a1 + 32), *(void *)a1, *(const uint8_t **)(a1 + 24), v2, *(void **)(a1 + 48), v3)): (int64_t v4 = PCompressLZMA6Encode(*(uint8_t **)(a1 + 32), *(void *)a1, *(const uint8_t **)(a1 + 24), v2), v5 = v4 & ~(v4 >> 63)), v5 ? (v6 = v5 + (v2 >> 4) >= v2) : (v6 = 1), v6))
  {
    memcpy(*(void **)(a1 + 32), *(const void **)(a1 + 24), v2);
    size_t v5 = v2;
  }
  *(void *)(a1 + 16) = v5;
  return 0;
}

uint64_t CompressionConsumerProc(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a1 + 40))
  {
    int8x16_t v8 = vrev64q_s8(*(int8x16_t *)(a2 + 8));
    if (AAByteStreamWrite(*(AAByteStream *)(a1 + 24), &v8, 0x10uLL) == 16)
    {
      if (AAByteStreamWrite(*(AAByteStream *)(a1 + 24), *(const void **)(a2 + 32), *(void *)(a2 + 16)) == *(void *)(a2 + 16)) {
        return 0;
      }
      __int16 v7 = 119;
    }
    else
    {
      __int16 v7 = 115;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"CompressionConsumerProc", v7, 19, 0, "Stream write failed", v4, v5, v8.i8[0]);
    *(_DWORD *)(a1 + 40) = 1;
  }
  return 0xFFFFFFFFLL;
}

uint64_t aaCompressionOutputStreamWrite(uint64_t a1, uint64_t __src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0;
  }
  size_t v8 = a3;
  uint64_t v9 = (char *)__src;
  uint64_t v11 = 0;
  while (1)
  {
    unint64_t v12 = *(uint64_t **)(a1 + 32);
    if (v12)
    {
      uint64_t v13 = v12[1];
      goto LABEL_7;
    }
    uint64_t Worker = ThreadPipelineGetWorker(*(void *)a1, __src, a3, a4, a5, a6, a7, a8);
    *(void *)(a1 + 32) = Worker;
    if (!Worker) {
      break;
    }
    unint64_t v12 = (uint64_t *)Worker;
    uint64_t v13 = 0;
    *(void *)(Worker + 8) = 0;
    *(void *)(Worker + 16) = 0;
LABEL_7:
    if (*v12 - v13 >= v8) {
      size_t v15 = v8;
    }
    else {
      size_t v15 = *v12 - v13;
    }
    memcpy((void *)(v12[3] + v13), v9, v15);
    uint64_t v16 = *v12;
    size_t v17 = v12[1] + v15;
    v12[1] = v17;
    if (v17 == v16)
    {
      if ((ThreadPipelineRunWorker(*(void *)a1, *(void *)(a1 + 32), a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
      {
        uint64_t v18 = "running worker";
        __int16 v19 = 186;
        goto LABEL_18;
      }
      *(void *)(a1 + 32) = 0;
    }
    v9 += v15;
    v11 += v15;
    v8 -= v15;
    if (!v8) {
      return v11;
    }
  }
  uint64_t v18 = "getting next worker";
  __int16 v19 = 168;
LABEL_18:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamWrite", v19, 19, 0, v18, a7, a8, v21);
  *(_DWORD *)(a1 + 40) = 1;
  return -1;
}

uint64_t aaCompressionOutputStreamAbort(uint64_t result)
{
  *(_DWORD *)(result + 40) = 1;
  return result;
}

uint64_t *aaCompressionOutputStreamClose(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    size_t v8 = result;
    uint64_t v9 = result[4];
    if (v9)
    {
      if ((ThreadPipelineRunWorker(*result, v9, a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamClose", 133, 19, 0, "RunWorker", v10, v11, v20);
        int v12 = 0;
      }
      else
      {
        int v12 = 1;
      }
      v8[4] = 0;
    }
    else
    {
      int v12 = 1;
    }
    if ((ThreadPipelineDestroy(*v8) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamClose", 138, 19, 0, "Thread shutdown", v13, v14, v20);
      int v12 = 0;
    }
    size_t v15 = (void *)v8[2];
    if (v15)
    {
      if (*((_DWORD *)v8 + 2))
      {
        unint64_t v16 = 0;
        do
          CompressionWorkerDataDestroy(*(void ***)(v8[2] + 8 * v16++));
        while (v16 < *((unsigned int *)v8 + 2));
        size_t v15 = (void *)v8[2];
      }
      free(v15);
    }
    if (*((_DWORD *)v8 + 11)
      && (AAByteStreamSeek((AAByteStream)v8[3], 0, 1) < 0 || (AAByteStreamTruncate((void *)v8[3]) & 0x80000000) != 0))
    {
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamClose", 151, 19, "Truncate on compressed stream failed", v17, v18, v19, v20);
    }
    free(v8);
    if (v12) {
      return 0;
    }
    else {
      return (uint64_t *)0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t aaCompressionOutputStreamFlush(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40)) {
    return 0xFFFFFFFFLL;
  }
  if ((ThreadPipelineFlush(*(void *)a1) & 0x80000000) != 0)
  {
    uint64_t v10 = "ThreadPipelineFlush";
    __int16 v11 = 209;
LABEL_15:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamFlush", v11, 19, 0, v10, v2, v3, v12);
    *(_DWORD *)(a1 + 40) = 1;
    return 0xFFFFFFFFLL;
  }
  if (*(void *)(a1 + 32))
  {
    off_t v4 = AAByteStreamSeek(*(AAByteStream *)(a1 + 24), 0, 1);
    if (v4 < 0)
    {
      uint64_t v10 = "AAByteStreamSeek";
      __int16 v11 = 216;
    }
    else
    {
      off_t v5 = v4;
      CompressionWorkerProc(*(void *)(a1 + 32));
      if ((CompressionConsumerProc(a1, *(void *)(a1 + 32)) & 0x80000000) != 0)
      {
        uint64_t v10 = "CompressionConsumerProc";
        __int16 v11 = 220;
      }
      else
      {
        if (v5 == AAByteStreamSeek(*(AAByteStream *)(a1 + 24), v5, 0))
        {
          *(_DWORD *)(a1 + 44) = 1;
          goto LABEL_8;
        }
        uint64_t v10 = "AAByteStreamSeek";
        __int16 v11 = 223;
      }
    }
    goto LABEL_15;
  }
LABEL_8:
  if ((AAByteStreamFlush(*(void **)(a1 + 24)) & 0x80000000) != 0) {
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamFlush", 230, 19, "Flush on underlying stream failed", v6, v7, v8, v12);
  }
  return 0;
}

AAByteStream AACompressionOutputStreamOpenExisting(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  off_t v5 = AAByteStreamSeek(compressed_stream, 0, 2);
  if (v5 < 0)
  {
    size_t v15 = "Stream seek";
    __int16 v16 = 311;
    goto LABEL_15;
  }
  if (!*((void *)compressed_stream + 4))
  {
LABEL_13:
    size_t v15 = "Truncated stream";
    __int16 v16 = 315;
LABEL_15:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", v16, 19, 0, v15, v6, v7, v78);
    uint64_t v17 = 0;
    uint64_t v18 = 0;
LABEL_16:
    uint64_t v19 = 0;
    char v20 = 0;
LABEL_17:
    int v21 = 1;
    goto LABEL_18;
  }
  off_t v8 = v5;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  __int16 v11 = &v86;
  uint64_t v12 = 12;
  do
  {
    uint64_t v13 = (*((uint64_t (**)(void, __int16 *, uint64_t, uint64_t))compressed_stream + 4))(*(void *)compressed_stream, v11, v12, v10);
    if (v13 < 0) {
      goto LABEL_13;
    }
    if (!v13) {
      break;
    }
    __int16 v11 = (__int16 *)((char *)v11 + v13);
    v9 += v13;
    v10 += v13;
    v12 -= v13;
  }
  while (v12);
  if (v9 != 12) {
    goto LABEL_13;
  }
  if (v86 != 25200 || v87 != 122)
  {
    size_t v15 = "Invalid stream magic";
    __int16 v16 = 316;
    goto LABEL_15;
  }
  if (v88 <= 100)
  {
    switch(v88)
    {
      case '-':
        int v30 = 0;
        uint64_t v79 = 0x100000000;
        break;
      case '4':
        uint64_t v79 = 0;
        int v30 = 256;
        break;
      case 'b':
        uint64_t v79 = 0;
        int v30 = 1794;
        break;
      default:
        goto LABEL_60;
    }
  }
  else if (v88 > 119)
  {
    if (v88 == 120)
    {
      int v30 = 774;
      uint64_t v79 = 1;
    }
    else
    {
      if (v88 != 122) {
        goto LABEL_60;
      }
      uint64_t v79 = 0;
      int v30 = 1285;
    }
  }
  else
  {
    if (v88 != 101)
    {
      if (v88 == 102)
      {
        uint64_t v79 = 0;
        int v30 = 2304;
        goto LABEL_37;
      }
LABEL_60:
      size_t v15 = "Invalid stream compression key";
      __int16 v16 = 317;
      goto LABEL_15;
    }
    uint64_t v79 = 0;
    int v30 = 2049;
  }
LABEL_37:
  compression_algorithm algorithm = v30;
  size_t v31 = bswap64(v89);
  __unsigned int size = v31;
  if (v8 >= 13)
  {
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 12;
LABEL_39:
    unint64_t v80 = v33;
    if (*((void *)compressed_stream + 4))
    {
      uint64_t v36 = v34;
      unint64_t v37 = v32;
      unint64_t v38 = 0;
      size_t v39 = &v84;
      uint64_t v40 = v35;
      uint64_t v41 = 16;
      while (1)
      {
        uint64_t v42 = (*((uint64_t (**)(void, unint64_t *, uint64_t, uint64_t))compressed_stream + 4))(*(void *)compressed_stream, v39, v41, v40);
        if (v42 < 0) {
          break;
        }
        if (v42)
        {
          size_t v39 = (unint64_t *)((char *)v39 + v42);
          v38 += v42;
          v40 += v42;
          v41 -= v42;
          if (v41) {
            continue;
          }
        }
        if ((v38 & 0x8000000000000000) != 0) {
          break;
        }
        if (!v38)
        {
          unint64_t v32 = v37;
          size_t v31 = __size;
          unint64_t v33 = v80;
          goto LABEL_53;
        }
        size_t v31 = __size;
        if (v38 <= 0xF)
        {
          size_t v15 = "Truncated stream";
          __int16 v16 = 329;
          goto LABEL_15;
        }
        unint64_t v43 = v85;
        unint64_t v32 = bswap64(v84);
        unint64_t v33 = bswap64(v85);
        unint64_t v84 = v32;
        unint64_t v85 = v33;
        if (v32 < v33 || v32 - 1 >= __size || !v43)
        {
          size_t v15 = "Corrupted stream";
          __int16 v16 = 339;
          goto LABEL_15;
        }
        uint64_t v36 = v35;
        v35 += v33 + 16;
        uint64_t v34 = v36;
        if (v35 < v8) {
          goto LABEL_39;
        }
        goto LABEL_53;
      }
    }
    size_t v15 = "reading block header";
    __int16 v16 = 327;
    goto LABEL_15;
  }
  uint64_t v36 = 0;
  unint64_t v33 = 0;
  unint64_t v32 = 0;
  uint64_t v35 = 12;
LABEL_53:
  if (v35 != v8)
  {
    size_t v15 = "Corrupted stream";
    __int16 v16 = 342;
    goto LABEL_15;
  }
  if (v32 >= v31)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    compression_algorithm v49 = algorithm;
  }
  else
  {
    if (v31 >= 0x2000000001)
    {
      *__error() = 12;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      *__error() = 12;
LABEL_57:
      int v44 = *__error();
      long long v47 = "malloc";
      __int16 v48 = 349;
LABEL_105:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", v48, 19, v44, v47, v45, v46, v78);
      goto LABEL_16;
    }
    uint64_t v18 = (uint8_t *)malloc(v31);
    long long v55 = (uint8_t *)malloc(v31);
    uint64_t v17 = v55;
    if (!v18 || !v55) {
      goto LABEL_57;
    }
    off_t v81 = v36;
    if (*((void *)compressed_stream + 4))
    {
      size_t v56 = v32;
      size_t v57 = v33;
      if (v33)
      {
        uint64_t v58 = 0;
        uint64_t v59 = v36 + 16;
        long long v60 = v55;
        size_t v61 = v57;
        while (1)
        {
          uint64_t v62 = (*((uint64_t (**)(void, uint8_t *, size_t, uint64_t))compressed_stream + 4))(*(void *)compressed_stream, v60, v57, v59);
          if (v62 < 0) {
            break;
          }
          if (v62)
          {
            v60 += v62;
            v58 += v62;
            v59 += v62;
            v57 -= v62;
            if (v57) {
              continue;
            }
          }
          goto LABEL_100;
        }
        uint64_t v58 = v62;
      }
      else
      {
        size_t v61 = 0;
        uint64_t v58 = 0;
      }
    }
    else
    {
      size_t v61 = v33;
      size_t v56 = v32;
      uint64_t v58 = -1;
    }
LABEL_100:
    if (v58 != v61)
    {
      long long v47 = "loading last block";
      __int16 v48 = 352;
      goto LABEL_104;
    }
    unint64_t v32 = v56;
    if (((v61 != v56) & ~HIDWORD(v79)) != 0)
    {
      size_t v31 = __size;
      off_t v8 = v81;
      if (v79)
      {
        int64_t v73 = PCompressLZMADecode(v18, __size, v17, v61);
        size_t v74 = v73 & ~(v73 >> 63);
        compression_algorithm v49 = algorithm;
      }
      else
      {
        compression_algorithm v49 = algorithm;
        size_t v74 = compression_decode_buffer(v18, __size, v17, v61, 0, algorithm);
      }
      if (v74 != v32)
      {
        long long v47 = "Last block decompression";
        __int16 v48 = 369;
        goto LABEL_104;
      }
    }
    else
    {
      memcpy(v18, v17, v56);
      compression_algorithm v49 = algorithm;
      size_t v31 = __size;
      off_t v8 = v81;
    }
    if ((AAByteStreamTruncate(compressed_stream) & 0x80000000) != 0) {
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", 375, 19, "Warning: container truncate failed", v75, v76, v77, v78);
    }
  }
  if (AAByteStreamSeek(compressed_stream, v8, 0) < 0)
  {
    long long v47 = "Stream seek";
    __int16 v48 = 380;
LABEL_104:
    int v44 = 0;
    goto LABEL_105;
  }
  char v20 = calloc(1uLL, 0x68uLL);
  if (!v20)
  {
    long long v63 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", 384, 19, *v63, "malloc", v64, v65, v78);
    uint64_t v19 = 0;
    goto LABEL_17;
  }
  uint64_t v19 = (unsigned int *)calloc(1uLL, 0x30uLL);
  if (!v19)
  {
    int v66 = *__error();
    size_t v67 = "malloc";
    __int16 v68 = 386;
LABEL_98:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", v68, 19, v66, v67, v52, v53, v78);
    goto LABEL_17;
  }
  if (!n_threads) {
    n_threads = getDefaultNThreads();
  }
  v19[2] = n_threads;
  long long v50 = calloc(n_threads, 8uLL);
  *((void *)v19 + 2) = v50;
  if (v19[2])
  {
    unint64_t v51 = 0;
    while (1)
    {
      *(void *)(*((void *)v19 + 2) + 8 * v51) = CompressionWorkerDataCreate(v31, v49);
      uint64_t v54 = *((void *)v19 + 2);
      if (!*(void *)(v54 + 8 * v51)) {
        break;
      }
      ++v51;
      long long v50 = (void *)v19[2];
      if (v51 >= (unint64_t)v50) {
        goto LABEL_88;
      }
    }
    size_t v67 = "Worker data allocation";
    __int16 v68 = 394;
    goto LABEL_97;
  }
  uint64_t v54 = (uint64_t)v50;
  LODWORD(v50) = 0;
LABEL_88:
  int v69 = ThreadPipelineCreate(v50, v54, (uint64_t)CompressionWorkerProc, (uint64_t)v19, (uint64_t)CompressionConsumerProc, 0);
  *(void *)uint64_t v19 = v69;
  if (!v69)
  {
    size_t v67 = "Thread allocation";
    __int16 v68 = 397;
LABEL_97:
    int v66 = 0;
    goto LABEL_98;
  }
  *((void *)v19 + 3) = compressed_stream;
  if (v18 && aaCompressionOutputStreamWrite((uint64_t)v19, (uint64_t)v18, v32, v70, v71, v72, v52, v53) != v32)
  {
    size_t v67 = "re-writing last block";
    __int16 v68 = 404;
    goto LABEL_97;
  }
  int v21 = 0;
  v20[3] = aaCompressionOutputStreamWrite;
  v20[7] = aaCompressionOutputStreamAbort;
  *char v20 = v19;
  v20[1] = aaCompressionOutputStreamClose;
  v20[9] = aaCompressionOutputStreamFlush;
LABEL_18:
  free(v18);
  free(v17);
  if (v21)
  {
    free(v20);
    aaCompressionOutputStreamClose((uint64_t *)v19, v22, v23, v24, v25, v26, v27, v28);
    return 0;
  }
  return (AAByteStream)v20;
}

void CompressionWorkerDataDestroy(void **a1)
{
  if (a1)
  {
    free(a1[3]);
    free(a1[4]);
    free(a1[6]);
    free(a1);
  }
}

size_t aaDecompressionStreamAbort(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *(_DWORD *)(a1 + 68) = 1;
  size_t result = *(void *)(a1 + 72);
  if (result) {
    return IDecoderStreamAbort(result, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

uint64_t jsonPushLabel(uint64_t a1, char a2)
{
  unint64_t v4 = *(void *)(a1 + 72);
  unint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = (void *)(a1 + 72);
  if (v5 >= v4)
  {
    if (v4) {
      size_t v8 = v4 + (v4 >> 1);
    }
    else {
      size_t v8 = 256;
    }
    *(void *)(a1 + 72) = v8;
    uint64_t v7 = reallocf(*(void **)(a1 + 88), v8);
    *(void *)(a1 + 88) = v7;
    if (!v7)
    {
      uint64_t v10 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"jsonPushLabel", 358, 109, *v10, "malloc", v11, v12, v14);
      *uint64_t v6 = 0;
      v6[1] = 0;
      return 0xFFFFFFFFLL;
    }
    unint64_t v5 = *(void *)(a1 + 80);
  }
  else
  {
    uint64_t v7 = *(unsigned char **)(a1 + 88);
  }
  uint64_t v9 = 0;
  *(void *)(a1 + 80) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

uint64_t jsonPushValue(uint64_t a1, char a2)
{
  unint64_t v4 = *(void *)(a1 + 96);
  unint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = (void *)(a1 + 96);
  if (v5 >= v4)
  {
    if (v4) {
      size_t v8 = v4 + (v4 >> 1);
    }
    else {
      size_t v8 = 256;
    }
    *(void *)(a1 + 96) = v8;
    uint64_t v7 = reallocf(*(void **)(a1 + 112), v8);
    *(void *)(a1 + 112) = v7;
    if (!v7)
    {
      uint64_t v10 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"jsonPushValue", 372, 109, *v10, "malloc", v11, v12, v14);
      *uint64_t v6 = 0;
      v6[1] = 0;
      return 0xFFFFFFFFLL;
    }
    unint64_t v5 = *(void *)(a1 + 104);
  }
  else
  {
    uint64_t v7 = *(unsigned char **)(a1 + 112);
  }
  uint64_t v9 = 0;
  *(void *)(a1 + 104) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

void *AAJSONInputStreamOpen(uint64_t a1)
{
  uint64_t v2 = malloc(0x78uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    memset_s(v2, 0x78uLL, 0, 0x78uLL);
    v3[1] = a1;
    v3[5] = 0x10000;
    unint64_t v4 = malloc(0x10000uLL);
    v3[8] = v4;
    if (v4)
    {
      *(void *)((char *)v3 + 20) = 32;
      v3[4] = calloc(0x20uLL, 4uLL);
    }
    else
    {
      size_t v8 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamOpen", 387, 109, *v8, "malloc", v9, v10, v12);
      AAJSONInputStreamClose((void **)v3);
      return 0;
    }
  }
  else
  {
    unint64_t v5 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamOpen", 382, 109, *v5, "malloc", v6, v7, v12);
  }
  return v3;
}

void AAJSONInputStreamClose(void **a1)
{
  if (a1)
  {
    free(a1[4]);
    free(a1[11]);
    free(a1[14]);
    free(a1[8]);
    free(a1);
  }
}

uint64_t AAJSONInputStreamRead(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (atomic_load((unsigned int *)a1)) {
    return 0xFFFFFFFFLL;
  }
  int v10 = *(_DWORD *)(a1 + 16);
  if (v10 == 9 || v10 == -1)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", 418, 109, 0, "unexpected read call", a7, a8, v46);
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 104) = 0;
  uint64_t v14 = MEMORY[0x263EF8318];
  while (2)
  {
    unint64_t v15 = *(void *)(a1 + 56);
    __int16 v16 = *(unsigned __int8 **)(a1 + 64);
    if (v15 >= *(void *)(a1 + 48))
    {
      ssize_t v17 = AAByteStreamRead(*(AAByteStream *)(a1 + 8), v16, *(void *)(a1 + 40));
      if (v17 < 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", 430, 109, 0, "read error: %zd", a7, a8, v17);
LABEL_104:
        uint64_t result = 0xFFFFFFFFLL;
        *(_DWORD *)(a1 + 16) = -1;
        return result;
      }
      if (!v17)
      {
        int v30 = "EOF reached";
        __int16 v31 = 431;
        goto LABEL_103;
      }
      unint64_t v15 = 0;
      *(void *)(a1 + 48) = v17;
      __int16 v16 = *(unsigned __int8 **)(a1 + 64);
    }
    *(void *)(a1 + 56) = v15 + 1;
    int v18 = v16[v15];
    char v19 = v16[v15];
    switch(*(_DWORD *)(a1 + 16))
    {
      case 0:
        *(void *)(a1 + 104) = 0;
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL)) {
            continue;
          }
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        if (v18 == 34) {
          goto LABEL_68;
        }
        if (v18 == 43 || v18 == 45 || ((char)v18 - 48) <= 9)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            int v23 = 3;
            goto LABEL_69;
          }
          int v30 = "jsonPushValue";
          __int16 v31 = 451;
          goto LABEL_103;
        }
        if (v18 == 123)
        {
          uint64_t v32 = *(unsigned int *)(a1 + 24);
          if (v32 == *(_DWORD *)(a1 + 20))
          {
            int v30 = "max level reached";
            __int16 v31 = 465;
            goto LABEL_103;
          }
          int v27 = 0;
          uint64_t v44 = *(void *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v32 + 1;
          *(_DWORD *)(v44 + 4 * v32) = 0;
          int v37 = 6;
          goto LABEL_125;
        }
        if (v18 == 91)
        {
          uint64_t v33 = *(unsigned int *)(a1 + 24);
          if (v33 == *(_DWORD *)(a1 + 20))
          {
            int v30 = "max level reached";
            __int16 v31 = 457;
            goto LABEL_103;
          }
          int v37 = 0;
          uint64_t v45 = *(void *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v33 + 1;
          int v27 = 1;
          *(_DWORD *)(v45 + 4 * v33) = 1;
          goto LABEL_125;
        }
        if (((char)v18 - 97) <= 0x19)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            int v23 = 4;
            goto LABEL_69;
          }
          int v30 = "jsonPushValue";
          __int16 v31 = 473;
          goto LABEL_103;
        }
        unsigned int v25 = *(_DWORD *)(a1 + 24) - 1;
        BOOL v34 = (*(_DWORD *)(*(void *)(a1 + 32) + 4 * v25) & 1) == 0 || (char)v18 != 93;
        BOOL v35 = (*(_DWORD *)(*(void *)(a1 + 32) + 4 * v25) & 1) == 0 && (char)v18 == 125;
        if (v34 && !v35) {
          goto LABEL_102;
        }
        goto LABEL_121;
      case 1:
        if (v18 == 92)
        {
          int v23 = 2;
          goto LABEL_69;
        }
        if (v18 == 34)
        {
          *(_DWORD *)(a1 + 16) = 5;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            int v27 = 3;
            goto LABEL_126;
          }
          int v30 = "jsonPushValue";
          __int16 v31 = 499;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          int v30 = "jsonPushValue";
          __int16 v31 = 503;
          goto LABEL_103;
        }
        continue;
      case 2:
        HIDWORD(v21) = (char)v18;
        LODWORD(v21) = ((char)v18 << 24) - 1644167168;
        unsigned __int8 v20 = v21 >> 25;
        if (v20 < 0xAu && ((0x341u >> v20) & 1) != 0)
        {
          char v22 = byte_214B131D8[(char)v20];
        }
        else if ((char)v18 == 102)
        {
          char v22 = 12;
        }
        else
        {
          char v22 = v19;
        }
        if ((jsonPushValue(a1, v22) & 0x80000000) != 0)
        {
          int v30 = "jsonPushValue";
          __int16 v31 = 512;
          goto LABEL_103;
        }
LABEL_68:
        int v23 = 1;
        goto LABEL_69;
      case 3:
        if (((char)v18 - 48) > 9)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(void *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            int v27 = 4;
            goto LABEL_126;
          }
          int v30 = "jsonPushValue";
          __int16 v31 = 539;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          int v30 = "jsonPushValue";
          __int16 v31 = 533;
          goto LABEL_103;
        }
        continue;
      case 4:
        if (((char)v18 - 97) > 0x19)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(void *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            uint64_t v28 = *(const char **)(a1 + 112);
            if (!strcmp(v28, "false") || !strcmp(v28, "true"))
            {
              int v27 = 6;
            }
            else
            {
              if (strcmp(v28, "null")) {
                goto LABEL_102;
              }
              int v27 = 7;
            }
            goto LABEL_126;
          }
          int v30 = "jsonPushValue";
          __int16 v31 = 524;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          int v30 = "jsonPushValue";
          __int16 v31 = 519;
          goto LABEL_103;
        }
        continue;
      case 5:
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL)) {
            continue;
          }
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        int v24 = *(_DWORD *)(a1 + 24);
        if (!v24)
        {
          int v30 = "invalid JSON state";
          __int16 v31 = 546;
          goto LABEL_103;
        }
        unsigned int v25 = v24 - 1;
        int v26 = *(_DWORD *)(*(void *)(a1 + 32) + 4 * v25);
        if (v18 != 44)
        {
          if (v18 == 93)
          {
            if (v26) {
              goto LABEL_121;
            }
            char v19 = 93;
          }
          else if (v18 == 125)
          {
            goto LABEL_91;
          }
LABEL_102:
          char v46 = v19;
          int v30 = "invalid char %c %s";
          __int16 v31 = 610;
          goto LABEL_103;
        }
        if (v26) {
          int v23 = 0;
        }
        else {
          int v23 = 6;
        }
LABEL_69:
        *(_DWORD *)(a1 + 16) = v23;
        continue;
      case 6:
        *(void *)(a1 + 80) = 0;
        if (((char)v18 & 0x80000000) == 0)
        {
          if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) == 0) {
            goto LABEL_61;
          }
          continue;
        }
        if (__maskrune((char)v18, 0x4000uLL)) {
          continue;
        }
LABEL_61:
        if (v18 == 34)
        {
          int v23 = 7;
          goto LABEL_69;
        }
        if (v18 != 125) {
          goto LABEL_102;
        }
        int v29 = *(_DWORD *)(a1 + 24);
        if (!v29) {
          goto LABEL_92;
        }
        unsigned int v25 = v29 - 1;
        int v26 = *(_DWORD *)(*(void *)(a1 + 32) + 4 * v25);
LABEL_91:
        if (v26)
        {
LABEL_92:
          char v19 = 125;
          goto LABEL_102;
        }
LABEL_121:
        *(_DWORD *)(a1 + 24) = v25;
        if (v25) {
          int v37 = 5;
        }
        else {
          int v37 = 9;
        }
        int v27 = 2;
LABEL_125:
        *(_DWORD *)(a1 + 16) = v37;
LABEL_126:
        if (a2) {
          memset_s(a2, 0x38uLL, 0, 0x38uLL);
        }
        *a2 = v27;
        uint64_t v38 = *(void *)(a1 + 80);
        if (v38) {
          uint64_t v38 = *(void *)(a1 + 88);
        }
        *((void *)a2 + 1) = v38;
        a2[12] = *(_DWORD *)(a1 + 24);
        if (v27 == 6)
        {
          int v39 = strcmp(*(const char **)(a1 + 112), "true");
          uint64_t result = 0;
          a2[9] = v39 == 0;
        }
        else if (v27 == 4)
        {
          uint64_t v40 = *(const char **)(a1 + 112);
          if (*v40 == 45)
          {
            unint64_t v41 = strtoull(v40 + 1, 0, 10);
            uint64_t result = 0;
            *((void *)a2 + 3) = v41;
            int v42 = -1;
          }
          else
          {
            unint64_t v43 = strtoull(v40, 0, 0);
            uint64_t result = 0;
            *((void *)a2 + 3) = v43;
            int v42 = v43 != 0;
          }
          a2[8] = v42;
        }
        else
        {
          uint64_t result = 0;
          if (v27 == 3) {
            *((void *)a2 + 2) = *(void *)(a1 + 112);
          }
        }
        return result;
      case 7:
        if ((char)v18 == 34)
        {
          if ((jsonPushLabel(a1, 0) & 0x80000000) == 0)
          {
            int v23 = 8;
            goto LABEL_69;
          }
          int v30 = "jsonPushLabel";
          __int16 v31 = 587;
LABEL_103:
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", v31, 109, 0, v30, a7, a8, v46);
          goto LABEL_104;
        }
        if ((jsonPushLabel(a1, v18) & 0x80000000) != 0)
        {
          int v30 = "jsonPushLabel";
          __int16 v31 = 591;
          goto LABEL_103;
        }
        continue;
      case 8:
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL)) {
            continue;
          }
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        if ((char)v18 != 58) {
          goto LABEL_102;
        }
        int v23 = 0;
        goto LABEL_69;
      default:
        goto LABEL_102;
    }
  }
}

unsigned int *ThreadPoolCreate(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (unsigned int *)calloc(1uLL, 0xA8uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    *uint64_t v6 = a1;
    size_t v8 = calloc(a1, 0xA8uLL);
    *((void *)v7 + 1) = v8;
    if (v8)
    {
      size_t v9 = *v7;
      v7[8] = 0;
      v7[9] = v9;
      int v10 = calloc(v9, 4uLL);
      *((void *)v7 + 5) = v10;
      if (v10)
      {
        if (pthread_mutex_init((pthread_mutex_t *)(v7 + 12), 0))
        {
          uint64_t v14 = "SharedArrayInit: pthread_mutex_init failed\n";
          __int16 v15 = 56;
        }
        else
        {
          if (!pthread_cond_init((pthread_cond_t *)(v7 + 28), 0))
          {
            v7[4] = -1;
            if (!*v7) {
              return v7;
            }
            uint64_t v22 = 0;
            unint64_t v23 = 0;
            while (1)
            {
              uint64_t v24 = *((void *)v7 + 1);
              uint64_t v25 = v24 + v22;
              *(void *)(v25 + 16) = v7;
              *(_DWORD *)(v25 + 8) = v23;
              *(void *)(v25 + 24) = *(void *)(a2 + 8 * v23);
              *(void *)(v25 + 32) = a3;
              *(_DWORD *)(v25 + 40) = 0;
              if (pthread_mutex_init((pthread_mutex_t *)(v24 + v22 + 48), 0)
                || pthread_cond_init((pthread_cond_t *)(v25 + 112), 0))
              {
                char v19 = "SemInit";
                __int16 v20 = 115;
                goto LABEL_12;
              }
              if ((createThread((pthread_t *)(v24 + v22), (uint64_t)threadPoolWorkerThreadProc, v24 + v22, 0) & 0x80000000) != 0) {
                break;
              }
              ++v23;
              v22 += 168;
              if (v23 >= *v7) {
                return v7;
              }
            }
            char v19 = "Thread creation";
            __int16 v20 = 116;
            goto LABEL_12;
          }
          uint64_t v14 = "SharedArrayInit: pthread_cond_init failed\n";
          __int16 v15 = 57;
        }
      }
      else
      {
        uint64_t v14 = "SharedArrayInit: malloc failed\n";
        __int16 v15 = 55;
      }
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayInit", v15, 0, v14, v11, v12, v13, v26);
      char v19 = "SharedArrayInit";
      __int16 v20 = 104;
LABEL_12:
      int v16 = 0;
      goto LABEL_13;
    }
    int v16 = *__error();
    char v19 = "malloc";
    __int16 v20 = 103;
  }
  else
  {
    int v16 = *__error();
    char v19 = "malloc";
    __int16 v20 = 98;
  }
LABEL_13:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolCreate", v20, 90, v16, v19, v17, v18, v26);
  ThreadPoolDestroy((uint64_t)v7);
  return 0;
}

uint64_t threadPoolWorkerThreadProc(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = *(_DWORD *)(a1 + 8);
  if (pthread_mutex_lock((pthread_mutex_t *)(v2 + 48)))
  {
LABEL_2:
    uint64_t v7 = "SharedArrayPush: pthread_mutex_lock failed\n";
    __int16 v8 = 117;
  }
  else
  {
    while (1)
    {
      uint64_t v13 = *(unsigned int *)(v2 + 32);
      unsigned int v14 = *(_DWORD *)(v2 + 36);
      int v15 = v13;
      if (v13 < v14)
      {
        *(_DWORD *)(*(void *)(v2 + 40) + 4 * v13) = v3;
        int v15 = *(_DWORD *)(v2 + 32);
      }
      *(_DWORD *)(v2 + 32) = v15 + 1;
      if (!v15)
      {
        if (pthread_cond_broadcast((pthread_cond_t *)(v2 + 112))) {
          break;
        }
      }
      if (pthread_mutex_unlock((pthread_mutex_t *)(v2 + 48)))
      {
        uint64_t v7 = "SharedArrayPush: pthread_mutex_unlock failed\n";
        __int16 v8 = 124;
        goto LABEL_3;
      }
      if (v13 >= v14)
      {
        uint64_t v7 = "SharedArrayPush: stack is full\n";
        __int16 v8 = 125;
        goto LABEL_3;
      }
      if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48))) {
        goto LABEL_21;
      }
      while (1)
      {
        int v16 = *(_DWORD *)(a1 + 40);
        if (v16 > 0) {
          break;
        }
        if (pthread_cond_wait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)(a1 + 48))) {
          goto LABEL_21;
        }
      }
      *(_DWORD *)(a1 + 40) = v16 - 1;
      if (pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48)))
      {
LABEL_21:
        uint64_t v11 = "SemAcquire";
        __int16 v12 = 59;
        goto LABEL_22;
      }
      uint64_t v17 = *(void *)(a1 + 160);
      if (v17 != -2)
      {
        if (v17 < 0) {
          return a1;
        }
        if (((*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24)) & 0x80000000) != 0)
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"threadPoolWorkerThreadProc", 72, 90, 0, "worker proc reported an error", v18, v19, v21);
          atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 160), 1u, memory_order_relaxed);
        }
      }
      int v3 = *(_DWORD *)(a1 + 8);
      if (pthread_mutex_lock((pthread_mutex_t *)(v2 + 48))) {
        goto LABEL_2;
      }
    }
    uint64_t v7 = "SharedArrayPush: pthread_cond_broadcast failed\n";
    __int16 v8 = 122;
  }
LABEL_3:
  pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPush", v8, 0, v7, v4, v5, v6, v21);
  uint64_t v11 = "SharedArrayPush";
  __int16 v12 = 56;
LABEL_22:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"threadPoolWorkerThreadProc", v12, 90, 0, v11, v9, v10, v21);
  atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 160), 1u, memory_order_relaxed);
  return a1;
}

uint64_t ThreadPoolDestroy(uint64_t result)
{
  if (result)
  {
    int v1 = (unsigned int *)result;
    uint64_t v2 = *(uint64_t **)(result + 8);
    if (v2)
    {
      uint64_t v3 = *(unsigned int *)result;
      if (!v3)
      {
        int v7 = 1;
        goto LABEL_37;
      }
      int v4 = 0;
      do
      {
        uint64_t v5 = *v2;
        v2 += 21;
        if (v5) {
          ++v4;
        }
        --v3;
      }
      while (v3);
      if (v4)
      {
        int v6 = 0;
        int v7 = 1;
        while (1)
        {
          if (pthread_mutex_lock((pthread_mutex_t *)(v1 + 12)))
          {
            __int16 v11 = 91;
            __int16 v12 = "SharedArrayPop: pthread_mutex_lock failed\n";
LABEL_15:
            pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPop", v11, 0, v12, v8, v9, v10, v35);
            unsigned int v16 = -1;
          }
          else
          {
            while (1)
            {
              unsigned int v13 = v1[8];
              if (v13) {
                break;
              }
              if (pthread_cond_wait((pthread_cond_t *)(v1 + 28), (pthread_mutex_t *)(v1 + 12)))
              {
                __int16 v11 = 94;
                __int16 v12 = "SharedArrayPop: pthread_cond_wait failed\n";
                goto LABEL_15;
              }
            }
            unsigned int v23 = v13 - 1;
            v1[8] = v23;
            unsigned int v16 = *(_DWORD *)(*((void *)v1 + 5) + 4 * v23);
            if (!pthread_mutex_unlock((pthread_mutex_t *)(v1 + 12))) {
              goto LABEL_17;
            }
            pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPop", 98, 0, "SharedArrayPop: pthread_mutex_unlock failed\n", v24, v25, v26, v35);
          }
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolDestroy", 147, 90, 0, "SharedArrayPop", v14, v15, v36);
          int v7 = 0;
LABEL_17:
          uint64_t v17 = *((void *)v1 + 1);
          uint64_t v18 = v17 + 168 * v16;
          *(void *)(v18 + 160) = -1;
          if (pthread_mutex_lock((pthread_mutex_t *)(v18 + 48))
            || (uint64_t v21 = v17 + 168 * v16, v22 = *(_DWORD *)(v21 + 40), *(_DWORD *)(v21 + 40) = v22 + 1, !v22)
            && pthread_cond_broadcast((pthread_cond_t *)(v17 + 168 * v16 + 112))
            || pthread_mutex_unlock((pthread_mutex_t *)(v18 + 48)))
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolDestroy", 155, 90, 0, "SemRelease", v19, v20, v35);
            int v7 = 0;
          }
          if ((joinThread(*(_opaque_pthread_t **)v18) & 0x80000000) != 0)
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolDestroy", 156, 90, 0, "joinThread", v27, v28, v35);
            int v7 = 0;
          }
          *(void *)uint64_t v18 = 0;
          if (++v6 == v4)
          {
            if (!*v1) {
              goto LABEL_37;
            }
            goto LABEL_33;
          }
        }
      }
      int v7 = 1;
LABEL_33:
      unint64_t v29 = 0;
      uint64_t v30 = 112;
      do
      {
        __int16 v31 = (pthread_cond_t *)(*((void *)v1 + 1) + v30);
        if (!pthread_mutex_destroy((pthread_mutex_t *)&v31[-2].__opaque[24])) {
          pthread_cond_destroy(v31);
        }
        ++v29;
        v30 += 168;
      }
      while (v29 < *v1);
LABEL_37:
      free(*((void **)v1 + 1));
      *((void *)v1 + 1) = 0;
    }
    else
    {
      int v7 = 1;
    }
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 12)) && !pthread_cond_destroy((pthread_cond_t *)(v1 + 28))) {
      free(*((void **)v1 + 5));
    }
    int v34 = atomic_load(v1 + 40);
    if (v34 >= 1)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolDestroy", 171, 90, 0, "Threads reported errors", v32, v33, v35);
      int v7 = 0;
    }
    free(v1);
    if (v7) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t ThreadPoolGetWorker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16) != -1)
  {
    uint64_t v8 = "Missing call to RunWorker before GetWorker";
    __int16 v9 = 182;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolGetWorker", v9, 90, 0, v8, a7, a8, v21);
    return 0;
  }
  __int16 v11 = (pthread_mutex_t *)(a1 + 48);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48)))
  {
    uint64_t v15 = "SharedArrayPop: pthread_mutex_lock failed\n";
    __int16 v16 = 91;
LABEL_10:
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPop", v16, 0, v15, v12, v13, v14, v21);
    uint64_t v8 = "SharedArrayPop failed";
    __int16 v9 = 186;
    goto LABEL_11;
  }
  while (1)
  {
    int v17 = *(_DWORD *)(a1 + 32);
    if (v17) {
      break;
    }
    if (pthread_cond_wait((pthread_cond_t *)(a1 + 112), v11))
    {
      uint64_t v15 = "SharedArrayPop: pthread_cond_wait failed\n";
      __int16 v16 = 94;
      goto LABEL_10;
    }
  }
  unsigned int v18 = v17 - 1;
  *(_DWORD *)(a1 + 32) = v18;
  unsigned int v19 = *(_DWORD *)(*(void *)(a1 + 40) + 4 * v18);
  if (pthread_mutex_unlock(v11))
  {
    uint64_t v15 = "SharedArrayPop: pthread_mutex_unlock failed\n";
    __int16 v16 = 98;
    goto LABEL_10;
  }
  *(_DWORD *)(a1 + 16) = v19;
  return *(void *)(*(void *)(a1 + 8) + 168 * v19 + 24);
}

uint64_t ThreadPoolRunWorker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *(_DWORD *)(a1 + 16);
  if (v8 == -1)
  {
    __int16 v16 = "Missing call to GetWorker before RunWorker";
    __int16 v17 = 199;
LABEL_9:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolRunWorker", v17, 90, 0, v16, a7, a8, v18);
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a1 + 16) = -1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v10 + 1;
  uint64_t v11 = v9 + 168 * v8;
  *(void *)(v11 + 160) = v10;
  uint64_t v12 = (pthread_mutex_t *)(v11 + 48);
  if (pthread_mutex_lock((pthread_mutex_t *)(v11 + 48))
    || (uint64_t v13 = v9 + 168 * v8, v14 = *(_DWORD *)(v13 + 40), *(_DWORD *)(v13 + 40) = v14 + 1, !v14)
    && pthread_cond_broadcast((pthread_cond_t *)(v9 + 168 * v8 + 112))
    || (uint64_t result = pthread_mutex_unlock(v12), result))
  {
    __int16 v16 = "SemRelease failed";
    __int16 v17 = 211;
    goto LABEL_9;
  }
  return result;
}

uint64_t ThreadPoolSync(unsigned int *a1)
{
  uint64_t v1 = *a1;
  if (!v1)
  {
    int v7 = 1;
    goto LABEL_30;
  }
  int v3 = 0;
  int v4 = (uint64_t *)*((void *)a1 + 1);
  do
  {
    uint64_t v5 = *v4;
    v4 += 21;
    if (v5) {
      ++v3;
    }
    --v1;
  }
  while (v1);
  if (v3)
  {
    int v6 = 0;
    int v7 = 1;
    while (1)
    {
      if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 12)))
      {
        __int16 v11 = 91;
        uint64_t v12 = "SharedArrayPop: pthread_mutex_lock failed\n";
      }
      else
      {
        while (1)
        {
          unsigned int v13 = a1[8];
          if (v13) {
            break;
          }
          if (pthread_cond_wait((pthread_cond_t *)(a1 + 28), (pthread_mutex_t *)(a1 + 12)))
          {
            __int16 v11 = 94;
            uint64_t v12 = "SharedArrayPop: pthread_cond_wait failed\n";
            goto LABEL_15;
          }
        }
        a1[8] = v13 - 1;
        if (!pthread_mutex_unlock((pthread_mutex_t *)(a1 + 12))) {
          goto LABEL_16;
        }
        __int16 v11 = 98;
        uint64_t v12 = "SharedArrayPop: pthread_mutex_unlock failed\n";
      }
LABEL_15:
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPop", v11, 0, v12, v8, v9, v10, v24);
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolSync", 231, 90, 0, "SharedArrayPop", v14, v15, v25);
      int v7 = 0;
LABEL_16:
      if (++v6 == v3)
      {
        if (!*a1) {
          goto LABEL_30;
        }
        goto LABEL_21;
      }
    }
  }
  int v7 = 1;
LABEL_21:
  uint64_t v16 = 0;
  unint64_t v17 = 0;
  do
  {
    uint64_t v18 = *((void *)a1 + 1);
    if (*(void *)(v18 + v16))
    {
      if ((uint64_t v19 = v18 + v16, *(void *)(v18 + v16 + 160) = -2,
                             pthread_mutex_lock((pthread_mutex_t *)(v18 + v16 + 48)))
        || (int v22 = *(_DWORD *)(v19 + 40), *(_DWORD *)(v19 + 40) = v22 + 1, !v22)
        && pthread_cond_broadcast((pthread_cond_t *)(v18 + v16 + 112))
        || pthread_mutex_unlock((pthread_mutex_t *)(v18 + v16 + 48)))
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolSync", 240, 90, 0, "SemRelease", v20, v21, v24);
        int v7 = 0;
      }
    }
    ++v17;
    v16 += 168;
  }
  while (v17 < *a1);
LABEL_30:
  if (v7) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

AAByteStream AADecompressionRandomAccessInputStreamOpen(AAByteStream compressed_stream, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  long long v56 = 0uLL;
  int v7 = malloc(0x40uLL);
  uint64_t v8 = (uint64_t)v7;
  if (!v7)
  {
    int v22 = *__error();
    unsigned int v23 = "malloc";
    __int16 v24 = 106;
LABEL_18:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecompressionStream.c", (uint64_t)"AADecompressionRandomAccessInputStreamOpen", v24, 110, v22, v23, v10, v11, v50);
    RandomAccessDecompressStreamDestroy(v8);
    return 0;
  }
  memset_s(v7, 0x40uLL, 0, 0x40uLL);
  *(void *)uint64_t v8 = compressed_stream;
  *(void *)(v8 + 8) = flags;
  off_t v9 = AAByteStreamSeek(compressed_stream, 0, 2);
  if (v9 < 0)
  {
    unsigned int v23 = "seek to end of stream";
    __int16 v24 = 112;
    goto LABEL_17;
  }
  uint64_t v12 = *(void *)v8;
  if (!*(void *)(*(void *)v8 + 32)) {
    goto LABEL_15;
  }
  unint64_t v13 = v9;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v56;
  uint64_t v17 = 12;
  do
  {
    uint64_t v18 = (*(uint64_t (**)(void, long long *, uint64_t, uint64_t))(v12 + 32))(*(void *)v12, v16, v17, v15);
    if (v18 < 0) {
      goto LABEL_15;
    }
    if (!v18) {
      break;
    }
    uint64_t v16 = (long long *)((char *)v16 + v18);
    v14 += v18;
    v15 += v18;
    v17 -= v18;
  }
  while (v17);
  if (v14 != 12)
  {
LABEL_15:
    unsigned int v23 = "reading file header";
    __int16 v24 = 116;
LABEL_17:
    int v22 = 0;
    goto LABEL_18;
  }
  uint64_t v19 = PCompressZLIBDecode;
  if (BYTE3(v56) <= 0x64u)
  {
    switch(BYTE3(v56))
    {
      case '-':
        int v20 = 0;
        uint64_t v21 = "none";
        uint64_t v19 = PCompressCopyDecode;
        goto LABEL_31;
      case '4':
        int v20 = 0;
        uint64_t v21 = "lz4";
        uint64_t v19 = PCompressLZ4Decode;
        goto LABEL_31;
      case 'b':
        int v20 = 0;
        uint64_t v21 = "lzbitmap";
        uint64_t v19 = PCompressLZBITMAPDecode;
        goto LABEL_31;
    }
LABEL_30:
    uint64_t v19 = 0;
    uint64_t v21 = "???";
    int v20 = 1;
    goto LABEL_31;
  }
  if (BYTE3(v56) > 0x77u)
  {
    if (BYTE3(v56) == 122)
    {
      int v20 = 0;
      uint64_t v21 = "zlib";
      goto LABEL_31;
    }
    if (BYTE3(v56) == 120)
    {
      int v20 = 0;
      uint64_t v21 = "lzma";
      uint64_t v19 = PCompressLZMADecode;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (BYTE3(v56) == 101)
  {
    int v20 = 0;
    uint64_t v21 = "lzfse";
    uint64_t v19 = PCompressLZFSEDecode;
    goto LABEL_31;
  }
  if (BYTE3(v56) != 102) {
    goto LABEL_30;
  }
  int v20 = 0;
  uint64_t v21 = "lzvn";
  uint64_t v19 = PCompressLZVNDecode;
LABEL_31:
  *(void *)(v8 + 16) = v19;
  if (v56 != 112 || BYTE1(v56) != 98 || BYTE2(v56) != 122 || v20)
  {
    unsigned int v23 = "invalid file header";
    __int16 v24 = 128;
    goto LABEL_17;
  }
  v55[0] = *(void *)((char *)&v56 + 4);
  unint64_t v26 = bswap64(*(unint64_t *)((char *)&v56 + 4));
  if (HIDWORD(v26))
  {
    unsigned int v23 = "invalid block size";
    __int16 v24 = 131;
    goto LABEL_17;
  }
  *(void *)(v8 + 24) = 0;
  if (v13 == 12)
  {
    uint64_t v27 = 0;
    goto LABEL_40;
  }
  unint64_t v53 = v26;
  unint64_t v51 = v21;
  uint64_t v33 = 0;
  uint64_t v27 = 0;
  uint64_t v34 = 12;
  while (2)
  {
    if (v34 + 16 > v13)
    {
      unsigned int v23 = "truncated file";
      __int16 v24 = 138;
      goto LABEL_17;
    }
    uint64_t v54 = v34 + 16;
    unint64_t v52 = v33;
    uint64_t v35 = v27;
    uint64_t v36 = *(void *)v8;
    if (!*(void *)(*(void *)v8 + 32))
    {
LABEL_75:
      unsigned int v23 = "reading block header";
      __int16 v24 = 139;
      goto LABEL_17;
    }
    uint64_t v37 = 0;
    uint64_t v38 = v55;
    uint64_t v39 = 16;
    do
    {
      uint64_t v40 = (*(uint64_t (**)(void, unint64_t *, uint64_t, uint64_t))(v36 + 32))(*(void *)v36, v38, v39, v34);
      if (v40 < 0) {
        goto LABEL_75;
      }
      if (!v40) {
        break;
      }
      uint64_t v38 = (unint64_t *)((char *)v38 + v40);
      v37 += v40;
      v34 += v40;
      v39 -= v40;
    }
    while (v39);
    if (v37 != 16) {
      goto LABEL_75;
    }
    unint64_t v41 = bswap64(v55[0]);
    unint64_t v42 = bswap64(v55[1]);
    if (v41 > v53 || v42 > v53)
    {
      unsigned int v23 = "invalid block header";
      __int16 v24 = 143;
      goto LABEL_17;
    }
    uint64_t v44 = v54;
    uint64_t v34 = v42 + v54;
    if (v42 + v54 > v13)
    {
      unsigned int v23 = "truncated file";
      __int16 v24 = 144;
      goto LABEL_17;
    }
    uint64_t v45 = v35;
    unint64_t v46 = *(void *)(v8 + 24);
    if (v35 != v46 * v53)
    {
      unsigned int v23 = "invalid block size";
      __int16 v24 = 147;
      goto LABEL_17;
    }
    uint64_t v33 = v52;
    if (v46 < v52)
    {
      long long v47 = *(char **)(v8 + 32);
      goto LABEL_72;
    }
    if (v52) {
      uint64_t v33 = 2 * v52;
    }
    else {
      uint64_t v33 = 32;
    }
    if ((unint64_t)(16 * v33) >= 0x2000000001)
    {
      *__error() = 12;
LABEL_84:
      *(void *)(v8 + 32) = 0;
      int v22 = *__error();
      unsigned int v23 = "malloc";
      __int16 v24 = 154;
      goto LABEL_18;
    }
    __int16 v48 = *(void **)(v8 + 32);
    long long v47 = (char *)realloc(v48, 16 * v33);
    if (!v47)
    {
      free(v48);
      goto LABEL_84;
    }
    *(void *)(v8 + 32) = v47;
    unint64_t v46 = *(void *)(v8 + 24);
    uint64_t v44 = v54;
LABEL_72:
    *(void *)(v8 + 24) = v46 + 1;
    compression_algorithm v49 = &v47[16 * v46];
    *(void *)compression_algorithm v49 = v44;
    *((_DWORD *)v49 + 2) = v42;
    *((_DWORD *)v49 + 3) = v41;
    uint64_t v27 = v41 + v45;
    if (v34 != v13) {
      continue;
    }
    break;
  }
  uint64_t v21 = v51;
  unint64_t v26 = v53;
  if (v27 < 0)
  {
    unsigned int v23 = "invalid file sizes";
    __int16 v24 = 169;
    goto LABEL_17;
  }
LABEL_40:
  if (!n_threads) {
    n_threads = getDefaultNThreads();
  }
  *(_DWORD *)(v8 + 40) = n_threads;
  uint64_t v28 = (char *)calloc(n_threads, 8uLL);
  *(void *)(v8 + 48) = v28;
  if (!v28)
  {
    int v22 = *__error();
    unsigned int v23 = "malloc";
    __int16 v24 = 174;
    goto LABEL_18;
  }
  uint64_t v29 = v27;
  uint64_t v30 = (FILE **)*(unsigned int *)(v8 + 40);
  if (v30)
  {
    __int16 v31 = v28;
    uint64_t v32 = 0;
    while (1)
    {
      *(void *)&v31[v32] = malloc(v26);
      __int16 v31 = *(char **)(v8 + 48);
      if (!*(void *)&v31[v32]) {
        break;
      }
      v32 += 8;
      if (8 * (void)v30 == v32) {
        goto LABEL_47;
      }
    }
    int v22 = *__error();
    unsigned int v23 = "malloc";
    __int16 v24 = 178;
    goto LABEL_18;
  }
LABEL_47:
  if (flags >> 62)
  {
    uint64_t v30 = (FILE **)MEMORY[0x263EF8348];
    fprintf((FILE *)*MEMORY[0x263EF8348], "%12llu B block size\n", v26);
    fprintf(*v30, "%12llu B file size\n", v13);
    fprintf(*v30, "%12llu B data size\n", v29);
    fprintf(*v30, "%12.2f x compression ratio (%s)\n", (double)(unint64_t)v29 / (double)v13, v21);
    fprintf(*v30, "%12llu blocks\n", *(void *)(v8 + 24));
    LODWORD(v30) = *(_DWORD *)(v8 + 40);
  }
  return (AAByteStream)AAGenericRandomAccessInputStreamOpen(v29, v26, v30, 2 * (int)v30, v8, (uint64_t)RandomAccessDecompressStreamGetBlock, (uint64_t)RandomAccessDecompressStreamAbort, (uint64_t)RandomAccessDecompressStreamDestroy, flags);
}

uint64_t RandomAccessDecompressStreamDestroy(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 48);
    if (v2)
    {
      if (*(_DWORD *)(a1 + 40))
      {
        unint64_t v3 = 0;
        do
          free(*(void **)(*(void *)(a1 + 48) + 8 * v3++));
        while (v3 < *(unsigned int *)(a1 + 40));
        uint64_t v2 = *(void **)(a1 + 48);
      }
      free(v2);
    }
    free(*(void **)(a1 + 32));
    free((void *)a1);
  }
  return 0;
}

uint64_t RandomAccessDecompressStreamGetBlock(uint64_t *a1, unsigned int a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*((_DWORD *)a1 + 10) <= a2 || a1[3] <= a3)
  {
    uint64_t v21 = "Invalid worker/block id";
    __int16 v22 = 66;
LABEL_14:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecompressionStream.c", (uint64_t)"RandomAccessDecompressStreamGetBlock", v22, 110, 0, v21, a7, a8, v24);
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = a1[4];
  uint64_t v11 = v10 + 16 * a3;
  int v13 = *(_DWORD *)(v11 + 12);
  uint64_t v12 = (_DWORD *)(v11 + 12);
  uint64_t v14 = *(v12 - 1);
  if (v13 == v14) {
    uint64_t v15 = a4;
  }
  else {
    uint64_t v15 = *(void *)(a1[6] + 8 * a2);
  }
  uint64_t v16 = *a1;
  if (!*(void *)(*a1 + 32)) {
    goto LABEL_20;
  }
  uint64_t v17 = 0;
  if (v14)
  {
    uint64_t v18 = *(void *)(v10 + 16 * a3);
    uint64_t v19 = v15;
    while (1)
    {
      uint64_t v20 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v16 + 32))(*(void *)v16, v19, v14, v18);
      if (v20 < 0) {
        break;
      }
      if (v20)
      {
        v19 += v20;
        v17 += v20;
        v18 += v20;
        v14 -= v20;
        if (v14) {
          continue;
        }
      }
      goto LABEL_16;
    }
    uint64_t v17 = v20;
LABEL_16:
    if (v17 != *(v12 - 1))
    {
LABEL_20:
      uint64_t v21 = "loading block";
      __int16 v22 = 74;
      goto LABEL_14;
    }
  }
  if (v15 != a4
    && ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))a1[2])(a4, *v12, v15, v17) != *v12)
  {
    uint64_t v21 = "decompressing block";
    __int16 v22 = 79;
    goto LABEL_14;
  }
  return 0;
}

void RandomAccessDecompressStreamAbort(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 56))
  {
    *(_DWORD *)(a1 + 56) = 1;
    AAByteStreamCancel(*(AAByteStream *)a1);
  }
}

void *aaAsyncByteStreamAlloc(uint64_t a1, uint64_t a2, int a3, float a4, float a5)
{
  uint64_t v10 = malloc(0x38uLL);
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v17 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"aaAsyncByteStreamAlloc", 191, 97, *v17, "malloc", v18, v19, v21);
    return v11;
  }
  memset_s(v10, 0x38uLL, 0, 0x38uLL);
  *uint64_t v11 = a1;
  v11[1] = a2;
  if (a3)
  {
    uint64_t v12 = (float *)malloc(0x70uLL);
    int v13 = v12;
    if (!v12) {
      goto LABEL_14;
    }
    memset_s(v12, 0x70uLL, 0, 0x70uLL);
    if (a3 >= 1) {
      int v14 = a3;
    }
    else {
      int v14 = 5;
    }
    *((_DWORD *)v13 + 24) = v14;
    float v15 = 10.0;
    if (a4 > 0.0) {
      float v15 = a4;
    }
    float v16 = 5.0;
    if (a5 > 0.0) {
      float v16 = a5;
    }
    v13[25] = v15;
    v13[26] = v16;
    *((void *)v13 + 10) = -1;
    *((void *)v13 + 11) = -1;
    if ((pthread_mutex_init((pthread_mutex_t *)v13, 0) & 0x80000000) == 0) {
      goto LABEL_14;
    }
    free(v13);
  }
  int v13 = 0;
LABEL_14:
  v11[6] = v13;
  return v11;
}

uint64_t AAAsyncByteStreamGetRange(void *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = (uint64_t (*)(void))a1[2];
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v3(*a1);
  uint64_t v8 = v7;
  if ((v7 & 0x80000000) != 0) {
    return v8;
  }
  uint64_t v9 = a1[6];
  if (!v7)
  {
    if (!v9) {
      return 0;
    }
    if (pthread_mutex_lock((pthread_mutex_t *)v9) < 0)
    {
      int v36 = *__error();
      uint64_t v39 = "mutex lock";
      __int16 v40 = 149;
    }
    else
    {
      double RealTime = getRealTime();
      uint64_t v26 = *(void *)(v9 + 80);
      if (v26 < 0)
      {
LABEL_20:
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v27 = *(void *)(v9 + 72);
        while (1)
        {
          uint64_t v28 = v27 + 40 * v26;
          double v30 = *(double *)(v28 + 24);
          uint64_t v29 = (double *)(v28 + 24);
          if (v30 < RealTime) {
            break;
          }
          uint64_t v26 = *(void *)(v27 + 40 * v26 + 32);
          if (v26 < 0) {
            goto LABEL_20;
          }
        }
        uint64_t v41 = v27 + 40 * v26;
        int v42 = *(_DWORD *)(v41 + 16);
        if (v42 <= 0)
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataGetRange", 159, 97, 0, "Async stream range timed out (FAIL): %zu bytes at %llu", v23, v24, *(void *)v41);
          uint64_t v8 = 0xFFFFFFFFLL;
        }
        else
        {
          unint64_t v43 = *(void *)v41;
          double *v29 = RealTime
               + *(float *)(v9 + 100)
               + (double)*(unint64_t *)v41 * 0.000000953674316 * *(float *)(v9 + 104);
          *(_DWORD *)(v41 + 16) = v42 - 1;
          *a2 = v43;
          *a3 = *(void *)(v27 + 40 * v26 + 8);
          pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataGetRange", 170, 97, "Async stream range timed out (retry): %zu bytes at %llu", v22, v23, v24, *(void *)v41);
          uint64_t v8 = 1;
        }
      }
      if ((pthread_mutex_unlock((pthread_mutex_t *)v9) & 0x80000000) == 0) {
        return v8;
      }
      int v36 = *__error();
      uint64_t v39 = "mutex unlock";
      __int16 v40 = 177;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataGetRange", v40, 97, v36, v39, v37, v38, v56);
    return 0xFFFFFFFFLL;
  }
  if (!v9) {
    return v8;
  }
  unint64_t v10 = *a2;
  uint64_t v11 = *a3;
  if (pthread_mutex_lock((pthread_mutex_t *)v9) < 0)
  {
    int v31 = *__error();
    uint64_t v34 = "mutex lock";
    __int16 v35 = 64;
LABEL_53:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataInsert", v35, 97, v31, v34, v32, v33, v56);
    return v8;
  }
  uint64_t v15 = *(void *)(v9 + 80);
  if (!v10)
  {
    if ((v15 & 0x8000000000000000) == 0) {
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataInsert", 68, 97, "Async stream returning EOF, but we still have ranges in flight", v12, v13, v14, v56);
    }
    goto LABEL_51;
  }
  if (v15 < 0)
  {
LABEL_12:
    unint64_t v18 = *(void *)(v9 + 88);
    if ((v18 & 0x8000000000000000) == 0)
    {
LABEL_13:
      uint64_t v19 = *(void *)(v9 + 72) + 40 * v18;
      uint64_t v20 = *(void *)(v19 + 32);
      *(void *)(v19 + 32) = v15;
      *(void *)(v9 + 80) = v18;
      *(void *)(v9 + 88) = v20;
      *(void *)uint64_t v19 = v10;
      *(void *)(v19 + 8) = v11;
      *(_DWORD *)(v19 + 16) = *(_DWORD *)(v9 + 96) - 1;
      double v21 = *(float *)(v9 + 100) + (double)v10 * 0.000000953674316 * *(float *)(v9 + 104);
      *(double *)(v19 + 24) = getRealTime() + v21;
      goto LABEL_51;
    }
    uint64_t v44 = *(void *)(v9 + 64);
    if (v44) {
      unint64_t v45 = 2 * v44;
    }
    else {
      unint64_t v45 = 32;
    }
    if (40 * v45 < 0x2000000001)
    {
      unint64_t v46 = *(void **)(v9 + 72);
      long long v47 = (char *)realloc(v46, 40 * v45);
      if (v47)
      {
        __int16 v48 = v47;
        *(void *)(v9 + 72) = v47;
        unint64_t v18 = *(void *)(v9 + 64);
        if (v18 < v45)
        {
          uint64_t v49 = 40 * v18;
          uint64_t v50 = v18 + 1;
LABEL_36:
          memset_s(&v48[v49], 0x28uLL, 0, 0x28uLL);
          while (1)
          {
            uint64_t v51 = v45 == v50 ? -1 : v50;
            *(void *)&v48[v49 + 32] = v51;
            if (v45 == v50) {
              break;
            }
            __int16 v48 = *(char **)(v9 + 72);
            v49 += 40;
            ++v50;
            if (v48) {
              goto LABEL_36;
            }
          }
          unint64_t v18 = *(void *)(v9 + 64);
        }
        *(void *)(v9 + 64) = v45;
        uint64_t v15 = *(void *)(v9 + 80);
        goto LABEL_13;
      }
      free(v46);
    }
    else
    {
      *__error() = 12;
    }
    *(void *)(v9 + 72) = 0;
    unint64_t v53 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataInsert", 84, 97, *v53, "malloc", v54, v55, v56);
    *(void *)(v9 + 64) = 0;
    *(void *)(v9 + 80) = -1;
    *(void *)(v9 + 88) = -1;
    goto LABEL_51;
  }
  uint64_t v16 = *(void *)(v9 + 72);
  uint64_t v17 = *(void *)(v9 + 80);
  while (*(void *)(v16 + 40 * v17 + 8) != v11 || *(void *)(v16 + 40 * v17) != v10)
  {
    uint64_t v17 = *(void *)(v16 + 40 * v17 + 32);
    if (v17 < 0) {
      goto LABEL_12;
    }
  }
LABEL_51:
  if (pthread_mutex_unlock((pthread_mutex_t *)v9) < 0)
  {
    int v31 = *__error();
    uint64_t v34 = "mutex unlock";
    __int16 v35 = 108;
    goto LABEL_53;
  }
  return v8;
}

uint64_t AAAsyncByteStreamProcess(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1[3]) {
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    uint64_t v8 = a1[6];
    if (v8)
    {
      if (pthread_mutex_lock((pthread_mutex_t *)a1[6]) < 0)
      {
        int v18 = *__error();
        double v21 = "mutex lock";
        __int16 v22 = 116;
      }
      else
      {
        uint64_t v12 = (void *)(v8 + 80);
        uint64_t v13 = *(void *)(v8 + 80);
        if (v13 < 0)
        {
LABEL_10:
          pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataRemove", 128, 97, "Async stream receiving an unknown segment", v9, v10, v11, v27);
        }
        else
        {
          uint64_t v14 = *(void *)(v8 + 72);
          uint64_t v15 = -1;
          while (1)
          {
            uint64_t v16 = v13;
            if (*(void *)(v14 + 40 * v13 + 8) == a4 && *(void *)(v14 + 40 * v13) == a3) {
              break;
            }
            uint64_t v13 = *(void *)(v14 + 40 * v13 + 32);
            uint64_t v15 = v16;
            if (v13 < 0) {
              goto LABEL_10;
            }
          }
          uint64_t v23 = v14 + 40 * v13;
          uint64_t v24 = v14 + 40 * v15 + 32;
          if (v15 >= 0) {
            uint64_t v12 = (void *)v24;
          }
          *uint64_t v12 = *(void *)(v23 + 32);
          *(void *)(v23 + 32) = *(void *)(v8 + 88);
          *(void *)(v8 + 88) = v16;
        }
        if ((pthread_mutex_unlock((pthread_mutex_t *)v8) & 0x80000000) == 0) {
          goto LABEL_19;
        }
        int v18 = *__error();
        double v21 = "mutex unlock";
        __int16 v22 = 140;
      }
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataRemove", v22, 97, v18, v21, v19, v20, v27);
    }
  }
LABEL_19:
  char v25 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))a1[3];
  uint64_t v26 = *a1;

  return v25(v26, a2, a3, a4);
}

void *AAAsyncByteStreamCancel(void *result)
{
  uint64_t v1 = (uint64_t (*)(void))result[4];
  if (v1) {
    return (void *)v1(*result);
  }
  return result;
}

uint64_t AAAsyncByteStreamClose(uint64_t (**a1)(void))
{
  if (!a1) {
    return 0;
  }
  if (*a1)
  {
    uint64_t v2 = a1[1]();
    *a1 = 0;
  }
  else
  {
    uint64_t v2 = 0;
  }
  unint64_t v3 = a1[6];
  if (v3)
  {
    free(*((void **)v3 + 9));
    pthread_mutex_destroy((pthread_mutex_t *)v3);
    free(v3);
  }
  free(a1);
  return v2;
}

uint64_t aaAsyncByteStreamIsCancelled(void *a1)
{
  uint64_t v1 = (uint64_t (*)(void))a1[5];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0;
  }
}

uint64_t graisClose(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (unsigned int *)result;
    int v2 = *(_DWORD *)(result + 576);
    BOOL v3 = v2 == 0;
    if (*(void *)(result + 136))
    {
      sendMessage_0(result, -1, -1);
      joinThread(*((_opaque_pthread_t **)v1 + 17));
    }
    int v4 = (uint64_t *)*((void *)v1 + 12);
    if (v4)
    {
      uint64_t v5 = v1[22];
      if (v5)
      {
        int v6 = 0;
        do
        {
          int v7 = v6;
          uint64_t v9 = *v4;
          v4 += 20;
          uint64_t v8 = v9;
          if (v9) {
            ++v6;
          }
          --v5;
        }
        while (v5);
        if (v6)
        {
          if (v8) {
            int v10 = v7 + 1;
          }
          else {
            int v10 = v7;
          }
          do
          {
            unsigned int v11 = v1[37];
            if (!v11) {
              break;
            }
            unsigned int v12 = v1[39];
            if (!v12) {
              unsigned int v12 = v1[36];
            }
            unsigned int v13 = v12 - 1;
            unsigned int v14 = *(_DWORD *)(*((void *)v1 + 20) + 4 * v13);
            v1[39] = v13;
            v1[37] = v11 - 1;
            if (v14 >= v1[22]) {
              break;
            }
            uint64_t v15 = *((void *)v1 + 12);
            uint64_t v16 = v15 + 160 * v14;
            *(void *)(v16 + 144) = -1;
            if (!pthread_mutex_lock((pthread_mutex_t *)(v16 + 24)))
            {
              uint64_t v17 = v15 + 160 * v14;
              int v18 = *(_DWORD *)(v17 + 16);
              *(_DWORD *)(v17 + 16) = v18 + 1;
              if (v18 || !pthread_cond_broadcast((pthread_cond_t *)(v15 + 160 * v14 + 88))) {
                pthread_mutex_unlock((pthread_mutex_t *)(v16 + 24));
              }
            }
            joinThread(*(_opaque_pthread_t **)v16);
            *(void *)uint64_t v16 = 0;
            --v10;
          }
          while (v10);
        }
      }
    }
    uint64_t v19 = (int (*)(void))*((void *)v1 + 4);
    if (v19) {
      BOOL v3 = v19(*((void *)v1 + 1)) >= 0 && v2 == 0;
    }
    double v21 = (void *)*((void *)v1 + 14);
    if (v21)
    {
      if (v1[26])
      {
        unint64_t v22 = 0;
        uint64_t v23 = 16;
        do
        {
          free(*(void **)(*((void *)v1 + 14) + v23));
          ++v22;
          v23 += 32;
        }
        while (v22 < v1[26]);
        double v21 = (void *)*((void *)v1 + 14);
      }
      free(v21);
    }
    free(*((void **)v1 + 10));
    uint64_t v24 = (void *)*((void *)v1 + 16);
    if (v24)
    {
      if (v1[30])
      {
        unint64_t v25 = 0;
        uint64_t v26 = 88;
        do
        {
          char v27 = (pthread_cond_t *)(*((void *)v1 + 16) + v26);
          if (!pthread_mutex_destroy((pthread_mutex_t *)&v27[-2].__opaque[24])) {
            pthread_cond_destroy(v27);
          }
          ++v25;
          v26 += 136;
        }
        while (v25 < v1[30]);
        uint64_t v24 = (void *)*((void *)v1 + 16);
      }
      free(v24);
    }
    free(*((void **)v1 + 23));
    *((void *)v1 + 21) = 0;
    *((void *)v1 + 22) = 0;
    *((void *)v1 + 23) = 0;
    uint64_t v28 = (void *)*((void *)v1 + 12);
    if (v28)
    {
      if (v1[22])
      {
        unint64_t v29 = 0;
        uint64_t v30 = 88;
        do
        {
          int v31 = (pthread_cond_t *)(*((void *)v1 + 12) + v30);
          if (!pthread_mutex_destroy((pthread_mutex_t *)&v31[-2].__opaque[24])) {
            pthread_cond_destroy(v31);
          }
          ++v29;
          v30 += 160;
        }
        while (v29 < v1[22]);
        uint64_t v28 = (void *)*((void *)v1 + 12);
      }
      free(v28);
    }
    free(*((void **)v1 + 20));
    *((void *)v1 + 18) = 0;
    *((void *)v1 + 19) = 0;
    *((void *)v1 + 20) = 0;
    free(*((void **)v1 + 8));
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 52)) && !pthread_cond_destroy((pthread_cond_t *)(v1 + 68))) {
      free(*((void **)v1 + 25));
    }
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 84)) && !pthread_cond_destroy((pthread_cond_t *)(v1 + 100))) {
      free(*((void **)v1 + 41));
    }
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 116)) && !pthread_cond_destroy((pthread_cond_t *)v1 + 11)) {
      free(*((void **)v1 + 57));
    }
    if ((*(void *)v1 & 0x8000000000000000) != 0)
    {
      uint64_t v32 = (FILE **)MEMORY[0x263EF8348];
      fprintf((FILE *)*MEMORY[0x263EF8348], "%12llu blocks\n", *((void *)v1 + 7));
      fprintf(*v32, "%12u blocks in cache\n", v1[26]);
      uint64_t v33 = *v32;
      unint64_t v34 = atomic_load((unint64_t *)v1 + 75);
      fprintf(v33, "%12llu blocks computed\n", v34);
      __int16 v35 = *v32;
      unint64_t v36 = atomic_load((unint64_t *)v1 + 76);
      fprintf(v35, "%12llu requests processed\n", v36);
    }
    free(v1);
    return (v3 - 1);
  }
  return result;
}

void *AAGenericRandomAccessInputStreamOpen(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = calloc(1uLL, 0x68uLL);
  int v18 = malloc(0x268uLL);
  uint64_t v19 = (uint64_t)v18;
  if (v18)
  {
    memset_s(v18, 0x268uLL, 0, 0x268uLL);
    if (v17)
    {
      if (a4 < a3)
      {
        unint64_t v22 = "Cache size must be >= n_workers";
        __int16 v23 = 653;
        goto LABEL_23;
      }
      *(void *)(v19 + 16) = a6;
      *(void *)(v19 + 24) = a7;
      *(void *)uint64_t v19 = a9;
      *(void *)(v19 + 8) = a5;
      *(_DWORD *)(v19 + 48) = a2;
      *(void *)(v19 + 32) = a8;
      *(void *)(v19 + 40) = a1;
      *(void *)(v19 + 56) = (a1 + (unint64_t)a2 - 1) / a2;
      *(_DWORD *)(v19 + 104) = a4;
      *(_DWORD *)(v19 + 88) = a3;
      *(_DWORD *)(v19 + 120) = 2 * a3;
      unsigned int v25 = 3 * a3 + 1;
      *(_DWORD *)(v19 + 72) = v25;
      if (a9 < 0)
      {
        uint64_t v26 = (FILE **)MEMORY[0x263EF8348];
        fprintf((FILE *)*MEMORY[0x263EF8348], "%12llu blocks in file\n", (a1 + (unint64_t)a2 - 1) / a2);
        fprintf(*v26, "%12u blocks in cache\n", *(_DWORD *)(v19 + 104));
        fprintf(*v26, "%12u workers\n", *(_DWORD *)(v19 + 88));
        fprintf(*v26, "%12u requests\n", *(_DWORD *)(v19 + 120));
        fprintf(*v26, "%12u messages\n", *(_DWORD *)(v19 + 72));
        unsigned int v25 = *(_DWORD *)(v19 + 72);
      }
      *(_DWORD *)(v19 + 192) = 0;
      *(_DWORD *)(v19 + 196) = v25;
      char v27 = calloc(v25, 4uLL);
      *(void *)(v19 + 200) = v27;
      if (v27)
      {
        if (pthread_mutex_init((pthread_mutex_t *)(v19 + 208), 0))
        {
LABEL_10:
          int v31 = "SharedArrayInit: pthread_mutex_init failed\n";
          __int16 v32 = 56;
LABEL_22:
          pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayInit", v32, 0, v31, v28, v29, v30, v65);
          unint64_t v22 = "SharedArrayInit";
          __int16 v23 = 684;
          goto LABEL_23;
        }
        if (pthread_cond_init((pthread_cond_t *)(v19 + 272), 0))
        {
LABEL_12:
          int v31 = "SharedArrayInit: pthread_cond_init failed\n";
          __int16 v32 = 57;
          goto LABEL_22;
        }
        size_t v33 = *(unsigned int *)(v19 + 72);
        *(_DWORD *)(v19 + 320) = 0;
        *(_DWORD *)(v19 + 324) = v33;
        unint64_t v34 = calloc(v33, 4uLL);
        *(void *)(v19 + 328) = v34;
        if (v34)
        {
          if (pthread_mutex_init((pthread_mutex_t *)(v19 + 336), 0)) {
            goto LABEL_10;
          }
          if (pthread_cond_init((pthread_cond_t *)(v19 + 400), 0)) {
            goto LABEL_12;
          }
          size_t v35 = *(unsigned int *)(v19 + 120);
          *(_DWORD *)(v19 + 448) = 0;
          *(_DWORD *)(v19 + 452) = v35;
          unint64_t v36 = calloc(v35, 4uLL);
          *(void *)(v19 + 456) = v36;
          if (v36)
          {
            if (pthread_mutex_init((pthread_mutex_t *)(v19 + 464), 0)) {
              goto LABEL_10;
            }
            if (!pthread_cond_init((pthread_cond_t *)(v19 + 528), 0))
            {
              size_t v37 = *(void *)(v19 + 56);
              if (v37 < 0x800000001)
              {
                uint64_t v39 = calloc(v37, 4uLL);
                *(void *)(v19 + 64) = v39;
                if (v39)
                {
                  uint64_t v40 = *(void *)(v19 + 56);
                  if (v40) {
                    memset(v39, 255, 4 * v40);
                  }
                  uint64_t v41 = (char *)calloc(*(unsigned int *)(v19 + 104), 0x20uLL);
                  *(void *)(v19 + 112) = v41;
                  if (!v41)
                  {
                    int v24 = *__error();
                    unint64_t v22 = "malloc";
                    __int16 v23 = 693;
                    goto LABEL_24;
                  }
                  unint64_t v42 = *(unsigned int *)(v19 + 104);
                  if (v42)
                  {
                    unint64_t v43 = 0;
                    size_t v44 = *(unsigned int *)(v19 + 48);
                    unint64_t v45 = (unsigned int *)(v41 + 16);
                    while (1)
                    {
                      *((void *)v45 - 1) = -1;
                      atomic_store(0, v45 - 4);
                      unint64_t v46 = malloc(v44);
                      *(void *)unint64_t v45 = v46;
                      if (!v46) {
                        break;
                      }
                      ++v43;
                      v45 += 8;
                      if (v43 >= v42) {
                        goto LABEL_34;
                      }
                    }
                    int v24 = *__error();
                    unint64_t v22 = "malloc";
                    __int16 v23 = 700;
                    goto LABEL_24;
                  }
LABEL_34:
                  long long v47 = calloc(*(unsigned int *)(v19 + 72), 8uLL);
                  *(void *)(v19 + 80) = v47;
                  if (!v47)
                  {
                    int v24 = *__error();
                    unint64_t v22 = "malloc";
                    __int16 v23 = 705;
                    goto LABEL_24;
                  }
                  if (*(_DWORD *)(v19 + 72))
                  {
                    int v48 = 0;
                    while ((SharedArrayPush_0((unsigned int *)(v19 + 192), v48) & 0x80000000) == 0)
                    {
                      if (++v48 >= *(_DWORD *)(v19 + 72)) {
                        goto LABEL_39;
                      }
                    }
                    unint64_t v22 = "SharedArrayPush";
                    __int16 v23 = 708;
                    goto LABEL_23;
                  }
LABEL_39:
                  size_t v49 = *(unsigned int *)(v19 + 120);
                  if (v49 < 0x3C3C3C3D)
                  {
                    uint64_t v50 = calloc(v49, 0x88uLL);
                    *(void *)(v19 + 128) = v50;
                    if (v50)
                    {
                      uint64_t v51 = *(unsigned int *)(v19 + 120);
                      unint64_t v52 = malloc(4 * v51);
                      *(void *)(v19 + 184) = v52;
                      if (v52)
                      {
                        *(void *)(v19 + 176) = 0;
                        *(_DWORD *)(v19 + 168) = v51;
                        *(_DWORD *)(v19 + 172) = 0;
                        if (!v51)
                        {
LABEL_52:
                          size_t v55 = *(unsigned int *)(v19 + 88);
                          if (v55 < 0x33333334)
                          {
                            char v56 = calloc(v55, 0xA0uLL);
                            *(void *)(v19 + 96) = v56;
                            if (v56)
                            {
                              uint64_t v57 = *(unsigned int *)(v19 + 88);
                              uint64_t v58 = malloc(4 * v57);
                              *(void *)(v19 + 160) = v58;
                              if (v58)
                              {
                                *(void *)(v19 + 152) = 0;
                                *(_DWORD *)(v19 + 144) = v57;
                                *(_DWORD *)(v19 + 148) = 0;
                                if (v57)
                                {
                                  uint64_t v59 = 0;
                                  unint64_t v60 = 0;
                                  while (1)
                                  {
                                    uint64_t v61 = *(void *)(v19 + 96) + v59;
                                    if ((SemInit(v61 + 16) & 0x80000000) != 0)
                                    {
                                      unint64_t v22 = "SemInit";
                                      __int16 v23 = 729;
                                      goto LABEL_23;
                                    }
                                    *(void *)(v61 + 8) = v19;
                                    *(_DWORD *)(v61 + 136) = v60;
                                    if (*(_DWORD *)(v19 + 148) >= *(_DWORD *)(v19 + 144))
                                    {
                                      unint64_t v22 = "LocalArrayPush";
                                      __int16 v23 = 732;
                                      goto LABEL_23;
                                    }
                                    uint64_t v62 = *(unsigned int *)(v19 + 156);
                                    *(_DWORD *)(*(void *)(v19 + 160) + 4 * v62) = v60;
                                    int v63 = *(_DWORD *)(v19 + 148);
                                    int v64 = v62 + 1 == *(_DWORD *)(v19 + 144) ? 0 : v62 + 1;
                                    *(_DWORD *)(v19 + 156) = v64;
                                    *(_DWORD *)(v19 + 148) = v63 + 1;
                                    if ((createThread((pthread_t *)v61, (uint64_t)workerProc_4, v61, 0) & 0x80000000) != 0) {
                                      break;
                                    }
                                    ++v60;
                                    v59 += 160;
                                    if (v60 >= *(unsigned int *)(v19 + 88)) {
                                      goto LABEL_68;
                                    }
                                  }
                                  unint64_t v22 = "Worker thread creation";
                                  __int16 v23 = 733;
                                }
                                else
                                {
LABEL_68:
                                  if ((createThread((pthread_t *)(v19 + 136), (uint64_t)streamProc_0, v19, 0) & 0x80000000) == 0)
                                  {
                                    v17[2] = graisRead;
                                    v17[4] = graisPRead;
                                    v17[6] = graisSeek;
                                    v17[7] = graisAbort;
                                    *uint64_t v17 = v19;
                                    v17[1] = graisClose;
                                    return v17;
                                  }
                                  unint64_t v22 = "Stream thread creation";
                                  __int16 v23 = 737;
                                }
                              }
                              else
                              {
                                unint64_t v22 = "LocalArrayInit";
                                __int16 v23 = 725;
                              }
                              goto LABEL_23;
                            }
                          }
                          else
                          {
                            *__error() = 12;
                            *(void *)(v19 + 96) = 0;
                          }
                          int v24 = *__error();
                          unint64_t v22 = "malloc";
                          __int16 v23 = 724;
                          goto LABEL_24;
                        }
                        unint64_t v53 = 0;
                        uint64_t v54 = 16;
                        while (1)
                        {
                          if ((SemInit(*(void *)(v19 + 128) + v54) & 0x80000000) != 0)
                          {
                            unint64_t v22 = "SemInit";
                            __int16 v23 = 718;
                            goto LABEL_23;
                          }
                          if ((SharedArrayPush_0((unsigned int *)(v19 + 448), v53) & 0x80000000) != 0) {
                            break;
                          }
                          ++v53;
                          v54 += 136;
                          if (v53 >= *(unsigned int *)(v19 + 120)) {
                            goto LABEL_52;
                          }
                        }
                        unint64_t v22 = "SharedArrayPush";
                        __int16 v23 = 719;
                      }
                      else
                      {
                        unint64_t v22 = "LocalArrayInit";
                        __int16 v23 = 714;
                      }
LABEL_23:
                      int v24 = 0;
                      goto LABEL_24;
                    }
                  }
                  else
                  {
                    *__error() = 12;
                    *(void *)(v19 + 128) = 0;
                  }
                  int v24 = *__error();
                  unint64_t v22 = "malloc";
                  __int16 v23 = 713;
                  goto LABEL_24;
                }
              }
              else
              {
                *__error() = 12;
                *(void *)(v19 + 64) = 0;
              }
              int v24 = *__error();
              unint64_t v22 = "malloc";
              __int16 v23 = 688;
              goto LABEL_24;
            }
            goto LABEL_12;
          }
        }
      }
      int v31 = "SharedArrayInit: malloc failed\n";
      __int16 v32 = 55;
      goto LABEL_22;
    }
  }
  int v24 = *__error();
  unint64_t v22 = "malloc";
  __int16 v23 = 650;
LABEL_24:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"AAGenericRandomAccessInputStreamOpen", v23, 33, v24, v22, v20, v21, v65);
  free(v17);
  graisClose(v19);
  return 0;
}

uint64_t workerProc_4(uint64_t a1)
{
  int v2 = (pthread_mutex_t *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = (pthread_cond_t *)(a1 + 88);
  int v5 = 1;
  while (1)
  {
    if (pthread_mutex_lock(v2)) {
      goto LABEL_7;
    }
    while (1)
    {
      int v8 = *(_DWORD *)(a1 + 16);
      if (v8 > 0) {
        break;
      }
      if (pthread_cond_wait(v4, v2)) {
        goto LABEL_7;
      }
    }
    *(_DWORD *)(a1 + 16) = v8 - 1;
    if (pthread_mutex_unlock(v2))
    {
LABEL_7:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"workerProc", 365, 33, 0, "SemAcquire", v6, v7, v15);
      int v5 = 0;
    }
    uint64_t v9 = *(void *)(a1 + 144);
    if (v9 == -1) {
      return a1;
    }
    if (((*(uint64_t (**)(void, void, uint64_t, void))(v3 + 16))(*(void *)(v3 + 8), *(unsigned int *)(a1 + 136), v9, *(void *)(*(void *)(v3 + 112) + 32 * *(unsigned int *)(a1 + 152) + 16)) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"workerProc", 374, 33, 0, "get block data", v10, v11, v15);
      int v5 = 0;
    }
    *(_DWORD *)(a1 + 156) = v5;
    if ((sendMessage_0(v3, -1, *(_DWORD *)(a1 + 136)) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"workerProc", 381, 33, 0, "send worker message", v12, v13, v15);
      int v5 = 0;
    }
  }
}

uint64_t streamProc_0(uint64_t a1)
{
  int v2 = 0;
  uint64_t v3 = (pthread_mutex_t *)(a1 + 336);
  int v4 = (pthread_cond_t *)(a1 + 400);
  unint64_t v83 = (unsigned int *)(a1 + 192);
  while (1)
  {
    int v86 = v2;
    while (1)
    {
      if (pthread_mutex_lock(v3))
      {
        __int16 v8 = 91;
        uint64_t v9 = "SharedArrayPop: pthread_mutex_lock failed\n";
        goto LABEL_10;
      }
      while (1)
      {
        int v10 = *(_DWORD *)(a1 + 320);
        if (v10) {
          break;
        }
        if (pthread_cond_wait(v4, v3))
        {
          __int16 v8 = 94;
          uint64_t v9 = "SharedArrayPop: pthread_cond_wait failed\n";
          goto LABEL_10;
        }
      }
      unsigned int v11 = v10 - 1;
      *(_DWORD *)(a1 + 320) = v11;
      uint64_t v12 = *(unsigned int *)(*(void *)(a1 + 328) + 4 * v11);
      if (!pthread_mutex_unlock(v3)) {
        break;
      }
      __int16 v8 = 98;
      uint64_t v9 = "SharedArrayPop: pthread_mutex_unlock failed\n";
LABEL_10:
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayPop", v8, 0, v9, v5, v6, v7, (char)v83);
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 186, 33, 0, "SharedArrayPop", v13, v14, v84);
      *(_DWORD *)(a1 + 576) = 1;
    }
    char v15 = (int *)(*(void *)(a1 + 80) + 8 * v12);
    int v16 = *v15;
    unsigned int v17 = v15[1];
    if ((SharedArrayPush_0(v83, v12) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 192, 33, 0, "SharedArrayPush", v18, v19, (char)v83);
      *(_DWORD *)(a1 + 576) = 1;
    }
    if ((v17 & v16) == 0xFFFFFFFF) {
      int v20 = 1;
    }
    else {
      int v20 = v86;
    }
    if (v17 != -1)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 600), 1uLL, memory_order_relaxed);
      uint64_t v21 = *(void *)(a1 + 96);
      uint64_t v22 = v21 + 160 * v17;
      uint64_t v24 = *(unsigned int *)(v22 + 152);
      int v25 = *(_DWORD *)(v22 + 156);
      __int16 v23 = (int *)(v22 + 152);
      uint64_t v26 = *(void *)(a1 + 112) + 32 * v24;
      if (v25)
      {
        atomic_fetch_add((atomic_uint *volatile)v26, 1u);
        atomic_fetch_add((atomic_uint *volatile)(v26 + 4), 0xFFFFFFFF);
        *(void *)(v26 + 24) = atomic_fetch_add((atomic_ullong *volatile)(a1 + 592), 1uLL);
        int v27 = *v23;
      }
      else
      {
        atomic_fetch_add((atomic_uint *volatile)(v26 + 4), 0xFFFFFFFF);
        *(void *)(v26 + 24) = atomic_fetch_add((atomic_ullong *volatile)(a1 + 592), 1uLL);
        *(void *)(v26 + 8) = -1;
        int v27 = -3;
      }
      uint64_t v28 = v21 + 160 * v17;
      *(_DWORD *)(*(void *)(a1 + 64) + 4 * *(void *)(v28 + 144)) = v27;
      *(void *)(v28 + 144) = -1;
      int *v23 = -1;
      if (*(_DWORD *)(a1 + 148) >= *(_DWORD *)(a1 + 144))
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 242, 33, 0, "LocalArrayPush", v18, v19, (char)v83);
        *(_DWORD *)(a1 + 576) = 1;
      }
      else
      {
        uint64_t v29 = *(unsigned int *)(a1 + 156);
        *(_DWORD *)(*(void *)(a1 + 160) + 4 * v29) = v17;
        int v30 = *(_DWORD *)(a1 + 148);
        if (v29 + 1 == *(_DWORD *)(a1 + 144)) {
          int v31 = 0;
        }
        else {
          int v31 = v29 + 1;
        }
        *(_DWORD *)(a1 + 156) = v31;
        *(_DWORD *)(a1 + 148) = v30 + 1;
      }
    }
    unsigned int v32 = *(_DWORD *)(a1 + 172);
    if (v16 != -1)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 608), 1uLL, memory_order_relaxed);
      unsigned int v33 = *(_DWORD *)(a1 + 168);
      if (v32 >= v33)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 254, 33, 0, "LocalArrayEnqueue", v18, v19, (char)v83);
        *(_DWORD *)(a1 + 576) = 1;
        unsigned int v32 = *(_DWORD *)(a1 + 172);
      }
      else
      {
        if (*(_DWORD *)(a1 + 176)) {
          unsigned int v33 = *(_DWORD *)(a1 + 176);
        }
        unsigned int v34 = v33 - 1;
        *(_DWORD *)(*(void *)(a1 + 184) + 4 * v34) = v16;
        unsigned int v32 = *(_DWORD *)(a1 + 172) + 1;
        *(_DWORD *)(a1 + 172) = v32;
        *(_DWORD *)(a1 + 176) = v34;
      }
    }
    if (!v32) {
      goto LABEL_96;
    }
    int v35 = 0;
    unsigned int v85 = v32;
    int v87 = v20;
    while (2)
    {
      int v36 = *(_DWORD *)(a1 + 172);
      if (v36)
      {
        int v37 = *(_DWORD *)(a1 + 180);
        if (!v37) {
          int v37 = *(_DWORD *)(a1 + 168);
        }
        unsigned int v38 = v37 - 1;
        unsigned int v39 = *(_DWORD *)(*(void *)(a1 + 184) + 4 * v38);
        *(_DWORD *)(a1 + 180) = v38;
        *(_DWORD *)(a1 + 172) = v36 - 1;
      }
      else
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 262, 33, 0, "LocalArrayDequeue", v18, v19, (char)v83);
        *(_DWORD *)(a1 + 576) = 1;
        unsigned int v39 = -1;
      }
      uint64_t v40 = *(void *)(a1 + 128);
      if (v20)
      {
        uint64_t v41 = v40 + 136 * v39;
        *(_DWORD *)(v41 + 8) = -1;
        unint64_t v42 = (pthread_mutex_t *)(v41 + 24);
        if (!pthread_mutex_lock((pthread_mutex_t *)(v41 + 24)))
        {
          uint64_t v43 = v40 + 136 * v39;
          int v44 = *(_DWORD *)(v43 + 16);
          *(_DWORD *)(v43 + 16) = v44 + 1;
          if ((v44 || !pthread_cond_broadcast((pthread_cond_t *)(v40 + 136 * v39 + 88)))
            && !pthread_mutex_unlock(v42))
          {
            goto LABEL_81;
          }
        }
        __int16 v58 = 272;
        goto LABEL_79;
      }
      unint64_t v45 = (uint64_t *)(v40 + 136 * v39);
      uint64_t v46 = *(unsigned int *)(*(void *)(a1 + 64) + 4 * *v45);
      if (v46 < *(_DWORD *)(a1 + 104))
      {
        uint64_t v47 = v40 + 136 * v39;
        *(_DWORD *)(v47 + 8) = v46;
        uint64_t v48 = *(void *)(a1 + 112) + 32 * v46;
        atomic_fetch_add((atomic_uint *volatile)v48, 1u);
        *(void *)(v48 + 24) = atomic_fetch_add((atomic_ullong *volatile)(a1 + 592), 1uLL);
        size_t v49 = (pthread_mutex_t *)(v47 + 24);
        if (!pthread_mutex_lock((pthread_mutex_t *)(v47 + 24)))
        {
          uint64_t v50 = v40 + 136 * v39;
          int v51 = *(_DWORD *)(v50 + 16);
          *(_DWORD *)(v50 + 16) = v51 + 1;
          if ((v51 || !pthread_cond_broadcast((pthread_cond_t *)(v40 + 136 * v39 + 88)))
            && !pthread_mutex_unlock(v49))
          {
            goto LABEL_81;
          }
        }
        __int16 v58 = 292;
        goto LABEL_79;
      }
      if (v46 == -3)
      {
        uint64_t v52 = v40 + 136 * v39;
        *(_DWORD *)(v52 + 8) = -1;
        unint64_t v53 = (pthread_mutex_t *)(v52 + 24);
        if (!pthread_mutex_lock((pthread_mutex_t *)(v52 + 24)))
        {
          uint64_t v54 = v40 + 136 * v39;
          int v55 = *(_DWORD *)(v54 + 16);
          *(_DWORD *)(v54 + 16) = v55 + 1;
          if ((v55 || !pthread_cond_broadcast((pthread_cond_t *)(v40 + 136 * v39 + 88)))
            && !pthread_mutex_unlock(v53))
          {
            goto LABEL_81;
          }
        }
        __int16 v58 = 303;
LABEL_79:
        uint64_t v70 = "SemRelease";
        goto LABEL_80;
      }
      unsigned int v56 = *(_DWORD *)(a1 + 168);
      if (*(_DWORD *)(a1 + 172) >= v56)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 308, 33, 0, "LocalArrayEnqueue", v18, v19, (char)v83);
        *(_DWORD *)(a1 + 576) = 1;
      }
      else
      {
        if (*(_DWORD *)(a1 + 176)) {
          unsigned int v56 = *(_DWORD *)(a1 + 176);
        }
        unsigned int v57 = v56 - 1;
        *(_DWORD *)(*(void *)(a1 + 184) + 4 * v57) = v39;
        ++*(_DWORD *)(a1 + 172);
        *(_DWORD *)(a1 + 176) = v57;
      }
      if (v46 != -1 || !*(_DWORD *)(a1 + 148)) {
        goto LABEL_81;
      }
      uint64_t v59 = *v45;
      if (*(void *)(a1 + 56) <= (unint64_t)*v45)
      {
        __int16 v71 = 149;
        uint64_t v72 = "Invalid block_id, or no workers available";
        goto LABEL_93;
      }
      while (!*(_DWORD *)(a1 + 104))
      {
        unsigned int v63 = -1;
LABEL_73:
        unint64_t v61 = v63;
        uint64_t v67 = *(void *)(a1 + 112) + 32 * v63;
        int v68 = 1;
        atomic_compare_exchange_strong((atomic_uint *volatile)v67, (unsigned int *)&v68, 0);
        if (v68 == 1)
        {
          *(_DWORD *)(*(void *)(a1 + 64) + 4 * *(void *)(v67 + 8)) = -1;
          *(void *)(v67 + 8) = -1;
          int v69 = (atomic_uint *)(v67 + 4);
          goto LABEL_85;
        }
      }
      uint64_t v60 = 0;
      unint64_t v61 = 0;
      unint64_t v62 = -1;
      unsigned int v63 = -1;
      while (2)
      {
        uint64_t v64 = *(void *)(a1 + 112);
        if (atomic_load((unsigned int *)(v64 + v60 + 4)))
        {
LABEL_70:
          ++v61;
          v60 += 32;
          if (v61 >= *(unsigned int *)(a1 + 104)) {
            goto LABEL_73;
          }
          continue;
        }
        break;
      }
      if (*(void *)(v64 + v60 + 8) != -1)
      {
        unint64_t v66 = *(void *)(v64 + v60 + 24);
        if (v66 < v62)
        {
          unint64_t v62 = v66;
          unsigned int v63 = v61;
        }
        goto LABEL_70;
      }
      int v69 = (atomic_uint *)(v64 + v60 + 4);
      unsigned int v63 = v61;
LABEL_85:
      atomic_fetch_add(v69, 1u);
      *(void *)(*(void *)(a1 + 112) + 32 * v61 + 8) = v59;
      int v73 = *(_DWORD *)(a1 + 148);
      if (!v73)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"runWorker", 159, 33, 0, "LocalArrayPop", v18, v19, (char)v83);
        goto LABEL_94;
      }
      int v74 = *(_DWORD *)(a1 + 156);
      if (!v74) {
        int v74 = *(_DWORD *)(a1 + 144);
      }
      unsigned int v75 = v74 - 1;
      unsigned int v76 = *(_DWORD *)(*(void *)(a1 + 160) + 4 * v75);
      *(_DWORD *)(a1 + 156) = v75;
      *(_DWORD *)(a1 + 148) = v73 - 1;
      uint64_t v77 = *(void *)(a1 + 96);
      uint64_t v78 = v77 + 160 * v76;
      *(void *)(v78 + 144) = v59;
      *(_DWORD *)(v78 + 152) = v63;
      *(_DWORD *)(*(void *)(a1 + 64) + 4 * v59) = -2;
      uint64_t v79 = (pthread_mutex_t *)(v78 + 24);
      if (pthread_mutex_lock((pthread_mutex_t *)(v78 + 24))
        || (v80 = v77 + 160 * v76, int v81 = *(_DWORD *)(v80 + 16), *(_DWORD *)(v80 + 16) = v81 + 1, !v81)
        && pthread_cond_broadcast((pthread_cond_t *)(v77 + 160 * v76 + 88))
        || pthread_mutex_unlock(v79))
      {
        __int16 v71 = 167;
        uint64_t v72 = "SemRelease";
LABEL_93:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"runWorker", v71, 33, 0, v72, v18, v19, (char)v83);
LABEL_94:
        __int16 v58 = 313;
        uint64_t v70 = "run worker";
LABEL_80:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", v58, 33, 0, v70, v18, v19, (char)v83);
        *(_DWORD *)(a1 + 576) = 1;
      }
LABEL_81:
      ++v35;
      int v20 = v87;
      if (v35 != v85) {
        continue;
      }
      break;
    }
LABEL_96:
    int v2 = 0;
    if (v20)
    {
      int v2 = v20;
      if (*(_DWORD *)(a1 + 148) == *(_DWORD *)(a1 + 88)) {
        return a1;
      }
    }
  }
}

uint64_t graisRead(uint64_t a1, char *a2, unint64_t a3)
{
  if (*(_DWORD *)(a1 + 576)) {
    return -1;
  }
  else {
    return graisPRead(a1, a2, a3, atomic_fetch_add((atomic_ullong *volatile)(a1 + 584), a3));
  }
}

uint64_t graisPRead(uint64_t a1, char *a2, uint64_t a3, unint64_t a4)
{
  if (*(_DWORD *)(a1 + 576)) {
    return -1;
  }
  if (!a3) {
    return 0;
  }
  unint64_t v5 = a4;
  if ((a4 & 0x8000000000000000) == 0)
  {
    unint64_t v7 = a4 + a3;
    if (a4 + a3 >= *(void *)(a1 + 40)) {
      unint64_t v7 = *(void *)(a1 + 40);
    }
    if (__CFADD__(a4, a3)) {
      unint64_t v8 = *(void *)(a1 + 40);
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 > a4)
    {
      unint64_t v9 = a4 / *(unsigned int *)(a1 + 48);
      if (v9 < *(void *)(a1 + 56))
      {
        uint64_t v4 = 0;
        unsigned int v11 = (_DWORD *)(a1 + 448);
        while (1)
        {
          uint64_t v45 = *(unsigned int *)(a1 + 48);
          if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 464)))
          {
            int v35 = "SharedArrayPop: pthread_mutex_lock failed\n";
            __int16 v36 = 91;
LABEL_38:
            pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayPop", v36, 0, v35, v12, v13, v14, (char)v39);
            int v37 = "SharedArrayPop";
            __int16 v38 = 395;
            goto LABEL_39;
          }
          while (!*v11)
          {
            if (pthread_cond_wait((pthread_cond_t *)(a1 + 528), (pthread_mutex_t *)(a1 + 464)))
            {
              int v35 = "SharedArrayPop: pthread_cond_wait failed\n";
              __int16 v36 = 94;
              goto LABEL_38;
            }
          }
          unsigned int v15 = *v11 - 1;
          *(_DWORD *)(a1 + 448) = v15;
          unsigned int v16 = *(_DWORD *)(*(void *)(a1 + 456) + 4 * v15);
          if (pthread_mutex_unlock((pthread_mutex_t *)(a1 + 464)))
          {
            int v35 = "SharedArrayPop: pthread_mutex_unlock failed\n";
            __int16 v36 = 98;
            goto LABEL_38;
          }
          unint64_t v42 = v8;
          uint64_t v17 = *(void *)(a1 + 128);
          uint64_t v18 = v17 + 136 * v16;
          *(void *)uint64_t v18 = v9;
          *(_DWORD *)(v18 + 8) = -1;
          unsigned int v39 = (unsigned int *)(v18 + 8);
          unint64_t v40 = v9;
          if ((sendMessage_0(a1, v16, -1) & 0x80000000) != 0)
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"acquireCachedBlock", 404, 33, 0, "send request", v19, v20, (char)v39);
            int v43 = 0;
          }
          else
          {
            int v43 = 1;
          }
          unsigned int v41 = v16;
          uint64_t v21 = v17 + 136 * v16;
          uint64_t v22 = (pthread_mutex_t *)(v21 + 24);
          if (pthread_mutex_lock((pthread_mutex_t *)(v21 + 24))) {
            goto LABEL_27;
          }
          int v25 = (int *)(v21 + 16);
          uint64_t v26 = (pthread_cond_t *)(v17 + 136 * v41 + 88);
          while (*v25 <= 0)
          {
            if (pthread_cond_wait(v26, v22)) {
              goto LABEL_27;
            }
          }
          --*v25;
          if (pthread_mutex_unlock(v22))
          {
LABEL_27:
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"acquireCachedBlock", 410, 33, 0, "SemAcquire", v23, v24, (char)v39);
            int v43 = 0;
          }
          uint64_t v27 = *v39;
          if ((SharedArrayPush_0((unsigned int *)(a1 + 448), v41) & 0x80000000) != 0) {
            break;
          }
          if (!v43 || v27 == -1) {
            goto LABEL_40;
          }
          unint64_t v30 = v40 * v45;
          unint64_t v31 = v40 * v45 + v45;
          unint64_t v46 = v31;
          if (v31 >= v42) {
            unint64_t v31 = v42;
          }
          unint64_t v44 = v31;
          unint64_t v32 = v31 - v5;
          memcpy(a2, (const void *)(*(void *)(*(void *)(a1 + 112) + 32 * v27 + 16) + v5 - v30), v31 - v5);
          v4 += v32;
          unsigned int v33 = (atomic_uint *)(*(void *)(a1 + 112) + 32 * v27);
          unint64_t v8 = v42;
          atomic_fetch_add(v33, 0xFFFFFFFF);
          if (v42 > v46)
          {
            a2 += v32;
            unint64_t v5 = v44;
            unint64_t v9 = v40 + 1;
            if (v40 + 1 < *(void *)(a1 + 56)) {
              continue;
            }
          }
          return v4;
        }
        int v37 = "SharedArrayPush";
        __int16 v38 = 418;
LABEL_39:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"acquireCachedBlock", v38, 33, 0, v37, v28, v29, (char)v39);
LABEL_40:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"graisPRead", 464, 33, 0, "acquire segment in cache", v28, v29, (char)v39);
        return -1;
      }
    }
    return 0;
  }
  return -1;
}

uint64_t graisSeek(uint64_t a1, unint64_t a2, int a3)
{
  if (!*(_DWORD *)(a1 + 576))
  {
    if (a3)
    {
      if (a3 == 1)
      {
        a2 += atomic_fetch_add((atomic_ullong *volatile)(a1 + 584), a2);
        return a2;
      }
      if (a3 != 2) {
        return -1;
      }
      a2 += *(void *)(a1 + 40);
    }
    atomic_store(a2, (unint64_t *)(a1 + 584));
    return a2;
  }
  return -1;
}

uint64_t graisAbort(uint64_t result)
{
  if (!*(_DWORD *)(result + 576))
  {
    *(_DWORD *)(result + 576) = 1;
    uint64_t v1 = *(uint64_t (**)(void))(result + 24);
    if (v1) {
      return v1(*(void *)(result + 8));
    }
  }
  return result;
}

uint64_t sendMessage_0(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 208);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 208)))
  {
    int v10 = "SharedArrayPop: pthread_mutex_lock failed\n";
    __int16 v11 = 91;
LABEL_8:
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayPop", v11, 0, v10, v7, v8, v9, v21);
    uint64_t v17 = "SharedArrayPop";
    __int16 v18 = 339;
LABEL_9:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"sendMessage", v18, 33, 0, v17, v15, v16, v21);
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    int v12 = *(_DWORD *)(a1 + 192);
    if (v12) {
      break;
    }
    if (pthread_cond_wait((pthread_cond_t *)(a1 + 272), v6))
    {
      int v10 = "SharedArrayPop: pthread_cond_wait failed\n";
      __int16 v11 = 94;
      goto LABEL_8;
    }
  }
  unsigned int v13 = v12 - 1;
  *(_DWORD *)(a1 + 192) = v13;
  uint64_t v14 = *(unsigned int *)(*(void *)(a1 + 200) + 4 * v13);
  if (pthread_mutex_unlock(v6))
  {
    int v10 = "SharedArrayPop: pthread_mutex_unlock failed\n";
    __int16 v11 = 98;
    goto LABEL_8;
  }
  uint64_t v20 = (_DWORD *)(*(void *)(a1 + 80) + 8 * v14);
  *uint64_t v20 = a2;
  v20[1] = a3;
  if ((SharedArrayPush_0((unsigned int *)(a1 + 320), v14) & 0x80000000) != 0)
  {
    uint64_t v17 = "SharedArrayPush";
    __int16 v18 = 347;
    goto LABEL_9;
  }
  return 0;
}

uint64_t contextPassThroughProc(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 40) = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 104) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(_OWORD *)(a1 + 56) = v2;
  unint64_t v5 = *(uint64_t (**)(void))(a1 + 120);
  if (v5) {
    return v5(*(void *)(a1 + 112));
  }
  else {
    return 0;
  }
}

uint64_t verifySegmentProc(uint64_t a1, size_t __size, uint64_t a3, int a4, void *a5, size_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (*(unsigned int *)(a1 + 56) >= __size)
  {
    int v35 = 0;
    memset(v34, 0, sizeof(v34));
    if (__size < 0x2000000001)
    {
      uint64_t v16 = malloc(__size);
      int v10 = v16;
      if (v16)
      {
        __s2 = a5;
        uint64_t v21 = *(void *)(a1 + 8);
        if (*(void *)(v21 + 32))
        {
          uint64_t v22 = 0;
          if (__size)
          {
            uint64_t v23 = v16;
            size_t v24 = __size;
            while (1)
            {
              uint64_t v25 = (*(uint64_t (**)(void, void *, size_t, uint64_t))(v21 + 32))(*(void *)v21, v23, v24, a3);
              if (v25 < 0) {
                break;
              }
              if (v25)
              {
                uint64_t v23 = (void *)((char *)v23 + v25);
                v22 += v25;
                a3 += v25;
                v24 -= v25;
                if (v24) {
                  continue;
                }
              }
              goto LABEL_15;
            }
            uint64_t v22 = v25;
          }
        }
        else
        {
          uint64_t v22 = -1;
        }
LABEL_15:
        if (v22 == __size)
        {
          int v26 = aeaChecksum((uint64_t)v34, a4, v10, __size, v17, v18, v19, v20);
          uint64_t v8 = 0;
          if (v26 < 0 || LODWORD(v34[0]) != a6) {
            goto LABEL_20;
          }
          if (!memcmp((char *)v34 + 4, __s2, a6))
          {
            uint64_t v28 = *(uint64_t (**)(void, float))(a1 + 128);
            if (v28
              && (unint64_t v29 = *(void *)(a1 + 72)) != 0
              && (v28(*(void *)(a1 + 112), (float)((float)(atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 368), __size, memory_order_relaxed)+ __size)* 100.0)/ (float)v29) & 0x80000000) != 0)
            {
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"verifySegmentProc", 128, 128, 0, "progress_proc", v30, v31, v32);
              uint64_t v8 = 0xFFFFFFFFLL;
            }
            else
            {
              uint64_t v8 = 1;
            }
            goto LABEL_20;
          }
        }
      }
      uint64_t v8 = 0;
    }
    else
    {
      int v10 = 0;
      uint64_t v8 = 0;
      *__error() = 12;
    }
LABEL_20:
    free(v10);
    return v8;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"verifySegmentProc", 112, 128, 0, "Invalid segment size", a7, a8, v32);
  return 0xFFFFFFFFLL;
}

uint64_t readerProc(uint64_t **a1)
{
  long long v2 = *a1;
  size_t v3 = (size_t)a1[2];
  if (v3 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_19:
    uint64_t v17 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"readerProc", 142, 128, *v17, "aaMalloc", v18, v19, v22);
    uint64_t v23 = 0;
    goto LABEL_20;
  }
  uint64_t v23 = (char *)malloc(v3);
  if (!v23) {
    goto LABEL_19;
  }
  char v4 = 0;
  int v5 = 3;
  do
  {
    int v6 = v5;
    uint64_t v7 = a1[2];
    uint64_t v8 = *v2;
    if (*(void *)(*v2 + 32))
    {
      if (!v7) {
        break;
      }
      uint64_t v9 = 0;
      int v10 = a1[1];
      __int16 v11 = v23;
      int v12 = a1[2];
      while (1)
      {
        uint64_t v13 = (*(uint64_t (**)(void, char *, uint64_t *, uint64_t *))(v8 + 32))(*(void *)v8, v11, v12, v10);
        if (v13 < 0) {
          break;
        }
        if (v13)
        {
          v11 += v13;
          v9 += v13;
          int v10 = (uint64_t *)((char *)v10 + v13);
          int v12 = (uint64_t *)((char *)v12 - v13);
          if (v12) {
            continue;
          }
        }
        goto LABEL_14;
      }
      uint64_t v9 = v13;
    }
    else
    {
      uint64_t v9 = -1;
    }
LABEL_14:
    if (v7 == (uint64_t *)v9) {
      break;
    }
    int v5 = v6 - 1;
    char v4 = 1;
  }
  while (v6);
  if ((AAAsyncByteStreamProcess((uint64_t *)v2[4], (uint64_t)v23, (uint64_t)a1[2], (uint64_t)a1[1]) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"readerProc", 149, 128, 0, "AAAsyncByteStreamProcess", v14, v15, v22);
  }
  else if ((v4 & 1) == 0)
  {
    uint64_t v16 = 0;
    goto LABEL_25;
  }
LABEL_20:
  if (!pthread_mutex_lock((pthread_mutex_t *)(v2 + 29)))
  {
    int v20 = *((_DWORD *)v2 + 56);
    *((_DWORD *)v2 + 56) = v20 + 1;
    if (v20 || !pthread_cond_broadcast((pthread_cond_t *)(v2 + 37))) {
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 29));
    }
  }
  uint64_t v16 = 0xFFFFFFFFLL;
LABEL_25:
  free(v23);
  return v16;
}

uint64_t writerProc_0(uint64_t a1, size_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v10 = a2;
  if (*(_DWORD *)(a1 + 384))
  {
    int v12 = (pthread_mutex_t *)(a1 + 160);
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 160)))
    {
      uint64_t v13 = "MutexLock";
      __int16 v14 = 172;
LABEL_30:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"writerProc", v14, 128, 0, v13, a7, a8, v44);
      return 0xFFFFFFFFLL;
    }
    unsigned int v19 = atomic_load((unsigned int *)(a1 + 376));
    if (!v19) {
      atomic_compare_exchange_strong((atomic_uint *volatile)(a1 + 376), &v19, 1u);
    }
    uint64_t v20 = *(void *)(a1 + 360);
    if (v20 <= a3)
    {
      if (v20 < a3)
      {
        size_t v24 = 0;
        uint64_t v25 = 0;
        uint64_t v26 = 0;
        uint64_t v27 = *(void *)(a1 + 344);
        do
        {
          if (!*(void *)(v27 + v25))
          {
            unint64_t v40 = (char *)(v27 + v25);
            goto LABEL_57;
          }
          ++v26;
          v25 += 24;
          v24 += 2;
        }
        while (v26 != *(void *)(a1 + 352));
        if (*(_DWORD *)(a1 + 388))
        {
          uint64_t v21 = "too many writes pending";
          __int16 v22 = 190;
          goto LABEL_14;
        }
        if (v26 < 0)
        {
          uint64_t v21 = "too many writes pending";
          __int16 v22 = 198;
          goto LABEL_14;
        }
        if (is_mul_ok(v24, 0x18uLL) && 24 * v24 <= 0x2000000000)
        {
          unint64_t v42 = (char *)calloc(v24, 0x18uLL);
          if (v42)
          {
            int v43 = v42;
            memcpy(v42, *(const void **)(a1 + 344), 24 * *(void *)(a1 + 352));
            free(*(void **)(a1 + 344));
            *(void *)(a1 + 344) = v43;
            *(void *)(a1 + 352) = v24;
            unint64_t v40 = &v43[v25];
LABEL_57:
            if (v10 < 0x2000000001)
            {
              unsigned int v41 = malloc(v10);
              *(void *)unint64_t v40 = v41;
              if (v41)
              {
                memcpy(v41, a4, v10);
                uint64_t v23 = 0;
                *((void *)v40 + 1) = a3;
                *((void *)v40 + 2) = v10;
                goto LABEL_54;
              }
            }
            else
            {
              *__error() = 12;
              *(void *)unint64_t v40 = 0;
            }
            uint64_t v21 = "malloc";
            __int16 v22 = 217;
            goto LABEL_14;
          }
        }
        else
        {
          *__error() = 12;
        }
        uint64_t v21 = "too many writes pending";
        __int16 v22 = 200;
        goto LABEL_14;
      }
      for (i = 0; ; size_t v10 = (size_t)i[2])
      {
        uint64_t v31 = *(void *)(a1 + 8);
        if (*(void *)(v31 + 24))
        {
          uint64_t v32 = 0;
          if (v10)
          {
            size_t v33 = v10;
            while (1)
            {
              uint64_t v34 = (*(uint64_t (**)(void, char *, size_t))(v31 + 24))(*(void *)v31, a4, v33);
              if (v34 < 1) {
                break;
              }
              a4 += v34;
              v32 += v34;
              v33 -= v34;
              if (!v33) {
                goto LABEL_39;
              }
            }
            uint64_t v32 = v34;
          }
        }
        else
        {
          uint64_t v32 = -1;
        }
LABEL_39:
        if (v10 != v32) {
          break;
        }
        if (i)
        {
          free(*i);
          *size_t i = 0;
        }
        *(void *)(a1 + 360) += v10;
        int v35 = *(void (**)(void, float))(a1 + 128);
        if (v35)
        {
          unint64_t v36 = *(void *)(a1 + 72);
          if (v36) {
            v35(*(void *)(a1 + 112), (float)((float)(atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 368), v10, memory_order_relaxed)+ v10)* 100.0)/ (float)v36);
          }
        }
        if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 232))
          || (int v37 = *(_DWORD *)(a1 + 224), *(_DWORD *)(a1 + 224) = v37 + 1, !v37)
          && pthread_cond_broadcast((pthread_cond_t *)(a1 + 296))
          || pthread_mutex_unlock((pthread_mutex_t *)(a1 + 232)))
        {
          uint64_t v21 = "SemRelease";
          __int16 v22 = 241;
          goto LABEL_14;
        }
        uint64_t v38 = 0;
        size_t i = *(void ***)(a1 + 344);
        while (i[1] != *(void **)(a1 + 360))
        {
          ++v38;
          i += 3;
          if (v38 == *(void *)(a1 + 352))
          {
            uint64_t v23 = 0;
            goto LABEL_54;
          }
        }
        a4 = (char *)*i;
      }
      uint64_t v21 = "aaByteStreamWriteExpected";
      __int16 v22 = 229;
    }
    else
    {
      uint64_t v21 = "data already written";
      __int16 v22 = 178;
    }
LABEL_14:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"writerProc", v22, 128, 0, v21, a7, a8, v44);
    uint64_t v23 = 0xFFFFFFFFLL;
LABEL_54:
    pthread_mutex_unlock(v12);
    return v23;
  }
  uint64_t v15 = *(void *)(a1 + 8);
  if (*(void *)(v15 + 40))
  {
    uint64_t v16 = 0;
    if (a2)
    {
      size_t v17 = a2;
      while (1)
      {
        uint64_t v18 = (*(uint64_t (**)(void, char *, size_t, uint64_t))(v15 + 40))(*(void *)v15, a4, v17, a3);
        if (v18 < 1) {
          break;
        }
        a4 += v18;
        v16 += v18;
        a3 += v18;
        v17 -= v18;
        if (!v17) {
          goto LABEL_24;
        }
      }
      uint64_t v16 = v18;
    }
  }
  else
  {
    uint64_t v16 = -1;
  }
LABEL_24:
  if (v16 != v10)
  {
    uint64_t v13 = "aaByteStreamPWriteExpected";
    __int16 v14 = 166;
    goto LABEL_30;
  }
  uint64_t v28 = *(uint64_t (**)(void, float))(a1 + 128);
  if (v28)
  {
    unint64_t v29 = *(void *)(a1 + 72);
    if (v29)
    {
      if ((v28(*(void *)(a1 + 112), (float)((float)(atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 368), v10, memory_order_relaxed)+ v10)* 100.0)/ (float)v29) & 0x80000000) != 0)
      {
        uint64_t v13 = "progress_proc";
        __int16 v14 = 167;
        goto LABEL_30;
      }
    }
  }
  return 0;
}

uint64_t AEADecryptToStreamChunk(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t a6, unint64_t a7, unint64_t a8, int a9)
{
  int DefaultNThreads = a9;
  uint64_t v92 = *MEMORY[0x263EF8340];
  long long v89 = 0u;
  long long __count = 0u;
  long long v87 = 0u;
  memset(v86, 0, sizeof(v86));
  *(_OWORD *)unsigned int v85 = 0u;
  *(_OWORD *)char v84 = 0u;
  long long v83 = 0u;
  long long v82 = 0u;
  long long v81 = 0u;
  long long v80 = 0u;
  long long v79 = 0u;
  long long v78 = 0u;
  long long v77 = 0u;
  if (!a9) {
    int DefaultNThreads = getDefaultNThreads();
  }
  v76[0] = a1;
  v76[1] = a2;
  *(void *)&long long v83 = a3;
  *((void *)&v83 + 1) = a4;
  v84[0] = a5;
  *(void *)&long long __count = 3 * DefaultNThreads - 1;
  BOOL v18 = (a8 & 0x400) == 0 || *(void *)(a2 + 40) == 0;
  BOOL v90 = v18;
  if ((a8 & 0x100000000000000) != 0)
  {
    int v19 = !v18;
    if (!*(void *)(a2 + 32)) {
      int v19 = 0;
    }
  }
  else
  {
    int v19 = 0;
  }
  HIDWORD(v89) = v19;
  BOOL v91 = a6 == 0;
  if (pthread_mutex_init((pthread_mutex_t *)v86, 0))
  {
    __int16 v22 = "MutexInit";
    __int16 v23 = 288;
    goto LABEL_15;
  }
  *(_DWORD *)&v86[64] = 0;
  if (pthread_mutex_init((pthread_mutex_t *)&v86[72], 0) || pthread_cond_init((pthread_cond_t *)&v86[136], 0))
  {
    __int16 v22 = "SemInit";
    __int16 v23 = 289;
    goto LABEL_15;
  }
  if (DefaultNThreads >= 2)
  {
    int v37 = DefaultNThreads - 1;
    do
    {
      if (pthread_mutex_lock((pthread_mutex_t *)&v86[72])
        || (int v38 = *(_DWORD *)&v86[64], ++*(_DWORD *)&v86[64], !v38)
        && pthread_cond_broadcast((pthread_cond_t *)&v86[136])
        || pthread_mutex_unlock((pthread_mutex_t *)&v86[72]))
      {
        __int16 v22 = "SemRelease";
        __int16 v23 = 292;
        goto LABEL_15;
      }
      --v37;
    }
    while (v37);
  }
  if (is_mul_ok(__count, 0x18uLL) && (unint64_t)(24 * __count) < 0x2000000001)
  {
    unint64_t v40 = calloc(__count, 0x18uLL);
  }
  else
  {
    unsigned int v39 = __error();
    unint64_t v40 = 0;
    *unsigned int v39 = 12;
  }
  *((void *)&v87 + 1) = v40;
  if (DefaultNThreads < 0)
  {
    *__error() = 12;
    v84[1] = 0;
    unint64_t v42 = __error();
    unsigned int v41 = 0;
    *unint64_t v42 = 12;
  }
  else
  {
    v84[1] = calloc(DefaultNThreads, 0x18uLL);
    unsigned int v41 = calloc(DefaultNThreads, 8uLL);
  }
  v85[0] = v41;
  if (!*((void *)&v87 + 1) || !v84[1] || !v41)
  {
    int v24 = *__error();
    __int16 v22 = "malloc";
    __int16 v23 = 299;
    goto LABEL_16;
  }
  if (HIDWORD(v89)) {
    int v43 = verifySegmentProc;
  }
  else {
    int v43 = 0;
  }
  char v44 = (uint64_t (**)(void))AEADecryptAsyncStreamOpen((uint64_t)v76, (uint64_t)contextPassThroughProc, (uint64_t)v43, (uint64_t)writerProc_0, a8, DefaultNThreads);
  *(void *)&long long v77 = v44;
  if (!v44)
  {
    __int16 v22 = "AEADecryptAsyncStreamOpen";
    __int16 v23 = 308;
    goto LABEL_15;
  }
  if (a6)
  {
    unint64_t v46 = AAChunkAsyncStreamOpen((uint64_t)v44, a6, a7, a8, DefaultNThreads, v45, v20, v21);
    *((void *)&v77 + 1) = v46;
    if (!v46)
    {
      __int16 v22 = "AAChunkAsyncStreamOpen";
      __int16 v23 = 317;
      goto LABEL_15;
    }
    uint64_t v47 = v46;
    char v44 = (uint64_t (**)(void))v77;
  }
  else
  {
    uint64_t v47 = (uint64_t (**)(void))*((void *)&v77 + 1);
  }
  if (!v47) {
    uint64_t v47 = v44;
  }
  *(void *)&long long v78 = v47;
  if (DefaultNThreads >= 1)
  {
    for (uint64_t i = 0; i != DefaultNThreads; *((void *)v85[0] + i++) = v49)
    {
      size_t v49 = (char *)v84[1] + 24 * i;
      *size_t v49 = v76;
    }
  }
  v85[1] = ThreadPoolCreate(DefaultNThreads, (uint64_t)v85[0], (uint64_t)readerProc);
  if (!v85[1])
  {
    __int16 v22 = "ThreadPoolCreate";
    __int16 v23 = 329;
    goto LABEL_15;
  }
  while (2)
  {
    if (v90)
    {
      unsigned int v50 = atomic_load((unsigned int *)&v89 + 2);
      if (v50 && v91)
      {
        while (!pthread_mutex_lock((pthread_mutex_t *)&v86[72]))
        {
          v74.unint64_t tv_sec = 0;
          *(void *)&v74.tv_usec = 0;
          gettimeofday(&v74, 0);
          uint64_t v52 = 1000 * v74.tv_usec;
          if (v74.tv_usec < 1000000)
          {
            __darwin_time_t v55 = v74.tv_sec + 1;
          }
          else
          {
            if (v52 >= 1999999999) {
              uint64_t v53 = 1999999999;
            }
            else {
              uint64_t v53 = 1000 * v74.tv_usec;
            }
            unint64_t v54 = (v52 + 999999999 - v53) / 0x3B9ACA00uLL;
            __darwin_time_t v55 = v74.tv_sec + v54 + 2;
            uint64_t v52 = v52 - 1000000000 * v54 - 1000000000;
          }
          v75.unint64_t tv_sec = v55;
          v75.uint64_t tv_nsec = v52;
          do
          {
            if (*(int *)&v86[64] > 0)
            {
              --*(_DWORD *)&v86[64];
              if (!pthread_mutex_unlock((pthread_mutex_t *)&v86[72])) {
                goto LABEL_97;
              }
              goto LABEL_107;
            }
            int v56 = pthread_cond_timedwait((pthread_cond_t *)&v86[136], (pthread_mutex_t *)&v86[72], &v75);
          }
          while (!v56);
          if (v56 != 60 || pthread_mutex_unlock((pthread_mutex_t *)&v86[72])) {
            break;
          }
          if (aaAsyncByteStreamIsCancelled((void *)v78))
          {
            __int16 v22 = "aaAsyncByteStreamIsCancelled";
            __int16 v23 = 343;
            goto LABEL_15;
          }
          if (!v91) {
            goto LABEL_97;
          }
        }
LABEL_107:
        __int16 v22 = "SemTimedAcquire";
        __int16 v23 = 341;
        break;
      }
    }
    while (1)
    {
LABEL_97:
      unint64_t v72 = 0;
      uint64_t v73 = 0;
      int Range = AAAsyncByteStreamGetRange((void *)v78, &v72, &v73);
      if (Range < 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", 352, 128, 0, "AAAsyncByteStreamGetRange", v63, v64, v71);
        int v25 = 0;
LABEL_104:
        ThreadPoolSync((unsigned int *)v85[1]);
        goto LABEL_17;
      }
      if (Range) {
        break;
      }
      usleep(0x186A0u);
    }
    if (!v72)
    {
      int v25 = 1;
      goto LABEL_104;
    }
    uint64_t Worker = ThreadPoolGetWorker((uint64_t)v85[1], v58, v59, v60, v61, v62, v63, v64);
    if (Worker)
    {
      unint64_t v70 = v72;
      *(void *)(Worker + 8) = v73;
      *(void *)(Worker + 16) = v70;
      if ((ThreadPoolRunWorker((uint64_t)v85[1], Worker, v66, v67, v68, v69, v20, v21) & 0x80000000) == 0) {
        continue;
      }
      __int16 v22 = "ThreadPoolRunWorker";
      __int16 v23 = 365;
    }
    else
    {
      __int16 v22 = "ThreadPoolGetWorker";
      __int16 v23 = 362;
    }
    break;
  }
LABEL_15:
  int v24 = 0;
LABEL_16:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", v23, 128, v24, v22, v20, v21, v71);
  int v25 = 0;
LABEL_17:
  if (DefaultNThreads >= 1)
  {
    do
    {
      if (!pthread_mutex_lock((pthread_mutex_t *)&v86[72]))
      {
        int v26 = (*(_DWORD *)&v86[64])++;
        if (v26 || !pthread_cond_broadcast((pthread_cond_t *)&v86[136])) {
          pthread_mutex_unlock((pthread_mutex_t *)&v86[72]);
        }
      }
      --DefaultNThreads;
    }
    while (DefaultNThreads);
  }
  if ((ThreadPoolDestroy((uint64_t)v85[1]) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", 373, 128, 0, "Readers reported errors", v27, v28, v71);
    int v25 = 0;
  }
  if ((AAAsyncByteStreamClose(*((uint64_t (***)(void))&v77 + 1)) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", 374, 128, 0, "Async stream reported errors", v29, v30, v71);
    int v25 = 0;
  }
  if ((AAAsyncByteStreamClose((uint64_t (**)(void))v77) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", 375, 128, 0, "Async stream reported errors", v31, v32, v71);
    int v25 = 0;
  }
  pthread_mutex_destroy((pthread_mutex_t *)v86);
  if (!pthread_mutex_destroy((pthread_mutex_t *)&v86[72])) {
    pthread_cond_destroy((pthread_cond_t *)&v86[136]);
  }
  size_t v33 = (void *)*((void *)&v87 + 1);
  if (*((void *)&v87 + 1))
  {
    if ((void)__count)
    {
      uint64_t v34 = 0;
      unint64_t v35 = 0;
      do
      {
        free(*(void **)(*((void *)&v87 + 1) + v34));
        ++v35;
        v34 += 24;
      }
      while (v35 < (unint64_t)__count);
      size_t v33 = (void *)*((void *)&v87 + 1);
    }
    free(v33);
  }
  free(v84[1]);
  free(v85[0]);
  if (v25) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t AEADecryptToStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t a6, int a7)
{
  return AEADecryptToStreamChunk(a1, a2, a3, a4, a5, 0, 0, a6, a7);
}

size_t PCompressLZBITMAPEncode(uint8_t *a1, size_t a2, const uint8_t *a3, size_t a4)
{
  size_t result = compression_encode_buffer(a1, a2, a3, a4, 0, COMPRESSION_LZBITMAP);
  if (!result) {
    return -1;
  }
  return result;
}

size_t PCompressLZBITMAPDecode(uint8_t *a1, size_t a2, const uint8_t *a3, size_t a4)
{
  size_t result = compression_decode_buffer(a1, a2, a3, a4, 0, COMPRESSION_LZBITMAP);
  if (!result) {
    return -1;
  }
  return result;
}

void *PagedFileCreate(const char *a1, unint64_t a2, unint64_t a3, int a4)
{
  memset(&v57, 0, sizeof(v57));
  if (stat(a1, &v57))
  {
    int v10 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileCreate", 320, 21, v10, "%s", v11, v12, (char)a1);
    return 0;
  }
  st_unsigned int size = v57.st_size;
  if (v57.st_size <= a2) {
    off_t v14 = a2;
  }
  else {
    off_t v14 = v57.st_size;
  }
  unint64_t v15 = v14 + 4095;
  if (v15 >= 0xFFFFFFEF000)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileCreate", 324, 21, 0, "File is too large to be patched in place", v8, v9, v55);
    return 0;
  }
  uint64_t v18 = (v15 >> 12) + 16;
  if ((a3 >> 12) <= 1) {
    unsigned int v19 = 1;
  }
  else {
    unsigned int v19 = a3 >> 12;
  }
  unsigned int v20 = v19 + v18;
  size_t v21 = (v19 << 12) + 4096 + 4 * v19 + 16 * (v18 & 0x3FFFFFFF) + 8 * v20 + 8 * v20 + 216;
  __int16 v22 = malloc(v21);
  uint64_t v16 = v22;
  if (!v22)
  {
    uint64_t v29 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileCreate", 339, 21, *v29, "malloc", v30, v31, v55);
    return v16;
  }
  bzero(v22, v21);
  if (a4 >= 2) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Opening paged file %s, %u pages in file, %u pages in cache, %u pages total, memory usage: %zu B\n", a1, v18, v19, v19 + v18, v21);
  }
  *(_DWORD *)uint64_t v16 = -1;
  v16[1] = st_size;
  v16[2] = a2;
  *((_DWORD *)v16 + 32) = a4;
  *((_DWORD *)v16 + 6) = v18;
  *((_DWORD *)v16 + 7) = v19;
  *((_DWORD *)v16 + 8) = v20;
  int v23 = open(a1, 2);
  *(_DWORD *)uint64_t v16 = v23;
  if (v23 < 0)
  {
    int v26 = *__error();
    char v56 = (char)a1;
    uint64_t v27 = "%s";
    __int16 v28 = 357;
    goto LABEL_23;
  }
  char v56 = 1;
  if (fcntl(v23, 48)) {
    fwrite("Warning: couldn't set F_NOCACHE on paged file\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  if (ftruncate(*(_DWORD *)v16, v18 << 12))
  {
    int v26 = *__error();
    char v56 = (char)a1;
    uint64_t v27 = "%s";
    __int16 v28 = 365;
LABEL_23:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileCreate", v28, 21, v26, v27, v24, v25, v56);
    if ((*(_DWORD *)v16 & 0x80000000) == 0) {
      close(*(_DWORD *)v16);
    }
    free(v16);
    return 0;
  }
  uint64_t v32 = (char *)(v16 + 24);
  uint64_t v33 = *((unsigned int *)v16 + 6);
  uint64_t v34 = *((unsigned int *)v16 + 7);
  uint64_t v35 = (uint64_t)v16 + 4 * v33 + 192;
  uint64_t v36 = v35 + 4 * v33;
  uint64_t v37 = v36 + 4 * v33;
  v16[14] = v36;
  v16[15] = v37;
  uint64_t v38 = v37 + 4 * v33;
  v16[7] = v38;
  v16[8] = v35;
  uint64_t v39 = *((unsigned int *)v16 + 8);
  uint64_t v40 = v38 + 4 * v39;
  uint64_t v41 = v40 + 4 * v39;
  v16[5] = v41;
  v16[6] = v16 + 24;
  uint64_t v42 = v41 + 8 * v39;
  v16[9] = v40;
  v16[10] = v42;
  uint64_t v43 = v42 + 4096;
  uint64_t v44 = v42 + 4096 + (v34 << 12);
  v16[11] = v43;
  v16[12] = v44;
  if (v44 + 4 * v34 > (unint64_t)v16 + v21)
  {
    uint64_t v27 = "in memory allocation for PagedFile";
    __int16 v28 = 378;
    int v26 = 0;
    goto LABEL_23;
  }
  if (v39)
  {
    unint64_t v45 = 0;
    do
    {
      *(void *)(v38 + 8 * v39) = 0;
      *(_DWORD *)(v38 + 4 * v45) = -1;
      *(_DWORD *)(v38 + 4 * v39) = -1;
      ++v45;
      ++v39;
    }
    while (v45 < *((unsigned int *)v16 + 8));
    unsigned int v46 = *((_DWORD *)v16 + 6);
  }
  else
  {
    unsigned int v46 = v33;
  }
  if (v46)
  {
    unint64_t v47 = 0;
    uint64_t v48 = &v32[4 * v33];
    size_t v49 = &v32[12 * v33];
    unsigned int v50 = &v32[8 * v33];
    do
    {
      *(_DWORD *)&v32[4 * v47] = -1;
      *(_DWORD *)&v48[4 * v47] = -1;
      *(_DWORD *)&v50[4 * v47] = -1;
      *(_DWORD *)&v49[4 * v47++] = -1;
    }
    while (v47 < v46);
    unint64_t v51 = 0;
    unint64_t v52 = 0;
    unint64_t v53 = st_size;
    do
    {
      if (v51 >= st_size) {
        break;
      }
      unint64_t v54 = v53 - 4096;
      if (v53 >= 0x1000) {
        unint64_t v53 = 4096;
      }
      *(void *)(v41 + 8 * v52) = v53;
      *(_DWORD *)(v38 + 4 * v52) = v52;
      *(_DWORD *)&v32[4 * v52] = v52;
      ++v52;
      v51 += 4096;
      unint64_t v53 = v54;
    }
    while (v52 < v46);
  }
  return v16;
}

uint64_t PagedFileDestroy(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    for (unsigned int i = *(_DWORD *)(result + 24); ; ++i)
    {
      if (i >= *(_DWORD *)(v8 + 32))
      {
        int v10 = 1;
        goto LABEL_8;
      }
      if (storeCachePos(v8, i, a3, a4, a5, a6, a7, a8)) {
        break;
      }
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"flushCache", 243, 21, 0, "flushing cache pos", a7, a8, v19);
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDestroy", 423, 21, 0, "flush cache", v11, v12, v20);
    int v10 = 0;
LABEL_8:
    if ((*(_DWORD *)v8 & 0x80000000) == 0)
    {
      if (ftruncate(*(_DWORD *)v8, *(void *)(v8 + 16)))
      {
        uint64_t v13 = __error();
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDestroy", 427, 21, *v13, "Final truncate", v14, v15, v19);
        int v10 = 0;
      }
      if (fcntl(*(_DWORD *)v8, 51, 0) == -1)
      {
        uint64_t v16 = __error();
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDestroy", 432, 21, *v16, "Final FULLSYNC", v17, v18, v21);
        int v10 = 0;
      }
      close(*(_DWORD *)v8);
    }
    if (*(int *)(v8 + 128) >= 2) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "Closing paged file, input size: %llu B, output size: %llu B, bytes read: %llu B, bytes written: %llu B\n", *(void *)(v8 + 8), *(void *)(v8 + 16), *(void *)(v8 + 136), *(void *)(v8 + 144));
    }
    free((void *)v8);
    if (v10) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t PagedFileDump(uint64_t a1, const char *a2)
{
  size_t v3 = (FILE **)MEMORY[0x263EF8348];
  char v4 = "current PagedFile state";
  if (a2) {
    char v4 = a2;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "*** %s\n", v4);
  LODWORD(v7) = *(_DWORD *)(a1 + 32);
  if (!v7)
  {
    int v14 = 0;
    int v13 = 0;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    int v10 = 0;
    int v9 = 0;
    goto LABEL_29;
  }
  unint64_t v8 = 0;
  int v9 = 0;
  int v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  int v13 = 0;
  int v14 = 0;
  do
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8 * v8);
    if (!v15)
    {
      if (v8 < *(unsigned int *)(a1 + 24)) {
        ++v13;
      }
      else {
        ++v14;
      }
    }
    uint64_t v16 = *(unsigned int *)(*(void *)(a1 + 56) + 4 * v8);
    if (v16 != -1)
    {
      ++v9;
      v11 += v15;
      if (v8 != *(_DWORD *)(*(void *)(a1 + 48) + 4 * v16)) {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDump", 472, 21, 0, "invalid reverse index for IN", v5, v6, v22);
      }
    }
    uint64_t v17 = *(unsigned int *)(*(void *)(a1 + 72) + 4 * v8);
    if (v17 != -1)
    {
      ++v10;
      v12 += v15;
      if (v8 != *(_DWORD *)(*(void *)(a1 + 64) + 4 * v17)) {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDump", 480, 21, 0, "invalid reverse index for OUT", v5, v6, v22);
      }
    }
    if (*(_DWORD *)(*(void *)(a1 + 56) + 4 * v8) != -1 && *(_DWORD *)(*(void *)(a1 + 72) + 4 * v8) != -1) {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDump", 483, 21, 0, "inconsistency in inPage/outPage indices", v5, v6, v22);
    }
    int v18 = *(_DWORD *)(*(void *)(a1 + 56) + 4 * v8);
    if (v15)
    {
      if (v18 == -1 && *(_DWORD *)(*(void *)(a1 + 72) + 4 * v8) == -1)
      {
        __int16 v19 = 485;
        char v20 = "inconsistency in nRefs != 0";
LABEL_25:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDump", v19, 21, 0, v20, v5, v6, v22);
      }
    }
    else if (v18 != -1 || *(_DWORD *)(*(void *)(a1 + 72) + 4 * v8) != -1)
    {
      __int16 v19 = 486;
      char v20 = "inconsistency in nRefs == 0";
      goto LABEL_25;
    }
    ++v8;
    unint64_t v7 = *(unsigned int *)(a1 + 32);
  }
  while (v8 < v7);
  size_t v3 = (FILE **)MEMORY[0x263EF8348];
LABEL_29:
  fprintf(*v3, "  %u total pages\n", v7);
  fprintf(*v3, "  %u free pages in file\n", v13);
  fprintf(*v3, "  %u free pages in cache\n", v14);
  fprintf(*v3, "  %u input pages stored, %llu bytes referenced\n", v9, v11);
  return fprintf(*v3, "  %u output pages stored, %llu bytes referenced\n", v10, v12);
}

uint64_t PagedFileRetainIn(void *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = a1[6];
  while (1)
  {
    uint64_t v9 = *(unsigned int *)(v8 + 4 * (a2 >> 12));
    if (v9 == -1) {
      break;
    }
    uint64_t v10 = a1[15];
    *(_DWORD *)(a1[14] + 4 * (a2 >> 12)) = v9;
    unint64_t v11 = 4096 - (a2 & 0xFFF);
    *(_DWORD *)(v10 + 4 * v9) = a2 >> 12;
    if (v11 >= a3) {
      unint64_t v11 = a3;
    }
    *(void *)(a1[5] + 8 * v9) += v11;
    a2 += v11;
    a3 -= v11;
    if (!a3) {
      return 0;
    }
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileRetainIn", 503, 21, 0, "input page is not stored", a7, a8, vars0);
  return 0xFFFFFFFFLL;
}

uint64_t PagedFileReleaseIn(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0;
  }
  unint64_t v8 = a3;
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = (FILE **)MEMORY[0x263EF8348];
  while (1)
  {
    unint64_t v13 = 4096 - (a2 & 0xFFF) >= v8 ? v8 : 4096 - (a2 & 0xFFF);
    uint64_t v14 = *(unsigned int *)(v11 + 4 * (a2 >> 12));
    if (v14 == -1) {
      break;
    }
    uint64_t v15 = *(void *)(a1 + 40);
    unint64_t v16 = *(void *)(v15 + 8 * v14) - v13;
    *(void *)(v15 + 8 * v14) = v16;
    if (!v16)
    {
      if (*(int *)(a1 + 128) >= 3)
      {
        fprintf(*v12, "PagedFile: input page %u removed from storage\n", a2 >> 12);
        uint64_t v11 = *(void *)(a1 + 48);
      }
      *(_DWORD *)(*(void *)(a1 + 56) + 4 * v14) = -1;
      *(_DWORD *)(v11 + 4 * (a2 >> 12)) = -1;
    }
    a2 += v13;
    v8 -= v13;
    if (!v8) {
      return 0;
    }
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileReleaseIn", 525, 21, 0, "input page is not stored", a7, a8, v18);
  return 0xFFFFFFFFLL;
}

uint64_t PagedFileRetainOut(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0;
  }
  unint64_t v8 = a3;
  unint64_t v9 = a2;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = (FILE **)MEMORY[0x263EF8348];
  while (1)
  {
    unint64_t v13 = v9 >> 12;
    if (4096 - (v9 & 0xFFF) >= v8) {
      uint64_t v14 = v8;
    }
    else {
      uint64_t v14 = 4096 - (v9 & 0xFFF);
    }
    uint64_t v15 = *(unsigned int *)(v11 + 4 * v13);
    if (v15 != -1) {
      goto LABEL_11;
    }
    int FreeCachePos = getFreeCachePos(a1, a2, a3, a4, a5, a6, a7, a8);
    if (FreeCachePos == -1) {
      break;
    }
    unsigned int v17 = FreeCachePos;
    if (*(int *)(a1 + 128) >= 3) {
      fprintf(*v12, "PagedFile: assigning cache[%u] to new output page %u\n", FreeCachePos, v9 >> 12);
    }
    uint64_t v15 = v17;
    uint64_t v11 = *(void *)(a1 + 64);
    *(_DWORD *)(*(void *)(a1 + 72) + 4 * v17) = v13;
    *(_DWORD *)(v11 + 4 * (v9 >> 12)) = v17;
LABEL_11:
    *(void *)(*(void *)(a1 + 40) + 8 * v15) += v14;
    v9 += v14;
    v8 -= v14;
    if (!v8) {
      return 0;
    }
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileRetainOut", 555, 21, 0, "no storage available for output page", a7, a8, v19);
  return 0xFFFFFFFFLL;
}

uint64_t getFreeCachePos(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 24);
  uint64_t v9 = *(unsigned int *)(a1 + 32);
  if (v8 >= v9)
  {
LABEL_13:
    uint64_t v14 = "no cache";
    __int16 v15 = 231;
LABEL_14:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"getFreeCachePos", v15, 21, 0, v14, a7, a8, v17);
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = v8 - v9;
    uint64_t v13 = 0xFFFFFFFFLL;
    do
    {
      if (!*(void *)(*(void *)(a1 + 40) + 8 * v8 + 8 * v11)) {
        return (v8 + v11);
      }
      if (v13 == -1
        || *(_DWORD *)(*(void *)(a1 + 96) + 4 * v11) < *(_DWORD *)(*(void *)(a1 + 96)
                                                                   + 4 * (v13 - v8)))
      {
        uint64_t v13 = (v8 + v11);
      }
      ++v11;
    }
    while (v12 + v11);
    if (v13 == -1) {
      goto LABEL_13;
    }
    if (*(int *)(a1 + 128) >= 3) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "PagedFile: storing oldest cache[%u] to file\n", v13);
    }
    if (storeCachePos(a1, v13, a3, a4, a5, a6, a7, a8))
    {
      uint64_t v14 = "flushing cache pos";
      __int16 v15 = 235;
      goto LABEL_14;
    }
  }
  return v13;
}

uint64_t PagedFileReleaseAllIn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return PagedFileReleaseIn(a1, 0, *(void *)(a1 + 8), a4, a5, a6, a7, a8);
}

BOOL PagedFileHasNoIn(uint64_t a1)
{
  unint64_t v1 = *(unsigned int *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = 0;
    BOOL v3 = 0;
    do
    {
      if (*(_DWORD *)(*(void *)(a1 + 56) + 4 * v2) != -1 && *(void *)(*(void *)(a1 + 40) + 8 * v2)) {
        break;
      }
      BOOL v3 = ++v2 >= v1;
    }
    while (v1 != v2);
  }
  else
  {
    return 1;
  }
  return v3;
}

BOOL PagedFileHasAllOut(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    while (1)
    {
      if (*(_DWORD *)(*(void *)(a1 + 72) + 4 * v3) != -1)
      {
        uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8 * v3);
        v4 += v5;
        if (v3 < (v1 >> 12) && v5 != 4096) {
          break;
        }
      }
      if (v2 == ++v3) {
        return v4 == v1;
      }
    }
    return 0;
  }
  else
  {
    uint64_t v4 = 0;
    return v4 == v1;
  }
}

uint64_t PagedFileReadAndReleaseIn(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = (char *)a4;
  unint64_t v9 = a3;
  while (1)
  {
    unint64_t v12 = a2 >> 12;
    if (4096 - (a2 & 0xFFF) >= v9) {
      size_t v13 = v9;
    }
    else {
      size_t v13 = 4096 - (a2 & 0xFFF);
    }
    unsigned int v14 = *(_DWORD *)(a1 + 24);
    if (v14 <= v12)
    {
      uint64_t v31 = "invalid input PAGE";
      __int16 v32 = 252;
      goto LABEL_27;
    }
    uint64_t v15 = *(unsigned int *)(*(void *)(a1 + 48) + 4 * v12);
    if (v15 == -1)
    {
      uint64_t v31 = "input page is not stored";
      __int16 v32 = 254;
      goto LABEL_27;
    }
    uint64_t v16 = (a2 >> 12);
    if (v15 >= v14)
    {
      uint64_t v18 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t FreeCachePos = getFreeCachePos(a1, v15, a3, a4, a5, a6, a7, a8);
      if (FreeCachePos == -1)
      {
        uint64_t v31 = "could not get a free pos from cache";
        __int16 v32 = 261;
        goto LABEL_27;
      }
      uint64_t v18 = FreeCachePos;
      LODWORD(v15) = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v16);
      unsigned int v14 = *(_DWORD *)(a1 + 24);
    }
    if (v15 < v14) {
      break;
    }
LABEL_15:
    BOOL v19 = v15 >= v14;
    unsigned int v20 = v15 - v14;
    if (!v19 || v15 >= *(_DWORD *)(a1 + 32))
    {
      uint64_t v31 = "could not move input page in cache";
      __int16 v32 = 273;
      goto LABEL_27;
    }
    int v21 = *(_DWORD *)(a1 + 104);
    *(_DWORD *)(a1 + 104) = v21 + 1;
    *(_DWORD *)(*(void *)(a1 + 96) + 4 * v20) = v21;
    uint64_t v22 = cacheData(a1, v15, v18, a4, a5, a6, a7, a8);
    if (!v22) {
      goto LABEL_28;
    }
    memcpy(v8, (const void *)(v22 + (a2 & 0xFFF)), v13);
    PagedFileReleaseIn(a1, a2, v13, v25, v26, v27, v28, v29);
    a2 += v13;
    v8 += v13;
    v9 -= v13;
    if (!v9) {
      return 0;
    }
  }
  if (!movePage(a1, v15, v18, a4, a5, a6, a7, a8))
  {
    LODWORD(v15) = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v16);
    unsigned int v14 = *(_DWORD *)(a1 + 24);
    goto LABEL_15;
  }
  uint64_t v31 = "moving page from disk to cache";
  __int16 v32 = 268;
LABEL_27:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"inputPageData", v32, 21, 0, v31, a7, a8, v33);
LABEL_28:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileReadAndReleaseIn", 615, 21, 0, "unable to load input page", v23, v24, v33);
  return 0xFFFFFFFFLL;
}

uint64_t PagedFileRetainAndWriteOut(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = (char *)a4;
  unint64_t v9 = a3;
  while (1)
  {
    if (4096 - (a2 & 0xFFF) >= v9) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 4096 - (a2 & 0xFFF);
    }
    if (PagedFileRetainOut(a1, a2, v12, a4, a5, a6, a7, a8))
    {
      uint64_t v31 = "retain output chunk";
      __int16 v32 = 639;
      goto LABEL_31;
    }
    unsigned int v19 = *(_DWORD *)(a1 + 24);
    if (v19 <= (a2 >> 12))
    {
      uint64_t v29 = "invalid output PAGE";
      __int16 v30 = 286;
      goto LABEL_29;
    }
    uint64_t v20 = *(unsigned int *)(*(void *)(a1 + 64) + 4 * (a2 >> 12));
    if (v20 == -1)
    {
      uint64_t v29 = "output page is not stored";
      __int16 v30 = 288;
      goto LABEL_29;
    }
    uint64_t v21 = (a2 >> 12);
    if (v20 >= v19)
    {
      uint64_t v23 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t FreeCachePos = getFreeCachePos(a1, v20, v13, v14, v15, v16, v17, v18);
      if (FreeCachePos == -1)
      {
        uint64_t v29 = "could not get a free pos from cache";
        __int16 v30 = 294;
        goto LABEL_29;
      }
      uint64_t v23 = FreeCachePos;
      LODWORD(v20) = *(_DWORD *)(*(void *)(a1 + 64) + 4 * v21);
      unsigned int v19 = *(_DWORD *)(a1 + 24);
    }
    if (v20 < v19) {
      break;
    }
LABEL_16:
    BOOL v24 = v20 >= v19;
    unsigned int v25 = v20 - v19;
    if (!v24 || v20 >= *(_DWORD *)(a1 + 32))
    {
      uint64_t v29 = "could not move output page in cache";
      __int16 v30 = 305;
      goto LABEL_29;
    }
    int v26 = *(_DWORD *)(a1 + 104);
    *(_DWORD *)(a1 + 104) = v26 + 1;
    *(_DWORD *)(*(void *)(a1 + 96) + 4 * v25) = v26;
    uint64_t v27 = cacheData(a1, v20, v23, v14, v15, v16, v17, v18);
    if (!v27) {
      goto LABEL_30;
    }
    memcpy((void *)(v27 + (a2 & 0xFFF)), v8, v12);
    a2 += v12;
    v8 += v12;
    v9 -= v12;
    if (!v9) {
      return 0;
    }
  }
  if (!movePage(a1, v20, v23, v14, v15, v16, v17, v18))
  {
    LODWORD(v20) = *(_DWORD *)(*(void *)(a1 + 64) + 4 * v21);
    unsigned int v19 = *(_DWORD *)(a1 + 24);
    goto LABEL_16;
  }
  uint64_t v29 = "moving page from disk to cache";
  __int16 v30 = 301;
LABEL_29:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"outputPageData", v30, 21, 0, v29, v17, v18, v33);
LABEL_30:
  uint64_t v31 = "unable to load output page";
  __int16 v32 = 643;
LABEL_31:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileRetainAndWriteOut", v32, 21, 0, v31, v17, v18, v33);
  return 0xFFFFFFFFLL;
}

uint64_t storeCachePos(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 24);
  if (v8 > a2 || *(_DWORD *)(a1 + 32) <= a2)
  {
    uint64_t v18 = "invalid cache POS";
    __int16 v19 = 165;
    goto LABEL_9;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(v11 + 8 * a2);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(unsigned int *)(v13 + 4 * a2);
  if (v14 == -1)
  {
    uint64_t v20 = *(unsigned int *)(*(void *)(a1 + 72) + 4 * a2);
    if (v20 != -1)
    {
      if (*(void *)(v11 + 8 * v20))
      {
        int v21 = -(int)v8;
        uint64_t v22 = v8 - 1;
        do
        {
          if (v22 == -1) {
            goto LABEL_18;
          }
          uint64_t v23 = *(void *)(v11 + 8 * v22);
          ++v21;
          --v22;
        }
        while (v23);
        if (v21 == 1)
        {
LABEL_18:
          uint64_t v18 = "no free pages in file";
          __int16 v19 = 208;
          goto LABEL_9;
        }
        uint64_t v28 = -v21;
        if (*(int *)(a1 + 128) >= 3) {
          fwrite("PagedFile: vacating file pos\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
        }
        if (movePage(a1, v20, v28, a4, a5, a6, a7, a8))
        {
          uint64_t v18 = "vacating page in file";
          __int16 v19 = 210;
          goto LABEL_9;
        }
      }
      if (*(int *)(a1 + 128) >= 3) {
        fwrite("PagedFile: storing cached output page to file\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      }
      uint64_t result = movePage(a1, a2, v20, a4, a5, a6, a7, a8);
      if (result)
      {
        uint64_t v18 = "moving output page from cache to disk";
        __int16 v19 = 213;
        goto LABEL_9;
      }
      return result;
    }
    uint64_t v18 = "nRefs inconsistency";
    __int16 v19 = 215;
LABEL_9:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"storeCachePos", v19, 21, 0, v18, a7, a8, v29);
    return 0xFFFFFFFFLL;
  }
  uint64_t v15 = *(unsigned int *)(*(void *)(a1 + 112) + 4 * v14);
  if (v15 == -1)
  {
    uint64_t v18 = "cached input page does not have a file position";
    __int16 v19 = 175;
    goto LABEL_9;
  }
  if (*(_DWORD *)(*(void *)(a1 + 120) + 4 * v15) == v14)
  {
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 + 48) + 4 * v14) = v15;
    *(void *)(v11 + 8 * v15) = v12;
    *(_DWORD *)(v13 + 4 * v15) = v14;
    uint64_t v17 = *(void *)(a1 + 72);
    *(_DWORD *)(v17 + 4 * v15) = -1;
    *(void *)(v11 + 8 * a2) = 0;
    *(_DWORD *)(v13 + 4 * a2) = -1;
    *(_DWORD *)(v17 + 4 * a2) = -1;
    return result;
  }
  int v24 = -(int)v8;
  uint64_t v25 = v8 - 1;
  do
  {
    if (v25 == -1) {
      goto LABEL_24;
    }
    uint64_t v26 = *(void *)(v11 + 8 * v25);
    ++v24;
    --v25;
  }
  while (v26);
  if (v24 == 1)
  {
LABEL_24:
    uint64_t v18 = "no free pages in file";
    __int16 v19 = 196;
    goto LABEL_9;
  }
  uint64_t v27 = -v24;
  if (*(int *)(a1 + 128) >= 3) {
    fwrite("PagedFile: storing cached input page to file\n", 0x2DuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  uint64_t result = movePage(a1, a2, v27, a4, a5, a6, a7, a8);
  if (result)
  {
    uint64_t v18 = "moving input page from cache to disk";
    __int16 v19 = 198;
    goto LABEL_9;
  }
  return result;
}

uint64_t movePage(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *(_DWORD *)(a1 + 32);
  if (v8 <= a2 || v8 <= a3)
  {
    uint64_t v10 = "invalid SRC/DST";
    __int16 v11 = 77;
LABEL_10:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"movePage", v11, 21, 0, v10, a7, a8, v39);
    return 0xFFFFFFFFLL;
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (!*(void *)(v14 + 8 * a2))
  {
    uint64_t v10 = "SRC is empty";
    __int16 v11 = 78;
    goto LABEL_10;
  }
  unsigned int v15 = a3;
  if (*(void *)(v14 + 8 * a3))
  {
    uint64_t v10 = "DST is not empty";
    __int16 v11 = 79;
    goto LABEL_10;
  }
  unsigned int v17 = *(_DWORD *)(a1 + 24);
  if (v17 > a2 && v17 > a3)
  {
    uint64_t v22 = *(unsigned int *)(*(void *)(a1 + 56) + 4 * a2);
    if (v22 != -1) {
      *(_DWORD *)(*(void *)(a1 + 112) + 4 * v22) = a3;
    }
    *(_DWORD *)(*(void *)(a1 + 120) + 4 * a3) = v22;
    if (*(int *)(a1 + 128) >= 3) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "PagedFile: moving page from file[%u] to file[%u]\n", a2, a3);
    }
    if (pread(*(_DWORD *)a1, *(void **)(a1 + 80), 0x1000uLL, a2 << 12) != 4096)
    {
      uint64_t v10 = "reading page";
      __int16 v11 = 93;
      goto LABEL_10;
    }
    if (pwrite(*(_DWORD *)a1, *(const void **)(a1 + 80), 0x1000uLL, v15 << 12) != 4096)
    {
      uint64_t v10 = "writing page";
      __int16 v11 = 94;
      goto LABEL_10;
    }
    *(int64x2_t *)(a1 + 136) = vaddq_s64(*(int64x2_t *)(a1 + 136), vdupq_n_s64(0x1000uLL));
  }
  else if (v17 > a2 || v17 <= a3)
  {
    if (v17 <= a2 || v17 > a3)
    {
      if (*(int *)(a1 + 128) >= 3) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "PagedFile: moving page from cache[%u] to cache[%u]\n", a2, a3);
      }
      uint64_t v26 = (void *)cacheData(a1, v15, a3, a4, a5, a6, a7, a8);
      char v33 = (const void *)cacheData(a1, a2, v27, v28, v29, v30, v31, v32);
      memcpy(v26, v33, 0x1000uLL);
    }
    else
    {
      uint64_t v23 = *(unsigned int *)(*(void *)(a1 + 56) + 4 * a2);
      if (v23 != -1) {
        *(_DWORD *)(*(void *)(a1 + 112) + 4 * v23) = a2;
      }
      *(_DWORD *)(*(void *)(a1 + 120) + 4 * a2) = v23;
      if (*(int *)(a1 + 128) >= 3) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "PagedFile: moving page from file[%u] to cache[%u]\n", a2, a3);
      }
      int v24 = *(_DWORD *)a1;
      uint64_t v25 = (void *)cacheData(a1, v15, a3, a4, a5, a6, a7, a8);
      if (pread(v24, v25, 0x1000uLL, a2 << 12) != 4096)
      {
        uint64_t v10 = "reading page";
        __int16 v11 = 121;
        goto LABEL_10;
      }
      *(void *)(a1 + 136) += 4096;
    }
  }
  else
  {
    uint64_t v19 = *(unsigned int *)(*(void *)(a1 + 56) + 4 * a2);
    if (v19 != -1) {
      *(_DWORD *)(*(void *)(a1 + 112) + 4 * v19) = a3;
    }
    *(_DWORD *)(*(void *)(a1 + 120) + 4 * a3) = v19;
    if (*(int *)(a1 + 128) >= 3) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "PagedFile: moving page from cache[%u] to file[%u]\n", a2, a3);
    }
    int v20 = *(_DWORD *)a1;
    int v21 = (const void *)cacheData(a1, a2, a3, a4, a5, a6, a7, a8);
    if (pwrite(v20, v21, 0x1000uLL, v15 << 12) != 4096)
    {
      uint64_t v10 = "writing page";
      __int16 v11 = 108;
      goto LABEL_10;
    }
    *(void *)(a1 + 144) += 4096;
  }
  uint64_t v34 = *(void *)(a1 + 40);
  *(void *)(v34 + 8 * v15) = *(void *)(v34 + 8 * a2);
  *(void *)(v34 + 8 * a2) = 0;
  uint64_t v35 = *(void *)(a1 + 56);
  uint64_t v36 = *(unsigned int *)(v35 + 4 * a2);
  *(_DWORD *)(v35 + 4 * v15) = v36;
  *(_DWORD *)(v35 + 4 * a2) = -1;
  if (v36 != -1) {
    *(_DWORD *)(*(void *)(a1 + 48) + 4 * v36) = v15;
  }
  uint64_t v37 = *(void *)(a1 + 72);
  uint64_t v38 = *(unsigned int *)(v37 + 4 * a2);
  *(_DWORD *)(v37 + 4 * v15) = v38;
  *(_DWORD *)(v37 + 4 * a2) = -1;
  uint64_t result = 0;
  if (v38 != -1) {
    *(_DWORD *)(*(void *)(a1 + 64) + 4 * v38) = v15;
  }
  return result;
}

uint64_t cacheData(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *(_DWORD *)(a1 + 24);
  BOOL v9 = a2 >= v8;
  unsigned int v10 = a2 - v8;
  if (v9 && *(_DWORD *)(a1 + 32) > a2) {
    return *(void *)(a1 + 88) + (v10 << 12);
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"cacheData", 66, 21, 0, "invalid cache pos", a7, a8, vars0);
  return 0;
}

size_t AAPathFilterApply_cold_1(int a1, const regex_t *a2)
{
  char v2 = a1;
  OUTLINED_FUNCTION_0(a1, a2, *MEMORY[0x263EF8340], v6, v7, v8, v9, v10, v11, v12, v13, v14);
  return pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathFilter.c", (uint64_t)"prepareFilter", 130, 130, 0, "compile regex (err=%i, msg=%s)", v3, v4, v2);
}

size_t AAPathFilterApply_cold_2(int a1, const regex_t *a2)
{
  char v2 = a1;
  OUTLINED_FUNCTION_0(a1, a2, *MEMORY[0x263EF8340], v6, v7, v8, v9, v10, v11, v12, v13, v14);
  return pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathFilter.c", (uint64_t)"prepareFilter", 119, 130, 0, "compile regex (err=%i, msg=%s)", v3, v4, v2);
}

void pc_log_error_cold_1(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_214A7B000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[0x%08x] %s", (uint8_t *)v2, 0x12u);
}

int BZ2_bzDecompress(bz_stream *strm)
{
  return MEMORY[0x270F981C0](strm);
}

int BZ2_bzDecompressEnd(bz_stream *strm)
{
  return MEMORY[0x270F981C8](strm);
}

int BZ2_bzDecompressInit(bz_stream *strm, int verbosity, int small)
{
  return MEMORY[0x270F981D0](strm, *(void *)&verbosity, *(void *)&small);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x270ED7A80](bytes, count);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B50](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B58](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B60](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B70](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B78](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B80](c, data, *(void *)&len);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x270EE49C8](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x270EFD650](allocator, protection, flags, error);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

void _Block_release(const void *aBlock)
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

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x270ED7E48]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x270ED8488](flagset_d, *(void *)&flag);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x270ED84B8](acl_p, entry_p);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x270ED84C8](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x270ED84D8](acl, *(void *)&entry_id, entry_p);
}

acl_t acl_get_fd_np(int fd, acl_type_t type)
{
  return (acl_t)MEMORY[0x270ED84E8](*(void *)&fd, *(void *)&type);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x270ED84F8](flagset_d, *(void *)&flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x270ED8500](obj_p, flagset_p);
}

int acl_get_permset_mask_np(acl_entry_t entry_d, acl_permset_mask_t *mask_p)
{
  return MEMORY[0x270ED8520](entry_d, mask_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x270ED8528](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x270ED8530](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x270ED8538](*(void *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x270ED8540](*(void *)&fd, acl);
}

int acl_set_permset_mask_np(acl_entry_t entry_d, acl_permset_mask_t mask)
{
  return MEMORY[0x270ED8560](entry_d, mask);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x270ED8568](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x270ED8570](entry_d, *(void *)&tag_type);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x270ED8798](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

uint64_t ccaes_ctr_crypt_mode()
{
  return MEMORY[0x270ED87F0]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x270ED8A98]();
}

uint64_t ccec_generate_key()
{
  return MEMORY[0x270ED8AC0]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x270ED8AF0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x270ED8B00]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x270ED8B10]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x270ED8B18]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x270ED8B20]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x270ED8B38]();
}

uint64_t cchkdf()
{
  return MEMORY[0x270ED8BA8]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x270ED8BC8]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x270ED8BD0]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x270ED8BD8]();
}

uint64_t ccrng()
{
  return MEMORY[0x270ED8C90]();
}

uint64_t ccscrypt()
{
  return MEMORY[0x270ED8D50]();
}

uint64_t ccscrypt_storage_size()
{
  return MEMORY[0x270ED8D58]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

int chflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x270ED8EC0](a1, *(void *)&a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x270ED8F00](a1, a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x270F98F50](*(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F58](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x270F98F60](*(void *)&algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

uint64_t compression_stream_identify_algorithm()
{
  return MEMORY[0x270F98F70]();
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x270ED8F50](*(void *)&a1, a2, a3);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x270ED9898](*(void *)&a1, *(void *)&a2);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x270ED98A0](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED98B0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9948](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9970](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x270ED9990](*(void *)&fd, namebuff, size, *(void *)&options);
}

uint64_t fpathconf(int a1, int a2)
{
  return MEMORY[0x270ED9A00](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x270ED9A60](*(void *)&fd, name, *(void *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9AD0](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9AE0](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x270ED9AF8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x270ED9B80](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getgrgid_r(gid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x270ED9C20](*(void *)&a1, a2, a3, a4, a5);
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x270ED9C30](a1, a2, a3, a4, a5);
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D30](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D40](*(void *)&a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

int issetugid(void)
{
  return MEMORY[0x270ED9F18]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x270EDA010](a1, *(void *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA018](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270EDA020](a1, *(void *)&a2, *(void *)&a3);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x270EDA068](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

uint64_t lzma_code()
{
  return MEMORY[0x270F99BB0]();
}

uint64_t lzma_end()
{
  return MEMORY[0x270F99BD0]();
}

uint64_t lzma_stream_buffer_bound()
{
  return MEMORY[0x270F99C10]();
}

uint64_t lzma_stream_decoder()
{
  return MEMORY[0x270F99C20]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x270EDA3F8](*(void *)&gid, uu);
}

int mbr_sid_to_string(const nt_sid_t *sid, char *string)
{
  return MEMORY[0x270EDA408](sid, string);
}

int mbr_sid_to_uuid(const nt_sid_t *sid, uuid_t uu)
{
  return MEMORY[0x270EDA410](sid, uu);
}

int mbr_string_to_sid(const char *string, nt_sid_t *sid)
{
  return MEMORY[0x270EDA418](string, sid);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x270EDA420](*(void *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x270EDA428](uu, uid_or_gid, id_type);
}

int mbr_uuid_to_sid(const uuid_t uu, nt_sid_t *sid)
{
  return MEMORY[0x270EDA430](uu, sid);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x270EDA528](a1);
}

int mkfifo(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA538](a1, a2);
}

int mkostemp(char *path, int oflags)
{
  return MEMORY[0x270EDA548](path, *(void *)&oflags);
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x270EDA840](*(void *)&a1, a2, *(void *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pclose(FILE *a1)
{
  return MEMORY[0x270EDAC08](a1);
}

void perror(const char *a1)
{
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x270EDAC48](a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDAE18](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x270EDAE40](a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x270EDAEC8](__pthread, __qos_class, __relative_priority);
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

void pthread_yield_np(void)
{
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x270EDB130](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB150](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x270EDB1A8](a1, a2, *(void *)&a3);
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  return MEMORY[0x270EDB1B0](*(void *)&a1, a2, a3, a4);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x270EDB1B8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDB268](a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270EDB3C8](a1, a2, a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
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

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
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

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6E8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB770](a1, a2);
}

int symlinkat(const char *a1, int a2, const char *a3)
{
  return MEMORY[0x270EDB778](a1, *(void *)&a2, a3);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x270EDB7C8](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x270EDB9B0](*(void *)&a1, a2, *(void *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x270EDB9F8](a1, a2);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

void *__cdecl valloc(size_t a1)
{
  return (void *)MEMORY[0x270EDBA50](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}