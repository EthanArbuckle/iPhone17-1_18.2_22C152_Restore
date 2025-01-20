uint64_t sub_2099CE728(uint64_t a1)
{
  void **v1;

  v1 = *(void ***)(a1 + 88);
  free(v1[1]);
  free(v1[4]);
  free(v1);
  return 0;
}

uint64_t sub_2099CE764(uint64_t a1, uint64_t a2, size_t a3)
{
  size_t v3 = *(void *)(a2 + 24);
  if (v3 >= a3) {
    return 0;
  }
  do
  {
    if (v3 >= 0x8000) {
      v3 += 1024;
    }
    else {
      v3 *= 2;
    }
  }
  while (v3 < a3);
  v6 = malloc_type_malloc(v3, 0x81CF4FE4uLL);
  if (v6)
  {
    v12 = v6;
    size_t v13 = *(int *)(a2 + 16);
    if (v13) {
      memmove(v6, *(const void **)(a2 + 8), v13);
    }
    free(*(void **)(a2 + 8));
    uint64_t result = 0;
    *(void *)(a2 + 8) = v12;
    *(void *)(a2 + 24) = v3;
  }
  else
  {
    archive_set_error(*(_DWORD **)(a1 + 24), 12, "Can't allocate data for uudecode", v7, v8, v9, v10, v11, v15);
    return 4294967266;
  }
  return result;
}

uint64_t sub_2099CE818(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a2 - 33) >= 0xFFFFFFFFFFFFFFE0)
  {
    unsigned __int8 v2 = a2;
    *(_OWORD *)(a1 + 1704) = 0u;
    *(_OWORD *)(a1 + 1720) = 0u;
    *(_OWORD *)(a1 + 1672) = 0u;
    *(_OWORD *)(a1 + 1688) = 0u;
    *(_OWORD *)(a1 + 1640) = 0u;
    *(_OWORD *)(a1 + 1656) = 0u;
    *(_OWORD *)(a1 + 1608) = 0u;
    *(_OWORD *)(a1 + 1624) = 0u;
    *(_OWORD *)(a1 + 1576) = 0u;
    *(_OWORD *)(a1 + 1592) = 0u;
    *(_OWORD *)(a1 + 1544) = 0u;
    *(_OWORD *)(a1 + 1560) = 0u;
    *(_OWORD *)(a1 + 1512) = 0u;
    *(_OWORD *)(a1 + 1528) = 0u;
    *(_OWORD *)(a1 + 1480) = 0u;
    *(_OWORD *)(a1 + 1496) = 0u;
    *(_OWORD *)(a1 + 1448) = 0u;
    *(_OWORD *)(a1 + 1464) = 0u;
    *(_OWORD *)(a1 + 1416) = 0u;
    *(_OWORD *)(a1 + 1432) = 0u;
    *(_OWORD *)(a1 + 1384) = 0u;
    *(_OWORD *)(a1 + 1400) = 0u;
    *(_OWORD *)(a1 + 1352) = 0u;
    *(_OWORD *)(a1 + 1368) = 0u;
    *(_OWORD *)(a1 + 1320) = 0u;
    *(_OWORD *)(a1 + 1336) = 0u;
    *(_OWORD *)(a1 + 1288) = 0u;
    *(_OWORD *)(a1 + 1304) = 0u;
    *(_OWORD *)(a1 + 1256) = 0u;
    *(_OWORD *)(a1 + 1272) = 0u;
    *(_OWORD *)(a1 + 1224) = 0u;
    *(_OWORD *)(a1 + 1240) = 0u;
    *(void *)(a1 + 1736) = 0;
    *(void *)(a1 + 1744) = a2;
    unsigned __int8 v8 = a2;
    __int16 v9 = 2048;
    char v10 = 2;
    *(void *)uint64_t v11 = 0;
    *(_DWORD *)&v11[8] = 536936448;
    *(void *)&v11[12] = 0;
    uint64_t v12 = 0;
    if ((sub_20999FE14(a1 + 1088, &v8) & 0x80000000) == 0)
    {
      uint64_t v4 = 0;
      for (uint64_t i = a1; ; i += 136)
      {
        unsigned __int8 v8 = v2;
        __int16 v9 = 2048;
        char v10 = 2;
        *(_DWORD *)uint64_t v11 = 0;
        v11[4] = v4;
        *(_DWORD *)&v11[5] = 0;
        *(_WORD *)&v11[9] = 0;
        strcpy(&v11[11], " ");
        v11[13] = 0;
        *(_WORD *)&v11[14] = 0;
        *(_DWORD *)&v11[16] = 0;
        uint64_t v12 = 0;
        int v6 = sub_20999FE14(i, &v8);
        *(void *)(i + 120) = v11[11];
        if (v6 < 0) {
          break;
        }
        if (++v4 == 8)
        {
          uint64_t result = 0;
          *(unsigned char *)(a1 + 1216) = 1;
          *(unsigned char *)(a1 + 1080) = 1;
          return result;
        }
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_2099CE99C(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = __src;
  uint64_t v6 = *(void *)(a1 + 1736);
  if (v6)
  {
    uint64_t v7 = 512 - v6;
    unint64_t v8 = a3 - (512 - v6);
    if (a3 >= 512 - v6)
    {
      memcpy((void *)(a1 + 1224 + v6), __src, 512 - v6);
      uint64_t v9 = 0;
      uint64_t v10 = a1;
      do
      {
        sub_20999FE68(v10, (int *)(a1 + 1224 + v9), 0x40uLL);
        v9 += 64;
        v10 += 136;
      }
      while (v9 != 512);
      uint64_t v6 = 0;
      v4 += v7;
      unint64_t v3 = v8;
    }
  }
  for (uint64_t i = 0; i != 8; ++i)
  {
    if (v3 >= 0x200)
    {
      uint64_t v12 = (int *)&v4[64 * i];
      for (unint64_t j = v3; j > 0x1FF; j -= 512)
      {
        sub_20999FE68(a1 + 136 * i, v12, 0x40uLL);
        v12 += 128;
      }
    }
  }
  if ((v3 & 0x1FF) != 0) {
    memcpy((void *)(a1 + v6 + 1224), &v4[v3 & 0xFFFFFFFFFFFFFE00], v3 & 0x1FF);
  }
  *(void *)(a1 + 1736) = v6 + (v3 & 0x1FF);
  return 0;
}

uint64_t sub_2099CEAB8(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!a2 || *(void *)(a1 + 1744) > a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  unint64_t v8 = v14;
  uint64_t v9 = a1;
  do
  {
    unint64_t v10 = *(void *)(a1 + 1736);
    if (v10 > v7)
    {
      unint64_t v11 = v6 + v10;
      if (v11 >= 0x40) {
        unint64_t v12 = 64;
      }
      else {
        unint64_t v12 = v11;
      }
      sub_20999FE68(v9, (int *)(a1 + 1224 + v7), v12);
    }
    sub_2099A1488(v9, v8, 0x20uLL);
    v7 += 64;
    v8 += 32;
    v9 += 136;
    v6 -= 64;
  }
  while (v7 != 512);
  for (uint64_t i = 0; i != 256; i += 32)
    sub_20999FE68(a1 + 1088, (int *)&v14[i], 0x20uLL);
  return sub_2099A1488(a1 + 1088, a2, *(void *)(a1 + 1744));
}

uint64_t sub_2099CEBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(void **)(a1 + 2472);
  size_t __n = 0;
  size_t v10 = sub_2099738A4(a1, 0xCuLL, &__n, a4, a5, a6, a7, a8);
  size_t v16 = __n;
  if ((__n & 0x8000000000000000) != 0)
  {
LABEL_89:
    v99 = "Bad record header";
    goto LABEL_90;
  }
  v17 = (char *)v10;
  while (1)
  {
    if (!v17) {
      return 1;
    }
    uint64_t v18 = sub_2099CF3B0(v17, v16, "\r\n\r\n", 4);
    if (!v18) {
      goto LABEL_89;
    }
    uint64_t v19 = v18 - (void)v17 + 4;
    unsigned int v20 = sub_20997BA14((uint64_t)v17, v19);
    if (!v20) {
      break;
    }
    unsigned int v21 = v20;
    if (v20 - 10001 <= 0xFFFFDD9E)
    {
      unint64_t v103 = v20 / 0x2710uLL;
      v99 = "Unsupported record version: %u.%u";
      goto LABEL_90;
    }
    __endptr = 0;
    uint64_t v22 = sub_2099CF3B0(v17, v19, "\r\nContent-Length:", 17);
    if (!v22) {
      goto LABEL_91;
    }
    uint64_t v23 = v22;
    v24 = (const char *)(v22 + 17);
    v25 = &v17[v19];
    unint64_t v26 = sub_2099CF3B0((void *)(v22 + 17), (size_t)&v17[v19 - 17 - v22], "\r\n", 2);
    if (!v26) {
      goto LABEL_91;
    }
    v27 = (char *)v26;
    if ((unint64_t)v24 < v26)
    {
      uint64_t v28 = v26 - v23 - 17;
      while (1)
      {
        int v29 = *(unsigned __int8 *)v24;
        if (v29 != 32 && v29 != 9) {
          break;
        }
        ++v24;
        if (!--v28)
        {
          v24 = (const char *)v26;
          break;
        }
      }
    }
    if (*(unsigned __int8 *)v24 - 48 > 9
      || (*__error() = 0, uint64_t v31 = strtol(v24, &__endptr, 10), *__error())
      || __endptr != v27
      || v31 < 0)
    {
LABEL_91:
      v99 = "Bad content length";
LABEL_93:
      v100 = (_DWORD *)a1;
      int v101 = 22;
      goto LABEL_94;
    }
    __endptr = 0;
    uint64_t v32 = sub_2099CF3B0(v17, v19, "\r\nWARC-Date:", 12);
    if (!v32
      || (v33 = (unsigned __int8 *)(v32 + 12),
          (uint64_t v34 = sub_2099CF3B0((void *)(v32 + 12), (size_t)&v25[-v32 - 12], "\r\n", 2)) == 0)
      || (v35 = (char *)v34, time_t v36 = sub_2099CF518(v33, &__endptr), __endptr != v35)
      || (uint64_t v38 = v36, v36 == -1))
    {
      v99 = "Bad record time";
      goto LABEL_93;
    }
    *(_DWORD *)(a1 + 16) = 983040;
    if (v21 != *(_DWORD *)(v9 + 40))
    {
      sub_2099C7760((void **)(v9 + 48), "WARC/%u.%u", v37, v11, v12, v13, v14, v15, (char *)(v21 / 0x2710uLL));
      *(_DWORD *)(v9 + 40) = v21;
    }
    uint64_t v39 = sub_2099CF3B0(v17, v19, "\r\nWARC-Type:", 12);
    if (!v39) {
      goto LABEL_40;
    }
    uint64_t v46 = v39;
    v47 = (void *)(v39 + 12);
    unint64_t v48 = sub_2099CF3B0((void *)(v39 + 12), (size_t)&v25[-v39 - 12], "\r\n", 2);
    if (!v48) {
      goto LABEL_40;
    }
    if ((unint64_t)v47 < v48)
    {
      uint64_t v49 = v48 - v46 - 12;
      while (1)
      {
        int v50 = *(unsigned __int8 *)v47;
        if (v50 != 32 && v50 != 9) {
          break;
        }
        v47 = (void *)((char *)v47 + 1);
        if (!--v49)
        {
          v47 = (void *)v48;
          break;
        }
      }
    }
    if (v47 + 1 != (void *)v48 || *v47 != 0x656372756F736572 && *v47 != 0x65736E6F70736572)
    {
LABEL_40:
      *(void *)uint64_t v9 = v31;
      *(void *)(v9 + 8) = 0;
      sub_209973BDC(a1, v19, v40, v41, v42, v43, v44, v45);
      goto LABEL_41;
    }
    *(void *)uint64_t v9 = v31;
    *(void *)(v9 + 8) = 0;
    uint64_t v64 = sub_2099CF3B0(v17, v19, "\r\nWARC-Target-URI:", 18);
    if (!v64
      || (uint64_t v71 = v64,
          v72 = (unsigned __int8 *)(v64 + 18),
          (unint64_t v73 = sub_2099CF3B0((void *)(v64 + 18), (size_t)&v25[-v64 - 18], "\r\n", 2)) == 0))
    {
LABEL_64:
      v84 = 0;
      uint64_t v85 = 0;
      char v86 = 1;
      goto LABEL_79;
    }
    if ((unint64_t)v72 < v73)
    {
      uint64_t v74 = v73 - v71 - 18;
      while (1)
      {
        int v75 = *v72;
        if (v75 != 32 && v75 != 9) {
          break;
        }
        ++v72;
        if (!--v74)
        {
          v72 = (unsigned __int8 *)v73;
          break;
        }
      }
    }
    unint64_t v77 = v73 - (void)v72;
    unint64_t v78 = v73;
    uint64_t v79 = sub_2099CF3B0(v72, v73 - (void)v72, "://", 3);
    if (!v79) {
      goto LABEL_78;
    }
    unint64_t v80 = v78;
    v81 = (char *)v72;
    unint64_t v104 = v80;
    unint64_t v105 = v79;
    if ((unint64_t)v72 < v80)
    {
      while (1)
      {
        uint64_t v82 = *v81;
        if (*v81 < 0 ? __maskrune(v82, 0x4000uLL) : *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v82 + 60) & 0x4000) {
          break;
        }
        ++v81;
        if (!--v77) {
          goto LABEL_63;
        }
      }
LABEL_78:
      v84 = 0;
      uint64_t v85 = 0;
      char v86 = 1;
      goto LABEL_79;
    }
LABEL_63:
    if (v105 < (unint64_t)(v72 + 3)) {
      goto LABEL_64;
    }
    v87 = (unsigned __int8 *)(v105 + 3);
    if (*(_DWORD *)v72 == 1701603686)
    {
      v88 = (unsigned __int8 *)v104;
    }
    else
    {
      v88 = (unsigned __int8 *)v104;
      if (*(_DWORD *)v72 != 1886680168 && (*(_WORD *)v72 != 29798 || v72[2] != 112)) {
        goto LABEL_64;
      }
      do
      {
        if ((unint64_t)v87 >= v104) {
          break;
        }
        int v90 = *v87++;
      }
      while (v90 != 47);
    }
    size_t v91 = v88 - v87;
    if (v88 == v87 || *(v88 - 1) == 47) {
      goto LABEL_78;
    }
    v92 = *(void **)(v9 + 32);
    if (v91 + 1 > *(void *)(v9 + 24))
    {
      size_t v93 = (v91 & 0xFFFFFFFFFFFFFFC0) + 64;
      *(void *)(v9 + 24) = v93;
      v92 = malloc_type_realloc(v92, v93, 0x5BA46B2AuLL);
      *(void *)(v9 + 32) = v92;
    }
    memcpy(v92, v87, v91);
    *(unsigned char *)(*(void *)(v9 + 32) + v91) = 0;
    v84 = *(char **)(v9 + 32);
    __endptr = 0;
    uint64_t v94 = sub_2099CF3B0(v17, v19, "\r\nLast-Modified:", 16);
    if (v94
      && (v95 = (unsigned __int8 *)(v94 + 16),
          (uint64_t v96 = sub_2099CF3B0((void *)(v94 + 16), (size_t)&v25[-v94 - 16], "\r\n", 2)) != 0)
      && (v97 = (char *)v96, time_t v98 = sub_2099CF518(v95, &__endptr), __endptr == v97)
      && (uint64_t v85 = v98, v98 != -1))
    {
      char v86 = 0;
    }
    else
    {
      char v86 = 0;
      uint64_t v85 = v38;
    }
LABEL_79:
    sub_209973BDC(a1, v19, v65, v66, v67, v68, v69, v70);
    if ((v86 & 1) == 0)
    {
      archive_entry_set_filetype(a2, 0x8000);
      archive_entry_copy_pathname(a2, v84);
      archive_entry_set_size(a2, v31);
      archive_entry_set_perm(a2, 420);
      archive_entry_set_ctime(a2, v38, 0);
      archive_entry_set_mtime(a2, v85, 0);
      return 0;
    }
LABEL_41:
    v58 = **(void ***)(a1 + 2472);
    sub_209973BDC(a1, *v58 + 4, v52, v53, v54, v55, v56, v57);
    void *v58 = 0;
    v58[1] = 0;
    v17 = (char *)sub_2099738A4(a1, 0xCuLL, &__n, v59, v60, v61, v62, v63);
    size_t v16 = __n;
    if ((__n & 0x8000000000000000) != 0) {
      goto LABEL_89;
    }
  }
  v99 = "Invalid record version";
LABEL_90:
  v100 = (_DWORD *)a1;
  int v101 = -1;
LABEL_94:
  archive_set_error(v100, v101, v99, v11, v12, v13, v14, v15, (char *)v103);
  return 4294967266;
}

uint64_t sub_2099CF294(uint64_t a1, size_t *a2, unint64_t *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = **(void ***)(a1 + 2472);
  unint64_t v18 = 0;
  if (v11[1] >= *v11) {
    goto LABEL_9;
  }
  uint64_t v13 = v11[2];
  if (v13)
  {
    sub_209973BDC(a1, v13, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
    v11[2] = 0;
  }
  size_t v14 = sub_2099738A4(a1, 1uLL, &v18, (uint64_t)a4, a5, a6, a7, a8);
  uint64_t result = v18;
  if ((v18 & 0x8000000000000000) != 0)
  {
    *a3 = 0;
    return result;
  }
  if (!v18)
  {
LABEL_9:
    *a2 = 0;
    *a3 = 0;
    *a4 = v11[1] + 4;
    v11[2] = 0;
    return 1;
  }
  uint64_t v16 = v11[1];
  unint64_t v17 = *v11 - v16;
  if (v18 < v17) {
    unint64_t v17 = v18;
  }
  *a4 = v16;
  *a3 = v17;
  *a2 = v14;
  v11[1] += v17;
  v11[2] = v17;
  return 0;
}

uint64_t sub_2099CF378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = **(void ***)(a1 + 2472);
  sub_209973BDC(a1, *v8 + 4, a3, a4, a5, a6, a7, a8);
  *unint64_t v8 = 0;
  v8[1] = 0;
  return 0;
}

uint64_t sub_2099CF3B0(void *a1, size_t __n, char *a3, uint64_t a4)
{
  uint64_t result = (uint64_t)memchr(a1, *a3, __n);
  if (result)
  {
    uint64_t v9 = result;
    unint64_t v10 = (unint64_t)a1 + __n;
    uint64_t v11 = (char *)(result + 1);
    if (result + 1 >= (unint64_t)a1 + __n || a4 < 2)
    {
      if (a4 > 1) {
        return 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
      size_t v14 = &a3[a4];
      int v15 = *(char *)result;
      LOBYTE(v16) = 1;
      int v17 = v15;
      do
      {
        int v18 = *(unsigned __int8 *)(result + v13 + 1);
        v17 ^= (char)v18;
        int v19 = a3[v13 + 1];
        v15 ^= (char)v19;
        int v16 = v16 & (v18 == v19);
        unint64_t v20 = (unint64_t)&a3[v13 + 2];
        unint64_t v21 = result + v13++ + 2;
      }
      while (v21 < v10 && v20 < (unint64_t)v14);
      if (v20 < (unint64_t)v14) {
        return 0;
      }
      if (!v16)
      {
        if (v21 >= v10) {
          return 0;
        }
        uint64_t v22 = 0;
        size_t v23 = (size_t)a1 + __n + ~result - v13;
        size_t v24 = a4 - 1;
        while (1)
        {
          v17 ^= *(v11 - 1) ^ *(char *)(v9 + v22 + v13 + 1);
          if (v17 == v15 && !memcmp(v11, a3, v24)) {
            break;
          }
          uint64_t result = 0;
          ++v11;
          ++v22;
          if (!--v23) {
            return result;
          }
        }
        return (uint64_t)v11;
      }
    }
  }
  return result;
}

time_t sub_2099CF518(unsigned __int8 *a1, void *a2)
{
  memset(&v35, 0, sizeof(v35));
  while (1)
  {
    int v3 = *a1;
    if (v3 != 9 && v3 != 32) {
      break;
    }
    ++a1;
  }
  if ((v3 - 48) > 9)
  {
    int v8 = 0;
    unint64_t v7 = a1;
  }
  else
  {
    int v4 = 0;
    v5 = a1 + 1;
    int v6 = 4095;
    do
    {
      unint64_t v7 = v5;
      int v8 = v4 + v3 - 48;
      if (v8 > 409 || (v6 - 10) >= 0xFFFFFFED) {
        break;
      }
      v6 /= 10;
      int v4 = 10 * v8;
      ++v5;
      int v3 = *v7;
    }
    while ((v3 - 48) <= 9);
  }
  if ((v8 - 4096) >= 0xFFFFF62F) {
    int v10 = v8;
  }
  else {
    int v10 = -2;
  }
  if (a1 == v7) {
    int v10 = -1;
  }
  time_t v36 = v7;
  v35.tm_year = v10;
  if (v10 < 0) {
    goto LABEL_30;
  }
  uint64_t v11 = v7 + 1;
  time_t v36 = v7 + 1;
  if (*v7 != 45) {
    goto LABEL_30;
  }
  int v12 = *v11;
  if ((v12 - 48) > 9) {
    goto LABEL_29;
  }
  int v13 = 0;
  size_t v14 = v7 + 2;
  unsigned int v15 = 12;
  do
  {
    uint64_t v11 = v14;
    int v16 = v13 + v12 - 48;
    if (v16 > 1 || v15 - 10 >= 0xFFFFFFED) {
      break;
    }
    v15 /= 0xAu;
    int v13 = 10 * v16;
    ++v14;
    int v12 = *v11;
  }
  while ((v12 - 48) <= 9);
  if ((v16 - 13) <= 0xFFFFFFF3) {
    goto LABEL_29;
  }
  v35.tm_mon = v16;
  int v19 = v11 + 1;
  time_t v36 = v11 + 1;
  if (*v11 != 45) {
    goto LABEL_30;
  }
  int v20 = *v19;
  if ((v20 - 48) > 9) {
    goto LABEL_42;
  }
  int v21 = 0;
  uint64_t v22 = v11 + 2;
  unsigned int v23 = 31;
  do
  {
    int v19 = v22;
    int v24 = v21 + v20 - 48;
    if (v24 > 3 || v23 - 10 >= 0xFFFFFFED) {
      break;
    }
    v23 /= 0xAu;
    int v21 = 10 * v24;
    ++v22;
    int v20 = *v19;
  }
  while ((v20 - 48) <= 9);
  if ((v24 - 32) <= 0xFFFFFFE0)
  {
LABEL_42:
    time_t v36 = v19;
    goto LABEL_30;
  }
  v35.tm_mday = v24;
  uint64_t v11 = v19 + 1;
  time_t v36 = v19 + 1;
  if (*v19 != 84) {
    goto LABEL_30;
  }
  int v26 = *v11;
  if ((v26 - 48) > 9) {
    goto LABEL_29;
  }
  int v27 = 0;
  uint64_t v28 = v19 + 2;
  unsigned int v29 = 23;
  do
  {
    uint64_t v11 = v28;
    int v30 = v27 + v26 - 48;
    if (v30 > 2 || v29 - 10 >= 0xFFFFFFED) {
      break;
    }
    v29 /= 0xAu;
    int v27 = 10 * v30;
    ++v28;
    int v26 = *v11;
  }
  while ((v26 - 48) <= 9);
  if (v30 >= 0x18)
  {
LABEL_29:
    time_t v36 = v11;
    goto LABEL_30;
  }
  v35.tm_hour = v30;
  time_t v36 = v11 + 1;
  if (*v11 != 58
    || (v35.tm_min = sub_2099CF844(v11 + 1, &v36, 0, 59), v35.tm_min < 0)
    || (v33 = *v36, uint64_t v32 = v36 + 1, ++v36, v33 != 58)
    || (v35.tm_sec = sub_2099CF844(v32, &v36, 0, 60), v35.tm_sec < 0)
    || (int v34 = *v36, ++v36, v34 != 90))
  {
LABEL_30:
    time_t result = -1;
    if (!a2) {
      return result;
    }
    goto LABEL_31;
  }
  *(int32x2_t *)&v35.tm_mon = vadd_s32(*(int32x2_t *)&v35.tm_mon, (int32x2_t)0xFFFFF894FFFFFFFFLL);
  time_t result = timegm(&v35);
  if (!a2) {
    return result;
  }
LABEL_31:
  *a2 = v36;
  return result;
}

uint64_t sub_2099CF844(unsigned __int8 *a1, unsigned __int8 **a2, int a3, int a4)
{
  if (a4 < 1 || (int v4 = *a1, (v4 - 48) > 9))
  {
    int v9 = 0;
    int v8 = a1;
  }
  else
  {
    int v5 = 0;
    int v6 = a1 + 1;
    int v7 = a4;
    do
    {
      int v8 = v6;
      int v9 = v5 + v4 - 48;
      int v5 = 10 * v9;
      if (10 * v9 > a4 || (v7 - 10) >= 0xFFFFFFED) {
        break;
      }
      v7 /= 10;
      ++v6;
      int v4 = *v8;
    }
    while ((v4 - 48) <= 9);
  }
  if (v9 > a4 || v9 < a3) {
    int v9 = -2;
  }
  if (v8 == a1) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = v9;
  }
  *a2 = v8;
  return result;
}

uint64_t archive_version_details()
{
  v0 = (char *)BZ2_bzlibVersion();
  qword_2675F7390 = 0;
  unk_2675F7398 = 0;
  qword_2675F7388 = 0;
  sub_2099C4040(&qword_2675F7388, "libarchive 3.5.3");
  sub_2099C4040(&qword_2675F7388, " zlib/");
  sub_2099C4040(&qword_2675F7388, "1.2.12");
  sub_2099C4040(&qword_2675F7388, " liblzma/");
  sub_2099C4040(&qword_2675F7388, "5.4.3");
  if (v0)
  {
    v1 = strchr(v0, 44);
    if (!v1) {
      v1 = &v0[strlen(v0)];
    }
    sub_2099C4040(&qword_2675F7388, " bz2lib/");
    sub_209974714(&qword_2675F7388, v0, v1 - v0);
  }
  return qword_2675F7388;
}

const char *archive_zlib_version()
{
  return "1.2.12";
}

const char *archive_liblzma_version()
{
  return "5.4.3";
}

uint64_t archive_liblz4_version()
{
  return 0;
}

uint64_t archive_libzstd_version()
{
  return 0;
}

uint64_t archive_write_set_format_cpio_newc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 1, "archive_write_set_format_cpio_newc", a5, a6, a7, a8);
  if (result != -30)
  {
    int v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = malloc_type_calloc(1uLL, 0x28uLL, 0x1020040FC537BA2uLL);
    if (v11)
    {
      int v17 = v11;
      uint64_t result = 0;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 272) = "cpio";
      *(void *)(a1 + 288) = sub_2099CFB0C;
      *(void *)(a1 + 304) = sub_2099CFBB4;
      *(void *)(a1 + 312) = sub_2099CFCC4;
      *(void *)(a1 + 296) = sub_2099CFD10;
      *(void *)(a1 + 320) = sub_2099CFD24;
      *(void *)(a1 + 328) = sub_2099CFD8C;
      *(_DWORD *)(a1 + 16) = 65540;
      *(void *)(a1 + 24) = "SVR4 cpio nocrc";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate cpio data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t sub_2099CFB0C(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = *(void *)(a1 + 264);
  if (strcmp(__s1, "hdrcharset")) {
    return 4294967276;
  }
  if (a3 && *a3)
  {
    uint64_t v12 = sub_2099C4288(a1, a3, 0);
    *(void *)(v5 + 16) = v12;
    if (v12) {
      return 0;
    }
    else {
      return 4294967266;
    }
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, *(char **)(a1 + 272));
    return 4294967271;
  }
}

uint64_t sub_2099CFBB4(_DWORD *a1, uint64_t *a2)
{
  if (archive_entry_filetype((uint64_t)a2) || archive_entry_hardlink((uint64_t)a2))
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v9 = sub_2099CFDBC((uint64_t)a1);
    if (sub_20997DF08(a2, &v13, &v12, v9) && *__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Pathname", v4, v5, v6, v7, v8, v12);
      return 4294967266;
    }
    if (v12 && v13 && *v13)
    {
      if (archive_entry_hardlink((uint64_t)a2)
        || archive_entry_size_is_set((uint64_t)a2)
        && (archive_entry_size((uint64_t)a2) & 0x8000000000000000) == 0)
      {
        return sub_2099CFE0C((uint64_t)a1, a2);
      }
      uint64_t v11 = "Size required";
    }
    else
    {
      uint64_t v11 = "Pathname required";
    }
  }
  else
  {
    uint64_t v11 = "Filetype required";
  }
  archive_set_error(a1, -1, v11, v4, v5, v6, v7, v8, v12);
  return 4294967271;
}

uint64_t sub_2099CFCC4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = *v3;
  }
  LODWORD(result) = sub_2099C9728(a1, a2, v4);
  *v3 -= v4;
  if ((int)result >= 0) {
    return v4;
  }
  else {
    return (int)result;
  }
}

uint64_t sub_2099CFD10(uint64_t a1)
{
  return sub_2099C978C((void *)a1, **(void **)(a1 + 264) + *(int *)(*(void *)(a1 + 264) + 8));
}

uint64_t sub_2099CFD24(uint64_t a1)
{
  unsigned __int8 v2 = (uint64_t *)archive_entry_new();
  archive_entry_set_nlink((uint64_t)v2, 1);
  archive_entry_set_size((uint64_t)v2, 0);
  archive_entry_set_pathname((uint64_t)v2, "TRAILER!!!");
  uint64_t v3 = sub_2099CFE0C(a1, v2);
  archive_entry_free((void **)v2);
  return v3;
}

uint64_t sub_2099CFD8C(uint64_t a1)
{
  *(void *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_2099CFDBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 264);
  uint64_t result = *(void *)(v1 + 16);
  if (!result)
  {
    if (*(_DWORD *)(v1 + 32))
    {
      return *(void *)(v1 + 24);
    }
    else
    {
      uint64_t result = sub_209976040();
      *(void *)(v1 + 24) = result;
      *(_DWORD *)(v1 + 32) = 1;
    }
  }
  return result;
}

uint64_t sub_2099CFE0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v59 = 0;
  __s = 0;
  uint64_t v58 = 0;
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = sub_2099CFDBC(a1);
  if (sub_20997DF08(a2, &v59, &v58, v5))
  {
    if (*__error() == 12)
    {
      uint64_t v11 = "Can't allocate memory for Pathname";
LABEL_37:
      archive_set_error((_DWORD *)a1, 12, v11, v6, v7, v8, v9, v10, v57);
LABEL_50:
      uint64_t v52 = 4294967266;
      goto LABEL_51;
    }
    uint64_t v13 = (char *)archive_entry_pathname(a2);
    sub_2099C42E4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v14, v15, v16, v17, v18, v13);
    uint64_t v12 = 4294967276;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v19 = v58;
  memset(v61, 0, 110);
  sub_2099D02D0(0x70701uLL, v61, 6);
  LODWORD(v20) = archive_entry_devmajor((uint64_t)a2);
  if ((v20 & 0x80000000) == 0) {
    unint64_t v20 = (int)v20;
  }
  else {
    unint64_t v20 = 0xFFFFFFFFLL;
  }
  sub_2099D02D0(v20, (unsigned char *)&v61[3] + 14, 8);
  LODWORD(v21) = archive_entry_devminor(a2);
  if ((v21 & 0x80000000) == 0) {
    unint64_t v21 = (int)v21;
  }
  else {
    unint64_t v21 = 0xFFFFFFFFLL;
  }
  sub_2099D02D0(v21, (unsigned char *)&v61[4] + 6, 8);
  uint64_t v22 = archive_entry_ino64((uint64_t)a2);
  unsigned int v28 = v22;
  if (v22 >= 0x100000000)
  {
    archive_set_error((_DWORD *)a1, 34, "large inode number truncated", v23, v24, v25, v26, v27, v57);
    uint64_t v12 = 4294967276;
  }
  sub_2099D02D0(v28, (unsigned char *)v61 + 6, 8);
  unsigned int v29 = archive_entry_mode((uint64_t)a2);
  sub_2099D02D0(v29, (unsigned char *)((unint64_t)v61 | 0xE), 8);
  unint64_t v30 = archive_entry_uid((uint64_t)a2);
  if (v30 >= 0xFFFFFFFF) {
    unint64_t v30 = 0xFFFFFFFFLL;
  }
  sub_2099D02D0(v30, (unsigned char *)&v61[1] + 6, 8);
  unint64_t v31 = archive_entry_gid((uint64_t)a2);
  if (v31 >= 0xFFFFFFFF) {
    unint64_t v31 = 0xFFFFFFFFLL;
  }
  sub_2099D02D0(v31, (unsigned char *)&v61[1] + 14, 8);
  unsigned int v32 = archive_entry_nlink((uint64_t)a2);
  sub_2099D02D0(v32, (unsigned char *)&v61[2] + 6, 8);
  if (archive_entry_filetype((uint64_t)a2) == 24576
    || archive_entry_filetype((uint64_t)a2) == 0x2000)
  {
    LODWORD(v33) = archive_entry_rdevmajor((uint64_t)a2);
    if ((v33 & 0x80000000) == 0) {
      unint64_t v33 = (int)v33;
    }
    else {
      unint64_t v33 = 0xFFFFFFFFLL;
    }
    sub_2099D02D0(v33, (unsigned char *)&v61[4] + 14, 8);
    LODWORD(v34) = archive_entry_rdevminor(a2);
    if ((v34 & 0x80000000) == 0) {
      unint64_t v34 = (int)v34;
    }
    else {
      unint64_t v34 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    sub_2099D02D0(0, (unsigned char *)&v61[4] + 14, 8);
    unint64_t v34 = 0;
  }
  sub_2099D02D0(v34, (unsigned char *)&v61[5] + 6, 8);
  unint64_t v35 = archive_entry_mtime((uint64_t)a2);
  if (v35 >= 0xFFFFFFFF) {
    unint64_t v35 = 0xFFFFFFFFLL;
  }
  sub_2099D02D0(v35, (unsigned char *)&v61[2] + 14, 8);
  uint64_t v36 = (v19 << 32) + 0x100000000;
  uint64_t v37 = v36 >> 32;
  if (v36 >= 0) {
    unint64_t v38 = v36 >> 32;
  }
  else {
    unint64_t v38 = 0xFFFFFFFFLL;
  }
  sub_2099D02D0(v38, (unsigned char *)&v61[5] + 14, 8);
  sub_2099D02D0(0, (unsigned char *)&v61[6] + 6, 8);
  if (archive_entry_filetype((uint64_t)a2) != 0x8000) {
    archive_entry_set_size((uint64_t)a2, 0);
  }
  if (sub_20997E104((uint64_t)a2, &__s, &v58, v5))
  {
    if (*__error() == 12)
    {
      uint64_t v11 = "Can't allocate memory for Likname";
      goto LABEL_37;
    }
    uint64_t v39 = (char *)archive_entry_symlink((uint64_t)a2);
    sub_2099C42E4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v40, v41, v42, v43, v44, v39);
    uint64_t v12 = 4294967276;
  }
  if (v58 && __s && *__s) {
    unint64_t v45 = strlen(__s);
  }
  else {
    unint64_t v45 = archive_entry_size((uint64_t)a2);
  }
  unint64_t v46 = v45;
  if (v45 >= 0xFFFFFFFF) {
    unint64_t v45 = 0xFFFFFFFFLL;
  }
  sub_2099D02D0(v45, (unsigned char *)&v61[3] + 6, 8);
  if (HIDWORD(v46))
  {
    archive_set_error((_DWORD *)a1, 34, "File is too large for this format.", v47, v48, v49, v50, v51, v57);
    uint64_t v52 = 4294967271;
  }
  else
  {
    if (sub_2099C9728(a1, (uint64_t)v61, 110)
      || sub_2099C9728(a1, v59, v37)
      || ((1 - (_BYTE)v19) & 3) != 0 && sub_2099C9728(a1, (uint64_t)&unk_2099EC240, (1 - (_BYTE)v19) & 3))
    {
      goto LABEL_50;
    }
    uint64_t v54 = archive_entry_size((uint64_t)a2);
    *(void *)uint64_t v4 = v54;
    *(_DWORD *)(v4 + 8) = -(int)v54 & 3;
    if (__s && *__s)
    {
      size_t v55 = strlen(__s);
      uint64_t v52 = 4294967266;
      if (!sub_2099C9728(a1, (uint64_t)__s, v55))
      {
        int v56 = strlen(__s);
        if (sub_2099C9728(a1, (uint64_t)&unk_2099EC240, -v56 & 3)) {
          uint64_t v52 = 4294967266;
        }
        else {
          uint64_t v52 = v12;
        }
      }
    }
    else
    {
      uint64_t v52 = v12;
    }
  }
LABEL_51:
  archive_entry_free(0);
  return v52;
}

unint64_t sub_2099D02D0(unint64_t result, unsigned char *a2, int a3)
{
  if (a3)
  {
    unint64_t v4 = sub_2099D02D0(result, a2 + 1, (a3 - 1));
    *a2 = a0123456789abcd[v4 & 0xF];
    return v4 >> 4;
  }
  return result;
}

uint64_t archive_write_set_format_mtree(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_2099D0328(a1, "archive_write_set_format_mtree", a3, a4, a5, a6, a7, a8);
}

uint64_t sub_2099D0328(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 1, a2, a5, a6, a7, a8);
  if (result != -30)
  {
    uint64_t v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = malloc_type_calloc(1uLL, 0x3C8uLL, 0x10B0040658C16C3uLL);
    if (v11)
    {
      uint64_t v17 = v11;
      uint64_t result = 0;
      *(void *)uint64_t v17 = 0;
      v17[28] = 1;
      *((void *)v17 + 22) = 0;
      *((_OWORD *)v17 + 9) = 0u;
      *((_OWORD *)v17 + 10) = 0u;
      *((_OWORD *)v17 + 8) = 0u;
      *((void *)v17 + 119) = 4032058;
      *((void *)v17 + 6) = 0;
      v17[240] = 0;
      *((_OWORD *)v17 + 4) = 0u;
      *((_OWORD *)v17 + 5) = 0u;
      *((_OWORD *)v17 + 6) = 0u;
      *((void *)v17 + 7) = v17 + 12;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 328) = sub_2099D04B4;
      *(void *)(a1 + 272) = "mtree";
      *(void *)(a1 + 288) = sub_2099D052C;
      *(void *)(a1 + 304) = sub_2099D096C;
      *(void *)(a1 + 320) = sub_2099D1074;
      *(void *)(a1 + 312) = sub_2099D151C;
      *(void *)(a1 + 296) = sub_2099D1684;
      *(_DWORD *)(a1 + 16) = 0x80000;
      *(void *)(a1 + 24) = "mtree";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate mtree data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t archive_write_set_format_mtree_classic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_2099D0328(a1, "archive_write_set_format_mtree_classic", a3, a4, a5, a6, a7, a8);
  if (!result)
  {
    uint64_t v10 = *(void *)(a1 + 264);
    *(_DWORD *)(v10 + 216) = 1;
    *(_DWORD *)(v10 + 964) = 1;
  }
  return result;
}

uint64_t sub_2099D04B4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 264);
  if (v1)
  {
    uint64_t v3 = v1[6];
    if (v3)
    {
      do
      {
        uint64_t v4 = *(void *)(v3 + 24);
        sub_2099D1854((void **)v3);
        uint64_t v3 = v4;
      }
      while (v4);
    }
    sub_20997954C((uint64_t)(v1 + 3));
    sub_20997954C((uint64_t)(v1 + 8));
    sub_20997954C((uint64_t)(v1 + 11));
    sub_2099D17C4(v1);
    free(v1);
    *(void *)(a1 + 264) = 0;
  }
  return 0;
}

uint64_t sub_2099D052C(uint64_t a1, char *__s1, uint64_t a3)
{
  uint64_t result = 4294967276;
  uint64_t v7 = *(_DWORD **)(a1 + 264);
  switch(*__s1)
  {
    case 'a':
      if (strcmp(__s1, "all")) {
        return 4294967276;
      }
      int v8 = -1;
      goto LABEL_63;
    case 'c':
      if (strcmp(__s1, "cksum")) {
        return 4294967276;
      }
      int v8 = 1;
      goto LABEL_63;
    case 'd':
      if (!strcmp(__s1, "device"))
      {
        int v8 = 2;
        goto LABEL_63;
      }
      uint64_t result = strcmp(__s1, "dironly");
      if (result) {
        return 4294967276;
      }
      v7[239] = a3 != 0;
      return result;
    case 'f':
      if (strcmp(__s1, "flags")) {
        return 4294967276;
      }
      int v8 = 8;
      goto LABEL_63;
    case 'g':
      if (!strcmp(__s1, "gid"))
      {
        int v8 = 16;
      }
      else
      {
        if (strcmp(__s1, "gname")) {
          return 4294967276;
        }
        int v8 = 32;
      }
      goto LABEL_63;
    case 'i':
      uint64_t result = strcmp(__s1, "indent");
      if (!result)
      {
        v7[240] = a3 != 0;
        return result;
      }
      if (strcmp(__s1, "inode")) {
        return 4294967276;
      }
      int v8 = 0x4000000;
      goto LABEL_63;
    case 'l':
      if (strcmp(__s1, "link")) {
        return 4294967276;
      }
      int v8 = 0x10000;
      goto LABEL_63;
    case 'm':
      if (!strcmp(__s1, "md5") || !strcmp(__s1, "md5digest")) {
        int v8 = 256;
      }
      else {
        int v8 = 0;
      }
      if (strcmp(__s1, "mode")) {
        goto LABEL_53;
      }
      int v8 = 512;
      goto LABEL_63;
    case 'n':
      if (strcmp(__s1, "nlink")) {
        return 4294967276;
      }
      int v8 = 1024;
      goto LABEL_63;
    case 'r':
      if (!strcmp(__s1, "resdevice"))
      {
        int v8 = 0x8000000;
        goto LABEL_63;
      }
      if (!strcmp(__s1, "ripemd160digest") || !strcmp(__s1, "rmd160") || !strcmp(__s1, "rmd160digest"))
      {
        int v8 = 0x2000;
        goto LABEL_63;
      }
      return 4294967276;
    case 's':
      if (!strcmp(__s1, "sha1") || !strcmp(__s1, "sha1digest")) {
        int v8 = 0x4000;
      }
      else {
        int v8 = 0;
      }
      if (!strcmp(__s1, "sha256") || !strcmp(__s1, "sha256digest")) {
        int v8 = 0x800000;
      }
      if (!strcmp(__s1, "sha384") || !strcmp(__s1, "sha384digest")) {
        int v8 = 0x1000000;
      }
      if (!strcmp(__s1, "sha512") || !strcmp(__s1, "sha512digest")) {
        int v8 = 0x2000000;
      }
      if (!strcmp(__s1, "size"))
      {
        int v8 = 0x8000;
        goto LABEL_63;
      }
LABEL_53:
      if (v8) {
        goto LABEL_63;
      }
      return 4294967276;
    case 't':
      if (!strcmp(__s1, "time"))
      {
        int v8 = 0x40000;
      }
      else
      {
        if (strcmp(__s1, "type")) {
          return 4294967276;
        }
        int v8 = 0x80000;
      }
      goto LABEL_63;
    case 'u':
      if (!strcmp(__s1, "uid"))
      {
        int v8 = 0x100000;
LABEL_63:
        uint64_t result = 0;
        if (a3) {
          int v9 = v7[238] | v8;
        }
        else {
          int v9 = v7[238] & ~v8;
        }
        v7[238] = v9;
        return result;
      }
      if (!strcmp(__s1, "uname"))
      {
        int v8 = 0x200000;
        goto LABEL_63;
      }
      uint64_t result = strcmp(__s1, "use-set");
      if (result) {
        return 4294967276;
      }
      v7[241] = a3 != 0;
      return result;
    default:
      return result;
  }
}

uint64_t sub_2099D096C(uint64_t a1, uint64_t *a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 264);
  if (*(_DWORD *)(v4 + 112))
  {
    *(_DWORD *)(v4 + 112) = 0;
    sub_2099C4040((uint64_t *)(v4 + 88), "#mtree\n");
    if ((*(_DWORD *)(v4 + 952) & 0x380238) == 0) {
      *(_DWORD *)(v4 + 964) = 0;
    }
  }
  *(void *)(v4 + 120) = archive_entry_size((uint64_t)a2);
  if (*(_DWORD *)(v4 + 956) && archive_entry_filetype((uint64_t)a2) != 0x4000) {
    return 0;
  }
  uint64_t v54 = 0;
  uint64_t v10 = sub_2099D18D0((_DWORD *)a1, a2, &v54);
  if ((int)v10 >= -20)
  {
    uint64_t v11 = *(void *)(a1 + 264);
    uint64_t v12 = v54;
    uint64_t v13 = v54[8];
    if (v13)
    {
      uint64_t v14 = (char *)v54[7];
      if (*(void **)(v11 + 32) != v13 || strcmp(*(const char **)(v11 + 24), (const char *)v54[7]))
      {
        unsigned int v53 = v10;
        uint64_t v15 = *(void ***)(v11 + 8);
        unsigned int v21 = sub_209998E98(v59, v14);
        for (uint64_t i = v14; v21; v21 = sub_209998E98(v59, i))
        {
          while (1)
          {
            if ((v21 & 0x80000000) != 0) {
              goto LABEL_65;
            }
            if (v21 == 1 && v59[0] == 46 && v15 != 0) {
              break;
            }
            if (!v15) {
              goto LABEL_31;
            }
LABEL_23:
            uint64_t v25 = sub_2099CA750((uint64_t *)v15[5], (uint64_t)v59);
            if (!v25) {
              goto LABEL_31;
            }
            uint64_t v26 = (void **)v25;
            if (!*i)
            {
              uint64_t v10 = v53;
              goto LABEL_69;
            }
            if (!*(void *)(v25 + 40))
            {
              goto LABEL_86;
            }
            uint64_t v27 = &i[v21];
            int v29 = *v27;
            unsigned int v28 = v27 + 1;
            if (v29 == 47) {
              uint64_t i = v28;
            }
            else {
              i += v21;
            }
            unsigned int v21 = sub_209998E98(v59, i);
            uint64_t v15 = v26;
            if (!v21)
            {
              uint64_t v15 = v26;
              goto LABEL_31;
            }
          }
          if (v15 != *(void ***)(v11 + 8)) {
            goto LABEL_23;
          }
          int v24 = *++i;
          if (v24 == 47) {
            ++i;
          }
        }
LABEL_31:
        uint64_t v52 = (void **)(v11 + 24);
        if (*i)
        {
          while (1)
          {
            uint64_t v30 = v21;
            size_t v55 = 0;
            uint64_t v56 = 0;
            uint64_t v57 = 0;
            sub_209974714((uint64_t *)&v55, v14, (size_t)&i[v21 - (void)v14]);
            unint64_t v31 = v55;
            if (v55[v56 - 1] == 47)
            {
              v55[v56 - 1] = 0;
              unint64_t v31 = v55;
              --v56;
            }
            unsigned int v32 = (uint64_t *)archive_entry_new();
            if (!v32) {
              goto LABEL_57;
            }
            unint64_t v38 = v32;
            uint64_t v58 = 0;
            archive_entry_copy_pathname((uint64_t)v32, v31);
            archive_entry_set_mode((uint64_t)v38, 16877);
            time_t v39 = time(0);
            archive_entry_set_mtime((uint64_t)v38, v39, 0);
            int v40 = sub_2099D18D0((_DWORD *)a1, v38, &v58);
            archive_entry_free((void **)v38);
            if (v40 <= -21)
            {
LABEL_57:
              archive_set_error((_DWORD *)a1, 12, "Can't allocate memory", v33, v34, v35, v36, v37, v51);
              sub_20997954C((uint64_t)&v55);
              goto LABEL_66;
            }
            uint64_t v41 = (void **)v58;
            *(_DWORD *)(*(void *)(v58 + 40) + 40) = 1;
            sub_20997954C((uint64_t)&v55);
            if (!strcmp((const char *)v41[13], "."))
            {
              *(void *)(v11 + 8) = v41;
              uint64_t v15 = v41;
            }
            else
            {
              sub_2099CA894((unint64_t)v15[5], v41);
            }
            v41[4] = v15;
            v41[3] = 0;
            **(void **)(v11 + 56) = v41;
            *(void *)(v11 + 56) = v41 + 3;
            i += i[v30] == 47 ? v30 + 1 : v30;
            unsigned int v42 = sub_209998E98(v59, i);
            if ((v42 & 0x80000000) != 0) {
              break;
            }
            unsigned int v21 = v42;
            uint64_t v15 = v41;
            if (!*i) {
              goto LABEL_52;
            }
          }
          sub_20997954C((uint64_t)&v55);
LABEL_65:
          archive_set_error((_DWORD *)a1, -1, "A name buffer is too small", v16, v17, v18, v19, v20, v51);
LABEL_66:
          uint64_t v10 = 4294967266;
          goto LABEL_87;
        }
        uint64_t v41 = v15;
LABEL_52:
        *(void *)(v11 + 16) = v41;
        *(void *)(v11 + 32) = 0;
        sub_209974664(v52, (size_t)v41[11] + (void)v41[8] + 2);
        uint64_t v43 = v41[8];
        if ((char *)v41[11] + (void)v43)
        {
          uint64_t v10 = v53;
          if (v43)
          {
            *(void *)(v11 + 32) = 0;
            sub_2099771C0((uint64_t *)v52, (uint64_t)(v41 + 7));
            sub_2099C4050((uint64_t *)v52, 47);
          }
          sub_2099771C0((uint64_t *)v52, (uint64_t)(v41 + 10));
        }
        else
        {
          *(unsigned char *)*uint64_t v52 = 0;
          uint64_t v10 = v53;
        }
        if (sub_2099CA894((unint64_t)v41[5], v12))
        {
          v12[4] = v41;
          v12[3] = 0;
          **(void **)(v11 + 56) = v12;
          *(void *)(v11 + 56) = v12 + 3;
          uint64_t v26 = v54;
          goto LABEL_73;
        }
        unint64_t v46 = (uint64_t *)v41[5];
        goto LABEL_68;
      }
      int v44 = sub_2099CA894(*(void *)(*(void *)(v11 + 16) + 40), v12);
      unint64_t v45 = *(uint64_t ***)(v11 + 16);
      if (!v44)
      {
        unint64_t v46 = v45[5];
LABEL_68:
        uint64_t v26 = (void **)sub_2099CA750(v46, (uint64_t)v12[10]);
        goto LABEL_69;
      }
      v12[4] = v45;
    }
    else
    {
      if (v54[11] != (void *)1 || *(unsigned char *)v54[10] != 46)
      {
        archive_set_error((_DWORD *)a1, -1, "Internal programming error in generating canonical name for %s", v5, v6, v7, v8, v9, (char *)v54[13]);
        goto LABEL_86;
      }
      v54[4] = v54;
      uint64_t v26 = *(void ***)(v11 + 8);
      if (v26)
      {
LABEL_69:
        if ((*((unsigned __int16 *)v12 + 115) ^ *((unsigned __int16 *)v26 + 115)) < 0x1000)
        {
          v26[17] = 0;
          sub_2099771C0((uint64_t *)v26 + 16, (uint64_t)(v12 + 16));
          v26[20] = 0;
          sub_2099771C0((uint64_t *)v26 + 19, (uint64_t)(v12 + 19));
          v26[23] = 0;
          sub_2099771C0((uint64_t *)v26 + 22, (uint64_t)(v12 + 22));
          v26[26] = 0;
          sub_2099771C0((uint64_t *)v26 + 25, (uint64_t)(v12 + 25));
          *((_DWORD *)v26 + 56) = *((_DWORD *)v12 + 56);
          *((_DWORD *)v26 + 57) = *((_DWORD *)v12 + 57);
          *(_OWORD *)(v26 + 29) = *(_OWORD *)(v12 + 29);
          *((_OWORD *)v26 + 17) = *((_OWORD *)v12 + 17);
          *(_OWORD *)(v26 + 31) = *(_OWORD *)(v12 + 31);
          v26[33] = v12[33];
          *((_OWORD *)v26 + 18) = *((_OWORD *)v12 + 18);
          v26[38] = v12[38];
          uint64_t v47 = v26[5];
          if (v47) {
            v47[10] = 0;
          }
          sub_2099D1854(v12);
LABEL_73:
          *(void *)uint64_t v4 = v26;
          if (!v26[6]) {
            return v10;
          }
          *(_DWORD *)(v4 + 224) = 0;
          unsigned int v48 = *(_DWORD *)(v4 + 952);
          if (v48)
          {
            *(void *)(v4 + 224) = 1;
            *(void *)(v4 + 232) = 0;
          }
          if ((v48 & 0x100) == 0)
          {
            if ((v48 & 0x4000) == 0) {
              goto LABEL_78;
            }
LABEL_90:
            if (((unsigned int (*)(CC_SHA1_CTX *))off_26BD73670[0])((CC_SHA1_CTX *)(v4 + 332)))
            {
              unsigned int v48 = *(_DWORD *)(v4 + 952) & 0xFFFFBFFF;
              *(_DWORD *)(v4 + 952) = v48;
              if ((v48 & 0x800000) != 0) {
                goto LABEL_94;
              }
            }
            else
            {
              *(_DWORD *)(v4 + 224) |= 0x4000u;
              unsigned int v48 = *(_DWORD *)(v4 + 952);
              if ((v48 & 0x800000) != 0) {
                goto LABEL_94;
              }
            }
LABEL_79:
            if ((v48 & 0x1000000) == 0) {
              goto LABEL_80;
            }
LABEL_98:
            if (off_26BD736A0((CC_SHA512_CTX *)(v4 + 536)))
            {
              unsigned int v50 = *(_DWORD *)(v4 + 952) & 0xFEFFFFFF;
              *(_DWORD *)(v4 + 952) = v50;
              if ((v50 & 0x2000000) == 0) {
                return v10;
              }
            }
            else
            {
              *(_DWORD *)(v4 + 224) |= 0x1000000u;
              if ((*(_DWORD *)(v4 + 952) & 0x2000000) == 0) {
                return v10;
              }
            }
LABEL_102:
            if (off_26BD736B8((CC_SHA512_CTX *)(v4 + 744))) {
              *(_DWORD *)(v4 + 952) &= ~0x2000000u;
            }
            else {
              *(_DWORD *)(v4 + 224) |= 0x2000000u;
            }
            return v10;
          }
          if (((unsigned int (*)(CC_MD5_CTX *))off_26BD73640[0])((CC_MD5_CTX *)(v4 + 240)))
          {
            unsigned int v48 = *(_DWORD *)(v4 + 952) & 0xFFFFFEFF;
            *(_DWORD *)(v4 + 952) = v48;
            if ((v48 & 0x4000) != 0) {
              goto LABEL_90;
            }
          }
          else
          {
            *(_DWORD *)(v4 + 224) |= 0x100u;
            unsigned int v48 = *(_DWORD *)(v4 + 952);
            if ((v48 & 0x4000) != 0) {
              goto LABEL_90;
            }
          }
LABEL_78:
          if ((v48 & 0x800000) == 0) {
            goto LABEL_79;
          }
LABEL_94:
          if (off_26BD73688((CC_SHA256_CTX *)(v4 + 428)))
          {
            unsigned int v48 = *(_DWORD *)(v4 + 952) & 0xFF7FFFFF;
            *(_DWORD *)(v4 + 952) = v48;
            if ((v48 & 0x1000000) != 0) {
              goto LABEL_98;
            }
          }
          else
          {
            *(_DWORD *)(v4 + 224) |= 0x800000u;
            unsigned int v48 = *(_DWORD *)(v4 + 952);
            if ((v48 & 0x1000000) != 0) {
              goto LABEL_98;
            }
          }
LABEL_80:
          if ((v48 & 0x2000000) == 0) {
            return v10;
          }
          goto LABEL_102;
        }
LABEL_86:
        uint64_t v10 = 4294967271;
LABEL_87:
        sub_2099D1854(v54);
        return v10;
      }
      *(void *)(v11 + 8) = v12;
    }
    v12[3] = 0;
    **(void **)(v11 + 56) = v12;
    *(void *)(v11 + 56) = v12 + 3;
    uint64_t v26 = v12;
    goto LABEL_73;
  }
  return v10;
}

uint64_t sub_2099D1074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 264);
  uint64_t v10 = *(void *)(v9 + 8);
  if (!v10)
  {
LABEL_75:
    archive_write_set_bytes_in_last_block((int *)a1, 1, a3, a4, a5, a6, a7, a8);
    uint64_t v48 = *(void *)(v9 + 88);
    uint64_t v49 = *(void *)(v9 + 96);
    return sub_2099C9728(a1, v48, v49);
  }
  uint64_t v11 = (uint64_t **)(v9 + 184);
  uint64_t v12 = (uint64_t **)(v9 + 192);
  uint64_t v13 = (uint64_t **)(v9 + 200);
  uint64_t v14 = (uint64_t *)(v9 + 208);
  while (1)
  {
    if (*(_DWORD *)(v9 + 964))
    {
      sub_2099D17C4((void *)v9);
      unint64_t v15 = sub_2099CABD0(*(unint64_t **)(v10 + 40), 0, 0);
      if (v15) {
        break;
      }
    }
LABEL_48:
    if (*(_DWORD *)(*(void *)(v10 + 40) + 40) && !*(_DWORD *)(v9 + 216))
    {
      if (*(_DWORD *)(v9 + 964)) {
        sub_2099D24FC(v9, a2, a3, a4, a5, a6, a7, a8);
      }
    }
    else if (sub_2099D1F0C(a1, v10, a3, a4, a5, a6, a7, a8))
    {
      return 4294967266;
    }
    ++*(_DWORD *)(v9 + 220);
    unint64_t v41 = sub_2099CABD0(*(unint64_t **)(v10 + 40), 0, 0);
    if (v41)
    {
      unint64_t v42 = v41;
      do
      {
        uint64_t v43 = *(void *)(v42 + 40);
        if (v43)
        {
          *(void *)(v43 + 32) = 0;
          **(void **)(*(void *)(v10 + 40) + 24) = v42;
          int v44 = *(unint64_t **)(v10 + 40);
          v44[3] = *(void *)(v42 + 40) + 32;
        }
        else
        {
          if (sub_2099D1F0C(a1, v42, a3, a4, a5, a6, a7, a8)) {
            return 4294967266;
          }
          int v44 = *(unint64_t **)(v10 + 40);
        }
        unint64_t v42 = sub_2099CABD0(v44, v42, 1u);
      }
      while (v42);
    }
    int v45 = *(_DWORD *)(v9 + 220);
    *(_DWORD *)(v9 + 220) = v45 - 1;
    uint64_t i = *(void *)(*(void *)(v10 + 40) + 16);
    if (i)
    {
      if (*(_DWORD *)(v9 + 960)) {
        *(_DWORD *)(v9 + 220) = v45;
      }
    }
    else
    {
      if (*(_DWORD *)(v9 + 216) && sub_2099D28D4(a1, v10, a3, a4, a5, a6, a7, a8)) {
        return 4294967266;
      }
      uint64_t v47 = (uint64_t *)(v10 + 32);
      a2 = *(void *)(v10 + 32);
      for (uint64_t i = v10; i != a2; a2 = *(void *)(a2 + 32))
      {
        uint64_t i = *(void *)(*(void *)(i + 40) + 32);
        if (i) {
          break;
        }
        if (*(_DWORD *)(v9 + 960)) {
          --*(_DWORD *)(v9 + 220);
        }
        if (*(_DWORD *)(v9 + 216))
        {
          if (sub_2099D28D4(a1, a2, a3, a4, a5, a6, a7, a8)) {
            return 4294967266;
          }
          a2 = *v47;
        }
        uint64_t i = a2;
        uint64_t v47 = (uint64_t *)(a2 + 32);
      }
    }
    uint64_t v10 = i;
    if (i == *(void *)(i + 32)) {
      goto LABEL_75;
    }
  }
  unint64_t v16 = v15;
  while (1)
  {
    int v17 = *(_DWORD *)(v9 + 952);
    if ((v17 & 0x300000) != 0)
    {
      uint64_t v18 = *v11;
      if (*v11)
      {
        uint64_t v19 = *(void *)(v16 + 240);
        if (*(void *)(v18[2] + 240) == v19)
        {
          uint64_t v20 = 0;
        }
        else
        {
          do
          {
            uint64_t v20 = (uint64_t)v18;
            uint64_t v18 = (uint64_t *)v18[1];
          }
          while (v18 && *(void *)(v18[2] + 240) != v19);
        }
        if ((sub_2099D29EC((uint64_t *)(v9 + 184), v18, v20, v16) & 0x80000000) != 0) {
          goto LABEL_82;
        }
      }
      else
      {
        uint64_t v26 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
        if (!v26) {
          goto LABEL_81;
        }
        *uint64_t v26 = 0;
        v26[1] = 0;
        *((_DWORD *)v26 + 6) = 1;
        v26[2] = v16;
        *uint64_t v11 = v26;
      }
    }
    if ((v17 & 0x30) == 0) {
      goto LABEL_23;
    }
    uint64_t v27 = *v12;
    if (*v12)
    {
      uint64_t v28 = *(void *)(v16 + 248);
      if (*(void *)(v27[2] + 248) == v28)
      {
        uint64_t v29 = 0;
      }
      else
      {
        do
        {
          uint64_t v29 = (uint64_t)v27;
          uint64_t v27 = (uint64_t *)v27[1];
        }
        while (v27 && *(void *)(v27[2] + 248) != v28);
      }
      if ((sub_2099D29EC((uint64_t *)(v9 + 192), v27, v29, v16) & 0x80000000) != 0) {
        goto LABEL_82;
      }
LABEL_23:
      if ((v17 & 0x200) == 0) {
        goto LABEL_33;
      }
      goto LABEL_24;
    }
    uint64_t v33 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
    if (!v33)
    {
      uint64_t v11 = (uint64_t **)(v9 + 192);
      goto LABEL_81;
    }
    void *v33 = 0;
    v33[1] = 0;
    *((_DWORD *)v33 + 6) = 1;
    v33[2] = v16;
    char *v12 = v33;
    if ((v17 & 0x200) == 0) {
      goto LABEL_33;
    }
LABEL_24:
    uint64_t v30 = *v13;
    if (*v13) {
      break;
    }
    time_t v39 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
    if (!v39)
    {
      uint64_t v11 = (uint64_t **)(v9 + 200);
      goto LABEL_81;
    }
    *time_t v39 = 0;
    v39[1] = 0;
    *((_DWORD *)v39 + 6) = 1;
    v39[2] = v16;
    *uint64_t v13 = v39;
    if ((v17 & 8) != 0) {
      goto LABEL_34;
    }
LABEL_47:
    unint64_t v16 = sub_2099CABD0(*(unint64_t **)(v10 + 40), v16, 1u);
    if (!v16) {
      goto LABEL_48;
    }
  }
  int v31 = *(unsigned __int16 *)(v16 + 230);
  if (*(unsigned __int16 *)(v30[2] + 230) == v31)
  {
    uint64_t v32 = 0;
  }
  else
  {
    do
    {
      uint64_t v32 = (uint64_t)v30;
      uint64_t v30 = (uint64_t *)v30[1];
    }
    while (v30 && *(unsigned __int16 *)(v30[2] + 230) != v31);
  }
  if ((sub_2099D29EC((uint64_t *)(v9 + 200), v30, v32, v16) & 0x80000000) != 0) {
    goto LABEL_82;
  }
LABEL_33:
  if ((v17 & 8) == 0) {
    goto LABEL_47;
  }
LABEL_34:
  uint64_t v34 = *v14;
  if (*v14)
  {
    uint64_t v35 = 0;
    while (1)
    {
      uint64_t v36 = v34;
      uint64_t v37 = *(void *)(v34 + 16);
      if (*(void *)(v37 + 272) == *(void *)(v16 + 272) && *(void *)(v37 + 280) == *(void *)(v16 + 280)) {
        break;
      }
      uint64_t v34 = *(void *)(v36 + 8);
      uint64_t v35 = v36;
      if (!v34)
      {
        unint64_t v38 = 0;
        goto LABEL_46;
      }
    }
    unint64_t v38 = (uint64_t *)v36;
    uint64_t v36 = v35;
LABEL_46:
    if ((sub_2099D29EC((uint64_t *)(v9 + 208), v38, v36, v16) & 0x80000000) != 0) {
      goto LABEL_82;
    }
    goto LABEL_47;
  }
  int v40 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
  if (v40)
  {
    *int v40 = 0;
    v40[1] = 0;
    *((_DWORD *)v40 + 6) = 1;
    v40[2] = v16;
    *uint64_t v14 = (uint64_t)v40;
    goto LABEL_47;
  }
  uint64_t v11 = (uint64_t **)(v9 + 208);
LABEL_81:
  *uint64_t v11 = 0;
LABEL_82:
  archive_set_error((_DWORD *)a1, 12, "Can't allocate memory", v21, v22, v23, v24, v25, v51);
  return 4294967266;
}

unint64_t sub_2099D151C(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 264);
  unint64_t v4 = *(void *)(v3 + 120);
  if (v4 >= a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = *(void *)(v3 + 120);
  }
  *(void *)(v3 + 120) = v4 - v5;
  if (!*(void *)v3 || *(__int16 *)(*(void *)v3 + 228) != -32768) {
    return v5;
  }
  int v7 = *(_DWORD *)(v3 + 224);
  if (v7)
  {
    if (v5)
    {
      unsigned int v9 = *(_DWORD *)(v3 + 228);
      unint64_t v10 = v5;
      uint64_t v11 = a2;
      do
      {
        int v12 = *v11++;
        unsigned int v9 = dword_2099EC350[v12 ^ HIBYTE(v9)] ^ (v9 << 8);
        *(_DWORD *)(v3 + 228) = v9;
        --v10;
      }
      while (v10);
    }
    *(void *)(v3 + 232) += v5;
    if ((v7 & 0x100) == 0)
    {
LABEL_8:
      if ((v7 & 0x4000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  else if ((v7 & 0x100) == 0)
  {
    goto LABEL_8;
  }
  off_26BD73648((CC_MD5_CTX *)(v3 + 240), a2, v5);
  int v7 = *(_DWORD *)(v3 + 224);
  if ((v7 & 0x4000) == 0)
  {
LABEL_9:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  off_26BD73678((CC_SHA1_CTX *)(v3 + 332), a2, v5);
  int v7 = *(_DWORD *)(v3 + 224);
  if ((v7 & 0x800000) == 0)
  {
LABEL_10:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_11;
    }
LABEL_21:
    off_26BD736A8((CC_SHA512_CTX *)(v3 + 536), a2, v5);
    if ((*(_DWORD *)(v3 + 224) & 0x2000000) == 0) {
      return v5;
    }
    goto LABEL_12;
  }
LABEL_20:
  off_26BD73690((CC_SHA256_CTX *)(v3 + 428), a2, v5);
  int v7 = *(_DWORD *)(v3 + 224);
  if ((v7 & 0x1000000) != 0) {
    goto LABEL_21;
  }
LABEL_11:
  if ((v7 & 0x2000000) != 0) {
LABEL_12:
  }
    off_26BD736C0((CC_SHA512_CTX *)(v3 + 744), a2, v5);
  return v5;
}

uint64_t sub_2099D1684(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 264);
  uint64_t v2 = *v1;
  if (*v1)
  {
    uint64_t *v1 = 0;
    uint64_t v3 = *(void *)(v2 + 48);
    if (v3)
    {
      int v4 = *((_DWORD *)v1 + 56);
      if (v4)
      {
        unint64_t v6 = v1[29];
        unsigned int v7 = *((_DWORD *)v1 + 57);
        if (v6)
        {
          do
          {
            unsigned int v7 = dword_2099EC350[v6 ^ (unint64_t)HIBYTE(v7)] ^ (v7 << 8);
            BOOL v8 = v6 > 0xFF;
            v6 >>= 8;
          }
          while (v8);
          *((_DWORD *)v1 + 57) = v7;
        }
        *(_DWORD *)(v3 + 4) = ~v7;
        if ((v4 & 0x100) == 0)
        {
LABEL_5:
          if ((v4 & 0x4000) == 0) {
            goto LABEL_6;
          }
          goto LABEL_17;
        }
      }
      else if ((v4 & 0x100) == 0)
      {
        goto LABEL_5;
      }
      off_26BD73650((CC_MD5_CTX *)(v1 + 30), (unsigned __int8 *)(v3 + 8));
      int v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 0x4000) == 0)
      {
LABEL_6:
        if ((v4 & 0x800000) == 0) {
          goto LABEL_7;
        }
        goto LABEL_18;
      }
LABEL_17:
      off_26BD73680((CC_SHA1_CTX *)((char *)v1 + 332), (unsigned __int8 *)(v3 + 44));
      int v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 0x800000) == 0)
      {
LABEL_7:
        if ((v4 & 0x1000000) == 0) {
          goto LABEL_8;
        }
        goto LABEL_19;
      }
LABEL_18:
      off_26BD73698((CC_SHA256_CTX *)((char *)v1 + 428), (unsigned __int8 *)(v3 + 64));
      int v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 0x1000000) == 0)
      {
LABEL_8:
        if ((v4 & 0x2000000) == 0)
        {
LABEL_10:
          *(_DWORD *)uint64_t v3 = v4;
          return 0;
        }
LABEL_9:
        off_26BD736C8((CC_SHA512_CTX *)(v1 + 93), (unsigned __int8 *)(v3 + 144));
        int v4 = *((_DWORD *)v1 + 56);
        goto LABEL_10;
      }
LABEL_19:
      off_26BD736B0((CC_SHA512_CTX *)(v1 + 67), (unsigned __int8 *)(v3 + 96));
      int v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 0x2000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  return 0;
}

void *sub_2099D17C4(void *a1)
{
  uint64_t v2 = (void *)a1[23];
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)v2[1];
      free(v2);
      uint64_t v2 = v3;
    }
    while (v3);
    a1[23] = 0;
  }
  int v4 = (void *)a1[24];
  if (v4)
  {
    do
    {
      unint64_t v5 = (void *)v4[1];
      free(v4);
      int v4 = v5;
    }
    while (v5);
    a1[24] = 0;
  }
  unint64_t v6 = (void *)a1[25];
  if (v6)
  {
    do
    {
      unsigned int v7 = (void *)v6[1];
      free(v6);
      unint64_t v6 = v7;
    }
    while (v7);
    a1[25] = 0;
  }
  uint64_t result = (void *)a1[26];
  if (result)
  {
    do
    {
      unsigned int v9 = (void *)result[1];
      free(result);
      uint64_t result = v9;
    }
    while (v9);
    a1[26] = 0;
  }
  return result;
}

void sub_2099D1854(void **a1)
{
  sub_20997954C((uint64_t)(a1 + 7));
  sub_20997954C((uint64_t)(a1 + 10));
  sub_20997954C((uint64_t)(a1 + 13));
  sub_20997954C((uint64_t)(a1 + 16));
  sub_20997954C((uint64_t)(a1 + 19));
  sub_20997954C((uint64_t)(a1 + 22));
  sub_20997954C((uint64_t)(a1 + 25));
  free(a1[5]);
  free(a1[6]);

  free(a1);
}

uint64_t sub_2099D18D0(_DWORD *a1, uint64_t *a2, void *a3)
{
  unint64_t v6 = (char *)malloc_type_calloc(1uLL, 0x138uLL, 0x1030040643B09EFuLL);
  int v12 = v6;
  if (!v6)
  {
    archive_set_error(a1, 12, "Can't allocate memory for a mtree entry", v7, v8, v9, v10, v11, v66);
LABEL_82:
    uint64_t result = 4294967266;
    goto LABEL_83;
  }
  uint64_t v13 = (const char **)(v6 + 104);
  *((void *)v6 + 14) = 0;
  uint64_t v14 = (unsigned char *)archive_entry_pathname(a2);
  if (archive_entry_pathname(a2))
  {
    unint64_t v15 = (const char *)archive_entry_pathname(a2);
    size_t v16 = strlen(v15);
  }
  else
  {
    size_t v16 = 0;
  }
  sub_209974714((uint64_t *)v12 + 13, v14, v16);
  int v17 = (char *)*v13;
  if (!strcmp(*v13, "."))
  {
    uint64_t v19 = (uint64_t *)(v12 + 80);
    *((void *)v12 + 11) = 0;
    uint64_t v20 = ".";
    size_t v21 = 1;
    goto LABEL_64;
  }
  *((void *)v12 + 8) = 0;
  if (v17) {
    size_t v18 = strlen(v17);
  }
  else {
    size_t v18 = 0;
  }
  sub_209974714((uint64_t *)v12 + 7, v17, v18);
  uint64_t v22 = (char *)*((void *)v12 + 7);
  unint64_t v23 = *((void *)v12 + 8);
  uint64_t v24 = v22;
  while (1)
  {
    int v25 = *v24;
    if (v25 != 47) {
      break;
    }
    uint64_t v26 = -1;
    uint64_t v27 = 1;
LABEL_18:
    v24 += v27;
    v23 += v26;
  }
  if (v25 == 46 && v24[1] == 46 && v24[2] == 47)
  {
    uint64_t v26 = -3;
    uint64_t v27 = 3;
    goto LABEL_18;
  }
  if (v24 != v22) {
    memmove(*((void **)v12 + 7), v24, v23 + 1);
  }
  do
  {
    if (!v23) {
      break;
    }
    unint64_t v28 = v23;
    if (v22[v23 - 1] == 47)
    {
      v22[v23 - 1] = 0;
      unint64_t v28 = v23 - 1;
    }
    unint64_t v29 = v28 - 2;
    if (v28 >= 2)
    {
      if (v22[v29] == 47 && v22[v28 - 1] == 46)
      {
        v22[v29] = 0;
        v28 -= 2;
      }
      unint64_t v30 = v28 - 3;
      if (v28 >= 3 && v22[v30] == 47 && v22[v28 - 2] == 46 && v22[v28 - 1] == 46)
      {
        v22[v30] = 0;
        v28 -= 3;
      }
    }
    BOOL v31 = v23 == v28;
    unint64_t v23 = v28;
  }
  while (!v31);
LABEL_35:
  uint64_t v32 = v22;
  while (2)
  {
    while (1)
    {
      uint64_t v33 = v32;
      if (*v32 != 47) {
        break;
      }
      ++v32;
      int v34 = *((unsigned __int8 *)v33 + 1);
      if (v34 != 46)
      {
        if (v34 != 47) {
          continue;
        }
        size_t v35 = strlen(v33 + 1) + 1;
        uint64_t v36 = (char *)v33;
        uint64_t v37 = v33 + 1;
LABEL_45:
        memmove(v36, v37, v35);
        uint64_t v32 = (char *)v33;
        continue;
      }
      int v38 = *((unsigned __int8 *)v33 + 2);
      if (v38 != 46)
      {
        if (v38 != 47) {
          continue;
        }
        size_t v35 = strlen(v33 + 2) + 1;
        uint64_t v36 = (char *)v33;
        uint64_t v37 = v33 + 2;
        goto LABEL_45;
      }
      if (v33[3] == 47)
      {
        time_t v39 = (char *)(v33 - 1);
        do
        {
          uint64_t v32 = v39;
          if (v39 < v22) {
            break;
          }
          --v39;
        }
        while (*v32 != 47);
        if (v32 <= v22)
        {
          strcpy(v22, v33 + 4);
          goto LABEL_35;
        }
        strcpy(v32, v33 + 3);
      }
    }
    if (*v32)
    {
      ++v32;
      continue;
    }
    break;
  }
  size_t v40 = strlen(v22);
  if (strcmp(v22, ".") && strncmp(v22, "./", 2uLL))
  {
    memset(v67, 0, sizeof(v67));
    sub_209974714(v67, "./", 2uLL);
    sub_209974714(v67, v22, v40);
    *((void *)v12 + 8) = 0;
    sub_2099771C0((uint64_t *)v12 + 7, (uint64_t)v67);
    sub_20997954C((uint64_t)v67);
    uint64_t v22 = (char *)*((void *)v12 + 7);
    size_t v40 = *((void *)v12 + 8);
  }
  unint64_t v41 = 0;
  while (2)
  {
    if (*v22 == 47)
    {
      unint64_t v41 = v22;
      goto LABEL_61;
    }
    if (*v22)
    {
LABEL_61:
      ++v22;
      continue;
    }
    break;
  }
  if (v41)
  {
    *unint64_t v41 = 0;
    unint64_t v42 = v41 + 1;
    *((void *)v12 + 8) = &v41[-*((void *)v12 + 7)];
    *((void *)v12 + 11) = 0;
    size_t v21 = strlen(v41 + 1);
    uint64_t v19 = (uint64_t *)(v12 + 80);
    uint64_t v20 = v42;
LABEL_64:
    sub_209974714(v19, v20, v21);
  }
  else
  {
    *((void *)v12 + 8) = v40;
    *((void *)v12 + 11) = 0;
    sub_2099771C0((uint64_t *)v12 + 10, (uint64_t)(v12 + 56));
    *((void *)v12 + 8) = 0;
    **((unsigned char **)v12 + 7) = 0;
  }
  uint64_t v43 = (const char *)archive_entry_symlink((uint64_t)a2);
  if (v43)
  {
    int v44 = (char *)v43;
    *((void *)v12 + 17) = 0;
    size_t v45 = strlen(v43);
    sub_209974714((uint64_t *)v12 + 16, v44, v45);
  }
  *((_DWORD *)v12 + 56) = archive_entry_nlink((uint64_t)a2);
  *((_WORD *)v12 + 114) = archive_entry_filetype((uint64_t)a2);
  *((_WORD *)v12 + 115) = archive_entry_mode((uint64_t)a2) & 0xFFF;
  *((void *)v12 + 30) = archive_entry_uid((uint64_t)a2);
  *((void *)v12 + 31) = archive_entry_gid((uint64_t)a2);
  unint64_t v46 = (const char *)archive_entry_uname(a2);
  if (v46)
  {
    uint64_t v47 = (char *)v46;
    *((void *)v12 + 20) = 0;
    size_t v48 = strlen(v46);
    sub_209974714((uint64_t *)v12 + 19, v47, v48);
  }
  uint64_t v49 = (const char *)archive_entry_gname(a2);
  if (v49)
  {
    unsigned int v50 = (char *)v49;
    *((void *)v12 + 23) = 0;
    size_t v51 = strlen(v49);
    sub_209974714((uint64_t *)v12 + 22, v50, v51);
  }
  uint64_t v52 = archive_entry_fflags_text(a2);
  if (v52)
  {
    unsigned int v53 = v52;
    *((void *)v12 + 26) = 0;
    size_t v54 = strlen(v52);
    sub_209974714((uint64_t *)v12 + 25, v53, v54);
  }
  archive_entry_fflags((uint64_t)a2, (void *)v12 + 34, (void *)v12 + 35);
  *((void *)v12 + 32) = archive_entry_mtime((uint64_t)a2);
  *((void *)v12 + 33) = archive_entry_mtime_nsec((uint64_t)a2);
  *((_DWORD *)v12 + 72) = archive_entry_rdevmajor((uint64_t)a2);
  *((_DWORD *)v12 + 73) = archive_entry_rdevminor(a2);
  *((_DWORD *)v12 + 74) = archive_entry_devmajor((uint64_t)a2);
  *((_DWORD *)v12 + 75) = archive_entry_devminor(a2);
  *((void *)v12 + 38) = archive_entry_ino((uint64_t)a2);
  *((void *)v12 + 29) = archive_entry_size((uint64_t)a2);
  int v55 = *((unsigned __int16 *)v12 + 114);
  if (v55 == 0x8000)
  {
    uint64_t v59 = malloc_type_calloc(1uLL, 0xD0uLL, 0x10000400F93440CuLL);
    *((void *)v12 + 6) = v59;
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t result = 0;
      *uint64_t v60 = 0;
      goto LABEL_83;
    }
    goto LABEL_81;
  }
  if (v55 != 0x4000)
  {
    uint64_t result = 0;
    goto LABEL_83;
  }
  uint64_t v56 = malloc_type_calloc(1uLL, 0x30uLL, 0x10E004059D07AFEuLL);
  *((void *)v12 + 5) = v56;
  if (!v56)
  {
LABEL_81:
    sub_2099D1854((void **)v12);
    archive_set_error(a1, 12, "Can't allocate memory for a mtree entry", v61, v62, v63, v64, v65, v66);
    int v12 = 0;
    goto LABEL_82;
  }
  sub_20997D154(v56, (uint64_t)&off_26BD73B30);
  uint64_t result = 0;
  uint64_t v58 = *((void *)v12 + 5);
  *(void *)(v58 + 16) = 0;
  v58 += 16;
  *(void *)(v58 + 8) = v58;
  *(void *)(v58 + 16) = 0;
LABEL_83:
  *a3 = v12;
  return result;
}

uint64_t sub_2099D1EEC(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a2 + 80), *(const char **)(a1 + 80));
}

uint64_t sub_2099D1EFC(uint64_t a1, char *__s1)
{
  return strcmp(__s1, *(const char **)(a1 + 80));
}

uint64_t sub_2099D1F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void *)(a1 + 264);
  if (*(void *)(a2 + 40))
  {
    if (*(_DWORD *)(v10 + 216))
    {
      if (!*(_DWORD *)(v10 + 956)) {
        sub_2099C4050((uint64_t *)(v10 + 88), 10);
      }
      uint64_t v11 = (void **)(v10 + 88);
      if (*(void *)(a2 + 56)) {
        sub_2099C7760(v11, "# %s/%s\n", a3, a4, a5, a6, a7, a8, *(char **)(a2 + 56));
      }
      else {
        sub_2099C7760(v11, "# %s\n", a3, a4, a5, a6, a7, a8, *(char **)(a2 + 80));
      }
    }
    if (*(_DWORD *)(v10 + 964)) {
      sub_2099D24FC(v10, a2, a3, a4, a5, a6, a7, a8);
    }
  }
  *(void *)(v10 + 72) = 0;
  int v12 = *(_DWORD *)(v10 + 216);
  if (*(_DWORD *)(v10 + 960) | v12) {
    uint64_t v13 = (uint64_t *)(v10 + 64);
  }
  else {
    uint64_t v13 = (uint64_t *)(v10 + 88);
  }
  if (!v12)
  {
    uint64_t v14 = *(unsigned __int8 **)(a2 + 56);
    if (v14)
    {
      sub_2099D2AF8(v13, v14);
      sub_2099C4050(v13, 47);
    }
  }
  sub_2099D2AF8(v13, *(unsigned __int8 **)(a2 + 80));
  int v21 = *(_DWORD *)(v10 + 952);
  int v22 = *(_DWORD *)(v10 + 136);
  if (v22)
  {
    if ((v22 & 0x30) != 0 && *(void *)(v10 + 152) == *(void *)(a2 + 248)) {
      v21 &= 0xFFFFFFCF;
    }
    if ((v22 & 0x300000) != 0 && *(void *)(v10 + 144) == *(void *)(a2 + 240)) {
      v21 &= 0xFFCFFFFF;
    }
    if ((v22 & 8) != 0
      && *(void *)(v10 + 168) == *(void *)(a2 + 272)
      && *(void *)(v10 + 176) == *(void *)(a2 + 280))
    {
      v21 &= ~8u;
    }
    if ((v22 & 0x200) != 0 && *(unsigned __int16 *)(v10 + 160) == *(unsigned __int16 *)(a2 + 230)) {
      v21 &= ~0x200u;
    }
    HIDWORD(v24) = *(unsigned __int16 *)(a2 + 228);
    LODWORD(v24) = HIDWORD(v24) - 4096;
    unsigned int v23 = v24 >> 12;
    if (v23 > 0xB) {
      goto LABEL_107;
    }
    if (((1 << v23) & 0xA23) != 0) {
      goto LABEL_32;
    }
    if (v23 == 3)
    {
      if ((v22 & 0x80000) == 0) {
        goto LABEL_32;
      }
      int v32 = 0x4000;
    }
    else
    {
LABEL_107:
      if ((v22 & 0x80000) == 0) {
        goto LABEL_32;
      }
      int v32 = 0x8000;
    }
    if (*(unsigned __int16 *)(v10 + 132) == v32) {
      v21 &= ~0x80000u;
    }
  }
LABEL_32:
  if ((v21 & 0x400) != 0 && *(_DWORD *)(a2 + 224) != 1 && *(_WORD *)(a2 + 228) != 0x4000) {
    sub_2099C7760((void **)v13, " nlink=%u", v15, v16, v17, v18, v19, v20, (char *)*(unsigned int *)(a2 + 224));
  }
  if ((v21 & 0x20) != 0 && *(void *)(a2 + 184))
  {
    sub_2099C4040(v13, " gname=");
    sub_2099D2AF8(v13, *(unsigned __int8 **)(a2 + 176));
  }
  if ((v21 & 0x200000) != 0 && *(void *)(a2 + 160))
  {
    sub_2099C4040(v13, " uname=");
    sub_2099D2AF8(v13, *(unsigned __int8 **)(a2 + 152));
  }
  if ((v21 & 8) != 0)
  {
    if (*(void *)(a2 + 208))
    {
      sub_2099C4040(v13, " flags=");
      sub_2099D2AF8(v13, *(unsigned __int8 **)(a2 + 200));
    }
    else if (*(_DWORD *)(v10 + 128) && (*(unsigned char *)(v10 + 136) & 8) != 0)
    {
      sub_2099C4040(v13, " flags=none");
    }
  }
  if ((v21 & 0x40000) != 0)
  {
    sub_2099C7760((void **)v13, " time=%jd.%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 256));
    if ((v21 & 0x200) == 0)
    {
LABEL_47:
      if ((v21 & 0x10) == 0) {
        goto LABEL_48;
      }
      goto LABEL_57;
    }
  }
  else if ((v21 & 0x200) == 0)
  {
    goto LABEL_47;
  }
  sub_2099C7760((void **)v13, " mode=%o", v15, v16, v17, v18, v19, v20, (char *)*(unsigned __int16 *)(a2 + 230));
  if ((v21 & 0x10) == 0)
  {
LABEL_48:
    if ((v21 & 0x100000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_58;
  }
LABEL_57:
  sub_2099C7760((void **)v13, " gid=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 248));
  if ((v21 & 0x100000) == 0)
  {
LABEL_49:
    if ((v21 & 0x4000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_59;
  }
LABEL_58:
  sub_2099C7760((void **)v13, " uid=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 240));
  if ((v21 & 0x4000000) == 0)
  {
LABEL_50:
    if ((v21 & 0x8000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_59:
  sub_2099C7760((void **)v13, " inode=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 304));
  if ((v21 & 0x8000000) != 0) {
LABEL_51:
  }
    sub_2099C7760((void **)v13, " resdevice=native,%ju,%ju", v15, v16, v17, v18, v19, v20, (char *)*(int *)(a2 + 296));
LABEL_52:
  HIDWORD(v25) = *(unsigned __int16 *)(a2 + 228);
  LODWORD(v25) = HIDWORD(v25) - 4096;
  switch((v25 >> 12))
  {
    case 0u:
      if ((v21 & 0x80000) != 0)
      {
        uint64_t v26 = " type=fifo";
        break;
      }
      goto LABEL_84;
    case 1u:
      if ((v21 & 0x80000) == 0) {
        goto LABEL_75;
      }
      uint64_t v27 = " type=char";
      goto LABEL_74;
    case 3u:
      if ((v21 & 0x80000) == 0) {
        goto LABEL_84;
      }
      uint64_t v26 = " type=dir";
      break;
    case 5u:
      if ((v21 & 0x80000) != 0)
      {
        uint64_t v27 = " type=block";
LABEL_74:
        sub_2099C4040(v13, v27);
      }
LABEL_75:
      if ((v21 & 2) != 0) {
        sub_2099C7760((void **)v13, " device=native,%ju,%ju", v15, v16, v17, v18, v19, v20, (char *)*(int *)(a2 + 288));
      }
      goto LABEL_84;
    case 9u:
      if ((v21 & 0x80000) != 0) {
        sub_2099C4040(v13, " type=link");
      }
      if ((v21 & 0x10000) != 0)
      {
        sub_2099C4040(v13, " link=");
        sub_2099D2AF8(v13, *(unsigned __int8 **)(a2 + 128));
      }
      goto LABEL_84;
    case 0xBu:
      if ((v21 & 0x80000) == 0) {
        goto LABEL_84;
      }
      uint64_t v26 = " type=socket";
      break;
    default:
      if ((v21 & 0x80000) != 0) {
        sub_2099C4040(v13, " type=file");
      }
      if ((v21 & 0x8000) != 0) {
        sub_2099C7760((void **)v13, " size=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 232));
      }
      goto LABEL_84;
  }
  sub_2099C4040(v13, v26);
LABEL_84:
  unint64_t v28 = *(char **)(a2 + 48);
  if (!v28) {
    goto LABEL_92;
  }
  int v29 = *(_DWORD *)v28;
  if (*(_DWORD *)v28)
  {
    sub_2099C7760((void **)v13, " cksum=%ju", v15, v16, v17, v18, v19, v20, (char *)*((unsigned int *)v28 + 1));
    int v29 = *(_DWORD *)v28;
    if ((*(_DWORD *)v28 & 0x100) == 0)
    {
LABEL_87:
      if ((v29 & 0x4000) == 0) {
        goto LABEL_88;
      }
      goto LABEL_100;
    }
  }
  else if ((v29 & 0x100) == 0)
  {
    goto LABEL_87;
  }
  sub_2099C4040(v13, " md5digest=");
  sub_2099D2EAC(v13, v28 + 8, 16);
  int v29 = *(_DWORD *)v28;
  if ((*(_DWORD *)v28 & 0x4000) == 0)
  {
LABEL_88:
    if ((v29 & 0x800000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_101;
  }
LABEL_100:
  sub_2099C4040(v13, " sha1digest=");
  sub_2099D2EAC(v13, v28 + 44, 20);
  int v29 = *(_DWORD *)v28;
  if ((*(_DWORD *)v28 & 0x800000) == 0)
  {
LABEL_89:
    if ((v29 & 0x1000000) == 0) {
      goto LABEL_90;
    }
LABEL_102:
    sub_2099C4040(v13, " sha384digest=");
    sub_2099D2EAC(v13, v28 + 96, 48);
    if ((*(_DWORD *)v28 & 0x2000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
LABEL_101:
  sub_2099C4040(v13, " sha256digest=");
  sub_2099D2EAC(v13, v28 + 64, 32);
  int v29 = *(_DWORD *)v28;
  if ((*(_DWORD *)v28 & 0x1000000) != 0) {
    goto LABEL_102;
  }
LABEL_90:
  if ((v29 & 0x2000000) != 0)
  {
LABEL_91:
    sub_2099C4040(v13, " sha512digest=");
    sub_2099D2EAC(v13, v28 + 144, 64);
  }
LABEL_92:
  sub_2099C4050(v13, 10);
  if (*(_DWORD *)(v10 + 960) || *(_DWORD *)(v10 + 216)) {
    sub_2099D2BD0(v10);
  }
  unint64_t v30 = *(void *)(v10 + 96);
  if (v30 <= 0x8000) {
    return 0;
  }
  uint64_t result = sub_2099C9728(a1, *(void *)(v10 + 88), v30);
  *(void *)(v10 + 96) = 0;
  return result;
}

void sub_2099D24FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  int v9 = *(_DWORD *)(a1 + 952);
  unsigned int v10 = v9 & 0x380238;
  int v11 = *(_DWORD *)(a1 + 136);
  if (*(_DWORD *)(a1 + 128))
  {
    uint64_t v12 = *(void *)(a1 + 184);
    if (!v12
      || (int v13 = v9 & 0x300238, (v11 & 0x300000) != 0)
      && (*(int *)(v12 + 24) < 2 || *(void *)(a1 + 144) == *(void *)(*(void *)(v12 + 16) + 240)))
    {
      int v13 = *(_DWORD *)(a1 + 952) & 0x238;
    }
    uint64_t v14 = *(void *)(a1 + 192);
    if (!v14
      || (v11 & 0x30) != 0
      && (*(int *)(v14 + 24) < 2 || *(void *)(a1 + 152) == *(void *)(*(void *)(v14 + 16) + 248)))
    {
      v13 &= 0x300208u;
    }
    uint64_t v15 = *(void *)(a1 + 200);
    if (!v15
      || (v11 & 0x200) != 0
      && (*(int *)(v15 + 24) < 2
       || *(unsigned __int16 *)(a1 + 160) == *(unsigned __int16 *)(*(void *)(v15 + 16) + 230)))
    {
      v13 &= ~0x200u;
    }
    uint64_t v16 = *(void *)(a1 + 208);
    if (!v16
      || (v11 & 8) != 0
      && (*(int *)(v16 + 24) < 2
       || (uint64_t v17 = *(void *)(v16 + 16), *(void *)(v17 + 272) == *(void *)(a1 + 168))
       && *(void *)(v17 + 280) == *(void *)(a1 + 176)))
    {
      int v18 = v10;
      unsigned int v10 = v13 & 0xFFFFFFF7;
    }
    else
    {
      int v18 = v10;
      unsigned int v10 = v13;
    }
  }
  else
  {
    int v19 = v9 & 0x80238;
    if (*(void *)(a1 + 184)) {
      int v19 = v9 & 0x380238;
    }
    if (!*(void *)(a1 + 192)) {
      v19 &= 0x380208u;
    }
    if (!*(void *)(a1 + 200)) {
      v19 &= 0x380038u;
    }
    if (*(void *)(a1 + 208)) {
      int v18 = v19;
    }
    else {
      int v18 = v19 & 0x380230;
    }
  }
  if ((v10 & v18 & 0x80000) != 0)
  {
    int v20 = *(_DWORD *)(a1 + 956);
    if (v20) {
      int v21 = " type=dir";
    }
    else {
      int v21 = " type=file";
    }
    if (v20) {
      __int16 v22 = 0x4000;
    }
    else {
      __int16 v22 = 0x8000;
    }
    sub_2099C4040((uint64_t *)&v36, v21);
    *(_WORD *)(a1 + 132) = v22;
  }
  if ((v10 & v18 & 0x200000) != 0)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 184) + 16) + 160))
    {
      sub_2099C4040((uint64_t *)&v36, " uname=");
      sub_2099D2AF8((uint64_t *)&v36, *(unsigned __int8 **)(*(void *)(*(void *)(a1 + 184) + 16) + 152));
    }
    else
    {
      v18 &= ~0x200000u;
      if ((v11 & 0x200000) != 0) {
        sub_2099C4040((uint64_t *)&v33, " uname");
      }
    }
  }
  if ((v18 & v10 & 0x100000) != 0)
  {
    unsigned int v23 = *(char **)(*(void *)(*(void *)(a1 + 184) + 16) + 240);
    *(void *)(a1 + 144) = v23;
    sub_2099C7760((void **)&v36, " uid=%jd", a3, a4, a5, a6, a7, a8, v23);
  }
  if ((v18 & v10 & 0x20) != 0)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 192) + 16) + 184))
    {
      sub_2099C4040((uint64_t *)&v36, " gname=");
      sub_2099D2AF8((uint64_t *)&v36, *(unsigned __int8 **)(*(void *)(*(void *)(a1 + 192) + 16) + 176));
    }
    else
    {
      v18 &= ~0x20u;
      if ((v11 & 0x20) != 0) {
        sub_2099C4040((uint64_t *)&v33, " gname");
      }
    }
  }
  __int16 v24 = v18 & v10;
  if ((v24 & 0x10) != 0)
  {
    unint64_t v25 = *(char **)(*(void *)(*(void *)(a1 + 192) + 16) + 248);
    *(void *)(a1 + 152) = v25;
    sub_2099C7760((void **)&v36, " gid=%jd", a3, a4, a5, a6, a7, a8, v25);
    if ((v24 & 0x200) == 0)
    {
LABEL_55:
      if ((v24 & 8) == 0) {
        goto LABEL_63;
      }
      goto LABEL_59;
    }
  }
  else if ((v24 & 0x200) == 0)
  {
    goto LABEL_55;
  }
  uint64_t v26 = (char *)*(unsigned __int16 *)(*(void *)(*(void *)(a1 + 200) + 16) + 230);
  *(_WORD *)(a1 + 160) = (_WORD)v26;
  sub_2099C7760((void **)&v36, " mode=%o", a3, a4, a5, a6, a7, a8, v26);
  if ((v24 & 8) == 0) {
    goto LABEL_63;
  }
LABEL_59:
  if (*(void *)(*(void *)(*(void *)(a1 + 208) + 16) + 208))
  {
    sub_2099C4040((uint64_t *)&v36, " flags=");
    sub_2099D2AF8((uint64_t *)&v36, *(unsigned __int8 **)(*(void *)(*(void *)(a1 + 208) + 16) + 200));
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(*(void *)(*(void *)(a1 + 208) + 16) + 272);
  }
  else
  {
    v18 &= ~8u;
    if ((v11 & 8) != 0) {
      sub_2099C4040((uint64_t *)&v33, " flags");
    }
  }
LABEL_63:
  if (v34) {
    sub_2099C7760((void **)(a1 + 88), "/unset%s\n", a3, a4, a5, a6, a7, a8, v33);
  }
  sub_20997954C((uint64_t)&v33);
  if (v37) {
    sub_2099C7760((void **)(a1 + 88), "/set%s\n", v27, v28, v29, v30, v31, v32, v36);
  }
  sub_20997954C((uint64_t)&v36);
  *(_DWORD *)(a1 + 136) = v18;
  *(_DWORD *)(a1 + 128) = 1;
}

uint64_t sub_2099D28D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 264);
  unsigned int v10 = *(char **)(a2 + 56);
  if (v10)
  {
    if (*(_DWORD *)(v9 + 960))
    {
      int v12 = *(_DWORD *)(v9 + 220);
      if (v12 >= 1)
      {
        if (4 * v12 <= 1) {
          int v13 = 1;
        }
        else {
          int v13 = 4 * v12;
        }
        do
        {
          sub_2099C4050((uint64_t *)(v9 + 88), 32);
          --v13;
        }
        while (v13);
        unsigned int v10 = *(char **)(a2 + 56);
      }
    }
    sub_2099C7760((void **)(v9 + 88), "# %s/%s\n", a3, a4, a5, a6, a7, a8, v10);
  }
  if (*(_DWORD *)(v9 + 960))
  {
    *(void *)(v9 + 72) = 0;
    if (*(_DWORD *)(v9 + 956)) {
      size_t v14 = 3;
    }
    else {
      size_t v14 = 4;
    }
    sub_209974714((uint64_t *)(v9 + 64), "..\n\n", v14);
    sub_2099D2BD0(v9);
  }
  else
  {
    if (*(_DWORD *)(v9 + 956)) {
      size_t v15 = 3;
    }
    else {
      size_t v15 = 4;
    }
    sub_209974714((uint64_t *)(v9 + 88), "..\n\n", v15);
  }
  unint64_t v16 = *(void *)(v9 + 96);
  if (v16 <= 0x8000) {
    return 0;
  }
  uint64_t result = sub_2099C9728(a1, *(void *)(v9 + 88), v16);
  *(void *)(v9 + 96) = 0;
  return result;
}

uint64_t sub_2099D29EC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    int v4 = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v4 + 1;
    if ((uint64_t *)*a1 != a2)
    {
      unint64_t v5 = (uint64_t *)*a2;
      if (*(_DWORD *)(*a2 + 24) <= v4)
      {
        unint64_t v6 = (uint64_t *)*a2;
        do
        {
          int v7 = *((_DWORD *)v6 + 6);
          if (v7 > v4) {
            break;
          }
          unint64_t v6 = (uint64_t *)*v6;
        }
        while (v6);
        v5[1] = a2[1];
        uint64_t v8 = (void *)a2[1];
        if (v8) {
          *uint64_t v8 = v5;
        }
        if (v7 <= v4)
        {
          uint64_t v11 = 0;
          *a2 = 0;
          a2[1] = *a1;
          *a1 = (uint64_t)a2;
          unsigned int v10 = (uint64_t **)a2[1];
          goto LABEL_17;
        }
        uint64_t v9 = v6[1];
        *a2 = (uint64_t)v6;
        a2[1] = v9;
        v6[1] = (uint64_t)a2;
        unsigned int v10 = (uint64_t **)a2[1];
        if (v10)
        {
          uint64_t v11 = 0;
LABEL_17:
          *unsigned int v10 = a2;
          return v11;
        }
      }
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
  size_t v14 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
  if (!v14) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = 0;
  *size_t v14 = a3;
  v14[1] = 0;
  *((_DWORD *)v14 + 6) = 1;
  v14[2] = a4;
  *(void *)(a3 + 8) = v14;
  return v11;
}

uint64_t *sub_2099D2AF8(uint64_t *result, unsigned __int8 *a2)
{
  unsigned int v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = result;
    int v4 = a2 + 1;
    unint64_t v5 = a2;
    do
    {
      if (!byte_2099EC250[v2])
      {
        if (v4 - 1 != a2)
        {
          sub_209974714(v3, a2, v5 - a2);
          unsigned int v2 = *(v4 - 1);
        }
        v7[0] = 92;
        v7[1] = (v2 >> 6) | 0x30;
        v7[2] = (v2 >> 3) & 7 | 0x30;
        v7[3] = v2 & 7 | 0x30;
        uint64_t result = sub_209974714(v3, v7, 4uLL);
        a2 = v4;
      }
      unsigned int v6 = *v4++;
      unsigned int v2 = v6;
      ++v5;
    }
    while (v6);
    if (v4 - 1 != a2) {
      return sub_209974714(v3, a2, v5 - a2);
    }
  }
  return result;
}

uint64_t *sub_2099D2BD0(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 216))
  {
    int v2 = *(_DWORD *)(a1 + 960);
    int v3 = *(_DWORD *)(a1 + 220);
    int v4 = 4 * (v3 != 0);
    int v5 = 4 * v3;
    if (v2) {
      unsigned int v6 = 0;
    }
    else {
      unsigned int v6 = v4;
    }
    if (v2) {
      int v7 = v5;
    }
    else {
      int v7 = 0;
    }
  }
  else
  {
    unsigned int v6 = 0;
    int v7 = 0;
  }
  uint64_t v8 = *(char **)(a1 + 64);
  uint64_t v9 = v8 - 1;
  do
    int v10 = *++v9;
  while (v10 == 32);
  uint64_t v11 = strchr(v9, 32);
  int v12 = v7 + v6;
  if (v11)
  {
    int v13 = v11;
    size_t v14 = 0;
    char v15 = 0;
    unint64_t v16 = (uint64_t *)(a1 + 88);
    while ((v15 & 1) != 0)
    {
      if ((uint64_t)&v13[v7 - (void)v8] > 62)
      {
        if (!v14) {
          size_t v14 = v13;
        }
        sub_209974714(v16, v8, v14 - v8);
        sub_209974714(v16, " \\\n", 3uLL);
        if (v7 >= -15)
        {
          int v20 = ((v7 + 15) & ~((v7 + 15) >> 31)) + 1;
          do
          {
            sub_2099C4050(v16, 32);
            --v20;
          }
          while (v20);
        }
        int v13 = 0;
        uint64_t v17 = v14 + 1;
LABEL_34:
        uint64_t v8 = v17;
        goto LABEL_35;
      }
      uint64_t v17 = v13 + 1;
LABEL_35:
      size_t v14 = v13;
      int v13 = strchr(v17, 32);
      char v15 = 1;
      if (!v13)
      {
        if (v14 && strlen(v8) + v7 >= 0x3F)
        {
          sub_209974714((uint64_t *)(a1 + 88), v8, v14 - v8);
          sub_209974714((uint64_t *)(a1 + 88), " \\\n", 3uLL);
          if (v7 >= -15)
          {
            int v22 = ((v7 + 15) & ~((v7 + 15) >> 31)) + 1;
            do
            {
              sub_2099C4050((uint64_t *)(a1 + 88), 32);
              --v22;
            }
            while (v22);
          }
          uint64_t v8 = v14 + 1;
        }
        goto LABEL_46;
      }
    }
    if (v12 >= 1)
    {
      unsigned int v18 = v7 + v6;
      do
      {
        sub_2099C4050(v16, 32);
        --v18;
      }
      while (v18);
    }
    sub_209974714(v16, v8, v13 - v8);
    if (v13 - v8 + v6 < 16)
    {
      if ((int)(v13 - v8 + v6) <= 15)
      {
        int v21 = v6 - 1 + v13 - v8;
        do
        {
          sub_2099C4050(v16, 32);
          ++v21;
        }
        while (v21 < 15);
      }
    }
    else
    {
      sub_209974714(v16, " \\\n", 3uLL);
      if (v7 >= -15)
      {
        int v19 = ((v7 + 15) & ~((v7 + 15) >> 31)) + 1;
        do
        {
          sub_2099C4050(v16, 32);
          --v19;
        }
        while (v19);
      }
    }
    uint64_t v17 = v13 + 1;
    int v13 = 0;
    goto LABEL_34;
  }
  if (v12 >= 1)
  {
    do
    {
      sub_2099C4050((uint64_t *)(a1 + 88), 32);
      --v12;
    }
    while (v12);
  }
  sub_2099C4040((uint64_t *)(a1 + 88), v8);
  v8 += strlen(v8);
LABEL_46:
  uint64_t result = sub_2099C4040((uint64_t *)(a1 + 88), v8);
  *(void *)(a1 + 72) = 0;
  return result;
}

uint64_t *sub_2099D2EAC(uint64_t *result, char *a2, int a3)
{
  if (a3 >= 1)
  {
    int v4 = result;
    uint64_t v5 = a3;
    do
    {
      sub_2099C4050(v4, a0123456789abcd_1[(unint64_t)*a2 >> 4]);
      char v6 = *a2++;
      uint64_t result = sub_2099C4050(v4, a0123456789abcd_1[v6 & 0xF]);
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t archive_read_support_filter_all(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C(a1, 14594245, 1, "archive_read_support_filter_all", a5, a6, a7, a8);
  if (result != -30)
  {
    archive_read_support_filter_bzip2(a1);
    archive_read_support_filter_compress(a1);
    archive_read_support_filter_gzip(a1);
    archive_read_support_filter_lzip(a1);
    archive_read_support_filter_lzma(a1);
    archive_read_support_filter_xz(a1);
    archive_read_support_filter_uu(a1);
    archive_read_support_filter_rpm(a1);
    archive_read_support_filter_lrzip(a1);
    archive_read_support_filter_lzop(a1);
    archive_read_support_filter_grzip(a1);
    archive_read_support_filter_lz4(a1);
    archive_read_support_filter_zstd(a1);
    archive_clear_error((uint64_t)a1);
    return 0;
  }
  return result;
}

BOOL sub_2099D2FD8(unsigned __int8 *a1, unsigned __int8 *a2, unsigned int a3)
{
  if (!a1 || (int v3 = *a1) == 0)
  {
    if (a2) {
      return *a2 == 0;
    }
    return 1;
  }
  if (!a2) {
    return 0;
  }
  BOOL v4 = v3 == 94;
  BOOL v5 = v3 == 94;
  if (v4) {
    char v6 = a1 + 1;
  }
  else {
    char v6 = a1;
  }
  if (v4) {
    uint64_t v7 = a3 & 0xFFFFFFFE;
  }
  else {
    uint64_t v7 = a3;
  }
  int v8 = *v6;
  if (v8 == 42) {
    goto LABEL_13;
  }
  if (v8 != 47)
  {
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = v6;
      goto LABEL_23;
    }
    while (1)
    {
      int v13 = *a2 == 47 ? a2 + 1 : a2;
      if (sub_2099D30F4(v6, v13, v7)) {
        break;
      }
      a2 = (unsigned __int8 *)strchr((char *)v13, 47);
      BOOL result = 0;
      if (!a2) {
        return result;
      }
    }
    return 1;
  }
  if (*a2 != 47) {
    return 0;
  }
LABEL_13:
  uint64_t v9 = &a1[v5 - 1];
  do
    int v10 = *++v9;
  while (v10 == 47);
  --a2;
  do
    int v11 = *++a2;
  while (v11 == 47);
LABEL_23:

  return sub_2099D30F4(v9, a2, v7);
}

BOOL sub_2099D30F4(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t i = a2;
  BOOL v5 = a1;
  if (*a2 == 46)
  {
    int v6 = a2[1];
    if (v6 == 47)
    {
      for (uint64_t i = a2 + 1; ; ++i)
      {
        if (v6 == 46)
        {
          int v6 = i[1];
          if (v6 != 47 && v6 != 0) {
            break;
          }
        }
        else
        {
          if (v6 != 47) {
            break;
          }
          LOBYTE(v6) = i[1];
        }
      }
    }
  }
  if (*a1 != 46) {
    goto LABEL_25;
  }
  int v8 = a1[1];
  if (v8 != 47) {
    goto LABEL_25;
  }
  BOOL v5 = a1 + 1;
  while (v8 != 46)
  {
    if (v8 != 47) {
      goto LABEL_25;
    }
    LOBYTE(v8) = v5[1];
LABEL_24:
    ++v5;
  }
  int v8 = v5[1];
  if (v8 == 47 || v8 == 0) {
    goto LABEL_24;
  }
LABEL_25:
  int v10 = (char)*v5;
  int v11 = *v5;
  if (v10 > 62)
  {
    if (v10 == 63)
    {
      int v17 = *i;
      unint64_t j = (char *)v5;
      goto LABEL_109;
    }
    if (v10 == 91)
    {
      unsigned int v18 = (char *)(v5 + 1);
      for (unint64_t j = (char *)(v5 + 1); ; ++j)
      {
        int v19 = *j;
        if (v19 == 92)
        {
          if (j[1]) {
            ++j;
          }
        }
        else
        {
          if (!*j) {
            goto LABEL_88;
          }
          if (v19 == 93)
          {
            int v21 = *v18;
            if (v21 == 94 || v21 == 33)
            {
              BOOL v22 = v18 >= j;
              if (v18 >= j) {
                unsigned int v18 = (char *)(v5 + 1);
              }
              else {
                unsigned int v18 = (char *)(v5 + 2);
              }
              int v23 = v22;
              int v17 = !v22;
            }
            else
            {
              int v17 = 0;
              int v23 = 1;
            }
            if (v18 >= j)
            {
LABEL_109:
              if (v17) {
                goto LABEL_110;
              }
              return 0;
            }
            char v24 = 0;
            int v25 = (char)*i;
            while (2)
            {
              int v26 = *v18;
              if (v26 == 92)
              {
                int v30 = *++v18;
                int v27 = v30;
              }
              else
              {
                int v27 = *v18;
                if (v26 == 45)
                {
                  if (!v24 || v18 == j - 1)
                  {
                    if (v27 == v25) {
                      goto LABEL_108;
                    }
                    LOBYTE(v27) = 0;
                  }
                  else
                  {
                    int v28 = v18[1];
                    if (v28 == 92)
                    {
                      unsigned __int8 v29 = v18[2];
                      v18 += 2;
                      LOBYTE(v28) = v29;
                    }
                    else
                    {
                      ++v18;
                    }
                    LOBYTE(v27) = 0;
                    if (v25 >= v24 && v25 <= (char)v28)
                    {
LABEL_108:
                      int v17 = v23;
                      goto LABEL_109;
                    }
                  }
                  goto LABEL_101;
                }
              }
              if (v27 == v25) {
                goto LABEL_108;
              }
LABEL_101:
              ++v18;
              char v24 = v27;
              if (v18 >= j) {
                goto LABEL_109;
              }
              continue;
            }
          }
        }
      }
    }
    if (v10 == 92)
    {
      unint64_t j = (char *)(v5 + 1);
      int v13 = *i;
      if (v5[1])
      {
        if (v5[1] == v13) {
          goto LABEL_110;
        }
      }
      else
      {
        unint64_t j = (char *)v5;
        if (v13 == 92) {
          goto LABEL_110;
        }
      }
      return 0;
    }
    goto LABEL_88;
  }
  if (v10 > 41)
  {
    if (v10 != 47)
    {
      if (v10 != 42) {
        goto LABEL_88;
      }
      while (v11 == 42)
      {
        char v31 = *++v5;
        LOBYTE(v11) = v31;
      }
      if (!(_BYTE)v11) {
        return 1;
      }
      if (*i)
      {
        do
        {
          int v32 = sub_2099D2FD8(v5, i, a3);
          BOOL result = v32 != 0;
          if (v32) {
            break;
          }
        }
        while (*++i);
        return result;
      }
      return 0;
    }
    int v14 = *i;
    if (v14 != 47 && v14 != 0) {
      return 0;
    }
    for (unint64_t j = (char *)(v5 - 1); ; ++j)
    {
      if (v11 == 46)
      {
        int v16 = j[2];
        if (j[2] && v16 != 47)
        {
LABEL_59:
          --i;
          while (1)
          {
            if (v14 == 46)
            {
              int v14 = i[2];
              if (v14 != 47 && v14 != 0)
              {
LABEL_69:
                if ((a3 & 2) != 0 && !(_BYTE)v11) {
                  return 1;
                }
LABEL_110:
                BOOL v5 = (unsigned __int8 *)(j + 1);
                ++i;
                goto LABEL_25;
              }
            }
            else
            {
              if (v14 != 47) {
                goto LABEL_69;
              }
              LOBYTE(v14) = i[2];
            }
            ++i;
          }
        }
      }
      else
      {
        if (v11 != 47) {
          goto LABEL_59;
        }
        LOBYTE(v16) = j[2];
      }
      LOBYTE(v11) = v16;
    }
  }
  if (v10 == 36)
  {
    if ((a3 & 2) != 0 && !v5[1])
    {
      for (k = i + 1; ; ++k)
      {
        int v36 = *(k - 1);
        if (v36 != 47)
        {
          if (v36 != 46) {
            break;
          }
          int v37 = *k;
          if (v37 != 47 && v37 != 0) {
            break;
          }
        }
      }
      return v36 == 0;
    }
    goto LABEL_88;
  }
  if (*v5)
  {
LABEL_88:
    unint64_t j = (char *)v5;
    if (v11 == *i) {
      goto LABEL_110;
    }
    return 0;
  }
  int v39 = *i;
  if (v39 != 47) {
    return v39 == 0;
  }
  if ((a3 & 2) != 0) {
    return 1;
  }
  size_t v40 = i + 1;
  LOBYTE(v41) = 47;
  while (2)
  {
    if (v41 != 46)
    {
      if (v41 != 47) {
        break;
      }
      LOBYTE(v41) = *v40;
      goto LABEL_138;
    }
    int v41 = *v40;
    if (v41 == 47 || v41 == 0)
    {
LABEL_138:
      ++v40;
      continue;
    }
    break;
  }
  int v39 = *(v40 - 1);
  return v39 == 0;
}

uint64_t archive_read_set_format(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t result = archive_read_support_format_by_code((int *)a1, a2, a3, a4, a5, a6, a7, a8);
  if ((result & 0x80000000) == 0)
  {
    if (*(void *)(a1 + 2472)) {
      int v16 = -20;
    }
    else {
      int v16 = 0;
    }
    switch(((a2 & 0xFF0000u) - 0x10000) >> 16)
    {
      case 0u:
        __s2[4] = 0;
        int v17 = 1869181027;
        goto LABEL_22;
      case 2u:
        int v17 = 7496052;
        goto LABEL_22;
      case 3u:
        strcpy(__s2, "iso9660");
        goto LABEL_23;
      case 4u:
        int v17 = 7367034;
        goto LABEL_22;
      case 5u:
        strcpy(&__s2[4], "y");
        int v17 = 1953525093;
        goto LABEL_22;
      case 6u:
        strcpy(__s2, "ar");
        goto LABEL_23;
      case 7u:
        strcpy(&__s2[4], "e");
        int v17 = 1701999725;
        goto LABEL_22;
      case 8u:
        int v17 = 7823730;
        goto LABEL_22;
      case 9u:
        int v17 = 7496056;
        goto LABEL_22;
      case 0xAu:
        int v17 = 6383724;
        goto LABEL_22;
      case 0xBu:
        int v17 = 6447459;
        goto LABEL_22;
      case 0xCu:
        int v17 = 7496050;
        goto LABEL_22;
      case 0xDu:
        __s2[4] = 0;
        int v17 = 1885960759;
        goto LABEL_22;
      case 0xEu:
        __s2[4] = 0;
        int v17 = 1668440439;
        goto LABEL_22;
      case 0xFu:
        __s2[4] = 0;
        int v17 = 896688498;
LABEL_22:
        *(_DWORD *)__s2 = v17;
LABEL_23:
        uint64_t v18 = 0;
        *(void *)(a1 + 2472) = a1 + 1064;
        break;
      default:
        archive_set_error((_DWORD *)a1, 22, "Invalid format code specified", v11, v12, v13, v14, v15, v26);
        return 4294967266;
    }
    do
    {
      int v19 = *(const char **)(a1 + v18 + 1072);
      if (!v19) {
        goto LABEL_29;
      }
      if (!strcmp(*(const char **)(a1 + v18 + 1072), __s2)) {
        goto LABEL_28;
      }
      *(void *)(a1 + 2472) = a1 + v18 + 1152;
      v18 += 88;
    }
    while (v18 != 1408);
    int v19 = *(const char **)(a1 + v18 + 1072);
    if (!v19)
    {
LABEL_29:
      archive_set_error((_DWORD *)a1, 22, "Internal error: Unable to set format", v11, v12, v13, v14, v15, v26);
      int v19 = *(const char **)(*(void *)(a1 + 2472) + 8);
      int v20 = -30;
      goto LABEL_31;
    }
LABEL_28:
    if (strcmp(v19, __s2)) {
      goto LABEL_29;
    }
    int v20 = 0;
LABEL_31:
    if (!sub_209975A2C(v19))
    {
      archive_set_error((_DWORD *)a1, -1, "Format not allow-listed in entitlements", v21, v22, v23, v24, v25, v26);
      int v20 = -30;
    }
    if (v20 >= v16) {
      return v16;
    }
    else {
      return v20;
    }
  }
  return result;
}

uint64_t sub_2099D37C4(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  if (*a3 < 0)
  {
    int v6 = (const char *)sub_2099946E0(a1, a2, a3);
    if (!v6) {
      return 4294967276;
    }
  }
  else
  {
    int v6 = 0;
  }
  archive_entry_acl_clear((uint64_t)a2);
  if (*a3 < 0)
  {
    if (*(unsigned char *)(a1 + 169)) {
      file = acl_get_file(v6, ACL_TYPE_EXTENDED);
    }
    else {
      file = acl_get_link_np(v6, ACL_TYPE_EXTENDED);
    }
  }
  else
  {
    file = acl_get_fd_np(*a3, ACL_TYPE_EXTENDED);
  }
  uint64_t v9 = file;
  if (!file) {
    return 0;
  }
  acl_tag_t tag_type_p = ACL_UNDEFINED_TAG;
  flagset_p[0] = 0;
  acl_permset_t permset_p = 0;
  acl_entry_t entry_p = 0;
  int entry = acl_get_entry(file, 0, &entry_p);
  if (entry == -1)
  {
    uint64_t v11 = "Failed to get first ACL entry";
    goto LABEL_46;
  }
  if (entry)
  {
LABEL_42:
    acl_free(v9);
    uint64_t v8 = 0;
    goto LABEL_47;
  }
  uint64_t v11 = "Failed to get ACL tag type";
  while (1)
  {
    if (acl_get_tag_type(entry_p, &tag_type_p)) {
      goto LABEL_46;
    }
    if (tag_type_p == ACL_EXTENDED_ALLOW) {
      break;
    }
    if (tag_type_p == ACL_EXTENDED_DENY)
    {
      int v12 = 2048;
      goto LABEL_19;
    }
LABEL_22:
    if (acl_get_entry(v9, -1, &entry_p)) {
      goto LABEL_42;
    }
  }
  int v12 = 1024;
LABEL_19:
  qualifier = (const unsigned __int8 *)acl_get_qualifier(entry_p);
  if (!qualifier) {
    goto LABEL_22;
  }
  uint64_t v14 = (unsigned __int8 *)qualifier;
  *(void *)id_type = 0;
  if (mbr_uuid_to_id(qualifier, (id_t *)&id_type[1], id_type))
  {
LABEL_21:
    acl_free(v14);
    goto LABEL_22;
  }
  if (id_type[0] != 1)
  {
    if (!id_type[0])
    {
      int v21 = id_type[1];
      uint64_t disk_uname = archive_read_disk_uname(a1, id_type[1], v15, v16, v17, v18, v19, v20);
      int v57 = 10001;
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  int v21 = id_type[1];
  uint64_t disk_uname = archive_read_disk_gname(a1, id_type[1], v15, v16, v17, v18, v19, v20);
  int v57 = 10003;
LABEL_28:
  acl_free(v14);
  if (acl_get_flagset_np(entry_p, flagset_p))
  {
    uint64_t v11 = "Failed to get flagset from a NFSv4 ACL entry";
  }
  else
  {
    int v55 = (char *)disk_uname;
    uint64_t v23 = 0;
    unsigned int v24 = 0;
    do
    {
      int flag_np = acl_get_flag_np(flagset_p[0], (acl_flag_t)dword_2099EC750[v23 + 1]);
      if (flag_np)
      {
        if (flag_np == -1)
        {
          uint64_t v11 = "Failed to check flag in a NFSv4 ACL flagset";
          goto LABEL_46;
        }
        v24 |= dword_2099EC750[v23];
      }
      v23 += 2;
    }
    while (v23 != 10);
    if (!acl_get_permset(entry_p, &permset_p))
    {
      uint64_t v26 = 0;
      while (1)
      {
        int perm_np = acl_get_perm_np(permset_p, (acl_perm_t)dword_2099EC778[v26 + 1]);
        if (perm_np)
        {
          if (perm_np == -1)
          {
            uint64_t v11 = "Failed to check permission in an ACL permission set";
            goto LABEL_46;
          }
          v24 |= dword_2099EC778[v26];
        }
        v26 += 2;
        if (v26 == 34)
        {
          archive_entry_acl_add_entry((uint64_t)a2, v12, v24, v57, v21, v55);
          goto LABEL_22;
        }
      }
    }
    uint64_t v11 = "Failed to get ACL permission set";
  }
LABEL_46:
  uint64_t v28 = __error();
  archive_set_error((_DWORD *)a1, *v28, v11, v29, v30, v31, v32, v33, v55);
  acl_free(v9);
  uint64_t v34 = __error();
  archive_set_error((_DWORD *)a1, *v34, "Couldn't translate NFSv4 ACLs", v35, v36, v37, v38, v39, v56);
  uint64_t v8 = 4294967276;
LABEL_47:
  if ((archive_entry_acl_types((uint64_t)a2) & 0x3C00) == 0) {
    return v8;
  }
  uint64_t v66 = 0x92400000277BLL;
  *(_OWORD *)flagset_p = xmmword_2099EC800;
  long long v63 = unk_2099EC810;
  long long v64 = xmmword_2099EC820;
  long long v65 = unk_2099EC830;
  __int16 v40 = archive_entry_mode((uint64_t)a2);
  if ((v40 & 4) != 0)
  {
    int v41 = 37448;
    HIDWORD(v66) = 37448;
    if ((v40 & 2) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  int v41 = 37440;
  if ((v40 & 2) != 0)
  {
LABEL_52:
    v41 |= 0x30u;
    HIDWORD(v66) = v41;
  }
LABEL_53:
  if (v40)
  {
    HIDWORD(v66) = v41 | 1;
    if ((v40 & 0x20) != 0) {
      goto LABEL_59;
    }
LABEL_55:
    int v42 = 37440;
    if ((v40 & 4) != 0)
    {
      int v44 = 8;
      unsigned int v45 = 1;
      int v43 = 8;
      goto LABEL_61;
    }
    int v43 = 0;
    if ((v40 & 0x10) != 0) {
      goto LABEL_57;
    }
LABEL_62:
    if ((v40 & 2) != 0)
    {
      v43 |= 0x30u;
      LODWORD(v64) = v43;
    }
  }
  else
  {
    if ((v40 & 0x20) == 0) {
      goto LABEL_55;
    }
LABEL_59:
    int v43 = 0;
    int v44 = 37448;
    unsigned int v45 = 2;
    int v42 = 37448;
LABEL_61:
    LODWORD(flagset_p[6 * v45 / 8 + 1]) = v44;
    if ((v40 & 0x10) == 0) {
      goto LABEL_62;
    }
LABEL_57:
    v42 |= 0x30u;
    DWORD2(v65) = v42;
  }
  if ((v40 & 9) != 0)
  {
    if ((v40 & 8) == 0) {
      int v42 = v43;
    }
    uint64_t v46 = 6;
    if ((v40 & 8) == 0) {
      uint64_t v46 = 3;
    }
    LODWORD(flagset_p[v46 + 1]) = v42 | 1;
  }
  if ((v40 & 0x100) != 0)
  {
    int v49 = 63176;
    HIDWORD(v64) = 63176;
    if ((v40 & 0x24) == 4)
    {
      int v50 = 0;
      size_t v48 = &flagset_p[1];
      int v47 = 8;
LABEL_75:
      *(_DWORD *)size_t v48 = 8;
      if ((v40 & 0x80) != 0) {
        goto LABEL_81;
      }
    }
    else
    {
      int v50 = 0;
      int v47 = 0;
      if ((v40 & 0x80) != 0) {
        goto LABEL_81;
      }
    }
  }
  else
  {
    if ((v40 & 0x24) != 0)
    {
      int v47 = 0;
      size_t v48 = (acl_flagset_t *)((char *)&v63 + 4);
      int v49 = 63168;
      int v50 = 8;
      goto LABEL_75;
    }
    int v50 = 0;
    int v47 = 0;
    int v49 = 63168;
    if ((v40 & 0x80) != 0)
    {
LABEL_81:
      v49 |= 0x30u;
      HIDWORD(v64) = v49;
      if ((v40 & 0x12) == 2)
      {
        v47 |= 0x30u;
        LODWORD(flagset_p[1]) = v47;
      }
      goto LABEL_83;
    }
  }
  if ((v40 & 0x12) != 0)
  {
    v50 |= 0x30u;
    DWORD1(v63) = v50;
  }
LABEL_83:
  if ((v40 & 0x40) != 0)
  {
    HIDWORD(v64) = v49 | 1;
    if ((v40 & 9) == 1)
    {
      size_t v51 = &flagset_p[1];
LABEL_88:
      *(_DWORD *)size_t v51 = v47 | 1;
    }
  }
  else if ((v40 & 9) != 0)
  {
    size_t v51 = (acl_flagset_t *)((char *)&v63 + 4);
    int v47 = v50;
    goto LABEL_88;
  }
  for (uint64_t i = 0; i != 72; i += 12)
  {
    unsigned int v53 = *(_DWORD *)((char *)&flagset_p[1] + i);
    if (v53) {
      archive_entry_acl_add_entry((uint64_t)a2, *(_DWORD *)((char *)flagset_p + i), v53, *(_DWORD *)((char *)flagset_p + i + 4), -1, 0);
    }
  }
  return v8;
}

uint64_t sub_2099D3D1C(_DWORD *a1, int a2, const char *a3, unsigned __int16 *a4)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if ((sub_2099AE624((uint64_t)a4) & 0x3C00) == 0) {
    return 0;
  }
  int v8 = sub_2099AE62C((uint64_t)a4, 15360);
  if (!v8) {
    return 0;
  }
  acl_permset_t permset_p = 0;
  acl_entry_t entry_p = 0;
  uint64_t v48 = 0;
  acl_flagset_t flagset_p = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  memset(uu, 0, sizeof(uu));
  acl_t acl = acl_init(v8);
  if (!acl)
  {
    uint64_t v16 = __error();
    archive_set_error(a1, *v16, "Failed to initialize ACL working storage", v17, v18, v19, v20, v21, v45);
    return 4294967271;
  }
  if (sub_2099AE690((uint64_t)a1, a4, 15360, (_DWORD *)&v48 + 1, (int *)&v48, (_DWORD *)&v47 + 1, &v47, &v46))
  {
LABEL_5:
    if (a2 < 0)
    {
      if (acl_set_link_np(a3, ACL_TYPE_EXTENDED, acl) && *__error() != 102)
      {
        int v35 = *__error();
        archive_set_error(a1, v35, "Failed to set acl: %s", v36, v37, v38, v39, v40, "nfs4");
        goto LABEL_49;
      }
    }
    else if (acl_set_fd_np(a2, acl, ACL_TYPE_EXTENDED) && *__error() != 102)
    {
      int v9 = *__error();
      archive_set_error(a1, v9, "Failed to set acl on fd: %s", v10, v11, v12, v13, v14, "nfs4");
LABEL_49:
      uint64_t v15 = 4294967276;
      goto LABEL_55;
    }
    uint64_t v15 = 0;
    goto LABEL_55;
  }
  while (1)
  {
    if (HIDWORD(v47) == 10002 || HIDWORD(v47) == 10004 || HIDWORD(v47) == 10107) {
      goto LABEL_19;
    }
    if (acl_create_entry(&acl, &entry_p))
    {
      int v41 = *__error();
      int v42 = "Failed to create a new ACL entry";
LABEL_53:
      int v43 = a1;
      goto LABEL_54;
    }
    if (HIDWORD(v48) == 1024)
    {
      unsigned int v24 = entry_p;
      acl_tag_t v25 = ACL_EXTENDED_ALLOW;
    }
    else
    {
      if (HIDWORD(v48) != 2048) {
        goto LABEL_19;
      }
      unsigned int v24 = entry_p;
      acl_tag_t v25 = ACL_EXTENDED_DENY;
    }
    acl_set_tag_type(v24, v25);
    if (HIDWORD(v47) != 10003) {
      break;
    }
    gid_t v32 = archive_write_disk_gid((uint64_t)a1, v46, (int)v47, v26, v27, v28, v29, v30);
    if (mbr_gid_to_uuid(v32, uu)) {
      goto LABEL_19;
    }
LABEL_31:
    if (!acl_set_qualifier(entry_p, uu))
    {
      if (acl_get_permset(entry_p, &permset_p))
      {
        int v41 = *__error();
        int v42 = "Failed to get ACL permission set";
      }
      else if (acl_clear_perms(permset_p))
      {
        int v41 = *__error();
        int v42 = "Failed to clear ACL permissions";
      }
      else
      {
        for (uint64_t i = 0; i != 34; i += 2)
        {
          if ((dword_2099EC778[i] & v48) != 0
            && acl_add_perm(permset_p, (acl_perm_t)dword_2099EC778[i + 1]))
          {
            int v41 = *__error();
            int v42 = "Failed to add ACL permission";
            goto LABEL_53;
          }
        }
        if (acl_get_flagset_np(entry_p, &flagset_p))
        {
          int v41 = *__error();
          int v42 = "Failed to get flagset from an NFSv4 ACL entry";
        }
        else if (acl_clear_flags_np(flagset_p))
        {
          int v41 = *__error();
          int v42 = "Failed to clear flags from an NFSv4 ACL flagset";
        }
        else
        {
          uint64_t v34 = 0;
          while ((dword_2099EC750[v34] & v48) == 0
               || !acl_add_flag_np(flagset_p, (acl_flag_t)dword_2099EC750[v34 + 1]))
          {
            v34 += 2;
            if (v34 == 10) {
              goto LABEL_19;
            }
          }
          int v41 = *__error();
          int v42 = "Failed to add flag to NFSv4 ACL flagset";
        }
      }
      goto LABEL_53;
    }
LABEL_19:
    if (sub_2099AE690((uint64_t)a1, a4, 15360, (_DWORD *)&v48 + 1, (int *)&v48, (_DWORD *)&v47 + 1, &v47, &v46))goto LABEL_5; {
  }
    }
  if (HIDWORD(v47) == 10001)
  {
    uid_t v31 = archive_write_disk_uid((uint64_t)a1, v46, (int)v47, v26, v27, v28, v29, v30);
    if (mbr_uid_to_uuid(v31, uu)) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
  int v42 = "Unsupported ACL tag";
  int v43 = a1;
  int v41 = -1;
LABEL_54:
  archive_set_error(v43, v41, v42, v26, v27, v28, v29, v30, v45);
  uint64_t v15 = 4294967271;
LABEL_55:
  acl_free(acl);
  return v15;
}

uint64_t archive_write_set_format_pax_restricted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 1, "archive_write_set_format_pax_restricted", a5, a6, a7, a8);
  if (result != -30)
  {
    uint64_t result = archive_write_set_format_pax(a1, v10, v11, v12, v13, v14, v15, v16);
    *(_DWORD *)(a1 + 16) = 196611;
    *(void *)(a1 + 24) = "restricted POSIX pax interchange";
  }
  return result;
}

uint64_t archive_write_set_format_pax(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 1, "archive_write_set_format_pax", a5, a6, a7, a8);
  if (result != -30)
  {
    uint64_t v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = malloc_type_calloc(1uLL, 0x80uLL, 0x103004090A86EF5uLL);
    if (v11)
    {
      uint64_t v17 = v11;
      uint64_t result = 0;
      v17[31] = 3;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 272) = "pax";
      *(void *)(a1 + 288) = sub_2099D429C;
      *(void *)(a1 + 304) = sub_2099D447C;
      *(void *)(a1 + 312) = sub_2099D5684;
      *(void *)(a1 + 320) = sub_2099D5784;
      *(void *)(a1 + 328) = sub_2099D578C;
      *(void *)(a1 + 296) = sub_2099D57F4;
      *(_DWORD *)(a1 + 16) = 196610;
      *(void *)(a1 + 24) = "POSIX pax interchange";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate pax data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t sub_2099D429C(uint64_t a1, char *__s1, const char *a3)
{
  uint64_t v6 = *(void *)(a1 + 264);
  if (!strcmp(__s1, "hdrcharset"))
  {
    if (!a3 || !*a3)
    {
      uint64_t v13 = "pax: hdrcharset option needs a character-set name";
      goto LABEL_21;
    }
    if (!strcmp(a3, "BINARY") || !strcmp(a3, "binary"))
    {
      uint64_t result = 0;
      *(_DWORD *)(v6 + 120) = 1;
    }
    else
    {
      if (strcmp(a3, "UTF-8"))
      {
        uint64_t v13 = "pax: invalid charset name";
LABEL_21:
        archive_set_error((_DWORD *)a1, -1, v13, v7, v8, v9, v10, v11, v16);
        return 4294967271;
      }
      uint64_t v15 = sub_2099C4288(a1, "UTF-8", 0);
      *(void *)(v6 + 112) = v15;
      if (v15) {
        return 0;
      }
      else {
        return 4294967266;
      }
    }
  }
  else
  {
    if (strcmp(__s1, "xattrheader")) {
      return 4294967276;
    }
    if (!a3 || !*a3)
    {
      uint64_t v13 = "pax: xattrheader requires a value";
      goto LABEL_21;
    }
    if (!strcmp(a3, "ALL") || !strcmp(a3, "all"))
    {
      uint64_t result = 0;
      unsigned int v14 = *(_DWORD *)(v6 + 124) | 3;
    }
    else if (!strcmp(a3, "SCHILY") || !strcmp(a3, "schily"))
    {
      uint64_t result = 0;
      unsigned int v14 = *(_DWORD *)(v6 + 124) & 0xFFFFFFFC | 1;
    }
    else
    {
      if (strcmp(a3, "LIBARCHIVE") && strcmp(a3, "libarchive"))
      {
        uint64_t v13 = "pax: invalid xattr header name";
        goto LABEL_21;
      }
      uint64_t result = 0;
      unsigned int v14 = *(_DWORD *)(v6 + 124) & 0xFFFFFFFC | 2;
    }
    *(_DWORD *)(v6 + 124) = v14;
  }
  return result;
}

uint64_t sub_2099D447C(uint64_t a1, uint64_t *a2)
{
  uint64_t v210 = *MEMORY[0x263EF8340];
  v200 = 0;
  __s = 0;
  v198 = 0;
  v199 = 0;
  uint64_t v4 = *(void *)(a1 + 264);
  if (!archive_entry_pathname(a2))
  {
    archive_set_error((_DWORD *)a1, -1, "Can't record entry in tar file without pathname", v5, v6, v7, v8, v9, v188);
    return 4294967271;
  }
  if (*(_DWORD *)(v4 + 120))
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = *(void **)(v4 + 112);
    if (!v10)
    {
      uint64_t v10 = sub_2099C4288(a1, "UTF-8", 1);
      *(void *)(v4 + 112) = v10;
      if (!v10) {
        return 4294967271;
      }
    }
  }
  v202 = 0;
  unint64_t v196 = 0;
  unint64_t v197 = 0;
  unint64_t v194 = 0;
  size_t __n = 0;
  unint64_t v192 = 0;
  unint64_t v193 = 0;
  uint64_t v190 = 0;
  uint64_t v191 = 0;
  v189 = 0;
  uint64_t v12 = sub_2099D5874((_DWORD *)a1, (uint64_t)a2, &v202, &v196, (uint64_t)v10);
  uint64_t v13 = v12;
  if (v12 == -30) {
    return v12;
  }
  if (v12)
  {
    if (sub_2099D5874((_DWORD *)a1, (uint64_t)a2, &v202, &v196, 0) == -30) {
      return 4294967266;
    }
    unsigned int v14 = v202;
    sub_2099C42E4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v15, v16, v17, v18, v19, v14);
    uint64_t v10 = 0;
    uint64_t v13 = 4294967276;
  }
  if (!v202)
  {
    HIDWORD(v21) = archive_entry_filetype((uint64_t)a2);
    LODWORD(v21) = HIDWORD(v21) - 4096;
    unsigned int v20 = v21 >> 12;
    if (v20 > 9) {
      goto LABEL_88;
    }
    if (((1 << v20) & 0x2A3) != 0) {
      goto LABEL_15;
    }
    if (v20 != 3)
    {
LABEL_88:
      sub_2099CCD58((_DWORD *)a1, a2);
      return 4294967271;
    }
    int v44 = (const char *)archive_entry_pathname(a2);
    if (v44)
    {
      unsigned int v45 = (char *)v44;
      if (*v44)
      {
        if (v44[strlen(v44) - 1] != 47)
        {
          uint64_t v208 = 0;
          v207 = 0;
          uint64_t v209 = 0;
          size_t __n = strlen(v45);
          if (!sub_209974664((void **)&v207, __n + 2))
          {
            archive_set_error((_DWORD *)a1, 12, "Can't allocate pax data", v46, v47, v48, v49, v50, v188);
            v107 = &v207;
LABEL_230:
            sub_20997954C((uint64_t)v107);
            return 4294967266;
          }
          uint64_t v208 = 0;
          sub_209974714((uint64_t *)&v207, v45, __n);
          sub_2099C4050((uint64_t *)&v207, 47);
          archive_entry_copy_pathname((uint64_t)a2, v207);
          sub_20997954C((uint64_t)&v207);
        }
      }
    }
  }
LABEL_15:
  uint64_t v22 = archive_entry_mac_metadata((uint64_t)a2, &v197);
  if (!v22) {
    goto LABEL_44;
  }
  uint64_t v23 = v22;
  unsigned int v24 = (void **)archive_entry_new2(a1);
  acl_tag_t v25 = (const char *)archive_entry_pathname(a2);
  size_t v26 = strlen(v25);
  uint64_t v27 = (char *)malloc_type_malloc(v26 + 3, 0xB889D8D5uLL);
  uint64_t v28 = v27;
  if (!v27 || !v24)
  {
    archive_entry_free(v24);
    free(v28);
    return 4294967271;
  }
  for (uint64_t i = strcpy(v27, v25); ; uint64_t i = v28)
  {
    uint64_t v30 = strrchr(i, 47);
    if (!v30)
    {
      memmove(v28 + 2, v28, v26 + 1);
      uid_t v31 = v28;
      goto LABEL_26;
    }
    if (v30[1]) {
      break;
    }
    *uint64_t v30 = 0;
  }
  uid_t v31 = v30 + 1;
  gid_t v32 = v30 + 3;
  size_t v33 = strlen(v30 + 1);
  memmove(v32, v31, v33 + 1);
LABEL_26:
  *(_WORD *)uid_t v31 = 24366;
  archive_entry_copy_pathname((uint64_t)v24, v28);
  free(v28);
  archive_entry_set_size((uint64_t)v24, v197);
  archive_entry_set_filetype((uint64_t)v24, 0x8000);
  __int16 v34 = archive_entry_perm((uint64_t)a2);
  archive_entry_set_perm((uint64_t)v24, v34);
  uint64_t v35 = archive_entry_mtime((uint64_t)a2);
  uint64_t v36 = archive_entry_mtime_nsec((uint64_t)a2);
  archive_entry_set_mtime((uint64_t)v24, v35, v36);
  uint64_t v37 = archive_entry_gid((uint64_t)a2);
  archive_entry_set_gid((uint64_t)v24, v37);
  uint64_t v38 = (char *)archive_entry_gname(a2);
  archive_entry_set_gname((uint64_t)v24, v38);
  uint64_t v39 = archive_entry_uid((uint64_t)a2);
  archive_entry_set_uid((uint64_t)v24, v39);
  uint64_t v40 = (char *)archive_entry_uname(a2);
  archive_entry_set_uname((uint64_t)v24, v40);
  uint64_t v41 = sub_2099D447C(a1, v24);
  archive_entry_free(v24);
  uint64_t v11 = v41;
  if ((int)v41 < -20) {
    return v11;
  }
  unint64_t v42 = sub_2099D5684((void *)a1, v23, v197);
  int v43 = v42;
  if ((int)v42 < -20) {
    return v42;
  }
  uint64_t v51 = sub_2099D57F4((void *)a1);
  uint64_t v11 = v51;
  if ((int)v51 < -20) {
    return v11;
  }
  if ((int)v41 >= (int)v13) {
    int v52 = v13;
  }
  else {
    int v52 = v41;
  }
  if (v52 >= v43) {
    int v52 = v43;
  }
  if ((int)v51 >= v52) {
    uint64_t v13 = v52;
  }
  else {
    uint64_t v13 = v51;
  }
LABEL_44:
  uint64_t v53 = archive_entry_clone(a2);
  if (!v53)
  {
    archive_set_error((_DWORD *)a1, 12, "Can't allocate pax data", v54, v55, v56, v57, v58, v188);
    return 4294967266;
  }
  uint64_t v59 = (uint64_t *)v53;
  *(void *)(v4 + 48) = 0;
  *(void *)(v4 + 72) = 0;
  while (1)
  {
    uint64_t v60 = *(void **)(v4 + 96);
    if (!v60) {
      break;
    }
    *(void *)(v4 + 96) = *v60;
    free(v60);
  }
  *(void *)(v4 + 104) = 0;
  if (!v202
    && archive_entry_filetype((uint64_t)v59) == 0x8000
    && archive_entry_sparse_reset((uint64_t)v59))
  {
    v207 = 0;
    v206[0] = 0;
    uint64_t v61 = 0;
    if (!archive_entry_sparse_next((uint64_t)v59, &v207, v206))
    {
      do
      {
        uint64_t v62 = v207;
        long long v63 = v206[0];
      }
      while (!archive_entry_sparse_next((uint64_t)v59, &v207, v206));
      uint64_t v61 = (uint64_t)&v62[(void)v63];
    }
    if (v61 < archive_entry_size((uint64_t)v59))
    {
      uint64_t v64 = archive_entry_size((uint64_t)v59);
      archive_entry_sparse_add_entry(v59, v64, 0);
    }
    long long v65 = (char *)archive_entry_sparse_reset((uint64_t)v59);
  }
  else
  {
    long long v65 = 0;
  }
  int v66 = sub_2099D591C((_DWORD *)a1, v59, &__s, &__n, (uint64_t)v10);
  if (v66)
  {
    if (v66 == -30 || sub_2099D591C((_DWORD *)a1, v59, &__s, &__n, 0) == -30) {
      goto LABEL_108;
    }
    uint64_t v67 = __s;
    sub_2099C42E4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v68, v69, v70, v71, v72, v67);
    uint64_t v10 = 0;
    uint64_t v13 = 4294967276;
  }
  int v73 = sub_2099D5984((_DWORD *)a1, v59, &v199, &v193, (uint64_t)v10);
  if (v73)
  {
    if (v73 == -30 || sub_2099D5984((_DWORD *)a1, v59, &v199, &v193, 0) == -30) {
      goto LABEL_108;
    }
    uint64_t v74 = v199;
    sub_2099C42E4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate uname '%s' to %s", v75, v76, v77, v78, v79, v74);
    uint64_t v10 = 0;
    uint64_t v13 = 4294967276;
  }
  int v80 = sub_2099D59EC((_DWORD *)a1, v59, &v198, &v192, (uint64_t)v10);
  if (v80)
  {
    if (v80 == -30 || sub_2099D59EC((_DWORD *)a1, v59, &v198, &v192, 0) == -30) {
      goto LABEL_108;
    }
    v81 = v198;
    sub_2099C42E4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate gname '%s' to %s", v82, v83, v84, v85, v86, v81);
    uint64_t v10 = 0;
    uint64_t v13 = 4294967276;
  }
  v200 = v202;
  unint64_t v194 = v196;
  if (v202 || (int v97 = sub_2099D5A54((_DWORD *)a1, (uint64_t)v59, &v200, &v194, (uint64_t)v10)) == 0)
  {
    if (v10) {
      goto LABEL_74;
    }
  }
  else
  {
    if (v97 == -30 || sub_2099D5A54((_DWORD *)a1, (uint64_t)v59, &v200, &v194, 0) == -30) {
      goto LABEL_108;
    }
    time_t v98 = v200;
    sub_2099C42E4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v99, v100, v101, v102, v103, v98);
    uint64_t v13 = 4294967276;
  }
  if (!*(_DWORD *)(v4 + 120))
  {
    if (!v202)
    {
LABEL_105:
      if (sub_2099D591C((_DWORD *)a1, v59, &__s, &__n, 0) != -30
        && sub_2099D5984((_DWORD *)a1, v59, &v199, &v193, 0) != -30
        && sub_2099D59EC((_DWORD *)a1, v59, &v198, &v192, 0) != -30)
      {
        goto LABEL_73;
      }
      goto LABEL_108;
    }
    if (sub_2099D5874((_DWORD *)a1, (uint64_t)v59, &v202, &v196, 0) != -30)
    {
      v200 = v202;
      unint64_t v194 = v196;
      goto LABEL_105;
    }
LABEL_108:
    archive_entry_free((void **)v59);
    return 4294967266;
  }
LABEL_73:
  sub_2099D676C((uint64_t *)(v4 + 40), "hdrcharset", "BINARY", 6uLL);
LABEL_74:
  v87 = __s;
  if (!__s) {
    goto LABEL_78;
  }
  v88 = __s;
  do
  {
    int v90 = *v88++;
    int v89 = v90;
  }
  while (v90 > 0);
  if (v89) {
    goto LABEL_78;
  }
  if (__n < 0x65) {
    goto LABEL_101;
  }
  unint64_t v104 = strchr(&__s[__n - 101], 47);
  if (v104 == v87) {
    unint64_t v104 = strchr(v87 + 1, 47);
  }
  if (!v104 || (v104 - v87 <= 155 ? (BOOL v105 = v104[1] == 0) : (BOOL v105 = 1), v105))
  {
LABEL_78:
    size_t v91 = strlen(v87);
    sub_2099D676C((uint64_t *)(v4 + 40), "path", v87, v91);
    sub_2099D5ABC(__dst, __s, __n, 0);
    archive_entry_set_pathname((uint64_t)v59, __dst);
    int v92 = 1;
  }
  else
  {
LABEL_101:
    int v92 = 0;
  }
  if (v200)
  {
    if (v194 > 0x64) {
      goto LABEL_84;
    }
    size_t v93 = v200;
    do
    {
      int v95 = *v93++;
      int v94 = v95;
    }
    while (v95 > 0);
    if (v94)
    {
LABEL_84:
      size_t v96 = strlen(v200);
      sub_2099D676C((uint64_t *)(v4 + 40), "linkpath", v200, v96);
      if (v194 >= 0x65)
      {
        if (v202) {
          archive_entry_set_hardlink((uint64_t)v59, "././@LongHardLink");
        }
        else {
          archive_entry_set_symlink((uint64_t)v59, "././@LongSymLink");
        }
      }
      int v92 = 1;
    }
  }
  v189 = 0;
  uint64_t v190 = 0;
  uint64_t v191 = 0;
  v108 = (unsigned char *)archive_entry_pathname(v59);
  if (archive_entry_pathname(v59))
  {
    v109 = (const char *)archive_entry_pathname(v59);
    size_t v110 = strlen(v109);
  }
  else
  {
    size_t v110 = 0;
  }
  sub_209974714((uint64_t *)&v189, v108, v110);
  if (archive_entry_size((uint64_t)v59) >= 0x200000000)
  {
    uint64_t v111 = archive_entry_size((uint64_t)v59);
    sub_2099D5D4C((uint64_t *)(v4 + 40), "size", v111);
    int v92 = 1;
  }
  if ((archive_entry_gid((uint64_t)v59) & 0xFFFC0000) != 0)
  {
    uint64_t v112 = archive_entry_gid((uint64_t)v59);
    sub_2099D5D4C((uint64_t *)(v4 + 40), "gid", v112);
    int v92 = 1;
  }
  if (v198)
  {
    if (v192 > 0x1F) {
      goto LABEL_126;
    }
    v113 = v198;
    do
    {
      int v115 = *v113++;
      int v114 = v115;
    }
    while (v115 > 0);
    if (v114)
    {
LABEL_126:
      size_t v116 = strlen(v198);
      sub_2099D676C((uint64_t *)(v4 + 40), "gname", v198, v116);
      int v92 = 1;
    }
  }
  if ((archive_entry_uid((uint64_t)v59) & 0xFFFC0000) != 0)
  {
    uint64_t v117 = archive_entry_uid((uint64_t)v59);
    sub_2099D5D4C((uint64_t *)(v4 + 40), "uid", v117);
    int v92 = 1;
  }
  if (v199)
  {
    if (v193 > 0x1F) {
      goto LABEL_134;
    }
    v118 = v199;
    do
    {
      int v120 = *v118++;
      int v119 = v120;
    }
    while (v120 > 0);
    if (v119)
    {
LABEL_134:
      size_t v121 = strlen(v199);
      sub_2099D676C((uint64_t *)(v4 + 40), "uname", v199, v121);
      int v92 = 1;
    }
  }
  if (archive_entry_filetype((uint64_t)v59) == 24576
    || archive_entry_filetype((uint64_t)v59) == 0x2000)
  {
    int v122 = archive_entry_rdevmajor((uint64_t)v59);
    int v123 = archive_entry_rdevminor(v59);
    if (v122 >= 0x40000)
    {
      sub_2099D5D4C((uint64_t *)(v4 + 40), "SCHILY.devmajor", v122);
      int v92 = 1;
    }
    if (v123 >= 0x40000)
    {
      sub_2099D5D4C((uint64_t *)(v4 + 40), "SCHILY.devminor", v123);
LABEL_142:
      archive_entry_fflags_text(v59);
LABEL_143:
      BOOL v124 = 0;
      goto LABEL_144;
    }
  }
  if (v92 || archive_entry_mtime((uint64_t)v59) < 0 || archive_entry_mtime((uint64_t)v59) >= 0x7FFFFFFF) {
    goto LABEL_142;
  }
  v179 = archive_entry_fflags_text(v59);
  if (v179 && *v179) {
    goto LABEL_143;
  }
  BOOL v124 = (int)archive_entry_xattr_count((uint64_t)a2) < 1;
LABEL_144:
  BOOL v125 = (int)v65 < 1 && v124;
  int v126 = archive_entry_acl_types((uint64_t)a2);
  __int16 v127 = v126;
  int v128 = 1;
  if (v125 && !v126) {
    int v128 = (int)archive_entry_symlink_type((uint64_t)v59) > 0;
  }
  if (*(_DWORD *)(a1 + 16) != 196611)
  {
    if (archive_entry_ctime((uint64_t)v59) || archive_entry_ctime_nsec((uint64_t)v59))
    {
      uint64_t v129 = archive_entry_ctime((uint64_t)v59);
      unint64_t v130 = archive_entry_ctime_nsec((uint64_t)v59);
      sub_2099D5E24((uint64_t *)(v4 + 40), "ctime", v129, v130);
    }
    if (archive_entry_atime((uint64_t)v59) || archive_entry_atime_nsec((uint64_t)v59))
    {
      uint64_t v131 = archive_entry_atime((uint64_t)v59);
      unint64_t v132 = archive_entry_atime_nsec((uint64_t)v59);
      sub_2099D5E24((uint64_t *)(v4 + 40), "atime", v131, v132);
    }
    if (archive_entry_birthtime_is_set((uint64_t)v59))
    {
      uint64_t v133 = archive_entry_birthtime((uint64_t)v59);
      if (v133 < archive_entry_mtime((uint64_t)v59))
      {
        uint64_t v134 = archive_entry_birthtime((uint64_t)v59);
        unint64_t v135 = archive_entry_birthtime_nsec((uint64_t)v59);
        sub_2099D5E24((uint64_t *)(v4 + 40), "LIBARCHIVE.creationtime", v134, v135);
      }
    }
  }
  if (((*(_DWORD *)(a1 + 16) == 196611) & ~v128) != 0)
  {
    uint64_t v149 = 0;
  }
  else
  {
    if (archive_entry_mtime((uint64_t)v59) < 0
      || archive_entry_mtime((uint64_t)v59) > 2147483646
      || archive_entry_mtime_nsec((uint64_t)v59))
    {
      uint64_t v136 = archive_entry_mtime((uint64_t)v59);
      unint64_t v137 = archive_entry_mtime_nsec((uint64_t)v59);
      sub_2099D5E24((uint64_t *)(v4 + 40), "mtime", v136, v137);
    }
    v138 = archive_entry_fflags_text(v59);
    if (v138)
    {
      v139 = v138;
      if (*v138)
      {
        size_t v140 = strlen(v138);
        sub_2099D676C((uint64_t *)(v4 + 40), "SCHILY.fflags", v139, v140);
      }
    }
    if ((v127 & 0x3C00) != 0)
    {
      uint64_t v13 = sub_2099D5F7C((_DWORD *)a1, (uint64_t)a2, v4, 25);
      if (v13 == -30) {
        goto LABEL_229;
      }
    }
    if ((v127 & 0x100) != 0)
    {
      uint64_t v13 = sub_2099D5F7C((_DWORD *)a1, (uint64_t)a2, v4, 265);
      if (v13 == -30) {
        goto LABEL_229;
      }
    }
    if ((v127 & 0x200) != 0)
    {
      uint64_t v13 = sub_2099D5F7C((_DWORD *)a1, (uint64_t)a2, v4, 521);
      if (v13 == -30) {
        goto LABEL_229;
      }
    }
    if ((int)v65 < 1)
    {
      uint64_t v149 = 0;
    }
    else
    {
      v207 = 0;
      v206[0] = 0;
      sub_2099D5D4C((uint64_t *)(v4 + 40), "GNU.sparse.major", 1);
      sub_2099D5D4C((uint64_t *)(v4 + 40), "GNU.sparse.minor", 0);
      size_t v141 = strlen(__s);
      sub_2099D676C((uint64_t *)(v4 + 40), "GNU.sparse.name", __s, v141);
      uint64_t v142 = archive_entry_size((uint64_t)v59);
      sub_2099D5D4C((uint64_t *)(v4 + 40), "GNU.sparse.realsize", v142);
      sub_2099D60B4(v203, v189);
      archive_entry_set_pathname((uint64_t)v59, v203);
      sub_2099C7760((void **)(v4 + 64), "%d\n", v143, v144, v145, v146, v147, v148, v65);
      uint64_t v149 = 0;
      while (!archive_entry_sparse_next((uint64_t)v59, &v207, v206))
      {
        sub_2099C7760((void **)(v4 + 64), "%jd\n%jd\n", v150, v151, v152, v153, v154, v155, v207);
        v149 += (uint64_t)v206[0];
        if (sub_2099D6174(v4, (uint64_t)v207, (uint64_t)v206[0]))
        {
          v161 = "Can't allocate memory";
          v162 = (_DWORD *)a1;
          int v163 = 12;
          goto LABEL_202;
        }
      }
    }
    if (sub_2099D6204((_DWORD *)a1, v4, (uint64_t)a2) == -30) {
      goto LABEL_229;
    }
    if (archive_entry_symlink_type((uint64_t)v59) == 1)
    {
      v182 = "file";
      v183 = (uint64_t *)(v4 + 40);
      size_t v184 = 4;
LABEL_226:
      sub_2099D676C(v183, "LIBARCHIVE.symlinktype", v182, v184);
      goto LABEL_180;
    }
    if (archive_entry_symlink_type((uint64_t)v59) == 2)
    {
      v182 = "dir";
      v183 = (uint64_t *)(v4 + 40);
      size_t v184 = 3;
      goto LABEL_226;
    }
  }
LABEL_180:
  if (archive_entry_filetype((uint64_t)v59) != 0x8000) {
    archive_entry_set_size((uint64_t)v59, 0);
  }
  v164 = v202;
  if (*(_DWORD *)(a1 + 16) != 196610 && v202)
  {
    archive_entry_set_size((uint64_t)v59, 0);
    v164 = v202;
  }
  if (v164) {
    archive_entry_set_size((uint64_t)v59, 0);
  }
  uint64_t v165 = archive_entry_size((uint64_t)v59);
  uint64_t v166 = *(void *)(v4 + 72);
  if (v166)
  {
    uint64_t v167 = -*(_WORD *)(v4 + 72) & 0x1FF;
    *(void *)(v4 + 88) = v167;
    archive_entry_set_size((uint64_t)v59, v166 + v149 + v167);
  }
  if (sub_2099DB284((_DWORD *)a1, (char *)v206, v59, -1, 0, 0) == -30) {
    goto LABEL_229;
  }
  if (*(void *)(v4 + 48))
  {
    v168 = (uint64_t *)archive_entry_new2(a1);
    sub_2099D662C((uint64_t)v204, v189);
    archive_entry_set_pathname((uint64_t)v168, v204);
    archive_entry_set_size((uint64_t)v168, *(void *)(v4 + 48));
    uint64_t v169 = archive_entry_uid((uint64_t)v59);
    if (v169 >= 0x3FFFF) {
      uint64_t v170 = 0x3FFFFLL;
    }
    else {
      uint64_t v170 = v169;
    }
    archive_entry_set_uid((uint64_t)v168, v170);
    uint64_t v171 = archive_entry_gid((uint64_t)v59);
    if (v171 >= 0x3FFFF) {
      uint64_t v172 = 0x3FFFFLL;
    }
    else {
      uint64_t v172 = v171;
    }
    archive_entry_set_gid((uint64_t)v168, v172);
    __int16 v173 = archive_entry_mode((uint64_t)v59);
    archive_entry_set_mode((uint64_t)v168, v173 & 0xF1FF);
    v174 = (char *)archive_entry_uname(v59);
    archive_entry_set_uname((uint64_t)v168, v174);
    v175 = (char *)archive_entry_gname(v59);
    archive_entry_set_gname((uint64_t)v168, v175);
    uint64_t v176 = archive_entry_mtime((uint64_t)v59);
    if ((v176 & (unint64_t)~(v176 >> 63)) >= 0x7FFFFFFF) {
      uint64_t v177 = 0x7FFFFFFFLL;
    }
    else {
      uint64_t v177 = v176 & ~(v176 >> 63);
    }
    archive_entry_set_mtime((uint64_t)v168, v177, 0);
    archive_entry_set_atime((uint64_t)v168, 0, 0);
    archive_entry_set_ctime((uint64_t)v168, 0, 0);
    int v178 = sub_2099DB284((_DWORD *)a1, (char *)&v207, v168, 120, 1, 0);
    archive_entry_free((void **)v168);
    if (v178 <= -21)
    {
      v161 = "archive_write_pax_header: 'x' header failed?!  This can't happen.\n";
      v162 = (_DWORD *)a1;
      int v163 = -1;
LABEL_202:
      archive_set_error(v162, v163, v161, v156, v157, v158, v159, v160, v188);
      goto LABEL_229;
    }
    if (v178 >= (int)v13) {
      uint64_t v11 = v13;
    }
    else {
      uint64_t v11 = v178;
    }
    if (sub_2099C9728(a1, (uint64_t)&v207, 512))
    {
      sub_2099D58DC(v4);
      *(void *)uint64_t v4 = 0;
      *(void *)(v4 + 8) = 0;
LABEL_229:
      archive_entry_free((void **)v59);
      v107 = &v189;
      goto LABEL_230;
    }
    uint64_t v185 = *(void *)(v4 + 40);
    uint64_t v186 = *(void *)(v4 + 48);
    uint64_t v187 = -*(_WORD *)(v4 + 48) & 0x1FF;
    *(void *)uint64_t v4 = v186;
    *(void *)(v4 + 8) = v187;
    if (sub_2099C9728(a1, v185, v186) || sub_2099C978C((void *)a1, *(void *)(v4 + 8))) {
      goto LABEL_229;
    }
    *(void *)uint64_t v4 = 0;
    *(void *)(v4 + 8) = 0;
  }
  else
  {
    uint64_t v11 = v13;
  }
  uint64_t v180 = sub_2099C9728(a1, (uint64_t)v206, 512);
  if (v180)
  {
    uint64_t v181 = v180;
    archive_entry_free((void **)v59);
    sub_20997954C((uint64_t)&v189);
    return v181;
  }
  else
  {
    archive_entry_set_size((uint64_t)a2, v165);
    if (!*(void *)(v4 + 96) && v165)
    {
      sub_2099D6174(v4, 0, v165);
      LODWORD(v149) = v165;
    }
    *(void *)(v4 + 8) = -(int)v149 & 0x1FFLL;
    archive_entry_free((void **)v59);
    sub_20997954C((uint64_t)&v189);
  }
  return v11;
}

unint64_t sub_2099D5684(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (void *)a1[33];
  uint64_t v7 = v6[9];
  if (v7)
  {
    int v8 = sub_2099C9728((uint64_t)a1, v6[8], v7);
    if (v8) {
      return v8;
    }
    int v8 = sub_2099C978C(a1, v6[11]);
    if (v8) {
      return v8;
    }
    v6[9] = 0;
  }
  unint64_t v9 = 0;
  if (a3)
  {
    uint64_t v10 = (void *)v6[12];
    while (v10)
    {
      while (1)
      {
        unint64_t v11 = v10[3];
        if (v11) {
          break;
        }
        uint64_t v12 = (void *)*v10;
        free(v10);
        v6[12] = v12;
        uint64_t v10 = v12;
        if (!v12) {
          return v9;
        }
      }
      if (a3 - v9 >= v11) {
        uint64_t v13 = v10[3];
      }
      else {
        uint64_t v13 = a3 - v9;
      }
      if (*((_DWORD *)v10 + 2))
      {
        v10[3] = v11 - v13;
      }
      else
      {
        int v14 = sub_2099C9728((uint64_t)a1, a2 + v9, v13);
        uint64_t v10 = (void *)v6[12];
        v10[3] -= v13;
        if (v14) {
          return v14;
        }
      }
      v9 += v13;
      if (v9 >= a3) {
        return v9;
      }
    }
  }
  return v9;
}

uint64_t sub_2099D5784(void *a1)
{
  return sub_2099C978C(a1, 0x400uLL);
}

uint64_t sub_2099D578C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 264);
  if (v1)
  {
    sub_20997954C((uint64_t)(v1 + 5));
    sub_20997954C((uint64_t)(v1 + 8));
    sub_20997954C((uint64_t)(v1 + 2));
    while (1)
    {
      int v3 = (void *)v1[12];
      if (!v3) {
        break;
      }
      v1[12] = *v3;
      free(v3);
    }
    free(v1);
    *(void *)(a1 + 264) = 0;
  }
  return 0;
}

uint64_t sub_2099D57F4(void *a1)
{
  int v2 = (uint64_t *)a1[33];
  uint64_t v3 = *v2;
  if (!*v2)
  {
    uint64_t v4 = (void *)v2[12];
    if (v4)
    {
      uint64_t v3 = 0;
      do
      {
        if (!*((_DWORD *)v4 + 2)) {
          v3 += v4[3];
        }
        uint64_t v5 = (void *)*v4;
        free(v4);
        v2[12] = (uint64_t)v5;
        uint64_t v4 = v5;
      }
      while (v5);
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  uint64_t result = sub_2099C978C(a1, v2[1] + v3);
  *int v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t sub_2099D5874(_DWORD *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_20997DE30(a2, a3, a4, a5);
  if (result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Linkname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

void *sub_2099D58DC(uint64_t a1)
{
  for (uint64_t result = *(void **)(a1 + 96); result; uint64_t result = *(void **)(a1 + 96))
  {
    *(void *)(a1 + 96) = *result;
    free(result);
  }
  *(void *)(a1 + 104) = 0;
  return result;
}

uint64_t sub_2099D591C(_DWORD *a1, uint64_t *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_20997DF08(a2, a3, a4, a5);
  if (result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Pathname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

uint64_t sub_2099D5984(_DWORD *a1, uint64_t *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_20997E26C(a2, a3, a4, a5);
  if (result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Uname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

uint64_t sub_2099D59EC(_DWORD *a1, uint64_t *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_20997DD3C(a2, a3, a4, a5);
  if (result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Gname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

uint64_t sub_2099D5A54(_DWORD *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_20997E104(a2, a3, a4, a5);
  if (result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Linkname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

char *sub_2099D5ABC(char *__dst, char *__src, size_t __n, char *__s)
{
  uint64_t v5 = __n;
  if (__s)
  {
    size_t v8 = strlen(__s) + 2;
  }
  else
  {
    if (__n < 0x64)
    {
      strncpy(__dst, __src, __n);
      uint64_t v9 = &__dst[v5];
      goto LABEL_65;
    }
    size_t v8 = 0;
  }
  uint64_t v10 = &__src[v5];
  if (v5 < 1) {
    goto LABEL_17;
  }
  char v11 = 1;
  while (1)
  {
    int v12 = *(v10 - 1);
    if (v12 == 47)
    {
      uint64_t v13 = v5 - 1;
      goto LABEL_13;
    }
    uint64_t v13 = v5 - 2;
    if ((unint64_t)v5 < 2) {
      break;
    }
    if (v12 != 46 || __src[v13] != 47) {
      goto LABEL_16;
    }
LABEL_13:
    char v11 = 0;
    uint64_t v10 = &__src[v13];
    uint64_t v5 = v13;
    if (v13 <= 0)
    {
      char v14 = 0;
      uint64_t v15 = v13 - 1;
      uint64_t v16 = &__src[v15];
      uint64_t v17 = 98;
      goto LABEL_26;
    }
  }
  uint64_t v5 = 1;
LABEL_16:
  if (v11)
  {
LABEL_17:
    char v14 = 1;
    uint64_t v17 = 99;
  }
  else
  {
    char v14 = 0;
    uint64_t v17 = 98;
  }
  uint64_t v15 = v5 - 1;
  if (v5 < 2)
  {
    uint64_t v16 = &__src[v15];
LABEL_26:
    uint64_t v18 = v15;
  }
  else
  {
    uint64_t v18 = v5 - 1;
    while (__src[v18] != 47)
    {
      BOOL v19 = v18-- <= 1;
      if (v19)
      {
        uint64_t v18 = 0;
        uint64_t v16 = __src;
        goto LABEL_28;
      }
    }
    uint64_t v16 = &__src[v18];
  }
LABEL_28:
  BOOL v19 = *v16 == 47 && v18 < v15;
  if (v19) {
    uint64_t v20 = v18 + 1;
  }
  else {
    uint64_t v20 = v18;
  }
  unint64_t v21 = &__src[v20];
  size_t v22 = v17 - v8;
  if (v10 > &__src[v20 + v22]) {
    uint64_t v10 = &__src[v20 + v22];
  }
  size_t v23 = v10 - v21;
  if (v20 >= 155) {
    unsigned int v24 = __src + 155;
  }
  else {
    unsigned int v24 = &__src[v20];
  }
  if (v24 > __src)
  {
    while (*v24 != 47)
    {
      if (--v24 <= __src)
      {
        unsigned int v24 = __src;
        break;
      }
    }
  }
  size_t v25 = v22 - v23;
  if (v24 < v21 && *v24 == 47) {
    ++v24;
  }
  size_t v26 = &v24[v25];
  if (v26 > v21) {
    size_t v26 = &__src[v20];
  }
  if (v26 >= v24) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = v24;
  }
  if (v24 < v26)
  {
    do
    {
      if (*v27 == 47) {
        break;
      }
      --v27;
    }
    while (v27 > v24);
  }
  if (v27 < v21 && *v27 == 47) {
    ++v27;
  }
  uint64_t v28 = __dst;
  if (v24 > __src)
  {
    strncpy(__dst, __src, v24 - __src);
    uint64_t v28 = &__dst[v24 - __src];
  }
  if (v27 > v24)
  {
    strncpy(v28, v24, v27 - v24);
    v28 += v27 - v24;
  }
  if (__s)
  {
    strcpy(v28, __s);
    uint64_t v29 = &v28[strlen(__s)];
    *uint64_t v29 = 47;
    uint64_t v28 = v29 + 1;
  }
  strncpy(v28, v21, v23);
  uint64_t v9 = &v28[v23];
  if ((v14 & 1) == 0) {
    *v9++ = 47;
  }
LABEL_65:
  *uint64_t v9 = 0;
  return __dst;
}

uint64_t *sub_2099D5D4C(uint64_t *a1, char *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v11[1] = 0;
  if (a3 >= 0) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = -a3;
  }
  uint64_t v6 = v11;
  do
  {
    *v6-- = a0123456789[v5 % 0xA];
    BOOL v7 = v5 >= 9;
    BOOL v8 = v5 == 9;
    v5 /= 0xAuLL;
  }
  while (!v8 && v7);
  if (a3 < 0) {
    char *v6 = 45;
  }
  else {
    ++v6;
  }
  size_t v9 = strlen(v6);
  return sub_2099D676C(a1, a2, v6, v9);
}

uint64_t *sub_2099D5E24(uint64_t *a1, char *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = &v16;
  char v16 = 0;
  int v7 = 11;
  do
  {
    unint64_t v8 = a4;
    int v9 = v7;
    a4 /= 0xAuLL;
    unint64_t v10 = v8 - 10 * a4;
    --v7;
  }
  while (v9 != 2 && !v10);
  if (v9 != 2)
  {
    if (v7 >= 2)
    {
      do
      {
        *--uint64_t v6 = a0123456789[v10];
        unint64_t v10 = a4 % 0xA;
        --v7;
        a4 /= 0xAuLL;
      }
      while (v7 > 1);
    }
    *--uint64_t v6 = 46;
  }
  if (a3 >= 0) {
    unint64_t v11 = a3;
  }
  else {
    unint64_t v11 = -a3;
  }
  uint64_t v12 = v6 - 1;
  do
  {
    *v12-- = a0123456789[v11 % 0xA];
    BOOL v13 = v11 > 9;
    v11 /= 0xAuLL;
  }
  while (v13);
  if (a3 < 0) {
    char *v12 = 45;
  }
  else {
    ++v12;
  }
  size_t v14 = strlen(v12);
  return sub_2099D676C(a1, a2, v12, v14);
}

uint64_t sub_2099D5F7C(_DWORD *a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  if ((archive_entry_acl_types(a2) & 0x3C00) != 0)
  {
    unint64_t v8 = "SCHILY.acl.ace";
  }
  else if ((a4 & 0x100) != 0)
  {
    unint64_t v8 = "SCHILY.acl.access";
  }
  else
  {
    if ((a4 & 0x200) == 0) {
      return 4294967266;
    }
    unint64_t v8 = "SCHILY.acl.default";
  }
  int v9 = sub_20997F140(a2, 0, a4, *(void *)(a3 + 112));
  if (!v9)
  {
    if (*__error() != 12)
    {
      archive_set_error(a1, 79, "%s %s %s", v13, v14, v15, v16, v17, "Can't translate ");
      return 4294967276;
    }
    archive_set_error(a1, 12, "%s %s", v13, v14, v15, v16, v17, "Can't allocate memory for ");
    return 4294967266;
  }
  unint64_t v10 = v9;
  if (*v9)
  {
    size_t v11 = strlen(v9);
    sub_2099D676C((uint64_t *)(a3 + 40), v8, v10, v11);
  }
  free(v10);
  return 0;
}

char *sub_2099D60B4(char *a1, char *__s)
{
  if (!__s || !*__s)
  {
    strcpy(a1, "GNUSparseFile/blank");
    return a1;
  }
  uint64_t v4 = strlen(__s);
  if (v4 < 1) {
    goto LABEL_13;
  }
  while (1)
  {
    int v5 = __s[v4 - 1];
    if (v5 != 47) {
      break;
    }
LABEL_8:
    if (v4-- <= 1)
    {
      uint64_t v4 = 0;
      goto LABEL_13;
    }
  }
  if ((unint64_t)v4 >= 2)
  {
    if (v5 != 46 || __s[v4 - 2] != 47) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  uint64_t v4 = 1;
LABEL_13:
  sub_2099D5ABC(a1, __s, v4, "GNUSparseFile.0");
  return a1;
}

uint64_t sub_2099D6174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 104);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 24) + *(void *)(v6 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  if (a2 <= v7 || (uint64_t result = sub_2099D68DC(a1, v7, a2 - v7, 1), !result))
  {
    return sub_2099D68DC(a1, a2, a3, 0);
  }
  return result;
}

uint64_t sub_2099D6204(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t result = archive_entry_xattr_reset(a3);
  if (!result) {
    return result;
  }
  int v7 = result;
  unint64_t v8 = (void *)(a2 + 16);
  uint64_t v50 = (uint64_t *)(a2 + 40);
  uint64_t v51 = v3;
  while (1)
  {
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    size_t v52 = 0;
    archive_entry_xattr_next(v3, &v54, &v53, &v52);
    uint64_t v14 = (char *)v54;
    unsigned __int8 v15 = *v54;
    if (*v54)
    {
      unint64_t v16 = 0;
      uint64_t v17 = (char *)(v54 + 1);
      while (1)
      {
        if ((char)v15 < 33 || v15 == 37 || v15 == 127 || v15 == 61)
        {
          if (v16 > 0xFFFFFFFFFFFFFFFBLL) {
            goto LABEL_46;
          }
          uint64_t v18 = 3;
        }
        else
        {
          if (v16 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_46;
          }
          uint64_t v18 = 1;
        }
        v16 += v18;
        unsigned __int8 v19 = *v17++;
        unsigned __int8 v15 = v19;
        if (!v19) {
          goto LABEL_16;
        }
      }
    }
    unint64_t v16 = 0;
LABEL_16:
    uint64_t v20 = (const char *)malloc_type_malloc(v16 + 1, 0xC67CD412uLL);
    if (!v20) {
      goto LABEL_46;
    }
    unint64_t v21 = (char *)v20;
    char v22 = *v14;
    size_t v23 = v20;
    if (*v14)
    {
      unsigned int v24 = (char *)v20;
      do
      {
        if (v22 < 33 || v22 == 37 || v22 == 127 || v22 == 61)
        {
          char *v24 = 37;
          v24[1] = a0123456789abcd_2[(unint64_t)*v14 >> 4];
          size_t v23 = v24 + 3;
          v24[2] = a0123456789abcd_2[*v14 & 0xF];
          v24 += 3;
        }
        else
        {
          *v24++ = v22;
          size_t v23 = v24;
        }
        char v25 = *++v14;
        char v22 = v25;
      }
      while (v25);
    }
    *size_t v23 = 0;
    size_t v26 = strlen(v20);
    int v27 = sub_2099C435C((uint64_t)v8, v21, v26, *(void *)(a2 + 112));
    free(v21);
    if (v27) {
      break;
    }
    uint64_t v28 = v8;
    uint64_t v29 = (unsigned char *)*v8;
    if (*v8)
    {
      size_t v31 = v52;
      uint64_t v30 = v53;
      __s = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      int v32 = *(_DWORD *)(a2 + 124);
      if ((v32 & 2) != 0)
      {
        size_t v33 = (char *)malloc_type_malloc(((4 * v52) | 2) / 3 + 1, 0x54E2FD0uLL);
        __int16 v34 = v33;
        if (v33)
        {
          uint64_t v35 = (unsigned __int8 *)v30;
          unint64_t v36 = v31;
          uint64_t v37 = v33;
          if (v31 >= 3)
          {
            uint64_t v37 = v33;
            unint64_t v36 = v31;
            uint64_t v35 = (unsigned __int8 *)v30;
            do
            {
              int v38 = (char)*v35;
              int v39 = (char)v35[1];
              uint64_t v40 = v35[2] & 0x3F;
              unint64_t v41 = v35[2] | (v39 << 8);
              v35 += 3;
              v36 -= 3;
              *uint64_t v37 = aAbcdefghijklmn_0[v38 >> 2];
              v37[1] = aAbcdefghijklmn_0[((unint64_t)((v39 << 8) & 0xF000 | (v38 << 16)) >> 12) & 0x3F];
              v37[2] = aAbcdefghijklmn_0[(v41 >> 6) & 0x3F];
              v37[3] = aAbcdefghijklmn_0[v40];
              v37 += 4;
            }
            while (v36 > 2);
          }
          uint64_t v49 = v30;
          if (v36 == 2)
          {
            int v46 = (char)*v35;
            int v47 = (char)v35[1];
            *uint64_t v37 = aAbcdefghijklmn_0[v46 >> 2];
            int v43 = v37 + 2;
            v37[1] = aAbcdefghijklmn_0[((unint64_t)((v47 << 8) & 0xF000 | (v46 << 16)) >> 12) & 0x3F];
            int v44 = 4 * (v47 & 0xF);
            uint64_t v45 = 3;
LABEL_38:
            v37 += v45;
            *int v43 = aAbcdefghijklmn_0[v44];
          }
          else if (v36 == 1)
          {
            unsigned __int8 v42 = *v35;
            *uint64_t v37 = aAbcdefghijklmn_0[*v35 >> 2];
            int v43 = v37 + 1;
            int v44 = 16 * (v42 & 3);
            uint64_t v45 = 2;
            goto LABEL_38;
          }
          *uint64_t v37 = 0;
          __s = 0;
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          sub_209974714((uint64_t *)&__s, "LIBARCHIVE.xattr.", 0x11uLL);
          sub_2099C4040((uint64_t *)&__s, v29);
          size_t v48 = strlen(v34);
          sub_2099D676C(v50, __s, v34, v48);
          sub_20997954C((uint64_t)&__s);
        }
        free(v34);
        int v32 = *(_DWORD *)(a2 + 124);
      }
      if (v32)
      {
        __s = 0;
        uint64_t v56 = 0;
        uint64_t v57 = 0;
        sub_209974714((uint64_t *)&__s, "SCHILY.xattr.", 0xDuLL);
        sub_2099C4040((uint64_t *)&__s, v29);
        sub_2099D676C(v50, __s, v30, v31);
        sub_20997954C((uint64_t)&__s);
      }
    }
    --v7;
    unint64_t v8 = v28;
    uint64_t v3 = v51;
    if (!v7) {
      return 0;
    }
  }
  if (v27 == -1)
  {
LABEL_46:
    archive_set_error(a1, 12, "Can't allocate memory", v9, v10, v11, v12, v13, v49);
    return 4294967266;
  }
  archive_set_error(a1, -1, "Error encoding pax extended attribute", v9, v10, v11, v12, v13, v49);
  return 4294967271;
}

uint64_t sub_2099D662C(uint64_t a1, char *__s)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (__s && (int v4 = *__s, *__s))
  {
    int64_t v5 = strlen(__s);
    size_t v6 = v5;
    if (v5 >= 1)
    {
      while (1)
      {
        int v7 = __s[v6 - 1];
        if (v7 != 47)
        {
          if (v6 < 2)
          {
            if (v4 == 46)
            {
              strcpy((char *)a1, "PaxHeader/currentdir");
              return a1;
            }
            size_t v6 = 1;
LABEL_18:
            strcpy(__sa, "PaxHeader");
            sub_2099D5ABC((char *)a1, __s, v6, __sa);
            return a1;
          }
          if (v7 != 46 || __s[v6 - 2] != 47) {
            goto LABEL_18;
          }
        }
        if ((uint64_t)v6-- <= 1) {
          goto LABEL_14;
        }
      }
    }
    if (v5) {
      goto LABEL_18;
    }
LABEL_14:
    *(_DWORD *)(a1 + 15) = 7498084;
    uint64_t v9 = "/PaxHeader/rootdir";
  }
  else
  {
    uint64_t v9 = "PaxHeader/blank";
  }
  *(_OWORD *)a1 = *(_OWORD *)v9;
  return a1;
}

uint64_t *sub_2099D676C(uint64_t *a1, char *__s, const void *a3, size_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v8 = strlen(__s);
  int v9 = a4 + v8 + 3;
  if (v9 < 1)
  {
    int v10 = 0;
    int v11 = 1;
  }
  else
  {
    int v10 = 0;
    int v11 = 1;
    unsigned int v12 = a4 + v8 + 3;
    do
    {
      ++v10;
      v11 *= 10;
      BOOL v13 = v12 >= 9;
      BOOL v14 = v12 == 9;
      v12 /= 0xAu;
    }
    while (!v14 && v13);
  }
  int v15 = v10 + v9;
  v19[1] = 0;
  if (v15 >= v11) {
    ++v15;
  }
  if (v15 >= 0) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = -v15;
  }
  uint64_t v17 = v19;
  do
  {
    *v17-- = a0123456789[v16 % 0xA];
    BOOL v13 = v16 >= 9;
    BOOL v14 = v16 == 9;
    v16 /= 0xAuLL;
  }
  while (!v14 && v13);
  if (v15 < 0) {
    unsigned char *v17 = 45;
  }
  else {
    ++v17;
  }
  sub_2099C4040(a1, v17);
  sub_2099C4050(a1, 32);
  sub_2099C4040(a1, __s);
  sub_2099C4050(a1, 61);
  sub_2099C3FEC(a1, a3, a4);
  return sub_2099C4050(a1, 10);
}

uint64_t sub_2099D68DC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v8 = malloc_type_malloc(0x20uLL, 0x1020040A02120EAuLL);
  if (!v8) {
    return 4294967266;
  }
  *(void *)int v8 = 0;
  v8[2] = a4;
  *((void *)v8 + 2) = a2;
  *((void *)v8 + 3) = a3;
  int v9 = (void *)(a1 + 96);
  if (*(void *)(a1 + 96) && (int v10 = *(void **)(a1 + 104)) != 0) {
    int v9 = (void *)(a1 + 104);
  }
  else {
    int v10 = (void *)(a1 + 104);
  }
  uint64_t v11 = 0;
  *int v10 = v8;
  *int v9 = v8;
  return v11;
}

uint64_t sub_2099D6974(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = **(void **)(a1 + 2472);
  if (strcmp(__s1, "hdrcharset")) {
    return 4294967276;
  }
  if (a3 && *a3)
  {
    unsigned int v12 = sub_2099756A4(a1, a3, 0);
    *(void *)(v5 + 216) = v12;
    if (v12) {
      return 0;
    }
    else {
      return 4294967266;
    }
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "lha: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, v13);
    return 4294967271;
  }
}

uint64_t sub_2099D6A10(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((byte_2675F73A0 & 1) == 0)
  {
    uint64_t v10 = 0;
    byte_2675F73A0 = 1;
    do
    {
      int v11 = -8;
      int v12 = v10;
      do
      {
        int v12 = (v12 << 31 >> 31) & 0xA001 ^ ((unsigned __int16)v12 >> 1);
        BOOL v13 = __CFADD__(v11++, 1);
      }
      while (!v13);
      word_2675F73A2[v10++] = v12;
    }
    while (v10 != 256);
    for (uint64_t i = 0; i != 256; ++i)
      word_2675F73A2[i + 256] = word_2675F73A2[word_2675F73A2[i]] ^ HIBYTE(word_2675F73A2[i]);
  }
  *(_DWORD *)(a1 + 16) = 720896;
  if (!*(void *)(a1 + 24)) {
    *(void *)(a1 + 24) = "lha";
  }
  uint64_t v160 = 0;
  uint64_t v161 = 0;
  uint64_t v162 = 0;
  uint64_t v158 = 0;
  uint64_t v159 = 0;
  uint64_t v156 = 0;
  uint64_t v157 = 0;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  uint64_t v149 = 0;
  uint64_t v15 = **(void **)(a1 + 2472);
  *(_WORD *)(v15 + 299) = 0;
  *(unsigned char *)(v15 + 301) = 0;
  *(void *)(v15 + 16) = 0;
  unint64_t v16 = (unsigned __int8 *)sub_2099738A4(a1, 0x16uLL, 0, a4, a5, a6, a7, a8);
  if (!v16)
  {
    uint64_t v25 = 1;
    size_t v26 = (unsigned char *)sub_2099738A4(a1, 1uLL, 0, v17, v18, v19, v20, v21);
    if (!v26) {
      return v25;
    }
    if (*v26) {
      goto LABEL_19;
    }
    return 1;
  }
  char v22 = v16;
  if (*(unsigned char *)(v15 + 297)) {
    goto LABEL_13;
  }
  int v23 = *v16;
  if (v23 == 77)
  {
    if (v16[1] == 90)
    {
      v164[0] = 0;
      size_t v30 = 4096;
      while (1)
      {
        while (1)
        {
          size_t v31 = sub_2099738A4(a1, v30, v164, v17, v18, v19, v20, v21);
          size_t v33 = v31;
          if (v31) {
            break;
          }
          BOOL v13 = v30 >= 0x32;
          v30 >>= 1;
          if (!v13)
          {
LABEL_36:
            unsigned int v24 = "Couldn't find out LHa header";
            goto LABEL_20;
          }
        }
        if (v164[0] < 22) {
          goto LABEL_36;
        }
        __int16 v34 = (unsigned char *)v31;
        if (v164[0] != 22) {
          break;
        }
LABEL_34:
        sub_209973BDC(a1, (uint64_t)&v34[-v33], v32, v17, v18, v19, v20, v21);
      }
      unint64_t v35 = v31 + v164[0];
      __int16 v34 = (unsigned char *)v31;
      while (1)
      {
        uint64_t v36 = sub_20997B010(v34);
        if (!v36) {
          break;
        }
        v34 += v36;
        if ((unint64_t)(v34 + 22) >= v35) {
          goto LABEL_34;
        }
      }
      sub_209973BDC(a1, (uint64_t)&v34[-v33], v32, v17, v18, v19, v20, v21);
      char v22 = (unsigned __int8 *)sub_2099738A4(a1, 1uLL, 0, v55, v56, v57, v58, v59);
      if (!v22)
      {
LABEL_19:
        unsigned int v24 = "Truncated LHa header";
LABEL_20:
        int v27 = (_DWORD *)a1;
        int v28 = 79;
LABEL_21:
        archive_set_error(v27, v28, v24, v17, v18, v19, v20, v21, v148);
        return 4294967266;
      }
    }
LABEL_13:
    int v23 = *v22;
  }
  if (!v23) {
    return 1;
  }
  if (sub_20997B010(v22))
  {
    unsigned int v24 = "Bad LHa file";
    goto LABEL_20;
  }
  *(unsigned char *)(v15 + 297) = 1;
  *(void *)(v15 + 32) = 0;
  *(unsigned char *)(v15 + 40) = v22[20];
  *(unsigned char *)(v15 + 41) = v22[3];
  *(unsigned char *)(v15 + 42) = v22[4];
  int v37 = v22[5];
  *(unsigned char *)(v15 + 43) = v37;
  int v38 = *(unsigned __int16 *)(v15 + 41);
  int v39 = v38 ^ 0x686C | v37 ^ 0x64;
  BOOL v42 = v39 == 0;
  BOOL v40 = v39 != 0;
  char v41 = v42;
  *(unsigned char *)(v15 + 298) = v41;
  BOOL v42 = v38 == 26732 && v37 == 48;
  BOOL v44 = !v42 && (*(_WORD *)(v15 + 41) != 31340 || *(unsigned char *)(v15 + 43) != 52);
  *(void *)(v15 + 48) = 0;
  uint64_t v45 = (uint64_t *)(v15 + 48);
  *(unsigned char *)(v15 + 302) = v44;
  if (v40) {
    __int16 v46 = 438;
  }
  else {
    __int16 v46 = 511;
  }
  *(void *)(v15 + 56) = 0;
  *(_DWORD *)(v15 + 64) = 0;
  *(_OWORD *)(v15 + 72) = 0u;
  *(_OWORD *)(v15 + 88) = 0u;
  *(_OWORD *)(v15 + 104) = 0u;
  *(_WORD *)(v15 + 120) = v46;
  *(void *)(v15 + 232) = 0;
  *(void *)(v15 + 256) = 0;
  *(unsigned char *)(v15 + 296) = 0;
  *(void *)(v15 + 128) = 0;
  *(void *)(v15 + 136) = 0;
  uint64_t v47 = *(void *)(v15 + 216);
  *(void *)(v15 + 200) = v47;
  *(void *)(v15 + 208) = v47;
  switch(v22[20])
  {
    case 0u:
      size_t v48 = (unsigned __int8 *)sub_2099738A4(a1, 0x18uLL, 0, v17, v18, v19, v20, v21);
      if (!v48) {
        goto LABEL_19;
      }
      uint64_t v49 = v48;
      *(void *)(v15 + 32) = *v48 + 2;
      int v50 = v48[1];
      *(void *)(v15 + 48) = *(unsigned int *)(v48 + 7);
      *(void *)(v15 + 56) = *(unsigned int *)(v48 + 11);
      *(void *)(v15 + 88) = sub_2099D8924(v48 + 15);
      size_t v51 = v49[21];
      size_t v52 = *(void *)(v15 + 32);
      int v53 = v52 - v51 - 24;
      BOOL v54 = v53 < 0 || v51 > 0xDD;
      if (v54 && v52 - v51 != 22)
      {
        unsigned int v24 = "Invalid LHa header";
        goto LABEL_20;
      }
      size_t v75 = sub_2099738A4(a1, v52, 0, v17, v18, v19, v20, v21);
      if (!v75) {
        goto LABEL_19;
      }
      size_t v76 = v75;
      *(void *)(v15 + 256) = 0;
      size_t v77 = v75 + 22;
      sub_209974714((uint64_t *)(v15 + 248), (unsigned char *)(v75 + 22), v51);
      if ((v53 & 0x80000000) == 0)
      {
        *(_WORD *)(v15 + 194) = *(_WORD *)(v77 + v51);
        *(_DWORD *)(v15 + 64) |= 8u;
      }
      uint64_t v84 = *(void *)(v15 + 32);
      unsigned __int8 v85 = 0;
      uint64_t v86 = v84 - 2;
      if (v84 != 2)
      {
        v87 = (char *)(v76 + 2);
        do
        {
          char v88 = *v87++;
          v85 += v88;
          --v86;
        }
        while (v86);
      }
      if (v53 >= 1 && *(unsigned char *)(v51 + v76 + 24) == 85 && v53 == 12)
      {
        *(void *)(v15 + 88) = *(unsigned int *)(v51 + v76 + 26);
        *(_WORD *)(v15 + 120) = *(_WORD *)(v51 + v76 + 30);
        *(void *)(v15 + 128) = *(unsigned __int16 *)(v51 + v76 + 32);
        *(void *)(v15 + 136) = *(unsigned __int16 *)(v51 + v76 + 34);
        *(_DWORD *)(v15 + 64) |= 4u;
      }
      sub_209973BDC(a1, v84, v78, v79, v80, v81, v82, v83);
      if (v50 == v85)
      {
        uint64_t v25 = 0;
        goto LABEL_105;
      }
      unsigned int v24 = "LHa header sum error";
      int v27 = (_DWORD *)a1;
      int v28 = -1;
      goto LABEL_21;
    case 1u:
      uint64_t v60 = (unsigned __int8 *)sub_2099738A4(a1, 0x1BuLL, 0, v17, v18, v19, v20, v21);
      if (!v60) {
        goto LABEL_101;
      }
      uint64_t v61 = v60;
      *(void *)(v15 + 32) = *v60 + 2;
      int v62 = v60[1];
      *(void *)(v15 + 48) = *(unsigned int *)(v60 + 7);
      *(void *)(v15 + 56) = *(unsigned int *)(v60 + 11);
      *(void *)(v15 + 88) = sub_2099D8924(v60 + 15);
      size_t v63 = v61[21];
      if (v63 > 0xE6) {
        goto LABEL_81;
      }
      size_t v64 = *(void *)(v15 + 32);
      if ((int)v64 - 27 < (int)v63) {
        goto LABEL_81;
      }
      size_t v65 = sub_2099738A4(a1, v64, 0, v17, v18, v19, v20, v21);
      if (!v65) {
        goto LABEL_101;
      }
      size_t v66 = v65;
      if (v63)
      {
        uint64_t v67 = (unsigned __int8 *)(v65 + 22);
        size_t v68 = v63;
        while (1)
        {
          int v69 = *v67++;
          if (v69 == 255) {
            break;
          }
          if (!--v68) {
            goto LABEL_119;
          }
        }
LABEL_81:
        uint64_t v72 = "Invalid LHa header";
        goto LABEL_102;
      }
      size_t v63 = 0;
LABEL_119:
      *(void *)(v15 + 256) = 0;
      sub_209974714((uint64_t *)(v15 + 248), (unsigned char *)(v65 + 22), v63);
      *(_WORD *)(v15 + 194) = *(_WORD *)(v66 + 22 + v63);
      *(_DWORD *)(v15 + 64) |= 8u;
      uint64_t v130 = *(void *)(v15 + 32);
      unsigned __int8 v131 = 0;
      uint64_t v132 = v130 - 2;
      if (v130 != 2)
      {
        uint64_t v133 = (char *)(v66 + 2);
        uint64_t v134 = v132;
        do
        {
          char v135 = *v133++;
          v131 += v135;
          --v134;
        }
        while (v134);
      }
      v164[0] = 0;
      sub_209973BDC(a1, v132, v124, v125, v126, v127, v128, v129);
      uint64_t v138 = sub_2099D899C((_DWORD *)a1, v15, 0, 2, *(void *)(v15 + 48) + 2, v164, v136, v137);
      uint64_t v25 = v138;
      if ((int)v138 >= -20)
      {
        uint64_t v139 = *v45 - v164[0] + 2;
        *uint64_t v45 = v139;
        if (v139 < 0) {
          goto LABEL_81;
        }
        if (v62 == v131)
        {
          uint64_t v25 = v138 & ((int)v138 >> 31);
        }
        else
        {
          uint64_t v72 = "LHa header sum error";
          v107 = (_DWORD *)a1;
          int v108 = -1;
LABEL_103:
          archive_set_error(v107, v108, v72, v17, v18, v19, v20, v21, v148);
          uint64_t v25 = 4294967266;
        }
      }
      goto LABEL_104;
    case 2u:
      uint64_t v70 = (unsigned __int16 *)sub_2099738A4(a1, 0x18uLL, 0, v17, v18, v19, v20, v21);
      if (!v70) {
        goto LABEL_101;
      }
      unint64_t v71 = *v70;
      *(void *)(v15 + 32) = v71;
      *(void *)(v15 + 48) = *(unsigned int *)((char *)v70 + 7);
      *(void *)(v15 + 56) = *(unsigned int *)((char *)v70 + 11);
      *(void *)(v15 + 88) = *(unsigned int *)((char *)v70 + 15);
      *(_WORD *)(v15 + 194) = *(unsigned __int16 *)((char *)v70 + 21);
      *(_DWORD *)(v15 + 64) |= 8u;
      if (v71 < 0x18)
      {
        uint64_t v72 = "Invalid LHa header size";
LABEL_102:
        v107 = (_DWORD *)a1;
        int v108 = 79;
        goto LABEL_103;
      }
      v164[0] = 0;
      unsigned __int16 v163 = sub_2099D9048(0, (char *)v70, 0x18uLL);
      sub_209973BDC(a1, 24, v90, v91, v92, v93, v94, v95);
      uint64_t v25 = sub_2099D899C((_DWORD *)a1, v15, &v163, 2, *(void *)(v15 + 32) - 24, v164, v96, v97);
      if ((int)v25 < -20) {
        goto LABEL_104;
      }
      int v98 = *(_DWORD *)(v15 + 32) - LODWORD(v164[0]);
      unint64_t v99 = (v98 - 24);
      if ((int)v99 >= 1)
      {
        uint64_t v100 = (char *)sub_2099738A4(a1, (v98 - 24), 0, v17, v18, v19, v20, v21);
        if (!v100)
        {
LABEL_101:
          uint64_t v72 = "Truncated LHa header";
          goto LABEL_102;
        }
        unsigned __int16 v163 = sub_2099D9048(v163, v100, v99);
        sub_209973BDC(a1, v99, v101, v102, v103, v104, v105, v106);
      }
LABEL_115:
      if (v163 != *(unsigned __int16 *)(v15 + 192))
      {
        uint64_t v72 = "LHa header CRC error";
        goto LABEL_102;
      }
LABEL_104:
      if ((int)v25 < -20) {
        return v25;
      }
LABEL_105:
      if (!*(unsigned char *)(v15 + 298) && !*(void *)(v15 + 256)) {
        goto LABEL_19;
      }
      uint64_t v157 = 0;
      uint64_t v158 = 0;
      uint64_t v159 = 0;
      uint64_t v161 = 0;
      uint64_t v162 = 0;
      uint64_t v160 = 0;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      if (sub_2099743FC((uint64_t)&v150, *(char **)(v15 + 224), *(void *)(v15 + 232), *(void *)(v15 + 200)))
      {
        uint64_t v109 = *(void *)(v15 + 200);
LABEL_109:
        size_t v110 = (char *)sub_2099C42E4(v109);
        archive_set_error((_DWORD *)a1, 79, "Pathname cannot be converted from %s to Unicode.", v111, v112, v113, v114, v115, v110);
LABEL_111:
        sub_209975080((uint64_t)&v150);
        sub_20997954C((uint64_t)&v157);
        sub_20997954C((uint64_t)&v160);
        return 4294967266;
      }
      if (sub_20997549C(a1, (uint64_t)&v150, &v149)) {
        goto LABEL_111;
      }
      uint64_t v158 = 0;
      sub_2099770B0((uint64_t *)&v157, (uint64_t)&v153);
      *((void *)&v150 + 1) = 0;
      *(void *)&long long v152 = 0;
      *(void *)&long long v155 = 0;
      *((void *)&v153 + 1) = 0;
      if (sub_2099743FC((uint64_t)&v150, *(char **)(v15 + 248), *(void *)(v15 + 256), *(void *)(v15 + 208)))
      {
        uint64_t v109 = *(void *)(v15 + 208);
        goto LABEL_109;
      }
      if (sub_20997549C(a1, (uint64_t)&v150, &v149)) {
        goto LABEL_111;
      }
      sub_2099770B0((uint64_t *)&v157, (uint64_t)&v153);
      sub_209975080((uint64_t)&v150);
      __int16 v140 = *(_WORD *)(v15 + 120);
      if ((v140 & 0xF000) == 0xA000)
      {
        if (!sub_2099D87A8((uint64_t *)&v160, (uint64_t)&v157))
        {
          archive_set_error((_DWORD *)a1, 79, "Unknown symlink-name", v141, v142, v143, v144, v145, v148);
          sub_20997954C((uint64_t)&v157);
          sub_20997954C((uint64_t)&v160);
          return 4294967271;
        }
      }
      else
      {
        if (*(unsigned char *)(v15 + 298)) {
          __int16 v146 = 0x4000;
        }
        else {
          __int16 v146 = 0x8000;
        }
        *(_WORD *)(v15 + 120) = v146 & 0xF000 | v140 & 0xFFF;
      }
      if (*(unsigned char *)(v15 + 64) & 4) == 0 && (*(unsigned char *)(v15 + 296)) {
        *(_WORD *)(v15 + 120) &= 0xFF6Du;
      }
      archive_entry_copy_pathname_w((uint64_t)a2, v157);
      sub_20997954C((uint64_t)&v157);
      if (v161) {
        archive_entry_copy_symlink_w((uint64_t)a2, v160);
      }
      else {
        archive_entry_set_symlink((uint64_t)a2, 0);
      }
      sub_20997954C((uint64_t)&v160);
      if (!v22[20]) {
        sub_2099D881C(v15, a2);
      }
      archive_entry_set_mode((uint64_t)a2, *(_WORD *)(v15 + 120));
      archive_entry_set_uid((uint64_t)a2, *(void *)(v15 + 128));
      archive_entry_set_gid((uint64_t)a2, *(void *)(v15 + 136));
      if (*(void *)(v15 + 152)) {
        archive_entry_set_uname((uint64_t)a2, *(char **)(v15 + 144));
      }
      if (*(void *)(v15 + 176)) {
        archive_entry_set_gname((uint64_t)a2, *(char **)(v15 + 168));
      }
      if (*(unsigned char *)(v15 + 64))
      {
        archive_entry_set_birthtime((uint64_t)a2, *(void *)(v15 + 72), *(void *)(v15 + 80));
        archive_entry_set_ctime((uint64_t)a2, *(void *)(v15 + 72), *(void *)(v15 + 80));
      }
      else
      {
        archive_entry_unset_birthtime((uint64_t)a2);
        archive_entry_unset_ctime((uint64_t)a2);
      }
      archive_entry_set_mtime((uint64_t)a2, *(void *)(v15 + 88), *(void *)(v15 + 96));
      if ((*(unsigned char *)(v15 + 64) & 2) != 0) {
        archive_entry_set_atime((uint64_t)a2, *(void *)(v15 + 104), *(void *)(v15 + 112));
      }
      else {
        archive_entry_unset_atime((uint64_t)a2);
      }
      if (*(unsigned char *)(v15 + 298) || archive_entry_symlink((uint64_t)a2)) {
        archive_entry_unset_size((uint64_t)a2);
      }
      else {
        archive_entry_set_size((uint64_t)a2, *(void *)(v15 + 56));
      }
      uint64_t v147 = *(void *)(v15 + 48);
      *(void *)(v15 + 8) = v147;
      if (v147 < 0)
      {
        unsigned int v24 = "Invalid LHa entry size";
        goto LABEL_20;
      }
      *(void *)uint64_t v15 = 0;
      *(_WORD *)(v15 + 24) = 0;
      if (!v147 || *(unsigned char *)(v15 + 298)) {
        *(unsigned char *)(v15 + 300) = 1;
      }
      __sprintf_chk((char *)(v15 + 303), 0, 0x40uLL, "lha -%c%c%c-", *(char *)(v15 + 41), *(char *)(v15 + 42), *(char *)(v15 + 43));
      *(void *)(a1 + 24) = v15 + 303;
      break;
    case 3u:
      size_t v73 = sub_2099738A4(a1, 0x1CuLL, 0, v17, v18, v19, v20, v21);
      if (!v73) {
        goto LABEL_101;
      }
      if (*(_WORD *)v73 != 4) {
        goto LABEL_81;
      }
      uint64_t v74 = *(unsigned int *)(v73 + 24);
      *(void *)(v15 + 32) = v74;
      *(void *)(v15 + 48) = *(unsigned int *)(v73 + 7);
      *(void *)(v15 + 56) = *(unsigned int *)(v73 + 11);
      *(void *)(v15 + 88) = *(unsigned int *)(v73 + 15);
      *(_WORD *)(v15 + 194) = *(_WORD *)(v73 + 21);
      *(_DWORD *)(v15 + 64) |= 8u;
      if (v74 < 0x20) {
        goto LABEL_81;
      }
      v164[0] = 0;
      unsigned __int16 v163 = sub_2099D9048(0, (char *)v73, 0x1CuLL);
      sub_209973BDC(a1, 28, v116, v117, v118, v119, v120, v121);
      uint64_t v25 = sub_2099D899C((_DWORD *)a1, v15, &v163, 4, *(void *)(v15 + 32) - 28, v164, v122, v123);
      if ((int)v25 >= -20) {
        goto LABEL_115;
      }
      goto LABEL_104;
    default:
      uint64_t v148 = (char *)v22[20];
      unsigned int v24 = "Unsupported LHa header level %d";
      goto LABEL_20;
  }
  return v25;
}

uint64_t sub_2099D756C(uint64_t a1, char **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (void *)a4;
  uint64_t v9 = (void *)a3;
  uint64_t v11 = a1;
  int v12 = *(uint64_t **)(a1 + 2472);
  uint64_t v13 = *v12;
  uint64_t v14 = *(void *)(*v12 + 16);
  if (v14)
  {
    sub_209973BDC(a1, v14, a3, a4, a5, a6, a7, a8);
    *(void *)(v13 + 16) = 0;
  }
  if (*(unsigned char *)(v13 + 300))
  {
    *uint64_t v8 = *(void *)v13;
    *uint64_t v9 = 0;
    *a2 = 0;
    return sub_2099D913C(v11, v14, a3, a4, a5, a6, a7, a8);
  }
  unint64_t v16 = **(uint64_t ***)(v11 + 2472);
  if (!*(unsigned char *)(v13 + 302))
  {
    *(void *)&v176[0] = 0;
    if (!v16[1])
    {
      uint64_t result = 0;
      *a2 = 0;
      *uint64_t v9 = 0;
      *uint64_t v8 = *v16;
      *((unsigned char *)v16 + 300) = 1;
      return result;
    }
    int v23 = (char *)sub_2099738A4(v11, 1uLL, v176, a4, a5, a6, a7, a8);
    *a2 = v23;
    unint64_t v24 = *(void *)&v176[0];
    if (*(uint64_t *)&v176[0] > 0)
    {
      uint64_t v25 = v16[1];
      if (*(uint64_t *)&v176[0] > v25)
      {
        *(void *)&v176[0] = v16[1];
        unint64_t v24 = v25;
      }
      *((_WORD *)v16 + 12) = sub_2099D9048(*((unsigned __int16 *)v16 + 12), v23, v24);
      *uint64_t v9 = v24;
      *uint64_t v8 = *v16;
      unint64_t v26 = v16[1] - v24;
      *v16 += v24;
      v16[1] = v26;
      if (!v26) {
        *((unsigned char *)v16 + 300) = 1;
      }
      uint64_t result = 0;
      v16[2] = v24;
      return result;
    }
    int v39 = "Truncated LHa file data";
    goto LABEL_241;
  }
  uint64_t v175 = 0;
  if (!*((unsigned char *)v16 + 299))
  {
    int v27 = (char *)v16[52];
    if (!v27)
    {
      int v27 = (char *)malloc_type_calloc(1uLL, 0x158uLL, 0x103004074F3FEA5uLL);
      v16[52] = (uint64_t)v27;
      if (!v27) {
        goto LABEL_267;
      }
    }
    *((_DWORD *)v27 + 85) = -25;
    if (*((unsigned char *)v16 + 41) != 108 || *((unsigned char *)v16 + 42) != 104) {
      goto LABEL_29;
    }
    int v28 = *((char *)v16 + 43);
    switch(v28)
    {
      case '5':
        int v31 = 0;
        int v29 = 0;
        int v30 = 13;
        break;
      case '7':
        int v31 = 0;
        int v30 = 16;
        int v29 = 1;
        break;
      case '6':
        int v29 = 0;
        int v30 = 15;
        int v31 = 1;
        break;
      default:
LABEL_29:
        *a2 = 0;
        *uint64_t v9 = 0;
        *uint64_t v8 = 0;
        archive_set_error((_DWORD *)v11, 79, "Unsupported lzh compression method -%c%c%c-", a4, a5, a6, a7, a8, (char *)*((char *)v16 + 41));
        sub_2099D8738(v11, v32, v33, v34, v35, v36, v37, v38);
        return 4294967276;
    }
    *((_DWORD *)v27 + 85) = -30;
    *(void *)(v27 + 4) = *(void *)"";
    long long v152 = (char *)*((void *)v27 + 2);
    if (v152)
    {
      uint64_t v153 = 0x20000;
    }
    else
    {
      long long v152 = (char *)malloc_type_malloc(0x20000uLL, 0x2D29F6F8uLL);
      *((void *)v27 + 2) = v152;
      if (!v152) {
        goto LABEL_267;
      }
      uint64_t v153 = *((int *)v27 + 1);
    }
    memset(&v152[v153 - (1 << v30)], 32, (1 << v30));
    *((_DWORD *)v27 + 6) = 0;
    *(_DWORD *)int v27 = 0;
    *((_DWORD *)v27 + 79) = v30 + 1;
    if (v31 | v29) {
      int v154 = 5;
    }
    else {
      int v154 = 4;
    }
    *((_DWORD *)v27 + 80) = v154;
    *(void *)(v27 + 324) = 0x500000013;
    *((void *)v27 + 5) = 0;
    *((_DWORD *)v27 + 12) = 0;
    if (!sub_2099D91B4((uint64_t)(v27 + 56), 0x1FEuLL))
    {
      *((_DWORD *)v27 + 16) = 9;
      if (!sub_2099D91B4((uint64_t)(v27 + 184), 0x13uLL))
      {
        *((_DWORD *)v27 + 85) = 0;
        *((unsigned char *)v16 + 299) = 1;
        *((_DWORD *)v16 + 100) = 0;
        v16[51] = 0;
        goto LABEL_9;
      }
    }
LABEL_267:
    int v39 = "Couldn't allocate memory for lzh decompression";
    uint64_t v145 = (_DWORD *)v11;
    int v146 = 12;
    goto LABEL_268;
  }
LABEL_9:
  v16[46] = sub_2099738A4(v11, 1uLL, &v175, a4, a5, a6, a7, a8);
  uint64_t v19 = v175;
  if (v175 <= 0)
  {
    int v39 = "Truncated LHa file body";
LABEL_241:
    uint64_t v145 = (_DWORD *)v11;
    int v146 = 79;
LABEL_268:
    archive_set_error(v145, v146, v39, a4, a5, a6, a7, a8, v157);
    return 4294967266;
  }
  uint64_t v169 = v16[1];
  if (v175 > v169)
  {
    uint64_t v19 = v16[1];
    uint64_t v175 = v19;
  }
  *((_DWORD *)v16 + 94) = v19;
  v16[48] = 0;
  *((_DWORD *)v16 + 100) = 0;
  uint64_t v20 = (int *)v16[52];
  int v21 = v20[85];
  if (v21)
  {
    uint64_t v22 = 0;
    goto LABEL_248;
  }
  uint64_t v166 = v19;
  uint64_t v167 = v16;
  uint64_t v158 = v9;
  uint64_t v159 = v11;
  BOOL v40 = v16 + 46;
  uint64_t v162 = v8;
  uint64_t v171 = v16 + 46;
  v164 = (int *)v16[52];
  uint64_t v165 = a2;
  while (1)
  {
    uint64_t v41 = v16[52];
    if (*v20 <= 8) {
      break;
    }
    unsigned __int16 v163 = (_OWORD *)(v41 + 40);
    v176[0] = *(_OWORD *)(v41 + 40);
    uint64_t v94 = *(void *)(v41 + 16);
    uint64_t v170 = *(void *)(v41 + 136);
    uint64_t v160 = *(void *)(v41 + 264);
    int v95 = *(_DWORD *)(v41 + 312);
    int i = *(_DWORD *)(v41 + 28);
    int v97 = *(_DWORD *)(v41 + 32);
    LODWORD(v98) = *(_DWORD *)(v41 + 24);
    int v99 = *(_DWORD *)(v41 + 4);
    int v174 = *(_DWORD *)(v41 + 8);
    uint64_t v100 = *(int *)(v41 + 144);
    uint64_t v161 = *(int *)(v41 + 272);
    int v101 = *(_DWORD *)v41;
    uint64_t v168 = v100;
LABEL_130:
    while (2)
    {
      switch(v101)
      {
        case 9:
          uint64_t v98 = (int)v98;
          break;
        case 10:
          int v117 = DWORD2(v176[0]);
          goto LABEL_167;
        case 11:
          goto LABEL_196;
        case 12:
          goto LABEL_202;
        default:
          continue;
      }
      break;
    }
    while (1)
    {
      if (!v95)
      {
        *(_DWORD *)uint64_t v41 = 0;
        *unsigned __int16 v163 = v176[0];
        *(_DWORD *)(v41 + 312) = 0;
        *(_DWORD *)(v41 + 24) = v98;
        *(_DWORD *)(v41 + 28) = 0;
        int v21 = 100;
        goto LABEL_237;
      }
      int v102 = DWORD2(v176[0]);
      if (SDWORD2(v176[0]) >= (int)v100) {
        goto LABEL_148;
      }
      int v103 = sub_2099D9270(v171, (unint64_t *)v176);
      int v102 = DWORD2(v176[0]);
      if (v103)
      {
        uint64_t v100 = v168;
LABEL_148:
        unsigned int v111 = (*(void *)&v176[0] >> (v102 - v100)) & word_2099EC892[v100];
        int v112 = *(_DWORD *)(v41 + 148);
        signed int v106 = *(unsigned __int16 *)(*(void *)(v41 + 168) + 2 * (v111 >> v112));
        signed int v113 = *(_DWORD *)(v41 + 60);
        if (v113 <= v106 && v113 != 0)
        {
          while (1)
          {
            BOOL v83 = __OFSUB__(v112, 1);
            if (--v112 < 0 != v83) {
              break;
            }
            int v115 = v106 - v113;
            if (v115 >= *(_DWORD *)(v41 + 156)) {
              break;
            }
            uint64_t v116 = (unsigned __int16 *)(*(void *)(v41 + 176) + 4 * v115);
            if (((v111 >> v112) & 1) == 0) {
              ++v116;
            }
            signed int v106 = *v116;
            if (v113 > v106) {
              goto LABEL_159;
            }
          }
          signed int v106 = 0;
        }
LABEL_159:
        int v117 = v102 - *(unsigned __int8 *)(v170 + v106);
        DWORD2(v176[0]) = v117;
        goto LABEL_162;
      }
      uint64_t v100 = v168;
      if ((int)v168 <= SDWORD2(v176[0])) {
        goto LABEL_148;
      }
      if (v166 != v169)
      {
        int v144 = 9;
        goto LABEL_230;
      }
      unsigned int v104 = (*(void *)&v176[0] << (v168 - BYTE8(v176[0]))) & word_2099EC892[v168];
      int v105 = *(_DWORD *)(v41 + 148);
      signed int v106 = *(unsigned __int16 *)(*(void *)(v41 + 168) + 2 * (v104 >> v105));
      signed int v107 = *(_DWORD *)(v41 + 60);
      if (v107 <= v106 && v107 != 0)
      {
        while (1)
        {
          BOOL v83 = __OFSUB__(v105, 1);
          if (--v105 < 0 != v83) {
            break;
          }
          int v109 = v106 - v107;
          if (v109 >= *(_DWORD *)(v41 + 156)) {
            break;
          }
          size_t v110 = (unsigned __int16 *)(*(void *)(v41 + 176) + 4 * v109);
          if (((v104 >> v105) & 1) == 0) {
            ++v110;
          }
          signed int v106 = *v110;
          if (v107 > v106) {
            goto LABEL_161;
          }
        }
        signed int v106 = 0;
      }
LABEL_161:
      int v117 = DWORD2(v176[0]) - *(unsigned __int8 *)(v170 + v106);
      DWORD2(v176[0]) = v117;
      if (v117 < 0) {
        goto LABEL_236;
      }
LABEL_162:
      --v95;
      if (v106 > 0xFF) {
        break;
      }
      *(unsigned char *)(v94 + v98++) = v106;
      if (v98 >= v99)
      {
        LODWORD(v98) = 0;
        uint64_t v143 = v16[51];
        v16[49] = *(void *)(v16[52] + 16);
        *((_DWORD *)v16 + 100) = v99;
        v16[51] = v143 + v99;
        int v144 = 9;
LABEL_230:
        BOOL v40 = v171;
        int v21 = 0;
        *unsigned __int16 v163 = v176[0];
        *(_DWORD *)(v41 + 312) = v95;
        *(_DWORD *)uint64_t v41 = v144;
        *(_DWORD *)(v41 + 24) = v98;
        goto LABEL_231;
      }
    }
    int v97 = v106 - 253;
LABEL_167:
    uint64_t v118 = v161;
    if (v117 >= (int)v161) {
      goto LABEL_182;
    }
    int v119 = sub_2099D9270(v171, (unint64_t *)v176);
    int v117 = DWORD2(v176[0]);
    if (v119)
    {
      uint64_t v118 = v161;
LABEL_182:
      unsigned int v125 = (*(void *)&v176[0] >> (v117 - v118)) & word_2099EC892[v118];
      int v126 = *(_DWORD *)(v41 + 276);
      int i = *(unsigned __int16 *)(*(void *)(v41 + 296) + 2 * (v125 >> v126));
      int v127 = *(_DWORD *)(v41 + 188);
      if (v127 <= i && v127 != 0)
      {
        while (1)
        {
          BOOL v83 = __OFSUB__(v126, 1);
          if (--v126 < 0 != v83 || i - v127 >= *(_DWORD *)(v41 + 284)) {
            break;
          }
          uint64_t v129 = (unsigned __int16 *)(*(void *)(v41 + 304) + 4 * (i - v127));
          if (((v125 >> v126) & 1) == 0) {
            ++v129;
          }
          int i = *v129;
          if (v127 > i) {
            goto LABEL_193;
          }
        }
        int i = 0;
      }
LABEL_193:
      DWORD2(v176[0]) = v117 - *(unsigned __int8 *)(v160 + i);
      goto LABEL_196;
    }
    uint64_t v118 = v161;
    if ((int)v161 <= SDWORD2(v176[0])) {
      goto LABEL_182;
    }
    if (v166 != v169)
    {
      *(_DWORD *)(v41 + 32) = v97;
      int v144 = 10;
      goto LABEL_230;
    }
    unsigned int v120 = (*(void *)&v176[0] << (v161 - BYTE8(v176[0]))) & word_2099EC892[v161];
    int v121 = *(_DWORD *)(v41 + 276);
    int i = *(unsigned __int16 *)(*(void *)(v41 + 296) + 2 * (v120 >> v121));
    int v122 = *(_DWORD *)(v41 + 188);
    if (v122 <= i && v122 != 0)
    {
      while (1)
      {
        BOOL v83 = __OFSUB__(v121, 1);
        if (--v121 < 0 != v83 || i - v122 >= *(_DWORD *)(v41 + 284)) {
          break;
        }
        uint64_t v124 = (unsigned __int16 *)(*(void *)(v41 + 304) + 4 * (i - v122));
        if (((v120 >> v121) & 1) == 0) {
          ++v124;
        }
        int i = *v124;
        if (v122 > i) {
          goto LABEL_195;
        }
      }
      int i = 0;
    }
LABEL_195:
    DWORD2(v176[0]) -= *(unsigned __int8 *)(v160 + i);
    if ((SDWORD2(v176[0]) & 0x80000000) == 0)
    {
LABEL_196:
      if (i < 2) {
        goto LABEL_201;
      }
      int v130 = i - 1;
      int v131 = DWORD2(v176[0]);
      if (SDWORD2(v176[0]) >= i - 1
        || (v132 = sub_2099D9270(v171, (unint64_t *)v176), int v131 = DWORD2(v176[0]), v132)
        || SDWORD2(v176[0]) >= v130)
      {
        int v133 = v131 - v130;
        int i = ((*(void *)&v176[0] >> v133) & word_2099EC892[v130]) + (1 << v130);
        DWORD2(v176[0]) = v133;
LABEL_201:
        for (int i = (v98 + ~i) & v174; ; int i = v137 & v174)
        {
LABEL_202:
          int v134 = i <= (int)v98 ? v98 : i;
          int v135 = v99 - v134;
          int v136 = v97 >= v99 - v134 ? v99 - v134 : v97;
          int v137 = v136 + i;
          uint64_t v138 = (char *)(v94 + (int)v98);
          BOOL v139 = v136 + i < (int)v98;
          LODWORD(v98) = v136 + v98;
          size_t v17 = v94 + i;
          BOOL v139 = v139 || (int)v98 < i;
          if (v139)
          {
            memcpy(v138, (const void *)v17, v136);
          }
          else
          {
            if (v136 < 2)
            {
              unint64_t v140 = 0;
            }
            else
            {
              unint64_t v140 = 0;
              do
              {
                uint64_t v141 = &v138[v140];
                *uint64_t v141 = *(unsigned char *)(v94 + i + v140);
                v141[1] = *(unsigned char *)(v94 + 1 + i + v140);
                v140 += 2;
              }
              while (v140 < (v136 - 1));
              unint64_t v140 = v140;
            }
            if ((int)v140 < v136) {
              v138[v140] = *(unsigned char *)(v17 + v140);
            }
          }
          if (v98 == v99) {
            break;
          }
          if (v97 <= v135)
          {
            int v101 = 9;
            unint64_t v16 = v167;
            uint64_t v100 = v168;
            uint64_t v8 = v162;
            goto LABEL_130;
          }
          v97 -= v136;
        }
        uint64_t v142 = v167[51];
        v167[49] = *(void *)(v167[52] + 16);
        *((_DWORD *)v167 + 100) = v99;
        v167[51] = v142 + v99;
        LODWORD(v98) = 0;
        if (v97 <= v135)
        {
          int v144 = 9;
        }
        else
        {
          *(_DWORD *)(v41 + 28) = v137 & v174;
          *(_DWORD *)(v41 + 32) = v97 - v136;
          int v144 = 12;
        }
        unint64_t v16 = v167;
        uint64_t v8 = v162;
        goto LABEL_230;
      }
      if (v166 != v169)
      {
        *(_DWORD *)(v41 + 28) = i;
        *(_DWORD *)(v41 + 32) = v97;
        int v144 = 11;
        goto LABEL_230;
      }
    }
LABEL_236:
    int v21 = -25;
    *(_DWORD *)(v41 + 340) = -25;
LABEL_237:
    BOOL v40 = v171;
LABEL_231:
    uint64_t v20 = v164;
    a2 = v165;
    if (v21 != 100) {
      goto LABEL_247;
    }
  }
  BOOL v42 = (void *)(v41 + 40);
  int v43 = *(_DWORD *)v41;
  uint64_t v172 = (_DWORD *)(v41 + 56);
  __int16 v173 = (int *)(v41 + 184);
  while (2)
  {
    switch(v43)
    {
      case 0:
        int v44 = *(_DWORD *)(v41 + 48);
        if (v44 > 15) {
          goto LABEL_39;
        }
        if (!sub_2099D9270(v40, (unint64_t *)(v41 + 40)))
        {
          if (v166 != v169)
          {
            int v21 = 0;
            goto LABEL_246;
          }
          if (*(int *)(v41 + 48) <= 7)
          {
            uint64_t v155 = *(unsigned int *)(v41 + 24);
            if ((int)v155 < 1)
            {
              int v21 = 1;
            }
            else
            {
              int v21 = 0;
              uint64_t v156 = v16[51];
              v16[49] = *(void *)(v16[52] + 16);
              *((_DWORD *)v16 + 100) = v155;
              v16[51] = v156 + v155;
              *(_DWORD *)(v41 + 24) = 0;
            }
            goto LABEL_246;
          }
LABEL_243:
          int v21 = -25;
          *(_DWORD *)(v41 + 340) = -25;
          goto LABEL_246;
        }
        int v44 = *(_DWORD *)(v41 + 48);
LABEL_39:
        int v45 = v44 - 16;
        BOOL v82 = (unsigned __int16)(*(void *)(v41 + 40) >> v45) == 0;
        *(_DWORD *)(v41 + 312) = (unsigned __int16)(*(void *)(v41 + 40) >> v45);
        if (v82) {
          goto LABEL_243;
        }
        *(_DWORD *)(v41 + 48) = v45;
        *(_DWORD *)(v41 + 184) = *(_DWORD *)(v41 + 324);
        int v46 = *(_DWORD *)(v41 + 328);
        *(_DWORD *)(v41 + 192) = v46;
        *(_DWORD *)(v41 + 332) = 0;
LABEL_42:
        if (v45 < v46)
        {
          int v47 = sub_2099D9270(v40, (unint64_t *)(v41 + 40));
          int v45 = *(_DWORD *)(v41 + 48);
          int v46 = *(_DWORD *)(v41 + 192);
          if (!v47 && v45 < v46)
          {
            if (v166 != v169)
            {
              int v21 = 0;
              int v147 = 1;
              goto LABEL_245;
            }
            goto LABEL_243;
          }
        }
        int v48 = v45 - v46;
        int v49 = (*(void *)(v41 + 40) >> (v45 - v46)) & word_2099EC892[v46];
        *(_DWORD *)(v41 + 188) = v49;
        *(_DWORD *)(v41 + 48) = v48;
        if (!v49)
        {
LABEL_51:
          int v51 = *(_DWORD *)(v41 + 48);
          int v52 = *(_DWORD *)(v41 + 192);
          if (v51 < v52)
          {
            int v53 = sub_2099D9270(v40, (unint64_t *)(v41 + 40));
            int v51 = *(_DWORD *)(v41 + 48);
            int v52 = *(_DWORD *)(v41 + 192);
            if (!v53 && v51 < v52)
            {
              if (v166 != v169)
              {
                int v21 = 0;
                int v147 = 2;
                goto LABEL_245;
              }
              goto LABEL_243;
            }
          }
          uint64_t v54 = (*v42 >> (v51 - v52)) & word_2099EC892[v52];
          if (*v173 <= (int)v54) {
            goto LABEL_243;
          }
          **(_WORD **)(v41 + 296) = v54;
          *(void *)(v41 + 272) = 0;
          *(unsigned char *)(*(void *)(v41 + 264) + v54) = 0;
          *(_DWORD *)(v41 + 48) -= *(_DWORD *)(v41 + 192);
          if (*(_DWORD *)(v41 + 332)) {
            int v43 = 9;
          }
          else {
            int v43 = 5;
          }
LABEL_120:
          *(_DWORD *)uint64_t v41 = v43;
          continue;
        }
LABEL_46:
        int v50 = *v173;
        if (v49 > *v173) {
          goto LABEL_243;
        }
        *(_DWORD *)(v41 + 336) = 0;
        *(_OWORD *)(v41 + 196) = 0u;
        *(_OWORD *)(v41 + 212) = 0u;
        *(_OWORD *)(v41 + 228) = 0u;
        *(_OWORD *)(v41 + 244) = 0u;
        *(_DWORD *)(v41 + 260) = 0;
        if (v49 < 3 || v50 == *(_DWORD *)(v41 + 316))
        {
          int v43 = 4;
          goto LABEL_120;
        }
        uint64_t v55 = 0;
LABEL_63:
        int v59 = sub_2099D9400((uint64_t)v40, v55, 3);
        *(_DWORD *)(v41 + 336) = v59;
        if (v59 <= 2)
        {
          if (v166 == v169 || v59 < 0) {
            goto LABEL_243;
          }
          goto LABEL_281;
        }
        int v60 = *(_DWORD *)(v41 + 48);
        if (v60 < 2)
        {
          int v61 = sub_2099D9270(v40, (unint64_t *)(v41 + 40));
          int v60 = *(_DWORD *)(v41 + 48);
          if (!v61 && v60 <= 1)
          {
            if (v166 == v169) {
              goto LABEL_243;
            }
LABEL_281:
            int v21 = 0;
            int v147 = 3;
            goto LABEL_245;
          }
        }
        int v62 = v60 - 2;
        uint64_t v63 = *(void *)(v41 + 40) >> v62;
        *(_DWORD *)(v41 + 48) = v62;
        if ((v63 & 3) > *(_DWORD *)(v41 + 188) - 3) {
          goto LABEL_243;
        }
        if ((v63 & 3) != 0)
        {
          uint64_t v64 = 0;
          uint64_t v56 = (v63 & 3) + 3;
          uint64_t v65 = v63 & 3;
          do
            *(unsigned char *)(*(void *)(v41 + 264) + v64++ + 3) = 0;
          while (v65 != v64);
        }
        else
        {
          uint64_t v56 = 3;
        }
        *(_DWORD *)(v41 + 336) = v56;
LABEL_74:
        int v66 = sub_2099D9400((uint64_t)v40, v56, *(unsigned int *)(v41 + 188));
        *(_DWORD *)(v41 + 336) = v66;
        if (v66 < *(_DWORD *)(v41 + 188))
        {
          if (v166 != v169 && (v66 & 0x80000000) == 0)
          {
            int v21 = 0;
            int v147 = 4;
            goto LABEL_245;
          }
          goto LABEL_243;
        }
        if (!sub_2099D9518((uint64_t)v173)) {
          goto LABEL_243;
        }
        if (*(_DWORD *)(v41 + 332))
        {
          int v43 = 9;
          goto LABEL_120;
        }
LABEL_78:
        int v67 = *(_DWORD *)(v41 + 48);
        int v68 = *(_DWORD *)(v41 + 64);
        if (v67 < v68)
        {
          int v69 = sub_2099D9270(v40, (unint64_t *)(v41 + 40));
          int v67 = *(_DWORD *)(v41 + 48);
          int v68 = *(_DWORD *)(v41 + 64);
          if (!v69 && v67 < v68)
          {
            if (v166 != v169)
            {
              int v21 = 0;
              int v147 = 5;
              goto LABEL_245;
            }
            goto LABEL_243;
          }
        }
        int v70 = v67 - v68;
        int v57 = (*(void *)(v41 + 40) >> v70) & word_2099EC892[v68];
        *(_DWORD *)(v41 + 60) = v57;
        *(_DWORD *)(v41 + 48) = v70;
LABEL_82:
        if (!v57)
        {
          int v71 = *(_DWORD *)(v41 + 48);
          int v72 = *(_DWORD *)(v41 + 64);
          if (v71 < v72)
          {
            int v73 = sub_2099D9270(v40, (unint64_t *)(v41 + 40));
            int v71 = *(_DWORD *)(v41 + 48);
            int v72 = *(_DWORD *)(v41 + 64);
            if (!v73 && v71 < v72)
            {
              if (v166 != v169)
              {
                int v21 = 0;
                int v147 = 6;
                goto LABEL_245;
              }
              goto LABEL_243;
            }
          }
          uint64_t v74 = (*v42 >> (v71 - v72)) & word_2099EC892[v72];
          if (*v172 <= (int)v74) {
            goto LABEL_243;
          }
          **(_WORD **)(v41 + 168) = v74;
          *(void *)(v41 + 144) = 0;
          *(unsigned char *)(*(void *)(v41 + 136) + v74) = 0;
          *(_DWORD *)(v41 + 48) -= *(_DWORD *)(v41 + 64);
          int v43 = 8;
          goto LABEL_120;
        }
        if (v57 > *v172) {
          goto LABEL_243;
        }
        int v58 = 0;
        *(_DWORD *)(v41 + 336) = 0;
        *(_OWORD *)(v41 + 68) = 0u;
        *(_OWORD *)(v41 + 84) = 0u;
        *(_OWORD *)(v41 + 100) = 0u;
        *(_OWORD *)(v41 + 116) = 0u;
        *(_DWORD *)(v41 + 132) = 0;
        while (1)
        {
          if (v58 >= v57)
          {
            if (v58 > v57 || !sub_2099D9518((uint64_t)v172)) {
              goto LABEL_243;
            }
LABEL_119:
            *(_DWORD *)(v41 + 184) = *(_DWORD *)(v41 + 316);
            *(_DWORD *)(v41 + 192) = *(_DWORD *)(v41 + 320);
            int v43 = 1;
            *(_DWORD *)(v41 + 332) = 1;
            goto LABEL_120;
          }
          signed int v75 = *(_DWORD *)(v41 + 48);
          signed int v76 = *(_DWORD *)(v41 + 272);
          if (v75 < v76)
          {
            int v77 = sub_2099D9270(v40, (unint64_t *)(v41 + 40));
            signed int v75 = *(_DWORD *)(v41 + 48);
            signed int v76 = *(_DWORD *)(v41 + 272);
            if (!v77 && v75 < v76) {
              break;
            }
          }
          unsigned int v78 = (*(void *)(v41 + 40) >> (v75 - v76)) & word_2099EC892[v76];
          int v79 = *(_DWORD *)(v41 + 276);
          unsigned int v80 = *(unsigned __int16 *)(*(void *)(v41 + 296) + 2 * (v78 >> v79));
          signed int v81 = *(_DWORD *)(v41 + 188);
          BOOL v82 = v81 > (int)v80 || v81 == 0;
          if (!v82)
          {
            while (1)
            {
              BOOL v83 = __OFSUB__(v79, 1);
              if (--v79 < 0 != v83 || (signed int)(v80 - v81) >= *(_DWORD *)(v41 + 284)) {
                break;
              }
              uint64_t v84 = (unsigned __int16 *)(*(void *)(v41 + 304) + 4 * (int)(v80 - v81));
              if (((v78 >> v79) & 1) == 0) {
                ++v84;
              }
              unsigned int v80 = *v84;
              if (v81 > (int)v80) {
                goto LABEL_103;
              }
            }
LABEL_115:
            *(_DWORD *)(v41 + 48) = v75 - **(unsigned __int8 **)(v41 + 264);
            *(unsigned char *)(*(void *)(v41 + 136) + v58) = 0;
LABEL_116:
            ++v58;
            goto LABEL_128;
          }
LABEL_103:
          if (v80 >= 3)
          {
            *(_DWORD *)(v41 + 48) = v75 - *(unsigned __int8 *)(*(void *)(v41 + 264) + v80);
            ++*(_DWORD *)(v41 + 4 * (v80 - 2) + 68);
            *(unsigned char *)(*(void *)(v41 + 136) + v58) = v80 - 2;
            goto LABEL_116;
          }
          if (!v80) {
            goto LABEL_115;
          }
          if (v80 == 1) {
            int v85 = -4;
          }
          else {
            int v85 = -9;
          }
          if (v80 == 1) {
            unsigned int v86 = 4;
          }
          else {
            unsigned int v86 = 9;
          }
          int v87 = *(unsigned __int8 *)(*(void *)(v41 + 264) + v80);
          if (v75 < (int)(v86 + v87))
          {
            int v88 = sub_2099D9270(v40, (unint64_t *)(v41 + 40));
            uint64_t v89 = *(void *)(v41 + 264);
            if (v88)
            {
              int v87 = *(unsigned __int8 *)(v89 + v80);
              signed int v75 = *(_DWORD *)(v41 + 48);
            }
            else
            {
              signed int v75 = *(_DWORD *)(v41 + 48);
              int v87 = *(unsigned __int8 *)(v89 + v80);
              if (v75 < (int)(v86 + v87)) {
                break;
              }
            }
            BOOL v40 = v171;
          }
          int v90 = v85 - v87 + v75;
          int v91 = (*(void *)(v41 + 40) >> v90) & word_2099EC892[v86];
          *(_DWORD *)(v41 + 48) = v90;
          if (v80 == 1) {
            int v92 = 3;
          }
          else {
            int v92 = 20;
          }
          size_t v17 = (v91 + v92);
          int v93 = v17 + v58;
          if ((int)v17 + v58 > *(_DWORD *)(v41 + 60)) {
            goto LABEL_243;
          }
          bzero((void *)(*(void *)(v41 + 136) + v58), v17);
          int v58 = v93;
LABEL_128:
          int v57 = *(_DWORD *)(v41 + 60);
        }
        if (v166 == v169) {
          goto LABEL_243;
        }
        int v21 = 0;
        *(_DWORD *)(v41 + 336) = v58;
        int v147 = 7;
LABEL_245:
        *(_DWORD *)uint64_t v41 = v147;
LABEL_246:
        a2 = v165;
LABEL_247:
        uint64_t v22 = v16[48] - *((int *)v16 + 94) + (int)v166;
        v16[48] = v22;
        uint64_t v9 = v158;
        uint64_t v11 = v159;
        if (v21)
        {
LABEL_248:
          if (v21 == 1)
          {
            *((unsigned char *)v16 + 300) = 1;
            goto LABEL_250;
          }
          archive_set_error((_DWORD *)v11, -1, "Bad lzh data", a4, a5, a6, a7, a8, v157);
          return 4294967271;
        }
        else
        {
LABEL_250:
          uint64_t v148 = *v16;
          v16[1] -= v22;
          v16[2] = v22;
          unint64_t v149 = *((int *)v16 + 100);
          *uint64_t v8 = v148;
          if (v149)
          {
            *uint64_t v9 = v149;
            long long v150 = (char *)v16[49];
            *a2 = v150;
            __int16 v151 = sub_2099D9048(*((unsigned __int16 *)v16 + 12), v150, v149);
            uint64_t result = 0;
            *((_WORD *)v16 + 12) = v151;
            *v16 += v149;
          }
          else
          {
            *uint64_t v9 = 0;
            *a2 = 0;
            if (*((unsigned char *)v16 + 300)) {
              return sub_2099D913C(v11, v17, v18, a4, a5, a6, a7, a8);
            }
            else {
              return 0;
            }
          }
        }
        return result;
      case 1:
        int v45 = *(_DWORD *)(v41 + 48);
        int v46 = *(_DWORD *)(v41 + 192);
        goto LABEL_42;
      case 2:
        int v49 = *(_DWORD *)(v41 + 188);
        if (!v49) {
          goto LABEL_51;
        }
        goto LABEL_46;
      case 3:
        uint64_t v55 = *(unsigned int *)(v41 + 336);
        goto LABEL_63;
      case 4:
        uint64_t v56 = *(unsigned int *)(v41 + 336);
        goto LABEL_74;
      case 5:
        goto LABEL_78;
      case 6:
        int v57 = *(_DWORD *)(v41 + 60);
        goto LABEL_82;
      case 7:
        int v58 = *(_DWORD *)(v41 + 336);
        goto LABEL_128;
      case 8:
        goto LABEL_119;
      case 9:
        int v21 = 100;
        goto LABEL_231;
      default:
        continue;
    }
  }
}

uint64_t sub_2099D8738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(uint64_t **)(a1 + 2472);
  uint64_t v10 = *v9;
  uint64_t v11 = *(void *)(*v9 + 16);
  if (v11)
  {
    sub_209973BDC(a1, v11, a3, a4, a5, a6, a7, a8);
    *(void *)(v10 + 16) = 0;
  }
  if (*(unsigned char *)(v10 + 301)) {
    return 0;
  }
  if (sub_209973BDC(a1, *(void *)(v10 + 8), a3, a4, a5, a6, a7, a8) < 0) {
    return 4294967266;
  }
  uint64_t result = 0;
  *(_WORD *)(v10 + 300) = 257;
  return result;
}

__int32 *sub_2099D87A8(uint64_t *a1, uint64_t a2)
{
  uint64_t result = wcschr(*(__int32 **)a2, 124);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = result + 1;
    size_t v7 = wcslen(result + 1);
    a1[1] = 0;
    sub_2099C3FF0(a1, v6, v7);
    _DWORD *v5 = 0;
    *(void *)(a2 + 8) = wcslen(*(const __int32 **)a2);
    return (__int32 *)1;
  }
  return result;
}

const __int32 *sub_2099D881C(uint64_t a1, uint64_t *a2)
{
  int v4 = (const __int32 *)archive_entry_pathname_w(a2);
  if (v4)
  {
    uint64_t v5 = v4;
    *(void *)(a1 + 280) = 0;
    size_t v6 = wcslen(v4);
    sub_2099C3FF0((uint64_t *)(a1 + 272), v5, v6);
    size_t v7 = *(__int32 **)(a1 + 272);
    uint64_t v8 = *(void *)(a1 + 280);
    if (v8)
    {
      uint64_t v9 = *(_DWORD **)(a1 + 272);
      do
      {
        if (*v9 == 92) {
          *uint64_t v9 = 47;
        }
        ++v9;
        --v8;
      }
      while (v8);
    }
    archive_entry_copy_pathname_w((uint64_t)a2, v7);
  }
  uint64_t result = (const __int32 *)archive_entry_symlink_w((uint64_t)a2);
  if (result)
  {
    uint64_t v11 = result;
    *(void *)(a1 + 280) = 0;
    size_t v12 = wcslen(result);
    sub_2099C3FF0((uint64_t *)(a1 + 272), v11, v12);
    uint64_t v13 = *(__int32 **)(a1 + 272);
    uint64_t v14 = *(void *)(a1 + 280);
    if (v14)
    {
      uint64_t v15 = *(_DWORD **)(a1 + 272);
      do
      {
        if (*v15 == 92) {
          _DWORD *v15 = 47;
        }
        ++v15;
        --v14;
      }
      while (v14);
    }
    return (const __int32 *)archive_entry_copy_symlink_w((uint64_t)a2, v13);
  }
  return result;
}

time_t sub_2099D8924(unsigned __int8 *a1)
{
  unsigned int v1 = a1[1];
  int v2 = *a1;
  unsigned int v3 = a1[3];
  int v4 = a1[2];
  memset(&v6.tm_wday, 0, 32);
  v6.tm_mon = (((v4 | (v3 << 8)) >> 5) & 0xF) - 1;
  v6.tm_year = (v3 >> 1) + 80;
  v6.tm_hour = v1 >> 3;
  v6.tm_mday = v4 & 0x1F;
  v6.tm_sec = 2 * (v2 & 0x1F);
  v6.tm_min = ((v2 | (v1 << 8)) >> 5) & 0x3F;
  v6.tm_isdst = -1;
  return mktime(&v6);
}

uint64_t sub_2099D899C(_DWORD *a1, uint64_t a2, _WORD *a3, uint64_t a4, unint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  int v71 = a4;
  unint64_t v12 = a4;
  *a6 = a4;
  size_t v13 = sub_2099738A4((uint64_t)a1, a4, 0, a4, a5, (uint64_t)a6, a7, a8);
  if (v13)
  {
    uint64_t v20 = (char *)v13;
    unint64_t v21 = (v71 + 1);
    int v69 = (uint64_t *)(a2 + 224);
    do
    {
      if (v71 == 2)
      {
        size_t v22 = *(unsigned __int16 *)v20;
        if (!*(_WORD *)v20) {
          goto LABEL_102;
        }
      }
      else
      {
        size_t v22 = *(unsigned int *)v20;
        if (!*(_DWORD *)v20)
        {
LABEL_102:
          if (a3) {
            *a3 = sub_2099D9048((unsigned __int16)*a3, v20, v12);
          }
          sub_209973BDC((uint64_t)a1, v12, v14, v15, v16, v17, v18, v19);
          return 0;
        }
      }
      BOOL v23 = v22 <= v12 || *a6 + v22 > a5;
      if (v23) {
        goto LABEL_99;
      }
      unint64_t v24 = (char *)sub_2099738A4((uint64_t)a1, v22, 0, v15, v16, v17, v18, v19);
      if (!v24) {
        break;
      }
      uint64_t v25 = v24;
      *a6 += v22;
      int v26 = v24[v12];
      if (a3 && v24[v12]) {
        *a3 = sub_2099D9048((unsigned __int16)*a3, v24, v22);
      }
      size_t v27 = v22 - v21;
      int v28 = &v25[v21];
      if (v26 <= 63)
      {
        if (v26)
        {
          if (v26 == 1)
          {
            if (v22 == v21)
            {
LABEL_77:
              *(void *)(a2 + 256) = 0;
            }
            else
            {
              if (!*v28) {
                goto LABEL_99;
              }
              *(void *)(a2 + 256) = 0;
              BOOL v42 = (uint64_t *)(a2 + 248);
LABEL_83:
              sub_209974714(v42, &v25[v21], v27);
            }
          }
          else if (v26 == 2)
          {
            if (v22 == v21 || !*v28) {
              goto LABEL_99;
            }
            *(void *)(a2 + 232) = 0;
            sub_209974714(v69, &v25[v21], v27);
            unint64_t v29 = *(void *)(a2 + 232);
            if (v29)
            {
              uint64_t v30 = 0;
              unsigned int v31 = 1;
              uint64_t v32 = (void *)(a2 + 224);
              do
              {
                if (*(unsigned __int8 *)(*v69 + v30) == 255)
                {
                  *(unsigned char *)(*v69 + v30) = 47;
                  unint64_t v29 = *(void *)(a2 + 232);
                }
                uint64_t v30 = v31;
                BOOL v23 = v29 > v31++;
              }
              while (v23);
            }
            else
            {
              uint64_t v32 = (void *)(a2 + 224);
            }
            int v49 = *(unsigned __int8 *)(v29 + *v32 - 1);
LABEL_86:
            if (v49 != 47)
            {
LABEL_99:
              int v66 = "Invalid extended LHa header";
              goto LABEL_100;
            }
          }
        }
        else
        {
          unint64_t v50 = v27 - 2;
          if (v27 >= 2)
          {
            *(_WORD *)(a2 + 192) = *(_WORD *)v28;
            if (a3)
            {
              uint64_t v51 = sub_2099D9048((unsigned __int16)*a3, v25, v21);
              *a3 = v51;
              uint64_t v52 = sub_2099D9048(v51, byte_2099EC890, 2uLL);
              *a3 = v52;
              *a3 = sub_2099D9048(v52, v28 + 2, v50);
            }
          }
        }
      }
      else
      {
        switch(v26)
        {
          case '@':
            if (v27 == 2) {
              *(unsigned char *)(a2 + 296) = *v28;
            }
            break;
          case 'A':
            if (v27 != 24) {
              break;
            }
            uint64_t v35 = *(void *)v28;
            if (*(void *)v28 <= 0x19DB1DED53E7FFFuLL)
            {
              uint64_t v38 = 0;
              unint64_t v37 = 0;
            }
            else
            {
              uint64_t v36 = v35 - 116444736000000000;
              unint64_t v37 = (v35 - 116444736000000000) / 0x989680uLL;
              uint64_t v38 = 100 * (v36 - 10000000 * v37);
            }
            *(void *)(a2 + 72) = v37;
            *(void *)(a2 + 80) = v38;
            unint64_t v53 = *((void *)v28 + 1);
            if (v53 <= 0x19DB1DED53E7FFFLL)
            {
              uint64_t v56 = 0;
              unint64_t v55 = 0;
            }
            else
            {
              unint64_t v54 = v53 - 116444736000000000;
              unint64_t v55 = (v53 - 116444736000000000) / 0x989680;
              uint64_t v56 = 100 * (v54 - 10000000 * v55);
            }
            *(void *)(a2 + 88) = v55;
            *(void *)(a2 + 96) = v56;
            unint64_t v57 = *((void *)v28 + 2);
            if (v57 <= 0x19DB1DED53E7FFFLL)
            {
              uint64_t v60 = 0;
              unint64_t v59 = 0;
            }
            else
            {
              unint64_t v58 = v57 - 116444736000000000;
              unint64_t v59 = (v57 - 116444736000000000) / 0x989680;
              uint64_t v60 = 100 * (v58 - 10000000 * v59);
            }
            *(void *)(a2 + 104) = v59;
            *(void *)(a2 + 112) = v60;
            int v41 = *(_DWORD *)(a2 + 64) | 3;
            goto LABEL_96;
          case 'B':
            if (v27 == 16)
            {
              *(void *)(a2 + 48) = *(void *)v28;
              *(void *)(a2 + 56) = *((void *)v28 + 1);
            }
            break;
          case 'C':
          case 'G':
          case 'H':
          case 'I':
          case 'J':
          case 'K':
          case 'L':
          case 'M':
          case 'N':
          case 'O':
            break;
          case 'D':
            if (v22 == v21) {
              goto LABEL_77;
            }
            if ((v27 & 1) != 0 || !*v28) {
              goto LABEL_99;
            }
            *(void *)(a2 + 256) = 0;
            sub_2099C3FEC((uint64_t *)(a2 + 248), &v25[v21], v27);
            int v43 = sub_2099756A4((uint64_t)a1, "UTF-16LE", 1);
            *(void *)(a2 + 208) = v43;
            if (!v43) {
              return 4294967266;
            }
            break;
          case 'E':
            if (v22 == v21 || (v27 & 1) != 0 || !*v28) {
              goto LABEL_99;
            }
            *(void *)(a2 + 232) = 0;
            sub_2099C3FEC(v69, &v25[v21], v27);
            int v44 = sub_2099756A4((uint64_t)a1, "UTF-16LE", 1);
            *(void *)(a2 + 200) = v44;
            if (!v44) {
              return 4294967266;
            }
            uint64_t v45 = *(void *)(a2 + 224);
            unint64_t v46 = *(void *)(a2 + 232);
            unint64_t v47 = v46 >> 1;
            if (v46 >= 2)
            {
              uint64_t v48 = 0;
              do
              {
                if (*(__int16 *)(v45 + 2 * v48) == -1) {
                  *(_WORD *)(v45 + 2 * v48) = 47;
                }
                ++v48;
              }
              while (v47 > v48);
            }
            int v49 = *(unsigned __int16 *)(v45 + 2 * v47 - 2);
            goto LABEL_86;
          case 'F':
            if (v27 == 4)
            {
              memset(v72, 0, sizeof(v72));
              int v39 = (char *)*(unsigned int *)v28;
              BOOL v40 = "UTF-8";
              if (v39 != 65001)
              {
                sub_2099C7760(v72, "CP%d", 4, v15, v16, v17, v18, v19, v39);
                BOOL v40 = (char *)v72[0];
              }
              *(void *)(a2 + 200) = sub_2099756A4((uint64_t)a1, v40, 1);
              *(void *)(a2 + 208) = sub_2099756A4((uint64_t)a1, v40, 1);
              sub_20997954C((uint64_t)v72);
              if (!*(void *)(a2 + 200) || !*(void *)(a2 + 208)) {
                return 4294967266;
              }
            }
            break;
          case 'P':
            if (v27 != 2) {
              break;
            }
            *(_WORD *)(a2 + 120) = *(_WORD *)v28;
            int v41 = *(_DWORD *)(a2 + 64) | 4;
            goto LABEL_96;
          case 'Q':
            if (v27 == 4)
            {
              *(void *)(a2 + 136) = *(unsigned __int16 *)v28;
              *(void *)(a2 + 128) = *((unsigned __int16 *)v28 + 1);
            }
            break;
          case 'R':
            if (v22 == v21) {
              break;
            }
            *(void *)(a2 + 176) = 0;
            BOOL v42 = (uint64_t *)(a2 + 168);
            goto LABEL_83;
          case 'S':
            if (v22 == v21) {
              break;
            }
            *(void *)(a2 + 152) = 0;
            BOOL v42 = (uint64_t *)(a2 + 144);
            goto LABEL_83;
          case 'T':
            if (v27 == 4) {
              *(void *)(a2 + 88) = *(unsigned int *)v28;
            }
            break;
          default:
            if (v26 == 127)
            {
              if (v27 != 16) {
                break;
              }
              *(unsigned char *)(a2 + 296) = *v28;
              *(_WORD *)(a2 + 120) = *((_WORD *)v28 + 1);
              *(void *)(a2 + 136) = *((unsigned __int16 *)v28 + 2);
              *(void *)(a2 + 128) = *((unsigned __int16 *)v28 + 3);
              *(void *)(a2 + 72) = *((unsigned int *)v28 + 2);
              uint64_t v34 = *((unsigned int *)v28 + 3);
            }
            else
            {
              if (v26 != 255 || v27 != 20) {
                break;
              }
              *(_WORD *)(a2 + 120) = *(_DWORD *)v28;
              *(void *)(a2 + 136) = *((unsigned int *)v28 + 1);
              *(void *)(a2 + 128) = *((unsigned int *)v28 + 2);
              *(void *)(a2 + 72) = *((unsigned int *)v28 + 3);
              uint64_t v34 = *((unsigned int *)v28 + 4);
            }
            *(void *)(a2 + 104) = v34;
            int v41 = *(_DWORD *)(a2 + 64) | 7;
LABEL_96:
            *(_DWORD *)(a2 + 64) = v41;
            break;
        }
      }
      sub_209973BDC((uint64_t)a1, v22, v27, v15, v16, v17, v18, v19);
      uint64_t v20 = (char *)sub_2099738A4((uint64_t)a1, v12, 0, v61, v62, v63, v64, v65);
    }
    while (v20);
  }
  int v66 = "Truncated LHa header";
LABEL_100:
  archive_set_error(a1, 79, v66, v15, v16, v17, v18, v19, v68);
  return 4294967266;
}

uint64_t sub_2099D9048(uint64_t result, char *a2, unint64_t a3)
{
  if (a3)
  {
    if (a2)
    {
      char v3 = *a2++;
      LODWORD(result) = word_2675F73A2[(v3 ^ result)] ^ (result >> 8);
      --a3;
    }
    if (a3 >= 8)
    {
      do
      {
        int v4 = word_2675F73A2[(word_2675F73A2[(word_2675F73A2[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_2675F73A2[(*(_WORD *)a2 ^ result) + 256] ^ *((unsigned __int16 *)a2 + 1)) >> 8] ^ word_2675F73A2[(word_2675F73A2[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_2675F73A2[(*(_WORD *)a2 ^ result) + 256] ^ *((_WORD *)a2 + 1)) + 256] ^ *((_WORD *)a2 + 2))
                          + 256];
        unsigned int v5 = word_2675F73A2[(word_2675F73A2[(word_2675F73A2[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_2675F73A2[(*(_WORD *)a2 ^ result) + 256] ^ *((unsigned __int16 *)a2 + 1)) >> 8] ^ word_2675F73A2[(word_2675F73A2[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_2675F73A2[(*(_WORD *)a2 ^ result) + 256] ^ *((_WORD *)a2 + 1)) + 256] ^ *((unsigned __int16 *)a2 + 2)) >> 8] ^ v4 ^ *((unsigned __int16 *)a2 + 3);
        a2 += 8;
        LOWORD(result) = word_2675F73A2[v5 >> 8] ^ word_2675F73A2[v5 + 256];
        a3 -= 8;
      }
      while (a3 > 7);
    }
    for (; a3; --a3)
    {
      char v6 = *a2++;
      LODWORD(result) = word_2675F73A2[(v6 ^ result)] ^ ((unsigned __int16)(result & 0xFF00) >> 8);
    }
  }
  return (unsigned __int16)result;
}

uint64_t sub_2099D913C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = **(void **)(a1 + 2472);
  if (*(unsigned char *)(v8 + 301)) {
    return 1;
  }
  uint64_t v9 = 1;
  if ((*(unsigned char *)(v8 + 64) & 8) != 0)
  {
    if (*(unsigned __int16 *)(v8 + 194) == *(unsigned __int16 *)(v8 + 24))
    {
      uint64_t v9 = 1;
    }
    else
    {
      archive_set_error((_DWORD *)a1, -1, "LHa data CRC error", a4, a5, a6, a7, a8, v11);
      uint64_t v9 = 4294967276;
    }
  }
  *(unsigned char *)(v8 + 301) = 1;
  return v9;
}

uint64_t sub_2099D91B4(uint64_t a1, size_t size)
{
  int v2 = size;
  if (!*(void *)(a1 + 80))
  {
    int v4 = malloc_type_malloc(size, 0x100004077774924uLL);
    *(void *)(a1 + 80) = v4;
    if (!v4) {
      return 4294967266;
    }
  }
  if (!*(void *)(a1 + 112))
  {
    unsigned int v5 = malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
    *(void *)(a1 + 112) = v5;
    if (!v5) {
      return 4294967266;
    }
  }
  if (!*(void *)(a1 + 120))
  {
    *(_DWORD *)(a1 + 104) = 1024;
    char v6 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
    *(void *)(a1 + 120) = v6;
    if (!v6) {
      return 4294967266;
    }
  }
  uint64_t result = 0;
  *(_DWORD *)a1 = v2;
  *(_DWORD *)(a1 + 96) = 16;
  return result;
}

uint64_t sub_2099D9270(_DWORD *a1, unint64_t *a2)
{
  int v2 = *((_DWORD *)a2 + 2);
  int v3 = a1[2];
  int v4 = -v2;
  int v5 = v2 + 8;
  while (v3 < (v4 + 64) >> 3)
  {
LABEL_4:
    if (!v3) {
      return 0;
    }
    unint64_t v7 = *a2;
    uint64_t v8 = (unsigned __int8 *)(*(void *)a1)++;
    *a2 = *v8 | (v7 << 8);
    a1[2] = --v3;
    *((_DWORD *)a2 + 2) = v5;
    v4 -= 8;
    v5 += 8;
  }
  uint64_t v6 = 1;
  switch((v4 + 64) >> 3)
  {
    case 0:
      return v6;
    case 6:
      uint64_t v9 = *(void *)a1;
      *a2 = (*a2 << 48) | ((unint64_t)**(unsigned __int8 **)a1 << 40) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 1) << 32) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 2) << 24) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 3) << 16) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 4) << 8) | *(unsigned __int8 *)(*(void *)a1 + 5);
      uint64_t v10 = v9 + 6;
      int v11 = 48;
      int v12 = -6;
      goto LABEL_10;
    case 7:
      uint64_t v13 = *(void *)a1;
      *a2 = (*a2 << 56) | ((unint64_t)**(unsigned __int8 **)a1 << 48) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 1) << 40) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 2) << 32) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 3) << 24) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 4) << 16) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 5) << 8) | *(unsigned __int8 *)(*(void *)a1 + 6);
      uint64_t v10 = v13 + 7;
      int v11 = 56;
      int v12 = -7;
      goto LABEL_10;
    case 8:
      uint64_t v10 = *(void *)a1 + 8;
      *a2 = bswap64(**(void **)a1);
      int v11 = 64;
      int v12 = -8;
LABEL_10:
      *(void *)a1 = v10;
      a1[2] = v12 + v3;
      *((_DWORD *)a2 + 2) = v11 - v4;
      uint64_t v6 = 1;
      break;
    default:
      goto LABEL_4;
  }
  return v6;
}

uint64_t sub_2099D9400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  if ((int)a2 < (int)a3)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    unint64_t v7 = (void *)(v6 + 40);
    uint64_t v3 = (int)a2;
    while (1)
    {
      int v8 = *(_DWORD *)(v6 + 48);
      if (v8 <= 2)
      {
        int v9 = sub_2099D9270((_DWORD *)a1, (unint64_t *)(v6 + 40));
        int v8 = *(_DWORD *)(v6 + 48);
        if (!v9 && v8 < 3) {
          break;
        }
      }
      int v10 = v8 - 3;
      uint64_t v11 = (*v7 >> (v8 - 3)) & 7;
      if (v11 == 7)
      {
        if (v8 <= 12)
        {
          int v12 = sub_2099D9270((_DWORD *)a1, (unint64_t *)(v6 + 40));
          int v8 = *(_DWORD *)(v6 + 48);
          if (!v12 && v8 < 13) {
            return v3;
          }
        }
        uint64_t v11 = (*v7 >> (v8 - 13)) & 0x3FFLL;
        if (v11 == 1023) {
          return 0xFFFFFFFFLL;
        }
        LODWORD(v11) = asc_2099F5CD1[v11];
        int v10 = v8 - v11 + 3;
      }
      *(_DWORD *)(v6 + 48) = v10;
      *(unsigned char *)(*(void *)(v6 + 264) + v3) = v11;
      ++*(_DWORD *)(v6 + 4 * (int)v11 + 196);
      if (a3 == ++v3) {
        return a3;
      }
    }
  }
  return v3;
}

uint64_t sub_2099D9518(uint64_t a1)
{
  uint64_t v2 = 0;
  int v3 = 0;
  int v4 = 0;
  uint64_t v44 = *MEMORY[0x263EF8340];
  unsigned int v5 = 0x8000;
  do
  {
    v43[v2] = v3;
    v42[v2] = v5;
    int v6 = *(_DWORD *)(a1 + 16 + 4 * v2++);
    if (v6) {
      int v4 = v2;
    }
    v3 += v6 * v5;
    v5 >>= 1;
  }
  while (v2 != 16);
  if (v3 != 0x10000 || v4 > *(_DWORD *)(a1 + 96)) {
    return 0;
  }
  *(_DWORD *)(a1 + 88) = v4;
  if (v4 > 15) {
    goto LABEL_14;
  }
  if (v4 < 1) {
    goto LABEL_18;
  }
  char v8 = 16 - v4;
  int v9 = v42;
  int v10 = v43;
  uint64_t v11 = (v4 + 1) - 1;
  do
  {
    *v10++ >>= v8;
    *v9++ >>= v8;
    --v11;
  }
  while (v11);
  if (v4 <= 10)
  {
LABEL_18:
    int v12 = 0;
    uint64_t v15 = *(void *)(a1 + 112);
  }
  else
  {
LABEL_14:
    int v12 = v4 - 10;
    for (uint64_t i = 1; i != 11; ++i)
    {
      v42[i + 16] = (int)v42[i + 16] >> v12;
      *(int *)&v41[i * 4] >>= v12;
    }
    unsigned int v14 = v43[9] + *(_DWORD *)(a1 + 52) * v42[9];
    uint64_t v15 = *(void *)(a1 + 112);
    if (v14 <= 0x3FF) {
      bzero((void *)(v15 + 2 * v14), 2048 - 2 * v14);
    }
  }
  *(_DWORD *)(a1 + 92) = v12;
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v17 = *(unsigned int *)(a1 + 4);
  *(_DWORD *)(a1 + 100) = 0;
  uint64_t result = 1;
  if ((int)v17 >= 1)
  {
    uint64_t v18 = 0;
    while (1)
    {
      uint64_t v19 = *(unsigned __int8 *)(v16 + v18);
      if (*(unsigned char *)(v16 + v18))
      {
        uint64_t v20 = (int)v42[v19 + 16];
        int v21 = *(_DWORD *)&v41[4 * v19];
        v42[v19 + 16] = v21 + v20;
        int v22 = v19 - 10;
        if (v19 > 0xA)
        {
          int v29 = *(unsigned __int16 *)(v15 + 2 * ((int)v20 >> v12));
          if (*(_WORD *)(v15 + 2 * ((int)v20 >> v12)))
          {
            if (v29 < (int)v17) {
              return 0;
            }
            int v30 = *(_DWORD *)(a1 + 100);
            if (v30 + (int)v17 <= v29) {
              return 0;
            }
            uint64_t v31 = *(void *)(a1 + 120);
            uint64_t v32 = (unsigned __int16 *)(v31 + 4 * (v29 - (int)v17));
          }
          else
          {
            uint64_t v38 = *(int *)(a1 + 100);
            *(_WORD *)(v15 + 2 * ((int)v20 >> v12)) = v38 + v17;
            uint64_t v31 = *(void *)(a1 + 120);
            int v30 = v38 + 1;
            *(_DWORD *)(a1 + 100) = v38 + 1;
            if ((int)v38 >= *(_DWORD *)(a1 + 104)) {
              return 0;
            }
            uint64_t v32 = (unsigned __int16 *)(v31 + 4 * v38);
            *(_DWORD *)uint64_t v32 = 0;
          }
          if (v19 < 0xC)
          {
            int v39 = 1 << (v12 - 1);
LABEL_54:
            if (((unsigned __int16)v20 & (unsigned __int16)v39) != 0)
            {
              if (*v32) {
                return 0;
              }
              *uint64_t v32 = v18;
            }
            else
            {
              if (v32[1]) {
                return 0;
              }
              v32[1] = v18;
            }
            goto LABEL_64;
          }
          int v39 = 1 << (v12 - 1);
          while (2)
          {
            if (((unsigned __int16)v39 & (unsigned __int16)v20) != 0)
            {
              int v40 = *v32;
              if (v40 < (int)v17)
              {
                *uint64_t v32 = v30 + v17;
                goto LABEL_48;
              }
LABEL_50:
              uint64_t v32 = (unsigned __int16 *)(v31 + 4 * (v40 - (int)v17));
            }
            else
            {
              int v40 = v32[1];
              if ((int)v17 <= v40) {
                goto LABEL_50;
              }
              v32[1] = v30 + v17;
LABEL_48:
              *(_DWORD *)(a1 + 100) = v30 + 1;
              if (v30 >= *(_DWORD *)(a1 + 104)) {
                return 0;
              }
              uint64_t v32 = (unsigned __int16 *)(v31 + 4 * v30);
              *(_DWORD *)uint64_t v32 = 0;
              ++v30;
            }
            int v39 = (unsigned __int16)v39 >> 1;
            if (--v22 <= 1) {
              goto LABEL_54;
            }
            continue;
          }
        }
        if (v21 + (int)v20 > 1024) {
          return 0;
        }
        BOOL v23 = (char *)(v15 + 2 * v20);
        if (v21 > 7)
        {
          unint64_t v24 = (int16x8_t *)&v23[2 * (v21 - 8)];
          int16x8_t *v24 = vdupq_n_s16(v18);
          unsigned int v25 = v21 - 16;
          if (v21 < 0x10)
          {
            unsigned int v25 = v21 - 8;
            int v26 = (int16x8_t *)&v23[2 * (v21 - 8)];
          }
          else
          {
            int v26 = (int16x8_t *)&v23[2 * v25];
            *int v26 = *v24;
            if (v25 >= 0x10)
            {
              size_t v27 = (int16x8_t *)(v15 + 2 * v20 + 2 * (v21 - 32));
              do
              {
                int16x8_t v28 = v26[1];
                int16x8_t *v27 = *v26;
                v27[1] = v28;
                v27 -= 2;
                v25 -= 16;
              }
              while (v25 > 0xF);
            }
          }
          if (v25) {
            memcpy(v23, v26, 2 * v25);
          }
          goto LABEL_64;
        }
        if (v21 >= 2)
        {
          uint64_t v33 = 2 * v20;
          uint64_t v34 = (_WORD *)(v15 + 2 * v20 + 2 * (v21 - 1));
          uint64_t v35 = (_WORD *)(v15 + v33 + 2 * (v21 - 2));
          do
          {
            *uint64_t v34 = v18;
            v34 -= 2;
            int v36 = v21 - 2;
            _WORD *v35 = v18;
            v35 -= 2;
            BOOL v37 = v21 > 3;
            v21 -= 2;
          }
          while (v37);
          if (!v36) {
            goto LABEL_64;
          }
LABEL_63:
          *(_WORD *)&v23[2 * v36 - 2] = v18;
          goto LABEL_64;
        }
        int v36 = v21;
        if (v21) {
          goto LABEL_63;
        }
      }
LABEL_64:
      if (++v18 == v17) {
        return 1;
      }
    }
  }
  return result;
}

void sub_2099D9904(uint64_t a1)
{
  free(*(void **)(a1 + 80));
  free(*(void **)(a1 + 112));
  uint64_t v2 = *(void **)(a1 + 120);

  free(v2);
}

uint64_t archive_write_set_format_shar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 1, "archive_write_set_format_shar", a5, a6, a7, a8);
  if (result != -30)
  {
    int v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = malloc_type_calloc(1uLL, 0x90uLL, 0x10300409387678EuLL);
    if (v11)
    {
      uint64_t v17 = v11;
      uint64_t result = 0;
      v17[7] = 0u;
      v17[8] = 0u;
      v17[6] = 0u;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 272) = "shar";
      *(void *)(a1 + 304) = sub_2099D9A54;
      *(void *)(a1 + 320) = sub_2099D9F0C;
      *(void *)(a1 + 328) = sub_2099D9F70;
      *(void *)(a1 + 312) = sub_2099D9FC8;
      *(void *)(a1 + 296) = sub_2099DA128;
      *(_DWORD *)(a1 + 16) = 131073;
      *(void *)(a1 + 24) = "shar";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate shar data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t sub_2099D9A54(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 264);
  if (!*(_DWORD *)(v4 + 88))
  {
    sub_2099C4040((uint64_t *)(v4 + 96), "#!/bin/sh\n");
    sub_2099C4040((uint64_t *)(v4 + 96), "# This is a shell archive\n");
    *(_DWORD *)(v4 + 88) = 1;
  }
  archive_entry_free(*(void ***)(v4 + 8));
  *(void *)(v4 + 8) = archive_entry_clone(a2);
  unsigned int v5 = (char *)archive_entry_pathname(a2);
  HIDWORD(v6) = archive_entry_filetype((uint64_t)a2);
  LODWORD(v6) = HIDWORD(v6) - 4096;
  switch((v6 >> 12))
  {
    case 0u:
    case 1u:
    case 5u:
      archive_entry_set_size((uint64_t)a2, 0);
      goto LABEL_5;
    case 3u:
      archive_entry_set_size((uint64_t)a2, 0);
      uint64_t result = strcmp(v5, ".");
      if (!result) {
        return result;
      }
      uint64_t result = strcmp(v5, "./");
      if (!result) {
        return result;
      }
      goto LABEL_5;
    case 7u:
      goto LABEL_5;
    default:
      archive_entry_set_size((uint64_t)a2, 0);
      if (!archive_entry_hardlink((uint64_t)a2) && !archive_entry_symlink((uint64_t)a2))
      {
        sub_2099CCD58((_DWORD *)a1, a2);
        return 4294967276;
      }
LABEL_5:
      unint64_t v7 = (char **)(v4 + 120);
      *(void *)(v4 + 128) = 0;
      sub_2099DA4D8((uint64_t *)(v4 + 120), v5, 1);
      sub_2099C7760((void **)(v4 + 96), "echo x %s\n", v8, v9, v10, v11, v12, v13, *(char **)(v4 + 120));
      if (archive_entry_filetype((uint64_t)a2) != 0x4000)
      {
        uint64_t v14 = strdup(v5);
        uint64_t v15 = strrchr(v14, 47);
        if (!v15
          || (char *v15 = 0, !strcmp(v14, "."))
          || (uint64_t v16 = *(const char **)(v4 + 24)) != 0
          && (!strcmp(v14, *(const char **)(v4 + 24))
           || (size_t v17 = strlen(v14), v17 < strlen(v16)) && !strncmp(v14, v16, v17)))
        {
          free(v14);
        }
        else
        {
          sub_2099C4040((uint64_t *)(v4 + 96), "mkdir -p ");
          sub_2099DA4D8((uint64_t *)(v4 + 96), v14, 1);
          sub_2099C4040((uint64_t *)(v4 + 96), " > /dev/null 2>&1\n");
          *(void *)(v4 + 24) = v14;
        }
      }
      *(_DWORD *)(v4 + 16) = 0;
      uint64_t v18 = archive_entry_hardlink((uint64_t)a2);
      if (v18)
      {
        uint64_t v19 = (char *)v18;
        uint64_t v20 = "ln -f ";
        goto LABEL_18;
      }
      uint64_t v21 = archive_entry_symlink((uint64_t)a2);
      if (v21)
      {
        uint64_t v19 = (char *)v21;
        uint64_t v20 = "ln -fs ";
LABEL_18:
        sub_2099C4040((uint64_t *)(v4 + 96), v20);
        sub_2099DA4D8((uint64_t *)(v4 + 96), v19, 1);
        sub_2099C7760((void **)(v4 + 96), " %s\n", v22, v23, v24, v25, v26, v27, *v7);
        return 0;
      }
      HIDWORD(v35) = archive_entry_filetype((uint64_t)a2);
      LODWORD(v35) = HIDWORD(v35) - 4096;
      uint64_t result = 4294967276;
      switch((v35 >> 12))
      {
        case 0u:
          sub_2099C7760((void **)(v4 + 96), "mkfifo %s\n", v29, v30, v31, v32, v33, v34, *v7);
          return 0;
        case 1u:
          int v36 = *v7;
          archive_entry_rdevmajor((uint64_t)a2);
          archive_entry_rdevminor(a2);
          sub_2099C7760((void **)(v4 + 96), "mknod %s c %ju %ju\n", v37, v38, v39, v40, v41, v42, v36);
          return 0;
        case 3u:
          sub_2099C7760((void **)(v4 + 96), "mkdir -p %s > /dev/null 2>&1\n", v29, v30, v31, v32, v33, v34, *(char **)(v4 + 120));
          free(*(void **)(v4 + 24));
          int v43 = strdup(v5);
          *(void *)(v4 + 24) = v43;
          uint64_t result = (uint64_t)strrchr(v43, 47);
          if (!result) {
            return result;
          }
          uint64_t v44 = (unsigned char *)result;
          if (*(unsigned char *)(result + 1)) {
            return 0;
          }
          uint64_t result = 0;
          *uint64_t v44 = 0;
          return result;
        case 5u:
          uint64_t v45 = *v7;
          archive_entry_rdevmajor((uint64_t)a2);
          archive_entry_rdevminor(a2);
          sub_2099C7760((void **)(v4 + 96), "mknod %s b %ju %ju\n", v46, v47, v48, v49, v50, v51, v45);
          return 0;
        case 7u:
          if (!archive_entry_size((uint64_t)a2))
          {
            sub_2099C7760((void **)(v4 + 96), "test -e \"%s\" || :> \"%s\"\n", v52, v53, v54, v55, v56, v57, *v7);
            return 0;
          }
          if (*(_DWORD *)v4)
          {
            __int16 v58 = archive_entry_mode((uint64_t)a2);
            sub_2099C7760((void **)(v4 + 96), "uudecode -p > %s << 'SHAR_END'\n", v59, v60, v61, v62, v63, v64, *v7);
            sub_2099C7760((void **)(v4 + 96), "begin %o ", v65, v66, v67, v68, v69, v70, (char *)(v58 & 0x1FF));
            sub_2099DA4D8((uint64_t *)(v4 + 96), v5, 0);
            sub_2099C4040((uint64_t *)(v4 + 96), "\n");
          }
          else
          {
            sub_2099C7760((void **)(v4 + 96), "sed 's/^X//' > %s << 'SHAR_END'\n", v52, v53, v54, v55, v56, v57, *v7);
          }
          uint64_t result = 0;
          *(_DWORD *)(v4 + 16) = 1;
          *(_DWORD *)(v4 + 4) = 1;
          *(void *)(v4 + 80) = 0;
          break;
        default:
          return result;
      }
      return result;
  }
}

uint64_t sub_2099D9F0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 264);
  if (*(_DWORD *)(v1 + 88))
  {
    sub_2099C4040((uint64_t *)(v1 + 96), "exit\n");
    if (sub_2099C9728(a1, *(void *)(v1 + 96), *(void *)(v1 + 104))) {
      return 4294967266;
    }
    archive_write_set_bytes_in_last_block((int *)a1, 1, v3, v4, v5, v6, v7, v8);
  }
  return 0;
}

uint64_t sub_2099D9F70(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 264);
  if (v1)
  {
    archive_entry_free(*(void ***)(v1 + 8));
    free(*(void **)(v1 + 24));
    sub_20997954C(v1 + 96);
    sub_20997954C(v1 + 120);
    free((void *)v1);
    *(void *)(a1 + 264) = 0;
  }
  return 0;
}

uint64_t sub_2099D9FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  if (!a3) {
    return result;
  }
  uint64_t v5 = *(void *)(a1 + 264);
  if (!*(_DWORD *)(v5 + 16)) {
    return result;
  }
  if (!sub_209974664((void **)(v5 + 96), 0x10000uLL))
  {
    archive_set_error((_DWORD *)a1, 12, "Out of memory", v8, v9, v10, v11, v12, v21);
    return -30;
  }
  unint64_t v13 = *(void *)(v5 + 104);
  if (v13 < 0xFFFE) {
    goto LABEL_7;
  }
  if (sub_2099C9728(a1, *(void *)(v5 + 96), v13)) {
    return -30;
  }
  unint64_t v13 = 0;
  *(void *)(v5 + 104) = 0;
LABEL_7:
  uint64_t v14 = *(void *)(v5 + 96);
  uint64_t v15 = (unsigned char *)(v14 + v13);
  if (*(_DWORD *)(v5 + 4))
  {
    *v15++ = 88;
    *(_DWORD *)(v5 + 4) = 0;
  }
  uint64_t v16 = 0;
  unint64_t v17 = v14 + 65533;
  do
  {
    int v18 = *(unsigned __int8 *)(a2 + v16);
    unsigned char *v15 = v18;
    uint64_t v19 = v15 + 1;
    if (v18 == 10)
    {
      if (a3 - 1 == v16)
      {
        *(_DWORD *)(v5 + 4) = 1;
      }
      else
      {
        uint64_t v19 = v15 + 2;
        v15[1] = 88;
      }
    }
    if ((unint64_t)v19 >= v17)
    {
      uint64_t v20 = *(void *)(v5 + 96);
      *(void *)(v5 + 104) = &v19[-v20];
      if (sub_2099C9728(a1, v20, (uint64_t)&v19[-v20])) {
        return -30;
      }
      *(void *)(v5 + 104) = 0;
      uint64_t v15 = *(unsigned char **)(v5 + 96);
    }
    else
    {
      uint64_t v15 = v19;
    }
    ++v16;
  }
  while (a3 != v16);
  *(void *)(v5 + 104) = &v15[-*(void *)(v5 + 96)];
  return a3;
}

uint64_t sub_2099DA128(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 264);
  uint64_t result = *(void *)(v2 + 8);
  if (!result) {
    return result;
  }
  int v4 = *(_DWORD *)(v2 + 16);
  if (*(_DWORD *)v2)
  {
    if (v4)
    {
      unint64_t v5 = *(void *)(v2 + 80);
      if (v5 && sub_2099DA598((_DWORD *)a1, v2, (unsigned __int8 *)(v2 + 32), v5)) {
        return 4294967266;
      }
      sub_2099C4040((uint64_t *)(v2 + 96), "SHAR_END\n");
      uint64_t result = *(void *)(v2 + 8);
    }
    __int16 v6 = archive_entry_mode(result);
    sub_2099C7760((void **)(v2 + 96), "chmod %o ", v7, v8, v9, v10, v11, v12, (char *)(v6 & 0xFFF));
    unint64_t v13 = (char *)archive_entry_pathname(*(uint64_t **)(v2 + 8));
    sub_2099DA4D8((uint64_t *)(v2 + 96), v13, 1);
    sub_2099C4040((uint64_t *)(v2 + 96), "\n");
    uint64_t v14 = archive_entry_uname(*(uint64_t **)(v2 + 8));
    uint64_t v15 = archive_entry_gname(*(uint64_t **)(v2 + 8));
    if (v14 | v15)
    {
      uint64_t v16 = (char *)v15;
      sub_2099C4040((uint64_t *)(v2 + 96), "chown ");
      if (v14) {
        sub_2099DA4D8((uint64_t *)(v2 + 96), (char *)v14, 1);
      }
      if (v16)
      {
        sub_2099C4040((uint64_t *)(v2 + 96), ":");
        sub_2099DA4D8((uint64_t *)(v2 + 96), v16, 1);
      }
      sub_2099C4040((uint64_t *)(v2 + 96), " ");
      unint64_t v17 = (char *)archive_entry_pathname(*(uint64_t **)(v2 + 8));
      sub_2099DA4D8((uint64_t *)(v2 + 96), v17, 1);
      sub_2099C4040((uint64_t *)(v2 + 96), "\n");
    }
    int v18 = archive_entry_fflags_text(*(uint64_t **)(v2 + 8));
    if (!v18) {
      goto LABEL_20;
    }
    sub_2099C7760((void **)(v2 + 96), "chflags %s ", v19, v20, v21, v22, v23, v24, v18);
    uint64_t v25 = (char *)archive_entry_pathname(*(uint64_t **)(v2 + 8));
    sub_2099DA4D8((uint64_t *)(v2 + 96), v25, 1);
    uint64_t v26 = "\n";
    uint64_t v27 = (uint64_t *)(v2 + 96);
    goto LABEL_19;
  }
  if (v4)
  {
    if (!*(_DWORD *)(v2 + 4)) {
      sub_2099C4050((uint64_t *)(v2 + 96), 10);
    }
    uint64_t v27 = (uint64_t *)(v2 + 96);
    uint64_t v26 = "SHAR_END\n";
LABEL_19:
    sub_2099C4040(v27, v26);
  }
LABEL_20:
  archive_entry_free(*(void ***)(v2 + 8));
  *(void *)(v2 + 8) = 0;
  unint64_t v28 = *(void *)(v2 + 104);
  if (v28 < 0x10000) {
    return 0;
  }
  uint64_t result = sub_2099C9728(a1, *(void *)(v2 + 96), v28);
  if (result) {
    return 4294967266;
  }
  *(void *)(v2 + 104) = 0;
  return result;
}

uint64_t archive_write_set_format_shar_dump(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  **(_DWORD **)(a1 + 264) = 1;
  *(void *)(a1 + 312) = sub_2099DA3AC;
  *(_DWORD *)(a1 + 16) = 131074;
  *(void *)(a1 + 24) = "shar dump";
  return 0;
}

size_t sub_2099DA3AC(uint64_t a1, unsigned __int8 *__src, size_t __n)
{
  uint64_t v3 = *(void *)(a1 + 264);
  if (!*(_DWORD *)(v3 + 16)) {
    return 0;
  }
  size_t v4 = __n;
  unint64_t v5 = __src;
  uint64_t v7 = *(void *)(v3 + 80);
  if (!v7)
  {
    size_t v9 = __n;
LABEL_12:
    if (v9 >= 0x2D)
    {
      while (!sub_2099DA598((_DWORD *)a1, v3, v5, 0x2DuLL))
      {
        unint64_t v10 = *(void *)(v3 + 104);
        if (v10 >= 0x10000)
        {
          if (sub_2099C9728(a1, *(void *)(v3 + 96), v10)) {
            return -30;
          }
          *(void *)(v3 + 104) = 0;
        }
        v5 += 45;
        v9 -= 45;
        if (v9 <= 0x2C) {
          goto LABEL_18;
        }
      }
      return -30;
    }
LABEL_18:
    if (!v9) {
      return v4;
    }
    memcpy((void *)(v3 + 32), v5, v9);
LABEL_20:
    *(void *)(v3 + 80) = v9;
    return v4;
  }
  if (45 - v7 >= __n) {
    size_t v8 = __n;
  }
  else {
    size_t v8 = 45 - v7;
  }
  memcpy((void *)(v3 + 32 + v7), __src, v8);
  size_t v9 = *(void *)(v3 + 80) + v8;
  if (v9 < 0x2D) {
    goto LABEL_20;
  }
  if (!sub_2099DA598((_DWORD *)a1, v3, (unsigned __int8 *)(v3 + 32), 0x2DuLL))
  {
    v5 += v8;
    size_t v9 = v4 - v8;
    goto LABEL_12;
  }
  return -30;
}

uint64_t *sub_2099DA4D8(uint64_t *result, char *__s, int a3)
{
  int v3 = *__s;
  if (*__s)
  {
    size_t v4 = __s;
    unint64_t v5 = result;
    if (a3) {
      __int16 v6 = "\"\n\"";
    }
    else {
      __int16 v6 = "\\n";
    }
    do
    {
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t result = sub_209974714(v5, v4, v7);
      }
      else
      {
        if (v3 == 10)
        {
          uint64_t result = sub_2099C4040(v5, v6);
        }
        else
        {
          sub_2099C4050(v5, 92);
          uint64_t result = sub_2099C4050(v5, *v4);
        }
        uint64_t v8 = 1;
      }
      v4 += v8;
      int v3 = *v4;
    }
    while (*v4);
  }
  return result;
}

uint64_t sub_2099DA598(_DWORD *a1, uint64_t a2, unsigned __int8 *a3, unint64_t a4)
{
  if (!sub_209974664((void **)(a2 + 96), *(void *)(a2 + 104) + 62))
  {
    uint64_t v16 = "Out of memory";
    unint64_t v17 = a1;
    int v18 = 12;
LABEL_12:
    archive_set_error(v17, v18, v16, v8, v9, v10, v11, v12, v21);
    return 4294967266;
  }
  unint64_t v13 = (unsigned char *)(*(void *)(a2 + 96) + *(void *)(a2 + 104));
  *unint64_t v13 = (a4 & 0x3F) + 32;
  uint64_t v14 = v13 + 1;
  if (a4 >= 3)
  {
    do
    {
      sub_2099DA6BC(a3, v14);
      a4 -= 3;
      a3 += 3;
      v14 += 4;
    }
    while (a4 > 2);
  }
  if (a4)
  {
    v22[0] = *a3;
    if (a4 == 1) {
      unsigned __int8 v15 = 0;
    }
    else {
      unsigned __int8 v15 = a3[1];
    }
    v22[1] = v15;
    v22[2] = 0;
    sub_2099DA6BC(v22, v14);
    v14 += 4;
  }
  *uint64_t v14 = 10;
  uint64_t v19 = (uint64_t)&v14[-*(void *)(a2 + 96) + 1];
  if (v19 > *(void *)(a2 + 104) + 62)
  {
    uint64_t v16 = "Buffer overflow";
    unint64_t v17 = a1;
    int v18 = -1;
    goto LABEL_12;
  }
  uint64_t result = 0;
  *(void *)(a2 + 104) = v19;
  return result;
}

unsigned __int8 *sub_2099DA6BC(unsigned __int8 *result, unsigned char *a2)
{
  unsigned int v2 = *result;
  unsigned __int8 v3 = result[2];
  unsigned int v4 = v3 | (result[1] << 8);
  unsigned int v5 = (v2 << 16) | (result[1] << 8);
  int v6 = (v2 >> 2) + 32;
  if (v2 < 4) {
    LOBYTE(v6) = 96;
  }
  *a2 = v6;
  int v8 = (v5 >> 12) & 0x3F;
  BOOL v7 = v8 == 0;
  char v9 = v8 + 32;
  if (v7) {
    char v9 = 96;
  }
  a2[1] = v9;
  int v10 = ((v4 >> 6) & 0x3F) + 32;
  if (((v4 >> 6) & 0x3F) == 0) {
    LOBYTE(v10) = 96;
  }
  a2[2] = v10;
  if ((v3 & 0x3F) != 0) {
    char v11 = (v3 & 0x3F) + 32;
  }
  else {
    char v11 = 96;
  }
  a2[3] = v11;
  return result;
}

void archive_read_support_filter_gzip(int *a1)
{
  if (sub_20997D128("gzip"))
  {
    if (sub_20997182C(a1, 14594245, 1, "archive_read_support_filter_gzip", v3, v4, v5, v6) != -30)
    {
      uint64_t v16 = 0;
      sub_20998D674(a1, &v16, v7, v8, v9, v10, v11, v12);
      if (!v13)
      {
        *uint64_t v16 = 0;
        uint64_t v14 = v16;
        v16[1] = "gzip";
        v14[2] = sub_2099DA7EC;
        v14[4] = 0;
        v14[5] = 0;
        v14[3] = sub_2099DA828;
      }
    }
  }
  else
  {
    archive_set_error(a1, -1, "Format not allow-listed in entitlements", v2, v3, v4, v5, v6, v15);
  }
}

uint64_t sub_2099DA7EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = 0;
  if (sub_2099DA900(a2, &v9, 0, a4, a5, a6, a7, a8)) {
    return v9;
  }
  else {
    return 0;
  }
}

uint64_t sub_2099DA828(uint64_t a1)
{
  *(_DWORD *)(a1 + 104) = 1;
  *(void *)(a1 + 96) = "gzip";
  uint64_t v2 = malloc_type_calloc(0xB0uLL, 1uLL, 0xC329240EuLL);
  uint64_t v3 = malloc_type_malloc(0x10000uLL, 0x4E38BFCBuLL);
  uint64_t v4 = v3;
  if (v2 && v3)
  {
    uint64_t result = 0;
    *(void *)(a1 + 88) = v2;
    v2[15] = v4;
    v2[16] = 0x10000;
    *(void *)(a1 + 40) = sub_2099DAA98;
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 64) = sub_2099DAD18;
    *(void *)(a1 + 80) = sub_2099DAD8C;
    *((unsigned char *)v2 + 112) = 0;
  }
  else
  {
    free(v3);
    free(v2);
    archive_set_error(*(_DWORD **)(a1 + 24), 12, "Can't allocate data for gzip decompression", v6, v7, v8, v9, v10, v11);
    return 4294967266;
  }
  return result;
}

size_t sub_2099DA900(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = 0;
  uint64_t v11 = (unsigned __int16 *)sub_20997360C(a1, 0xAuLL, &v28, a4, a5, a6, a7, a8);
  size_t v17 = 0;
  if (!v11 || !v28) {
    return v17;
  }
  size_t v18 = (size_t)v11;
  if (*v11 != 35615 || *((unsigned char *)v11 + 2) != 8) {
    return 0;
  }
  unsigned int v20 = *((unsigned __int8 *)v11 + 3);
  if (v20 > 0x1F) {
    return 0;
  }
  if (a3) {
    *(_DWORD *)(a3 + 152) = *((_DWORD *)v11 + 1);
  }
  if ((v20 & 4) == 0)
  {
    uint64_t v21 = 10;
    if ((v20 & 8) == 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v24 = v21;
    while (1)
    {
      int64_t v22 = v24 + 1;
      if (v28 <= v24)
      {
        size_t v18 = sub_20997360C(a1, v24 + 1, &v28, v12, v13, v14, v15, v16);
        if (!v18) {
          return 0;
        }
      }
      if (!*(unsigned __int8 *)(v18 + v24++))
      {
        if (a3)
        {
          free(*(void **)(a3 + 160));
          *(void *)(a3 + 160) = strdup((const char *)(v18 + v21));
        }
        goto LABEL_22;
      }
    }
  }
  size_t v23 = sub_20997360C(a1, 0xCuLL, &v28, v12, v13, v14, v15, v16);
  if (!v23) {
    return 0;
  }
  size_t v18 = v23;
  uint64_t v21 = *(unsigned __int16 *)(v23 + 10) + 12;
  if ((v20 & 8) != 0) {
    goto LABEL_16;
  }
LABEL_13:
  int64_t v22 = v21;
LABEL_22:
  if ((v20 & 0x10) != 0)
  {
    while (1)
    {
      size_t v17 = v22 + 1;
      if (v28 <= v22)
      {
        size_t v18 = sub_20997360C(a1, v22 + 1, &v28, v12, v13, v14, v15, v16);
        if (!v18) {
          return 0;
        }
      }
      if (!*(unsigned __int8 *)(v18 + v22++)) {
        goto LABEL_27;
      }
    }
  }
  size_t v17 = v22;
LABEL_27:
  if ((v20 & 2) != 0)
  {
    v17 += 2;
    if (!sub_20997360C(a1, v17, &v28, v12, v13, v14, v15, v16)) {
      return 0;
    }
  }
  if (a2) {
    *a2 = 27;
  }
  return v17;
}

uint64_t sub_2099DAA98(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[11];
  *(void *)(v9 + 24) = *(void *)(v9 + 120);
  int v10 = *(_DWORD *)(v9 + 128);
  *(_DWORD *)(v9 + 32) = v10;
  if (v10)
  {
    unint64_t v42 = 0;
    do
    {
      if (*(unsigned char *)(v9 + 168)) {
        break;
      }
      if (!*(unsigned char *)(v9 + 112))
      {
        uint64_t v12 = a1[11];
        size_t v13 = sub_2099DA900(a1[2], 0, v12, a4, a5, a6, a7, a8);
        if (!v13)
        {
          *(unsigned char *)(v9 + 168) = 1;
          break;
        }
        uint64_t v43 = 0;
        sub_209973A10(a1[2], v13, v14, v15, v16, v17, v18, v19);
        *(void *)(v12 + 144) = crc32(0, 0, 0);
        *(void *)uint64_t v12 = sub_20997360C(a1[2], 1uLL, &v43, v20, v21, v22, v23, v24);
        *(_DWORD *)(v12 + 8) = v43;
        uint64_t v25 = (char *)inflateInit2_((z_streamp)v12, -15, "1.2.12", 112);
        if (v25)
        {
          if (v25 != -6)
          {
            if (v25 == -4)
            {
              uint64_t v33 = (_DWORD *)a1[3];
              uint64_t v34 = "Internal error initializing compression library: out of memory";
              int v40 = 12;
            }
            else
            {
              if (v25 == -2)
              {
                uint64_t v33 = (_DWORD *)a1[3];
                uint64_t v34 = "Internal error initializing compression library: invalid setup parameter";
                goto LABEL_37;
              }
              unint64_t v35 = (_DWORD *)a1[3];
              uint64_t v41 = v25;
              uint64_t v34 = "Internal error initializing compression library:  Zlib error %d";
LABEL_36:
              uint64_t v33 = v35;
LABEL_37:
              int v40 = -1;
            }
            archive_set_error(v33, v40, v34, a4, a5, a6, a7, a8, v41);
            return -30;
          }
          uint64_t v33 = (_DWORD *)a1[3];
          uint64_t v34 = "Internal error initializing compression library: invalid library version";
          goto LABEL_37;
        }
        *(unsigned char *)(v12 + 112) = 1;
      }
      size_t v26 = sub_20997360C(a1[2], 1uLL, &v42, a4, a5, a6, a7, a8);
      *(void *)uint64_t v9 = v26;
      if (!v26)
      {
        uint64_t v33 = (_DWORD *)a1[3];
        uint64_t v34 = "truncated gzip input";
        goto LABEL_37;
      }
      int v27 = v42;
      if ((v42 & 0x8000000000000000) != 0) {
        return -30;
      }
      if (HIDWORD(v42))
      {
        unint64_t v42 = 0xFFFFFFFFLL;
        int v27 = -1;
      }
      *(_DWORD *)(v9 + 8) = v27;
      uint64_t v28 = (char *)inflate((z_streamp)v9, 0);
      if (v28 == 1)
      {
        sub_209973A10(a1[2], v42 - *(unsigned int *)(v9 + 8), v29, a4, a5, a6, a7, a8);
        uint64_t v32 = a1[11];
        *(unsigned char *)(v32 + 112) = 0;
        if (inflateEnd((z_streamp)v32))
        {
          uint64_t v33 = (_DWORD *)a1[3];
          uint64_t v34 = "Failed to clean up gzip decompressor";
          goto LABEL_37;
        }
        uint64_t v43 = 0;
        if (!sub_20997360C(a1[2], 8uLL, &v43, a4, a5, a6, a7, a8) || !v43) {
          return -30;
        }
        uint64_t v30 = a1[2];
        uint64_t v31 = 8;
      }
      else
      {
        if (v28)
        {
          unint64_t v35 = (_DWORD *)a1[3];
          uint64_t v41 = v28;
          uint64_t v34 = "gzip decompression failed (zlib returned error %d, msg %s)";
          goto LABEL_36;
        }
        uint64_t v30 = a1[2];
        uint64_t v31 = v42 - *(unsigned int *)(v9 + 8);
      }
      sub_209973A10(v30, v31, v29, a4, a5, a6, a7, a8);
    }
    while (*(_DWORD *)(v9 + 32));
  }
  uint64_t v36 = *(void *)(v9 + 24);
  uint64_t v37 = *(void *)(v9 + 120);
  uint64_t result = v36 - v37;
  *(void *)(v9 + 136) += v36 - v37;
  if (v36 == v37) {
    uint64_t v39 = 0;
  }
  else {
    uint64_t v39 = v37;
  }
  *a2 = v39;
  return result;
}

uint64_t sub_2099DAD18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 88);
  if (*(unsigned char *)(v1 + 112) && inflateEnd(*(z_streamp *)(a1 + 88)))
  {
    archive_set_error(*(_DWORD **)(a1 + 24), -1, "Failed to clean up gzip compressor", v3, v4, v5, v6, v7, v10);
    uint64_t v8 = 4294967266;
  }
  else
  {
    uint64_t v8 = 0;
  }
  free(*(void **)(v1 + 160));
  free(*(void **)(v1 + 120));
  free((void *)v1);
  return v8;
}

uint64_t sub_2099DAD8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = *(unsigned int *)(v3 + 152);
  if (v4) {
    archive_entry_set_mtime(a2, v4, 0);
  }
  uint64_t v5 = *(char **)(v3 + 160);
  if (v5) {
    archive_entry_set_pathname(a2, v5);
  }
  return 0;
}

uint64_t archive_write_set_format_ustar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 1, "archive_write_set_format_ustar", a5, a6, a7, a8);
  if (result != -30)
  {
    int v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = malloc_type_calloc(1uLL, 0x28uLL, 0x10200404DE2C876uLL);
    if (v11)
    {
      uint64_t v17 = v11;
      uint64_t result = 0;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 272) = "ustar";
      *(void *)(a1 + 288) = sub_2099DAEF0;
      *(void *)(a1 + 304) = sub_2099DAF98;
      *(void *)(a1 + 312) = sub_2099DB1D0;
      *(void *)(a1 + 320) = sub_2099DB21C;
      *(void *)(a1 + 328) = sub_2099DB224;
      *(void *)(a1 + 296) = sub_2099DB254;
      *(_DWORD *)(a1 + 16) = 196609;
      *(void *)(a1 + 24) = "POSIX ustar";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate ustar data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t sub_2099DAEF0(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = *(void *)(a1 + 264);
  if (strcmp(__s1, "hdrcharset")) {
    return 4294967276;
  }
  if (a3 && *a3)
  {
    uint64_t v12 = sub_2099C4288(a1, a3, 0);
    *(void *)(v5 + 16) = v12;
    if (v12) {
      return 0;
    }
    else {
      return 4294967266;
    }
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, *(char **)(a1 + 272));
    return 4294967271;
  }
}

uint64_t sub_2099DAF98(uint64_t a1, uint64_t *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
    if (*(_DWORD *)(v4 + 32))
    {
      uint64_t v5 = *(void *)(v4 + 24);
    }
    else
    {
      uint64_t v5 = sub_209976040();
      *(void *)(v4 + 24) = v5;
      *(_DWORD *)(v4 + 32) = 1;
    }
  }
  if (!archive_entry_pathname(a2))
  {
    archive_set_error((_DWORD *)a1, -1, "Can't record entry in tar file without pathname", v6, v7, v8, v9, v10, v24);
    return 4294967271;
  }
  if (archive_entry_hardlink((uint64_t)a2)
    || archive_entry_symlink((uint64_t)a2)
    || archive_entry_filetype((uint64_t)a2) != 0x8000)
  {
    archive_entry_set_size((uint64_t)a2, 0);
  }
  if (archive_entry_filetype((uint64_t)a2) == 0x4000)
  {
    uint64_t v11 = (const char *)archive_entry_pathname(a2);
    if (v11)
    {
      uint64_t v12 = (char *)v11;
      if (*v11)
      {
        if (v11[strlen(v11) - 1] != 47)
        {
          __dst = 0;
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          size_t v13 = strlen(v12);
          if (!sub_209974664((void **)&__dst, v13 + 2))
          {
            archive_set_error((_DWORD *)a1, 12, "Can't allocate ustar data", v14, v15, v16, v17, v18, v24);
            sub_20997954C((uint64_t)&__dst);
            return 4294967266;
          }
          uint64_t v26 = 0;
          sub_209974714((uint64_t *)&__dst, v12, v13);
          sub_2099C4050((uint64_t *)&__dst, 47);
          archive_entry_copy_pathname((uint64_t)a2, __dst);
          sub_20997954C((uint64_t)&__dst);
        }
      }
    }
  }
  uint64_t v19 = sub_2099DB284((_DWORD *)a1, (char *)&__dst, a2, -1, 1, v5);
  if ((int)v19 <= -21)
  {
LABEL_24:
    archive_entry_free(0);
    return v19;
  }
  uint64_t v20 = sub_2099C9728(a1, (uint64_t)&__dst, 512);
  uint64_t v21 = v20;
  if ((int)v20 > -21)
  {
    if ((int)v20 >= (int)v19) {
      uint64_t v19 = v19;
    }
    else {
      uint64_t v19 = v20;
    }
    uint64_t v22 = archive_entry_size((uint64_t)a2);
    *(void *)uint64_t v4 = v22;
    *(void *)(v4 + 8) = -(int)v22 & 0x1FFLL;
    goto LABEL_24;
  }
  archive_entry_free(0);
  return v21;
}

uint64_t sub_2099DB1D0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = *v3;
  }
  LODWORD(result) = sub_2099C9728(a1, a2, v4);
  *v3 -= v4;
  if (result) {
    return (int)result;
  }
  else {
    return v4;
  }
}

uint64_t sub_2099DB21C(void *a1)
{
  return sub_2099C978C(a1, 0x400uLL);
}

uint64_t sub_2099DB224(uint64_t a1)
{
  *(void *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_2099DB254(void *a1)
{
  uint64_t v1 = (void *)a1[33];
  uint64_t result = sub_2099C978C(a1, v1[1] + *v1);
  void *v1 = 0;
  v1[1] = 0;
  return result;
}

uint64_t sub_2099DB284(_DWORD *a1, char *__dst, uint64_t *a3, int a4, int a5, uint64_t a6)
{
  __s = 0;
  size_t __n = 0;
  __src = 0;
  memcpy(__dst, &unk_2099EC8D4, 0x200uLL);
  if (sub_20997DF08(a3, &__src, &__n, a6))
  {
    if (*__error() == 12)
    {
      uint64_t v16 = "Can't allocate memory for Pathname";
LABEL_43:
      archive_set_error(a1, 12, v16, v11, v12, v13, v14, v15, v139);
      return 4294967266;
    }
    uint64_t v18 = (char *)__src;
    sub_2099C42E4(a6);
    archive_set_error(a1, 79, "Can't translate pathname '%s' to %s", v19, v20, v21, v22, v23, v18);
    uint64_t v17 = 4294967276;
  }
  else
  {
    uint64_t v17 = 0;
  }
  size_t v24 = __n;
  uint64_t v25 = (char *)__src;
  if (__n <= 0x64)
  {
    uint64_t v26 = __dst;
    uint64_t v27 = __src;
LABEL_8:
    memcpy(v26, v27, v24);
    goto LABEL_16;
  }
  uint64_t v28 = (char *)__src + __n;
  uint64_t v29 = strchr((char *)__src + __n - 101, 47);
  unint64_t v35 = v29;
  __s = v29;
  if (v29 == v25)
  {
    unint64_t v35 = strchr(v25 + 1, 47);
    __s = v35;
    if (!v35) {
      goto LABEL_15;
    }
  }
  else if (!v29)
  {
    goto LABEL_15;
  }
  if (v35[1] && v35 <= v25 + 155)
  {
    memcpy(__dst + 345, v25, v35 - v25);
    size_t v24 = (size_t)&v28[~(unint64_t)v35];
    uint64_t v26 = __dst;
    uint64_t v27 = v35 + 1;
    goto LABEL_8;
  }
LABEL_15:
  archive_set_error(a1, 63, "Pathname too long", v30, v31, v32, v33, v34, v139);
  uint64_t v17 = 4294967271;
LABEL_16:
  if (sub_20997DE30((uint64_t)a3, &__s, &__n, a6))
  {
    if (*__error() == 12)
    {
LABEL_23:
      uint64_t v16 = "Can't allocate memory for Linkname";
      goto LABEL_43;
    }
    uint64_t v41 = __s;
    sub_2099C42E4(a6);
    archive_set_error(a1, 79, "Can't translate linkname '%s' to %s", v42, v43, v44, v45, v46, v41);
    uint64_t v17 = 4294967276;
  }
  size_t v47 = __n;
  if (!__n)
  {
    if (sub_20997E104((uint64_t)a3, &__s, &__n, a6))
    {
      if (*__error() == 12) {
        goto LABEL_23;
      }
      uint64_t v50 = __s;
      sub_2099C42E4(a6);
      archive_set_error(a1, 79, "Can't translate linkname '%s' to %s", v51, v52, v53, v54, v55, v50);
      uint64_t v17 = 4294967276;
    }
    size_t v49 = __n;
    char v48 = -1;
    if (!__n) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }
  char v48 = 49;
  size_t v49 = __n;
LABEL_27:
  if (v49 >= 0x65)
  {
    archive_set_error(a1, 63, "Link contents too long", v36, v37, v38, v39, v40, v139);
    size_t v49 = 100;
    size_t __n = 100;
    uint64_t v17 = 4294967271;
  }
  memcpy(__dst + 157, __s, v49);
LABEL_30:
  if (sub_20997E26C(a3, &__s, &__n, a6))
  {
    if (*__error() == 12)
    {
      uint64_t v16 = "Can't allocate memory for Uname";
      goto LABEL_43;
    }
    uint64_t v61 = __s;
    sub_2099C42E4(a6);
    archive_set_error(a1, 79, "Can't translate uname '%s' to %s", v62, v63, v64, v65, v66, v61);
    uint64_t v17 = 4294967276;
  }
  size_t v67 = __n;
  if (__n)
  {
    if (__n >= 0x21)
    {
      if (a4 != 120)
      {
        archive_set_error(a1, -1, "Username too long", v56, v57, v58, v59, v60, v139);
        uint64_t v17 = 4294967271;
      }
      size_t v67 = 32;
      size_t __n = 32;
    }
    memcpy(__dst + 265, __s, v67);
  }
  if (sub_20997DD3C(a3, &__s, &__n, a6))
  {
    if (*__error() == 12)
    {
      uint64_t v16 = "Can't allocate memory for Gname";
      goto LABEL_43;
    }
    uint64_t v69 = __s;
    sub_2099C42E4(a6);
    archive_set_error(a1, 79, "Can't translate gname '%s' to %s", v70, v71, v72, v73, v74, v69);
    uint64_t v17 = 4294967276;
  }
  size_t v75 = __n;
  if (__n)
  {
    signed int v76 = __s;
    if (strlen(__s) >= 0x21)
    {
      if (a4 != 120)
      {
        archive_set_error(a1, -1, "Group name too long", v77, v78, v79, v80, v81, v139);
        uint64_t v17 = 4294967271;
        signed int v76 = __s;
      }
      size_t v75 = 32;
      size_t __n = 32;
    }
    memcpy(__dst + 297, v76, v75);
  }
  __int16 v82 = archive_entry_mode((uint64_t)a3);
  if (sub_2099DB998(v82 & 0xFFF, __dst + 100, 6uLL, 8, a5))
  {
    archive_set_error(a1, 34, "Numeric mode too large", v83, v84, v85, v86, v87, v139);
    uint64_t v17 = 4294967271;
  }
  int64_t v88 = archive_entry_uid((uint64_t)a3);
  if (sub_2099DB998(v88, __dst + 108, 6uLL, 8, a5))
  {
    archive_set_error(a1, 34, "Numeric user ID too large", v89, v90, v91, v92, v93, v139);
    uint64_t v17 = 4294967271;
  }
  int64_t v94 = archive_entry_gid((uint64_t)a3);
  if (sub_2099DB998(v94, __dst + 116, 6uLL, 8, a5))
  {
    archive_set_error(a1, 34, "Numeric group ID too large", v95, v96, v97, v98, v99, v139);
    uint64_t v17 = 4294967271;
  }
  int64_t v100 = archive_entry_size((uint64_t)a3);
  if (sub_2099DB998(v100, __dst + 124, 0xBuLL, 12, a5))
  {
    archive_set_error(a1, 34, "File size out of range", v101, v102, v103, v104, v105, v139);
    uint64_t v17 = 4294967271;
  }
  int64_t v106 = archive_entry_mtime((uint64_t)a3);
  if (sub_2099DB998(v106, __dst + 136, 0xBuLL, 11, a5))
  {
    archive_set_error(a1, 34, "File modification time too large", v107, v108, v109, v110, v111, v139);
    uint64_t v17 = 4294967271;
  }
  if (archive_entry_filetype((uint64_t)a3) == 24576
    || archive_entry_filetype((uint64_t)a3) == 0x2000)
  {
    int v112 = archive_entry_rdevmajor((uint64_t)a3);
    if (sub_2099DB998(v112, __dst + 329, 6uLL, 8, a5))
    {
      archive_set_error(a1, 34, "Major device number too large", v113, v114, v115, v116, v117, v139);
      uint64_t v17 = 4294967271;
    }
    int v118 = archive_entry_rdevminor(a3);
    char v124 = a4;
    if (sub_2099DB998(v118, __dst + 337, 6uLL, 8, a5))
    {
      archive_set_error(a1, 34, "Minor device number too large", v119, v120, v121, v122, v123, v139);
      uint64_t v17 = 4294967271;
    }
    if ((a4 & 0x80000000) == 0) {
      goto LABEL_69;
    }
LABEL_71:
    if (v47)
    {
      __dst[156] = v48;
    }
    else
    {
      HIDWORD(v125) = archive_entry_filetype((uint64_t)a3);
      LODWORD(v125) = HIDWORD(v125) - 4096;
      switch((v125 >> 12))
      {
        case 0u:
          char v126 = 54;
          goto LABEL_81;
        case 1u:
          char v126 = 51;
          goto LABEL_81;
        case 3u:
          char v126 = 53;
          goto LABEL_81;
        case 5u:
          char v126 = 52;
          goto LABEL_81;
        case 7u:
          char v126 = 48;
          goto LABEL_81;
        case 9u:
          char v126 = 50;
LABEL_81:
          __dst[156] = v126;
          break;
        default:
          sub_2099CCD58(a1, a3);
          uint64_t v17 = 4294967271;
          break;
      }
    }
    goto LABEL_82;
  }
  char v124 = a4;
  if (a4 < 0) {
    goto LABEL_71;
  }
LABEL_69:
  __dst[156] = v124;
LABEL_82:
  uint64_t v127 = 0;
  int32x4_t v128 = 0uLL;
  int32x4_t v129 = 0uLL;
  int32x4_t v130 = 0uLL;
  int32x4_t v131 = 0uLL;
  do
  {
    uint8x16_t v132 = *(uint8x16_t *)&__dst[v127];
    uint16x8_t v133 = vmovl_u8(*(uint8x8_t *)v132.i8);
    uint16x8_t v134 = vmovl_high_u8(v132);
    int32x4_t v131 = (int32x4_t)vaddw_high_u16((uint32x4_t)v131, v134);
    int32x4_t v130 = (int32x4_t)vaddw_u16((uint32x4_t)v130, *(uint16x4_t *)v134.i8);
    int32x4_t v129 = (int32x4_t)vaddw_high_u16((uint32x4_t)v129, v133);
    int32x4_t v128 = (int32x4_t)vaddw_u16((uint32x4_t)v128, *(uint16x4_t *)v133.i8);
    v127 += 16;
  }
  while (v127 != 512);
  unint64_t v135 = vaddvq_s32(vaddq_s32(vaddq_s32(v128, v130), vaddq_s32(v129, v131)));
  __dst[154] = 0;
  int v136 = __dst + 154;
  for (unsigned int i = 7; i > 1; --i)
  {
    unint64_t v138 = v135;
    *--int v136 = v135 & 7 | 0x30;
    v135 >>= 3;
  }
  if (v138 >= 8)
  {
    *((_WORD *)v136 + 2) = 14135;
    *(_DWORD *)int v136 = 926365495;
  }
  return v17;
}

uint64_t sub_2099DB998(int64_t a1, char *a2, size_t a3, int a4, int a5)
{
  if (a5) {
    return sub_2099DBA14(a1, a2, a3);
  }
  if ((a1 & 0x8000000000000000) == 0 && (int)a3 <= a4)
  {
    uint64_t v6 = 1 << (3 * a3);
    while (v6 <= a1)
    {
      a3 = (a3 + 1);
      v6 *= 8;
      if (a4 + 1 == a3) {
        goto LABEL_8;
      }
    }
    return sub_2099DBA14(a1, a2, a3);
  }
LABEL_8:
  uint64_t v7 = &a2[a4];
  if (a4 < 1)
  {
    char v9 = *v7;
  }
  else
  {
    unsigned int v8 = a4 + 1;
    do
    {
      char v9 = a1;
      *--uint64_t v7 = a1;
      a1 >>= 8;
      --v8;
    }
    while (v8 > 1);
  }
  *uint64_t v7 = v9 | 0x80;
  return 0;
}

uint64_t sub_2099DBA14(unint64_t a1, char *__b, size_t __len)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    if ((int)__len < 1) {
      return 0xFFFFFFFFLL;
    }
    __len = __len;
    uint64_t v4 = __b;
    int v8 = 48;
LABEL_12:
    memset(v4, v8, __len);
    return 0xFFFFFFFFLL;
  }
  unint64_t v3 = a1;
  if ((int)__len < 1)
  {
    if (a1) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v4 = &__b[(int)__len];
    unsigned int v5 = __len + 1;
    do
    {
      unint64_t v6 = v3;
      *--uint64_t v4 = v3 & 7 | 0x30;
      v3 >>= 3;
      --v5;
    }
    while (v5 > 1);
    if (v6 <= 7) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = 0xFFFFFFFFLL;
    }
    if (v6 >= 8)
    {
      __len = __len;
      int v8 = 55;
      goto LABEL_12;
    }
  }
  return v7;
}

void *sub_2099DBAB0(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 2480);
  if (!result)
  {
    uint64_t result = malloc_type_calloc(1uLL, 0x18uLL, 0xA00402214FCE6uLL);
    *(void *)(a1 + 2480) = result;
    if (result)
    {
      *(void *)(a1 + 2488) = sub_2099DBB28;
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't extract", v3, v4, v5, v6, v7, v8);
      return 0;
    }
  }
  return result;
}

uint64_t sub_2099DBB28(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 2480);
  if (*v2)
  {
    uint64_t v3 = archive_write_free(*v2);
    uint64_t v2 = *(uint64_t **)(a1 + 2480);
  }
  else
  {
    uint64_t v3 = 0;
  }
  free(v2);
  *(void *)(a1 + 2480) = 0;
  return v3;
}

uint64_t archive_read_extract2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 168)) {
    archive_write_disk_set_skip_file(a3, *(void *)(a1 + 176), *(void *)(a1 + 184), a4, a5, a6, a7, a8);
  }
  int v11 = archive_write_header(a3);
  if (v11 <= -20) {
    int v12 = -20;
  }
  else {
    int v12 = v11;
  }
  if (v12)
  {
    archive_copy_error(a1, a3);
  }
  else if (archive_entry_size_is_set(a2) && archive_entry_size(a2) < 1)
  {
    int v12 = 0;
  }
  else
  {
    uint64_t v16 = sub_2099DBAB0(a1);
    if (v16)
    {
      uint64_t v17 = v16;
      while (1)
      {
        int data_block = archive_read_data_block(a1);
        if (data_block) {
          break;
        }
        int v23 = archive_write_data_block(a3, 0, 0, 0, v19, v20, v21, v22);
        if (v23 <= -20) {
          int v12 = -20;
        }
        else {
          int v12 = v23;
        }
        if (v12 < 0)
        {
          int v25 = archive_errno(a3);
          uint64_t v26 = archive_error_string(a3);
          archive_set_error((_DWORD *)a1, v25, "%s", v27, v28, v29, v30, v31, v26);
          goto LABEL_8;
        }
        size_t v24 = (void (*)(void))v17[1];
        if (v24) {
          v24(v17[2]);
        }
      }
      if (data_block == 1) {
        int v12 = 0;
      }
      else {
        int v12 = data_block;
      }
    }
    else
    {
      int v12 = -30;
    }
  }
LABEL_8:
  int v13 = archive_write_finish_entry(a3);
  if (v13 <= -20) {
    int v14 = -20;
  }
  else {
    int v14 = v13;
  }
  if (!v12 && v14) {
    archive_copy_error(a1, a3);
  }
  if (v14 >= v12) {
    return v12;
  }
  else {
    return v14;
  }
}

void *archive_read_extract_set_progress_callback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_2099DBAB0(a1);
  if (result)
  {
    result[1] = a2;
    result[2] = a3;
  }
  return result;
}

uint64_t archive_write_set_format_filter_by_ext(_DWORD *a1, char *__s)
{
  unsigned int v4 = sub_2099DBDE0(__s);
  if ((v4 & 0x80000000) != 0)
  {
    archive_set_error(a1, 22, "No such format '%s'", v5, v6, v7, v8, v9, __s);
    a1[1] = 0x8000;
    return 4294967266;
  }
  else
  {
    unsigned int v10 = v4;
    uint64_t result = ((uint64_t (*)(_DWORD *))(&off_26BD73D40)[3 * v4 + 1])(a1);
    if (!result)
    {
      int v12 = (&off_26BD73D40)[3 * v10 + 2];
      return ((uint64_t (*)(_DWORD *))v12)(a1);
    }
  }
  return result;
}

uint64_t sub_2099DBDE0(char *__s)
{
  uint64_t v2 = 0;
  uint64_t v3 = ".7z";
  for (unsigned int i = &off_26BD73D58; ; i += 3)
  {
    if (__s)
    {
      size_t v5 = strlen(__s);
      size_t v6 = strlen(v3);
      if (v5 >= v6 && !strcmp(&__s[v5 - v6], v3)) {
        break;
      }
    }
    ++v2;
    uint64_t v7 = *i;
    uint64_t v3 = v7;
    if (v2 == 12) {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t archive_write_set_format_filter_by_ext_def(_DWORD *a1, char *__s, char *a3)
{
  unsigned int v6 = sub_2099DBDE0(__s);
  if ((v6 & 0x80000000) != 0 && (unsigned int v6 = sub_2099DBDE0(a3), (v6 & 0x80000000) != 0))
  {
    archive_set_error(a1, 22, "No such format '%s'", v7, v8, v9, v10, v11, __s);
    a1[1] = 0x8000;
    return 4294967266;
  }
  else
  {
    uint64_t result = ((uint64_t (*)(_DWORD *))(&off_26BD73D40)[3 * v6 + 1])(a1);
    if (!result)
    {
      int v13 = (&off_26BD73D40)[3 * v6 + 2];
      return ((uint64_t (*)(_DWORD *))v13)(a1);
    }
  }
  return result;
}

uint64_t archive_write_set_compression_none()
{
  return 0;
}

uint64_t archive_write_add_filter_none()
{
  return 0;
}

uint64_t archive_write_zip_set_compression_deflate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 7, "archive_write_zip_set_compression_deflate", a5, a6, a7, a8);
  if (result != -30)
  {
    if (*(_DWORD *)(a1 + 16) == 327680)
    {
      uint64_t result = 0;
      *(_DWORD *)(*(void *)(a1 + 264) + 656) = 8;
    }
    else
    {
      archive_set_error((_DWORD *)a1, -1, "Can only use archive_write_zip_set_compression_deflate with zip format", v10, v11, v12, v13, v14, v15);
      return 4294967266;
    }
  }
  return result;
}

uint64_t archive_write_zip_set_compression_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 264);
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 7, "archive_write_zip_set_compression_deflate", a5, a6, a7, a8);
  if (result != -30)
  {
    if (*(_DWORD *)(a1 + 16) == 327680)
    {
      uint64_t result = 0;
      *(_DWORD *)(v9 + 656) = 0;
    }
    else
    {
      archive_set_error((_DWORD *)a1, -1, "Can only use archive_write_zip_set_compression_store with zip format", v11, v12, v13, v14, v15, v16);
      return 4294967266;
    }
  }
  return result;
}

uint64_t archive_write_set_format_zip(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 1, "archive_write_set_format_zip", a5, a6, a7, a8);
  if (result != -30)
  {
    uint64_t v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = malloc_type_calloc(1uLL, 0x328uLL, 0x10B0040F059636CuLL);
    if (v11)
    {
      uint64_t v17 = v11;
      v11[82] = -1;
      v11[74] = j__crc32_0;
      v11[99] = 0x10000;
      uint64_t v18 = malloc_type_malloc(0x10000uLL, 0xFD82B85BuLL);
      v17[100] = v18;
      if (v18)
      {
        uint64_t result = 0;
        *(void *)(a1 + 264) = v17;
        *(void *)(a1 + 272) = "zip";
        *(void *)(a1 + 288) = sub_2099DC1A0;
        *(void *)(a1 + 304) = sub_2099DC510;
        *(void *)(a1 + 312) = sub_2099DD080;
        *(void *)(a1 + 296) = sub_2099DD630;
        *(void *)(a1 + 320) = sub_2099DDA9C;
        *(void *)(a1 + 328) = sub_2099DDDAC;
        *(_DWORD *)(a1 + 16) = 327680;
        *(void *)(a1 + 24) = "ZIP";
        return result;
      }
      free(v17);
      uint64_t v19 = "Can't allocate compression buffer";
    }
    else
    {
      uint64_t v19 = "Can't allocate zip data";
    }
    archive_set_error((_DWORD *)a1, 12, v19, v12, v13, v14, v15, v16, v20);
    return 4294967266;
  }
  return result;
}

uint64_t sub_2099DC1A0(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 264);
  if (!strcmp(__s1, "compression"))
  {
    if (!a3 || !*a3)
    {
      uint64_t v30 = *(char **)(a1 + 272);
      uint64_t v20 = "%s: compression option needs a compression name";
LABEL_21:
      archive_set_error((_DWORD *)a1, -1, v20, v7, v8, v9, v10, v11, v30);
      return 4294967271;
    }
    uint64_t result = strcmp(a3, "deflate");
    if (!result)
    {
      *(_DWORD *)(v6 + 656) = 8;
      return result;
    }
    uint64_t result = strcmp(a3, "store");
    if (result) {
      return 4294967271;
    }
LABEL_53:
    *(_DWORD *)(v6 + 656) = 0;
    return result;
  }
  if (!strcmp(__s1, "compression-level"))
  {
    if (!a3) {
      return 4294967276;
    }
    int v19 = *a3;
    if ((v19 - 48) > 9 || a3[1]) {
      return 4294967276;
    }
    if (v19 != 48)
    {
      uint64_t result = 0;
      *(_DWORD *)(v6 + 656) = 8;
      *(_DWORD *)(v6 + 660) = *a3 - 48;
      return result;
    }
    uint64_t result = 0;
    goto LABEL_53;
  }
  if (!strcmp(__s1, "encryption"))
  {
    if (!a3)
    {
      uint64_t result = 0;
      *(_DWORD *)(v6 + 668) = 0;
      return result;
    }
    if (*a3 == 49 || !strcmp(a3, "traditional") || !strcmp(a3, "zipcrypt") || !strcmp(a3, "ZipCrypt"))
    {
      uint64_t result = sub_2099DEB28(v31, 0xBuLL);
      if (!result)
      {
        *(_DWORD *)(v6 + 668) = 1;
        return result;
      }
    }
    else
    {
      if (!strcmp(a3, "aes128"))
      {
        int v28 = 2;
        int v29 = 2;
      }
      else
      {
        if (strcmp(a3, "aes256"))
        {
          archive_set_error((_DWORD *)a1, -1, "%s: unknown encryption '%s'", v21, v22, v23, v24, v25, *(char **)(a1 + 272));
          return 4294967271;
        }
        int v28 = 3;
        int v29 = 3;
      }
      if (sub_2099DDE54(v29))
      {
        uint64_t result = 0;
        *(_DWORD *)(v6 + 668) = v28;
        return result;
      }
    }
    uint64_t v20 = "encryption not supported";
    goto LABEL_21;
  }
  if (!strcmp(__s1, "experimental"))
  {
    if (a3 && *a3)
    {
      uint64_t result = 0;
      unsigned int v18 = *(_DWORD *)(v6 + 672) | 4;
    }
    else
    {
      uint64_t result = 0;
      unsigned int v18 = *(_DWORD *)(v6 + 672) & 0xFFFFFFFB;
    }
    goto LABEL_40;
  }
  if (strcmp(__s1, "fakecrc32"))
  {
    if (strcmp(__s1, "hdrcharset"))
    {
      if (!strcmp(__s1, "zip64"))
      {
        if (a3 && *a3)
        {
          uint64_t result = 0;
          unsigned int v18 = *(_DWORD *)(v6 + 672) & 0xFFFFFFFC | 2;
        }
        else
        {
          uint64_t result = 0;
          unsigned int v18 = *(_DWORD *)(v6 + 672) & 0xFFFFFFFC | 1;
        }
LABEL_40:
        *(_DWORD *)(v6 + 672) = v18;
        return result;
      }
      return 4294967276;
    }
    if (a3 && *a3)
    {
      uint64_t v27 = sub_2099C4288(a1, a3, 0);
      *(void *)(v6 + 640) = v27;
      if (v27) {
        return 0;
      }
      else {
        return 4294967266;
      }
    }
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v12, v13, v14, v15, v16, *(char **)(a1 + 272));
    return 4294967271;
  }
  if (a3 && *a3)
  {
    uint64_t result = 0;
    uint64_t v26 = sub_2099DDFB8;
  }
  else
  {
    uint64_t result = 0;
    uint64_t v26 = j__crc32_0;
  }
  *(void *)(v6 + 592) = v26;
  return result;
}

uint64_t sub_2099DC510(uint64_t a1, uint64_t *a2)
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = *(void *)(v4 + 640);
  if (!v5)
  {
    if (*(_DWORD *)(v4 + 664))
    {
      uint64_t v5 = *(void *)(v4 + 648);
    }
    else
    {
      uint64_t v5 = sub_209976040();
      *(void *)(v4 + 648) = v5;
      *(_DWORD *)(v4 + 664) = 1;
    }
  }
  int v6 = archive_entry_filetype((uint64_t)a2);
  int v7 = v6;
  if (v6 != 0x4000 && v6 != 0x8000 && v6 != 40960)
  {
    sub_2099CCD58((_DWORD *)a1, a2);
    return 4294967271;
  }
  if (*(unsigned char *)(v4 + 672))
  {
    if (archive_entry_size_is_set((uint64_t)a2) && archive_entry_size((uint64_t)a2) >= 0x100000000)
    {
      uint64_t v13 = "Files > 4GB require Zip64 extensions";
LABEL_14:
      archive_set_error((_DWORD *)a1, -1, v13, v8, v9, v10, v11, v12, v95);
      return 4294967271;
    }
    if (*(uint64_t *)(v4 + 632) >= 0x100000000)
    {
      uint64_t v13 = "Archives > 4GB require Zip64 extensions";
      goto LABEL_14;
    }
  }
  if (v7 != 0x8000) {
    archive_entry_set_size((uint64_t)a2, 0);
  }
  *(void *)uint64_t v4 = *(void *)(v4 + 632);
  *(void *)(v4 + 40) = 0x7FFFFFFFFFFFFFFFLL;
  *(_OWORD *)(v4 + 8) = 0u;
  uint64_t v14 = (uint64_t *)(v4 + 8);
  *(_DWORD *)(v4 + 68) = 0;
  *(_DWORD *)(v4 + 72) = 0;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_DWORD *)(v4 + 56) = (*(uint64_t (**)(void, void, void))(v4 + 592))(0, 0, 0);
  *(_DWORD *)(v4 + 64) = 0;
  archive_entry_free(*(void ***)(v4 + 48));
  *(void *)(v4 + 48) = 0;
  if (*(unsigned char *)(v4 + 184)) {
    off_26BD73638(v4 + 104);
  }
  if (*(unsigned char *)(v4 + 572)) {
    off_26BD736E8((_OWORD *)(v4 + 188));
  }
  *(unsigned char *)(v4 + 572) = 0;
  *(unsigned char *)(v4 + 184) = 0;
  *(unsigned char *)(v4 + 92) = 0;
  if (v7 == 0x8000 && (!archive_entry_size_is_set((uint64_t)a2) || archive_entry_size((uint64_t)a2) >= 1))
  {
    int v15 = *(_DWORD *)(v4 + 668);
    if ((v15 - 1) <= 2)
    {
      int v16 = *(_DWORD *)(v4 + 68) | 1;
      *(_DWORD *)(v4 + 64) = v15;
      *(_DWORD *)(v4 + 68) = v16;
    }
  }
  uint64_t v17 = (uint64_t *)archive_entry_clone(a2);
  *(void *)(v4 + 48) = v17;
  if (!v17)
  {
    uint64_t v23 = "Can't allocate zip header data";
    goto LABEL_34;
  }
  if (v5)
  {
    *(void *)__src = 0;
    uint64_t v105 = 0;
    if (sub_20997DF08(a2, __src, &v105, v5))
    {
      if (*__error() == 12)
      {
        uint64_t v23 = "Can't allocate memory for Pathname";
LABEL_34:
        archive_set_error((_DWORD *)a1, 12, v23, v18, v19, v20, v21, v22, v95);
        return 4294967266;
      }
      uint64_t v25 = (char *)archive_entry_pathname(a2);
      sub_2099C42E4(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate Pathname '%s' to %s", v26, v27, v28, v29, v30, v25);
      uint64_t v24 = 4294967276;
    }
    else
    {
      uint64_t v24 = 0;
    }
    if (v105) {
      archive_entry_set_pathname(*(void *)(v4 + 48), *(char **)__src);
    }
    if (v7 == 40960)
    {
      if (sub_20997E104((uint64_t)a2, __src, &v105, v5))
      {
        if (*__error() == 12)
        {
          uint64_t v23 = "Can't allocate memory  for Symlink";
          goto LABEL_34;
        }
      }
      else if (v105)
      {
        archive_entry_set_symlink(*(void *)(v4 + 48), *(char **)__src);
      }
    }
    uint64_t v17 = *(uint64_t **)(v4 + 48);
  }
  else
  {
    uint64_t v24 = 0;
  }
  uint64_t v31 = (unsigned char *)archive_entry_pathname(v17);
  while (1)
  {
    int v32 = (char)*v31;
    if (!*v31) {
      break;
    }
    ++v31;
    if (v32 < 0)
    {
      uint64_t v33 = *(void *)(v4 + 640);
      if (v33) {
        uint64_t v34 = (const char *)sub_2099C42E4(v33);
      }
      else {
        uint64_t v34 = nl_langinfo(0);
      }
      if (!strcmp(v34, "UTF-8")) {
        *(_DWORD *)(v4 + 68) |= 0x800u;
      }
      break;
    }
  }
  unint64_t v35 = *(uint64_t **)(v4 + 48);
  int v36 = archive_entry_filetype((uint64_t)v35);
  uint64_t v37 = (const char *)archive_entry_pathname(v35);
  if (v37)
  {
    uint64_t v38 = v37;
    size_t v39 = strlen(v37);
    uint64_t v40 = v39;
    if (v36 == 0x4000 && (!*v38 || v38[v39 - 1] != 47)) {
      uint64_t v40 = v39 + 1;
    }
  }
  else
  {
    uint64_t v40 = 0;
  }
  if (v7 == 40960)
  {
    uint64_t v41 = (const char *)archive_entry_symlink(*(void *)(v4 + 48));
    uint64_t v42 = v41;
    if (v41) {
      size_t v43 = strlen(v41);
    }
    else {
      size_t v43 = 0;
    }
    *(void *)(v4 + 40) = v43;
    *(void *)(v4 + 8) = v43;
    *(void *)(v4 + 16) = v43;
    unsigned int v47 = (*(uint64_t (**)(void, const char *, size_t))(v4 + 592))(*(unsigned int *)(v4 + 56), v42, v43);
    LOWORD(v45) = 0;
    *(void *)(v4 + 56) = v47;
    goto LABEL_75;
  }
  if (v7 != 0x8000)
  {
    LOWORD(v45) = 0;
    uint64_t v42 = 0;
    size_t v43 = 0;
    *(_DWORD *)(v4 + 60) = 0;
    *(void *)(v4 + 40) = 0;
    goto LABEL_75;
  }
  if (!archive_entry_size_is_set(*(void *)(v4 + 48)))
  {
    LOWORD(v45) = 8;
    *(_DWORD *)(v4 + 60) = 8;
    *(_DWORD *)(v4 + 68) |= 8u;
    if ((*(unsigned char *)(v4 + 672) & 1) == 0)
    {
      uint64_t v42 = 0;
      size_t v43 = 0;
      *(_DWORD *)(v4 + 72) = 1;
      __int16 v46 = 45;
      LOWORD(v45) = 8;
      goto LABEL_76;
    }
    uint64_t v42 = 0;
    size_t v43 = 0;
LABEL_75:
    __int16 v46 = 20;
    goto LABEL_76;
  }
  uint64_t v44 = archive_entry_size(*(void *)(v4 + 48));
  *(void *)(v4 + 40) = v44;
  int v45 = *(_DWORD *)(v4 + 656);
  if (v45 == -1) {
    int v45 = 8;
  }
  if (!v44) {
    int v45 = 0;
  }
  *(_DWORD *)(v4 + 60) = v45;
  if (v45)
  {
    __int16 v46 = 20;
  }
  else
  {
    *uint64_t v14 = v44;
    __int16 v46 = 10;
  }
  *(void *)(v4 + 16) = v44;
  int v92 = *(_DWORD *)(v4 + 68);
  if (v92)
  {
    if ((*(_DWORD *)(v4 + 64) - 1) >= 3)
    {
      uint64_t v93 = 0;
    }
    else
    {
      __int16 v46 = 20;
      uint64_t v93 = 8 * (*(_DWORD *)(v4 + 64) - 1) + 12;
    }
    if (!v45) {
      *v14 += v93;
    }
  }
  else
  {
    uint64_t v93 = 0;
  }
  if (v45) {
    BOOL v94 = v44 <= 4278190080;
  }
  else {
    BOOL v94 = 1;
  }
  if (!v94 || (*(_DWORD *)(v4 + 672) & 2) != 0 || v93 + v44 >= 0x100000000)
  {
    *(_DWORD *)(v4 + 72) = 1;
    __int16 v46 = 45;
  }
  uint64_t v42 = 0;
  size_t v43 = 0;
  *(_DWORD *)(v4 + 68) = v92 | 8;
LABEL_76:
  *(void *)&v109[2] = 0;
  uint64_t v110 = 0;
  LODWORD(v105) = 67324752;
  WORD2(v105) = v46;
  int v48 = *(_DWORD *)(v4 + 64);
  HIWORD(v105) = *(_DWORD *)(v4 + 68);
  if ((v48 & 0xFFFFFFFE) == 2)
  {
    LOBYTE(v45) = 99;
    char v49 = 0;
  }
  else
  {
    char v49 = BYTE1(v45);
  }
  char v106 = v45;
  char v107 = v49;
  time_t v50 = archive_entry_mtime(*(void *)(v4 + 48));
  int v51 = sub_2099DDFC0(v50);
  int v108 = v51;
  unsigned int v52 = *(_DWORD *)(v4 + 56);
  *(_DWORD *)uint64_t v109 = v52;
  uint64_t v96 = (uint64_t)v42;
  if (*(_DWORD *)(v4 + 72))
  {
    *(_DWORD *)&v109[4] = -1;
    LOBYTE(v53) = -1;
    LOBYTE(v54) = -1;
    LOBYTE(v55) = -1;
    LOBYTE(v56) = -1;
  }
  else
  {
    *(_DWORD *)&v109[4] = *(void *)(v4 + 8);
    unint64_t v53 = *(void *)(v4 + 16);
    unint64_t v54 = v53 >> 8;
    unint64_t v55 = v53 >> 16;
    unint64_t v56 = v53 >> 24;
  }
  v109[8] = v53;
  v109[9] = v54;
  LOBYTE(v110) = v55;
  BYTE1(v110) = v56;
  WORD1(v110) = v40;
  if (*(_DWORD *)(v4 + 64) == 1)
  {
    unsigned int v57 = HIBYTE(v52);
    if ((*(_DWORD *)(v4 + 68) & 8) != 0) {
      LOBYTE(v57) = BYTE1(v51);
    }
    *(unsigned char *)(v4 + 93) = v57;
  }
  uint64_t v58 = sub_2099DE05C((void *)v4, 46);
  *(void *)(v4 + 576) = v58;
  ++*(void *)(v4 + 624);
  _OWORD *v58 = 0u;
  v58[1] = 0u;
  *(_OWORD *)((char *)v58 + 30) = 0u;
  **(_DWORD **)(v4 + 576) = 33639248;
  uint64_t v59 = *(void *)(v4 + 576);
  *(unsigned char *)(v59 + 4) = v46;
  *(unsigned char *)(v59 + 5) = 3;
  *(_WORD *)(*(void *)(v4 + 576) + 6) = v46;
  *(_WORD *)(*(void *)(v4 + 576) + 8) = *(_DWORD *)(v4 + 68);
  uint64_t v60 = *(void *)(v4 + 576);
  if ((*(_DWORD *)(v4 + 64) & 0xFFFFFFFE) == 2)
  {
    LOBYTE(v61) = 0;
    *(unsigned char *)(v60 + 10) = 99;
  }
  else
  {
    unsigned int v62 = *(_DWORD *)(v4 + 60);
    *(unsigned char *)(v60 + 10) = v62;
    unsigned int v61 = v62 >> 8;
  }
  *(unsigned char *)(v60 + 11) = v61;
  uint64_t v63 = *(void *)(v4 + 576);
  time_t v64 = archive_entry_mtime(*(void *)(v4 + 48));
  *(_DWORD *)(v63 + 12) = sub_2099DDFC0(v64);
  *(_WORD *)(*(void *)(v4 + 576) + 28) = v40;
  uint64_t v65 = *(void *)(v4 + 576);
  __int16 v66 = archive_entry_mode(*(void *)(v4 + 48));
  *(_WORD *)(v65 + 38) = 0;
  *(_WORD *)(v65 + 40) = v66;
  size_t v67 = sub_2099DE05C((void *)v4, v40);
  uint64_t v68 = *(uint64_t **)(v4 + 48);
  uint64_t v69 = (const char *)archive_entry_pathname(v68);
  size_t v70 = strlen(v69);
  LODWORD(v68) = archive_entry_filetype((uint64_t)v68);
  memcpy(v67, v69, v70);
  if (v68 == 0x4000 && v69[v70 - 1] != 47) {
    *((unsigned char *)v67 + v70) = 47;
  }
  memset(v104, 0, sizeof(v104));
  long long v103 = 0u;
  long long v102 = 0u;
  long long v101 = 0u;
  long long v100 = 0u;
  long long v99 = 0u;
  long long v98 = 0u;
  *(_OWORD *)&__src[2] = 0u;
  *(_WORD *)__src = 21589;
  int is_set = archive_entry_mtime_is_set((uint64_t)a2);
  char v72 = 4 * (archive_entry_atime_is_set((uint64_t)a2) != 0);
  if (is_set) {
    char v73 = v72 + 5;
  }
  else {
    char v73 = v72 + 1;
  }
  *(_WORD *)&__src[2] = (v73 + 4 * (archive_entry_ctime_is_set((uint64_t)a2) != 0));
  BOOL v74 = archive_entry_mtime_is_set((uint64_t)a2) != 0;
  char v75 = v74 | (2 * (archive_entry_atime_is_set((uint64_t)a2) != 0));
  __src[4] = v75 | (4 * (archive_entry_ctime_is_set((uint64_t)a2) != 0));
  if (archive_entry_mtime_is_set((uint64_t)a2))
  {
    *(_DWORD *)&__src[5] = archive_entry_mtime((uint64_t)a2);
    signed int v76 = &__src[9];
  }
  else
  {
    signed int v76 = &__src[5];
  }
  if (archive_entry_atime_is_set((uint64_t)a2))
  {
    *(_DWORD *)signed int v76 = archive_entry_atime((uint64_t)a2);
    v76 += 4;
  }
  if (archive_entry_ctime_is_set((uint64_t)a2))
  {
    *(_DWORD *)signed int v76 = archive_entry_ctime((uint64_t)a2);
    v76 += 4;
  }
  *(_DWORD *)signed int v76 = 751733;
  *((_WORD *)v76 + 2) = 1025;
  *(_DWORD *)(v76 + 6) = archive_entry_uid((uint64_t)a2);
  v76[10] = 4;
  *(_DWORD *)(v76 + 11) = archive_entry_gid((uint64_t)a2);
  uint64_t v77 = v76 + 15;
  if ((*(unsigned char *)(v4 + 68) & 1) != 0 && (*(_DWORD *)(v4 + 64) & 0xFFFFFFFE) == 2)
  {
    *(void *)uint64_t v77 = 0x4541000100079901;
    if (archive_entry_size_is_set(*(void *)(v4 + 48)) && archive_entry_size(*(void *)(v4 + 48)) <= 19)
    {
      int v78 = 2;
      *(_WORD *)(v76 + 19) = 2;
    }
    else
    {
      int v78 = 1;
    }
    *(_DWORD *)(v4 + 96) = v78;
    if (*(_DWORD *)(v4 + 64) == 2) {
      char v79 = 1;
    }
    else {
      char v79 = 3;
    }
    v76[23] = v79;
    *((_WORD *)v76 + 12) = *(_DWORD *)(v4 + 60);
    uint64_t v77 = v76 + 26;
  }
  *(void *)(v4 + 584) = *(void *)(v4 + 616);
  uint64_t v80 = sub_2099DE05C((void *)v4, v77 - __src);
  memcpy(v80, __src, v77 - __src);
  if (*(_DWORD *)(v4 + 72))
  {
    *(_DWORD *)uint64_t v77 = 1048577;
    *(void *)(v77 + 4) = *(void *)(v4 + 16);
    *(void *)(v77 + 12) = *(void *)(v4 + 8);
    *((_WORD *)v77 + 1) = 16;
    v77 += 20;
  }
  if ((*(unsigned char *)(v4 + 672) & 4) != 0)
  {
    *(_DWORD *)uint64_t v77 = 27768;
    v77[4] = 7;
    *(_WORD *)(v77 + 5) = v46 | 0x300;
    *(_WORD *)(v77 + 7) = 0;
    __int16 v81 = archive_entry_mode(*(void *)(v4 + 48));
    *(_WORD *)(v77 + 9) = 0;
    *(_WORD *)(v77 + 11) = v81;
    *((_WORD *)v77 + 1) = 9;
    v77 += 13;
  }
  uint64_t v82 = v77 - __src;
  WORD2(v110) = v77 - __src;
  if (sub_2099C9728(a1, (uint64_t)&v105, 30)) {
    return 4294967266;
  }
  *(void *)(v4 + 632) += 30;
  uint64_t v84 = *(uint64_t **)(v4 + 48);
  uint64_t v85 = (const char *)archive_entry_pathname(v84);
  int v86 = archive_entry_filetype((uint64_t)v84);
  if (!v85) {
    return 4294967266;
  }
  int v87 = v86;
  size_t v88 = strlen(v85);
  if (sub_2099C9728(a1, (uint64_t)v85, v88)) {
    return 4294967266;
  }
  size_t v89 = strlen(v85);
  int v90 = v89;
  if (v87 == 0x4000)
  {
    uint64_t v91 = v96;
    if (v85[v89 - 1] != 47)
    {
      if (sub_2099C9728(a1, (uint64_t)"/", 1)) {
        return 4294967266;
      }
      ++v90;
    }
  }
  else
  {
    uint64_t v91 = v96;
  }
  if (v90 < 1) {
    return 4294967266;
  }
  *(void *)(v4 + 632) += v90;
  if (sub_2099C9728(a1, (uint64_t)__src, v82)) {
    return 4294967266;
  }
  *(void *)(v4 + 632) += v82;
  if (v91)
  {
    if (sub_2099C9728(a1, v91, v43)) {
      return 4294967266;
    }
    *(int64x2_t *)(v4 + 24) = vaddq_s64(*(int64x2_t *)(v4 + 24), vdupq_n_s64(v43));
    *(void *)(v4 + 632) += v43;
  }
  if (*(_DWORD *)(v4 + 60) == 8)
  {
    *(void *)(v4 + 752) = 0;
    *(void *)(v4 + 744) = 0;
    *(void *)(v4 + 760) = 0;
    *(void *)(v4 + 704) = *(void *)(v4 + 800);
    *(_DWORD *)(v4 + 712) = *(void *)(v4 + 792);
    if (deflateInit2_((z_streamp)(v4 + 680), *(_DWORD *)(v4 + 660), 8, -15, 8, 0, "1.2.12", 112))
    {
      uint64_t v23 = "Can't init deflate compressor";
      goto LABEL_34;
    }
  }
  return v24;
}

uint64_t sub_2099DD080(uint64_t a1, Bytef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 264);
  if (*(void *)(v8 + 40) >= a3) {
    uint64_t v9 = a3;
  }
  else {
    uint64_t v9 = *(void *)(v8 + 40);
  }
  *(void *)(v8 + 32) += v9;
  if (!v9) {
    return v9;
  }
  if (*(unsigned char *)(v8 + 68))
  {
    int v12 = *(_DWORD *)(v8 + 64);
    if ((v12 - 2) >= 2)
    {
      if (v12 != 1 || *(unsigned char *)(v8 + 92)) {
        goto LABEL_20;
      }
      uint64_t v44 = sub_2099B5DD0(a1);
      if (v44)
      {
        int v45 = (Bytef *)v44;
        if (!sub_2099DEB28(&dataLength, 0xBuLL))
        {
          size_t v46 = strlen((const char *)v45);
          *(void *)(v8 + 80) = 0x2345678912345678;
          *(_DWORD *)(v8 + 88) = 878082192;
          if (v46)
          {
            size_t v47 = v46;
            do
            {
              Bytef v48 = *v45++;
              sub_2099C2294((int *)(v8 + 80), v48);
              --v47;
            }
            while (v47);
          }
          uint64_t v49 = 0;
          char v56 = *(unsigned char *)(v8 + 93);
          do
          {
            Bytef v50 = *((unsigned char *)&dataLength + v49);
            salt[v49] = v50 ^ ((unsigned __int16)(((*(_WORD *)(v8 + 88) | 2) ^ 1) * (*(_WORD *)(v8 + 88) | 2)) >> 8);
            sub_2099C2294((int *)(v8 + 80), v50);
            ++v49;
          }
          while (v49 != 12);
          int v39 = sub_2099C9728(a1, (uint64_t)salt, 12);
          if (v39) {
            return v39;
          }
          *(void *)(v8 + 632) += 12;
          *(void *)(v8 + 24) += 12;
          *(unsigned char *)(v8 + 92) = 1;
          goto LABEL_20;
        }
        goto LABEL_51;
      }
    }
    else
    {
      if (*(unsigned char *)(v8 + 184)) {
        goto LABEL_20;
      }
      uint64_t v13 = sub_2099B5DD0(a1);
      if (v13)
      {
        uint64_t v19 = v13;
        if (*(_DWORD *)(v8 + 64) == 2) {
          size_t v20 = 16;
        }
        else {
          size_t v20 = 32;
        }
        if (*(_DWORD *)(v8 + 64) == 2) {
          size_t v21 = 8;
        }
        else {
          size_t v21 = 16;
        }
        if (!sub_2099DEB28(salt, v21))
        {
          size_t v27 = strlen(v19);
          off_26BD73608(v19, v27, salt, v21, 0x3E8u, (uint8_t *)&dataLength, (2 * v20) | 2);
          if (((unsigned int (*)(uint64_t, const void *, size_t))off_26BD73628[0])(v8 + 104, &dataLength, v20))
          {
            uint64_t v28 = "Decryption is unsupported due to lack of crypto library";
LABEL_53:
            archive_set_error((_DWORD *)a1, -1, v28, v14, v15, v16, v17, v18, v53);
            return -25;
          }
          if (off_26BD736D0((CCHmacContext *)(v8 + 188), (char *)&dataLength + v20, v20))
          {
            off_26BD73638(v8 + 104);
            uint64_t v28 = "Failed to initialize HMAC-SHA1";
            goto LABEL_53;
          }
          salt[v21] = *((unsigned char *)&dataLength + 2 * v20);
          salt[v21 | 1] = *((unsigned char *)&dataLength + ((2 * v20) | 1));
          uint64_t v51 = v21 | 2;
          int v39 = sub_2099C9728(a1, (uint64_t)salt, v51);
          if (v39) {
            return v39;
          }
          *(void *)(v8 + 632) += v51;
          *(void *)(v8 + 24) += v51;
          *(unsigned char *)(v8 + 572) = 1;
          *(unsigned char *)(v8 + 184) = 1;
          goto LABEL_20;
        }
LABEL_51:
        archive_set_error((_DWORD *)a1, -1, "Can't generate random number for encryption", v22, v23, v24, v25, v26, v53);
        return -30;
      }
    }
    uint64_t v28 = "Encryption needs passphrase";
    goto LABEL_53;
  }
LABEL_20:
  int v29 = *(_DWORD *)(v8 + 60);
  if (v29 == 8)
  {
    unint64_t v54 = a2;
    *(void *)(v8 + 680) = a2;
    *(_DWORD *)(v8 + 688) = v9;
    uint64_t v41 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t *))off_26BD73630[0];
    uint64_t v42 = off_26BD736D8;
    while (deflate((z_streamp)(v8 + 680), 0) != -2)
    {
      if (!*(_DWORD *)(v8 + 712))
      {
        if (*(unsigned char *)(v8 + 92))
        {
          sub_2099DE13C(v8 + 80, *(Bytef **)(v8 + 800), *(void *)(v8 + 792), *(unsigned char **)(v8 + 800), *(void *)(v8 + 792));
        }
        else if (*(unsigned char *)(v8 + 184))
        {
          size_t dataLength = *(void *)(v8 + 792);
          if ((v41(v8 + 104, *(void *)(v8 + 800), dataLength, *(void *)(v8 + 800), &dataLength) & 0x80000000) != 0)
          {
LABEL_56:
            archive_set_error((_DWORD *)a1, -1, "Failed to encrypt file", v34, v35, v36, v37, v38, v53);
            return -25;
          }
          v42((CCHmacContext *)(v8 + 188), *(const void **)(v8 + 800), *(void *)(v8 + 792));
        }
        int v39 = sub_2099C9728(a1, *(void *)(v8 + 800), *(void *)(v8 + 792));
        if (v39) {
          return v39;
        }
        uint64_t v43 = *(void *)(v8 + 792);
        *(void *)(v8 + 24) += v43;
        *(void *)(v8 + 632) += v43;
        *(void *)(v8 + 704) = *(void *)(v8 + 800);
        *(_DWORD *)(v8 + 712) = v43;
      }
      if (!*(_DWORD *)(v8 + 688)) {
        goto LABEL_44;
      }
    }
    return -30;
  }
  if (v29)
  {
    archive_set_error((_DWORD *)a1, -1, "Invalid ZIP compression type", a4, a5, a6, a7, a8, v53);
    return -30;
  }
  unint64_t v54 = a2;
  if (*(unsigned char *)(v8 + 92) || *(unsigned char *)(v8 + 184))
  {
    if (v9 >= 1)
    {
      uint64_t v30 = &a2[v9];
      uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t *))off_26BD73630[0];
      int v32 = off_26BD736D8;
      do
      {
        size_t dataLength = 0;
        if (*(unsigned char *)(v8 + 92))
        {
          size_t v33 = sub_2099DE13C(v8 + 80, a2, v30 - a2, *(unsigned char **)(v8 + 800), *(void *)(v8 + 792));
          size_t dataLength = v33;
        }
        else
        {
          size_t dataLength = *(void *)(v8 + 792);
          if ((v31(v8 + 104, (uint64_t)a2, v30 - a2, *(void *)(v8 + 800), &dataLength) & 0x80000000) != 0) {
            goto LABEL_56;
          }
          v32((CCHmacContext *)(v8 + 188), *(const void **)(v8 + 800), dataLength);
          size_t v33 = dataLength;
        }
        int v39 = sub_2099C9728(a1, *(void *)(v8 + 800), v33);
        if (v39) {
          return v39;
        }
        size_t v40 = dataLength;
        *(void *)(v8 + 24) += dataLength;
        *(void *)(v8 + 632) += v40;
        a2 += v40;
      }
      while (a2 < v30);
    }
  }
  else
  {
    int v39 = sub_2099C9728(a1, (uint64_t)a2, v9);
    if (v39) {
      return v39;
    }
    *(void *)(v8 + 632) += v9;
    *(void *)(v8 + 24) += v9;
  }
LABEL_44:
  *(void *)(v8 + 40) -= v9;
  if (!*(unsigned char *)(v8 + 184) || *(_DWORD *)(v8 + 96) != 2) {
    *(_DWORD *)(v8 + 56) = (*(uint64_t (**)(void, Bytef *, void))(v8 + 592))(*(unsigned int *)(v8 + 56), v54, v9);
  }
  return v9;
}

uint64_t sub_2099DD630(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(uint64_t **)(a1 + 264);
  if (*((_DWORD *)v2 + 15) == 8)
  {
    if (deflate((z_streamp)(v2 + 85), 4) != -2)
    {
      uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t *))off_26BD73630[0];
      uint64_t v4 = off_26BD736D8;
      while (1)
      {
        uint64_t v5 = *((unsigned int *)v2 + 178);
        uint64_t v6 = v2[99] - v5;
        if (*((unsigned char *)v2 + 92))
        {
          sub_2099DE13C((uint64_t)(v2 + 10), (Bytef *)v2[100], v2[99] - v5, (unsigned char *)v2[100], v2[99] - v5);
        }
        else if (*((unsigned char *)v2 + 184))
        {
          *(void *)__src = v2[99] - v5;
          if ((v3((uint64_t)(v2 + 13), v2[100], v6, v2[100], (unint64_t *)__src) & 0x80000000) != 0)
          {
            archive_set_error((_DWORD *)a1, -1, "Failed to encrypt file", v7, v8, v9, v10, v11, (char *)v35);
            return 4294967271;
          }
          v4((CCHmacContext *)((char *)v2 + 188), (const void *)v2[100], v6);
        }
        uint64_t result = sub_2099C9728(a1, v2[100], v6);
        if (result) {
          return result;
        }
        v2[3] += v6;
        v2[79] += v6;
        v2[88] = v2[100];
        if (*((_DWORD *)v2 + 178))
        {
          deflateEnd((z_streamp)(v2 + 85));
          goto LABEL_14;
        }
        *((_DWORD *)v2 + 178) = v2[99];
        if (deflate((z_streamp)(v2 + 85), 4) == -2) {
          return 4294967266;
        }
      }
    }
    return 4294967266;
  }
LABEL_14:
  if (*((unsigned char *)v2 + 572))
  {
    uint64_t v35 = 20;
    off_26BD736E0((CCHmacContext *)((char *)v2 + 188), __src, &v35);
    uint64_t result = sub_2099C9728(a1, (uint64_t)__src, 10);
    if (result) {
      return result;
    }
    v2[3] += 10;
    v2[79] += 10;
  }
  if ((*((unsigned char *)v2 + 68) & 8) != 0)
  {
    *(_DWORD *)__src = 134695760;
    if (*((unsigned char *)v2 + 184) && *((_DWORD *)v2 + 24) == 2) {
      *(_DWORD *)&__src[4] = 0;
    }
    else {
      *(_DWORD *)&__src[4] = *((_DWORD *)v2 + 14);
    }
    int v13 = *((_DWORD *)v2 + 18);
    uint64_t v14 = v2[3];
    *(_DWORD *)&__src[8] = v14;
    if (v13)
    {
      LOBYTE(v37) = BYTE4(v14);
      HIBYTE(v37) = BYTE5(v14);
      char v38 = BYTE6(v14);
      char v39 = HIBYTE(v14);
      unint64_t v15 = v2[4];
      __int16 v40 = v15;
      char v41 = BYTE2(v15);
      char v42 = BYTE3(v15);
      char v43 = BYTE4(v15);
      char v44 = BYTE5(v15);
      char v45 = BYTE6(v15);
      unint64_t v16 = HIBYTE(v15);
      uint64_t v17 = 24;
      uint64_t v18 = 23;
    }
    else
    {
      unint64_t v19 = v2[4];
      __int16 v37 = v19;
      char v38 = BYTE2(v19);
      unint64_t v16 = v19 >> 24;
      uint64_t v17 = 16;
      uint64_t v18 = 15;
    }
    __src[v18] = v16;
    int v20 = sub_2099C9728(a1, (uint64_t)__src, v17);
    v2[79] += v17;
    if (v20) {
      return 4294967266;
    }
  }
  uint64_t v21 = v2[3];
  uint64_t v22 = v2[4];
  if (v21 <= 0xFFFFFFFFLL)
  {
    if (v22 >= 0x100000000)
    {
      *(_DWORD *)__src = 1;
LABEL_31:
      *(void *)&__src[4] = v22;
      uint64_t v23 = (uint64_t *)&v37;
      goto LABEL_32;
    }
    if (*v2 < 0x100000000) {
      goto LABEL_39;
    }
  }
  *(_DWORD *)__src = 1;
  uint64_t v23 = (uint64_t *)&__src[4];
  if (v22 >= 0xFFFFFFFFLL) {
    goto LABEL_31;
  }
LABEL_32:
  if (v21 >= 0xFFFFFFFFLL) {
    *v23++ = v21;
  }
  if (*v2 >= 0xFFFFFFFFLL) {
    *v23++ = *v2;
  }
  *(_WORD *)&__src[2] = (_WORD)v23 - (unsigned __int16)&__src[4];
  size_t v24 = (char *)v23 - __src;
  uint64_t v25 = sub_2099DE05C(v2, (char *)v23 - __src);
  if (!v25)
  {
    archive_set_error((_DWORD *)a1, 12, "Can't allocate zip data", v26, v27, v28, v29, v30, (char *)v35);
    return 4294967266;
  }
  memcpy(v25, __src, v24);
  uint64_t v31 = v2[72];
  if (*(unsigned __int16 *)(v31 + 6) <= 0x2Cu) {
    *(_WORD *)(v31 + 6) = 45;
  }
LABEL_39:
  if (*((unsigned char *)v2 + 184) && *((_DWORD *)v2 + 24) == 2) {
    *(_DWORD *)(v2[72] + 16) = 0;
  }
  else {
    *(_DWORD *)(v2[72] + 16) = *((_DWORD *)v2 + 14);
  }
  uint64_t result = 0;
  uint64_t v32 = v2[3];
  if (v32 >= 0xFFFFFFFFLL) {
    LODWORD(v32) = -1;
  }
  *(_DWORD *)(v2[72] + 20) = v32;
  uint64_t v33 = v2[4];
  if (v33 >= 0xFFFFFFFFLL) {
    LODWORD(v33) = -1;
  }
  *(_DWORD *)(v2[72] + 24) = v33;
  *(_WORD *)(v2[72] + 30) = *((_DWORD *)v2 + 154) - *((_DWORD *)v2 + 146);
  uint64_t v34 = *v2;
  if (*v2 >= 0xFFFFFFFFLL) {
    LODWORD(v34) = -1;
  }
  *(_DWORD *)(v2[72] + 42) = v34;
  return result;
}

uint64_t sub_2099DDA9C(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 264);
  uint64_t v3 = *(void *)(v2 + 632);
  uint64_t v4 = *(void **)(v2 + 600);
  uint64_t v5 = v3;
  if (v4)
  {
    while (!sub_2099C9728(a1, v4[2], v4[3] - v4[2]))
    {
      uint64_t v5 = v4[3] - v4[2] + *(void *)(v2 + 632);
      *(void *)(v2 + 632) = v5;
      uint64_t v4 = (void *)*v4;
      if (!v4) {
        goto LABEL_4;
      }
    }
    return 4294967266;
  }
LABEL_4:
  uint64_t v6 = v5 - v3;
  unint64_t v7 = *(void *)(v2 + 624);
  BOOL v9 = v3 <= 0xFFFFFFFFLL && v6 <= 0xFFFFFFFFLL && v7 >> 16 == 0;
  if (!v9 || (*(unsigned char *)(v2 + 672) & 2) != 0)
  {
    *(void *)&v13[16] = 0;
    *(_DWORD *)int v13 = 101075792;
    strcpy(&v13[4], ",");
    *(_WORD *)&v13[6] = 0;
    *(void *)&v13[8] = 0x2D002D00000000;
    *(void *)&v13[24] = v7;
    *(void *)&v13[32] = v7;
    *(void *)&v13[40] = v5 - v3;
    *(void *)&v13[48] = v3;
    if (sub_2099C9728(a1, (uint64_t)v13, 56)) {
      return 4294967266;
    }
    *(void *)(v2 + 632) += 56;
    *(void *)int v13 = 117853008;
    *(void *)&v13[8] = v5;
    *(_DWORD *)&v13[16] = 1;
    if (sub_2099C9728(a1, (uint64_t)v13, 20)) {
      return 4294967266;
    }
    *(void *)(v2 + 632) += 20;
    unint64_t v7 = *(void *)(v2 + 624);
  }
  memset(&v13[4], 0, 60);
  *(_DWORD *)int v13 = 101010256;
  if (v7 >= 0xFFFF) {
    LOWORD(v7) = -1;
  }
  *(_WORD *)&v13[8] = v7;
  *(_WORD *)&v13[10] = v7;
  int v10 = -1;
  if (v6 >= 0xFFFFFFFFLL) {
    int v11 = -1;
  }
  else {
    int v11 = v5 - v3;
  }
  *(_DWORD *)&v13[12] = v11;
  if (v3 < 0xFFFFFFFFLL) {
    int v10 = v3;
  }
  *(_DWORD *)&v13[16] = v10;
  uint64_t result = sub_2099C9728(a1, (uint64_t)v13, 22);
  if (!result)
  {
    *(void *)(v2 + 632) += 22;
    return result;
  }
  return 4294967266;
}

uint64_t sub_2099DDDAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 264);
  while (1)
  {
    uint64_t v3 = *(void ***)(v2 + 600);
    if (!v3) {
      break;
    }
    *(void *)(v2 + 600) = *v3;
    free(v3[2]);
    free(v3);
  }
  free(*(void **)(v2 + 800));
  archive_entry_free(*(void ***)(v2 + 48));
  if (*(unsigned char *)(v2 + 184)) {
    off_26BD73638(v2 + 104);
  }
  if (*(unsigned char *)(v2 + 572)) {
    off_26BD736E8((_OWORD *)(v2 + 188));
  }
  free((void *)v2);
  *(void *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_2099DDE54(int a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  memset(&v5.ctx[8], 0, 352);
  if (a1 == 2) {
    size_t v1 = 16;
  }
  else {
    size_t v1 = 32;
  }
  if (a1 == 2) {
    size_t v2 = 8;
  }
  else {
    size_t v2 = 16;
  }
  memset(&v5, 0, 32);
  if (sub_2099DEB28(salt, v2)) {
    return 0;
  }
  if (off_26BD73608("p", 1uLL, salt, v2, 0x3E8u, derivedKey, (2 * v1) | 2)) {
    return 0;
  }
  if (((unsigned int (*)(uint64_t, const void *, size_t))off_26BD73628[0])((uint64_t)v6, derivedKey, v1)) {
    return 0;
  }
  int v3 = off_26BD736D0(&v5, &derivedKey[v1], v1);
  off_26BD73638((uint64_t)v6);
  if (v3) {
    return 0;
  }
  off_26BD736E8(&v5);
  return 1;
}

uint64_t sub_2099DDFB8()
{
  return 0;
}

uint64_t sub_2099DDFC0(time_t a1)
{
  time_t v5 = a1;
  memset(&v4, 0, sizeof(v4));
  size_t v1 = localtime_r(&v5, &v4);
  int tm_year = v1->tm_year;
  if (tm_year < 80) {
    return 2162688;
  }
  if (tm_year <= 0xCF) {
    return (((v1->tm_hour & 0x1F) << 11) | (((32 * LOWORD(v1->tm_mon) + 32) & 0x1E0 | (tm_year << 9) | v1->tm_mday & 0x1F) << 16) | (32 * (v1->tm_min & 0x3F)) | (v1->tm_sec >> 1) & 0x1F)
  }
         + 1610612736;
  return 4288659325;
}

void *sub_2099DE05C(void *a1, uint64_t a2)
{
  if (!a1[75] || (v4 = (void *)a1[76], uint64_t result = (void *)v4[3], (unint64_t)result + a2 > v4[2] + v4[1]))
  {
    uint64_t result = malloc_type_calloc(1uLL, 0x20uLL, 0x1030040322C5439uLL);
    if (!result) {
      return result;
    }
    tm v4 = result;
    result[1] = 0x10000;
    uint64_t result = malloc_type_malloc(0x10000uLL, 0xA98E8E36uLL);
    v4[2] = result;
    if (!result)
    {
      free(v4);
      return 0;
    }
    v4[3] = result;
    uint64_t v6 = (void **)(a1 + 76);
    if (a1[75])
    {
      unint64_t v7 = *v6;
    }
    else
    {
      unint64_t v7 = a1 + 76;
      uint64_t v6 = (void **)(a1 + 75);
    }
    *unint64_t v7 = v4;
    char *v6 = v4;
  }
  v4[3] = (char *)result + a2;
  a1[77] += a2;
  return result;
}

unint64_t sub_2099DE13C(uint64_t a1, Bytef *a2, unint64_t a3, unsigned char *a4, unint64_t a5)
{
  if (a3 >= a5) {
    unint64_t v5 = a5;
  }
  else {
    unint64_t v5 = a3;
  }
  if (v5)
  {
    uint64_t v9 = v5;
    do
    {
      Bytef v10 = *a2++;
      *a4++ = v10 ^ ((unsigned __int16)(((*(_WORD *)(a1 + 8) | 2) ^ 1) * (*(_WORD *)(a1 + 8) | 2)) >> 8);
      sub_2099C2294((int *)a1, v10);
      --v9;
    }
    while (v9);
  }
  return v5;
}

uint64_t archive_write_set_format_cpio_pwb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_2099DE1C0(a1, 65543, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_2099DE1C0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_20997182C((int *)a1, -1329217314, 1, "archive_write_set_format_cpio_binary", a5, a6, a7, a8);
  if (result != -30)
  {
    int v11 = *(void (**)(uint64_t))(a1 + 328);
    if (v11) {
      v11(a1);
    }
    int v12 = malloc_type_calloc(1uLL, 0x40uLL, 0x102004099191E4EuLL);
    if (v12)
    {
      *(void *)(a1 + 264) = v12;
      *(void *)(a1 + 272) = "cpio";
      *(void *)(a1 + 288) = sub_2099DE320;
      *(void *)(a1 + 304) = sub_2099DE3C8;
      *(void *)(a1 + 312) = sub_2099DE4CC;
      *(void *)(a1 + 296) = sub_2099DE518;
      *(void *)(a1 + 320) = sub_2099DE524;
      *(void *)(a1 + 328) = sub_2099DE590;
      *(_DWORD *)(a1 + 16) = a2;
      if (a2 == 65538)
      {
        uint64_t result = 0;
        uint64_t v18 = "7th Edition cpio";
        goto LABEL_10;
      }
      if (a2 == 65543)
      {
        uint64_t result = 0;
        uint64_t v18 = "PWB cpio";
LABEL_10:
        *(void *)(a1 + 24) = v18;
        return result;
      }
      unint64_t v19 = "binary format must be 'pwb' or 'bin'";
      int v20 = (_DWORD *)a1;
      int v21 = 22;
    }
    else
    {
      unint64_t v19 = "Can't allocate cpio data";
      int v20 = (_DWORD *)a1;
      int v21 = 12;
    }
    archive_set_error(v20, v21, v19, v13, v14, v15, v16, v17, v22);
    return 4294967266;
  }
  return result;
}

uint64_t archive_write_set_format_cpio_bin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_2099DE1C0(a1, 65538, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_2099DE320(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = *(void *)(a1 + 264);
  if (strcmp(__s1, "hdrcharset")) {
    return 4294967276;
  }
  if (a3 && *a3)
  {
    int v12 = sub_2099C4288(a1, a3, 0);
    *(void *)(v5 + 40) = v12;
    if (v12) {
      return 0;
    }
    else {
      return 4294967266;
    }
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, *(char **)(a1 + 272));
    return 4294967271;
  }
}

uint64_t sub_2099DE3C8(_DWORD *a1, uint64_t *a2)
{
  if (archive_entry_filetype((uint64_t)a2) || archive_entry_hardlink((uint64_t)a2))
  {
    int v12 = 0;
    uint64_t v13 = 0;
    uint64_t v9 = sub_2099ACCEC((uint64_t)a1);
    if (sub_20997DF08(a2, &v13, &v12, v9) && *__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Pathname", v4, v5, v6, v7, v8, v12);
      return 4294967266;
    }
    if (v12 && v13 && *v13)
    {
      if (archive_entry_size_is_set((uint64_t)a2)
        && (archive_entry_size((uint64_t)a2) & 0x8000000000000000) == 0)
      {
        return sub_2099DE5CC((uint64_t)a1, a2);
      }
      int v11 = "Size required";
    }
    else
    {
      int v11 = "Pathname required";
    }
  }
  else
  {
    int v11 = "Filetype required";
  }
  archive_set_error(a1, -1, v11, v4, v5, v6, v7, v8, v12);
  return 4294967271;
}

uint64_t sub_2099DE4CC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = *v3;
  }
  LODWORD(result) = sub_2099C9728(a1, a2, v4);
  *v3 -= v4;
  if ((int)result >= 0) {
    return v4;
  }
  else {
    return (int)result;
  }
}

uint64_t sub_2099DE518(uint64_t a1)
{
  return sub_2099C978C((void *)a1, **(void **)(a1 + 264));
}

uint64_t sub_2099DE524(uint64_t a1)
{
  size_t v2 = (uint64_t *)archive_entry_new2(0);
  archive_entry_set_nlink((uint64_t)v2, 1);
  archive_entry_set_size((uint64_t)v2, 0);
  archive_entry_set_pathname((uint64_t)v2, "TRAILER!!!");
  uint64_t v3 = sub_2099DE5CC(a1, v2);
  archive_entry_free((void **)v2);
  return v3;
}

uint64_t sub_2099DE590(uint64_t a1)
{
  size_t v2 = *(void ***)(a1 + 264);
  free(v2[2]);
  free(v2);
  *(void *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_2099DE5CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v59 = 0;
  __s = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  memset(v58, 0, 10);
  uint64_t v55 = 0;
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = sub_2099ACCEC(a1);
  if (sub_20997DF08(a2, &v59, &v55, v5))
  {
    if (*__error() == 12)
    {
      int v11 = "Can't allocate memory for Pathname";
LABEL_34:
      uint64_t v31 = (_DWORD *)a1;
      int v32 = 12;
      goto LABEL_35;
    }
    uint64_t v13 = (char *)archive_entry_pathname(a2);
    sub_2099C42E4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v14, v15, v16, v17, v18, v13);
    uint64_t v12 = 4294967276;
  }
  else
  {
    uint64_t v12 = 0;
  }
  int v19 = v55;
  LOWORD(v56) = 29127;
  WORD1(v56) = archive_entry_dev(a2);
  uint64_t v20 = archive_entry_ino64((uint64_t)a2);
  if (v20)
  {
    uint64_t v21 = v20;
    if (archive_entry_nlink((uint64_t)a2) >= 2)
    {
      unint64_t v24 = *(void *)(v4 + 32);
      if (v24)
      {
        uint64_t v25 = (_DWORD *)(*(void *)(v4 + 16) + 8);
        uint64_t v26 = *(void *)(v4 + 32);
        while (*((void *)v25 - 1) != v21)
        {
          v25 += 4;
          if (!--v26) {
            goto LABEL_15;
          }
        }
        LODWORD(v23) = *v25;
        if ((*v25 & 0x80000000) != 0) {
          goto LABEL_33;
        }
      }
      else
      {
LABEL_15:
        uint64_t v23 = *(void *)(v4 + 8) + 1;
        *(void *)(v4 + 8) = v23;
        unint64_t v27 = *(void *)(v4 + 24);
        if (v27 <= v24)
        {
          if (v27 >= 0x200) {
            uint64_t v29 = 2 * v27;
          }
          else {
            uint64_t v29 = 512;
          }
          uint64_t v28 = (char *)malloc_type_realloc(*(void **)(v4 + 16), 16 * v29, 0x1000040D9A13B51uLL);
          if (!v28) {
            goto LABEL_33;
          }
          *(void *)(v4 + 16) = v28;
          *(void *)(v4 + 24) = v29;
          unint64_t v24 = *(void *)(v4 + 32);
        }
        else
        {
          uint64_t v28 = *(char **)(v4 + 16);
        }
        uint64_t v30 = &v28[16 * v24];
        *(void *)uint64_t v30 = v21;
        *((_DWORD *)v30 + 2) = v23;
        *(void *)(v4 + 32) = v24 + 1;
        if ((v23 & 0x80000000) != 0)
        {
LABEL_33:
          int v11 = "No memory for ino translation table";
          goto LABEL_34;
        }
      }
    }
    else
    {
      uint64_t v22 = *(void *)(v4 + 8);
      LODWORD(v23) = v22 + 1;
      *(void *)(v4 + 8) = v22 + 1;
      if (v22 + 1 < 0) {
        goto LABEL_33;
      }
    }
    if (v23 >= 0x8000)
    {
      int v11 = "Too many files for this cpio format";
      uint64_t v31 = (_DWORD *)a1;
      int v32 = 34;
LABEL_35:
      archive_set_error(v31, v32, v11, v6, v7, v8, v9, v10, v54);
LABEL_36:
      uint64_t v12 = 4294967266;
      goto LABEL_37;
    }
  }
  else
  {
    LOWORD(v23) = 0;
  }
  WORD2(v56) = v23;
  HIWORD(v56) = archive_entry_mode((uint64_t)a2);
  int v33 = HIWORD(v56) & 0xF000;
  if (v33 == 49152 || v33 == 4096)
  {
    int v11 = "sockets and fifos cannot be represented in the binary cpio formats";
LABEL_28:
    uint64_t v31 = (_DWORD *)a1;
    int v32 = 22;
    goto LABEL_35;
  }
  if (v33 == 40960 && *(_DWORD *)(a1 + 16) == 65543)
  {
    int v11 = "symbolic links cannot be represented in the PWB cpio format";
    goto LABEL_28;
  }
  int v35 = v19 + 1;
  LOWORD(v57) = archive_entry_uid((uint64_t)a2);
  WORD1(v57) = archive_entry_gid((uint64_t)a2);
  WORD2(v57) = archive_entry_nlink((uint64_t)a2);
  if (archive_entry_filetype((uint64_t)a2) == 24576
    || archive_entry_filetype((uint64_t)a2) == 0x2000)
  {
    __int16 v36 = archive_entry_rdev(a2);
  }
  else
  {
    __int16 v36 = 0;
  }
  HIWORD(v57) = v36;
  HIDWORD(v37) = archive_entry_mtime((uint64_t)a2);
  LODWORD(v37) = HIDWORD(v37);
  LODWORD(v58[0]) = v37 >> 16;
  WORD2(v58[0]) = v19 + 1;
  if (archive_entry_filetype((uint64_t)a2) != 0x8000) {
    archive_entry_set_size((uint64_t)a2, 0);
  }
  if (sub_20997E104((uint64_t)a2, &__s, &v55, v5))
  {
    if (*__error() == 12)
    {
      int v11 = "Can't allocate memory for Linkname";
      goto LABEL_34;
    }
    char v38 = (char *)archive_entry_symlink((uint64_t)a2);
    sub_2099C42E4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v39, v40, v41, v42, v43, v38);
    uint64_t v12 = 4294967276;
  }
  if (!v55 || !__s || !*__s)
  {
    if (*(_DWORD *)(a1 + 16) == 65543 && archive_entry_size((uint64_t)a2) >= 0x1000000)
    {
      uint64_t v49 = "File is too large for PWB binary cpio format.";
    }
    else
    {
      if (archive_entry_size((uint64_t)a2) < 0x80000000)
      {
        int v50 = archive_entry_size((uint64_t)a2);
        goto LABEL_61;
      }
      uint64_t v49 = "File is too large for binary cpio format.";
    }
    archive_set_error((_DWORD *)a1, 34, v49, v44, v45, v46, v47, v48, v54);
    uint64_t v12 = 4294967271;
    goto LABEL_37;
  }
  if (*(_DWORD *)(a1 + 16) == 65543)
  {
    int v11 = "symlinks are not supported by UNIX V6 or by PWB cpio";
    goto LABEL_28;
  }
  int v50 = strlen(__s);
LABEL_61:
  HIDWORD(v51) = v50;
  LODWORD(v51) = v50;
  *(_DWORD *)((char *)v58 + 6) = v51 >> 16;
  if (sub_2099C9728(a1, (uint64_t)&v56, 26)
    || sub_2099C9728(a1, v59, v35)
    || (v35 & 1) != 0 && sub_2099C978C((void *)a1, 1uLL))
  {
    goto LABEL_36;
  }
  uint64_t v52 = archive_entry_size((uint64_t)a2);
  *(void *)uint64_t v4 = (v52 & 1) + v52;
  if (__s)
  {
    if (*__s)
    {
      size_t v53 = strlen(__s);
      if (sub_2099C9728(a1, (uint64_t)__s, v53)
        || (strlen(__s) & 1) != 0 && sub_2099C978C((void *)a1, 1uLL))
      {
        goto LABEL_36;
      }
    }
  }
LABEL_37:
  archive_entry_free(0);
  return v12;
}

uint64_t archive_write_add_filter_by_name(_DWORD *a1, char *__s1)
{
  uint64_t v4 = 0;
  uint64_t v5 = "b64encode";
  while (strcmp(__s1, v5))
  {
    uint64_t v5 = (&off_26BD73E78)[v4 + 2];
    v4 += 2;
    if (v4 == 26)
    {
      archive_set_error(a1, 22, "No such filter '%s'", v6, v7, v8, v9, v10, __s1);
      a1[1] = 0x8000;
      return 4294967266;
    }
  }
  uint64_t v12 = (&off_26BD73E78)[v4 + 1];

  return ((uint64_t (*)(_DWORD *))v12)(a1);
}

uint64_t sub_2099DEB28(void *a1, size_t a2)
{
  return 0;
}

uint64_t archive_read_support_filter_lz4(int *a1)
{
  if (sub_20997D128("lz4"))
  {
    uint64_t result = sub_20997182C(a1, 14594245, 1, "archive_read_support_filter_lz4", v3, v4, v5, v6);
    if (result == -30) {
      return result;
    }
    uint64_t v22 = 0;
    sub_20998D674(a1, &v22, v8, v9, v10, v11, v12, v13);
    if (!v19)
    {
      *uint64_t v22 = 0;
      uint64_t v20 = v22;
      v22[1] = "lz4";
      v20[2] = sub_2099DEC28;
      v20[3] = sub_2099DECB8;
      v20[4] = 0;
      v20[5] = sub_2099DECF8;
      archive_set_error(a1, -1, "Using external lz4 program", v14, v15, v16, v17, v18, v21);
      return 4294967276;
    }
  }
  else
  {
    archive_set_error(a1, -1, "Filter not allow-listed in entitlements", v2, v3, v4, v5, v6, v21);
  }
  return 4294967266;
}

size_t sub_2099DEC28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = 0;
  size_t result = sub_20997360C(a2, 0xBuLL, &v9, a4, a5, a6, a7, a8);
  if (result)
  {
    if (*(_DWORD *)result == 407642370)
    {
      return 32;
    }
    else if (*(_DWORD *)result == 407708164 {
           && (*(unsigned char *)(result + 4) & 0xC2) == 0x40
    }
           && (*(unsigned char *)(result + 5) & 0xCF) == 0x40)
    {
      return 48;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2099DECB8(uint64_t a1)
{
  uint64_t result = sub_209994128(a1, "lz4 -d -q");
  *(_DWORD *)(a1 + 104) = 13;
  *(void *)(a1 + 96) = "lz4";
  return result;
}

uint64_t sub_2099DECF8()
{
  return 0;
}

uint64_t sub_2099DED00(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = **(void **)(a1 + 2472);
  if (strcmp(__s1, "hdrcharset")) {
    return 4294967276;
  }
  if (a3 && *a3)
  {
    uint64_t v12 = sub_2099756A4(a1, a3, 0);
    *(void *)(v5 + 20192) = v12;
    if (v12) {
      return 0;
    }
    else {
      return 4294967266;
    }
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "rar: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, v13);
    return 4294967271;
  }
}

uint64_t sub_2099DED9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)(a1 + 16) = 851968;
  if (!*(void *)(a1 + 24)) {
    *(void *)(a1 + 24) = "RAR";
  }
  uint64_t v10 = **(int ***)(a1 + 2472);
  uint64_t v11 = v10 + 5062;
  if (v10[5062] == -1) {
    *uint64_t v11 = 0;
  }
  uint64_t v12 = (unsigned char *)sub_2099738A4(a1, 7uLL, 0, a4, a5, a6, a7, a8);
  if (!v12) {
    return 1;
  }
  if (!v10[62] && (*v12 == 77 && v12[1] == 90 || *(_DWORD *)v12 == 1179403647))
  {
    uint64_t v38 = 0;
    uint64_t v48 = 0;
    size_t v39 = 4096;
    while (1)
    {
LABEL_49:
      if (v39 + v38 > 0x20000)
      {
LABEL_61:
        uint64_t v46 = "Couldn't find out RAR header";
        goto LABEL_68;
      }
      size_t v40 = sub_2099738A4(a1, v39, &v48, v13, v14, v15, v16, v17);
      if (v40) {
        break;
      }
      BOOL v42 = v39 >= 0x80;
      v39 >>= 1;
      if (!v42) {
        goto LABEL_61;
      }
    }
    if (v48 < 64) {
      goto LABEL_61;
    }
    uint64_t v43 = 0;
    while (1)
    {
      size_t v44 = v40 + v43;
      if (*(_DWORD *)(v40 + v43) == 561144146 && *(_DWORD *)(v40 + v43 + 3) == 465441) {
        break;
      }
      v43 += 16;
      if (v44 + 23 >= v40 + v48)
      {
        sub_209973BDC(a1, v43, v41, v13, v14, v15, v16, v17);
        v38 += v43;
        goto LABEL_49;
      }
    }
    sub_209973BDC(a1, v43, v41, v13, v14, v15, v16, v17);
  }
  v10[62] = 1;
  uint64_t v18 = (unsigned __int16 *)sub_2099738A4(a1, 7uLL, 0, v13, v14, v15, v16, v17);
  if (!v18) {
    return 4294967266;
  }
  while (2)
  {
    int v20 = *((unsigned __int8 *)v18 + 2);
    switch(*((unsigned char *)v18 + 2))
    {
      case 'r':
        if (*(_DWORD *)v18 != 561144146 || *(_DWORD *)((char *)v18 + 3) != 465441)
        {
          uint64_t v46 = "Invalid marker header";
          goto LABEL_68;
        }
        size_t v34 = 7;
        goto LABEL_42;
      case 's':
        *uint64_t v10 = *(unsigned __int16 *)((char *)v18 + 3);
        size_t v34 = *(unsigned __int16 *)((char *)v18 + 5);
        if (v34 <= 0xC) {
          goto LABEL_65;
        }
        int v35 = (unsigned __int16 *)sub_2099738A4(a1, v34, 0, v13, v14, v15, v16, v17);
        if (!v35) {
          return 4294967266;
        }
        *((_WORD *)v10 + 8) = *(unsigned __int16 *)((char *)v35 + 7);
        *(int *)((char *)v10 + 18) = *(_DWORD *)((char *)v35 + 9);
        int v36 = *v10;
        if ((*v10 & 0x200) == 0) {
          goto LABEL_40;
        }
        if (v34 <= 0xD)
        {
LABEL_65:
          uint64_t v46 = "Invalid header size";
          goto LABEL_68;
        }
        *((unsigned char *)v10 + 22) = *((unsigned char *)v35 + 13);
LABEL_40:
        if ((v36 & 0x80) != 0)
        {
          archive_entry_set_is_metadata_encrypted(a2, 1);
          archive_entry_set_is_data_encrypted(a2, 1);
          *uint64_t v11 = 1;
          uint64_t v46 = "RAR encryption support unavailable.";
          goto LABEL_68;
        }
        if (*v35 != (unsigned __int16)crc32(0, (const Bytef *)v35 + 2, (int)v34 - 2)) {
          goto LABEL_64;
        }
LABEL_42:
        sub_209973BDC(a1, v34, v19, v13, v14, v15, v16, v17);
        goto LABEL_44;
      case 't':
        return sub_2099E0350(a1, a2, (char)v20, v13, v14, v15, v16, v17);
      case 'u':
      case 'v':
      case 'w':
      case 'x':
      case 'y':
      case '{':
        size_t v21 = *(unsigned __int16 *)((char *)v18 + 5);
        if (v21 <= 6) {
          goto LABEL_62;
        }
        if (((char)v18[2] & 0x80000000) == 0) {
          goto LABEL_17;
        }
        if (v21 <= 0xA)
        {
LABEL_62:
          uint64_t v46 = "Invalid header size too small";
          goto LABEL_68;
        }
        uint64_t v18 = (unsigned __int16 *)sub_2099738A4(a1, v21, 0, v13, v14, v15, v16, v17);
        if (!v18) {
          return 4294967266;
        }
        v21 += *(unsigned int *)((char *)v18 + 7);
LABEL_17:
        int v22 = *v18;
        sub_209973BDC(a1, 2, v19, v13, v14, v15, v16, v17);
        unint64_t v23 = v21 - 2;
        if (v21 == 2)
        {
          LOWORD(v24) = 0;
LABEL_26:
          if (v22 != (unsigned __int16)v24)
          {
LABEL_64:
            uint64_t v46 = "Header CRC error";
            goto LABEL_68;
          }
          if (v20 == 123) {
            return 1;
          }
LABEL_44:
          uint64_t v18 = (unsigned __int16 *)sub_2099738A4(a1, 7uLL, 0, v13, v14, v15, v16, v17);
          if (!v18) {
            return 4294967266;
          }
          continue;
        }
        uLong v24 = 0;
        while (1)
        {
          uint64_t v25 = v23 >= 0x8000 ? 0x8000 : v23;
          uint64_t v26 = (const Bytef *)sub_2099738A4(a1, v25, 0, v13, v14, v15, v16, v17);
          if (!v26) {
            break;
          }
          uLong v24 = crc32(v24, v26, v25);
          sub_209973BDC(a1, v25, v27, v28, v29, v30, v31, v32);
          v23 -= v25;
          if (!v23) {
            goto LABEL_26;
          }
        }
LABEL_47:
        uint64_t v46 = "Bad RAR file";
LABEL_68:
        archive_set_error((_DWORD *)a1, 79, v46, v13, v14, v15, v16, v17, v47);
        return 4294967266;
      case 'z':
        uint64_t result = sub_2099E0350(a1, a2, (char)v20, v13, v14, v15, v16, v17);
        if ((int)result >= -20) {
          goto LABEL_44;
        }
        return result;
      default:
        goto LABEL_47;
    }
  }
}

uint64_t sub_2099DF1C8(uint64_t a1, const Bytef **a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int64x2_t a9)
{
  uint64_t v10 = (void *)a3;
  uint64_t v13 = **(void **)(a1 + 2472);
  if (*(_DWORD *)(v13 + 20248) == -1) {
    *(_DWORD *)(v13 + 20248) = 0;
  }
  uint64_t v14 = *(void *)(v13 + 160);
  if (v14 >= 1)
  {
    sub_209973BDC(a1, v14, a3, (uint64_t)a4, a5, a6, a7, a8);
    *(void *)(v13 + 160) = 0;
  }
  *a2 = 0;
  if (*(unsigned char *)(v13 + 237) || *(void *)(v13 + 200) >= *(void *)(v13 + 40))
  {
    *uint64_t v10 = 0;
    uint64_t v141 = *(void *)(v13 + 184);
    *a4 = v141;
    if (v141 <= *(void *)(v13 + 40)) {
      uint64_t v141 = *(void *)(v13 + 40);
    }
    *a4 = v141;
    return 1;
  }
  int v15 = *(char *)(v13 + 23);
  if ((v15 - 49) >= 5)
  {
    if (v15 == 48)
    {
      uint64_t v167 = 0;
      uint64_t v143 = **(void **)(a1 + 2472);
      if (*(void *)(v143 + 168) || (*(unsigned char *)v143 & 1) != 0 && (*(unsigned char *)(v143 + 24) & 2) != 0)
      {
        int v144 = (const Bytef *)sub_2099E1010(a1, 1uLL, &v167, (uint64_t)a4, a5, a6, a7, a8);
        *a2 = v144;
        uint64_t v145 = v167;
        if (v167 > 0)
        {
          *uint64_t v10 = v167;
          *a4 = *(void *)(v143 + 184);
          *(void *)(v143 + 184) += v145;
          *(void *)(v143 + 200) += v145;
          uint64_t v146 = *(void *)(v143 + 168) - v145;
          *(void *)(v143 + 160) = v145;
          *(void *)(v143 + 168) = v146;
          uint64_t v17 = 0;
          *(void *)(v143 + 240) = crc32(*(void *)(v143 + 240), v144, v145);
          return v17;
        }
        int v147 = "Truncated RAR file data";
      }
      else
      {
        *a2 = 0;
        *uint64_t v10 = 0;
        *a4 = *(void *)(v143 + 184);
        if (*(void *)(v143 + 8) == *(void *)(v143 + 240))
        {
          uint64_t v17 = 1;
          *(unsigned char *)(v143 + 237) = 1;
          return v17;
        }
        int v147 = "File CRC error";
      }
    }
    else
    {
      int v147 = "Unsupported compression method for RAR file.";
    }
    archive_set_error((_DWORD *)a1, 79, v147, (uint64_t)a4, a5, a6, a7, a8, v153);
    return 4294967266;
  }
  uint64_t v155 = v10;
  uint64_t v156 = a4;
  uint64_t v16 = 0;
  uint64_t v162 = off_26BD73730[0];
  while (2)
  {
    uint64_t v17 = 0;
    uint64_t v154 = v16 + 1;
    uint64_t v18 = **(void **)(a1 + 2472);
    uint64_t v163 = v18 + 928;
    uint64_t v166 = v18 + 20112;
LABEL_10:
    while (2)
    {
      if (!*(unsigned char *)(v18 + 208)) {
        goto LABEL_214;
      }
      if (*(unsigned char *)(v18 + 922)) {
        goto LABEL_215;
      }
      if (*(_DWORD *)(v18 + 232))
      {
        a3 = *(void *)(v18 + 184);
        if (a3 >= *(void *)(v18 + 40))
        {
LABEL_215:
          uint64_t v149 = *(unsigned int *)(v18 + 212);
          if (v149)
          {
            long long v150 = *(const Bytef **)(v18 + 224);
            *a2 = v150;
            *uint64_t v155 = v149;
            *uint64_t v156 = *(void *)(v18 + 192);
            *(void *)(v18 + 192) += v149;
            uint64_t v17 = 0;
            *(void *)(v18 + 240) = crc32(*(void *)(v18 + 240), v150, v149);
            *(_DWORD *)(v18 + 212) = 0;
            return v17;
          }
          *a2 = 0;
          *uint64_t v155 = 0;
          *uint64_t v156 = *(void *)(v18 + 184);
          if (*(void *)(v18 + 8) == *(void *)(v18 + 240))
          {
            uint64_t v17 = 1;
            *(unsigned char *)(v18 + 237) = 1;
            goto LABEL_230;
          }
          uint64_t v148 = "File CRC error";
LABEL_213:
          archive_set_error((_DWORD *)a1, 79, v148, (uint64_t)a4, a5, a6, a7, a8, v153);
LABEL_214:
          uint64_t v17 = 4294967266;
LABEL_230:
          off_26BD73700(v13 + 928);
          *(_WORD *)(v13 + 920) = 1;
          return v17;
        }
        if (!*(unsigned char *)(v18 + 923))
        {
          uint64_t v92 = *(void *)(v18 + 176);
          if (v92 >= 1)
          {
            int v93 = *(_DWORD *)(v18 + 212);
            if (v92 >= (unint64_t)(*(_DWORD *)(v18 + 216) - v93)) {
              uint64_t v94 = (*(_DWORD *)(v18 + 216) - v93);
            }
            else {
              uint64_t v94 = *(void *)(v18 + 176);
            }
            uint64_t v95 = sub_2099E10E8(a1, a2, a3, v94, a5, a6, a7, a8);
            if (v95)
            {
              uint64_t v17 = v95;
              goto LABEL_228;
            }
            uint64_t v96 = *(void *)(v18 + 184) + v94;
            *(void *)(v18 + 176) -= v94;
            *(void *)(v18 + 184) = v96;
            uint64_t v97 = *a2;
            if (!*a2)
            {
              uint64_t v17 = 0;
              continue;
            }
            *(_DWORD *)(v18 + 212) = 0;
            uint64_t v152 = *(unsigned int *)(v18 + 216);
            *uint64_t v155 = v152;
            *uint64_t v156 = *(void *)(v18 + 192);
            *(void *)(v18 + 192) += v152;
            uint64_t v17 = 0;
            *(void *)(v18 + 240) = crc32(*(void *)(v18 + 240), v97, v152);
            return v17;
          }
        }
      }
      break;
    }
    if (*(void *)(v18 + 20240)) {
      goto LABEL_21;
    }
    if (*(uint64_t *)(**(void **)(a1 + 2472) + 168) >= 1)
    {
      size_t v19 = sub_2099E1010(a1, 1uLL, (uint64_t *)(v18 + 20232), (uint64_t)a4, a5, a6, a7, a8);
      *(void *)(v18 + 20240) = v19;
      if (v19)
      {
        if (!*(_DWORD *)(v18 + 20224)) {
          a9 = sub_2099E1A14(a1, (unint64_t *)(v18 + 20216), a3, (uint64_t)a4, a5, a6, a7, a8, a9);
        }
        goto LABEL_20;
      }
      uint64_t v148 = "Truncated RAR file data";
      goto LABEL_213;
    }
LABEL_20:
    uint64_t v17 = 0;
LABEL_21:
    if (*(unsigned char *)(v18 + 920))
    {
      uint64_t v17 = sub_2099E1230(a1);
      if ((int)v17 < -20) {
        goto LABEL_228;
      }
    }
    if (*(unsigned char *)(v18 + 923))
    {
      int v20 = ((uint64_t (*)(uint64_t, uint64_t))v162)(v163, v166);
      if ((v20 & 0x80000000) == 0)
      {
        char v21 = v20;
        if (v20 != *(_DWORD *)(v18 + 924))
        {
LABEL_135:
          *(unsigned char *)(*(void *)(v18 + 848) + (*(_DWORD *)(v18 + 856) & *(_DWORD *)(v18 + 864))) = v21;
          uint64_t v90 = *(void *)(v18 + 864) + 1;
          uint64_t v91 = 1;
LABEL_186:
          *(void *)(v18 + 864) = v90;
          uint64_t v134 = *(void *)(v18 + 176) + v91;
          *(void *)(v18 + 176) = v134;
          goto LABEL_194;
        }
        int v22 = ((uint64_t (*)(uint64_t, uint64_t))v162)(v163, v166);
        if ((v22 & 0x80000000) == 0)
        {
          switch(v22)
          {
            case 0:
              *(unsigned char *)(v18 + 920) = 1;
              uint64_t v16 = v154;
              if (v154 == 1025) {
                goto LABEL_214;
              }
              continue;
            case 2:
              *(unsigned char *)(v18 + 922) = 1;
              goto LABEL_199;
            case 3:
              archive_set_error((_DWORD *)a1, -1, "Parsing filters is unsupported.", (uint64_t)a4, a5, a6, a7, a8, v153);
              uint64_t v17 = 4294967271;
              goto LABEL_230;
            case 4:
              int v98 = 0;
              int v99 = 16;
              break;
            case 5:
              int v118 = ((uint64_t (*)(uint64_t, uint64_t))v162)(v163, v166);
              if (v118 < 0) {
                goto LABEL_212;
              }
              int v102 = v118 + 4;
              int v119 = *(_DWORD *)(v18 + 856);
              int v120 = v119 & *(_DWORD *)(v18 + 864);
              int v121 = (v120 - 1) & v119;
              int v122 = v118 + 4;
              do
              {
                if (v120 <= v121) {
                  int v123 = v121;
                }
                else {
                  int v123 = v120;
                }
                int v124 = v119 - v123;
                if (v122 >= v124 + 1) {
                  uint64_t v125 = (v124 + 1);
                }
                else {
                  uint64_t v125 = v122;
                }
                uint64_t v126 = *(void *)(v18 + 848);
                uint64_t v127 = (unsigned char *)(v126 + v120);
                int32x4_t v128 = (char *)(v126 + v121);
                int v129 = v125 + v120;
                int v130 = v125 + v121;
                if ((int)v125 + v120 < v121 || v130 < v120)
                {
                  memcpy(v127, v128, (int)v125);
                }
                else if ((int)v125 >= 1)
                {
                  uint64_t v132 = v125;
                  do
                  {
                    char v133 = *v128++;
                    *v127++ = v133;
                    --v132;
                  }
                  while (v132);
                }
                int v119 = *(_DWORD *)(v18 + 856);
                int v120 = v119 & v129;
                int v121 = v119 & v130;
                BOOL v42 = __OFSUB__(v122, v125);
                v122 -= v125;
              }
              while (!((v122 < 0) ^ v42 | (v122 == 0)));
              goto LABEL_185;
            default:
              goto LABEL_135;
          }
          while (1)
          {
            int v100 = ((uint64_t (*)(uint64_t, uint64_t))v162)(v163, v166);
            if (v100 < 0) {
              break;
            }
            v98 |= v100 << v99;
            v99 -= 8;
            if (v99 == -8)
            {
              int v101 = ((uint64_t (*)(uint64_t, uint64_t))v162)(v163, v166);
              if (v101 < 0) {
                break;
              }
              int v102 = v101 + 32;
              int v103 = *(_DWORD *)(v18 + 856);
              int v104 = v103 & *(_DWORD *)(v18 + 864);
              int v105 = (v104 - v98 - 2) & v103;
              int v106 = v101 + 32;
              do
              {
                if (v104 <= v105) {
                  int v107 = v105;
                }
                else {
                  int v107 = v104;
                }
                int v108 = v103 - v107;
                if (v106 >= v108 + 1) {
                  uint64_t v109 = (v108 + 1);
                }
                else {
                  uint64_t v109 = v106;
                }
                uint64_t v110 = *(void *)(v18 + 848);
                uint64_t v111 = (unsigned char *)(v110 + v104);
                int v112 = (char *)(v110 + v105);
                int v113 = v109 + v104;
                int v114 = v109 + v105;
                if ((int)v109 + v104 < v105 || v114 < v104)
                {
                  memcpy(v111, v112, (int)v109);
                }
                else if ((int)v109 >= 1)
                {
                  uint64_t v116 = v109;
                  do
                  {
                    char v117 = *v112++;
                    *v111++ = v117;
                    --v116;
                  }
                  while (v116);
                }
                int v103 = *(_DWORD *)(v18 + 856);
                int v104 = v103 & v113;
                int v105 = v103 & v114;
                BOOL v42 = __OFSUB__(v106, v109);
                v106 -= v109;
              }
              while (!((v106 < 0) ^ v42 | (v106 == 0)));
LABEL_185:
              uint64_t v91 = v102;
              uint64_t v90 = *(void *)(v18 + 864) + v102;
              goto LABEL_186;
            }
          }
        }
      }
LABEL_212:
      uint64_t v148 = "Invalid symbol";
      goto LABEL_213;
    }
    break;
  }
  uint64_t v157 = *(void *)(v18 + 184);
  uint64_t v158 = a2;
  uint64_t v23 = v157 + *(unsigned int *)(v18 + 232);
  *(void *)(v18 + 912) = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v24 = **(void **)(a1 + 2472);
  uint64_t v165 = (unint64_t *)(v24 + 20216);
  if (*(void *)(v24 + 912) >= v23) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = *(void *)(v24 + 912);
  }
  v164 = (int *)(v24 + 20224);
  uint64_t v153 = (char *)(v24 + 360);
  uint64_t v160 = (int *)(v24 + 884);
  uint64_t v161 = v25;
  uint64_t v159 = (void *)(v24 + 888);
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v17 = *(void *)(v24 + 864);
        if (*(unsigned char *)(v24 + 872))
        {
          uint64_t v26 = *(unsigned int *)(v24 + 876);
          if (v17 + v26 > v25) {
            goto LABEL_192;
          }
          if ((int)v26 >= 1)
          {
            int v27 = *(_DWORD *)(v24 + 856);
            int v28 = v27 & v17;
            int v29 = ((v27 & v17) - *(_DWORD *)(v24 + 880)) & v27;
            int v30 = *(_DWORD *)(v24 + 876);
            do
            {
              if (v28 <= v29) {
                int v31 = v29;
              }
              else {
                int v31 = v28;
              }
              int v32 = v27 - v31;
              if (v30 >= v32 + 1) {
                uint64_t v33 = (v32 + 1);
              }
              else {
                uint64_t v33 = v30;
              }
              uint64_t v34 = *(void *)(v24 + 848);
              int v35 = (unsigned char *)(v34 + v28);
              int v36 = (char *)(v34 + v29);
              int v37 = v33 + v28;
              int v38 = v33 + v29;
              BOOL v39 = (int)v33 + v28 < v29 || v38 < v28;
              if (v39)
              {
                memcpy(v35, v36, (int)v33);
              }
              else if ((int)v33 >= 1)
              {
                uint64_t v40 = v33;
                do
                {
                  char v41 = *v36++;
                  *v35++ = v41;
                  --v40;
                }
                while (v40);
              }
              int v27 = *(_DWORD *)(v24 + 856);
              int v28 = v27 & v37;
              int v29 = v27 & v38;
              BOOL v42 = __OFSUB__(v30, v33);
              v30 -= v33;
            }
            while (!((v30 < 0) ^ v42 | (v30 == 0)));
            uint64_t v17 = *(void *)(v24 + 864);
          }
          v17 += (int)v26;
          *(void *)(v24 + 864) = v17;
          *(unsigned char *)(v24 + 872) = 0;
        }
        if (*(unsigned char *)(v24 + 923)) {
          BOOL v43 = 0;
        }
        else {
          BOOL v43 = v17 < v25;
        }
        if (!v43) {
          goto LABEL_192;
        }
        unsigned int v44 = sub_2099E1F00(a1, v24 + 280, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
        if ((v44 & 0x80000000) != 0) {
          goto LABEL_227;
        }
        unsigned int v45 = v44;
        *(unsigned char *)(v24 + 872) = 0;
        if (v44 > 0xFF) {
          break;
        }
        *(unsigned char *)(*(void *)(v24 + 848) + (*(_DWORD *)(v24 + 856) & *(_DWORD *)(v24 + 864))) = v44;
        ++*(void *)(v24 + 864);
      }
      if (v44 == 256) {
        break;
      }
      if (v44 == 258)
      {
        int v49 = *(_DWORD *)(v24 + 876);
        if (v49)
        {
          int v47 = *(_DWORD *)(v24 + 880);
          goto LABEL_130;
        }
      }
      else
      {
        if (v44 == 257)
        {
          archive_set_error((_DWORD *)a1, -1, "Parsing filters is unsupported.", (uint64_t)a4, a5, a6, a7, a8, v153);
          uint64_t v17 = -25;
          goto LABEL_228;
        }
        if (v44 <= 0x106)
        {
          unint64_t v46 = v44 - 259;
          int v47 = *(_DWORD *)(v24 + 4 * v46 + 884);
          unsigned int v48 = sub_2099E1F00(a1, v24 + 400, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
          if (v48 > 0x1C) {
            goto LABEL_225;
          }
          int v49 = byte_2099ECBF0[v48] + 2;
          if (v48 >= 8)
          {
            int v50 = byte_2099ECC0C[v48];
            unint64_t v51 = (int *)(v24 + 20224);
            int v52 = *v164;
            if (*v164 < v50)
            {
              a9 = sub_2099E1A14(a1, v165, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
              int v52 = *v164;
              if (v53)
              {
                unint64_t v51 = (int *)(v24 + 20224);
              }
              else
              {
                unint64_t v51 = (int *)(v24 + 20224);
                if (v52 < v50) {
                  goto LABEL_226;
                }
              }
            }
            int v73 = v52 - v50;
            v49 += dword_2099ECB60[v50] & (*v165 >> v73);
            *unint64_t v51 = v73;
            uint64_t v25 = v161;
          }
          if (v45 >= 0x104)
          {
            do
            {
              BOOL v39 = v46 > 1;
              v160[v46] = *(_DWORD *)(v24 + 4 * (v46 - 1) + 884);
              --v46;
            }
            while (v39);
          }
          *uint64_t v160 = v47;
          goto LABEL_130;
        }
        if (v44 > 0x10E)
        {
          if (v44 > 0x12B) {
            goto LABEL_225;
          }
          uint64_t v62 = v44 - 271;
          int v63 = byte_2099ECBF0[v62] + 3;
          if (v62 >= 8)
          {
            int v64 = byte_2099ECC0C[v62];
            uint64_t v65 = (int *)(v24 + 20224);
            int v66 = *v164;
            if (*v164 < v64)
            {
              a9 = sub_2099E1A14(a1, v165, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
              int v66 = *v164;
              if (v67)
              {
                uint64_t v65 = (int *)(v24 + 20224);
              }
              else
              {
                uint64_t v65 = (int *)(v24 + 20224);
                if (v66 < v64) {
                  goto LABEL_226;
                }
              }
            }
            int v74 = v66 - v64;
            v63 += dword_2099ECB60[v64] & (*v165 >> v74);
            *uint64_t v65 = v74;
            uint64_t v25 = v161;
          }
          unsigned int v75 = sub_2099E1F00(a1, v24 + 320, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
          if (v75 > 0x3C)
          {
LABEL_225:
            archive_set_error((_DWORD *)a1, 79, "Bad RAR file data", (uint64_t)a4, a5, a6, a7, a8, v153);
LABEL_227:
            uint64_t v17 = -30;
            goto LABEL_228;
          }
          int v47 = dword_2099ECC28[v75] + 1;
          if (v75 >= 4)
          {
            uint64_t v76 = byte_2099ECD18[v75];
            if (v75 < 0xA)
            {
              __int16 v81 = (_DWORD *)(v24 + 20224);
              int v82 = *v164;
              if (*v164 < (int)v76)
              {
                a9 = sub_2099E1A14(a1, v165, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
                int v82 = *v164;
                if (v83)
                {
                  __int16 v81 = (_DWORD *)(v24 + 20224);
                }
                else
                {
                  __int16 v81 = (_DWORD *)(v24 + 20224);
                  if (v82 < (int)v76) {
                    goto LABEL_226;
                  }
                }
              }
              int v84 = v82 - v76;
              v47 += dword_2099ECB60[v76] & (*v165 >> v84);
              _DWORD *v81 = v84;
LABEL_122:
              uint64_t v25 = v161;
            }
            else
            {
              if ((unint64_t)v75 - 12 <= 0x2F)
              {
                uint64_t v77 = (_DWORD *)(v24 + 20224);
                int v78 = *v164;
                uint64_t v79 = v76 - 4;
                if (*v164 < (int)v79)
                {
                  a9 = sub_2099E1A14(a1, v165, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
                  int v78 = *v164;
                  if (v80)
                  {
                    uint64_t v77 = (_DWORD *)(v24 + 20224);
                  }
                  else
                  {
                    uint64_t v77 = (_DWORD *)(v24 + 20224);
                    if (v78 < (int)v79) {
                      goto LABEL_226;
                    }
                  }
                }
                int v85 = v78 - v79;
                v47 += 16 * (dword_2099ECB60[v79] & (*v165 >> v85));
                *uint64_t v77 = v85;
              }
              int v86 = *(_DWORD *)(v24 + 904);
              if (v86)
              {
                *(_DWORD *)(v24 + 904) = v86 - 1;
                v47 += *(_DWORD *)(v24 + 900);
                goto LABEL_122;
              }
              int v89 = sub_2099E1F00(a1, (uint64_t)v153, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
              uint64_t v25 = v161;
              if (v89 < 0) {
                goto LABEL_227;
              }
              if (v89 == 16)
              {
                *(_DWORD *)(v24 + 904) = 15;
                v47 += *(_DWORD *)(v24 + 900);
              }
              else
              {
                v47 += v89;
                *(_DWORD *)(v24 + 900) = v89;
              }
            }
          }
          if (v47 < 0x40000) {
            int v87 = v63;
          }
          else {
            int v87 = v63 + 1;
          }
          uint64_t v88 = *(void *)v160;
          *(_DWORD *)(v24 + 896) = *(_DWORD *)(v24 + 892);
          *uint64_t v159 = v88;
          if (v47 < 0x2000) {
            int v49 = v87;
          }
          else {
            int v49 = v87 + 1;
          }
          *uint64_t v160 = v47;
          goto LABEL_130;
        }
        int v57 = byte_2099ECD54[v44 - 263];
        int v58 = byte_2099ECD5C[v44 - 263];
        uint64_t v59 = (int *)(v24 + 20224);
        int v60 = *v164;
        if (*v164 < v58)
        {
          a9 = sub_2099E1A14(a1, v165, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
          int v60 = *v164;
          if (v61)
          {
            uint64_t v59 = (int *)(v24 + 20224);
          }
          else
          {
            uint64_t v59 = (int *)(v24 + 20224);
            if (v60 < v58) {
              goto LABEL_226;
            }
          }
        }
        int v70 = v60 - v58;
        int v71 = dword_2099ECB60[v58] & (*v165 >> v70);
        *uint64_t v59 = v70;
        uint64_t v25 = v161;
        int v72 = *(_DWORD *)(v24 + 892);
        *uint64_t v159 = *(void *)v160;
        *(_DWORD *)(v24 + 896) = v72;
        int v47 = v57 + 1 + v71;
        *uint64_t v160 = v47;
        int v49 = 2;
LABEL_130:
        *(_DWORD *)(v24 + 880) = v47;
        *(_DWORD *)(v24 + 876) = v49;
        *(unsigned char *)(v24 + 872) = 1;
      }
    }
    unint64_t v54 = (int *)(v24 + 20224);
    int v55 = *v164;
    if (*v164 <= 0)
    {
      a9 = sub_2099E1A14(a1, v165, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
      int v55 = *v164;
      if (v56)
      {
        unint64_t v54 = (int *)(v24 + 20224);
      }
      else
      {
        unint64_t v54 = (int *)(v24 + 20224);
        if (v55 < 1) {
          goto LABEL_226;
        }
      }
    }
    unint64_t v68 = *v165;
    int v69 = v55 - 1;
    *unint64_t v54 = v55 - 1;
    if (((v68 >> (v55 - 1)) & 1) == 0) {
      break;
    }
    uint64_t v25 = v161;
    if (sub_2099E1230(a1)) {
      goto LABEL_227;
    }
  }
  *(unsigned char *)(v24 + 236) = 1;
  if (v55 <= 1)
  {
    sub_2099E1A14(a1, v165, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
    int v69 = *v54;
    if (!v135 && v69 < 1)
    {
LABEL_226:
      archive_set_error((_DWORD *)a1, 79, "Truncated RAR file data", (uint64_t)a4, a5, a6, a7, a8, v153);
      *(unsigned char *)(v24 + 208) = 0;
      goto LABEL_227;
    }
    unint64_t v68 = *v165;
  }
  int v136 = v69 - 1;
  *(unsigned char *)(v24 + 920) = (v68 >> v136) & 1;
  *unint64_t v54 = v136;
  uint64_t v17 = *(void *)(v24 + 864);
LABEL_192:
  if (v17 < 0) {
    goto LABEL_228;
  }
  a2 = v158;
  uint64_t v134 = v17 - v157;
  *(void *)(v18 + 176) = v17 - v157;
  if (v17 == v157)
  {
    uint64_t v148 = "Internal error extracting RAR file";
    goto LABEL_213;
  }
LABEL_194:
  int v137 = *(_DWORD *)(v18 + 212);
  if (v134 >= (*(_DWORD *)(v18 + 216) - v137)) {
    uint64_t v138 = (*(_DWORD *)(v18 + 216) - v137);
  }
  else {
    uint64_t v138 = v134;
  }
  uint64_t v17 = sub_2099E10E8(a1, a2, *(void *)(v18 + 184), v138, a5, a6, a7, a8);
  if (!v17)
  {
    uint64_t v139 = *(void *)(v18 + 184) + v138;
    *(void *)(v18 + 176) -= v138;
    *(void *)(v18 + 184) = v139;
LABEL_199:
    unint64_t v140 = *a2;
    if (*a2)
    {
      *(_DWORD *)(v18 + 212) = 0;
      uint64_t v151 = *(unsigned int *)(v18 + 216);
      *uint64_t v155 = v151;
      *uint64_t v156 = *(void *)(v18 + 192);
      *(void *)(v18 + 192) += v151;
      *(void *)(v18 + 240) = crc32(*(void *)(v18 + 240), v140, v151);
      goto LABEL_228;
    }
    goto LABEL_10;
  }
LABEL_228:
  if (v17 != -20 && v17) {
    goto LABEL_230;
  }
  return v17;
}

uint64_t sub_2099DFFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (1)
  {
    uint64_t v9 = *(uint64_t **)(a1 + 2472);
    uint64_t v10 = *v9;
    uint64_t v11 = *(void *)(*v9 + 160);
    if (v11 >= 1)
    {
      sub_209973BDC(a1, v11, a3, a4, a5, a6, a7, a8);
      *(void *)(v10 + 160) = 0;
    }
    uint64_t v12 = *(void *)(v10 + 168);
    if (v12 >= 1 && sub_209973BDC(a1, v12, a3, a4, a5, a6, a7, a8) < 0) {
      break;
    }
    if ((*(unsigned char *)v10 & 1) == 0 || (*(unsigned char *)(v10 + 24) & 2) == 0) {
      return 0;
    }
    uint64_t result = sub_2099DED9C(a1, *(void *)(a1 + 160), a3, a4, a5, a6, a7, a8);
    if (result == 1) {
      uint64_t result = sub_2099DED9C(a1, *(void *)(a1 + 160), a3, a4, a5, a6, a7, a8);
    }
    if (result) {
      return result;
    }
  }
  return 4294967266;
}

uint64_t sub_2099E0040(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(void **)(a1 + 2472);
  if (*(unsigned char *)(v9 + 23) != 48)
  {
    uint64_t v11 = "Seeking of compressed RAR files is unsupported";
LABEL_6:
    archive_set_error((_DWORD *)a1, -1, v11, a4, a5, a6, a7, a8, v46);
    return -25;
  }
  if (a3 == 2)
  {
    uint64_t v10 = (uint64_t *)(v9 + 40);
  }
  else
  {
    if (a3 != 1)
    {
      uint64_t v13 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = (uint64_t *)(v9 + 200);
  }
  uint64_t v13 = *v10;
LABEL_10:
  uint64_t v14 = v13 + a2;
  if (v13 + a2 < 0) {
    return -1;
  }
  uint64_t v15 = *(void *)(v9 + 40);
  if (v14 > v15)
  {
    *(void *)(v9 + 200) = v14;
    uint64_t v14 = v15;
  }
  uint64_t v16 = *(void *)(v9 + 256);
  uint64_t v17 = *(void *)(v16 + 8) + v14;
  unsigned int v18 = *(_DWORD *)(v9 + 264);
  if (v18)
  {
    size_t v19 = (void *)(v16 + 32);
    uint64_t v20 = *(unsigned int *)(v9 + 264);
    do
    {
      uint64_t v17 = *v19 + v17 - *(v19 - 2);
      v19 += 3;
      --v20;
    }
    while (v20);
  }
  if ((*(unsigned char *)v9 & 1) == 0) {
    goto LABEL_17;
  }
  do
  {
    while (1)
    {
      uint64_t v28 = *(void *)(v16 + 24 * v18 + 8);
      if (v17 < v28 && (*(unsigned char *)(v9 + 24) & 1) != 0) {
        break;
      }
      uint64_t v29 = *(void *)(v16 + 24 * v18 + 16);
      if (v17 <= v29 || (*(unsigned char *)(v9 + 24) & 2) == 0) {
        goto LABEL_17;
      }
      unsigned int v30 = v18 + 1;
      *(_DWORD *)(v9 + 264) = v18 + 1;
      if (v18 + 1 >= *(_DWORD *)(v9 + 268) || v17 <= *(void *)(v16 + 24 * v30 + 16))
      {
        *(_DWORD *)(v9 + 264) = v18;
        uint64_t result = sub_20998D6D4(a1, v29, 0);
        if (result < 0) {
          return result;
        }
        int v38 = sub_2099DED9C(a1, *(void *)(a1 + 160), v32, v33, v34, v35, v36, v37);
        if (v38 == 1)
        {
          *(unsigned char *)(v9 + 252) = 1;
          int v38 = sub_2099DED9C(a1, *(void *)(a1 + 160), v39, a4, a5, a6, a7, a8);
        }
        if (v38) {
          goto LABEL_44;
        }
        uint64_t v16 = *(void *)(v9 + 256);
        unsigned int v18 = *(_DWORD *)(v9 + 264);
        uint64_t v17 = *(void *)(v16 + 24 * v18 + 8) + v17 - *(void *)(v16 + 24 * (v18 - 1) + 16);
      }
      else
      {
        uint64_t v17 = v17 - v29 + *(void *)(v16 + 24 * v30 + 8);
        ++v18;
      }
    }
    if (!v18)
    {
      uint64_t v11 = "Attempt to seek past beginning of RAR data block";
      goto LABEL_6;
    }
    *(_DWORD *)(v9 + 264) = --v18;
    uint64_t v31 = *(void *)(v16 + 24 * v18 + 8);
    v17 += *(void *)(v16 + 24 * v18 + 16) - v28;
  }
  while (v17 < v31);
  uint64_t result = sub_20998D6D4(a1, v31 - *(void *)(v16 + 24 * v18), 0);
  if ((result & 0x8000000000000000) == 0)
  {
    if (sub_2099DED9C(a1, *(void *)(a1 + 160), v40, v41, v42, v43, v44, v45))
    {
LABEL_44:
      uint64_t v11 = "Error during seek of RAR file";
      goto LABEL_6;
    }
    --*(_DWORD *)(v9 + 264);
LABEL_17:
    uint64_t result = sub_20998D6D4(a1, v17, 0);
    if ((result & 0x8000000000000000) == 0)
    {
      uint64_t v21 = *(void *)(v9 + 256);
      uint64_t v22 = *(unsigned int *)(v9 + 264);
      *(void *)(v9 + 168) = *(void *)(v21 + 24 * v22 + 16) - result;
      if (v22)
      {
        uint64_t v23 = (uint64_t *)(v21 + 24 * v22 + 8);
        uint64_t v24 = v22 - 1;
        do
        {
          uint64_t v25 = *v23;
          v23 -= 3;
          uint64_t v26 = v24;
          uint64_t result = result - v25 + *(void *)(v21 + 24 * v24-- + 16);
        }
        while (v26);
      }
      uint64_t v27 = result - *(void *)(v21 + 8);
      sub_20998D5C0(a1);
      *(void *)(v9 + 160) = 0;
      *(void *)(v9 + 184) = 0;
      if (v27 != *(void *)(v9 + 40) || (uint64_t result = *(void *)(v9 + 200), result <= v27))
      {
        *(void *)(v9 + 200) = v27;
        return v27;
      }
    }
  }
  return result;
}

uint64_t sub_2099E0320()
{
  return 3;
}

uint64_t sub_2099E0328(uint64_t a1)
{
  if (a1 && (v1 = *(uint64_t **)(a1 + 2472)) != 0 && (uint64_t v2 = *v1) != 0) {
    return *(unsigned int *)(v2 + 20248);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_2099E0350(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = **(void **)(a1 + 2472);
  uint64_t v12 = (_DWORD *)(v11 + 20176);
  uint64_t v13 = *(void *)(v11 + 20192);
  if (!v13)
  {
    if (*v12)
    {
      uint64_t v13 = *(void *)(v11 + 20184);
    }
    else
    {
      uint64_t v13 = sub_209976040();
      *(void *)(v11 + 20184) = v13;
      _DWORD *v12 = 1;
    }
  }
  uint64_t v14 = (unsigned __int8 *)sub_2099738A4(a1, 7uLL, 0, a4, a5, a6, a7, a8);
  if (!v14) {
    return 4294967266;
  }
  int v20 = *v14;
  int v21 = v14[1];
  uint64_t v22 = *(unsigned __int16 *)(v14 + 5);
  *(_DWORD *)(v11 + 24) = *(unsigned __int16 *)(v14 + 3);
  if (v22 <= 0x1F)
  {
LABEL_7:
    uint64_t v23 = "Invalid header size";
    goto LABEL_90;
  }
  uLong v24 = crc32(0, v14 + 2, 5u);
  sub_209973BDC(a1, 7, v25, v26, v27, v28, v29, v30);
  if ((*(unsigned char *)(v11 + 24) & 0x10) != 0)
  {
    uint64_t v23 = "RAR solid archive support unavailable.";
    goto LABEL_90;
  }
  uint64_t v125 = a2;
  int v126 = a3;
  *(void *)(v11 + 32) = 0;
  *(unsigned char *)(v11 + 23) = 0;
  *(_WORD *)(v11 + 64) = 0;
  *(void *)(v11 + 104) = 0;
  *(void *)(v11 + 48) = 0;
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 40) = 0;
  *(_OWORD *)(v11 + 112) = 0u;
  *(_OWORD *)(v11 + 128) = 0u;
  *(_OWORD *)(v11 + 144) = 0u;
  uint64_t v31 = (const Bytef *)sub_2099738A4(a1, v22 - 7, 0, v15, v16, v17, v18, v19);
  if (!v31) {
    return 4294967266;
  }
  uint64_t v32 = v31;
  if ((v20 | (v21 << 8)) != (unsigned __int16)crc32(v24, v31, (int)v22 - 7))
  {
    uint64_t v23 = "Header CRC error";
    goto LABEL_90;
  }
  uint64_t v36 = *(unsigned int *)v32;
  uint64_t v35 = *((unsigned int *)v32 + 1);
  uint64_t v37 = *(unsigned int *)(v32 + 9);
  unsigned int v38 = *(_DWORD *)(v32 + 13);
  uint64_t v123 = v32[19];
  uint64_t v121 = v32[20];
  int v119 = *(_DWORD *)(v32 + 21);
  unsigned int v120 = *((char *)v32 + 8);
  *(unsigned char *)(v11 + 23) = v32[18];
  *(void *)(v11 + 48) = sub_2099E0D0C(v38, v33, v34);
  *(void *)(v11 + 8) = v37;
  int v39 = *(_DWORD *)(v11 + 24);
  if ((v39 & 4) != 0)
  {
    archive_entry_set_is_data_encrypted(a2, 1);
    *(_DWORD *)(v11 + 20248) = 1;
    archive_set_error((_DWORD *)a1, 79, "RAR encryption support unavailable.", v40, v41, v42, v43, v44, v118);
    int v39 = *(_DWORD *)(v11 + 24);
  }
  if ((v39 & 0x100) != 0)
  {
    if (v22 <= 0x27) {
      goto LABEL_7;
    }
    v36 |= (unint64_t)*(unsigned int *)(v32 + 25) << 32;
    unint64_t v49 = v35 | ((unint64_t)*(unsigned int *)(v32 + 29) << 32);
    *(void *)(v11 + 32) = v36;
    *(void *)(v11 + 40) = v49;
    if (v36 < 0 || (v49 & 0x8000000000000000) != 0)
    {
      uint64_t v23 = "Invalid sizes specified.";
      goto LABEL_90;
    }
    uint64_t v45 = (char *)(v32 + 33);
  }
  else
  {
    uint64_t v45 = (char *)(v32 + 25);
    *(void *)(v11 + 32) = v36;
    *(void *)(v11 + 40) = v35;
  }
  *(void *)(v11 + 168) = v36;
  if (v126 == 122)
  {
    unint64_t v46 = v45;
    v22 += v36;
    size_t v47 = sub_2099738A4(a1, v22 - 7, 0, v15, v16, v17, v18, v19);
    if (!v47) {
      return 4294967266;
    }
    unsigned int v48 = (char *)(v22 - 7 + v47);
    uint64_t v45 = (char *)(v47 + v46 - (char *)v32);
  }
  else
  {
    unsigned int v48 = (char *)&v32[v22 - 7];
  }
  size_t v50 = v123 | (v121 << 8);
  if (&v45[v50] > v48)
  {
    uint64_t v23 = "Invalid filename size";
    goto LABEL_90;
  }
  unint64_t v122 = (unint64_t)v48;
  int v124 = (unsigned __int16 *)&v45[v50];
  unint64_t v51 = (2 * v50 + 2);
  int v52 = *(unsigned __int16 **)(v11 + 72);
  if (*(void *)(v11 + 96) < v51)
  {
    int v53 = v45;
    unint64_t v54 = (unsigned __int16 *)malloc_type_realloc(*(void **)(v11 + 72), (2 * v50 + 2), 0x226407EDuLL);
    if (!v54) {
      goto LABEL_112;
    }
    int v52 = v54;
    *(void *)(v11 + 72) = v54;
    *(void *)(v11 + 96) = v51;
    uint64_t v45 = v53;
  }
  int v55 = v45;
  memcpy(v52, v45, v50);
  *((unsigned char *)v52 + v50) = 0;
  if ((*(unsigned char *)(v11 + 25) & 2) == 0)
  {
    for (unsigned int i = strchr((char *)v52, 92); i; unsigned int i = strchr((char *)v52, 92))
      *unsigned int i = 47;
    int v57 = (void *)v13;
    goto LABEL_85;
  }
  size_t v58 = strlen((const char *)v52);
  if (v58 == v50)
  {
    int v57 = *(void **)(v11 + 20200);
    if (v57 || (int v57 = sub_2099756A4(a1, "UTF-8", 1), (*(void *)(v11 + 20200) = v57) != 0))
    {
      for (unint64_t j = strchr((char *)v52, 92); j; unint64_t j = strchr((char *)v52, 92))
        *unint64_t j = 47;
      goto LABEL_85;
    }
    return 4294967266;
  }
  uint64_t v60 = (v58 + 1);
  if (v60 >= v50)
  {
    char v61 = 0;
    uint64_t v15 = (uint64_t)v55;
  }
  else
  {
    uint64_t v15 = (uint64_t)v55;
    char v61 = v55[v60];
    uint64_t v60 = (v58 + 2);
  }
  unint64_t v16 = (2 * v50);
  unsigned int v62 = 0;
  if (v60 >= v50 || !v50) {
    goto LABEL_77;
  }
  unsigned int v63 = 0;
  char v64 = 0;
  unsigned int v62 = 0;
  while (2)
  {
    if (v64)
    {
      uint64_t v65 = v60;
    }
    else
    {
      uint64_t v65 = (v60 + 1);
      unsigned int v63 = *(unsigned __int8 *)(v15 + v60);
      char v64 = 8;
    }
    v64 -= 2;
    switch((v63 >> v64) & 3)
    {
      case 1u:
        if (v65 >= v50) {
          goto LABEL_60;
        }
        int v66 = (char *)v52 + v62;
        *int v66 = v61;
        goto LABEL_55;
      case 2u:
        if (v65 < (int)v50 - 1)
        {
          int v70 = (unsigned char *)(v15 + v65);
          int v71 = (char *)v52 + v62;
          *int v71 = v70[1];
          v62 += 2;
          v71[1] = *v70;
          uint64_t v60 = (v65 + 2);
LABEL_71:
          if (v60 >= v50 || v62 >= v16) {
            goto LABEL_75;
          }
          continue;
        }
        LODWORD(v60) = v50;
LABEL_75:
        if (v62 > v16)
        {
          uint64_t v23 = "Invalid filename";
          goto LABEL_90;
        }
LABEL_77:
        *(unsigned __int16 *)((char *)v52 + v62) = 0;
        uint64_t v77 = *(void **)(v11 + 20208);
        if (!v77)
        {
          int v78 = sub_2099756A4(a1, "UTF-16BE", 1);
          uint64_t v15 = (uint64_t)v55;
          *(void *)(v11 + 20208) = v78;
          uint64_t v77 = v78;
          if (!v78) {
            return 4294967266;
          }
        }
        LODWORD(v50) = v62 + 1;
        int v57 = v77;
        if (*v52)
        {
          uint64_t v79 = v52 + 1;
          do
          {
            if (*(v79 - 1) == 23552) {
              *((unsigned char *)v79 - 1) = 47;
            }
          }
          while (*v79++);
        }
        int v124 = (unsigned __int16 *)(v15 + v60);
LABEL_85:
        __int16 v81 = *(void **)(v11 + 80);
        if (v81
          && *(void *)(v11 + 88) == v50
          && !memcmp(*(const void **)(v11 + 72), *(const void **)(v11 + 80), (v50 + 1)))
        {
          sub_209973BDC(a1, v22 - 7, v82, v15, v16, v17, v18, v19);
          unsigned int v93 = *(_DWORD *)(v11 + 264) + 1;
          *(_DWORD *)(v11 + 264) = v93;
          unsigned int v94 = *(_DWORD *)(v11 + 268);
          if (v93 < v94)
          {
            uint64_t v95 = *(char **)(v11 + 256);
            if ((*(void *)&v95[24 * v93 + 8] & 0x8000000000000000) == 0) {
              return 0;
            }
            goto LABEL_111;
          }
          unsigned int v100 = v94 + 1;
          *(_DWORD *)(v11 + 268) = v100;
          int v101 = (char *)malloc_type_realloc(*(void **)(v11 + 256), 24 * v100, 0x1000040504FFAC1uLL);
          *(void *)(v11 + 256) = v101;
          if (v101)
          {
            uint64_t v95 = v101;
            unsigned int v93 = *(_DWORD *)(v11 + 264);
            int v102 = &v101[24 * v93];
            *(void *)int v102 = v22;
            *((void *)v102 + 1) = -1;
            *((void *)v102 + 2) = -1;
LABEL_111:
            uint64_t result = 0;
            int v103 = &v95[24 * v93];
            uint64_t v104 = **(void **)(a1 + 1032);
            uint64_t v105 = *(void *)(v11 + 32) + v104;
            *((void *)v103 + 1) = v104;
            *((void *)v103 + 2) = v105;
            return result;
          }
LABEL_112:
          uint64_t v23 = "Couldn't allocate memory.";
          goto LABEL_113;
        }
        if (*(unsigned char *)(v11 + 272))
        {
          uint64_t v23 = "Mismatch of file parts split across multi-volume archive";
          goto LABEL_90;
        }
        int v86 = malloc_type_realloc(v81, (v50 + 1), 0xD9E89EF8uLL);
        *(void *)(v11 + 80) = v86;
        memcpy(v86, *(const void **)(v11 + 72), (v50 + 1));
        *(void *)(v11 + 88) = v50;
        free(*(void **)(v11 + 256));
        int v87 = malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL);
        *(void *)(v11 + 256) = v87;
        if (!v87) {
          goto LABEL_112;
        }
        void *v87 = v22;
        v87[1] = -1;
        v87[2] = -1;
        *(void *)(v11 + 264) = 0x100000000;
        int v89 = *(_DWORD *)(v11 + 24);
        if ((v89 & 0x400) != 0)
        {
          unint64_t v92 = v122;
          uint64_t v90 = v11 + 20176;
          if ((unint64_t)(v124 + 4) <= v122)
          {
            *(void *)(v11 + 104) = *(void *)v124;
            uint64_t v91 = v124 + 4;
            goto LABEL_102;
          }
          goto LABEL_7;
        }
        uint64_t v90 = v11 + 20176;
        unint64_t v92 = v122;
        uint64_t v91 = v124;
LABEL_102:
        if ((v89 & 0x1000) != 0
          && (sub_2099E0D8C(v91, (void *)v11, v92, COERCE_DOUBLE(0x100000000), v88) & 0x80000000) != 0)
        {
          goto LABEL_7;
        }
        sub_209973BDC(a1, v22 - 7, v92, v15, v16, v17, v18, v19);
        uint64_t v96 = **(void **)(a1 + 1032);
        uint64_t v97 = *(void *)(v11 + 256);
        uint64_t v98 = *(void *)(v11 + 32) + v96;
        *(void *)(v97 + 8) = v96;
        *(void *)(v97 + 16) = v98;
        if (v120 - 3 < 3)
        {
          __int16 v99 = v119;
          goto LABEL_115;
        }
        if (v120 > 2)
        {
          uint64_t v23 = "Unknown file attributes from RAR file's host OS";
LABEL_90:
          int v83 = (_DWORD *)a1;
          int v84 = 79;
          goto LABEL_91;
        }
        if ((v119 & 0x10) != 0) {
          __int16 v99 = 16877;
        }
        else {
          __int16 v99 = -32348;
        }
LABEL_115:
        *(_WORD *)(v11 + 64) = v99;
        *(void *)(v11 + 160) = 0;
        *(void *)(v11 + 864) = 0;
        *(_DWORD *)(v11 + 232) = 0;
        *(_DWORD *)(v90 + 48) = 0;
        *(void *)(v11 + 20232) = 0;
        *(void *)(v11 + 240) = 0;
        *(unsigned char *)(v11 + 237) = 0;
        *(_OWORD *)(v11 + 176) = 0u;
        *(_OWORD *)(v11 + 192) = 0u;
        *(unsigned char *)(v11 + 208) = 1;
        *(unsigned char *)(v11 + 923) = 0;
        *(unsigned char *)(v11 + 920) = 1;
        free(*(void **)(v11 + 224));
        *(void *)(v11 + 224) = 0;
        *(void *)(v11 + 212) = 0x2000000000000;
        *(_OWORD *)(v11 + 440) = 0u;
        *(_OWORD *)(v11 + 456) = 0u;
        *(_OWORD *)(v11 + 472) = 0u;
        *(_OWORD *)(v11 + 488) = 0u;
        *(_OWORD *)(v11 + 504) = 0u;
        *(_OWORD *)(v11 + 520) = 0u;
        *(_OWORD *)(v11 + 536) = 0u;
        *(_OWORD *)(v11 + 552) = 0u;
        *(_OWORD *)(v11 + 568) = 0u;
        *(_OWORD *)(v11 + 584) = 0u;
        *(_OWORD *)(v11 + 600) = 0u;
        *(_OWORD *)(v11 + 616) = 0u;
        *(_OWORD *)(v11 + 632) = 0u;
        *(_OWORD *)(v11 + 648) = 0u;
        *(_OWORD *)(v11 + 664) = 0u;
        *(_OWORD *)(v11 + 680) = 0u;
        *(_OWORD *)(v11 + 696) = 0u;
        *(_OWORD *)(v11 + 712) = 0u;
        *(_OWORD *)(v11 + 728) = 0u;
        *(_OWORD *)(v11 + 744) = 0u;
        *(_OWORD *)(v11 + 760) = 0u;
        *(_OWORD *)(v11 + 776) = 0u;
        *(_OWORD *)(v11 + 792) = 0u;
        *(_OWORD *)(v11 + 808) = 0u;
        *(_OWORD *)(v11 + 824) = 0u;
        *(_DWORD *)(v11 + 840) = 0;
        off_26BD73700(v11 + 928);
        uint64_t result = 0;
        *(_WORD *)(v11 + 921) = 0;
        if (v126 == 122) {
          return result;
        }
        archive_entry_set_mtime(v125, *(void *)(v11 + 48), *(void *)(v11 + 56));
        archive_entry_set_ctime(v125, *(void *)(v11 + 128), *(void *)(v11 + 136));
        archive_entry_set_atime(v125, *(void *)(v11 + 112), *(void *)(v11 + 120));
        archive_entry_set_size(v125, *(void *)(v11 + 40));
        archive_entry_set_mode(v125, *(_WORD *)(v11 + 64));
        if (sub_209975768(v125, (char *)v52, v50, (uint64_t)v57))
        {
          if (*__error() == 12)
          {
            uint64_t v23 = "Can't allocate memory for Pathname";
LABEL_113:
            int v83 = (_DWORD *)a1;
            int v84 = 12;
LABEL_91:
            archive_set_error(v83, v84, v23, v15, v16, v17, v18, v19, v118);
            return 4294967266;
          }
          int v107 = (char *)sub_2099C42E4((uint64_t)v57);
          archive_set_error((_DWORD *)a1, 79, "Pathname cannot be converted from %s to current locale.", v108, v109, v110, v111, v112, v107);
          uint64_t v106 = 4294967276;
        }
        else
        {
          uint64_t v106 = 0;
        }
        if ((*(_WORD *)(v11 + 64) & 0xF000) == 0xA000)
        {
          *(void *)(v11 + 168) = 0;
          archive_entry_set_size(v125, 0);
          uint64_t result = sub_2099E0F40(a1, v125, v13, v113, v114, v115, v116, v117);
          if ((int)result < -20) {
            return result;
          }
          if ((int)v106 >= (int)result) {
            uint64_t result = result;
          }
          else {
            uint64_t result = v106;
          }
        }
        else
        {
          uint64_t result = v106;
        }
        if (!*(void *)(v11 + 168)) {
          *(unsigned char *)(v11 + 237) = 1;
        }
        return result;
      case 3u:
        if (v65 >= v50) {
          goto LABEL_60;
        }
        uint64_t v60 = v65 + 1;
        int v67 = *(char *)(v15 + v65);
        if (v67 < 0)
        {
          if (v60 >= v50) {
            goto LABEL_61;
          }
          char v68 = *(unsigned char *)(v15 + v60);
          uint64_t v60 = (v65 + 2);
          char v69 = v61;
        }
        else
        {
          char v68 = 0;
          char v69 = 0;
        }
        if (v62 < v16)
        {
          uint64_t v72 = 0;
          int v73 = (v67 & 0x7F) + 2;
          int v74 = (char *)(v15 + ((unint64_t)v62 >> 1));
          do
          {
            unsigned int v75 = (char *)v52 + v62 + v72;
            *unsigned int v75 = v69;
            char v76 = *v74++;
            v72 += 2;
            v75[1] = v76 + v68;
            --v73;
          }
          while ((_BYTE)v73 && v72 + (unint64_t)v62 < v16);
          v62 += v72;
        }
        goto LABEL_71;
      default:
        if (v65 < v50)
        {
          int v66 = (char *)v52 + v62;
          *int v66 = 0;
LABEL_55:
          uint64_t v60 = (v65 + 1);
          v62 += 2;
          v66[1] = *(unsigned char *)(v15 + v65);
          goto LABEL_71;
        }
LABEL_60:
        uint64_t v60 = v65;
LABEL_61:
        if (v60 >= v50) {
          goto LABEL_75;
        }
        continue;
    }
  }
}

time_t sub_2099E0D0C(unsigned int a1, double a2, uint32x4_t a3)
{
  memset(&v5.tm_wday, 0, 32);
  a3.i32[0] = a1;
  int8x16_t v3 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a1), (uint32x4_t)xmmword_2099ECB00);
  v3.i32[0] = vshlq_u32(a3, (uint32x4_t)xmmword_2099ECAF0).u32[0];
  *(int8x16_t *)&v5.tm_sec = vandq_s8(v3, (int8x16_t)xmmword_2099ECB10);
  v5.tm_mon = ((a1 >> 21) & 0xF) - 1;
  v5.int tm_year = (a1 >> 25) + 80;
  v5.tm_isdst = -1;
  return mktime(&v5);
}

uint64_t sub_2099E0D8C(unsigned __int16 *a1, void *a2, unint64_t a3, double a4, uint32x4_t a5)
{
  tm v5 = (unsigned int *)(a1 + 1);
  if ((unint64_t)(a1 + 1) > a3) {
    return 0xFFFFFFFFLL;
  }
  double v9 = 0.0;
  memset(&v28, 0, sizeof(v28));
  uint64_t v26 = a2 + 17;
  uint64_t v27 = a2 + 15;
  unsigned int v10 = *a1;
  uint64_t v11 = a2 + 19;
  uint64_t v12 = a2 + 7;
  int v13 = 3;
  do
  {
    int v14 = v13;
    time_t v29 = 0;
    if (v13 == 3)
    {
      time_t v15 = a2[6];
      time_t v29 = v15;
      unsigned int v16 = v10 >> 12;
      if (((v10 >> 12) & 8) == 0) {
        goto LABEL_29;
      }
      if (v15) {
        goto LABEL_11;
      }
    }
    else
    {
      unsigned int v16 = v10 >> (4 * v13);
      if ((v16 & 8) == 0) {
        goto LABEL_29;
      }
    }
    if ((unint64_t)(v5 + 1) > a3) {
      return 0xFFFFFFFFLL;
    }
    time_t v29 = sub_2099E0D0C(*v5++, v9, a5);
LABEL_11:
    uint64_t v17 = v16 & 3;
    if ((unint64_t)v5 + v17 > a3) {
      return 0xFFFFFFFFLL;
    }
    unsigned int v18 = 0;
    if ((v16 & 3) != 0)
    {
      uint64_t v19 = (v17 - 1);
      int v20 = v5;
      do
      {
        int v21 = *(unsigned __int8 *)v20;
        int v20 = (unsigned int *)((char *)v20 + 1);
        unsigned int v18 = (v21 << 16) | (v18 >> 8);
        LODWORD(v17) = v17 - 1;
      }
      while (v17);
      tm v5 = (unsigned int *)((char *)v5 + v19 + 1);
    }
    uint64_t v22 = localtime_r(&v29, &v28);
    unsigned int tm_sec = v22->tm_sec;
    if (v18 <= 0x98967F) {
      uint64_t v24 = tm_sec;
    }
    else {
      uint64_t v24 = tm_sec + 1;
    }
    if ((v16 & 4) != 0)
    {
      v22->unsigned int tm_sec = tm_sec + 1;
      time_t v29 = mktime(v22);
    }
    switch(v14)
    {
      case 3:
        a2[6] = v29;
        uint64_t v25 = v12;
        break;
      case 1:
        a2[14] = v29;
        uint64_t v25 = v27;
        break;
      case 2:
        a2[16] = v29;
        uint64_t v25 = v26;
        break;
      default:
        a2[18] = v29;
        uint64_t v25 = v11;
        break;
    }
    void *v25 = v24;
LABEL_29:
    int v13 = v14 - 1;
  }
  while (v14);
  return 0;
}

uint64_t sub_2099E0F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(uint64_t **)(a1 + 2472);
  uint64_t v12 = *v11;
  int v13 = (char *)sub_2099738A4(a1, *(void *)(*v11 + 32), 0, a4, a5, a6, a7, a8);
  if (!v13) {
    return 4294967266;
  }
  if (!sub_20997EDAC(a2, v13, *(void *)(v12 + 32), a3))
  {
    uint64_t v25 = 0;
LABEL_8:
    sub_209973BDC(a1, *(void *)(v12 + 32), v14, v15, v16, v17, v18, v19);
    return v25;
  }
  if (*__error() != 12)
  {
    uint64_t v26 = (char *)sub_2099C42E4(a3);
    archive_set_error((_DWORD *)a1, 79, "link cannot be converted from %s to current locale.", v27, v28, v29, v30, v31, v26);
    uint64_t v25 = 4294967276;
    goto LABEL_8;
  }
  archive_set_error((_DWORD *)a1, 12, "Can't allocate memory for link", v20, v21, v22, v23, v24, v33);
  return 4294967266;
}

size_t sub_2099E1010(uint64_t a1, size_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (1)
  {
    uint64_t v11 = **(void **)(a1 + 2472);
    size_t result = sub_2099738A4(a1, a2, a3, a4, a5, a6, a7, a8);
    if (!a3) {
      break;
    }
    uint64_t v19 = *a3;
    if (*(unsigned char *)(a1 + 144))
    {
      uint64_t v20 = *(void *)(a1 + 152);
      if (v19 > v20)
      {
        *a3 = v20;
        uint64_t v19 = v20;
      }
    }
    uint64_t v21 = *(void *)(v11 + 168);
    if (v19 > v21)
    {
      *a3 = v21;
      uint64_t v19 = v21;
    }
    if ((v19 & 0x8000000000000000) == 0)
    {
      if (v19 || (*(unsigned char *)v11 & 1) == 0 || (*(unsigned char *)(v11 + 24) & 2) == 0) {
        return result;
      }
      *(unsigned char *)(v11 + 272) = 1;
      int v22 = sub_2099DED9C(a1, *(void *)(a1 + 160), v13, v14, v15, v16, v17, v18);
      if (v22 == 1)
      {
        *(unsigned char *)(v11 + 252) = 1;
        int v22 = sub_2099DED9C(a1, *(void *)(a1 + 160), v23, a4, a5, a6, a7, a8);
      }
      *(unsigned char *)(v11 + 272) = 0;
      if (!v22) {
        continue;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_2099E10E8(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  uint64_t v12 = *(uint64_t **)(a1 + 2472);
  uint64_t v13 = *v12;
  uint64_t v14 = *(char **)(*v12 + 224);
  if (!v14)
  {
    uint64_t v14 = (char *)malloc_type_malloc(*(unsigned int *)(v13 + 216), 0xA97E328uLL);
    *(void *)(v13 + 224) = v14;
    if (!v14)
    {
      uint64_t v26 = "Unable to allocate memory for uncompressed data.";
      uint64_t v27 = (_DWORD *)a1;
      int v28 = 12;
      goto LABEL_15;
    }
  }
  int v15 = *(_DWORD *)(v13 + 856);
  int v16 = v15 & a3;
  int v17 = (v15 & a3) + v8;
  int v18 = v15 + 1;
  if (v17 <= v18)
  {
    uint64_t v20 = &v14[*(unsigned int *)(v13 + 212)];
    uint64_t v21 = (const void *)(*(void *)(v13 + 848) + v16);
    size_t v22 = v8;
    goto LABEL_9;
  }
  if (v18 < v8 || (int v19 = v18 - v16, v18 - v16 < 0))
  {
    uint64_t v26 = "Bad RAR file data";
    uint64_t v27 = (_DWORD *)a1;
    int v28 = 79;
LABEL_15:
    archive_set_error(v27, v28, v26, a4, a5, a6, a7, a8, v30);
    return 4294967266;
  }
  uint64_t v20 = &v14[*(unsigned int *)(v13 + 212)];
  uint64_t v21 = (const void *)(*(void *)(v13 + 848) + v16);
  if (v8 <= v19)
  {
    size_t v22 = v8;
  }
  else
  {
    memcpy(v20, v21, (v18 - v16));
    uint64_t v20 = (char *)(*(void *)(v13 + 224) + (*(_DWORD *)(v13 + 212) + v19));
    uint64_t v21 = *(const void **)(v13 + 848);
    size_t v22 = v8 - v19;
  }
LABEL_9:
  memcpy(v20, v21, v22);
  unsigned int v23 = *(_DWORD *)(v13 + 216);
  unsigned int v24 = *(_DWORD *)(v13 + 212) + v8;
  *(_DWORD *)(v13 + 212) = v24;
  if (v24 >= v23) {
    uint64_t v25 = *(void *)(v13 + 224);
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t result = 0;
  *a2 = v25;
  return result;
}

uint64_t sub_2099E1230(uint64_t a1)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  uint64_t v2 = **(void **)(a1 + 2472);
  int8x16_t v3 = (unint64_t *)(v2 + 20216);
  *(double *)v10.i64 = sub_209979364(a1);
  uint64_t v12 = (int *)(v2 + 20224);
  int v11 = *(_DWORD *)(v2 + 20224);
  signed int v13 = v11 & 0xFFFFFFF8;
  *(_DWORD *)(v2 + 20224) = v11 & 0xFFFFFFF8;
  if ((v11 < 0) ^ v14 | ((v11 & 0xFFFFFFF8) == 0))
  {
    int64x2_t v10 = sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
    signed int v13 = *v12;
    if (!v15 && v13 < 1) {
      goto LABEL_129;
    }
  }
  int v17 = v13 - 1;
  uint64_t v18 = *(void *)(v2 + 20216) >> (v13 - 1);
  *(unsigned char *)(v2 + 923) = v18 & 1;
  int *v12 = v13 - 1;
  if ((v18 & 1) == 0)
  {
    if (v13 > 1
      || ((int64x2_t v10 = sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10), v17 = *v12, !v19)
        ? (BOOL v20 = v17 < 1)
        : (BOOL v20 = 0),
          !v20))
    {
      int v21 = v17 - 1;
      if (((*v3 >> (v17 - 1)) & 1) == 0)
      {
        *(_DWORD *)(v2 + 840) = 0;
        int64x2_t v10 = 0uLL;
        *(_OWORD *)(v2 + 808) = 0u;
        *(_OWORD *)(v2 + 824) = 0u;
        *(_OWORD *)(v2 + 776) = 0u;
        *(_OWORD *)(v2 + 792) = 0u;
        *(_OWORD *)(v2 + 744) = 0u;
        *(_OWORD *)(v2 + 760) = 0u;
        *(_OWORD *)(v2 + 712) = 0u;
        *(_OWORD *)(v2 + 728) = 0u;
        *(_OWORD *)(v2 + 680) = 0u;
        *(_OWORD *)(v2 + 696) = 0u;
        *(_OWORD *)(v2 + 648) = 0u;
        *(_OWORD *)(v2 + 664) = 0u;
        *(_OWORD *)(v2 + 616) = 0u;
        *(_OWORD *)(v2 + 632) = 0u;
        *(_OWORD *)(v2 + 584) = 0u;
        *(_OWORD *)(v2 + 600) = 0u;
        *(_OWORD *)(v2 + 552) = 0u;
        *(_OWORD *)(v2 + 568) = 0u;
        *(_OWORD *)(v2 + 520) = 0u;
        *(_OWORD *)(v2 + 536) = 0u;
        *(_OWORD *)(v2 + 488) = 0u;
        *(_OWORD *)(v2 + 504) = 0u;
        *(_OWORD *)(v2 + 456) = 0u;
        *(_OWORD *)(v2 + 472) = 0u;
        *(_OWORD *)(v2 + 440) = 0u;
      }
      int v22 = 0;
      int *v12 = v21;
      v95[0] = 0;
      v95[1] = 0;
      int v96 = 0;
      while (1)
      {
        int v23 = v21;
        if (v21 <= 3)
        {
          int64x2_t v10 = sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
          int v23 = *v12;
          if (!v24 && v23 < 4) {
            break;
          }
        }
        int v21 = v23 - 4;
        uint64_t v25 = (*v3 >> (v23 - 4)) & 0xF;
        int v26 = v22 + 1;
        *((unsigned char *)v95 + v22) = v25;
        int *v12 = v23 - 4;
        if (v25 == 15)
        {
          if (v23 <= 7)
          {
            int64x2_t v10 = sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
            int v21 = *v12;
            if (!v27 && v21 < 4) {
              goto LABEL_129;
            }
          }
          v21 -= 4;
          unint64_t v28 = *v3 >> v21;
          int *v12 = v21;
          if ((v28 & 0xF) != 0)
          {
            unsigned int v29 = (v28 & 0xF) + 2;
            uint64_t v30 = v28 & 0xF;
            if (v30 + 1 < (unint64_t)(19 - v22)) {
              uint64_t v31 = v30 + 1;
            }
            else {
              uint64_t v31 = (19 - v22);
            }
            bzero((char *)v95 + v22, v31 + 1);
            uint64_t v32 = 0;
            do
              uint64_t v33 = v22 + v32++;
            while (v32 < v29 && v33 < 19);
            int v26 = v22 + v32;
          }
        }
        int v22 = v26;
        if (v26 >= 20)
        {
          unsigned int v94 = 0;
          *(_OWORD *)unint64_t v92 = 0u;
          long long v93 = 0u;
          uint64_t v35 = sub_2099E1D18((_DWORD *)a1, (uint64_t)v92, (uint64_t)v95, 20);
          if (v35)
          {
            uint64_t v43 = v35;
            free(v92[0]);
            free(v94);
            return v43;
          }
          int v56 = 0;
          uint64_t v57 = v2 + 440;
          do
          {
            unsigned int v58 = sub_2099E1F00(a1, (uint64_t)v92, v36, v37, v38, v39, v40, v41, v42);
            if ((v58 & 0x80000000) != 0)
            {
              free(v92[0]);
              free(v94);
              return 4294967266;
            }
            if (v58 > 0xF)
            {
              if (v58 > 0x11)
              {
                int v64 = *v12;
                if (v58 == 18)
                {
                  if (v64 <= 2)
                  {
                    sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    int v64 = *v12;
                    if (!v65 && v64 < 3) {
                      goto LABEL_128;
                    }
                  }
                  int v66 = v64 - 3;
                  int v67 = 3;
                  int v68 = 7;
                }
                else
                {
                  if (v64 <= 6)
                  {
                    sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    int v64 = *v12;
                    if (!v69 && v64 < 7)
                    {
LABEL_128:
                      free(v92[0]);
                      free(v94);
                      goto LABEL_129;
                    }
                  }
                  int v66 = v64 - 7;
                  int v67 = 11;
                  int v68 = 127;
                }
                unint64_t v70 = *v3;
                int *v12 = v66;
                unsigned int v71 = (v68 & (v70 >> v66)) + v67;
                LODWORD(v72) = v71 - 1;
                if (v71 - 1 >= 403 - v56) {
                  uint64_t v72 = (403 - v56);
                }
                else {
                  uint64_t v72 = v72;
                }
                bzero((void *)(v57 + v56), v72 + 1);
                uint64_t v73 = 0;
                do
                {
                  int v74 = v73 + 1;
                  if ((int)v73 + 1 >= v71) {
                    break;
                  }
                  uint64_t v75 = v56 + v73++;
                }
                while (v75 < 403);
                v56 += v74;
              }
              else
              {
                if (!v56)
                {
                  free(v92[0]);
                  free(v94);
                  int v55 = "Internal error extracting RAR file.";
                  goto LABEL_126;
                }
                int v59 = *v12;
                if (v58 == 16)
                {
                  if (v59 <= 2)
                  {
                    int64x2_t v42 = sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    int v59 = *v12;
                    if (!v60 && v59 < 3) {
                      goto LABEL_128;
                    }
                  }
                  int v61 = v59 - 3;
                  int v62 = 3;
                  int v63 = 7;
                }
                else
                {
                  if (v59 <= 6)
                  {
                    int64x2_t v42 = sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    int v59 = *v12;
                    if (!v76 && v59 < 7) {
                      goto LABEL_128;
                    }
                  }
                  int v61 = v59 - 7;
                  int v62 = 11;
                  int v63 = 127;
                }
                unint64_t v77 = *v3;
                int *v12 = v61;
                uint64_t v78 = 0;
                unsigned int v79 = (v63 & (v77 >> v61)) + v62;
                char v80 = *(unsigned char *)(v2 + 439 + v56);
                do
                {
                  *(unsigned char *)(v57 + v56 + v78) = v80;
                  int v81 = v78 + 1;
                  if ((int)v78 + 1 >= v79) {
                    break;
                  }
                  uint64_t v82 = v56 + v78++;
                }
                while (v82 < 403);
                v56 += v81;
              }
            }
            else
            {
              *(unsigned char *)(v2 + v56 + 440) = (*(unsigned char *)(v2 + v56 + 440) + v58) & 0xF;
              ++v56;
            }
          }
          while (v56 < 404);
          free(v92[0]);
          free(v94);
          uint64_t v43 = sub_2099E1D18((_DWORD *)a1, v2 + 280, v2 + 440, 299);
          if (v43) {
            return v43;
          }
          uint64_t v43 = sub_2099E1D18((_DWORD *)a1, v2 + 320, v2 + 739, 60);
          if (v43) {
            return v43;
          }
          uint64_t v43 = sub_2099E1D18((_DWORD *)a1, v2 + 360, v2 + 799, 17);
          if (v43) {
            return v43;
          }
          uint64_t v43 = sub_2099E1D18((_DWORD *)a1, v2 + 400, v2 + 816, 28);
          if (v43) {
            return v43;
          }
          goto LABEL_109;
        }
      }
    }
    goto LABEL_129;
  }
  if (v13 <= 7)
  {
    int64x2_t v10 = sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
    int v17 = *v12;
    if (!v44 && v17 < 7) {
      goto LABEL_129;
    }
  }
  int v46 = v17 - 7;
  unint64_t v47 = *v3 >> (v17 - 7);
  int *v12 = v17 - 7;
  if ((v47 & 0x20) != 0)
  {
    if (v17 <= 14)
    {
      int64x2_t v10 = sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
      int v46 = *v12;
      if (!v48 && v46 < 8) {
        goto LABEL_129;
      }
    }
    v46 -= 8;
    *(_DWORD *)(v2 + 232) = ((*(void *)(v2 + 20216) >> v46) << 20) + 0x100000;
    int *v12 = v46;
  }
  if ((v47 & 0x40) != 0)
  {
    if (v46 > 7
      || ((sub_2099E1A14(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10), int v46 = *v12, !v50)
        ? (BOOL v51 = v46 < 8)
        : (BOOL v51 = 0),
          !v51))
    {
      int v52 = v46 - 8;
      int v53 = (*(void *)(v2 + 20216) >> v52);
      *(_DWORD *)(v2 + 956) = v53;
      *(_DWORD *)(v2 + 924) = v53;
      int *v12 = v52;
      if ((v47 & 0x20) == 0) {
        goto LABEL_50;
      }
      goto LABEL_59;
    }
LABEL_129:
    archive_set_error((_DWORD *)a1, 79, "Truncated RAR file data", v5, v6, v7, v8, v9, (char *)v92[0]);
    *(unsigned char *)(v2 + 208) = 0;
    return 4294967266;
  }
  *(_DWORD *)(v2 + 924) = 2;
  if ((v47 & 0x20) == 0)
  {
LABEL_50:
    if (*(unsigned char *)(v2 + 921))
    {
      if (!off_26BD73728(v2 + 20112)) {
        goto LABEL_114;
      }
      goto LABEL_109;
    }
    int v55 = "Invalid PPMd sequence";
LABEL_126:
    int v89 = (_DWORD *)a1;
    int v90 = 79;
    goto LABEL_127;
  }
LABEL_59:
  if ((v47 & 0x10) != 0) {
    int v54 = 3 * (v47 & 0x1F) - 29;
  }
  else {
    int v54 = (v47 & 0x1F) + 1;
  }
  if (v54 == 1)
  {
    int v55 = "Truncated RAR file data";
    goto LABEL_126;
  }
  off_26BD73700(v2 + 928);
  *(void *)(v2 + 20160) = a1;
  *(void *)(v2 + 20168) = sub_2099E1C80;
  ((void (*)(void *))off_26BD73718[0])((void *)(v2 + 20112));
  *(void *)(v2 + 20152) = v2 + 20160;
  off_26BD736F0(v2 + 928);
  unsigned int v83 = *(_DWORD *)(v2 + 232);
  if (!v83)
  {
    int v55 = "Invalid zero dictionary size";
    goto LABEL_126;
  }
  if (!off_26BD736F8(v2 + 928, v83))
  {
    int v55 = "Out of memory";
LABEL_123:
    int v89 = (_DWORD *)a1;
    int v90 = 12;
LABEL_127:
    archive_set_error(v89, v90, v55, v5, v6, v7, v8, v9, (char *)v92[0]);
    return 4294967266;
  }
  if (!off_26BD73728(v2 + 20112))
  {
LABEL_114:
    int v55 = "Unable to initialize PPMd range decoder";
    goto LABEL_126;
  }
  off_26BD73708(v2 + 928, v54);
  *(unsigned char *)(v2 + 921) = 1;
LABEL_109:
  if (*(_DWORD *)(v2 + 232) && *(void *)(v2 + 848)) {
    goto LABEL_120;
  }
  uint64_t v84 = *(void *)(v2 + 40);
  if (v84 < 0x400000)
  {
    unsigned int v86 = v84 | (v84 >> 1) | ((v84 | (v84 >> 1)) >> 2);
    unsigned int v87 = v86 | (v86 >> 4) | ((v86 | (v86 >> 4)) >> 8);
    unsigned int v85 = 2 * ((v87 | HIWORD(v87)) - ((v87 | HIWORD(v87)) >> 1));
    if (!v85)
    {
      int v55 = "Zero window size is invalid.";
      goto LABEL_126;
    }
  }
  else
  {
    unsigned int v85 = 0x400000;
  }
  uint32x4_t v88 = malloc_type_realloc(*(void **)(v2 + 848), v85, 0xA602A866uLL);
  if (!v88)
  {
    int v55 = "Unable to allocate memory for uncompressed data.";
    goto LABEL_123;
  }
  *(void *)(v2 + 848) = v88;
  *(_DWORD *)(v2 + 232) = v85;
  bzero(v88, v85);
  *(_DWORD *)(v2 + 856) = *(_DWORD *)(v2 + 232) - 1;
LABEL_120:
  uint64_t v43 = 0;
  *(unsigned char *)(v2 + 920) = 0;
  return v43;
}

int64x2_t sub_2099E1A14(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int64x2_t result)
{
  int v11 = **(int64x2_t ***)(a1 + 2472);
  int v12 = *((_DWORD *)a2 + 2);
  int v13 = 64 - v12;
  char v14 = (uint64_t *)(a2 + 2);
  int64x2_t v15 = (int64x2_t)xmmword_2099ECB50;
  while (2)
  {
    switch(v13 >> 3)
    {
      case 0:
        return result;
      case 6:
        uint64_t v16 = *v14;
        uint64_t v17 = *v14 - 6;
        if (*v14 < 6) {
          goto LABEL_10;
        }
        int v21 = (unsigned __int8 *)a2[3];
        *a2 = (*a2 << 48) | ((unint64_t)*v21 << 40) | ((unint64_t)v21[1] << 32) | ((unint64_t)v21[2] << 24) | ((unint64_t)v21[3] << 16) | ((unint64_t)v21[4] << 8) | v21[5];
        a2[3] = (unint64_t)(v21 + 6);
        int64x2_t v22 = (int64x2_t)xmmword_2099ECB20;
        int v23 = 48;
        goto LABEL_19;
      case 7:
        uint64_t v16 = *v14;
        uint64_t v17 = *v14 - 7;
        if (*v14 < 7) {
          goto LABEL_10;
        }
        int v24 = (unsigned __int8 *)a2[3];
        *a2 = (*a2 << 56) | ((unint64_t)*v24 << 48) | ((unint64_t)v24[1] << 40) | ((unint64_t)v24[2] << 32) | ((unint64_t)v24[3] << 24) | ((unint64_t)v24[4] << 16) | ((unint64_t)v24[5] << 8) | v24[6];
        a2[3] = (unint64_t)(v24 + 7);
        int64x2_t v22 = (int64x2_t)xmmword_2099ECB30;
        int v23 = 56;
        goto LABEL_19;
      case 8:
        uint64_t v16 = *v14;
        uint64_t v17 = *v14 - 8;
        if (*v14 < 8) {
          goto LABEL_10;
        }
        uint64_t v25 = (unint64_t *)a2[3];
        *a2 = bswap64(*v25);
        a2[3] = (unint64_t)(v25 + 1);
        int64x2_t v22 = (int64x2_t)xmmword_2099ECB40;
        int v23 = 64;
LABEL_19:
        a2[2] = v17;
        *((_DWORD *)a2 + 2) = v12 + v23;
        uint64_t result = vaddq_s64(v11[10], v22);
        v11[10] = result;
        return result;
      default:
        uint64_t v16 = *v14;
LABEL_10:
        if (v16 >= 1)
        {
          uint64_t v18 = (unsigned __int8 *)a2[3];
          goto LABEL_17;
        }
        uint64_t v19 = v11[10].i64[0];
        if (v19 >= 1)
        {
          sub_209973BDC(a1, v19, a3, a4, a5, a6, a7, a8);
          v11[10].i64[0] = 0;
        }
        uint64_t v18 = (unsigned __int8 *)sub_2099E1010(a1, 1uLL, v14, a4, a5, a6, a7, a8);
        a2[3] = (unint64_t)v18;
        if (v18)
        {
          uint64_t v16 = *v14;
          if (*v14)
          {
            int v12 = *((_DWORD *)a2 + 2);
            int64x2_t v15 = (int64x2_t)xmmword_2099ECB50;
LABEL_17:
            unint64_t v20 = *a2;
            a2[3] = (unint64_t)(v18 + 1);
            *a2 = *v18 | (v20 << 8);
            a2[2] = v16 - 1;
            v12 += 8;
            *((_DWORD *)a2 + 2) = v12;
            v13 -= 8;
            uint64_t result = vaddq_s64(v11[10], v15);
            v11[10] = result;
            continue;
          }
        }
        return result;
    }
  }
}

uint64_t sub_2099E1C80(uint64_t *a1, int64x2_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (_DWORD *)*a1;
  uint64_t v10 = **(void **)(*a1 + 2472);
  int v12 = (int *)(v10 + 20224);
  int v11 = *(_DWORD *)(v10 + 20224);
  if (v11 <= 7
    && ((sub_2099E1A14(*a1, (unint64_t *)(v10 + 20216), a4, a5, a6, a7, a8, a9, a2), int v11 = *v12, !v18)
      ? (BOOL v19 = v11 <= 7)
      : (BOOL v19 = 0),
        v19))
  {
    archive_set_error(v9, 79, "Truncated RAR file data", v13, v14, v15, v16, v17, v23);
    LOBYTE(v21) = 0;
    *(unsigned char *)(v10 + 208) = 0;
  }
  else
  {
    int v20 = v11 - 8;
    uint64_t v21 = *(void *)(v10 + 20216) >> (v11 - 8);
    int *v12 = v20;
  }
  return v21;
}

uint64_t sub_2099E1D18(_DWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)(a2 + 8) = 0;
  if ((sub_2099E20CC(a2) & 0x80000000) != 0)
  {
    int v27 = "Unable to allocate memory for node data.";
    unint64_t v28 = a1;
LABEL_27:
    int v29 = 12;
LABEL_28:
    archive_set_error(v28, v29, v27, v8, v9, v10, v11, v12, v30);
    return 4294967266;
  }
  else
  {
    uint64_t v31 = a1;
    unsigned int v13 = 0;
    int v14 = 1;
    *(_DWORD *)(a2 + 8) = 1;
    *(void *)(a2 + 16) = 0x800000007FFFFFFFLL;
    uint64_t v15 = a4;
    int v16 = 2;
    int v17 = a4;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v18 = 0;
        do
        {
          if (v14 == *(unsigned __int8 *)(a3 + v18))
          {
            int v32 = v17;
            free(*(void **)(a2 + 32));
            *(void *)(a2 + 32) = 0;
            if (*(_DWORD *)(a2 + 20) < v14) {
              *(_DWORD *)(a2 + 20) = v14;
            }
            if (*(_DWORD *)(a2 + 16) > v14) {
              *(_DWORD *)(a2 + 16) = v14;
            }
            int v19 = 0;
            uint64_t v20 = *(void *)a2;
            unsigned int v21 = v16;
            do
            {
              int64x2_t v22 = (_DWORD *)(v20 + 8 * v19);
              if (*v22 == v22[1]) {
                goto LABEL_24;
              }
              uint64_t v23 = (v13 >> (v21 - 2)) & 1;
              int v24 = v22[v23];
              if (v24 < 0)
              {
                if ((sub_2099E20CC(a2) & 0x80000000) != 0)
                {
                  int v27 = "Unable to allocate memory for node data.";
                  unint64_t v28 = v31;
                  goto LABEL_27;
                }
                int v24 = *(_DWORD *)(a2 + 8);
                *(_DWORD *)(a2 + 8) = v24 + 1;
                uint64_t v20 = *(void *)a2;
                *(_DWORD *)(*(void *)a2 + 8 * v19 + 4 * v23) = v24;
              }
              --v21;
              int v19 = v24;
            }
            while (v21 > 1);
            uint64_t v25 = (int32x2_t *)(v20 + 8 * v24);
            if (v25->i32[0] != -1 || v25->i32[1] != -2)
            {
LABEL_24:
              int v27 = "Prefix found";
              unint64_t v28 = v31;
              int v29 = 79;
              goto LABEL_28;
            }
            int32x2_t *v25 = vdup_n_s32(v18);
            if (v32 < 2) {
              return 0;
            }
            ++v13;
            int v17 = v32 - 1;
            uint64_t v15 = a4;
          }
          ++v18;
        }
        while (v18 != v15);
      }
      if (v17 < 1) {
        break;
      }
      v13 *= 2;
      ++v14;
      ++v16;
    }
    while (v14 != 16);
    return 0;
  }
}

uint64_t sub_2099E1F00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int64x2_t a9)
{
  if (!*(void *)(a2 + 32))
  {
    int v27 = *(_DWORD *)(a2 + 20);
    if (v27 < *(_DWORD *)(a2 + 16) || v27 > 10) {
      int v27 = 10;
    }
    *(_DWORD *)(a2 + 24) = v27;
    int v29 = malloc_type_calloc(1uLL, 8 << v27, 0x100004000313F17uLL);
    *(void *)(a2 + 32) = v29;
    if (sub_2099E215C((_DWORD *)a1, (uint64_t *)a2, 0, (uint64_t)v29, 0, *(unsigned int *)(a2 + 24), v30, v31))return 0xFFFFFFFFLL; {
  }
    }
  uint64_t v11 = **(void **)(a1 + 2472);
  uint64_t v12 = (void *)(v11 + 20216);
  int v14 = (int *)(v11 + 20224);
  int v13 = *(_DWORD *)(v11 + 20224);
  int v15 = *(_DWORD *)(a2 + 24);
  if (v13 < v15)
  {
    a9 = sub_2099E1A14(a1, (unint64_t *)(v11 + 20216), a3, a4, a5, a6, a7, a8, a9);
    int v13 = *v14;
    int v15 = *(_DWORD *)(a2 + 24);
    if (!v16 && v13 < v15)
    {
LABEL_23:
      archive_set_error((_DWORD *)a1, 79, "Truncated RAR file data", a4, a5, a6, a7, a8, v33);
      *(unsigned char *)(v11 + 208) = 0;
      return 0xFFFFFFFFLL;
    }
  }
  int v18 = v13 - v15;
  int v19 = (int *)(*(void *)(a2 + 32)
              + 8 * (dword_2099ECB60[v15] & (*v12 >> (v13 - v15))));
  int v20 = *v19;
  if (*v19 < 0)
  {
LABEL_15:
    archive_set_error((_DWORD *)a1, 79, "Invalid prefix code in bitstream", a4, a5, a6, a7, a8, v33);
    return 0xFFFFFFFFLL;
  }
  uint64_t v21 = v19[1];
  if (v20 <= v15)
  {
    *int v14 = v13 - v20;
  }
  else
  {
    *int v14 = v18;
    uint64_t v22 = *(void *)a2;
    int v23 = v18;
    while (1)
    {
      int v24 = (unsigned int *)(v22 + 8 * (int)v21);
      if (*v24 == v24[1]) {
        return *v24;
      }
      if (v23 <= 0)
      {
        a9 = sub_2099E1A14(a1, (unint64_t *)(v11 + 20216), a3, a4, a5, a6, a7, a8, a9);
        int v23 = *v14;
        if (!v25 && v23 <= 0) {
          goto LABEL_23;
        }
      }
      uint64_t v26 = (*v12 >> --v23) & 1;
      *int v14 = v23;
      uint64_t v22 = *(void *)a2;
      LODWORD(v21) = *(_DWORD *)(*(void *)a2 + 8 * (int)v21 + 4 * v26);
      if ((v21 & 0x80000000) != 0) {
        goto LABEL_15;
      }
    }
  }
  return v21;
}

uint64_t sub_2099E20CC(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  int v3 = *(_DWORD *)(a1 + 12);
  uint64_t v4 = *(void **)a1;
  if (v3 != v2) {
    goto LABEL_7;
  }
  if (v3 <= 0) {
    unsigned int v5 = 256;
  }
  else {
    unsigned int v5 = 2 * v3;
  }
  uint64_t v4 = malloc_type_realloc(v4, 8 * v5, 0x100004000313F17uLL);
  if (v4)
  {
    *(void *)a1 = v4;
    *(_DWORD *)(a1 + 12) = v5;
    int v2 = *(_DWORD *)(a1 + 8);
LABEL_7:
    *((_DWORD *)v4 + 2 * v2) = -1;
    *((_DWORD *)v4 + 2 * *(int *)(a1 + 8) + 1) = -2;
    return 1;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_2099E215C(_DWORD *a1, uint64_t *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *a2;
  if (*a2)
  {
    uint64_t v10 = a3;
    if ((a3 & 0x80000000) != 0)
    {
      unsigned int v15 = 0;
    }
    else
    {
      int v11 = a6;
      int v12 = a5;
      int v13 = (_DWORD *)a4;
      unsigned int v15 = 0;
      int v16 = -(int)a5;
      while (*((_DWORD *)a2 + 2) > (int)v10)
      {
        int v17 = 1 << (v11 + v16);
        int v18 = (_DWORD *)(v9 + 8 * v10);
        if (*v18 == v18[1])
        {
          if (v11 - 31 != v12)
          {
            if (v17 <= 1) {
              uint64_t v23 = 1;
            }
            else {
              uint64_t v23 = v17;
            }
            int v24 = v13 + 1;
            do
            {
              *(v24 - 1) = v12;
              _DWORD *v24 = *v18;
              v24 += 2;
              --v23;
            }
            while (v23);
          }
          int v21 = 0;
          return v21 | v15;
        }
        if (v11 == v12)
        {
          int v21 = 0;
          *int v13 = v11 + 1;
          v13[1] = v10;
          return v21 | v15;
        }
        ++v12;
        int v19 = sub_2099E215C(a1, a2);
        uint64_t v9 = *a2;
        uint64_t v10 = *(unsigned int *)(*a2 + 8 * v10 + 4);
        if (v17 >= 0) {
          int v20 = 1 << (v11 + v16);
        }
        else {
          int v20 = v17 + 1;
        }
        v13 += 2 * (v20 >> 1);
        v15 |= v19;
        LOBYTE(v16) = v16 - 1;
        if ((v10 & 0x80000000) != 0) {
          break;
        }
      }
    }
    archive_set_error(a1, 79, "Invalid location to Huffman tree specified.", a4, a5, a6, a7, a8, v25);
  }
  else
  {
    archive_set_error(a1, 79, "Huffman tree was not created.", a4, a5, a6, a7, a8, v25);
    unsigned int v15 = 0;
  }
  int v21 = -30;
  return v21 | v15;
}

uint64_t archive_write_set_format_gnutar(uint64_t a1)
{
  int v2 = malloc_type_calloc(1uLL, 0x68uLL, 0x1070040395D5FD2uLL);
  if (v2)
  {
    uint64_t v8 = v2;
    uint64_t result = 0;
    *(void *)(a1 + 264) = v8;
    *(void *)(a1 + 272) = "gnutar";
    *(void *)(a1 + 288) = sub_2099E23A4;
    *(void *)(a1 + 304) = sub_2099E244C;
    *(void *)(a1 + 312) = sub_2099E2A7C;
    *(void *)(a1 + 320) = sub_2099E2AC8;
    *(void *)(a1 + 328) = sub_2099E2AD0;
    *(void *)(a1 + 296) = sub_2099E2B00;
    *(_DWORD *)(a1 + 16) = 196612;
    *(void *)(a1 + 24) = "GNU tar";
  }
  else
  {
    archive_set_error((_DWORD *)a1, 12, "Can't allocate gnutar data", v3, v4, v5, v6, v7, v10);
    return 4294967266;
  }
  return result;
}

uint64_t sub_2099E23A4(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = *(void *)(a1 + 264);
  if (strcmp(__s1, "hdrcharset")) {
    return 4294967276;
  }
  if (a3 && *a3)
  {
    int v12 = sub_2099C4288(a1, a3, 0);
    *(void *)(v5 + 80) = v12;
    if (v12) {
      return 0;
    }
    else {
      return 4294967266;
    }
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, *(char **)(a1 + 272));
    return 4294967271;
  }
}

uint64_t sub_2099E244C(uint64_t a1, uint64_t *a2)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = *(void *)(v4 + 80);
  if (!v5)
  {
    if (*(_DWORD *)(v4 + 96))
    {
      uint64_t v5 = *(void *)(v4 + 88);
    }
    else
    {
      uint64_t v5 = sub_209976040();
      *(void *)(v4 + 88) = v5;
      *(_DWORD *)(v4 + 96) = 1;
    }
  }
  if (archive_entry_hardlink((uint64_t)a2)
    || archive_entry_symlink((uint64_t)a2)
    || archive_entry_filetype((uint64_t)a2) != 0x8000)
  {
    archive_entry_set_size((uint64_t)a2, 0);
  }
  if (archive_entry_filetype((uint64_t)a2) == 0x4000)
  {
    uint64_t v6 = (const char *)archive_entry_pathname(a2);
    if (v6)
    {
      uint64_t v7 = (char *)v6;
      if (*v6)
      {
        if (v6[strlen(v6) - 1] != 47)
        {
          __dst = 0;
          uint64_t v72 = 0;
          uint64_t v73 = 0;
          size_t v8 = strlen(v7);
          if (!sub_209974664((void **)&__dst, v8 + 2))
          {
            archive_set_error((_DWORD *)a1, 12, "Can't allocate ustar data", v9, v10, v11, v12, v13, v70);
            sub_20997954C((uint64_t)&__dst);
            return 4294967266;
          }
          uint64_t v72 = 0;
          sub_209974714((uint64_t *)&__dst, v7, v8);
          sub_2099C4050((uint64_t *)&__dst, 47);
          archive_entry_copy_pathname((uint64_t)a2, __dst);
          sub_20997954C((uint64_t)&__dst);
        }
      }
    }
  }
  int v14 = (uint64_t *)(v4 + 40);
  if (!sub_20997DF08(a2, (void *)(v4 + 32), (void *)(v4 + 40), v5))
  {
    int v21 = 0;
    goto LABEL_20;
  }
  if (*__error() != 12)
  {
    uint64_t v22 = (char *)archive_entry_pathname(a2);
    sub_2099C42E4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v23, v24, v25, v26, v27, v22);
    int v21 = -20;
LABEL_20:
    if (sub_20997E26C(a2, (void *)(v4 + 48), (void *)(v4 + 56), v5))
    {
      if (*__error() == 12)
      {
        int v20 = "Can't allocate memory for Uname";
        goto LABEL_35;
      }
      unint64_t v28 = (char *)archive_entry_uname(a2);
      sub_2099C42E4(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate uname '%s' to %s", v29, v30, v31, v32, v33, v28);
      int v21 = -20;
    }
    if (sub_20997DD3C(a2, (void *)(v4 + 64), (void *)(v4 + 72), v5))
    {
      if (*__error() == 12)
      {
        int v20 = "Can't allocate memory for Gname";
        goto LABEL_35;
      }
      uint32x4_t v34 = (char *)archive_entry_gname(a2);
      sub_2099C42E4(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate gname '%s' to %s", v35, v36, v37, v38, v39, v34);
      int v21 = -20;
    }
    uint64_t v40 = (unint64_t *)(v4 + 24);
    if (sub_20997DE30((uint64_t)a2, (void *)(v4 + 16), (void *)(v4 + 24), v5))
    {
      if (*__error() == 12)
      {
LABEL_34:
        int v20 = "Can't allocate memory for Linkname";
        goto LABEL_35;
      }
      uint64_t v41 = (char *)archive_entry_hardlink((uint64_t)a2);
      sub_2099C42E4(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v42, v43, v44, v45, v46, v41);
      int v21 = -20;
    }
    unint64_t v47 = *v40;
    if (!*v40)
    {
      if (sub_20997E104((uint64_t)a2, (void *)(v4 + 16), (void *)(v4 + 24), v5))
      {
        if (*__error() == 12) {
          goto LABEL_34;
        }
        int v50 = (char *)archive_entry_hardlink((uint64_t)a2);
        sub_2099C42E4(v5);
        archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v51, v52, v53, v54, v55, v50);
        int v21 = -20;
      }
      unint64_t v47 = *v40;
    }
    if (v47 >= 0x65)
    {
      int v56 = v21;
      uint64_t v57 = (uint64_t *)archive_entry_new2(a1);
      archive_entry_set_uname((uint64_t)v57, "root");
      archive_entry_set_gname((uint64_t)v57, "wheel");
      archive_entry_set_pathname((uint64_t)v57, "././@LongLink");
      archive_entry_set_size((uint64_t)v57, v47 + 1);
      uint64_t v48 = sub_2099E2B30(a1, (char *)&__dst, v57, 75);
      unsigned int v58 = (void **)v57;
      int v21 = v56;
      archive_entry_free(v58);
      if ((int)v48 < -20) {
        goto LABEL_36;
      }
      uint64_t v48 = sub_2099C9728(a1, (uint64_t)&__dst, 512);
      if ((int)v48 < -20) {
        goto LABEL_36;
      }
      uint64_t v48 = sub_2099C9728(a1, *(void *)(v4 + 16), v47 + 1);
      if ((int)v48 < -20) {
        goto LABEL_36;
      }
      uint64_t v48 = sub_2099C978C((void *)a1, ~(_WORD)v47 & 0x1FF);
      if ((int)v48 < -20) {
        goto LABEL_36;
      }
    }
    uint64_t v59 = *v14;
    if ((unint64_t)*v14 >= 0x65)
    {
      uint64_t v60 = *(void *)(v4 + 32);
      int v61 = (uint64_t *)archive_entry_new2(a1);
      archive_entry_set_uname((uint64_t)v61, "root");
      archive_entry_set_gname((uint64_t)v61, "wheel");
      archive_entry_set_pathname((uint64_t)v61, "././@LongLink");
      archive_entry_set_size((uint64_t)v61, v59 + 1);
      uint64_t v48 = sub_2099E2B30(a1, (char *)&__dst, v61, 76);
      archive_entry_free((void **)v61);
      if ((int)v48 < -20) {
        goto LABEL_36;
      }
      uint64_t v48 = sub_2099C9728(a1, (uint64_t)&__dst, 512);
      if ((int)v48 < -20) {
        goto LABEL_36;
      }
      uint64_t v48 = sub_2099C9728(a1, v60, v59 + 1);
      if ((int)v48 < -20) {
        goto LABEL_36;
      }
      uint64_t v48 = sub_2099C978C((void *)a1, ~(_WORD)v59 & 0x1FF);
      if ((int)v48 < -20) {
        goto LABEL_36;
      }
    }
    if (archive_entry_hardlink((uint64_t)a2))
    {
      int v62 = 49;
    }
    else
    {
      HIDWORD(v69) = archive_entry_filetype((uint64_t)a2);
      LODWORD(v69) = HIDWORD(v69) - 4096;
      unsigned int v68 = v69 >> 12;
      if (v68 >= 0xA || ((0x2ABu >> v68) & 1) == 0)
      {
        sub_2099CCD58((_DWORD *)a1, a2);
        uint64_t v48 = 4294967271;
        goto LABEL_36;
      }
      int v62 = dword_2099ECF64[v68];
    }
    uint64_t v63 = sub_2099E2B30(a1, (char *)&__dst, a2, v62);
    uint64_t v48 = v63;
    if ((int)v63 >= -20)
    {
      int v64 = v63;
      uint64_t v65 = sub_2099C9728(a1, (uint64_t)&__dst, 512);
      uint64_t v48 = v65;
      if ((int)v65 >= -20)
      {
        if (v21 >= v64) {
          int v66 = v64;
        }
        else {
          int v66 = v21;
        }
        if ((int)v65 >= v66) {
          uint64_t v48 = v66;
        }
        else {
          uint64_t v48 = v65;
        }
        uint64_t v67 = archive_entry_size((uint64_t)a2);
        *(void *)uint64_t v4 = v67;
        *(void *)(v4 + 8) = -(int)v67 & 0x1FFLL;
      }
    }
    goto LABEL_36;
  }
  int v20 = "Can't allocate memory for Pathame";
LABEL_35:
  archive_set_error((_DWORD *)a1, 12, v20, v15, v16, v17, v18, v19, v70);
  uint64_t v48 = 4294967266;
LABEL_36:
  archive_entry_free(0);
  return v48;
}

uint64_t sub_2099E2A7C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = *v3;
  }
  LODWORD(result) = sub_2099C9728(a1, a2, v4);
  *v3 -= v4;
  if (result) {
    return (int)result;
  }
  else {
    return v4;
  }
}

uint64_t sub_2099E2AC8(void *a1)
{
  return sub_2099C978C(a1, 0x400uLL);
}

uint64_t sub_2099E2AD0(uint64_t a1)
{
  *(void *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_2099E2B00(void *a1)
{
  size_t v1 = (void *)a1[33];
  uint64_t result = sub_2099C978C(a1, v1[1] + *v1);
  void *v1 = 0;
  v1[1] = 0;
  return result;
}

uint64_t sub_2099E2B30(uint64_t a1, char *__dst, uint64_t *a3, int a4)
{
  uint64_t v8 = *(void *)(a1 + 264);
  memcpy(__dst, &unk_2099ECD64, 0x200uLL);
  unsigned int v9 = a4 - 75;
  if ((a4 - 75) > 1)
  {
    uint64_t v10 = *(const char **)(v8 + 32);
    size_t v11 = *(void *)(v8 + 40);
  }
  else
  {
    uint64_t v10 = (const char *)archive_entry_pathname(a3);
    size_t v11 = strlen(v10);
  }
  if (v11 >= 0x64) {
    size_t v12 = 100;
  }
  else {
    size_t v12 = v11;
  }
  memcpy(__dst, v10, v12);
  unint64_t v13 = *(void *)(v8 + 24);
  if (v13)
  {
    if (v13 >= 0x64) {
      size_t v14 = 100;
    }
    else {
      size_t v14 = *(void *)(v8 + 24);
    }
    memcpy(__dst + 157, *(const void **)(v8 + 16), v14);
  }
  if (v9 > 1)
  {
    uint64_t v15 = *(const char **)(v8 + 48);
    size_t v16 = *(void *)(v8 + 56);
    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v15 = (const char *)archive_entry_uname(a3);
    size_t v16 = strlen(v15);
    if (!v16) {
      goto LABEL_20;
    }
  }
  if (v16 >= 0x20) {
    size_t v17 = 32;
  }
  else {
    size_t v17 = v16;
  }
  memcpy(__dst + 265, v15, v17);
LABEL_20:
  if (v9 > 1)
  {
    uint64_t v18 = *(const char **)(v8 + 64);
    size_t v19 = *(void *)(v8 + 72);
    if (!v19) {
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v18 = (const char *)archive_entry_gname(a3);
    size_t v19 = strlen(v18);
    if (!v19) {
      goto LABEL_28;
    }
  }
  if (strlen(v18) <= 0x20) {
    size_t v20 = v19;
  }
  else {
    size_t v20 = 32;
  }
  memcpy(__dst + 297, v18, v20);
LABEL_28:
  unint64_t v21 = archive_entry_mode((uint64_t)a3) & 0xFFF;
  uint64_t v22 = __dst + 107;
  for (unsigned int i = 8; i > 1; --i)
  {
    unint64_t v24 = v21;
    *((unsigned char *)v22 - 1) = v21 & 7 | 0x30;
    uint64_t v22 = (_DWORD *)((char *)v22 - 1);
    v21 >>= 3;
  }
  if (v24 >= 8)
  {
    *(_DWORD *)((char *)v22 + 3) = 926365495;
    *uint64_t v22 = 926365495;
  }
  uint64_t v25 = archive_entry_uid((uint64_t)a3);
  if (sub_2099E2F50(v25, (uint64_t)(__dst + 108), 7uLL, 8))
  {
    uint64_t v26 = (char *)archive_entry_uid((uint64_t)a3);
    archive_set_error((_DWORD *)a1, 34, "Numeric user ID %jd too large", v27, v28, v29, v30, v31, v26);
    uint64_t v32 = 4294967271;
  }
  else
  {
    uint64_t v32 = 0;
  }
  uint64_t v33 = archive_entry_gid((uint64_t)a3);
  if (sub_2099E2F50(v33, (uint64_t)(__dst + 116), 7uLL, 8))
  {
    uint32x4_t v34 = (char *)archive_entry_gid((uint64_t)a3);
    archive_set_error((_DWORD *)a1, 34, "Numeric group ID %jd too large", v35, v36, v37, v38, v39, v34);
    uint64_t v32 = 4294967271;
  }
  uint64_t v40 = archive_entry_size((uint64_t)a3);
  if (sub_2099E2F50(v40, (uint64_t)(__dst + 124), 0xBuLL, 12))
  {
    archive_set_error((_DWORD *)a1, 34, "File size out of range", v41, v42, v43, v44, v45, v84);
    uint64_t v32 = 4294967271;
  }
  uint64_t v46 = archive_entry_mtime((uint64_t)a3);
  unint64_t v47 = v46 & ~(v46 >> 63);
  uint64_t v48 = __dst + 147;
  for (unsigned int j = 12; j > 1; --j)
  {
    unint64_t v50 = v47;
    *--uint64_t v48 = v47 & 7 | 0x30;
    v47 >>= 3;
  }
  if (v50 >= 8) {
    memset(v48, 55, 11);
  }
  if (archive_entry_filetype((uint64_t)a3) == 24576
    || archive_entry_filetype((uint64_t)a3) == 0x2000)
  {
    int v51 = archive_entry_rdevmajor((uint64_t)a3);
    unint64_t v57 = v51 & ~(v51 >> 31);
    unsigned int v58 = __dst + 335;
    for (unsigned int k = 7; k > 1; --k)
    {
      unint64_t v60 = v57;
      *--unsigned int v58 = v57 & 7 | 0x30;
      v57 >>= 3;
    }
    if (v60 >= 8)
    {
      *((_WORD *)v58 + 2) = 14135;
      *(_DWORD *)unsigned int v58 = 926365495;
      archive_set_error((_DWORD *)a1, 34, "Major device number too large", v52, v53, v54, v55, v56, v84);
      uint64_t v32 = 4294967271;
    }
    int v61 = archive_entry_rdevminor(a3);
    unint64_t v67 = v61 & ~(v61 >> 31);
    unsigned int v68 = __dst + 343;
    for (unsigned int m = 7; m > 1; --m)
    {
      unint64_t v70 = v67;
      *--unsigned int v68 = v67 & 7 | 0x30;
      v67 >>= 3;
    }
    if (v70 >= 8)
    {
      *((_WORD *)v68 + 2) = 14135;
      *(_DWORD *)unsigned int v68 = 926365495;
      archive_set_error((_DWORD *)a1, 34, "Minor device number too large", v62, v63, v64, v65, v66, v84);
      uint64_t v32 = 4294967271;
    }
  }
  uint64_t v71 = 0;
  __dst[156] = a4;
  int32x4_t v72 = 0uLL;
  int32x4_t v73 = 0uLL;
  int32x4_t v74 = 0uLL;
  int32x4_t v75 = 0uLL;
  do
  {
    uint8x16_t v76 = *(uint8x16_t *)&__dst[v71];
    uint16x8_t v77 = vmovl_u8(*(uint8x8_t *)v76.i8);
    uint16x8_t v78 = vmovl_high_u8(v76);
    int32x4_t v75 = (int32x4_t)vaddw_high_u16((uint32x4_t)v75, v78);
    int32x4_t v74 = (int32x4_t)vaddw_u16((uint32x4_t)v74, *(uint16x4_t *)v78.i8);
    int32x4_t v73 = (int32x4_t)vaddw_high_u16((uint32x4_t)v73, v77);
    int32x4_t v72 = (int32x4_t)vaddw_u16((uint32x4_t)v72, *(uint16x4_t *)v77.i8);
    v71 += 16;
  }
  while (v71 != 512);
  unint64_t v79 = vaddvq_s32(vaddq_s32(vaddq_s32(v72, v74), vaddq_s32(v73, v75)));
  __dst[154] = 0;
  char v80 = __dst + 154;
  for (unsigned int n = 7; n > 1; --n)
  {
    unint64_t v82 = v79;
    *--char v80 = v79 & 7 | 0x30;
    v79 >>= 3;
  }
  if (v82 >= 8)
  {
    *((_WORD *)v80 + 2) = 14135;
    *(_DWORD *)char v80 = 926365495;
  }
  return v32;
}

uint64_t sub_2099E2F50(uint64_t a1, uint64_t a2, size_t __len, int a4)
{
  if (1 << (3 * __len) <= a1)
  {
    unsigned int v9 = (char *)(a2 + a4);
    if (a4 < 1)
    {
      char v11 = *v9;
    }
    else
    {
      unsigned int v10 = a4 + 1;
      do
      {
        char v11 = a1;
        *--unsigned int v9 = a1;
        a1 >>= 8;
        --v10;
      }
      while (v10 > 1);
    }
    uint64_t result = 0;
    *unsigned int v9 = v11 | 0x80;
  }
  else if ((int)__len < 1)
  {
    if (a1 <= 0) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v4 = (char *)(a2 + __len);
    unint64_t v5 = a1 & ~(a1 >> 63);
    unsigned int v6 = __len + 1;
    do
    {
      unint64_t v7 = v5;
      *--uint64_t v4 = v5 & 7 | 0x30;
      v5 >>= 3;
      --v6;
    }
    while (v6 > 1);
    if (v7 <= 7)
    {
      return 0;
    }
    else
    {
      memset(v4, 55, __len);
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

int BZ2_bzCompress(bz_stream *strm, int action)
{
  return MEMORY[0x270F981A8](strm, *(void *)&action);
}

int BZ2_bzCompressEnd(bz_stream *strm)
{
  return MEMORY[0x270F981B0](strm);
}

int BZ2_bzCompressInit(bz_stream *strm, int blockSize100k, int verbosity, int workFactor)
{
  return MEMORY[0x270F981B8](strm, *(void *)&blockSize100k, *(void *)&verbosity, *(void *)&workFactor);
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

const char *BZ2_bzlibVersion(void)
{
  return (const char *)MEMORY[0x270F981F0]();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78D0](*(void *)&op, *(void *)&mode, *(void *)&alg, *(void *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x270ED7948](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x270ED7A38](*(void *)&algorithm, password, passwordLen, salt, saltLen, *(void *)&prf, *(void *)&rounds, derivedKey);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
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

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

int UTF8Toisolat1(unsigned __int8 *out, int *outlen, const unsigned __int8 *in, int *inlen)
{
  return MEMORY[0x270F9BA40](out, outlen, in, inlen);
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

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x270ED7EC8]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void abort(void)
{
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x270ED8488](flagset_d, *(void *)&flag);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x270ED8490](permset_d, *(void *)&perm);
}

int acl_clear_flags_np(acl_flagset_t flagset_d)
{
  return MEMORY[0x270ED8498](flagset_d);
}

int acl_clear_perms(acl_permset_t permset_d)
{
  return MEMORY[0x270ED84A0](permset_d);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x270ED84B8](acl_p, entry_p);
}

acl_t acl_dup(acl_t acl)
{
  return (acl_t)MEMORY[0x270ED84C0](acl);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x270ED84C8](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x270ED84D8](acl, *(void *)&entry_id, entry_p);
}

acl_t acl_get_fd(int fd)
{
  return (acl_t)MEMORY[0x270ED84E0](*(void *)&fd);
}

acl_t acl_get_fd_np(int fd, acl_type_t type)
{
  return (acl_t)MEMORY[0x270ED84E8](*(void *)&fd, *(void *)&type);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x270ED84F0](path_p, *(void *)&type);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x270ED84F8](flagset_d, *(void *)&flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x270ED8500](obj_p, flagset_p);
}

acl_t acl_get_link_np(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x270ED8508](path_p, *(void *)&type);
}

int acl_get_perm_np(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x270ED8510](permset_d, *(void *)&perm);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x270ED8518](entry_d, permset_p);
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

int acl_set_fd_np(int fd, acl_t acl, acl_type_t acl_type)
{
  return MEMORY[0x270ED8548](*(void *)&fd, acl, *(void *)&acl_type);
}

int acl_set_link_np(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x270ED8558](path_p, *(void *)&type, acl);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x270ED8568](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x270ED8570](entry_d, *(void *)&tag_type);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x270ED8798](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int chdir(const char *a1)
{
  return MEMORY[0x270ED8EB8](a1);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x270F9C688](sourceLen);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x270ED9100](from, to, state, *(void *)&flags);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x270ED9170](a1, a2);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B8](strm, *(void *)&level, version, *(void *)&stream_size);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x270F9C6C0](strm);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

void exit(int a1)
{
}

int fchdir(int a1)
{
  return MEMORY[0x270ED9890](*(void *)&a1);
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

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x270ED98F0](*(void *)&a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9970](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
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

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270ED9AC8](__stream, a2, *(void *)&__whence);
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

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270ED9B00](*(void *)&a1, a2);
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

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

gid_t getgid(void)
{
  return MEMORY[0x270ED9C10]();
}

int getgrgid_r(gid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x270ED9C20](*(void *)&a1, a2, a3, a4, a5);
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x270ED9C30](a1, a2, a3, a4, a5);
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D30](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D40](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270ED9DE0](a1, a2);
}

size_t iconv(iconv_t a1, char **a2, size_t *a3, char **a4, size_t *a5)
{
  return MEMORY[0x270F994B0](a1, a2, a3, a4, a5);
}

int iconv_close(iconv_t a1)
{
  return MEMORY[0x270F994B8](a1);
}

iconv_t iconv_open(const char *a1, const char *a2)
{
  return (iconv_t)MEMORY[0x270F994C0](a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x270F9C748](strm, version, *(void *)&stream_size);
}

int inflateReset(z_streamp strm)
{
  return MEMORY[0x270F9C750](strm);
}

int inflateSetDictionary(z_streamp strm, const Bytef *dictionary, uInt dictLength)
{
  return MEMORY[0x270F9C760](strm, dictionary, *(void *)&dictLength);
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

int linkat(int a1, const char *a2, int a3, const char *a4, int a5)
{
  return MEMORY[0x270EDA070](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x270EDA080](path, namebuff, size, *(void *)&options);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

int lutimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x270EDA128](a1, a2);
}

uint64_t lzma_alone_decoder()
{
  return MEMORY[0x270F99B98]();
}

uint64_t lzma_alone_encoder()
{
  return MEMORY[0x270F99BA0]();
}

uint64_t lzma_code()
{
  return MEMORY[0x270F99BB0]();
}

uint64_t lzma_crc32()
{
  return MEMORY[0x270F99BB8]();
}

uint64_t lzma_end()
{
  return MEMORY[0x270F99BD0]();
}

uint64_t lzma_lzma_preset()
{
  return MEMORY[0x270F99BD8]();
}

uint64_t lzma_memusage()
{
  return MEMORY[0x270F99BE0]();
}

uint64_t lzma_properties_decode()
{
  return MEMORY[0x270F99BE8]();
}

uint64_t lzma_properties_encode()
{
  return MEMORY[0x270F99BF0]();
}

uint64_t lzma_properties_size()
{
  return MEMORY[0x270F99BF8]();
}

uint64_t lzma_raw_decoder()
{
  return MEMORY[0x270F99C00]();
}

uint64_t lzma_raw_encoder()
{
  return MEMORY[0x270F99C08]();
}

uint64_t lzma_stream_decoder()
{
  return MEMORY[0x270F99C20]();
}

uint64_t lzma_stream_encoder()
{
  return MEMORY[0x270F99C28]();
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

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x270EDA3F8](*(void *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x270EDA420](*(void *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x270EDA428](uu, uid_or_gid, id_type);
}

size_t mbrtowc(__int32 *a1, const char *a2, size_t a3, mbstate_t *a4)
{
  return MEMORY[0x270EDA438](a1, a2, a3, a4);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

int mkfifo(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA538](a1, a2);
}

int mknod(const char *a1, mode_t a2, dev_t a3)
{
  return MEMORY[0x270EDA540](a1, a2, *(void *)&a3);
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x270EDA730](*(void *)&a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x270EDA840](*(void *)&a1, a2, *(void *)&a3);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pathconf(const char *a1, int a2)
{
  return MEMORY[0x270EDABF8](a1, *(void *)&a2);
}

int pipe(int a1[2])
{
  return MEMORY[0x270EDAC38](a1);
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x270EDAC40](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x270EDAC78](a1, *(void *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x270EDAC80](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDAC98](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDACA0](a1);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDACF0](a1, a2, a3, a4, __argv, __envp);
}

uint64_t pthread_chdir_np()
{
  return MEMORY[0x270EDAE48]();
}

uint64_t pthread_fchdir_np()
{
  return MEMORY[0x270EDAEC0]();
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

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

ssize_t readlinkat(int a1, const char *a2, char *a3, size_t a4)
{
  return MEMORY[0x270EDB140](*(void *)&a1, a2, a3, a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDB268](a1);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB5A0](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB5C8](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB698](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6E8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB770](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x270EDB938](a1);
}

void tzset(void)
{
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x270EDB988](a1);
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x270F9C770](dest, destLen, source, sourceLen);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}

size_t wcrtomb(char *a1, __int32 a2, mbstate_t *a3)
{
  return MEMORY[0x270EDBB68](a1, *(void *)&a2, a3);
}

__int32 *__cdecl wcschr(__int32 *__s, __int32 __c)
{
  return (__int32 *)MEMORY[0x270EDBB80](__s, *(void *)&__c);
}

__int32 *__cdecl wcscpy(__int32 *a1, const __int32 *a2)
{
  return (__int32 *)MEMORY[0x270EDBB90](a1, a2);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x270EDBBA0](a1);
}

int wmemcmp(const __int32 *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x270EDBBF0](a1, a2, a3);
}

__int32 *__cdecl wmemmove(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x270EDBC00](a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x270F9BB48]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
}

void xmlCleanupParser(void)
{
}

void xmlFreeTextReader(xmlTextReaderPtr reader)
{
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
}

xmlTextWriterPtr xmlNewTextWriterMemory(xmlBufferPtr buf, int compression)
{
  return (xmlTextWriterPtr)MEMORY[0x270F9BEF0](buf, *(void *)&compression);
}

xmlTextReaderPtr xmlReaderForIO(xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void *ioctx, const char *URL, const char *encoding, int options)
{
  return (xmlTextReaderPtr)MEMORY[0x270F9BFE8](ioread, ioclose, ioctx, URL, encoding, *(void *)&options);
}

const xmlChar *__cdecl xmlTextReaderConstLocalName(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x270F9C190](reader);
}

const xmlChar *__cdecl xmlTextReaderConstValue(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x270F9C1A0](reader);
}

int xmlTextReaderIsEmptyElement(xmlTextReaderPtr reader)
{
  return MEMORY[0x270F9C1D0](reader);
}

int xmlTextReaderMoveToFirstAttribute(xmlTextReaderPtr reader)
{
  return MEMORY[0x270F9C1E0](reader);
}

int xmlTextReaderMoveToNextAttribute(xmlTextReaderPtr reader)
{
  return MEMORY[0x270F9C1E8](reader);
}

int xmlTextReaderNodeType(xmlTextReaderPtr reader)
{
  return MEMORY[0x270F9C1F0](reader);
}

int xmlTextReaderRead(xmlTextReaderPtr reader)
{
  return MEMORY[0x270F9C1F8](reader);
}

void xmlTextReaderSetErrorHandler(xmlTextReaderPtr reader, xmlTextReaderErrorFunc f, void *arg)
{
}

int xmlTextWriterEndDocument(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C230](writer);
}

int xmlTextWriterEndElement(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C238](writer);
}

int xmlTextWriterSetIndent(xmlTextWriterPtr writer, int indent)
{
  return MEMORY[0x270F9C258](writer, *(void *)&indent);
}

int xmlTextWriterStartDocument(xmlTextWriterPtr writer, const char *version, const char *encoding, const char *standalone)
{
  return MEMORY[0x270F9C280](writer, version, encoding, standalone);
}

int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar *name)
{
  return MEMORY[0x270F9C288](writer, name);
}

int xmlTextWriterWriteAttribute(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *content)
{
  return MEMORY[0x270F9C2A0](writer, name, content);
}

int xmlTextWriterWriteBase64(xmlTextWriterPtr writer, const char *data, int start, int len)
{
  return MEMORY[0x270F9C2B0](writer, data, *(void *)&start, *(void *)&len);
}

int xmlTextWriterWriteFormatAttribute(xmlTextWriterPtr writer, const xmlChar *name, const char *format, ...)
{
  return MEMORY[0x270F9C2D0](writer, name, format);
}