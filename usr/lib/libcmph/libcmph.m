double bdz_config_new()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x40uLL, 0x1030040D3CFC0C8uLL);
  if (v0)
  {
    result = 0.0;
    v0[2] = 0u;
    v0[3] = 0u;
    *v0 = 0u;
    v0[1] = 0u;
    *((unsigned char *)v0 + 36) = 7;
    *((void *)v0 + 6) = 0;
  }
  return result;
}

void bdz_config_destroy(uint64_t a1)
{
}

uint64_t bdz_config_set_b(uint64_t result, int a2)
{
  if ((a2 - 11) >= 0xFFFFFFF8) {
    char v2 = a2;
  }
  else {
    char v2 = 7;
  }
  *(unsigned char *)(*(void *)(result + 32) + 36) = v2;
  return result;
}

uint64_t bdz_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1) {
    *(_DWORD *)(*(void *)(result + 32) + 56) = *a2;
  }
  return result;
}

void *bdz_new(uint64_t a1, double a2)
{
  uint64_t v2 = a1;
  uint64_t v97 = *MEMORY[0x263EF8340];
  v3 = *(unsigned int **)(a1 + 32);
  if (a2 == 0.0) {
    a2 = 1.23;
  }
  uint64_t v4 = *(unsigned int *)(*(void *)(a1 + 8) + 8);
  unsigned int v5 = vcvtpd_u64_f64(a2 * (double)v4 / 3.0) | 1;
  size_t v6 = 3 * v5;
  unsigned int *v3 = v4;
  v3[1] = v6;
  v3[2] = v5;
  unsigned int v7 = 1 << *((unsigned char *)v3 + 36);
  v3[8] = v7;
  v3[10] = vcvtpd_u64_f64((double)v6 / (double)v7);
  v8 = (unsigned int *)malloc_type_malloc(24 * v4, 0x1000040504FFAC1uLL);
  v92[1] = v8;
  v9 = (char *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  v92[2] = v9;
  v10 = malloc_type_malloc(v6, 0xD764A694uLL);
  v92[3] = v10;
  v86 = malloc_type_malloc(4 * *v3, 0x100004052888210uLL);
  if (*(_DWORD *)(v2 + 16)) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Entering mapping step for mph creation of %u keys with graph sized %u\n", *v3, v3[1]);
  }
  v92[0] = 0;
  int v11 = 1000;
  uint64_t v90 = v2;
  v87 = v3;
  while (1)
  {
    int v88 = v11;
    *((void *)v3 + 3) = hash_state_new(v3[14], 0xFu);
    v12 = *(unsigned int **)(v2 + 32);
    size_t v13 = v12[1];
    memset(v9, 255, 4 * v13);
    bzero(v10, v13);
    LODWORD(v92[0]) = 0;
    (*(void (**)(void))(*(void *)(v2 + 8) + 32))(**(void **)(v2 + 8));
    uint64_t v14 = *(void *)(v2 + 8);
    if (*(_DWORD *)(v14 + 8))
    {
      int v15 = 0;
      v16 = v8 + 3;
      v89 = v12;
      do
      {
        int v91 = v15;
        unsigned int v94 = 0;
        v93 = 0;
        (*(void (**)(void, unsigned __int8 **, unsigned int *))(v14 + 16))(*(void *)v14, &v93, &v94);
        hash_vector(*((_DWORD **)v12 + 3), v93, v94, &v95);
        unsigned int v17 = v12[2];
        unsigned __int32 v18 = v95.i32[0] % v17;
        unsigned __int32 v19 = v95.i32[1] % v17 + v17;
        unsigned int v20 = v96 % v17 + 2 * v17;
        (*(void (**)(void, unsigned __int8 *, void))(*(void *)(v90 + 8) + 24))(**(void **)(v90 + 8), v93, v94);
        *(v16 - 3) = v18;
        *(v16 - 2) = v19;
        *(v16 - 1) = v20;
        _DWORD *v16 = *(_DWORD *)&v9[4 * v18];
        v16[1] = *(_DWORD *)&v9[4 * v19];
        v16[2] = *(_DWORD *)&v9[4 * v20];
        *(_DWORD *)&v9[4 * v20] = v91;
        *(_DWORD *)&v9[4 * v19] = v91;
        *(_DWORD *)&v9[4 * v18] = v91;
        ++*((unsigned char *)v10 + v18);
        ++*((unsigned char *)v10 + v19);
        ++*((unsigned char *)v10 + v20);
        v12 = v89;
        int v15 = v91 + 1;
        uint64_t v14 = *(void *)(v90 + 8);
        v16 += 6;
      }
      while ((v91 + 1) < *(_DWORD *)(v14 + 8));
      unsigned int v21 = v91 + 1;
      LODWORD(v92[0]) = v91 + 1;
    }
    else
    {
      unsigned int v21 = 0;
    }
    unint64_t v22 = *v12;
    v23 = malloc_type_malloc((v22 >> 3) + 1, 0xAD381DACuLL);
    bzero(v23, (v22 >> 3) + 1);
    if (!v22) {
      goto LABEL_46;
    }
    uint64_t v24 = 0;
    int v25 = 0;
    v26 = v8 + 1;
    do
    {
      if (*((unsigned char *)v10 + *(v26 - 1)) == 1 || *((unsigned char *)v10 + *v26) == 1 || *((unsigned char *)v10 + v26[1]) == 1)
      {
        uint64_t v27 = v24 >> 3;
        char v28 = bitmask[v24 & 7];
        if (!((v28 & *((unsigned char *)v23 + v27)) >> (v24 & 7)))
        {
          v86[v25++] = v24;
          *((unsigned char *)v23 + v27) |= v28;
        }
      }
      ++v24;
      v26 += 6;
    }
    while (v22 != v24);
    if (v25)
    {
      int v29 = 0;
      do
      {
        uint64_t v30 = 0;
        int v31 = v86[v29++];
        v32 = &v8[6 * v31];
        do
        {
          uint64_t v33 = v32[v30];
          v34 = &v9[4 * v33];
          for (unsigned int i = *(_DWORD *)v34; i != v31 && i != -1; unsigned int i = v40)
          {
            v37 = &v8[6 * i];
            if (*v37 == v33)
            {
              uint64_t v38 = 0;
            }
            else if (v37[1] == v33)
            {
              uint64_t v38 = 1;
            }
            else
            {
              uint64_t v38 = 2;
            }
            uint64_t v39 = (uint64_t)&v8[6 * i + v38];
            unsigned int v40 = *(_DWORD *)(v39 + 12);
            v34 = (char *)(v39 + 12);
          }
          if (i == -1)
          {
            printf("\nerror remove edge %d dump graph", v31);
            bdz_dump_graph((uint64_t)v92, v21);
            exit(-1);
          }
          *(_DWORD *)v34 = v8[6 * i + 3 + v30];
          --*((unsigned char *)v10 + v33);
          ++v30;
        }
        while (v30 != 3);
        uint64_t v42 = *v32;
        uint64_t v41 = v32[1];
        uint64_t v43 = v32[2];
        if (*((unsigned char *)v10 + v42) == 1)
        {
          unint64_t v44 = *(unsigned int *)&v9[4 * v42];
          char v45 = bitmask[v44 & 7];
          if (!((v45 & *((unsigned char *)v23 + (v44 >> 3))) >> (v44 & 7)))
          {
            v86[v25++] = v44;
            *((unsigned char *)v23 + (v44 >> 3)) |= v45;
          }
        }
        if (*((unsigned char *)v10 + v41) == 1)
        {
          unint64_t v46 = *(unsigned int *)&v9[4 * v41];
          char v47 = bitmask[v46 & 7];
          if (!((v47 & *((unsigned char *)v23 + (v46 >> 3))) >> (v46 & 7)))
          {
            v86[v25++] = v46;
            *((unsigned char *)v23 + (v46 >> 3)) |= v47;
          }
        }
        if (*((unsigned char *)v10 + v43) == 1)
        {
          unint64_t v48 = *(unsigned int *)&v9[4 * v43];
          char v49 = bitmask[v48 & 7];
          if (!((v49 & *((unsigned char *)v23 + (v48 >> 3))) >> (v48 & 7)))
          {
            v86[v25++] = v48;
            *((unsigned char *)v23 + (v48 >> 3)) |= v49;
          }
        }
      }
      while (v29 != v25);
    }
    else
    {
LABEL_46:
      int v29 = 0;
    }
    free(v23);
    if (v29 == v22) {
      break;
    }
    v3 = v87;
    int v11 = v88 - 1;
    hash_state_destroy(*((_DWORD **)v87 + 3));
    *((void *)v87 + 3) = 0;
    uint64_t v2 = v90;
    if (*(_DWORD *)(v90 + 16)) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "acyclic graph creation failure - %u iterations remaining\n", v11);
    }
    if (v88 == 1)
    {
      free(v86);
      free(v8);
      free(v9);
      free(v10);
      return 0;
    }
  }
  free(v9);
  free(v10);
  v50 = (FILE **)MEMORY[0x263EF8348];
  if (*(_DWORD *)(v90 + 16)) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Entering assigning step for mph creation of %u keys with graph sized %u\n", *v87, v87[1]);
  }
  v51 = (char *)malloc_type_malloc(((unint64_t)v87[1] >> 3) + 1, 0xB0CDE37CuLL);
  LODWORD(v52) = v87[1];
  LODWORD(v10) = vcvtpd_u64_f64((double)v52 * 0.25);
  *((void *)v87 + 2) = malloc_type_calloc((size_t)v10, 1uLL, 0x100004077774924uLL);
  bzero(v51, ((unint64_t)v87[1] >> 3) + 1);
  memset(*((void **)v87 + 2), 255, (size_t)v10);
  if (v21)
  {
    unsigned int v53 = v21 - 1;
    do
    {
      v54 = &v8[6 * v86[v53]];
      unint64_t v55 = *v54;
      unint64_t v56 = v54[1];
      unint64_t v57 = v54[2];
      char v58 = bitmask[v55 & 7];
      v59 = &v51[v56 >> 3];
      char v60 = bitmask[v56 & 7];
      int v61 = (v60 & *v59) >> (v56 & 7);
      if ((v58 & v51[v55 >> 3]) >> (v55 & 7))
      {
        if (v61)
        {
          uint64_t v62 = *((void *)v87 + 2);
          int v63 = 8
              - (((*(unsigned __int8 *)(v62 + (v56 >> 2)) >> (2 * (v56 & 3))) & 3)
               + ((*(unsigned __int8 *)(v62 + (v55 >> 2)) >> (2 * (v55 & 3))) & 3));
          *(unsigned char *)(v62 + (v57 >> 2)) &= valuemask[v57 & 3] | ((v63
                                                                                - 3 * ((86 * v63) >> 8)) << (2 * (v57 & 3)));
          char v58 = bitmask[v57 & 7];
          v59 = &v51[v57 >> 3];
        }
        else
        {
          char v65 = bitmask[v57 & 7];
          if (!((v65 & v51[v57 >> 3]) >> (v57 & 7)))
          {
            *(unsigned char *)(*((void *)v87 + 2) + (v57 >> 2)) &= valuemask[v57 & 3] | (3 << (2 * (v57 & 3)));
            v51[v57 >> 3] |= v65;
          }
          uint64_t v67 = *((void *)v87 + 2);
          int v68 = (((*(unsigned __int8 *)(v67 + (v57 >> 2)) >> (2 * (v57 & 3))) & 3)
               + ((*(unsigned __int8 *)(v67 + (v55 >> 2)) >> (2 * (v55 & 3))) & 3)) ^ 7;
          *(unsigned char *)(v67 + (v56 >> 2)) &= valuemask[v56 & 3] | ((v68
                                                                                - 3 * ((86 * v68) >> 8)) << (2 * (v56 & 3)));
          char v58 = v60;
        }
      }
      else
      {
        if (!v61)
        {
          *(unsigned char *)(*((void *)v87 + 2) + (v56 >> 2)) &= valuemask[v56 & 3] | (3 << (2 * (v56 & 3)));
          *v59 |= v60;
        }
        char v64 = bitmask[v57 & 7];
        if (!((v64 & v51[v57 >> 3]) >> (v57 & 7)))
        {
          *(unsigned char *)(*((void *)v87 + 2) + (v57 >> 2)) &= valuemask[v57 & 3] | (3 << (2 * (v57 & 3)));
          v51[v57 >> 3] |= v64;
        }
        uint64_t v66 = *((void *)v87 + 2);
        *(unsigned char *)(v66 + (v55 >> 2)) &= valuemask[v55 & 3] | (((6
                                                                                                - (((*(unsigned __int8 *)(v66 + (v57 >> 2)) >> (2 * (v57 & 3))) & 3)
                                                                                                 + ((*(unsigned __int8 *)(v66 + (v56 >> 2)) >> (2 * (v56 & 3))) & 3)))
                                                                              % 3u) << (2 * (v55 & 3)));
        v59 = &v51[v55 >> 3];
      }
      *v59 |= v58;
    }
    while ((unint64_t)v53--);
  }
  free(v51);
  free(v86);
  free(v8);
  if (*(_DWORD *)(v90 + 16)) {
    fprintf(*v50, "Entering ranking step for mph creation of %u keys with graph sized %u\n", *v87, v87[1]);
  }
  unint64_t v70 = v87[8];
  unsigned int v71 = v87[1];
  v72 = malloc_type_calloc(v87[10], 4uLL, 0x100004052888210uLL);
  *((void *)v87 + 6) = v72;
  _DWORD *v72 = 0;
  if (v87[10] != 1)
  {
    int v73 = 0;
    unsigned int v74 = 0;
    unsigned int v75 = v70 >> 2;
    unsigned int v76 = vcvtpd_u64_f64((double)v71 * 0.25);
    unsigned int v77 = 1;
    do
    {
      if (v70 >> 2 >= v76) {
        unint64_t v78 = v76;
      }
      else {
        unint64_t v78 = v70 >> 2;
      }
      if (v75 >= v76) {
        unsigned int v79 = v76;
      }
      else {
        unsigned int v79 = v70 >> 2;
      }
      if (v79)
      {
        v80 = (unsigned __int8 *)(*((void *)v87 + 2) + v74);
        do
        {
          int v81 = *v80++;
          v73 += bdz_lookup_table[v81];
          --v78;
        }
        while (v78);
      }
      v72[v77] = v73;
      v74 += v79;
      v76 -= v75;
      ++v77;
    }
    while (v77 != v87[10]);
  }
  v84 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v84 = *(_DWORD *)v90;
  v82 = malloc_type_malloc(0x38uLL, 0x1030040C16D3081uLL);
  long long v83 = *((_OWORD *)v87 + 1);
  *((void *)v87 + 2) = 0;
  v82[1] = v83;
  *((void *)v87 + 3) = 0;
  *((void *)v82 + 6) = *((void *)v87 + 6);
  *((void *)v87 + 6) = 0;
  *((_DWORD *)v82 + 10) = v87[10];
  *((_DWORD *)v82 + 8) = v87[8];
  *((unsigned char *)v82 + 36) = *((unsigned char *)v87 + 36);
  *(void *)&long long v83 = *(void *)v87;
  *(void *)v82 = *(void *)v87;
  *((_DWORD *)v82 + 2) = v87[2];
  v84[2] = v82;
  *((_DWORD *)v84 + 1) = v83;
  if (*(_DWORD *)(v90 + 16)) {
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v50);
  }
  return v84;
}

uint64_t bdz_dump(uint64_t a1, FILE *a2)
{
  v8 = 0;
  unsigned int __ptr = 0;
  uint64_t v3 = *(void *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  hash_state_dump(*(_DWORD **)(v3 + 24), &v8, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v8, __ptr, 1uLL, a2);
  free(v8);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 8), 4uLL, 1uLL, a2);
  LODWORD(v4) = *(_DWORD *)(v3 + 4);
  LODWORD(v5) = vcvtpd_u64_f64((double)v4 * 0.25);
  fwrite(*(const void **)(v3 + 16), v5, 1uLL, a2);
  fwrite((const void *)(v3 + 32), 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 36), 1uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 40), 4uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 48), 4 * *(unsigned int *)(v3 + 40), 1uLL, a2);
  return 1;
}

size_t bdz_load(FILE *a1, uint64_t a2)
{
  unsigned int __ptr = 0;
  unint64_t v4 = malloc_type_malloc(0x38uLL, 0x1030040C16D3081uLL);
  *(void *)(a2 + 16) = v4;
  fread(&__ptr, 4uLL, 1uLL, a1);
  size_t v5 = __ptr;
  size_t v6 = malloc_type_malloc(__ptr, 0x8E9CA22uLL);
  fread(v6, v5, 1uLL, a1);
  v4[3] = hash_state_load((const char *)v6);
  free(v6);
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  fread(v4 + 1, 4uLL, 1uLL, a1);
  LODWORD(v7) = *((_DWORD *)v4 + 1);
  LODWORD(v5) = vcvtpd_u64_f64((double)v7 * 0.25);
  v8 = malloc_type_calloc(v5, 1uLL, 0x100004077774924uLL);
  v4[2] = v8;
  fread(v8, v5, 1uLL, a1);
  fread(v4 + 4, 4uLL, 1uLL, a1);
  fread((char *)v4 + 36, 1uLL, 1uLL, a1);
  fread(v4 + 5, 4uLL, 1uLL, a1);
  v9 = malloc_type_calloc(*((unsigned int *)v4 + 10), 4uLL, 0x100004052888210uLL);
  v4[6] = v9;
  size_t v10 = 4 * *((unsigned int *)v4 + 10);

  return fread(v9, v10, 1uLL, a1);
}

uint64_t bdz_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 16);
  hash_vector(*(_DWORD **)(v3 + 24), a2, a3, &v16);
  unsigned int v4 = *(_DWORD *)(v3 + 8);
  v16.i32[0] %= v4;
  v16.i32[1] = v16.i32[1] % v4 + v4;
  unsigned int v17 = v17 % v4 + 2 * v4;
  uint64_t v5 = *(void *)(v3 + 16);
  int v6 = ((*(unsigned __int8 *)(v5 + ((unint64_t)v16.u32[1] >> 2)) >> (2 * (v16.i8[4] & 3))) & 3)
     + ((*(unsigned __int8 *)(v5 + ((unint64_t)v16.u32[0] >> 2)) >> (2 * (v16.i8[0] & 3))) & 3)
     + ((*(unsigned __int8 *)(v5 + ((unint64_t)v17 >> 2)) >> (2 * (v17 & 3))) & 3);
  unint64_t v7 = v16.u32[(v6 - 3 * ((unsigned __int16)(86 * v6) >> 8))];
  char v8 = *(unsigned char *)(v3 + 36);
  uint64_t result = *(unsigned int *)(*(void *)(v3 + 48) + 4 * (v7 >> v8));
  LODWORD(v10) = v7 >> v8 << v8 >> 2;
  if (v10 < (v7 >> 2))
  {
    int v11 = (unsigned __int8 *)(v5 + v10);
    unint64_t v12 = (v7 >> 2) - v10;
    do
    {
      int v13 = *v11++;
      uint64_t result = result + bdz_lookup_table[v13];
      --v12;
    }
    while (v12);
    unint64_t v10 = v7 >> 2;
  }
  unsigned int v14 = 4 * v10;
  if (4 * (int)v10 < v7)
  {
    char v15 = 8 * v10;
    do
    {
      if ((~(*(unsigned __int8 *)(v5 + ((unint64_t)v14 >> 2)) >> (v15 & 6)) & 3) != 0) {
        uint64_t result = (result + 1);
      }
      else {
        uint64_t result = result;
      }
      ++v14;
      v15 += 2;
    }
    while (v7 != v14);
  }
  return result;
}

void bdz_destroy(void *a1)
{
  uint64_t v2 = a1[2];
  free(*(void **)(v2 + 16));
  hash_state_destroy(*(_DWORD **)(v2 + 24));
  free(*(void **)(v2 + 48));
  free((void *)v2);

  free(a1);
}

void *bdz_pack(uint64_t a1, int *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int type = hash_get_type(*(unsigned int **)(v3 + 24));
  *a2++ = type;
  hash_state_pack(*(_DWORD **)(v3 + 24), a2);
  uint64_t v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  *uint64_t v5 = *(_DWORD *)(v3 + 8);
  v5[1] = *(_DWORD *)(v3 + 40);
  int v6 = v5 + 2;
  memcpy(v5 + 2, *(const void **)(v3 + 48), 4 * *(unsigned int *)(v3 + 40));
  unint64_t v7 = &v6[*(unsigned int *)(v3 + 40)];
  *unint64_t v7 = *(unsigned char *)(v3 + 36);
  char v8 = v7 + 1;
  LODWORD(v9) = *(_DWORD *)(v3 + 4);
  LODWORD(v10) = vcvtpd_u64_f64((double)v9 * 0.25);
  int v11 = *(const void **)(v3 + 16);

  return memcpy(v8, v11, v10);
}

uint64_t bdz_packed_size(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int type = hash_get_type(*(unsigned int **)(v1 + 24));
  int v3 = hash_state_packed_size(type);
  LODWORD(v4) = *(_DWORD *)(v1 + 4);
  return v3 + 4 * *(_DWORD *)(v1 + 40) + vcvtpd_u64_f64((double)v4 * 0.25) + 17;
}

uint64_t bdz_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v5 = (unsigned int *)(a1 + 1);
  int v6 = *a1;
  unsigned int v7 = hash_state_packed_size(*a1);
  char v8 = (unsigned int *)((char *)v5 + v7);
  unint64_t v9 = v8 + 2;
  unsigned int v10 = *v8;
  uint64_t v11 = v8[1];
  unint64_t v12 = (char *)&v8[v11 + 2];
  char v14 = *v12;
  int v13 = v12 + 1;
  hash_vector_packed(v5, v6, a2, a3, &v25);
  v25.i32[0] %= v10;
  v25.i32[1] = v25.i32[1] % v10 + v10;
  unsigned int v26 = v26 % v10 + 2 * v10;
  int v15 = ((v13[(unint64_t)v25.u32[1] >> 2] >> (2 * (v25.i8[4] & 3))) & 3)
      + ((v13[(unint64_t)v25.u32[0] >> 2] >> (2 * (v25.i8[0] & 3))) & 3)
      + ((v13[(unint64_t)v26 >> 2] >> (2 * (v26 & 3))) & 3);
  unint64_t v16 = v25.u32[(v15 - 3 * ((unsigned __int16)(86 * v15) >> 8))];
  uint64_t result = v9[v16 >> v14];
  LODWORD(v18) = v16 >> v14 << v14 >> 2;
  if (v18 < (v16 >> 2))
  {
    unsigned __int32 v19 = (unsigned __int8 *)&a1[v11 + 3] + v7 + v18 + 1;
    unint64_t v20 = (v16 >> 2) - v18;
    do
    {
      int v21 = *v19++;
      uint64_t result = result + bdz_lookup_table[v21];
      --v20;
    }
    while (v20);
    unint64_t v18 = v16 >> 2;
  }
  unsigned int v22 = 4 * v18;
  if (4 * (int)v18 < v16)
  {
    char v23 = 8 * v18;
    do
    {
      if ((~(v13[(unint64_t)v22 >> 2] >> (v23 & 6)) & 3) != 0) {
        uint64_t result = (result + 1);
      }
      else {
        uint64_t result = result;
      }
      ++v22;
      v23 += 2;
    }
    while (v16 != v22);
  }
  return result;
}

uint64_t bdz_dump_graph(uint64_t result, unsigned int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    int v4 = 0;
    uint64_t v5 = 24 * a2;
    do
    {
      printf("\nedge %d %d %d %d ", v4, *(_DWORD *)(*(void *)(v2 + 8) + v3), *(_DWORD *)(*(void *)(v2 + 8) + v3 + 4), *(_DWORD *)(*(void *)(v2 + 8) + v3 + 8));
      uint64_t result = printf(" nexts %d %d %d", *(_DWORD *)(*(void *)(v2 + 8) + v3 + 12), *(_DWORD *)(*(void *)(v2 + 8) + v3 + 16), *(_DWORD *)(*(void *)(v2 + 8) + v3 + 20));
      ++v4;
      v3 += 24;
    }
    while (v5 != v3);
  }
  return result;
}

double bdz_ph_config_new()
{
  v0 = malloc_type_malloc(0x20uLL, 0x1030040D1A1786CuLL);
  if (!v0) {
    bdz_ph_config_new_cold_1();
  }
  double result = 0.0;
  _OWORD *v0 = 0u;
  v0[1] = 0u;
  return result;
}

void bdz_ph_config_destroy(uint64_t a1)
{
}

uint64_t bdz_ph_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1) {
    **(_DWORD **)(result + 32) = *a2;
  }
  return result;
}

void *bdz_ph_new(uint64_t a1, double a2)
{
  uint64_t v2 = a1;
  uint64_t v95 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2 == 0.0) {
    a2 = 1.23;
  }
  uint64_t v4 = *(unsigned int *)(*(void *)(a1 + 8) + 8);
  unsigned int v5 = vcvtpd_u64_f64(a2 * (double)v4 / 3.0) | 1;
  size_t v6 = 3 * v5;
  *(_DWORD *)(v3 + 4) = v4;
  *(_DWORD *)(v3 + 8) = v6;
  *(_DWORD *)(v3 + 12) = v5;
  unsigned int v7 = (unsigned int *)malloc_type_malloc(24 * v4, 0x1000040504FFAC1uLL);
  v90[1] = v7;
  char v8 = (char *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  v90[2] = v8;
  unint64_t v9 = malloc_type_malloc(v6, 0xB0CACD9AuLL);
  v90[3] = v9;
  v84 = malloc_type_malloc(4 * *(unsigned int *)(v3 + 4), 0x100004052888210uLL);
  if (*(_DWORD *)(v2 + 16)) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Entering mapping step for mph creation of %u keys with graph sized %u\n", *(_DWORD *)(v3 + 4), *(_DWORD *)(v3 + 8));
  }
  v90[0] = 0;
  int v10 = 100;
  uint64_t v88 = v2;
  uint64_t v85 = v3;
  while (1)
  {
    int v86 = v10;
    *(void *)(v3 + 24) = hash_state_new(*(_DWORD *)v3, 0xFu);
    uint64_t v11 = *(void *)(v2 + 32);
    size_t v12 = *(unsigned int *)(v11 + 8);
    memset(v8, 255, 4 * v12);
    bzero(v9, v12);
    LODWORD(v90[0]) = 0;
    (*(void (**)(void))(*(void *)(v2 + 8) + 32))(**(void **)(v2 + 8));
    uint64_t v13 = *(void *)(v2 + 8);
    if (*(_DWORD *)(v13 + 8))
    {
      int v14 = 0;
      int v15 = v7 + 3;
      uint64_t v87 = v11;
      do
      {
        int v89 = v14;
        unsigned int v92 = 0;
        int v91 = 0;
        (*(void (**)(void, unsigned __int8 **, unsigned int *))(v13 + 16))(*(void *)v13, &v91, &v92);
        hash_vector(*(_DWORD **)(v11 + 24), v91, v92, &v93);
        unsigned int v16 = *(_DWORD *)(v11 + 12);
        unsigned __int32 v17 = v93.i32[0] % v16;
        unsigned int v18 = v93.i32[1] % v16 + v16;
        unsigned int v19 = v94 % v16 + 2 * v16;
        (*(void (**)(void, unsigned __int8 *, void))(*(void *)(v88 + 8) + 24))(**(void **)(v88 + 8), v91, v92);
        *(v15 - 3) = v17;
        *(v15 - 2) = v18;
        *(v15 - 1) = v19;
        *int v15 = *(_DWORD *)&v8[4 * v17];
        v15[1] = *(_DWORD *)&v8[4 * v18];
        v15[2] = *(_DWORD *)&v8[4 * v19];
        *(_DWORD *)&v8[4 * v19] = v89;
        *(_DWORD *)&v8[4 * v18] = v89;
        *(_DWORD *)&v8[4 * v17] = v89;
        ++*((unsigned char *)v9 + v17);
        ++*((unsigned char *)v9 + v18);
        ++*((unsigned char *)v9 + v19);
        uint64_t v11 = v87;
        int v14 = v89 + 1;
        uint64_t v13 = *(void *)(v88 + 8);
        v15 += 6;
      }
      while ((v89 + 1) < *(_DWORD *)(v13 + 8));
      unsigned int v20 = v89 + 1;
      LODWORD(v90[0]) = v89 + 1;
    }
    else
    {
      unsigned int v20 = 0;
    }
    unint64_t v21 = *(unsigned int *)(v11 + 4);
    unsigned int v22 = malloc_type_malloc((v21 >> 3) + 1, 0xF0A07DF0uLL);
    bzero(v22, (v21 >> 3) + 1);
    if (!v21) {
      goto LABEL_46;
    }
    uint64_t v23 = 0;
    int v24 = 0;
    int32x2_t v25 = v7 + 1;
    do
    {
      if (*((unsigned char *)v9 + *(v25 - 1)) == 1 || *((unsigned char *)v9 + *v25) == 1 || *((unsigned char *)v9 + v25[1]) == 1)
      {
        uint64_t v26 = v23 >> 3;
        unsigned __int8 v27 = bitmask_0[v23 & 7];
        if (!((v27 & *((unsigned char *)v22 + v26)) >> (v23 & 7)))
        {
          v84[v24++] = v23;
          *((unsigned char *)v22 + v26) |= v27;
        }
      }
      ++v23;
      v25 += 6;
    }
    while (v21 != v23);
    if (v24)
    {
      int v28 = 0;
      do
      {
        uint64_t v29 = 0;
        int v30 = v84[v28++];
        int v31 = &v7[6 * v30];
        do
        {
          uint64_t v32 = v31[v29];
          uint64_t v33 = &v8[4 * v32];
          for (unsigned int i = *(_DWORD *)v33; i != v30 && i != -1; unsigned int i = v39)
          {
            v36 = &v7[6 * i];
            if (*v36 == v32)
            {
              uint64_t v37 = 0;
            }
            else if (v36[1] == v32)
            {
              uint64_t v37 = 1;
            }
            else
            {
              uint64_t v37 = 2;
            }
            uint64_t v38 = (uint64_t)&v7[6 * i + v37];
            unsigned int v39 = *(_DWORD *)(v38 + 12);
            uint64_t v33 = (char *)(v38 + 12);
          }
          if (i == -1)
          {
            printf("\nerror remove edge %d dump graph", v30);
            bdz_ph_dump_graph((uint64_t)v90, v20, v20 + (v20 >> 2));
            exit(-1);
          }
          *(_DWORD *)uint64_t v33 = v7[6 * i + 3 + v29];
          --*((unsigned char *)v9 + v32);
          ++v29;
        }
        while (v29 != 3);
        uint64_t v41 = *v31;
        uint64_t v40 = v31[1];
        uint64_t v42 = v31[2];
        if (*((unsigned char *)v9 + v41) == 1)
        {
          unint64_t v43 = *(unsigned int *)&v8[4 * v41];
          unsigned __int8 v44 = bitmask_0[v43 & 7];
          if (!((v44 & *((unsigned char *)v22 + (v43 >> 3))) >> (v43 & 7)))
          {
            v84[v24++] = v43;
            *((unsigned char *)v22 + (v43 >> 3)) |= v44;
          }
        }
        if (*((unsigned char *)v9 + v40) == 1)
        {
          unint64_t v45 = *(unsigned int *)&v8[4 * v40];
          unsigned __int8 v46 = bitmask_0[v45 & 7];
          if (!((v46 & *((unsigned char *)v22 + (v45 >> 3))) >> (v45 & 7)))
          {
            v84[v24++] = v45;
            *((unsigned char *)v22 + (v45 >> 3)) |= v46;
          }
        }
        if (*((unsigned char *)v9 + v42) == 1)
        {
          unint64_t v47 = *(unsigned int *)&v8[4 * v42];
          unsigned __int8 v48 = bitmask_0[v47 & 7];
          if (!((v48 & *((unsigned char *)v22 + (v47 >> 3))) >> (v47 & 7)))
          {
            v84[v24++] = v47;
            *((unsigned char *)v22 + (v47 >> 3)) |= v48;
          }
        }
      }
      while (v28 != v24);
    }
    else
    {
LABEL_46:
      int v28 = 0;
    }
    free(v22);
    if (v28 == v21) {
      break;
    }
    uint64_t v3 = v85;
    int v10 = v86 - 1;
    hash_state_destroy(*(_DWORD **)(v85 + 24));
    *(void *)(v85 + 24) = 0;
    uint64_t v2 = v88;
    if (*(_DWORD *)(v88 + 16)) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "acyclic graph creation failure - %u iterations remaining\n", v10);
    }
    if (v86 == 1)
    {
      free(v84);
      free(v7);
      free(v8);
      free(v9);
      return 0;
    }
  }
  free(v8);
  free(v9);
  char v49 = (FILE **)MEMORY[0x263EF8348];
  if (*(_DWORD *)(v88 + 16)) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Entering assigning step for mph creation of %u keys with graph sized %u\n", *(_DWORD *)(v85 + 4), *(_DWORD *)(v85 + 8));
  }
  v50 = (char *)malloc_type_malloc(((unint64_t)*(unsigned int *)(v85 + 8) >> 3) + 1, 0xD2234E03uLL);
  v51 = v50;
  LODWORD(v52) = *(_DWORD *)(v85 + 8);
  LODWORD(v50) = vcvtpd_u64_f64((double)v52 * 0.25);
  *(void *)(v85 + 16) = malloc_type_calloc((size_t)v50, 1uLL, 0x100004077774924uLL);
  bzero(v51, ((unint64_t)*(unsigned int *)(v85 + 8) >> 3) + 1);
  if (v20)
  {
    unsigned int v53 = v20 - 1;
    do
    {
      v54 = &v7[6 * v84[v53]];
      unint64_t v56 = *v54;
      unint64_t v55 = v54[1];
      unint64_t v57 = v54[2];
      unsigned __int8 v58 = bitmask_0[v56 & 7];
      v59 = &v51[v55 >> 3];
      unsigned int v60 = *v59;
      int v61 = bitmask_0[v55 & 7];
      unsigned int v62 = (v61 & v60) >> (v55 & 7);
      if ((v58 & v51[v56 >> 3]) >> (v56 & 7))
      {
        if (v62)
        {
          uint64_t v63 = *(void *)(v85 + 16);
          int v64 = 8
              - (((*(unsigned __int8 *)(v63 + (v55 >> 2)) >> (2 * (v55 & 3))) & 3)
               + ((*(unsigned __int8 *)(v63 + (v56 >> 2)) >> (2 * (v56 & 3))) & 3));
          *(unsigned char *)(v63 + (v57 >> 2)) |= (v64 - 3 * ((86 * v64) >> 8)) << (2 * (v57 & 3));
          unsigned __int8 v58 = bitmask_0[v57 & 7];
          v59 = &v51[v57 >> 3];
        }
        else
        {
          unsigned int v68 = v51[v57 >> 3];
          int v69 = bitmask_0[v57 & 7];
          if (!((v69 & v68) >> (v57 & 7))) {
            v51[v57 >> 3] = v69 | v68;
          }
          uint64_t v70 = *(void *)(v85 + 16);
          int v71 = (((*(unsigned __int8 *)(v70 + (v57 >> 2)) >> (2 * (v57 & 3))) & 3)
               + ((*(unsigned __int8 *)(v70 + (v56 >> 2)) >> (2 * (v56 & 3))) & 3)) ^ 7;
          *(unsigned char *)(v70 + (v55 >> 2)) |= (v71 - 3 * ((86 * v71) >> 8)) << (2 * (v55 & 3));
          unsigned __int8 v58 = v61;
        }
      }
      else
      {
        if (!v62) {
          char *v59 = v61 | v60;
        }
        unsigned int v65 = v51[v57 >> 3];
        int v66 = bitmask_0[v57 & 7];
        if (!((v66 & v65) >> (v57 & 7))) {
          v51[v57 >> 3] = v66 | v65;
        }
        uint64_t v67 = *(void *)(v85 + 16);
        *(unsigned char *)(v67 + (v56 >> 2)) |= ((6
                                                         - (((*(unsigned __int8 *)(v67 + (v57 >> 2)) >> (2 * (v57 & 3))) & 3)
                                                          + ((*(unsigned __int8 *)(v67 + (v55 >> 2)) >> (2 * (v55 & 3))) & 3)))
                                       % 3u) << (2 * (v56 & 3));
        v59 = &v51[v56 >> 3];
      }
      *v59 |= v58;
    }
    while ((unint64_t)v53--);
  }
  free(v51);
  free(v84);
  free(v7);
  if (*(_DWORD *)(v88 + 16)) {
    size_t v73 = fwrite("Starting optimization step\n", 0x1BuLL, 1uLL, *v49);
  }
  LODWORD(v74) = *(_DWORD *)(v85 + 8);
  LODWORD(v73) = vcvtpd_u64_f64((double)v74 / 5.0);
  unsigned int v75 = malloc_type_calloc(v73, 1uLL, 0x100004077774924uLL);
  unsigned int v76 = v75;
  if (*(_DWORD *)(v85 + 8))
  {
    int v77 = 0;
    unint64_t v78 = 0;
    unsigned int v79 = (char *)&pow3_table;
    do
    {
      v75[v78 / 5uLL] += ((*(unsigned __int8 *)(*(void *)(v85 + 16) + (v78 >> 2)) >> (v77 & 6)) & 3)
                                     * v79[-5 * (v78 / 5)];
      ++v78;
      ++v79;
      v77 += 2;
    }
    while (v78 < *(_DWORD *)(v85 + 8));
  }
  free(*(void **)(v85 + 16));
  *(void *)(v85 + 16) = v76;
  v82 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v82 = *(_DWORD *)v88;
  v80 = (char *)malloc_type_malloc(0x20uLL, 0x1030040ECD7FD48uLL);
  *((_OWORD *)v80 + 1) = *(_OWORD *)(v85 + 16);
  *(void *)(v85 + 16) = 0;
  *(void *)(v85 + 24) = 0;
  *(_DWORD *)v80 = *(_DWORD *)(v85 + 4);
  uint64_t v81 = *(void *)(v85 + 8);
  *(void *)(v80 + 4) = v81;
  v82[2] = v80;
  *((_DWORD *)v82 + 1) = v81;
  if (*(_DWORD *)(v88 + 16)) {
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v49);
  }
  return v82;
}

uint64_t bdz_ph_dump(uint64_t a1, FILE *a2)
{
  char v8 = 0;
  unsigned int __ptr = 0;
  uint64_t v3 = *(void *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  hash_state_dump(*(_DWORD **)(v3 + 24), &v8, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v8, __ptr, 1uLL, a2);
  free(v8);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 8), 4uLL, 1uLL, a2);
  LODWORD(v4) = *(_DWORD *)(v3 + 4);
  LODWORD(v5) = vcvtpd_u64_f64((double)v4 / 5.0);
  fwrite(*(const void **)(v3 + 16), v5, 1uLL, a2);
  return 1;
}

size_t bdz_ph_load(FILE *a1, uint64_t a2)
{
  unsigned int __ptr = 0;
  unint64_t v4 = malloc_type_malloc(0x20uLL, 0x1030040ECD7FD48uLL);
  *(void *)(a2 + 16) = v4;
  fread(&__ptr, 4uLL, 1uLL, a1);
  size_t v7 = __ptr;
  size_t v5 = malloc_type_malloc(__ptr, 0x44FAF061uLL);
  fread(v5, v7, 1uLL, a1);
  v4[3] = hash_state_load((const char *)v5);
  free(v5);
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  fread(v4 + 1, 4uLL, 1uLL, a1);
  LODWORD(v6) = *((_DWORD *)v4 + 1);
  LODWORD(v7) = vcvtpd_u64_f64((double)v6 / 5.0);
  char v8 = malloc_type_calloc(v7, 1uLL, 0x100004077774924uLL);
  v4[2] = v8;

  return fread(v8, v7, 1uLL, a1);
}

uint64_t bdz_ph_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 16);
  hash_vector(*(_DWORD **)(v3 + 24), a2, a3, &v8);
  unsigned int v4 = *(_DWORD *)(v3 + 8);
  v8.i32[0] %= v4;
  v8.i32[1] = v8.i32[1] % v4 + v4;
  unsigned int v9 = v9 % v4 + 2 * v4;
  uint64_t v5 = *(void *)(v3 + 16);
  int v6 = lookup_table[256 * (unint64_t)(v8.i32[1] % 5u) + *(unsigned __int8 *)(v5 + v8.u32[1] / 5uLL)]
     + lookup_table[256 * (unint64_t)(v8.i32[0] % 5u) + *(unsigned __int8 *)(v5 + v8.u32[0] / 5uLL)]
     + lookup_table[256 * (unint64_t)(v9 % 5) + *(unsigned __int8 *)(v5 + v9 / 5uLL)];
  return v8.u32[(unsigned __int16)(v6 - 3 * ((21846 * v6) >> 16))];
}

void bdz_ph_destroy(void *a1)
{
  uint64_t v2 = a1[2];
  free(*(void **)(v2 + 16));
  hash_state_destroy(*(_DWORD **)(v2 + 24));
  free((void *)v2);

  free(a1);
}

void *bdz_ph_pack(uint64_t a1, int *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int type = hash_get_type(*(unsigned int **)(v3 + 24));
  *a2++ = type;
  hash_state_pack(*(_DWORD **)(v3 + 24), a2);
  uint64_t v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  *uint64_t v5 = *(_DWORD *)(v3 + 8);
  int v6 = v5 + 1;
  LODWORD(v7) = *(_DWORD *)(v3 + 4);
  LODWORD(v8) = vcvtpd_u64_f64((double)v7 / 5.0);
  unsigned int v9 = *(const void **)(v3 + 16);

  return memcpy(v6, v9, v8);
}

uint64_t bdz_ph_packed_size(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int type = hash_get_type(*(unsigned int **)(v1 + 24));
  LODWORD(v3) = *(_DWORD *)(v1 + 4);
  return hash_state_packed_size(type) + vcvtpd_u64_f64((double)v3 / 5.0) + 12;
}

uint64_t bdz_ph_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = (unsigned int *)(a1 + 1);
  int v6 = *a1;
  unint64_t v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  unsigned int v9 = *v7++;
  unsigned int v8 = v9;
  hash_vector_packed(v5, v6, a2, a3, &v14);
  v14.i32[0] %= v9;
  v14.i32[1] = v14.i32[1] % v8 + v8;
  uint64_t v10 = *((unsigned __int8 *)v7 + v14.u32[0] / 5uLL);
  uint64_t v11 = *((unsigned __int8 *)v7 + v14.u32[1] / 5uLL);
  unsigned int v15 = v15 % v8 + 2 * v8;
  int v12 = lookup_table[256 * (unint64_t)(v14.i32[1] % 5u) + v11]
      + lookup_table[256 * (unint64_t)(v14.i32[0] % 5u) + v10]
      + lookup_table[256 * (unint64_t)(v15 % 5) + *((unsigned __int8 *)v7 + v15 / 5uLL)];
  return v14.u32[(unsigned __int16)(v12 - 3 * ((21846 * v12) >> 16))];
}

uint64_t bdz_ph_dump_graph(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v4 = result;
  if (a2)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    uint64_t v7 = 24 * a2;
    do
    {
      printf("\nedge %d %d %d %d ", v6, *(_DWORD *)(*(void *)(v4 + 8) + v5), *(_DWORD *)(*(void *)(v4 + 8) + v5 + 4), *(_DWORD *)(*(void *)(v4 + 8) + v5 + 8));
      double result = printf(" nexts %d %d %d", *(_DWORD *)(*(void *)(v4 + 8) + v5 + 12), *(_DWORD *)(*(void *)(v4 + 8) + v5 + 16), *(_DWORD *)(*(void *)(v4 + 8) + v5 + 20));
      ++v6;
      v5 += 24;
    }
    while (v7 != v5);
  }
  if (a3)
  {
    uint64_t v8 = 0;
    do
    {
      double result = printf("\nfirst for vertice %d %d ", v8, *(_DWORD *)(*(void *)(v4 + 16) + 4 * v8));
      ++v8;
    }
    while (a3 != v8);
  }
  return result;
}

double bmz_config_new()
{
  v0 = malloc_type_malloc(0x28uLL, 0x10B004021B77C51uLL);
  if (v0)
  {
    v0[4] = 0;
    double result = 0.0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void bmz_config_destroy(uint64_t a1)
{
}

uint64_t bmz_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1)
  {
    uint64_t v2 = *(_DWORD **)(result + 32);
    *uint64_t v2 = *a2;
    int v3 = a2[1];
    if (v3 != 1) {
      v2[1] = v3;
    }
  }
  return result;
}

void *bmz_new(uint64_t a1, double a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 8) + 8);
  if (a2 == 0.0) {
    double v5 = 1.15;
  }
  else {
    double v5 = a2;
  }
  unsigned int v6 = vcvtpd_u64_f64(v5 * (double)v4);
  *(_DWORD *)(v3 + 8) = v4;
  *(_DWORD *)(v3 + 12) = v6;
  *(void *)(v3 + 16) = graph_new(v6, v4);
  uint64_t v7 = malloc_type_malloc(0x18uLL, 0x2004093837F09uLL);
  uint64_t v8 = 0;
  *(void *)(v3 + 32) = v7;
  do
  {
    *(void *)(*(void *)(v3 + 32) + v8) = 0;
    v8 += 8;
  }
  while (v8 != 24);
  int v9 = 0;
  uint64_t v10 = 20;
  uint64_t v82 = v2;
  do
  {
    uint64_t v85 = v10;
    if (*(_DWORD *)(v2 + 16)) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "Entering mapping step for mph creation of %u keys with graph sized %u\n", *(_DWORD *)(v3 + 8), *(_DWORD *)(v3 + 12));
    }
    int v11 = 100;
    while (1)
    {
      **(void **)(v3 + 32) = hash_state_new(*(_DWORD *)v3, *(_DWORD *)(v3 + 12));
      *(void *)(*(void *)(v3 + 32) + 8) = hash_state_new(*(_DWORD *)(v3 + 4), *(_DWORD *)(v3 + 12));
      uint64_t v12 = *(void *)(v2 + 32);
      graph_clear_edges(*(unsigned int **)(v12 + 16));
      (*(void (**)(void))(*(void *)(v2 + 8) + 32))(**(void **)(v2 + 8));
      uint64_t v13 = *(void *)(v2 + 8);
      if (!*(_DWORD *)(v13 + 8)) {
        break;
      }
      unsigned int v14 = 0;
      while (1)
      {
        LODWORD(v92) = 0;
        int32x2_t v93 = 0;
        (*(void (**)(void, unsigned __int8 **, unint64_t *))(v13 + 16))(*(void *)v13, &v93, &v92);
        unsigned int v15 = hash(**(_DWORD ***)(v12 + 32), v93, v92) % *(_DWORD *)(v12 + 12);
        unsigned int v16 = hash(*(_DWORD **)(*(void *)(v12 + 32) + 8), v93, v92);
        unsigned int v17 = *(_DWORD *)(v12 + 12);
        int v18 = v16 % v17;
        int v19 = v16 % v17 + 1 < v17 ? v18 + 1 : 0;
        unsigned int v20 = v15 == v18 ? v19 : v18;
        if (v15 == v20) {
          break;
        }
        (*(void (**)(void, unsigned __int8 *, void))(*(void *)(v2 + 8) + 24))(**(void **)(v2 + 8), v93, v92);
        int v21 = graph_contains_edge(*(void *)(v12 + 16), v15, v20);
        if (*(_DWORD *)(v2 + 16) && v21)
        {
          fwrite("A non simple graph was generated\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
          goto LABEL_28;
        }
        if (v21) {
          goto LABEL_28;
        }
        graph_add_edge(*(void *)(v12 + 16), v15, v20);
        ++v14;
        uint64_t v13 = *(void *)(v2 + 8);
        if (v14 >= *(_DWORD *)(v13 + 8)) {
          goto LABEL_32;
        }
      }
      if (*(_DWORD *)(v2 + 16)) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "Self loop for key %u\n", v14);
      }
      (*(void (**)(void, unsigned __int8 *, void))(*(void *)(v2 + 8) + 24))(**(void **)(v2 + 8), v93, v92);
LABEL_28:
      --v11;
      hash_state_destroy(**(_DWORD ***)(v3 + 32));
      **(void **)(v3 + 32) = 0;
      hash_state_destroy(*(_DWORD **)(*(void *)(v3 + 32) + 8));
      *(void *)(*(void *)(v3 + 32) + 8) = 0;
      if (*(_DWORD *)(v2 + 16)) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "simple graph creation failure - %u iterations remaining\n", v11);
      }
      if (!v11)
      {
        graph_destroy(*(void ***)(v3 + 16));
        return 0;
      }
    }
LABEL_32:
    if (*(_DWORD *)(v2 + 16)) {
      fwrite("Starting ordering step\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    graph_obtain_critical_nodes(*(void ***)(v3 + 16));
    if (*(_DWORD *)(v2 + 16))
    {
      unsigned int v22 = (FILE **)MEMORY[0x263EF8348];
      fwrite("Starting Searching step.\n", 0x19uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      fwrite("\tTraversing critical vertices.\n", 0x1FuLL, 1uLL, *v22);
    }
    uint64_t v23 = malloc_type_malloc(((unint64_t)*(unsigned int *)(v3 + 12) >> 3) + 1, 0x6CF02805uLL);
    bzero(v23, ((unint64_t)*(unsigned int *)(v3 + 12) >> 3) + 1);
    int v24 = malloc_type_malloc(((unint64_t)*(unsigned int *)(v3 + 8) >> 3) + 1, 0x18E0B029uLL);
    bzero(v24, ((unint64_t)*(unsigned int *)(v3 + 8) >> 3) + 1);
    free(*(void **)(v3 + 24));
    int32x2_t v25 = malloc_type_calloc(*(unsigned int *)(v3 + 12), 4uLL, 0x100004052888210uLL);
    *(void *)(v3 + 24) = v25;
    if (!v25) {
      bmz_new_cold_1();
    }
    if (*(_DWORD *)(v3 + 12))
    {
      unint64_t v26 = 0;
      unsigned int v91 = 0;
      unsigned int v27 = 1;
      do
      {
        if (graph_node_is_critical(*(void *)(v3 + 16), v26))
        {
          uint64_t v28 = v26 >> 3;
          char v29 = bitmask_1[v26 & 7];
          if (!((v29 & *((unsigned char *)v23 + v28)) >> (v26 & 7)))
          {
            unsigned int v30 = graph_ncritical_nodes(*(void *)(v3 + 16));
            if (v5 <= 1.14)
            {
              uint64_t v33 = (void **)vqueue_new(((double)v30 * 0.5) + 1);
              unint64_t v92 = 0;
              int32x2_t v93 = 0;
              *(_DWORD *)(*(void *)(v3 + 24) + 4 * v26) = vcvtpd_u64_f64((double)v27 * 0.5) - 1;
              *((unsigned char *)v23 + v28) |= v29;
              vqueue_insert((uint64_t)v33, v26);
              if (vqueue_is_empty((uint64_t)v33))
              {
                v34 = 0;
                int v35 = 0;
              }
              else
              {
                unsigned int v90 = 0;
                unsigned int v83 = 0;
                uint64_t v84 = (uint64_t)v33;
                v34 = 0;
                do
                {
                  unsigned int v50 = vqueue_remove((uint64_t)v33);
                  int32x2_t v93 = (unsigned __int8 *)graph_neighbors_it(*(void *)(v3 + 16), v50);
                  unsigned int v51 = graph_next_neighbor(*(void *)(v3 + 16), &v93);
                  if (v51 != -1)
                  {
                    for (unsigned int i = v51; i != -1; unsigned int i = graph_next_neighbor(*(void *)(v3 + 16), &v93))
                    {
                      if (graph_node_is_critical(*(void *)(v3 + 16), i))
                      {
                        uint64_t v53 = i & 7;
                        if (!((bitmask_1[v53] & *((unsigned char *)v23 + ((unint64_t)i >> 3))) >> v53))
                        {
                          char v86 = bitmask_1[v53];
                          unsigned int v54 = 0;
                          unsigned int v55 = v90;
                          while (1)
                          {
                            unsigned int v90 = v55;
                            ptra = v34;
                            if (v54 >= v55)
                            {
                              unsigned int v56 = v91 + 1;
                              unsigned int v54 = -1;
                            }
                            else
                            {
                              unsigned int v56 = *((_DWORD *)v34 + v54++);
                            }
                            unint64_t v92 = graph_neighbors_it(*(void *)(v3 + 16), i);
                            unsigned int v57 = graph_next_neighbor(*(void *)(v3 + 16), &v92);
                            if (v57 == -1) {
                              break;
                            }
                            unsigned int v58 = v57;
                            while (1)
                            {
                              if (graph_node_is_critical(*(void *)(v3 + 16), v58)
                                && (bitmask_1[v58 & 7] & *((unsigned char *)v23 + ((unint64_t)v58 >> 3))) >> (v58 & 7))
                              {
                                unint64_t v59 = *(_DWORD *)(*(void *)(v3 + 24) + 4 * v58) + v56;
                                if (v59 >= *(_DWORD *)(v3 + 8))
                                {
                                  int v35 = 1;
                                  uint64_t v33 = (void **)v84;
                                  v34 = ptra;
                                  goto LABEL_116;
                                }
                                if ((bitmask_1[v59 & 7] & *((unsigned char *)v24 + (v59 >> 3))) >> (v59 & 7)) {
                                  break;
                                }
                              }
                              unsigned int v58 = graph_next_neighbor(*(void *)(v3 + 16), &v92);
                              if (v58 == -1) {
                                goto LABEL_100;
                              }
                            }
                            v34 = ptra;
                            if (v56 <= v91)
                            {
                              unsigned int v55 = v90;
                            }
                            else
                            {
                              unsigned int v60 = v90;
                              if (v90 == v83)
                              {
                                unsigned int v83 = v90 + 1024;
                                int v61 = malloc_type_realloc(ptra, 4 * (v90 + 1024), 0x100004052888210uLL);
                                unsigned int v60 = v90;
                                v34 = v61;
                              }
                              *((_DWORD *)v34 + v60) = v56;
                              unsigned int v55 = v60 + 1;
                            }
                            unsigned int v62 = v91;
                            if (v56 > v91) {
                              unsigned int v62 = v56;
                            }
                            unsigned int v91 = v62;
                          }
LABEL_100:
                          unsigned int v64 = v90;
                          unsigned int v63 = v91;
                          if (v56 > v91) {
                            unsigned int v63 = v56;
                          }
                          unsigned int v91 = v63;
                          if (v54 - 1 < v90)
                          {
                            --v90;
                            *((_DWORD *)ptra + v54 - 1) = *((_DWORD *)ptra + v64 - 1);
                          }
                          unint64_t v92 = graph_neighbors_it(*(void *)(v3 + 16), i);
                          unsigned int v65 = graph_next_neighbor(*(void *)(v3 + 16), &v92);
                          if (v65 != -1)
                          {
                            for (unsigned int j = v65; j != -1; unsigned int j = graph_next_neighbor(*(void *)(v3 + 16), &v92))
                            {
                              if (graph_node_is_critical(*(void *)(v3 + 16), j))
                              {
                                if ((bitmask_1[j & 7] & *((unsigned char *)v23 + ((unint64_t)j >> 3))) >> (j & 7))
                                {
                                  unint64_t v67 = *(_DWORD *)(*(void *)(v3 + 24) + 4 * j) + v56;
                                  *((unsigned char *)v24 + (v67 >> 3)) |= bitmask_1[v67 & 7];
                                  if (*(_DWORD *)(*(void *)(v3 + 24) + 4 * j) + v56 > v27) {
                                    unsigned int v27 = *(_DWORD *)(*(void *)(v3 + 24) + 4 * j) + v56;
                                  }
                                }
                              }
                            }
                          }
                          *(_DWORD *)(*(void *)(v3 + 24) + 4 * i) = v56;
                          *((unsigned char *)v23 + ((unint64_t)i >> 3)) |= v86;
                          uint64_t v33 = (void **)v84;
                          vqueue_insert(v84, i);
                          v34 = ptra;
                        }
                      }
                    }
                  }
                  int v35 = 0;
                }
                while (!vqueue_is_empty((uint64_t)v33));
              }
LABEL_116:
              vqueue_destroy(v33);
              free(v34);
              if (v35)
              {
LABEL_144:
                int v9 = 1;
                goto LABEL_123;
              }
            }
            else
            {
              int v31 = (void **)vqueue_new(v30 + 1);
              unint64_t v92 = 0;
              int32x2_t v93 = 0;
              *(_DWORD *)(*(void *)(v3 + 24) + 4 * v26) = vcvtpd_u64_f64((double)v27 * 0.5) - 1;
              *((unsigned char *)v23 + v28) |= v29;
              vqueue_insert((uint64_t)v31, v26);
              if (vqueue_is_empty((uint64_t)v31))
              {
                int v32 = 0;
                goto LABEL_119;
              }
              ptr = v31;
              do
              {
                unsigned int v36 = vqueue_remove((uint64_t)v31);
                int32x2_t v93 = (unsigned __int8 *)graph_neighbors_it(*(void *)(v3 + 16), v36);
                unsigned int v37 = graph_next_neighbor(*(void *)(v3 + 16), &v93);
                if (v37 != -1)
                {
                  for (unsigned int k = v37; k != -1; unsigned int k = graph_next_neighbor(*(void *)(v3 + 16), &v93))
                  {
                    if (graph_node_is_critical(*(void *)(v3 + 16), k))
                    {
                      unint64_t v39 = (unint64_t)k >> 3;
                      uint64_t v40 = k & 7;
                      if (!((bitmask_1[v40] & *((unsigned char *)v23 + v39)) >> v40))
                      {
                        char v89 = bitmask_1[v40];
                        unsigned int v41 = v91 + 1;
                        unint64_t v92 = graph_neighbors_it(*(void *)(v3 + 16), k);
                        unsigned int v42 = graph_next_neighbor(*(void *)(v3 + 16), &v92);
                        if (v42 != -1)
                        {
                          for (unsigned int m = v42; m != -1; unsigned int m = graph_next_neighbor(*(void *)(v3 + 16), &v92))
                          {
                            if (graph_node_is_critical(*(void *)(v3 + 16), m)
                              && (bitmask_1[m & 7] & *((unsigned char *)v23 + ((unint64_t)m >> 3))) >> (m & 7))
                            {
                              unint64_t v44 = *(_DWORD *)(*(void *)(v3 + 24) + 4 * m) + v41;
                              if (v44 >= *(_DWORD *)(v3 + 8))
                              {
                                int v32 = 1;
                                int v31 = ptr;
                                goto LABEL_119;
                              }
                              if ((bitmask_1[v44 & 7] & *((unsigned char *)v24 + (v44 >> 3))) >> (v44 & 7))
                              {
                                unsigned int v45 = v91;
                                if (v41 > v91) {
                                  unsigned int v45 = v41;
                                }
                                unsigned int v91 = v45;
                                unsigned int v41 = v45 + 1;
                                unint64_t v92 = graph_neighbors_it(*(void *)(v3 + 16), k);
                              }
                            }
                          }
                        }
                        unsigned int v46 = v91;
                        if (v41 > v91) {
                          unsigned int v46 = v41;
                        }
                        unsigned int v91 = v46;
                        unint64_t v92 = graph_neighbors_it(*(void *)(v3 + 16), k);
                        unsigned int v47 = graph_next_neighbor(*(void *)(v3 + 16), &v92);
                        if (v47 != -1)
                        {
                          for (unsigned int n = v47; n != -1; unsigned int n = graph_next_neighbor(*(void *)(v3 + 16), &v92))
                          {
                            if (graph_node_is_critical(*(void *)(v3 + 16), n))
                            {
                              if ((bitmask_1[n & 7] & *((unsigned char *)v23 + ((unint64_t)n >> 3))) >> (n & 7))
                              {
                                unint64_t v49 = *(_DWORD *)(*(void *)(v3 + 24) + 4 * n) + v41;
                                *((unsigned char *)v24 + (v49 >> 3)) |= bitmask_1[v49 & 7];
                                if (*(_DWORD *)(*(void *)(v3 + 24) + 4 * n) + v41 > v27) {
                                  unsigned int v27 = *(_DWORD *)(*(void *)(v3 + 24) + 4 * n) + v41;
                                }
                              }
                            }
                          }
                        }
                        *(_DWORD *)(*(void *)(v3 + 24) + 4 * k) = v41;
                        *((unsigned char *)v23 + v39) |= v89;
                        int v31 = ptr;
                        vqueue_insert((uint64_t)ptr, k);
                      }
                    }
                  }
                }
                int v32 = 0;
              }
              while (!vqueue_is_empty((uint64_t)v31));
LABEL_119:
              vqueue_destroy(v31);
              if (v32) {
                goto LABEL_144;
              }
            }
            int v9 = 0;
          }
        }
        ++v26;
      }
      while (v26 < *(unsigned int *)(v3 + 12));
    }
    if (v9)
    {
LABEL_123:
      int v68 = v85 - 1;
      uint64_t v2 = v82;
      uint64_t v85 = (v85 - 1);
      if (*(_DWORD *)(v82 + 16)) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "Restarting mapping step. %u iterations remaining.\n", v68);
      }
      goto LABEL_141;
    }
    uint64_t v2 = v82;
    if (*(_DWORD *)(v82 + 16)) {
      fwrite("\tTraversing non critical vertices.\n", 0x23uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    LODWORD(v93) = 0;
    if (*(_DWORD *)(v3 + 8))
    {
      for (iunsigned int i = 0; ii < *(_DWORD *)(v3 + 8); ++ii)
      {
        unsigned int v70 = graph_vertex_id(*(void *)(v3 + 16), ii, 0);
        unsigned int v71 = graph_vertex_id(*(void *)(v3 + 16), ii, 1);
        int v72 = (bitmask_1[v71 & 7] & *((unsigned char *)v23 + ((unint64_t)v71 >> 3))) >> (v71 & 7);
        if ((bitmask_1[v70 & 7] & *((unsigned char *)v23 + ((unint64_t)v70 >> 3))) >> (v70 & 7))
        {
          if (!v72)
          {
            unsigned int v73 = v70;
LABEL_133:
            bmz_traverse(v3, (uint64_t)v24, v73, (unsigned int *)&v93, (uint64_t)v23);
          }
        }
        else
        {
          unsigned int v73 = v71;
          if (v72) {
            goto LABEL_133;
          }
        }
      }
    }
    unint64_t v74 = *(unsigned int *)(v3 + 12);
    if (v74)
    {
      for (junsigned int j = 0; jj < v74; ++jj)
      {
        uint64_t v76 = jj >> 3;
        char v77 = bitmask_1[jj & 7];
        if (!((v77 & *((unsigned char *)v23 + v76)) >> (jj & 7)))
        {
          *(_DWORD *)(*(void *)(v3 + 24) + 4 * jj) = 0;
          *((unsigned char *)v23 + v76) |= v77;
          bmz_traverse(v3, (uint64_t)v24, jj, (unsigned int *)&v93, (uint64_t)v23);
          unint64_t v74 = *(unsigned int *)(v3 + 12);
        }
      }
    }
    int v9 = 0;
LABEL_141:
    free(v24);
    free(v23);
    uint64_t v10 = v85;
  }
  while (v9 && v85);
  graph_destroy(*(void ***)(v3 + 16));
  *(void *)(v3 + 16) = 0;
  if (!v85) {
    return 0;
  }
  unint64_t v78 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)unint64_t v78 = *(_DWORD *)v2;
  v80 = (char *)malloc_type_malloc(0x18uLL, 0x1090040F2DB8820uLL);
  long long v81 = *(_OWORD *)(v3 + 24);
  *(void *)(v3 + 24) = 0;
  *(_OWORD *)(v80 + 8) = v81;
  *(void *)(v3 + 32) = 0;
  *(void *)&long long v81 = *(void *)(v3 + 8);
  *(void *)v80 = v81;
  v78[2] = v80;
  *((_DWORD *)v78 + 1) = v81;
  if (*(_DWORD *)(v2 + 16)) {
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  return v78;
}

uint64_t bmz_dump(uint64_t a1, FILE *a2)
{
  uint64_t v7 = 0;
  int v5 = 2;
  unsigned int __ptr = 0;
  uint64_t v3 = *(void *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  fwrite(&v5, 4uLL, 1uLL, a2);
  hash_state_dump(**(_DWORD ***)(v3 + 16), &v7, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v7, __ptr, 1uLL, a2);
  free(v7);
  hash_state_dump(*(_DWORD **)(*(void *)(v3 + 16) + 8), &v7, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v7, __ptr, 1uLL, a2);
  free(v7);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 8), 4 * *(unsigned int *)(v3 + 4), 1uLL, a2);
  return 1;
}

size_t bmz_load(FILE *a1, uint64_t a2)
{
  unsigned int size_4 = 0;
  unsigned int v4 = malloc_type_malloc(0x18uLL, 0x1090040F2DB8820uLL);
  *(void *)(a2 + 16) = v4;
  fread(&size_4, 4uLL, 1uLL, a1);
  uint64_t v5 = size_4;
  unsigned int v6 = malloc_type_malloc(8 * (size_4 + 1), 0x2004093837F09uLL);
  v4[2] = v6;
  v6[v5] = 0;
  if (v5)
  {
    uint64_t v7 = 0;
    unsigned int size = 0;
    uint64_t v8 = 8 * v5;
    do
    {
      fread(&size, 4uLL, 1uLL, a1);
      size_t v9 = size;
      uint64_t v10 = malloc_type_malloc(size, 0x26E2CE4BuLL);
      fread(v10, v9, 1uLL, a1);
      *(void *)(v4[2] + v7) = hash_state_load((const char *)v10);
      free(v10);
      v7 += 8;
    }
    while (v8 != v7);
  }
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  int v11 = malloc_type_malloc(4 * *((unsigned int *)v4 + 1), 0x100004052888210uLL);
  v4[1] = v11;
  size_t v12 = 4 * *((unsigned int *)v4 + 1);

  return fread(v11, v12, 1uLL, a1);
}

uint64_t bmz_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  unsigned int v6 = hash(**(_DWORD ***)(v5 + 16), a2, a3) % *(_DWORD *)(v5 + 4);
  unsigned int v7 = hash(*(_DWORD **)(*(void *)(v5 + 16) + 8), a2, a3) % *(_DWORD *)(v5 + 4);
  if (v6 == v7) {
    ++v7;
  }
  return (*(_DWORD *)(*(void *)(v5 + 8) + 4 * v7) + *(_DWORD *)(*(void *)(v5 + 8) + 4 * v6));
}

void bmz_destroy(void *a1)
{
  uint64_t v2 = (void **)a1[2];
  free(v2[1]);
  hash_state_destroy(*(_DWORD **)v2[2]);
  hash_state_destroy(*((_DWORD **)v2[2] + 1));
  free(v2[2]);
  free(v2);

  free(a1);
}

void *bmz_pack(uint64_t a1, int *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int type = hash_get_type(**(unsigned int ***)(v3 + 16));
  *a2++ = type;
  hash_state_pack(**(_DWORD ***)(v3 + 16), a2);
  uint64_t v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  int v6 = hash_get_type(*(unsigned int **)(*(void *)(v3 + 16) + 8));
  *v5++ = v6;
  hash_state_pack(*(_DWORD **)(*(void *)(v3 + 16) + 8), v5);
  unsigned int v7 = (int *)((char *)v5 + hash_state_packed_size(v6));
  *unsigned int v7 = *(_DWORD *)(v3 + 4);
  uint64_t v8 = v7 + 1;
  size_t v9 = *(const void **)(v3 + 8);
  size_t v10 = 4 * *(unsigned int *)(v3 + 4);

  return memcpy(v8, v9, v10);
}

uint64_t bmz_packed_size(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int type = hash_get_type(**(unsigned int ***)(v1 + 16));
  int v3 = hash_get_type(*(unsigned int **)(*(void *)(v1 + 16) + 8));
  int v4 = hash_state_packed_size(type);
  return v4 + hash_state_packed_size(v3) + 4 * *(_DWORD *)(v1 + 4) + 16;
}

uint64_t bmz_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5 = (unsigned int *)(a1 + 1);
  int v6 = *a1;
  unsigned int v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  int v9 = *v7++;
  int v8 = v9;
  size_t v10 = (unsigned int *)((char *)v7 + hash_state_packed_size(v9));
  unsigned int v12 = *v10;
  int v11 = v10 + 1;
  unsigned int v13 = hash_packed(v5, v6, a2, a3) % v12;
  unsigned int v14 = hash_packed(v7, v8, a2, a3) % v12;
  if (v13 == v14) {
    ++v14;
  }
  return (v11[v14] + v11[v13]);
}

uint64_t bmz_traverse(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int *a4, uint64_t a5)
{
  unint64_t v17 = graph_neighbors_it(*(void *)(a1 + 16), a3);
  uint64_t result = graph_next_neighbor(*(void *)(a1 + 16), &v17);
  if (result != -1)
  {
    unsigned int v11 = result;
    do
    {
      unint64_t v12 = (unint64_t)v11 >> 3;
      uint64_t v13 = v11 & 7;
      char v14 = bitmask_1[v13];
      if (!((v14 & *(unsigned char *)(a5 + v12)) >> v13))
      {
        unsigned int v15 = *a4;
        unsigned int v16 = *(_DWORD *)(a1 + 8);
        if (v16 <= *a4) {
LABEL_11:
        }
          bmz_traverse_cold_1();
        while ((bitmask_1[v15 & 7] & *(unsigned char *)(a2 + ((unint64_t)v15 >> 3))) >> (v15 & 7))
        {
          if (v16 == ++v15) {
            goto LABEL_11;
          }
        }
        *a4 = v15;
        *(_DWORD *)(*(void *)(a1 + 24) + 4 * v11) = v15 - *(_DWORD *)(*(void *)(a1 + 24) + 4 * a3);
        *(unsigned char *)(a5 + v12) |= v14;
        ++*a4;
        bmz_traverse(a1, a2);
      }
      uint64_t result = graph_next_neighbor(*(void *)(a1 + 16), &v17);
      unsigned int v11 = result;
    }
    while (result != -1);
  }
  return result;
}

double bmz8_config_new()
{
  v0 = malloc_type_malloc(0x28uLL, 0x10B0040F28A43C1uLL);
  if (v0)
  {
    v0[4] = 0;
    double result = 0.0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void bmz8_config_destroy(uint64_t a1)
{
}

uint64_t bmz8_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1)
  {
    uint64_t v2 = *(_DWORD **)(result + 32);
    *uint64_t v2 = *a2;
    int v3 = a2[1];
    if (v3 != 1) {
      v2[1] = v3;
    }
  }
  return result;
}

void *bmz8_new(uint64_t a1, double a2)
{
  uint64_t v2 = a1;
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 8) + 8);
  if (v3 >= 0x100)
  {
    if (*(_DWORD *)(a1 + 16)) {
      fwrite("The number of keys in BMZ8 must be lower than 256.\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2 == 0.0) {
    double v5 = 1.15;
  }
  else {
    double v5 = a2;
  }
  *(unsigned char *)(v4 + 8) = v3;
  unsigned int v6 = vcvtpd_s64_f64(v5 * (double)v3);
  *(unsigned char *)(v4 + 9) = v6;
  *(void *)(v4 + 16) = graph_new(v6, v3);
  unsigned int v7 = malloc_type_malloc(0x18uLL, 0x2004093837F09uLL);
  uint64_t v8 = 0;
  *(void *)(v4 + 32) = v7;
  do
  {
    *(void *)(*(void *)(v4 + 32) + v8) = 0;
    v8 += 8;
  }
  while (v8 != 24);
  int v9 = 0;
  uint64_t v10 = 20;
  unsigned int v11 = (FILE **)MEMORY[0x263EF8348];
  uint64_t v86 = v2;
  do
  {
    if (*(_DWORD *)(v2 + 16)) {
      fprintf(*v11, "Entering mapping step for mph creation of %u keys with graph sized %u\n", *(unsigned __int8 *)(v4 + 8), *(unsigned __int8 *)(v4 + 9));
    }
    int v12 = 100;
LABEL_13:
    **(void **)(v4 + 32) = hash_state_new(*(_DWORD *)v4, *(unsigned __int8 *)(v4 + 9));
    *(void *)(*(void *)(v4 + 32) + 8) = hash_state_new(*(_DWORD *)(v4 + 4), *(unsigned __int8 *)(v4 + 9));
    uint64_t v13 = *(void *)(v2 + 32);
    graph_clear_edges(*(unsigned int **)(v13 + 16));
    (*(void (**)(void))(*(void *)(v2 + 8) + 32))(**(void **)(v2 + 8));
    uint64_t v14 = *(void *)(v2 + 8);
    if (!*(_DWORD *)(v14 + 8)) {
      goto LABEL_35;
    }
    int v15 = 0;
    int v16 = 0;
    do
    {
      LODWORD(v95) = 0;
      unsigned int v96 = 0;
      (*(void (**)(void, unsigned __int8 **, unint64_t *))(v14 + 16))(*(void *)v14, &v96, &v95);
      unsigned int v17 = hash(**(_DWORD ***)(v13 + 32), v96, v95) % *(unsigned __int8 *)(v13 + 9);
      unsigned int v18 = hash(*(_DWORD **)(*(void *)(v13 + 32) + 8), v96, v95);
      unsigned int v19 = *(unsigned __int8 *)(v13 + 9);
      int v20 = v18 % v19;
      if (v19 > (v18 % v19 + 1)) {
        unsigned __int8 v21 = v20 + 1;
      }
      else {
        unsigned __int8 v21 = 0;
      }
      if (v17 != v20) {
        unsigned __int8 v21 = v20;
      }
      if (v17 == v21)
      {
        if (*(_DWORD *)(v2 + 16)) {
          fprintf(*v11, "Self loop for key %u\n", v15);
        }
        (*(void (**)(void, unsigned __int8 *, void))(*(void *)(v2 + 8) + 24))(**(void **)(v2 + 8), v96, v95);
LABEL_30:
        --v12;
        hash_state_destroy(**(_DWORD ***)(v4 + 32));
        **(void **)(v4 + 32) = 0;
        hash_state_destroy(*(_DWORD **)(*(void *)(v4 + 32) + 8));
        *(void *)(*(void *)(v4 + 32) + 8) = 0;
        if (*(_DWORD *)(v2 + 16)) {
          fprintf(*v11, "simple graph creation failure - %u iterations remaining\n", v12);
        }
        if (!v12) {
          goto LABEL_150;
        }
        goto LABEL_13;
      }
      unsigned int v22 = v21;
      (*(void (**)(void, unsigned __int8 *, void))(*(void *)(v2 + 8) + 24))(**(void **)(v2 + 8), v96, v95);
      int v23 = graph_contains_edge(*(void *)(v13 + 16), v17, v22);
      if (*(_DWORD *)(v2 + 16) && v23)
      {
        fwrite("A non simple graph was generated\n", 0x21uLL, 1uLL, *v11);
        goto LABEL_30;
      }
      if (v23) {
        goto LABEL_30;
      }
      graph_add_edge(*(void *)(v13 + 16), v17, v22);
      int v15 = ++v16;
      uint64_t v14 = *(void *)(v2 + 8);
    }
    while (*(_DWORD *)(v14 + 8) > v16);
    if (!(_BYTE)v12)
    {
LABEL_150:
      graph_destroy(*(void ***)(v4 + 16));
      return 0;
    }
LABEL_35:
    if (*(_DWORD *)(v2 + 16)) {
      fwrite("Starting ordering step\n", 0x17uLL, 1uLL, *v11);
    }
    graph_obtain_critical_nodes(*(void ***)(v4 + 16));
    if (*(_DWORD *)(v2 + 16))
    {
      fwrite("Starting Searching step.\n", 0x19uLL, 1uLL, *v11);
      fwrite("\tTraversing critical vertices.\n", 0x1FuLL, 1uLL, *v11);
    }
    int v24 = malloc_type_malloc(((unint64_t)*(unsigned __int8 *)(v4 + 9) >> 3) + 1, 0x5DAEEA1CuLL);
    bzero(v24, ((unint64_t)*(unsigned __int8 *)(v4 + 9) >> 3) + 1);
    int32x2_t v25 = malloc_type_malloc(((unint64_t)*(unsigned __int8 *)(v4 + 8) >> 3) + 1, 0xBC889664uLL);
    bzero(v25, ((unint64_t)*(unsigned __int8 *)(v4 + 8) >> 3) + 1);
    free(*(void **)(v4 + 24));
    unint64_t v26 = malloc_type_calloc(*(unsigned __int8 *)(v4 + 9), 1uLL, 0x100004077774924uLL);
    *(void *)(v4 + 24) = v26;
    if (!v26) {
      bmz8_new_cold_1();
    }
    uint64_t v87 = v10;
    if (*(unsigned char *)(v4 + 9))
    {
      unint64_t v27 = 0;
      unsigned int v28 = 0;
      unsigned __int8 v94 = 0;
      unsigned __int8 v29 = 1;
      do
      {
        if (graph_node_is_critical(*(void *)(v4 + 16), v28))
        {
          unint64_t v30 = (unint64_t)v28 >> 3;
          uint64_t v31 = v28 & 7;
          char v32 = bitmask_2[v31];
          if (!((v32 & *((unsigned char *)v24 + v30)) >> v31))
          {
            int v33 = graph_ncritical_nodes(*(void *)(v4 + 16));
            v34 = (void **)vqueue_new(v33);
            int v35 = v34;
            int v36 = (int)(ceil((double)v29 * 0.5) + -1.0);
            uint64_t v93 = (uint64_t)v34;
            if (v5 <= 1.14)
            {
              unint64_t v95 = 0;
              unsigned int v96 = 0;
              *(unsigned char *)(*(void *)(v4 + 24) + v27) = v36;
              *((unsigned char *)v24 + v30) |= v32;
              vqueue_insert((uint64_t)v34, v28);
              if (vqueue_is_empty((uint64_t)v35))
              {
                uint64_t v38 = 0;
                int v39 = 0;
              }
              else
              {
                uint64_t v56 = 0;
                uint64_t v38 = 0;
                do
                {
                  unsigned int v57 = vqueue_remove((uint64_t)v35);
                  unsigned int v96 = (unsigned __int8 *)graph_neighbors_it(*(void *)(v4 + 16), v57);
                  unsigned int v58 = graph_next_neighbor(*(void *)(v4 + 16), &v96);
                  if (v58 == -1)
                  {
                    uint64_t v60 = v56;
                  }
                  else
                  {
                    unsigned int v59 = v58;
                    uint64_t v60 = v56;
                    do
                    {
                      if (graph_node_is_critical(*(void *)(v4 + 16), v59))
                      {
                        unint64_t v61 = (unint64_t)v59 >> 3;
                        uint64_t v62 = v59 & 7;
                        if ((bitmask_2[v62] & *((unsigned char *)v24 + v61)) >> v62)
                        {
                          int v35 = (void **)v93;
                        }
                        else
                        {
                          char v88 = bitmask_2[v62];
                          unsigned __int8 v63 = 0;
                          while (1)
                          {
                            uint64_t v89 = v60;
                            ptr = v38;
                            if (v63 >= v60)
                            {
                              unsigned __int8 v92 = v94 + 1;
                              unsigned __int8 v63 = -1;
                            }
                            else
                            {
                              unsigned __int8 v92 = *((unsigned char *)v38 + v63++);
                            }
                            unint64_t v95 = graph_neighbors_it(*(void *)(v4 + 16), v59);
                            unsigned int v64 = graph_next_neighbor(*(void *)(v4 + 16), &v95);
                            if (v64 == -1) {
                              break;
                            }
                            unsigned int v65 = v64;
                            while (1)
                            {
                              if (graph_node_is_critical(*(void *)(v4 + 16), v65)
                                && (bitmask_2[v65 & 7] & *((unsigned char *)v24 + ((unint64_t)v65 >> 3))) >> (v65 & 7))
                              {
                                unint64_t v66 = *(unsigned __int8 *)(*(void *)(v4 + 24) + v65) + v92;
                                if (v66 >= *(unsigned __int8 *)(v4 + 8))
                                {
                                  int v39 = 1;
                                  int v35 = (void **)v93;
                                  uint64_t v38 = ptr;
                                  goto LABEL_120;
                                }
                                if ((bitmask_2[v66 & 7] & *((unsigned char *)v25 + (v66 >> 3))) >> (v66 & 7)) {
                                  break;
                                }
                              }
                              unsigned int v65 = graph_next_neighbor(*(void *)(v4 + 16), &v95);
                              if (v65 == -1) {
                                goto LABEL_102;
                              }
                            }
                            uint64_t v38 = ptr;
                            if (v92 > v94)
                            {
                              if (!(_BYTE)v60) {
                                uint64_t v38 = malloc_type_realloc(ptr, 0x400uLL, 0x100004077774924uLL);
                              }
                              *((unsigned char *)v38 + v60) = v92;
                              uint64_t v89 = (v60 + 1);
                            }
                            unsigned __int8 v67 = v94;
                            if (v92 > v94) {
                              unsigned __int8 v67 = v92;
                            }
                            unsigned __int8 v94 = v67;
                            uint64_t v60 = v89;
                          }
LABEL_102:
                          unsigned __int8 v68 = v94;
                          if (v92 > v94) {
                            unsigned __int8 v68 = v92;
                          }
                          unsigned __int8 v94 = v68;
                          if ((v63 - 1) < v60)
                          {
                            *((unsigned char *)ptr + (v63 - 1)) = *((unsigned char *)ptr + (v60 - 1));
                            uint64_t v60 = (v60 - 1);
                          }
                          unint64_t v95 = graph_neighbors_it(*(void *)(v4 + 16), v59);
                          unsigned int v69 = graph_next_neighbor(*(void *)(v4 + 16), &v95);
                          if (v69 != -1)
                          {
                            for (unsigned int i = v69; i != -1; unsigned int i = graph_next_neighbor(*(void *)(v4 + 16), &v95))
                            {
                              if (graph_node_is_critical(*(void *)(v4 + 16), i))
                              {
                                if ((bitmask_2[i & 7] & *((unsigned char *)v24 + ((unint64_t)i >> 3))) >> (i & 7))
                                {
                                  unint64_t v71 = *(unsigned __int8 *)(*(void *)(v4 + 24) + i) + v92;
                                  *((unsigned char *)v25 + (v71 >> 3)) |= bitmask_2[v71 & 7];
                                  if (*(unsigned __int8 *)(*(void *)(v4 + 24) + i) + v92 > v29) {
                                    unsigned __int8 v29 = *(unsigned char *)(*(void *)(v4 + 24) + i) + v92;
                                  }
                                }
                              }
                            }
                          }
                          *(unsigned char *)(*(void *)(v4 + 24) + v59) = v92;
                          *((unsigned char *)v24 + v61) |= v88;
                          int v35 = (void **)v93;
                          vqueue_insert(v93, v59);
                          uint64_t v38 = ptr;
                        }
                      }
                      unsigned int v59 = graph_next_neighbor(*(void *)(v4 + 16), &v96);
                    }
                    while (v59 != -1);
                  }
                  uint64_t v56 = v60;
                  int v39 = 0;
                }
                while (!vqueue_is_empty((uint64_t)v35));
              }
LABEL_120:
              vqueue_destroy(v35);
              free(v38);
              if (v39)
              {
LABEL_149:
                int v9 = 1;
                goto LABEL_127;
              }
            }
            else
            {
              unint64_t v95 = 0;
              unsigned int v96 = 0;
              *(unsigned char *)(*(void *)(v4 + 24) + v27) = v36;
              *((unsigned char *)v24 + v30) |= v32;
              vqueue_insert((uint64_t)v34, v28);
              if (vqueue_is_empty((uint64_t)v35))
              {
                int v37 = 0;
                goto LABEL_123;
              }
              do
              {
                unsigned int v40 = vqueue_remove((uint64_t)v35);
                unsigned int v96 = (unsigned __int8 *)graph_neighbors_it(*(void *)(v4 + 16), v40);
                unsigned int v41 = graph_next_neighbor(*(void *)(v4 + 16), &v96);
                if (v41 != -1)
                {
                  for (unsigned int j = v41; j != -1; unsigned int j = graph_next_neighbor(*(void *)(v4 + 16), &v96))
                  {
                    if (graph_node_is_critical(*(void *)(v4 + 16), j))
                    {
                      unint64_t v43 = (unint64_t)j >> 3;
                      uint64_t v44 = j & 7;
                      char v45 = bitmask_2[v44];
                      if (!((v45 & *((unsigned char *)v24 + v43)) >> v44))
                      {
                        unsigned __int8 v46 = v94 + 1;
                        unint64_t v95 = graph_neighbors_it(*(void *)(v4 + 16), j);
                        unsigned int v47 = graph_next_neighbor(*(void *)(v4 + 16), &v95);
                        if (v47 != -1)
                        {
                          unsigned int v48 = v47;
                          while (1)
                          {
                            if (!graph_node_is_critical(*(void *)(v4 + 16), v48)
                              || !((bitmask_2[v48 & 7] & *((unsigned char *)v24 + ((unint64_t)v48 >> 3))) >> (v48 & 7)))
                            {
                              goto LABEL_59;
                            }
                            unint64_t v49 = *(unsigned __int8 *)(*(void *)(v4 + 24) + v48) + v46;
                            if (v49 >= *(unsigned __int8 *)(v4 + 8))
                            {
                              int v37 = 1;
                              int v35 = (void **)v93;
                              goto LABEL_123;
                            }
                            if ((bitmask_2[v49 & 7] & *((unsigned char *)v25 + (v49 >> 3))) >> (v49 & 7))
                            {
                              unsigned __int8 v50 = v94;
                              if (v46 > v94) {
                                unsigned __int8 v50 = v46;
                              }
                              unsigned __int8 v94 = v50;
                              unsigned __int8 v46 = v50 + 1;
                              unint64_t v95 = graph_neighbors_it(*(void *)(v4 + 16), j);
                              unsigned int v48 = graph_next_neighbor(*(void *)(v4 + 16), &v95);
                              if (v48 == -1) {
                                break;
                              }
                            }
                            else
                            {
LABEL_59:
                              unsigned int v48 = graph_next_neighbor(*(void *)(v4 + 16), &v95);
                              if (v48 == -1) {
                                break;
                              }
                            }
                          }
                        }
                        unsigned __int8 v51 = v94;
                        unsigned __int8 v91 = v46;
                        int v52 = v46;
                        if (v46 > v94) {
                          unsigned __int8 v51 = v46;
                        }
                        unsigned __int8 v94 = v51;
                        unint64_t v95 = graph_neighbors_it(*(void *)(v4 + 16), j);
                        unsigned int v53 = graph_next_neighbor(*(void *)(v4 + 16), &v95);
                        if (v53 != -1)
                        {
                          for (unsigned int k = v53; k != -1; unsigned int k = graph_next_neighbor(*(void *)(v4 + 16), &v95))
                          {
                            if (graph_node_is_critical(*(void *)(v4 + 16), k))
                            {
                              if ((bitmask_2[k & 7] & *((unsigned char *)v24 + ((unint64_t)k >> 3))) >> (k & 7))
                              {
                                unint64_t v55 = *(unsigned __int8 *)(*(void *)(v4 + 24) + k) + v52;
                                *((unsigned char *)v25 + (v55 >> 3)) |= bitmask_2[v55 & 7];
                                if (*(unsigned __int8 *)(*(void *)(v4 + 24) + k) + v52 > v29) {
                                  unsigned __int8 v29 = *(unsigned char *)(*(void *)(v4 + 24) + k) + v52;
                                }
                              }
                            }
                          }
                        }
                        *(unsigned char *)(*(void *)(v4 + 24) + j) = v91;
                        *((unsigned char *)v24 + v43) |= v45;
                        int v35 = (void **)v93;
                        vqueue_insert(v93, j);
                      }
                    }
                  }
                }
                int v37 = 0;
              }
              while (!vqueue_is_empty((uint64_t)v35));
LABEL_123:
              vqueue_destroy(v35);
              if (v37) {
                goto LABEL_149;
              }
            }
            int v9 = 0;
          }
        }
        unsigned int v28 = ++v27;
      }
      while (v27 < *(unsigned __int8 *)(v4 + 9));
    }
    if (v9)
    {
LABEL_127:
      uint64_t v2 = v86;
      uint64_t v10 = (v87 - 1);
      unsigned int v11 = (FILE **)MEMORY[0x263EF8348];
      if (*(_DWORD *)(v86 + 16)) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "Restarting mapping step. %u iterations remaining.\n", (v87 - 1));
      }
      goto LABEL_146;
    }
    uint64_t v2 = v86;
    uint64_t v10 = v87;
    unsigned int v11 = (FILE **)MEMORY[0x263EF8348];
    if (*(_DWORD *)(v86 + 16)) {
      fwrite("\tTraversing non critical vertices.\n", 0x23uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    LOBYTE(v96) = 0;
    if (*(unsigned char *)(v4 + 8))
    {
      for (unsigned int m = 0; m < *(unsigned __int8 *)(v4 + 8); ++m)
      {
        unsigned __int8 v73 = graph_vertex_id(*(void *)(v4 + 16), m, 0);
        unsigned __int8 v74 = graph_vertex_id(*(void *)(v4 + 16), m, 1);
        unsigned int v75 = v73;
        int v76 = (bitmask_2[v74 & 7] & *((unsigned char *)v24 + (v74 >> 3))) >> (v74 & 7);
        if ((bitmask_2[v73 & 7] & *((unsigned char *)v24 + ((unint64_t)v73 >> 3))) >> (v73 & 7))
        {
          if (!v76) {
            goto LABEL_138;
          }
        }
        else if (v76)
        {
          unsigned int v75 = v74;
LABEL_138:
          bmz8_traverse(v4, (uint64_t)v25, v75, &v96, (uint64_t)v24);
        }
      }
    }
    unsigned __int8 v77 = *(unsigned char *)(v4 + 9);
    if (v77)
    {
      for (unint64_t n = 0; n < v77; ++n)
      {
        uint64_t v79 = n >> 3;
        char v80 = bitmask_2[n & 7];
        if (!((v80 & *((unsigned char *)v24 + v79)) >> (n & 7)))
        {
          *(unsigned char *)(*(void *)(v4 + 24) + n) = 0;
          *((unsigned char *)v24 + v79) |= v80;
          bmz8_traverse(v4, (uint64_t)v25, n, &v96, (uint64_t)v24);
          unsigned __int8 v77 = *(unsigned char *)(v4 + 9);
        }
      }
    }
    int v9 = 0;
LABEL_146:
    free(v25);
    free(v24);
  }
  while (v9 && (_BYTE)v10);
  graph_destroy(*(void ***)(v4 + 16));
  *(void *)(v4 + 16) = 0;
  if (!(_BYTE)v10) {
    return 0;
  }
  long long v81 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)long long v81 = *(_DWORD *)v2;
  unsigned int v83 = (char *)malloc_type_malloc(0x18uLL, 0x109004087376023uLL);
  long long v84 = *(_OWORD *)(v4 + 24);
  *(void *)(v4 + 24) = 0;
  *(_OWORD *)(v83 + 8) = v84;
  *(void *)(v4 + 32) = 0;
  v83[1] = *(unsigned char *)(v4 + 9);
  int v85 = *(unsigned __int8 *)(v4 + 8);
  *unsigned int v83 = v85;
  v81[2] = v83;
  *((_DWORD *)v81 + 1) = v85;
  if (*(_DWORD *)(v2 + 16)) {
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v11);
  }
  return v81;
}

uint64_t bmz8_dump(uint64_t a1, FILE *a2)
{
  memset(__size, 0, sizeof(__size));
  char __ptr = 2;
  uint64_t v3 = *(void *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  fwrite(&__ptr, 1uLL, 1uLL, a2);
  hash_state_dump(**(_DWORD ***)(v3 + 16), &__size[1], __size);
  fwrite(__size, 4uLL, 1uLL, a2);
  fwrite(*(const void **)&__size[1], __size[0], 1uLL, a2);
  free(*(void **)&__size[1]);
  hash_state_dump(*(_DWORD **)(*(void *)(v3 + 16) + 8), &__size[1], __size);
  fwrite(__size, 4uLL, 1uLL, a2);
  fwrite(*(const void **)&__size[1], __size[0], 1uLL, a2);
  free(*(void **)&__size[1]);
  fwrite((const void *)(v3 + 1), 1uLL, 1uLL, a2);
  fwrite((const void *)v3, 1uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 8), *(unsigned __int8 *)(v3 + 1), 1uLL, a2);
  return 1;
}

size_t bmz8_load(FILE *a1, uint64_t a2)
{
  unsigned __int8 size_7 = 0;
  uint64_t v4 = malloc_type_malloc(0x18uLL, 0x109004087376023uLL);
  *(void *)(a2 + 16) = v4;
  fread(&size_7, 1uLL, 1uLL, a1);
  uint64_t v5 = size_7;
  uint64_t v6 = 8 * size_7;
  unsigned int v7 = malloc_type_malloc(v6 + 8, 0x2004093837F09uLL);
  v4[2] = v7;
  v7[v5] = 0;
  if (v5)
  {
    uint64_t v8 = 0;
    unsigned int size = 0;
    do
    {
      fread(&size, 4uLL, 1uLL, a1);
      size_t v9 = size;
      uint64_t v10 = malloc_type_malloc(size, 0x55842EDEuLL);
      fread(v10, v9, 1uLL, a1);
      *(void *)(v4[2] + v8) = hash_state_load((const char *)v10);
      free(v10);
      v8 += 8;
    }
    while (v6 != v8);
  }
  fread((char *)v4 + 1, 1uLL, 1uLL, a1);
  fread(v4, 1uLL, 1uLL, a1);
  unsigned int v11 = malloc_type_malloc(*((unsigned __int8 *)v4 + 1), 0x100004077774924uLL);
  v4[1] = v11;
  size_t v12 = *((unsigned __int8 *)v4 + 1);

  return fread(v11, v12, 1uLL, a1);
}

uint64_t bmz8_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  unsigned int v6 = hash(**(_DWORD ***)(v5 + 16), a2, a3) % *(unsigned __int8 *)(v5 + 1);
  unsigned int v7 = hash(*(_DWORD **)(*(void *)(v5 + 16) + 8), a2, a3);
  unsigned int v8 = *(unsigned __int8 *)(v5 + 1);
  int v9 = v7 % v8;
  if (v8 > v7 % v8) {
    unsigned __int8 v10 = v9 + 1;
  }
  else {
    unsigned __int8 v10 = 0;
  }
  if (v6 != v9) {
    unsigned __int8 v10 = v9;
  }
  return (*(unsigned char *)(*(void *)(v5 + 8) + v10) + *(unsigned char *)(*(void *)(v5 + 8) + v6));
}

void bmz8_destroy(void *a1)
{
  uint64_t v2 = (void **)a1[2];
  free(v2[1]);
  hash_state_destroy(*(_DWORD **)v2[2]);
  hash_state_destroy(*((_DWORD **)v2[2] + 1));
  free(v2[2]);
  free(v2);

  free(a1);
}

void *bmz8_pack(uint64_t a1, int *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int type = hash_get_type(**(unsigned int ***)(v3 + 16));
  *a2++ = type;
  hash_state_pack(**(_DWORD ***)(v3 + 16), a2);
  uint64_t v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  int v6 = hash_get_type(*(unsigned int **)(*(void *)(v3 + 16) + 8));
  *v5++ = v6;
  hash_state_pack(*(_DWORD **)(*(void *)(v3 + 16) + 8), v5);
  unsigned int v7 = (char *)v5 + hash_state_packed_size(v6);
  *unsigned int v7 = *(unsigned char *)(v3 + 1);
  unsigned int v8 = v7 + 1;
  int v9 = *(const void **)(v3 + 8);
  size_t v10 = *(unsigned __int8 *)(v3 + 1);

  return memcpy(v8, v9, v10);
}

uint64_t bmz8_packed_size(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int type = hash_get_type(**(unsigned int ***)(v1 + 16));
  int v3 = hash_get_type(*(unsigned int **)(*(void *)(v1 + 16) + 8));
  int v4 = hash_state_packed_size(type);
  return v4 + hash_state_packed_size(v3) + *(unsigned __int8 *)(v1 + 1) + 13;
}

uint64_t bmz8_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5 = (unsigned int *)(a1 + 1);
  int v6 = *a1;
  unsigned int v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  int v9 = *v7++;
  int v8 = v9;
  size_t v10 = (unsigned __int8 *)v7 + hash_state_packed_size(v9);
  unsigned int v12 = *v10;
  unsigned int v11 = v10 + 1;
  unsigned int v13 = hash_packed(v5, v6, a2, a3) % v12;
  unsigned int v14 = hash_packed(v7, v8, a2, a3);
  int v15 = v14 % v12;
  if (v12 > v14 % v12) {
    char v16 = v15 + 1;
  }
  else {
    char v16 = 0;
  }
  if (v13 == v15) {
    LOBYTE(v15) = v16;
  }
  return (v11[v15] + v11[v13]);
}

uint64_t bmz8_traverse(uint64_t a1, uint64_t a2, unsigned int a3, unsigned char *a4, uint64_t a5)
{
  unint64_t v17 = graph_neighbors_it(*(void *)(a1 + 16), a3);
  uint64_t result = graph_next_neighbor(*(void *)(a1 + 16), &v17);
  if (result != -1)
  {
    unsigned int v11 = result;
    do
    {
      unint64_t v12 = (unint64_t)v11 >> 3;
      uint64_t v13 = v11 & 7;
      char v14 = bitmask_2[v13];
      if (!((v14 & *(unsigned char *)(a5 + v12)) >> v13))
      {
        unsigned int v15 = *a4;
        unsigned int v16 = *(unsigned __int8 *)(a1 + 8);
        if (v16 <= v15) {
LABEL_11:
        }
          bmz8_traverse_cold_1();
        while ((bitmask_2[v15 & 7] & *(unsigned char *)(a2 + ((unint64_t)v15 >> 3))) >> (v15 & 7))
        {
          if (v16 == ++v15) {
            goto LABEL_11;
          }
        }
        *a4 = v15;
        *(unsigned char *)(*(void *)(a1 + 24) + v11) = v15 - *(unsigned char *)(*(void *)(a1 + 24) + a3);
        *(unsigned char *)(a5 + v12) |= v14;
        ++*a4;
        bmz8_traverse(a1, a2);
      }
      uint64_t result = graph_next_neighbor(*(void *)(a1 + 16), &v17);
      unsigned int v11 = result;
    }
    while (result != -1);
  }
  return result;
}

unsigned char *brz_config_new()
{
  v0 = malloc_type_malloc(0x70uLL, 0x10B004044A9B6D4uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    v0[56] = 0x80;
    *(_OWORD *)v0 = xmmword_212A043C0;
    *((void *)v0 + 5) = 0;
    *((void *)v0 + 6) = 0;
    *((void *)v0 + 4) = 0;
    *((void *)v0 + 9) = 0;
    *((void *)v0 + 10) = 0;
    *((void *)v0 + 8) = 0;
    *((_DWORD *)v0 + 22) = 0x100000;
    uint64_t v2 = (char *)malloc_type_calloc(0xAuLL, 1uLL, 0x100004077774924uLL);
    *((void *)v1 + 12) = v2;
    *((void *)v1 + 13) = 0;
    strcpy(v2, "/var/tmp/");
  }
  return v1;
}

void brz_config_destroy(uint64_t a1)
{
  uint64_t v1 = *(void ***)(a1 + 32);
  free(v1[12]);

  free(v1);
}

uint64_t brz_config_set_hashfuncs(uint64_t result, int *a2)
{
  int v2 = *a2;
  if (*a2 != 1)
  {
    unint64_t v3 = 0;
    uint64_t v4 = *(void *)(result + 32);
    do
    {
      *(_DWORD *)(v4 + 4 * v3) = v2;
      int v2 = a2[v3 + 1];
    }
    while (v2 != 1 && v3++ < 2);
  }
  return result;
}

uint64_t brz_config_set_memory_availability(uint64_t result, int a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(result + 32) + 88) = a2 << 20;
  }
  return result;
}

char *brz_config_set_tmp_dir(char *result, char *__s)
{
  if (__s)
  {
    uint64_t v3 = *((void *)result + 4);
    size_t v4 = strlen(__s);
    free(*(void **)(v3 + 96));
    if (__s[v4 - 1] == 47)
    {
      uint64_t v5 = (char *)malloc_type_calloc(v4 + 1, 1uLL, 0x100004077774924uLL);
      *(void *)(v3 + 96) = v5;
      return strcpy(v5, __s);
    }
    else
    {
      int v6 = (char *)malloc_type_calloc(v4 + 2, 1uLL, 0x100004077774924uLL);
      *(void *)(v3 + 96) = v6;
      return (char *)sprintf(v6, "%s/", __s);
    }
  }
  return result;
}

uint64_t brz_config_set_mphf_fd(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 32) + 104) = a2;
  if (!a2) {
    brz_config_set_mphf_fd_cold_1();
  }
  return result;
}

uint64_t brz_config_set_b(uint64_t result, int a2)
{
  if ((a2 - 175) >= 0xFFFFFF92) {
    char v2 = a2;
  }
  else {
    char v2 = 0x80;
  }
  *(unsigned char *)(*(void *)(result + 32) + 56) = v2;
  return result;
}

uint64_t brz_config_set_algo(uint64_t result, int a2)
{
  if (a2 == 4 || a2 == 1) {
    *(_DWORD *)(*(void *)(result + 32) + 12) = a2;
  }
  return result;
}

void *brz_new(size_t a1, double a2)
{
  size_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 12);
  if (v4 == 4)
  {
    double v6 = 2.0;
    if (a2 <= 2.0) {
      a2 = 2.6;
    }
  }
  else
  {
    if (v4 != 1) {
      brz_new_cold_1();
    }
    BOOL v5 = a2 >= 2.0 || a2 == 0.0;
    double v6 = 1.0;
    if (v5) {
      a2 = 1.0;
    }
  }
  *(double *)(v3 + 16) = a2;
  unsigned int v7 = *(_DWORD *)(*(void *)(a1 + 8) + 8);
  *(_DWORD *)(v3 + 24) = v7;
  LOBYTE(v6) = *(unsigned char *)(v3 + 56);
  LODWORD(a1) = vcvtpd_u64_f64((double)v7 / (double)*(unint64_t *)&v6);
  *(_DWORD *)(v3 + 60) = a1;
  *(void *)(v3 + 32) = malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (*(_DWORD *)(v2 + 16)) {
    fwrite("Partioning the set of keys.\n", 0x1CuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  int v8 = 20;
  size_t v123 = v2;
  uint64_t v112 = v3;
  while (1)
  {
    *(void *)(v3 + 80) = hash_state_new(*(_DWORD *)(v3 + 8), *(_DWORD *)(v3 + 60));
    uint64_t v9 = *(void *)(v2 + 32);
    size_t v10 = (char *)malloc_type_malloc(*(unsigned int *)(v9 + 88), 0xEA3D2230uLL);
    unsigned int v11 = (unsigned int *)(v9 + 60);
    unint64_t v12 = (int *)malloc_type_calloc(*(unsigned int *)(v9 + 60), 4uLL, 0x100004052888210uLL);
    key = 0;
    unsigned int v129 = 0;
    (*(void (**)(void))(*(void *)(v2 + 8) + 32))(**(void **)(v2 + 8));
    char __ptr = (unsigned int *)(v9 + 24);
    v122 = (unsigned int *)(v9 + 60);
    int v113 = v8;
    if (!*(_DWORD *)(v9 + 24))
    {
      unsigned int v57 = 0;
      goto LABEL_55;
    }
    unsigned int v125 = 0;
    LODWORD(v13) = 0;
    int v14 = 0;
    unsigned int v15 = 0;
    do
    {
      (*(void (**)(void, unsigned __int8 **, unsigned int *))(*(void *)(v2 + 8) + 16))(**(void **)(v2 + 8), &key, &v129);
      unsigned int v16 = v129;
      if ((unint64_t)(v129 + v14) + 4 <= *(unsigned int *)(v9 + 88))
      {
        int v34 = v13;
      }
      else
      {
        if (*(_DWORD *)(v2 + 16)) {
          fprintf((FILE *)*MEMORY[0x263EF8348], "Flushing  %u\n", v13);
        }
        int v17 = *v12;
        int *v12 = 0;
        unint64_t v18 = *v11;
        if (v18 >= 2)
        {
          int v19 = 0;
          for (unint64_t i = 1; i < v18; ++i)
          {
            int v21 = v12[i];
            if (v21)
            {
              v19 += v17;
              v12[i] = v19;
              unint64_t v18 = *v11;
              int v17 = v21;
            }
          }
        }
        uint64_t v22 = v13;
        int v23 = (int *)malloc_type_calloc(v13, 4uLL, 0x100004052888210uLL);
        if (v13)
        {
          int v24 = 0;
          int v25 = v13;
          do
          {
            unint64_t v26 = (unsigned __int8 *)&v10[v24];
            unsigned int v27 = *(_DWORD *)v26;
            unsigned int v28 = hash(*(_DWORD **)(v9 + 80), v26 + 4, *(_DWORD *)v26) % *(_DWORD *)(v9 + 60);
            v23[v12[v28]++] = v24;
            v24 += v27 + 4;
            --v25;
          }
          while (v25);
        }
        size_t v29 = strlen(*(const char **)(v9 + 96));
        unint64_t v30 = (char *)malloc_type_calloc(v29 + 11, 1uLL, 0x100004077774924uLL);
        sprintf(v30, "%s%u.cmph", *(const char **)(v9 + 96), v125);
        uint64_t v31 = fopen(v30, "wb");
        free(v30);
        if (v13)
        {
          char v32 = v23;
          do
          {
            int v33 = *v32++;
            fwrite(&v10[v33], 1uLL, *(unsigned int *)&v10[v33] + 4, v31);
            --v22;
          }
          while (v22);
        }
        unsigned int v11 = (unsigned int *)(v9 + 60);
        bzero(v12, 4 * *v122);
        ++v125;
        free(v23);
        fclose(v31);
        int v14 = 0;
        int v34 = 0;
        unsigned int v16 = v129;
        size_t v2 = v123;
      }
      int v35 = &v10[v14];
      *(_DWORD *)int v35 = v129;
      int v36 = key;
      memcpy(v35 + 4, key, v16);
      uint64_t v37 = hash(*(_DWORD **)(v9 + 80), v36, v16) % *(_DWORD *)(v9 + 60);
      uint64_t v38 = *(void *)(v9 + 32);
      unsigned int v39 = *(unsigned __int8 *)(v38 + v37);
      if (v39 == 255
        || *(_DWORD *)(v9 + 12) == 1 && (double v40 = *(double *)(v9 + 16), v40 >= 1.0) && v39 > (int)(v40 * (double)v39))
      {
        LODWORD(v58) = 0;
        uint64_t v3 = v112;
        int v8 = v113;
        unsigned int v59 = (FILE **)MEMORY[0x263EF8348];
        goto LABEL_108;
      }
      *(unsigned char *)(v38 + v37) = v39 + 1;
      v14 += v16 + 4;
      ++v12[v37];
      uint64_t v13 = (v34 + 1);
      (*(void (**)(void, unsigned __int8 *, void))(*(void *)(v2 + 8) + 24))(**(void **)(v2 + 8), key, v129);
      ++v15;
    }
    while (v15 < *__ptr);
    if (v14)
    {
      if (*(_DWORD *)(v2 + 16)) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "Flushing  %u\n", v34 + 1);
      }
      int v41 = *v12;
      int *v12 = 0;
      unint64_t v42 = *v11;
      if (v42 >= 2)
      {
        int v43 = 0;
        for (unint64_t j = 1; j < v42; ++j)
        {
          int v45 = v12[j];
          if (v45)
          {
            v43 += v41;
            v12[j] = v43;
            unint64_t v42 = *v11;
            int v41 = v45;
          }
        }
      }
      unsigned __int8 v46 = (int *)malloc_type_calloc((v34 + 1), 4uLL, 0x100004052888210uLL);
      if (v34 != -1)
      {
        int v47 = 0;
        int v48 = v34 + 1;
        do
        {
          unint64_t v49 = (unsigned __int8 *)&v10[v47];
          unsigned int v50 = *(_DWORD *)v49;
          unsigned int v51 = hash(*(_DWORD **)(v9 + 80), v49 + 4, *(_DWORD *)v49) % *(_DWORD *)(v9 + 60);
          v46[v12[v51]++] = v47;
          v47 += v50 + 4;
          --v48;
        }
        while (v48);
      }
      size_t v52 = strlen(*(const char **)(v9 + 96));
      unsigned int v53 = (char *)malloc_type_calloc(v52 + 11, 1uLL, 0x100004077774924uLL);
      sprintf(v53, "%s%u.cmph", *(const char **)(v9 + 96), v125);
      unsigned int v54 = fopen(v53, "wb");
      free(v53);
      if (v13)
      {
        unint64_t v55 = v46;
        do
        {
          int v56 = *v55++;
          fwrite(&v10[v56], 1uLL, *(unsigned int *)&v10[v56] + 4, v54);
          --v13;
        }
        while (v13);
      }
      unsigned int v11 = (unsigned int *)(v9 + 60);
      bzero(v12, 4 * *v122);
      unsigned int v57 = v125 + 1;
      free(v46);
      fclose(v54);
      int v8 = v113;
    }
    else
    {
      int v8 = v113;
      unsigned int v57 = v125;
    }
LABEL_55:
    free(v10);
    free(v12);
    unsigned int v126 = v57;
    if (v57 >= 0x401)
    {
      unsigned int v59 = (FILE **)MEMORY[0x263EF8348];
      uint64_t v3 = v112;
      goto LABEL_109;
    }
    uint64_t v3 = v112;
    if (*(_DWORD *)(v2 + 16)) {
      fwrite("\nMPHF generation \n", 0x12uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    size_t v60 = strlen(off_267797988[0]);
    fwrite(off_267797988[0], v60 + 1, 1uLL, *(FILE **)(v9 + 104));
    fwrite(__ptr, 4uLL, 1uLL, *(FILE **)(v9 + 104));
    fwrite((const void *)(v9 + 16), 8uLL, 1uLL, *(FILE **)(v9 + 104));
    v116 = (int *)(v9 + 12);
    fwrite((const void *)(v9 + 12), 4uLL, 1uLL, *(FILE **)(v9 + 104));
    fwrite(v11, 4uLL, 1uLL, *(FILE **)(v9 + 104));
    fwrite(*(const void **)(v9 + 32), *(unsigned int *)(v9 + 60), 1uLL, *(FILE **)(v9 + 104));
    unint64_t v61 = buffer_manager_new(*(_DWORD *)(v9 + 88), v126);
    size_t v10 = (char *)malloc_type_calloc(v126, 8uLL, 0x10040436913F5uLL);
    unint64_t v12 = (int *)malloc_type_calloc(v126, 4uLL, 0x100004052888210uLL);
    if (v126)
    {
      for (uint64_t k = 0; k != v126; ++k)
      {
        size_t v63 = strlen(*(const char **)(v9 + 96));
        unsigned int v64 = (char *)malloc_type_calloc(v63 + 11, 1uLL, 0x100004077774924uLL);
        sprintf(v64, "%s%u.cmph", *(const char **)(v9 + 96), k);
        buffer_manager_open((uint64_t)v61, k, v64);
        free(v64);
        key = (unsigned __int8 *)buffer_manager_read_key((uint64_t)v61, k, (char *)&v129);
        v12[k] = hash(*(_DWORD **)(v9 + 80), key + 4, v129) % *(_DWORD *)(v9 + 60);
        *(void *)&v10[8 * k] = key;
        key = 0;
      }
    }
    v128 = (void **)malloc_type_calloc(0xFFuLL, 8uLL, 0x10040436913F5uLL);
    if (*__ptr)
    {
      int v65 = 0;
      unsigned int v66 = 0;
      uint64_t v127 = (uint64_t)v61;
      while (1)
      {
        if (v126 < 2)
        {
          unsigned int v67 = 0;
        }
        else
        {
          unsigned int v67 = 0;
          for (uint64_t m = 1; m != v126; ++m)
          {
            if (v12[m] < v12[v67]) {
              unsigned int v67 = m;
            }
          }
        }
        uint64_t v69 = v12[v67];
        uint64_t v70 = v67;
        unint64_t v71 = (unsigned __int8 *)buffer_manager_read_key(v127, v67, (char *)&v129);
        key = v71;
        if (!v71) {
          break;
        }
        while (1)
        {
          unsigned int v72 = hash(*(_DWORD **)(v9 + 80), v71 + 4, v129) % *(_DWORD *)(v9 + 60);
          if (v72 != v12[v70]) {
            break;
          }
          int v73 = v65 + 1;
          v128[v65] = key;
          key = 0;
          ++v66;
          unint64_t v71 = (unsigned __int8 *)buffer_manager_read_key(v127, v70, (char *)&v129);
          key = v71;
          ++v65;
          if (!v71) {
            goto LABEL_80;
          }
        }
        if (!key) {
          break;
        }
        if (*(unsigned __int8 *)(*(void *)(v9 + 32) + v69) <= v65) {
          brz_new_cold_4();
        }
        int v73 = v65 + 1;
        v128[v65] = *(void **)&v10[8 * v70];
        *(void *)&v10[8 * v70] = 0;
        v12[v70] = v72;
        ++v66;
        *(void *)&v10[8 * v70] = key;
        ++v65;
        if (!key) {
          goto LABEL_80;
        }
LABEL_82:
        if (*(unsigned __int8 *)(*(void *)(v9 + 32) + v69) == v65)
        {
          unsigned __int8 v74 = (void **)cmph_io_byte_vector_adapter((uint64_t)v128, v65);
          unsigned int v75 = cmph_config_new((uint64_t)v74);
          cmph_config_set_algo((uint64_t)v75, *v116);
          cmph_config_set_graphsize((uint64_t)v75, *(double *)(v9 + 16));
          v121 = v75;
          uint64_t v79 = cmph_new((uint64_t)v75, v76, v77, v78);
          size_t v2 = v123;
          int v81 = *(_DWORD *)(v123 + 16);
          if (!v79)
          {
            uint64_t v97 = v74;
            unsigned int v59 = (FILE **)MEMORY[0x263EF8348];
            if (v81) {
              fprintf((FILE *)*MEMORY[0x263EF8348], "ERROR: Can't generate MPHF for bucket %u out of %u\n", v69 + 1, *v122);
            }
            cmph_config_destroy(v121);
            uint64_t v58 = v65;
            v98 = v128;
            int v8 = v113;
            do
            {
              free(*v98);
              *v98++ = 0;
              --v58;
            }
            while (v58);
            cmph_io_byte_vector_adapter_destroy(v97);
            uint64_t v3 = v112;
            unint64_t v61 = (void *)v127;
            goto LABEL_107;
          }
          if (v81 && !(v69 % 0x3E8))
          {
            uint64_t v82 = v79;
            fprintf((FILE *)*MEMORY[0x263EF8348], "MPHF for bucket %u out of %u was generated.\n", v69 + 1, *v122);
            uint64_t v79 = v82;
          }
          v119 = v79;
          v120 = v74;
          if (*v116 == 1)
          {
            uint64_t v93 = v79[2];
            v132 = 0;
            *(void *)v133 = 0;
            v131 = 0;
            LOBYTE(v80) = *(unsigned char *)(*(void *)(v9 + 32) + v69);
            LODWORD(v74) = vcvtpd_u64_f64(*(double *)(v9 + 16) * (double)v80);
            hash_state_dump(**(_DWORD ***)(v93 + 16), &v132, &v133[1]);
            hash_state_dump(*(_DWORD **)(*(void *)(v93 + 16) + 8), &v131, v133);
            size_t __sizea = v74 + v133[1] + v133[0] + 8;
            unsigned __int8 v92 = malloc_type_malloc(__sizea, 0xE268128DuLL);
            *unsigned __int8 v92 = v133[1];
            uint64_t v94 = v133[1];
            memcpy(v92 + 1, v132, v133[1]);
            *(_DWORD *)((char *)v92 + v94 + 4) = v133[0];
            memcpy((char *)v92 + v133[1] + 8, v131, v133[0]);
            memcpy((char *)v92 + v133[1] + (unint64_t)v133[0] + 8, *(const void **)(v93 + 8), (size_t)v74);
            free(v132);
            free(v131);
            size_t v91 = __sizea;
            unint64_t v61 = (void *)v127;
            unsigned int v90 = v121;
          }
          else
          {
            if (*v116 != 4) {
              brz_new_cold_2();
            }
            uint64_t v83 = v79[2];
            v132 = 0;
            *(void *)v133 = 0;
            v131 = 0;
            unsigned int v84 = *(_DWORD *)(v83 + 16);
            uint64_t v114 = v84;
            hash_state_dump(*(_DWORD **)(v83 + 48), &v132, &v133[1]);
            hash_state_dump(*(_DWORD **)(v83 + 56), &v131, v133);
            __unsigned int size = v84 + v133[1] + v133[0] + 8;
            int v85 = malloc_type_malloc(__size, 0xBC03A31AuLL);
            *int v85 = v133[1];
            uint64_t v86 = v85 + 2;
            v115 = v85;
            uint64_t v87 = v85 + 1;
            uint64_t v88 = v133[1];
            memcpy(v85 + 1, v132, v133[1]);
            *(_DWORD *)((char *)v87 + v88) = v133[0];
            memcpy((char *)v86 + v133[1], v131, v133[0]);
            if (v114)
            {
              uint64_t v89 = 0;
              do
              {
                *((unsigned char *)v86 + v133[1] + (unint64_t)v133[0]) = *(unsigned char *)(*(void *)(v83 + 40) + v89);
                v89 += 4;
                uint64_t v86 = (_DWORD *)((char *)v86 + 1);
              }
              while (4 * v114 != v89);
            }
            free(v132);
            free(v131);
            unint64_t v61 = (void *)v127;
            unsigned int v90 = v121;
            size_t v91 = __size;
            unsigned __int8 v92 = v115;
          }
          fwrite(v92, v91, 1uLL, *(FILE **)(v9 + 104));
          free(v92);
          cmph_config_destroy(v90);
          uint64_t v95 = v65;
          unsigned int v96 = v128;
          do
          {
            free(*v96);
            *v96++ = 0;
            --v95;
          }
          while (v95);
          cmph_destroy(v119);
          cmph_io_byte_vector_adapter_destroy(v120);
          int v65 = 0;
          size_t v2 = v123;
        }
        else
        {
          size_t v2 = v123;
          unint64_t v61 = (void *)v127;
        }
        if (v66 >= *__ptr)
        {
          LODWORD(v58) = 1;
          uint64_t v3 = v112;
          goto LABEL_101;
        }
      }
      int v73 = v65;
LABEL_80:
      if (*(unsigned __int8 *)(*(void *)(v9 + 32) + v69) <= v73) {
        brz_new_cold_3();
      }
      v128[v73] = *(void **)&v10[8 * v70];
      int v65 = v73 + 1;
      *(void *)&v10[8 * v70] = 0;
      ++v66;
      v12[v70] = -1;
      goto LABEL_82;
    }
    LODWORD(v58) = 1;
LABEL_101:
    unsigned int v59 = (FILE **)MEMORY[0x263EF8348];
    int v8 = v113;
LABEL_107:
    buffer_manager_destroy((uint64_t)v61);
    free(v128);
LABEL_108:
    free(v10);
    free(v12);
    if (v58) {
      break;
    }
LABEL_109:
    --v8;
    hash_state_destroy(*(_DWORD **)(v3 + 80));
    *(void *)(v3 + 80) = 0;
    if (*(_DWORD *)(v2 + 16)) {
      fprintf(*v59, "Failure: A graph with more than 255 keys was created - %u iterations remaining\n", v8);
    }
    if (!v8)
    {
      free(*(void **)(v3 + 32));
      return 0;
    }
  }
  v99 = (int *)malloc_type_calloc(*(unsigned int *)(v3 + 60), 4uLL, 0x100004052888210uLL);
  *(void *)(v3 + 40) = v99;
  if (*(_DWORD *)(v3 + 60) >= 2u)
  {
    uint64_t v100 = 0;
    uint64_t v101 = *(void *)(v3 + 32);
    int v104 = *v99;
    v102 = v99 + 1;
    int v103 = v104;
    do
    {
      v103 += *(unsigned __int8 *)(v101 + v100);
      v102[v100] = v103;
      unint64_t v105 = v100 + 2;
      ++v100;
    }
    while (v105 < *(unsigned int *)(v3 + 60));
  }
  v110 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v110 = *(_DWORD *)v2;
  v106 = malloc_type_malloc(0x48uLL, 0x10B00409DD511FCuLL);
  v106[4] = *(void *)(v3 + 48);
  *(void *)(v3 + 48) = 0;
  long long v107 = *(_OWORD *)(v3 + 64);
  *(void *)(v3 + 64) = 0;
  *((_OWORD *)v106 + 3) = v107;
  v106[8] = *(void *)(v3 + 80);
  *(void *)(v3 + 72) = 0;
  *(void *)(v3 + 80) = 0;
  long long v108 = *(_OWORD *)(v3 + 32);
  *(void *)(v3 + 32) = 0;
  *((_OWORD *)v106 + 1) = v108;
  *(void *)(v3 + 40) = 0;
  *((_DWORD *)v106 + 10) = *(_DWORD *)(v3 + 60);
  v106[1] = *(void *)(v3 + 16);
  int v109 = *(_DWORD *)(v3 + 24);
  *((_DWORD *)v106 + 1) = v109;
  *(_DWORD *)v106 = *(_DWORD *)(v3 + 12);
  v110[2] = v106;
  *((_DWORD *)v110 + 1) = v109;
  if (*(_DWORD *)(v2 + 16)) {
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v59);
  }
  return v110;
}

uint64_t brz_dump(uint64_t a1, FILE *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  double v6 = 0;
  unsigned int __ptr = 0;
  hash_state_dump(*(_DWORD **)(v3 + 64), &v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 24), 4 * *(unsigned int *)(v3 + 40), 1uLL, a2);
  return 1;
}

size_t brz_load(FILE *a1, uint64_t a2)
{
  unsigned int __ptr = 0;
  int v4 = malloc_type_malloc(0x48uLL, 0x10B00409DD511FCuLL);
  *(void *)(a2 + 16) = v4;
  fread(v4 + 1, 8uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  fread(v4 + 5, 4uLL, 1uLL, a1);
  BOOL v5 = malloc_type_malloc(*((unsigned int *)v4 + 10), 0x100004077774924uLL);
  v4[2] = v5;
  fread(v5, *((unsigned int *)v4 + 10), 1uLL, a1);
  v4[6] = malloc_type_malloc(8 * *((unsigned int *)v4 + 10), 0x2004093837F09uLL);
  v4[7] = malloc_type_malloc(8 * *((unsigned int *)v4 + 10), 0x2004093837F09uLL);
  v4[4] = malloc_type_calloc(*((unsigned int *)v4 + 10), 8uLL, 0x10040436913F5uLL);
  if (*((_DWORD *)v4 + 10))
  {
    unint64_t v6 = 0;
    do
    {
      fread(&__ptr, 4uLL, 1uLL, a1);
      size_t v7 = __ptr;
      int v8 = malloc_type_malloc(__ptr, 0xC2345852uLL);
      fread(v8, v7, 1uLL, a1);
      *(void *)(v4[6] + 8 * v6) = hash_state_load((const char *)v8);
      free(v8);
      fread(&__ptr, 4uLL, 1uLL, a1);
      size_t v9 = __ptr;
      size_t v10 = malloc_type_malloc(__ptr, 0xB0893B3CuLL);
      fread(v10, v9, 1uLL, a1);
      *(void *)(v4[7] + 8 * v6) = hash_state_load((const char *)v10);
      free(v10);
      if (*(_DWORD *)v4 == 1)
      {
        LOBYTE(v11) = *(unsigned char *)(v4[2] + v6);
        unsigned int v12 = vcvtpd_u64_f64(*((double *)v4 + 1) * (double)v11);
      }
      else
      {
        if (*(_DWORD *)v4 != 4) {
          brz_load_cold_1();
        }
        unsigned int v12 = fch_calc_b(*(unsigned __int8 *)(v4[2] + v6), *((double *)v4 + 1));
      }
      size_t v13 = v12;
      *(void *)(v4[4] + 8 * v6) = malloc_type_calloc(v12, 1uLL, 0x100004077774924uLL);
      fread(*(void **)(v4[4] + 8 * v6++), v13, 1uLL, a1);
    }
    while (v6 < *((unsigned int *)v4 + 10));
  }
  fread(&__ptr, 4uLL, 1uLL, a1);
  size_t v14 = __ptr;
  unsigned int v15 = malloc_type_malloc(__ptr, 0x2A09125AuLL);
  fread(v15, v14, 1uLL, a1);
  v4[8] = hash_state_load((const char *)v15);
  free(v15);
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  unsigned int v16 = malloc_type_malloc(4 * *((unsigned int *)v4 + 10), 0x100004052888210uLL);
  v4[3] = v16;
  size_t v17 = 4 * *((unsigned int *)v4 + 10);

  return fread(v16, v17, 1uLL, a1);
}

uint64_t brz_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 16);
  if (*(_DWORD *)v5 == 1)
  {
    hash_vector(*(_DWORD **)(v5 + 64), a2, a3, &v22);
    uint64_t v6 = v23 % *(_DWORD *)(v5 + 40);
    LOBYTE(v14) = *(unsigned char *)(*(void *)(v5 + 16) + v6);
    unsigned int v15 = vcvtpd_u64_f64(*(double *)(v5 + 8) * (double)v14);
    unsigned int v16 = hash(*(_DWORD **)(*(void *)(v5 + 48) + 8 * v6), a2, a3) % v15;
    unsigned int v17 = hash(*(_DWORD **)(*(void *)(v5 + 56) + 8 * v6), a2, a3);
    unsigned int v18 = v17 % v15;
    if (v17 % v15 + 1 < v15) {
      unsigned int v19 = v18 + 1;
    }
    else {
      unsigned int v19 = 0;
    }
    if (v16 == v18) {
      unsigned int v18 = v19;
    }
    uint64_t v20 = *(void *)(*(void *)(v5 + 32) + 8 * v6);
    unsigned int v13 = (*(unsigned char *)(v20 + v18) + *(unsigned char *)(v20 + v16));
  }
  else
  {
    if (*(_DWORD *)v5 != 4) {
      brz_search_cold_1();
    }
    hash_vector(*(_DWORD **)(v5 + 64), a2, a3, &v22);
    uint64_t v6 = v23 % *(_DWORD *)(v5 + 40);
    unsigned int v7 = *(unsigned __int8 *)(*(void *)(v5 + 16) + v6);
    unsigned int v8 = fch_calc_b(v7, *(double *)(v5 + 8));
    double v9 = fch_calc_p1(v7);
    double v10 = fch_calc_p2(v8);
    unsigned int v11 = hash(*(_DWORD **)(*(void *)(v5 + 48) + 8 * v6), a2, a3) % v7;
    unsigned int v12 = hash(*(_DWORD **)(*(void *)(v5 + 56) + 8 * v6), a2, a3) % v7;
    unsigned int v13 = (v12
         + *(unsigned __int8 *)(*(void *)(*(void *)(v5 + 32) + 8 * v6)
                              + mixh10h11h12(v8, v11, v9, v10)))
        % v7;
  }
  return *(_DWORD *)(*(void *)(v5 + 24) + 4 * v6) + v13;
}

void brz_destroy(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = *(void **)(v2 + 32);
  if (v3)
  {
    if (*(_DWORD *)(v2 + 40))
    {
      unint64_t v4 = 0;
      do
      {
        free(*(void **)(*(void *)(v2 + 32) + 8 * v4));
        hash_state_destroy(*(_DWORD **)(*(void *)(v2 + 48) + 8 * v4));
        hash_state_destroy(*(_DWORD **)(*(void *)(v2 + 56) + 8 * v4++));
      }
      while (v4 < *(unsigned int *)(v2 + 40));
      uint64_t v3 = *(void **)(v2 + 32);
    }
    free(v3);
    free(*(void **)(v2 + 48));
    free(*(void **)(v2 + 56));
  }
  hash_state_destroy(*(_DWORD **)(v2 + 64));
  free(*(void **)(v2 + 16));
  free(*(void **)(v2 + 24));
  free((void *)v2);

  free(a1);
}

void *brz_pack(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  *a2 = *(_DWORD *)v3;
  int type = hash_get_type(*(unsigned int **)(v3 + 64));
  v2[1] = type;
  v2 += 2;
  hash_state_pack(*(_DWORD **)(v3 + 64), v2);
  uint64_t v5 = (char *)v2 + hash_state_packed_size(type);
  *(_DWORD *)uint64_t v5 = *(_DWORD *)(v3 + 40);
  *(void *)(v5 + 4) = (unint64_t)*(double *)(v3 + 8);
  int v6 = hash_get_type(**(unsigned int ***)(v3 + 48));
  *((_DWORD *)v5 + 3) = v6;
  int v7 = hash_get_type(**(unsigned int ***)(v3 + 56));
  *((_DWORD *)v5 + 4) = v7;
  v5 += 20;
  memcpy(v5, *(const void **)(v3 + 16), *(unsigned int *)(v3 + 40));
  uint64_t v8 = *(unsigned int *)(v3 + 40);
  double v9 = &v5[v8];
  uint64_t result = memcpy(v9, *(const void **)(v3 + 24), 4 * v8);
  uint64_t v11 = *(unsigned int *)(v3 + 40);
  if (v11)
  {
    unint64_t v12 = 0;
    unsigned int v13 = &v9[4 * v11];
    unint64_t v14 = &v13[4 * v11];
    do
    {
      *(_DWORD *)&v13[4 * v12] = v14;
      hash_state_pack(*(_DWORD **)(*(void *)(v3 + 48) + 8 * v12), v14);
      unsigned int v15 = &v14[hash_state_packed_size(v6)];
      hash_state_pack(*(_DWORD **)(*(void *)(v3 + 56) + 8 * v12), v15);
      unsigned int v16 = hash_state_packed_size(v7);
      if (*(_DWORD *)v3 == 1)
      {
        LOBYTE(v17) = *(unsigned char *)(*(void *)(v3 + 16) + v12);
        unsigned int v18 = vcvtpd_u64_f64(*(double *)(v3 + 8) * (double)v17);
      }
      else
      {
        if (*(_DWORD *)v3 != 4) {
          brz_pack_cold_1();
        }
        unsigned int v18 = fch_calc_b(*(unsigned __int8 *)(*(void *)(v3 + 16) + v12), *(double *)(v3 + 8));
      }
      unsigned int v19 = &v15[v16];
      uint64_t result = memcpy(v19, *(const void **)(*(void *)(v3 + 32) + 8 * v12), v18);
      unint64_t v14 = &v19[v18];
      ++v12;
    }
    while (v12 < *(unsigned int *)(v3 + 40));
  }
  return result;
}

uint64_t brz_packed_size(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int type = hash_get_type(*(unsigned int **)(v1 + 64));
  int v3 = hash_get_type(**(unsigned int ***)(v1 + 48));
  int v4 = hash_get_type(**(unsigned int ***)(v1 + 56));
  int v5 = hash_state_packed_size(type) + *(_DWORD *)(v1 + 40) + 8 * *(_DWORD *)(v1 + 40);
  int v6 = v5 + *(_DWORD *)(v1 + 40) * hash_state_packed_size(v3);
  int v7 = hash_state_packed_size(v4);
  unsigned int v9 = *(_DWORD *)(v1 + 40);
  uint64_t v10 = v6 + v9 * v7 + 32;
  if (v9)
  {
    for (unint64_t i = 0; i < v9; ++i)
    {
      if (*(_DWORD *)v1 == 1)
      {
        LOBYTE(v8) = *(unsigned char *)(*(void *)(v1 + 16) + i);
        double v8 = (double)*(unint64_t *)&v8;
        unsigned int v12 = vcvtpd_u64_f64(*(double *)(v1 + 8) * v8);
      }
      else
      {
        if (*(_DWORD *)v1 != 4) {
          brz_packed_size_cold_1();
        }
        unsigned int v12 = fch_calc_b(*(unsigned __int8 *)(*(void *)(v1 + 16) + i), *(double *)(v1 + 8));
        unsigned int v9 = *(_DWORD *)(v1 + 40);
      }
      uint64_t v10 = v12 + v10;
    }
  }
  return v10;
}

uint64_t brz_search_packed(_DWORD *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (*a1 == 1)
  {
    int v25 = a1 + 2;
    int v26 = a1[1];
    unsigned int v27 = (_DWORD *)((char *)a1 + hash_state_packed_size(v26) + 8);
    uint64_t v28 = *v27;
    double v29 = (double)*(unint64_t *)(v27 + 1);
    unint64_t v30 = v27 + 5;
    int v31 = v27[3];
    int v32 = v27[4];
    int v33 = (char *)v27 + v28 + 20;
    hash_vector_packed(v25, v26, a2, a3, &v43);
    LOBYTE(v34) = *((unsigned char *)v30 + v44 % v28);
    LODWORD(v30) = vcvtpd_u64_f64(v29 * (double)v34);
    unsigned int v18 = &v33[4 * (v44 % v28)];
    int v35 = (unsigned int *)*(unsigned int *)&v18[4 * v28];
    int v36 = (unsigned int *)((char *)v35 + hash_state_packed_size(v31));
    int v37 = hash_state_packed_size(v32);
    unsigned int v38 = hash_packed(v35, v31, a2, a3) % v30;
    unsigned int v39 = hash_packed(v36, v32, a2, a3);
    unsigned int v40 = v39 % v30;
    if (v39 % v30 + 1 < v30) {
      unsigned int v41 = v40 + 1;
    }
    else {
      unsigned int v41 = 0;
    }
    if (v38 == v40) {
      unsigned int v40 = v41;
    }
    unsigned int v24 = (*((unsigned char *)v36 + v37 + v40) + *((unsigned char *)v36 + v37 + v38));
  }
  else
  {
    if (*a1 != 4) {
      brz_search_packed_cold_1();
    }
    int v5 = a1 + 2;
    int v6 = a1[1];
    int v7 = (_DWORD *)((char *)a1 + hash_state_packed_size(v6) + 8);
    uint64_t v8 = *v7;
    double v9 = (double)*(unint64_t *)(v7 + 1);
    uint64_t v10 = v7 + 5;
    int v11 = v7[3];
    int v12 = v7[4];
    unsigned int v13 = (char *)v7 + v8 + 20;
    hash_vector_packed(v5, v6, a2, a3, &v43);
    unsigned int v14 = v44 % v8;
    LODWORD(v5) = *((unsigned __int8 *)v10 + v44 % v8);
    unsigned int v15 = fch_calc_b(v5, v9);
    double v16 = fch_calc_p1(v5);
    double v17 = fch_calc_p2(v15);
    unsigned int v18 = &v13[4 * v14];
    unsigned int v19 = (unsigned int *)*(unsigned int *)&v18[4 * v8];
    uint64_t v20 = (unsigned int *)((char *)v19 + hash_state_packed_size(v11));
    int v21 = (char *)v20 + hash_state_packed_size(v12);
    unsigned int v22 = hash_packed(v19, v11, a2, a3) % v5;
    unsigned int v23 = hash_packed(v20, v12, a2, a3) % v5;
    unsigned int v24 = (v23 + v21[mixh10h11h12(v15, v22, v16, v17)]) % v5;
  }
  return *(_DWORD *)v18 + v24;
}

void *buffer_entry_new(int a1)
{
  uint64_t result = malloc_type_malloc(0x20uLL, 0x1030040D278AA01uLL);
  if (result)
  {
    *uint64_t result = 0;
    result[1] = 0;
    *((_DWORD *)result + 4) = a1;
    *((_DWORD *)result + 5) = a1;
    *((_DWORD *)result + 6) = a1;
    *((unsigned char *)result + 28) = 0;
  }
  return result;
}

FILE *buffer_entry_open(FILE **a1, char *__filename)
{
  uint64_t result = fopen(__filename, "rb");
  *a1 = result;
  return result;
}

uint64_t buffer_entry_set_capacity(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t buffer_entry_get_capacity(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

_DWORD *buffer_entry_read_key(uint64_t a1, char *__dst)
{
  unsigned int v3 = *(_DWORD *)(a1 + 20);
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  if (*(unsigned char *)(a1 + 28)) {
    BOOL v4 = v3 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return 0;
  }
  unsigned int v7 = v2 + 4 - v3;
  if ((int)v2 + 4 <= v3)
  {
    size_t v8 = 0;
    unsigned int v7 = 4;
  }
  else
  {
    size_t v8 = v3 - v2;
    if (v3 != v2) {
      memcpy(__dst, (const void *)(*(void *)(a1 + 8) + v2), v8);
    }
    buffer_entry_load(a1);
    LODWORD(v2) = *(_DWORD *)(a1 + 24);
  }
  memcpy(&__dst[4 * v8], (const void *)(*(void *)(a1 + 8) + v2), v7);
  *(_DWORD *)(a1 + 24) += v7;
  size_t v10 = *(unsigned int *)__dst;
  int v11 = malloc_type_malloc(v10 + 4, 0xAEC110B1uLL);
  double v9 = v11;
  *int v11 = *(_DWORD *)__dst;
  unsigned int v13 = *(_DWORD *)(a1 + 20);
  uint64_t v12 = *(unsigned int *)(a1 + 24);
  size_t v14 = v12 + v10 - v13;
  if ((int)v12 + (int)v10 <= v13)
  {
    size_t v15 = 0;
    LODWORD(v14) = v10;
  }
  else
  {
    size_t v15 = v13 - v12;
    if (v13 != v12) {
      memcpy(v11 + 1, (const void *)(*(void *)(a1 + 8) + v12), v15);
    }
    buffer_entry_load(a1);
    LODWORD(v12) = *(_DWORD *)(a1 + 24);
    size_t v10 = v14;
  }
  memcpy((char *)v9 + v15 + 4, (const void *)(*(void *)(a1 + 8) + v12), v10);
  *(_DWORD *)(a1 + 24) += v14;
  return v9;
}

size_t buffer_entry_load(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  uint64_t v2 = malloc_type_calloc(*(unsigned int *)(a1 + 16), 1uLL, 0x100004077774924uLL);
  *(void *)(a1 + 8) = v2;
  size_t result = fread(v2, 1uLL, *(unsigned int *)(a1 + 16), *(FILE **)a1);
  *(_DWORD *)(a1 + 20) = result;
  if (*(_DWORD *)(a1 + 16) != result) {
    *(unsigned char *)(a1 + 28) = 1;
  }
  *(_DWORD *)(a1 + 24) = 0;
  return result;
}

void buffer_entry_destroy(uint64_t a1)
{
  fclose(*(FILE **)a1);
  *(void *)a1 = 0;
  free(*(void **)(a1 + 8));

  free((void *)a1);
}

void *buffer_manager_new(int a1, unsigned int a2)
{
  BOOL v4 = malloc_type_malloc(0x28uLL, 0x1090040C43F5BDEuLL);
  int v5 = v4;
  if (v4)
  {
    *(_DWORD *)BOOL v4 = a1;
    v4[1] = malloc_type_calloc(a2, 8uLL, 0x2004093837F09uLL);
    v5[3] = malloc_type_calloc(a2, 4uLL, 0x100004052888210uLL);
    *((_DWORD *)v5 + 8) = -1;
    *((_DWORD *)v5 + 4) = a2;
    if (a2)
    {
      unint64_t v6 = 0;
      int v7 = *(_DWORD *)v5 / a2 + 1;
      do
        *(void *)(v5[1] + 8 * v6++) = buffer_entry_new(v7);
      while (v6 < *((unsigned int *)v5 + 4));
    }
  }
  return v5;
}

FILE *buffer_manager_open(uint64_t a1, unsigned int a2, char *__filename)
{
  return buffer_entry_open(*(FILE ***)(*(void *)(a1 + 8) + 8 * a2), __filename);
}

_DWORD *buffer_manager_read_key(uint64_t a1, unsigned int a2, char *a3)
{
  uint64_t v6 = a2;
  if ((*(_DWORD *)(a1 + 32) & 0x80000000) == 0)
  {
    int capacity = buffer_entry_get_capacity(*(void *)(*(void *)(a1 + 8) + 8 * a2));
    uint64_t v8 = *(void *)(a1 + 24);
    uint64_t v9 = *(int *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v9 - 1;
    buffer_entry_set_capacity(*(void *)(*(void *)(a1 + 8) + 8 * a2), *(_DWORD *)(v8 + 4 * v9) + capacity);
  }
  key = buffer_entry_read_key(*(void *)(*(void *)(a1 + 8) + 8 * v6), a3);
  if (!key)
  {
    int v11 = buffer_entry_get_capacity(*(void *)(*(void *)(a1 + 8) + 8 * v6));
    uint64_t v12 = *(void *)(a1 + 24);
    uint64_t v13 = *(int *)(a1 + 32) + 1;
    *(_DWORD *)(a1 + 32) = v13;
    *(_DWORD *)(v12 + 4 * v13) = v11;
  }
  return key;
}

void buffer_manager_destroy(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16))
  {
    unint64_t v2 = 0;
    do
      buffer_entry_destroy(*(void *)(*(void *)(a1 + 8) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 16));
  }
  free(*(void **)(a1 + 24));
  free(*(void **)(a1 + 8));

  free((void *)a1);
}

void *chd_config_new(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  unint64_t v2 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  unsigned int v3 = v2;
  if (v2)
  {
    *unint64_t v2 = 0;
    *unint64_t v2 = cmph_config_new(v1);
    cmph_config_set_algo();
  }
  return v3;
}

void chd_config_destroy(uint64_t a1)
{
  uint64_t v1 = *(_DWORD ***)(a1 + 32);
  if (*v1) {
    cmph_config_destroy(*v1);
  }

  free(v1);
}

uint64_t chd_config_set_hashfuncs(uint64_t a1, _DWORD *a2)
{
  return cmph_config_set_hashfuncs(**(void **)(a1 + 32), a2);
}

uint64_t chd_config_set_b(uint64_t a1, int a2)
{
  return cmph_config_set_b(**(void **)(a1 + 32), a2);
}

uint64_t chd_config_set_keys_per_bin(uint64_t a1, int a2)
{
  return cmph_config_set_keys_per_bin(**(void **)(a1 + 32), a2);
}

int *chd_new(uint64_t a1, double a2)
{
  BOOL v4 = *(uint64_t **)(a1 + 32);
  uint64_t v5 = *v4;
  uint64_t v6 = *(void *)(*v4 + 32);
  memset(v23, 0, sizeof(v23));
  cmph_config_set_verbosity(v5, *(_DWORD *)(a1 + 16));
  cmph_config_set_graphsize(*v4, a2);
  int v7 = (FILE **)MEMORY[0x263EF8348];
  if (*(_DWORD *)(a1 + 16)) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Generating a CHD_PH perfect hash function with a load factor equal to %.3f\n", a2);
  }
  uint64_t v8 = (int *)cmph_new(*v4);
  uint64_t v9 = v8;
  if (v8)
  {
    unsigned int v10 = cmph_packed_size(v8);
    int v11 = (int *)malloc_type_calloc(v10, 1uLL, 0xE1512BACuLL);
    cmph_pack(v9, v11);
    cmph_destroy(v9);
    if (*(_DWORD *)(a1 + 16)) {
      fwrite("Compressing the range of the resulting CHD_PH perfect hash function\n", 0x44uLL, 1uLL, *v7);
    }
    compressed_rank_init((uint64_t)v23);
    int v12 = *(_DWORD *)(v6 + 20);
    int v13 = *(_DWORD *)(v6 + 32);
    size_t v14 = malloc_type_calloc((v12 - v13), 4uLL, 0x100004052888210uLL);
    size_t v15 = v14;
    if (v12)
    {
      unsigned int v16 = 0;
      unsigned int v17 = 0;
      uint64_t v18 = *(void *)(v6 + 48);
      do
      {
        if ((bitmask32[v17 & 0x1F] & *(_DWORD *)(v18 + 4 * (v17 >> 5))) == 0) {
          *((_DWORD *)v14 + v16++) = v17;
        }
        ++v17;
      }
      while (v12 != v17);
    }
    compressed_rank_generate((uint64_t)v23, (uint64_t)v14, v12 - v13);
    free(v15);
    unsigned int v19 = compressed_rank_packed_size(v23);
    uint64_t v20 = malloc_type_calloc(v19, 1uLL, 0x100004077774924uLL);
    compressed_rank_pack((uint64_t)v23, v20);
    compressed_rank_destroy((uint64_t)v23);
    uint64_t v9 = (int *)malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
    int *v9 = *(_DWORD *)a1;
    int v21 = malloc_type_malloc(0x20uLL, 0x101004097AD5072uLL);
    v21[1] = v20;
    v21[3] = v11;
    *((_DWORD *)v21 + 4) = v10;
    *(_DWORD *)int v21 = v19;
    *((void *)v9 + 2) = v21;
    v9[1] = v13;
    if (*(_DWORD *)(a1 + 16)) {
      fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v7);
    }
  }
  return v9;
}

size_t chd_load(FILE *a1, uint64_t a2)
{
  BOOL v4 = malloc_type_malloc(0x20uLL, 0x101004097AD5072uLL);
  *(void *)(a2 + 16) = v4;
  fread(v4 + 2, 4uLL, 1uLL, a1);
  uint64_t v5 = malloc_type_calloc(*((unsigned int *)v4 + 4), 1uLL, 0x9AE89B98uLL);
  v4[3] = v5;
  fread(v5, *((unsigned int *)v4 + 4), 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  uint64_t v6 = malloc_type_calloc(*(unsigned int *)v4, 1uLL, 0x49D48493uLL);
  v4[1] = v6;
  size_t v7 = *(unsigned int *)v4;

  return fread(v6, v7, 1uLL, a1);
}

uint64_t chd_dump(uint64_t a1, FILE *a2)
{
  unsigned int v3 = *(const void ***)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  fwrite(v3 + 2, 4uLL, 1uLL, a2);
  fwrite(v3[3], *((unsigned int *)v3 + 4), 1uLL, a2);
  fwrite(v3, 4uLL, 1uLL, a2);
  fwrite(v3[1], *(unsigned int *)v3, 1uLL, a2);
  return 1;
}

void chd_destroy(void *a1)
{
  unint64_t v2 = (void **)a1[2];
  free(v2[3]);
  free(v2[1]);
  free(v2);

  free(a1);
}

uint64_t chd_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  BOOL v4 = *(unsigned int **)(v3 + 8);
  unsigned int v5 = cmph_search_packed(*(_DWORD **)(v3 + 24), a2, a3);
  return v5 - compressed_rank_query_packed(v4, v5);
}

void *chd_pack(uint64_t a1, _DWORD *a2)
{
  unint64_t v2 = *(const void ***)(a1 + 16);
  *a2 = *(_DWORD *)v2;
  uint64_t v3 = a2 + 1;
  memcpy(a2 + 1, v2[1], *(unsigned int *)v2);
  BOOL v4 = (_DWORD *)((char *)v3 + *(unsigned int *)v2);
  *BOOL v4 = *((_DWORD *)v2 + 4);
  unsigned int v5 = v4 + 1;
  uint64_t v6 = v2[3];
  size_t v7 = *((unsigned int *)v2 + 4);

  return memcpy(v5, v6, v7);
}

uint64_t chd_packed_size(uint64_t a1)
{
  return (**(_DWORD **)(a1 + 16) + *(_DWORD *)(*(void *)(a1 + 16) + 16) + 12);
}

uint64_t chd_search_packed(unsigned int *a1)
{
  uint64_t v1 = a1 + 1;
  unsigned int v2 = cmph_search_packed((char *)a1 + *a1 + 8);
  return v2 - compressed_rank_query_packed(v1, v2);
}

double chd_ph_config_new()
{
  v0 = malloc_type_malloc(0x38uLL, 0x10300403C8AB7B5uLL);
  if (v0)
  {
    v0[4] = 0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
    *((unsigned char *)v0 + 36) = 1;
    *(void *)&double result = 0x400000001;
    v0[5] = 0x400000001;
    v0[6] = 0;
  }
  return result;
}

void chd_ph_config_destroy(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  unsigned int v2 = (void *)v1[6];
  if (v2) {
    free(v2);
  }

  free(v1);
}

uint64_t chd_ph_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1) {
    **(_DWORD **)(result + 32) = *a2;
  }
  return result;
}

uint64_t chd_ph_config_set_b(uint64_t result, int a2)
{
  if (!result) {
    chd_ph_config_set_b_cold_1();
  }
  if ((a2 - 15) >= 0xFFFFFFF2) {
    int v2 = a2;
  }
  else {
    int v2 = 4;
  }
  *(_DWORD *)(*(void *)(result + 32) + 44) = v2;
  return result;
}

uint64_t chd_ph_config_set_keys_per_bin(uint64_t result, int a2)
{
  if (!result) {
    chd_ph_config_set_keys_per_bin_cold_1();
  }
  if ((a2 - 128) < 0xFFFFFF82) {
    int v2 = 1;
  }
  else {
    int v2 = a2;
  }
  *(_DWORD *)(*(void *)(result + 32) + 40) = v2;
  return result;
}

void *chd_ph_new(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = *(_DWORD *)(*(void *)(a1 + 8) + 8);
  *(_DWORD *)(v4 + 32) = v5;
  int v6 = v5 / *(_DWORD *)(v4 + 44) + 1;
  if (a2 < 0.5) {
    a2 = 0.5;
  }
  if (a2 >= 0.99) {
    a2 = 0.99;
  }
  LODWORD(a4) = *(_DWORD *)(v4 + 40);
  unsigned int v7 = ((double)v5 / (a2 * (double)*(unint64_t *)&a4));
  if (((_BYTE)v7 + 1)) {
    unint64_t v8 = v7 + 1;
  }
  else {
    unint64_t v8 = v7 + 2;
  }
  *(_DWORD *)(v4 + 16) = v6;
  while (1)
  {
    *(_DWORD *)(v4 + 20) = v8;
    if (check_primality(v8) == 1) {
      break;
    }
    unint64_t v8 = (*(_DWORD *)(v4 + 20) + 2);
  }
  double v10 = 0.0;
  uint64_t v108 = v4;
  if (*(_DWORD *)(v4 + 40) == 1)
  {
    LODWORD(v10) = *(_DWORD *)(v4 + 20);
    LODWORD(v9) = *(_DWORD *)(v4 + 32);
    double v10 = ((1.0 / ((double)v9 + (double)v9) + (double)*(unint64_t *)&v10 / (double)v9 + -1.0)
         * log(1.0 - (double)v9 / (double)*(unint64_t *)&v10)
         + 1.0)
        / 0.693147181;
  }
  int v11 = (FILE **)MEMORY[0x263EF8348];
  if (*(_DWORD *)(a1 + 16)) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "space lower bound is %.3f bits per key\n", v10);
  }
  int v109 = (unsigned int *)malloc_type_calloc(*(unsigned int *)(v4 + 16), 8uLL, 0x100004000313F17uLL);
  int v12 = (char *)malloc_type_calloc(*(unsigned int *)(v4 + 32), 8uLL, 0x100004000313F17uLL);
  LODWORD(v13) = *(_DWORD *)(v4 + 32);
  double v14 = log((double)v13) / 0.693147181 / 20.0;
  size_t v15 = *(unsigned int *)(v4 + 20);
  if (*(_DWORD *)(v4 + 40) == 1)
  {
    size_t v15 = (v15 + 31) >> 5;
    size_t v16 = 4;
    unsigned int v17 = 1384677904;
  }
  else
  {
    size_t v16 = 1;
    unsigned int v17 = 2004306212;
  }
  uint64_t v18 = a1;
  unsigned int v112 = vcvtd_n_u64_f64(v14, 0x14uLL);
  *(void *)(v4 + 48) = malloc_type_calloc(v15, v16, v17 | 0x100004000000000);
  v115 = malloc_type_calloc(*(unsigned int *)(v4 + 16), 4uLL, 0x100004052888210uLL);
  v110 = 0;
  int v19 = 100;
  while (1)
  {
    uint64_t v20 = v12;
    int v21 = v109;
    if (*(_DWORD *)(v18 + 16)) {
      fprintf(*v11, "Starting mapping step for mph creation of %u keys with %u bins\n", *(_DWORD *)(v108 + 32), *(_DWORD *)(v108 + 20));
    }
    int v106 = v19 - 1;
    uint64_t v22 = *(void *)(v18 + 32);
    v119 = 0;
    unsigned int v118 = 0;
    unsigned int v23 = (unsigned __int32 *)malloc_type_malloc(12 * *(unsigned int *)(v22 + 32), 0x10000403E1C8BA9uLL);
    unsigned int v24 = 0;
    int v25 = v109 + 1;
    int v26 = 1000;
    while (1)
    {
      unsigned int v27 = *(_DWORD **)(v22 + 24);
      if (v27) {
        hash_state_destroy(v27);
      }
      *(void *)(v22 + 24) = hash_state_new(*(_DWORD *)v22, *(_DWORD *)(v22 + 32));
      if (!v109) {
        chd_ph_new_cold_1();
      }
      uint64_t v28 = *(unsigned int *)(v22 + 16);
      double v29 = v109 + 1;
      if (v28)
      {
        do
        {
          *double v29 = 0;
          v29 += 2;
          --v28;
        }
        while (v28);
      }
      int v116 = v26;
      (*(void (**)(void))(*(void *)(v18 + 8) + 32))(**(void **)(v18 + 8));
      if (*(_DWORD *)(v22 + 32))
      {
        unint64_t v30 = 0;
        int v31 = v23 + 2;
        do
        {
          (*(void (**)(void, unsigned __int8 **, unsigned int *))(*(void *)(a1 + 8) + 16))(**(void **)(a1 + 8), &v119, &v118);
          hash_vector(*(_DWORD **)(v22 + 24), v119, v118, &v120);
          unsigned int v32 = *(_DWORD *)(v22 + 20);
          unsigned __int32 v33 = v120.i32[0] % *(_DWORD *)(v22 + 16);
          *(v31 - 2) = v120.i32[1] % v32;
          *(v31 - 1) = v121 % (v32 - 1) + 1;
          *int v31 = v33;
          (*(void (**)(void, unsigned __int8 *, void))(*(void *)(a1 + 8) + 24))(**(void **)(a1 + 8), v119, v118);
          unint64_t v34 = &v109[2 * v33];
          unsigned int v35 = v34[1];
          v34[1] = v35 + 1;
          if (v35 + 1 > v24) {
            unsigned int v24 = v35 + 1;
          }
          ++v30;
          v31 += 3;
        }
        while (v30 < *(unsigned int *)(v22 + 32));
      }
      *int v109 = 0;
      if (*(_DWORD *)(v22 + 16) < 2u)
      {
        int v40 = 0;
        uint64_t v18 = a1;
        int v39 = v116;
      }
      else
      {
        uint64_t v36 = 0;
        int v37 = 0;
        unsigned int v38 = v109 + 1;
        uint64_t v18 = a1;
        int v39 = v116;
        do
        {
          v37 += *v38;
          *unsigned int v38 = 0;
          v38[1] = v37;
          v38 += 2;
          int v40 = v36 + 1;
          unint64_t v41 = v36 + 2;
          ++v36;
        }
        while (v41 < *(unsigned int *)(v22 + 16));
      }
      v109[2 * v40 + 1] = 0;
      LODWORD(v42) = *(_DWORD *)(v22 + 32);
      if (!v42) {
        break;
      }
      unint64_t v43 = 0;
      int v26 = v39 - 1;
      while (1)
      {
        unsigned int v44 = &v23[3 * v43];
        uint64_t v45 = &v109[2 * v44[2]];
        unsigned __int8 v46 = &v20[8 * *v45];
        unsigned int v49 = v45[1];
        int v47 = v45 + 1;
        unsigned int v48 = v49;
        unsigned __int32 v50 = *v44;
        if (v49) {
          break;
        }
LABEL_43:
        *(_DWORD *)unsigned __int8 v46 = v50;
        *((_DWORD *)v46 + 1) = v23[3 * v43 + 1];
        ++*v47;
        ++v43;
        unint64_t v42 = *(unsigned int *)(v22 + 32);
        if (v43 >= v42) {
          goto LABEL_44;
        }
      }
      while (*(_DWORD *)v46 != v50 || *((_DWORD *)v46 + 1) != v23[3 * v43 + 1])
      {
        v46 += 8;
        if (!--v48) {
          goto LABEL_43;
        }
      }
LABEL_44:
      if (v42 == v43) {
        break;
      }
      if (!v26)
      {
        free(v23);
        hash_state_destroy(*(_DWORD **)(v22 + 24));
        *(void *)(v22 + 24) = 0;
        if (*(_DWORD *)(v18 + 16)) {
          fwrite("Failure in mapping step\n", 0x18uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
        }
LABEL_124:
        free(v21);
        free(v20);
        free(v110);
        free(v115);
        uint64_t v103 = v108;
        int v104 = *(_DWORD **)(v108 + 24);
        if (v104)
        {
          hash_state_destroy(v104);
          uint64_t v103 = v108;
        }
        uint64_t v100 = 0;
        *(void *)(v103 + 24) = 0;
        return v100;
      }
    }
    free(v23);
    if (*(_DWORD *)(v18 + 16)) {
      fwrite("Starting ordering step\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    if (v110) {
      free(v110);
    }
    size_t v51 = *(unsigned int *)(v108 + 16);
    size_t v52 = *(unsigned int *)(v108 + 32);
    unsigned int v53 = (char *)malloc_type_calloc(v24 + 1, 8uLL, 0x100004000313F17uLL);
    if (v51)
    {
      unsigned int v54 = v109 + 1;
      size_t v55 = v51;
      do
      {
        unsigned int v57 = *v54;
        v54 += 2;
        uint64_t v56 = v57;
        if (v57) {
          ++*(_DWORD *)&v53[8 * v56 + 4];
        }
        --v55;
      }
      while (v55);
    }
    *((_DWORD *)v53 + 2) = 0;
    if (v24 >= 2)
    {
      int v59 = 0;
      unsigned int v60 = 1;
      do
      {
        unsigned int v58 = v60 + 1;
        unint64_t v61 = &v53[8 * v60];
        v59 += *((_DWORD *)v61 + 1);
        *(_DWORD *)&v53[8 * v60 + 8] = v59;
        *((_DWORD *)v61 + 1) = 0;
        LODWORD(v61) = v60 + 2;
        ++v60;
      }
      while (v61 <= v24);
    }
    else
    {
      unsigned int v58 = 1;
    }
    v110 = v53;
    *(_DWORD *)&v53[8 * v58 + 4] = 0;
    uint64_t v62 = (unsigned int *)malloc_type_calloc(v51, 8uLL, 0x100004000313F17uLL);
    if (v51)
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        uint64_t v64 = *v25;
        if (v64)
        {
          int v65 = &v110[8 * v64];
          unsigned int v66 = &v62[2 * (*((_DWORD *)v65 + 1) + *(_DWORD *)v65)];
          v66[1] = i;
          *unsigned int v66 = *(v25 - 1);
          ++*((_DWORD *)v65 + 1);
        }
        v25 += 2;
      }
    }
    int v109 = v62;
    free(v21);
    unsigned int v67 = (char *)malloc_type_calloc(v52, 8uLL, 0x100004000313F17uLL);
    int v12 = v67;
    if (v24)
    {
      unsigned int v68 = 0;
      for (unsigned int j = 1; j <= v24; ++j)
      {
        uint64_t v70 = &v110[8 * j];
        uint64_t v71 = *(unsigned int *)v70;
        uint64_t v72 = (*((_DWORD *)v70 + 1) + v71);
        if (v71 < v72)
        {
          do
          {
            unsigned int v73 = v109[2 * v71];
            v109[2 * v71] = v68;
            if (j)
            {
              for (int k = 0; k != j; ++k)
                *(void *)&v67[8 * v68 + 8 * k] = *(void *)&v20[8 * v73 + 8 * k];
              v68 += k;
            }
            ++v71;
          }
          while (v71 != v72);
        }
      }
    }
    free(v20);
    if (*(_DWORD *)(v18 + 16)) {
      fwrite("Starting searching step\n", 0x18uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    uint64_t v75 = v108;
    if (!*(unsigned char *)(v108 + 36)) {
      break;
    }
    if (!v24) {
      goto LABEL_116;
    }
    uint64_t v76 = v24;
    while (1)
    {
      uint64_t v114 = &v110[8 * v76];
      v117 = (unsigned int *)(v114 + 4);
      unsigned int v107 = *((_DWORD *)v114 + 1);
      if (v107) {
        break;
      }
LABEL_93:
      unsigned int *v117 = v107;
      if (!--v76) {
        goto LABEL_116;
      }
    }
    unsigned int v77 = 0;
    unsigned int v78 = 0;
    int v79 = 0;
    while (1)
    {
      int v113 = v79;
      unsigned int v80 = 0;
      unsigned int v81 = 0;
      int v82 = *(_DWORD *)v114;
      do
      {
        int v83 = v82 + v81;
        uint64_t v84 = v76;
        if (place_bucket_probe(v108, (uint64_t)v109, (uint64_t)v12, v78, v77, v82 + v81, v76)) {
          *((_DWORD *)v115 + v109[2 * v83 + 1]) = v78 + *(_DWORD *)(v108 + 20) * v77;
        }
        else {
          *(void *)&v109[2 * *(_DWORD *)v114 + 2 * v80++] = *(void *)&v109[2 * v83];
        }
        ++v81;
        uint64_t v76 = v84;
      }
      while (v81 < *v117);
      unsigned int *v117 = v80;
      unsigned int v85 = v78 + 1;
      unsigned int v86 = *(_DWORD *)(v108 + 20);
      if (v78 + 1 >= v86) {
        ++v77;
      }
      int v79 = v113 + 1;
      if (v113 + 1 >= v112 || v77 >= v86) {
        break;
      }
      if (v85 < v86) {
        unsigned int v86 = 0;
      }
      unsigned int v78 = v85 - v86;
      if (!v80) {
        goto LABEL_93;
      }
    }
    unsigned int *v117 = v107;
LABEL_96:
    if (*(_DWORD *)(v108 + 40) <= 1u) {
      size_t v87 = ((v86 + 31) >> 3) & 0x1FFFFFFC;
    }
    else {
      size_t v87 = v86;
    }
    bzero(*(void **)(v108 + 48), v87);
    uint64_t v18 = a1;
    int v11 = (FILE **)MEMORY[0x263EF8348];
    int v19 = v106;
    if (!v106)
    {
      if (*(_DWORD *)(a1 + 16)) {
        fwrite("Failure because the max trials was exceeded\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      }
      int v21 = v109;
      uint64_t v20 = v12;
      goto LABEL_124;
    }
  }
  uint64_t v88 = (uint64_t)v109;
  if (v24)
  {
    uint64_t v89 = v24;
    do
    {
      unsigned int v90 = &v110[8 * v89];
      unint64_t v91 = *(unsigned int *)v90;
      if (v91 < *((_DWORD *)v90 + 1) + (int)v91)
      {
        do
        {
          unsigned int v92 = 0;
          unsigned int v93 = 0;
          unsigned int v94 = 1;
          while (!place_bucket_probe(v108, v88, (uint64_t)v12, v92, v93, v91, v89))
          {
            unsigned int v95 = v92 + 1;
            unsigned int v86 = *(_DWORD *)(v108 + 20);
            if (v92 + 1 < v86) {
              int v96 = 0;
            }
            else {
              int v96 = *(_DWORD *)(v108 + 20);
            }
            if (v95 >= v86) {
              ++v93;
            }
            if (v94 < v112)
            {
              unsigned int v92 = v95 - v96;
              ++v94;
              uint64_t v88 = (uint64_t)v109;
              if (v93 < v86) {
                continue;
              }
            }
            goto LABEL_96;
          }
          uint64_t v88 = (uint64_t)v109;
          *((_DWORD *)v115 + v109[2 * v91++ + 1]) = v92 + *(_DWORD *)(v108 + 20) * v93;
        }
        while (v91 < (*(_DWORD *)v90 + *((_DWORD *)v90 + 1)));
      }
      --v89;
    }
    while (v89);
  }
LABEL_116:
  uint64_t v97 = (FILE **)MEMORY[0x263EF8348];
  if (*(_DWORD *)(a1 + 16))
  {
    fwrite("Starting compressing step\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    uint64_t v75 = v108;
  }
  v98 = *(void **)(v75 + 8);
  if (v98) {
    free(v98);
  }
  v99 = malloc_type_calloc(1uLL, 0x38uLL, 0x10100406BA554FBuLL);
  *(void *)(v108 + 8) = v99;
  compressed_seq_init((uint64_t)v99);
  compressed_seq_generate(*(unsigned int **)(v108 + 8), (uint64_t)v115, *(unsigned int *)(v108 + 16));
  free(v109);
  free(v12);
  free(v110);
  free(v115);
  uint64_t v100 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)uint64_t v100 = *(_DWORD *)a1;
  uint64_t v101 = malloc_type_malloc(0x18uLL, 0x102004014030ADEuLL);
  *uint64_t v101 = *(void *)(v108 + 8);
  *(void *)(v108 + 8) = 0;
  v101[2] = *(void *)(v108 + 24);
  *(void *)(v108 + 24) = 0;
  int v102 = *(_DWORD *)(v108 + 20);
  *((_DWORD *)v101 + 3) = v102;
  *((_DWORD *)v101 + 2) = *(_DWORD *)(v108 + 16);
  v100[2] = v101;
  *((_DWORD *)v100 + 1) = v102;
  if (*(_DWORD *)(a1 + 16)) {
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v97);
  }
  return v100;
}

size_t chd_ph_load(FILE *a1, uint64_t a2)
{
  unsigned int __ptr = 0;
  uint64_t v4 = malloc_type_malloc(0x18uLL, 0x102004014030ADEuLL);
  *(void *)(a2 + 16) = v4;
  fread(&__ptr, 4uLL, 1uLL, a1);
  size_t v5 = __ptr;
  int v6 = malloc_type_malloc(__ptr, 0xA1556DE2uLL);
  fread(v6, v5, 1uLL, a1);
  v4[2] = hash_state_load((const char *)v6);
  free(v6);
  fread(&__ptr, 4uLL, 1uLL, a1);
  size_t v7 = __ptr;
  unint64_t v8 = malloc_type_malloc(__ptr, 0x4531BB4AuLL);
  fread(v8, v7, 1uLL, a1);
  unint64_t v9 = malloc_type_calloc(1uLL, 0x38uLL, 0x10100406BA554FBuLL);
  *uint64_t v4 = v9;
  compressed_seq_load((uint64_t)v9, v8);
  free(v8);
  fread((char *)v4 + 12, 4uLL, 1uLL, a1);

  return fread(v4 + 1, 4uLL, 1uLL, a1);
}

uint64_t chd_ph_dump(uint64_t a1, FILE *a2)
{
  int v6 = 0;
  unsigned int __ptr = 0;
  uint64_t v3 = *(void *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  hash_state_dump(*(_DWORD **)(v3 + 16), &v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  compressed_seq_dump(*(void *)v3, (uint64_t)&v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  fwrite((const void *)(v3 + 12), 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 8), 4uLL, 1uLL, a2);
  return 1;
}

void chd_ph_destroy(void *a1)
{
  uint64_t v2 = a1[2];
  compressed_seq_destroy(*(void *)v2);
  free(*(void **)v2);
  hash_state_destroy(*(_DWORD **)(v2 + 16));
  free((void *)v2);

  free(a1);
}

unint64_t chd_ph_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 16);
  hash_vector(*(_DWORD **)(v3 + 16), a2, a3, &v9);
  unsigned __int32 v4 = v9.u32[1];
  unsigned int v5 = *(_DWORD *)(v3 + 12);
  unsigned int v6 = v10;
  unsigned int v7 = compressed_seq_query(*(void *)v3, v9.i32[0] % *(_DWORD *)(v3 + 8));
  return (v4 % v5 + v7 % *(_DWORD *)(v3 + 12) * (unint64_t)(v6 % (v5 - 1) + 1) + v7 / *(_DWORD *)(v3 + 12))
       % *(unsigned int *)(v3 + 12);
}

void chd_ph_pack(uint64_t a1, int *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int type = hash_get_type(*(unsigned int **)(v3 + 16));
  *a2++ = type;
  hash_state_pack(*(_DWORD **)(v3 + 16), a2);
  unsigned int v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  *unsigned int v5 = *(_DWORD *)(v3 + 12);
  v5[1] = *(_DWORD *)(v3 + 8);
  uint64_t v6 = *(void *)v3;

  compressed_seq_pack(v6, v5 + 2);
}

uint64_t chd_ph_packed_size(uint64_t a1)
{
  uint64_t v1 = *(_DWORD ***)(a1 + 16);
  int type = hash_get_type(v1[2]);
  int v3 = hash_state_packed_size(type);
  return v3 + compressed_seq_packed_size(*v1) + 16;
}

uint64_t chd_ph_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unsigned int v5 = (unsigned int *)(a1 + 1);
  int v6 = *a1;
  unsigned int v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  unint64_t v8 = (int *)(v7 + 2);
  unint64_t v9 = *v7;
  unsigned int v10 = v7[1];
  hash_vector_packed(v5, v6, a2, a3, &v14);
  LODWORD(a2) = v14.i32[1];
  unsigned int v11 = v15;
  unsigned int packed = compressed_seq_query_packed(v8, v14.i32[0] % v10);
  return ((a2 % v9
                       + packed % v9 * (unint64_t)(v11 % ((int)v9 - 1) + 1)
                       + packed / v9)
                      % v9);
}

uint64_t place_bucket_probe(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, int a7)
{
  unsigned int v7 = (unsigned int *)(a2 + 8 * a6);
  unint64_t v8 = (unsigned int *)(a3 + 8 * *v7);
  if (*(_DWORD *)(a1 + 40) <= 1u)
  {
    if (a7)
    {
      int v9 = 0;
      uint64_t v13 = *(void *)(a1 + 48);
      while (1)
      {
        unint64_t v14 = ((*v8 + (unint64_t)a5 + v8[1] * (unint64_t)a4) % *(unsigned int *)(a1 + 20)) >> 5;
        int v15 = *(_DWORD *)(v13 + 4 * v14);
        int v16 = bitmask32_0[((*v8 + (unint64_t)a5 + v8[1] * (unint64_t)a4) % *(unsigned int *)(a1 + 20)) & 0x1F];
        if ((v16 & v15) != 0) {
          break;
        }
        *(_DWORD *)(v13 + 4 * v14) = v16 | v15;
        ++v9;
        v8 += 2;
        if (a7 == v9) {
          return 1;
        }
      }
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (!a7)
  {
LABEL_12:
    int v9 = 0;
    goto LABEL_13;
  }
  int v9 = 0;
  while (1)
  {
    unint64_t v10 = (*v8 + (unint64_t)a5 + v8[1] * (unint64_t)a4) % *(unsigned int *)(a1 + 20);
    uint64_t v11 = *(void *)(a1 + 48);
    unsigned int v12 = *(unsigned __int8 *)(v11 + v10);
    if (*(_DWORD *)(a1 + 40) <= v12) {
      break;
    }
    *(unsigned char *)(v11 + v10) = v12 + 1;
    ++v9;
    v8 += 2;
    if (a7 == v9) {
      return 1;
    }
  }
LABEL_13:
  if (v9 == a7) {
    return 1;
  }
  uint64_t v18 = (unsigned int *)(a3 + 8 * *v7);
  if (*(_DWORD *)(a1 + 40) <= 1u)
  {
    if (v9)
    {
      uint64_t v22 = *(void *)(a1 + 48);
      do
      {
        uint64_t v23 = *v18;
        unsigned int v24 = v18[1];
        v18 += 2;
        unint64_t v25 = (v23 + a5 + v24 * (unint64_t)a4) % *(unsigned int *)(a1 + 20);
        *(_DWORD *)(v22 + ((v25 >> 3) & 0x1FFFFFFC)) ^= bitmask32_0[v25 & 0x1F];
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    for (; v9; --v9)
    {
      uint64_t v19 = *v18;
      unsigned int v20 = v18[1];
      v18 += 2;
      unint64_t v21 = (v19 + a5 + v20 * (unint64_t)a4) % *(unsigned int *)(a1 + 20);
      --*(unsigned char *)(*(void *)(a1 + 48) + v21);
    }
  }
  return 0;
}

double chm_config_new()
{
  v0 = malloc_type_malloc(0x28uLL, 0x10B004021B77C51uLL);
  if (v0)
  {
    v0[4] = 0;
    double result = 0.0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void chm_config_destroy(uint64_t a1)
{
}

uint64_t chm_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1)
  {
    uint64_t v2 = *(_DWORD **)(result + 32);
    *uint64_t v2 = *a2;
    int v3 = a2[1];
    if (v3 != 1) {
      v2[1] = v3;
    }
  }
  return result;
}

void *chm_new(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 8) + 8);
  if (a2 == 0.0) {
    a2 = 2.09;
  }
  unsigned int v5 = vcvtpd_u64_f64(a2 * (double)v4);
  *(_DWORD *)(v3 + 8) = v4;
  *(_DWORD *)(v3 + 12) = v5;
  *(void *)(v3 + 16) = graph_new(v5, v4);
  int v6 = malloc_type_malloc(0x18uLL, 0x2004093837F09uLL);
  uint64_t v7 = 0;
  *(void *)(v3 + 32) = v6;
  do
  {
    *(void *)(*(void *)(v3 + 32) + v7) = 0;
    v7 += 8;
  }
  while (v7 != 24);
  unint64_t v8 = (FILE **)MEMORY[0x263EF8348];
  if (*(_DWORD *)(a1 + 16)) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Entering mapping step for mph creation of %u keys with graph sized %u\n", *(_DWORD *)(v3 + 8), *(_DWORD *)(v3 + 12));
  }
  int v9 = 20;
  while (1)
  {
    **(void **)(v3 + 32) = hash_state_new(*(_DWORD *)v3, *(_DWORD *)(v3 + 12));
    *(void *)(*(void *)(v3 + 32) + 8) = hash_state_new(*(_DWORD *)(v3 + 4), *(_DWORD *)(v3 + 12));
    uint64_t v10 = *(void *)(a1 + 32);
    graph_clear_edges(*(unsigned int **)(v10 + 16));
    (*(void (**)(void))(*(void *)(a1 + 8) + 32))(**(void **)(a1 + 8));
    uint64_t v11 = *(void *)(a1 + 8);
    if (*(_DWORD *)(v11 + 8))
    {
      unsigned int v12 = 0;
      while (1)
      {
        unsigned int v30 = 0;
        double v29 = 0;
        (*(void (**)(void, unsigned __int8 **, unsigned int *))(v11 + 16))(*(void *)v11, &v29, &v30);
        unsigned int v13 = hash(**(_DWORD ***)(v10 + 32), v29, v30) % *(_DWORD *)(v10 + 12);
        unsigned int v14 = hash(*(_DWORD **)(*(void *)(v10 + 32) + 8), v29, v30);
        unsigned int v15 = *(_DWORD *)(v10 + 12);
        int v16 = v14 % v15;
        int v17 = v14 % v15 + 1 < v15 ? v16 + 1 : 0;
        unsigned int v18 = v13 == v16 ? v17 : v16;
        if (v13 == v18) {
          break;
        }
        (*(void (**)(void, unsigned __int8 *, void))(*(void *)(a1 + 8) + 24))(**(void **)(a1 + 8), v29, v30);
        graph_add_edge(*(void *)(v10 + 16), v13, v18);
        ++v12;
        uint64_t v11 = *(void *)(a1 + 8);
        if (v12 >= *(_DWORD *)(v11 + 8)) {
          goto LABEL_18;
        }
      }
      if (*(_DWORD *)(a1 + 16)) {
        fprintf(*v8, "Self loop for key %u\n", v12);
      }
      (*(void (**)(void, unsigned __int8 *, void))(*(void *)(a1 + 8) + 24))(**(void **)(a1 + 8), v29, v30);
      goto LABEL_26;
    }
LABEL_18:
    int is_cyclic = graph_is_cyclic(*(unsigned int **)(v10 + 16));
    int v20 = *(_DWORD *)(a1 + 16);
    if (!v20 || !is_cyclic) {
      break;
    }
    fwrite("Cyclic graph generated\n", 0x17uLL, 1uLL, *v8);
LABEL_26:
    --v9;
    hash_state_destroy(**(_DWORD ***)(v3 + 32));
    **(void **)(v3 + 32) = 0;
    hash_state_destroy(*(_DWORD **)(*(void *)(v3 + 32) + 8));
    *(void *)(*(void *)(v3 + 32) + 8) = 0;
    if (*(_DWORD *)(a1 + 16)) {
      fprintf(*v8, "Acyclic graph creation failure - %u iterations remaining\n", v9);
    }
    if (!v9)
    {
      graph_destroy(*(void ***)(v3 + 16));
      return 0;
    }
  }
  if (is_cyclic) {
    goto LABEL_26;
  }
  if (v20) {
    fwrite("Starting assignment step\n", 0x19uLL, 1uLL, *v8);
  }
  uint64_t v23 = malloc_type_malloc(((unint64_t)*(unsigned int *)(v3 + 12) >> 3) + 1, 0x97A21AE3uLL);
  bzero(v23, ((unint64_t)*(unsigned int *)(v3 + 12) >> 3) + 1);
  free(*(void **)(v3 + 24));
  unsigned int v24 = malloc_type_malloc(4 * *(unsigned int *)(v3 + 12), 0x100004052888210uLL);
  *(void *)(v3 + 24) = v24;
  if (!v24) {
    chm_new_cold_1();
  }
  unint64_t v25 = *(unsigned int *)(v3 + 12);
  if (v25)
  {
    for (unint64_t i = 0; i < v25; ++i)
    {
      if (!((bitmask_3[i & 7] & *((unsigned char *)v23 + (i >> 3))) >> (i & 7)))
      {
        *(_DWORD *)(*(void *)(v3 + 24) + 4 * i) = 0;
        chm_traverse(v3, (uint64_t)v23, i);
        unint64_t v25 = *(unsigned int *)(v3 + 12);
      }
    }
  }
  graph_destroy(*(void ***)(v3 + 16));
  free(v23);
  *(void *)(v3 + 16) = 0;
  unint64_t v21 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)unint64_t v21 = *(_DWORD *)a1;
  unsigned int v27 = (char *)malloc_type_malloc(0x18uLL, 0x1090040F2DB8820uLL);
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v3 + 24);
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  uint64_t v28 = *(void *)(v3 + 8);
  *(void *)unsigned int v27 = v28;
  v21[2] = v27;
  *((_DWORD *)v21 + 1) = v28;
  if (*(_DWORD *)(a1 + 16)) {
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v8);
  }
  return v21;
}

uint64_t chm_traverse(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v8 = graph_neighbors_it(*(void *)(a1 + 16), a3);
  *(unsigned char *)(a2 + ((unint64_t)a3 >> 3)) |= bitmask_3[a3 & 7];
  uint64_t result = graph_next_neighbor(*(void *)(a1 + 16), &v8);
  if (result != -1)
  {
    uint64_t v7 = result;
    do
    {
      if (!((bitmask_3[v7 & 7] & *(unsigned char *)(a2 + ((unint64_t)v7 >> 3))) >> (v7 & 7)))
      {
        *(_DWORD *)(*(void *)(a1 + 24) + 4 * v7) = graph_edge_id(*(void *)(a1 + 16), a3, v7)
                                                                   - *(_DWORD *)(*(void *)(a1 + 24) + 4 * a3);
        chm_traverse(a1, a2, v7);
      }
      uint64_t result = graph_next_neighbor(*(void *)(a1 + 16), &v8);
      uint64_t v7 = result;
    }
    while (result != -1);
  }
  return result;
}

uint64_t chm_dump(uint64_t a1, FILE *a2)
{
  uint64_t v7 = 0;
  int v5 = 2;
  unsigned int __ptr = 0;
  uint64_t v3 = *(void *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  fwrite(&v5, 4uLL, 1uLL, a2);
  hash_state_dump(**(_DWORD ***)(v3 + 16), &v7, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v7, __ptr, 1uLL, a2);
  free(v7);
  hash_state_dump(*(_DWORD **)(*(void *)(v3 + 16) + 8), &v7, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v7, __ptr, 1uLL, a2);
  free(v7);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 8), 4 * *(unsigned int *)(v3 + 4), 1uLL, a2);
  return 1;
}

size_t chm_load(FILE *a1, uint64_t a2)
{
  unsigned int size_4 = 0;
  unsigned int v4 = malloc_type_malloc(0x18uLL, 0x1090040F2DB8820uLL);
  *(void *)(a2 + 16) = v4;
  fread(&size_4, 4uLL, 1uLL, a1);
  uint64_t v5 = size_4;
  int v6 = malloc_type_malloc(8 * (size_4 + 1), 0x2004093837F09uLL);
  v4[2] = v6;
  v6[v5] = 0;
  if (v5)
  {
    uint64_t v7 = 0;
    unsigned int size = 0;
    uint64_t v8 = 8 * v5;
    do
    {
      fread(&size, 4uLL, 1uLL, a1);
      size_t v9 = size;
      uint64_t v10 = malloc_type_malloc(size, 0xAF90B24AuLL);
      fread(v10, v9, 1uLL, a1);
      *(void *)(v4[2] + v7) = hash_state_load((const char *)v10);
      free(v10);
      v7 += 8;
    }
    while (v8 != v7);
  }
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  uint64_t v11 = malloc_type_malloc(4 * *((unsigned int *)v4 + 1), 0x100004052888210uLL);
  v4[1] = v11;
  size_t v12 = 4 * *((unsigned int *)v4 + 1);

  return fread(v11, v12, 1uLL, a1);
}

uint64_t chm_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  unsigned int v6 = hash(**(_DWORD ***)(v5 + 16), a2, a3) % *(_DWORD *)(v5 + 4);
  unsigned int v7 = hash(*(_DWORD **)(*(void *)(v5 + 16) + 8), a2, a3);
  unsigned int v8 = *(_DWORD *)(v5 + 4);
  int v9 = v7 % v8;
  if (v7 % v8 + 1 < v8) {
    unsigned int v10 = v9 + 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v6 != v9) {
    unsigned int v10 = v9;
  }
  return (*(_DWORD *)(*(void *)(v5 + 8) + 4 * v10) + *(_DWORD *)(*(void *)(v5 + 8) + 4 * v6))
       % *(_DWORD *)v5;
}

void chm_destroy(void *a1)
{
  uint64_t v2 = (void **)a1[2];
  free(v2[1]);
  hash_state_destroy(*(_DWORD **)v2[2]);
  hash_state_destroy(*((_DWORD **)v2[2] + 1));
  free(v2[2]);
  free(v2);

  free(a1);
}

void *chm_pack(uint64_t a1, int *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int type = hash_get_type(**(unsigned int ***)(v3 + 16));
  *a2++ = type;
  hash_state_pack(**(_DWORD ***)(v3 + 16), a2);
  uint64_t v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  int v6 = hash_get_type(*(unsigned int **)(*(void *)(v3 + 16) + 8));
  *v5++ = v6;
  hash_state_pack(*(_DWORD **)(*(void *)(v3 + 16) + 8), v5);
  unsigned int v7 = (int *)((char *)v5 + hash_state_packed_size(v6));
  *unsigned int v7 = *(_DWORD *)(v3 + 4);
  v7[1] = *(_DWORD *)v3;
  unsigned int v8 = *(const void **)(v3 + 8);
  size_t v9 = 4 * *(unsigned int *)(v3 + 4);

  return memcpy(v7 + 2, v8, v9);
}

uint64_t chm_packed_size(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int type = hash_get_type(**(unsigned int ***)(v1 + 16));
  int v3 = hash_get_type(*(unsigned int **)(*(void *)(v1 + 16) + 8));
  int v4 = hash_state_packed_size(type);
  return v4 + hash_state_packed_size(v3) + 4 * *(_DWORD *)(v1 + 4) + 20;
}

uint64_t chm_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5 = (unsigned int *)(a1 + 1);
  int v6 = *a1;
  unsigned int v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  int v8 = *v7++;
  size_t v9 = (unsigned int *)((char *)v7 + hash_state_packed_size(v8));
  unsigned int v10 = *v9;
  unsigned int v11 = v9[1];
  unsigned int v12 = hash_packed(v5, v6, a2, a3) % v10;
  unsigned int v13 = hash_packed(v7, v8, a2, a3);
  unsigned int v14 = v13 % v10;
  if (v13 % v10 + 1 < v10) {
    unsigned int v15 = v14 + 1;
  }
  else {
    unsigned int v15 = 0;
  }
  if (v12 == v14) {
    unsigned int v14 = v15;
  }
  return (v9[v14 + 2] + v9[v12 + 2]) % v11;
}

void *cmph_io_nlfile_adapter(FILE *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = malloc_type_malloc(0x28uLL, 0x1080040F159ABB6uLL);
  if (!v2) {
    cmph_io_nlfile_adapter_cold_1();
  }
  int v3 = v2;
  *uint64_t v2 = a1;
  rewind(a1);
  int v4 = fgets(__s, 1024, a1);
  int v5 = 0;
  if (feof(a1))
  {
LABEL_8:
    rewind(a1);
  }
  else
  {
    while (1)
    {
      int v6 = ferror(a1);
      if (!v4 || v6) {
        break;
      }
      if (__s[strlen(__s) - 1] == 10) {
        ++v5;
      }
      int v4 = fgets(__s, 1024, a1);
      if (feof(a1)) {
        goto LABEL_8;
      }
    }
    perror("Error reading input file");
    int v5 = 0;
  }
  *((_DWORD *)v3 + 2) = v5;
  v3[2] = key_nlfile_read;
  v3[3] = key_nlfile_dispose;
  v3[4] = key_nlfile_rewind;
  return v3;
}

uint64_t key_nlfile_read(FILE *a1, void **a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *a2 = 0;
  *a3 = 0;
  do
  {
    if (!fgets(__s, 1024, a1) || feof(a1)) {
      return 0xFFFFFFFFLL;
    }
    size_t v6 = strlen(__s);
    unsigned int v7 = (char *)malloc_type_realloc(*a2, *a3 + v6 + 1, 0xBFEBC41AuLL);
    *a2 = v7;
    int v8 = &v7[*a3];
    size_t v9 = strlen(__s);
    memcpy(v8, __s, v9);
    size_t v10 = strlen(__s);
    uint64_t result = (*a3 + v10);
    *a3 = result;
  }
  while (__s[v10 - 1] != 10);
  if (result)
  {
    uint64_t v12 = (result - 1);
    if (*((unsigned char *)*a2 + v12) == 10)
    {
      *((unsigned char *)*a2 + v12) = 0;
      uint64_t result = (*a3 - 1);
      *a3 = result;
    }
  }
  return result;
}

void key_nlfile_dispose(int a1, void *a2)
{
}

_DWORD *cmph_io_nlnkfile_adapter(uint64_t a1, int a2)
{
  uint64_t result = malloc_type_malloc(0x28uLL, 0x1080040F159ABB6uLL);
  if (!result) {
    cmph_io_nlnkfile_adapter_cold_1();
  }
  *(void *)uint64_t result = a1;
  result[2] = a2;
  *((void *)result + 2) = key_nlfile_read;
  *((void *)result + 3) = key_nlfile_dispose;
  *((void *)result + 4) = key_nlfile_rewind;
  return result;
}

void *cmph_io_byte_vector_adapter(uint64_t a1, int a2)
{
  uint64_t result = cmph_io_vector_new(a1, a2);
  result[2] = key_byte_vector_read;
  result[3] = key_vector_dispose;
  result[4] = key_vector_rewind;
  return result;
}

_DWORD *cmph_io_vector_new(uint64_t a1, int a2)
{
  int v4 = malloc_type_malloc(0x28uLL, 0x1080040F159ABB6uLL);
  int v5 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
  if (!v4) {
    cmph_io_vector_new_cold_1();
  }
  if (!v5) {
    cmph_io_vector_new_cold_2();
  }
  *(void *)int v5 = a1;
  v5[2] = 0;
  *(void *)int v4 = v5;
  v4[2] = a2;
  return v4;
}

uint64_t key_byte_vector_read(uint64_t *a1, void *a2, unsigned int *a3)
{
  uint64_t v6 = *a1;
  size_t v7 = **(unsigned int **)(*a1 + 8 * *((unsigned int *)a1 + 2));
  *a3 = v7;
  int v8 = malloc_type_malloc(v7, 0x7CFFFF5AuLL);
  *a2 = v8;
  memcpy(v8, (const void *)(*(void *)(v6 + 8 * *((unsigned int *)a1 + 2)) + 4), v7);
  ++*((_DWORD *)a1 + 2);
  return *a3;
}

void key_vector_dispose(int a1, void *a2)
{
}

uint64_t key_vector_rewind(uint64_t result)
{
  *(_DWORD *)(result + 8) = 0;
  return result;
}

void cmph_io_byte_vector_adapter_destroy(void **a1)
{
  free(*a1);

  free(a1);
}

_DWORD *cmph_io_struct_vector_adapter(uint64_t a1, int a2, int a3, int a4, int a5)
{
  size_t v10 = malloc_type_malloc(0x28uLL, 0x1080040F159ABB6uLL);
  unsigned int v11 = malloc_type_malloc(0x18uLL, 0x1080040468F112EuLL);
  if (!v10) {
    cmph_io_struct_vector_adapter_cold_1();
  }
  if (!v11) {
    cmph_io_struct_vector_adapter_cold_2();
  }
  *(void *)unsigned int v11 = a1;
  v11[2] = 0;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = a4;
  *(void *)size_t v10 = v11;
  v10[2] = a5;
  *((void *)v10 + 2) = key_struct_vector_read;
  *((void *)v10 + 3) = key_vector_dispose;
  *((void *)v10 + 4) = key_struct_vector_rewind;
  return v10;
}

uint64_t key_struct_vector_read(uint64_t *a1, void *a2, unsigned int *a3)
{
  uint64_t v6 = *a1;
  size_t v7 = *((unsigned int *)a1 + 5);
  *a3 = v7;
  int v8 = malloc_type_malloc(v7, 0xE391A227uLL);
  *a2 = v8;
  memcpy(v8, (const void *)(v6 + *((unsigned int *)a1 + 4) + (*((_DWORD *)a1 + 3) * *((_DWORD *)a1 + 2))), v7);
  ++*((_DWORD *)a1 + 2);
  return *a3;
}

uint64_t key_struct_vector_rewind(uint64_t result)
{
  *(_DWORD *)(result + 8) = 0;
  return result;
}

void cmph_io_struct_vector_adapter_destroy(void **a1)
{
  free(*a1);

  free(a1);
}

void *cmph_io_vector_adapter(uint64_t a1, int a2)
{
  uint64_t result = cmph_io_vector_new(a1, a2);
  result[2] = key_vector_read;
  result[3] = key_vector_dispose;
  result[4] = key_vector_rewind;
  return result;
}

uint64_t key_vector_read(uint64_t *a1, char **a2, unsigned int *a3)
{
  uint64_t v6 = *a1;
  unsigned int v7 = strlen(*(const char **)(*a1 + 8 * *((unsigned int *)a1 + 2)));
  *a3 = v7;
  int v8 = (char *)malloc_type_malloc(v7 + 1, 0x4CF63ABuLL);
  *a2 = v8;
  strcpy(v8, *(const char **)(v6 + 8 * *((unsigned int *)a1 + 2)));
  ++*((_DWORD *)a1 + 2);
  return *a3;
}

void cmph_io_vector_adapter_destroy(void **a1)
{
  free(*a1);

  free(a1);
}

void *cmph_config_new(uint64_t a1)
{
  uint64_t v1 = __config_new(a1);
  if (!v1) {
    cmph_config_new_cold_1();
  }
  uint64_t v2 = v1;
  *(_DWORD *)uint64_t v1 = 2;
  chm_config_new();
  v2[4] = v3;
  return v2;
}

void cmph_config_set_algo(uint64_t a1, int a2)
{
  if (*(_DWORD *)a1 != a2)
  {
    switch(*(_DWORD *)a1)
    {
      case 0:
        bmz_config_destroy(a1);
        break;
      case 1:
        bmz8_config_destroy(a1);
        break;
      case 2:
        chm_config_destroy(a1);
        break;
      case 3:
        brz_config_destroy(a1);
        break;
      case 4:
        fch_config_destroy(a1);
        break;
      case 5:
        bdz_config_destroy(a1);
        break;
      case 6:
        bdz_ph_config_destroy(a1);
        break;
      case 7:
        chd_ph_config_destroy(a1);
        break;
      case 8:
        chd_config_destroy(a1);
        break;
      default:
        cmph_config_set_algo_cold_1();
    }
    switch(a2)
    {
      case 0:
        bmz_config_new();
        break;
      case 1:
        bmz8_config_new();
        break;
      case 2:
        chm_config_new();
        break;
      case 3:
        int v4 = brz_config_new();
        break;
      case 4:
        fch_config_new();
        break;
      case 5:
        bdz_config_new();
        break;
      case 6:
        bdz_ph_config_new();
        break;
      case 7:
        chd_ph_config_new();
        break;
      case 8:
        int v4 = chd_config_new(a1);
        break;
      default:
        cmph_config_set_algo_cold_2();
    }
    *(void *)(a1 + 32) = v4;
  }
  *(_DWORD *)a1 = a2;
}

char *cmph_config_set_tmp_dir(char *result, char *__s)
{
  if (*(_DWORD *)result == 3) {
    return brz_config_set_tmp_dir(result, __s);
  }
  return result;
}

uint64_t cmph_config_set_mphf_fd(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result == 3) {
    return brz_config_set_mphf_fd(result, a2);
  }
  return result;
}

uint64_t cmph_config_set_b(uint64_t result, int a2)
{
  switch(*(_DWORD *)result)
  {
    case 3:
      uint64_t result = brz_config_set_b(result, a2);
      break;
    case 5:
      uint64_t result = bdz_config_set_b(result, a2);
      break;
    case 7:
      uint64_t result = chd_ph_config_set_b(result, a2);
      break;
    case 8:
      uint64_t result = chd_config_set_b();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t cmph_config_set_keys_per_bin(uint64_t result, int a2)
{
  if (*(_DWORD *)result == 8) {
    return chd_config_set_keys_per_bin();
  }
  if (*(_DWORD *)result == 7) {
    return chd_ph_config_set_keys_per_bin(result, a2);
  }
  return result;
}

uint64_t cmph_config_set_memory_availability(uint64_t result, int a2)
{
  if (*(_DWORD *)result == 3) {
    return brz_config_set_memory_availability(result, a2);
  }
  return result;
}

void cmph_config_destroy(_DWORD *a1)
{
  if (a1)
  {
    switch(*a1)
    {
      case 0:
        bmz_config_destroy((uint64_t)a1);
        break;
      case 1:
        bmz8_config_destroy((uint64_t)a1);
        break;
      case 2:
        chm_config_destroy((uint64_t)a1);
        break;
      case 3:
        brz_config_destroy((uint64_t)a1);
        break;
      case 4:
        fch_config_destroy((uint64_t)a1);
        break;
      case 5:
        bdz_config_destroy((uint64_t)a1);
        break;
      case 6:
        bdz_ph_config_destroy((uint64_t)a1);
        break;
      case 7:
        chd_ph_config_destroy((uint64_t)a1);
        break;
      case 8:
        chd_config_destroy(a1);
        break;
      default:
        cmph_config_destroy_cold_1();
    }
    __config_destroy(a1);
  }
}

uint64_t cmph_config_set_verbosity(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t cmph_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  switch(*(_DWORD *)result)
  {
    case 0:
      uint64_t result = bmz_config_set_hashfuncs(result, a2);
      break;
    case 1:
      uint64_t result = bmz8_config_set_hashfuncs(result, a2);
      break;
    case 2:
      uint64_t result = chm_config_set_hashfuncs(result, a2);
      break;
    case 3:
      uint64_t result = brz_config_set_hashfuncs(result, a2);
      break;
    case 4:
      uint64_t result = fch_config_set_hashfuncs(result, a2);
      break;
    case 5:
      uint64_t result = bdz_config_set_hashfuncs(result, a2);
      break;
    case 6:
      uint64_t result = bdz_ph_config_set_hashfuncs(result, a2);
      break;
    case 7:
      uint64_t result = chd_ph_config_set_hashfuncs(result, a2);
      break;
    case 8:
      uint64_t result = chd_config_set_hashfuncs();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t cmph_config_set_graphsize(uint64_t result, double a2)
{
  *(double *)(result + 24) = a2;
  return result;
}

void *cmph_new(uint64_t a1, double a2, double a3, double a4)
{
  double v5 = *(double *)(a1 + 24);
  switch(*(_DWORD *)a1)
  {
    case 0:
      double v6 = *(double *)(a1 + 24);
      uint64_t result = bmz_new(a1, v6);
      break;
    case 1:
      double v8 = *(double *)(a1 + 24);
      uint64_t result = bmz8_new(a1, v8);
      break;
    case 2:
      double v9 = *(double *)(a1 + 24);
      uint64_t result = chm_new(a1, v9);
      break;
    case 3:
      if (v5 < 2.0) {
        int v10 = 1;
      }
      else {
        int v10 = 4;
      }
      brz_config_set_algo(a1, v10);
      v11.n128_f64[0] = v5;
      uint64_t result = (void *)brz_new(a1, v11);
      break;
    case 4:
      double v12 = *(double *)(a1 + 24);
      uint64_t result = fch_new(a1, v12);
      break;
    case 5:
      double v13 = *(double *)(a1 + 24);
      uint64_t result = bdz_new(a1, v13);
      break;
    case 6:
      double v14 = *(double *)(a1 + 24);
      uint64_t result = bdz_ph_new(a1, v14);
      break;
    case 7:
      double v15 = *(double *)(a1 + 24);
      uint64_t result = chd_ph_new(a1, v15, a3, a4);
      break;
    case 8:
      double v16 = *(double *)(a1 + 24);
      uint64_t result = chd_new(a1, v16);
      break;
    default:
      cmph_new_cold_1();
  }
  return result;
}

uint64_t cmph_dump(_DWORD *a1, FILE *a2)
{
  switch(*a1)
  {
    case 0:
      uint64_t result = bmz_dump((uint64_t)a1, a2);
      break;
    case 1:
      uint64_t result = bmz8_dump((uint64_t)a1, a2);
      break;
    case 2:
      uint64_t result = chm_dump((uint64_t)a1, a2);
      break;
    case 3:
      uint64_t result = brz_dump((uint64_t)a1, a2);
      break;
    case 4:
      uint64_t result = fch_dump((uint64_t)a1, a2);
      break;
    case 5:
      uint64_t result = bdz_dump((uint64_t)a1, a2);
      break;
    case 6:
      uint64_t result = bdz_ph_dump((uint64_t)a1, a2);
      break;
    case 7:
      uint64_t result = chd_ph_dump((uint64_t)a1, a2);
      break;
    case 8:
      uint64_t result = chd_dump((uint64_t)a1, a2);
      break;
    default:
      cmph_dump_cold_1();
  }
  return result;
}

void *cmph_load(FILE *a1)
{
  uint64_t v2 = __cmph_load(a1);
  uint64_t v3 = v2;
  if (v2)
  {
    switch(*(_DWORD *)v2)
    {
      case 0:
        bmz_load(a1, (uint64_t)v2);
        break;
      case 1:
        bmz8_load(a1, (uint64_t)v2);
        break;
      case 2:
        chm_load(a1, (uint64_t)v2);
        break;
      case 3:
        brz_load(a1, (uint64_t)v2);
        break;
      case 4:
        fch_load(a1, (uint64_t)v2);
        break;
      case 5:
        bdz_load(a1, (uint64_t)v2);
        break;
      case 6:
        bdz_ph_load(a1, (uint64_t)v2);
        break;
      case 7:
        chd_ph_load(a1, (uint64_t)v2);
        break;
      case 8:
        chd_load(a1, (uint64_t)v2);
        break;
      default:
        cmph_load_cold_1();
    }
  }
  return v3;
}

unint64_t cmph_search(_DWORD *a1, unsigned __int8 *a2, unsigned int a3)
{
  switch(*a1)
  {
    case 0:
      unint64_t result = bmz_search((uint64_t)a1, a2, a3);
      break;
    case 1:
      unint64_t result = bmz8_search((uint64_t)a1, a2, a3);
      break;
    case 2:
      unint64_t result = chm_search((uint64_t)a1, a2, a3);
      break;
    case 3:
      unint64_t result = brz_search((uint64_t)a1, a2, a3);
      break;
    case 4:
      unint64_t result = fch_search((uint64_t)a1, a2, a3);
      break;
    case 5:
      unint64_t result = bdz_search((uint64_t)a1, a2, a3);
      break;
    case 6:
      unint64_t result = bdz_ph_search((uint64_t)a1, a2, a3);
      break;
    case 7:
      unint64_t result = chd_ph_search((uint64_t)a1, a2, a3);
      break;
    case 8:
      unint64_t result = chd_search((uint64_t)a1, a2, a3);
      break;
    default:
      cmph_search_cold_1();
  }
  return result;
}

uint64_t cmph_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

void cmph_destroy(void *a1)
{
  switch(*(_DWORD *)a1)
  {
    case 0:
      bmz_destroy(a1);
      break;
    case 1:
      bmz8_destroy(a1);
      break;
    case 2:
      chm_destroy(a1);
      break;
    case 3:
      brz_destroy(a1);
      break;
    case 4:
      fch_destroy(a1);
      break;
    case 5:
      bdz_destroy(a1);
      break;
    case 6:
      bdz_ph_destroy(a1);
      break;
    case 7:
      chd_ph_destroy(a1);
      break;
    case 8:
      chd_destroy(a1);
      break;
    default:
      cmph_destroy_cold_1();
  }
}

void cmph_pack(int *a1, int *a2)
{
  int v2 = *a1;
  *a2 = *a1;
  uint64_t v3 = a2 + 1;
  switch(v2)
  {
    case 0:
      bmz_pack((uint64_t)a1, v3);
      break;
    case 1:
      bmz8_pack((uint64_t)a1, v3);
      break;
    case 2:
      chm_pack((uint64_t)a1, v3);
      break;
    case 3:
      brz_pack((uint64_t)a1, v3);
      break;
    case 4:
      fch_pack((uint64_t)a1, v3);
      break;
    case 5:
      bdz_pack((uint64_t)a1, v3);
      break;
    case 6:
      bdz_ph_pack((uint64_t)a1, v3);
      break;
    case 7:
      chd_ph_pack((uint64_t)a1, v3);
      break;
    case 8:
      chd_pack((uint64_t)a1, v3);
      break;
    default:
      cmph_pack_cold_1();
  }
}

uint64_t cmph_packed_size(_DWORD *a1)
{
  switch(*a1)
  {
    case 0:
      uint64_t result = bmz_packed_size((uint64_t)a1);
      break;
    case 1:
      uint64_t result = bmz8_packed_size((uint64_t)a1);
      break;
    case 2:
      uint64_t result = chm_packed_size((uint64_t)a1);
      break;
    case 3:
      uint64_t result = brz_packed_size((uint64_t)a1);
      break;
    case 4:
      uint64_t result = fch_packed_size((uint64_t)a1);
      break;
    case 5:
      uint64_t result = bdz_packed_size((uint64_t)a1);
      break;
    case 6:
      uint64_t result = bdz_ph_packed_size((uint64_t)a1);
      break;
    case 7:
      uint64_t result = chd_ph_packed_size((uint64_t)a1);
      break;
    case 8:
      uint64_t result = chd_packed_size((uint64_t)a1);
      break;
    default:
      cmph_packed_size_cold_1();
  }
  return result;
}

uint64_t cmph_search_packed(_DWORD *a1, unsigned __int8 *a2, unsigned int a3)
{
  switch(*a1)
  {
    case 0:
      uint64_t v3 = a1 + 1;
      uint64_t result = bmz_search_packed(v3, a2, a3);
      break;
    case 1:
      uint64_t result = bmz8_search_packed(a1 + 1, a2, a3);
      break;
    case 2:
      double v5 = a1 + 1;
      uint64_t result = chm_search_packed(v5, a2, a3);
      break;
    case 3:
      double v6 = a1 + 1;
      uint64_t result = brz_search_packed(v6, a2, a3);
      break;
    case 4:
      unsigned int v7 = a1 + 1;
      uint64_t result = fch_search_packed(v7, a2, a3);
      break;
    case 5:
      double v8 = a1 + 1;
      uint64_t result = bdz_search_packed(v8, a2, a3);
      break;
    case 6:
      double v9 = a1 + 1;
      uint64_t result = bdz_ph_search_packed(v9, a2, a3);
      break;
    case 7:
      int v10 = a1 + 1;
      uint64_t result = chd_ph_search_packed(v10, a2, a3);
      break;
    case 8:
      __n128 v11 = a1 + 1;
      uint64_t result = chd_search_packed(v11);
      break;
    default:
      cmph_search_packed_cold_1();
  }
  return result;
}

void *__config_new(uint64_t a1)
{
  uint64_t result = malloc_type_malloc(0x28uLL, 0x10A0040FEEBFC31uLL);
  if (result)
  {
    result[2] = 0;
    result[3] = 0;
    *uint64_t result = 0;
    result[1] = a1;
    result[4] = 0;
  }
  return result;
}

size_t __cmph_dump(unsigned int *a1, FILE *a2)
{
  uint64_t v3 = a1 + 1;
  int v4 = cmph_names[*a1];
  size_t v5 = strlen(v4);
  fwrite(v4, v5 + 1, 1uLL, a2);

  return fwrite(v3, 4uLL, 1uLL, a2);
}

void *__cmph_load(FILE *__stream)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = __ptr;
  do
  {
    if (fread(v2, 1uLL, 1uLL, __stream) != 1) {
      return 0;
    }
  }
  while (*v2++);
  uint64_t v4 = 0;
  int v5 = 9;
  do
  {
    if (!strcmp(__ptr, cmph_names[v4])) {
      int v5 = v4;
    }
    ++v4;
  }
  while (v4 != 9);
  if (v5 == 9) {
    return 0;
  }
  double v6 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)double v6 = v5;
  fread((char *)v6 + 4, 4uLL, 1uLL, __stream);
  v6[2] = 0;
  return v6;
}

void *compressed_rank_init(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  uint64_t result = select_init((void *)(a1 + 16));
  *(void *)(a1 + 40) = 0;
  return result;
}

void compressed_rank_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 40));
  *(void *)(a1 + 40) = 0;

  select_destroy(a1 + 16);
}

void compressed_rank_generate(uint64_t a1, uint64_t a2, unsigned int a3)
{
  *(_DWORD *)(a1 + 4) = a3;
  unsigned int v5 = *(_DWORD *)(a2 + 4 * (a3 - 1));
  *(_DWORD *)a1 = v5;
  unsigned int v6 = v5 / a3;
  if (v5 / a3 < 2)
  {
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    do
    {
      ++v7;
      BOOL v8 = v6 > 3;
      v6 >>= 1;
    }
    while (v8);
  }
  *(_DWORD *)(a1 + 8) = v7;
  uint64_t v9 = malloc_type_calloc(v5 >> v7, 4uLL, 0x100004052888210uLL);
  int v10 = malloc_type_calloc((*(_DWORD *)(a1 + 8) * *(_DWORD *)(a1 + 4) + 31) >> 5, 4uLL, 0x100004052888210uLL);
  *(void *)(a1 + 40) = v10;
  int v11 = *(_DWORD *)(a1 + 8);
  if (*(_DWORD *)(a1 + 4))
  {
    unint64_t v12 = 0;
    unsigned int v13 = ~(-1 << v11);
    do
    {
      unsigned int v14 = *(_DWORD *)(a2 + 4 * v12) & v13;
      unsigned int v15 = *(_DWORD *)(a1 + 8);
      unsigned int v16 = (v15 * v12) >> 5;
      unsigned int v17 = 32 - ((v15 * v12) & 0x1F);
      v10[v16] = v10[v16] & ~(v13 << (v15 * v12)) | (v14 << (v15 * v12));
      if (v17 < v15) {
        v10[v16 + 1] = v10[v16 + 1] & ~(v13 >> v17) | (v14 >> v17);
      }
      ++v12;
      unint64_t v18 = *(unsigned int *)(a1 + 4);
    }
    while (v12 < v18);
    int v11 = *(_DWORD *)(a1 + 8);
  }
  else
  {
    LODWORD(v18) = 0;
  }
  if (*(_DWORD *)a1 >> v11)
  {
    unsigned int v19 = 0;
    unsigned int v20 = 1;
    do
    {
      do
        unsigned int v21 = *(_DWORD *)(a2 + 4 * v19++) >> v11;
      while (v20 > v21);
      v9[v20++ - 1] = --v19;
      int v11 = *(_DWORD *)(a1 + 8);
      unsigned int v22 = *(_DWORD *)a1 >> v11;
    }
    while (v20 <= v22);
    LODWORD(v18) = *(_DWORD *)(a1 + 4);
  }
  else
  {
    unsigned int v22 = 0;
  }
  select_generate(a1 + 16, (uint64_t)v9, v22, v18);

  free(v9);
}

uint64_t compressed_rank_query(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 < a2) {
    return *(unsigned int *)(a1 + 4);
  }
  int v5 = *(_DWORD *)(a1 + 8);
  unsigned int v6 = a2 >> v5;
  if (a2 >> v5)
  {
    unsigned int v7 = select_query(a1 + 16, v6 - 1) + 1;
    uint64_t result = v7 - v6;
  }
  else
  {
    unsigned int v7 = 0;
    uint64_t result = 0;
  }
  uint64_t v8 = *(void *)(a1 + 24);
  if ((bitmask32_1[v7 & 0x1F] & *(_DWORD *)(v8 + 4 * (v7 >> 5))) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    unsigned int v10 = *(_DWORD *)(a1 + 8);
    unsigned int v11 = result * v10;
    unsigned int v12 = v7 + 1;
    do
    {
      unsigned int v13 = 32 - (v11 & 0x1F);
      int v14 = *(_DWORD *)(v9 + 4 * (v11 >> 5)) >> v11;
      if (v13 < v10) {
        v14 |= *(_DWORD *)(v9 + 4 * ((v11 >> 5) + 1)) << v13;
      }
      if ((v14 & ~(-1 << v5)) >= (a2 & ~(-1 << v5))) {
        break;
      }
      uint64_t result = (result + 1);
      int v15 = *(_DWORD *)(v8 + 4 * (v12 >> 5));
      int v16 = bitmask32_1[v12 & 0x1F];
      v11 += v10;
      ++v12;
    }
    while ((v16 & v15) == 0);
  }
  return result;
}

uint64_t compressed_rank_get_space_usage(_DWORD *a1)
{
  return select_get_space_usage(a1 + 4) + ((a1[2] * a1[1] + 31) & 0xFFFFFFE0) + 96;
}

_DWORD *compressed_rank_dump(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = (const void **)(a1 + 16);
  int v7 = select_packed_size((_DWORD *)(a1 + 16));
  size_t v8 = ((*(_DWORD *)(a1 + 8) * *(_DWORD *)(a1 + 4) + 31) >> 3) & 0x1FFFFFFC;
  memset(__n, 0, sizeof(__n));
  size_t v9 = (v7 + v8 + 16);
  *a3 = v9;
  uint64_t result = malloc_type_calloc(v9, 1uLL, 0x100004077774924uLL);
  *(void *)a2 = result;
  if (result)
  {
    *uint64_t result = *(_DWORD *)a1;
    *(_DWORD *)(*(void *)a2 + 4) = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(*(void *)a2 + 8) = *(_DWORD *)(a1 + 8);
    select_dump(v6, (uint64_t)&__n[1], __n);
    size_t v11 = __n[0];
    *(_DWORD *)(*(void *)a2 + 12) = __n[0];
    unsigned int v12 = *(void **)&__n[1];
    memcpy((void *)(*(void *)a2 + 16), *(const void **)&__n[1], v11);
    free(v12);
    return memcpy((void *)(*(void *)a2 + (v11 + 16)), *(const void **)(a1 + 40), v8);
  }
  else
  {
    *a3 = -1;
  }
  return result;
}

void *compressed_rank_load(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)a1 = *a2;
  *(_DWORD *)(a1 + 4) = a2[1];
  *(_DWORD *)(a1 + 8) = a2[2];
  int v4 = a2[3];
  select_load(a1 + 16, a2 + 4);
  int v5 = *(void **)(a1 + 40);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = (v4 + 16);
  unsigned int v7 = (*(_DWORD *)(a1 + 8) * *(_DWORD *)(a1 + 4) + 31) >> 5;
  size_t v8 = malloc_type_calloc(v7, 4uLL, 0x100004052888210uLL);
  *(void *)(a1 + 40) = v8;

  return memcpy(v8, (char *)a2 + v6, 4 * v7);
}

void compressed_rank_pack(uint64_t a1, void *a2)
{
  if (a1)
  {
    if (a2)
    {
      memset(__n, 0, sizeof(__n));
      compressed_rank_dump(a1, (uint64_t)&__n[1], __n);
      uint64_t v3 = *(void **)&__n[1];
      memcpy(a2, *(const void **)&__n[1], __n[0]);
      free(v3);
    }
  }
}

uint64_t compressed_rank_packed_size(_DWORD *a1)
{
  return select_packed_size(a1 + 4) + 4 * ((a1[2] * a1[1] + 31) >> 5) + 16;
}

uint64_t compressed_rank_query_packed(unsigned int *a1, unsigned int a2)
{
  if (*a1 < a2) {
    return a1[1];
  }
  int v4 = a1 + 4;
  unsigned int v5 = a1[2];
  unsigned int v6 = a1[3];
  unsigned int v7 = a1 + 6;
  unsigned int v8 = a2 >> v5;
  if (a2 >> v5)
  {
    unsigned int v9 = select_query_packed(a1 + 4, v8 - 1) + 1;
    uint64_t result = v9 - v8;
  }
  else
  {
    unsigned int v9 = 0;
    uint64_t result = 0;
  }
  if ((bitmask32_1[v9 & 0x1F] & v7[v9 >> 5]) == 0)
  {
    unsigned int v10 = (char *)v4 + (v6 & 0xFFFFFFFC);
    unsigned int v11 = result * v5;
    unsigned int v12 = v9 + 1;
    do
    {
      unsigned int v13 = 32 - (v11 & 0x1F);
      int v14 = *(_DWORD *)&v10[4 * (v11 >> 5)] >> v11;
      if (v13 < v5) {
        v14 |= *(_DWORD *)&v10[4 * (v11 >> 5) + 4] << v13;
      }
      if ((v14 & ~(-1 << v5)) >= (a2 & ~(-1 << v5))) {
        break;
      }
      uint64_t result = (result + 1);
      int v15 = v7[v12 >> 5];
      int v16 = bitmask32_1[v12 & 0x1F];
      v11 += v5;
      ++v12;
    }
    while ((v16 & v15) == 0);
  }
  return result;
}

void *compressed_seq_init(uint64_t a1)
{
  uint64_t result = select_init((void *)(a1 + 16));
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  return result;
}

void compressed_seq_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 48));
  *(void *)(a1 + 48) = 0;
  free(*(void **)(a1 + 40));
  *(void *)(a1 + 40) = 0;

  select_destroy(a1 + 16);
}

void compressed_seq_generate(unsigned int *a1, uint64_t a2, size_t count)
{
  unsigned int v3 = count;
  unsigned int v6 = malloc_type_calloc(count, 4uLL, 0x100004052888210uLL);
  unsigned int v7 = v6;
  *a1 = v3;
  a1[2] = 0;
  if (v3)
  {
    unint64_t v8 = 0;
    do
    {
      int v9 = *(_DWORD *)(a2 + 4 * v8);
      if (v9)
      {
        unsigned int v10 = v9 + 1;
        if ((v9 + 1) < 2)
        {
          int v11 = 0;
        }
        else
        {
          int v11 = 0;
          do
          {
            ++v11;
            BOOL v12 = v10 > 3;
            v10 >>= 1;
          }
          while (v12);
        }
        v6[v8] = v11;
        a1[2] += v11;
      }
      else
      {
        v6[v8] = 0;
      }
      ++v8;
    }
    while (v8 < *a1);
  }
  unsigned int v13 = (void *)*((void *)a1 + 6);
  if (v13) {
    free(v13);
  }
  int v14 = malloc_type_calloc((a1[2] + 31) >> 5, 4uLL, 0x100004052888210uLL);
  *((void *)a1 + 6) = v14;
  a1[2] = 0;
  unsigned int v15 = *a1;
  if (*a1)
  {
    unsigned int v16 = 0;
    unint64_t v17 = 0;
    do
    {
      int v18 = *(_DWORD *)(a2 + 4 * v17);
      if (v18)
      {
        unsigned int v19 = v7[v17];
        unsigned int v20 = v18 + (-1 << v19) + 1;
        unsigned int v21 = 32 - (v16 & 0x1F);
        unsigned int v22 = ~(-1 << v19);
        v14[v16 >> 5] = v14[v16 >> 5] & ~(v22 << v16) | (v20 << v16);
        if (v21 < v19) {
          v14[(v16 >> 5) + 1] = v14[(v16 >> 5) + 1] & ~(v22 >> v21) | (v20 >> v21);
        }
        unsigned int v16 = a1[2] + v7[v17];
        a1[2] = v16;
        unsigned int v15 = *a1;
      }
      ++v17;
    }
    while (v17 < v15);
  }
  else
  {
    unsigned int v16 = 0;
  }
  unsigned int v23 = v16 / v15;
  if (v16 / v15 < 2)
  {
    int v24 = 1;
  }
  else
  {
    int v24 = 0;
    do
    {
      ++v24;
      BOOL v12 = v23 > 3;
      v23 >>= 1;
    }
    while (v12);
  }
  a1[1] = v24;
  unint64_t v25 = (void *)*((void *)a1 + 5);
  if (v25)
  {
    free(v25);
    unsigned int v15 = *a1;
    int v24 = a1[1];
  }
  int v26 = malloc_type_calloc((v24 * v15 + 31) >> 5, 4uLL, 0x100004052888210uLL);
  *((void *)a1 + 5) = v26;
  a1[2] = 0;
  if (*a1)
  {
    unint64_t v27 = 0;
    unsigned int v28 = ~(-1 << a1[1]);
    do
    {
      unsigned int v29 = a1[1];
      int v30 = a1[2] + v7[v27];
      a1[2] = v30;
      unsigned int v31 = v30 & v28;
      unsigned int v32 = (v29 * v27) >> 5;
      unsigned int v33 = 32 - ((v29 * v27) & 0x1F);
      v26[v32] = v26[v32] & ~(v28 << (v29 * v27)) | (v31 << (v29 * v27));
      if (v33 < v29) {
        v26[v32 + 1] = v26[v32 + 1] & ~(v28 >> v33) | (v31 >> v33);
      }
      v7[v27++] = a1[2] >> a1[1];
    }
    while (v27 < *a1);
  }
  select_init((void *)a1 + 2);
  select_generate((uint64_t)(a1 + 4), (uint64_t)v7, *a1, a1[2] >> a1[1]);

  free(v7);
}

uint64_t compressed_seq_get_space_usage(_DWORD *a1)
{
  return select_get_space_usage(a1 + 4)
       + ((a1[2] + 31) & 0xFFFFFFE0)
       + ((a1[1] * *a1 + 31) & 0xFFFFFFE0)
       + 128;
}

uint64_t compressed_seq_query(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    compressed_seq_query_cold_1();
  }
  int v4 = ~(-1 << *(_DWORD *)(a1 + 4));
  uint64_t v5 = a1 + 16;
  if (a2)
  {
    unsigned int v6 = a2 - 1;
    unsigned int v7 = select_query(a1 + 16, a2 - 1);
    unsigned int v8 = *(_DWORD *)(a1 + 4);
    uint64_t v9 = *(void *)(a1 + 40);
    unsigned int v10 = (v8 * v6) >> 5;
    unsigned int v11 = 32 - ((v8 * v6) & 0x1F);
    int v12 = *(_DWORD *)(v9 + 4 * v10) >> (v8 * v6);
    if (v11 < v8) {
      v12 |= *(_DWORD *)(v9 + 4 * (v10 + 1)) << v11;
    }
    unsigned int v13 = (v12 & v4) + ((v7 - v6) << v8);
    int query = select_next_query(v5, v7);
  }
  else
  {
    int query = select_query(a1 + 16, 0);
    unsigned int v13 = 0;
  }
  unsigned int v15 = *(_DWORD *)(a1 + 4);
  uint64_t v16 = *(void *)(a1 + 40);
  unsigned int v17 = (v15 * a2) >> 5;
  unsigned int v18 = 32 - ((v15 * a2) & 0x1F);
  int v19 = *(_DWORD *)(v16 + 4 * v17) >> (v15 * a2);
  if (v18 < v15) {
    v19 |= *(_DWORD *)(v16 + 4 * (v17 + 1)) << v18;
  }
  unsigned int v20 = (v19 & v4) + ((query - a2) << v15) - v13;
  if (!v20) {
    return 0;
  }
  uint64_t v22 = *(void *)(a1 + 48);
  unsigned int v23 = 32 - (v13 & 0x1F);
  int v24 = *(_DWORD *)(v22 + 4 * (v13 >> 5)) >> v13;
  if (v23 < v20) {
    v24 |= *(_DWORD *)(v22 + 4 * ((v13 >> 5) + 1)) << v23;
  }
  return (v24 & ~(-1 << v20)) + ~(-1 << v20);
}

_DWORD *compressed_seq_dump(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = (const void **)(a1 + 16);
  int v7 = select_packed_size((_DWORD *)(a1 + 16));
  size_t v8 = ((*(_DWORD *)(a1 + 4) * *(_DWORD *)a1 + 31) >> 3) & 0x1FFFFFFC;
  size_t v9 = ((*(_DWORD *)(a1 + 8) + 31) >> 3) & 0x1FFFFFFC;
  memset(__n, 0, sizeof(__n));
  size_t v10 = (v7 + v9 + v8 + 16);
  *a3 = v10;
  uint64_t result = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
  *(void *)a2 = result;
  if (result)
  {
    *uint64_t result = *(_DWORD *)a1;
    *(_DWORD *)(*(void *)a2 + 4) = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(*(void *)a2 + 8) = *(_DWORD *)(a1 + 8);
    select_dump(v6, (uint64_t)&__n[1], __n);
    size_t v12 = __n[0];
    *(_DWORD *)(*(void *)a2 + 12) = __n[0];
    unsigned int v13 = *(void **)&__n[1];
    memcpy((void *)(*(void *)a2 + 16), *(const void **)&__n[1], v12);
    uint64_t v14 = (v12 + 16);
    free(v13);
    memcpy((void *)(*(void *)a2 + v14), *(const void **)(a1 + 40), v8);
    return memcpy((void *)(*(void *)a2 + (v14 + v8)), *(const void **)(a1 + 48), v9);
  }
  else
  {
    *a3 = -1;
  }
  return result;
}

void *compressed_seq_load(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)a1 = *a2;
  *(_DWORD *)(a1 + 4) = a2[1];
  *(_DWORD *)(a1 + 8) = a2[2];
  int v4 = a2[3];
  select_load(a1 + 16, a2 + 4);
  unsigned int v5 = v4 + 16;
  unsigned int v6 = *(void **)(a1 + 40);
  if (v6) {
    free(v6);
  }
  unsigned int v7 = (*(_DWORD *)(a1 + 4) * *(_DWORD *)a1 + 31) >> 5;
  size_t v8 = malloc_type_calloc(v7, 4uLL, 0x100004052888210uLL);
  *(void *)(a1 + 40) = v8;
  size_t v9 = 4 * v7;
  memcpy(v8, (char *)a2 + v5, v9);
  int v10 = *(_DWORD *)(a1 + 8);
  unsigned int v11 = *(void **)(a1 + 48);
  if (v11) {
    free(v11);
  }
  size_t v12 = (v10 + 31) >> 5;
  unsigned int v13 = malloc_type_calloc(v12, 4uLL, 0x100004052888210uLL);
  *(void *)(a1 + 48) = v13;

  return memcpy(v13, (char *)a2 + v9 + v5, (4 * v12));
}

void compressed_seq_pack(uint64_t a1, void *a2)
{
  if (a1)
  {
    if (a2)
    {
      memset(__n, 0, sizeof(__n));
      compressed_seq_dump(a1, (uint64_t)&__n[1], __n);
      unsigned int v3 = *(void **)&__n[1];
      memcpy(a2, *(const void **)&__n[1], __n[0]);
      free(v3);
    }
  }
}

uint64_t compressed_seq_packed_size(_DWORD *a1)
{
  return select_packed_size(a1 + 4)
       + 4 * ((a1[2] + 31) >> 5)
       + 4 * ((a1[1] * *a1 + 31) >> 5)
       + 16;
}

uint64_t compressed_seq_query_packed(int *a1, int a2)
{
  int v3 = *a1;
  unsigned int v4 = a1[1];
  uint64_t v5 = (uint64_t)(a1 + 4);
  uint64_t v6 = (uint64_t)a1 + (a1[3] & 0xFFFFFFFC) + 16;
  int v7 = ~(-1 << v4);
  if (a2)
  {
    int v8 = a2 - 1;
    unsigned int packed = select_query_packed(a1 + 4, a2 - 1);
    unsigned int v10 = (v4 * v8) >> 5;
    unsigned int v11 = 32 - ((v4 * v8) & 0x1F);
    int v12 = *(_DWORD *)(v6 + 4 * v10) >> (v4 * v8);
    if (v11 < v4) {
      v12 |= *(_DWORD *)(v6 + 4 * (v10 + 1)) << v11;
    }
    unsigned int v13 = (v12 & v7) + ((packed - v8) << v4);
    query_unsigned int packed = select_next_query_packed(v5, packed);
  }
  else
  {
    query_unsigned int packed = select_query_packed(a1 + 4, 0);
    unsigned int v13 = 0;
  }
  unsigned int v15 = (v4 * a2) >> 5;
  unsigned int v16 = 32 - ((v4 * a2) & 0x1F);
  int v17 = *(_DWORD *)(v6 + 4 * v15) >> (v4 * a2);
  if (v16 < v4) {
    v17 |= *(_DWORD *)(v6 + 4 * (v15 + 1)) << v16;
  }
  unsigned int v18 = (v17 & v7) + ((query_packed - a2) << v4) - v13;
  if (!v18) {
    return 0;
  }
  uint64_t v20 = v6 + 4 * ((v4 * v3 + 31) >> 5);
  unsigned int v21 = 32 - (v13 & 0x1F);
  int v22 = *(_DWORD *)(v20 + 4 * (v13 >> 5)) >> v13;
  if (v21 < v18) {
    v22 |= *(_DWORD *)(v20 + 4 * ((v13 >> 5) + 1)) << v21;
  }
  return (v22 & ~(-1 << v18)) + ~(-1 << v18);
}

double fch_config_new()
{
  v0 = malloc_type_malloc(0x48uLL, 0x1030040D598EF6FuLL);
  if (v0)
  {
    v0[8] = 0;
    double result = 0.0;
    *((_OWORD *)v0 + 2) = 0u;
    *((_OWORD *)v0 + 3) = 0u;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void fch_config_destroy(uint64_t a1)
{
}

uint64_t fch_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1)
  {
    int v2 = *(_DWORD **)(result + 32);
    *int v2 = *a2;
    int v3 = a2[1];
    if (v3 != 1) {
      v2[1] = v3;
    }
  }
  return result;
}

uint64_t mixh10h11h12(unsigned int a1, unsigned int a2, double a3, double a4)
{
  unsigned int v4 = a4;
  if ((double)a2 < a3) {
    return a2 % v4;
  }
  uint64_t result = a2 % a1;
  if ((double)result < a4) {
    return result + v4;
  }
  return result;
}

unsigned int fch_calc_b(unsigned int a1, double a2)
{
  return vcvtpd_u64_f64((double)a1 * a2 / (log((double)a1) / 0.693147181 + 1.0));
}

double fch_calc_p1(unsigned int a1)
{
  return ceil((double)a1 * 0.55);
}

double fch_calc_p2(unsigned int a1)
{
  return ceil((double)a1 * 0.3);
}

void *fch_new(uint64_t a1, double a2)
{
  uint64_t v2 = a1;
  int v3 = 0;
  indexes_sorted_by_int size = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  *(_DWORD *)(v5 + 8) = *(_DWORD *)(*(void *)(a1 + 8) + 8);
  if (a2 <= 2.0) {
    a2 = 2.6;
  }
  *(double *)(v5 + 16) = a2;
  *(void *)(v5 + 56) = 0;
  *(void *)(v5 + 64) = 0;
  *(void *)(v5 + 48) = 0;
  int v6 = 100;
  do
  {
    if (*(_DWORD *)(v2 + 16)) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "Entering mapping step for mph creation of %u keys\n", *(_DWORD *)(v5 + 8));
    }
    if (v3) {
      fch_buckets_destroy((uint64_t)v3);
    }
    uint64_t v7 = *(void *)(v2 + 32);
    int v8 = *(_DWORD **)(v7 + 56);
    if (v8) {
      hash_state_destroy(v8);
    }
    *(void *)(v7 + 56) = hash_state_new(*(_DWORD *)v7, *(_DWORD *)(v7 + 8));
    LODWORD(v9) = *(_DWORD *)(v7 + 8);
    double v76 = (double)v9;
    unsigned int v10 = vcvtpd_u64_f64(*(double *)(v7 + 16) * (double)v9 / (log((double)v9) / 0.693147181 + 1.0));
    *(_DWORD *)(v7 + 24) = v10;
    v11.f64[0] = v76;
    v11.f64[1] = (double)v10;
    *(float64x2_t *)(v7 + 32) = vrndpq_f64(vmulq_f64(v11, (float64x2_t)xmmword_212A04590));
    int v3 = fch_buckets_new(v10);
    (*(void (**)(void))(*(void *)(v2 + 8) + 32))(**(void **)(v2 + 8));
    if (*(_DWORD *)(v7 + 8))
    {
      unsigned int v12 = 0;
      do
      {
        v79[0] = 0;
        unsigned int v78 = 0;
        (*(void (**)(void, unsigned __int8 **, unsigned int *))(*(void *)(v2 + 8) + 16))(**(void **)(v2 + 8), &v78, v79);
        unsigned int v13 = hash(*(_DWORD **)(v7 + 56), v78, v79[0]) % *(_DWORD *)(v7 + 8);
        double v14 = *(double *)(v7 + 40);
        unsigned int v15 = v14;
        if (*(double *)(v7 + 32) <= (double)v13)
        {
          unsigned int v16 = v13 % *(_DWORD *)(v7 + 24);
          if (v14 > (double)v16) {
            v16 += v15;
          }
        }
        else
        {
          unsigned int v16 = v13 % v15;
        }
        fch_buckets_insert(v3, v16, (uint64_t)v78, v79[0]);
        ++v12;
      }
      while (v12 < *(_DWORD *)(v7 + 8));
    }
    if (*(_DWORD *)(v2 + 16)) {
      fwrite("Starting ordering step\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    if (indexes_sorted_by_size) {
      free(indexes_sorted_by_size);
    }
    int v68 = v6;
    indexes_sorted_by_int size = fch_buckets_get_indexes_sorted_by_size(v3);
    if (*(_DWORD *)(v2 + 16)) {
      fwrite("Starting searching step.\n", 0x19uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    int v17 = (int *)malloc_type_calloc(*(unsigned int *)(v5 + 8), 4uLL, 0x100004052888210uLL);
    unsigned int v18 = malloc_type_calloc(*(unsigned int *)(v5 + 8), 4uLL, 0x100004052888210uLL);
    int nbuckets = fch_buckets_get_nbuckets((uint64_t)v3);
    int v19 = *(void **)(v5 + 48);
    if (v19) {
      free(v19);
    }
    *(void *)(v5 + 48) = malloc_type_calloc(*(unsigned int *)(v5 + 24), 4uLL, 0x100004052888210uLL);
    uint64_t v75 = v18;
    if (*(_DWORD *)(v5 + 8))
    {
      unint64_t v20 = 0;
      do
      {
        v17[v20] = v20;
        ++v20;
        unint64_t v21 = *(unsigned int *)(v5 + 8);
      }
      while (v20 < v21);
      if (v21)
      {
        int v22 = v17;
        uint64_t v23 = *(unsigned int *)(v5 + 8);
        do
        {
          unsigned int v24 = rand();
          int v25 = *v22;
          *v22++ = v17[v24 % v21];
          v17[v24 % v21] = v25;
          --v23;
        }
        while (v23);
        if (*(_DWORD *)(v5 + 8))
        {
          unint64_t v26 = 0;
          do
          {
            v75[v17[v26]] = v26;
            ++v26;
          }
          while (v26 < *(unsigned int *)(v5 + 8));
        }
      }
    }
    unsigned int v27 = 0;
    unsigned int v70 = 0;
    unsigned int v77 = (uint64_t *)v3;
    while (1)
    {
      unsigned int v71 = v27;
      unsigned int v28 = *(_DWORD **)(v5 + 64);
      if (v28) {
        hash_state_destroy(v28);
      }
      *(void *)(v5 + 64) = hash_state_new(*(_DWORD *)(v5 + 4), *(_DWORD *)(v5 + 8));
      unsigned int v29 = malloc_type_calloc(*(unsigned int *)(v5 + 8), 1uLL, 0x100004077774924uLL);
      unsigned int v30 = fch_buckets_get_nbuckets((uint64_t)v3);
      if (v30)
      {
        uint64_t v31 = 0;
        uint64_t v73 = v30;
        while (1)
        {
          int size = fch_buckets_get_size((uint64_t)v77, indexes_sorted_by_size[v31]);
          bzero(v29, *(unsigned int *)(v5 + 8));
          if (size) {
            break;
          }
LABEL_43:
          if (++v31 == v73) {
            goto LABEL_44;
          }
        }
        unsigned int v33 = 0;
        while (1)
        {
          key = (unsigned __int8 *)fch_buckets_get_key(v77, indexes_sorted_by_size[v31], v33);
          unsigned int keylength = fch_buckets_get_keylength(v77, indexes_sorted_by_size[v31], v33);
          uint64_t v36 = hash(*(_DWORD **)(v5 + 64), key, keylength) % *(_DWORD *)(v5 + 8);
          if (*((unsigned char *)v29 + v36)) {
            break;
          }
          *((unsigned char *)v29 + v36) = 1;
          if (size == ++v33) {
            goto LABEL_43;
          }
        }
        free(v29);
        unsigned int v27 = v71 + 1;
        int v39 = v75;
        int v3 = (unsigned int *)v77;
        goto LABEL_61;
      }
LABEL_44:
      free(v29);
      if (!nbuckets) {
        break;
      }
      uint64_t v37 = 0;
      int v38 = 0;
      ++v70;
      int v39 = v75;
      int v3 = (unsigned int *)v77;
      while (2)
      {
        unsigned int v40 = fch_buckets_get_size((uint64_t)v3, indexes_sorted_by_size[v37]);
        if (!v40) {
          goto LABEL_65;
        }
        if (*(_DWORD *)(v5 + 8) != v38)
        {
          unsigned int v41 = v40;
          int v42 = 0;
          LODWORD(v43) = indexes_sorted_by_size[v37];
          unsigned int v74 = v40 - 1;
LABEL_49:
          unsigned int v44 = (unsigned __int8 *)fch_buckets_get_key((uint64_t *)v3, v43, 0);
          unsigned int v45 = fch_buckets_get_keylength((uint64_t *)v3, indexes_sorted_by_size[v37], 0);
          unsigned int v46 = hash(*(_DWORD **)(v5 + 64), v44, v45);
          unsigned int v47 = 0;
          int v72 = v42;
          unsigned int v48 = (*(_DWORD *)(v5 + 8) + v17[v42 + v38] + v46 / *(_DWORD *)(v5 + 8) * *(_DWORD *)(v5 + 8) - v46)
              % *(_DWORD *)(v5 + 8);
          uint64_t v49 = v5;
          *(_DWORD *)(*(void *)(v5 + 48) + 4 * indexes_sorted_by_size[v37]) = v48;
          do
          {
            int v50 = v38 + v47;
            uint64_t v51 = fch_buckets_get_key((uint64_t *)v3, indexes_sorted_by_size[v37], v47);
            unsigned int v52 = fch_buckets_get_keylength((uint64_t *)v3, indexes_sorted_by_size[v37], v47);
            unsigned int v53 = (unsigned __int8 *)v51;
            int v39 = v75;
            unsigned int v54 = hash(*(_DWORD **)(v49 + 64), v53, v52);
            unsigned int v55 = *(_DWORD *)(v49 + 8);
            uint64_t v43 = indexes_sorted_by_size[v37];
            uint64_t v56 = v75[(*(_DWORD *)(*(void *)(v49 + 48) + 4 * v43) + v54 % v55) % v55];
            if (v56 < v38 + v47)
            {
              uint64_t v5 = v49;
              int v42 = v72 + 1;
              int v3 = (unsigned int *)v77;
              if (v72 + 1 < v55 - v38) {
                goto LABEL_49;
              }
              unsigned int v27 = 0;
              goto LABEL_61;
            }
            int v57 = v17[v56];
            v17[v56] = v17[v50];
            v17[v50] = v57;
            v75[v17[v56]] = v56;
            v75[v17[v50]] = v50;
            unsigned int v58 = v47 + 1;
            if (v74 == v47) {
              unsigned int v59 = 0;
            }
            else {
              unsigned int v59 = v47 + 1;
            }
            ++v47;
            int v3 = (unsigned int *)v77;
          }
          while (v59 % v41);
          ++v37;
          v38 += v58;
          uint64_t v5 = v49;
          if (v37 != nbuckets) {
            continue;
          }
LABEL_65:
          int v60 = 0;
          goto LABEL_66;
        }
        break;
      }
      unsigned int v27 = 0;
LABEL_61:
      int v60 = 1;
      if (v70 > 9 || v27 >= 0x3E8) {
        goto LABEL_66;
      }
    }
    int v60 = 0;
    int v39 = v75;
    int v3 = (unsigned int *)v77;
LABEL_66:
    free(v39);
    free(v17);
    int v6 = v68 - 1;
    uint64_t v2 = a1;
  }
  while (v60 && v68 != 1);
  if (v3) {
    fch_buckets_destroy((uint64_t)v3);
  }
  if (indexes_sorted_by_size) {
    free(indexes_sorted_by_size);
  }
  if (v68 == 1) {
    return 0;
  }
  unint64_t v61 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)unint64_t v61 = *(_DWORD *)a1;
  uint64_t v62 = (char *)malloc_type_malloc(0x40uLL, 0x1030040C682B652uLL);
  long long v64 = *(_OWORD *)(v5 + 32);
  long long v63 = *(_OWORD *)(v5 + 48);
  *(void *)(v5 + 48) = 0;
  *(_OWORD *)(v62 + 40) = v63;
  *((void *)v62 + 7) = *(void *)(v5 + 64);
  *(void *)(v5 + 56) = 0;
  *(void *)(v5 + 64) = 0;
  *(_OWORD *)(v62 + 24) = v64;
  *((_DWORD *)v62 + 4) = *(_DWORD *)(v5 + 24);
  *((void *)v62 + 1) = *(void *)(v5 + 16);
  int v65 = *(_DWORD *)(v5 + 8);
  *(_DWORD *)uint64_t v62 = v65;
  v61[2] = v62;
  *((_DWORD *)v61 + 1) = v65;
  if (*(_DWORD *)(a1 + 16)) {
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  return v61;
}

uint64_t fch_dump(uint64_t a1, FILE *a2)
{
  int v6 = 0;
  unsigned int __ptr = 0;
  uint64_t v3 = *(void *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  hash_state_dump(*(_DWORD **)(v3 + 48), &v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  hash_state_dump(*(_DWORD **)(v3 + 56), &v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 8), 8uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 16), 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 24), 8uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 32), 8uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 40), 4 * *(unsigned int *)(v3 + 16), 1uLL, a2);
  return 1;
}

size_t fch_load(FILE *a1, uint64_t a2)
{
  unsigned int __ptr = 0;
  unsigned int v4 = malloc_type_malloc(0x40uLL, 0x1030040C682B652uLL);
  *(void *)(a2 + 16) = v4;
  v4[6] = 0;
  fread(&__ptr, 4uLL, 1uLL, a1);
  size_t v5 = __ptr;
  int v6 = malloc_type_malloc(__ptr, 0xEFEF8821uLL);
  fread(v6, v5, 1uLL, a1);
  v4[6] = hash_state_load((const char *)v6);
  free(v6);
  *(void *)(a2 + 16) = v4;
  v4[7] = 0;
  fread(&__ptr, 4uLL, 1uLL, a1);
  size_t v7 = __ptr;
  int v8 = malloc_type_malloc(__ptr, 0x2D20F13BuLL);
  fread(v8, v7, 1uLL, a1);
  v4[7] = hash_state_load((const char *)v8);
  free(v8);
  fread(v4, 4uLL, 1uLL, a1);
  fread(v4 + 1, 8uLL, 1uLL, a1);
  fread(v4 + 2, 4uLL, 1uLL, a1);
  fread(v4 + 3, 8uLL, 1uLL, a1);
  fread(v4 + 4, 8uLL, 1uLL, a1);
  unint64_t v9 = malloc_type_malloc(4 * *((unsigned int *)v4 + 4), 0x100004052888210uLL);
  v4[5] = v9;
  size_t v10 = 4 * *((unsigned int *)v4 + 4);

  return fread(v9, v10, 1uLL, a1);
}

uint64_t fch_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  unsigned int v6 = hash(*(_DWORD **)(v5 + 48), a2, a3) % *(_DWORD *)v5;
  unsigned int v7 = hash(*(_DWORD **)(v5 + 56), a2, a3);
  double v8 = *(double *)(v5 + 32);
  unsigned int v9 = v8;
  if (*(double *)(v5 + 24) <= (double)v6)
  {
    unsigned int v10 = v6 % *(_DWORD *)(v5 + 16);
    if (v8 > (double)v10) {
      v10 += v9;
    }
  }
  else
  {
    unsigned int v10 = v6 % v9;
  }
  return (*(_DWORD *)(*(void *)(v5 + 40) + 4 * v10) + v7 % *(_DWORD *)v5) % *(_DWORD *)v5;
}

void fch_destroy(void *a1)
{
  uint64_t v2 = a1[2];
  free(*(void **)(v2 + 40));
  hash_state_destroy(*(_DWORD **)(v2 + 48));
  hash_state_destroy(*(_DWORD **)(v2 + 56));
  free((void *)v2);

  free(a1);
}

void *fch_pack(uint64_t a1, int *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int type = hash_get_type(*(unsigned int **)(v3 + 48));
  *a2++ = type;
  hash_state_pack(*(_DWORD **)(v3 + 48), a2);
  uint64_t v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  int v6 = hash_get_type(*(unsigned int **)(v3 + 56));
  *v5++ = v6;
  hash_state_pack(*(_DWORD **)(v3 + 56), v5);
  unsigned int v7 = (char *)v5 + hash_state_packed_size(v6);
  *(_DWORD *)unsigned int v7 = *(_DWORD *)v3;
  *((_DWORD *)v7 + 1) = *(_DWORD *)(v3 + 16);
  *(uint64x2_t *)(v7 + 8) = vcvtq_u64_f64(*(float64x2_t *)(v3 + 24));
  double v8 = *(const void **)(v3 + 40);
  size_t v9 = 4 * *(unsigned int *)(v3 + 16);

  return memcpy(v7 + 24, v8, v9);
}

uint64_t fch_packed_size(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int type = hash_get_type(*(unsigned int **)(v1 + 48));
  int v3 = hash_get_type(*(unsigned int **)(v1 + 56));
  int v4 = hash_state_packed_size(type);
  return v4 + hash_state_packed_size(v3) + 4 * *(_DWORD *)(v1 + 16) + 36;
}

uint64_t fch_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5 = (unsigned int *)(a1 + 1);
  int v6 = *a1;
  unsigned int v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  int v8 = *v7++;
  size_t v9 = (char *)v7 + hash_state_packed_size(v8);
  unsigned int v10 = *(_DWORD *)v9;
  unsigned int v11 = *((_DWORD *)v9 + 1);
  double v12 = (double)*((unint64_t *)v9 + 1);
  unint64_t v13 = *((void *)v9 + 2);
  unsigned int v14 = hash_packed(v5, v6, a2, a3) % v10;
  unsigned int v15 = hash_packed(v7, v8, a2, a3);
  if ((double)v14 >= v12)
  {
    unsigned int v16 = v14 % v11;
    if ((double)(v14 % v11) < (double)v13) {
      v16 += v13;
    }
  }
  else
  {
    unsigned int v16 = v14 % v13;
  }
  return (*(_DWORD *)&v9[4 * v16 + 24] + v15 % v10) % v10;
}

_DWORD *fch_buckets_new(unsigned int a1)
{
  uint64_t v2 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
  if (v2)
  {
    int v3 = (char *)malloc_type_calloc(a1, 0x10uLL, 0x1020040EDED9539uLL);
    *(void *)uint64_t v2 = v3;
    if (a1)
    {
      uint64_t v4 = 0;
      do
      {
        if (!v3) {
          fch_buckets_new_cold_2();
        }
        uint64_t v5 = &v3[v4];
        *(void *)uint64_t v5 = 0;
        *((void *)v5 + 1) = 0;
        int v3 = *(char **)v2;
        v4 += 16;
      }
      while (16 * a1 != v4);
    }
    if (!v3) {
      fch_buckets_new_cold_1();
    }
    v2[2] = a1;
    v2[3] = 0;
  }
  return v2;
}

BOOL fch_buckets_is_empty(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 8) <= a2) {
    fch_buckets_is_empty_cold_2();
  }
  if (!*(void *)a1) {
    fch_buckets_is_empty_cold_1();
  }
  return *(_DWORD *)(*(void *)a1 + 16 * a2 + 12) == 0;
}

_DWORD *fch_buckets_insert(_DWORD *result, unsigned int a2, uint64_t a3, int a4)
{
  if (result[2] <= a2) {
    fch_buckets_insert_cold_4();
  }
  uint64_t v4 = result;
  uint64_t v5 = *(void *)result;
  if (!*(void *)result) {
    fch_buckets_insert_cold_1();
  }
  uint64_t v8 = a2;
  uint64_t v9 = v5 + 16 * a2;
  unsigned int v12 = *(_DWORD *)(v9 + 12);
  unsigned int v11 = (unsigned int *)(v9 + 12);
  uint64_t v10 = v12;
  unint64_t v13 = (void **)(v5 + 16 * a2);
  unsigned int v14 = v12 + 1;
  unsigned int v15 = *(v11 - 1);
  if (v15 >= v12 + 1)
  {
    uint64_t v21 = (uint64_t)*v13 + 16 * v10;
    *(void *)uint64_t v21 = a3;
    *(_DWORD *)(v21 + 8) = a4;
    *unsigned int v11 = v14;
  }
  else
  {
    unsigned int v16 = v15 + 1;
    do
    {
      unsigned int v17 = v16;
      v16 *= 2;
    }
    while (v17 < v14);
    uint64_t result = malloc_type_realloc(*v13, 16 * v17, 0x1010040A1D9428BuLL);
    *unint64_t v13 = result;
    if (!result) {
      fch_buckets_insert_cold_2();
    }
    *(v11 - 1) = v17;
    uint64_t v18 = *v11;
    unsigned int v19 = v18 + 1;
    uint64_t v5 = *(void *)v4;
    unint64_t v20 = (char *)&result[4 * v18];
    *(void *)unint64_t v20 = a3;
    *((_DWORD *)v20 + 2) = a4;
    *unsigned int v11 = v19;
    if (!v5) {
      fch_buckets_insert_cold_3();
    }
  }
  unsigned int v22 = *(_DWORD *)(v5 + 16 * v8 + 12);
  if (v22 > v4[3]) {
    v4[3] = v22;
  }
  return result;
}

uint64_t fch_buckets_get_size(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 8) <= a2) {
    fch_buckets_get_size_cold_2();
  }
  if (!*(void *)a1) {
    fch_buckets_insert_cold_3();
  }
  return *(unsigned int *)(*(void *)a1 + 16 * a2 + 12);
}

uint64_t fch_buckets_get_key(uint64_t *a1, unsigned int a2, unsigned int a3)
{
  if (*((_DWORD *)a1 + 2) <= a2) {
    fch_buckets_get_key_cold_3();
  }
  uint64_t v3 = *a1;
  if (!*a1) {
    fch_buckets_get_key_cold_1();
  }
  if (*(_DWORD *)(v3 + 16 * a2 + 12) <= a3) {
    fch_buckets_get_key_cold_2();
  }
  return *(void *)(*(void *)(v3 + 16 * a2) + 16 * a3);
}

uint64_t fch_buckets_get_keylength(uint64_t *a1, unsigned int a2, unsigned int a3)
{
  if (*((_DWORD *)a1 + 2) <= a2) {
    fch_buckets_get_keylength_cold_3();
  }
  uint64_t v3 = *a1;
  if (!*a1) {
    fch_buckets_get_keylength_cold_1();
  }
  if (*(_DWORD *)(v3 + 16 * a2 + 12) <= a3) {
    fch_buckets_get_keylength_cold_2();
  }
  return *(unsigned int *)(*(void *)(v3 + 16 * a2) + 16 * a3 + 8);
}

uint64_t fch_buckets_get_max_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t fch_buckets_get_nbuckets(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

_DWORD *fch_buckets_get_indexes_sorted_by_size(unsigned int *a1)
{
  uint64_t v2 = malloc_type_calloc(a1[3] + 1, 4uLL, 0x100004052888210uLL);
  uint64_t v3 = malloc_type_calloc(a1[2], 4uLL, 0x100004052888210uLL);
  uint64_t v4 = v3;
  if ((int)a1[2] >= 1)
  {
    if (!*(void *)a1) {
      fch_buckets_insert_cold_3();
    }
    uint64_t v5 = 0;
    int v6 = (int *)(*(void *)a1 + 12);
    do
    {
      int v7 = *v6;
      v6 += 4;
      ++v2[v7];
      ++v5;
    }
    while (v5 < (int)a1[2]);
  }
  uint64_t v8 = a1[3];
  int v9 = v2[v8];
  v2[v8] = 0;
  uint64_t v10 = a1[3];
  if ((int)v10 >= 1)
  {
    int v11 = 0;
    unint64_t v12 = v10 + 1;
    do
    {
      v11 += v9;
      int v9 = v2[(v12 - 2)];
      v2[(v12-- - 2)] = v11;
    }
    while (v12 > 1);
  }
  if ((int)a1[2] >= 1)
  {
    if (!*(void *)a1) {
      fch_buckets_insert_cold_3();
    }
    uint64_t v13 = 0;
    unsigned int v14 = (unsigned int *)(*(void *)a1 + 12);
    do
    {
      v3[v2[*v14]] = v13++;
      int v15 = *v14;
      v14 += 4;
      ++v2[v15];
    }
    while (v13 < (int)a1[2]);
  }
  free(v2);
  return v4;
}

uint64_t fch_buckets_print(uint64_t result)
{
  if (*(_DWORD *)(result + 8))
  {
    uint64_t v1 = result;
    unint64_t v2 = 0;
    uint64_t v3 = (FILE **)MEMORY[0x263EF8348];
    do
    {
      if (!*(void *)v1) {
        fch_buckets_print_cold_1();
      }
      uint64_t v4 = *(void *)v1 + 16 * v2;
      uint64_t result = fprintf(*v3, "Printing bucket %u ...\n", v2);
      if (*(_DWORD *)(v4 + 12))
      {
        uint64_t v5 = 0;
        unint64_t v6 = 0;
        do
        {
          uint64_t result = fprintf(*v3, "  key: %s\n", *(const char **)(*(void *)v4 + v5));
          ++v6;
          v5 += 16;
        }
        while (v6 < *(unsigned int *)(v4 + 12));
      }
      ++v2;
    }
    while (v2 < *(unsigned int *)(v1 + 8));
  }
  return result;
}

void fch_buckets_destroy(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v2 = 0;
    do
    {
      if (!*(void *)a1) {
        fch_buckets_destroy_cold_1();
      }
      uint64_t v3 = *(void *)a1 + 16 * v2;
      if (*(_DWORD *)(v3 + 12))
      {
        uint64_t v4 = 0;
        unint64_t v5 = 0;
        do
        {
          free(*(void **)(*(void *)v3 + v4));
          ++v5;
          v4 += 16;
        }
        while (v5 < *(unsigned int *)(v3 + 12));
      }
      free(*(void **)v3);
      ++v2;
    }
    while (v2 < *(unsigned int *)(a1 + 8));
  }
  free(*(void **)a1);

  free((void *)a1);
}

void *graph_new(unsigned int a1, unsigned int a2)
{
  uint64_t v4 = malloc_type_malloc(0x38uLL, 0x101004041DD7EF0uLL);
  if (v4)
  {
    v4[1] = malloc_type_malloc(8 * a2, 0xEA1230D8uLL);
    v4[3] = malloc_type_malloc(8 * a2, 0xD3A46243uLL);
    v4[2] = malloc_type_malloc(4 * a1, 0x100004052888210uLL);
    v4[4] = 0;
    *((_DWORD *)v4 + 10) = 0;
    *(_DWORD *)uint64_t v4 = a1;
    *((_DWORD *)v4 + 1) = a2;
    graph_clear_edges((unsigned int *)v4);
  }
  return v4;
}

unsigned int *graph_clear_edges(unsigned int *result)
{
  if (*result)
  {
    unint64_t v1 = 0;
    uint64_t v2 = *((void *)result + 2);
    do
      *(_DWORD *)(v2 + 4 * v1++) = -1;
    while (v1 < *result);
  }
  if ((result[1] & 0x7FFFFFFF) != 0)
  {
    unint64_t v3 = 0;
    uint64_t v4 = *((void *)result + 1);
    uint64_t v5 = *((void *)result + 3);
    do
    {
      *(_DWORD *)(v4 + 4 * v3) = -1;
      *(_DWORD *)(v5 + 4 * v3++) = -1;
    }
    while (v3 < 2 * result[1]);
  }
  result[11] = 0;
  result[12] = 0;
  return result;
}

void graph_destroy(void **a1)
{
  free(a1[1]);
  free(a1[2]);
  free(a1[3]);
  free(a1[4]);

  free(a1);
}

unsigned int *graph_print(unsigned int *result)
{
  if (*result)
  {
    unint64_t v1 = result;
    unint64_t v2 = 0;
    do
    {
      uint64_t v3 = *(unsigned int *)(*((void *)v1 + 2) + 4 * v2);
      if (v3 != -1)
      {
        uint64_t result = (unsigned int *)printf("%u -> %u\n", *(_DWORD *)(*((void *)v1 + 1) + 4 * (v3 % v1[1])), *(_DWORD *)(*((void *)v1 + 1) + 4 * (v3 % v1[1] + v1[1])));
        for (unsigned int i = *(_DWORD *)(*((void *)v1 + 3) + 4 * v3); i != -1; unsigned int i = *(_DWORD *)(*((void *)v1 + 3) + 4 * i))
          uint64_t result = (unsigned int *)printf("%u -> %u\n", *(_DWORD *)(*((void *)v1 + 1) + 4 * (i % v1[1])), *(_DWORD *)(*((void *)v1 + 1) + 4 * (i % v1[1] + v1[1])));
      }
      ++v2;
    }
    while (v2 < *v1);
  }
  return result;
}

uint64_t graph_add_edge(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (*(_DWORD *)result <= a2) {
    graph_add_edge_cold_4();
  }
  if (*(_DWORD *)result <= a3) {
    graph_add_edge_cold_3();
  }
  uint64_t v3 = *(unsigned int *)(result + 44);
  if (v3 >= *(_DWORD *)(result + 4)) {
    graph_add_edge_cold_2();
  }
  if (*(_DWORD *)(result + 48)) {
    graph_add_edge_cold_1();
  }
  uint64_t v5 = *(void *)(result + 8);
  uint64_t v4 = *(void *)(result + 16);
  uint64_t v6 = *(void *)(result + 24);
  *(_DWORD *)(v6 + 4 * v3) = *(_DWORD *)(v4 + 4 * a2);
  *(_DWORD *)(v4 + 4 * a2) = v3;
  *(_DWORD *)(v5 + 4 * v3) = a3;
  *(_DWORD *)(v6 + 4 * (*(_DWORD *)(result + 4) + v3)) = *(_DWORD *)(v4 + 4 * a3);
  *(_DWORD *)(v4 + 4 * a3) = *(_DWORD *)(result + 4) + v3;
  *(_DWORD *)(v5 + 4 * (*(_DWORD *)(result + 4) + v3)) = a2;
  ++*(_DWORD *)(result + 44);
  return result;
}

uint64_t graph_edge_id(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 16) + 4 * a2);
  if (v3 == -1) {
    graph_edge_id_cold_1();
  }
  uint64_t v5 = *(void *)(a1 + 8);
  unsigned int v6 = *(_DWORD *)(a1 + 4);
  uint64_t result = v3 % v6;
  int v8 = *(_DWORD *)(v5 + 4 * result);
  if ((v8 != a2 || *(_DWORD *)(v5 + 4 * (result + v6)) != a3)
    && (v8 != a3 || *(_DWORD *)(v5 + 4 * (result + v6)) != a2))
  {
    uint64_t v9 = *(void *)(a1 + 24);
    for (unsigned int i = *(_DWORD *)(v9 + 4 * v3); ; unsigned int i = *(_DWORD *)(v9 + 4 * i))
    {
      if (i == -1) {
        graph_edge_id_cold_2();
      }
      uint64_t result = i % v6;
      int v11 = *(_DWORD *)(v5 + 4 * result);
      if (v11 == a2 && *(_DWORD *)(v5 + 4 * (result + v6)) == a3) {
        break;
      }
      if (v11 == a3 && *(_DWORD *)(v5 + 4 * (result + v6)) == a2) {
        break;
      }
    }
  }
  return result;
}

uint64_t graph_del_edge(uint64_t a1, unsigned int a2, unsigned int a3)
{
  *(_DWORD *)(a1 + 48) = 1;
  del_edge_point(a1, a2, a3);

  return del_edge_point(a1, a3, a2);
}

uint64_t del_edge_point(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v4 = (unsigned int *)(*(void *)(result + 16) + 4 * a2);
  uint64_t v5 = *v4;
  unsigned int v6 = *(_DWORD *)(result + 4);
  unsigned int v7 = v5 % v6;
  int v8 = *(_DWORD *)(v3 + 4 * (v5 % v6));
  if (v8 == a2 && *(_DWORD *)(v3 + 4 * (v7 + v6)) == a3 || v8 == a3 && *(_DWORD *)(v3 + 4 * (v7 + v6)) == a2)
  {
    uint64_t v9 = *(void *)(result + 24);
    unsigned int i = *v4;
  }
  else
  {
    uint64_t v9 = *(void *)(result + 24);
    for (unsigned int i = *(_DWORD *)(v9 + 4 * v5); ; unsigned int i = *(_DWORD *)(v9 + 4 * i))
    {
      if (i == -1) {
        del_edge_point_cold_1();
      }
      int v11 = i % v6;
      int v12 = *(_DWORD *)(v3 + 4 * (i % v6));
      if (v12 == a2 && *(_DWORD *)(v3 + 4 * (v11 + v6)) == a3) {
        break;
      }
      if (v12 == a3 && *(_DWORD *)(v3 + 4 * (v11 + v6)) == a2) {
        break;
      }
      uint64_t v5 = i;
    }
    uint64_t v4 = (unsigned int *)(v9 + 4 * v5);
  }
  *uint64_t v4 = *(_DWORD *)(v9 + 4 * i);
  return result;
}

uint64_t graph_is_cyclic(unsigned int *a1)
{
  unint64_t v2 = malloc_type_malloc(((unint64_t)a1[1] >> 3) + 1, 0x7815BD4EuLL);
  bzero(v2, ((unint64_t)a1[1] >> 3) + 1);
  if (*a1)
  {
    unsigned int v3 = 0;
    do
      cyclic_del_edge((uint64_t)a1, v3++, (uint64_t)v2);
    while (v3 < *a1);
  }
  unsigned int v4 = a1[1];
  if (v4)
  {
    unsigned int v5 = 0;
    while ((bitmask_4[v5 & 7] & *((unsigned char *)v2 + ((unint64_t)v5 >> 3))) >> (v5 & 7))
    {
      if (v4 == ++v5) {
        goto LABEL_8;
      }
    }
    free(v2);
    return 1;
  }
  else
  {
LABEL_8:
    free(v2);
    return 0;
  }
}

uint64_t cyclic_del_edge(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unsigned int v4 = a2;
  unsigned int v12 = 0;
  uint64_t result = find_degree1_edge(a1, a2, a3, &v12);
  if (result)
  {
    unsigned int v7 = *(_DWORD *)(a1 + 4);
    do
    {
      unsigned int v8 = v12;
      *(unsigned char *)(a3 + ((unint64_t)(v12 % v7) >> 3)) |= bitmask_4[(v12 % v7) & 7];
      uint64_t v9 = *(void *)(a1 + 8);
      unsigned int v7 = *(_DWORD *)(a1 + 4);
      unsigned int v10 = v8 % v7;
      unsigned int v11 = *(_DWORD *)(v9 + 4 * v10);
      if (v11 == v4) {
        unsigned int v11 = *(_DWORD *)(v9 + 4 * (v10 + v7));
      }
      uint64_t result = find_degree1_edge(a1, v11, a3, &v12);
      unsigned int v4 = v11;
    }
    while (result);
  }
  return result;
}

uint64_t graph_node_is_critical(uint64_t a1, unsigned int a2)
{
  return (bitmask_4[a2 & 7] & *(unsigned char *)(*(void *)(a1 + 32) + ((unint64_t)a2 >> 3))) >> (a2 & 7);
}

void graph_obtain_critical_nodes(void **a1)
{
  unint64_t v2 = malloc_type_malloc(((unint64_t)*((unsigned int *)a1 + 1) >> 3) + 1, 0x35F3F3CuLL);
  bzero(v2, ((unint64_t)*((unsigned int *)a1 + 1) >> 3) + 1);
  free(a1[4]);
  unsigned int v3 = malloc_type_malloc(((unint64_t)*(unsigned int *)a1 >> 3) + 1, 0xF8ABB3F2uLL);
  a1[4] = v3;
  *((_DWORD *)a1 + 10) = 0;
  bzero(v3, ((unint64_t)*(unsigned int *)a1 >> 3) + 1);
  if (*(_DWORD *)a1)
  {
    unsigned int v4 = 0;
    do
      cyclic_del_edge((uint64_t)a1, v4++, (uint64_t)v2);
    while (v4 < *(_DWORD *)a1);
  }
  unint64_t v5 = *((unsigned int *)a1 + 1);
  if (v5)
  {
    for (unint64_t i = 0; i < v5; ++i)
    {
      if (!((bitmask_4[i & 7] & *((unsigned char *)v2 + (i >> 3))) >> (i & 7)))
      {
        unsigned int v7 = a1[4];
        unsigned int v8 = a1[1];
        if (!((bitmask_4[v8[i] & 7] & v7[(unint64_t)v8[i] >> 3]) >> (v8[i] & 7)))
        {
          ++*((_DWORD *)a1 + 10);
          v7[(unint64_t)v8[i] >> 3] |= bitmask_4[v8[i] & 7];
          unsigned int v7 = a1[4];
          unsigned int v8 = a1[1];
          unint64_t v5 = *((unsigned int *)a1 + 1);
        }
        uint64_t v9 = (i + v5);
        unint64_t v10 = v8[v9];
        if (!((bitmask_4[v10 & 7] & v7[v10 >> 3]) >> (v10 & 7)))
        {
          ++*((_DWORD *)a1 + 10);
          v7[(unint64_t)v8[v9] >> 3] |= bitmask_4[v8[v9] & 7];
          unint64_t v5 = *((unsigned int *)a1 + 1);
        }
      }
    }
  }

  free(v2);
}

uint64_t graph_contains_edge(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 16) + 4 * a2);
  if (v3 != -1)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    unsigned int v5 = *(_DWORD *)(a1 + 4);
    unsigned int v6 = v3 % v5;
    int v7 = *(_DWORD *)(v4 + 4 * (v3 % v5));
    if (v7 == a2 && *(_DWORD *)(v4 + 4 * (v6 + v5)) == a3 || v7 == a3 && *(_DWORD *)(v4 + 4 * (v6 + v5)) == a2) {
      return 1;
    }
    uint64_t v9 = *(void *)(a1 + 24);
    for (unsigned int i = *(_DWORD *)(v9 + 4 * v3); i != -1; unsigned int i = *(_DWORD *)(v9 + 4 * i))
    {
      int v11 = i % v5;
      int v12 = *(_DWORD *)(v4 + 4 * (i % v5));
      if (v12 == a2 && *(_DWORD *)(v4 + 4 * (v11 + v5)) == a3
        || v12 == a3 && *(_DWORD *)(v4 + 4 * (v11 + v5)) == a2)
      {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t graph_vertex_id(uint64_t a1, int a2, int a3)
{
  return *(unsigned int *)(*(void *)(a1 + 8) + 4 * (a2 + *(_DWORD *)(a1 + 4) * a3));
}

uint64_t graph_ncritical_nodes(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

unint64_t graph_neighbors_it(uint64_t a1, unsigned int a2)
{
  return a2 | ((unint64_t)*(unsigned int *)(*(void *)(a1 + 16) + 4 * a2) << 32);
}

uint64_t graph_next_neighbor(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = a2[1];
  if (v2 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(unsigned int *)(v3 + 4 * v2);
  if (v4 == *a2) {
    uint64_t v4 = *(unsigned int *)(v3 + 4 * (*(_DWORD *)(a1 + 4) + v2));
  }
  a2[1] = *(_DWORD *)(*(void *)(a1 + 24) + 4 * v2);
  return v4;
}

uint64_t find_degree1_edge(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  unint64_t v4 = *(unsigned int *)(*(void *)(a1 + 16) + 4 * a2);
  if (v4 == -1)
  {
LABEL_2:
    LOBYTE(v5) = 0;
  }
  else
  {
    unint64_t v7 = v4 - (v4 / *(unsigned int *)(a1 + 4)) * (unint64_t)*(unsigned int *)(a1 + 4);
    if ((bitmask_4[v7 & 7] & *(unsigned char *)(a3 + (v7 >> 3))) >> (v7 & 7))
    {
      int v5 = 0;
    }
    else
    {
      *a4 = v4;
      int v5 = 1;
    }
    uint64_t v8 = *(void *)(a1 + 24);
    while (1)
    {
      unint64_t v4 = *(unsigned int *)(v8 + 4 * v4);
      if (v4 == -1) {
        break;
      }
      unint64_t v9 = v4 - (v4 / *(unsigned int *)(a1 + 4)) * (unint64_t)*(unsigned int *)(a1 + 4);
      if (!((bitmask_4[v9 & 7] & *(unsigned char *)(a3 + (v9 >> 3))) >> (v9 & 7)))
      {
        if (v5) {
          goto LABEL_2;
        }
        *a4 = v4;
        int v5 = 1;
      }
    }
  }
  return v5;
}

_DWORD *hash_state_new(int a1, unsigned int a2)
{
  if (a1) {
    hash_state_new_cold_1();
  }
  uint64_t result = jenkins_state_new(a2);
  *uint64_t result = 0;
  return result;
}

uint64_t hash(_DWORD *a1, unsigned __int8 *a2, unsigned int a3)
{
  if (*a1) {
    hash_cold_1();
  }

  return jenkins_hash((uint64_t)a1, a2, a3);
}

uint64_t hash_vector(_DWORD *a1, unsigned __int8 *a2, unsigned int a3, int32x2_t *a4)
{
  if (*a1) {
    hash_vector_cold_1();
  }

  return jenkins_hash_vector_((uint64_t)a1, a2, a3, a4);
}

void hash_state_dump(_DWORD *a1, void *a2, _DWORD *a3)
{
  if (*a1) {
    hash_state_dump_cold_1();
  }
  __src = 0;
  jenkins_state_dump((uint64_t)a1, &__src, a3);
  uint64_t v6 = *a3;
  if (v6 != -1)
  {
    size_t v7 = strlen((const char *)cmph_hash_names[*a1]);
    uint64_t v8 = malloc_type_malloc(v6 + v7 + 1, 0xC17D6035uLL);
    *a2 = v8;
    size_t v9 = strlen((const char *)cmph_hash_names[*a1]);
    memcpy(v8, (const void *)cmph_hash_names[*a1], v9 + 1);
    size_t v10 = strlen((const char *)cmph_hash_names[*a1]);
    memcpy((void *)(*a2 + v10 + 1), __src, *a3);
    *a3 += strlen((const char *)cmph_hash_names[*a1]) + 1;
  }
  free(__src);
}

void hash_state_copy(double *a1)
{
  if (*(_DWORD *)a1) {
    hash_state_copy_cold_1();
  }
  jenkins_state_copy(a1);
  *uint64_t v2 = *(_DWORD *)a1;
}

_DWORD *hash_state_load(const char *a1)
{
  uint64_t v2 = (const char *)cmph_hash_names[0];
  if (strcmp(a1, (const char *)cmph_hash_names[0])) {
    return 0;
  }
  unint64_t v4 = (int *)&a1[strlen(v2) + 1];

  return jenkins_state_load(v4);
}

void hash_state_destroy(_DWORD *a1)
{
  if (*a1) {
    hash_state_destroy_cold_1();
  }

  jenkins_state_destroy(a1);
}

uint64_t hash_state_pack(_DWORD *a1, _DWORD *a2)
{
  if (*a1) {
    hash_state_pack_cold_1();
  }

  return jenkins_state_pack((uint64_t)a1, a2);
}

uint64_t hash_state_packed_size(int a1)
{
  if (a1) {
    hash_state_packed_size_cold_1();
  }
  return jenkins_state_packed_size();
}

uint64_t hash_packed(unsigned int *a1, int a2, unsigned __int8 *a3, unsigned int a4)
{
  if (a2) {
    hash_packed_cold_1();
  }
  return jenkins_hash_packed(a1, a3, a4);
}

uint64_t hash_vector_packed(unsigned int *a1, int a2, unsigned __int8 *a3, unsigned int a4, int32x2_t *a5)
{
  if (a2) {
    hash_vector_packed_cold_1();
  }
  return jenkins_hash_vector_packed(a1, a3, a4, a5);
}

uint64_t hash_get_type(unsigned int *a1)
{
  return *a1;
}

_DWORD *jenkins_state_new(unsigned int a1)
{
  uint64_t v2 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  if (v2) {
    v2[1] = rand() % a1;
  }
  return v2;
}

uint64_t jenkins_hash(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  __jenkins_hash_vector(*(unsigned int *)(a1 + 4), a2, a3, &v4);
  return v5;
}

uint64_t __jenkins_hash_vector(uint64_t result, unsigned __int8 *a2, unsigned int a3, int32x2_t *a4)
{
  unsigned int v4 = -1640531527;
  *a4 = vdup_n_s32(0x9E3779B9);
  a4[1].i32[0] = result;
  int v5 = -1640531527;
  unsigned int v6 = a3;
  if (a3 >= 0xC)
  {
    do
    {
      int v7 = (char)*a2 + ((char)a2[1] << 8) + ((char)a2[2] << 16) + v5 + (a2[3] << 24);
      a4->i32[0] = v7;
      int v8 = (char)a2[4] + ((char)a2[5] << 8) + ((char)a2[6] << 16) + v4 + (a2[7] << 24);
      a4->i32[1] = v8;
      unsigned int v9 = (char)a2[8] + ((char)a2[9] << 8) + ((char)a2[10] << 16) + result + (a2[11] << 24);
      int v10 = (v7 - (v8 + v9)) ^ (v9 >> 13);
      unsigned int v11 = (v8 - v9 - v10) ^ (v10 << 8);
      unsigned int v12 = (v9 - v10 - v11) ^ (v11 >> 13);
      int v13 = (v10 - v11 - v12) ^ (v12 >> 12);
      unsigned int v14 = (v11 - v12 - v13) ^ (v13 << 16);
      unsigned int v15 = (v12 - v13 - v14) ^ (v14 >> 5);
      int v5 = (v13 - v14 - v15) ^ (v15 >> 3);
      unsigned int v4 = (v14 - v15 - v5) ^ (v5 << 10);
      a4->i32[0] = v5;
      a4->i32[1] = v4;
      uint64_t result = (v15 - v5 - v4) ^ (v4 >> 15);
      a4[1].i32[0] = result;
      a2 += 12;
      v6 -= 12;
    }
    while (v6 > 0xB);
  }
  unsigned __int32 v16 = result + a3;
  a4[1].i32[0] = result + a3;
  switch(v6)
  {
    case 1u:
      goto LABEL_14;
    case 2u:
      goto LABEL_13;
    case 3u:
      goto LABEL_12;
    case 4u:
      goto LABEL_11;
    case 5u:
      goto LABEL_10;
    case 6u:
      goto LABEL_9;
    case 7u:
      goto LABEL_8;
    case 8u:
      goto LABEL_7;
    case 9u:
      goto LABEL_6;
    case 0xAu:
      goto LABEL_5;
    case 0xBu:
      v16 += a2[10] << 24;
      a4[1].i32[0] = v16;
LABEL_5:
      v16 += (char)a2[9] << 16;
      a4[1].i32[0] = v16;
LABEL_6:
      v16 += (char)a2[8] << 8;
      a4[1].i32[0] = v16;
LABEL_7:
      v4 += a2[7] << 24;
      a4->i32[1] = v4;
LABEL_8:
      v4 += (char)a2[6] << 16;
      a4->i32[1] = v4;
LABEL_9:
      v4 += (char)a2[5] << 8;
      a4->i32[1] = v4;
LABEL_10:
      v4 += a2[4];
      a4->i32[1] = v4;
LABEL_11:
      v5 += a2[3] << 24;
      a4->i32[0] = v5;
LABEL_12:
      v5 += (char)a2[2] << 16;
      a4->i32[0] = v5;
LABEL_13:
      v5 += (char)a2[1] << 8;
      a4->i32[0] = v5;
LABEL_14:
      v5 += *a2;
      break;
    default:
      break;
  }
  int v17 = (v5 - v4 - v16) ^ (v16 >> 13);
  unsigned int v18 = (v4 - v16 - v17) ^ (v17 << 8);
  unsigned int v19 = (v16 - v17 - v18) ^ (v18 >> 13);
  int v20 = (v17 - v18 - v19) ^ (v19 >> 12);
  unsigned int v21 = (v18 - v19 - v20) ^ (v20 << 16);
  unsigned int v22 = (v19 - v20 - v21) ^ (v21 >> 5);
  int v23 = (v20 - v21 - v22) ^ (v22 >> 3);
  unsigned int v24 = (v21 - v22 - v23) ^ (v23 << 10);
  a4->i32[0] = v23;
  a4->i32[1] = v24;
  a4[1].i32[0] = (v22 - v23 - v24) ^ (v24 >> 15);
  return result;
}

uint64_t jenkins_hash_vector_(uint64_t a1, unsigned __int8 *a2, unsigned int a3, int32x2_t *a4)
{
  return __jenkins_hash_vector(*(unsigned int *)(a1 + 4), a2, a3, a4);
}

_DWORD *jenkins_state_dump(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 4;
  uint64_t result = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  *a2 = result;
  if (result) {
    *uint64_t result = *(_DWORD *)(a1 + 4);
  }
  else {
    *a3 = -1;
  }
  return result;
}

double jenkins_state_copy(double *a1)
{
  uint64_t v2 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  double result = *a1;
  *uint64_t v2 = *(void *)a1;
  return result;
}

_DWORD *jenkins_state_load(int *a1)
{
  double result = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  int v3 = *a1;
  *double result = 0;
  result[1] = v3;
  return result;
}

uint64_t jenkins_state_pack(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (a2) {
      *a2 = *(_DWORD *)(result + 4);
    }
  }
  return result;
}

uint64_t jenkins_state_packed_size()
{
  return 4;
}

uint64_t jenkins_hash_packed(unsigned int *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  __jenkins_hash_vector(*a1, a2, a3, &v4);
  return v5;
}

uint64_t jenkins_hash_vector_packed(unsigned int *a1, unsigned __int8 *a2, unsigned int a3, int32x2_t *a4)
{
  return __jenkins_hash_vector(*a1, a2, a3, a4);
}

void *lsmap_new()
{
  double result = malloc_type_malloc(0x18uLL, 0xF00409C84318DuLL);
  if (result)
  {
    *double result = "dummy node";
    result[2] = 0;
  }
  return result;
}

uint64_t lsmap_size(uint64_t a1)
{
  while (*(void *)(a1 + 16))
    ;
  return 0;
}

void *lsmap_append(void *a1, uint64_t a2, uint64_t a3)
{
  do
  {
    unsigned int v5 = a1;
    a1 = (void *)a1[2];
  }
  while (a1);
  double result = malloc_type_malloc(0x18uLL, 0xF00409C84318DuLL);
  v5[1] = a3;
  v5[2] = result;
  *unsigned int v5 = a2;
  *double result = "dummy node";
  result[2] = 0;
  return result;
}

uint64_t lsmap_search(uint64_t a1, char *__s2)
{
  while (1)
  {
    uint64_t v4 = a1;
    a1 = *(void *)(a1 + 16);
    if (!a1) {
      break;
    }
    if (!strcmp(*(const char **)v4, __s2)) {
      return *(void *)(v4 + 8);
    }
  }
  return 0;
}

uint64_t lsmap_foreach_key(uint64_t result, uint64_t (*a2)(void))
{
  if (*(void *)(result + 16))
  {
    int v3 = (void *)result;
    do
    {
      double result = a2(*v3);
      int v3 = (void *)v3[2];
    }
    while (v3[2]);
  }
  return result;
}

uint64_t lsmap_foreach_value(uint64_t result, uint64_t (*a2)(void))
{
  if (*(void *)(result + 16))
  {
    uint64_t v3 = result;
    do
    {
      double result = a2(*(void *)(v3 + 8));
      uint64_t v3 = *(void *)(v3 + 16);
    }
    while (*(void *)(v3 + 16));
  }
  return result;
}

void lsmap_destroy(void *a1)
{
  uint64_t v1 = (void *)a1[2];
  if (v1)
  {
    do
    {
      uint64_t v2 = v1;
      free(a1);
      uint64_t v1 = (void *)v2[2];
      a1 = v2;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = a1;
  }

  free(v2);
}

uint64_t check_primality(unint64_t a1)
{
  uint64_t v1 = 0;
  v2.i64[0] = 0x6DB6DB6DB6DB6DB7 * a1;
  v2.i64[1] = 0xCCCCCCCCCCCCCCCDLL * a1;
  int32x2_t v3 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)xmmword_212A045B0, v2));
  if ((v3.i8[0] & 1) != 0 || (v3.i8[4] & 1) != 0 || (a1 & 1) == 0 || !(a1 % 3)) {
    return v1;
  }
  unint64_t v4 = a1 - 1;
  uint64_t v5 = -1;
  unint64_t v6 = a1 - 1;
  do
  {
    char v7 = v6;
    v6 >>= 1;
    ++v5;
  }
  while ((v7 & 2) == 0);
  unint64_t v8 = v5 + 1;
  uint64_t v9 = 2;
  uint64_t v10 = 1;
  unint64_t v11 = v6;
  do
  {
    if (v11) {
      uint64_t v10 = v9 * v10 % a1;
    }
    uint64_t v9 = v9 * v9 % a1;
    BOOL v12 = v11 > 1;
    v11 >>= 1;
  }
  while (v12);
  if (v10 != 1 && v4 != v10)
  {
    if (v8 < 2) {
      return 0;
    }
    uint64_t v13 = v5;
    while (1)
    {
      uint64_t v10 = v10 * v10 % a1;
      if (v10 == v4) {
        break;
      }
      if (!--v13) {
        return 0;
      }
    }
  }
  uint64_t v14 = 7;
  uint64_t v15 = 1;
  unint64_t v16 = v6;
  do
  {
    if (v16) {
      uint64_t v15 = v14 * v15 % a1;
    }
    uint64_t v14 = v14 * v14 % a1;
    BOOL v12 = v16 > 1;
    v16 >>= 1;
  }
  while (v12);
  if (v15 != 1 && v4 != v15)
  {
    if (v8 < 2) {
      return 0;
    }
    uint64_t v17 = v5;
    while (1)
    {
      uint64_t v15 = v15 * v15 % a1;
      if (v15 == v4) {
        break;
      }
      if (!--v17) {
        return 0;
      }
    }
  }
  uint64_t v18 = 61;
  uint64_t v19 = 1;
  do
  {
    if (v6) {
      uint64_t v19 = v18 * v19 % a1;
    }
    uint64_t v18 = v18 * v18 % a1;
    BOOL v12 = v6 > 1;
    v6 >>= 1;
  }
  while (v12);
  uint64_t v1 = 1;
  if (v19 == 1 || v4 == v19) {
    return v1;
  }
  if (v8 < 2) {
    return 0;
  }
  while (1)
  {
    uint64_t v19 = v19 * v19 % a1;
    if (v19 == v4) {
      break;
    }
    uint64_t v1 = 0;
    if (!--v5) {
      return v1;
    }
  }
  return 1;
}

void *select_init(void *result)
{
  *double result = 0;
  result[1] = 0;
  result[2] = 0;
  return result;
}

uint64_t select_get_space_usage(_DWORD *a1)
{
  return ((*a1 + a1[1] + 31) & 0xFFFFFFE0) + 32 * (*a1 >> 7) + 96;
}

void select_destroy(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
}

_DWORD *select_generate(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  *(_DWORD *)a1 = a3;
  *(_DWORD *)(a1 + 4) = a4;
  size_t v6 = (a3 + a4 + 31) >> 5;
  unsigned int v7 = a3 >> 7;
  unint64_t v8 = *(void **)(a1 + 8);
  if (v8) {
    free(v8);
  }
  size_t v9 = v7 + 1;
  *(void *)(a1 + 8) = malloc_type_calloc(v6, 4uLL, 0x100004052888210uLL);
  uint64_t v10 = *(void **)(a1 + 16);
  if (v10) {
    free(v10);
  }
  double result = malloc_type_calloc(v9, 4uLL, 0x100004052888210uLL);
  unsigned int v12 = 0;
  unsigned int v13 = 0;
  unsigned int v14 = 0;
  unsigned int v15 = 0;
  *(void *)(a1 + 16) = result;
  while (1)
  {
    while (1)
    {
      unsigned int v16 = *(_DWORD *)(a2 + 4 * v13);
      if (v16 != v15) {
        break;
      }
      unsigned int v17 = (v12 >> 1) | 0x80000000;
      int v18 = ++v14 & 0x1F;
      if ((v14 & 0x1F) == 0) {
        *(_DWORD *)(*(void *)(a1 + 8) + 4 * ((v14 >> 5) - 1)) = v17;
      }
      ++v13;
      unsigned int v12 = (v12 >> 1) | 0x80000000;
      if (v13 == *(_DWORD *)a1) {
        goto LABEL_19;
      }
    }
    if (v15 == *(_DWORD *)(a1 + 4)) {
      break;
    }
    if (v16 > v15)
    {
      int v19 = 0;
      do
      {
        v12 >>= 1;
        unsigned int v20 = v14 + v19 + 1;
        if ((v20 & 0x1F) == 0)
        {
          *(_DWORD *)(*(void *)(a1 + 8) + 4 * ((v20 >> 5) - 1)) = v12;
          unsigned int v16 = *(_DWORD *)(a2 + 4 * v13);
        }
        ++v19;
      }
      while (v16 > v15 + v19);
      v14 += v19;
      v15 += v19;
    }
  }
  int v18 = v14 & 0x1F;
  unsigned int v17 = v12;
LABEL_19:
  uint64_t v21 = *(void *)(a1 + 8);
  if (v18) {
    *(_DWORD *)(v21 + 4 * ((v14 - 1) >> 5)) = v17 >> -(char)v18;
  }
  if (*(_DWORD *)a1)
  {
    int v22 = 0;
    unsigned int v23 = 0;
    unsigned int v24 = 0;
    unsigned int v25 = 0;
    do
    {
      int v26 = 8 * v24 - 8;
      do
      {
        unsigned int v27 = v25;
        uint64_t v28 = *(unsigned __int8 *)(v21 + v24);
        v25 += rank_lookup_table[v28];
        ++v24;
        v26 += 8;
      }
      while (v25 <= v23);
      result[v22] = select_lookup_table[8 * v28 + v23 - v27] + v26;
      v23 += 128;
      ++v22;
    }
    while (v23 < *(_DWORD *)a1);
  }
  return result;
}

uint64_t select_query(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = 0;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(unsigned int *)(*(void *)(a1 + 16) + 4 * (a2 >> 7));
  unint64_t v5 = v4 >> 3;
  unsigned int v6 = (a2 & 0x7F)
     + rank_lookup_table[*(unsigned __int8 *)(v3 + (v4 >> 3)) & (unint64_t)~(-1 << (v4 & 7))];
  int v7 = 8 * (*(_DWORD *)(*(void *)(a1 + 16) + 4 * (a2 >> 7)) >> 3) - 8;
  do
  {
    unsigned int v8 = v2;
    uint64_t v9 = *(unsigned __int8 *)(v3 + v5);
    v2 += rank_lookup_table[v9];
    LODWORD(v5) = v5 + 1;
    v7 += 8;
  }
  while (v2 <= v6);
  return select_lookup_table[8 * v9 + v6 - v8] + v7;
}

uint64_t select_next_query(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = 0;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = (unint64_t)a2 >> 3;
  unsigned int v5 = rank_lookup_table[*(unsigned __int8 *)(v3 + v4) & (unint64_t)~(-1 << (a2 & 7))] + 1;
  int v6 = 8 * v4 - 8;
  do
  {
    unsigned int v7 = v2;
    uint64_t v8 = *(unsigned __int8 *)(v3 + v4);
    v2 += rank_lookup_table[v8];
    LODWORD(v4) = v4 + 1;
    v6 += 8;
  }
  while (v2 <= v5);
  return select_lookup_table[8 * v8 + v5 - v7] + v6;
}

_DWORD *select_dump(const void **a1, uint64_t a2, _DWORD *a3)
{
  unint64_t v6 = *(unsigned int *)a1;
  size_t v7 = ((v6 + *((_DWORD *)a1 + 1) + 31) >> 3) & 0x1FFFFFFC;
  uint64_t v8 = (v6 >> 5) & 0x7FFFFFC;
  size_t v9 = v8 + 4;
  size_t v10 = (v7 + 8 + v8 + 4);
  *a3 = v10;
  double result = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
  *(void *)a2 = result;
  if (result)
  {
    *double result = *(_DWORD *)a1;
    *(_DWORD *)(*(void *)a2 + 4) = *((_DWORD *)a1 + 1);
    memcpy((void *)(*(void *)a2 + 8), a1[1], v7);
    unsigned int v12 = (void *)(*(void *)a2 + (v7 + 8));
    unsigned int v13 = a1[2];
    return memcpy(v12, v13, v9);
  }
  else
  {
    *a3 = -1;
  }
  return result;
}

void *select_load(uint64_t a1, unsigned int *a2)
{
  unint64_t v4 = *a2;
  *(_DWORD *)a1 = v4;
  unsigned int v5 = a2[1];
  *(_DWORD *)(a1 + 4) = v5;
  size_t v6 = ((v4 + v5 + 31) >> 3) & 0x1FFFFFFC;
  size_t v7 = *(void **)(a1 + 8);
  if (v7) {
    free(v7);
  }
  *(void *)(a1 + 8) = malloc_type_calloc(v6 >> 2, 4uLL, 0x100004052888210uLL);
  uint64_t v8 = *(void **)(a1 + 16);
  if (v8) {
    free(v8);
  }
  size_t v9 = ((v4 >> 5) & 0x7FFFFFC) + 4;
  *(void *)(a1 + 16) = malloc_type_calloc(v9 >> 2, 4uLL, 0x100004052888210uLL);
  memcpy(*(void **)(a1 + 8), a2 + 2, v6);
  size_t v10 = *(void **)(a1 + 16);

  return memcpy(v10, (char *)a2 + (v6 + 8), v9);
}

void select_pack(const void **a1, void *a2)
{
  if (a1)
  {
    if (a2)
    {
      memset(__n, 0, sizeof(__n));
      select_dump(a1, (uint64_t)&__n[1], __n);
      uint64_t v3 = *(void **)&__n[1];
      memcpy(a2, *(const void **)&__n[1], __n[0]);
      free(v3);
    }
  }
}

uint64_t select_packed_size(_DWORD *a1)
{
  return ((*a1 >> 5) & 0x7FFFFFC) + 4 * ((*a1 + a1[1] + 31) >> 5) + 12;
}

uint64_t select_query_packed(_DWORD *a1, unsigned int a2)
{
  unsigned int v2 = 0;
  unint64_t v3 = a1[((*a1 + a1[1] + 31) >> 5) + 2 + (a2 >> 7)];
  unint64_t v4 = v3 >> 3;
  unsigned int v5 = (a2 & 0x7F)
     + rank_lookup_table[*((unsigned __int8 *)a1 + (v3 >> 3) + 8) & (unint64_t)~(-1 << (v3 & 7))];
  int v6 = 8 * (a1[((*a1 + a1[1] + 31) >> 5) + 2 + (a2 >> 7)] >> 3) - 8;
  do
  {
    unsigned int v7 = v2;
    uint64_t v8 = *((unsigned __int8 *)a1 + v4 + 8);
    v2 += rank_lookup_table[v8];
    LODWORD(v4) = v4 + 1;
    v6 += 8;
  }
  while (v2 <= v5);
  return select_lookup_table[8 * v8 + v5 - v7] + v6;
}

uint64_t select_next_query_packed(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = 0;
  unint64_t v3 = (unint64_t)a2 >> 3;
  unsigned int v4 = rank_lookup_table[*(unsigned __int8 *)(a1 + 8 + v3) & (unint64_t)~(-1 << (a2 & 7))] + 1;
  int v5 = 8 * v3 - 8;
  do
  {
    unsigned int v6 = v2;
    uint64_t v7 = *(unsigned __int8 *)(a1 + 8 + v3);
    v2 += rank_lookup_table[v7];
    LODWORD(v3) = v3 + 1;
    v5 += 8;
  }
  while (v2 <= v4);
  return select_lookup_table[8 * v7 + v4 - v6] + v5;
}

void *vqueue_new(int a1)
{
  unsigned int v2 = malloc_type_malloc(0x18uLL, 0x1010040E2407E0AuLL);
  if (v2)
  {
    size_t v3 = (a1 + 1);
    *unsigned int v2 = malloc_type_calloc(v3, 4uLL, 0x100004052888210uLL);
    v2[1] = 0;
    *((_DWORD *)v2 + 4) = v3;
  }
  return v2;
}

BOOL vqueue_is_empty(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) == *(_DWORD *)(a1 + 12);
}

uint64_t vqueue_insert(uint64_t result, int a2)
{
  unsigned int v2 = (*(_DWORD *)(result + 12) + 1) % *(_DWORD *)(result + 16);
  if (v2 == *(_DWORD *)(result + 8)) {
    vqueue_insert_cold_1();
  }
  *(_DWORD *)(result + 12) = v2;
  *(_DWORD *)(*(void *)result + 4 * v2) = a2;
  return result;
}

uint64_t vqueue_remove(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8);
  if (v1 == *(_DWORD *)(a1 + 12)) {
    vqueue_remove_cold_1();
  }
  unsigned int v2 = (v1 + 1) % *(_DWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 8) = v2;
  return *(unsigned int *)(*(void *)a1 + 4 * v2);
}

_DWORD *vqueue_print(_DWORD *result)
{
  int v1 = result[2];
  if (v1 != result[3])
  {
    unsigned int v2 = result;
    unsigned int v3 = result[4];
    unsigned int v4 = (FILE **)MEMORY[0x263EF8348];
    do
    {
      unsigned int v5 = v1 + 1;
      double result = (_DWORD *)fprintf(*v4, "%u\n", *(_DWORD *)(*(void *)v2 + 4 * ((v1 + 1) % v3)));
      unsigned int v3 = v2[4];
      int v1 = v5 % v3;
    }
    while (v5 % v3 != v2[3]);
  }
  return result;
}

void vqueue_destroy(void **a1)
{
  free(*a1);

  free(a1);
}

void *vstack_new()
{
  double result = malloc_type_malloc(0x18uLL, 0x10100400FFEF802uLL);
  if (!result) {
    vstack_new_cold_1();
  }
  *(_DWORD *)double result = 0;
  result[1] = 0;
  *((_DWORD *)result + 4) = 0;
  return result;
}

void vstack_destroy(void **a1)
{
  if (!a1) {
    vstack_destroy_cold_1();
  }
  free(a1[1]);

  free(a1);
}

void **vstack_push(uint64_t a1, int a2)
{
  if (!a1) {
    vstack_push_cold_1();
  }
  double result = vstack_reserve((void **)a1, *(_DWORD *)a1 + 1);
  *(_DWORD *)(*(void *)(a1 + 8) + 4 * (*(_DWORD *)a1)++) = a2;
  return result;
}

void **vstack_reserve(void **result, unsigned int a2)
{
  if (!result) {
    vstack_reserve_cold_1();
  }
  unsigned int v2 = result;
  unsigned int v3 = *((_DWORD *)result + 4);
  if (v3 < a2)
  {
    unsigned int v4 = v3 + 1;
    do
    {
      unsigned int v5 = v4;
      v4 *= 2;
    }
    while (v5 < a2);
    double result = (void **)malloc_type_realloc(result[1], 4 * v5, 0x100004052888210uLL);
    v2[1] = result;
    if (!result) {
      vstack_reserve_cold_2();
    }
    *((_DWORD *)v2 + 4) = v5;
  }
  return result;
}

_DWORD *vstack_pop(_DWORD *result)
{
  if (!result) {
    vstack_pop_cold_1();
  }
  if (!*result) {
    vstack_pop_cold_2();
  }
  --*result;
  return result;
}

uint64_t vstack_top(uint64_t a1)
{
  if (!a1) {
    vstack_top_cold_1();
  }
  if (!*(_DWORD *)a1) {
    vstack_top_cold_2();
  }
  return *(unsigned int *)(*(void *)(a1 + 8) + 4 * (*(_DWORD *)a1 - 1));
}

BOOL vstack_empty(_DWORD *a1)
{
  if (!a1) {
    vstack_empty_cold_1();
  }
  return *a1 == 0;
}

uint64_t vstack_size(unsigned int *a1)
{
  return *a1;
}

void bdz_ph_config_new_cold_1()
{
}

void bmz_new_cold_1()
{
}

void bmz_traverse_cold_1()
{
}

void bmz8_new_cold_1()
{
}

void bmz8_traverse_cold_1()
{
}

void brz_config_set_mphf_fd_cold_1()
{
}

void brz_new_cold_1()
{
}

void brz_new_cold_2()
{
}

void brz_new_cold_3()
{
}

void brz_new_cold_4()
{
}

void brz_load_cold_1()
{
}

void brz_search_cold_1()
{
}

void brz_pack_cold_1()
{
}

void brz_packed_size_cold_1()
{
}

void brz_search_packed_cold_1()
{
}

void chd_ph_config_set_b_cold_1()
{
}

void chd_ph_config_set_keys_per_bin_cold_1()
{
}

void chd_ph_new_cold_1()
{
}

void chm_new_cold_1()
{
}

void cmph_io_nlfile_adapter_cold_1()
{
}

void cmph_io_nlnkfile_adapter_cold_1()
{
}

void cmph_io_vector_new_cold_1()
{
}

void cmph_io_vector_new_cold_2()
{
}

void cmph_io_struct_vector_adapter_cold_1()
{
}

void cmph_io_struct_vector_adapter_cold_2()
{
}

void cmph_config_new_cold_1()
{
}

void cmph_config_set_algo_cold_1()
{
}

void cmph_config_set_algo_cold_2()
{
}

void cmph_config_destroy_cold_1()
{
}

void cmph_new_cold_1()
{
}

void cmph_dump_cold_1()
{
}

void cmph_load_cold_1()
{
}

void cmph_search_cold_1()
{
}

void cmph_destroy_cold_1()
{
}

void cmph_pack_cold_1()
{
}

void cmph_packed_size_cold_1()
{
}

void cmph_search_packed_cold_1()
{
}

void compressed_seq_query_cold_1()
{
}

void fch_buckets_new_cold_1()
{
}

void fch_buckets_new_cold_2()
{
}

void fch_buckets_is_empty_cold_1()
{
}

void fch_buckets_is_empty_cold_2()
{
}

void fch_buckets_insert_cold_1()
{
}

void fch_buckets_insert_cold_2()
{
}

void fch_buckets_insert_cold_3()
{
}

void fch_buckets_insert_cold_4()
{
}

void fch_buckets_get_size_cold_2()
{
}

void fch_buckets_get_key_cold_1()
{
}

void fch_buckets_get_key_cold_2()
{
}

void fch_buckets_get_key_cold_3()
{
}

void fch_buckets_get_keylength_cold_1()
{
}

void fch_buckets_get_keylength_cold_2()
{
}

void fch_buckets_get_keylength_cold_3()
{
}

void fch_buckets_print_cold_1()
{
}

void fch_buckets_destroy_cold_1()
{
}

void graph_add_edge_cold_1()
{
}

void graph_add_edge_cold_2()
{
}

void graph_add_edge_cold_3()
{
}

void graph_add_edge_cold_4()
{
}

void graph_edge_id_cold_1()
{
  __assert_rtn("graph_edge_id", "graph.c", 117, "e != EMPTY");
}

void graph_edge_id_cold_2()
{
  __assert_rtn("graph_edge_id", "graph.c", 122, "e != EMPTY");
}

void del_edge_point_cold_1()
{
  __assert_rtn("del_edge_point", "graph.c", 145, "e != EMPTY");
}

void hash_state_new_cold_1()
{
}

void hash_cold_1()
{
}

void hash_vector_cold_1()
{
}

void hash_state_dump_cold_1()
{
}

void hash_state_copy_cold_1()
{
}

void hash_state_destroy_cold_1()
{
}

void hash_state_pack_cold_1()
{
}

void hash_state_packed_size_cold_1()
{
}

void hash_packed_cold_1()
{
}

void hash_vector_packed_cold_1()
{
}

void vqueue_insert_cold_1()
{
  __assert_rtn("vqueue_insert", "vqueue.c", 29, "(q->end + 1)%q->capacity != q->beg");
}

void vqueue_remove_cold_1()
{
}

void vstack_new_cold_1()
{
}

void vstack_destroy_cold_1()
{
}

void vstack_push_cold_1()
{
}

void vstack_reserve_cold_1()
{
}

void vstack_reserve_cold_2()
{
}

void vstack_pop_cold_1()
{
}

void vstack_pop_cold_2()
{
}

void vstack_top_cold_1()
{
}

void vstack_top_cold_2()
{
}

void vstack_empty_cold_1()
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
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

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

void rewind(FILE *a1)
{
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}