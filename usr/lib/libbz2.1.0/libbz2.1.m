int BZ2_bzBuffToBuffCompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int blockSize100k, int verbosity, int workFactor)
{
  int v7;
  int v12;
  int v13;
  bz_stream v15;

  v7 = -2;
  if (workFactor <= 0xFA
    && verbosity <= 4
    && dest
    && destLen
    && source
    && (blockSize100k - 10) >= 0xFFFFFFF7)
  {
    memset(&v15, 0, 64);
    v12 = workFactor ? workFactor : 30;
    v15.bzfree = 0;
    v15.opaque = 0;
    v7 = BZ2_bzCompressInit(&v15, blockSize100k, verbosity, v12);
    if (!v7)
    {
      v15.next_in = source;
      v15.next_out = dest;
      v15.avail_in = sourceLen;
      v15.avail_out = *destLen;
      v13 = BZ2_bzCompress(&v15, 2);
      if (v13 == 3)
      {
        v7 = -8;
      }
      else
      {
        v7 = v13;
        if (v13 == 4)
        {
          v7 = 0;
          *destLen -= v15.avail_out;
        }
      }
      BZ2_bzCompressEnd(&v15);
    }
  }
  return v7;
}

int BZ2_bzCompressInit(bz_stream *strm, int blockSize100k, int verbosity, int workFactor)
{
  int result = -2;
  if (strm && (blockSize100k - 10) >= 0xFFFFFFF7 && workFactor <= 0xFA)
  {
    if (workFactor) {
      int v8 = workFactor;
    }
    else {
      int v8 = 30;
    }
    bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))strm->bzalloc;
    if (!bzalloc)
    {
      bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))sub_20DB506F0;
      strm->bzalloc = (void *(__cdecl *)(void *, int, int))sub_20DB506F0;
    }
    if (!strm->bzfree) {
      strm->bzfree = (void (__cdecl *)(void *, void *))sub_20DB50704;
    }
    v10 = (bz_stream **)bzalloc(strm->opaque, 55768, 1);
    if (v10)
    {
      v11 = v10;
      *v10 = strm;
      v10[4] = 0;
      v10[5] = 0;
      v10[3] = 0;
      v10[3] = (bz_stream *)((uint64_t (*)(void *, void, uint64_t))strm->bzalloc)(strm->opaque, (400000 * blockSize100k), 1);
      v11[4] = (bz_stream *)((uint64_t (*)(void *, void, uint64_t))strm->bzalloc)(strm->opaque, (400000 * blockSize100k + 136), 1);
      uint64_t v12 = ((uint64_t (*)(void *, uint64_t, uint64_t))strm->bzalloc)(strm->opaque, 262148, 1);
      v11[5] = (bz_stream *)v12;
      v13 = v11[3];
      if (v13)
      {
        v14 = v11[4];
        if (v14 && v12)
        {
          int result = 0;
          *((_DWORD *)v11 + 166) = blockSize100k;
          v11[1] = (bz_stream *)0x200000002;
          *((_DWORD *)v11 + 28) = 100000 * blockSize100k - 19;
          *((_DWORD *)v11 + 164) = verbosity;
          *((_DWORD *)v11 + 22) = v8;
          v11[9] = v13;
          v11[10] = 0;
          v11[7] = v13;
          v11[8] = v14;
          strm->state = v11;
          *(void *)&strm->total_in_lo32 = 0;
          *(void *)&strm->total_out_lo32 = 0;
          *(bz_stream **)((char *)v11 + 92) = (bz_stream *)256;
          *((_DWORD *)v11 + 27) = 0;
          *(bz_stream **)((char *)v11 + 116) = 0;
          v11[81] = (bz_stream *)0xFFFFFFFFLL;
          *((_OWORD *)v11 + 8) = 0u;
          *((_OWORD *)v11 + 9) = 0u;
          *((_OWORD *)v11 + 10) = 0u;
          *((_OWORD *)v11 + 11) = 0u;
          *((_OWORD *)v11 + 12) = 0u;
          *((_OWORD *)v11 + 13) = 0u;
          *((_OWORD *)v11 + 14) = 0u;
          *((_OWORD *)v11 + 15) = 0u;
          *((_OWORD *)v11 + 16) = 0u;
          *((_OWORD *)v11 + 17) = 0u;
          *((_OWORD *)v11 + 18) = 0u;
          *((_OWORD *)v11 + 19) = 0u;
          *((_OWORD *)v11 + 20) = 0u;
          *((_OWORD *)v11 + 21) = 0u;
          *((_OWORD *)v11 + 22) = 0u;
          *((_OWORD *)v11 + 23) = 0u;
          *((_DWORD *)v11 + 165) = 1;
          return result;
        }
        ((void (*)(void *))strm->bzfree)(strm->opaque);
      }
      if (v11[4]) {
        ((void (*)(void *))strm->bzfree)(strm->opaque);
      }
      if (v11[5]) {
        ((void (*)(void *))strm->bzfree)(strm->opaque);
      }
      ((void (*)(void *, bz_stream **))strm->bzfree)(strm->opaque, v11);
    }
    return -3;
  }
  return result;
}

int BZ2_bzCompressEnd(bz_stream *strm)
{
  if (!strm) {
    return -2;
  }
  state = (bz_stream **)strm->state;
  if (!state || *state != strm) {
    return -2;
  }
  if (state[3]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  if (state[4]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  if (state[5]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  ((void (*)(void *, void *))strm->bzfree)(strm->opaque, strm->state);
  int result = 0;
  strm->state = 0;
  return result;
}

int BZ2_bzCompress(bz_stream *strm, int action)
{
  if (!strm) {
    return -2;
  }
  state = (bz_stream **)strm->state;
  if (!state || *state != strm) {
    return -2;
  }
  int v5 = *((_DWORD *)state + 2);
  int result = -1;
  while (v5 == 2)
  {
    if (action == 1)
    {
      int v5 = 3;
    }
    else
    {
      if (action != 2)
      {
        int result = -2;
        if (!action)
        {
          if (sub_20DB50714((uint64_t)strm)) {
            return 1;
          }
          else {
            return -2;
          }
        }
        return result;
      }
      int v5 = 4;
    }
    *((_DWORD *)state + 4) = strm->avail_in;
    *((_DWORD *)state + 2) = v5;
  }
  if (v5 == 1) {
    return result;
  }
  if (v5 != 3)
  {
    if (v5 != 4) {
      return 0;
    }
    if (action == 2 && *((_DWORD *)state + 4) == strm->avail_in && sub_20DB50714((uint64_t)strm))
    {
      if (*((_DWORD *)state + 4)
        || *((_DWORD *)state + 23) <= 0xFFu && *((int *)state + 24) > 0
        || *((_DWORD *)state + 30) < *((_DWORD *)state + 29))
      {
        return 3;
      }
      *((_DWORD *)state + 2) = 1;
      return 4;
    }
    return -1;
  }
  if (action != 1 || *((_DWORD *)state + 4) != strm->avail_in) {
    return -1;
  }
  sub_20DB50714((uint64_t)strm);
  if (*((_DWORD *)state + 4) || *((_DWORD *)state + 23) <= 0xFFu && *((int *)state + 24) > 0) {
    return 2;
  }
  int result = 2;
  if (*((_DWORD *)state + 30) >= *((_DWORD *)state + 29))
  {
    *((_DWORD *)state + 2) = 2;
    return 1;
  }
  return result;
}

void sub_20DB4EC08()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v1 = v0;
  uint64_t v208 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(v0 + 56);
  v3 = *(int **)(v0 + 40);
  uint64_t v4 = *(int *)(v0 + 108);
  int v5 = *(_DWORD *)(v0 + 656);
  if ((int)v4 < 10000)
  {
LABEL_2:
    sub_20DB4FB10(*(void *)(v1 + 24), *(unsigned __int8 **)(v1 + 32), v3, v4, v5);
    goto LABEL_218;
  }
  int v6 = *(_DWORD *)(v0 + 88);
  unint64_t v7 = (v4 + 34) + (unint64_t)(v4 & 1);
  v202 = *(unsigned __int8 **)(v0 + 64);
  int v8 = &v202[v7];
  if (v6 <= 1) {
    int v6 = 1;
  }
  if (v6 >= 0x64) {
    LOBYTE(v6) = 100;
  }
  int v9 = v4 * ((v6 - 1) / 3u);
  v203[0] = v9;
  v10 = (FILE **)MEMORY[0x263EF8348];
  if (v5 >= 4) {
    fwrite("        main sort initialise ...\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  bzero(v3, 0x40004uLL);
  v11 = v202;
  int v12 = *v202;
  unint64_t v13 = (v4 - 1);
  int v182 = v4 - 1;
  do
  {
    unint64_t v14 = v13;
    *(_WORD *)&v8[2 * v13] = 0;
    int v15 = v202[v13];
    ++v3[v12 | (v15 << 8)];
    int v16 = v13 - 2;
    int v17 = v13 - 1;
    *(_WORD *)&v8[2 * v17] = 0;
    int v18 = v202[v17];
    ++v3[v15 | (v18 << 8)];
    *(_WORD *)&v8[2 * v16] = 0;
    int v19 = v202[v16];
    ++v3[v18 | (v19 << 8)];
    *(_WORD *)&v8[2 * --v16] = 0;
    int v12 = v202[v16];
    unsigned int v20 = v19 | (v12 << 8);
    ++v3[v20];
    unint64_t v13 = v14 - 4;
  }
  while (v14 > 6);
  if ((v14 & 0xFFFFFFFC) != 0)
  {
    for (uint64_t i = (v14 - 4); i != -1; --i)
    {
      *(_WORD *)&v202[2 * i + v7] = 0;
      unsigned int v20 = (v202[i] << 8) | (v20 >> 8);
      ++v3[v20];
    }
  }
  for (uint64_t j = 0; j != 34; ++j)
  {
    v202[v4 + j] = v202[j];
    *(_WORD *)&v202[2 * v4 + 2 * j + v7] = 0;
  }
  if (v5 >= 4)
  {
    fwrite("        bucket sorting ...\n", 0x1BuLL, 1uLL, *v10);
    v11 = v202;
  }
  uint64_t v23 = 0;
  v24 = v3 + 1;
  int v25 = *v3;
  do
  {
    v25 += v24[v23];
    v24[v23++] = v25;
  }
  while (v23 != 0x10000);
  int v26 = *v11 << 8;
  int v27 = -1;
  int v28 = 3;
  int v29 = -4;
  int v30 = -3;
  int v31 = -2;
  unint64_t v32 = (v4 - 1);
  do
  {
    HIDWORD(v33) = v11[v32];
    LODWORD(v33) = v26 << 16;
    uint64_t v34 = (unsigned __int16)(v33 >> 24);
    int v35 = v3[v34] - 1;
    v3[v34] = v35;
    *(_DWORD *)(v2 + 4 * v35) = v4 + v27;
    unsigned int v36 = (v33 >> 24) << 16;
    HIDWORD(v33) = v11[(v4 + v31)];
    LODWORD(v33) = v36;
    uint64_t v37 = (unsigned __int16)(v33 >> 24);
    int v38 = v3[v37] - 1;
    v3[v37] = v38;
    *(_DWORD *)(v2 + 4 * v38) = v4 + v31;
    unsigned int v39 = (v33 >> 24) << 16;
    HIDWORD(v33) = v11[(v4 + v30)];
    LODWORD(v33) = v39;
    uint64_t v40 = (unsigned __int16)(v33 >> 24);
    int v41 = v3[v40] - 1;
    v3[v40] = v41;
    *(_DWORD *)(v2 + 4 * v41) = v4 + v30;
    unsigned int v42 = (v33 >> 24) << 16;
    HIDWORD(v33) = v11[(v4 + v29)];
    LODWORD(v33) = v42;
    int v26 = v33 >> 24;
    uint64_t v43 = (unsigned __int16)(v33 >> 24);
    int v44 = v3[v43] - 1;
    v3[v43] = v44;
    *(_DWORD *)(v2 + 4 * v44) = v4 + v29;
    v27 -= 4;
    v28 -= 4;
    v29 -= 4;
    v30 -= 4;
    v31 -= 4;
    BOOL v82 = v32 > 6;
    v32 -= 4;
  }
  while (v82);
  if ((int)v4 + v28 >= 4)
  {
    uint64_t v45 = (v4 + v27);
    for (uint64_t k = v45; k != -1; --k)
    {
      HIDWORD(v47) = v11[k];
      LODWORD(v47) = v26 << 16;
      int v26 = v47 >> 24;
      uint64_t v48 = (unsigned __int16)(v47 >> 24);
      int v49 = v3[v48] - 1;
      v3[v48] = v49;
      *(_DWORD *)(v2 + 4 * v49) = v45;
      LODWORD(v45) = v45 - 1;
    }
  }
  uint64_t v50 = 0;
  memset(v204, 0, 256);
  int32x4_t v51 = (int32x4_t)xmmword_20DB59100;
  v52.i64[0] = 0x400000004;
  v52.i64[1] = 0x400000004;
  do
  {
    *(int32x4_t *)&v204[v50 + 264] = v51;
    int32x4_t v51 = vaddq_s32(v51, v52);
    v50 += 16;
  }
  while (v50 != 1024);
  int v53 = 364;
  do
  {
    int v54 = v53 / 3;
    if (v53 <= 767)
    {
      int v55 = 0;
      uint64_t v56 = v54;
      if (v54 <= 255) {
        int v57 = 255;
      }
      else {
        int v57 = v53 / 3;
      }
      uint64_t v58 = (v57 + 1);
      do
      {
        int v59 = *(_DWORD *)&v204[4 * v56 + 264];
        unsigned int v60 = v3[256 * v59 + 256] - v3[256 * v59];
        int v61 = v55;
        while (1)
        {
          int v62 = *(_DWORD *)&v204[4 * v61 + 264];
          if (v3[256 * v62 + 256] - v3[256 * v62] <= v60) {
            break;
          }
          uint64_t v63 = v61;
          *(_DWORD *)&v204[4 * v54 + 264 + 4 * v61] = v62;
          BOOL v64 = __OFSUB__(v61, v54);
          v61 -= v54;
          if (v61 < 0 != v64) {
            goto LABEL_39;
          }
        }
        uint64_t v63 = v54 + v61;
LABEL_39:
        *(_DWORD *)&v204[4 * v63 + 264] = v59;
        ++v56;
        ++v55;
      }
      while (v56 != v58);
    }
    unsigned int v65 = v53 - 3;
    v53 /= 3;
  }
  while (v65 > 2);
  unint64_t v66 = 0;
  int v178 = 0;
  int v67 = v9;
  uint64_t v181 = v1;
  int v180 = v5;
  int v183 = v9;
  uint64_t v201 = (uint64_t)v8;
  while (2)
  {
    uint64_t v68 = 0;
    uint64_t v69 = *(unsigned int *)&v204[4 * v66 + 264];
    uint64_t v190 = (int)v69;
    uint64_t v70 = (int)(v69 << 8);
    unint64_t v175 = v66;
    uint64_t v179 = v70;
    do
    {
      if (v68 != v69)
      {
        uint64_t v71 = v68 + v70;
        int v72 = v3[v68 + v70];
        if ((v72 & 0x200000) == 0)
        {
          uint64_t v185 = v68 + v70;
          unsigned int v73 = v3[v71 + 1] & 0xFFDFFFFF;
          unsigned int v187 = v72 & 0xFFDFFFFF;
          unsigned int v184 = v73 - 1;
          if ((int)(v73 - 1) > (int)(v72 & 0xFFDFFFFF))
          {
            uint64_t v176 = v69;
            uint64_t v177 = v68;
            v74 = (FILE **)MEMORY[0x263EF8348];
            if (v5 >= 4)
            {
              fprintf((FILE *)*MEMORY[0x263EF8348], "        qsort [0x%x, 0x%x]   done %d   this %d\n", v69, v68, v178, v73 - v187);
              v11 = v202;
            }
            v207[0] = v187;
            v206[0] = v184;
            unsigned int v75 = 1;
            v205[0] = 2;
            while (2)
            {
              for (uint64_t m = v75 - 1; ; v205[m] = v80 + 1)
              {
                if (v75 >= 0x62) {
                  sub_20DB50680(1001);
                }
                int v77 = v207[m];
                int v78 = v206[m];
                uint64_t v79 = v78;
                int v80 = v205[m];
                int v81 = v78 - v77;
                BOOL v82 = v78 - v77 >= 20 && v80 < 15;
                if (!v82) {
                  break;
                }
                unsigned int v83 = v11[*(_DWORD *)(v2 + 4 * v77) + v80];
                unsigned int v84 = v11[*(_DWORD *)(v2 + 4 * v78) + v80];
                unsigned int v85 = v11[*(_DWORD *)(v2 + 4 * ((v78 + v77) >> 1)) + v80];
                if (v83 <= v84) {
                  unsigned int v86 = v11[*(_DWORD *)(v2 + 4 * v78) + v80];
                }
                else {
                  unsigned int v86 = v11[*(_DWORD *)(v2 + 4 * v77) + v80];
                }
                if (v83 >= v84) {
                  unsigned int v83 = v11[*(_DWORD *)(v2 + 4 * v78) + v80];
                }
                if (v83 <= v85) {
                  unsigned int v83 = v11[*(_DWORD *)(v2 + 4 * ((v78 + v77) >> 1)) + v80];
                }
                if (v86 <= v85) {
                  unsigned int v87 = v86;
                }
                else {
                  unsigned int v87 = v83;
                }
                LODWORD(v88) = v206[m];
                LODWORD(v89) = v207[m];
                int v90 = v88;
                int v91 = v89;
LABEL_68:
                if (v91 <= v90)
                {
                  uint64_t v89 = (int)v89;
                  do
                  {
                    if (v91 <= v90) {
                      int v92 = v90;
                    }
                    else {
                      int v92 = v91;
                    }
                    v93 = (int *)(v2 + 4 * v91);
                    uint64_t v94 = v92 - (uint64_t)v91 + 1;
                    while (1)
                    {
                      int v95 = *v93;
                      unsigned int v96 = v11[*v93 + v80];
                      if (v96 == v87) {
                        break;
                      }
                      if (v96 > v87) {
                        goto LABEL_81;
                      }
                      ++v91;
                      ++v93;
                      if (!--v94)
                      {
                        int v91 = v92 + 1;
                        goto LABEL_81;
                      }
                    }
                    int *v93 = *(_DWORD *)(v2 + 4 * v89);
                    *(_DWORD *)(v2 + 4 * v89++) = v95;
                    int v97 = v91 + 1;
                    BOOL v82 = v90 <= v91++;
                  }
                  while (!v82);
                  int v91 = v97;
                }
LABEL_81:
                if (v91 <= v90)
                {
                  uint64_t v88 = (int)v88;
                  while (2)
                  {
                    uint64_t v98 = v90;
                    while (1)
                    {
                      int v99 = *(_DWORD *)(v2 + 4 * v98);
                      unsigned int v100 = v11[v99 + v80];
                      if (v100 == v87) {
                        break;
                      }
                      if (v100 < v87)
                      {
                        int v101 = *(_DWORD *)(v2 + 4 * v91);
                        *(_DWORD *)(v2 + 4 * v91) = v99;
                        *(_DWORD *)(v2 + 4 * v98) = v101;
                        ++v91;
                        int v90 = v98 - 1;
                        goto LABEL_68;
                      }
                      BOOL v82 = v98-- <= v91;
                      if (v82)
                      {
                        if (v90 >= (uint64_t)v91) {
                          int v90 = v91;
                        }
                        --v90;
                        goto LABEL_95;
                      }
                    }
                    *(_DWORD *)(v2 + 4 * v98) = *(_DWORD *)(v2 + 4 * v88);
                    *(_DWORD *)(v2 + 4 * v88--) = v99;
                    int v90 = v98 - 1;
                    if (v91 < (int)v98) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_95:
                if ((int)v88 >= (int)v89)
                {
                  int v121 = v91 - v89;
                  if ((int)v89 - v77 < v91 - (int)v89) {
                    int v121 = v89 - v77;
                  }
                  if (v121 >= 1)
                  {
                    v122 = (int *)(v2 + 4 * v77);
                    v123 = (int *)(v2 + 4 * (v91 - v121));
                    unsigned int v124 = v121 + 1;
                    do
                    {
                      int v125 = *v122;
                      *v122++ = *v123;
                      *v123++ = v125;
                      --v124;
                    }
                    while (v124 > 1);
                  }
                  int v126 = v78 - v88;
                  int v127 = v88 - v90;
                  if (v78 - (int)v88 >= (int)v88 - v90) {
                    int v126 = v88 - v90;
                  }
                  if (v126 >= 1)
                  {
                    v128 = (int *)(v2 + 4 * v91);
                    v129 = (int *)(v2 + 4 + 4 * (v78 - v126));
                    unsigned int v130 = v126 + 1;
                    do
                    {
                      int v131 = *v128;
                      *v128++ = *v129;
                      *v129++ = v131;
                      --v130;
                    }
                    while (v130 > 1);
                  }
                  int v132 = v77 - v89 + v91;
                  int v133 = v78 - v127;
                  int v134 = v132 - 1 - v77;
                  int v135 = v78 - (v133 + 1);
                  BOOL v136 = v134 < v135;
                  if (v134 >= v135)
                  {
                    int v137 = v133 + 1;
                  }
                  else
                  {
                    int v135 = v132 - 1 - v77;
                    int v137 = v77;
                  }
                  if (v136) {
                    int v138 = v133 + 1;
                  }
                  else {
                    int v138 = v77;
                  }
                  if (v136) {
                    int v139 = v132 - 1;
                  }
                  else {
                    int v139 = v78;
                  }
                  if (!v136) {
                    int v78 = v132 - 1;
                  }
                  int v140 = v133 - v132;
                  BOOL v141 = v135 < v133 - v132;
                  if (v135 < v133 - v132)
                  {
                    int v142 = v137;
                  }
                  else
                  {
                    int v140 = v135;
                    int v142 = v132;
                  }
                  if (v141)
                  {
                    int v143 = v139;
                  }
                  else
                  {
                    int v132 = v137;
                    int v143 = v133;
                  }
                  if (v141)
                  {
                    int v144 = v80;
                  }
                  else
                  {
                    int v133 = v139;
                    int v144 = v80 + 1;
                  }
                  if (v141) {
                    int v145 = v80 + 1;
                  }
                  else {
                    int v145 = v80;
                  }
                  BOOL v146 = v78 - v138 < v140;
                  if (v78 - v138 < v140) {
                    int v147 = v132;
                  }
                  else {
                    int v147 = v138;
                  }
                  if (v146) {
                    int v148 = v133;
                  }
                  else {
                    int v148 = v78;
                  }
                  v207[m] = v147;
                  v206[m] = v148;
                  if (v146) {
                    int v132 = v138;
                  }
                  if (v146) {
                    int v149 = v145;
                  }
                  else {
                    int v149 = v80;
                  }
                  v205[m] = v149;
                  v207[v75] = v132;
                  if (v146)
                  {
                    int v150 = v80;
                  }
                  else
                  {
                    int v78 = v133;
                    int v150 = v145;
                  }
                  v206[v75] = v78;
                  v205[v75] = v150;
                  uint64_t v151 = 4 * (int)v75 + 4;
                  *(_DWORD *)((char *)v207 + v151) = v142;
                  *(_DWORD *)((char *)v206 + v151) = v143;
                  *(_DWORD *)((char *)v205 + v151) = v144;
                  LODWORD(m) = v75 + 2;
                  goto LABEL_176;
                }
              }
              if (v81 >= 1)
              {
                uint64_t v102 = 0;
                do
                  int v103 = dword_20DB59110[v102++];
                while (v103 <= v81);
                uint64_t v104 = v102 - 1;
                if (v104)
                {
                  uint64_t v105 = v4;
                  int v188 = v77 + 2;
                  int v189 = v77 + 1;
                  int v186 = v207[m];
                  uint64_t v197 = v79;
                  do
                  {
                    uint64_t v191 = v104;
                    uint64_t v192 = v104 - 1;
                    int v106 = dword_20DB59110[(v104 - 1)];
                    int v107 = v106 + v77;
                    int v196 = v188;
                    int v198 = v189;
                    int v199 = v77;
                    uint64_t v108 = v106 + v77;
                    while (v108 <= v79)
                    {
                      uint64_t v200 = v108;
                      int v193 = *(_DWORD *)(v2 + 4 * v108);
                      int v109 = v199;
                      while (1)
                      {
                        int v110 = v106 + v109;
                        int v111 = *(_DWORD *)(v2 + 4 * v109);
                        if (!sub_20DB503D4(v111 + v80, v193 + v80, (uint64_t)v11, v201, v105, v203)) {
                          break;
                        }
                        uint64_t v112 = v109;
                        *(_DWORD *)(v2 + 4 * v110) = v111;
                        v109 -= v106;
                        v11 = v202;
                        if ((int)v112 < v107) {
                          goto LABEL_109;
                        }
                      }
                      uint64_t v112 = v110;
                      v11 = v202;
LABEL_109:
                      *(_DWORD *)(v2 + 4 * v112) = v193;
                      uint64_t v79 = v197;
                      if (v200 >= v197) {
                        break;
                      }
                      int v194 = *(_DWORD *)(v2 + 4 * v200 + 4);
                      int v113 = v198;
                      while (1)
                      {
                        int v114 = v106 + v113;
                        int v115 = *(_DWORD *)(v2 + 4 * v113);
                        if (!sub_20DB503D4(v115 + v80, v194 + v80, (uint64_t)v11, v201, v105, v203)) {
                          break;
                        }
                        uint64_t v116 = v113;
                        *(_DWORD *)(v2 + 4 * v114) = v115;
                        v113 -= v106;
                        v11 = v202;
                        if ((int)v116 < v107) {
                          goto LABEL_115;
                        }
                      }
                      uint64_t v116 = v114;
                      v11 = v202;
LABEL_115:
                      *(_DWORD *)(v2 + 4 * v116) = v194;
                      uint64_t v79 = v197;
                      if (v200 + 2 > v197) {
                        break;
                      }
                      int v195 = *(_DWORD *)(v2 + 4 * (v200 + 2));
                      int v117 = v196;
                      while (1)
                      {
                        int v118 = v106 + v117;
                        int v119 = *(_DWORD *)(v2 + 4 * v117);
                        if (!sub_20DB503D4(v119 + v80, v195 + v80, (uint64_t)v11, v201, v105, v203)) {
                          break;
                        }
                        uint64_t v120 = v117;
                        *(_DWORD *)(v2 + 4 * v118) = v119;
                        v117 -= v106;
                        v11 = v202;
                        if ((int)v120 < v107) {
                          goto LABEL_121;
                        }
                      }
                      uint64_t v120 = v118;
                      v11 = v202;
LABEL_121:
                      *(_DWORD *)(v2 + 4 * v120) = v195;
                      uint64_t v108 = v200 + 3;
                      int v67 = v203[0];
                      v198 += 3;
                      v199 += 3;
                      v196 += 3;
                      uint64_t v79 = v197;
                      if ((v203[0] & 0x80000000) != 0)
                      {
                        uint64_t v1 = v181;
                        LODWORD(v4) = v105;
                        int v5 = v180;
                        v74 = (FILE **)MEMORY[0x263EF8348];
                        goto LABEL_214;
                      }
                    }
                    int v77 = v186;
                    uint64_t v104 = v192;
                  }
                  while (v191 > 1);
                  int v67 = v203[0];
                  uint64_t v1 = v181;
                  uint64_t v4 = v105;
                  int v5 = v180;
                  v74 = (FILE **)MEMORY[0x263EF8348];
                  LODWORD(m) = v75 - 1;
                }
              }
              if (v67 < 0) {
                goto LABEL_214;
              }
LABEL_176:
              unsigned int v75 = m;
              if ((int)m > 0) {
                continue;
              }
              break;
            }
            if ((v67 & 0x80000000) == 0)
            {
              uint64_t v70 = v179;
              int v178 = v178 - v187 + v184 + 1;
              uint64_t v71 = v185;
              int v72 = v3[v185];
              int v9 = v183;
              int v8 = (unsigned __int8 *)v201;
              uint64_t v69 = v176;
              uint64_t v68 = v177;
              goto LABEL_180;
            }
LABEL_214:
            int v9 = v183;
            goto LABEL_215;
          }
          uint64_t v71 = v68 + v70;
        }
LABEL_180:
        v3[v71] = v72 | 0x200000;
      }
      ++v68;
    }
    while (v68 != 256);
    if (v204[v190]) {
      sub_20DB50680(1006);
    }
    uint64_t v152 = 0;
    v153 = &v3[v190 + 1];
    do
    {
      v203[v152 + 257] = *(v153 - 1) & 0xFFDFFFFF;
      v203[++v152] = (*v153 & 0xFFDFFFFF) - 1;
      v153 += 256;
    }
    while (v152 != 256);
    int64_t v154 = v3[v179] & 0xFFFFFFFFFFDFFFFFLL;
    int v155 = v203[v190 + 257];
    v11 = v202;
    if ((int)v154 < v155)
    {
      do
      {
        int v156 = (v4 & ((*(_DWORD *)(v2 + 4 * v154) - 1) >> 31)) + *(_DWORD *)(v2 + 4 * v154) - 1;
        uint64_t v157 = v202[v156];
        if (!v204[v157])
        {
          uint64_t v158 = (int)v203[v157 + 257];
          v203[v157 + 257] = v158 + 1;
          *(_DWORD *)(v2 + 4 * v158) = v156;
          int v155 = v203[v190 + 257];
        }
        ++v154;
      }
      while (v154 < v155);
    }
    LODWORD(v159) = (v3[(int)v179 + 256] & 0xFFDFFFFF) - 1;
    int v160 = v203[v190 + 1];
    if ((int)v159 > v160)
    {
      uint64_t v159 = (int)v159;
      do
      {
        int v161 = (v4 & ((*(_DWORD *)(v2 + 4 * v159) - 1) >> 31)) + *(_DWORD *)(v2 + 4 * v159) - 1;
        uint64_t v162 = v202[v161];
        if (!v204[v162])
        {
          uint64_t v163 = (int)v203[v162 + 1];
          v203[v162 + 1] = v163 - 1;
          *(_DWORD *)(v2 + 4 * v163) = v161;
          int v160 = v203[v190 + 1];
        }
        --v159;
      }
      while (v159 > v160);
    }
    if (v155 - 1 != v160 && (v155 || v160 != v182)) {
      sub_20DB50680(1007);
    }
    for (uint64_t n = 0; n != 0x10000; n += 256)
      v3[v190 + n] |= 0x200000u;
    v204[v190] = 1;
    if (v175 <= 0xFE)
    {
      uint64_t v165 = v3[v179];
      unint64_t v166 = v165 & 0xFFFFFFFFFFDFFFFFLL;
      uint64_t v167 = (v3[(int)v179 + 256] & 0xFFDFFFFF) - (v165 & 0xFFDFFFFF);
      int v168 = -1;
      do
        ++v168;
      while ((int)v167 >> v168 > 65534);
      int v169 = v167 - 1;
      if ((int)v167 >= 1)
      {
        uint64_t v170 = v2 - 4 + 4 * v166;
        do
        {
          uint64_t v171 = v167 - 1;
          uint64_t v172 = *(int *)(v170 + 4 * v167);
          *(_WORD *)&v8[2 * v172] = v171 >> v168;
          if ((int)v172 <= 33) {
            *(_WORD *)&v8[2 * (int)v172 + 2 * (int)v4] = v171 >> v168;
          }
          uint64_t v167 = v171;
        }
        while ((unint64_t)(v171 + 1) > 1);
      }
      if (v169 >> v168 >= 0x10000) {
        sub_20DB50680(1002);
      }
    }
    unint64_t v66 = v175 + 1;
    if (v175 != 255) {
      continue;
    }
    break;
  }
  v74 = (FILE **)MEMORY[0x263EF8348];
  if (v5 > 3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "        %d pointers, %d sorted, %d scanned\n", v4, v178, v4 - v178);
    goto LABEL_216;
  }
LABEL_215:
  if (v5 < 3) {
    goto LABEL_217;
  }
LABEL_216:
  fprintf(*v74, "      %d work, %d block, ratio %5.2f\n", v9 - v67, v4, (float)((float)(v9 - v67) / (float)(int)v4));
LABEL_217:
  if (v67 < 0)
  {
    if (v5 >= 2) {
      fwrite("    too repetitive; using fallback sorting algorithm\n", 0x35uLL, 1uLL, *v74);
    }
    goto LABEL_2;
  }
LABEL_218:
  *(_DWORD *)(v1 + 48) = -1;
  uint64_t v173 = *(unsigned int *)(v1 + 108);
  if ((int)v173 < 1)
  {
LABEL_222:
    sub_20DB50680(1003);
  }
  uint64_t v174 = 0;
  while (*(_DWORD *)(v2 + 4 * v174))
  {
    if (v173 == ++v174) {
      goto LABEL_222;
    }
  }
  *(_DWORD *)(v1 + 48) = v174;
}

void sub_20DB4FB10(uint64_t a1, unsigned __int8 *a2, void *a3, int a4, int a5)
{
  int v5 = a5;
  uint64_t v115 = *MEMORY[0x263EF8340];
  if (a5 >= 4) {
    fwrite("        bucket sorting ...\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  uint64_t v10 = a4;
  bzero(__src, 0x404uLL);
  int v109 = a4;
  if (a4 < 1)
  {
    int v14 = 0;
  }
  else
  {
    uint64_t v11 = a4;
    int v12 = a2;
    do
    {
      int v13 = *v12++;
      ++__src[v13];
      --v11;
    }
    while (v11);
    int v14 = __src[0];
  }
  memcpy(__dst, __src, sizeof(__dst));
  for (uint64_t i = 1; i != 257; ++i)
  {
    v14 += __src[i];
    __src[i] = v14;
  }
  if (a4 >= 1)
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = a2[v16];
      uint64_t v18 = (int)__src[v17] - 1;
      __src[v17] = v18;
      *(_DWORD *)(a1 + 4 * v18) = v16++;
    }
    while (a4 != v16);
  }
  if (a4 >= -63) {
    bzero(a3, 4 * (a4 / 32 + 1) + 4);
  }
  for (uint64_t j = 0; j != 256; ++j)
    *((_DWORD *)a3 + ((int)__src[j] >> 5)) |= 1 << __src[j];
  for (int k = 0; k != 64; k += 2)
  {
    *((_DWORD *)a3 + ((a4 + k) >> 5)) |= 1 << (a4 + k);
    *((_DWORD *)a3 + ((a4 + k + 1) >> 5)) &= ~(1 << (a4 + k + 1));
  }
  int v21 = 1;
  uint64_t v107 = a4;
  int v106 = v5;
  do
  {
    while (1)
    {
      if (v5 >= 4) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "        depth %6d has ", v21);
      }
      if (a4 >= 1)
      {
        uint64_t v22 = 0;
        int v23 = 0;
        do
        {
          if ((*((_DWORD *)a3 + (v22 >> 5)) >> v22)) {
            int v23 = v22;
          }
          *(_DWORD *)&a2[4 * (int)((v10 & ((*(_DWORD *)(a1 + 4 * v22) - v21) >> 31)) + *(_DWORD *)(a1 + 4 * v22) - v21)] = v23;
          ++v22;
        }
        while (v10 != v22);
      }
      int v108 = v21;
      int v24 = 0;
      int v25 = 0;
      while (1)
      {
        int v26 = v24 - 32;
        int v27 = v24 - 1;
        do
        {
          int v28 = v26;
          int v29 = v27;
          int v30 = (1 << v24) & *((_DWORD *)a3 + (v24 >> 5));
          BOOL v31 = (v24++ & 0x1F) == 0;
          if (v31) {
            break;
          }
          ++v26;
          ++v27;
        }
        while (v30);
        if (v30)
        {
          do
          {
            int v32 = v29;
            v28 += 32;
            v29 += 32;
          }
          while (*((_DWORD *)a3 + (v28 >> 5)) == -1);
          do
            ++v32;
          while (((*((_DWORD *)a3 + (v32 >> 5)) >> v32) & 1) != 0);
        }
        else
        {
          int v32 = v24 - 1;
        }
        if (v32 > a4) {
          break;
        }
        int v33 = v32 - 1;
        int v34 = v32 - 32;
        int v35 = v32 - 1;
        int v36 = v32;
        do
        {
          int v37 = v34;
          int v38 = v35;
          int v39 = (1 << v36) & *((_DWORD *)a3 + (v36 >> 5));
          BOOL v31 = (v36++ & 0x1F) == 0;
          if (v31) {
            break;
          }
          ++v34;
          ++v35;
        }
        while (!v39);
        if (v39)
        {
          int v24 = v36 - 1;
        }
        else
        {
          do
          {
            int v24 = v38;
            v37 += 32;
            v38 += 32;
          }
          while (!*((_DWORD *)a3 + (v37 >> 5)));
          do
            ++v24;
          while (((*((_DWORD *)a3 + (v24 >> 5)) >> v24) & 1) == 0);
        }
        if (v24 > a4) {
          break;
        }
        if (v24 > v32)
        {
          LOWORD(v40) = 0;
          int v110 = v25 - v32 + v24 - 1 + 2;
          v114[0] = v32 - 1;
          v113[0] = v24 - 1;
          uint64_t v41 = 1;
          do
          {
            unint64_t v42 = v41;
            while (1)
            {
              if (v42 >= 0x63) {
                sub_20DB50680(1004);
              }
              int v43 = v114[(v42 - 1)];
              uint64_t v44 = v43;
              int v45 = v113[(v42 - 1)];
              if (v45 - v43 > 9) {
                break;
              }
              if (v45 != v43)
              {
                int v46 = v45 - 4;
                BOOL v47 = v45 - v43 < 4 || v46 < v43;
                if (!v47)
                {
                  uint64_t v48 = v46;
                  uint64_t v49 = v45;
                  uint64_t v50 = a1 + 4 * v45;
                  do
                  {
                    uint64_t v51 = *(int *)(a1 + 4 * v48);
                    int v52 = v48;
                    if (v48 <= v45 - 4)
                    {
                      uint64_t v53 = 0;
                      unsigned int v54 = *(_DWORD *)&a2[4 * v51];
                      do
                      {
                        uint64_t v55 = *(unsigned int *)(v50 + 4 * v53);
                        if (v54 <= *(_DWORD *)&a2[4 * v55]) {
                          break;
                        }
                        *(_DWORD *)(a1 + 4 * (v46 + (int)v53)) = v55;
                        v53 += 4;
                      }
                      while (v49 + v53 <= v45);
                      int v52 = v46 + v53;
                    }
                    *(_DWORD *)(a1 + 4 * v52) = v51;
                    --v49;
                    --v46;
                    v50 -= 4;
                    BOOL v47 = v48-- <= v43;
                  }
                  while (!v47);
                }
                if (v45 > v43)
                {
                  int v56 = 0;
                  uint64_t v57 = v45;
                  uint64_t v58 = (int *)(a1 + 4 * v45);
                  do
                  {
                    uint64_t v59 = v57--;
                    uint64_t v60 = *(int *)(a1 + 4 * v57);
                    if (v59 <= v45)
                    {
                      unsigned int v61 = *(_DWORD *)&a2[4 * v60];
                      int v62 = v58;
                      int v63 = v56;
                      BOOL v64 = v58;
                      while (1)
                      {
                        int v66 = *v64++;
                        int v65 = v66;
                        if (v61 <= *(_DWORD *)&a2[4 * v66]) {
                          break;
                        }
                        *(v62 - 1) = v65;
                        --v63;
                        int v62 = v64;
                        if (v63 == -1)
                        {
                          LODWORD(v59) = v45 + 1;
                          goto LABEL_72;
                        }
                      }
                      LODWORD(v59) = v45 - v63;
                    }
LABEL_72:
                    *(_DWORD *)(a1 + 4 * ((int)v59 - 1)) = v60;
                    ++v56;
                    --v58;
                  }
                  while (v57 > v44);
                }
              }
              BOOL v47 = (int)v42-- <= 1;
              if (v47) {
                goto LABEL_124;
              }
            }
            int v40 = (7621 * (_WORD)v40 + 1) & 0x7FFF;
            int v67 = v114[(v42 - 1)];
            if ((_WORD)v40 != 3 * ((21846 * v40) >> 16))
            {
              if ((unsigned __int16)(v40 - 3 * ((21846 * v40) >> 16)) == 1) {
                int v67 = (v45 + v43) >> 1;
              }
              else {
                int v67 = v113[(v42 - 1)];
              }
            }
            uint64_t v41 = (v42 - 1);
            int v68 = *(_DWORD *)&a2[4 * *(unsigned int *)(a1 + 4 * v67)];
            LODWORD(v69) = v113[v41];
            LODWORD(v70) = v114[v41];
            int v71 = v69;
            int v72 = v70;
LABEL_81:
            if (v72 <= v71)
            {
              uint64_t v70 = (int)v70;
              do
              {
                if (v72 <= v71) {
                  int v73 = v71;
                }
                else {
                  int v73 = v72;
                }
                v74 = (_DWORD *)(a1 + 4 * v72);
                uint64_t v75 = v73 - (uint64_t)v72 + 1;
                while (1)
                {
                  uint64_t v76 = *v74;
                  int v77 = *(_DWORD *)&a2[4 * v76];
                  if (v77 == v68) {
                    break;
                  }
                  if (v77 > v68) {
                    goto LABEL_94;
                  }
                  ++v72;
                  ++v74;
                  if (!--v75)
                  {
                    int v72 = v73 + 1;
                    goto LABEL_94;
                  }
                }
                _DWORD *v74 = *(_DWORD *)(a1 + 4 * v70);
                *(_DWORD *)(a1 + 4 * v70++) = v76;
                int v78 = v72 + 1;
                BOOL v47 = v71 <= v72++;
              }
              while (!v47);
              int v72 = v78;
            }
LABEL_94:
            if (v72 <= v71)
            {
              uint64_t v69 = (int)v69;
              while (2)
              {
                uint64_t v79 = v71;
                while (1)
                {
                  uint64_t v80 = *(unsigned int *)(a1 + 4 * v79);
                  int v81 = *(_DWORD *)&a2[4 * v80];
                  if (v81 == v68) {
                    break;
                  }
                  if (v81 < v68)
                  {
                    int v82 = *(_DWORD *)(a1 + 4 * v72);
                    *(_DWORD *)(a1 + 4 * v72) = v80;
                    *(_DWORD *)(a1 + 4 * v79) = v82;
                    ++v72;
                    int v71 = v79 - 1;
                    goto LABEL_81;
                  }
                  BOOL v47 = v79-- <= v72;
                  if (v47)
                  {
                    if (v71 >= (uint64_t)v72) {
                      int v71 = v72;
                    }
                    --v71;
                    goto LABEL_108;
                  }
                }
                *(_DWORD *)(a1 + 4 * v79) = *(_DWORD *)(a1 + 4 * v69);
                *(_DWORD *)(a1 + 4 * v69--) = v80;
                int v71 = v79 - 1;
                if (v72 < (int)v79) {
                  continue;
                }
                break;
              }
            }
LABEL_108:
            if ((int)v69 >= (int)v70)
            {
              int v83 = v72 - v70;
              if ((int)v70 - v43 < v72 - (int)v70) {
                int v83 = v70 - v43;
              }
              if (v83 >= 1)
              {
                unsigned int v84 = (int *)(a1 + 4 * v43);
                unsigned int v85 = (int *)(a1 + 4 * (v72 - v83));
                unsigned int v86 = v83 + 1;
                do
                {
                  int v87 = *v84;
                  *v84++ = *v85;
                  *v85++ = v87;
                  --v86;
                }
                while (v86 > 1);
              }
              int v88 = v45 - v69;
              int v89 = v69 - v71;
              if (v45 - (int)v69 >= (int)v69 - v71) {
                int v88 = v69 - v71;
              }
              if (v88 >= 1)
              {
                int v90 = (int *)(a1 + 4 * v72);
                int v91 = (int *)(a1 + 4 + 4 * (v45 - v88));
                unsigned int v92 = v88 + 1;
                do
                {
                  int v93 = *v90;
                  *v90++ = *v91;
                  *v91++ = v93;
                  --v92;
                }
                while (v92 > 1);
              }
              int v94 = v43 + ~v70 + v72;
              int v95 = v45 - v89 + 1;
              if (v94 - v43 <= v45 - v95)
              {
                v114[v41] = v95;
                int v95 = v43;
                int v45 = v94;
              }
              else
              {
                v113[v41] = v94;
              }
              v114[v42] = v95;
              v113[v42] = v45;
              uint64_t v41 = v42 + 1;
            }
          }
          while ((int)v41 > 0);
LABEL_124:
          unsigned int v96 = (int *)(a1 + 4 * v33);
          int v97 = -1;
          a4 = v109;
          int v25 = v110;
          do
          {
            int v98 = *v96++;
            int v99 = *(_DWORD *)&a2[4 * v98];
            if (v97 != v99)
            {
              *((_DWORD *)a3 + (v33 >> 5)) |= 1 << v33;
              int v97 = v99;
            }
            ++v33;
          }
          while (v24 != v33);
        }
      }
      int v21 = 2 * v108;
      int v5 = v106;
      if (v106 >= 4) {
        break;
      }
      uint64_t v10 = v107;
      if (v21 > a4 || !v25) {
        goto LABEL_137;
      }
    }
    int v100 = v25;
    fprintf((FILE *)*MEMORY[0x263EF8348], "%6d unresolved strings\n", v25);
    int v101 = v100;
    uint64_t v10 = v107;
  }
  while (v21 <= a4 && v101);
  fwrite("        reconstructing block ...\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
LABEL_137:
  if (a4 >= 1)
  {
    uint64_t v102 = 0;
    LODWORD(v103) = 0;
    do
    {
      uint64_t v103 = (int)v103;
      int v104 = v103 - 1;
      do
      {
        int v105 = __dst[v103++];
        ++v104;
      }
      while (!v105);
      __dst[v103 - 1] = v105 - 1;
      LODWORD(v103) = v103 - 1;
      a2[*(unsigned int *)(a1 + 4 * v102++)] = v103;
    }
    while (v102 != v10);
    if (v104 >= 256)
    {
      sub_20DB50680(1005);
    }
  }
}

BOOL sub_20DB503D4(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6)
{
  unsigned int v6 = *(unsigned __int8 *)(a3 + a1);
  unsigned int v7 = *(unsigned __int8 *)(a3 + a2);
  BOOL v8 = v6 > v7;
  if (v6 == v7)
  {
    unsigned int v9 = *(unsigned __int8 *)(a3 + a1 + 1);
    unsigned int v10 = *(unsigned __int8 *)(a3 + a2 + 1);
    BOOL v8 = v9 > v10;
    if (v9 == v10)
    {
      unsigned int v11 = *(unsigned __int8 *)(a3 + a1 + 2);
      unsigned int v12 = *(unsigned __int8 *)(a3 + a2 + 2);
      BOOL v8 = v11 > v12;
      if (v11 == v12)
      {
        unsigned int v13 = *(unsigned __int8 *)(a3 + a1 + 3);
        unsigned int v14 = *(unsigned __int8 *)(a3 + a2 + 3);
        BOOL v8 = v13 > v14;
        if (v13 == v14)
        {
          unsigned int v15 = *(unsigned __int8 *)(a3 + a1 + 4);
          unsigned int v16 = *(unsigned __int8 *)(a3 + a2 + 4);
          BOOL v8 = v15 > v16;
          if (v15 == v16)
          {
            unsigned int v17 = *(unsigned __int8 *)(a3 + a1 + 5);
            unsigned int v18 = *(unsigned __int8 *)(a3 + a2 + 5);
            BOOL v8 = v17 > v18;
            if (v17 == v18)
            {
              unsigned int v19 = *(unsigned __int8 *)(a3 + a1 + 6);
              unsigned int v20 = *(unsigned __int8 *)(a3 + a2 + 6);
              BOOL v8 = v19 > v20;
              if (v19 == v20)
              {
                unsigned int v21 = *(unsigned __int8 *)(a3 + a1 + 7);
                unsigned int v22 = *(unsigned __int8 *)(a3 + a2 + 7);
                BOOL v8 = v21 > v22;
                if (v21 == v22)
                {
                  unsigned int v23 = *(unsigned __int8 *)(a3 + a1 + 8);
                  unsigned int v24 = *(unsigned __int8 *)(a3 + a2 + 8);
                  BOOL v8 = v23 > v24;
                  if (v23 == v24)
                  {
                    unsigned int v25 = *(unsigned __int8 *)(a3 + a1 + 9);
                    unsigned int v26 = *(unsigned __int8 *)(a3 + a2 + 9);
                    BOOL v8 = v25 > v26;
                    if (v25 == v26)
                    {
                      unsigned int v27 = *(unsigned __int8 *)(a3 + a1 + 10);
                      unsigned int v28 = *(unsigned __int8 *)(a3 + a2 + 10);
                      BOOL v8 = v27 > v28;
                      if (v27 == v28)
                      {
                        unsigned int v29 = *(unsigned __int8 *)(a3 + a1 + 11);
                        unsigned int v30 = *(unsigned __int8 *)(a3 + a2 + 11);
                        BOOL v8 = v29 > v30;
                        if (v29 == v30)
                        {
                          unsigned int v31 = a1 + 12;
                          unsigned int v32 = a2 + 12;
                          int v33 = a5 + 16;
                          while (1)
                          {
                            unsigned int v34 = *(unsigned __int8 *)(a3 + v31);
                            unsigned int v35 = *(unsigned __int8 *)(a3 + v32);
                            BOOL v8 = v34 > v35;
                            if (v34 != v35) {
                              break;
                            }
                            unsigned int v36 = *(unsigned __int16 *)(a4 + 2 * v31);
                            unsigned int v37 = *(unsigned __int16 *)(a4 + 2 * v32);
                            BOOL v8 = v36 > v37;
                            if (v36 != v37) {
                              break;
                            }
                            uint64_t v38 = v31 + 1;
                            uint64_t v39 = v32 + 1;
                            unsigned int v40 = *(unsigned __int8 *)(a3 + v38);
                            unsigned int v41 = *(unsigned __int8 *)(a3 + v39);
                            BOOL v8 = v40 > v41;
                            if (v40 != v41) {
                              break;
                            }
                            unsigned int v42 = *(unsigned __int16 *)(a4 + 2 * v38);
                            unsigned int v43 = *(unsigned __int16 *)(a4 + 2 * v39);
                            BOOL v8 = v42 > v43;
                            if (v42 != v43) {
                              break;
                            }
                            uint64_t v44 = v31 + 2;
                            uint64_t v45 = v32 + 2;
                            unsigned int v46 = *(unsigned __int8 *)(a3 + v44);
                            unsigned int v47 = *(unsigned __int8 *)(a3 + v45);
                            BOOL v8 = v46 > v47;
                            if (v46 != v47) {
                              break;
                            }
                            unsigned int v48 = *(unsigned __int16 *)(a4 + 2 * v44);
                            unsigned int v49 = *(unsigned __int16 *)(a4 + 2 * v45);
                            BOOL v8 = v48 > v49;
                            if (v48 != v49) {
                              break;
                            }
                            uint64_t v50 = v31 + 3;
                            uint64_t v51 = v32 + 3;
                            unsigned int v52 = *(unsigned __int8 *)(a3 + v50);
                            unsigned int v53 = *(unsigned __int8 *)(a3 + v51);
                            BOOL v8 = v52 > v53;
                            if (v52 != v53) {
                              break;
                            }
                            unsigned int v54 = *(unsigned __int16 *)(a4 + 2 * v50);
                            unsigned int v55 = *(unsigned __int16 *)(a4 + 2 * v51);
                            BOOL v8 = v54 > v55;
                            if (v54 != v55) {
                              break;
                            }
                            uint64_t v56 = v31 + 4;
                            uint64_t v57 = v32 + 4;
                            unsigned int v58 = *(unsigned __int8 *)(a3 + v56);
                            unsigned int v59 = *(unsigned __int8 *)(a3 + v57);
                            BOOL v8 = v58 > v59;
                            if (v58 != v59) {
                              break;
                            }
                            unsigned int v60 = *(unsigned __int16 *)(a4 + 2 * v56);
                            unsigned int v61 = *(unsigned __int16 *)(a4 + 2 * v57);
                            BOOL v8 = v60 > v61;
                            if (v60 != v61) {
                              break;
                            }
                            uint64_t v62 = v31 + 5;
                            uint64_t v63 = v32 + 5;
                            unsigned int v64 = *(unsigned __int8 *)(a3 + v62);
                            unsigned int v65 = *(unsigned __int8 *)(a3 + v63);
                            BOOL v8 = v64 > v65;
                            if (v64 != v65) {
                              break;
                            }
                            unsigned int v66 = *(unsigned __int16 *)(a4 + 2 * v62);
                            unsigned int v67 = *(unsigned __int16 *)(a4 + 2 * v63);
                            BOOL v8 = v66 > v67;
                            if (v66 != v67) {
                              break;
                            }
                            uint64_t v68 = v31 + 6;
                            uint64_t v69 = v32 + 6;
                            unsigned int v70 = *(unsigned __int8 *)(a3 + v68);
                            unsigned int v71 = *(unsigned __int8 *)(a3 + v69);
                            BOOL v8 = v70 > v71;
                            if (v70 != v71) {
                              break;
                            }
                            unsigned int v72 = *(unsigned __int16 *)(a4 + 2 * v68);
                            unsigned int v73 = *(unsigned __int16 *)(a4 + 2 * v69);
                            BOOL v8 = v72 > v73;
                            if (v72 != v73) {
                              break;
                            }
                            uint64_t v74 = v31 + 7;
                            uint64_t v75 = v32 + 7;
                            unsigned int v76 = *(unsigned __int8 *)(a3 + v74);
                            unsigned int v77 = *(unsigned __int8 *)(a3 + v75);
                            BOOL v8 = v76 > v77;
                            if (v76 != v77) {
                              break;
                            }
                            unsigned int v78 = *(unsigned __int16 *)(a4 + 2 * v74);
                            unsigned int v79 = *(unsigned __int16 *)(a4 + 2 * v75);
                            BOOL v8 = v78 > v79;
                            if (v78 != v79) {
                              break;
                            }
                            BOOL result = 0;
                            unsigned int v81 = v31 + 8;
                            unsigned int v82 = v32 + 8;
                            if (v81 >= a5) {
                              unsigned int v83 = a5;
                            }
                            else {
                              unsigned int v83 = 0;
                            }
                            unsigned int v31 = v81 - v83;
                            if (v82 >= a5) {
                              unsigned int v84 = a5;
                            }
                            else {
                              unsigned int v84 = 0;
                            }
                            unsigned int v32 = v82 - v84;
                            --*a6;
                            v33 -= 8;
                            if (v33 <= 7) {
                              return result;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v8;
}

void sub_20DB50680(int a1)
{
  uint64_t v2 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "\n\nbzip2/libbzip2: internal error number %d.\nThis is a bug in bzip2/libbzip2, %s.\nPlease report it to: bzip2-devel@sourceware.org.  If this happened\nwhen you were using some program which uses libbzip2 as a\ncomponent, you should also report this bug to the author(s)\nof that program.  Please make an effort to report this bug;\n"
    "timely and accurate bug reports eventually lead to higher\n"
    "quality software.  Thanks.\n"
    "\n",
    a1,
    "1.0.8, 13-Jul-2019");
  if (a1 == 1007) {
    fwrite("\n*** A special note about internal error number 1007 ***\n\nExperience suggests that a common cause of i.e. 1007\nis unreliable memory or other hardware.  The 1007 assertion\njust happens to cross-check the results of huge numbers of\nmemory reads/writes, and so acts (unintendedly) as a stress\ntest of your memory system.\n\nI suggest the following: try compressing the file again,\npossibly monitoring progress in detail with the -vv flag.\n\n* If the error cannot be reproduced, and/or happens at different\n  points in compression, you may have a flaky memory system.\n  Try a memory-test program.  I have used Memtest86\n  (www.memtest86.com).  At the time of writing it is free (GPLd).\n  Memtest86 tests memory much more thorougly than your BIOSs\n  power-on test, and may find failures that the BIOS doesn't.\n\n"
  }
      "* If the error can be repeatably reproduced, this is a bug in\n"
      "  bzip2, and I would very much like to hear about it.  Please\n"
      "  let me know, and, ideally, save a copy of the file causing the\n"
      "  problem -- without which I will be unable to investigate it.\n"
      "\n",
      0x420uLL,
      1uLL,
      *v2);
  exit(3);
}

const char *BZ2_bzlibVersion(void)
{
  return "1.0.8, 13-Jul-2019";
}

void *sub_20DB506F0(uint64_t a1, int a2, int a3)
{
  return malloc_type_malloc(a3 * a2, 0xD7BDDC2CuLL);
}

void sub_20DB50704(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

BOOL sub_20DB50714(uint64_t a1)
{
  int v1 = 0;
  int v2 = 0;
  uint64_t v3 = *(void *)(a1 + 48);
  while (1)
  {
    int v4 = *(_DWORD *)(v3 + 12);
    do
    {
      if (v4 == 2) {
        goto LABEL_27;
      }
    }
    while (v4 != 1);
    int v6 = *(_DWORD *)(v3 + 116);
    int v5 = *(_DWORD *)(v3 + 120);
    if (*(_DWORD *)(*(void *)v3 + 32) && v5 < v6)
    {
      unsigned int v9 = *(unsigned char **)(*(void *)v3 + 24);
      do
      {
        *unsigned int v9 = *(unsigned char *)(*(void *)(v3 + 80) + v5);
        int v5 = *(_DWORD *)(v3 + 120) + 1;
        *(_DWORD *)(v3 + 120) = v5;
        uint64_t v10 = *(void *)v3;
        int v11 = *(_DWORD *)(*(void *)v3 + 36);
        int v12 = *(_DWORD *)(*(void *)v3 + 32) - 1;
        unsigned int v9 = (unsigned char *)(*(void *)(*(void *)v3 + 24) + 1);
        *(void *)(v10 + 24) = v9;
        *(_DWORD *)(v10 + 32) = v12;
        *(_DWORD *)(v10 + 36) = v11 + 1;
        if (v11 == -1) {
          ++*(_DWORD *)(v10 + 40);
        }
        int v6 = *(_DWORD *)(v3 + 116);
        if (v12) {
          BOOL v13 = v5 < v6;
        }
        else {
          BOOL v13 = 0;
        }
      }
      while (v13);
      int v8 = 1;
    }
    else
    {
      int v8 = 0;
    }
    v2 |= v8;
    if (v5 < v6) {
      break;
    }
    int v14 = *(_DWORD *)(v3 + 8);
    if (v14 == 4 && !*(_DWORD *)(v3 + 16) && (*(_DWORD *)(v3 + 92) > 0xFFu || *(int *)(v3 + 96) < 1)) {
      break;
    }
    *(_DWORD *)(v3 + 108) = 0;
    *(_DWORD *)(v3 + 116) = 0;
    *(_DWORD *)(v3 + 120) = 0;
    *(_DWORD *)(v3 + 648) = -1;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_OWORD *)(v3 + 144) = 0u;
    *(_OWORD *)(v3 + 160) = 0u;
    *(_OWORD *)(v3 + 176) = 0u;
    *(_OWORD *)(v3 + 192) = 0u;
    *(_OWORD *)(v3 + 208) = 0u;
    *(_OWORD *)(v3 + 224) = 0u;
    *(_OWORD *)(v3 + 240) = 0u;
    *(_OWORD *)(v3 + 256) = 0u;
    *(_OWORD *)(v3 + 272) = 0u;
    *(_OWORD *)(v3 + 288) = 0u;
    *(_OWORD *)(v3 + 304) = 0u;
    *(_OWORD *)(v3 + 320) = 0u;
    *(_OWORD *)(v3 + 336) = 0u;
    *(_OWORD *)(v3 + 352) = 0u;
    *(_OWORD *)(v3 + 368) = 0u;
    ++*(_DWORD *)(v3 + 660);
    *(_DWORD *)(v3 + 12) = 2;
    if (v14 == 3)
    {
      if (!*(_DWORD *)(v3 + 16) && (*(_DWORD *)(v3 + 92) > 0xFFu || *(int *)(v3 + 96) <= 0)) {
        return (v1 | v2) != 0;
      }
LABEL_27:
      int v14 = *(_DWORD *)(v3 + 8);
    }
    int v15 = *(_DWORD *)(v3 + 108);
    int v16 = *(_DWORD *)(v3 + 112);
    if (v14 == 2)
    {
      if (v15 < v16 && *(_DWORD *)(*(void *)v3 + 8))
      {
        unsigned int v17 = **(unsigned __int8 ***)v3;
        unsigned int v18 = *(_DWORD *)(v3 + 92);
        while (1)
        {
          unsigned int v19 = *v17;
          int v20 = *(_DWORD *)(v3 + 96);
          if (v18 == v19)
          {
            if (v20 == 255) {
              goto LABEL_37;
            }
            *(_DWORD *)(v3 + 96) = v20 + 1;
          }
          else
          {
            if (v20 != 1)
            {
LABEL_37:
              if (v18 <= 0xFF) {
                sub_20DB528A0(v3);
              }
              *(_DWORD *)(v3 + 92) = v19;
              *(_DWORD *)(v3 + 96) = 1;
              goto LABEL_40;
            }
            *(_DWORD *)(v3 + 648) = dword_20DB59160[v18 ^ HIBYTE(*(_DWORD *)(v3 + 648))] ^ (*(_DWORD *)(v3 + 648) << 8);
            *(unsigned char *)(v3 + v18 + 128) = 1;
            *(unsigned char *)(*(void *)(v3 + 64) + v15) = v18;
            ++*(_DWORD *)(v3 + 108);
            *(_DWORD *)(v3 + 92) = v19;
          }
LABEL_40:
          unsigned int v21 = *(unsigned __int8 ***)v3;
          unsigned int v17 = (unsigned __int8 *)(**(void **)v3 + 1);
          *unsigned int v21 = v17;
          int v22 = *((_DWORD *)v21 + 3);
          int v23 = *((_DWORD *)v21 + 2) - 1;
          *((_DWORD *)v21 + 2) = v23;
          *((_DWORD *)v21 + 3) = v22 + 1;
          if (v22 == -1) {
            ++*((_DWORD *)v21 + 4);
          }
          int v15 = *(_DWORD *)(v3 + 108);
          int v16 = *(_DWORD *)(v3 + 112);
          int v24 = 1;
          if (v15 < v16)
          {
            unsigned int v18 = v19;
            if (v23) {
              continue;
            }
          }
          goto LABEL_63;
        }
      }
    }
    else if (v15 < v16)
    {
      unsigned int v25 = *(unsigned __int8 ***)v3;
      int v24 = *(_DWORD *)(*(void *)v3 + 8);
      if (!v24) {
        goto LABEL_63;
      }
      int v24 = *(_DWORD *)(v3 + 16);
      if (!v24) {
        goto LABEL_63;
      }
      while (2)
      {
        int v26 = **v25;
        uint64_t v27 = *(unsigned int *)(v3 + 92);
        int v28 = *(_DWORD *)(v3 + 96);
        if (v27 == v26)
        {
          if (v28 != 255)
          {
            *(_DWORD *)(v3 + 96) = v28 + 1;
            goto LABEL_56;
          }
LABEL_53:
          if (v27 <= 0xFF) {
            sub_20DB528A0(v3);
          }
          *(_DWORD *)(v3 + 92) = v26;
          *(_DWORD *)(v3 + 96) = 1;
        }
        else
        {
          if (v28 != 1) {
            goto LABEL_53;
          }
          *(_DWORD *)(v3 + 648) = dword_20DB59160[*(_DWORD *)(v3 + 92) ^ HIBYTE(*(_DWORD *)(v3 + 648))] ^ (*(_DWORD *)(v3 + 648) << 8);
          *(unsigned char *)(v3 + v27 + 128) = 1;
          *(unsigned char *)(*(void *)(v3 + 64) + v15) = v27;
          ++*(_DWORD *)(v3 + 108);
          *(_DWORD *)(v3 + 92) = v26;
        }
LABEL_56:
        unsigned int v25 = *(unsigned __int8 ***)v3;
        *unsigned int v25 = (unsigned __int8 *)(**(void **)v3 + 1);
        int v29 = *((_DWORD *)v25 + 3);
        int v30 = *((_DWORD *)v25 + 2) - 1;
        *((_DWORD *)v25 + 2) = v30;
        *((_DWORD *)v25 + 3) = v29 + 1;
        if (v29 == -1) {
          ++*((_DWORD *)v25 + 4);
        }
        int v31 = *(_DWORD *)(v3 + 16) - 1;
        *(_DWORD *)(v3 + 16) = v31;
        int v15 = *(_DWORD *)(v3 + 108);
        int v16 = *(_DWORD *)(v3 + 112);
        int v24 = 1;
        if (v15 >= v16 || !v30 || !v31) {
          goto LABEL_63;
        }
        continue;
      }
    }
    int v24 = 0;
LABEL_63:
    v1 |= v24;
    int v32 = *(_DWORD *)(v3 + 8);
    if (v32 == 2 || *(_DWORD *)(v3 + 16))
    {
      if (v15 >= v16)
      {
        BOOL v33 = 0;
        goto LABEL_72;
      }
      if (!*(_DWORD *)(*(void *)v3 + 8)) {
        return (v1 | v2) != 0;
      }
    }
    else
    {
      if (*(_DWORD *)(v3 + 92) <= 0xFFu)
      {
        sub_20DB528A0(v3);
        int v32 = *(_DWORD *)(v3 + 8);
      }
      *(void *)(v3 + 92) = 256;
      BOOL v33 = v32 == 4;
LABEL_72:
      sub_20DB529EC(v3, v33);
      *(_DWORD *)(v3 + 12) = 1;
    }
  }
  return (v1 | v2) != 0;
}

int BZ2_bzDecompressInit(bz_stream *strm, int verbosity, int small)
{
  int result = -2;
  if (verbosity <= 4)
  {
    if (strm)
    {
      char v5 = small;
      if (small <= 1)
      {
        bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))strm->bzalloc;
        if (!bzalloc)
        {
          bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))sub_20DB506F0;
          strm->bzalloc = (void *(__cdecl *)(void *, int, int))sub_20DB506F0;
        }
        if (!strm->bzfree) {
          strm->bzfree = (void (__cdecl *)(void *, void *))sub_20DB50704;
        }
        uint64_t v8 = bzalloc(strm->opaque, 64144, 1);
        if (v8)
        {
          uint64_t v9 = v8;
          int result = 0;
          *(_DWORD *)(v9 + 8) = 10;
          *(void *)uint64_t v9 = strm;
          strm->state = (void *)v9;
          *(void *)(v9 + 32) = 0;
          *(_DWORD *)(v9 + 3188) = 0;
          *(void *)&strm->total_in_lo32 = 0;
          *(void *)&strm->total_out_lo32 = 0;
          *(unsigned char *)(v9 + 44) = v5;
          *(void *)(v9 + 3152) = 0;
          *(void *)(v9 + 3168) = 0;
          *(void *)(v9 + 3160) = 0;
          *(_DWORD *)(v9 + 48) = 0;
          *(_DWORD *)(v9 + 52) = verbosity;
        }
        else
        {
          return -3;
        }
      }
    }
  }
  return result;
}

uint64_t sub_20DB50BF4(int a1, uint64_t a2)
{
  LODWORD(result) = 0;
  int v4 = 256;
  do
  {
    int v5 = (v4 + (int)result) >> 1;
    int v6 = *(_DWORD *)(a2 + 4 * v5);
    if (v6 <= a1) {
      uint64_t result = v5;
    }
    else {
      uint64_t result = result;
    }
    if (v6 > a1) {
      int v4 = v5;
    }
  }
  while (v4 - result != 1);
  return result;
}

int BZ2_bzDecompress(bz_stream *strm)
{
  if (!strm) {
    return -2;
  }
  state = strm->state;
  if (!state || *(bz_stream **)state != strm) {
    return -2;
  }
  unsigned int v7 = state + 16020;
  uint64_t v8 = (char *)(state + 274);
  int v9 = state[2];
  uint64_t v10 = dword_26772B700;
  int v11 = (FILE **)MEMORY[0x263EF8348];
  while (1)
  {
    if (v9 == 1) {
      return -1;
    }
    if (v9 == 2) {
      break;
    }
    if (v9 >= 10)
    {
LABEL_238:
      int result = sub_20DB55E28((uint64_t **)state);
      if (result == 4)
      {
        if ((int)state[13] >= 3) {
          fprintf(*v11, "\n    combined CRCs: stored = 0x%08x, computed = 0x%08x", state[795], state[797]);
        }
        if (state[797] == state[795]) {
          return 4;
        }
        else {
          return -4;
        }
      }
      int v9 = 2;
      if (state[2] != 2) {
        return result;
      }
    }
  }
  int v12 = *(uint64_t **)state;
  BOOL v13 = *(int8x16_t **)(*(void *)state + 24);
  if (*((unsigned char *)state + 44))
  {
    int v14 = *((_DWORD *)v12 + 8);
    if (*((unsigned char *)state + 20))
    {
      if (v14)
      {
        int v15 = state[4];
        while (1)
        {
          while (v15)
          {
            *(unsigned char *)v12[3] = *((unsigned char *)state + 12);
            int v15 = state[4] - 1;
            state[4] = v15;
            int v12 = *(uint64_t **)state;
            v12[3] = *(void *)(*(void *)state + 24) + 1;
            int v60 = *((_DWORD *)v12 + 9);
            int v61 = *((_DWORD *)v12 + 8) - 1;
            *((_DWORD *)v12 + 8) = v61;
            *((_DWORD *)v12 + 9) = v60 + 1;
            if (v60 == -1) {
              ++*((_DWORD *)v12 + 10);
            }
            int v62 = 1;
            if (!v61) {
              goto LABEL_224;
            }
          }
          int v16 = state[273];
          int v17 = *v7;
          int v18 = *v7 + 1;
          if (v16 == v18) {
            goto LABEL_191;
          }
          if (v16 > v18) {
            break;
          }
          state[4] = 1;
          unint64_t v20 = state[15];
          int v19 = state[16];
          *((unsigned char *)state + 12) = v19;
          unsigned int v21 = 100000 * state[10];
          if (v20 >= v21) {
            break;
          }
          int v22 = 0;
          int v23 = 256;
          do
          {
            if (*(_DWORD *)&v8[4 * ((v23 + v22) >> 1)] > (int)v20) {
              int v23 = (v23 + v22) >> 1;
            }
            else {
              int v22 = (v23 + v22) >> 1;
            }
          }
          while (v23 - v22 != 1);
          uint64_t v24 = *((void *)state + 395);
          int v25 = *(unsigned __int16 *)(v24 + 2 * v20);
          uint64_t v26 = *((void *)state + 396);
          unint64_t v27 = v25 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v26 + (v20 >> 1)) >> (4 * (v20 & 1))) & 0xF) << 16);
          state[15] = v27;
          int v28 = state[6];
          if (!v28)
          {
            uint64_t v29 = (int)state[7];
            int v28 = v10[v29];
            if (v29 == 511) {
              int v30 = 0;
            }
            else {
              int v30 = v29 + 1;
            }
            state[7] = v30;
          }
          int v31 = v28 - 1;
          state[6] = v28 - 1;
          state[273] = v16 + 1;
          if (v16 != v17)
          {
            int v32 = v22 ^ (v31 == 1);
            if (v32 == v19)
            {
              state[4] = 2;
              if (v27 >= v21) {
                break;
              }
              int v33 = 0;
              int v34 = 256;
              do
              {
                if (*(_DWORD *)&v8[4 * ((v34 + v33) >> 1)] > (int)v27) {
                  int v34 = (v34 + v33) >> 1;
                }
                else {
                  int v33 = (v34 + v33) >> 1;
                }
              }
              while (v34 - v33 != 1);
              int v35 = *(unsigned __int16 *)(v24 + 2 * v27);
              unint64_t v36 = v35 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v26 + (v27 >> 1)) >> (4 * (v25 & 1))) & 0xF) << 16);
              state[15] = v36;
              if (v28 == 1)
              {
                uint64_t v37 = (int)state[7];
                int v31 = v10[v37];
                if (v37 == 511) {
                  int v38 = 0;
                }
                else {
                  int v38 = v37 + 1;
                }
                state[7] = v38;
              }
              int v39 = v31 - 1;
              state[6] = v31 - 1;
              state[273] = v16 + 2;
              if (v16 + 1 != v17)
              {
                int v40 = v33 ^ (v39 == 1);
                if (v40 == v19)
                {
                  state[4] = 3;
                  if (v36 >= v21) {
                    break;
                  }
                  int v41 = 0;
                  int v42 = 256;
                  do
                  {
                    if (*(_DWORD *)&v8[4 * ((v42 + v41) >> 1)] > (int)v36) {
                      int v42 = (v42 + v41) >> 1;
                    }
                    else {
                      int v41 = (v42 + v41) >> 1;
                    }
                  }
                  while (v42 - v41 != 1);
                  unsigned __int16 v43 = *(_WORD *)(v24 + 2 * v36);
                  unint64_t v44 = v43 | (((*(unsigned __int8 *)(v26 + (v36 >> 1)) >> (4 * (v35 & 1))) & 0xFu) << 16);
                  state[15] = v44;
                  if (!v39)
                  {
                    uint64_t v45 = (int)state[7];
                    int v39 = v10[v45];
                    if (v45 == 511) {
                      int v46 = 0;
                    }
                    else {
                      int v46 = v45 + 1;
                    }
                    state[7] = v46;
                  }
                  int v47 = v39 - 1;
                  state[6] = v39 - 1;
                  state[273] = v16 + 3;
                  if (v16 + 2 != v17)
                  {
                    int v48 = v41 ^ (v47 == 1);
                    if (v48 == v19)
                    {
                      if (v44 >= v21) {
                        break;
                      }
                      int v49 = 0;
                      int v50 = 256;
                      do
                      {
                        if (*(_DWORD *)&v8[4 * ((v50 + v49) >> 1)] > (int)v44) {
                          int v50 = (v50 + v49) >> 1;
                        }
                        else {
                          int v49 = (v50 + v49) >> 1;
                        }
                      }
                      while (v50 - v49 != 1);
                      unsigned __int16 v51 = *(_WORD *)(v24 + 2 * v44);
                      unint64_t v52 = v51 | (((*(unsigned __int8 *)(v26 + (v44 >> 1)) >> (4 * (v43 & 1))) & 0xFu) << 16);
                      state[15] = v52;
                      if (!v47)
                      {
                        uint64_t v53 = (int)state[7];
                        int v47 = v10[v53];
                        if (v53 == 511) {
                          int v54 = 0;
                        }
                        else {
                          int v54 = v53 + 1;
                        }
                        state[7] = v54;
                      }
                      int v55 = v47 - 1;
                      state[6] = v47 - 1;
                      state[273] = v16 + 4;
                      state[4] = (v49 ^ (v47 == 2)) + 4;
                      if (v52 >= v21) {
                        break;
                      }
                      int v56 = 0;
                      int v57 = 256;
                      do
                      {
                        if (*(_DWORD *)&v8[4 * ((v57 + v56) >> 1)] > (int)v52) {
                          int v57 = (v57 + v56) >> 1;
                        }
                        else {
                          int v56 = (v57 + v56) >> 1;
                        }
                      }
                      while (v57 - v56 != 1);
                      state[16] = v56;
                      state[15] = *(unsigned __int16 *)(v24 + 2 * v52) | (((*(unsigned __int8 *)(v26 + (v52 >> 1)) >> (4 * (v51 & 1))) & 0xF) << 16);
                      if (v47 == 1)
                      {
                        uint64_t v58 = (int)state[7];
                        int v55 = v10[v58];
                        if (v58 == 511) {
                          int v59 = 0;
                        }
                        else {
                          int v59 = v58 + 1;
                        }
                        state[7] = v59;
                      }
                      state[6] = v55 - 1;
                      state[16] = v56 ^ (v55 == 2);
                      state[273] = v16 + 5;
                    }
                    else
                    {
                      state[16] = v48;
                    }
                  }
                }
                else
                {
                  state[16] = v40;
                }
              }
            }
            else
            {
              state[16] = v32;
            }
          }
          int v15 = 1;
          if (!*((_DWORD *)v12 + 8)) {
            goto LABEL_191;
          }
        }
LABEL_192:
        int v62 = 0;
        goto LABEL_224;
      }
    }
    else if (v14)
    {
      int v101 = state[4];
      do
      {
        while (v101)
        {
          *(unsigned char *)v12[3] = *((unsigned char *)state + 12);
          int v101 = state[4] - 1;
          state[4] = v101;
          int v12 = *(uint64_t **)state;
          v12[3] = *(void *)(*(void *)state + 24) + 1;
          int v128 = *((_DWORD *)v12 + 9);
          int v129 = *((_DWORD *)v12 + 8) - 1;
          *((_DWORD *)v12 + 8) = v129;
          *((_DWORD *)v12 + 9) = v128 + 1;
          if (v128 == -1) {
            ++*((_DWORD *)v12 + 10);
          }
          int v62 = 1;
          if (!v129) {
            goto LABEL_224;
          }
        }
        int v102 = state[273];
        int v103 = *v7;
        int v104 = *v7 + 1;
        if (v102 == v104) {
          break;
        }
        if (v102 > v104) {
          goto LABEL_192;
        }
        state[4] = 1;
        unint64_t v106 = state[15];
        int v105 = state[16];
        *((unsigned char *)state + 12) = v105;
        unsigned int v107 = 100000 * state[10];
        if (v106 >= v107) {
          goto LABEL_192;
        }
        int v108 = 0;
        int v109 = 256;
        do
        {
          if (*(_DWORD *)&v8[4 * ((v109 + v108) >> 1)] > (int)v106) {
            int v109 = (v109 + v108) >> 1;
          }
          else {
            int v108 = (v109 + v108) >> 1;
          }
        }
        while (v109 - v108 != 1);
        uint64_t v110 = *((void *)state + 395);
        int v111 = *(unsigned __int16 *)(v110 + 2 * v106);
        uint64_t v112 = *((void *)state + 396);
        unint64_t v113 = v111 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v112 + (v106 >> 1)) >> (4 * (v106 & 1))) & 0xF) << 16);
        state[15] = v113;
        state[273] = v102 + 1;
        if (v102 != v103)
        {
          if (v108 == v105)
          {
            state[4] = 2;
            if (v113 >= v107) {
              goto LABEL_192;
            }
            int v114 = 0;
            int v115 = 256;
            do
            {
              if (*(_DWORD *)&v8[4 * ((v115 + v114) >> 1)] > (int)v113) {
                int v115 = (v115 + v114) >> 1;
              }
              else {
                int v114 = (v115 + v114) >> 1;
              }
            }
            while (v115 - v114 != 1);
            unsigned __int16 v116 = *(_WORD *)(v110 + 2 * v113);
            unint64_t v117 = v116 | (((*(unsigned __int8 *)(v112 + (v113 >> 1)) >> (4 * (v111 & 1))) & 0xFu) << 16);
            state[15] = v117;
            state[273] = v102 + 2;
            if (v102 + 1 != v103)
            {
              if (v114 == v105)
              {
                state[4] = 3;
                if (v117 >= v107) {
                  goto LABEL_192;
                }
                int v118 = 0;
                int v119 = 256;
                do
                {
                  if (*(_DWORD *)&v8[4 * ((v119 + v118) >> 1)] > (int)v117) {
                    int v119 = (v119 + v118) >> 1;
                  }
                  else {
                    int v118 = (v119 + v118) >> 1;
                  }
                }
                while (v119 - v118 != 1);
                int v120 = *(unsigned __int16 *)(v110 + 2 * v117);
                unint64_t v121 = v120 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v112 + (v117 >> 1)) >> (4 * (v116 & 1))) & 0xF) << 16);
                state[15] = v121;
                state[273] = v102 + 3;
                if (v102 + 2 != v103)
                {
                  if (v118 == v105)
                  {
                    if (v121 >= v107) {
                      goto LABEL_192;
                    }
                    int v122 = 0;
                    int v123 = 256;
                    do
                    {
                      if (*(_DWORD *)&v8[4 * ((v123 + v122) >> 1)] > (int)v121) {
                        int v123 = (v123 + v122) >> 1;
                      }
                      else {
                        int v122 = (v123 + v122) >> 1;
                      }
                    }
                    while (v123 - v122 != 1);
                    unsigned __int16 v124 = *(_WORD *)(v110 + 2 * v121);
                    unint64_t v125 = v124 | (((*(unsigned __int8 *)(v112 + (v121 >> 1)) >> (4 * (v120 & 1))) & 0xFu) << 16);
                    state[15] = v125;
                    state[273] = v102 + 4;
                    state[4] = v122 + 4;
                    if (v125 >= v107) {
                      goto LABEL_192;
                    }
                    int v126 = 0;
                    int v127 = 256;
                    do
                    {
                      if (*(_DWORD *)&v8[4 * ((v127 + v126) >> 1)] > (int)v125) {
                        int v127 = (v127 + v126) >> 1;
                      }
                      else {
                        int v126 = (v127 + v126) >> 1;
                      }
                    }
                    while (v127 - v126 != 1);
                    state[16] = v126;
                    state[15] = *(unsigned __int16 *)(v110 + 2 * v125) | (((*(unsigned __int8 *)(v112 + (v125 >> 1)) >> (4 * (v124 & 1))) & 0xF) << 16);
                    state[273] = v102 + 5;
                  }
                  else
                  {
                    state[16] = v118;
                  }
                }
              }
              else
              {
                state[16] = v114;
              }
            }
          }
          else
          {
            state[16] = v108;
          }
        }
        int v101 = 1;
      }
      while (*((_DWORD *)v12 + 8));
    }
LABEL_191:
    int v62 = 1;
    goto LABEL_224;
  }
  if (*((unsigned char *)state + 20))
  {
    if (*((_DWORD *)v12 + 8))
    {
      int v63 = state[4];
      while (1)
      {
        while (v63)
        {
          *(unsigned char *)v12[3] = *((unsigned char *)state + 12);
          int v63 = state[4] - 1;
          state[4] = v63;
          int v12 = *(uint64_t **)state;
          v12[3] = *(void *)(*(void *)state + 24) + 1;
          int v99 = *((_DWORD *)v12 + 9);
          int v100 = *((_DWORD *)v12 + 8) - 1;
          *((_DWORD *)v12 + 8) = v100;
          *((_DWORD *)v12 + 9) = v99 + 1;
          if (v99 == -1) {
            ++*((_DWORD *)v12 + 10);
          }
          int v62 = 1;
          if (!v100) {
            goto LABEL_224;
          }
        }
        int v64 = state[273];
        int v65 = *v7;
        int v66 = *v7 + 1;
        if (v64 == v66) {
          goto LABEL_191;
        }
        if (v64 > v66) {
          goto LABEL_192;
        }
        state[4] = 1;
        uint64_t v68 = state[15];
        int v67 = state[16];
        *((unsigned char *)state + 12) = v67;
        unsigned int v69 = 100000 * state[10];
        if (v68 >= v69) {
          goto LABEL_192;
        }
        uint64_t v70 = *((void *)state + 394);
        unint64_t v71 = *(unsigned int *)(v70 + 4 * v68);
        unint64_t v72 = v71 >> 8;
        state[15] = *(_DWORD *)(v70 + 4 * v68) >> 8;
        int v73 = state[6];
        if (!v73)
        {
          uint64_t v74 = (int)state[7];
          int v73 = v10[v74];
          if (v74 == 511) {
            int v75 = 0;
          }
          else {
            int v75 = v74 + 1;
          }
          state[7] = v75;
        }
        int v76 = v73 - 1;
        state[6] = v73 - 1;
        state[273] = v64 + 1;
        if (v64 != v65)
        {
          int v77 = v71 ^ (v76 == 1);
          if (v77 == v67)
          {
            state[4] = 2;
            if (v72 >= v69) {
              goto LABEL_192;
            }
            unint64_t v78 = *(unsigned int *)(v70 + 4 * v72);
            unint64_t v79 = v78 >> 8;
            state[15] = *(_DWORD *)(v70 + 4 * v72) >> 8;
            if (v73 == 1)
            {
              uint64_t v80 = (int)state[7];
              int v76 = v10[v80];
              if (v80 == 511) {
                int v81 = 0;
              }
              else {
                int v81 = v80 + 1;
              }
              state[7] = v81;
            }
            int v82 = v76 - 1;
            state[6] = v82;
            state[273] = v64 + 2;
            if (v64 + 1 != v65)
            {
              int v83 = v78 ^ (v82 == 1);
              if (v83 == v67)
              {
                state[4] = 3;
                if (v79 >= v69) {
                  goto LABEL_192;
                }
                unint64_t v84 = *(unsigned int *)(v70 + 4 * v79);
                unint64_t v85 = v84 >> 8;
                state[15] = *(_DWORD *)(v70 + 4 * v79) >> 8;
                if (!v82)
                {
                  uint64_t v86 = (int)state[7];
                  int v82 = v10[v86];
                  if (v86 == 511) {
                    int v87 = 0;
                  }
                  else {
                    int v87 = v86 + 1;
                  }
                  state[7] = v87;
                }
                int v88 = v82 - 1;
                state[6] = v82 - 1;
                state[273] = v64 + 3;
                if (v64 + 2 != v65)
                {
                  int v89 = v84 ^ (v88 == 1);
                  if (v89 == v67)
                  {
                    if (v85 >= v69) {
                      goto LABEL_192;
                    }
                    unint64_t v90 = *(unsigned int *)(v70 + 4 * v85);
                    unint64_t v91 = v90 >> 8;
                    state[15] = v90 >> 8;
                    if (v82 == 1)
                    {
                      uint64_t v92 = (int)state[7];
                      int v88 = v10[v92];
                      if (v92 == 511) {
                        int v93 = 0;
                      }
                      else {
                        int v93 = v92 + 1;
                      }
                      state[7] = v93;
                    }
                    int v94 = v88 - 1;
                    state[6] = v88 - 1;
                    state[273] = v64 + 4;
                    state[4] = (v90 ^ (v88 == 2)) + 4;
                    if (v91 >= v69) {
                      goto LABEL_192;
                    }
                    unsigned int v95 = *(_DWORD *)(v70 + 4 * v91);
                    int v96 = v95;
                    state[15] = v95 >> 8;
                    state[16] = v95;
                    if (v88 == 1)
                    {
                      uint64_t v97 = (int)state[7];
                      int v94 = v10[v97];
                      if (v97 == 511) {
                        int v98 = 0;
                      }
                      else {
                        int v98 = v97 + 1;
                      }
                      state[7] = v98;
                    }
                    state[6] = v94 - 1;
                    state[16] = v96 ^ (v94 == 2);
                    state[273] = v64 + 5;
                  }
                  else
                  {
                    state[16] = v89;
                  }
                }
              }
              else
              {
                state[16] = v83;
              }
            }
          }
          else
          {
            state[16] = v77;
          }
        }
        int v63 = 1;
        if (!*((_DWORD *)v12 + 8)) {
          goto LABEL_191;
        }
      }
    }
    goto LABEL_191;
  }
  char v130 = *((unsigned char *)state + 12);
  int v131 = state[4];
  int v132 = state[273];
  uint64_t v133 = *((void *)state + 394);
  LODWORD(v134) = state[15];
  uint64_t v135 = state[16];
  int v136 = *((_DWORD *)v12 + 8);
  int v137 = *v7;
  int v138 = *v7 + 1;
  unsigned int v139 = 100000 * state[10];
  int v140 = *(unsigned char **)(*(void *)state + 24);
  int v141 = v136;
LABEL_194:
  if (v131 < 1)
  {
    while (1)
    {
      int v143 = v132;
      uint64_t v144 = v135;
      if (v132 > v138) {
        goto LABEL_223;
      }
      if (v132 == v138)
      {
        int v131 = 0;
        int v132 = v137 + 1;
        goto LABEL_219;
      }
      if (v134 >= v139) {
        goto LABEL_223;
      }
      unint64_t v145 = *(unsigned int *)(v133 + 4 * v134);
      unint64_t v134 = v145 >> 8;
      ++v132;
      uint64_t v135 = v145;
      if (v145 == v144)
      {
        if (v143 != v137)
        {
          if (v134 >= v139) {
            goto LABEL_223;
          }
          unint64_t v146 = *(unsigned int *)(v133 + 4 * v134);
          unint64_t v134 = v146 >> 8;
          int v131 = 2;
          char v130 = v144;
          int v132 = v137 + 1;
          uint64_t v135 = v144;
          if (v143 + 2 != v138)
          {
            uint64_t v135 = v146;
            char v130 = v144;
            int v132 = v143 + 2;
            if (v146 == v144)
            {
              if (v134 >= v139)
              {
LABEL_223:
                int v62 = 0;
                int v12 = *(uint64_t **)state;
                goto LABEL_224;
              }
              unint64_t v147 = *(unsigned int *)(v133 + 4 * v134);
              unint64_t v148 = v147 >> 8;
              int v131 = 3;
              char v130 = v144;
              int v132 = v137 + 1;
              uint64_t v135 = v144;
              unint64_t v134 = v147 >> 8;
              if (v143 + 3 != v138)
              {
                uint64_t v135 = v147;
                char v130 = v144;
                int v132 = v143 + 3;
                unint64_t v134 = v147 >> 8;
                if (v147 == v144)
                {
                  if (v148 < v139)
                  {
                    unint64_t v149 = *(unsigned int *)(v133 + 4 * v148);
                    if (*(_DWORD *)(v133 + 4 * v148) >> 8 < v139)
                    {
                      int v131 = *(_DWORD *)(v133 + 4 * v148) + 4;
                      uint64_t v135 = *(_DWORD *)(v133 + 4 * (v149 >> 8));
                      LODWORD(v134) = *(_DWORD *)(v133 + 4 * (v149 >> 8)) >> 8;
                      int v132 = v143 + 5;
                      char v130 = v144;
                      goto LABEL_194;
                    }
                  }
                  goto LABEL_223;
                }
              }
            }
          }
          goto LABEL_194;
        }
        char v130 = v144;
        uint64_t v135 = v144;
      }
      else
      {
        char v130 = v144;
      }
LABEL_201:
      if (!v141)
      {
        int v131 = 1;
        goto LABEL_219;
      }
      *v140++ = v130;
      --v141;
    }
  }
  if (v141)
  {
    uint64_t v142 = 0;
    do
    {
      if (v131 - 1 == v142)
      {
        v141 -= v142;
        v140 += v142;
        goto LABEL_201;
      }
      v140[v142++] = v130;
    }
    while (v141 != v142);
    int v141 = 0;
    v140 += v142;
    v131 -= v142;
  }
LABEL_219:
  int v12 = *(uint64_t **)state;
  int v150 = *(_DWORD *)(*(void *)state + 36);
  int v151 = v136 - v141;
  *(_DWORD *)(*(void *)state + 36) = v150 + v151;
  if (__CFADD__(v150, v151)) {
    ++*((_DWORD *)v12 + 10);
  }
  *((unsigned char *)state + 12) = v130;
  state[4] = v131;
  state[273] = v132;
  *((void *)state + 394) = v133;
  state[15] = v134;
  state[16] = v135;
  v12[3] = (uint64_t)v140;
  int v62 = 1;
  *((_DWORD *)v12 + 8) = v141;
LABEL_224:
  uint64_t v152 = v10;
  int v153 = v12[3] - v13;
  if (v153 >= 16)
  {
    sub_20DB5889C(state[796], v13, v153 & 0xFFFFFFF0, v1, v2, v3, v4);
    state[796] = v154;
    BOOL v13 = (int8x16_t *)((char *)v13 + (v153 & 0xFFFFFFF0));
    v153 &= 0xFu;
  }
  if (v153)
  {
    unsigned int v155 = state[796];
    do
    {
      int v156 = v13->u8[0];
      BOOL v13 = (int8x16_t *)((char *)v13 + 1);
      unsigned int v155 = dword_20DB59160[v156 ^ HIBYTE(v155)] ^ (v155 << 8);
      state[796] = v155;
      --v153;
    }
    while (v153);
  }
  if (!v62) {
    return -4;
  }
  if (state[273] != *v7 + 1 || state[4]) {
    return 0;
  }
  int v157 = ~state[796];
  state[796] = v157;
  int v158 = state[13];
  if (v158 > 2)
  {
    fprintf(*v11, " {0x%08x, 0x%08x}", state[794], v157);
    int v158 = state[13];
  }
  uint64_t v10 = v152;
  if (v158 >= 2) {
    fputc(93, *v11);
  }
  int v159 = state[796];
  if (v159 == state[794])
  {
    state[797] = v159 ^ __ROR4__(state[797], 31);
    state[2] = 14;
    goto LABEL_238;
  }
  return -4;
}

int BZ2_bzDecompressEnd(bz_stream *strm)
{
  if (!strm) {
    return -2;
  }
  state = (bz_stream **)strm->state;
  if (!state || *state != strm) {
    return -2;
  }
  if (state[394]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  if (state[395]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  if (state[396]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  ((void (*)(void *, void *))strm->bzfree)(strm->opaque, strm->state);
  int result = 0;
  strm->state = 0;
  return result;
}

BZFILE *__cdecl BZ2_bzWriteOpen(int *bzerror, FILE *f, int blockSize100k, int verbosity, int workFactor)
{
  if (bzerror) {
    *bzerror = 0;
  }
  if (verbosity > 4
    || !f
    || (blockSize100k - 10) < 0xFFFFFFF7
    || workFactor >= 0xFB)
  {
    if (bzerror)
    {
      uint64_t v10 = 0;
      int v11 = -2;
      goto LABEL_12;
    }
    return 0;
  }
  if (!ferror(f))
  {
    int v12 = (char *)malloc_type_malloc(0x13F0uLL, 0x10B004010B7758FuLL);
    if (v12)
    {
      uint64_t v10 = v12;
      BOOL v13 = v12 + 5012;
      if (bzerror) {
        *bzerror = 0;
      }
      *((_DWORD *)v12 + 1274) = 0;
      v12[5100] = 0;
      *((_DWORD *)v12 + 1252) = 0;
      *(void *)int v12 = f;
      unsigned char *v13 = 1;
      int v14 = (bz_stream *)(v12 + 5016);
      if (workFactor) {
        int v15 = workFactor;
      }
      else {
        int v15 = 30;
      }
      *((void *)v10 + 634) = 0;
      *((void *)v10 + 636) = 0;
      *((void *)v10 + 635) = 0;
      int v16 = BZ2_bzCompressInit(v14, blockSize100k, verbosity, v15);
      if (!v16)
      {
        *((_DWORD *)v10 + 1256) = 0;
        v13[88] = 1;
        return v10;
      }
      if (bzerror) {
        *bzerror = v16;
      }
      free(v10);
    }
    else if (bzerror)
    {
      uint64_t v10 = 0;
      int v11 = -3;
      goto LABEL_12;
    }
    return 0;
  }
  if (!bzerror) {
    return 0;
  }
  uint64_t v10 = 0;
  int v11 = -6;
LABEL_12:
  *bzerror = v11;
  return v10;
}

void BZ2_bzWrite(int *bzerror, BZFILE *b, void *buf, int len)
{
  if (bzerror) {
    *bzerror = 0;
  }
  if (b && (*((_DWORD *)b + 1274) = 0, buf) && (len & 0x80000000) == 0)
  {
    if (!*((unsigned char *)b + 5012))
    {
      if (bzerror) {
        *bzerror = -1;
      }
      int v8 = -1;
      goto LABEL_18;
    }
    if (ferror(*(FILE **)b))
    {
LABEL_8:
      if (bzerror) {
        *bzerror = -6;
      }
      int v8 = -6;
      goto LABEL_18;
    }
    if (len)
    {
      *((_DWORD *)b + 1256) = len;
      *((void *)b + 627) = buf;
      while (1)
      {
        *((_DWORD *)b + 1262) = 5000;
        *((void *)b + 630) = (char *)b + 8;
        int v9 = BZ2_bzCompress((bz_stream *)((char *)b + 5016), 0);
        if (v9 != 1) {
          break;
        }
        uint64_t v10 = *((unsigned int *)b + 1262);
        if (v10 >> 3 <= 0x270
          && (5000 - v10 != fwrite((char *)b + 8, 1uLL, 5000 - v10, *(FILE **)b)
           || ferror(*(FILE **)b)))
        {
          goto LABEL_8;
        }
        if (!*((_DWORD *)b + 1256)) {
          goto LABEL_27;
        }
      }
      if (bzerror) {
        *bzerror = v9;
      }
      *((_DWORD *)b + 1274) = v9;
    }
    else
    {
LABEL_27:
      if (bzerror) {
        *bzerror = 0;
      }
      *((_DWORD *)b + 1274) = 0;
    }
  }
  else
  {
    if (bzerror) {
      *bzerror = -2;
    }
    if (b)
    {
      int v8 = -2;
LABEL_18:
      *((_DWORD *)b + 1274) = v8;
    }
  }
}

void BZ2_bzWriteClose(int *bzerror, BZFILE *b, int abandon, unsigned int *nbytes_in, unsigned int *nbytes_out)
{
}

void BZ2_bzWriteClose64(int *bzerror, BZFILE *b, int abandon, unsigned int *nbytes_in_lo32, unsigned int *nbytes_in_hi32, unsigned int *nbytes_out_lo32, unsigned int *nbytes_out_hi32)
{
  if (b)
  {
    if (!*((unsigned char *)b + 5012))
    {
      if (bzerror) {
        *bzerror = -1;
      }
      int v15 = -1;
      goto LABEL_12;
    }
    int v14 = *(FILE **)b;
    if (ferror(*(FILE **)b))
    {
LABEL_4:
      if (bzerror) {
        *bzerror = -6;
      }
      int v15 = -6;
LABEL_12:
      *((_DWORD *)b + 1274) = v15;
      return;
    }
    if (nbytes_in_lo32) {
      *nbytes_in_lo32 = 0;
    }
    if (nbytes_in_hi32) {
      *nbytes_in_hi32 = 0;
    }
    if (nbytes_out_lo32) {
      *nbytes_out_lo32 = 0;
    }
    if (nbytes_out_hi32) {
      *nbytes_out_hi32 = 0;
    }
    if (abandon) {
      goto LABEL_25;
    }
    if (*((_DWORD *)b + 1274))
    {
LABEL_24:
      if (!ferror(v14))
      {
        fflush(v14);
        if (ferror(*(FILE **)b)) {
          goto LABEL_4;
        }
      }
LABEL_25:
      if (nbytes_in_lo32) {
        *nbytes_in_lo32 = *((_DWORD *)b + 1257);
      }
      if (nbytes_in_hi32) {
        *nbytes_in_hi32 = *((_DWORD *)b + 1258);
      }
      if (nbytes_out_lo32) {
        *nbytes_out_lo32 = *((_DWORD *)b + 1263);
      }
      if (nbytes_out_hi32) {
        *nbytes_out_hi32 = *((_DWORD *)b + 1264);
      }
      if (bzerror) {
        *bzerror = 0;
      }
      *((_DWORD *)b + 1274) = 0;
      BZ2_bzCompressEnd((bz_stream *)((char *)b + 5016));
      free(b);
      return;
    }
    while (1)
    {
      *((_DWORD *)b + 1262) = 5000;
      *((void *)b + 63BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = (char *)b + 8;
      int v16 = BZ2_bzCompress((bz_stream *)((char *)b + 5016), 2);
      int v17 = v16;
      if ((v16 - 5) <= 0xFFFFFFFD) {
        break;
      }
      uint64_t v18 = *((unsigned int *)b + 1262);
      if (v18 >> 3 <= 0x270
        && (5000 - v18 != fwrite((char *)b + 8, 1uLL, 5000 - v18, *(FILE **)b)
         || ferror(*(FILE **)b)))
      {
        goto LABEL_4;
      }
      if (v17 == 4)
      {
        int v14 = *(FILE **)b;
        goto LABEL_24;
      }
    }
    if (bzerror) {
      *bzerror = v16;
    }
    *((_DWORD *)b + 1274) = v16;
  }
  else if (bzerror)
  {
    *bzerror = 0;
  }
}

BZFILE *__cdecl BZ2_bzReadOpen(int *bzerror, FILE *f, int verbosity, int small, void *unused, int nUnused)
{
  unsigned int v7 = (char *)unused;
  if (bzerror) {
    *bzerror = 0;
  }
  if (f
    && verbosity <= 4
    && small <= 1
    && (unused || !nUnused)
    && (!unused || nUnused < 0x1389))
  {
    if (ferror(f))
    {
      if (bzerror)
      {
        int v12 = 0;
        int v13 = -6;
        goto LABEL_12;
      }
    }
    else
    {
      int v14 = (char *)malloc_type_malloc(0x13F0uLL, 0x10B004010B7758FuLL);
      if (v14)
      {
        int v12 = v14;
        int v15 = v14 + 5012;
        if (bzerror) {
          *bzerror = 0;
        }
        *((_DWORD *)v14 + 1274) = 0;
        v14[5100] = 0;
        *(void *)int v14 = f;
        *((_DWORD *)v14 + 1252) = 0;
        *int v15 = 0;
        int v16 = (bz_stream *)(v14 + 5016);
        *((void *)v12 + 634) = 0;
        *((void *)v12 + 636) = 0;
        *((void *)v12 + 635) = 0;
        if (nUnused >= 1)
        {
          int v17 = 0;
          unsigned int v18 = nUnused + 1;
          do
          {
            char v19 = *v7++;
            v12[v17 + 8] = v19;
            int v17 = *((_DWORD *)v12 + 1252) + 1;
            *((_DWORD *)v12 + 1252) = v17;
            --v18;
          }
          while (v18 > 1);
        }
        int v20 = BZ2_bzDecompressInit(v16, verbosity, small);
        if (!v20)
        {
          *((_DWORD *)v12 + 1256) = *((_DWORD *)v12 + 1252);
          *((void *)v12 + 627) = v12 + 8;
          v15[88] = 1;
          return v12;
        }
        if (bzerror) {
          *bzerror = v20;
        }
        free(v12);
      }
      else if (bzerror)
      {
        int v12 = 0;
        int v13 = -3;
        goto LABEL_12;
      }
    }
    return 0;
  }
  if (!bzerror) {
    return 0;
  }
  int v12 = 0;
  int v13 = -2;
LABEL_12:
  *bzerror = v13;
  return v12;
}

void BZ2_bzReadClose(int *bzerror, BZFILE *b)
{
  int8x16_t v3 = (char *)b + 5012;
  if (bzerror)
  {
    *bzerror = 0;
    if (!b) {
      return;
    }
    *((_DWORD *)b + 1274) = 0;
    if (*v3)
    {
      *bzerror = -1;
LABEL_7:
      *((_DWORD *)b + 1274) = -1;
      return;
    }
  }
  else
  {
    if (!b) {
      return;
    }
    *((_DWORD *)b + 1274) = 0;
    if (*v3) {
      goto LABEL_7;
    }
  }
  if (*((unsigned char *)b + 5100)) {
    BZ2_bzDecompressEnd((bz_stream *)((char *)b + 5016));
  }

  free(b);
}

int BZ2_bzRead(int *bzerror, BZFILE *b, void *buf, int len)
{
  int v4 = len;
  if (bzerror) {
    *bzerror = 0;
  }
  if (!b || (*((_DWORD *)b + 1274) = 0, !buf) || len < 0)
  {
    if (bzerror) {
      *bzerror = -2;
    }
    int v4 = 0;
    if (b)
    {
      int v7 = -2;
      goto LABEL_14;
    }
    return v4;
  }
  if (*((unsigned char *)b + 5012))
  {
    if (bzerror) {
      *bzerror = -1;
    }
    int v4 = 0;
    int v7 = -1;
    goto LABEL_14;
  }
  if (!len)
  {
    if (bzerror) {
      *bzerror = 0;
    }
    int v4 = 0;
LABEL_35:
    *((_DWORD *)b + 1274) = 0;
    return v4;
  }
  *((_DWORD *)b + 1262) = len;
  *((void *)b + 63BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = buf;
  int v9 = (char *)b + 8;
  while (1)
  {
    uint64_t v10 = *(FILE **)b;
    if (ferror(*(FILE **)b))
    {
LABEL_36:
      if (bzerror) {
        *bzerror = -6;
      }
      int v4 = 0;
      int v7 = -6;
      goto LABEL_14;
    }
    if (!*((_DWORD *)b + 1256) && !sub_20DB522FC(v10))
    {
      int v11 = fread((char *)b + 8, 1uLL, 0x1388uLL, *(FILE **)b);
      if (ferror(*(FILE **)b)) {
        goto LABEL_36;
      }
      *((_DWORD *)b + 1252) = v11;
      *((_DWORD *)b + 1256) = v11;
      *((void *)b + 627) = v9;
    }
    int v12 = BZ2_bzDecompress((bz_stream *)((char *)b + 5016));
    if ((v12 & 0xFFFFFFFB) != 0)
    {
      if (bzerror) {
        *bzerror = v12;
      }
      int v4 = 0;
      *((_DWORD *)b + 1274) = v12;
      return v4;
    }
    if (v12)
    {
      if (v12 == 4)
      {
        if (bzerror) {
          *bzerror = 4;
        }
        *((_DWORD *)b + 1274) = 4;
        v4 -= *((_DWORD *)b + 1262);
        return v4;
      }
      goto LABEL_29;
    }
    if (sub_20DB522FC(*(FILE **)b) && !*((_DWORD *)b + 1256)) {
      break;
    }
LABEL_29:
    if (!*((_DWORD *)b + 1262)) {
      goto LABEL_30;
    }
  }
  if (!*((_DWORD *)b + 1262))
  {
LABEL_30:
    if (bzerror) {
      *bzerror = 0;
    }
    goto LABEL_35;
  }
  if (bzerror) {
    *bzerror = -7;
  }
  int v4 = 0;
  int v7 = -7;
LABEL_14:
  *((_DWORD *)b + 1274) = v7;
  return v4;
}

uint64_t sub_20DB522FC(FILE *a1)
{
  int v2 = fgetc(a1);
  if (v2 == -1) {
    return 1;
  }
  ungetc(v2, a1);
  return 0;
}

void BZ2_bzReadGetUnused(int *bzerror, BZFILE *b, void **unused, int *nUnused)
{
  if (b)
  {
    if (*((_DWORD *)b + 1274) == 4)
    {
      if (unused && nUnused)
      {
        if (bzerror) {
          *bzerror = 0;
        }
        *((_DWORD *)b + 1274) = 0;
        *nUnused = *((_DWORD *)b + 1256);
        *unused = (void *)*((void *)b + 627);
        return;
      }
      if (bzerror) {
        *bzerror = -2;
      }
      int v4 = -2;
    }
    else
    {
      if (bzerror) {
        *bzerror = -1;
      }
      int v4 = -1;
    }
    *((_DWORD *)b + 1274) = v4;
    return;
  }
  if (bzerror) {
    *bzerror = -2;
  }
}

int BZ2_bzBuffToBuffDecompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int small, int verbosity)
{
  int v6 = -2;
  if (dest)
  {
    if (destLen)
    {
      if (source)
      {
        if (small <= 1 && verbosity <= 4)
        {
          memset(&v14, 0, sizeof(v14));
          int v6 = BZ2_bzDecompressInit(&v14, verbosity, small);
          if (!v6)
          {
            v14.next_iuint64_t n = source;
            v14.next_out = dest;
            v14.avail_iuint64_t n = sourceLen;
            v14.unsigned int avail_out = *destLen;
            int v12 = BZ2_bzDecompress(&v14);
            if (v12)
            {
              int v6 = v12;
              if (v12 == 4)
              {
                *destLen -= v14.avail_out;
                BZ2_bzDecompressEnd(&v14);
                return 0;
              }
              else
              {
                BZ2_bzDecompressEnd(&v14);
              }
            }
            else
            {
              unsigned int avail_out = v14.avail_out;
              BZ2_bzDecompressEnd(&v14);
              if (avail_out) {
                return -7;
              }
              else {
                return -8;
              }
            }
          }
        }
      }
    }
  }
  return v6;
}

BZFILE *__cdecl BZ2_bzopen(const char *path, const char *mode)
{
  return sub_20DB524C8();
}

BZFILE *sub_20DB524C8()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v28 = *MEMORY[0x263EF8340];
  __int16 v26 = 0;
  *(void *)__mode = 0;
  if (!v2) {
    return 0;
  }
  int v4 = v3;
  int v5 = v1;
  int v6 = (const char *)v0;
  char v7 = *v2;
  if (*v2)
  {
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = v2 + 1;
    int v11 = 9;
    do
    {
      unsigned int v12 = v7 - 48;
      if (v12 >= 0xA) {
        unsigned int v12 = v11;
      }
      if (v7 == 119)
      {
        unsigned int v12 = v11;
        int v13 = 1;
      }
      else
      {
        int v13 = v9;
      }
      if (v7 == 115) {
        int v14 = v11;
      }
      else {
        int v14 = v12;
      }
      if (v7 == 115) {
        int v15 = v9;
      }
      else {
        int v15 = v13;
      }
      if (v7 == 115) {
        int v16 = 1;
      }
      else {
        int v16 = v8;
      }
      if (v7 == 114)
      {
        int v9 = 0;
      }
      else
      {
        int v11 = v14;
        int v9 = v15;
      }
      if (v7 != 114) {
        int v8 = v16;
      }
      int v17 = *v10++;
      char v7 = v17;
    }
    while (v17);
  }
  else
  {
    int v9 = 0;
    int v8 = 0;
    int v11 = 9;
  }
  int bzerror = 0;
  __strlcat_chk();
  __strlcat_chk();
  if (v4)
  {
    unsigned int v18 = fdopen(v5, __mode);
  }
  else
  {
    if (!v6 || !*v6)
    {
      int v20 = (FILE **)MEMORY[0x263EF8358];
      if (!v9) {
        int v20 = (FILE **)MEMORY[0x263EF8350];
      }
      char v19 = *v20;
      if (!*v20) {
        return 0;
      }
      goto LABEL_36;
    }
    unsigned int v18 = fopen(v6, __mode);
  }
  char v19 = v18;
  if (!v18) {
    return 0;
  }
LABEL_36:
  if (v9)
  {
    if (v11 <= 1) {
      unsigned int v21 = 1;
    }
    else {
      unsigned int v21 = v11;
    }
    if (v21 >= 9) {
      int v22 = 9;
    }
    else {
      int v22 = v21;
    }
    int result = BZ2_bzWriteOpen(&bzerror, v19, v22, 0, 30);
    if (result) {
      return result;
    }
  }
  else
  {
    int result = BZ2_bzReadOpen(&bzerror, v19, 0, v8, unused, 0);
    if (result) {
      return result;
    }
  }
  if (v19 != (FILE *)*MEMORY[0x263EF8350] && v19 != (FILE *)*MEMORY[0x263EF8358])
  {
    fclose(v19);
    return 0;
  }
  return result;
}

BZFILE *__cdecl BZ2_bzdopen(int fd, const char *mode)
{
  return sub_20DB524C8();
}

int BZ2_bzread(BZFILE *b, void *buf, int len)
{
  if (*((_DWORD *)b + 1274) == 4) {
    return 0;
  }
  int bzerror = 0;
  int result = BZ2_bzRead(&bzerror, b, buf, len);
  if ((bzerror & 0xFFFFFFFB) != 0) {
    return -1;
  }
  return result;
}

int BZ2_bzwrite(BZFILE *b, void *buf, int len)
{
  int bzerror = 0;
  BZ2_bzWrite(&bzerror, b, buf, len);
  if (bzerror) {
    return -1;
  }
  else {
    return len;
  }
}

int BZ2_bzflush(BZFILE *b)
{
  return 0;
}

void BZ2_bzclose(BZFILE *b)
{
  if (b)
  {
    int bzerror = 0;
    int v2 = *(FILE **)b;
    if (*((unsigned char *)b + 5012))
    {
      BZ2_bzWriteClose64(&bzerror, b, 0, 0, 0, 0, 0);
      if (bzerror) {
        BZ2_bzWriteClose64(0, b, 1, 0, 0, 0, 0);
      }
    }
    else
    {
      BZ2_bzReadClose(&bzerror, b);
    }
    if (v2 != (FILE *)*MEMORY[0x263EF8350] && v2 != (FILE *)*MEMORY[0x263EF8358]) {
      fclose(v2);
    }
  }
}

const char *__cdecl BZ2_bzerror(BZFILE *b, int *errnum)
{
  int v2 = *((_DWORD *)b + 1274) & (*((int *)b + 1274) >> 31);
  *errnuuint64_t m = v2;
  return (&off_264127168)[-v2];
}

int *sub_20DB528A0(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 92);
  int v2 = *(_DWORD *)(a1 + 96);
  if (v2 >= 1)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 648);
    int v4 = *(_DWORD *)(a1 + 96);
    do
    {
      unsigned int v3 = dword_20DB59160[v1 ^ HIBYTE(v3)] ^ (v3 << 8);
      *(_DWORD *)(a1 + 648) = v3;
      --v4;
    }
    while (v4);
  }
  *(unsigned char *)(a1 + v1 + 128) = 1;
  switch(v2)
  {
    case 3:
      uint64_t v10 = *(void *)(a1 + 64);
      int v9 = (int *)(a1 + 64);
      *(unsigned char *)(v10 + v9[11]) = v1;
      uint64_t v11 = v9[11] + 1;
      v9[11] = v11;
      *(unsigned char *)(*(void *)v9 + v11) = v1;
      int v6 = v9[11] + 1;
      v9[11] = v6;
      int v8 = v9;
      int result = v9 + 11;
      break;
    case 2:
      uint64_t v12 = *(void *)(a1 + 64);
      int v8 = (int *)(a1 + 64);
      uint64_t v13 = *(int *)(a1 + 108);
      int result = (int *)(a1 + 108);
      *(unsigned char *)(v12 + v13) = v1;
      int v6 = *result + 1;
      *int result = v6;
      break;
    case 1:
      int v7 = *(_DWORD *)(a1 + 108);
      int result = (int *)(a1 + 108);
      int v6 = v7;
      int v8 = result - 11;
      break;
    default:
      *(unsigned char *)(v2 + a1 + 124) = 1;
      uint64_t v14 = *(int *)(a1 + 108);
      int result = (int *)(a1 + 108);
      int v8 = result - 11;
      *(unsigned char *)(*(void *)(result - 11) + v14) = v1;
      uint64_t v15 = *result + 1;
      *int result = v15;
      *(unsigned char *)(*(void *)(result - 11) + v15) = v1;
      uint64_t v16 = *result + 1;
      *int result = v16;
      *(unsigned char *)(*(void *)(result - 11) + v16) = v1;
      uint64_t v17 = *result + 1;
      *int result = v17;
      *(unsigned char *)(*(void *)(result - 11) + v17) = v1;
      int v6 = *result + 1;
      *int result = v6;
      LOBYTE(v1) = *((unsigned char *)result - 12) - 4;
      break;
  }
  *(unsigned char *)(*(void *)v8 + v6) = v1;
  ++*result;
  return result;
}

void sub_20DB529EC(uint64_t a1, int a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  int v4 = *(_DWORD *)(a1 + 108);
  if (v4 >= 1)
  {
    int v5 = *(_DWORD *)(a1 + 648);
    int v6 = ~v5;
    *(_DWORD *)(a1 + 648) = ~v5;
    int v7 = v5 ^ ~__ROR4__(*(_DWORD *)(a1 + 652), 31);
    *(_DWORD *)(a1 + 652) = v7;
    int v8 = *(_DWORD *)(a1 + 660);
    if (v8 >= 2) {
      *(_DWORD *)(a1 + 116) = 0;
    }
    if (*(int *)(a1 + 656) >= 2) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "    block %d: crc = 0x%08x, combined CRC = 0x%08x, size = %d\n", v8, v6, v7, v4);
    }
    sub_20DB4EC08();
    int v4 = *(_DWORD *)(a1 + 108);
  }
  *(void *)(a1 + 8BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = *(void *)(a1 + 32) + v4;
  if (*(_DWORD *)(a1 + 660) == 1)
  {
    *(void *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = 0;
    sub_20DB52F28(a1, 66);
    sub_20DB52F28(a1, 90);
    sub_20DB52F28(a1, 104);
    sub_20DB52F28(a1, (*(unsigned char *)(a1 + 664) + 48));
    int v4 = *(_DWORD *)(a1 + 108);
  }
  if (v4 >= 1)
  {
    sub_20DB52F28(a1, 49);
    sub_20DB52F28(a1, 65);
    sub_20DB52F28(a1, 89);
    sub_20DB52F28(a1, 38);
    sub_20DB52F28(a1, 83);
    sub_20DB52F28(a1, 89);
    sub_20DB52F98(a1, *(_DWORD *)(a1 + 648));
    int v9 = *(_DWORD *)(a1 + 644);
    if (v9 <= 7)
    {
      int v10 = *(_DWORD *)(a1 + 640);
    }
    else
    {
      int v10 = *(_DWORD *)(a1 + 640);
      int v11 = *(_DWORD *)(a1 + 116);
      do
      {
        *(unsigned char *)(*(void *)(a1 + 80) + v11) = HIBYTE(v10);
        int v11 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v11;
        int v10 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v10;
        int v12 = *(_DWORD *)(a1 + 644);
        int v9 = v12 - 8;
        *(_DWORD *)(a1 + 644) = v12 - 8;
      }
      while (v12 > 15);
    }
    int v13 = v9 + 1;
    *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v10;
    *(_DWORD *)(a1 + 644) = v9 + 1;
    int v14 = *(_DWORD *)(a1 + 48);
    if (v9 >= 7)
    {
      int v15 = *(_DWORD *)(a1 + 116);
      do
      {
        *(unsigned char *)(*(void *)(a1 + 80) + v15) = HIBYTE(v10);
        int v15 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v15;
        int v10 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v10;
        int v16 = *(_DWORD *)(a1 + 644);
        int v13 = v16 - 8;
        *(_DWORD *)(a1 + 644) = v16 - 8;
      }
      while (v16 > 15);
    }
    int v17 = 0;
    uint64_t v18 = 0;
    *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = (v14 << (8 - v13)) | v10;
    *(_DWORD *)(a1 + 644) = v13 + 24;
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = *(void *)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 72);
    *(_DWORD *)(a1 + 124) = 0;
    do
    {
      if (*(unsigned char *)(a1 + v18 + 128))
      {
        *(unsigned char *)(a1 + v18 + 384) = v17++;
        *(_DWORD *)(a1 + 124) = v17;
      }
      ++v18;
    }
    while (v18 != 256);
    if (v17 >= -1)
    {
      bzero((void *)(a1 + 672), 4 * (v17 + 1) + 4);
      if (v17 >= 1)
      {
        for (uint64_t i = 0; i != v17; ++i)
          v48[i - 1] = i;
      }
    }
    int v23 = *(_DWORD *)(a1 + 108);
    if (v23 < 1)
    {
      int v25 = 0;
    }
    else
    {
      uint64_t v24 = 0;
      int v25 = 0;
      int v26 = 0;
      unsigned __int8 v27 = v47;
      int v28 = v47;
      do
      {
        int v29 = v28;
        int v28 = *(unsigned __int8 *)(a1
                                 + *(unsigned __int8 *)(v20
                                                      + (v23 & ((*(_DWORD *)(v19 + 4 * v24) - 1) >> 31))
                                                      + *(_DWORD *)(v19 + 4 * v24)
                                                      - 1)
                                 + 384);
        if (v29 == v28)
        {
          ++v26;
        }
        else
        {
          unsigned int v30 = v26 - 1;
          if (v26 >= 1)
          {
            int v31 = (__int16 *)(v21 + 2 * v25++);
            if ((v30 & 1) == 0)
            {
LABEL_32:
              __int16 v32 = 0;
              ++*(_DWORD *)(a1 + 672);
              goto LABEL_34;
            }
            while (1)
            {
              ++*(_DWORD *)(a1 + 676);
              __int16 v32 = 1;
LABEL_34:
              *int v31 = v32;
              BOOL v33 = __OFSUB__(v30, 2);
              int v34 = v30 - 2;
              if (v34 < 0 != v33) {
                break;
              }
              unsigned int v30 = v34 >> 1;
              ++v25;
              ++v31;
              if ((v30 & 1) == 0) {
                goto LABEL_32;
              }
            }
            int v26 = 0;
          }
          int v35 = v48[0];
          v48[0] = v27;
          unint64_t v36 = v48;
          if (v28 != v35)
          {
            unint64_t v36 = v48;
            do
            {
              int v37 = *++v36;
              *unint64_t v36 = v35;
              LOBYTE(v35) = v37;
            }
            while (v28 != v37);
          }
          uint64_t v38 = (int)(v36 - &v47) + 1;
          *(_WORD *)(v21 + 2 * v25++) = v38;
          ++*(_DWORD *)(a1 + 4 * v38 + 672);
          int v23 = *(_DWORD *)(a1 + 108);
          unsigned __int8 v27 = v28;
        }
        ++v24;
      }
      while (v24 < v23);
      unsigned int v39 = v26 - 1;
      if (v26 >= 1)
      {
        int v40 = (__int16 *)(v21 + 2 * v25++);
        if (v39) {
          goto LABEL_46;
        }
LABEL_45:
        __int16 v41 = 0;
        ++*(_DWORD *)(a1 + 672);
        while (1)
        {
          *int v40 = v41;
          BOOL v33 = __OFSUB__(v39, 2);
          int v42 = v39 - 2;
          if (v42 < 0 != v33) {
            break;
          }
          unsigned int v39 = v42 >> 1;
          ++v25;
          ++v40;
          if ((v39 & 1) == 0) {
            goto LABEL_45;
          }
LABEL_46:
          ++*(_DWORD *)(a1 + 676);
          __int16 v41 = 1;
        }
      }
    }
    uint64_t v43 = v17 + 1;
    *(_WORD *)(v21 + 2 * v25) = v43;
    ++*(_DWORD *)(a1 + 4 * v43 + 672);
    *(_DWORD *)(a1 + 668) = v25 + 1;
    sub_20DB5312C(a1);
  }
  if (a2)
  {
    sub_20DB52F28(a1, 23);
    sub_20DB52F28(a1, 114);
    sub_20DB52F28(a1, 69);
    sub_20DB52F28(a1, 56);
    sub_20DB52F28(a1, 80);
    sub_20DB52F28(a1, 144);
    sub_20DB52F98(a1, *(_DWORD *)(a1 + 652));
    if (*(int *)(a1 + 656) > 1) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "    final combined CRC = 0x%08x\n   ", *(_DWORD *)(a1 + 652));
    }
    if (*(int *)(a1 + 644) >= 1)
    {
      int v44 = *(_DWORD *)(a1 + 640);
      int v45 = *(_DWORD *)(a1 + 116);
      do
      {
        *(unsigned char *)(*(void *)(a1 + 80) + v45) = HIBYTE(v44);
        int v45 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v45;
        int v44 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v44;
        int v46 = *(_DWORD *)(a1 + 644);
        BOOL v33 = __OFSUB__(v46, 8);
        v46 -= 8;
        *(_DWORD *)(a1 + 644) = v46;
      }
      while (!((v46 < 0) ^ v33 | (v46 == 0)));
    }
  }
}

uint64_t sub_20DB52F28(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 644);
  if (v2 <= 7)
  {
    int v3 = *(_DWORD *)(result + 640);
    int v5 = v2 + 8;
  }
  else
  {
    int v3 = *(_DWORD *)(result + 640);
    int v4 = *(_DWORD *)(result + 116);
    do
    {
      *(unsigned char *)(*(void *)(result + 80) + v4) = HIBYTE(v3);
      int v4 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v4;
      int v3 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v3;
      int v5 = *(_DWORD *)(result + 644);
      *(_DWORD *)(result + 644) = v5 - 8;
    }
    while (v5 > 15);
  }
  *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = (a2 << -(char)v5) | v3;
  *(_DWORD *)(result + 644) = v5;
  return result;
}

uint64_t sub_20DB52F98(uint64_t result, unsigned int a2)
{
  int v2 = *(_DWORD *)(result + 644);
  if (v2 <= 7)
  {
    int v3 = *(_DWORD *)(result + 640);
    int v5 = v2 + 8;
  }
  else
  {
    int v3 = *(_DWORD *)(result + 640);
    int v4 = *(_DWORD *)(result + 116);
    do
    {
      *(unsigned char *)(*(void *)(result + 80) + v4) = HIBYTE(v3);
      int v4 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v4;
      int v3 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v3;
      int v5 = *(_DWORD *)(result + 644);
      *(_DWORD *)(result + 644) = v5 - 8;
    }
    while (v5 > 15);
  }
  int v6 = (HIBYTE(a2) << -(char)v5) | v3;
  *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v6;
  *(_DWORD *)(result + 644) = v5;
  if (v5 >= 8)
  {
    int v7 = *(_DWORD *)(result + 116);
    do
    {
      *(unsigned char *)(*(void *)(result + 80) + v7) = HIBYTE(v6);
      int v7 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v7;
      int v6 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v6;
      int v8 = *(_DWORD *)(result + 644);
      int v5 = v8 - 8;
      *(_DWORD *)(result + 644) = v8 - 8;
    }
    while (v8 > 15);
  }
  int v9 = v5 + 8;
  int v10 = (BYTE2(a2) << (24 - v5)) | v6;
  *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v10;
  *(_DWORD *)(result + 644) = v5 + 8;
  if ((v5 & 0x80000000) == 0)
  {
    int v11 = *(_DWORD *)(result + 116);
    do
    {
      *(unsigned char *)(*(void *)(result + 80) + v11) = HIBYTE(v10);
      int v11 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v11;
      int v10 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v10;
      int v12 = *(_DWORD *)(result + 644);
      int v9 = v12 - 8;
      *(_DWORD *)(result + 644) = v12 - 8;
    }
    while (v12 > 15);
  }
  int v13 = v9 + 8;
  int v14 = (BYTE1(a2) << (24 - v9)) | v10;
  *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v14;
  *(_DWORD *)(result + 644) = v9 + 8;
  if ((v9 & 0x80000000) == 0)
  {
    int v15 = *(_DWORD *)(result + 116);
    do
    {
      *(unsigned char *)(*(void *)(result + 80) + v15) = HIBYTE(v14);
      int v15 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v15;
      int v14 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v14;
      int v16 = *(_DWORD *)(result + 644);
      int v13 = v16 - 8;
      *(_DWORD *)(result + 644) = v16 - 8;
    }
    while (v16 > 15);
  }
  *(_DWORD *)(result + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = (a2 << (24 - v13)) | v14;
  *(_DWORD *)(result + 644) = v13 + 8;
  return result;
}

uint64_t sub_20DB5312C(uint64_t a1)
{
  uint64_t v671 = *MEMORY[0x263EF8340];
  v654 = (int *)(a1 + 51648);
  v657 = (unsigned __int8 *)(a1 + 37708);
  uint64_t v2 = *(void *)(a1 + 72);
  if (*(int *)(a1 + 656) >= 3) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "      %d in block, %d after MTF & 1-2 coding, %d+2 syms in use\n", *(_DWORD *)(a1 + 108), *(_DWORD *)(a1 + 668), *(_DWORD *)(a1 + 124));
  }
  uint64_t v3 = 0;
  uint64_t v4 = *(int *)(a1 + 124);
  unsigned int v5 = v4 + 2;
  if ((int)v4 + 2 <= 1) {
    size_t v6 = 1;
  }
  else {
    size_t v6 = v5;
  }
  uint64_t v660 = *(int *)(a1 + 124);
  do
  {
    if ((int)v4 >= -1)
    {
      memset((void *)(a1 + 37708 + v3), 15, v6);
      uint64_t v4 = v660;
    }
    v3 += 258;
  }
  while (v3 != 1548);
  int v658 = v5;
  uint64_t v661 = v2;
  int v7 = *(_DWORD *)(a1 + 668);
  if (v7 <= 0) {
    sub_20DB50680(3001);
  }
  int v8 = 0;
  BOOL v9 = v7 > 0x95F;
  if (v7 <= 0x95F) {
    int v10 = 5;
  }
  else {
    int v10 = 6;
  }
  if (v7 >= 0x4B0)
  {
    int v11 = v10;
  }
  else
  {
    BOOL v9 = 0;
    int v11 = 4;
  }
  if (v7 >= 0x258)
  {
    unsigned int v12 = v11;
  }
  else
  {
    BOOL v9 = 0;
    unsigned int v12 = 3;
  }
  BOOL v13 = v7 >= 200 && v9;
  BOOL v662 = v13;
  if (v7 >= 200) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = 2;
  }
  uint64_t v15 = (v6 + 1) & 0xFFFFFFFE;
  size_t v656 = v6;
  uint64x2_t v16 = (uint64x2_t)vdupq_n_s64(v6 - 1);
  uint64_t v17 = a1 + 258 * v14;
  uint64_t v18 = v17 + 37450;
  uint64_t v19 = v17 + 37451;
  uint64_t v20 = v14;
  uint64x2_t v663 = v16;
  do
  {
    int v21 = v8 - 1;
    int v22 = 0;
    BOOL v23 = v7 / (int)v20 >= 1 && v21 <= (int)v4;
    if (v23)
    {
      uint64_t v24 = v21;
      do
      {
        int v21 = v24 + 1;
        v22 += *(_DWORD *)(a1 + 676 + 4 * v24);
      }
      while (v22 < v7 / (int)v20 && v24++ < v4);
    }
    if (v21 > v8 && v20 != v14 && v20 != 1 && ((v14 - v20) & 0x80000001) == 1) {
      v22 -= *(_DWORD *)(a1 + 4 * v21-- + 672);
    }
    if (*(int *)(a1 + 656) >= 3)
    {
      uint64_t v665 = v20;
      fprintf((FILE *)*MEMORY[0x263EF8348], "      initial group %d, [%d .. %d], has %d syms (%4.1f%%)\n", v20, v8, v21, v22, (float)v22 * 100.0 / (float)*(int *)(a1 + 668));
      uint64_t v20 = v665;
      uint64x2_t v16 = v663;
      uint64_t v4 = v660;
    }
    if ((int)v4 >= -1)
    {
      uint64_t v26 = 0;
      int64x2_t v27 = (int64x2_t)xmmword_20DB59150;
      do
      {
        int32x2_t v28 = vmovn_s64((int64x2_t)vcgeq_u64(v16, (uint64x2_t)v27));
        if (v28.i8[0])
        {
          if (v26 > v21 || v26 < v8) {
            char v30 = 15;
          }
          else {
            char v30 = 0;
          }
          *(unsigned char *)(v18 + v26) = v30;
        }
        if (v28.i8[4])
        {
          if (v26 + 1 > v21 || v26 + 1 < v8) {
            char v32 = 15;
          }
          else {
            char v32 = 0;
          }
          *(unsigned char *)(v19 + v26) = v32;
        }
        v26 += 2;
        int64x2_t v27 = vaddq_s64(v27, vdupq_n_s64(2uLL));
      }
      while (v15 != v26);
    }
    int v8 = v21 + 1;
    v7 -= v22;
    v18 -= 258;
    v19 -= 258;
    BOOL v23 = v20-- <= 1;
  }
  while (!v23);
  int v659 = 0;
  size_t v33 = 4 * v656;
  BOOL v34 = v662;
  if ((int)v4 <= -2) {
    BOOL v34 = 0;
  }
  BOOL v655 = v34;
  uint64_t v35 = a1 + 51640;
  do
  {
    bzero(v669, 4 * v14);
    uint64_t v36 = v14;
    int v37 = (char *)(a1 + 45448);
    int v38 = v660;
    do
    {
      if (v38 >= -1)
      {
        bzero(v37, v33);
        int v38 = v660;
      }
      v37 += 1032;
      --v36;
    }
    while (v36);
    if (v655)
    {
      unsigned int v39 = v654;
      size_t v40 = v656;
      __int16 v41 = v657;
      do
      {
        *(v39 - 2) = *v41 | (v41[258] << 16);
        *(v39 - 1) = v41[516] | (v41[774] << 16);
        *unsigned int v39 = v41[1032] | (v41[1290] << 16);
        v39 += 4;
        ++v41;
        --v40;
      }
      while (v40);
    }
    int v42 = *(_DWORD *)(a1 + 668);
    if (v42 < 1)
    {
      unsigned int v667 = 0;
      int v45 = 0;
    }
    else
    {
      uint64_t v43 = 0;
      int v44 = 0;
      int v45 = 0;
      do
      {
        int v664 = v45;
        uint64_t v666 = v43;
        uint64_t v46 = v44 + 49;
        bzero(v670, 2 * v14);
        if ((int)v46 >= v42) {
          int v47 = v42 - 1;
        }
        else {
          int v47 = v44 + 49;
        }
        BOOL v48 = v662;
        if (v47 - v44 != 49) {
          BOOL v48 = 0;
        }
        if (v48)
        {
          uint64_t v49 = v661;
          int v50 = (unsigned __int16 *)(v661 + 2 * v44);
          unsigned __int16 v51 = (_DWORD *)(v35 + 16 * *v50);
          unint64_t v52 = (_DWORD *)(v35 + 16 * v50[1]);
          int v53 = *v52 + *v51;
          int v54 = v52[1] + v51[1];
          LODWORD(v51) = v52[2] + v51[2];
          int v55 = (_DWORD *)(v35 + 16 * v50[2]);
          int v56 = (_DWORD *)(v35 + 16 * v50[3]);
          int v57 = v53 + *v55 + *v56;
          int v58 = v54 + v55[1] + v56[1];
          LODWORD(v51) = v51 + v55[2] + v56[2];
          int v59 = (_DWORD *)(v35 + 16 * v50[4]);
          int v60 = (_DWORD *)(v35 + 16 * v50[5]);
          int v61 = *v59 + *v60;
          int v62 = v59[1] + v60[1];
          LODWORD(v59) = v59[2] + v60[2];
          int v63 = (_DWORD *)(v35 + 16 * v50[6]);
          int v64 = v57 + v61 + *v63;
          int v65 = v58 + v62 + v63[1];
          LODWORD(v51) = v51 + v59 + v63[2];
          int v66 = (_DWORD *)(v35 + 16 * v50[7]);
          int v67 = (_DWORD *)(v35 + 16 * v50[8]);
          int v68 = *v66 + *v67;
          int v69 = v66[1] + v67[1];
          LODWORD(v66) = v66[2] + v67[2];
          uint64_t v70 = (_DWORD *)(v35 + 16 * v50[9]);
          int v71 = v68 + *v70;
          int v72 = v69 + v70[1];
          LODWORD(v66) = v66 + v70[2];
          int v73 = (_DWORD *)(v35 + 16 * v50[10]);
          int v74 = v64 + v71 + *v73;
          int v75 = v65 + v72 + v73[1];
          LODWORD(v51) = v51 + v66 + v73[2];
          int v76 = (_DWORD *)(v35 + 16 * v50[11]);
          int v77 = (_DWORD *)(v35 + 16 * v50[12]);
          int v78 = *v76 + *v77;
          int v79 = v76[1] + v77[1];
          LODWORD(v76) = v76[2] + v77[2];
          uint64_t v80 = (_DWORD *)(v35 + 16 * v50[13]);
          int v81 = v78 + *v80;
          int v82 = v79 + v80[1];
          LODWORD(v76) = v76 + v80[2];
          int v83 = (_DWORD *)(v35 + 16 * v50[14]);
          int v84 = v81 + *v83;
          int v85 = v82 + v83[1];
          LODWORD(v76) = v76 + v83[2];
          uint64_t v86 = (_DWORD *)(v35 + 16 * v50[15]);
          int v87 = v74 + v84 + *v86;
          int v88 = v75 + v85 + v86[1];
          LODWORD(v76) = v51 + v76 + v86[2];
          int v89 = (_DWORD *)(v35 + 16 * v50[16]);
          unint64_t v90 = (_DWORD *)(v35 + 16 * v50[17]);
          int v91 = *v89 + *v90;
          int v92 = v89[1] + v90[1];
          LODWORD(v89) = v89[2] + v90[2];
          int v93 = (_DWORD *)(v35 + 16 * v50[18]);
          int v94 = v91 + *v93;
          int v95 = v92 + v93[1];
          LODWORD(v89) = v89 + v93[2];
          int v96 = (_DWORD *)(v35 + 16 * v50[19]);
          int v97 = v94 + *v96;
          int v98 = v95 + v96[1];
          LODWORD(v89) = v89 + v96[2];
          int v99 = (_DWORD *)(v35 + 16 * v50[20]);
          int v100 = v97 + *v99;
          int v101 = v98 + v99[1];
          LODWORD(v99) = v89 + v99[2];
          int v102 = (_DWORD *)(v35 + 16 * v50[21]);
          LODWORD(v89) = v87 + v100 + *v102;
          int v103 = v88 + v101 + v102[1];
          int v104 = v76 + v99 + v102[2];
          int v105 = (_DWORD *)(v35 + 16 * v50[22]);
          unint64_t v106 = (_DWORD *)(v35 + 16 * v50[23]);
          int v107 = *v105 + *v106;
          int v108 = v105[1] + v106[1];
          LODWORD(v105) = v105[2] + v106[2];
          int v109 = (_DWORD *)(v35 + 16 * v50[24]);
          int v110 = v107 + *v109;
          int v111 = v108 + v109[1];
          LODWORD(v105) = v105 + v109[2];
          uint64_t v112 = (_DWORD *)(v35 + 16 * v50[25]);
          int v113 = v110 + *v112;
          int v114 = v111 + v112[1];
          LODWORD(v105) = v105 + v112[2];
          int v115 = (_DWORD *)(v35 + 16 * v50[26]);
          int v116 = v113 + *v115;
          int v117 = v114 + v115[1];
          LODWORD(v105) = v105 + v115[2];
          int v118 = (_DWORD *)(v35 + 16 * v50[27]);
          int v119 = v116 + *v118;
          int v120 = v117 + v118[1];
          LODWORD(v105) = v105 + v118[2];
          unint64_t v121 = (_DWORD *)(v35 + 16 * v50[28]);
          LODWORD(v89) = v89 + v119 + *v121;
          int v122 = v103 + v120 + v121[1];
          int v123 = v104 + v105 + v121[2];
          unsigned __int16 v124 = (_DWORD *)(v35 + 16 * v50[29]);
          unint64_t v125 = (_DWORD *)(v35 + 16 * v50[30]);
          int v126 = *v124 + *v125;
          int v127 = v124[1] + v125[1];
          LODWORD(v124) = v124[2] + v125[2];
          int v128 = (_DWORD *)(v35 + 16 * v50[31]);
          int v129 = v126 + *v128;
          int v130 = v127 + v128[1];
          LODWORD(v124) = v124 + v128[2];
          int v131 = (_DWORD *)(v35 + 16 * v50[32]);
          int v132 = v129 + *v131;
          int v133 = v130 + v131[1];
          LODWORD(v124) = v124 + v131[2];
          unint64_t v134 = (_DWORD *)(v35 + 16 * v50[33]);
          int v135 = v132 + *v134;
          int v136 = v133 + v134[1];
          LODWORD(v124) = v124 + v134[2];
          int v137 = (_DWORD *)(v35 + 16 * v50[34]);
          int v138 = v135 + *v137;
          int v139 = v136 + v137[1];
          LODWORD(v124) = v124 + v137[2];
          int v140 = (_DWORD *)(v35 + 16 * v50[35]);
          int v141 = v138 + *v140;
          int v142 = v139 + v140[1];
          LODWORD(v124) = v124 + v140[2];
          int v143 = (_DWORD *)(v35 + 16 * v50[36]);
          LODWORD(v89) = v89 + v141 + *v143;
          int v144 = v122 + v142 + v143[1];
          int v145 = v123 + v124 + v143[2];
          unint64_t v146 = (_DWORD *)(v35 + 16 * v50[37]);
          unint64_t v147 = (_DWORD *)(v35 + 16 * v50[38]);
          int v148 = *v146 + *v147;
          int v149 = v146[1] + v147[1];
          LODWORD(v146) = v146[2] + v147[2];
          int v150 = (_DWORD *)(v35 + 16 * v50[39]);
          int v151 = v148 + *v150;
          int v152 = v149 + v150[1];
          LODWORD(v146) = v146 + v150[2];
          int v153 = (_DWORD *)(v35 + 16 * v50[40]);
          int v154 = v151 + *v153;
          int v155 = v152 + v153[1];
          LODWORD(v146) = v146 + v153[2];
          int v156 = (_DWORD *)(v35 + 16 * v50[41]);
          int v157 = v154 + *v156;
          int v158 = v155 + v156[1];
          LODWORD(v146) = v146 + v156[2];
          int v159 = (_DWORD *)(v35 + 16 * v50[42]);
          int v160 = v157 + *v159;
          int v161 = v158 + v159[1];
          LODWORD(v146) = v146 + v159[2];
          uint64_t v162 = (_DWORD *)(v35 + 16 * v50[43]);
          int v163 = v160 + *v162;
          int v164 = v161 + v162[1];
          LODWORD(v146) = v146 + v162[2];
          uint64_t v165 = (_DWORD *)(v35 + 16 * v50[44]);
          int v166 = v163 + *v165;
          int v167 = v164 + v165[1];
          LODWORD(v146) = v146 + v165[2];
          int v168 = (_DWORD *)(v35 + 16 * v50[45]);
          LODWORD(v89) = v89 + v166 + *v168;
          int v169 = v144 + v167 + v168[1];
          int v170 = v145 + v146 + v168[2];
          uint64_t v171 = (_DWORD *)(v35 + 16 * v50[46]);
          uint64_t v172 = (_DWORD *)(v35 + 16 * v50[47]);
          uint64_t v173 = (_DWORD *)(v35 + 16 * v50[48]);
          int v174 = *v171 + *v172 + *v173;
          int v175 = v171[1] + v172[1] + v173[1];
          LODWORD(v173) = v171[2] + v172[2] + v173[2];
          uint64_t v176 = (_DWORD *)(v35 + 16 * *(unsigned __int16 *)(v661 + 2 * v46));
          int v177 = v169 + v175 + v176[1];
          LODWORD(v173) = v170 + v173 + v176[2];
          v670[0] = v89 + v174 + *v176;
          v670[1] = v177;
          v670[2] = v173;
          uint64_t v178 = v666;
          int v179 = v664;
        }
        else
        {
          uint64_t v49 = v661;
          uint64_t v178 = v666;
          int v179 = v664;
          if (v47 >= v44)
          {
            uint64_t v180 = v44;
            do
            {
              uint64_t v181 = (unsigned __int8 *)(a1 + 37708 + *(unsigned __int16 *)(v661 + 2 * v180));
              int v182 = v670;
              uint64_t v183 = v14;
              do
              {
                *v182++ += *v181;
                v181 += 258;
                --v183;
              }
              while (v183);
              ++v180;
            }
            while (v47 + 1 != v180);
          }
        }
        uint64_t v184 = 0;
        int v185 = -1;
        int v186 = 999999999;
        do
        {
          int v187 = *((unsigned __int16 *)v670 + v184);
          if (v186 > v187) {
            int v185 = v184;
          }
          if (v186 >= v187) {
            int v186 = *((unsigned __int16 *)v670 + v184);
          }
          ++v184;
        }
        while (v14 != v184);
        int v188 = v185;
        ++v669[v185];
        *(unsigned char *)(a1 + v178 + 1704) = v185;
        if (v48)
        {
          int v189 = (unsigned __int16 *)(v49 + 2 * v44);
          uint64_t v190 = a1 + 1032 * v188 + 45448;
          ++*(_DWORD *)(v190 + 4 * *v189);
          ++*(_DWORD *)(v190 + 4 * v189[1]);
          ++*(_DWORD *)(v190 + 4 * v189[2]);
          ++*(_DWORD *)(v190 + 4 * v189[3]);
          ++*(_DWORD *)(v190 + 4 * v189[4]);
          ++*(_DWORD *)(v190 + 4 * v189[5]);
          ++*(_DWORD *)(v190 + 4 * v189[6]);
          ++*(_DWORD *)(v190 + 4 * v189[7]);
          ++*(_DWORD *)(v190 + 4 * v189[8]);
          ++*(_DWORD *)(v190 + 4 * v189[9]);
          ++*(_DWORD *)(v190 + 4 * v189[10]);
          ++*(_DWORD *)(v190 + 4 * v189[11]);
          ++*(_DWORD *)(v190 + 4 * v189[12]);
          ++*(_DWORD *)(v190 + 4 * v189[13]);
          ++*(_DWORD *)(v190 + 4 * v189[14]);
          ++*(_DWORD *)(v190 + 4 * v189[15]);
          ++*(_DWORD *)(v190 + 4 * v189[16]);
          ++*(_DWORD *)(v190 + 4 * v189[17]);
          ++*(_DWORD *)(v190 + 4 * v189[18]);
          ++*(_DWORD *)(v190 + 4 * v189[19]);
          ++*(_DWORD *)(v190 + 4 * v189[20]);
          ++*(_DWORD *)(v190 + 4 * v189[21]);
          ++*(_DWORD *)(v190 + 4 * v189[22]);
          ++*(_DWORD *)(v190 + 4 * v189[23]);
          ++*(_DWORD *)(v190 + 4 * v189[24]);
          ++*(_DWORD *)(v190 + 4 * v189[25]);
          ++*(_DWORD *)(v190 + 4 * v189[26]);
          ++*(_DWORD *)(v190 + 4 * v189[27]);
          ++*(_DWORD *)(v190 + 4 * v189[28]);
          ++*(_DWORD *)(v190 + 4 * v189[29]);
          ++*(_DWORD *)(v190 + 4 * v189[30]);
          ++*(_DWORD *)(v190 + 4 * v189[31]);
          ++*(_DWORD *)(v190 + 4 * v189[32]);
          ++*(_DWORD *)(v190 + 4 * v189[33]);
          ++*(_DWORD *)(v190 + 4 * v189[34]);
          ++*(_DWORD *)(v190 + 4 * v189[35]);
          ++*(_DWORD *)(v190 + 4 * v189[36]);
          ++*(_DWORD *)(v190 + 4 * v189[37]);
          ++*(_DWORD *)(v190 + 4 * v189[38]);
          ++*(_DWORD *)(v190 + 4 * v189[39]);
          ++*(_DWORD *)(v190 + 4 * v189[40]);
          ++*(_DWORD *)(v190 + 4 * v189[41]);
          ++*(_DWORD *)(v190 + 4 * v189[42]);
          ++*(_DWORD *)(v190 + 4 * v189[43]);
          ++*(_DWORD *)(v190 + 4 * v189[44]);
          ++*(_DWORD *)(v190 + 4 * v189[45]);
          ++*(_DWORD *)(v190 + 4 * v189[46]);
          ++*(_DWORD *)(v190 + 4 * v189[47]);
          ++*(_DWORD *)(v190 + 4 * v189[48]);
          uint64_t v191 = *(unsigned __int16 *)(v49 + 2 * (v44 + 49));
          ++*(_DWORD *)(v190 + 4 * v191);
        }
        else if (v47 >= v44)
        {
          uint64_t v192 = (unsigned __int16 *)(v49 + 2 * v44);
          int v193 = v47 - v44 + 1;
          do
          {
            unsigned int v194 = *v192++;
            uint64_t v195 = a1 + 1032 * v188 + 4 * v194;
            ++*(_DWORD *)(v195 + 45448);
            --v193;
          }
          while (v193);
        }
        int v45 = v186 + v179;
        uint64_t v43 = v178 + 1;
        int v44 = v47 + 1;
        int v42 = *(_DWORD *)(a1 + 668);
      }
      while (v47 + 1 < v42);
      unsigned int v667 = v43;
    }
    if (*(int *)(a1 + 656) >= 3)
    {
      int v196 = (FILE **)MEMORY[0x263EF8348];
      fprintf((FILE *)*MEMORY[0x263EF8348], "      pass %d: size is %d, grp uses are ", v659 + 1, v45 / 8);
      uint64_t v197 = v669;
      uint64_t v198 = v14;
      do
      {
        int v199 = *v197++;
        fprintf(*v196, "%d ", v199);
        --v198;
      }
      while (v198);
      fputc(10, *v196);
    }
    uint64_t v200 = v14;
    v202 = v657;
    uint64_t v201 = a1 + 45448;
    do
    {
      sub_20DB58A04();
      v202 += 258;
      v201 += 1032;
      --v200;
    }
    while (v200);
    ++v659;
    size_t v33 = 4 * v656;
  }
  while (v659 != 4);
  if (v667 >= 0x4653) {
    sub_20DB50680(3003);
  }
  for (uint64_t i = 0; i != v14; ++i)
    v668[i] = i;
  if (v667)
  {
    uint64_t v204 = 0;
    int v205 = v668[0];
    do
    {
      int v206 = *(unsigned __int8 *)(a1 + v204 + 1704);
      if (v206 == v205)
      {
        LOBYTE(v207) = 0;
      }
      else
      {
        uint64_t v207 = 0;
        do
        {
          int v208 = v668[v207 + 1];
          v668[++v207] = v205;
          LOBYTE(v205) = v208;
        }
        while (v206 != v208);
        int v205 = v206;
      }
      *(unsigned char *)(a1 + v204++ + 19706) = v207;
    }
    while (v204 != v667);
  }
  uint64_t v209 = 0;
  v210 = (unsigned __int8 *)(a1 + 37708);
  do
  {
    if ((int)v660 < -1)
    {
      int v211 = 0;
      int v212 = 32;
    }
    else
    {
      int v211 = 0;
      int v212 = 32;
      size_t v213 = v656;
      v214 = v210;
      do
      {
        int v216 = *v214++;
        int v215 = v216;
        if (v211 <= v216) {
          int v211 = v215;
        }
        if (v212 >= v215) {
          int v212 = v215;
        }
        --v213;
      }
      while (v213);
      if (v211 >= 0x12) {
        sub_20DB50680(3004);
      }
      if (v212 <= 0) {
        sub_20DB50680(3005);
      }
    }
    sub_20DB58E04((_DWORD *)(a1 + 1032 * v209 + 39256), (unsigned __int8 *)(a1 + 258 * v209 + 37708), v212, v211, v658);
    ++v209;
    v210 += 258;
  }
  while (v209 != v14);
  uint64_t v217 = 0;
  v218 = (FILE **)MEMORY[0x263EF8348];
  do
  {
    v668[v217] = 0;
    int8x16_t v219 = vtstq_s8(*(int8x16_t *)(a1 + 128 + 16 * v217), *(int8x16_t *)(a1 + 128 + 16 * v217));
    if ((v219.i8[0] & 1) != 0
      || (v219.i8[1] & 1) != 0
      || (v219.i8[2] & 1) != 0
      || (v219.i8[3] & 1) != 0
      || (v219.i8[4] & 1) != 0
      || (v219.i8[5] & 1) != 0
      || (v219.i8[6] & 1) != 0
      || (v219.i8[7] & 1) != 0
      || (v219.i8[8] & 1) != 0
      || (v219.i8[9] & 1) != 0
      || (v219.i8[10] & 1) != 0
      || (v219.i8[11] & 1) != 0
      || (v219.i8[12] & 1) != 0
      || (v219.i8[13] & 1) != 0
      || (v219.i8[14] & 1) != 0
      || (v219.i8[15] & 1) != 0)
    {
      v668[v217] = 1;
    }
    ++v217;
  }
  while (v217 != 16);
  uint64_t v220 = 0;
  int v221 = *(_DWORD *)(a1 + 116);
  int v222 = v221;
  do
  {
    int v223 = *(_DWORD *)(a1 + 644);
    int v224 = *(_DWORD *)(a1 + 640);
    if (v668[v220])
    {
      if (v223 >= 8)
      {
        do
        {
          *(unsigned char *)(*(void *)(a1 + 80) + v222) = HIBYTE(v224);
          int v222 = *(_DWORD *)(a1 + 116) + 1;
          *(_DWORD *)(a1 + 116) = v222;
          int v224 = *(_DWORD *)(a1 + 640) << 8;
          *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v224;
          int v225 = *(_DWORD *)(a1 + 644);
          int v223 = v225 - 8;
          *(_DWORD *)(a1 + 644) = v225 - 8;
        }
        while (v225 > 15);
      }
      v224 |= 0x80000000 >> v223;
    }
    else if (v223 >= 8)
    {
      do
      {
        *(unsigned char *)(*(void *)(a1 + 80) + v222) = HIBYTE(v224);
        int v222 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v222;
        int v224 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v224;
        int v226 = *(_DWORD *)(a1 + 644);
        int v223 = v226 - 8;
        *(_DWORD *)(a1 + 644) = v226 - 8;
      }
      while (v226 > 15);
    }
    int v227 = v223 + 1;
    *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v224;
    *(_DWORD *)(a1 + 644) = v227;
    ++v220;
  }
  while (v220 != 16);
  for (uint64_t j = 0; j != 16; ++j)
  {
    if (v668[j])
    {
      for (uint64_t k = 0; k != 16; ++k)
      {
        if (*(unsigned char *)(a1 + k + 16 * j + 128))
        {
          if (v227 >= 8)
          {
            do
            {
              *(unsigned char *)(*(void *)(a1 + 80) + v222) = HIBYTE(v224);
              int v222 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v222;
              int v224 = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v224;
              int v230 = *(_DWORD *)(a1 + 644);
              int v227 = v230 - 8;
              *(_DWORD *)(a1 + 644) = v230 - 8;
            }
            while (v230 > 15);
          }
          v224 |= 0x80000000 >> v227;
        }
        else if (v227 >= 8)
        {
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v222) = HIBYTE(v224);
            int v222 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v222;
            int v224 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v224;
            int v231 = *(_DWORD *)(a1 + 644);
            int v227 = v231 - 8;
            *(_DWORD *)(a1 + 644) = v231 - 8;
          }
          while (v231 > 15);
        }
        ++v227;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v224;
        *(_DWORD *)(a1 + 644) = v227;
      }
    }
  }
  if (*(int *)(a1 + 656) >= 3)
  {
    fprintf(*v218, "      bytes: mapping %d, ", v222 - v221);
    int v222 = *(_DWORD *)(a1 + 116);
    int v227 = *(_DWORD *)(a1 + 644);
  }
  int v232 = *(_DWORD *)(a1 + 640);
  int v233 = v222;
  if (v227 >= 8)
  {
    do
    {
      *(unsigned char *)(*(void *)(a1 + 80) + v233) = HIBYTE(v232);
      int v233 = *(_DWORD *)(a1 + 116) + 1;
      *(_DWORD *)(a1 + 116) = v233;
      int v232 = *(_DWORD *)(a1 + 640) << 8;
      *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v232;
      int v234 = *(_DWORD *)(a1 + 644);
      int v227 = v234 - 8;
      *(_DWORD *)(a1 + 644) = v234 - 8;
    }
    while (v234 > 15);
  }
  int v235 = v227 + 3;
  int v236 = (v14 << (29 - v227)) | v232;
  *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v236;
  *(_DWORD *)(a1 + 644) = v227 + 3;
  if (v227 >= 5)
  {
    do
    {
      *(unsigned char *)(*(void *)(a1 + 80) + v233) = HIBYTE(v236);
      int v233 = *(_DWORD *)(a1 + 116) + 1;
      *(_DWORD *)(a1 + 116) = v233;
      int v236 = *(_DWORD *)(a1 + 640) << 8;
      *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v236;
      int v237 = *(_DWORD *)(a1 + 644);
      int v235 = v237 - 8;
      *(_DWORD *)(a1 + 644) = v237 - 8;
    }
    while (v237 > 15);
  }
  int v238 = v235 + 15;
  int v239 = (v667 << (17 - v235)) | v236;
  *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v239;
  *(_DWORD *)(a1 + 644) = v235 + 15;
  if (v667)
  {
    for (uint64_t m = 0; m != v667; ++m)
    {
      v241 = (unsigned __int8 *)(a1 + m + 19706);
      unsigned __int8 v242 = *v241;
      if (*v241)
      {
        unsigned int v243 = 0;
        do
        {
          if (v238 >= 8)
          {
            do
            {
              *(unsigned char *)(*(void *)(a1 + 80) + v233) = HIBYTE(v239);
              int v233 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v233;
              int v239 = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v239;
              int v244 = *(_DWORD *)(a1 + 644);
              int v238 = v244 - 8;
              *(_DWORD *)(a1 + 644) = v244 - 8;
            }
            while (v244 > 15);
            unsigned __int8 v242 = *v241;
          }
          int v245 = v238 + 1;
          v239 |= 0x80000000 >> v238;
          *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v239;
          *(_DWORD *)(a1 + 644) = v238 + 1;
          ++v243;
          ++v238;
        }
        while (v243 < v242);
      }
      else
      {
        int v245 = v238;
      }
      if (v245 >= 8)
      {
        do
        {
          *(unsigned char *)(*(void *)(a1 + 80) + v233) = HIBYTE(v239);
          int v233 = *(_DWORD *)(a1 + 116) + 1;
          *(_DWORD *)(a1 + 116) = v233;
          int v239 = *(_DWORD *)(a1 + 640) << 8;
          *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v239;
          int v246 = *(_DWORD *)(a1 + 644);
          int v245 = v246 - 8;
          *(_DWORD *)(a1 + 644) = v246 - 8;
        }
        while (v246 > 15);
      }
      int v238 = v245 + 1;
      *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v239;
      *(_DWORD *)(a1 + 644) = v245 + 1;
    }
  }
  if (*(int *)(a1 + 656) >= 3)
  {
    fprintf(*v218, "selectors %d, ", v233 - v222);
    int v233 = *(_DWORD *)(a1 + 116);
    int v238 = *(_DWORD *)(a1 + 644);
  }
  uint64_t v247 = 0;
  int v248 = v233;
  do
  {
    int v249 = *(unsigned __int8 *)(a1 + 258 * v247 + 37708);
    unsigned int v250 = *(_DWORD *)(a1 + 640);
    if (v238 >= 8)
    {
      do
      {
        *(unsigned char *)(*(void *)(a1 + 80) + v248) = HIBYTE(v250);
        int v248 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v248;
        unsigned int v250 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v250;
        int v251 = *(_DWORD *)(a1 + 644);
        int v238 = v251 - 8;
        *(_DWORD *)(a1 + 644) = v251 - 8;
      }
      while (v251 > 15);
    }
    int v252 = v238 + 5;
    uint64_t result = (v249 << (27 - v238)) | v250;
    *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = result;
    *(_DWORD *)(a1 + 644) = v238 + 5;
    if ((int)v660 >= -1)
    {
      uint64_t v254 = 0;
      do
      {
        v255 = (unsigned __int8 *)(a1 + 258 * v247 + v254 + 37708);
        while (1)
        {
          int v256 = *v255;
          if (v249 >= v256) {
            break;
          }
          if (v252 >= 8)
          {
            do
            {
              *(unsigned char *)(*(void *)(a1 + 80) + v248) = BYTE3(result);
              int v248 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v248;
              LODWORD(result) = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = result;
              int v257 = *(_DWORD *)(a1 + 644);
              int v252 = v257 - 8;
              *(_DWORD *)(a1 + 644) = v257 - 8;
            }
            while (v257 > 15);
          }
          char v258 = 30 - v252;
          v252 += 2;
          uint64_t result = (2 << v258) | result;
          *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = result;
          *(_DWORD *)(a1 + 644) = v252;
          ++v249;
        }
        while (v249 > v256)
        {
          if (v252 >= 8)
          {
            do
            {
              *(unsigned char *)(*(void *)(a1 + 80) + v248) = BYTE3(result);
              int v248 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v248;
              LODWORD(result) = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = result;
              int v259 = *(_DWORD *)(a1 + 644);
              int v252 = v259 - 8;
              *(_DWORD *)(a1 + 644) = v259 - 8;
            }
            while (v259 > 15);
          }
          char v260 = 30 - v252;
          v252 += 2;
          uint64_t result = (3 << v260) | result;
          *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = result;
          *(_DWORD *)(a1 + 644) = v252;
          --v249;
          int v256 = *v255;
        }
        if (v252 >= 8)
        {
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v248) = BYTE3(result);
            int v248 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v248;
            uint64_t result = (*(_DWORD *)(a1 + 640) << 8);
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = result;
            int v261 = *(_DWORD *)(a1 + 644);
            int v252 = v261 - 8;
            *(_DWORD *)(a1 + 644) = v261 - 8;
          }
          while (v261 > 15);
        }
        ++v252;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = result;
        *(_DWORD *)(a1 + 644) = v252;
        ++v254;
      }
      while (v254 != v656);
    }
    ++v247;
    int v238 = v252;
  }
  while (v247 != v14);
  if (*(int *)(a1 + 656) >= 3)
  {
    uint64_t result = fprintf(*v218, "code lengths %d, ", v248 - v233);
    int v248 = *(_DWORD *)(a1 + 116);
  }
  int v262 = *(_DWORD *)(a1 + 668);
  if (v262 < 1)
  {
    LODWORD(v263) = 0;
  }
  else
  {
    uint64_t v263 = 0;
    int v264 = 0;
    do
    {
      uint64_t v265 = v264;
      uint64_t v266 = v264 + 49;
      if ((int)v266 >= v262) {
        int v267 = v262 - 1;
      }
      else {
        int v267 = v264 + 49;
      }
      if (v14 <= *(unsigned __int8 *)(a1 + v263 + 1704)) {
        sub_20DB50680(3006);
      }
      v268 = (unsigned __int8 *)(a1 + v263 + 1704);
      BOOL v269 = v662;
      if (v267 - v265 != 49) {
        BOOL v269 = 0;
      }
      if (v269)
      {
        unsigned int v270 = *v268;
        uint64_t v271 = a1 + 258 * *v268 + 37708;
        uint64_t v272 = *(unsigned __int16 *)(v661 + 2 * v265);
        int v273 = *(unsigned __int8 *)(v271 + v272);
        uint64_t v274 = a1 + 1032 * v270 + 39256;
        int v275 = *(_DWORD *)(v274 + 4 * v272);
        int v276 = *(_DWORD *)(a1 + 644);
        int v277 = *(_DWORD *)(a1 + 640);
        if (v276 >= 8)
        {
          int v278 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v278) = HIBYTE(v277);
            int v278 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v278;
            int v277 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v277;
            int v279 = *(_DWORD *)(a1 + 644);
            int v276 = v279 - 8;
            *(_DWORD *)(a1 + 644) = v279 - 8;
          }
          while (v279 > 15);
        }
        int v280 = v276 + v273;
        int v281 = (v275 << -(char)(v276 + v273)) | v277;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v281;
        *(_DWORD *)(a1 + 644) = v280;
        uint64_t v282 = v661 + 2 * v265;
        uint64_t v283 = *(unsigned __int16 *)(v282 + 2);
        int v284 = *(unsigned __int8 *)(v271 + v283);
        int v285 = *(_DWORD *)(v274 + 4 * v283);
        if (v280 >= 8)
        {
          int v286 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v286) = HIBYTE(v281);
            int v286 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v286;
            int v281 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v281;
            int v287 = *(_DWORD *)(a1 + 644);
            int v280 = v287 - 8;
            *(_DWORD *)(a1 + 644) = v287 - 8;
          }
          while (v287 > 15);
        }
        int v288 = v280 + v284;
        int v289 = (v285 << -(char)v288) | v281;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v289;
        *(_DWORD *)(a1 + 644) = v288;
        uint64_t v290 = *(unsigned __int16 *)(v282 + 4);
        int v291 = *(unsigned __int8 *)(v271 + v290);
        int v292 = *(_DWORD *)(v274 + 4 * v290);
        if (v288 >= 8)
        {
          int v293 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v293) = HIBYTE(v289);
            int v293 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v293;
            int v289 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v289;
            int v294 = *(_DWORD *)(a1 + 644);
            int v288 = v294 - 8;
            *(_DWORD *)(a1 + 644) = v294 - 8;
          }
          while (v294 > 15);
        }
        int v295 = v288 + v291;
        int v296 = (v292 << -(char)(v288 + v291)) | v289;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v296;
        *(_DWORD *)(a1 + 644) = v288 + v291;
        uint64_t v297 = v661 + 2 * v265;
        uint64_t v298 = *(unsigned __int16 *)(v297 + 6);
        int v299 = *(unsigned __int8 *)(v271 + v298);
        int v300 = *(_DWORD *)(v274 + 4 * v298);
        if (v295 >= 8)
        {
          int v301 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v301) = HIBYTE(v296);
            int v301 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v301;
            int v296 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v296;
            int v302 = *(_DWORD *)(a1 + 644);
            int v295 = v302 - 8;
            *(_DWORD *)(a1 + 644) = v302 - 8;
          }
          while (v302 > 15);
        }
        int v303 = v295 + v299;
        int v304 = (v300 << -(char)v303) | v296;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v304;
        *(_DWORD *)(a1 + 644) = v303;
        uint64_t v305 = *(unsigned __int16 *)(v297 + 8);
        int v306 = *(unsigned __int8 *)(v271 + v305);
        int v307 = *(_DWORD *)(v274 + 4 * v305);
        if (v303 >= 8)
        {
          int v308 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v308) = HIBYTE(v304);
            int v308 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v308;
            int v304 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v304;
            int v309 = *(_DWORD *)(a1 + 644);
            int v303 = v309 - 8;
            *(_DWORD *)(a1 + 644) = v309 - 8;
          }
          while (v309 > 15);
        }
        int v310 = v303 + v306;
        int v311 = (v307 << -(char)(v303 + v306)) | v304;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v311;
        *(_DWORD *)(a1 + 644) = v303 + v306;
        uint64_t v312 = v661 + 2 * v265;
        uint64_t v313 = *(unsigned __int16 *)(v312 + 10);
        int v314 = *(unsigned __int8 *)(v271 + v313);
        int v315 = *(_DWORD *)(v274 + 4 * v313);
        if (v310 >= 8)
        {
          int v316 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v316) = HIBYTE(v311);
            int v316 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v316;
            int v311 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v311;
            int v317 = *(_DWORD *)(a1 + 644);
            int v310 = v317 - 8;
            *(_DWORD *)(a1 + 644) = v317 - 8;
          }
          while (v317 > 15);
        }
        int v318 = v310 + v314;
        int v319 = (v315 << -(char)v318) | v311;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v319;
        *(_DWORD *)(a1 + 644) = v318;
        uint64_t v320 = *(unsigned __int16 *)(v312 + 12);
        int v321 = *(unsigned __int8 *)(v271 + v320);
        int v322 = *(_DWORD *)(v274 + 4 * v320);
        if (v318 >= 8)
        {
          int v323 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v323) = HIBYTE(v319);
            int v323 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v323;
            int v319 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v319;
            int v324 = *(_DWORD *)(a1 + 644);
            int v318 = v324 - 8;
            *(_DWORD *)(a1 + 644) = v324 - 8;
          }
          while (v324 > 15);
        }
        int v325 = v318 + v321;
        int v326 = (v322 << -(char)(v318 + v321)) | v319;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v326;
        *(_DWORD *)(a1 + 644) = v318 + v321;
        uint64_t v327 = v661 + 2 * v265;
        uint64_t v328 = *(unsigned __int16 *)(v327 + 14);
        int v329 = *(unsigned __int8 *)(v271 + v328);
        int v330 = *(_DWORD *)(v274 + 4 * v328);
        if (v325 >= 8)
        {
          int v331 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v331) = HIBYTE(v326);
            int v331 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v331;
            int v326 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v326;
            int v332 = *(_DWORD *)(a1 + 644);
            int v325 = v332 - 8;
            *(_DWORD *)(a1 + 644) = v332 - 8;
          }
          while (v332 > 15);
        }
        int v333 = v325 + v329;
        int v334 = (v330 << -(char)v333) | v326;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v334;
        *(_DWORD *)(a1 + 644) = v333;
        uint64_t v335 = *(unsigned __int16 *)(v327 + 16);
        int v336 = *(unsigned __int8 *)(v271 + v335);
        int v337 = *(_DWORD *)(v274 + 4 * v335);
        if (v333 >= 8)
        {
          int v338 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v338) = HIBYTE(v334);
            int v338 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v338;
            int v334 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v334;
            int v339 = *(_DWORD *)(a1 + 644);
            int v333 = v339 - 8;
            *(_DWORD *)(a1 + 644) = v339 - 8;
          }
          while (v339 > 15);
        }
        int v340 = v333 + v336;
        int v341 = (v337 << -(char)(v333 + v336)) | v334;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v341;
        *(_DWORD *)(a1 + 644) = v333 + v336;
        uint64_t v342 = v661 + 2 * v265;
        uint64_t v343 = *(unsigned __int16 *)(v342 + 18);
        int v344 = *(unsigned __int8 *)(v271 + v343);
        int v345 = *(_DWORD *)(v274 + 4 * v343);
        if (v340 >= 8)
        {
          int v346 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v346) = HIBYTE(v341);
            int v346 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v346;
            int v341 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v341;
            int v347 = *(_DWORD *)(a1 + 644);
            int v340 = v347 - 8;
            *(_DWORD *)(a1 + 644) = v347 - 8;
          }
          while (v347 > 15);
        }
        int v348 = v340 + v344;
        int v349 = (v345 << -(char)v348) | v341;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v349;
        *(_DWORD *)(a1 + 644) = v348;
        uint64_t v350 = *(unsigned __int16 *)(v342 + 20);
        int v351 = *(unsigned __int8 *)(v271 + v350);
        int v352 = *(_DWORD *)(v274 + 4 * v350);
        if (v348 >= 8)
        {
          int v353 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v353) = HIBYTE(v349);
            int v353 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v353;
            int v349 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v349;
            int v354 = *(_DWORD *)(a1 + 644);
            int v348 = v354 - 8;
            *(_DWORD *)(a1 + 644) = v354 - 8;
          }
          while (v354 > 15);
        }
        int v355 = v348 + v351;
        int v356 = (v352 << -(char)(v348 + v351)) | v349;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v356;
        *(_DWORD *)(a1 + 644) = v348 + v351;
        uint64_t v357 = v661 + 2 * v265;
        uint64_t v358 = *(unsigned __int16 *)(v357 + 22);
        int v359 = *(unsigned __int8 *)(v271 + v358);
        int v360 = *(_DWORD *)(v274 + 4 * v358);
        if (v355 >= 8)
        {
          int v361 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v361) = HIBYTE(v356);
            int v361 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v361;
            int v356 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v356;
            int v362 = *(_DWORD *)(a1 + 644);
            int v355 = v362 - 8;
            *(_DWORD *)(a1 + 644) = v362 - 8;
          }
          while (v362 > 15);
        }
        int v363 = v355 + v359;
        int v364 = (v360 << -(char)v363) | v356;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v364;
        *(_DWORD *)(a1 + 644) = v363;
        uint64_t v365 = *(unsigned __int16 *)(v357 + 24);
        int v366 = *(unsigned __int8 *)(v271 + v365);
        int v367 = *(_DWORD *)(v274 + 4 * v365);
        if (v363 >= 8)
        {
          int v368 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v368) = HIBYTE(v364);
            int v368 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v368;
            int v364 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v364;
            int v369 = *(_DWORD *)(a1 + 644);
            int v363 = v369 - 8;
            *(_DWORD *)(a1 + 644) = v369 - 8;
          }
          while (v369 > 15);
        }
        int v370 = v363 + v366;
        int v371 = (v367 << -(char)(v363 + v366)) | v364;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v371;
        *(_DWORD *)(a1 + 644) = v363 + v366;
        uint64_t v372 = v661 + 2 * v265;
        uint64_t v373 = *(unsigned __int16 *)(v372 + 26);
        int v374 = *(unsigned __int8 *)(v271 + v373);
        int v375 = *(_DWORD *)(v274 + 4 * v373);
        if (v370 >= 8)
        {
          int v376 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v376) = HIBYTE(v371);
            int v376 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v376;
            int v371 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v371;
            int v377 = *(_DWORD *)(a1 + 644);
            int v370 = v377 - 8;
            *(_DWORD *)(a1 + 644) = v377 - 8;
          }
          while (v377 > 15);
        }
        int v378 = v370 + v374;
        int v379 = (v375 << -(char)v378) | v371;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v379;
        *(_DWORD *)(a1 + 644) = v378;
        uint64_t v380 = *(unsigned __int16 *)(v372 + 28);
        int v381 = *(unsigned __int8 *)(v271 + v380);
        int v382 = *(_DWORD *)(v274 + 4 * v380);
        if (v378 >= 8)
        {
          int v383 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v383) = HIBYTE(v379);
            int v383 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v383;
            int v379 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v379;
            int v384 = *(_DWORD *)(a1 + 644);
            int v378 = v384 - 8;
            *(_DWORD *)(a1 + 644) = v384 - 8;
          }
          while (v384 > 15);
        }
        int v385 = v378 + v381;
        int v386 = (v382 << -(char)(v378 + v381)) | v379;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v386;
        *(_DWORD *)(a1 + 644) = v378 + v381;
        uint64_t v387 = v661 + 2 * v265;
        uint64_t v388 = *(unsigned __int16 *)(v387 + 30);
        int v389 = *(unsigned __int8 *)(v271 + v388);
        int v390 = *(_DWORD *)(v274 + 4 * v388);
        if (v385 >= 8)
        {
          int v391 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v391) = HIBYTE(v386);
            int v391 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v391;
            int v386 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v386;
            int v392 = *(_DWORD *)(a1 + 644);
            int v385 = v392 - 8;
            *(_DWORD *)(a1 + 644) = v392 - 8;
          }
          while (v392 > 15);
        }
        int v393 = v385 + v389;
        int v394 = (v390 << -(char)v393) | v386;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v394;
        *(_DWORD *)(a1 + 644) = v393;
        uint64_t v395 = *(unsigned __int16 *)(v387 + 32);
        int v396 = *(unsigned __int8 *)(v271 + v395);
        int v397 = *(_DWORD *)(v274 + 4 * v395);
        if (v393 >= 8)
        {
          int v398 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v398) = HIBYTE(v394);
            int v398 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v398;
            int v394 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v394;
            int v399 = *(_DWORD *)(a1 + 644);
            int v393 = v399 - 8;
            *(_DWORD *)(a1 + 644) = v399 - 8;
          }
          while (v399 > 15);
        }
        int v400 = v393 + v396;
        int v401 = (v397 << -(char)(v393 + v396)) | v394;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v401;
        *(_DWORD *)(a1 + 644) = v393 + v396;
        uint64_t v402 = v661 + 2 * v265;
        uint64_t v403 = *(unsigned __int16 *)(v402 + 34);
        int v404 = *(unsigned __int8 *)(v271 + v403);
        int v405 = *(_DWORD *)(v274 + 4 * v403);
        if (v400 >= 8)
        {
          int v406 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v406) = HIBYTE(v401);
            int v406 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v406;
            int v401 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v401;
            int v407 = *(_DWORD *)(a1 + 644);
            int v400 = v407 - 8;
            *(_DWORD *)(a1 + 644) = v407 - 8;
          }
          while (v407 > 15);
        }
        int v408 = v400 + v404;
        int v409 = (v405 << -(char)v408) | v401;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v409;
        *(_DWORD *)(a1 + 644) = v408;
        uint64_t v410 = *(unsigned __int16 *)(v402 + 36);
        int v411 = *(unsigned __int8 *)(v271 + v410);
        int v412 = *(_DWORD *)(v274 + 4 * v410);
        if (v408 >= 8)
        {
          int v413 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v413) = HIBYTE(v409);
            int v413 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v413;
            int v409 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v409;
            int v414 = *(_DWORD *)(a1 + 644);
            int v408 = v414 - 8;
            *(_DWORD *)(a1 + 644) = v414 - 8;
          }
          while (v414 > 15);
        }
        int v415 = v408 + v411;
        int v416 = (v412 << -(char)(v408 + v411)) | v409;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v416;
        *(_DWORD *)(a1 + 644) = v408 + v411;
        uint64_t v417 = v661 + 2 * v265;
        uint64_t v418 = *(unsigned __int16 *)(v417 + 38);
        int v419 = *(unsigned __int8 *)(v271 + v418);
        int v420 = *(_DWORD *)(v274 + 4 * v418);
        if (v415 >= 8)
        {
          int v421 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v421) = HIBYTE(v416);
            int v421 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v421;
            int v416 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v416;
            int v422 = *(_DWORD *)(a1 + 644);
            int v415 = v422 - 8;
            *(_DWORD *)(a1 + 644) = v422 - 8;
          }
          while (v422 > 15);
        }
        int v423 = v415 + v419;
        int v424 = (v420 << -(char)v423) | v416;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v424;
        *(_DWORD *)(a1 + 644) = v423;
        uint64_t v425 = *(unsigned __int16 *)(v417 + 40);
        int v426 = *(unsigned __int8 *)(v271 + v425);
        int v427 = *(_DWORD *)(v274 + 4 * v425);
        if (v423 >= 8)
        {
          int v428 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v428) = HIBYTE(v424);
            int v428 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v428;
            int v424 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v424;
            int v429 = *(_DWORD *)(a1 + 644);
            int v423 = v429 - 8;
            *(_DWORD *)(a1 + 644) = v429 - 8;
          }
          while (v429 > 15);
        }
        int v430 = v423 + v426;
        int v431 = (v427 << -(char)(v423 + v426)) | v424;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v431;
        *(_DWORD *)(a1 + 644) = v423 + v426;
        uint64_t v432 = v661 + 2 * v265;
        uint64_t v433 = *(unsigned __int16 *)(v432 + 42);
        int v434 = *(unsigned __int8 *)(v271 + v433);
        int v435 = *(_DWORD *)(v274 + 4 * v433);
        if (v430 >= 8)
        {
          int v436 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v436) = HIBYTE(v431);
            int v436 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v436;
            int v431 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v431;
            int v437 = *(_DWORD *)(a1 + 644);
            int v430 = v437 - 8;
            *(_DWORD *)(a1 + 644) = v437 - 8;
          }
          while (v437 > 15);
        }
        int v438 = v430 + v434;
        int v439 = (v435 << -(char)v438) | v431;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v439;
        *(_DWORD *)(a1 + 644) = v438;
        uint64_t v440 = *(unsigned __int16 *)(v432 + 44);
        int v441 = *(unsigned __int8 *)(v271 + v440);
        int v442 = *(_DWORD *)(v274 + 4 * v440);
        if (v438 >= 8)
        {
          int v443 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v443) = HIBYTE(v439);
            int v443 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v443;
            int v439 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v439;
            int v444 = *(_DWORD *)(a1 + 644);
            int v438 = v444 - 8;
            *(_DWORD *)(a1 + 644) = v444 - 8;
          }
          while (v444 > 15);
        }
        int v445 = v438 + v441;
        int v446 = (v442 << -(char)(v438 + v441)) | v439;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v446;
        *(_DWORD *)(a1 + 644) = v438 + v441;
        uint64_t v447 = v661 + 2 * v265;
        uint64_t v448 = *(unsigned __int16 *)(v447 + 46);
        int v449 = *(unsigned __int8 *)(v271 + v448);
        int v450 = *(_DWORD *)(v274 + 4 * v448);
        if (v445 >= 8)
        {
          int v451 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v451) = HIBYTE(v446);
            int v451 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v451;
            int v446 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v446;
            int v452 = *(_DWORD *)(a1 + 644);
            int v445 = v452 - 8;
            *(_DWORD *)(a1 + 644) = v452 - 8;
          }
          while (v452 > 15);
        }
        int v453 = v445 + v449;
        int v454 = (v450 << -(char)v453) | v446;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v454;
        *(_DWORD *)(a1 + 644) = v453;
        uint64_t v455 = *(unsigned __int16 *)(v447 + 48);
        int v456 = *(unsigned __int8 *)(v271 + v455);
        int v457 = *(_DWORD *)(v274 + 4 * v455);
        if (v453 >= 8)
        {
          int v458 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v458) = HIBYTE(v454);
            int v458 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v458;
            int v454 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v454;
            int v459 = *(_DWORD *)(a1 + 644);
            int v453 = v459 - 8;
            *(_DWORD *)(a1 + 644) = v459 - 8;
          }
          while (v459 > 15);
        }
        int v460 = v453 + v456;
        int v461 = (v457 << -(char)(v453 + v456)) | v454;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v461;
        *(_DWORD *)(a1 + 644) = v453 + v456;
        uint64_t v462 = v661 + 2 * v265;
        uint64_t v463 = *(unsigned __int16 *)(v462 + 50);
        int v464 = *(unsigned __int8 *)(v271 + v463);
        int v465 = *(_DWORD *)(v274 + 4 * v463);
        if (v460 >= 8)
        {
          int v466 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v466) = HIBYTE(v461);
            int v466 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v466;
            int v461 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v461;
            int v467 = *(_DWORD *)(a1 + 644);
            int v460 = v467 - 8;
            *(_DWORD *)(a1 + 644) = v467 - 8;
          }
          while (v467 > 15);
        }
        int v468 = v460 + v464;
        int v469 = (v465 << -(char)v468) | v461;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v469;
        *(_DWORD *)(a1 + 644) = v468;
        uint64_t v470 = *(unsigned __int16 *)(v462 + 52);
        int v471 = *(unsigned __int8 *)(v271 + v470);
        int v472 = *(_DWORD *)(v274 + 4 * v470);
        if (v468 >= 8)
        {
          int v473 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v473) = HIBYTE(v469);
            int v473 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v473;
            int v469 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v469;
            int v474 = *(_DWORD *)(a1 + 644);
            int v468 = v474 - 8;
            *(_DWORD *)(a1 + 644) = v474 - 8;
          }
          while (v474 > 15);
        }
        int v475 = v468 + v471;
        int v476 = (v472 << -(char)(v468 + v471)) | v469;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v476;
        *(_DWORD *)(a1 + 644) = v468 + v471;
        uint64_t v477 = v661 + 2 * v265;
        uint64_t v478 = *(unsigned __int16 *)(v477 + 54);
        int v479 = *(unsigned __int8 *)(v271 + v478);
        int v480 = *(_DWORD *)(v274 + 4 * v478);
        if (v475 >= 8)
        {
          int v481 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v481) = HIBYTE(v476);
            int v481 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v481;
            int v476 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v476;
            int v482 = *(_DWORD *)(a1 + 644);
            int v475 = v482 - 8;
            *(_DWORD *)(a1 + 644) = v482 - 8;
          }
          while (v482 > 15);
        }
        int v483 = v475 + v479;
        int v484 = (v480 << -(char)v483) | v476;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v484;
        *(_DWORD *)(a1 + 644) = v483;
        uint64_t v485 = *(unsigned __int16 *)(v477 + 56);
        int v486 = *(unsigned __int8 *)(v271 + v485);
        int v487 = *(_DWORD *)(v274 + 4 * v485);
        if (v483 >= 8)
        {
          int v488 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v488) = HIBYTE(v484);
            int v488 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v488;
            int v484 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v484;
            int v489 = *(_DWORD *)(a1 + 644);
            int v483 = v489 - 8;
            *(_DWORD *)(a1 + 644) = v489 - 8;
          }
          while (v489 > 15);
        }
        int v490 = v483 + v486;
        int v491 = (v487 << -(char)(v483 + v486)) | v484;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v491;
        *(_DWORD *)(a1 + 644) = v483 + v486;
        uint64_t v492 = v661 + 2 * v265;
        uint64_t v493 = *(unsigned __int16 *)(v492 + 58);
        int v494 = *(unsigned __int8 *)(v271 + v493);
        int v495 = *(_DWORD *)(v274 + 4 * v493);
        if (v490 >= 8)
        {
          int v496 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v496) = HIBYTE(v491);
            int v496 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v496;
            int v491 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v491;
            int v497 = *(_DWORD *)(a1 + 644);
            int v490 = v497 - 8;
            *(_DWORD *)(a1 + 644) = v497 - 8;
          }
          while (v497 > 15);
        }
        int v498 = v490 + v494;
        int v499 = (v495 << -(char)v498) | v491;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v499;
        *(_DWORD *)(a1 + 644) = v498;
        uint64_t v500 = *(unsigned __int16 *)(v492 + 60);
        int v501 = *(unsigned __int8 *)(v271 + v500);
        int v502 = *(_DWORD *)(v274 + 4 * v500);
        if (v498 >= 8)
        {
          int v503 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v503) = HIBYTE(v499);
            int v503 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v503;
            int v499 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v499;
            int v504 = *(_DWORD *)(a1 + 644);
            int v498 = v504 - 8;
            *(_DWORD *)(a1 + 644) = v504 - 8;
          }
          while (v504 > 15);
        }
        int v505 = v498 + v501;
        int v506 = (v502 << -(char)(v498 + v501)) | v499;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v506;
        *(_DWORD *)(a1 + 644) = v498 + v501;
        uint64_t v507 = v661 + 2 * v265;
        uint64_t v508 = *(unsigned __int16 *)(v507 + 62);
        int v509 = *(unsigned __int8 *)(v271 + v508);
        int v510 = *(_DWORD *)(v274 + 4 * v508);
        if (v505 >= 8)
        {
          int v511 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v511) = HIBYTE(v506);
            int v511 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v511;
            int v506 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v506;
            int v512 = *(_DWORD *)(a1 + 644);
            int v505 = v512 - 8;
            *(_DWORD *)(a1 + 644) = v512 - 8;
          }
          while (v512 > 15);
        }
        int v513 = v505 + v509;
        int v514 = (v510 << -(char)v513) | v506;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v514;
        *(_DWORD *)(a1 + 644) = v513;
        uint64_t v515 = *(unsigned __int16 *)(v507 + 64);
        int v516 = *(unsigned __int8 *)(v271 + v515);
        int v517 = *(_DWORD *)(v274 + 4 * v515);
        if (v513 >= 8)
        {
          int v518 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v518) = HIBYTE(v514);
            int v518 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v518;
            int v514 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v514;
            int v519 = *(_DWORD *)(a1 + 644);
            int v513 = v519 - 8;
            *(_DWORD *)(a1 + 644) = v519 - 8;
          }
          while (v519 > 15);
        }
        int v520 = v513 + v516;
        int v521 = (v517 << -(char)(v513 + v516)) | v514;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v521;
        *(_DWORD *)(a1 + 644) = v513 + v516;
        uint64_t v522 = v661 + 2 * v265;
        uint64_t v523 = *(unsigned __int16 *)(v522 + 66);
        int v524 = *(unsigned __int8 *)(v271 + v523);
        int v525 = *(_DWORD *)(v274 + 4 * v523);
        if (v520 >= 8)
        {
          int v526 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v526) = HIBYTE(v521);
            int v526 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v526;
            int v521 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v521;
            int v527 = *(_DWORD *)(a1 + 644);
            int v520 = v527 - 8;
            *(_DWORD *)(a1 + 644) = v527 - 8;
          }
          while (v527 > 15);
        }
        int v528 = v520 + v524;
        int v529 = (v525 << -(char)v528) | v521;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v529;
        *(_DWORD *)(a1 + 644) = v528;
        uint64_t v530 = *(unsigned __int16 *)(v522 + 68);
        int v531 = *(unsigned __int8 *)(v271 + v530);
        int v532 = *(_DWORD *)(v274 + 4 * v530);
        if (v528 >= 8)
        {
          int v533 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v533) = HIBYTE(v529);
            int v533 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v533;
            int v529 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v529;
            int v534 = *(_DWORD *)(a1 + 644);
            int v528 = v534 - 8;
            *(_DWORD *)(a1 + 644) = v534 - 8;
          }
          while (v534 > 15);
        }
        int v535 = v528 + v531;
        int v536 = (v532 << -(char)(v528 + v531)) | v529;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v536;
        *(_DWORD *)(a1 + 644) = v528 + v531;
        uint64_t v537 = v661 + 2 * v265;
        uint64_t v538 = *(unsigned __int16 *)(v537 + 70);
        int v539 = *(unsigned __int8 *)(v271 + v538);
        int v540 = *(_DWORD *)(v274 + 4 * v538);
        if (v535 >= 8)
        {
          int v541 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v541) = HIBYTE(v536);
            int v541 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v541;
            int v536 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v536;
            int v542 = *(_DWORD *)(a1 + 644);
            int v535 = v542 - 8;
            *(_DWORD *)(a1 + 644) = v542 - 8;
          }
          while (v542 > 15);
        }
        int v543 = v535 + v539;
        int v544 = (v540 << -(char)v543) | v536;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v544;
        *(_DWORD *)(a1 + 644) = v543;
        uint64_t v545 = *(unsigned __int16 *)(v537 + 72);
        int v546 = *(unsigned __int8 *)(v271 + v545);
        int v547 = *(_DWORD *)(v274 + 4 * v545);
        if (v543 >= 8)
        {
          int v548 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v548) = HIBYTE(v544);
            int v548 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v548;
            int v544 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v544;
            int v549 = *(_DWORD *)(a1 + 644);
            int v543 = v549 - 8;
            *(_DWORD *)(a1 + 644) = v549 - 8;
          }
          while (v549 > 15);
        }
        int v550 = v543 + v546;
        int v551 = (v547 << -(char)(v543 + v546)) | v544;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v551;
        *(_DWORD *)(a1 + 644) = v543 + v546;
        uint64_t v552 = v661 + 2 * v265;
        uint64_t v553 = *(unsigned __int16 *)(v552 + 74);
        int v554 = *(unsigned __int8 *)(v271 + v553);
        int v555 = *(_DWORD *)(v274 + 4 * v553);
        if (v550 >= 8)
        {
          int v556 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v556) = HIBYTE(v551);
            int v556 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v556;
            int v551 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v551;
            int v557 = *(_DWORD *)(a1 + 644);
            int v550 = v557 - 8;
            *(_DWORD *)(a1 + 644) = v557 - 8;
          }
          while (v557 > 15);
        }
        int v558 = v550 + v554;
        int v559 = (v555 << -(char)v558) | v551;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v559;
        *(_DWORD *)(a1 + 644) = v558;
        uint64_t v560 = *(unsigned __int16 *)(v552 + 76);
        int v561 = *(unsigned __int8 *)(v271 + v560);
        int v562 = *(_DWORD *)(v274 + 4 * v560);
        if (v558 >= 8)
        {
          int v563 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v563) = HIBYTE(v559);
            int v563 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v563;
            int v559 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v559;
            int v564 = *(_DWORD *)(a1 + 644);
            int v558 = v564 - 8;
            *(_DWORD *)(a1 + 644) = v564 - 8;
          }
          while (v564 > 15);
        }
        int v565 = v558 + v561;
        int v566 = (v562 << -(char)(v558 + v561)) | v559;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v566;
        *(_DWORD *)(a1 + 644) = v558 + v561;
        uint64_t v567 = v661 + 2 * v265;
        uint64_t v568 = *(unsigned __int16 *)(v567 + 78);
        int v569 = *(unsigned __int8 *)(v271 + v568);
        int v570 = *(_DWORD *)(v274 + 4 * v568);
        if (v565 >= 8)
        {
          int v571 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v571) = HIBYTE(v566);
            int v571 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v571;
            int v566 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v566;
            int v572 = *(_DWORD *)(a1 + 644);
            int v565 = v572 - 8;
            *(_DWORD *)(a1 + 644) = v572 - 8;
          }
          while (v572 > 15);
        }
        int v573 = v565 + v569;
        int v574 = (v570 << -(char)v573) | v566;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v574;
        *(_DWORD *)(a1 + 644) = v573;
        uint64_t v575 = *(unsigned __int16 *)(v567 + 80);
        int v576 = *(unsigned __int8 *)(v271 + v575);
        int v577 = *(_DWORD *)(v274 + 4 * v575);
        if (v573 >= 8)
        {
          int v578 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v578) = HIBYTE(v574);
            int v578 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v578;
            int v574 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v574;
            int v579 = *(_DWORD *)(a1 + 644);
            int v573 = v579 - 8;
            *(_DWORD *)(a1 + 644) = v579 - 8;
          }
          while (v579 > 15);
        }
        int v580 = v573 + v576;
        int v581 = (v577 << -(char)(v573 + v576)) | v574;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v581;
        *(_DWORD *)(a1 + 644) = v573 + v576;
        uint64_t v582 = v661 + 2 * v265;
        uint64_t v583 = *(unsigned __int16 *)(v582 + 82);
        int v584 = *(unsigned __int8 *)(v271 + v583);
        int v585 = *(_DWORD *)(v274 + 4 * v583);
        if (v580 >= 8)
        {
          int v586 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v586) = HIBYTE(v581);
            int v586 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v586;
            int v581 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v581;
            int v587 = *(_DWORD *)(a1 + 644);
            int v580 = v587 - 8;
            *(_DWORD *)(a1 + 644) = v587 - 8;
          }
          while (v587 > 15);
        }
        int v588 = v580 + v584;
        int v589 = (v585 << -(char)v588) | v581;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v589;
        *(_DWORD *)(a1 + 644) = v588;
        uint64_t v590 = *(unsigned __int16 *)(v582 + 84);
        int v591 = *(unsigned __int8 *)(v271 + v590);
        int v592 = *(_DWORD *)(v274 + 4 * v590);
        if (v588 >= 8)
        {
          int v593 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v593) = HIBYTE(v589);
            int v593 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v593;
            int v589 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v589;
            int v594 = *(_DWORD *)(a1 + 644);
            int v588 = v594 - 8;
            *(_DWORD *)(a1 + 644) = v594 - 8;
          }
          while (v594 > 15);
        }
        int v595 = v588 + v591;
        int v596 = (v592 << -(char)(v588 + v591)) | v589;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v596;
        *(_DWORD *)(a1 + 644) = v588 + v591;
        uint64_t v597 = v661 + 2 * v265;
        uint64_t v598 = *(unsigned __int16 *)(v597 + 86);
        int v599 = *(unsigned __int8 *)(v271 + v598);
        int v600 = *(_DWORD *)(v274 + 4 * v598);
        if (v595 >= 8)
        {
          int v601 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v601) = HIBYTE(v596);
            int v601 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v601;
            int v596 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v596;
            int v602 = *(_DWORD *)(a1 + 644);
            int v595 = v602 - 8;
            *(_DWORD *)(a1 + 644) = v602 - 8;
          }
          while (v602 > 15);
        }
        int v603 = v595 + v599;
        int v604 = (v600 << -(char)v603) | v596;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v604;
        *(_DWORD *)(a1 + 644) = v603;
        uint64_t v605 = *(unsigned __int16 *)(v597 + 88);
        int v606 = *(unsigned __int8 *)(v271 + v605);
        int v607 = *(_DWORD *)(v274 + 4 * v605);
        if (v603 >= 8)
        {
          int v608 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v608) = HIBYTE(v604);
            int v608 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v608;
            int v604 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v604;
            int v609 = *(_DWORD *)(a1 + 644);
            int v603 = v609 - 8;
            *(_DWORD *)(a1 + 644) = v609 - 8;
          }
          while (v609 > 15);
        }
        int v610 = v603 + v606;
        int v611 = (v607 << -(char)(v603 + v606)) | v604;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v611;
        *(_DWORD *)(a1 + 644) = v603 + v606;
        uint64_t v612 = v661 + 2 * v265;
        uint64_t v613 = *(unsigned __int16 *)(v612 + 90);
        int v614 = *(unsigned __int8 *)(v271 + v613);
        int v615 = *(_DWORD *)(v274 + 4 * v613);
        if (v610 >= 8)
        {
          int v616 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v616) = HIBYTE(v611);
            int v616 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v616;
            int v611 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v611;
            int v617 = *(_DWORD *)(a1 + 644);
            int v610 = v617 - 8;
            *(_DWORD *)(a1 + 644) = v617 - 8;
          }
          while (v617 > 15);
        }
        int v618 = v610 + v614;
        int v619 = (v615 << -(char)v618) | v611;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v619;
        *(_DWORD *)(a1 + 644) = v618;
        uint64_t v620 = *(unsigned __int16 *)(v612 + 92);
        int v621 = *(unsigned __int8 *)(v271 + v620);
        int v622 = *(_DWORD *)(v274 + 4 * v620);
        if (v618 >= 8)
        {
          int v623 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v623) = HIBYTE(v619);
            int v623 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v623;
            int v619 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v619;
            int v624 = *(_DWORD *)(a1 + 644);
            int v618 = v624 - 8;
            *(_DWORD *)(a1 + 644) = v624 - 8;
          }
          while (v624 > 15);
        }
        int v625 = v618 + v621;
        int v626 = (v622 << -(char)(v618 + v621)) | v619;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v626;
        *(_DWORD *)(a1 + 644) = v618 + v621;
        uint64_t v627 = v661 + 2 * v265;
        uint64_t v628 = *(unsigned __int16 *)(v627 + 94);
        int v629 = *(unsigned __int8 *)(v271 + v628);
        int v630 = *(_DWORD *)(v274 + 4 * v628);
        if (v625 >= 8)
        {
          int v631 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v631) = HIBYTE(v626);
            int v631 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v631;
            int v626 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v626;
            int v632 = *(_DWORD *)(a1 + 644);
            int v625 = v632 - 8;
            *(_DWORD *)(a1 + 644) = v632 - 8;
          }
          while (v632 > 15);
        }
        int v633 = v625 + v629;
        int v634 = (v630 << -(char)v633) | v626;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v634;
        *(_DWORD *)(a1 + 644) = v633;
        uint64_t v635 = *(unsigned __int16 *)(v627 + 96);
        int v636 = *(unsigned __int8 *)(v271 + v635);
        int v637 = *(_DWORD *)(v274 + 4 * v635);
        if (v633 >= 8)
        {
          int v638 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v638) = HIBYTE(v634);
            int v638 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v638;
            int v634 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v634;
            int v639 = *(_DWORD *)(a1 + 644);
            int v633 = v639 - 8;
            *(_DWORD *)(a1 + 644) = v639 - 8;
          }
          while (v639 > 15);
        }
        int v640 = v633 + v636;
        int v641 = (v637 << -(char)v640) | v634;
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v641;
        *(_DWORD *)(a1 + 644) = v640;
        uint64_t v642 = *(unsigned __int16 *)(v661 + 2 * v266);
        int v643 = *(unsigned __int8 *)(v271 + v642);
        int v644 = *(_DWORD *)(v274 + 4 * v642);
        if (v640 >= 8)
        {
          int v645 = *(_DWORD *)(a1 + 116);
          do
          {
            *(unsigned char *)(*(void *)(a1 + 80) + v645) = HIBYTE(v641);
            int v645 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v645;
            int v641 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v641;
            int v646 = *(_DWORD *)(a1 + 644);
            int v640 = v646 - 8;
            *(_DWORD *)(a1 + 644) = v646 - 8;
          }
          while (v646 > 15);
        }
        *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = (v644 << -(char)(v640 + v643)) | v641;
        *(_DWORD *)(a1 + 644) = v640 + v643;
      }
      else if (v267 >= (int)v265)
      {
        int v647 = *(_DWORD *)(a1 + 644);
        do
        {
          uint64_t v648 = *(unsigned __int16 *)(v661 + 2 * v265);
          int v649 = *(unsigned __int8 *)(a1 + 258 * *v268 + v648 + 37708);
          int v650 = *(_DWORD *)(a1 + 1032 * *v268 + 4 * v648 + 39256);
          int v651 = *(_DWORD *)(a1 + 640);
          if (v647 >= 8)
          {
            int v652 = *(_DWORD *)(a1 + 116);
            do
            {
              *(unsigned char *)(*(void *)(a1 + 80) + v652) = HIBYTE(v651);
              int v652 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v652;
              int v651 = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v651;
              int v653 = *(_DWORD *)(a1 + 644);
              int v647 = v653 - 8;
              *(_DWORD *)(a1 + 644) = v653 - 8;
            }
            while (v653 > 15);
          }
          v647 += v649;
          *(_DWORD *)(a1 + 64BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = (v650 << -(char)v647) | v651;
          *(_DWORD *)(a1 + 644) = v647;
          ++v265;
        }
        while (v267 + 1 != v265);
      }
      int v264 = v267 + 1;
      ++v263;
      int v262 = *(_DWORD *)(a1 + 668);
    }
    while (v267 + 1 < v262);
    v218 = (FILE **)MEMORY[0x263EF8348];
  }
  if (v263 != v667) {
    sub_20DB50680(3007);
  }
  if (*(int *)(a1 + 656) >= 3) {
    return fprintf(*v218, "codes %d\n", *(_DWORD *)(a1 + 116) - v248);
  }
  return result;
}

uint64_t sub_20DB55E28(uint64_t **a1)
{
  uint64_t v2 = (_OWORD *)((char *)a1 + 64036);
  uint64_t v3 = *a1;
  int v4 = *((_DWORD *)a1 + 2);
  if (v4 == 10)
  {
    int v409 = 0;
    unsigned int v5 = 0;
    size_t v6 = 0;
    int v7 = 0;
    LODWORD(v8) = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v407 = 0;
    int v412 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    unsigned int v16 = 0;
    int v17 = 0;
    uint64_t v410 = 0;
    unsigned int v408 = 0;
    int v18 = 0;
    int v19 = 0;
    uint64_t v20 = 0;
    int v21 = 0;
    int k = 0;
    LODWORD(v413) = 0;
    *((_OWORD *)a1 + 4008) = 0u;
    *(_OWORD *)((char *)a1 + 6410BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = 0u;
    *(_OWORD *)((char *)a1 + 64116) = 0u;
    *(_OWORD *)((char *)a1 + 64068) = 0u;
    *(_OWORD *)((char *)a1 + 64084) = 0u;
    *uint64_t v2 = 0u;
    *(_OWORD *)((char *)a1 + 64052) = 0u;
  }
  else
  {
    int k = *((_DWORD *)a1 + 16010);
    LODWORD(v413) = *(_DWORD *)v2;
    int v21 = *((_DWORD *)a1 + 16011);
    uint64_t v20 = *((unsigned int *)a1 + 16012);
    int v19 = *((_DWORD *)a1 + 16013);
    int v18 = *((_DWORD *)a1 + 16014);
    unsigned int v408 = *((_DWORD *)a1 + 16015);
    int v17 = *((_DWORD *)a1 + 16017);
    uint64_t v410 = *((unsigned int *)a1 + 16016);
    unsigned int v16 = *((_DWORD *)a1 + 16018);
    int v15 = *((_DWORD *)a1 + 16019);
    int v14 = *((_DWORD *)a1 + 16020);
    int v13 = *((_DWORD *)a1 + 16021);
    int v12 = *((_DWORD *)a1 + 16022);
    int v412 = *((_DWORD *)a1 + 16023);
    int v11 = *((_DWORD *)a1 + 16025);
    int v407 = *((_DWORD *)a1 + 16024);
    int v10 = *((_DWORD *)a1 + 16026);
    int v9 = *((_DWORD *)a1 + 16027);
    LODWORD(v8) = *((_DWORD *)a1 + 16028);
    int v7 = *((_DWORD *)a1 + 16029);
    size_t v6 = a1[8015];
    unsigned int v5 = a1[8016];
    int v409 = a1[8017];
  }
  unsigned int v411 = v16;
  int v405 = (unsigned __int8 *)a1 + 7884;
  switch(v4)
  {
    case 10:
      *((_DWORD *)a1 + 2) = 10;
      int v23 = *((_DWORD *)a1 + 9);
      if (v23 < 8)
      {
        int v60 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v60 == -1) {
            goto LABEL_8;
          }
          uint64_t v61 = *v3 + 1;
          unsigned int v24 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v23 += 8;
          *((_DWORD *)a1 + 8) = v24;
          *((_DWORD *)a1 + 9) = v23;
          uint64_t *v3 = v61;
          LODWORD(v61) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v60;
          *((_DWORD *)v3 + 3) = v61 + 1;
          if (v61 == -1) {
            ++*((_DWORD *)v3 + 4);
          }
          --v60;
        }
        while (v23 - 8 < 0);
      }
      else
      {
        unsigned int v24 = *((_DWORD *)a1 + 8);
      }
      int v26 = v23 - 8;
      *((_DWORD *)a1 + 9) = v26;
      if ((v24 >> v26) != 66) {
        goto LABEL_77;
      }
LABEL_53:
      *((_DWORD *)a1 + 2) = 11;
      if (v26 < 8)
      {
        int v63 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v63 == -1) {
            goto LABEL_8;
          }
          uint64_t v64 = *v3 + 1;
          unsigned int v62 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v26 += 8;
          *((_DWORD *)a1 + 8) = v62;
          *((_DWORD *)a1 + 9) = v26;
          uint64_t *v3 = v64;
          LODWORD(v64) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v63;
          *((_DWORD *)v3 + 3) = v64 + 1;
          if (v64 == -1) {
            ++*((_DWORD *)v3 + 4);
          }
          --v63;
        }
        while (v26 - 8 < 0);
      }
      else
      {
        unsigned int v62 = *((_DWORD *)a1 + 8);
      }
      int v27 = v26 - 8;
      *((_DWORD *)a1 + 9) = v27;
      if ((v62 >> v27) != 90) {
        goto LABEL_77;
      }
LABEL_61:
      *((_DWORD *)a1 + 2) = 12;
      if (v27 < 8)
      {
        int v66 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v66 == -1) {
            goto LABEL_8;
          }
          uint64_t v67 = *v3 + 1;
          unsigned int v65 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v27 += 8;
          *((_DWORD *)a1 + 8) = v65;
          *((_DWORD *)a1 + 9) = v27;
          uint64_t *v3 = v67;
          LODWORD(v67) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v66;
          *((_DWORD *)v3 + 3) = v67 + 1;
          if (v67 == -1) {
            ++*((_DWORD *)v3 + 4);
          }
          --v66;
        }
        while (v27 - 8 < 0);
      }
      else
      {
        unsigned int v65 = *((_DWORD *)a1 + 8);
      }
      int v28 = v27 - 8;
      *((_DWORD *)a1 + 9) = v28;
      if ((v65 >> v28) != 104) {
        goto LABEL_77;
      }
LABEL_69:
      *((_DWORD *)a1 + 2) = 13;
      if (v28 < 8)
      {
        int v69 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v69 == -1) {
            goto LABEL_8;
          }
          uint64_t v70 = *v3 + 1;
          unsigned int v68 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v28 += 8;
          *((_DWORD *)a1 + 8) = v68;
          *((_DWORD *)a1 + 9) = v28;
          uint64_t *v3 = v70;
          LODWORD(v7BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v69;
          *((_DWORD *)v3 + 3) = v70 + 1;
          if (v70 == -1) {
            ++*((_DWORD *)v3 + 4);
          }
          --v69;
        }
        while (v28 - 8 < 0);
      }
      else
      {
        unsigned int v68 = *((_DWORD *)a1 + 8);
      }
      int v71 = v28 - 8;
      int v72 = (v68 >> (v28 - 8));
      *((_DWORD *)a1 + 9) = v71;
      *((_DWORD *)a1 + 1BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v72;
      if ((v72 - 58) < 0xFFFFFFF7)
      {
LABEL_77:
        uint64_t result = 4294967291;
        goto LABEL_317;
      }
      int v376 = v17;
      int v377 = v14;
      int v382 = v12;
      int v384 = v21;
      int v387 = v13;
      int v390 = v15;
      int v378 = v18;
      int v380 = v10;
      int v399 = v6;
      int v402 = v8;
      int v73 = v19;
      int v74 = v20;
      int v75 = v72 - 48;
      *((_DWORD *)a1 + 1BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v72 - 48;
      int v76 = (unsigned __int8 *)v3[7];
      int v77 = (unsigned __int8 *)v3[9];
      if (*((unsigned char *)a1 + 44))
      {
        a1[395] = (uint64_t *)((uint64_t (*)(unsigned __int8 *, void, uint64_t))v76)(v77, (200000 * v75), 1);
        uint64_t v78 = ((uint64_t (*)(uint64_t, void, uint64_t))v3[7])(v3[9], ((100000 * *((_DWORD *)a1 + 10)) >> 1), 1);
        a1[396] = (uint64_t *)v78;
        uint64_t result = 4294967293;
        LODWORD(v2BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v74;
        int v19 = v73;
        if (!a1[395])
        {
          size_t v6 = v399;
          LODWORD(v8) = v402;
          goto LABEL_275;
        }
        size_t v6 = v399;
        LODWORD(v8) = v402;
        int v10 = v380;
        int v12 = v382;
        int v18 = v378;
        int v15 = v390;
        int v21 = v384;
        int v14 = v377;
        int v17 = v376;
        if (!v78) {
          goto LABEL_317;
        }
      }
      else
      {
        uint64_t v79 = ((uint64_t (*)(unsigned __int8 *, void, uint64_t))v76)(v77, (400000 * v75), 1);
        a1[394] = (uint64_t *)v79;
        LODWORD(v2BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v74;
        int v19 = v73;
        size_t v6 = v399;
        LODWORD(v8) = v402;
        int v10 = v380;
        int v12 = v382;
        int v18 = v378;
        int v15 = v390;
        int v21 = v384;
        int v14 = v377;
        int v17 = v376;
        if (!v79)
        {
          uint64_t result = 4294967293;
          goto LABEL_317;
        }
      }
LABEL_83:
      *((_DWORD *)a1 + 2) = 14;
      int v80 = *((_DWORD *)a1 + 9);
      if (v80 < 8)
      {
        int v82 = *a1;
        int v83 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v83 == -1) {
            goto LABEL_8;
          }
          uint64_t v84 = *v82 + 1;
          unsigned int v81 = *(unsigned __int8 *)*v82 | (*((_DWORD *)a1 + 8) << 8);
          v80 += 8;
          *((_DWORD *)a1 + 8) = v81;
          *((_DWORD *)a1 + 9) = v80;
          *int v82 = v84;
          LODWORD(v84) = *((_DWORD *)v82 + 3);
          *((_DWORD *)v82 + 2) = v83;
          *((_DWORD *)v82 + 3) = v84 + 1;
          if (v84 == -1) {
            ++*((_DWORD *)v82 + 4);
          }
          --v83;
        }
        while (v80 - 8 < 0);
      }
      else
      {
        unsigned int v81 = *((_DWORD *)a1 + 8);
      }
      int v29 = v80 - 8;
      *((_DWORD *)a1 + 9) = v29;
      int v85 = (v81 >> v29);
      if (v85 == 23)
      {
LABEL_94:
        *((_DWORD *)a1 + 2) = 42;
        if (v29 < 8)
        {
          int v152 = *a1;
          int v153 = *((_DWORD *)*a1 + 2) - 1;
          do
          {
            if (v153 == -1) {
              goto LABEL_8;
            }
            uint64_t v154 = *v152 + 1;
            unsigned int v87 = *(unsigned __int8 *)*v152 | (*((_DWORD *)a1 + 8) << 8);
            v29 += 8;
            *((_DWORD *)a1 + 8) = v87;
            *((_DWORD *)a1 + 9) = v29;
            *int v152 = v154;
            LODWORD(v154) = *((_DWORD *)v152 + 3);
            *((_DWORD *)v152 + 2) = v153;
            *((_DWORD *)v152 + 3) = v154 + 1;
            if (v154 == -1) {
              ++*((_DWORD *)v152 + 4);
            }
            --v153;
          }
          while (v29 - 8 < 0);
        }
        else
        {
          unsigned int v87 = *((_DWORD *)a1 + 8);
        }
        int v47 = v29 - 8;
        *((_DWORD *)a1 + 9) = v47;
        if ((v87 >> v47) == 114)
        {
LABEL_209:
          *((_DWORD *)a1 + 2) = 43;
          if (v47 < 8)
          {
            int v156 = *a1;
            int v157 = *((_DWORD *)*a1 + 2) - 1;
            do
            {
              if (v157 == -1) {
                goto LABEL_8;
              }
              uint64_t v158 = *v156 + 1;
              unsigned int v155 = *(unsigned __int8 *)*v156 | (*((_DWORD *)a1 + 8) << 8);
              v47 += 8;
              *((_DWORD *)a1 + 8) = v155;
              *((_DWORD *)a1 + 9) = v47;
              *int v156 = v158;
              LODWORD(v158) = *((_DWORD *)v156 + 3);
              *((_DWORD *)v156 + 2) = v157;
              *((_DWORD *)v156 + 3) = v158 + 1;
              if (v158 == -1) {
                ++*((_DWORD *)v156 + 4);
              }
              --v157;
            }
            while (v47 - 8 < 0);
          }
          else
          {
            unsigned int v155 = *((_DWORD *)a1 + 8);
          }
          int v48 = v47 - 8;
          *((_DWORD *)a1 + 9) = v48;
          if ((v155 >> v48) == 69)
          {
LABEL_217:
            *((_DWORD *)a1 + 2) = 44;
            if (v48 < 8)
            {
              int v160 = *a1;
              int v161 = *((_DWORD *)*a1 + 2) - 1;
              do
              {
                if (v161 == -1) {
                  goto LABEL_8;
                }
                uint64_t v162 = *v160 + 1;
                unsigned int v159 = *(unsigned __int8 *)*v160 | (*((_DWORD *)a1 + 8) << 8);
                v48 += 8;
                *((_DWORD *)a1 + 8) = v159;
                *((_DWORD *)a1 + 9) = v48;
                *int v160 = v162;
                LODWORD(v162) = *((_DWORD *)v160 + 3);
                *((_DWORD *)v160 + 2) = v161;
                *((_DWORD *)v160 + 3) = v162 + 1;
                if (v162 == -1) {
                  ++*((_DWORD *)v160 + 4);
                }
                --v161;
              }
              while (v48 - 8 < 0);
            }
            else
            {
              unsigned int v159 = *((_DWORD *)a1 + 8);
            }
            int v49 = v48 - 8;
            *((_DWORD *)a1 + 9) = v49;
            if ((v159 >> v49) == 56)
            {
LABEL_225:
              *((_DWORD *)a1 + 2) = 45;
              if (v49 < 8)
              {
                int v164 = *a1;
                int v165 = *((_DWORD *)*a1 + 2) - 1;
                do
                {
                  if (v165 == -1) {
                    goto LABEL_8;
                  }
                  uint64_t v166 = *v164 + 1;
                  unsigned int v163 = *(unsigned __int8 *)*v164 | (*((_DWORD *)a1 + 8) << 8);
                  v49 += 8;
                  *((_DWORD *)a1 + 8) = v163;
                  *((_DWORD *)a1 + 9) = v49;
                  *int v164 = v166;
                  LODWORD(v166) = *((_DWORD *)v164 + 3);
                  *((_DWORD *)v164 + 2) = v165;
                  *((_DWORD *)v164 + 3) = v166 + 1;
                  if (v166 == -1) {
                    ++*((_DWORD *)v164 + 4);
                  }
                  --v165;
                }
                while (v49 - 8 < 0);
              }
              else
              {
                unsigned int v163 = *((_DWORD *)a1 + 8);
              }
              int v50 = v49 - 8;
              *((_DWORD *)a1 + 9) = v50;
              if ((v163 >> v50) == 80)
              {
LABEL_233:
                *((_DWORD *)a1 + 2) = 46;
                if (v50 < 8)
                {
                  int v168 = *a1;
                  int v169 = *((_DWORD *)*a1 + 2) - 1;
                  do
                  {
                    if (v169 == -1) {
                      goto LABEL_8;
                    }
                    uint64_t v170 = *v168 + 1;
                    unsigned int v167 = *(unsigned __int8 *)*v168 | (*((_DWORD *)a1 + 8) << 8);
                    v50 += 8;
                    *((_DWORD *)a1 + 8) = v167;
                    *((_DWORD *)a1 + 9) = v50;
                    *int v168 = v170;
                    LODWORD(v17BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = *((_DWORD *)v168 + 3);
                    *((_DWORD *)v168 + 2) = v169;
                    *((_DWORD *)v168 + 3) = v170 + 1;
                    if (v170 == -1) {
                      ++*((_DWORD *)v168 + 4);
                    }
                    --v169;
                  }
                  while (v50 - 8 < 0);
                }
                else
                {
                  unsigned int v167 = *((_DWORD *)a1 + 8);
                }
                int v51 = v50 - 8;
                *((_DWORD *)a1 + 9) = v51;
                if ((v167 >> v51) == 144)
                {
                  *((_DWORD *)a1 + 795) = 0;
LABEL_242:
                  *((_DWORD *)a1 + 2) = 47;
                  if (v51 < 8)
                  {
                    uint64_t v172 = *a1;
                    int v173 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v173 == -1) {
                        goto LABEL_8;
                      }
                      uint64_t v174 = *v172 + 1;
                      unsigned int v171 = *(unsigned __int8 *)*v172 | (*((_DWORD *)a1 + 8) << 8);
                      v51 += 8;
                      *((_DWORD *)a1 + 8) = v171;
                      *((_DWORD *)a1 + 9) = v51;
                      *uint64_t v172 = v174;
                      LODWORD(v174) = *((_DWORD *)v172 + 3);
                      *((_DWORD *)v172 + 2) = v173;
                      *((_DWORD *)v172 + 3) = v174 + 1;
                      if (v174 == -1) {
                        ++*((_DWORD *)v172 + 4);
                      }
                      --v173;
                    }
                    while (v51 - 8 < 0);
                  }
                  else
                  {
                    unsigned int v171 = *((_DWORD *)a1 + 8);
                  }
                  int v52 = v51 - 8;
                  *((_DWORD *)a1 + 9) = v52;
                  *((_DWORD *)a1 + 795) = (v171 >> v52) | (*((_DWORD *)a1 + 795) << 8);
LABEL_250:
                  *((_DWORD *)a1 + 2) = 48;
                  if (v52 < 8)
                  {
                    uint64_t v176 = *a1;
                    int v177 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v177 == -1) {
                        goto LABEL_8;
                      }
                      uint64_t v178 = *v176 + 1;
                      unsigned int v175 = *(unsigned __int8 *)*v176 | (*((_DWORD *)a1 + 8) << 8);
                      v52 += 8;
                      *((_DWORD *)a1 + 8) = v175;
                      *((_DWORD *)a1 + 9) = v52;
                      *uint64_t v176 = v178;
                      LODWORD(v178) = *((_DWORD *)v176 + 3);
                      *((_DWORD *)v176 + 2) = v177;
                      *((_DWORD *)v176 + 3) = v178 + 1;
                      if (v178 == -1) {
                        ++*((_DWORD *)v176 + 4);
                      }
                      --v177;
                    }
                    while (v52 - 8 < 0);
                  }
                  else
                  {
                    unsigned int v175 = *((_DWORD *)a1 + 8);
                  }
                  int v53 = v52 - 8;
                  *((_DWORD *)a1 + 9) = v53;
                  *((_DWORD *)a1 + 795) = (v175 >> v53) | (*((_DWORD *)a1 + 795) << 8);
LABEL_258:
                  *((_DWORD *)a1 + 2) = 49;
                  if (v53 < 8)
                  {
                    uint64_t v180 = *a1;
                    int v181 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v181 == -1) {
                        goto LABEL_8;
                      }
                      uint64_t v182 = *v180 + 1;
                      unsigned int v179 = *(unsigned __int8 *)*v180 | (*((_DWORD *)a1 + 8) << 8);
                      v53 += 8;
                      *((_DWORD *)a1 + 8) = v179;
                      *((_DWORD *)a1 + 9) = v53;
                      *uint64_t v180 = v182;
                      LODWORD(v182) = *((_DWORD *)v180 + 3);
                      *((_DWORD *)v180 + 2) = v181;
                      *((_DWORD *)v180 + 3) = v182 + 1;
                      if (v182 == -1) {
                        ++*((_DWORD *)v180 + 4);
                      }
                      --v181;
                    }
                    while (v53 - 8 < 0);
                  }
                  else
                  {
                    unsigned int v179 = *((_DWORD *)a1 + 8);
                  }
                  int v54 = v53 - 8;
                  *((_DWORD *)a1 + 9) = v54;
                  *((_DWORD *)a1 + 795) = (v179 >> v54) | (*((_DWORD *)a1 + 795) << 8);
LABEL_266:
                  *((_DWORD *)a1 + 2) = 50;
                  if (v54 < 8)
                  {
                    uint64_t v184 = *a1;
                    int v185 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v185 == -1) {
                        goto LABEL_8;
                      }
                      uint64_t v186 = *v184 + 1;
                      unsigned int v183 = *(unsigned __int8 *)*v184 | (*((_DWORD *)a1 + 8) << 8);
                      v54 += 8;
                      *((_DWORD *)a1 + 8) = v183;
                      *((_DWORD *)a1 + 9) = v54;
                      *uint64_t v184 = v186;
                      LODWORD(v186) = *((_DWORD *)v184 + 3);
                      *((_DWORD *)v184 + 2) = v185;
                      *((_DWORD *)v184 + 3) = v186 + 1;
                      if (v186 == -1) {
                        ++*((_DWORD *)v184 + 4);
                      }
                      --v185;
                    }
                    while (v54 - 8 < 0);
                  }
                  else
                  {
                    unsigned int v183 = *((_DWORD *)a1 + 8);
                  }
                  int v187 = v54 - 8;
                  *((_DWORD *)a1 + 9) = v187;
                  *((_DWORD *)a1 + 795) = (v183 >> v187) | (*((_DWORD *)a1 + 795) << 8);
                  *((_DWORD *)a1 + 2) = 1;
                  uint64_t result = 4;
                  goto LABEL_317;
                }
              }
            }
          }
        }
LABEL_316:
        uint64_t result = 4294967292;
        goto LABEL_317;
      }
      if (v85 != 49) {
        goto LABEL_316;
      }
LABEL_92:
      *((_DWORD *)a1 + 2) = 15;
      if (v29 < 8)
      {
        int v88 = *a1;
        int v89 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v89 == -1) {
            goto LABEL_8;
          }
          uint64_t v90 = *v88 + 1;
          unsigned int v86 = *(unsigned __int8 *)*v88 | (*((_DWORD *)a1 + 8) << 8);
          v29 += 8;
          *((_DWORD *)a1 + 8) = v86;
          *((_DWORD *)a1 + 9) = v29;
          *int v88 = v90;
          LODWORD(v9BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = *((_DWORD *)v88 + 3);
          *((_DWORD *)v88 + 2) = v89;
          *((_DWORD *)v88 + 3) = v90 + 1;
          if (v90 == -1) {
            ++*((_DWORD *)v88 + 4);
          }
          --v89;
        }
        while (v29 - 8 < 0);
      }
      else
      {
        unsigned int v86 = *((_DWORD *)a1 + 8);
      }
      int v30 = v29 - 8;
      *((_DWORD *)a1 + 9) = v30;
      if ((v86 >> v30) != 65) {
        goto LABEL_316;
      }
LABEL_102:
      *((_DWORD *)a1 + 2) = 16;
      if (v30 < 8)
      {
        int v92 = *a1;
        int v93 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v93 == -1) {
            goto LABEL_8;
          }
          uint64_t v94 = *v92 + 1;
          unsigned int v91 = *(unsigned __int8 *)*v92 | (*((_DWORD *)a1 + 8) << 8);
          v30 += 8;
          *((_DWORD *)a1 + 8) = v91;
          *((_DWORD *)a1 + 9) = v30;
          *int v92 = v94;
          LODWORD(v94) = *((_DWORD *)v92 + 3);
          *((_DWORD *)v92 + 2) = v93;
          *((_DWORD *)v92 + 3) = v94 + 1;
          if (v94 == -1) {
            ++*((_DWORD *)v92 + 4);
          }
          --v93;
        }
        while (v30 - 8 < 0);
      }
      else
      {
        unsigned int v91 = *((_DWORD *)a1 + 8);
      }
      int v31 = v30 - 8;
      *((_DWORD *)a1 + 9) = v31;
      if ((v91 >> v31) != 89) {
        goto LABEL_316;
      }
LABEL_110:
      *((_DWORD *)a1 + 2) = 17;
      if (v31 < 8)
      {
        int v96 = *a1;
        int v97 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v97 == -1) {
            goto LABEL_8;
          }
          uint64_t v98 = *v96 + 1;
          unsigned int v95 = *(unsigned __int8 *)*v96 | (*((_DWORD *)a1 + 8) << 8);
          v31 += 8;
          *((_DWORD *)a1 + 8) = v95;
          *((_DWORD *)a1 + 9) = v31;
          *int v96 = v98;
          LODWORD(v98) = *((_DWORD *)v96 + 3);
          *((_DWORD *)v96 + 2) = v97;
          *((_DWORD *)v96 + 3) = v98 + 1;
          if (v98 == -1) {
            ++*((_DWORD *)v96 + 4);
          }
          --v97;
        }
        while (v31 - 8 < 0);
      }
      else
      {
        unsigned int v95 = *((_DWORD *)a1 + 8);
      }
      int v32 = v31 - 8;
      *((_DWORD *)a1 + 9) = v32;
      if ((v95 >> v32) != 38) {
        goto LABEL_316;
      }
LABEL_118:
      *((_DWORD *)a1 + 2) = 18;
      if (v32 < 8)
      {
        int v100 = *a1;
        int v101 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v101 == -1) {
            goto LABEL_8;
          }
          uint64_t v102 = *v100 + 1;
          unsigned int v99 = *(unsigned __int8 *)*v100 | (*((_DWORD *)a1 + 8) << 8);
          v32 += 8;
          *((_DWORD *)a1 + 8) = v99;
          *((_DWORD *)a1 + 9) = v32;
          *int v100 = v102;
          LODWORD(v102) = *((_DWORD *)v100 + 3);
          *((_DWORD *)v100 + 2) = v101;
          *((_DWORD *)v100 + 3) = v102 + 1;
          if (v102 == -1) {
            ++*((_DWORD *)v100 + 4);
          }
          --v101;
        }
        while (v32 - 8 < 0);
      }
      else
      {
        unsigned int v99 = *((_DWORD *)a1 + 8);
      }
      int v33 = v32 - 8;
      *((_DWORD *)a1 + 9) = v33;
      if ((v99 >> v33) != 83) {
        goto LABEL_316;
      }
LABEL_126:
      *((_DWORD *)a1 + 2) = 19;
      if (v33 < 8)
      {
        int v104 = *a1;
        int v105 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v105 == -1) {
            goto LABEL_8;
          }
          uint64_t v106 = *v104 + 1;
          unsigned int v103 = *(unsigned __int8 *)*v104 | (*((_DWORD *)a1 + 8) << 8);
          v33 += 8;
          *((_DWORD *)a1 + 8) = v103;
          *((_DWORD *)a1 + 9) = v33;
          *int v104 = v106;
          LODWORD(v106) = *((_DWORD *)v104 + 3);
          *((_DWORD *)v104 + 2) = v105;
          *((_DWORD *)v104 + 3) = v106 + 1;
          if (v106 == -1) {
            ++*((_DWORD *)v104 + 4);
          }
          --v105;
        }
        while (v33 - 8 < 0);
      }
      else
      {
        unsigned int v103 = *((_DWORD *)a1 + 8);
      }
      int v107 = v33 - 8;
      *((_DWORD *)a1 + 9) = v107;
      if ((v103 >> v107) != 89) {
        goto LABEL_316;
      }
      int v108 = *((_DWORD *)a1 + 13);
      int v109 = *((_DWORD *)a1 + 12) + 1;
      *((_DWORD *)a1 + 12) = v109;
      if (v108 >= 2)
      {
        int v385 = v21;
        int v393 = v19;
        int v396 = k;
        int v386 = v5;
        int v388 = v11;
        int v400 = v6;
        int v403 = v8;
        int v391 = v7;
        int v110 = v20;
        int v111 = v12;
        int v112 = v10;
        int v113 = v18;
        int v114 = v15;
        int v115 = v14;
        int v116 = v17;
        fprintf((FILE *)*MEMORY[0x263EF8348], "\n    [%d: huff+mtf ", v109);
        int v17 = v116;
        int v14 = v115;
        int v21 = v385;
        int v15 = v114;
        int v18 = v113;
        int v10 = v112;
        int v12 = v111;
        LODWORD(v2BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v110;
        size_t v6 = v400;
        LODWORD(v8) = v403;
        int v7 = v391;
        int v19 = v393;
        int k = v396;
        unsigned int v5 = v386;
        int v11 = v388;
      }
      *((_DWORD *)a1 + 794) = 0;
LABEL_137:
      *((_DWORD *)a1 + 2) = 20;
      int v117 = *((_DWORD *)a1 + 9);
      if (v117 < 8)
      {
        int v119 = *a1;
        int v120 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v120 == -1) {
            goto LABEL_8;
          }
          uint64_t v121 = *v119 + 1;
          unsigned int v118 = *(unsigned __int8 *)*v119 | (*((_DWORD *)a1 + 8) << 8);
          v117 += 8;
          *((_DWORD *)a1 + 8) = v118;
          *((_DWORD *)a1 + 9) = v117;
          *int v119 = v121;
          LODWORD(v121) = *((_DWORD *)v119 + 3);
          *((_DWORD *)v119 + 2) = v120;
          *((_DWORD *)v119 + 3) = v121 + 1;
          if (v121 == -1) {
            ++*((_DWORD *)v119 + 4);
          }
          --v120;
        }
        while (v117 - 8 < 0);
      }
      else
      {
        unsigned int v118 = *((_DWORD *)a1 + 8);
      }
      int v34 = v117 - 8;
      *((_DWORD *)a1 + 9) = v34;
      *((_DWORD *)a1 + 794) = (v118 >> v34) | (*((_DWORD *)a1 + 794) << 8);
LABEL_145:
      *((_DWORD *)a1 + 2) = 21;
      if (v34 < 8)
      {
        int v123 = *a1;
        int v124 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v124 == -1) {
            goto LABEL_8;
          }
          uint64_t v125 = *v123 + 1;
          unsigned int v122 = *(unsigned __int8 *)*v123 | (*((_DWORD *)a1 + 8) << 8);
          v34 += 8;
          *((_DWORD *)a1 + 8) = v122;
          *((_DWORD *)a1 + 9) = v34;
          uint64_t *v123 = v125;
          LODWORD(v125) = *((_DWORD *)v123 + 3);
          *((_DWORD *)v123 + 2) = v124;
          *((_DWORD *)v123 + 3) = v125 + 1;
          if (v125 == -1) {
            ++*((_DWORD *)v123 + 4);
          }
          --v124;
        }
        while (v34 - 8 < 0);
      }
      else
      {
        unsigned int v122 = *((_DWORD *)a1 + 8);
      }
      int v35 = v34 - 8;
      *((_DWORD *)a1 + 9) = v35;
      *((_DWORD *)a1 + 794) = (v122 >> v35) | (*((_DWORD *)a1 + 794) << 8);
LABEL_153:
      *((_DWORD *)a1 + 2) = 22;
      if (v35 < 8)
      {
        int v127 = *a1;
        int v128 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v128 == -1) {
            goto LABEL_8;
          }
          uint64_t v129 = *v127 + 1;
          unsigned int v126 = *(unsigned __int8 *)*v127 | (*((_DWORD *)a1 + 8) << 8);
          v35 += 8;
          *((_DWORD *)a1 + 8) = v126;
          *((_DWORD *)a1 + 9) = v35;
          *int v127 = v129;
          LODWORD(v129) = *((_DWORD *)v127 + 3);
          *((_DWORD *)v127 + 2) = v128;
          *((_DWORD *)v127 + 3) = v129 + 1;
          if (v129 == -1) {
            ++*((_DWORD *)v127 + 4);
          }
          --v128;
        }
        while (v35 - 8 < 0);
      }
      else
      {
        unsigned int v126 = *((_DWORD *)a1 + 8);
      }
      int v36 = v35 - 8;
      *((_DWORD *)a1 + 9) = v36;
      *((_DWORD *)a1 + 794) = (v126 >> v36) | (*((_DWORD *)a1 + 794) << 8);
LABEL_161:
      *((_DWORD *)a1 + 2) = 23;
      if (v36 < 8)
      {
        int v131 = *a1;
        int v132 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v132 == -1) {
            goto LABEL_8;
          }
          uint64_t v133 = *v131 + 1;
          unsigned int v130 = *(unsigned __int8 *)*v131 | (*((_DWORD *)a1 + 8) << 8);
          v36 += 8;
          *((_DWORD *)a1 + 8) = v130;
          *((_DWORD *)a1 + 9) = v36;
          *int v131 = v133;
          LODWORD(v133) = *((_DWORD *)v131 + 3);
          *((_DWORD *)v131 + 2) = v132;
          *((_DWORD *)v131 + 3) = v133 + 1;
          if (v133 == -1) {
            ++*((_DWORD *)v131 + 4);
          }
          --v132;
        }
        while (v36 - 8 < 0);
      }
      else
      {
        unsigned int v130 = *((_DWORD *)a1 + 8);
      }
      int v37 = v36 - 8;
      *((_DWORD *)a1 + 9) = v37;
      *((_DWORD *)a1 + 794) = (v130 >> v37) | (*((_DWORD *)a1 + 794) << 8);
LABEL_169:
      *((_DWORD *)a1 + 2) = 24;
      if (v37 < 1)
      {
        int v135 = *a1;
        int v136 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v136 == -1) {
            goto LABEL_8;
          }
          uint64_t v137 = *v135 + 1;
          unsigned int v134 = *(unsigned __int8 *)*v135 | (*((_DWORD *)a1 + 8) << 8);
          v37 += 8;
          *((_DWORD *)a1 + 8) = v134;
          *((_DWORD *)a1 + 9) = v37;
          *int v135 = v137;
          LODWORD(v137) = *((_DWORD *)v135 + 3);
          *((_DWORD *)v135 + 2) = v136;
          *((_DWORD *)v135 + 3) = v137 + 1;
          if (v137 == -1) {
            ++*((_DWORD *)v135 + 4);
          }
          --v136;
        }
        while (v37 - 8 <= -8);
      }
      else
      {
        unsigned int v134 = *((_DWORD *)a1 + 8);
      }
      int v38 = v37 - 1;
      *((_DWORD *)a1 + 9) = v38;
      *((unsigned char *)a1 + 2BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = (v134 >> v38) & 1;
      *((_DWORD *)a1 + 14) = 0;
LABEL_177:
      *((_DWORD *)a1 + 2) = 25;
      if (v38 < 8)
      {
        int v139 = *a1;
        int v140 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v140 == -1) {
            goto LABEL_8;
          }
          uint64_t v141 = *v139 + 1;
          unsigned int v138 = *(unsigned __int8 *)*v139 | (*((_DWORD *)a1 + 8) << 8);
          v38 += 8;
          *((_DWORD *)a1 + 8) = v138;
          *((_DWORD *)a1 + 9) = v38;
          *int v139 = v141;
          LODWORD(v141) = *((_DWORD *)v139 + 3);
          *((_DWORD *)v139 + 2) = v140;
          *((_DWORD *)v139 + 3) = v141 + 1;
          if (v141 == -1) {
            ++*((_DWORD *)v139 + 4);
          }
          --v140;
        }
        while (v38 - 8 < 0);
      }
      else
      {
        unsigned int v138 = *((_DWORD *)a1 + 8);
      }
      int v39 = v38 - 8;
      *((_DWORD *)a1 + 9) = v39;
      *((_DWORD *)a1 + 14) = (v138 >> v39) | (*((_DWORD *)a1 + 14) << 8);
LABEL_185:
      *((_DWORD *)a1 + 2) = 26;
      if (v39 < 8)
      {
        int v143 = *a1;
        int v144 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v144 == -1) {
            goto LABEL_8;
          }
          uint64_t v145 = *v143 + 1;
          unsigned int v142 = *(unsigned __int8 *)*v143 | (*((_DWORD *)a1 + 8) << 8);
          v39 += 8;
          *((_DWORD *)a1 + 8) = v142;
          *((_DWORD *)a1 + 9) = v39;
          *int v143 = v145;
          LODWORD(v145) = *((_DWORD *)v143 + 3);
          *((_DWORD *)v143 + 2) = v144;
          *((_DWORD *)v143 + 3) = v145 + 1;
          if (v145 == -1) {
            ++*((_DWORD *)v143 + 4);
          }
          --v144;
        }
        while (v39 - 8 < 0);
      }
      else
      {
        unsigned int v142 = *((_DWORD *)a1 + 8);
      }
      int v40 = v39 - 8;
      *((_DWORD *)a1 + 9) = v40;
      *((_DWORD *)a1 + 14) = (v142 >> v40) | (*((_DWORD *)a1 + 14) << 8);
LABEL_193:
      *((_DWORD *)a1 + 2) = 27;
      if (v40 < 8)
      {
        unint64_t v147 = *a1;
        int v148 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v148 == -1) {
            goto LABEL_8;
          }
          uint64_t v149 = *v147 + 1;
          unsigned int v146 = *(unsigned __int8 *)*v147 | (*((_DWORD *)a1 + 8) << 8);
          v40 += 8;
          *((_DWORD *)a1 + 8) = v146;
          *((_DWORD *)a1 + 9) = v40;
          *unint64_t v147 = v149;
          LODWORD(v149) = *((_DWORD *)v147 + 3);
          *((_DWORD *)v147 + 2) = v148;
          *((_DWORD *)v147 + 3) = v149 + 1;
          if (v149 == -1) {
            ++*((_DWORD *)v147 + 4);
          }
          --v148;
        }
        while (v40 - 8 < 0);
      }
      else
      {
        unsigned int v146 = *((_DWORD *)a1 + 8);
      }
      *((_DWORD *)a1 + 9) = v40 - 8;
      int v150 = (v146 >> (v40 - 8)) | (*((_DWORD *)a1 + 14) << 8);
      *((_DWORD *)a1 + 14) = v150;
      if (v150 < 0 || v150 > ((100000 * *((_DWORD *)a1 + 10)) | 0xA)) {
        goto LABEL_316;
      }
      for (int i = 0; ; int i = v413 + 1)
      {
        LODWORD(v413) = i;
        if (i >= 16) {
          break;
        }
LABEL_278:
        *((_DWORD *)a1 + 2) = 28;
        int v188 = *((_DWORD *)a1 + 9);
        if (v188 < 1)
        {
          uint64_t v190 = *a1;
          int v191 = *((_DWORD *)*a1 + 2) - 1;
          while (v191 != -1)
          {
            uint64_t v192 = *v190 + 1;
            unsigned int v189 = *(unsigned __int8 *)*v190 | (*((_DWORD *)a1 + 8) << 8);
            v188 += 8;
            *((_DWORD *)a1 + 8) = v189;
            *((_DWORD *)a1 + 9) = v188;
            *uint64_t v190 = v192;
            LODWORD(v192) = *((_DWORD *)v190 + 3);
            *((_DWORD *)v190 + 2) = v191;
            *((_DWORD *)v190 + 3) = v192 + 1;
            if (v192 == -1) {
              ++*((_DWORD *)v190 + 4);
            }
            --v191;
            if (v188 - 8 > -8) {
              goto LABEL_285;
            }
          }
          goto LABEL_8;
        }
        unsigned int v189 = *((_DWORD *)a1 + 8);
LABEL_285:
        int v193 = v188 - 1;
        *((_DWORD *)a1 + 9) = v193;
        *((unsigned char *)a1 + (int)v413 + 3452) = (v189 >> v193) & 1;
      }
      *(_OWORD *)((char *)a1 + 342BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = 0u;
      *(_OWORD *)((char *)a1 + 3436) = 0u;
      *(_OWORD *)((char *)a1 + 3388) = 0u;
      *(_OWORD *)((char *)a1 + 3404) = 0u;
      *(_OWORD *)((char *)a1 + 3356) = 0u;
      *(_OWORD *)((char *)a1 + 3372) = 0u;
      *(_OWORD *)((char *)a1 + 3324) = 0u;
      *(_OWORD *)((char *)a1 + 334BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = 0u;
      *(_OWORD *)((char *)a1 + 3292) = 0u;
      *(_OWORD *)((char *)a1 + 3308) = 0u;
      *(_OWORD *)((char *)a1 + 326BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = 0u;
      *(_OWORD *)((char *)a1 + 3276) = 0u;
      *(_OWORD *)((char *)a1 + 3228) = 0u;
      *(_OWORD *)((char *)a1 + 3244) = 0u;
      *(_OWORD *)((char *)a1 + 3196) = 0u;
      *(_OWORD *)((char *)a1 + 3212) = 0u;
      for (int j = 0; ; int j = v413 + 1)
      {
        LODWORD(v413) = j;
        if (j > 15) {
          break;
        }
        if (*((unsigned char *)a1 + j + 3452))
        {
          for (int k = 0; ; ++k)
          {
            if (k > 15) {
              goto LABEL_340;
            }
LABEL_338:
            *((_DWORD *)a1 + 2) = 29;
            int v215 = *((_DWORD *)a1 + 9);
            if (v215 < 1) {
              break;
            }
            unsigned int v216 = *((_DWORD *)a1 + 8);
LABEL_346:
            int v220 = v215 - 1;
            *((_DWORD *)a1 + 9) = v220;
            if ((v216 >> v220)) {
              *((unsigned char *)&a1[2 * (int)v413 + 399] + k + 4) = 1;
            }
          }
          uint64_t v217 = *a1;
          int v218 = *((_DWORD *)*a1 + 2) - 1;
          while (v218 != -1)
          {
            uint64_t v219 = *v217 + 1;
            unsigned int v216 = *(unsigned __int8 *)*v217 | (*((_DWORD *)a1 + 8) << 8);
            v215 += 8;
            *((_DWORD *)a1 + 8) = v216;
            *((_DWORD *)a1 + 9) = v215;
            *uint64_t v217 = v219;
            LODWORD(v219) = *((_DWORD *)v217 + 3);
            *((_DWORD *)v217 + 2) = v218;
            *((_DWORD *)v217 + 3) = v219 + 1;
            if (v219 == -1) {
              ++*((_DWORD *)v217 + 4);
            }
            --v218;
            if (v215 - 8 > -8) {
              goto LABEL_346;
            }
          }
          goto LABEL_8;
        }
LABEL_340:
        ;
      }
      int v208 = 0;
      uint64_t v209 = 0;
      *((_DWORD *)a1 + 798) = 0;
      do
      {
        if (*((unsigned char *)a1 + v209 + 3196))
        {
          *((unsigned char *)a1 + v208 + 3468) = v209;
          int v208 = *((_DWORD *)a1 + 798) + 1;
          *((_DWORD *)a1 + 798) = v208;
        }
        ++v209;
      }
      while (v209 != 256);
      if (!v208) {
        goto LABEL_316;
      }
      uint64_t v20 = (v208 + 2);
LABEL_328:
      *((_DWORD *)a1 + 2) = 30;
      int v210 = *((_DWORD *)a1 + 9);
      if (v210 < 3)
      {
        int v212 = *a1;
        int v213 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v213 == -1) {
            goto LABEL_8;
          }
          uint64_t v214 = *v212 + 1;
          unsigned int v211 = *(unsigned __int8 *)*v212 | (*((_DWORD *)a1 + 8) << 8);
          v210 += 8;
          *((_DWORD *)a1 + 8) = v211;
          *((_DWORD *)a1 + 9) = v210;
          *int v212 = v214;
          LODWORD(v214) = *((_DWORD *)v212 + 3);
          *((_DWORD *)v212 + 2) = v213;
          *((_DWORD *)v212 + 3) = v214 + 1;
          if (v214 == -1) {
            ++*((_DWORD *)v212 + 4);
          }
          --v213;
        }
        while (v210 - 8 <= -6);
      }
      else
      {
        unsigned int v211 = *((_DWORD *)a1 + 8);
      }
      int v41 = v210 - 3;
      int v19 = (v211 >> v41) & 7;
      *((_DWORD *)a1 + 9) = v41;
      if (((1 << ((v211 >> v41) & 7)) & 0x83) != 0) {
        goto LABEL_316;
      }
LABEL_25:
      *((_DWORD *)a1 + 2) = 31;
      if (v41 < 15)
      {
        int v55 = *a1;
        int v56 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v56 == -1) {
            goto LABEL_8;
          }
          uint64_t v57 = *v55 + 1;
          unsigned int v42 = *(unsigned __int8 *)*v55 | (*((_DWORD *)a1 + 8) << 8);
          v41 += 8;
          *((_DWORD *)a1 + 8) = v42;
          *((_DWORD *)a1 + 9) = v41;
          *int v55 = v57;
          LODWORD(v57) = *((_DWORD *)v55 + 3);
          *((_DWORD *)v55 + 2) = v56;
          *((_DWORD *)v55 + 3) = v57 + 1;
          if (v57 == -1) {
            ++*((_DWORD *)v55 + 4);
          }
          --v56;
        }
        while (v41 - 8 <= 6);
      }
      else
      {
        unsigned int v42 = *((_DWORD *)a1 + 8);
      }
      int v58 = 0;
      int v59 = v41 - 15;
      *((_DWORD *)a1 + 9) = v59;
      int v18 = (v42 >> v59) & 0x7FFF;
      if (!v18)
      {
        uint64_t result = 4294967292;
        int v18 = 0;
        goto LABEL_317;
      }
LABEL_349:
      if (v58 < v18)
      {
        int k = 0;
        LODWORD(v413) = v58;
LABEL_351:
        int v221 = *((_DWORD *)a1 + 9);
        uint64_t result = 4294967292;
        while (1)
        {
          *((_DWORD *)a1 + 2) = 32;
          if (v221 < 1) {
            break;
          }
          unsigned int v222 = *((_DWORD *)a1 + 8);
LABEL_359:
          *((_DWORD *)a1 + 9) = --v221;
          if (((v222 >> v221) & 1) == 0)
          {
            int v226 = v413;
            if ((int)v413 <= 18001)
            {
              *((unsigned char *)a1 + (int)v413 + 25886) = k;
              int v226 = v413;
            }
            int v58 = v226 + 1;
            goto LABEL_349;
          }
          if (++k >= v19) {
            goto LABEL_317;
          }
        }
        int v223 = *a1;
        int v224 = *((_DWORD *)*a1 + 2) - 1;
        while (v224 != -1)
        {
          uint64_t v225 = *v223 + 1;
          unsigned int v222 = *(unsigned __int8 *)*v223 | (*((_DWORD *)a1 + 8) << 8);
          v221 += 8;
          *((_DWORD *)a1 + 8) = v222;
          *((_DWORD *)a1 + 9) = v221;
          *int v223 = v225;
          LODWORD(v225) = *((_DWORD *)v223 + 3);
          *((_DWORD *)v223 + 2) = v224;
          *((_DWORD *)v223 + 3) = v225 + 1;
          if (v225 == -1) {
            ++*((_DWORD *)v223 + 4);
          }
          --v224;
          if (v221 - 8 > -8) {
            goto LABEL_359;
          }
        }
        uint64_t result = 0;
        goto LABEL_317;
      }
      if (v18 >= 18002) {
        int v227 = 18002;
      }
      else {
        int v227 = v18;
      }
      if (v19 >= 1)
      {
        int v228 = 0;
        do
        {
          v414[v228] = v228;
          ++v228;
        }
        while (v19 > v228);
      }
      if (v18 < 1)
      {
        LODWORD(v413) = 0;
      }
      else
      {
        int v229 = v14;
        uint64_t v230 = 0;
        if (v227 <= 1) {
          uint64_t v231 = 1;
        }
        else {
          uint64_t v231 = v227;
        }
        LODWORD(v413) = v231;
        do
        {
          uint64_t v232 = *((unsigned __int8 *)a1 + v230 + 25886);
          char v233 = v414[v232];
          if (*((unsigned char *)a1 + v230 + 25886))
          {
            do
            {
              v414[v232] = v414[(v232 - 1)];
              --v232;
            }
            while ((_BYTE)v232);
          }
          v414[0] = v233;
          *((unsigned char *)a1 + v230++ + 7884) = v233;
        }
        while (v230 != v231);
        int v14 = v229;
      }
      int v21 = 0;
      int v18 = v227;
      while (v21 < v19)
      {
LABEL_384:
        *((_DWORD *)a1 + 2) = 33;
        int v234 = *((_DWORD *)a1 + 9);
        if (v234 < 5)
        {
          int v236 = *a1;
          int v237 = *((_DWORD *)*a1 + 2) - 1;
          do
          {
            if (v237 == -1) {
              goto LABEL_8;
            }
            uint64_t v238 = *v236 + 1;
            unsigned int v235 = *(unsigned __int8 *)*v236 | (*((_DWORD *)a1 + 8) << 8);
            v234 += 8;
            *((_DWORD *)a1 + 8) = v235;
            *((_DWORD *)a1 + 9) = v234;
            *int v236 = v238;
            LODWORD(v238) = *((_DWORD *)v236 + 3);
            *((_DWORD *)v236 + 2) = v237;
            *((_DWORD *)v236 + 3) = v238 + 1;
            if (v238 == -1) {
              ++*((_DWORD *)v236 + 4);
            }
            --v237;
          }
          while (v234 - 8 <= -4);
        }
        else
        {
          unsigned int v235 = *((_DWORD *)a1 + 8);
        }
        int v239 = v234 - 5;
        int v240 = (v235 >> v239) & 0x1F;
        *((_DWORD *)a1 + 9) = v239;
        int v241 = 0;
LABEL_420:
        if (v241 < (int)v20)
        {
          LODWORD(v413) = v241;
          while ((v240 - 21) >= 0xFFFFFFEC)
          {
            int v412 = v240;
LABEL_425:
            *((_DWORD *)a1 + 2) = 34;
            int v265 = *((_DWORD *)a1 + 9);
            if (v265 < 1)
            {
              int v267 = *a1;
              int v268 = *((_DWORD *)*a1 + 2) - 1;
              while (v268 != -1)
              {
                uint64_t v269 = *v267 + 1;
                unsigned int v266 = *(unsigned __int8 *)*v267 | (*((_DWORD *)a1 + 8) << 8);
                v265 += 8;
                *((_DWORD *)a1 + 8) = v266;
                *((_DWORD *)a1 + 9) = v265;
                *int v267 = v269;
                LODWORD(v269) = *((_DWORD *)v267 + 3);
                *((_DWORD *)v267 + 2) = v268;
                *((_DWORD *)v267 + 3) = v269 + 1;
                if (v269 == -1) {
                  ++*((_DWORD *)v267 + 4);
                }
                --v268;
                if (v265 - 8 > -8) {
                  goto LABEL_432;
                }
              }
LABEL_8:
              uint64_t result = 0;
LABEL_317:
              *(_DWORD *)uint64_t v2 = v413;
              *((_DWORD *)a1 + 1601BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = k;
              *((_DWORD *)a1 + 16011) = v21;
              *((_DWORD *)a1 + 16012) = v20;
              *((_DWORD *)a1 + 16013) = v19;
              *((_DWORD *)a1 + 16014) = v18;
              *((_DWORD *)a1 + 16015) = v408;
              *((_DWORD *)a1 + 16016) = v410;
              *((_DWORD *)a1 + 16017) = v17;
              *((_DWORD *)a1 + 16018) = v411;
              *((_DWORD *)a1 + 16019) = v15;
              *((_DWORD *)a1 + 1602BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v14;
              *((_DWORD *)a1 + 16021) = v13;
              *((_DWORD *)a1 + 16022) = v12;
              *((_DWORD *)a1 + 16023) = v412;
              *((_DWORD *)a1 + 16024) = v407;
              *((_DWORD *)a1 + 16025) = v11;
              *((_DWORD *)a1 + 16026) = v10;
              *((_DWORD *)a1 + 16027) = v9;
              *((_DWORD *)a1 + 16028) = v8;
              *((_DWORD *)a1 + 16029) = v7;
              a1[8015] = v6;
              a1[8016] = v5;
              a1[8017] = v409;
              return result;
            }
            unsigned int v266 = *((_DWORD *)a1 + 8);
LABEL_432:
            int v43 = v265 - 1;
            *((_DWORD *)a1 + 9) = v43;
            if (((v266 >> v43) & 1) == 0)
            {
              *((unsigned char *)a1 + 258 * v21 + (int)v413 + 43888) = v412;
              int v240 = v412;
              int v241 = v413 + 1;
              goto LABEL_420;
            }
LABEL_433:
            *((_DWORD *)a1 + 2) = 35;
            if (v43 < 1)
            {
              uint64_t v271 = *a1;
              int v272 = *((_DWORD *)*a1 + 2) - 1;
              while (v272 != -1)
              {
                uint64_t v273 = *v271 + 1;
                unsigned int v270 = *(unsigned __int8 *)*v271 | (*((_DWORD *)a1 + 8) << 8);
                v43 += 8;
                *((_DWORD *)a1 + 8) = v270;
                *((_DWORD *)a1 + 9) = v43;
                *uint64_t v271 = v273;
                LODWORD(v273) = *((_DWORD *)v271 + 3);
                *((_DWORD *)v271 + 2) = v272;
                *((_DWORD *)v271 + 3) = v273 + 1;
                if (v273 == -1) {
                  ++*((_DWORD *)v271 + 4);
                }
                --v272;
                if (v43 - 8 > -8) {
                  goto LABEL_440;
                }
              }
              goto LABEL_8;
            }
            unsigned int v270 = *((_DWORD *)a1 + 8);
LABEL_440:
            int v274 = v43 - 1;
            *((_DWORD *)a1 + 9) = v274;
            int v240 = v412 - 1;
            if (((v270 >> v274) & 1) == 0) {
              int v240 = v412 + 1;
            }
          }
          int v412 = v240;
          goto LABEL_316;
        }
        LODWORD(v413) = v241;
        int v412 = v240;
        ++v21;
      }
      int v379 = v18;
      int v381 = v10;
      int v383 = v12;
      int v394 = v19;
      int v397 = k;
      int v392 = v7;
      int v404 = v8;
      if (v19 < 1)
      {
        int v253 = v13;
        LODWORD(v252) = v20;
        int v384 = 0;
      }
      else
      {
        int v401 = v6;
        int v389 = v9;
        uint64_t v242 = 0;
        unsigned int v243 = (unsigned __int8 *)(a1 + 5486);
        uint64_t v244 = v19;
        uint64_t v245 = v20;
        do
        {
          if ((int)v20 < 1)
          {
            int v246 = 0;
            int v247 = 32;
          }
          else
          {
            int v246 = 0;
            int v247 = 32;
            uint64_t v248 = v245;
            int v249 = v243;
            do
            {
              int v251 = *v249++;
              int v250 = v251;
              if (v246 <= v251) {
                int v246 = v250;
              }
              if (v247 >= v250) {
                int v247 = v250;
              }
              --v248;
            }
            while (v248);
          }
          uint64_t v252 = v20;
          sub_20DB58E60((uint64_t **)((char *)&a1[129 * v242 + 5679] + 4), (uint64_t **)((char *)&a1[129 * v242 + 6453] + 4), (uint64_t)&a1[129 * v242 + 7227] + 4, (unsigned __int8 *)a1 + 258 * v242 + 43888, v247, v246, v20);
          uint64_t v20 = v252;
          *((_DWORD *)a1 + v242++ + 16003) = v247;
          v243 += 258;
        }
        while (v242 != v244);
        int v253 = v13;
        int v384 = v394;
        int v9 = v389;
        size_t v6 = v401;
      }
      int v254 = *((_DWORD *)a1 + 798);
      int v255 = *((_DWORD *)a1 + 10);
      bzero((char *)a1 + 68, 0x400uLL);
      uint64_t v256 = 0;
      int v15 = 100000 * v255;
      int v257 = 4095;
      do
      {
        int8x16_t v258 = vrev64q_s8(vorrq_s8(vdupq_n_s8(16 * (int)v256 - 16), (int8x16_t)xmmword_20DB59560));
        *(int8x16_t *)((char *)a1 + v257 + 3709) = vextq_s8(v258, v258, 8uLL);
        *((_DWORD *)a1 + v256-- + 197BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v257 - 15;
        v257 -= 16;
      }
      while (v256 != -16);
      unsigned int v408 = v254 + 1;
      int v18 = v379;
      int v10 = v381;
      LODWORD(v2BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v252;
      int v7 = v392;
      int v12 = v383;
      int v13 = v253;
      int v14 = 0;
      if (v379 < 1)
      {
        int v17 = 0;
        LODWORD(v41BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = 0;
        uint64_t result = 4294967292;
        LODWORD(v413) = 256;
        int v19 = v394;
        int k = v397;
        LODWORD(v8) = v404;
        goto LABEL_534;
      }
      LODWORD(v8) = *v405;
      int v259 = &a1[129 * *v405];
      unsigned int v5 = (uint64_t *)((char *)v259 + 51628);
      int v409 = (uint64_t *)((char *)v259 + 57820);
      uint64_t v410 = 0;
      size_t v6 = (uint64_t *)((char *)v259 + 45436);
      int v7 = *((_DWORD *)a1 + *v405 + 16003);
      LODWORD(v413) = 256;
      int v17 = 49;
      int v11 = v7;
      int v19 = v394;
      int k = v397;
      int v21 = v384;
LABEL_410:
      *((_DWORD *)a1 + 2) = 36;
      int v260 = *((_DWORD *)a1 + 9);
      if (v260 >= v11)
      {
        unsigned int v264 = *((_DWORD *)a1 + 8);
      }
      else
      {
        int v261 = *a1;
        int v262 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v262 == -1) {
            goto LABEL_8;
          }
          uint64_t v263 = *v261 + 1;
          unsigned int v264 = *(unsigned __int8 *)*v261 | (*((_DWORD *)a1 + 8) << 8);
          v260 += 8;
          *((_DWORD *)a1 + 8) = v264;
          *((_DWORD *)a1 + 9) = v260;
          *int v261 = v263;
          LODWORD(v263) = *((_DWORD *)v261 + 3);
          *((_DWORD *)v261 + 2) = v262;
          *((_DWORD *)v261 + 3) = v263 + 1;
          if (v263 == -1) {
            ++*((_DWORD *)v261 + 4);
          }
          --v262;
        }
        while (v260 < v11);
      }
      int v44 = v260 - v11;
      int v10 = (v264 >> v44) & ~(-1 << v11);
      *((_DWORD *)a1 + 9) = v44;
      while (1)
      {
        if (v11 > 20) {
          goto LABEL_316;
        }
        if (v10 <= *((_DWORD *)v6 + v11)) {
          break;
        }
        ++v11;
LABEL_287:
        *((_DWORD *)a1 + 2) = 37;
        if (v44 < 1)
        {
          int v196 = *a1;
          int v197 = *((_DWORD *)*a1 + 2) - 1;
          do
          {
            if (v197 == -1) {
              goto LABEL_8;
            }
            uint64_t v198 = *v196 + 1;
            unsigned int v195 = *(unsigned __int8 *)*v196 | (*((_DWORD *)a1 + 8) << 8);
            v44 += 8;
            *((_DWORD *)a1 + 8) = v195;
            *((_DWORD *)a1 + 9) = v44;
            *int v196 = v198;
            LODWORD(v198) = *((_DWORD *)v196 + 3);
            *((_DWORD *)v196 + 2) = v197;
            *((_DWORD *)v196 + 3) = v198 + 1;
            if (v198 == -1) {
              ++*((_DWORD *)v196 + 4);
            }
            --v197;
          }
          while (v44 - 8 <= -8);
        }
        else
        {
          unsigned int v195 = *((_DWORD *)a1 + 8);
        }
        int v9 = (v195 >> --v44) & 1;
        *((_DWORD *)a1 + 9) = v44;
        int v10 = v9 | (2 * v10);
      }
      uint64_t v199 = v11;
LABEL_443:
      unsigned int v275 = v10 - *((_DWORD *)v5 + v199);
      if (v275 > 0x101) {
        goto LABEL_316;
      }
      unsigned int v276 = *((_DWORD *)v409 + v275);
      while (1)
      {
        unsigned int v411 = v276;
        if (v276 == v408) {
          break;
        }
        unsigned int v277 = v276 - 1;
        if (v276 > 1)
        {
          if (v14 >= v15) {
            goto LABEL_316;
          }
          if (v276 > 0x10)
          {
            uint64_t v293 = v277 >> 4;
            int v294 = (int *)a1 + v293 + 1955;
            LODWORD(v295) = *v294;
            unsigned int v281 = *((unsigned __int8 *)a1 + (v277 & 0xF) + (uint64_t)*v294 + 3724);
            if ((v277 & 0xF) != 0)
            {
              int64_t v296 = (int)v295 + (unint64_t)(v277 & 0xF);
              do
              {
                *((unsigned char *)a1 + v296 + 3724) = *((unsigned char *)a1 + v296 + 3723);
                int64_t v295 = *v294;
                --v296;
              }
              while (v296 > v295);
            }
            *int v294 = v295 + 1;
            uint64_t v297 = (uint64_t)a1 + 7820;
            do
            {
              uint64_t v298 = *(int *)(v297 + 4 * v293) - 1;
              *(_DWORD *)(v297 + 4 * v293) = v298;
              BOOL v299 = v293-- <= 1;
              *((unsigned char *)a1 + v298 + 3724) = *((unsigned char *)a1 + *((int *)a1 + v293 + 1955) + 3739);
            }
            while (!v299);
            uint64_t v300 = *((int *)a1 + 1955) - 1;
            *((_DWORD *)a1 + 1955) = v300;
            *((unsigned char *)a1 + v300 + 3724) = v281;
            if (!*((_DWORD *)a1 + 1955))
            {
              int v279 = v17;
              int v301 = v14;
              int v302 = 4095;
              uint64_t v303 = 15;
              do
              {
                uint64_t v304 = 0;
                uint64_t v305 = v303;
                int v306 = (int *)a1 + v303 + 1955;
                uint64_t v307 = (uint64_t)a1 + 3724;
                do
                {
                  *(unsigned char *)(v307 + v302) = *(unsigned char *)(v307 + *v306 + 15);
                  ++v304;
                  --v307;
                }
                while (v304 != 16);
                *int v306 = v302 - 15;
                uint64_t v303 = v305 - 1;
                v302 -= 16;
              }
              while (v305);
              int v14 = v301;
              goto LABEL_469;
            }
          }
          else
          {
            int v279 = v17;
            uint64_t v280 = *((int *)a1 + 1955);
            unsigned int v281 = *((unsigned __int8 *)a1 + v280 + v277 + 3724);
            if (v277 < 4) {
              goto LABEL_454;
            }
            int v282 = v14;
            int v283 = v280 - 1;
            unsigned int v284 = v276;
            do
            {
              int v285 = v283 + v284 - 1;
              *((unsigned char *)a1 + (int)(v283 + v284) + 3724) = *((unsigned char *)a1 + v285 + 3724);
              int v286 = v283 + v284 - 2;
              *((unsigned char *)a1 + v285 + 3724) = *((unsigned char *)a1 + v286 + 3724);
              int v287 = v283 + v284 - 3;
              *((unsigned char *)a1 + v286 + 3724) = *((unsigned char *)a1 + v287 + 3724);
              unsigned int v288 = v284 - 4;
              *((unsigned char *)a1 + v287 + 3724) = *((unsigned char *)a1 + (int)(v284 - 4 + v283) + 3724);
              unsigned int v289 = v284 - 5;
              v284 -= 4;
            }
            while (v289 > 3);
            unsigned int v277 = v288 - 1;
            int v14 = v282;
            if (v288 != 1)
            {
LABEL_454:
              unsigned int v290 = v277 + v280;
              uint64_t v291 = v277 - 1;
              do
              {
                *((unsigned char *)a1 + v290 + 3724) = *((unsigned char *)a1 + v290 + 3723);
                int v292 = v291--;
                --v290;
              }
              while (v292);
            }
            *((unsigned char *)a1 + v280 + 3724) = v281;
LABEL_469:
            int v17 = v279;
          }
          uint64_t v308 = *((unsigned __int8 *)a1 + v281 + 3468);
          ++*((_DWORD *)a1 + v308 + 17);
          if (*((unsigned char *)a1 + 44)) {
            *((_WORD *)a1[395] + v14) = v308;
          }
          else {
            *((_DWORD *)a1[394] + v14) = v308;
          }
          ++v14;
          if (v17)
          {
            uint64_t v309 = v410;
          }
          else
          {
            uint64_t v309 = (int)v410 + 1;
            if ((int)v309 >= v18)
            {
              int v17 = 0;
              uint64_t result = 4294967292;
              LODWORD(v41BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v410 + 1;
              goto LABEL_317;
            }
            int v7 = *((_DWORD *)a1 + *((unsigned __int8 *)a1 + v309 + 7884) + 16003);
            int v310 = &a1[129 * *((unsigned __int8 *)a1 + v309 + 7884)];
            size_t v6 = (uint64_t *)((char *)v310 + 45436);
            int v409 = (uint64_t *)((char *)v310 + 57820);
            unsigned int v5 = (uint64_t *)((char *)v310 + 51628);
            int v17 = 50;
            LODWORD(v8) = *((unsigned __int8 *)a1 + v309 + 7884);
          }
          --v17;
          int v11 = v7;
          uint64_t v410 = v309;
LABEL_478:
          *((_DWORD *)a1 + 2) = 40;
          int v311 = *((_DWORD *)a1 + 9);
          if (v311 >= v11)
          {
            unsigned int v315 = *((_DWORD *)a1 + 8);
          }
          else
          {
            uint64_t v312 = *a1;
            int v313 = *((_DWORD *)*a1 + 2) - 1;
            do
            {
              if (v313 == -1) {
                goto LABEL_8;
              }
              uint64_t v314 = *v312 + 1;
              unsigned int v315 = *(unsigned __int8 *)*v312 | (*((_DWORD *)a1 + 8) << 8);
              v311 += 8;
              *((_DWORD *)a1 + 8) = v315;
              *((_DWORD *)a1 + 9) = v311;
              *uint64_t v312 = v314;
              LODWORD(v314) = *((_DWORD *)v312 + 3);
              *((_DWORD *)v312 + 2) = v313;
              *((_DWORD *)v312 + 3) = v314 + 1;
              if (v314 == -1) {
                ++*((_DWORD *)v312 + 4);
              }
              --v313;
            }
            while (v311 < v11);
          }
          int v46 = v311 - v11;
          int v10 = (v315 >> v46) & ~(-1 << v11);
          *((_DWORD *)a1 + 9) = v46;
          while (1)
          {
            if (v11 > 20) {
              goto LABEL_316;
            }
            if (v10 <= *((_DWORD *)v6 + v11)) {
              break;
            }
            ++v11;
LABEL_307:
            *((_DWORD *)a1 + 2) = 41;
            if (v46 < 1)
            {
              int v205 = *a1;
              int v206 = *((_DWORD *)*a1 + 2) - 1;
              do
              {
                if (v206 == -1) {
                  goto LABEL_8;
                }
                uint64_t v207 = *v205 + 1;
                unsigned int v204 = *(unsigned __int8 *)*v205 | (*((_DWORD *)a1 + 8) << 8);
                v46 += 8;
                *((_DWORD *)a1 + 8) = v204;
                *((_DWORD *)a1 + 9) = v46;
                *int v205 = v207;
                LODWORD(v207) = *((_DWORD *)v205 + 3);
                *((_DWORD *)v205 + 2) = v206;
                *((_DWORD *)v205 + 3) = v207 + 1;
                if (v207 == -1) {
                  ++*((_DWORD *)v205 + 4);
                }
                --v206;
              }
              while (v46 - 8 <= -8);
            }
            else
            {
              unsigned int v204 = *((_DWORD *)a1 + 8);
            }
            int v9 = (v204 >> --v46) & 1;
            *((_DWORD *)a1 + 9) = v46;
            int v10 = v9 | (2 * v10);
          }
          uint64_t v199 = v11;
          goto LABEL_443;
        }
        int v13 = -1;
        for (int m = 1; ; int m = v12)
        {
          unsigned int v411 = v276;
          if (m >= 0x200000)
          {
            uint64_t result = 4294967292;
            int v12 = m;
            goto LABEL_317;
          }
          int v12 = 2 * m;
          if (v276) {
            m *= 2;
          }
          v13 += m;
          if (!v17)
          {
            uint64_t v410 = (int)v410 + 1;
            if ((int)v410 >= v18)
            {
              int v17 = 0;
              goto LABEL_316;
            }
            uint64_t v8 = *((unsigned __int8 *)a1 + v410 + 7884);
            int v7 = *((_DWORD *)a1 + v8 + 16003);
            int v363 = &a1[129 * v8];
            size_t v6 = (uint64_t *)((char *)v363 + 45436);
            int v409 = (uint64_t *)((char *)v363 + 57820);
            unsigned int v5 = (uint64_t *)((char *)v363 + 51628);
            int v17 = 50;
          }
          --v17;
          int v11 = v7;
LABEL_554:
          *((_DWORD *)a1 + 2) = 38;
          int v364 = *((_DWORD *)a1 + 9);
          if (v364 >= v11)
          {
            unsigned int v368 = *((_DWORD *)a1 + 8);
          }
          else
          {
            uint64_t v365 = *a1;
            int v366 = *((_DWORD *)*a1 + 2) - 1;
            do
            {
              if (v366 == -1) {
                goto LABEL_8;
              }
              uint64_t v367 = *v365 + 1;
              unsigned int v368 = *(unsigned __int8 *)*v365 | (*((_DWORD *)a1 + 8) << 8);
              v364 += 8;
              *((_DWORD *)a1 + 8) = v368;
              *((_DWORD *)a1 + 9) = v364;
              *uint64_t v365 = v367;
              LODWORD(v367) = *((_DWORD *)v365 + 3);
              *((_DWORD *)v365 + 2) = v366;
              *((_DWORD *)v365 + 3) = v367 + 1;
              if (v367 == -1) {
                ++*((_DWORD *)v365 + 4);
              }
              --v366;
            }
            while (v364 < v11);
          }
          int v45 = v364 - v11;
          int v10 = (v368 >> v45) & ~(-1 << v11);
          *((_DWORD *)a1 + 9) = v45;
          while (1)
          {
            if (v11 > 20) {
              goto LABEL_316;
            }
            if (v10 <= *((_DWORD *)v6 + v11)) {
              break;
            }
            ++v11;
LABEL_299:
            *((_DWORD *)a1 + 2) = 39;
            if (v45 < 1)
            {
              uint64_t v201 = *a1;
              int v202 = *((_DWORD *)*a1 + 2) - 1;
              do
              {
                if (v202 == -1) {
                  goto LABEL_8;
                }
                uint64_t v203 = *v201 + 1;
                unsigned int v200 = *(unsigned __int8 *)*v201 | (*((_DWORD *)a1 + 8) << 8);
                v45 += 8;
                *((_DWORD *)a1 + 8) = v200;
                *((_DWORD *)a1 + 9) = v45;
                *uint64_t v201 = v203;
                LODWORD(v203) = *((_DWORD *)v201 + 3);
                *((_DWORD *)v201 + 2) = v202;
                *((_DWORD *)v201 + 3) = v203 + 1;
                if (v203 == -1) {
                  ++*((_DWORD *)v201 + 4);
                }
                --v202;
              }
              while (v45 - 8 <= -8);
            }
            else
            {
              unsigned int v200 = *((_DWORD *)a1 + 8);
            }
            int v9 = (v200 >> --v45) & 1;
            *((_DWORD *)a1 + 9) = v45;
            int v10 = v9 | (2 * v10);
          }
          unsigned int v369 = v10 - *((_DWORD *)v5 + v11);
          if (v369 > 0x101) {
            goto LABEL_316;
          }
          unsigned int v276 = *((_DWORD *)v409 + v369);
          if (v276 >= 2) {
            break;
          }
        }
        int v370 = v13 + 1;
        uint64_t v371 = *((unsigned __int8 *)a1 + *((unsigned __int8 *)a1 + *((int *)a1 + 1955) + 3724) + 3468);
        *((_DWORD *)a1 + v371 + 17) += v13 + 1;
        if (*((unsigned char *)a1 + 44))
        {
          if ((v13 & 0x80000000) == 0)
          {
            if (v14 <= v15) {
              int v372 = v15;
            }
            else {
              int v372 = v14;
            }
            uint64_t v373 = v14;
            int v14 = v372;
            while (v372 != v373)
            {
              *((_WORD *)a1[395] + v373++) = v371;
              BOOL v374 = __OFSUB__(v370--, 1);
              if ((v370 < 0) ^ v374 | (v370 == 0)) {
                goto LABEL_587;
              }
            }
LABEL_589:
            unsigned int v411 = v276;
            uint64_t result = 4294967292;
            int v13 = v370;
            goto LABEL_317;
          }
LABEL_588:
          ++v13;
        }
        else
        {
          if (v13 < 0) {
            goto LABEL_588;
          }
          if (v14 <= v15) {
            int v375 = v15;
          }
          else {
            int v375 = v14;
          }
          uint64_t v373 = v14;
          int v14 = v375;
          do
          {
            if (v375 == v373) {
              goto LABEL_589;
            }
            *((_DWORD *)a1[394] + v373++) = v371;
            BOOL v374 = __OFSUB__(v370--, 1);
          }
          while (!((v370 < 0) ^ v374 | (v370 == 0)));
LABEL_587:
          int v13 = v370;
          int v14 = v373;
        }
      }
      int v316 = *((_DWORD *)a1 + 14);
      uint64_t result = 4294967292;
      if (v316 < 0 || v316 >= v14)
      {
        unsigned int v408 = v276;
        goto LABEL_317;
      }
      int v398 = k;
      uint64_t v317 = 0;
      uint64_t v318 = v14;
      do
      {
        int v319 = *((_DWORD *)a1 + v317 + 17);
        if (v319 < 0 || v319 > v14)
        {
          uint64_t result = 4294967292;
          unsigned int v408 = v276;
          LODWORD(v413) = v317;
          int k = v398;
          goto LABEL_317;
        }
        ++v317;
      }
      while (v317 != 256);
      int v384 = v21;
      uint64_t v320 = 0;
      uint64_t v321 = (uint64_t)(a1 + 137);
      *((_DWORD *)a1 + 274) = 0;
      do
      {
        *(_OWORD *)((char *)&a1[v320 + 137] + 4) = *(_OWORD *)((char *)&a1[v320 + 8] + 4);
        v320 += 2;
      }
      while (v320 != 128);
      uint64_t v322 = 0;
      int v323 = 0;
      uint64_t v324 = (uint64_t)a1 + 1100;
      int k = v398;
      do
      {
        v323 += *(_DWORD *)(v324 + v322);
        *(_DWORD *)(v324 + v322) = v323;
        v322 += 4;
      }
      while (v322 != 1024);
      uint64_t v325 = 0;
      do
      {
        uint64_t v413 = v325;
        int v326 = *((_DWORD *)a1 + v325 + 274);
        if (v326 < 0 || v326 > v14) {
          goto LABEL_533;
        }
        uint64_t v325 = v413 + 1;
      }
      while (v413 != 256);
      uint64_t v327 = 0;
      int v328 = 0;
      do
      {
        int v329 = *((_DWORD *)a1 + v327 + 275);
        if (v328 > v329)
        {
          LODWORD(v413) = v327 + 1;
LABEL_533:
          uint64_t result = 4294967292;
          unsigned int v408 = v276;
LABEL_534:
          int v21 = v384;
          goto LABEL_317;
        }
        ++v327;
        int v328 = v329;
      }
      while (v327 != 256);
      int v376 = v17;
      int v377 = v14;
      int v390 = v15;
      int v395 = v19;
      *((_DWORD *)a1 + 4) = 0;
      *((unsigned char *)a1 + 12) = 0;
      *((_DWORD *)a1 + 796) = -1;
      *((_DWORD *)a1 + 2) = 2;
      int v406 = v20;
      int v380 = v10;
      int v382 = v12;
      int v378 = v18;
      int v387 = v13;
      if (*((int *)a1 + 13) >= 2)
      {
        fwrite("rt+rld", 6uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
        uint64_t v321 = (uint64_t)(a1 + 137);
      }
      if (!*((unsigned char *)a1 + 44))
      {
        int v354 = 0;
        uint64_t v355 = 0;
        int v356 = a1[394];
        do
        {
          uint64_t v357 = (uint64_t)a1 + 4 * *((unsigned __int8 *)v356 + 4 * v355);
          *((_DWORD *)v356 + (int)(*(_DWORD *)(v357 + 1096))++) |= v354;
          ++v355;
          v354 += 256;
        }
        while (v318 != v355);
        unint64_t v358 = (unint64_t)*((unsigned int *)v356 + *((int *)a1 + 14)) >> 8;
        *((_DWORD *)a1 + 15) = v358;
        *((_DWORD *)a1 + 273) = 0;
        if (*((unsigned char *)a1 + 20))
        {
          a1[3] = 0;
          uint64_t result = 1;
          if (v358 >= 100000 * *((_DWORD *)a1 + 10)) {
            return result;
          }
          unsigned int v359 = *((_DWORD *)v356 + v358);
          *((_DWORD *)a1 + 273) = 1;
          int v360 = dword_26772B700[0] - 1;
          *((_DWORD *)a1 + 6) = dword_26772B700[0] - 1;
          *((_DWORD *)a1 + 7) = 1;
          *((_DWORD *)a1 + 15) = v359 >> 8;
          *((_DWORD *)a1 + 16) = v359 ^ (v360 == 1);
        }
        else
        {
          uint64_t result = 1;
          if (v358 >= 100000 * *((_DWORD *)a1 + 10)) {
            return result;
          }
          unsigned int v362 = *((_DWORD *)v356 + v358);
          *((_DWORD *)a1 + 15) = v362 >> 8;
          *((_DWORD *)a1 + 16) = v362;
          *((_DWORD *)a1 + 273) = 1;
        }
        unsigned int v408 = v411;
        LODWORD(v413) = v318;
        uint64_t result = 0;
        LODWORD(v2BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v406;
        int v19 = v395;
        int k = v398;
        goto LABEL_275;
      }
      for (uint64_t n = 0; n != 1028; n += 4)
        *(_DWORD *)((char *)a1 + n + 2124) = *(_DWORD *)((char *)a1 + n + 1096);
      uint64_t v331 = 0;
      do
      {
        int v332 = a1[395];
        uint64_t v333 = (uint64_t)a1 + 4 * *((unsigned __int8 *)v332 + 2 * v331);
        unsigned int v334 = *(_DWORD *)(v333 + 2124);
        *((_WORD *)v332 + v331) = v334;
        uint64_t v335 = a1[396];
        uint64_t v336 = v331 >> 1;
        int v337 = *((unsigned char *)v335 + v336) & 0xF | (16 * HIWORD(v334));
        int v338 = *((unsigned char *)v335 + v336) & 0xF0 | HIWORD(v334);
        if (v331) {
          LOBYTE(v338) = v337;
        }
        *((unsigned char *)v335 + v336) = v338;
        ++*(_DWORD *)(v333 + 2124);
        ++v331;
      }
      while (v318 != v331);
      int v339 = *((_DWORD *)a1 + 14);
      int k = *((unsigned __int16 *)a1[395] + v339) | (((*((unsigned __int8 *)a1[396] + (v339 >> 1)) >> (4 * (v339 & 1))) & 0xF) << 16);
      do
      {
        unsigned int v340 = k;
        int v341 = a1[395];
        unint64_t v342 = k;
        int v343 = *((unsigned __int16 *)v341 + k);
        int v344 = a1[396];
        unint64_t v345 = v342 >> 1;
        int v346 = *((unsigned __int8 *)v344 + v345) >> (4 * (v340 & 1));
        *((_WORD *)v341 + v34BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v339;
        int k = v343 & 0xFFF0FFFF | ((v346 & 0xF) << 16);
        int v347 = *((unsigned char *)v344 + v345) & 0xF | (16 * HIWORD(v339));
        int v348 = *((unsigned char *)v344 + v345) & 0xF0 | HIWORD(v339);
        if (v340) {
          LOBYTE(v348) = v347;
        }
        *((unsigned char *)v344 + v345) = v348;
        int v339 = v340;
      }
      while (v340 != *((_DWORD *)a1 + 14));
      *((_DWORD *)a1 + 15) = v340;
      *((_DWORD *)a1 + 273) = 0;
      LODWORD(v413) = v340;
      if (*((unsigned char *)a1 + 20))
      {
        a1[3] = 0;
        if (v340 < 100000 * *((_DWORD *)a1 + 10))
        {
          int v349 = sub_20DB50BF4(v340, v321);
          *((_DWORD *)a1 + 16) = v349;
          *((_DWORD *)a1 + 15) = *((unsigned __int16 *)a1[395] + *((unsigned int *)a1 + 15)) | (((*((unsigned __int8 *)a1[396]
                                                                                                  + ((unint64_t)*((unsigned int *)a1 + 15) >> 1)) >> (4 * (*((_DWORD *)a1 + 15) & 1))) & 0xF) << 16);
          ++*((_DWORD *)a1 + 273);
          int v350 = *((_DWORD *)a1 + 6);
          if (!v350)
          {
            uint64_t v351 = *((int *)a1 + 7);
            int v350 = dword_26772B700[v351];
            if (v351 == 511) {
              int v352 = 0;
            }
            else {
              int v352 = v351 + 1;
            }
            *((_DWORD *)a1 + 7) = v352;
          }
          uint64_t result = 0;
          int v353 = v350 - 1;
          *((_DWORD *)a1 + 6) = v353;
          *((_DWORD *)a1 + 16) = v349 ^ (v353 == 1);
LABEL_542:
          unsigned int v408 = v411;
          LODWORD(v2BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v406;
          int v19 = v395;
LABEL_275:
          int v10 = v380;
          int v12 = v382;
          int v18 = v378;
          int v15 = v390;
          int v13 = v387;
          int v21 = v384;
          int v14 = v377;
          int v17 = v376;
          goto LABEL_317;
        }
      }
      else if (v340 < 100000 * *((_DWORD *)a1 + 10))
      {
        int v361 = sub_20DB50BF4(v340, v321);
        uint64_t result = 0;
        *((_DWORD *)a1 + 16) = v361;
        *((_DWORD *)a1 + 15) = *((unsigned __int16 *)a1[395] + *((unsigned int *)a1 + 15)) | (((*((unsigned __int8 *)a1[396]
                                                                                                + ((unint64_t)*((unsigned int *)a1 + 15) >> 1)) >> (4 * (*((_DWORD *)a1 + 15) & 1))) & 0xF) << 16);
        ++*((_DWORD *)a1 + 273);
        goto LABEL_542;
      }
      return 1;
    case 11:
      int v26 = *((_DWORD *)a1 + 9);
      goto LABEL_53;
    case 12:
      int v27 = *((_DWORD *)a1 + 9);
      goto LABEL_61;
    case 13:
      int v28 = *((_DWORD *)a1 + 9);
      goto LABEL_69;
    case 14:
      goto LABEL_83;
    case 15:
      int v29 = *((_DWORD *)a1 + 9);
      goto LABEL_92;
    case 16:
      int v30 = *((_DWORD *)a1 + 9);
      goto LABEL_102;
    case 17:
      int v31 = *((_DWORD *)a1 + 9);
      goto LABEL_110;
    case 18:
      int v32 = *((_DWORD *)a1 + 9);
      goto LABEL_118;
    case 19:
      int v33 = *((_DWORD *)a1 + 9);
      goto LABEL_126;
    case 20:
      goto LABEL_137;
    case 21:
      int v34 = *((_DWORD *)a1 + 9);
      goto LABEL_145;
    case 22:
      int v35 = *((_DWORD *)a1 + 9);
      goto LABEL_153;
    case 23:
      int v36 = *((_DWORD *)a1 + 9);
      goto LABEL_161;
    case 24:
      int v37 = *((_DWORD *)a1 + 9);
      goto LABEL_169;
    case 25:
      int v38 = *((_DWORD *)a1 + 9);
      goto LABEL_177;
    case 26:
      int v39 = *((_DWORD *)a1 + 9);
      goto LABEL_185;
    case 27:
      int v40 = *((_DWORD *)a1 + 9);
      goto LABEL_193;
    case 28:
      goto LABEL_278;
    case 29:
      goto LABEL_338;
    case 30:
      goto LABEL_328;
    case 31:
      int v41 = *((_DWORD *)a1 + 9);
      goto LABEL_25;
    case 32:
      goto LABEL_351;
    case 33:
      goto LABEL_384;
    case 34:
      goto LABEL_425;
    case 35:
      int v43 = *((_DWORD *)a1 + 9);
      goto LABEL_433;
    case 36:
      goto LABEL_410;
    case 37:
      int v44 = *((_DWORD *)a1 + 9);
      goto LABEL_287;
    case 38:
      goto LABEL_554;
    case 39:
      int v45 = *((_DWORD *)a1 + 9);
      goto LABEL_299;
    case 40:
      goto LABEL_478;
    case 41:
      int v46 = *((_DWORD *)a1 + 9);
      goto LABEL_307;
    case 42:
      int v29 = *((_DWORD *)a1 + 9);
      goto LABEL_94;
    case 43:
      int v47 = *((_DWORD *)a1 + 9);
      goto LABEL_209;
    case 44:
      int v48 = *((_DWORD *)a1 + 9);
      goto LABEL_217;
    case 45:
      int v49 = *((_DWORD *)a1 + 9);
      goto LABEL_225;
    case 46:
      int v50 = *((_DWORD *)a1 + 9);
      goto LABEL_233;
    case 47:
      int v51 = *((_DWORD *)a1 + 9);
      goto LABEL_242;
    case 48:
      int v52 = *((_DWORD *)a1 + 9);
      goto LABEL_250;
    case 49:
      int v53 = *((_DWORD *)a1 + 9);
      goto LABEL_258;
    case 50:
      int v54 = *((_DWORD *)a1 + 9);
      goto LABEL_266;
    default:
      sub_20DB50680(4001);
  }
}

float sub_20DB5889C(__int32 a1, int8x16_t *a2, int a3, int8x16_t a4, double a5, int8x16_t a6, int8x16_t a7)
{
  int8x16_t v8 = *a2;
  int v7 = a2 + 1;
  int8x16_t v9 = veorq_s8(a4, a4);
  int8x16_t v10 = vrev64q_s8(v8);
  v9.i32[3] = a1;
  uint64x2_t v11 = (uint64x2_t)veorq_s8(v9, vextq_s8(v10, v10, 8uLL));
  BOOL v12 = __OFSUB__(a3, 16);
  int v13 = a3 - 16;
  if (!((v13 < 0) ^ v12 | (v13 == 0)))
  {
    if (v13 >= 48)
    {
      int8x16_t v14 = *v7;
      int8x16_t v15 = v7[1];
      int8x16_t v16 = v7[2];
      v7 += 3;
      int8x16_t v17 = vrev64q_s8(v14);
      int8x16_t v18 = vrev64q_s8(v15);
      int8x16_t v19 = vrev64q_s8(v16);
      int8x16_t v20 = vextq_s8(v17, v17, 8uLL);
      a6 = vextq_s8(v18, v18, 8uLL);
      a7 = vextq_s8(v19, v19, 8uLL);
      BOOL v12 = __OFSUB__(v13, 112);
      int v21 = v13 - 112;
      if (v21 < 0 == v12)
      {
        do
        {
          int8x16_t v23 = *v7;
          int8x16_t v24 = v7[1];
          int v22 = v7 + 2;
          int8x16_t v25 = vrev64q_s8(v23);
          int8x16_t v26 = vrev64q_s8(v24);
          uint64x2_t v11 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v11, qword_20DB59570), veorq_s8(vextq_s8(v25, v25, 8uLL), (int8x16_t)vmull_p64(v11.u64[0], 0xE6228B11uLL)));
          int8x16_t v20 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)v20, qword_20DB59570), veorq_s8(vextq_s8(v26, v26, 8uLL), (int8x16_t)vmull_p64(v20.u64[0], 0xE6228B11uLL)));
          int8x16_t v27 = *v22;
          int8x16_t v28 = v22[1];
          int v7 = v22 + 2;
          int8x16_t v29 = vrev64q_s8(v27);
          int8x16_t v30 = vrev64q_s8(v28);
          a6 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)a6, qword_20DB59570), veorq_s8(vextq_s8(v29, v29, 8uLL), (int8x16_t)vmull_p64(a6.u64[0], 0xE6228B11uLL)));
          a7 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)a7, qword_20DB59570), veorq_s8(vextq_s8(v30, v30, 8uLL), (int8x16_t)vmull_p64(a7.u64[0], 0xE6228B11uLL)));
          BOOL v12 = __OFSUB__(v21, 64);
          v21 -= 64;
        }
        while (!((v21 < 0) ^ v12 | (v21 == 0)));
      }
      uint64x2_t v31 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v11, qword_20DB59580), veorq_s8((int8x16_t)vmull_p64(v11.u64[0], 0xE8A45605uLL), v20));
      uint64x2_t v32 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v31, qword_20DB59580), veorq_s8((int8x16_t)vmull_p64(v31.u64[0], 0xE8A45605uLL), a6));
      uint64x2_t v11 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v32, qword_20DB59580), veorq_s8((int8x16_t)vmull_p64(v32.u64[0], 0xE8A45605uLL), a7));
      int v13 = v21 + 64;
    }
    BOOL v12 = __OFSUB__(v13, 16);
    for (int i = v13 - 16; i < 0 == v12; i -= 16)
    {
      int8x16_t v34 = *v7++;
      int8x16_t v35 = vrev64q_s8(v34);
      uint64x2_t v11 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v11, qword_20DB59580), veorq_s8((int8x16_t)vmull_p64(v11.u64[0], 0xE8A45605uLL), vextq_s8(v35, v35, 8uLL)));
      BOOL v12 = __OFSUB__(i, 16);
    }
  }
  int8x16_t v36 = veorq_s8(a6, a6);
  uint64x2_t v37 = (uint64x2_t)veorq_s8(a7, a7);
  *(uint64_t *)((char *)v36.i64 + 4) = v11.i64[0];
  int8x16_t v38 = veorq_s8(v36, (int8x16_t)vmull_high_p64(v11, qword_20DB59590));
  v37.i32[0] = v38.i32[2];
  int8x16_t v39 = veorq_s8(v38, (int8x16_t)vmull_p64(v37.u64[0], 0x490D678DuLL));
  v37.i32[0] = v39.i32[1];
  v37.i32[2] = vmull_p64(*(unint64_t *)&v37, 0x104D101DFuLL).i32[1];
  LODWORD(result) = veorq_s8(v39, (int8x16_t)vmull_high_p64(v37, qword_20DB595A0)).u32[0];
  return result;
}

uint64_t sub_20DB58A04()
{
  uint64_t result = MEMORY[0x270FA5388]();
  int v4 = v3;
  int v5 = v2;
  uint64_t v6 = result;
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v7 = v2;
  if (v2 >= 1)
  {
    int8x16_t v8 = &v56;
    uint64_t v9 = v2;
    do
    {
      unsigned int v11 = *v1++;
      int v10 = v11;
      if (v11 <= 1) {
        int v10 = 1;
      }
      *v8++ = v10 << 8;
      --v9;
    }
    while (v9);
  }
  int v57 = 0;
  v55[0] = 0;
  v54[0] = -2;
  if (v2 >= 1)
  {
    size_t v53 = 4 * v2;
    uint64_t v52 = v2;
    uint64_t v12 = (v2 + 1);
    while (1)
    {
      uint64_t result = (uint64_t)memset(&v54[1], 255, v53);
      uint64_t v13 = 0;
      uint64_t v14 = 1;
      do
      {
        ++v13;
        *(&v57 + v13) = v14;
        int v15 = v55[v14];
        unint64_t v16 = v13;
        unint64_t v17 = v13 >> 1;
        uint64_t v18 = *(&v57 + v17);
        if (v15 >= v55[v18])
        {
          unint64_t v19 = v13;
        }
        else
        {
          do
          {
            unint64_t v19 = v17;
            *(&v57 + v16) = v18;
            v17 >>= 1;
            uint64_t v18 = *(&v57 + v17);
            unint64_t v16 = v19;
          }
          while (v15 < v55[v18]);
        }
        *(&v57 + v19) = v14++;
      }
      while (v13 != v7);
      if (v5 >= 0x104) {
        sub_20DB50680(2001);
      }
      LODWORD(v2BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v5;
      if (v5 >= 2) {
        break;
      }
LABEL_50:
      if ((int)v20 >= 516) {
        sub_20DB50680(2002);
      }
      char v47 = 0;
      uint64_t v48 = 1;
      do
      {
        int v49 = -1;
        int v50 = v48;
        do
        {
          int v50 = v54[v50];
          ++v49;
        }
        while ((v50 & 0x80000000) == 0);
        *(unsigned char *)(v48 + v6 - 1) = v49;
        if (v49 > v4) {
          char v47 = 1;
        }
        ++v48;
      }
      while (v48 != v12);
      if (v47)
      {
        uint64_t v51 = 1;
        do
        {
          v55[v51] = (((((int)v55[v51] >> 8) + ((int)v55[v51] >> 8 < 0)) << 7) & 0xFFFFFF00) + 256;
          ++v51;
        }
        while (v12 != v51);
        int v57 = 0;
        v55[0] = 0;
        v54[0] = -2;
        if (v5 >= 1) {
          continue;
        }
      }
      return result;
    }
    uint64_t v20 = v52;
    uint64_t v21 = v7;
    while (1)
    {
      uint64_t v22 = v58;
      int v23 = *(&v57 + v21);
      int v58 = v23;
      uint64_t v24 = v21 - 1;
      uint64_t v25 = v21 - 2;
      if ((unint64_t)v21 <= 2)
      {
        int v58 = v23;
        int v32 = *(&v57 + v24);
        int v58 = v32;
      }
      else
      {
        int v26 = v55[v23];
        int v27 = 1;
        int v28 = 2;
        while (1)
        {
          uint64_t v29 = v28;
          if (v24 <= v28)
          {
            int v30 = v28;
          }
          else
          {
            int v30 = v28 | 1;
            if (v55[*(&v57 + (v28 | 1))] >= v55[*(&v57 + v28)]) {
              int v30 = v28;
            }
            uint64_t v29 = v30;
          }
          uint64_t v31 = *(&v57 + v29);
          uint64_t result = v55[v31];
          if (v26 < (int)result) {
            break;
          }
          *(&v57 + v27) = v31;
          int v28 = 2 * v30;
          int v27 = v30;
          if (v21 <= 2 * v30) {
            goto LABEL_30;
          }
        }
        int v30 = v27;
LABEL_30:
        *(&v57 + v3BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0) = v23;
        int v23 = v58;
        int v32 = *(&v57 + v24);
        int v58 = v32;
        if (v21 >= 4)
        {
          int v43 = v55[v32];
          int v33 = 1;
          uint64_t v44 = 2;
          while (1)
          {
            uint64_t v45 = (int)v44;
            if (v25 <= (int)v44)
            {
              uint64_t result = v44;
            }
            else
            {
              LODWORD(result) = v44 | 1;
              uint64_t result = v55[*(&v57 + ((int)v44 | 1))] >= v55[*(&v57 + (int)v44)]
                     ? v44
                     : result;
              uint64_t v45 = (int)result;
            }
            uint64_t v46 = *(&v57 + v45);
            if (v43 < v55[v46]) {
              goto LABEL_32;
            }
            *(&v57 + v33) = v46;
            uint64_t v44 = (2 * result);
            int v33 = result;
            if (v25 < (int)v44)
            {
              int v33 = result;
              goto LABEL_32;
            }
          }
        }
      }
      int v33 = 1;
LABEL_32:
      *(&v57 + v33) = v32;
      v54[v23] = ++v20;
      v54[v22] = v20;
      int v36 = v55[v22];
      int v34 = v55[v23];
      unsigned int v35 = (v34 & 0xFFFFFF00) + (v36 & 0xFFFFFF00);
      int v36 = v36;
      if (v36 <= v34) {
        int v36 = v34;
      }
      int v37 = (v36 + 1) | v35;
      v55[v20] = v37;
      v54[v20] = -1;
      *(&v57 + v24) = v20;
      unint64_t v38 = (v21 - 1);
      unint64_t v39 = v24 >> 1;
      uint64_t v40 = *(&v57 + v39);
      if (v37 >= v55[v40])
      {
        unint64_t v41 = (v21 - 1);
      }
      else
      {
        do
        {
          unint64_t v41 = v39;
          *(&v57 + v38) = v40;
          v39 >>= 1;
          uint64_t v40 = *(&v57 + v39);
          unint64_t v38 = v41;
        }
        while (v37 < v55[v40]);
      }
      *(&v57 + v41) = v20;
      if ((unint64_t)v21-- <= 2) {
        goto LABEL_50;
      }
    }
  }
  return result;
}

_DWORD *sub_20DB58E04(_DWORD *result, unsigned __int8 *a2, int a3, int a4, int a5)
{
  if (a3 <= a4)
  {
    int v5 = 0;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v6 = a5;
        uint64_t v7 = a2;
        int8x16_t v8 = result;
        do
        {
          int v9 = *v7++;
          if (a3 == v9) {
            *int8x16_t v8 = v5++;
          }
          ++v8;
          --v6;
        }
        while (v6);
      }
      v5 *= 2;
    }
    while (a3++ != a4);
  }
  return result;
}

_OWORD *sub_20DB58E60(_OWORD *result, _OWORD *a2, uint64_t a3, unsigned __int8 *a4, int a5, int a6, int a7)
{
  if (a5 <= a6)
  {
    int v7 = 0;
    int v8 = a5;
    do
    {
      if (a7 >= 1)
      {
        for (uint64_t i = 0; i != a7; ++i)
        {
          if (v8 == a4[i]) {
            *(_DWORD *)(a3 + 4 * v7++) = i;
          }
        }
      }
    }
    while (v8++ != a6);
  }
  *(_OWORD *)((char *)a2 + 76) = 0u;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (a7 > 0)
  {
    uint64_t v11 = a7;
    do
    {
      unsigned int v12 = *a4++;
      ++*((_DWORD *)a2 + v12 + 1);
      --v11;
    }
    while (v11);
  }
  int v13 = 0;
  for (uint64_t j = 4; j != 92; j += 4)
  {
    v13 += *(_DWORD *)((char *)a2 + j);
    *(_DWORD *)((char *)a2 + j) = v13;
  }
  *(_OWORD *)((char *)result + 76) = 0u;
  result[3] = 0u;
  result[4] = 0u;
  result[1] = 0u;
  result[2] = 0u;
  *uint64_t result = 0u;
  int v15 = (int *)result + a5;
  unint64_t v16 = (char *)a2 + 4 * a5;
  if (a5 <= a6)
  {
    int v17 = 0;
    uint64_t v18 = v16 + 4;
    int v19 = a6 - a5 + 1;
    uint64_t v20 = (_DWORD *)result + a5;
    do
    {
      int v21 = *v18 - *(v18 - 1) + v17;
      *v20++ = v21 - 1;
      int v17 = 2 * v21;
      ++v18;
      --v19;
    }
    while (v19);
  }
  if (a5 < a6)
  {
    uint64_t v22 = a6 - (uint64_t)a5;
    int v23 = v16 + 4;
    do
    {
      int v24 = *v15++;
      *int v23 = 2 * v24 - *v23 + 2;
      ++v23;
      --v22;
    }
    while (v22);
  }
  return result;
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
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

int fgetc(FILE *a1)
{
  return MEMORY[0x270ED9950](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
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

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}