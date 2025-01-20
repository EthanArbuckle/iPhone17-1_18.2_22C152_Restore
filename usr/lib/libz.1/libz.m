uint64_t gzoffset_0(gzFile a1)
{
  unsigned int have;
  uint64_t result;

  if (!a1) {
    return -1;
  }
  have = a1[1].have;
  if (have != 31153 && have != 7247) {
    return -1;
  }
  result = lseek(*(&a1[1].have + 1), 0, 1);
  if (result != -1 && a1[1].have == 7247) {
    result -= LODWORD(a1[5].pos);
  }
  return result;
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  if (!file) {
    return -1;
  }
  if (file[1].have != 7247) {
    return -1;
  }
  int pos_high = HIDWORD(file[4].pos);
  if (pos_high && pos_high != -5) {
    return -1;
  }
  if ((len & 0x80000000) != 0)
  {
    sub_23C2214B0((uint64_t)file, -2, "request does not fit in an int");
    return -1;
  }
  int result = sub_23C21E410((uint64_t)file, (char *)buf, len);
  if (!result)
  {
    int v7 = HIDWORD(file[4].pos);
    if (v7)
    {
      if (v7 != -5) {
        return -1;
      }
    }
  }
  return result;
}

uint64_t sub_23C21AAA0(int a1, uint64_t a2, unsigned int a3, char **a4, unsigned int *a5, _WORD *a6, unsigned int a7)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  int16x8_t v7 = 0uLL;
  int16x8_t v79 = 0u;
  int16x8_t v80 = 0u;
  int16x8_t v77 = 0u;
  int16x8_t v78 = 0u;
  if (a3 >= 2)
  {
    uint64_t v8 = 0;
    do
    {
      v10 = (unsigned __int16 *)(a2 + 2 * v8);
      unint64_t v11 = v8 + 4;
      v8 += 2;
      ++v77.i16[*v10];
      v12 = &v77.i8[2 * v10[1]];
      ++*((_WORD *)v12 + 16);
    }
    while (v11 <= a3);
    int16x8_t v7 = vaddq_s16(v79, v77);
    int16x8_t v9 = vaddq_s16(v80, v78);
  }
  else
  {
    LODWORD(v8) = 0;
    int16x8_t v9 = 0uLL;
  }
  v81[0] = v7;
  v81[1] = v9;
  if (v8 < a3)
  {
    uint64_t v13 = *(unsigned __int16 *)(a2 + 2 * v8);
    ++*((_WORD *)v81 + v13);
  }
  unsigned int v14 = 15;
  while (!*((_WORD *)v81 + v14))
  {
    if (!--v14)
    {
      v15 = *a4;
      *a4 += 4;
      *(_WORD *)v15 = 16385;
      *((_WORD *)v15 + 1) = 0;
      v16 = *a4;
      *a4 += 4;
      *(_WORD *)v16 = 16385;
      *((_WORD *)v16 + 1) = 0;
      unsigned int v17 = 1;
LABEL_12:
      uint64_t v18 = 0;
      *a5 = v17;
      return v18;
    }
  }
  if (*a5 >= v14) {
    unsigned int v19 = v14;
  }
  else {
    unsigned int v19 = *a5;
  }
  if (v14 < 2)
  {
    LODWORD(v20) = 1;
  }
  else
  {
    uint64_t v20 = 1;
    while (!*((_WORD *)v81 + v20))
    {
      if (v14 == ++v20)
      {
        LODWORD(v20) = v14;
        break;
      }
    }
  }
  if (v19 <= v20) {
    unsigned int v17 = v20;
  }
  else {
    unsigned int v17 = v19;
  }
  int v21 = 1;
  for (uint64_t i = 2; i != 32; i += 2)
  {
    int v21 = 2 * v21 - *(unsigned __int16 *)((char *)v81 + i);
    if (v21 < 0) {
      return 0xFFFFFFFFLL;
    }
  }
  if (!v21 || (uint64_t v18 = 0xFFFFFFFFLL, a1) && v14 == 1)
  {
    uint64_t v23 = 0;
    int v24 = 0;
    v77.i16[1] = 0;
    do
    {
      v24 += *(unsigned __int16 *)((char *)v81 + v23 * 2 + 2);
      v77.i16[v23 + 2] = v24;
      ++v23;
    }
    while (v23 != 14);
    if (a3 >= 2)
    {
      uint64_t v25 = 0;
      do
      {
        uint64_t v27 = *(unsigned __int16 *)(a2 + 2 * v25);
        if (*(_WORD *)(a2 + 2 * v25))
        {
          uint64_t v28 = v77.u16[v27];
          v77.i16[v27] = v28 + 1;
          a6[v28] = v25;
        }
        uint64_t v29 = *(unsigned __int16 *)(a2 + 2 * v25 + 2);
        if (*(_WORD *)(a2 + 2 * v25 + 2))
        {
          uint64_t v30 = v77.u16[v29];
          v77.i16[v29] = v30 + 1;
          a6[v30] = v25 | 1;
        }
        v25 += 2;
      }
      while (v25 + 2 <= (unint64_t)a3);
    }
    else
    {
      LODWORD(v25) = 0;
    }
    if (v25 < a3 && *(_WORD *)(a2 + 2 * v25)) {
      a6[v77.u16[*(unsigned __int16 *)(a2 + 2 * v25)]] = v25;
    }
    if (a1 == 1)
    {
      unsigned int v32 = 257;
      v76 = &unk_23C227EA4;
      v33 = &unk_23C227E66;
    }
    else
    {
      if (!a1)
      {
        v64 = a5;
        LOBYTE(v18) = 0;
        int v31 = 1 << v17;
        unsigned int v32 = 20;
        v75 = a6;
        v76 = a6;
LABEL_53:
        char v65 = v18;
        int v34 = 0;
        unsigned int v35 = 0;
        unsigned int v36 = 0;
        unsigned int v68 = v31;
        int v37 = v31 - 1;
        v38 = *a4;
        int v39 = -1;
        unsigned int v40 = v17;
        uint64_t v72 = a2;
        v73 = a6;
        unsigned int v70 = v32;
        unsigned int v71 = v17;
        int v69 = v37;
LABEL_54:
        unint64_t v41 = v40;
        int v74 = v39;
        while (1)
        {
          unint64_t v42 = v20 - v35;
          unsigned int v43 = (unsigned __int16)a6[v34];
          if (v43 + 1 < v32) {
            break;
          }
          BOOL v45 = v43 >= v32;
          v43 -= v32;
          if (!v45)
          {
            LOWORD(v43) = 0;
            char v44 = 96;
            goto LABEL_59;
          }
          int v47 = (unsigned __int16)v76[v43];
          char v44 = v76[v43];
          LOWORD(v43) = v75[v43];
          char v46 = (v47 & (v47 << 27 >> 31) & 0xF) + v20 - v35;
LABEL_61:
          v48 = &v38[4 * (v36 >> v35)];
          char *v48 = v46;
          v48[1] = v44;
          *((_WORD *)v48 + 1) = v43;
          unsigned int v49 = 1 << (v20 - 1);
          do
          {
            unsigned int v50 = v49;
            v49 >>= 1;
          }
          while ((v50 & v36) != 0);
          if (v50) {
            unsigned int v36 = ((v50 - 1) & v36) + v50;
          }
          else {
            unsigned int v36 = 0;
          }
          ++v34;
          __int16 v51 = *((_WORD *)v81 + v20) - 1;
          *((_WORD *)v81 + v20) = v51;
          if (!v51)
          {
            if (v20 == v14)
            {
              if (v36)
              {
                v63 = &v38[4 * v36];
                char *v63 = v42;
                v63[1] = 64;
                *((_WORD *)v63 + 1) = 0;
              }
              *a4 += 4 * v68;
              a5 = v64;
              goto LABEL_12;
            }
            unsigned int v52 = *(unsigned __int16 *)(a2 + 2 * (unsigned __int16)a6[v34]);
            if (v20 < v52)
            {
              do
              {
                if (v42 >= v41) {
                  break;
                }
                memcpy(&v38[4 * (1 << v42)], v38, 4 << v42);
                ++v42;
              }
              while (v52 - v35 != v42);
              LODWORD(v20) = v52;
              a2 = v72;
              a6 = v73;
              unsigned int v32 = v70;
              unsigned int v17 = v71;
              int v37 = v69;
              int v39 = v74;
            }
          }
          if (v20 > v17 && (v36 & v37) != v39)
          {
            if (!v35) {
              unsigned int v35 = v17;
            }
            unsigned int v40 = v20 - v35;
            int v53 = 1 << (v20 - v35);
            if (v20 >= v14)
            {
              char v56 = v65;
              unsigned int v55 = a7;
              unsigned int v57 = v68;
            }
            else
            {
              unsigned int v40 = v14 - v35;
              unsigned int v54 = v20;
              char v56 = v65;
              unsigned int v55 = a7;
              unsigned int v57 = v68;
              while (1)
              {
                int v58 = v53 - *((unsigned __int16 *)v81 + v54);
                if (v58 < 1) {
                  break;
                }
                int v53 = 2 * v58;
                if (++v54 >= v14) {
                  goto LABEL_83;
                }
              }
              unsigned int v40 = v54 - v35;
LABEL_83:
              int v53 = 1 << v40;
            }
            unsigned int v59 = v53 + v57;
            if (v59 > v55) {
              char v60 = v56;
            }
            else {
              char v60 = 0;
            }
            if ((v60 & 1) == 0)
            {
              unsigned int v68 = v59;
              v38 += 4 * (1 << v41);
              v61 = *a4;
              uint64_t v62 = (uint64_t)&(*a4)[4 * (v36 & v37)];
              *(unsigned char *)(v62 + 1) = v40;
              *(unsigned char *)uint64_t v62 = v17;
              *(_WORD *)(v62 + 2) = (v38 - v61) >> 2;
              int v39 = v36 & v37;
              goto LABEL_54;
            }
            return 1;
          }
        }
        char v44 = 0;
LABEL_59:
        char v46 = v20 - v35;
        goto LABEL_61;
      }
      unsigned int v32 = 0;
      v76 = &unk_23C227F22;
      v33 = &unk_23C227EE2;
    }
    v75 = v33;
    uint64_t v18 = 1;
    int v31 = 1 << v17;
    if (1 << v17 > a7) {
      return v18;
    }
    v64 = a5;
    goto LABEL_53;
  }
  return v18;
}

uint64_t sub_23C21AFF0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int16x8_t v7 = *(char **)(v6 + 72);
  if (v7
    || (uint64_t v8 = 1,
        int16x8_t v7 = (char *)(*(uint64_t (**)(void, void, uint64_t))(a1 + 64))(*(void *)(a1 + 80), (1 << *(_DWORD *)(v6 + 56)), 1), (*(void *)(v6 + 72) = v7) != 0))
  {
    unsigned int v9 = *(_DWORD *)(v6 + 60);
    if (!v9)
    {
      unsigned int v9 = 1 << *(_DWORD *)(v6 + 56);
      *(void *)(v6 + 64) = 0;
      *(_DWORD *)(v6 + 60) = v9;
    }
    if (v9 <= a3)
    {
      memcpy(v7, (const void *)(a2 - v9), v9);
      uint64_t v8 = 0;
      int v14 = *(_DWORD *)(v6 + 60);
      *(_DWORD *)(v6 + 68) = 0;
      goto LABEL_16;
    }
    uint64_t v10 = *(unsigned int *)(v6 + 68);
    unsigned int v11 = v9 - v10;
    if (v9 - v10 >= a3) {
      size_t v12 = a3;
    }
    else {
      size_t v12 = v11;
    }
    memcpy(&v7[v10], (const void *)(a2 - a3), v12);
    if (v11 < a3)
    {
      size_t v13 = a3 - v12;
      memcpy(*(void **)(v6 + 72), (const void *)(a2 - v13), v13);
      uint64_t v8 = 0;
      int v14 = *(_DWORD *)(v6 + 60);
      *(_DWORD *)(v6 + 68) = v13;
LABEL_16:
      *(_DWORD *)(v6 + 64) = v14;
      return v8;
    }
    uint64_t v8 = 0;
    int v15 = *(_DWORD *)(v6 + 68) + v12;
    unsigned int v17 = *(_DWORD *)(v6 + 60);
    unsigned int v16 = *(_DWORD *)(v6 + 64);
    if (v15 == v17) {
      int v15 = 0;
    }
    *(_DWORD *)(v6 + 68) = v15;
    if (v16 < v17)
    {
      uint64_t v8 = 0;
      int v14 = v16 + v12;
      goto LABEL_16;
    }
  }
  return v8;
}

uLong crc32_z(uLong crc, const Bytef *buf, z_size_t len)
{
  if (!buf) {
    return 0;
  }
  z_size_t v7 = len;
  uint64_t v8 = (int8x16_t *)buf;
  unint64_t v9 = ~crc;
  if (len && (buf & 0xF) != 0)
  {
    uint64_t v10 = buf + 1;
    do
    {
      __int8 v11 = v8->i8[0];
      uint64_t v8 = (int8x16_t *)((char *)v8 + 1);
      unint64_t v9 = qword_23C2263F0[(v11 ^ v9)] ^ (v9 >> 8);
      if (!--v7) {
        break;
      }
    }
    while ((unint64_t)(v10++ & 0xF));
  }
  if (v7 >= 0x20)
  {
    do
    {
      if (v7 >= 0x40000000) {
        int v13 = 0x40000000;
      }
      else {
        int v13 = v7;
      }
      unint64_t v9 = sub_23C21E2D0(v9, v8, v13 & 0x7FFFFFF0, v3, v4, v5, v6);
      uint64_t v8 = (int8x16_t *)((char *)v8 + (v13 & 0x7FFFFFF0));
      v7 -= v13 & 0x7FFFFFF0;
    }
    while (v7 > 0x1F);
  }
  if (v7 >= 8)
  {
    do
    {
      v7 -= 8;
      unint64_t v14 = qword_23C2263F0[(v8->i8[0] ^ v9)] ^ (v9 >> 8);
      unint64_t v15 = qword_23C2263F0[(v8->i8[1] ^ v14)] ^ (v14 >> 8);
      unint64_t v16 = qword_23C2263F0[(v8->i8[2] ^ v15)] ^ (v15 >> 8);
      unint64_t v17 = qword_23C2263F0[(v8->i8[3] ^ v16)] ^ (v16 >> 8);
      unint64_t v18 = qword_23C2263F0[(v8->i8[4] ^ v17)] ^ (v17 >> 8);
      unint64_t v19 = qword_23C2263F0[(v8->i8[5] ^ v18)] ^ (v18 >> 8);
      unint64_t v20 = qword_23C2263F0[(v8->i8[6] ^ v19)] ^ (v19 >> 8);
      int v21 = (int8x16_t *)&v8->u64[1];
      unint64_t v9 = qword_23C2263F0[(v8->i8[7] ^ v20)] ^ (v20 >> 8);
      uint64_t v8 = (int8x16_t *)((char *)v8 + 8);
    }
    while (v7 > 7);
    uint64_t v8 = v21;
  }
  for (; v7; --v7)
  {
    __int8 v22 = v8->i8[0];
    uint64_t v8 = (int8x16_t *)((char *)v8 + 1);
    unint64_t v9 = qword_23C2263F0[(v22 ^ v9)] ^ (v9 >> 8);
  }
  return v9 ^ 0xFFFFFFFF;
}

int inflate(z_streamp strm, int flush)
{
  unint64_t v2 = *(void *)&flush;
  z_streamp v3 = strm;
  if (sub_23C21CCF0(strm)) {
    return -2;
  }
  next_out = v3->next_out;
  if (!next_out) {
    return -2;
  }
  next_in = v3->next_in;
  if (!v3->next_in)
  {
    if (v3->avail_in) {
      return -2;
    }
  }
  state = v3->state;
  int v8 = *((_DWORD *)state + 2);
  if (v8 == 16191)
  {
    int v8 = 16192;
    *((_DWORD *)state + 2) = 16192;
  }
  int v236 = 0;
  unint64_t avail_out = v3->avail_out;
  unint64_t v10 = *((void *)state + 10);
  v228 = (char *)state + 1368;
  unint64_t v11 = *((unsigned int *)state + 22);
  unsigned int v233 = v2 - 5;
  uInt avail_in = v3->avail_in;
  unint64_t v12 = avail_out;
  unint64_t v13 = avail_in;
  unsigned int v235 = v2;
  while (2)
  {
    int v14 = -3;
    int v15 = 1;
    switch(v8)
    {
      case 16180:
        int v16 = *((_DWORD *)state + 4);
        if (!v16)
        {
          int v33 = 16192;
          goto LABEL_382;
        }
        if (v11 <= 0xF)
        {
          uint64_t v17 = 0;
          do
          {
            if (!v13) {
              goto LABEL_389;
            }
            unint64_t v13 = (v13 - 1);
            unsigned int v18 = *next_in++;
            v10 += (unint64_t)v18 << (v11 + v17);
            v17 += 8;
          }
          while ((unint64_t)v11 + v17 - 8 < 8);
          unint64_t v11 = (v11 + v17);
        }
        if ((v16 & 2) != 0 && v10 == 35615)
        {
          if (!*((_DWORD *)state + 14)) {
            *((_DWORD *)state + 14) = 15;
          }
          uLong v19 = crc32(0, 0, 0);
          *((void *)state + 4) = v19;
          *(_WORD *)buf = -29921;
          uLong v20 = crc32(v19, buf, 2u);
          unint64_t v10 = 0;
          unint64_t v11 = 0;
          *((void *)state + 4) = v20;
          int v21 = 16181;
          goto LABEL_228;
        }
        uint64_t v164 = *((void *)state + 6);
        if (v164) {
          *(_DWORD *)(v164 + 72) = -1;
        }
        if ((v16 & 1) == 0
          || 0xEF7BDEF7BDEF7BDFLL * (((unint64_t)v10 << 8) + (v10 >> 8)) >= 0x842108421084211)
        {
          int v24 = "incorrect header check";
          goto LABEL_381;
        }
        if ((v10 & 0xF) != 8) {
          goto LABEL_380;
        }
        unsigned int v211 = v10 >> 4;
        unsigned int v212 = v211 + 8;
        unsigned int v213 = *((_DWORD *)state + 14);
        if (!v213)
        {
          *((_DWORD *)state + 14) = v212;
          unsigned int v213 = v211 + 8;
        }
        if (v211 > 7 || v212 > v213)
        {
          v10 >>= 4;
          unint64_t v11 = (v11 - 4);
          int v24 = "invalid window size";
          goto LABEL_381;
        }
        *((_DWORD *)state + 6) = 0;
        *((_DWORD *)state + 7) = 256 << v211;
        uLong v214 = adler32(0, 0, 0);
        unint64_t v11 = 0;
        *((void *)state + 4) = v214;
        v3->adler = v214;
        if ((v10 & 0x2000) != 0) {
          int v215 = 16189;
        }
        else {
          int v215 = 16191;
        }
        *((_DWORD *)state + 2) = v215;
        unint64_t v10 = 0;
        goto LABEL_383;
      case 16181:
        if (v11 > 0xF) {
          goto LABEL_25;
        }
        uint64_t v22 = 0;
        do
        {
          if (!v13)
          {
            LODWORD(v11) = v11 + v22;
            goto LABEL_390;
          }
          unint64_t v13 = (v13 - 1);
          unsigned int v23 = *next_in++;
          v10 += (unint64_t)v23 << (v11 + v22);
          v22 += 8;
        }
        while ((unint64_t)v11 + v22 - 8 < 8);
        unint64_t v11 = (v11 + v22);
LABEL_25:
        *((_DWORD *)state + 6) = v10;
        if (v10 != 8)
        {
LABEL_380:
          int v24 = "unknown compression method";
          goto LABEL_381;
        }
        if ((v10 & 0xE000) != 0)
        {
          int v24 = "unknown header flags set";
          goto LABEL_381;
        }
        unint64_t v2 = v12;
        v165 = (unsigned int *)*((void *)state + 6);
        if (v165) {
          unsigned int *v165 = (v10 >> 8) & 1;
        }
        unint64_t v12 = avail_out;
        if ((v10 & 0x200) != 0 && (*((unsigned char *)state + 16) & 4) != 0)
        {
          *(_WORD *)buf = v10;
          *((void *)state + 4) = crc32(*((void *)state + 4), buf, 2u);
        }
        LODWORD(v11) = 0;
        unint64_t v10 = 0;
        *((_DWORD *)state + 2) = 16182;
LABEL_244:
        unint64_t avail_out = v11;
        do
        {
          if (!v13) {
            goto LABEL_391;
          }
          unsigned int v166 = *next_in++;
          LODWORD(v13) = v13 - 1;
          v10 += (unint64_t)v166 << avail_out;
          BOOL v193 = avail_out >= 0x18;
          avail_out += 8;
        }
        while (!v193);
LABEL_248:
        uint64_t v167 = *((void *)state + 6);
        if (v167) {
          *(void *)(v167 + 8) = v10;
        }
        if ((*((unsigned char *)state + 25) & 2) != 0 && (*((unsigned char *)state + 16) & 4) != 0)
        {
          *(_DWORD *)buf = v10;
          *((void *)state + 4) = crc32(*((void *)state + 4), buf, 4u);
        }
        LODWORD(v11) = 0;
        unint64_t v10 = 0;
        *((_DWORD *)state + 2) = 16183;
LABEL_254:
        unint64_t avail_out = v11;
        do
        {
          if (!v13) {
            goto LABEL_391;
          }
          unsigned int v168 = *next_in++;
          unint64_t v13 = (v13 - 1);
          v10 += (unint64_t)v168 << avail_out;
          BOOL v193 = avail_out >= 8;
          avail_out += 8;
        }
        while (!v193);
LABEL_258:
        uint64_t v169 = *((void *)state + 6);
        if (v169)
        {
          *(_DWORD *)(v169 + 16) = v10;
          *(_DWORD *)(v169 + 20) = v10 >> 8;
        }
        if ((*((unsigned char *)state + 25) & 2) != 0 && (*((unsigned char *)state + 16) & 4) != 0)
        {
          *(_WORD *)buf = v10;
          *((void *)state + 4) = crc32(*((void *)state + 4), buf, 2u);
        }
        unint64_t v10 = 0;
        LODWORD(v11) = 0;
        unint64_t v26 = 0;
        *((_DWORD *)state + 2) = 16184;
        int v25 = *((_DWORD *)state + 6);
        unint64_t avail_out = v12;
        unint64_t v12 = v2;
        unint64_t v2 = v235;
        if ((v25 & 0x400) != 0)
        {
LABEL_266:
          unint64_t v171 = avail_out;
          unint64_t avail_out = v11;
          while (v13)
          {
            unsigned int v172 = *next_in++;
            unint64_t v13 = (v13 - 1);
            v10 += (unint64_t)v172 << avail_out;
            BOOL v193 = avail_out >= 8;
            avail_out += 8;
            if (v193)
            {
              unint64_t avail_out = v171;
              goto LABEL_271;
            }
          }
          LODWORD(v11) = avail_out;
          int v15 = v236;
          LODWORD(avail_out) = v171;
          goto LABEL_403;
        }
LABEL_264:
        uint64_t v170 = *((void *)state + 6);
        if (v170) {
          *(void *)(v170 + 24) = 0;
        }
LABEL_277:
        *((_DWORD *)state + 2) = 16185;
        unint64_t v11 = v26;
LABEL_278:
        int v175 = *((_DWORD *)state + 6);
        if ((v175 & 0x400) != 0)
        {
          unsigned int v176 = *((_DWORD *)state + 23);
          if (v176 >= v13) {
            uInt v177 = v13;
          }
          else {
            uInt v177 = *((_DWORD *)state + 23);
          }
          if (v177)
          {
            uint64_t v178 = *((void *)state + 6);
            if (v178)
            {
              uint64_t v179 = *(void *)(v178 + 24);
              if (v179)
              {
                int v181 = *(_DWORD *)(v178 + 32);
                unsigned int v180 = *(_DWORD *)(v178 + 36);
                unsigned int v182 = v181 - v176;
                if (v180 > v182)
                {
                  if (v182 + v177 <= v180) {
                    size_t v183 = v177;
                  }
                  else {
                    size_t v183 = v180 - v182;
                  }
                  unsigned int v230 = v12;
                  unint64_t v184 = v11;
                  memcpy((void *)(v179 + v182), next_in, v183);
                  unint64_t v11 = v184;
                  unint64_t v12 = v230;
                  int v175 = *((_DWORD *)state + 6);
                }
              }
            }
            if ((v175 & 0x200) != 0 && (*((unsigned char *)state + 16) & 4) != 0)
            {
              unsigned int v231 = v12;
              unint64_t v185 = v11;
              uLong v186 = crc32(*((void *)state + 4), next_in, v177);
              unint64_t v11 = v185;
              unint64_t v12 = v231;
              *((void *)state + 4) = v186;
            }
            unint64_t v13 = v13 - v177;
            next_in += v177;
            unsigned int v176 = *((_DWORD *)state + 23) - v177;
            *((_DWORD *)state + 23) = v176;
          }
          if (v176) {
            goto LABEL_390;
          }
        }
        *((_DWORD *)state + 23) = 0;
        *((_DWORD *)state + 2) = 16186;
LABEL_296:
        if ((*((unsigned char *)state + 25) & 8) == 0)
        {
          uint64_t v187 = *((void *)state + 6);
          if (v187) {
            *(void *)(v187 + 40) = 0;
          }
          goto LABEL_315;
        }
        if (!v13) {
          goto LABEL_390;
        }
        unsigned int v232 = v12;
        unsigned int v227 = avail_out;
        unint64_t v188 = 0;
        do
        {
          int v189 = next_in[v188];
          uint64_t v190 = *((void *)state + 6);
          if (v190)
          {
            uint64_t v191 = *(void *)(v190 + 40);
            if (v191)
            {
              uint64_t v192 = *((unsigned int *)state + 23);
              if (v192 < *(_DWORD *)(v190 + 48))
              {
                *((_DWORD *)state + 23) = v192 + 1;
                *(unsigned char *)(v191 + v192) = v189;
              }
            }
          }
          ++v188;
          if (v189) {
            BOOL v193 = v188 >= v13;
          }
          else {
            BOOL v193 = 1;
          }
        }
        while (!v193);
        if ((*((unsigned char *)state + 25) & 2) != 0 && (*((unsigned char *)state + 16) & 4) != 0)
        {
          unint64_t v194 = v11;
          uLong v195 = crc32(*((void *)state + 4), next_in, v188);
          unint64_t v11 = v194;
          *((void *)state + 4) = v195;
        }
        next_in += v188;
        if (v189) {
          goto LABEL_397;
        }
        unint64_t v13 = v13 - v188;
        unint64_t v2 = v235;
        unint64_t avail_out = v227;
        unint64_t v12 = v232;
LABEL_315:
        *((_DWORD *)state + 23) = 0;
        *((_DWORD *)state + 2) = 16187;
LABEL_316:
        if ((*((unsigned char *)state + 25) & 0x10) == 0)
        {
          uint64_t v196 = *((void *)state + 6);
          if (v196) {
            *(void *)(v196 + 56) = 0;
          }
          goto LABEL_335;
        }
        if (!v13) {
          goto LABEL_390;
        }
        unsigned int v232 = v12;
        unsigned int v227 = avail_out;
        unint64_t v188 = 0;
        do
        {
          int v197 = next_in[v188];
          uint64_t v198 = *((void *)state + 6);
          if (v198)
          {
            uint64_t v199 = *(void *)(v198 + 56);
            if (v199)
            {
              uint64_t v200 = *((unsigned int *)state + 23);
              if (v200 < *(_DWORD *)(v198 + 64))
              {
                *((_DWORD *)state + 23) = v200 + 1;
                *(unsigned char *)(v199 + v200) = v197;
              }
            }
          }
          ++v188;
          if (v197) {
            BOOL v201 = v188 >= v13;
          }
          else {
            BOOL v201 = 1;
          }
        }
        while (!v201);
        if ((*((unsigned char *)state + 25) & 2) != 0 && (*((unsigned char *)state + 16) & 4) != 0)
        {
          unint64_t v202 = v11;
          uLong v203 = crc32(*((void *)state + 4), next_in, v188);
          unint64_t v11 = v202;
          *((void *)state + 4) = v203;
        }
        next_in += v188;
        if (v197)
        {
LABEL_397:
          LODWORD(v13) = v13 - v188;
          LODWORD(v2) = v235;
          int v15 = v236;
          LODWORD(avail_out) = v227;
          LODWORD(v12) = v232;
          goto LABEL_403;
        }
        unint64_t v13 = v13 - v188;
        unint64_t v2 = v235;
        unint64_t avail_out = v227;
        unint64_t v12 = v232;
LABEL_335:
        *((_DWORD *)state + 2) = 16188;
LABEL_336:
        unsigned int v204 = *((_DWORD *)state + 6);
        if ((v204 & 0x200) == 0)
        {
LABEL_345:
          unint64_t v46 = v11;
          uint64_t v206 = *((void *)state + 6);
          if (v206)
          {
            *(_DWORD *)(v206 + 68) = (v204 >> 9) & 1;
            *(_DWORD *)(v206 + 72) = 1;
          }
          uLong v207 = crc32(0, 0, 0);
          *((void *)state + 4) = v207;
          v3->adler = v207;
          *((_DWORD *)state + 2) = 16191;
          goto LABEL_348;
        }
        if (v11 <= 0xF)
        {
          uint64_t v17 = 0;
          do
          {
            if (!v13) {
              goto LABEL_389;
            }
            unint64_t v13 = (v13 - 1);
            unsigned int v205 = *next_in++;
            v10 += (unint64_t)v205 << (v11 + v17);
            v17 += 8;
          }
          while ((unint64_t)v11 + v17 - 8 < 8);
          unint64_t v11 = (v11 + v17);
        }
        if ((*((unsigned char *)state + 16) & 4) == 0 || v10 == *((unsigned __int16 *)state + 16))
        {
          unint64_t v10 = 0;
          unint64_t v11 = 0;
          goto LABEL_345;
        }
        int v24 = "header crc mismatch";
LABEL_381:
        v3->msg = (char *)v24;
        int v33 = 16209;
LABEL_382:
        *((_DWORD *)state + 2) = v33;
LABEL_383:
        int v8 = *((_DWORD *)state + 2);
        continue;
      case 16182:
        unint64_t v2 = v12;
        unint64_t v12 = avail_out;
        if (v11 > 0x1F) {
          goto LABEL_248;
        }
        goto LABEL_244;
      case 16183:
        unint64_t v2 = v12;
        unint64_t v12 = avail_out;
        if (v11 > 0xF) {
          goto LABEL_258;
        }
        goto LABEL_254;
      case 16184:
        int v25 = *((_DWORD *)state + 6);
        if ((v25 & 0x400) == 0)
        {
          unint64_t v26 = v11;
          goto LABEL_264;
        }
        if (v11 <= 0xF) {
          goto LABEL_266;
        }
LABEL_271:
        *((_DWORD *)state + 23) = v10;
        uint64_t v173 = *((void *)state + 6);
        if (v173) {
          *(_DWORD *)(v173 + 32) = v10;
        }
        if ((v25 & 0x200) != 0 && (*((unsigned char *)state + 16) & 4) != 0)
        {
          *(_WORD *)buf = v10;
          uLong v174 = crc32(*((void *)state + 4), buf, 2u);
          unint64_t v10 = 0;
          unint64_t v26 = 0;
          *((void *)state + 4) = v174;
        }
        else
        {
          unint64_t v10 = 0;
          unint64_t v26 = 0;
        }
        goto LABEL_277;
      case 16185:
        goto LABEL_278;
      case 16186:
        goto LABEL_296;
      case 16187:
        goto LABEL_316;
      case 16188:
        goto LABEL_336;
      case 16189:
        unint64_t v27 = avail_out;
        if (v11 > 0x1F) {
          goto LABEL_39;
        }
        unint64_t avail_out = v11;
        do
        {
          if (!v13)
          {
            LODWORD(v11) = avail_out;
            int v15 = v236;
            LODWORD(avail_out) = v27;
            goto LABEL_403;
          }
          unsigned int v28 = *next_in++;
          unint64_t v13 = (v13 - 1);
          v10 += (unint64_t)v28 << avail_out;
          BOOL v193 = avail_out >= 0x18;
          avail_out += 8;
        }
        while (!v193);
LABEL_39:
        LODWORD(v11) = 0;
        uLong v29 = bswap32(v10);
        *((void *)state + 4) = v29;
        v3->adler = v29;
        *((_DWORD *)state + 2) = 16190;
        unint64_t v10 = 0;
        unint64_t avail_out = v27;
LABEL_40:
        if (!*((_DWORD *)state + 5))
        {
          v3->next_out = next_out;
          v3->unint64_t avail_out = avail_out;
          v3->next_in = next_in;
          v3->uInt avail_in = v13;
          *((void *)state + 10) = v10;
          int result = 2;
          *((_DWORD *)state + 22) = v11;
          return result;
        }
        unint64_t v30 = v12;
        int v31 = v11;
        uLong v32 = adler32(0, 0, 0);
        LODWORD(v11) = v31;
        unint64_t v12 = v30;
        *((void *)state + 4) = v32;
        v3->adler = v32;
        *((_DWORD *)state + 2) = 16191;
LABEL_42:
        if (v233 < 2) {
          goto LABEL_390;
        }
LABEL_43:
        if (*((_DWORD *)state + 3))
        {
          v10 >>= v11 & 7;
          unint64_t v11 = v11 & 0xFFFFFFF8;
          int v33 = 16206;
          goto LABEL_382;
        }
        if (v11 >= 3) {
          goto LABEL_48;
        }
        if (v13)
        {
          unint64_t v13 = (v13 - 1);
          unsigned int v34 = *next_in++;
          v10 += (unint64_t)v34 << v11;
          LODWORD(v11) = v11 + 8;
LABEL_48:
          *((_DWORD *)state + 3) = v10 & 1;
          int v35 = 16193;
          switch((v10 >> 1) & 3)
          {
            case 1u:
              *((void *)state + 13) = &unk_23C2275E6;
              *((void *)state + 14) = &unk_23C227DE6;
              *((void *)state + 15) = 0x500000009;
              *((_DWORD *)state + 2) = 16199;
              if (v2 != 6) {
                goto LABEL_226;
              }
              v10 >>= 3;
              LODWORD(v11) = v11 - 3;
              goto LABEL_390;
            case 2u:
              int v35 = 16196;
              break;
            case 3u:
              v3->msg = "invalid block type";
              int v35 = 16209;
              break;
            default:
              break;
          }
          *((_DWORD *)state + 2) = v35;
LABEL_226:
          v10 >>= 3;
          unint64_t v11 = (v11 - 3);
          goto LABEL_383;
        }
        int v14 = v236;
LABEL_402:
        int v15 = v14;
        goto LABEL_403;
      case 16190:
        goto LABEL_40;
      case 16191:
        goto LABEL_42;
      case 16192:
        goto LABEL_43;
      case 16193:
        v10 >>= v11 & 7;
        uint64_t v36 = v11 & 0xFFFFFFF8;
        if (v36 <= 0x1F)
        {
          uint64_t v37 = 0;
          while (v13)
          {
            unint64_t v13 = (v13 - 1);
            unsigned int v38 = *next_in++;
            v10 += (unint64_t)v38 << ((v11 & 0xF8u) + v37);
            v37 += 8;
            if ((unint64_t)(v36 + v37 - 8) >= 0x18)
            {
              unint64_t v11 = (v36 + v37);
              goto LABEL_101;
            }
          }
          LODWORD(v11) = (v11 & 0xFFFFFFF8) + v37;
          goto LABEL_390;
        }
        unint64_t v11 = v11 & 0xFFFFFFF8;
LABEL_101:
        if (((v10 >> 16) ^ 0xFFFF) != (unsigned __int16)v10)
        {
          int v24 = "invalid stored block lengths";
          goto LABEL_381;
        }
        unint64_t v11 = 0;
        *((_DWORD *)state + 23) = (unsigned __int16)v10;
        *((_DWORD *)state + 2) = 16194;
        unint64_t v10 = 0;
        if (v2 == 6) {
          goto LABEL_390;
        }
LABEL_103:
        *((_DWORD *)state + 2) = 16195;
LABEL_104:
        unsigned int v63 = *((_DWORD *)state + 23);
        if (v63)
        {
          if (v63 >= v13) {
            unsigned int v63 = v13;
          }
          if (v63 >= avail_out) {
            size_t v64 = avail_out;
          }
          else {
            size_t v64 = v63;
          }
          if (v64)
          {
            char v65 = next_out;
            v229 = next_out;
            v66 = v3;
            int v67 = avail_out;
            unint64_t v68 = v2;
            unint64_t v69 = v12;
            unint64_t v70 = v11;
            memcpy(v65, next_in, v64);
            unint64_t v11 = v70;
            unint64_t v12 = v69;
            unint64_t v2 = v68;
            LODWORD(v68) = v67;
            z_streamp v3 = v66;
            unint64_t v13 = (v13 - v64);
            next_in += v64;
            unint64_t avail_out = (v68 - v64);
            next_out = &v229[v64];
            *((_DWORD *)state + 23) -= v64;
            goto LABEL_383;
          }
          goto LABEL_390;
        }
        goto LABEL_237;
      case 16194:
        goto LABEL_103;
      case 16195:
        goto LABEL_104;
      case 16196:
        if (v11 > 0xD) {
          goto LABEL_61;
        }
        uint64_t v17 = 0;
        do
        {
          if (!v13) {
            goto LABEL_389;
          }
          unint64_t v13 = (v13 - 1);
          unsigned int v39 = *next_in++;
          v10 += (unint64_t)v39 << (v11 + v17);
          v17 += 8;
        }
        while ((unint64_t)v11 + v17 - 8 < 6);
        LODWORD(v11) = v11 + v17;
LABEL_61:
        unint64_t v40 = v10 & 0x1F;
        unint64_t v41 = (v10 >> 5) & 0x1F;
        *((_DWORD *)state + 33) = (v10 & 0x1F) + 257;
        *((_DWORD *)state + 34) = v41 + 1;
        unint64_t v42 = ((v10 >> 10) & 0xF) + 4;
        *((_DWORD *)state + 32) = v42;
        v10 >>= 14;
        unint64_t v11 = (v11 - 14);
        if (v40 > 0x1D || v41 >= 0x1E)
        {
          int v24 = "too many length or distance symbols";
          goto LABEL_381;
        }
        unint64_t v2 = v12;
        unint64_t v12 = avail_out;
        unint64_t v43 = 0;
        *((_DWORD *)state + 35) = 0;
        *((_DWORD *)state + 2) = 16197;
LABEL_65:
        LODWORD(avail_out) = v11;
        do
        {
          if (avail_out <= 2)
          {
            if (!v13)
            {
LABEL_391:
              LODWORD(v11) = avail_out;
              LODWORD(avail_out) = v12;
              LODWORD(v12) = v2;
              LODWORD(v2) = v235;
              int v15 = v236;
              goto LABEL_403;
            }
            unint64_t v13 = (v13 - 1);
            unsigned int v44 = *next_in++;
            v10 += (unint64_t)v44 << avail_out;
            LODWORD(avail_out) = avail_out + 8;
          }
          uint64_t v45 = word_23C2275C0[v43];
          *((_DWORD *)state + 35) = v43 + 1;
          *((_WORD *)state + v45 + 76) = v10 & 7;
          v10 >>= 3;
          unint64_t avail_out = (avail_out - 3);
          ++v43;
        }
        while (v42 != v43);
        unint64_t v11 = avail_out;
        unint64_t v43 = v42;
LABEL_71:
        unint64_t v46 = v11;
        if (v43 <= 0x12)
        {
          do
            *((_WORD *)state + word_23C2275C0[v43++] + 76) = 0;
          while (v43 != 19);
          *((_DWORD *)state + 35) = 19;
        }
        *((void *)state + 18) = v228;
        *((void *)state + 13) = v228;
        *((_DWORD *)state + 30) = 7;
        int v47 = sub_23C21AAA0(0, (uint64_t)state + 152, 0x13u, (char **)state + 18, (unsigned int *)state + 30, (_WORD *)state + 396, 0);
        unint64_t avail_out = v12;
        if (v47)
        {
          int v236 = v47;
          v3->msg = "invalid code lengths set";
          *((_DWORD *)state + 2) = 16209;
          unint64_t v12 = v2;
          unint64_t v2 = v235;
          goto LABEL_348;
        }
        unsigned int v48 = 0;
        int v236 = 0;
        *((_DWORD *)state + 35) = 0;
        *((_DWORD *)state + 2) = 16198;
        unint64_t v12 = v2;
        unint64_t v2 = v235;
        unint64_t v11 = v46;
LABEL_113:
        unsigned int v71 = *((_DWORD *)state + 34) + *((_DWORD *)state + 33);
        if (v48 >= v71)
        {
LABEL_148:
          if (!*((_WORD *)state + 332))
          {
            v3->msg = "invalid code -- missing end-of-block";
            int v21 = 16209;
LABEL_228:
            *((_DWORD *)state + 2) = v21;
            goto LABEL_383;
          }
          unint64_t v46 = v11;
          if (sub_23C21E6C0((uint64_t)v3))
          {
LABEL_348:
            unint64_t v11 = v46;
            goto LABEL_383;
          }
          *((_DWORD *)state + 2) = 16199;
          LODWORD(v11) = v46;
          if (v2 == 6) {
            goto LABEL_390;
          }
LABEL_151:
          *((_DWORD *)state + 2) = 16200;
LABEL_152:
          if (v13 >= 0x19 && avail_out >= 0x143)
          {
            v3->next_out = next_out;
            v3->unint64_t avail_out = avail_out;
            v3->next_in = next_in;
            v3->uInt avail_in = v13;
            *((void *)state + 10) = v10;
            *((_DWORD *)state + 22) = v11;
            sub_23C21CD38((uint64_t)v3, v12);
            next_out = v3->next_out;
            unint64_t avail_out = v3->avail_out;
            next_in = v3->next_in;
            unint64_t v13 = v3->avail_in;
            unint64_t v10 = *((void *)state + 10);
            unint64_t v11 = *((unsigned int *)state + 22);
            if (*((_DWORD *)state + 2) == 16191) {
              *((_DWORD *)state + 1787) = -1;
            }
            goto LABEL_383;
          }
          *((_DWORD *)state + 1787) = 0;
          uint64_t v95 = *((void *)state + 13);
          int v96 = -1 << *((_DWORD *)state + 30);
          uint64_t v97 = v10 & ~v96;
          v98 = (char *)(v95 + 4 * v97);
          char v99 = *v98;
          int v100 = v98[1];
          unsigned __int8 v101 = v99 - (v100 & (v100 << 27 >> 31) & 0xF);
          if (v11 >= v101)
          {
            int v110 = v101;
          }
          else
          {
            uint64_t v102 = 0;
            int v103 = ~v96;
            v104 = next_in;
            LODWORD(v105) = v13;
            do
            {
              if (!v105) {
                goto LABEL_388;
              }
              unint64_t v105 = (v105 - 1);
              unsigned int v106 = *v104++;
              v10 += (unint64_t)v106 << (v11 + v102);
              uint64_t v97 = v103 & v10;
              v107 = (char *)(v95 + 4 * v97);
              char v108 = *v107;
              int v100 = v107[1];
              unsigned __int8 v109 = v108 - (v100 & (v100 << 27 >> 31) & 0xF);
              v102 += 8;
            }
            while ((unint64_t)v11 + v102 < v109);
            int v110 = v109;
            LODWORD(v11) = v11 + v102;
            unint64_t v13 = v105;
            next_in = v104;
            unsigned __int8 v101 = v109;
          }
          int v111 = *(unsigned __int16 *)(v95 + 4 * v97 + 2);
          if ((v100 - 1) > 0xE)
          {
            int v110 = 0;
          }
          else
          {
            int v112 = -1 << (v110 + v100);
            uint64_t v113 = ((v10 & ~v112) >> v110) + v111;
            v114 = (char *)(v95 + 4 * v113);
            char v115 = *v114;
            int v100 = v114[1];
            unsigned __int8 v116 = v115 - (v100 & ((char)(8 * v100) >> 7) & 0xF);
            if (v110 + v116 > v11)
            {
              uint64_t v117 = 0;
              int v118 = ~v112;
              v119 = next_in;
              LODWORD(v120) = v13;
              do
              {
                if (!v120) {
                  goto LABEL_388;
                }
                unsigned int v121 = *v119++;
                unint64_t v120 = (v120 - 1);
                v10 += (unint64_t)v121 << (v11 + v117);
                uint64_t v113 = ((v10 & v118) >> v110) + v111;
                v122 = (char *)(v95 + 4 * v113);
                char v123 = *v122;
                int v100 = v122[1];
                unsigned __int8 v116 = v123 - (v100 & ((char)(8 * v100) >> 7) & 0xF);
                v117 += 8;
              }
              while ((unint64_t)v11 + v117 < v110 + v116);
              LODWORD(v11) = v11 + v117;
              unint64_t v13 = v120;
              next_in = v119;
            }
            int v111 = *(unsigned __int16 *)(v95 + 4 * v113 + 2);
            v10 >>= v101;
            LODWORD(v11) = v11 - v110;
            unsigned __int8 v101 = v116;
          }
          v10 >>= v101;
          unint64_t v11 = v11 - v101;
          *((_DWORD *)state + 1787) = v110 + v101;
          *((_DWORD *)state + 23) = v111;
          if (!v100)
          {
            int v33 = 16205;
            goto LABEL_382;
          }
          if ((v100 & 0x20) != 0)
          {
            *((_DWORD *)state + 1787) = -1;
LABEL_237:
            int v33 = 16191;
            goto LABEL_382;
          }
          if ((v100 & 0x40) != 0)
          {
            int v24 = "invalid literal/length code";
            goto LABEL_381;
          }
          unsigned int v49 = v100 & 0xF;
          *((_DWORD *)state + 25) = v49;
          *((_DWORD *)state + 2) = 16201;
          if ((v100 & 0xF) != 0)
          {
LABEL_78:
            if (v11 < v49)
            {
              unsigned int v50 = next_in;
              LODWORD(v51) = v13;
              unsigned int v52 = v11;
              while (v51)
              {
                unint64_t v51 = (v51 - 1);
                unsigned int v53 = *v50++;
                v10 += (unint64_t)v53 << v52;
                v52 += 8;
                if (v52 >= v49) {
                  goto LABEL_179;
                }
              }
              goto LABEL_388;
            }
            unsigned int v52 = v11;
            unint64_t v51 = v13;
            unsigned int v50 = next_in;
LABEL_179:
            int v124 = *((_DWORD *)state + 23) + (v10 & ~(-1 << v49));
            *((_DWORD *)state + 23) = v124;
            v10 >>= v49;
            LODWORD(v11) = v52 - v49;
            *((_DWORD *)state + 1787) += v49;
            unint64_t v13 = v51;
            next_in = v50;
          }
          else
          {
LABEL_174:
            int v124 = *((_DWORD *)state + 23);
          }
          *((_DWORD *)state + 1788) = v124;
          *((_DWORD *)state + 2) = 16202;
LABEL_181:
          uint64_t v125 = *((void *)state + 14);
          int v126 = -1 << *((_DWORD *)state + 31);
          uint64_t v127 = v10 & ~v126;
          uint64_t v129 = v125 + 4 * v127;
          char v128 = *(unsigned char *)v129;
          LODWORD(v129) = *(unsigned __int8 *)(v129 + 1);
          unsigned __int8 v130 = v128 - (v129 & ((int)(v129 << 27) >> 31) & 0xF);
          if (v11 < v130)
          {
            uint64_t v131 = 0;
            int v132 = ~v126;
            v133 = next_in;
            LODWORD(v134) = v13;
            while (v134)
            {
              unint64_t v134 = (v134 - 1);
              unsigned int v135 = *v133++;
              v10 += (unint64_t)v135 << (v11 + v131);
              uint64_t v127 = v132 & v10;
              uint64_t v129 = v125 + 4 * v127;
              char v136 = *(unsigned char *)v129;
              LODWORD(v129) = *(unsigned __int8 *)(v129 + 1);
              unsigned __int8 v137 = v136 - (v129 & ((int)(v129 << 27) >> 31) & 0xF);
              v131 += 8;
              if ((unint64_t)v11 + v131 >= v137)
              {
                int v138 = v137;
                LODWORD(v11) = v11 + v131;
                unint64_t v13 = v134;
                next_in = v133;
                unsigned __int8 v130 = v137;
                goto LABEL_187;
              }
            }
            goto LABEL_388;
          }
          int v138 = v130;
LABEL_187:
          int v139 = *(unsigned __int16 *)(v125 + 4 * v127 + 2);
          if (v129 >= 0x10)
          {
            int v150 = *((_DWORD *)state + 1787);
          }
          else
          {
            int v140 = -1 << (v138 + v129);
            uint64_t v141 = ((v10 & ~v140) >> v138) + v139;
            uint64_t v129 = v125 + 4 * v141;
            char v142 = *(unsigned char *)v129;
            LOBYTE(v129) = *(unsigned char *)(v129 + 1);
            unsigned __int8 v143 = v142 - (v129 & ((char)(8 * v129) >> 7) & 0xF);
            if (v138 + v143 > v11)
            {
              uint64_t v144 = 0;
              int v145 = ~v140;
              v146 = next_in;
              LODWORD(v147) = v13;
              while (v147)
              {
                unsigned int v148 = *v146++;
                unint64_t v147 = (v147 - 1);
                v10 += (unint64_t)v148 << (v11 + v144);
                uint64_t v141 = ((v10 & v145) >> v138) + v139;
                uint64_t v129 = v125 + 4 * v141;
                char v149 = *(unsigned char *)v129;
                LOBYTE(v129) = *(unsigned char *)(v129 + 1);
                unsigned __int8 v143 = v149 - (v129 & ((char)(8 * v129) >> 7) & 0xF);
                v144 += 8;
                if ((unint64_t)v11 + v144 >= v138 + v143)
                {
                  LODWORD(v11) = v11 + v144;
                  unint64_t v13 = v147;
                  next_in = v146;
                  goto LABEL_193;
                }
              }
              goto LABEL_388;
            }
LABEL_193:
            int v139 = *(unsigned __int16 *)(v125 + 4 * v141 + 2);
            v10 >>= v130;
            LODWORD(v11) = v11 - v138;
            int v150 = *((_DWORD *)state + 1787) + v138;
            unsigned __int8 v130 = v143;
          }
          v10 >>= v130;
          unint64_t v11 = v11 - v130;
          *((_DWORD *)state + 1787) = v150 + v130;
          if ((v129 & 0x40) != 0)
          {
            int v24 = "invalid distance code";
            goto LABEL_381;
          }
          unsigned int v54 = v129 & 0xF;
          *((_DWORD *)state + 24) = v139;
          *((_DWORD *)state + 25) = v54;
          *((_DWORD *)state + 2) = 16203;
          if ((v129 & 0xF) != 0)
          {
LABEL_197:
            if (v11 < v54)
            {
              v151 = next_in;
              LODWORD(v152) = v13;
              unsigned int v153 = v11;
              while (v152)
              {
                unint64_t v152 = (v152 - 1);
                unsigned int v154 = *v151++;
                v10 += (unint64_t)v154 << v153;
                v153 += 8;
                if (v153 >= v54) {
                  goto LABEL_204;
                }
              }
LABEL_388:
              next_in += v13;
              int v15 = v236;
              LODWORD(v11) = v11 + 8 * v13;
              LODWORD(v13) = 0;
              goto LABEL_403;
            }
            unsigned int v153 = v11;
            unint64_t v152 = v13;
            v151 = next_in;
LABEL_204:
            *((_DWORD *)state + 24) += v10 & ~(-1 << v54);
            v10 >>= v54;
            unint64_t v11 = v153 - v54;
            *((_DWORD *)state + 1787) += v54;
            unint64_t v13 = v152;
            next_in = v151;
          }
LABEL_205:
          *((_DWORD *)state + 2) = 16204;
LABEL_206:
          if (avail_out)
          {
            uint64_t v155 = *((unsigned int *)state + 24);
            if (v155 <= (int)v12 - (int)avail_out)
            {
              v157 = &next_out[-v155];
              unsigned int v158 = *((_DWORD *)state + 23);
              unsigned int v159 = v158;
            }
            else
            {
              unsigned int v156 = v155 - (v12 - avail_out);
              if (v156 > *((_DWORD *)state + 16) && *((_DWORD *)state + 1786))
              {
                int v24 = "invalid distance too far back";
                goto LABEL_381;
              }
              unsigned int v160 = *((_DWORD *)state + 17);
              unsigned int v159 = v156 - v160;
              if (v156 <= v160)
              {
                unsigned int v161 = v160 - v156;
                unsigned int v159 = v156;
              }
              else
              {
                unsigned int v161 = *((_DWORD *)state + 15) - v159;
              }
              v157 = (Bytef *)(*((void *)state + 9) + v161);
              unsigned int v158 = *((_DWORD *)state + 23);
              if (v159 >= v158) {
                unsigned int v159 = *((_DWORD *)state + 23);
              }
            }
            if (v159 >= avail_out) {
              unsigned int v159 = avail_out;
            }
            *((_DWORD *)state + 23) = v158 - v159;
            unsigned int v162 = v159;
            do
            {
              Bytef v163 = *v157++;
              *next_out++ = v163;
              --v162;
            }
            while (v162);
            unint64_t avail_out = avail_out - v159;
            if (!*((_DWORD *)state + 23))
            {
LABEL_222:
              int v33 = 16200;
              goto LABEL_382;
            }
            goto LABEL_383;
          }
          goto LABEL_390;
        }
        uint64_t v72 = *((void *)state + 13);
        int v73 = ~(-1 << *((_DWORD *)state + 30));
        while (1)
        {
          uint64_t v74 = v73 & v10;
          unsigned __int8 v75 = *(unsigned char *)(v72 + 4 * v74)
              - (*(unsigned char *)(v72 + 4 * v74 + 1) & ((char)(8
                                                                                     * *(unsigned char *)(v72
                                                                                                + 4
                                                                                                * v74
                                                                                                + 1)) >> 7) & 0xF);
          if (v11 >= v75)
          {
            int v80 = (*(unsigned char *)(v72 + 4 * v74)
                                  - (*(unsigned char *)(v72 + 4 * v74 + 1) & ((char)(8 * *(unsigned char *)(v72 + 4 * v74 + 1)) >> 7) & 0xF));
          }
          else
          {
            uint64_t v76 = 0;
            int16x8_t v77 = next_in;
            LODWORD(v78) = v13;
            do
            {
              if (!v78) {
                goto LABEL_388;
              }
              unint64_t v78 = (v78 - 1);
              unsigned int v79 = *v77++;
              v10 += (unint64_t)v79 << (v11 + v76);
              uint64_t v74 = v73 & v10;
              v76 += 8;
            }
            while ((unint64_t)v11 + v76 < (*(unsigned char *)(v72
                                                                                           + 4 * v74)
                                                                                - (*(unsigned char *)(v72
                                                                                            + 4 * v74
                                                                                            + 1) & ((char)(8 * *(unsigned char *)(v72 + 4 * v74 + 1)) >> 7) & 0xF)));
            int v80 = (*(unsigned char *)(v72 + 4 * v74)
                                  - (*(unsigned char *)(v72 + 4 * v74 + 1) & ((char)(8 * *(unsigned char *)(v72 + 4 * v74 + 1)) >> 7) & 0xF));
            LODWORD(v11) = v11 + v76;
            unint64_t v13 = v78;
            next_in = v77;
            unsigned __int8 v75 = *(unsigned char *)(v72 + 4 * v74)
                - (*(unsigned char *)(v72 + 4 * v74 + 1) & ((char)(8
                                                                                       * *(unsigned char *)(v72
                                                                                                  + 4 * v74
                                                                                                  + 1)) >> 7) & 0xF);
          }
          unsigned int v81 = *(unsigned __int16 *)(v72 + 4 * v74 + 2);
          if (v81 > 0xF) {
            break;
          }
          v10 >>= v75;
          unint64_t v11 = (v11 - v80);
          uint64_t v82 = (char *)state + 2 * v48++;
          *((_DWORD *)state + 35) = v48;
          *((_WORD *)v82 + 76) = v81;
LABEL_147:
          if (v48 >= v71) {
            goto LABEL_148;
          }
        }
        if (v81 != 16)
        {
          if (v81 == 17)
          {
            unint64_t v83 = (v80 + 3);
            if (v11 < v83)
            {
              uint64_t v84 = 0;
              do
              {
                if (!v13) {
                  goto LABEL_396;
                }
                unsigned int v85 = *next_in++;
                unint64_t v13 = (v13 - 1);
                v10 += (unint64_t)v85 << (v11 + v84);
                v84 += 8;
              }
              while ((unint64_t)v11 + v84 < v83);
              LODWORD(v11) = v11 + v84;
            }
            __int16 v86 = 0;
            unint64_t v87 = v10 >> v75;
            int v88 = ((v10 >> v75) & 7) + 3;
            unint64_t v10 = v87 >> 3;
            unint64_t v11 = (v11 - v80 - 3);
          }
          else
          {
            unint64_t v91 = (v80 + 7);
            if (v11 < v91)
            {
              uint64_t v84 = 0;
              do
              {
                if (!v13) {
                  goto LABEL_396;
                }
                unsigned int v92 = *next_in++;
                unint64_t v13 = (v13 - 1);
                v10 += (unint64_t)v92 << (v11 + v84);
                v84 += 8;
              }
              while ((unint64_t)v11 + v84 < v91);
              LODWORD(v11) = v11 + v84;
            }
            __int16 v86 = 0;
            unint64_t v93 = v10 >> v75;
            int v88 = ((v10 >> v75) & 0x7F) + 11;
            unint64_t v10 = v93 >> 7;
            unint64_t v11 = (v11 - v80 - 7);
          }
LABEL_144:
          if (v88 + v48 > v71) {
            goto LABEL_384;
          }
          do
          {
            v94 = (char *)state + 2 * v48++;
            *((_WORD *)v94 + 76) = v86;
            --v88;
          }
          while (v88);
          *((_DWORD *)state + 35) = v48;
          goto LABEL_147;
        }
        unint64_t v89 = (v80 + 2);
        if (v11 >= v89) {
          goto LABEL_136;
        }
        uint64_t v84 = 0;
        while (v13)
        {
          unsigned int v90 = *next_in++;
          unint64_t v13 = (v13 - 1);
          v10 += (unint64_t)v90 << (v11 + v84);
          v84 += 8;
          if ((unint64_t)v11 + v84 >= v89)
          {
            LODWORD(v11) = v11 + v84;
LABEL_136:
            v10 >>= v75;
            unint64_t v11 = (v11 - v80);
            if (v48)
            {
              __int16 v86 = *((_WORD *)state + v48 + 75);
              int v88 = (v10 & 3) + 3;
              v10 >>= 2;
              unint64_t v11 = (v11 - 2);
              goto LABEL_144;
            }
LABEL_384:
            int v24 = "invalid bit length repeat";
            goto LABEL_381;
          }
        }
LABEL_396:
        LODWORD(v11) = v11 + v84;
LABEL_390:
        int v15 = v236;
LABEL_403:
        v3->next_out = next_out;
        v3->unint64_t avail_out = avail_out;
        v3->next_in = next_in;
        v3->uInt avail_in = v13;
        *((void *)state + 10) = v10;
        *((_DWORD *)state + 22) = v11;
        if (!*((_DWORD *)state + 15))
        {
          if (v12 == avail_out
            || (unsigned int v216 = *((_DWORD *)state + 2), v216 > 0x3F50)
            || v2 == 4 && v216 > 0x3F4D)
          {
LABEL_413:
            uint64_t v217 = (v12 - avail_out);
            v3->total_in += avail_in - v13;
            v3->total_out += v217;
            *((void *)state + 5) += v217;
            if ((*((unsigned char *)state + 16) & 4) != 0 && v12 != avail_out)
            {
              uLong v218 = *((void *)state + 4);
              v219 = &v3->next_out[-v217];
              if (*((_DWORD *)state + 6)) {
                uLong v220 = crc32(v218, v219, v217);
              }
              else {
                uLong v220 = adler32(v218, v219, v217);
              }
              *((void *)state + 4) = v220;
              v3->adler = v220;
            }
            int v221 = *((_DWORD *)state + 2);
            if (v221 == 16194 || v221 == 16199) {
              int v223 = 256;
            }
            else {
              int v223 = 0;
            }
            v3->data_type = *((_DWORD *)state + 22)
                          + ((*((_DWORD *)state + 3) != 0) << 6)
                          + ((v221 == 16191) << 7)
                          + v223;
            if ((v12 == avail_out && avail_in == v13 || v2 == 4) && v15 == 0) {
              return -5;
            }
            else {
              return v15;
            }
          }
        }
        if (!sub_23C21AFF0((uint64_t)v3, (uint64_t)next_out, (int)v12 - (int)avail_out))
        {
          LODWORD(v13) = v3->avail_in;
          LODWORD(avail_out) = v3->avail_out;
          goto LABEL_413;
        }
        *((_DWORD *)state + 2) = 16210;
        return -4;
      case 16197:
        unint64_t v2 = v12;
        unint64_t v12 = avail_out;
        unint64_t v42 = *((unsigned int *)state + 32);
        unint64_t v43 = *((unsigned int *)state + 35);
        if (v43 < v42) {
          goto LABEL_65;
        }
        goto LABEL_71;
      case 16198:
        unsigned int v48 = *((_DWORD *)state + 35);
        goto LABEL_113;
      case 16199:
        goto LABEL_151;
      case 16200:
        goto LABEL_152;
      case 16201:
        unsigned int v49 = *((_DWORD *)state + 25);
        if (v49) {
          goto LABEL_78;
        }
        goto LABEL_174;
      case 16202:
        goto LABEL_181;
      case 16203:
        unsigned int v54 = *((_DWORD *)state + 25);
        if (!v54) {
          goto LABEL_205;
        }
        goto LABEL_197;
      case 16204:
        goto LABEL_206;
      case 16205:
        if (!avail_out) {
          goto LABEL_390;
        }
        *next_out++ = *((_DWORD *)state + 23);
        unint64_t avail_out = (avail_out - 1);
        goto LABEL_222;
      case 16206:
        int v55 = *((_DWORD *)state + 4);
        if (!v55) {
          goto LABEL_359;
        }
        if (v11 > 0x1F) {
          goto LABEL_93;
        }
        uint64_t v17 = 0;
        while (v13)
        {
          unint64_t v13 = (v13 - 1);
          unsigned int v56 = *next_in++;
          v10 += (unint64_t)v56 << (v11 + v17);
          v17 += 8;
          if ((unint64_t)v11 + v17 - 8 >= 0x18)
          {
            unint64_t v11 = (v11 + v17);
LABEL_93:
            uint64_t v57 = (v12 - avail_out);
            v3->total_out += v57;
            *((void *)state + 5) += v57;
            int v58 = v55 & 4;
            if ((v55 & 4) != 0 && v12 != avail_out)
            {
              unint64_t v59 = v11;
              uLong v60 = *((void *)state + 4);
              v61 = &next_out[-v57];
              if (*((_DWORD *)state + 6)) {
                uLong v62 = crc32(v60, v61, v57);
              }
              else {
                uLong v62 = adler32(v60, v61, v57);
              }
              *((void *)state + 4) = v62;
              v3->adler = v62;
              int v55 = *((_DWORD *)state + 4);
              int v58 = v55 & 4;
              unint64_t v11 = v59;
            }
            if (v58)
            {
              unint64_t v208 = bswap32(v10);
              uint64_t v209 = *((_DWORD *)state + 6) ? v10 : v208;
              if (v209 != *((void *)state + 4))
              {
                v3->msg = "incorrect data check";
                *((_DWORD *)state + 2) = 16209;
                unint64_t v12 = avail_out;
                goto LABEL_383;
              }
            }
            unint64_t v10 = 0;
            unint64_t v11 = 0;
            unint64_t v12 = avail_out;
LABEL_359:
            *((_DWORD *)state + 2) = 16207;
LABEL_360:
            if (v55 && *((_DWORD *)state + 6))
            {
              if (v11 <= 0x1F)
              {
                uint64_t v17 = 0;
                do
                {
                  if (!v13) {
                    goto LABEL_389;
                  }
                  unint64_t v13 = (v13 - 1);
                  unsigned int v210 = *next_in++;
                  v10 += (unint64_t)v210 << (v11 + v17);
                  v17 += 8;
                }
                while ((unint64_t)v11 + v17 - 8 < 0x18);
                unint64_t v11 = (v11 + v17);
              }
              if ((v55 & 4) != 0 && v10 != *((_DWORD *)state + 10))
              {
                int v24 = "incorrect length check";
                goto LABEL_381;
              }
              unint64_t v10 = 0;
              LODWORD(v11) = 0;
            }
            *((_DWORD *)state + 2) = 16208;
            int v15 = 1;
            goto LABEL_403;
          }
        }
LABEL_389:
        LODWORD(v11) = v11 + v17;
        goto LABEL_390;
      case 16207:
        int v55 = *((_DWORD *)state + 4);
        goto LABEL_360;
      case 16208:
        goto LABEL_403;
      case 16209:
        goto LABEL_402;
      case 16210:
        return -4;
      default:
        return -2;
    }
  }
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return crc32_z(crc, buf, len);
}

uLong adler32_z(uLong adler, const Bytef *buf, z_size_t len)
{
  unint64_t v5 = WORD1(adler);
  adler = (unsigned __int16)adler;
  if (len == 1)
  {
    unint64_t v6 = (unsigned __int16)adler + (unint64_t)*buf;
    if (v6 > 0xFFF0) {
      v6 -= 65521;
    }
    if (v6 + v5 <= 0xFFF0) {
      uint64_t v7 = (v6 + v5) << 16;
    }
    else {
      uint64_t v7 = ((v6 + v5) << 16) - 4293984256u;
    }
    return v7 | v6;
  }
  else if (buf)
  {
    if (len >= 0x10)
    {
      if ((buf & 0xF) != 0 || len >> 31)
      {
        unint64_t v11 = buf + 1;
        do
        {
          --len;
          unsigned int v12 = *buf++;
          uLong v13 = adler + v12;
          if (v13 <= 0xFFF0) {
            adler = v13;
          }
          else {
            adler = v13 - 65521;
          }
          unint64_t v5 = (v13 + v5) % 0xFFF1;
          BOOL v14 = (v11++ & 0xF) == 0;
        }
        while (!v14 || len >> 31);
      }
      return sub_23C21D310(adler, v5, (uint8x16_t *)buf, len);
    }
    else
    {
      for (; len; --len)
      {
        unsigned int v9 = *buf++;
        adler += v9;
        v5 += adler;
      }
      uLong v10 = adler - 65521;
      if (adler <= 0xFFF0) {
        uLong v10 = adler;
      }
      return v10 | ((v5 % 0xFFF1) << 16);
    }
  }
  else
  {
    return 1;
  }
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return adler32_z(adler, buf, len);
}

BOOL sub_23C21CCF0(void *a1)
{
  return !a1
      || !a1[8]
      || !a1[9]
      || (uint64_t v1 = a1[7]) == 0
      || *(void **)v1 != a1
      || (*(_DWORD *)(v1 + 8) - 16212) < 0xFFFFFFE0;
}

uint64_t sub_23C21CD38(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 56);
  z_streamp v3 = *(void **)result;
  double v4 = *(__int8 **)(result + 24);
  unint64_t v5 = &v4[*(unsigned int *)(result + 32)];
  uint64_t v59 = *(void *)result + *(unsigned int *)(result + 8);
  unint64_t v6 = v59 - 25;
  unint64_t v7 = (unint64_t)(v5 - 323);
  int v8 = v5 - a2;
  unsigned int v9 = *(_DWORD *)(v2 + 60);
  unsigned int v10 = *(_DWORD *)(v2 + 68);
  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = *(_DWORD *)(v2 + 64) >= v9;
  }
  if (v11) {
    unsigned int v10 = *(_DWORD *)(v2 + 60);
  }
  uint64_t v12 = ~(-1 << *(_DWORD *)(v2 + 120));
  uint64_t v13 = ~(-1 << *(_DWORD *)(v2 + 124));
  uint64_t v14 = *(void *)(v2 + 72);
  unint64_t v15 = *(void *)(v2 + 80) & ~(-1 << *(_DWORD *)(v2 + 88)) | (*v3 << *(_DWORD *)(v2 + 88));
  int v16 = (void *)((char *)v3 + (((*(_DWORD *)(v2 + 88) & 0x3Fu) >> 3) ^ 7));
  unsigned int v17 = *(_DWORD *)(v2 + 88) & 7 | 0x38;
  uint64_t v18 = *(void *)(v2 + 104);
  uint64_t v19 = *(void *)(v2 + 112);
  do
  {
    unsigned int v20 = *(_DWORD *)(v18 + 4 * (v15 & v12));
    unint64_t v21 = (*v16 << v17) | v15;
    int v16 = (void *)((char *)v16 + ((63 - v17) >> 3));
    unint64_t v15 = v21 >> v20;
    unsigned int v17 = (v17 | 0x38) - v20;
LABEL_8:
    unsigned int v22 = HIWORD(v20);
    if ((v20 & 0xFF00) == 0)
    {
      *double v4 = BYTE2(v20);
      unsigned int v20 = *(_DWORD *)(v18 + 4 * (v15 & v12));
      unsigned int v22 = HIWORD(v20);
      unint64_t v23 = v15 >> v20;
      v17 -= v20;
      if ((v20 & 0xFF00) == 0)
      {
        v4[1] = BYTE2(v20);
        v4 += 2;
        unsigned int v20 = *(_DWORD *)(v18 + 4 * (v23 & v12));
        unint64_t v15 = v23 >> v20;
        v17 -= v20;
        LODWORD(v21) = v23;
        goto LABEL_11;
      }
      LODWORD(v21) = v15;
      ++v4;
      v15 >>= v20;
    }
    do
    {
      if ((v20 & 0x1000) != 0)
      {
        unsigned int v24 = *(_DWORD *)(v19 + 4 * (v15 & v13));
        if (v17 <= 0x1B)
        {
          v15 |= *v16 << v17;
          int v16 = (void *)((char *)v16 + ((63 - v17) >> 3));
          v17 |= 0x38u;
        }
        unint64_t v25 = v15 >> v24;
        unsigned int v26 = HIWORD(v24);
        unsigned int v27 = v24 >> 8;
        LOWORD(v28) = v24;
        v17 -= v24;
        if ((v24 & 0x1000) == 0)
        {
          while ((v28 & 0x4000) == 0)
          {
            LODWORD(v15) = v25;
            unsigned int v28 = *(_DWORD *)(v19 + 4 * ((v25 & ~(-1 << v27)) + v26));
            v25 >>= v28;
            v17 -= v28;
            unsigned int v26 = HIWORD(v28);
            unsigned int v27 = v28 >> 8;
            if ((v28 & 0x1000) != 0) {
              goto LABEL_18;
            }
          }
          LODWORD(v15) = v25;
          goto LABEL_94;
        }
LABEL_18:
        if (v17 <= 9)
        {
          v25 |= *v16 << v17;
          int v16 = (void *)((char *)v16 + ((63 - v17) >> 3));
          v17 |= 0x38u;
        }
        unsigned int v29 = (v21 << -(char)v20 >> 1 >> (BYTE1(v20) & 0xF ^ 0x1F)) + v22;
        unint64_t v30 = (v15 << -(char)v28 >> 1 >> (v27 & 0xF ^ 0x1F)) + (unint64_t)v26;
        unint64_t v21 = (*v16 << v17) | v25;
        int v16 = (void *)((char *)v16 + ((63 - v17) >> 3));
        unsigned int v20 = *(_DWORD *)(v18 + 4 * (v25 & v12));
        int v31 = v17 | 0x38;
        unint64_t v15 = v21 >> v20;
        unsigned int v17 = (v17 | 0x38) - v20;
        unsigned int v32 = v4 - v8;
        int v33 = v4 - v8 - v30;
        if ((int)v4 - v8 < v30)
        {
          unsigned int v34 = v33 + v10;
          if ((int)(v33 + v10) < 0)
          {
            v34 += v9;
            if ((int)v34 < (int)v10)
            {
              *(void *)(result + 48) = "invalid distance too far back";
              *(_DWORD *)(v2 + 8) = 16209;
              goto LABEL_83;
            }
            unsigned int v35 = v34 + v29;
          }
          else
          {
            unsigned int v35 = v34 + v29;
            if (v34 + v29 > v10) {
              goto LABEL_38;
            }
          }
          if (v32 < 0x10 || (v34 >= 0xF ? (BOOL v36 = v35 > v9) : (BOOL v36 = 1), v36))
          {
LABEL_38:
            while (1)
            {
              *v4++ = *(unsigned char *)(v14 + v34);
              if (!--v29) {
                break;
              }
              if (v34 + 1 == v10) {
                goto LABEL_40;
              }
              if (v34 + 1 == v9) {
                unsigned int v34 = 0;
              }
              else {
                ++v34;
              }
            }
          }
          else
          {
            uint64_t v37 = -v29 & 0xF;
            long long v38 = *((_OWORD *)v4 - 1);
            *(_OWORD *)&v4[-v37] = *(_OWORD *)(v14 + v34 - v37);
            if (v29 >= 0x11)
            {
              unsigned int v39 = &v4[-v37 + 16];
              unint64_t v40 = (long long *)(v14 + 16 + v34 - v37);
              for (unsigned int i = v29; i > 0x10; i -= 16)
              {
                long long v42 = *v40++;
                *(_OWORD *)unsigned int v39 = v42;
                v39 += 16;
              }
            }
            *((_OWORD *)v4 - 1) = v38;
            v4 += v29;
          }
          goto LABEL_47;
        }
LABEL_40:
        if ((int)v30 + 16 > v32)
        {
          for (; v29; --v29)
          {
            *double v4 = v4[-v30];
            ++v4;
          }
LABEL_47:
          if ((unint64_t)v16 > v6 || (unint64_t)v4 > v7)
          {
            LODWORD(v15) = v21;
            unsigned int v17 = v31;
            goto LABEL_83;
          }
          goto LABEL_8;
        }
        unint64_t v43 = &v4[v29];
        if (v30 >= v29 + 15)
        {
          uint64_t v44 = -v29 & 0xF;
          long long v45 = *((_OWORD *)v4 - 1);
          *(_OWORD *)&v4[-v44] = *(_OWORD *)&v4[-v44 - v30];
          if (v29 >= 0x11)
          {
            unint64_t v46 = &v4[-v44 + 16];
            do
            {
              *(_OWORD *)unint64_t v46 = *(_OWORD *)&v46[-v30];
              v46 += 16;
              v29 -= 16;
            }
            while (v29 > 0x10);
          }
          *((_OWORD *)v4 - 1) = v45;
          goto LABEL_46;
        }
        if (v30 <= 0xF)
        {
          int8x16_t v60 = 0uLL;
          int8x16_t v47 = vqtbl1q_s8(*((int8x16_t *)v4 - 1), xmmword_23C2262E0[v30]);
          int8x16_t v60 = v47;
          if (v29 <= 0xF)
          {
            if (v29)
            {
              *v4++ = v47.i8[0];
              unsigned int v48 = (int8x16_t *)&v60.i8[1];
            }
            else
            {
              unsigned int v48 = &v60;
            }
            if ((v29 & 2) != 0)
            {
              __int16 v49 = v48->i16[0];
              unsigned int v48 = (int8x16_t *)((char *)v48 + 2);
              *(_WORD *)double v4 = v49;
              v4 += 2;
            }
            if ((v29 & 4) != 0)
            {
              __int32 v50 = v48->i32[0];
              unsigned int v48 = (int8x16_t *)((char *)v48 + 4);
              *(_DWORD *)double v4 = v50;
              v4 += 4;
            }
            if ((v29 & 8) == 0) {
              goto LABEL_46;
            }
            goto LABEL_77;
          }
          *(int8x16_t *)double v4 = v47;
          v4 += 16;
          v29 -= 16;
          LODWORD(v30) = byte_23C2263E0[v30];
        }
        if (v29 >= 0x10)
        {
          do
          {
            *(_OWORD *)double v4 = *(_OWORD *)&v4[-v30];
            v4 += 16;
            v29 -= 16;
          }
          while (v29 > 0xF);
        }
        unsigned int v48 = (int8x16_t *)&v4[-v30];
        if (v29)
        {
          __int8 v52 = v48->i8[0];
          unsigned int v48 = (int8x16_t *)((char *)v48 + 1);
          *v4++ = v52;
          if ((v29 & 2) == 0)
          {
LABEL_74:
            if ((v29 & 4) == 0) {
              goto LABEL_76;
            }
            goto LABEL_75;
          }
        }
        else if ((v29 & 2) == 0)
        {
          goto LABEL_74;
        }
        __int16 v53 = v48->i16[0];
        unsigned int v48 = (int8x16_t *)((char *)v48 + 2);
        *(_WORD *)double v4 = v53;
        v4 += 2;
        if ((v29 & 4) == 0)
        {
LABEL_76:
          if (v29 < 8)
          {
LABEL_46:
            double v4 = v43;
            goto LABEL_47;
          }
LABEL_77:
          *(void *)double v4 = v48->i64[0];
          goto LABEL_46;
        }
LABEL_75:
        __int32 v51 = v48->i32[0];
        unsigned int v48 = (int8x16_t *)((char *)v48 + 4);
        *(_DWORD *)double v4 = v51;
        v4 += 4;
        goto LABEL_76;
      }
      if ((v20 & 0x4000) != 0)
      {
        if ((v20 & 0x2000) != 0)
        {
          *(_DWORD *)(v2 + 8) = 16191;
          goto LABEL_83;
        }
LABEL_94:
        *(void *)(result + 48) = "invalid literal/length/distance code";
        *(_DWORD *)(v2 + 8) = 16209;
        goto LABEL_83;
      }
      LODWORD(v21) = v15;
      unsigned int v20 = *(_DWORD *)(v18 + 4 * ((v15 & ~(-1 << SBYTE1(v20))) + v22));
      v15 >>= v20;
      v17 -= v20;
LABEL_11:
      unsigned int v22 = HIWORD(v20);
    }
    while ((v20 & 0xFF00) != 0);
    *v4++ = BYTE2(v20);
  }
  while ((unint64_t)v16 <= v6 && (unint64_t)v4 <= v7);
LABEL_83:
  uint64_t v54 = v17 >> 3;
  int v55 = (char *)v16 - v54;
  BOOL v56 = v3 > (void *)((char *)v16 - v54);
  int v57 = (v17 & 7 | (8 * (v3 + ~v16 + v54))) + 8;
  if (!v56) {
    int v57 = v17 & 7;
  }
  *(_DWORD *)(v2 + 88) = v57;
  *(void *)(v2 + 80) = v15 & ~(-1 << v57);
  if (v56) {
    int v58 = v3;
  }
  else {
    int v58 = v55;
  }
  *(void *)int result = v58;
  *(void *)(result + 24) = v4;
  *(_DWORD *)(result + 8) = v59 - v58;
  *(_DWORD *)(result + 32) = v5 - v4;
  return result;
}

uint64_t sub_23C21D310(uint64_t a1, uint64_t a2, uint8x16_t *a3, int a4)
{
  uint64_t v4 = a1 + (a2 << 32);
  if (a4 >= 5552)
  {
    int v5 = a4 - 5552;
    do
    {
      uint8x16_t v6 = *a3;
      uint16x8_t v7 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)0x90A0B0C0D0E0F10), *a3, *(uint8x16_t *)&qword_23C21D480[2]);
      v6.i16[0] = vaddlvq_u8(*a3);
      v7.i32[0] = vaddlvq_u16(v7);
      ++a3;
      uint64_t v8 = (uint64_t)vadd_s32((int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)), vzip1_s32(*(int32x2_t *)v6.i8, *(int32x2_t *)v7.i8));
      int v9 = 173;
      do
      {
        uint8x16_t v10 = *a3;
        uint8x16_t v11 = a3[1];
        uint16x4_t v12 = (uint16x4_t)vshld_n_s64(v8, 0x25uLL);
        int32x2_t v13 = (int32x2_t)(v8 + *(void *)&v12);
        v10.i16[0] = vaddlvq_u8(*a3);
        v12.i16[0] = vaddlvq_u8(v11);
        uint16x8_t v14 = vmlal_high_u8(vmlal_u8(vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)0x191A1B1C1D1E1F20), *a3, *(uint8x16_t *)qword_23C21D480), *(uint8x8_t *)v11.i8, (uint8x8_t)0x90A0B0C0D0E0F10), v11, *(uint8x16_t *)&qword_23C21D480[2]);
        v14.i32[0] = vaddlvq_u16(v14);
        a3 += 2;
        uint64_t v8 = (uint64_t)vadd_s32(v13, vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v10.i8, v12), *(int32x2_t *)v14.i8));
        BOOL v15 = __OFSUB__(v9--, 1);
      }
      while (!((v9 < 0) ^ v15 | (v9 == 0)));
      uint64x2_t v16 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v8, (uint32x2_t)0x800780710000FFF1, 1), 0x2FuLL);
      v16.i32[1] = v16.i32[2];
      uint64_t v4 = (uint64_t)vmls_lane_s32((int32x2_t)v8, *(int32x2_t *)v16.i8, (int32x2_t)0x800780710000FFF1, 0);
      BOOL v15 = __OFSUB__(v5, 5552);
      v5 -= 5552;
    }
    while (v5 < 0 == v15);
    a4 = v5 + 5552;
  }
  BOOL v15 = __OFSUB__(a4, 32);
  for (int i = a4 - 32; i < 0 == v15; i -= 32)
  {
    uint8x16_t v18 = *a3;
    uint8x16_t v19 = a3[1];
    uint16x4_t v20 = (uint16x4_t)vshld_n_s64(v4, 0x25uLL);
    int32x2_t v21 = (int32x2_t)(v4 + *(void *)&v20);
    v18.i16[0] = vaddlvq_u8(*a3);
    v20.i16[0] = vaddlvq_u8(v19);
    uint16x8_t v22 = vmlal_high_u8(vmlal_u8(vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)0x191A1B1C1D1E1F20), *a3, *(uint8x16_t *)qword_23C21D480), *(uint8x8_t *)v19.i8, (uint8x8_t)0x90A0B0C0D0E0F10), v19, *(uint8x16_t *)&qword_23C21D480[2]);
    v22.i32[0] = vaddlvq_u16(v22);
    a3 += 2;
    uint64_t v4 = (uint64_t)vadd_s32(v21, vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v18.i8, v20), *(int32x2_t *)v22.i8));
    BOOL v15 = __OFSUB__(i, 32);
  }
  if ((i & 0x10) != 0)
  {
    uint8x16_t v23 = *a3;
    uint16x8_t v24 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)0x90A0B0C0D0E0F10), *a3, *(uint8x16_t *)&qword_23C21D480[2]);
    v23.i16[0] = vaddlvq_u8(*a3);
    v24.i32[0] = vaddlvq_u16(v24);
    ++a3;
    uint64_t v4 = (uint64_t)vadd_s32((int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)), vzip1_s32(*(int32x2_t *)v23.i8, *(int32x2_t *)v24.i8));
  }
  for (int j = i & 0xF; j; v4 += v26 + vshld_n_s64(v4 + v26, 0x20uLL))
  {
    unsigned int v26 = a3->u8[0];
    a3 = (uint8x16_t *)((char *)a3 + 1);
    --j;
  }
  uint64x2_t v27 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v4, (uint32x2_t)0x800780710000FFF1, 1), 0x2FuLL);
  v27.i32[1] = v27.i32[2];
  int32x2_t v28 = vmls_lane_s32((int32x2_t)v4, *(int32x2_t *)v27.i8, (int32x2_t)0x800780710000FFF1, 0);
  return (v28.i32[0] + (v28.i32[1] << 16));
}

int deflate(z_streamp strm, int flush)
{
  uint64_t v2 = *(void *)&flush;
  BOOL v4 = sub_23C21ED08(strm);
  int result = -2;
  if (v2 > 5 || v4) {
    return result;
  }
  if (!strm->next_out
    || (state = strm->state, (uInt avail_in = strm->avail_in) != 0) && !strm->next_in
    || (int v8 = *((_DWORD *)state + 2), v2 != 4) && v8 == 666)
  {
    strm->msg = "stream error";
    return result;
  }
  if (!strm->avail_out) {
    goto LABEL_30;
  }
  int v9 = *((_DWORD *)state + 19);
  *((_DWORD *)state + 19) = v2;
  if (*((void *)state + 5))
  {
    sub_23C21EBDC((uint64_t)strm);
    if (!strm->avail_out) {
      goto LABEL_160;
    }
    int v8 = *((_DWORD *)state + 2);
  }
  else if (!avail_in)
  {
    int v11 = v9 <= 4 ? 0 : -9;
    int v12 = v2 <= 4 ? 0 : -9;
    if (v2 != 4 && v12 + 2 * (int)v2 <= v11 + 2 * v9) {
      goto LABEL_30;
    }
  }
  switch(v8)
  {
    case 42:
      if (!*((_DWORD *)state + 12))
      {
        *((_DWORD *)state + 2) = 113;
        goto LABEL_133;
      }
      if (*((int *)state + 50) <= 1)
      {
        int v13 = *((_DWORD *)state + 49);
        if (v13 == 6) {
          int v14 = 128;
        }
        else {
          int v14 = 192;
        }
        if (v13 >= 6) {
          int v15 = v14;
        }
        else {
          int v15 = 64;
        }
        if (v13 >= 2) {
          int v10 = v15;
        }
        else {
          int v10 = 0;
        }
      }
      else
      {
        int v10 = 0;
      }
      unsigned int v16 = v10 | ((*((_DWORD *)state + 21) << 12) - 30720);
      if (*((_DWORD *)state + 43)) {
        v16 |= 0x20u;
      }
      uint64_t v17 = *((void *)state + 2);
      uint64_t v18 = *((void *)state + 5);
      *((void *)state + 5) = v18 + 1;
      *(unsigned char *)(v17 + v18) = BYTE1(v16);
      uint64_t v19 = *((void *)state + 2);
      uint64_t v20 = *((void *)state + 5);
      *((void *)state + 5) = v20 + 1;
      *(unsigned char *)(v19 + v20) = ((v16 % 0x1F) | v16) ^ 0x1F;
      if (*((_DWORD *)state + 43))
      {
        uLong adler = strm->adler;
        uLong v22 = adler >> 16;
        uint64_t v23 = *((void *)state + 2);
        uint64_t v24 = *((void *)state + 5);
        *((void *)state + 5) = v24 + 1;
        *(unsigned char *)(v23 + v24) = BYTE3(adler);
        uint64_t v25 = *((void *)state + 2);
        uint64_t v26 = *((void *)state + 5);
        *((void *)state + 5) = v26 + 1;
        *(unsigned char *)(v25 + v26) = v22;
        uLong v27 = strm->adler;
        uint64_t v28 = *((void *)state + 2);
        uint64_t v29 = *((void *)state + 5);
        *((void *)state + 5) = v29 + 1;
        *(unsigned char *)(v28 + v29) = BYTE1(v27);
        uint64_t v30 = *((void *)state + 2);
        uint64_t v31 = *((void *)state + 5);
        *((void *)state + 5) = v31 + 1;
        *(unsigned char *)(v30 + v31) = v27;
      }
      strm->uLong adler = adler32(0, 0, 0);
      *((_DWORD *)state + 2) = 113;
      sub_23C21EBDC((uint64_t)strm);
      if (*((void *)state + 5)) {
        goto LABEL_160;
      }
      int v8 = *((_DWORD *)state + 2);
      break;
    case 666:
      if (!strm->avail_in) {
        goto LABEL_134;
      }
LABEL_30:
      strm->msg = "buffer error";
      return -5;
    case 57:
      strm->uLong adler = crc32(0, 0, 0);
      uint64_t v32 = *((void *)state + 2);
      uint64_t v33 = *((void *)state + 5);
      *((void *)state + 5) = v33 + 1;
      *(unsigned char *)(v32 + v33) = 31;
      uint64_t v34 = *((void *)state + 2);
      uint64_t v35 = *((void *)state + 5);
      *((void *)state + 5) = v35 + 1;
      *(unsigned char *)(v34 + v35) = -117;
      uint64_t v36 = *((void *)state + 2);
      uint64_t v37 = *((void *)state + 5);
      *((void *)state + 5) = v37 + 1;
      *(unsigned char *)(v36 + v37) = 8;
      uint64_t v38 = *((void *)state + 7);
      if (v38)
      {
        char v39 = (*(_DWORD *)v38 != 0) | (2 * (*(_DWORD *)(v38 + 68) != 0)) | (4 * (*(void *)(v38 + 24) != 0)) | (8 * (*(void *)(v38 + 40) != 0)) | (16 * (*(void *)(v38 + 56) != 0));
        uint64_t v40 = *((void *)state + 2);
        uint64_t v41 = *((void *)state + 5);
        *((void *)state + 5) = v41 + 1;
        *(unsigned char *)(v40 + v41) = v39;
        uint64_t v42 = *(void *)(*((void *)state + 7) + 8);
        uint64_t v43 = *((void *)state + 2);
        uint64_t v44 = *((void *)state + 5);
        *((void *)state + 5) = v44 + 1;
        *(unsigned char *)(v43 + v44) = v42;
        uint64_t v45 = *(void *)(*((void *)state + 7) + 8) >> 8;
        uint64_t v46 = *((void *)state + 2);
        uint64_t v47 = *((void *)state + 5);
        *((void *)state + 5) = v47 + 1;
        *(unsigned char *)(v46 + v47) = v45;
        uint64_t v48 = *(void *)(*((void *)state + 7) + 8) >> 16;
        uint64_t v49 = *((void *)state + 2);
        uint64_t v50 = *((void *)state + 5);
        *((void *)state + 5) = v50 + 1;
        *(unsigned char *)(v49 + v50) = v48;
        uint64_t v51 = *(void *)(*((void *)state + 7) + 8) >> 24;
        uint64_t v52 = *((void *)state + 2);
        uint64_t v53 = *((void *)state + 5);
        *((void *)state + 5) = v53 + 1;
        *(unsigned char *)(v52 + v53) = v51;
        int v54 = *((_DWORD *)state + 49);
        if (v54 == 9)
        {
          char v55 = 2;
        }
        else if (*((int *)state + 50) > 1 || v54 < 2)
        {
          char v55 = 4;
        }
        else
        {
          char v55 = 0;
        }
        uint64_t v69 = *((void *)state + 2);
        uint64_t v70 = *((void *)state + 5);
        *((void *)state + 5) = v70 + 1;
        *(unsigned char *)(v69 + v70) = v55;
        char v71 = *(_DWORD *)(*((void *)state + 7) + 20);
        uint64_t v72 = *((void *)state + 2);
        uint64_t v73 = *((void *)state + 5);
        *((void *)state + 5) = v73 + 1;
        *(unsigned char *)(v72 + v73) = v71;
        uint64_t v74 = *((void *)state + 7);
        if (*(void *)(v74 + 24))
        {
          char v75 = *(_DWORD *)(v74 + 32);
          uint64_t v76 = *((void *)state + 2);
          uint64_t v77 = *((void *)state + 5);
          *((void *)state + 5) = v77 + 1;
          *(unsigned char *)(v76 + v77) = v75;
          int v78 = *(_DWORD *)(*((void *)state + 7) + 32) >> 8;
          uint64_t v79 = *((void *)state + 2);
          uint64_t v80 = *((void *)state + 5);
          *((void *)state + 5) = v80 + 1;
          *(unsigned char *)(v79 + v80) = v78;
          uint64_t v74 = *((void *)state + 7);
        }
        if (*(_DWORD *)(v74 + 68)) {
          strm->uLong adler = crc32(strm->adler, *((const Bytef **)state + 2), *((_DWORD *)state + 10));
        }
        *((void *)state + 8) = 0;
        *((_DWORD *)state + 2) = 69;
        goto LABEL_76;
      }
      uint64_t v56 = *((void *)state + 2);
      uint64_t v57 = *((void *)state + 5);
      *((void *)state + 5) = v57 + 1;
      *(unsigned char *)(v56 + v57) = 0;
      uint64_t v58 = *((void *)state + 2);
      uint64_t v59 = *((void *)state + 5);
      *((void *)state + 5) = v59 + 1;
      *(unsigned char *)(v58 + v59) = 0;
      uint64_t v60 = *((void *)state + 2);
      uint64_t v61 = *((void *)state + 5);
      *((void *)state + 5) = v61 + 1;
      *(unsigned char *)(v60 + v61) = 0;
      uint64_t v62 = *((void *)state + 2);
      uint64_t v63 = *((void *)state + 5);
      *((void *)state + 5) = v63 + 1;
      *(unsigned char *)(v62 + v63) = 0;
      uint64_t v64 = *((void *)state + 2);
      uint64_t v65 = *((void *)state + 5);
      *((void *)state + 5) = v65 + 1;
      *(unsigned char *)(v64 + v65) = 0;
      int v66 = *((_DWORD *)state + 49);
      if (v66 == 9)
      {
        char v67 = 2;
      }
      else if (*((int *)state + 50) > 1 || v66 < 2)
      {
        char v67 = 4;
      }
      else
      {
        char v67 = 0;
      }
      uint64_t v82 = *((void *)state + 2);
      uint64_t v83 = *((void *)state + 5);
      *((void *)state + 5) = v83 + 1;
      *(unsigned char *)(v82 + v83) = v67;
      uint64_t v84 = *((void *)state + 2);
      uint64_t v85 = *((void *)state + 5);
      *((void *)state + 5) = v85 + 1;
      *(unsigned char *)(v84 + v85) = 19;
      *((_DWORD *)state + 2) = 113;
      sub_23C21EBDC((uint64_t)strm);
      if (*((void *)state + 5)) {
        goto LABEL_160;
      }
      int v8 = *((_DWORD *)state + 2);
      break;
  }
  if (v8 <= 90)
  {
    if (v8 != 69)
    {
      if (v8 != 73) {
        goto LABEL_133;
      }
      goto LABEL_92;
    }
LABEL_76:
    uint64_t v86 = *((void *)state + 7);
    uint64_t v87 = *(void *)(v86 + 24);
    if (v87)
    {
      unint64_t v88 = *((void *)state + 5);
      int v89 = *(unsigned __int16 *)(v86 + 32);
      uint64_t v90 = *((void *)state + 8);
      size_t v91 = (v89 - v90);
      size_t v92 = *((void *)state + 3);
      if (v88 + v91 > v92)
      {
        while (1)
        {
          int v93 = v92 - v88;
          size_t v94 = (v92 - v88);
          memcpy((void *)(*((void *)state + 2) + v88), (const void *)(*(void *)(*((void *)state + 7) + 24) + *((void *)state + 8)), v94);
          unint64_t v95 = *((void *)state + 3);
          *((void *)state + 5) = v95;
          if (*(_DWORD *)(*((void *)state + 7) + 68)) {
            BOOL v96 = v95 > v88;
          }
          else {
            BOOL v96 = 0;
          }
          if (v96) {
            strm->uLong adler = crc32(strm->adler, (const Bytef *)(*((void *)state + 2) + v88), (int)v95 - (int)v88);
          }
          *((void *)state + 8) += v94;
          sub_23C21EBDC((uint64_t)strm);
          if (*((void *)state + 5)) {
            goto LABEL_160;
          }
          unint64_t v88 = 0;
          size_t v91 = (v91 - v93);
          size_t v92 = *((void *)state + 3);
          if (v92 >= v91)
          {
            unint64_t v88 = 0;
            uint64_t v90 = *((void *)state + 8);
            uint64_t v87 = *(void *)(*((void *)state + 7) + 24);
            break;
          }
        }
      }
      memcpy((void *)(*((void *)state + 2) + v88), (const void *)(v87 + v90), v91);
      size_t v97 = *((void *)state + 5) + v91;
      *((void *)state + 5) = v97;
      if (*(_DWORD *)(*((void *)state + 7) + 68) && v97 > v88) {
        strm->uLong adler = crc32(strm->adler, (const Bytef *)(*((void *)state + 2) + v88), (int)v97 - (int)v88);
      }
      *((void *)state + 8) = 0;
    }
    *((_DWORD *)state + 2) = 73;
LABEL_92:
    if (*(void *)(*((void *)state + 7) + 40))
    {
      unint64_t v98 = *((void *)state + 5);
      do
      {
        unint64_t v99 = *((void *)state + 5);
        uint64_t v100 = *((void *)state + 7);
        if (v99 == *((void *)state + 3))
        {
          if (*(_DWORD *)(v100 + 68)) {
            BOOL v101 = v99 > v98;
          }
          else {
            BOOL v101 = 0;
          }
          if (v101) {
            strm->uLong adler = crc32(strm->adler, (const Bytef *)(*((void *)state + 2) + v98), (int)v99 - (int)v98);
          }
          sub_23C21EBDC((uint64_t)strm);
          unint64_t v98 = *((void *)state + 5);
          if (v98) {
            goto LABEL_160;
          }
          unint64_t v99 = 0;
          uint64_t v100 = *((void *)state + 7);
        }
        uint64_t v102 = *(void *)(v100 + 40);
        uint64_t v103 = *((void *)state + 8);
        *((void *)state + 8) = v103 + 1;
        LODWORD(v102) = *(unsigned __int8 *)(v102 + v103);
        uint64_t v104 = *((void *)state + 2);
        *((void *)state + 5) = v99 + 1;
        *(unsigned char *)(v104 + v99) = v102;
      }
      while (v102);
      if (*(_DWORD *)(*((void *)state + 7) + 68))
      {
        unint64_t v105 = *((void *)state + 5);
        if (v105 > v98) {
          strm->uLong adler = crc32(strm->adler, (const Bytef *)(*((void *)state + 2) + v98), (int)v105 - (int)v98);
        }
      }
      *((void *)state + 8) = 0;
    }
    *((_DWORD *)state + 2) = 91;
    goto LABEL_112;
  }
  if (v8 != 91)
  {
    if (v8 != 103) {
      goto LABEL_133;
    }
    goto LABEL_128;
  }
LABEL_112:
  if (*(void *)(*((void *)state + 7) + 56))
  {
    unint64_t v106 = *((void *)state + 5);
    do
    {
      unint64_t v107 = *((void *)state + 5);
      uint64_t v108 = *((void *)state + 7);
      if (v107 == *((void *)state + 3))
      {
        if (*(_DWORD *)(v108 + 68)) {
          BOOL v109 = v107 > v106;
        }
        else {
          BOOL v109 = 0;
        }
        if (v109) {
          strm->uLong adler = crc32(strm->adler, (const Bytef *)(*((void *)state + 2) + v106), (int)v107 - (int)v106);
        }
        sub_23C21EBDC((uint64_t)strm);
        unint64_t v106 = *((void *)state + 5);
        if (v106) {
          goto LABEL_160;
        }
        unint64_t v107 = 0;
        uint64_t v108 = *((void *)state + 7);
      }
      uint64_t v110 = *(void *)(v108 + 56);
      uint64_t v111 = *((void *)state + 8);
      *((void *)state + 8) = v111 + 1;
      LODWORD(v110) = *(unsigned __int8 *)(v110 + v111);
      uint64_t v112 = *((void *)state + 2);
      *((void *)state + 5) = v107 + 1;
      *(unsigned char *)(v112 + v107) = v110;
    }
    while (v110);
    if (*(_DWORD *)(*((void *)state + 7) + 68))
    {
      unint64_t v113 = *((void *)state + 5);
      if (v113 > v106) {
        strm->uLong adler = crc32(strm->adler, (const Bytef *)(*((void *)state + 2) + v106), (int)v113 - (int)v106);
      }
    }
  }
  *((_DWORD *)state + 2) = 103;
LABEL_128:
  if (*(_DWORD *)(*((void *)state + 7) + 68))
  {
    uint64_t v114 = *((void *)state + 5);
    if ((unint64_t)(v114 + 2) > *((void *)state + 3))
    {
      sub_23C21EBDC((uint64_t)strm);
      uint64_t v114 = *((void *)state + 5);
      if (v114) {
        goto LABEL_160;
      }
    }
    uLong v115 = strm->adler;
    uint64_t v116 = *((void *)state + 2);
    *((void *)state + 5) = v114 + 1;
    *(unsigned char *)(v116 + v114) = v115;
    uLong v117 = strm->adler >> 8;
    uint64_t v118 = *((void *)state + 2);
    uint64_t v119 = *((void *)state + 5);
    *((void *)state + 5) = v119 + 1;
    *(unsigned char *)(v118 + v119) = v117;
    strm->uLong adler = crc32(0, 0, 0);
  }
  *((_DWORD *)state + 2) = 113;
  sub_23C21EBDC((uint64_t)strm);
  if (*((void *)state + 5))
  {
LABEL_160:
    int result = 0;
    *((_DWORD *)state + 19) = -1;
    return result;
  }
LABEL_133:
  if (strm->avail_in) {
    goto LABEL_135;
  }
LABEL_134:
  if (*((_DWORD *)state + 45)) {
    goto LABEL_135;
  }
  if (!v2) {
    return 0;
  }
  if (*((_DWORD *)state + 2) != 666)
  {
LABEL_135:
    uint64_t v120 = *((int *)state + 49);
    if (v120)
    {
      int v121 = *((_DWORD *)state + 50);
      if (v121 == 3)
      {
        int v122 = sub_23C222F34((uint64_t)state, v2);
      }
      else if (v121 == 2)
      {
        int v122 = sub_23C222D6C((uint64_t)state, v2);
      }
      else
      {
        int v122 = qword_26EFDF690[2 * v120 + 1](state, v2);
      }
    }
    else
    {
      int v122 = sub_23C2228A0((uint64_t)state, v2);
    }
    if ((v122 & 0xFFFFFFFE) == 2) {
      *((_DWORD *)state + 2) = 666;
    }
    if ((v122 & 0xFFFFFFFD) != 0)
    {
      if (v122 != 1) {
        goto LABEL_158;
      }
      if (v2 != 5)
      {
        if (v2 == 1)
        {
          sub_23C225200((uint64_t)state);
        }
        else
        {
          sub_23C2250BC((uint64_t)state, 0, 0, 0);
          if (v2 == 3)
          {
            char v123 = (char *)*((void *)state + 15);
            size_t v124 = 2 * (*((_DWORD *)state + 33) - 1);
            *(_WORD *)&v123[v124] = 0;
            bzero(v123, v124);
            if (!*((_DWORD *)state + 45))
            {
              *((_DWORD *)state + 43) = 0;
              *((void *)state + 19) = 0;
              *((_DWORD *)state + 1483) = 0;
            }
          }
        }
      }
      sub_23C21EBDC((uint64_t)strm);
      if (strm->avail_out) {
        goto LABEL_158;
      }
      goto LABEL_160;
    }
    if (!strm->avail_out) {
      goto LABEL_160;
    }
    return 0;
  }
LABEL_158:
  if (v2 != 4) {
    return 0;
  }
  int v125 = *((_DWORD *)state + 12);
  if (v125 < 1) {
    return 1;
  }
  uLong v126 = strm->adler;
  if (v125 == 2)
  {
    uint64_t v127 = *((void *)state + 2);
    uint64_t v128 = *((void *)state + 5);
    *((void *)state + 5) = v128 + 1;
    *(unsigned char *)(v127 + v128) = v126;
    uLong v129 = strm->adler >> 8;
    uint64_t v130 = *((void *)state + 2);
    uint64_t v131 = *((void *)state + 5);
    *((void *)state + 5) = v131 + 1;
    *(unsigned char *)(v130 + v131) = v129;
    uLong v132 = strm->adler >> 16;
    uint64_t v133 = *((void *)state + 2);
    uint64_t v134 = *((void *)state + 5);
    *((void *)state + 5) = v134 + 1;
    *(unsigned char *)(v133 + v134) = v132;
    uLong v135 = strm->adler >> 24;
    uint64_t v136 = *((void *)state + 2);
    uint64_t v137 = *((void *)state + 5);
    *((void *)state + 5) = v137 + 1;
    *(unsigned char *)(v136 + v137) = v135;
    uLong total_in = strm->total_in;
    uint64_t v139 = *((void *)state + 2);
    uint64_t v140 = *((void *)state + 5);
    *((void *)state + 5) = v140 + 1;
    *(unsigned char *)(v139 + v140) = total_in;
    uLong v141 = strm->total_in >> 8;
    uint64_t v142 = *((void *)state + 2);
    uint64_t v143 = *((void *)state + 5);
    *((void *)state + 5) = v143 + 1;
    *(unsigned char *)(v142 + v143) = v141;
    uLong v144 = strm->total_in >> 16;
    uint64_t v145 = *((void *)state + 2);
    uint64_t v146 = *((void *)state + 5);
    *((void *)state + 5) = v146 + 1;
    *(unsigned char *)(v145 + v146) = v144;
    uLong v147 = strm->total_in >> 24;
  }
  else
  {
    uLong v148 = v126 >> 16;
    uint64_t v149 = *((void *)state + 2);
    uint64_t v150 = *((void *)state + 5);
    *((void *)state + 5) = v150 + 1;
    *(unsigned char *)(v149 + v150) = BYTE3(v126);
    uint64_t v151 = *((void *)state + 2);
    uint64_t v152 = *((void *)state + 5);
    *((void *)state + 5) = v152 + 1;
    *(unsigned char *)(v151 + v152) = v148;
    uLong v147 = strm->adler;
    uint64_t v153 = *((void *)state + 2);
    uint64_t v154 = *((void *)state + 5);
    *((void *)state + 5) = v154 + 1;
    *(unsigned char *)(v153 + v154) = BYTE1(v147);
  }
  uint64_t v155 = *((void *)state + 2);
  uint64_t v156 = *((void *)state + 5);
  *((void *)state + 5) = v156 + 1;
  *(unsigned char *)(v155 + v156) = v147;
  sub_23C21EBDC((uint64_t)strm);
  int v157 = *((_DWORD *)state + 12);
  if (v157 >= 1) {
    *((_DWORD *)state + 12) = -v157;
  }
  return *((void *)state + 5) == 0;
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  int v4 = -6;
  if (version && stream_size == 112 && *version == 49)
  {
    if (strm)
    {
      strm->msg = 0;
      zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))strm->zalloc;
      if (!zalloc)
      {
        zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))sub_23C21E978;
        strm->zalloc = (alloc_func)sub_23C21E978;
        strm->opaque = 0;
      }
      if (!strm->zfree) {
        strm->zfree = (free_func)sub_23C2214A8;
      }
      uint64_t v8 = zalloc(strm->opaque, 1, 7160);
      if (v8)
      {
        uint64_t v9 = v8;
        strm->state = (internal_state *)v8;
        *(void *)uint64_t v8 = strm;
        *(void *)(v8 + 72) = 0;
        *(_DWORD *)(v8 + 8) = 16180;
        int v4 = inflateReset2(strm, windowBits);
        if (v4)
        {
          ((void (*)(voidpf, uint64_t))strm->zfree)(strm->opaque, v9);
          strm->state = 0;
        }
      }
      else
      {
        return -4;
      }
    }
    else
    {
      return -2;
    }
  }
  return v4;
}

int inflateResetKeep(z_streamp a1)
{
  if (sub_23C21CCF0(a1)) {
    return -2;
  }
  state = a1->state;
  *((void *)state + 5) = 0;
  a1->uLong total_in = 0;
  a1->total_out = 0;
  a1->msg = 0;
  int v4 = *((_DWORD *)state + 4);
  if (v4) {
    a1->uLong adler = v4 & 1;
  }
  int result = 0;
  *((void *)state + 1) = 16180;
  *(void *)((char *)state + 20) = 0xFFFFFFFF00000000;
  *((_DWORD *)state + 7) = 0x8000;
  *((void *)state + 18) = (char *)state + 1368;
  *((void *)state + 13) = (char *)state + 1368;
  *((void *)state + 14) = (char *)state + 1368;
  *((void *)state + 6) = 0;
  *((void *)state + 10) = 0;
  *((_DWORD *)state + 22) = 0;
  *((void *)state + 893) = 0xFFFFFFFF00000001;
  return result;
}

int inflateReset(z_streamp strm)
{
  if (sub_23C21CCF0(strm)) {
    return -2;
  }
  state = strm->state;
  *((void *)state + 8) = 0;
  *((_DWORD *)state + 15) = 0;

  return inflateResetKeep(strm);
}

int inflateReset2(z_streamp strm, int windowBits)
{
  if (sub_23C21CCF0(strm)) {
    return -2;
  }
  state = strm->state;
  unsigned int v6 = (windowBits >> 4) + 5;
  int v7 = windowBits & 0xF;
  if (windowBits >= 0x30) {
    int v7 = windowBits;
  }
  BOOL v8 = windowBits >= 0;
  int v9 = windowBits < 0 ? -windowBits : v7;
  unsigned int v10 = v8 ? v6 : 0;
  if ((v9 - 8) >= 8 && v9) {
    return -2;
  }
  if (*((void *)state + 9) && *((_DWORD *)state + 14) != v9)
  {
    ((void (*)(voidpf))strm->zfree)(strm->opaque);
    *((void *)state + 9) = 0;
  }
  *((_DWORD *)state + 4) = v10;
  *((_DWORD *)state + 14) = v9;

  return inflateReset(strm);
}

unint64_t sub_23C21E2D0(__int32 a1, int8x16_t *a2, int a3, int8x16_t a4, double a5, int8x16_t a6, int8x16_t a7)
{
  int8x16_t v7 = veorq_s8(a4, a4);
  int8x16_t v9 = *a2;
  BOOL v8 = a2 + 1;
  v7.i32[0] = a1;
  uint64x2_t v10 = (uint64x2_t)veorq_s8(v7, v9);
  BOOL v11 = __OFSUB__(a3, 16);
  int v12 = a3 - 16;
  if (!((v12 < 0) ^ v11 | (v12 == 0)))
  {
    if (v12 >= 48)
    {
      int8x16_t v13 = *v8;
      a6 = v8[1];
      a7 = v8[2];
      v8 += 3;
      BOOL v11 = __OFSUB__(v12, 112);
      int v14 = v12 - 112;
      if (v14 < 0 == v11)
      {
        do
        {
          int8x16_t v16 = *v8;
          int8x16_t v17 = v8[1];
          int v15 = v8 + 2;
          uint64x2_t v10 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v10, qword_23C2289A0), veorq_s8((int8x16_t)vmull_p64(v10.u64[0], 0x154442BD4uLL), v16));
          int8x16_t v13 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)v13, qword_23C2289A0), veorq_s8((int8x16_t)vmull_p64(v13.u64[0], 0x154442BD4uLL), v17));
          int8x16_t v18 = *v15;
          int8x16_t v19 = v15[1];
          BOOL v8 = v15 + 2;
          a6 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)a6, qword_23C2289A0), veorq_s8((int8x16_t)vmull_p64(a6.u64[0], 0x154442BD4uLL), v18));
          a7 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)a7, qword_23C2289A0), veorq_s8((int8x16_t)vmull_p64(a7.u64[0], 0x154442BD4uLL), v19));
          BOOL v11 = __OFSUB__(v14, 64);
          v14 -= 64;
        }
        while (!((v14 < 0) ^ v11 | (v14 == 0)));
      }
      uint64x2_t v20 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v10, qword_23C2289B0), veorq_s8((int8x16_t)vmull_p64(v10.u64[0], 0x1751997D0uLL), v13));
      uint64x2_t v21 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v20, qword_23C2289B0), veorq_s8((int8x16_t)vmull_p64(v20.u64[0], 0x1751997D0uLL), a6));
      uint64x2_t v10 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v21, qword_23C2289B0), veorq_s8((int8x16_t)vmull_p64(v21.u64[0], 0x1751997D0uLL), a7));
      int v12 = v14 + 64;
    }
    BOOL v11 = __OFSUB__(v12, 16);
    for (int i = v12 - 16; i < 0 == v11; i -= 16)
    {
      int8x16_t v23 = *v8++;
      uint64x2_t v10 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v10, qword_23C2289B0), veorq_s8((int8x16_t)vmull_p64(v10.u64[0], 0x1751997D0uLL), v23));
      BOOL v11 = __OFSUB__(i, 16);
    }
  }
  int8x16_t v24 = veorq_s8(a6, a6);
  uint64x2_t v25 = (uint64x2_t)veorq_s8(a7, a7);
  v24.i64[0] = v10.i64[1];
  int8x16_t v26 = veorq_s8(v24, (int8x16_t)vmull_p64(v10.u64[0], 0xCCAA009EuLL));
  v25.i32[2] = v26.i32[0];
  v26.i64[0] = *(uint64_t *)((char *)v26.i64 + 4);
  int8x16_t v27 = veorq_s8((int8x16_t)vmull_high_p64(v25, qword_23C2289C0), v26);
  v25.i32[0] = v27.i32[0];
  v25.i32[2] = vmull_p64(v25.u64[0], 0x1F7011641uLL).u32[0];
  return HIDWORD(veorq_s8((int8x16_t)vmull_high_p64(v25, qword_23C2289D0), v27).u64[0]);
}

uint64_t sub_23C21E410(uint64_t a1, char *__dst, unint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = a3;
    if (!*(_DWORD *)(a1 + 112)
      || (*(_DWORD *)(a1 + 112) = 0, sub_23C225918((unsigned int *)a1, *(void *)(a1 + 104)) != -1))
    {
      uint64_t v6 = 0;
      while (1)
      {
        if (v3 >= 0xFFFFFFFF) {
          unsigned int v7 = -1;
        }
        else {
          unsigned int v7 = v3;
        }
        unsigned int v11 = v7;
        unsigned int v8 = *(_DWORD *)a1;
        if (*(_DWORD *)a1)
        {
          if (v8 < v7)
          {
            unsigned int v11 = *(_DWORD *)a1;
            unsigned int v7 = v8;
          }
          memcpy(__dst, *(const void **)(a1 + 8), v7);
          *(void *)(a1 + 8) += v7;
          *(_DWORD *)a1 -= v7;
        }
        else
        {
          if (*(_DWORD *)(a1 + 80) && !*(_DWORD *)(a1 + 136))
          {
            *(_DWORD *)(a1 + 84) = 1;
            return v6;
          }
          int v9 = *(_DWORD *)(a1 + 68);
          if (!v9 || v7 < 2 * *(_DWORD *)(a1 + 40))
          {
            if (sub_23C21E988(a1) == -1) {
              return 0;
            }
            goto LABEL_18;
          }
          if (v9 == 1)
          {
            if (sub_23C21E8BC(a1, (uint64_t)__dst, v7, &v11) == -1) {
              return 0;
            }
            unsigned int v7 = v11;
          }
          else
          {
            *(_DWORD *)(a1 + 160) = v7;
            *(void *)(a1 + 152) = __dst;
            if (sub_23C21E588(a1) == -1) {
              return 0;
            }
            unsigned int v7 = *(_DWORD *)a1;
            unsigned int v11 = *(_DWORD *)a1;
            *(_DWORD *)a1 = 0;
          }
        }
        v3 -= v7;
        __dst += v7;
        v6 += v7;
        *(void *)(a1 + 16) += v7;
LABEL_18:
        if (!v3) {
          return v6;
        }
      }
    }
  }
  return 0;
}

uint64_t sub_23C21E588(uint64_t a1)
{
  int v2 = 0;
  unint64_t v3 = (z_stream *)(a1 + 128);
  int v4 = *(_DWORD *)(a1 + 160);
  while (2)
  {
    if (*(_DWORD *)(a1 + 136)) {
      goto LABEL_22;
    }
    uint64_t result = sub_23C21E804(a1);
    if (result == -1) {
      return result;
    }
    if (*(_DWORD *)(a1 + 136))
    {
LABEL_22:
      int v6 = inflate(v3, 0);
      int v2 = v6;
      switch(v6)
      {
        case -4:
          unsigned int v8 = "out of memory";
          uint64_t v9 = a1;
          int v10 = -4;
          break;
        case -3:
          if (*(void *)(a1 + 176)) {
            unsigned int v8 = *(const char **)(a1 + 176);
          }
          else {
            unsigned int v8 = "compressed data error";
          }
          uint64_t v9 = a1;
          int v10 = -3;
          break;
        case -2:
        case 2:
          unsigned int v8 = "internal error: inflate stream corrupt";
          uint64_t v9 = a1;
          int v10 = -2;
          break;
        default:
          int v7 = *(_DWORD *)(a1 + 160);
          if (v6 == 1 || !v7) {
            goto LABEL_18;
          }
          continue;
      }
      sub_23C2214B0(v9, v10, v8);
      return 0xFFFFFFFFLL;
    }
    else
    {
      sub_23C2214B0(a1, -5, "unexpected end of file");
      int v7 = *(_DWORD *)(a1 + 160);
LABEL_18:
      uint64_t v11 = (v4 - v7);
      *(_DWORD *)a1 = v11;
      *(void *)(a1 + 8) = *(void *)(a1 + 152) - v11;
      uint64_t result = 0;
      if (v2 == 1) {
        *(_DWORD *)(a1 + 68) = 0;
      }
    }
    return result;
  }
}

uint64_t sub_23C21E6C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  *(void *)(v2 + 120) = 0x70000000ALL;
  unint64_t v3 = (unsigned int *)(v2 + 120);
  uint64_t v4 = v2 + 1368;
  *(void *)(v2 + 144) = v2 + 1368;
  *(void *)(v2 + 104) = v2 + 1368;
  if (sub_23C21AAA0(1, v2 + 152, *(_DWORD *)(v2 + 132), (char **)(v2 + 144), (unsigned int *)(v2 + 120), (_WORD *)(v2 + 792), 0x5A4u))
  {
LABEL_7:
    int v5 = "invalid literal/lengths set";
LABEL_8:
    *(void *)(a1 + 48) = v5;
    *(_DWORD *)(v2 + 8) = 16209;
    return 1;
  }
  else
  {
    int v5 = "invalid distances set";
    while (1)
    {
      uint64_t v6 = *(void *)(v2 + 144);
      *(void *)(v2 + 112) = v6;
      uint64_t result = sub_23C21AAA0(2, v2 + 152 + 2 * *(unsigned int *)(v2 + 132), *(_DWORD *)(v2 + 136), (char **)(v2 + 144), (unsigned int *)(v2 + 124), (_WORD *)(v2 + 792), (unint64_t)(v2 + 7144 - v6) >> 2);
      if (!result) {
        break;
      }
      if (*v3 <= 9 && *(_DWORD *)(v2 + 124) < 7u) {
        goto LABEL_8;
      }
      *(void *)(v2 + 120) = 0x600000009;
      *(void *)(v2 + 144) = v4;
      *(void *)(v2 + 104) = v4;
      if (sub_23C21AAA0(1, v2 + 152, *(_DWORD *)(v2 + 132), (char **)(v2 + 144), v3, (_WORD *)(v2 + 792), 0x5A4u))goto LABEL_7; {
    }
      }
  }
  return result;
}

uint64_t sub_23C21E804(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 116);
  if (v1) {
    BOOL v2 = v1 == -5;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 80)) {
    return 0;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 136);
  if (v5)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 48);
    int v7 = *(char **)(a1 + 128);
    do
    {
      char v8 = *v7++;
      *v6++ = v8;
      --v5;
    }
    while (v5);
    unsigned int v5 = *(_DWORD *)(a1 + 136);
  }
  unsigned int v9 = 0;
  uint64_t result = sub_23C21E8BC(a1, *(void *)(a1 + 48) + v5, *(_DWORD *)(a1 + 40) - v5, &v9);
  if (result != -1)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 136) += v9;
    *(void *)(a1 + 128) = *(void *)(a1 + 48);
  }
  return result;
}

uint64_t sub_23C21E8BC(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int *a4)
{
  unsigned int v8 = 0;
  *a4 = 0;
  while (1)
  {
    size_t v9 = a3 - v8 >= 0x40000000 ? 0x40000000 : a3 - v8;
    int v10 = read(*(_DWORD *)(a1 + 28), (void *)(a2 + v8), v9);
    if (v10 < 1) {
      break;
    }
    unsigned int v8 = *a4 + v10;
    *a4 = v8;
    if (v8 >= a3) {
      return 0;
    }
  }
  if (v10 < 0)
  {
    int v12 = __error();
    int8x16_t v13 = strerror(*v12);
    uint64_t v11 = 0xFFFFFFFFLL;
    sub_23C2214B0(a1, -1, v13);
  }
  else
  {
    uint64_t v11 = 0;
    *(_DWORD *)(a1 + 80) = 1;
  }
  return v11;
}

void *sub_23C21E978(uint64_t a1, int a2, int a3)
{
  return malloc_type_malloc((a3 * a2), 0xC28A752BuLL);
}

uint64_t sub_23C21E988(uint64_t a1)
{
  while (1)
  {
    int v2 = *(_DWORD *)(a1 + 68);
    if (!v2)
    {
      uint64_t result = sub_23C21EA50(a1);
      if (result == -1) {
        return result;
      }
      if (!*(_DWORD *)(a1 + 68)) {
        return 0;
      }
      goto LABEL_9;
    }
    if (v2 == 2)
    {
      *(_DWORD *)(a1 + 160) = 2 * *(_DWORD *)(a1 + 40);
      *(void *)(a1 + 152) = *(void *)(a1 + 56);
      uint64_t result = sub_23C21E588(a1);
      if (result == -1) {
        return result;
      }
      goto LABEL_9;
    }
    if (v2 == 1) {
      break;
    }
LABEL_9:
    if (*(_DWORD *)a1 || *(_DWORD *)(a1 + 80) && !*(_DWORD *)(a1 + 136)) {
      return 0;
    }
  }
  uint64_t result = sub_23C21E8BC(a1, *(void *)(a1 + 56), 2 * *(_DWORD *)(a1 + 40), (unsigned int *)a1);
  if (result != -1)
  {
    uint64_t result = 0;
    *(void *)(a1 + 8) = *(void *)(a1 + 56);
  }
  return result;
}

uint64_t sub_23C21EA50(uint64_t a1)
{
  int v2 = (z_stream *)(a1 + 128);
  if (*(_DWORD *)(a1 + 40)) {
    goto LABEL_2;
  }
  *(void *)(a1 + 48) = malloc_type_malloc(*(unsigned int *)(a1 + 44), 0xD3B4543EuLL);
  uint64_t v6 = malloc_type_malloc((2 * *(_DWORD *)(a1 + 44)), 0xF80DA7CCuLL);
  *(void *)(a1 + 56) = v6;
  if (*(void *)(a1 + 48)) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    free(v6);
    free(*(void **)(a1 + 48));
LABEL_20:
    sub_23C2214B0(a1, -4, "out of memory");
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 44);
  *(_DWORD *)(a1 + 136) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 192) = 0;
  if (inflateInit2_(v2, 31, "1.2.12", 112))
  {
    free(*(void **)(a1 + 56));
    free(*(void **)(a1 + 48));
    *(_DWORD *)(a1 + 40) = 0;
    goto LABEL_20;
  }
LABEL_2:
  LODWORD(result) = *(_DWORD *)(a1 + 136);
  if (result > 1) {
    goto LABEL_7;
  }
  uint64_t result = sub_23C21E804(a1);
  if (result == -1) {
    return result;
  }
  uint64_t result = *(unsigned int *)(a1 + 136);
  if (!result) {
    return result;
  }
  if (result != 1)
  {
LABEL_7:
    if (*v2->next_in == 31 && v2->next_in[1] == 139)
    {
      inflateReset(v2);
      uint64_t result = 0;
      uint64_t v4 = 0x200000000;
LABEL_11:
      *(void *)(a1 + 64) = v4;
      return result;
    }
  }
  if (*(_DWORD *)(a1 + 64))
  {
    unsigned int v5 = *(void **)(a1 + 56);
    *(void *)(a1 + 8) = v5;
    memcpy(v5, *(const void **)(a1 + 128), result);
    uint64_t result = 0;
    *(_DWORD *)a1 = *(_DWORD *)(a1 + 136);
    *(_DWORD *)(a1 + 136) = 0;
    uint64_t v4 = 0x100000001;
    goto LABEL_11;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 80) = 1;
  *(_DWORD *)a1 = 0;
  return result;
}

uint64_t sub_23C21EBDC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t result = sub_23C21ED04(v2);
  unsigned int v4 = *(_DWORD *)(v2 + 40);
  unsigned int v5 = *(_DWORD *)(a1 + 32);
  if (v5 >= v4) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5;
  }
  if (v6)
  {
    uint64_t result = (uint64_t)memcpy(*(void **)(a1 + 24), *(const void **)(v2 + 32), v6);
    *(void *)(a1 + 24) += v6;
    *(void *)(a1 + 40) += v6;
    *(_DWORD *)(a1 + 32) -= v6;
    uint64_t v7 = *(void *)(v2 + 40) - v6;
    *(void *)(v2 + 32) += v6;
    *(void *)(v2 + 40) = v7;
    if (!v7) {
      *(void *)(v2 + 32) = *(void *)(v2 + 16);
    }
  }
  return result;
}

uint64_t sub_23C21EC74(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 5940);
  if (v1 == 16)
  {
    int v2 = 0;
    char v3 = *(unsigned char *)(result + 5936);
    uint64_t v4 = *(void *)(result + 40);
    *(void *)(result + 40) = v4 + 1;
    *(unsigned char *)(*(void *)(result + 16) + v4) = v3;
    char v5 = *(unsigned char *)(result + 5937);
    uint64_t v6 = *(void *)(result + 16);
    uint64_t v7 = *(void *)(result + 40);
    *(void *)(result + 40) = v7 + 1;
    *(unsigned char *)(v6 + v7) = v5;
    *(_WORD *)(result + 5936) = 0;
  }
  else
  {
    if (v1 < 8) {
      return result;
    }
    char v8 = *(unsigned char *)(result + 5936);
    uint64_t v9 = *(void *)(result + 16);
    uint64_t v10 = *(void *)(result + 40);
    *(void *)(result + 40) = v10 + 1;
    *(unsigned char *)(v9 + v10) = v8;
    *(_WORD *)(result + 5936) = *(unsigned __int8 *)(result + 5937);
    int v2 = *(_DWORD *)(result + 5940) - 8;
  }
  *(_DWORD *)(result + 5940) = v2;
  return result;
}

BOOL sub_23C21ED08(void *a1)
{
  BOOL result = 1;
  if (a1)
  {
    if (a1[8])
    {
      if (a1[9])
      {
        uint64_t v1 = a1[7];
        if (v1)
        {
          if (*(void **)v1 == a1)
          {
            int v3 = *(_DWORD *)(v1 + 8);
            BOOL v4 = (v3 - 57) > 0x38 || ((1 << (v3 - 57)) & 0x100400400011001) == 0;
            if (!v4 || v3 == 666 || v3 == 42) {
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_23C21ED84(uint64_t a1, int a2)
{
  while (*(_DWORD *)(a1 + 180) >= 0x106u)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 160);
    int v6 = *(_DWORD *)(a1 + 176);
LABEL_8:
    unsigned int v8 = *(_DWORD *)(a1 + 172);
    unsigned int v9 = ((*(_DWORD *)(a1 + 128) << *(_DWORD *)(a1 + 144)) ^ *(unsigned __int8 *)(*(void *)(a1 + 96) + v8 + 2)) & *(_DWORD *)(a1 + 140);
    *(_DWORD *)(a1 + 128) = v9;
    uint64_t v10 = *(void *)(a1 + 120);
    unsigned int v11 = *(unsigned __int16 *)(v10 + 2 * v9);
    *(_WORD *)(*(void *)(a1 + 112) + 2 * (*(_DWORD *)(a1 + 88) & v8)) = v11;
    *(_WORD *)(v10 + 2 * v9) = v8;
    *(_DWORD *)(a1 + 184) = v5;
    unsigned int v7 = 2;
    *(_DWORD *)(a1 + 160) = 2;
    *(_DWORD *)(a1 + 164) = v6;
    if (!v11) {
      goto LABEL_17;
    }
    if (v5 < *(_DWORD *)(a1 + 192) && v8 - v11 <= *(_DWORD *)(a1 + 80) - 262)
    {
      unsigned int v7 = sub_23C21F27C(a1, v11);
      *(_DWORD *)(a1 + 160) = v7;
      if (v7 <= 5)
      {
        if (*(_DWORD *)(a1 + 200) == 1) {
          goto LABEL_15;
        }
        if (v7 == 3)
        {
          if ((*(_DWORD *)(a1 + 172) - *(_DWORD *)(a1 + 176)) <= 0x1000)
          {
            unsigned int v7 = 3;
            goto LABEL_16;
          }
LABEL_15:
          unsigned int v7 = 2;
          *(_DWORD *)(a1 + 160) = 2;
        }
      }
    }
LABEL_16:
    unsigned int v5 = *(_DWORD *)(a1 + 184);
LABEL_17:
    unsigned __int8 v12 = v5 - 3;
    if (v5 < 3 || v7 > v5)
    {
      if (*(_DWORD *)(a1 + 168))
      {
        uint64_t v33 = *(unsigned __int8 *)(*(void *)(a1 + 96) + (*(_DWORD *)(a1 + 172) - 1));
        uint64_t v34 = *(void *)(a1 + 5888);
        uint64_t v35 = *(unsigned int *)(a1 + 5900);
        *(_DWORD *)(a1 + 5900) = v35 + 1;
        *(unsigned char *)(v34 + v35) = 0;
        uint64_t v36 = *(void *)(a1 + 5888);
        uint64_t v37 = *(unsigned int *)(a1 + 5900);
        *(_DWORD *)(a1 + 5900) = v37 + 1;
        *(unsigned char *)(v36 + v37) = 0;
        uint64_t v38 = *(void *)(a1 + 5888);
        uint64_t v39 = *(unsigned int *)(a1 + 5900);
        *(_DWORD *)(a1 + 5900) = v39 + 1;
        *(unsigned char *)(v38 + v39) = v33;
        ++*(_WORD *)(a1 + 4 * v33 + 212);
        if (*(_DWORD *)(a1 + 5900) == *(_DWORD *)(a1 + 5904))
        {
          uint64_t v40 = *(void *)(a1 + 152);
          if (v40 < 0) {
            uint64_t v41 = 0;
          }
          else {
            uint64_t v41 = (const void *)(*(void *)(a1 + 96) + v40);
          }
          sub_23C21F7CC((int *)a1, v41, *(unsigned int *)(a1 + 172) - v40, 0);
          *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
          sub_23C21EBDC(*(void *)a1);
        }
        ++*(_DWORD *)(a1 + 172);
        --*(_DWORD *)(a1 + 180);
        goto LABEL_38;
      }
      int v42 = *(_DWORD *)(a1 + 172) + 1;
      *(_DWORD *)(a1 + 168) = 1;
      *(_DWORD *)(a1 + 172) = v42;
      --*(_DWORD *)(a1 + 180);
    }
    else
    {
      int v13 = *(_DWORD *)(a1 + 172);
      unsigned int v14 = v13 + *(_DWORD *)(a1 + 180) - 3;
      int v15 = v13 + ~*(_DWORD *)(a1 + 164);
      uint64_t v16 = *(void *)(a1 + 5888);
      uint64_t v17 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v17 + 1;
      *(unsigned char *)(v16 + v17) = v15;
      uint64_t v18 = *(void *)(a1 + 5888);
      uint64_t v19 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v19 + 1;
      *(unsigned char *)(v18 + v19) = BYTE1(v15);
      uint64_t v20 = *(void *)(a1 + 5888);
      uint64_t v21 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v21 + 1;
      *(unsigned char *)(v20 + v21) = v12;
      unsigned __int16 v22 = v15 - 1;
      uint64_t v23 = a1 + 4 * byte_23C228170[v12];
      ++*(_WORD *)(v23 + 1240);
      unsigned __int16 v24 = (v22 >> 7) + 256;
      if ((v22 & 0xFF00) == 0) {
        unsigned __int16 v24 = v22;
      }
      uint64_t v28 = a1 + 4 * byte_23C227F70[v24];
      ++*(_WORD *)(v28 + 2504);
      int v25 = *(_DWORD *)(a1 + 5900);
      int v26 = *(_DWORD *)(a1 + 5904);
      LODWORD(v28) = *(_DWORD *)(a1 + 184);
      *(_DWORD *)(a1 + 180) = *(_DWORD *)(a1 + 180) - v28 + 1;
      *(_DWORD *)(a1 + 184) = v28 - 2;
      int v27 = v28 - 3;
      LODWORD(v28) = *(_DWORD *)(a1 + 172) + 1;
      do
      {
        *(_DWORD *)(a1 + 172) = v28;
        if (v28 <= v14)
        {
          unsigned int v29 = ((*(_DWORD *)(a1 + 128) << *(_DWORD *)(a1 + 144)) ^ *(unsigned __int8 *)(*(void *)(a1 + 96)
                                                                                       + (v28 + 2))) & *(_DWORD *)(a1 + 140);
          *(_DWORD *)(a1 + 128) = v29;
          uint64_t v30 = *(void *)(a1 + 120);
          *(_WORD *)(*(void *)(a1 + 112) + 2 * (*(_DWORD *)(a1 + 88) & v28)) = *(_WORD *)(v30 + 2 * v29);
          *(_WORD *)(v30 + 2 * v29) = v28;
        }
        *(_DWORD *)(a1 + 184) = v27--;
        uint64_t v28 = (v28 + 1);
      }
      while (v27 != -1);
      *(_DWORD *)(a1 + 160) = 2;
      *(_DWORD *)(a1 + 168) = 0;
      *(_DWORD *)(a1 + 172) = v28;
      if (v25 == v26)
      {
        uint64_t v31 = *(void *)(a1 + 152);
        if (v31 < 0) {
          uint64_t v32 = 0;
        }
        else {
          uint64_t v32 = (const void *)(*(void *)(a1 + 96) + v31);
        }
        sub_23C21F7CC((int *)a1, v32, v28 - v31, 0);
        *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
        sub_23C21EBDC(*(void *)a1);
LABEL_38:
        if (!*(_DWORD *)(*(void *)a1 + 32)) {
          return 0;
        }
      }
    }
  }
  sub_23C21F478(a1);
  unsigned int v4 = *(_DWORD *)(a1 + 180);
  if (!a2 && v4 < 0x106) {
    return 0;
  }
  if (v4)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 160);
    int v6 = *(_DWORD *)(a1 + 176);
    if (v4 <= 2)
    {
      *(_DWORD *)(a1 + 184) = v5;
      unsigned int v7 = 2;
      *(_DWORD *)(a1 + 160) = 2;
      *(_DWORD *)(a1 + 164) = v6;
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 168))
  {
    uint64_t v43 = *(unsigned __int8 *)(*(void *)(a1 + 96) + (*(_DWORD *)(a1 + 172) - 1));
    uint64_t v44 = *(void *)(a1 + 5888);
    uint64_t v45 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v45 + 1;
    *(unsigned char *)(v44 + v45) = 0;
    uint64_t v46 = *(void *)(a1 + 5888);
    uint64_t v47 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v47 + 1;
    *(unsigned char *)(v46 + v47) = 0;
    uint64_t v48 = *(void *)(a1 + 5888);
    uint64_t v49 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v49 + 1;
    *(unsigned char *)(v48 + v49) = v43;
    ++*(_WORD *)(a1 + 4 * v43 + 212);
    *(_DWORD *)(a1 + 168) = 0;
  }
  uint64_t v50 = *(unsigned int *)(a1 + 172);
  if (v50 >= 2) {
    int v51 = 2;
  }
  else {
    int v51 = *(_DWORD *)(a1 + 172);
  }
  *(_DWORD *)(a1 + 5932) = v51;
  if (a2 != 4)
  {
    if (!*(_DWORD *)(a1 + 5900)) {
      return 1;
    }
    uint64_t v54 = *(void *)(a1 + 152);
    char v55 = v54 < 0 ? 0 : (const void *)(*(void *)(a1 + 96) + v54);
    sub_23C21F7CC((int *)a1, v55, v50 - v54, 0);
    *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
    sub_23C21EBDC(*(void *)a1);
    return *(_DWORD *)(*(void *)a1 + 32) != 0;
  }
  uint64_t v52 = *(void *)(a1 + 152);
  if (v52 < 0) {
    uint64_t v53 = 0;
  }
  else {
    uint64_t v53 = (const void *)(*(void *)(a1 + 96) + v52);
  }
  sub_23C21F7CC((int *)a1, v53, v50 - v52, 1);
  *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
  sub_23C21EBDC(*(void *)a1);
  if (*(_DWORD *)(*(void *)a1 + 32)) {
    return 3;
  }
  else {
    return 2;
  }
}

uint64_t sub_23C21F27C(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 188);
  uint64_t v3 = *(int *)(a1 + 184);
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v5 = *(unsigned int *)(a1 + 172);
  int v6 = (unsigned __int8 *)(v4 + v5);
  unsigned int v7 = *(_DWORD *)(a1 + 80) - 262;
  BOOL v8 = v5 >= v7;
  unsigned int v9 = v5 - v7;
  if (!v8) {
    unsigned int v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 112);
  unsigned int v11 = *(_DWORD *)(a1 + 88);
  unsigned int v12 = *(_DWORD *)(a1 + 180);
  int v13 = v6[v3 - 1];
  int v14 = v6[v3];
  unsigned int v15 = *(_DWORD *)(a1 + 208);
  if (v3 >= *(_DWORD *)(a1 + 204)) {
    v2 >>= 2;
  }
  if (v15 >= v12) {
    unsigned int v15 = *(_DWORD *)(a1 + 180);
  }
  while (1)
  {
    uint64_t v16 = (unsigned __int8 *)(v4 + a2);
    if (v16[(int)v3] != v14 || v16[(int)v3 - 1] != v13 || *v16 != *v6 || v16[1] != v6[1]) {
      goto LABEL_32;
    }
    uint64_t v17 = 0;
    while (1)
    {
      uint64_t v18 = &v6[v17];
      if (v6[v17 + 3] != v16[v17 + 3])
      {
        int v24 = v18 + 3;
        goto LABEL_29;
      }
      if (v18[4] != v16[v17 + 4])
      {
        int v24 = v6 + v17 + 4;
        goto LABEL_29;
      }
      uint64_t v19 = &v6[v17];
      if (v6[v17 + 5] != v16[v17 + 5])
      {
        int v24 = v19 + 5;
        goto LABEL_29;
      }
      if (v19[6] != v16[v17 + 6])
      {
        int v24 = v6 + v17 + 6;
        goto LABEL_29;
      }
      uint64_t v20 = &v6[v17];
      if (v6[v17 + 7] != v16[v17 + 7])
      {
        int v24 = v20 + 7;
        goto LABEL_29;
      }
      if (v20[8] != v16[v17 + 8])
      {
        int v24 = v6 + v17 + 8;
        goto LABEL_29;
      }
      uint64_t v21 = &v6[v17];
      unsigned __int16 v22 = &v16[v17];
      if (v6[v17 + 9] != v16[v17 + 9]) {
        break;
      }
      unint64_t v23 = v17 + 2;
      v17 += 8;
      if (v23 > 0xF9 || v21[10] != v22[10])
      {
        int v24 = v6 + v17 + 2;
        goto LABEL_29;
      }
    }
    int v24 = v21 + 9;
LABEL_29:
    int v25 = v24 - (v6 + 258);
    int v26 = v24 - v6;
    if (v26 <= (int)v3) {
      goto LABEL_32;
    }
    *(_DWORD *)(a1 + 176) = a2;
    if (v26 >= (int)v15) {
      break;
    }
    int v13 = v6[v25 + 257];
    int v14 = v6[v26];
    LODWORD(v3) = v26;
LABEL_32:
    a2 = *(unsigned __int16 *)(v10 + 2 * (a2 & v11));
    --v2;
    if (v9 >= a2 || v2 == 0) {
      goto LABEL_37;
    }
  }
  LODWORD(v3) = v26;
LABEL_37:
  if (v3 >= v12) {
    return v12;
  }
  else {
    return v3;
  }
}

void sub_23C21F478(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 80);
  unsigned int v3 = *(_DWORD *)(a1 + 180);
  int32x2_t v4 = vdup_n_s32(v2);
  do
  {
    unsigned int v5 = *(_DWORD *)(a1 + 172);
    unsigned int v6 = *(_DWORD *)(a1 + 104) - (v3 + v5);
    if (v5 >= (int)v2 - 262 + *(_DWORD *)(a1 + 80))
    {
      memcpy(*(void **)(a1 + 96), (const void *)(*(void *)(a1 + 96) + v2), v2 - v6);
      int32x2_t v7 = vsub_s32(*(int32x2_t *)(a1 + 172), v4);
      *(int32x2_t *)(a1 + 172) = v7;
      *(void *)(a1 + 152) -= v2;
      unsigned int v5 = v7.i32[0];
      if (*(_DWORD *)(a1 + 5932) > v7.i32[0]) {
        *(_DWORD *)(a1 + 5932) = v7.i32[0];
      }
      uint64_t v8 = *(unsigned int *)(a1 + 80);
      uint64_t v9 = *(unsigned int *)(a1 + 132);
      uint64_t v10 = (_WORD *)(*(void *)(a1 + 120) + 2 * v9 - 2);
      do
      {
        unsigned int v11 = (unsigned __int16)*v10;
        BOOL v12 = v11 >= v8;
        __int16 v13 = v11 - v8;
        if (!v12) {
          __int16 v13 = 0;
        }
        *v10-- = v13;
        LODWORD(v9) = v9 - 1;
      }
      while (v9);
      int v14 = (_WORD *)(*(void *)(a1 + 112) + 2 * v8 - 2);
      int v15 = v8;
      do
      {
        unsigned int v16 = (unsigned __int16)*v14;
        BOOL v12 = v16 >= v8;
        __int16 v17 = v16 - v8;
        if (!v12) {
          __int16 v17 = 0;
        }
        *v14-- = v17;
        --v15;
      }
      while (v15);
      v6 += v2;
    }
    if (!*(_DWORD *)(*(void *)a1 + 8)) {
      break;
    }
    unsigned int v3 = *(_DWORD *)(a1 + 180)
       + sub_23C21F6B8(*(void *)a1, (void *)(*(void *)(a1 + 96) + v5 + *(unsigned int *)(a1 + 180)), v6);
    *(_DWORD *)(a1 + 180) = v3;
    int v18 = *(_DWORD *)(a1 + 5932);
    if (v18 + v3 >= 3)
    {
      unsigned int v19 = *(_DWORD *)(a1 + 172) - v18;
      uint64_t v20 = *(void *)(a1 + 96);
      int v21 = *(unsigned __int8 *)(v20 + v19);
      *(_DWORD *)(a1 + 128) = v21;
      int v23 = *(_DWORD *)(a1 + 140);
      int v22 = *(_DWORD *)(a1 + 144);
      unsigned int v24 = ((v21 << v22) ^ *(unsigned __int8 *)(v20 + v19 + 1)) & v23;
      *(_DWORD *)(a1 + 128) = v24;
      do
      {
        if (!v18) {
          break;
        }
        unsigned int v24 = ((v24 << v22) ^ *(unsigned __int8 *)(v20 + v19 + 2)) & v23;
        uint64_t v25 = *(void *)(a1 + 120);
        *(_WORD *)(*(void *)(a1 + 112) + 2 * (*(_DWORD *)(a1 + 88) & v19)) = *(_WORD *)(v25 + 2 * v24);
        *(_WORD *)(v25 + 2 * v24) = v19;
        *(_DWORD *)(a1 + 128) = v24;
        ++v19;
        *(_DWORD *)(a1 + 5932) = --v18;
      }
      while (v3 + v18 > 2);
    }
  }
  while (v3 <= 0x105 && *(_DWORD *)(*(void *)a1 + 8));
  unint64_t v26 = *(void *)(a1 + 5944);
  unint64_t v27 = *(void *)(a1 + 104);
  if (v27 > v26)
  {
    unint64_t v28 = *(unsigned int *)(a1 + 180) + (unint64_t)*(unsigned int *)(a1 + 172);
    if (v26 >= v28)
    {
      if (v28 + 258 <= v26) {
        return;
      }
      if (v28 + 258 - v26 >= v27 - v26) {
        unint64_t v31 = v27 - v26;
      }
      else {
        unint64_t v31 = v28 + 258 - v26;
      }
      bzero((void *)(*(void *)(a1 + 96) + v26), v31);
      size_t v30 = *(void *)(a1 + 5944) + v31;
    }
    else
    {
      if (v27 - v28 >= 0x102) {
        size_t v29 = 258;
      }
      else {
        size_t v29 = v27 - v28;
      }
      bzero((void *)(*(void *)(a1 + 96) + v28), v29);
      size_t v30 = v29 + v28;
    }
    *(void *)(a1 + 5944) = v30;
  }
}

size_t sub_23C21F6B8(uint64_t a1, void *__dst, unsigned int a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  if (v3 >= a3) {
    size_t v4 = a3;
  }
  else {
    size_t v4 = v3;
  }
  if (v4)
  {
    *(_DWORD *)(a1 + 8) = v3 - v4;
    memcpy(__dst, *(const void **)a1, v4);
    int v7 = *(_DWORD *)(*(void *)(a1 + 56) + 48);
    if (v7 == 2)
    {
      uLong v8 = crc32(*(void *)(a1 + 96), (const Bytef *)__dst, v4);
    }
    else
    {
      if (v7 != 1)
      {
LABEL_10:
        *(void *)a1 += v4;
        *(void *)(a1 + 16) += v4;
        return v4;
      }
      uLong v8 = adler32(*(void *)(a1 + 96), (const Bytef *)__dst, v4);
    }
    *(void *)(a1 + 96) = v8;
    goto LABEL_10;
  }
  return v4;
}

uint64_t sub_23C21F768(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 5940);
  if (v1 >= 9)
  {
    char v2 = *(unsigned char *)(result + 5936);
    uint64_t v3 = *(void *)(result + 16);
    uint64_t v4 = *(void *)(result + 40);
    *(void *)(result + 40) = v4 + 1;
    *(unsigned char *)(v3 + v4) = v2;
    char v5 = *(unsigned char *)(result + 5937);
LABEL_5:
    uint64_t v6 = *(void *)(result + 16);
    uint64_t v7 = *(void *)(result + 40);
    *(void *)(result + 40) = v7 + 1;
    *(unsigned char *)(v6 + v7) = v5;
    goto LABEL_6;
  }
  if (v1 >= 1)
  {
    char v5 = *(unsigned char *)(result + 5936);
    goto LABEL_5;
  }
LABEL_6:
  *(_WORD *)(result + 5936) = 0;
  *(_DWORD *)(result + 5940) = 0;
  return result;
}

void sub_23C21F7CC(int *a1, const void *a2, size_t a3, int a4)
{
  if (a1[49] < 1)
  {
    unsigned int v11 = 0;
    unint64_t v12 = a3 + 5;
    unint64_t v13 = a3 + 5;
    if (!a2) {
      goto LABEL_24;
    }
  }
  else
  {
    if (*(_DWORD *)(*(void *)a1 + 88) == 2)
    {
      uint64_t v8 = 0;
      unint64_t v9 = 4093624447;
      do
      {
        if ((v9 & 1) != 0 && LOWORD(a1[v8 + 53]))
        {
          int v10 = 0;
          goto LABEL_14;
        }
        v9 >>= 1;
        ++v8;
      }
      while (v8 != 32);
      if (!*((_WORD *)a1 + 124) && !*((_WORD *)a1 + 126) && !*((_WORD *)a1 + 132))
      {
        uint64_t v71 = 0;
        uint64_t v72 = a1 + 85;
        while (1)
        {
          int v10 = (unsigned __int16)v72[v71];
          if (v72[v71]) {
            break;
          }
          v71 += 2;
          if (v71 == 448) {
            goto LABEL_14;
          }
        }
      }
      int v10 = 1;
LABEL_14:
      *(_DWORD *)(*(void *)a1 + 88) = v10;
    }
    sub_23C21FD28((uint64_t)a1, (uint64_t)(a1 + 726));
    sub_23C21FD28((uint64_t)a1, (uint64_t)(a1 + 732));
    sub_23C220778(a1, (uint64_t)(a1 + 53), a1[728]);
    sub_23C220778(a1, (uint64_t)(a1 + 626), a1[734]);
    sub_23C21FD28((uint64_t)a1, (uint64_t)(a1 + 738));
    unsigned int v11 = 0x12u;
    while (!HIWORD(a1[byte_23C2288A0[v11] + 687]))
    {
      if (v11-- <= 3)
      {
        unsigned int v11 = 2;
        break;
      }
    }
    uint64_t v15 = *((void *)a1 + 739) + 3 * (int)v11;
    *((void *)a1 + 739) = v15 + 17;
    unint64_t v13 = (unint64_t)(v15 + 27) >> 3;
    unint64_t v12 = (unint64_t)(*((void *)a1 + 740) + 10) >> 3;
    if (v12 < v13) {
      unint64_t v13 = (unint64_t)(*((void *)a1 + 740) + 10) >> 3;
    }
    if (!a2) {
      goto LABEL_24;
    }
  }
  if (a3 + 4 <= v13)
  {
    sub_23C2250BC((uint64_t)a1, a2, a3, a4);
    goto LABEL_50;
  }
LABEL_24:
  int v16 = a1[1485];
  if (v12 == v13 || a1[50] == 4)
  {
    int v25 = a4 + 2;
    if (v16 < 14)
    {
      *((_WORD *)a1 + 2968) |= v25 << v16;
      int v32 = v16 + 3;
    }
    else
    {
      __int16 v26 = *((_WORD *)a1 + 2968) | (v25 << v16);
      *((_WORD *)a1 + 2968) = v26;
      uint64_t v27 = *((void *)a1 + 2);
      uint64_t v28 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v28 + 1;
      *(unsigned char *)(v27 + v28) = v26;
      LOBYTE(v26) = *((unsigned char *)a1 + 5937);
      uint64_t v29 = *((void *)a1 + 2);
      uint64_t v30 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v30 + 1;
      *(unsigned char *)(v29 + v30) = v26;
      int v31 = a1[1485];
      *((_WORD *)a1 + 2968) = (unsigned __int16)(a4 + 2) >> (16 - v31);
      int v32 = v31 - 13;
    }
    a1[1485] = v32;
    uint64_t v44 = &unk_23C228270;
    uint64_t v45 = &unk_23C2286F0;
    uint64_t v46 = (uint64_t)a1;
  }
  else
  {
    int v17 = a4 + 4;
    if (v16 < 14)
    {
      int v23 = *((unsigned __int16 *)a1 + 2968) | (v17 << v16);
      int v24 = v16 + 3;
    }
    else
    {
      __int16 v18 = *((_WORD *)a1 + 2968) | (v17 << v16);
      *((_WORD *)a1 + 2968) = v18;
      uint64_t v19 = *((void *)a1 + 2);
      uint64_t v20 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v20 + 1;
      *(unsigned char *)(v19 + v20) = v18;
      LOBYTE(v18) = *((unsigned char *)a1 + 5937);
      uint64_t v21 = *((void *)a1 + 2);
      uint64_t v22 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v22 + 1;
      *(unsigned char *)(v21 + v22) = v18;
      LODWORD(v21) = a1[1485];
      int v23 = (unsigned __int16)(a4 + 4) >> (16 - v21);
      int v24 = v21 - 13;
    }
    a1[1485] = v24;
    int v33 = a1[728];
    int v34 = a1[734];
    int v35 = v33 + 65280;
    if (v24 < 12)
    {
      int v42 = v23 | (v35 << v24);
      int v43 = v24 + 5;
    }
    else
    {
      __int16 v36 = v23 | (v35 << v24);
      *((_WORD *)a1 + 2968) = v36;
      uint64_t v37 = *((void *)a1 + 2);
      uint64_t v38 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v38 + 1;
      *(unsigned char *)(v37 + v38) = v36;
      LOBYTE(v36) = *((unsigned char *)a1 + 5937);
      uint64_t v39 = *((void *)a1 + 2);
      uint64_t v40 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v40 + 1;
      *(unsigned char *)(v39 + v40) = v36;
      int v41 = a1[1485];
      int v42 = (unsigned __int16)(v33 - 256) >> (16 - v41);
      int v43 = v41 - 11;
    }
    a1[1485] = v43;
    if (v43 < 12)
    {
      int v52 = v42 | (v34 << v43);
      int v53 = v43 + 5;
    }
    else
    {
      __int16 v47 = v42 | (v34 << v43);
      *((_WORD *)a1 + 2968) = v47;
      uint64_t v48 = *((void *)a1 + 2);
      uint64_t v49 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v49 + 1;
      *(unsigned char *)(v48 + v49) = v47;
      LOBYTE(v47) = *((unsigned char *)a1 + 5937);
      uint64_t v50 = *((void *)a1 + 2);
      uint64_t v51 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v51 + 1;
      *(unsigned char *)(v50 + v51) = v47;
      LODWORD(v50) = a1[1485];
      int v52 = (unsigned __int16)v34 >> (16 - v50);
      int v53 = v50 - 11;
    }
    a1[1485] = v53;
    unsigned int v54 = v11 + 65533;
    if (v53 < 13)
    {
      int v60 = v52 | (v54 << v53);
      *((_WORD *)a1 + 2968) = v60;
      int v61 = v53 + 4;
    }
    else
    {
      __int16 v55 = v52 | (v54 << v53);
      *((_WORD *)a1 + 2968) = v55;
      uint64_t v56 = *((void *)a1 + 2);
      uint64_t v57 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v57 + 1;
      *(unsigned char *)(v56 + v57) = v55;
      LOBYTE(v55) = *((unsigned char *)a1 + 5937);
      uint64_t v58 = *((void *)a1 + 2);
      uint64_t v59 = *((void *)a1 + 5);
      *((void *)a1 + 5) = v59 + 1;
      *(unsigned char *)(v58 + v59) = v55;
      LODWORD(v58) = a1[1485];
      int v60 = (unsigned __int16)(v11 - 3) >> (16 - v58);
      *((_WORD *)a1 + 2968) = v60;
      int v61 = v58 - 12;
    }
    a1[1485] = v61;
    if ((v11 & 0x80000000) == 0)
    {
      uint64_t v62 = v11 + 1;
      uint64_t v63 = byte_23C2288A0;
      do
      {
        int v64 = *v63++;
        unsigned int v65 = HIWORD(a1[v64 + 687]);
        v60 |= v65 << v61;
        *((_WORD *)a1 + 2968) = v60;
        if (v61 < 14)
        {
          v61 += 3;
        }
        else
        {
          uint64_t v66 = *((void *)a1 + 2);
          uint64_t v67 = *((void *)a1 + 5);
          *((void *)a1 + 5) = v67 + 1;
          *(unsigned char *)(v66 + v67) = v60;
          char v68 = *((unsigned char *)a1 + 5937);
          uint64_t v69 = *((void *)a1 + 2);
          uint64_t v70 = *((void *)a1 + 5);
          *((void *)a1 + 5) = v70 + 1;
          *(unsigned char *)(v69 + v70) = v68;
          LODWORD(v69) = a1[1485];
          int v60 = v65 >> (16 - v69);
          *((_WORD *)a1 + 2968) = v60;
          int v61 = v69 - 13;
        }
        a1[1485] = v61;
        --v62;
      }
      while (v62);
    }
    sub_23C2202D8((uint64_t)a1, (uint64_t)(a1 + 53), v33);
    sub_23C2202D8((uint64_t)a1, (uint64_t)(a1 + 626), v34);
    uint64_t v46 = (uint64_t)a1;
    uint64_t v44 = a1 + 53;
    uint64_t v45 = a1 + 626;
  }
  sub_23C22086C(v46, (uint64_t)v44, (uint64_t)v45);
LABEL_50:
  sub_23C221D24((uint64_t)a1);
  if (a4)
  {
    sub_23C21F768((uint64_t)a1);
  }
}

uint64_t sub_23C21FD28(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)a2;
  char v5 = *(uint64_t **)(a2 + 16);
  uint64_t v6 = *v5;
  uint64_t v7 = *((unsigned int *)v5 + 5);
  uint64_t v8 = (int *)(a1 + 5300);
  *(void *)(a1 + 5300) = 0x23D00000000;
  if ((int)v7 < 1)
  {
    int v13 = 0;
    int v11 = -1;
  }
  else
  {
    uint64_t v9 = 0;
    int v10 = (_WORD *)(v4 + 2);
    int v11 = -1;
    do
    {
      if (*(v10 - 1))
      {
        uint64_t v12 = *(int *)(a1 + 5300) + 1;
        *(_DWORD *)(a1 + 5300) = v12;
        *(_DWORD *)(a1 + 4 * v12 + 3008) = v9;
        *(unsigned char *)(a1 + 5308 + v9) = 0;
        int v11 = v9;
      }
      else
      {
        _WORD *v10 = 0;
      }
      v10 += 2;
      ++v9;
    }
    while (v7 != v9);
    int v13 = *v8;
    if (*v8 > 1) {
      goto LABEL_20;
    }
  }
  int v14 = v11;
  do
  {
    if (v14 >= 2) {
      int v11 = v14;
    }
    else {
      int v11 = v14 + 1;
    }
    if (v14 < 2) {
      int v15 = v14 + 1;
    }
    else {
      int v15 = 0;
    }
    uint64_t v16 = v13 + 1;
    *(_DWORD *)(a1 + 5300) = v16;
    *(_DWORD *)(a1 + 4 * v16 + 3008) = v15;
    *(_WORD *)(v4 + 4 * v15) = 1;
    *(unsigned char *)(a1 + v15 + 5308) = 0;
    --*(void *)(a1 + 5912);
    if (v6) {
      *(void *)(a1 + 5920) -= *(unsigned __int16 *)(v6 + 4 * v15 + 2);
    }
    int v13 = *v8;
    int v14 = v11;
  }
  while (*v8 < 2);
LABEL_20:
  *(_DWORD *)(a2 + 8) = v11;
  int v17 = v13 >> 1;
  do
  {
    sub_23C2201D0(a1, v4, v17);
    BOOL v18 = v17-- != 0;
  }
  while (v17 != 0 && v18);
  int v19 = *(_DWORD *)(a1 + 5300);
  uint64_t v20 = (int)v7;
  uint64_t v21 = 4 * (int)v7;
  do
  {
    uint64_t v22 = *(int *)(a1 + 3012);
    *(_DWORD *)(a1 + 5300) = v19 - 1;
    uint64_t v23 = a1 + 3008;
    *(_DWORD *)(a1 + 3012) = *(_DWORD *)(a1 + 3008 + 4 * v19);
    sub_23C2201D0(a1, v4, 1);
    uint64_t v24 = *(int *)(a1 + 3012);
    uint64_t v25 = *(int *)(a1 + 5304) - 1;
    *(_DWORD *)(a1 + 5304) = v25;
    *(_DWORD *)(v23 + 4 * v25) = v22;
    uint64_t v26 = *(int *)(a1 + 5304) - 1;
    *(_DWORD *)(a1 + 5304) = v26;
    *(_DWORD *)(v23 + 4 * v26) = v24;
    uint64_t v27 = (_WORD *)(v4 + 4 * v22);
    uint64_t v28 = (_WORD *)(v4 + 4 * v24);
    *(_WORD *)(v4 + v21) = *v28 + *v27;
    unsigned int v29 = *(unsigned __int8 *)(a1 + 5308 + v24);
    if (*(unsigned __int8 *)(a1 + 5308 + v22) > v29) {
      LOBYTE(v29) = *(unsigned char *)(a1 + 5308 + v22);
    }
    *(unsigned char *)(a1 + 5308 + v20) = v29 + 1;
    v28[1] = v20;
    v27[1] = v20;
    *(_DWORD *)(a1 + 3012) = v20;
    uint64_t result = sub_23C2201D0(a1, v4, 1);
    int v19 = *(_DWORD *)(a1 + 5300);
    v21 += 4;
    ++v20;
  }
  while (v19 > 1);
  int v31 = *(_DWORD *)(a1 + 3012);
  uint64_t v32 = *(int *)(a1 + 5304) - 1;
  *(_DWORD *)(a1 + 5304) = v32;
  *(_DWORD *)(v23 + 4 * v32) = v31;
  uint64_t v33 = *(void *)a2;
  int v34 = *(_DWORD *)(a2 + 8);
  int v35 = *(uint64_t **)(a2 + 16);
  uint64_t v36 = *v35;
  uint64_t v37 = v35[1];
  int v38 = *((_DWORD *)v35 + 4);
  uint64_t v39 = *((int *)v35 + 6);
  *(_OWORD *)(a1 + 2992) = 0u;
  *(_OWORD *)(a1 + 2976) = 0u;
  *(_WORD *)(v33 + 4 * *(int *)(v23 + 4 * *(int *)(a1 + 5304)) + 2) = 0;
  uint64_t v40 = *(int *)(a1 + 5304);
  if ((int)v40 <= 571)
  {
    int v41 = 0;
    do
    {
      uint64_t v42 = *(int *)(a1 + 3012 + 4 * v40);
      uint64_t result = v33 + 4 * v42;
      int v43 = *(unsigned __int16 *)(v33 + 4 * *(unsigned __int16 *)(result + 2) + 2);
      BOOL v44 = (int)v39 <= v43;
      if ((int)v39 > v43) {
        int v45 = v43 + 1;
      }
      else {
        int v45 = v39;
      }
      if (v44) {
        ++v41;
      }
      *(_WORD *)(result + 2) = v45;
      if ((int)v42 <= v34)
      {
        ++*(_WORD *)(a1 + 2 * v45 + 2976);
        int v46 = (int)v42 >= v38 ? *(_DWORD *)(v37 + 4 * ((int)v42 - v38)) : 0;
        uint64_t result = *(unsigned __int16 *)result;
        *(void *)(a1 + 5912) += result * (unint64_t)(v46 + v45);
        if (v36) {
          *(void *)(a1 + 5920) += result
        }
                                  * (unint64_t)(v46 + *(unsigned __int16 *)(v36 + 4 * v42 + 2));
      }
    }
    while (v40++ != 571);
    if (v41)
    {
      do
      {
        uint64_t v48 = (_WORD *)(a1 + 2 * v39 + 2976);
        uint64_t v49 = (v39 << 32) + 0x100000000;
        do
        {
          int v51 = (unsigned __int16)*--v48;
          __int16 v50 = v51;
          v49 -= 0x100000000;
        }
        while (!v51);
        _WORD *v48 = v50 - 1;
        *(_WORD *)(a1 + (v49 >> 31) + 2976) += 2;
        --*(_WORD *)(a1 + 2 * v39 + 2976);
        BOOL v52 = __OFSUB__(v41, 2);
        v41 -= 2;
      }
      while (!((v41 < 0) ^ v52 | (v41 == 0)));
      if (v39)
      {
        int v53 = 573;
        do
        {
          int v54 = *(unsigned __int16 *)(a1 + 2 * v39 + 2976);
          if (*(_WORD *)(a1 + 2 * v39 + 2976))
          {
            do
            {
              __int16 v55 = (int *)(a1 + 3004 + 4 * v53);
              do
              {
                uint64_t v57 = *v55--;
                uint64_t v56 = v57;
                --v53;
              }
              while ((int)v57 > v34);
              uint64_t v58 = v33 + 4 * v56;
              unsigned int v61 = *(unsigned __int16 *)(v58 + 2);
              uint64_t v59 = (_WORD *)(v58 + 2);
              uint64_t v60 = v61;
              if (v39 != v61)
              {
                *(void *)(a1 + 5912) += (v39 - v60) * *(unsigned __int16 *)(v33 + 4 * v56);
                *uint64_t v59 = v39;
              }
              --v54;
            }
            while (v54);
          }
          --v39;
        }
        while (v39);
      }
    }
  }
  uint64_t v62 = 0;
  int v63 = 0;
  do
  {
    int v63 = 2 * (v63 + *(unsigned __int16 *)(a1 + 2976 + v62 * 2));
    v71[++v62] = v63;
  }
  while (v62 != 15);
  if ((v11 & 0x80000000) == 0)
  {
    uint64_t v64 = 0;
    do
    {
      uint64_t v65 = v4 + 4 * v64;
      int v66 = *(unsigned __int16 *)(v65 + 2);
      if (*(_WORD *)(v65 + 2))
      {
        int v67 = 0;
        unsigned int v68 = v71[*(unsigned __int16 *)(v65 + 2)];
        v71[v66] = v68 + 1;
        unsigned int v69 = v66 + 1;
        do
        {
          int v70 = v67 | v68 & 1;
          v68 >>= 1;
          int v67 = 2 * v70;
          --v69;
        }
        while (v69 > 1);
        *(_WORD *)(v4 + 4 * v64) = v70;
      }
      ++v64;
    }
    while (v64 != v11 + 1);
  }
  return result;
}

uint64_t sub_23C2201D0(uint64_t result, uint64_t a2, int a3)
{
  int v3 = *(_DWORD *)(result + 4 * a3 + 3008);
  int v4 = 2 * a3;
  int v5 = *(_DWORD *)(result + 5300);
  if (2 * a3 <= v5)
  {
    uint64_t v7 = result + 5308;
    while (1)
    {
      if (v4 >= v5)
      {
        int v6 = v4;
        uint64_t v8 = v4;
      }
      else
      {
        uint64_t v8 = v4;
        uint64_t v9 = *(int *)(result + 3008 + 4 * (v4 | 1));
        unsigned int v10 = *(unsigned __int16 *)(a2 + 4 * v9);
        uint64_t v11 = *(int *)(result + 3008 + 4 * v4);
        unsigned int v12 = *(unsigned __int16 *)(a2 + 4 * v11);
        if (v10 >= v12)
        {
          if (v10 != v12)
          {
            int v6 = v4;
            goto LABEL_11;
          }
          unsigned int v13 = *(unsigned __int8 *)(v7 + v9);
          int v6 = v4;
          if (v13 > *(unsigned __int8 *)(v7 + v11)) {
            goto LABEL_11;
          }
        }
        uint64_t v8 = v4 | 1;
        int v6 = v4 | 1;
      }
LABEL_11:
      unsigned int v14 = *(unsigned __int16 *)(a2 + 4 * v3);
      int v15 = *(_DWORD *)(result + 4 * v8 + 3008);
      unsigned int v16 = *(unsigned __int16 *)(a2 + 4 * v15);
      if (v14 < v16
        || v14 == v16
        && *(unsigned __int8 *)(result + v3 + 5308) <= *(unsigned __int8 *)(result + v15 + 5308))
      {
        break;
      }
      *(_DWORD *)(result + 4 * a3 + 3008) = v15;
      int v4 = 2 * v6;
      int v5 = *(_DWORD *)(result + 5300);
      a3 = v6;
      if (2 * v6 > v5) {
        goto LABEL_15;
      }
    }
  }
  int v6 = a3;
LABEL_15:
  *(_DWORD *)(result + 4 * v6 + 3008) = v3;
  return result;
}

uint64_t sub_23C2202D8(uint64_t result, uint64_t a2, int a3)
{
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t v3 = 0;
    int v4 = 0;
    unsigned int v5 = *(unsigned __int16 *)(a2 + 2);
    if (*(_WORD *)(a2 + 2)) {
      int v6 = 7;
    }
    else {
      int v6 = 138;
    }
    if (*(_WORD *)(a2 + 2)) {
      int v7 = 4;
    }
    else {
      int v7 = 3;
    }
    int v8 = -1;
    do
    {
      ++v3;
      unsigned int v9 = *(unsigned __int16 *)(a2 + 4 * v3 + 2);
      int v10 = v4 + 1;
      if (v4 + 1 >= v6 || v5 != v9)
      {
        if (v10 >= v7)
        {
          int v23 = *(_DWORD *)(result + 5940);
          if (v5)
          {
            if (v5 != v8)
            {
              uint64_t v24 = result + 4 * v5;
              int v25 = *(unsigned __int16 *)(v24 + 2750);
              unsigned int v26 = *(unsigned __int16 *)(v24 + 2748);
              int v27 = *(unsigned __int16 *)(result + 5936);
              int v28 = v27 | (v26 << v23);
              *(_WORD *)(result + 5936) = v27 | ((_WORD)v26 << v23);
              if (v23 <= 16 - v25)
              {
                v23 += v25;
              }
              else
              {
                uint64_t v29 = *(void *)(result + 16);
                uint64_t v30 = *(void *)(result + 40);
                *(void *)(result + 40) = v30 + 1;
                *(unsigned char *)(v29 + v30) = v28;
                LOBYTE(v29) = *(unsigned char *)(result + 5937);
                uint64_t v31 = *(void *)(result + 16);
                uint64_t v32 = *(void *)(result + 40);
                *(void *)(result + 40) = v32 + 1;
                *(unsigned char *)(v31 + v32) = v29;
                LODWORD(v29) = *(_DWORD *)(result + 5940);
                *(_WORD *)(result + 5936) = v26 >> (16 - v29);
                int v23 = v25 + v29 - 16;
              }
              *(_DWORD *)(result + 5940) = v23;
              int v10 = v4;
            }
            int v52 = *(unsigned __int16 *)(result + 2814);
            unsigned int v53 = *(unsigned __int16 *)(result + 2812);
            int v54 = *(unsigned __int16 *)(result + 5936) | (v53 << v23);
            if (v23 <= 16 - v52)
            {
              int v60 = v23 + v52;
            }
            else
            {
              *(_WORD *)(result + 5936) = v54;
              uint64_t v55 = *(void *)(result + 16);
              uint64_t v56 = *(void *)(result + 40);
              *(void *)(result + 40) = v56 + 1;
              *(unsigned char *)(v55 + v56) = v54;
              char v57 = *(unsigned char *)(result + 5937);
              uint64_t v58 = *(void *)(result + 16);
              uint64_t v59 = *(void *)(result + 40);
              *(void *)(result + 40) = v59 + 1;
              *(unsigned char *)(v58 + v59) = v57;
              LODWORD(v58) = *(_DWORD *)(result + 5940);
              int v54 = v53 >> (16 - v58);
              int v60 = v52 + v58 - 16;
            }
            *(_DWORD *)(result + 5940) = v60;
            int v61 = v10 + 65533;
            if (v60 < 15)
            {
              *(_WORD *)(result + 5936) = v54 | (v61 << v60);
              int v69 = v60 + 2;
            }
            else
            {
              __int16 v62 = v54 | (v61 << v60);
              *(_WORD *)(result + 5936) = v62;
              uint64_t v63 = *(void *)(result + 16);
              uint64_t v64 = *(void *)(result + 40);
              *(void *)(result + 40) = v64 + 1;
              *(unsigned char *)(v63 + v64) = v62;
              LOBYTE(v62) = *(unsigned char *)(result + 5937);
              uint64_t v65 = *(void *)(result + 16);
              uint64_t v66 = *(void *)(result + 40);
              *(void *)(result + 40) = v66 + 1;
              *(unsigned char *)(v65 + v66) = v62;
              unsigned int v67 = (unsigned __int16)v61;
              int v68 = *(_DWORD *)(result + 5940);
              *(_WORD *)(result + 5936) = v67 >> (16 - v68);
              int v69 = v68 - 14;
            }
          }
          else
          {
            int v33 = *(unsigned __int16 *)(result + 5936);
            if (v4 > 9)
            {
              int v43 = *(unsigned __int16 *)(result + 2822);
              unsigned int v44 = *(unsigned __int16 *)(result + 2820);
              int v45 = v33 | (v44 << v23);
              if (v23 <= 16 - v43)
              {
                int v51 = v23 + v43;
              }
              else
              {
                *(_WORD *)(result + 5936) = v45;
                uint64_t v46 = *(void *)(result + 16);
                uint64_t v47 = *(void *)(result + 40);
                *(void *)(result + 40) = v47 + 1;
                *(unsigned char *)(v46 + v47) = v45;
                char v48 = *(unsigned char *)(result + 5937);
                uint64_t v49 = *(void *)(result + 16);
                uint64_t v50 = *(void *)(result + 40);
                *(void *)(result + 40) = v50 + 1;
                *(unsigned char *)(v49 + v50) = v48;
                LODWORD(v49) = *(_DWORD *)(result + 5940);
                int v45 = v44 >> (16 - v49);
                int v51 = v43 + v49 - 16;
              }
              *(_DWORD *)(result + 5940) = v51;
              int v78 = v4 + 65526;
              int v79 = v78 << v51;
              if (v51 < 10)
              {
                *(_WORD *)(result + 5936) = v45 | v79;
                int v69 = v51 + 7;
              }
              else
              {
                __int16 v80 = v45 | v79;
                *(_WORD *)(result + 5936) = v80;
                uint64_t v81 = *(void *)(result + 16);
                uint64_t v82 = *(void *)(result + 40);
                *(void *)(result + 40) = v82 + 1;
                *(unsigned char *)(v81 + v82) = v80;
                LOBYTE(v80) = *(unsigned char *)(result + 5937);
                uint64_t v83 = *(void *)(result + 16);
                uint64_t v84 = *(void *)(result + 40);
                *(void *)(result + 40) = v84 + 1;
                *(unsigned char *)(v83 + v84) = v80;
                int v85 = *(_DWORD *)(result + 5940);
                *(_WORD *)(result + 5936) = (unsigned __int16)v78 >> (16 - v85);
                int v69 = v85 - 9;
              }
            }
            else
            {
              int v34 = *(unsigned __int16 *)(result + 2818);
              unsigned int v35 = *(unsigned __int16 *)(result + 2816);
              int v36 = v33 | (v35 << v23);
              if (v23 <= 16 - v34)
              {
                int v42 = v23 + v34;
              }
              else
              {
                *(_WORD *)(result + 5936) = v36;
                uint64_t v37 = *(void *)(result + 16);
                uint64_t v38 = *(void *)(result + 40);
                *(void *)(result + 40) = v38 + 1;
                *(unsigned char *)(v37 + v38) = v36;
                char v39 = *(unsigned char *)(result + 5937);
                uint64_t v40 = *(void *)(result + 16);
                uint64_t v41 = *(void *)(result + 40);
                *(void *)(result + 40) = v41 + 1;
                *(unsigned char *)(v40 + v41) = v39;
                LODWORD(v40) = *(_DWORD *)(result + 5940);
                int v36 = v35 >> (16 - v40);
                int v42 = v34 + v40 - 16;
              }
              *(_DWORD *)(result + 5940) = v42;
              int v70 = v4 + 65534;
              int v71 = v70 << v42;
              if (v42 < 14)
              {
                *(_WORD *)(result + 5936) = v36 | v71;
                int v69 = v42 + 3;
              }
              else
              {
                __int16 v72 = v36 | v71;
                *(_WORD *)(result + 5936) = v72;
                uint64_t v73 = *(void *)(result + 16);
                uint64_t v74 = *(void *)(result + 40);
                *(void *)(result + 40) = v74 + 1;
                *(unsigned char *)(v73 + v74) = v72;
                LOBYTE(v72) = *(unsigned char *)(result + 5937);
                uint64_t v75 = *(void *)(result + 16);
                uint64_t v76 = *(void *)(result + 40);
                *(void *)(result + 40) = v76 + 1;
                *(unsigned char *)(v75 + v76) = v72;
                int v77 = *(_DWORD *)(result + 5940);
                *(_WORD *)(result + 5936) = (unsigned __int16)v70 >> (16 - v77);
                int v69 = v77 - 13;
              }
            }
          }
          *(_DWORD *)(result + 5940) = v69;
        }
        else
        {
          uint64_t v11 = result + 4 * v5;
          unsigned int v12 = (unsigned __int16 *)(v11 + 2748);
          unsigned int v13 = (unsigned __int16 *)(v11 + 2750);
          int v14 = *(_DWORD *)(result + 5940);
          do
          {
            int v15 = *v13;
            unsigned int v16 = *v12;
            int v17 = *(unsigned __int16 *)(result + 5936);
            int v18 = v17 | (v16 << v14);
            *(_WORD *)(result + 5936) = v17 | ((_WORD)v16 << v14);
            if (v14 <= 16 - v15)
            {
              v14 += v15;
            }
            else
            {
              uint64_t v19 = *(void *)(result + 16);
              uint64_t v20 = *(void *)(result + 40);
              *(void *)(result + 40) = v20 + 1;
              *(unsigned char *)(v19 + v20) = v18;
              LOBYTE(v19) = *(unsigned char *)(result + 5937);
              uint64_t v21 = *(void *)(result + 16);
              uint64_t v22 = *(void *)(result + 40);
              *(void *)(result + 40) = v22 + 1;
              *(unsigned char *)(v21 + v22) = v19;
              LODWORD(v19) = *(_DWORD *)(result + 5940);
              *(_WORD *)(result + 5936) = v16 >> (16 - v19);
              int v14 = v15 + v19 - 16;
            }
            *(_DWORD *)(result + 5940) = v14;
            --v10;
          }
          while (v10);
        }
        if (v5 == v9) {
          int v86 = 3;
        }
        else {
          int v86 = 4;
        }
        if (v5 == v9) {
          int v87 = 6;
        }
        else {
          int v87 = 7;
        }
        if (v9) {
          int v7 = v86;
        }
        else {
          int v7 = 3;
        }
        if (v9) {
          int v6 = v87;
        }
        else {
          int v6 = 138;
        }
        int v10 = 0;
        int v8 = v5;
      }
      unsigned int v5 = v9;
      int v4 = v10;
    }
    while (v3 != a3 + 1);
  }
  return result;
}

_WORD *sub_23C220778(_WORD *result, uint64_t a2, int a3)
{
  int v3 = *(unsigned __int16 *)(a2 + 2);
  uint64_t v4 = (a3 + 1);
  *(_WORD *)(a2 + 4 * (int)v4 + 2) = -1;
  if ((a3 & 0x80000000) == 0)
  {
    int v5 = 0;
    if (v3) {
      int v6 = 4;
    }
    else {
      int v6 = 3;
    }
    if (v3) {
      int v7 = 7;
    }
    else {
      int v7 = 138;
    }
    int v8 = (unsigned __int16 *)(a2 + 6);
    int v9 = -1;
    do
    {
      int v11 = *v8;
      v8 += 2;
      int v10 = v11;
      int v12 = v5 + 1;
      if (v5 + 1 >= v7 || v3 != v10)
      {
        if (v12 >= v6)
        {
          if (v3)
          {
            if (v3 != v9) {
              ++result[2 * v3 + 1374];
            }
            ++result[1406];
          }
          else if (v5 > 9)
          {
            ++result[1410];
          }
          else
          {
            ++result[1408];
          }
        }
        else
        {
          result[2 * v3 + 1374] += v12;
        }
        if (v3 == v10) {
          int v14 = 6;
        }
        else {
          int v14 = 7;
        }
        if (v3 == v10) {
          int v15 = 3;
        }
        else {
          int v15 = 4;
        }
        int v12 = 0;
        if (v10) {
          int v7 = v14;
        }
        else {
          int v7 = 138;
        }
        if (v10) {
          int v6 = v15;
        }
        else {
          int v6 = 3;
        }
        int v9 = v3;
      }
      int v5 = v12;
      int v3 = v10;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_23C22086C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 5900))
  {
    unsigned int v3 = 0;
    while (1)
    {
      uint64_t v4 = *(void *)(result + 5888);
      unsigned int v5 = *(unsigned __int8 *)(v4 + v3) | (*(unsigned __int8 *)(v4 + v3 + 1) << 8);
      uint64_t v6 = *(unsigned __int8 *)(v4 + v3 + 2);
      if (v5) {
        break;
      }
      uint64_t v20 = (unsigned __int16 *)(a2 + 4 * v6);
      int v21 = v20[1];
      int v22 = *(_DWORD *)(result + 5940);
      unsigned int v23 = *v20;
      int v24 = *(unsigned __int16 *)(result + 5936);
      int v25 = v24 | (v23 << v22);
      *(_WORD *)(result + 5936) = v24 | ((_WORD)v23 << v22);
      if (v22 > 16 - v21)
      {
        uint64_t v26 = *(void *)(result + 16);
        uint64_t v27 = *(void *)(result + 40);
        *(void *)(result + 40) = v27 + 1;
        *(unsigned char *)(v26 + v27) = v25;
        LOBYTE(v26) = *(unsigned char *)(result + 5937);
        uint64_t v28 = *(void *)(result + 16);
        uint64_t v29 = *(void *)(result + 40);
        *(void *)(result + 40) = v29 + 1;
        *(unsigned char *)(v28 + v29) = v26;
        LODWORD(v26) = *(_DWORD *)(result + 5940);
        *(_WORD *)(result + 5936) = v23 >> (16 - v26);
        int v30 = v21 + v26;
LABEL_24:
        int v39 = v30 - 16;
        goto LABEL_26;
      }
      int v39 = v22 + v21;
LABEL_26:
      *(_DWORD *)(result + 5940) = v39;
LABEL_27:
      v3 += 3;
      if (v3 >= *(_DWORD *)(result + 5900)) {
        goto LABEL_30;
      }
    }
    uint64_t v7 = byte_23C228170[v6];
    uint64_t v8 = a2 + 4 * v7;
    int v9 = *(unsigned __int16 *)(v8 + 1030);
    int v10 = *(_DWORD *)(result + 5940);
    unsigned int v11 = *(unsigned __int16 *)(v8 + 1028);
    int v12 = *(unsigned __int16 *)(result + 5936);
    int v13 = v12 | (v11 << v10);
    *(_WORD *)(result + 5936) = v12 | ((_WORD)v11 << v10);
    if (v10 <= 16 - v9)
    {
      int v19 = v10 + v9;
    }
    else
    {
      uint64_t v14 = *(void *)(result + 16);
      uint64_t v15 = *(void *)(result + 40);
      *(void *)(result + 40) = v15 + 1;
      *(unsigned char *)(v14 + v15) = v13;
      char v16 = *(unsigned char *)(result + 5937);
      uint64_t v17 = *(void *)(result + 16);
      uint64_t v18 = *(void *)(result + 40);
      *(void *)(result + 40) = v18 + 1;
      *(unsigned char *)(v17 + v18) = v16;
      LODWORD(v17) = *(_DWORD *)(result + 5940);
      int v13 = v11 >> (16 - v17);
      *(_WORD *)(result + 5936) = v13;
      int v19 = v9 + v17 - 16;
    }
    *(_DWORD *)(result + 5940) = v19;
    if ((unint64_t)(v7 - 28) >= 0xFFFFFFFFFFFFFFECLL)
    {
      int v31 = dword_23C228768[v7];
      int v32 = v6 - dword_23C2288B4[v7];
      if (v19 <= 16 - v31)
      {
        v13 |= v32 << v19;
        *(_WORD *)(result + 5936) = v13;
        v19 += v31;
      }
      else
      {
        unsigned int v33 = (unsigned __int16)v32;
        __int16 v34 = v13 | (v32 << v19);
        *(_WORD *)(result + 5936) = v34;
        uint64_t v35 = *(void *)(result + 16);
        uint64_t v36 = *(void *)(result + 40);
        *(void *)(result + 40) = v36 + 1;
        *(unsigned char *)(v35 + v36) = v34;
        LOBYTE(v34) = *(unsigned char *)(result + 5937);
        uint64_t v37 = *(void *)(result + 16);
        uint64_t v38 = *(void *)(result + 40);
        *(void *)(result + 40) = v38 + 1;
        *(unsigned char *)(v37 + v38) = v34;
        LODWORD(v37) = *(_DWORD *)(result + 5940);
        int v13 = v33 >> (16 - v37);
        *(_WORD *)(result + 5936) = v13;
        int v19 = v31 + v37 - 16;
      }
      *(_DWORD *)(result + 5940) = v19;
    }
    unsigned int v40 = v5 - 1;
    if (v5 >= 0x101) {
      unsigned int v41 = ((v5 - 1) >> 7) + 256;
    }
    else {
      unsigned int v41 = v5 - 1;
    }
    uint64_t v42 = byte_23C227F70[v41];
    int v43 = (unsigned __int16 *)(a3 + 4 * v42);
    int v44 = v43[1];
    unsigned int v45 = *v43;
    int v46 = v13 | (v45 << v19);
    *(_WORD *)(result + 5936) = v46;
    if (v19 <= 16 - v44)
    {
      int v39 = v19 + v44;
    }
    else
    {
      uint64_t v47 = *(void *)(result + 16);
      uint64_t v48 = *(void *)(result + 40);
      *(void *)(result + 40) = v48 + 1;
      *(unsigned char *)(v47 + v48) = v46;
      char v49 = *(unsigned char *)(result + 5937);
      uint64_t v50 = *(void *)(result + 16);
      uint64_t v51 = *(void *)(result + 40);
      *(void *)(result + 40) = v51 + 1;
      *(unsigned char *)(v50 + v51) = v49;
      LODWORD(v50) = *(_DWORD *)(result + 5940);
      int v46 = v45 >> (16 - v50);
      *(_WORD *)(result + 5936) = v46;
      int v39 = v44 + v50 - 16;
    }
    *(_DWORD *)(result + 5940) = v39;
    if (v42 < 4) {
      goto LABEL_27;
    }
    int v52 = dword_23C2287DC[v42];
    unsigned int v53 = v40 - dword_23C228928[v42];
    if (v39 <= 16 - v52)
    {
      *(_WORD *)(result + 5936) = v46 | ((_WORD)v53 << v39);
      v39 += v52;
      goto LABEL_26;
    }
    unsigned int v54 = (unsigned __int16)v53;
    __int16 v55 = v46 | (v53 << v39);
    *(_WORD *)(result + 5936) = v55;
    uint64_t v56 = *(void *)(result + 16);
    uint64_t v57 = *(void *)(result + 40);
    *(void *)(result + 40) = v57 + 1;
    *(unsigned char *)(v56 + v57) = v55;
    LOBYTE(v55) = *(unsigned char *)(result + 5937);
    uint64_t v58 = *(void *)(result + 16);
    uint64_t v59 = *(void *)(result + 40);
    *(void *)(result + 40) = v59 + 1;
    *(unsigned char *)(v58 + v59) = v55;
    int v60 = *(_DWORD *)(result + 5940);
    *(_WORD *)(result + 5936) = v54 >> (16 - v60);
    int v30 = v52 + v60;
    goto LABEL_24;
  }
  int v39 = *(_DWORD *)(result + 5940);
LABEL_30:
  int v61 = *(unsigned __int16 *)(a2 + 1026);
  unsigned int v62 = *(unsigned __int16 *)(a2 + 1024);
  int v63 = *(unsigned __int16 *)(result + 5936);
  int v64 = v63 | (v62 << v39);
  *(_WORD *)(result + 5936) = v63 | ((_WORD)v62 << v39);
  if (v39 <= 16 - v61)
  {
    int v71 = v39 + v61;
  }
  else
  {
    uint64_t v65 = *(void *)(result + 16);
    uint64_t v66 = *(void *)(result + 40);
    *(void *)(result + 40) = v66 + 1;
    *(unsigned char *)(v65 + v66) = v64;
    char v67 = *(unsigned char *)(result + 5937);
    uint64_t v68 = *(void *)(result + 16);
    uint64_t v69 = *(void *)(result + 40);
    *(void *)(result + 40) = v69 + 1;
    *(unsigned char *)(v68 + v69) = v67;
    int v70 = *(_DWORD *)(result + 5940);
    *(_WORD *)(result + 5936) = v62 >> (16 - v70);
    int v71 = v61 + v70 - 16;
  }
  *(_DWORD *)(result + 5940) = v71;
  return result;
}

int gzclose(gzFile file)
{
  if (!file) {
    return -2;
  }
  if (file[1].have == 7247) {
    return gzclose_r(file);
  }
  return gzclose_w(file);
}

gzFile gzdopen(int fd, const char *mode)
{
  if (fd == -1) {
    return 0;
  }
  uint64_t v4 = (char *)malloc_type_malloc(0x13uLL, 0xC5832E8AuLL);
  if (!v4) {
    return 0;
  }
  unsigned int v5 = v4;
  snprintf(v4, 0x13uLL, "<fd:%d>", fd);
  uint64_t v6 = (gzFile_s *)sub_23C220CE8(v5, fd, mode);
  free(v5);
  return v6;
}

uint64_t sub_23C220CE8(const char *a1, int a2, unsigned char *a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = malloc_type_malloc(0xF0uLL, 0x10B00408B6D6075uLL);
  uint64_t v7 = (uint64_t)v6;
  if (!v6) {
    return v7;
  }
  v6[5] = 0x200000000000;
  v6[15] = 0;
  *((_DWORD *)v6 + 6) = 0;
  v6[11] = 0xFFFFFFFFLL;
  *((_DWORD *)v6 + 16) = 0;
  char v8 = *a3;
  if (!*a3) {
    goto LABEL_60;
  }
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
  int v12 = 0;
  int v13 = a3 + 1;
  do
  {
    if ((v8 - 48) <= 9u)
    {
      *((_DWORD *)v6 + 22) = v8 - 48;
      goto LABEL_28;
    }
    if (v8 <= 96)
    {
      if (v8 <= 81)
      {
        if (v8 == 70)
        {
          *((_DWORD *)v6 + 23) = 4;
        }
        else if (v8 == 43)
        {
          goto LABEL_60;
        }
      }
      else if (v8 == 82)
      {
        *((_DWORD *)v6 + 23) = 3;
      }
      else if (v8 == 84)
      {
        int v9 = 1;
        *((_DWORD *)v6 + 16) = 1;
      }
    }
    else if (v8 > 113)
    {
      if (v8 == 120)
      {
        int v11 = 1;
      }
      else
      {
        if (v8 == 119)
        {
          int v10 = 31153;
        }
        else
        {
          if (v8 != 114) {
            goto LABEL_28;
          }
          int v10 = 7247;
        }
LABEL_27:
        *((_DWORD *)v6 + 6) = v10;
      }
    }
    else
    {
      switch(v8)
      {
        case 'a':
          int v10 = 1;
          goto LABEL_27;
        case 'e':
          int v12 = 1;
          break;
        case 'f':
          *((_DWORD *)v6 + 23) = 1;
          break;
        case 'h':
          *((_DWORD *)v6 + 23) = 2;
          break;
        default:
          break;
      }
    }
LABEL_28:
    int v14 = *v13++;
    char v8 = v14;
  }
  while (v14);
  if (v10 == 7247)
  {
    if (!v9)
    {
      *((_DWORD *)v6 + 16) = 1;
      goto LABEL_37;
    }
    goto LABEL_60;
  }
  if (!v10)
  {
LABEL_60:
    free((void *)v7);
    return 0;
  }
LABEL_37:
  size_t v15 = strlen(a1) + 1;
  char v16 = (char *)malloc_type_malloc(v15, 0x1C007A9FuLL);
  *(void *)(v7 + 32) = v16;
  if (!v16) {
    goto LABEL_60;
  }
  snprintf(v16, v15, "%s", a1);
  int v17 = *(_DWORD *)(v7 + 24);
  if (v11) {
    int v18 = 2561;
  }
  else {
    int v18 = 513;
  }
  if (v17 == 31153) {
    int v19 = 1024;
  }
  else {
    int v19 = 8;
  }
  int v20 = v19 | v18;
  if (v17 == 7247) {
    int v21 = 0;
  }
  else {
    int v21 = v20;
  }
  if ((a2 & 0x80000000) == 0)
  {
    *(_DWORD *)(v7 + 28) = a2;
    goto LABEL_51;
  }
  int v22 = open(a1, v21 | ((v12 != 0) << 24), 438);
  *(_DWORD *)(v7 + 28) = v22;
  if (v22 == -1)
  {
    free(*(void **)(v7 + 32));
    goto LABEL_60;
  }
  a2 = v22;
  int v17 = *(_DWORD *)(v7 + 24);
LABEL_51:
  if (v17 == 7247)
  {
    off_t v23 = lseek(a2, 0, 1);
    if (v23 == -1) {
      off_t v24 = 0;
    }
    else {
      off_t v24 = v23;
    }
    *(void *)(v7 + 72) = v24;
  }
  else if (v17 == 1)
  {
    lseek(a2, 0, 2);
    *(_DWORD *)(v7 + 24) = 31153;
  }
  sub_23C220FD8(v7);
  return v7;
}

void sub_23C220FD8(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  if (*(_DWORD *)(a1 + 24) == 7247)
  {
    *(void *)(a1 + 80) = 0;
    *(_DWORD *)(a1 + 68) = 0;
  }
  else
  {
    *(_DWORD *)(a1 + 96) = 0;
  }
  *(_DWORD *)(a1 + 112) = 0;
  char v2 = *(void **)(a1 + 120);
  if (v2)
  {
    if (*(_DWORD *)(a1 + 116) != -4) {
      free(v2);
    }
    *(void *)(a1 + 120) = 0;
  }
  *(_DWORD *)(a1 + 116) = 0;
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 136) = 0;
}

int gzclose_w(gzFile file)
{
  if (!file || file[1].have != 31153) {
    return -2;
  }
  if (LODWORD(file[4].pos))
  {
    LODWORD(file[4].pos) = 0;
    int pos_high = 0;
    if (sub_23C225CF8((uint64_t)file, (uint64_t)file[4].next) == -1) {
      int pos_high = HIDWORD(file[4].pos);
    }
  }
  else
  {
    int pos_high = 0;
  }
  if (sub_23C221770((uint64_t)file, 4) == -1) {
    int pos_high = HIDWORD(file[4].pos);
  }
  if (LODWORD(file[1].pos))
  {
    if (!LODWORD(file[2].pos))
    {
      deflateEnd((z_streamp)&file[5].next);
      free(file[2].next);
    }
    free(*(void **)&file[2].have);
  }
  sub_23C2214B0((uint64_t)file, 0, 0);
  free(file[1].next);
  if (close(*(&file[1].have + 1)) == -1) {
    int pos_high = -1;
  }
  free(file);
  return pos_high;
}

int deflateEnd(z_streamp strm)
{
  if (sub_23C21ED08(strm)) {
    return -2;
  }
  state = strm->state;
  int v4 = *((_DWORD *)state + 2);
  if (*((void *)state + 2))
  {
    ((void (*)(voidpf, void))strm->zfree)(strm->opaque, *((void *)state + 2));
    state = strm->state;
  }
  if (*((void *)state + 15))
  {
    ((void (*)(voidpf, void))strm->zfree)(strm->opaque, *((void *)state + 15));
    state = strm->state;
  }
  if (*((void *)state + 14))
  {
    ((void (*)(voidpf, void))strm->zfree)(strm->opaque, *((void *)state + 14));
    state = strm->state;
  }
  if (*((void *)state + 12))
  {
    ((void (*)(voidpf, void))strm->zfree)(strm->opaque, *((void *)state + 12));
    state = strm->state;
  }
  ((void (*)(voidpf, internal_state *))strm->zfree)(strm->opaque, state);
  strm->state = 0;
  if (v4 == 113) {
    return -3;
  }
  else {
    return 0;
  }
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  uLong sourceLena = sourceLen;
  return uncompress2(dest, destLen, source, &sourceLena);
}

int uncompress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong *sourceLen)
{
  uLong v6 = *sourceLen;
  uLongf v7 = *destLen;
  if (*destLen)
  {
    *destLen = 0;
  }
  else
  {
    dest = (Bytef *)&v15;
    uLongf v7 = 1;
  }
  memset(&strm.avail_in, 0, 104);
  strm.next_in = (Bytef *)source;
  strm.uInt avail_in = 0;
  int v9 = inflateInit_(&strm, "1.2.12", 112);
  if (!v9)
  {
    strm.next_out = dest;
    strm.unint64_t avail_out = 0;
LABEL_7:
    if (v7 >= 0xFFFFFFFF) {
      uint64_t v11 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v11 = v7;
    }
    strm.unint64_t avail_out = v11;
    v7 -= v11;
    while (1)
    {
      if (!strm.avail_in)
      {
        if (v6 >= 0xFFFFFFFF) {
          uint64_t v12 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v12 = v6;
        }
        strm.uInt avail_in = v12;
        v6 -= v12;
      }
      int v13 = inflate(&strm, 0);
      if (v13) {
        break;
      }
      if (!strm.avail_out) {
        goto LABEL_7;
      }
    }
    int v9 = v13;
    *sourceLen -= v6 + strm.avail_in;
    if (dest == (Bytef *)&v15)
    {
      if (strm.total_out) {
        BOOL v14 = v13 == -5;
      }
      else {
        BOOL v14 = 0;
      }
      if (v14) {
        uLongf v7 = 1;
      }
    }
    else
    {
      *destLen = strm.total_out;
    }
    inflateEnd(&strm);
    switch(v9)
    {
      case 2:
        return -3;
      case 1:
        return 0;
      case -5:
        if (v7 + strm.avail_out) {
          return -3;
        }
        else {
          return -5;
        }
    }
  }
  return v9;
}

int gzclose_r(gzFile file)
{
  if (!file) {
    return -2;
  }
  if (file[1].have != 7247) {
    return -2;
  }
  if (LODWORD(file[1].pos))
  {
    inflateEnd((z_streamp)&file[5].next);
    free(file[2].next);
    free(*(void **)&file[2].have);
  }
  if (HIDWORD(file[4].pos) == -5) {
    int v2 = -5;
  }
  else {
    int v2 = 0;
  }
  sub_23C2214B0((uint64_t)file, 0, 0);
  free(file[1].next);
  int v3 = close(*(&file[1].have + 1));
  free(file);
  if (v3) {
    return -1;
  }
  else {
    return v2;
  }
}

int inflateEnd(z_streamp strm)
{
  if (sub_23C21CCF0(strm)) {
    return -2;
  }
  state = strm->state;
  if (*((void *)state + 9))
  {
    ((void (*)(voidpf, void))strm->zfree)(strm->opaque, *((void *)state + 9));
    state = strm->state;
  }
  ((void (*)(voidpf, internal_state *))strm->zfree)(strm->opaque, state);
  int result = 0;
  strm->state = 0;
  return result;
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return inflateInit2_(strm, 15, version, stream_size);
}

void sub_23C2214A8(int a1, void *a2)
{
}

void sub_23C2214B0(uint64_t a1, int a2, const char *a3)
{
  uLong v6 = *(void **)(a1 + 120);
  if (v6)
  {
    if (*(_DWORD *)(a1 + 116) != -4) {
      free(v6);
    }
    *(void *)(a1 + 120) = 0;
  }
  if (a2 != -5 && a2) {
    *(_DWORD *)a1 = 0;
  }
  *(_DWORD *)(a1 + 116) = a2;
  if (a2 != -4 && a3)
  {
    size_t v7 = strlen(*(const char **)(a1 + 32));
    size_t v8 = strlen(a3);
    int v9 = (char *)malloc_type_malloc(v7 + v8 + 3, 0x86B2D61DuLL);
    *(void *)(a1 + 120) = v9;
    if (v9)
    {
      int v10 = v9;
      uint64_t v11 = *(const char **)(a1 + 32);
      size_t v12 = strlen(v11);
      size_t v13 = strlen(a3);
      snprintf(v10, v12 + v13 + 3, "%s%s%s", v11, ": ", a3);
    }
    else
    {
      *(_DWORD *)(a1 + 116) = -4;
    }
  }
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  if (file)
  {
    if (file[1].have != 31153 || HIDWORD(file[4].pos)) {
      goto LABEL_4;
    }
    if ((len & 0x80000000) != 0)
    {
      sub_23C2214B0((uint64_t)file, -3, "requested length does not fit in int");
LABEL_4:
      LODWORD(file) = 0;
      return (int)file;
    }
    LODWORD(file) = sub_23C221600((uint64_t)file, (char *)buf, len);
  }
  return (int)file;
}

unint64_t sub_23C221600(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3 = a3;
  if (!a3) {
    return v3;
  }
  if (!*(_DWORD *)(a1 + 40) && sub_23C225F90(a1) == -1) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 112))
  {
    *(_DWORD *)(a1 + 112) = 0;
    if (sub_23C225CF8(a1, *(void *)(a1 + 104)) == -1) {
      return 0;
    }
  }
  if (*(unsigned int *)(a1 + 40) <= v3)
  {
    if (!*(_DWORD *)(a1 + 136) || sub_23C221770(a1, 0) != -1)
    {
      *(void *)(a1 + 128) = __src;
      unint64_t v13 = v3;
      while (1)
      {
        uint64_t v14 = v13 >= 0xFFFFFFFF ? 0xFFFFFFFFLL : v13;
        *(_DWORD *)(a1 + 136) = v14;
        *(void *)(a1 + 16) += v14;
        if (sub_23C221770(a1, 0) == -1) {
          break;
        }
        v13 -= v14;
        if (!v13) {
          return v3;
        }
      }
    }
    return 0;
  }
  unint64_t v6 = v3;
  while (1)
  {
    int v7 = *(_DWORD *)(a1 + 136);
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 128);
      uint64_t v9 = *(void *)(a1 + 48);
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(void *)(a1 + 128) = v9;
      LODWORD(v8) = v9;
    }
    unsigned int v10 = v8 + v7 - v9;
    unint64_t v11 = *(_DWORD *)(a1 + 40) - v10;
    size_t v12 = v6 >= v11 ? v11 : v6;
    memcpy((void *)(v9 + v10), __src, v12);
    *(_DWORD *)(a1 + 136) += v12;
    *(void *)(a1 + 16) += v12;
    v6 -= v12;
    if (!v6) {
      break;
    }
    __src += v12;
    if (sub_23C221770(a1, 0) == -1) {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_23C221770(uint64_t a1, int flush)
{
  if (!*(_DWORD *)(a1 + 40) && sub_23C225F90(a1) == -1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 64))
  {
    unsigned int v4 = *(_DWORD *)(a1 + 136);
    if (v4)
    {
      unsigned int v5 = *(const void **)(a1 + 128);
      while (1)
      {
        size_t v6 = v4 >= 0x40000000 ? 0x40000000 : v4;
        unsigned int v7 = write(*(_DWORD *)(a1 + 28), v5, v6);
        if ((v7 & 0x80000000) != 0) {
          break;
        }
        int v8 = *(_DWORD *)(a1 + 136);
        unsigned int v5 = (const void *)(*(void *)(a1 + 128) + v7);
        *(void *)(a1 + 128) = v5;
        unsigned int v4 = v8 - v7;
        *(_DWORD *)(a1 + 136) = v4;
        if (!v4) {
          return 0;
        }
      }
LABEL_39:
      int v19 = __error();
      int v20 = strerror(*v19);
      uint64_t v18 = 0xFFFFFFFFLL;
      sub_23C2214B0(a1, -1, v20);
      return v18;
    }
    return 0;
  }
  if (*(_DWORD *)(a1 + 96))
  {
    if (!*(_DWORD *)(a1 + 136)) {
      return 0;
    }
    deflateReset((z_streamp)(a1 + 128));
    *(_DWORD *)(a1 + 96) = 0;
  }
  int v9 = 0;
  int v10 = *(_DWORD *)(a1 + 160);
  do
  {
    if (!v10 || (flush == 4 ? (BOOL v11 = v9 == 1) : (BOOL v11 = 1), !v11 ? (v12 = 0) : (v12 = 1), flush && v12))
    {
      unint64_t v13 = *(void *)(a1 + 152);
      uint64_t v14 = *(const void **)(a1 + 8);
      if (v13 > (unint64_t)v14)
      {
        while (1)
        {
          uint64_t v15 = v13 - (void)v14;
          if (v15 >= 0x40000000) {
            LODWORD(v15) = 0x40000000;
          }
          unsigned int v16 = write(*(_DWORD *)(a1 + 28), v14, v15);
          if ((v16 & 0x80000000) != 0) {
            goto LABEL_39;
          }
          uint64_t v14 = (const void *)(*(void *)(a1 + 8) + v16);
          *(void *)(a1 + 8) = v14;
          unint64_t v13 = *(void *)(a1 + 152);
          if (v13 <= (unint64_t)v14)
          {
            int v10 = *(_DWORD *)(a1 + 160);
            break;
          }
        }
      }
      if (!v10)
      {
        int v10 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)(a1 + 160) = v10;
        uint64_t v17 = *(void *)(a1 + 56);
        *(void *)(a1 + 152) = v17;
        *(void *)(a1 + 8) = v17;
      }
    }
    int v9 = deflate((z_streamp)(a1 + 128), flush);
    if (v9 == -2)
    {
      sub_23C2214B0(a1, -2, "internal error: deflate stream corrupt");
      return 0xFFFFFFFFLL;
    }
    BOOL v11 = v10 == *(_DWORD *)(a1 + 160);
    int v10 = *(_DWORD *)(a1 + 160);
  }
  while (!v11);
  if (flush != 4) {
    return 0;
  }
  uint64_t v18 = 0;
  *(_DWORD *)(a1 + 96) = 1;
  return v18;
}

int deflateReset(z_streamp strm)
{
  int v2 = deflateResetKeep(strm);
  if (!v2)
  {
    state = strm->state;
    *((void *)state + 13) = 2 * *((unsigned int *)state + 20);
    unsigned int v4 = (char *)*((void *)state + 15);
    size_t v5 = 2 * (*((_DWORD *)state + 33) - 1);
    *(_WORD *)&v4[v5] = 0;
    bzero(v4, v5);
    size_t v6 = (unsigned __int16 *)&qword_26EFDF690[2 * *((int *)state + 49)];
    int v7 = v6[2];
    *((_DWORD *)state + 51) = *v6;
    *((_DWORD *)state + 52) = v7;
    int v8 = v6[1];
    *((_DWORD *)state + 47) = v6[3];
    *((_DWORD *)state + 48) = v8;
    *((void *)state + 19) = 0;
    *((_DWORD *)state + 1483) = 0;
    *(void *)((char *)state + 180) = 0x200000000;
    *((_DWORD *)state + 40) = 2;
    *((void *)state + 21) = 0;
    *((_DWORD *)state + 32) = 0;
  }
  return v2;
}

int deflateResetKeep(z_streamp a1)
{
  if (sub_23C21ED08(a1)) {
    return -2;
  }
  a1->uLong total_in = 0;
  a1->total_out = 0;
  a1->msg = 0;
  a1->data_type = 2;
  state = a1->state;
  *((void *)state + 4) = *((void *)state + 2);
  *((void *)state + 5) = 0;
  int v4 = *((_DWORD *)state + 12);
  if (v4 < 0)
  {
    int v4 = -v4;
    *((_DWORD *)state + 12) = v4;
  }
  BOOL v5 = v4 == 2;
  if (v4 == 2) {
    int v6 = 57;
  }
  else {
    int v6 = 42;
  }
  *((_DWORD *)state + 2) = v6;
  if (v5) {
    uLong v7 = crc32(0, 0, 0);
  }
  else {
    uLong v7 = adler32(0, 0, 0);
  }
  a1->uLong adler = v7;
  *((_DWORD *)state + 19) = -2;
  sub_23C221D88((uint64_t)state);
  return 0;
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  if (!version) {
    return -6;
  }
  int result = -6;
  if (stream_size == 112 && *version == 49)
  {
    if (!strm) {
      return -2;
    }
    unsigned int v12 = windowBits;
    strm->msg = 0;
    zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))strm->zalloc;
    if (!zalloc)
    {
      zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))sub_23C21E978;
      strm->zalloc = (alloc_func)sub_23C21E978;
      strm->opaque = 0;
    }
    if (!strm->zfree) {
      strm->zfree = (free_func)sub_23C2214A8;
    }
    unsigned int v14 = level == -1 ? 6 : level;
    if (windowBits < 0)
    {
      int v15 = 0;
      unsigned int v12 = -windowBits;
      char v16 = 1;
    }
    else if (windowBits < 0x10)
    {
      char v16 = 0;
      int v15 = 1;
    }
    else
    {
      int v15 = 2;
      char v16 = 1;
      unsigned int v12 = windowBits - 16;
    }
    int result = -2;
    if (strategy <= 4
      && v14 <= 9
      && method == 8
      && (memLevel - 10) >= 0xFFFFFFF7
      && v12 >= 8
      && v12 <= 0xF)
    {
      if (v12 != 8) {
        char v16 = 0;
      }
      if ((v16 & 1) == 0)
      {
        uint64_t v17 = zalloc(strm->opaque, 1, 5952);
        if (v17)
        {
          uint64_t v18 = v17;
          if (v12 == 8) {
            int v19 = 9;
          }
          else {
            int v19 = v12;
          }
          strm->state = (internal_state *)v17;
          *(void *)uint64_t v17 = strm;
          *(_DWORD *)(v17 + 8) = 42;
          *(_DWORD *)(v17 + 48) = v15;
          *(void *)(v17 + 56) = 0;
          *(_DWORD *)(v17 + 80) = 1 << v19;
          *(_DWORD *)(v17 + 84) = v19;
          *(_DWORD *)(v17 + 88) = (1 << v19) - 1;
          *(_DWORD *)(v17 + 132) = 128 << memLevel;
          *(_DWORD *)(v17 + 136) = memLevel + 7;
          *(_DWORD *)(v17 + 140) = (128 << memLevel) - 1;
          *(_DWORD *)(v17 + 144) = (memLevel + 9) / 3u;
          *(void *)(v17 + 96) = ((uint64_t (*)(voidpf))strm->zalloc)(strm->opaque);
          *(void *)(v18 + 112) = ((uint64_t (*)(voidpf, void, uint64_t))strm->zalloc)(strm->opaque, *(unsigned int *)(v18 + 80), 2);
          *(void *)(v18 + 120) = ((uint64_t (*)(voidpf, void, uint64_t))strm->zalloc)(strm->opaque, *(unsigned int *)(v18 + 132), 2);
          *(void *)(v18 + 5944) = 0;
          *(_DWORD *)(v18 + 5896) = 64 << memLevel;
          uint64_t v20 = ((uint64_t (*)(voidpf))strm->zalloc)(strm->opaque);
          uint64_t v21 = *(unsigned int *)(v18 + 5896);
          *(void *)(v18 + 16) = v20;
          *(void *)(v18 + 24) = 4 * v21;
          if (*(void *)(v18 + 96) && *(void *)(v18 + 112) && *(void *)(v18 + 120) && v20)
          {
            *(void *)(v18 + 5888) = v20 + v21;
            *(_DWORD *)(v18 + 5904) = 3 * v21 - 3;
            *(_DWORD *)(v18 + 196) = v14;
            *(_DWORD *)(v18 + 200) = strategy;
            *(unsigned char *)(v18 + 72) = 8;
            return deflateReset(strm);
          }
          *(_DWORD *)(v18 + 8) = 666;
          strm->msg = "insufficient memory";
          deflateEnd(strm);
        }
        return -4;
      }
    }
  }
  return result;
}

double sub_23C221D24(uint64_t a1)
{
  for (uint64_t i = 212; i != 1356; i += 4)
    *(_WORD *)(a1 + i) = 0;
  for (uint64_t j = 0; j != 120; j += 4)
    *(_WORD *)(a1 + 2504 + j) = 0;
  for (uint64_t k = 0; k != 76; k += 4)
    *(_WORD *)(a1 + 2748 + k) = 0;
  *(_WORD *)(a1 + 1236) = 1;
  *(_DWORD *)(a1 + 5900) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 5912) = 0u;
  *(_DWORD *)(a1 + 5928) = 0;
  return result;
}

double sub_23C221D88(uint64_t a1)
{
  *(void *)(a1 + 2904) = a1 + 212;
  *(void *)(a1 + 2920) = &off_264E382E8;
  *(void *)(a1 + 2928) = a1 + 2504;
  *(void *)(a1 + 2944) = &off_264E38308;
  *(void *)(a1 + 2952) = a1 + 2748;
  *(void *)(a1 + 2968) = &unk_264E38328;
  *(_WORD *)(a1 + 5936) = 0;
  *(_DWORD *)(a1 + 5940) = 0;
  return sub_23C221D24(a1);
}

int gzflush(gzFile file, int flush)
{
  if (!file) {
    return -2;
  }
  if (file[1].have != 31153) {
    return -2;
  }
  int result = -2;
  if (flush <= 4 && !HIDWORD(file[4].pos))
  {
    if (!LODWORD(file[4].pos)
      || (LODWORD(file[4].pos) = 0, sub_23C225CF8((uint64_t)file, (uint64_t)file[4].next) != -1))
    {
      sub_23C221770((uint64_t)file, flush);
    }
    return HIDWORD(file[4].pos);
  }
  return result;
}

uint64_t sub_23C221E64(int a1, int a2, unint64_t a3)
{
  if ((a3 & 0x8000000000000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v3 = (unsigned __int16)a1 + (unint64_t)(unsigned __int16)a2;
  unint64_t v4 = v3 + 65520;
  unint64_t v5 = HIWORD(a1) + (unint64_t)HIWORD(a2) - a3 % 0xFFF1 + a3 % 0xFFF1 * (unsigned __int16)a1 % 0xFFF1;
  unint64_t v6 = v5 + 65521;
  unint64_t v7 = v3 - 1;
  if (v4 <= 0xFFF0) {
    unint64_t v7 = 65520;
  }
  if (v7 > 0xFFF0) {
    v7 -= 65521;
  }
  unint64_t v8 = v5 - 65521;
  if (v6 <= 0x1FFE1) {
    unint64_t v8 = v6;
  }
  if (v8 <= 0xFFF0) {
    uint64_t v9 = v8 << 16;
  }
  else {
    uint64_t v9 = (v8 << 16) - 4293984256u;
  }
  return v9 | v7;
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  memset(&v15, 0, sizeof(v15));
  uLongf v9 = *destLen;
  *destLen = 0;
  memset(&v15.zalloc, 0, 24);
  int result = deflateInit_(&v15, level, "1.2.12", 112);
  if (!result)
  {
    v15.next_out = dest;
    v15.unint64_t avail_out = 0;
    v15.next_in = (Bytef *)source;
    v15.uInt avail_in = 0;
LABEL_3:
    if (v9 >= 0xFFFFFFFF) {
      uint64_t v11 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v11 = v9;
    }
    v15.unint64_t avail_out = v11;
    v9 -= v11;
    while (1)
    {
      if (!v15.avail_in)
      {
        if (sourceLen >= 0xFFFFFFFF) {
          uLong v12 = 0xFFFFFFFFLL;
        }
        else {
          uLong v12 = sourceLen;
        }
        v15.uInt avail_in = v12;
        sourceLen -= v12;
      }
      int v13 = deflate(&v15, 4 * (sourceLen == 0));
      if (v13) {
        break;
      }
      if (!v15.avail_out) {
        goto LABEL_3;
      }
    }
    int v14 = v13;
    *destLen = v15.total_out;
    deflateEnd(&v15);
    if (v14 == 1) {
      return 0;
    }
    else {
      return v14;
    }
  }
  return result;
}

int compress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return compress2(dest, destLen, source, sourceLen, -1);
}

uLong compressBound(uLong sourceLen)
{
  return sourceLen + (sourceLen >> 12) + (sourceLen >> 14) + (sourceLen >> 25) + 13;
}

const z_crc_t *get_crc_table(void)
{
  return (const z_crc_t *)&unk_23C2263F0;
}

uLong crc32_combine_0(uLong a1, uLong a2, uint64_t a3)
{
  uLong v5 = crc32_combine_gen_0(a3);
  uint64_t v6 = 0;
  for (unint64_t i = 0x80000000; ; i >>= 1)
  {
    if ((i & v5) != 0)
    {
      v6 ^= a1;
      if (((i - 1) & v5) == 0) {
        break;
      }
    }
    if (a1) {
      a1 = (a1 >> 1) ^ 0xEDB88320;
    }
    else {
      a1 >>= 1;
    }
  }
  return v6 ^ a2;
}

uLong crc32_combine_gen_0(uint64_t a1)
{
  if (!a1) {
    return 0x80000000;
  }
  char v1 = 3;
  unint64_t v2 = 0x80000000;
  do
  {
    if (a1)
    {
      uLong v3 = 0;
      uint64_t v5 = qword_23C226BF0[v1 & 0x1F];
      for (unint64_t i = 0x80000000; ; i >>= 1)
      {
        if ((i & v5) != 0)
        {
          v3 ^= v2;
          if (((i - 1) & v5) == 0) {
            break;
          }
        }
        if (v2) {
          unint64_t v2 = (v2 >> 1) ^ 0xEDB88320;
        }
        else {
          v2 >>= 1;
        }
      }
    }
    else
    {
      uLong v3 = v2;
    }
    ++v1;
    unint64_t v2 = v3;
    BOOL v4 = (unint64_t)a1 > 1;
    a1 >>= 1;
  }
  while (v4);
  return v3;
}

uLong crc32_combine_op(uLong crc1, uLong crc2, uLong op)
{
  uint64_t v3 = 0;
  for (unint64_t i = 0x80000000; ; i >>= 1)
  {
    if ((i & op) != 0)
    {
      v3 ^= crc1;
      if (((i - 1) & op) == 0) {
        break;
      }
    }
    if (crc1) {
      crc1 = (crc1 >> 1) ^ 0xEDB88320;
    }
    else {
      crc1 >>= 1;
    }
  }
  return v3 ^ crc2;
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return deflateInit2_(strm, level, 8, 15, 8, 0, version, stream_size);
}

int deflateSetDictionary(z_streamp strm, const Bytef *dictionary, uInt dictLength)
{
  BOOL v6 = sub_23C21ED08(strm);
  int result = -2;
  if (!dictionary) {
    return result;
  }
  if (v6) {
    return result;
  }
  state = strm->state;
  int v9 = *((_DWORD *)state + 12);
  if (v9 == 2) {
    return result;
  }
  if (v9 == 1)
  {
    if (*((_DWORD *)state + 2) != 42 || *((_DWORD *)state + 45)) {
      return result;
    }
    strm->uLong adler = adler32(strm->adler, dictionary, dictLength);
    *((_DWORD *)state + 12) = 0;
    uInt v10 = *((_DWORD *)state + 20);
    if (v10 > dictLength) {
      goto LABEL_14;
    }
  }
  else
  {
    if (*((_DWORD *)state + 45)) {
      return result;
    }
    *((_DWORD *)state + 12) = 0;
    uInt v10 = *((_DWORD *)state + 20);
    if (v10 > dictLength) {
      goto LABEL_14;
    }
    if (!v9)
    {
      uint64_t v11 = (char *)*((void *)state + 15);
      size_t v12 = 2 * (*((_DWORD *)state + 33) - 1);
      *(_WORD *)&v11[v12] = 0;
      bzero(v11, v12);
      *((_DWORD *)state + 43) = 0;
      *((void *)state + 19) = 0;
      *((_DWORD *)state + 1483) = 0;
      uInt v10 = *((_DWORD *)state + 20);
    }
  }
  dictionary += dictLength - v10;
  dictLength = v10;
LABEL_14:
  uInt avail_in = strm->avail_in;
  next_in = strm->next_in;
  strm->uInt avail_in = dictLength;
  strm->next_in = (Bytef *)dictionary;
  sub_23C21F478((uint64_t)state);
  unsigned int v15 = *((_DWORD *)state + 45);
  if (v15 >= 3)
  {
    do
    {
      unsigned int v16 = *((_DWORD *)state + 43);
      unsigned int v17 = v15 - 2;
      uint64_t v18 = *((void *)state + 12);
      int v20 = *((_DWORD *)state + 35);
      int v19 = *((_DWORD *)state + 36);
      uint64_t v22 = *((void *)state + 14);
      uint64_t v21 = *((void *)state + 15);
      int v23 = *((_DWORD *)state + 22);
      unsigned int v24 = *((_DWORD *)state + 32);
      do
      {
        unsigned int v24 = ((v24 << v19) ^ *(unsigned __int8 *)(v18 + v16 + 2)) & v20;
        *((_DWORD *)state + 32) = v24;
        *(_WORD *)(v22 + 2 * (v23 & v16)) = *(_WORD *)(v21 + 2 * v24);
        *(_WORD *)(v21 + 2 * v24) = v16++;
        --v17;
      }
      while (v17);
      *((_DWORD *)state + 43) = v16;
      *((_DWORD *)state + 45) = 2;
      sub_23C21F478((uint64_t)state);
      unsigned int v15 = *((_DWORD *)state + 45);
    }
    while (v15 > 2);
  }
  int result = 0;
  uint64_t v25 = *((_DWORD *)state + 43) + v15;
  *((void *)state + 19) = v25;
  *((_DWORD *)state + 1483) = v15;
  *(void *)((char *)state + 180) = 0x200000000;
  *((_DWORD *)state + 40) = 2;
  *((_DWORD *)state + 42) = 0;
  *((_DWORD *)state + 43) = v25;
  strm->next_in = next_in;
  strm->uInt avail_in = avail_in;
  *((_DWORD *)state + 12) = v9;
  return result;
}

int deflateGetDictionary(z_streamp strm, Bytef *dictionary, uInt *dictLength)
{
  if (sub_23C21ED08(strm)) {
    return -2;
  }
  state = strm->state;
  uint64_t v8 = *((unsigned int *)state + 43);
  uint64_t v9 = *((unsigned int *)state + 45);
  unsigned int v10 = *((_DWORD *)state + 20);
  if ((int)v9 + (int)v8 >= v10) {
    size_t v11 = v10;
  }
  else {
    size_t v11 = (v9 + v8);
  }
  if (dictionary && v11) {
    memcpy(dictionary, (const void *)(*((void *)state + 12) + v8 + v9 - v11), v11);
  }
  int result = 0;
  if (dictLength) {
    *dictLength = v11;
  }
  return result;
}

int deflateSetHeader(z_streamp strm, gz_headerp head)
{
  if (sub_23C21ED08(strm)) {
    return -2;
  }
  state = strm->state;
  if (*((_DWORD *)state + 12) != 2) {
    return -2;
  }
  int result = 0;
  *((void *)state + 7) = head;
  return result;
}

int deflatePending(z_streamp strm, unsigned int *pending, int *bits)
{
  if (sub_23C21ED08(strm)) {
    return -2;
  }
  if (pending) {
    *pending = *((void *)strm->state + 5);
  }
  int result = 0;
  if (bits) {
    *bits = *((_DWORD *)strm->state + 1485);
  }
  return result;
}

int deflatePrime(z_streamp strm, int bits, int value)
{
  if (sub_23C21ED08(strm)) {
    return -2;
  }
  if (bits > 0x10) {
    return -5;
  }
  state = strm->state;
  if (*((void *)state + 736) < (unint64_t)(*((void *)state + 4) + 2)) {
    return -5;
  }
  do
  {
    int v8 = *((_DWORD *)state + 1485);
    if (16 - v8 >= bits) {
      int v9 = bits;
    }
    else {
      int v9 = 16 - v8;
    }
    *((_WORD *)state + 2968) |= ((unsigned __int16)value & (unsigned __int16)~(-1 << v9)) << v8;
    *((_DWORD *)state + 1485) = v9 + v8;
    sub_23C21ED04((uint64_t)state);
    value >>= v9;
    bits -= v9;
  }
  while (bits);
  return 0;
}

int deflateParams(z_streamp strm, int level, int strategy)
{
  if (sub_23C21ED08(strm)) {
    return -2;
  }
  if (level == -1) {
    unsigned int v7 = 6;
  }
  else {
    unsigned int v7 = level;
  }
  int result = -2;
  if (strategy <= 4 && v7 <= 9)
  {
    state = strm->state;
    if ((*((_DWORD *)state + 50) != strategy
       || qword_26EFDF690[2 * *((int *)state + 49) + 1] != qword_26EFDF690[2 * v7 + 1])
      && *((_DWORD *)state + 19) != -2)
    {
      int result = deflate(strm, 5);
      if (result == -2) {
        return result;
      }
      if (strm->avail_in || *((unsigned int *)state + 43) - *((void *)state + 19) + *((unsigned int *)state + 45)) {
        return -5;
      }
    }
    int v9 = *((_DWORD *)state + 49);
    if (v9 != v7)
    {
      if (!v9)
      {
        int v10 = *((_DWORD *)state + 1482);
        if (v10)
        {
          if (v10 == 1)
          {
            sub_23C2226D0((uint64_t)state);
          }
          else
          {
            size_t v11 = (char *)*((void *)state + 15);
            size_t v12 = 2 * (*((_DWORD *)state + 33) - 1);
            *(_WORD *)&v11[v12] = 0;
            bzero(v11, v12);
          }
          *((_DWORD *)state + 1482) = 0;
        }
      }
      *((_DWORD *)state + 49) = v7;
      int v13 = (unsigned __int16 *)&qword_26EFDF690[2 * v7];
      int v14 = v13[1];
      int v15 = v13[2];
      *((_DWORD *)state + 51) = *v13;
      *((_DWORD *)state + 52) = v15;
      *((_DWORD *)state + 47) = v13[3];
      *((_DWORD *)state + 48) = v14;
    }
    int result = 0;
    *((_DWORD *)state + 50) = strategy;
  }
  return result;
}

uint64_t sub_23C2226D0(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 80);
  int v2 = *(_DWORD *)(result + 80);
  uint64_t v3 = *(unsigned int *)(result + 132);
  BOOL v4 = (_WORD *)(*(void *)(result + 120) + 2 * v3 - 2);
  do
  {
    unsigned int v5 = (unsigned __int16)*v4;
    BOOL v6 = v5 >= v1;
    __int16 v7 = v5 - v1;
    if (!v6) {
      __int16 v7 = 0;
    }
    *v4-- = v7;
    LODWORD(v3) = v3 - 1;
  }
  while (v3);
  int v8 = (_WORD *)(*(void *)(result + 112) + 2 * v1 - 2);
  do
  {
    unsigned int v9 = (unsigned __int16)*v8;
    BOOL v6 = v9 >= v1;
    __int16 v10 = v9 - v1;
    if (!v6) {
      __int16 v10 = 0;
    }
    *v8-- = v10;
    --v2;
  }
  while (v2);
  return result;
}

int deflateTune(z_streamp strm, int good_length, int max_lazy, int nice_length, int max_chain)
{
  int result = sub_23C21ED08(strm);
  if (result) {
    return -2;
  }
  state = strm->state;
  *((_DWORD *)state + 51) = good_length;
  *((_DWORD *)state + 52) = nice_length;
  *((_DWORD *)state + 47) = max_chain;
  *((_DWORD *)state + 48) = max_lazy;
  return result;
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  uLong v4 = sourceLen + 7;
  uLong v5 = sourceLen + ((sourceLen + 7) >> 3) + ((sourceLen + 63) >> 6);
  if (sub_23C21ED08(strm)) {
    return v5 + 11;
  }
  state = strm->state;
  uint64_t v8 = *((unsigned int *)state + 12);
  if (v8)
  {
    if (v8 == 2)
    {
      uint64_t v9 = *((void *)state + 7);
      if (v9)
      {
        if (*(void *)(v9 + 24)) {
          uint64_t v10 = (*(_DWORD *)(v9 + 32) + 2) + 18;
        }
        else {
          uint64_t v10 = 18;
        }
        size_t v11 = *(unsigned __int8 **)(v9 + 40);
        if (v11)
        {
          do
            ++v10;
          while (*v11++);
        }
        int v13 = *(unsigned __int8 **)(v9 + 56);
        if (v13)
        {
          do
            ++v10;
          while (*v13++);
        }
        if (*(_DWORD *)(v9 + 68)) {
          uint64_t v8 = v10 + 2;
        }
        else {
          uint64_t v8 = v10;
        }
      }
      else
      {
        uint64_t v8 = 18;
      }
    }
    else if (v8 == 1)
    {
      uint64_t v8 = 10;
      if (!*((_DWORD *)state + 43)) {
        uint64_t v8 = 6;
      }
    }
    else
    {
      uint64_t v8 = 6;
    }
  }
  if (*((_DWORD *)state + 21) == 15 && *((_DWORD *)state + 34) == 15) {
    uLong v15 = v4 + (sourceLen >> 12) + (sourceLen >> 14) + (sourceLen >> 25);
  }
  else {
    uLong v15 = v5 + 5;
  }
  return v15 + v8;
}

uint64_t sub_23C2228A0(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 24) - 5 >= (unint64_t)*(unsigned int *)(a1 + 80)) {
    LODWORD(v4) = *(_DWORD *)(a1 + 80);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 24) - 5;
  }
  int v5 = *(_DWORD *)(*(void *)a1 + 8);
  while (1)
  {
    int v6 = *(_DWORD *)(a1 + 5940) + 42;
    uint64_t v7 = *(void *)a1;
    unsigned int v8 = *(_DWORD *)(*(void *)a1 + 32);
    if (v8 < v6 >> 3) {
      break;
    }
    unsigned int v9 = v8 - (v6 >> 3);
    int v10 = *(_DWORD *)(a1 + 172);
    int v11 = *(_DWORD *)(a1 + 152);
    size_t v12 = (v10 - v11);
    uint64_t v13 = *(unsigned int *)(v7 + 8);
    unint64_t v14 = v12 + v13;
    unsigned int v15 = v12 + v13;
    if (v14 >= 0xFFFF) {
      unsigned int v16 = 0xFFFF;
    }
    else {
      unsigned int v16 = v15;
    }
    if (v16 >= v9) {
      unsigned int v17 = v9;
    }
    else {
      unsigned int v17 = v16;
    }
    if (v17 < v4)
    {
      BOOL v18 = a2 != 4 && v17 == 0;
      BOOL v19 = v18;
      int v20 = 1;
      BOOL v21 = v17 != v15 || a2 == 0;
      if (v21 || v19) {
        goto LABEL_40;
      }
    }
    BOOL v23 = a2 == 4 && v17 == v15;
    sub_23C2250BC(a1, 0, 0, v23);
    *(_WORD *)(*(void *)(a1 + 40) + *(void *)(a1 + 16) - 4) = v17;
    *(_WORD *)(*(void *)(a1 + 40) + *(void *)(a1 + 16) - 2) = ~(_WORD)v17;
    sub_23C21EBDC(*(void *)a1);
    if (v10 != v11)
    {
      if (v12 >= v17) {
        size_t v12 = v17;
      }
      else {
        size_t v12 = v12;
      }
      memcpy(*(void **)(*(void *)a1 + 24), (const void *)(*(void *)(a1 + 96) + *(void *)(a1 + 152)), v12);
      uint64_t v24 = *(void *)a1;
      *(void *)(v24 + 24) = *(void *)(*(void *)a1 + 24) + v12;
      *(_DWORD *)(v24 + 32) -= v12;
      *(void *)(v24 + 40) += v12;
      *(void *)(a1 + 152) += v12;
      v17 -= v12;
    }
    if (v17)
    {
      sub_23C21F6B8(*(void *)a1, *(void **)(*(void *)a1 + 24), v17);
      uint64_t v25 = *(void *)a1;
      *(void *)(v25 + 24) = *(void *)(*(void *)a1 + 24) + v17;
      *(_DWORD *)(v25 + 32) -= v17;
      *(void *)(v25 + 40) += v17;
    }
    if (v23)
    {
      int v20 = 0;
      uint64_t v7 = *(void *)a1;
      goto LABEL_40;
    }
  }
  int v20 = 1;
LABEL_40:
  int v26 = *(_DWORD *)(v7 + 8);
  size_t v27 = (v5 - v26);
  if (v5 == v26)
  {
    unint64_t v28 = *(unsigned int *)(a1 + 172);
    unsigned int v29 = *(_DWORD *)(a1 + 172);
  }
  else
  {
    size_t v30 = *(unsigned int *)(a1 + 80);
    if (v27 >= v30)
    {
      *(_DWORD *)(a1 + 5928) = 2;
      memcpy(*(void **)(a1 + 96), (const void *)(*(void *)v7 - v30), v30);
      unsigned int v29 = *(_DWORD *)(a1 + 80);
      *(_DWORD *)(a1 + 172) = v29;
      *(_DWORD *)(a1 + 5932) = v29;
    }
    else
    {
      uint64_t v31 = *(unsigned int *)(a1 + 172);
      if (*(void *)(a1 + 104) - v31 <= (unint64_t)v27)
      {
        size_t v32 = (v31 - v30);
        *(_DWORD *)(a1 + 172) = v32;
        memcpy(*(void **)(a1 + 96), (const void *)(*(void *)(a1 + 96) + v30), v32);
        unsigned int v33 = *(_DWORD *)(a1 + 5928);
        if (v33 <= 1) {
          *(_DWORD *)(a1 + 5928) = v33 + 1;
        }
        LODWORD(v31) = *(_DWORD *)(a1 + 172);
        if (*(_DWORD *)(a1 + 5932) > v31) {
          *(_DWORD *)(a1 + 5932) = v31;
        }
      }
      memcpy((void *)(*(void *)(a1 + 96) + v31), (const void *)(**(void **)a1 - v27), v27);
      unsigned int v29 = *(_DWORD *)(a1 + 172) + v27;
      *(_DWORD *)(a1 + 172) = v29;
      int v34 = *(_DWORD *)(a1 + 5932);
      unsigned int v35 = *(_DWORD *)(a1 + 80) - v34;
      if (v27 < v35) {
        unsigned int v35 = v27;
      }
      *(_DWORD *)(a1 + 5932) = v35 + v34;
    }
    unint64_t v28 = v29;
    *(void *)(a1 + 152) = v29;
  }
  if (*(void *)(a1 + 5944) < v28) {
    *(void *)(a1 + 5944) = v28;
  }
  if (!v20) {
    return 3;
  }
  if ((a2 | 4) != 4 && !*(_DWORD *)(*(void *)a1 + 8) && *(void *)(a1 + 152) == v28) {
    return 1;
  }
  unsigned int v37 = *(_DWORD *)(a1 + 104) - v29;
  if (*(_DWORD *)(*(void *)a1 + 8) > v37)
  {
    uint64_t v38 = *(void *)(a1 + 152);
    uint64_t v39 = *(unsigned int *)(a1 + 80);
    BOOL v53 = v38 < v39;
    uint64_t v40 = v38 - v39;
    if (!v53)
    {
      *(void *)(a1 + 152) = v40;
      size_t v41 = v29 - v39;
      *(_DWORD *)(a1 + 172) = v41;
      memcpy(*(void **)(a1 + 96), (const void *)(*(void *)(a1 + 96) + v39), v41);
      unsigned int v42 = *(_DWORD *)(a1 + 5928);
      if (v42 <= 1) {
        *(_DWORD *)(a1 + 5928) = v42 + 1;
      }
      v37 += *(_DWORD *)(a1 + 80);
      unsigned int v29 = *(_DWORD *)(a1 + 172);
      if (*(_DWORD *)(a1 + 5932) > v29) {
        *(_DWORD *)(a1 + 5932) = v29;
      }
    }
  }
  if (v37 >= *(_DWORD *)(*(void *)a1 + 8)) {
    unsigned int v37 = *(_DWORD *)(*(void *)a1 + 8);
  }
  if (v37)
  {
    sub_23C21F6B8(*(void *)a1, (void *)(*(void *)(a1 + 96) + v29), v37);
    unsigned int v29 = *(_DWORD *)(a1 + 172) + v37;
    *(_DWORD *)(a1 + 172) = v29;
    int v43 = *(_DWORD *)(a1 + 5932);
    unsigned int v44 = *(_DWORD *)(a1 + 80) - v43;
    if (v37 < v44) {
      unsigned int v44 = v37;
    }
    *(_DWORD *)(a1 + 5932) = v44 + v43;
  }
  unsigned int v45 = v29;
  if (*(void *)(a1 + 5944) < (unint64_t)v29) {
    *(void *)(a1 + 5944) = v29;
  }
  LODWORD(v46) = 0xFFFF;
  if (*(void *)(a1 + 24) - (unint64_t)((*(_DWORD *)(a1 + 5940) + 42) >> 3) < 0xFFFF) {
    uint64_t v46 = *(void *)(a1 + 24) - ((*(_DWORD *)(a1 + 5940) + 42) >> 3);
  }
  if (*(_DWORD *)(a1 + 80) >= v46) {
    unsigned int v47 = v46;
  }
  else {
    unsigned int v47 = *(_DWORD *)(a1 + 80);
  }
  uint64_t v48 = *(void *)(a1 + 152);
  unsigned int v49 = v45 - v48;
  if (v45 - v48 >= v47) {
    goto LABEL_91;
  }
  uint64_t v36 = 0;
  BOOL v51 = a2 == 4 || v45 != v48;
  if (a2 && v51)
  {
    if (*(_DWORD *)(*(void *)a1 + 8)) {
      return 0;
    }
LABEL_91:
    if (v49 >= v46) {
      size_t v52 = v46;
    }
    else {
      size_t v52 = v49;
    }
    if (a2 == 4)
    {
      if (*(_DWORD *)(*(void *)a1 + 8)) {
        BOOL v53 = 1;
      }
      else {
        BOOL v53 = v49 > v46;
      }
      char v54 = !v53;
    }
    else
    {
      char v54 = 0;
    }
    if (v54) {
      uint64_t v36 = 2;
    }
    else {
      uint64_t v36 = 0;
    }
    sub_23C2250BC(a1, (const void *)(*(void *)(a1 + 96) + v48), v52, v54 & 1);
    *(void *)(a1 + 152) += v52;
    sub_23C21EBDC(*(void *)a1);
  }
  return v36;
}

uint64_t sub_23C222D6C(uint64_t a1, int a2)
{
  while (1)
  {
    if (!*(_DWORD *)(a1 + 180))
    {
      sub_23C21F478(a1);
      if (!*(_DWORD *)(a1 + 180)) {
        break;
      }
    }
    *(_DWORD *)(a1 + 160) = 0;
    uint64_t v4 = *(unsigned __int8 *)(*(void *)(a1 + 96) + *(unsigned int *)(a1 + 172));
    uint64_t v5 = *(void *)(a1 + 5888);
    uint64_t v6 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v6 + 1;
    *(unsigned char *)(v5 + v6) = 0;
    uint64_t v7 = *(void *)(a1 + 5888);
    uint64_t v8 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v8 + 1;
    *(unsigned char *)(v7 + v8) = 0;
    uint64_t v9 = *(void *)(a1 + 5888);
    uint64_t v10 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v10 + 1;
    *(unsigned char *)(v9 + v10) = v4;
    ++*(_WORD *)(a1 + 4 * v4 + 212);
    LODWORD(v9) = *(_DWORD *)(a1 + 5900);
    LODWORD(v10) = *(_DWORD *)(a1 + 5904);
    --*(_DWORD *)(a1 + 180);
    uint64_t v11 = (*(_DWORD *)(a1 + 172) + 1);
    *(_DWORD *)(a1 + 172) = v11;
    if (v9 == v10)
    {
      uint64_t v12 = *(void *)(a1 + 152);
      uint64_t v13 = v12 < 0 ? 0 : (const void *)(*(void *)(a1 + 96) + v12);
      sub_23C21F7CC((int *)a1, v13, v11 - v12, 0);
      *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
      sub_23C21EBDC(*(void *)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32)) {
        return 0;
      }
    }
  }
  if (!a2) {
    return 0;
  }
  *(_DWORD *)(a1 + 5932) = 0;
  if (a2 != 4)
  {
    if (!*(_DWORD *)(a1 + 5900)) {
      return 1;
    }
    uint64_t v16 = *(void *)(a1 + 152);
    unsigned int v17 = v16 < 0 ? 0 : (const void *)(*(void *)(a1 + 96) + v16);
    sub_23C21F7CC((int *)a1, v17, *(unsigned int *)(a1 + 172) - v16, 0);
    *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
    sub_23C21EBDC(*(void *)a1);
    return *(_DWORD *)(*(void *)a1 + 32) != 0;
  }
  uint64_t v14 = *(void *)(a1 + 152);
  if (v14 < 0) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = (const void *)(*(void *)(a1 + 96) + v14);
  }
  sub_23C21F7CC((int *)a1, v15, *(unsigned int *)(a1 + 172) - v14, 1);
  *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
  sub_23C21EBDC(*(void *)a1);
  if (*(_DWORD *)(*(void *)a1 + 32)) {
    return 3;
  }
  else {
    return 2;
  }
}

uint64_t sub_23C222F34(uint64_t a1, int a2)
{
  while (1)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 180);
    if (v4 >= 0x103)
    {
      *(_DWORD *)(a1 + 160) = 0;
      uint64_t v5 = *(unsigned int *)(a1 + 172);
      if (!*(_DWORD *)(a1 + 172)) {
        goto LABEL_23;
      }
      goto LABEL_9;
    }
    sub_23C21F478(a1);
    unsigned int v4 = *(_DWORD *)(a1 + 180);
    if (!a2 && v4 < 0x103) {
      return 0;
    }
    if (!v4) {
      break;
    }
    *(_DWORD *)(a1 + 160) = 0;
    uint64_t v5 = *(unsigned int *)(a1 + 172);
    if (v4 < 3 || !*(_DWORD *)(a1 + 172))
    {
LABEL_23:
      LODWORD(v16) = *(_DWORD *)(a1 + 5900);
LABEL_24:
      uint64_t v17 = *(unsigned __int8 *)(*(void *)(a1 + 96) + v5);
      uint64_t v18 = *(void *)(a1 + 5888);
      *(_DWORD *)(a1 + 5900) = v16 + 1;
      *(unsigned char *)(v18 + v16) = 0;
      uint64_t v19 = *(void *)(a1 + 5888);
      uint64_t v20 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v20 + 1;
      *(unsigned char *)(v19 + v20) = 0;
      uint64_t v21 = *(void *)(a1 + 5888);
      uint64_t v22 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v22 + 1;
      *(unsigned char *)(v21 + v22) = v17;
      ++*(_WORD *)(a1 + 4 * v17 + 212);
      int v23 = *(_DWORD *)(a1 + 5900);
      int v24 = *(_DWORD *)(a1 + 5904);
      --*(_DWORD *)(a1 + 180);
      unsigned int v25 = *(_DWORD *)(a1 + 172) + 1;
      *(_DWORD *)(a1 + 172) = v25;
      goto LABEL_25;
    }
LABEL_9:
    uint64_t v6 = (unsigned __int8 *)(*(void *)(a1 + 96) + v5);
    int v7 = *(v6 - 1);
    if (v7 != *v6 || v7 != v6[1] || v7 != v6[2]) {
      goto LABEL_23;
    }
    uint64_t v8 = 0;
    int v9 = v6 + 258;
    while (1)
    {
      uint64_t v10 = &v6[v8];
      if (v7 != v6[v8 + 3])
      {
        int v15 = v10 + 3;
        goto LABEL_38;
      }
      if (v7 != v10[4])
      {
        int v15 = v6 + v8 + 4;
        goto LABEL_38;
      }
      uint64_t v11 = &v6[v8];
      if (v7 != v6[v8 + 5])
      {
        int v15 = v11 + 5;
        goto LABEL_38;
      }
      if (v7 != v11[6])
      {
        int v15 = v6 + v8 + 6;
        goto LABEL_38;
      }
      uint64_t v12 = &v6[v8];
      if (v7 != v6[v8 + 7])
      {
        int v15 = v12 + 7;
        goto LABEL_38;
      }
      if (v7 != v12[8])
      {
        int v15 = v6 + v8 + 8;
        goto LABEL_38;
      }
      uint64_t v13 = &v6[v8];
      if (v7 != v6[v8 + 9]) {
        break;
      }
      unint64_t v14 = v8 + 2;
      v8 += 8;
      if (v14 > 0xF9 || v7 != v13[10])
      {
        int v15 = v6 + v8 + 2;
        goto LABEL_38;
      }
    }
    int v15 = v13 + 9;
LABEL_38:
    unsigned int v28 = v15 - v9 + 258;
    if (v28 < v4) {
      unsigned int v4 = v28;
    }
    *(_DWORD *)(a1 + 160) = v4;
    uint64_t v16 = *(unsigned int *)(a1 + 5900);
    BOOL v29 = v4 >= 3;
    unsigned __int8 v30 = v4 - 3;
    if (!v29) {
      goto LABEL_24;
    }
    uint64_t v31 = *(void *)(a1 + 5888);
    *(_DWORD *)(a1 + 5900) = v16 + 1;
    *(unsigned char *)(v31 + v16) = 1;
    uint64_t v32 = *(void *)(a1 + 5888);
    uint64_t v33 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v33 + 1;
    *(unsigned char *)(v32 + v33) = 0;
    uint64_t v34 = *(void *)(a1 + 5888);
    uint64_t v35 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v35 + 1;
    *(unsigned char *)(v34 + v35) = v30;
    uint64_t v36 = a1 + 4 * byte_23C228170[v30];
    ++*(_WORD *)(v36 + 1240);
    ++*(_WORD *)(a1 + 2504);
    int v23 = *(_DWORD *)(a1 + 5900);
    int v24 = *(_DWORD *)(a1 + 5904);
    LODWORD(v36) = *(_DWORD *)(a1 + 160);
    *(_DWORD *)(a1 + 180) -= v36;
    unsigned int v25 = *(_DWORD *)(a1 + 172) + v36;
    *(_DWORD *)(a1 + 172) = v25;
    *(_DWORD *)(a1 + 160) = 0;
LABEL_25:
    if (v23 == v24)
    {
      uint64_t v26 = *(void *)(a1 + 152);
      size_t v27 = v26 < 0 ? 0 : (const void *)(*(void *)(a1 + 96) + v26);
      sub_23C21F7CC((int *)a1, v27, v25 - v26, 0);
      *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
      sub_23C21EBDC(*(void *)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32)) {
        return 0;
      }
    }
  }
  *(_DWORD *)(a1 + 5932) = 0;
  if (a2 != 4)
  {
    if (!*(_DWORD *)(a1 + 5900)) {
      return 1;
    }
    uint64_t v39 = *(void *)(a1 + 152);
    uint64_t v40 = v39 < 0 ? 0 : (const void *)(*(void *)(a1 + 96) + v39);
    sub_23C21F7CC((int *)a1, v40, *(unsigned int *)(a1 + 172) - v39, 0);
    *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
    sub_23C21EBDC(*(void *)a1);
    return *(_DWORD *)(*(void *)a1 + 32) != 0;
  }
  uint64_t v37 = *(void *)(a1 + 152);
  if (v37 < 0) {
    uint64_t v38 = 0;
  }
  else {
    uint64_t v38 = (const void *)(*(void *)(a1 + 96) + v37);
  }
  sub_23C21F7CC((int *)a1, v38, *(unsigned int *)(a1 + 172) - v37, 1);
  *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
  sub_23C21EBDC(*(void *)a1);
  if (*(_DWORD *)(*(void *)a1 + 32)) {
    return 3;
  }
  else {
    return 2;
  }
}

int deflateCopy(z_streamp dest, z_streamp source)
{
  BOOL v4 = sub_23C21ED08(source);
  int result = -2;
  if (dest && !v4)
  {
    state = source->state;
    long long v7 = *(_OWORD *)&source->msg;
    long long v9 = *(_OWORD *)&source->opaque;
    long long v8 = *(_OWORD *)&source->adler;
    *(_OWORD *)&dest->zalloc = *(_OWORD *)&source->zalloc;
    *(_OWORD *)&dest->opaque = v9;
    long long v10 = *(_OWORD *)&source->total_in;
    long long v11 = *(_OWORD *)&source->avail_out;
    *(_OWORD *)&dest->next_in = *(_OWORD *)&source->next_in;
    *(_OWORD *)&dest->uLong total_in = v10;
    *(_OWORD *)&dest->uLong adler = v8;
    *(_OWORD *)&dest->unint64_t avail_out = v11;
    *(_OWORD *)&dest->msg = v7;
    uint64_t v12 = (internal_state *)((uint64_t (*)(voidpf, uint64_t, uint64_t))dest->zalloc)(dest->opaque, 1, 5952);
    if (v12)
    {
      uint64_t v13 = v12;
      dest->state = v12;
      memcpy(v12, state, 0x1740uLL);
      *(void *)uint64_t v13 = dest;
      *((void *)v13 + 12) = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v13 + 20), 2);
      *((void *)v13 + 14) = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v13 + 20), 2);
      *((void *)v13 + 15) = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v13 + 33), 2);
      uint64_t v14 = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v13 + 1474), 4);
      *((void *)v13 + 2) = v14;
      int v15 = (void *)*((void *)v13 + 12);
      if (v15 && *((void *)v13 + 14) && *((void *)v13 + 15) && v14)
      {
        memcpy(v15, *((const void **)state + 12), (2 * *((_DWORD *)v13 + 20)));
        memcpy(*((void **)v13 + 14), *((const void **)state + 14), 2 * *((unsigned int *)v13 + 20));
        memcpy(*((void **)v13 + 15), *((const void **)state + 15), 2 * *((unsigned int *)v13 + 33));
        memcpy(*((void **)v13 + 2), *((const void **)state + 2), *((unsigned int *)v13 + 6));
        int result = 0;
        uint64_t v16 = *((void *)v13 + 2);
        *((void *)v13 + 4) = v16 + *((void *)state + 4) - *((void *)state + 2);
        *((void *)v13 + 736) = v16 + *((unsigned int *)v13 + 1474);
        *((void *)v13 + 363) = (char *)v13 + 212;
        *((void *)v13 + 366) = (char *)v13 + 2504;
        *((void *)v13 + 369) = (char *)v13 + 2748;
        return result;
      }
      deflateEnd(dest);
    }
    return -4;
  }
  return result;
}

uint64_t sub_23C2234B0(uint64_t a1, int a2)
{
  while (1)
  {
    if (*(_DWORD *)(a1 + 180) > 0x105u) {
      goto LABEL_6;
    }
    sub_23C21F478(a1);
    unsigned int v4 = *(_DWORD *)(a1 + 180);
    if (!a2 && v4 < 0x106) {
      return 0;
    }
    if (!v4) {
      break;
    }
    if (v4 < 3) {
      goto LABEL_8;
    }
LABEL_6:
    unsigned int v5 = *(_DWORD *)(a1 + 172);
    unsigned int v6 = ((*(_DWORD *)(a1 + 128) << *(_DWORD *)(a1 + 144)) ^ *(unsigned __int8 *)(*(void *)(a1 + 96) + v5 + 2)) & *(_DWORD *)(a1 + 140);
    *(_DWORD *)(a1 + 128) = v6;
    uint64_t v7 = *(void *)(a1 + 120);
    unsigned int v8 = *(unsigned __int16 *)(v7 + 2 * v6);
    *(_WORD *)(*(void *)(a1 + 112) + 2 * (*(_DWORD *)(a1 + 88) & v5)) = v8;
    *(_WORD *)(v7 + 2 * v6) = v5;
    if (!v8 || v5 - v8 > *(_DWORD *)(a1 + 80) - 262)
    {
LABEL_8:
      unsigned int v9 = *(_DWORD *)(a1 + 160);
      goto LABEL_10;
    }
    unsigned int v9 = sub_23C21F27C(a1, v8);
    *(_DWORD *)(a1 + 160) = v9;
LABEL_10:
    if (v9 < 3)
    {
      uint64_t v34 = *(unsigned __int8 *)(*(void *)(a1 + 96) + *(unsigned int *)(a1 + 172));
      uint64_t v35 = *(void *)(a1 + 5888);
      uint64_t v36 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v36 + 1;
      *(unsigned char *)(v35 + v36) = 0;
      uint64_t v37 = *(void *)(a1 + 5888);
      uint64_t v38 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v38 + 1;
      *(unsigned char *)(v37 + v38) = 0;
      uint64_t v39 = *(void *)(a1 + 5888);
      uint64_t v40 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v40 + 1;
      *(unsigned char *)(v39 + v40) = v34;
      ++*(_WORD *)(a1 + 4 * v34 + 212);
      int v21 = *(_DWORD *)(a1 + 5900);
      int v22 = *(_DWORD *)(a1 + 5904);
      --*(_DWORD *)(a1 + 180);
      unsigned int v33 = *(_DWORD *)(a1 + 172) + 1;
LABEL_19:
      *(_DWORD *)(a1 + 172) = v33;
      goto LABEL_21;
    }
    int v10 = *(_DWORD *)(a1 + 172) - *(_DWORD *)(a1 + 176);
    uint64_t v11 = *(void *)(a1 + 5888);
    uint64_t v12 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v12 + 1;
    *(unsigned char *)(v11 + v12) = v10;
    uint64_t v13 = *(void *)(a1 + 5888);
    uint64_t v14 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v14 + 1;
    *(unsigned char *)(v13 + v14) = BYTE1(v10);
    uint64_t v15 = *(void *)(a1 + 5888);
    uint64_t v16 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v16 + 1;
    *(unsigned char *)(v15 + v16) = v9 - 3;
    unsigned __int16 v17 = v10 - 1;
    uint64_t v18 = a1 + 4 * byte_23C228170[(v9 - 3)];
    ++*(_WORD *)(v18 + 1240);
    unsigned __int16 v19 = (v17 >> 7) + 256;
    if ((v17 & 0xFF00) == 0) {
      unsigned __int16 v19 = v17;
    }
    uint64_t v20 = a1 + 4 * byte_23C227F70[v19];
    ++*(_WORD *)(v20 + 2504);
    int v21 = *(_DWORD *)(a1 + 5900);
    int v22 = *(_DWORD *)(a1 + 5904);
    unsigned int v23 = *(_DWORD *)(a1 + 160);
    unsigned int v24 = *(_DWORD *)(a1 + 180) - v23;
    *(_DWORD *)(a1 + 180) = v24;
    if (v23 <= *(_DWORD *)(a1 + 192) && v24 >= 3)
    {
      *(_DWORD *)(a1 + 160) = v23 - 1;
      uint64_t v25 = *(void *)(a1 + 96);
      int v27 = *(_DWORD *)(a1 + 140);
      int v26 = *(_DWORD *)(a1 + 144);
      uint64_t v29 = *(void *)(a1 + 112);
      uint64_t v28 = *(void *)(a1 + 120);
      int v30 = *(_DWORD *)(a1 + 88);
      unsigned int v31 = *(_DWORD *)(a1 + 128);
      unsigned int v32 = v23 - 2;
      unsigned int v33 = *(_DWORD *)(a1 + 172) + 1;
      do
      {
        *(_DWORD *)(a1 + 172) = v33;
        unsigned int v31 = ((v31 << v26) ^ *(unsigned __int8 *)(v25 + v33 + 2)) & v27;
        *(_DWORD *)(a1 + 128) = v31;
        *(_WORD *)(v29 + 2 * (v30 & v33)) = *(_WORD *)(v28 + 2 * v31);
        *(_WORD *)(v28 + 2 * v31) = v33;
        *(_DWORD *)(a1 + 160) = v32--;
        ++v33;
      }
      while (v32 != -1);
      goto LABEL_19;
    }
    unsigned int v33 = *(_DWORD *)(a1 + 172) + v23;
    *(_DWORD *)(a1 + 172) = v33;
    *(_DWORD *)(a1 + 160) = 0;
    uint64_t v41 = *(void *)(a1 + 96);
    int v42 = *(unsigned __int8 *)(v41 + v33);
    *(_DWORD *)(a1 + 128) = v42;
    *(_DWORD *)(a1 + 128) = ((v42 << *(_DWORD *)(a1 + 144)) ^ *(unsigned __int8 *)(v41 + v33 + 1)) & *(_DWORD *)(a1 + 140);
LABEL_21:
    if (v21 == v22)
    {
      uint64_t v43 = *(void *)(a1 + 152);
      unsigned int v44 = v43 < 0 ? 0 : (const void *)(*(void *)(a1 + 96) + v43);
      sub_23C21F7CC((int *)a1, v44, v33 - v43, 0);
      *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
      sub_23C21EBDC(*(void *)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32)) {
        return 0;
      }
    }
  }
  uint64_t v46 = *(unsigned int *)(a1 + 172);
  if (v46 >= 2) {
    int v47 = 2;
  }
  else {
    int v47 = *(_DWORD *)(a1 + 172);
  }
  *(_DWORD *)(a1 + 5932) = v47;
  if (a2 == 4)
  {
    uint64_t v48 = *(void *)(a1 + 152);
    if (v48 < 0) {
      unsigned int v49 = 0;
    }
    else {
      unsigned int v49 = (const void *)(*(void *)(a1 + 96) + v48);
    }
    sub_23C21F7CC((int *)a1, v49, v46 - v48, 1);
    *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
    sub_23C21EBDC(*(void *)a1);
    if (*(_DWORD *)(*(void *)a1 + 32)) {
      return 3;
    }
    else {
      return 2;
    }
  }
  else
  {
    if (*(_DWORD *)(a1 + 5900))
    {
      uint64_t v50 = *(void *)(a1 + 152);
      BOOL v51 = v50 < 0 ? 0 : (const void *)(*(void *)(a1 + 96) + v50);
      sub_23C21F7CC((int *)a1, v51, v46 - v50, 0);
      *(void *)(a1 + 152) = *(unsigned int *)(a1 + 172);
      sub_23C21EBDC(*(void *)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32)) {
        return 0;
      }
    }
    return 1;
  }
}

int inflateBackInit_(z_streamp strm, int windowBits, unsigned __int8 *window, const char *version, int stream_size)
{
  if (!version) {
    return -6;
  }
  int result = -6;
  if (stream_size == 112 && *version == 49)
  {
    int result = -2;
    if ((windowBits - 16) >= 0xFFFFFFF8 && strm && window)
    {
      strm->msg = 0;
      zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))strm->zalloc;
      if (!zalloc)
      {
        zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))sub_23C21E978;
        strm->zalloc = (alloc_func)sub_23C21E978;
        strm->opaque = 0;
      }
      if (!strm->zfree) {
        strm->zfree = (free_func)sub_23C2214A8;
      }
      uint64_t v10 = zalloc(strm->opaque, 1, 7160);
      if (v10)
      {
        uint64_t v11 = v10;
        int result = 0;
        strm->state = (internal_state *)v11;
        *(_DWORD *)(v11 + 28) = 0x8000;
        *(_DWORD *)(v11 + 56) = windowBits;
        *(_DWORD *)(v11 + 60) = 1 << windowBits;
        *(void *)(v11 + 64) = 0;
        *(void *)(v11 + 72) = window;
      }
      else
      {
        return -4;
      }
    }
  }
  return result;
}

int inflateBack(z_streamp strm, in_func in, void *in_desc, out_func out, void *out_desc)
{
  if (!strm) {
    return -2;
  }
  z_streamp v5 = strm;
  state = strm->state;
  if (!state) {
    return -2;
  }
  unsigned int v8 = in_desc;
  strm->msg = 0;
  *((void *)state + 1) = 16191;
  *((_DWORD *)state + 16) = 0;
  __src = strm->next_in;
  if (__src) {
    uInt avail_in = strm->avail_in;
  }
  else {
    uInt avail_in = 0;
  }
  unint64_t v11 = 0;
  LODWORD(v12) = 0;
  next_out = (Bytef *)*((void *)state + 9);
  uLong v115 = (char *)state + 1368;
  LODWORD(v14) = *((_DWORD *)state + 15);
  int v15 = 16191;
  while (2)
  {
    switch(v15)
    {
      case 16191:
        if (*((_DWORD *)state + 3))
        {
          v11 >>= v12 & 7;
          LODWORD(v12) = v12 & 0xFFFFFFF8;
          int v16 = 16208;
          goto LABEL_55;
        }
        if (v12 < 3)
        {
          if (!avail_in)
          {
            uInt avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
            if (!avail_in) {
              goto LABEL_204;
            }
          }
          --avail_in;
          uint64_t v34 = (unsigned __int8 *)__src;
          __src = (char *)__src + 1;
          v11 += (unint64_t)*v34 << v12;
          LODWORD(v12) = v12 + 8;
        }
        *((_DWORD *)state + 3) = v11 & 1;
        int v35 = 16193;
        switch((v11 >> 1) & 3)
        {
          case 1u:
            *((void *)state + 13) = &unk_23C226D2E;
            *((void *)state + 14) = &unk_23C22752E;
            int v35 = 16200;
            *((void *)state + 15) = 0x500000009;
            break;
          case 2u:
            int v35 = 16196;
            break;
          case 3u:
            v5->msg = "invalid block type";
            int v35 = 16209;
            break;
          default:
            break;
        }
        *((_DWORD *)state + 2) = v35;
        v11 >>= 3;
        LODWORD(v12) = v12 - 3;
        goto LABEL_186;
      case 16192:
      case 16194:
      case 16195:
      case 16197:
      case 16198:
      case 16199:
        goto LABEL_210;
      case 16193:
        v11 >>= v12 & 7;
        uint64_t v12 = v12 & 0xFFFFFFF8;
        if (v12 > 0x1F) {
          goto LABEL_37;
        }
        uint64_t v17 = 0;
        do
        {
          if (!avail_in)
          {
            uInt avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
            if (!avail_in) {
              goto LABEL_204;
            }
          }
          --avail_in;
          uint64_t v18 = (unsigned __int8 *)__src;
          __src = (char *)__src + 1;
          v11 += (unint64_t)*v18 << (v12 + v17);
          v17 += 8;
        }
        while ((unint64_t)(v12 + v17 - 8) < 0x18);
        LODWORD(v12) = v12 + v17;
LABEL_37:
        if (((v11 >> 16) ^ 0xFFFF) != (unsigned __int16)v11)
        {
          uint64_t v28 = "invalid stored block lengths";
          goto LABEL_54;
        }
        uInt v29 = (unsigned __int16)v11;
        *((_DWORD *)state + 23) = (unsigned __int16)v11;
        if (!(_WORD)v11)
        {
LABEL_51:
          unint64_t v11 = 0;
          LODWORD(v12) = 0;
          *((_DWORD *)state + 2) = 16191;
          goto LABEL_186;
        }
        while (1)
        {
          if (!avail_in)
          {
            uInt avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
            if (!avail_in) {
              goto LABEL_204;
            }
          }
          if (!v14)
          {
            next_out = (Bytef *)*((void *)state + 9);
            uint64_t v14 = *((unsigned int *)state + 15);
            *((_DWORD *)state + 16) = v14;
            if (((unsigned int (*)(void *, Bytef *, uint64_t))out)(out_desc, next_out, v14)) {
              goto LABEL_205;
            }
          }
          if (v29 >= avail_in) {
            unsigned int v30 = avail_in;
          }
          else {
            unsigned int v30 = v29;
          }
          if (v30 >= v14) {
            size_t v31 = v14;
          }
          else {
            size_t v31 = v30;
          }
          memcpy(next_out, __src, v31);
          avail_in -= v31;
          __src = (char *)__src + v31;
          LODWORD(v14) = v14 - v31;
          next_out += v31;
          int v32 = *((_DWORD *)state + 23);
          uInt v29 = v32 - v31;
          BOOL v33 = v32 == v31;
          unsigned int v8 = in_desc;
          *((_DWORD *)state + 23) = v29;
          if (v33) {
            goto LABEL_51;
          }
        }
      case 16196:
        if (v12 > 0xD) {
          goto LABEL_23;
        }
        uint64_t v19 = 0;
        break;
      case 16200:
        goto LABEL_67;
      default:
        if (v15 == 16208)
        {
          unsigned int v107 = *((_DWORD *)state + 15);
          if (v107 <= v14)
          {
            int result = 1;
          }
          else if (((unsigned int (*)(void *, void, void))out)(out_desc, *((void *)state + 9), v107 - v14))
          {
            int result = -5;
          }
          else
          {
            int result = 1;
          }
        }
        else if (v15 == 16209)
        {
          int result = -3;
        }
        else
        {
LABEL_210:
          int result = -2;
        }
        goto LABEL_206;
    }
    do
    {
      if (!avail_in)
      {
        uInt avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
        if (!avail_in)
        {
LABEL_204:
          __src = 0;
          goto LABEL_205;
        }
      }
      --avail_in;
      uint64_t v20 = (unsigned __int8 *)__src;
      __src = (char *)__src + 1;
      v11 += (unint64_t)*v20 << (v12 + v19);
      v19 += 8;
    }
    while ((unint64_t)v12 + v19 - 8 < 6);
    LODWORD(v12) = v12 + v19;
LABEL_23:
    unsigned int v21 = v11 & 0x1F;
    unsigned int v22 = (v11 >> 5) & 0x1F;
    *((_DWORD *)state + 33) = v21 + 257;
    *((_DWORD *)state + 34) = v22 + 1;
    unsigned int v23 = ((v11 >> 10) & 0xF) + 4;
    *((_DWORD *)state + 32) = v23;
    v11 >>= 14;
    LODWORD(v12) = v12 - 14;
    if (v21 > 0x1D || v22 >= 0x1E)
    {
      uint64_t v28 = "too many length or distance symbols";
      goto LABEL_54;
    }
    int v24 = 0;
    *((_DWORD *)state + 35) = 0;
    do
    {
      if (v12 <= 2)
      {
        if (!avail_in)
        {
          uInt avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
          if (!avail_in) {
            goto LABEL_204;
          }
          int v24 = *((_DWORD *)state + 35);
          unsigned int v23 = *((_DWORD *)state + 32);
        }
        --avail_in;
        uint64_t v25 = (unsigned __int8 *)__src;
        __src = (char *)__src + 1;
        v11 += (unint64_t)*v25 << v12;
        LODWORD(v12) = v12 + 8;
      }
      uint64_t v26 = (v24 + 1);
      int v27 = (char *)state + 2 * word_23C226D08[v24];
      *((_DWORD *)state + 35) = v26;
      *((_WORD *)v27 + 76) = v11 & 7;
      v11 >>= 3;
      LODWORD(v12) = v12 - 3;
      int v24 = v26;
    }
    while (v26 < v23);
    if (v26 <= 0x12)
    {
      do
        *((_WORD *)state + word_23C226D08[v26++] + 76) = 0;
      while (v26 != 19);
      *((_DWORD *)state + 35) = 19;
    }
    *((void *)state + 18) = v115;
    *((void *)state + 13) = v115;
    *((_DWORD *)state + 30) = 7;
    if (sub_23C21AAA0(0, (uint64_t)state + 152, 0x13u, (char **)state + 18, (unsigned int *)state + 30, (_WORD *)state + 396, 0))
    {
      uint64_t v28 = "invalid code lengths set";
      goto LABEL_54;
    }
    *((_DWORD *)state + 35) = 0;
    if (*((_DWORD *)state + 34) + *((_DWORD *)state + 33))
    {
      uint64_t v114 = out;
      do
      {
        uint64_t v55 = *((void *)state + 13);
        int v56 = *((_DWORD *)state + 30);
        uint64_t v57 = v55 + 4 * (v11 & ~(-1 << v56));
        unsigned __int8 v58 = *(unsigned char *)v57 - (*(unsigned char *)(v57 + 1) & ((char)(8 * *(unsigned char *)(v57 + 1)) >> 7) & 0xF);
        if (v12 >= v58)
        {
          int v61 = (*(unsigned char *)v57
                                - (*(unsigned char *)(v57 + 1) & ((char)(8 * *(unsigned char *)(v57 + 1)) >> 7) & 0xF));
        }
        else
        {
          uint64_t v59 = 0;
          do
          {
            if (!avail_in)
            {
              uInt avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
              if (!avail_in) {
                goto LABEL_204;
              }
              uint64_t v55 = *((void *)state + 13);
              int v56 = *((_DWORD *)state + 30);
            }
            --avail_in;
            int v60 = (unsigned __int8 *)__src;
            __src = (char *)__src + 1;
            v11 += (unint64_t)*v60 << (v12 + v59);
            uint64_t v57 = v55 + 4 * (v11 & ~(-1 << v56));
            unsigned __int8 v58 = *(unsigned char *)v57 - (*(unsigned char *)(v57 + 1) & ((char)(8 * *(unsigned char *)(v57 + 1)) >> 7) & 0xF);
            v59 += 8;
          }
          while ((unint64_t)v12 + v59 < v58);
          int v61 = (*(unsigned char *)v57
                                - (*(unsigned char *)(v57 + 1) & ((char)(8 * *(unsigned char *)(v57 + 1)) >> 7) & 0xF));
          LODWORD(v12) = v12 + v59;
        }
        unsigned int v62 = *(unsigned __int16 *)(v57 + 2);
        if (v62 > 0xF)
        {
          if (v62 == 16)
          {
            unint64_t v71 = (v61 + 2);
            if (v12 < v71)
            {
              int v111 = v61;
              uint64_t v72 = 0;
              do
              {
                if (!avail_in)
                {
                  uInt avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                  if (!avail_in) {
                    goto LABEL_204;
                  }
                }
                --avail_in;
                uint64_t v73 = (unsigned __int8 *)__src;
                __src = (char *)__src + 1;
                v11 += (unint64_t)*v73 << (v12 + v72);
                v72 += 8;
              }
              while ((unint64_t)v12 + v72 < v71);
              LODWORD(v12) = v12 + v72;
              out = v114;
              int v61 = v111;
            }
            v11 >>= v58;
            LODWORD(v12) = v12 - v61;
            int v74 = *((_DWORD *)state + 35);
            if (!v74)
            {
              int v79 = "invalid bit length repeat";
LABEL_183:
              v5->msg = (char *)v79;
              int v54 = 16209;
              goto LABEL_184;
            }
            __int16 v69 = *((_WORD *)state + (v74 - 1) + 76);
            int v70 = (v11 & 3) + 3;
            v11 >>= 2;
            LODWORD(v12) = v12 - 2;
            unsigned int v8 = in_desc;
          }
          else
          {
            int v110 = v61;
            if (v62 == 17)
            {
              unint64_t v66 = (v61 + 3);
              if (v12 < v66)
              {
                uint64_t v67 = 0;
                do
                {
                  if (!avail_in)
                  {
                    uInt avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                    if (!avail_in) {
                      goto LABEL_204;
                    }
                  }
                  --avail_in;
                  uint64_t v68 = (unsigned __int8 *)__src;
                  __src = (char *)__src + 1;
                  v11 += (unint64_t)*v68 << (v12 + v67);
                  v67 += 8;
                }
                while ((unint64_t)v12 + v67 < v66);
                LODWORD(v12) = v12 + v67;
                out = v114;
              }
              __int16 v69 = 0;
              int v70 = ((v11 >> v58) & 7) + 3;
              unint64_t v11 = v11 >> v58 >> 3;
              LODWORD(v12) = v12 - v110 - 3;
            }
            else
            {
              unint64_t v75 = (v61 + 7);
              if (v12 < v75)
              {
                uint64_t v76 = 0;
                do
                {
                  if (!avail_in)
                  {
                    uInt avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                    if (!avail_in) {
                      goto LABEL_204;
                    }
                  }
                  --avail_in;
                  int v77 = (unsigned __int8 *)__src;
                  __src = (char *)__src + 1;
                  v11 += (unint64_t)*v77 << (v12 + v76);
                  v76 += 8;
                }
                while ((unint64_t)v12 + v76 < v75);
                LODWORD(v12) = v12 + v76;
                out = v114;
              }
              __int16 v69 = 0;
              int v70 = ((v11 >> v58) & 0x7F) + 11;
              unint64_t v11 = v11 >> v58 >> 7;
              LODWORD(v12) = v12 - v110 - 7;
            }
            unsigned int v8 = in_desc;
          }
          unsigned int v64 = *((_DWORD *)state + 35);
          unsigned int v65 = *((_DWORD *)state + 34) + *((_DWORD *)state + 33);
          if (v64 + v70 > v65)
          {
            uint64_t v28 = "invalid bit length repeat";
LABEL_54:
            v5->msg = (char *)v28;
            int v16 = 16209;
LABEL_55:
            *((_DWORD *)state + 2) = v16;
            goto LABEL_186;
          }
          do
          {
            int v78 = (char *)state + 2 * v64++;
            *((_WORD *)v78 + 76) = v69;
            --v70;
          }
          while (v70);
          *((_DWORD *)state + 35) = v64;
        }
        else
        {
          v11 >>= v58;
          LODWORD(v12) = v12 - v61;
          uint64_t v63 = *((unsigned int *)state + 35);
          unsigned int v64 = v63 + 1;
          *((_DWORD *)state + 35) = v63 + 1;
          *((_WORD *)state + v63 + 76) = v62;
          unsigned int v65 = *((_DWORD *)state + 34) + *((_DWORD *)state + 33);
          unsigned int v8 = in_desc;
        }
      }
      while (v64 < v65);
    }
    if (*((_DWORD *)state + 2) == 16209) {
      goto LABEL_186;
    }
    if (!*((_WORD *)state + 332))
    {
      uint64_t v28 = "invalid code -- missing end-of-block";
      goto LABEL_54;
    }
    if (sub_23C21E6C0((uint64_t)v5)) {
      goto LABEL_186;
    }
    *((_DWORD *)state + 2) = 16200;
LABEL_67:
    if (avail_in >= 0x19 && v14 > 0x142)
    {
      v5->next_out = next_out;
      v5->unint64_t avail_out = v14;
      v5->next_in = (Bytef *)__src;
      v5->uInt avail_in = avail_in;
      *((void *)state + 10) = v11;
      *((_DWORD *)state + 22) = v12;
      unsigned int v36 = *((_DWORD *)state + 15);
      if (*((_DWORD *)state + 16) < v36) {
        *((_DWORD *)state + 16) = v36 - v14;
      }
      sub_23C21CD38((uint64_t)v5, v36);
      next_out = v5->next_out;
      LODWORD(v14) = v5->avail_out;
      __src = v5->next_in;
      uInt avail_in = v5->avail_in;
      unint64_t v11 = *((void *)state + 10);
      LODWORD(v12) = *((_DWORD *)state + 22);
      goto LABEL_186;
    }
    uint64_t v37 = *((void *)state + 13);
    int v38 = *((_DWORD *)state + 30);
    uint64_t v39 = v37 + 4 * (v11 & ~(-1 << v38));
    int v40 = *(unsigned __int8 *)(v39 + 1);
    unsigned __int8 v41 = *(unsigned char *)v39 - (v40 & (v40 << 27 >> 31) & 0xF);
    unint64_t v113 = out;
    if (v12 >= v41)
    {
      int v44 = (*(unsigned char *)v39 - (v40 & (v40 << 27 >> 31) & 0xF));
    }
    else
    {
      uint64_t v42 = 0;
      do
      {
        if (!avail_in)
        {
          uInt avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
          if (!avail_in) {
            goto LABEL_204;
          }
          uint64_t v37 = *((void *)state + 13);
          int v38 = *((_DWORD *)state + 30);
        }
        --avail_in;
        uint64_t v43 = (unsigned __int8 *)__src;
        __src = (char *)__src + 1;
        v11 += (unint64_t)*v43 << (v12 + v42);
        uint64_t v39 = v37 + 4 * (v11 & ~(-1 << v38));
        int v40 = *(unsigned __int8 *)(v39 + 1);
        unsigned __int8 v41 = *(unsigned char *)v39 - (v40 & (v40 << 27 >> 31) & 0xF);
        v42 += 8;
      }
      while ((unint64_t)v12 + v42 < v41);
      int v44 = (*(unsigned char *)v39 - (v40 & (v40 << 27 >> 31) & 0xF));
      LODWORD(v12) = v12 + v42;
    }
    int v45 = *(unsigned __int16 *)(v39 + 2);
    if ((v40 - 1) > 0xE) {
      goto LABEL_89;
    }
    unsigned __int8 v109 = v41;
    int v46 = -1 << (v44 + v40);
    uint64_t v47 = v37 + 4 * (((v11 & ~v46) >> v44) + v45);
    int v40 = *(unsigned __int8 *)(v47 + 1);
    unsigned __int8 v48 = *(unsigned char *)v47 - (v40 & ((char)(8 * v40) >> 7) & 0xF);
    if (v44 + v48 <= v12) {
      goto LABEL_88;
    }
    uint64_t v108 = v5;
    uint64_t v49 = 0;
    int v50 = ~v46;
    do
    {
      if (!avail_in)
      {
        uInt avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
        if (!avail_in)
        {
LABEL_211:
          __src = 0;
          int result = -5;
          z_streamp v5 = v108;
          goto LABEL_206;
        }
        uint64_t v37 = *((void *)state + 13);
      }
      --avail_in;
      BOOL v51 = (unsigned __int8 *)__src;
      __src = (char *)__src + 1;
      v11 += (unint64_t)*v51 << (v12 + v49);
      uint64_t v47 = v37 + 4 * (((v11 & v50) >> v44) + v45);
      int v40 = *(unsigned __int8 *)(v47 + 1);
      unsigned __int8 v48 = *(unsigned char *)v47 - (v40 & ((char)(8 * v40) >> 7) & 0xF);
      v49 += 8;
    }
    while ((unint64_t)v12 + v49 < v44 + v48);
    LODWORD(v12) = v12 + v49;
    z_streamp v5 = v108;
LABEL_88:
    int v45 = *(unsigned __int16 *)(v47 + 2);
    v11 >>= v109;
    LODWORD(v12) = v12 - v44;
    unsigned __int8 v41 = v48;
LABEL_89:
    v11 >>= v41;
    *((_DWORD *)state + 23) = v45;
    LODWORD(v12) = v12 - v41;
    out = v113;
    if (v40)
    {
      if ((v40 & 0x20) == 0)
      {
        if ((v40 & 0x40) != 0)
        {
          int v79 = "invalid literal/length code";
          goto LABEL_183;
        }
        unsigned int v52 = v40 & 0xF;
        *((_DWORD *)state + 25) = v52;
        if ((v40 & 0xF) != 0)
        {
          if (v12 < v52)
          {
            do
            {
              if (!avail_in)
              {
                uInt avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                if (!avail_in) {
                  goto LABEL_204;
                }
                unsigned int v52 = *((_DWORD *)state + 25);
              }
              --avail_in;
              BOOL v53 = (unsigned __int8 *)__src;
              __src = (char *)__src + 1;
              v11 += (unint64_t)*v53 << v12;
              LODWORD(v12) = v12 + 8;
            }
            while (v12 < v52);
            int v45 = *((_DWORD *)state + 23);
          }
          *((_DWORD *)state + 23) = v45 + (v11 & ~(-1 << v52));
          v11 >>= v52;
          LODWORD(v12) = v12 - v52;
        }
        uint64_t v80 = *((void *)state + 14);
        int v81 = *((_DWORD *)state + 31);
        uint64_t v82 = v80 + 4 * (v11 & ~(-1 << v81));
        unsigned int v83 = *(unsigned __int8 *)(v82 + 1);
        unsigned __int8 v84 = *(unsigned char *)v82 - (v83 & ((int)(v83 << 27) >> 31) & 0xF);
        if (v12 >= v84)
        {
          int v87 = (*(unsigned char *)v82 - (v83 & ((int)(v83 << 27) >> 31) & 0xF));
        }
        else
        {
          uint64_t v85 = 0;
          do
          {
            if (!avail_in)
            {
              uInt avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
              if (!avail_in) {
                goto LABEL_204;
              }
              uint64_t v80 = *((void *)state + 14);
              int v81 = *((_DWORD *)state + 31);
            }
            --avail_in;
            int v86 = (unsigned __int8 *)__src;
            __src = (char *)__src + 1;
            v11 += (unint64_t)*v86 << (v12 + v85);
            uint64_t v82 = v80 + 4 * (v11 & ~(-1 << v81));
            unsigned int v83 = *(unsigned __int8 *)(v82 + 1);
            unsigned __int8 v84 = *(unsigned char *)v82 - (v83 & ((int)(v83 << 27) >> 31) & 0xF);
            v85 += 8;
          }
          while ((unint64_t)v12 + v85 < v84);
          int v87 = (*(unsigned char *)v82 - (v83 & ((int)(v83 << 27) >> 31) & 0xF));
          LODWORD(v12) = v12 + v85;
        }
        unsigned int v88 = *(unsigned __int16 *)(v82 + 2);
        if (v83 <= 0xF)
        {
          unsigned __int8 v112 = v84;
          int v89 = -1 << (v87 + v83);
          uint64_t v90 = v80 + 4 * (((v11 & ~v89) >> v87) + v88);
          LOBYTE(v83) = *(unsigned char *)(v90 + 1);
          unsigned __int8 v91 = *(unsigned char *)v90 - (v83 & ((char)(8 * v83) >> 7) & 0xF);
          if (v87 + v91 > v12)
          {
            uint64_t v108 = v5;
            uint64_t v92 = 0;
            int v93 = ~v89;
            do
            {
              if (!avail_in)
              {
                uInt avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                if (!avail_in) {
                  goto LABEL_211;
                }
                uint64_t v80 = *((void *)state + 14);
              }
              --avail_in;
              size_t v94 = (unsigned __int8 *)__src;
              __src = (char *)__src + 1;
              v11 += (unint64_t)*v94 << (v12 + v92);
              uint64_t v90 = v80 + 4 * (((v11 & v93) >> v87) + v88);
              LOBYTE(v83) = *(unsigned char *)(v90 + 1);
              unsigned __int8 v91 = *(unsigned char *)v90 - (v83 & ((char)(8 * v83) >> 7) & 0xF);
              v92 += 8;
            }
            while ((unint64_t)v12 + v92 < v87 + v91);
            LODWORD(v12) = v12 + v92;
            z_streamp v5 = v108;
          }
          unsigned int v88 = *(unsigned __int16 *)(v90 + 2);
          v11 >>= v112;
          LODWORD(v12) = v12 - v87;
          unsigned __int8 v84 = v91;
        }
        v11 >>= v84;
        LODWORD(v12) = v12 - v84;
        out = v113;
        if ((v83 & 0x40) != 0)
        {
          int v79 = "invalid distance code";
          goto LABEL_183;
        }
        unsigned int v95 = v83 & 0xF;
        *((_DWORD *)state + 24) = v88;
        *((_DWORD *)state + 25) = v95;
        if ((v83 & 0xF) != 0)
        {
          if (v12 < v95)
          {
            do
            {
              if (!avail_in)
              {
                uInt avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                if (!avail_in) {
                  goto LABEL_204;
                }
                unsigned int v95 = *((_DWORD *)state + 25);
              }
              --avail_in;
              BOOL v96 = (unsigned __int8 *)__src;
              __src = (char *)__src + 1;
              v11 += (unint64_t)*v96 << v12;
              LODWORD(v12) = v12 + 8;
            }
            while (v12 < v95);
            unsigned int v88 = *((_DWORD *)state + 24);
          }
          v88 += v11 & ~(-1 << v95);
          *((_DWORD *)state + 24) = v88;
          v11 >>= v95;
          LODWORD(v12) = v12 - v95;
        }
        unsigned int v97 = *((_DWORD *)state + 15);
        if (*((_DWORD *)state + 16) >= v97) {
          int v98 = 0;
        }
        else {
          int v98 = v14;
        }
        if (v88 > v97 - v98)
        {
          int v79 = "invalid distance too far back";
          goto LABEL_183;
        }
        do
        {
          uint64_t v99 = *((unsigned int *)state + 15);
          if (v14)
          {
            int v100 = *((_DWORD *)state + 15);
            LODWORD(v99) = v14;
          }
          else
          {
            next_out = (Bytef *)*((void *)state + 9);
            *((_DWORD *)state + 16) = v99;
            if (((unsigned int (*)(void *, Bytef *, uint64_t))v113)(out_desc, next_out, v99)) {
              goto LABEL_205;
            }
            int v100 = *((_DWORD *)state + 15);
          }
          unsigned int v102 = *((_DWORD *)state + 23);
          uint64_t v101 = *((unsigned int *)state + 24);
          uint64_t v103 = (v100 - v101);
          if (v103 >= v99) {
            int v104 = 0;
          }
          else {
            int v104 = v103;
          }
          if (v103 >= v99) {
            uint64_t v103 = -v101;
          }
          int v105 = v99 - v104;
          if ((int)v99 - v104 >= v102) {
            int v105 = *((_DWORD *)state + 23);
          }
          *((_DWORD *)state + 23) = v102 - v105;
          int v106 = v105;
          do
          {
            Bytef *next_out = next_out[v103];
            ++next_out;
            --v106;
          }
          while (v106);
          LODWORD(v14) = v99 - v105;
        }
        while (*((_DWORD *)state + 23));
LABEL_185:
        unsigned int v8 = in_desc;
LABEL_186:
        int v15 = *((_DWORD *)state + 2);
        continue;
      }
      int v54 = 16191;
LABEL_184:
      *((_DWORD *)state + 2) = v54;
      goto LABEL_185;
    }
    break;
  }
  if (v14)
  {
LABEL_102:
    *next_out++ = v45;
    LODWORD(v14) = v14 - 1;
    int v54 = 16200;
    goto LABEL_184;
  }
  next_out = (Bytef *)*((void *)state + 9);
  uint64_t v14 = *((unsigned int *)state + 15);
  *((_DWORD *)state + 16) = v14;
  if (!((unsigned int (*)(void *, Bytef *, uint64_t))v113)(out_desc, next_out, v14))
  {
    int v45 = *((_DWORD *)state + 23);
    goto LABEL_102;
  }
LABEL_205:
  int result = -5;
LABEL_206:
  v5->next_in = (Bytef *)__src;
  v5->uInt avail_in = avail_in;
  return result;
}

int inflateBackEnd(z_streamp strm)
{
  if (!strm) {
    return -2;
  }
  if (!strm->state) {
    return -2;
  }
  free_func zfree = strm->zfree;
  if (!zfree) {
    return -2;
  }
  ((void (*)(voidpf))zfree)(strm->opaque);
  int result = 0;
  strm->state = 0;
  return result;
}

int inflatePrime(z_streamp strm, int bits, int value)
{
  if (sub_23C21CCF0(strm)) {
    return -2;
  }
  state = strm->state;
  if (bits < 0)
  {
    int result = 0;
    *((void *)state + 10) = 0;
    *((_DWORD *)state + 22) = 0;
  }
  else
  {
    if (bits > 0x10) {
      return -2;
    }
    int v8 = *((_DWORD *)state + 22);
    if ((v8 + bits) > 0x20) {
      return -2;
    }
    int result = 0;
    *((void *)state + 10) += (value & ~(-1 << bits)) << v8;
    *((_DWORD *)state + 22) = v8 + bits;
  }
  return result;
}

int inflateGetDictionary(z_streamp strm, Bytef *dictionary, uInt *dictLength)
{
  if (sub_23C21CCF0(strm)) {
    return -2;
  }
  state = strm->state;
  if (dictionary)
  {
    int v8 = *((_DWORD *)state + 16);
    if (v8)
    {
      memcpy(dictionary, (const void *)(*((void *)state + 9) + *((unsigned int *)state + 17)), (v8 - *((_DWORD *)state + 17)));
      memcpy(&dictionary[*((unsigned int *)state + 16) - *((unsigned int *)state + 17)], *((const void **)state + 9), *((unsigned int *)state + 17));
    }
  }
  int result = 0;
  if (dictLength) {
    *dictLength = *((_DWORD *)state + 16);
  }
  return result;
}

int inflateSetDictionary(z_streamp strm, const Bytef *dictionary, uInt dictLength)
{
  if (sub_23C21CCF0(strm)) {
    return -2;
  }
  state = strm->state;
  int v8 = *((_DWORD *)state + 2);
  if (*((_DWORD *)state + 4))
  {
    if (v8 != 16190) {
      return -2;
    }
  }
  else if (v8 != 16190)
  {
    goto LABEL_8;
  }
  uLong v9 = adler32(0, 0, 0);
  if (adler32(v9, dictionary, dictLength) != *((void *)state + 4)) {
    return -3;
  }
LABEL_8:
  int result = sub_23C21AFF0((uint64_t)strm, (uint64_t)&dictionary[dictLength], dictLength);
  if (result)
  {
    *((_DWORD *)state + 2) = 16210;
    return -4;
  }
  else
  {
    *((_DWORD *)state + 5) = 1;
  }
  return result;
}

int inflateGetHeader(z_streamp strm, gz_headerp head)
{
  if (sub_23C21CCF0(strm)) {
    return -2;
  }
  state = strm->state;
  if ((*((unsigned char *)state + 16) & 2) == 0) {
    return -2;
  }
  int result = 0;
  *((void *)state + 6) = head;
  head->done = 0;
  return result;
}

int inflateSync(z_streamp strm)
{
  if (sub_23C21CCF0(strm)) {
    return -2;
  }
  state = strm->state;
  uInt avail_in = strm->avail_in;
  if (!avail_in && *((_DWORD *)state + 22) < 8u) {
    return -5;
  }
  if (*((_DWORD *)state + 2) != 16211)
  {
    *((_DWORD *)state + 2) = 16211;
    int v5 = *((_DWORD *)state + 22);
    unint64_t v6 = *((void *)state + 10) << (v5 & 7);
    *((void *)state + 10) = v6;
    if ((v5 & 0xFFFFFFF8) != 0)
    {
      uint64_t v7 = 0;
      unsigned int v8 = -(v5 & 0xFFFFFFF8);
      do
      {
        v14[v7++] = v6;
        v6 >>= 8;
        v8 += 8;
      }
      while (v8);
      *((void *)state + 10) = v6;
    }
    else
    {
      LODWORD(v7) = 0;
    }
    *((_DWORD *)state + 35) = 0;
    *((_DWORD *)state + 22) = 0;
    sub_23C224D58((unsigned int *)state + 35, (uint64_t)v14, v7);
    uInt avail_in = strm->avail_in;
  }
  unsigned int v9 = sub_23C224D58((unsigned int *)state + 35, (uint64_t)strm->next_in, avail_in);
  strm->avail_in -= v9;
  strm->next_in += v9;
  uLong v10 = strm->total_in + v9;
  strm->uLong total_in = v10;
  if (*((_DWORD *)state + 35) != 4) {
    return -3;
  }
  int v11 = *((_DWORD *)state + 6);
  if (v11 == -1) {
    unsigned int v12 = 0;
  }
  else {
    unsigned int v12 = *((_DWORD *)state + 4) & 0xFFFFFFFB;
  }
  *((_DWORD *)state + 4) = v12;
  uLong total_out = strm->total_out;
  inflateReset(strm);
  int result = 0;
  strm->uLong total_in = v10;
  strm->uLong total_out = total_out;
  *((_DWORD *)state + 6) = v11;
  *((_DWORD *)state + 2) = 16191;
  return result;
}

unint64_t sub_23C224D58(unsigned int *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3 = 0;
  unsigned int v4 = *a1;
  if (a3 && v4 <= 3)
  {
    unint64_t v3 = 0;
    do
    {
      if (v4 >= 2) {
        int v5 = 255;
      }
      else {
        int v5 = 0;
      }
      unsigned int v6 = 4 - v4;
      if (*(unsigned char *)(a2 + v3)) {
        unsigned int v6 = 0;
      }
      if (v5 == *(unsigned __int8 *)(a2 + v3)) {
        ++v4;
      }
      else {
        unsigned int v4 = v6;
      }
      ++v3;
    }
    while (v3 < a3 && v4 < 4);
  }
  *a1 = v4;
  return v3;
}

int inflateSyncPoint(z_streamp a1)
{
  if (sub_23C21CCF0(a1)) {
    return -2;
  }
  state = a1->state;
  return *((_DWORD *)state + 2) == 16193 && *((_DWORD *)state + 22) == 0;
}

int inflateCopy(z_streamp dest, z_streamp source)
{
  BOOL v4 = sub_23C21CCF0(source);
  int result = -2;
  if (dest && !v4)
  {
    state = source->state;
    uint64_t v7 = ((uint64_t (*)(voidpf, uint64_t, uint64_t))source->zalloc)(source->opaque, 1, 7160);
    if (!v7) {
      return -4;
    }
    unsigned int v8 = (void *)v7;
    if (*((void *)state + 9))
    {
      unsigned int v9 = (void *)((uint64_t (*)(voidpf, void, uint64_t))source->zalloc)(source->opaque, (1 << *((_DWORD *)state + 14)), 1);
      if (!v9)
      {
        ((void (*)(voidpf, void *))source->zfree)(source->opaque, v8);
        return -4;
      }
    }
    else
    {
      unsigned int v9 = 0;
    }
    long long v10 = *(_OWORD *)&source->next_in;
    long long v11 = *(_OWORD *)&source->avail_out;
    *(_OWORD *)&dest->uLong total_in = *(_OWORD *)&source->total_in;
    *(_OWORD *)&dest->unint64_t avail_out = v11;
    *(_OWORD *)&dest->next_in = v10;
    long long v12 = *(_OWORD *)&source->msg;
    long long v13 = *(_OWORD *)&source->zalloc;
    long long v14 = *(_OWORD *)&source->adler;
    *(_OWORD *)&dest->opaque = *(_OWORD *)&source->opaque;
    *(_OWORD *)&dest->uLong adler = v14;
    *(_OWORD *)&dest->msg = v12;
    *(_OWORD *)&dest->zalloc = v13;
    memcpy(v8, state, 0x1BF8uLL);
    *unsigned int v8 = dest;
    unint64_t v15 = *((void *)state + 13);
    if (v15 >= (unint64_t)state + 1368 && v15 <= (unint64_t)state + 7140)
    {
      int v16 = (char *)v8 + v15 - (void)state;
      uint64_t v17 = (char *)v8 + *((void *)state + 14) - (void)state;
      v8[13] = v16;
      v8[14] = v17;
    }
    v8[18] = (char *)v8 + *((void *)state + 18) - (void)state;
    if (v9) {
      memcpy(v9, *((const void **)state + 9), 1 << *((_DWORD *)state + 14));
    }
    int result = 0;
    v8[9] = v9;
    dest->state = (internal_state *)v8;
  }
  return result;
}

int inflateUndermine(z_streamp a1, int a2)
{
  if (sub_23C21CCF0(a1)) {
    return -2;
  }
  *((_DWORD *)a1->state + 1786) = 1;
  return -3;
}

int inflateValidate(z_streamp a1, int a2)
{
  int result = sub_23C21CCF0(a1);
  if (result) {
    return -2;
  }
  state = a1->state;
  int v6 = *((_DWORD *)state + 4);
  unsigned int v7 = v6 & 0xFFFFFFFB;
  if (v6) {
    int v8 = v6 | 4;
  }
  else {
    int v8 = 0;
  }
  if (!a2) {
    int v8 = v7;
  }
  *((_DWORD *)state + 4) = v8;
  return result;
}

uint64_t inflateMark(z_streamp strm)
{
  if (sub_23C21CCF0(strm)) {
    return -65536;
  }
  state = strm->state;
  uint64_t v4 = (uint64_t)*((int *)state + 1787) << 16;
  int v5 = *((_DWORD *)state + 2);
  if (v5 == 16204)
  {
    unsigned int v6 = *((_DWORD *)state + 1788) - *((_DWORD *)state + 23);
  }
  else if (v5 == 16195)
  {
    unsigned int v6 = *((_DWORD *)state + 23);
  }
  else
  {
    unsigned int v6 = 0;
  }
  return v4 + v6;
}

unint64_t inflateCodesUsed(z_streamp a1)
{
  if (sub_23C21CCF0(a1)) {
    return -1;
  }
  else {
    return (int64_t)(*((void *)a1->state + 18) - (unint64_t)a1->state - 1368) >> 2;
  }
}

uint64_t sub_23C2250BC(uint64_t a1, const void *a2, size_t a3, int a4)
{
  int v7 = *(_DWORD *)(a1 + 5940);
  if (v7 < 14)
  {
    *(_WORD *)(a1 + 5936) |= (_WORD)a4 << v7;
    int v14 = v7 + 3;
  }
  else
  {
    __int16 v8 = *(_WORD *)(a1 + 5936) | (a4 << v7);
    *(_WORD *)(a1 + 5936) = v8;
    uint64_t v9 = *(void *)(a1 + 16);
    uint64_t v10 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v10 + 1;
    *(unsigned char *)(v9 + v10) = v8;
    LOBYTE(v8) = *(unsigned char *)(a1 + 5937);
    uint64_t v11 = *(void *)(a1 + 16);
    uint64_t v12 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v12 + 1;
    *(unsigned char *)(v11 + v12) = v8;
    int v13 = *(_DWORD *)(a1 + 5940);
    *(_WORD *)(a1 + 5936) = (unsigned __int16)a4 >> (16 - v13);
    int v14 = v13 - 13;
  }
  *(_DWORD *)(a1 + 5940) = v14;
  uint64_t result = sub_23C21F768(a1);
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v17 + 1;
  *(unsigned char *)(v16 + v17) = a3;
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v19 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v19 + 1;
  *(unsigned char *)(v18 + v19) = BYTE1(a3);
  uint64_t v20 = *(void *)(a1 + 16);
  uint64_t v21 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v21 + 1;
  *(unsigned char *)(v20 + v21) = ~(_BYTE)a3;
  uint64_t v22 = *(void *)(a1 + 16);
  uint64_t v23 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v23 + 1;
  *(unsigned char *)(v22 + v23) = (unsigned __int16)~(_WORD)a3 >> 8;
  if (a3) {
    uint64_t result = (uint64_t)memcpy((void *)(*(void *)(a1 + 16) + *(void *)(a1 + 40)), a2, a3);
  }
  *(void *)(a1 + 40) += a3;
  return result;
}

uint64_t sub_23C225200(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 5940);
  int v2 = *(unsigned __int16 *)(result + 5936);
  unsigned int v3 = v2 | (2 << v1);
  *(_WORD *)(result + 5936) = v2 | (2 << v1);
  if (v1 < 14)
  {
    int v9 = v1 + 3;
  }
  else
  {
    uint64_t v4 = *(void *)(result + 16);
    uint64_t v5 = *(void *)(result + 40);
    *(void *)(result + 40) = v5 + 1;
    *(unsigned char *)(v4 + v5) = v3;
    char v6 = *(unsigned char *)(result + 5937);
    uint64_t v7 = *(void *)(result + 16);
    uint64_t v8 = *(void *)(result + 40);
    *(void *)(result + 40) = v8 + 1;
    *(unsigned char *)(v7 + v8) = v6;
    LODWORD(v7) = *(_DWORD *)(result + 5940);
    unsigned int v3 = 2u >> (16 - v7);
    *(_WORD *)(result + 5936) = v3;
    int v9 = v7 - 13;
  }
  *(_DWORD *)(result + 5940) = v9;
  if (v9 < 10)
  {
    int v15 = v9 + 7;
  }
  else
  {
    uint64_t v10 = *(void *)(result + 16);
    uint64_t v11 = *(void *)(result + 40);
    *(void *)(result + 40) = v11 + 1;
    *(unsigned char *)(v10 + v11) = v3;
    char v12 = *(unsigned char *)(result + 5937);
    uint64_t v13 = *(void *)(result + 16);
    uint64_t v14 = *(void *)(result + 40);
    *(void *)(result + 40) = v14 + 1;
    *(unsigned char *)(v13 + v14) = v12;
    *(_WORD *)(result + 5936) = 0;
    int v15 = *(_DWORD *)(result + 5940) - 9;
  }
  *(_DWORD *)(result + 5940) = v15;
  return sub_23C21EC74(result);
}

const char *zlibVersion(void)
{
  return "1.2.12";
}

uLong zlibCompileFlags(void)
{
  return 681;
}

const char *__cdecl zError(int a1)
{
  return off_264E38348[2 - a1];
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)sub_23C220CE8(a1, -1, a2);
}

int gzbuffer(gzFile file, unsigned int size)
{
  if (!file) {
    return -1;
  }
  unsigned int have = file[1].have;
  int result = -1;
  BOOL v5 = have == 31153 || have == 7247;
  if (v5 && (size & 0x80000000) == 0 && !LODWORD(file[1].pos))
  {
    int result = 0;
    if (size <= 2) {
      unsigned int v6 = 2;
    }
    else {
      unsigned int v6 = size;
    }
    HIDWORD(file[1].pos) = v6;
  }
  return result;
}

int gzrewind(gzFile file)
{
  if (!file) {
    return -1;
  }
  if (file[1].have != 7247) {
    return -1;
  }
  int pos_high = HIDWORD(file[4].pos);
  BOOL v3 = !pos_high || pos_high == -5;
  if (!v3 || lseek(*(&file[1].have + 1), *(void *)&file[3].have, 0) == -1) {
    return -1;
  }
  sub_23C220FD8((uint64_t)file);
  return 0;
}

uint64_t gzseek_0(gzFile a1, uint64_t a2, int a3)
{
  if (!a1) {
    return -1;
  }
  unsigned int have = a1[1].have;
  if (have != 31153 && have != 7247) {
    return -1;
  }
  int pos_high = HIDWORD(a1[4].pos);
  BOOL v7 = !pos_high || pos_high == -5;
  if (!v7 || a3 > 1) {
    return -1;
  }
  uint64_t v9 = a2;
  if (a3)
  {
    if (LODWORD(a1[4].pos)) {
      uint64_t v9 = (uint64_t)&a1[4].next[a2];
    }
  }
  else
  {
    uint64_t v9 = a2 - a1->pos;
  }
  LODWORD(a1[4].pos) = 0;
  if (have != 7247)
  {
    if ((v9 & 0x8000000000000000) == 0) {
      goto LABEL_36;
    }
    return -1;
  }
  if (HIDWORD(a1[2].pos) == 1 && a1->pos + v9 >= 0)
  {
    uint64_t result = lseek(*(&a1[1].have + 1), v9 - a1->have, 1);
    if (result != -1)
    {
      a1->unsigned int have = 0;
      a1[3].next = 0;
      LODWORD(a1[4].pos) = 0;
      uint64_t v10 = *(void **)&a1[5].have;
      if (v10)
      {
        if (HIDWORD(a1[4].pos) != -4) {
          free(v10);
        }
        *(void *)&a1[5].unsigned int have = 0;
      }
      HIDWORD(a1[4].pos) = 0;
      LODWORD(a1[5].pos) = 0;
      uint64_t result = a1->pos + v9;
      a1->pos = result;
    }
    return result;
  }
  if ((v9 & 0x8000000000000000) == 0) {
    goto LABEL_32;
  }
  v9 += a1->pos;
  if (v9 < 0 || gzrewind(a1) == -1) {
    return -1;
  }
  if (a1[1].have == 7247)
  {
LABEL_32:
    unint64_t v11 = a1->have;
    if (v9 >= v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v9;
    }
    a1->unsigned int have = v11 - v12;
    off_t v13 = a1->pos + v12;
    a1->next += v12;
    a1->pos = v13;
    v9 -= v12;
  }
LABEL_36:
  if (v9)
  {
    LODWORD(a1[4].pos) = 1;
    a1[4].next = (unsigned __int8 *)v9;
  }
  return a1->pos + v9;
}

uint64_t gztell(gzFile a1)
{
  if (!a1) {
    return -1;
  }
  unsigned int have = a1[1].have;
  if (have != 31153 && have != 7247) {
    return -1;
  }
  if (LODWORD(a1[4].pos)) {
    next = a1[4].next;
  }
  else {
    next = 0;
  }
  return (uint64_t)&next[a1->pos];
}

int gzeof(gzFile file)
{
  if (file)
  {
    if (file[1].have == 7247) {
      LODWORD(file) = HIDWORD(file[3].next);
    }
    else {
      LODWORD(file) = 0;
    }
  }
  return (int)file;
}

const char *__cdecl gzerror(const char *file, int *errnum)
{
  if (file)
  {
    int v2 = *((_DWORD *)file + 6);
    if (v2 == 31153 || v2 == 7247)
    {
      if (errnum) {
        *errnum = *((_DWORD *)file + 29);
      }
      if (*((_DWORD *)file + 29) == -4)
      {
        return "out of memory";
      }
      else if (*((void *)file + 15))
      {
        return (const char *)*((void *)file + 15);
      }
      else
      {
        return "";
      }
    }
    else
    {
      return 0;
    }
  }
  return file;
}

void gzclearerr(gzFile file)
{
  if (file)
  {
    unsigned int have = file[1].have;
    if (have != 31153)
    {
      if (have != 7247) {
        return;
      }
      file[3].next = 0;
    }
    BOOL v3 = *(void **)&file[5].have;
    if (v3)
    {
      if (HIDWORD(file[4].pos) != -4) {
        free(v3);
      }
      *(void *)&file[5].unsigned int have = 0;
    }
    HIDWORD(file[4].pos) = 0;
  }
}

z_size_t gzfread(voidp buf, z_size_t size, z_size_t nitems, gzFile file)
{
  if (!file) {
    return 0;
  }
  if (file[1].have == 7247)
  {
    int pos_high = HIDWORD(file[4].pos);
    if (!pos_high || pos_high == -5)
    {
      BOOL v6 = !is_mul_ok(size, nitems);
      if (size && v6)
      {
        sub_23C2214B0((uint64_t)file, -2, "request does not fit in a size_t");
      }
      else
      {
        unint64_t v8 = size * nitems;
        if (v8) {
          return sub_23C21E410((uint64_t)file, (char *)buf, v8) / size;
        }
      }
    }
  }
  return 0;
}

int gzgetc(gzFile file)
{
  if (!file) {
    return -1;
  }
  if (file[1].have != 7247) {
    return -1;
  }
  int pos_high = HIDWORD(file[4].pos);
  if (pos_high && pos_high != -5) {
    return -1;
  }
  if (file->have)
  {
    --file->have;
    next = file->next;
    off_t v4 = file->pos + 1;
    file->next = next + 1;
    file->pos = v4;
    return *next;
  }
  else if (sub_23C21E410((uint64_t)file, (char *)&__dst, 1uLL))
  {
    return __dst;
  }
  else
  {
    return -1;
  }
}

int gzungetc(int c, gzFile file)
{
  if (!file) {
    return -1;
  }
  if (file[1].have != 7247) {
    return -1;
  }
  int pos_high = HIDWORD(file[4].pos);
  if (pos_high && pos_high != -5) {
    return -1;
  }
  if (!LODWORD(file[4].pos))
  {
    if (c < 0) {
      return -1;
    }
LABEL_14:
    uint64_t have = file->have;
    if (have)
    {
      int pos = file[1].pos;
      if (have == 2 * pos)
      {
        sub_23C2214B0((uint64_t)file, -3, "out of room to push characters");
        return -1;
      }
      next = file->next;
      if (next == file[2].next)
      {
        unint64_t v11 = &next[have];
        next += (2 * pos);
        do
        {
          unsigned __int8 v12 = *--v11;
          *--next = v12;
        }
        while (v11 > file[2].next);
        LODWORD(have) = file->have;
      }
      file->uint64_t have = have + 1;
    }
    else
    {
      file->uint64_t have = 1;
      next = &file[2].next[2 * LODWORD(file[1].pos)];
    }
    file->next = next - 1;
    *(next - 1) = c;
    --file->pos;
    HIDWORD(file[3].next) = 0;
    return c;
  }
  LODWORD(file[4].pos) = 0;
  int v6 = sub_23C225918(&file->have, (uint64_t)file[4].next);
  int result = -1;
  if ((c & 0x80000000) == 0 && v6 != -1) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_23C225918(unsigned int *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = a2;
  while (1)
  {
    uint64_t v4 = *a1;
    if (!v4) {
      break;
    }
    if (v2 >= v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = v2;
    }
    *a1 = v4 - v5;
    uint64_t v6 = *((void *)a1 + 2) + v5;
    *((void *)a1 + 1) += v5;
    *((void *)a1 + 2) = v6;
    v2 -= v5;
LABEL_11:
    if (!v2) {
      return 0;
    }
  }
  if (!a1[20] || a1[34])
  {
    uint64_t result = sub_23C21E988((uint64_t)a1);
    if (result == -1) {
      return result;
    }
    goto LABEL_11;
  }
  return 0;
}

char *__cdecl gzgets(gzFile file, char *buf, int len)
{
  uint64_t result = 0;
  if (file)
  {
    if (buf)
    {
      unsigned int v6 = len - 1;
      if (len >= 1)
      {
        if (file[1].have == 7247)
        {
          int pos_high = HIDWORD(file[4].pos);
          if (!pos_high || pos_high == -5)
          {
            if (LODWORD(file[4].pos))
            {
              LODWORD(file[4].pos) = 0;
              int v8 = sub_23C225918(&file->have, (uint64_t)file[4].next);
              uint64_t result = 0;
              if (v8 == -1 || !v6) {
                return result;
              }
              goto LABEL_12;
            }
            unsigned int v6 = len - 1;
            if (len != 1)
            {
LABEL_12:
              unsigned int have = file->have;
              uint64_t v10 = buf;
              while (1)
              {
                if (!have)
                {
                  if (sub_23C21E988((uint64_t)file) == -1) {
                    return 0;
                  }
                  unsigned int have = file->have;
                  if (!file->have) {
                    break;
                  }
                }
                if (have >= v6) {
                  size_t v11 = v6;
                }
                else {
                  size_t v11 = have;
                }
                next = file->next;
                off_t v13 = memchr(next, 10, v11);
                if (v13) {
                  size_t v11 = (v13 - next + 1);
                }
                else {
                  size_t v11 = v11;
                }
                memcpy(v10, next, v11);
                unsigned int have = file->have - v11;
                file->unsigned int have = have;
                off_t v14 = file->pos + v11;
                file->next += v11;
                file->int pos = v14;
                v10 += v11;
                if (!v13)
                {
                  v6 -= v11;
                  if (v6) {
                    continue;
                  }
                }
                goto LABEL_26;
              }
              HIDWORD(file[3].next) = 1;
LABEL_26:
              if (v10 != buf)
              {
                char *v10 = 0;
                return buf;
              }
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

int gzdirect(gzFile file)
{
  if (file)
  {
    gzFile v1 = file;
    if (file[1].have == 7247 && !HIDWORD(file[2].pos) && !file->have) {
      sub_23C21EA50((uint64_t)file);
    }
    LODWORD(file) = v1[2].pos;
  }
  return (int)file;
}

z_size_t gzfwrite(voidpc buf, z_size_t size, z_size_t nitems, gzFile file)
{
  if (!file) {
    return 0;
  }
  if (file[1].have != 31153 || HIDWORD(file[4].pos)) {
    return 0;
  }
  BOOL v5 = !is_mul_ok(size, nitems);
  if (size && v5)
  {
    sub_23C2214B0((uint64_t)file, -2, "request does not fit in a size_t");
    return 0;
  }
  unint64_t v6 = size * nitems;
  if (!v6) {
    return 0;
  }
  return sub_23C221600((uint64_t)file, (char *)buf, v6) / size;
}

int gzputc(gzFile file, int c)
{
  if (!file) {
    return -1;
  }
  if (file[1].have != 31153 || HIDWORD(file[4].pos)) {
    return -1;
  }
  unsigned __int8 v4 = c;
  if (!LODWORD(file[4].pos)
    || (LODWORD(file[4].pos) = 0, int result = sub_23C225CF8((uint64_t)file, (uint64_t)file[4].next), result != -1))
  {
    unsigned int pos = file[1].pos;
    if (pos
      && ((int v6 = file[5].pos) == 0
        ? (unsigned __int8 *)(int v8 = *(unsigned __int8 **)&file[2].have, file[5].next = v8, LODWORD(next) = v8)
        : (next = file[5].next, int v8 = *(unsigned __int8 **)&file[2].have),
          unsigned int v9 = next + v6 - v8,
          pos > v9))
    {
      v8[v9] = v4;
      ++LODWORD(file[5].pos);
      ++file->pos;
      return v4;
    }
    else
    {
      unsigned __int8 __src = v4;
      if (sub_23C221600((uint64_t)file, (char *)&__src, 1uLL) == 1) {
        return v4;
      }
      else {
        return -1;
      }
    }
  }
  return result;
}

uint64_t sub_23C225CF8(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a1 + 136) || (uint64_t result = sub_23C221770(a1, 0), result != -1))
  {
    if (a2)
    {
      for (char i = 0; ; char i = 1)
      {
        uint64_t v6 = *(unsigned int *)(a1 + 40);
        size_t v7 = a2 >= v6 ? v6 : a2;
        if ((i & 1) == 0) {
          bzero(*(void **)(a1 + 48), v7);
        }
        *(_DWORD *)(a1 + 136) = v7;
        *(void *)(a1 + 128) = *(void *)(a1 + 48);
        *(void *)(a1 + 16) += v7;
        uint64_t result = sub_23C221770(a1, 0);
        if (result == -1) {
          break;
        }
        a2 -= v7;
        if (!a2) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

int gzputs(gzFile file, const char *s)
{
  if (!file) {
    return -1;
  }
  if (file[1].have != 31153 || HIDWORD(file[4].pos)) {
    return -1;
  }
  size_t v4 = strlen(s);
  if (v4 >> 31)
  {
    sub_23C2214B0((uint64_t)file, -2, "string length does not fit in int");
    return -1;
  }
  int v5 = v4;
  if (sub_23C221600((uint64_t)file, (char *)s, v4) < v4) {
    return -1;
  }
  else {
    return v5;
  }
}

int gzvprintf(gzFile file, const char *format, va_list va)
{
  if (!file || file[1].have != 31153 || HIDWORD(file[4].pos)) {
    return -2;
  }
  if (!LODWORD(file[1].pos) && sub_23C225F90((uint64_t)file) == -1) {
    return HIDWORD(file[4].pos);
  }
  if (LODWORD(file[4].pos))
  {
    LODWORD(file[4].pos) = 0;
    if (sub_23C225CF8((uint64_t)file, (uint64_t)file[4].next) == -1) {
      return HIDWORD(file[4].pos);
    }
  }
  uint64_t pos_low = LODWORD(file[5].pos);
  if (pos_low)
  {
    next = file[5].next;
  }
  else
  {
    next = *(unsigned __int8 **)&file[2].have;
    file[5].next = next;
  }
  uint64_t v10 = &next[pos_low];
  next[pos_low + (LODWORD(file[1].pos) - 1)] = 0;
  int v11 = vsnprintf((char *)&next[pos_low], LODWORD(file[1].pos), format, va);
  int v4 = v11;
  if (v11)
  {
    unsigned int pos = file[1].pos;
    if (v11 >= pos || v10[pos - 1]) {
      return 0;
    }
    unsigned int v13 = LODWORD(file[5].pos) + v11;
    LODWORD(file[5].pos) = v13;
    file->pos += v11;
    size_t v14 = v13 - pos;
    if (v13 < pos) {
      return v4;
    }
    LODWORD(file[5].pos) = pos;
    if (sub_23C221770((uint64_t)file, 0) != -1)
    {
      memmove(*(void **)&file[2].have, (const void *)(*(void *)&file[2].have + LODWORD(file[1].pos)), v14);
      file[5].next = *(unsigned __int8 **)&file[2].have;
      LODWORD(file[5].pos) = v14;
      return v4;
    }
    return HIDWORD(file[4].pos);
  }
  return v4;
}

uint64_t sub_23C225F90(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc((2 * *(_DWORD *)(a1 + 44)), 0x7A14FE65uLL);
  *(void *)(a1 + 48) = v2;
  if (!v2) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 64))
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 44);
    return result;
  }
  int v4 = malloc_type_malloc(*(unsigned int *)(a1 + 44), 0x4E80A05AuLL);
  *(void *)(a1 + 56) = v4;
  if (!v4)
  {
LABEL_7:
    free(*(void **)(a1 + 48));
LABEL_8:
    sub_23C2214B0(a1, -4, "out of memory");
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = 0;
  if (deflateInit2_((z_streamp)(a1 + 128), *(_DWORD *)(a1 + 88), 8, 31, 8, *(_DWORD *)(a1 + 92), "1.2.12", 112))
  {
    free(*(void **)(a1 + 56));
    goto LABEL_7;
  }
  *(void *)(a1 + 128) = 0;
  int v5 = *(_DWORD *)(a1 + 64);
  int v6 = *(_DWORD *)(a1 + 44);
  *(_DWORD *)(a1 + 40) = v6;
  uint64_t result = 0;
  if (!v5)
  {
    *(_DWORD *)(a1 + 160) = v6;
    uint64_t v7 = *(void *)(a1 + 56);
    *(void *)(a1 + 152) = v7;
    *(void *)(a1 + 8) = v7;
  }
  return result;
}

int gzprintf(gzFile file, const char *format, ...)
{
  va_start(va, format);
  return gzvprintf(file, format, va);
}

int gzsetparams(gzFile file, int level, int strategy)
{
  if (!file) {
    return -2;
  }
  if (file[1].have != 31153 || HIDWORD(file[4].pos)) {
    return -2;
  }
  if (LODWORD(file[3].pos) == level && HIDWORD(file[3].pos) == strategy) {
    return 0;
  }
  if (!LODWORD(file[4].pos)
    || (LODWORD(file[4].pos) = 0, sub_23C225CF8((uint64_t)file, (uint64_t)file[4].next) != -1))
  {
    if (!LODWORD(file[1].pos))
    {
LABEL_15:
      int result = 0;
      LODWORD(file[3].pos) = level;
      HIDWORD(file[3].pos) = strategy;
      return result;
    }
    if (!LODWORD(file[5].pos) || sub_23C221770((uint64_t)file, 5) != -1)
    {
      deflateParams((z_streamp)&file[5].next, level, strategy);
      goto LABEL_15;
    }
  }
  return HIDWORD(file[4].pos);
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

void free(void *a1)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}