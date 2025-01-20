uint64_t sub_1BBB5F58C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int16x8_t *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unsigned char *v13;
  unsigned char *v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int16x8_t *v25;
  uint64_t v26;
  uint64_t i;
  unsigned char *v28;
  int v29;
  uint64_t v30;
  uint64_t j;
  int v32;
  unsigned char *v33;
  uint64_t k;
  int v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  __n128 v39;
  char v40;
  uint64_t m;
  uint64_t n;
  void *v43;
  uint64_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int v57;
  int v58;
  char v59;
  uint64_t result;
  __int32 v61;
  _OWORD *v62;
  _OWORD *v63;
  long long v64;
  long long v65;
  long long v66;
  long long v67;
  long long v68;
  long long v69;
  _OWORD *v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  int16x8_t *v77;
  unsigned char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  int16x8_t *v83;
  int v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t v87;
  unsigned int v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  int v92;
  int16x8_t v93[25];
  _OWORD v94[33];
  unsigned char v95[128];
  unsigned char v96[128];
  unsigned char v97[128];
  unsigned char v98[128];
  _DWORD v99[8];
  uint64_t v100;

  v2 = a1;
  v100 = *MEMORY[0x1E4F143B8];
  v3 = *(void *)(a1 + 2528);
  v4 = *(void *)(a1 + 2536);
  v5 = *(void *)(a1 + 2544);
  v6 = *(int16x8_t **)(a1 + 2552);
  v7 = *(_DWORD *)(a1 + 4);
  v8 = *(void *)(a1 + 216);
  v9 = (16 * *(_DWORD *)a1);
  v10 = *(void *)(v8 + 136);
  v11 = *(_DWORD *)(v8 + 232);
  v12 = *(void *)(v8 + 128) + v9 + (16 * v7 * v11);
  v13 = *(unsigned char **)(a1 + 40);
  LODWORD(v8) = *(_DWORD *)(v8 + 248);
  v89 = v12;
  v91 = v10 + v9 + (8 * v7 * v8);
  v90 = v11;
  v92 = v8;
  v85 = v3;
  v87 = v4;
  v86 = 16;
  v88 = 16;
  v81 = v5;
  v83 = v6;
  v82 = 32;
  v84 = 32;
  v14 = v13;
  if (a2)
  {
    sub_1BBB54730(a1, &v89, (uint64_t)&v85, &v81);
    v14 = *(unsigned char **)(v2 + 40);
  }
  if (v14[3])
  {
    v77 = v6;
    v78 = v13;
    v15 = v13[55];
    v16 = v15 / 6u;
    v17 = v15 % 6u;
    v80 = *(void *)(v2 + 56) + 32;
    if (*(unsigned char *)(v2 + 336))
    {
      v18 = 0;
      v19 = v2;
      v20 = v2 + 498;
      v21 = v16 & 0x1F | (32 * v17);
      do
      {
        v22 = 0;
        v23 = (v18 << 6) & 0x3F80;
        v24 = v5 + 2 * v23 + 16 * (v18 & 1);
        v25 = v93;
        v26 = v24;
        do
        {
          for (i = 0; i != 8; ++i)
            v25->i16[i] = *(_WORD *)(v26 + i * 2);
          ++v25;
          v26 += 32;
          ++v22;
        }
        while (v22 != 8);
        off_1E9F832C8(v93, v95);
        v28 = v97;
        sub_1BBB582F0((uint64_t)v95, v21, v20, 1u, (uint64_t)v97, &v99[v18], (uint64_t)v96);
        off_1E9F832D0(v96, v98);
        v29 = 0;
        v30 = v80 + 2 * v23 + 16 * (v18 & 1);
        do
        {
          for (j = 0; j != 16; j += 2)
            *(_WORD *)(v30 + j) = *(_WORD *)&v28[j];
          v28 += 16;
          v30 += 32;
          ++v29;
        }
        while (v29 != 8);
        v32 = 0;
        v33 = v98;
        do
        {
          for (k = 0; k != 16; k += 2)
            *(_WORD *)(v24 + k) = *(_WORD *)&v33[k];
          v33 += 16;
          v24 += 32;
          ++v32;
        }
        while (v32 != 8);
        ++v18;
      }
      while (v18 != 4);
      v35 = (v99[0] != 0) | (2 * (v99[1] != 0)) | (4 * (v99[2] != 0)) | (8 * (v99[3] != 0));
      v2 = v19;
      v6 = v77;
      v13 = v78;
    }
    else
    {
      v36 = 0;
      v37 = (char *)&unk_1BBB93190 + 128 * (unint64_t)v17;
      v79 = (char *)&unk_1BBB93490 + 128 * (unint64_t)v17;
      do
      {
        v38 = word_1BBB93EA0[v36];
        v39 = (__n128)sub_1BBB59290(v5 + 2 * v38, 16, v93);
        v40 = off_1E9F832D8(v93, v93, v37, (0x8000 << v16 >> 3), (v16 + 15), v39);
        v98[v36] = v40;
        if (v40)
        {
          for (m = 0; m != 64; ++m)
            *(_WORD *)(v80 + 2 * v38 + 2 * (unsigned __int16)word_1BBB9379A[m]) = v93[0].i16[m];
          off_1E9F832E0(v93, v93, v79, v16);
          sub_1BBB58FB8((uint64_t)v93, v5 + 2 * v38, 16);
        }
        ++v36;
      }
      while (v36 != 4);
      v35 = v98[0] | (2 * v98[1]) | (4 * v98[2]) | (8 * v98[3]);
      v6 = v77;
      v13 = v78;
      if (v35)
      {
        for (n = 0; n != 4; ++n)
        {
          if (!v98[n])
          {
            v43 = (void *)(v5 + 2 * word_1BBB93EA0[n]);
            *v43 = 0;
            v43[1] = 0;
            v43[4] = 0;
            v43[5] = 0;
            v43[8] = 0;
            v43[9] = 0;
            v43[12] = 0;
            v43[13] = 0;
            v43[16] = 0;
            v43[17] = 0;
            v43[20] = 0;
            v43[21] = 0;
            v43[24] = 0;
            v43[25] = 0;
            v43[28] = 0;
            v43[29] = 0;
          }
        }
      }
    }
  }
  else
  {
    v35 = sub_1BBB57F9C(v5, *(void *)(v2 + 56) + 32, v5, ((32 * (v13[55] % 6u)) | (v13[55] / 6u) & 0x1F), *(unsigned __int8 *)(v2 + 29));
  }
  v13[52] = v35;
  if (v35) {
    v44 = v5;
  }
  else {
    v44 = 0;
  }
  v45 = *v6;
  v46 = v6[1];
  v47 = v6[3];
  v93[11] = v6[2];
  v93[12] = v47;
  v93[9] = v45;
  v93[10] = v46;
  v48 = v6[4];
  v49 = v6[5];
  v50 = v6[7];
  v93[15] = v6[6];
  v93[16] = v50;
  v93[13] = v48;
  v93[14] = v49;
  v51 = v6[8];
  v52 = v6[9];
  v53 = v6[11];
  v93[19] = v6[10];
  v93[20] = v53;
  v93[17] = v51;
  v93[18] = v52;
  v54 = v6[12];
  v55 = v6[13];
  v56 = v6[15];
  v93[23] = v6[14];
  v93[24] = v56;
  v93[21] = v54;
  v93[22] = v55;
  v57 = (char)v13[55] + *(char *)(*(void *)(v2 + 40) + 56);
  if (v57 >= 51) {
    v58 = 51;
  }
  else {
    v58 = (char)v13[55] + *(char *)(*(void *)(v2 + 40) + 56);
  }
  v59 = byte_1BBB8A5B4[v58 - (v57 & (v57 >> 31))];
  v93[0].i8[1] = (v59 / 6u) & 0x1F | (32 * (v59 % 6u));
  v93[0].i8[0] = *(unsigned char *)(v2 + 28);
  result = sub_1BBB584C4((unsigned __int8 *)v93, *(unsigned __int8 *)(v2 + 29));
  v61 = v93[0].i32[2];
  v13[53] = v93[0].i8[8];
  if (v61)
  {
    v62 = v94;
    *(_OWORD *)(*(void *)(v2 + 56) + 800) = v94[32];
    v63 = *(_OWORD **)(v2 + 56);
    v64 = v94[16];
    v65 = v94[17];
    v66 = v94[19];
    v63[36] = v94[18];
    v63[37] = v66;
    v63[34] = v64;
    v63[35] = v65;
    v67 = v94[20];
    v68 = v94[21];
    v69 = v94[23];
    v63[40] = v94[22];
    v63[41] = v69;
    v63[38] = v67;
    v63[39] = v68;
    v70 = *(_OWORD **)(v2 + 56);
    v71 = v94[24];
    v72 = v94[25];
    v73 = v94[27];
    v70[44] = v94[26];
    v70[45] = v73;
    v70[42] = v71;
    v70[43] = v72;
    v74 = v94[28];
    v75 = v94[29];
    v76 = v94[31];
    v70[48] = v94[30];
    v70[49] = v76;
    v70[46] = v74;
    v70[47] = v75;
  }
  else
  {
    v62 = 0;
  }
  if (v44) {
    result = off_1E9F83378(v85, v86, v44, 16);
  }
  if (v62) {
    return off_1E9F83378(v87, v88, v62, 8);
  }
  return result;
}

uint64_t sub_1BBB5FB64(uint64_t result)
{
  v1 = (unsigned char *)(result + 79);
  if (*(unsigned char *)result)
  {
    __int16 v2 = 0;
    *(unsigned char *)(result + 272) = 4;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 31) = 3;
    *(unsigned char *)(result + 47) = 3;
    *(unsigned char *)(result + 63) = 3;
    *(_WORD *)(result + 24) = 8224;
    *(void *)(result + 32) = 0;
    *(_WORD *)(result + 40) = 8224;
    *(void *)(result + 48) = 0;
    *(_WORD *)(result + 56) = 8224;
    *(void *)(result + 64) = 0;
    *(_WORD *)(result + 72) = 8224;
  }
  else
  {
    *(unsigned char *)(result + 272) = 16;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 8224;
    *(unsigned char *)(result + 31) = 3;
    *(void *)(result + 32) = 0;
    *(_WORD *)(result + 40) = 8224;
    *(unsigned char *)(result + 47) = 3;
    *(void *)(result + 48) = 0;
    *(_WORD *)(result + 56) = 8224;
    *(unsigned char *)(result + 63) = 3;
    *(void *)(result + 64) = 0;
    *(_WORD *)(result + 72) = 8224;
    *(unsigned char *)(result + 79) = 3;
    *(void *)(result + 80) = 0;
    *(_WORD *)(result + 88) = 8224;
    *(unsigned char *)(result + 95) = 3;
    *(void *)(result + 96) = 0;
    *(_WORD *)(result + 104) = 8224;
    *(unsigned char *)(result + 111) = 3;
    *(void *)(result + 112) = 0;
    *(_WORD *)(result + 120) = 8224;
    *(unsigned char *)(result + 127) = 3;
    *(void *)(result + 128) = 0;
    *(_WORD *)(result + 136) = 8224;
    *(unsigned char *)(result + 143) = 3;
    *(void *)(result + 144) = 0;
    *(_WORD *)(result + 152) = 8224;
    *(unsigned char *)(result + 159) = 3;
    *(void *)(result + 160) = 0;
    *(_WORD *)(result + 168) = 8224;
    *(unsigned char *)(result + 175) = 3;
    *(void *)(result + 176) = 0;
    *(_WORD *)(result + 184) = 8224;
    *(unsigned char *)(result + 191) = 3;
    *(void *)(result + 192) = 0;
    *(_WORD *)(result + 200) = 8224;
    *(unsigned char *)(result + 207) = 3;
    *(void *)(result + 208) = 0;
    *(_WORD *)(result + 216) = 8224;
    *(unsigned char *)(result + 223) = 3;
    *(void *)(result + 224) = 0;
    *(_WORD *)(result + 232) = 8224;
    *(unsigned char *)(result + 239) = 3;
    *(void *)(result + 240) = 0;
    *(_WORD *)(result + 248) = 8224;
    *(unsigned char *)(result + 255) = 3;
    *(_WORD *)(result + 264) = 8224;
    v1 = (unsigned char *)(result + 271);
    __int16 v2 = 255;
    *(void *)(result + 256) = 0;
  }
  unsigned char *v1 = 3;
  *(_WORD *)(result + 26) = v2;
  *(_DWORD *)(result + 8) = 3;
  return result;
}

uint64_t sub_1BBB5FCA4(uint64_t result, uint64_t a2, int a3, int a4, int a5, void *a6)
{
  if (a5 < 1)
  {
    int v10 = 0;
    int v9 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    uint64_t v12 = a3;
    do
    {
      if (a4 >= 1)
      {
        for (uint64_t i = 0; i != a4; ++i)
        {
          int v14 = *(unsigned __int8 *)(a2 + i);
          v10 += v14;
          int v15 = *(unsigned __int8 *)(result + i);
          v9 += v15;
          v7 += (v14 * v14);
          v6 += (v15 * v15);
          v8 += (v15 * v14);
        }
      }
      a2 += v12;
      result += v12;
      ++v11;
    }
    while (v11 != a5);
  }
  *a6 = v10;
  a6[1] = v9;
  a6[2] = v7;
  a6[3] = v6;
  a6[4] = v8;
  return result;
}

uint64_t sub_1BBB5FD50(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v13 = a4 * a3;
  if ((a3 & 0xF) != 0) {
    uint64_t result = sub_1BBB5FCA4(a1, a2, a5, a3, a4, &v20);
  }
  else {
    uint64_t result = off_1E9F83278(a1, a2, a5, a3);
  }
  uint64_t v15 = (int)v20;
  uint64_t v16 = v22;
  uint64_t v17 = v23;
  uint64_t v18 = v24;
  if (v22 * v13 - (int)v15 * (uint64_t)(int)v15 >= 1 && v23 * v13 - v21 * (uint64_t)v21 >= 1)
  {
    if (!a6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (a6) {
LABEL_12:
  }
    *a6 = v21;
LABEL_13:
  if (a7) {
    *a7 = v15;
  }
  if (a8) {
    *a8 = v17;
  }
  if (a9) {
    *a9 = v16;
  }
  if (a10) {
    *a10 = v18;
  }
  return result;
}

uint64_t sub_1BBB5FE9C(unsigned int a1, uint64_t a2, _WORD *a3)
{
  v25[9] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  v5 = *(uint8x8_t **)(a2 + 56);
  uint64_t v6 = *(int *)(a2 + 16);
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  int v7 = sub_1BBB55B5C(a1, (_DWORD *)a2, &v24, &v23);
  int v11 = v24;
  if (v7)
  {
    sub_1BBB65CF4((int8x8_t *)v25, (uint64_t)v24, v23, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v8, v9, v10);
  }
  else
  {
    v10.i8[0] = *(unsigned char *)(a2 + 72);
    int16x8_t v12 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    int16x8_t v13 = vdupq_n_s16(*(char *)(a2 + 73));
    int v14 = (int8x8_t *)v25;
    unsigned int v15 = 12;
    uint8x8_t v16 = (uint8x8_t)vdup_lane_s8(v10, 0);
    do
    {
      uint64_t v17 = (uint8x8_t *)((char *)v11 + v6 + v6);
      uint8x8_t v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v6);
      int8x8_t v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)v11 + v6), v16), v12), v13));
      int8x8_t v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v16), v12), v13));
      *int v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v11, v16), v12), v13));
      v14[1] = v20;
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v16), v12), v13));
      v14[3] = v21;
      v14 += 4;
      v15 -= 4;
      int v11 = (uint8x8_t *)((char *)v19 + v6);
    }
    while (v15 > 4);
  }
  uint64_t result = sub_1BBB65FD8(v5, 16, v25, 8, 8);
  *a3 = result;
  return result;
}

uint64_t sub_1BBB5FFF8(unsigned int a1, uint64_t a2, _WORD *a3)
{
  v25[17] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  v5 = *(uint8x8_t **)(a2 + 56);
  uint64_t v6 = *(int *)(a2 + 16);
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  int v7 = sub_1BBB55B5C(a1, (_DWORD *)a2, &v24, &v23);
  int v11 = v24;
  if (v7)
  {
    sub_1BBB65B84((int8x8_t *)v25, (uint64_t)v24, v23, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v8, v9, v10);
  }
  else
  {
    v10.i8[0] = *(unsigned char *)(a2 + 72);
    int16x8_t v12 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    int16x8_t v13 = vdupq_n_s16(*(char *)(a2 + 73));
    int v14 = (int8x8_t *)v25;
    unsigned int v15 = 20;
    uint8x8_t v16 = (uint8x8_t)vdup_lane_s8(v10, 0);
    do
    {
      uint64_t v17 = (uint8x8_t *)((char *)v11 + v6 + v6);
      uint8x8_t v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v6);
      int8x8_t v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)v11 + v6), v16), v12), v13));
      int8x8_t v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v16), v12), v13));
      *int v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v11, v16), v12), v13));
      v14[1] = v20;
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v16), v12), v13));
      v14[3] = v21;
      v14 += 4;
      v15 -= 4;
      int v11 = (uint8x8_t *)((char *)v19 + v6);
    }
    while (v15 > 4);
  }
  uint64_t result = sub_1BBB65FD8(v5, 16, v25, 8, 16);
  *a3 = result;
  return result;
}

uint64_t sub_1BBB60154(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = *(uint8x8_t **)(a2 + 56);
  int v6 = *(_DWORD *)(a2 + 16);
  uint64_t v11 = 0;
  int16x8_t v12 = 0;
  if (sub_1BBB55B5C(a1, (_DWORD *)a2, &v12, &v11)) {
    sub_1BBB65A48(v13, (uint64_t)v12, v11, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  }
  else {
    sub_1BBB659C8(v13, v12, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  }
  uint64_t result = sub_1BBB65E50(v5, 16, (uint8x8_t *)v13, 16, 8);
  *a3 = result;
  return result;
}

uint64_t sub_1BBB6022C(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = *(uint8x8_t **)(a2 + 56);
  int v6 = *(_DWORD *)(a2 + 16);
  uint64_t v11 = 0;
  int16x8_t v12 = 0;
  if (sub_1BBB55B5C(a1, (_DWORD *)a2, &v12, &v11)) {
    sub_1BBB658AC(v13, (uint64_t)v12, v11, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  }
  else {
    sub_1BBB6582C(v13, v12, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  }
  uint64_t result = sub_1BBB65E50(v5, 16, (uint8x8_t *)v13, 16, 16);
  *a3 = result;
  return result;
}

int16x4_t sub_1BBB6030C(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v43[9] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  uint64_t v10 = *(int *)(a2 + 16);
  int16x8_t v11 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v12 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v13 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    uint64_t v14 = *(uint8x8_t **)(a1 + 8 * v9);
    unsigned int v15 = 12;
    uint8x8_t v16 = (int8x8_t *)&v40[8 * v9];
    do
    {
      uint8x8_t v17 = *v14;
      uint8x8_t v18 = (uint8x8_t *)((char *)v14 + v10);
      uint8x8_t v19 = *v18;
      int8x8_t v20 = (uint8x8_t *)((char *)v18 + v10);
      uint8x8_t v21 = *v20;
      uint64_t v22 = (uint8x8_t *)((char *)v20 + v10);
      int8x8_t v23 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v22, v13), v11), v12));
      *uint8x8_t v16 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v17, v13), v11), v12));
      v16[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v13), v11), v12));
      v16[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v21, v13), v11), v12));
      v16[3] = v23;
      v16 += 4;
      v15 -= 4;
      uint64_t v14 = (uint8x8_t *)((char *)v22 + v10);
    }
    while (v15 > 4);
    ++v9;
  }
  while (v9 != 4);
  sub_1BBB67DAC(*(uint8x8_t **)(a2 + 56), v40, v41, v42, v43, 8, a3);
  uint64_t v24 = 0;
  v25.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v26 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  int16x8_t v27 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v28 = (uint8x8_t)vdup_lane_s8(v25, 0);
  do
  {
    v29 = (int8x8_t *)&v40[8 * v24];
    v30 = *(uint8x8_t **)(a1 + 8 * v24 + 32);
    for (unsigned int i = 12; i > 4; i -= 4)
    {
      uint8x8_t v32 = *v30;
      v33 = (uint8x8_t *)((char *)v30 + v10);
      uint8x8_t v34 = *v33;
      v35 = (uint8x8_t *)((char *)v33 + v10);
      uint8x8_t v36 = *v35;
      v37 = (uint8x8_t *)((char *)v35 + v10);
      int8x8_t v38 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v37, v28), v26), v27));
      int8x8_t *v29 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v32, v28), v26), v27));
      v29[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v34, v28), v26), v27));
      v29[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v36, v28), v26), v27));
      v29[3] = v38;
      v29 += 4;
      v30 = (uint8x8_t *)((char *)v37 + v10);
    }
    ++v24;
  }
  while (v24 != 4);
  return sub_1BBB67DAC(*(uint8x8_t **)(a2 + 56), v40, v41, v42, v43, 8, a3 + 1);
}

int16x4_t sub_1BBB60544(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v43[17] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  uint64_t v10 = *(int *)(a2 + 16);
  int16x8_t v11 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v12 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v13 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    uint64_t v14 = *(uint8x8_t **)(a1 + 8 * v9);
    unsigned int v15 = 20;
    uint8x8_t v16 = (int8x8_t *)&v40[16 * v9];
    do
    {
      uint8x8_t v17 = *v14;
      uint8x8_t v18 = (uint8x8_t *)((char *)v14 + v10);
      uint8x8_t v19 = *v18;
      int8x8_t v20 = (uint8x8_t *)((char *)v18 + v10);
      uint8x8_t v21 = *v20;
      uint64_t v22 = (uint8x8_t *)((char *)v20 + v10);
      int8x8_t v23 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v22, v13), v11), v12));
      *uint8x8_t v16 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v17, v13), v11), v12));
      v16[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v13), v11), v12));
      v16[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v21, v13), v11), v12));
      v16[3] = v23;
      v16 += 4;
      v15 -= 4;
      uint64_t v14 = (uint8x8_t *)((char *)v22 + v10);
    }
    while (v15 > 4);
    ++v9;
  }
  while (v9 != 4);
  sub_1BBB67C90(*(uint8x8_t **)(a2 + 56), v40, v41, v42, v43, 8, a3);
  uint64_t v24 = 0;
  v25.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v26 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  int16x8_t v27 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v28 = (uint8x8_t)vdup_lane_s8(v25, 0);
  do
  {
    v29 = (int8x8_t *)&v40[16 * v24];
    v30 = *(uint8x8_t **)(a1 + 8 * v24 + 32);
    for (unsigned int i = 20; i > 4; i -= 4)
    {
      uint8x8_t v32 = *v30;
      v33 = (uint8x8_t *)((char *)v30 + v10);
      uint8x8_t v34 = *v33;
      v35 = (uint8x8_t *)((char *)v33 + v10);
      uint8x8_t v36 = *v35;
      v37 = (uint8x8_t *)((char *)v35 + v10);
      int8x8_t v38 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v37, v28), v26), v27));
      int8x8_t *v29 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v32, v28), v26), v27));
      v29[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v34, v28), v26), v27));
      v29[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v36, v28), v26), v27));
      v29[3] = v38;
      v29 += 4;
      v30 = (uint8x8_t *)((char *)v37 + v10);
    }
    ++v24;
  }
  while (v24 != 4);
  return sub_1BBB67C90(*(uint8x8_t **)(a2 + 56), v40, v41, v42, v43, 8, a3 + 1);
}

int16x4_t sub_1BBB6077C(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v23[17] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  int v10 = *(_DWORD *)(a2 + 16);
  int16x8_t v11 = a1;
  do
  {
    int16x8_t v12 = *v11++;
    sub_1BBB659C8((int8x16_t *)&v20[v9], v12, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 16;
  }
  while (v9 != 64);
  *(int16x4_t *)&double v13 = sub_1BBB67B3C(*(uint8x8_t **)(a2 + 56), v20, v21, v22, v23, 16, a3);
  uint64_t v16 = 0;
  uint8x8_t v17 = a1 + 4;
  do
  {
    uint8x8_t v18 = *v17++;
    sub_1BBB659C8((int8x16_t *)&v20[v16], v18, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v13, v14, v15);
    v16 += 16;
  }
  while (v16 != 64);
  return sub_1BBB67B3C(*(uint8x8_t **)(a2 + 56), v20, v21, v22, v23, 16, a3 + 1);
}

int16x4_t sub_1BBB608B0(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v23[33] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  int v10 = *(_DWORD *)(a2 + 16);
  int16x8_t v11 = a1;
  do
  {
    int16x8_t v12 = *v11++;
    sub_1BBB6582C((int8x16_t *)&v20[v9], v12, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 32;
  }
  while (v9 != 128);
  *(int16x4_t *)&double v13 = sub_1BBB679E8(*(uint8x8_t **)(a2 + 56), v20, v21, v22, v23, 16, a3);
  uint64_t v16 = 0;
  uint8x8_t v17 = a1 + 4;
  do
  {
    uint8x8_t v18 = *v17++;
    sub_1BBB6582C((int8x16_t *)&v20[v16], v18, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v13, v14, v15);
    v16 += 32;
  }
  while (v16 != 128);
  return sub_1BBB679E8(*(uint8x8_t **)(a2 + 56), v20, v21, v22, v23, 16, a3 + 1);
}

int16x4_t sub_1BBB609E4(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v6 = 0;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(int *)(a2 + 16);
  int16x8_t v8 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v9 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v10 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    int16x8_t v11 = *(uint8x8_t **)(a1 + 8 * v6);
    unsigned int v12 = 12;
    double v13 = (int8x8_t *)&v52[8 * v6];
    do
    {
      uint8x8_t v14 = *v11;
      int8x8_t v15 = (uint8x8_t *)((char *)v11 + v7);
      uint8x8_t v16 = *v15;
      uint8x8_t v17 = (uint8x8_t *)((char *)v15 + v7);
      uint8x8_t v18 = *v17;
      uint8x8_t v19 = (uint8x8_t *)((char *)v17 + v7);
      int8x8_t v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v10), v8), v9));
      *double v13 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v14, v10), v8), v9));
      v13[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v16, v10), v8), v9));
      v13[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v10), v8), v9));
      v13[3] = v20;
      v13 += 4;
      v12 -= 4;
      int16x8_t v11 = (uint8x8_t *)((char *)v19 + v7);
    }
    while (v12 > 4);
    ++v6;
  }
  while (v6 != 3);
  uint8x8_t v21 = *(uint8x8_t **)(a2 + 56);
  uint8x8_t v23 = *v21;
  uint64_t v22 = v21 + 2;
  int8x16_t v24 = (int8x16_t)vabdl_u8(v23, v52[0]);
  int8x16_t v25 = (int8x16_t)vabdl_u8(v23, v53);
  int8x16_t v26 = (int8x16_t)vabdl_u8(v23, v54);
  uint64_t v27 = 17;
  do
  {
    uint8x8_t v28 = *v22;
    v22 += 2;
    int8x16_t v24 = (int8x16_t)vabal_u8((uint16x8_t)v24, v28, v52[v27 - 16]);
    int8x16_t v25 = (int8x16_t)vabal_u8((uint16x8_t)v25, v28, v52[v27 - 8]);
    int8x16_t v26 = (int8x16_t)vabal_u8((uint16x8_t)v26, v28, v52[v27++]);
  }
  while ((v27 * 8) != 192);
  uint64_t v29 = 0;
  *(int16x4_t *)a3 = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v24.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)), vadd_s16(*(int16x4_t *)v25.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v26.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)), 0));
  int16x8_t v30 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  int16x8_t v31 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v32 = (uint8x8_t)vdup_lane_s8((int8x8_t)*(unsigned __int8 *)(a2 + 72), 0);
  do
  {
    v33 = (int8x8_t *)&v52[8 * v29];
    uint8x8_t v34 = *(uint8x8_t **)(a1 + 8 * v29 + 24);
    for (unsigned int i = 12; i > 4; i -= 4)
    {
      uint8x8_t v36 = *v34;
      v37 = (uint8x8_t *)((char *)v34 + v7);
      uint8x8_t v38 = *v37;
      v39 = (uint8x8_t *)((char *)v37 + v7);
      uint8x8_t v40 = *v39;
      v41 = (uint8x8_t *)((char *)v39 + v7);
      int8x8_t v42 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v41, v32), v30), v31));
      int8x8_t *v33 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v36, v32), v30), v31));
      v33[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v38, v32), v30), v31));
      v33[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v40, v32), v30), v31));
      v33[3] = v42;
      v33 += 4;
      uint8x8_t v34 = (uint8x8_t *)((char *)v41 + v7);
    }
    ++v29;
  }
  while (v29 != 3);
  v43 = *(uint8x8_t **)(a2 + 56);
  uint8x8_t v45 = *v43;
  v44 = v43 + 2;
  int8x16_t v46 = (int8x16_t)vabdl_u8(v45, v52[0]);
  int8x16_t v47 = (int8x16_t)vabdl_u8(v45, v53);
  int8x16_t v48 = (int8x16_t)vabdl_u8(v45, v54);
  uint64_t v49 = 17;
  do
  {
    uint8x8_t v50 = *v44;
    v44 += 2;
    int8x16_t v46 = (int8x16_t)vabal_u8((uint16x8_t)v46, v50, v52[v49 - 16]);
    int8x16_t v47 = (int8x16_t)vabal_u8((uint16x8_t)v47, v50, v52[v49 - 8]);
    int8x16_t v48 = (int8x16_t)vabal_u8((uint16x8_t)v48, v50, v52[v49++]);
  }
  while ((v49 * 8) != 192);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v46.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v46, v46, 8uLL)), vadd_s16(*(int16x4_t *)v47.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v48.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)), 0));
  *(int16x4_t *)(a3 + 6) = result;
  return result;
}

int16x4_t sub_1BBB60C9C(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v6 = 0;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(int *)(a2 + 16);
  int16x8_t v8 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v9 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v10 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    int16x8_t v11 = *(uint8x8_t **)(a1 + 8 * v6);
    unsigned int v12 = 20;
    double v13 = (int8x8_t *)&v52[16 * v6];
    do
    {
      uint8x8_t v14 = *v11;
      int8x8_t v15 = (uint8x8_t *)((char *)v11 + v7);
      uint8x8_t v16 = *v15;
      uint8x8_t v17 = (uint8x8_t *)((char *)v15 + v7);
      uint8x8_t v18 = *v17;
      uint8x8_t v19 = (uint8x8_t *)((char *)v17 + v7);
      int8x8_t v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v10), v8), v9));
      *double v13 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v14, v10), v8), v9));
      v13[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v16, v10), v8), v9));
      v13[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v10), v8), v9));
      v13[3] = v20;
      v13 += 4;
      v12 -= 4;
      int16x8_t v11 = (uint8x8_t *)((char *)v19 + v7);
    }
    while (v12 > 4);
    ++v6;
  }
  while (v6 != 3);
  uint8x8_t v21 = *(uint8x8_t **)(a2 + 56);
  uint8x8_t v23 = *v21;
  uint64_t v22 = v21 + 2;
  int8x16_t v24 = (int8x16_t)vabdl_u8(v23, v52[0]);
  int8x16_t v25 = (int8x16_t)vabdl_u8(v23, v53);
  int8x16_t v26 = (int8x16_t)vabdl_u8(v23, v54);
  uint64_t v27 = 33;
  do
  {
    uint8x8_t v28 = *v22;
    v22 += 2;
    int8x16_t v24 = (int8x16_t)vabal_u8((uint16x8_t)v24, v28, v52[v27 - 32]);
    int8x16_t v25 = (int8x16_t)vabal_u8((uint16x8_t)v25, v28, v52[v27 - 16]);
    int8x16_t v26 = (int8x16_t)vabal_u8((uint16x8_t)v26, v28, v52[v27++]);
  }
  while ((v27 * 8) != 384);
  uint64_t v29 = 0;
  *(int16x4_t *)a3 = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v24.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)), vadd_s16(*(int16x4_t *)v25.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v26.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)), 0));
  int16x8_t v30 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  int16x8_t v31 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v32 = (uint8x8_t)vdup_lane_s8((int8x8_t)*(unsigned __int8 *)(a2 + 72), 0);
  do
  {
    v33 = (int8x8_t *)&v52[16 * v29];
    uint8x8_t v34 = *(uint8x8_t **)(a1 + 8 * v29 + 24);
    for (unsigned int i = 20; i > 4; i -= 4)
    {
      uint8x8_t v36 = *v34;
      v37 = (uint8x8_t *)((char *)v34 + v7);
      uint8x8_t v38 = *v37;
      v39 = (uint8x8_t *)((char *)v37 + v7);
      uint8x8_t v40 = *v39;
      v41 = (uint8x8_t *)((char *)v39 + v7);
      int8x8_t v42 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v41, v32), v30), v31));
      int8x8_t *v33 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v36, v32), v30), v31));
      v33[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v38, v32), v30), v31));
      v33[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v40, v32), v30), v31));
      v33[3] = v42;
      v33 += 4;
      uint8x8_t v34 = (uint8x8_t *)((char *)v41 + v7);
    }
    ++v29;
  }
  while (v29 != 3);
  v43 = *(uint8x8_t **)(a2 + 56);
  uint8x8_t v45 = *v43;
  v44 = v43 + 2;
  int8x16_t v46 = (int8x16_t)vabdl_u8(v45, v52[0]);
  int8x16_t v47 = (int8x16_t)vabdl_u8(v45, v53);
  int8x16_t v48 = (int8x16_t)vabdl_u8(v45, v54);
  uint64_t v49 = 33;
  do
  {
    uint8x8_t v50 = *v44;
    v44 += 2;
    int8x16_t v46 = (int8x16_t)vabal_u8((uint16x8_t)v46, v50, v52[v49 - 32]);
    int8x16_t v47 = (int8x16_t)vabal_u8((uint16x8_t)v47, v50, v52[v49 - 16]);
    int8x16_t v48 = (int8x16_t)vabal_u8((uint16x8_t)v48, v50, v52[v49++]);
  }
  while ((v49 * 8) != 384);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v46.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v46, v46, 8uLL)), vadd_s16(*(int16x4_t *)v47.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v48.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)), 0));
  *(int16x4_t *)(a3 + 6) = result;
  return result;
}

int16x4_t sub_1BBB60F5C(uint8x16_t **a1, uint64_t a2, uint64_t a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v22[17] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  int v10 = *(_DWORD *)(a2 + 16);
  int16x8_t v11 = a1;
  do
  {
    unsigned int v12 = *v11++;
    sub_1BBB659C8((int8x16_t *)&v20[v9], v12, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 16;
  }
  while (v9 != 48);
  *(int16x4_t *)&double v13 = sub_1BBB67BF4(*(uint8x8_t **)(a2 + 56), v20, v21, v22, 16, (int16x4_t *)a3);
  uint64_t v16 = 0;
  uint8x8_t v17 = a1 + 3;
  do
  {
    uint8x8_t v18 = *v17++;
    sub_1BBB659C8((int8x16_t *)&v20[v16], v18, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v13, v14, v15);
    v16 += 16;
  }
  while (v16 != 48);
  return sub_1BBB67BF4(*(uint8x8_t **)(a2 + 56), v20, v21, v22, 16, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1BBB61084(uint8x16_t **a1, uint64_t a2, uint64_t a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v22[33] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  int v10 = *(_DWORD *)(a2 + 16);
  int16x8_t v11 = a1;
  do
  {
    unsigned int v12 = *v11++;
    sub_1BBB6582C((int8x16_t *)&v20[v9], v12, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 32;
  }
  while (v9 != 96);
  *(int16x4_t *)&double v13 = sub_1BBB67AA0(*(uint8x8_t **)(a2 + 56), v20, v21, v22, 16, (int16x4_t *)a3);
  uint64_t v16 = 0;
  uint8x8_t v17 = a1 + 3;
  do
  {
    uint8x8_t v18 = *v17++;
    sub_1BBB6582C((int8x16_t *)&v20[v16], v18, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v13, v14, v15);
    v16 += 32;
  }
  while (v16 != 96);
  return sub_1BBB67AA0(*(uint8x8_t **)(a2 + 56), v20, v21, v22, 16, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1BBB611AC(int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(int *)(a2 + 16);
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, sizeof(v31));
  uint64_t v6 = *(uint8x8_t **)(a2 + 56);
  if (sub_1BBB55D84(a1, a2, v32, v31))
  {
    uint64_t v10 = 0;
    int16x8_t v11 = (int8x8_t *)v27;
    do
    {
      sub_1BBB65CF4(v11, *(void *)((char *)v32 + v10), *(void *)((char *)v31 + v10), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v10 += 8;
      v11 += 8;
    }
    while (v10 != 32);
  }
  else
  {
    uint64_t v12 = 0;
    int16x8_t v13 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    v9.i8[0] = *(unsigned char *)(a2 + 72);
    int16x8_t v14 = vdupq_n_s16(*(char *)(a2 + 73));
    uint8x8_t v15 = (uint8x8_t)vdup_lane_s8(v9, 0);
    do
    {
      uint64_t v16 = (uint8x8_t *)*((void *)v32 + v12);
      unsigned int v17 = 12;
      uint8x8_t v18 = (int8x8_t *)&v27[8 * v12];
      do
      {
        uint8x8_t v19 = *v16;
        int8x8_t v20 = (uint8x8_t *)((char *)v16 + v5);
        uint8x8_t v21 = *v20;
        uint64_t v22 = (uint8x8_t *)((char *)v20 + v5);
        uint8x8_t v23 = *v22;
        int8x16_t v24 = (uint8x8_t *)((char *)v22 + v5);
        int8x8_t v25 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v24, v15), v13), v14));
        *uint8x8_t v18 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v15), v13), v14));
        v18[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v21, v15), v13), v14));
        v18[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v23, v15), v13), v14));
        v18[3] = v25;
        v18 += 4;
        v17 -= 4;
        uint64_t v16 = (uint8x8_t *)((char *)v24 + v5);
      }
      while (v17 > 4);
      ++v12;
    }
    while (v12 != 4);
  }
  return sub_1BBB67DAC(v6, v27, v28, v29, v30, 8, a3);
}

int16x4_t sub_1BBB61368(int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(int *)(a2 + 16);
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, sizeof(v31));
  uint64_t v6 = *(uint8x8_t **)(a2 + 56);
  if (sub_1BBB55D84(a1, a2, v32, v31))
  {
    uint64_t v10 = 0;
    int16x8_t v11 = (int8x8_t *)v27;
    do
    {
      sub_1BBB65B84(v11, *(void *)((char *)v32 + v10), *(void *)((char *)v31 + v10), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v10 += 8;
      v11 += 16;
    }
    while (v10 != 32);
  }
  else
  {
    uint64_t v12 = 0;
    int16x8_t v13 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    v9.i8[0] = *(unsigned char *)(a2 + 72);
    int16x8_t v14 = vdupq_n_s16(*(char *)(a2 + 73));
    uint8x8_t v15 = (uint8x8_t)vdup_lane_s8(v9, 0);
    do
    {
      uint64_t v16 = (uint8x8_t *)*((void *)v32 + v12);
      unsigned int v17 = 20;
      uint8x8_t v18 = (int8x8_t *)&v27[16 * v12];
      do
      {
        uint8x8_t v19 = *v16;
        int8x8_t v20 = (uint8x8_t *)((char *)v16 + v5);
        uint8x8_t v21 = *v20;
        uint64_t v22 = (uint8x8_t *)((char *)v20 + v5);
        uint8x8_t v23 = *v22;
        int8x16_t v24 = (uint8x8_t *)((char *)v22 + v5);
        int8x8_t v25 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v24, v15), v13), v14));
        *uint8x8_t v18 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v15), v13), v14));
        v18[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v21, v15), v13), v14));
        v18[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v23, v15), v13), v14));
        v18[3] = v25;
        v18 += 4;
        v17 -= 4;
        uint64_t v16 = (uint8x8_t *)((char *)v24 + v5);
      }
      while (v17 > 4);
      ++v12;
    }
    while (v12 != 4);
  }
  return sub_1BBB67C90(v6, v27, v28, v29, v30, 8, a3);
}

int16x4_t sub_1BBB61524(int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = *(_DWORD *)(a2 + 16);
  memset(v20, 0, sizeof(v20));
  memset(v19, 0, sizeof(v19));
  uint64_t v6 = *(uint8x8_t **)(a2 + 56);
  if (sub_1BBB55D84(a1, a2, v20, v19))
  {
    uint64_t v10 = 0;
    int16x8_t v11 = (int8x16_t *)v15;
    do
    {
      sub_1BBB65A48(v11, *(void *)((char *)v20 + v10), *(void *)((char *)v19 + v10), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v10 += 8;
      v11 += 8;
    }
    while (v10 != 32);
  }
  else
  {
    uint64_t v12 = 0;
    int16x8_t v13 = (int8x16_t *)v15;
    do
    {
      sub_1BBB659C8(v13, *(uint8x16_t **)((char *)v20 + v12), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v12 += 8;
      v13 += 8;
    }
    while (v12 != 32);
  }
  return sub_1BBB67B3C(v6, v15, v16, v17, v18, 16, a3);
}

int16x4_t sub_1BBB61660(int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = *(_DWORD *)(a2 + 16);
  memset(v20, 0, sizeof(v20));
  memset(v19, 0, sizeof(v19));
  uint64_t v6 = *(uint8x8_t **)(a2 + 56);
  if (sub_1BBB55D84(a1, a2, v20, v19))
  {
    uint64_t v10 = 0;
    int16x8_t v11 = (int8x16_t *)v15;
    do
    {
      sub_1BBB658AC(v11, *(void *)((char *)v20 + v10), *(void *)((char *)v19 + v10), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v10 += 8;
      v11 += 16;
    }
    while (v10 != 32);
  }
  else
  {
    uint64_t v12 = 0;
    int16x8_t v13 = (int8x16_t *)v15;
    do
    {
      sub_1BBB6582C(v13, *(uint8x16_t **)((char *)v20 + v12), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v12 += 8;
      v13 += 16;
    }
    while (v12 != 32);
  }
  return sub_1BBB679E8(v6, v15, v16, v17, v18, 16, a3);
}

int16x4_t sub_1BBB6179C(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v7 = 0;
  v27[9] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  double v8 = *(uint8x8_t **)(a2 + 56);
  uint64_t v9 = *(int *)(a2 + 16);
  int16x8_t v10 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v11 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v12 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    int16x8_t v13 = *(uint8x8_t **)(a1 + 8 * v7);
    unsigned int v14 = 12;
    uint8x8_t v15 = (int8x8_t *)&v24[8 * v7];
    do
    {
      uint8x8_t v16 = *v13;
      unsigned int v17 = (uint8x8_t *)((char *)v13 + v9);
      uint8x8_t v18 = *v17;
      uint8x8_t v19 = (uint8x8_t *)((char *)v17 + v9);
      uint8x8_t v20 = *v19;
      uint64_t v21 = (uint8x8_t *)((char *)v19 + v9);
      int8x8_t v22 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v21, v12), v10), v11));
      *uint8x8_t v15 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v16, v12), v10), v11));
      v15[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v12), v10), v11));
      v15[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v20, v12), v10), v11));
      v15[3] = v22;
      v15 += 4;
      v14 -= 4;
      int16x8_t v13 = (uint8x8_t *)((char *)v21 + v9);
    }
    while (v14 > 4);
    ++v7;
  }
  while (v7 != 4);
  return sub_1BBB67DAC(v8, v24, v25, v26, v27, 8, a3);
}

int16x4_t sub_1BBB618CC(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v7 = 0;
  v27[17] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  double v8 = *(uint8x8_t **)(a2 + 56);
  uint64_t v9 = *(int *)(a2 + 16);
  int16x8_t v10 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v11 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v12 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    int16x8_t v13 = *(uint8x8_t **)(a1 + 8 * v7);
    unsigned int v14 = 20;
    uint8x8_t v15 = (int8x8_t *)&v24[16 * v7];
    do
    {
      uint8x8_t v16 = *v13;
      unsigned int v17 = (uint8x8_t *)((char *)v13 + v9);
      uint8x8_t v18 = *v17;
      uint8x8_t v19 = (uint8x8_t *)((char *)v17 + v9);
      uint8x8_t v20 = *v19;
      uint64_t v21 = (uint8x8_t *)((char *)v19 + v9);
      int8x8_t v22 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v21, v12), v10), v11));
      *uint8x8_t v15 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v16, v12), v10), v11));
      v15[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v12), v10), v11));
      v15[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v20, v12), v10), v11));
      v15[3] = v22;
      v15 += 4;
      v14 -= 4;
      int16x8_t v13 = (uint8x8_t *)((char *)v21 + v9);
    }
    while (v14 > 4);
    ++v7;
  }
  while (v7 != 4);
  return sub_1BBB67C90(v8, v24, v25, v26, v27, 8, a3);
}

int16x4_t sub_1BBB619FC(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v17[17] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  int16x8_t v10 = *(uint8x8_t **)(a2 + 56);
  int v11 = *(_DWORD *)(a2 + 16);
  do
  {
    uint8x8_t v12 = *a1++;
    sub_1BBB659C8((int8x16_t *)&v14[v9], v12, v11, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 16;
  }
  while (v9 != 64);
  return sub_1BBB67B3C(v10, v14, v15, v16, v17, 16, a3);
}

int16x4_t sub_1BBB61ACC(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v17[33] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  int16x8_t v10 = *(uint8x8_t **)(a2 + 56);
  int v11 = *(_DWORD *)(a2 + 16);
  do
  {
    uint8x8_t v12 = *a1++;
    sub_1BBB6582C((int8x16_t *)&v14[v9], v12, v11, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 32;
  }
  while (v9 != 128);
  return sub_1BBB679E8(v10, v14, v15, v16, v17, 16, a3);
}

int16x4_t sub_1BBB61B9C(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v6 = 0;
  v30[25] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  uint64_t v7 = *(uint8x8_t **)(a2 + 56);
  uint64_t v8 = *(int *)(a2 + 16);
  int16x8_t v9 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v10 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v11 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    uint8x8_t v12 = *(uint8x8_t **)(a1 + 8 * v6);
    unsigned int v13 = 12;
    unsigned int v14 = (int8x8_t *)&v30[8 * v6];
    do
    {
      uint8x8_t v15 = *v12;
      uint8x8_t v16 = (uint8x8_t *)((char *)v12 + v8);
      uint8x8_t v17 = *v16;
      uint8x8_t v18 = (uint8x8_t *)((char *)v16 + v8);
      uint8x8_t v19 = *v18;
      uint8x8_t v20 = (uint8x8_t *)((char *)v18 + v8);
      int8x8_t v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v20, v11), v9), v10));
      *unsigned int v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v15, v11), v9), v10));
      v14[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v17, v11), v9), v10));
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v11), v9), v10));
      v14[3] = v21;
      v14 += 4;
      v13 -= 4;
      uint8x8_t v12 = (uint8x8_t *)((char *)v20 + v8);
    }
    while (v13 > 4);
    ++v6;
  }
  while (v6 != 3);
  uint8x8_t v23 = *v7;
  int8x8_t v22 = v7 + 2;
  int8x16_t v24 = (int8x16_t)vabdl_u8(v23, v30[0]);
  int8x16_t v25 = (int8x16_t)vabdl_u8(v23, v30[8]);
  int8x16_t v26 = (int8x16_t)vabdl_u8(v23, v30[16]);
  uint64_t v27 = 17;
  do
  {
    uint8x8_t v28 = *v22;
    v22 += 2;
    int8x16_t v24 = (int8x16_t)vabal_u8((uint16x8_t)v24, v28, v30[v27 - 16]);
    int8x16_t v25 = (int8x16_t)vabal_u8((uint16x8_t)v25, v28, v30[v27 - 8]);
    int8x16_t v26 = (int8x16_t)vabal_u8((uint16x8_t)v26, v28, v30[v27++]);
  }
  while ((v27 * 8) != 192);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v24.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)), vadd_s16(*(int16x4_t *)v25.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v26.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)), 0));
  *a3 = result;
  return result;
}

int16x4_t sub_1BBB61D1C(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v6 = 0;
  v30[49] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  uint64_t v7 = *(uint8x8_t **)(a2 + 56);
  uint64_t v8 = *(int *)(a2 + 16);
  int16x8_t v9 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(unsigned char *)(a2 + 72);
  int16x8_t v10 = vdupq_n_s16(*(char *)(a2 + 73));
  uint8x8_t v11 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    uint8x8_t v12 = *(uint8x8_t **)(a1 + 8 * v6);
    unsigned int v13 = 20;
    unsigned int v14 = (int8x8_t *)&v30[16 * v6];
    do
    {
      uint8x8_t v15 = *v12;
      uint8x8_t v16 = (uint8x8_t *)((char *)v12 + v8);
      uint8x8_t v17 = *v16;
      uint8x8_t v18 = (uint8x8_t *)((char *)v16 + v8);
      uint8x8_t v19 = *v18;
      uint8x8_t v20 = (uint8x8_t *)((char *)v18 + v8);
      int8x8_t v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v20, v11), v9), v10));
      *unsigned int v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v15, v11), v9), v10));
      v14[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v17, v11), v9), v10));
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v11), v9), v10));
      v14[3] = v21;
      v14 += 4;
      v13 -= 4;
      uint8x8_t v12 = (uint8x8_t *)((char *)v20 + v8);
    }
    while (v13 > 4);
    ++v6;
  }
  while (v6 != 3);
  uint8x8_t v23 = *v7;
  int8x8_t v22 = v7 + 2;
  int8x16_t v24 = (int8x16_t)vabdl_u8(v23, v30[0]);
  int8x16_t v25 = (int8x16_t)vabdl_u8(v23, v30[16]);
  int8x16_t v26 = (int8x16_t)vabdl_u8(v23, v30[32]);
  uint64_t v27 = 33;
  do
  {
    uint8x8_t v28 = *v22;
    v22 += 2;
    int8x16_t v24 = (int8x16_t)vabal_u8((uint16x8_t)v24, v28, v30[v27 - 32]);
    int8x16_t v25 = (int8x16_t)vabal_u8((uint16x8_t)v25, v28, v30[v27 - 16]);
    int8x16_t v26 = (int8x16_t)vabal_u8((uint16x8_t)v26, v28, v30[v27++]);
  }
  while ((v27 * 8) != 384);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v24.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)), vadd_s16(*(int16x4_t *)v25.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v26.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)), 0));
  *a3 = result;
  return result;
}

int16x4_t sub_1BBB61EA4(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v16[17] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  int16x8_t v10 = *(uint8x8_t **)(a2 + 56);
  int v11 = *(_DWORD *)(a2 + 16);
  do
  {
    uint8x8_t v12 = *a1++;
    sub_1BBB659C8((int8x16_t *)&v14[v9], v12, v11, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 16;
  }
  while (v9 != 48);
  return sub_1BBB67BF4(v10, v14, v15, v16, 16, a3);
}

int16x4_t sub_1BBB61F70(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9 = 0;
  v16[33] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  int16x8_t v10 = *(uint8x8_t **)(a2 + 56);
  int v11 = *(_DWORD *)(a2 + 16);
  do
  {
    uint8x8_t v12 = *a1++;
    sub_1BBB6582C((int8x16_t *)&v14[v9], v12, v11, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 32;
  }
  while (v9 != 96);
  return sub_1BBB67AA0(v10, v14, v15, v16, 16, a3);
}

float sub_1BBB6203C(unsigned int a1, uint64_t a2, _WORD *a3)
{
  v25[9] = *(int8x8_t *)MEMORY[0x1E4F143B8];
  int v5 = *(uint8x8_t **)(a2 + 56);
  uint64_t v6 = *(int *)(a2 + 16);
  uint64_t v23 = 0;
  int8x16_t v24 = 0;
  int v7 = sub_1BBB55B5C(a1, (_DWORD *)a2, &v24, &v23);
  int v11 = v24;
  if (v7)
  {
    sub_1BBB65CF4(v25, (uint64_t)v24, v23, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v8, v9, v10);
  }
  else
  {
    v10.i8[0] = *(unsigned char *)(a2 + 72);
    int16x8_t v12 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    int16x8_t v13 = vdupq_n_s16(*(char *)(a2 + 73));
    unsigned int v14 = v25;
    unsigned int v15 = 12;
    uint8x8_t v16 = (uint8x8_t)vdup_lane_s8(v10, 0);
    do
    {
      uint8x8_t v17 = (uint8x8_t *)((char *)v11 + v6 + v6);
      uint8x8_t v18 = *v17;
      uint8x8_t v19 = (uint8x8_t *)((char *)v17 + v6);
      int8x8_t v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)v11 + v6), v16), v12), v13));
      int8x8_t v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v16), v12), v13));
      *unsigned int v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v11, v16), v12), v13));
      v14[1] = v20;
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v16), v12), v13));
      v14[3] = v21;
      v14 += 4;
      v15 -= 4;
      int v11 = (uint8x8_t *)((char *)v19 + v6);
    }
    while (v15 > 4);
  }
  float result = COERCE_FLOAT(vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(v5[4], (uint8x8_t)v25[2]), v5[12], (uint8x8_t)v25[6]), (int16x8_t)vabal_u8(vabdl_u8(v5[6], (uint8x8_t)v25[3]), v5[14], (uint8x8_t)v25[7])), vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(v5[2], (uint8x8_t)v25[1]), v5[10], (uint8x8_t)v25[5]), (int16x8_t)vabal_u8(vabdl_u8(*v5, (uint8x8_t)v25[0]), v5[8], (uint8x8_t)v25[4])))));
  *a3 = LOWORD(result);
  return result;
}

uint64_t sub_1BBB621E4(unsigned int a1, uint64_t a2, _WORD *a3)
{
  v25[17] = *(uint8x8_t *)MEMORY[0x1E4F143B8];
  int v5 = *(uint8x8_t **)(a2 + 56);
  uint64_t v6 = *(int *)(a2 + 16);
  uint64_t v23 = 0;
  int8x16_t v24 = 0;
  int v7 = sub_1BBB55B5C(a1, (_DWORD *)a2, &v24, &v23);
  int v11 = v24;
  if (v7)
  {
    sub_1BBB65B84((int8x8_t *)v25, (uint64_t)v24, v23, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v8, v9, v10);
  }
  else
  {
    v10.i8[0] = *(unsigned char *)(a2 + 72);
    int16x8_t v12 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    int16x8_t v13 = vdupq_n_s16(*(char *)(a2 + 73));
    unsigned int v14 = (int8x8_t *)v25;
    unsigned int v15 = 20;
    uint8x8_t v16 = (uint8x8_t)vdup_lane_s8(v10, 0);
    do
    {
      uint8x8_t v17 = (uint8x8_t *)((char *)v11 + v6 + v6);
      uint8x8_t v18 = *v17;
      uint8x8_t v19 = (uint8x8_t *)((char *)v17 + v6);
      int8x8_t v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)v11 + v6), v16), v12), v13));
      int8x8_t v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v16), v12), v13));
      *unsigned int v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v11, v16), v12), v13));
      v14[1] = v20;
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v16), v12), v13));
      v14[3] = v21;
      v14 += 4;
      v15 -= 4;
      int v11 = (uint8x8_t *)((char *)v19 + v6);
    }
    while (v15 > 4);
  }
  uint64_t result = sub_1BBB66E30(v5, v25, 8);
  *a3 = result;
  return result;
}

uint64_t sub_1BBB62338(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a2 + 56);
  int v6 = *(_DWORD *)(a2 + 16);
  uint64_t v11 = 0;
  int16x8_t v12 = 0;
  if (sub_1BBB55B5C(a1, (_DWORD *)a2, &v12, &v11)) {
    sub_1BBB65A48((int8x16_t *)v13, (uint64_t)v12, v11, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  }
  else {
    sub_1BBB659C8((int8x16_t *)v13, v12, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  }
  uint64_t result = sub_1BBB66D90(v5, v13, 16);
  *a3 = result;
  return result;
}

uint64_t sub_1BBB62408(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(uint8x8_t **)(a2 + 56);
  int v6 = *(_DWORD *)(a2 + 16);
  uint64_t v11 = 0;
  int16x8_t v12 = 0;
  if (sub_1BBB55B5C(a1, (_DWORD *)a2, &v12, &v11)) {
    sub_1BBB658AC(v13, (uint64_t)v12, v11, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  }
  else {
    sub_1BBB6582C(v13, v12, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  }
  uint64_t result = sub_1BBB66C78(v5, 16, (uint8x8_t *)v13, 16);
  *a3 = result;
  return result;
}

int16x4_t sub_1BBB624E4(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  int v6 = *(_DWORD *)(a2 + 16);
  sub_1BBB67DAC(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], v6, a3);
  double v7 = *(uint8x8_t **)(a2 + 56);
  double v8 = a1[4];
  int8x8_t v9 = a1[5];
  int8x8_t v10 = a1[6];
  uint64_t v11 = a1[7];

  return sub_1BBB67DAC(v7, v8, v9, v10, v11, v6, a3 + 1);
}

int16x4_t sub_1BBB62554(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  int v6 = *(_DWORD *)(a2 + 16);
  sub_1BBB67C90(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], v6, a3);
  double v7 = *(uint8x8_t **)(a2 + 56);
  double v8 = a1[4];
  int8x8_t v9 = a1[5];
  int8x8_t v10 = a1[6];
  uint64_t v11 = a1[7];

  return sub_1BBB67C90(v7, v8, v9, v10, v11, v6, a3 + 1);
}

int16x4_t sub_1BBB625C4(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  int v6 = *(_DWORD *)(a2 + 16);
  sub_1BBB67B3C(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], v6, a3);
  double v7 = *(uint8x8_t **)(a2 + 56);
  double v8 = a1[4];
  int8x8_t v9 = a1[5];
  int8x8_t v10 = a1[6];
  uint64_t v11 = a1[7];

  return sub_1BBB67B3C(v7, v8, v9, v10, v11, v6, a3 + 1);
}

int16x4_t sub_1BBB62634(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  int v6 = *(_DWORD *)(a2 + 16);
  sub_1BBB679E8(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], v6, a3);
  double v7 = *(uint8x8_t **)(a2 + 56);
  double v8 = a1[4];
  int8x8_t v9 = a1[5];
  int8x8_t v10 = a1[6];
  uint64_t v11 = a1[7];

  return sub_1BBB679E8(v7, v8, v9, v10, v11, v6, a3 + 1);
}

int16x4_t sub_1BBB626A4(uint8x8_t **a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a2 + 16);
  sub_1BBB67E44(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], v6, (int16x4_t *)a3);
  double v7 = *(uint8x8_t **)(a2 + 56);
  double v8 = a1[3];
  int8x8_t v9 = a1[4];
  int8x8_t v10 = a1[5];

  return sub_1BBB67E44(v7, v8, v9, v10, v6, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1BBB62714(uint8x8_t **a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a2 + 16);
  sub_1BBB67D28(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], v6, (int16x4_t *)a3);
  double v7 = *(uint8x8_t **)(a2 + 56);
  double v8 = a1[3];
  int8x8_t v9 = a1[4];
  int8x8_t v10 = a1[5];

  return sub_1BBB67D28(v7, v8, v9, v10, v6, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1BBB62784(uint8x8_t **a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a2 + 16);
  sub_1BBB67BF4(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], v6, (int16x4_t *)a3);
  double v7 = *(uint8x8_t **)(a2 + 56);
  double v8 = a1[3];
  int8x8_t v9 = a1[4];
  int8x8_t v10 = a1[5];

  return sub_1BBB67BF4(v7, v8, v9, v10, v6, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1BBB627F4(uint8x8_t **a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a2 + 16);
  sub_1BBB67AA0(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], v6, (int16x4_t *)a3);
  double v7 = *(uint8x8_t **)(a2 + 56);
  double v8 = a1[3];
  int8x8_t v9 = a1[4];
  int8x8_t v10 = a1[5];

  return sub_1BBB67AA0(v7, v8, v9, v10, v6, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1BBB62864(int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(a2 + 16);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v5 = *(uint8x8_t **)(a2 + 56);
  if (!sub_1BBB55D84(a1, a2, &v9, &v7)) {
    return sub_1BBB67DAC(v5, (uint8x8_t *)v9, *((uint8x8_t **)&v9 + 1), (uint8x8_t *)v10, *((uint8x8_t **)&v10 + 1), v4, a3);
  }
  a3->i16[0] = sub_1BBB67274(v5, (uint8x8_t *)v9, (uint8x8_t *)v7, v4);
  a3->i16[1] = sub_1BBB67274(v5, *((uint8x8_t **)&v9 + 1), *((uint8x8_t **)&v7 + 1), v4);
  a3->i16[2] = sub_1BBB67274(v5, (uint8x8_t *)v10, (uint8x8_t *)v8, v4);
  a3->i16[3] = sub_1BBB67274(v5, *((uint8x8_t **)&v10 + 1), *((uint8x8_t **)&v8 + 1), v4);
  return result;
}

int16x4_t sub_1BBB62964(int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(a2 + 16);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v5 = *(uint8x8_t **)(a2 + 56);
  if (!sub_1BBB55D84(a1, a2, &v9, &v7)) {
    return sub_1BBB67C90(v5, (uint8x8_t *)v9, *((uint8x8_t **)&v9 + 1), (uint8x8_t *)v10, *((uint8x8_t **)&v10 + 1), v4, a3);
  }
  a3->i16[0] = sub_1BBB67144(v5, (uint8x8_t *)v9, (uint8x8_t *)v7, v4);
  a3->i16[1] = sub_1BBB67144(v5, *((uint8x8_t **)&v9 + 1), *((uint8x8_t **)&v7 + 1), v4);
  a3->i16[2] = sub_1BBB67144(v5, (uint8x8_t *)v10, (uint8x8_t *)v8, v4);
  a3->i16[3] = sub_1BBB67144(v5, *((uint8x8_t **)&v10 + 1), *((uint8x8_t **)&v8 + 1), v4);
  return result;
}

int16x4_t sub_1BBB62A64(int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(a2 + 16);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v5 = *(uint8x8_t **)(a2 + 56);
  if (!sub_1BBB55D84(a1, a2, &v9, &v7)) {
    return sub_1BBB67B3C(v5, (uint8x8_t *)v9, *((uint8x8_t **)&v9 + 1), (uint8x8_t *)v10, *((uint8x8_t **)&v10 + 1), v4, a3);
  }
  a3->i16[0] = sub_1BBB67038((uint64_t)v5, (uint8x16_t *)v9, (uint8x16_t *)v7, v4);
  a3->i16[1] = sub_1BBB67038((uint64_t)v5, *((uint8x16_t **)&v9 + 1), *((uint8x16_t **)&v7 + 1), v4);
  a3->i16[2] = sub_1BBB67038((uint64_t)v5, (uint8x16_t *)v10, (uint8x16_t *)v8, v4);
  a3->i16[3] = sub_1BBB67038((uint64_t)v5, *((uint8x16_t **)&v10 + 1), *((uint8x16_t **)&v8 + 1), v4);
  return result;
}

int16x4_t sub_1BBB62B64(int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(a2 + 16);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v5 = *(uint8x8_t **)(a2 + 56);
  if (!sub_1BBB55D84(a1, a2, &v9, &v7)) {
    return sub_1BBB679E8(v5, (uint8x8_t *)v9, *((uint8x8_t **)&v9 + 1), (uint8x8_t *)v10, *((uint8x8_t **)&v10 + 1), v4, a3);
  }
  a3->i16[0] = sub_1BBB66EF4(v5, (uint8x16_t *)v9, (uint8x16_t *)v7, v4);
  a3->i16[1] = sub_1BBB66EF4(v5, *((uint8x16_t **)&v9 + 1), *((uint8x16_t **)&v7 + 1), v4);
  a3->i16[2] = sub_1BBB66EF4(v5, (uint8x16_t *)v10, (uint8x16_t *)v8, v4);
  a3->i16[3] = sub_1BBB66EF4(v5, *((uint8x16_t **)&v10 + 1), *((uint8x16_t **)&v8 + 1), v4);
  return result;
}

int16x4_t sub_1BBB62C64(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1BBB67DAC(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1BBB62C80(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1BBB67C90(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1BBB62C9C(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1BBB67B3C(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1BBB62CB8(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1BBB679E8(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1BBB62CD4(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1BBB67E44(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1BBB62CF0(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1BBB67D28(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1BBB62D0C(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1BBB67BF4(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1BBB62D28(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1BBB67AA0(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], *(_DWORD *)(a2 + 16), a3);
}

uint64_t sub_1BBB62D44(unsigned int a1, uint64_t a2, _WORD *a3)
{
  int v4 = *(uint8x8_t **)(a2 + 56);
  uint64_t v5 = *(int *)(a2 + 16);
  int16x8_t v12 = 0;
  int16x8_t v13 = 0;
  if (sub_1BBB55B5C(a1, (_DWORD *)a2, &v13, &v12))
  {
    uint64_t result = sub_1BBB67274(v4, v13, v12, v5);
  }
  else
  {
    long long v7 = (uint8x8_t *)((char *)v13 + v5 + v5);
    uint8x8_t v8 = *v7;
    long long v9 = (uint8x8_t *)((char *)v7 + v5);
    uint8x8_t v10 = *v9;
    uint64_t v11 = (uint8x8_t *)((char *)v9 + v5);
    uint64_t result = vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(v4[4], v8), v4[12], *(uint8x8_t *)((char *)v11 + v5 + v5)), (int16x8_t)vabal_u8(vabdl_u8(v4[6], v10), v4[14], *(uint8x8_t *)((char *)v11 + v5 + v5 + v5))), vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(v4[2], *(uint8x8_t *)((char *)v13 + v5)), v4[10], *(uint8x8_t *)((char *)v11 + v5)), (int16x8_t)vabal_u8(vabdl_u8(*v4, *v13), v4[8], *v11))));
  }
  *a3 = result;
  return result;
}

uint64_t sub_1BBB62E3C(unsigned int a1, uint64_t a2, _WORD *a3)
{
  int v4 = *(uint8x8_t **)(a2 + 56);
  int v5 = *(_DWORD *)(a2 + 16);
  long long v7 = 0;
  uint8x8_t v8 = 0;
  if (sub_1BBB55B5C(a1, (_DWORD *)a2, &v8, &v7)) {
    uint64_t result = sub_1BBB67144(v4, v8, v7, v5);
  }
  else {
    uint64_t result = sub_1BBB66E30(v4, v8, v5);
  }
  *a3 = result;
  return result;
}

uint64_t sub_1BBB62EB4(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4 = *(void *)(a2 + 56);
  int v5 = *(_DWORD *)(a2 + 16);
  long long v7 = 0;
  uint8x8_t v8 = 0;
  if (sub_1BBB55B5C(a1, (_DWORD *)a2, &v8, &v7)) {
    uint64_t result = sub_1BBB67038(v4, v8, v7, v5);
  }
  else {
    uint64_t result = sub_1BBB66D90(v4, v8, v5);
  }
  *a3 = result;
  return result;
}

uint64_t sub_1BBB62F2C(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4 = *(uint8x8_t **)(a2 + 56);
  int v5 = *(_DWORD *)(a2 + 16);
  long long v7 = 0;
  uint8x8_t v8 = 0;
  if (sub_1BBB55B5C(a1, (_DWORD *)a2, &v8, &v7)) {
    uint64_t result = sub_1BBB66EF4(v4, v8, v7, v5);
  }
  else {
    uint64_t result = sub_1BBB66C78(v4, 16, (uint8x8_t *)v8, v5);
  }
  *a3 = result;
  return result;
}

int16x8_t sub_1BBB62FB0(int16x8_t *a1, int16x8_t *a2)
{
  int16x8_t v2 = a1[1];
  int16x8_t v3 = a1[2];
  int16x8_t v4 = a1[3];
  int16x8_t v5 = a1[4];
  int16x8_t v6 = a1[5];
  int32x4_t v7 = (int32x4_t)vtrn1q_s16(*a1, v2);
  int16x8_t v8 = a1[6];
  int16x8_t v9 = a1[7];
  int32x4_t v10 = (int32x4_t)vtrn2q_s16(*a1, v2);
  int32x4_t v11 = (int32x4_t)vtrn1q_s16(v3, v4);
  int32x4_t v12 = (int32x4_t)vtrn2q_s16(v3, v4);
  int32x4_t v13 = (int32x4_t)vtrn1q_s16(v5, v6);
  int32x4_t v14 = (int32x4_t)vtrn2q_s16(v5, v6);
  int32x4_t v15 = (int32x4_t)vtrn1q_s16(v8, v9);
  int32x4_t v16 = (int32x4_t)vtrn2q_s16(v8, v9);
  int64x2_t v17 = (int64x2_t)vtrn1q_s32(v7, v11);
  int64x2_t v18 = (int64x2_t)vtrn2q_s32(v7, v11);
  int64x2_t v19 = (int64x2_t)vtrn1q_s32(v10, v12);
  int64x2_t v20 = (int64x2_t)vtrn2q_s32(v10, v12);
  int64x2_t v21 = (int64x2_t)vtrn1q_s32(v13, v15);
  int64x2_t v22 = (int64x2_t)vtrn2q_s32(v13, v15);
  int64x2_t v23 = (int64x2_t)vtrn1q_s32(v14, v16);
  int64x2_t v24 = (int64x2_t)vtrn2q_s32(v14, v16);
  int16x8_t v25 = (int16x8_t)vzip1q_s64(v17, v21);
  int16x8_t v26 = (int16x8_t)vzip1q_s64(v19, v23);
  int16x8_t v27 = (int16x8_t)vzip1q_s64(v18, v22);
  int16x8_t v28 = (int16x8_t)vzip1q_s64(v20, v24);
  int16x8_t v29 = (int16x8_t)vzip2q_s64(v17, v21);
  int16x8_t v30 = (int16x8_t)vzip2q_s64(v19, v23);
  int16x8_t v31 = (int16x8_t)vzip2q_s64(v18, v22);
  int16x8_t v32 = (int16x8_t)vzip2q_s64(v20, v24);
  int16x8_t v33 = vaddq_s16(v32, v25);
  int16x8_t v34 = vaddq_s16(v31, v26);
  int16x8_t v35 = vaddq_s16(v30, v27);
  int16x8_t v36 = vaddq_s16(v29, v28);
  int16x8_t v37 = vsubq_s16(v25, v32);
  int16x8_t v38 = vsubq_s16(v26, v31);
  int16x8_t v39 = vsubq_s16(v27, v30);
  int16x8_t v40 = vsubq_s16(v28, v29);
  int16x8_t v41 = vaddq_s16(v36, v33);
  int16x8_t v42 = vaddq_s16(v35, v34);
  int16x8_t v43 = vsubq_s16(v33, v36);
  int16x8_t v44 = vsubq_s16(v34, v35);
  int16x8_t v45 = vsraq_n_s16(vaddq_s16(vaddq_s16(v38, v37), v39), v37, 1uLL);
  int16x8_t v46 = vsubq_s16(v37, vsraq_n_s16(vaddq_s16(v40, v39), v39, 1uLL));
  int16x8_t v47 = vsubq_s16(vaddq_s16(v37, v40), vsraq_n_s16(v38, v38, 1uLL));
  int16x8_t v48 = vsraq_n_s16(vaddq_s16(vsubq_s16(v38, v39), v40), v40, 1uLL);
  int16x8_t v49 = vaddq_s16(v41, v42);
  int16x8_t v50 = vsubq_s16(v41, v42);
  int16x8_t v51 = vshrq_n_s16(v43, 1uLL);
  int16x8_t v52 = vsraq_n_s16(v43, v44, 1uLL);
  int16x8_t v53 = vsubq_s16(v51, v44);
  int16x8_t v54 = vshrq_n_s16(v46, 2uLL);
  int16x8_t v55 = vsraq_n_s16(v46, v47, 2uLL);
  int16x8_t v56 = vsubq_s16(v47, v54);
  int16x8_t v57 = vshrq_n_s16(v45, 2uLL);
  int16x8_t v58 = vsraq_n_s16(v45, v48, 2uLL);
  int16x8_t v59 = vsubq_s16(v57, v48);
  int32x4_t v60 = (int32x4_t)vtrn1q_s16(v49, v58);
  int32x4_t v61 = (int32x4_t)vtrn2q_s16(v49, v58);
  int32x4_t v62 = (int32x4_t)vtrn1q_s16(v52, v55);
  int32x4_t v63 = (int32x4_t)vtrn2q_s16(v52, v55);
  int32x4_t v64 = (int32x4_t)vtrn1q_s16(v50, v56);
  int32x4_t v65 = (int32x4_t)vtrn2q_s16(v50, v56);
  int32x4_t v66 = (int32x4_t)vtrn1q_s16(v53, v59);
  int32x4_t v67 = (int32x4_t)vtrn2q_s16(v53, v59);
  int64x2_t v68 = (int64x2_t)vtrn1q_s32(v60, v62);
  int64x2_t v69 = (int64x2_t)vtrn2q_s32(v60, v62);
  int64x2_t v70 = (int64x2_t)vtrn1q_s32(v61, v63);
  int64x2_t v71 = (int64x2_t)vtrn2q_s32(v61, v63);
  int64x2_t v72 = (int64x2_t)vtrn1q_s32(v64, v66);
  int64x2_t v73 = (int64x2_t)vtrn2q_s32(v64, v66);
  int64x2_t v74 = (int64x2_t)vtrn1q_s32(v65, v67);
  int64x2_t v75 = (int64x2_t)vtrn2q_s32(v65, v67);
  int16x8_t v76 = (int16x8_t)vzip1q_s64(v68, v72);
  int16x8_t v77 = (int16x8_t)vzip1q_s64(v70, v74);
  int16x8_t v78 = (int16x8_t)vzip1q_s64(v69, v73);
  int16x8_t v79 = (int16x8_t)vzip1q_s64(v71, v75);
  int16x8_t v80 = (int16x8_t)vzip2q_s64(v68, v72);
  int16x8_t v81 = (int16x8_t)vzip2q_s64(v70, v74);
  int16x8_t v82 = (int16x8_t)vzip2q_s64(v69, v73);
  int16x8_t v83 = (int16x8_t)vzip2q_s64(v71, v75);
  int16x8_t v84 = vaddq_s16(v83, v76);
  int16x8_t v85 = vaddq_s16(v82, v77);
  int16x8_t v86 = vaddq_s16(v81, v78);
  int16x8_t v87 = vaddq_s16(v80, v79);
  int16x8_t v88 = vsubq_s16(v76, v83);
  int16x8_t v89 = vsubq_s16(v77, v82);
  int16x8_t v90 = vsubq_s16(v78, v81);
  int16x8_t v91 = vsubq_s16(v79, v80);
  int16x8_t v92 = vaddq_s16(v87, v84);
  int16x8_t v93 = vaddq_s16(v86, v85);
  int16x8_t v94 = vsubq_s16(v84, v87);
  int16x8_t v95 = vsubq_s16(v85, v86);
  int16x8_t v96 = vsraq_n_s16(vaddq_s16(vaddq_s16(v89, v88), v90), v88, 1uLL);
  int16x8_t v97 = vsubq_s16(v88, vsraq_n_s16(vaddq_s16(v91, v90), v90, 1uLL));
  int16x8_t v98 = vsubq_s16(vaddq_s16(v88, v91), vsraq_n_s16(v89, v89, 1uLL));
  int16x8_t v99 = vsraq_n_s16(vaddq_s16(vsubq_s16(v89, v90), v91), v91, 1uLL);
  *a2 = vaddq_s16(v92, v93);
  a2[1] = vsraq_n_s16(v96, v99, 2uLL);
  a2[2] = vsraq_n_s16(v94, v95, 1uLL);
  a2[3] = vsraq_n_s16(v97, v98, 2uLL);
  a2[4] = vsubq_s16(v92, v93);
  a2[5] = vsubq_s16(v98, vshrq_n_s16(v97, 2uLL));
  int16x8_t result = vsubq_s16(vshrq_n_s16(v96, 2uLL), v99);
  a2[6] = vsubq_s16(vshrq_n_s16(v94, 1uLL), v95);
  a2[7] = result;
  return result;
}

int16x8_t sub_1BBB631AC(int16x8_t *a1, int16x8_t *a2)
{
  int16x8_t v2 = a1[1];
  int16x8_t v3 = a1[2];
  int16x8_t v4 = a1[3];
  int16x8_t v5 = a1[4];
  int16x8_t v6 = a1[5];
  int16x8_t v7 = a1[6];
  int16x8_t v8 = a1[7];
  int32x4_t v9 = (int32x4_t)vtrn1q_s16(*a1, v2);
  int32x4_t v10 = (int32x4_t)vtrn2q_s16(*a1, v2);
  int32x4_t v11 = (int32x4_t)vtrn1q_s16(v3, v4);
  int32x4_t v12 = (int32x4_t)vtrn2q_s16(v3, v4);
  int32x4_t v13 = (int32x4_t)vtrn1q_s16(v5, v6);
  int32x4_t v14 = (int32x4_t)vtrn2q_s16(v5, v6);
  int32x4_t v15 = (int32x4_t)vtrn1q_s16(v7, v8);
  int32x4_t v16 = (int32x4_t)vtrn2q_s16(v7, v8);
  int64x2_t v17 = (int64x2_t)vtrn1q_s32(v9, v11);
  int64x2_t v18 = (int64x2_t)vtrn2q_s32(v9, v11);
  int64x2_t v19 = (int64x2_t)vtrn1q_s32(v10, v12);
  int64x2_t v20 = (int64x2_t)vtrn2q_s32(v10, v12);
  int64x2_t v21 = (int64x2_t)vtrn1q_s32(v13, v15);
  int64x2_t v22 = (int64x2_t)vtrn2q_s32(v13, v15);
  int64x2_t v23 = (int64x2_t)vtrn1q_s32(v14, v16);
  int64x2_t v24 = (int64x2_t)vtrn2q_s32(v14, v16);
  int16x8_t v25 = (int16x8_t)vzip1q_s64(v17, v21);
  int16x8_t v26 = (int16x8_t)vzip1q_s64(v19, v23);
  int16x8_t v27 = (int16x8_t)vzip1q_s64(v18, v22);
  int16x8_t v28 = (int16x8_t)vzip1q_s64(v20, v24);
  int16x8_t v29 = (int16x8_t)vzip2q_s64(v17, v21);
  int16x8_t v30 = (int16x8_t)vzip2q_s64(v19, v23);
  int16x8_t v31 = (int16x8_t)vzip2q_s64(v18, v22);
  int16x8_t v32 = (int16x8_t)vzip2q_s64(v20, v24);
  int16x8_t v33 = vaddq_s16(v29, v25);
  int16x8_t v34 = vsubq_s16(v25, v29);
  int16x8_t v35 = vsubq_s16(vshrq_n_s16(v27, 1uLL), v31);
  int16x8_t v36 = vsraq_n_s16(v27, v31, 1uLL);
  int16x8_t v37 = vsubq_s16(v30, vsraq_n_s16(vaddq_s16(v28, v32), v32, 1uLL));
  int16x8_t v38 = vsubq_s16(vaddq_s16(v32, v26), vsraq_n_s16(v28, v28, 1uLL));
  int16x8_t v39 = vaddq_s16(vsraq_n_s16(v30, v30, 1uLL), vsubq_s16(v32, v26));
  int16x8_t v40 = vsraq_n_s16(vaddq_s16(vaddq_s16(v28, v30), v26), v26, 1uLL);
  int16x8_t v41 = vaddq_s16(v36, v33);
  int16x8_t v42 = vsubq_s16(v33, v36);
  int16x8_t v43 = vaddq_s16(v35, v34);
  int16x8_t v44 = vsubq_s16(v34, v35);
  int16x8_t v45 = vshrq_n_s16(v37, 2uLL);
  int16x8_t v46 = vsraq_n_s16(v37, v40, 2uLL);
  int16x8_t v47 = vsubq_s16(v40, v45);
  int16x8_t v48 = vshrq_n_s16(v38, 2uLL);
  int16x8_t v49 = vsraq_n_s16(v38, v39, 2uLL);
  int16x8_t v50 = vsubq_s16(v48, v39);
  int16x8_t v51 = vaddq_s16(v47, v41);
  int16x8_t v52 = vaddq_s16(v50, v43);
  int16x8_t v53 = vaddq_s16(v49, v44);
  int16x8_t v54 = vaddq_s16(v46, v42);
  int16x8_t v55 = vsubq_s16(v42, v46);
  int16x8_t v56 = vsubq_s16(v44, v49);
  int16x8_t v57 = vsubq_s16(v43, v50);
  int16x8_t v58 = vsubq_s16(v41, v47);
  int32x4_t v59 = (int32x4_t)vtrn1q_s16(v51, v52);
  int32x4_t v60 = (int32x4_t)vtrn2q_s16(v51, v52);
  int32x4_t v61 = (int32x4_t)vtrn1q_s16(v53, v54);
  int32x4_t v62 = (int32x4_t)vtrn2q_s16(v53, v54);
  int32x4_t v63 = (int32x4_t)vtrn1q_s16(v55, v56);
  int32x4_t v64 = (int32x4_t)vtrn2q_s16(v55, v56);
  int32x4_t v65 = (int32x4_t)vtrn1q_s16(v57, v58);
  int32x4_t v66 = (int32x4_t)vtrn2q_s16(v57, v58);
  int64x2_t v67 = (int64x2_t)vtrn1q_s32(v59, v61);
  int64x2_t v68 = (int64x2_t)vtrn2q_s32(v59, v61);
  int64x2_t v69 = (int64x2_t)vtrn1q_s32(v60, v62);
  int64x2_t v70 = (int64x2_t)vtrn2q_s32(v60, v62);
  int64x2_t v71 = (int64x2_t)vtrn1q_s32(v63, v65);
  int64x2_t v72 = (int64x2_t)vtrn2q_s32(v63, v65);
  int64x2_t v73 = (int64x2_t)vtrn1q_s32(v64, v66);
  int64x2_t v74 = (int64x2_t)vtrn2q_s32(v64, v66);
  int16x8_t v75 = (int16x8_t)vzip1q_s64(v67, v71);
  int16x8_t v76 = (int16x8_t)vzip1q_s64(v69, v73);
  int16x8_t v77 = (int16x8_t)vzip1q_s64(v68, v72);
  int16x8_t v78 = (int16x8_t)vzip1q_s64(v70, v74);
  int16x8_t v79 = (int16x8_t)vzip2q_s64(v67, v71);
  int16x8_t v80 = (int16x8_t)vzip2q_s64(v69, v73);
  int16x8_t v81 = (int16x8_t)vzip2q_s64(v68, v72);
  int16x8_t v82 = (int16x8_t)vzip2q_s64(v70, v74);
  int16x8_t v83 = vaddq_s16(v79, v75);
  int16x8_t v84 = vsubq_s16(v75, v79);
  int16x8_t v85 = vsubq_s16(vshrq_n_s16(v77, 1uLL), v81);
  int16x8_t v86 = vsraq_n_s16(v77, v81, 1uLL);
  int16x8_t v87 = vsubq_s16(v80, vsraq_n_s16(vaddq_s16(v78, v82), v82, 1uLL));
  int16x8_t v88 = vsubq_s16(vaddq_s16(v82, v76), vsraq_n_s16(v78, v78, 1uLL));
  int16x8_t v89 = vaddq_s16(vsraq_n_s16(v80, v80, 1uLL), vsubq_s16(v82, v76));
  int16x8_t v90 = vsraq_n_s16(vaddq_s16(vaddq_s16(v78, v80), v76), v76, 1uLL);
  int16x8_t v91 = vaddq_s16(v86, v83);
  int16x8_t v92 = vsubq_s16(v83, v86);
  int16x8_t v93 = vaddq_s16(v85, v84);
  int16x8_t v94 = vsubq_s16(v84, v85);
  int16x8_t v95 = vshrq_n_s16(v87, 2uLL);
  int16x8_t v96 = vsraq_n_s16(v87, v90, 2uLL);
  int16x8_t v97 = vsubq_s16(v90, v95);
  int16x8_t v98 = vshrq_n_s16(v88, 2uLL);
  int16x8_t v99 = vsraq_n_s16(v88, v89, 2uLL);
  int16x8_t v100 = vsubq_s16(v98, v89);
  int16x8_t v101 = vaddq_s16(v100, v93);
  int16x8_t result = vrshrq_n_s16(vsubq_s16(v93, v100), 6uLL);
  *a2 = vrshrq_n_s16(vaddq_s16(v97, v91), 6uLL);
  a2[1] = vrshrq_n_s16(v101, 6uLL);
  a2[2] = vrshrq_n_s16(vaddq_s16(v99, v94), 6uLL);
  a2[3] = vrshrq_n_s16(vaddq_s16(v96, v92), 6uLL);
  a2[4] = vrshrq_n_s16(vsubq_s16(v92, v96), 6uLL);
  a2[5] = vrshrq_n_s16(vsubq_s16(v94, v99), 6uLL);
  a2[6] = result;
  a2[7] = vrshrq_n_s16(vsubq_s16(v91, v97), 6uLL);
  return result;
}

int8x16_t *sub_1BBB633C8(int8x16_t *result, uint8x8_t *a2, int16x8_t *a3, int a4, int a5)
{
  int v5 = a5 + 16;
  v6.i64[0] = 0x1414141414141414;
  v6.i64[1] = 0x1414141414141414;
  v7.i64[0] = 0x505050505050505;
  v7.i64[1] = 0x505050505050505;
  do
  {
    uint8x16_t v8 = *(uint8x16_t *)&a2->i8[-2 * a4];
    uint8x16_t v9 = *(uint8x16_t *)&a2->i8[-a4];
    uint8x16_t v10 = *(uint8x16_t *)&a2->i8[a4];
    uint8x16_t v11 = *(uint8x16_t *)&a2->i8[3 * a4];
    uint8x16_t v12 = *(uint8x16_t *)&a2->i8[2 * a4];
    int16x8_t v13 = (int16x8_t)vmlsl_u8(vmlsl_u8(vmlal_u8(vaddw_u8(vaddw_u8(vmull_u8(*a2, (uint8x8_t)0x1414141414141414), *(uint8x8_t *)v8.i8), *(uint8x8_t *)v11.i8), *(uint8x8_t *)v10.i8, (uint8x8_t)0x1414141414141414), *(uint8x8_t *)v9.i8, (uint8x8_t)0x505050505050505), *(uint8x8_t *)v12.i8, (uint8x8_t)0x505050505050505);
    int16x8_t v14 = (int16x8_t)vmlsl_high_u8(vmlsl_high_u8(vmlal_high_u8(vmlal_high_u8(vaddl_high_u8(v11, v8), *(uint8x16_t *)a2->i8, v6), v10, v6), v9, v7), v12, v7);
    *result++ = vqrshrun_high_n_s16(vqrshrun_n_s16(v13, 5uLL), v14, 5uLL);
    *a3 = v13;
    a3[1] = v14;
    a3 += 2;
    a2 += 2;
    v5 -= 16;
  }
  while (v5 > 16);
  return result;
}

int8x16_t *sub_1BBB6345C(int8x16_t *result, int8x16_t *a2, int a3)
{
  int8x16_t v4 = a2[-1];
  int8x16_t v3 = *a2;
  int v5 = a3 + 16;
  uint8x16_t v6 = a2 + 1;
  v7.i64[0] = 0x1414141414141414;
  v7.i64[1] = 0x1414141414141414;
  v8.i64[0] = 0x505050505050505;
  v8.i64[1] = 0x505050505050505;
  do
  {
    int8x16_t v9 = v3;
    int8x16_t v10 = *v6++;
    int8x16_t v3 = v10;
    uint8x16_t v11 = (uint8x16_t)vextq_s8(v4, v9, 0xEuLL);
    uint8x16_t v12 = (uint8x16_t)vextq_s8(v4, v9, 0xFuLL);
    uint8x16_t v13 = (uint8x16_t)vextq_s8(v9, v10, 1uLL);
    uint8x16_t v14 = (uint8x16_t)vextq_s8(v9, v10, 2uLL);
    uint8x16_t v15 = (uint8x16_t)vextq_s8(v9, v10, 3uLL);
    *result++ = vqrshrun_high_n_s16(vqrshrun_n_s16((int16x8_t)vmlsl_u8(vmlsl_u8(vaddw_u8(vmlal_u8(vaddw_u8(vmull_u8(*(uint8x8_t *)v9.i8, (uint8x8_t)0x1414141414141414), *(uint8x8_t *)v11.i8), *(uint8x8_t *)v13.i8, (uint8x8_t)0x1414141414141414), *(uint8x8_t *)v15.i8), *(uint8x8_t *)v12.i8, (uint8x8_t)0x505050505050505), *(uint8x8_t *)v14.i8, (uint8x8_t)0x505050505050505), 5uLL), (int16x8_t)vmlsl_high_u8(vmlsl_high_u8(vmlal_high_u8(vmlal_high_u8(vaddl_high_u8(v15, v11), (uint8x16_t)v9, v7), v13, v7),
                                 v12,
                                 v8),
                               v14,
                               v8),
                  5uLL);
    v5 -= 16;
    int8x16_t v4 = v9;
  }
  while (v5 > 16);
  return result;
}

__n128 sub_1BBB634E0(int8x16_t *a1, __n128 *a2, int a3)
{
  int8x16_t v4 = (int8x16_t)a2[-1];
  __n128 result = *a2;
  int v5 = a3 + 16;
  uint8x16_t v6 = (int8x16_t *)&a2[2];
  do
  {
    int16x8_t v7 = (int16x8_t)vextq_s8(v4, (int8x16_t)result, 0xCuLL);
    int16x8_t v8 = (int16x8_t)v6[-1];
    __n128 v9 = *(__n128 *)v6;
    int16x8_t v10 = vaddq_s16((int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 2uLL), (int16x8_t)result);
    int16x8_t v11 = (int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 0xCuLL);
    int16x8_t v12 = vaddq_s16((int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 4uLL), (int16x8_t)vextq_s8(v4, (int8x16_t)result, 0xEuLL));
    *(int8x8_t *)v12.i8 = vqrshrun_n_s16(vsraq_n_s16(v10, vsraq_n_s16(vsubq_s16(v10, v12), vsubq_s16(vaddq_s16((int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 6uLL), v7), v12), 2uLL), 2uLL), 6uLL);
    int16x8_t v13 = vaddq_s16((int16x8_t)vextq_s8((int8x16_t)v8, *v6, 4uLL), (int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 0xEuLL));
    int16x8_t v14 = vaddq_s16((int16x8_t)vextq_s8((int8x16_t)v8, *v6, 2uLL), v8);
    *a1++ = vqrshrun_high_n_s16(*(int8x8_t *)v12.i8, vsraq_n_s16(v14, vsraq_n_s16(vsubq_s16(v14, v13), vsubq_s16(vaddq_s16((int16x8_t)vextq_s8((int8x16_t)v8, *v6, 6uLL), v11), v13), 2uLL), 2uLL), 6uLL);
    v5 -= 16;
    v6 += 2;
    __n128 result = v9;
    int8x16_t v4 = (int8x16_t)v8;
  }
  while (v5 > 16);
  return result;
}

const char *sub_1BBB63578(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v6 = (32 * a2);
  int16x8_t v7 = (const char *)(a1 + v6 + 32);
  int v8 = 16 * a3;
  int v9 = 16 * a4;
  sub_1BBB6367C(v7, -a2, 16 * a3);
  if (v9 >= 1)
  {
    int v10 = 0;
    int16x8_t v11 = v7;
    do
    {
      int16x8_t v12 = v11;
      int8x16_t v14 = vld1q_dup_s8(v12);
      int16x8_t v13 = &v12[a2];
      *((int8x16_t *)v11 - 2) = v14;
      *((int8x16_t *)v11 - 1) = v14;
      uint8x16_t v15 = v13;
      int8x16_t v16 = vld1q_dup_s8(v15);
      int16x8_t v11 = &v15[a2];
      *((int8x16_t *)v13 - 2) = v16;
      *((int8x16_t *)v13 - 1) = v16;
      v10 += 2;
    }
    while (v10 < v9);
    int v17 = 0;
    uint64_t v18 = a1 + a2 + (uint64_t)v8;
    uint64_t v19 = 2 * a2;
    uint64_t v20 = a1 + v8;
    do
    {
      int64x2_t v21 = (int8x16_t *)(v20 + v6);
      int64x2_t v22 = (const char *)(v20 + v6 + 31);
      int8x16_t v23 = vld1q_dup_s8(v22);
      v21[2] = v23;
      v21[3] = v23;
      int64x2_t v24 = (int8x16_t *)(v18 + v6);
      int16x8_t v25 = (const char *)(v18 + v6 + 31);
      int8x16_t v26 = vld1q_dup_s8(v25);
      v24[2] = v26;
      v24[3] = v26;
      v17 += 2;
      v18 += v19;
      v20 += v19;
    }
    while (v17 < v9);
  }

  return sub_1BBB6367C(&v7[(v9 - 1) * a2], a2, v8);
}

const char *sub_1BBB6367C(const char *result, int a2, int a3)
{
  uint64_t v3 = a2;
  uint64_t v4 = 4 * a2;
  int8x16_t v5 = vld1q_dup_s8(result);
  uint64_t v6 = 5 * a2;
  uint64_t v7 = 6 * a2;
  uint64_t v8 = 7 * a2;
  uint64_t v9 = 2 * a2;
  uint64_t v10 = 3 * a2;
  uint64_t v11 = a2 - 32;
  uint64_t v12 = 2 * a2 - 32;
  unsigned int v13 = -4;
  int8x16_t v14 = result;
  do
  {
    _X20 = &v14[v11 + v4];
    __asm { PRFM            #0x10, [X20] }
    int64x2_t v21 = (int8x16_t *)&v14[v11];
    _X21 = &v14[v11 + v6];
    __asm { PRFM            #0x10, [X21] }
    _X21 = &v14[v11 + v7];
    __asm { PRFM            #0x10, [X21] }
    _X21 = &v14[v11 + v8];
    __asm { PRFM            #0x10, [X21] }
    *int64x2_t v21 = v5;
    v21[1] = v5;
    int16x8_t v28 = (int8x16_t *)&v14[v12];
    *int16x8_t v28 = v5;
    v28[1] = v5;
    int16x8_t v29 = (int8x16_t *)&v14[v11 + v9];
    int8x16_t *v29 = v5;
    v29[1] = v5;
    int16x8_t v30 = (int8x16_t *)&v14[v11 + v10];
    v13 += 4;
    v14 += v4;
    int8x16_t *v30 = v5;
    v30[1] = v5;
  }
  while (v13 < 0x1C);
  uint64_t v31 = 2 * v3;
  if (a3 >= 1)
  {
    int v32 = 0;
    int16x8_t v33 = result;
    do
    {
      long long v34 = *v33;
      long long v35 = v33[1];
      unsigned int v36 = -4;
      int16x8_t v37 = v33;
      do
      {
        _X21 = (char *)v37 + v3 + v4;
        __asm { PRFM            #0x10, [X21] }
        int16x8_t v40 = (_OWORD *)((char *)v37 + v3);
        _X22 = (char *)v37 + v3 + v6;
        __asm { PRFM            #0x10, [X22] }
        _X22 = (char *)v37 + v3 + v7;
        __asm { PRFM            #0x10, [X22] }
        _X22 = (char *)v37 + v3 + v8;
        __asm { PRFM            #0x10, [X22] }
        *int16x8_t v40 = v34;
        v40[1] = v35;
        int16x8_t v47 = (_OWORD *)((char *)v37 + v31);
        *int16x8_t v47 = v34;
        v47[1] = v35;
        int16x8_t v48 = (_OWORD *)((char *)v37 + v3 + v9);
        *int16x8_t v48 = v34;
        v48[1] = v35;
        int16x8_t v49 = (_OWORD *)((char *)v37 + v3 + v10);
        v36 += 4;
        int16x8_t v37 = (_OWORD *)((char *)v37 + v4);
        *int16x8_t v49 = v34;
        v49[1] = v35;
      }
      while (v36 < 0x1C);
      v33 += 2;
      v32 += 32;
    }
    while (v32 < a3);
  }
  int16x8_t v50 = &result[a3];
  int16x8_t v51 = v50 - 1;
  int8x16_t v52 = vld1q_dup_s8(v51);
  uint64_t v53 = v3 + v10;
  uint64_t v54 = v3 + v9;
  uint64_t v55 = v3 + v6;
  uint64_t v56 = v3 + v7;
  uint64_t v57 = v3 + v8;
  LODWORD(result) = -4;
  do
  {
    _X1 = &v50[v3 + v4];
    __asm { PRFM            #0x10, [X1] }
    int32x4_t v60 = (int8x16_t *)&v50[v3];
    _X2 = &v50[v55];
    __asm { PRFM            #0x10, [X2] }
    _X2 = &v50[v56];
    __asm { PRFM            #0x10, [X2] }
    _X2 = &v50[v57];
    __asm { PRFM            #0x10, [X2] }
    *int32x4_t v60 = v52;
    v60[1] = v52;
    int64x2_t v67 = (int8x16_t *)&v50[v31];
    *int64x2_t v67 = v52;
    v67[1] = v52;
    int64x2_t v68 = (int8x16_t *)&v50[v54];
    *int64x2_t v68 = v52;
    v68[1] = v52;
    int64x2_t v69 = (int8x16_t *)&v50[v53];
    __n128 result = (const char *)(result + 4);
    v50 += v4;
    *int64x2_t v69 = v52;
    v69[1] = v52;
  }
  while (result < 0x1C);
  return result;
}

const __int16 *sub_1BBB63854(const __int16 *a1, int a2, int a3, int a4)
{
  sub_1BBB63928(a1, -a2, a3);
  if (a4 >= 1)
  {
    int v8 = 0;
    uint64_t v9 = a1;
    uint64_t v10 = (int16x8_t *)((char *)a1 + a3);
    do
    {
      uint64_t v11 = v9;
      int16x8_t v13 = vld1q_dup_s16(v11);
      uint64_t v12 = (const __int16 *)((char *)v11 + a2);
      *((int16x8_t *)v9 - 2) = v13;
      *((int16x8_t *)v9 - 1) = v13;
      int8x16_t v14 = v12;
      int16x8_t v15 = vld1q_dup_s16(v14);
      uint64_t v9 = (const __int16 *)((char *)v14 + a2);
      *((int16x8_t *)v12 - 2) = v15;
      *((int16x8_t *)v12 - 1) = v15;
      v8 += 2;
    }
    while (v8 < a4);
    int v16 = 0;
    do
    {
      int v17 = &v10[-1].i16[7];
      int16x8_t v18 = vld1q_dup_s16(v17);
      *uint64_t v10 = v18;
      v10[1] = v18;
      uint64_t v19 = (int16x8_t *)((char *)v10 + a2);
      uint64_t v20 = &v19[-1].i16[7];
      int16x8_t v21 = vld1q_dup_s16(v20);
      int16x8_t *v19 = v21;
      v19[1] = v21;
      uint64_t v10 = (int16x8_t *)((char *)v19 + a2);
      v16 += 2;
    }
    while (v16 < a4);
  }

  return sub_1BBB63928((const __int16 *)((char *)a1 + (a4 - 1) * a2), a2, a3);
}

const __int16 *sub_1BBB63928(const __int16 *result, int a2, int a3)
{
  uint64_t v3 = a2;
  uint64_t v4 = 4 * a2;
  int16x8_t v5 = vld1q_dup_s16(result);
  uint64_t v6 = 5 * a2;
  uint64_t v7 = 6 * a2;
  uint64_t v8 = 7 * a2;
  uint64_t v9 = 2 * a2;
  uint64_t v10 = 3 * a2;
  uint64_t v11 = a2 - 32;
  uint64_t v12 = 2 * a2 - 32;
  unsigned int v13 = -4;
  int8x16_t v14 = result;
  do
  {
    _X20 = (char *)v14 + v11 + v4;
    __asm { PRFM            #0x10, [X20] }
    int16x8_t v21 = (int16x8_t *)((char *)v14 + v11);
    _X21 = (char *)v14 + v11 + v6;
    __asm { PRFM            #0x10, [X21] }
    _X21 = (char *)v14 + v11 + v7;
    __asm { PRFM            #0x10, [X21] }
    _X21 = (char *)v14 + v11 + v8;
    __asm { PRFM            #0x10, [X21] }
    *int16x8_t v21 = v5;
    v21[1] = v5;
    int16x8_t v28 = (int16x8_t *)((char *)v14 + v12);
    *int16x8_t v28 = v5;
    v28[1] = v5;
    int16x8_t v29 = (int16x8_t *)((char *)v14 + v11 + v9);
    int16x8_t *v29 = v5;
    v29[1] = v5;
    int16x8_t v30 = (int16x8_t *)((char *)v14 + v11 + v10);
    v13 += 4;
    int8x16_t v14 = (const __int16 *)((char *)v14 + v4);
    int16x8_t *v30 = v5;
    v30[1] = v5;
  }
  while (v13 < 0xC);
  uint64_t v31 = 2 * v3;
  if (a3 >= 1)
  {
    int v32 = 0;
    int16x8_t v33 = result;
    do
    {
      long long v34 = *v33;
      long long v35 = v33[1];
      unsigned int v36 = -4;
      int16x8_t v37 = v33;
      do
      {
        _X21 = (char *)v37 + v3 + v4;
        __asm { PRFM            #0x10, [X21] }
        int16x8_t v40 = (_OWORD *)((char *)v37 + v3);
        _X22 = (char *)v37 + v3 + v6;
        __asm { PRFM            #0x10, [X22] }
        _X22 = (char *)v37 + v3 + v7;
        __asm { PRFM            #0x10, [X22] }
        _X22 = (char *)v37 + v3 + v8;
        __asm { PRFM            #0x10, [X22] }
        *int16x8_t v40 = v34;
        v40[1] = v35;
        int16x8_t v47 = (_OWORD *)((char *)v37 + v31);
        *int16x8_t v47 = v34;
        v47[1] = v35;
        int16x8_t v48 = (_OWORD *)((char *)v37 + v3 + v9);
        *int16x8_t v48 = v34;
        v48[1] = v35;
        int16x8_t v49 = (_OWORD *)((char *)v37 + v3 + v10);
        v36 += 4;
        int16x8_t v37 = (_OWORD *)((char *)v37 + v4);
        *int16x8_t v49 = v34;
        v49[1] = v35;
      }
      while (v36 < 0xC);
      v33 += 2;
      v32 += 32;
    }
    while (v32 < a3);
  }
  int16x8_t v50 = (char *)result + a3;
  int16x8_t v51 = (const __int16 *)(v50 - 2);
  int16x8_t v52 = vld1q_dup_s16(v51);
  uint64_t v53 = v3 + v10;
  uint64_t v54 = v3 + v9;
  uint64_t v55 = v3 + v6;
  uint64_t v56 = v3 + v7;
  uint64_t v57 = v3 + v8;
  LODWORD(result) = -4;
  do
  {
    _X1 = &v50[v3 + v4];
    __asm { PRFM            #0x10, [X1] }
    int32x4_t v60 = (int16x8_t *)&v50[v3];
    _X2 = &v50[v55];
    __asm { PRFM            #0x10, [X2] }
    _X2 = &v50[v56];
    __asm { PRFM            #0x10, [X2] }
    _X2 = &v50[v57];
    __asm { PRFM            #0x10, [X2] }
    *int32x4_t v60 = v52;
    v60[1] = v52;
    int64x2_t v67 = (int16x8_t *)&v50[v31];
    *int64x2_t v67 = v52;
    v67[1] = v52;
    int64x2_t v68 = (int16x8_t *)&v50[v54];
    *int64x2_t v68 = v52;
    v68[1] = v52;
    int64x2_t v69 = (int16x8_t *)&v50[v53];
    __n128 result = (const __int16 *)(result + 4);
    v50 += v4;
    *int64x2_t v69 = v52;
    v69[1] = v52;
  }
  while (result < 0xC);
  return result;
}

uint8x16_t sub_1BBB63B00(uint8x16_t *a1, int a2, unsigned int a3, unsigned int a4, unsigned int *a5)
{
  if (*a5 != -1)
  {
    int8x8_t v5 = (int8x8_t)vdup_n_s32(*a5);
    int32x2_t v6 = (int32x2_t)vtrn1_s8(v5, v5);
    int32x2_t v7 = (int32x2_t)vtrn2_s8(v5, v5);
    int16x4_t v8 = (int16x4_t)vzip1_s32(v6, v7);
    int16x4_t v9 = (int16x4_t)vzip2_s32(v6, v7);
    *(int16x4_t *)v10.i8 = vtrn1_s16(v8, v9);
    v10.u64[1] = (unint64_t)vtrn2_s16(v8, v9);
    int8x16_t v11 = vdupq_n_s8(a4);
    uint8x16_t v12 = *(uint8x16_t *)((char *)a1 - 3 * a2);
    unsigned int v13 = (uint8x16_t *)((char *)a1 - 2 * a2);
    int8x16_t v14 = (uint8x16_t *)((char *)a1 - a2);
    int8x16_t v15 = *(int8x16_t *)((char *)a1 + a2);
    uint8x16_t v16 = *(uint8x16_t *)((char *)a1 + 2 * a2);
    v17.i64[0] = -1;
    v17.i64[1] = -1;
    int8x16_t v18 = vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)vdupq_n_s8(a3), vabdq_u8(*v14, *a1)), (int8x16_t)vcgtq_u8((uint8x16_t)v11, vabdq_u8(*v13, *v14))), (int8x16_t)vcgtq_u8((uint8x16_t)v11, vabdq_u8((uint8x16_t)v15, *a1))), vcgtq_s8(v10, v17));
    v19.i64[0] = 0x101010101010101;
    v19.i64[1] = 0x101010101010101;
    uint8x16_t v20 = (uint8x16_t)vandq_s8(v11, v18);
    int8x16_t v21 = vandq_s8(v10, v18);
    uint8x16_t v22 = vrhaddq_u8(*v14, *a1);
    int8x16_t v23 = vqaddq_s8(vrhaddq_s8(vshrq_n_s8((int8x16_t)vhsubq_u8(*v13, (uint8x16_t)v15), 1uLL), vandq_s8(veorq_s8(*(int8x16_t *)a1, *(int8x16_t *)v14), v19)), (int8x16_t)vhsubq_u8(*a1, *v14));
    int8x16_t v24 = (int8x16_t)vcgtq_u8(v20, vabdq_u8(v12, *v14));
    int8x16_t v25 = (int8x16_t)vcgtq_u8(v20, vabdq_u8(v16, *a1));
    uint8x16_t v26 = vhaddq_u8(v12, v22);
    uint8x16_t v27 = vhaddq_u8(v16, v22);
    int8x16_t v28 = vandq_s8((int8x16_t)vminq_u8(vabdq_u8(v26, *v13), (uint8x16_t)v21), v24);
    int8x16_t v29 = vandq_s8((int8x16_t)vminq_u8(vabdq_u8(v27, (uint8x16_t)v15), (uint8x16_t)v21), v25);
    uint8x16_t v30 = (uint8x16_t)vsubq_s8(vsubq_s8(v21, v24), v25);
    int8x16_t v31 = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8(*v13, v26), vnegq_s8(v28), v28), *(int8x16_t *)v13);
    uint8x16_t v32 = vminq_u8((uint8x16_t)vqabsq_s8(v23), v30);
    int8x16_t v33 = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v15, v27), vnegq_s8(v29), v29), v15);
    int8x16_t v34 = (int8x16_t)vqaddq_u8(*v14, v32);
    int8x16_t v35 = (int8x16_t)vqsubq_u8(*v14, v32);
    int8x16_t v36 = (int8x16_t)vqaddq_u8(*a1, v32);
    int8x16_t v37 = (int8x16_t)vqsubq_u8(*a1, v32);
    int8x16_t v38 = vcltzq_s8(v23);
    *unsigned int v13 = (uint8x16_t)v31;
    *(int8x16_t *)int8x16_t v14 = vbslq_s8(v38, v35, v34);
    uint8x16_t result = (uint8x16_t)vbslq_s8(v38, v36, v37);
    *a1 = result;
    *(int8x16_t *)((char *)a1 + a2) = v33;
  }
  return result;
}

int16x8_t sub_1BBB63C48(uint64_t a1, int a2, unsigned int a3, unsigned int a4, unsigned int *a5)
{
  if (*a5 != -1)
  {
    int8x8_t v5 = (int8x8_t)vdup_n_s32(*a5);
    int32x2_t v6 = (int32x2_t)vtrn1_s8(v5, v5);
    int32x2_t v7 = (int32x2_t)vtrn2_s8(v5, v5);
    int16x4_t v8 = (int16x4_t)vzip1_s32(v6, v7);
    int16x4_t v9 = (int16x4_t)vzip2_s32(v6, v7);
    *(int16x4_t *)v10.i8 = vtrn1_s16(v8, v9);
    v10.u64[1] = (unint64_t)vtrn2_s16(v8, v9);
    int8x16_t v11 = vdupq_n_s8(a4);
    v12.i64[0] = *(void *)(a1 - 4);
    v12.i64[1] = *(void *)(a1 - 4 + 8 * a2);
    v13.i64[0] = *(void *)(a1 - 4 + a2);
    uint64_t v14 = 9 * a2;
    v13.i64[1] = *(void *)(a1 - 4 + v14);
    uint64_t v15 = 2 * a2;
    v16.i64[0] = *(void *)(a1 - 4 + v15);
    uint64_t v17 = 5 * a2;
    v16.i64[1] = *(void *)(a1 - 4 + 10 * a2);
    uint64_t v18 = 3 * a2;
    v19.i64[0] = *(void *)(a1 - 4 + v18);
    v19.i64[1] = *(void *)(a1 - 4 + 11 * a2);
    v20.i64[0] = *(void *)(a1 - 4 + 4 * a2);
    v20.i64[1] = *(void *)(a1 - 4 + 12 * a2);
    v21.i64[0] = *(void *)(a1 - 4 + v17);
    v21.i64[1] = *(void *)(a1 - 4 + 13 * a2);
    v22.i64[0] = *(void *)(a1 - 4 + 6 * a2);
    uint64_t v23 = 14 * a2;
    v22.i64[1] = *(void *)(a1 - 4 + v23);
    uint64_t v24 = 7 * a2;
    v25.i64[0] = *(void *)(a1 - 4 + v24);
    uint64_t v26 = 15 * a2;
    v25.i64[1] = *(void *)(a1 - 4 + v26);
    v61.val[0] = vtrn1q_s8(v12, v13);
    v61.val[1] = vtrn1q_s8(v16, v19);
    int16x8_t v27 = (int16x8_t)vtrn2q_s8(v12, v13);
    int16x8_t v28 = (int16x8_t)vtrn2q_s8(v16, v19);
    v60.val[0] = vtrn1q_s8(v20, v21);
    v60.val[1] = vtrn1q_s8(v22, v25);
    int16x8_t v29 = (int16x8_t)vtrn2q_s8(v20, v21);
    int16x8_t v30 = (int16x8_t)vtrn2q_s8(v22, v25);
    int32x4_t v31 = (int32x4_t)vqtbl2q_s8(v61, (int8x16_t)xmmword_1BBB700E0);
    v61.val[0] = (int8x16_t)vtrn2q_s16((int16x8_t)v61.val[0], (int16x8_t)v61.val[1]);
    v61.val[1] = (int8x16_t)vtrn1q_s16(v27, v28);
    int32x4_t v32 = (int32x4_t)vtrn2q_s16(v27, v28);
    int32x4_t v33 = (int32x4_t)vqtbl2q_s8(v60, (int8x16_t)xmmword_1BBB700E0);
    v60.val[0] = (int8x16_t)vtrn2q_s16((int16x8_t)v60.val[0], (int16x8_t)v60.val[1]);
    v60.val[1] = (int8x16_t)vtrn1q_s16(v29, v30);
    int32x4_t v34 = (int32x4_t)vtrn2q_s16(v29, v30);
    int8x16_t v35 = (int8x16_t)vtrn2q_s32(v31, v33);
    uint8x16_t v36 = (uint8x16_t)vtrn1q_s32((int32x4_t)v61.val[1], (int32x4_t)v60.val[1]);
    v60.val[1] = (int8x16_t)vtrn2q_s32((int32x4_t)v61.val[1], (int32x4_t)v60.val[1]);
    int8x16_t v37 = (int8x16_t)vtrn1q_s32((int32x4_t)v61.val[0], (int32x4_t)v60.val[0]);
    v60.val[0] = (int8x16_t)vtrn2q_s32((int32x4_t)v61.val[0], (int32x4_t)v60.val[0]);
    int8x16_t v38 = (int8x16_t)vtrn1q_s32(v32, v34);
    v61.val[1].i64[0] = -1;
    v61.val[1].i64[1] = -1;
    int8x16_t v39 = vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)vdupq_n_s8(a3), vabdq_u8((uint8x16_t)v38, (uint8x16_t)v35)), vcgtq_s8(v10, v61.val[1])), vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v11, vabdq_u8((uint8x16_t)v37, (uint8x16_t)v38)), (int8x16_t)vcgtq_u8((uint8x16_t)v11, vabdq_u8((uint8x16_t)v60.val[1], (uint8x16_t)v35))));
    v31.i64[0] = 0x101010101010101;
    v31.i64[1] = 0x101010101010101;
    uint8x16_t v40 = (uint8x16_t)vandq_s8(v11, v39);
    int8x16_t v41 = vandq_s8(v10, v39);
    v61.val[1] = (int8x16_t)vrhaddq_u8((uint8x16_t)v38, (uint8x16_t)v35);
    int8x16_t v42 = vqaddq_s8(vrhaddq_s8(vshrq_n_s8((int8x16_t)vhsubq_u8((uint8x16_t)v37, (uint8x16_t)v60.val[1]), 1uLL), vandq_s8(veorq_s8(v35, v38), (int8x16_t)v31)), (int8x16_t)vhsubq_u8((uint8x16_t)v35, (uint8x16_t)v38));
    int8x16_t v43 = (int8x16_t)vcgtq_u8(v40, vabdq_u8(v36, (uint8x16_t)v38));
    int8x16_t v44 = (int8x16_t)vcgtq_u8(v40, vabdq_u8((uint8x16_t)v60.val[0], (uint8x16_t)v35));
    uint8x16_t v45 = vhaddq_u8(v36, (uint8x16_t)v61.val[1]);
    v60.val[0] = (int8x16_t)vhaddq_u8((uint8x16_t)v60.val[0], (uint8x16_t)v61.val[1]);
    v61.val[0] = vandq_s8((int8x16_t)vminq_u8(vabdq_u8(v45, (uint8x16_t)v37), (uint8x16_t)v41), v43);
    v61.val[1] = vandq_s8((int8x16_t)vminq_u8(vabdq_u8((uint8x16_t)v60.val[0], (uint8x16_t)v60.val[1]), (uint8x16_t)v41), v44);
    uint8x16_t v46 = (uint8x16_t)vsubq_s8(vsubq_s8(v41, v43), v44);
    int8x16_t v47 = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v37, v45), vnegq_s8(v61.val[0]), v61.val[0]), v37);
    uint8x16_t v48 = vminq_u8((uint8x16_t)vqabsq_s8(v42), v46);
    v60.val[0] = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v60.val[1], (uint8x16_t)v60.val[0]), vnegq_s8(v61.val[1]), v61.val[1]), v60.val[1]);
    int8x16_t v49 = vcltzq_s8(v42);
    int8x16_t v50 = vbslq_s8(v49, (int8x16_t)vqsubq_u8((uint8x16_t)v38, v48), (int8x16_t)vqaddq_u8((uint8x16_t)v38, v48));
    int8x16_t v51 = vbslq_s8(v49, (int8x16_t)vqaddq_u8((uint8x16_t)v35, v48), (int8x16_t)vqsubq_u8((uint8x16_t)v35, v48));
    int16x8_t v52 = (int16x8_t)vtrn1q_s8(v47, v50);
    int16x8_t v53 = (int16x8_t)vtrn2q_s8(v47, v50);
    int16x8_t v54 = (int16x8_t)vtrn1q_s8(v51, v60.val[0]);
    int16x8_t v55 = (int16x8_t)vtrn2q_s8(v51, v60.val[0]);
    int16x8_t v56 = vtrn1q_s16(v52, v54);
    v60.val[0] = (int8x16_t)vtrn1q_s16(v53, v55);
    *(_DWORD *)(a1 - 2) = v56.i32[0];
    uint64_t v57 = a1 - 2;
    *(_DWORD *)(v57 + a2) = v60.val[0].i32[0];
    int16x8_t v58 = vtrn2q_s16(v52, v54);
    int16x8_t result = vtrn2q_s16(v53, v55);
    *(_DWORD *)(v57 + v15) = v58.i32[0];
    *(_DWORD *)(v57 + v18) = result.i32[0];
    *(_DWORD *)(v57 + 4 * a2) = v56.i32[1];
    *(_DWORD *)(v57 + v17) = v60.val[0].i32[1];
    *(_DWORD *)(v57 + 6 * a2) = v58.i32[1];
    *(_DWORD *)(v57 + v24) = result.i32[1];
    *(_DWORD *)(v57 + 8 * a2) = v56.i32[2];
    *(_DWORD *)(v57 + v14) = v60.val[0].i32[2];
    *(_DWORD *)(v57 + 10 * a2) = v58.i32[2];
    *(_DWORD *)(v57 + 11 * a2) = result.i32[2];
    *(_DWORD *)(v57 + 12 * a2) = v56.i32[3];
    *(_DWORD *)(v57 + 13 * a2) = v60.val[0].i32[3];
    *(_DWORD *)(v57 + v23) = v58.i32[3];
    *(_DWORD *)(v57 + v26) = result.i32[3];
  }
  return result;
}

uint8x16_t sub_1BBB63EF0(uint8x16_t *a1, int a2, unsigned int a3, unsigned int a4)
{
  uint8x16_t v4 = (uint8x16_t)vdupq_n_s8(a3);
  int8x16_t v5 = vdupq_n_s8(a4);
  uint64_t v6 = 2 * a2;
  int32x2_t v7 = (uint8x16_t *)((char *)a1 - v6);
  int16x4_t v8 = (uint8x16_t *)((char *)a1 - a2);
  int8x16_t v9 = *(int8x16_t *)a1;
  int8x16_t v10 = *(int8x16_t *)((char *)a1 + a2);
  uint8x16_t v11 = vabdq_u8(*v8, *a1);
  uint64_t v12 = 3 * a2;
  int8x16_t v13 = *(int8x16_t *)((char *)a1 - v12);
  v14.i64[0] = 0x202020202020202;
  v14.i64[1] = 0x202020202020202;
  uint8x16_t v15 = vsraq_n_u8(v14, v4, 2uLL);
  int8x16_t v16 = *(int8x16_t *)((char *)a1 + v6);
  int8x16_t v17 = vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v5, vabdq_u8(*(uint8x16_t *)((char *)a1 - v6), *v8)), (int8x16_t)vcgtq_u8(v4, v11)), (int8x16_t)vcgtq_u8((uint8x16_t)v5, vabdq_u8((uint8x16_t)v10, *a1)));
  uint8x16_t v18 = (uint8x16_t)vandq_s8(vandq_s8(v5, (int8x16_t)vcgtq_u8(v15, v11)), v17);
  uint8x16_t v19 = vhaddq_u8((uint8x16_t)v13, (uint8x16_t)v10);
  uint16x8_t v20 = vaddl_u8(*(uint8x8_t *)a1->i8, *(uint8x8_t *)v8->i8);
  int16x8_t v21 = (int16x8_t)vhaddq_u16(vaddl_u8(*(uint8x8_t *)&a1->i8[-v6], *(uint8x8_t *)v13.i8), v20);
  uint8x16_t v22 = *(uint8x16_t *)((char *)a1 + v12);
  uint16x8_t v23 = vaddl_high_u8(*a1, *v8);
  int16x8_t v24 = (int16x8_t)vhaddq_u16(vaddl_high_u8(*(uint8x16_t *)((char *)a1 - v6), (uint8x16_t)v13), v23);
  int8x16_t v25 = (int8x16_t)vcgeq_u8(vabdq_u8((uint8x16_t)v13, *v8), v18);
  int8x16_t v26 = vbslq_s8(v25, v13, vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)&a1->i8[-4 * a2]), v21), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v13, *(uint8x16_t *)((char *)a1 - 4 * a2)), v24), 2uLL));
  int8x16_t v27 = vbslq_s8(v25, *(int8x16_t *)((char *)a1 - v6), vrshrn_high_n_s16(vrshrn_n_s16(v21, 1uLL), v24, 1uLL));
  int8x16_t v28 = vbslq_s8(v17, vbslq_s8(v25, (int8x16_t)vrhaddq_u8(vhaddq_u8(*v8, (uint8x16_t)v10), *v7), vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8(vaddw_u8(v20, *(uint8x8_t *)v7->i8), *(uint8x8_t *)v19.i8), 2uLL), (int16x8_t)vaddw_high_u8(vaddw_high_u8(v23, *v7), v19), 2uLL)), *(int8x16_t *)v8);
  uint8x16_t v29 = vhaddq_u8((uint8x16_t)v16, *(uint8x16_t *)((char *)a1 - v6));
  int16x8_t v30 = (int16x8_t)vhaddq_u16(vaddl_u8(*(uint8x8_t *)v16.i8, *(uint8x8_t *)v10.i8), v20);
  int16x8_t v31 = (int16x8_t)vhaddq_u16(vaddl_high_u8((uint8x16_t)v16, (uint8x16_t)v10), v23);
  int8x16_t v32 = (int8x16_t)vcgeq_u8(vabdq_u8((uint8x16_t)v16, *a1), v18);
  int8x16_t v33 = vbslq_s8(v32, (int8x16_t)vrhaddq_u8(vhaddq_u8(*a1, *(uint8x16_t *)((char *)a1 - v6)), (uint8x16_t)v10), vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8(vaddw_u8(v20, *(uint8x8_t *)v10.i8), *(uint8x8_t *)v29.i8), 2uLL), (int16x8_t)vaddw_high_u8(vaddw_high_u8(v23, (uint8x16_t)v10), v29), 2uLL));
  *(int8x16_t *)((char *)a1 - v12) = v26;
  *int32x2_t v7 = (uint8x16_t)v27;
  *int16x4_t v8 = (uint8x16_t)v28;
  uint8x16_t result = (uint8x16_t)vbslq_s8(v17, v33, v9);
  *a1 = result;
  *(int8x16_t *)((char *)a1 + a2) = vbslq_s8(v32, v10, vrshrn_high_n_s16(vrshrn_n_s16(v30, 1uLL), v31, 1uLL));
  *(int8x16_t *)((char *)a1 + v6) = vbslq_s8(v32, v16, vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v22.i8, *(uint8x8_t *)v16.i8), v30), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8(v22, (uint8x16_t)v16), v31), 2uLL));
  return result;
}

int32x4_t sub_1BBB6406C(uint64_t a1, int a2, unsigned int a3, unsigned int a4)
{
  uint8x16_t v4 = (uint8x16_t)vdupq_n_s8(a3);
  int8x16_t v5 = vdupq_n_s8(a4);
  uint64_t v7 = *(void *)(a1 - 4);
  uint64_t v6 = (void *)(a1 - 4);
  v8.i64[0] = v7;
  int8x16_t v9 = &v6[a2];
  v8.i64[1] = *v9;
  v10.i64[0] = *(void *)((char *)v6 + a2);
  uint8x16_t v11 = (void *)((char *)v6 + 9 * a2);
  v10.i64[1] = *v11;
  uint64_t v12 = 2 * a2;
  v13.i64[0] = *(void *)((char *)v6 + v12);
  uint8x16_t v14 = (void *)((char *)v6 + 10 * a2);
  v13.i64[1] = *v14;
  uint64_t v15 = 3 * a2;
  v16.i64[0] = *(void *)((char *)v6 + v15);
  int8x16_t v17 = (void *)((char *)v6 + 11 * a2);
  v16.i64[1] = *v17;
  uint64_t v18 = 4 * a2;
  v19.i64[0] = *(void *)((char *)v6 + v18);
  uint16x8_t v20 = (void *)((char *)v6 + 12 * a2);
  v19.i64[1] = *v20;
  uint64_t v21 = 5 * a2;
  v22.i64[0] = *(void *)((char *)v6 + v21);
  uint16x8_t v23 = (void *)((char *)v6 + 13 * a2);
  v22.i64[1] = *v23;
  uint64_t v24 = 6 * a2;
  v25.i64[0] = *(void *)((char *)v6 + v24);
  int8x16_t v26 = (void *)((char *)v6 + 14 * a2);
  v25.i64[1] = *v26;
  uint64_t v27 = 7 * a2;
  v28.i64[0] = *(void *)((char *)v6 + v27);
  uint8x16_t v29 = (void *)((char *)&v6[2 * a2] - a2);
  v28.i64[1] = *v29;
  int16x8_t v30 = (int16x8_t)vtrn1q_s8(v8, v10);
  int16x8_t v31 = (int16x8_t)vtrn2q_s8(v8, v10);
  int16x8_t v32 = (int16x8_t)vtrn1q_s8(v13, v16);
  int16x8_t v33 = (int16x8_t)vtrn2q_s8(v13, v16);
  int16x8_t v34 = (int16x8_t)vtrn1q_s8(v19, v22);
  int16x8_t v35 = (int16x8_t)vtrn2q_s8(v19, v22);
  int16x8_t v36 = (int16x8_t)vtrn1q_s8(v25, v28);
  int16x8_t v37 = (int16x8_t)vtrn2q_s8(v25, v28);
  int32x4_t v38 = (int32x4_t)vtrn1q_s16(v30, v32);
  int32x4_t v39 = (int32x4_t)vtrn2q_s16(v30, v32);
  int32x4_t v40 = (int32x4_t)vtrn1q_s16(v31, v33);
  int32x4_t v41 = (int32x4_t)vtrn2q_s16(v31, v33);
  int32x4_t v42 = (int32x4_t)vtrn1q_s16(v34, v36);
  int32x4_t v43 = (int32x4_t)vtrn2q_s16(v34, v36);
  int32x4_t v44 = (int32x4_t)vtrn1q_s16(v35, v37);
  int32x4_t v45 = (int32x4_t)vtrn2q_s16(v35, v37);
  int8x16_t v46 = (int8x16_t)vtrn1q_s32(v38, v42);
  int8x16_t v47 = (int8x16_t)vtrn2q_s32(v38, v42);
  int8x16_t v48 = (int8x16_t)vtrn1q_s32(v40, v44);
  int8x16_t v49 = (int8x16_t)vtrn2q_s32(v40, v44);
  int8x16_t v50 = (int8x16_t)vtrn1q_s32(v39, v43);
  int8x16_t v51 = (int8x16_t)vtrn2q_s32(v39, v43);
  int8x16_t v52 = (int8x16_t)vtrn1q_s32(v41, v45);
  int8x16_t v53 = (int8x16_t)vtrn2q_s32(v41, v45);
  uint8x16_t v54 = vabdq_u8((uint8x16_t)v52, (uint8x16_t)v47);
  v55.i64[0] = 0x202020202020202;
  v55.i64[1] = 0x202020202020202;
  uint8x16_t v56 = vsraq_n_u8(v55, v4, 2uLL);
  int8x16_t v57 = vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v5, vabdq_u8((uint8x16_t)v50, (uint8x16_t)v52)), (int8x16_t)vcgtq_u8(v4, v54)), (int8x16_t)vcgtq_u8((uint8x16_t)v5, vabdq_u8((uint8x16_t)v49, (uint8x16_t)v47)));
  uint8x16_t v58 = (uint8x16_t)vandq_s8(vandq_s8(v5, (int8x16_t)vcgtq_u8(v56, v54)), v57);
  uint8x16_t v59 = vhaddq_u8((uint8x16_t)v48, (uint8x16_t)v49);
  int16x8_t v60 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v47.i8, *(uint8x8_t *)v52.i8);
  int16x8_t v61 = (int16x8_t)vhaddq_u16(vaddl_u8(*(uint8x8_t *)v50.i8, *(uint8x8_t *)v48.i8), (uint16x8_t)v60);
  int16x8_t v62 = (int16x8_t)vaddl_high_u8((uint8x16_t)v47, (uint8x16_t)v52);
  int16x8_t v63 = (int16x8_t)vhaddq_u16(vaddl_high_u8((uint8x16_t)v50, (uint8x16_t)v48), (uint16x8_t)v62);
  int8x16_t v64 = (int8x16_t)vcgeq_u8(vabdq_u8((uint8x16_t)v48, (uint8x16_t)v52), v58);
  int8x16_t v65 = vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v50.i8, *(uint8x8_t *)v59.i8), v60), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v50, v59), v62), 2uLL);
  int8x16_t v66 = vbslq_s8(v64, v48, vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8(vaddw_u8((uint16x8_t)v61, *(uint8x8_t *)v46.i8), *(uint8x8_t *)v48.i8), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v48, (uint8x16_t)v46), v63), 2uLL));
  int8x16_t v67 = vbslq_s8(v64, v50, vrshrn_high_n_s16(vrshrn_n_s16(v61, 1uLL), v63, 1uLL));
  int8x16_t v68 = vbslq_s8(v57, vbslq_s8(v64, (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)v52, (uint8x16_t)v49), (uint8x16_t)v50), v65), v52);
  uint8x16_t v69 = vhaddq_u8((uint8x16_t)v51, (uint8x16_t)v50);
  int16x8_t v70 = (int16x8_t)vhaddq_u16(vaddl_u8(*(uint8x8_t *)v49.i8, *(uint8x8_t *)v51.i8), (uint16x8_t)v60);
  int16x8_t v71 = (int16x8_t)vhaddq_u16(vaddl_high_u8((uint8x16_t)v49, (uint8x16_t)v51), (uint16x8_t)v62);
  int8x16_t v72 = (int8x16_t)vcgeq_u8(vabdq_u8((uint8x16_t)v51, (uint8x16_t)v47), v58);
  int8x16_t v73 = vbslq_s8(v72, v51, vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v51.i8, *(uint8x8_t *)v53.i8), v70), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v51, (uint8x16_t)v53), v71), 2uLL));
  int8x16_t v74 = vbslq_s8(v72, (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)v47, (uint8x16_t)v50), (uint8x16_t)v49), vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8(vaddw_u8((uint16x8_t)v60, *(uint8x8_t *)v49.i8), *(uint8x8_t *)v69.i8), 2uLL), (int16x8_t)vaddw_high_u8(vaddw_high_u8((uint16x8_t)v62, (uint8x16_t)v49), v69), 2uLL));
  int8x16_t v75 = vbslq_s8(v72, v49, vrshrn_high_n_s16(vrshrn_n_s16(v70, 1uLL), v71, 1uLL));
  int8x16_t v76 = vbslq_s8(v57, v74, v47);
  int16x8_t v77 = (int16x8_t)vtrn1q_s8(v46, v66);
  int16x8_t v78 = (int16x8_t)vtrn2q_s8(v46, v66);
  int16x8_t v79 = (int16x8_t)vtrn1q_s8(v67, v68);
  int16x8_t v80 = (int16x8_t)vtrn2q_s8(v67, v68);
  int16x8_t v81 = (int16x8_t)vtrn1q_s8(v76, v75);
  int16x8_t v82 = (int16x8_t)vtrn2q_s8(v76, v75);
  int16x8_t v83 = (int16x8_t)vtrn1q_s8(v73, v53);
  int16x8_t v84 = (int16x8_t)vtrn2q_s8(v73, v53);
  int32x4_t v85 = (int32x4_t)vtrn1q_s16(v77, v79);
  int32x4_t v86 = (int32x4_t)vtrn1q_s16(v78, v80);
  int32x4_t v87 = (int32x4_t)vtrn1q_s16(v81, v83);
  int32x4_t v88 = vtrn1q_s32(v85, v87);
  *uint64_t v6 = v88.i64[0];
  int32x4_t v89 = (int32x4_t)vtrn1q_s16(v82, v84);
  int32x4_t v90 = vtrn1q_s32(v86, v89);
  *(void *)((char *)v6 + a2) = v90.i64[0];
  int32x4_t v91 = (int32x4_t)vtrn2q_s16(v77, v79);
  int32x4_t v92 = (int32x4_t)vtrn2q_s16(v81, v83);
  int32x4_t v93 = vtrn1q_s32(v91, v92);
  *(void *)((char *)v6 + v12) = v93.i64[0];
  int32x4_t v94 = (int32x4_t)vtrn2q_s16(v78, v80);
  int32x4_t v95 = (int32x4_t)vtrn2q_s16(v82, v84);
  int32x4_t v96 = vtrn1q_s32(v94, v95);
  *(void *)((char *)v6 + v15) = v96.i64[0];
  int32x4_t v97 = vtrn2q_s32(v85, v87);
  *(void *)((char *)v6 + v18) = v97.i64[0];
  int32x4_t v98 = vtrn2q_s32(v86, v89);
  *(void *)((char *)v6 + v21) = v98.i64[0];
  int32x4_t v99 = vtrn2q_s32(v91, v92);
  *(void *)((char *)v6 + v24) = v99.i64[0];
  int32x4_t result = vtrn2q_s32(v94, v95);
  *(void *)((char *)v6 + v27) = result.i64[0];
  *int8x16_t v9 = v88.i64[1];
  *uint8x16_t v11 = v90.i64[1];
  *uint8x16_t v14 = v93.i64[1];
  *int8x16_t v17 = v96.i64[1];
  *uint16x8_t v20 = v97.i64[1];
  *uint16x8_t v23 = v98.i64[1];
  *int8x16_t v26 = v99.i64[1];
  uint64_t *v29 = result.i64[1];
  return result;
}

int8x16_t sub_1BBB64350(int8x16_t *a1, int a2, const __int16 *a3, const __int16 *a4, unint64_t *a5, double a6, double a7, int16x8_t a8)
{
  if (*a5 != -1)
  {
    uint8x16_t v8 = (uint8x16_t)vld1q_dup_s16(a3);
    uint8x16_t v9 = (uint8x16_t)vld1q_dup_s16(a4);
    a8.i64[0] = *a5;
    uint8x16_t v10 = *(uint8x16_t *)((char *)a1 - 2 * a2);
    uint8x16_t v11 = (uint8x16_t *)((char *)a1 - a2);
    uint8x16_t v12 = *(uint8x16_t *)((char *)a1 + a2);
    int8x16_t v13 = (int8x16_t)vcgtq_u8(v9, vabdq_u8(v10, *v11));
    v14.i64[0] = 0x101010101010101;
    v14.i64[1] = 0x101010101010101;
    int8x16_t v15 = vqaddq_s8(vrhaddq_s8(vshrq_n_s8((int8x16_t)vhsubq_u8(v10, v12), 1uLL), vandq_s8(veorq_s8(*a1, *(int8x16_t *)v11), v14)), (int8x16_t)vhsubq_u8(*(uint8x16_t *)a1, *v11));
    uint8x16_t v16 = vminq_u8((uint8x16_t)vqabsq_s8(v15), (uint8x16_t)vandq_s8(vandq_s8(vaddq_s8((int8x16_t)vzip1q_s16(a8, a8), v14), v13), vandq_s8((int8x16_t)vcgtq_u8(v8, vabdq_u8(*v11, *(uint8x16_t *)a1)), (int8x16_t)vcgtq_u8(v9, vabdq_u8(v12, *(uint8x16_t *)a1)))));
    int8x16_t v17 = (int8x16_t)vqaddq_u8(*v11, v16);
    int8x16_t v18 = (int8x16_t)vqsubq_u8(*v11, v16);
    int8x16_t v19 = vcltzq_s8(v15);
    int8x16_t result = vbslq_s8(v19, (int8x16_t)vqaddq_u8(*(uint8x16_t *)a1, v16), (int8x16_t)vqsubq_u8(*(uint8x16_t *)a1, v16));
    *(int8x16_t *)uint8x16_t v11 = vbslq_s8(v19, v18, v17);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1BBB64400(uint64_t result, int a2, const __int16 *a3, const __int16 *a4, unint64_t *a5, double a6, double a7, double a8, double a9, int16x8_t a10)
{
  if (*a5 != -1)
  {
    uint8x16_t v10 = (uint8x16_t)vld1q_dup_s16(a3);
    uint8x16_t v11 = (uint8x16_t)vld1q_dup_s16(a4);
    v12.i64[0] = *(void *)(result - 4);
    v12.i64[1] = *(void *)(result - 4 + 4 * a2);
    v13.i64[0] = *(void *)(result - 4 + a2);
    a10.i64[0] = *a5;
    uint64_t v14 = 5 * a2;
    v13.i64[1] = *(void *)(result - 4 + v14);
    v15.i64[0] = *(void *)(result - 4 + 2 * a2);
    uint64_t v16 = 3 * a2;
    v15.i64[1] = *(void *)(result - 4 + 6 * a2);
    v17.i64[0] = *(void *)(result - 4 + v16);
    uint64_t v18 = 7 * a2;
    v17.i64[1] = *(void *)(result - 4 + v18);
    int32x4_t v19 = (int32x4_t)vtrn1q_s16(v12, v13);
    int32x4_t v20 = (int32x4_t)vtrn2q_s16(v12, v13);
    int32x4_t v21 = (int32x4_t)vtrn1q_s16(v15, v17);
    int32x4_t v22 = (int32x4_t)vtrn2q_s16(v15, v17);
    uint8x16_t v23 = (uint8x16_t)vtrn1q_s32(v19, v21);
    int8x16_t v24 = (int8x16_t)vtrn2q_s32(v19, v21);
    int8x16_t v25 = (int8x16_t)vtrn1q_s32(v20, v22);
    uint8x16_t v26 = (uint8x16_t)vtrn2q_s32(v20, v22);
    uint8x16_t v27 = vabdq_u8(v26, (uint8x16_t)v24);
    v28.i64[0] = 0x101010101010101;
    v28.i64[1] = 0x101010101010101;
    int8x16_t v29 = vqaddq_s8(vrhaddq_s8(vshrq_n_s8((int8x16_t)vhsubq_u8(v23, v26), 1uLL), vandq_s8(veorq_s8(v24, v25), v28)), (int8x16_t)vhsubq_u8((uint8x16_t)v24, (uint8x16_t)v25));
    uint8x16_t v30 = vminq_u8((uint8x16_t)vqabsq_s8(v29), (uint8x16_t)vandq_s8(vandq_s8(vaddq_s8((int8x16_t)vzip1q_s16(a10, a10), v28), (int8x16_t)vcgtq_u8(v11, v27)), vandq_s8((int8x16_t)vcgtq_u8(v11, vabdq_u8(v23, (uint8x16_t)v25)), (int8x16_t)vcgtq_u8(v10, vabdq_u8((uint8x16_t)v25, (uint8x16_t)v24)))));
    int8x16_t v31 = vcltzq_s8(v29);
    int16x8_t v32 = (int16x8_t)vbslq_s8(v31, (int8x16_t)vqsubq_u8((uint8x16_t)v25, v30), (int8x16_t)vqaddq_u8((uint8x16_t)v25, v30));
    int16x8_t v33 = (int16x8_t)vbslq_s8(v31, (int8x16_t)vqaddq_u8((uint8x16_t)v24, v30), (int8x16_t)vqsubq_u8((uint8x16_t)v24, v30));
    int16x8_t v34 = vtrn1q_s16(v32, v33);
    int16x8_t v35 = vtrn2q_s16(v32, v33);
    *(_DWORD *)(result - 2) = v34.i32[0];
    result -= 2;
    *(_DWORD *)(result + a2) = v35.i32[0];
    *(_DWORD *)(result + 2 * a2) = v34.i32[1];
    *(_DWORD *)(result + v16) = v35.i32[1];
    *(_DWORD *)(result + 4 * a2) = v34.i32[2];
    *(_DWORD *)(result + v14) = v35.i32[2];
    *(_DWORD *)(result + 6 * a2) = v34.i32[3];
    *(_DWORD *)(result + v18) = v35.i32[3];
  }
  return result;
}

uint8x16_t sub_1BBB64540(uint8x16_t *a1, int a2, const __int16 *a3, const __int16 *a4)
{
  uint8x16_t v4 = (uint8x16_t)vld1q_dup_s16(a3);
  uint8x16_t v5 = (uint8x16_t)vld1q_dup_s16(a4);
  uint8x16_t v6 = *(uint8x16_t *)((char *)a1 - 2 * a2);
  uint64_t v7 = (uint8x16_t *)((char *)a1 - a2);
  uint8x16_t v8 = *(uint8x16_t *)((char *)a1 + a2);
  uint8x16_t v9 = vhaddq_u8(*a1, v6);
  int8x16_t v10 = vandq_s8((int8x16_t)vcgtq_u8(v5, vabdq_u8(v6, *v7)), vandq_s8((int8x16_t)vcgtq_u8(v4, vabdq_u8(*v7, *a1)), (int8x16_t)vcgtq_u8(v5, vabdq_u8(v8, *a1))));
  int8x16_t v11 = vbslq_s8(v10, (int8x16_t)vrhaddq_u8(vhaddq_u8(*v7, v8), v6), *(int8x16_t *)v7);
  uint8x16_t result = (uint8x16_t)vbslq_s8(v10, (int8x16_t)vrhaddq_u8(v9, v8), *(int8x16_t *)a1);
  *uint64_t v7 = (uint8x16_t)v11;
  *a1 = result;
  return result;
}

uint64_t sub_1BBB645A8(uint64_t a1, int a2, const __int16 *a3, const __int16 *a4)
{
  uint8x16_t v4 = (uint8x16_t)vld1q_dup_s16(a3);
  uint8x16_t v5 = (uint8x16_t)vld1q_dup_s16(a4);
  v6.i64[0] = *(void *)(a1 - 4);
  v6.i64[1] = *(void *)(a1 - 4 + 4 * a2);
  v7.i64[0] = *(void *)(a1 - 4 + a2);
  uint64_t v8 = 5 * a2;
  v7.i64[1] = *(void *)(a1 - 4 + v8);
  v9.i64[0] = *(void *)(a1 - 4 + 2 * a2);
  uint64_t v10 = 3 * a2;
  v9.i64[1] = *(void *)(a1 - 4 + 6 * a2);
  v11.i64[0] = *(void *)(a1 - 4 + v10);
  uint64_t v12 = 7 * a2;
  v11.i64[1] = *(void *)(a1 - 4 + v12);
  int32x4_t v13 = (int32x4_t)vtrn1q_s16(v6, v7);
  int32x4_t v14 = (int32x4_t)vtrn2q_s16(v6, v7);
  int32x4_t v15 = (int32x4_t)vtrn1q_s16(v9, v11);
  int32x4_t v16 = (int32x4_t)vtrn2q_s16(v9, v11);
  uint8x16_t v17 = (uint8x16_t)vtrn1q_s32(v13, v15);
  int8x16_t v18 = (int8x16_t)vtrn2q_s32(v13, v15);
  int8x16_t v19 = (int8x16_t)vtrn1q_s32(v14, v16);
  uint8x16_t v20 = (uint8x16_t)vtrn2q_s32(v14, v16);
  int8x16_t v21 = vandq_s8(vandq_s8((int8x16_t)vcgtq_u8(v5, vabdq_u8(v17, (uint8x16_t)v19)), (int8x16_t)vcgtq_u8(v4, vabdq_u8((uint8x16_t)v19, (uint8x16_t)v18))), (int8x16_t)vcgtq_u8(v5, vabdq_u8(v20, (uint8x16_t)v18)));
  int8x16_t v22 = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)v18, v17), v20);
  int16x8_t v23 = (int16x8_t)vbslq_s8(v21, (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)v19, v20), v17), v19);
  int16x8_t v24 = (int16x8_t)vbslq_s8(v21, v22, v18);
  int16x8_t v25 = vtrn1q_s16(v23, v24);
  int16x8_t v26 = vtrn2q_s16(v23, v24);
  *(_DWORD *)(a1 - 2) = v25.i32[0];
  uint64_t result = a1 - 2;
  *(_DWORD *)(result + a2) = v26.i32[0];
  *(_DWORD *)(result + 2 * a2) = v25.i32[1];
  *(_DWORD *)(result + v10) = v26.i32[1];
  *(_DWORD *)(result + 4 * a2) = v25.i32[2];
  *(_DWORD *)(result + v8) = v26.i32[2];
  *(_DWORD *)(result + 6 * a2) = v25.i32[3];
  *(_DWORD *)(result + v12) = v26.i32[3];
  return result;
}

BOOL sub_1BBB646A4(uint64_t a1, int16x8_t *a2, uint64_t a3, _DWORD *a4, int a5)
{
  uint64_t v9 = 0;
  if (a5) {
    uint64_t v10 = (int8x16_t *)&unk_1E9F80FA0;
  }
  else {
    uint64_t v10 = (int8x16_t *)&unk_1E9F80FC0;
  }
  int v11 = *(_DWORD *)a1;
  unsigned int v12 = *(_DWORD *)(a1 + 4);
  uint16x8_t v47 = *(uint16x8_t *)*(void *)(a1 + 8);
  *a4 = 0;
  char v13 = 1;
  do
  {
    char v14 = v13;
    int16x8_t v15 = a2[2];
    int16x8_t v16 = a2[4];
    int16x8_t v17 = a2[6];
    int16x8_t v18 = vaddq_s16(v17, *a2);
    int16x8_t v19 = vsubq_s16(*a2, v17);
    int16x8_t v20 = vaddq_s16(v16, v15);
    int16x8_t v21 = vsubq_s16(v15, v16);
    int16x8_t v22 = vaddq_s16(v18, v20);
    int16x8_t v23 = vsubq_s16(v18, v20);
    int16x8_t v24 = vaddq_s16(vaddq_s16(v19, v19), v21);
    int16x8_t v25 = vsubq_s16(v19, vaddq_s16(v21, v21));
    int32x4_t v26 = (int32x4_t)vtrn1q_s16(v22, v24);
    int32x4_t v27 = (int32x4_t)vtrn2q_s16(v22, v24);
    int32x4_t v28 = (int32x4_t)vtrn1q_s16(v23, v25);
    int32x4_t v29 = (int32x4_t)vtrn2q_s16(v23, v25);
    int16x8_t v30 = (int16x8_t)vtrn1q_s32(v26, v28);
    int16x8_t v31 = (int16x8_t)vtrn2q_s32(v26, v28);
    int16x8_t v32 = (int16x8_t)vtrn1q_s32(v27, v29);
    int16x8_t v33 = (int16x8_t)vtrn2q_s32(v27, v29);
    int16x8_t v34 = vaddq_s16(v33, v30);
    int16x8_t v35 = vsubq_s16(v30, v33);
    int16x8_t v36 = vaddq_s16(v31, v32);
    int16x8_t v37 = vsubq_s16(v32, v31);
    int16x8_t v40 = vaddq_s16(v36, v34);
    int16x8_t v41 = vsubq_s16(v34, v36);
    int64x2_t v38 = (int64x2_t)vaddq_s16(vaddq_s16(v35, v35), v37);
    int64x2_t v39 = (int64x2_t)vsubq_s16(v35, vaddq_s16(v37, v37));
    int16x8_t v45 = (int16x8_t)vzip2q_s64((int64x2_t)v41, v39);
    int16x8_t v46 = (int16x8_t)vzip2q_s64((int64x2_t)v40, v38);
    v40.i64[1] = v38.i64[0];
    v41.i64[1] = v39.i64[0];
    if (a5) {
      int32x4_t v42 = (int8x16_t *)&unk_1E9F80FB0;
    }
    else {
      int32x4_t v42 = (int8x16_t *)&unk_1E9F80FD0;
    }
    *((unsigned char *)a4 + v9) = sub_1BBB64834((int8x16_t *)(a3 + 32 * v9), v12, v11, *v10, *v42, v40, v41, v47);
    uint64_t v43 = v9 | 1;
    BOOL result = sub_1BBB64834((int8x16_t *)(a3 + 32 * v43), v12, v11, *v10, *v42, v46, v45, v47);
    char v13 = 0;
    *((unsigned char *)a4 + v43) = result;
    a2 += 8;
    uint64_t v9 = 2;
  }
  while ((v14 & 1) != 0);
  return result;
}

BOOL sub_1BBB64834(int8x16_t *a1, unsigned int a2, int a3, int8x16_t a4, int8x16_t a5, int16x8_t a6, int16x8_t a7, uint16x8_t a8)
{
  uint32x4_t v8 = (uint32x4_t)vdupq_n_s32(a2);
  uint32x4_t v9 = (uint32x4_t)vdupq_n_s32(-a3);
  uint16x8_t v10 = (uint16x8_t)vabsq_s16(a6);
  uint16x8_t v11 = (uint16x8_t)vabsq_s16(a7);
  int16x8_t v12 = vcltzq_s16(a6);
  int16x8_t v13 = vcltzq_s16(a7);
  uint32x4_t v14 = vmlal_u16(v8, *(uint16x4_t *)v10.i8, *(uint16x4_t *)a8.i8);
  uint32x4_t v15 = vmlal_high_u16(v8, v10, a8);
  uint32x4_t v16 = vmlal_u16(v8, *(uint16x4_t *)v11.i8, *(uint16x4_t *)a8.i8);
  uint32x4_t v17 = vmlal_high_u16(v8, v11, a8);
  int8x16_t v18 = (int8x16_t)vqmovn_high_u32(vqmovn_u32(vshlq_u32(v14, v9)), vshlq_u32(v15, v9));
  int8x16_t v19 = (int8x16_t)vqmovn_high_u32(vqmovn_u32(vshlq_u32(v16, v9)), vshlq_u32(v17, v9));
  v22.val[0] = (int8x16_t)vsubq_s16((int16x8_t)veorq_s8(v18, (int8x16_t)v12), v12);
  v22.val[1] = (int8x16_t)vsubq_s16((int16x8_t)veorq_s8(v19, (int8x16_t)v13), v13);
  int8x16_t v20 = vqtbl2q_s8(v22, a4);
  *a1 = v20;
  a1[1] = vqtbl2q_s8(v22, a5);
  v20.i16[0] = vmaxvq_u16((uint16x8_t)vorrq_s8(v19, v18));
  return v20.i32[0] != 0;
}

BOOL sub_1BBB648C0(uint64_t a1, int16x8_t *a2, uint64_t a3, _DWORD *a4, int a5, uint64_t a6)
{
  uint64_t v10 = 0;
  if (a5) {
    uint16x8_t v11 = (int8x16_t *)&unk_1E9F80FA0;
  }
  else {
    uint16x8_t v11 = (int8x16_t *)&unk_1E9F80FC0;
  }
  int v12 = *(_DWORD *)a1;
  unsigned int v13 = *(_DWORD *)(a1 + 4);
  uint16x8_t v52 = *(uint16x8_t *)*(void *)(a1 + 8);
  *a4 = 0;
  char v14 = 1;
  do
  {
    char v15 = v14;
    int16x8_t v16 = a2[2];
    int16x8_t v17 = a2[4];
    int16x8_t v18 = a2[6];
    int16x8_t v19 = vaddq_s16(v18, *a2);
    int16x8_t v20 = vsubq_s16(*a2, v18);
    int16x8_t v21 = vaddq_s16(v17, v16);
    int16x8_t v22 = vsubq_s16(v16, v17);
    int16x8_t v23 = vaddq_s16(v19, v21);
    int16x8_t v24 = vsubq_s16(v19, v21);
    int16x8_t v25 = vaddq_s16(vaddq_s16(v20, v20), v22);
    int16x8_t v26 = vsubq_s16(v20, vaddq_s16(v22, v22));
    int32x4_t v27 = (int32x4_t)vtrn1q_s16(v23, v25);
    int32x4_t v28 = (int32x4_t)vtrn2q_s16(v23, v25);
    int32x4_t v29 = (int32x4_t)vtrn1q_s16(v24, v26);
    int32x4_t v30 = (int32x4_t)vtrn2q_s16(v24, v26);
    int16x8_t v31 = (int16x8_t)vtrn1q_s32(v27, v29);
    int16x8_t v32 = (int16x8_t)vtrn2q_s32(v27, v29);
    int16x8_t v33 = (int16x8_t)vtrn1q_s32(v28, v30);
    int16x8_t v34 = (int16x8_t)vtrn2q_s32(v28, v30);
    int16x8_t v35 = vaddq_s16(v34, v31);
    int16x8_t v36 = vsubq_s16(v31, v34);
    int16x8_t v37 = vaddq_s16(v32, v33);
    int16x8_t v38 = vsubq_s16(v33, v32);
    int8x16_t v39 = (int8x16_t)vaddq_s16(v37, v35);
    int16x8_t v45 = vsubq_s16(v35, v37);
    int64x2_t v40 = (int64x2_t)vaddq_s16(vaddq_s16(v36, v36), v38);
    int16x8_t v41 = (_WORD *)(a6 + 2 * v10);
    _WORD *v41 = v39.i16[0];
    v41[1] = vextq_s8(v39, v39, 8uLL).u16[0];
    int64x2_t v42 = (int64x2_t)vsubq_s16(v36, vaddq_s16(v38, v38));
    v38.i64[0] = -65536;
    v38.i64[1] = -65536;
    int64x2_t v43 = (int64x2_t)vandq_s8(v39, (int8x16_t)v38);
    int16x8_t v44 = (int16x8_t)vzip1q_s64(v43, v40);
    int16x8_t v50 = (int16x8_t)vzip2q_s64((int64x2_t)v45, v42);
    int16x8_t v51 = (int16x8_t)vzip2q_s64(v43, v40);
    v45.i64[1] = v42.i64[0];
    if (a5) {
      int16x8_t v46 = (int8x16_t *)&unk_1E9F80FB0;
    }
    else {
      int16x8_t v46 = (int8x16_t *)&unk_1E9F80FD0;
    }
    *((unsigned char *)a4 + v10) = sub_1BBB64834((int8x16_t *)(a3 + 32 * v10), v13, v12, *v11, *v46, v44, v45, v52);
    uint64_t v47 = v10 | 1;
    BOOL result = sub_1BBB64834((int8x16_t *)(a3 + 32 * v47), v13, v12, *v11, *v46, v51, v50, v52);
    char v14 = 0;
    *((unsigned char *)a4 + v47) = result;
    a2 += 8;
    uint64_t v10 = 2;
  }
  while ((v15 & 1) != 0);
  return result;
}

BOOL sub_1BBB64A6C(uint64_t a1, float *a2, int a3)
{
  float32x4x2_t v25 = vld2q_f32(a2);
  uint8x16_t v4 = *(const __int16 **)(a1 + 8);
  uint16x8_t v5 = (uint16x8_t)vld1q_dup_s16(v4);
  int32x4_t v6 = vaddl_s16(*(int16x4_t *)v25.val[1].f32, *(int16x4_t *)v25.val[0].f32);
  int32x4_t v7 = vsubl_s16(*(int16x4_t *)v25.val[0].f32, *(int16x4_t *)v25.val[1].f32);
  int32x4_t v8 = vaddl_high_s16((int16x8_t)v25.val[1], (int16x8_t)v25.val[0]);
  v25.val[0] = (float32x4_t)vsubl_high_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]);
  v25.val[1] = (float32x4_t)vaddq_s32(v8, v6);
  int32x4_t v9 = vsubq_s32(v6, v8);
  int32x4_t v10 = vsubq_s32(v7, (int32x4_t)v25.val[0]);
  v25.val[0] = (float32x4_t)vaddq_s32((int32x4_t)v25.val[0], v7);
  int32x4_t v11 = vtrn1q_s32((int32x4_t)v25.val[1], v9);
  v25.val[1] = (float32x4_t)vtrn2q_s32((int32x4_t)v25.val[1], v9);
  int64x2_t v12 = (int64x2_t)vtrn1q_s32(v10, (int32x4_t)v25.val[0]);
  int32x4_t v13 = (int32x4_t)vzip2q_s64((int64x2_t)v11, v12);
  v11.i64[1] = v12.i64[0];
  v25.val[0] = (float32x4_t)vtrn2q_s32(v10, (int32x4_t)v25.val[0]);
  int32x4_t v14 = (int32x4_t)vzip2q_s64((int64x2_t)v25.val[1], (int64x2_t)v25.val[0]);
  v25.val[1].i64[1] = v25.val[0].i64[0];
  v25.val[0] = (float32x4_t)vaddq_s32((int32x4_t)v25.val[1], v11);
  v25.val[1] = (float32x4_t)vsubq_s32(v11, (int32x4_t)v25.val[1]);
  int32x4_t v15 = vaddq_s32(v14, v13);
  int32x4_t v16 = vsubq_s32(v13, v14);
  int32x4_t v17 = vaddq_s32(v15, (int32x4_t)v25.val[0]);
  v25.val[0] = (float32x4_t)vsubq_s32((int32x4_t)v25.val[0], v15);
  int32x4_t v18 = vsubq_s32((int32x4_t)v25.val[1], v16);
  v25.val[1] = (float32x4_t)vaddq_s32(v16, (int32x4_t)v25.val[1]);
  int16x8_t v19 = vshrn_high_n_s32(vshrn_n_s32(v17, 1uLL), (int32x4_t)v25.val[0], 1uLL);
  int16x8_t v20 = vshrn_high_n_s32(vshrn_n_s32(v18, 1uLL), (int32x4_t)v25.val[1], 1uLL);
  if (a3) {
    int16x8_t v21 = (int8x16_t *)&unk_1E9F80FA0;
  }
  else {
    int16x8_t v21 = (int8x16_t *)&unk_1E9F80FC0;
  }
  int8x16_t v22 = *v21;
  int16x8_t v23 = (int8x16_t *)&unk_1E9F80FD0;
  if (a3) {
    int16x8_t v23 = (int8x16_t *)&unk_1E9F80FB0;
  }
  return sub_1BBB64834((int8x16_t *)a2, 2 * *(_DWORD *)(a1 + 4), *(_DWORD *)a1 + 1, v22, *v23, v19, v20, v5);
}

BOOL sub_1BBB64B30(uint64_t a1, const __int16 *a2, uint64_t a3, uint64_t a4, int a5, void *a6, uint64_t a7)
{
  uint64_t v9 = 0;
  int v10 = *(_DWORD *)a1;
  unsigned int v11 = *(_DWORD *)(a1 + 4);
  uint16x8_t v50 = *(uint16x8_t *)*(void *)(a1 + 8);
  if (a5) {
    int64x2_t v12 = (int8x16_t *)&unk_1E9F80FA0;
  }
  else {
    int64x2_t v12 = (int8x16_t *)&unk_1E9F80FC0;
  }
  *a6 = 0;
  char v13 = 1;
  do
  {
    int32x4_t v14 = a2;
    int16x8x2_t v51 = vld2q_s16(v14);
    v14 += 16;
    int16x8x2_t v52 = vld2q_s16(v14);
    int32x4_t v15 = a2 + 32;
    int16x8x2_t v53 = vld2q_s16(v15);
    int32x4_t v16 = a2 + 48;
    int16x8x2_t v54 = vld2q_s16(v16);
    int16x8_t v17 = vaddq_s16(v54.val[0], v51.val[0]);
    int16x8_t v18 = vsubq_s16(v51.val[0], v54.val[0]);
    int16x8_t v19 = vaddq_s16(v53.val[0], v52.val[0]);
    int16x8_t v20 = vsubq_s16(v52.val[0], v53.val[0]);
    int16x8_t v21 = vaddq_s16(v17, v19);
    char v49 = v13;
    int16x8_t v22 = vsubq_s16(v17, v19);
    int16x8_t v23 = vaddq_s16(vaddq_s16(v18, v18), v20);
    int16x8_t v24 = vsubq_s16(v18, vaddq_s16(v20, v20));
    int16x8_t v25 = vaddq_s16(v54.val[1], v51.val[1]);
    v51.val[0] = vsubq_s16(v51.val[1], v54.val[1]);
    v51.val[1] = vaddq_s16(v53.val[1], v52.val[1]);
    v52.val[0] = vsubq_s16(v52.val[1], v53.val[1]);
    v52.val[1] = vaddq_s16(v25, v51.val[1]);
    v51.val[1] = vsubq_s16(v25, v51.val[1]);
    v53.val[0] = vaddq_s16(vaddq_s16(v51.val[0], v51.val[0]), v52.val[0]);
    v51.val[0] = vsubq_s16(v51.val[0], vaddq_s16(v52.val[0], v52.val[0]));
    v52.val[0] = vtrn1q_s16(v21, v23);
    v53.val[1] = vtrn2q_s16(v21, v23);
    v54.val[0] = vtrn1q_s16(v22, v24);
    v54.val[1] = vtrn2q_s16(v22, v24);
    int16x8_t v26 = (int16x8_t)vtrn1q_s32((int32x4_t)v52.val[0], (int32x4_t)v54.val[0]);
    v52.val[0] = (int16x8_t)vtrn2q_s32((int32x4_t)v52.val[0], (int32x4_t)v54.val[0]);
    v54.val[0] = (int16x8_t)vtrn1q_s32((int32x4_t)v53.val[1], (int32x4_t)v54.val[1]);
    v53.val[1] = (int16x8_t)vtrn2q_s32((int32x4_t)v53.val[1], (int32x4_t)v54.val[1]);
    v54.val[1] = vtrn1q_s16(v52.val[1], v53.val[0]);
    v52.val[1] = vtrn2q_s16(v52.val[1], v53.val[0]);
    v53.val[0] = vtrn1q_s16(v51.val[1], v51.val[0]);
    v51.val[0] = vtrn2q_s16(v51.val[1], v51.val[0]);
    v51.val[1] = (int16x8_t)vtrn1q_s32((int32x4_t)v54.val[1], (int32x4_t)v53.val[0]);
    v53.val[0] = (int16x8_t)vtrn2q_s32((int32x4_t)v54.val[1], (int32x4_t)v53.val[0]);
    v54.val[1] = (int16x8_t)vtrn1q_s32((int32x4_t)v52.val[1], (int32x4_t)v51.val[0]);
    v51.val[0] = (int16x8_t)vtrn2q_s32((int32x4_t)v52.val[1], (int32x4_t)v51.val[0]);
    v52.val[1] = vaddq_s16(v53.val[1], v26);
    v53.val[1] = vsubq_s16(v26, v53.val[1]);
    int16x8_t v27 = vaddq_s16(v52.val[0], v54.val[0]);
    v52.val[0] = vsubq_s16(v54.val[0], v52.val[0]);
    int8x16_t v28 = (int8x16_t)vaddq_s16(v27, v52.val[1]);
    int16x8_t v34 = vsubq_s16(v52.val[1], v27);
    v54.val[0] = vaddq_s16(vaddq_s16(v53.val[1], v53.val[1]), v52.val[0]);
    v53.val[1] = vsubq_s16(v53.val[1], vaddq_s16(v52.val[0], v52.val[0]));
    v52.val[0] = vaddq_s16(v51.val[0], v51.val[1]);
    v51.val[0] = vsubq_s16(v51.val[1], v51.val[0]);
    v51.val[1] = vaddq_s16(v53.val[0], v54.val[1]);
    v53.val[0] = vsubq_s16(v54.val[1], v53.val[0]);
    int8x16_t v29 = (int8x16_t)vaddq_s16(v51.val[1], v52.val[0]);
    v54.val[1] = vsubq_s16(v52.val[0], v51.val[1]);
    v51.val[1] = vaddq_s16(vaddq_s16(v51.val[0], v51.val[0]), v53.val[0]);
    uint64_t v44 = v54.val[1].i64[0];
    int64x2_t v45 = (int64x2_t)vsubq_s16(v51.val[0], vaddq_s16(v53.val[0], v53.val[0]));
    int32x4_t v30 = (_WORD *)(a7 + 4 * v9);
    _WORD *v30 = v28.i16[0];
    v30[1] = v29.i16[0];
    uint64_t v31 = v9 | 1;
    int16x8_t v32 = (_WORD *)(a7 + 4 * (v9 | 1));
    *int16x8_t v32 = vextq_s8(v28, v28, 8uLL).u16[0];
    v32[1] = vextq_s8(v29, v29, 8uLL).u16[0];
    v52.val[0].i64[0] = -65536;
    v52.val[0].i64[1] = -65536;
    v51.val[0] = (int16x8_t)vandq_s8(v28, (int8x16_t)v52.val[0]);
    v53.val[0] = (int16x8_t)vandq_s8(v29, (int8x16_t)v52.val[0]);
    int16x8_t v33 = (int16x8_t)vzip1q_s64((int64x2_t)v51.val[0], (int64x2_t)v54.val[0]);
    int16x8_t v43 = (int16x8_t)vzip2q_s64((int64x2_t)v51.val[0], (int64x2_t)v54.val[0]);
    int16x8_t v42 = (int16x8_t)vzip2q_s64((int64x2_t)v34, (int64x2_t)v53.val[1]);
    int16x8_t v48 = (int16x8_t)vzip2q_s64((int64x2_t)v53.val[0], (int64x2_t)v51.val[1]);
    int16x8_t v46 = (int16x8_t)vzip1q_s64((int64x2_t)v53.val[0], (int64x2_t)v51.val[1]);
    int16x8_t v47 = (int16x8_t)vzip2q_s64((int64x2_t)v54.val[1], v45);
    v34.i64[1] = v53.val[1].i64[0];
    if (a5) {
      int16x8_t v35 = (int8x16_t *)&unk_1E9F80FB0;
    }
    else {
      int16x8_t v35 = (int8x16_t *)&unk_1E9F80FD0;
    }
    *((unsigned char *)a6 + v9) = sub_1BBB64834((int8x16_t *)(a3 + 32 * v9), v11, v10, *v12, *v35, v33, v34, v50);
    *((unsigned char *)a6 + v31) = sub_1BBB64834((int8x16_t *)(a3 + 32 * v31), v11, v10, *v12, *v35, v43, v42, v50);
    v36.i64[0] = v44;
    v36.i64[1] = v45.i64[0];
    *((unsigned char *)a6 + v9 + 4) = sub_1BBB64834((int8x16_t *)(a4 + 32 * v9), v11, v10, *v12, *v35, v46, v36, v50);
    BOOL result = sub_1BBB64834((int8x16_t *)(a4 + 32 * v31), v11, v10, *v12, *v35, v48, v47, v50);
    char v13 = 0;
    *((unsigned char *)a6 + v31 + 4) = result;
    a2 += 64;
    uint64_t v9 = 2;
  }
  while ((v49 & 1) != 0);
  return result;
}

BOOL sub_1BBB64DE8(uint64_t a1, int16x4_t *a2, int8x16_t *a3)
{
  uint32x4_t v3 = (uint32x4_t)vdupq_n_s32(~*(_DWORD *)a1);
  uint32x4_t v4 = (uint32x4_t)vdupq_n_s32(2 * *(_DWORD *)(a1 + 4));
  uint16x8_t v5 = *(const __int16 **)(a1 + 8);
  int16x4_t v6 = a2[1];
  int32x2_t v7 = (int32x2_t)vadd_s16(v6, *a2);
  int32x2_t v8 = (int32x2_t)vsub_s16(*a2, v6);
  int16x4_t v9 = (int16x4_t)vzip1_s32(v7, v8);
  int16x4_t v10 = (int16x4_t)vzip2_s32(v7, v8);
  *(int16x4_t *)v11.i8 = vadd_s16(v9, v10);
  v11.u64[1] = (unint64_t)vsub_s16(v9, v10);
  uint16x8_t v12 = (uint16x8_t)vabsq_s16(v11);
  int16x8_t v13 = vcltzq_s16(v11);
  uint16x8_t v14 = (uint16x8_t)vld1q_dup_s16(v5);
  uint32x4_t v15 = vmlal_u16(v4, *(uint16x4_t *)v12.i8, *(uint16x4_t *)v14.i8);
  uint32x4_t v16 = vmlal_high_u16(v4, v12, v14);
  uint32x4_t v17 = vshlq_u32(v15, v3);
  uint32x4_t v18 = vshlq_u32(v16, v3);
  *(uint16x4_t *)v16.i8 = vqmovn_u32(v17);
  *a3 = vqtbl1q_s8((int8x16_t)vsubq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_u32(*(uint16x4_t *)v16.i8, v18), (int8x16_t)v13), v13), (int8x16_t)xmmword_1BBB700F0);
  return vorr_s8((int8x8_t)vqmovn_u32(v18), *(int8x8_t *)v16.i8) != 0;
}

uint64_t sub_1BBB64E78(uint64_t result, uint64_t a2, int16x8_t *a3, int32x4_t a4, double a5, double a6, int32x4_t a7, uint64_t a8, unsigned __int32 a9)
{
  a4.i32[0] = 0;
  uint64_t v9 = 0;
  int16x4_t v10 = (const __int16 *)(result + 24);
  uint16x8_t v11 = (uint16x8_t)vld1q_dup_s16(v10);
  a7.i32[0] = a9;
  int8x16_t v12 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(a7, a4), 0);
  int16x8_t v13 = (int16x8_t)vshlq_u16(*(uint16x8_t *)*(void *)(result + 16), v11);
  int8x16_t v14 = vbslq_s8(v12, (int8x16_t)xmmword_1BBB70110, (int8x16_t)xmmword_1BBB70100);
  int8x16_t v15 = vbslq_s8(v12, (int8x16_t)xmmword_1BBB70130, (int8x16_t)xmmword_1BBB70120);
  char v16 = 1;
  do
  {
    char v17 = v16;
    int8x16x2_t v25 = *(int8x16x2_t *)(a2 + 32 * v9);
    int8x16x2_t v26 = *(int8x16x2_t *)(a2 + ((32 * v9) | 0x20));
    int16x8_t v18 = (int16x8_t)vqtbl2q_s8(v25, v14);
    v25.val[0] = vqtbl2q_s8(v25, v15);
    v25.val[1] = vqtbl2q_s8(v26, v14);
    v26.val[0] = vqtbl2q_s8(v26, v15);
    v26.val[1] = (int8x16_t)vmulq_s16(v13, v18);
    v25.val[1] = (int8x16_t)vmulq_s16(v13, (int16x8_t)v25.val[1]);
    v25.val[0] = (int8x16_t)vmulq_s16(v13, (int16x8_t)v25.val[0]);
    v26.val[0] = (int8x16_t)vmulq_s16(v13, (int16x8_t)v26.val[0]);
    int16x8_t v19 = (int16x8_t)vzip2q_s64((int64x2_t)v26.val[1], (int64x2_t)v25.val[1]);
    int16x8_t v20 = (int16x8_t)vzip2q_s64((int64x2_t)v25.val[0], (int64x2_t)v26.val[0]);
    v26.val[1].i64[1] = v25.val[1].i64[0];
    v25.val[0].i64[1] = v26.val[0].i64[0];
    v25.val[1] = (int8x16_t)vaddq_s16((int16x8_t)v25.val[0], (int16x8_t)v26.val[1]);
    v25.val[0] = (int8x16_t)vsubq_s16((int16x8_t)v26.val[1], (int16x8_t)v25.val[0]);
    v26.val[0] = (int8x16_t)vsubq_s16(vshrq_n_s16(v19, 1uLL), v20);
    int16x8_t v21 = vsraq_n_s16(v19, v20, 1uLL);
    v26.val[1] = (int8x16_t)vaddq_s16(v21, (int16x8_t)v25.val[1]);
    v25.val[1] = (int8x16_t)vsubq_s16((int16x8_t)v25.val[1], v21);
    int16x8_t v22 = vaddq_s16((int16x8_t)v26.val[0], (int16x8_t)v25.val[0]);
    v25.val[0] = (int8x16_t)vsubq_s16((int16x8_t)v25.val[0], (int16x8_t)v26.val[0]);
    v26.val[0] = (int8x16_t)vtrn1q_s16((int16x8_t)v26.val[1], v22);
    v26.val[1] = (int8x16_t)vtrn2q_s16((int16x8_t)v26.val[1], v22);
    int32x4_t v23 = (int32x4_t)vtrn2q_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]);
    v25.val[0] = (int8x16_t)vtrn1q_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]);
    v25.val[1] = (int8x16_t)vtrn1q_s32((int32x4_t)v26.val[0], (int32x4_t)v25.val[0]);
    v25.val[0] = (int8x16_t)vtrn2q_s32((int32x4_t)v26.val[0], (int32x4_t)v25.val[0]);
    v26.val[0] = (int8x16_t)vtrn1q_s32((int32x4_t)v26.val[1], v23);
    v26.val[1] = (int8x16_t)vtrn2q_s32((int32x4_t)v26.val[1], v23);
    int16x8_t v24 = vaddq_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]);
    v25.val[0] = (int8x16_t)vsubq_s16((int16x8_t)v25.val[1], (int16x8_t)v25.val[0]);
    v25.val[1] = (int8x16_t)vsubq_s16(vshrq_n_s16((int16x8_t)v26.val[0], 1uLL), (int16x8_t)v26.val[1]);
    v26.val[0] = (int8x16_t)vsraq_n_s16((int16x8_t)v26.val[0], (int16x8_t)v26.val[1], 1uLL);
    *a3 = vrshrq_n_s16(vaddq_s16((int16x8_t)v26.val[0], v24), 6uLL);
    a3[2] = vrshrq_n_s16(vaddq_s16((int16x8_t)v25.val[1], (int16x8_t)v25.val[0]), 6uLL);
    a3[4] = vrshrq_n_s16(vsubq_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]), 6uLL);
    a3[6] = vrshrq_n_s16(vsubq_s16(v24, (int16x8_t)v26.val[0]), 6uLL);
    a3 += 8;
    uint64_t v9 = 2;
    char v16 = 0;
  }
  while ((v17 & 1) != 0);
  return result;
}

uint64_t sub_1BBB64FB4(int16x8_t *a1, _DWORD *a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  int16x4_t v6 = a1;
  do
  {
    if (*((unsigned char *)a2 + v4)) {
      uint64_t v5 = sub_1BBB65044(v6, 0) + v5;
    }
    ++v4;
    v6 += 2;
  }
  while (v4 != 4);
  if ((int)v5 < 5)
  {
    uint64_t v5 = 0;
    a1[6] = 0u;
    a1[7] = 0u;
    a1[4] = 0u;
    a1[5] = 0u;
    a1[2] = 0u;
    a1[3] = 0u;
    *a1 = 0u;
    a1[1] = 0u;
    *a2 = 0;
  }
  return v5;
}

uint64_t sub_1BBB65044(int16x8_t *a1, int a2)
{
  int8x16_t v2 = (int8x16_t)vabsq_s16(*a1);
  int8x16_t v3 = (int8x16_t)vabsq_s16(a1[1]);
  if ((vmaxvq_u16((uint16x8_t)vorrq_s8(v3, v2)) & 0xFFFE) != 0) {
    return 0x100000;
  }
  int16x8_t v5 = (int16x8_t)vorrq_s8((int8x16_t)vshlq_u16((uint16x8_t)v3, (uint16x8_t)xmmword_1BBB6F7F0), (int8x16_t)vshlq_u16((uint16x8_t)v2, (uint16x8_t)xmmword_1BBB6F7E0));
  v5.i16[0] = vaddvq_s16(v5);
  unsigned int v6 = ((v5.i32[0] << 16) | 0x8000) << a2;
  unsigned int v7 = __clz(v6);
  char v8 = v7 + 1;
  uint64_t result = 0;
  for (int i = 16 - a2 - (v7 + 1); i >= 0; i -= v7 + 1)
  {
    v6 <<= v8;
    uint64_t result = result + byte_1BBB9586F[v7];
    unsigned int v7 = __clz(v6);
    char v8 = v7 + 1;
  }
  return result;
}

uint64_t sub_1BBB650E0(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  if (a4 | a3)
  {
    if (a3)
    {
      int v9 = sub_1BBB65044((int16x8_t *)a1, 1);
      int v10 = sub_1BBB65044((int16x8_t *)(a1 + 32), 1) + v9;
      int v11 = sub_1BBB65044((int16x8_t *)(a1 + 64), 1);
      int v12 = v10 + v11 + sub_1BBB65044((int16x8_t *)(a1 + 96), 1);
      if (v12 <= 3)
      {
        *(_OWORD *)(a1 + 96) = 0u;
        *(_OWORD *)(a1 + 112) = 0u;
        *(_OWORD *)(a1 + 64) = 0u;
        *(_OWORD *)(a1 + 80) = 0u;
        *(_OWORD *)(a1 + 32) = 0u;
        *(_OWORD *)(a1 + 48) = 0u;
        *(_OWORD *)a1 = 0u;
        *(_OWORD *)(a1 + 16) = 0u;
      }
      BOOL v13 = v12 > 3;
      if (a4) {
        goto LABEL_6;
      }
    }
    else
    {
      BOOL v13 = 0;
      if (a4)
      {
LABEL_6:
        int v14 = sub_1BBB65044((int16x8_t *)a2, 1);
        int v15 = sub_1BBB65044((int16x8_t *)(a2 + 32), 1) + v14;
        int v16 = sub_1BBB65044((int16x8_t *)(a2 + 64), 1);
        int v17 = v15 + v16 + sub_1BBB65044((int16x8_t *)(a2 + 96), 1);
        if (v17 <= 3)
        {
          *(_OWORD *)(a2 + 96) = 0u;
          *(_OWORD *)(a2 + 112) = 0u;
          *(_OWORD *)(a2 + 64) = 0u;
          *(_OWORD *)(a2 + 80) = 0u;
          *(_OWORD *)(a2 + 32) = 0u;
          *(_OWORD *)(a2 + 48) = 0u;
          *(_OWORD *)a2 = 0u;
          *(_OWORD *)(a2 + 16) = 0u;
        }
        BOOL v18 = v17 > 3;
        goto LABEL_11;
      }
    }
    BOOL v18 = 0;
LABEL_11:
    if (v18 || v13) {
      return 2;
    }
    else {
      return a5;
    }
  }
  return a5;
}

BOOL sub_1BBB6521C(int16x8_t *a1, int16x8_t *a2, uint16x8_t *a3, int a4, int a5)
{
  uint32x4_t v5 = (uint32x4_t)vdupq_n_s32(2 * a4);
  uint32x4_t v6 = (uint32x4_t)vdupq_n_s32(~a5);
  int8x16_t v7 = 0uLL;
  unsigned int v8 = -2;
  do
  {
    int16x8_t v9 = *a2;
    int16x8_t v10 = a2[1];
    a2 += 2;
    uint16x8_t v11 = *a3;
    uint16x8_t v12 = a3[1];
    a3 += 2;
    uint16x8_t v13 = (uint16x8_t)vabsq_s16(v9);
    uint16x8_t v14 = (uint16x8_t)vabsq_s16(v10);
    int16x8_t v15 = vcltzq_s16(v9);
    int16x8_t v16 = vcltzq_s16(v10);
    uint32x4_t v17 = vmlal_u16(v5, *(uint16x4_t *)v13.i8, *(uint16x4_t *)v11.i8);
    uint32x4_t v18 = vmlal_high_u16(v5, v13, v11);
    uint32x4_t v19 = vmlal_u16(v5, *(uint16x4_t *)v14.i8, *(uint16x4_t *)v12.i8);
    uint32x4_t v20 = vmlal_high_u16(v5, v14, v12);
    int8x16_t v21 = (int8x16_t)vqmovn_high_u32(vqmovn_u32(vshlq_u32(v17, v6)), vshlq_u32(v18, v6));
    int8x16_t v22 = (int8x16_t)vqmovn_high_u32(vqmovn_u32(vshlq_u32(v19, v6)), vshlq_u32(v20, v6));
    int8x16_t v7 = vorrq_s8(vorrq_s8(v21, v7), v22);
    v8 += 2;
    *a1 = vsubq_s16((int16x8_t)veorq_s8(v21, (int8x16_t)v15), v15);
    a1[1] = vsubq_s16((int16x8_t)veorq_s8(v22, (int8x16_t)v16), v16);
    a1 += 2;
  }
  while (v8 < 6);
  v5.i16[0] = vmaxvq_u16((uint16x8_t)v7);
  return v5.i32[0] != 0;
}

int16x8_t *sub_1BBB652C8(int16x8_t *result, int16x8_t *a2, int16x8_t *a3, int a4)
{
  int32x4_t v4 = vdupq_n_s32(a4 - 6);
  unsigned int v5 = -2;
  do
  {
    int16x8_t v6 = *a2;
    int16x8_t v7 = a2[1];
    a2 += 2;
    int16x8_t v8 = *a3;
    int16x8_t v9 = a3[1];
    a3 += 2;
    int16x8_t v10 = vshlq_n_s16(v8, 4uLL);
    int16x8_t v11 = vshlq_n_s16(v9, 4uLL);
    v5 += 2;
    *uint64_t result = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_s16(*(int16x4_t *)v6.i8, *(int16x4_t *)v10.i8), v4)), vrshlq_s32(vmull_high_s16(v6, v10), v4));
    result[1] = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_s16(*(int16x4_t *)v7.i8, *(int16x4_t *)v11.i8), v4)), vrshlq_s32(vmull_high_s16(v7, v11), v4));
    result += 2;
  }
  while (v5 < 6);
  return result;
}

_OWORD *sub_1BBB65328(_OWORD *result, int a2, _OWORD *a3, int a4)
{
  int v4 = a4 + 4;
  do
  {
    long long v5 = a3[1];
    long long v6 = a3[2];
    long long v7 = a3[3];
    *uint64_t result = *a3;
    *(_OWORD *)((char *)result + a2) = v5;
    *(_OWORD *)((char *)result + 2 * a2) = v6;
    *(_OWORD *)((char *)result + 3 * a2) = v7;
    a3 += 4;
    uint64_t result = (_OWORD *)((char *)result + 4 * a2);
    v4 -= 4;
  }
  while (v4 > 4);
  return result;
}

void *sub_1BBB6536C(void *result, int a2, int8x16_t *a3, int a4)
{
  int v4 = a4 + 4;
  do
  {
    int8x16_t v5 = *a3;
    int8x16_t v6 = a3[1];
    a3 += 2;
    *uint64_t result = v5.i64[0];
    *(void *)((char *)result + a2) = vextq_s8(v5, v5, 8uLL).u64[0];
    *(void *)((char *)result + 2 * a2) = v6.i64[0];
    *(void *)((char *)result + 3 * a2) = vextq_s8(v6, v6, 8uLL).u64[0];
    uint64_t result = (void *)((char *)result + 4 * a2);
    v4 -= 4;
  }
  while (v4 > 4);
  return result;
}

uint16x8_t sub_1BBB653B0(uint16x8_t *a1, const float *a2, int a3)
{
  uint64_t v3 = 3 * a3;
  int v4 = (const float *)((char *)a2 + a3);
  int8x16_t v5 = (const float *)((char *)a2 + 2 * a3);
  uint8x8_t v7 = (uint8x8_t)vld1_dup_f32(a2);
  int8x16_t v6 = (const float *)((char *)a2 + v3);
  uint8x8_t v8 = (uint8x8_t)vld1_dup_f32(v4);
  uint8x8_t v9 = (uint8x8_t)vld1_dup_f32(v5);
  uint8x8_t v10 = (uint8x8_t)vld1_dup_f32(v6);
  *a1 = vmovl_u8(v7);
  a1[1] = vmovl_u8(v8);
  uint16x8_t result = vmovl_u8(v10);
  a1[2] = vmovl_u8(v9);
  a1[3] = result;
  return result;
}

_OWORD *sub_1BBB653EC(_OWORD *result, int a2, _OWORD *a3, int a4)
{
  for (unsigned int i = 20; i > 4; i -= 4)
  {
    long long v5 = *(_OWORD *)((char *)a3 + a4);
    long long v6 = *(_OWORD *)((char *)a3 + 2 * a4);
    long long v7 = *(_OWORD *)((char *)a3 + 3 * a4);
    *uint16x8_t result = *a3;
    *(_OWORD *)((char *)result + a2) = v5;
    *(_OWORD *)((char *)result + 2 * a2) = v6;
    *(_OWORD *)((char *)result + 3 * a2) = v7;
    a3 = (_OWORD *)((char *)a3 + 4 * a4);
    uint16x8_t result = (_OWORD *)((char *)result + 4 * a2);
  }
  return result;
}

uint8x16_t *sub_1BBB65448(uint8x16_t *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_1BBB65450(a1, a2, a3, a4, a5, 16);
}

uint8x16_t *sub_1BBB65450(uint8x16_t *result, int a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  uint64_t v6 = 0;
  uint64_t v7 = 3 * a4;
  uint64_t v8 = 4 * a4;
  int v9 = a6 + 4;
  uint64_t v10 = a5 + 2 * a4;
  uint64_t v11 = a5 + a4;
  uint64_t v12 = a3 + 2 * a4;
  uint64_t v13 = a3 + a4;
  do
  {
    uint8x16_t v14 = vrhaddq_u8(*(uint8x16_t *)(v13 + v6), *(uint8x16_t *)(v11 + v6));
    uint8x16_t v15 = vrhaddq_u8(*(uint8x16_t *)(v12 + v6), *(uint8x16_t *)(v10 + v6));
    uint8x16_t v16 = vrhaddq_u8(*(uint8x16_t *)(a3 + v7 + v6), *(uint8x16_t *)(a5 + v7 + v6));
    *uint16x8_t result = vrhaddq_u8(*(uint8x16_t *)(a3 + v6), *(uint8x16_t *)(a5 + v6));
    *(uint8x16_t *)((char *)result + a2) = v14;
    *(uint8x16_t *)((char *)result + 2 * a2) = v15;
    *(uint8x16_t *)((char *)result + 3 * a2) = v16;
    uint16x8_t result = (uint8x16_t *)((char *)result + 4 * a2);
    v9 -= 4;
    v6 += v8;
  }
  while (v9 > 4);
  return result;
}

_OWORD *sub_1BBB654E8(_OWORD *result, int a2, _OWORD *a3, int a4)
{
  for (unsigned int i = 12; i > 4; i -= 4)
  {
    long long v5 = *(_OWORD *)((char *)a3 + a4);
    long long v6 = *(_OWORD *)((char *)a3 + 2 * a4);
    long long v7 = *(_OWORD *)((char *)a3 + 3 * a4);
    *uint16x8_t result = *a3;
    *(_OWORD *)((char *)result + a2) = v5;
    *(_OWORD *)((char *)result + 2 * a2) = v6;
    *(_OWORD *)((char *)result + 3 * a2) = v7;
    a3 = (_OWORD *)((char *)a3 + 4 * a4);
    uint16x8_t result = (_OWORD *)((char *)result + 4 * a2);
  }
  return result;
}

uint8x16_t *sub_1BBB65544(uint8x16_t *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_1BBB65450(a1, a2, a3, a4, a5, 8);
}

void *sub_1BBB6554C(void *result, int a2, void *a3, int a4)
{
  for (unsigned int i = 20; i > 4; i -= 4)
  {
    uint64_t v5 = *(void *)((char *)a3 + a4);
    uint64_t v6 = *(void *)((char *)a3 + 2 * a4);
    uint64_t v7 = *(void *)((char *)a3 + 3 * a4);
    *uint16x8_t result = *a3;
    *(void *)((char *)result + a2) = v5;
    *(void *)((char *)result + 2 * a2) = v6;
    *(void *)((char *)result + 3 * a2) = v7;
    a3 = (void *)((char *)a3 + 4 * a4);
    uint16x8_t result = (void *)((char *)result + 4 * a2);
  }
  return result;
}

uint8x8_t *sub_1BBB655A8(uint8x8_t *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_1BBB655B0(a1, a2, a3, a4, a5, 16);
}

uint8x8_t *sub_1BBB655B0(uint8x8_t *result, int a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  uint64_t v6 = 0;
  uint64_t v7 = 3 * a4;
  uint64_t v8 = 4 * a4;
  int v9 = a6 + 4;
  uint64_t v10 = a5 + 2 * a4;
  uint64_t v11 = a5 + a4;
  uint64_t v12 = a3 + 2 * a4;
  uint64_t v13 = a3 + a4;
  do
  {
    uint8x8_t v14 = vrhadd_u8(*(uint8x8_t *)(v13 + v6), *(uint8x8_t *)(v11 + v6));
    uint8x8_t v15 = vrhadd_u8(*(uint8x8_t *)(v12 + v6), *(uint8x8_t *)(v10 + v6));
    uint8x8_t v16 = vrhadd_u8(*(uint8x8_t *)(a3 + v7 + v6), *(uint8x8_t *)(a5 + v7 + v6));
    *uint16x8_t result = vrhadd_u8(*(uint8x8_t *)(a3 + v6), *(uint8x8_t *)(a5 + v6));
    *(uint8x8_t *)((char *)result + a2) = v14;
    *(uint8x8_t *)((char *)result + 2 * a2) = v15;
    *(uint8x8_t *)((char *)result + 3 * a2) = v16;
    uint16x8_t result = (uint8x8_t *)((char *)result + 4 * a2);
    v9 -= 4;
    v6 += v8;
  }
  while (v9 > 4);
  return result;
}

void *sub_1BBB65648(void *result, int a2, void *a3, int a4)
{
  for (unsigned int i = 12; i > 4; i -= 4)
  {
    uint64_t v5 = *(void *)((char *)a3 + a4);
    uint64_t v6 = *(void *)((char *)a3 + 2 * a4);
    uint64_t v7 = *(void *)((char *)a3 + 3 * a4);
    *uint16x8_t result = *a3;
    *(void *)((char *)result + a2) = v5;
    *(void *)((char *)result + 2 * a2) = v6;
    *(void *)((char *)result + 3 * a2) = v7;
    a3 = (void *)((char *)a3 + 4 * a4);
    uint16x8_t result = (void *)((char *)result + 4 * a2);
  }
  return result;
}

uint8x8_t *sub_1BBB656A4(uint8x8_t *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_1BBB655B0(a1, a2, a3, a4, a5, 8);
}

int8x16_t *sub_1BBB656AC(int8x16_t *result, int a2, int8x16_t *a3, int a4, int a5, char a6, char a7, double a8, double a9, double a10, int8x8_t a11, double a12, int8x8_t a13, int8x8_t a14, int8x8_t a15)
{
  int v15 = 8 - (a6 & 7);
  int v16 = 8 - (a7 & 7);
  a11.i32[0] = v16 * v15;
  a13.i32[0] = v16 * (a6 & 7);
  a14.i32[0] = v15 * (a7 & 7);
  a15.i32[0] = (a7 & 7) * (a6 & 7);
  uint8x16_t v17 = *(uint8x16_t *)a3;
  uint32x4_t v18 = (int8x16_t *)((char *)a3 + a4);
  uint8x16_t v19 = *(uint8x16_t *)v18;
  uint8x16_t v20 = (uint8x16_t)vextq_s8(*a3, a3[1], 2uLL);
  uint8x16_t v21 = (uint8x16_t)vextq_s8(*v18, v18[1], 2uLL);
  int v22 = a5 + 2;
  uint8x16_t v23 = (uint8x16_t)vdupq_lane_s8(a11, 0);
  uint8x16_t v24 = (uint8x16_t)vdupq_lane_s8(a13, 0);
  uint8x16_t v25 = (uint8x16_t)vdupq_lane_s8(a14, 0);
  uint8x16_t v26 = (uint8x16_t)vdupq_lane_s8(a15, 0);
  do
  {
    int16x8_t v27 = (int8x16_t *)((char *)a3 + 2 * a4);
    int8x16_t v28 = (int8x16_t *)((char *)a3 + 3 * a4);
    a3 = (int8x16_t *)((char *)a3 + a4 + (uint64_t)a4);
    int16x8_t v29 = (int16x8_t)vmlal_u8(vmlal_u8(vmlal_u8(vmull_u8(*(uint8x8_t *)v20.i8, *(uint8x8_t *)v24.i8), *(uint8x8_t *)v17.i8, *(uint8x8_t *)v23.i8), *(uint8x8_t *)v19.i8, *(uint8x8_t *)v25.i8), *(uint8x8_t *)v21.i8, *(uint8x8_t *)v26.i8);
    int16x8_t v30 = (int16x8_t)vmlal_high_u8(vmlal_high_u8(vmlal_high_u8(vmull_high_u8(v20, v24), v17, v23), v19, v25), v21, v26);
    uint8x16_t v17 = *(uint8x16_t *)v27;
    uint8x16_t v20 = (uint8x16_t)vextq_s8(*v27, v27[1], 2uLL);
    int16x8_t v31 = (int16x8_t)vmlal_u8(vmlal_u8(vmlal_u8(vmull_u8(*(uint8x8_t *)v21.i8, *(uint8x8_t *)v24.i8), *(uint8x8_t *)v19.i8, *(uint8x8_t *)v23.i8), *(uint8x8_t *)v27->i8, *(uint8x8_t *)v25.i8), *(uint8x8_t *)v20.i8, *(uint8x8_t *)v26.i8);
    int16x8_t v32 = (int16x8_t)vmlal_high_u8(vmlal_high_u8(vmlal_high_u8(vmull_high_u8(v21, v24), v19, v23), *(uint8x16_t *)v27, v25), v20, v26);
    uint8x16_t v19 = *(uint8x16_t *)v28;
    uint8x16_t v21 = (uint8x16_t)vextq_s8(*v28, v28[1], 2uLL);
    *uint16x8_t result = vrshrn_high_n_s16(vrshrn_n_s16(v29, 6uLL), v30, 6uLL);
    *(int8x16_t *)((char *)result + a2) = vrshrn_high_n_s16(vrshrn_n_s16(v31, 6uLL), v32, 6uLL);
    uint16x8_t result = (int8x16_t *)((char *)result + a2 + (uint64_t)a2);
    v22 -= 2;
  }
  while (v22 > 2);
  return result;
}

uint8x8_t *sub_1BBB657A8(uint8x8_t *result, int a2, __int32 a3, unsigned int a4, int a5, double a6, double a7, int8x8_t a8)
{
  a8.i32[0] = a3;
  int16x8_t v8 = vdupq_n_s16(-a5);
  int16x8_t v9 = vdupq_n_s16(a4);
  unsigned int v10 = 18;
  uint8x16_t v11 = (uint8x16_t)vdupq_lane_s8(a8, 0);
  do
  {
    uint64_t v12 = (uint8x16_t *)((char *)result + a2);
    uint8x16_t v13 = *v12;
    *(int8x16_t *)result->i8 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*result, *(uint8x8_t *)v11.i8), v8), v9)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(*(uint8x16_t *)result->i8, v11), v8), v9));
    uint16x8_t result = (uint8x8_t *)&v12->i8[a2];
    *(int8x16_t *)uint64_t v12 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v11.i8), v8), v9)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v13, v11), v8), v9));
    v10 -= 2;
  }
  while (v10 > 2);
  return result;
}

int8x16_t *sub_1BBB6582C(int8x16_t *result, uint8x16_t *a2, int a3, __int32 a4, unsigned int a5, int a6, double a7, double a8, int8x8_t a9)
{
  a9.i32[0] = a4;
  int16x8_t v9 = vdupq_n_s16(-a6);
  int16x8_t v10 = vdupq_n_s16(a5);
  unsigned int v11 = 18;
  uint8x16_t v12 = (uint8x16_t)vdupq_lane_s8(a9, 0);
  do
  {
    uint8x16_t v13 = *a2;
    uint8x16_t v14 = *(uint8x16_t *)((char *)a2 + a3);
    a2 = (uint8x16_t *)((char *)a2 + a3 + (uint64_t)a3);
    *uint16x8_t result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v12.i8), v9), v10)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v13, v12), v9), v10));
    result[1] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v14.i8, *(uint8x8_t *)v12.i8), v9), v10)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v14, v12), v9), v10));
    result += 2;
    v11 -= 2;
  }
  while (v11 > 2);
  return result;
}

int8x16_t *sub_1BBB658AC(int8x16_t *result, uint64_t a2, uint64_t a3, int a4, __int32 a5, unsigned int a6, int a7, double a8, double a9, int8x8_t a10)
{
  uint64_t v10 = 0;
  a10.i32[0] = a5;
  int16x8_t v11 = vdupq_n_s16(-a7);
  int16x8_t v12 = vdupq_n_s16(a6);
  unsigned int v13 = 18;
  uint8x16_t v14 = (uint8x16_t)vdupq_lane_s8(a10, 0);
  do
  {
    uint8x16_t v15 = vrhaddq_u8(*(uint8x16_t *)(a2 + v10), *(uint8x16_t *)(a3 + v10));
    uint8x16_t v16 = vrhaddq_u8(*(uint8x16_t *)(a2 + a4 + v10), *(uint8x16_t *)(a3 + a4 + v10));
    *uint16x8_t result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v15.i8, *(uint8x8_t *)v14.i8), v11), v12)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v15, v14), v11), v12));
    result[1] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v16.i8, *(uint8x8_t *)v14.i8), v11), v12)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v16, v14), v11), v12));
    result += 2;
    v13 -= 2;
    v10 += 2 * a4;
  }
  while (v13 > 2);
  return result;
}

uint8x8_t *sub_1BBB65944(uint8x8_t *result, int a2, __int32 a3, unsigned int a4, int a5, double a6, double a7, int8x8_t a8)
{
  a8.i32[0] = a3;
  int16x8_t v8 = vdupq_n_s16(-a5);
  int16x8_t v9 = vdupq_n_s16(a4);
  unsigned int v10 = 10;
  uint8x16_t v11 = (uint8x16_t)vdupq_lane_s8(a8, 0);
  do
  {
    int16x8_t v12 = (uint8x16_t *)((char *)result + a2);
    uint8x16_t v13 = *v12;
    *(int8x16_t *)result->i8 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*result, *(uint8x8_t *)v11.i8), v8), v9)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(*(uint8x16_t *)result->i8, v11), v8), v9));
    uint16x8_t result = (uint8x8_t *)&v12->i8[a2];
    *(int8x16_t *)int16x8_t v12 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v11.i8), v8), v9)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v13, v11), v8), v9));
    v10 -= 2;
  }
  while (v10 > 2);
  return result;
}

int8x16_t *sub_1BBB659C8(int8x16_t *result, uint8x16_t *a2, int a3, __int32 a4, unsigned int a5, int a6, double a7, double a8, int8x8_t a9)
{
  a9.i32[0] = a4;
  int16x8_t v9 = vdupq_n_s16(-a6);
  int16x8_t v10 = vdupq_n_s16(a5);
  unsigned int v11 = 10;
  uint8x16_t v12 = (uint8x16_t)vdupq_lane_s8(a9, 0);
  do
  {
    uint8x16_t v13 = *a2;
    uint8x16_t v14 = *(uint8x16_t *)((char *)a2 + a3);
    a2 = (uint8x16_t *)((char *)a2 + a3 + (uint64_t)a3);
    *uint16x8_t result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v12.i8), v9), v10)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v13, v12), v9), v10));
    result[1] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v14.i8, *(uint8x8_t *)v12.i8), v9), v10)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v14, v12), v9), v10));
    result += 2;
    v11 -= 2;
  }
  while (v11 > 2);
  return result;
}

int8x16_t *sub_1BBB65A48(int8x16_t *result, uint64_t a2, uint64_t a3, int a4, __int32 a5, unsigned int a6, int a7, double a8, double a9, int8x8_t a10)
{
  uint64_t v10 = 0;
  a10.i32[0] = a5;
  int16x8_t v11 = vdupq_n_s16(-a7);
  int16x8_t v12 = vdupq_n_s16(a6);
  unsigned int v13 = 10;
  uint8x16_t v14 = (uint8x16_t)vdupq_lane_s8(a10, 0);
  do
  {
    uint8x16_t v15 = vrhaddq_u8(*(uint8x16_t *)(a2 + v10), *(uint8x16_t *)(a3 + v10));
    uint8x16_t v16 = vrhaddq_u8(*(uint8x16_t *)(a2 + a4 + v10), *(uint8x16_t *)(a3 + a4 + v10));
    *uint16x8_t result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v15.i8, *(uint8x8_t *)v14.i8), v11), v12)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v15, v14), v11), v12));
    result[1] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v16.i8, *(uint8x8_t *)v14.i8), v11), v12)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v16, v14), v11), v12));
    result += 2;
    v13 -= 2;
    v10 += 2 * a4;
  }
  while (v13 > 2);
  return result;
}

uint8x8_t *sub_1BBB65AE0(uint8x8_t *result, int a2, __int32 a3, unsigned int a4, int a5, double a6, double a7, int8x8_t a8)
{
  a8.i32[0] = a3;
  int16x8_t v8 = vdupq_n_s16(-a5);
  int16x8_t v9 = vdupq_n_s16(a4);
  unsigned int v10 = 20;
  uint8x8_t v11 = (uint8x8_t)vdup_lane_s8(a8, 0);
  do
  {
    int8x8_t v12 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + a2), v11), v8), v9));
    int8x8_t v13 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + 2 * a2), v11), v8), v9));
    int8x8_t v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + 3 * a2), v11), v8), v9));
    *uint16x8_t result = (uint8x8_t)vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*result, v11), v8), v9));
    *(int8x8_t *)((char *)result + a2) = v12;
    *(int8x8_t *)((char *)result + 2 * a2) = v13;
    *(int8x8_t *)((char *)result + 3 * a2) = v14;
    uint16x8_t result = (uint8x8_t *)((char *)result + 2 * a2 + a2 + a2);
    v10 -= 4;
  }
  while (v10 > 4);
  return result;
}

int8x8_t *sub_1BBB65B84(int8x8_t *result, uint64_t a2, uint64_t a3, int a4, __int32 a5, unsigned int a6, int a7, double a8, double a9, int8x8_t a10)
{
  uint64_t v10 = 0;
  int16x8_t v11 = vdupq_n_s16(-a7);
  int16x8_t v12 = vdupq_n_s16(a6);
  a10.i32[0] = a5;
  uint8x8_t v13 = (uint8x8_t)vdup_lane_s8(a10, 0);
  for (unsigned int i = 20; i > 4; i -= 4)
  {
    uint8x16_t v15 = (uint8x8_t *)(a2 + v10 + a4);
    uint8x8_t v16 = *v15;
    uint8x16_t v17 = (uint8x8_t *)((char *)v15 + a4);
    uint32x4_t v18 = (uint8x8_t *)(a3 + v10 + a4);
    uint8x8_t v19 = *v18;
    uint8x16_t v20 = (uint8x8_t *)((char *)v18 + a4);
    int8x8_t v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*v17, *v20), v13), v11), v12));
    int8x8_t v22 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*(uint8x8_t *)((char *)v17 + a4), *(uint8x8_t *)((char *)v20 + a4)), v13), v11), v12));
    *uint16x8_t result = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*(uint8x8_t *)(a2 + v10), *(uint8x8_t *)(a3 + v10)), v13), v11), v12));
    result[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(v16, v19), v13), v11), v12));
    result[2] = v21;
    result[3] = v22;
    v10 += 4 * a4;
    result += 4;
  }
  return result;
}

uint8x8_t *sub_1BBB65C50(uint8x8_t *result, int a2, __int32 a3, unsigned int a4, int a5, double a6, double a7, int8x8_t a8)
{
  a8.i32[0] = a3;
  int16x8_t v8 = vdupq_n_s16(-a5);
  int16x8_t v9 = vdupq_n_s16(a4);
  unsigned int v10 = 12;
  uint8x8_t v11 = (uint8x8_t)vdup_lane_s8(a8, 0);
  do
  {
    int8x8_t v12 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + a2), v11), v8), v9));
    int8x8_t v13 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + 2 * a2), v11), v8), v9));
    int8x8_t v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + 3 * a2), v11), v8), v9));
    *uint16x8_t result = (uint8x8_t)vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*result, v11), v8), v9));
    *(int8x8_t *)((char *)result + a2) = v12;
    *(int8x8_t *)((char *)result + 2 * a2) = v13;
    *(int8x8_t *)((char *)result + 3 * a2) = v14;
    uint16x8_t result = (uint8x8_t *)((char *)result + 2 * a2 + a2 + a2);
    v10 -= 4;
  }
  while (v10 > 4);
  return result;
}

int8x8_t *sub_1BBB65CF4(int8x8_t *result, uint64_t a2, uint64_t a3, int a4, __int32 a5, unsigned int a6, int a7, double a8, double a9, int8x8_t a10)
{
  uint64_t v10 = 0;
  int16x8_t v11 = vdupq_n_s16(-a7);
  int16x8_t v12 = vdupq_n_s16(a6);
  a10.i32[0] = a5;
  uint8x8_t v13 = (uint8x8_t)vdup_lane_s8(a10, 0);
  for (unsigned int i = 12; i > 4; i -= 4)
  {
    uint8x16_t v15 = (uint8x8_t *)(a2 + v10 + a4);
    uint8x8_t v16 = *v15;
    uint8x16_t v17 = (uint8x8_t *)((char *)v15 + a4);
    uint32x4_t v18 = (uint8x8_t *)(a3 + v10 + a4);
    uint8x8_t v19 = *v18;
    uint8x16_t v20 = (uint8x8_t *)((char *)v18 + a4);
    int8x8_t v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*v17, *v20), v13), v11), v12));
    int8x8_t v22 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*(uint8x8_t *)((char *)v17 + a4), *(uint8x8_t *)((char *)v20 + a4)), v13), v11), v12));
    *uint16x8_t result = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*(uint8x8_t *)(a2 + v10), *(uint8x8_t *)(a3 + v10)), v13), v11), v12));
    result[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(v16, v19), v13), v11), v12));
    result[2] = v21;
    result[3] = v22;
    v10 += 4 * a4;
    result += 4;
  }
  return result;
}

uint32x2_t sub_1BBB65DC0(int16x8_t *a1, _DWORD *a2, _DWORD *a3)
{
  int16x8_t v3 = a1[1];
  int16x8_t v4 = a1[2];
  int16x8_t v5 = a1[3];
  int16x8_t v6 = vaddq_s16(v3, *a1);
  int16x8_t v7 = vsubq_s16(*a1, v3);
  int16x8_t v8 = vaddq_s16(v5, v4);
  int16x8_t v9 = vsubq_s16(v4, v5);
  int16x8_t v10 = vaddq_s16(v8, v6);
  int16x8_t v11 = vsubq_s16(v6, v8);
  int16x8_t v12 = vaddq_s16(v9, v7);
  int16x8_t v13 = vsubq_s16(v7, v9);
  int16x8_t v14 = vtrn1q_s16(v10, v12);
  int16x8_t v15 = vtrn2q_s16(v10, v12);
  int16x8_t v16 = vtrn1q_s16(v11, v13);
  int16x8_t v17 = vtrn2q_s16(v11, v13);
  int32x4_t v18 = (int32x4_t)vaddq_s16(v15, v14);
  int32x4_t v19 = (int32x4_t)vsubq_s16(v14, v15);
  int32x4_t v20 = (int32x4_t)vaddq_s16(v17, v16);
  int32x4_t v21 = (int32x4_t)vsubq_s16(v16, v17);
  int16x8_t v22 = vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v19, v21)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v19, v21))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v18, v20)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v18, v20))));
  uint32x2_t result = vpaddl_u16((uint16x4_t)*(_OWORD *)&vpaddq_s16(v22, v22));
  *a2 = result.i32[0];
  *a3 = result.i32[1];
  return result;
}

uint64_t sub_1BBB65E48(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  return sub_1BBB65E50(a1, a2, a3, a4, 16);
}

uint64_t sub_1BBB65E50(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4, int a5)
{
  int v5 = a5 + 4;
  int32x4_t v6 = 0uLL;
  int32x4_t v7 = 0uLL;
  do
  {
    uint8x16_t v8 = *(uint8x16_t *)&a1->i8[a2];
    int16x8_t v9 = (uint8x16_t *)((char *)a1 + a2 + a2);
    uint8x16_t v10 = *v9;
    int16x8_t v11 = (uint8x8_t *)&v9->i8[a2];
    uint8x16_t v12 = *(uint8x16_t *)&a3->i8[a4];
    int16x8_t v13 = (uint8x16_t *)((char *)a3 + a4 + a4);
    uint8x16_t v14 = *v13;
    int16x8_t v15 = (uint8x8_t *)&v13->i8[a4];
    int16x8_t v16 = (int16x8_t)vsubl_u8(*a1, *a3);
    int16x8_t v17 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v8.i8, *(uint8x8_t *)v12.i8);
    int16x8_t v18 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v10.i8, *(uint8x8_t *)v14.i8);
    int16x8_t v19 = (int16x8_t)vsubl_u8(*v11, *v15);
    int16x8_t v20 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
    int16x8_t v21 = (int16x8_t)vsubl_high_u8(v8, v12);
    int16x8_t v22 = (int16x8_t)vsubl_high_u8(v10, v14);
    int16x8_t v23 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v11->i8, *(uint8x16_t *)v15->i8);
    int16x8_t v24 = vaddq_s16(v17, v16);
    int16x8_t v25 = vsubq_s16(v16, v17);
    int16x8_t v26 = vaddq_s16(v19, v18);
    int16x8_t v27 = vsubq_s16(v18, v19);
    int16x8_t v28 = vaddq_s16(v26, v24);
    int16x8_t v29 = vsubq_s16(v24, v26);
    int16x8_t v30 = vaddq_s16(v27, v25);
    int16x8_t v31 = vsubq_s16(v25, v27);
    int16x8_t v32 = vtrn1q_s16(v28, v30);
    int16x8_t v33 = vtrn2q_s16(v28, v30);
    int16x8_t v34 = vtrn1q_s16(v29, v31);
    int16x8_t v35 = vtrn2q_s16(v29, v31);
    int32x4_t v36 = (int32x4_t)vaddq_s16(v33, v32);
    int32x4_t v37 = (int32x4_t)vsubq_s16(v32, v33);
    int32x4_t v38 = (int32x4_t)vaddq_s16(v35, v34);
    int32x4_t v39 = (int32x4_t)vsubq_s16(v34, v35);
    uint16x8_t v40 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v37, v39)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v37, v39))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v36, v38)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v36, v38))));
    int16x8_t v41 = vaddq_s16(v21, v20);
    int16x8_t v42 = vsubq_s16(v20, v21);
    int16x8_t v43 = vaddq_s16(v23, v22);
    int16x8_t v44 = vsubq_s16(v22, v23);
    int16x8_t v45 = vaddq_s16(v43, v41);
    int16x8_t v46 = vsubq_s16(v41, v43);
    int16x8_t v47 = vaddq_s16(v44, v42);
    int16x8_t v48 = vsubq_s16(v42, v44);
    int16x8_t v49 = vtrn1q_s16(v45, v47);
    int16x8_t v50 = vtrn2q_s16(v45, v47);
    int16x8_t v51 = vtrn1q_s16(v46, v48);
    int16x8_t v52 = vtrn2q_s16(v46, v48);
    int32x4_t v53 = (int32x4_t)vaddq_s16(v50, v49);
    int32x4_t v54 = (int32x4_t)vsubq_s16(v49, v50);
    int32x4_t v55 = (int32x4_t)vaddq_s16(v52, v51);
    int32x4_t v56 = (int32x4_t)vsubq_s16(v51, v52);
    uint16x8_t v57 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v54, v56)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v54, v56))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v53, v55)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v53, v55))));
    int32x4_t v6 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v6, *(uint16x4_t *)v40.i8), v40);
    int32x4_t v7 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v7, *(uint16x4_t *)v57.i8), v57);
    v5 -= 4;
    a1 = (uint8x8_t *)((char *)v11 + a2);
    a3 = (uint8x8_t *)((char *)v15 + a4);
  }
  while (v5 > 4);
  return vaddvq_s32(vaddq_s32(v7, v6));
}

uint64_t sub_1BBB65FC8(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  return sub_1BBB65E50(a1, a2, a3, a4, 8);
}

uint64_t sub_1BBB65FD0(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  return sub_1BBB65FD8(a1, a2, a3, a4, 16);
}

uint64_t sub_1BBB65FD8(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4, int a5)
{
  int v5 = a5 + 4;
  int32x4_t v6 = 0uLL;
  int32x4_t v7 = 0uLL;
  do
  {
    uint8x16_t v8 = (uint8x8_t *)((char *)a1 + a2 + a2);
    uint8x8_t v9 = *v8;
    uint8x16_t v10 = (uint8x8_t *)((char *)v8 + a2);
    int16x8_t v11 = (uint8x8_t *)((char *)a3 + a4 + a4);
    uint8x8_t v12 = *v11;
    int16x8_t v13 = (uint8x8_t *)((char *)v11 + a4);
    int16x8_t v14 = (int16x8_t)vsubl_u8(*a1, *a3);
    int16x8_t v15 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + a2), *(uint8x8_t *)((char *)a3 + a4));
    int16x8_t v16 = (int16x8_t)vsubl_u8(v9, v12);
    int16x8_t v17 = (int16x8_t)vsubl_u8(*v10, *v13);
    int16x8_t v18 = vaddq_s16(v15, v14);
    int16x8_t v19 = vsubq_s16(v14, v15);
    int16x8_t v20 = vaddq_s16(v17, v16);
    int16x8_t v21 = vsubq_s16(v16, v17);
    int16x8_t v22 = vaddq_s16(v20, v18);
    int16x8_t v23 = vsubq_s16(v18, v20);
    int16x8_t v24 = vaddq_s16(v21, v19);
    int16x8_t v25 = vsubq_s16(v19, v21);
    int16x8_t v26 = vtrn1q_s16(v22, v24);
    int16x8_t v27 = vtrn2q_s16(v22, v24);
    int16x8_t v28 = vtrn1q_s16(v23, v25);
    int16x8_t v29 = vtrn2q_s16(v23, v25);
    int32x4_t v30 = (int32x4_t)vaddq_s16(v27, v26);
    int32x4_t v31 = (int32x4_t)vsubq_s16(v26, v27);
    int32x4_t v32 = (int32x4_t)vaddq_s16(v29, v28);
    int32x4_t v33 = (int32x4_t)vsubq_s16(v28, v29);
    uint16x8_t v34 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v31, v33)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v31, v33))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v30, v32)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v30, v32))));
    int32x4_t v7 = (int32x4_t)vaddw_u16((uint32x4_t)v7, *(uint16x4_t *)v34.i8);
    int32x4_t v6 = (int32x4_t)vaddw_high_u16((uint32x4_t)v6, v34);
    v5 -= 4;
    a1 = (uint8x8_t *)((char *)v10 + a2);
    a3 = (uint8x8_t *)((char *)v13 + a4);
  }
  while (v5 > 4);
  return vaddvq_s32(vaddq_s32(v7, v6));
}

uint64_t sub_1BBB660CC(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  return sub_1BBB65FD8(a1, a2, a3, a4, 8);
}

uint64_t sub_1BBB660D4(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_1BBB660DC(a1, a2, a3, a4, a5, 16);
}

uint64_t sub_1BBB660DC(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = 0;
  int32x4_t v7 = 0uLL;
  int32x4_t v8 = 0uLL;
  int v9 = a6 + 4;
  do
  {
    uint8x16_t v10 = *(uint8x16_t *)&a1->i8[a2];
    int16x8_t v11 = (uint8x16_t *)((char *)a1 + a2 + a2);
    uint8x16_t v12 = *v11;
    int16x8_t v13 = (uint8x8_t *)&v11->i8[a2];
    int16x8_t v14 = (uint8x16_t *)(a3 + v6 + a5);
    uint8x16_t v15 = *v14;
    int16x8_t v16 = (uint8x16_t *)((char *)v14 + a5);
    int16x8_t v17 = (uint8x16_t *)(a4 + v6 + a5);
    uint8x16_t v18 = *v17;
    int16x8_t v19 = (uint8x16_t *)((char *)v17 + a5);
    uint8x16_t v20 = vrhaddq_u8(*(uint8x16_t *)(a3 + v6), *(uint8x16_t *)(a4 + v6));
    uint8x16_t v21 = vrhaddq_u8(v15, v18);
    uint8x16_t v22 = vrhaddq_u8(*v16, *v19);
    uint8x16_t v23 = vrhaddq_u8(*(uint8x16_t *)((char *)v16 + a5), *(uint8x16_t *)((char *)v19 + a5));
    int16x8_t v24 = (int16x8_t)vsubl_u8(*a1, *(uint8x8_t *)v20.i8);
    int16x8_t v25 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v10.i8, *(uint8x8_t *)v21.i8);
    int16x8_t v26 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v12.i8, *(uint8x8_t *)v22.i8);
    int16x8_t v27 = (int16x8_t)vsubl_u8(*v13, *(uint8x8_t *)v23.i8);
    int16x8_t v28 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)a1->i8, v20);
    int16x8_t v29 = (int16x8_t)vsubl_high_u8(v10, v21);
    int16x8_t v30 = (int16x8_t)vsubl_high_u8(v12, v22);
    int16x8_t v31 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v13->i8, v23);
    int16x8_t v32 = vaddq_s16(v25, v24);
    int16x8_t v33 = vsubq_s16(v24, v25);
    int16x8_t v34 = vaddq_s16(v27, v26);
    int16x8_t v35 = vsubq_s16(v26, v27);
    int16x8_t v36 = vaddq_s16(v34, v32);
    int16x8_t v37 = vsubq_s16(v32, v34);
    int16x8_t v38 = vaddq_s16(v35, v33);
    int16x8_t v39 = vsubq_s16(v33, v35);
    int16x8_t v40 = vtrn1q_s16(v36, v38);
    int16x8_t v41 = vtrn2q_s16(v36, v38);
    int16x8_t v42 = vtrn1q_s16(v37, v39);
    int16x8_t v43 = vtrn2q_s16(v37, v39);
    int32x4_t v44 = (int32x4_t)vaddq_s16(v41, v40);
    int32x4_t v45 = (int32x4_t)vsubq_s16(v40, v41);
    int32x4_t v46 = (int32x4_t)vaddq_s16(v43, v42);
    int32x4_t v47 = (int32x4_t)vsubq_s16(v42, v43);
    uint16x8_t v48 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v45, v47)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v45, v47))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v44, v46)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v44, v46))));
    int16x8_t v49 = vaddq_s16(v29, v28);
    int16x8_t v50 = vsubq_s16(v28, v29);
    int16x8_t v51 = vaddq_s16(v31, v30);
    int16x8_t v52 = vsubq_s16(v30, v31);
    int16x8_t v53 = vaddq_s16(v51, v49);
    int16x8_t v54 = vsubq_s16(v49, v51);
    int16x8_t v55 = vaddq_s16(v52, v50);
    int16x8_t v56 = vsubq_s16(v50, v52);
    int16x8_t v57 = vtrn1q_s16(v53, v55);
    int16x8_t v58 = vtrn2q_s16(v53, v55);
    int16x8_t v59 = vtrn1q_s16(v54, v56);
    int16x8_t v60 = vtrn2q_s16(v54, v56);
    int32x4_t v61 = (int32x4_t)vaddq_s16(v58, v57);
    int32x4_t v62 = (int32x4_t)vsubq_s16(v57, v58);
    int32x4_t v63 = (int32x4_t)vaddq_s16(v60, v59);
    int32x4_t v64 = (int32x4_t)vsubq_s16(v59, v60);
    uint16x8_t v65 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v62, v64)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v62, v64))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v61, v63)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v61, v63))));
    int32x4_t v7 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v7, *(uint16x4_t *)v48.i8), v48);
    int32x4_t v8 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v8, *(uint16x4_t *)v65.i8), v65);
    v9 -= 4;
    v6 += 4 * a5;
    a1 = (uint8x8_t *)((char *)v13 + a2);
  }
  while (v9 > 4);
  return vaddvq_s32(vaddq_s32(v8, v7));
}

uint64_t sub_1BBB66288(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_1BBB660DC(a1, a2, a3, a4, a5, 8);
}

uint64_t sub_1BBB66290(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_1BBB66298(a1, a2, a3, a4, a5, 16);
}

uint64_t sub_1BBB66298(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = 0;
  int32x4_t v7 = 0uLL;
  int32x4_t v8 = 0uLL;
  int v9 = a6 + 4;
  do
  {
    uint8x16_t v10 = (uint8x8_t *)((char *)a1 + a2 + a2);
    uint8x8_t v11 = *v10;
    uint8x16_t v12 = (uint8x8_t *)((char *)v10 + a2);
    int16x8_t v13 = (uint8x8_t *)(a3 + v6 + a5);
    uint8x8_t v14 = *v13;
    uint8x16_t v15 = (uint8x8_t *)((char *)v13 + a5);
    int16x8_t v16 = (uint8x8_t *)(a4 + v6 + a5);
    uint8x8_t v17 = *v16;
    uint8x16_t v18 = (uint8x8_t *)((char *)v16 + a5);
    int16x8_t v19 = (int16x8_t)vsubl_u8(*a1, vrhadd_u8(*(uint8x8_t *)(a3 + v6), *(uint8x8_t *)(a4 + v6)));
    int16x8_t v20 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + a2), vrhadd_u8(v14, v17));
    int16x8_t v21 = (int16x8_t)vsubl_u8(v11, vrhadd_u8(*v15, *v18));
    int16x8_t v22 = (int16x8_t)vsubl_u8(*v12, vrhadd_u8(*(uint8x8_t *)((char *)v15 + a5), *(uint8x8_t *)((char *)v18 + a5)));
    int16x8_t v23 = vaddq_s16(v20, v19);
    int16x8_t v24 = vsubq_s16(v19, v20);
    int16x8_t v25 = vaddq_s16(v22, v21);
    int16x8_t v26 = vsubq_s16(v21, v22);
    int16x8_t v27 = vaddq_s16(v25, v23);
    int16x8_t v28 = vsubq_s16(v23, v25);
    int16x8_t v29 = vaddq_s16(v26, v24);
    int16x8_t v30 = vsubq_s16(v24, v26);
    int16x8_t v31 = vtrn1q_s16(v27, v29);
    int16x8_t v32 = vtrn2q_s16(v27, v29);
    int16x8_t v33 = vtrn1q_s16(v28, v30);
    int16x8_t v34 = vtrn2q_s16(v28, v30);
    int32x4_t v35 = (int32x4_t)vaddq_s16(v32, v31);
    int32x4_t v36 = (int32x4_t)vsubq_s16(v31, v32);
    int32x4_t v37 = (int32x4_t)vaddq_s16(v34, v33);
    int32x4_t v38 = (int32x4_t)vsubq_s16(v33, v34);
    uint16x8_t v39 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v36, v38)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v36, v38))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v35, v37)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v35, v37))));
    int32x4_t v8 = (int32x4_t)vaddw_u16((uint32x4_t)v8, *(uint16x4_t *)v39.i8);
    int32x4_t v7 = (int32x4_t)vaddw_high_u16((uint32x4_t)v7, v39);
    v9 -= 4;
    v6 += 4 * a5;
    a1 = (uint8x8_t *)((char *)v12 + a2);
  }
  while (v9 > 4);
  return vaddvq_s32(vaddq_s32(v8, v7));
}

uint64_t sub_1BBB663C0(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_1BBB66298(a1, a2, a3, a4, a5, 8);
}

uint64_t sub_1BBB663C8(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  int32x4_t v4 = 0uLL;
  int v5 = &v83;
  unsigned int v6 = 20;
  int32x4_t v7 = 0uLL;
  do
  {
    uint8x16_t v8 = *(uint8x16_t *)&a1->i8[a2];
    int v9 = (uint8x16_t *)((char *)a1 + a2 + a2);
    uint8x16_t v10 = *v9;
    uint8x8_t v11 = (uint8x8_t *)&v9->i8[a2];
    uint8x16_t v12 = *(uint8x16_t *)&a3->i8[a4];
    int16x8_t v13 = (uint8x16_t *)((char *)a3 + a4 + a4);
    uint8x16_t v14 = *v13;
    uint8x16_t v15 = (uint8x8_t *)&v13->i8[a4];
    int16x8_t v16 = (int16x8_t)vsubl_u8(*a3, *a1);
    int16x8_t v17 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v12.i8, *(uint8x8_t *)v8.i8);
    int16x8_t v18 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v14.i8, *(uint8x8_t *)v10.i8);
    int16x8_t v19 = (int16x8_t)vsubl_u8(*v15, *v11);
    int16x8_t v20 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a1->i8);
    int16x8_t v21 = (int16x8_t)vsubl_high_u8(v12, v8);
    int16x8_t v22 = (int16x8_t)vsubl_high_u8(v14, v10);
    int16x8_t v23 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v15->i8, *(uint8x16_t *)v11->i8);
    int16x8_t v24 = vaddq_s16(v17, v16);
    int16x8_t v25 = vsubq_s16(v16, v17);
    int16x8_t v26 = vaddq_s16(v19, v18);
    int16x8_t v27 = vsubq_s16(v18, v19);
    int16x8_t v28 = vaddq_s16(v26, v24);
    int16x8_t v29 = vsubq_s16(v24, v26);
    int16x8_t v30 = vaddq_s16(v27, v25);
    int16x8_t v31 = vsubq_s16(v25, v27);
    int16x8_t v32 = vtrn1q_s16(v28, v30);
    int16x8_t v33 = vtrn2q_s16(v28, v30);
    int16x8_t v34 = vtrn1q_s16(v29, v31);
    int16x8_t v35 = vtrn2q_s16(v29, v31);
    int16x8_t v36 = vaddq_s16(v33, v32);
    int32x4_t v37 = (int32x4_t)vsubq_s16(v32, v33);
    int32x4_t v38 = (int32x4_t)vaddq_s16(v35, v34);
    int32x4_t v39 = (int32x4_t)vsubq_s16(v34, v35);
    int16x8_t v40 = (int16x8_t)vtrn1q_s32((int32x4_t)v36, v38);
    int16x8_t v41 = (int16x8_t)vtrn2q_s32((int32x4_t)v36, v38);
    int16x8_t v42 = (int16x8_t)vtrn1q_s32(v37, v39);
    int16x8_t v43 = (int16x8_t)vtrn2q_s32(v37, v39);
    v88.val[0] = (int8x16_t)vaddq_s16(v36, v41);
    int16x8_t v44 = vaddq_s16(v21, v20);
    int16x8_t v45 = vsubq_s16(v20, v21);
    int16x8_t v46 = vaddq_s16(v23, v22);
    int16x8_t v47 = vsubq_s16(v22, v23);
    int16x8_t v48 = vaddq_s16(v46, v44);
    int16x8_t v49 = vsubq_s16(v44, v46);
    int16x8_t v50 = vaddq_s16(v47, v45);
    int16x8_t v51 = vsubq_s16(v45, v47);
    int16x8_t v52 = vtrn1q_s16(v48, v50);
    int16x8_t v53 = vtrn2q_s16(v48, v50);
    int16x8_t v54 = vtrn1q_s16(v49, v51);
    int16x8_t v55 = vtrn2q_s16(v49, v51);
    int16x8_t v56 = vaddq_s16(v53, v52);
    int32x4_t v57 = (int32x4_t)vaddq_s16(v55, v54);
    int16x8_t v58 = (int16x8_t)vtrn2q_s32((int32x4_t)v56, v57);
    v88.val[1] = (int8x16_t)vaddq_s16(v56, v58);
    *v5++ = (int16x4_t)vqtbl2q_s8(v88, (int8x16_t)xmmword_1BBB70140).u64[0];
    uint16x8_t v59 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v42), (uint16x8_t)vabsq_s16(v43)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v40), (uint16x8_t)vabsq_s16(v41)));
    int32x4_t v60 = (int32x4_t)vsubq_s16(v52, v53);
    int32x4_t v61 = (int32x4_t)vsubq_s16(v54, v55);
    uint16x8_t v62 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v60, v61)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v60, v61))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32((int32x4_t)v56, v57)), (uint16x8_t)vabsq_s16(v58)));
    int32x4_t v7 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v7, *(uint16x4_t *)v59.i8), v59);
    int32x4_t v4 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v4, *(uint16x4_t *)v62.i8), v62);
    v6 -= 4;
    a1 = (uint8x8_t *)((char *)v11 + a2);
    a3 = (uint8x8_t *)((char *)v15 + a4);
  }
  while (v6 > 4);
  int v63 = vaddvq_s32(vaddq_s32(v4, v7));
  int16x4_t v64 = vshr_n_s16(v84, 1uLL);
  int16x4_t v65 = vshr_n_s16(v86, 1uLL);
  int16x4_t v66 = vsub_s16(vshr_n_s16(v83, 1uLL), v64);
  int16x4_t v67 = vsra_n_s16(v64, v83, 1uLL);
  int16x4_t v68 = vsub_s16(vshr_n_s16(v85, 1uLL), v65);
  int16x4_t v69 = vsra_n_s16(v65, v85, 1uLL);
  int16x4_t v70 = vadd_s16(v69, v67);
  int16x4_t v71 = vsub_s16(v67, v69);
  int16x4_t v72 = vadd_s16(v68, v66);
  int16x4_t v73 = vsub_s16(v66, v68);
  int16x4_t v74 = vtrn1_s16(v70, v72);
  int16x4_t v75 = vtrn2_s16(v70, v72);
  int16x4_t v76 = vtrn1_s16(v71, v73);
  int16x4_t v77 = vtrn2_s16(v71, v73);
  int32x2_t v78 = (int32x2_t)vadd_s16(v75, v74);
  int32x2_t v79 = (int32x2_t)vsub_s16(v74, v75);
  int32x2_t v80 = (int32x2_t)vadd_s16(v77, v76);
  int32x2_t v81 = (int32x2_t)vsub_s16(v76, v77);
  return (v63
                      - ((int)(vaddlv_u16((uint16x4_t)vadd_s16(vadd_s16(vabs_s16(v84), vabs_s16(v83)), vadd_s16(vabs_s16(v85), vabs_s16(v86))))- vaddlv_u16((uint16x4_t)vadd_s16((int16x4_t)vmax_u16((uint16x4_t)vabs_s16((int16x4_t)vzip1_s32(v79, v81)), (uint16x4_t)vabs_s16((int16x4_t)vzip2_s32(v79, v81))), (int16x4_t)vmax_u16((uint16x4_t)vabs_s16((int16x4_t)vzip1_s32(v78, v80)), (uint16x4_t)vabs_s16((int16x4_t)vzip2_s32(v78, v80)))))) >> 1));
}

uint64_t sub_1BBB66658(int16x8_t *a1)
{
  int16x8_t v1 = a1[1];
  int16x8_t v2 = a1[2];
  int16x8_t v3 = a1[3];
  int16x8_t v4 = a1[4];
  int16x8_t v5 = a1[5];
  int16x8_t v6 = a1[6];
  int16x8_t v7 = a1[7];
  int16x8_t v8 = vaddq_s16(v2, *a1);
  int16x8_t v9 = vsubq_s16(*a1, v2);
  int16x8_t v10 = vaddq_s16(v6, v4);
  int16x8_t v11 = vsubq_s16(v4, v6);
  int16x8_t v12 = vaddq_s16(v10, v8);
  int16x8_t v13 = vsubq_s16(v8, v10);
  int16x8_t v14 = vaddq_s16(v11, v9);
  int16x8_t v15 = vsubq_s16(v9, v11);
  int16x8_t v16 = vtrn1q_s16(v12, v14);
  int16x8_t v17 = vtrn2q_s16(v12, v14);
  int16x8_t v18 = vtrn1q_s16(v13, v15);
  int16x8_t v19 = vtrn2q_s16(v13, v15);
  int32x4_t v20 = (int32x4_t)vaddq_s16(v17, v16);
  int32x4_t v21 = (int32x4_t)vsubq_s16(v16, v17);
  int32x4_t v22 = (int32x4_t)vaddq_s16(v19, v18);
  int32x4_t v23 = (int32x4_t)vsubq_s16(v18, v19);
  uint16x8_t v24 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v21, v23)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v21, v23))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v20, v22)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v20, v22))));
  int16x8_t v25 = vaddq_s16(v3, v1);
  int16x8_t v26 = vsubq_s16(v1, v3);
  int16x8_t v27 = vaddq_s16(v7, v5);
  int16x8_t v28 = vsubq_s16(v5, v7);
  int16x8_t v29 = vaddq_s16(v27, v25);
  int16x8_t v30 = vsubq_s16(v25, v27);
  int16x8_t v31 = vaddq_s16(v28, v26);
  int16x8_t v32 = vsubq_s16(v26, v28);
  int16x8_t v33 = vtrn1q_s16(v29, v31);
  int16x8_t v34 = vtrn2q_s16(v29, v31);
  int16x8_t v35 = vtrn1q_s16(v30, v32);
  int16x8_t v36 = vtrn2q_s16(v30, v32);
  int32x4_t v37 = (int32x4_t)vaddq_s16(v34, v33);
  int32x4_t v38 = (int32x4_t)vsubq_s16(v33, v34);
  int32x4_t v39 = (int32x4_t)vaddq_s16(v36, v35);
  int32x4_t v40 = (int32x4_t)vsubq_s16(v35, v36);
  uint16x8_t v41 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v38, v40)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v38, v40))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v37, v39)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v37, v39))));
  int32x4_t v42 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v24.i8);
  int32x4_t v43 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v41.i8);
  int32x4_t v44 = (int32x4_t)vmovl_high_u16(v24);
  int32x4_t v45 = (int32x4_t)vmovl_high_u16(v41);
  int32x4_t v46 = 0uLL;
  unsigned int v47 = 20;
  int32x4_t v48 = 0uLL;
  do
  {
    int32x4_t v48 = vaddq_s32(vaddq_s32(v48, v42), v44);
    int32x4_t v46 = vaddq_s32(vaddq_s32(v46, v43), v45);
    v47 -= 4;
  }
  while (v47 > 4);
  return vaddvq_s32(vaddq_s32(v46, v48));
}

uint64_t sub_1BBB66788(const char *a1, int a2, const char *a3, int a4)
{
  int32x4_t v4 = 0uLL;
  unsigned int v5 = 12;
  int32x4_t v6 = 0uLL;
  do
  {
    int16x8_t v18 = (int16x8_t)vld2_s8(a1);
    int16x8_t v7 = &a1[a2];
    int16x8_t v19 = (int16x8_t)vld2_s8(v7);
    int16x8_t v8 = &v7[a2];
    int16x8_t v20 = (int16x8_t)vld2_s8(v8);
    int16x8_t v9 = &v8[a2];
    int16x8_t v21 = (int16x8_t)vld2_s8(v9);
    a1 = &v9[a2];
    int16x8_t v22 = (int16x8_t)vld2_s8(a3);
    int16x8_t v10 = &a3[a4];
    int16x8_t v11 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v18.i8, *(uint8x8_t *)v22.i8);
    int8x8x2_t v23 = vld2_s8(v10);
    int16x8_t v12 = &v10[a4];
    int16x8_t v13 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v19.i8, (uint8x8_t)v23.val[0]);
    int8x8x2_t v24 = vld2_s8(v12);
    int16x8_t v14 = &v12[a4];
    int16x8_t v15 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v20.i8, (uint8x8_t)v24.val[0]);
    int8x8x2_t v25 = vld2_s8(v14);
    a3 = &v14[a4];
    int16x8_t v16 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v21.i8, (uint8x8_t)v25.val[0]);
    int16x8_t v18 = (int16x8_t)vsubl_u8((uint8x8_t)v18.u64[1], (uint8x8_t)v22.u64[1]);
    *(uint16x8_t *)((char *)&v18 + 8) = vsubl_u8((uint8x8_t)v19.u64[1], (uint8x8_t)v23.val[1]);
    int16x8_t v19 = (int16x8_t)vsubl_u8((uint8x8_t)v20.u64[1], (uint8x8_t)v24.val[1]);
    *(uint16x8_t *)((char *)&v19 + 8) = vsubl_u8((uint8x8_t)v21.u64[1], (uint8x8_t)v25.val[1]);
    int16x8_t v20 = vaddq_s16(v13, v11);
    *(int16x8_t *)((char *)&v20 + 8) = vsubq_s16(v11, v13);
    int16x8_t v21 = vaddq_s16(v16, v15);
    *(int16x8_t *)((char *)&v21 + 8) = vsubq_s16(v15, v16);
    int16x8_t v22 = vaddq_s16(v21, v20);
    int16x8_t v20 = vsubq_s16(v20, v21);
    int16x8_t v21 = vaddq_s16(*(int16x8_t *)((char *)&v21 + 8), *(int16x8_t *)((char *)&v20 + 8));
    *(int16x8_t *)((char *)&v20 + 8) = vsubq_s16(*(int16x8_t *)((char *)&v20 + 8), *(int16x8_t *)((char *)&v21 + 8));
    *(int16x8_t *)((char *)&v21 + 8) = vtrn1q_s16(v22, v21);
    int16x8_t v21 = vtrn2q_s16(v22, v21);
    int16x8_t v22 = vtrn1q_s16(v20, *(int16x8_t *)((char *)&v20 + 8));
    int16x8_t v20 = vtrn2q_s16(v20, *(int16x8_t *)((char *)&v20 + 8));
    *(int16x8_t *)((char *)&v20 + 8) = vaddq_s16(v21, *(int16x8_t *)((char *)&v21 + 8));
    int16x8_t v21 = vsubq_s16(*(int16x8_t *)((char *)&v21 + 8), v21);
    *(int16x8_t *)((char *)&v21 + 8) = vaddq_s16(v20, v22);
    int16x8_t v20 = vsubq_s16(v22, v20);
    int16x8_t v22 = (int16x8_t)vtrn1q_s32(*(int32x4_t *)((char *)&v20 + 8), *(int32x4_t *)((char *)&v21 + 8));
    *(int32x4_t *)((char *)&v20 + 8) = vtrn2q_s32(*(int32x4_t *)((char *)&v20 + 8), *(int32x4_t *)((char *)&v21 + 8));
    *(int32x4_t *)((char *)&v21 + 8) = vtrn1q_s32((int32x4_t)v21, (int32x4_t)v20);
    int16x8_t v20 = (int16x8_t)vtrn2q_s32((int32x4_t)v21, (int32x4_t)v20);
    int16x8_t v21 = vabsq_s16(v22);
    int16x8_t v22 = vaddq_s16(*(int16x8_t *)((char *)&v18 + 8), v18);
    int16x8_t v18 = vsubq_s16(v18, *(int16x8_t *)((char *)&v18 + 8));
    *(int16x8_t *)((char *)&v18 + 8) = vaddq_s16(*(int16x8_t *)((char *)&v19 + 8), v19);
    int16x8_t v19 = vsubq_s16(v19, *(int16x8_t *)((char *)&v19 + 8));
    *(int16x8_t *)((char *)&v19 + 8) = vaddq_s16(*(int16x8_t *)((char *)&v18 + 8), v22);
    *(int16x8_t *)((char *)&v18 + 8) = vsubq_s16(v22, *(int16x8_t *)((char *)&v18 + 8));
    int16x8_t v22 = vaddq_s16(v19, v18);
    int16x8_t v18 = vsubq_s16(v18, v19);
    int16x8_t v19 = vtrn1q_s16(*(int16x8_t *)((char *)&v19 + 8), v22);
    *(int16x8_t *)((char *)&v19 + 8) = vtrn2q_s16(*(int16x8_t *)((char *)&v19 + 8), v22);
    int16x8_t v22 = vtrn1q_s16(*(int16x8_t *)((char *)&v18 + 8), v18);
    int16x8_t v18 = vtrn2q_s16(*(int16x8_t *)((char *)&v18 + 8), v18);
    *(int16x8_t *)((char *)&v18 + 8) = vaddq_s16(*(int16x8_t *)((char *)&v19 + 8), v19);
    int16x8_t v19 = vsubq_s16(v19, *(int16x8_t *)((char *)&v19 + 8));
    *(int16x8_t *)((char *)&v19 + 8) = vaddq_s16(v18, v22);
    int16x8_t v18 = vsubq_s16(v22, v18);
    int16x8_t v20 = vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(*(int16x8_t *)((char *)&v21 + 8)), (uint16x8_t)vabsq_s16(v20)), (int16x8_t)vmaxq_u16((uint16x8_t)v21, (uint16x8_t)vabsq_s16(*(int16x8_t *)((char *)&v20 + 8))));
    int16x8_t v18 = vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32((int32x4_t)v19, (int32x4_t)v18)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32((int32x4_t)v19, (int32x4_t)v18))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(*(int32x4_t *)((char *)&v18 + 8), *(int32x4_t *)((char *)&v19 + 8))), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(*(int32x4_t *)((char *)&v18 + 8), *(int32x4_t *)((char *)&v19 + 8)))));
    int32x4_t v6 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v6, *(uint16x4_t *)v20.i8), (uint16x8_t)v20);
    int32x4_t v4 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v4, *(uint16x4_t *)v18.i8), (uint16x8_t)v18);
    v5 -= 4;
  }
  while (v5 > 4);
  return vaddvq_s32(vaddq_s32(v4, v6));
}

uint64_t sub_1BBB668E0(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  int16x8_t v4 = (int16x8_t)vsubl_u8(*a1, *a3);
  int16x8_t v5 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + a2), *(uint8x8_t *)((char *)a3 + a4));
  int16x8_t v6 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 2 * a2), *(uint8x8_t *)((char *)a3 + 2 * a4));
  int16x8_t v7 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 3 * a2), *(uint8x8_t *)((char *)a3 + 3 * a4));
  int16x8_t v8 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 4 * a2), *(uint8x8_t *)((char *)a3 + 4 * a4));
  int16x8_t v9 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 5 * a2), *(uint8x8_t *)((char *)a3 + 5 * a4));
  int16x8_t v10 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 6 * a2), *(uint8x8_t *)((char *)a3 + 6 * a4));
  int16x8_t v11 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)&a1[a2] - a2), *(uint8x8_t *)((char *)&a3[a4] - a4));
  int16x8_t v12 = vaddq_s16(v5, v4);
  int16x8_t v13 = vsubq_s16(v4, v5);
  int16x8_t v14 = vaddq_s16(v7, v6);
  int16x8_t v15 = vsubq_s16(v6, v7);
  int16x8_t v16 = vaddq_s16(v9, v8);
  int16x8_t v17 = vsubq_s16(v8, v9);
  int16x8_t v18 = vaddq_s16(v11, v10);
  int16x8_t v19 = vsubq_s16(v10, v11);
  int16x8_t v20 = vaddq_s16(v14, v12);
  int16x8_t v21 = vsubq_s16(v12, v14);
  int16x8_t v22 = vaddq_s16(v15, v13);
  int16x8_t v23 = vsubq_s16(v13, v15);
  int16x8_t v24 = vaddq_s16(v18, v16);
  int16x8_t v25 = vsubq_s16(v16, v18);
  int16x8_t v26 = vaddq_s16(v19, v17);
  int16x8_t v27 = vsubq_s16(v17, v19);
  int16x8_t v28 = vaddq_s16(v24, v20);
  int16x8_t v29 = vsubq_s16(v20, v24);
  int16x8_t v30 = vaddq_s16(v26, v22);
  int16x8_t v31 = vsubq_s16(v22, v26);
  int16x8_t v32 = vaddq_s16(v25, v21);
  int16x8_t v33 = vsubq_s16(v21, v25);
  int16x8_t v34 = vaddq_s16(v27, v23);
  int16x8_t v35 = vsubq_s16(v23, v27);
  int16x8_t v36 = vtrn1q_s16(v28, v30);
  int16x8_t v37 = vtrn2q_s16(v28, v30);
  int16x8_t v38 = vtrn1q_s16(v32, v34);
  int16x8_t v39 = vtrn2q_s16(v32, v34);
  int16x8_t v40 = vtrn1q_s16(v29, v31);
  int16x8_t v41 = vtrn2q_s16(v29, v31);
  int16x8_t v42 = vtrn1q_s16(v33, v35);
  int16x8_t v43 = vtrn2q_s16(v33, v35);
  int32x4_t v44 = (int32x4_t)vaddq_s16(v37, v36);
  int32x4_t v45 = (int32x4_t)vsubq_s16(v36, v37);
  int32x4_t v46 = (int32x4_t)vaddq_s16(v39, v38);
  int32x4_t v47 = (int32x4_t)vsubq_s16(v38, v39);
  int32x4_t v48 = (int32x4_t)vaddq_s16(v41, v40);
  int32x4_t v49 = (int32x4_t)vsubq_s16(v40, v41);
  int32x4_t v50 = (int32x4_t)vaddq_s16(v43, v42);
  int32x4_t v51 = (int32x4_t)vsubq_s16(v42, v43);
  int16x8_t v52 = (int16x8_t)vtrn1q_s32(v44, v46);
  int16x8_t v53 = (int16x8_t)vtrn2q_s32(v44, v46);
  int16x8_t v54 = (int16x8_t)vtrn1q_s32(v45, v47);
  int16x8_t v55 = (int16x8_t)vtrn2q_s32(v45, v47);
  int16x8_t v56 = (int16x8_t)vtrn1q_s32(v48, v50);
  int16x8_t v57 = (int16x8_t)vtrn2q_s32(v48, v50);
  int16x8_t v58 = (int16x8_t)vtrn1q_s32(v49, v51);
  int16x8_t v59 = (int16x8_t)vtrn2q_s32(v49, v51);
  int16x8_t v60 = vaddq_s16(v53, v52);
  int16x8_t v61 = vsubq_s16(v52, v53);
  int16x8_t v62 = vaddq_s16(v55, v54);
  int16x8_t v63 = vsubq_s16(v54, v55);
  int64x2_t v64 = (int64x2_t)vaddq_s16(v57, v56);
  int64x2_t v65 = (int64x2_t)vsubq_s16(v56, v57);
  int64x2_t v66 = (int64x2_t)vaddq_s16(v59, v58);
  int64x2_t v67 = (int64x2_t)vsubq_s16(v58, v59);
  int16x8_t v68 = (int16x8_t)vzip2q_s64((int64x2_t)v60, v64);
  int16x8_t v69 = (int16x8_t)vzip2q_s64((int64x2_t)v62, v66);
  int16x8_t v70 = (int16x8_t)vzip2q_s64((int64x2_t)v61, v65);
  v60.i64[1] = v64.i64[0];
  int16x8_t v71 = (int16x8_t)vzip2q_s64((int64x2_t)v63, v67);
  v62.i64[1] = v66.i64[0];
  uint16x8_t v72 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v62), (uint16x8_t)vabsq_s16(v69)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v60), (uint16x8_t)vabsq_s16(v68)));
  v61.i64[1] = v65.i64[0];
  v63.i64[1] = v67.i64[0];
  uint16x8_t v73 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v63), (uint16x8_t)vabsq_s16(v71)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v61), (uint16x8_t)vabsq_s16(v70)));
  return ((vaddvq_s32((int32x4_t)vaddw_high_u16(vaddw_u16(vaddw_high_u16(vmovl_u16(*(uint16x4_t *)v72.i8), v72), *(uint16x4_t *)v73.i8), v73))+ 1) >> 1);
}

uint64_t sub_1BBB66AD0(int16x8_t *a1, int a2)
{
  int16x8_t v2 = *(int16x8_t *)((char *)a1 + 2 * a2);
  int16x8_t v3 = *(int16x8_t *)((char *)a1 + 4 * a2);
  int16x8_t v4 = *(int16x8_t *)((char *)a1 + 6 * a2);
  int16x8_t v5 = *(int16x8_t *)((char *)a1 + 8 * a2);
  int16x8_t v6 = *(int16x8_t *)((char *)a1 + 10 * a2);
  int16x8_t v7 = *(int16x8_t *)((char *)a1 + 12 * a2);
  int16x8_t v8 = *(int16x8_t *)((char *)a1 + 14 * a2);
  int16x8_t v9 = vaddq_s16(v2, *a1);
  int16x8_t v10 = vsubq_s16(*a1, v2);
  int16x8_t v11 = vaddq_s16(v4, v3);
  int16x8_t v12 = vsubq_s16(v3, v4);
  int16x8_t v13 = vaddq_s16(v6, v5);
  int16x8_t v14 = vsubq_s16(v5, v6);
  int16x8_t v15 = vaddq_s16(v8, v7);
  int16x8_t v16 = vsubq_s16(v7, v8);
  int16x8_t v17 = vaddq_s16(v11, v9);
  int16x8_t v18 = vsubq_s16(v9, v11);
  int16x8_t v19 = vaddq_s16(v12, v10);
  int16x8_t v20 = vsubq_s16(v10, v12);
  int16x8_t v21 = vaddq_s16(v15, v13);
  int16x8_t v22 = vsubq_s16(v13, v15);
  int16x8_t v23 = vaddq_s16(v16, v14);
  int16x8_t v24 = vsubq_s16(v14, v16);
  int16x8_t v25 = vaddq_s16(v21, v17);
  int16x8_t v26 = vsubq_s16(v17, v21);
  int16x8_t v27 = vaddq_s16(v23, v19);
  int16x8_t v28 = vsubq_s16(v19, v23);
  int16x8_t v29 = vaddq_s16(v22, v18);
  int16x8_t v30 = vsubq_s16(v18, v22);
  int16x8_t v31 = vaddq_s16(v24, v20);
  int16x8_t v32 = vsubq_s16(v20, v24);
  int16x8_t v33 = vtrn1q_s16(v25, v27);
  int16x8_t v34 = vtrn2q_s16(v25, v27);
  int16x8_t v35 = vtrn1q_s16(v29, v31);
  int16x8_t v36 = vtrn2q_s16(v29, v31);
  int16x8_t v37 = vtrn1q_s16(v26, v28);
  int16x8_t v38 = vtrn2q_s16(v26, v28);
  int16x8_t v39 = vtrn1q_s16(v30, v32);
  int16x8_t v40 = vtrn2q_s16(v30, v32);
  int32x4_t v41 = (int32x4_t)vaddq_s16(v34, v33);
  int32x4_t v42 = (int32x4_t)vsubq_s16(v33, v34);
  int32x4_t v43 = (int32x4_t)vaddq_s16(v36, v35);
  int32x4_t v44 = (int32x4_t)vsubq_s16(v35, v36);
  int32x4_t v45 = (int32x4_t)vaddq_s16(v38, v37);
  int32x4_t v46 = (int32x4_t)vsubq_s16(v37, v38);
  int32x4_t v47 = (int32x4_t)vaddq_s16(v40, v39);
  int32x4_t v48 = (int32x4_t)vsubq_s16(v39, v40);
  int16x8_t v49 = (int16x8_t)vtrn1q_s32(v41, v43);
  int16x8_t v50 = (int16x8_t)vtrn2q_s32(v41, v43);
  int16x8_t v51 = (int16x8_t)vtrn1q_s32(v42, v44);
  int16x8_t v52 = (int16x8_t)vtrn2q_s32(v42, v44);
  int16x8_t v53 = (int16x8_t)vtrn1q_s32(v45, v47);
  int16x8_t v54 = (int16x8_t)vtrn2q_s32(v45, v47);
  int16x8_t v55 = (int16x8_t)vtrn1q_s32(v46, v48);
  int16x8_t v56 = (int16x8_t)vtrn2q_s32(v46, v48);
  int16x8_t v57 = vaddq_s16(v50, v49);
  int16x8_t v58 = vsubq_s16(v49, v50);
  int16x8_t v59 = vaddq_s16(v52, v51);
  int16x8_t v60 = vsubq_s16(v51, v52);
  int64x2_t v61 = (int64x2_t)vaddq_s16(v54, v53);
  int64x2_t v62 = (int64x2_t)vsubq_s16(v53, v54);
  int64x2_t v63 = (int64x2_t)vaddq_s16(v56, v55);
  int64x2_t v64 = (int64x2_t)vsubq_s16(v55, v56);
  int16x8_t v65 = (int16x8_t)vzip2q_s64((int64x2_t)v57, v61);
  int16x8_t v66 = (int16x8_t)vzip2q_s64((int64x2_t)v59, v63);
  int16x8_t v67 = (int16x8_t)vzip2q_s64((int64x2_t)v58, v62);
  v57.i64[1] = v61.i64[0];
  int16x8_t v68 = (int16x8_t)vzip2q_s64((int64x2_t)v60, v64);
  v59.i64[1] = v63.i64[0];
  uint16x8_t v69 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v59), (uint16x8_t)vabsq_s16(v66)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v57), (uint16x8_t)vabsq_s16(v65)));
  v58.i64[1] = v62.i64[0];
  v60.i64[1] = v64.i64[0];
  uint16x8_t v70 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v60), (uint16x8_t)vabsq_s16(v68)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v58), (uint16x8_t)vabsq_s16(v67)));
  return ((vaddvq_s32((int32x4_t)vaddw_high_u16(vaddw_u16(vaddw_high_u16(vmovl_u16(*(uint16x4_t *)v69.i8), v69), *(uint16x4_t *)v70.i8), v70))+ 1) >> 1);
}

uint64_t sub_1BBB66C78(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  unsigned int v4 = 0;
  int16x8_t v5 = (uint8x8_t *)((char *)a1 + a2);
  int16x8_t v6 = (uint8x16_t *)((char *)v5 + a2);
  uint64_t v7 = a2;
  uint8x16_t v8 = *v6;
  uint8x16_t v9 = *(uint8x16_t *)((char *)v6 + a2);
  int16x8_t v10 = (uint8x16_t *)((char *)a3 + a4);
  uint8x16_t v11 = *v10;
  int16x8_t v12 = (uint8x8_t *)&v10->i8[a4];
  uint8x16_t v13 = *(uint8x16_t *)&v12->i8[a4];
  int16x8_t v14 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v8.i8, *v12), *a1, *a3);
  int16x8_t v15 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v8, *(uint8x16_t *)v12->i8), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  int16x8_t v16 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v9.i8, *(uint8x8_t *)v13.i8), *v5, *(uint8x8_t *)v11.i8);
  int16x8_t v17 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v9, v13), *(uint8x16_t *)v5->i8, v11);
  uint64_t v18 = 7 * a2;
  uint64_t v19 = 6 * a2;
  uint64_t v20 = 4 * a2;
  uint64_t v21 = 5 * a2;
  do
  {
    uint8x16_t v22 = *(uint8x16_t *)&a3->i8[4 * a4];
    uint8x16_t v23 = *(uint8x16_t *)&a3->i8[5 * a4];
    uint8x16_t v24 = *(uint8x16_t *)&a3->i8[6 * a4];
    uint8x16_t v25 = *(uint8x16_t *)&a3->i8[7 * a4];
    a3 = (uint8x8_t *)((char *)a3 + 2 * a4 + a4 + a4);
    uint8x16_t v26 = *(uint8x16_t *)&a1->i8[v20];
    uint8x16_t v27 = *(uint8x16_t *)&a1->i8[v21];
    uint8x16_t v28 = *(uint8x16_t *)&a1->i8[v19];
    uint8x16_t v29 = *(uint8x16_t *)&a1->i8[v18];
    a1 = (uint8x8_t *)((char *)a1 + 2 * v7 + v7 + v7);
    int16x8_t v14 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v14, *(uint8x8_t *)v26.i8, *(uint8x8_t *)v22.i8), *(uint8x8_t *)v28.i8, *(uint8x8_t *)v24.i8);
    int16x8_t v15 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v15, v26, v22), v28, v24);
    int16x8_t v16 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v16, *(uint8x8_t *)v27.i8, *(uint8x8_t *)v23.i8), *(uint8x8_t *)v29.i8, *(uint8x8_t *)v25.i8);
    int16x8_t v17 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v17, v27, v23), v29, v25);
    v4 += 4;
  }
  while (v4 < 0xC);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v16, v17), vaddq_s16(v15, v14)));
}

uint64_t sub_1BBB66D90(uint64_t a1, uint8x16_t *a2, int a3)
{
  int16x8_t v3 = (uint8x16_t *)((char *)a2 + a3);
  uint8x16_t v4 = *v3;
  int16x8_t v5 = (uint8x16_t *)((char *)v3 + a3);
  uint8x16_t v6 = *v5;
  uint64_t v7 = (uint8x16_t *)((char *)v5 + a3);
  uint8x16_t v8 = *v7;
  uint8x16_t v9 = (uint8x16_t *)((char *)v7 + a3);
  uint8x16_t v10 = *v9;
  uint8x16_t v11 = (uint8x16_t *)((char *)v9 + a3);
  uint8x16_t v12 = *v11;
  uint8x16_t v13 = (uint8x16_t *)((char *)v11 + a3);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabdl_u8(*(uint8x8_t *)(a1 + 48), *(uint8x8_t *)v8.i8), *(uint8x8_t *)(a1 + 16), *(uint8x8_t *)v4.i8), *(uint8x8_t *)(a1 + 80), *(uint8x8_t *)v12.i8), *(uint8x8_t *)(a1 + 112), *(uint8x8_t *)&v13->i8[a3]), (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabdl_high_u8(*(uint8x16_t *)(a1 + 48), v8), *(uint8x16_t *)(a1 + 16), v4), *(uint8x16_t *)(a1 + 80), v12),
                                                  *(uint8x16_t *)(a1 + 112),
                                                  *(uint8x16_t *)((char *)v13 + a3))),
                                   vaddq_s16((int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabdl_high_u8(*(uint8x16_t *)(a1 + 32), v6), *(uint8x16_t *)a1, *a2), *(uint8x16_t *)(a1 + 64), v10), *(uint8x16_t *)(a1 + 96), *v13), (int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabdl_u8(*(uint8x8_t *)(a1 + 32), *(uint8x8_t *)v6.i8), *(uint8x8_t *)a1, *(uint8x8_t *)a2->i8), *(uint8x8_t *)(a1 + 64), *(uint8x8_t *)v10.i8), *(uint8x8_t *)(a1 + 96),
                                                  *(uint8x8_t *)v13->i8))));
}

uint64_t sub_1BBB66E30(uint8x8_t *a1, uint8x8_t *a2, int a3)
{
  unsigned int v3 = 0;
  uint8x16_t v4 = (uint8x8_t *)((char *)a2 + a3);
  uint8x8_t v5 = *v4;
  uint8x16_t v6 = (uint8x8_t *)((char *)v4 + a3);
  int16x8_t v7 = (int16x8_t)vabdl_u8(*a1, *a2);
  int16x8_t v8 = (int16x8_t)vabdl_u8(a1[2], v5);
  int16x8_t v9 = (int16x8_t)vabdl_u8(a1[4], *v6);
  int16x8_t v10 = (int16x8_t)vabdl_u8(a1[6], *(uint8x8_t *)((char *)v6 + a3));
  uint8x16_t v11 = a1 + 14;
  do
  {
    uint8x8_t v12 = *(uint8x8_t *)((char *)a2 + 4 * a3);
    uint8x8_t v13 = *(uint8x8_t *)((char *)a2 + 5 * a3);
    uint8x8_t v14 = *(uint8x8_t *)((char *)a2 + 6 * a3);
    uint8x8_t v15 = *(uint8x8_t *)((char *)a2 + 7 * a3);
    a2 = (uint8x8_t *)((char *)a2 + 2 * a3 + a3 + a3);
    uint8x8_t v16 = v11[-6];
    uint8x8_t v17 = v11[-4];
    uint8x8_t v18 = v11[-2];
    uint8x8_t v19 = *v11;
    v11 += 8;
    int16x8_t v7 = (int16x8_t)vabal_u8((uint16x8_t)v7, v16, v12);
    int16x8_t v8 = (int16x8_t)vabal_u8((uint16x8_t)v8, v17, v13);
    int16x8_t v9 = (int16x8_t)vabal_u8((uint16x8_t)v9, v18, v14);
    int16x8_t v10 = (int16x8_t)vabal_u8((uint16x8_t)v10, v19, v15);
    v3 += 4;
  }
  while (v3 < 0xC);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v9, v10), vaddq_s16(v8, v7)));
}

uint64_t sub_1BBB66EF4(_OWORD *a1, uint8x16_t *a2, uint8x16_t *a3, int a4)
{
  uint8x16_t v4 = *(uint8x16_t *)a1;
  uint8x16_t v5 = *((uint8x16_t *)a1 + 1);
  uint8x16_t v6 = *((uint8x16_t *)a1 + 2);
  uint8x16_t v7 = *((uint8x16_t *)a1 + 3);
  uint8x16_t v8 = *a2;
  int16x8_t v9 = (uint8x16_t *)((char *)a2 + a4);
  uint8x16_t v10 = *v9;
  uint8x16_t v11 = (uint8x16_t *)((char *)v9 + a4);
  uint8x16_t v12 = *v11;
  uint8x16_t v13 = *(uint8x16_t *)((char *)v11 + a4);
  if (a3)
  {
    uint8x8_t v14 = (uint8x16_t *)((char *)a3 + a4 + a4);
    uint8x16_t v15 = *v14;
    uint8x8_t v16 = (uint8x16_t *)((char *)v14 + a4);
    uint8x16_t v17 = *v16;
    uint8x8_t v18 = (uint8x16_t *)((char *)v16 + a4);
    uint8x16_t v8 = vrhaddq_u8(v8, *a3);
    uint8x16_t v10 = vrhaddq_u8(v10, *(uint8x16_t *)((char *)a3 + a4));
    uint8x16_t v12 = vrhaddq_u8(v12, v15);
    uint8x16_t v13 = vrhaddq_u8(v13, v17);
  }
  else
  {
    uint8x8_t v18 = 0;
  }
  unsigned int v19 = 0;
  int16x8_t v20 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v6.i8, *(uint8x8_t *)v12.i8), *(uint8x8_t *)v4.i8, *(uint8x8_t *)v8.i8);
  int16x8_t v21 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v6, v12), v4, v8);
  int16x8_t v22 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v7.i8, *(uint8x8_t *)v13.i8), *(uint8x8_t *)v5.i8, *(uint8x8_t *)v10.i8);
  int16x8_t v23 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v7, v13), v5, v10);
  uint8x16_t v24 = (uint8x8_t *)(a1 + 7);
  do
  {
    uint8x16_t v25 = *(uint8x16_t *)((char *)a2 + 4 * a4);
    uint8x16_t v26 = *(uint8x16_t *)((char *)a2 + 5 * a4);
    uint8x16_t v27 = *(uint8x16_t *)((char *)a2 + 6 * a4);
    uint8x16_t v28 = *(uint8x16_t *)((char *)a2 + 7 * a4);
    if (v18)
    {
      uint8x16_t v29 = *v18;
      int16x8_t v30 = (uint8x16_t *)((char *)v18 + a4);
      uint8x16_t v31 = *v30;
      int16x8_t v32 = (uint8x16_t *)((char *)v30 + a4);
      uint8x16_t v33 = *v32;
      int16x8_t v34 = (uint8x16_t *)((char *)v32 + a4);
      uint8x16_t v35 = *v34;
      uint8x8_t v18 = (uint8x16_t *)((char *)v34 + a4);
      uint8x16_t v25 = vrhaddq_u8(v25, v29);
      uint8x16_t v26 = vrhaddq_u8(v26, v31);
      uint8x16_t v27 = vrhaddq_u8(v27, v33);
      uint8x16_t v28 = vrhaddq_u8(v28, v35);
    }
    a2 = (uint8x16_t *)((char *)a2 + 2 * a4 + a4 + a4);
    uint8x16_t v36 = *(uint8x16_t *)v24[-6].i8;
    uint8x16_t v37 = *(uint8x16_t *)v24[-4].i8;
    uint8x16_t v38 = *(uint8x16_t *)v24[-2].i8;
    int16x8_t v20 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v20, *(uint8x8_t *)v36.i8, *(uint8x8_t *)v25.i8), *(uint8x8_t *)v38.i8, *(uint8x8_t *)v27.i8);
    int16x8_t v21 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v21, v36, v25), v38, v27);
    int16x8_t v22 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v22, *(uint8x8_t *)v37.i8, *(uint8x8_t *)v26.i8), *v24, *(uint8x8_t *)v28.i8);
    int16x8_t v23 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v23, v37, v26), *(uint8x16_t *)v24->i8, v28);
    v19 += 4;
    v24 += 8;
  }
  while (v19 < 0xC);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v22, v23), vaddq_s16(v21, v20)));
}

uint64_t sub_1BBB67038(uint64_t a1, uint8x16_t *a2, uint8x16_t *a3, int a4)
{
  uint8x16_t v4 = *a2;
  uint8x16_t v5 = (uint8x16_t *)((char *)a2 + a4);
  uint8x16_t v6 = *v5;
  uint8x16_t v7 = (uint8x16_t *)((char *)v5 + a4);
  uint8x16_t v8 = *v7;
  int16x8_t v9 = (uint8x16_t *)((char *)v7 + a4);
  uint8x16_t v10 = *v9;
  if (a3)
  {
    uint8x16_t v11 = (uint8x16_t *)((char *)a3 + a4 + a4);
    uint8x16_t v12 = *v11;
    uint8x16_t v13 = (uint8x16_t *)((char *)v11 + a4);
    uint8x16_t v14 = *v13;
    uint8x16_t v15 = (uint8x16_t *)((char *)v13 + a4);
    uint8x16_t v4 = vrhaddq_u8(v4, *a3);
    uint8x16_t v6 = vrhaddq_u8(v6, *(uint8x16_t *)((char *)a3 + a4));
    uint8x16_t v8 = vrhaddq_u8(v8, v12);
    uint8x16_t v10 = vrhaddq_u8(v10, v14);
  }
  else
  {
    uint8x16_t v15 = 0;
  }
  uint8x8_t v16 = (uint8x16_t *)((char *)v9 + a4);
  uint8x16_t v17 = *v16;
  uint8x8_t v18 = (uint8x16_t *)((char *)v16 + a4);
  uint8x16_t v19 = *v18;
  int16x8_t v20 = (uint8x16_t *)((char *)v18 + a4);
  uint8x16_t v21 = *v20;
  uint8x16_t v22 = *(uint8x16_t *)((char *)v20 + a4);
  if (v15)
  {
    int16x8_t v23 = (uint8x16_t *)((char *)v15 + a4 + a4);
    uint8x16_t v17 = vrhaddq_u8(v17, *v15);
    uint8x16_t v19 = vrhaddq_u8(v19, *(uint8x16_t *)((char *)v15 + a4));
    uint8x16_t v21 = vrhaddq_u8(v21, *v23);
    uint8x16_t v22 = vrhaddq_u8(v22, *(uint8x16_t *)((char *)v23 + a4));
  }
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabdl_u8(*(uint8x8_t *)(a1 + 48), *(uint8x8_t *)v10.i8), *(uint8x8_t *)(a1 + 16), *(uint8x8_t *)v6.i8), *(uint8x8_t *)(a1 + 80), *(uint8x8_t *)v19.i8), *(uint8x8_t *)(a1 + 112), *(uint8x8_t *)v22.i8), (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabdl_high_u8(*(uint8x16_t *)(a1 + 48), v10), *(uint8x16_t *)(a1 + 16), v6), *(uint8x16_t *)(a1 + 80), v19),
                                                  *(uint8x16_t *)(a1 + 112),
                                                  v22)),
                                   vaddq_s16((int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabdl_high_u8(*(uint8x16_t *)(a1 + 32), v8), *(uint8x16_t *)a1, v4), *(uint8x16_t *)(a1 + 64), v17), *(uint8x16_t *)(a1 + 96), v21), (int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabdl_u8(*(uint8x8_t *)(a1 + 32), *(uint8x8_t *)v8.i8), *(uint8x8_t *)a1, *(uint8x8_t *)v4.i8), *(uint8x8_t *)(a1 + 64), *(uint8x8_t *)v17.i8), *(uint8x8_t *)(a1 + 96),
                                                  *(uint8x8_t *)v21.i8))));
}

uint64_t sub_1BBB67144(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, int a4)
{
  uint8x8_t v4 = *a2;
  uint8x16_t v5 = (uint8x8_t *)((char *)a2 + a4);
  uint8x8_t v6 = *v5;
  uint8x16_t v7 = (uint8x8_t *)((char *)v5 + a4);
  uint8x8_t v8 = *v7;
  uint8x8_t v9 = *(uint8x8_t *)((char *)v7 + a4);
  if (a3)
  {
    uint8x16_t v10 = (uint8x8_t *)((char *)a3 + a4 + a4);
    uint8x8_t v11 = *v10;
    uint8x16_t v12 = (uint8x8_t *)((char *)v10 + a4);
    uint8x8_t v13 = *v12;
    uint8x16_t v14 = (uint8x8_t *)((char *)v12 + a4);
    uint8x8_t v4 = vrhadd_u8(v4, *a3);
    uint8x8_t v6 = vrhadd_u8(v6, *(uint8x8_t *)((char *)a3 + a4));
    uint8x8_t v8 = vrhadd_u8(v8, v11);
    uint8x8_t v9 = vrhadd_u8(v9, v13);
  }
  else
  {
    uint8x16_t v14 = 0;
  }
  unsigned int v15 = 0;
  int16x8_t v16 = (int16x8_t)vabdl_u8(*a1, v4);
  int16x8_t v17 = (int16x8_t)vabdl_u8(a1[2], v6);
  int16x8_t v18 = (int16x8_t)vabdl_u8(a1[4], v8);
  int16x8_t v19 = (int16x8_t)vabdl_u8(a1[6], v9);
  int16x8_t v20 = a1 + 14;
  do
  {
    uint8x8_t v21 = *(uint8x8_t *)((char *)a2 + 4 * a4);
    uint8x8_t v22 = *(uint8x8_t *)((char *)a2 + 5 * a4);
    uint8x8_t v23 = *(uint8x8_t *)((char *)a2 + 6 * a4);
    uint8x8_t v24 = *(uint8x8_t *)((char *)a2 + 7 * a4);
    if (v14)
    {
      uint8x8_t v25 = *v14;
      uint8x16_t v26 = (uint8x8_t *)((char *)v14 + a4);
      uint8x8_t v27 = *v26;
      uint8x16_t v28 = (uint8x8_t *)((char *)v26 + a4);
      uint8x8_t v29 = *v28;
      int16x8_t v30 = (uint8x8_t *)((char *)v28 + a4);
      uint8x8_t v31 = *v30;
      uint8x16_t v14 = (uint8x8_t *)((char *)v30 + a4);
      uint8x8_t v21 = vrhadd_u8(v21, v25);
      uint8x8_t v22 = vrhadd_u8(v22, v27);
      uint8x8_t v23 = vrhadd_u8(v23, v29);
      uint8x8_t v24 = vrhadd_u8(v24, v31);
    }
    a2 = (uint8x8_t *)((char *)a2 + 2 * a4 + a4 + a4);
    uint8x8_t v32 = v20[-6];
    uint8x8_t v33 = v20[-4];
    uint8x8_t v34 = v20[-2];
    uint8x8_t v35 = *v20;
    v20 += 8;
    int16x8_t v16 = (int16x8_t)vabal_u8((uint16x8_t)v16, v32, v21);
    int16x8_t v17 = (int16x8_t)vabal_u8((uint16x8_t)v17, v33, v22);
    int16x8_t v18 = (int16x8_t)vabal_u8((uint16x8_t)v18, v34, v23);
    int16x8_t v19 = (int16x8_t)vabal_u8((uint16x8_t)v19, v35, v24);
    v15 += 4;
  }
  while (v15 < 0xC);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v18, v19), vaddq_s16(v17, v16)));
}

uint64_t sub_1BBB67274(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, int a4)
{
  uint8x8_t v4 = *a2;
  uint8x16_t v5 = (uint8x8_t *)((char *)a2 + a4);
  uint8x8_t v6 = *v5;
  uint8x16_t v7 = (uint8x8_t *)((char *)v5 + a4);
  uint8x8_t v8 = *v7;
  uint8x8_t v9 = (uint8x8_t *)((char *)v7 + a4);
  uint8x8_t v10 = *v9;
  if (a3)
  {
    uint8x8_t v11 = (uint8x8_t *)((char *)a3 + a4 + a4);
    uint8x8_t v12 = *v11;
    uint8x8_t v13 = (uint8x8_t *)((char *)v11 + a4);
    uint8x8_t v14 = *v13;
    unsigned int v15 = (uint8x8_t *)((char *)v13 + a4);
    uint8x8_t v4 = vrhadd_u8(v4, *a3);
    uint8x8_t v6 = vrhadd_u8(v6, *(uint8x8_t *)((char *)a3 + a4));
    uint8x8_t v8 = vrhadd_u8(v8, v12);
    uint8x8_t v10 = vrhadd_u8(v10, v14);
  }
  else
  {
    unsigned int v15 = 0;
  }
  int16x8_t v16 = (uint8x8_t *)((char *)v9 + a4);
  uint8x8_t v17 = *v16;
  int16x8_t v18 = (uint8x8_t *)((char *)v16 + a4);
  uint8x8_t v19 = *v18;
  int16x8_t v20 = (uint8x8_t *)((char *)v18 + a4);
  uint8x8_t v21 = *v20;
  uint8x8_t v22 = *(uint8x8_t *)((char *)v20 + a4);
  if (v15)
  {
    uint8x8_t v23 = (uint8x8_t *)((char *)v15 + a4 + a4);
    uint8x8_t v17 = vrhadd_u8(v17, *v15);
    uint8x8_t v19 = vrhadd_u8(v19, *(uint8x8_t *)((char *)v15 + a4));
    uint8x8_t v21 = vrhadd_u8(v21, *v23);
    uint8x8_t v22 = vrhadd_u8(v22, *(uint8x8_t *)((char *)v23 + a4));
  }
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(a1[4], v8), a1[12], v21), (int16x8_t)vabal_u8(vabdl_u8(a1[6], v10), a1[14], v22)), vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(a1[2], v6), a1[10], v19), (int16x8_t)vabal_u8(vabdl_u8(*a1, v4), a1[8], v17))));
}

double sub_1BBB67370(uint8x16_t **a1, _WORD *a2)
{
  *(void *)&double result = sub_1BBB67394(a1[7], (uint8x16_t *)((char *)a1[3] + *((int *)a1 + 1) * (uint64_t)*((int *)a1 + 4) + *(int *)a1), *((_DWORD *)a1 + 4), a2);
  return result;
}

__int16 sub_1BBB67394@<H0>(uint8x16_t *a1@<X0>, uint8x16_t *a2@<X1>, int a3@<W2>, _WORD *a4@<X3>)
{
  uint8x16_t v4 = a1[1];
  uint8x16_t v6 = a1[2];
  uint8x16_t v5 = a1[3];
  uint8x16_t v7 = (uint8x16_t *)((char *)a2 + a3);
  uint8x16_t v8 = *v7;
  uint8x8_t v9 = (uint8x16_t *)((char *)v7 + a3);
  uint8x16_t v10 = *v9;
  uint8x8_t v11 = (uint8x16_t *)((char *)v9 + a3);
  uint8x16_t v12 = *v11;
  uint8x8_t v13 = (uint8x16_t *)((char *)v11 + a3);
  uint16x8_t v14 = vabdl_u8(*(uint8x8_t *)v4.i8, *(uint8x8_t *)v8.i8);
  uint16x8_t v15 = vabdl_high_u8(v4, v8);
  uint8x16_t v17 = a1[4];
  uint8x16_t v16 = a1[5];
  uint8x16_t v19 = a1[6];
  uint8x16_t v18 = a1[7];
  uint8x16_t v20 = *v13;
  uint8x8_t v21 = (uint8x16_t *)((char *)v13 + a3);
  uint8x16_t v22 = *v21;
  uint8x8_t v23 = (uint8x16_t *)((char *)v21 + a3);
  uint8x16_t v24 = *v23;
  uint8x8_t v25 = (uint8x16_t *)((char *)v23 + a3);
  uint8x16_t v26 = *v25;
  uint8x8_t v27 = (uint8x16_t *)((char *)v25 + a3);
  uint8x16_t v29 = a1[8];
  uint8x16_t v28 = a1[9];
  uint8x16_t v31 = a1[10];
  uint8x16_t v30 = a1[11];
  uint8x16_t v32 = *v27;
  uint8x8_t v33 = (uint8x16_t *)((char *)v27 + a3);
  uint8x16_t v34 = *v33;
  uint8x8_t v35 = (uint8x16_t *)((char *)v33 + a3);
  uint8x16_t v36 = *v35;
  uint8x16_t v37 = (uint8x16_t *)((char *)v35 + a3);
  uint8x16_t v38 = *v37;
  int16x8_t v39 = (uint8x16_t *)((char *)v37 + a3);
  uint16x8_t v40 = vabdl_u8(*(uint8x8_t *)v28.i8, *(uint8x8_t *)v34.i8);
  uint16x8_t v41 = vabdl_high_u8(v28, v34);
  uint8x16_t v43 = a1[12];
  uint8x16_t v42 = a1[13];
  uint8x16_t v45 = a1[14];
  uint8x16_t v44 = a1[15];
  uint8x16_t v46 = *v39;
  int32x4_t v47 = (uint8x16_t *)((char *)v39 + a3);
  uint8x16_t v48 = *v47;
  int16x8_t v49 = (uint8x8_t *)&v47->i8[a3];
  uint8x16_t v50 = *(uint8x16_t *)&v49->i8[a3];
  int16x8_t v51 = (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(v15, *a1, *a2), v6, v10), v5, v12), v17, v20), v16, v22), v19, v24), v18, v26);
  int16x8_t v52 = (int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(v40, *(uint8x8_t *)v29.i8, *(uint8x8_t *)v32.i8), *(uint8x8_t *)v31.i8, *(uint8x8_t *)v36.i8), *(uint8x8_t *)v30.i8, *(uint8x8_t *)v38.i8), *(uint8x8_t *)v43.i8, *(uint8x8_t *)v46.i8), *(uint8x8_t *)v42.i8, *(uint8x8_t *)v48.i8), *(uint8x8_t *)v45.i8, *v49), *(uint8x8_t *)v44.i8, *(uint8x8_t *)v50.i8);
  int16x8_t v53 = (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(v41, v29, v32), v31, v36), v30, v38), v43, v46), v42, v48), v45, *(uint8x16_t *)v49->i8), v44, v50);
  v14.i16[0] = vaddvq_s16((int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(v14, *(uint8x8_t *)a1->i8, *(uint8x8_t *)a2->i8), *(uint8x8_t *)v6.i8, *(uint8x8_t *)v10.i8), *(uint8x8_t *)v5.i8, *(uint8x8_t *)v12.i8), *(uint8x8_t *)v17.i8, *(uint8x8_t *)v20.i8), *(uint8x8_t *)v16.i8, *(uint8x8_t *)v22.i8), *(uint8x8_t *)v19.i8, *(uint8x8_t *)v24.i8), *(uint8x8_t *)v18.i8, *(uint8x8_t *)v26.i8));
  a4[12] = v14.i16[0];
  v51.i16[0] = vaddvq_s16(v51);
  a4[13] = v51.i16[0];
  __int16 v54 = v51.i16[0];
  v51.i16[0] = vaddvq_s16(v52);
  a4[14] = v51.i16[0];
  __int16 v55 = v51.i16[0];
  __int16 result = vaddvq_s16(v53);
  a4[15] = result;
  a4[8] = v55 + v14.i16[0];
  a4[9] = result + v54;
  a4[4] = v54 + v14.i16[0];
  a4[5] = result + v55;
  *a4 = result + v54 + v55 + v14.i16[0];
  return result;
}

double sub_1BBB67528(int *a1, _WORD *a2, double a3, double a4, int8x8_t a5)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint8x16_t v6 = (uint8x16_t *)*((void *)a1 + 7);
  sub_1BBB6582C(v8, (uint8x16_t *)(*((void *)a1 + 3) + a1[1] * (uint64_t)a1[4] + *a1), a1[4], *((char *)a1 + 72), *((char *)a1 + 73), *((unsigned __int8 *)a1 + 74), a3, a4, a5);
  *(void *)&double result = sub_1BBB67394(v6, (uint8x16_t *)v8, 16, a2);
  return result;
}

uint64_t sub_1BBB675C4(uint8x8_t *a1, uint64_t a2, _WORD *a3)
{
  uint64_t result = sub_1BBB66C78(*(uint8x8_t **)(a2 + 56), 16, a1, *(_DWORD *)(a2 + 16));
  *a3 = result;
  return result;
}

uint64_t sub_1BBB675FC(uint8x16_t *a1, uint64_t a2, _WORD *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint8x16_t v7 = *(uint8x8_t **)(a2 + 56);
  sub_1BBB6582C(v9, a1, *(_DWORD *)(a2 + 16), *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
  uint64_t result = sub_1BBB66C78(v7, 16, (uint8x8_t *)v9, 16);
  *a3 = result;
  return result;
}

float sub_1BBB67694(unsigned int a1, uint64_t a2, uint8x16_t *a3, _WORD *a4)
{
  uint8x16_t v6 = *(uint8x16_t **)(a2 + 56);
  uint64_t v7 = *(int *)(a2 + 16);
  int16x8_t v67 = 0;
  int16x8_t v68 = 0;
  int v8 = sub_1BBB55B5C(a1, (_DWORD *)a2, &v68, &v67);
  uint64_t v9 = v68;
  if (v8)
  {
    uint64_t v10 = v67;
    uint8x16_t v11 = *v68;
    uint8x16_t v12 = *(uint8x16_t *)((char *)v68 + v7);
    uint8x8_t v13 = (uint8x16_t *)((char *)v68 + v7 + v7);
    uint8x16_t v14 = *v13;
    uint8x16_t v15 = *(uint8x16_t *)((char *)v13 + v7);
    if (v67)
    {
      uint8x16_t v16 = (uint8x16_t *)((char *)v67 + v7 + v7);
      uint8x16_t v17 = *v16;
      uint8x16_t v18 = (uint8x16_t *)((char *)v16 + v7);
      uint8x16_t v19 = *v18;
      uint64_t v10 = (uint8x16_t *)((char *)v18 + v7);
      uint8x16_t v11 = vrhaddq_u8(v11, *v67);
      uint8x16_t v12 = vrhaddq_u8(v12, *(uint8x16_t *)((char *)v67 + v7));
      uint8x16_t v14 = vrhaddq_u8(v14, v17);
      uint8x16_t v15 = vrhaddq_u8(v15, v19);
    }
    uint8x16_t v21 = *v6;
    uint8x16_t v20 = v6[1];
    uint8x16_t v23 = v6[2];
    uint8x16_t v22 = v6[3];
    if (a3)
    {
      *a3 = v11;
      a3[1] = v12;
      uint8x16_t v24 = a3 + 4;
      a3[2] = v14;
      a3[3] = v15;
    }
    else
    {
      uint8x16_t v24 = 0;
    }
    unsigned int v35 = 0;
    int16x8_t v36 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v23.i8, *(uint8x8_t *)v14.i8), *(uint8x8_t *)v21.i8, *(uint8x8_t *)v11.i8);
    int16x8_t v37 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v23, v14), v21, v11);
    int16x8_t v38 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v22.i8, *(uint8x8_t *)v15.i8), *(uint8x8_t *)v20.i8, *(uint8x8_t *)v12.i8);
    int16x8_t v39 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v22, v15), v20, v12);
    uint16x8_t v40 = v6 + 7;
    do
    {
      uint8x16_t v41 = *(uint8x16_t *)((char *)v9 + 4 * v7);
      uint8x16_t v42 = *(uint8x16_t *)((char *)v9 + 5 * v7);
      uint8x16_t v43 = *(uint8x16_t *)((char *)v9 + 6 * v7);
      uint8x16_t v44 = *(uint8x16_t *)((char *)v9 + 7 * v7);
      if (v10)
      {
        uint8x16_t v45 = *v10;
        uint8x16_t v46 = (uint8x16_t *)((char *)v10 + v7);
        uint8x16_t v47 = *v46;
        uint8x16_t v48 = (uint8x16_t *)((char *)v46 + v7);
        uint8x16_t v49 = *v48;
        uint8x16_t v50 = (uint8x16_t *)((char *)v48 + v7);
        uint8x16_t v51 = *v50;
        uint64_t v10 = (uint8x16_t *)((char *)v50 + v7);
        uint8x16_t v41 = vrhaddq_u8(v41, v45);
        uint8x16_t v42 = vrhaddq_u8(v42, v47);
        uint8x16_t v43 = vrhaddq_u8(v43, v49);
        uint8x16_t v44 = vrhaddq_u8(v44, v51);
      }
      uint8x16_t v53 = v40[-3];
      uint8x16_t v52 = v40[-2];
      uint8x16_t v55 = v40[-1];
      uint8x16_t v54 = *v40;
      if (v24)
      {
        *uint8x16_t v24 = v41;
        v24[1] = v42;
        v24[2] = v43;
        v24[3] = v44;
        v24 += 4;
      }
      uint64_t v9 = (uint8x16_t *)((char *)v9 + 2 * v7 + v7 + v7);
      int16x8_t v36 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v36, *(uint8x8_t *)v53.i8, *(uint8x8_t *)v41.i8), *(uint8x8_t *)v55.i8, *(uint8x8_t *)v43.i8);
      int16x8_t v37 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v37, v53, v41), v55, v43);
      int16x8_t v38 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v38, *(uint8x8_t *)v52.i8, *(uint8x8_t *)v42.i8), *(uint8x8_t *)v54.i8, *(uint8x8_t *)v44.i8);
      v35 += 4;
      v40 += 4;
      int16x8_t v39 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v39, v52, v42), v54, v44);
    }
    while (v35 < 0xC);
  }
  else
  {
    uint8x16_t v25 = *v6;
    uint8x16_t v26 = v6[1];
    uint8x16_t v27 = v6[2];
    uint8x16_t v28 = v6[3];
    uint8x16_t v29 = *v68;
    uint8x16_t v30 = *(uint8x16_t *)((char *)v68 + v7);
    uint8x16_t v31 = (uint8x16_t *)((char *)v68 + v7 + v7);
    uint8x16_t v32 = *v31;
    uint8x16_t v33 = *(uint8x16_t *)((char *)v31 + v7);
    if (a3)
    {
      *a3 = v29;
      a3[1] = v30;
      uint8x16_t v34 = a3 + 4;
      a3[2] = v32;
      a3[3] = v33;
    }
    else
    {
      uint8x16_t v34 = 0;
    }
    unsigned int v56 = 0;
    int16x8_t v36 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v27.i8, *(uint8x8_t *)v32.i8), *(uint8x8_t *)v25.i8, *(uint8x8_t *)v29.i8);
    int16x8_t v37 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v27, v32), v25, v29);
    int16x8_t v38 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v28.i8, *(uint8x8_t *)v33.i8), *(uint8x8_t *)v26.i8, *(uint8x8_t *)v30.i8);
    int16x8_t v39 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v28, v33), v26, v30);
    int16x8_t v57 = v6 + 7;
    do
    {
      uint8x16_t v59 = v57[-3];
      uint8x16_t v58 = v57[-2];
      uint8x16_t v61 = v57[-1];
      uint8x16_t v60 = *v57;
      uint8x16_t v62 = *(uint8x16_t *)((char *)v9 + 4 * v7);
      uint8x16_t v63 = *(uint8x16_t *)((char *)v9 + 5 * v7);
      uint8x16_t v64 = *(uint8x16_t *)((char *)v9 + 6 * v7);
      uint8x16_t v65 = *(uint8x16_t *)((char *)v9 + 7 * v7);
      if (v34)
      {
        *uint8x16_t v34 = v62;
        v34[1] = v63;
        v34[2] = v64;
        v34[3] = v65;
        v34 += 4;
      }
      uint64_t v9 = (uint8x16_t *)((char *)v9 + 2 * v7 + v7 + v7);
      int16x8_t v36 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v36, *(uint8x8_t *)v59.i8, *(uint8x8_t *)v62.i8), *(uint8x8_t *)v61.i8, *(uint8x8_t *)v64.i8);
      int16x8_t v37 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v37, v59, v62), v61, v64);
      int16x8_t v38 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v38, *(uint8x8_t *)v58.i8, *(uint8x8_t *)v63.i8), *(uint8x8_t *)v60.i8, *(uint8x8_t *)v65.i8);
      v56 += 4;
      v57 += 4;
      int16x8_t v39 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v39, v58, v63), v60, v65);
    }
    while (v56 < 0xC);
  }
  float result = COERCE_FLOAT(vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v38, v39), vaddq_s16(v37, v36))));
  *a4 = LOWORD(result);
  return result;
}

uint64_t sub_1BBB67934(unsigned int a1, uint64_t a2, int8x16_t *a3, _WORD *a4)
{
  uint64_t v7 = *(uint8x8_t **)(a2 + 56);
  int v8 = *(_DWORD *)(a2 + 16);
  uint64_t v13 = 0;
  uint8x16_t v14 = 0;
  if (sub_1BBB55B5C(a1, (_DWORD *)a2, &v14, &v13)) {
    sub_1BBB658AC(a3, (uint64_t)v14, v13, v8, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v9, v10, v11);
  }
  else {
    sub_1BBB6582C(a3, v14, v8, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v9, v10, v11);
  }
  uint64_t result = sub_1BBB66C78(v7, 16, (uint8x8_t *)a3, 16);
  *a4 = result;
  return result;
}

int16x4_t sub_1BBB679E8(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, uint8x8_t *a5, int a6, int16x4_t *a7)
{
  int8x16_t v7 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a2), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a2->i8);
  int8x16_t v8 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a3), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  int8x16_t v9 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a4), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a4->i8);
  int8x16_t v10 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a5), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a5->i8);
  uint64_t v11 = 2;
  uint64_t v12 = a6;
  do
  {
    uint8x16_t v13 = *(uint8x16_t *)a1[v11].i8;
    int8x16_t v7 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v7, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a2 + v12)), v13, *(uint8x16_t *)&a2->i8[v12]);
    int8x16_t v8 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v8, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a3 + v12)), v13, *(uint8x16_t *)&a3->i8[v12]);
    int8x16_t v9 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v9, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a4 + v12)), v13, *(uint8x16_t *)&a4->i8[v12]);
    int8x16_t v10 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v10, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a5 + v12)), v13, *(uint8x16_t *)&a5->i8[v12]);
    v11 += 2;
    v12 += a6;
  }
  while ((v11 * 8) != 256);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v9.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), vadd_s16(*(int16x4_t *)v10.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))));
  *a7 = result;
  return result;
}

int16x4_t sub_1BBB67AA0(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, int a5, int16x4_t *a6)
{
  int8x16_t v6 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a2), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a2->i8);
  int8x16_t v7 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a3), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  int8x16_t v8 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a4), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a4->i8);
  uint64_t v9 = 2;
  uint64_t v10 = a5;
  do
  {
    uint8x16_t v11 = *(uint8x16_t *)a1[v9].i8;
    int8x16_t v6 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v6, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a2 + v10)), v11, *(uint8x16_t *)&a2->i8[v10]);
    int8x16_t v7 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v7, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a3 + v10)), v11, *(uint8x16_t *)&a3->i8[v10]);
    int8x16_t v8 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v8, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a4 + v10)), v11, *(uint8x16_t *)&a4->i8[v10]);
    v9 += 2;
    v10 += a5;
  }
  while ((v9 * 8) != 256);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)), vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0));
  *a6 = result;
  return result;
}

int16x4_t sub_1BBB67B3C(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, uint8x8_t *a5, int a6, int16x4_t *a7)
{
  int8x16_t v7 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a2), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a2->i8);
  int8x16_t v8 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a3), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  int8x16_t v9 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a4), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a4->i8);
  int8x16_t v10 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a5), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a5->i8);
  uint64_t v11 = 2;
  uint64_t v12 = a6;
  do
  {
    uint8x16_t v13 = *(uint8x16_t *)a1[v11].i8;
    int8x16_t v7 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v7, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a2 + v12)), v13, *(uint8x16_t *)&a2->i8[v12]);
    int8x16_t v8 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v8, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a3 + v12)), v13, *(uint8x16_t *)&a3->i8[v12]);
    int8x16_t v9 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v9, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a4 + v12)), v13, *(uint8x16_t *)&a4->i8[v12]);
    int8x16_t v10 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v10, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a5 + v12)), v13, *(uint8x16_t *)&a5->i8[v12]);
    v11 += 2;
    v12 += a6;
  }
  while ((v11 * 8) != 128);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v9.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), vadd_s16(*(int16x4_t *)v10.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))));
  *a7 = result;
  return result;
}

int16x4_t sub_1BBB67BF4(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, int a5, int16x4_t *a6)
{
  int8x16_t v6 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a2), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a2->i8);
  int8x16_t v7 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a3), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  int8x16_t v8 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a4), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a4->i8);
  uint64_t v9 = 2;
  uint64_t v10 = a5;
  do
  {
    uint8x16_t v11 = *(uint8x16_t *)a1[v9].i8;
    int8x16_t v6 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v6, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a2 + v10)), v11, *(uint8x16_t *)&a2->i8[v10]);
    int8x16_t v7 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v7, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a3 + v10)), v11, *(uint8x16_t *)&a3->i8[v10]);
    int8x16_t v8 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v8, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a4 + v10)), v11, *(uint8x16_t *)&a4->i8[v10]);
    v9 += 2;
    v10 += a5;
  }
  while ((v9 * 8) != 128);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)), vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0));
  *a6 = result;
  return result;
}

int16x4_t sub_1BBB67C90(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, uint8x8_t *a5, int a6, int16x4_t *a7)
{
  int8x16_t v7 = (int8x16_t)vabdl_u8(*a1, *a2);
  int8x16_t v8 = (int8x16_t)vabdl_u8(*a1, *a3);
  int8x16_t v9 = (int8x16_t)vabdl_u8(*a1, *a4);
  int8x16_t v10 = (int8x16_t)vabdl_u8(*a1, *a5);
  uint64_t v11 = 2;
  uint64_t v12 = a6;
  do
  {
    uint8x8_t v13 = a1[v11];
    int8x16_t v7 = (int8x16_t)vabal_u8((uint16x8_t)v7, v13, *(uint8x8_t *)((char *)a2 + v12));
    int8x16_t v8 = (int8x16_t)vabal_u8((uint16x8_t)v8, v13, *(uint8x8_t *)((char *)a3 + v12));
    int8x16_t v9 = (int8x16_t)vabal_u8((uint16x8_t)v9, v13, *(uint8x8_t *)((char *)a4 + v12));
    int8x16_t v10 = (int8x16_t)vabal_u8((uint16x8_t)v10, v13, *(uint8x8_t *)((char *)a5 + v12));
    v11 += 2;
    v12 += a6;
  }
  while ((v11 * 8) != 256);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v9.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), vadd_s16(*(int16x4_t *)v10.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))));
  *a7 = result;
  return result;
}

int16x4_t sub_1BBB67D28(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, int a5, int16x4_t *a6)
{
  int8x16_t v6 = (int8x16_t)vabdl_u8(*a1, *a2);
  int8x16_t v7 = (int8x16_t)vabdl_u8(*a1, *a3);
  int8x16_t v8 = (int8x16_t)vabdl_u8(*a1, *a4);
  uint64_t v9 = 2;
  uint64_t v10 = a5;
  do
  {
    uint8x8_t v11 = a1[v9];
    int8x16_t v6 = (int8x16_t)vabal_u8((uint16x8_t)v6, v11, *(uint8x8_t *)((char *)a2 + v10));
    int8x16_t v7 = (int8x16_t)vabal_u8((uint16x8_t)v7, v11, *(uint8x8_t *)((char *)a3 + v10));
    int8x16_t v8 = (int8x16_t)vabal_u8((uint16x8_t)v8, v11, *(uint8x8_t *)((char *)a4 + v10));
    v9 += 2;
    v10 += a5;
  }
  while ((v9 * 8) != 256);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)), vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0));
  *a6 = result;
  return result;
}

int16x4_t sub_1BBB67DAC(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, uint8x8_t *a5, int a6, int16x4_t *a7)
{
  int8x16_t v7 = (int8x16_t)vabdl_u8(*a1, *a2);
  int8x16_t v8 = (int8x16_t)vabdl_u8(*a1, *a3);
  int8x16_t v9 = (int8x16_t)vabdl_u8(*a1, *a4);
  int8x16_t v10 = (int8x16_t)vabdl_u8(*a1, *a5);
  uint64_t v11 = 2;
  uint64_t v12 = a6;
  do
  {
    uint8x8_t v13 = a1[v11];
    int8x16_t v7 = (int8x16_t)vabal_u8((uint16x8_t)v7, v13, *(uint8x8_t *)((char *)a2 + v12));
    int8x16_t v8 = (int8x16_t)vabal_u8((uint16x8_t)v8, v13, *(uint8x8_t *)((char *)a3 + v12));
    int8x16_t v9 = (int8x16_t)vabal_u8((uint16x8_t)v9, v13, *(uint8x8_t *)((char *)a4 + v12));
    int8x16_t v10 = (int8x16_t)vabal_u8((uint16x8_t)v10, v13, *(uint8x8_t *)((char *)a5 + v12));
    v11 += 2;
    v12 += a6;
  }
  while ((v11 * 8) != 128);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v9.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), vadd_s16(*(int16x4_t *)v10.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))));
  *a7 = result;
  return result;
}

int16x4_t sub_1BBB67E44(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, int a5, int16x4_t *a6)
{
  int8x16_t v6 = (int8x16_t)vabdl_u8(*a1, *a2);
  int8x16_t v7 = (int8x16_t)vabdl_u8(*a1, *a3);
  int8x16_t v8 = (int8x16_t)vabdl_u8(*a1, *a4);
  uint64_t v9 = 2;
  uint64_t v10 = a5;
  do
  {
    uint8x8_t v11 = a1[v9];
    int8x16_t v6 = (int8x16_t)vabal_u8((uint16x8_t)v6, v11, *(uint8x8_t *)((char *)a2 + v10));
    int8x16_t v7 = (int8x16_t)vabal_u8((uint16x8_t)v7, v11, *(uint8x8_t *)((char *)a3 + v10));
    int8x16_t v8 = (int8x16_t)vabal_u8((uint16x8_t)v8, v11, *(uint8x8_t *)((char *)a4 + v10));
    v9 += 2;
    v10 += a5;
  }
  while ((v9 * 8) != 128);
  int16x4_t result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)), vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0));
  *a6 = result;
  return result;
}

uint32x2_t sub_1BBB67EC8(uint8x8_t *a1, int a2)
{
  int16x4_t v2 = 0;
  char v3 = 1;
  int8x16_t v4 = 0uLL;
  do
  {
    uint8x16_t v5 = *(uint8x16_t *)&a1->i8[a2];
    int8x16_t v6 = (uint8x16_t *)((char *)a1 + a2 + a2);
    uint8x16_t v7 = *v6;
    int8x16_t v8 = (uint8x8_t *)&v6->i8[a2];
    uint64_t v9 = (uint8x16_t *)((char *)v8 + a2);
    uint8x16_t v10 = *v9;
    uint8x8_t v11 = (uint8x16_t *)((char *)v9 + a2);
    uint8x16_t v12 = *v11;
    uint8x8_t v13 = (uint8x16_t *)((char *)v11 + a2);
    uint8x16_t v14 = *v13;
    uint8x16_t v15 = (uint8x8_t *)&v13->i8[a2];
    uint8x16_t v16 = *(uint8x16_t *)v8->i8;
    int16x8_t v17 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(*(uint8x8_t *)v5.i8, *a1), *(uint8x8_t *)v7.i8), *v8);
    int16x8_t v18 = (int16x8_t)vaddw_high_u8(vaddw_high_u8(vaddl_high_u8(v5, *(uint8x16_t *)a1->i8), v7), *(uint8x16_t *)v8->i8);
    int16x8_t v19 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(*(uint8x8_t *)v12.i8, *(uint8x8_t *)v10.i8), *(uint8x8_t *)v14.i8), *v15);
    int16x8_t v20 = (int16x8_t)vaddw_high_u8(vaddw_high_u8(vaddl_high_u8(v12, v10), v14), *(uint8x16_t *)v15->i8);
    LOBYTE(v8) = v3;
    *(int16x4_t *)v17.i8 = vpadd_s16((int16x4_t)*(_OWORD *)&vpaddq_s16(v17, v17), (int16x4_t)*(_OWORD *)&vpaddq_s16(v18, v18));
    v17.u64[1] = (unint64_t)vpadd_s16((int16x4_t)*(_OWORD *)&vpaddq_s16(v19, v19), (int16x4_t)*(_OWORD *)&vpaddq_s16(v20, v20));
    *(int8x8_t *)v17.i8 = vrshrn_n_s16(v17, 4uLL);
    int16x4_t v2 = (int16x4_t)vpadal_u8((uint16x4_t)v2, *(uint8x8_t *)v17.i8);
    *(int8x8_t *)v18.i8 = vtrn1_s8(*(int8x8_t *)v17.i8, *(int8x8_t *)v17.i8);
    *(int8x8_t *)v17.i8 = vtrn2_s8(*(int8x8_t *)v17.i8, *(int8x8_t *)v17.i8);
    *(int32x2_t *)v19.i8 = vzip1_s32(*(int32x2_t *)v18.i8, *(int32x2_t *)v17.i8);
    *(int16x4_t *)v20.i8 = vtrn1_s16(*(int16x4_t *)v19.i8, *(int16x4_t *)v19.i8);
    *(int32x2_t *)v17.i8 = vzip2_s32(*(int32x2_t *)v18.i8, *(int32x2_t *)v17.i8);
    *(int16x4_t *)v18.i8 = vtrn1_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v17.i8);
    v20.u64[1] = (unint64_t)vtrn2_s16(*(int16x4_t *)v19.i8, *(int16x4_t *)v19.i8);
    v18.u64[1] = (unint64_t)vtrn2_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v17.i8);
    int8x16_t v4 = (int8x16_t)vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8((uint16x8_t)v4, vabdq_u8(*(uint8x16_t *)a1->i8, (uint8x16_t)v20)), vabdq_u8(v5, (uint8x16_t)v20)), vabdq_u8(v7, (uint8x16_t)v20)), vabdq_u8(v16, (uint8x16_t)v20)), vabdq_u8(v10, (uint8x16_t)v18)), vabdq_u8(v12, (uint8x16_t)v18)), vabdq_u8(v14, (uint8x16_t)v18)), vabdq_u8(*(uint8x16_t *)v15->i8, (uint8x16_t)v18));
    a1 = (uint8x8_t *)((char *)v15 + a2);
    char v3 = 0;
  }
  while ((v8 & 1) != 0);
  return vpaddl_u16((uint16x4_t)vpadd_s16(vadd_s16(*(int16x4_t *)v4.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)), v2));
}

uint8x8_t *sub_1BBB67FF8(uint8x8_t *result, int a2, _WORD *a3, uint32x2_t *a4)
{
  char v4 = 1;
  do
  {
    uint8x16_t v5 = *(uint8x16_t *)&result->i8[a2];
    int8x16_t v6 = (uint8x16_t *)((char *)result + a2 + a2);
    uint8x16_t v7 = *v6;
    int8x16_t v8 = (uint8x16_t *)((char *)v6 + a2);
    uint8x16_t v9 = *v8;
    uint8x16_t v10 = (uint8x16_t *)((char *)v8 + a2);
    uint8x16_t v11 = *v10;
    uint8x16_t v12 = (uint8x16_t *)((char *)v10 + a2);
    uint8x16_t v13 = *v12;
    uint8x16_t v14 = (uint8x16_t *)((char *)v12 + a2);
    uint8x16_t v15 = *v14;
    uint8x16_t v16 = (uint8x8_t *)&v14->i8[a2];
    int16x8_t v17 = (int16x8_t)vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddl_u8(*(uint8x8_t *)v5.i8, *result), *(uint8x8_t *)v7.i8), *(uint8x8_t *)v9.i8), *(uint8x8_t *)v11.i8), *(uint8x8_t *)v13.i8), *(uint8x8_t *)v15.i8), *v16);
    int16x8_t v18 = (int16x8_t)vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddl_high_u8(v5, *(uint8x16_t *)result->i8), v7), v9), v11), v13), v15), *(uint8x16_t *)v16->i8);
    *(int16x4_t *)v17.i8 = vpadd_s16((int16x4_t)*(_OWORD *)&vpaddq_s16(v17, v17), (int16x4_t)*(_OWORD *)&vpaddq_s16(v18, v18));
    *(int16x4_t *)v17.i8 = vpadd_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v17.i8);
    v17.i64[1] = v17.i64[0];
    *(int8x8_t *)v17.i8 = vrshrn_n_s16(v17, 6uLL);
    *(int8x8_t *)v19.i8 = vdup_lane_s8(*(int8x8_t *)v17.i8, 0);
    v19.u64[1] = (unint64_t)vdup_lane_s8(*(int8x8_t *)v17.i8, 1);
    char v20 = v4;
    uint8x16_t v21 = vabdq_u8(*(uint8x16_t *)result->i8, v19);
    uint8x16_t v22 = vabdq_u8(v5, v19);
    uint8x16_t v23 = vabdq_u8(v7, v19);
    uint8x16_t v24 = vabdq_u8(v9, v19);
    uint8x16_t v25 = vabdq_u8(v11, v19);
    uint8x16_t v26 = vabdq_u8(v13, v19);
    uint8x16_t v27 = vabdq_u8(v15, v19);
    uint8x16_t v28 = vabdq_u8(*(uint8x16_t *)v16->i8, v19);
    int8x16_t v29 = (int8x16_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_u8(*(uint8x8_t *)v22.i8, *(uint8x8_t *)v22.i8)), vmull_u8(*(uint8x8_t *)v21.i8, *(uint8x8_t *)v21.i8)), vmull_u8(*(uint8x8_t *)v23.i8, *(uint8x8_t *)v23.i8)), vmull_u8(*(uint8x8_t *)v24.i8, *(uint8x8_t *)v24.i8)), vmull_u8(*(uint8x8_t *)v25.i8, *(uint8x8_t *)v25.i8)), vmull_u8(*(uint8x8_t *)v26.i8, *(uint8x8_t *)v26.i8)), vmull_u8(*(uint8x8_t *)v27.i8, *(uint8x8_t *)v27.i8)), vmull_u8(*(uint8x8_t *)v28.i8, *(uint8x8_t *)v28.i8));
    int8x16_t v30 = (int8x16_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_high_u8(v22, v22)), vmull_high_u8(v21, v21)), vmull_high_u8(v23, v23)), vmull_high_u8(v24, v24)), vmull_high_u8(v25, v25)), vmull_high_u8(v26, v26)), vmull_high_u8(v27, v27)), vmull_high_u8(v28, v28));
    *a3++ = v17.i16[0];
    *a4++ = vrshr_n_u32((uint32x2_t)vpadd_s32(vadd_s32(*(int32x2_t *)v29.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL)), vadd_s32(*(int32x2_t *)v30.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v30, v30, 8uLL))), 6uLL);
    int16x4_t result = (uint8x8_t *)((char *)v16 + a2);
    char v4 = 0;
  }
  while ((v20 & 1) != 0);
  return result;
}

__n128 sub_1BBB6816C(uint64_t a1, _OWORD *a2, int a3, uint64_t a4, _OWORD *a5, int a6)
{
  int8x16_t v6 = (_OWORD *)((char *)a2 + a3);
  long long v7 = *v6;
  int8x16_t v8 = (long long *)((char *)v6 + a3);
  long long v9 = *v8;
  uint8x16_t v10 = (long long *)((char *)v8 + a3);
  long long v11 = *v10;
  uint8x16_t v12 = (long long *)((char *)v10 + a3);
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = v9;
  *(_OWORD *)(a1 + 48) = v11;
  long long v13 = *v12;
  uint8x16_t v14 = (long long *)((char *)v12 + a3);
  long long v15 = *v14;
  uint8x16_t v16 = (long long *)((char *)v14 + a3);
  long long v17 = *v16;
  int16x8_t v18 = (long long *)((char *)v16 + a3);
  long long v19 = *v18;
  char v20 = (long long *)((char *)v18 + a3);
  *(_OWORD *)(a1 + 64) = v13;
  *(_OWORD *)(a1 + 80) = v15;
  *(_OWORD *)(a1 + 96) = v17;
  *(_OWORD *)(a1 + 112) = v19;
  long long v21 = *v20;
  uint8x16_t v22 = (long long *)((char *)v20 + a3);
  long long v23 = *v22;
  uint8x16_t v24 = (long long *)((char *)v22 + a3);
  long long v25 = *v24;
  uint8x16_t v26 = (long long *)((char *)v24 + a3);
  long long v27 = *v26;
  uint8x16_t v28 = (__n128 *)((char *)v26 + a3);
  *(_OWORD *)(a1 + 128) = v21;
  *(_OWORD *)(a1 + 144) = v23;
  *(_OWORD *)(a1 + 160) = v25;
  *(_OWORD *)(a1 + 176) = v27;
  __n128 result = *v28;
  int8x16_t v30 = (long long *)((char *)v28 + a3);
  long long v31 = *v30;
  uint8x16_t v32 = (long long *)((char *)v30 + a3);
  long long v33 = *v32;
  long long v34 = *(long long *)((char *)v32 + a3);
  *(__n128 *)(a1 + 192) = result;
  *(_OWORD *)(a1 + 208) = v31;
  *(_OWORD *)(a1 + 224) = v33;
  *(_OWORD *)(a1 + 240) = v34;
  if (a4)
  {
    unsigned int v35 = (_OWORD *)((char *)a5 + a6);
    long long v36 = *v35;
    int16x8_t v37 = (long long *)((char *)v35 + a6);
    long long v38 = *v37;
    int16x8_t v39 = (long long *)((char *)v37 + a6);
    long long v40 = *v39;
    uint8x16_t v41 = (__n128 *)((char *)v39 + a6);
    *(_OWORD *)a4 = *a5;
    *(_OWORD *)(a4 + 16) = v36;
    *(_OWORD *)(a4 + 32) = v38;
    *(_OWORD *)(a4 + 48) = v40;
    __n128 result = *v41;
    uint8x16_t v42 = (long long *)((char *)v41 + a6);
    long long v43 = *v42;
    uint8x16_t v44 = (long long *)((char *)v42 + a6);
    long long v45 = *v44;
    long long v46 = *(long long *)((char *)v44 + a6);
    *(__n128 *)(a4 + 64) = result;
    *(_OWORD *)(a4 + 80) = v43;
    *(_OWORD *)(a4 + 96) = v45;
    *(_OWORD *)(a4 + 112) = v46;
  }
  return result;
}

uint16x8_t sub_1BBB68254(uint8x16_t *a1, unsigned int a2, uint8x16_t *a3, unsigned int a4, uint16x8_t *a5, int a6)
{
  int v6 = a6 + 2;
  do
  {
    uint8x16_t v7 = *a1;
    uint8x16_t v8 = *a3;
    uint8x16_t v9 = *(uint8x16_t *)((char *)a1 + a2);
    a1 = (uint8x16_t *)((char *)a1 + a2 + (unint64_t)a2);
    uint8x16_t v10 = *(uint8x16_t *)((char *)a3 + a4);
    a3 = (uint8x16_t *)((char *)a3 + a4 + (unint64_t)a4);
    uint16x8_t v11 = vsubl_u8(*(uint8x8_t *)v7.i8, *(uint8x8_t *)v8.i8);
    uint16x8_t result = vsubl_high_u8(v7, v8);
    *a5 = v11;
    a5[1] = result;
    a5[2] = vsubl_u8(*(uint8x8_t *)v9.i8, *(uint8x8_t *)v10.i8);
    a5[3] = vsubl_high_u8(v9, v10);
    v6 -= 2;
    a5 += 4;
  }
  while (v6 > 2);
  return result;
}

uint16x8_t sub_1BBB682AC(uint8x8_t *a1, unsigned int a2, uint8x8_t *a3, unsigned int a4, uint16x8_t *a5, int a6)
{
  int v6 = a6 + 2;
  do
  {
    uint8x8_t v7 = *a1;
    uint8x8_t v8 = *a3;
    uint8x8_t v9 = *(uint8x8_t *)((char *)a1 + a2);
    a1 = (uint8x8_t *)((char *)a1 + a2 + (unint64_t)a2);
    uint8x8_t v10 = *(uint8x8_t *)((char *)a3 + a4);
    a3 = (uint8x8_t *)((char *)a3 + a4 + (unint64_t)a4);
    uint16x8_t result = vsubl_u8(v7, v8);
    *a5 = result;
    a5[1] = vsubl_u8(v9, v10);
    a5 += 2;
    v6 -= 2;
  }
  while (v6 > 2);
  return result;
}

uint8x16_t sub_1BBB682F4(uint8x8_t *a1, int a2, uint16x8_t *a3, int a4)
{
  int v4 = a4 + 2;
  do
  {
    uint8x16_t v5 = (uint8x16_t *)((char *)a1 + a2);
    uint8x16_t v6 = *v5;
    uint16x8_t v7 = a3[2];
    uint16x8_t v8 = a3[3];
    *(int8x16_t *)a1->i8 = vqmovun_high_s16(vqmovun_s16((int16x8_t)vaddw_u8(*a3, *a1)), (int16x8_t)vaddw_high_u8(a3[1], *(uint8x16_t *)a1->i8));
    a1 = (uint8x8_t *)&v5->i8[a2];
    uint8x16_t result = (uint8x16_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vaddw_u8(v7, *(uint8x8_t *)v6.i8)), (int16x8_t)vaddw_high_u8(v8, v6));
    uint8x16_t *v5 = result;
    v4 -= 2;
    a3 += 4;
  }
  while (v4 > 2);
  return result;
}

int8x16_t *sub_1BBB68350(int8x16_t *result, int a2, uint8x16_t *a3, uint16x8_t *a4, int a5)
{
  int v5 = a5 + 2;
  do
  {
    uint8x16_t v6 = *a3;
    uint8x16_t v7 = a3[1];
    a3 += 2;
    int8x16_t v8 = vqmovun_high_s16(vqmovun_s16((int16x8_t)vaddw_u8(a4[2], *(uint8x8_t *)v7.i8)), (int16x8_t)vaddw_high_u8(a4[3], v7));
    *uint8x16_t result = vqmovun_high_s16(vqmovun_s16((int16x8_t)vaddw_u8(*a4, *(uint8x8_t *)v6.i8)), (int16x8_t)vaddw_high_u8(a4[1], v6));
    *(int8x16_t *)((char *)result + a2) = v8;
    uint8x16_t result = (int8x16_t *)((char *)result + a2 + (uint64_t)a2);
    v5 -= 2;
    a4 += 4;
  }
  while (v5 > 2);
  return result;
}

int8x8_t sub_1BBB683A8(_DWORD *a1, int a2, uint8x8_t *a3, uint16x8_t *a4)
{
  int8x8_t v4 = vqmovun_s16((int16x8_t)vaddw_u8(*a4, *a3));
  int8x8_t result = vqmovun_s16((int16x8_t)vaddw_high_u8(a4[1], *(uint8x16_t *)a3->i8));
  *a1 = v4.i32[0];
  *(_DWORD *)((char *)a1 + a2) = v4.i32[1];
  *(_DWORD *)((char *)a1 + 2 * a2) = result.i32[0];
  *(_DWORD *)((char *)a1 + 3 * a2) = result.i32[1];
  return result;
}

int8x8_t sub_1BBB683E4(int8x8_t *a1, int a2, uint8x16_t *a3, uint16x8_t *a4)
{
  uint8x16_t v4 = a3[1];
  uint8x16_t v5 = a3[2];
  uint8x16_t v6 = a3[3];
  uint16x8_t v7 = a4[2];
  uint16x8_t v8 = a4[3];
  uint16x8_t v9 = a4[4];
  uint16x8_t v10 = a4[5];
  uint16x8_t v11 = a4[6];
  uint16x8_t v12 = a4[7];
  int8x8_t v13 = vqmovun_s16((int16x8_t)vaddw_high_u8(a4[1], *a3));
  *a1 = vqmovun_s16((int16x8_t)vaddw_u8(*a4, *(uint8x8_t *)a3->i8));
  *(int8x8_t *)((char *)a1 + a2) = v13;
  *(int8x8_t *)((char *)a1 + 2 * a2) = vqmovun_s16((int16x8_t)vaddw_u8(v7, *(uint8x8_t *)v4.i8));
  int8x8_t result = vqmovun_s16((int16x8_t)vaddw_high_u8(v12, v6));
  *(int8x8_t *)((char *)a1 + 3 * a2) = vqmovun_s16((int16x8_t)vaddw_high_u8(v8, v4));
  *(int8x8_t *)((char *)a1 + 4 * a2) = vqmovun_s16((int16x8_t)vaddw_u8(v9, *(uint8x8_t *)v5.i8));
  *(int8x8_t *)((char *)a1 + 5 * a2) = vqmovun_s16((int16x8_t)vaddw_high_u8(v10, v5));
  *(int8x8_t *)((char *)a1 + 6 * a2) = vqmovun_s16((int16x8_t)vaddw_u8(v11, *(uint8x8_t *)v6.i8));
  *(int8x8_t *)((char *)&a1[a2] - a2) = result;
  return result;
}

uint64_t sub_1BBB6847C(uint64_t result, uint64_t a2, int a3, int a4, int a5, int64x2_t *a6)
{
  int64x2_t v6 = 0uLL;
  int64x2_t v7 = 0uLL;
  uint64_t v8 = 0;
  do
  {
    uint64_t v9 = 0;
    int v10 = a4 + 16;
    int8x16_t v11 = 0uLL;
    int8x16_t v12 = 0uLL;
    int8x16_t v13 = 0uLL;
    int8x16_t v14 = 0uLL;
    int8x16_t v15 = 0uLL;
    do
    {
      _X12 = result + v9;
      _X13 = a2 + v9;
      __asm
      {
        PRFM            #0, [X12,#0x40]
        PRFM            #0, [X13,#0x40]
      }
      uint8x16_t v24 = *(uint8x16_t *)(result + v9);
      uint8x16_t v25 = *(uint8x16_t *)(a2 + v9);
      int8x16_t v12 = (int8x16_t)vpadalq_u16((uint32x4_t)v12, vaddw_high_u8(vmovl_u8(*(uint8x8_t *)v24.i8), v24));
      int8x16_t v11 = (int8x16_t)vpadalq_u16((uint32x4_t)v11, vaddw_high_u8(vmovl_u8(*(uint8x8_t *)v25.i8), v25));
      int8x16_t v15 = (int8x16_t)vpadalq_u16(vpadalq_u16((uint32x4_t)v15, vmull_high_u8(v24, v25)), vmull_u8(*(uint8x8_t *)v24.i8, *(uint8x8_t *)v25.i8));
      int8x16_t v14 = (int8x16_t)vpadalq_u16(vpadalq_u16((uint32x4_t)v14, vmull_high_u8(v24, v24)), vmull_u8(*(uint8x8_t *)v24.i8, *(uint8x8_t *)v24.i8));
      int8x16_t v13 = (int8x16_t)vpadalq_u16(vpadalq_u16((uint32x4_t)v13, vmull_high_u8(v25, v25)), vmull_u8(*(uint8x8_t *)v25.i8, *(uint8x8_t *)v25.i8));
      v9 += 16;
      v10 -= 16;
    }
    while (v10 > 16);
    *(int32x2_t *)v26.i8 = vadd_s32(*(int32x2_t *)v11.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
    *(int32x2_t *)v27.i8 = vadd_s32(*(int32x2_t *)v13.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL));
    v26.u64[1] = (unint64_t)vadd_s32(*(int32x2_t *)v12.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL));
    v27.u64[1] = (unint64_t)vadd_s32(*(int32x2_t *)v14.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL));
    int64x2_t v6 = vpadalq_s32(v6, v26);
    int64x2_t v7 = vpadalq_s32(v7, v27);
    uint64_t v8 = vpadal_s32(v8, vadd_s32(*(int32x2_t *)v15.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL)));
    result += a3;
    a2 += a3;
    _VF = __OFSUB__(a5--, 1);
  }
  while (!((a5 < 0) ^ _VF | (a5 == 0)));
  *a6 = v6;
  a6[1] = v7;
  a6[2].i64[0] = v8;
  return result;
}

uint64_t sub_1BBB68574(int16x8_t *a1, int16x8_t *a2)
{
  int16x8_t v2 = vsubq_s16(*a1, *a2);
  int16x8_t v3 = vsubq_s16(a1[1], a2[1]);
  return vaddvq_s32(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)v2.i8, *(int16x4_t *)v2.i8), v2, v2), *(int16x4_t *)v3.i8, *(int16x4_t *)v3.i8), v3, v3));
}

uint64_t sub_1BBB685A0(uint64_t result, int a2, _OWORD *a3)
{
  long long v3 = *(_OWORD *)(result - a2);
  unsigned int v4 = -4;
  do
  {
    *a3 = v3;
    a3[1] = v3;
    a3[2] = v3;
    a3[3] = v3;
    a3 += 4;
    v4 += 4;
  }
  while (v4 < 0xC);
  return result;
}

int8x16_t sub_1BBB685C8(uint64_t a1, int a2, int8x16_t *a3)
{
  long long v3 = (const char *)(a1 - 1);
  unsigned int v4 = -4;
  do
  {
    int8x16_t v6 = vld1q_dup_s8(v3);
    uint8x16_t v5 = &v3[a2];
    *a3 = v6;
    int8x16_t v8 = vld1q_dup_s8(v5);
    int64x2_t v7 = &v5[a2];
    a3[1] = v8;
    int8x16_t v10 = vld1q_dup_s8(v7);
    uint64_t v9 = &v7[a2];
    a3[2] = v10;
    int8x16_t result = vld1q_dup_s8(v9);
    long long v3 = &v9[a2];
    a3[3] = result;
    a3 += 4;
    v4 += 4;
  }
  while (v4 < 0xC);
  return result;
}

__int8 *sub_1BBB68608(__int8 *result, int a2, int8x16_t *a3, char a4)
{
  int v4 = a4 & 3;
  if (v4 == 3)
  {
    uint64_t v19 = 3 * a2;
    uint64_t v20 = 5 * a2;
    uint64_t v21 = 7 * a2;
    v22.i8[0] = result[v21 - 1];
    v22.i8[1] = result[6 * a2 - 1];
    v22.i8[2] = result[v20 - 1];
    v22.i8[3] = result[4 * a2 - 1];
    v22.i8[4] = result[v19 - 1];
    v22.i8[5] = result[2 * a2 - 1];
    v22.i8[6] = result[a2 - 1];
    v22.i8[7] = *(result - 1);
    long long v23 = &result[8 * a2 - 1];
    v24.i8[0] = v23[v21];
    v24.i8[1] = v23[6 * a2];
    v24.i8[2] = v23[v20];
    v24.i8[3] = v23[4 * a2];
    v24.i8[4] = v23[v19];
    v24.i8[5] = v23[2 * a2];
    v24.i8[6] = v23[a2];
    v24.i8[7] = *v23;
    int16x8_t v25 = (int16x8_t)vaddw_u8(vaddw_u8(vaddw_high_u8(vmovl_u8(v22), *(uint8x16_t *)&result[-a2]), *(uint8x8_t *)&result[-a2]), v24);
    v25.i16[0] = vaddvq_s16(v25);
    int16x8_t v26 = vdupq_lane_s16(*(int16x4_t *)v25.i8, 0);
    int8x16_t v5 = vrshrn_high_n_s16(vrshrn_n_s16(v26, 5uLL), v26, 5uLL);
  }
  else
  {
    if (v4 == 2)
    {
      uint8x16_t v18 = *(uint8x16_t *)&result[-a2];
      goto LABEL_7;
    }
    v5.i64[0] = 0x8080808080808080;
    v5.i64[1] = 0x8080808080808080;
    if (v4 == 1)
    {
      __int8 v7 = *(result - 1);
      int8x16_t v6 = result - 1;
      int8x16_t v8 = &v6[a2];
      uint64_t v9 = &v6[2 * a2];
      uint64_t v10 = 3 * a2;
      int8x16_t v11 = &v6[v10];
      int8x16_t v12 = &v6[4 * a2];
      uint64_t v13 = 5 * a2;
      int8x16_t v14 = &v6[v13];
      int8x16_t v15 = &v6[6 * a2];
      uint64_t v16 = 7 * a2;
      long long v17 = &v6[v16];
      int8x16_t result = &v6[8 * a2];
      v18.i8[0] = result[v16];
      v18.i8[1] = result[6 * a2];
      v18.i8[2] = result[v13];
      v18.i8[3] = result[4 * a2];
      v18.i8[4] = result[v10];
      v18.i8[5] = result[2 * a2];
      v18.i8[6] = result[a2];
      v18.i8[7] = *result;
      v18.i8[8] = *v17;
      v18.i8[9] = *v15;
      v18.i8[10] = *v14;
      v18.i8[11] = *v12;
      v18.i8[12] = *v11;
      v18.i8[13] = *v9;
      v18.i8[14] = *v8;
      v18.i8[15] = v7;
LABEL_7:
      v18.i16[0] = vaddlvq_u8(v18);
      int16x8_t v27 = vdupq_n_s16(v18.u32[0]);
      int8x16_t v5 = vrshrn_high_n_s16(vrshrn_n_s16(v27, 4uLL), v27, 4uLL);
    }
  }
  unsigned int v28 = -4;
  do
  {
    *a3 = v5;
    a3[1] = v5;
    a3[2] = v5;
    a3[3] = v5;
    a3 += 4;
    v28 += 4;
  }
  while (v28 < 0xC);
  return result;
}

uint64_t sub_1BBB687B8(uint64_t a1, int a2, int8x16_t *a3)
{
  __int8 v4 = *(unsigned char *)(a1 - 1);
  uint64_t result = a1 - 1;
  int8x16_t v5 = (unsigned __int8 *)(result - a2);
  int8x16_t v6 = *(int8x16_t *)(v5 + 1);
  v7.i8[0] = v5[8 * a2 - a2];
  v7.i8[1] = v5[6 * a2];
  v7.i8[2] = v5[5 * a2];
  v7.i8[3] = v5[4 * a2];
  v7.i8[4] = v5[3 * a2];
  v7.i8[5] = v5[2 * a2];
  v7.i8[6] = v4;
  v7.i8[7] = *v5;
  int16x8_t v8 = (int16x8_t)vmlsl_u8(vmull_u8((uint8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL), (uint8x8_t)0x807060504030201), (uint8x8_t)vrev64_s8(vext_s8(vdup_n_s8(*v5), *(int8x8_t *)v6.i8, 7uLL)), (uint8x8_t)0x807060504030201);
  v9.i8[0] = v5[9 * a2];
  v9.i8[1] = v5[10 * a2];
  v9.i8[2] = v5[11 * a2];
  v9.i8[3] = v5[12 * a2];
  v9.i8[4] = v5[13 * a2];
  v9.i8[5] = v5[14 * a2];
  v9.i8[6] = v5[15 * a2];
  v9.i8[7] = v5[16 * a2];
  int8x16_t v10 = (int8x16_t)vmovl_high_u8((uint8x16_t)v6);
  int8x16_t v11 = (int8x16_t)vmovl_u8(v9);
  int8x16_t v12 = (int8x16_t)vmlsl_u8(vmull_u8(v9, (uint8x8_t)0x807060504030201), v7, (uint8x8_t)0x807060504030201);
  int16x8_t v13 = vdupq_lane_s16(vshl_n_s16(vadd_s16((int16x4_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL), (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL)), 4uLL), 3);
  *(int16x4_t *)v10.i8 = vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v8, (int8x16_t)v8, 8uLL)), vadd_s16(*(int16x4_t *)v12.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)));
  *(int16x4_t *)v10.i8 = vpadd_s16(*(int16x4_t *)v10.i8, *(int16x4_t *)v10.i8);
  *(int16x4_t *)v12.i8 = vrshr_n_s16(vsra_n_s16(*(int16x4_t *)v10.i8, *(int16x4_t *)v10.i8, 2uLL), 4uLL);
  int16x8_t v14 = vdupq_lane_s16(*(int16x4_t *)v12.i8, 1);
  v8.i64[0] = 0x6000600060006;
  v8.i64[1] = 0x6000600060006;
  int16x8_t v15 = vmlaq_lane_s16(v13, v8, *(int16x4_t *)v12.i8, 1);
  int16x8_t v16 = vmlaq_lane_s16(v15, (int16x8_t)xmmword_1BBB70150, *(int16x4_t *)v12.i8, 0);
  int16x8_t v17 = vmlaq_lane_s16(v15, (int16x8_t)xmmword_1BBB6F780, *(int16x4_t *)v12.i8, 0);
  unsigned int v18 = -2;
  do
  {
    int16x8_t v19 = vaddq_s16(v16, v14);
    int16x8_t v20 = vaddq_s16(v17, v14);
    int8x8_t v21 = vqrshrun_n_s16(v16, 5uLL);
    int16x8_t v16 = vaddq_s16(v19, v14);
    int8x16_t v22 = vqrshrun_high_n_s16(v21, v17, 5uLL);
    int16x8_t v17 = vaddq_s16(v20, v14);
    *a3 = v22;
    a3[1] = vqrshrun_high_n_s16(vqrshrun_n_s16(v19, 5uLL), v20, 5uLL);
    a3 += 2;
    v18 += 2;
  }
  while (v18 < 0xE);
  return result;
}

uint16x8_t sub_1BBB68938(const float *a1, uint64_t a2, uint64_t a3, uint16x8_t *a4, unsigned int *a5, int a6, unsigned int a7)
{
  uint64_t v10 = *a5;
  if (a7 <= 8) {
    int v11 = a7;
  }
  else {
    int v11 = 2;
  }
  *(double *)v12.i64 = ((double (*)(const float *, uint64_t, void))off_1F14ED840[a6])(a1, a2, *a5);
  int32x4_t v26 = v12;
  *(double *)v13.i64 = ((double (*)(const float *, uint64_t, uint64_t))off_1F14ED840[v11])(a1, a2, v10);
  uint8x16_t v14 = (uint8x16_t)vtrn1q_s32(v26, v13);
  uint8x16_t v15 = (uint8x16_t)vtrn2q_s32(v26, v13);
  uint64_t v16 = (3 * a2);
  int16x8_t v17 = a1;
  uint8x8_t v19 = (uint8x8_t)vld1_dup_f32(v17);
  unsigned int v18 = (const float *)((char *)v17 + v16);
  int16x8_t v20 = (const float *)((char *)a1 + a2);
  uint8x8_t v21 = (uint8x8_t)vld1_dup_f32(v20);
  int8x16_t v22 = (const float *)((char *)a1 + (2 * a2));
  uint8x8_t v23 = (uint8x8_t)vld1_dup_f32(v22);
  uint8x8_t v24 = (uint8x8_t)vld1_dup_f32(v18);
  *a4 = vsubl_u8(v19, *(uint8x8_t *)v14.i8);
  a4[1] = vsubl_u8(v21, *(uint8x8_t *)v15.i8);
  uint16x8_t result = vsubw_high_u8(vmovl_u8(v24), v15);
  a4[2] = vsubw_high_u8(vmovl_u8(v23), v14);
  a4[3] = result;
  return result;
}

double sub_1BBB68A04(uint64_t a1, int a2)
{
  __int8 v3 = *(unsigned char *)(a1 - 1);
  uint64_t v2 = a1 - 1;
  int8x8_t v4 = vdup_n_s8(*(unsigned __int8 *)(v2 + 3 * a2));
  v5.i8[0] = *(unsigned char *)(v2 + 3 * a2);
  v5.i8[1] = *(unsigned char *)(v2 + 2 * a2);
  v5.i8[2] = *(unsigned char *)(v2 + a2);
  v5.i8[3] = v3;
  v5.i8[4] = v3;
  v5.i8[5] = v3;
  v5.i8[6] = v3;
  v5.i8[7] = v3;
  uint8x8_t v6 = (uint8x8_t)vext_s8(v4, v5, 7uLL);
  int8x8_t v7 = (int8x8_t)vrhadd_u8(vhadd_u8((uint8x8_t)v5, (uint8x8_t)vext_s8(v4, v5, 6uLL)), v6);
  int8x8_t v8 = vdup_lane_s8(v7, 0);
  *(int8x8_t *)v9.i8 = vrev64_s8(vzip1_s8(v7, (int8x8_t)vrhadd_u8((uint8x8_t)v5, v6)));
  *(int8x8_t *)v10.i8 = vext_s8(*(int8x8_t *)v9.i8, *(int8x8_t *)v9.i8, 2uLL);
  v9.u64[1] = (unint64_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1);
  v10.u64[1] = (unint64_t)v8;
  *(void *)&double result = vtrn1q_s32(v9, v10).u64[0];
  return result;
}

double sub_1BBB68A78(uint64_t a1, int a2, int a3)
{
  int32x2_t v3 = *(int32x2_t *)(a1 - a2);
  if ((a3 & 0xFF0000) == 0) {
    int32x2_t v3 = vzip1_s32(v3, (int32x2_t)vdup_lane_s8((int8x8_t)v3, 3));
  }
  uint8x8_t v4 = (uint8x8_t)vext_s8((int8x8_t)v3, (int8x8_t)v3, 1uLL);
  *(uint8x8_t *)v5.i8 = vrhadd_u8(vhadd_u8((uint8x8_t)v3, (uint8x8_t)vext_s8((int8x8_t)v3, (int8x8_t)v3, 2uLL)), v4);
  *(uint8x8_t *)v6.i8 = vrhadd_u8((uint8x8_t)v3, v4);
  v6.u64[1] = (unint64_t)vext_s8(*(int8x8_t *)v6.i8, *(int8x8_t *)v6.i8, 1uLL);
  v5.u64[1] = (unint64_t)vext_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v6.i8, 1uLL);
  *(void *)&double result = vtrn1q_s32(v6, v5).u64[0];
  return result;
}

double sub_1BBB68ABC(uint64_t a1, int a2)
{
  uint64_t v2 = (__int8 *)(a1 - 1 - a2);
  v3.i8[0] = *v2;
  v3.i8[1] = *v2;
  v3.i8[2] = *v2;
  v3.i8[3] = v2[4 * a2];
  v3.i8[4] = v2[3 * a2];
  v3.i8[5] = v2[2 * a2];
  v3.i8[6] = *(unsigned char *)(a1 - 1);
  uint8x8_t v4 = (const float *)(a1 - a2);
  v3.i8[7] = v3.i8[0];
  int8x8_t v5 = (int8x8_t)vld1_dup_f32(v4);
  uint8x8_t v6 = (uint8x8_t)vext_s8(v3, v5, 3uLL);
  uint8x8_t v7 = (uint8x8_t)vext_s8(v3, v5, 4uLL);
  int32x2_t v8 = (int32x2_t)vrhadd_u8(vhadd_u8(v6, (uint8x8_t)vext_s8(v3, v5, 5uLL)), v7);
  int8x8_t v9 = (int8x8_t)vdup_lane_s32(v8, 1);
  int32x2_t v10 = (int32x2_t)vzip1_s8((int8x8_t)vrhadd_u8(v6, v7), (int8x8_t)v8);
  *(int32x2_t *)v11.i8 = vdup_lane_s32(v10, 1);
  *(int8x8_t *)v12.i8 = vext_s8((int8x8_t)v10, v9, 6uLL);
  v12.u64[1] = (unint64_t)vext_s8((int8x8_t)v10, (int8x8_t)v10, 2uLL);
  v11.u64[1] = (unint64_t)v10;
  *(void *)&double result = vtrn1q_s32(v12, v11).u64[0];
  return result;
}

double sub_1BBB68B44(uint64_t a1, int a2)
{
  uint64_t v2 = (const float *)(a1 - a2);
  int8x8_t v3 = (int8x8_t)vld1_dup_f32(v2);
  uint8x8_t v4 = (__int8 *)(a1 - 1 - a2);
  v3.i8[0] = v4[3 * a2];
  v3.i8[1] = v4[2 * a2];
  v3.i8[2] = *(unsigned char *)(a1 - 1);
  v3.i8[3] = *v4;
  uint8x8_t v5 = (uint8x8_t)vext_s8(v3, v3, 3uLL);
  uint8x8_t v6 = (uint8x8_t)vext_s8(v3, v3, 4uLL);
  int8x8_t v7 = (int8x8_t)vrhadd_u8(vhadd_u8((uint8x8_t)v3, (uint8x8_t)vext_s8(v3, v3, 2uLL)), (uint8x8_t)vext_s8(v3, v3, 1uLL));
  *(uint8x8_t *)v8.i8 = vrhadd_u8(v5, v6);
  *(int8x8_t *)v9.i8 = vext_s8(v7, v7, 2uLL);
  v8.u64[1] = (unint64_t)vext_s8(vdup_lane_s8(v7, 1), *(int8x8_t *)v8.i8, 7uLL);
  v9.u64[1] = (unint64_t)vext_s8(vdup_lane_s8(v7, 0), *(int8x8_t *)v9.i8, 7uLL);
  *(void *)&double result = vtrn1q_s32(v8, v9).u64[0];
  return result;
}

double sub_1BBB68BB4(uint64_t a1, int a2)
{
  uint64_t v2 = (const float *)(a1 - a2);
  int8x8_t v3 = (__int8 *)(a1 - 1 - a2);
  v4.i8[0] = *v3;
  v4.i8[1] = *v3;
  v4.i8[2] = *v3;
  v4.i8[3] = v3[4 * a2];
  v4.i8[4] = v3[3 * a2];
  v4.i8[5] = v3[2 * a2];
  v4.i8[6] = *(unsigned char *)(a1 - 1);
  v4.i8[7] = *v3;
  int8x8_t v5 = (int8x8_t)vld1_dup_f32(v2);
  int8x8_t v6 = (int8x8_t)vrhadd_u8(vhadd_u8((uint8x8_t)vext_s8(v4, v5, 3uLL), (uint8x8_t)vext_s8(v4, v5, 5uLL)), (uint8x8_t)vext_s8(v4, v5, 4uLL));
  *(int8x8_t *)v7.i8 = vext_s8(v6, v6, 2uLL);
  *(int8x8_t *)v8.i8 = vext_s8(v6, v6, 3uLL);
  v8.u64[1] = (unint64_t)vext_s8(v6, v6, 1uLL);
  v7.u64[1] = (unint64_t)v6;
  *(void *)&double result = vtrn1q_s32(v8, v7).u64[0];
  return result;
}

double sub_1BBB68C2C(uint64_t a1, int a2, int a3)
{
  int32x2_t v3 = *(int32x2_t *)(a1 - a2);
  if ((a3 & 0xFF0000) == 0) {
    int32x2_t v3 = vzip1_s32(v3, (int32x2_t)vdup_lane_s8((int8x8_t)v3, 3));
  }
  int8x8_t v4 = vdup_lane_s8((int8x8_t)v3, 7);
  *(uint8x8_t *)v5.i8 = vrhadd_u8(vhadd_u8((uint8x8_t)v3, (uint8x8_t)vext_s8((int8x8_t)v3, v4, 2uLL)), (uint8x8_t)vext_s8((int8x8_t)v3, v4, 1uLL));
  *(int8x8_t *)v6.i8 = vext_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v5.i8, 1uLL);
  v5.u64[1] = (unint64_t)vext_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v5.i8, 2uLL);
  v6.u64[1] = (unint64_t)vext_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v5.i8, 3uLL);
  *(void *)&double result = vtrn1q_s32(v5, v6).u64[0];
  return result;
}

uint8x8_t sub_1BBB68C74(uint64_t a1, int a2, unsigned int a3)
{
  *(double *)&uint8x8_t result = -2.93744652e-306;
  switch((a3 | (a3 >> 7)) & 3)
  {
    case 1u:
      unsigned int v4 = (*(unsigned __int8 *)(a1 - 1)
          + *(unsigned __int8 *)(a1 + a2 - 1)
          + *(unsigned __int8 *)(a1 + 2 * a2 - 1)
          + *(unsigned __int8 *)(a1 + 2 * a2 + a2 - 1)
          + 2) >> 2;
      goto LABEL_6;
    case 2u:
      int32x4_t v5 = (const float *)(a1 - a2);
      uint8x8_t v6 = (uint8x8_t)vld1_dup_f32(v5);
      v6.i16[0] = vaddlv_u8(v6);
      int v7 = v6.i32[0];
      goto LABEL_5;
    case 3u:
      result.i32[0] = *(_DWORD *)(a1 - a2);
      result.i16[0] = vaddlv_u8(result);
      int v7 = *(unsigned __int8 *)(a1 - 1)
         + *(unsigned __int8 *)(a1 + a2 - 1)
         + *(unsigned __int8 *)(a1 + 2 * a2 - 1)
         + *(unsigned __int8 *)(a1 + 2 * a2 + a2 - 1)
         + result.i32[0];
LABEL_5:
      unsigned int v4 = (v7 + 4) >> 3;
LABEL_6:
      uint8x8_t result = (uint8x8_t)vdupq_n_s8(v4).u64[0];
      break;
    default:
      return result;
  }
  return result;
}

double sub_1BBB68D44(uint64_t a1, int a2, int32x4_t a3, int32x4_t a4)
{
  unsigned __int8 v5 = *(unsigned char *)(a1 - 1);
  uint64_t v4 = a1 - 1;
  a3.i8[0] = v5;
  a3.i8[1] = v5;
  a3.i8[2] = v5;
  a3.i8[3] = v5;
  a3.i8[8] = *(unsigned char *)(v4 + 2 * a2);
  a3.i8[9] = a3.i8[8];
  a3.i8[10] = a3.i8[8];
  a3.i8[11] = a3.i8[8];
  a4.i8[0] = *(unsigned char *)(v4 + a2);
  a4.i8[1] = a4.i8[0];
  a4.i8[2] = a4.i8[0];
  a4.i8[3] = a4.i8[0];
  a4.i8[8] = *(unsigned char *)(v4 + 3 * a2);
  a4.i8[9] = a4.i8[8];
  a4.i8[10] = a4.i8[8];
  a4.i8[11] = a4.i8[8];
  a3.i64[0] = vtrn1q_s32(a3, a4).u64[0];
  return *(double *)a3.i64;
}

double sub_1BBB68DA4(uint64_t a1, int a2)
{
  uint64_t v2 = (const float *)(a1 - a2);
  *(void *)&double result = vld1q_dup_f32(v2).u64[0];
  return result;
}

uint16x8_t sub_1BBB68DB0(__int32 *a1, uint64_t a2, uint8x16_t *a3, uint16x8_t *a4, unsigned int *a5, int a6)
{
  unsigned int v8 = a2;
  *(double *)v10.i64 = ((double (*)(__int32 *, uint64_t, void))off_1F14ED840[a6])(a1, a2, *a5);
  *a3 = v10;
  v11.i32[0] = *a1;
  v11.i32[1] = *(__int32 *)((char *)a1 + v8);
  v12.i32[0] = *(__int32 *)((char *)a1 + 2 * v8);
  v12.i32[1] = *(__int32 *)((char *)a1 + 3 * v8);
  uint16x8_t v13 = vsubl_u8(v11, *(uint8x8_t *)v10.i8);
  uint16x8_t result = vsubw_high_u8(vmovl_u8(v12), v10);
  *a4 = v13;
  a4[1] = result;
  return result;
}

__n128 sub_1BBB68E2C(uint64_t a1, int a2, __n128 *a3)
{
  int32x2_t v3 = (__n128 *)(a1 - a2);
  __n128 result = *v3;
  *a3 = *v3;
  a3[1] = result;
  a3[2] = result;
  a3[3] = result;
  a3[4] = result;
  a3[5] = result;
  a3[6] = result;
  a3[7] = result;
  return result;
}

int16x8_t sub_1BBB68E48(uint64_t a1, int a2, int16x8_t *a3)
{
  int32x2_t v3 = (const __int16 *)(a1 - 2);
  char v4 = 1;
  do
  {
    int16x8_t v6 = vld1q_dup_s16(v3);
    unsigned __int8 v5 = (const __int16 *)((char *)v3 + a2);
    *a3 = v6;
    int16x8_t v8 = vld1q_dup_s16(v5);
    int v7 = (const __int16 *)((char *)v5 + a2);
    char v9 = v4;
    a3[1] = v8;
    int16x8_t v11 = vld1q_dup_s16(v7);
    uint8x16_t v10 = (const __int16 *)((char *)v7 + a2);
    a3[2] = v11;
    int16x8_t result = vld1q_dup_s16(v10);
    int32x2_t v3 = (const __int16 *)((char *)v10 + a2);
    a3[3] = result;
    a3 += 4;
    char v4 = 0;
  }
  while ((v9 & 1) != 0);
  return result;
}

uint64_t sub_1BBB68E88(uint64_t result, int a2, int8x16_t *a3, char a4)
{
  int v4 = a4 & 3;
  if (v4 == 3)
  {
    int32x4_t v26 = (const char *)(result - a2);
    int8x8x2_t v49 = vld2_s8(v26);
    uint64_t v27 = 3 * a2;
    unsigned int v28 = (const __int16 *)(result - 2 + a2);
    int8x16_t v29 = (const __int16 *)(result - 2 + 2 * a2);
    int8x16_t v30 = (const __int16 *)(result - 2 + 3 * a2);
    long long v31 = (const __int16 *)(result - 2 + 4 * a2);
    uint8x16_t v32 = (const __int16 *)(result - 2);
    uint8x8_t v34 = (uint8x8_t)vld1_dup_s16(v32);
    long long v33 = &v32[v27];
    unsigned int v35 = (const __int16 *)(result - 2 + 5 * a2);
    uint8x8_t v36 = (uint8x8_t)vld1_dup_s16(v28);
    uint8x8_t v37 = (uint8x8_t)vld1_dup_s16(v29);
    int8x8_t v38 = v49.val[1];
    int8x8x2_t v49 = (int8x8x2_t)vpaddlq_u8((uint8x16_t)v49);
    v49.val[1] = (int8x8_t)vld1_dup_s16(v30);
    uint8x8_t v39 = (uint8x8_t)vld1_dup_s16(v31);
    uint8x8_t v40 = (uint8x8_t)vld1_dup_s16(v35);
    uint8x8_t v41 = (uint8x8_t)vld1_dup_s16(v33);
    v49.val[0] = (int8x8_t)vpaddq_s16((int16x8_t)v49, (int16x8_t)v49).u64[0];
    uint8x16_t v42 = (const __int16 *)(result - 2 - a2 + 8 * a2);
    uint8x8_t v43 = (uint8x8_t)vld1_dup_s16(v42);
    v49.val[0] = (int8x8_t)vzip1_s16((int16x4_t)v49.val[0], (int16x4_t)vdup_lane_s32((int32x2_t)v49.val[0], 1));
    int16x8_t v44 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(v40, v39), v41), v43);
    int16x8_t v45 = (int16x8_t)vdupq_lane_s32((int32x2_t)v49.val[0], 1);
    int8x16_t v6 = vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16((int16x8_t)vaddw_u8(vaddl_u8(v36, v34), v37), (int16x8_t)vdupq_lane_s32((int32x2_t)v49.val[0], 0)), (uint8x8_t)v49.val[1]), 3uLL), v45, 2uLL);
    int8x16_t v5 = vrshrn_high_n_s16(vrshrn_n_s16(v44, 2uLL), vaddq_s16(v44, v45), 3uLL);
  }
  else if (v4 == 2)
  {
    long long v46 = (const char *)(result - a2);
    int8x8x2_t v50 = vld2_s8(v46);
    int8x8_t v47 = v50.val[1];
    int8x8x2_t v50 = (int8x8x2_t)vpaddlq_u8((uint8x16_t)v50);
    v50.val[0] = (int8x8_t)vpaddq_s16((int16x8_t)v50, (int16x8_t)v50).u64[0];
    v50.val[1] = (int8x8_t)vzip1_s16((int16x4_t)v50.val[0], (int16x4_t)vdup_lane_s32((int32x2_t)v50.val[0], 1));
    int16x4_t v48 = vzip2_s16((int16x4_t)v50.val[0], (int16x4_t)v50.val[0]);
    v50.val[1] = vrshrn_n_s16(*(int16x8_t *)((char *)&v50 + 8), 2uLL);
    *(int16x4_t *)v5.i8 = vdup_lane_s16((int16x4_t)v50.val[1], 0);
    v5.u64[1] = (unint64_t)vdup_lane_s16((int16x4_t)v50.val[1], 1);
    int8x16_t v6 = v5;
  }
  else
  {
    v5.i64[0] = 0x8080808080808080;
    v5.i64[1] = 0x8080808080808080;
    v6.i64[0] = 0x8080808080808080;
    v6.i64[1] = 0x8080808080808080;
    if (v4 == 1)
    {
      uint64_t v7 = 3 * a2;
      int16x8_t v8 = (const __int16 *)(result - 2 + a2);
      char v9 = (const __int16 *)(result - 2 + 2 * a2);
      uint8x16_t v10 = (const __int16 *)(result - 2 + 3 * a2);
      int16x8_t v11 = (const __int16 *)(result - 2 + 4 * a2);
      uint8x8_t v12 = (const __int16 *)(result - 2 + 5 * a2);
      uint16x8_t v13 = (const __int16 *)(result - 2);
      uint8x8_t v15 = (uint8x8_t)vld1_dup_s16(v13);
      uint8x16_t v14 = &v13[v7];
      uint8x8_t v16 = (uint8x8_t)vld1_dup_s16(v8);
      uint8x8_t v17 = (uint8x8_t)vld1_dup_s16(v9);
      uint8x8_t v18 = (uint8x8_t)vld1_dup_s16(v10);
      uint8x8_t v19 = (uint8x8_t)vld1_dup_s16(v11);
      uint8x8_t v20 = (uint8x8_t)vld1_dup_s16(v12);
      uint8x8_t v21 = (uint8x8_t)vld1_dup_s16(v14);
      int8x16_t v22 = (const __int16 *)(result - 2 - a2 + 8 * a2);
      uint8x8_t v23 = (uint8x8_t)vld1_dup_s16(v22);
      int16x8_t v24 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(v16, v15), v17), v18);
      int16x8_t v25 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(v20, v19), v21), v23);
      int8x16_t v6 = vrshrn_high_n_s16(vrshrn_n_s16(v24, 2uLL), v24, 2uLL);
      int8x16_t v5 = vrshrn_high_n_s16(vrshrn_n_s16(v25, 2uLL), v25, 2uLL);
    }
  }
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6;
  a3[3] = v6;
  a3[4] = v5;
  a3[5] = v5;
  a3[6] = v5;
  a3[7] = v5;
  return result;
}

uint64_t sub_1BBB69030(uint64_t a1, int a2, int8x16_t *a3)
{
  __int16 v4 = *(_WORD *)(a1 - 2);
  uint64_t result = a1 - 2;
  int8x16_t v5 = (unsigned __int16 *)(result - a2);
  int8x16_t v6 = *(int8x16_t *)(v5 + 1);
  v7.i16[0] = *(unsigned __int16 *)((char *)v5 + 3 * a2);
  v7.i16[1] = v5[a2];
  v7.i16[2] = v4;
  v7.i16[3] = *v5;
  int16x8_t v8 = (int16x8_t)vmlsl_u8(vmull_u8((uint8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL), (uint8x8_t)0x404030302020101), (uint8x8_t)vrev64_s16((int16x4_t)vext_s8((int8x8_t)vdup_n_s16(*v5), *(int8x8_t *)v6.i8, 6uLL)), (uint8x8_t)0x404030302020101);
  v9.i16[0] = *(unsigned __int16 *)((char *)v5 + 5 * a2);
  v9.i16[1] = v5[3 * a2];
  v9.i16[2] = *(unsigned __int16 *)((char *)v5 + 7 * a2);
  v9.i16[3] = v5[4 * a2];
  int16x8_t v10 = (int16x8_t)vaddw_high_u8(vmovl_u8(v9), (uint8x16_t)v6);
  int8x16_t v11 = (int8x16_t)vmlsl_u8(vmull_u8(v9, (uint8x8_t)0x404030302020101), v7, (uint8x8_t)0x404030302020101);
  int16x4_t v12 = (int16x4_t)vextq_s8((int8x16_t)v8, (int8x16_t)v8, 8uLL).u64[0];
  int16x4_t v13 = vuzp1_s16(*(int16x4_t *)v8.i8, v12);
  *(int16x4_t *)v8.i8 = vuzp2_s16(*(int16x4_t *)v8.i8, v12);
  int16x4_t v14 = (int16x4_t)vextq_s8(v11, v11, 8uLL).u64[0];
  *(int16x4_t *)v11.i8 = vpadd_s16(vpadd_s16(v13, *(int16x4_t *)v8.i8), vpadd_s16(vuzp1_s16(*(int16x4_t *)v11.i8, v14), vuzp2_s16(*(int16x4_t *)v11.i8, v14)));
  *(int16x4_t *)v8.i8 = vrhadd_s16(*(int16x4_t *)v11.i8, vshr_n_s16(*(int16x4_t *)v11.i8, 4uLL));
  int16x8_t v15 = (int16x8_t)vdupq_lane_s32(*(int32x2_t *)v8.i8, 1);
  int16x8_t v16 = (int16x8_t)vdupq_lane_s32(*(int32x2_t *)v8.i8, 0);
  v8.i64[0] = 0x2000200020002;
  v8.i64[1] = 0x2000200020002;
  int16x8_t v17 = vmlaq_s16((int16x8_t)vdupq_laneq_s32((int32x4_t)vshlq_n_s16(v10, 4uLL), 3), v15, v8);
  int16x8_t v18 = vmlaq_s16(v17, v16, (int16x8_t)xmmword_1BBB70160);
  int16x8_t v19 = vmlaq_s16(v17, v16, (int16x8_t)xmmword_1BBB6F6D0);
  unsigned int v20 = -2;
  do
  {
    int16x8_t v21 = vaddq_s16(v18, v15);
    int16x8_t v22 = vaddq_s16(v19, v15);
    int8x8_t v23 = vqrshrun_n_s16(v18, 5uLL);
    int16x8_t v18 = vaddq_s16(v21, v15);
    int8x16_t v24 = vqrshrun_high_n_s16(v23, v19, 5uLL);
    int16x8_t v19 = vaddq_s16(v22, v15);
    *a3 = v24;
    a3[1] = vqrshrun_high_n_s16(vqrshrun_n_s16(v21, 5uLL), v22, 5uLL);
    a3 += 2;
    v20 += 2;
  }
  while (v20 < 6);
  return result;
}

uint8x16_t sub_1BBB69154(uint64_t a1, int a2, uint8x16_t *a3, __int32 *a4, double a5, int8x8_t a6, double a7, uint32x4_t a8, uint32x4_t a9)
{
  uint8x8_t v9 = (int8x16_t *)(a1 - a2);
  int8x16_t v10 = *v9;
  if ((*a4 & 0xFF0000) == 0)
  {
    a6 = vdup_lane_s8(*(int8x8_t *)v10.i8, 7);
    v10.u64[1] = (unint64_t)a6;
  }
  __int32 v12 = v9[-1].u8[15];
  int8x16_t v11 = &v9[-1].i8[15];
  a6.i32[0] = v12;
  if ((*a4 & 0xFF00) == 0)
  {
    *(int8x8_t *)v13.i8 = vdup_lane_s8(a6, 0);
    v13.i64[1] = vextq_s8(v10, v10, 8uLL).u64[0];
    int8x16_t v10 = v13;
  }
  if (*a4)
  {
    int16x4_t v14 = &v11[a2];
    int16x8_t v15 = &v14[8 * a2 - a2];
    int8x16_t v16 = vld1q_dup_s8(v15);
    v16.i8[9] = v14[6 * a2];
    v16.i8[10] = v14[5 * a2];
    v16.i8[11] = v14[4 * a2];
    v16.i8[12] = v14[3 * a2];
    v16.i8[13] = v14[2 * a2];
    v16.i8[14] = v14[a2];
    v16.i8[15] = *v14;
    int8x16_t v17 = vdupq_lane_s8(a6, 0);
  }
  else
  {
    int8x16_t v17 = vdupq_lane_s8(a6, 0);
    int8x16_t v16 = v17;
  }
  a8.i32[0] = *a4;
  a9.i32[0] = 0x1000000;
  int8x16_t v18 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_u32(a9, a8), 0);
  *(int8x8_t *)v19.i8 = vdup_laneq_s8(v16, 15);
  v19.u64[1] = (unint64_t)vdup_lane_s8(*(int8x8_t *)v10.i8, 0);
  int8x16_t v20 = vbslq_s8(v18, v19, v17);
  int8x16_t v21 = vextq_s8(v16, v20, 1uLL);
  int8x16_t v22 = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(v21, v10, 1uLL), (uint8x16_t)v16), (uint8x16_t)v21);
  v18.i64[0] = vextq_s8(v22, v22, 8uLL).u64[0];
  *(int8x8_t *)v22.i8 = vdup_lane_s8(*(int8x8_t *)v22.i8, 7);
  v22.i64[1] = v18.i64[0];
  uint8x16_t result = vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(v20, v10, 0xFuLL), (uint8x16_t)vextq_s8(v10, vdupq_laneq_s8(v10, 15), 1uLL)), (uint8x16_t)v10);
  a3[-1] = (uint8x16_t)v22;
  *a3 = result;
  a3[1].i8[0] = result.i8[15];
  return result;
}

double sub_1BBB69260(void *a1, int a2, double *a3)
{
  double result = *a3;
  *a1 = *(void *)a3;
  *(double *)((char *)a1 + a2) = result;
  *(double *)((char *)a1 + 2 * a2) = result;
  *(double *)((char *)a1 + 3 * a2) = result;
  *(double *)((char *)a1 + 4 * a2) = result;
  *(double *)((char *)a1 + 5 * a2) = result;
  *(double *)((char *)a1 + 6 * a2) = result;
  *(double *)((char *)&a1[a2] - a2) = result;
  return result;
}

int8x8_t sub_1BBB692A4(int8x8_t *a1, int a2, uint64_t a3)
{
  int8x8_t v3 = *(int8x8_t *)(a3 - 9);
  int8x8_t v4 = vdup_lane_s8(v3, 4);
  int8x8_t v5 = vdup_lane_s8(v3, 3);
  int8x8_t v6 = vdup_lane_s8(v3, 2);
  int8x8_t v7 = vdup_lane_s8(v3, 1);
  *a1 = vdup_lane_s8(v3, 7);
  *(int8x8_t *)((char *)a1 + a2) = vdup_lane_s8(v3, 6);
  *(int8x8_t *)((char *)a1 + 2 * a2) = vdup_lane_s8(v3, 5);
  int8x8_t result = vdup_lane_s8(v3, 0);
  *(int8x8_t *)((char *)a1 + 3 * a2) = v4;
  *(int8x8_t *)((char *)a1 + 4 * a2) = v5;
  *(int8x8_t *)((char *)a1 + 5 * a2) = v6;
  *(int8x8_t *)((char *)a1 + 6 * a2) = v7;
  *(int8x8_t *)((char *)&a1[a2] - a2) = result;
  return result;
}

int8x8_t *sub_1BBB69308(int8x8_t *result, int a2, uint8x8_t *a3, _WORD *a4)
{
  if (*a4)
  {
    if ((unsigned __int16)*a4 <= 0xFFu)
    {
      uint8x8_t v4 = *(uint8x8_t *)((char *)a3 - 9);
LABEL_8:
      int16x4_t v7 = (int16x4_t)vpaddl_u8(v4);
      int16x4_t v8 = vpadd_s16(v7, v7);
      *(int16x4_t *)v9.i8 = vpadd_s16(v8, v8);
      v9.i64[1] = v9.i64[0];
      int8x8_t v5 = vrshrn_n_s16(v9, 3uLL);
      goto LABEL_9;
    }
    if (!*a4)
    {
      uint8x8_t v4 = *a3;
      goto LABEL_8;
    }
    int16x8_t v6 = (int16x8_t)vaddl_u8(*a3, *(uint8x8_t *)((char *)a3 - 9));
    *(int16x4_t *)v6.i8 = vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v6, (int8x16_t)v6, 8uLL));
    *(int16x4_t *)v6.i8 = vpadd_s16(*(int16x4_t *)v6.i8, *(int16x4_t *)v6.i8);
    *(int16x4_t *)v6.i8 = vpadd_s16(*(int16x4_t *)v6.i8, *(int16x4_t *)v6.i8);
    v6.i64[1] = v6.i64[0];
    int8x8_t v5 = vrshrn_n_s16(v6, 4uLL);
  }
  else
  {
    int8x8_t v5 = (int8x8_t)0x8080808080808080;
  }
LABEL_9:
  *int8x8_t result = v5;
  *(int8x8_t *)((char *)result + a2) = v5;
  *(int8x8_t *)((char *)result + 2 * a2) = v5;
  *(int8x8_t *)((char *)result + 3 * a2) = v5;
  *(int8x8_t *)((char *)result + 4 * a2) = v5;
  *(int8x8_t *)((char *)result + 5 * a2) = v5;
  *(int8x8_t *)((char *)result + 6 * a2) = v5;
  *(int8x8_t *)((char *)&result[a2] - a2) = v5;
  return result;
}

double sub_1BBB693B0(void *a1, int a2, int8x16_t *a3)
{
  int8x16_t v3 = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(*a3, a3[1], 2uLL), *(uint8x16_t *)a3), (uint8x16_t)vextq_s8(*a3, a3[1], 1uLL));
  *a1 = v3.i64[0];
  *(void *)((char *)a1 + a2) = vextq_s8(v3, v3, 1uLL).u64[0];
  *(void *)((char *)a1 + 2 * a2) = vextq_s8(v3, v3, 2uLL).u64[0];
  unint64_t v4 = vextq_s8(v3, v3, 3uLL).u64[0];
  unint64_t v5 = vextq_s8(v3, v3, 4uLL).u64[0];
  unint64_t v6 = vextq_s8(v3, v3, 5uLL).u64[0];
  unint64_t v7 = vextq_s8(v3, v3, 6uLL).u64[0];
  *(void *)&double result = vextq_s8(v3, v3, 7uLL).u64[0];
  *(void *)((char *)a1 + 3 * a2) = v4;
  *(void *)((char *)a1 + 4 * a2) = v5;
  *(void *)((char *)a1 + 5 * a2) = v6;
  *(void *)((char *)a1 + 6 * a2) = v7;
  *(double *)((char *)&a1[a2] - a2) = result;
  return result;
}

int8x16_t sub_1BBB69420(void *a1, int a2, uint64_t a3)
{
  int8x16_t result = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(*(int8x16_t *)(a3 - 9), *(int8x16_t *)(a3 + 7), 2uLL), *(uint8x16_t *)(a3 - 9)), (uint8x16_t)vextq_s8(*(int8x16_t *)(a3 - 9), *(int8x16_t *)(a3 + 7), 1uLL));
  *a1 = vextq_s8(result, result, 7uLL).u64[0];
  *(void *)((char *)a1 + a2) = vextq_s8(result, result, 6uLL).u64[0];
  *(void *)((char *)a1 + 2 * a2) = vextq_s8(result, result, 5uLL).u64[0];
  *(void *)((char *)a1 + 3 * a2) = vextq_s8(result, result, 4uLL).u64[0];
  *(void *)((char *)a1 + 4 * a2) = vextq_s8(result, result, 3uLL).u64[0];
  *(void *)((char *)a1 + 5 * a2) = vextq_s8(result, result, 2uLL).u64[0];
  *(void *)((char *)a1 + 6 * a2) = vextq_s8(result, result, 1uLL).u64[0];
  *(void *)((char *)&a1[a2] - a2) = result.i64[0];
  return result;
}

int8x8_t sub_1BBB69494(void *a1, int a2, uint64_t a3)
{
  int8x16_t v3 = *(int8x16_t *)(a3 - 8);
  uint8x16_t v4 = (uint8x16_t)vextq_s8(v3, v3, 2uLL);
  uint8x16_t v5 = (uint8x16_t)vextq_s8(v3, v3, 1uLL);
  uint8x16_t v6 = vhaddq_u8(v4, (uint8x16_t)v3);
  int8x16_t v7 = (int8x16_t)vrhaddq_u8(v4, v5);
  int8x16_t v8 = (int8x16_t)vrhaddq_u8(v6, v5);
  v7.i64[0] = vextq_s8(v7, v7, 6uLL).u64[0];
  v5.i64[0] = vextq_s8(v8, v8, 6uLL).u64[0];
  *a1 = v7.i64[0];
  *(void *)((char *)a1 + a2) = v5.i64[0];
  *(int8x8_t *)v8.i8 = vext_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v8.i8, 6uLL);
  *(int8x8_t *)((char *)a1 + 2 * a2) = vext_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v7.i8, 7uLL);
  int8x8_t v9 = vuzp1_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v8.i8);
  *(int8x8_t *)v8.i8 = vuzp2_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v8.i8);
  int8x8_t v10 = vext_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v7.i8, 6uLL);
  int8x8_t result = vext_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v7.i8, 5uLL);
  *(int8x8_t *)((char *)a1 + 3 * a2) = vext_s8(v9, *(int8x8_t *)v5.i8, 7uLL);
  *(int8x8_t *)((char *)a1 + 4 * a2) = v10;
  *(int8x8_t *)((char *)a1 + 5 * a2) = vext_s8(v9, *(int8x8_t *)v5.i8, 6uLL);
  *(int8x8_t *)((char *)a1 + 6 * a2) = result;
  *(int8x8_t *)((char *)&a1[a2] - a2) = vext_s8(v9, *(int8x8_t *)v5.i8, 5uLL);
  return result;
}

int8x8_t sub_1BBB69518(int8x8_t *a1, int a2, uint64_t a3)
{
  int8x16_t v3 = *(int8x16_t *)(a3 - 9);
  uint8x16_t v4 = (uint8x16_t)vextq_s8(v3, v3, 1uLL);
  int8x16_t v5 = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(v3, v3, 0xFuLL), v4), (uint8x16_t)v3);
  int8x8_t v6 = (int8x8_t)vextq_s8(v5, v5, 8uLL).u64[0];
  *(uint8x8_t *)v3.i8 = vrhadd_u8(*(uint8x8_t *)v4.i8, *(uint8x8_t *)v3.i8);
  *(int8x8_t *)v4.i8 = vzip2_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v3.i8);
  *a1 = vext_s8(*(int8x8_t *)v4.i8, v6, 7uLL);
  *(int8x8_t *)((char *)a1 + a2) = vext_s8(*(int8x8_t *)v4.i8, v6, 5uLL);
  *(int8x8_t *)((char *)a1 + 2 * a2) = vext_s8(*(int8x8_t *)v4.i8, v6, 3uLL);
  *(int8x8_t *)v3.i8 = vzip1_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v3.i8);
  *(int8x8_t *)v5.i8 = vext_s8(*(int8x8_t *)v4.i8, v6, 1uLL);
  int8x8_t v7 = vext_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v4.i8, 7uLL);
  int8x8_t v8 = vext_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v4.i8, 5uLL);
  int8x8_t v9 = vext_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v4.i8, 3uLL);
  int8x8_t result = vext_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v4.i8, 1uLL);
  *(int8x8_t *)((char *)a1 + 3 * a2) = *(int8x8_t *)v5.i8;
  *(int8x8_t *)((char *)a1 + 4 * a2) = v7;
  *(int8x8_t *)((char *)a1 + 5 * a2) = v8;
  *(int8x8_t *)((char *)a1 + 6 * a2) = v9;
  *(int8x8_t *)((char *)&a1[a2] - a2) = result;
  return result;
}

double sub_1BBB6959C(void *a1, int a2, uint8x16_t *a3)
{
  int8x16_t v3 = *(int8x16_t *)a3;
  uint8x16_t v4 = (uint8x16_t)vextq_s8(v3, v3, 1uLL);
  uint8x16_t v5 = vhaddq_u8((uint8x16_t)vextq_s8(v3, v3, 2uLL), *a3);
  int8x16_t v6 = (int8x16_t)vrhaddq_u8(v4, *a3);
  int8x16_t v7 = (int8x16_t)vrhaddq_u8(v5, v4);
  *a1 = v6.i64[0];
  *(void *)((char *)a1 + a2) = v7.i64[0];
  *(void *)((char *)a1 + 2 * a2) = vextq_s8(v6, v6, 1uLL).u64[0];
  unint64_t v8 = vextq_s8(v6, v6, 2uLL).u64[0];
  *(void *)&double result = vextq_s8(v6, v6, 3uLL).u64[0];
  *(void *)((char *)a1 + 3 * a2) = vextq_s8(v7, v7, 1uLL).u64[0];
  *(void *)((char *)a1 + 4 * a2) = v8;
  *(void *)((char *)a1 + 5 * a2) = vextq_s8(v7, v7, 2uLL).u64[0];
  *(double *)((char *)a1 + 6 * a2) = result;
  *(void *)((char *)&a1[a2] - a2) = vextq_s8(v7, v7, 3uLL).u64[0];
  return result;
}

int8x8_t sub_1BBB6960C(int8x8_t *a1, int a2, uint64_t a3)
{
  int8x8_t v3 = *(int8x8_t *)(a3 - 9);
  int8x8_t v4 = vdup_lane_s8(v3, 0);
  int8x8_t v5 = vrev64_s8(v3);
  uint8x8_t v6 = (uint8x8_t)vext_s8(v5, v3, 1uLL);
  uint8x8_t v7 = vhadd_u8((uint8x8_t)vext_s8(v5, v4, 2uLL), (uint8x8_t)v5);
  int8x8_t v8 = (int8x8_t)vrhadd_u8(v6, (uint8x8_t)v5);
  int8x8_t v9 = (int8x8_t)vrhadd_u8(v7, v6);
  int8x8_t v10 = vzip1_s8(v8, v9);
  int8x8_t result = vzip2_s8(v8, v9);
  *a1 = v10;
  *(int8x8_t *)((char *)a1 + a2) = vext_s8(v10, result, 2uLL);
  *(int8x8_t *)((char *)a1 + 2 * a2) = vext_s8(v10, result, 4uLL);
  *(int8x8_t *)((char *)a1 + 3 * a2) = vext_s8(v10, result, 6uLL);
  *(int8x8_t *)((char *)a1 + 4 * a2) = result;
  *(int8x8_t *)((char *)a1 + 5 * a2) = vext_s8(result, v4, 2uLL);
  *(int8x8_t *)((char *)a1 + 6 * a2) = vext_s8(result, v4, 4uLL);
  *(int8x8_t *)((char *)&a1[a2] - a2) = v4;
  return result;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7500](bundle);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A88](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

uint64_t CFLog()
{
  return MEMORY[0x1F40D7C50]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1F40D7D78](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8400](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x1F40D8548](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

CFURLRef CFURLCreateAbsoluteURLWithBytes(CFAllocatorRef alloc, const UInt8 *relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode)
{
  return (CFURLRef)MEMORY[0x1F40D87D8](alloc, relativeURLBytes, length, *(void *)&encoding, baseURL, useCompatibilityMode);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x1F40DB910]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1F40DB920]();
}

OSStatus CMBlockBufferAccessDataBytes(CMBlockBufferRef theBuffer, size_t offset, size_t length, void *temporaryBlock, char **returnedPointerOut)
{
  return MEMORY[0x1F40DB948](theBuffer, offset, length, temporaryBlock, returnedPointerOut);
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1F40DB950](theBuffer, targetBBuf, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferAppendMemoryBlock(CMBlockBufferRef theBuffer, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1F40DB958](theBuffer, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1F40DB968](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB980](structureAllocator, bufferReference, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB988](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB998](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1F40DB9A0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1F40DB9C8](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x1F40DBB80]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1F40DBBB8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBBC0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD30](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1F40DBDA0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1F40DBE00](sbuf, createIfNecessary);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1F40DBE18](sbuf, sampleIndex, timingInfoOut);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateFromH264ParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC320](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(void *)&NALUnitHeaderLength, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

int CVColorPrimariesGetIntegerCodePointForString(CFStringRef colorPrimariesString)
{
  return MEMORY[0x1F40DFBA8](colorPrimariesString);
}

CFStringRef CVColorPrimariesGetStringForIntegerCodePoint(int colorPrimariesCodePoint)
{
  return (CFStringRef)MEMORY[0x1F40DFBB0](*(void *)&colorPrimariesCodePoint);
}

Boolean CVIsCompressedPixelFormatAvailable(OSType pixelFormatType)
{
  return MEMORY[0x1F40DFC50](*(void *)&pixelFormatType);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateResolvedAttributesDictionary(CFAllocatorRef allocator, CFArrayRef attributes, CFDictionaryRef *resolvedDictionaryOut)
{
  return MEMORY[0x1F40DFCF0](allocator, attributes, resolvedDictionaryOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferFillExtendedPixels(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD18](pixelBuffer);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1F40DFD20]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD50](pixelBuffer);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

uint64_t CVPixelBufferIsCompatibleWithAttributes()
{
  return MEMORY[0x1F40DFDA8]();
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFDB0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1F40DFDC0](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFDF0](pool);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x1F40DFE18](pixelBufferPool);
}

uint64_t CVPixelBufferPoolSetMaxBufferAge()
{
  return MEMORY[0x1F40DFE28]();
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1F40DFE58]();
}

uint64_t CVPixelFormatTypeIsSubsampled()
{
  return MEMORY[0x1F40DFE70]();
}

int CVTransferFunctionGetIntegerCodePointForString(CFStringRef transferFunctionString)
{
  return MEMORY[0x1F40DFE78](transferFunctionString);
}

CFStringRef CVTransferFunctionGetStringForIntegerCodePoint(int transferFunctionCodePoint)
{
  return (CFStringRef)MEMORY[0x1F40DFE80](*(void *)&transferFunctionCodePoint);
}

int CVYCbCrMatrixGetIntegerCodePointForString(CFStringRef yCbCrMatrixString)
{
  return MEMORY[0x1F40DFE88](yCbCrMatrixString);
}

CFStringRef CVYCbCrMatrixGetStringForIntegerCodePoint(int yCbCrMatrixCodePoint)
{
  return (CFStringRef)MEMORY[0x1F40DFE90](*(void *)&yCbCrMatrixCodePoint);
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x1F40DD700]();
}

uint64_t FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer()
{
  return MEMORY[0x1F40DE030]();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferForCFType()
{
  return MEMORY[0x1F40DE0B8]();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferWithFlagsForCFType()
{
  return MEMORY[0x1F40DE0E0]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1F40DE320]();
}

uint64_t FigThreadGetMachThreadPriorityValue()
{
  return MEMORY[0x1F40DE5C0]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1F40DE5F0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1F4124C78]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

uint64_t IOSurfaceGetAddressFormatOfPlane()
{
  return MEMORY[0x1F40E9348]();
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane()
{
  return MEMORY[0x1F40E9360]();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane()
{
  return MEMORY[0x1F40E9370]();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40E9380](buffer, planeIndex);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1F40E9388]();
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E93B8](buffer, planeIndex);
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane()
{
  return MEMORY[0x1F40E93E0]();
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane()
{
  return MEMORY[0x1F40E93E8]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x1F40E93F0]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane()
{
  return MEMORY[0x1F40E9448]();
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9450](buffer, planeIndex);
}

uint64_t IOSurfaceGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane()
{
  return MEMORY[0x1F40E9458]();
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9488](buffer);
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return MEMORY[0x1F40E94A8]();
}

uint64_t IOSurfaceGetRegistryID()
{
  return MEMORY[0x1F40E94B8]();
}

uint64_t IOSurfaceGetTileFormat()
{
  return MEMORY[0x1F40E94D8]();
}

uint64_t IOSurfaceGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane()
{
  return MEMORY[0x1F40E94F0]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane()
{
  return MEMORY[0x1F40E9500]();
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9508](buffer, planeIndex);
}

uint64_t IOSurfaceIsTiled()
{
  return MEMORY[0x1F40E9538]();
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9550](*(void *)&csid);
}

uint64_t IOSurfaceSetBulkAttachments()
{
  return MEMORY[0x1F40E9598]();
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x1F41030F0](session, completeUntilPresentationTimeStamp);
}

uint64_t VTCompressionSessionCreateWithOptions()
{
  return MEMORY[0x1F4103108]();
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x1F4103110](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

CVPixelBufferPoolRef VTCompressionSessionGetPixelBufferPool(VTCompressionSessionRef session)
{
  return (CVPixelBufferPoolRef)MEMORY[0x1F4103130](session);
}

void VTCompressionSessionInvalidate(VTCompressionSessionRef session)
{
}

OSStatus VTCompressionSessionPrepareToEncodeFrames(VTCompressionSessionRef session)
{
  return MEMORY[0x1F4103150](session);
}

uint64_t VTCompressionSessionSetProperty()
{
  return MEMORY[0x1F4103160]();
}

OSStatus VTCopyVideoEncoderList(CFDictionaryRef options, CFArrayRef *listOfVideoEncodersOut)
{
  return MEMORY[0x1F4103188](options, listOfVideoEncodersOut);
}

Boolean VTDecompressionSessionCanAcceptFormatDescription(VTDecompressionSessionRef session, CMFormatDescriptionRef newFormatDesc)
{
  return MEMORY[0x1F41031C0](session, newFormatDesc);
}

OSStatus VTDecompressionSessionCopyBlackPixelBuffer(VTDecompressionSessionRef session, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F41031C8](session, pixelBufferOut);
}

uint64_t VTDecompressionSessionCopyProperty()
{
  return MEMORY[0x1F41031D0]();
}

uint64_t VTDecompressionSessionCopySupportedPropertyDictionary()
{
  return MEMORY[0x1F41031E0]();
}

uint64_t VTDecompressionSessionCreateWithOptions()
{
  return MEMORY[0x1F41031F0]();
}

uint64_t VTDecompressionSessionDecodeFrameWithOptions()
{
  return MEMORY[0x1F4103200]();
}

OSStatus VTDecompressionSessionFinishDelayedFrames(VTDecompressionSessionRef session)
{
  return MEMORY[0x1F4103210](session);
}

void VTDecompressionSessionInvalidate(VTDecompressionSessionRef session)
{
}

uint64_t VTDecompressionSessionSetProperty()
{
  return MEMORY[0x1F4103248]();
}

OSStatus VTDecompressionSessionWaitForAsynchronousFrames(VTDecompressionSessionRef session)
{
  return MEMORY[0x1F4103250](session);
}

uint64_t VTEncoderSessionCreateVideoFormatDescription()
{
  return MEMORY[0x1F4103268]();
}

uint64_t VTEncoderSessionDequeueDecodeTimeStamp()
{
  return MEMORY[0x1F4103270]();
}

uint64_t VTEncoderSessionEmitEncodedFrame()
{
  return MEMORY[0x1F4103278]();
}

uint64_t VTEncoderSessionEnqueuePresentationTimeStamp()
{
  return MEMORY[0x1F4103288]();
}

uint64_t VTEncoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x1F4103290]();
}

uint64_t VTMotionEstimationSessionCreate()
{
  return MEMORY[0x1F41033B0]();
}

uint64_t VTMotionEstimationSessionEstimateMotionVectors()
{
  return MEMORY[0x1F41033B8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

uint64_t VTRegisterVideoEncoderWithInfo()
{
  return MEMORY[0x1F4103500]();
}

uint64_t VTSelectAndCreateVideoEncoderInstance()
{
  return MEMORY[0x1F4103518]();
}

OSStatus VTSessionCopyProperty(VTSessionRef session, CFStringRef propertyKey, CFAllocatorRef allocator, void *propertyValueOut)
{
  return MEMORY[0x1F4103520](session, propertyKey, allocator, propertyValueOut);
}

OSStatus VTSessionCopySupportedPropertyDictionary(VTSessionRef session, CFDictionaryRef *supportedPropertyDictionaryOut)
{
  return MEMORY[0x1F4103528](session, supportedPropertyDictionaryOut);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

uint64_t VTVPParavirtualizedH264VideoEncoder_CreateInstance()
{
  return MEMORY[0x1F41035E0]();
}

uint64_t VTVPParavirtualizedHEVCVideoEncoder_CreateInstance()
{
  return MEMORY[0x1F41035E8]();
}

uint64_t VTVideoEncoderGetCMBaseObject()
{
  return MEMORY[0x1F4103610]();
}

uint64_t VTVideoEncoderGetClassID()
{
  return MEMORY[0x1F4103618]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E390](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E458](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1F417E4A0](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5A0](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x1F417E6D0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x1F417E9B0]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
}

void std::__assoc_sub_state::wait(std::__assoc_sub_state *this)
{
}

void std::__assoc_sub_state::set_value(std::__assoc_sub_state *this)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_mutex_base::lock_shared(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::unlock_shared(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::lock(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::unlock(std::__shared_mutex_base *this)
{
}

std::__shared_mutex_base *__cdecl std::__shared_mutex_base::__shared_mutex_base(std::__shared_mutex_base *this)
{
  return (std::__shared_mutex_base *)MEMORY[0x1F417EA80](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return MEMORY[0x1F417EC50]();
}

std::future<void> *__cdecl std::future<void>::future(std::future<void> *this, std::__assoc_sub_state *__state)
{
  return (std::future<void> *)MEMORY[0x1F417ECB0](this, __state);
}

void std::future<void>::~future(std::future<void> *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1F417EF08]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator delete(void *__p, std::align_val_t a2)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float atanf(float a1)
{
  MEMORY[0x1F40CA470](a1);
  return result;
}

double atof(const char *a1)
{
  MEMORY[0x1F40CA498](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1F40CA4B8](a1);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1F4118648]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1F41186E0]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x1F4118700]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1F41187A0]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1F40CC100](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC280](a1, a2);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1F40CCBA0](memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1F40CDF00](*(void *)&task, semaphore, *(void *)&policy, *(void *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x1F40CDF08](*(void *)&task, *(void *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x1F40CDF10](*(void *)&semaphore);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x1F40CDF28](*(void *)&semaphore);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x1F40CDF98](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x1F40CE060](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

void srand(unsigned int a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE148](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CE238](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

intmax_t strtoimax(const char *__nptr, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE280](__nptr, __endptr, *(void *)&__base);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x1F40CE290](__str, __sep);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1F40CE298](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vfixru8(const float *__A, vDSP_Stride __IA, unsigned __int8 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfltu8(const unsigned __int8 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}