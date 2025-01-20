uint64_t sub_224AE12CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  char *v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  char v43;
  int v44;
  int v45;
  char v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  char **v51;
  uint64_t v52;
  int v53;
  void *v54;
  unint64_t v55;
  char v56;
  int v57;
  BOOL v58;
  _DWORD *v59;
  int v60;
  int v61;
  int v62;
  int v63;
  unsigned int v64;
  uint64_t v65;
  _DWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  int v72;
  int v73;
  uint64_t v74;
  unsigned int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  unsigned int v80;
  int v81;
  int v82;
  char v84;
  int v85;
  int v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  int v91;
  int v92;
  uint64_t v93;
  unint64_t v94;
  unsigned int v95;
  unint64_t v96;

  v2 = *(void *)(a1 + 3256);
  if (*(unsigned char *)(*(void *)(a1 + 24) + 438))
  {
    v3 = *(void *)(a1 + 3096);
    if (*(void *)(a1 + 3064))
    {
      memcpy(*(void **)(a1 + 3096), *(const void **)(a1 + 3072), 0x3600uLL);
    }
    else
    {
      memcpy(*(void **)(a1 + 3096), &unk_224B19900, 0x1860uLL);
      memcpy((void *)(v3 + 6240), &unk_224B19560, 0x320uLL);
      memcpy((void *)(v3 + 7040), (char *)&unk_224B1B160 + 6208 * *(unsigned int *)(a1 + 3072), 0x1840uLL);
      *(void *)(v3 + 13504) = 0x348054007000;
      *(void *)(v3 + 13792) = 0x348054007000;
      *(_OWORD *)(v3 + 13728) = xmmword_224B198C0;
      *(_OWORD *)(v3 + 13744) = unk_224B198D0;
      *(_OWORD *)(v3 + 13760) = xmmword_224B198E0;
      *(_OWORD *)(v3 + 13776) = unk_224B198F0;
      *(_OWORD *)(v3 + 13664) = xmmword_224B19880;
      *(_OWORD *)(v3 + 13680) = unk_224B19890;
      *(_OWORD *)(v3 + 13696) = xmmword_224B198A0;
      *(_OWORD *)(v3 + 13712) = unk_224B198B0;
      *(_OWORD *)(v3 + 13648) = unk_224B198F0;
      *(_OWORD *)(v3 + 13632) = xmmword_224B198E0;
      *(_OWORD *)(v3 + 13616) = unk_224B198D0;
      *(_OWORD *)(v3 + 13600) = xmmword_224B198C0;
      *(_OWORD *)(v3 + 13584) = unk_224B198B0;
      *(_OWORD *)(v3 + 13568) = xmmword_224B198A0;
      *(_OWORD *)(v3 + 13552) = unk_224B19890;
      *(_OWORD *)(v3 + 13536) = xmmword_224B19880;
      *(_OWORD *)(v3 + 13376) = xmmword_224B19880;
      *(_OWORD *)(v3 + 13392) = unk_224B19890;
      *(_OWORD *)(v3 + 13408) = xmmword_224B198A0;
      *(_OWORD *)(v3 + 13424) = unk_224B198B0;
      *(_OWORD *)(v3 + 13440) = xmmword_224B198C0;
      *(_OWORD *)(v3 + 13456) = unk_224B198D0;
      *(_OWORD *)(v3 + 13472) = xmmword_224B198E0;
      *(_OWORD *)(v3 + 13488) = unk_224B198F0;
      *(_OWORD *)(v3 + 13296) = unk_224B198B0;
      *(_OWORD *)(v3 + 13280) = xmmword_224B198A0;
      *(_OWORD *)(v3 + 13264) = unk_224B19890;
      *(_OWORD *)(v3 + 13248) = xmmword_224B19880;
      *(_OWORD *)(v3 + 13360) = unk_224B198F0;
      *(_OWORD *)(v3 + 13344) = xmmword_224B198E0;
      *(_OWORD *)(v3 + 13328) = unk_224B198D0;
      *(_OWORD *)(v3 + 13312) = xmmword_224B198C0;
    }
  }
  *(_DWORD *)(a1 + 5560) = 0;
  v4 = *(_DWORD *)(a1 + 3124);
  if (v4 < 1) {
    goto LABEL_79;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = *(void *)(a1 + 3112);
  v88 = v2;
  do
  {
    v9 = v8 + 80 * v5;
    LODWORD(v10) = *(_DWORD *)(v9 + 72);
    LODWORD(v9) = *(_DWORD *)(v9 + 76);
    v10 = (int)v10;
    if ((int)v10 > (int)v9) {
      goto LABEL_78;
    }
    v11 = *(char **)(v8 + 80 * v5);
    v12 = *(void *)(v8 + 80 * v5 + 8);
    v13 = 14624 * (int)v10 + 14584;
    v89 = v5;
    do
    {
      if (v9 == v10)
      {
        v14 = v11;
        v96 = v12;
      }
      else
      {
        v15 = *(unsigned __int8 *)(*(void *)(a1 + 24) + 441);
        v16 = v12 >= v15;
        v12 -= v15;
        if (!v16) {
          return 4294967274;
        }
        if (*(unsigned char *)(*(void *)(a1 + 24) + 441))
        {
          v17 = 0;
          v18 = 0;
          v19 = v15 - 1;
          v20 = 8 * v15;
          v21 = v11;
          do
          {
            v22 = *v21++;
            v18 |= (v22 << v17);
            v17 += 8;
          }
          while (v20 != v17);
          v11 += v19 + 1;
        }
        else
        {
          v18 = 0;
        }
        v96 = v18 + 1;
        if (v18 + 1 > v12) {
          return 4294967274;
        }
        v14 = v11;
      }
      if (*(_DWORD *)(v2 + 8) < 2u) {
        v23 = 0;
      }
      else {
        v23 = *(_DWORD *)(*(void *)(a1 + 4424) + 4 * v10);
      }
      v24 = *(void *)(a1 + 8);
      v25 = (unsigned __int8 *)&unk_224B176D8 + 2 * *(unsigned int *)(a1 + 2168);
      v26 = *(void *)(a1 + 4384);
      v93 = v13;
      v94 = v12;
      v90 = *(unsigned char *)(v24 + 392) == 0;
      if (v26) {
        v27 = v26 + ((v25[1] * (unint64_t)v23) >> 3);
      }
      else {
        v27 = 0;
      }
      v28 = *(void *)(a1 + 24);
      v29 = *(unsigned __int16 *)(v28 + 450 + 2 * v6);
      v30 = *(unsigned __int16 *)(v28 + 450 + 2 * (v6 + 1));
      v28 += 580;
      v95 = *(unsigned __int16 *)(v28 + 2 * v7);
      v31 = *(unsigned __int16 *)(v28 + 2 * (v7 + 1));
      v32 = *(void *)(a1 + 3264);
      v33 = *(_DWORD *)(a1 + 3468);
      v34 = *(void *)(a1 + 4368);
      v35 = *(void *)(a1 + 4392);
      *(void *)(v32 + 14624 * v10 + 13896) = v27;
      if (v34) {
        v36 = v34 + (((*v25 * (unint64_t)v23) >> 5) & 0x7FFFFFFFELL);
      }
      else {
        v36 = 0;
      }
      *(void *)(v32 + 14624 * v10 + 13904) = v36;
      if (v35) {
        v37 = v35 + ((*v25 * (unint64_t)v23) >> (*(unsigned char *)(v24 + 32) == 0));
      }
      else {
        v37 = 0;
      }
      *(void *)(v32 + 14624 * v10 + 13912) = v37;
      if (v26) {
        v26 += (v25[1] * (unint64_t)v23) >> 3;
      }
      *(void *)(v32 + 14624 * v10 + 13920) = v26;
      if (v34) {
        v38 = v34 + (((*v25 * (unint64_t)v23) >> 5) & 0x7FFFFFFFELL);
      }
      else {
        v38 = 0;
      }
      *(void *)(v32 + 14624 * v10 + 13928) = v38;
      if (v35) {
        v39 = v35 + ((*v25 * (unint64_t)v23) >> (*(unsigned char *)(v24 + 32) == 0));
      }
      else {
        v39 = 0;
      }
      v40 = v32 + 14624 * v10;
      *(void *)(v40 + 13936) = v39;
      v91 = v7 + 1;
      v92 = v6 + 1;
      if (*(void *)(a1 + 3064))
      {
        v41 = v31;
        v42 = v30;
        v43 = v33;
        v44 = v7;
        v45 = v6;
        memcpy((void *)(v32 + 14624 * v10), *(const void **)(a1 + 3072), 0x3600uLL);
        v46 = v43;
        v47 = v42;
        v48 = v41;
        v7 = v44;
        v5 = v89;
      }
      else
      {
        v85 = v30;
        v86 = v31;
        v84 = v33;
        v87 = v7;
        v45 = v6;
        memcpy((void *)(v32 + 14624 * v10), &unk_224B19900, 0x1860uLL);
        memcpy((void *)(v40 + 6240), &unk_224B19560, 0x320uLL);
        memcpy((void *)(v40 + 7040), (char *)&unk_224B1B160 + 6208 * *(unsigned int *)(a1 + 3072), 0x1840uLL);
        v46 = v84;
        v47 = v85;
        v48 = v86;
        v7 = v87;
        v5 = v89;
        *(void *)(v40 + 13504) = 0x348054007000;
        *(void *)(v40 + 13792) = 0x348054007000;
        *(_OWORD *)(v40 + 13728) = xmmword_224B198C0;
        *(_OWORD *)(v40 + 13744) = unk_224B198D0;
        *(_OWORD *)(v40 + 13760) = xmmword_224B198E0;
        *(_OWORD *)(v40 + 13776) = unk_224B198F0;
        *(_OWORD *)(v40 + 13664) = xmmword_224B19880;
        *(_OWORD *)(v40 + 13680) = unk_224B19890;
        *(_OWORD *)(v40 + 13696) = xmmword_224B198A0;
        *(_OWORD *)(v40 + 13712) = unk_224B198B0;
        *(_OWORD *)(v40 + 13648) = unk_224B198F0;
        *(_OWORD *)(v40 + 13632) = xmmword_224B198E0;
        *(_OWORD *)(v40 + 13616) = unk_224B198D0;
        *(_OWORD *)(v40 + 13600) = xmmword_224B198C0;
        *(_OWORD *)(v40 + 13584) = unk_224B198B0;
        *(_OWORD *)(v40 + 13568) = xmmword_224B198A0;
        *(_OWORD *)(v40 + 13552) = unk_224B19890;
        *(_OWORD *)(v40 + 13536) = xmmword_224B19880;
        *(_OWORD *)(v40 + 13376) = xmmword_224B19880;
        *(_OWORD *)(v40 + 13392) = unk_224B19890;
        *(_OWORD *)(v40 + 13408) = xmmword_224B198A0;
        *(_OWORD *)(v40 + 13424) = unk_224B198B0;
        *(_OWORD *)(v40 + 13440) = xmmword_224B198C0;
        *(_OWORD *)(v40 + 13456) = unk_224B198D0;
        *(_OWORD *)(v40 + 13472) = xmmword_224B198E0;
        *(_OWORD *)(v40 + 13488) = unk_224B198F0;
        *(_OWORD *)(v40 + 13296) = unk_224B198B0;
        *(_OWORD *)(v40 + 13280) = xmmword_224B198A0;
        *(_OWORD *)(v40 + 13264) = unk_224B19890;
        *(_OWORD *)(v40 + 13248) = xmmword_224B19880;
        *(_OWORD *)(v40 + 13360) = unk_224B198F0;
        *(_OWORD *)(v40 + 13344) = xmmword_224B198E0;
        *(_OWORD *)(v40 + 13328) = unk_224B198D0;
        *(_OWORD *)(v40 + 13312) = xmmword_224B198C0;
      }
      v2 = v88;
      v49 = 0;
      v50 = v32 + 14624 * v10;
      *(_DWORD *)(v50 + 14056) = *(unsigned __int8 *)(*(void *)(a1 + 24) + 712);
      *(_DWORD *)(v50 + 14060) = 0;
      v51 = (char **)(v50 + 13824);
      v52 = *(void *)(a1 + 24);
      v53 = *(unsigned __int8 *)(v52 + 267);
      *(void *)(v50 + 13824) = v14;
      v11 = &v14[v96];
      *(void *)(v50 + 13832) = &v14[v96];
      *(_DWORD *)(v50 + 13856) = v53 == 0;
      v54 = (void *)(v50 + 13840);
      *(void *)(v50 + 13840) = 0;
      *(void *)(v50 + 13848) = 0xFFFFFFF100008000;
      v55 = 55;
      while (v14 < v11)
      {
        v56 = *v14++;
        v49 |= (unint64_t)~v56 << v55;
        v57 = v55 - 8;
        v58 = v55 > 7;
        v55 -= 8;
        if (!v58) {
          goto LABEL_48;
        }
      }
      v49 |= ~(-256 << v55);
      v57 = v55;
LABEL_48:
      v59 = (_DWORD *)(v32 + 14624 * v10);
      *v54 = v49;
      v59[3463] = 40 - v57;
      *v51 = v14;
      v59[3471] = v7;
      v59[3470] = v45;
      v59[3466] = v29 << v46;
      v60 = v47 << v46;
      if (v47 << v46 >= *(_DWORD *)(a1 + 3448)) {
        v60 = *(_DWORD *)(a1 + 3448);
      }
      v59[3467] = v60;
      v61 = v95 << v46;
      v59[3468] = v95 << v46;
      v62 = v48 << v46;
      if (v48 << v46 >= *(_DWORD *)(a1 + 3452)) {
        v62 = *(_DWORD *)(a1 + 3452);
      }
      v59[3469] = v62;
      if (*(_DWORD *)(v52 + 236) == *(_DWORD *)(v52 + 240))
      {
        v63 = (v29 >> v90) + *(_DWORD *)(a1 + 3456) * (v61 >> 5);
        v64 = (v61 >> 3) & 2 | (v29 << v46 >> 4) & 1;
      }
      else
      {
        v63 = *(_DWORD *)(a1 + 3476) * (v61 >> 5);
        v64 = (v61 >> 3) & 2;
      }
      v65 = 0;
      v66 = v59 + 3466;
      v67 = v32 + v93;
      v68 = (v64 | (8 * v64)) + 108 * v63;
      do
      {
        if (((*(_DWORD *)(a1 + 5352) >> v65) & 1) == 0) {
          goto LABEL_67;
        }
        v69 = *(void *)(a1 + 24);
        if (*(_DWORD *)(v69 + 236) == *(_DWORD *)(v69 + 240))
        {
          v70 = *(void *)(a1 + 4448) + v68;
LABEL_66:
          *(void *)(v67 + 8 * v65) = v70;
          *(unsigned char *)(v70 + 4) = 3;
          *(unsigned char *)(*(void *)(v67 + 8 * v65) + 5) = -7;
          *(unsigned char *)(*(void *)(v67 + 8 * v65) + 6) = 15;
          *(unsigned char *)(*(void *)(v67 + 8 * v65) + 1) = 3;
          *(unsigned char *)(*(void *)(v67 + 8 * v65) + 2) = -7;
          *(unsigned char *)(*(void *)(v67 + 8 * v65) + 3) = 15;
          *(unsigned char *)(*(void *)(v67 + 8 * v65) + 7) = -32;
          *(unsigned char *)(*(void *)(v67 + 8 * v65) + 8) = 31;
          goto LABEL_67;
        }
        if (v65) {
          v71 = *(_DWORD *)(a1 + 2168) != 3;
        }
        else {
          v71 = 0;
        }
        v72 = *(unsigned __int8 *)(v69 + 416);
        if (v65) {
          ++v69;
        }
        v73 = ((8 << *(unsigned char *)(v69 + 880)) + ((4 * v72 * *v66) >> v71) - 1) >> (*(unsigned char *)(v69 + 880) + 3) << (*(unsigned char *)(v69 + 880) + v71);
        if (v73 >> 7 < *(_DWORD *)(a1 + 3476))
        {
          v70 = *(void *)(a1 + 4448)
              + 108 * ((v73 >> 7) + v63)
              + 36 * v65
              + ((((v73 >> 6) & 1) + v64) | (8 * (((v73 >> 6) & 1) + v64)));
          goto LABEL_66;
        }
LABEL_67:
        ++v65;
        v68 += 36;
      }
      while (v65 != 3);
      if (*(_DWORD *)(*(void *)(a1 + 3256) + 24) >= 2u) {
        *(int32x2_t *)(v32 + 14624 * v10 + 13888) = vdup_n_s32(v95);
      }
      v74 = *(void *)(a1 + 24);
      if (v92 == *(unsigned __int8 *)(v74 + 445))
      {
        v7 = v91;
        v6 = 0;
      }
      else
      {
        v6 = v92;
      }
      if (v10 == *(unsigned __int16 *)(v74 + 710) && *(unsigned char *)(v74 + 438)) {
        *(_DWORD *)(a1 + 5560) = 1;
      }
      v12 = v94 - v96;
      v8 = *(void *)(a1 + 3112);
      v9 = *(int *)(v8 + 80 * v5 + 76);
      v13 = v93 + 14624;
      v58 = v10++ < v9;
    }
    while (v58);
    v4 = *(_DWORD *)(a1 + 3124);
LABEL_78:
    ++v5;
  }
  while (v5 < v4);
LABEL_79:
  if (*(_DWORD *)(v2 + 24) >= 2u)
  {
    v75 = *(_DWORD *)(v2 + 8);
    v76 = *(void *)(a1 + 24);
    v77 = *(_DWORD *)(a1 + 3456) * *(unsigned __int8 *)(v76 + 449);
    if (v77 << (v75 > 1) >= 1)
    {
      v78 = 0;
      v79 = 0;
      do
      {
        v80 = (*(_DWORD *)(v76 + 232) & 1) == 0;
        if (v79 < v77) {
          v81 = 1;
        }
        else {
          v81 = 2;
        }
        if (v75 <= 1) {
          v82 = 0;
        }
        else {
          v82 = v81;
        }
        sub_224AD4BD0((_OWORD *)(*(void *)(a1 + 4032) + v78), v80, v82);
        ++v79;
        v76 = *(void *)(a1 + 24);
        v77 = *(_DWORD *)(a1 + 3456) * *(unsigned __int8 *)(v76 + 449);
        v78 += 624;
      }
      while (v79 < v77 << (v75 > 1));
    }
  }
  return 0;
}

void sub_224AE1BC0(uint64_t a1, int a2)
{
  int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 3256);
  if (*(void *)(a1 + 2392)) {
    *(_DWORD *)(a1 + 5564) = 0;
  }
  if (a2)
  {
    if (*(_DWORD *)(v4 + 8) >= 2u)
    {
      v5 = *(void **)(a1 + 4392);
      if (v5) {
        bzero(v5, (*(int *)(a1 + 4416) & 0x3FFFFFFFFFFFFLL) << 13);
      }
    }
  }
  uint64_t v6 = 2744;
  uint64_t v7 = a1;
  do
  {
    if (*(void *)(v7 + 40))
    {
      if (!v2)
      {
        if (*(_DWORD *)(v4 + 8) >= 2u
          && *(_DWORD *)(v4 + 63072)
          && (unsigned int v8 = atomic_load((unsigned int *)(*(void *)(v7 + 320) + 4)), v8 == -2))
        {
          atomic_store(1u, (unsigned int *)(a1 + 5564));
          atomic_store(0xFFFFFFFE, (unsigned int *)(*(void *)(a1 + 2664) + 4));
          int v2 = -22;
        }
        else
        {
          int v2 = 0;
        }
      }
      sub_224AFAD94(v7 + 32);
      *(void *)(v7 + 320) = 0;
    }
    sub_224AF722C((uint64_t *)(a1 + v6));
    v7 += 296;
    v6 += 8;
  }
  while (v6 != 2800);
  sub_224AFAD94(a1 + 2104);
  sub_224AFAD94(a1 + 2376);
  *(void *)(a1 + 2664) = 0;
  *(void *)(a1 + 3080) = 0;
  *(void *)(a1 + 3072) = 0;
  sub_224AF722C((uint64_t *)(a1 + 3064));
  uint64_t v9 = *(void *)(a1 + 24);
  if (v9 && *(unsigned char *)(v9 + 438))
  {
    v10 = *(unsigned int **)(a1 + 3104);
    if (v10)
    {
      if (v2) {
        unsigned int v11 = 2147483646;
      }
      else {
        unsigned int v11 = 1;
      }
      atomic_store(v11, v10);
    }
    *(void *)(a1 + 3104) = 0;
    *(void *)(a1 + 3096) = 0;
    sub_224AF722C((uint64_t *)(a1 + 3088));
  }
  sub_224AF722C((uint64_t *)(a1 + 2800));
  sub_224AF722C((uint64_t *)(a1 + 2808));
  sub_224AF722C((uint64_t *)(a1 + 2672));
  sub_224AF722C((uint64_t *)a1);
  sub_224AF722C((uint64_t *)(a1 + 16));
  if (*(int *)(a1 + 3124) >= 1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      sub_224AC7180(*(void *)(a1 + 3112) + v12);
      ++v13;
      v12 += 80;
    }
    while (v13 < *(int *)(a1 + 3124));
  }
  *(_DWORD *)(a1 + 5556) = v2;
}

uint64_t sub_224AE1D8C(uint64_t a1)
{
  return sub_224AFC5B0(*(void *)(a1 + 32));
}

uint64_t sub_224AE1D94(uint64_t a1)
{
  return sub_224AFC5B0(*(void *)(a1 + 32));
}

uint64_t sub_224AE1D9C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8, int a9, int a10)
{
  signed int v10 = a7 - 1;
  int32x2_t v11 = vdup_n_s32(a7 - 1);
  uint64_t v12 = a4 >> 1;
  unint64_t v13 = a2 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    if (a5 >= 1)
    {
      uint64_t v14 = 0;
      signed int v15 = -1;
      int v16 = a9;
      do
      {
        v17 = (char *)&unk_224B18D88 + 8 * (v16 >> 8);
        int32x2_t v18 = vdup_n_s32(v15);
        int8x8_t v19 = vbic_s8((int8x8_t)vmin_s32(vadd_s32(v18, (int32x2_t)0xFFFFFFFEFFFFFFFDLL), v11), (int8x8_t)vcgt_s32((int32x2_t)0x200000003, v18));
        int v20 = *(unsigned __int16 *)(a3 + 2 * v19.i32[1]);
        int v21 = *(unsigned __int16 *)(a3 + 2 * v19.i32[0]) * *v17;
        if (v15 - 1 >= v10) {
          int v22 = v10;
        }
        else {
          int v22 = v15 - 1;
        }
        if (v15 >= v10) {
          signed int v23 = v10;
        }
        else {
          signed int v23 = v15;
        }
        if (v15 <= 0) {
          int v22 = 0;
        }
        int v24 = *(unsigned __int16 *)(a3 + 2 * v22);
        if (v15 < 0) {
          signed int v23 = 0;
        }
        int8x8_t v25 = vbic_s8((int8x8_t)vmin_s32(vadd_s32(v18, (int32x2_t)0x200000001), v11), (int8x8_t)vcgt_s32((int32x2_t)0xFFFFFFFEFFFFFFFFLL, v18));
        int8x8_t v26 = vbic_s8((int8x8_t)vmin_s32(vadd_s32(v18, (int32x2_t)0x400000003), v11), (int8x8_t)vcgt_s32((int32x2_t)0xFFFFFFFCFFFFFFFDLL, v18));
        int v27 = v21
            + v20 * v17[1]
            + v24 * v17[2]
            + *(unsigned __int16 *)(a3 + 2 * v23) * v17[3]
            + *(unsigned __int16 *)(a3 + 2 * v25.i32[0]) * v17[4]
            + *(unsigned __int16 *)(a3 + 2 * v25.i32[1]) * v17[5]
            + *(unsigned __int16 *)(a3 + 2 * v26.i32[0]) * v17[6]
            + *(unsigned __int16 *)(a3 + 2 * v26.i32[1]) * v17[7];
        int v28 = (64 - v27) >> 7;
        if (v28 >= a10) {
          LOWORD(v28) = a10;
        }
        if (v27 <= 64) {
          __int16 v29 = v28;
        }
        else {
          __int16 v29 = 0;
        }
        *(_WORD *)(result + v14) = v29;
        int v30 = v16 + a8;
        v15 += v30 >> 14;
        int v16 = v30 & 0x3FFF;
        v14 += 2;
      }
      while (2 * a5 != v14);
    }
    a3 += 2 * v12;
    result += v13;
    --a6;
  }
  while (a6);
  return result;
}

void *sub_224AE1F38(void *result, int a2, int a3, int a4, int a5, int a6, char *__dst, uint64_t a8, uint64_t a9, uint64_t a10)
{
  signed int v10 = __dst;
  int v11 = result - 1;
  if (-a5 < (int)result - 1) {
    int v12 = -a5;
  }
  else {
    int v12 = result - 1;
  }
  if (a5 <= 0) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  v40 = result;
  int v14 = result - a3 + a5;
  if (v14 < v11) {
    int v11 = result - a3 + a5;
  }
  if (v14 >= 0) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = 0;
  }
  int v16 = a2 - 1;
  if (-a6 < a2 - 1) {
    int v17 = -a6;
  }
  else {
    int v17 = a2 - 1;
  }
  if (a6 <= 0) {
    int v18 = v17;
  }
  else {
    int v18 = 0;
  }
  int v19 = a2 - a4 + a6;
  if (v19 < v16) {
    int v16 = a2 - a4 + a6;
  }
  if (v19 >= 0) {
    int v20 = v16;
  }
  else {
    int v20 = 0;
  }
  uint64_t v38 = a8 >> 1;
  __src = &__dst[2 * (a8 >> 1) * v18];
  uint64_t v21 = 2 * (a8 >> 1);
  int v45 = a2 - (v20 + v18);
  if (v45 >= 1)
  {
    int v22 = 0;
    uint64_t v23 = v13;
    int v24 = a4 - 1;
    if (a6 < a4 - 1) {
      int v24 = a6;
    }
    if (a6 < 0) {
      int v24 = 0;
    }
    uint64_t v25 = (a10 >> 1) * v24;
    int v26 = a3 - 1;
    if (a5 < a3 - 1) {
      int v26 = a5;
    }
    if (a5 < 0) {
      int v26 = 0;
    }
    int v27 = &__dst[2 * (a8 >> 1) * v18];
    int v28 = (char *)(a9 + 2 * (v25 + v26));
    int v29 = result - v23 - v15;
    size_t __n = 2 * v29;
    uint64_t v44 = 2 * (a8 >> 1);
    uint64_t v30 = 2 * v23;
    int v46 = v23;
    uint64_t v41 = 2 * v23 + 2 * v29;
    uint64_t v42 = (int)result - (int)v15 - 1;
    uint64_t v31 = v23;
    do
    {
      result = memcpy(&v27[2 * v31], v28, __n);
      if (v31 && v46 >= 1)
      {
        uint64_t v32 = 0;
        __int16 v33 = *(_WORD *)&v27[2 * v31];
        do
        {
          *(_WORD *)&v27[v32] = v33;
          v32 += 2;
        }
        while (v30 != v32);
      }
      if ((int)v15 > 0)
      {
        uint64_t v34 = v41;
        __int16 v35 = *(_WORD *)&v27[2 * v42];
        uint64_t v36 = v15;
        do
        {
          *(_WORD *)&v27[v34] = v35;
          v34 += 2;
          --v36;
        }
        while (v36);
      }
      uint64_t v21 = v44;
      v28 += 2 * (a10 >> 1);
      v27 += v44;
      ++v22;
    }
    while (v22 != v45);
  }
  size_t v37 = 2 * (void)v40;
  if (v18 >= 1)
  {
    do
    {
      result = memcpy(v10, __src, v37);
      v10 += v21;
      --v18;
    }
    while (v18);
  }
  if (v20 >= 1)
  {
    do
    {
      result = memcpy(&v10[2 * v38 * v45], &v10[v38 * (2 * v45 - 2)], v37);
      v10 += v21;
      --v20;
    }
    while (v20);
  }
  return result;
}

uint64_t sub_224AE2190(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, __int16 *a5, int a6, int a7, unsigned int a8, double a9, double a10, int32x4_t a11)
{
  int v11 = 0;
  uint64_t v40 = *MEMORY[0x263EF8340];
  int v12 = (_WORD *)(a3 - 6 * (a4 >> 1));
  char v13 = 25 - __clz(a8);
  int v14 = *a5;
  int v15 = a5[1];
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFFFFELL;
  int v17 = a6 + 512;
  int v18 = v39;
  do
  {
    uint64_t v19 = 0;
    int8x8_t v20 = *(int8x8_t *)(v12 - 3);
    unsigned __int16 v21 = v12[1];
    unsigned __int16 v22 = v12[2];
    int v23 = v17;
    LOWORD(v24) = v12[3];
    do
    {
      int32x4_t v25 = (int32x4_t)vmovl_u16((uint16x4_t)v20);
      int v26 = v21;
      int8x8_t v20 = vext_s8(v20, v20, 2uLL);
      v20.i16[3] = v21;
      int v27 = v22;
      unsigned __int16 v21 = v22;
      unsigned __int16 v22 = v24;
      int v28 = (char *)&unk_224B18780 + 8 * (v23 >> 10);
      a11.i32[0] = *((_DWORD *)v28 + 128);
      a11 = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a11.i8));
      int v29 = v28[516];
      int v30 = v28[517];
      int v31 = v22 * v28[518];
      int v32 = v28[519];
      int v24 = (unsigned __int16)v12[v19 + 4];
      *(_WORD *)&v18[v19 * 2] = (int)(vaddvq_s32(vmulq_s32(v25, a11))
                                    + v26 * v29
                                    + v31
                                    + v27 * v30
                                    + ((1 << v13) >> 1)
                                    + v24 * v32) >> v13;
      ++v19;
      v23 += v14;
    }
    while (v19 != 8);
    int v12 = (_WORD *)((char *)v12 + v16);
    v18 += 16;
    ++v11;
    v17 += v15;
  }
  while (v11 != 15);
  int v33 = 0;
  uint64_t v34 = 64;
  do
  {
    uint64_t v35 = 0;
    int v37 = a7;
    do
    {
      uint64_t v38 = (char *)&unk_224B18780 + 8 * ((v37 + 512) >> 10);
      uint64_t v36 = &v39[v34];
      *(_WORD *)(result + v35) = ((*(__int16 *)&v36[v35 - 48] * v38[513]
                                               + *(__int16 *)&v36[v35 - 64] * v38[512]
                                               + *(__int16 *)&v36[v35 - 32] * v38[514]
                                               + *(__int16 *)&v36[v35 - 16] * v38[515]
                                               + *(__int16 *)&v36[v35] * v38[516]
                                               + *(__int16 *)&v36[v35 + 16] * v38[517]
                                               + *(__int16 *)&v36[v35 + 32] * v38[518]
                                               + *(__int16 *)&v36[v35 + 48] * v38[519]
                                               + 64) >> 7)
                               - 0x2000;
      v37 += a5[2];
      v35 += 2;
    }
    while (v35 != 16);
    ++v33;
    a7 += a5[3];
    result += 2 * a2;
    v34 += 16;
  }
  while (v33 != 8);
  return result;
}

uint64_t sub_224AE23C8(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, __int16 *a5, int a6, int a7, signed int a8, double a9, double a10, int32x4_t a11)
{
  int v11 = 0;
  uint64_t v46 = *MEMORY[0x263EF8340];
  char v12 = __clz(a8);
  char v13 = (_WORD *)(a3 - 6 * (a4 >> 1));
  int v14 = *a5;
  int v15 = a5[1];
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFFFFELL;
  int v17 = a6 + 512;
  int v18 = v45;
  do
  {
    uint64_t v19 = 0;
    int8x8_t v20 = *(int8x8_t *)(v13 - 3);
    unsigned __int16 v21 = v13[1];
    unsigned __int16 v22 = v13[2];
    int v23 = v17;
    LOWORD(v24) = v13[3];
    do
    {
      int32x4_t v25 = (int32x4_t)vmovl_u16((uint16x4_t)v20);
      int v26 = v21;
      int8x8_t v20 = vext_s8(v20, v20, 2uLL);
      v20.i16[3] = v21;
      int v27 = v22;
      unsigned __int16 v21 = v22;
      unsigned __int16 v22 = v24;
      int v28 = (char *)&unk_224B18780 + 8 * (v23 >> 10);
      a11.i32[0] = *((_DWORD *)v28 + 128);
      a11 = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)a11.i8));
      int v29 = v28[516];
      int v30 = v28[517];
      int v31 = v22 * v28[518];
      int v32 = v28[519];
      int v24 = (unsigned __int16)v13[v19 + 4];
      *(_WORD *)&v18[v19 * 2] = (int)(vaddvq_s32(vmulq_s32(v25, a11))
                                    + v26 * v29
                                    + v31
                                    + v27 * v30
                                    + ((1 << (25 - v12)) >> 1)
                                    + v24 * v32) >> (25 - v12);
      ++v19;
      v23 += v14;
    }
    while (v19 != 8);
    char v13 = (_WORD *)((char *)v13 + v16);
    v18 += 16;
    ++v11;
    v17 += v15;
  }
  while (v11 != 15);
  int v33 = 0;
  char v34 = v12 - 11;
  unint64_t v36 = a2 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v37 = 64;
  do
  {
    uint64_t v38 = 0;
    int v40 = a7;
    do
    {
      uint64_t v41 = (char *)&unk_224B18780 + 8 * ((v40 + 512) >> 10);
      unsigned int v35 = (1 << v34) >> 1;
      v39 = &v45[v37];
      int v42 = (int)(v35
                + *(__int16 *)&v39[v38 - 64] * v41[512]
                + *(__int16 *)&v39[v38 - 48] * v41[513]
                + *(__int16 *)&v39[v38 - 32] * v41[514]
                + *(__int16 *)&v39[v38 - 16] * v41[515]
                + *(__int16 *)&v39[v38] * v41[516]
                + *(__int16 *)&v39[v38 + 16] * v41[517]
                + *(__int16 *)&v39[v38 + 32] * v41[518]
                + *(__int16 *)&v39[v38 + 48] * v41[519]) >> v34;
      if (v42 >= a8) {
        LOWORD(v43) = a8;
      }
      else {
        int v43 = (int)(v35
      }
                  + *(__int16 *)&v39[v38 - 64] * v41[512]
                  + *(__int16 *)&v39[v38 - 48] * v41[513]
                  + *(__int16 *)&v39[v38 - 32] * v41[514]
                  + *(__int16 *)&v39[v38 - 16] * v41[515]
                  + *(__int16 *)&v39[v38] * v41[516]
                  + *(__int16 *)&v39[v38 + 16] * v41[517]
                  + *(__int16 *)&v39[v38 + 32] * v41[518]
                  + *(__int16 *)&v39[v38 + 48] * v41[519]) >> v34;
      if (v42 >= 0) {
        __int16 v44 = v43;
      }
      else {
        __int16 v44 = 0;
      }
      *(_WORD *)(result + v38) = v44;
      v40 += a5[2];
      v38 += 2;
    }
    while (v38 != 16);
    ++v33;
    a7 += a5[3];
    result += v36;
    v37 += 16;
  }
  while (v33 != 8);
  return result;
}

uint64_t sub_224AE2618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, signed int a9)
{
  return sub_224AE2648(a1, a2, a3, a4, a5, a6, a7, a8, 1, 1, a9);
}

uint64_t sub_224AE2648(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, int a9, int a10, signed int a11)
{
  char v11 = __clz(a11);
  int v12 = 32 << (v11 - 18);
  char v13 = v11 - 12;
  int v14 = v12 + 0x80000;
  uint64_t v15 = a2 >> 1;
  do
  {
    if (a5 >= 1)
    {
      LODWORD(v16) = 0;
      do
      {
        int v17 = *(__int16 *)(a3 + 2 * (int)v16);
        int v18 = *(__int16 *)(a4 + 2 * (int)v16);
        uint64_t v19 = (int)v16;
        int v20 = v17 - v18;
        if (v17 - v18 < 0) {
          int v20 = v18 - v17;
        }
        signed int v21 = (v20 + 32) >> 10;
        if (v21 >= 26) {
          signed int v21 = 26;
        }
        char v22 = v21 + 38;
        int v23 = (v14 + (26 - v21) * v18 + (v21 + 38) * v17) >> v13;
        if (v23 >= a11) {
          __int16 v24 = a11;
        }
        else {
          __int16 v24 = v23;
        }
        if (v23 >= 0) {
          __int16 v25 = v24;
        }
        else {
          __int16 v25 = 0;
        }
        *(_WORD *)(result + 2 * (int)v16) = v25;
        if (a9)
        {
          uint64_t v16 = (int)v16 + 1;
          int v26 = *(__int16 *)(a3 + 2 * (v19 + 1));
          int v27 = *(__int16 *)(a4 + 2 * (v19 + 1));
          int v28 = v26 - v27;
          if (v26 - v27 < 0) {
            int v28 = v27 - v26;
          }
          signed int v29 = (v28 + 32) >> 10;
          if (v29 >= 26) {
            int v30 = 26;
          }
          else {
            int v30 = v29;
          }
          int v31 = v30 + 38;
          int v32 = (v14 + (26 - v30) * v27 + (v30 + 38) * v26) >> v13;
          if (v32 >= a11) {
            __int16 v33 = a11;
          }
          else {
            __int16 v33 = v32;
          }
          if (v32 >= 0) {
            __int16 v34 = v33;
          }
          else {
            __int16 v34 = 0;
          }
          *(_WORD *)(result + 2 * v16) = v34;
          if ((a6 & a10) != 0)
          {
            int v35 = (int)v16 >> 1;
            unsigned int v36 = (v21 - a8 + *(unsigned __int8 *)(a7 + ((int)v16 >> 1)) + v31 + 40) >> 2;
          }
          else
          {
            if (a10) {
              LOBYTE(v36) = v31 + v22;
            }
            else {
              unsigned int v36 = (v21 - a8 + v31 + 39) >> 1;
            }
            int v35 = (int)v16 >> 1;
          }
          *(unsigned char *)(a7 + v35) = v36;
        }
        else
        {
          *(unsigned char *)(a7 + (int)v16) = v22;
        }
        LODWORD(v16) = v16 + 1;
      }
      while ((int)v16 < a5);
    }
    a3 += 2 * a5;
    BOOL v37 = (a6 & 1) != 0 || a10 == 0;
    a4 += 2 * a5;
    result += 2 * v15;
    if (v37) {
      uint64_t v38 = a5 >> a9;
    }
    else {
      uint64_t v38 = 0;
    }
    a7 += v38;
    --a6;
  }
  while (a6);
  return result;
}

uint64_t sub_224AE27C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, signed int a9)
{
  return sub_224AE2648(a1, a2, a3, a4, a5, a6, a7, a8, 1, 0, a9);
}

uint64_t sub_224AE27F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, signed int a9)
{
  return sub_224AE2648(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9);
}

uint64_t sub_224AE2820(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  v5 = &byte_224B18740[a5];
  int v6 = (3 * a5) >> 2;
  do
  {
    int v8 = *v5++;
    int v7 = v8;
    if (a4 >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        *(_WORD *)(result + v9) = (*(unsigned __int16 *)(a3 + v9) * v7
                                 + (64 - v7) * *(unsigned __int16 *)(result + v9)
                                 + 32) >> 6;
        v9 += 2;
      }
      while (2 * a4 != v9);
    }
    a3 += 2 * a4;
    result += a2 & 0xFFFFFFFFFFFFFFFELL;
    --v6;
  }
  while (v6);
  return result;
}

uint64_t sub_224AE2894(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  LODWORD(v5) = (3 * a4) >> 2;
  if ((int)v5 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v5;
  }
  do
  {
    if (a4 >= 2)
    {
      for (uint64_t i = 0; i != v5; ++i)
        *(_WORD *)(result + 2 * i) = ((64 - byte_224B18740[a4 + i]) * *(unsigned __int16 *)(result + 2 * i)
                                    + *(unsigned __int16 *)(a3 + 2 * i) * byte_224B18740[a4 + i]
                                    + 32) >> 6;
    }
    a3 += 2 * a4;
    result += a2 & 0xFFFFFFFFFFFFFFFELL;
    --a5;
  }
  while (a5);
  return result;
}

uint64_t sub_224AE290C(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  do
  {
    if (a4 >= 1)
    {
      for (uint64_t i = 0; i != a4; ++i)
        *(_WORD *)(result + 2 * i) = ((64 - *(unsigned __int8 *)(a6 + i)) * *(unsigned __int16 *)(result + 2 * i)
                                    + *(unsigned __int16 *)(a3 + 2 * i) * *(unsigned __int8 *)(a6 + i)
                                    + 32) >> 6;
    }
    a6 += a4;
    a3 += 2 * a4;
    result += a2 & 0xFFFFFFFFFFFFFFFELL;
    --a5;
  }
  while (a5);
  return result;
}

uint64_t sub_224AE2974(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, signed int a8)
{
  char v8 = __clz(a8);
  int v9 = 32 << (v8 - 18);
  char v10 = v8 - 12;
  int v11 = v9 + 0x80000;
  uint64_t v12 = 2 * a5;
  do
  {
    if (a5 >= 1)
    {
      for (uint64_t i = 0; i != a5; *(_WORD *)(result + 2 * i++) = v16)
      {
        int v14 = (v11
             + *(unsigned __int8 *)(a7 + i) * *(__int16 *)(a3 + 2 * i)
             + (64 - *(unsigned __int8 *)(a7 + i)) * *(__int16 *)(a4 + 2 * i)) >> v10;
        if (v14 >= a8) {
          LOWORD(v15) = a8;
        }
        else {
          int v15 = (v11
        }
               + *(unsigned __int8 *)(a7 + i) * *(__int16 *)(a3 + 2 * i)
               + (64 - *(unsigned __int8 *)(a7 + i)) * *(__int16 *)(a4 + 2 * i)) >> v10;
        if (v14 >= 0) {
          __int16 v16 = v15;
        }
        else {
          __int16 v16 = 0;
        }
      }
    }
    a7 += a5;
    result += a2 & 0xFFFFFFFFFFFFFFFELL;
    a4 += v12;
    a3 += v12;
    --a6;
  }
  while (a6);
  return result;
}

uint64_t sub_224AE2A0C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, signed int a8)
{
  char v8 = __clz(a8);
  char v9 = v8 - 18;
  char v10 = v8 - 14;
  int v11 = (8 << v9) + 0x20000;
  uint64_t v12 = 2 * a5;
  do
  {
    if (a5 >= 1)
    {
      uint64_t v13 = 0;
      do
      {
        int v14 = (v11 + *(__int16 *)(a3 + v13) * a7 + (16 - a7) * *(__int16 *)(a4 + v13)) >> v10;
        if (v14 >= a8) {
          LOWORD(v15) = a8;
        }
        else {
          int v15 = (v11 + *(__int16 *)(a3 + v13) * a7 + (16 - a7) * *(__int16 *)(a4 + v13)) >> v10;
        }
        if (v14 >= 0) {
          __int16 v16 = v15;
        }
        else {
          __int16 v16 = 0;
        }
        *(_WORD *)(result + v13) = v16;
        v13 += 2;
      }
      while (2 * a5 != v13);
    }
    result += a2 & 0xFFFFFFFFFFFFFFFELL;
    a4 += v12;
    a3 += v12;
    --a6;
  }
  while (a6);
  return result;
}

uint64_t sub_224AE2A90(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, signed int a7)
{
  char v7 = __clz(a7);
  int v8 = 1 << (v7 - 18);
  char v9 = v7 - 17;
  int v10 = v8 + 0x4000;
  uint64_t v11 = 2 * a5;
  do
  {
    if (a5 >= 1)
    {
      uint64_t v12 = 0;
      do
      {
        int v13 = (v10 + *(__int16 *)(a3 + v12) + *(__int16 *)(a4 + v12)) >> v9;
        if (v13 >= a7) {
          LOWORD(v14) = a7;
        }
        else {
          int v14 = (v10 + *(__int16 *)(a3 + v12) + *(__int16 *)(a4 + v12)) >> v9;
        }
        if (v13 >= 0) {
          __int16 v15 = v14;
        }
        else {
          __int16 v15 = 0;
        }
        *(_WORD *)(result + v12) = v15;
        v12 += 2;
      }
      while (2 * a5 != v12);
    }
    result += a2 & 0xFFFFFFFFFFFFFFFELL;
    a4 += v11;
    a3 += v11;
    --a6;
  }
  while (a6);
  return result;
}

uint64_t sub_224AE2B0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v18 = v17 >> 1;
  unsigned int v19 = 22 - __clz(a10);
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v20 = ((int)(v15 + (v13 - 1) * a9) >> 10) + 2;
  signed int v21 = v28;
  do
  {
    if (v12 >= 1)
    {
      uint64_t v22 = 0;
      int v23 = 0;
      int v24 = v14;
      do
      {
        *(_WORD *)&v21[v22] = (int)(((1 << v19) >> 1)
                                  + 16 * *(unsigned __int16 *)(v11 + 2 * v23)
                                  + (*(unsigned __int16 *)(v11 + 2 * v23 + 2) - *(unsigned __int16 *)(v11 + 2 * v23))
                                  * (v24 >> 6)) >> v19;
        int v25 = v24 + v16;
        v23 += v25 >> 10;
        int v24 = v25 & 0x3FF;
        v22 += 2;
      }
      while (2 * v12 != v22);
    }
    v21 += 256;
    v11 += 2 * v18;
    --v20;
  }
  while (v20);
  int v26 = v28;
  do
  {
    if (v12 >= 1)
    {
      uint64_t v27 = 0;
      do
      {
        *(_WORD *)(result + v27) = (((*(__int16 *)&v26[v27 + 256] - *(__int16 *)&v26[v27]) * (v15 >> 6)
                                   + 16 * *(__int16 *)&v26[v27]
                                   + 8) >> 4)
                                 - 0x2000;
        v27 += 2;
      }
      while (2 * v12 != v27);
    }
    v26 += 2 * (int)(((int)(v15 + a9) >> 3) & 0xFFFFFF80);
    unsigned int v15 = (v15 + a9) & 0x3FF;
    result += 2 * v12;
    --v13;
  }
  while (v13);
  return result;
}

uint64_t sub_224AE2C94()
{
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v7 = __clz(v6);
  uint64_t v9 = v8 >> 1;
  if (v4)
  {
    char v10 = 22 - v7;
    unsigned int v11 = 1 << v10;
    if (v5)
    {
      int v12 = v3 + 1;
      int v13 = v25;
      do
      {
        if (v2 >= 1)
        {
          uint64_t v14 = 0;
          int v15 = *v1;
          do
          {
            int v16 = v1[v14 + 1];
            *(_WORD *)&v13[v14 * 2] = (int)((v11 >> 1) + 16 * v15 + (v16 - v15) * v4) >> v10;
            ++v14;
            int v15 = v16;
          }
          while (v2 != v14);
        }
        v13 += 256;
        v1 += v9;
        --v12;
      }
      while (v12);
      uint64_t v17 = v25;
      do
      {
        if (v2 >= 1)
        {
          uint64_t v18 = 0;
          do
          {
            *(_WORD *)(result + v18) = (((*(__int16 *)&v17[v18 + 256] - *(__int16 *)&v17[v18]) * v5
                                                     + 16 * *(__int16 *)&v17[v18]
                                                     + 8) >> 4)
                                     - 0x2000;
            v18 += 2;
          }
          while (2 * v2 != v18);
        }
        v17 += 256;
        result += 2 * v2;
        --v3;
      }
      while (v3);
    }
    else
    {
      unsigned int v23 = v11 >> 1;
      do
      {
        if (v2 >= 1)
        {
          for (uint64_t i = 0; i != v2; ++i)
            *(_WORD *)(result + i * 2) = ((int)(v23 + 16 * v1[i] + (v1[i + 1] - v1[i]) * v4) >> v10) - 0x2000;
        }
        result += 2 * v2;
        v1 += v9;
        --v3;
      }
      while (v3);
    }
  }
  else if (v5)
  {
    char v19 = 22 - v7;
    uint64_t v20 = 2 * v9;
    signed int v21 = &v1[v9];
    do
    {
      if (v2 >= 1)
      {
        for (uint64_t j = 0; j != v2; ++j)
          *(_WORD *)(result + j * 2) = ((int)(((1 << v19) >> 1) + 16 * v1[j] + (v21[j] - v1[j]) * v5) >> v19)
                                     - 0x2000;
      }
      result += 2 * v2;
      signed int v21 = (unsigned __int16 *)((char *)v21 + v20);
      v1 = (unsigned __int16 *)((char *)v1 + v20);
      --v3;
    }
    while (v3);
  }
  else
  {
    return sub_224AE2F04(result, (uint64_t)v1, v9, v2, v3, v6);
  }
  return result;
}

uint64_t sub_224AE2F04(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, unsigned int a6)
{
  unsigned int v6 = __clz(a6) - 18;
  do
  {
    if (a4 >= 1)
    {
      uint64_t v7 = 0;
      do
      {
        *(_WORD *)(result + v7) = (*(_WORD *)(a2 + v7) << v6) - 0x2000;
        v7 += 2;
      }
      while (2 * a4 != v7);
    }
    result += 2 * a4;
    a2 += 2 * a3;
    --a5;
  }
  while (a5);
  return result;
}

uint64_t sub_224AE2F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  uint64_t result = MEMORY[0x270FA5388]();
  char v18 = __clz(a11);
  uint64_t v20 = v19 >> 1;
  uint64_t v36 = *MEMORY[0x263EF8340];
  int v21 = ((v17 + (v15 - 1) * a10) >> 10) + 2;
  uint64_t v22 = v35;
  do
  {
    if (v14 >= 1)
    {
      uint64_t v23 = 0;
      int v24 = 0;
      int v25 = v16;
      do
      {
        *(_WORD *)&v22[v23] = (int)(((1 << (22 - v18)) >> 1)
                                  + 16 * *(unsigned __int16 *)(v13 + 2 * v24)
                                  + (*(unsigned __int16 *)(v13 + 2 * v24 + 2) - *(unsigned __int16 *)(v13 + 2 * v24))
                                  * (v25 >> 6)) >> (22 - v18);
        int v26 = v25 + a9;
        v24 += v26 >> 10;
        int v25 = v26 & 0x3FF;
        v23 += 2;
      }
      while (2 * v14 != v23);
    }
    v22 += 256;
    v13 += 2 * v20;
    --v21;
  }
  while (v21);
  char v27 = v18 - 14;
  unsigned int v28 = (1 << (v18 - 14)) >> 1;
  unint64_t v29 = v12 & 0xFFFFFFFFFFFFFFFELL;
  int v30 = v35;
  do
  {
    if (v14 >= 1)
    {
      uint64_t v31 = 0;
      do
      {
        int v32 = (int)(v28 + 16 * *(__int16 *)&v30[v31] + (*(__int16 *)&v30[v31 + 256] - *(__int16 *)&v30[v31])
                                                     * (v17 >> 6)) >> v27;
        if (v32 >= a11) {
          __int16 v33 = a11;
        }
        else {
          __int16 v33 = (int)(v28
        }
                    + 16 * *(__int16 *)&v30[v31]
                    + (*(__int16 *)&v30[v31 + 256] - *(__int16 *)&v30[v31]) * (v17 >> 6)) >> v27;
        if (v32 >= 0) {
          __int16 v34 = v33;
        }
        else {
          __int16 v34 = 0;
        }
        *(_WORD *)(result + v31) = v34;
        v31 += 2;
      }
      while (2 * v14 != v31);
    }
    v30 += 2 * (int)(((v17 + a10) >> 3) & 0xFFFFFF80);
    int v17 = (v17 + a10) & 0x3FF;
    result += v29;
    --v15;
  }
  while (v15);
  return result;
}

char *sub_224AE3104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  uint64_t result = (char *)MEMORY[0x270FA5388]();
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v16 = v15 >> 1;
  uint64_t v18 = v17 >> 1;
  if (v13)
  {
    char v19 = __clz(a9);
    if (v14)
    {
      int v20 = v12 + 1;
      uint64_t v21 = 2 * v18;
      uint64_t v22 = v46;
      do
      {
        if (v11 >= 1)
        {
          uint64_t v23 = 0;
          int v24 = *(unsigned __int16 *)v10;
          do
          {
            int v25 = *(unsigned __int16 *)&v10[v23 + 2];
            *(_WORD *)&v22[v23] = (int)(((1 << (22 - v19)) >> 1) + 16 * v24 + (v25 - v24) * v13) >> (22 - v19);
            v23 += 2;
            int v24 = v25;
          }
          while (2 * v11 != v23);
        }
        v22 += 256;
        v10 += v21;
        --v20;
      }
      while (v20);
      char v26 = v19 - 14;
      char v27 = v46;
      do
      {
        if (v11 >= 1)
        {
          uint64_t v28 = 0;
          do
          {
            int v29 = (int)(((1 << v26) >> 1)
                      + 16 * *(__int16 *)&v27[v28]
                      + (*(__int16 *)&v27[v28 + 256] - *(__int16 *)&v27[v28]) * v14) >> v26;
            if (v29 >= a9) {
              __int16 v30 = a9;
            }
            else {
              __int16 v30 = (int)(((1 << v26) >> 1)
            }
                        + 16 * *(__int16 *)&v27[v28]
                        + (*(__int16 *)&v27[v28 + 256] - *(__int16 *)&v27[v28]) * v14) >> v26;
            if (v29 >= 0) {
              __int16 v31 = v30;
            }
            else {
              __int16 v31 = 0;
            }
            *(_WORD *)&result[v28] = v31;
            v28 += 2;
          }
          while (2 * v11 != v28);
        }
        v27 += 256;
        result += 2 * v16;
        --v12;
      }
      while (v12);
    }
    else
    {
      char v38 = v19 - 18;
      unsigned int v39 = (1 << (v19 - 18)) >> 1;
      char v40 = 22 - v19;
      uint64_t v41 = 2 * v16;
      do
      {
        if (v11 >= 1)
        {
          uint64_t v42 = 0;
          do
          {
            int v43 = (int)(((int)(((1 << v40) >> 1)
                             + 16 * *(unsigned __int16 *)&v10[v42]
                             + (*(unsigned __int16 *)&v10[v42 + 2] - *(unsigned __int16 *)&v10[v42]) * v13) >> v40)
                      + v39) >> v38;
            if (v43 >= a9) {
              __int16 v44 = a9;
            }
            else {
              __int16 v44 = (int)(((int)(((1 << v40) >> 1)
            }
                               + 16 * *(unsigned __int16 *)&v10[v42]
                               + (*(unsigned __int16 *)&v10[v42 + 2] - *(unsigned __int16 *)&v10[v42]) * v13) >> v40)
                        + v39) >> v38;
            if (v43 >= 0) {
              __int16 v45 = v44;
            }
            else {
              __int16 v45 = 0;
            }
            *(_WORD *)&result[v42] = v45;
            v42 += 2;
          }
          while (2 * v11 != v42);
        }
        result += v41;
        v10 += 2 * v18;
        --v12;
      }
      while (v12);
    }
  }
  else if (v14)
  {
    uint64_t v32 = 2 * v18;
    __int16 v33 = &v10[2 * v18];
    do
    {
      if (v11 >= 1)
      {
        uint64_t v34 = 0;
        do
        {
          int v35 = (*(unsigned __int16 *)&v33[v34] - *(unsigned __int16 *)&v10[v34]) * v14
              + 16 * *(unsigned __int16 *)&v10[v34];
          int v36 = (v35 + 8) >> 4;
          if (v36 >= a9) {
            LOWORD(v36) = a9;
          }
          if (v35 >= -8) {
            __int16 v37 = v36;
          }
          else {
            __int16 v37 = 0;
          }
          *(_WORD *)&result[v34] = v37;
          v34 += 2;
        }
        while (2 * v11 != v34);
      }
      result += 2 * v16;
      v33 += v32;
      v10 += v32;
      --v12;
    }
    while (v12);
  }
  else
  {
    return (char *)sub_224AE33BC(result, v16, v10, v18, v11, v12);
  }
  return result;
}

void *sub_224AE33BC(char *__dst, uint64_t a2, char *__src, uint64_t a4, int a5, int a6)
{
  size_t v9 = 2 * a5;
  uint64_t v10 = 2 * a4;
  uint64_t v11 = 2 * a2;
  do
  {
    uint64_t result = memcpy(__dst, __src, v9);
    __src += v10;
    __dst += v11;
    --a6;
  }
  while (a6);
  return result;
}

uint64_t sub_224AE3424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  return sub_224AE3454(a1, a2, a3, a4, a5, a6, a7, a8, a9, 9u, a10);
}

uint64_t sub_224AE3454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10, unsigned int a11)
{
  uint64_t result = MEMORY[0x270FA5388]();
  v45[8320] = *MEMORY[0x263EF8340];
  char v17 = __clz(a11);
  int v18 = ((v15 + (v13 - 1) * a9) >> 10) + 8;
  uint64_t v42 = v19 >> 1;
  uint64_t v21 = v20 - 6 * (v19 >> 1);
  uint64_t v22 = &v44;
  do
  {
    int v43 = v18;
    if (v12 >= 1)
    {
      uint64_t v23 = 0;
      int v24 = 0;
      int v25 = v14;
      do
      {
        if (v25 >= 0x40)
        {
          uint64_t v27 = 8 * (v25 >> 6) - 8;
          uint64_t v28 = (char *)&unk_224B18470 + 120 * (a10 & 1) + v27 + 360;
          int v29 = (char *)&unk_224B18470 + 120 * (a10 & 3) + v27;
          if (v12 <= 4) {
            int v29 = v28;
          }
          __int16 v30 = (unsigned __int16 *)(v21 + 2 * v24);
          int v26 = (int)(((1 << (24 - v17)) >> 1)
                    + *(v30 - 3) * *v29
                    + *(v30 - 2) * v29[1]
                    + *(v30 - 1) * v29[2]
                    + *v30 * v29[3]
                    + v30[1] * v29[4]
                    + v30[2] * v29[5]
                    + v30[3] * v29[6]
                    + v30[4] * v29[7]) >> (24 - v17);
        }
        else
        {
          int v26 = *(unsigned __int16 *)(v21 + 2 * v24) << (v17 - 18);
        }
        *(_WORD *)&v22[v23] = v26;
        v24 += (v25 + v16) >> 10;
        int v25 = (v25 + v16) & 0x3FF;
        v23 += 2;
      }
      while (2 * v12 != v23);
    }
    v22 += 256;
    v21 += 2 * v42;
    --v18;
  }
  while (v43 != 1);
  int v31 = v15;
  if (v13 >= 1)
  {
    int v32 = 0;
    __int16 v33 = v45;
    do
    {
      if (v31 >= 0x40)
      {
        int v34 = v31;
        uint64_t v36 = ((uint64_t)v31 >> 6) - 1;
        __int16 v37 = (char *)&unk_224B18470 + 120 * ((a10 >> 2) & 1) + 8 * v36 + 360;
        char v38 = (char *)&unk_224B18470 + 120 * (a10 >> 2) + 8 * v36;
        if (v13 >= 5) {
          int v35 = v38;
        }
        else {
          int v35 = v37;
        }
      }
      else
      {
        int v34 = v31;
        int v35 = 0;
      }
      if (v12 >= 1)
      {
        uint64_t v39 = 0;
        do
        {
          if (v35)
          {
            char v40 = v33 - 96;
            int v41 = (*(__int16 *)((char *)v40 + v39 + 256) * v35[1]
                 + *(__int16 *)((char *)v40 + v39) * *v35
                 + *(__int16 *)((char *)v40 + v39 + 512) * v35[2]
                 + *(__int16 *)((char *)v33 + v39) * v35[3]
                 + *(__int16 *)((char *)v40 + v39 + 1024) * v35[4]
                 + *(__int16 *)((char *)v40 + v39 + 1280) * v35[5]
                 + *(__int16 *)((char *)v40 + v39 + 1536) * v35[6]
                 + *(__int16 *)((char *)v40 + v39 + 1792) * v35[7]
                 + 32) >> 6;
          }
          else
          {
            LOWORD(v41) = *(_WORD *)((char *)v33 + v39);
          }
          *(_WORD *)(result + v39) = v41 - 0x2000;
          v39 += 2;
        }
        while (2 * v12 != v39);
      }
      __int16 v33 = (void *)((char *)v33 + 2 * (int)(((v34 + a9) >> 3) & 0xFFFFFF80));
      int v31 = (v34 + a9) & 0x3FF;
      ++v32;
      result += 2 * v12;
    }
    while (v32 != v13);
  }
  return result;
}

uint64_t sub_224AE37B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  return sub_224AE37D8(a1, a2, a3, a4, a5, a6, a7, 9, a8);
}

uint64_t sub_224AE37D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v80 = *MEMORY[0x263EF8340];
  char v18 = __clz(a9);
  if (v14)
  {
    unsigned int v19 = v16 & 3;
    if (v12 <= 4) {
      unsigned int v19 = (v16 & 1) + 3;
    }
    uint64_t v20 = (int8x8_t *)((char *)&unk_224B18470 + 120 * v19 + 8 * v14 - 8);
    if (!v15)
    {
      char v21 = 24 - v18;
      unsigned int v22 = (1 << (24 - v18)) >> 1;
      do
      {
        if (v12 >= 1)
        {
          uint64_t v23 = 0;
          int16x8_t v24 = vmovl_s8(*v20);
          int32x4_t v25 = vmovl_high_s16(v24);
          int32x4_t v26 = vmovl_s16(*(int16x4_t *)v24.i8);
          do
          {
            *(_WORD *)(result + v23) = ((int)(vaddvq_s32(vmlaq_s32(vmulq_s32((int32x4_t)vmovl_high_u16(*(uint16x8_t *)(v10 + v23 - 6)), v25), (int32x4_t)vmovl_u16(*(uint16x4_t *)(v10 + v23 - 6)), v26))+ v22) >> v21)- 0x2000;
            v23 += 2;
          }
          while (2 * v12 != v23);
        }
        result += 2 * v12;
        v10 += v11 & 0xFFFFFFFFFFFFFFFELL;
        --v13;
      }
      while (v13);
      return result;
    }
    goto LABEL_13;
  }
  if (v15)
  {
    uint64_t v20 = 0;
LABEL_13:
    unsigned int v27 = v16 >> 2;
    if (v13 <= 4) {
      unsigned int v27 = ((v16 >> 2) & 1) + 3;
    }
    uint64_t v28 = (char *)&unk_224B18470 + 120 * v27 + 8 * v15 - 8;
    uint64_t v29 = v11 >> 1;
    char v30 = 24 - v18;
    unsigned int v31 = (1 << v30) >> 1;
    if (v20)
    {
      int v32 = v13 + 7;
      uint64_t v33 = v10 - 6 * v29;
      uint64_t v34 = 2 * v29;
      uint64_t v35 = 2 * v12;
      uint64_t v36 = v79;
      do
      {
        if (v12 >= 1)
        {
          uint64_t v37 = 0;
          int8x8_t v38 = *(int8x8_t *)(v33 - 6);
          int v39 = *(unsigned __int16 *)(v33 + 4);
          int v40 = *(unsigned __int16 *)(v33 + 6);
          v17.i32[0] = v20->i32[0];
          int32x4_t v17 = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v17.i8));
          int v41 = v20->i8[4];
          int v42 = v20->i8[5];
          int v43 = v20->i8[6];
          int v44 = v20->i8[7];
          do
          {
            int v45 = v40;
            int v46 = *(unsigned __int16 *)(v33 + v37 + 2);
            int v40 = *(unsigned __int16 *)(v33 + v37 + 8);
            *(_WORD *)&v36[v37] = (int)(vaddvq_s32(vmulq_s32((int32x4_t)vmovl_u16((uint16x4_t)v38), v17))
                                      + v46 * v41
                                      + v45 * v43
                                      + v39 * v42
                                      + v31
                                      + v40 * v44) >> v30;
            int v39 = v45;
            int8x8_t v38 = vext_s8(v38, v38, 2uLL);
            v38.i16[3] = v46;
            v37 += 2;
          }
          while (v35 != v37);
        }
        v36 += 256;
        v33 += v34;
        --v32;
      }
      while (v32);
      uint64_t v47 = v79;
      do
      {
        if (v12 >= 1)
        {
          uint64_t v48 = 0;
          int v49 = *v28;
          int v50 = v28[1];
          int v51 = v28[2];
          int v52 = v28[3];
          int v53 = v28[4];
          int v54 = v28[5];
          int v55 = v28[6];
          int v56 = v28[7];
          do
          {
            *(_WORD *)(result + v48) = ((*(__int16 *)&v47[v48] * v49
                                                     + *(__int16 *)&v47[v48 + 256] * v50
                                                     + *(__int16 *)&v47[v48 + 512] * v51
                                                     + *(__int16 *)&v47[v48 + 768] * v52
                                                     + *(__int16 *)&v47[v48 + 1024] * v53
                                                     + *(__int16 *)&v47[v48 + 1280] * v54
                                                     + *(__int16 *)&v47[v48 + 1536] * v55
                                                     + *(__int16 *)&v47[v48 + 1792] * v56
                                                     + 32) >> 6)
                                     - 0x2000;
            v48 += 2;
          }
          while (v35 != v48);
        }
        result += 2 * v12;
        v47 += 256;
        --v13;
      }
      while (v13);
    }
    else
    {
      uint64_t v57 = 2 * v12;
      uint64_t v76 = 2 * v12;
      int v77 = v12;
      uint64_t v58 = v10 + 4 * v11;
      uint64_t v75 = 2 * v29;
      uint64_t v59 = v10 + 6 * v29;
      uint64_t v60 = v10 + 2 * v11;
      uint64_t v61 = v10 + 2 * v29;
      uint64_t v62 = v10 - 2 * v29;
      uint64_t v63 = v10 - 6 * v29;
      uint64_t v64 = v10 - 2 * v11;
      do
      {
        int v78 = v13;
        if (v12 >= 1)
        {
          uint64_t v65 = 0;
          int v66 = *v28;
          int v67 = v28[1];
          int v68 = v28[2];
          int v69 = v28[3];
          int v70 = v28[4];
          int v71 = v28[5];
          int v72 = v28[6];
          int v73 = v28[7];
          do
          {
            *(_WORD *)(result + v65) = ((int)(v31
                                            + *(unsigned __int16 *)(v63 + v65) * v66
                                            + *(unsigned __int16 *)(v64 + v65) * v67
                                            + *(unsigned __int16 *)(v62 + v65) * v68
                                            + *(unsigned __int16 *)(v10 + v65) * v69
                                            + *(unsigned __int16 *)(v61 + v65) * v70
                                            + *(unsigned __int16 *)(v60 + v65) * v71
                                            + *(unsigned __int16 *)(v59 + v65) * v72
                                            + *(unsigned __int16 *)(v58 + v65) * v73) >> v30)
                                     - 0x2000;
            v65 += 2;
          }
          while (v57 != v65);
        }
        int v12 = v77;
        result += v76;
        v58 += v75;
        v59 += v75;
        v60 += v75;
        v61 += v75;
        v10 += v75;
        v62 += v75;
        v64 += v75;
        v63 += v75;
        --v13;
      }
      while (v78 != 1);
    }
    return result;
  }
  uint64_t v74 = v11 >> 1;

  return sub_224AE2F04(result, v10, v74, v12, v13, a9);
}

uint64_t sub_224AE3C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  return sub_224AE3C64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 9u, a11);
}

uint64_t sub_224AE3C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, unsigned int a11, signed int a12)
{
  uint64_t result = MEMORY[0x270FA5388]();
  v50[8320] = *MEMORY[0x263EF8340];
  char v19 = __clz(a12);
  char v48 = v19 - 18;
  int v20 = ((v18 + (v16 - 1) * a10) >> 10) + 8;
  uint64_t v22 = v21 - 6 * (v14 >> 1);
  uint64_t v23 = &v49;
  do
  {
    int v47 = v20;
    if (v15 >= 1)
    {
      uint64_t v24 = 0;
      int v25 = 0;
      int v26 = v17;
      do
      {
        if (v26 >= 0x40)
        {
          uint64_t v28 = 8 * (v26 >> 6) - 8;
          uint64_t v29 = (char *)&unk_224B18470 + 120 * (a11 & 1) + v28 + 360;
          char v30 = (char *)&unk_224B18470 + 120 * (a11 & 3) + v28;
          if (v15 <= 4) {
            char v30 = v29;
          }
          unsigned int v31 = (unsigned __int16 *)(v22 + 2 * v25);
          int v27 = (int)(((1 << (24 - v19)) >> 1)
                    + *(v31 - 3) * *v30
                    + *(v31 - 2) * v30[1]
                    + *(v31 - 1) * v30[2]
                    + *v31 * v30[3]
                    + v31[1] * v30[4]
                    + v31[2] * v30[5]
                    + v31[3] * v30[6]
                    + v31[4] * v30[7]) >> (24 - v19);
        }
        else
        {
          int v27 = *(unsigned __int16 *)(v22 + 2 * v25) << v48;
        }
        *(_WORD *)&v23[v24] = v27;
        v25 += (v26 + a9) >> 10;
        int v26 = (v26 + a9) & 0x3FF;
        v24 += 2;
      }
      while (2 * v15 != v24);
    }
    v23 += 256;
    v22 += 2 * (v14 >> 1);
    --v20;
  }
  while (v47 != 1);
  int v32 = v18;
  if (v16 >= 1)
  {
    int v33 = 0;
    uint64_t v34 = v50;
    char v35 = v19 - 12;
    unsigned int v36 = (1 << (v19 - 12)) >> 1;
    unint64_t v37 = v13 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      if (v32 >= 0x40)
      {
        int v38 = v32;
        uint64_t v40 = ((uint64_t)v32 >> 6) - 1;
        int v41 = (char *)&unk_224B18470 + 120 * ((a11 >> 2) & 1) + 8 * v40 + 360;
        int v42 = (char *)&unk_224B18470 + 120 * (a11 >> 2) + 8 * v40;
        if (v16 >= 5) {
          int v39 = v42;
        }
        else {
          int v39 = v41;
        }
      }
      else
      {
        int v38 = v32;
        int v39 = 0;
      }
      if (v15 >= 1)
      {
        uint64_t v43 = 0;
        do
        {
          if (v39)
          {
            int v44 = v34 - 96;
            int v45 = (int)(v36
                      + *(__int16 *)((char *)v44 + v43) * *v39
                      + *(__int16 *)((char *)v44 + v43 + 256) * v39[1]
                      + *(__int16 *)((char *)v44 + v43 + 512) * v39[2]
                      + *(__int16 *)((char *)v34 + v43) * v39[3]
                      + *(__int16 *)((char *)v44 + v43 + 1024) * v39[4]
                      + *(__int16 *)((char *)v44 + v43 + 1280) * v39[5]
                      + *(__int16 *)((char *)v44 + v43 + 1536) * v39[6]
                      + *(__int16 *)((char *)v44 + v43 + 1792) * v39[7]) >> v35;
          }
          else
          {
            int v45 = (int)(((1 << v48) >> 1) + *(__int16 *)((char *)v34 + v43)) >> v48;
          }
          if (v45 >= a12) {
            __int16 v46 = a12;
          }
          else {
            __int16 v46 = v45;
          }
          if (v45 < 0) {
            __int16 v46 = 0;
          }
          *(_WORD *)(result + v43) = v46;
          v43 += 2;
        }
        while (2 * v15 != v43);
      }
      uint64_t v34 = (void *)((char *)v34 + 2 * (int)(((v38 + a10) >> 3) & 0xFFFFFF80));
      int v32 = (v38 + a10) & 0x3FF;
      ++v33;
      result += v37;
    }
    while (v33 != v16);
  }
  return result;
}

char *sub_224AE4018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  return sub_224AE4044(a1, a2, a3, a4, a5, a6, a7, a8, 9u, a9);
}

char *sub_224AE4044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, signed int a10)
{
  uint64_t result = (char *)MEMORY[0x270FA5388]();
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (v16)
  {
    if (v14 < 5) {
      unsigned int v19 = (a9 & 1) + 3;
    }
    else {
      unsigned int v19 = a9 & 3;
    }
    int v20 = (int8x8_t *)((char *)&unk_224B18470 + 120 * v19 + 8 * v16 - 8);
    if (v17) {
      goto LABEL_8;
    }
LABEL_5:
    uint64_t v21 = 0;
    goto LABEL_12;
  }
  int v20 = 0;
  if (!v17) {
    goto LABEL_5;
  }
LABEL_8:
  if (v15 < 5) {
    unsigned int v22 = ((a9 >> 2) & 1) + 3;
  }
  else {
    unsigned int v22 = a9 >> 2;
  }
  uint64_t v21 = (char *)&unk_224B18470 + 120 * v22 + 8 * v17 - 8;
LABEL_12:
  uint64_t v23 = v11 >> 1;
  uint64_t v24 = v13 >> 1;
  if (v20)
  {
    char v25 = __clz(a10);
    unsigned int v26 = (1 << (24 - v25)) >> 1;
    if (v21)
    {
      int v27 = v15 + 7;
      uint64_t v28 = &v12[-6 * v24];
      uint64_t v29 = v69;
      do
      {
        if (v14 >= 1)
        {
          uint64_t v30 = 0;
          int v31 = v20->i8[4];
          int v32 = v20->i8[5];
          int v33 = v20->i8[6];
          int v34 = v20->i8[7];
          v18.i32[0] = v20->i32[0];
          int32x4_t v18 = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v18.i8));
          int8x8_t v35 = *(int8x8_t *)(v28 - 6);
          LOWORD(v36) = *((_WORD *)v28 + 1);
          int v37 = *((unsigned __int16 *)v28 + 3);
          do
          {
            int32x4_t v38 = vmulq_s32((int32x4_t)vmovl_u16((uint16x4_t)v35), v18);
            int v39 = (unsigned __int16)v36;
            int8x8_t v35 = vext_s8(v35, *(int8x8_t *)v18.i8, 2uLL);
            v35.i16[3] = v36;
            int v36 = *(unsigned __int16 *)&v28[v30 + 4];
            int v40 = v37 * v33;
            int v37 = *(unsigned __int16 *)&v28[v30 + 8];
            *(_WORD *)&v29[v30] = (int)(vaddvq_s32(v38) + v39 * v31 + v40 + v36 * v32 + v26 + v37 * v34) >> (24 - v25);
            v30 += 2;
          }
          while (2 * v14 != v30);
        }
        v29 += 256;
        v28 += 2 * v24;
        --v27;
      }
      while (v27);
      char v41 = v25 - 12;
      unsigned int v42 = (1 << (v25 - 12)) >> 1;
      uint64_t v43 = v69;
      do
      {
        if (v14 >= 1)
        {
          uint64_t v44 = 0;
          do
          {
            int v45 = (int)(v42
                      + *(__int16 *)&v43[v44] * *v21
                      + *(__int16 *)&v43[v44 + 256] * v21[1]
                      + *(__int16 *)&v43[v44 + 512] * v21[2]
                      + *(__int16 *)&v43[v44 + 768] * v21[3]
                      + *(__int16 *)&v43[v44 + 1024] * v21[4]
                      + *(__int16 *)&v43[v44 + 1280] * v21[5]
                      + *(__int16 *)&v43[v44 + 1536] * v21[6]
                      + *(__int16 *)&v43[v44 + 1792] * v21[7]) >> v41;
            if (v45 >= a10) {
              __int16 v46 = a10;
            }
            else {
              __int16 v46 = (int)(v42
            }
                        + *(__int16 *)&v43[v44] * *v21
                        + *(__int16 *)&v43[v44 + 256] * v21[1]
                        + *(__int16 *)&v43[v44 + 512] * v21[2]
                        + *(__int16 *)&v43[v44 + 768] * v21[3]
                        + *(__int16 *)&v43[v44 + 1024] * v21[4]
                        + *(__int16 *)&v43[v44 + 1280] * v21[5]
                        + *(__int16 *)&v43[v44 + 1536] * v21[6]
                        + *(__int16 *)&v43[v44 + 1792] * v21[7]) >> v41;
            if (v45 >= 0) {
              __int16 v47 = v46;
            }
            else {
              __int16 v47 = 0;
            }
            *(_WORD *)&result[v44] = v47;
            v44 += 2;
          }
          while (2 * v14 != v44);
        }
        result += 2 * v23;
        v43 += 256;
        --v15;
      }
      while (v15);
    }
    else
    {
      unsigned int v61 = v26 + 32;
      uint64_t v62 = 2 * v24;
      do
      {
        if (v14 >= 1)
        {
          uint64_t v63 = 0;
          do
          {
            int16x8_t v64 = vmovl_s8(*v20);
            int v65 = vaddvq_s32(vmlaq_s32(vmulq_s32((int32x4_t)vmovl_high_u16(*(uint16x8_t *)&v12[v63 - 6]), vmovl_high_s16(v64)), (int32x4_t)vmovl_u16(*(uint16x4_t *)&v12[v63 - 6]), vmovl_s16(*(int16x4_t *)v64.i8)))+ v61;
            int v66 = v65 >> 6;
            if (v65 >> 6 >= a10) {
              LOWORD(v66) = a10;
            }
            if (v65 >= 0) {
              __int16 v67 = v66;
            }
            else {
              __int16 v67 = 0;
            }
            *(_WORD *)&result[v63] = v67;
            v63 += 2;
          }
          while (2 * v14 != v63);
        }
        result += 2 * v23;
        v12 += v62;
        --v15;
      }
      while (v15);
    }
  }
  else if (v21)
  {
    uint64_t v48 = 2 * v23;
    char v49 = &v12[4 * v13];
    uint64_t v50 = 2 * v24;
    int v51 = &v12[6 * v24];
    int v52 = &v12[2 * v13];
    int v53 = &v12[2 * v24];
    int v54 = &v12[-2 * v24];
    int v55 = &v12[-6 * v24];
    int v56 = &v12[-2 * v13];
    do
    {
      if (v14 >= 1)
      {
        uint64_t v57 = 0;
        do
        {
          int v58 = *(unsigned __int16 *)&v55[v57] * *v21
              + *(unsigned __int16 *)&v56[v57] * v21[1]
              + *(unsigned __int16 *)&v54[v57] * v21[2]
              + *(unsigned __int16 *)&v12[v57] * v21[3]
              + *(unsigned __int16 *)&v53[v57] * v21[4]
              + *(unsigned __int16 *)&v52[v57] * v21[5]
              + *(unsigned __int16 *)&v51[v57] * v21[6]
              + *(unsigned __int16 *)&v49[v57] * v21[7];
          int v59 = (v58 + 32) >> 6;
          if (v59 >= a10) {
            LOWORD(v59) = a10;
          }
          if (v58 >= -32) {
            __int16 v60 = v59;
          }
          else {
            __int16 v60 = 0;
          }
          *(_WORD *)&result[v57] = v60;
          v57 += 2;
        }
        while (2 * v14 != v57);
      }
      result += v48;
      v49 += v50;
      v51 += v50;
      v52 += v50;
      v53 += v50;
      v12 += v50;
      v54 += v50;
      v56 += v50;
      v55 += v50;
      --v15;
    }
    while (v15);
  }
  else
  {
    uint64_t v68 = v13 >> 1;
    return (char *)sub_224AE33BC(result, v23, v12, v68, v14, v15);
  }
  return result;
}

uint64_t sub_224AE44C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  return sub_224AE3454(a1, a2, a3, a4, a5, a6, a7, a8, a9, 5u, a10);
}

uint64_t sub_224AE44F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  return sub_224AE37D8(a1, a2, a3, a4, a5, a6, a7, 5, a8);
}

uint64_t sub_224AE4518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  return sub_224AE3C64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 5u, a11);
}

char *sub_224AE454C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  return sub_224AE4044(a1, a2, a3, a4, a5, a6, a7, a8, 5u, a9);
}

uint64_t sub_224AE4578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  return sub_224AE3454(a1, a2, a3, a4, a5, a6, a7, a8, a9, 1u, a10);
}

uint64_t sub_224AE45A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  return sub_224AE37D8(a1, a2, a3, a4, a5, a6, a7, 1, a8);
}

uint64_t sub_224AE45D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  return sub_224AE3C64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 1u, a11);
}

char *sub_224AE4604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  return sub_224AE4044(a1, a2, a3, a4, a5, a6, a7, a8, 1u, a9);
}

uint64_t sub_224AE4630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  return sub_224AE3454(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0xAu, a10);
}

uint64_t sub_224AE4660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  return sub_224AE37D8(a1, a2, a3, a4, a5, a6, a7, 10, a8);
}

uint64_t sub_224AE4688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  return sub_224AE3C64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0xAu, a11);
}

char *sub_224AE46BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  return sub_224AE4044(a1, a2, a3, a4, a5, a6, a7, a8, 0xAu, a9);
}

uint64_t sub_224AE46E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  return sub_224AE3454(a1, a2, a3, a4, a5, a6, a7, a8, a9, 6u, a10);
}

uint64_t sub_224AE4718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  return sub_224AE37D8(a1, a2, a3, a4, a5, a6, a7, 6, a8);
}

uint64_t sub_224AE4740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  return sub_224AE3C64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 6u, a11);
}

char *sub_224AE4774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  return sub_224AE4044(a1, a2, a3, a4, a5, a6, a7, a8, 6u, a9);
}

uint64_t sub_224AE47A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  return sub_224AE3454(a1, a2, a3, a4, a5, a6, a7, a8, a9, 2u, a10);
}

uint64_t sub_224AE47D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  return sub_224AE37D8(a1, a2, a3, a4, a5, a6, a7, 2, a8);
}

uint64_t sub_224AE47F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  return sub_224AE3C64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 2u, a11);
}

char *sub_224AE482C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  return sub_224AE4044(a1, a2, a3, a4, a5, a6, a7, a8, 2u, a9);
}

uint64_t sub_224AE4858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  return sub_224AE3454(a1, a2, a3, a4, a5, a6, a7, a8, a9, 8u, a10);
}

uint64_t sub_224AE4888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  return sub_224AE37D8(a1, a2, a3, a4, a5, a6, a7, 8, a8);
}

uint64_t sub_224AE48B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  return sub_224AE3C64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 8u, a11);
}

char *sub_224AE48E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  return sub_224AE4044(a1, a2, a3, a4, a5, a6, a7, a8, 8u, a9);
}

uint64_t sub_224AE4910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  return sub_224AE3454(a1, a2, a3, a4, a5, a6, a7, a8, a9, 4u, a10);
}

uint64_t sub_224AE4940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  return sub_224AE37D8(a1, a2, a3, a4, a5, a6, a7, 4, a8);
}

uint64_t sub_224AE4968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  return sub_224AE3C64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 4u, a11);
}

char *sub_224AE499C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  return sub_224AE4044(a1, a2, a3, a4, a5, a6, a7, a8, 4u, a9);
}

uint64_t sub_224AE49C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  return sub_224AE3454(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, a10);
}

uint64_t sub_224AE49F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  return sub_224AE37D8(a1, a2, a3, a4, a5, a6, a7, 0, a8);
}

uint64_t sub_224AE4A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, signed int a11)
{
  return sub_224AE3C64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, a11);
}

char *sub_224AE4A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  return sub_224AE4044(a1, a2, a3, a4, a5, a6, a7, a8, 0, a9);
}

void sub_224AE4A74(uint64_t a1, uint64_t a2)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  int v4 = *(_DWORD *)(a1 + 76);
  int v5 = *(_DWORD *)(a1 + 72) - 1;
  *(_DWORD *)(a1 + 72) = v5;
  if (v4)
  {
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    free(*(void **)a2);
    if (!v5)
    {
      pthread_mutex_destroy((pthread_mutex_t *)a1);
      free((void *)a1);
    }
  }
  else
  {
    *(void *)(a2 + 8) = *(void *)(a1 + 64);
    *(void *)(a1 + 64) = a2;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }
}

char *sub_224AE4B24(uint64_t a1, char *a2)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  int v4 = *(char **)(a1 + 64);
  ++*(_DWORD *)(a1 + 72);
  if (v4)
  {
    *(void *)(a1 + 64) = *((void *)v4 + 1);
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    if (&v4[-*(void *)v4] == a2) {
      return v4;
    }
    free(*(void **)v4);
  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x40uLL, (size_t)(a2 + 16), 0xE584FBEuLL) || !memptr)
  {
    pthread_mutex_lock((pthread_mutex_t *)a1);
    int v5 = *(_DWORD *)(a1 + 72) - 1;
    *(_DWORD *)(a1 + 72) = v5;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    if (!v5)
    {
      pthread_mutex_destroy((pthread_mutex_t *)a1);
      free((void *)a1);
    }
    return 0;
  }
  else
  {
    int v4 = &a2[(void)memptr];
    *(void *)&a2[(void)memptr] = memptr;
  }
  return v4;
}

uint64_t sub_224AE4C0C(int a1, int a2, int a3, int a4, int a5, int a6, char a7, _WORD *a8, unint64_t a9, uint64_t a10, unsigned int a11, int *a12, int a13, int a14, int a15, _WORD *a16, unsigned int a17)
{
  int v17 = a4;
  uint64_t v18 = a11;
  if (a11 - 1 >= 8)
  {
    if (!a11 || a11 == 12) {
      uint64_t v18 = byte_224B18F90[4 * a11 + 2 * a2 + a4];
    }
  }
  else
  {
    int v19 = 3 * *a12 + byte_224B18F88[a11 - 1];
    *a12 = v19;
    if (v19 > 90)
    {
      if (v19 >= 0xB4)
      {
        if (v19 == 180 || a2 == 0) {
          uint64_t v18 = 2;
        }
        else {
          uint64_t v18 = 8;
        }
      }
      else
      {
        uint64_t v18 = 7u;
      }
    }
    else if (v19 == 90 || a4 == 0)
    {
      uint64_t v18 = 1;
    }
    else
    {
      uint64_t v18 = 6;
    }
  }
  char v22 = __clz(a17);
  char v23 = byte_224B18FC4[v18];
  if (!a4)
  {
    uint64_t v24 = 0;
    __src = a8;
    goto LABEL_31;
  }
  if ((byte_224B18FC4[v18] & 6) == 0)
  {
    __src = 0;
    if (a2)
    {
      uint64_t v24 = 0;
      goto LABEL_31;
    }
    uint64_t v24 = 0;
    if ((byte_224B18FC4[v18] & 1) == 0) {
      goto LABEL_31;
    }
  }
  if (a10) {
    char v25 = (_WORD *)(a10 + 8 * a1);
  }
  else {
    char v25 = (_WORD *)((char *)a8 - a9);
  }
  __src = v25;
  if (a10) {
    uint64_t v24 = (_WORD *)(a10 + 8 * a1);
  }
  else {
    uint64_t v24 = (_WORD *)((char *)a8 - a9);
  }
LABEL_31:
  unsigned int v26 = a16;
  char v27 = 32 - v22;
  if (byte_224B18FC4[v18])
  {
    uint64_t v28 = (4 * a14);
    uint64_t v29 = &a16[-4 * a14];
    if (a2)
    {
      int v30 = 4 * (a6 - a3);
      if ((int)v28 >= v30) {
        uint64_t v31 = v30;
      }
      else {
        uint64_t v31 = v28;
      }
      if ((int)v31 >= 1)
      {
        int v32 = v28 - 1;
        int v33 = a8 - 1;
        uint64_t v34 = v31;
        do
        {
          v29[v32--] = *v33;
          int v33 = (__int16 *)((char *)v33 + a9);
          --v34;
        }
        while (v34);
      }
      if ((int)v28 > v30)
      {
        unsigned int v35 = v28 - v31;
        if ((int)v28 - (int)v31 >= 1)
        {
          __int16 v36 = v29[v35];
          uint64_t v37 = 2 * v35;
          int32x4_t v38 = &a16[-4 * a14];
          do
          {
            *v38++ = v36;
            v37 -= 2;
          }
          while (v37);
        }
      }
    }
    else
    {
      if (a4) {
        LOWORD(v39) = *v24;
      }
      else {
        int v39 = (1 << v27 >> 1) + 1;
      }
      if (a14)
      {
        int v40 = &a16[-4 * a14];
        uint64_t v41 = (4 * a14);
        do
        {
          *v40++ = v39;
          --v41;
        }
        while (v41);
      }
    }
    if ((v23 & 0x10) != 0)
    {
      if (a2 && (a7 & 8) != 0 && (int v42 = a6 - (a14 + a3), a6 > a14 + a3))
      {
        int v43 = 4 * v42;
        if ((int)v28 >= 4 * v42) {
          uint64_t v44 = v43;
        }
        else {
          uint64_t v44 = v28;
        }
        if ((int)v44 >= 1)
        {
          int v45 = &a16[-(int)v28 - 1];
          __int16 v46 = &a8[(a9 >> 1) * v28 - 1];
          uint64_t v47 = v44;
          do
          {
            *v45-- = *v46;
            __int16 v46 = (_WORD *)((char *)v46 + a9);
            --v47;
          }
          while (v47);
        }
        if ((int)v28 > v43 && (int)v28 - (int)v44 >= 1)
        {
          uint64_t v48 = &v29[-v28];
          __int16 v49 = v29[-(int)v44];
          uint64_t v50 = 2 * (v28 - v44);
          do
          {
            *v48++ = v49;
            v50 -= 2;
          }
          while (v50);
        }
      }
      else if (a14)
      {
        uint64_t v51 = -(uint64_t)v28;
        __int16 v52 = *v29;
        do
          v29[v51] = v52;
        while (!__CFADD__(v51++, 1));
      }
    }
  }
  int v54 = a13;
  if ((v23 & 2) != 0)
  {
    uint64_t v55 = (4 * a13);
    int v56 = a16 + 1;
    if (a4)
    {
      int v57 = a5 - a1;
      int v58 = 4 * (a5 - a1);
      if ((int)v55 < v58) {
        int v58 = 4 * a13;
      }
      int v81 = v58;
      char v82 = v27;
      int v84 = a1;
      int v86 = a2;
      char v83 = v23;
      int v60 = a5;
      char v61 = a7;
      memcpy(a16 + 1, v24, 2 * v58);
      int v54 = a13;
      a1 = v84;
      a2 = v86;
      a7 = v61;
      a5 = v60;
      int v17 = a4;
      char v27 = v82;
      char v23 = v83;
      unsigned int v26 = a16;
      if ((int)v55 > 4 * v57 && (int)v55 - v81 >= 1)
      {
        uint64_t v62 = &v56[v81];
        __int16 v63 = *(v62 - 1);
        uint64_t v64 = 2 * (v55 - v81);
        do
        {
          *v62++ = v63;
          v64 -= 2;
        }
        while (v64);
      }
      goto LABEL_84;
    }
    if (a2)
    {
      LOWORD(v65) = *(a8 - 1);
      if (!a13) {
        goto LABEL_84;
      }
    }
    else
    {
      unsigned int v65 = ((1 << v27) >> 1) - 1;
      if (!a13) {
        goto LABEL_84;
      }
    }
    int v66 = a16 + 1;
    uint64_t v67 = (4 * a13);
    do
    {
      *v66++ = v65;
      --v67;
    }
    while (v67);
LABEL_84:
    if ((v23 & 8) != 0)
    {
      if (v17 && (a7 & 1) != 0 && (int v68 = a5 - (v54 + a1), a5 > v54 + a1))
      {
        int v69 = 4 * v68;
        if ((int)v55 < 4 * v68) {
          int v69 = 4 * a13;
        }
        int v85 = v69;
        int v87 = a2;
        uint64_t v70 = &v24[v55];
        int v71 = v26;
        int v72 = v24;
        int v73 = v54;
        memcpy(&v56[v55], v70, 2 * v69);
        int v54 = v73;
        uint64_t v24 = v72;
        unsigned int v26 = v71;
        a2 = v87;
        if ((int)v55 > 4 * v68 && (int)v55 - v85 >= 1)
        {
          uint64_t v74 = &v56[v55 + v85];
          __int16 v75 = v56[(int)v55 - 1 + v85];
          uint64_t v76 = 2 * (v55 - v85);
          do
          {
            *v74++ = v75;
            v76 -= 2;
          }
          while (v76);
        }
      }
      else if (v54)
      {
        int v77 = &v56[v55];
        __int16 v78 = v56[(int)v55 - 1];
        do
        {
          *v77++ = v78;
          --v55;
        }
        while (v55);
      }
    }
  }
  if ((v23 & 4) != 0)
  {
    if (a2)
    {
      LOWORD(v79) = *(__src - 1);
    }
    else if (v17)
    {
      LOWORD(v79) = *v24;
    }
    else
    {
      unsigned int v79 = (1 << v27) >> 1;
    }
    *unsigned int v26 = v79;
    if (v18 == 7 && a14 + v54 >= 6 && a15) {
      *unsigned int v26 = (5 * ((unsigned __int16)v26[1] + (unsigned __int16)*(v26 - 1)) + 6 * (unsigned __int16)v79 + 8) >> 4;
    }
  }
  return v18;
}

int8x8_t *sub_224AE50F0(int8x8_t *a1, unint64_t a2, __int8 *a3, int a4, int a5, unsigned int a6)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v11 = a6 & 0x1FF;
  unsigned int v12 = word_224B19060[(270 - v11) >> 1];
  if (a6 < 0x400) {
    goto LABEL_2;
  }
  signed int v14 = a5 + a4;
  if ((v11 - 220) < 0xFFFFFFD8 || (int)(0x10u >> ((a6 & 0x200) != 0)) < v14)
  {
    unsigned int v20 = sub_224AE52E4(a5 + a4, v11 - 180, (a6 >> 9) & 1);
    if (v20)
    {
      unsigned int v21 = v20;
      v30[0].i8[0] = *a3;
      if (a4 <= a5) {
        int v22 = a5;
      }
      else {
        int v22 = a4;
      }
      if (a4 >= a5) {
        int v23 = a5;
      }
      else {
        int v23 = a4;
      }
      sub_224A81F40((uint64_t *)((char *)v30[0].i64 + 1), (uint64_t)a3, v22 + a5);
      sub_224A819DC(v29, a5 + a4, v30, v23 + a5, v21);
      goto LABEL_23;
    }
LABEL_2:
    if (a4 >= a5) {
      int v13 = a5;
    }
    else {
      int v13 = a4;
    }
    signed int v14 = v13 + a5;
    sub_224A81F40(v29, (uint64_t)a3, v13 + a5);
LABEL_23:
    int v18 = v14 - 1;
    char v17 = 1;
    int v19 = 1;
    goto LABEL_24;
  }
  v30[0].i8[0] = *a3;
  if (a4 <= a5) {
    int v15 = a5;
  }
  else {
    int v15 = a4;
  }
  if (a4 >= a5) {
    int v16 = a5;
  }
  else {
    int v16 = a4;
  }
  sub_224A81F40((uint64_t *)((char *)v30[0].i64 + 1), (uint64_t)a3, v15 + a5);
  sub_224A81918(v29, (a5 + a4), v30, v16 + a5);
  char v17 = 0;
  int v18 = 2 * v14 - 2;
  v12 *= 2;
  int v19 = 2;
LABEL_24:
  int v24 = 63 - v18;
  if (63 - v18 <= a5 + 15) {
    int v24 = a5 + 15;
  }
  sub_224A81BC8((int8x16_t *)&v29[0].i8[v18 + 1], v29[0].u8[v18], v24 * v19);
  if (v17) {
    return (int8x8_t *)sub_224A82C3C(a1, a2, (uint64_t)v29, a4, a5, v12, v18);
  }
  else {
    return sub_224A831DC(a1, a2, (long long *)v29[0].i8, a4, a5, v12, v18, v25, v26, v27);
  }
}

uint64_t sub_224AE52E4(unsigned int a1, int a2, int a3)
{
  if (a3)
  {
    if ((int)a1 <= 8)
    {
      if (a2 <= 63) {
        return a2 > 39;
      }
      return 2;
    }
    if (a1 <= 0x10)
    {
      if (a2 > 47) {
        return 2;
      }
      return a2 > 19;
    }
    uint64_t result = 3;
    if (a1 <= 0x18 && a2 <= 3) {
      return 0;
    }
  }
  else
  {
    if ((int)a1 <= 8) {
      return a2 > 55;
    }
    if (a1 <= 0x10) {
      return a2 > 39;
    }
    if (a1 <= 0x18)
    {
      if (a2 > 31) {
        return 3;
      }
      if (a2 > 15) {
        return 2;
      }
      return a2 > 7;
    }
    if (a2 <= 3) {
      unsigned int v5 = 1;
    }
    else {
      unsigned int v5 = 2;
    }
    if (a2 > 31) {
      unsigned int v5 = 3;
    }
    if (a1 <= 0x20) {
      return v5;
    }
    else {
      return 3;
    }
  }
  return result;
}

void *sub_224AE53B8(void *a1, uint64_t a2, int8x16_t *a3, signed int a4, signed int a5, unsigned int a6, signed int a7, signed int a8)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  int v12 = (a6 >> 9) & 1;
  unsigned int v13 = (a6 & 0x1FF) - 90;
  int v45 = *(unsigned __int16 *)((char *)word_224B19060 + (v13 & 0xFFFFFFFE));
  int v14 = 180 - (a6 & 0x1FF);
  int v47 = *(unsigned __int16 *)((char *)word_224B19060 + (v14 & 0xFFFFFFFE));
  if (a6 <= 0x3FF)
  {
    BOOL v15 = 0;
LABEL_3:
    __memcpy_chk();
    goto LABEL_4;
  }
  signed int v27 = a5 + a4;
  signed int v28 = 0x10u >> ((a6 & 0x200) != 0);
  BOOL v15 = (a6 & 0x1FF) > 0x8C && v28 >= v27;
  if (v13 <= 0x27 && v28 >= v27)
  {
    sub_224A81980(v49, a4, a3);
    v47 *= 2;
    char v16 = 1;
    if (v15) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  unsigned int v41 = sub_224AE52E4(v27, v13, (a6 >> 9) & 1);
  if (!v41) {
    goto LABEL_3;
  }
  if (a7 >= a4) {
    int v42 = a4;
  }
  else {
    int v42 = a7;
  }
  sub_224A819DC((int8x16_t *)&v49[0].i8[1], v42, a3, a4, v41);
  if (a4 > a7) {
    memcpy(&v49[0].i8[a7 + 1], &a3->i8[a7 + 1], a4 - a7);
  }
LABEL_4:
  char v16 = 0;
  if (v15)
  {
LABEL_5:
    v48.i8[0] = a3->i8[0];
    sub_224A81F40((uint64_t *)((char *)v48.i64 + 1), (uint64_t)a3, a5);
    *(void *)&double v17 = sub_224A81980(v50, a5, &v48).u64[0];
    v50[0].i8[0] = a3->i8[0];
    v49[0].i8[0] = v50[0].i8[0];
    return sub_224A829AC(a1, a2, (uint64_t)v49, (long long *)v50[0].i8, a4, a5, v47, 2 * v45, v17, v18, v19, v20, v21, v22, v23, v24);
  }
LABEL_15:
  if (a6 >= 0x400 && (unsigned int v30 = sub_224AE52E4(a5 + a4, v14, v12)) != 0)
  {
    unsigned int v31 = v30;
    v48.i8[0] = a3->i8[0];
    sub_224A81F40((uint64_t *)((char *)v48.i64 + 1), (uint64_t)a3, a5);
    if (a8 >= a5) {
      int v32 = a5;
    }
    else {
      int v32 = a8;
    }
    sub_224A819DC((int8x16_t *)&v50[0].i8[1], v32, &v48, a5, v31);
    if (a5 > a8) {
      memcpy(&v50[0].i8[a8 + 1], &v48.i8[a8 + 1], a5 - a8);
    }
  }
  else
  {
    sub_224A81F40((uint64_t *)((char *)v50[0].i64 + 1), (uint64_t)a3, a5);
  }
  v50[0].i8[0] = a3->i8[0];
  v49[0].i8[0] = v50[0].i8[0];
  if (v16) {
    return sub_224A82730(a1, a2, (uint64_t)v49, v50, a4, a5, v47, v45, v33, v34, v35, v36, v37, v38, v39, v40);
  }
  else {
    return (void *)sub_224A81F6C((uint64_t)a1, a2, (uint64_t)v49, (uint64_t)v50, a4);
  }
}

int8x8_t *sub_224AE56A8(int8x8_t *a1, uint64_t a2, int8x16_t *a3, int a4, uint64_t a5, unsigned int a6)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v11 = *(unsigned __int16 *)((char *)word_224B19060 + (a6 & 0x1FE));
  if (a6 < 0x400) {
    goto LABEL_2;
  }
  signed int v13 = a5 + a4;
  if ((a6 & 0x1FF) < 0x33 || (int)(0x10u >> ((a6 & 0x200) != 0)) < v13)
  {
    unsigned int v18 = sub_224AE52E4((int)a5 + a4, 90 - (a6 & 0x1FF), (a6 >> 9) & 1);
    if (v18)
    {
      if (a4 >= (int)a5) {
        int v19 = a5;
      }
      else {
        int v19 = a4;
      }
      sub_224A819DC(v21, a5 + a4, a3, v19 + a4, v18);
      goto LABEL_17;
    }
LABEL_2:
    if (a4 >= (int)a5) {
      int v12 = a5;
    }
    else {
      int v12 = a4;
    }
    signed int v13 = v12 + a4;
    __memcpy_chk();
LABEL_17:
    int v16 = v13 - 1;
    char v15 = 1;
    int v17 = 1;
    goto LABEL_18;
  }
  if (a4 >= (int)a5) {
    int v14 = a5;
  }
  else {
    int v14 = a4;
  }
  sub_224A81918(v21, (a5 + a4), a3, v14 + a4);
  char v15 = 0;
  int v16 = 2 * v13 - 2;
  uint64_t v11 = (2 * v11);
  int v17 = 2;
LABEL_18:
  sub_224A81BC8((int8x16_t *)&v21[0].i8[v16 + 1], v21[0].u8[v16], v17 * (a4 + 15));
  if (v15) {
    return (int8x8_t *)sub_224A81BDC((uint64_t)a1, a2, (uint64_t)v21, a4, a5, v11, v16);
  }
  else {
    return sub_224A81E10(a1, a2, (uint64_t)v21, a4, a5, v11, v16);
  }
}

uint64_t sub_224AE583C(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 *a4, int a5, int a6)
{
  if (a6 >= 1)
  {
    for (int i = 0; i != a6; ++i)
    {
      if (a5 >= 1)
      {
        for (uint64_t j = 0; j < a5; j += 2)
        {
          unsigned int v8 = *a4++;
          size_t v9 = (unsigned char *)(result + j);
          *size_t v9 = *(unsigned char *)(a3 + (v8 & 7));
          v9[1] = *(unsigned char *)(a3 + ((unint64_t)v8 >> 4));
        }
      }
      result += a2;
    }
  }
  return result;
}

uint64_t sub_224AE5898(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7)
{
  unsigned int v7 = a5 >> 1;
  if (a5 >= 1)
  {
    uint64_t v8 = a5;
    size_t v9 = (unsigned __int8 *)(a3 - 1);
    do
    {
      int v10 = *v9--;
      v7 += v10;
      --v8;
    }
    while (v8);
  }
  return sub_224AE58D8(a1, a2, a4, a5, v7 >> __clz(__rbit32(a5)), a6, a7);
}

uint64_t sub_224AE58D8(uint64_t result, uint64_t a2, int a3, int a4, int a5, uint64_t a6, int a7)
{
  if (a4 >= 1)
  {
    for (int i = 0; i != a4; ++i)
    {
      if (a3 >= 1)
      {
        for (uint64_t j = 0; j != a3; *(unsigned char *)(result + j++) = v12 & ~(v12 >> 31))
        {
          int v9 = *(__int16 *)(a6 + 2 * j) * a7;
          BOOL v10 = v9 < 0;
          if (v9 < 0) {
            int v9 = -v9;
          }
          unsigned int v11 = (v9 + 32) >> 6;
          if (v10) {
            unsigned int v11 = -v11;
          }
          int v12 = v11 + a5;
          if (v12 >= 255) {
            int v12 = 255;
          }
        }
      }
      result += a2;
      a6 += 2 * a3;
    }
  }
  return result;
}

uint64_t sub_224AE5950(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7)
{
  unsigned int v7 = a4 >> 1;
  if (a4 >= 1)
  {
    uint64_t v8 = a4;
    int v9 = (unsigned __int8 *)(a3 + 1);
    do
    {
      int v10 = *v9++;
      v7 += v10;
      --v8;
    }
    while (v8);
  }
  return sub_224AE58D8(a1, a2, a4, a5, v7 >> __clz(__rbit32(a4)), a6, a7);
}

uint64_t sub_224AE5990(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7)
{
  return sub_224AE58D8(a1, a2, a4, a5, 128, a6, a7);
}

uint64_t sub_224AE59A0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7)
{
  int v13 = sub_224AE5A20(a3, a4, a5);

  return sub_224AE58D8(a1, a2, a4, a5, v13, a6, a7);
}

uint64_t sub_224AE5A20(uint64_t a1, int a2, int a3)
{
  unsigned int v3 = (a3 + a2) >> 1;
  if (a2 >= 1)
  {
    uint64_t v4 = a2;
    unsigned int v5 = (unsigned __int8 *)(a1 + 1);
    do
    {
      int v6 = *v5++;
      v3 += v6;
      --v4;
    }
    while (v4);
  }
  if (a3 >= 1)
  {
    uint64_t v7 = a3;
    uint64_t v8 = (unsigned __int8 *)(a1 - 1);
    do
    {
      int v9 = *v8--;
      v3 += v9;
      --v7;
    }
    while (v7);
  }
  unsigned int v10 = v3 >> __clz(__rbit32(a3 + a2));
  if (2 * a2 < a3 || 2 * a3 < a2) {
    int v12 = 13108;
  }
  else {
    int v12 = 21846;
  }
  unsigned int v13 = (v10 * v12) >> 16;
  if (a2 == a3) {
    return v10;
  }
  else {
    return v13;
  }
}

unint64_t sub_224AE5AA4(unint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, signed int a6, signed int a7)
{
  return sub_224AE5ACC(a1, a2, a3, a4, a5, a6, a7, 0, 0);
}

unint64_t sub_224AE5ACC(unint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, signed int a6, signed int a7, int a8, int a9)
{
  unint64_t v11 = result;
  uint64_t v12 = (a7 - 4 * a5);
  if ((int)v12 >= 1)
  {
    uint64_t v13 = 0;
    unint64_t v14 = (a6 - 4 * a4);
    uint64_t v15 = a3 << a9;
    uint64_t v16 = 2 * a6;
    uint64_t v17 = a2 + a3;
    unsigned int v18 = (char *)result;
    while ((int)v14 < 1)
    {
      uint64_t result = 0;
LABEL_15:
      if ((int)result < a6)
      {
        uint64_t result = result;
        __int16 v25 = *(_WORD *)(v11 + 2 * (v14 & ~((int)v14 >> 31)) - 2 + v16 * v13);
        do
          *(_WORD *)&v18[2 * result++] = v25;
        while (a6 != result);
      }
      v18 += v16;
      a2 += v15;
      ++v13;
      v17 += v15;
      if (v13 == v12) {
        goto LABEL_21;
      }
    }
    int v19 = 0;
    uint64_t v20 = 1;
    while (1)
    {
      uint64_t v21 = (int)(v19 << a8);
      int v22 = *(unsigned __int8 *)(a2 + v21);
      if (a8)
      {
        v22 += *(unsigned __int8 *)(a2 + v20);
        if (!a9) {
          goto LABEL_11;
        }
        int v23 = v22 + *(unsigned __int8 *)(a2 + v21 + a3);
        int v22 = *(unsigned __int8 *)(v17 + v20);
      }
      else
      {
        if (!a9)
        {
LABEL_11:
          char v24 = 2;
          goto LABEL_12;
        }
        int v23 = *(unsigned __int8 *)(a2 + v21 + a3);
      }
      v22 += v23;
      char v24 = 1;
LABEL_12:
      *(_WORD *)&v18[2 * (void)v19] = v22 << (v24 + (a8 == 0));
      int v19 = (char *)v19 + 1;
      v20 += 2;
      if ((void *)v14 == v19)
      {
        uint64_t result = v14;
        goto LABEL_15;
      }
    }
  }
  LODWORD(v12) = 0;
  unsigned int v18 = (char *)result;
LABEL_21:
  int v26 = a7 - v12;
  if (a7 > (int)v12)
  {
    do
    {
      uint64_t result = (unint64_t)memcpy(v18, &v18[-2 * a6], 2 * a6);
      v18 += 2 * a6;
      --v26;
    }
    while (v26);
  }
  if (a7 >= 1)
  {
    int v27 = 0;
    unsigned int v28 = __clz(__rbit32(a7)) + __clz(__rbit32(a6));
    int v29 = 1 << v28 >> 1;
    unint64_t v30 = v11;
    do
    {
      if (a6 >= 1)
      {
        uint64_t v31 = 0;
        do
        {
          v29 += *(__int16 *)(v30 + v31);
          v31 += 2;
        }
        while (2 * a6 != v31);
      }
      ++v27;
      v30 += 2 * a6;
    }
    while (v27 != a7);
    int v32 = 0;
    int v33 = v29 >> v28;
    do
    {
      if (a6 >= 1)
      {
        uint64_t v34 = 0;
        do
        {
          *(_WORD *)(v11 + v34) -= v33;
          v34 += 2;
        }
        while (2 * a6 != v34);
      }
      ++v32;
      v11 += 2 * a6;
    }
    while (v32 != a7);
  }
  return result;
}

unint64_t sub_224AE5D08(unint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, signed int a6, signed int a7)
{
  return sub_224AE5ACC(a1, a2, a3, a4, a5, a6, a7, 1, 0);
}

unint64_t sub_224AE5D30(unint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, signed int a6, signed int a7)
{
  return sub_224AE5ACC(a1, a2, a3, a4, a5, a6, a7, 1, 1);
}

uint64_t sub_224AE5D5C(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, __int16 a6)
{
  if (a5 >= 1)
  {
    unint64_t v6 = 0;
    uint64_t v7 = (char *)&unk_224B19100 + 64 * (unint64_t)(a6 & 0x1FF);
    uint64_t v8 = (unsigned __int8 *)(a3 + 1);
    unint64_t v9 = a5;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v10 = 0;
        unint64_t v11 = (unsigned __int8 *)(a3 - v6);
        uint64_t v12 = (unsigned __int8 *)(a3 - v6 - 1);
        uint64_t v13 = -1;
        do
        {
          int v14 = *v11;
          int v15 = *v8;
          int v16 = v8[1];
          int v17 = v8[2];
          unint64_t v11 = v8 + 3;
          int v18 = v8[3];
          uint64_t v19 = result + v10;
          char v20 = 1;
          uint64_t v21 = v7;
          int v22 = *v12;
          int v23 = v12[v13];
          do
          {
            uint64_t v24 = 0;
            char v25 = v20;
            do
            {
              int v26 = (v21[v24 + 8] * v15
                   + v21[v24] * v14
                   + v21[v24 + 16] * v16
                   + v21[v24 + 24] * v17
                   + v21[v24 + 32] * v18
                   + v21[v24 + 40] * v22
                   + v21[v24 + 48] * v23
                   + 8) >> 4;
              if (v26 >= 255) {
                int v26 = 255;
              }
              *(unsigned char *)(v19 + v24++) = v26 & ~(v26 >> 31);
            }
            while (v24 != 4);
            char v20 = 0;
            v21 += 4;
            v19 += a2;
          }
          while ((v25 & 1) != 0);
          uint64_t v12 = (unsigned __int8 *)(result + (v10 | 3));
          v8 += 4;
          v10 += 4;
          uint64_t v13 = a2;
        }
        while (v10 < a4);
      }
      uint64_t v8 = (unsigned __int8 *)(result + a2);
      result += 2 * a2;
      v6 += 2;
    }
    while (v6 < v9);
  }
  return result;
}

uint64_t sub_224AE5ECC(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, unsigned int a6)
{
  uint64_t v10 = (unsigned char *)result;
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v11 = a6 & 0x1FF;
  unsigned int v12 = word_224B19060[(270 - v11) >> 1];
  if (a6 < 0x400) {
    goto LABEL_2;
  }
  uint64_t v17 = a5 + (uint64_t)a4;
  if ((v11 - 220) >= 0xFFFFFFD8 && (int)(0x10u >> ((a6 & 0x200) != 0)) >= (int)v17)
  {
    uint64_t result = sub_224AE6110((uint64_t)v27, a5 + a4, a3 - (int)v17, (a4 - a5) & ~((a4 - a5) >> 31), (int)v17 + 1);
    uint64_t v15 = 2 * (int)v17 - 2;
    uint64_t v13 = &v27[v15];
    v12 *= 2;
    uint64_t v16 = 2;
    goto LABEL_11;
  }
  uint64_t result = sub_224AE52E4(a5 + a4, v11 - 180, (a6 >> 9) & 1);
  if (result)
  {
    uint64_t result = sub_224AE61D8((uint64_t)v27, a5 + a4, 0, a5 + a4, a3 - v17, (a4 - a5) & ~((a4 - a5) >> 31), (int)v17 + 1, result);
    uint64_t v15 = (int)v17 - 1;
    uint64_t v13 = &v27[v15];
    uint64_t v16 = 1;
  }
  else
  {
LABEL_2:
    uint64_t v13 = (unsigned char *)(a3 - 1);
    if (a4 >= a5) {
      int v14 = a5;
    }
    else {
      int v14 = a4;
    }
    LODWORD(v15) = a5 + v14 - 1;
    uint64_t v16 = 1;
  }
LABEL_11:
  if (a4 >= 1)
  {
    uint64_t v18 = 0;
    uint64_t v19 = (int)v15;
    uint64_t v20 = -(uint64_t)(int)v15;
    uint64_t result = 64;
    unint64_t v21 = v12;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v22 = 0;
        int v23 = &v13[-(v21 >> 6)];
        int64_t v24 = (unint64_t)~(v21 >> 6) << 32;
        uint64_t v25 = (v21 >> 6) - v16;
        int v26 = v10;
        while (1)
        {
          v25 += v16;
          if (v25 >= v19) {
            break;
          }
          *int v26 = ((v21 & 0x3E) * v13[v24 >> 32] + (64 - (v21 & 0x3E)) * *v23 + 32) >> 6;
          v26 += a2;
          v23 -= v16;
          v24 -= v16 << 32;
          if (a5 == ++v22) {
            goto LABEL_19;
          }
        }
        do
        {
          *int v26 = v13[v20];
          ++v22;
          v26 += a2;
        }
        while (v22 < a5);
      }
LABEL_19:
      ++v18;
      v21 += v12;
      ++v10;
    }
    while (v18 != a4);
  }
  return result;
}

uint64_t sub_224AE6110(uint64_t result, int a2, uint64_t a3, int a4, int a5)
{
  int v5 = a5 - 1;
  if (a2 < 2)
  {
    LODWORD(v7) = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = (a2 - 1);
    do
    {
      uint64_t v8 = 0;
      int v9 = 0;
      if ((int)v6 >= v5) {
        int v10 = a5 - 1;
      }
      else {
        int v10 = v6;
      }
      if (v6 < a4) {
        int v10 = a4;
      }
      *(unsigned char *)(result + 2 * v6) = *(unsigned char *)(a3 + v10);
      do
      {
        int v11 = v6 + v8 - 1;
        if (v11 >= v5) {
          int v11 = a5 - 1;
        }
        if (v6 + v8 <= a4) {
          int v12 = a4;
        }
        else {
          int v12 = v11;
        }
        v9 += byte_224B190B8[v8++] * *(unsigned __int8 *)(a3 + v12);
      }
      while (v8 != 4);
      int v13 = (v9 + 8) >> 4;
      if (v13 >= 255) {
        int v13 = 255;
      }
      *(unsigned char *)(result + ((2 * v6++) | 1)) = v13 & ~(v13 >> 31);
    }
    while (v6 != v7);
  }
  if ((int)v7 < v5) {
    int v5 = v7;
  }
  if ((int)v7 < a4) {
    int v5 = a4;
  }
  *(unsigned char *)(result + 2 * v7) = *(unsigned char *)(a3 + v5);
  return result;
}

uint64_t sub_224AE61D8(uint64_t result, int a2, int a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  if (a2 >= a3) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = a2;
  }
  if ((int)v8 < 1)
  {
    LODWORD(v8) = 0;
  }
  else
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if ((int)i >= a7 - 1) {
        int v10 = a7 - 1;
      }
      else {
        int v10 = i;
      }
      if (i < a6) {
        int v10 = a6;
      }
      *(unsigned char *)(result + i) = *(unsigned char *)(a5 + v10);
    }
  }
  if (a4 >= a2) {
    uint64_t v11 = a2;
  }
  else {
    uint64_t v11 = a4;
  }
  if ((int)v8 < (int)v11)
  {
    uint64_t v8 = v8;
    do
    {
      int v12 = 0;
      for (uint64_t j = -2; j != 3; ++j)
      {
        if ((int)v8 + (int)j >= a7 - 1) {
          int v14 = a7 - 1;
        }
        else {
          int v14 = v8 + j;
        }
        if (v8 + j >= a6) {
          int v15 = v14;
        }
        else {
          int v15 = a6;
        }
        v12 += byte_224B190BC[5 * (a8 - 1) + 2 + j] * *(unsigned __int8 *)(a5 + v15);
      }
      *(unsigned char *)(result + v8++) = (v12 + 8) >> 4;
    }
    while (v8 != v11);
    LODWORD(v8) = v11;
  }
  if ((int)v8 < a2)
  {
    uint64_t v8 = v8;
    do
    {
      if ((int)v8 >= a7 - 1) {
        int v16 = a7 - 1;
      }
      else {
        int v16 = v8;
      }
      if ((int)v8 < a6) {
        int v16 = a6;
      }
      *(unsigned char *)(result + v8++) = *(unsigned char *)(a5 + v16);
    }
    while (a2 != v8);
  }
  return result;
}

uint64_t sub_224AE62E4(uint64_t a1, uint64_t a2, unsigned char *a3, int a4, int a5, unsigned int a6, int a7, int a8)
{
  v40[8] = *MEMORY[0x263EF8340];
  int v14 = (a6 >> 9) & 1;
  unsigned int v15 = (a6 & 0x1FF) - 90;
  int v16 = *(unsigned __int16 *)((char *)word_224B19060 + (v15 & 0xFFFFFFFE));
  int v36 = 180 - (a6 & 0x1FF);
  int v17 = *(unsigned __int16 *)((char *)word_224B19060 + (v36 & 0xFFFFFFFE));
  int v37 = v14;
  if (a6 > 0x3FF)
  {
    signed int v18 = a5 + a4;
    signed int v19 = 0x10u >> v14;
    BOOL v21 = (a6 & 0x1FF) > 0x8C && v19 >= v18;
    int v38 = v21;
    if (v15 <= 0x27 && v19 >= v18)
    {
      sub_224AE6110((uint64_t)v39, a4 + 1, (uint64_t)a3, 0, a4 + 1);
      v17 *= 2;
      int v22 = 2;
      goto LABEL_16;
    }
    int v23 = sub_224AE52E4(v18, v15, v14);
    if (v23)
    {
      sub_224AE61D8((uint64_t)v40, a4, 0, a7, (uint64_t)(a3 + 1), -1, a4, v23);
      goto LABEL_15;
    }
  }
  else
  {
    int v38 = 0;
  }
  __memcpy_chk();
LABEL_15:
  int v22 = 1;
LABEL_16:
  if (v38)
  {
    uint64_t result = sub_224AE6110((uint64_t)&v39[-2 * a5], a5 + 1, (uint64_t)&a3[-a5], 0, a5 + 1);
    v16 *= 2;
  }
  else if (a6 >= 0x400 && (int v25 = sub_224AE52E4(a5 + a4, v36, v37)) != 0)
  {
    uint64_t result = sub_224AE61D8((uint64_t)&v39[-a5], a5, a5 - a8, a5, (uint64_t)&a3[-a5], 0, a5 + 1, v25);
  }
  else
  {
    uint64_t result = (uint64_t)memcpy(&v39[-a5], &a3[-a5], a5);
  }
  v39[0] = *a3;
  if (a5 >= 1)
  {
    int v26 = 0;
    int v27 = v22 << 6;
    uint64_t v28 = &v39[~v38];
    do
    {
      v27 -= v17;
      if (a4 >= 1)
      {
        uint64_t v29 = 0;
        LODWORD(result) = v27 >> 6;
        int v30 = (v26 << (v38 | 6)) - v16;
        do
        {
          if ((result & 0x80000000) != 0)
          {
            int v33 = v30 & 0x3E;
            int v31 = (64 - v33) * v28[-(v30 >> 6)];
            int v32 = &v28[~(v30 >> 6)];
          }
          else
          {
            int v31 = (64 - (v27 & 0x3E)) * v39[result];
            int v32 = &v39[(result + 1)];
            int v33 = v27 & 0x3E;
          }
          *(unsigned char *)(a1 + v29++) = (v31 + v33 * *v32 + 32) >> 6;
          uint64_t result = (result + v22);
          v30 -= v16;
        }
        while (a4 != v29);
      }
      ++v26;
      a1 += a2;
    }
    while (v26 != a5);
  }
  return result;
}

uint64_t sub_224AE65B4(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, unsigned int a6)
{
  uint64_t v9 = result;
  uint64_t v27 = *MEMORY[0x263EF8340];
  LODWORD(v10) = *(unsigned __int16 *)((char *)word_224B19060 + (a6 & 0x1FE));
  uint64_t v25 = a2;
  if (a6 < 0x400) {
    goto LABEL_2;
  }
  signed int v13 = a5 + a4;
  if ((a6 & 0x1FF) < 0x33 || (int)(0x10u >> ((a6 & 0x200) != 0)) < v13)
  {
    uint64_t result = sub_224AE52E4(a5 + a4, 90 - (a6 & 0x1FF), (a6 >> 9) & 1);
    a2 = v25;
    if (result)
    {
      uint64_t v18 = a3 + 1;
      if (a4 >= a5) {
        int v19 = a5;
      }
      else {
        int v19 = a4;
      }
      uint64_t v11 = v26;
      uint64_t result = sub_224AE61D8((uint64_t)v26, a5 + a4, 0, a5 + a4, v18, -1, v19 + a4, result);
      a2 = v25;
      goto LABEL_17;
    }
LABEL_2:
    uint64_t v11 = (unsigned char *)(a3 + 1);
    if (a4 >= a5) {
      int v12 = a5;
    }
    else {
      int v12 = a4;
    }
    signed int v13 = v12 + a4;
LABEL_17:
    int v16 = v13 - 1;
    uint64_t v17 = 1;
    goto LABEL_18;
  }
  uint64_t v14 = a3 + 1;
  if (a4 >= a5) {
    int v15 = a5;
  }
  else {
    int v15 = a4;
  }
  uint64_t v11 = v26;
  uint64_t result = sub_224AE6110((uint64_t)v26, a5 + a4, v14, -1, v15 + a4);
  int v16 = 2 * v13 - 2;
  LODWORD(v10) = 2 * v10;
  uint64_t v17 = 2;
  a2 = v25;
LABEL_18:
  if (a5 >= 1)
  {
    int v20 = 0;
    uint64_t v21 = v16;
    uint64_t v22 = v10;
    unint64_t v10 = v10;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v23 = 0;
        int64_t v24 = v10 >> 6;
        while (v24 < v21)
        {
          *(unsigned char *)(v9 + v23++) = ((v10 & 0x3E) * v11[v24 + 1]
                                  + (64 - (v10 & 0x3E)) * v11[v24]
                                  + 32) >> 6;
          v24 += v17;
          if (a4 == v23) {
            goto LABEL_26;
          }
        }
        uint64_t result = (uint64_t)memset((void *)(v9 + v23), v11[v21], a4 - (int)v23);
        a2 = v25;
      }
LABEL_26:
      ++v20;
      v9 += a2;
      v10 += v22;
    }
    while (v20 != a5);
  }
  return result;
}

uint64_t sub_224AE67BC(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v5 = 0;
    __int16 v6 = *(unsigned __int8 *)(a3 + a4);
    do
    {
      if (a4 >= 1)
      {
        for (uint64_t i = 0; i != a4; ++i)
          *(unsigned char *)(result + i) = (unsigned __int16)(*(unsigned __int8 *)(a3 + ~v5) * byte_224B18FE0[a4 + i]
                                                    + (256 - byte_224B18FE0[a4 + i]) * v6
                                                    + 128) >> 8;
      }
      result += a2;
      ++v5;
    }
    while (v5 != a5);
  }
  return result;
}

uint64_t sub_224AE6834(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v5 = 0;
    __int16 v6 = *(unsigned __int8 *)(a3 - a5);
    do
    {
      if (a4 >= 1)
      {
        uint64_t v7 = 0;
        __int16 v8 = byte_224B18FE0[a5 + v5];
        do
        {
          *(unsigned char *)(result + v7) = (unsigned __int16)((256 - v8) * v6 + 128 + *(unsigned __int8 *)(a3 + 1 + v7) * v8) >> 8;
          ++v7;
        }
        while (a4 != v7);
      }
      result += a2;
      ++v5;
    }
    while (v5 != a5);
  }
  return result;
}

uint64_t sub_224AE68B4(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v5 = 0;
    __int16 v6 = &byte_224B18FE0[a5];
    int v7 = *(unsigned __int8 *)(a3 + a4);
    int v8 = *(unsigned __int8 *)(a3 - a5);
    uint64_t v9 = a5;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v10 = 0;
        int v11 = v6[v5];
        do
        {
          *(unsigned char *)(result + v10) = ((256 - v11) * v8
                                    + 256
                                    + *(unsigned __int8 *)(a3 + 1 + v10) * v11
                                    + *(unsigned __int8 *)(a3 + ~v5) * byte_224B18FE0[a4 + v10]
                                    + (256 - byte_224B18FE0[a4 + v10]) * v7) >> 9;
          ++v10;
        }
        while (a4 != v10);
      }
      result += a2;
      ++v5;
    }
    while (v5 != v9);
  }
  return result;
}

uint64_t sub_224AE6964(uint64_t result, uint64_t a2, unsigned __int8 *a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v5 = 0;
    int v6 = *a3;
    uint64_t v7 = a5;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v8 = 0;
        int v9 = a3[~v5];
        int v10 = v9 - v6;
        if (v9 - v6 >= 0) {
          unsigned int v11 = v9 - v6;
        }
        else {
          unsigned int v11 = v6 - v9;
        }
        do
        {
          int v12 = a3[v8 + 1];
          unsigned int v13 = v6 - v12;
          if (v6 - v12 < 0) {
            unsigned int v13 = v12 - v6;
          }
          int v14 = v6 - (v10 + v12);
          if (v14 < 0) {
            int v14 = v10 + v12 - v6;
          }
          if (v11 > v14) {
            LOBYTE(v12) = v6;
          }
          if (v13 <= v14 && v13 <= v11) {
            LOBYTE(v12) = v9;
          }
          *(unsigned char *)(result + v8++) = v12;
        }
        while (a4 != v8);
      }
      ++v5;
      result += a2;
    }
    while (v5 != v7);
  }
  return result;
}

char *sub_224AE69F0(char *__dst, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    int v5 = a5;
    uint64_t v7 = __dst;
    uint64_t v8 = (const void *)(a3 + 1);
    size_t v9 = a4;
    do
    {
      __dst = (char *)memcpy(v7, v8, v9);
      v7 += a2;
      --v5;
    }
    while (v5);
  }
  return __dst;
}

char *sub_224AE6A58(char *__b, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    int v6 = __b;
    size_t v7 = a4;
    uint64_t v8 = (unsigned __int8 *)(a3 - 1);
    uint64_t v9 = a5;
    do
    {
      int v10 = *v8--;
      __b = (char *)memset(v6, v10, v7);
      v6 += a2;
      --v9;
    }
    while (v9);
  }
  return __b;
}

_DWORD *sub_224AE6AC0(_DWORD *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  unsigned int v5 = a5 >> 1;
  if (a5 >= 1)
  {
    uint64_t v6 = a5;
    size_t v7 = (unsigned __int8 *)(a3 - 1);
    do
    {
      int v8 = *v7--;
      v5 += v8;
      --v6;
    }
    while (v6);
  }
  return sub_224AE6B00(a1, a2, a4, a5, v5 >> __clz(__rbit32(a5)));
}

_DWORD *sub_224AE6B00(_DWORD *result, uint64_t a2, int a3, int a4, int a5)
{
  if (a3 < 5)
  {
    if (a4 >= 1)
    {
      do
      {
        if (a3 >= 1) {
          *uint64_t result = 16843009 * a5;
        }
        uint64_t result = (_DWORD *)((char *)result + a2);
        --a4;
      }
      while (a4);
    }
  }
  else if (a4 >= 1)
  {
    for (int i = 0; i != a4; ++i)
    {
      for (unint64_t j = 0; j < a3; j += 8)
        *(void *)&result[j / 4] = 0x101010101010101 * a5;
      uint64_t result = (_DWORD *)((char *)result + a2);
    }
  }
  return result;
}

_DWORD *sub_224AE6B78(_DWORD *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  unsigned int v5 = a4 >> 1;
  if (a4 >= 1)
  {
    uint64_t v6 = a4;
    size_t v7 = (unsigned __int8 *)(a3 + 1);
    do
    {
      int v8 = *v7++;
      v5 += v8;
      --v6;
    }
    while (v6);
  }
  return sub_224AE6B00(a1, a2, a4, a5, v5 >> __clz(__rbit32(a4)));
}

_DWORD *sub_224AE6BB8(_DWORD *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  return sub_224AE6B00(a1, a2, a4, a5, 128);
}

_DWORD *sub_224AE6BC8(_DWORD *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v9 = sub_224AE5A20(a3, a4, a5);

  return sub_224AE6B00(a1, a2, a4, a5, v9);
}

_OWORD *sub_224AE6C30(_OWORD *a1, uint64_t a2, __int16 *a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v14 = a6 & 0x1FF;
  uint64_t v15 = word_224B19060[(270 - v14) >> 1];
  if (a6 < 0x400) {
    goto LABEL_2;
  }
  signed int v17 = a5 + a4;
  if ((v14 - 220) < 0xFFFFFFD8 || (int)(0x10u >> ((a6 & 0x200) != 0)) < v17)
  {
    unsigned int v23 = sub_224AE52E4(a5 + (int)a4, v14 - 180, (a6 >> 9) & 1);
    if (v23)
    {
      unsigned int v24 = v23;
      v30[0].i16[0] = *a3;
      if ((int)a4 <= a5) {
        int v25 = a5;
      }
      else {
        int v25 = a4;
      }
      if ((int)a4 >= a5) {
        int v26 = a5;
      }
      else {
        int v26 = a4;
      }
      sub_224AAA95C((uint64_t *)((char *)v30[0].i64 + 2), (uint64_t)a3, v25 + a5);
      sub_224AAA32C((uint16x8_t *)v29, a5 + a4, v30, v26 + a5, v24);
      goto LABEL_23;
    }
LABEL_2:
    if ((int)a4 >= a5) {
      int v16 = a5;
    }
    else {
      int v16 = a4;
    }
    signed int v17 = v16 + a5;
    sub_224AAA95C(v29, (uint64_t)a3, v16 + a5);
LABEL_23:
    int v21 = v17 - 1;
    char v20 = 1;
    int v22 = 1;
    goto LABEL_24;
  }
  v30[0].i16[0] = *a3;
  if ((int)a4 <= a5) {
    int v18 = a5;
  }
  else {
    int v18 = a4;
  }
  if ((int)a4 >= a5) {
    int v19 = a5;
  }
  else {
    int v19 = a4;
  }
  sub_224AAA95C((uint64_t *)((char *)v30[0].i64 + 2), (uint64_t)a3, v18 + a5);
  sub_224AAA210(v29, (a5 + a4), v30, v19 + a5, a9);
  char v20 = 0;
  int v21 = 2 * v17 - 2;
  uint64_t v15 = (2 * v15);
  int v22 = 2;
LABEL_24:
  int v27 = 63 - v21;
  if (63 - v21 <= a5 + 15) {
    int v27 = a5 + 15;
  }
  sub_224AAA554((int16x8_t *)&v29[0].i16[v21 + 1], v29[0].u16[v21], v27 * v22);
  if (v20) {
    return (_OWORD *)sub_224AAB8F8((uint64_t)a1, a2, (uint64_t)v29, a4, a5, v15, v21);
  }
  else {
    return sub_224AABD24(a1, a2, (uint64_t)v29, a4, a5, v15, v21);
  }
}

int8x16_t *sub_224AE6E2C(int8x16_t *a1, uint64_t a2, int8x16_t *a3, signed int a4, signed int a5, unsigned int a6, signed int a7, signed int a8, unsigned int a9)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  int v13 = (a6 >> 9) & 1;
  unsigned int v14 = (a6 & 0x1FF) - 90;
  int v30 = *(unsigned __int16 *)((char *)word_224B19060 + (v14 & 0xFFFFFFFE));
  int v15 = 180 - (a6 & 0x1FF);
  int v32 = *(unsigned __int16 *)((char *)word_224B19060 + (v15 & 0xFFFFFFFE));
  if (a6 <= 0x3FF)
  {
    BOOL v16 = 0;
LABEL_3:
    __memcpy_chk();
    goto LABEL_4;
  }
  signed int v20 = a5 + a4;
  signed int v21 = 0x10u >> ((a6 & 0x200) != 0);
  BOOL v16 = (a6 & 0x1FF) > 0x8C && v21 >= v20;
  if (v14 <= 0x27 && v21 >= v20)
  {
    sub_224AAA2B4(v34, a4, a3, a9);
    v32 *= 2;
    char v17 = 1;
    if (v16) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  unsigned int v26 = sub_224AE52E4(v20, v14, (a6 >> 9) & 1);
  if (!v26) {
    goto LABEL_3;
  }
  if (a7 >= a4) {
    int v27 = a4;
  }
  else {
    int v27 = a7;
  }
  sub_224AAA32C((uint16x8_t *)&v34[0].i16[1], v27, a3, a4, v26);
  if (a4 > a7) {
    memcpy(&v34[0].i16[a7 + 1], &a3->i16[a7 + 1], 2 * (a4 - a7));
  }
LABEL_4:
  char v17 = 0;
  if (v16)
  {
LABEL_5:
    v33.i16[0] = a3->i16[0];
    sub_224AAA95C((uint64_t *)((char *)v33.i64 + 2), (uint64_t)a3, a5);
    sub_224AAA2B4(v35, a5, &v33, a9);
    v35[0].i16[0] = a3->i16[0];
    v34[0].i16[0] = v35[0].i16[0];
    return sub_224AAB5A8(a1, a2, (uint64_t)v34, (long long *)v35[0].i8, a4, a5, v32, 2 * v30);
  }
LABEL_15:
  if (a6 >= 0x400 && (unsigned int v23 = sub_224AE52E4(a5 + a4, v15, v13)) != 0)
  {
    unsigned int v24 = v23;
    v33.i16[0] = a3->i16[0];
    sub_224AAA95C((uint64_t *)((char *)v33.i64 + 2), (uint64_t)a3, a5);
    if (a8 >= a5) {
      int v25 = a5;
    }
    else {
      int v25 = a8;
    }
    sub_224AAA32C((uint16x8_t *)&v35[0].i16[1], v25, &v33, a5, v24);
    if (a5 > a8) {
      memcpy(&v35[0].i16[a8 + 1], &v33.i16[a8 + 1], 2 * (a5 - a8));
    }
  }
  else
  {
    sub_224AAA95C((uint64_t *)((char *)v35[0].i64 + 2), (uint64_t)a3, a5);
  }
  v35[0].i16[0] = a3->i16[0];
  v34[0].i16[0] = v35[0].i16[0];
  if (v17) {
    return sub_224AAB264(a1, a2, (uint64_t)v34, (uint64_t)v35, a4, a5, v32, v30);
  }
  else {
    return (int8x16_t *)sub_224AAA988((uint64_t)a1, a2, (uint64_t)v34, (uint64_t)v35, a4);
  }
}

int16x8_t *sub_224AE712C(int16x8_t *a1, uint64_t a2, int8x16_t *a3, int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v14 = *(unsigned __int16 *)((char *)word_224B19060 + (a6 & 0x1FE));
  if (a6 < 0x400) {
    goto LABEL_2;
  }
  signed int v16 = a5 + a4;
  if ((a6 & 0x1FF) < 0x33 || (int)(0x10u >> ((a6 & 0x200) != 0)) < v16)
  {
    unsigned int v21 = sub_224AE52E4((int)a5 + a4, 90 - (a6 & 0x1FF), (a6 >> 9) & 1);
    if (v21)
    {
      if (a4 >= (int)a5) {
        int v22 = a5;
      }
      else {
        int v22 = a4;
      }
      sub_224AAA32C((uint16x8_t *)v24, a5 + a4, a3, v22 + a4, v21);
      goto LABEL_17;
    }
LABEL_2:
    if (a4 >= (int)a5) {
      int v15 = a5;
    }
    else {
      int v15 = a4;
    }
    signed int v16 = v15 + a4;
    __memcpy_chk();
LABEL_17:
    int v19 = v16 - 1;
    char v18 = 1;
    int v20 = 1;
    goto LABEL_18;
  }
  if (a4 >= (int)a5) {
    int v17 = a5;
  }
  else {
    int v17 = a4;
  }
  sub_224AAA210(v24, (a5 + a4), a3, v17 + a4, a9);
  char v18 = 0;
  int v19 = 2 * v16 - 2;
  uint64_t v14 = (2 * v14);
  int v20 = 2;
LABEL_18:
  sub_224AAA554((int16x8_t *)&v24[0].i16[v19 + 1], v24[0].u16[v19], v20 * (a4 + 15));
  if (v18) {
    return (int16x8_t *)sub_224AAA568((uint64_t)a1, a2, (uint64_t)v24, a4, a5, v14, v19);
  }
  else {
    return sub_224AAA804(a1, a2, (uint64_t)v24, a4, a5, v14, v19);
  }
}

uint64_t sub_224AE72C4(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 *a4, int a5, int a6)
{
  if (a6 >= 1)
  {
    for (int i = 0; i != a6; ++i)
    {
      if (a5 >= 1)
      {
        for (uint64_t j = 0; j < a5; j += 2)
        {
          unsigned int v8 = *a4++;
          int v9 = (_WORD *)(result + 2 * j);
          *int v9 = *(_WORD *)(a3 + 2 * (v8 & 7));
          v9[1] = *(_WORD *)(a3 + (((unint64_t)v8 >> 3) & 0x1E));
        }
      }
      result += a2 & 0xFFFFFFFFFFFFFFFELL;
    }
  }
  return result;
}

uint64_t sub_224AE7328(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, int a8)
{
  unsigned int v8 = a5 >> 1;
  if (a5 >= 1)
  {
    uint64_t v9 = a5;
    int v10 = (unsigned __int16 *)(a3 - 2);
    do
    {
      int v11 = *v10--;
      v8 += v11;
      --v9;
    }
    while (v9);
  }
  return sub_224AE7368(a1, a2, a4, a5, v8 >> __clz(__rbit32(a5)), a6, a7, a8);
}

uint64_t sub_224AE7368(uint64_t result, uint64_t a2, int a3, int a4, int a5, uint64_t a6, int a7, int a8)
{
  if (a4 >= 1)
  {
    for (int i = 0; i != a4; ++i)
    {
      if (a3 >= 1)
      {
        uint64_t v9 = 0;
        do
        {
          int v10 = *(__int16 *)(a6 + v9) * a7;
          BOOL v11 = v10 < 0;
          if (v10 < 0) {
            int v10 = -v10;
          }
          unsigned int v12 = (v10 + 32) >> 6;
          if (v11) {
            unsigned int v12 = -v12;
          }
          int v13 = v12 + a5;
          if (v13 >= a8) {
            __int16 v14 = a8;
          }
          else {
            __int16 v14 = v13;
          }
          if (v13 >= 0) {
            __int16 v15 = v14;
          }
          else {
            __int16 v15 = 0;
          }
          *(_WORD *)(result + v9) = v15;
          v9 += 2;
        }
        while (2 * a3 != v9);
      }
      result += a2 & 0xFFFFFFFFFFFFFFFELL;
      a6 += 2 * a3;
    }
  }
  return result;
}

uint64_t sub_224AE73E4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, int a8)
{
  unsigned int v8 = a4 >> 1;
  if (a4 >= 1)
  {
    uint64_t v9 = a4;
    int v10 = (unsigned __int16 *)(a3 + 2);
    do
    {
      int v11 = *v10++;
      v8 += v11;
      --v9;
    }
    while (v9);
  }
  return sub_224AE7368(a1, a2, a4, a5, v8 >> __clz(__rbit32(a4)), a6, a7, a8);
}

uint64_t sub_224AE7424(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, int a8)
{
  return sub_224AE7368(a1, a2, a4, a5, (a8 + 1) >> 1, a6, a7, a8);
}

uint64_t sub_224AE743C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, int a8)
{
  int v15 = sub_224AE74CC(a3, a4, a5);

  return sub_224AE7368(a1, a2, a4, a5, v15, a6, a7, a8);
}

uint64_t sub_224AE74CC(uint64_t a1, int a2, int a3)
{
  unsigned int v3 = (a3 + a2) >> 1;
  if (a2 >= 1)
  {
    uint64_t v4 = a2;
    unsigned int v5 = (unsigned __int16 *)(a1 + 2);
    do
    {
      int v6 = *v5++;
      v3 += v6;
      --v4;
    }
    while (v4);
  }
  if (a3 >= 1)
  {
    uint64_t v7 = a3;
    unsigned int v8 = (unsigned __int16 *)(a1 - 2);
    do
    {
      int v9 = *v8--;
      v3 += v9;
      --v7;
    }
    while (v7);
  }
  unsigned int v10 = v3 >> __clz(__rbit32(a3 + a2));
  if (2 * a2 < a3 || 2 * a3 < a2) {
    int v12 = 26215;
  }
  else {
    int v12 = 43691;
  }
  unsigned int v13 = (v10 * v12) >> 17;
  if (a2 == a3) {
    return v10;
  }
  else {
    return v13;
  }
}

unint64_t sub_224AE7550(unint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, signed int a6, signed int a7)
{
  return sub_224AE7578(a1, a2, a3, a4, a5, a6, a7, 0, 0);
}

unint64_t sub_224AE7578(unint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, signed int a6, signed int a7, int a8, int a9)
{
  unint64_t v11 = result;
  uint64_t v12 = (a7 - 4 * a5);
  if ((int)v12 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = a3 >> 1;
    unint64_t v15 = (a6 - 4 * a4);
    uint64_t v16 = 2 * a6;
    int v17 = (char *)result;
    while ((int)v15 < 1)
    {
      uint64_t result = 0;
LABEL_14:
      if ((int)result < a6)
      {
        uint64_t result = result;
        __int16 v23 = *(_WORD *)(v11 + 2 * (v15 & ~((int)v15 >> 31)) - 2 + v16 * v13);
        do
          *(_WORD *)&v17[2 * result++] = v23;
        while (a6 != result);
      }
      v17 += v16;
      a2 += 2 * (v14 << a9);
      if (++v13 == v12) {
        goto LABEL_20;
      }
    }
    char v18 = 0;
    uint64_t v19 = 1;
    while (1)
    {
      uint64_t v20 = (int)(v18 << a8);
      int v21 = *(unsigned __int16 *)(a2 + 2 * v20);
      if (a8)
      {
        v21 += *(unsigned __int16 *)(a2 + 2 * v19);
        if (!a9) {
          goto LABEL_10;
        }
        v21 += *(unsigned __int16 *)(a2 + 2 * (v14 + v20));
        uint64_t v20 = v19;
      }
      else if (!a9)
      {
LABEL_10:
        char v22 = 2;
        goto LABEL_11;
      }
      v21 += *(unsigned __int16 *)(a2 + 2 * (v14 + v20));
      char v22 = 1;
LABEL_11:
      *(_WORD *)&v17[2 * (void)v18] = v21 << (v22 + (a8 == 0));
      char v18 = (char *)v18 + 1;
      v19 += 2;
      if ((void *)v15 == v18)
      {
        uint64_t result = v15;
        goto LABEL_14;
      }
    }
  }
  LODWORD(v12) = 0;
  int v17 = (char *)result;
LABEL_20:
  int v24 = a7 - v12;
  if (a7 > (int)v12)
  {
    do
    {
      uint64_t result = (unint64_t)memcpy(v17, &v17[-2 * a6], 2 * a6);
      v17 += 2 * a6;
      --v24;
    }
    while (v24);
  }
  if (a7 >= 1)
  {
    int v25 = 0;
    unsigned int v26 = __clz(__rbit32(a7)) + __clz(__rbit32(a6));
    int v27 = 1 << v26 >> 1;
    unint64_t v28 = v11;
    do
    {
      if (a6 >= 1)
      {
        uint64_t v29 = 0;
        do
        {
          v27 += *(__int16 *)(v28 + v29);
          v29 += 2;
        }
        while (2 * a6 != v29);
      }
      ++v25;
      v28 += 2 * a6;
    }
    while (v25 != a7);
    int v30 = 0;
    int v31 = v27 >> v26;
    do
    {
      if (a6 >= 1)
      {
        uint64_t v32 = 0;
        do
        {
          *(_WORD *)(v11 + v32) -= v31;
          v32 += 2;
        }
        while (2 * a6 != v32);
      }
      ++v30;
      v11 += 2 * a6;
    }
    while (v30 != a7);
  }
  return result;
}

unint64_t sub_224AE77B4(unint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, signed int a6, signed int a7)
{
  return sub_224AE7578(a1, a2, a3, a4, a5, a6, a7, 1, 0);
}

unint64_t sub_224AE77DC(unint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, signed int a6, signed int a7)
{
  return sub_224AE7578(a1, a2, a3, a4, a5, a6, a7, 1, 1);
}

uint64_t sub_224AE7808(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, __int16 a6, uint64_t a7, uint64_t a8, int a9)
{
  if (a5 >= 1)
  {
    unint64_t v9 = 0;
    unsigned int v10 = (char *)&unk_224B19100 + 64 * (unint64_t)(a6 & 0x1FF);
    uint64_t v11 = a2 >> 1;
    uint64_t v12 = (unsigned __int16 *)(a3 + 2);
    uint64_t v13 = 2 * a2;
    unint64_t v14 = a2 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v15 = a5;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v16 = 0;
        int v17 = (unsigned __int16 *)(a3 - 2 * v9);
        char v18 = v17 - 1;
        uint64_t v19 = -1;
        uint64_t v20 = result;
        do
        {
          int v21 = *v17;
          int v22 = *v12;
          int v23 = v12[1];
          int v24 = v12[2];
          int v17 = v12 + 3;
          int v25 = v12[3];
          char v26 = 1;
          uint64_t v27 = v20;
          unint64_t v28 = v10;
          int v29 = *v18;
          int v30 = v18[v19];
          do
          {
            uint64_t v31 = 0;
            char v32 = v26;
            do
            {
              int v33 = v28[v31] * v21
                  + v28[v31 + 8] * v22
                  + v28[v31 + 16] * v23
                  + v28[v31 + 24] * v24
                  + v28[v31 + 32] * v25
                  + v28[v31 + 40] * v29
                  + v28[v31 + 48] * v30;
              int v34 = (v33 + 8) >> 4;
              if (v34 >= a9) {
                LOWORD(v34) = a9;
              }
              if (v33 >= -8) {
                __int16 v35 = v34;
              }
              else {
                __int16 v35 = 0;
              }
              *(_WORD *)(v27 + 2 * v31++) = v35;
            }
            while (v31 != 4);
            char v26 = 0;
            v28 += 4;
            v27 += v14;
          }
          while ((v32 & 1) != 0);
          char v18 = (unsigned __int16 *)(result + ((2 * v16) | 6));
          v12 += 4;
          v20 += 8;
          v16 += 4;
          uint64_t v19 = v11;
        }
        while (v16 < a4);
      }
      uint64_t v12 = (unsigned __int16 *)(result + 2 * v11);
      result += v13;
      v9 += 2;
    }
    while (v9 < v15);
  }
  return result;
}

uint64_t sub_224AE797C(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, unsigned int a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v13 = (_WORD *)result;
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v14 = a6 & 0x1FF;
  unsigned int v15 = word_224B19060[(270 - v14) >> 1];
  if (a6 < 0x400) {
    goto LABEL_2;
  }
  signed int v20 = a5 + a4;
  if ((v14 - 220) >= 0xFFFFFFD8 && (int)(0x10u >> ((a6 & 0x200) != 0)) >= v20)
  {
    uint64_t result = sub_224AE7BCC((uint64_t)v30, a5 + a4, a3 - 2 * v20, (a4 - a5) & ~((a4 - a5) >> 31), v20 + 1, a9);
    uint64_t v18 = 2 * v20 - 2;
    uint64_t v16 = &v30[v18];
    v15 *= 2;
    uint64_t v19 = 2;
    goto LABEL_11;
  }
  uint64_t result = sub_224AE52E4(a5 + a4, v14 - 180, (a6 >> 9) & 1);
  if (result)
  {
    uint64_t result = sub_224AE7C9C((uint64_t)v30, a5 + a4, 0, a5 + a4, a3 - 2 * v20, (a4 - a5) & ~((a4 - a5) >> 31), v20 + 1, result);
    LODWORD(v18) = v20 - 1;
    uint64_t v16 = &v30[v20 - 1];
    uint64_t v19 = 1;
  }
  else
  {
LABEL_2:
    uint64_t v16 = (_WORD *)(a3 - 2);
    if (a4 >= a5) {
      int v17 = a5;
    }
    else {
      int v17 = a4;
    }
    LODWORD(v18) = a5 + v17 - 1;
    uint64_t v19 = 1;
  }
LABEL_11:
  if (a4 >= 1)
  {
    uint64_t v21 = 0;
    uint64_t v22 = a4;
    unint64_t v23 = a2 & 0xFFFFFFFFFFFFFFFELL;
    uint64_t result = a5;
    unint64_t v24 = v15;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v25 = 0;
        char v26 = &v16[-(v24 >> 6)];
        int64_t v27 = (unint64_t)~(v24 >> 6) << 32;
        uint64_t v28 = (v24 >> 6) - v19;
        int v29 = v13;
        while (1)
        {
          v28 += v19;
          if (v28 >= (int)v18) {
            break;
          }
          *int v29 = ((v24 & 0x3E) * *(unsigned __int16 *)((char *)v16 + (v27 >> 31)) + (64 - (v24 & 0x3E)) * *v26 + 32) >> 6;
          int v29 = (_WORD *)((char *)v29 + v23);
          v26 -= v19;
          v27 -= v19 << 32;
          if (a5 == ++v25) {
            goto LABEL_19;
          }
        }
        do
        {
          *int v29 = v16[-(int)v18];
          ++v25;
          int v29 = (_WORD *)((char *)v29 + v23);
        }
        while (v25 < a5);
      }
LABEL_19:
      ++v21;
      v24 += v15;
      ++v13;
    }
    while (v21 != v22);
  }
  return result;
}

uint64_t sub_224AE7BCC(uint64_t result, int a2, uint64_t a3, int a4, int a5, int a6)
{
  int v6 = a5 - 1;
  if (a2 < 2)
  {
    LODWORD(v8) = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = (a2 - 1);
    do
    {
      uint64_t v9 = 0;
      int v10 = 0;
      if ((int)v7 >= v6) {
        int v11 = a5 - 1;
      }
      else {
        int v11 = v7;
      }
      if (v7 < a4) {
        int v11 = a4;
      }
      *(_WORD *)(result + 4 * v7) = *(_WORD *)(a3 + 2 * v11);
      do
      {
        int v12 = v7 + v9 - 1;
        if (v12 >= v6) {
          int v12 = a5 - 1;
        }
        if (v7 + v9 <= a4) {
          int v13 = a4;
        }
        else {
          int v13 = v12;
        }
        v10 += byte_224B190B8[v9++] * *(unsigned __int16 *)(a3 + 2 * v13);
      }
      while (v9 != 4);
      int v14 = (v10 + 8) >> 4;
      if (v14 >= a6) {
        LOWORD(v14) = a6;
      }
      if (v10 >= -8) {
        __int16 v15 = v14;
      }
      else {
        __int16 v15 = 0;
      }
      *(_WORD *)(result + ((4 * v7++) | 2)) = v15;
    }
    while (v7 != v8);
  }
  if ((int)v8 < v6) {
    int v6 = v8;
  }
  if ((int)v8 < a4) {
    int v6 = a4;
  }
  *(_WORD *)(result + 2 * (2 * v8)) = *(_WORD *)(a3 + 2 * v6);
  return result;
}

uint64_t sub_224AE7C9C(uint64_t result, int a2, int a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  if (a2 >= a3) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = a2;
  }
  if ((int)v8 < 1)
  {
    LODWORD(v8) = 0;
  }
  else
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if ((int)i >= a7 - 1) {
        int v10 = a7 - 1;
      }
      else {
        int v10 = i;
      }
      if (i < a6) {
        int v10 = a6;
      }
      *(_WORD *)(result + 2 * i) = *(_WORD *)(a5 + 2 * v10);
    }
  }
  if (a4 >= a2) {
    uint64_t v11 = a2;
  }
  else {
    uint64_t v11 = a4;
  }
  if ((int)v8 < (int)v11)
  {
    uint64_t v8 = v8;
    do
    {
      int v12 = 0;
      for (uint64_t j = -2; j != 3; ++j)
      {
        if ((int)v8 + (int)j >= a7 - 1) {
          int v14 = a7 - 1;
        }
        else {
          int v14 = v8 + j;
        }
        if (v8 + j >= a6) {
          int v15 = v14;
        }
        else {
          int v15 = a6;
        }
        v12 += byte_224B190BC[5 * (a8 - 1) + 2 + j] * *(unsigned __int16 *)(a5 + 2 * v15);
      }
      *(_WORD *)(result + 2 * v8++) = (v12 + 8) >> 4;
    }
    while (v8 != v11);
    LODWORD(v8) = v11;
  }
  if ((int)v8 < a2)
  {
    uint64_t v8 = v8;
    do
    {
      if ((int)v8 >= a7 - 1) {
        int v16 = a7 - 1;
      }
      else {
        int v16 = v8;
      }
      if ((int)v8 < a6) {
        int v16 = a6;
      }
      *(_WORD *)(result + 2 * v8++) = *(_WORD *)(a5 + 2 * v16);
    }
    while (a2 != v8);
  }
  return result;
}

uint64_t sub_224AE7DA8(uint64_t a1, uint64_t a2, _WORD *a3, int a4, int a5, unsigned int a6, int a7, int a8, int a9)
{
  v38[16] = *MEMORY[0x263EF8340];
  unsigned int v14 = (a6 & 0x1FF) - 90;
  int v15 = *(unsigned __int16 *)((char *)word_224B19060 + (v14 & 0xFFFFFFFE));
  int v16 = *(unsigned __int16 *)((char *)word_224B19060 + ((180 - (a6 & 0x1FF)) & 0xFFFFFFFE));
  if (a6 <= 0x3FF)
  {
    int v17 = 0;
    goto LABEL_3;
  }
  signed int v19 = a5 + a4;
  signed int v20 = 0x10u >> ((a6 & 0x200) != 0);
  int v17 = (a6 & 0x1FF) > 0x8C && v20 >= v19;
  if (v14 > 0x27 || v20 < v19)
  {
    int v25 = sub_224AE52E4(v19, v14, (a6 >> 9) & 1);
    if (v25)
    {
      sub_224AE7C9C((uint64_t)v38, a4, 0, a7, (uint64_t)(a3 + 1), -1, a4, v25);
LABEL_19:
      int v22 = 1;
      if (v17) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
LABEL_3:
    __memcpy_chk();
    goto LABEL_19;
  }
  sub_224AE7BCC((uint64_t)v37, a4 + 1, (uint64_t)a3, 0, a4 + 1, a9);
  v16 *= 2;
  int v22 = 2;
  if (v17)
  {
LABEL_20:
    uint64_t result = sub_224AE7BCC((uint64_t)&v37[-2 * a5], a5 + 1, (uint64_t)&a3[-a5], 0, a5 + 1, a9);
    v15 *= 2;
    goto LABEL_21;
  }
LABEL_13:
  if (a6 >= 0x400 && (int v23 = sub_224AE52E4(a5 + a4, 180 - (a6 & 0x1FF), (a6 >> 9) & 1)) != 0) {
    uint64_t result = sub_224AE7C9C((uint64_t)&v37[-a5], a5, a5 - a8, a5, (uint64_t)&a3[-a5], 0, a5 + 1, v23);
  }
  else {
    uint64_t result = (uint64_t)memcpy(&v37[-a5], &a3[-a5], 2 * a5);
  }
LABEL_21:
  v37[0] = *a3;
  if (a5 >= 1)
  {
    int v26 = 0;
    int v27 = v22 << 6;
    uint64_t v28 = &v37[~v17];
    do
    {
      v27 -= v16;
      if (a4 >= 1)
      {
        uint64_t v29 = 0;
        uint64_t result = v27 & 0x3E;
        int v30 = v27 >> 6;
        int v31 = (v26 << (v17 | 6)) - v15;
        do
        {
          if (v30 < 0)
          {
            int v34 = v31 & 0x3E;
            int v32 = (64 - v34) * (unsigned __int16)v28[-(v31 >> 6)];
            int v33 = &v28[~(v31 >> 6)];
          }
          else
          {
            int v32 = (64 - result) * (unsigned __int16)v37[v30];
            int v33 = &v37[v30 + 1];
            int v34 = v27 & 0x3E;
          }
          *(_WORD *)(a1 + v29) = (v32 + v34 * *v33 + 32) >> 6;
          v30 += v22;
          v29 += 2;
          v31 -= v15;
        }
        while (2 * a4 != v29);
      }
      ++v26;
      a1 += a2 & 0xFFFFFFFFFFFFFFFELL;
    }
    while (v26 != a5);
  }
  return result;
}

uint64_t sub_224AE8080(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, uint64_t a8, int a9)
{
  int v13 = (_WORD *)result;
  uint64_t v31 = *MEMORY[0x263EF8340];
  unsigned int v14 = *(unsigned __int16 *)((char *)word_224B19060 + (a6 & 0x1FE));
  if (a6 < 0x400) {
    goto LABEL_2;
  }
  signed int v17 = a5 + a4;
  if ((a6 & 0x1FF) < 0x33 || (int)(0x10u >> ((a6 & 0x200) != 0)) < v17)
  {
    uint64_t result = sub_224AE52E4(a5 + (int)a4, 90 - (a6 & 0x1FF), (a6 >> 9) & 1);
    if (result)
    {
      uint64_t v22 = a3 + 2;
      if ((int)a4 >= a5) {
        int v23 = a5;
      }
      else {
        int v23 = a4;
      }
      int v15 = v30;
      uint64_t result = sub_224AE7C9C((uint64_t)v30, a5 + (int)a4, 0, a5 + (int)a4, v22, -1, v23 + (int)a4, result);
      goto LABEL_17;
    }
LABEL_2:
    int v15 = (unsigned char *)(a3 + 2);
    if ((int)a4 >= a5) {
      int v16 = a5;
    }
    else {
      int v16 = a4;
    }
    signed int v17 = v16 + a4;
LABEL_17:
    int v20 = v17 - 1;
    uint64_t v21 = 1;
    goto LABEL_18;
  }
  uint64_t v18 = a3 + 2;
  if ((int)a4 >= a5) {
    int v19 = a5;
  }
  else {
    int v19 = a4;
  }
  int v15 = v30;
  uint64_t result = sub_224AE7BCC((uint64_t)v30, a5 + (int)a4, v18, -1, v19 + (int)a4, a9);
  int v20 = 2 * v17 - 2;
  v14 *= 2;
  uint64_t v21 = 2;
LABEL_18:
  if (a5 >= 1)
  {
    int v24 = 0;
    unint64_t v25 = v14;
    do
    {
      if ((int)a4 >= 1)
      {
        uint64_t v26 = 0;
        int64_t v27 = v25 >> 6;
        uint64_t v28 = v13;
        uint64_t result = a4;
        while (v27 < v20)
        {
          v13[v26++] = ((v25 & 0x3E) * *(unsigned __int16 *)&v15[2 * v27 + 2]
                      + (64 - (v25 & 0x3E)) * *(unsigned __int16 *)&v15[2 * v27]
                      + 32) >> 6;
          v27 += v21;
          uint64_t result = (result - 1);
          ++v28;
          if (a4 == v26) {
            goto LABEL_28;
          }
        }
        if ((int)a4 - (int)v26 >= 1)
        {
          __int16 v29 = *(_WORD *)&v15[2 * v20];
          uint64_t result = result;
          do
          {
            *v28++ = v29;
            --result;
          }
          while (result);
        }
      }
LABEL_28:
      ++v24;
      v25 += v14;
      int v13 = (_WORD *)((char *)v13 + (a2 & 0xFFFFFFFFFFFFFFFELL));
    }
    while (v24 != a5);
  }
  return result;
}

uint64_t sub_224AE8290(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v5 = 0;
    int v6 = *(unsigned __int16 *)(a3 + 2 * a4);
    do
    {
      if (a4 >= 1)
      {
        for (uint64_t i = 0; i != a4; ++i)
          *(_WORD *)(result + 2 * i) = (*(unsigned __int16 *)(a3 + 2 * ~v5) * byte_224B18FE0[a4 + i]
                                      + (256 - byte_224B18FE0[a4 + i]) * v6
                                      + 128) >> 8;
      }
      ++v5;
      result += a2 & 0xFFFFFFFFFFFFFFFELL;
    }
    while (v5 != a5);
  }
  return result;
}

uint64_t sub_224AE830C(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v5 = 0;
    int v6 = *(unsigned __int16 *)(a3 - 2 * a5);
    unint64_t v7 = a2 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v8 = 0;
        int v9 = byte_224B18FE0[a5 + v5];
        do
        {
          *(_WORD *)(result + v8) = ((256 - v9) * v6 + 128 + *(unsigned __int16 *)(a3 + 2 + v8) * v9) >> 8;
          v8 += 2;
        }
        while (2 * a4 != v8);
      }
      ++v5;
      result += v7;
    }
    while (v5 != a5);
  }
  return result;
}

uint64_t sub_224AE838C(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v5 = 0;
    int v6 = &byte_224B18FE0[a5];
    int v7 = *(unsigned __int16 *)(a3 + 2 * a4);
    int v8 = *(unsigned __int16 *)(a3 - 2 * a5);
    uint64_t v9 = a5;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v10 = 0;
        int v11 = v6[v5];
        do
        {
          *(_WORD *)(result + 2 * v10) = ((256 - v11) * v8
                                        + 256
                                        + *(unsigned __int16 *)(a3 + 2 + 2 * v10) * v11
                                        + *(unsigned __int16 *)(a3 + 2 * ~v5) * byte_224B18FE0[a4 + v10]
                                        + (256 - byte_224B18FE0[a4 + v10]) * v7) >> 9;
          ++v10;
        }
        while (a4 != v10);
      }
      ++v5;
      result += a2 & 0xFFFFFFFFFFFFFFFELL;
    }
    while (v5 != v9);
  }
  return result;
}

uint64_t sub_224AE8440(uint64_t result, uint64_t a2, unsigned __int16 *a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v5 = 0;
    int v6 = *a3;
    unint64_t v7 = a2 & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v8 = a5;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v9 = 0;
        int v10 = a3[~v5];
        int v11 = v10 - v6;
        if (v10 - v6 >= 0) {
          unsigned int v12 = v10 - v6;
        }
        else {
          unsigned int v12 = v6 - v10;
        }
        do
        {
          int v13 = a3[v9 + 1];
          unsigned int v14 = v6 - v13;
          if (v6 - v13 < 0) {
            unsigned int v14 = v13 - v6;
          }
          int v15 = v6 - (v11 + v13);
          if (v15 < 0) {
            int v15 = v11 + v13 - v6;
          }
          if (v12 > v15) {
            LOWORD(v13) = v6;
          }
          if (v14 <= v15 && v14 <= v12) {
            LOWORD(v13) = v10;
          }
          *(_WORD *)(result + v9 * 2) = v13;
          ++v9;
        }
        while (a4 != v9);
      }
      ++v5;
      result += v7;
    }
    while (v5 != v8);
  }
  return result;
}

char *sub_224AE84CC(char *__dst, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    int v5 = a5;
    int v6 = __dst;
    unint64_t v7 = (const void *)(a3 + 2);
    size_t v8 = 2 * a4;
    unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      __dst = (char *)memcpy(v6, v7, v8);
      v6 += v9;
      --v5;
    }
    while (v5);
  }
  return __dst;
}

uint64_t sub_224AE8538(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 >= 1)
  {
    for (uint64_t i = 0; i != a5; ++i)
    {
      if (a4 >= 1)
      {
        uint64_t v6 = 0;
        __int16 v7 = *(_WORD *)(a3 + 2 * ~i);
        do
        {
          *(_WORD *)(result + v6) = v7;
          v6 += 2;
        }
        while (2 * a4 != v6);
      }
      result += a2 & 0xFFFFFFFFFFFFFFFELL;
    }
  }
  return result;
}

void *sub_224AE8588(void *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  unsigned int v5 = a5 >> 1;
  if (a5 >= 1)
  {
    uint64_t v6 = a5;
    __int16 v7 = (unsigned __int16 *)(a3 - 2);
    do
    {
      int v8 = *v7--;
      v5 += v8;
      --v6;
    }
    while (v6);
  }
  return sub_224AE85CC(a1, a2, a4, a5, v5 >> __clz(__rbit32(a5)));
}

void *sub_224AE85CC(void *result, uint64_t a2, int a3, int a4, int a5)
{
  if (a4 >= 1)
  {
    for (int i = 0; i != a4; ++i)
    {
      if (a3 >= 1)
      {
        uint64_t v6 = 0;
        __int16 v7 = result;
        do
        {
          *v7++ = 0x1000100010001 * a5;
          v6 += 4;
        }
        while (v6 < a3);
      }
      uint64_t result = (void *)((char *)result + (a2 & 0xFFFFFFFFFFFFFFFELL));
    }
  }
  return result;
}

void *sub_224AE8620(void *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  unsigned int v5 = a4 >> 1;
  if (a4 >= 1)
  {
    uint64_t v6 = a4;
    __int16 v7 = (unsigned __int16 *)(a3 + 2);
    do
    {
      int v8 = *v7++;
      v5 += v8;
      --v6;
    }
    while (v6);
  }
  return sub_224AE85CC(a1, a2, a4, a5, v5 >> __clz(__rbit32(a4)));
}

void *sub_224AE8664(void *a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return sub_224AE85CC(a1, a2, a4, a5, (a9 + 1) >> 1);
}

void *sub_224AE8680(void *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v9 = sub_224AE74CC(a3, a4, a5);

  return sub_224AE85CC(a1, a2, a4, a5, v9);
}

uint64_t sub_224AE86F8(uint64_t a1, int a2, int a3, int a4)
{
  sub_224AADE84();
  if (v7)
  {
    sub_224AADE84();
    if (v8)
    {
      sub_224AADE84();
      a4 += v9 + 1;
    }
    int v10 = 1 << a4;
  }
  else
  {
    int v10 = 0;
  }
  for (int i = 0; a4; int i = v12 | (2 * i))
  {
    --a4;
    sub_224AADE84();
  }
  unsigned int v13 = i + v10;
  int v14 = 2 * a2;
  int v15 = a3 - 1 - a2;
  unsigned int v16 = i + v10 + 1;
  int v17 = v15 - (v16 >> 1);
  if (((i + v10) & 1) == 0) {
    int v17 = v15 + ((i + v10) >> 1);
  }
  if (v13 <= 2 * v15) {
    int v18 = v17;
  }
  else {
    int v18 = i + v10;
  }
  unsigned int v19 = a3 - 1 - v18;
  unsigned int v20 = a2 - (v16 >> 1);
  if ((v13 & 1) == 0) {
    unsigned int v20 = a2 + (v13 >> 1);
  }
  if (v14 >= v13) {
    unsigned int v13 = v20;
  }
  if (v14 <= a3) {
    return v13;
  }
  else {
    return v19;
  }
}

uint64_t sub_224AE87D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 64, 64, 2, (uint64_t)sub_224AB41B0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB41B0, 1, a5);
}

uint64_t sub_224AE881C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(_DWORD *, uint64_t, uint64_t, uint64_t), int a10, int a11)
{
  uint64_t result = MEMORY[0x270FA5388]();
  char v61 = v18;
  unsigned int v19 = v13;
  unsigned int v20 = (_WORD *)result;
  uint64_t v63 = *MEMORY[0x263EF8340];
  BOOL v22 = v16 == 2 * v15 || v15 == 2 * v16;
  if (v14 >= a10)
  {
    unsigned int v55 = (1 << v17) >> 1;
    char v56 = v17;
    uint64_t v58 = v12;
    uint64_t v30 = 0;
    if (v16 >= 32) {
      uint64_t v31 = 32;
    }
    else {
      uint64_t v31 = v16;
    }
    if ((int)v15 >= 32) {
      uint64_t v32 = 32;
    }
    else {
      uint64_t v32 = v15;
    }
    uint64_t v60 = 4 * v15;
    int v33 = v62;
    int v53 = ~a11;
    int v59 = v16;
    unsigned int v54 = v15;
    uint64_t v57 = v15;
    BOOL v34 = v22;
    do
    {
      uint64_t v35 = 0;
      uint64_t v36 = v30;
      if (v22)
      {
        do
        {
          v33[v35++] = (181 * v19[v36] + 128) >> 8;
          v36 += v31;
        }
        while (v32 != v35);
      }
      else
      {
        do
        {
          v33[v35++] = v19[v36];
          v36 += v31;
        }
        while (v32 != v35);
      }
      v61(v33, 1, (~a11 << 7), ~(~a11 << 7));
      ++v30;
      int v33 = (_DWORD *)((char *)v33 + v60);
      LOBYTE(v22) = v34;
    }
    while (v30 != v31);
    uint64_t v37 = (32 * v53);
    uint64_t v38 = ~(32 * v53);
    bzero(v19, (4 * v32 * v31));
    uint64_t v39 = 0;
    do
    {
      int v40 = (int)(v62[v39] + v55) >> v56;
      if (v40 >= (int)v38) {
        int v41 = ~(32 * v53);
      }
      else {
        int v41 = (int)(v62[v39] + v55) >> v56;
      }
      if (v40 >= (int)v37) {
        int v42 = v41;
      }
      else {
        int v42 = 32 * v53;
      }
      v62[v39++] = v42;
    }
    while (v31 * v54 != v39);
    int v43 = v62;
    uint64_t v44 = v57;
    do
    {
      uint64_t result = a9(v43++, v57, v37, v38);
      --v44;
    }
    while (v44);
    int v45 = 0;
    __int16 v46 = v62;
    do
    {
      int v47 = v20;
      uint64_t v48 = v57;
      do
      {
        int v49 = *v46++;
        int v50 = (unsigned __int16)*v47 + ((v49 + 8) >> 4);
        if (v50 >= a11) {
          __int16 v51 = a11;
        }
        else {
          __int16 v51 = v50;
        }
        if (v50 >= 0) {
          __int16 v52 = v51;
        }
        else {
          __int16 v52 = 0;
        }
        *v47++ = v52;
        --v48;
      }
      while (v48);
      ++v45;
      unsigned int v20 = (_WORD *)((char *)v20 + (v58 & 0xFFFFFFFFFFFFFFFELL));
    }
    while (v45 != v59);
  }
  else
  {
    int v23 = 0;
    int v24 = *v13;
    *unsigned int v13 = 0;
    if (v22) {
      int v24 = (181 * v24 + 128) >> 8;
    }
    int v25 = (181 * ((int)(((1 << v17) >> 1) + ((181 * v24 + 128) >> 8)) >> v17) + 2176) >> 12;
    do
    {
      uint64_t v26 = 0;
      do
      {
        int v27 = v25 + (unsigned __int16)v20[v26];
        if (v27 >= a11) {
          __int16 v28 = a11;
        }
        else {
          __int16 v28 = v25 + v20[v26];
        }
        if (v27 >= 0) {
          __int16 v29 = v28;
        }
        else {
          __int16 v29 = 0;
        }
        v20[v26++] = v29;
      }
      while (v15 != v26);
      ++v23;
      unsigned int v20 = (_WORD *)((char *)v20 + (v12 & 0xFFFFFFFFFFFFFFFELL));
    }
    while (v23 != v16);
  }
  return result;
}

uint64_t sub_224AE8B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 64, 32, 1, (uint64_t)sub_224AB41B0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB3384, 1, a5);
}

uint64_t sub_224AE8B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 64, 16, 2, (uint64_t)sub_224AB41B0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 1, a5);
}

uint64_t sub_224AE8BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 32, 64, 1, (uint64_t)sub_224AB3384, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB41B0, 1, a5);
}

uint64_t sub_224AE8C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 32, 32, 2, (uint64_t)sub_224AB67A0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB67A0, 0, a5);
}

uint64_t sub_224AE8C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 32, 32, 2, (uint64_t)sub_224AB3384, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB3384, 1, a5);
}

uint64_t sub_224AE8CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 32, 16, 1, (uint64_t)sub_224AB67A0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AE8D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 32, 16, 1, (uint64_t)sub_224AB3384, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 1, a5);
}

uint64_t sub_224AE8D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 32, 8, 2, (uint64_t)sub_224AB67A0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AE8DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 32, 8, 2, (uint64_t)sub_224AB3384, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 1, a5);
}

uint64_t sub_224AE8E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 64, 2, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB41B0, 1, a5);
}

uint64_t sub_224AE8E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 32, 1, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB67A0, 0, a5);
}

uint64_t sub_224AE8EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 32, 1, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB3384, 1, a5);
}

uint64_t sub_224AE8EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 0, a5);
}

uint64_t sub_224AE8F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AE8F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AE8FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AE902C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 0, a5);
}

uint64_t sub_224AE907C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AE90CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AE911C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AE9160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AE91B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 0, a5);
}

uint64_t sub_224AE9200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AE9244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 16, 2, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 1, a5);
}

uint64_t sub_224AE928C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AE92DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AE932C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AE937C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AE93CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 0, a5);
}

uint64_t sub_224AE941C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AE946C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AE94BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AE950C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 0, a5);
}

uint64_t sub_224AE955C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AE95AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AE95FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AE964C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AE969C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 0, a5);
}

uint64_t sub_224AE96EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AE973C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 8, 1, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 1, a5);
}

uint64_t sub_224AE9790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AE97E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AE9830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AE9880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AE98D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 0, a5);
}

uint64_t sub_224AE9920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AE9970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AE99C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AE9A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 0, a5);
}

uint64_t sub_224AE9A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AE9AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB6708, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AE9B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AE9B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AE9BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB5F10, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 0, a5);
}

uint64_t sub_224AE9BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB676C, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AE9C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 16, 4, 1, (uint64_t)sub_224AB2E24, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 1, a5);
}

uint64_t sub_224AE9C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 32, 2, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB67A0, 0, a5);
}

uint64_t sub_224AE9CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 32, 2, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB3384, 1, a5);
}

uint64_t sub_224AE9D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AE9D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AE9DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AE9E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AE9E78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 0, a5);
}

uint64_t sub_224AE9EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AE9F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AE9F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AE9FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 0, a5);
}

uint64_t sub_224AEA008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AEA058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AEA0A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AEA0F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AEA148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 0, a5);
}

uint64_t sub_224AEA198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AEA1E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 16, 1, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 1, a5);
}

uint64_t sub_224AEA23C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AEA28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AEA2DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AEA32C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AEA37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 0, a5);
}

uint64_t sub_224AEA3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AEA41C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AEA460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AEA4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 0, a5);
}

uint64_t sub_224AEA500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AEA550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AEA5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AEA5E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AEA634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 0, a5);
}

uint64_t sub_224AEA684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AEA6C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 8, 1, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 1, a5);
}

uint64_t sub_224AEA710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AEA760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AEA7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AEA800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AEA850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 0, a5);
}

uint64_t sub_224AEA8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AEA8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AEA940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AEA990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 0, a5);
}

uint64_t sub_224AEA9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AEAA30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB5F00, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AEAA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AEAAD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AEAB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB5BE0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 0, a5);
}

uint64_t sub_224AEAB70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB6748, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AEABC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 8, 4, 0, (uint64_t)sub_224AB2BC0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 1, a5);
}

uint64_t sub_224AEAC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AEAC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AEACB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AEAD04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AEAD54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 0, a5);
}

uint64_t sub_224AEADA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AEADF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AEAE44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AEAE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 0, a5);
}

uint64_t sub_224AEAEE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6708, 0, a5);
}

uint64_t sub_224AEAF34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AEAF84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AEAFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F10, 0, a5);
}

uint64_t sub_224AEB024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 0, a5);
}

uint64_t sub_224AEB074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB676C, 0, a5);
}

uint64_t sub_224AEB0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 16, 1, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2E24, 1, a5);
}

uint64_t sub_224AEB118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AEB168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AEB1B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AEB208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AEB258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 0, a5);
}

uint64_t sub_224AEB2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AEB2F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AEB348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AEB398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 0, a5);
}

uint64_t sub_224AEB3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5F00, 0, a5);
}

uint64_t sub_224AEB438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AEB488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AEB4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BE0, 0, a5);
}

uint64_t sub_224AEB528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 0, a5);
}

uint64_t sub_224AEB578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6748, 0, a5);
}

uint64_t sub_224AEB5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 8, 0, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2BC0, 1, a5);
}

uint64_t sub_224AEB61C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AEB66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AEB6BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AEB70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AEB75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 0, a5);
}

uint64_t sub_224AEB7AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AEB7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AEB840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AEB890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 0, a5);
}

uint64_t sub_224AEB8E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5BD0, 0, a5);
}

uint64_t sub_224AEB930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB5BD0, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AEB980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AEB9C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB5B04, 0, a5);
}

uint64_t sub_224AEBA14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB5B04, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 0, a5);
}

uint64_t sub_224AEBA64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB6718, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB6718, 0, a5);
}

uint64_t sub_224AEBAA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_224AE881C(a1, a2, a3, a4, 4, 4, 0, (uint64_t)sub_224AB2AA8, (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t))sub_224AB2AA8, 1, a5);
}

uint16x4_t *sub_224AEBAF0(uint16x4_t *result, uint64_t a2, _OWORD *a3, uint64_t a4, unsigned int a5)
{
  uint64_t v5 = 0;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = &v24;
  int v7 = a3;
  do
  {
    for (uint64_t i = 0; i != 4; ++i)
      v6->i32[i] = SLODWORD(v7[i]) >> 2;
    __int32 v9 = v6->i32[1];
    __int32 v10 = v6->i32[3];
    __int32 v11 = v9 + v6->i32[0];
    __int32 v12 = v6->i32[2] - v10;
    int v13 = (v11 - v12) >> 1;
    __int32 v14 = v13 - v10;
    __int32 v15 = v13 - v9;
    v6->i32[0] = v11 - v14;
    v6->i32[1] = v14;
    v6->i32[2] = v15;
    v6->i32[3] = v15 + v12;
    ++v5;
    ++v6;
    int v7 = (_OWORD *)((char *)v7 + 4);
  }
  while (v5 != 4);
  uint64_t v16 = 0;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  int32x4_t v17 = vaddq_s32(v25, v24);
  int32x4_t v18 = vsubq_s32(v26, v27);
  int32x4_t v19 = vshrq_n_s32(vsubq_s32(v17, v18), 1uLL);
  int32x4_t v20 = vsubq_s32(v19, v27);
  int32x4_t v21 = vsubq_s32(v19, v25);
  int32x4_t v24 = vsubq_s32(v17, v20);
  int32x4_t v25 = v20;
  int32x4_t v26 = v21;
  int32x4_t v27 = vaddq_s32(v21, v18);
  int32x4_t v22 = vdupq_n_s32(a5);
  do
  {
    int32x4_t v23 = (int32x4_t)vaddw_u16(*(uint32x4_t *)((char *)&v24 + v16), *result);
    *uint64_t result = (uint16x4_t)vbic_s8((int8x8_t)vmovn_s32(vminq_s32(v23, v22)), (int8x8_t)vmovn_s32(vcltzq_s32(v23)));
    v16 += 16;
    uint64_t result = (uint16x4_t *)((char *)result + (a2 & 0xFFFFFFFFFFFFFFFELL));
  }
  while (v16 != 64);
  return result;
}

void *sub_224AEBC24(void *result, char *__dst, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, int a8, int a9, unsigned int a10, int a11, unsigned int a12, int a13)
{
  int32x4_t v17 = __dst;
  unsigned int v18 = a12;
  uint64_t v19 = a10;
  uint64_t v20 = result[3];
  uint64_t v38 = a10;
  uint64_t v39 = result;
  if (*(unsigned char *)(v20 + 417)) {
    uint64_t v38 = ((int)(*(_DWORD *)(v20 + 240) + a12) >> a12);
  }
  if (a8) {
    int v21 = 0;
  }
  else {
    int v21 = -8;
  }
  unsigned int v22 = ((64 << ((a13 == 0) & a7)) + v21) >> a6;
  int32x4_t v23 = (char *)(a4 + (v22 - 2) * a5);
  if (*(_DWORD *)(result[407] + 24) == 1)
  {
    if (a8)
    {
      int v24 = 4 << a7;
      memcpy(__dst, &__dst[(4 << a7) * a3], (int)v38);
      memcpy(&v17[a3], &v17[(v24 | 1) * a3], (int)v38);
      memcpy(&v17[2 * a3], &v17[(v24 | 2) * a3], (int)v38);
      uint64_t v19 = a10;
      uint64_t result = memcpy(&v17[3 * a3], &v17[(v24 | 3) * a3], (int)v38);
      unsigned int v18 = a12;
    }
    v17 += 4 * a3;
  }
  if (a13 && *(_DWORD *)(v39[3] + 236) != *(_DWORD *)(v39[3] + 240))
  {
    int v31 = v22 + a8;
    if (v31 <= a9)
    {
      uint64_t v32 = (char *)v39 + 4 * v18;
      uint64_t v36 = v32 + 3248;
      uint64_t v37 = (unsigned int *)(v32 + 3240);
      uint64_t v33 = 0x40u >> a6;
      int v34 = a11 - 1;
      do
      {
        if (v34 == v31) {
          uint64_t v35 = 3;
        }
        else {
          uint64_t v35 = 4;
        }
        uint64_t result = (void *)(*(uint64_t (**)(char *, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, void, _DWORD))(v39[410] + 672))(v17, a3, v23, a5, v38, v35, v19, *v37, *v36);
        v17 += v35 * a3;
        if (v34 == v31)
        {
          uint64_t result = memcpy(v17, &v17[-a3], (int)v38);
          v17 += a3;
        }
        v23 += v33 * a5;
        v31 += v33;
      }
      while (v31 <= a9);
    }
  }
  else
  {
    int v25 = v22 + a8;
    if ((int)(v22 + a8) <= a9)
    {
      size_t v26 = (int)v19;
      unsigned int v40 = 0x40u >> a6;
      uint64_t v27 = ((0x40u >> a6) - 4) * a5;
      do
      {
        int v28 = 0;
        if (v25 + 1 == a11) {
          int v29 = 3;
        }
        else {
          int v29 = 4;
        }
        do
        {
          if (v29 == v28) {
            uint64_t v30 = &v17[-a3];
          }
          else {
            uint64_t v30 = v23;
          }
          uint64_t result = memcpy(v17, v30, v26);
          v17 += a3;
          v23 += a5;
          ++v28;
        }
        while (v28 != 4);
        v23 += v27;
        v25 += v40;
      }
      while (v25 <= a9);
    }
  }
  return result;
}

BOOL sub_224AEBEF0(uint64_t a1)
{
  signed int v2 = *(_DWORD *)(a1 + 12);
  BOOL result = 1;
  if (v2 >= 1)
  {
    if (v2 >= 98303) {
      int v4 = 98303;
    }
    else {
      int v4 = v2;
    }
    if (v4 <= 0x8000) {
      int v4 = 0x8000;
    }
    int v5 = v4 - 0x10000;
    if (v4 - 0x10000 < 0) {
      int v5 = 0x10000 - v4;
    }
    BOOL v6 = v4 >= 0x10000;
    unsigned int v7 = (v5 + 32) >> 6;
    if (!v6) {
      unsigned int v7 = -v7;
    }
    __int16 v8 = (_WORD)v7 << 6;
    *(_WORD *)(a1 + 28) = v8;
    int v9 = *(_DWORD *)(a1 + 16);
    uint64_t v10 = *(int *)(a1 + 20);
    if (v9 >= 0x7FFF) {
      int v11 = 0x7FFF;
    }
    else {
      int v11 = *(_DWORD *)(a1 + 16);
    }
    char v12 = __clz(v2);
    int v13 = (-1 << (v12 ^ 0x1F)) + v2;
    int v14 = v13 << (v12 - 23);
    int v15 = (v13 + (1 << (22 - v12))) >> (23 - v12);
    if (v11 <= -32768) {
      int v11 = -32768;
    }
    BOOL v16 = v11 < 0;
    if (v11 < 0) {
      int v11 = -v11;
    }
    unsigned int v17 = (v11 + 32) >> 6;
    if (v16) {
      unsigned int v17 = -v17;
    }
    __int16 v18 = (_WORD)v17 << 6;
    *(_WORD *)(a1 + 30) = v18;
    if (v2 >= 0x200) {
      int v19 = v15;
    }
    else {
      int v19 = v14;
    }
    char v20 = 45 - v12;
    int v21 = word_224B19240[v19];
    int v22 = 1 << v20 >> 1;
    uint64_t v23 = v21 * (uint64_t)v9 * v10;
    BOOL v24 = v23 < 0;
    if (v23 < 0) {
      uint64_t v23 = -v23;
    }
    uint64_t v25 = (v23 + v22) >> v20;
    if (!v24) {
      LODWORD(v25) = -(int)v25;
    }
    int v26 = v25 + *(_DWORD *)(a1 + 24);
    if (v26 >= 98303) {
      int v27 = 98303;
    }
    else {
      int v27 = v26;
    }
    if (v27 <= 0x8000) {
      int v27 = 0x8000;
    }
    int v28 = v27 - 0x10000;
    if (v27 - 0x10000 < 0) {
      int v28 = 0x10000 - v27;
    }
    BOOL v6 = v27 >= 0x10000;
    unsigned int v29 = (v28 + 32) >> 6;
    if (!v6) {
      unsigned int v29 = -v29;
    }
    if ((((int)v10 * (uint64_t)v21) & 0x800000000000) != 0) {
      uint64_t v30 = -65536 * (int)v10 * (uint64_t)v21;
    }
    else {
      uint64_t v30 = ((int)v10 * (uint64_t)v21) << 16;
    }
    uint64_t v31 = (v30 + v22) >> v20;
    if ((((int)v10 * (uint64_t)v21) & 0x800000000000) != 0) {
      LODWORD(v31) = -(int)v31;
    }
    if ((int)v31 >= 0x7FFF) {
      LODWORD(v31) = 0x7FFF;
    }
    if ((int)v31 <= -32768) {
      LODWORD(v31) = -32768;
    }
    BOOL v32 = (int)v31 < 0;
    if ((int)v31 < 0) {
      LODWORD(v31) = -(int)v31;
    }
    unsigned int v33 = (v31 + 32) >> 6;
    if (v32) {
      unsigned int v33 = -v33;
    }
    __int16 v34 = (_WORD)v33 << 6;
    *(_WORD *)(a1 + 32) = v34;
    *(_WORD *)(a1 + 34) = (_WORD)v29 << 6;
    int v35 = v8;
    if (v8 < 0) {
      int v35 = -v8;
    }
    int v36 = v18;
    if (v18 < 0) {
      int v36 = -v18;
    }
    if (!((7 * v36 + 4 * v35) >> 16))
    {
      int v37 = v34;
      if (v34 < 0) {
        int v37 = -v34;
      }
      int v38 = (__int16)((_WORD)v29 << 6);
      if (v38 < 0) {
        int v38 = (__int16)(-64 * v29);
      }
      return ((v38 + v37) & 0x3FFFC000) != 0;
    }
  }
  return result;
}

int32x2_t sub_224AEC0D0(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6)
{
  int32x2_t v6 = vadd_s32(vadd_s32(vadd_s32((int32x2_t)__PAIR64__(a2, a1), (int32x2_t)__PAIR64__(a2, a1)), vshl_n_s32((int32x2_t)__PAIR64__(a6, a5), 2uLL)), (int32x2_t)-1);
  v7.i32[0] = vand_s8((int8x8_t)vshl_s32((int32x2_t)a3, (int32x2_t)0xFFFFFFF0FFFFFFFDLL), (int8x8_t)0x1F0000001FLL).u32[0];
  v7.i32[1] = vshr_n_s32((int32x2_t)vshl_u32((uint32x2_t)vdup_lane_s32((int32x2_t)a3, 0), (uint32x2_t)0x1000000003), 3uLL).i32[1];
  v8.i32[0] = *(_DWORD *)(a4 + 12);
  v8.i32[1] = *(_DWORD *)(a4 + 24);
  int32x2_t result = vmax_s32(vmin_s32(vadd_s32(vmls_s32(vmul_s32(vsub_s32((int32x2_t)0x1000000010000, v8), v6), *(int32x2_t *)(a4 + 16), vrev64_s32(v6)), v7), (int32x2_t)0x7F0000007FLL), (int32x2_t)0x7F0000007FLL);
  *(int32x2_t *)(a4 + 4) = result;
  return result;
}

unint64_t sub_224AEC164(uint64_t *a1)
{
  int v1 = *((_DWORD *)a1 + 2);
  if (!v1)
  {
    signed int v2 = (unsigned __int8 *)a1[2];
    if ((unint64_t)v2 < a1[4])
    {
      a1[2] = (uint64_t)(v2 + 1);
      uint64_t v3 = *v2;
      *((_DWORD *)a1 + 2) = 7;
      *a1 = v3 << 57;
      return (v3 >> 7) & 1;
    }
    *((_DWORD *)a1 + 3) = 1;
  }
  unint64_t v5 = *a1;
  *((_DWORD *)a1 + 2) = v1 - 1;
  *a1 = 2 * v5;
  return v5 >> 63;
}

unint64_t sub_224AEC1C4(uint64_t *a1, unsigned int a2)
{
  unsigned int v2 = *((_DWORD *)a1 + 2);
  if (v2 < a2)
  {
    unsigned int v3 = 0;
    unint64_t v4 = a1[4];
    unint64_t v5 = (unsigned __int8 *)a1[2];
    while ((unint64_t)v5 < v4)
    {
      a1[2] = (uint64_t)(v5 + 1);
      unsigned int v3 = *v5 | (v3 << 8);
      v2 += 8;
      *((_DWORD *)a1 + 2) = v2;
      ++v5;
      if (v2 >= a2) {
        goto LABEL_7;
      }
    }
    *((_DWORD *)a1 + 3) = 1;
    if (!v3) {
      goto LABEL_8;
    }
LABEL_7:
    *a1 |= (unint64_t)v3 << -(char)v2;
  }
LABEL_8:
  unint64_t v6 = *a1;
  *((_DWORD *)a1 + 2) = v2 - a2;
  *a1 = v6 << a2;
  return v6 >> -(char)a2;
}

uint64_t sub_224AEC250(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 < a2)
  {
    unsigned int v3 = 0;
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(unsigned __int8 **)(a1 + 16);
    while ((unint64_t)v5 < v4)
    {
      *(void *)(a1 + 16) = v5 + 1;
      unsigned int v3 = *v5 | (v3 << 8);
      unsigned int v6 = v2 + 8;
      *(_DWORD *)(a1 + 8) = v2 + 8;
      unsigned int v2 = 8;
      ++v5;
      if (v6 >= a2)
      {
        unsigned int v2 = v6;
        goto LABEL_7;
      }
    }
    *(_DWORD *)(a1 + 12) = 1;
    if (!v3) {
      goto LABEL_8;
    }
LABEL_7:
    *(void *)a1 |= (unint64_t)v3 << -(char)v2;
  }
LABEL_8:
  uint64_t v7 = *(void *)a1;
  *(_DWORD *)(a1 + 8) = v2 - a2;
  *(void *)a1 = v7 << a2;
  return v7 >> -(char)a2;
}

unint64_t sub_224AEC2E4(uint64_t a1)
{
  unint64_t v2 = 0;
  unint64_t v3 = 0;
  do
  {
    char v4 = sub_224AEC1C4((uint64_t *)a1, 8u);
    v3 |= (unint64_t)(v4 & 0x7F) << v2;
    if ((v4 & 0x80) == 0) {
      break;
    }
    BOOL v5 = v2 >= 0x31;
    v2 += 7;
  }
  while (!v5);
  if (v4 < 0 || HIDWORD(v3))
  {
    unint64_t v3 = 0;
    *(_DWORD *)(a1 + 12) = 1;
  }
  return v3;
}

unint64_t sub_224AEC35C(uint64_t *a1, unsigned int a2)
{
  unsigned int v3 = __clz(a2) ^ 0x1F;
  unsigned int v4 = (2 << v3) - a2;
  unint64_t v5 = sub_224AEC1C4(a1, v3);
  if (v5 >= v4) {
    return sub_224AEC164(a1) - v4 + 2 * v5;
  }
  return v5;
}

uint64_t sub_224AEC3C0(uint64_t *a1, int a2, char a3)
{
  int v4 = 0;
  int v5 = 0;
  int v6 = 1 << a3;
  int v7 = (1 << a3) + a2;
  unsigned int v8 = 2 << a3;
  unsigned int v9 = 3;
  int v10 = 8;
  while (sub_224AEC164(a1))
  {
    v5 += v10;
    unsigned int v9 = v4 + 3;
    int v10 = 8 << v4;
    int v11 = 24 << v4++;
    if (v5 + v11 > v8)
    {
      int v12 = sub_224AEC35C(a1, (v8 | 1) - v5);
      goto LABEL_6;
    }
  }
  int v12 = sub_224AEC1C4(a1, v9);
LABEL_6:
  unsigned int v13 = v12 + v5;
  unsigned int v14 = 2 * v7;
  unsigned int v15 = v12 + v5 + 1;
  unsigned int v16 = v8 - v7 - (v15 >> 1);
  if (((v12 + v5) & 1) == 0) {
    unsigned int v16 = v8 - v7 + ((v12 + v5) >> 1);
  }
  if (v13 <= 2 * (v8 - v7)) {
    unsigned int v17 = v16;
  }
  else {
    unsigned int v17 = v12 + v5;
  }
  unsigned int v18 = v8 - v17;
  unsigned int v19 = v7 - (v15 >> 1);
  if ((v13 & 1) == 0) {
    unsigned int v19 = v7 + (v13 >> 1);
  }
  if (v14 >= v13) {
    unsigned int v13 = v19;
  }
  if (v14 > v8) {
    unsigned int v13 = v18;
  }
  return v13 - v6;
}

_DWORD *sub_224AEC4C8(_DWORD *a1, uint64_t a2, __int16 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, double a9, double a10, uint8x8_t a11, uint8x8_t a12, unsigned int a13, int a14)
{
  v20[21] = *MEMORY[0x263EF8340];
  sub_224A9DE68((uint64_t)v20, (uint64_t)a1, a2, a3, a4, a5, 4, a14, a9, a10, a11, a12);
  return sub_224A9EB28(a1, a2, (uint64_t)v20, a6, a7, a8, a13, 4, a14);
}

_DWORD *sub_224AEC5A4(_DWORD *a1, uint64_t a2, __int16 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, double a9, double a10, uint8x8_t a11, uint8x8_t a12, unsigned int a13, int a14)
{
  v20[21] = *MEMORY[0x263EF8340];
  sub_224A9DE68((uint64_t)v20, (uint64_t)a1, a2, a3, a4, a5, 8, a14, a9, a10, a11, a12);
  return sub_224A9EB28(a1, a2, (uint64_t)v20, a6, a7, a8, a13, 8, a14);
}

void *sub_224AEC680(void *a1, uint64_t a2, __int16 *a3, uint8x8_t *a4, uint8x8_t *a5, uint64_t a6, uint64_t a7, unsigned int a8, __n128 a9, __n128 a10, __n128 a11, uint8x8_t a12, unsigned int a13, int a14)
{
  v20[41] = *MEMORY[0x263EF8340];
  sub_224A9DB44((uint64_t)v20, (uint64_t)a1, a2, a3, a4, a5, 8, a14, a9, a10, a11, a12);
  return sub_224A9E670(a1, a2, v20, a6, a7, a8, a13, 8, a14);
}

__int16 *sub_224AEC75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, int a8, double a9, double a10, double a11, double a12, int32x2_t a13, double a14, int32x2_t a15, int a16, char a17)
{
  return sub_224AEC790(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 4u, 4u, a17);
}

__int16 *sub_224AEC790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, int a8, double a9, double a10, double a11, double a12, int32x2_t a13, double a14, int32x2_t a15, int a16, unsigned int a17, unsigned int a18, char a19)
{
  unsigned int v23 = a18;
  char v22 = a19;
  *(void *)((char *)&v136[29] + 4) = *MEMORY[0x263EF8340];
  int32x2_t result = (__int16 *)(a18 + 2);
  uint64_t v134 = a2;
  unsigned int v133 = a7;
  if ((a19 & 4) != 0)
  {
    int v132 = -2;
  }
  else
  {
    char v25 = 0;
    int v26 = __b;
    do
    {
      char v27 = v25;
      memset_pattern16(v26, &unk_224B15B50, 2 * (a17 + 4));
      v26 += 12;
      char v25 = 1;
    }
    while ((v27 & 1) == 0);
    int v132 = 0;
    a2 = v134;
    int32x2_t result = (__int16 *)(a18 + 2);
    char v22 = a19;
    a7 = v133;
  }
  int v28 = v136;
  if ((v22 & 8) == 0)
  {
    char v29 = 0;
    uint64_t v30 = (char *)&v136[3 * a18 - 1] + 4;
    do
    {
      char v31 = v29;
      memset_pattern16(v30, &unk_224B15B50, 2 * (a17 + 4));
      v30 += 24;
      char v29 = 1;
    }
    while ((v31 & 1) == 0);
    int32x2_t result = (__int16 *)a18;
    a2 = v134;
    char v22 = a19;
    a7 = v133;
  }
  unsigned int v32 = a17 + 2;
  if (v22)
  {
    int v36 = -2;
    if ((v22 & 2) != 0) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  unsigned int v33 = result;
  int v34 = result - v132;
  int v35 = (char *)&v136[3 * v132 - 1] + 4;
  do
  {
    memset_pattern16(v35, &unk_224B15B50, 4uLL);
    v35 += 24;
    --v34;
  }
  while (v34);
  int v36 = 0;
  a2 = v134;
  int32x2_t result = v33;
  char v22 = a19;
  a7 = v133;
  unsigned int v32 = a17 + 2;
  if ((a19 & 2) == 0)
  {
LABEL_16:
    int v128 = v36;
    int v37 = result;
    int v38 = result - v132;
    uint64_t v39 = (char *)&v136[3 * v132] + 2 * a17;
    do
    {
      memset_pattern16(v39, &unk_224B15B50, 4uLL);
      v39 += 24;
      --v38;
    }
    while (v38);
    unsigned int v32 = a17;
    a2 = v134;
    int32x2_t result = v37;
    char v22 = a19;
    a7 = v133;
    int v36 = v128;
  }
LABEL_19:
  uint64_t v40 = v36;
  if ((v22 & 4) != 0)
  {
    uint64_t v41 = v132;
    if (v132 < 0) {
      int v42 = -1;
    }
    else {
      int v42 = v132;
    }
    uint64_t v43 = (v42 + 1);
    uint64_t v44 = &__b[12 * v132];
    do
    {
      uint64_t v45 = v36 + 26;
      do
      {
        v44[v45] = *(unsigned __int8 *)(a4 + v45 - 26);
        ++v45;
      }
      while (v45 - v32 != 26);
      a4 += a2;
      ++v41;
      v44 += 12;
    }
    while (v41 != v43);
  }
  uint64_t v46 = 0;
  if (v36 < 0) {
    int v47 = -1;
  }
  else {
    int v47 = v36;
  }
  uint64_t v48 = (v47 + 1) - (uint64_t)v36;
  int v49 = &__b[v36 + 26];
  uint64_t v50 = v36 + a3 + 2;
  do
  {
    __int16 v51 = (unsigned __int8 *)v50;
    __int16 v52 = v49;
    uint64_t v53 = v48;
    if (v22)
    {
      do
      {
        __int16 v54 = *v51++;
        *v52++ = v54;
        --v53;
      }
      while (v53);
    }
    ++v46;
    v49 += 12;
    v50 += 2;
  }
  while (v46 != a18);
  int v55 = 0;
  char v56 = v136;
  uint64_t v57 = a1;
  do
  {
    uint64_t v58 = 0;
    do
    {
      *((_WORD *)v56 + v58) = *(unsigned __int8 *)(v57 + v58);
      ++v58;
    }
    while (v32 != v58);
    v57 += a2;
    v56 += 3;
    ++v55;
  }
  while (v55 != a18);
  if ((int)result > (int)a18)
  {
    unsigned int v59 = a18;
    do
    {
      uint64_t v60 = v40;
      do
      {
        *((_WORD *)v56 + v60) = *(unsigned __int8 *)(a5 + v60);
        ++v60;
      }
      while (v32 != v60);
      a5 += a2;
      v56 += 3;
      ++v59;
    }
    while (v59 != result);
  }
  if (a6)
  {
    unsigned int v61 = __clz(a6);
    unsigned int v62 = (v61 + a16 - 31) & ~((int)(v61 + a16 - 31) >> 31);
    if (a7)
    {
      int32x4_t v63 = vdupq_n_s32(a7);
      int32x2_t v64 = vdup_n_s32(a6);
      uint32x2_t v65 = (uint32x2_t)vneg_s32(vdup_n_s32(v62));
      uint32x4_t v66 = (uint32x4_t)vnegq_s32(vdupq_n_s32(__clz(a7) + a16 - 31));
      do
      {
        uint64_t v67 = 0;
        do
        {
          uint64_t v68 = 0;
          int v69 = 0;
          unsigned int v70 = *(unsigned __int8 *)(a1 + v67);
          int32x4_t v71 = vdupq_n_s32(v70);
          uint64_t v72 = 1;
          signed int v73 = v70;
          unsigned int v74 = v70;
          int v75 = 4 - (a6 & 1);
          do
          {
            int32x2_t result = (__int16 *)v72;
            int v76 = byte_224B19450[2 * a8 + 4 + v68];
            a15.i16[0] = *((_WORD *)v28 + (int)v67 - v76);
            a15.i16[2] = *((_WORD *)v28 + (int)v67 + v76);
            int32x2_t v77 = vshr_n_s32(vshl_n_s32(a15, 0x10uLL), 0x10uLL);
            int32x2_t v78 = vabd_s32(v77, *(int32x2_t *)v71.i8);
            int8x8_t v79 = (int8x8_t)vcltz_s32(vsub_s32(v77, *(int32x2_t *)v71.i8));
            int v80 = v77.i32[1];
            __int32 v81 = v77.i32[0];
            int v82 = byte_224B19450[2 * a8 + 8 + v68];
            int v83 = byte_224B19450[2 * a8 + v68];
            v84.i16[0] = *((_WORD *)v28 + (int)v67 + v82);
            int32x2_t v85 = vmin_s32(v78, vmax_s32(vsub_s32(v64, (int32x2_t)vshl_u32((uint32x2_t)v78, v65)), 0));
            v84.i16[1] = *((_WORD *)v28 + (int)v67 - v82);
            v84.i16[2] = *((_WORD *)v28 + (int)v67 + v83);
            v84.i16[3] = *((_WORD *)v28 + (int)v67 - v83);
            int32x4_t v86 = vmovl_s16(v84);
            int32x4_t v87 = vabdq_s32(v86, v71);
            int32x2_t v88 = (int32x2_t)vbsl_s8(v79, (int8x8_t)vneg_s32(v85), (int8x8_t)v85);
            int32x4_t v89 = vminq_s32(v87, vmaxq_s32(vsubq_s32(v63, (int32x4_t)vshlq_u32((uint32x4_t)v87, v66)), (int32x4_t)0));
            int v90 = 2 - v68;
            int v91 = vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vsubq_s32(v86, v71)), (int8x16_t)vnegq_s32(v89), (int8x16_t)v89));
            a15 = vadd_s32(v88, vdup_lane_s32(v88, 1));
            unsigned int v92 = vminvq_u32((uint32x4_t)v86);
            __int32 v93 = v69 + a15.i32[0] * v75;
            if (v92 >= v80) {
              unsigned int v94 = v80;
            }
            else {
              unsigned int v94 = v92;
            }
            if (v81 < v74) {
              unsigned int v74 = v81;
            }
            if (v94 < v74) {
              unsigned int v74 = v94;
            }
            int v69 = v93 + v91 * v90;
            a15.i32[0] = vmaxvq_s32(v86);
            int v95 = a15.i32[0];
            if (a15.i32[0] <= v80) {
              int v95 = v80;
            }
            if (v81 > v73) {
              signed int v73 = v81;
            }
            if (v95 > v73) {
              signed int v73 = v95;
            }
            uint64_t v68 = 1;
            int v75 = v75 & 1 | 2;
            uint64_t v72 = 0;
          }
          while ((result & 1) != 0);
          signed int v96 = v70 + ((v69 + (v69 >> 31) + 8) >> 4);
          if (v96 >= v73) {
            char v97 = v73;
          }
          else {
            char v97 = v96;
          }
          if (v96 >= (int)v74) {
            char v98 = v97;
          }
          else {
            char v98 = v74;
          }
          *(unsigned char *)(a1 + v67++) = v98;
        }
        while (v67 != a17);
        a1 += a2;
        v28 += 3;
        --v23;
      }
      while (v23);
    }
    else
    {
      int32x2_t v113 = vdup_n_s32(a6);
      uint32x2_t v114 = (uint32x2_t)vneg_s32(vdup_n_s32(v62));
      do
      {
        uint64_t v115 = 0;
        do
        {
          uint64_t v116 = 0;
          int v117 = 0;
          unsigned int v118 = *(unsigned __int8 *)(a1 + v115);
          int32x2_t v119 = vdup_n_s32(v118);
          char v120 = 1;
          int v121 = 4 - (a6 & 1);
          do
          {
            int v122 = byte_224B19450[2 * a8 + 4 + v116];
            a13.i16[0] = *((_WORD *)v28 + (int)v115 - v122);
            a13.i16[2] = *((_WORD *)v28 + (int)v115 + v122);
            int32x2_t v123 = vshr_n_s32(vshl_n_s32(a13, 0x10uLL), 0x10uLL);
            int32x2_t v124 = vabd_s32(v123, v119);
            int32x2_t v125 = vmin_s32(v124, vmax_s32(vsub_s32(v113, (int32x2_t)vshl_u32((uint32x2_t)v124, v114)), 0));
            int32x2_t v126 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(vsub_s32(v123, v119)), (int8x8_t)vneg_s32(v125), (int8x8_t)v125);
            a13 = vadd_s32(v126, vdup_lane_s32(v126, 1));
            char v127 = v120;
            v117 += a13.i32[0] * v121;
            uint64_t v116 = 1;
            int v121 = v121 & 1 | 2;
            char v120 = 0;
          }
          while ((v127 & 1) != 0);
          *(unsigned char *)(a1 + v115++) = v118 + ((v117 + (v117 >> 31) + 8) >> 4);
        }
        while (v115 != a17);
        a1 += a2;
        v28 += 3;
        --v23;
      }
      while (v23);
    }
  }
  else
  {
    int32x4_t v99 = vdupq_n_s32(a7);
    uint32x4_t v100 = (uint32x4_t)vnegq_s32(vdupq_n_s32(__clz(a7) + a16 - 31));
    do
    {
      uint64_t v101 = 0;
      do
      {
        uint64_t v102 = 0;
        int v103 = 0;
        unsigned int v104 = *(unsigned __int8 *)(a1 + v101);
        int32x4_t v105 = vdupq_n_s32(v104);
        char v106 = 1;
        do
        {
          int v107 = byte_224B19450[2 * a8 + 8 + v102];
          int v108 = byte_224B19450[2 * a8 + v102];
          int32x2_t result = (__int16 *)v28 + (int)v101 - v107;
          v109.i16[0] = *((_WORD *)v28 + (int)v101 + v107);
          v109.i16[1] = *result;
          v109.i16[2] = *((_WORD *)v28 + (int)v101 + v108);
          v109.i16[3] = *((_WORD *)v28 + (int)v101 - v108);
          int32x4_t v110 = vmovl_s16(v109);
          int32x4_t v111 = vabdq_s32(v110, v105);
          int32x4_t v112 = vminq_s32(v111, vmaxq_s32(vsubq_s32(v99, (int32x4_t)vshlq_u32((uint32x4_t)v111, v100)), (int32x4_t)0));
          LOBYTE(v107) = v106;
          v103 += vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vsubq_s32(v110, v105)), (int8x16_t)vnegq_s32(v112), (int8x16_t)v112))* (2 - v102);
          uint64_t v102 = 1;
          char v106 = 0;
        }
        while ((v107 & 1) != 0);
        *(unsigned char *)(a1 + v101++) = v104 + ((v103 + (v103 >> 31) + 8) >> 4);
      }
      while (v101 != a17);
      a1 += a2;
      v28 += 3;
      --v23;
    }
    while (v23);
  }
  return result;
}

__int16 *sub_224AECEC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, int a8, double a9, double a10, double a11, double a12, int32x2_t a13, double a14, int32x2_t a15, int a16, char a17)
{
  return sub_224AEC790(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 4u, 8u, a17);
}

__int16 *sub_224AECF00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, int a8, double a9, double a10, double a11, double a12, int32x2_t a13, double a14, int32x2_t a15, int a16, char a17)
{
  return sub_224AEC790(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 8u, 8u, a17);
}

uint64_t sub_224AECF34(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v3 = 0;
  uint64_t v52 = *MEMORY[0x263EF8340];
  memset(v51, 0, sizeof(v51));
  memset(v50, 0, sizeof(v50));
  uint64_t v49 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  memset(v46, 0, sizeof(v46));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  uint64_t v4 = 88;
  int v5 = &v43;
  memset(v42, 0, sizeof(v42));
  do
  {
    uint64_t v6 = 0;
    unint64_t v7 = (2 * v3) & 0xFFFFFFFFFFFFFFFCLL;
    unsigned int v8 = (char *)&v42[8] + v7 + 4;
    unsigned int v9 = (char *)&v42[6] - v7 + 4;
    uint64_t v10 = v4;
    do
    {
      int v11 = *(unsigned __int8 *)(a1 + v6) - 128;
      *((_DWORD *)v5 + v6) += v11;
      *((_DWORD *)v42 + v3 + (v6 >> 1)) += v11;
      *((_DWORD *)v50 + v3) += v11;
      int v12 = (char *)v42 + 4 * (v3 + 3 - (v6 >> 1));
      int v13 = *(_DWORD *)((char *)&v43 + v10);
      *((_DWORD *)v12 + 11) += v11;
      *(_DWORD *)((char *)&v43 + v10) = v13 + v11;
      *(_DWORD *)&v9[4 * v6] += v11;
      *((_DWORD *)v51 + v6) += v11;
      *(_DWORD *)&v8[4 * v6++] += v11;
      v10 -= 4;
    }
    while (v6 != 8);
    a1 += a2;
    ++v3;
    v4 += 4;
    int v5 = (long long *)((char *)v5 + 4);
  }
  while (v3 != 8);
  uint64_t v14 = 0;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  int v41 = 0;
  int32x4_t v15 = 0uLL;
  int32x4_t v16 = 0uLL;
  uint64_t v40 = 0;
  do
  {
    int32x4_t v15 = vmlaq_s32(v15, (int32x4_t)v50[v14], (int32x4_t)v50[v14]);
    int32x4_t v16 = vmlaq_s32(v16, (int32x4_t)v50[v14 + 2], (int32x4_t)v50[v14 + 2]);
    ++v14;
  }
  while (v14 != 2);
  uint64_t v17 = 0;
  int v18 = 0;
  int v19 = 0;
  HIDWORD(v38) = 105 * vaddvq_s32(v15);
  HIDWORD(v40) = 105 * vaddvq_s32(v16);
  uint64_t v20 = 116;
  int v21 = word_224B19442;
  do
  {
    int v22 = (unsigned __int16)*v21++;
    v18 += (*(_DWORD *)((char *)&v43 + v17) * *(_DWORD *)((char *)&v43 + v17)
          + *(_DWORD *)((char *)&v42[7] + v20 + 4) * *(_DWORD *)((char *)&v42[7] + v20 + 4))
         * v22;
    v19 += (*(_DWORD *)((char *)v46 + v17 + 12) * *(_DWORD *)((char *)v46 + v17 + 12)
          + *(_DWORD *)((char *)&v43 + v20) * *(_DWORD *)((char *)&v43 + v20))
         * v22;
    v20 -= 4;
    v17 += 4;
  }
  while (v20 != 88);
  uint64_t v23 = 0;
  unsigned int v24 = v18 + 105 * HIDWORD(v44) * HIDWORD(v44);
  unsigned int v37 = v24;
  HIDWORD(v39) = v19 + 105 * DWORD2(v47) * DWORD2(v47);
  char v25 = v42;
  int v26 = (char *)&v42[2] + 8;
  do
  {
    uint64_t v27 = (2 * v23) | 1;
    int v28 = *(&v37 + v27);
    for (uint64_t i = 12; i != 32; i += 4)
      v28 += *(_DWORD *)((char *)v25 + i) * *(_DWORD *)((char *)v25 + i);
    uint64_t v30 = 0;
    int v31 = 105 * v28;
    unsigned int v32 = (int *)v26;
    do
    {
      int v33 = *v32--;
      v31 += (*(_DWORD *)((char *)v25 + v30 * 2) * *(_DWORD *)((char *)v25 + v30 * 2) + v33 * v33)
           * (unsigned __int16)word_224B19442[v30 + 1];
      v30 += 2;
    }
    while (v30 != 6);
    *(&v37 + v27) = v31;
    ++v23;
    char v25 = (_OWORD *)((char *)v25 + 44);
    v26 += 44;
  }
  while (v23 != 4);
  LODWORD(result) = 0;
  for (uint64_t j = 1; j != 8; ++j)
  {
    unsigned int v36 = *(&v37 + j);
    if (v36 <= v24) {
      uint64_t result = result;
    }
    else {
      uint64_t result = j;
    }
    if (v36 > v24) {
      unsigned int v24 = *(&v37 + j);
    }
  }
  *a3 = (v24 - *(&v37 + ((int)result ^ 4))) >> 10;
  return result;
}

void *sub_224AED254(uint64_t *a1, uint64_t a2, int *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned int a9, unsigned int a10, unsigned int a11)
{
  v17[21] = *MEMORY[0x263EF8340];
  sub_224AA7FC8((uint64_t)v17, a1, a2, a3, a4, a5, 4, a10);
  return sub_224AA8B14(a1, a2, v17, a6, a7, a8, a9, 4, a10, a11);
}

void *sub_224AED338(uint64_t *a1, uint64_t a2, int *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned int a9, unsigned int a10, unsigned int a11)
{
  v17[21] = *MEMORY[0x263EF8340];
  sub_224AA7FC8((uint64_t)v17, a1, a2, a3, a4, a5, 8, a10);
  return sub_224AA8B14(a1, a2, v17, a6, a7, a8, a9, 8, a10, a11);
}

int16x8_t *sub_224AED41C(long long *a1, uint64_t a2, int *a3, long long *a4, long long *a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned int a9, unsigned int a10, unsigned int a11)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  sub_224AA7D3C((uint64_t)v17, a1, a2, a3, a4, a5, 8, a10);
  return sub_224AA8664((int16x8_t *)a1, a2, v17, a6, a7, a8, a9, 8, a10, a11);
}

__int16 *sub_224AED500(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, int a8, int a9, char a10, unsigned int a11)
{
  return sub_224AED538(a1, a2, a3, a4, a5, a6, a7, a8, a9, 4u, 4u, a10, a11);
}

__int16 *sub_224AED538(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, int a8, int a9, unsigned int a10, unsigned int a11, char a12, unsigned int a13)
{
  uint64_t v14 = a4;
  char v16 = a12;
  *(void *)((char *)&v130[29] + 4) = *MEMORY[0x263EF8340];
  unsigned int v17 = a11 + 2;
  if ((a12 & 4) != 0)
  {
    int v124 = -2;
  }
  else
  {
    char v19 = 0;
    uint64_t v20 = __b;
    do
    {
      char v21 = v19;
      memset_pattern16(v20, &unk_224B15B50, 2 * (a10 + 4));
      v20 += 24;
      char v19 = 1;
    }
    while ((v21 & 1) == 0);
    int v124 = 0;
    unsigned int v17 = a11 + 2;
    char v16 = a12;
    uint64_t v14 = a4;
  }
  int v22 = v130;
  if ((v16 & 8) == 0)
  {
    char v23 = 0;
    unsigned int v24 = (char *)&v130[3 * a11 - 1] + 4;
    do
    {
      char v25 = v23;
      memset_pattern16(v24, &unk_224B15B50, 2 * (a10 + 4));
      v24 += 24;
      char v23 = 1;
    }
    while ((v25 & 1) == 0);
    unsigned int v17 = a11;
    char v16 = a12;
  }
  unsigned int v26 = a10 + 2;
  int v126 = v17;
  if (v16)
  {
    int v27 = -2;
  }
  else
  {
    int v27 = v17 - v124;
    int v28 = (char *)&v130[3 * v124 - 1] + 4;
    do
    {
      memset_pattern16(v28, &unk_224B15B50, 4uLL);
      v28 += 24;
      --v27;
    }
    while (v27);
    char v16 = a12;
    unsigned int v17 = v126;
  }
  if ((v16 & 2) == 0)
  {
    unsigned int v29 = v17 - v124;
    uint64_t v30 = (char *)&v130[3 * v124] + 2 * a10;
    do
    {
      memset_pattern16(v30, &unk_224B15B50, 4uLL);
      v30 += 24;
      --v29;
    }
    while (v29);
    unsigned int v26 = a10;
    char v16 = a12;
  }
  unsigned int v119 = v26;
  if ((v16 & 4) != 0)
  {
    if (v124 < 0) {
      int v33 = -1;
    }
    else {
      int v33 = v124;
    }
    int v34 = &__b[24 * v124 + 52 + 2 * v27];
    int v35 = (char *)(v14 + 2 * v27);
    uint64_t v36 = (v33 + 1) - (uint64_t)v124;
    do
    {
      memcpy(v34, v35, 2 * (v26 - (uint64_t)v27));
      v34 += 24;
      v35 += a2;
      --v36;
    }
    while (v36);
    char v16 = a12;
    uint64_t v31 = v27;
    uint64_t v32 = 2 * v27;
  }
  else
  {
    uint64_t v31 = v27;
    uint64_t v32 = 2 * v27;
  }
  if (v27 < 0) {
    int v37 = -1;
  }
  else {
    int v37 = v27;
  }
  uint64_t v127 = v31;
  size_t v38 = 2 * ((v37 + 1) - v31);
  uint64_t v39 = v32 + 52;
  uint64_t v40 = (char *)(v32 + a3 + 4);
  uint64_t v41 = a11;
  do
  {
    if (v16)
    {
      memcpy(&__b[v39], v40, v38);
      char v16 = a12;
    }
    v39 += 24;
    v40 += 4;
    --v41;
  }
  while (v41);
  uint64_t v128 = a2 >> 1;
  int v42 = a1;
  unsigned int v43 = a11;
  long long v44 = v130;
  do
  {
    uint64_t result = (__int16 *)memcpy(v44, v42, 2 * v119);
    v44 += 3;
    v42 += a2 & 0xFFFFFFFFFFFFFFFELL;
    --v43;
  }
  while (v43);
  unsigned int v48 = a11;
  if (v126 > (int)a11)
  {
    unsigned int v49 = a11;
    do
    {
      uint64_t v50 = v127;
      do
      {
        *((_WORD *)v44 + v50) = *(_WORD *)(a5 + 2 * v50);
        ++v50;
      }
      while (v119 != v50);
      v44 += 3;
      ++v49;
      a5 += 2 * v128;
    }
    while (v49 != v126);
  }
  if (a6)
  {
    int v51 = 4 - ((a6 >> (24 - __clz(a13))) & 1);
    signed int v52 = __clz(a6) + a9 - 31;
    unsigned int v53 = v52 & ~(v52 >> 31);
    if (a7)
    {
      int32x4_t v54 = vdupq_n_s32(a7);
      int32x2_t v55 = vdup_n_s32(a6);
      uint32x2_t v56 = (uint32x2_t)vneg_s32(vdup_n_s32(v53));
      uint32x4_t v57 = (uint32x4_t)vnegq_s32(vdupq_n_s32(__clz(a7) + a9 - 31));
      do
      {
        uint64_t v58 = 0;
        do
        {
          uint64_t v59 = 0;
          int v60 = 0;
          unsigned int v61 = *(unsigned __int16 *)&a1[2 * v58];
          int32x4_t v62 = vdupq_n_s32(v61);
          uint64_t v63 = 1;
          signed int v64 = v61;
          unsigned int v65 = v61;
          int v66 = v51;
          do
          {
            uint64_t result = (__int16 *)v63;
            int v67 = byte_224B19450[2 * a8 + 4 + v59];
            v47.i16[0] = *((_WORD *)v22 + (int)v58 - v67);
            v47.i16[2] = *((_WORD *)v22 + (int)v58 + v67);
            int32x2_t v68 = vshr_n_s32(vshl_n_s32(v47, 0x10uLL), 0x10uLL);
            int32x2_t v69 = vabd_s32(v68, *(int32x2_t *)v62.i8);
            int8x8_t v70 = (int8x8_t)vcltz_s32(vsub_s32(v68, *(int32x2_t *)v62.i8));
            int v71 = v68.i32[1];
            __int32 v72 = v68.i32[0];
            int v73 = byte_224B19450[2 * a8 + 8 + v59];
            int v74 = byte_224B19450[2 * a8 + v59];
            v75.i16[0] = *((_WORD *)v22 + (int)v58 + v73);
            int32x2_t v76 = vmin_s32(v69, vmax_s32(vsub_s32(v55, (int32x2_t)vshl_u32((uint32x2_t)v69, v56)), 0));
            v75.i16[1] = *((_WORD *)v22 + (int)v58 - v73);
            v75.i16[2] = *((_WORD *)v22 + (int)v58 + v74);
            v75.i16[3] = *((_WORD *)v22 + (int)v58 - v74);
            int32x4_t v77 = vmovl_s16(v75);
            int32x4_t v78 = vabdq_s32(v77, v62);
            int32x2_t v79 = (int32x2_t)vbsl_s8(v70, (int8x8_t)vneg_s32(v76), (int8x8_t)v76);
            int32x4_t v80 = vminq_s32(v78, vmaxq_s32(vsubq_s32(v54, (int32x4_t)vshlq_u32((uint32x4_t)v78, v57)), (int32x4_t)0));
            int v81 = 2 - v59;
            int v82 = vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vsubq_s32(v77, v62)), (int8x16_t)vnegq_s32(v80), (int8x16_t)v80));
            int32x2_t v47 = vadd_s32(v79, vdup_lane_s32(v79, 1));
            unsigned int v83 = vminvq_u32((uint32x4_t)v77);
            __int32 v84 = v60 + v47.i32[0] * v66;
            if (v83 >= v71) {
              unsigned int v85 = v71;
            }
            else {
              unsigned int v85 = v83;
            }
            if (v72 < v65) {
              unsigned int v65 = v72;
            }
            if (v85 < v65) {
              unsigned int v65 = v85;
            }
            int v60 = v84 + v82 * v81;
            v47.i32[0] = vmaxvq_s32(v77);
            int v86 = v47.i32[0];
            if (v47.i32[0] <= v71) {
              int v86 = v71;
            }
            if (v72 > v64) {
              signed int v64 = v72;
            }
            if (v86 > v64) {
              signed int v64 = v86;
            }
            uint64_t v59 = 1;
            int v66 = v66 & 1 | 2;
            uint64_t v63 = 0;
          }
          while ((result & 1) != 0);
          signed int v87 = v61 + ((v60 + (v60 >> 31) + 8) >> 4);
          if (v87 >= v64) {
            __int16 v88 = v64;
          }
          else {
            __int16 v88 = v87;
          }
          if (v87 >= (int)v65) {
            __int16 v89 = v88;
          }
          else {
            __int16 v89 = v65;
          }
          *(_WORD *)&a1[2 * v58++] = v89;
        }
        while (v58 != a10);
        a1 += 2 * v128;
        v22 += 3;
        --v48;
      }
      while (v48);
    }
    else
    {
      int32x2_t v104 = vdup_n_s32(a6);
      uint32x2_t v105 = (uint32x2_t)vneg_s32(vdup_n_s32(v53));
      do
      {
        uint64_t v106 = 0;
        do
        {
          uint64_t v107 = 0;
          int v108 = 0;
          unsigned int v109 = *(unsigned __int16 *)&a1[2 * v106];
          int32x2_t v110 = vdup_n_s32(v109);
          char v111 = 1;
          int v112 = v51;
          do
          {
            int v113 = byte_224B19450[2 * a8 + 4 + v107];
            v46.i16[0] = *((_WORD *)v22 + (int)v106 - v113);
            v46.i16[2] = *((_WORD *)v22 + (int)v106 + v113);
            int32x2_t v114 = vshr_n_s32(vshl_n_s32(v46, 0x10uLL), 0x10uLL);
            int32x2_t v115 = vabd_s32(v114, v110);
            int32x2_t v116 = vmin_s32(v115, vmax_s32(vsub_s32(v104, (int32x2_t)vshl_u32((uint32x2_t)v115, v105)), 0));
            int32x2_t v117 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(vsub_s32(v114, v110)), (int8x8_t)vneg_s32(v116), (int8x8_t)v116);
            int32x2_t v46 = vadd_s32(v117, vdup_lane_s32(v117, 1));
            char v118 = v111;
            v108 += v46.i32[0] * v112;
            uint64_t v107 = 1;
            int v112 = v112 & 1 | 2;
            char v111 = 0;
          }
          while ((v118 & 1) != 0);
          *(_WORD *)&a1[2 * v106++] = v109 + ((v108 + (v108 >> 31) + 8) >> 4);
        }
        while (v106 != a10);
        a1 += 2 * v128;
        v22 += 3;
        --v48;
      }
      while (v48);
    }
  }
  else
  {
    int32x4_t v90 = vdupq_n_s32(a7);
    uint32x4_t v91 = (uint32x4_t)vnegq_s32(vdupq_n_s32(__clz(a7) + a9 - 31));
    do
    {
      uint64_t v92 = 0;
      do
      {
        uint64_t v93 = 0;
        int v94 = 0;
        unsigned int v95 = *(unsigned __int16 *)&a1[2 * v92];
        int32x4_t v96 = vdupq_n_s32(v95);
        char v97 = 1;
        do
        {
          int v98 = byte_224B19450[2 * a8 + 8 + v93];
          int v99 = byte_224B19450[2 * a8 + v93];
          uint64_t result = (__int16 *)v22 + (int)v92 - v98;
          v100.i16[0] = *((_WORD *)v22 + (int)v92 + v98);
          v100.i16[1] = *result;
          v100.i16[2] = *((_WORD *)v22 + (int)v92 + v99);
          v100.i16[3] = *((_WORD *)v22 + (int)v92 - v99);
          int32x4_t v101 = vmovl_s16(v100);
          int32x4_t v102 = vabdq_s32(v101, v96);
          int32x4_t v103 = vminq_s32(v102, vmaxq_s32(vsubq_s32(v90, (int32x4_t)vshlq_u32((uint32x4_t)v102, v91)), (int32x4_t)0));
          LOBYTE(v98) = v97;
          v94 += vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(vsubq_s32(v101, v96)), (int8x16_t)vnegq_s32(v103), (int8x16_t)v103))* (2 - v93);
          uint64_t v93 = 1;
          char v97 = 0;
        }
        while ((v98 & 1) != 0);
        *(_WORD *)&a1[2 * v92++] = v95 + ((v94 + (v94 >> 31) + 8) >> 4);
      }
      while (v92 != a10);
      a1 += 2 * v128;
      v22 += 3;
      --v48;
    }
    while (v48);
  }
  return result;
}

__int16 *sub_224AEDCB0(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, int a8, int a9, char a10, unsigned int a11)
{
  return sub_224AED538(a1, a2, a3, a4, a5, a6, a7, a8, a9, 4u, 8u, a10, a11);
}

__int16 *sub_224AEDCEC(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, int a8, int a9, char a10, unsigned int a11)
{
  return sub_224AED538(a1, a2, a3, a4, a5, a6, a7, a8, a9, 8u, 8u, a10, a11);
}

uint64_t sub_224AEDD24(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v4 = 0;
  uint64_t v55 = *MEMORY[0x263EF8340];
  memset(v54, 0, sizeof(v54));
  memset(v53, 0, sizeof(v53));
  uint64_t v52 = 0;
  unsigned int v5 = 24 - __clz(a4);
  long long v50 = 0u;
  long long v51 = 0u;
  memset(v49, 0, sizeof(v49));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v7 = 88;
  unsigned int v8 = &v46;
  memset(v45, 0, sizeof(v45));
  do
  {
    uint64_t v9 = 0;
    unint64_t v10 = (2 * v4) & 0xFFFFFFFFFFFFFFFCLL;
    int v11 = (char *)&v45[8] + v10 + 4;
    int v12 = (char *)&v45[6] - v10 + 4;
    uint64_t v13 = v7;
    do
    {
      int v14 = (*(unsigned __int16 *)(a1 + 2 * v9) >> v5) - 128;
      *((_DWORD *)v8 + v9) += v14;
      *((_DWORD *)v45 + v4 + (v9 >> 1)) += v14;
      *((_DWORD *)v53 + v4) += v14;
      int32x4_t v15 = (char *)v45 + 4 * (v4 + 3 - (v9 >> 1));
      int v16 = *(_DWORD *)((char *)&v46 + v13);
      *((_DWORD *)v15 + 11) += v14;
      *(_DWORD *)((char *)&v46 + v13) = v16 + v14;
      *(_DWORD *)&v12[4 * v9] += v14;
      *((_DWORD *)v54 + v9) += v14;
      *(_DWORD *)&v11[4 * v9++] += v14;
      v13 -= 4;
    }
    while (v9 != 8);
    ++v4;
    v7 += 4;
    unsigned int v8 = (long long *)((char *)v8 + 4);
    a1 += v6;
  }
  while (v4 != 8);
  uint64_t v17 = 0;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  int v44 = 0;
  int32x4_t v18 = 0uLL;
  int32x4_t v19 = 0uLL;
  uint64_t v43 = 0;
  do
  {
    int32x4_t v18 = vmlaq_s32(v18, (int32x4_t)v53[v17], (int32x4_t)v53[v17]);
    int32x4_t v19 = vmlaq_s32(v19, (int32x4_t)v53[v17 + 2], (int32x4_t)v53[v17 + 2]);
    ++v17;
  }
  while (v17 != 2);
  uint64_t v20 = 0;
  int v21 = 0;
  int v22 = 0;
  HIDWORD(v41) = 105 * vaddvq_s32(v18);
  HIDWORD(v43) = 105 * vaddvq_s32(v19);
  uint64_t v23 = 116;
  unsigned int v24 = word_224B19442;
  do
  {
    int v25 = (unsigned __int16)*v24++;
    v21 += (*(_DWORD *)((char *)&v46 + v20) * *(_DWORD *)((char *)&v46 + v20)
          + *(_DWORD *)((char *)&v45[7] + v23 + 4) * *(_DWORD *)((char *)&v45[7] + v23 + 4))
         * v25;
    v22 += (*(_DWORD *)((char *)v49 + v20 + 12) * *(_DWORD *)((char *)v49 + v20 + 12)
          + *(_DWORD *)((char *)&v46 + v23) * *(_DWORD *)((char *)&v46 + v23))
         * v25;
    v23 -= 4;
    v20 += 4;
  }
  while (v23 != 88);
  uint64_t v26 = 0;
  unsigned int v27 = v21 + 105 * HIDWORD(v47) * HIDWORD(v47);
  unsigned int v40 = v27;
  HIDWORD(v42) = v22 + 105 * DWORD2(v50) * DWORD2(v50);
  int v28 = v45;
  unsigned int v29 = (char *)&v45[2] + 8;
  do
  {
    uint64_t v30 = (2 * v26) | 1;
    int v31 = *(&v40 + v30);
    for (uint64_t i = 12; i != 32; i += 4)
      v31 += *(_DWORD *)((char *)v28 + i) * *(_DWORD *)((char *)v28 + i);
    uint64_t v33 = 0;
    int v34 = 105 * v31;
    int v35 = (int *)v29;
    do
    {
      int v36 = *v35--;
      v34 += (*(_DWORD *)((char *)v28 + v33 * 2) * *(_DWORD *)((char *)v28 + v33 * 2) + v36 * v36)
           * (unsigned __int16)word_224B19442[v33 + 1];
      v33 += 2;
    }
    while (v33 != 6);
    *(&v40 + v30) = v34;
    ++v26;
    int v28 = (_OWORD *)((char *)v28 + 44);
    v29 += 44;
  }
  while (v26 != 4);
  LODWORD(result) = 0;
  for (uint64_t j = 1; j != 8; ++j)
  {
    unsigned int v39 = *(&v40 + j);
    if (v39 <= v27) {
      uint64_t result = result;
    }
    else {
      uint64_t result = j;
    }
    if (v39 > v27) {
      unsigned int v27 = *(&v40 + j);
    }
  }
  *a3 = (v27 - *(&v40 + ((int)result ^ 4))) >> 10;
  return result;
}

uint64_t sub_224AEE060(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v127 = *(_DWORD **)(a1 + 8);
  int v5 = v127[542];
  uint64_t result = v5 != 3;
  uint64_t v7 = &byte_224B28CC0[4 * a2];
  unsigned int v8 = *v7;
  if (v5 == 3) {
    unsigned int v9 = *v7;
  }
  else {
    unsigned int v9 = v8 + 1;
  }
  int v10 = *(_DWORD *)(a1 + 24);
  int v11 = *(_DWORD *)(a1 + 28);
  unint64_t v112 = v10 & 0x1F;
  unint64_t v118 = v112 >> result;
  unsigned int v125 = v5 == 1;
  unint64_t v107 = v11 & 0x1F;
  unint64_t v102 = v107 >> v125;
  int v12 = v7[1];
  if (v5 == 1) {
    unsigned int v13 = v12 + 1;
  }
  else {
    unsigned int v13 = v7[1];
  }
  if (!v5 || (v8 <= result ? (BOOL v14 = (*(_DWORD *)(a1 + 24) & 1) == 0) : (BOOL v14 = 0), v14))
  {
    int v96 = 0;
  }
  else
  {
    if (v12 <= v125) {
      int v15 = *(_DWORD *)(a1 + 28) & 1;
    }
    else {
      int v15 = 1;
    }
    int v96 = v15;
  }
  if (*(unsigned char *)(a3 + 6))
  {
    switch(v12)
    {
      case 1:
        *(unsigned char *)(a1 + v107 + 64) = 64;
        break;
      case 2:
        *(_WORD *)(a1 + v107 + 64) = 16448;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 4:
        *(_DWORD *)(a1 + v107 + 64) = 1077952576;
        break;
      case 8:
        *(void *)(a1 + v107 + 64) = 0x4040404040404040;
        break;
      default:
        if (v12 == 16)
        {
          *(void *)&long long v73 = 0x4040404040404040;
          *((void *)&v73 + 1) = 0x4040404040404040;
          *(_OWORD *)(a1 + v107 + 64) = v73;
        }
        else if (v12 == 32)
        {
          *(void *)&long long v72 = 0x4040404040404040;
          *((void *)&v72 + 1) = 0x4040404040404040;
          *(_OWORD *)(a1 + 64 + v107) = v72;
          *(_OWORD *)(a1 + 64 + (v107 + 16)) = v72;
        }
        break;
    }
    switch(v8)
    {
      case 1u:
        *(unsigned char *)(*(void *)(a1 + 656) + v112 + 32) = 64;
        goto LABEL_135;
      case 2u:
        *(_WORD *)(*(void *)(a1 + 656) + v112 + 32) = 16448;
        goto LABEL_135;
      case 3u:
      case 5u:
      case 6u:
      case 7u:
        goto LABEL_135;
      case 4u:
        *(_DWORD *)(*(void *)(a1 + 656) + v112 + 32) = 1077952576;
        goto LABEL_135;
      case 8u:
        uint64_t v76 = *(void *)(a1 + 656) + v112;
        goto LABEL_134;
      default:
        if (v8 == 16)
        {
          *(void *)(*(void *)(a1 + 656) + v112 + 32) = 0x4040404040404040;
          uint64_t v74 = *(void *)(a1 + 656);
          uint64_t v75 = (v112 + 8);
        }
        else
        {
          if (v8 != 32) {
            goto LABEL_135;
          }
          *(void *)(*(void *)(a1 + 656) + v112 + 32) = 0x4040404040404040;
          *(void *)(*(void *)(a1 + 656) + (v112 + 8) + 32) = 0x4040404040404040;
          *(void *)(*(void *)(a1 + 656) + (v112 + 16) + 32) = 0x4040404040404040;
          uint64_t v74 = *(void *)(a1 + 656);
          uint64_t v75 = (v112 + 24);
        }
        uint64_t v76 = v74 + v75;
LABEL_134:
        *(void *)(v76 + 32) = 0x4040404040404040;
LABEL_135:
        if (v96)
        {
          unsigned int v77 = v9 >> result;
          unsigned int v78 = v13 >> v125;
          switch(v13 >> v125)
          {
            case 1u:
              unint64_t v79 = a1 + v102;
              *(unsigned char *)(v79 + 96) = 64;
              *(unsigned char *)(v79 + 128) = 64;
              break;
            case 2u:
              unint64_t v84 = a1 + v102;
              *(_WORD *)(v84 + 96) = 16448;
              *(_WORD *)(v84 + 128) = 16448;
              break;
            case 3u:
            case 5u:
            case 6u:
            case 7u:
              break;
            case 4u:
              unint64_t v85 = a1 + v102;
              *(_DWORD *)(v85 + 96) = 1077952576;
              *(_DWORD *)(v85 + 128) = 1077952576;
              break;
            case 8u:
              unint64_t v86 = a1 + v102;
              *(void *)(v86 + 96) = 0x4040404040404040;
              *(void *)(v86 + 128) = 0x4040404040404040;
              break;
            default:
              if (v78 == 16)
              {
                unint64_t v87 = a1 + v102;
                *(void *)&long long v88 = 0x4040404040404040;
                *((void *)&v88 + 1) = 0x4040404040404040;
                *(_OWORD *)(v87 + 96) = v88;
                *(_OWORD *)(v87 + 128) = v88;
              }
              else if (v78 == 32)
              {
                uint64_t v80 = a1 + 96;
                *(void *)&long long v81 = 0x4040404040404040;
                *((void *)&v81 + 1) = 0x4040404040404040;
                *(_OWORD *)(v80 + v102) = v81;
                uint64_t v82 = v102 + 16;
                *(_OWORD *)(v80 + v82) = v81;
                uint64_t v83 = a1 + 128;
                *(_OWORD *)(v83 + v102) = v81;
                *(_OWORD *)(v83 + v82) = v81;
              }
              break;
          }
          switch(v77)
          {
            case 1u:
              *(unsigned char *)(*(void *)(a1 + 656) + v118 + 64) = 64;
              *(unsigned char *)(*(void *)(a1 + 656) + v118 + 96) = 64;
              return result;
            case 2u:
              *(_WORD *)(*(void *)(a1 + 656) + v118 + 64) = 16448;
              *(_WORD *)(*(void *)(a1 + 656) + v118 + 96) = 16448;
              return result;
            case 3u:
            case 5u:
            case 6u:
            case 7u:
              return result;
            case 4u:
              *(_DWORD *)(*(void *)(a1 + 656) + v118 + 64) = 1077952576;
              *(_DWORD *)(*(void *)(a1 + 656) + v118 + 96) = 1077952576;
              return result;
            case 8u:
              uint64_t v91 = v112 >> result;
              *(void *)(*(void *)(a1 + 656) + v118 + 64) = 0x4040404040404040;
              goto LABEL_155;
            default:
              if (v77 == 16)
              {
                *(void *)(*(void *)(a1 + 656) + v118 + 64) = 0x4040404040404040;
                uint64_t v91 = v118 + 8;
                *(void *)(*(void *)(a1 + 656) + v91 + 64) = 0x4040404040404040;
                uint64_t v92 = *(void *)(a1 + 656) + v118;
              }
              else
              {
                if (v77 != 32) {
                  return result;
                }
                *(void *)(*(void *)(a1 + 656) + v118 + 64) = 0x4040404040404040;
                uint64_t v89 = v118 + 8;
                *(void *)(*(void *)(a1 + 656) + v89 + 64) = 0x4040404040404040;
                uint64_t v90 = v118 + 16;
                *(void *)(*(void *)(a1 + 656) + v90 + 64) = 0x4040404040404040;
                uint64_t v91 = v118 + 24;
                *(void *)(*(void *)(a1 + 656) + v91 + 64) = 0x4040404040404040;
                *(void *)(*(void *)(a1 + 656) + v118 + 96) = 0x4040404040404040;
                *(void *)(*(void *)(a1 + 656) + v89 + 96) = 0x4040404040404040;
                uint64_t v92 = *(void *)(a1 + 656) + v90;
              }
              *(void *)(v92 + 96) = 0x4040404040404040;
LABEL_155:
              *(void *)(*(void *)(a1 + 656) + v91 + 96) = 0x4040404040404040;
              break;
          }
        }
        break;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 16);
    signed int v17 = v127[862] - v10;
    if ((int)v8 < v17) {
      signed int v17 = v8;
    }
    int v99 = v17;
    if (v12 >= v127[863] - v11) {
      int v18 = v127[863] - v11;
    }
    else {
      int v18 = v12;
    }
    uint64_t v19 = 10;
    if (!*(unsigned char *)(a3 + 3)) {
      uint64_t v19 = 26;
    }
    uint64_t v20 = *(unsigned __int8 *)(a3 + v19);
    uint64_t v21 = *(unsigned __int8 *)(a3 + 7);
    v132[0] = *(unsigned __int8 *)(a3 + 29);
    v132[1] = *(_WORD *)(a3 + 30);
    if (v18 >= 1)
    {
      int v94 = (v99 + (int)result) >> result;
      int v93 = (int)(v18 + v125) >> v125;
      char v111 = &byte_224B28D18[8 * v20];
      unsigned int v109 = v111 + 1;
      unsigned int v22 = 0;
      int32x2_t v117 = &byte_224B28D18[8 * v21];
      int v121 = v117 + 1;
      uint64_t v126 = result;
      int v105 = v18;
      do
      {
        unsigned int v23 = v22 + 16;
        if (v18 >= (int)(v22 + 16)) {
          int v24 = v22 + 16;
        }
        else {
          int v24 = v18;
        }
        int v101 = v24;
        unsigned int v25 = v22;
        if (v99 >= 1)
        {
          unsigned int v26 = 0;
          BOOL v95 = v22 != 0;
          int v27 = v93;
          if (v93 >= (int)(v23 >> v125)) {
            int v27 = v23 >> v125;
          }
          int v28 = v99;
          int v100 = v25;
          unsigned int v98 = v25 >> v125;
          unsigned int v106 = v23;
          int v104 = v27;
          do
          {
            unsigned int v97 = v26 + 16;
            if (v28 >= (int)(v26 + 16)) {
              int v29 = v26 + 16;
            }
            else {
              int v29 = v28;
            }
            int v30 = v11 + v100;
            *(_DWORD *)(a1 + 28) = v30;
            unsigned int v108 = v26;
            if (v100 >= v101)
            {
              int v31 = v100;
            }
            else
            {
              BOOL v113 = v26 != 0;
              int v31 = v100;
              char v123 = v95;
              do
              {
                unsigned int v32 = v10 + v26;
                *(_DWORD *)(a1 + 24) = v32;
                int v33 = v26;
                if ((int)v26 < v29)
                {
                  int v115 = v31;
                  uint64_t v34 = (v31 + v107);
                  int v33 = v26;
                  int v35 = (uint64x2_t *)(a1 + 64 + v34);
                  unsigned int v119 = (void *)(a1 + 64 + (v34 + 8));
                  char v36 = v113;
                  do
                  {
                    if (*(unsigned char *)(a3 + 3))
                    {
                      unsigned __int8 v131 = 64;
                      unsigned int v130 = 0;
                      uint64_t v37 = (v33 + v112);
                      __int16 v38 = sub_224AEF500(a1, (uint64x2_t *)(*(void *)(a1 + 656) + v37 + 32), v35, *(unsigned __int8 *)(a3 + 10), a2, a3, 1, 0, *(unsigned int **)(v16 + 13936), &v130, &v131);
                      unsigned int v39 = *(_WORD **)(v16 + 13928);
                      _WORD *v39 = v130 + 32 * v38;
                      *(void *)(v16 + 13928) = v39 + 1;
                      unsigned int v40 = *v111;
                      if (v40 >= 8) {
                        int v41 = 8;
                      }
                      else {
                        int v41 = *v111;
                      }
                      unsigned int v42 = *v109;
                      if (v42 >= 8) {
                        int v43 = 8;
                      }
                      else {
                        int v43 = *v109;
                      }
                      *(void *)(v16 + 13936) += 4 * (16 * v41 * v43);
                      int v44 = v127[863] - *(_DWORD *)(a1 + 28);
                      if ((int)v42 < v44) {
                        int v44 = v42;
                      }
                      switch(v44)
                      {
                        case 1:
                          LODWORD(v45) = v131;
                          v35->i8[0] = v131;
                          break;
                        case 2:
                          LODWORD(v45) = v131;
                          v35->i16[0] = v131 | (v131 << 8);
                          break;
                        case 3:
                        case 5:
                        case 6:
                        case 7:
                          goto LABEL_57;
                        case 4:
                          LODWORD(v45) = v131;
                          v35->i32[0] = 16843009 * v131;
                          break;
                        case 8:
                          LODWORD(v45) = v131;
                          v35->i64[0] = 0x101010101010101 * v131;
                          break;
                        default:
                          if (v44 == 16)
                          {
                            uint64_t v45 = v131;
                            v35->i64[0] = 0x101010101010101 * v131;
                            *unsigned int v119 = 0x101010101010101 * v45;
                          }
                          else
                          {
LABEL_57:
                            LODWORD(v45) = v131;
                            memset(v35, v131, v44);
                          }
                          break;
                      }
                      uint64_t result = v126;
                      int v46 = v127[862] - *(_DWORD *)(a1 + 24);
                      if ((int)v40 < v46) {
                        int v46 = v40;
                      }
                      switch(v46)
                      {
                        case 1:
                          *(unsigned char *)(*(void *)(a1 + 656) + v37 + 32) = v45;
                          break;
                        case 2:
                          *(_WORD *)(*(void *)(a1 + 656) + v37 + 32) = v45 | ((_WORD)v45 << 8);
                          break;
                        case 3:
                        case 5:
                        case 6:
                        case 7:
                          goto LABEL_67;
                        case 4:
                          *(_DWORD *)(*(void *)(a1 + 656) + v37 + 32) = 16843009 * v45;
                          break;
                        case 8:
                          uint64_t v47 = 0x101010101010101 * v45;
                          uint64_t v48 = *(void *)(a1 + 656) + v37;
                          goto LABEL_71;
                        default:
                          if (v46 == 16)
                          {
                            uint64_t v47 = 0x101010101010101 * v45;
                            *(void *)(*(void *)(a1 + 656) + v37 + 32) = v47;
                            uint64_t v48 = *(void *)(a1 + 656) + (v37 + 8);
LABEL_71:
                            *(void *)(v48 + 32) = v47;
                          }
                          else
                          {
LABEL_67:
                            memset((void *)(*(void *)(a1 + 656) + v37 + 32), v45, v46);
                            uint64_t result = v126;
                          }
                          break;
                      }
                    }
                    else
                    {
                      sub_224AEEEC4(a1, a2, a3, *(unsigned __int8 *)(a3 + 26), 0, (uint64_t)v132, v36, v123, 0);
                      uint64_t result = v126;
                      unsigned int v40 = *v111;
                    }
                    v33 += v40;
                    unsigned int v32 = *(_DWORD *)(a1 + 24) + v40;
                    *(_DWORD *)(a1 + 24) = v32;
                    ++v36;
                  }
                  while (v33 < v29);
                  int v30 = *(_DWORD *)(a1 + 28);
                  unsigned int v26 = v108;
                  int v31 = v115;
                }
                int v10 = v32 - v33;
                int v49 = *v109;
                v31 += v49;
                v30 += v49;
                *(_DWORD *)(a1 + 24) = v10;
                *(_DWORD *)(a1 + 28) = v30;
                ++v123;
              }
              while (v31 < v101);
            }
            int v11 = v30 - v31;
            *(_DWORD *)(a1 + 28) = v11;
            if (v96)
            {
              uint64_t v120 = 0;
              unsigned int v50 = v97 >> result;
              if (v94 < (int)(v97 >> result)) {
                unsigned int v50 = v94;
              }
              int v124 = v50;
              signed int v51 = v26 >> result;
              int v18 = v105;
              unsigned int v23 = v106;
              int v52 = v104;
              unsigned int v103 = v26 >> result;
              do
              {
                uint64_t v53 = v120;
                int v54 = v11 + v100;
                *(_DWORD *)(a1 + 28) = v54;
                ++v120;
                for (int i = v98; i < v52; *(_DWORD *)(a1 + 28) = v54)
                {
                  int v56 = v10 + v26;
                  *(_DWORD *)(a1 + 24) = v56;
                  if (v51 >= v124)
                  {
                    int v66 = *v121;
                    int v60 = v51;
                  }
                  else
                  {
                    int v116 = v112 | (32 * ((i << v125) + v107));
                    int v110 = i;
                    uint64_t v57 = (i + v102);
                    uint64_t v58 = a1 + 32 * v53 + 96;
                    uint64_t v59 = (uint64x2_t *)(v58 + v57);
                    int32x2_t v114 = (void *)(v58 + (v57 + 8));
                    int v60 = v51;
                    while (2)
                    {
                      unsigned __int8 v129 = 64;
                      unsigned int v128 = 0;
                      int v61 = *(unsigned __int8 *)(a3 + 3);
                      if (!*(unsigned char *)(a3 + 3)) {
                        unsigned int v128 = *(unsigned __int8 *)(a1 + 9344 + v116 + (v60 << result));
                      }
                      uint64_t v62 = (v60 + v118);
                      __int16 v63 = sub_224AEF500(a1, (uint64x2_t *)(*(void *)(a1 + 656) + 32 * v53 + v62 + 64), v59, *(unsigned __int8 *)(a3 + 7), a2, a3, v61, v120, *(unsigned int **)(v16 + 13936), &v128, &v129);
                      signed int v64 = *(_WORD **)(v16 + 13928);
                      *signed int v64 = v128 + 32 * v63;
                      *(void *)(v16 + 13928) = v64 + 1;
                      int v65 = *v117;
                      int v66 = *v121;
                      *(void *)(v16 + 13936) += (*v117 * (unint64_t)*v121) << 6;
                      int v67 = (int)(v127[863] + v125 - *(_DWORD *)(a1 + 28)) >> v125;
                      if (v66 < v67) {
                        int v67 = v66;
                      }
                      switch(v67)
                      {
                        case 1:
                          LODWORD(v68) = v129;
                          v59->i8[0] = v129;
                          break;
                        case 2:
                          LODWORD(v68) = v129;
                          v59->i16[0] = v129 | (v129 << 8);
                          break;
                        case 3:
                        case 5:
                        case 6:
                        case 7:
                          goto LABEL_92;
                        case 4:
                          LODWORD(v68) = v129;
                          v59->i32[0] = 16843009 * v129;
                          break;
                        case 8:
                          LODWORD(v68) = v129;
                          v59->i64[0] = 0x101010101010101 * v129;
                          break;
                        default:
                          if (v67 == 16)
                          {
                            uint64_t v68 = v129;
                            v59->i64[0] = 0x101010101010101 * v129;
                            *int32x2_t v114 = 0x101010101010101 * v68;
                          }
                          else
                          {
LABEL_92:
                            LODWORD(v68) = v129;
                            memset(v59, v129, v67);
                          }
                          break;
                      }
                      uint64_t result = v126;
                      int v69 = (v127[862] + (int)result - *(_DWORD *)(a1 + 24)) >> result;
                      if (v65 < v69) {
                        int v69 = v65;
                      }
                      switch(v69)
                      {
                        case 1:
                          *(unsigned char *)(*(void *)(a1 + 656) + 32 * v53 + v62 + 64) = v68;
                          goto LABEL_107;
                        case 2:
                          *(_WORD *)(*(void *)(a1 + 656) + 32 * v53 + v62 + 64) = v68 | ((_WORD)v68 << 8);
                          goto LABEL_107;
                        case 3:
                        case 5:
                        case 6:
                        case 7:
                          goto LABEL_102;
                        case 4:
                          *(_DWORD *)(*(void *)(a1 + 656) + 32 * v53 + v62 + 64) = 16843009 * v68;
                          goto LABEL_107;
                        case 8:
                          uint64_t v70 = 0x101010101010101 * v68;
                          uint64_t v71 = *(void *)(a1 + 656) + 32 * v53 + v62;
                          goto LABEL_106;
                        default:
                          if (v69 == 16)
                          {
                            uint64_t v70 = 0x101010101010101 * v68;
                            *(void *)(*(void *)(a1 + 656) + 32 * v53 + v62 + 64) = v70;
                            uint64_t v71 = *(void *)(a1 + 656) + 32 * v53 + (v62 + 8);
LABEL_106:
                            *(void *)(v71 + 64) = v70;
                          }
                          else
                          {
LABEL_102:
                            memset((void *)(*(void *)(a1 + 656) + 32 * v53 + v62 + 64), v68, v69);
                            uint64_t result = v126;
                          }
LABEL_107:
                          v60 += v65;
                          int v56 = *(_DWORD *)(a1 + 24) + (v65 << result);
                          *(_DWORD *)(a1 + 24) = v56;
                          if (v60 < v124) {
                            continue;
                          }
                          int v54 = *(_DWORD *)(a1 + 28);
                          int v18 = v105;
                          unsigned int v23 = v106;
                          signed int v51 = v103;
                          int v52 = v104;
                          unsigned int v26 = v108;
                          int i = v110;
                          break;
                      }
                      break;
                    }
                  }
                  int v10 = v56 - (v60 << result);
                  i += v66;
                  v54 += v66 << v125;
                  *(_DWORD *)(a1 + 24) = v10;
                }
                int v11 = v54 - (i << v125);
                *(_DWORD *)(a1 + 28) = v11;
                int v28 = v99;
              }
              while (!v53);
            }
            else
            {
              int v28 = v99;
              int v18 = v105;
              unsigned int v23 = v106;
            }
            unsigned int v26 = v97;
          }
          while ((int)v97 < v28);
        }
        unsigned int v22 = v23;
      }
      while ((int)v23 < v18);
    }
  }
  return result;
}

uint64_t sub_224AEEEC4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6, char a7, char a8, uint64_t a9)
{
  uint64_t result = a9;
  uint64_t v14 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(v14 + 3280);
  unsigned int v16 = a4;
  signed int v17 = &byte_224B28D18[8 * a4];
  int v18 = *v17;
  int v19 = v17[1];
  if (a5 <= 1
    && *(_WORD *)(a6 + 2 * a5)
    && ((*(unsigned __int16 *)(a6 + 2 * a5) >> (a7 + 4 * a8)) & 1) != 0)
  {
    uint64_t v20 = &byte_224B28D18[8 * byte_224B28D18[8 * a4 + 6]];
    int v21 = *v20;
    int v58 = v20[1];
    uint64_t result = sub_224AEEEC4(a1, a2, a3);
    int v22 = *(_DWORD *)(a1 + 24) + v21;
    *(_DWORD *)(a1 + 24) = v22;
    if (v18 >= v19 && v22 < *(_DWORD *)(v14 + 3448))
    {
      uint64_t result = sub_224AEEEC4(a1, a2, a3);
      int v22 = *(_DWORD *)(a1 + 24);
    }
    int v23 = v22 - v21;
    int v24 = v58;
    int v25 = *(_DWORD *)(a1 + 28) + v58;
    *(_DWORD *)(a1 + 24) = v23;
    *(_DWORD *)(a1 + 28) = v25;
    if (v19 >= v18 && v25 < *(_DWORD *)(v14 + 3452))
    {
      uint64_t result = sub_224AEEEC4(a1, a2, a3);
      int v52 = v21;
      int v53 = *(_DWORD *)(a1 + 24) + v21;
      *(_DWORD *)(a1 + 24) = v53;
      if (v18 >= v19)
      {
        int v24 = v58;
        if (v53 < *(_DWORD *)(v14 + 3448))
        {
          uint64_t result = sub_224AEEEC4(a1, a2, a3);
          int v52 = v21;
          int v24 = v58;
          int v53 = *(_DWORD *)(a1 + 24);
        }
      }
      else
      {
        int v24 = v58;
      }
      *(_DWORD *)(a1 + 24) = v53 - v52;
      int v25 = *(_DWORD *)(a1 + 28);
    }
    *(_DWORD *)(a1 + 28) = v25 - v24;
    return result;
  }
  int v27 = *(_DWORD *)(a1 + 24);
  int v26 = *(_DWORD *)(a1 + 28);
  memset(__c, 0, sizeof(__c));
  int v28 = *(_DWORD *)(a1 + 258564);
  if (!v28)
  {
    uint64_t v54 = v13;
    uint64_t v55 = v15;
    unsigned int v56 = a4;
    uint64_t v57 = a9;
    int v30 = (unsigned int *)(a1 + 1024);
    goto LABEL_21;
  }
  uint64_t v29 = v13 + 24 * (v28 & 1);
  int v30 = *(unsigned int **)(v29 + 13912);
  if (v18 >= 8) {
    int v31 = 8;
  }
  else {
    int v31 = v18;
  }
  if (v19 >= 8) {
    int v32 = 8;
  }
  else {
    int v32 = v19;
  }
  *(void *)(v29 + 13912) = &v30[16 * v31 * v32];
  if (v28 != 2)
  {
    uint64_t v54 = v13;
    uint64_t v55 = v15;
    unsigned int v56 = a4;
    uint64_t v57 = a9;
LABEL_21:
    uint64_t v36 = v27 & 0x1F;
    int v37 = v26 & 0x1F;
    __int16 v38 = (uint64x2_t *)(a1 + (v26 & 0x1F) + 64);
    uint64_t v59 = v30;
    uint64_t result = sub_224AEF500(a1, (uint64x2_t *)(*(void *)(a1 + 656) + v36 + 32), v38, a4, a2, a3, 0, 0, v30, (unsigned int *)&__c[1], __c);
    uint64_t v35 = result;
    int v39 = *(_DWORD *)(v14 + 3452) - *(_DWORD *)(a1 + 28);
    if (v19 < v39) {
      int v39 = v19;
    }
    switch(v39)
    {
      case 1:
        unsigned int v40 = __c[0];
        v38->i8[0] = __c[0];
        goto LABEL_31;
      case 2:
        unsigned int v40 = __c[0];
        v38->i16[0] = __c[0] | (__c[0] << 8);
        goto LABEL_31;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_27;
      case 4:
        unsigned int v40 = __c[0];
        v38->i32[0] = 16843009 * __c[0];
        goto LABEL_31;
      case 8:
        unsigned int v40 = __c[0];
        v38->i64[0] = 0x101010101010101 * __c[0];
        goto LABEL_31;
      default:
        if (v39 == 16)
        {
          unsigned int v40 = __c[0];
          *(int64x2_t *)__int16 v38 = vdupq_n_s64(0x101010101010101 * (unint64_t)__c[0]);
        }
        else
        {
LABEL_27:
          unsigned int v40 = __c[0];
          uint64_t result = (uint64_t)memset(v38, __c[0], v39);
        }
LABEL_31:
        int v41 = *(_DWORD *)(v14 + 3448) - *(_DWORD *)(a1 + 24);
        if (v18 < v41) {
          int v41 = v18;
        }
        switch(v41)
        {
          case 1:
            *(unsigned char *)(*(void *)(a1 + 656) + v36 + 32) = v40;
            goto LABEL_42;
          case 2:
            *(_WORD *)(*(void *)(a1 + 656) + v36 + 32) = v40 | ((_WORD)v40 << 8);
            goto LABEL_42;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_37;
          case 4:
            *(_DWORD *)(*(void *)(a1 + 656) + v36 + 32) = 16843009 * v40;
            goto LABEL_42;
          case 8:
            uint64_t v42 = 0x101010101010101 * v40;
            uint64_t v43 = *(void *)(a1 + 656) + v36;
            goto LABEL_41;
          default:
            if (v41 == 16)
            {
              uint64_t v42 = 0x101010101010101 * v40;
              *(void *)(*(void *)(a1 + 656) + v36 + 32) = v42;
              uint64_t v43 = *(void *)(a1 + 656) + (v36 + 8);
LABEL_41:
              *(void *)(v43 + 32) = v42;
            }
            else
            {
LABEL_37:
              uint64_t result = (uint64_t)memset((void *)(*(void *)(a1 + 656) + v36 + 32), v40, v41);
            }
LABEL_42:
            uint64_t v44 = a1 + 9344 + (v36 | (32 * v37));
            switch(v18)
            {
              case 1:
                char v45 = __c[1];
                do
                {
                  *(unsigned char *)uint64_t v44 = v45;
                  v44 += 32;
                  --v19;
                }
                while (v19);
                break;
              case 2:
                __int16 v47 = 257 * *(_WORD *)&__c[1];
                do
                {
                  *(_WORD *)uint64_t v44 = v47;
                  v44 += 32;
                  --v19;
                }
                while (v19);
                break;
              case 3:
              case 5:
              case 6:
              case 7:
                break;
              case 4:
                int v48 = 16843009 * *(_DWORD *)&__c[1];
                do
                {
                  *(_DWORD *)uint64_t v44 = v48;
                  v44 += 32;
                  --v19;
                }
                while (v19);
                break;
              case 8:
                uint64_t v49 = 0x101010101010101 * *(unsigned int *)&__c[1];
                do
                {
                  *(void *)uint64_t v44 = v49;
                  v44 += 32;
                  --v19;
                }
                while (v19);
                break;
              default:
                if (v18 == 16)
                {
                  uint64_t v46 = 0x101010101010101 * *(unsigned int *)&__c[1];
                  do
                  {
                    *(void *)uint64_t v44 = v46;
                    *(void *)(v44 + 8) = v46;
                    v44 += 32;
                    --v19;
                  }
                  while (v19);
                }
                break;
            }
            int v50 = *(_DWORD *)(a1 + 258564);
            if (v50 == 1)
            {
              signed int v51 = *(_WORD **)(v54 + 13928);
              *signed int v51 = *(_WORD *)&__c[1] + 32 * v35;
              *(void *)(v54 + 13928) = v51 + 1;
              return result;
            }
            unsigned int v16 = v56;
            uint64_t result = v57;
            uint64_t v15 = v55;
            int v30 = v59;
            if ((v50 & 1) == 0) {
              goto LABEL_61;
            }
            return result;
        }
    }
  }
  int v33 = *(__int16 **)(v13 + 13904);
  int v34 = *v33;
  *(void *)(v13 + 13904) = v33 + 1;
  uint64_t v35 = (v34 >> 5);
  *(_DWORD *)&__c[1] = v34 & 0x1F;
LABEL_61:
  if ((v35 & 0x80000000) == 0) {
    return (*(uint64_t (**)(uint64_t, void, unsigned int *, uint64_t, void))(v15
  }
                                                                                       + 136 * v16
                                                                                       + 8 * *(unsigned int *)&__c[1]
                                                                                       + 680))(result, *(void *)(v14 + 2144), v30, v35, *(unsigned int *)(v14 + 4324));
  return result;
}

uint64_t sub_224AEF500(uint64_t a1, uint64x2_t *a2, uint64x2_t *a3, unsigned int a4, int a5, uint64_t a6, int a7, unsigned int a8, unsigned int *a9, unsigned int *a10, unsigned char *a11)
{
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v294 = v11;
  int v13 = *(unsigned __int8 *)(*(void *)(v11 + 24) + *(unsigned __int8 *)(a6 + 4) + 808);
  uint64_t v14 = a4;
  uint64_t v15 = &byte_224B28CC0[4 * a5];
  if (a8)
  {
    int v16 = *(_DWORD *)(v11 + 2168);
    int v17 = v15[2];
    BOOL v18 = v16 == 3 || v17 == 0;
    int v19 = !v18;
    int v20 = v17 - v19;
    int v21 = &byte_224B28D18[8 * a4];
    int v22 = v21[2];
    if (v20 <= v22)
    {
      int v29 = v15[3];
      BOOL v31 = v16 == 1 && v29 != 0;
      BOOL v32 = v29 - v31 <= v21[3];
      uint64_t v23 = 7;
      if (!v32) {
        uint64_t v23 = 10;
      }
    }
    else
    {
      uint64_t v23 = 10;
    }
    switch(v21[2])
    {
      case 1u:
        __int32 v35 = a2->u16[0];
        int v36 = 16448;
        goto LABEL_27;
      case 2u:
        __int32 v35 = a2->i32[0];
        int v36 = 1077952576;
LABEL_27:
        BOOL v33 = v35 == v36;
        break;
      case 3u:
        BOOL v33 = a2->i64[0] == 0x4040404040404040;
        break;
      default:
        BOOL v33 = a2->i8[0] == 64;
        break;
    }
    unsigned int v37 = !v33;
    __int16 v38 = &byte_224B28D18[8 * a4];
    int v26 = v38[3];
    switch(v38[3])
    {
      case 1u:
        int v27 = a7;
        __int32 v40 = a3->u16[0];
        int v41 = 16448;
        goto LABEL_36;
      case 2u:
        int v27 = a7;
        __int32 v40 = a3->i32[0];
        int v41 = 1077952576;
LABEL_36:
        BOOL v39 = v40 == v41;
        break;
      case 3u:
        int v27 = a7;
        BOOL v39 = a3->i64[0] == 0x4040404040404040;
        break;
      default:
        int v27 = a7;
        BOOL v39 = a3->i8[0] == 64;
        break;
    }
    unsigned int v42 = !v39;
    uint64_t v28 = v23 + v37 + v42;
  }
  else
  {
    int v24 = v15[2];
    int v25 = &byte_224B28D18[8 * a4];
    int v22 = v25[2];
    if (v24 == v22 && (int v26 = v15[3], v26 == v25[3]))
    {
      int v27 = a7;
      uint64_t v28 = 0;
      int v22 = v24;
    }
    else
    {
      switch(v25[2])
      {
        case 1u:
          unsigned int v43 = a2->u16[0];
          goto LABEL_47;
        case 2u:
          unsigned int v44 = a2->i32[0];
          goto LABEL_46;
        case 3u:
          unsigned int v44 = a2->i32[1] | a2->i32[0];
          goto LABEL_46;
        case 4u:
          unsigned int v44 = ((unint64_t)(a2->i64[1] | a2->i64[0]) >> 32) | a2->i32[2] | a2->i32[0];
LABEL_46:
          unsigned int v43 = v44 | HIWORD(v44);
LABEL_47:
          int v34 = v43 | (v43 >> 8);
          break;
        default:
          LOBYTE(v34) = a2->i8[0];
          break;
      }
      char v45 = &byte_224B28D18[8 * a4];
      int v26 = v45[3];
      switch(v45[3])
      {
        case 1u:
          int v27 = a7;
          unsigned int v47 = a3->u16[0];
          goto LABEL_55;
        case 2u:
          int v27 = a7;
          unsigned int v48 = a3->i32[0];
          goto LABEL_54;
        case 3u:
          int v27 = a7;
          unsigned int v48 = a3->i32[1] | a3->i32[0];
          goto LABEL_54;
        case 4u:
          int v27 = a7;
          unsigned int v48 = ((unint64_t)(a3->i64[1] | a3->i64[0]) >> 32) | a3->i32[2] | a3->i32[0];
LABEL_54:
          unsigned int v47 = v48 | HIWORD(v48);
LABEL_55:
          int v46 = v47 | (v47 >> 8);
          break;
        default:
          int v27 = a7;
          LOBYTE(v46) = a3->i8[0];
          break;
      }
      if ((v34 & 0x3C) != 0) {
        uint64_t v49 = 4;
      }
      else {
        uint64_t v49 = v34 & 0x3F;
      }
      if ((v46 & 0x3C) != 0) {
        unsigned int v50 = 4;
      }
      else {
        unsigned int v50 = v46 & 0x3F;
      }
      uint64_t v28 = byte_224B1950F[4 * v49 + v49 + v50];
    }
  }
  uint64_t v51 = v12 + 13824;
  uint64_t v52 = *(void *)(a1 + 16);
  uint64_t v53 = v12 + 7040;
  uint64_t v54 = byte_224B28D18[8 * a4 + 7];
  sub_224AADEFC(v12 + 13824, (unsigned int *)(v12 + 7040 + 52 * v54 + 4 * v28 + 5896));
  if (v60)
  {
    *a11 = 64;
    *a10 = 16 * v13;
    return 0xFFFFFFFFLL;
  }
  int v291 = v54;
  uint64_t v292 = v52;
  if (v13)
  {
    unsigned int v62 = 0x10u;
    unsigned int v63 = a8;
    goto LABEL_97;
  }
  unsigned int v63 = a8;
  if (byte_224B28D18[8 * v14 + 5] + v27 > 3)
  {
LABEL_68:
    unsigned int v62 = 0;
    goto LABEL_97;
  }
  if (!a8)
  {
    uint64_t v64 = *(void *)(v294 + 24);
    unsigned int v62 = *(unsigned __int8 *)(v64 + *(unsigned __int8 *)(a6 + 4) + 816);
    if (!*(unsigned char *)(v64 + *(unsigned __int8 *)(a6 + 4) + 816)) {
      goto LABEL_97;
    }
    if (!v27)
    {
      uint64_t v70 = byte_224B28D18[8 * v14 + 4];
      if (((0x18608uLL >> v14) & 1) != 0 || *(unsigned char *)(v64 + 894))
      {
        sub_224AADEFC(v51, (unsigned int *)(v52 + 4 * v70 + 5448));
        unsigned int v63 = a8;
        unsigned int v62 = (v73 - 1) & 9;
        goto LABEL_97;
      }
      if ((0x60604uLL >> v14))
      {
        sub_224AADBF0(v51, v52 + 2144, 11);
        int v72 = v74 + 12;
      }
      else
      {
        sub_224AADBF0(v51, v52 + 32 * v70 + 2080, 15);
        int v72 = v71 + 24;
      }
      unsigned int v62 = byte_224B1948B[v72];
LABEL_96:
      unsigned int v63 = a8;
      goto LABEL_97;
    }
    unsigned int v65 = *(unsigned __int8 *)(a6 + 8);
    if (v65 == 13) {
      unsigned int v65 = byte_224B19486[*(char *)(a6 + 13)];
    }
    int v66 = *(unsigned __int8 *)(v64 + 894);
    unsigned int v67 = byte_224B28D18[8 * v14 + 4];
    if (!v66)
    {
      if (((0x60604uLL >> v14) & 1) == 0)
      {
        sub_224AADB30(v51, (int8x16_t *)(v52 + 208 * byte_224B28D18[8 * v14 + 4] + 16 * v65 + 2176), 6);
        int v69 = v68 + 5;
LABEL_93:
        unsigned int v62 = byte_224B1948B[v69];
        goto LABEL_96;
      }
      unsigned int v67 = 2;
    }
    int v69 = sub_224AAD9A0(v51, (int16x4_t *)(v52 + 208 * v67 + 16 * v65 + 2592), 4, v55, v56, v57, v58, v59);
    goto LABEL_93;
  }
  if (v27)
  {
    unsigned int v62 = byte_224B19478[*(unsigned __int8 *)(a6 + 9)];
    goto LABEL_97;
  }
  unsigned int v62 = *a10;
  if ((0x18608uLL >> v14))
  {
    if (v62 == 9) {
      unsigned int v62 = 9;
    }
    else {
      unsigned int v62 = 0;
    }
  }
  else if (((0x60604uLL >> v14) & 1) != 0 && ((1 << v62) & 0xF000) != 0)
  {
    goto LABEL_68;
  }
LABEL_97:
  *a10 = v62;
  if (v22 >= 3) {
    int v75 = 3;
  }
  else {
    int v75 = v22;
  }
  if (v26 >= 3) {
    int v76 = 3;
  }
  else {
    int v76 = v26;
  }
  int v77 = v76 + v75;
  unsigned int v78 = v62;
  int v79 = byte_224B194B3[v62];
  unint64_t v80 = v62 - 10;
  int v285 = v79;
  switch(v77)
  {
    case 0:
      uint64_t v81 = v53 + 32 * (v63 != 0);
      uint64_t v82 = v63 != 0;
      unsigned int v83 = sub_224AAD9A0(v51, (int16x4_t *)(v81 + 16 * (v80 < 6)), 4, v55, v56, v57, v58, v59);
      uint64_t v84 = v52;
      goto LABEL_117;
    case 1:
      uint64_t v82 = v63 != 0;
      uint64_t v84 = v52;
      unint64_t v87 = (int8x16_t *)(v52 + 32 * v82 + 16 * (v80 < 6) + 7104);
      uint64_t v88 = v51;
      uint64_t v89 = 5;
      goto LABEL_111;
    case 2:
      uint64_t v82 = v63 != 0;
      uint64_t v84 = v52;
      unint64_t v87 = (int8x16_t *)(v52 + 32 * v82 + 16 * (v80 < 6) + 7168);
      uint64_t v88 = v51;
      uint64_t v89 = 6;
      goto LABEL_111;
    case 3:
      uint64_t v82 = v63 != 0;
      uint64_t v84 = v52;
      unint64_t v87 = (int8x16_t *)(v52 + 32 * v82 + 16 * (v80 < 6) + 7232);
      uint64_t v88 = v51;
      uint64_t v89 = 7;
LABEL_111:
      sub_224AADB30(v88, v87, v89);
      goto LABEL_116;
    case 4:
      uint64_t v82 = v63 != 0;
      uint64_t v84 = v52;
      uint64_t v91 = v52 + (v82 << 6) + 32 * (v80 < 6) + 7296;
      uint64_t v92 = v51;
      uint64_t v93 = 8;
      goto LABEL_115;
    case 5:
      uint64_t v82 = v63 != 0;
      uint64_t v84 = v52;
      uint64_t v91 = v52 + 32 * v82 + 7424;
      uint64_t v92 = v51;
      uint64_t v93 = 9;
      goto LABEL_115;
    case 6:
      uint64_t v82 = v63 != 0;
      uint64_t v84 = v52;
      uint64_t v91 = v52 + 32 * v82 + 7488;
      uint64_t v92 = v51;
      uint64_t v93 = 10;
LABEL_115:
      sub_224AADBF0(v92, v91, v93);
LABEL_116:
      unsigned int v83 = v90;
LABEL_117:
      uint64_t v94 = v54;
      uint64_t v295 = v14;
      if ((int)v83 >= 2)
      {
        sub_224AADEFC(v51, (unsigned int *)(v84 + 88 * v54 + 44 * v82 + 4 * v83 + 12496));
        unsigned int v96 = v83 - 2;
        BOOL v18 = v83 == 2;
        int v97 = (v95 | 2) << (v83 - 2);
        int v98 = 0;
        if (!v18)
        {
          do
          {
            --v96;
            sub_224AADE84();
            int v98 = v99 | (2 * v98);
          }
          while (v96);
        }
        unsigned int v83 = v98 | v97;
        uint64_t v14 = v295;
        uint64_t v94 = v54;
      }
      unint64_t v85 = (int16x4_t *)(v84 + 7040 + (v94 << 6) + 32 * v82 + 512);
      if ((int)v94 >= 3) {
        unsigned int v100 = 3;
      }
      else {
        unsigned int v100 = v94;
      }
      uint64_t v298 = v84 + 7040 + 336 * v100 + 168 * v82 + 4112;
      if (!v83)
      {
        unint64_t v86 = (int8x8_t *)(v84 + 7040 + 336 * v100 + 168 * v82 + 4112);
LABEL_162:
        int v136 = sub_224AAD9A0(v51, v85, 2, v55, v56, v57, v58, v59);
        unsigned int v120 = 0;
        unsigned int v119 = a9;
        unsigned int v282 = 0;
        unsigned int v281 = v82;
        if (v136 != 2)
        {
          unsigned int v142 = v136 + 1;
          goto LABEL_237;
        }
        goto LABEL_235;
      }
      v280 = (unsigned __int8 *)(a1 + 8257);
      unsigned int v281 = v82;
      v303 = (int16x4_t *)(v84 + 656 * v94 + 328 * v82 + 7872);
      int v101 = (char *)(a1 + 8256);
      if (byte_224B28D18[8 * a4] >= 8u) {
        int v102 = 8;
      }
      else {
        int v102 = byte_224B28D18[8 * a4];
      }
      if (byte_224B28D18[8 * v14 + 1] >= 8u) {
        unsigned int v103 = 8;
      }
      else {
        unsigned int v103 = byte_224B28D18[8 * v14 + 1];
      }
      uint64_t v104 = 1;
      if (v83 > 2 * v103 * v102) {
        uint64_t v104 = 2;
      }
      unsigned int v282 = v83;
      if (v83 <= 4 * v103 * v102) {
        uint64_t v105 = v104;
      }
      else {
        uint64_t v105 = v104 + 1;
      }
      int v106 = sub_224AAD9A0(v51, &v85[v105], 2, v55, v56, v57, v58, v59);
      int v107 = v106 + 1;
      v301 = (char *)(a1 + 8256);
      if (v285 == 2)
      {
        char v143 = v22 + 2;
        char v144 = v26 + 2;
        int v145 = 4 * v102 - 1;
        bzero(v101, (v102 << 6) | 0x20u);
        char v146 = 65 * v107;
        unsigned int v147 = v145 & v282;
        v148 = v101;
        unsigned int v149 = v282 >> v143;
        unsigned int v150 = ((v145 & v282) << (v26 + 2)) | (v282 >> v143);
        if (v106 == 2)
        {
          uint64_t v151 = 112;
          if (!v149) {
            uint64_t v151 = 56;
          }
          v152 = v148;
          int v153 = sub_224AADCD8(v51, (int8x8_t *)(v298 + v151), v110, v111, v112, v113, v114);
          unsigned int v147 = v145 & v282;
          v148 = v152;
          int v107 = v153;
          char v146 = v153 - 64;
        }
        int v154 = v107 << 11;
        unsigned int v119 = a9;
        unsigned int v120 = v150;
        a9[v150] = v154;
        v148[16 * v147 + v149] = v146;
        if (v282 >= 2)
        {
          unsigned int v155 = v282 + 1;
          do
          {
            unsigned int v156 = (v155 - 2) & v145;
            uint64_t v157 = (v155 - 2) >> v143;
            unsigned int v158 = (v156 << v144) | v157;
            v159 = &v148[16 * v156 + v157];
            int v160 = v159[16] + v159[1] + v159[2];
            unsigned int v161 = v160 + v159[3] + v159[4];
            int v162 = 5 * v157 + 26;
            if (v157 > 1) {
              int v162 = 36;
            }
            if (v161 <= 0x200) {
              unsigned int v163 = (v161 + 64) >> 7;
            }
            else {
              unsigned int v163 = 4;
            }
            int v164 = sub_224AAD9A0(v51, &v303[v163 + v162], 3, v110, v111, v112, v113, v114);
            if (v164 == 3)
            {
              unsigned int v165 = v160 & 0x3F;
              if (v157) {
                int v166 = 14;
              }
              else {
                int v166 = 7;
              }
              if (v165 <= 0xC) {
                unsigned int v167 = (v165 + 1) >> 1;
              }
              else {
                unsigned int v167 = 6;
              }
              int v168 = sub_224AADCD8(v51, (int8x8_t *)(v298 + 8 * (v167 + v166)), v110, v111, v112, v113, v114);
              char v169 = v168 - 64;
              int v170 = v120 | (v168 << 11);
              unsigned int v120 = v158;
            }
            else
            {
              char v169 = 65 * v164;
              int v170 = (v120 - 2048) & ((1572673 * v164) >> 9);
              if (v170) {
                unsigned int v120 = v158;
              }
            }
            v148 = v301;
            unsigned int v119 = a9;
            char *v159 = v169;
            a9[v158] = v170;
            --v155;
          }
          while (v155 > 2);
        }
        goto LABEL_220;
      }
      if (v285 == 1)
      {
        char v108 = v26 + 2;
        int v109 = 4 * v103 - 1;
        bzero(v101, (v103 << 6) | 0x20);
        char v115 = 65 * v107;
        unsigned int v116 = v282 >> (v26 + 2);
        if (v106 == 2)
        {
          uint64_t v117 = 112;
          if (!v116) {
            uint64_t v117 = 56;
          }
          int v107 = sub_224AADCD8(v51, (int8x8_t *)(v298 + v117), v110, v111, v112, v113, v114);
          char v115 = v107 - 64;
        }
        int v118 = v107 << 11;
        unsigned int v119 = a9;
        a9[v282] = v118;
        v101[16 * (v109 & v282) + v116] = v115;
        if (v282 < 2)
        {
          unsigned int v120 = 1;
        }
        else
        {
          unsigned int v120 = v282;
          uint64_t v121 = v282 - 1;
          do
          {
            uint64_t v122 = v121 >> v108;
            char v123 = &v301[16 * (v109 & v121) + v122];
            int v124 = v123[16] + v123[1] + v123[2];
            unsigned int v125 = v124 + v123[3] + v123[4];
            int v126 = 5 * v122 + 26;
            if (v122 > 1) {
              int v126 = 36;
            }
            if (v125 <= 0x200) {
              unsigned int v127 = (v125 + 64) >> 7;
            }
            else {
              unsigned int v127 = 4;
            }
            int v128 = sub_224AAD9A0(v51, &v303[v127 + v126], 3, v110, v111, v112, v113, v114);
            if (v128 == 3)
            {
              unsigned int v129 = v124 & 0x3F;
              if (v122) {
                int v130 = 14;
              }
              else {
                int v130 = 7;
              }
              if (v129 <= 0xC) {
                unsigned int v131 = (v129 + 1) >> 1;
              }
              else {
                unsigned int v131 = 6;
              }
              int v132 = sub_224AADCD8(v51, (int8x8_t *)(v298 + 8 * (v131 + v130)), v110, v111, v112, v113, v114);
              char v133 = v132 - 64;
              int v134 = v120 | (v132 << 11);
              unsigned int v120 = v121;
            }
            else
            {
              char v133 = 65 * v128;
              int v134 = (v120 - 2048) & ((1572673 * v128) >> 9);
              if (v134) {
                unsigned int v120 = v121;
              }
            }
            *char v123 = v133;
            unsigned int v119 = a9;
            a9[v121] = v134;
            unint64_t v135 = v121-- + 1;
          }
          while (v135 > 2);
        }
LABEL_220:
        int v204 = v280[15] + *v280 + v280[1];
        unsigned int v205 = v204 + v280[2] + v280[3];
        if (v205 <= 0x200) {
          unsigned int v206 = ((v205 + 64) >> 7) + 26;
        }
        else {
          unsigned int v206 = 30;
        }
        unsigned int v207 = sub_224AAD9A0(v51, &v303[v206], 3, v110, v111, v112, v113, v114);
        if (v207 != 3)
        {
          unsigned int v142 = v207;
          unsigned int v209 = a8;
          uint64_t v14 = v295;
          goto LABEL_238;
        }
        if ((v204 & 0x3Fu) <= 0xC) {
          unsigned int v208 = ((v204 & 0x3Fu) + 1) >> 1;
        }
        else {
          unsigned int v208 = 6;
        }
        unint64_t v86 = (int8x8_t *)(v298 + 8 * v208);
        uint64_t v14 = v295;
        goto LABEL_235;
      }
      int v171 = (a4 > 4) & a4;
      if (a4 > 4) {
        ++v171;
      }
      int v284 = v171;
      uint64_t v172 = (uint64_t)*(&off_2646ED668 + v14);
      uint64_t v173 = 4 * v103;
      if (v26 >= 4) {
        char v174 = 5;
      }
      else {
        char v174 = v26 + 2;
      }
      bzero(v301, 4 * v103 * ((4 * v102) | 2));
      unsigned int v180 = *(unsigned __int16 *)(v172 + 2 * v83);
      char v290 = v174;
      unsigned int v181 = v180 >> v174;
      uint64_t v286 = 4 * v103 - 1;
      unsigned int v182 = (4 * v103 - 1) & v180;
      char v183 = 65 * (v106 + 1);
      if (v106 == 2)
      {
        uint64_t v184 = 56;
        if ((v181 | v182) > 1) {
          uint64_t v184 = 112;
        }
        int v107 = sub_224AADCD8(v51, (int8x8_t *)(v298 + v184), v175, v176, v177, v178, v179);
        char v183 = v107 - 64;
      }
      int v185 = v107 << 11;
      unsigned int v119 = a9;
      unsigned int v120 = v180;
      a9[v180] = v185;
      v301[v181 * 4 * v103 + (unint64_t)v182] = v183;
      if (v282 < 2)
      {
        uint64_t v14 = v295;
      }
      else
      {
        uint64_t v283 = v172 - 2;
        uint64_t v186 = v282;
        do
        {
          uint64_t v187 = *(unsigned __int16 *)(v283 + 2 * v186);
          unsigned int v188 = v187 >> v290;
          unsigned int v189 = v286 & v187;
          v190 = &v301[(v187 >> v290) * (unint64_t)v173 + (v286 & v187)];
          int v191 = v190[v173] + v190[1] + v190[v173 | 1];
          unsigned int v192 = v191 + v190[2] + v190[2 * v173];
          if ((v286 & v187) >= 4) {
            uint64_t v193 = 4;
          }
          else {
            uint64_t v193 = v189;
          }
          if (v188 >= 4) {
            unsigned int v194 = 4;
          }
          else {
            unsigned int v194 = v187 >> v290;
          }
          int v195 = byte_224B194C4[25 * v284 + 4 * v193 + v193 + v194];
          if (v192 <= 0x200) {
            unsigned int v196 = (v192 + 64) >> 7;
          }
          else {
            unsigned int v196 = 4;
          }
          int v197 = sub_224AAD9A0(v51, &v303[v196 + v195], 3, v175, v176, v177, v178, v179);
          if (v197 == 3)
          {
            unsigned int v198 = v191 & 0x3F;
            if ((v188 | v189) <= 1) {
              int v199 = 7;
            }
            else {
              int v199 = 14;
            }
            if (v198 <= 0xC) {
              unsigned int v200 = (v198 + 1) >> 1;
            }
            else {
              unsigned int v200 = 6;
            }
            int v201 = sub_224AADCD8(v51, (int8x8_t *)(v298 + 8 * (v200 + v199)), v175, v176, v177, v178, v179);
            char v202 = v201 - 64;
            int v203 = v120 | (v201 << 11);
            unsigned int v120 = v187;
          }
          else
          {
            char v202 = 65 * v197;
            int v203 = (v120 - 2048) & ((1572673 * v197) >> 9);
            if (v203) {
              unsigned int v120 = v187;
            }
          }
          uint64_t v14 = v295;
          --v186;
          char *v190 = v202;
          a9[v187] = v203;
          unsigned int v119 = a9;
        }
        while ((unint64_t)(v186 + 1) > 2);
      }
      unsigned int v210 = sub_224AAD9A0(v51, v303, 3, v175, v176, v177, v178, v179);
      if (v210 == 3)
      {
        unsigned int v211 = (v301[v173] + *v280 + v301[v173 | 1]) & 0x3F;
        if (v211 <= 0xC) {
          unsigned int v212 = (v211 + 1) >> 1;
        }
        else {
          unsigned int v212 = 6;
        }
        unint64_t v86 = (int8x8_t *)(v298 + 8 * v212);
LABEL_235:
        unsigned int v210 = sub_224AADCD8(v51, v86, v137, v138, v139, v140, v141);
      }
      unsigned int v142 = v210;
LABEL_237:
      unsigned int v209 = a8;
LABEL_238:
      if (*a10 > 8) {
        v213 = 0;
      }
      else {
        v213 = *(unsigned __int8 **)(v294 + 24 * v14 + 8 * v209 + 3576);
      }
      v214 = (unsigned __int16 *)(*(void *)(v292 + 14048) + 12 * *(unsigned __int8 *)(a6 + 4) + 4 * v209);
      if (v291 <= 2) {
        char v215 = 2;
      }
      else {
        char v215 = v291;
      }
      char v304 = v215 - 2;
      int v302 = ~(-128 << *(_DWORD *)(v294 + 2172));
      if (!v142)
      {
        char v217 = 64;
        if (v213)
        {
LABEL_304:
          char v297 = v217;
          int v248 = v214[1];
          unsigned int v249 = v120;
          do
          {
            sub_224AADE84();
            int v251 = v250;
            unsigned int v252 = v119[v249];
            unsigned int v253 = (v213[v249] * v248 + 16) >> 5;
            unsigned int v254 = v252 >> 11;
            if (v252 >> 11 < 0xF)
            {
              unsigned int v263 = v253 * v254;
            }
            else
            {
              unsigned int v299 = v249;
              v255 = v213;
              int v256 = 0;
              unsigned int v257 = -1;
              do
              {
                int v258 = v256;
                ++v257;
                sub_224AADE84();
                if (v259) {
                  break;
                }
                int v256 = v258 - 1;
              }
              while (v257 < 0x20);
              if (v257)
              {
                int v260 = 1;
                do
                {
                  sub_224AADE84();
                  int v260 = v261 + 2 * v260;
                  BOOL v239 = __CFADD__(v258++, 1);
                }
                while (!v239);
                int v262 = v260 - 1;
              }
              else
              {
                int v262 = 0;
              }
              unsigned int v254 = (v262 + 15) & 0xFFFFF;
              unsigned int v263 = (v254 * v253) & 0xFFFFFF;
              unsigned int v119 = a9;
              v213 = v255;
              unsigned int v249 = v299;
            }
            v142 += v254;
            int v264 = v263 >> v304;
            if (v263 >> v304 >= v251 + v302) {
              int v264 = v251 + v302;
            }
            if (v251) {
              int v264 = -v264;
            }
            v119[v249] = v264;
            unsigned int v249 = v252 & 0x3FF;
          }
          while ((v252 & 0x3FF) != 0);
          char v217 = v297;
          goto LABEL_348;
        }
        goto LABEL_329;
      }
      switch(v14)
      {
        case 1:
          int v216 = ((67372036 * ((a3->i16[0] & 0xC0C0) + (a2->i16[0] & 0xC0C0u))) >> 24) - 4;
          break;
        case 2:
          int v216 = ((16843009
                 * ((((unsigned __int32)a3->i32[0] >> 6) & 0x3030303) + (((unsigned __int32)a2->i32[0] >> 6) & 0x3030303))) >> 24)
               - 8;
          break;
        case 3:
          int v216 = (((0x101010101010101
                                * ((((unint64_t)a3->i64[0] >> 6) & 0x303030303030303)
                                 + (((unint64_t)a2->i64[0] >> 6) & 0x303030303030303))) >> 32) >> 24)
               - 16;
          break;
        case 4:
          v218.i64[0] = 0x303030303030303;
          v218.i64[1] = 0x303030303030303;
          int v216 = (((unint64_t)(0x101010101010101
                                                  * vaddvq_s64(vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(*a2, 6uLL), v218), (int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(*a3, 6uLL), v218)))) >> 32) >> 24)- 32;
          break;
        case 5:
          int v219 = a2->i8[0] & 0xC0;
          int v220 = a3->i16[0] & 0xC0C0;
          goto LABEL_255;
        case 6:
          int v219 = a2->i16[0] & 0xC0C0;
          int v220 = a3->i8[0] & 0xC0;
LABEL_255:
          int v216 = ((67372036 * (v220 + v219)) >> 24) - 3;
          break;
        case 7:
          unsigned int v221 = (a3->i32[0] & 0xC0C0C0C0) + (a2->i16[0] & 0xC0C0);
          goto LABEL_258;
        case 8:
          unsigned int v221 = (a2->i32[0] & 0xC0C0C0C0) + (a3->i16[0] & 0xC0C0);
LABEL_258:
          int v216 = ((16843009 * (v221 >> 6)) >> 24) - 6;
          break;
        case 9:
          unint64_t v222 = (a3->i64[0] & 0xC0C0C0C0C0C0C0C0) + (a2->i32[0] & 0xC0C0C0C0);
          goto LABEL_261;
        case 10:
          unint64_t v222 = (a2->i64[0] & 0xC0C0C0C0C0C0C0C0) + (a3->i32[0] & 0xC0C0C0C0);
LABEL_261:
          int v216 = (((0x101010101010101 * (v222 >> 6)) >> 32) >> 24) - 12;
          break;
        case 11:
          uint64_t v223 = (((unint64_t)a3->i64[0] >> 6) & 0x303030303030303)
               + (((unint64_t)a2->i64[0] >> 6) & 0x303030303030303);
          unint64_t v224 = (unint64_t)a3->i64[1] >> 6;
          goto LABEL_264;
        case 12:
          uint64_t v223 = (((unint64_t)a2->i64[1] >> 6) & 0x303030303030303)
               + (((unint64_t)a2->i64[0] >> 6) & 0x303030303030303);
          unint64_t v224 = (unint64_t)a3->i64[0] >> 6;
LABEL_264:
          int v216 = (((0x101010101010101 * (v223 + (v224 & 0x303030303030303))) >> 32) >> 24) - 24;
          break;
        case 13:
          unsigned int v225 = (a3->i32[0] & 0xC0C0C0C0) + (a2->i8[0] & 0xC0);
          goto LABEL_267;
        case 14:
          unsigned int v225 = (a2->i32[0] & 0xC0C0C0C0) + (a3->i8[0] & 0xC0);
LABEL_267:
          int v216 = ((16843009 * (v225 >> 6)) >> 24) - 5;
          break;
        case 15:
          unint64_t v226 = (a3->i64[0] & 0xC0C0C0C0C0C0C0C0) + (a2->i16[0] & 0xC0C0);
          goto LABEL_270;
        case 16:
          unint64_t v226 = (a2->i64[0] & 0xC0C0C0C0C0C0C0C0) + (a3->i16[0] & 0xC0C0);
LABEL_270:
          int v216 = (((0x101010101010101 * (v226 >> 6)) >> 32) >> 24) - 10;
          break;
        case 17:
          unint64_t v227 = (a3->i64[0] & 0xC0C0C0C0C0C0C0C0) + (a2->i32[0] & 0xC0C0C0C0);
          unint64_t v228 = (unint64_t)a3->i64[1] >> 6;
          goto LABEL_273;
        case 18:
          unint64_t v227 = (a2->i64[0] & 0xC0C0C0C0C0C0C0C0) + (a3->i32[0] & 0xC0C0C0C0);
          unint64_t v228 = (unint64_t)a2->i64[1] >> 6;
LABEL_273:
          int v216 = (((0x101010101010101 * ((v228 & 0x303030303030303) + (v227 >> 6))) >> 32) >> 24) - 20;
          break;
        default:
          int v216 = (a3->u8[0] >> 6) + (a2->u8[0] >> 6) - 2;
          break;
      }
      BOOL v32 = v216 <= 0;
      uint64_t v229 = v216 != 0;
      if (!v32) {
        ++v229;
      }
      sub_224AADEFC(v51, (unsigned int *)(v292 + 12 * v281 + 4 * v229 + 13196));
      int v231 = v230;
      int v232 = *v214;
      char v217 = (v230 - 1) & 0x80;
      if (!v213)
      {
        if (v142 == 15)
        {
          unsigned int v240 = -1;
          do
          {
            ++v240;
            sub_224AADE84();
          }
          while (!v241 && v240 < 0x20);
          if (v240)
          {
            int v242 = -v240;
            int v243 = 1;
            do
            {
              sub_224AADE84();
              int v243 = v244 + 2 * v243;
              BOOL v239 = __CFADD__(v242++, 1);
            }
            while (!v239);
            unsigned int v142 = (v243 + 14) & 0xFFFFF;
            unsigned int v119 = a9;
          }
          else
          {
            unsigned int v142 = 15;
          }
          unsigned int v246 = ((v142 * v232) & 0xFFFFFF) >> v304;
          if (v246 >= v231 + v302) {
            unsigned int v246 = v231 + v302;
          }
        }
        else
        {
          unsigned int v246 = (v142 * v232) >> v304;
        }
        if (v231) {
          unsigned int v246 = -v246;
        }
        *unsigned int v119 = v246;
        if (!v120) {
          goto LABEL_348;
        }
LABEL_329:
        int v265 = v214[1];
        do
        {
          sub_224AADE84();
          int v267 = v266;
          unsigned int v268 = v119[v120];
          unsigned int v269 = v268 >> 11;
          if (v268 >> 11 < 0xF)
          {
            unsigned int v277 = (v269 * v265) >> v304;
          }
          else
          {
            int v270 = 0;
            unsigned int v271 = -1;
            do
            {
              int v272 = v270;
              ++v271;
              sub_224AADE84();
              if (v273) {
                break;
              }
              int v270 = v272 - 1;
            }
            while (v271 < 0x20);
            if (v271)
            {
              int v274 = 1;
              do
              {
                sub_224AADE84();
                int v274 = v275 + 2 * v274;
                BOOL v239 = __CFADD__(v272++, 1);
              }
              while (!v239);
              int v276 = v274 - 1;
            }
            else
            {
              int v276 = 0;
            }
            unsigned int v269 = (v276 + 15) & 0xFFFFF;
            unsigned int v277 = ((v269 * v265) & 0xFFFFFF) >> v304;
            if (v277 >= v267 + v302) {
              unsigned int v277 = v267 + v302;
            }
            unsigned int v119 = a9;
          }
          v142 += v269;
          if (v267) {
            int v278 = -v277;
          }
          else {
            int v278 = v277;
          }
          v119[v120] = v278;
          unsigned int v120 = v268 & 0x3FF;
        }
        while ((v268 & 0x3FF) != 0);
        goto LABEL_348;
      }
      unsigned int v233 = (*v213 * v232 + 16) >> 5;
      if (v142 == 15)
      {
        unsigned int v234 = -1;
        do
        {
          ++v234;
          sub_224AADE84();
        }
        while (!v235 && v234 < 0x20);
        if (v234)
        {
          int v236 = -v234;
          int v237 = 1;
          do
          {
            sub_224AADE84();
            int v237 = v238 + 2 * v237;
            BOOL v239 = __CFADD__(v236++, 1);
          }
          while (!v239);
          unsigned int v142 = (v237 + 14) & 0xFFFFF;
        }
        else
        {
          unsigned int v142 = 15;
        }
        int v245 = (v142 * v233) & 0xFFFFFF;
        unsigned int v119 = a9;
      }
      else
      {
        int v245 = v233 * v142;
      }
      unsigned int v247 = v245 >> v304;
      if (v247 >= v231 + v302) {
        unsigned int v247 = v231 + v302;
      }
      if (v231) {
        unsigned int v247 = -v247;
      }
      *unsigned int v119 = v247;
      if (v120) {
        goto LABEL_304;
      }
LABEL_348:
      if (v142 >= 0x3F) {
        char v279 = 63;
      }
      else {
        char v279 = v142;
      }
      *a11 = v279 | v217;
      return v282;
    default:
      uint64_t v82 = v63 != 0;
      unint64_t v85 = (int16x4_t *)(v52 + 7040 + (v54 << 6) + 32 * v82 + 512);
      if ((int)v54 < 3) {
        unsigned int v78 = v54;
      }
      unint64_t v86 = (int8x8_t *)(v52 + 7040 + 336 * v78 + 168 * (v63 != 0) + 4112);
      goto LABEL_162;
  }
}

uint64_t sub_224AF0C34(uint64_t result, int a2, int a3, unsigned char *a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = result;
  v226[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(result + 8);
  int v8 = *(_DWORD *)(result + 24);
  int v7 = *(_DWORD *)(result + 28);
  int v9 = *(_DWORD *)(v6 + 2168);
  int v10 = &byte_224B28CC0[4 * a2];
  int v11 = *v10;
  int v12 = v10[1];
  if (v11 >= *(_DWORD *)(v6 + 3448) - v8) {
    int v13 = *(_DWORD *)(v6 + 3448) - v8;
  }
  else {
    int v13 = v11;
  }
  if (v12 >= *(_DWORD *)(v6 + 3452) - v7) {
    int v14 = *(_DWORD *)(v6 + 3452) - v7;
  }
  else {
    int v14 = v12;
  }
  unsigned int v15 = v9 != 3;
  int v164 = v13;
  if (v9 == 3) {
    int v16 = v13;
  }
  else {
    int v16 = v13 + 1;
  }
  unsigned int v17 = v9 == 1;
  if (v9 == 1) {
    int v18 = v14 + 1;
  }
  else {
    int v18 = v14;
  }
  if (!v9 || (v11 <= v15 ? (BOOL v19 = (*(_DWORD *)(result + 24) & 1) == 0) : (BOOL v19 = 0), v19))
  {
    int v163 = 0;
  }
  else
  {
    if (v12 <= v17) {
      int v20 = *(_DWORD *)(result + 28) & 1;
    }
    else {
      int v20 = 1;
    }
    int v163 = v20;
  }
  if (v14 >= 1)
  {
    unsigned int v21 = 0;
    uint64_t v22 = v8 & 0x1F;
    uint64_t v207 = (*(_DWORD *)(result + 24) & 0x1Fu) >> v15;
    uint64_t result = (uint64_t)&byte_224B28D18[8 * a4[10]];
    uint64_t v23 = &byte_224B28D18[8 * a4[7]];
    unsigned int v198 = (_WORD *)(v5 + 25984);
    unsigned int v24 = (v11 + v15) >> v15;
    unsigned int v25 = (v12 + v17) >> v17;
    int v197 = *(unsigned __int8 *)(*(void *)(v6 + 8) + 394) << 10;
    int v216 = *(_DWORD **)(v5 + 16);
    uint64_t v26 = *(void *)(v6 + 3280);
    int v27 = (_DWORD *)(v5 + 258564);
    uint64_t v149 = (8 * v11 * v12);
    uint64_t v169 = v7 & 0x1F;
    uint64_t v159 = v5 + 26256;
    int v160 = (unsigned char *)(v5 + 32 + v169 + 224);
    uint64_t v147 = 8 * v24 * v25;
    uint64_t v148 = v5 + 13440;
    uint64_t v167 = v5 + 9344;
    int v161 = v16 >> v15;
    int v153 = v18 >> v17;
    unsigned int v173 = (v7 & 0x1F) >> v17;
    uint64_t v158 = v5 + 32;
    int v154 = (unsigned __int8 *)(v5 + 32 + v173 + 560);
    unsigned int v181 = (unsigned char *)result;
    double v178 = (unsigned char *)(result + 1);
    uint64_t v196 = v26 + 64;
    char v202 = (unsigned int *)(v5 + 1024);
    uint64_t v168 = v26;
    uint64_t v191 = v26 + 680;
    unsigned int v150 = 4 * v25;
    unsigned int v151 = 4 * v24;
    int v192 = ~v15;
    int v215 = ~v17;
    v213 = v4 + 15;
    unint64_t v222 = v23;
    char v217 = v23 + 1;
    uint64_t v203 = v6;
    int v162 = v14;
    unsigned int v201 = v15;
    uint64_t v172 = v22;
    unsigned int v206 = (_DWORD *)(v5 + 258564);
    int v195 = v4;
    uint64_t v214 = v5;
    unsigned int v208 = v17;
    do
    {
      unsigned int v28 = v21 + 16;
      if (v14 >= (int)(v21 + 16)) {
        int v29 = v21 + 16;
      }
      else {
        int v29 = v14;
      }
      int v171 = v29;
      int v30 = v153;
      int v152 = v28 >> v17;
      if (v153 >= (int)(v28 >> v17)) {
        int v30 = v28 >> v17;
      }
      int v183 = v30;
      if (v164 >= 1)
      {
        int64_t v31 = 0;
        unsigned int v165 = v21 + 16;
        char v156 = a3 & (v21 == 0);
        BOOL v33 = (a3 & 8) == 0 && (int)v28 >= v14;
        BOOL v155 = v33;
        unsigned int v170 = v21;
        unsigned int v176 = v21 >> v17;
        do
        {
          int64_t v180 = v31;
          if (v4[11])
          {
            uint64_t v34 = *(void *)(v6 + 2120);
            unint64_t v35 = *(void *)(v6 + 2144);
            uint64_t v36 = *(int *)(v5 + 24);
            if (*v27) {
              *(void *)&v216[6 * (*v27 & 1) + 3474] += v149;
            }
            uint64_t result = (*(uint64_t (**)(unint64_t))(*(void *)(v6 + 3280) + 248))(v34 + 8 * (v36 + (v35 >> 1) * v7));
            int64_t v31 = v180;
          }
          uint64_t v37 = *(void *)(v5 + 656);
          int v38 = *(unsigned __int8 *)(v37 + v22 + 224);
          if (*(unsigned char *)(v37 + v22 + 224))
          {
            int v39 = *(unsigned __int8 *)(v37 + v22);
            if ((v39 & 0xFFFFFFFD) == 9 || v39 == 10) {
              int v38 = 512;
            }
            else {
              int v38 = 0;
            }
          }
          if (*v160)
          {
            int v41 = *(unsigned __int8 *)(v158 + v169);
            if ((v41 & 0xFFFFFFFD) == 9 || v41 == 10) {
              int v43 = 512;
            }
            else {
              int v43 = 0;
            }
          }
          else
          {
            int v43 = 0;
          }
          int64_t v44 = v31 + 16;
          if (v164 >= (int)v31 + 16) {
            int v45 = v31 + 16;
          }
          else {
            int v45 = v164;
          }
          unsigned int v46 = *(_DWORD *)(v5 + 28) + v170;
          *(_DWORD *)(v5 + 28) = v46;
          int64_t v47 = v31;
          int64_t v166 = v31 + 16;
          if ((int)v170 >= v171)
          {
            int v199 = v170;
          }
          else
          {
            char v48 = v156;
            if (v44 < v164) {
              char v48 = 1;
            }
            char v186 = v48;
            int64_t v49 = v45;
            int v50 = v155;
            if (v47) {
              int v50 = 1;
            }
            int v193 = v50;
            int v204 = v38 | v43;
            int v51 = *(_DWORD *)(v5 + 24);
            int v199 = v170;
            int v209 = v45;
            int64_t v184 = v45;
            do
            {
              uint64_t v52 = *(void *)(v6 + 2120);
              unint64_t v53 = *(void *)(v6 + 2144);
              uint64_t result = (v51 + v180);
              *(_DWORD *)(v5 + 24) = result;
              if (v180 >= v49)
              {
                int v57 = v180;
              }
              else
              {
                uint64_t v54 = (_WORD *)(v52 + 8 * (v180 + (v53 >> 1) * (int)v46 + v51));
                char v55 = v186;
                if (v199 > v170) {
                  char v55 = 0;
                }
                char v211 = v55;
                uint64_t v56 = (v199 + v169);
                int8x16_t v218 = (uint64x2_t *)(v5 + 64 + v56);
                unsigned int v189 = (uint64_t *)(v5 + 64 + (v56 + 8));
                int v57 = v180;
                unint64_t v58 = v180;
                do
                {
                  if (!v4[11])
                  {
                    unsigned int v225 = (char)v4[13];
                    BOOL v59 = (v211 & 1) == 0 && v57 + *v181 >= v45;
                    if (v58 < v57 || v193 && v199 + *v178 >= v171) {
                      char v60 = 0;
                    }
                    else {
                      char v60 = 8;
                    }
                    int v61 = *(_DWORD *)(v5 + 28);
                    if (((*(_DWORD *)(v6 + 3472) - 1) & v61) != 0) {
                      uint64_t v62 = 0;
                    }
                    else {
                      uint64_t v62 = *(void *)(v6 + 3408)
                    }
                          + 2 * ((*(_DWORD *)(v6 + 3456) * ((v61 >> *(_DWORD *)(v6 + 3468)) - 1)) << 7);
                    int v63 = *v181;
                    int v64 = *v178;
                    unsigned int v65 = sub_224AE4C0C(result, (int)result > v216[3466], v61, v61 > v216[3468], v216[3467], v216[3469], v60 | !v59, v54, *(void *)(v6 + 2144), v62, v4[8], (int *)&v225, v63, v64, *(unsigned __int8 *)(*(void *)(v6 + 8) + 394), v198, *(_DWORD *)(v6 + 4324));
                    (*(void (**)(_WORD *, void, _WORD *, void, void, void, void, void, _DWORD))(v196 + 8 * v65))(v54, *(void *)(v6 + 2144), v198, (4 * v63), (4 * v64), v204 | v197 | v225, (4 * (*(_DWORD *)(v6 + 3448) - *(_DWORD *)(v5 + 24))), (4 * (*(_DWORD *)(v6 + 3452) - *(_DWORD *)(v5 + 28))), *(_DWORD *)(v6 + 4324));
                    unint64_t v58 = v180;
                    int v45 = v209;
                  }
                  if (v4[6])
                  {
                    if (*v206)
                    {
                      unsigned int v66 = *v181;
                    }
                    else
                    {
                      switch(*v178)
                      {
                        case 1:
                          v218->i8[0] = 64;
                          break;
                        case 2:
                          v218->i16[0] = 16448;
                          break;
                        case 3:
                        case 5:
                        case 6:
                        case 7:
                          break;
                        case 4:
                          v218->i32[0] = 1077952576;
                          break;
                        case 8:
                          int v76 = (uint64_t *)v218;
                          goto LABEL_107;
                        default:
                          if (*v178 == 16)
                          {
                            v218->i64[0] = 0x4040404040404040;
                            int v76 = v189;
LABEL_107:
                            *int v76 = 0x4040404040404040;
                          }
                          break;
                      }
                      unsigned int v66 = *v181;
                      switch(*v181)
                      {
                        case 1:
                          *(unsigned char *)(*(void *)(v5 + 656) + (v57 + v172) + 32) = 64;
                          unsigned int v66 = 1;
                          break;
                        case 2:
                          *(_WORD *)(*(void *)(v5 + 656) + (v57 + v172) + 32) = 16448;
                          unsigned int v66 = 2;
                          break;
                        case 3:
                        case 5:
                        case 6:
                        case 7:
                          break;
                        case 4:
                          *(_DWORD *)(*(void *)(v5 + 656) + (v57 + v172) + 32) = 1077952576;
                          unsigned int v66 = 4;
                          break;
                        case 8:
                          *(void *)(*(void *)(v5 + 656) + (v57 + v172) + 32) = 0x4040404040404040;
                          unsigned int v66 = 8;
                          break;
                        default:
                          if (v66 == 16)
                          {
                            uint64_t v77 = (v57 + v172);
                            *(void *)(*(void *)(v5 + 656) + v77 + 32) = 0x4040404040404040;
                            *(void *)(*(void *)(v5 + 656) + (v77 + 8) + 32) = 0x4040404040404040;
                          }
                          break;
                      }
                    }
                  }
                  else
                  {
                    LODWORD(v226[0]) = 0;
                    if (!*v206)
                    {
                      LOBYTE(v224) = 0;
                      uint64_t v72 = (v57 + v172);
                      int v73 = sub_224AEF500(v5, (uint64x2_t *)(*(void *)(v5 + 656) + v72 + 32), v218, v4[10], a2, (uint64_t)v4, 1, 0, v202, (unsigned int *)v226, &v224);
                      int v74 = *v178;
                      if (v74 >= *(_DWORD *)(v6 + 3452) - *(_DWORD *)(v5 + 28)) {
                        int v74 = *(_DWORD *)(v6 + 3452) - *(_DWORD *)(v5 + 28);
                      }
                      switch(v74)
                      {
                        case 1:
                          LODWORD(v75) = v224;
                          v218->i8[0] = v224;
                          goto LABEL_122;
                        case 2:
                          LODWORD(v75) = v224;
                          v218->i16[0] = v224 | (v224 << 8);
                          goto LABEL_122;
                        case 3:
                        case 5:
                        case 6:
                        case 7:
                          goto LABEL_118;
                        case 4:
                          LODWORD(v75) = v224;
                          v218->i32[0] = 16843009 * v224;
                          goto LABEL_122;
                        case 8:
                          LODWORD(v75) = v224;
                          v218->i64[0] = 0x101010101010101 * v224;
                          goto LABEL_122;
                        default:
                          if (v74 == 16)
                          {
                            uint64_t v75 = v224;
                            v218->i64[0] = 0x101010101010101 * v224;
                            *unsigned int v189 = 0x101010101010101 * v75;
                          }
                          else
                          {
LABEL_118:
                            LODWORD(v75) = v224;
                            memset(v218, v224, v74);
                          }
LABEL_122:
                          unsigned int v66 = *v181;
                          int v78 = *(_DWORD *)(v203 + 3448) - *(_DWORD *)(v5 + 24);
                          if ((int)v66 < v78) {
                            int v78 = *v181;
                          }
                          switch(v78)
                          {
                            case 1:
                              *(unsigned char *)(*(void *)(v5 + 656) + v72 + 32) = v75;
                              goto LABEL_133;
                            case 2:
                              *(_WORD *)(*(void *)(v5 + 656) + v72 + 32) = v75 | ((_WORD)v75 << 8);
                              goto LABEL_133;
                            case 3:
                            case 5:
                            case 6:
                            case 7:
                              goto LABEL_128;
                            case 4:
                              *(_DWORD *)(*(void *)(v5 + 656) + v72 + 32) = 16843009 * v75;
                              goto LABEL_133;
                            case 8:
                              uint64_t v79 = 0x101010101010101 * v75;
                              uint64_t v80 = *(void *)(v5 + 656) + v72;
                              goto LABEL_131;
                            default:
                              if (v78 == 16)
                              {
                                uint64_t v79 = 0x101010101010101 * v75;
                                *(void *)(*(void *)(v5 + 656) + v72 + 32) = v79;
                                uint64_t v80 = *(void *)(v5 + 656) + (v72 + 8);
LABEL_131:
                                *(void *)(v80 + 32) = v79;
                              }
                              else
                              {
LABEL_128:
                                memset((void *)(*(void *)(v5 + 656) + v72 + 32), v75, v78);
                              }
LABEL_133:
                              uint64_t v6 = v203;
                              unsigned int v15 = v201;
                              if (v73 < 0) {
                                goto LABEL_94;
                              }
                              goto LABEL_93;
                          }
                      }
                    }
                    unsigned int v67 = &v216[6 * (*v206 & 1)];
                    int v68 = (__int16 *)*((void *)v67 + 1738);
                    int v69 = *v68;
                    *((void *)v67 + 1738) = v68 + 1;
                    unsigned int v66 = *v181;
                    if (v66 >= 8) {
                      int v70 = 8;
                    }
                    else {
                      int v70 = *v181;
                    }
                    unsigned int v71 = *v178;
                    if (v71 >= 8) {
                      unsigned int v71 = 8;
                    }
                    *((void *)v67 + 1739) += 64 * v70 * v71;
                    LODWORD(v226[0]) = v69 & 0x1F;
                    if (((v69 >> 5) & 0x80000000) == 0) {
LABEL_93:
                    }
                      (*(void (**)(_WORD *, void))(v191
                                                              + 136 * v4[10]
                                                              + 8 * LODWORD(v226[0])))(v54, *(void *)(v6 + 2144));
LABEL_94:
                    unint64_t v58 = v180;
                  }
                  v54 += 4 * v66;
                  v57 += v66;
                  uint64_t result = *(_DWORD *)(v5 + 24) + v66;
                  *(_DWORD *)(v5 + 24) = result;
                }
                while (v57 < v45);
                unsigned int v46 = *(_DWORD *)(v5 + 28);
                int64_t v49 = v184;
              }
              int v51 = result - v57;
              *(_DWORD *)(v5 + 24) = result - v57;
              int v81 = *v178;
              v46 += v81;
              *(_DWORD *)(v5 + 28) = v46;
              v199 += v81;
            }
            while (v199 < v171);
          }
          int v7 = v46 - v199;
          *(_DWORD *)(v5 + 28) = v7;
          LOBYTE(v17) = v208;
          int v27 = v206;
          if (v163)
          {
            unint64_t v82 = *(void *)(v6 + 2152);
            unint64_t v210 = v82;
            if (v4[9] == 13)
            {
              int v83 = *(_DWORD *)(v5 + 24);
              uint64_t v84 = *(void *)(v6 + 2120) + 8 * (v83 & v192) + 2 * (*(void *)(v6 + 2144) >> 1) * 4 * (v7 & v215);
              unint64_t v85 = (v82 >> 1) * (v7 >> v208) + (v83 >> v15);
              uint64_t v86 = *(void *)(v6 + 2128) + 8 * v85;
              uint64_t v87 = *(void *)(v6 + 2136) + 8 * v85;
              v226[0] = v86;
              v226[1] = v87;
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v168
                                                                   + 8 * (*(_DWORD *)(v6 + 2168) - 1)
                                                                   + 176))(v167, v84);
              uint64_t v88 = 0;
              char v89 = 1;
              do
              {
                char v90 = v89;
                if (v213[v88])
                {
                  int v224 = 0;
                  int v91 = *(_DWORD *)(v5 + 28);
                  char v219 = v89;
                  if (((*(_DWORD *)(v6 + 3472) - 1) & v215 & v91) != 0) {
                    uint64_t v92 = 0;
                  }
                  else {
                    uint64_t v92 = *(void *)(v6 + 8 * v88 + 3416)
                  }
                        + 2 * ((*(_DWORD *)(v6 + 3456) * ((v91 >> *(_DWORD *)(v6 + 3468)) - 1)) << 7);
                  uint64_t v93 = (_WORD *)v226[v88];
                  int v94 = *v222;
                  int v95 = *v217;
                  unsigned int v96 = *(uint64_t (**)(_WORD *, unint64_t, _WORD *, void, void, uint64_t, void, void))(v168 + 8 * sub_224AE4C0C(*(int *)(v5 + 24) >> v15, *(int *)(v5 + 24) >> v15 > (int)v216[3466] >> v15, v91 >> v208, v91 >> v208 > (int)v216[3468] >> v208, (int)v216[3467] >> v15, (int)v216[3469] >> v208, 0, v93, v210, v92, 0, &v224, v94, v95, 0, v198, *(_DWORD *)(v6 + 4324)) + 200);
                  int v97 = v93;
                  unint64_t v82 = v210;
                  uint64_t result = v96(v97, v210, v198, (4 * v94), (4 * v95), v167, (char)v213[v88], *(unsigned int *)(v6 + 4324));
                  int v27 = v206;
                  uint64_t v4 = v195;
                  char v90 = v219;
                }
                char v89 = 0;
                uint64_t v88 = 1;
              }
              while ((v90 & 1) != 0);
            }
            else if (v4[12])
            {
              int v98 = *(_DWORD *)(v5 + 24);
              uint64_t v99 = v159;
              uint64_t v100 = v148;
              if (*v206)
              {
                int v101 = &v216[6 * (*v206 & 1)];
                uint64_t v100 = *((void *)v101 + 1737);
                uint64_t v99 = *(void *)(v6 + 4376)
                    + 48
                    * ((*(uint64_t *)(v6 + 3432) >> 1) * ((*(_DWORD *)(v5 + 24) & 1) + (v7 >> 1))
                     + (v7 & 1)
                     + (*(int *)(v5 + 24) >> 1));
                *((void *)v101 + 1737) = v100 + v147;
              }
              uint64_t v220 = v99;
              unint64_t v102 = 4 * ((v82 >> 1) * (v7 >> v208) + (v98 >> v15));
              (*(void (**)(unint64_t, unint64_t, uint64_t, uint64_t, void, void))(*(void *)(v6 + 3280) + 248))(*(void *)(v6 + 2128) + 8 * ((v82 >> 1) * (v7 >> v208) + (v98 >> v15)), v82, v99 + 16, v100, v151, v150);
              unsigned int v15 = v201;
              uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t, uint64_t, void, void))(*(void *)(v6 + 3280) + 248))(*(void *)(v6 + 2136) + 2 * v102, *(void *)(v6 + 2152), v220 + 32, v100, v151, v150);
            }
            int v103 = *(unsigned __int8 *)(*(void *)(v5 + 656) + v207 + 560);
            int v104 = *v154;
            if ((v104 & 0xFFFFFFFD) == 9 || v104 == 10 || (v103 & 0xFFFFFFFD) == 9 || v103 == 10) {
              int v108 = 512;
            }
            else {
              int v108 = 0;
            }
            int v194 = v108;
            signed int v109 = v166 >> v15;
            unsigned int v175 = (int)(v166 >> v15) < v161;
            if (v170)
            {
              int64_t v110 = v180;
            }
            else
            {
              int64_t v110 = v180;
              if (v109 >= v161) {
                unsigned int v175 = (4u >> (*(_DWORD *)(v6 + 2168) - 1)) & a3;
              }
            }
            unsigned int v185 = v110 == 0;
            if (!v110 && v152 >= v153) {
              unsigned int v185 = (0x20u >> (*(_DWORD *)(v6 + 2168) - 1)) & a3;
            }
            uint64_t v187 = 0;
            if (v161 >= v109) {
              signed int v111 = v166 >> v15;
            }
            else {
              signed int v111 = v161;
            }
            uint64_t v174 = (uint64_t)v82 >> 1;
            signed int v112 = v110 >> v15;
            int v7 = *(_DWORD *)(v5 + 28);
            unsigned int v205 = v110 >> v15;
            do
            {
              int v113 = v7 + v170;
              *(_DWORD *)(v5 + 28) = v7 + v170;
              uint64_t v221 = v187;
              uint64_t v114 = ++v187;
              if ((int)v176 >= v183)
              {
                int v190 = v176;
              }
              else
              {
                uint64_t v115 = v6 + 8 * v114;
                double v177 = (uint64_t *)(v115 + 2120);
                unsigned int v182 = (void *)(v115 + 3408);
                int v116 = *(_DWORD *)(v5 + 24);
                int v190 = v176;
                do
                {
                  uint64_t v117 = *v177;
                  int v118 = v116 + v110;
                  *(_DWORD *)(v5 + 24) = v118;
                  if (v112 < v111)
                  {
                    unsigned int v119 = (_WORD *)(v117 + 8 * (v174 * (v113 >> v17) + (v118 >> v15)));
                    BOOL v121 = v190 <= v176 && v175 != 0;
                    BOOL v200 = v121;
                    uint64_t v122 = v190 + v173;
                    uint64_t v123 = v5 + 32 * v221 + 96;
                    unsigned int v212 = (uint64x2_t *)(v123 + v122);
                    uint16x8_t v179 = (uint64_t *)(v123 + (v122 + 8));
                    do
                    {
                      unsigned int v124 = v4[9];
                      if ((v124 != 13 || !v213[v221]) && !v4[12])
                      {
                        unsigned int v223 = (char)v4[14];
                        BOOL v125 = !v200 && v112 + *v222 >= v111;
                        if (v112 <= v205 && (v185 || v190 + *v217 < v183)) {
                          char v126 = 8;
                        }
                        else {
                          char v126 = 0;
                        }
                        int v127 = *(_DWORD *)(v214 + 28);
                        if (((*(_DWORD *)(v6 + 3472) - 1) & v215 & v127) != 0) {
                          uint64_t v128 = 0;
                        }
                        else {
                          uint64_t v128 = *v182 + 2 * ((*(_DWORD *)(v6 + 3456) * ((v127 >> *(_DWORD *)(v6 + 3468)) - 1)) << 7);
                        }
                        if (v124 == 13) {
                          unsigned int v124 = 0;
                        }
                        int v129 = *v222;
                        int v130 = *v217;
                        unsigned int v131 = sub_224AE4C0C(v118 >> v15, v118 >> v15 > (int)v216[3466] >> v15, v127 >> v208, v127 >> v208 > (int)v216[3468] >> v208, (int)v216[3467] >> v15, (int)v216[3469] >> v208, v126 | !v125, v119, v210, v128, v124, (int *)&v223, v129, v130, *(unsigned __int8 *)(*(void *)(v6 + 8) + 394), v198, *(_DWORD *)(v6 + 4324));
                        v223 |= v197;
                        uint64_t result = (*(uint64_t (**)(_WORD *, unint64_t, _WORD *, void, void, void, void, void, _DWORD))(v196 + 8 * v131))(v119, v210, v198, (4 * v129), (4 * v130), v223 | v194, ((int)((v15 | (4 * *(_DWORD *)(v6 + 3448)))- 4 * (*(_DWORD *)(v214 + 24) & v192)) >> v15), ((int)((v208 | (4 * *(_DWORD *)(v6 + 3452)))- 4 * (*(_DWORD *)(v214 + 28) & v215)) >> v208), *(_DWORD *)(v6 + 4324));
                        int v27 = v206;
                        uint64_t v4 = v195;
                        uint64_t v5 = v214;
                      }
                      if (v4[6])
                      {
                        if (*v27)
                        {
                          int v132 = *v222;
                        }
                        else
                        {
                          switch(*v217)
                          {
                            case 1:
                              v212->i8[0] = 64;
                              break;
                            case 2:
                              v212->i16[0] = 16448;
                              break;
                            case 3:
                            case 5:
                            case 6:
                            case 7:
                              break;
                            case 4:
                              v212->i32[0] = 1077952576;
                              break;
                            case 8:
                              uint16x8_t v141 = (uint64_t *)v212;
                              goto LABEL_219;
                            default:
                              if (*v217 == 16)
                              {
                                v212->i64[0] = 0x4040404040404040;
                                uint16x8_t v141 = v179;
LABEL_219:
                                *uint16x8_t v141 = 0x4040404040404040;
                              }
                              break;
                          }
                          int v132 = *v222;
                          switch(*v222)
                          {
                            case 1u:
                              *(unsigned char *)(*(void *)(v5 + 656) + 32 * v221 + (v112 + v207) + 64) = 64;
                              int v132 = 1;
                              break;
                            case 2u:
                              *(_WORD *)(*(void *)(v5 + 656) + 32 * v221 + (v112 + v207) + 64) = 16448;
                              int v132 = 2;
                              break;
                            case 3u:
                            case 5u:
                            case 6u:
                            case 7u:
                              break;
                            case 4u:
                              *(_DWORD *)(*(void *)(v5 + 656) + 32 * v221 + (v112 + v207) + 64) = 1077952576;
                              int v132 = 4;
                              break;
                            case 8u:
                              *(void *)(*(void *)(v5 + 656) + 32 * v221 + (v112 + v207) + 64) = 0x4040404040404040;
                              int v132 = 8;
                              break;
                            default:
                              if (v132 == 16)
                              {
                                uint64_t v142 = (v112 + v207);
                                *(void *)(*(void *)(v5 + 656) + 32 * v221 + v142 + 64) = 0x4040404040404040;
                                *(void *)(*(void *)(v5 + 656) + 32 * v221 + (v142 + 8) + 64) = 0x4040404040404040;
                              }
                              break;
                          }
                        }
                      }
                      else
                      {
                        LODWORD(v226[0]) = 0;
                        if (!*v27)
                        {
                          LOBYTE(v224) = 0;
                          uint64_t v138 = (v112 + v207);
                          uint64_t result = sub_224AEF500(v5, (uint64x2_t *)(*(void *)(v5 + 656) + 32 * v221 + v138 + 64), v212, v4[7], a2, (uint64_t)v4, 1, v187, v202, (unsigned int *)v226, &v224);
                          uint64_t v137 = result;
                          int v139 = *v217;
                          if (v139 >= (int)(*(_DWORD *)(v6 + 3452) + v208 - *(_DWORD *)(v5 + 28)) >> v208) {
                            int v139 = (int)(*(_DWORD *)(v6 + 3452) + v208 - *(_DWORD *)(v5 + 28)) >> v208;
                          }
                          switch(v139)
                          {
                            case 1:
                              LODWORD(v140) = v224;
                              v212->i8[0] = v224;
                              goto LABEL_234;
                            case 2:
                              LODWORD(v140) = v224;
                              v212->i16[0] = v224 | (v224 << 8);
                              goto LABEL_234;
                            case 3:
                            case 5:
                            case 6:
                            case 7:
                              goto LABEL_230;
                            case 4:
                              LODWORD(v140) = v224;
                              v212->i32[0] = 16843009 * v224;
                              goto LABEL_234;
                            case 8:
                              LODWORD(v140) = v224;
                              v212->i64[0] = 0x101010101010101 * v224;
                              goto LABEL_234;
                            default:
                              if (v139 == 16)
                              {
                                uint64_t v140 = v224;
                                v212->i64[0] = 0x101010101010101 * v224;
                                *uint16x8_t v179 = 0x101010101010101 * v140;
                              }
                              else
                              {
LABEL_230:
                                LODWORD(v140) = v224;
                                uint64_t result = (uint64_t)memset(v212, v224, v139);
                              }
LABEL_234:
                              int v132 = *v222;
                              int v143 = (int)(*(_DWORD *)(v203 + 3448) + v201 - *(_DWORD *)(v5 + 24)) >> v201;
                              if (v132 < v143) {
                                int v143 = *v222;
                              }
                              switch(v143)
                              {
                                case 1:
                                  *(unsigned char *)(*(void *)(v5 + 656) + 32 * v221 + v138 + 64) = v140;
                                  goto LABEL_245;
                                case 2:
                                  *(_WORD *)(*(void *)(v5 + 656) + 32 * v221 + v138 + 64) = v140 | ((_WORD)v140 << 8);
                                  goto LABEL_245;
                                case 3:
                                case 5:
                                case 6:
                                case 7:
                                  goto LABEL_240;
                                case 4:
                                  *(_DWORD *)(*(void *)(v5 + 656) + 32 * v221 + v138 + 64) = 16843009 * v140;
                                  goto LABEL_245;
                                case 8:
                                  uint64_t v144 = 0x101010101010101 * v140;
                                  uint64_t v145 = *(void *)(v5 + 656) + 32 * v221 + v138;
                                  goto LABEL_243;
                                default:
                                  if (v143 == 16)
                                  {
                                    uint64_t v144 = 0x101010101010101 * v140;
                                    *(void *)(*(void *)(v5 + 656) + 32 * v221 + v138 + 64) = v144;
                                    uint64_t v145 = *(void *)(v5 + 656) + 32 * v221 + (v138 + 8);
LABEL_243:
                                    *(void *)(v145 + 64) = v144;
                                  }
                                  else
                                  {
LABEL_240:
                                    uint64_t result = (uint64_t)memset((void *)(*(void *)(v5 + 656) + 32 * v221 + v138 + 64), v140, v143);
                                  }
LABEL_245:
                                  int v136 = v202;
                                  uint64_t v6 = v203;
                                  unsigned int v15 = v201;
                                  if ((v137 & 0x80000000) == 0) {
                                    goto LABEL_246;
                                  }
                                  goto LABEL_247;
                              }
                          }
                        }
                        char v133 = &v216[6 * (*v27 & 1)];
                        int v134 = (__int16 *)*((void *)v133 + 1738);
                        int v135 = *v134;
                        *((void *)v133 + 1738) = v134 + 1;
                        int v136 = (unsigned int *)*((void *)v133 + 1739);
                        int v132 = *v222;
                        *((void *)v133 + 1739) = &v136[16 * *v217 * (unint64_t)*v222];
                        uint64_t v137 = (v135 >> 5);
                        LODWORD(v226[0]) = v135 & 0x1F;
                        if ((v137 & 0x80000000) == 0) {
LABEL_246:
                        }
                          uint64_t result = (*(uint64_t (**)(_WORD *, unint64_t, unsigned int *, uint64_t, void))(v191 + 136 * v4[7] + 8 * LODWORD(v226[0])))(v119, v210, v136, v137, *(unsigned int *)(v6 + 4324));
                      }
LABEL_247:
                      v119 += (4 * v132);
                      v112 += v132;
                      int v118 = (v132 << v15) + *(_DWORD *)(v5 + 24);
                      *(_DWORD *)(v5 + 24) = v118;
                    }
                    while (v112 < v111);
                    int v113 = *(_DWORD *)(v5 + 28);
                    LOBYTE(v17) = v208;
                    LODWORD(v110) = v180;
                  }
                  int v116 = v118 - (v112 << v15);
                  *(_DWORD *)(v5 + 24) = v116;
                  int v146 = *v217;
                  v113 += v146 << v17;
                  *(_DWORD *)(v5 + 28) = v113;
                  v190 += v146;
                  signed int v112 = v205;
                }
                while (v190 < v183);
              }
              int v7 = v113 - (v190 << v17);
              *(_DWORD *)(v5 + 28) = v7;
            }
            while (!v221);
          }
          int64_t v31 = v166;
          int v14 = v162;
          uint64_t v22 = v172;
          unsigned int v28 = v165;
        }
        while (v166 < v164);
      }
      unsigned int v21 = v28;
    }
    while ((int)v28 < v14);
  }
  return result;
}

uint64_t sub_224AF2504(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v251 = (_DWORD *)(a1 + 258496);
  uint64_t v5 = *(void *)(a1 + 8);
  int v6 = *(_DWORD *)(a1 + 24);
  int v7 = *(_DWORD *)(a1 + 28);
  uint64_t v8 = v6;
  int v9 = v7;
  unint64_t v224 = v7 & 0x1F;
  unint64_t v225 = v6 & 0x1F;
  int v10 = *(_DWORD *)(v5 + 2168);
  unsigned int v242 = v10 == 1;
  int v11 = &byte_224B28CC0[4 * a2];
  uint64_t v12 = *v11;
  unsigned int v252 = v11;
  int v13 = v11[1];
  int v14 = *(_DWORD *)(v5 + 3448) - v6;
  if ((int)v12 < v14) {
    int v14 = *v11;
  }
  unsigned int v207 = v14;
  int v15 = *(_DWORD *)(v5 + 3452) - v7;
  if (v13 < v15) {
    int v15 = v11[1];
  }
  int v204 = v15;
  int v255 = v10 != 3;
  if (!v10 || (v12 <= (v10 != 3) ? (BOOL v16 = (v8 & 1) == 0) : (BOOL v16 = 0), v16))
  {
    int v17 = 0;
  }
  else if (v13 <= v242)
  {
    int v17 = v7 & 1;
  }
  else
  {
    int v17 = 1;
  }
  uint64_t v243 = *(void *)(v5 + 3280);
  int v245 = *(_DWORD **)(a1 + 16);
  unint64_t v236 = v225 >> v255;
  unint64_t v223 = v224 >> v242;
  if (v10) {
    int v18 = 3 - v10;
  }
  else {
    int v18 = 0;
  }
  signed int v238 = (v13 + v242) >> v242;
  signed int v240 = (v12 + v255) >> v255;
  unint64_t v19 = *(void *)(v5 + 2144);
  int v20 = (_WORD *)(*(void *)(v5 + 2120) + 8 * (v8 + (v19 >> 1) * v7));
  uint64_t v218 = 4 * ((*(void *)(v5 + 2152) >> 1) * (v7 >> v242) + ((int)v8 >> v255));
  uint64_t v21 = *(void *)(v5 + 24);
  int v212 = v17;
  uint64_t v214 = *v11;
  uint64_t v256 = *(void *)(a1 + 8);
  unint64_t v209 = v11[1];
  int v228 = *(_DWORD *)(v5 + 2168);
  if ((*(unsigned char *)(v21 + 232) & 1) == 0)
  {
    uint64_t v22 = v5 + 2376;
    sub_224AF42A8(a1, (uint64_t)v20, 0, v19, v12, v13, v8, v9, 0, v202, *(_DWORD *)(a3 + 8), v5 + 2376, 0, 9u);
    uint64_t v5 = v256;
    if (v17)
    {
      uint64_t v23 = 0;
      do
      {
        uint64_t v24 = *(void *)(v256 + 2128 + 8 * v23++) + 2 * v218;
        sub_224AF42A8(a1, v24, 0, *(void *)(v5 + 2152), v214 << (v214 == v255), v209 << (v209 == v242), *(_DWORD *)(a1 + 24) & ~v255, *(_DWORD *)(a1 + 28) & ~v242, v23, v203, *(_DWORD *)(a3 + 8), v22, 0, 9u);
        uint64_t v5 = v256;
      }
      while (v23 != 2);
    }
    goto LABEL_149;
  }
  if (*(unsigned char *)(a3 + 20))
  {
    uint64_t v25 = 0;
    uint64_t v26 = a3 + 8;
    unsigned int v27 = *(unsigned __int8 *)(a3 + 27);
    uint64_t v28 = a1 + 8256;
    uint64_t v29 = 4 * v12;
    char v30 = 1;
    do
    {
      char v31 = v30;
      uint64_t v32 = *(char *)(a3 + v25 + 24);
      if (*(unsigned char *)(a3 + 21) == 6 && *(unsigned char *)(v5 + v32 + 3056)) {
        sub_224AF47F0(a1, 0, v28 + (v25 << 15), v29, v252, 0, v5 + 296 * *(char *)(a3 + v25 + 24) + 32, *(void *)(v5 + 24) + 36 * *(char *)(a3 + v25 + 24) + 896);
      }
      else {
        sub_224AF42A8(a1, 0, v28 + (v25 << 15), 0, v214, v209, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), 0, v202, *(_DWORD *)(v26 + 4 * v25), v5 + 296 * v32 + 32, *(char *)(a3 + v25 + 24), v27);
      }
      char v30 = 0;
      uint64_t v25 = 1;
      uint64_t v5 = v256;
    }
    while ((v31 & 1) != 0);
    switch(*(unsigned char *)(a3 + 20))
    {
      case 1:
        unsigned int v230 = *(unsigned __int8 *)(v256 - *(char *)(a3 + 24) + 8 * *(char *)(a3 + 24) + *(char *)(a3 + 25) + 4272);
        (*(void (**)(_WORD *, void, uint64_t, uint64_t, uint64_t, void))(v243 + 584))(v20, *(void *)(v256 + 2144), v28, a1 + 41024, v29, (4 * v209));
        uint64_t v5 = v256;
        goto LABEL_52;
      case 2:
        (*(void (**)(_WORD *, void, uint64_t, uint64_t, uint64_t, void, void))(v243 + 576))(v20, *(void *)(v256 + 2144), v28, a1 + 41024, v29, (4 * v209), *(unsigned int *)(v256 + 4324));
        uint64_t v5 = v256;
        goto LABEL_51;
      case 3:
        int v235 = (char *)(a1 + 73792);
        (*(void (**)(_WORD *, void, unint64_t, unint64_t, uint64_t, void))(v243 + 8 * v18 + 600))(v20, *(void *)(v256 + 2144), v28 + ((unint64_t)*(unsigned __int8 *)(a3 + 17) << 15), v28 + ((unint64_t)(*(unsigned char *)(a3 + 17) == 0) << 15), v29, (4 * v209));
        uint64_t v5 = v256;
        unsigned int v230 = 0;
        if (v17) {
          goto LABEL_55;
        }
        goto LABEL_149;
      case 4:
        unsigned int v43 = 4 * v209;
        (*(void (**)(_WORD *, void, unint64_t, unint64_t, uint64_t, void, char *, void))(v243 + 592))(v20, *(void *)(v256 + 2144), v28 + ((unint64_t)*(unsigned __int8 *)(a3 + 17) << 15), v28 + ((unint64_t)(*(unsigned char *)(a3 + 17) == 0) << 15), v29, (4 * v209), (char *)&unk_26AAAB780+ 8 * *((unsigned __int16 *)&unk_26AAAB780 + 36 * a2 + *(unsigned __int8 *)(a3 + 16) - 252), *(unsigned int *)(v256 + 4324));
        uint64_t v5 = v256;
        if (!v17) {
          goto LABEL_149;
        }
        unsigned int v230 = 0;
        int v235 = (char *)&unk_26AAAB780
             + 8
             * *((unsigned __int16 *)&unk_26AAAB780
               + 396 * v18
               + 36 * a2
               + 16 * *(unsigned __int8 *)(a3 + 17)
               + *(unsigned __int8 *)(a3 + 16)
               - 252);
        goto LABEL_56;
      default:
LABEL_51:
        unsigned int v230 = 0;
LABEL_52:
        int v235 = 0;
        if (!v17) {
          goto LABEL_149;
        }
LABEL_55:
        unsigned int v43 = 4 * v209;
LABEL_56:
        if (v240 >= v238) {
          unsigned int v44 = v238;
        }
        else {
          unsigned int v44 = v240;
        }
        uint64_t v45 = v29 >> v255;
        unsigned int v246 = v43 >> v242;
        uint64_t v232 = a1 + 41024;
        char v46 = 1;
        uint64_t v47 = 1;
        break;
    }
    while (1)
    {
      uint64_t v48 = 0;
      char v249 = v46;
      char v49 = 1;
      do
      {
        char v50 = v49;
        uint64_t v51 = *(char *)(a3 + v48 + 24);
        BOOL v52 = *(unsigned char *)(a3 + 21) == 6 && v44 >= 2;
        if (v52 && *(unsigned char *)(v5 + v51 + 3056)) {
          sub_224AF47F0(a1, 0, v28 + (v48 << 15), v45, v252, v47, v5 + 296 * *(char *)(a3 + v48 + 24) + 32, *(void *)(v5 + 24) + 36 * *(char *)(a3 + v48 + 24) + 896);
        }
        else {
          sub_224AF42A8(a1, 0, v28 + (v48 << 15), 0, v214, v209, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), v47, v202, *(_DWORD *)(v26 + 4 * v48), v5 + 296 * v51 + 32, *(char *)(a3 + v48 + 24), v27);
        }
        char v49 = 0;
        uint64_t v48 = 1;
        uint64_t v5 = v256;
      }
      while ((v50 & 1) != 0);
      uint64_t v53 = *(void *)(v256 + 8 * v47 + 2120) + 2 * v218;
      int v54 = *(unsigned __int8 *)(a3 + 20);
      if ((v54 - 3) < 2)
      {
        (*(void (**)(uint64_t, void, unint64_t, unint64_t, uint64_t, void, char *, void))(v243 + 592))(v53, *(void *)(v256 + 2152), v28 + ((unint64_t)*(unsigned __int8 *)(a3 + 17) << 15), v28 + ((unint64_t)(*(unsigned char *)(a3 + 17) == 0) << 15), v45, v246, v235, *(unsigned int *)(v256 + 4324));
      }
      else
      {
        if (v54 != 1)
        {
          char v55 = v249;
          if (v54 == 2)
          {
            (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, void, void))(v243 + 576))(v53, *(void *)(v256 + 2152), v28, v232, v45, v246, *(unsigned int *)(v256 + 4324));
            uint64_t v5 = v256;
          }
          goto LABEL_77;
        }
        (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, void, void, void))(v243 + 584))(v53, *(void *)(v256 + 2152), v28, v232, v45, v246, v230, *(unsigned int *)(v256 + 4324));
      }
      uint64_t v5 = v256;
      char v55 = v249;
LABEL_77:
      char v46 = 0;
      uint64_t v47 = 2;
      if ((v55 & 1) == 0) {
        goto LABEL_149;
      }
    }
  }
  int v234 = v18;
  uint64_t v33 = *(char *)(a3 + 24);
  uint64_t v34 = v5 + 296 * v33 + 32;
  unsigned int v248 = *(unsigned __int8 *)(a3 + 27);
  if ((int)v12 >= v13) {
    unsigned int v35 = v11[1];
  }
  else {
    unsigned int v35 = *v11;
  }
  if (v35 < 2) {
    goto LABEL_43;
  }
  if (*(unsigned char *)(a3 + 21) != 2 || !*(unsigned char *)(v5 + v33 + 3056))
  {
    if (*(unsigned char *)(a3 + 22) == 2 && *v251 > 1u) {
      goto LABEL_41;
    }
LABEL_43:
    sub_224AF42A8(a1, (uint64_t)v20, 0, v19, v12, v13, v8, v9, 0, v202, *(_DWORD *)(a3 + 8), v34, v33, v248);
    if (*(unsigned char *)(a3 + 22) == 1) {
      sub_224AF4B44(v4, (uint64_t)v20, *(void *)(v256 + 2144), v252, 0, v225, v224, v207, v204);
    }
    goto LABEL_45;
  }
  if (*(unsigned char *)(a3 + 22) == 2)
  {
LABEL_41:
    uint64_t v36 = a1 + 258496;
    goto LABEL_42;
  }
  uint64_t v36 = v21 + 36 * (int)v33 + 896;
LABEL_42:
  sub_224AF47F0(a1, (uint64_t)v20, 0, v19, v252, 0, v34, v36);
LABEL_45:
  uint64_t v5 = v256;
  if (*(unsigned char *)(a3 + 28))
  {
    uint64_t v37 = v4 + 17536;
    uint64_t v38 = v4;
    int v39 = (_WORD *)(v4 + 25792);
    unsigned int v40 = *(unsigned __int8 *)(a3 + 18);
    if (v40 == 3) {
      unsigned int v40 = 9;
    }
    v259[0] = 0;
    int v41 = *(_DWORD *)(v38 + 28);
    if (((*(_DWORD *)(v256 + 3472) - 1) & v41) != 0) {
      uint64_t v42 = 0;
    }
    else {
      uint64_t v42 = *(void *)(v256 + 3408) + 2 * ((*(_DWORD *)(v256 + 3456) * ((v41 >> *(_DWORD *)(v256 + 3468)) - 1)) << 7);
    }
    unsigned int v56 = sub_224AE4C0C(*(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 24) > v245[3466], v41, v41 > v245[3468], v245[3467], v245[3469], 0, v20, *(void *)(v256 + 2144), v42, v40, v259, v214, v209, 0, v39, *(_DWORD *)(v256 + 4324));
    (*(void (**)(uint64_t, uint64_t, _WORD *, void, void, void, void, void, _DWORD))(v243 + 8 * v56 + 64))(v37, 8 * v214, v39, (4 * v214), (4 * v209), 0, 0, 0, *(_DWORD *)(v256 + 4324));
    unsigned int v57 = a2 - 7;
    if (*(unsigned char *)(a3 + 28) == 1) {
      unint64_t v58 = (char *)&unk_26AAAB780 + 72 * v57 + 2 * *(unsigned __int8 *)(a3 + 18) + 64;
    }
    else {
      unint64_t v58 = (char *)&unk_26AAAB780 + 72 * v57 + 2 * *(unsigned __int8 *)(a3 + 16);
    }
    uint64_t v4 = a1;
    (*(void (**)(_WORD *, void, uint64_t, void, void, char *))(v243 + 624))(v20, *(void *)(v256 + 2144), v37, (4 * v214), (4 * v209), (char *)&unk_26AAAB780 + 8 * *(unsigned __int16 *)v58);
    uint64_t v5 = v256;
  }
  if (v17)
  {
    if (v214 != v255 && v209 != v242) {
      goto LABEL_121;
    }
    BOOL v59 = (void *)(v4 + 8 * (*(_DWORD *)(v4 + 28) & 0x1F) + 712);
    BOOL v60 = v214 != 1 || *(char *)(*v59 + 12 * *(int *)(v4 + 24) - 4) > 0;
    if (v209 == v242)
    {
      uint64_t v61 = *(void *)(v4 + 8 * (*(_DWORD *)(v4 + 28) & 0x1F) + 704);
      int v62 = *(_DWORD *)(v4 + 24);
      if (*(char *)(v61 + 12 * v62 + 8) <= 0) {
        BOOL v60 = 0;
      }
      if (v214 == 1 && *(char *)(v61 + 12 * v62 - 4) <= 0) {
        BOOL v60 = 0;
      }
    }
    if (v60)
    {
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      if (v214 == 1 && v209 == v242)
      {
        char v65 = 1;
        uint64_t v66 = 1;
        uint64_t v67 = a1;
        do
        {
          char v68 = v65;
          uint64_t v69 = *(int *)(v67 + 24);
          uint64_t v70 = *(int *)(v67 + 28) - 1;
          if (v251[17] == 2) {
            unsigned int v71 = *(unsigned __int8 *)(*(void *)(v5 + 4360) + 32 * (v69 + *(void *)(v5 + 3432) * v70) - 5);
          }
          else {
            unsigned int v71 = v251[16];
          }
          int v72 = v69 - 1;
          uint64_t v73 = *(v59 - 1) + 12 * (v69 - 1);
          uint64_t v67 = a1;
          sub_224AF42A8(a1, *(void *)(v5 + 8 * v66 + 2120) + 2 * v218, 0, *(void *)(v5 + 2152), 1, v242, v72, v70, v66, v202, *(_DWORD *)v73, v5 + 296 * (*(char *)(v73 + 8) - 1) + 32, *(char *)(v73 + 8) - 1, v71);
          uint64_t v5 = v256;
          char v65 = 0;
          uint64_t v66 = 2;
        }
        while ((v68 & 1) != 0);
        uint64_t v64 = *(void *)(v256 + 2152);
        uint64_t v63 = 2;
      }
      if (v214 == 1)
      {
        unsigned int v74 = byte_224B19468[4 * *(unsigned __int8 *)(a1 + v224 + 416) + *(unsigned __int8 *)(a1 + v224 + 384)];
        char v75 = 1;
        uint64_t v63 = 2;
        uint64_t v76 = 1;
        do
        {
          char v77 = v75;
          uint64_t v79 = *(int *)(a1 + 24);
          uint64_t v78 = *(int *)(a1 + 28);
          unsigned int v80 = v74;
          if (v251[17] == 2) {
            unsigned int v80 = *(unsigned __int8 *)(*(void *)(v5 + 4360) + 32 * (v79 + *(void *)(v5 + 3432) * v78) - 5);
          }
          sub_224AF42A8(a1, *(void *)(v5 + 8 * v76 + 2120) + 2 * v218 + 2 * v64, 0, *(void *)(v5 + 2152), 1, v209, v79 - 1, v78, v76, v202, *(_DWORD *)(*v59 + 12 * (v79 - 1)), v5 + 296 * (*(char *)(*v59 + 12 * (v79 - 1) + 8) - 1) + 32, *(char *)(*v59 + 12 * (v79 - 1) + 8) - 1, v80);
          uint64_t v5 = v256;
          char v75 = 0;
          uint64_t v76 = 2;
        }
        while ((v77 & 1) != 0);
      }
      if (v209 == v242)
      {
        unsigned int v81 = byte_224B19468[4 * *(unsigned __int8 *)(*(void *)(a1 + 656) + v225 + 384)
                           + *(unsigned __int8 *)(*(void *)(a1 + 656) + v225 + 352)];
        char v82 = 1;
        uint64_t v83 = 1;
        do
        {
          char v84 = v82;
          uint64_t v85 = *(int *)(a1 + 24);
          uint64_t v86 = *(int *)(a1 + 28) - 1;
          unsigned int v87 = v81;
          if (v251[17] == 2) {
            unsigned int v87 = *(unsigned __int8 *)(*(void *)(v5 + 4360) + 32 * (v85 + *(void *)(v5 + 3432) * v86) + 27);
          }
          uint64_t v88 = *(v59 - 1) + 12 * (int)v85;
          sub_224AF42A8(a1, *(void *)(v5 + 8 * v83 + 2120) + 2 * v218 + 2 * v63, 0, *(void *)(v5 + 2152), v214, v242, v85, v86, v83, v202, *(_DWORD *)v88, v5 + 296 * (*(char *)(v88 + 8) - 1) + 32, *(char *)(v88 + 8) - 1, v87);
          uint64_t v5 = v256;
          char v82 = 0;
          uint64_t v83 = 2;
        }
        while ((v84 & 1) != 0);
        uint64_t v64 = *(void *)(v256 + 2152);
      }
      char v89 = 1;
      uint64_t v90 = 1;
      do
      {
        char v91 = v89;
        sub_224AF42A8(a1, *(void *)(v5 + 8 * v90 + 2120) + 2 * v218 + 2 * v63 + 2 * v64, 0, *(void *)(v5 + 2152), v214, v209, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), v90, v202, *(_DWORD *)(a3 + 8), v34, *(char *)(a3 + 24), v248);
        uint64_t v5 = v256;
        char v89 = 0;
        uint64_t v90 = 2;
      }
      while ((v91 & 1) != 0);
    }
    else
    {
LABEL_121:
      uint64_t v92 = v34;
      unsigned int v93 = v240;
      if (v240 >= v238) {
        unsigned int v93 = v238;
      }
      if (v93 >= 2
        && (*(unsigned char *)(a3 + 21) == 2 && *(unsigned char *)(v5 + *(char *)(a3 + 24) + 3056)
         || *(unsigned char *)(a3 + 22) == 2 && *v251 >= 2u))
      {
        uint64_t v94 = v4 + 258496;
        char v95 = 1;
        uint64_t v96 = 1;
        do
        {
          char v97 = v95;
          uint64_t v98 = v94;
          if (*(unsigned char *)(a3 + 22) != 2) {
            uint64_t v98 = *(void *)(v5 + 24) + 36 * *(char *)(a3 + 24) + 896;
          }
          sub_224AF47F0(a1, *(void *)(v5 + 8 * v96 + 2120) + 2 * v218, 0, *(void *)(v5 + 2152), v252, v96, v34, v98);
          uint64_t v5 = v256;
          char v95 = 0;
          uint64_t v96 = 2;
        }
        while ((v97 & 1) != 0);
      }
      else
      {
        char v99 = 1;
        uint64_t v100 = 1;
        do
        {
          char v101 = v99;
          uint64_t v102 = v5 + 8 * v100;
          sub_224AF42A8(a1, *(void *)(v102 + 2120) + 2 * v218, 0, *(void *)(v5 + 2152), v214 << (v214 == v255), v209 << (v209 == v242), *(_DWORD *)(a1 + 24) & ~v255, *(_DWORD *)(a1 + 28) & ~v242, v100, v202, *(_DWORD *)(a3 + 8), v92, *(char *)(a3 + 24), v248);
          if (*(unsigned char *)(a3 + 22) == 1) {
            sub_224AF4B44(a1, *(void *)(v102 + 2120) + 2 * v218, *(void *)(v256 + 2152), v252, v100, v225, v224, v207, v204);
          }
          char v99 = 0;
          uint64_t v100 = 2;
          uint64_t v5 = v256;
        }
        while ((v101 & 1) != 0);
      }
      if (*(unsigned char *)(a3 + 28))
      {
        if (*(unsigned char *)(a3 + 28) == 1) {
          int v103 = (char *)&unk_26AAAB780 + 792 * v234 + 72 * a2 + 2 * *(unsigned __int8 *)(a3 + 18) - 440;
        }
        else {
          int v103 = (char *)&unk_26AAAB780 + 792 * v234 + 72 * a2 + 2 * *(unsigned __int8 *)(a3 + 16) - 504;
        }
        uint64_t v104 = a1;
        unsigned int v253 = (char *)&unk_26AAAB780 + 8 * *(unsigned __int16 *)v103;
        uint64_t v105 = (_WORD *)(a1 + 25792);
        uint64_t v106 = (4 * v240);
        uint64_t v107 = (4 * v238);
        char v108 = 1;
        uint64_t v109 = 1;
        uint64_t v110 = a1 + 17536;
        do
        {
          char v111 = v108;
          unsigned int v112 = *(unsigned __int8 *)(a3 + 18);
          if (v112 == 3) {
            unsigned int v112 = 9;
          }
          v259[0] = 0;
          uint64_t v113 = v5 + 8 * v109;
          int v114 = *(_DWORD *)(v104 + 28);
          if (((*(_DWORD *)(v5 + 3472) - 1) & v114) != 0) {
            uint64_t v115 = 0;
          }
          else {
            uint64_t v115 = *(void *)(v113 + 3408)
          }
                 + 2 * ((*(_DWORD *)(v5 + 3456) * ((v114 >> *(_DWORD *)(v5 + 3468)) - 1)) << 7);
          int v116 = (_WORD *)(*(void *)(v113 + 2120) + 2 * v218);
          uint64_t v104 = a1;
          unsigned int v117 = sub_224AE4C0C(*(int *)(a1 + 24) >> v255, *(int *)(a1 + 24) >> v255 > (int)v245[3466] >> v255, v114 >> v242, v114 >> v242 > (int)v245[3468] >> v242, (int)v245[3467] >> v255, (int)v245[3469] >> v242, 0, v116, *(void *)(v5 + 2152), v115, v112, v259, v240, v238, 0, v105, *(_DWORD *)(v5 + 4324));
          (*(void (**)(uint64_t, void, _WORD *, uint64_t, uint64_t, void, void, void, _DWORD))(v243 + 64 + 8 * v117))(v110, (8 * v240), v105, v106, v107, 0, 0, 0, *(_DWORD *)(v256 + 4324));
          (*(void (**)(_WORD *, void, uint64_t, uint64_t, uint64_t, char *))(v243 + 624))(v116, *(void *)(v256 + 2152), v110, v106, v107, v253);
          uint64_t v5 = v256;
          char v108 = 0;
          uint64_t v109 = 2;
        }
        while ((v111 & 1) != 0);
      }
    }
  }
  v251[16] = v248;
LABEL_149:
  if (*(unsigned char *)(a3 + 6))
  {
    uint64_t v118 = a1;
    int v119 = v212;
    int v120 = v214;
    switch((int)v209)
    {
      case 1:
        *(unsigned char *)(a1 + v224 + 64) = 64;
        break;
      case 2:
        *(_WORD *)(a1 + v224 + 64) = 16448;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 4:
        *(_DWORD *)(a1 + v224 + 64) = 1077952576;
        break;
      case 8:
        *(void *)(a1 + v224 + 64) = 0x4040404040404040;
        break;
      default:
        if (v209 == 16)
        {
          uint64_t v118 = a1;
          *(void *)&long long v183 = 0x4040404040404040;
          *((void *)&v183 + 1) = 0x4040404040404040;
          *(_OWORD *)(a1 + v224 + 64) = v183;
          int v119 = v212;
          int v120 = v214;
        }
        else
        {
          uint64_t v118 = a1;
          int v119 = v212;
          int v120 = v214;
          if (v209 == 32)
          {
            *(void *)&long long v182 = 0x4040404040404040;
            *((void *)&v182 + 1) = 0x4040404040404040;
            *(_OWORD *)(a1 + 64 + v224) = v182;
            *(_OWORD *)(a1 + 64 + (v224 + 16)) = v182;
          }
        }
        break;
    }
    switch(v120)
    {
      case 1:
        *(unsigned char *)(*(void *)(v118 + 656) + v225 + 32) = 64;
        goto LABEL_239;
      case 2:
        *(_WORD *)(*(void *)(v118 + 656) + v225 + 32) = 16448;
        goto LABEL_239;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_239;
      case 4:
        *(_DWORD *)(*(void *)(v118 + 656) + v225 + 32) = 1077952576;
        goto LABEL_239;
      case 8:
        uint64_t v186 = *(void *)(v118 + 656) + v225;
        goto LABEL_238;
      default:
        if (v120 == 16)
        {
          *(void *)(*(void *)(v118 + 656) + v225 + 32) = 0x4040404040404040;
          uint64_t v184 = *(void *)(v118 + 656);
          uint64_t v185 = (v225 + 8);
        }
        else
        {
          if (v120 != 32) {
            goto LABEL_239;
          }
          *(void *)(*(void *)(v118 + 656) + v225 + 32) = 0x4040404040404040;
          *(void *)(*(void *)(v118 + 656) + (v225 + 8) + 32) = 0x4040404040404040;
          *(void *)(*(void *)(v118 + 656) + (v225 + 16) + 32) = 0x4040404040404040;
          uint64_t v184 = *(void *)(v118 + 656);
          uint64_t v185 = (v225 + 24);
        }
        uint64_t v186 = v184 + v185;
LABEL_238:
        *(void *)(v186 + 32) = 0x4040404040404040;
LABEL_239:
        if (v119)
        {
          switch(v238)
          {
            case 1:
              unint64_t v187 = v118 + v223;
              *(unsigned char *)(v187 + 96) = 64;
              *(unsigned char *)(v187 + 128) = 64;
              break;
            case 2:
              unint64_t v192 = v118 + v223;
              *(_WORD *)(v192 + 96) = 16448;
              *(_WORD *)(v192 + 128) = 16448;
              break;
            case 3:
            case 5:
            case 6:
            case 7:
              break;
            case 4:
              unint64_t v193 = v118 + v223;
              *(_DWORD *)(v193 + 96) = 1077952576;
              *(_DWORD *)(v193 + 128) = 1077952576;
              break;
            case 8:
              unint64_t v194 = v118 + v223;
              *(void *)(v194 + 96) = 0x4040404040404040;
              *(void *)(v194 + 128) = 0x4040404040404040;
              break;
            default:
              if (v238 == 16)
              {
                unint64_t v195 = v118 + v223;
                *(void *)&long long v196 = 0x4040404040404040;
                *((void *)&v196 + 1) = 0x4040404040404040;
                *(_OWORD *)(v195 + 96) = v196;
                *(_OWORD *)(v195 + 128) = v196;
              }
              else if (v238 == 32)
              {
                uint64_t v188 = v118 + 96;
                *(void *)&long long v189 = 0x4040404040404040;
                *((void *)&v189 + 1) = 0x4040404040404040;
                *(_OWORD *)(v188 + v223) = v189;
                uint64_t v190 = v223 + 16;
                *(_OWORD *)(v188 + v190) = v189;
                uint64_t v191 = v118 + 128;
                *(_OWORD *)(v191 + v223) = v189;
                *(_OWORD *)(v191 + v190) = v189;
              }
              break;
          }
          switch(v240)
          {
            case 1:
              *(unsigned char *)(*(void *)(v118 + 656) + v236 + 64) = 64;
              *(unsigned char *)(*(void *)(v118 + 656) + v236 + 96) = 64;
              return 0;
            case 2:
              *(_WORD *)(*(void *)(v118 + 656) + v236 + 64) = 16448;
              *(_WORD *)(*(void *)(v118 + 656) + v236 + 96) = 16448;
              return 0;
            case 3:
            case 5:
            case 6:
            case 7:
              return 0;
            case 4:
              *(_DWORD *)(*(void *)(v118 + 656) + v236 + 64) = 1077952576;
              *(_DWORD *)(*(void *)(v118 + 656) + v236 + 96) = 1077952576;
              return 0;
            case 8:
              uint64_t v199 = v225 >> v255;
              *(void *)(*(void *)(v118 + 656) + v236 + 64) = 0x4040404040404040;
              goto LABEL_259;
            default:
              if (v240 == 16)
              {
                *(void *)(*(void *)(v118 + 656) + v236 + 64) = 0x4040404040404040;
                uint64_t v199 = v236 + 8;
                *(void *)(*(void *)(v118 + 656) + v199 + 64) = 0x4040404040404040;
                uint64_t v200 = *(void *)(v118 + 656) + v236;
              }
              else
              {
                if (v240 != 32) {
                  return 0;
                }
                *(void *)(*(void *)(v118 + 656) + v236 + 64) = 0x4040404040404040;
                uint64_t v197 = v236 + 8;
                *(void *)(*(void *)(v118 + 656) + v197 + 64) = 0x4040404040404040;
                uint64_t v198 = v236 + 16;
                *(void *)(*(void *)(v118 + 656) + v198 + 64) = 0x4040404040404040;
                uint64_t v199 = v236 + 24;
                *(void *)(*(void *)(v118 + 656) + v199 + 64) = 0x4040404040404040;
                *(void *)(*(void *)(v118 + 656) + v236 + 96) = 0x4040404040404040;
                *(void *)(*(void *)(v118 + 656) + v197 + 96) = 0x4040404040404040;
                uint64_t v200 = *(void *)(v118 + 656) + v198;
              }
              *(void *)(v200 + 96) = 0x4040404040404040;
LABEL_259:
              *(void *)(*(void *)(v118 + 656) + v199 + 96) = 0x4040404040404040;
              break;
          }
        }
        break;
    }
  }
  else
  {
    uint64_t v121 = *(unsigned __int8 *)(a3 + 7);
    uint64_t v122 = *(unsigned __int8 *)(a3 + 26);
    v258[0] = *(unsigned __int8 *)(a3 + 29);
    v258[1] = *(_WORD *)(a3 + 30);
    uint64_t v123 = a1;
    unsigned int v124 = v214;
    LOBYTE(v125) = v255;
    if (v209)
    {
      uint64_t v126 = 0;
      char v216 = v228 == 1;
      unsigned int v206 = &byte_224B28D18[8 * v122];
      int v250 = &byte_224B28D18[8 * v121];
      unsigned int v254 = v250 + 1;
      uint64_t v244 = v243 + 680;
      do
      {
        if (v124)
        {
          unsigned int v231 = 0;
          BOOL v208 = v126 != 0;
          uint64_t v213 = 2 * v126;
          unsigned int v127 = v126 + 16;
          int v128 = v204;
          if (v204 >= (int)v126 + 16) {
            int v128 = v126 + 16;
          }
          uint64_t v221 = v128;
          uint64_t v217 = 4 * v126;
          signed int v219 = v126 >> v242;
          unint64_t v205 = v126 + 16;
          signed int v129 = v127 >> v242;
          if ((int)(v204 + v242) >> v242 < (int)(v127 >> v242)) {
            signed int v129 = (int)(v204 + v242) >> v242;
          }
          signed int v227 = v129;
          int v130 = *(_DWORD *)(v123 + 28);
          uint64_t v220 = v126;
          do
          {
            unint64_t v131 = *(void *)(v5 + 2144);
            int v132 = &v20[v213 * v131];
            int v133 = v130 + v126;
            *(_DWORD *)(v123 + 28) = v130 + v126;
            if (v126 >= v221)
            {
              int v137 = v126;
            }
            else
            {
              char v134 = v208;
              if ((int)v207 >= (int)(v231 + 16)) {
                signed int v135 = v231 + 16;
              }
              else {
                signed int v135 = v207;
              }
              int v136 = *(_DWORD *)(v123 + 24);
              int v137 = v126;
              do
              {
                int v138 = v136 + v231;
                *(_DWORD *)(v123 + 24) = v138;
                signed int v139 = v231;
                if ((int)v231 < v135)
                {
                  uint64_t v140 = v123;
                  int v141 = v231 != 0;
                  signed int v139 = v231;
                  do
                  {
                    sub_224AEEEC4(v140, a2, a3, *(unsigned __int8 *)(a3 + 26), 0, (uint64_t)v258, v141, v134, (uint64_t)&v132[4 * v139]);
                    int v142 = *v206;
                    int v138 = *(_DWORD *)(v140 + 24) + v142;
                    *(_DWORD *)(v140 + 24) = v138;
                    v139 += v142;
                    ++v141;
                  }
                  while (v139 < v135);
                  LOBYTE(v125) = v255;
                  uint64_t v5 = v256;
                  unint64_t v131 = *(void *)(v256 + 2144);
                  int v133 = *(_DWORD *)(v140 + 28);
                  uint64_t v123 = v140;
                }
                uint64_t v143 = v206[1];
                v132 += 2 * v131 * v143;
                int v136 = v138 - v139;
                v133 += v143;
                *(_DWORD *)(v123 + 24) = v136;
                *(_DWORD *)(v123 + 28) = v133;
                v137 += v143;
                ++v134;
              }
              while (v137 < (int)v221);
            }
            int v130 = v133 - v137;
            *(_DWORD *)(v123 + 28) = v133 - v137;
            int v215 = v132;
            if (v212)
            {
              unint64_t v210 = v131;
              int v211 = v137;
              uint64_t v144 = 0;
              signed int v145 = v231 >> v125;
              if ((int)(v207 + v255) >> v255 >= (int)((v231 + 16) >> v125)) {
                signed int v146 = (v231 + 16) >> v125;
              }
              else {
                signed int v146 = (int)(v207 + v255) >> v255;
              }
              uint64_t v147 = *(void *)(v5 + 2152);
              char v148 = 1;
              uint64_t v149 = a3;
              signed int v150 = v227;
              signed int v226 = v231 >> v125;
              do
              {
                char v151 = v148;
                uint64_t v152 = *(void *)(v5 + 8 * (v144 + 1) + 2120);
                int v153 = v130 + v220;
                *(_DWORD *)(v123 + 28) = v153;
                char v222 = v151;
                if (v219 >= v150)
                {
                  signed int v154 = v219;
                }
                else
                {
                  signed int v154 = v219;
                  uint64_t v155 = v152 + 2 * v218 + 2 * ((v217 * (v147 >> 1)) >> v216);
                  int v156 = *(_DWORD *)(v123 + 24);
                  do
                  {
                    int v157 = v156 + v231;
                    *(_DWORD *)(v123 + 24) = v157;
                    if (v145 >= v146)
                    {
                      uint64_t v167 = *v254;
                      signed int v160 = v145;
                    }
                    else
                    {
                      int v241 = v225 | (32 * ((v154 << v242) + v224));
                      signed int v229 = v154;
                      uint64_t v158 = (v154 + v223);
                      uint64_t v159 = v123 + 32 * v144 + 96;
                      signed int v160 = v145;
                      int v161 = (uint64x2_t *)(v159 + v158);
                      unsigned int v233 = (void *)(v159 + (v158 + 8));
                      do
                      {
                        int v162 = v251[17];
                        if (!v162)
                        {
                          unsigned __int8 v257 = 0;
                          v259[0] = *(unsigned __int8 *)(a1 + 9344 + v241 + (v160 << v125));
                          uint64_t v168 = v149;
                          uint64_t v169 = (v160 + v236);
                          int v170 = sub_224AEF500(v123, (uint64x2_t *)(*(void *)(v123 + 656) + 32 * v144 + v169 + 64), v161, *(unsigned __int8 *)(v168 + 7), a2, v168, 0, (int)v144 + 1, (unsigned int *)(a1 + 1024), (unsigned int *)v259, &v257);
                          uint64_t v167 = *v254;
                          uint64_t v171 = v256;
                          int v172 = (int)(*(_DWORD *)(v256 + 3452) + v242 - *(_DWORD *)(v123 + 28)) >> v242;
                          if ((int)v167 < v172) {
                            int v172 = *v254;
                          }
                          switch(v172)
                          {
                            case 1:
                              LODWORD(v173) = v257;
                              v161->i8[0] = v257;
                              goto LABEL_196;
                            case 2:
                              LODWORD(v173) = v257;
                              v161->i16[0] = v257 | (v257 << 8);
                              goto LABEL_196;
                            case 3:
                            case 5:
                            case 6:
                            case 7:
                              goto LABEL_192;
                            case 4:
                              LODWORD(v173) = v257;
                              v161->i32[0] = 16843009 * v257;
                              goto LABEL_196;
                            case 8:
                              LODWORD(v173) = v257;
                              v161->i64[0] = 0x101010101010101 * v257;
                              goto LABEL_196;
                            default:
                              if (v172 == 16)
                              {
                                uint64_t v173 = v257;
                                v161->i64[0] = 0x101010101010101 * v257;
                                *unsigned int v233 = 0x101010101010101 * v173;
                              }
                              else
                              {
LABEL_192:
                                LODWORD(v173) = v257;
                                memset(v161, v257, v172);
                                uint64_t v171 = v256;
                              }
LABEL_196:
                              int v166 = *v250;
                              int v125 = v255;
                              int v174 = (*(_DWORD *)(v171 + 3448) + v125 - *(_DWORD *)(a1 + 24)) >> v125;
                              if (v166 < v174) {
                                int v174 = *v250;
                              }
                              switch(v174)
                              {
                                case 1:
                                  *(unsigned char *)(*(void *)(a1 + 656) + 32 * v144 + v169 + 64) = v173;
                                  uint64_t v123 = a1;
                                  goto LABEL_207;
                                case 2:
                                  __int16 v178 = v173 | ((_WORD)v173 << 8);
                                  uint64_t v123 = a1;
                                  *(_WORD *)(*(void *)(a1 + 656) + 32 * v144 + v169 + 64) = v178;
                                  goto LABEL_207;
                                case 3:
                                case 5:
                                case 6:
                                case 7:
                                  goto LABEL_202;
                                case 4:
                                  int v179 = 16843009 * v173;
                                  uint64_t v123 = a1;
                                  *(_DWORD *)(*(void *)(a1 + 656) + 32 * v144 + v169 + 64) = v179;
                                  goto LABEL_207;
                                case 8:
                                  uint64_t v175 = 0x101010101010101 * v173;
                                  uint64_t v123 = a1;
                                  uint64_t v176 = *(void *)(a1 + 656) + 32 * v144 + v169;
                                  goto LABEL_206;
                                default:
                                  if (v174 == 16)
                                  {
                                    uint64_t v175 = 0x101010101010101 * v173;
                                    uint64_t v123 = a1;
                                    *(void *)(*(void *)(a1 + 656) + 32 * v144 + v169 + 64) = v175;
                                    uint64_t v176 = *(void *)(a1 + 656) + 32 * v144 + (v169 + 8);
LABEL_206:
                                    *(void *)(v176 + 64) = v175;
                                  }
                                  else
                                  {
LABEL_202:
                                    int v177 = v173;
                                    uint64_t v123 = a1;
                                    memset((void *)(*(void *)(a1 + 656) + 32 * v144 + v169 + 64), v177, v174);
                                    LOBYTE(v125) = v255;
                                  }
LABEL_207:
                                  uint64_t v149 = a3;
                                  if (v170 < 0) {
                                    goto LABEL_184;
                                  }
                                  goto LABEL_183;
                              }
                          }
                        }
                        int v163 = &v245[6 * (v162 & 1)];
                        int v164 = (__int16 *)*((void *)v163 + 1738);
                        int v165 = *v164;
                        *((void *)v163 + 1738) = v164 + 1;
                        int v166 = *v250;
                        uint64_t v167 = *v254;
                        *((void *)v163 + 1739) += (v167 * *v250) << 6;
                        v259[0] = v165 & 0x1F;
                        if (((v165 >> 5) & 0x80000000) == 0)
                        {
LABEL_183:
                          (*(void (**)(uint64_t, void))(v244
                                                                  + 136 * *(unsigned __int8 *)(v149 + 7)
                                                                  + 8 * v259[0]))(v155 + 2 * (4 * v160), *(void *)(v256 + 2152));
                          LOBYTE(v125) = v255;
                        }
LABEL_184:
                        int v157 = (v166 << v125) + *(_DWORD *)(v123 + 24);
                        *(_DWORD *)(v123 + 24) = v157;
                        v160 += v166;
                      }
                      while (v160 < v146);
                      uint64_t v5 = v256;
                      uint64_t v147 = *(void *)(v256 + 2152);
                      int v153 = *(_DWORD *)(v123 + 28);
                      signed int v150 = v227;
                      signed int v154 = v229;
                      signed int v145 = v226;
                    }
                    v155 += 4 * v147 * v167;
                    int v156 = v157 - (v160 << v125);
                    v153 += v167 << v242;
                    *(_DWORD *)(v123 + 24) = v156;
                    *(_DWORD *)(v123 + 28) = v153;
                    v154 += v167;
                  }
                  while (v154 < v150);
                }
                char v148 = 0;
                int v130 = v153 - (v154 << v242);
                *(_DWORD *)(v123 + 28) = v130;
                uint64_t v144 = 1;
              }
              while ((v222 & 1) != 0);
              unsigned int v124 = v214;
              uint64_t v126 = v220;
              int v137 = v211;
              unint64_t v131 = v210;
              unsigned int v180 = v231 + 16;
            }
            else
            {
              unsigned int v180 = v231 + 16;
              unsigned int v124 = v214;
              uint64_t v126 = v220;
            }
            int v20 = &v215[-4 * v137 * (v131 >> 1)];
            unsigned int v231 = v180;
          }
          while (v180 < v124);
          unint64_t v181 = v205;
        }
        else
        {
          unint64_t v181 = v126 + 16;
        }
        uint64_t v126 = v181;
      }
      while (v181 < v209);
    }
  }
  return 0;
}

uint64_t sub_224AF42A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8, unsigned int a9, int a10, int a11, uint64_t a12, int a13, unsigned int a14)
{
  uint64_t v18 = *(void *)(a1 + 8);
  if (a9)
  {
    int v19 = *(_DWORD *)(v18 + 2168);
    int v20 = v19 == 1;
    int v21 = v19 != 3;
  }
  else
  {
    int v20 = 0;
    int v21 = 0;
  }
  unsigned int v22 = 4u >> v21;
  unsigned int v23 = 4u >> v20;
  int v24 = a11 >> 16;
  char v25 = v21 ^ 1;
  char v26 = v20 ^ 1;
  unint64_t v27 = *(void *)(a12 + 8 * (a9 != 0) + 40);
  int v29 = *(_DWORD *)(a12 + 56);
  int v28 = *(_DWORD *)(a12 + 60);
  if (v29 == *(_DWORD *)(v18 + 2160) && v28 == *(_DWORD *)(v18 + 2164))
  {
    unsigned int v30 = (0xFu >> v25) & (a11 >> 16);
    if (v21) {
      char v31 = 4;
    }
    else {
      char v31 = 3;
    }
    unsigned int v32 = (v24 >> v31) + v22 * a7;
    if (v20) {
      char v33 = 4;
    }
    else {
      char v33 = 3;
    }
    if (*(void *)(a12 + 16) == *(void *)(v18 + 2120))
    {
      int v34 = 4 * *(_DWORD *)(v18 + 3448);
      int v35 = 4 * *(_DWORD *)(v18 + 3452);
    }
    else
    {
      int v34 = v29 + v21;
      int v35 = v28 + v20;
    }
    uint64_t v98 = a4;
    unsigned int v74 = (0xFu >> v26) & a11;
    uint64_t v75 = ((__int16)a11 >> v33) + v23 * a8;
    int v76 = v35 >> v20;
    int v77 = v34 >> v21;
    if (v30) {
      int v78 = 3;
    }
    else {
      int v78 = 0;
    }
    unsigned int v100 = (0xFu >> v26) & a11;
    unsigned int v99 = (0xFu >> v25) & (a11 >> 16);
    if ((int)v32 >= v78
      && (v74 ? (int v79 = 3) : (int v79 = 0),
          (int)v75 >= v79
       && (int)(v32 + v22 * a5 + 4 * (v30 != 0)) <= v77
       && (int)(v75 + v23 * a6 + 4 * (v74 != 0)) <= v76))
    {
      uint64_t v104 = *(void *)(a12 + 8 * (a9 != 0) + 40);
      uint64_t v80 = *(void *)(a12 + 8 * a9 + 16) + 2 * (v27 >> 1) * v75;
    }
    else
    {
      uint64_t v80 = a1 + 90176;
      if (v30) {
        int v81 = 7;
      }
      else {
        int v81 = 0;
      }
      if (v74) {
        int v82 = 7;
      }
      else {
        int v82 = 0;
      }
      uint64_t v83 = v76;
      if (v74) {
        int v84 = -3;
      }
      else {
        int v84 = 0;
      }
      uint64_t v85 = a2;
      if (v74) {
        int v86 = 576;
      }
      else {
        int v86 = 0;
      }
      uint64_t v104 = 384;
      (*(void (**)(void, void, void, uint64_t, void, void, uint64_t, uint64_t, void, unint64_t))(*(void *)(v18 + 3280) + 664))(v81 + v22 * a5, v82 + v23 * a6, v77, v83, (int)(v32 - v78), v84 + (int)v75, v80, 384, *(void *)(a12 + 8 * a9 + 16), v27);
      unsigned int v32 = v78 | v86;
      a2 = v85;
    }
    uint64_t v87 = v80 + 2 * v32;
    uint64_t v88 = *(void *)(v18 + 3280);
    if (a2)
    {
      char v89 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 8 * a14 + 256);
      uint64_t v90 = v22 * a5;
      uint64_t v91 = v23 * a6;
      uint64_t v92 = v99 << v25;
      uint64_t v93 = v100 << v26;
      uint64_t v94 = a2;
      uint64_t v95 = v98;
      uint64_t v96 = v104;
    }
    else
    {
      char v89 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 8 * a14 + 416);
      uint64_t v96 = v22 * a5;
      uint64_t v90 = v23 * a6;
      uint64_t v91 = v99 << v25;
      uint64_t v92 = v100 << v26;
      uint64_t v93 = *(unsigned int *)(v18 + 4324);
      uint64_t v94 = a3;
      uint64_t v95 = v80 + 2 * v32;
      uint64_t v87 = v104;
    }
    return v89(v94, v95, v87, v96, v90, v91, v92, v93);
  }
  else
  {
    int v37 = (v24 << v25) + 16 * a7 * v22;
    uint64_t v38 = (_DWORD *)(v18 + 16 * a13);
    uint64_t v39 = 8 * v38[782] - 0x20000 + (int)v38[782] * (uint64_t)v37;
    BOOL v40 = v39 < 0;
    if (v39 < 0) {
      uint64_t v39 = -v39;
    }
    unint64_t v41 = (unint64_t)(v39 + 128) >> 8;
    if (v40) {
      int v42 = -(int)v41;
    }
    else {
      int v42 = v41;
    }
    int v43 = v42 + 32;
    uint64_t v44 = 8 * v38[784] - 0x20000 + (int)v38[784] * (uint64_t)(int)(((__int16)a11 << v26) + 16 * a8 * v23);
    BOOL v45 = v44 < 0;
    if (v44 < 0) {
      uint64_t v44 = -v44;
    }
    unint64_t v46 = (unint64_t)(v44 + 128) >> 8;
    if (v45) {
      int v47 = -(int)v46;
    }
    else {
      int v47 = v46;
    }
    __int16 v48 = v47 + 32;
    unsigned int v49 = v43 >> 10;
    uint64_t v50 = ((v47 + 32) >> 10);
    uint64_t v51 = v22 * a5;
    uint64_t v52 = v38[783];
    int v53 = (v43 + (int)v52 * ((int)v51 - 1)) >> 10;
    uint64_t v54 = v23 * a6;
    unsigned int v55 = v38[785];
    int v56 = (int)(v47 + 32 + v55 * (v54 - 1)) >> 10;
    int v57 = (v29 + v21) >> v21;
    int v58 = (v28 + v20) >> v20;
    if (v42 >= 3040
      && (v47 >= 3040 ? (BOOL v59 = v53 + 5 <= v57) : (BOOL v59 = 0), v59 ? (v60 = v56 + 5 <= v58) : (v60 = 0), v60))
    {
      uint64_t v61 = *(void *)(a12 + 8 * (a9 != 0) + 40);
      uint64_t v62 = *(void *)(a12 + 8 * a9 + 16) + 2 * (v27 >> 1) * v50 + 2 * v49;
    }
    else
    {
      uint64_t v103 = a2;
      uint64_t v63 = v38 + 782;
      char v101 = v38 + 785;
      uint64_t v64 = a4;
      uint64_t v61 = 640;
      (*(void (**)(void, void, void, void, void, void, uint64_t, uint64_t, void, unint64_t))(*(void *)(v18 + 3280) + 664))((int)(v53 - v49 + 8), v56 - (int)v50 + 8, v57, v58, (int)(v49 - 3), (int)v50 - 3, a1 + 90176, 640, *(void *)(a12 + 8 * a9 + 16), v27);
      a4 = v64;
      uint64_t v62 = a1 + 92102;
      uint64_t v52 = v63[1];
      a2 = v103;
      unsigned int v55 = *v101;
    }
    uint64_t v65 = *(void *)(v18 + 3280);
    uint64_t v66 = v43 & 0x3FF;
    if (a2)
    {
      uint64_t v67 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v65 + 8 * a14 + 336);
      unint64_t v106 = __PAIR64__(v55, v52);
      uint64_t v68 = a2;
      uint64_t v69 = a4;
      uint64_t v70 = v61;
      uint64_t v71 = v51;
      uint64_t v72 = v54;
      uint64_t v52 = v48 & 0x3FF;
    }
    else
    {
      uint64_t v67 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v65 + 8 * a14 + 496);
      LODWORD(v106) = v55;
      HIDWORD(v106) = *(_DWORD *)(v18 + 4324);
      uint64_t v68 = a3;
      uint64_t v69 = v62;
      uint64_t v62 = v61;
      uint64_t v70 = v51;
      uint64_t v71 = v54;
      uint64_t v72 = v43 & 0x3FF;
      uint64_t v66 = v48 & 0x3FF;
    }
    return v67(v68, v69, v62, v70, v71, v72, v66, v52, v106);
  }
}

uint64_t sub_224AF47F0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v51 = result;
  uint64_t v10 = *(void *)(result + 8);
  if (a6)
  {
    int v11 = *(_DWORD *)(v10 + 2168);
    int v34 = v11 == 1;
    int v48 = v11 != 3;
  }
  else
  {
    int v34 = 0;
    int v48 = 0;
  }
  if (a5[1])
  {
    unsigned int v12 = 0;
    uint64_t v43 = *(void *)(v10 + 3280);
    int v13 = *a5;
    int v45 = (*(_DWORD *)(a7 + 60) + v34) >> v34;
    int v46 = (*(_DWORD *)(a7 + 56) + v48) >> v48;
    uint64_t v44 = (unint64_t *)(a7 + 8 * (a6 != 0) + 40);
    unint64_t v41 = (void *)(a7 + 8 * a6 + 16);
    uint64_t v42 = a8 + 28;
    uint64_t v36 = 4 * a4;
    uint64_t v35 = 8 * a4;
    uint64_t v39 = result + 90374;
    uint64_t v40 = result + 90176;
    uint64_t v54 = *(void *)(result + 8);
    do
    {
      if (v13)
      {
        unint64_t v14 = 0;
        unsigned int v37 = v12;
        uint64_t v15 = 4 * *(int *)(v51 + 28) + (int)((v12 | 4) << v34);
        uint64_t v50 = *(int *)(a8 + 4) + v15 * *(int *)(a8 + 16);
        uint64_t v49 = *(int *)(a8 + 8) + *(int *)(a8 + 24) * v15;
        uint64_t v16 = a3;
        uint64_t v38 = a2;
        do
        {
          uint64_t v17 = 4 * *(int *)(v51 + 24) + (((int)v14 + 4) << v48);
          unint64_t v18 = (v50 + v17 * *(int *)(a8 + 12)) >> v48;
          unint64_t v19 = (v49 + *(int *)(a8 + 20) * v17) >> v34;
          int v20 = *(__int16 *)(a8 + 28);
          int v21 = *(__int16 *)(a8 + 30);
          unint64_t v22 = v19 >> 16;
          int v23 = *(__int16 *)(a8 + 32);
          int v24 = *(__int16 *)(a8 + 34);
          unint64_t v25 = *v44;
          if ((int)(v18 >> 16) >= 7 && (int)((v18 >> 16) + 8) <= v46 && (int)v22 >= 7 && (int)((v19 >> 16) + 8) <= v45)
          {
            uint64_t v29 = *v41 + 2 * ((v19 >> 16) - 4) * (v25 >> 1) + 2 * ((v18 >> 16) - 4);
          }
          else
          {
            (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t, void, unint64_t))(*(void *)(v10 + 3280) + 664))(15, 15, v46, v45, (uint64_t)((v18 >> 16 << 32) - 0x700000000) >> 32, (uint64_t)((v22 << 32) - 0x700000000) >> 32, v40, 64, *v41, v25);
            uint64_t v10 = v54;
            uint64_t v29 = v39;
            unint64_t v25 = 64;
          }
          uint64_t v30 = (-7 * v21 - 4 * v20 + (unsigned __int16)v18) & 0xFFFFFFC0;
          unint64_t v31 = ((v19 & 0xFFFC) - 4 * (v24 + v23)) & 0xFFFFFFC0;
          uint64_t v32 = *(unsigned int *)(v10 + 4324);
          if (a3) {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(v43 + 656))(v16, a4, v29, v25, v42, v30, v31, v32);
          }
          else {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(v43 + 648))(a2, a4, v29, v25, v42, v30, v31, v32);
          }
          uint64_t v10 = v54;
          v14 += 8;
          int v13 = *a5;
          a2 += 16;
          v16 += 16;
        }
        while (v14 < (4u >> v48) * v13);
        a2 = v38;
        unsigned int v12 = v37;
      }
      uint64_t v33 = a3;
      if (!a2) {
        uint64_t v33 = a3 + 2 * v35;
      }
      a3 = v33;
      if (a2) {
        a2 += 2 * v36;
      }
      else {
        a2 = 0;
      }
      v12 += 8;
    }
    while (v12 < (4u >> v34) * a5[1]);
  }
  return result;
}

uint64_t sub_224AF4B44(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned int a5, int a6, int a7, uint64_t a8, int a9)
{
  int v9 = a4;
  uint64_t v10 = result;
  int v11 = a9;
  int v12 = *(_DWORD *)(result + 24);
  int v13 = *(_DWORD *)(result + 28);
  uint64_t v14 = *(void *)(result + 8);
  uint64_t v64 = result + 8 * (v13 & 0x1E) + 712;
  uint64_t v60 = result + 8256;
  if (a5)
  {
    int v15 = *(_DWORD *)(v14 + 2168);
    unsigned int v16 = 4u >> (v15 != 3);
    unsigned int v17 = 4u >> (v15 == 1);
    unint64_t v19 = (uint64_t *)(result + 16);
    uint64_t v18 = *(void *)(result + 16);
    if (v13 <= *(_DWORD *)(v18 + 13872) || v16 * *a4 + v17 * a4[1] < 0x10)
    {
      int v58 = v17;
      int v59 = v16;
      goto LABEL_29;
    }
  }
  else
  {
    unint64_t v19 = (uint64_t *)(result + 16);
    uint64_t v18 = *(void *)(result + 16);
    unsigned int v16 = 4;
    if (v13 <= *(_DWORD *)(v18 + 13872))
    {
      int v58 = 4;
      int v59 = 4;
      goto LABEL_29;
    }
    unsigned int v17 = 4;
  }
  int v58 = v17;
  int v59 = v16;
  if ((int)a8 >= 1)
  {
    int v53 = v19;
    int v54 = a7;
    int v20 = 0;
    int v21 = 0;
    int v55 = a6 + 1;
    while (1)
    {
      int v22 = v9[2] >= 4u ? 4 : v9[2];
      int v12 = *(_DWORD *)(v10 + 24);
      if (v21 >= v22) {
        break;
      }
      uint64_t v23 = *(void *)(v64 - 8);
      int v24 = v12 + v20;
      uint64_t v25 = v12 + v20 + 1;
      uint64_t v26 = v23 + 12 * v25;
      int v27 = byte_224B28CC0[4 * *(unsigned __int8 *)(v26 + 10)];
      if (v27 >= 0x10) {
        int v27 = 16;
      }
      if (v27 <= 2) {
        int v28 = 2;
      }
      else {
        int v28 = v27;
      }
      int v29 = *(char *)(v26 + 8);
      if (v29 >= 1)
      {
        uint64_t v30 = 12 * v25;
        if (v28 >= *v9) {
          int v31 = *v9;
        }
        else {
          int v31 = v28;
        }
        unsigned int v32 = v9[1];
        if (v32 >= 0x10) {
          unsigned int v32 = 16;
        }
        unsigned int v33 = v32 >> 1;
        uint64_t v34 = (v31 * v59);
        int v57 = v21;
        uint64_t v35 = v9;
        uint64_t v36 = a8;
        uint64_t v37 = *(void *)(v10 + 656) + v55 + v20;
        sub_224AF42A8(v10, v60, 0, (2 * v34), v31, (3 * (v32 >> 1) + 3) >> 2, v24, *(_DWORD *)(v10 + 28), a5, v52, *(_DWORD *)(v23 + v30), v14 + 296 * (v29 - 1) + 32, v29 - 1, byte_224B19468[4 * *(unsigned __int8 *)(v37 + 384) + *(unsigned __int8 *)(v37 + 352)]);
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(v14 + 3280) + 640))(a2 + 2 * (v20 * v59), a3, v60, v34, v33 * v58);
        a8 = v36;
        int v9 = v35;
        int v21 = v57 + 1;
      }
      v20 += v28;
      if (v20 >= (int)a8)
      {
        int v12 = *(_DWORD *)(v10 + 24);
        break;
      }
    }
    uint64_t v18 = *v53;
    a7 = v54;
    int v11 = a9;
  }
LABEL_29:
  if (v12 > *(_DWORD *)(v18 + 13864) && v11 >= 1)
  {
    int v39 = 0;
    signed int v40 = 0;
    int v56 = a7 + 1;
    do
    {
      unsigned int v41 = v9[3];
      if (v41 >= 4) {
        unsigned int v41 = 4;
      }
      if (v40 >= (int)v41) {
        break;
      }
      uint64_t v42 = *(void *)(v64 + 8 * (v39 + 1));
      int v43 = *(_DWORD *)(v10 + 24);
      uint64_t v44 = v42 + 12 * (v43 - 1);
      int v45 = byte_224B28CC0[4 * *(unsigned __int8 *)(v44 + 10) + 1];
      if (v45 >= 0x10) {
        int v45 = 16;
      }
      if (v45 <= 2) {
        int v46 = 2;
      }
      else {
        int v46 = v45;
      }
      int v47 = *(char *)(v44 + 8);
      if (v47 >= 1)
      {
        unsigned int v48 = *v9;
        if (v48 >= 0x10) {
          unsigned int v48 = 16;
        }
        int v49 = v48 >> 1;
        if (v46 >= v9[1]) {
          int v50 = v9[1];
        }
        else {
          int v50 = v46;
        }
        uint64_t v51 = (v49 * v59);
        sub_224AF42A8(v10, v60, 0, 2 * v51, v49, v50, v43, *(_DWORD *)(v10 + 28) + v39, a5, v52, *(_DWORD *)(v42 + 12 * (v43 - 1)), v14 + 296 * (v47 - 1) + 32, v47 - 1, byte_224B19468[4 * *(unsigned __int8 *)(v10 + v56 + v39 + 416) + *(unsigned __int8 *)(v10 + 384 + v56 + v39)]);
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(v14 + 3280) + 632))(a2 + 2 * (a3 >> 1) * (v39 * v58), a3, v60, v51, (v50 * v58));
        ++v40;
      }
      v39 += v46;
    }
    while (v39 < v11);
  }
  return result;
}

uint64_t sub_224AF4F78(uint64_t result, uint64_t a2)
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)(*(void *)(result + 3256) + 63080) & 1) == 0) {
    return result;
  }
  uint64_t v2 = *(void *)(result + 24);
  if (!*(unsigned char *)(v2 + 830) && !*(unsigned char *)(v2 + 831)) {
    return result;
  }
  int v128 = 4 * a2 * *(_DWORD *)(result + 3472);
  int v3 = *(_DWORD *)(result + 2168);
  int v4 = *(unsigned char *)(*(void *)(result + 8) + 392) == 0;
  signed int v5 = 0x20u >> v4;
  if (*(unsigned char *)(*(void *)(result + 8) + 392)) {
    char v6 = 5;
  }
  else {
    char v6 = 4;
  }
  int v113 = v3 != 3;
  int v117 = v5 * a2;
  if (*(_DWORD *)(result + 3444) - v5 * (int)a2 >= v5) {
    unsigned int v7 = 0x20u >> v4;
  }
  else {
    unsigned int v7 = *(_DWORD *)(result + 3444) - v5 * a2;
  }
  uint64_t v103 = *(void *)(result + 5304);
  signed int v105 = 0x20u >> v4;
  unint64_t v100 = *(void *)(result + 2144);
  uint64_t v116 = *(void *)(result + 5312);
  uint64_t v106 = *(void *)(result + 2152);
  uint64_t v107 = *(void *)(result + 5320);
  uint64_t v8 = *(unsigned int *)(result + 3456);
  uint64_t v109 = ((int)a2 >> v4) * (int)v8;
  uint64_t v111 = *(void *)(result + 4440);
  int v125 = *(unsigned __int8 *)(*(void *)(result + 5288) + (int)a2);
  uint64_t v9 = v111 + 1348 * v109;
  int v122 = a2;
  unsigned int v120 = 16 * (v4 & a2);
  signed int v115 = 0x10u >> (v3 == 1);
  unsigned int v137 = v7;
  int v134 = v4 & a2;
  uint64_t v131 = v7 + v120;
  if (v3 == 1) {
    unsigned int v10 = v7 + v120 + 1;
  }
  else {
    unsigned int v10 = v7 + v120;
  }
  char v118 = v3 == 1;
  uint64_t v114 = v10 >> (v3 == 1);
  uint64_t v136 = result;
  int v11 = *(_DWORD *)(result + 3448);
  unsigned int v12 = *(unsigned __int16 *)(v2 + 452);
  if ((int)(v12 << v6) < v11)
  {
    uint64_t result = a2;
    uint64_t v13 = *(void *)(v136 + 5168) + (int)(a2 << (v6 - v118));
    uint64_t v14 = *(void *)(v136 + 5160) + (int)(a2 << v6);
    unint64_t v15 = (*(int *)(v136 + 3452) + 31) & 0xFFFFFFFFFFFFFFE0;
    uint64_t v16 = 1;
    uint64_t v17 = v120 >> v118;
    if (v3 == 1) {
      char v18 = 3;
    }
    else {
      char v18 = 4;
    }
    do
    {
      unsigned int v19 = 16 * (v12 & v4);
      unsigned int v20 = v12 >> v4;
      if (v120 < v131)
      {
        uint64_t v21 = 0;
        unsigned int v22 = 1 << v120;
        do
        {
          unsigned int v23 = v22 >> (16 * ((v22 & 0xFFFF0000) != 0));
          int v24 = (_WORD *)(v9 + 1348 * v20 + 12 * v19 + 2 * ((v22 & 0xFFFF0000) != 0));
          int v25 = (unsigned __int16)v24[4];
          BOOL v26 = (v23 & v25) != 0;
          int v27 = (unsigned __int16)v24[2];
          v24[4] = v25 & ~(_WORD)v23;
          v24[2] = v27 & ~(_WORD)v23;
          *v24 &= ~(_WORD)v23;
          int v28 = *(unsigned __int8 *)(v14 + v21);
          int v29 = ((v23 & v27) != 0) | (2 * v26);
          if (v29 < v28) {
            int v28 = v29;
          }
          uint64_t result = 4 * v28;
          *(_WORD *)((char *)v24 + result) |= v23;
          v22 *= 2;
          ++v21;
        }
        while (v131 - v120 != v21);
      }
      if (v3 && v17 < v114)
      {
        uint64_t v30 = 0;
        uint64_t v31 = v9 + 1348 * v20 + 8 * (v19 >> v113) + 768;
        unsigned int v32 = 1 << v17;
        do
        {
          unsigned int v33 = v32 >> ((v32 >> v115 != 0) << v18);
          uint64_t v34 = (_WORD *)(v31 + 2 * (v32 >> v115 != 0));
          int v35 = (unsigned __int16)v34[2];
          BOOL v36 = (v33 & v35) == 0;
          v34[2] = v35 & ~(_WORD)v33;
          *v34 &= ~(_WORD)v33;
          int v37 = *(unsigned __int8 *)(v13 + v30);
          int v38 = !v36;
          if (v38 < v37) {
            int v37 = v38;
          }
          uint64_t result = 4 * v37;
          *(_WORD *)((char *)v34 + result) |= v33;
          v32 *= 2;
          ++v30;
        }
        while (v114 - v17 != v30);
      }
      v14 += v15;
      v13 += (int)v15 >> v118;
      ++v16;
      unsigned int v12 = *(unsigned __int16 *)(v2 + 2 * v16 + 450);
    }
    while ((int)(v12 << v6) < v11);
  }
  uint64_t v39 = v128;
  if (!v125) {
    goto LABEL_56;
  }
  if ((int)v8 > 0)
  {
    uint64_t v40 = 0;
    unsigned int v41 = 0x10u >> v113;
    uint64_t v42 = *(void *)(v136 + 4032) + 624 * (int)v8 * (v125 - 1);
    uint64_t result = v9 + 12 * v120 + 384;
    int v43 = *(_DWORD *)(v136 + 3440);
    if (v3 == 3) {
      char v44 = 4;
    }
    else {
      char v44 = 3;
    }
    int v45 = *(_DWORD *)(v136 + 3440);
    do
    {
      unsigned int v46 = v45;
      BOOL v47 = __OFSUB__(v45, 32);
      v45 -= 32;
      if (v45 < 0 != v47) {
        uint64_t v48 = v46;
      }
      else {
        uint64_t v48 = 32;
      }
      if (v43 - 32 * (int)v40 >= 32) {
        int v49 = 32;
      }
      else {
        int v49 = v43 - 32 * v40;
      }
      if (v49)
      {
        uint64_t v50 = 0;
        unsigned int v51 = 1;
        do
        {
          unsigned int v52 = v51 >> (16 * ((v51 & 0xFFFF0000) != 0));
          int v53 = (_WORD *)(result + 1348 * v40 + 2 * ((v51 & 0xFFFF0000) != 0));
          int v54 = (unsigned __int16)v53[4];
          int v55 = (unsigned __int16)v53[2];
          int v56 = ((v52 & v55) != 0) | (2 * ((v52 & v54) != 0));
          v53[4] = v54 & ~(_WORD)v52;
          _OWORD v53[2] = v55 & ~(_WORD)v52;
          *v53 &= ~(_WORD)v52;
          int v57 = *(unsigned __int8 *)(v42 + v50 + 480);
          if (v56 < v57) {
            int v57 = v56;
          }
          v53[2 * v57] |= v52;
          v51 *= 2;
          ++v50;
        }
        while (v48 != v50);
      }
      if (v3)
      {
        uint64_t v58 = (v49 + v113) >> v113;
        if (v58)
        {
          uint64_t v59 = 0;
          unsigned int v60 = 1;
          do
          {
            unsigned int v61 = v60 >> ((v60 >> v41 != 0) << v44);
            uint64_t v62 = (_WORD *)(v9 + 1348 * v40 + 8 * (v120 >> v118) + 1024 + 2 * (v60 >> v41 != 0));
            int v63 = (unsigned __int16)v62[2];
            int v64 = (v61 & v63) != 0;
            v62[2] = v63 & ~(_WORD)v61;
            *v62 &= ~(_WORD)v61;
            int v65 = *(unsigned __int8 *)(v42 + v59 + 512);
            if (v64 < v65) {
              int v65 = v64;
            }
            v62[2 * v65] |= v61;
            v60 *= 2;
            ++v59;
          }
          while (v58 != v59);
        }
      }
      ++v40;
      v42 += 624;
    }
    while (v40 != v8);
LABEL_56:
    if ((int)v8 >= 1)
    {
      int v66 = 0;
      uint64_t v67 = 0;
      int v68 = 0;
      unint64_t v69 = v100 >> 1;
      uint64_t v101 = v128;
      uint64_t v70 = v103 + 2 * v69 * v128;
      uint64_t v71 = v136;
      uint64_t v72 = *(void *)(v71 + 4432) + 4 * v105 * (uint64_t)v122 * *(void *)(v71 + 3432);
      uint64_t v73 = (unsigned __int16 *)(v111 + 1348 * (int)v109 + 6);
      while (1)
      {
        int v74 = *(_DWORD *)(v71 + 3440);
        if (v74 - 32 * (int)v67 < 1) {
          goto LABEL_71;
        }
        uint64_t v123 = v73;
        uint64_t v126 = v67;
        uint64_t v75 = 0;
        uint64_t v76 = 0;
        uint64_t v77 = *(void *)(v71 + 3432);
        uint64_t v78 = *(void *)(v71 + 2144);
        uint64_t v79 = *(void *)(v71 + 3280);
        int v129 = v66;
        if (v74 + v66 >= 32) {
          uint64_t v80 = 32;
        }
        else {
          uint64_t v80 = (v74 + v66);
        }
        do
        {
          if (!(v68 | v76)) {
            goto LABEL_69;
          }
          if (v134)
          {
            int v139 = *(v73 - 2);
            int v140 = *v73;
            int v81 = v73[2];
LABEL_67:
            int v141 = v81;
            goto LABEL_68;
          }
          int v82 = *(v73 - 3);
          int v139 = v82;
          int v83 = *(v73 - 1);
          int v140 = v83;
          int v84 = v73[1];
          int v141 = v84;
          if ((int)v131 >= 17)
          {
            int v139 = v82 | (*(v73 - 2) << 16);
            int v140 = v83 | (*v73 << 16);
            int v81 = v84 | (v73[2] << 16);
            goto LABEL_67;
          }
LABEL_68:
          int v142 = 0;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, void, void))(v79 + 3264))(v70 + 2 * (v75 & 0xFFFFFFFC), v78, &v139, v72 + v75, v77, v136 + 4496, v137, *(unsigned int *)(v136 + 4324));
LABEL_69:
          ++v76;
          v75 += 4;
          v73 += 6;
        }
        while (v80 != v76);
        uint64_t v71 = v136;
        LODWORD(v8) = *(_DWORD *)(v136 + 3456);
        int v66 = v129;
        uint64_t v73 = v123;
        uint64_t v67 = v126;
LABEL_71:
        ++v67;
        v70 += 256;
        v72 += 128;
        v66 -= 32;
        v73 += 674;
        int v68 = 1;
        if (v67 >= (int)v8)
        {
          uint64_t v2 = *(void *)(v71 + 24);
          uint64_t v39 = v101;
          goto LABEL_74;
        }
      }
    }
  }
  uint64_t v71 = v136;
LABEL_74:
  if (*(unsigned char *)(v2 + 832))
  {
    if ((int)v8 < 1) {
      return result;
    }
    goto LABEL_81;
  }
  if (*(unsigned char *)(v2 + 833)) {
    BOOL v85 = (int)v8 <= 0;
  }
  else {
    BOOL v85 = 1;
  }
  if (!v85)
  {
LABEL_81:
    uint64_t v86 = 0;
    uint64_t v87 = 0;
    int v135 = 0;
    uint64_t v88 = ((v106 >> 1) * v39) >> v118;
    uint64_t v102 = v107 + 2 * v88;
    uint64_t v104 = v116 + 2 * v88;
    uint64_t v132 = *(void *)(v71 + 4432) + 4 * *(void *)(v71 + 3432) * (v117 >> v118);
    unsigned int v119 = v120 >> v118;
    char v89 = (unsigned __int16 *)(v111 + 1348 * (int)v109 + 774);
    uint64_t v90 = v71 + 4496;
    uint64_t v91 = v114 - v119;
    while (1)
    {
      int v92 = *(_DWORD *)(v71 + 3440) - 32 * v86;
      if (v92 >= 32) {
        int v92 = 32;
      }
      int v93 = (v92 + v113) >> v113;
      if (v93 >= 1) {
        break;
      }
LABEL_95:
      ++v86;
      v87 += 0x80u >> v113;
      v132 += 4 * (0x20u >> v113);
      v89 += 674;
      int v135 = 1;
      if (v86 >= (int)v8) {
        return result;
      }
    }
    uint64_t v112 = v86;
    uint64_t v94 = 0;
    int v95 = 0;
    uint64_t v127 = *(void *)(v71 + 2152);
    uint64_t v130 = *(void *)(v71 + 3432);
    uint64_t v133 = 4 * v93;
    char v108 = v89;
    uint64_t v138 = *(void *)(v71 + 3280);
    uint64_t v110 = v87;
    uint64_t v121 = v102 + 2 * v87;
    uint64_t v124 = v104 + 2 * v87;
    while (!(v135 | v95))
    {
LABEL_93:
      ++v95;
      v94 += 4;
      v89 += 4;
      if (v133 == v94)
      {
        uint64_t v71 = v136;
        LODWORD(v8) = *(_DWORD *)(v136 + 3456);
        uint64_t v87 = v110;
        uint64_t v86 = v112;
        char v89 = v108;
        goto LABEL_95;
      }
    }
    if (v119)
    {
      int v139 = *(v89 - 2);
      int v96 = *v89;
    }
    else
    {
      int v97 = *(v89 - 3);
      int v139 = v97;
      int v98 = *(v89 - 1);
      int v140 = v98;
      if (v115 >= (int)v114)
      {
LABEL_92:
        int v141 = 0;
        uint64_t v99 = (2 * v94) & 0x1FFFFFFF8;
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, void))(v138 + 3280))(v124 + v99, v127, &v139, v132 + v94 + 2, v130, v90, v91, *(unsigned int *)(v136 + 4324));
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, void))(v138 + 3280))(v121 + v99, v127, &v139, v132 + v94 + 3, v130, v90, v91, *(unsigned int *)(v136 + 4324));
        goto LABEL_93;
      }
      int v139 = (*(v89 - 2) << v115) | v97;
      int v96 = (*v89 << v115) | v98;
    }
    int v140 = v96;
    goto LABEL_92;
  }
  return result;
}

_DWORD *sub_224AF58A4(_DWORD *result, int a2)
{
  uint64_t v2 = (uint64_t)result;
  uint64_t v142 = *MEMORY[0x263EF8340];
  int v101 = 4 * a2;
  int v3 = 4 * a2 * result[868];
  int v4 = result[542];
  uint64_t v104 = *((void *)result + 663) + 2 * (*((void *)result + 268) >> 1) * v3;
  uint64_t v5 = ((*((uint64_t *)result + 269) >> 1) * v3) >> (v4 == 1);
  uint64_t v102 = *((void *)result + 664) + 2 * v5;
  uint64_t v103 = *((void *)result + 665) + 2 * v5;
  uint64_t v6 = *((void *)result + 1);
  int v7 = *(unsigned char *)(v6 + 392) == 0;
  uint64_t v133 = (uint64_t)result;
  if ((*(unsigned char *)(*((void *)result + 407) + 63080) & 1) == 0) {
    goto LABEL_38;
  }
  uint64_t v111 = *((void *)result + 555);
  int v8 = result[864];
  uint64_t v9 = (unsigned char *)*((void *)result + 3);
  if (!v9[830] && !v9[831]) {
    goto LABEL_38;
  }
  int v10 = (a2 >> v7) * v8;
  BOOL v135 = a2 > 0;
  uint64_t v11 = 0x20u >> v7;
  int v110 = v4 != 3;
  int v108 = v11 * a2;
  signed int v12 = result[861] - v11 * a2;
  int v117 = v12;
  if (v12 >= (int)v11) {
    signed int v12 = 0x20u >> v7;
  }
  BOOL v42 = v4 == 1;
  char v13 = v4 == 1;
  unsigned int v14 = v7 & a2;
  unsigned int v115 = 16 * (v7 & a2);
  signed int v113 = v12;
  unsigned int v15 = v12 + v115;
  if (v42) {
    ++v15;
  }
  if (v8 >= 1)
  {
    unsigned int v100 = v15;
    char v106 = v13;
    uint64_t v16 = 0;
    int v107 = v10;
    uint64_t v126 = result + 1124;
    uint64_t v17 = 1348 * v10 + 192 * v14 + v111 + 394;
    uint64_t v18 = *((void *)result + 554) + 4 * *((void *)result + 429) * a2 * v11 + 1;
    uint64_t v19 = v104;
    do
    {
      int v20 = *(_DWORD *)(v2 + 3440) - 32 * v16;
      if (v20 >= 32) {
        int v20 = 32;
      }
      unsigned int v129 = v20;
      if (v117 >= 1)
      {
        uint64_t v122 = v17;
        uint64_t v124 = v16;
        uint64_t v21 = *(void *)(v2 + 3432);
        uint64_t v22 = *(void *)(v2 + 2144);
        uint64_t v118 = v19;
        uint64_t v120 = v18;
        uint64_t v23 = *(void *)(v2 + 3280);
        unsigned int v24 = v115;
        uint64_t v25 = v19;
        signed int v26 = v113;
        do
        {
          if (v24 | v135)
          {
            int v138 = *(_DWORD *)(v17 - 10);
            int v139 = *(_DWORD *)(v17 - 6);
            int v140 = *(_DWORD *)(v17 - 2);
            int v141 = 0;
            uint64_t result = (_DWORD *)(*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, uint64_t, _DWORD *, void, void))(v23 + 3272))(v25, v22, &v138, v18, v21, v126, v129, *(unsigned int *)(v133 + 4324));
          }
          v17 += 12;
          v25 += 4 * v22;
          ++v24;
          v18 += 4 * v21;
          --v26;
        }
        while (v26);
        uint64_t v2 = v133;
        int v8 = *(_DWORD *)(v133 + 3456);
        uint64_t v17 = v122;
        uint64_t v16 = v124;
        uint64_t v19 = v118;
        uint64_t v18 = v120;
      }
      ++v16;
      v19 += 256;
      v17 += 1348;
      v18 += 128;
    }
    while (v16 < v8);
    uint64_t v9 = *(unsigned char **)(v2 + 24);
    int v10 = v107;
    char v13 = v106;
    unsigned int v15 = v100;
  }
  if (!v9[832])
  {
    if (v9[833]) {
      BOOL v27 = v8 <= 0;
    }
    else {
      BOOL v27 = 1;
    }
    if (v27) {
      goto LABEL_37;
    }
LABEL_27:
    uint64_t v28 = 0;
    signed int v130 = v15 >> v13;
    signed int v29 = v115 >> v13;
    unsigned int v119 = 0x10u >> v110;
    uint64_t v30 = *(void *)(v2 + 4432) + 4 * *(void *)(v2 + 3432) * (v108 >> v13) + 2;
    uint64_t v31 = 4 * (0x20u >> v110);
    unsigned int v32 = (unsigned __int16 *)(1348 * v10 + 8 * (v115 >> v13) + v111 + 1030);
    uint64_t v33 = 2 * (0x80u >> v110);
    uint64_t v121 = v103;
    uint64_t v123 = v102;
    unsigned int v109 = v115 >> v13;
    uint64_t v34 = v2 + 4496;
    do
    {
      int v35 = *(_DWORD *)(v2 + 3440) - 32 * v28;
      if (v35 >= 32) {
        int v35 = 32;
      }
      if (v29 < v130)
      {
        uint64_t v116 = v28;
        uint64_t v36 = 0;
        uint64_t v37 = *(void *)(v2 + 3432);
        uint64_t v38 = *(void *)(v2 + 2152);
        uint64_t v39 = ((v35 + v110) >> v110);
        uint64_t v40 = *(void *)(v2 + 3280);
        uint64_t v112 = v32;
        uint64_t v114 = v30;
        do
        {
          if (v29 | v135)
          {
            int v138 = (*(v32 - 2) << v119) | *(v32 - 3);
            int v139 = (*v32 << v119) | *(v32 - 1);
            int v140 = 0;
            (*(void (**)(uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, void))(v40 + 3288))(v123 + v36, v38, &v138, v30, v37, v34, v39, *(unsigned int *)(v133 + 4324));
            uint64_t result = (_DWORD *)(*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, void))(v40 + 3288))(v121 + v36, v38, &v138, v30 + 1, v37, v34, v39, *(unsigned int *)(v133 + 4324));
          }
          ++v29;
          v30 += 4 * v37;
          v32 += 4;
          v36 += 4 * v38;
        }
        while (v130 != v29);
        uint64_t v2 = v133;
        int v8 = *(_DWORD *)(v133 + 3456);
        uint64_t v30 = v114;
        uint64_t v28 = v116;
        signed int v29 = v109;
        uint64_t v33 = 2 * (0x80u >> v110);
        uint64_t v31 = 4 * (0x20u >> v110);
        unsigned int v32 = v112;
      }
      ++v28;
      v30 += v31;
      v32 += 674;
      v121 += v33;
      v123 += v33;
    }
    while (v28 < v8);
    goto LABEL_37;
  }
  if (v8 >= 1) {
    goto LABEL_27;
  }
LABEL_37:
  uint64_t v6 = *(void *)(v2 + 8);
LABEL_38:
  int v41 = *(_DWORD *)(v2 + 5352);
  if (*(unsigned char *)(v6 + 414)) {
    BOOL v42 = 0;
  }
  else {
    BOOL v42 = v41 == 0;
  }
  int v43 = a2;
  if (!v42)
  {
    unsigned int v44 = *(_DWORD *)(*(void *)(v2 + 3256) + 24);
    uint64_t v45 = *(void *)(v2 + 24);
    int v46 = *(_DWORD *)(v45 + 236);
    int v47 = *(_DWORD *)(v45 + 240);
    uint64_t v48 = 8 * (a2 != 0);
    if (v44 <= 1) {
      int v49 = 0;
    }
    else {
      int v49 = a2;
    }
    char v50 = *(unsigned char *)(v6 + 392);
    int v51 = (4 << v50) * v49;
    uint64_t v52 = *(void *)(v2 + 5264);
    uint64_t v53 = v51;
    unint64_t v54 = *(void *)(v2 + 2416);
    uint64_t v55 = *(void *)(v2 + 5272);
    unint64_t v56 = *(void *)(v2 + 2424);
    uint64_t v57 = *(void *)(v2 + 5280);
    if (*(unsigned char *)(v6 + 414) || (v41 & 1) != 0)
    {
      unint64_t v131 = *(void *)(v2 + 2424);
      uint64_t v136 = *(void *)(v2 + 5280);
      uint64_t v58 = v2;
      int v59 = *(_DWORD *)(v2 + 2164);
      unsigned int v60 = 4 * *(_DWORD *)(v58 + 3448);
      char v61 = v50 + 6;
      if ((a2 + 1) << (v50 + 6) >= v59 - 1) {
        int v62 = v59 - 1;
      }
      else {
        int v62 = (a2 + 1) << (v50 + 6);
      }
      int v63 = (a2 << v61) - v48;
      if ((v41 & 1) != 0 || v46 == v47)
      {
        int v127 = v47;
        uint64_t v64 = v55;
        unsigned int v65 = v44;
        uint64_t result = sub_224AD3FDC((_DWORD *)v133, (char *)(v52 + 2 * (v54 >> 1) * v53), v54, v104 - 2 * (*(void *)(v133 + 2144) >> 1) * v48, *(void *)(v133 + 2144), 0, v50, (a2 << v61) - (int)v48, v62, v60, v59, 0, 1);
        unsigned int v44 = v65;
        uint64_t v55 = v64;
        int v43 = a2;
        uint64_t v6 = *(void *)(v133 + 8);
        int v47 = v127;
      }
      if (v44 < 2 || v46 == v47)
      {
        uint64_t v2 = v133;
      }
      else
      {
        int v95 = v59;
        uint64_t v2 = v133;
        int v66 = v63;
        unsigned int v67 = v44;
        uint64_t result = sub_224AD3FDC((_DWORD *)v133, (char *)(*(void *)(v133 + 5240) + 2 * (*(uint64_t *)(v133 + 2144) >> 1) * v101), *(void *)(v133 + 2144), v104 - 2 * (*(uint64_t *)(v133 + 2144) >> 1) * v48, *(void *)(v133 + 2144), 0, *(unsigned char *)(v6 + 392), v66, v62, v60, v95, 0, 0);
        unsigned int v44 = v67;
        int v43 = a2;
        uint64_t v6 = *(void *)(v133 + 8);
      }
      uint64_t v57 = v136;
      unint64_t v56 = v131;
    }
    if ((*(unsigned char *)(v6 + 414) || (v41 & 6) != 0) && *(_DWORD *)(v2 + 2168))
    {
      uint64_t v68 = v55;
      unint64_t v69 = (v56 >> 1) * v53;
      int v70 = *(_DWORD *)(v2 + 2440);
      unsigned int v71 = v70 != 3;
      if (v70 == 3) {
        char v72 = 2;
      }
      else {
        char v72 = 1;
      }
      BOOL v73 = v70 == 1;
      char v74 = v70 == 1;
      int v75 = *(_DWORD *)(v2 + 2164);
      if (v73) {
        ++v75;
      }
      int v76 = v75 >> v74;
      unsigned int v137 = *(_DWORD *)(v2 + 3448) << v72;
      if (v73) {
        char v77 = 5;
      }
      else {
        char v77 = 6;
      }
      char v78 = *(unsigned char *)(v6 + 392);
      char v79 = v77 + v78;
      int v80 = (v43 + 1) << v79;
      if (v80 >= v76 - 1) {
        int v80 = v76 - 1;
      }
      int v132 = v80;
      uint64_t v81 = v48 >> v74;
      int v134 = (v43 << v79) - v81;
      uint64_t v82 = *(void *)(v2 + 2152);
      uint64_t v128 = (v82 >> 1) * v101;
      if (*(unsigned char *)(v6 + 414) || (v41 & 2) != 0)
      {
        uint64_t v125 = v81;
        if ((v41 & 2) != 0 || v46 == v47)
        {
          uint64_t v83 = v102 - 2 * (v82 >> 1) * v81;
          unsigned int v98 = v71;
          int v96 = v76;
          unsigned int v84 = v44;
          int v85 = v76;
          unsigned int v86 = v71;
          unint64_t v87 = v69;
          uint64_t result = sub_224AD3FDC((_DWORD *)v2, (char *)(v68 + 2 * v69), *(void *)(v2 + 2424), v83, v82, v74, v78, v134, v80, v137, v96, v98, 1);
          unint64_t v69 = v87;
          unsigned int v71 = v86;
          int v76 = v85;
          uint64_t v81 = v125;
          unsigned int v44 = v84;
          uint64_t v6 = *(void *)(v2 + 8);
        }
        if (v44 >= 2 && v46 != v47)
        {
          unint64_t v88 = *(void *)(v2 + 2152);
          uint64_t v89 = v102 - 2 * (v88 >> 1) * v81;
          unsigned int v99 = v71;
          int v97 = v76;
          unsigned int v90 = v44;
          int v91 = v76;
          unsigned int v92 = v71;
          unint64_t v93 = v69;
          uint64_t result = sub_224AD3FDC((_DWORD *)v2, (char *)(*(void *)(v2 + 5248) + 2 * v128), v88, v89, v88, v74, *(unsigned char *)(v6 + 392), v134, v132, v137, v97, v99, 0);
          unint64_t v69 = v93;
          unsigned int v71 = v92;
          int v76 = v91;
          uint64_t v81 = v125;
          unsigned int v44 = v90;
          uint64_t v6 = *(void *)(v2 + 8);
        }
      }
      if (*(unsigned char *)(v6 + 414) || (v41 & 4) != 0)
      {
        if ((v41 & 4) != 0 || v46 == v47)
        {
          unsigned int v94 = v44;
          uint64_t result = sub_224AD3FDC((_DWORD *)v2, (char *)(v57 + 2 * v69), *(void *)(v2 + 2424), v103 - 2 * (*(void *)(v2 + 2152) >> 1) * v81, *(void *)(v2 + 2152), v74, *(unsigned char *)(v6 + 392), v134, v132, v137, v76, v71, 1);
          unsigned int v44 = v94;
        }
        if (v44 >= 2 && v46 != v47) {
          return sub_224AD3FDC((_DWORD *)v2, (char *)(*(void *)(v2 + 5256) + 2 * v128), *(void *)(v2 + 2152), v103 - 2 * (*(void *)(v2 + 2152) >> 1) * v81, *(void *)(v2 + 2152), v74, *(unsigned char *)(*(void *)(v2 + 8) + 392), v134, v132, v137, v76, v71, 0);
        }
      }
    }
  }
  return result;
}

uint64_t sub_224AF61A4(uint64_t result, int a2)
{
  v24[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(result + 8);
  if ((*(unsigned char *)(*(void *)(v2 + 3256) + 63080) & 2) != 0)
  {
    uint64_t v4 = result;
    int v5 = *(_DWORD *)(v2 + 3472);
    int v6 = v5 * a2;
    char v7 = *(_DWORD *)(v2 + 2168) == 1;
    uint64_t v8 = 4 * v5 * a2;
    uint64_t v9 = *(uint64_t *)(v2 + 2144) >> 1;
    uint64_t v10 = *(void *)(v2 + 5304) + 2 * v9 * v8;
    uint64_t v11 = *(void *)(v2 + 2152);
    uint64_t v12 = ((v11 >> 1) * v8) >> v7;
    uint64_t v13 = *(void *)(v2 + 5312) + 2 * v12;
    v24[0] = v10;
    v24[1] = v13;
    uint64_t v14 = *(void *)(v2 + 5320) + 2 * v12;
    v24[2] = v14;
    uint64_t v15 = *(void *)(v2 + 4440);
    char v16 = *(unsigned char *)(*(void *)(v2 + 8) + 392) == 0;
    int v17 = *(_DWORD *)(v2 + 3456);
    uint64_t v18 = v15 + 1348 * (a2 >> v16) * v17;
    if (a2)
    {
      uint64_t v19 = (4 * v11) >> v7;
      v23[0] = v10 - 16 * v9;
      v23[1] = v13 - 2 * v19;
      v23[2] = v14 - 2 * v19;
      sub_224AFAE3C(result, v23, v15 + 1348 * ((a2 - 1) >> v16) * v17, v6 - 2, v6, 1, a2);
    }
    if (a2 + 1 >= *(_DWORD *)(v2 + 3464)) {
      int v20 = 0;
    }
    else {
      int v20 = -2;
    }
    int v21 = v6 + v5 + v20;
    if (v21 >= *(_DWORD *)(v2 + 3452)) {
      int v22 = *(_DWORD *)(v2 + 3452);
    }
    else {
      int v22 = v21;
    }
    return sub_224AFAE3C(v4, v24, v18, v6, v22, 0, a2);
  }
  return result;
}

uint64_t sub_224AF6330(uint64_t a1, int a2)
{
  unint64_t v3 = 0;
  v15[6] = *MEMORY[0x263EF8340];
  int v4 = *(_DWORD *)(a1 + 2168);
  uint64_t v5 = 4 * a2 * *(_DWORD *)(a1 + 3472);
  uint64_t v6 = ((*(uint64_t *)(a1 + 2152) >> 1) * v5) >> (v4 == 1);
  uint64_t v7 = *(void *)(a1 + 5312) + 2 * v6;
  v15[3] = *(void *)(a1 + 5304) + 2 * (*(void *)(a1 + 2144) >> 1) * v5;
  v15[4] = v7;
  v15[5] = *(void *)(a1 + 5320) + 2 * v6;
  uint64_t v8 = *(void *)(a1 + 5328) + 2 * (*(void *)(a1 + 2416) >> 1) * v5;
  uint64_t v9 = ((*(uint64_t *)(a1 + 2424) >> 1) * v5) >> (v4 == 1);
  uint64_t v10 = *(void *)(a1 + 5336) + 2 * v9;
  v15[0] = v8;
  v15[1] = v10;
  v15[2] = *(void *)(a1 + 5344) + 2 * v9;
  unsigned int v11 = 8 * (a2 != 0);
  do
  {
    if (v3) {
      char v12 = *(_DWORD *)(a1 + 2168) == 1;
    }
    else {
      char v12 = 0;
    }
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 3280) + 672))(v15[v3] - 2
                                                                                          * (*(void *)(a1 + 8 * (v3 != 0) + 2416) >> 1)
                                                                                          * (v11 >> v12));
    if (!v4) {
      break;
    }
  }
  while (v3++ < 2);
  return result;
}

uint64_t sub_224AF6544(uint64_t result, int a2)
{
  if ((*(unsigned char *)(*(void *)(result + 3256) + 63080) & 4) != 0)
  {
    uint64_t v3 = result;
    char v4 = *(_DWORD *)(result + 2168) == 1;
    uint64_t v5 = 4 * a2 * *(_DWORD *)(result + 3472);
    uint64_t v6 = *(void *)(result + 5336);
    uint64_t v7 = *(void *)(result + 2424);
    uint64_t v32 = *(void *)(result + 5344);
    uint64_t v8 = 8 * (a2 != 0);
    int v9 = *(_DWORD *)(result + 5352);
    int v10 = a2 + 1;
    int v11 = *(_DWORD *)(result + 3464);
    if (v9)
    {
      int v12 = *(_DWORD *)(result + 2436);
      if (v10 >= v11) {
        int v13 = 0;
      }
      else {
        int v13 = -8;
      }
      int v14 = (v10 << (*(unsigned char *)(*(void *)(result + 8) + 392) + 6)) + v13;
      if (v14 >= v12) {
        uint64_t v15 = v12;
      }
      else {
        uint64_t v15 = v14;
      }
      uint64_t result = sub_224AFB9E4(result, *(void *)(result + 5328)+ 2 * (*(uint64_t *)(result + 2416) >> 1) * v5- 2 * (*(uint64_t *)(result + 2416) >> 1) * v8, (a2 << (*(unsigned char *)(*(void *)(result + 8) + 392) + 6)) - (int)v8, *(_DWORD *)(result + 2432), v12, v15, 0);
    }
    if ((v9 & 6) != 0)
    {
      uint64_t v16 = ((v7 >> 1) * v5) >> v4;
      int v17 = *(_DWORD *)(v3 + 2440);
      char v18 = v17 != 3;
      int v19 = *(_DWORD *)(v3 + 2432);
      if (v17 != 3) {
        ++v19;
      }
      char v20 = v17 == 1;
      int v21 = *(_DWORD *)(v3 + 2436);
      if (v20) {
        ++v21;
      }
      int v22 = v21 >> v20;
      int v23 = v19 >> v18;
      if (v20) {
        char v24 = 5;
      }
      else {
        char v24 = 6;
      }
      char v25 = v24 + *(unsigned char *)(*(void *)(v3 + 8) + 392);
      unsigned int v26 = 8u >> v20;
      if (v10 >= v11) {
        unsigned int v26 = 0;
      }
      int v27 = (v10 << v25) - v26;
      if (v27 >= v22) {
        uint64_t v28 = v22;
      }
      else {
        uint64_t v28 = v27;
      }
      uint64_t v29 = v8 >> v20;
      int v30 = (a2 << v25) - v29;
      if ((v9 & 2) != 0) {
        uint64_t result = sub_224AFB9E4(v3, v6 + 2 * v16 - 2 * (*(void *)(v3 + 2424) >> 1) * v29, v30, v23, v22, v28, 1);
      }
      if ((v9 & 4) != 0)
      {
        uint64_t v31 = v32 + 2 * v16 - 2 * (*(void *)(v3 + 2424) >> 1) * v29;
        return sub_224AFB9E4(v3, v31, v30, v23, v22, v28, 2);
      }
    }
  }
  return result;
}

uint64_t sub_224AF6760(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  sub_224AF4F78(a1, a2);
  uint64_t result = (uint64_t)sub_224AF58A4((_DWORD *)a1, v2);
  if (*(unsigned char *)(*(void *)(a1 + 8) + 414)) {
    uint64_t result = sub_224AF61A4(*(void *)(*(void *)(a1 + 3256) + 16), v2);
  }
  if (*(_DWORD *)(*(void *)(a1 + 24) + 236) != *(_DWORD *)(*(void *)(a1 + 24) + 240)) {
    uint64_t result = sub_224AF6330(a1, v2);
  }
  if (*(_DWORD *)(a1 + 5352))
  {
    return sub_224AF6544(a1, v2);
  }
  return result;
}

void *sub_224AF67F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = *(_DWORD *)(a1 + 28);
  int v5 = (*(_DWORD *)(v2 + 3456) * (v4 >> *(_DWORD *)(v2 + 3468))) << 7;
  uint64_t v6 = *(int *)(v3 + 13864);
  uint64_t result = memcpy((void *)(*(void *)(v2 + 3408) + 2 * (v5 + 4 * (int)v6)), (const void *)(*(void *)(v2 + 2120)+ 8 * v6+ 2 * (*(void *)(v2 + 2144) >> 1) * (4 * (*(_DWORD *)(v2 + 3472) + v4) - 1)), 8 * (*(_DWORD *)(v3 + 13868) - (int)v6));
  int v8 = *(_DWORD *)(v2 + 2168);
  if (v8)
  {
    uint64_t v9 = 0;
    char v10 = v8 == 1;
    BOOL v11 = v8 == 3;
    int v12 = *(_DWORD *)(v2 + 3472) + *(_DWORD *)(a1 + 28);
    char v13 = !v11;
    int v14 = (4 * (int)v6) >> v13;
    uint64_t v15 = (*(uint64_t *)(v2 + 2152) >> 1) * (((4 * v12) >> v10) - 1) + v14;
    uint64_t v16 = v14 + v5;
    do
    {
      uint64_t result = memcpy((void *)(*(void *)(v2 + v9 + 3416) + 2 * v16), (const void *)(*(void *)(v2 + v9 + 2128) + 2 * v15), 2 * ((4 * (*(_DWORD *)(v3 + 13868) - (int)v6)) >> v13));
      v9 += 8;
    }
    while (v9 != 16);
  }
  return result;
}

__n128 sub_224AF6930(__n128 *a1, int a2, int a3, int a4, int a5)
{
  if (a1[16160].n128_u32[1]) {
    int v5 = (__n128 *)(*(void *)(a1->n128_u64[1] + 4376)
  }
                  + 48
                  * ((*(uint64_t *)(a1->n128_u64[1] + 3432) >> 1) * ((a1[1].n128_u32[2] & 1) + (a1[1].n128_i32[3] >> 1))
                   + (a1[1].n128_u32[3] & 1)
                   + (a1[1].n128_i32[2] >> 1)));
  else {
    int v5 = a1 + 1641;
  }
  if (a4 >= 1)
  {
    uint64_t v6 = a4;
    uint64_t v7 = &a1[3 * a2 + 320];
    do
    {
      __n128 result = *v5;
      *uint64_t v7 = *v5;
      v7 += 3;
      --v6;
    }
    while (v6);
  }
  if (a5 >= 1)
  {
    uint64_t v9 = a5;
    char v10 = &a1[3 * a3 + 416];
    do
    {
      __n128 result = *v5;
      __n128 *v10 = *v5;
      v10 += 3;
      --v9;
    }
    while (v9);
  }
  return result;
}

uint64_t sub_224AF69E0(uint64_t result, int a2, int a3, int a4, int a5)
{
  if (*(_DWORD *)(result + 258564)) {
    uint64_t v5 = *(void *)(*(void *)(result + 8) + 4376)
  }
       + 48
       * ((*(uint64_t *)(*(void *)(result + 8) + 3432) >> 1)
        * ((*(_DWORD *)(result + 24) & 1) + (*(int *)(result + 28) >> 1))
        + (*(_DWORD *)(result + 28) & 1)
        + (*(int *)(result + 24) >> 1));
  else {
    uint64_t v5 = result + 26256;
  }
  char v6 = 0;
  uint64_t v7 = 1;
  do
  {
    char v8 = v6;
    if (a4 >= 1)
    {
      uint64_t v9 = a4;
      char v10 = (_OWORD *)(result + 48 * a2 + 5120 + 16 * v7);
      do
      {
        _OWORD *v10 = *(_OWORD *)(v5 + 16 * v7);
        v10 += 3;
        --v9;
      }
      while (v9);
    }
    if (a5 >= 1)
    {
      BOOL v11 = (_OWORD *)(v5 + 16 * v7);
      uint64_t v12 = a5;
      char v13 = (_OWORD *)(result + 48 * a3 + 6656 + 16 * v7);
      do
      {
        *char v13 = *v11;
        v13 += 3;
        --v12;
      }
      while (v12);
    }
    char v6 = 1;
    uint64_t v7 = 2;
  }
  while ((v8 & 1) == 0);
  return result;
}

void sub_224AF6ABC(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = a3;
  sub_224AADB30(*(void *)(a1 + 16) + 13824, (int8x16_t *)(*(void *)(a1 + 16) + 112 * a3 + 16 * a4 + 3552), 6);
  *(unsigned char *)(a2 + a3 + 11) = v13 + 2;
  uint64_t v14 = a1 + a6;
  uint64_t v15 = (unsigned __int8 *)(v14 + 8224);
  uint64_t v16 = (unsigned __int8 *)(v14 + 624);
  if (a3) {
    uint64_t v16 = v15;
  }
  int v17 = *v16;
  if ((a6 & 0xF) != 0)
  {
    int v18 = a5;
    if (a3) {
      int v19 = *(unsigned __int8 *)(a1 + a5 + 0x2000);
    }
    else {
      int v19 = *(unsigned __int8 *)(*(void *)(a1 + 656) + a5 + 592);
    }
  }
  else
  {
    int v19 = 0;
    int v18 = a5;
  }
  int v20 = 0;
  int v21 = (unsigned __int16 *)(a1 + 5120 + 48 * a6 + 16 * v12 + 1536);
  int v22 = (unsigned __int16 *)(a1 + 5120 + 48 * v18 + 16 * v12);
  BOOL v23 = v17 != 0;
  BOOL v24 = v19 != 0;
  if (v17 && v19)
  {
    int v20 = 0;
    do
    {
      unsigned int v25 = *v21;
      unsigned int v26 = *v22;
      if (v25 >= v26)
      {
        unsigned int v27 = v26 == v25;
        if (!v20 || (unsigned __int16)__src[v20 + 7] != v26) {
          __src[v20++ + 8] = v26;
        }
        v17 -= v27;
        ++v22;
        --v19;
        v21 += v27;
      }
      else
      {
        if (!v20 || (unsigned __int16)__src[v20 + 7] != v25) {
          __src[v20++ + 8] = v25;
        }
        ++v21;
        --v17;
      }
      BOOL v23 = v17 != 0;
      BOOL v24 = v19 != 0;
    }
    while (v17 && v19);
  }
  uint64_t v28 = (v13 + 2);
  uint64_t v71 = v12;
  uint64_t v29 = v11;
  if (v23)
  {
    int v30 = v17 + 1;
    do
    {
      int v31 = *v21;
      if (!v20 || (unsigned __int16)__src[v20 + 7] != v31) {
        __src[v20++ + 8] = v31;
      }
      ++v21;
      --v30;
    }
    while (v30 > 1);
  }
  else if (v24)
  {
    int v32 = v19 + 1;
    do
    {
      int v33 = *v22;
      if (!v20 || (unsigned __int16)__src[v20 + 7] != v33) {
        __src[v20++ + 8] = v33;
      }
      ++v22;
      --v32;
    }
    while (v32 > 1);
  }
  int v34 = 0;
  BOOL v35 = v28 != 0;
  if (v20 >= 1 && v13 != -2)
  {
    unint64_t v36 = 0;
    int v34 = 0;
    unint64_t v37 = v20;
    do
    {
      sub_224AADE84();
      if (v38) {
        __src[v34++] = __src[v36 + 8];
      }
      ++v36;
      BOOL v35 = v34 < (int)v28;
    }
    while (v36 < v37 && v34 < (int)v28);
  }
  if (*(_DWORD *)(a1 + 258564)) {
    uint64_t v39 = *(void *)(v29 + 4376)
  }
        + 48
        * ((*(uint64_t *)(v29 + 3432) >> 1) * ((*(_DWORD *)(a1 + 24) & 1) + (*(int *)(a1 + 28) >> 1))
         + (*(_DWORD *)(a1 + 28) & 1)
         + (*(int *)(a1 + 24) >> 1));
  else {
    uint64_t v39 = a1 + 26256;
  }
  uint64_t v40 = (_WORD *)(v39 + 16 * v71);
  if (v35)
  {
    int v41 = a3;
    int v42 = *(_DWORD *)(v29 + 2172);
    if (v42)
    {
      unsigned __int16 v43 = 0;
      int v44 = v42;
      do
      {
        --v44;
        sub_224AADE84();
        unsigned __int16 v43 = v45 | (2 * v43);
      }
      while (v44);
    }
    else
    {
      unsigned __int16 v43 = 0;
    }
    LODWORD(v46) = v34 + 1;
    v40[v34] = v43;
    if (v34 + 1 < (int)v28)
    {
      char v72 = v40;
      int v47 = 0;
      int v48 = -2;
      do
      {
        sub_224AADE84();
        int v47 = v49 | (2 * v47);
        BOOL v50 = __CFADD__(v48++, 1);
      }
      while (!v50);
      BOOL v70 = v41 == 0;
      int v51 = v43;
      int v52 = v42 + v47 - 3;
      int v53 = ~(-1 << v42);
      uint64_t v46 = (int)v46;
      int v54 = v34 + 2;
      while (1)
      {
        int v55 = 0;
        if (v52)
        {
          int v56 = v52;
          do
          {
            --v56;
            sub_224AADE84();
            int v55 = v57 | (2 * v55);
          }
          while (v56);
        }
        unsigned __int16 v58 = v51 + v70 + v55 >= v53 ? v53 : v51 + v70 + v55;
        int v59 = v46 + 1;
        uint64_t v40 = v72;
        v72[v46] = v58;
        unsigned int v60 = v70 + v58;
        BOOL v50 = v53 >= v60;
        unsigned int v61 = v53 - v60;
        if (v61 == 0 || !v50) {
          break;
        }
        int v51 = v58;
        signed int v62 = 32 - __clz(v61);
        if (v52 >= v62) {
          int v52 = v62;
        }
        ++v54;
        ++v46;
        if (v59 == v28) {
          goto LABEL_72;
        }
      }
      if (v59 < (int)v28)
      {
        uint64_t v63 = v54;
        do
          v72[v63++] = v53;
        while (v63 < v28);
      }
    }
LABEL_72:
    if (v28)
    {
      int v64 = 0;
      unsigned int v65 = v40;
      uint64_t v66 = v28;
      int v67 = v34;
      while (v64 < v34)
      {
        unsigned int v68 = (unsigned __int16)__src[v64];
        if (v67 < (int)v28)
        {
          unsigned int v69 = (unsigned __int16)v40[v67];
          if (v68 > v69) {
            goto LABEL_79;
          }
        }
        ++v64;
LABEL_80:
        *v65++ = v68;
        if (!--v66) {
          return;
        }
      }
      LOWORD(v69) = v40[v67];
LABEL_79:
      ++v67;
      LOWORD(v68) = v69;
      goto LABEL_80;
    }
  }
  else
  {
    memcpy((void *)(v39 + 16 * v71), __src, 2 * v34);
  }
}

void sub_224AF6F74(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  sub_224AF6ABC(a1, a2, 1, a3, a4, a5);
  uint64_t v7 = *(void *)(a1 + 8);
  if (*(_DWORD *)(a1 + 258564)) {
    char v8 = (_WORD *)(*(void *)(v7 + 4376)
  }
                 + 48
                 * ((*(uint64_t *)(v7 + 3432) >> 1) * ((*(_DWORD *)(a1 + 24) & 1) + (*(int *)(a1 + 28) >> 1))
                  + (*(_DWORD *)(a1 + 28) & 1)
                  + (*(int *)(a1 + 24) >> 1))
                 + 32);
  else {
    char v8 = (_WORD *)(a1 + 26288);
  }
  int v9 = *(_DWORD *)(v7 + 2172);
  sub_224AADE84();
  if (v10)
  {
    int v11 = 0;
    int v12 = -2;
    do
    {
      sub_224AADE84();
      int v11 = v13 | (2 * v11);
    }
    while (!__CFADD__(v12++, 1));
    __int16 v15 = 0;
    if (v9)
    {
      int v16 = v9;
      do
      {
        --v16;
        sub_224AADE84();
        __int16 v15 = v17 | (2 * v15);
      }
      while (v16);
    }
    *char v8 = v15;
    if (*(unsigned __int8 *)(a2 + 12) >= 2u)
    {
      int v18 = v9 + v11 - 4;
      int v19 = ~(-1 << v9);
      unint64_t v20 = 1;
      do
      {
        if (!v18) {
          goto LABEL_20;
        }
        int v21 = 0;
        int v22 = v18;
        do
        {
          --v22;
          sub_224AADE84();
          int v21 = v23 | (2 * v21);
        }
        while (v22);
        if (v21)
        {
          sub_224AADE84();
          if (v24) {
            int v25 = -v21;
          }
          else {
            LOWORD(v25) = v21;
          }
        }
        else
        {
LABEL_20:
          LOWORD(v25) = 0;
        }
        __int16 v15 = (v25 + v15) & v19;
        v8[v20++] = v15;
      }
      while (v20 < *(unsigned __int8 *)(a2 + 12));
    }
  }
  else if (*(unsigned char *)(a2 + 12))
  {
    unint64_t v26 = 0;
    do
    {
      __int16 v27 = 0;
      if (v9)
      {
        int v28 = v9;
        do
        {
          --v28;
          sub_224AADE84();
          __int16 v27 = v29 | (2 * v27);
        }
        while (v28);
      }
      v8[v26++] = v27;
    }
    while (v26 < *(unsigned __int8 *)(a2 + 12));
  }
}

double sub_224AF7140(uint64_t a1)
{
  unint64_t v1 = (a1 + 7) & 0xFFFFFFFFFFFFFFF8;
  memptr = 0;
  int v2 = malloc_type_posix_memalign(&memptr, 0x40uLL, v1 + 40, 0xE584FBEuLL);
  int v4 = memptr;
  if (v2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = memptr == 0;
  }
  if (!v5)
  {
    char v6 = (void **)((char *)memptr + v1);
    *char v6 = memptr;
    v6[1] = v4;
    *(void *)&double result = 1;
    v6[2] = (void *)1;
    v6[3] = j__free;
    v6[4] = v4;
  }
  return result;
}

double sub_224AF71C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_224AE4B24(a1, (char *)(((a2 + 7) & 0xFFFFFFFFFFFFFFF8) + 40));
  if (v3)
  {
    *((void *)v3 - 5) = *(void *)v3;
    *((void *)v3 - 4) = a1;
    *(void *)&double result = 1;
    *((void *)v3 - 3) = 1;
    *((void *)v3 - 2) = sub_224AF7228;
    *((void *)v3 - 1) = v3;
  }
  return result;
}

void sub_224AF722C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    if (atomic_fetch_add((atomic_uint *volatile)(v1 + 16), 0xFFFFFFFF) == 1)
    {
      int v2 = *(_DWORD *)(v1 + 20);
      (*(void (**)(void, void))(v1 + 24))(*(void *)(v1 + 8), *(void *)(v1 + 32));
      if (v2)
      {
        free((void *)v1);
      }
    }
  }
}

void sub_224AF729C(uint64_t a1)
{
  uint64_t v2 = a1 + 63088;
  sub_224AC7180(a1 + 176);
  if (*(void *)(a1 + 256))
  {
    sub_224AFAD94(a1 + 248);
    *(void *)(a1 + 536) = 0;
  }
  if (*(void *)(a1 + 552))
  {
    sub_224AFAD94(a1 + 544);
    *(void *)(a1 + 832) = 0;
  }
  uint64_t v3 = 0;
  *(_DWORD *)uint64_t v2 = 0;
  uint64_t v4 = 52704;
  *(_DWORD *)(v2 + 64) = 0;
  uint64_t v5 = 50240;
  uint64_t v6 = 50232;
  uint64_t v7 = 50224;
  uint64_t v8 = 49936;
  uint64_t v9 = 49944;
  do
  {
    if (*(void *)(a1 + v9))
    {
      sub_224AFAD94(a1 + v8);
      *(void *)(a1 + v7) = 0;
    }
    sub_224AF722C((uint64_t *)(a1 + v6));
    sub_224AF722C((uint64_t *)(a1 + v5));
    int v10 = (void *)(a1 + v4);
    void *v10 = 0;
    v10[1] = 0;
    sub_224AF722C((uint64_t *)(a1 + 52696 + v3));
    v4 += 24;
    v3 += 24;
    v5 += 344;
    v6 += 344;
    v7 += 344;
    v8 += 344;
    v9 += 344;
  }
  while (v3 != 192);
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 88) = 0;
  sub_224AF722C((uint64_t *)(a1 + 80));
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 160) = 0;
  *(_DWORD *)(a1 + 168) = 0;
  sub_224AF722C((uint64_t *)(a1 + 136));
  sub_224AF722C((uint64_t *)(a1 + 120));
  sub_224AF722C((uint64_t *)(a1 + 152));
  uint64_t v27 = *(void *)(v2 + 56);
  *(_OWORD *)(a1 + 63112) = 0u;
  *(_OWORD *)(a1 + 63128) = 0u;
  *(void *)(a1 + 63144) = 0;
  *(void *)(v2 + 16) = 0x8000000000000000;
  *(void *)(v2 + 32) = -1;
  sub_224AF722C(&v27);
  if (*(_DWORD *)(a1 + 8) != 1 || *(_DWORD *)(a1 + 24) != 1)
  {
    atomic_store(1u, *(unsigned int **)(a1 + 848));
    if (*(_DWORD *)(a1 + 24) >= 2u)
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 896));
      unint64_t v11 = *(unsigned int *)(a1 + 28);
      if (v11)
      {
        for (unint64_t i = 0; i < v11; ++i)
        {
          uint64_t v13 = *(void *)(a1 + 16);
          uint64_t v14 = (_DWORD *)(v13 + 258752 * i + 258712);
          if (!*v14)
          {
            __int16 v15 = (pthread_cond_t *)(v13 + 258752 * i + 258576);
            do
              pthread_cond_wait(v15, (pthread_mutex_t *)(a1 + 896));
            while (!*v14);
            unint64_t v11 = *(unsigned int *)(a1 + 28);
          }
        }
      }
      if (*(_DWORD *)(a1 + 8))
      {
        unint64_t v16 = 0;
        uint64_t v17 = 5672;
        do
        {
          int v18 = (void *)(*(void *)a1 + v17);
          ++v16;
          *(v18 - 12) = 0;
          *(v18 - 11) = 0;
          *((_DWORD *)v18 - 18) = 0;
          *(v18 - 10) = 0;
          *int v18 = 0;
          v18[1] = 0;
          unint64_t v19 = *(unsigned int *)(a1 + 8);
          v17 += 5712;
        }
        while (v16 < v19);
      }
      else
      {
        LODWORD(v19) = 0;
      }
      *(_DWORD *)(a1 + 1008) = 0;
      *(_DWORD *)(a1 + 1012) = v19;
      atomic_store(0xFFFFFFFF, (unsigned int *)(a1 + 1016));
      atomic_store(0, (unsigned int *)(a1 + 1020));
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 896));
    }
    unsigned int v20 = *(_DWORD *)(a1 + 8);
    if (v20 >= 2)
    {
      unsigned int v21 = 0;
      unsigned int v22 = *(_DWORD *)(a1 + 864);
      do
      {
        if (v22 == v20) {
          unsigned int v23 = 0;
        }
        else {
          unsigned int v23 = v22;
        }
        uint64_t v24 = *(void *)a1 + 5712 * v23;
        sub_224AE1BC0(v24, -1);
        *(_DWORD *)(v24 + 3124) = 0;
        *(_DWORD *)(v24 + 5556) = 0;
        uint64_t v25 = *(void *)(a1 + 856);
        uint64_t v26 = v25 + 296 * v23;
        if (*(void *)(v26 + 8))
        {
          sub_224AFAD94(v26);
          *(void *)(v25 + 296 * v23 + 288) = 0;
        }
        ++v21;
        unsigned int v22 = v23 + 1;
        unsigned int v20 = *(_DWORD *)(a1 + 8);
      }
      while (v21 < v20);
      *(_DWORD *)(a1 + 864) = 0;
    }
    atomic_store(0, *(unsigned int **)(a1 + 848));
  }
}

uint64_t sub_224AF7598(uint64_t a1)
{
  sub_224AF7650(a1);
  int v4 = v3;
  uint64_t result = 0;
  if (!v4)
  {
    do
    {
      if (!*(void *)(a1 + 184)) {
        return 0;
      }
      uint64_t v6 = sub_224ACD710(a1, (unsigned __int8 **)(a1 + 176));
      uint64_t v7 = v6;
      if (v6 < 0 || (uint64_t v8 = *(void *)(a1 + 184) - v6, *(void *)(a1 + 176) += v6, (*(void *)(a1 + 184) = v8) == 0)) {
        sub_224AC7180(a1 + 176);
      }
      sub_224AF7650(a1);
      unint64_t v9 = (unint64_t)v7 >> 63;
      if (v10)
      {
        LODWORD(v9) = 3;
        BOOL v11 = 0;
      }
      else
      {
        BOOL v11 = v7 < 0;
      }
      if (v11) {
        unsigned int v1 = v7;
      }
    }
    while (!v9);
    if (v9 == 3) {
      return 0;
    }
    else {
      return v1;
    }
  }
  return result;
}

double sub_224AF7650(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 63152) && !*(_DWORD *)(a1 + 63060))
  {
    int v2 = *(_DWORD *)(a1 + 63064);
    if (v2)
    {
      if (*(void *)(a1 + 264))
      {
        int v3 = (_OWORD *)(a1 + 248);
        if (!*(void *)(a1 + 560))
        {
LABEL_11:
          memcpy((void *)(a1 + 544), (const void *)(a1 + 248), 0x110uLL);
          *(void *)(a1 + 832) = *(void *)(a1 + 536);
          *(_DWORD *)(a1 + 824) = *(_DWORD *)(a1 + 528);
          double result = 0.0;
          *int v3 = 0u;
          *(_OWORD *)(a1 + 264) = 0u;
          *(_OWORD *)(a1 + 280) = 0u;
          *(_OWORD *)(a1 + 296) = 0u;
          *(_OWORD *)(a1 + 312) = 0u;
          *(_OWORD *)(a1 + 328) = 0u;
          *(_OWORD *)(a1 + 344) = 0u;
          *(_OWORD *)(a1 + 360) = 0u;
          *(_OWORD *)(a1 + 376) = 0u;
          *(_OWORD *)(a1 + 392) = 0u;
          *(_OWORD *)(a1 + 408) = 0u;
          *(_OWORD *)(a1 + 424) = 0u;
          *(_OWORD *)(a1 + 440) = 0u;
          *(_OWORD *)(a1 + 456) = 0u;
          *(_OWORD *)(a1 + 472) = 0u;
          *(_OWORD *)(a1 + 488) = 0u;
          *(void *)(a1 + 816) = *(void *)(a1 + 520);
          *int v3 = 0u;
          *(_OWORD *)(a1 + 264) = 0u;
          *(_OWORD *)(a1 + 280) = 0u;
          *(_OWORD *)(a1 + 296) = 0u;
          *(_OWORD *)(a1 + 312) = 0u;
          *(_OWORD *)(a1 + 328) = 0u;
          *(_OWORD *)(a1 + 344) = 0u;
          *(_OWORD *)(a1 + 360) = 0u;
          *(_OWORD *)(a1 + 376) = 0u;
          *(_OWORD *)(a1 + 392) = 0u;
          *(_OWORD *)(a1 + 408) = 0u;
          *(_OWORD *)(a1 + 424) = 0u;
          *(_OWORD *)(a1 + 440) = 0u;
          *(_OWORD *)(a1 + 456) = 0u;
          *(_OWORD *)(a1 + 472) = 0u;
          *(_OWORD *)(a1 + 488) = 0u;
          *(_OWORD *)(a1 + 504) = 0u;
          *(_OWORD *)(a1 + 520) = 0u;
          *(_OWORD *)(a1 + 504) = 0u;
          *(void *)(a1 + 536) = 0;
          return result;
        }
        if (v2 != *(unsigned __int8 *)(*(void *)(a1 + 552) + 250) && (*(unsigned char *)(a1 + 528) & 4) == 0)
        {
          sub_224AFAD94(a1 + 544);
          goto LABEL_11;
        }
      }
    }
  }
  return result;
}

uint64_t sub_224AF7774()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = (uint64_t)v1;
  uint64_t v3 = v0;
  v19[4551] = *MEMORY[0x263EF8340];
  int v4 = (_DWORD *)(v0 + 63048);
  if (*(_DWORD *)(v0 + 63060) || !*(_DWORD *)(v0 + 63064)) {
    uint64_t v5 = (_OWORD *)(v0 + 248);
  }
  else {
    uint64_t v5 = (_OWORD *)(v0 + 544);
  }
  if (!*v4) {
    goto LABEL_30;
  }
  uint64_t v6 = (_DWORD *)*((void *)v5 + 1);
  if (!v6[1] && !v6[10])
  {
    if (!v6[11] && (!v6[54] || !v6[9]))
    {
LABEL_30:
      memcpy(v1, v5, 0x110uLL);
      uint64_t v8 = 0;
      _OWORD *v5 = 0u;
      v5[1] = 0u;
      v5[2] = 0u;
      v5[3] = 0u;
      v5[4] = 0u;
      v5[5] = 0u;
      v5[6] = 0u;
      v5[7] = 0u;
      v5[8] = 0u;
      v5[9] = 0u;
      v5[10] = 0u;
      v5[11] = 0u;
      v5[12] = 0u;
      v5[13] = 0u;
      v5[14] = 0u;
      v5[15] = 0u;
      v5[16] = 0u;
      goto LABEL_31;
    }
    if (!v6[10] && !v6[11] && (!v6[54] || !v6[9]))
    {
      sub_224AFAD00(v1, v5);
LABEL_27:
      uint64_t v8 = 0;
      goto LABEL_31;
    }
  }
  uint64_t v7 = sub_224AFAC78(v0, (uint64_t *)v1, *((unsigned int *)v5 + 14), (uint64_t)v5);
  if ((v7 & 0x80000000) == 0)
  {
    if (*(_DWORD *)(v3 + 24) < 2u)
    {
      unsigned int v9 = *(_DWORD *)(v2 + 68);
      if (v9 == 12 || v9 == 10)
      {
        uint64_t v13 = (void (**)(uint64_t, uint64_t, uint64_t))(v3 + 3368 * ((v9 >> 1) - 4) + 52888);
        int v14 = *(_DWORD *)(v2 + 60);
        sub_224AFFB80(v13, v2, (uint64_t)v5, v18, (uint64_t)v19);
        if (v14 >= 1)
        {
          int v15 = 0;
          unsigned int v16 = (v14 + 31) >> 5;
          do
            sub_224B00068((uint64_t)v13, v2, (uint64_t)v5, (uint64_t)v18, (uint64_t)v19, v15++);
          while (v16 != v15);
        }
      }
      else
      {
        if (v9 != 8) {
          abort();
        }
        int v10 = *(_DWORD *)(v2 + 60);
        sub_224AC98D8((void (**)(uint64_t, uint64_t))(v3 + 52888), v2, (uint64_t)v5, (uint64_t)v18, (uint64_t)v19);
        if (v10 >= 1)
        {
          int v11 = 0;
          unsigned int v12 = (v10 + 31) >> 5;
          do
            sub_224AC9C7C(v3 + 52888, v2, (uint64_t)v5, (uint64_t)v18, (uint64_t)v19, v11++);
          while (v12 != v11);
        }
      }
    }
    else
    {
      *(void *)(v3 + 1080) = v5;
      *(void *)(v3 + 1088) = v2;
      *(void *)(v3 + 1096) = 11;
      *(_DWORD *)(v3 + 1104) = 0;
      pthread_mutex_lock((pthread_mutex_t *)(v3 + 896));
      *(void *)(v3 + 1024) = 1;
      pthread_cond_signal((pthread_cond_t *)(v3 + 960));
      do
        pthread_cond_wait((pthread_cond_t *)(v3 + 1032), (pthread_mutex_t *)(v3 + 896));
      while (!*(_DWORD *)(v3 + 1028));
      pthread_mutex_unlock((pthread_mutex_t *)(v3 + 896));
    }
    goto LABEL_27;
  }
  uint64_t v8 = v7;
  sub_224AFAD94(v2);
LABEL_31:
  sub_224AFAD94((uint64_t)v5);
  *((void *)v5 + 36) = 0;
  if (!v4[3] && v4[4] && *(void *)(v3 + 264))
  {
    memcpy(v5, (const void *)(v3 + 248), 0x110uLL);
    *(_OWORD *)(v3 + 248) = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    *(_OWORD *)(v3 + 280) = 0u;
    *(_OWORD *)(v3 + 296) = 0u;
    *(_OWORD *)(v3 + 312) = 0u;
    *(_OWORD *)(v3 + 328) = 0u;
    *(_OWORD *)(v3 + 344) = 0u;
    *(_OWORD *)(v3 + 360) = 0u;
    *(_OWORD *)(v3 + 376) = 0u;
    *(_OWORD *)(v3 + 392) = 0u;
    *(_OWORD *)(v3 + 408) = 0u;
    *(_OWORD *)(v3 + 424) = 0u;
    *(_OWORD *)(v3 + 440) = 0u;
    *(_OWORD *)(v3 + 456) = 0u;
    *(_OWORD *)(v3 + 472) = 0u;
    *(_OWORD *)(v3 + 488) = 0u;
    *(_OWORD *)(v3 + 504) = 0u;
    *((void *)v5 + 34) = *(void *)(v3 + 520);
    *((void *)v5 + 36) = *(void *)(v3 + 536);
    *((_DWORD *)v5 + 70) = *(_DWORD *)(v3 + 528);
    *(void *)(v3 + 536) = 0;
    *(_OWORD *)(v3 + 504) = 0u;
    *(_OWORD *)(v3 + 520) = 0u;
    *(_OWORD *)(v3 + 472) = 0u;
    *(_OWORD *)(v3 + 488) = 0u;
    *(_OWORD *)(v3 + 440) = 0u;
    *(_OWORD *)(v3 + 456) = 0u;
    *(_OWORD *)(v3 + 408) = 0u;
    *(_OWORD *)(v3 + 424) = 0u;
    *(_OWORD *)(v3 + 376) = 0u;
    *(_OWORD *)(v3 + 392) = 0u;
    *(_OWORD *)(v3 + 344) = 0u;
    *(_OWORD *)(v3 + 360) = 0u;
    *(_OWORD *)(v3 + 312) = 0u;
    *(_OWORD *)(v3 + 328) = 0u;
    *(_OWORD *)(v3 + 280) = 0u;
    *(_OWORD *)(v3 + 296) = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    *(_OWORD *)(v3 + 248) = 0u;
  }
  return v8;
}

uint64_t sub_224AF7AFC(uint64_t result, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = 0; i != 88; i += 4)
    *(_DWORD *)(a2 + i + 5464) = *(unsigned __int16 *)(a3 + 5464 + i);
  uint64_t v4 = 0;
  uint64_t v5 = a2 + 128;
  *(_OWORD *)(a2 + 3360) = *(_OWORD *)(a3 + 3360);
  *(_WORD *)(a2 + 3368) = 0;
  char v6 = 1;
  do
  {
    uint64_t v7 = 0;
    char v8 = v6;
    if (v6) {
      uint64_t v9 = 24;
    }
    else {
      uint64_t v9 = 26;
    }
    uint64_t v10 = 416 * v4;
    uint64_t v11 = v5 + ((416 * v4) | v9);
    uint64_t v12 = a3 + 128 + v10;
    uint64_t v13 = v5 + v10;
    do
    {
      int v14 = (_OWORD *)(v13 + v7);
      long long v15 = *(_OWORD *)(v12 + v7 + 16);
      *int v14 = *(_OWORD *)(v12 + v7);
      v14[1] = v15;
      *(_WORD *)(v11 + v7) = 0;
      v7 += 32;
    }
    while (v7 != 416);
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v8 & 1) != 0);
  for (uint64_t j = 0; j != 128; j += 16)
  {
    uint64_t v17 = a2 + j;
    *(_OWORD *)(v17 + 3232) = *(_OWORD *)(a3 + 3232 + j);
    *(_WORD *)(v17 + 3244) = 0;
  }
  uint64_t v18 = 0;
  uint64_t v19 = a2 + 5026;
  uint64_t v20 = a3 + 5024;
  uint64_t v21 = a2;
  do
  {
    uint64_t v22 = 0;
    if ((int)v18 >= 1) {
      unsigned int v23 = 1;
    }
    else {
      unsigned int v23 = v18;
    }
    uint64_t v24 = v19 + 2 * v23;
    do
    {
      *(void *)(v21 + v22 + 5024) = *(void *)(v20 + v22);
      *(_WORD *)(v24 + v22) = 0;
      v22 += 8;
    }
    while (v22 != 24);
    ++v18;
    v19 += 24;
    v20 += 24;
    v21 += 24;
  }
  while (v18 != 4);
  uint64_t v25 = 0;
  char v26 = 1;
  do
  {
    uint64_t v27 = 0;
    char v28 = v26;
    uint64_t v29 = 208 * v25;
    uint64_t v30 = a2 + 208 * v25;
    uint64_t v31 = a3 + 2176 + v29;
    do
    {
      uint64_t v32 = v30 + v27;
      *(_OWORD *)(v32 + 2176) = *(_OWORD *)(v31 + v27);
      *(_WORD *)(v32 + 2188) = 0;
      v27 += 16;
    }
    while (v27 != 208);
    char v26 = 0;
    uint64_t v25 = 1;
  }
  while ((v28 & 1) != 0);
  uint64_t v33 = 0;
  uint64_t v34 = a3 + 2592;
  uint64_t v35 = a2;
  do
  {
    for (uint64_t k = 0; k != 208; k += 16)
    {
      uint64_t v37 = v35 + k;
      *(_OWORD *)(v37 + 2592) = *(_OWORD *)(v34 + k);
      *(_WORD *)(v37 + 2600) = 0;
    }
    ++v33;
    v35 += 208;
    v34 += 208;
  }
  while (v33 != 3);
  for (uint64_t m = 0; m != 12; m += 4)
    *(_DWORD *)(a2 + m + 6012) = *(unsigned __int16 *)(a3 + 6012 + m);
  uint64_t v39 = 0;
  uint64_t v40 = a2 + 1248;
  uint64_t v41 = a3 + 1248;
  do
  {
    uint64_t v42 = 0;
    uint64_t v43 = v40 + 2 * byte_224B19559[v39];
    do
    {
      int v44 = (_OWORD *)(v40 + v42);
      long long v45 = *(_OWORD *)(v41 + v42 + 16);
      *int v44 = *(_OWORD *)(v41 + v42);
      v44[1] = v45;
      *(_WORD *)(v43 + v42) = 0;
      v42 += 32;
    }
    while (v42 != 128);
    ++v39;
    v40 += 128;
    v41 += 128;
  }
  while (v39 != 5);
  uint64_t v46 = 0;
  int v47 = (__int16 *)(a3 + 12936);
  int v48 = (_WORD *)(a2 + 12938);
  do
  {
    int v49 = v47;
    BOOL v50 = v48;
    uint64_t v51 = 13;
    do
    {
      __int16 v52 = *v49;
      v49 += 2;
      *(v50 - 1) = v52;
      *BOOL v50 = 0;
      v50 += 2;
      --v51;
    }
    while (v51);
    ++v46;
    v48 += 26;
    v47 += 26;
  }
  while (v46 != 5);
  uint64_t v53 = 0;
  *(_OWORD *)(a2 + 7040) = *(_OWORD *)(a3 + 7040);
  *(_WORD *)(a2 + 7048) = 0;
  *(_OWORD *)(a2 + 7056) = *(_OWORD *)(a3 + 7056);
  *(_WORD *)(a2 + 7064) = 0;
  *(_OWORD *)(a2 + 7072) = *(_OWORD *)(a3 + 7072);
  *(_WORD *)(a2 + 7080) = 0;
  *(_OWORD *)(a2 + 7088) = *(_OWORD *)(a3 + 7088);
  *(_WORD *)(a2 + 7096) = 0;
  *(_OWORD *)(a2 + 7104) = *(_OWORD *)(a3 + 7104);
  *(_WORD *)(a2 + 7114) = 0;
  *(_OWORD *)(a2 + 7120) = *(_OWORD *)(a3 + 7120);
  *(_WORD *)(a2 + 7130) = 0;
  *(_OWORD *)(a2 + 7136) = *(_OWORD *)(a3 + 7136);
  *(_WORD *)(a2 + 7146) = 0;
  *(_OWORD *)(a2 + 7152) = *(_OWORD *)(a3 + 7152);
  *(_WORD *)(a2 + 7162) = 0;
  *(_OWORD *)(a2 + 7168) = *(_OWORD *)(a3 + 7168);
  *(_WORD *)(a2 + 7180) = 0;
  *(_OWORD *)(a2 + 7184) = *(_OWORD *)(a3 + 7184);
  *(_WORD *)(a2 + 7196) = 0;
  *(_OWORD *)(a2 + 7200) = *(_OWORD *)(a3 + 7200);
  *(_WORD *)(a2 + 7212) = 0;
  *(_OWORD *)(a2 + 7216) = *(_OWORD *)(a3 + 7216);
  *(_WORD *)(a2 + 7228) = 0;
  uint64_t v54 = *(void *)(a3 + 7232);
  *(void *)(a2 + 7238) = *(void *)(a3 + 7238);
  *(void *)(a2 + 7232) = v54;
  *(_WORD *)(a2 + 7246) = 0;
  uint64_t v55 = *(void *)(a3 + 7248);
  *(void *)(a2 + 7254) = *(void *)(a3 + 7254);
  *(void *)(a2 + 7248) = v55;
  *(_WORD *)(a2 + 7262) = 0;
  uint64_t v56 = *(void *)(a3 + 7264);
  *(void *)(a2 + 7270) = *(void *)(a3 + 7270);
  *(void *)(a2 + 7264) = v56;
  *(_WORD *)(a2 + 7278) = 0;
  uint64_t v57 = *(void *)(a3 + 7280);
  *(void *)(a2 + 7286) = *(void *)(a3 + 7286);
  *(void *)(a2 + 7280) = v57;
  *(_WORD *)(a2 + 7294) = 0;
  long long v58 = *(_OWORD *)(a3 + 7296);
  *(_OWORD *)(a2 + 7312) = *(_OWORD *)(a3 + 7312);
  *(_OWORD *)(a2 + 7296) = v58;
  *(_WORD *)(a2 + 7312) = 0;
  long long v59 = *(_OWORD *)(a3 + 7328);
  *(_OWORD *)(a2 + 7344) = *(_OWORD *)(a3 + 7344);
  *(_OWORD *)(a2 + 7328) = v59;
  *(_WORD *)(a2 + 7344) = 0;
  long long v60 = *(_OWORD *)(a3 + 7360);
  *(_OWORD *)(a2 + 7376) = *(_OWORD *)(a3 + 7376);
  *(_OWORD *)(a2 + 7360) = v60;
  *(_WORD *)(a2 + 7376) = 0;
  long long v61 = *(_OWORD *)(a3 + 7392);
  *(_OWORD *)(a2 + 7408) = *(_OWORD *)(a3 + 7408);
  *(_OWORD *)(a2 + 7392) = v61;
  *(_WORD *)(a2 + 7408) = 0;
  long long v62 = *(_OWORD *)(a3 + 7424);
  *(_OWORD *)(a2 + 7440) = *(_OWORD *)(a3 + 7440);
  *(_OWORD *)(a2 + 7424) = v62;
  *(_WORD *)(a2 + 7442) = 0;
  long long v63 = *(_OWORD *)(a3 + 7456);
  *(_OWORD *)(a2 + 7472) = *(_OWORD *)(a3 + 7472);
  *(_OWORD *)(a2 + 7456) = v63;
  *(_WORD *)(a2 + 7474) = 0;
  long long v64 = *(_OWORD *)(a3 + 7488);
  *(_OWORD *)(a2 + 7504) = *(_OWORD *)(a3 + 7504);
  *(_OWORD *)(a2 + 7488) = v64;
  *(_WORD *)(a2 + 7508) = 0;
  long long v65 = *(_OWORD *)(a3 + 7520);
  *(_OWORD *)(a2 + 7536) = *(_OWORD *)(a3 + 7536);
  *(_OWORD *)(a2 + 7520) = v65;
  *(_WORD *)(a2 + 7540) = 0;
  uint64_t v66 = a3 + 12496;
  uint64_t v67 = a2 + 12496;
  do
  {
    uint64_t v68 = 0;
    char v69 = 1;
    do
    {
      uint64_t v70 = 0;
      char v71 = v69;
      uint64_t v72 = 44 * v68;
      uint64_t v73 = v66 + 44 * v68;
      uint64_t v74 = v67 + v72;
      do
      {
        *(_DWORD *)(v74 + v70) = *(unsigned __int16 *)(v73 + v70);
        v70 += 4;
      }
      while (v70 != 44);
      char v69 = 0;
      uint64_t v68 = 1;
    }
    while ((v71 & 1) != 0);
    ++v53;
    v66 += 88;
    v67 += 88;
  }
  while (v53 != 5);
  uint64_t v75 = 0;
  uint64_t v76 = a3 + 7552;
  uint64_t v77 = a2;
  do
  {
    uint64_t v78 = 0;
    char v79 = 1;
    do
    {
      uint64_t v80 = 0;
      char v81 = v79;
      uint64_t v82 = v77 + 32 * v78;
      uint64_t v83 = v76 + 32 * v78;
      do
      {
        uint64_t v84 = v82 + v80;
        *(void *)(v84 + 7552) = *(void *)(v83 + v80);
        *(_WORD *)(v84 + 7556) = 0;
        v80 += 8;
      }
      while (v80 != 32);
      char v79 = 0;
      uint64_t v78 = 1;
    }
    while ((v81 & 1) != 0);
    ++v75;
    v77 += 64;
    v76 += 64;
  }
  while (v75 != 5);
  uint64_t v85 = 0;
  uint64_t v86 = a3 + 7872;
  uint64_t v87 = a2;
  do
  {
    uint64_t v88 = 0;
    char v89 = 1;
    do
    {
      uint64_t v90 = 0;
      char v91 = v89;
      uint64_t v92 = 328 * v88;
      uint64_t v93 = v87 + 328 * v88;
      uint64_t v94 = v86 + v92;
      do
      {
        uint64_t v95 = v93 + v90;
        *(void *)(v95 + 7872) = *(void *)(v94 + v90);
        *(_WORD *)(v95 + 7878) = 0;
        v90 += 8;
      }
      while (v90 != 328);
      char v89 = 0;
      uint64_t v88 = 1;
    }
    while ((v91 & 1) != 0);
    ++v85;
    v87 += 656;
    v86 += 656;
  }
  while (v85 != 5);
  uint64_t v96 = 0;
  char v97 = 1;
  do
  {
    char v98 = v97;
    uint64_t v99 = 3 * v96;
    unsigned int v100 = (_WORD *)(a2 + 13198 + 12 * v96);
    int v101 = (__int16 *)(a3 + 13196 + 4 * v99);
    uint64_t v102 = 3;
    do
    {
      __int16 v103 = *v101;
      v101 += 2;
      *(v100 - 1) = v103;
      *unsigned int v100 = 0;
      v100 += 2;
      --v102;
    }
    while (v102);
    char v97 = 0;
    uint64_t v96 = 1;
  }
  while ((v98 & 1) != 0);
  uint64_t v104 = 0;
  uint64_t v105 = a2 + 11158;
  uint64_t v106 = a3 + 11152;
  uint64_t v107 = a2;
  do
  {
    uint64_t v108 = 0;
    char v109 = 1;
    do
    {
      uint64_t v110 = 0;
      char v111 = v109;
      uint64_t v112 = 168 * v108;
      uint64_t v113 = v105 + 168 * v108;
      uint64_t v114 = v106 + v112;
      uint64_t v115 = v107 + v112;
      do
      {
        *(void *)(v115 + v110 + 11152) = *(void *)(v114 + v110);
        *(_WORD *)(v113 + v110) = 0;
        v110 += 8;
      }
      while (v110 != 168);
      char v109 = 0;
      uint64_t v108 = 1;
    }
    while ((v111 & 1) != 0);
    ++v104;
    v105 += 336;
    v106 += 336;
    v107 += 336;
  }
  while (v104 != 4);
  for (uint64_t n = 0; n != 48; n += 16)
  {
    uint64_t v117 = a2 + n;
    *(_OWORD *)(v117 + 3504) = *(_OWORD *)(a3 + 3504 + n);
    *(_WORD *)(v117 + 3518) = 0;
  }
  uint64_t v118 = 0;
  uint64_t v119 = *(void *)(a3 + 3216);
  *(void *)(a2 + 3222) = *(void *)(a3 + 3222);
  *(void *)(a2 + 3216) = v119;
  *(_WORD *)(a2 + 3230) = 0;
  uint64_t v120 = a3 + 1888;
  do
  {
    uint64_t v121 = a2 + v118;
    long long v122 = *(_OWORD *)(v120 + v118);
    *(_OWORD *)(v121 + 1904) = *(_OWORD *)(v120 + v118 + 16);
    *(_OWORD *)(v121 + 1888) = v122;
    *(_WORD *)(v121 + 1918) = 0;
    v118 += 32;
  }
  while (v118 != 192);
  uint64_t v123 = 0;
  *(_WORD *)(a2 + 5384) = *(_WORD *)(a3 + 5384);
  *(_WORD *)(a2 + 5386) = 0;
  *(_WORD *)(a2 + 5388) = *(_WORD *)(a3 + 5388);
  *(_WORD *)(a2 + 5390) = 0;
  *(void *)(a2 + 5376) = *(void *)(a3 + 5376);
  *(_WORD *)(a2 + 5380) = 0;
  *(void *)(a2 + 5296) = *(void *)(a3 + 5296);
  *(_WORD *)(a2 + 5302) = 0;
  do
  {
    uint64_t v124 = a2 + v123;
    *(void *)(v124 + 5304) = *(void *)(a3 + 5304 + v123);
    *(_WORD *)(v124 + 5310) = 0;
    v123 += 8;
  }
  while (v123 != 40);
  uint64_t v125 = 0;
  uint64_t v126 = a3 + 6136;
  uint64_t v127 = a2;
  do
  {
    for (iuint64_t i = 0; ii != 12; ii += 4)
      *(_DWORD *)(v127 + ii + 6136) = *(unsigned __int16 *)(v126 + ii);
    ++v125;
    v127 += 12;
    v126 += 12;
  }
  while (v125 != 7);
  uint64_t v129 = 0;
  *(_WORD *)(a2 + 6220) = *(_WORD *)(a3 + 6220);
  *(_WORD *)(a2 + 6222) = 0;
  *(_WORD *)(a2 + 6224) = *(_WORD *)(a3 + 6224);
  *(_WORD *)(a2 + 6226) = 0;
  char v130 = 1;
  do
  {
    uint64_t v131 = 0;
    char v132 = v130;
    uint64_t v133 = 112 * v129;
    uint64_t v134 = a2 + 112 * v129;
    uint64_t v135 = a3 + 3552 + v133;
    do
    {
      uint64_t v136 = v134 + v131;
      *(_OWORD *)(v136 + 3552) = *(_OWORD *)(v135 + v131);
      *(_WORD *)(v136 + 3564) = 0;
      v131 += 16;
    }
    while (v131 != 112);
    char v130 = 0;
    uint64_t v129 = 1;
  }
  while ((v132 & 1) != 0);
  uint64_t v137 = 0;
  char v138 = 1;
  do
  {
    uint64_t v139 = 0;
    char v140 = v138;
    uint64_t v141 = 560 * v137;
    uint64_t v142 = a2 + 3778 + 560 * v137;
    uint64_t v143 = a3 + 3776 + v141;
    uint64_t v144 = a2 + 3776 + v141;
    do
    {
      uint64_t v145 = 0;
      ++v139;
      do
      {
        *(_OWORD *)(v144 + v145) = *(_OWORD *)(v143 + v145);
        *(_WORD *)(v142 + v145) = 0;
        v145 += 16;
      }
      while (v145 != 80);
      v142 += 82;
      v143 += 80;
      v144 += 80;
    }
    while (v139 != 7);
    char v138 = 0;
    uint64_t v137 = 1;
  }
  while ((v140 & 1) != 0);
  uint64_t v146 = 0;
  uint64_t v147 = a3 + 5928;
  uint64_t v148 = a2;
  do
  {
    for (juint64_t j = 0; jj != 12; jj += 4)
      *(_DWORD *)(v148 + jj + 5928) = *(unsigned __int16 *)(v147 + jj);
    ++v146;
    v148 += 12;
    v147 += 12;
  }
  while (v146 != 7);
  uint64_t v150 = 0;
  long long v151 = *(_OWORD *)(a3 + 2080);
  *(_OWORD *)(a2 + 2094) = *(_OWORD *)(a3 + 2094);
  *(_OWORD *)(a2 + 2080) = v151;
  *(_WORD *)(a2 + 2110) = 0;
  long long v152 = *(_OWORD *)(a3 + 2112);
  *(_OWORD *)(a2 + 2126) = *(_OWORD *)(a3 + 2126);
  *(_OWORD *)(a2 + 2112) = v152;
  *(_WORD *)(a2 + 2142) = 0;
  long long v153 = *(_OWORD *)(a3 + 2144);
  *(_OWORD *)(a2 + 2160) = *(_OWORD *)(a3 + 2160);
  *(_OWORD *)(a2 + 2144) = v153;
  *(_WORD *)(a2 + 2166) = 0;
  do
  {
    *(_DWORD *)(a2 + v150 + 5448) = *(unsigned __int16 *)(a3 + 5448 + v150);
    v150 += 4;
  }
  while (v150 != 16);
  if (*(unsigned char *)(result + 232))
  {
    for (kuint64_t k = 0; kk != 12; kk += 4)
      *(_DWORD *)(a2 + kk + 6024) = *(unsigned __int16 *)(a3 + 6024 + kk);
    for (muint64_t m = 0; mm != 128; mm += 32)
    {
      uint64_t v168 = a2 + mm;
      long long v169 = *(_OWORD *)(a3 + mm + 16);
      *(_OWORD *)uint64_t v168 = *(_OWORD *)(a3 + mm);
      *(_OWORD *)(v168 + 16) = v169;
      *(_WORD *)(v168 + 24) = 0;
    }
    uint64_t v170 = 0;
    char v171 = 1;
    do
    {
      uint64_t v172 = 0;
      char v173 = v171;
      uint64_t v174 = a2 + (v170 << 6);
      uint64_t v175 = a3 + 4896 + (v170 << 6);
      do
      {
        uint64_t v176 = v174 + v172;
        *(void *)(v176 + 4896) = *(void *)(v175 + v172);
        *(_WORD *)(v176 + 4900) = 0;
        v172 += 8;
      }
      while (v172 != 64);
      char v171 = 0;
      uint64_t v170 = 1;
    }
    while ((v173 & 1) != 0);
    for (nuint64_t n = 0; nn != 24; nn += 4)
      *(_DWORD *)(a2 + nn + 5552) = *(unsigned __int16 *)(a3 + 5552 + nn);
    uint64_t v178 = 0;
    *(_WORD *)(a2 + 5576) = *(_WORD *)(a3 + 5576);
    *(_WORD *)(a2 + 5578) = 0;
    *(_WORD *)(a2 + 5580) = *(_WORD *)(a3 + 5580);
    *(_WORD *)(a2 + 5582) = 0;
    do
    {
      *(_DWORD *)(a2 + v178 + 5584) = *(unsigned __int16 *)(a3 + 5584 + v178);
      v178 += 4;
    }
    while (v178 != 24);
    for (uint64_t i1 = 0; i1 != 12; i1 += 4)
      *(_DWORD *)(a2 + i1 + 5608) = *(unsigned __int16 *)(a3 + 5608 + i1);
    for (uint64_t i2 = 0; i2 != 128; i2 += 16)
    {
      uint64_t v181 = a2 + i2;
      *(_OWORD *)(v181 + 3376) = *(_OWORD *)(a3 + 3376 + i2);
      *(_WORD *)(v181 + 3390) = 0;
    }
    for (uint64_t i3 = 0; i3 != 16; i3 += 4)
      *(_DWORD *)(a2 + i3 + 5620) = *(unsigned __int16 *)(a3 + 5620 + i3);
    for (uint64_t i4 = 0; i4 != 20; i4 += 4)
      *(_DWORD *)(a2 + i4 + 5636) = *(unsigned __int16 *)(a3 + 5636 + i4);
    for (uint64_t i5 = 0; i5 != 20; i5 += 4)
      *(_DWORD *)(a2 + i5 + 5656) = *(unsigned __int16 *)(a3 + 5656 + i5);
    for (uint64_t i6 = 0; i6 != 24; i6 += 4)
      *(_DWORD *)(a2 + i6 + 5676) = *(unsigned __int16 *)(a3 + 5676 + i6);
    for (uint64_t i7 = 0; i7 != 24; i7 += 4)
      *(_DWORD *)(a2 + i7 + 5700) = *(unsigned __int16 *)(a3 + 5700 + i7);
    for (uint64_t i8 = 0; i8 != 36; i8 += 4)
      *(_DWORD *)(a2 + i8 + 5724) = *(unsigned __int16 *)(a3 + 5724 + i8);
    uint64_t v188 = 0;
    uint64_t v189 = a3 + 960;
    do
    {
      uint64_t v190 = a2 + v188;
      long long v191 = *(_OWORD *)(v189 + v188 + 16);
      *(_OWORD *)(v190 + 960) = *(_OWORD *)(v189 + v188);
      *(_OWORD *)(v190 + 976) = v191;
      *(_WORD *)(v190 + 990) = 0;
      v188 += 32;
    }
    while (v188 != 288);
    uint64_t v192 = 0;
    uint64_t v193 = a3 + 5760;
    uint64_t v194 = a2;
    do
    {
      for (uint64_t i9 = 0; i9 != 12; i9 += 4)
        *(_DWORD *)(v194 + i9 + 5760) = *(unsigned __int16 *)(v193 + i9);
      ++v192;
      v194 += 12;
      v193 += 12;
    }
    while (v192 != 6);
    uint64_t v196 = 0;
    uint64_t v197 = a3 + 5832;
    uint64_t v198 = a2;
    do
    {
      for (uint64_t i10 = 0; i10 != 12; i10 += 4)
        *(_DWORD *)(v198 + i10 + 5832) = *(unsigned __int16 *)(v197 + i10);
      ++v196;
      v198 += 12;
      v197 += 12;
    }
    while (v196 != 3);
    uint64_t v200 = 0;
    char v201 = 1;
    do
    {
      uint64_t v202 = 0;
      uint64_t v203 = 3 * v200;
      char v204 = v201;
      uint64_t v205 = a2 + 12 * v200;
      do
      {
        *(_DWORD *)(v205 + v202 + 5868) = *(unsigned __int16 *)(a3 + 5868 + 4 * v203 + v202);
        v202 += 4;
      }
      while (v202 != 12);
      char v201 = 0;
      uint64_t v200 = 1;
    }
    while ((v204 & 1) != 0);
    uint64_t v206 = 0;
    uint64_t v207 = a3 + 5892;
    uint64_t v208 = a2;
    do
    {
      for (uint64_t i11 = 0; i11 != 12; i11 += 4)
        *(_DWORD *)(v208 + i11 + 5892) = *(unsigned __int16 *)(v207 + i11);
      ++v206;
      v208 += 12;
      v207 += 12;
    }
    while (v206 != 3);
    for (uint64_t i12 = 0; i12 != 12; i12 += 4)
      *(_DWORD *)(a2 + i12 + 6036) = *(unsigned __int16 *)(a3 + 6036 + i12);
    for (uint64_t i13 = 0; i13 != 16; i13 += 4)
      *(_DWORD *)(a2 + i13 + 5392) = *(unsigned __int16 *)(a3 + 5392 + i13);
    for (uint64_t i14 = 0; i14 != 28; i14 += 4)
      *(_DWORD *)(a2 + i14 + 5420) = *(unsigned __int16 *)(a3 + 5420 + i14);
    for (uint64_t i15 = 0; i15 != 32; i15 += 8)
    {
      uint64_t v214 = a2 + i15;
      *(void *)(v214 + 5344) = *(void *)(a3 + 5344 + i15);
      *(_WORD *)(v214 + 5350) = 0;
    }
    for (uint64_t i16 = 0; i16 != 176; i16 += 8)
    {
      uint64_t v216 = a2 + i16;
      *(void *)(v216 + 5120) = *(void *)(a3 + 5120 + i16);
      *(_WORD *)(v216 + 5124) = 0;
    }
    for (uint64_t i17 = 0; i17 != 88; i17 += 4)
      *(_DWORD *)(a2 + i17 + 6048) = *(unsigned __int16 *)(a3 + 6048 + i17);
    uint64_t v218 = 0;
    uint64_t v219 = a2 + 13248;
    uint64_t v220 = a3 + 13248;
    *(void *)(a2 + 13504) = *(void *)(a3 + 13504);
    *(_WORD *)(a2 + 13510) = 0;
    char v221 = 1;
    do
    {
      char v222 = v221;
      uint64_t v223 = v219 + (v218 << 7);
      uint64_t v224 = v220 + (v218 << 7);
      long long v225 = *(_OWORD *)(v224 + 16);
      *(_OWORD *)uint64_t v223 = *(_OWORD *)v224;
      *(_OWORD *)(v223 + 16) = v225;
      *(_WORD *)(v223 + 20) = 0;
      *(_WORD *)(v223 + 64) = *(_WORD *)(v224 + 64);
      *(_WORD *)(v223 + 66) = 0;
      signed int v226 = (_WORD *)(a2 + 13318 + (v218 << 7));
      signed int v227 = (__int16 *)(a3 + 13316 + (v218 << 7));
      uint64_t v228 = 10;
      do
      {
        __int16 v229 = *v227;
        v227 += 2;
        *(v226 - 1) = v229;
        *signed int v226 = 0;
        v226 += 2;
        --v228;
      }
      while (v228);
      char v221 = 0;
      uint64_t v230 = v219 + (v218 << 7);
      uint64_t v231 = v220 + (v218 << 7);
      *(void *)(v230 + 32) = *(void *)(v231 + 32);
      *(_WORD *)(v230 + 38) = 0;
      *(void *)(v230 + 40) = *(void *)(v231 + 40);
      *(_WORD *)(v230 + 46) = 0;
      *(void *)(v230 + 48) = *(void *)(v231 + 48);
      *(_WORD *)(v230 + 54) = 0;
      *(_WORD *)(v230 + 56) = *(_WORD *)(v231 + 56);
      *(_WORD *)(v230 + 58) = 0;
      *(_DWORD *)(v230 + 60) = *(unsigned __int16 *)(v231 + 60);
      *(_WORD *)(v230 + 108) = *(_WORD *)(v231 + 108);
      *(_WORD *)(v230 + 110) = 0;
      uint64_t v218 = 1;
    }
    while ((v222 & 1) != 0);
  }
  else
  {
    uint64_t v154 = 0;
    *(_WORD *)(a2 + 6228) = *(_WORD *)(a3 + 6228);
    *(_WORD *)(a2 + 6230) = 0;
    *(void *)(a2 + 13792) = *(void *)(a3 + 13792);
    uint64_t v155 = a2 + 13536;
    uint64_t v156 = a3 + 13536;
    *(_WORD *)(a2 + 13798) = 0;
    char v157 = 1;
    do
    {
      char v158 = v157;
      uint64_t v159 = v155 + (v154 << 7);
      uint64_t v160 = v156 + (v154 << 7);
      long long v161 = *(_OWORD *)(v160 + 16);
      *(_OWORD *)uint64_t v159 = *(_OWORD *)v160;
      *(_OWORD *)(v159 + 16) = v161;
      *(_WORD *)(v159 + 20) = 0;
      *(_WORD *)(v159 + 64) = *(_WORD *)(v160 + 64);
      *(_WORD *)(v159 + 66) = 0;
      int v162 = (_WORD *)(a2 + 13606 + (v154 << 7));
      int v163 = (__int16 *)(a3 + 13604 + (v154 << 7));
      uint64_t v164 = 10;
      do
      {
        __int16 v165 = *v163;
        v163 += 2;
        *(v162 - 1) = v165;
        *int v162 = 0;
        v162 += 2;
        --v164;
      }
      while (v164);
      char v157 = 0;
      *(_DWORD *)(v155 + (v154 << 7) + 108) = *(unsigned __int16 *)(v156 + (v154 << 7) + 108);
      uint64_t v154 = 1;
    }
    while ((v158 & 1) != 0);
  }
  return result;
}

void sub_224AF8974(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, unint64_t a5, uint64_t a6, uint64_t a7, int a8, signed int a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (a4[53]) {
    BOOL v14 = a9 <= 0;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = *a4;
  if (v14) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  int32x2_t v17 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)vdupq_n_s64(v16 - 1), (uint64x2_t)xmmword_224B15990));
  int32x2_t v18 = vadd_s32(vdup_n_s32(a9), (int32x2_t)0xFFFFFFFF00000000);
  if (v17.i8[0])
  {
    int32x2_t v19 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v18, 0), (int8x8_t)0xFF00000000FFLL);
    v42[0] = vorr_s8((int8x8_t)v19, (int8x8_t)vdup_lane_s32(v19, 1)).u32[0] ^ v15;
  }
  if (v17.i8[4])
  {
    int32x2_t v20 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v18, 1), (int8x8_t)0xFF00000000FFLL);
    v42[1] = vorr_s8((int8x8_t)v20, (int8x8_t)vdup_lane_s32(v20, 1)).u32[0] ^ v15;
  }
  if (a5)
  {
    uint64_t v21 = 0;
    unsigned int v22 = 0;
    uint64_t v23 = a8;
    do
    {
      int v24 = a4[53];
      if (v22) {
        BOOL v25 = v24 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      int v26 = !v25;
      uint64_t v27 = &v41;
      uint64_t v28 = v16;
      if (!v25)
      {
        do
        {
          *(_DWORD *)uint64_t v27 = *((_DWORD *)v27 - 2);
          uint64_t v27 = (uint64_t *)((char *)v27 + 4);
          --v28;
        }
        while (v28);
      }
      for (uint64_t i = 0; i != v16; ++i)
      {
        int v30 = v42[i];
        int v31 = (((((v30 >> 3) ^ (v30 >> 12) ^ v30) ^ (v30 >> 1)) & 1) << 15) | (v30 >> 1);
        v42[i] = v31;
        v40[i] = BYTE1(v31);
      }
      if (a9) {
        BOOL v32 = v24 == 0;
      }
      else {
        BOOL v32 = 1;
      }
      int v33 = !v32;
      if (v26) {
        v33 |= 2u;
      }
      if (a4[9]) {
        v33 |= 4u;
      }
      sub_224A9CC8C(a1 + v21, a2 + v21, a3, a6, (uint64_t)a4, a7, a10 + v21, a11, (uint64_t)v40, v23, a12, a13, v33);
      v22 += 32;
      uint64_t v21 = v22;
    }
    while (v22 < a5);
  }
}

void sub_224AF8BB0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, unint64_t a5, uint64_t a6, uint64_t a7, int a8, signed int a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (a4[53]) {
    BOOL v14 = a9 <= 0;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = *a4;
  if (v14) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  int32x2_t v17 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)vdupq_n_s64(v16 - 1), (uint64x2_t)xmmword_224B15990));
  int32x2_t v18 = vadd_s32(vdup_n_s32(a9), (int32x2_t)0xFFFFFFFF00000000);
  if (v17.i8[0])
  {
    int32x2_t v19 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v18, 0), (int8x8_t)0xFF00000000FFLL);
    v42[0] = vorr_s8((int8x8_t)v19, (int8x8_t)vdup_lane_s32(v19, 1)).u32[0] ^ v15;
  }
  if (v17.i8[4])
  {
    int32x2_t v20 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v18, 1), (int8x8_t)0xFF00000000FFLL);
    v42[1] = vorr_s8((int8x8_t)v20, (int8x8_t)vdup_lane_s32(v20, 1)).u32[0] ^ v15;
  }
  if (a5)
  {
    uint64_t v21 = 0;
    unsigned int v22 = 0;
    uint64_t v23 = a8;
    do
    {
      int v24 = a4[53];
      if (v22) {
        BOOL v25 = v24 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      int v26 = !v25;
      uint64_t v27 = &v41;
      uint64_t v28 = v16;
      if (!v25)
      {
        do
        {
          *(_DWORD *)uint64_t v27 = *((_DWORD *)v27 - 2);
          uint64_t v27 = (uint64_t *)((char *)v27 + 4);
          --v28;
        }
        while (v28);
      }
      for (uint64_t i = 0; i != v16; ++i)
      {
        int v30 = v42[i];
        int v31 = (((((v30 >> 3) ^ (v30 >> 12) ^ v30) ^ (v30 >> 1)) & 1) << 15) | (v30 >> 1);
        v42[i] = v31;
        v40[i] = BYTE1(v31);
      }
      if (a9) {
        BOOL v32 = v24 == 0;
      }
      else {
        BOOL v32 = 1;
      }
      int v33 = !v32;
      if (v26) {
        v33 |= 2u;
      }
      if (a4[9]) {
        v33 |= 4u;
      }
      sub_224A9CB74(a1 + v21, a2 + v21, a3, a6, (uint64_t)a4, a7, a10 + 2 * v22, a11, (uint64_t)v40, v23, a12, a13, v33);
      v22 += 16;
      uint64_t v21 = v22;
    }
    while (v22 < a5);
  }
}

void sub_224AF8DF0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, unint64_t a5, uint64_t a6, uint64_t a7, int a8, signed int a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (a4[53]) {
    BOOL v14 = a9 <= 0;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = *a4;
  if (v14) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  int32x2_t v17 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)vdupq_n_s64(v16 - 1), (uint64x2_t)xmmword_224B15990));
  int32x2_t v18 = vadd_s32(vdup_n_s32(a9), (int32x2_t)0xFFFFFFFF00000000);
  if (v17.i8[0])
  {
    int32x2_t v19 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v18, 0), (int8x8_t)0xFF00000000FFLL);
    v42[0] = vorr_s8((int8x8_t)v19, (int8x8_t)vdup_lane_s32(v19, 1)).u32[0] ^ v15;
  }
  if (v17.i8[4])
  {
    int32x2_t v20 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v18, 1), (int8x8_t)0xFF00000000FFLL);
    v42[1] = vorr_s8((int8x8_t)v20, (int8x8_t)vdup_lane_s32(v20, 1)).u32[0] ^ v15;
  }
  if (a5)
  {
    uint64_t v21 = 0;
    unsigned int v22 = 0;
    uint64_t v23 = a8;
    do
    {
      int v24 = a4[53];
      if (v22) {
        BOOL v25 = v24 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      int v26 = !v25;
      uint64_t v27 = &v41;
      uint64_t v28 = v16;
      if (!v25)
      {
        do
        {
          *(_DWORD *)uint64_t v27 = *((_DWORD *)v27 - 2);
          uint64_t v27 = (uint64_t *)((char *)v27 + 4);
          --v28;
        }
        while (v28);
      }
      for (uint64_t i = 0; i != v16; ++i)
      {
        int v30 = v42[i];
        int v31 = (((((v30 >> 3) ^ (v30 >> 12) ^ v30) ^ (v30 >> 1)) & 1) << 15) | (v30 >> 1);
        v42[i] = v31;
        v40[i] = BYTE1(v31);
      }
      if (a9) {
        BOOL v32 = v24 == 0;
      }
      else {
        BOOL v32 = 1;
      }
      int v33 = !v32;
      if (v26) {
        v33 |= 2u;
      }
      if (a4[9]) {
        v33 |= 4u;
      }
      sub_224A9CA68(a1 + v21, a2 + v21, a3, a6, (uint64_t)a4, a7, a10 + 2 * v22, a11, (uint64_t)v40, v23, a12, a13, v33);
      v22 += 16;
      uint64_t v21 = v22;
    }
    while (v22 < a5);
  }
}

void sub_224AF9030(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, unint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, signed int a9)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a4[53]) {
    BOOL v13 = a9 <= 0;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = *a4;
  if (v13) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2;
  }
  int32x2_t v16 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)vdupq_n_s64(v15 - 1), (uint64x2_t)xmmword_224B15990));
  int32x2_t v17 = vadd_s32(vdup_n_s32(a9), (int32x2_t)0xFFFFFFFF00000000);
  if (v16.i8[0])
  {
    int32x2_t v18 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v17, 0), (int8x8_t)0xFF00000000FFLL);
    v38[0] = vorr_s8((int8x8_t)v18, (int8x8_t)vdup_lane_s32(v18, 1)).u32[0] ^ v14;
  }
  if (v16.i8[4])
  {
    int32x2_t v19 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v17, 1), (int8x8_t)0xFF00000000FFLL);
    v38[1] = vorr_s8((int8x8_t)v19, (int8x8_t)vdup_lane_s32(v19, 1)).u32[0] ^ v14;
  }
  if (a5)
  {
    uint64_t v20 = 0;
    for (i = 0; i < a5; uint64_t v20 = i)
    {
      int v22 = a4[53];
      if (i) {
        BOOL v23 = v22 == 0;
      }
      else {
        BOOL v23 = 1;
      }
      int v24 = !v23;
      BOOL v25 = &v37;
      uint64_t v26 = v15;
      if (!v23)
      {
        do
        {
          *(_DWORD *)BOOL v25 = *((_DWORD *)v25 - 2);
          BOOL v25 = (uint64_t *)((char *)v25 + 4);
          --v26;
        }
        while (v26);
      }
      for (uint64_t j = 0; j != v15; ++j)
      {
        int v28 = v38[j];
        int v29 = (((((v28 >> 3) ^ (v28 >> 12) ^ v28) ^ (v28 >> 1)) & 1) << 15) | (v28 >> 1);
        v38[j] = v29;
        v36[j] = BYTE1(v29);
      }
      if (a9) {
        BOOL v30 = v22 == 0;
      }
      else {
        BOOL v30 = 1;
      }
      int v31 = !v30;
      if (v24) {
        v31 |= 2u;
      }
      sub_224A9C65C(a1 + v20, a2 + v20, a3, a6, a4[22], a7, (uint64_t)v36, a8, a4[54], v31);
      i += 32;
    }
  }
}

uint64_t sub_224AF9230(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, unint64_t a5, uint64_t a6, uint64_t a7, int a8, signed int a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  return sub_224AF926C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0, 0);
}

uint64_t sub_224AF926C(uint64_t result, uint64_t a2, uint64_t a3, int *a4, unint64_t a5, uint64_t a6, uint64_t a7, int a8, signed int a9, uint64_t a10, uint64_t a11, int a12, int a13, unsigned int a14, unsigned int a15)
{
  uint64_t v122 = result;
  uint64_t v140 = *MEMORY[0x263EF8340];
  int v15 = a4[54];
  if (a13) {
    int v16 = 235;
  }
  else {
    int v16 = 240;
  }
  if (!v15) {
    int v16 = 255;
  }
  if (a4[53]) {
    BOOL v17 = a9 <= 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = *a4;
  if (v17) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = 2;
  }
  int32x2_t v20 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)vdupq_n_s64(v19 - 1), (uint64x2_t)xmmword_224B15990));
  int32x2_t v21 = vadd_s32(vdup_n_s32(a9), (int32x2_t)0xFFFFFFFF00000000);
  if (v20.i8[0])
  {
    int32x2_t v22 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v21, 0), (int8x8_t)0xFF00000000FFLL);
    v139[0] = vorr_s8((int8x8_t)v22, (int8x8_t)vdup_lane_s32(v22, 1)).u32[0] ^ v18;
  }
  if (v20.i8[4])
  {
    int32x2_t v23 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v21, 1), (int8x8_t)0xFF00000000FFLL);
    v139[1] = vorr_s8((int8x8_t)v23, (int8x8_t)vdup_lane_s32(v23, 1)).u32[0] ^ v18;
  }
  BOOL v24 = v15 != 0;
  if (a5)
  {
    unsigned int v25 = 0;
    int v26 = 16 * v24;
    double result = 0x20u >> a14;
    unsigned int v27 = 2u >> a15;
    unsigned int v111 = 2u >> a15;
    if ((int)(2u >> a15) >= a8) {
      unsigned int v27 = a8;
    }
    int v28 = &a4[a12];
    signed int v113 = 2u >> a14;
    uint64_t v133 = v28 + 49;
    char v132 = v28 + 47;
    uint64_t v131 = v28 + 51;
    unsigned int v118 = (0x20u >> a15) + 3;
    int v110 = result + 3;
    LODWORD(v29) = a5;
    uint64_t v107 = v19;
    unint64_t v108 = a5;
    unsigned int v106 = 0x20u >> a14;
    do
    {
      int v112 = v29;
      uint64_t v29 = (int)v29;
      if ((int)v29 >= result) {
        uint64_t v29 = result;
      }
      uint64_t v129 = v29;
      int v30 = a5 - v25;
      if ((int)result < (int)(a5 - v25)) {
        int v30 = result;
      }
      int v121 = v30;
      int v31 = a4[53];
      if (v25) {
        BOOL v32 = v31 == 0;
      }
      else {
        BOOL v32 = 1;
      }
      int v33 = !v32;
      uint64_t v34 = &v137;
      uint64_t v35 = v19;
      if (!v32)
      {
        do
        {
          *uint64_t v34 = *(v34 - 2);
          ++v34;
          --v35;
        }
        while (v35);
      }
      for (uint64_t i = 0; i != v19; ++i)
      {
        int v37 = v139[i];
        int v38 = (((((v37 >> 3) ^ (v37 >> 12) ^ v37) ^ (v37 >> 1)) & 1) << 15) | (v37 >> 1);
        v139[i] = v38;
        *(&v135 + i) = BYTE1(v38);
      }
      if (v31) {
        BOOL v39 = a9 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      if (v39) {
        uint64_t v40 = 0;
      }
      else {
        uint64_t v40 = v27;
      }
      unsigned int v41 = 2u >> a14;
      if (v113 >= v121) {
        unsigned int v41 = v121;
      }
      if (v33) {
        uint64_t v42 = v41;
      }
      else {
        uint64_t v42 = 0;
      }
      uint64_t v134 = v42;
      if ((int)v40 < a8)
      {
        int v43 = ((v135 & 0xF) + 3) * v111;
        int v44 = ((v137 & 0xF) + 3) * v111;
        uint64_t v45 = (int)v40;
        int v46 = ((v135 >> 4) + 3) * v113 + 3;
        int v47 = v110 + ((v137 >> 4) + 3) * v113;
        do
        {
          if ((int)v134 < v121)
          {
            int v48 = v134;
            uint64_t v49 = v129 - (int)v134;
            do
            {
              uint64_t v50 = v25 + v48;
              uint64_t v51 = (unsigned __int8 *)(a10 + (int)(v45 << a15) * a11 + (int)(v50 << a14));
              unsigned int v52 = *v51;
              if (a14) {
                unsigned int v52 = ((v52 + v51[1] + 1) >> 1);
              }
              int v53 = *(unsigned __int8 *)(a2 + v45 * a3 + v50);
              if (!a4[9])
              {
                int v54 = *v131 + ((int)(*v133 * v52 + *v132 * v53) >> 6);
                if (v54 >= 255) {
                  int v54 = 255;
                }
                unsigned int v52 = v54 & ~(v54 >> 31);
              }
              int v55 = ((*(unsigned __int8 *)(a6 + v52) * *(char *)(a7 + 82 * ((int)v45 + v43 + 3) + v46 + v48)
                    + (1 << a4[22] >> 1)) >> a4[22])
                  + v53;
              if (v55 >= v16) {
                char v56 = v16;
              }
              else {
                char v56 = v55;
              }
              if (v55 >= v26) {
                char v57 = v56;
              }
              else {
                char v57 = v26;
              }
              *(unsigned char *)(v122 + v45 * a3 + v50) = v57;
              ++v48;
              --v49;
            }
            while (v49);
          }
          if ((int)v134 >= 1)
          {
            int v58 = 0;
            long long v59 = (_DWORD *)((char *)&unk_224B28C50 + 16 * a14 + 4);
            uint64_t v60 = v134;
            do
            {
              int v61 = (*v59 * *(char *)(a7 + 82 * (v43 + (int)v45 + 3) + v46 + v58)
                   + *(v59 - 1) * *(char *)(a7 + 82 * (v44 + (int)v45 + 3) + v47 + v58)
                   + 16) >> 5;
              if (v61 >= 127) {
                int v61 = 127;
              }
              if (v61 <= -128) {
                int v62 = -128;
              }
              else {
                int v62 = v61;
              }
              uint64_t v63 = v25 + v58;
              long long v64 = (unsigned __int8 *)(a10 + (int)(v45 << a15) * a11 + (int)(v63 << a14));
              unsigned int v65 = *v64;
              if (a14) {
                unsigned int v65 = ((v65 + v64[1] + 1) >> 1);
              }
              int v66 = *(unsigned __int8 *)(a2 + v45 * a3 + v63);
              if (!a4[9])
              {
                int v67 = *v131 + ((int)(*v133 * v65 + *v132 * v66) >> 6);
                if (v67 >= 255) {
                  int v67 = 255;
                }
                unsigned int v65 = v67 & ~(v67 >> 31);
              }
              v59 += 2;
              int v68 = ((v62 * *(unsigned __int8 *)(a6 + v65) + (1 << a4[22] >> 1)) >> a4[22]) + v66;
              if (v68 >= v16) {
                char v69 = v16;
              }
              else {
                char v69 = v68;
              }
              if (v68 >= v26) {
                char v70 = v69;
              }
              else {
                char v70 = v26;
              }
              *(unsigned char *)(v122 + v45 * a3 + v63) = v70;
              ++v58;
              --v60;
            }
            while (v60);
          }
          ++v45;
        }
        while (v45 != a8);
      }
      if ((int)v40 >= 1)
      {
        uint64_t v71 = 0;
        int v120 = ((v135 & 0xF) + 3) * v111;
        int v119 = ((v136 & 0xF) + 3) * v111;
        int v116 = ((v138 & 0xF) + 3) * v111;
        int v115 = ((v137 & 0xF) + 3) * v111;
        uint64_t v114 = v129 - (int)v134;
        int v72 = ((v136 >> 4) + 3) * v113 + 3;
        int v127 = ((v135 >> 4) + 3) * v113 + 3;
        int v130 = v110 + ((v137 >> 4) + 3) * v113;
        int v128 = v110 + ((v138 >> 4) + 3) * v113;
        int v73 = v72;
        int v117 = v72;
        do
        {
          int v125 = v71 << a15;
          if ((int)v134 < v121)
          {
            uint64_t v74 = (int *)((char *)&unk_224B28C50 + 16 * a15 + 8 * v71);
            int v75 = *v74;
            int v76 = v74[1];
            int v77 = v134;
            uint64_t v78 = v114;
            do
            {
              int v79 = (v76 * *(char *)(a7 + 82 * ((int)v71 + v120 + 3) + v127 + v77)
                   + v75 * *(char *)(a7 + 82 * (int)(v118 + v71 + v119) + v72 + v77)
                   + 16) >> 5;
              if (v79 >= 127) {
                int v79 = 127;
              }
              if (v79 <= -128) {
                int v80 = -128;
              }
              else {
                int v80 = v79;
              }
              uint64_t v81 = v25 + v77;
              uint64_t v82 = (unsigned __int8 *)(a10 + v125 * a11 + (int)(v81 << a14));
              unsigned int v83 = *v82;
              if (a14) {
                unsigned int v83 = ((v83 + v82[1] + 1) >> 1);
              }
              int v84 = *(unsigned __int8 *)(a2 + v71 * a3 + v81);
              if (!a4[9])
              {
                int v85 = *v131 + ((int)(*v133 * v83 + *v132 * v84) >> 6);
                if (v85 >= 255) {
                  int v85 = 255;
                }
                unsigned int v83 = v85 & ~(v85 >> 31);
              }
              int v86 = ((v80 * *(unsigned __int8 *)(a6 + v83) + (1 << a4[22] >> 1)) >> a4[22]) + v84;
              if (v86 >= v16) {
                char v87 = v16;
              }
              else {
                char v87 = v86;
              }
              if (v86 >= v26) {
                char v88 = v87;
              }
              else {
                char v88 = v26;
              }
              *(unsigned char *)(v122 + v71 * a3 + v81) = v88;
              ++v77;
              --v78;
            }
            while (v78);
          }
          uint64_t v126 = v71;
          if ((int)v134 >= 1)
          {
            uint64_t v89 = 0;
            uint64_t v90 = (int *)((char *)&unk_224B28C50 + 16 * a15 + 8 * v71);
            int v92 = *v90;
            int v91 = v90[1];
            uint64_t v93 = (_DWORD *)((char *)&unk_224B28C50 + 16 * a14 + 4);
            do
            {
              int v94 = *(v93 - 1);
              int v95 = (*v93 * *(char *)(a7 + 82 * (int)(v119 + v118 + v71) + v73 + (int)v89)
                   + v94 * *(char *)(a7 + 82 * (int)(v116 + v118 + v71) + v128 + (int)v89)
                   + 16) >> 5;
              if (v95 >= 127) {
                int v95 = 127;
              }
              if (v95 <= -128) {
                int v95 = -128;
              }
              int v96 = (v94 * *(char *)(a7 + 82 * (v115 + (int)v71 + 3) + v130 + (int)v89)
                   + *v93 * *(char *)(a7 + 82 * (v120 + (int)v71 + 3) + v127 + (int)v89)
                   + 16) >> 5;
              if (v96 >= 127) {
                int v96 = 127;
              }
              if (v96 <= -128) {
                int v96 = -128;
              }
              int v97 = (v96 * v91 + v95 * v92 + 16) >> 5;
              if (v97 >= 127) {
                int v97 = 127;
              }
              if (v97 <= -128) {
                int v98 = -128;
              }
              else {
                int v98 = v97;
              }
              uint64_t v99 = (unsigned __int8 *)(a10 + v125 * a11 + (int)((v25 + v89) << a14));
              unsigned int v100 = *v99;
              if (a14) {
                unsigned int v100 = ((v100 + v99[1] + 1) >> 1);
              }
              int v101 = *(unsigned __int8 *)(a2 + v71 * a3 + v25 + v89);
              if (!a4[9])
              {
                int v102 = *v131 + ((int)(*v133 * v100 + *v132 * v101) >> 6);
                if (v102 >= 255) {
                  int v102 = 255;
                }
                unsigned int v100 = v102 & ~(v102 >> 31);
              }
              v93 += 2;
              int v103 = ((v98 * *(unsigned __int8 *)(a6 + v100) + (1 << a4[22] >> 1)) >> a4[22]) + v101;
              if (v103 >= v16) {
                char v104 = v16;
              }
              else {
                char v104 = v103;
              }
              if (v103 >= v26) {
                char v105 = v104;
              }
              else {
                char v105 = v26;
              }
              *(unsigned char *)(v122 + v71 * a3 + v25 + v89++) = v105;
            }
            while (v134 != v89);
          }
          ++v71;
          int v72 = v117;
        }
        while (v126 + 1 != v40);
      }
      double result = 0x20u >> a14;
      uint64_t v19 = v107;
      v25 += v106;
      LODWORD(v29) = v112 - v106;
      LODWORD(a5) = v108;
    }
    while (v108 > v25);
  }
  return result;
}

uint64_t sub_224AF9C38(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, unint64_t a5, uint64_t a6, uint64_t a7, int a8, signed int a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  return sub_224AF926C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 1u, 0);
}

uint64_t sub_224AF9C78(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, unint64_t a5, uint64_t a6, uint64_t a7, int a8, signed int a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  return sub_224AF926C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 1u, 1u);
}

unsigned char *sub_224AF9CB8(unsigned char *result, unsigned __int8 *a2, uint64_t a3, int *a4, unint64_t a5, uint64_t a6, uint64_t a7, int a8, double a9, double a10, double a11, double a12, double a13, int32x2_t a14, int32x2_t a15, signed int a16)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  int v16 = a4[54];
  if (v16) {
    int v17 = 235;
  }
  else {
    int v17 = 255;
  }
  if (a4[53]) {
    BOOL v18 = a16 <= 0;
  }
  else {
    BOOL v18 = 1;
  }
  int v19 = *a4;
  if (v18) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = 2;
  }
  int32x2_t v21 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)vdupq_n_s64(v20 - 1), (uint64x2_t)xmmword_224B15990));
  int32x2_t v22 = vadd_s32(vdup_n_s32(a16), (int32x2_t)0xFFFFFFFF00000000);
  if (v21.i8[0])
  {
    int32x2_t v23 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v22, 0), (int8x8_t)0xFF00000000FFLL);
    v129[0] = vorr_s8((int8x8_t)v23, (int8x8_t)vdup_lane_s32(v23, 1)).u32[0] ^ v19;
  }
  if (v21.i8[4])
  {
    int32x2_t v24 = (int32x2_t)vand_s8((int8x8_t)vmla_lane_s32((int32x2_t)0xB20000000069, (int32x2_t)0x2500000000ADLL, v22, 1), (int8x8_t)0xFF00000000FFLL);
    v129[1] = vorr_s8((int8x8_t)v24, (int8x8_t)vdup_lane_s32(v24, 1)).u32[0] ^ v19;
  }
  BOOL v25 = v16 != 0;
  if (a5)
  {
    LODWORD(v26) = 0;
    int v27 = 16 * v25;
    if (a8 >= 2) {
      int v28 = 2;
    }
    else {
      int v28 = a8;
    }
    unsigned int v100 = v28;
    LODWORD(v29) = a5;
    uint64_t v101 = v20;
    unint64_t v102 = a5;
    do
    {
      int v104 = v29;
      int v105 = v26;
      uint64_t v29 = (int)v29;
      if ((int)v29 >= 32) {
        uint64_t v29 = 32;
      }
      uint64_t v119 = v29;
      LODWORD(v29) = a5 - v26;
      if ((int)a5 - (int)v26 >= 32) {
        int v30 = 32;
      }
      else {
        int v30 = a5 - v26;
      }
      int v118 = v30;
      int v31 = a4[53];
      if (v26) {
        BOOL v32 = v31 == 0;
      }
      else {
        BOOL v32 = 1;
      }
      int v33 = !v32;
      uint64_t v34 = &v127;
      uint64_t v35 = v20;
      if (!v32)
      {
        do
        {
          *uint64_t v34 = *(v34 - 2);
          ++v34;
          --v35;
        }
        while (v35);
      }
      for (uint64_t i = 0; i != v20; ++i)
      {
        int v37 = v129[i];
        int v38 = (((((v37 >> 3) ^ (v37 >> 12) ^ v37) ^ (v37 >> 1)) & 1) << 15) | (v37 >> 1);
        v129[i] = v38;
        *(&v125 + i) = BYTE1(v38);
      }
      if (v31) {
        BOOL v39 = a16 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      if (v39) {
        uint64_t v40 = 0;
      }
      else {
        uint64_t v40 = v100;
      }
      if ((int)v29 >= 2) {
        LODWORD(v29) = 2;
      }
      if (v33) {
        uint64_t v29 = v29;
      }
      else {
        uint64_t v29 = 0;
      }
      uint64_t v123 = v29;
      uint64_t v114 = v40;
      uint64_t v124 = result;
      if ((int)v40 < a8)
      {
        int v41 = 2 * (v125 & 0xF);
        int v42 = 2 * (v127 & 0xF);
        uint64_t v43 = (int)v40;
        uint64_t v44 = a3 * (int)v40;
        uint64_t v45 = v44 + (int)v123;
        int v46 = &result[v45];
        int v47 = &a2[v45];
        unsigned int v48 = ((v125 >> 3) & 0xFFFFFFFE) + 9;
        unsigned int v49 = ((v127 >> 3) & 0xFFFFFFFE) + 41;
        do
        {
          if ((int)v123 < v118)
          {
            int v50 = v48 + v123;
            uint64_t v51 = v47;
            unsigned int v52 = v46;
            uint64_t v53 = v119 - (int)v123;
            do
            {
              unsigned int v54 = *v51++;
              int v55 = ((*(unsigned __int8 *)(a6 + v54) * *(char *)(a7 + 82 * ((int)v43 + v41 + 9) + v50)
                    + (1 << a4[22] >> 1)) >> a4[22])
                  + v54;
              if (v55 >= v17) {
                char v56 = v17;
              }
              else {
                char v56 = v55;
              }
              if (v55 >= v27) {
                char v57 = v56;
              }
              else {
                char v57 = v27;
              }
              *v52++ = v57;
              ++v50;
              --v53;
            }
            while (v53);
          }
          if ((int)v123 >= 1)
          {
            signed int v58 = v49;
            long long v59 = (_DWORD *)qword_224B28C40 + 1;
            signed int v60 = v48;
            uint64_t v61 = v44;
            uint64_t v62 = v123;
            do
            {
              int v63 = (*v59 * *(char *)(a7 + 82 * ((int)v43 + 9 + v41) + v60)
                   + *(v59 - 1) * *(char *)(a7 + 82 * ((int)v43 + 9 + v42) + v58)
                   + 16) >> 5;
              if (v63 >= 127) {
                int v63 = 127;
              }
              if (v63 <= -128) {
                int v63 = -128;
              }
              int v64 = ((v63 * *(unsigned __int8 *)(a6 + a2[v61]) + (1 << a4[22] >> 1)) >> a4[22]) + a2[v61];
              if (v64 >= v17) {
                char v65 = v17;
              }
              else {
                char v65 = v64;
              }
              if (v64 >= v27) {
                char v66 = v65;
              }
              else {
                char v66 = v27;
              }
              v124[v61++] = v66;
              ++v60;
              v59 += 2;
              ++v58;
              --v62;
            }
            while (v62);
          }
          ++v43;
          v46 += a3;
          v47 += a3;
          v44 += a3;
        }
        while (v43 != a8);
      }
      unsigned int v106 = a2;
      if ((int)v114 >= 1)
      {
        uint64_t v122 = 0;
        unsigned int v67 = (v125 >> 3) & 0xFFFFFFFE;
        int v116 = 2 * (v125 & 0xF);
        unsigned int v68 = (v126 >> 3) & 0xFFFFFFFE;
        int v115 = 2 * (v126 & 0xF);
        uint64_t v69 = v119 - (int)v123;
        char v70 = &v124[(int)v123];
        uint64_t v71 = &a2[(int)v123];
        int v112 = 2 * (v128 & 0xF);
        int v111 = 2 * (v127 & 0xF);
        int v72 = v123 + 9 + v68;
        int v73 = v123 + 9 + v67;
        unsigned int v110 = ((v127 >> 3) & 0xFFFFFFFE) + 41;
        unsigned int v108 = v67 + 9;
        unsigned int v109 = ((v128 >> 3) & 0xFFFFFFFE) + 41;
        unsigned int v107 = v68 + 9;
        int v120 = v124;
        int v121 = a2;
        uint64_t v113 = v69;
        do
        {
          if ((int)v123 < v118)
          {
            uint64_t v74 = 0;
            int v75 = &qword_224B28C40[v122];
            int v76 = *(_DWORD *)v75;
            int v77 = *((_DWORD *)v75 + 1);
            do
            {
              int v78 = (v77 * *(char *)(a7 + 82 * ((int)v122 + v116 + 9) + v73 + (int)v74)
                   + v76 * *(char *)(a7 + 82 * ((int)v122 + v115 + 41) + v72 + (int)v74)
                   + 16) >> 5;
              if (v78 >= 127) {
                int v78 = 127;
              }
              if (v78 <= -128) {
                int v78 = -128;
              }
              int v79 = ((v78 * *(unsigned __int8 *)(a6 + v71[v74]) + (1 << a4[22] >> 1)) >> a4[22]) + v71[v74];
              if (v79 >= v17) {
                char v80 = v17;
              }
              else {
                char v80 = v79;
              }
              if (v79 >= v27) {
                char v81 = v80;
              }
              else {
                char v81 = v27;
              }
              v70[v74++] = v81;
            }
            while (v69 != v74);
          }
          if ((int)v123 >= 1)
          {
            signed int v82 = v110;
            unsigned int v83 = qword_224B28C40;
            int32x2_t v84 = (int32x2_t)qword_224B28C40[v122];
            signed int v85 = v107;
            signed int v86 = v108;
            signed int v87 = v109;
            char v88 = v120;
            uint64_t v89 = v121;
            uint64_t v90 = v123;
            do
            {
              int32x2_t v91 = (int32x2_t)*v83++;
              a14.i8[0] = *(unsigned char *)(a7 + 82 * (v112 + (int)v122 + 41) + v87);
              a14.i8[4] = *(unsigned char *)(a7 + 82 * (v116 + (int)v122 + 9) + v86);
              a15.i8[0] = *(unsigned char *)(a7 + 82 * (v115 + (int)v122 + 41) + v85);
              a15.i8[4] = *(unsigned char *)(a7 + 82 * (v111 + (int)v122 + 9) + v82);
              a14 = vshr_n_s32(vshl_n_s32(a14, 0x18uLL), 0x18uLL);
              a15 = vmla_s32(vmul_s32(vrev64_s32(v91), vshr_n_s32(vshl_n_s32(a15, 0x18uLL), 0x18uLL)), v91, a14);
              int32x2_t v92 = vmul_s32(vmax_s32(vmin_s32(vshr_n_s32(vadd_s32(a15, (int32x2_t)0x1000000010), 5uLL), (int32x2_t)0x7F0000007FLL), (int32x2_t)0x7F0000007FLL), v84);
              int v93 = (v92.i32[0] + v92.i32[1] + 16) >> 5;
              if (v93 >= 127) {
                int v93 = 127;
              }
              unsigned int v95 = *v89++;
              unsigned int v94 = v95;
              int v96 = *(unsigned __int8 *)(a6 + v95);
              if (v93 <= -128) {
                int v93 = -128;
              }
              int v97 = ((v93 * v96 + (1 << a4[22] >> 1)) >> a4[22]) + v94;
              if (v97 >= v17) {
                char v98 = v17;
              }
              else {
                char v98 = v97;
              }
              if (v97 >= v27) {
                char v99 = v98;
              }
              else {
                char v99 = v27;
              }
              *v88++ = v99;
              ++v82;
              ++v87;
              ++v86;
              ++v85;
              --v90;
            }
            while (v90);
          }
          v70 += a3;
          v71 += a3;
          v120 += a3;
          v121 += a3;
          ++v122;
          uint64_t v69 = v113;
        }
        while (v122 != v114);
      }
      unint64_t v26 = (v105 + 32);
      LODWORD(v29) = v104 - 32;
      double result = v124 + 32;
      a2 = v106 + 32;
      uint64_t v20 = v101;
      LODWORD(a5) = v102;
    }
    while (v26 < v102);
  }
  return result;
}

unsigned char *sub_224AFA3F0(unsigned char *a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  return sub_224AFA3FC(a1, a2, a3, a4, 0, 0);
}

unsigned char *sub_224AFA3FC(unsigned char *result, uint64_t a2, _DWORD *a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = 0;
  if (a4) {
    int v7 = 18904;
  }
  else {
    int v7 = 46372;
  }
  int v8 = *a3 ^ v7;
  int v9 = a3[46] + 4;
  if (a5) {
    uint64_t v10 = 44;
  }
  else {
    uint64_t v10 = 82;
  }
  if (a6) {
    uint64_t v11 = 38;
  }
  else {
    uint64_t v11 = 73;
  }
  uint64_t v12 = result;
  do
  {
    BOOL v13 = v12;
    uint64_t v14 = v10;
    do
    {
      int v8 = (((((v8 >> 3) ^ (v8 >> 12) ^ v8) ^ (v8 >> 1)) & 1) << 15) | (v8 >> 1);
      *v13++ = ((1 << v9 >> 1) + word_224B28F0A[(unsigned __int16)v8 >> 5]) >> v9;
      --v14;
    }
    while (v14);
    ++v6;
    v12 += 82;
  }
  while (v6 != v11);
  int v15 = a3[23];
  uint64_t v16 = (uint64_t)&a3[7 * a4 + 30];
  if (v15 >= 0) {
    int v17 = a3[23];
  }
  else {
    int v17 = -v15;
  }
  uint64_t v18 = (v10 - 3);
  uint64_t v19 = (v15 + v17);
  uint64_t v20 = v19 + 1;
  int v21 = v19 + 1;
  uint64_t v22 = (uint64_t)&result[-83 * v15 + 249];
  uint64_t v23 = 3;
  uint64_t v44 = v11;
  do
  {
    uint64_t v47 = v22;
    uint64_t v24 = 3;
    do
    {
      int v25 = 0;
      if ((v15 & 0x80000000) == 0)
      {
        unint64_t v26 = (char *)v22;
        int v27 = -v15;
        int v28 = (char *)v16;
        do
        {
          uint64_t v29 = &v28[v20];
          int v30 = v26;
          int v31 = v21;
          int v32 = -v15;
          while (v32 | v27)
          {
            int v34 = *v28++;
            int v33 = v34;
            int v35 = *v30++;
            v25 += v35 * v33;
            ++v32;
            if (!--v31)
            {
              int v28 = v29;
              goto LABEL_31;
            }
          }
          if (a3[1])
          {
            uint64_t v36 = 0;
            int v37 = 0;
            uint64_t v38 = a2 + 82 * ((((int)v23 - 3) << a6) + 3) + (((int)v24 - 3) << a5) + 3;
            do
            {
              BOOL v39 = (char *)v38;
              uint64_t v40 = (a5 + 1);
              do
              {
                int v41 = *v39++;
                v37 += v41;
                --v40;
              }
              while (v40);
              ++v36;
              v38 += 82;
            }
            while (v36 != a6 + 1);
            v25 += ((int)(v37 + ((1 << (a6 + a5)) >> 1)) >> (a6 + a5)) * *v28;
          }
LABEL_31:
          ++v27;
          v26 += 82;
        }
        while (v27 != 1);
      }
      int v42 = &result[82 * v23];
      int v43 = ((v25 + (1 << a3[44] >> 1)) >> a3[44]) + (char)v42[v24];
      if (v43 >= 127) {
        int v43 = 127;
      }
      if (v43 <= -128) {
        LOBYTE(v43) = 0x80;
      }
      v42[v24++] = v43;
      ++v22;
    }
    while (v24 != v18);
    ++v23;
    uint64_t v22 = v47 + 82;
  }
  while (v23 != v44);
  return result;
}

unsigned char *sub_224AFA698(unsigned char *a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  return sub_224AFA3FC(a1, a2, a3, a4, 1, 0);
}

unsigned char *sub_224AFA6A4(unsigned char *a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  return sub_224AFA3FC(a1, a2, a3, a4, 1, 1);
}

uint64_t sub_224AFA6B0(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = 0;
  int v3 = *a2;
  int v4 = a2[46] + 4;
  int v5 = 1 << (*((unsigned char *)a2 + 184) + 4) >> 1;
  uint64_t v6 = result;
  do
  {
    for (uint64_t i = 0; i != 82; ++i)
    {
      int v3 = (((((v3 >> 3) ^ (v3 >> 12) ^ v3) ^ (v3 >> 1)) & 1) << 15) | (v3 >> 1);
      *(unsigned char *)(v6 + i) = (v5 + word_224B28F0A[(unsigned __int16)v3 >> 5]) >> v4;
    }
    ++v2;
    v6 += 82;
  }
  while (v2 != 73);
  uint64_t v8 = (int)a2[23];
  uint64_t v9 = -(int)v8;
  uint64_t v10 = result + 83 * v9 + 249;
  for (uint64_t j = 3; j != 73; ++j)
  {
    uint64_t v12 = v10;
    for (uint64_t k = 3; k != 79; ++k)
    {
      int v14 = 0;
      if ((v8 & 0x80000000) == 0)
      {
        int v15 = (char *)v12;
        int v16 = -(int)v8;
        int v17 = (char *)(a2 + 24);
        do
        {
          uint64_t v18 = v15;
          uint64_t v19 = -(int)v8;
          if (v16 | v9)
          {
            do
            {
              int v21 = *v17++;
              int v20 = v21;
              int v22 = *v18++;
              v14 += v22 * v20;
              if (v19 >= v8) {
                break;
              }
              ++v19;
            }
            while (v19 | v16);
          }
          ++v16;
          v15 += 82;
        }
        while (v16 != 1);
      }
      uint64_t v23 = result + 82 * j;
      int v24 = ((v14 + (1 << a2[44] >> 1)) >> a2[44]) + *(char *)(v23 + k);
      if (v24 >= 127) {
        int v24 = 127;
      }
      if (v24 <= -128) {
        LOBYTE(v24) = 0x80;
      }
      *(unsigned char *)(v23 + k) = v24;
      ++v12;
    }
    v10 += 82;
  }
  return result;
}

uint64_t sub_224AFA814(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 64);
  uint64_t v4 = (int)(((*(_DWORD *)(a1 + 56) + 127) & 0xFFFFFF80) << (*(_DWORD *)(a1 + 68) > 8));
  uint64_t v5 = v4 >> (v3 != 3);
  if (v3) {
    uint64_t v6 = v4 >> (v3 != 3);
  }
  else {
    uint64_t v6 = 0;
  }
  if ((v6 & 0x3C0) == 0) {
    uint64_t v5 = v6 + 64;
  }
  unint64_t v7 = (*(int *)(a1 + 60) + 127) & 0xFFFFFFFFFFFFFF80;
  if (!v3) {
    uint64_t v5 = 0;
  }
  if ((v4 & 0x380) == 0) {
    v4 |= 0x40uLL;
  }
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  unint64_t v8 = v4 * v7;
  uint64_t v9 = v5 * ((int)v7 >> (v3 == 1));
  uint64_t v10 = sub_224AE4B24(a2, (char *)((v4 * v7 + 2 * v9) | 0x30));
  if (!v10) {
    return 4294967284;
  }
  uint64_t v11 = v10;
  uint64_t result = 0;
  *(void *)(a1 + 264) = v11;
  uint64_t v13 = *(void *)v11;
  if (v3) {
    uint64_t v14 = v13 + v8;
  }
  else {
    uint64_t v14 = 0;
  }
  *(void *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v14;
  unint64_t v15 = v13 + v8 + v9;
  if (!v3) {
    unint64_t v15 = 0;
  }
  *(void *)(a1 + 32) = v15;
  return result;
}

void sub_224AFA904(uint64_t a1, uint64_t a2)
{
}

void sub_224AFA914(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 8))
  {
    unint64_t v3 = 0;
    uint64_t v4 = 16;
    do
    {
      free(*(void **)(*(void *)a2 + v4));
      ++v3;
      v4 += 24;
    }
    while (v3 < *(void *)(a2 + 8));
  }
  free(*(void **)a2);

  free((void *)a2);
}

void sub_224AFA988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long *a9)
{
  sub_224AF722C((uint64_t *)(a1 + 112));
  long long v17 = *a9;
  long long v18 = a9[1];
  *(_OWORD *)(a1 + 104) = a9[2];
  *(_OWORD *)(a1 + 88) = v18;
  *(_OWORD *)(a1 + 72) = v17;
  uint64_t v19 = *(void *)(a1 + 112);
  if (v19) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v19 + 16), 1u, memory_order_relaxed);
  }
  sub_224AF722C((uint64_t *)(a1 + 200));
  *(void *)(a1 + 200) = a3;
  *(void *)(a1 + 120) = a2;
  if (a3) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(a3 + 16), 1u, memory_order_relaxed);
  }
  sub_224AF722C((uint64_t *)(a1 + 208));
  *(void *)(a1 + 208) = a5;
  *(void *)(a1 + 128) = a4;
  if (a5) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(a5 + 16), 1u, memory_order_relaxed);
  }
  sub_224AF722C((uint64_t *)(a1 + 216));
  *(void *)(a1 + 216) = a7;
  *(void *)(a1 + 136) = a6;
  *(void *)(a1 + 144) = a8;
  if (a7) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(a7 + 16), 1u, memory_order_relaxed);
  }
}

uint64_t sub_224AFAA78(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, long long *a10, void *a11)
{
  if (a2[2])
  {
    sub_224B11AE8(a1, (uint64_t)"Picture already allocated!\n", a3, a4, a5, a6, a7, a8, v29);
    return 0xFFFFFFFFLL;
  }
  else
  {
    int v14 = a4;
    int v15 = a3;
    unsigned int v17 = *(_DWORD *)(a1 + 8);
    long long v18 = (uint64_t *)(a1 + 63184);
    uint64_t v19 = *(void *)(a1 + 63184);
    if (v17 <= 1) {
      uint64_t v20 = 336;
    }
    else {
      uint64_t v20 = 344;
    }
    int v21 = sub_224AE4B24(v19, (char *)v20);
    if (v21)
    {
      uint64_t v22 = (uint64_t)v21;
      uint64_t v23 = *(void *)v21;
      *((_DWORD *)a2 + 14) = v15;
      *((_DWORD *)a2 + 15) = v14;
      *a2 = a5;
      a2[1] = a7;
      *((_DWORD *)a2 + 16) = *(_DWORD *)(a5 + 12);
      *((_DWORD *)a2 + 17) = a9;
      *((_OWORD *)a2 + 5) = 0u;
      *((_OWORD *)a2 + 6) = 0u;
      a2[14] = 0;
      a2[9] = 0x8000000000000000;
      a2[11] = -1;
      uint64_t v24 = (*((uint64_t (**)(uint64_t *, void))a10 + 1))(a2, *(void *)a10);
      if ((v24 & 0x80000000) != 0)
      {
        uint64_t v27 = v24;
        sub_224AE4A74(*v18, v22);
      }
      else
      {
        long long v25 = *a10;
        *(void *)(v23 + 16) = *((void *)a10 + 2);
        *(_OWORD *)uint64_t v23 = v25;
        memcpy((void *)(v23 + 24), a2, 0x110uLL);
        uint64_t v26 = *v18;
        *(void *)(v23 + 296) = 0;
        *(void *)(v23 + 304) = v22;
        *(void *)(v23 + 312) = 1;
        *(void *)(v23 + 320) = sub_224AFAC28;
        *(void *)(v23 + 328) = v26;
        a2[32] = v23 + 296;
        a2[24] = a6;
        if (a6) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(a6 + 16), 1u, memory_order_relaxed);
        }
        a2[23] = a8;
        if (a8) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(a8 + 16), 1u, memory_order_relaxed);
        }
        uint64_t v27 = 0;
        if (a11 && v17 >= 2)
        {
          uint64_t v27 = 0;
          *a11 = v23 + 336;
        }
      }
    }
    else
    {
      return 4294967284;
    }
  }
  return v27;
}

void sub_224AFAC28(void **a1, uint64_t a2)
{
  ((void (*)(void *, void))(*a1)[2])(*a1 + 3, **a1);

  sub_224AE4A74(a2, (uint64_t)a1);
}

uint64_t sub_224AFAC78(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_224AFAA78(a1, a2, a3, *(unsigned int *)(a4 + 60), *(void *)a4, *(void *)(a4 + 192), *(void *)(a4 + 8), *(void *)(a4 + 184), *(_DWORD *)(a4 + 68), **(long long ***)(*(void *)(a4 + 256) + 8), 0);
  if (!v6) {
    sub_224AFA988((uint64_t)a2, *(void *)(a4 + 120), *(void *)(a4 + 200), *(void *)(a4 + 128), *(void *)(a4 + 208), *(void *)(a4 + 136), *(void *)(a4 + 216), *(void *)(a4 + 144), (long long *)(a4 + 72));
  }
  return v6;
}

void *sub_224AFAD00(void *a1, void *a2)
{
  uint64_t v2 = a2[32];
  if (v2) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 16), 1u, memory_order_relaxed);
  }
  uint64_t v3 = a2[23];
  if (v3) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v3 + 16), 1u, memory_order_relaxed);
  }
  uint64_t v4 = a2[24];
  if (v4) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v4 + 16), 1u, memory_order_relaxed);
  }
  uint64_t v5 = a2[14];
  if (v5) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v5 + 16), 1u, memory_order_relaxed);
  }
  uint64_t v6 = a2[25];
  if (v6) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v6 + 16), 1u, memory_order_relaxed);
  }
  uint64_t v7 = a2[26];
  if (v7) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v7 + 16), 1u, memory_order_relaxed);
  }
  uint64_t v8 = a2[27];
  if (v8) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v8 + 16), 1u, memory_order_relaxed);
  }
  return memcpy(a1, a2, 0x110uLL);
}

double sub_224AFAD94(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 256))
    {
      if (!*(void *)(a1 + 16)) {
        return result;
      }
      sub_224AF722C((uint64_t *)(a1 + 256));
    }
    sub_224AF722C((uint64_t *)(a1 + 192));
    sub_224AF722C((uint64_t *)(a1 + 184));
    sub_224AF722C((uint64_t *)(a1 + 112));
    sub_224AF722C((uint64_t *)(a1 + 200));
    sub_224AF722C((uint64_t *)(a1 + 208));
    sub_224AF722C((uint64_t *)(a1 + 216));
    double result = 0.0;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    *(void *)(a1 + 72) = 0x8000000000000000;
    *(void *)(a1 + 88) = -1;
  }
  return result;
}

uint64_t sub_224AFAE3C(uint64_t result, uint64_t *a2, uint64_t a3, int a4, int a5, int a6, int a7)
{
  uint64_t v175 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)(result + 8);
  int v8 = *(_DWORD *)(v7 + 2168);
  char v141 = v8 != 3;
  int v150 = v8;
  BOOL v9 = v8 == 2;
  if (a4 < a5)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)(v7 + 24);
    uint64_t v133 = (char *)&unk_224B28C70 + 8 * v9;
    unsigned int v12 = *(_DWORD *)(*(void *)(v7 + 3256) + 24);
    uint64_t v13 = *(void *)(v7 + 2144);
    uint64_t v14 = *(uint64_t *)(v7 + 2152) >> 1;
    uint64_t v15 = v13 >> 1;
    unsigned int v16 = a4;
    if (a4 <= 0) {
      int v17 = 8;
    }
    else {
      int v17 = 12;
    }
    uint64_t v18 = *(unsigned __int8 *)(*(void *)(v7 + 8) + 392);
    BOOL v19 = a6 != 0;
    uint64_t v20 = 6;
    if (v150 == 1) {
      uint64_t v20 = 2;
    }
    uint64_t v111 = v20;
    uint64_t v21 = 7;
    if (v150 == 1) {
      uint64_t v21 = 3;
    }
    uint64_t v110 = v21;
    int v22 = (4 << v18) * a7;
    int v23 = 4 * a7 - 4;
    int v24 = v22 - 4;
    unsigned int v169 = *(_DWORD *)(*(void *)(v7 + 3256) + 24);
    if (v12 < 2) {
      BOOL v19 = 1;
    }
    BOOL v117 = v19;
    if (v12 >= 2) {
      int v25 = a7;
    }
    else {
      int v25 = 0;
    }
    uint64_t v112 = v14 * 8 * v25;
    uint64_t v113 = v15 * 4 * v25;
    uint64_t v26 = (4 * a7) | 2;
    uint64_t v125 = v15 * v26;
    uint64_t v27 = (4 * v18 + v22) | 2;
    uint64_t v28 = v23;
    uint64_t v128 = v15 * v23;
    uint64_t v129 = v15 * 4 * a7;
    if (v12 >= 2) {
      uint64_t v29 = v15 * 4 * a7;
    }
    else {
      uint64_t v29 = 0;
    }
    uint64_t v30 = v14 * 8 * a7;
    uint64_t v139 = v30;
    uint64_t v140 = v29;
    if (v12 < 2) {
      uint64_t v30 = 0;
    }
    int v165 = *(_DWORD *)(v11 + 236);
    int v164 = *(_DWORD *)(v11 + 240);
    if (v165 == v164) {
      uint64_t v28 = v24;
    }
    uint64_t v127 = v15 * v24;
    uint64_t v124 = v15 * v27;
    uint64_t v137 = v14 * v26;
    uint64_t v138 = v30;
    uint64_t v168 = v14 * (8u >> (v150 == 1));
    uint64_t v135 = v14 * v28;
    uint64_t v136 = v14 * v27;
    uint64_t v121 = a2[1];
    uint64_t v122 = *a2;
    uint64_t v120 = a2[2];
    int v132 = 2 * *(_DWORD *)(v7 + 3456);
    int v31 = a5;
    int v123 = *(_DWORD *)(v7 + 2172) - 8;
    uint64_t v151 = *(void *)(v7 + 3280);
    uint64_t v156 = 8u >> v141;
    uint64_t v130 = 0x40u >> v141;
    int v32 = v123 + *(unsigned __int8 *)(v11 + 847) - 1;
    uint64_t v148 = 4 * v13;
    uint64_t v149 = (uint64_t *)(v7 + 2144);
    int v116 = (int *)(result + 258544);
    int v33 = *(_DWORD *)(result + 258544);
    while (1)
    {
      if ((signed int)(v16 + 2) >= *(_DWORD *)(v7 + 3452)) {
        unsigned int v34 = v17 & 0xFFFFFFF7;
      }
      else {
        unsigned int v34 = v17;
      }
      signed int v119 = v16 + 2;
      int v35 = v117;
      if ((int)(v16 + 2) < v31) {
        int v35 = 1;
      }
      if (v35 == 1 && (v34 & 8) != 0)
      {
        int v37 = (void *)(v7 + 24 * (v33 == 0));
        uint64_t v38 = (char *)(v37[649] + 2 * v113);
        uint64_t v39 = v37[650];
        uint64_t v40 = v37[651];
        uint64_t v41 = v13 >> 1;
        if (v13 < 0)
        {
          v38 += 2 * v41;
          int v42 = (const void *)(v122 + 14 * v41);
          size_t v43 = -4 * v41;
        }
        else
        {
          int v42 = (const void *)(v122 + 12 * v41);
          size_t v43 = 2 * v13;
        }
        double result = (uint64_t)memcpy(v38, v42, v43);
        int v31 = a5;
        if (v150)
        {
          uint64_t v44 = (char *)(v39 + 2 * v112);
          uint64_t v45 = (char *)(v40 + 2 * v112);
          uint64_t v46 = *(void *)(v7 + 2152);
          uint64_t v47 = v46 >> 1;
          if (v46 < 0)
          {
            size_t v49 = -4 * v47;
            memcpy(&v44[2 * v47], (const void *)(v121 + 2 * v47 * v110), -4 * v47);
            uint64_t v51 = &v45[2 * v47];
            int v50 = (const void *)(v120 + 2 * v47 * v110);
          }
          else
          {
            uint64_t v48 = v47 * v111;
            size_t v49 = 2 * v46;
            memcpy(v44, (const void *)(v121 + 2 * v48), 2 * v46);
            int v50 = (const void *)(v120 + 2 * v48);
            uint64_t v51 = v45;
          }
          double result = (uint64_t)memcpy(v51, v50, v49);
          int v31 = a5;
        }
      }
      unsigned int v52 = v34 & 0xFFFFFFFC | 2;
      if (v132 >= 1) {
        break;
      }
LABEL_131:
      uint64_t v13 = *(void *)(v7 + 2144);
      v122 += 8 * v13;
      uint64_t v109 = (4 * *(void *)(v7 + 2152)) >> (v150 == 1);
      v121 += 2 * v109;
      v120 += 2 * v109;
      int v33 = *v116 ^ 1;
      *int v116 = v33;
      int v17 = v52 | 4;
      int v31 = a5;
      unsigned int v16 = v119;
      if (v119 >= a5) {
        return result;
      }
    }
    unsigned int v53 = 0;
    unsigned int v54 = 0;
    int v55 = 0;
    uint64_t v126 = (v16 >> 1) & 0xF;
    BOOL v56 = a6 != 0;
    BOOL v57 = v16 == a4 && a6 != 0;
    BOOL v166 = v57;
    int v131 = (v16 >> 3) & 2;
    if (v119 < v31) {
      BOOL v56 = 1;
    }
    BOOL v163 = v56;
    int v167 = v33;
    uint64_t v147 = (uint64_t *)(v7 + 24 * v33 + 5192);
    int v58 = 1;
    uint64_t v59 = v120;
    uint64_t v60 = v121;
    uint64_t v61 = v122;
    while (1)
    {
      uint64_t v62 = v53;
      uint64_t v63 = *(char *)(a3 + 1348 * (v54 >> 1) + (v54 & 1 | v131) + 1280);
      unsigned int v146 = v54;
      uint64_t v144 = v60;
      uint64_t v145 = v59;
      unsigned int v142 = v53;
      uint64_t v143 = v61;
      if (v63 == -1
        || ((uint64_t v64 = *(void *)(v7 + 24) + v63,
             unsigned int v65 = *(unsigned __int8 *)(v64 + 849),
             unsigned int v66 = *(unsigned __int8 *)(v64 + 857),
             !*(unsigned char *)(v64 + 849))
          ? (BOOL v67 = v66 == 0)
          : (BOOL v67 = 0),
            v67))
      {
        int v58 = 1;
      }
      else
      {
        unsigned int v158 = *(_DWORD *)(a3 + 1348 * (v54 >> 1) + 4 * v126 + 1284);
        if ((v65 & 3) == 3) {
          int v68 = 4;
        }
        else {
          int v68 = v65 & 3;
        }
        if ((v66 & 3) == 3) {
          int v69 = 4;
        }
        else {
          int v69 = v66 & 3;
        }
        uint64_t v171 = v61;
        uint64_t v172 = v60;
        uint64_t v173 = v59;
        int v70 = 16 * v54;
        LODWORD(result) = v70 + 16;
        int v71 = *(_DWORD *)(v7 + 3448);
        int v157 = v70 + 16;
        if (v70 + 16 >= v71) {
          double result = v71;
        }
        else {
          double result = result;
        }
        if (v70 < (int)result)
        {
          int v72 = (v65 != 0) | (2 * (v66 != 0));
          int v152 = v68 << v123;
          uint64_t v73 = v66 >> 2 << v123;
          uint64_t v74 = (v69 << v123);
          unsigned int v155 = v65 >> 2 << v123;
          uint64_t v75 = v59;
          uint64_t v76 = v60;
          unsigned int v154 = v66;
          int v153 = v72;
          do
          {
            uint64_t v162 = v62 + 2;
            if (v71 <= (int)v62 + 2) {
              unsigned int v77 = v52 & 0xFFFFFFFD;
            }
            else {
              unsigned int v77 = v52;
            }
            if (((v158 >> (v62 & 0x1E)) & 3) == 0)
            {
              int v58 = 1;
              goto LABEL_123;
            }
            if (v58) {
              int v78 = 3;
            }
            else {
              int v78 = ~v55;
            }
            if (v78 & v72) != 0 && (v77) {
              double result = sub_224AFB848((uint64_t)&v174[6 * v10], &v171, v149, 0, v150, v78 & v72);
            }
            if ((v77 & 2) != 0) {
              double result = sub_224AFB848((uint64_t)&v174[6 * (v10 == 0)], &v171, v149, 8u, v150, v72);
            }
            int v79 = 0;
            unsigned int v170 = 0;
            if (v155 | v73)
            {
              double result = (*(uint64_t (**)(uint64_t, void, unsigned int *, void))(v151 + 3296))(v61, *(void *)(v7 + 2144), &v170, *(unsigned int *)(v7 + 4324));
              int v79 = result;
            }
            if (v169 > 1)
            {
              int v81 = v152;
              if (v166)
              {
                uint64_t v83 = (4 * v62) & 0xFFFFFFF8;
                if (v165 == v164)
                {
                  uint64_t v84 = v127 + v83;
                  uint64_t v85 = *(void *)(v7 + 5264);
                }
                else
                {
                  uint64_t v84 = v128 + v83;
                  uint64_t v85 = *(void *)(v7 + 5240);
                }
                uint64_t v82 = v85 + 2 * v84;
                goto LABEL_88;
              }
              uint64_t v80 = *v147;
              if (!v163)
              {
                uint64_t v86 = (4 * v62) & 0xFFFFFFF8;
                uint64_t v82 = v80 + 2 * (v129 + v86);
                if (v165 == v164)
                {
                  uint64_t v87 = v124 + v86;
                  uint64_t v88 = *(void *)(v7 + 5264);
                }
                else
                {
                  uint64_t v87 = v125 + v86;
                  uint64_t v88 = *(void *)(v7 + 5240);
                }
                uint64_t v89 = v88 + 2 * v87;
                goto LABEL_89;
              }
            }
            else
            {
              uint64_t v80 = *v147;
              int v81 = v152;
            }
            uint64_t v82 = v80 + 2 * (v140 + ((4 * v62) & 0xFFFFFFF8));
LABEL_88:
            uint64_t v89 = v171 + 2 * v148;
LABEL_89:
            if (v155)
            {
              if (v170)
              {
                if (v170 >= 0x40)
                {
                  signed int v92 = __clz(v170 >> 6) ^ 0x1F;
                  if (v92 >= 12) {
                    signed int v92 = 12;
                  }
                  int v90 = v92 + 4;
                }
                else
                {
                  int v90 = 4;
                }
                uint64_t v91 = ((int)(v90 * v155 + 8) >> 4);
              }
              else
              {
                uint64_t v91 = 0;
              }
              if (v91 | v81) {
                double result = (*(uint64_t (**)(uint64_t, void, _OWORD *, uint64_t, uint64_t, uint64_t))(v151 + 3304))(v171, *(void *)(v7 + 2144), &v174[6 * v10], v82, v89, v91);
              }
            }
            else if (v81)
            {
              double result = (*(uint64_t (**)(uint64_t, void, _OWORD *, uint64_t, uint64_t, void))(v151 + 3304))(v171, *(void *)(v7 + 2144), &v174[6 * v10], v82, v89, 0);
            }
            if (v66)
            {
              if (v73) {
                uint64_t v93 = v133[v79];
              }
              else {
                uint64_t v93 = 0;
              }
              char v94 = 0;
              uint64_t v95 = (4 * v62) >> v141;
              uint64_t v161 = v139 + v95;
              uint64_t v160 = v137 + v95;
              uint64_t v159 = v136 + v95;
              uint64_t v96 = v138 + v95;
              uint64_t v97 = v135 + v95;
              uint64_t v98 = 1;
              do
              {
                char v99 = v94;
                if (v169 >= 2)
                {
                  if (v166)
                  {
                    uint64_t v101 = v7 + 8 * v98;
                    unint64_t v102 = (void *)(v101 + 5264);
                    int v103 = (void *)(v101 + 5240);
                    if (v165 == v164) {
                      int v103 = v102;
                    }
                    uint64_t v100 = *v103 + 2 * v97;
                    goto LABEL_113;
                  }
                  if (!v163)
                  {
                    uint64_t v100 = *(void *)(v7 + 24 * v167 + 8 * v98 + 5192) + 2 * v161;
                    uint64_t v106 = v7 + 8 * v98;
                    unsigned int v107 = (uint64_t *)(v106 + 5264);
                    int v104 = (uint64_t *)(v106 + 5240);
                    if (v165 == v164) {
                      int v104 = v107;
                    }
                    uint64_t v105 = v160;
                    if (v165 == v164) {
                      uint64_t v105 = v159;
                    }
                    goto LABEL_114;
                  }
                }
                uint64_t v100 = *(void *)(v7 + 24 * v167 + 8 * v98 + 5192) + 2 * v96;
LABEL_113:
                int v104 = &v171 + v98;
                uint64_t v105 = v168;
LABEL_114:
                double result = (*(uint64_t (**)(void, void, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, _DWORD))(v151 + 8 * (3 - v150) + 3304))(*(&v171 + v98), *(void *)(v7 + 2152), &v174[6 * v10 + 2 * v98], v100, *v104 + 2 * v105, v73, v74, v93, __PAIR64__(v77, v32), *(_DWORD *)(v7 + 4324));
                char v94 = 1;
                uint64_t v98 = 2;
              }
              while ((v99 & 1) == 0);
            }
            int v58 = 0;
            v10 ^= 1uLL;
            uint64_t v61 = v171;
            uint64_t v76 = v172;
            uint64_t v75 = v173;
            int v72 = v153;
            int v55 = v153;
            int v71 = *(_DWORD *)(v7 + 3448);
            unsigned int v66 = v154;
LABEL_123:
            v61 += 16;
            v76 += 2 * v156;
            uint64_t v171 = v61;
            uint64_t v172 = v76;
            v75 += 2 * v156;
            uint64_t v173 = v75;
            unsigned int v52 = v77 | 1;
            int v108 = v157;
            if (v157 >= v71) {
              int v108 = v71;
            }
            uint64_t v62 = v162;
          }
          while (v108 > (int)v162);
        }
      }
      uint64_t v61 = v143 + 128;
      uint64_t v60 = v144 + 2 * v130;
      uint64_t v59 = v145 + 2 * v130;
      unsigned int v54 = v146 + 1;
      v52 |= 1u;
      unsigned int v53 = v142 + 16;
      if (v146 + 1 == v132) {
        goto LABEL_131;
      }
    }
  }
  return result;
}

uint64_t sub_224AFB848(uint64_t result, void *a2, uint64_t *a3, unsigned int a4, int a5, char a6)
{
  if (a6)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      *(_DWORD *)(result + v6) = *(_DWORD *)(*a2 + 2 * (a4 - 2 + v7));
      v7 += *a3 >> 1;
      v6 += 4;
    }
    while (v6 != 32);
  }
  if (a5 && (a6 & 2) != 0)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 8u >> (a5 == 1);
    uint64_t v10 = (_DWORD *)(result + 64);
    do
    {
      uint64_t v11 = 2 * ((a4 >> (a5 != 3)) - 2 + v8);
      *(v10 - 8) = *(_DWORD *)(a2[1] + v11);
      *v10++ = *(_DWORD *)(a2[2] + v11);
      v8 += a3[1] >> 1;
      --v9;
    }
    while (v9);
  }
  return result;
}

unsigned char *sub_224AFB8E8(unsigned char *result, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  uint64_t v7 = a2;
  uint64_t v8 = result;
  int v9 = 0;
  uint64_t v10 = a5 >> 1;
  size_t v11 = a3 >> 1;
  uint64_t v12 = a5 - 1;
  size_t v13 = (int)(v11 - (a5 >> 1));
  uint64_t v14 = a3;
  uint64_t v15 = (char *)(a2 + 1);
  do
  {
    uint64_t v16 = 0;
    int v17 = v15;
    do
    {
      char v18 = *(v17 - 1);
      char v19 = *v17;
      v17 += 2;
      v8[v16++] = v18 | (16 * v19);
    }
    while (v10 != v16);
    if (v10 < v11) {
      double result = memset(&v8[v10], 17 * *(unsigned __int8 *)(v7 + v12), v13);
    }
    ++v9;
    v7 += v14;
    v8 += v11;
    v15 += v14;
  }
  while (v9 != a6);
  unsigned int v20 = a4 - a6;
  if (a4 > a6)
  {
    uint64_t v21 = &v8[-(int)v11];
    do
    {
      double result = memcpy(v8, v21, v11);
      v8 += v11;
      --v20;
    }
    while (v20);
  }
  return result;
}

uint64_t sub_224AFB9E4(uint64_t result, uint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  int v10 = a3;
  v63[274] = *MEMORY[0x263EF8340];
  BOOL v12 = a7 != 0;
  int v13 = *(_DWORD *)(result + 2440);
  uint64_t v14 = *(void *)(result + 24);
  if (a7) {
    ++v14;
  }
  char v15 = v13 == 1 && a7 != 0;
  uint64_t v16 = (1 << *(unsigned char *)(v14 + 880));
  unsigned int v17 = 8u >> v15;
  if (!a3) {
    unsigned int v17 = 0;
  }
  unsigned int v18 = v17 + a3;
  if (a3 <= 0) {
    int v19 = 2;
  }
  else {
    int v19 = 6;
  }
  int v20 = v18 & -(int)v16;
  if (v20 + ((int)v16 >> 1) <= a5) {
    int v21 = 0;
  }
  else {
    int v21 = v16;
  }
  int v22 = v20 - v21;
  if ((v18 & -(int)v16) != 0) {
    int v23 = v22;
  }
  else {
    int v23 = 0;
  }
  BOOL v24 = v13 == 3;
  uint64_t v25 = *(void *)(result + 8 * v12 + 2416);
  uint64_t v26 = (v16 + ((int)v16 >> 1));
  int v27 = !v24;
  if ((v12 & v27) != 0) {
    uint64_t v28 = 6;
  }
  else {
    uint64_t v28 = 7;
  }
  int v29 = (v23 << v15 >> 7) * *(_DWORD *)(result + 3476);
  unsigned int v30 = ((v23 << v15) >> 5) & 2;
  v63[0] = *(void *)(result + 4448)
         + 108 * v29
         + 36 * v7
         + (((v23 << v15) >> 5) & 2 | (16 * (((unint64_t)v30 >> 1) & 1)));
  v63[1] = 0;
  BOOL v31 = *(unsigned char *)v63[0] != 0;
  if ((int)v26 > a4)
  {
    int v32 = 0;
    uint64_t v33 = 0;
    if (!*(unsigned char *)v63[0]) {
      return result;
    }
    return sub_224AFBD0C(result, a2, (uint64_t)&v63[136 * (v33 == 0) + 2], v32, v10, v7, a4 - v32, a6, (char *)v63[v33], v19 & 0xFFFFFFFD);
  }
  uint64_t v33 = 0;
  int v34 = 0;
  char v35 = v28 - 1;
  int v36 = a6 - v10;
  int v37 = v19 | 1;
  unsigned int v53 = a6 - v10 + 1;
  int v54 = a6 - v10;
  uint64_t v38 = 2 * (int)v16;
  uint64_t v51 = v38 - 8;
  uint64_t v52 = v38;
  unint64_t v39 = v25 & 0xFFFFFFFFFFFFFFFELL;
  unsigned int v61 = v7;
  int v58 = v29;
  int v59 = v10;
  int v57 = ((v23 << v15) >> 5) & 2;
  int v55 = v19 | 1;
  char v56 = v28 - 1;
  do
  {
    int v32 = v34 + v16;
    uint64_t v40 = (unsigned __int8 *)(*(void *)(result + 4448)
                            + 108 * ((v32 >> v28) + v29)
                            + 36 * v61
                            + ((v32 >> v35) & 1 | v30 | (8 * ((v32 >> v35) & 1 | v30))));
    v63[v33 == 0] = v40;
    LODWORD(v40) = *v40;
    BOOL v62 = v40 != 0;
    if (v40) {
      BOOL v41 = v36 < 1;
    }
    else {
      BOOL v41 = 1;
    }
    if (!v41)
    {
      int v42 = &v63[136 * v33 + 2];
      uint64_t v43 = v51;
      unsigned int v44 = v53;
      do
      {
        *v42++ = *(void *)(a2 + v43);
        --v44;
        v43 += v39;
      }
      while (v44 > 1);
    }
    if (v31)
    {
      int v60 = v34 + v16;
      uint64_t v45 = result;
      uint64_t v46 = a6;
      uint64_t v47 = v16;
      uint64_t v48 = v7;
      uint64_t v49 = v26;
      uint64_t v50 = v28;
      sub_224AFBD0C(result, a2, (uint64_t)&v63[136 * (v33 == 0) + 2], v34, v10, v7, v16, a6, (char *)v63[v33], v19);
      unsigned int v30 = v57;
      int v29 = v58;
      int v10 = v59;
      uint64_t v28 = v50;
      uint64_t v26 = v49;
      char v35 = v56;
      double result = v45;
      int v32 = v60;
      uint64_t v7 = v48;
      int v36 = v54;
      int v37 = v55;
      uint64_t v16 = v47;
      uint64_t v38 = v52;
      a6 = v46;
    }
    a2 += v38;
    v33 ^= 1uLL;
    int v34 = v32;
    BOOL v31 = v62;
    int v19 = v37;
  }
  while ((int)v26 + v32 <= a4);
  int v19 = v37;
  if (v62) {
    return sub_224AFBD0C(result, a2, (uint64_t)&v63[136 * (v33 == 0) + 2], v32, v10, v7, a4 - v32, a6, (char *)v63[v33], v19 & 0xFFFFFFFD);
  }
  return result;
}

uint64_t sub_224AFBD0C(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, unsigned int a6, unsigned int a7, int a8, char *a9, int a10)
{
  uint64_t v13 = result;
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v14 = *(void *)(result + 3280);
  char v15 = a6 != 0 && *(_DWORD *)(result + 2440) == 1;
  uint64_t v44 = *(void *)(result + 8 * (a6 != 0) + 2416);
  int v16 = 8 << v15;
  if (v15) {
    char v17 = 5;
  }
  else {
    char v17 = 6;
  }
  if (!a5) {
    int v16 = 0;
  }
  char v18 = *(unsigned char *)(*(void *)(result + 8) + 392);
  int v19 = (v16 + a5) >> (v17 + v18);
  uint64_t v20 = *(void *)(result + 8 * a6 + 5264);
  int v21 = 4 << v18;
  if (a5) {
    unsigned int v22 = 64;
  }
  else {
    unsigned int v22 = 56;
  }
  int v23 = v19 * v21 - 4;
  if (*(_DWORD *)(*(void *)(result + 3256) + 24) <= 1u) {
    int v23 = 0;
  }
  if ((int)(v22 >> v15) >= a8 - a5) {
    uint64_t v24 = (a8 - a5);
  }
  else {
    uint64_t v24 = v22 >> v15;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  int v25 = *a9;
  if (v25 == 2)
  {
    int v26 = a9[1];
    WORD6(v45) = v26;
    LOWORD(v45) = v26;
    WORD5(v45) = a9[2];
    WORD1(v45) = WORD5(v45);
    WORD4(v45) = a9[3];
    WORD2(v45) = WORD4(v45);
    WORD3(v45) = 128 - 2 * (WORD5(v45) + v26 + WORD4(v45));
    int v27 = a9[4];
    WORD6(v46) = v27;
    LOWORD(v46) = v27;
    WORD5(v46) = a9[5];
    WORD1(v46) = WORD5(v46);
    __int16 v28 = a9[6];
    WORD4(v46) = v28;
    WORD2(v46) = v28;
    WORD3(v46) = 128 - 2 * (WORD5(v46) + v27 + v28);
    int v29 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, long long *, void, _DWORD))(v14 + 8 * ((v27 | v26) == 0) + 3328);
  }
  else
  {
    unsigned int v30 = (unsigned __int16 *)((char *)&unk_224B28C80 + 4 * (v25 - 3));
    unsigned int v31 = *v30;
    BOOL v32 = *v30 == 0;
    LODWORD(v30) = v30[1];
    *(void *)&long long v45 = __PAIR64__(v30, v31);
    WORD4(v45) = a9[7];
    WORD5(v45) = 128 - (WORD4(v45) + a9[8]);
    int v29 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, long long *, void, _DWORD))(v14 + 8 * (2 * (v30 != 0) - v32) + 3344);
  }
  int v33 = v24 + a5;
  if ((int)v24 + a5 <= a8)
  {
    uint64_t v35 = v20 + 2 * (v44 >> 1) * v23 + 2 * a4;
    int v42 = *v29;
    int v41 = v19 + 1;
    unsigned int v36 = 0x40u >> v15;
    do
    {
      if (v41 == *(_DWORD *)(v13 + 3464) && a8 == v33) {
        int v38 = 0;
      }
      else {
        int v38 = 8;
      }
      unsigned int v39 = v38 | a10 & 0xFFFFFFF7;
      double result = v42(a2, v44, a3, v35, a7, v24, &v45, v39, *(_DWORD *)(v13 + 4324));
      LODWORD(v40) = a8 - v33;
      if ((int)v36 >= a8 - v33) {
        uint64_t v40 = v40;
      }
      else {
        uint64_t v40 = v36;
      }
      if (!v40) {
        break;
      }
      a10 = v39 | 4;
      a2 += 2 * (v44 >> 1) * (int)v24;
      a3 += 8 * (int)v24;
      v33 += v40;
      v35 += 4 * v44;
      uint64_t v24 = v40;
    }
    while (v33 <= a8);
  }
  return result;
}

uint64_t sub_224AFBFF0(uint64_t a1, int a2)
{
  uint64_t v4 = *(char **)(a1 + 5488);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 449) * *(unsigned __int8 *)(v5 + 445);
  if (a2 <= 1)
  {
    int v7 = v6 << (*(_DWORD *)(*(void *)(a1 + 3256) + 8) > 1u);
    if (v7 > *(_DWORD *)(a1 + 5540))
    {
      uint64_t v8 = (char *)malloc_type_realloc(*(void **)(a1 + 5488), (32 * v7), 0x5847BBF5uLL);
      if (!v8) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v4 = v8;
      bzero(v8, (32 * v7));
      *(void *)(a1 + 5488) = v4;
      *(_DWORD *)(a1 + 5540) = v7;
      uint64_t v5 = *(void *)(a1 + 24);
    }
    *(void *)(a1 + 5496) = &v4[32 * v6];
  }
  if (*(unsigned char *)(v5 + 830)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = *(unsigned char *)(v5 + 831) != 0;
  }
  int v41 = *(_DWORD *)(v5 + 236);
  int v42 = *(unsigned __int8 *)(*(void *)(a1 + 8) + 414);
  int v40 = *(_DWORD *)(v5 + 240);
  int v10 = *(_DWORD *)(a1 + 5352);
  size_t v11 = *(char **)(a1 + 5480);
  int v12 = *(_DWORD *)(a1 + 3464);
  int v13 = v12 << (*(_DWORD *)(*(void *)(a1 + 3256) + 8) > 1u);
  if (v13 > *(_DWORD *)(a1 + 5536))
  {
    uint64_t v14 = (char *)malloc_type_realloc(*(void **)(a1 + 5480), 32 * v13, 0x557A5B2EuLL);
    if (!v14) {
      return 0xFFFFFFFFLL;
    }
    size_t v11 = v14;
    bzero(v14, 32 * v13);
    *(void *)(a1 + 5480) = v11;
    *(_DWORD *)(a1 + 5536) = v13;
    int v12 = *(_DWORD *)(a1 + 3464);
  }
  uint64_t v15 = a2 & 1;
  if ((a2 & 1) == 0)
  {
    int v16 = (v12 + 31) >> 5;
    char v17 = *(char **)(a1 + 4344);
    if (v16 <= *(_DWORD *)(a1 + 4400))
    {
      uint64_t v18 = v16;
      goto LABEL_19;
    }
    char v17 = (char *)malloc_type_realloc(v17, 8 * v16, 0x100004052888210uLL);
    if (v17)
    {
      *(void *)(a1 + 4344) = v17;
      uint64_t v18 = v16;
      *(void *)(a1 + 4352) = &v17[4 * v16];
LABEL_19:
      *(_DWORD *)(a1 + 4400) = v16;
      size_t v21 = 4 * v18;
      bzero(v17, 4 * v18);
      bzero(*(void **)(a1 + 4352), v21);
      uint64_t v19 = 4340;
      goto LABEL_20;
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v19 = 4336;
LABEL_20:
  unsigned int v22 = (unsigned int *)(a1 + v19);
  int v23 = &v4[32 * (v6 * v15)];
  uint64_t v24 = &v11[32 * v12 * (int)v15];
  atomic_store(0, v22);
  *(_DWORD *)(a1 + 4 * (a2 & 1) + 4328) = 0;
  *((void *)v24 + 1) = 0x100000000;
  *((_DWORD *)v24 + 4) = 0;
  char v25 = a2 == 1 || v9;
  if (a2 == 1) {
    int v26 = 3;
  }
  else {
    int v26 = 5;
  }
  if ((v25 & 1) == 0)
  {
    if (v41 == v40) {
      int v27 = 10;
    }
    else {
      int v27 = 8;
    }
    if (v42 | v10) {
      int v26 = 6;
    }
    else {
      int v26 = v27;
    }
  }
  uint64_t v28 = 0;
  int v29 = 0;
  *((_DWORD *)v24 + 1) = v26;
  int v30 = 1828669549 * ((unint64_t)(a1 - **(void **)(a1 + 3256)) >> 4);
  *(_DWORD *)uint64_t v24 = v30;
  int v31 = *(_DWORD *)(a1 + 3468);
  if (a2 == 1) {
    int v32 = 2;
  }
  else {
    int v32 = 4;
  }
  int v33 = (int *)(*(void *)(a1 + 3264) + 13872);
  int v34 = v23;
  do
  {
    uint64_t v35 = v28;
    unsigned int v36 = v34;
    int v37 = *v33 >> v31;
    *((_DWORD *)v34 + 2) = v37;
    if (v24 && v37)
    {
      int v38 = 0;
      *((void *)v29 + 3) = v24;
    }
    else
    {
      int v38 = v24;
      uint64_t v24 = v29;
    }
    *((void *)v34 + 2) = 0;
    *((_DWORD *)v34 + 3) = 0;
    *(_DWORD *)int v34 = v30;
    *((_DWORD *)v34 + 1) = v32;
    if (v24) {
      *((void *)v24 + 3) = v34;
    }
    v33 += 3656;
    uint64_t v28 = v35 + 1;
    v34 += 32;
    int v29 = v36;
    uint64_t v24 = v38;
  }
  while (v6 != v35 + 1);
  if (v38) {
    *(void *)&v23[32 * v35 + 24] = v38;
  }
  else {
    int v38 = v36;
  }
  *((void *)v38 + 3) = 0;
  atomic_store(0, (unsigned int *)(a1 + 4 * v15 + 5548));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 5608));
  if (*(void *)(a1 + 5672)) {
    unsigned int v39 = (char **)(*(void *)(a1 + 5680) + 24);
  }
  else {
    unsigned int v39 = (char **)(a1 + 5672);
  }
  char *v39 = v23;
  *(void *)(a1 + 5680) = v38;
  atomic_store(1u, (unsigned int *)(a1 + 5600));
  atomic_store(1u, (unsigned int *)(a1 + 5544));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 5608));
  return 0;
}

void *sub_224AFC37C(void *a1, unsigned int *a2, int a3)
{
  uint64_t v4 = a1[697];
  if (v4)
  {
    uint64_t v5 = 0;
    unsigned int v6 = a2[1];
    while (1)
    {
      uint64_t v7 = v5;
      uint64_t v5 = v4;
      unsigned int v8 = *(_DWORD *)(v4 + 4);
      if (v8 == 2)
      {
        if (v6 > 2) {
          goto LABEL_14;
        }
        signed int v9 = a2[2];
        signed int v10 = *(_DWORD *)(v5 + 8);
        if (v9 > v10) {
          goto LABEL_14;
        }
        if (v9 < v10) {
          goto LABEL_19;
        }
      }
      else
      {
        if (v6 == 2) {
          goto LABEL_19;
        }
        signed int v11 = a2[2];
        signed int v12 = *(_DWORD *)(v5 + 8);
        if (v11 > v12) {
          goto LABEL_14;
        }
        if (v11 < v12) {
          goto LABEL_19;
        }
        if (v6 > v8) {
          goto LABEL_14;
        }
        if (v6 < v8) {
          goto LABEL_19;
        }
      }
      uint64_t v13 = a1[(v8 == 2) + 686];
      if ((int)(((unint64_t)a2 - v13) >> 5) <= (int)((unint64_t)(v5 - v13) >> 5))
      {
LABEL_19:
        uint64_t v14 = (uint64_t)a2;
        return sub_224AFC43C(a1, a2, v14, v7, v5, a3);
      }
LABEL_14:
      uint64_t v4 = *(void *)(v5 + 24);
      if (!v4) {
        goto LABEL_17;
      }
    }
  }
  uint64_t v5 = 0;
LABEL_17:
  uint64_t v14 = (uint64_t)a2;
  uint64_t v7 = v5;
  uint64_t v5 = 0;
  return sub_224AFC43C(a1, a2, v14, v7, v5, a3);
}

void *sub_224AFC43C(void *result, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6 = result[684];
  if (atomic_load(*(unsigned int **)(result[407] + 848))) {
    return result;
  }
  unsigned int v8 = (unsigned int **)(result + 697);
  if (a4) {
    unsigned int v8 = (unsigned int **)(a4 + 24);
  }
  *unsigned int v8 = a2;
  if (!a5) {
    result[698] = a3;
  }
  *(void *)(a3 + 24) = a5;
  signed int v9 = (uint64_t *)result[407];
  unsigned int v10 = *a2;
  unsigned int v11 = atomic_load((unsigned int *)(v6 + 112));
  unsigned int v12 = atomic_exchange((atomic_uint *volatile)(v6 + 120), 0xFFFFFFFF);
  if (v12 < v11)
  {
    if (v10 == -1) {
      goto LABEL_31;
    }
    unsigned int v12 = -1;
  }
  unsigned int v13 = *(_DWORD *)(v6 + 116);
  if (v13 || *(void *)(*v9 + 5712 * v11 + 5592))
  {
    if (v12 == -1)
    {
      if (v10 == -1) {
        goto LABEL_31;
      }
    }
    else if (v10 == -1)
    {
      if (v12 <= v13 + v11)
      {
        unsigned int v14 = v12 - v11;
        unsigned int v15 = *((_DWORD *)v9 + 2);
LABEL_28:
        *(_DWORD *)(v6 + 116) = v14;
        unsigned int v18 = v15 - v14;
        if (v15 > v14)
        {
          uint64_t v19 = *v9;
          unsigned int v20 = v14 + v11;
          do
          {
            *(void *)(v19 + 5712 * (v20 % v15) + 5592) = 0;
            ++v20;
            --v18;
          }
          while (v18);
        }
        goto LABEL_31;
      }
      goto LABEL_31;
    }
    unsigned int v15 = *((_DWORD *)v9 + 2);
    if (v11 <= v10) {
      int v16 = 0;
    }
    else {
      int v16 = *((_DWORD *)v9 + 2);
    }
    unsigned int v17 = v16 + v10;
    if (v12 < v17) {
      unsigned int v17 = v12;
    }
    if (v13 < v15 && v13 + v11 < v17) {
      goto LABEL_31;
    }
    unsigned int v14 = v17 - v11;
    if (v17 - v11 < v15)
    {
      while (!*(void *)(*v9 + 5712 * (v17 % v15) + 5576))
      {
        ++v14;
        ++v17;
        if (v15 == v14)
        {
          *(_DWORD *)(v6 + 116) = v15;
          goto LABEL_31;
        }
      }
    }
    goto LABEL_28;
  }
LABEL_31:
  if (a6)
  {
    if (!atomic_fetch_or((atomic_uint *volatile)(v6 + 124), 1u)) {
      return (void *)pthread_cond_signal((pthread_cond_t *)(v6 + 64));
    }
  }
  return result;
}

uint64_t sub_224AFC5B0(uint64_t a1)
{
  unsigned int v1 = (int *)(a1 + 258564);
  uint64_t v2 = *(uint64_t **)a1;
  uint64_t v3 = *(void *)(a1 + 258696);
  pthread_mutex_lock((pthread_mutex_t *)v3);
  if (v1[38]) {
    goto LABEL_2;
  }
  char v279 = (pthread_cond_t *)(v3 + 64);
  uint64_t v280 = v3 + 256;
  int v278 = (char *)(v3 + 36672);
  unsigned int v277 = (void (**)(uint64_t, uint64_t))(v2 + 6611);
  uint64_t v276 = v3 + 18496;
  int v274 = v1;
LABEL_4:
  if (atomic_load((unsigned int *)v2[106]))
  {
LABEL_5:
    v1[37] = 1;
    pthread_cond_signal((pthread_cond_t *)(a1 + 258576));
    atomic_store(0, (unsigned int *)(v3 + 124));
    pthread_cond_wait(v279, (pthread_mutex_t *)v3);
    v1[37] = 0;
    unsigned int v6 = atomic_load((unsigned int *)(v3 + 112));
    unsigned int v7 = atomic_exchange((atomic_uint *volatile)(v3 + 120), 0xFFFFFFFF);
    if (v7 < v6) {
      goto LABEL_485;
    }
    int v8 = *(_DWORD *)(v3 + 116);
    if (v8)
    {
      if (v7 == -1) {
        goto LABEL_485;
      }
    }
    else if (v7 == -1 || !*(void *)(*v2 + 5712 * v6 + 5592))
    {
      goto LABEL_485;
    }
    if (v7 <= v8 + v6)
    {
      unsigned int v31 = *((_DWORD *)v2 + 2);
      *(_DWORD *)(v3 + 116) = v7 - v6;
      if (v7 - v6 < v31)
      {
        uint64_t v32 = *v2;
        unsigned int v33 = v6 + v31;
        do
        {
          *(void *)(v32 + 5712 * (v7 % v31) + 5592) = 0;
          ++v7;
        }
        while (v33 != v7);
      }
    }
    goto LABEL_485;
  }
  if (!*((_DWORD *)v2 + 2))
  {
    if (!*(_DWORD *)(v3 + 128))
    {
      unsigned int v35 = atomic_load((unsigned int *)(v3 + 112));
      goto LABEL_81;
    }
LABEL_29:
    uint64_t v24 = *(void *)(v3 + 184);
    uint64_t v25 = *(void *)(v3 + 192);
    uint64_t v26 = ((uint64_t)*(int *)(v25 + 68) >> 1) - 4;
    int v27 = *(_DWORD *)(v3 + 200);
    if (v27 == 12) {
      goto LABEL_88;
    }
    if (v27 == 11)
    {
      *(_DWORD *)(v3 + 128) = 0;
      if (atomic_load((unsigned int *)(v3 + 124))) {
        pthread_cond_signal(v279);
      }
      pthread_mutex_unlock((pthread_mutex_t *)v3);
      int v29 = *(_DWORD *)(v25 + 68);
      BOOL v30 = v29 == 12 || v29 == 10;
      if (v30)
      {
        sub_224AFFB80((void (**)(uint64_t, uint64_t, uint64_t))&v2[421 * (int)v26 + 6611], v25, v24, v278, v280);
LABEL_87:
        *(_DWORD *)(v3 + 200) = 12;
        pthread_mutex_lock((pthread_mutex_t *)v3);
        *(_DWORD *)(v3 + 128) = 1;
LABEL_88:
        signed int add = atomic_fetch_add((atomic_uint *volatile)(v3 + 204), 1u);
        pthread_mutex_unlock((pthread_mutex_t *)v3);
        int v71 = *(_DWORD *)(v25 + 60);
        int v73 = v71 + 31;
        BOOL v72 = v71 < -31;
        int v74 = v71 + 62;
        if (!v72) {
          int v74 = v73;
        }
        if (add < v74 >> 5)
        {
          int v75 = v74 >> 5;
          int v76 = (v74 >> 5) - 1;
          uint64_t v77 = (uint64_t)&v2[421 * (int)v26 + 6611];
          do
          {
            if (add >= v76)
            {
              pthread_mutex_lock((pthread_mutex_t *)v3);
              *(_DWORD *)(v3 + 128) = 0;
              pthread_mutex_unlock((pthread_mutex_t *)v3);
            }
            else
            {
              pthread_cond_signal(v279);
            }
            int v78 = *(_DWORD *)(v25 + 68);
            if (v78 == 12 || v78 == 10)
            {
              sub_224B00068(v77, v25, v24, (uint64_t)v278, v280, add);
            }
            else
            {
              if (v78 != 8) {
                goto LABEL_504;
              }
              sub_224AC9C7C((uint64_t)v277, v25, v24, v276, v280, add);
            }
            signed int add = atomic_fetch_add((atomic_uint *volatile)(v3 + 204), 1u);
            atomic_fetch_add((atomic_uint *volatile)(v3 + 208), 1u);
          }
          while (add < v75);
        }
        pthread_mutex_lock((pthread_mutex_t *)v3);
        *(_DWORD *)(v3 + 128) = 0;
        signed int v80 = atomic_fetch_add((atomic_uint *volatile)(v3 + 208), 1u) + 1;
        signed int v81 = atomic_load((unsigned int *)(v3 + 204));
        unsigned int v1 = v274;
        if (v80 < v81) {
          goto LABEL_485;
        }
        *(_DWORD *)(v3 + 132) = 1;
        uint64_t v82 = (pthread_cond_t *)(v3 + 136);
        goto LABEL_106;
      }
      if (v29 == 8)
      {
        sub_224AC98D8(v277, v25, v24, v276, v280);
        goto LABEL_87;
      }
    }
LABEL_504:
    abort();
  }
  unint64_t v9 = 0;
  do
  {
    uint64_t v10 = *v2 + 5712 * v9;
    if (atomic_load((unsigned int *)(v10 + 5600)))
    {
      uint64_t v12 = *v2 + 5712 * v9;
      pthread_mutex_lock((pthread_mutex_t *)(v12 + 5608));
      uint64_t v13 = *(void *)(v12 + 5672);
      *(void *)(v12 + 5680) = 0;
      *(void *)(v12 + 5672) = 0;
      atomic_store(0, (unsigned int *)(v10 + 5600));
      pthread_mutex_unlock((pthread_mutex_t *)(v12 + 5608));
      if (v13)
      {
        do
        {
          uint64_t v14 = *(void *)(v13 + 24);
          sub_224AFC37C((void *)v10, (unsigned int *)v13, 0);
          uint64_t v13 = v14;
        }
        while (v14);
      }
    }
    ++v9;
    unint64_t v15 = *((unsigned int *)v2 + 2);
  }
  while (v9 < v15);
  if (*(_DWORD *)(v3 + 128)) {
    goto LABEL_29;
  }
  if (v15 >= 2)
  {
    for (unsigned int i = 0; i < v15; ++i)
    {
      unsigned int v17 = atomic_load((unsigned int *)(v3 + 112));
      uint64_t v18 = *v2;
      unsigned int v19 = (i + v17) % *((_DWORD *)v2 + 2);
      if (!atomic_load((unsigned int *)(*v2 + 5712 * v19 + 5544)))
      {
        uint64_t v281 = *(void *)(v18 + 5712 * v19 + 5576);
        if (v281)
        {
          int v21 = *(_DWORD *)(v281 + 4);
          if (v21 == 1)
          {
            unsigned int v22 = *(unsigned int **)(v18 + 5712 * v19 + 3080);
            if (!v22)
            {
              unsigned int v23 = 1;
LABEL_130:
              uint64_t v96 = v18 + 5712 * v19;
              atomic_fetch_or((atomic_uint *volatile)(v96 + 5564), v23 == 2147483646);
LABEL_132:
              uint64_t v51 = 0;
              uint64_t v97 = *(void *)(v281 + 24);
              *(void *)(v96 + 5576) = v97;
              if (!v97) {
                goto LABEL_133;
              }
              goto LABEL_134;
            }
            unsigned int v23 = atomic_load(v22);
            if (v23) {
              goto LABEL_130;
            }
          }
          else if (!v21)
          {
            uint64_t v96 = v18 + 5712 * v19;
            goto LABEL_132;
          }
        }
      }
      LODWORD(v15) = *((_DWORD *)v2 + 2);
    }
  }
  unsigned int v34 = *(_DWORD *)(v3 + 116);
  unsigned int v35 = atomic_load((unsigned int *)(v3 + 112));
  if (v34 >= v15)
  {
LABEL_81:
    unsigned int v67 = atomic_exchange((atomic_uint *volatile)(v3 + 120), 0xFFFFFFFF);
    unsigned int v68 = v67 - v35;
    if (v67 >= v35)
    {
      int v69 = *(_DWORD *)(v3 + 116);
      if (v69)
      {
        if (v67 == -1) {
          goto LABEL_117;
        }
      }
      else if (v67 == -1 || !*(void *)(*v2 + 5712 * v35 + 5592))
      {
        goto LABEL_117;
      }
      if (v67 <= v69 + v35)
      {
        unsigned int v93 = *((_DWORD *)v2 + 2);
        *(_DWORD *)(v3 + 116) = v68;
        if (v68 < v93)
        {
          uint64_t v94 = *v2;
          int v95 = v35 + v93;
          do
          {
            *(void *)(v94 + 5712 * (v67 % v93) + 5592) = 0;
            ++v67;
          }
          while (v95 != v67);
        }
        goto LABEL_485;
      }
    }
LABEL_117:
    if (*((_DWORD *)v2 + 2))
    {
      unint64_t v86 = 0;
      int v87 = 0;
      do
      {
        uint64_t v88 = *v2 + 5712 * v86;
        unsigned int v89 = atomic_load((unsigned int *)(v88 + 5600));
        if (v89)
        {
          uint64_t v90 = *v2 + 5712 * v86;
          pthread_mutex_lock((pthread_mutex_t *)(v90 + 5608));
          uint64_t v91 = *(void *)(v90 + 5672);
          *(void *)(v90 + 5680) = 0;
          *(void *)(v90 + 5672) = 0;
          atomic_store(0, (unsigned int *)(v88 + 5600));
          pthread_mutex_unlock((pthread_mutex_t *)(v90 + 5608));
          if (v91)
          {
            do
            {
              uint64_t v92 = *(void *)(v91 + 24);
              sub_224AFC37C((void *)v88, (unsigned int *)v91, 0);
              uint64_t v91 = v92;
            }
            while (v92);
          }
        }
        v87 |= v89;
        ++v86;
      }
      while (v86 < *((unsigned int *)v2 + 2));
      unsigned int v1 = v274;
      if (v87) {
        goto LABEL_485;
      }
    }
    goto LABEL_5;
  }
  while (1)
  {
    uint64_t v36 = *v2;
    unsigned int v272 = (*(_DWORD *)(v3 + 116) + v35) % *((_DWORD *)v2 + 2);
    uint64_t v96 = *v2 + 5712 * v272;
    if (atomic_load((unsigned int *)(v96 + 5600)))
    {
      uint64_t v38 = v36 + 5712 * v272;
      pthread_mutex_lock((pthread_mutex_t *)(v38 + 5608));
      uint64_t v39 = *(void *)(v38 + 5672);
      *(void *)(v38 + 5680) = 0;
      *(void *)(v38 + 5672) = 0;
      atomic_store(0, (unsigned int *)(v96 + 5600));
      pthread_mutex_unlock((pthread_mutex_t *)(v38 + 5608));
      if (v39)
      {
        do
        {
          uint64_t v40 = *(void *)(v39 + 24);
          sub_224AFC37C((void *)v96, (unsigned int *)v39, 0);
          uint64_t v39 = v40;
        }
        while (v40);
      }
    }
    uint64_t v41 = v36 + 5712 * v272;
    uint64_t v42 = *(void *)(v41 + 5592);
    uint64_t v43 = (uint64_t *)(v42 + 24);
    uint64_t v281 = v42;
    if (!v42) {
      uint64_t v43 = (uint64_t *)(v41 + 5576);
    }
    uint64_t v44 = *v43;
    if (v44) {
      break;
    }
LABEL_78:
    unsigned int v65 = *(_DWORD *)(v3 + 116) + 1;
    *(_DWORD *)(v3 + 116) = v65;
    unsigned int v66 = *((_DWORD *)v2 + 2);
    unsigned int v35 = atomic_load((unsigned int *)(v3 + 112));
    unsigned int v1 = v274;
    if (v65 >= v66) {
      goto LABEL_81;
    }
  }
  uint64_t v45 = v36;
  long long v46 = (uint64_t *)(v41 + 5592);
  uint64_t v47 = v36 + 5712 * v272;
  uint64_t v48 = (unsigned int *)(v47 + 5564);
  uint64_t v49 = v47 + 24;
  uint64_t v271 = v47 + 4328;
  int v270 = (unsigned int *)(v47 + 4336);
  uint64_t v50 = (void *)(v47 + 3264);
  unsigned int v269 = (unsigned int *)(v47 + 4340);
  unsigned int v268 = (void *)(v47 + 4352);
  while (1)
  {
    uint64_t v51 = v281;
    uint64_t v281 = v44;
    int v52 = *(_DWORD *)(v44 + 4);
    if (v52 == 1) {
      goto LABEL_61;
    }
    if (v52 == 4 || v52 == 2)
    {
      if (!sub_224AFE324((_DWORD *)v281, v96, *((_DWORD *)v2 + 2) > 1u)) {
        goto LABEL_111;
      }
      goto LABEL_61;
    }
    if (!*(_DWORD *)(v281 + 12)) {
      break;
    }
    atomic_load(v48);
    BOOL v30 = v52 == 3;
    BOOL v54 = v52 == 3;
    atomic_load((unsigned int *)(v45 + 5712 * v272 + 4 * v54 + 5548));
    int v55 = *(unsigned __int8 *)(*(void *)v49 + 445);
    int v56 = *(_DWORD *)(v271 + 4 * v54);
    int v57 = v55;
    if (v30)
    {
      signed int v58 = atomic_load(v270);
      if (v58 < *(_DWORD *)(v281 + 8)) {
        goto LABEL_61;
      }
      atomic_fetch_or((atomic_uint *volatile)v48, v58 == 2147483646);
      int v57 = *(unsigned __int8 *)(*(void *)v49 + 445);
    }
    if (!v57)
    {
LABEL_107:
      if (*(_DWORD *)(v281 + 8) + 1 < *(_DWORD *)(v45 + 5712 * v272 + 3464))
      {
        long long v83 = *(_OWORD *)(v281 + 16);
        *(_OWORD *)(v281 + 32) = *(_OWORD *)v281;
        *(_OWORD *)(v281 + 48) = v83;
        int v84 = *(_DWORD *)(v281 + 40) + 1;
        *(_DWORD *)(v281 + 40) = v84;
        uint64_t v85 = *(int *)(v271 + 4 * v54) + 1;
        if (v84 == *(unsigned __int16 *)(*(void *)v49 + 2 * v85 + 580))
        {
          *(_DWORD *)(v271 + 4 * v54) = v85;
          int v84 = *(_DWORD *)(v281 + 40);
        }
        *(_DWORD *)(v281 + 44) = v84 + 1;
        sub_224AFC37C((void *)v96, (unsigned int *)(v281 + 32), 0);
      }
LABEL_111:
      if (!v51) {
        goto LABEL_132;
      }
      goto LABEL_112;
    }
    unint64_t v59 = 0;
    uint64_t v60 = ((14624 * v56 * (uint64_t)v55) | (4 * v54)) + 13888;
    while (1)
    {
      signed int v61 = atomic_load((unsigned int *)(*v50 + v60));
      if (v61 < *(_DWORD *)(v281 + 12)) {
        break;
      }
      atomic_fetch_or((atomic_uint *volatile)v48, v61 == 2147483646);
      ++v59;
      v60 += 14624;
      if (v59 >= *(unsigned __int8 *)(*(void *)v49 + 445)) {
        goto LABEL_107;
      }
    }
LABEL_61:
    uint64_t v44 = *(void *)(v281 + 24);
    *long long v46 = v281;
    if (!v44) {
      goto LABEL_78;
    }
  }
  if (v52 == 7)
  {
    uint64_t v62 = v281;
    unsigned int v63 = atomic_load((unsigned int *)(*v268 + 4 * ((*(_DWORD *)(v281 + 8) - 1) >> 5)));
    if ((v63 >> (*(unsigned char *)(v62 + 8) - 1))) {
      goto LABEL_111;
    }
    goto LABEL_61;
  }
  signed int v64 = atomic_load(v269);
  if (v64 < *(_DWORD *)(v281 + 16)) {
    goto LABEL_61;
  }
  atomic_fetch_or((atomic_uint *volatile)v48, v64 == 2147483646);
  if (!v51) {
    goto LABEL_132;
  }
LABEL_112:
  *(void *)(v51 + 24) = *(void *)(v281 + 24);
  if (*(void *)(v281 + 24)) {
    goto LABEL_134;
  }
LABEL_133:
  *(void *)(v96 + 5584) = v51;
LABEL_134:
  if (*(_DWORD *)(v281 + 4) >= 2u && !*(void *)(v96 + 5576)) {
    ++*(_DWORD *)(v3 + 116);
  }
  *(void *)(v281 + 24) = 0;
  atomic_store(1u, (unsigned int *)(v3 + 124));
  pthread_cond_signal(v279);
  pthread_mutex_unlock((pthread_mutex_t *)v3);
  while (2)
  {
    unsigned int v98 = atomic_load((unsigned int *)v2[106]);
    unsigned int v99 = atomic_fetch_or((atomic_uint *volatile)(v96 + 5564), v98);
    *(void *)(a1 + 8) = v96;
    int v100 = *(_DWORD *)(v281 + 4);
    uint64_t v101 = *(unsigned int *)(v281 + 8);
    switch(v100)
    {
      case 0:
        int v120 = sub_224AE0010(v96);
        int v121 = v120;
        uint64_t v122 = *(unsigned int **)(v96 + 3080);
        if (!v122)
        {
          if (v120)
          {
            pthread_mutex_lock((pthread_mutex_t *)v3);
            if (v121 == -22) {
              goto LABEL_317;
            }
            goto LABEL_451;
          }
          *(_DWORD *)(v281 + 4) = 1;
          continue;
        }
        unsigned int v123 = atomic_load(v122);
        if (!v120 && v123 != 2147483646)
        {
          *(_DWORD *)(v281 + 4) = 1;
          if (!v123)
          {
            uint64_t v206 = (pthread_mutex_t *)(v96 + 5608);
            pthread_mutex_lock((pthread_mutex_t *)(v96 + 5608));
            *(void *)(v281 + 24) = 0;
            if (!*(void *)(v96 + 5672)) {
              goto LABEL_319;
            }
LABEL_177:
            uint64_t v130 = (uint64_t *)(*(void *)(v96 + 5680) + 24);
            goto LABEL_483;
          }
          continue;
        }
        pthread_mutex_lock((pthread_mutex_t *)v3);
        if (!v121 || v121 == -22)
        {
LABEL_317:
          unsigned int v205 = 1;
          int v121 = -22;
          goto LABEL_452;
        }
LABEL_451:
        unsigned int v205 = -1;
LABEL_452:
        atomic_store(v205, (unsigned int *)(v96 + 5564));
        atomic_store(0, (unsigned int *)(v96 + 5568));
        atomic_store(1u, (unsigned int *)(v96 + 5548));
        atomic_store(1u, (unsigned int *)(v96 + 5552));
        atomic_store(0xFFFFFFFE, *(unsigned int **)(v96 + 2664));
        atomic_store(0xFFFFFFFE, (unsigned int *)(*(void *)(v96 + 2664) + 4));
        sub_224AE1BC0(v96, v121);
        *(_DWORD *)(v96 + 3124) = 0;
        pthread_cond_signal((pthread_cond_t *)(v96 + 5424));
        unsigned int v252 = *(_DWORD *)v281;
        unsigned int v253 = atomic_load((unsigned int *)(v3 + 112));
        unsigned int v254 = atomic_exchange((atomic_uint *volatile)(v3 + 120), 0xFFFFFFFF);
        unsigned int v1 = v274;
        if (v254 < v253)
        {
          if (v252 == -1) {
            goto LABEL_485;
          }
          unsigned int v254 = -1;
        }
        unsigned int v255 = *(_DWORD *)(v3 + 116);
        if (v255 || *(void *)(*v2 + 5712 * v253 + 5592))
        {
          if (v254 == -1)
          {
            if (v252 == -1) {
              goto LABEL_485;
            }
          }
          else if (v252 == -1)
          {
            if (v254 > v255 + v253) {
              goto LABEL_485;
            }
            unsigned int v256 = v254 - v253;
            unsigned int v167 = *((_DWORD *)v2 + 2);
            goto LABEL_473;
          }
          unsigned int v167 = *((_DWORD *)v2 + 2);
          if (v253 <= v252) {
            int v257 = 0;
          }
          else {
            int v257 = *((_DWORD *)v2 + 2);
          }
          unsigned int v258 = v257 + v252;
          if (v254 < v258) {
            unsigned int v258 = v254;
          }
          if (v255 < v167 && v255 + v253 < v258) {
            goto LABEL_485;
          }
          unsigned int v256 = v258 - v253;
          if (v258 - v253 < v167)
          {
            while (!*(void *)(*v2 + 5712 * (v258 % v167) + 5576))
            {
              ++v256;
              ++v258;
              if (v167 == v256)
              {
LABEL_472:
                *(_DWORD *)(v3 + 116) = v167;
                goto LABEL_485;
              }
            }
          }
LABEL_473:
          *(_DWORD *)(v3 + 116) = v256;
          unsigned int v259 = v167 - v256;
          if (v167 > v256)
          {
            uint64_t v260 = *v2;
            unsigned int v261 = v256 + v253;
            do
            {
              *(void *)(v260 + 5712 * (v261 % v167) + 5592) = 0;
              ++v261;
              --v259;
            }
            while (v259);
          }
        }
LABEL_485:
        if (!v1[38]) {
          goto LABEL_4;
        }
LABEL_2:
        pthread_mutex_unlock((pthread_mutex_t *)v3);
        return 0;
      case 1:
        if (atomic_load((unsigned int *)(v96 + 5564))) {
          int v132 = -22;
        }
        else {
          int v132 = sub_224AE12CC(v96);
        }
        if (*(unsigned char *)(*(void *)(v96 + 24) + 438) && !*(_DWORD *)(v96 + 5560))
        {
          if (v132 >= 0) {
            unsigned int v240 = 1;
          }
          else {
            unsigned int v240 = 2147483646;
          }
          atomic_store(v240, *(unsigned int **)(v96 + 3104));
        }
        if (!v132)
        {
          char v248 = 0;
          uint64_t v249 = 1;
          while (1)
          {
            char v250 = v248;
            if (sub_224AFBFF0(v96, v249))
            {
              pthread_mutex_lock((pthread_mutex_t *)v3);
              atomic_store(1u, (unsigned int *)(v96 + 4 * (2 - v249) + 5548));
              atomic_store(0xFFFFFFFF, (unsigned int *)(v96 + 5564));
              atomic_fetch_add((atomic_uint *volatile)(v96 + 5568), -(*(_DWORD *)(v96 + 3464)+ *(unsigned __int8 *)(*(void *)(v96 + 24) + 449)* *(unsigned __int8 *)(*(void *)(v96 + 24) + 445)));
              atomic_store(0xFFFFFFFE, (unsigned int *)(*(void *)(v96 + 2664) + 4 * v249 - 4));
              if (v250)
              {
                if (atomic_load((unsigned int *)(v96 + 5552)))
                {
                  atomic_load((unsigned int *)(v96 + 5568));
                  sub_224AE1BC0(v96, -12);
                  *(_DWORD *)(v96 + 3124) = 0;
                  pthread_cond_signal((pthread_cond_t *)(v96 + 5424));
LABEL_484:
                  pthread_mutex_lock((pthread_mutex_t *)v3);
                  unsigned int v1 = v274;
                  goto LABEL_485;
                }
              }
              pthread_mutex_unlock((pthread_mutex_t *)v3);
            }
            char v248 = 1;
            uint64_t v249 = 2;
            if (v250) {
              goto LABEL_484;
            }
          }
        }
        pthread_mutex_lock((pthread_mutex_t *)v3);
        if (v132 == -22) {
          unsigned int v241 = 1;
        }
        else {
          unsigned int v241 = -1;
        }
        atomic_store(v241, (unsigned int *)(v96 + 5564));
        atomic_store(0, (unsigned int *)(v96 + 5568));
        atomic_store(1u, (unsigned int *)(v96 + 5548));
        atomic_store(1u, (unsigned int *)(v96 + 5552));
        atomic_store(0xFFFFFFFE, *(unsigned int **)(v96 + 2664));
        atomic_store(0xFFFFFFFE, (unsigned int *)(*(void *)(v96 + 2664) + 4));
        sub_224AE1BC0(v96, v132);
        *(_DWORD *)(v96 + 3124) = 0;
        pthread_cond_signal((pthread_cond_t *)(v96 + 5424));
        unsigned int v242 = *(_DWORD *)v281;
        unsigned int v243 = atomic_load((unsigned int *)(v3 + 112));
        unsigned int v244 = atomic_exchange((atomic_uint *volatile)(v3 + 120), 0xFFFFFFFF);
        if (v244 >= v243) {
          goto LABEL_437;
        }
        if (v242 == -1) {
          goto LABEL_502;
        }
        unsigned int v244 = -1;
LABEL_437:
        unsigned int v245 = *(_DWORD *)(v3 + 116);
        if (!v245 && !*(void *)(*v2 + 5712 * v243 + 5592)) {
          goto LABEL_502;
        }
        if (v244 == -1)
        {
          if (v242 == -1) {
            goto LABEL_502;
          }
        }
        else if (v242 == -1)
        {
          if (v244 <= v245 + v243)
          {
            unsigned int v246 = v244 - v243;
            unsigned int v247 = *((_DWORD *)v2 + 2);
LABEL_499:
            *(_DWORD *)(v3 + 116) = v246;
            unsigned int v265 = v247 - v246;
            if (v247 > v246)
            {
              uint64_t v266 = *v2;
              unsigned int v267 = v246 + v243;
              do
              {
                *(void *)(v266 + 5712 * (v267 % v247) + 5592) = 0;
                ++v267;
                --v265;
              }
              while (v265);
            }
          }
LABEL_502:
          atomic_store(1u, (unsigned int *)(v96 + 5544));
          unsigned int v1 = v274;
          goto LABEL_485;
        }
        unsigned int v247 = *((_DWORD *)v2 + 2);
        if (v243 <= v242) {
          int v263 = 0;
        }
        else {
          int v263 = *((_DWORD *)v2 + 2);
        }
        unsigned int v264 = v263 + v242;
        if (v244 < v264) {
          unsigned int v264 = v244;
        }
        if (v245 < v247 && v245 + v243 < v264) {
          goto LABEL_502;
        }
        unsigned int v246 = v264 - v243;
        if (v264 - v243 >= v247) {
          goto LABEL_499;
        }
        do
        {
          if (*(void *)(*v2 + 5712 * (v264 % v247) + 5576)) {
            goto LABEL_499;
          }
          ++v246;
          ++v264;
        }
        while (v247 != v246);
        *(_DWORD *)(v3 + 116) = v247;
        goto LABEL_502;
      case 2:
      case 4:
        BOOL v102 = v100 == 2;
        unint64_t v103 = v281 - *(void *)(v96 + 8 * v102 + 5488);
        uint64_t v104 = *(void *)(v96 + 3264);
        unint64_t v105 = v103 >> 5;
        uint64_t v106 = v96;
        *(void *)(a1 + 16) = v104 + 14624 * (int)(v103 >> 5);
        *(_DWORD *)(a1 + 28) = v101 << *(_DWORD *)(v96 + 3468);
        unsigned int v107 = *((_DWORD *)v2 + 2);
        if (v100 == 4) {
          int v108 = 2;
        }
        else {
          int v108 = 1;
        }
        if (v107 <= 1) {
          int v108 = 0;
        }
        *int v274 = v108;
        BOOL v109 = v107 > 1;
        unsigned int v110 = v99 | v98;
        if (!(v99 | v98))
        {
          unsigned int v110 = sub_224AD42F4(a1);
          unint64_t v105 = v103 >> 5;
        }
        int v111 = (uint64_t)v103 >> 5;
        if (v110) {
          unsigned int v112 = 2147483646;
        }
        else {
          unsigned int v112 = v101 + 1;
        }
        atomic_fetch_or((atomic_uint *volatile)(v106 + 5564), v110);
        if (((int)v101 + 1) << *(_DWORD *)(v106 + 3468) >= *(_DWORD *)(v104 + 14624 * v111 + 13876))
        {
          int v273 = v105;
          pthread_mutex_lock((pthread_mutex_t *)v3);
          atomic_store(v112, (unsigned int *)(v104 + 14624 * v111 + 4 * v102 + 13888));
          unsigned int v124 = *(_DWORD *)v281;
          unsigned int v125 = atomic_load((unsigned int *)(v3 + 112));
          unsigned int v126 = atomic_exchange((atomic_uint *volatile)(v3 + 120), 0xFFFFFFFF);
          if (v126 < v125)
          {
            if (v124 != -1)
            {
              unsigned int v126 = -1;
              goto LABEL_170;
            }
LABEL_335:
            unsigned int v212 = atomic_load((unsigned int *)(v106 + 5564));
            uint64_t v213 = *(void *)(v106 + 24);
            if (*(unsigned char *)(v213 + 438)
              && *v274 <= 1
              && *(_DWORD *)(v106 + 5560)
              && *(unsigned __int16 *)(v213 + 710) == v273)
            {
              if (!v212) {
                sub_224AF7AFC(v213, *(void *)(v106 + 3096), *(void *)(v106 + 3264) + 14624 * *(unsigned __int16 *)(v213 + 710));
              }
              if (*((_DWORD *)v2 + 2) >= 2u)
              {
                if (v212) {
                  unsigned int v214 = 2147483646;
                }
                else {
                  unsigned int v214 = 1;
                }
                atomic_store(v214, *(unsigned int **)(v106 + 3104));
              }
            }
            if (atomic_fetch_add((atomic_uint *volatile)(v106 + 5568), 0xFFFFFFFF) == 1)
            {
              if (atomic_load((unsigned int *)(v106 + 5548)))
              {
                if (v107 < 2 || (unsigned int v216 = atomic_load((unsigned int *)(v106 + 5552))) != 0)
                {
                  unsigned int v217 = atomic_load((unsigned int *)(v106 + 5564));
                  if (v217) {
                    int v218 = -12;
                  }
                  else {
                    int v218 = 0;
                  }
                  if (v217 == 1) {
                    int v219 = -22;
                  }
                  else {
                    int v219 = v218;
                  }
                  sub_224AE1BC0(v106, v219);
                  *(_DWORD *)(v106 + 3124) = 0;
                  pthread_cond_signal((pthread_cond_t *)(v106 + 5424));
                }
              }
            }
            atomic_load((unsigned int *)(v106 + 5568));
            unsigned int v1 = v274;
            if (atomic_fetch_or((atomic_uint *volatile)(v3 + 124), 1u)) {
              goto LABEL_485;
            }
            uint64_t v82 = (pthread_cond_t *)(v3 + 64);
LABEL_106:
            pthread_cond_signal(v82);
            goto LABEL_485;
          }
LABEL_170:
          unsigned int v127 = *(_DWORD *)(v3 + 116);
          if (!v127 && !*(void *)(*v2 + 5712 * v125 + 5592)) {
            goto LABEL_335;
          }
          if (v126 == -1)
          {
            if (v124 == -1) {
              goto LABEL_335;
            }
          }
          else if (v124 == -1)
          {
            if (v126 > v127 + v125) {
              goto LABEL_335;
            }
            unsigned int v128 = v126 - v125;
            unsigned int v129 = *((_DWORD *)v2 + 2);
            goto LABEL_332;
          }
          unsigned int v129 = *((_DWORD *)v2 + 2);
          if (v125 <= v124) {
            int v207 = 0;
          }
          else {
            int v207 = *((_DWORD *)v2 + 2);
          }
          unsigned int v208 = v207 + v124;
          if (v126 < v208) {
            unsigned int v208 = v126;
          }
          if (v127 < v129 && v127 + v125 < v208) {
            goto LABEL_335;
          }
          unsigned int v128 = v208 - v125;
          if (v208 - v125 < v129)
          {
            do
            {
              if (*(void *)(*v2 + 5712 * (v208 % v129) + 5576)) {
                goto LABEL_332;
              }
              ++v128;
              ++v208;
            }
            while (v129 != v128);
            *(_DWORD *)(v3 + 116) = v129;
            goto LABEL_335;
          }
LABEL_332:
          *(_DWORD *)(v3 + 116) = v128;
          unsigned int v209 = v129 - v128;
          if (v129 > v128)
          {
            uint64_t v210 = *v2;
            unsigned int v211 = v128 + v125;
            do
            {
              *(void *)(v210 + 5712 * (v211 % v129) + 5592) = 0;
              ++v211;
              --v209;
            }
            while (v209);
          }
          goto LABEL_335;
        }
        ++*(_DWORD *)(v281 + 8);
        *(_DWORD *)(v281 + 20) = 0;
        uint64_t v96 = v106;
        int v113 = sub_224AFE324((_DWORD *)v281, v106, v109);
        atomic_store(v112, (unsigned int *)(v104 + 14624 * v111 + 4 * v102 + 13888));
        if (v113)
        {
          uint64_t v206 = (pthread_mutex_t *)(v106 + 5608);
          pthread_mutex_lock((pthread_mutex_t *)(v106 + 5608));
          *(void *)(v281 + 24) = 0;
          if (*(void *)(v106 + 5672)) {
            goto LABEL_177;
          }
LABEL_319:
          uint64_t v130 = (uint64_t *)(v96 + 5672);
LABEL_483:
          *uint64_t v130 = v281;
          *(void *)(v96 + 5680) = v281;
          atomic_store(1u, (unsigned int *)(v96 + 5600));
          pthread_mutex_unlock(v206);
          goto LABEL_484;
        }
        unsigned int v114 = *(_DWORD *)v281;
        int v115 = *((_DWORD *)v2 + 2);
        unsigned int v116 = atomic_load((unsigned int *)(v3 + 112));
        if (v116 <= v114) {
          int v115 = 0;
        }
        unsigned int v117 = v115 + v114;
        do
        {
          unsigned int v118 = v117;
          unsigned int v117 = atomic_exchange((atomic_uint *volatile)(v3 + 120), v117);
        }
        while (v117 < v118);
        if (v118 == v116)
        {
          unsigned int v119 = atomic_load((unsigned int *)(v3 + 112));
          if (v119 != v116) {
            atomic_compare_exchange_strong((atomic_uint *volatile)(v3 + 120), &v116, 0xFFFFFFFF);
          }
        }
        if (!atomic_fetch_or((atomic_uint *volatile)(v3 + 124), 1u)) {
          pthread_cond_signal(v279);
        }
        continue;
      case 3:
      case 10:
        goto LABEL_219;
      case 5:
        if (!atomic_load((unsigned int *)(v96 + 5564))) {
          (*(void (**)(uint64_t, void))(v96 + 3312))(v96, *(unsigned int *)(v281 + 8));
        }
        signed int v134 = atomic_load((unsigned int *)(v96 + 4340));
        signed int v135 = *(_DWORD *)(v281 + 8);
        if (v134 >= v135) {
          goto LABEL_185;
        }
        *(_DWORD *)(v281 + 4) = 6;
        uint64_t v206 = (pthread_mutex_t *)(v96 + 5608);
        *(_DWORD *)(v281 + 12) = 0;
        *(_DWORD *)(v281 + 16) = v135;
        pthread_mutex_lock((pthread_mutex_t *)(v96 + 5608));
        *(void *)(v281 + 24) = 0;
        if (*(void *)(v96 + 5672)) {
          uint64_t v130 = (uint64_t *)(*(void *)(v96 + 5680) + 24);
        }
        else {
          uint64_t v130 = (uint64_t *)(v96 + 5672);
        }
        goto LABEL_483;
      case 6:
LABEL_185:
        if (!atomic_load((unsigned int *)(v96 + 5564))) {
          (*(void (**)(uint64_t, uint64_t))(v96 + 3320))(v96, v101);
        }
        uint64_t v137 = *(void *)(v96 + 24);
        if (*(unsigned char *)(v137 + 830) || *(unsigned char *)(v137 + 831))
        {
          if (atomic_load((unsigned int *)(v96 + 5564))) {
            unsigned int v139 = 2147483646;
          }
          else {
            unsigned int v139 = v101 + 1;
          }
          atomic_store(v139, (unsigned int *)(v96 + 4340));
          unsigned int v140 = *(_DWORD *)v281;
          int v141 = *((_DWORD *)v2 + 2);
          unsigned int v142 = atomic_load((unsigned int *)(v3 + 112));
          if (v142 <= v140) {
            int v141 = 0;
          }
          unsigned int v143 = v141 + v140;
          do
          {
            unsigned int v144 = v143;
            unsigned int v143 = atomic_exchange((atomic_uint *volatile)(v3 + 120), v143);
          }
          while (v143 < v144);
          if (v144 == v142)
          {
            unsigned int v145 = atomic_load((unsigned int *)(v3 + 112));
            if (v145 != v142) {
              atomic_compare_exchange_strong((atomic_uint *volatile)(v3 + 120), &v142, 0xFFFFFFFF);
            }
          }
          if (!atomic_fetch_or((atomic_uint *volatile)(v3 + 124), 1u)) {
            pthread_cond_signal(v279);
          }
        }
        else if (*(unsigned char *)(*(void *)(v96 + 8) + 414) || *(_DWORD *)(v96 + 5352))
        {
          atomic_fetch_or((atomic_uint *volatile)(*(void *)(v96 + 4352) + 4 * ((int)v101 >> 5)), 1 << v101);
          if (v101)
          {
            unsigned int v262 = atomic_load((unsigned int *)(*(void *)(v96 + 4352) + 4 * (((int)v101 - 1) >> 5)));
            if (((v262 >> (v101 - 1)) & 1) == 0)
            {
              *(_DWORD *)(v281 + 4) = 7;
              *(_DWORD *)(v281 + 12) = 0;
              *(_DWORD *)(v281 + 16) = 0;
              sub_224AFE520(v96, v281);
              pthread_mutex_lock((pthread_mutex_t *)v3);
              unsigned int v1 = v274;
              goto LABEL_485;
            }
          }
        }
LABEL_201:
        if (*(unsigned char *)(*(void *)(v96 + 8) + 414))
        {
          if (!atomic_load((unsigned int *)(v96 + 5564))) {
            (*(void (**)(uint64_t, uint64_t))(v96 + 3328))(a1, v101);
          }
          unsigned int v147 = *(_DWORD *)v281;
          int v148 = *((_DWORD *)v2 + 2);
          unsigned int v149 = atomic_load((unsigned int *)(v3 + 112));
          if (v149 <= v147) {
            int v148 = 0;
          }
          unsigned int v150 = v148 + v147;
          do
          {
            unsigned int v151 = v150;
            unsigned int v150 = atomic_exchange((atomic_uint *volatile)(v3 + 120), v150);
          }
          while (v150 < v151);
          if (v151 == v149)
          {
            unsigned int v152 = atomic_load((unsigned int *)(v3 + 112));
            if (v152 != v149) {
              atomic_compare_exchange_strong((atomic_uint *volatile)(v3 + 120), &v149, 0xFFFFFFFF);
            }
          }
          if (!atomic_fetch_or((atomic_uint *volatile)(v3 + 124), 1u)) {
            pthread_cond_signal(v279);
          }
        }
LABEL_213:
        if (*(_DWORD *)(*(void *)(v96 + 24) + 236) != *(_DWORD *)(*(void *)(v96 + 24) + 240)
          && !atomic_load((unsigned int *)(v96 + 5564)))
        {
          (*(void (**)(uint64_t, uint64_t))(v96 + 3336))(v96, v101);
        }
LABEL_216:
        unsigned int v154 = atomic_load((unsigned int *)(v96 + 5564));
        if (!v154 && *(_DWORD *)(v96 + 5352)) {
          (*(void (**)(uint64_t, uint64_t))(v96 + 3344))(v96, v101);
        }
LABEL_219:
        int v155 = *(_DWORD *)(v96 + 3464);
        int v156 = 4 * *(_DWORD *)(v96 + 3472);
        if (*(_DWORD *)(v281 + 4) == 3)
        {
          unsigned int v157 = atomic_load((unsigned int *)(v96 + 5564));
          int v158 = v101 + 1;
          if (*(void *)(v96 + 2392))
          {
            unsigned int v159 = v156 * v158;
            if (v158 == v155) {
              unsigned int v159 = -1;
            }
            if (v157) {
              unsigned int v159 = -2;
            }
            atomic_store(v159, *(unsigned int **)(v96 + 2664));
          }
          if (v157) {
            unsigned int v160 = 2147483646;
          }
          else {
            unsigned int v160 = v101 + 1;
          }
          atomic_store(v160, (unsigned int *)(v96 + 4336));
          if (v158 == v155) {
            atomic_store(1u, (unsigned int *)(v96 + 5552));
          }
          pthread_mutex_lock((pthread_mutex_t *)v3);
          unsigned int v161 = atomic_fetch_add((atomic_uint *volatile)(v96 + 5568), 0xFFFFFFFF);
          if (v158 < v155 && v161 != 1)
          {
            unsigned int v162 = *(_DWORD *)v281;
            unsigned int v163 = atomic_load((unsigned int *)(v3 + 112));
            unsigned int v164 = atomic_exchange((atomic_uint *volatile)(v3 + 120), 0xFFFFFFFF);
            unsigned int v1 = v274;
            if (v164 < v163)
            {
              if (v162 == -1) {
                goto LABEL_485;
              }
              unsigned int v164 = -1;
            }
            unsigned int v165 = *(_DWORD *)(v3 + 116);
            if (!v165 && !*(void *)(*v2 + 5712 * v163 + 5592)) {
              goto LABEL_485;
            }
            if (v164 == -1)
            {
              if (v162 == -1) {
                goto LABEL_485;
              }
            }
            else if (v162 == -1)
            {
              if (v164 > v165 + v163) {
                goto LABEL_485;
              }
              unsigned int v166 = v164 - v163;
              unsigned int v167 = *((_DWORD *)v2 + 2);
              goto LABEL_407;
            }
            unsigned int v167 = *((_DWORD *)v2 + 2);
            if (v163 <= v162) {
              int v220 = 0;
            }
            else {
              int v220 = *((_DWORD *)v2 + 2);
            }
            unsigned int v221 = v220 + v162;
            if (v164 < v221) {
              unsigned int v221 = v164;
            }
            if (v165 < v167 && v165 + v163 < v221) {
              goto LABEL_485;
            }
            unsigned int v166 = v221 - v163;
            if (v221 - v163 < v167)
            {
              while (!*(void *)(*v2 + 5712 * (v221 % v167) + 5576))
              {
                ++v166;
                ++v221;
                if (v167 == v166) {
                  goto LABEL_472;
                }
              }
            }
LABEL_407:
            *(_DWORD *)(v3 + 116) = v166;
            unsigned int v228 = v167 - v166;
            if (v167 > v166)
            {
              uint64_t v229 = *v2;
              unsigned int v230 = v166 + v163;
              do
              {
                *(void *)(v229 + 5712 * (v230 % v167) + 5592) = 0;
                ++v230;
                --v228;
              }
              while (v228);
            }
            goto LABEL_485;
          }
          if (v161 == 1)
          {
            if (atomic_load((unsigned int *)(v96 + 5548)))
            {
              if (atomic_load((unsigned int *)(v96 + 5552)))
              {
                unsigned int v174 = atomic_load((unsigned int *)(v96 + 5564));
                if (v174) {
                  int v175 = -12;
                }
                else {
                  int v175 = 0;
                }
                if (v174 == 1) {
                  int v176 = -22;
                }
                else {
                  int v176 = v175;
                }
                sub_224AE1BC0(v96, v176);
                *(_DWORD *)(v96 + 3124) = 0;
                pthread_cond_signal((pthread_cond_t *)(v96 + 5424));
              }
            }
          }
          unsigned int v177 = *(_DWORD *)v281;
          unsigned int v178 = atomic_load((unsigned int *)(v3 + 112));
          unsigned int v179 = atomic_exchange((atomic_uint *volatile)(v3 + 120), 0xFFFFFFFF);
          unsigned int v1 = v274;
          if (v179 < v178)
          {
            if (v177 == -1) {
              goto LABEL_485;
            }
            unsigned int v179 = -1;
          }
          unsigned int v180 = *(_DWORD *)(v3 + 116);
          if (!v180 && !*(void *)(*v2 + 5712 * v178 + 5592)) {
            goto LABEL_485;
          }
          if (v179 == -1)
          {
            if (v177 == -1) {
              goto LABEL_485;
            }
          }
          else if (v177 == -1)
          {
            if (v179 > v180 + v178) {
              goto LABEL_485;
            }
            unsigned int v181 = v179 - v178;
            unsigned int v167 = *((_DWORD *)v2 + 2);
            goto LABEL_411;
          }
          unsigned int v167 = *((_DWORD *)v2 + 2);
          if (v178 <= v177) {
            int v222 = 0;
          }
          else {
            int v222 = *((_DWORD *)v2 + 2);
          }
          unsigned int v223 = v222 + v177;
          if (v179 < v223) {
            unsigned int v223 = v179;
          }
          if (v180 < v167 && v180 + v178 < v223) {
            goto LABEL_485;
          }
          unsigned int v181 = v223 - v178;
          if (v223 - v178 < v167)
          {
            while (!*(void *)(*v2 + 5712 * (v223 % v167) + 5576))
            {
              ++v181;
              ++v223;
              if (v167 == v181) {
                goto LABEL_472;
              }
            }
          }
LABEL_411:
          *(_DWORD *)(v3 + 116) = v181;
          unsigned int v231 = v167 - v181;
          if (v167 > v181)
          {
            uint64_t v232 = *v2;
            unsigned int v233 = v181 + v178;
            do
            {
              *(void *)(v232 + 5712 * (v233 % v167) + 5592) = 0;
              ++v233;
              --v231;
            }
            while (v231);
          }
          goto LABEL_485;
        }
        unsigned int v168 = *((_DWORD *)v2 + 2);
        atomic_fetch_or((atomic_uint *volatile)(*(void *)(v96 + 4344) + 4 * ((int)v101 >> 5)), 1 << v101);
        pthread_mutex_lock((pthread_mutex_t *)(v96 + 5360));
        if (*((_DWORD *)v2 + 2) < 2u)
        {
          unsigned int v169 = 0;
        }
        else
        {
          unsigned int v169 = atomic_load((unsigned int *)(*(void *)(v96 + 2664) + 4));
          if (v169 >= 0xFFFFFFFE)
          {
            unsigned int v170 = (pthread_mutex_t *)(v96 + 5360);
            int v171 = *(_DWORD *)(v96 + 3464);
            goto LABEL_271;
          }
        }
        uint64_t v182 = (int)(v169 >> (*(unsigned char *)(v96 + 3468) + 7));
        while (1)
        {
          unsigned int v183 = atomic_load((unsigned int *)(*(void *)(v96 + 4344) + 4 * v182));
          if (v183 != -1) {
            break;
          }
          if (++v182 >= *(int *)(v96 + 4400))
          {
            unsigned int v170 = (pthread_mutex_t *)(v96 + 5360);
            unsigned int v184 = 0;
            goto LABEL_270;
          }
        }
        unsigned int v170 = (pthread_mutex_t *)(v96 + 5360);
        unsigned int v184 = __clz(__rbit32(~v183));
LABEL_270:
        int v171 = v184 | (32 * v182);
LABEL_271:
        unsigned int v185 = atomic_load((unsigned int *)(v96 + 5564));
        int v186 = v171 * v156;
        if (v171 == v155) {
          int v186 = -1;
        }
        if (*((_DWORD *)v2 + 2) >= 2u && *(void *)(v96 + 2392))
        {
          if (v185) {
            unsigned int v187 = -2;
          }
          else {
            unsigned int v187 = v186;
          }
          atomic_store(v187, (unsigned int *)(*(void *)(v96 + 2664) + 4));
        }
        pthread_mutex_unlock(v170);
        if (v171 == v155) {
          atomic_store(1u, (unsigned int *)(v96 + 5548));
        }
        pthread_mutex_lock((pthread_mutex_t *)v3);
        unsigned int v188 = atomic_fetch_add((atomic_uint *volatile)(v96 + 5568), 0xFFFFFFFF);
        if (v171 < v155 && v188 != 1)
        {
          unsigned int v200 = *(_DWORD *)v281;
          unsigned int v201 = atomic_load((unsigned int *)(v3 + 112));
          unsigned int v202 = atomic_exchange((atomic_uint *volatile)(v3 + 120), 0xFFFFFFFF);
          unsigned int v1 = v274;
          if (v202 < v201)
          {
            if (v200 == -1) {
              goto LABEL_485;
            }
            unsigned int v202 = -1;
          }
          unsigned int v203 = *(_DWORD *)(v3 + 116);
          if (!v203 && !*(void *)(*v2 + 5712 * v201 + 5592)) {
            goto LABEL_485;
          }
          if (v202 == -1)
          {
            if (v200 == -1) {
              goto LABEL_485;
            }
          }
          else if (v200 == -1)
          {
            if (v202 > v203 + v201) {
              goto LABEL_485;
            }
            unsigned int v204 = v202 - v201;
            unsigned int v167 = *((_DWORD *)v2 + 2);
            goto LABEL_419;
          }
          unsigned int v167 = *((_DWORD *)v2 + 2);
          if (v201 <= v200) {
            int v226 = 0;
          }
          else {
            int v226 = *((_DWORD *)v2 + 2);
          }
          unsigned int v227 = v226 + v200;
          if (v202 < v227) {
            unsigned int v227 = v202;
          }
          if (v203 < v167 && v203 + v201 < v227) {
            goto LABEL_485;
          }
          unsigned int v204 = v227 - v201;
          if (v227 - v201 < v167)
          {
            while (!*(void *)(*v2 + 5712 * (v227 % v167) + 5576))
            {
              ++v204;
              ++v227;
              if (v167 == v204) {
                goto LABEL_472;
              }
            }
          }
LABEL_419:
          *(_DWORD *)(v3 + 116) = v204;
          unsigned int v237 = v167 - v204;
          if (v167 > v204)
          {
            uint64_t v238 = *v2;
            unsigned int v239 = v204 + v201;
            do
            {
              *(void *)(v238 + 5712 * (v239 % v167) + 5592) = 0;
              ++v239;
              --v237;
            }
            while (v237);
          }
          goto LABEL_485;
        }
        if (v188 == 1)
        {
          if (atomic_load((unsigned int *)(v96 + 5548)))
          {
            if (v168 < 2 || (unsigned int v191 = atomic_load((unsigned int *)(v96 + 5552))) != 0)
            {
              unsigned int v192 = atomic_load((unsigned int *)(v96 + 5564));
              if (v192) {
                int v193 = -12;
              }
              else {
                int v193 = 0;
              }
              if (v192 == 1) {
                int v194 = -22;
              }
              else {
                int v194 = v193;
              }
              sub_224AE1BC0(v96, v194);
              *(_DWORD *)(v96 + 3124) = 0;
              pthread_cond_signal((pthread_cond_t *)(v96 + 5424));
            }
          }
        }
        unsigned int v195 = *(_DWORD *)v281;
        unsigned int v196 = atomic_load((unsigned int *)(v3 + 112));
        unsigned int v197 = atomic_exchange((atomic_uint *volatile)(v3 + 120), 0xFFFFFFFF);
        unsigned int v1 = v274;
        if (v197 < v196)
        {
          if (v195 == -1) {
            goto LABEL_485;
          }
          unsigned int v197 = -1;
        }
        unsigned int v198 = *(_DWORD *)(v3 + 116);
        if (!v198 && !*(void *)(*v2 + 5712 * v196 + 5592)) {
          goto LABEL_485;
        }
        if (v197 == -1)
        {
          if (v195 == -1) {
            goto LABEL_485;
          }
        }
        else if (v195 == -1)
        {
          if (v197 > v198 + v196) {
            goto LABEL_485;
          }
          unsigned int v199 = v197 - v196;
          unsigned int v167 = *((_DWORD *)v2 + 2);
          goto LABEL_415;
        }
        unsigned int v167 = *((_DWORD *)v2 + 2);
        if (v196 <= v195) {
          int v224 = 0;
        }
        else {
          int v224 = *((_DWORD *)v2 + 2);
        }
        unsigned int v225 = v224 + v195;
        if (v197 < v225) {
          unsigned int v225 = v197;
        }
        if (v198 < v167 && v198 + v196 < v225) {
          goto LABEL_485;
        }
        unsigned int v199 = v225 - v196;
        if (v225 - v196 < v167)
        {
          while (!*(void *)(*v2 + 5712 * (v225 % v167) + 5576))
          {
            ++v199;
            ++v225;
            if (v167 == v199) {
              goto LABEL_472;
            }
          }
        }
LABEL_415:
        *(_DWORD *)(v3 + 116) = v199;
        unsigned int v234 = v167 - v199;
        if (v167 > v199)
        {
          uint64_t v235 = *v2;
          unsigned int v236 = v199 + v196;
          do
          {
            *(void *)(v235 + 5712 * (v236 % v167) + 5592) = 0;
            ++v236;
            --v234;
          }
          while (v234);
        }
        goto LABEL_485;
      case 7:
        goto LABEL_201;
      case 8:
        goto LABEL_213;
      case 9:
        goto LABEL_216;
      default:
        goto LABEL_504;
    }
  }
}

uint64_t sub_224AFE324(_DWORD *a1, uint64_t a2, int a3)
{
  int v3 = a1[1];
  uint64_t v4 = (uint64_t)a1 - *(void *)(a2 + 8 * (v3 == 2) + 5488);
  uint64_t v5 = *(void *)(a2 + 3264);
  signed int v6 = atomic_load((unsigned int *)(v5 + 14624 * (int)((unint64_t)v4 >> 5) + 4 * (v3 == 2) + 13888));
  if (v6 < a1[2]) {
    return 1;
  }
  int v9 = v4 >> 5;
  unsigned int v10 = atomic_fetch_or((atomic_uint *volatile)(a2 + 5564), v6 == 2147483646) | (v6 == 2147483646);
  if (v3 != 2 && a3 && !v10)
  {
    signed int v11 = atomic_load((unsigned int *)(v5 + 14624 * v9 + 13892));
    if (v11 <= a1[2]) {
      return 1;
    }
    unsigned int v10 = atomic_fetch_or((atomic_uint *volatile)(a2 + 5564), v11 == 2147483646) | (v11 == 2147483646);
  }
  uint64_t v7 = 0;
  if (a3 && !v10)
  {
    if ((*(unsigned char *)(*(void *)(a2 + 24) + 232) & 1) == 0) {
      return 0;
    }
    char v12 = *(_DWORD *)(a2 + 2440) == 1;
    int v13 = a1[5];
    if (v13 > 6) {
      return 0;
    }
    int v14 = a1[2];
    int v15 = *(_DWORD *)(a2 + 3468);
    int v16 = (v14 + 1) << (v15 + 2);
    uint64_t v17 = v5 + 14624 * v9;
    int v18 = *(int *)(v17 + 13872) >> v15;
    uint64_t v19 = v13 + 1;
    unsigned int v20 = (void *)(a2 + 296 * v13 + 320);
    for (unsigned int i = (_DWORD *)(*(void *)(v17 + 13944) + 56 * v14 + 8 * v13 - 56 * v18 + 4); ; i += 2)
    {
      unsigned int v22 = v16;
      if (v3 == 2) {
        goto LABEL_29;
      }
      int v23 = *(i - 1);
      if (v23 == 0x80000000) {
        int v24 = 0x80000000;
      }
      else {
        int v24 = v23 + 8;
      }
      if (*i == 0x80000000) {
        int v25 = 0x80000000;
      }
      else {
        int v25 = (*i << v12) + 8;
      }
      if (v24 <= v25) {
        int v24 = v25;
      }
      if (v24 != 0x80000000) {
        break;
      }
LABEL_31:
      uint64_t v7 = 0;
      a1[5] = ++v13;
      v20 += 37;
      if (v19++ == 7) {
        return v7;
      }
    }
    signed int v26 = *((_DWORD *)v20 - 57);
    if (v24 < v26) {
      signed int v26 = v24;
    }
    if (v24 < 1) {
      unsigned int v22 = 1;
    }
    else {
      unsigned int v22 = v26;
    }
LABEL_29:
    unsigned int v27 = atomic_load((unsigned int *)(*v20 + 4 * (v3 != 2)));
    if (v27 < v22) {
      return 1;
    }
    atomic_fetch_or((atomic_uint *volatile)(a2 + 5564), v27 == -2);
    int v13 = a1[5];
    goto LABEL_31;
  }
  return v7;
}

uint64_t sub_224AFE520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 5608);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 5608));
  *(void *)(a2 + 24) = 0;
  if (*(void *)(a1 + 5672)) {
    uint64_t v5 = (void *)(*(void *)(a1 + 5680) + 24);
  }
  else {
    uint64_t v5 = (void *)(a1 + 5672);
  }
  void *v5 = a2;
  *(void *)(a1 + 5680) = a2;
  atomic_store(1u, (unsigned int *)(a1 + 5600));

  return pthread_mutex_unlock(v4);
}

_WORD *sub_224AFE5A8(_WORD *result, uint64_t a2, _DWORD *a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, signed int a8)
{
  int v8 = a3[1] | *a3;
  if (*(void *)a3)
  {
    int v13 = result;
    uint64_t v14 = a2 >> 1;
    int v15 = 1;
    uint64_t v21 = -4 * a5;
    do
    {
      if ((v15 & v8) != 0)
      {
        unsigned int v16 = *a4;
        if (*a4 || (unsigned int v16 = a4[v21], a4[v21]))
        {
          int v17 = v16 >> 4;
          int v18 = (unsigned __int8 *)(a6 + v16);
          if ((a3[1] & v15) != 0) {
            int v19 = 6;
          }
          else {
            int v19 = 4;
          }
          double result = sub_224AFE68C(v13, *v18, v18[64], v17, 1, v14, v19, a8);
        }
      }
      int v20 = -2 * v15;
      v13 += 4;
      a4 += 4;
      v15 *= 2;
    }
    while ((v8 & v20) != 0);
  }
  return result;
}

_WORD *sub_224AFE68C(_WORD *result, int a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7, signed int a8)
{
  char v8 = __clz(a8);
  unsigned int v105 = 1 << (24 - v8);
  int v103 = a2 << (24 - v8);
  signed int v9 = a3 << (24 - v8);
  signed int v10 = a4 << (24 - v8);
  uint64_t v11 = -6 * a6;
  int v12 = -128 << (24 - v8);
  int v13 = (128 << (24 - v8)) - 1;
  uint64_t v14 = 2 * a5;
  uint64_t v104 = 2 * a5;
  int v15 = 4;
  do
  {
    int v16 = (unsigned __int16)result[-2 * a6];
    int v17 = (unsigned __int16)result[-a6];
    int v18 = (unsigned __int16)*result;
    int v19 = (unsigned __int16)result[a6];
    if (v16 - v17 >= 0) {
      signed int v20 = v16 - v17;
    }
    else {
      signed int v20 = v17 - v16;
    }
    if (v20 > v9) {
      goto LABEL_9;
    }
    signed int v21 = v19 - v18;
    if (v19 - v18 < 0) {
      signed int v21 = v18 - v19;
    }
    if (v21 <= v9)
    {
      int v23 = v17 - v18;
      if (v17 - v18 < 0) {
        int v23 = v18 - v17;
      }
      unsigned int v24 = v16 - v19;
      if (v16 - v19 < 0) {
        unsigned int v24 = v19 - v16;
      }
      char v22 = (int)((v24 >> 1) + 2 * v23) <= v103;
    }
    else
    {
LABEL_9:
      char v22 = 0;
    }
    if (a7 < 5)
    {
      int v25 = 0;
      int v26 = 0;
LABEL_47:
      if ((v22 & 1) == 0) {
        goto LABEL_149;
      }
      if (a7 < 6) {
        goto LABEL_80;
      }
      int v31 = 0;
      int v33 = 0;
      goto LABEL_50;
    }
    int v25 = *(unsigned __int16 *)((char *)result + v11);
    int v26 = (unsigned __int16)result[2 * a6];
    signed int v27 = v25 - v16;
    if (v25 - v16 < 0) {
      signed int v27 = v16 - v25;
    }
    signed int v28 = v26 - v19;
    if (v26 - v19 < 0) {
      signed int v28 = v19 - v26;
    }
    BOOL v29 = v28 <= v9;
    BOOL v30 = v27 <= v9 && v29;
    v22 &= v30;
    if (a7 < 7) {
      goto LABEL_47;
    }
    int v31 = (unsigned __int16)result[-4 * a6];
    signed int v32 = v31 - v25;
    if (v31 - v25 < 0) {
      signed int v32 = v25 - v31;
    }
    if (v32 <= v9)
    {
      int v33 = (unsigned __int16)result[3 * a6];
      signed int v34 = v33 - v26;
      if (v33 - v26 < 0) {
        signed int v34 = v26 - v33;
      }
      if (v34 > v9) {
        char v22 = 0;
      }
      if (v22)
      {
        if (a7 >= 0x10)
        {
          int v35 = (unsigned __int16)result[-6 * a6];
          int v36 = (unsigned __int16)result[-5 * a6];
          int v37 = (unsigned __int16)result[4 * a6];
          int v38 = (unsigned __int16)result[5 * a6];
          int v39 = (unsigned __int16)result[6 * a6];
          int v40 = (unsigned __int16)result[-7 * a6];
          unsigned int v41 = v40 - v17;
          if (v40 - v17 < 0) {
            unsigned int v41 = v17 - v40;
          }
          int v101 = (unsigned __int16)result[-6 * a6];
          int v102 = (unsigned __int16)result[-5 * a6];
          if (v41 > v105) {
            goto LABEL_45;
          }
          unsigned int v42 = v35 - v17;
          if (v35 - v17 < 0) {
            unsigned int v42 = v17 - v35;
          }
          if (v42 > v105) {
            goto LABEL_45;
          }
          unsigned int v43 = v36 - v17;
          if (v36 - v17 < 0) {
            unsigned int v43 = v17 - v36;
          }
          if (v43 > v105) {
            goto LABEL_45;
          }
          unsigned int v44 = v37 - v18;
          if (v37 - v18 < 0) {
            unsigned int v44 = v18 - v37;
          }
          if (v44 <= v105)
          {
            unsigned int v97 = v38 - v18;
            if (v38 - v18 < 0) {
              unsigned int v97 = v18 - v38;
            }
            BOOL v49 = v97 > v105;
            int v47 = (unsigned __int16)result[-7 * a6];
            int v45 = 0;
            if (v49)
            {
              BOOL v46 = 0;
            }
            else
            {
              unsigned int v98 = v39 - v18;
              if (v39 - v18 < 0) {
                unsigned int v98 = v18 - v39;
              }
              BOOL v46 = v98 <= v105;
            }
          }
          else
          {
LABEL_45:
            int v45 = 0;
            BOOL v46 = 0;
            int v47 = (unsigned __int16)result[-7 * a6];
          }
LABEL_51:
          unsigned int v48 = v25 - v17;
          if (v25 - v17 < 0) {
            unsigned int v48 = v17 - v25;
          }
          BOOL v49 = v20 > v105 || v48 > v105;
          if (v49) {
            goto LABEL_60;
          }
          unsigned int v50 = v19 - v18;
          if (v19 - v18 < 0) {
            unsigned int v50 = v18 - v19;
          }
          if (v50 > v105)
          {
LABEL_60:
            BOOL v51 = 0;
          }
          else
          {
            unsigned int v52 = v26 - v18;
            if (v26 - v18 < 0) {
              unsigned int v52 = v18 - v26;
            }
            BOOL v51 = v52 <= v105;
          }
          if (a7 < 8)
          {
            if (a7 != 6 || !v51) {
              goto LABEL_80;
            }
            int v60 = 2 * v17 + 4;
            int v61 = v60 + 2 * v16;
            result[-2 * a6] = (v61 + v18 + 3 * v25) >> 3;
            result[-a6] = (v61 + 2 * v18 + v19 + v25) >> 3;
            *double result = (v60 + v16 + 2 * v18 + 2 * v19 + v26) >> 3;
            unsigned int v62 = (v17 + 2 * v18 + 2 * v19 + v26 + 2 * v26 + 4) >> 3;
          }
          else
          {
            uint64_t v53 = v11;
            unsigned int v54 = v31 - v17;
            if (v31 - v17 < 0) {
              unsigned int v54 = v17 - v31;
            }
            BOOL v49 = v54 > v105;
            uint64_t v11 = v53;
            if (!v49)
            {
              unsigned int v55 = v33 - v18;
              if (v33 - v18 < 0) {
                unsigned int v55 = v18 - v33;
              }
              if (v55 > v105) {
                BOOL v51 = 0;
              }
              if (((v45 | (!v46 || !v51)) & 1) == 0)
              {
                int v100 = v18 + v17 + 8;
                result[-6 * a6] = (v100 + v16 + v31 + v25 + 2 * v102 + 2 * v101 - v47 + 8 * v47) >> 4;
                result[-5 * a6] = (v100 + v16 + v19 + 2 * v31 + v25 + 2 * v102 + 2 * v101 + 5 * v47) >> 4;
                int v99 = v16 + 8 + v17 + v18;
                result[-4 * a6] = (v99 + v19 + 2 * v31 + 2 * v25 + v26 + v101 + 2 * v102 + 4 * v47) >> 4;
                int v95 = 2 * v16 + 8;
                *(_WORD *)((char *)result + v53) = (v95
                                                                + v17
                                                                + v18
                                                                + v19
                                                                + 2 * v31
                                                                + 2 * v25
                                                                + v26
                                                                + v33
                                                                + v102
                                                                + v101
                                                                + 3 * v47) >> 4;
                int v96 = v95 + 2 * v17;
                result[-2 * a6] = (v96
                                               + v18
                                               + v19
                                               + v31
                                               + 2 * v25
                                               + v26
                                               + v33
                                               + v37
                                               + v102
                                               + v101
                                               + 2 * v47) >> 4;
                uint64_t v11 = v53;
                result[-a6] = (v96 + 2 * v18 + v19 + v31 + v25 + v26 + v33 + v38 + v37 + v102 + v101 + v47) >> 4;
                *double result = (v16
                                       + 8
                                       + 2 * v17
                                       + 2 * v18
                                       + 2 * v19
                                       + v31
                                       + v25
                                       + v26
                                       + v33
                                       + v39
                                       + v38
                                       + v37
                                       + v102
                                       + v101) >> 4;
                result[a6] = (v16
                                          + 8
                                          + v17
                                          + 2 * v18
                                          + 2 * v19
                                          + v31
                                          + v25
                                          + 2 * v26
                                          + v33
                                          + v38
                                          + 2 * v39
                                          + v37
                                          + v102) >> 4;
                result[2 * a6] = (v99 + 2 * v19 + v31 + v25 + 2 * v26 + 2 * v33 + v39 + v38 + 2 * v39 + v37) >> 4;
                result[3 * a6] = (v99 + v19 + v25 + 2 * v26 + 2 * v33 + v38 + 4 * v39 + 2 * v37) >> 4;
                result[4 * a6] = (v99 + v19 + v26 + 2 * v33 + v39 + 4 * v39 + 2 * v38 + 2 * v37) >> 4;
                result[5 * a6] = (v100 + v19 + v26 + v33 + v39 + 4 * v39 + 2 * v39 + 2 * v38 + 2 * v37) >> 4;
                goto LABEL_148;
              }
              uint64_t v11 = v53;
              if (v51)
              {
                int v56 = v17 + 4 + v18 + v19;
                int v57 = v17 + 4 + v16;
                *(_WORD *)((char *)result + v53) = (v57 + v18 + 3 * v31 + 2 * v25) >> 3;
                result[-2 * a6] = (v56 + v25 + 2 * (v31 + v16)) >> 3;
                result[-a6] = (v16 + 2 * v17 + v18 + v19 + v31 + v25 + v26 + 4) >> 3;
                *double result = (v57 + 2 * v18 + v19 + v25 + v26 + v33) >> 3;
                result[a6] = (v57 + v18 + 2 * v19 + v26 + 2 * v33) >> 3;
                int v58 = v56 + 2 * v26;
                uint64_t v11 = v53;
                result[2 * a6] = (v58 + v33 + 2 * v33) >> 3;
LABEL_148:
                uint64_t v14 = v104;
                goto LABEL_149;
              }
            }
LABEL_80:
            if (v20 > v10) {
              goto LABEL_84;
            }
            signed int v63 = v19 - v18;
            if (v19 - v18 < 0) {
              signed int v63 = v18 - v19;
            }
            if (v63 > v10)
            {
LABEL_84:
              if (v16 - v19 >= v13) {
                int v64 = v13;
              }
              else {
                int v64 = v16 - v19;
              }
              if (v16 - v19 >= v12) {
                int v65 = v64;
              }
              else {
                int v65 = v12;
              }
              int v66 = v65 + 3 * (v18 - v17);
              if (v66 >= v13) {
                int v67 = v13;
              }
              else {
                int v67 = v66;
              }
              if (v66 >= v12) {
                int v68 = v67;
              }
              else {
                int v68 = v12;
              }
              int v69 = v68 + 4;
              if (v68 + 4 >= v13) {
                int v69 = v13;
              }
              int v70 = v68 + 3;
              if (v70 >= v13) {
                int v70 = v13;
              }
              int v71 = v17 + (v70 >> 3);
              if (v71 >= a8) {
                __int16 v72 = a8;
              }
              else {
                __int16 v72 = v71;
              }
              if (v71 >= 0) {
                __int16 v73 = v72;
              }
              else {
                __int16 v73 = 0;
              }
              result[-a6] = v73;
              int v74 = v18 - (v69 >> 3);
              if (v74 >= a8) {
                __int16 v75 = a8;
              }
              else {
                __int16 v75 = v18 - (v69 >> 3);
              }
              if (v74 >= 0) {
                __int16 v76 = v75;
              }
              else {
                __int16 v76 = 0;
              }
              *double result = v76;
              goto LABEL_148;
            }
            int v77 = 3 * (v18 - v17);
            if (v77 >= v13) {
              int v78 = v13;
            }
            else {
              int v78 = 3 * (v18 - v17);
            }
            if (v77 >= v12) {
              int v79 = v78;
            }
            else {
              int v79 = v12;
            }
            int v80 = v79 + 4;
            if (v79 + 4 >= v13) {
              int v80 = v13;
            }
            int v81 = v80 >> 3;
            int v82 = v79 + 3;
            if (v82 >= v13) {
              int v82 = v13;
            }
            int v83 = v17 + (v82 >> 3);
            if (v83 >= a8) {
              __int16 v84 = a8;
            }
            else {
              __int16 v84 = v83;
            }
            if (v83 >= 0) {
              __int16 v85 = v84;
            }
            else {
              __int16 v85 = 0;
            }
            result[-a6] = v85;
            int v86 = v18 - (v80 >> 3);
            if (v86 >= a8) {
              __int16 v87 = a8;
            }
            else {
              __int16 v87 = v18 - (v80 >> 3);
            }
            if (v86 >= 0) {
              __int16 v88 = v87;
            }
            else {
              __int16 v88 = 0;
            }
            *double result = v88;
            int v89 = v81 + 1;
            int v90 = v16 + ((v81 + 1) >> 1);
            if (v90 >= a8) {
              __int16 v91 = a8;
            }
            else {
              __int16 v91 = v16 + ((v81 + 1) >> 1);
            }
            if (v90 >= 0) {
              __int16 v92 = v91;
            }
            else {
              __int16 v92 = 0;
            }
            result[-2 * a6] = v92;
            int v93 = v19 - (v89 >> 1);
            if (v93 >= a8) {
              __int16 v94 = a8;
            }
            else {
              __int16 v94 = v93;
            }
            if (v93 >= 0) {
              LOWORD(v62) = v94;
            }
            else {
              LOWORD(v62) = 0;
            }
          }
          result[a6] = v62;
          goto LABEL_148;
        }
LABEL_50:
        BOOL v46 = 0;
        int v39 = 0;
        int v38 = 0;
        int v37 = 0;
        int v101 = 0;
        int v102 = 0;
        int v47 = 0;
        int v45 = 1;
        goto LABEL_51;
      }
    }
LABEL_149:
    double result = (_WORD *)((char *)result + v14);
    --v15;
  }
  while (v15);
  return result;
}

_WORD *sub_224AFEEC0(_WORD *result, uint64_t a2, _DWORD *a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, signed int a8)
{
  int v8 = a3[1] | *a3;
  if (*(void *)a3)
  {
    int v13 = result;
    uint64_t v14 = a2 >> 1;
    uint64_t v15 = 4 * a2;
    int v16 = 1;
    uint64_t v17 = 4 * a5;
    do
    {
      if ((v16 & v8) != 0)
      {
        unsigned int v18 = *a4;
        if (*a4 || (unsigned int v18 = *(a4 - 4), *(a4 - 4)))
        {
          int v19 = v18 >> 4;
          signed int v20 = (unsigned __int8 *)(a6 + v18);
          if ((a3[1] & v16) != 0) {
            int v21 = 6;
          }
          else {
            int v21 = 4;
          }
          double result = sub_224AFE68C(v13, *v20, v20[64], v19, v14, 1, v21, a8);
        }
      }
      int v22 = -2 * v16;
      int v13 = (_WORD *)((char *)v13 + v15);
      a4 += v17;
      v16 *= 2;
    }
    while ((v8 & v22) != 0);
  }
  return result;
}

_WORD *sub_224AFEF98(_WORD *result, uint64_t a2, _DWORD *a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, signed int a8)
{
  int v8 = a3[1] | *a3 | a3[2];
  if (v8)
  {
    int v13 = result;
    uint64_t v14 = a2 >> 1;
    int v15 = 1;
    uint64_t v16 = -4 * a5;
    do
    {
      if ((v15 & v8) != 0)
      {
        unsigned int v17 = *a4;
        if (*a4 || (unsigned int v17 = a4[v16], a4[v16]))
        {
          if ((a3[2] & v15) != 0) {
            char v18 = 2;
          }
          else {
            char v18 = (a3[1] & v15) != 0;
          }
          double result = sub_224AFE68C(v13, *(unsigned __int8 *)(a6 + v17), *(unsigned __int8 *)(a6 + v17 + 64), v17 >> 4, 1, v14, 4 << v18, a8);
        }
      }
      int v19 = -2 * v15;
      v13 += 4;
      a4 += 4;
      v15 *= 2;
    }
    while ((v8 & v19) != 0);
  }
  return result;
}

_WORD *sub_224AFF088(_WORD *result, uint64_t a2, _DWORD *a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, signed int a8)
{
  int v8 = a3[1] | *a3 | a3[2];
  if (v8)
  {
    int v13 = result;
    uint64_t v14 = a2 >> 1;
    uint64_t v15 = 4 * a2;
    int v16 = 1;
    uint64_t v17 = 4 * a5;
    do
    {
      if ((v16 & v8) != 0)
      {
        unsigned int v18 = *a4;
        if (*a4 || (unsigned int v18 = *(a4 - 4), *(a4 - 4)))
        {
          if ((a3[2] & v16) != 0) {
            char v19 = 2;
          }
          else {
            char v19 = (a3[1] & v16) != 0;
          }
          double result = sub_224AFE68C(v13, *(unsigned __int8 *)(a6 + v18), *(unsigned __int8 *)(a6 + v18 + 64), v18 >> 4, v14, 1, 4 << v19, a8);
        }
      }
      int v20 = -2 * v16;
      int v13 = (_WORD *)((char *)v13 + v15);
      a4 += v17;
      v16 *= 2;
    }
    while ((v8 & v20) != 0);
  }
  return result;
}

char *sub_224AFF17C(char *result, unsigned int a2, unsigned int a3, size_t __len, unsigned int a5, int a6, unsigned int a7, uint64_t *__b, uint64_t *__ba, char a10, char a11)
{
  uint64_t v13 = 0;
  uint64_t v14 = a7;
  unsigned int v15 = 1 << (0x10u >> a11);
  uint64_t v16 = (1 << a2);
  unint64_t v17 = (0x7DFDEuLL >> a7) & 1;
  unint64_t v18 = (0x7BFBEuLL >> a7) & 1;
  unsigned int v19 = v16;
  do
  {
    int v20 = *((unsigned __int8 *)__ba + v13);
    if ((int)v17 < v20) {
      int v20 = (0x7DFDEuLL >> a7) & 1;
    }
    uint64_t v21 = (uint64_t)&result[8 * a3 + 4 * v20];
    *(_WORD *)(v21 + 2 * (v19 >= v15)) |= v19 >> ((v19 >= v15) << (4 - a11));
    ++v13;
    v19 *= 2;
  }
  while (a5 != v13);
  uint64_t v22 = 0;
  int v23 = &byte_224B28D18[8 * a7];
  unsigned int v24 = 1 << (0x10u >> a10);
  unsigned int v25 = 1 << a3;
  do
  {
    int v26 = *((unsigned __int8 *)__b + v22);
    if ((int)v18 < v26) {
      int v26 = v18;
    }
    uint64_t v27 = (uint64_t)&result[8 * a2 + 4 * v26 + 2 * (v25 >= v24)];
    *(_WORD *)(v27 + 256) |= v25 >> ((v25 >= v24) << (4 - a10));
    ++v22;
    v25 *= 2;
  }
  while (__len != v22);
  if (!a6)
  {
    uint64_t v28 = *v23;
    if ((int)v28 < (int)__len)
    {
      unsigned int v29 = (v16 << a5) - v16;
      unsigned int v30 = v29 >> (0x10u >> a11);
      int v31 = (v15 - 1) & v29;
      signed int v32 = &result[((4 * v17) | (8 * (v28 + a3))) + 2];
      unint64_t v33 = *v23;
      do
      {
        if (v31) {
          *((_WORD *)v32 - 1) |= v31;
        }
        if (v30) {
          *(_WORD *)v32 |= v30;
        }
        v33 += v28;
        v32 += 8 * v28;
      }
      while (v33 < __len);
    }
    unint64_t v34 = byte_224B28D18[8 * v14 + 1];
    if ((int)v34 < (int)a5)
    {
      unsigned int v35 = ((unint64_t)(1 << a3) << __len) - (1 << a3);
      unsigned int v36 = v35 >> (0x10u >> a10);
      int v37 = (v24 - 1) & v35;
      int v38 = &result[((4 * v18) | (8 * (v34 + a2))) + 258];
      unint64_t v39 = v34;
      do
      {
        if (v37) {
          *((_WORD *)v38 - 1) |= v37;
        }
        if (v36) {
          *(_WORD *)v38 |= v36;
        }
        v39 += v34;
        v38 += 8 * v34;
      }
      while (v39 < a5);
    }
  }
  switch((int)__len)
  {
    case 1:
      *(unsigned char *)__b = v18;
      break;
    case 2:
      if (v18) {
        __int16 v41 = 257;
      }
      else {
        __int16 v41 = 0;
      }
      *(_WORD *)__b = v41;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_31;
    case 4:
      if (v18) {
        int v42 = 16843009;
      }
      else {
        int v42 = 0;
      }
      *(_DWORD *)__b = v42;
      break;
    case 8:
      uint64_t v43 = 0x101010101010101;
      if (!v18) {
        uint64_t v43 = 0;
      }
      *__b = v43;
      break;
    default:
      if (__len == 16)
      {
        uint64_t v44 = 0x101010101010101;
        if (!v18) {
          uint64_t v44 = 0;
        }
        *__b = v44;
        __b[1] = v44;
      }
      else if (__len == 32)
      {
        uint64_t v40 = 0x101010101010101;
        if (!v18) {
          uint64_t v40 = 0;
        }
        *__b = v40;
        __b[1] = v40;
        __b[2] = v40;
        __b[3] = v40;
      }
      else
      {
LABEL_31:
        double result = (char *)memset(__b, v18, __len);
      }
      break;
  }
  switch(a5)
  {
    case 1u:
      *(unsigned char *)__ba = v17;
      break;
    case 2u:
      if (v17) {
        __int16 v46 = 257;
      }
      else {
        __int16 v46 = 0;
      }
      *(_WORD *)__ba = v46;
      break;
    case 3u:
    case 5u:
    case 6u:
    case 7u:
      goto LABEL_53;
    case 4u:
      if (v17) {
        int v47 = 16843009;
      }
      else {
        int v47 = 0;
      }
      *(_DWORD *)__ba = v47;
      break;
    case 8u:
      uint64_t v48 = 0x101010101010101;
      if (!v17) {
        uint64_t v48 = 0;
      }
      *__ba = v48;
      break;
    default:
      if (a5 == 16)
      {
        uint64_t v49 = 0x101010101010101;
        if (!v17) {
          uint64_t v49 = 0;
        }
        *__ba = v49;
        __ba[1] = v49;
      }
      else if (a5 == 32)
      {
        uint64_t v45 = 0x101010101010101;
        if (!v17) {
          uint64_t v45 = 0;
        }
        *__ba = v45;
        __ba[1] = v45;
        __ba[2] = v45;
        __ba[3] = v45;
      }
      else
      {
LABEL_53:
        double result = (char *)memset(__ba, v17, a5);
      }
      break;
  }
  return result;
}

uint64_t sub_224AFF588(uint64_t result, unsigned int a2, int a3, int a4, int a5, uint64_t a6)
{
  uint64_t v6 = result;
  uint64_t v7 = a2;
  int v8 = &byte_224B28D18[8 * a2];
  if (a2 && a3 <= 1)
  {
    uint64_t v9 = a6;
    LODWORD(v10) = a5;
    LODWORD(v11) = a4;
    uint64_t v12 = a3;
    uint64_t v13 = (a3 + 1);
    while (((*(unsigned __int16 *)(v9 + 2 * v12) >> (v10 + 4 * v11)) & 1) != 0)
    {
      uint64_t v45 = v12;
      char v46 = v7;
      uint64_t v14 = (char *)&byte_224B28D18[8 * v7];
      uint64_t v15 = v14[6];
      unint64_t v16 = *v8;
      unint64_t v17 = v14[1];
      unint64_t v18 = v17 >> 1;
      uint64_t v11 = (2 * v11);
      uint64_t v10 = (2 * v10);
      double result = sub_224AFF588(v6, v15, v13, v11, v10, v9);
      if (v16 >= v17)
      {
        double result = sub_224AFF588(v6 + (v16 >> 1), v15, v13, v11, v10 | 1, v9);
        if (v17 < v16) {
          return result;
        }
        uint64_t v11 = v11 | 1;
        double result = sub_224AFF588(v6 + 32 * v18, v15, v13, v11, v10, v9);
        v6 += 32 * v18 + (v16 >> 1);
        LODWORD(v10) = v10 | 1;
      }
      else
      {
        v6 += 32 * v18;
        LODWORD(v11) = v11 | 1;
      }
      int v8 = &byte_224B28D18[8 * v15];
      if (((0x63uLL >> v46) & 1) == 0)
      {
        uint64_t v13 = (v13 + 1);
        uint64_t v12 = v45 + 1;
        uint64_t v7 = v15;
        uint64_t v9 = a6;
        if (v45 <= 0) {
          continue;
        }
      }
      goto LABEL_13;
    }
  }
  uint64_t v15 = v7;
LABEL_13:
  unsigned int v19 = (char *)&byte_224B28D18[8 * v15];
  if (v19[2] >= 2u) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = v19[2];
  }
  int v21 = v19[3];
  if (v21 >= 2) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = v21;
  }
  int v23 = *v8;
  switch(*v8)
  {
    case 1u:
      uint64_t v24 = byte_224B28D18[8 * v15 + 1];
      unsigned int v25 = byte_224B28D18[8 * v15 + 1];
      int v26 = (unsigned char *)v6;
      do
      {
        *int v26 = v20;
        v26[2048] = v22;
        v26[1024] = 1;
        v26 += 32;
        --v24;
      }
      while (v24);
      goto LABEL_35;
    case 2u:
      uint64_t v31 = byte_224B28D18[8 * v15 + 1];
      unsigned int v25 = byte_224B28D18[8 * v15 + 1];
      __int16 v32 = v20 | ((_WORD)v20 << 8);
      __int16 v33 = v22 | ((_WORD)v22 << 8);
      uint64_t v34 = v6;
      do
      {
        *(_WORD *)uint64_t v34 = v32;
        *(_WORD *)(v34 + 2048) = v33;
        *(unsigned char *)(v34 + 1024) = 2;
        v34 += 32;
        --v31;
      }
      while (v31);
      goto LABEL_35;
    case 3u:
    case 5u:
    case 6u:
    case 7u:
      return result;
    case 4u:
      uint64_t v35 = byte_224B28D18[8 * v15 + 1];
      unsigned int v25 = byte_224B28D18[8 * v15 + 1];
      int v36 = 16843009 * v20;
      int v37 = 16843009 * v22;
      uint64_t v38 = v6;
      do
      {
        *(_DWORD *)uint64_t v38 = v36;
        *(_DWORD *)(v38 + 2048) = v37;
        *(unsigned char *)(v38 + 1024) = 4;
        v38 += 32;
        --v35;
      }
      while (v35);
      goto LABEL_35;
    case 8u:
      uint64_t v39 = byte_224B28D18[8 * v15 + 1];
      unsigned int v25 = byte_224B28D18[8 * v15 + 1];
      uint64_t v40 = 0x101010101010101 * v20;
      uint64_t v41 = 0x101010101010101 * v22;
      uint64_t v42 = v6;
      do
      {
        *(void *)uint64_t v42 = v40;
        *(void *)(v42 + 2048) = v41;
        *(unsigned char *)(v42 + 1024) = 8;
        v42 += 32;
        --v39;
      }
      while (v39);
      goto LABEL_35;
    default:
      if (v23 != 16) {
        return result;
      }
      unsigned int v25 = byte_224B28D18[8 * v15 + 1];
      int64x2_t v27 = vdupq_n_s64(0x101010101010101 * v20);
      int64x2_t v28 = vdupq_n_s64(0x101010101010101 * v22);
      unsigned int v29 = (int64x2_t *)v6;
      uint64_t v30 = byte_224B28D18[8 * v15 + 1];
      do
      {
        *unsigned int v29 = v27;
        v29[128] = v28;
        v29[64].i8[0] = 16;
        v29 += 2;
        --v30;
      }
      while (v30);
LABEL_35:
      switch(v23)
      {
        case 1:
          *(unsigned char *)(v6 + 3072) = v25;
          break;
        case 2:
          *(_WORD *)(v6 + 3072) = v25 | ((_WORD)v25 << 8);
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          return result;
        case 4:
          *(_DWORD *)(v6 + 3072) = 16843009 * v25;
          break;
        case 8:
          *(void *)(v6 + 3072) = 0x101010101010101 * v25;
          break;
        default:
          if (v23 == 16)
          {
            uint64_t v43 = 0x101010101010101 * v25;
            *(void *)(v6 + 3072) = v43;
            *(void *)(v6 + 3080) = v43;
          }
          break;
      }
      break;
  }
  return result;
}

void sub_224AFF938(void *a1, unsigned char *a2, char *a3)
{
  if (a2[722]) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 1;
  }
  if (a2[830] || a2[831])
  {
    if (a2[834]) {
      uint64_t v6 = (uint64_t)(a2 + 836);
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = a1 + 6;
    for (unsigned int i = a2 + 731; ; i += 10)
    {
      int v9 = a2[722];
      if (a2[722]) {
        int v10 = *(i - 3);
      }
      else {
        int v10 = 0;
      }
      sub_224AFFAC0((uint64_t)(v7 - 6), a2[830], *a3, v10, v6);
      if (a2[828]) {
        uint64_t v11 = a3 + 1;
      }
      else {
        uint64_t v11 = a3;
      }
      if (v9) {
        int v12 = *(i - 2);
      }
      else {
        int v12 = 0;
      }
      sub_224AFFAC0((uint64_t)(v7 - 4), a2[831], *v11, v12, v6);
      if (v9) {
        int v13 = *(i - 1);
      }
      else {
        int v13 = 0;
      }
      uint64_t v14 = v7 - 2;
      if (a2[832])
      {
        sub_224AFFAC0((uint64_t)v14, a2[832], a3[2 * (a2[828] != 0)], v13, v6);
      }
      else
      {
        *uint64_t v14 = 0;
        *(v7 - 1) = 0;
      }
      if (a2[828]) {
        uint64_t v15 = 3;
      }
      else {
        uint64_t v15 = 0;
      }
      if (v9)
      {
        int v16 = *i;
        if (!a2[833]) {
          goto LABEL_32;
        }
      }
      else
      {
        int v16 = 0;
        if (!a2[833])
        {
LABEL_32:
          *uint64_t v7 = 0;
          v7[1] = 0;
          goto LABEL_33;
        }
      }
      sub_224AFFAC0((uint64_t)v7, a2[833], a3[v15], v16, v6);
LABEL_33:
      v7 += 8;
      if (!--v5) {
        return;
      }
    }
  }

  bzero(a1, (v5 << 6));
}

uint64_t sub_224AFFAC0(uint64_t result, int a2, int a3, int a4, uint64_t a5)
{
  int v5 = a3 + a2;
  if (a3 + a2 >= 63) {
    int v5 = 63;
  }
  int v6 = (v5 & ~(v5 >> 31)) + a4;
  if (v6 >= 63) {
    int v6 = 63;
  }
  unsigned int v7 = v6 & ~(v6 >> 31);
  if (a5)
  {
    int v8 = (*(char *)(a5 + 2) << (v7 > 0x1F)) + v7;
    if (v8 >= 63) {
      int v8 = 63;
    }
    char v9 = v8 & ~(v8 >> 31);
    *(unsigned char *)(result + 1) = v9;
    *(unsigned char *)double result = v9;
    for (uint64_t i = 1; i != 8; ++i)
    {
      uint64_t v11 = 0;
      char v12 = 1;
      do
      {
        char v13 = v12;
        int v14 = ((*(char *)(a5 + i + 2) + *(char *)(a5 + v11)) << (v7 > 0x1F)) + v7;
        if (v14 >= 63) {
          int v14 = 63;
        }
        *(unsigned char *)(result + 2 * i + v11) = v14 & ~(v14 >> 31);
        uint64_t v11 = 1;
        char v12 = 0;
      }
      while ((v13 & 1) != 0);
    }
  }
  else
  {
    uint64_t v15 = 0x101010101010101 * v7;
    *(void *)double result = v15;
    *(void *)(result + 8) = v15;
  }
  return result;
}

void sub_224AFFB80(void (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a2 + 8);
  uint64_t v11 = ~(-1 << *(_DWORD *)(a2 + 68));
  (*a1)(a5, v10, v11);
  if (*(_DWORD *)(v10 + 40) || *(_DWORD *)(v10 + 36)) {
    ((void (*)(uint64_t, uint64_t, uint64_t, void, uint64_t))a1[(*(_DWORD *)(a3 + 64) - 1) + 1])(a5 + 12136, a5, v10, 0, v11);
  }
  if (*(_DWORD *)(v10 + 44) || *(_DWORD *)(v10 + 36)) {
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))a1[(*(_DWORD *)(a3 + 64) - 1) + 1])(a5 + 24272, a5, v10, 1, v11);
  }
  int v12 = *(_DWORD *)(v10 + 4);
  if (v12)
  {
    sub_224AFFDE8(*(_DWORD *)(a3 + 68), (unsigned __int8 *)(v10 + 8), v12, a4);
  }
  else if (*(_DWORD *)(v10 + 36))
  {
    bzero(a4, 1 << *(_DWORD *)(a3 + 68));
  }
  int v13 = *(_DWORD *)(v10 + 40);
  if (v13) {
    sub_224AFFDE8(*(_DWORD *)(a3 + 68), (unsigned __int8 *)(v10 + 48), v13, a4 + 4096);
  }
  int v14 = *(_DWORD *)(v10 + 44);
  if (v14) {
    sub_224AFFDE8(*(_DWORD *)(a3 + 68), (unsigned __int8 *)(v10 + 68), v14, a4 + 0x2000);
  }
  if (!*(_DWORD *)(v10 + 4))
  {
    uint64_t v15 = *(void *)(a2 + 40);
    size_t v16 = v15 * *(int *)(a2 + 60);
    unint64_t v17 = *(char **)(a2 + 16);
    if ((v16 & 0x8000000000000000) != 0)
    {
      unint64_t v17 = &v17[v16 - v15];
      unint64_t v18 = (const void *)(*(void *)(a3 + 16) + v16 - v15);
      size_t v16 = -(uint64_t)v16;
    }
    else
    {
      unint64_t v18 = *(const void **)(a3 + 16);
    }
    memcpy(v17, v18, v16);
  }
  int v19 = *(_DWORD *)(a3 + 64);
  if (v19 && !*(_DWORD *)(v10 + 36))
  {
    uint64_t v20 = *(void *)(a2 + 48);
    char v21 = v19 == 1;
    int v22 = *(_DWORD *)(a2 + 60);
    if (v21) {
      ++v22;
    }
    size_t v23 = v20 * (v22 >> v21);
    int v24 = *(_DWORD *)(v10 + 40);
    if ((v23 & 0x8000000000000000) != 0)
    {
      if (!v24) {
        memcpy((void *)(*(void *)(a2 + 24) + v23 - v20), (const void *)(*(void *)(a3 + 24) + v23 - v20), -(uint64_t)v23);
      }
      if (*(_DWORD *)(v10 + 44)) {
        return;
      }
      unsigned int v25 = (void *)(*(void *)(a2 + 32) + v23 - v20);
      int v26 = (const void *)(*(void *)(a3 + 32) + v23 - v20);
      size_t v27 = -(uint64_t)v23;
    }
    else
    {
      if (!v24) {
        memcpy(*(void **)(a2 + 24), *(const void **)(a3 + 24), v23);
      }
      if (*(_DWORD *)(v10 + 44)) {
        return;
      }
      unsigned int v25 = *(void **)(a2 + 32);
      int v26 = *(const void **)(a3 + 32);
      size_t v27 = v23;
    }
    memcpy(v25, v26, v27);
  }
}

void sub_224AFFDE8(char a1, unsigned __int8 *a2, int a3, char *__b)
{
  int v5 = 1 << a1;
  if (a3)
  {
    char v8 = a1 - 8;
    memset(__b, a2[1], *a2 << (a1 - 8));
    uint64_t v9 = (a3 - 1);
    if (a3 >= 2)
    {
      uint64_t v10 = 0;
      do
      {
        int v11 = 0;
        int v12 = &a2[2 * v10];
        int v13 = *v12;
        int v14 = v12[1];
        ++v10;
        uint64_t v15 = &a2[2 * v10];
        unsigned int v16 = *v15 - v13;
        unsigned int v17 = (v15[1] - v14) * (((v16 >> 1) + 0x10000) / v16);
        uint32x2_t v18 = (uint32x2_t)vdup_n_s32(v16 - 1);
        int v19 = (v16 + 1) & 0x7FFFFFFE;
        int32x2_t v20 = (int32x2_t)0x100000000;
        do
        {
          int v21 = v11 * v17 + 0x8000;
          uint32x2_t v22 = vcge_u32(v18, (uint32x2_t)v20);
          if (v22.i8[0]) {
            __b[v13 << v8] = v14 + BYTE2(v21);
          }
          if (v22.i8[4]) {
            __b[(v13 + 1) << v8] = v14 + ((v21 + v17) >> 16);
          }
          v11 += 2;
          int32x2_t v20 = vadd_s32(v20, (int32x2_t)0x200000002);
          v13 += 2;
          v19 -= 2;
        }
        while (v19);
      }
      while (v10 != v9);
    }
    memset(&__b[a2[2 * (int)v9] << v8], a2[2 * (int)v9 + 1], v5 - (a2[2 * (int)v9] << v8));
    if (a3 >= 2)
    {
      uint64_t v23 = 0;
      uint64_t v24 = (1 << v8);
      uint64_t v25 = (int)v24;
      uint64_t v26 = v24 & 0xFFFFFFFE;
      uint64x2_t v27 = (uint64x2_t)vdupq_n_s64(v24 - 2);
      int32x2_t v28 = vdup_n_s32((int)v24 >> 1);
      do
      {
        int v29 = a2[2 * v23++];
        uint64_t v30 = (a2[2 * v23] - v29) << v8;
        if ((int)v30 >= 1)
        {
          uint64_t v31 = 0;
          uint64_t v32 = v29 << v8;
          __int16 v33 = &__b[v32];
          do
          {
            if ((int)v25 >= 2)
            {
              unint64_t v34 = 0;
              int v35 = __b[v31 + v32];
              unsigned int v36 = __b[v31 + v32 + v25] - v35;
              int32x2_t v37 = vdup_n_s32(v36);
              v38.i32[1] = v37.i32[1];
              v38.i32[0] = 0;
              int32x2_t v39 = vadd_s32(v28, v38);
              int32x2_t v40 = vdup_n_s32(2 * v36);
              do
              {
                int32x2_t v41 = vmovn_s64((int64x2_t)vcgeq_u64(v27, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v34), (int8x16_t)xmmword_224B15990)));
                int32x2_t v42 = vadd_s32(v39, v37);
                if (v41.i8[0]) {
                  v33[v34 + 1] = v35 + (v42.i32[0] >> v8);
                }
                if (v41.i8[4]) {
                  v33[v34 + 2] = v35 + (v42.i32[1] >> v8);
                }
                v34 += 2;
                int32x2_t v39 = vadd_s32(v39, v40);
              }
              while (v26 != v34);
            }
            v31 += v25;
            v33 += v25;
          }
          while (v31 < v30);
        }
      }
      while (v23 != v9);
    }
  }
  else
  {
    bzero(__b, v5);
  }
}

uint64_t sub_224B00068(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v7 = a5;
  int v11 = *(_DWORD *)(a3 + 64);
  int v12 = v11 != 3;
  if (v11 == 3) {
    int v13 = *(_DWORD *)(a2 + 56);
  }
  else {
    int v13 = *(_DWORD *)(a2 + 56) + 1;
  }
  int v14 = *(_DWORD **)(a2 + 8);
  BOOL v37 = *(_DWORD *)(*(void *)a2 + 24) == 0;
  uint64_t v15 = 32 * a6;
  uint64_t v16 = *(void *)(a3 + 16) + 2 * (*(void *)(a3 + 40) >> 1) * v15;
  int v17 = ~(-1 << *(_DWORD *)(a2 + 68));
  uint64_t v42 = v16;
  int v41 = v17;
  uint64_t v38 = result;
  if (v14[1])
  {
    int v39 = v13;
    HIDWORD(v36) = ~(-1 << *(_DWORD *)(a2 + 68));
    double result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 32))(*(void *)(a2 + 16) + 2 * (*(void *)(a2 + 40) >> 1) * v15, v16);
    int v13 = v39;
    uint64_t v7 = a5;
    int v12 = v11 != 3;
    int v17 = v41;
    uint64_t v16 = v42;
  }
  uint64_t v19 = a4;
  uint64_t v40 = v7;
  int v20 = a6;
  if (v14[10] || v14[11] || v14[9])
  {
    int v21 = v13 >> v12;
    uint64_t v22 = *(int *)(a2 + 56);
    int v23 = *(_DWORD *)(a2 + 60) - v15;
    if (v23 >= 32) {
      int v23 = 32;
    }
    uint64_t v24 = ((v23 + (v11 == 1)) >> (v11 == 1));
    if ((v22 & v12) != 0 && (int)v24 > 0)
    {
      char v25 = v11 == 1;
      uint64_t v26 = 2 * (*(void *)(a3 + 40) >> 1 << (v11 == 1));
      uint64_t v27 = v16;
      int v28 = v24;
      do
      {
        *(_WORD *)(v27 + 2 * v22) = *(_WORD *)(v27 + 2 * ((int)v22 - 1));
        v27 += v26;
        --v28;
      }
      while (v28);
    }
    else
    {
      char v25 = v11 == 1;
    }
    uint64_t v29 = ((*(uint64_t *)(a2 + 48) >> 1) * v15) >> v25;
    uint64_t v30 = v21;
    if (v14[9])
    {
      uint64_t v31 = 0;
      char v32 = 1;
      do
      {
        char v33 = v32;
        LODWORD(v36) = a6;
        double result = (*(uint64_t (**)(uint64_t, uint64_t, void, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, unint64_t, int))(v38 + 8 * (*(_DWORD *)(a3 + 64) - 1) + 40))(*(void *)(a2 + 8 * (v31 + 1) + 16) + 2 * v29, *(void *)(a3 + 8 * (v31 + 1) + 16) + 2 * v29, *(void *)(a3 + 48), v14, v30, v19, v40 + 12136 * (v31 + 1), v24, v36, v16, *(void *)(a3 + 40), __PAIR64__(v37, v31), v17);
        int v17 = v41;
        uint64_t v16 = v42;
        char v32 = 0;
        uint64_t v31 = 1;
      }
      while ((v33 & 1) != 0);
    }
    else
    {
      uint64_t v34 = 0;
      do
      {
        while (1)
        {
          uint64_t v35 = v34;
          if (!v14[v34 + 10]) {
            break;
          }
          ++v34;
          LODWORD(v36) = v20;
          double result = (*(uint64_t (**)(uint64_t, uint64_t, void, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, unint64_t, int))(v38 + 8 * (*(_DWORD *)(a3 + 64) - 1) + 40))(*(void *)(a2 + 8 * (v35 + 1) + 16) + 2 * v29, *(void *)(a3 + 8 * (v35 + 1) + 16) + 2 * v29, *(void *)(a3 + 48), v14, v30, v19 + ((v35 + 1) << 12), v40 + 12136 * (v35 + 1), v24, v36, v16, *(void *)(a3 + 40), __PAIR64__(v37, v35), v17);
          int v17 = v41;
          uint64_t v16 = v42;
          if (v35) {
            return result;
          }
        }
        ++v34;
      }
      while (!v35);
    }
  }
  return result;
}

uint16x8_t *sub_224B00370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v9 = (uint16x8_t *)MEMORY[0x270FA5388]();
  char v19 = v16;
  uint64_t v20 = v15;
  int v21 = v14;
  uint64_t v22 = v13;
  uint64_t v123 = v12;
  int64_t v124 = v10;
  int v23 = v11;
  uint64_t v24 = (uint64_t)v9;
  uint64_t v25 = 0;
  unsigned int v26 = a9;
  v161[1009] = *MEMORY[0x263EF8340];
  unsigned int v125 = v9;
  uint64_t v156 = 0;
  long long v155 = 0u;
  long long v154 = 0u;
  uint64_t v152 = 0;
  long long v151 = 0u;
  long long v150 = 0u;
  uint64_t v27 = &v160;
  int v28 = v161;
  do
  {
    *(void *)((char *)&v154 + v25) = v28;
    *(void *)((char *)&v150 + v25) = v27;
    v25 += 8;
    v27 += 100;
    v28 += 200;
  }
  while (v25 != 40);
  uint64_t v29 = 0;
  unsigned int v146 = 0;
  unsigned int v145 = 0;
  unsigned int v147 = 0;
  unsigned int v143 = 0;
  unsigned int v142 = 0;
  unsigned int v144 = 0;
  unsigned int v140 = 0;
  unsigned int v139 = 0;
  int v141 = 0;
  uint64_t v30 = (int16x8_t *)&v148;
  uint64_t v137 = 0;
  uint64_t v136 = 0;
  uint64_t v31 = (uint32x4_t *)&v149;
  uint64_t v138 = 0;
  do
  {
    *(uint32x4_t **)((char *)&v142 + v29) = v31;
    *(int16x8_t **)((char *)&v136 + v29) = v30;
    v29 += 8;
    v30 += 50;
    v31 += 100;
  }
  while (v29 != 24);
  uint64_t v32 = 0;
  v131.i64[0] = (uint64_t)&v134;
  v131.i64[1] = (uint64_t)&v135;
  v130.i64[0] = (uint64_t)&v132;
  v130.i64[1] = (uint64_t)&v133;
  memset(v127, 0, sizeof(v127));
  char v33 = &v128;
  uint64_t v34 = &v129;
  memset(v126, 0, sizeof(v126));
  do
  {
    *(void *)((char *)v127 + v32) = v34;
    *(void *)((char *)v126 + v32) = v33;
    v32 += 8;
    v33 += 800;
    v34 += 1600;
  }
  while (v32 != 32);
  long long v159 = 0uLL;
  uint64_t v158 = 0;
  memset(v153, 0, 40);
  v157[0] = v154;
  v157[1] = v154;
  if ((v16 & 4) == 0)
  {
    uint64_t v158 = v154;
    *(void *)&long long v159 = v154;
    *((void *)&v159 + 1) = v154;
    v153[0] = v150;
    v153[1] = v150;
    v153[2] = v150;
    v153[3] = v150;
    v153[4] = v150;
    unsigned int v145 = v142;
    unsigned int v146 = v142;
    unsigned int v147 = v142;
    unsigned int v139 = v136;
    unsigned int v140 = v136;
    int v141 = v136;
    sub_224A77BA8(v142, v136, (uint32x4_t *)v154, (int16x8_t *)v150, v11, (uint64_t)v9, v13, v16, 0.0, v17, v18);
    sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v22, *(_DWORD *)(v20 + 4), a9);
    uint64_t v37 = *(void *)&v127[0];
    uint64_t v38 = *(void *)&v126[0];
    v127[0] = *(_OWORD *)((char *)v127 + 8);
    double v39 = *((double *)v126 + 1);
    v126[0] = *(_OWORD *)((char *)v126 + 8);
    *(void *)&v127[1] = *((void *)&v127[1] + 1);
    *((void *)&v127[1] + 1) = v37;
    *(void *)&v126[1] = *((void *)&v126[1] + 1);
    *((void *)&v126[1] + 1) = v38;
    if (v21 >= 2)
    {
      uint64_t v40 = v24 + 2 * (v124 >> 1);
      *((void *)&v159 + 1) = *((void *)&v154 + 1);
      v153[4] = *((void *)&v150 + 1);
      unsigned int v147 = v143;
      int v141 = v137;
      sub_224A77BA8(v143, v137, *((uint32x4_t **)&v154 + 1), *((int16x8_t **)&v150 + 1), v23 + 1, v40, v22, v19, v39, v35, v36);
      sub_224B010E4((uint64_t)v157, (uint64_t)v153, (int32x4_t *)v131.i64[1], (int16x8_t *)v130.i64[1], v22, *(_DWORD *)v20, a9);
      int8x16_t v130 = vextq_s8(v130, v130, 8uLL);
      int8x16_t v131 = vextq_s8(v131, v131, 8uLL);
      sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v22, *(_DWORD *)(v20 + 4), a9);
      uint64_t v43 = *(void *)&v127[0];
      uint64_t v44 = *(void *)&v126[0];
      v127[0] = *(_OWORD *)((char *)v127 + 8);
      double v45 = *((double *)v126 + 1);
      v126[0] = *(_OWORD *)((char *)v126 + 8);
      *(void *)&v127[1] = *((void *)&v127[1] + 1);
      *((void *)&v127[1] + 1) = v43;
      *(void *)&v126[1] = *((void *)&v126[1] + 1);
      *((void *)&v126[1] + 1) = v44;
      if (v21 != 2)
      {
        char v46 = v23;
        uint64_t v116 = v124 >> 1;
        uint64_t v47 = v40 + 2 * (v124 >> 1);
        uint64_t v48 = v23 + 2;
        int v120 = (uint32x4_t *)*((void *)&v155 + 1);
        long long v159 = v155;
        uint64_t v49 = v22;
        unsigned int v50 = v21;
        BOOL v51 = (int16x8_t *)*((void *)&v151 + 1);
        *(_OWORD *)&v153[3] = v151;
        unsigned int v147 = v144;
        int v141 = v138;
        uint64_t v52 = v47;
        sub_224A77BA8(v144, v138, (uint32x4_t *)v155, (int16x8_t *)v151, v48, v47, v49, v19, v45, v41, v42);
        sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v49, *(_DWORD *)(v20 + 4), a9);
        uint64_t v55 = *(void *)&v127[0];
        uint64_t v56 = *(void *)&v126[0];
        unsigned int v57 = v50;
        v127[0] = *(_OWORD *)((char *)v127 + 8);
        double v58 = *((double *)v126 + 1);
        v126[0] = *(_OWORD *)((char *)v126 + 8);
        *(void *)&v127[1] = *((void *)&v127[1] + 1);
        *((void *)&v127[1] + 1) = v55;
        *(void *)&v126[1] = *((void *)&v126[1] + 1);
        *((void *)&v126[1] + 1) = v56;
        BOOL v59 = v50 >= 4;
        uint64_t v60 = v20;
        if (!v59)
        {
LABEL_11:
          *((void *)&v159 + 1) = v159;
          v153[4] = v153[3];
          unsigned int v147 = v146;
          int v141 = v140;
          sub_224B010E4((uint64_t)v157, (uint64_t)v153, (int32x4_t *)v131.i64[1], (int16x8_t *)v130.i64[1], v49, *(_DWORD *)v60, v26);
          sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v49, *(_DWORD *)(v60 + 4), v26);
          sub_224B0114C(&v125, v124, v131.i64, v130.i64, (uint64_t *)v127, (uint64_t *)v126, v49, 2u, *(_WORD *)(v60 + 8), *(__int16 *)(v60 + 8) >> 15, *(_WORD *)(v60 + 10), v26);
          uint64_t v20 = v60;
          uint64_t v22 = v49;
LABEL_14:
          *(void *)&long long v159 = v158;
          *((void *)&v159 + 1) = v158;
          v153[3] = v153[2];
          v153[4] = v153[2];
          unsigned int v147 = v146;
          int v141 = v140;
          sub_224B010E4((uint64_t)v157, (uint64_t)v153, (int32x4_t *)v131.i64[1], (int16x8_t *)v130.i64[1], v22, *(_DWORD *)v20, v26);
          sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v22, *(_DWORD *)(v20 + 4), v26);
          uint64_t v85 = *(void *)&v127[0];
          uint64_t v86 = *(void *)&v126[0];
          v127[0] = *(_OWORD *)((char *)v127 + 8);
          v126[0] = *(_OWORD *)((char *)v126 + 8);
          *(void *)&v127[1] = *((void *)&v127[1] + 1);
          *((void *)&v127[1] + 1) = v85;
          unsigned int v87 = 1;
          *(void *)&v126[1] = *((void *)&v126[1] + 1);
          *((void *)&v126[1] + 1) = v86;
          return sub_224B0114C(&v125, v124, v131.i64, v130.i64, (uint64_t *)v127, (uint64_t *)v126, v22, v87, *(_WORD *)(v20 + 8), *(__int16 *)(v20 + 8) >> 15, *(_WORD *)(v20 + 10), v26);
        }
        uint64_t v110 = v52;
        sub_224A77BA8(v147, v141, v120, v51, v46 + 3, v52 + 2 * v116, v49, v19, v58, v53, v54);
        sub_224B010E4((uint64_t)v157, (uint64_t)v153, (int32x4_t *)v131.i64[1], (int16x8_t *)v130.i64[1], v49, *(_DWORD *)v20, a9);
        sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v49, *(_DWORD *)(v20 + 4), a9);
        sub_224B0114C(&v125, v124, v131.i64, v130.i64, (uint64_t *)v127, (uint64_t *)v126, v49, 2u, *(_WORD *)(v20 + 8), *(__int16 *)(v20 + 8) >> 15, *(_WORD *)(v20 + 10), a9);
        uint64_t v22 = v49;
        if (v57 != 4)
        {
          unsigned int v70 = v57;
          int v23 = v46;
          unsigned int v115 = v22;
          uint64_t v114 = v20;
          char v117 = v19;
          int v93 = -4;
          uint64_t v94 = 4;
LABEL_19:
          uint64_t v95 = (v124 & 0x7FFFFFFFFFFFFFFELL) + (v124 >> 1);
          uint64_t v113 = v123 + 4 * v95;
          int v96 = &v23[v94];
          *(void *)&long long v159 = v156;
          v153[3] = v152;
          uint64_t v119 = 2 * v95;
          uint64_t v122 = 4 * v116;
          uint64_t v60 = v114;
          uint64_t v49 = v115;
          uint64_t v97 = v110;
          while (1)
          {
            sub_224A77BA8(v147, v141, (uint32x4_t *)v159, (int16x8_t *)v153[3], v96, v97 + v122, v115, v117, v92, v88, v89);
            sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v115, *(_DWORD *)(v114 + 4), a9);
            uint64_t v100 = *(void *)&v127[0];
            uint64_t v101 = *(void *)&v126[0];
            v127[0] = *(_OWORD *)((char *)v127 + 8);
            double v102 = *((double *)v126 + 1);
            v126[0] = *(_OWORD *)((char *)v126 + 8);
            *(void *)&v127[1] = *((void *)&v127[1] + 1);
            *((void *)&v127[1] + 1) = v100;
            *(void *)&v126[1] = *((void *)&v126[1] + 1);
            *((void *)&v126[1] + 1) = v101;
            unsigned int v26 = a9;
            if (v70 + v93 < 2) {
              goto LABEL_11;
            }
            sub_224A77BA8(v147, v141, *((uint32x4_t **)&v159 + 1), (int16x8_t *)v153[4], v96 + 1, v97 + v119, v115, v117, v102, v98, v99);
            sub_224B010E4((uint64_t)v157, (uint64_t)v153, (int32x4_t *)v131.i64[1], (int16x8_t *)v130.i64[1], v115, *(_DWORD *)v114, a9);
            sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v115, *(_DWORD *)(v114 + 4), a9);
            sub_224B0114C(&v125, v124, v131.i64, v130.i64, (uint64_t *)v127, (uint64_t *)v126, v115, 2u, *(_WORD *)(v114 + 8), *(__int16 *)(v114 + 8) >> 15, *(_WORD *)(v114 + 10), a9);
            v93 -= 2;
            v96 += 2;
            v97 += v122;
            if (!(v70 + v93))
            {
              uint64_t v20 = v114;
              uint64_t v22 = v115;
              if ((v117 & 8) == 0) {
                goto LABEL_23;
              }
              sub_224A77BA8(v147, v141, (uint32x4_t *)v159, (int16x8_t *)v153[3], 0, v113, v115, v117, v92, v88, v89);
              sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v115, *(_DWORD *)(v114 + 4), a9);
              uint64_t v106 = *(void *)&v127[0];
              uint64_t v107 = *(void *)&v126[0];
              v127[0] = *(_OWORD *)((char *)v127 + 8);
              v126[0] = *(_OWORD *)((char *)v126 + 8);
              *(void *)&v127[1] = *((void *)&v127[1] + 1);
              *((void *)&v127[1] + 1) = v106;
              *(void *)&v126[1] = *((void *)&v126[1] + 1);
              *((void *)&v126[1] + 1) = v107;
              sub_224A77BA8(v147, v141, *((uint32x4_t **)&v159 + 1), (int16x8_t *)v153[4], 0, v113 + 2 * v116, v115, v117, *(double *)v126, v108, v109);
              goto LABEL_24;
            }
          }
        }
      }
      goto LABEL_23;
    }
LABEL_13:
    *((void *)&v159 + 1) = v159;
    v153[4] = v153[3];
    unsigned int v147 = v146;
    int v141 = v140;
    sub_224B010E4((uint64_t)v157, (uint64_t)v153, (int32x4_t *)v131.i64[1], (int16x8_t *)v130.i64[1], v22, *(_DWORD *)v20, v26);
    int8x16_t v130 = vextq_s8(v130, v130, 8uLL);
    int8x16_t v131 = vextq_s8(v131, v131, 8uLL);
    sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v22, *(_DWORD *)(v20 + 4), v26);
    uint64_t v83 = *(void *)&v127[0];
    uint64_t v84 = *(void *)&v126[0];
    v127[0] = *(_OWORD *)((char *)v127 + 8);
    v126[0] = *(_OWORD *)((char *)v126 + 8);
    *(void *)&v127[1] = *((void *)&v127[1] + 1);
    *((void *)&v127[1] + 1) = v83;
    *(void *)&v126[1] = *((void *)&v126[1] + 1);
    *((void *)&v126[1] + 1) = v84;
    goto LABEL_14;
  }
  unsigned int v115 = v13;
  int v61 = (uint32x4_t *)*((void *)&v154 + 1);
  unsigned int v118 = (uint32x4_t *)v155;
  uint64_t v158 = *((void *)&v154 + 1);
  unsigned int v112 = (uint32x4_t *)*((void *)&v155 + 1);
  long long v159 = v155;
  uint64_t v114 = v15;
  int v121 = v14;
  unsigned int v62 = (int16x8_t *)*((void *)&v150 + 1);
  v153[0] = v150;
  *(_OWORD *)&v153[1] = v150;
  int v111 = (int16x8_t *)*((void *)&v151 + 1);
  signed int v63 = (int16x8_t *)v151;
  *(_OWORD *)&v153[3] = v151;
  uint64_t v116 = v10 >> 1;
  int v64 = v143;
  unsigned int v145 = v142;
  unsigned int v146 = v143;
  char v117 = v16;
  int v65 = v144;
  unsigned int v147 = v144;
  int v66 = v137;
  unsigned int v139 = v136;
  unsigned int v140 = v137;
  int v67 = v138;
  int v141 = v138;
  sub_224A77BA8(v142, v136, (uint32x4_t *)v154, (int16x8_t *)v150, 0, v12, v13, v16, 0.0, v17, v18);
  int v68 = v61;
  uint64_t v22 = v115;
  int v69 = v62;
  unsigned int v70 = v121;
  uint64_t v20 = v114;
  sub_224A77BA8(v64, v66, v68, v69, 0, v123 + 2 * (v124 >> 1), v115, v117, v71, v72, v73);
  int v74 = v63;
  unsigned int v26 = a9;
  sub_224A77BA8(v65, v67, v118, v74, v23, v24, v115, v117, v75, v76, v77);
  sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v115, *(_DWORD *)(v114 + 4), a9);
  uint64_t v80 = *(void *)&v127[0];
  uint64_t v81 = *(void *)&v126[0];
  v127[0] = *(_OWORD *)((char *)v127 + 8);
  double v82 = *((double *)v126 + 1);
  v126[0] = *(_OWORD *)((char *)v126 + 8);
  *(void *)&v127[1] = *((void *)&v127[1] + 1);
  *((void *)&v127[1] + 1) = v80;
  *(void *)&v126[1] = *((void *)&v126[1] + 1);
  *((void *)&v126[1] + 1) = v81;
  if (v121 < 2) {
    goto LABEL_13;
  }
  uint64_t v110 = v24;
  sub_224A77BA8(v147, v141, v112, v111, v23 + 1, v24 + 2 * (v124 >> 1), v115, v117, v82, v78, v79);
  sub_224B010E4((uint64_t)v157, (uint64_t)v153, (int32x4_t *)v131.i64[1], (int16x8_t *)v130.i64[1], v115, *(_DWORD *)v114, a9);
  int8x16_t v130 = vextq_s8(v130, v130, 8uLL);
  int8x16_t v131 = vextq_s8(v131, v131, 8uLL);
  sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v115, *(_DWORD *)(v114 + 4), a9);
  uint64_t v90 = *(void *)&v127[0];
  uint64_t v91 = *(void *)&v126[0];
  v127[0] = *(_OWORD *)((char *)v127 + 8);
  double v92 = *((double *)v126 + 1);
  v126[0] = *(_OWORD *)((char *)v126 + 8);
  *(void *)&v127[1] = *((void *)&v127[1] + 1);
  *((void *)&v127[1] + 1) = v90;
  *(void *)&v126[1] = *((void *)&v126[1] + 1);
  *((void *)&v126[1] + 1) = v91;
  if (v121 != 2)
  {
    int v93 = -2;
    uint64_t v94 = 2;
    goto LABEL_19;
  }
LABEL_23:
  *(void *)&long long v159 = v158;
  *((void *)&v159 + 1) = v158;
  v153[3] = v153[2];
  v153[4] = v153[2];
  unsigned int v147 = v146;
  int v141 = v140;
  sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v22, *(_DWORD *)(v20 + 4), v26);
  uint64_t v103 = *(void *)&v127[0];
  uint64_t v104 = *(void *)&v126[0];
  v127[0] = *(_OWORD *)((char *)v127 + 8);
  v126[0] = *(_OWORD *)((char *)v126 + 8);
  *(void *)&v127[1] = *((void *)&v127[1] + 1);
  *((void *)&v127[1] + 1) = v103;
  *(void *)&v126[1] = *((void *)&v126[1] + 1);
  *((void *)&v126[1] + 1) = v104;
  unsigned int v147 = v146;
  int v141 = v140;
LABEL_24:
  sub_224B010E4((uint64_t)v157, (uint64_t)v153, (int32x4_t *)v131.i64[1], (int16x8_t *)v130.i64[1], v22, *(_DWORD *)v20, v26);
  sub_224B01084((uint64_t)&v145, (uint64_t)&v139, *((int32x4_t **)&v127[1] + 1), *((int16x8_t **)&v126[1] + 1), v22, *(_DWORD *)(v20 + 4), v26);
  unsigned int v87 = 2;
  return sub_224B0114C(&v125, v124, v131.i64, v130.i64, (uint64_t *)v127, (uint64_t *)v126, v22, v87, *(_WORD *)(v20 + 8), *(__int16 *)(v20 + 8) >> 15, *(_WORD *)(v20 + 10), v26);
}

int32x4_t *sub_224B01084(uint64_t a1, uint64_t a2, int32x4_t *a3, int16x8_t *a4, int a5, unsigned int a6, unsigned int a7)
{
  double result = sub_224AAD690((int32x4_t **)a1, (int16x8_t **)a2, a3, a4, a5, a6, a7);
  uint64_t v10 = 0;
  int v11 = *(int32x4_t **)a1;
  uint64_t v12 = *(int16x8_t **)a2;
  do
  {
    *(void *)(a1 + v10) = *(void *)(a1 + v10 + 8);
    *(void *)(a2 + v10) = *(void *)(a2 + v10 + 8);
    v10 += 8;
  }
  while (v10 != 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(a2 + 16) = v12;
  return result;
}

int32x4_t *sub_224B010E4(uint64_t a1, uint64_t a2, int32x4_t *a3, int16x8_t *a4, int a5, unsigned int a6, unsigned int a7)
{
  double result = sub_224AAD7F4((int32x4_t **)a1, (int16x8_t **)a2, a3, a4, a5, a6, a7);
  uint64_t v10 = 0;
  int v11 = *(int32x4_t **)a1;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(int16x8_t **)a2;
  uint64_t v14 = *(void *)(a2 + 8);
  do
  {
    *(void *)(a1 + v10) = *(void *)(a1 + v10 + 16);
    *(void *)(a2 + v10) = *(void *)(a2 + v10 + 16);
    v10 += 8;
  }
  while (v10 != 24);
  *(void *)(a1 + 24) = v11;
  *(void *)(a2 + 24) = v13;
  *(void *)(a1 + 32) = v12;
  *(void *)(a2 + 32) = v14;
  return result;
}

uint16x8_t *sub_224B0114C(uint16x8_t **a1, unint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t a7, unsigned int a8, __int16 a9, __int16 a10, __int16 a11, unsigned int a12)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  sub_224A7802C(v28, *a1, a2, a3, a4, a7, a8);
  sub_224A77CA0(v27, *a1, a2, a5, a6, a7, a8);
  v26[0] = a9;
  v26[1] = a11;
  double result = sub_224A78304(*a1, a2, (int16x8_t *)*a1, a2, v28, v27, a7, a8, v26, a12);
  uint64_t v21 = 0;
  *a1 = (uint16x8_t *)((char *)*a1 + 2 * (a2 >> 1) * a8);
  uint64_t v22 = *a4;
  uint64_t v23 = *a3;
  *a3 = a3[1];
  *a4 = a4[1];
  a3[1] = v23;
  a4[1] = v22;
  uint64_t v24 = *a5;
  uint64_t v25 = *a6;
  do
  {
    a5[v21] = a5[v21 + 1];
    a6[v21] = a6[v21 + 1];
    ++v21;
  }
  while (v21 != 3);
  a5[3] = v24;
  a6[3] = v25;
  return result;
}

uint16x4_t *sub_224B012D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v9 = (uint16x4_t *)MEMORY[0x270FA5388]();
  char v18 = v14;
  uint64_t v20 = v19;
  int v22 = v21;
  int v23 = v13;
  uint64_t v24 = v12;
  uint64_t v25 = v11;
  unsigned int v26 = v9;
  uint64_t v27 = 0;
  unsigned int v28 = a9;
  v109[609] = *MEMORY[0x263EF8340];
  uint64_t v95 = v9;
  long long v105 = 0uLL;
  uint64_t v104 = 0;
  long long v101 = 0uLL;
  uint64_t v100 = 0;
  uint64_t v29 = (int16x8_t *)&v108;
  uint64_t v30 = (uint32x4_t *)v109;
  do
  {
    *(uint32x4_t **)((char *)&v104 + v27) = v30;
    *(int16x8_t **)((char *)&v100 + v27) = v29;
    v27 += 8;
    v29 += 50;
    v30 += 100;
  }
  while (v27 != 24);
  uint64_t v31 = 0;
  memset(v97, 0, 24);
  uint64_t v32 = &v98;
  memset(v96, 0, 24);
  char v33 = &v99;
  do
  {
    *(void *)((char *)v97 + v31) = v33;
    *(void *)((char *)v96 + v31) = v32;
    v31 += 8;
    v32 += 800;
    v33 += 1600;
  }
  while (v31 != 24);
  double v102 = 0;
  long long v103 = 0uLL;
  uint64_t v88 = v12;
  uint64_t v90 = v10;
  uint64_t v34 = v10 >> 1;
  long long v107 = 0uLL;
  uint64_t v106 = v104;
  if ((v14 & 4) != 0)
  {
    uint64_t v94 = (uint32x4_t *)v105;
    long long v107 = v105;
    double v102 = v100;
    double v92 = (int16x8_t *)v101;
    long long v103 = v101;
    sub_224A779EC(v104, v100, 0, v12, v13, v14, *(double *)&v101, v16, v17);
    sub_224A779EC(v94, v92, 0, v24 + 2 * v34, v23, v18, *(double *)&v92, v52, v53);
    int8x16_t v54 = *(int32x4_t **)&v97[1];
    uint64_t v55 = *(int16x8_t **)&v96[1];
    uint64_t v56 = (uint64_t)v26;
    int v41 = v22;
    uint64_t v51 = v34;
    unsigned int v57 = *(_DWORD *)(v20 + 4);
    uint64_t v91 = v56;
    sub_224A779EC(*((uint32x4_t **)&v107 + 1), *((int16x8_t **)&v103 + 1), v25, v56, v23, v18, v58, v59, v60);
    sub_224B01084((uint64_t)&v106, (uint64_t)&v102, v54, v55, v23, v57, a9);
    uint64_t v37 = *(int32x4_t **)&v97[0];
    uint64_t v38 = *(int16x8_t **)&v96[0];
    v97[0] = *(_OWORD *)((char *)v97 + 8);
    double v63 = *((double *)v96 + 1);
    v96[0] = *(_OWORD *)((char *)v96 + 8);
    *(void *)&v97[1] = v37;
    *(void *)&v96[1] = v38;
    if (v41 >= 2)
    {
      uint64_t v87 = v20;
      unsigned int v67 = *(_DWORD *)(v20 + 4);
      char v93 = v18;
      sub_224A779EC(*((uint32x4_t **)&v107 + 1), *((int16x8_t **)&v103 + 1), v25 + 1, v91 + 2 * v51, v23, v18, v63, v61, v62);
      unsigned int v68 = v67;
      unsigned int v45 = a9;
      sub_224B01084((uint64_t)&v106, (uint64_t)&v102, v37, v38, v23, v68, a9);
      uint64_t v48 = *(int32x4_t **)&v97[0];
      uint64_t v49 = *(int16x8_t **)&v96[0];
      v97[0] = *(_OWORD *)((char *)v97 + 8);
      double v50 = *((double *)v96 + 1);
      v96[0] = *(_OWORD *)((char *)v96 + 8);
      *(void *)&v97[1] = v48;
      *(void *)&v96[1] = v49;
      if (v41 != 2)
      {
LABEL_13:
        uint64_t v89 = v88 + 12 * v51;
        int v69 = v25 + 2;
        unsigned int v70 = v41 - 1;
        uint64_t v71 = v91 + 4 * v51;
        unsigned int v72 = v45;
        do
        {
          int8x16_t v73 = *(int32x4_t **)&v97[1];
          int v74 = *(int16x8_t **)&v96[1];
          unsigned int v75 = *(_DWORD *)(v87 + 4);
          sub_224A779EC(*((uint32x4_t **)&v107 + 1), *((int16x8_t **)&v103 + 1), v69, v71, v23, v93, v50, v46, v47);
          sub_224B01084((uint64_t)&v106, (uint64_t)&v102, v73, v74, v23, v75, v72);
          ++v69;
          sub_224B019BC(&v95, v90, (uint64_t *)v97, (uint64_t *)v96, v23, *(__int16 *)(v87 + 10), v72);
          --v70;
          v71 += 2 * v51;
        }
        while (v70 > 1);
        uint64_t v66 = v90;
        uint64_t v48 = *(int32x4_t **)&v97[1];
        uint64_t v49 = *(int16x8_t **)&v96[1];
        if ((v93 & 8) != 0)
        {
          uint64_t v20 = v87;
          unsigned int v79 = *(_DWORD *)(v87 + 4);
          sub_224A779EC(*((uint32x4_t **)&v107 + 1), *((int16x8_t **)&v103 + 1), 0, v89, v23, v93, v50, v46, v47);
          unsigned int v28 = v72;
          sub_224B01084((uint64_t)&v106, (uint64_t)&v102, v48, v49, v23, v79, v72);
          sub_224B019BC(&v95, v90, (uint64_t *)v97, (uint64_t *)v96, v23, *(__int16 *)(v87 + 10), v72);
          uint64_t v80 = *(int32x4_t **)&v97[1];
          uint64_t v81 = *(int16x8_t **)&v96[1];
          unsigned int v82 = *(_DWORD *)(v87 + 4);
          sub_224A779EC(*((uint32x4_t **)&v107 + 1), *((int16x8_t **)&v103 + 1), 0, v89 + 2 * v51, v23, v93, v83, v84, v85);
          int v64 = v80;
          int v65 = v81;
          int v77 = v23;
          unsigned int v76 = v82;
          goto LABEL_19;
        }
        unsigned int v28 = v72;
        uint64_t v20 = v87;
        goto LABEL_17;
      }
LABEL_12:
      uint64_t v66 = v90;
      unsigned int v28 = v45;
      uint64_t v20 = v87;
LABEL_17:
      *((void *)&v107 + 1) = v107;
      *((void *)&v103 + 1) = v103;
      sub_224B01084((uint64_t)&v106, (uint64_t)&v102, v48, v49, v23, *(_DWORD *)(v20 + 4), v28);
      sub_224B019BC(&v95, v66, (uint64_t *)v97, (uint64_t *)v96, v23, *(__int16 *)(v20 + 10), v28);
      int v64 = *(int32x4_t **)&v97[1];
      int v65 = *(int16x8_t **)&v96[1];
      goto LABEL_18;
    }
  }
  else
  {
    *(void *)&long long v107 = v104;
    *((void *)&v107 + 1) = v104;
    double v102 = v100;
    *(void *)&long long v103 = v100;
    *((void *)&v103 + 1) = v100;
    sub_224A779EC(v104, v100, v11, (uint64_t)v9, v13, v14, v15, v16, v17);
    sub_224B01084((uint64_t)&v106, (uint64_t)&v102, *(int32x4_t **)&v97[1], *(int16x8_t **)&v96[1], v23, *(_DWORD *)(v20 + 4), a9);
    uint64_t v37 = *(int32x4_t **)&v97[0];
    uint64_t v38 = *(int16x8_t **)&v96[0];
    v97[0] = *(_OWORD *)((char *)v97 + 8);
    double v39 = *((double *)v96 + 1);
    v96[0] = *(_OWORD *)((char *)v96 + 8);
    *(void *)&v97[1] = v37;
    *(void *)&v96[1] = v38;
    if (v22 >= 2)
    {
      uint64_t v40 = v26;
      int v41 = v22;
      uint64_t v86 = v34;
      uint64_t v87 = v20;
      uint64_t v91 = (uint64_t)v40;
      uint64_t v42 = (uint64_t)v40 + 2 * v34;
      *((void *)&v107 + 1) = v105;
      *((void *)&v103 + 1) = v101;
      unsigned int v43 = *(_DWORD *)(v20 + 4);
      char v93 = v18;
      sub_224A779EC((uint32x4_t *)v105, (int16x8_t *)v101, v25 + 1, v42, v23, v18, v39, v35, v36);
      unsigned int v44 = v43;
      unsigned int v45 = a9;
      sub_224B01084((uint64_t)&v106, (uint64_t)&v102, v37, v38, v23, v44, a9);
      uint64_t v48 = *(int32x4_t **)&v97[0];
      uint64_t v49 = *(int16x8_t **)&v96[0];
      v97[0] = *(_OWORD *)((char *)v97 + 8);
      double v50 = *((double *)v96 + 1);
      v96[0] = *(_OWORD *)((char *)v96 + 8);
      *(void *)&v97[1] = v48;
      *(void *)&v96[1] = v49;
      if (v22 != 2)
      {
        *((void *)&v107 + 1) = *((void *)&v105 + 1);
        *((void *)&v103 + 1) = *((void *)&v101 + 1);
        uint64_t v51 = v86;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  *((void *)&v107 + 1) = v107;
  *((void *)&v103 + 1) = v103;
  sub_224B01084((uint64_t)&v106, (uint64_t)&v102, v37, v38, v23, *(_DWORD *)(v20 + 4), a9);
  int v64 = *(int32x4_t **)&v97[0];
  int v65 = *(int16x8_t **)&v96[0];
  v97[0] = *(_OWORD *)((char *)v97 + 8);
  v96[0] = *(_OWORD *)((char *)v96 + 8);
  *(void *)&v97[1] = v64;
  *(void *)&v96[1] = v65;
  uint64_t v66 = v90;
LABEL_18:
  *((void *)&v107 + 1) = v107;
  *((void *)&v103 + 1) = v103;
  unsigned int v76 = *(_DWORD *)(v20 + 4);
  int v77 = v23;
LABEL_19:
  sub_224B01084((uint64_t)&v106, (uint64_t)&v102, v64, v65, v77, v76, v28);
  return sub_224B019BC(&v95, v66, (uint64_t *)v97, (uint64_t *)v96, v23, *(__int16 *)(v20 + 10), v28);
}

uint16x4_t *sub_224B019BC(uint16x4_t **a1, uint64_t a2, uint64_t *a3, uint64_t *a4, int a5, unsigned int a6, unsigned int a7)
{
  double result = sub_224A77EC4(*a1, a3, a4, a5, a6, a7);
  uint64_t v12 = 0;
  *a1 = (uint16x4_t *)((char *)*a1 + a2);
  uint64_t v13 = *a3;
  uint64_t v14 = *a4;
  do
  {
    a3[v12] = a3[v12 + 1];
    a4[v12] = a4[v12 + 1];
    ++v12;
  }
  while (v12 != 2);
  a3[2] = v13;
  a4[2] = v14;
  return result;
}

uint16x4_t *sub_224B01A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t v9 = MEMORY[0x270FA5388]();
  char v18 = v15;
  uint64_t v19 = v14;
  int v21 = v20;
  int v22 = v13;
  uint64_t v88 = v12;
  int v23 = v11;
  uint64_t v92 = v10;
  uint64_t v24 = (uint16x4_t *)v9;
  uint64_t v25 = 0;
  v110[1008] = *MEMORY[0x263EF8340];
  uint64_t v105 = 0;
  long long v104 = 0u;
  long long v103 = 0u;
  uint64_t v101 = 0;
  long long v100 = 0u;
  long long v99 = 0u;
  unsigned int v26 = &v109;
  uint64_t v27 = v110;
  do
  {
    *(void *)((char *)&v103 + v25) = v27;
    *(void *)((char *)&v99 + v25) = v26;
    v25 += 8;
    v26 += 100;
    v27 += 200;
  }
  while (v25 != 40);
  long long v108 = 0uLL;
  uint64_t v107 = 0;
  memset(v102, 0, 40);
  v94.i64[0] = (uint64_t)&v97;
  v94.i64[1] = (uint64_t)&v98;
  v93.i64[0] = (uint64_t)&v95;
  v93.i64[1] = (uint64_t)&v96;
  uint64_t v28 = v10 >> 1;
  v106[0] = v103;
  v106[1] = v103;
  if ((v15 & 4) == 0)
  {
    uint64_t v107 = v103;
    *(void *)&long long v108 = v103;
    *((void *)&v108 + 1) = v103;
    *(void *)&v102[0] = v99;
    *((void *)&v102[0] + 1) = v99;
    *(void *)&v102[1] = v99;
    *((void *)&v102[1] + 1) = v99;
    *(void *)&v102[2] = v99;
    sub_224A77AB8((uint32x4_t *)v103, (int16x8_t *)v99, v11, v9, v13, v15, 0.0, v16, v17);
    if (v21 >= 2)
    {
      *((void *)&v108 + 1) = *((void *)&v103 + 1);
      *(void *)&v102[2] = *((void *)&v99 + 1);
      sub_224A77AB8(*((uint32x4_t **)&v103 + 1), *((int16x8_t **)&v99 + 1), v23 + 1, (uint64_t)v24 + 2 * v28, v22, v18, v29, v30, v31);
      sub_224B010E4((uint64_t)v106, (uint64_t)v102, (int32x4_t *)v94.i64[1], (int16x8_t *)v93.i64[1], v22, *(_DWORD *)v19, a9);
      int8x16_t v32 = v94;
      int8x16_t v33 = v93;
      int8x16_t v34 = vextq_s8(v33, v33, 8uLL);
      int8x16_t v93 = v34;
      int8x16_t v94 = vextq_s8(v32, v32, 8uLL);
      if (v21 == 2) {
        goto LABEL_12;
      }
      uint64_t v35 = (uint64_t)v24 + 2 * v28 + 2 * v28;
      int8x16_t v36 = v23 + 2;
      uint64_t v90 = (uint32x4_t *)*((void *)&v104 + 1);
      long long v108 = v104;
      uint64_t v37 = v28;
      uint64_t v38 = v23;
      unsigned int v39 = v21;
      uint64_t v40 = (int16x8_t *)*((void *)&v100 + 1);
      *(_OWORD *)((char *)&v102[1] + 8) = v100;
      sub_224A77AB8((uint32x4_t *)v104, (int16x8_t *)v100, v36, v35, v22, v18, *(double *)v32.i64, *(double *)v33.i64, v34);
      if (v39 >= 4)
      {
        uint64_t v82 = v37;
        double v83 = v38;
        sub_224A77AB8(v90, v40, v38 + 3, v35 + 2 * v37, v22, v18, v41, v42, v43);
        sub_224B010E4((uint64_t)v106, (uint64_t)v102, (int32x4_t *)v94.i64[1], (int16x8_t *)v93.i64[1], v22, *(_DWORD *)v19, a9);
        sub_224A78178(v24, v92, &v94, &v93, v22, 2, *(__int16 *)(v19 + 8), a9);
        uint64_t v24 = (uint16x4_t *)((char *)v24 + 2 * v92);
        int8x16_t v32 = v94;
        int8x16_t v33 = v93;
        int8x16_t v44 = vextq_s8(v33, v33, 8uLL);
        int8x16_t v93 = v44;
        int8x16_t v94 = vextq_s8(v32, v32, 8uLL);
        if (v39 != 4)
        {
          unsigned int v45 = v24;
          int v84 = v22;
          char v85 = v18;
          uint64_t v91 = v19;
          int v46 = -4;
          uint64_t v47 = 4;
          goto LABEL_16;
        }
        goto LABEL_12;
      }
LABEL_22:
      *((void *)&v108 + 1) = v108;
      *(void *)&v102[2] = *((void *)&v102[1] + 1);
      sub_224B010E4((uint64_t)v106, (uint64_t)v102, (int32x4_t *)v94.i64[1], (int16x8_t *)v93.i64[1], v22, *(_DWORD *)v19, a9);
      sub_224A78178(v24, v92, &v94, &v93, v22, 2, *(__int16 *)(v19 + 8), a9);
      uint64_t v24 = (uint16x4_t *)((char *)v24 + 2 * v92);
LABEL_23:
      int8x16_t v75 = v94;
      int8x16_t v76 = v93;
      int8x16_t v93 = vextq_s8(v76, v76, 8uLL);
      int8x16_t v94 = vextq_s8(v75, v75, 8uLL);
      *(void *)&long long v108 = v107;
      *((void *)&v108 + 1) = v107;
      *((void *)&v102[1] + 1) = *(void *)&v102[1];
      *(void *)&v102[2] = *(void *)&v102[1];
      sub_224B010E4((uint64_t)v106, (uint64_t)v102, (int32x4_t *)v75.i64[0], (int16x8_t *)v76.i64[0], v22, *(_DWORD *)v19, a9);
      unsigned int v65 = *(__int16 *)(v19 + 8);
      uint64_t v66 = v24;
      uint64_t v67 = v92;
      int v68 = v22;
      int v69 = 1;
      return sub_224A78178(v66, v67, &v94, &v93, v68, v69, v65, a9);
    }
LABEL_10:
    *((void *)&v108 + 1) = v108;
    *(void *)&v102[2] = *((void *)&v102[1] + 1);
    sub_224B010E4((uint64_t)v106, (uint64_t)v102, (int32x4_t *)v94.i64[1], (int16x8_t *)v93.i64[1], v22, *(_DWORD *)v19, a9);
    goto LABEL_23;
  }
  int v84 = v13;
  char v85 = v15;
  uint64_t v48 = (uint32x4_t *)*((void *)&v103 + 1);
  uint64_t v49 = (uint32x4_t *)v104;
  uint64_t v107 = *((void *)&v103 + 1);
  uint64_t v86 = (uint32x4_t *)*((void *)&v104 + 1);
  long long v108 = v104;
  uint64_t v91 = v14;
  double v50 = (int16x8_t *)*((void *)&v99 + 1);
  *(void *)&v102[0] = v99;
  *(_OWORD *)((char *)v102 + 8) = v99;
  long long v51 = v100;
  *(_OWORD *)((char *)&v102[1] + 8) = v100;
  sub_224A77AB8((uint32x4_t *)v103, (int16x8_t *)v99, 0, v12, v13, v15, 0.0, v16, v17);
  double v52 = v48;
  int v22 = v84;
  int8x16_t v53 = v50;
  uint64_t v19 = v91;
  sub_224A77AB8(v52, v53, 0, v88 + 2 * v28, v84, v85, v54, v55, v56);
  sub_224A77AB8(v49, (int16x8_t *)v51, v23, (uint64_t)v24, v84, v85, v57, v58, v59);
  if (v21 < 2) {
    goto LABEL_10;
  }
  double v83 = v23;
  sub_224A77AB8(v86, *((int16x8_t **)&v51 + 1), v23 + 1, (uint64_t)v24 + 2 * v28, v84, v85, v60, v61, v62);
  sub_224B010E4((uint64_t)v106, (uint64_t)v102, (int32x4_t *)v94.i64[1], (int16x8_t *)v93.i64[1], v84, *(_DWORD *)v91, a9);
  int8x16_t v32 = v94;
  int8x16_t v33 = v93;
  int8x16_t v44 = vextq_s8(v33, v33, 8uLL);
  int8x16_t v93 = v44;
  int8x16_t v94 = vextq_s8(v32, v32, 8uLL);
  if (v21 != 2)
  {
    unsigned int v39 = v21;
    uint64_t v82 = v28;
    int v46 = -2;
    uint64_t v47 = 2;
    unsigned int v45 = v24;
    uint64_t v35 = (uint64_t)v24;
LABEL_16:
    uint64_t v70 = (v92 & 0x7FFFFFFFFFFFFFFELL) + (v92 >> 1);
    uint64_t v87 = 2 * v70;
    uint64_t v81 = v88 + 4 * v70;
    uint64_t v71 = &v83[v47];
    *(void *)&long long v108 = v105;
    *((void *)&v102[1] + 1) = v101;
    uint64_t v89 = 4 * v82;
    do
    {
      sub_224A77AB8((uint32x4_t *)v108, *((int16x8_t **)&v102[1] + 1), v71, v35 + v89, v84, v85, *(double *)v32.i64, *(double *)v33.i64, v44);
      if (v39 + v46 < 2)
      {
        uint64_t v19 = v91;
        int v22 = v84;
        uint64_t v24 = v45;
        goto LABEL_22;
      }
      sub_224A77AB8(*((uint32x4_t **)&v108 + 1), *(int16x8_t **)&v102[2], v71 + 1, v35 + v87, v84, v85, v72, v73, v74);
      sub_224B010E4((uint64_t)v106, (uint64_t)v102, (int32x4_t *)v94.i64[1], (int16x8_t *)v93.i64[1], v84, *(_DWORD *)v91, a9);
      sub_224A78178(v45, v92, &v94, &v93, v84, 2, *(__int16 *)(v91 + 8), a9);
      int8x16_t v32 = v94;
      int8x16_t v33 = v93;
      int8x16_t v44 = vextq_s8(v33, v33, 8uLL);
      int8x16_t v93 = v44;
      int8x16_t v94 = vextq_s8(v32, v32, 8uLL);
      unsigned int v45 = (uint16x4_t *)((char *)v45 + 2 * v92);
      v46 -= 2;
      v71 += 2;
      v35 += v89;
    }
    while (v39 + v46);
    if ((v85 & 8) == 0)
    {
      double v63 = (int32x4_t *)v32.i64[0];
      int v64 = (int16x8_t *)v33.i64[0];
      uint64_t v19 = v91;
      int v22 = v84;
      uint64_t v24 = v45;
      goto LABEL_13;
    }
    int v22 = v84;
    sub_224A77AB8((uint32x4_t *)v108, *((int16x8_t **)&v102[1] + 1), 0, v81, v84, v85, *(double *)v32.i64, *(double *)v33.i64, v44);
    sub_224A77AB8(*((uint32x4_t **)&v108 + 1), *(int16x8_t **)&v102[2], 0, v81 + 2 * v82, v84, v85, v78, v79, v80);
    double v63 = (int32x4_t *)v94.i64[1];
    int v64 = (int16x8_t *)v93.i64[1];
    uint64_t v19 = v91;
    uint64_t v24 = v45;
    goto LABEL_14;
  }
LABEL_12:
  double v63 = (int32x4_t *)v32.i64[0];
  int v64 = (int16x8_t *)v33.i64[0];
LABEL_13:
  *(void *)&long long v108 = v107;
  *((void *)&v108 + 1) = v107;
  *((void *)&v102[1] + 1) = *(void *)&v102[1];
  *(void *)&v102[2] = *(void *)&v102[1];
LABEL_14:
  sub_224B010E4((uint64_t)v106, (uint64_t)v102, v63, v64, v22, *(_DWORD *)v19, a9);
  unsigned int v65 = *(__int16 *)(v19 + 8);
  uint64_t v66 = v24;
  uint64_t v67 = v92;
  int v68 = v22;
  int v69 = 2;
  return sub_224A78178(v66, v67, &v94, &v93, v68, v69, v65, a9);
}

int *sub_224B0219C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  uint64_t v9 = (char *)MEMORY[0x270FA5388]();
  uint64_t v11 = v10;
  int v13 = v12;
  int v15 = v14;
  unint64_t v17 = v16;
  char v18 = v9;
  uint64_t v32 = *MEMORY[0x263EF8340];
  sub_224B02338(v31, v9, v16, v19, v20, v14, v12, v21);
  sub_224B026E0();
  double result = sub_224B026E0();
  if (v13 >= 1)
  {
    int v23 = 0;
    uint64_t v24 = 0;
    int v25 = *(__int16 *)(v11 + 8);
    int v26 = *(__int16 *)(v11 + 10);
    do
    {
      if (v15 >= 1)
      {
        for (uint64_t i = 0; i != v15; *(_WORD *)&v18[2 * i++] = (_WORD)result)
        {
          int v28 = *(unsigned __int16 *)&v18[2 * i]
              + ((*(_DWORD *)&v30[512 * (unint64_t)(v23 & 0x1FFFFFF) + 4 * i] * v26
                + *(_DWORD *)&v30[512 * (unint64_t)(v23 & 0x1FFFFFF) + 98304 + 4 * i] * v25
                + 1024) >> 11);
          if (v28 >= a9) {
            unsigned int v29 = a9;
          }
          else {
            unsigned int v29 = *(unsigned __int16 *)&v18[2 * i]
          }
                + ((*(_DWORD *)&v30[512 * (unint64_t)(v23 & 0x1FFFFFF) + 4 * i] * v26
                  + *(_DWORD *)&v30[512 * (unint64_t)(v23 & 0x1FFFFFF) + 98304 + 4 * i] * v25
                  + 1024) >> 11);
          if (v28 >= 0) {
            double result = (int *)v29;
          }
          else {
            double result = 0;
          }
        }
      }
      ++v24;
      v18 += v17 & 0xFFFFFFFFFFFFFFFELL;
      v23 += 3;
    }
    while (v24 != v13);
  }
  return result;
}

void *sub_224B02338(_WORD *a1, char *a2, unint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8)
{
  uint64_t v9 = a2;
  uint64_t v10 = a1;
  int v11 = a8 & 1;
  unsigned int v12 = v11 | (2 * v11);
  int v13 = &a1[!(a8 & 1) | (2 * !(a8 & 1))];
  int v14 = 3 * (v11 + ((a8 & 2) >> 1)) + a6;
  int v15 = &a2[-2 * v12];
  unint64_t v16 = (char *)(a5 - 2 * v12);
  int v58 = a8 & 2;
  int v59 = v11;
  int v61 = v14;
  unsigned int v55 = v12;
  if ((a8 & 4) != 0)
  {
    int v23 = &v16[a3];
    size_t v24 = 2 * v14;
    memcpy(&a1[!(a8 & 1) | (2 * !(a8 & 1))], (const void *)(a5 - 2 * v12), v24);
    memcpy(v13 + 390, v16, v24);
    memcpy(v13 + 780, v23, v24);
  }
  else
  {
    int v17 = 2 * v14;
    size_t v18 = 2 * v14;
    memcpy(&a1[!(a8 & 1) | (2 * !(a8 & 1))], &a2[-2 * v12], v17);
    memcpy(v13 + 390, v15, v18);
    size_t v19 = v18;
    int v14 = v61;
    memcpy(v13 + 780, v15, v19);
    if (v11)
    {
      int v20 = *(_DWORD *)(a4 + 2);
      v13[2] = *(_WORD *)(a4 + 6);
      *(_DWORD *)int v13 = v20;
      int v21 = *(_DWORD *)(a4 + 2);
      v13[392] = *(_WORD *)(a4 + 6);
      *((_DWORD *)v13 + 195) = v21;
      int v22 = *(_DWORD *)(a4 + 2);
      v13[782] = *(_WORD *)(a4 + 6);
      *((_DWORD *)v13 + 390) = v22;
    }
  }
  int v25 = v13 + 1170;
  if ((a8 & 8) != 0)
  {
    uint64_t v38 = &v16[12 * (a3 >> 1)];
    unsigned int v39 = &v38[a3];
    int v26 = a7;
    int v40 = 2 * v14;
    size_t v41 = 2 * v14;
    memcpy(&v25[390 * a7], v38, v40);
    memcpy(&v25[390 * a7 + 390], v39, v41);
    double result = memcpy(&v25[390 * a7 + 780], v39, v41);
  }
  else
  {
    int v26 = a7;
    uint64_t v54 = a7 - 1;
    uint64_t v27 = &v15[2 * (a3 >> 1) * v54];
    int v28 = &v25[390 * a7];
    int v29 = 2 * v14;
    size_t v30 = 2 * v14;
    memcpy(v28, v27, v29);
    int8x16_t v31 = &v25[390 * a7 + 390];
    memcpy(v31, v27, v30);
    uint64_t v32 = &v25[390 * a7 + 780];
    double result = memcpy(v32, v27, v30);
    if (v59)
    {
      uint64_t v34 = a4 + 8 * v54;
      int v35 = *(_DWORD *)(v34 + 2);
      v28[2] = *(_WORD *)(v34 + 6);
      *(_DWORD *)int v28 = v35;
      int v36 = *(_DWORD *)(v34 + 2);
      v31[2] = *(_WORD *)(v34 + 6);
      *(_DWORD *)int8x16_t v31 = v36;
      int v37 = *(_DWORD *)(v34 + 2);
      v32[2] = *(_WORD *)(v34 + 6);
      *(_DWORD *)uint64_t v32 = v37;
    }
  }
  if (v26 >= 1)
  {
    double v42 = (char *)&v10[3 * (a8 & 1) + 1170 + 3 * (((_BYTE)a8 + 1) & 1)];
    int v43 = v26;
    do
    {
      double result = memcpy(v42, v9, (int)(2 * (v61 - v55)));
      v9 += a3 & 0xFFFFFFFFFFFFFFFELL;
      v42 += 780;
      --v43;
    }
    while (v43);
  }
  if (!v58 && v26 > -6)
  {
    int8x16_t v44 = &v13[v61];
    unsigned int v45 = v44 - 1;
    int v46 = ((v26 + 5) & ~((v26 + 5) >> 31)) + 1;
    do
    {
      __int16 v47 = *v45;
      *int8x16_t v44 = *v45;
      v44[1] = v47;
      v44[2] = v47;
      v45 += 390;
      v44 += 390;
      --v46;
    }
    while (v46);
  }
  if (v59)
  {
    if (v26 >= 1)
    {
      double v50 = v10 + 1170;
      uint64_t v51 = v26;
      double v52 = (int *)(a4 + 2);
      do
      {
        int v53 = *v52;
        _OWORD v50[2] = *((_WORD *)v52 + 2);
        *(_DWORD *)double v50 = v53;
        v50 += 390;
        v52 += 2;
        --v51;
      }
      while (v51);
    }
  }
  else if (v26 >= -5)
  {
    int v48 = ((v26 + 5) & ~((v26 + 5) >> 31)) + 1;
    do
    {
      __int16 v49 = *(_WORD *)((char *)v10 + ((2 * ((a8 + 1) & 1)) & 0xFFFFFFFFFFFFFFFBLL | (4 * ((a8 + 1) & 1))));
      _WORD *v10 = v49;
      v10[1] = v49;
      v10[2] = v49;
      v10 += 390;
      --v48;
    }
    while (v48);
  }
  return result;
}

int *sub_224B026E0()
{
  double result = (int *)MEMORY[0x270FA5388]();
  unsigned int v138 = v6;
  uint64_t v7 = v1;
  *(void *)&v147[102948] = *MEMORY[0x263EF8340];
  char v8 = (int *)v147;
  uint64_t v9 = &v143;
  if (v4 == 25) {
    int v10 = 164;
  }
  else {
    int v10 = 455;
  }
  if (v4 == 25) {
    int v11 = 2;
  }
  else {
    int v11 = 1;
  }
  if (v4 == 25)
  {
    if (v2 <= -6)
    {
      int v13 = v3 + 4;
    }
    else
    {
      int v136 = v11;
      uint64_t v12 = 0;
      uint64_t v139 = v1 + 2340;
      int v13 = v3 + 4;
      uint64_t v137 = v1;
      int v14 = (unsigned __int16 *)(v1 + 3120);
      int v15 = &v145;
      unint64_t v16 = &v141;
      do
      {
        if (v3 >= -1)
        {
          int v17 = (unsigned __int16 *)(v139 + 2 * v12);
          int v18 = *v17;
          int v19 = v18 * v18;
          int v20 = *(v17 - 390);
          int v21 = v20 * v20;
          int v22 = *(v17 - 780);
          int v23 = v22 * v22;
          int v24 = *(v17 - 1170);
          int v25 = v24 * v24;
          int v26 = v16;
          uint64_t v27 = v15;
          int v28 = v14;
          int v29 = v3 + 2;
          do
          {
            int v30 = v22 + v24;
            int v24 = v22;
            int v22 = v20;
            int v31 = v23 + v25;
            int v25 = v23;
            int v23 = v21;
            int v20 = v18;
            int v21 = v19;
            int v18 = *v28;
            int v19 = v18 * v18;
            *(_DWORD *)int v26 = v22 + v20 + v30 + v18;
            *(_DWORD *)uint64_t v27 = v23 + v21 + v31 + v18 * v18;
            v28 += 390;
            v27 += 195;
            v26 += 195;
            --v29;
          }
          while (v29);
        }
        ++v12;
        ++v14;
        int v15 = (uint64_t *)((char *)v15 + 4);
        unint64_t v16 = (uint64_t *)((char *)v16 + 4);
      }
      while (v12 != v2 + 6);
      uint64_t v7 = v137;
      int v11 = v136;
    }
    if (v3 >= -1)
    {
      int v48 = 2;
      __int16 v49 = v140;
      double v50 = v144;
      do
      {
        if (v2 >= -1)
        {
          unint64_t v51 = 0;
          int v52 = v50[393];
          int v53 = v49[393];
          int v54 = v50[392];
          int v55 = v49[392];
          int v56 = v50[391];
          int v57 = v49[391];
          int v58 = v50[390];
          int v59 = v49[390];
          do
          {
            int v60 = v57 + v59;
            int v59 = v57;
            int v57 = v55;
            int v61 = v56 + v58;
            int v58 = v56;
            int v56 = v54;
            int v55 = v53;
            int v54 = v52;
            int v53 = v49[v51 / 4 + 394];
            int v52 = v50[v51 / 4 + 394];
            v49[v51 / 4 + 392] = v57 + v55 + v60 + v53;
            v50[v51 / 4 + 392] = v56 + v54 + v61 + v52;
            v51 += 4;
          }
          while (4 * (v2 + 4) - 8 != v51);
        }
        v50 += 390;
        v49 += 390;
        ++v48;
      }
      while (v48 != v13);
LABEL_37:
      unsigned int v72 = 24 - __clz(v138);
      double v73 = &v142;
      uint64_t v74 = 4 * (390 << (v4 == 25));
      int8x16_t v75 = (unsigned int *)&v146;
      int v76 = -1;
      do
      {
        int v77 = v75;
        double v78 = (int *)v73;
        uint64_t v79 = (v2 + 1) + 1;
        if (v2 >= -1)
        {
          do
          {
            int v80 = *v78;
            int v81 = ((int)(*v77 + ((1 << (2 * v72)) >> 1)) >> (2 * v72)) * v4
                - ((int)(v80 + ((1 << v72) >> 1)) >> v72)
                * ((int)(v80 + ((1 << v72) >> 1)) >> v72);
            unsigned int v82 = ((v81 & ~(v81 >> 31)) * v5 + 0x80000) >> 20;
            if (v82 >= 0xFF) {
              unsigned int v82 = 255;
            }
            int v83 = byte_224B28DC0[v82];
            *v77++ = (v80 * v10 * v83 + 2048) >> 12;
            *v78++ = v83;
            --v79;
          }
          while (v79);
        }
        v76 += v11;
        double v73 = (uint64_t *)((char *)v73 + v74);
        int8x16_t v75 = (unsigned int *)((char *)v75 + v74);
      }
      while (v76 <= v3);
    }
  }
  else
  {
    if (v2 <= -4)
    {
      int v32 = v3 + 4;
    }
    else
    {
      int v32 = v3 + 4;
      int8x16_t v33 = (unsigned __int16 *)(v1 + 2342);
      uint64_t v34 = (char *)&v145 + 4;
      int v35 = (char *)&v141 + 4;
      uint64_t v36 = 1;
      do
      {
        if (v3 >= -1)
        {
          int v37 = (unsigned __int16 *)(v7 + 780 + 2 * v36);
          int v38 = v37[390];
          int v39 = v38 * v38;
          int v40 = *v37;
          int v41 = v40 * v40;
          double v42 = v35;
          int v43 = v34;
          int8x16_t v44 = v33;
          int v45 = v3 + 2;
          do
          {
            int v46 = v40 + v38;
            int v40 = v38;
            int v38 = *v44;
            int v47 = v41 + v39;
            int v41 = v39;
            int v39 = v38 * v38;
            *double v42 = v46 + v38;
            *int v43 = v47 + v38 * v38;
            v44 += 390;
            v43 += 390;
            v42 += 390;
            --v45;
          }
          while (v45);
        }
        ++v36;
        ++v33;
        v34 += 4;
        v35 += 4;
      }
      while (v36 != v2 + 5);
    }
    if (v3 >= -1)
    {
      int v62 = 2;
      double v63 = v140;
      int v64 = v144;
      do
      {
        if (v2 >= -1)
        {
          uint64_t v65 = 0;
          int v66 = *((_DWORD *)v64 + 392);
          int v67 = *((_DWORD *)v63 + 392);
          int v68 = *((_DWORD *)v64 + 391);
          int v69 = *((_DWORD *)v63 + 391);
          do
          {
            int v70 = v69 + v67;
            int v69 = v67;
            int v67 = *(_DWORD *)&v63[v65 + 1572];
            int v71 = v68 + v66;
            int v68 = v66;
            int v66 = *(_DWORD *)&v64[v65 + 1572];
            *(_DWORD *)&v63[v65 + 1568] = v70 + v67;
            *(_DWORD *)&v64[v65 + 1568] = v71 + v66;
            v65 += 4;
          }
          while (4 * (v2 + 4) - 8 != v65);
        }
        v64 += 1560;
        v63 += 1560;
        ++v62;
      }
      while (v62 != v32);
      goto LABEL_37;
    }
  }
  int v84 = (unsigned __int16 *)(v7 + 2346);
  if (v4 == 25)
  {
    if (v3 < 2)
    {
      int v105 = 1;
    }
    else
    {
      int v85 = 0;
      uint64_t v86 = 4 * v2;
      uint64_t v87 = (unsigned __int16 *)(v7 + 3126);
      uint64_t v88 = v140;
      uint64_t v89 = v144;
      do
      {
        if (v2 >= 1)
        {
          uint64_t v90 = 0;
          unint64_t v91 = 0;
          int v92 = *(v9 - 390);
          int v93 = v9[390];
          int v94 = *(v8 - 390);
          int v95 = v8[390];
          int v96 = v95;
          int v97 = v93;
          do
          {
            int v98 = -6 * (v97 + v92);
            int v92 = *(_DWORD *)&v88[v91 + 1576];
            int v97 = *(_DWORD *)&v88[v91 + 4696];
            int v99 = v96 + v94;
            int v94 = *(_DWORD *)&v89[v91 + 1576];
            int v96 = *(_DWORD *)&v89[v91 + 4696];
            result[v91 / 4] = (5 * (*(_DWORD *)&v89[v91 + 4688] + *(_DWORD *)&v89[v91 + 1568] + v94 + v96)
                             + 6 * v99
                             + (v98 - 5 * (*(_DWORD *)&v88[v91 + 4688] + *(_DWORD *)&v88[v91 + 1568] + v92 + v97))
                             * v84[v90]
                             + 256) >> 9;
            v91 += 4;
            ++v90;
          }
          while (v86 != v91);
          unint64_t v100 = 0;
          uint64_t v101 = v87;
          do
          {
            int v102 = -6 * v93;
            int v93 = *(_DWORD *)&v88[v100 + 4696];
            int v103 = *(_DWORD *)&v89[v100 + 4696];
            int v104 = *v101++;
            result[v100 / 4 + 384] = (5 * (v103 + *(_DWORD *)&v89[v100 + 4688])
                                    + 6 * v95
                                    + (v102 - 5 * (v93 + *(_DWORD *)&v88[v100 + 4688])) * v104
                                    + 128) >> 8;
            v100 += 4;
            int v95 = v103;
          }
          while (v86 != v100);
        }
        result += 768;
        v84 += 780;
        v9 += 780;
        v8 += 780;
        v85 += 2;
        v88 += 3120;
        v89 += 3120;
        v87 += 780;
      }
      while (v85 < v3 - 1);
      int v105 = v3 | 1;
    }
    if (v105 == v3 && v2 >= 1)
    {
      uint64_t v126 = v2;
      int v127 = *(v9 - 390);
      int v128 = v9[390];
      int v129 = *(v8 - 390);
      int v130 = v8[390];
      int8x16_t v131 = v9 - 391;
      uint64_t v132 = v8 - 391;
      do
      {
        int v133 = -6 * (v128 + v127);
        int v127 = v131[2];
        int v128 = v131[782];
        int v134 = v130 + v129;
        int v129 = v132[2];
        int v130 = v132[782];
        int v135 = *v84++;
        *result++ = (5 * (v132[780] + *v132 + v129 + v130)
                   + 6 * v134
                   + (v133 - 5 * (v131[780] + *v131 + v127 + v128)) * v135
                   + 256) >> 9;
        ++v131;
        ++v132;
        --v126;
      }
      while (v126);
    }
  }
  else if (v3 >= 1)
  {
    int v106 = 0;
    uint64_t v107 = v140;
    long long v108 = v144;
    do
    {
      if (v2 >= 1)
      {
        uint64_t v109 = 0;
        unint64_t v110 = 0;
        int v111 = *v9;
        int v112 = *(v9 - 390);
        int v113 = v9[389];
        int v114 = *v8;
        int v115 = *(v8 - 390);
        int v116 = v8[389];
        do
        {
          int v117 = *(_DWORD *)&v107[v110 + 3128] + v111;
          int v111 = *(_DWORD *)&v107[v110 + 3136];
          int v118 = v117 + v111 + v112;
          int v119 = *(_DWORD *)&v107[v110 + 4692];
          int v120 = v118 + v119;
          int v112 = *(_DWORD *)&v107[v110 + 1576];
          int v121 = -3 * (v113 + *(_DWORD *)&v107[v110 + 1568] + v112 + *(_DWORD *)&v107[v110 + 4696]) - 4 * v120;
          int v122 = *(_DWORD *)&v108[v110 + 3128] + v114;
          int v114 = *(_DWORD *)&v108[v110 + 3136];
          int v123 = v122 + v114 + v115;
          int v124 = *(_DWORD *)&v108[v110 + 4692];
          int v125 = v123 + v124;
          int v115 = *(_DWORD *)&v108[v110 + 1576];
          result[v110 / 4] = (3 * (v116 + *(_DWORD *)&v108[v110 + 1568] + v115 + *(_DWORD *)&v108[v110 + 4696])
                            + 4 * v125
                            + v121 * v84[v109]
                            + 256) >> 9;
          v110 += 4;
          ++v109;
          int v116 = v124;
          int v113 = v119;
        }
        while (4 * v2 != v110);
      }
      result += 384;
      v84 += 390;
      v9 += 390;
      v8 += 390;
      ++v106;
      v107 += 1560;
      v108 += 1560;
    }
    while (v106 != v3);
  }
  return result;
}

int *sub_224B02F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = (char *)MEMORY[0x270FA5388]();
  uint64_t v11 = v10;
  int v13 = v12;
  int v15 = v14;
  unint64_t v17 = v16;
  int v18 = v9;
  uint64_t v31 = *MEMORY[0x263EF8340];
  sub_224B02338(v30, v9, v16, v19, v20, v14, v12, v21);
  double result = sub_224B026E0();
  if (v13 >= 1)
  {
    int v23 = 0;
    uint64_t v24 = 0;
    int v25 = *(__int16 *)(v11 + 10);
    do
    {
      if (v15 >= 1)
      {
        for (uint64_t i = 0; i != v15; *(_WORD *)&v18[2 * i++] = v28)
        {
          int v27 = *(unsigned __int16 *)&v18[2 * i]
              + ((*(_DWORD *)&v29[512 * (unint64_t)(v23 & 0x1FFFFFF) + 4 * i] * v25 + 1024) >> 11);
          if (v27 >= a9) {
            double result = (int *)a9;
          }
          else {
            double result = (int *)v27;
          }
          if (v27 >= 0) {
            __int16 v28 = (__int16)result;
          }
          else {
            __int16 v28 = 0;
          }
        }
      }
      ++v24;
      v18 += v17 & 0xFFFFFFFFFFFFFFFELL;
      v23 += 3;
    }
    while (v24 != v13);
  }
  return result;
}

int *sub_224B03078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v9 = (char *)MEMORY[0x270FA5388]();
  uint64_t v11 = v10;
  int v13 = v12;
  int v15 = v14;
  unint64_t v17 = v16;
  int v18 = v9;
  uint64_t v31 = *MEMORY[0x263EF8340];
  sub_224B02338(v30, v9, v16, v19, v20, v14, v12, v21);
  double result = sub_224B026E0();
  if (v13 >= 1)
  {
    int v23 = 0;
    uint64_t v24 = 0;
    int v25 = *(__int16 *)(v11 + 8);
    do
    {
      if (v15 >= 1)
      {
        for (uint64_t i = 0; i != v15; *(_WORD *)&v18[2 * i++] = v28)
        {
          int v27 = *(unsigned __int16 *)&v18[2 * i]
              + ((*(_DWORD *)&v29[512 * (unint64_t)(v23 & 0x1FFFFFF) + 4 * i] * v25 + 1024) >> 11);
          if (v27 >= a9) {
            double result = (int *)a9;
          }
          else {
            double result = (int *)v27;
          }
          if (v27 >= 0) {
            __int16 v28 = (__int16)result;
          }
          else {
            __int16 v28 = 0;
          }
        }
      }
      ++v24;
      v18 += v17 & 0xFFFFFFFFFFFFFFFELL;
      v23 += 3;
    }
    while (v24 != v13);
  }
  return result;
}

unint64_t sub_224B031D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, signed int a9)
{
  uint64_t v9 = (char *)MEMORY[0x270FA5388]();
  uint64_t v11 = v10;
  int v13 = v12;
  int v15 = v14;
  uint64_t v17 = v16;
  int v18 = v9;
  uint64_t v49 = *MEMORY[0x263EF8340];
  unint64_t result = (unint64_t)sub_224B02338(v48, v9, v16, v19, v20, v14, v12, v21);
  unsigned int v23 = __clz(a9);
  char v24 = 2 * (v23 == 20);
  if (v13 >= -5)
  {
    int v25 = 0;
    int v26 = v48;
    int v27 = v47;
    unint64_t result = v15;
    do
    {
      if (v15 >= 1)
      {
        uint64_t v28 = 0;
        int v29 = v26;
        do
        {
          uint64_t v30 = 0;
          int v31 = 1 << (38 - v23);
          do
          {
            v31 += *(__int16 *)(v11 + v30 * 2) * (unsigned __int16)v29[v30];
            ++v30;
          }
          while (v30 != 7);
          int v32 = (v31 + (4 << v24)) >> (v24 + 3);
          if (v32 >= ~(-1 << (37 - v23 - v24))) {
            __int16 v33 = ~(-1 << (37 - v23 - v24));
          }
          else {
            __int16 v33 = v32;
          }
          if (v32 >= 0) {
            __int16 v34 = v33;
          }
          else {
            __int16 v34 = 0;
          }
          v27[v28++] = v34;
          ++v29;
        }
        while (v28 != v15);
      }
      v26 += 390;
      v27 += 390;
    }
    while (v25++ != ((v13 + 5) & ~((v13 + 5) >> 31)));
  }
  if (v13 >= 1)
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    int v38 = 1 << (10 - v24);
    int v39 = -1 << (10 - v24 - v23);
    char v40 = v24 ^ 0xB;
    do
    {
      if (v15 >= 1)
      {
        for (unint64_t result = 0; result != v15; *(_WORD *)&v18[2 * (v17 >> 1) * v37 + 2 * result++] = v46)
        {
          uint64_t v41 = 0;
          uint64_t v42 = v36;
          int v43 = v39;
          do
          {
            v43 += *(__int16 *)(v11 + 16 + v41) * (unsigned __int16)v47[(v42 & 0xFFFFFFFE) + result];
            v41 += 2;
            v42 += 390;
          }
          while (v41 != 14);
          int v44 = (v43 + v38) >> v40;
          if (v44 >= a9) {
            __int16 v45 = a9;
          }
          else {
            __int16 v45 = (v43 + v38) >> v40;
          }
          if (v44 >= 0) {
            __int16 v46 = v45;
          }
          else {
            __int16 v46 = 0;
          }
        }
      }
      ++v37;
      v36 += 390;
    }
    while (v37 != v13);
  }
  return result;
}

void sub_224B0343C()
{
  if (atomic_load_explicit((atomic_ullong *volatile)qword_26AA96DE8, memory_order_acquire) != -1)
  {
    uint64_t v0 = &v1;
    uint64_t v1 = sub_224B034AC;
    std::__call_once(qword_26AA96DE8, &v0, (void (__cdecl *)(void *))sub_224B034A0);
  }
}

uint64_t sub_224B034A0(uint64_t (***a1)(void))
{
  return (**a1)();
}

uint64_t sub_224B034AC()
{
  int v3 = 0;
  uint64_t v1 = 0;
  size_t v2 = 8;
  sysctlbyname("hw.cachelinesize", &v1, &v2, 0, 0);
  size_t v2 = 4;
  if (!sysctlbyname("hw.physicalcpu", &v3, &v2, 0, 0) && v2 == 4) {
    dword_26AA96DA0 = v3;
  }
  size_t v2 = 4;
  uint64_t result = sysctlbyname("hw.logicalcpu", &v3, &v2, 0, 0);
  dword_26AA96DE4 |= 2u;
  return result;
}

uint64_t sub_224B03564(char a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (sub_224B0E50C(a2)) {
    return 0;
  }
  unsigned int v5 = sub_224B0E430(a2) ^ 1;
  if (a1) {
    return v5;
  }
  else {
    return 1;
  }
}

uint64_t sub_224B035C0(uint64_t a1, int32x2_t *a2, CVPixelBufferRef pixelBuffer)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  int32x2_t v7 = a2[33];
  if (*(unsigned char *)(*(void *)&v7 + 24) && !a2[8].i32[0]) {
    return 0;
  }
  char v8 = (void *)MEMORY[0x22A61DAE0]();
  uint64_t v9 = *(void **)(a1 + 32);
  if (!v9)
  {
LABEL_10:
    goto LABEL_11;
  }
  id v10 = v9;
  if (([v10 metalIsSupported] & 1) == 0
    || !CVPixelBufferGetIOSurface(pixelBuffer)
    || (int v11 = [v10 maximumTextureDimension], CVPixelBufferGetWidth(pixelBuffer) > v11)
    || CVPixelBufferGetHeight(pixelBuffer) > v11
    || (OSType v12 = CVPixelBufferGetPixelFormatType(pixelBuffer), (sub_224B0E430(v12) & 1) != 0)
    || [v10 broken444] && (sub_224B0E640(v12) & 1) != 0)
  {

    goto LABEL_10;
  }

  for (uint64_t i = 0; i != 3; ++i)
  {
    int v15 = *(__CVBuffer **)(*(void *)&v7 + 8 * i);
    if (v15)
    {
      if (*(unsigned char *)(*(void *)&v7 + i + 27))
      {
        CVPixelBufferLockFlags v16 = *(void *)(*(void *)&v7 + 8 * i + 32);
        if (v16 != 1)
        {
          CVPixelBufferUnlockBaseAddress(v15, v16);
          *(unsigned char *)(*(void *)&v7 + i + 27) = 0;
        }
      }
    }
  }
  int v17 = *(unsigned __int8 *)(*(void *)&v7 + 26);
  int v18 = (void *)MEMORY[0x22A61DAE0]();
  uint64_t v19 = *(void **)(a1 + 32);
  if (!v17)
  {
    if (v19)
    {
      int v20 = [v19 copyPicture:a2 toPixelBuffer:pixelBuffer];
      goto LABEL_29;
    }
LABEL_30:
    int v21 = -12911;
    goto LABEL_31;
  }
  if (!v19) {
    goto LABEL_30;
  }
  int v20 = [v19 applyFilmGrain:a1 + 40 forPicture:a2 toPixelBuffer:pixelBuffer];
LABEL_29:
  int v21 = v20;
LABEL_31:
  for (uint64_t j = 0; j != 3; ++j)
  {
    unsigned int v23 = *(__CVBuffer **)(*(void *)&v7 + 8 * j);
    if (!v23) {
      continue;
    }
    if (*(unsigned char *)(*(void *)&v7 + j + 27))
    {
      CVPixelBufferLockFlags v24 = *(void *)(*(void *)&v7 + 8 * j + 32);
      if (v24 == 1) {
        continue;
      }
      CVPixelBufferUnlockBaseAddress(v23, v24);
      unsigned int v23 = *(__CVBuffer **)(*(void *)&v7 + 8 * j);
    }
    *(void *)(*(void *)&v7 + 8 * j + 32) = 1;
    CVPixelBufferLockBaseAddress(v23, 1uLL);
    *(unsigned char *)(*(void *)&v7 + j + 27) = 1;
  }
  if (!v21) {
    return 0;
  }
  CVPixelBufferRef v25 = pixelBuffer;
  if (atomic_load_explicit((atomic_ullong *volatile)(a1 + 36896), memory_order_acquire) != -1)
  {
    int v27 = &v25;
    int v26 = &v27;
    std::__call_once((std::once_flag::_State_type *)(a1 + 36896), &v26, (void (__cdecl *)(void *))sub_224B03908);
  }
  if (sub_224B0E50C(PixelFormatType)) {
    return 4294954385;
  }
LABEL_11:
  if (*(unsigned char *)(*(void *)&v7 + 26))
  {
    sub_224B04184(a1 + 40, a2, pixelBuffer, 0);
    return 0;
  }
  return sub_224B03858(a1, (uint64_t)a2, pixelBuffer, 0);
}

void sub_224B03840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_224B03858(uint64_t a1, uint64_t a2, CVPixelBufferRef pixelBuffer, uint64_t a4)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  if (*(_DWORD *)(a2 + 68) == 8)
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, CVPixelBufferRef, uint64_t))a1)(a2, pixelBuffer, a4);
  }
  else if (sub_224B0E430(PixelFormatType))
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, CVPixelBufferRef))(a1 + 16))(a2, pixelBuffer);
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, CVPixelBufferRef, uint64_t))(a1 + 8))(a2, pixelBuffer, a4);
  }
  uint64_t v10 = v9;
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return v10;
}

void sub_224B03908(uint64_t ***a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = ***a1;
    int v3 = 138412290;
    uint64_t v4 = v2;
    _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unable to copy via metal to %@", (uint8_t *)&v3, 0xCu);
  }
}

const void **sub_224B039B4(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t sub_224B039E8(uint64_t a1, CVPixelBufferRef pixelBuffer)
{
  uint64_t v4 = *(unsigned int *)(a1 + 60);
  uint64_t v5 = *(int *)(a1 + 56);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  uint64_t v7 = *(void *)(a1 + 16);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  if ((int)v4 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(a1 + 40);
    do
    {
      if ((int)v5 >= 1)
      {
        uint64_t v11 = 0;
        OSType v12 = (int *)&BaseAddressOfPlane[BytesPerRowOfPlane * v9];
        do
        {
          *v12++ = *(unsigned __int16 *)(v7 + 2 * v11) | (*(unsigned __int16 *)(v7 + 2 * v11 + 2) << 10) | (*(unsigned __int16 *)(v7 + 2 * v11 + 4) << 20);
          v11 += 3;
        }
        while (v11 < v5);
      }
      ++v9;
      v7 += v10;
    }
    while (v9 != v4);
  }
  int v13 = *(_DWORD *)(a1 + 64);
  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 24);
    uint64_t v15 = *(void *)(a1 + 32);
    unint64_t v16 = *(void *)(a1 + 48);
    int v17 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
    size_t v18 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
    int v19 = v13 == 1 ? v4 + 1 : v4;
    uint64_t v20 = (v19 >> (v13 == 1));
    if ((int)v20 >= 1)
    {
      uint64_t v21 = 0;
      if (v13 == 3) {
        int v22 = v5;
      }
      else {
        int v22 = v5 + 1;
      }
      uint64_t v23 = v22 >> (v13 != 3);
      uint64_t v24 = 2 * (v16 >> 1);
      do
      {
        if ((int)v23 >= 1)
        {
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          int v27 = (int *)&v17[v18 * v21];
          do
          {
            int v28 = *(unsigned __int16 *)(v15 + v25 + 2) | (*(unsigned __int16 *)(v14 + v25 + 4) << 10) | (*(unsigned __int16 *)(v15 + v25 + 4) << 20);
            *int v27 = *(unsigned __int16 *)(v14 + v25) | (*(unsigned __int16 *)(v15 + v25) << 10) | (*(unsigned __int16 *)(v14 + v25 + 2) << 20);
            v27[1] = v28;
            v27 += 2;
            v26 += 3;
            v25 += 6;
          }
          while (v26 < v23);
        }
        ++v21;
        v14 += v24;
        v15 += v24;
      }
      while (v21 != v20);
    }
  }
  return 0;
}

uint64_t sub_224B03B78(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  int v6 = 16 - *(_DWORD *)(a1 + 68);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  int v8 = *(_DWORD *)(a1 + 60);
  if (!*(unsigned char *)(*(void *)(a1 + 264) + 24))
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    uint64_t v10 = *(void *)(a1 + 16);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
    if (v8 >= 1)
    {
      int v12 = 0;
      int v13 = &BaseAddressOfPlane[2 * (BytesPerRowOfPlane >> 1) * (a3 >> 32) + 2 * (int)a3];
      uint64_t v14 = 2 * (*(void *)(a1 + 40) >> 1);
      do
      {
        if ((int)v7 >= 1)
        {
          uint64_t v15 = 0;
          do
          {
            *(_WORD *)&v13[v15] = *(unsigned __int16 *)(v10 + v15) << v6;
            v15 += 2;
          }
          while (2 * v7 != v15);
        }
        ++v12;
        v13 += 2 * (BytesPerRowOfPlane >> 1);
        v10 += v14;
      }
      while (v12 != v8);
    }
  }
  int v16 = *(_DWORD *)(a1 + 64);
  if (v16)
  {
    int v17 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
    uint64_t v18 = *(void *)(a1 + 24);
    uint64_t v19 = *(void *)(a1 + 32);
    size_t v20 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
    char v21 = v16 == 1;
    int v22 = v16 == 1 ? v8 + 1 : v8;
    int v23 = v22 >> v21;
    if (v23 >= 1)
    {
      int v24 = 0;
      size_t v25 = v20 >> 1;
      int v26 = SHIDWORD(a3) >> v21;
      char v27 = v16 != 3;
      if (v16 == 3) {
        int v28 = v7;
      }
      else {
        int v28 = v7 + 1;
      }
      int v29 = v28 >> v27;
      uint64_t v30 = 2 * (*(void *)(a1 + 48) >> 1);
      uint64_t v31 = (uint64_t)v17 + 4 * ((int)a3 >> v27) + 2 * v25 * v26 + 2;
      uint64_t v32 = 2 * v25;
      do
      {
        if (v29 >= 1)
        {
          uint64_t v33 = 0;
          __int16 v34 = (_WORD *)v31;
          do
          {
            *(v34 - 1) = *(unsigned __int16 *)(v18 + v33) << v6;
            *__int16 v34 = *(unsigned __int16 *)(v19 + v33) << v6;
            v34 += 2;
            v33 += 2;
          }
          while (2 * v29 != v33);
        }
        ++v24;
        v19 += v30;
        v18 += v30;
        v31 += v32;
      }
      while (v24 != v23);
    }
  }
  return 0;
}

uint64_t sub_224B03D48(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  int v6 = 8 - *(_DWORD *)(a1 + 68);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  int v8 = *(_DWORD *)(a1 + 60);
  if (!*(unsigned char *)(*(void *)(a1 + 264) + 24))
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    uint64_t v10 = *(void *)(a1 + 16);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
    if (v8 >= 1)
    {
      int v12 = 0;
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = &BaseAddressOfPlane[BytesPerRowOfPlane * (a3 >> 32) + (int)a3];
      do
      {
        if ((int)v7 >= 1)
        {
          for (uint64_t i = 0; i != v7; ++i)
            v14[i] = *(unsigned __int8 *)(v10 + i) << v6;
        }
        v14 += BytesPerRowOfPlane;
        v10 += v13;
        ++v12;
      }
      while (v12 != v8);
    }
  }
  int v16 = *(_DWORD *)(a1 + 64);
  if (v16)
  {
    int v17 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
    uint64_t v18 = *(void *)(a1 + 24);
    uint64_t v19 = *(void *)(a1 + 32);
    size_t v20 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
    char v21 = v16 == 1;
    int v22 = v16 == 1 ? v8 + 1 : v8;
    int v23 = v22 >> v21;
    if (v23 >= 1)
    {
      int v24 = 0;
      uint64_t v25 = *(void *)(a1 + 48);
      int v26 = SHIDWORD(a3) >> v21;
      char v27 = v16 != 3;
      if (v16 == 3) {
        int v28 = v7;
      }
      else {
        int v28 = v7 + 1;
      }
      uint64_t v29 = (v28 >> v27);
      uint64_t v30 = (uint64_t)v17 + 2 * ((int)a3 >> v27) + v20 * v26 + 1;
      do
      {
        if ((int)v29 >= 1)
        {
          uint64_t v31 = 0;
          uint64_t v32 = (unsigned char *)v30;
          do
          {
            *(v32 - 1) = *(unsigned __int8 *)(v18 + v31) << v6;
            *uint64_t v32 = *(unsigned __int8 *)(v19 + v31) << v6;
            v32 += 2;
            ++v31;
          }
          while (v29 != v31);
        }
        v18 += v25;
        v19 += v25;
        ++v24;
        v30 += v20;
      }
      while (v24 != v23);
    }
  }
  return 0;
}

void sub_224B03EF0(char *a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 39)) {
    int v4 = 1;
  }
  else {
    int v4 = (*(_DWORD *)(a2 + 4) >> 1) & 1;
  }
  if (*(unsigned char *)(a2 + 60)) {
    int v5 = 2;
  }
  else {
    int v5 = *(_DWORD *)(a2 + 4) & 2;
  }
  if (*(unsigned char *)(a2 + 10))
  {
    if (v4) {
      goto LABEL_9;
    }
LABEL_17:
    bzero(a1 + 11972, 0x2EC4uLL);
    if (v5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  bzero(a1, 0x2EC4uLL);
  if (!v4) {
    goto LABEL_17;
  }
LABEL_9:
  if (!v5) {
LABEL_10:
  }
    bzero(a1 + 23944, 0x2EC4uLL);
LABEL_11:
  if (*(unsigned char *)(a2 + 10) || v5 | v4)
  {
    int v6 = *(void (**)(uint64_t, char *, void))&a1[8 * ((*(_DWORD *)(a2 + 4) & 0x30000) == 0)
                                                           + 36720
                                                           + (*(_DWORD *)(a2 + 4) & 0x30)];
    v6(a2, a1, 0);
  }
}

__n128 sub_224B03FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = 0x100A00001;
  int v4 = (2 * (*(_DWORD *)(v3 + 36) & 1)) | 1;
  *(_DWORD *)(a1 + 4) = v4;
  unsigned int v5 = v4 & 0xFFFFFFF3 | (4 * (*(_DWORD *)(v3 + 88) & 3));
  *(_DWORD *)(a1 + 4) = v5;
  unsigned int v6 = v5 & 0xFFFFFFCF | (16 * (*(_DWORD *)(v3 + 92) & 3));
  *(_DWORD *)(a1 + 4) = v6;
  int v7 = ((*(unsigned char *)(v3 + 176) << 6) + 0x80) & 0xC0 | v6;
  *(_DWORD *)(a1 + 4) = v7;
  unsigned int v8 = v7 & 0xFFFFFCFF | ((*(_DWORD *)(v3 + 184) & 3) << 8);
  *(_DWORD *)(a1 + 4) = v8;
  unsigned int v9 = v8 & 0xFFFFFBFF | ((*(_DWORD *)(v3 + 212) & 1) << 10);
  *(_DWORD *)(a1 + 4) = v9;
  unsigned int v10 = v9 & 0xFFFFF7FF | ((*(_DWORD *)(v3 + 216) & 1) << 11);
  *(_DWORD *)(a1 + 4) = v10;
  unsigned int v11 = v10 & 0xFFFFEFFF | ((*(_DWORD *)(*(void *)a2 + 24) == 0) << 12);
  *(_DWORD *)(a1 + 4) = v11;
  unsigned int v12 = v11 & 0xFFFF1FFF | ((*(_DWORD *)(a2 + 68) & 7) << 13);
  *(_DWORD *)(a1 + 4) = v12;
  unsigned int v13 = v12 & 0xFFFEFFFF | ((*(_DWORD *)(a2 + 64) < 3) << 16);
  *(_DWORD *)(a1 + 4) = v13;
  *(_DWORD *)(a1 + 4) = v13 & 0xFFFDFFFF | ((*(_DWORD *)(a2 + 64) < 2) << 17);
  int v14 = *(_DWORD *)(v3 + 4);
  *(_WORD *)(a1 + 8) = *(_DWORD *)v3;
  *(unsigned char *)(a1 + 10) = v14;
  int v15 = *(_DWORD *)(v3 + 44);
  *(unsigned char *)(a1 + 39) = *(_DWORD *)(v3 + 40);
  *(unsigned char *)(a1 + 60) = v15;
  int v16 = (char *)(v3 + 9);
  do
  {
    uint64_t v17 = a1 + v2;
    *(unsigned char *)(v17 + 11) = *(v16 - 1);
    char v18 = *v16;
    v16 += 2;
    *(unsigned char *)(v17 + 25) = v18;
    ++v2;
  }
  while (v2 != 14);
  uint64_t v19 = (unsigned char *)(a1 + 40);
  uint64_t v20 = v3 + 69;
  uint64_t v21 = -20;
  do
  {
    *uint64_t v19 = *(unsigned char *)(v20 + v21 - 1);
    v19[10] = *(unsigned char *)(v20 + v21);
    v19[21] = *(unsigned char *)(v20 + v21 + 19);
    v19[31] = *(unsigned char *)(v20 + v21 + 20);
    ++v19;
    v21 += 2;
  }
  while (v21);
  long long v22 = *(_OWORD *)(v3 + 96);
  *(void *)(a1 + 97) = *(void *)(v3 + 112);
  *(_OWORD *)(a1 + 81) = v22;
  long long v23 = *(_OWORD *)(v3 + 120);
  *(_OWORD *)(a1 + 114) = *(_OWORD *)(v3 + 129);
  *(_OWORD *)(a1 + 105) = v23;
  __n128 result = *(__n128 *)(v3 + 148);
  *(_OWORD *)(a1 + 139) = *(_OWORD *)(v3 + 157);
  *(__n128 *)(a1 + 130) = result;
  int v25 = *(_DWORD *)(v3 + 192);
  *(unsigned char *)(a1 + 155) = *(_DWORD *)(v3 + 188);
  int v26 = *(_DWORD *)(v3 + 200);
  *(unsigned char *)(a1 + 156) = *(_DWORD *)(v3 + 196);
  int v28 = *(_DWORD *)(v3 + 204);
  int v27 = *(_DWORD *)(v3 + 208);
  *(_WORD *)(a1 + 158) = v28;
  *(unsigned char *)(a1 + 160) = v25;
  *(unsigned char *)(a1 + 161) = v26;
  *(_WORD *)(a1 + 162) = v27;
  return result;
}

uint64_t sub_224B04184(uint64_t a1, int32x2_t *a2, __CVBuffer *a3, uint64_t a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int v7 = (unsigned int *)a2[1];
  sub_224B03FF0((uint64_t)v36, (uint64_t)a2);
  CVPixelBufferLockBaseAddress(a3, 0);
  sub_224B03EF0((char *)a1, (uint64_t)v36);
  uint64_t v8 = 0;
  unsigned int v9 = (void *)(a1 + 36688);
  uint64_t v10 = a1 + 35916;
  do
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(a1 + 36792))(v36, v10, v8++);
    v10 += 256;
  }
  while (v8 != 3);
  int32x2_t v11 = vadd_s32(a2[7], (int32x2_t)0x1F0000001FLL);
  int32x2_t v12 = vsra_n_s32((int32x2_t)0xF0000000FLL, v11, 5uLL);
  uint64_t v13 = (int)(v12.i32[0] & 0xFFFFFFF0);
  *(void *)(a1 + 36712) = v13;
  unint64_t v14 = (int)(v12.i32[1] & 0xFFFFFFF0) * (uint64_t)(int)v13;
  int v16 = (char *)*v9;
  int v15 = *(char **)(a1 + 36696);
  unint64_t v17 = (uint64_t)&v15[-*v9] >> 2;
  if (v14 <= v17)
  {
    if (v14 >= v17) {
      goto LABEL_21;
    }
    int v27 = &v16[4 * v14];
    goto LABEL_20;
  }
  unint64_t v18 = v14 - v17;
  uint64_t v19 = *(void *)(a1 + 36704);
  if (v14 - v17 <= (v19 - (uint64_t)v15) >> 2)
  {
    bzero(*(void **)(a1 + 36696), 4 * v18);
    int v27 = &v15[4 * v18];
LABEL_20:
    *(void *)(a1 + 36696) = v27;
    goto LABEL_21;
  }
  if (v14 >> 62) {
    sub_224B043FC();
  }
  uint64_t v20 = v19 - (void)v16;
  if (v20 >> 1 > v14) {
    unint64_t v14 = v20 >> 1;
  }
  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v21 = v14;
  }
  if (v21 >> 62) {
    sub_224B0440C();
  }
  long long v22 = (char *)operator new(4 * v21);
  long long v23 = &v22[4 * v17];
  int v24 = &v22[4 * v21];
  bzero(v23, 4 * v18);
  int v25 = &v23[4 * v18];
  if (v15 != v16)
  {
    do
    {
      int v26 = *((_DWORD *)v15 - 1);
      v15 -= 4;
      *((_DWORD *)v23 - 1) = v26;
      v23 -= 4;
    }
    while (v15 != v16);
    int v15 = (char *)*v9;
  }
  *unsigned int v9 = v23;
  *(void *)(a1 + 36696) = v25;
  *(void *)(a1 + 36704) = v24;
  if (v15) {
    operator delete(v15);
  }
LABEL_21:
  int32x2_t v28 = vshr_n_s32(v11, 5uLL);
  (*(void (**)(void, void, void, void, void))(a1 + 36800))(*v9, *(void *)(a1 + 36712), v28.u32[0], v28.u32[1], *v7);
  int v29 = (a2[8].i32[1] - 8) >> 1;
  if (v29 >= 2) {
    int v29 = 2;
  }
  uint64_t v30 = a1 + 16 * (v29 & ~(v29 >> 31)) + 36808;
  uint64_t v31 = *(void (**)(void *, int32x2_t *, __CVBuffer *, uint64_t))v30;
  uint64_t v32 = *(void *)(v30 + 8);
  uint64_t v33 = (void *)(a1 + (v32 >> 1));
  if (v32) {
    uint64_t v31 = *(void (**)(void *, int32x2_t *, __CVBuffer *, uint64_t))(*v33 + v31);
  }
  v31(v33, a2, a3, a4);
  return CVPixelBufferUnlockBaseAddress(a3, 0);
}

void sub_224B043FC()
{
}

void sub_224B0440C()
{
  exceptiouint64_t n = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_224B04440()
{
  exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_224B04494(exception);
  __cxa_throw(exception, (struct type_info *)off_2646ECDA8, MEMORY[0x263F8C060]);
}

void sub_224B04480(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_224B04494(std::logic_error *a1)
{
  __n128 result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t sub_224B044D0(uint64_t a1, uint64_t a2, CVPixelBufferRef pixelBuffer, uint64_t a4)
{
  uint64_t v6 = a2;
  int v7 = *(_DWORD **)(a2 + 8);
  int v8 = *(_DWORD *)(a2 + 60);
  int v76 = *(_DWORD *)(a2 + 56);
  int v9 = *(_DWORD *)(a2 + 64);
  int v87 = v9 == 1;
  int v95 = v9;
  int v97 = v9 != 3;
  int v122 = v97;
  int v123 = v87;
  unint64_t v10 = *(void *)(a2 + 40);
  unint64_t v11 = *(void *)(a2 + 48);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  size_t v13 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  uint64_t result = (uint64_t)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  int v16 = v7;
  if (v7[54])
  {
    int v94 = 3760;
    if (*(_DWORD *)(*(void *)v6 + 24)) {
      int v17 = 3840;
    }
    else {
      int v17 = 3760;
    }
    int v99 = v17;
    int v110 = 256;
  }
  else
  {
    int v110 = 0;
    int v99 = 4095;
    int v94 = 4095;
  }
  char v18 = *(_DWORD *)(v6 + 68) - 8;
  int v121 = -(128 << v18);
  int v120 = (256 << v18) + ~(128 << v18);
  BOOL v19 = (int)v7[10] > 0 || v7[9] != 0;
  v119[0] = v19;
  BOOL v20 = (int)v7[11] > 0 || v7[9] != 0;
  v119[1] = v20;
  v118[0] = &v122;
  v118[1] = &v123;
  v118[2] = (int *)a1;
  v118[3] = &v121;
  v118[4] = &v120;
  if (v8 >= 1)
  {
    uint64_t v79 = 0;
    size_t v86 = v13 >> 1;
    LODWORD(v21) = (v76 + 31) >> 5;
    int v22 = (v8 + 31) >> 5;
    uint64_t v80 = 0x20u >> v97;
    uint64_t v71 = 0x20u >> v87;
    unint64_t v23 = v10 >> 1;
    unint64_t v85 = v11 >> 1;
    size_t v24 = BytesPerRowOfPlane >> 1;
    if ((int)v21 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v21;
    }
    uint64_t v82 = v21;
    if (v22 <= 1) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = v22;
    }
    uint64_t v75 = v25;
    uint64_t v77 = *(void *)(v6 + 16);
    double v78 = &BaseAddressOfPlane[2 * (a4 >> 32) * v24 + 2 * (int)a4];
    size_t v74 = v24 << 6;
    uint64_t v92 = 2 * v24;
    uint64_t v72 = v77;
    uint64_t v73 = v23 << 6;
    size_t v70 = result + 2 * ((v13 >> 1) * (SHIDWORD(a4) >> v87) + 2 * ((int)a4 >> v97));
    unint64_t v88 = v10 >> 1;
    uint64_t v91 = 2 * v23;
    uint64_t v109 = v7;
    uint64_t v90 = v6;
    do
    {
      if (v76 >= 1)
      {
        int v113 = 0;
        uint64_t v26 = 0;
        int v27 = *(_DWORD *)(v6 + 60) - 32 * v79;
        int v84 = v16[53];
        if (v79 != 0 && v84 != 0) {
          int v28 = 2;
        }
        else {
          int v28 = 0;
        }
        int v116 = v28;
        int v101 = *(_DWORD *)(v6 + 60) - 32 * v79;
        if (v27 >= 32) {
          uint64_t v29 = 32;
        }
        else {
          uint64_t v29 = v27;
        }
        uint64_t v107 = v29;
        uint64_t v111 = v77;
        int v105 = v78;
        do
        {
          uint64_t v103 = v26;
          if (v84) {
            BOOL v30 = v26 == 0;
          }
          else {
            BOOL v30 = 1;
          }
          if (v30) {
            int v31 = 0;
          }
          else {
            int v31 = 2;
          }
          if (v101 >= 1)
          {
            uint64_t v32 = 0;
            int v33 = *(_DWORD *)(v90 + 56);
            __int16 v34 = v105;
            int v115 = v33 - 32 * v26;
            uint64_t v35 = *(unsigned int *)(*(void *)(a1 + 36688) + 4 * (*(void *)(a1 + 36712) * (int)v79 + (int)v26));
            int v36 = v33 + v113;
            if (v36 >= 32) {
              int v36 = 32;
            }
            if (v36 <= 1) {
              uint64_t v37 = 1;
            }
            else {
              uint64_t v37 = v36;
            }
            uint64_t v38 = v111;
            do
            {
              if (v115 >= 1)
              {
                uint64_t v39 = 0;
                int v40 = v16[1];
                do
                {
                  unint64_t v41 = *(unsigned __int16 *)(v38 + 2 * v39);
                  if (v40 >= 1)
                  {
                    size_t v13 = v13 & 0xFFFFFFFF00000000 | v35;
                    uint64_t result = sub_224B04D20(v118, 0, v13, v39, v32, v31, v116);
                    if ((v41 >> 4) == 255) {
                      int v42 = *(unsigned __int8 *)(a1 + 36171);
                    }
                    else {
                      int v42 = *(unsigned __int8 *)(a1 + 35916 + (v41 >> 4))
                    }
                          + ((int)((*(unsigned __int8 *)(a1 + 35916 + (v41 >> 4) + 1)
                                  - *(unsigned __int8 *)(a1 + 35916 + (v41 >> 4)))
                                 * (v41 & 0xF)
                                 + 8) >> 4);
                    int v16 = v109;
                    int v43 = v109[22];
                    int v44 = 1 << (v43 - 1);
                    if (!v43) {
                      int v44 = 0;
                    }
                    int v45 = ((v44 + v42 * (int)result) >> v43) + v41;
                    __int16 v46 = v94;
                    if (v45 < v94) {
                      __int16 v46 = v45;
                    }
                    if (v45 <= v110) {
                      LOWORD(v41) = v110;
                    }
                    else {
                      LOWORD(v41) = v46;
                    }
                  }
                  *(_WORD *)&v34[2 * v39++] = 16 * v41;
                }
                while (v37 != v39);
              }
              ++v32;
              v34 += v92;
              v38 += v91;
            }
            while (v32 != v107);
          }
          uint64_t v26 = v103 + 1;
          v113 -= 32;
          v105 += 64;
          v111 += 64;
        }
        while (v103 + 1 != v82);
        uint64_t v6 = v90;
        if (v95)
        {
          uint64_t v47 = 0;
          uint64_t v114 = *(void *)(v90 + 24);
          uint64_t v112 = *(void *)(v90 + 32);
          int v81 = *(_DWORD *)(v90 + 56);
          uint64_t v89 = (((int)v107 + v87) >> v87);
          unsigned int v48 = 2u >> v87;
          if (v79 == 0 || v84 == 0) {
            unsigned int v48 = 0;
          }
          int v102 = v48;
          do
          {
            int v49 = v81 - 32 * v47;
            if (v49 >= 32) {
              int v49 = 32;
            }
            signed int v93 = v49;
            uint64_t v83 = v47;
            if (v84) {
              BOOL v50 = v47 == 0;
            }
            else {
              BOOL v50 = 1;
            }
            unsigned int v51 = 2u >> v97;
            if (v50) {
              unsigned int v51 = 0;
            }
            int v106 = v51;
            if ((int)v89 >= 1)
            {
              uint64_t v108 = 0;
              uint64_t v52 = v47 * v80;
              uint64_t v117 = v70 + 2 * v86 * v79 * v71 + 4 * v47 * v80;
              uint64_t v96 = v72 + ((v79 * v88) << 6) + (v47 << 6);
              uint64_t v98 = ((v93 + v97) >> v97);
              uint64_t v104 = *(unsigned int *)(*(void *)(a1 + 36688) + 4 * (*(void *)(a1 + 36712) * (int)v79 + (int)v47));
              do
              {
                if ((int)v98 >= 1)
                {
                  for (uint64_t i = 0; i != v98; ++i)
                  {
                    int v54 = (unsigned __int16 *)(v96 + 2 * (v88 * (int)(v108 << v87) + (int)(i << v97)));
                    unsigned int v55 = *v54;
                    uint64_t v56 = 2 * i;
                    if (v95 != 3 && (int)(v56 | 1) < v93) {
                      unsigned int v55 = (v55 + v54[1] + 1) >> 1;
                    }
                    uint64_t v57 = 0;
                    uint64_t v58 = v108 * v86 + v56;
                    do
                    {
                      uint64_t v59 = v57;
                      uint64_t v60 = v114;
                      if (v57) {
                        uint64_t v60 = v112;
                      }
                      int v61 = *(unsigned __int16 *)(v60 + 2 * v85 * v79 * v71 + 2 * v52 + 2 * (v108 * v85 + i));
                      if (v119[v57])
                      {
                        unsigned int v62 = v55;
                        if (!v16[9])
                        {
                          int v63 = ((int)(v16[v57 + 49] * v55 + v16[v57 + 47] * v61) >> 6) + 16 * v16[v57 + 51];
                          if (v63 >= 4095) {
                            int v63 = 4095;
                          }
                          unsigned int v62 = v63 & ~(v63 >> 31);
                        }
                        ++v57;
                        size_t v13 = v13 & 0xFFFFFFFF00000000 | v104;
                        uint64_t result = sub_224B04D20(v118, (int)v59 + 1, v13, i, v108, v106, v102);
                        unint64_t v64 = (unint64_t)v62 >> 4;
                        if (v64 == 255) {
                          int v65 = *(unsigned __int8 *)(a1 + (v57 << 8) + 36171);
                        }
                        else {
                          int v65 = *(unsigned __int8 *)(a1 + (v57 << 8) + 35916 + v64)
                        }
                              + ((int)((*(unsigned __int8 *)(a1 + (v57 << 8) + 35916 + v64 + 1)
                                      - *(unsigned __int8 *)(a1 + (v57 << 8) + 35916 + v64))
                                     * (v62 & 0xF)
                                     + 8) >> 4);
                        int v16 = v109;
                        int v66 = v109[22];
                        int v67 = 1 << (v66 - 1);
                        if (!v66) {
                          int v67 = 0;
                        }
                        int v68 = ((v67 + v65 * (int)result) >> v66) + v61;
                        __int16 v69 = v99;
                        if (v68 < v99) {
                          __int16 v69 = v68;
                        }
                        if (v68 <= v110) {
                          LOWORD(v61) = v110;
                        }
                        else {
                          LOWORD(v61) = v69;
                        }
                      }
                      else
                      {
                        ++v57;
                      }
                      *(_WORD *)(v117 + 2 * (v58 + v59)) = 16 * v61;
                    }
                    while (!v59);
                  }
                }
                ++v108;
                uint64_t v6 = v90;
              }
              while (v108 != v89);
            }
            uint64_t v47 = v83 + 1;
          }
          while (v83 + 1 != v82);
        }
      }
      v78 += v74;
      ++v79;
      v77 += v73;
    }
    while (v79 != v75);
  }
  return result;
}

uint64_t sub_224B04D20(int **a1, int a2, unint64_t a3, int a4, int a5, int a6, int a7)
{
  unint64_t v7 = a3 >> 8;
  int v8 = a1[2];
  if (a2)
  {
    int v9 = **a1;
    int v10 = *a1[1];
  }
  else
  {
    int v9 = 0;
    int v10 = 0;
  }
  unsigned int v11 = 0x20u >> v9;
  int32x2_t v12 = (unsigned __int8 *)&unk_224B28EC0 + 2 * v9;
  int v13 = a3 >> 4;
  int v14 = a3 & 0xF;
  int v15 = v13 + 6;
  int v16 = 2 * v13 + 9;
  if (v9) {
    int v16 = v15;
  }
  int v17 = v14 + 6;
  int v18 = 2 * v14 + 9;
  if (!v10) {
    int v17 = v18;
  }
  uint64_t v20 = *((__int16 *)&v8[2993 * a2 + 41 * v17 + 41 * a5] + v16 + a4);
  if (a5 >= a7)
  {
    if (a4 < a6)
    {
      int v58 = v11 + a4;
      int v59 = BYTE1(a3) >> 4;
      int v60 = BYTE1(a3) & 0xF;
      int v61 = v59 + 6;
      int v62 = 2 * v59 + 9;
      if (v9) {
        int v63 = v61;
      }
      else {
        int v63 = v62;
      }
      int v64 = v60 + 6;
      int v65 = 2 * v60 + 9;
      if (v10) {
        int v65 = v64;
      }
      int v66 = *((__int16 *)&v8[2993 * a2 + 41 * v65 + 41 * a5] + v58 + v63);
      int v67 = v12[a4];
      if (!a4) {
        ++v12;
      }
      int v68 = *v12 * v20;
      int v69 = *a1[3];
      int v70 = (v68 + v67 * v66 + 16) >> 5;
      if (v70 >= *a1[4]) {
        unsigned int v71 = *a1[4];
      }
      else {
        unsigned int v71 = v70;
      }
      if (v70 <= v69) {
        return v69;
      }
      else {
        return v71;
      }
    }
  }
  else
  {
    uint64_t v21 = (unsigned __int8 *)&unk_224B28EC0 + 2 * v10;
    int v22 = (0x20u >> v10) + a5;
    unsigned int v23 = (a3 >> 20) & 0xF;
    unsigned int v24 = WORD1(a3) & 0xF;
    int v25 = v23 + 6;
    int v26 = 2 * v23 + 9;
    if (v9) {
      int v26 = v25;
    }
    int v27 = v24 + 6;
    int v28 = 2 * v24 + 9;
    if (v10) {
      int v28 = v27;
    }
    int v29 = *((__int16 *)&v8[2993 * a2 + 41 * v28 + 41 * v22] + v26 + a4);
    if (a4 >= a6)
    {
      int v53 = *a1[3];
      int v54 = *a1[4];
    }
    else
    {
      int v30 = v11 + a4;
      unsigned int v31 = a3 >> 28;
      unsigned int v32 = BYTE3(a3) & 0xF;
      unsigned int v33 = v31 + 6;
      int v34 = 2 * v31 + 9;
      BOOL v35 = v9 == 0;
      if (v9) {
        int v36 = v33;
      }
      else {
        int v36 = v34;
      }
      unsigned int v37 = v32 + 6;
      int v38 = 2 * v32 + 9;
      int v39 = v7 >> 4;
      int v40 = v39 + 6;
      int v41 = 2 * v39 + 9;
      if (!v35) {
        int v41 = v40;
      }
      BOOL v42 = v10 == 0;
      if (v10) {
        int v43 = v37;
      }
      else {
        int v43 = v38;
      }
      int v44 = &v8[2993 * a2];
      int v45 = *((__int16 *)&v44[41 * v43 + 41 * v22] + v36 + v30);
      int v46 = v7 & 0xF;
      int v47 = v46 + 6;
      int v48 = 2 * v46 + 9;
      if (!v42) {
        int v48 = v47;
      }
      int v49 = *((__int16 *)&v44[41 * v48 + 41 * a5] + v41 + v30);
      int v50 = v12[a4];
      if (a4) {
        unsigned int v51 = v12;
      }
      else {
        unsigned int v51 = v12 + 1;
      }
      int v52 = *v51;
      int v53 = *a1[3];
      int v54 = *a1[4];
      int v55 = (v52 * v29 + v50 * v45 + 16) >> 5;
      if (v55 >= v54) {
        int v29 = *a1[4];
      }
      else {
        int v29 = v55;
      }
      if (v55 <= v53) {
        int v29 = *a1[3];
      }
      int v56 = (v52 * (int)v20 + v50 * v49 + 16) >> 5;
      if (v56 >= v54) {
        int v57 = *a1[4];
      }
      else {
        int v57 = v56;
      }
      if (v56 <= v53) {
        LODWORD(v20) = *a1[3];
      }
      else {
        LODWORD(v20) = v57;
      }
    }
    int v72 = v21[a5];
    if (!a5) {
      ++v21;
    }
    int v73 = (int)(v20 * *v21 + v29 * v72 + 16) >> 5;
    if (v73 < v54) {
      int v54 = v73;
    }
    if (v73 <= v53) {
      return v53;
    }
    else {
      return v54;
    }
  }
  return v20;
}

uint64_t sub_224B04FD8(uint64_t a1, uint64_t a2, CVPixelBufferRef pixelBuffer, uint64_t a4)
{
  uint64_t v6 = a2;
  unint64_t v7 = *(_DWORD **)(a2 + 8);
  int v8 = *(_DWORD *)(a2 + 60);
  int v76 = *(_DWORD *)(a2 + 56);
  int v9 = *(_DWORD *)(a2 + 64);
  int v87 = v9 == 1;
  int v95 = v9;
  int v97 = v9 != 3;
  int v122 = v97;
  int v123 = v87;
  unint64_t v10 = *(void *)(a2 + 40);
  unint64_t v11 = *(void *)(a2 + 48);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  size_t v13 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  uint64_t result = (uint64_t)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  int v16 = v7;
  if (v7[54])
  {
    int v94 = 940;
    if (*(_DWORD *)(*(void *)v6 + 24)) {
      int v17 = 960;
    }
    else {
      int v17 = 940;
    }
    int v99 = v17;
    int v110 = 64;
  }
  else
  {
    int v110 = 0;
    int v99 = 1023;
    int v94 = 1023;
  }
  char v18 = *(_DWORD *)(v6 + 68) - 8;
  int v121 = -(128 << v18);
  int v120 = (256 << v18) + ~(128 << v18);
  BOOL v19 = (int)v7[10] > 0 || v7[9] != 0;
  v119[0] = v19;
  BOOL v20 = (int)v7[11] > 0 || v7[9] != 0;
  v119[1] = v20;
  v118[0] = &v122;
  v118[1] = &v123;
  v118[2] = (int *)a1;
  v118[3] = &v121;
  v118[4] = &v120;
  if (v8 >= 1)
  {
    uint64_t v79 = 0;
    size_t v86 = v13 >> 1;
    LODWORD(v21) = (v76 + 31) >> 5;
    int v22 = (v8 + 31) >> 5;
    uint64_t v80 = 0x20u >> v97;
    uint64_t v71 = 0x20u >> v87;
    unint64_t v23 = v10 >> 1;
    unint64_t v85 = v11 >> 1;
    size_t v24 = BytesPerRowOfPlane >> 1;
    if ((int)v21 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v21;
    }
    uint64_t v82 = v21;
    if (v22 <= 1) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = v22;
    }
    uint64_t v75 = v25;
    uint64_t v77 = *(void *)(v6 + 16);
    double v78 = &BaseAddressOfPlane[2 * (a4 >> 32) * v24 + 2 * (int)a4];
    size_t v74 = v24 << 6;
    uint64_t v92 = 2 * v24;
    uint64_t v72 = v77;
    uint64_t v73 = v23 << 6;
    size_t v70 = result + 2 * ((v13 >> 1) * (SHIDWORD(a4) >> v87) + 2 * ((int)a4 >> v97));
    unint64_t v88 = v10 >> 1;
    uint64_t v91 = 2 * v23;
    uint64_t v109 = v7;
    uint64_t v90 = v6;
    do
    {
      if (v76 >= 1)
      {
        int v113 = 0;
        uint64_t v26 = 0;
        int v27 = *(_DWORD *)(v6 + 60) - 32 * v79;
        int v84 = v16[53];
        if (v79 != 0 && v84 != 0) {
          int v28 = 2;
        }
        else {
          int v28 = 0;
        }
        int v116 = v28;
        int v101 = *(_DWORD *)(v6 + 60) - 32 * v79;
        if (v27 >= 32) {
          uint64_t v29 = 32;
        }
        else {
          uint64_t v29 = v27;
        }
        uint64_t v107 = v29;
        uint64_t v111 = v77;
        int v105 = v78;
        do
        {
          uint64_t v103 = v26;
          if (v84) {
            BOOL v30 = v26 == 0;
          }
          else {
            BOOL v30 = 1;
          }
          if (v30) {
            int v31 = 0;
          }
          else {
            int v31 = 2;
          }
          if (v101 >= 1)
          {
            uint64_t v32 = 0;
            int v33 = *(_DWORD *)(v90 + 56);
            int v34 = v105;
            int v115 = v33 - 32 * v26;
            uint64_t v35 = *(unsigned int *)(*(void *)(a1 + 36688) + 4 * (*(void *)(a1 + 36712) * (int)v79 + (int)v26));
            int v36 = v33 + v113;
            if (v36 >= 32) {
              int v36 = 32;
            }
            if (v36 <= 1) {
              uint64_t v37 = 1;
            }
            else {
              uint64_t v37 = v36;
            }
            uint64_t v38 = v111;
            do
            {
              if (v115 >= 1)
              {
                uint64_t v39 = 0;
                int v40 = v16[1];
                do
                {
                  unint64_t v41 = *(unsigned __int16 *)(v38 + 2 * v39);
                  if (v40 >= 1)
                  {
                    size_t v13 = v13 & 0xFFFFFFFF00000000 | v35;
                    uint64_t result = sub_224B04D20(v118, 0, v13, v39, v32, v31, v116);
                    if ((v41 >> 2) == 255) {
                      int v42 = *(unsigned __int8 *)(a1 + 36171);
                    }
                    else {
                      int v42 = *(unsigned __int8 *)(a1 + 35916 + (v41 >> 2))
                    }
                          + ((int)((*(unsigned __int8 *)(a1 + 35916 + (v41 >> 2) + 1)
                                  - *(unsigned __int8 *)(a1 + 35916 + (v41 >> 2)))
                                 * (v41 & 3)
                                 + 2) >> 2);
                    int v16 = v109;
                    int v43 = v109[22];
                    int v44 = 1 << (v43 - 1);
                    if (!v43) {
                      int v44 = 0;
                    }
                    int v45 = ((v44 + v42 * (int)result) >> v43) + v41;
                    __int16 v46 = v94;
                    if (v45 < v94) {
                      __int16 v46 = v45;
                    }
                    if (v45 <= v110) {
                      LOWORD(v41) = v110;
                    }
                    else {
                      LOWORD(v41) = v46;
                    }
                  }
                  *(_WORD *)&v34[2 * v39++] = (_WORD)v41 << 6;
                }
                while (v37 != v39);
              }
              ++v32;
              v34 += v92;
              v38 += v91;
            }
            while (v32 != v107);
          }
          uint64_t v26 = v103 + 1;
          v113 -= 32;
          v105 += 64;
          v111 += 64;
        }
        while (v103 + 1 != v82);
        uint64_t v6 = v90;
        if (v95)
        {
          uint64_t v47 = 0;
          uint64_t v114 = *(void *)(v90 + 24);
          uint64_t v112 = *(void *)(v90 + 32);
          int v81 = *(_DWORD *)(v90 + 56);
          uint64_t v89 = (((int)v107 + v87) >> v87);
          unsigned int v48 = 2u >> v87;
          if (v79 == 0 || v84 == 0) {
            unsigned int v48 = 0;
          }
          int v102 = v48;
          do
          {
            int v49 = v81 - 32 * v47;
            if (v49 >= 32) {
              int v49 = 32;
            }
            signed int v93 = v49;
            uint64_t v83 = v47;
            if (v84) {
              BOOL v50 = v47 == 0;
            }
            else {
              BOOL v50 = 1;
            }
            unsigned int v51 = 2u >> v97;
            if (v50) {
              unsigned int v51 = 0;
            }
            int v106 = v51;
            if ((int)v89 >= 1)
            {
              uint64_t v108 = 0;
              uint64_t v52 = v47 * v80;
              uint64_t v117 = v70 + 2 * v86 * v79 * v71 + 4 * v47 * v80;
              uint64_t v96 = v72 + ((v79 * v88) << 6) + (v47 << 6);
              uint64_t v98 = ((v93 + v97) >> v97);
              uint64_t v104 = *(unsigned int *)(*(void *)(a1 + 36688) + 4 * (*(void *)(a1 + 36712) * (int)v79 + (int)v47));
              do
              {
                if ((int)v98 >= 1)
                {
                  for (uint64_t i = 0; i != v98; ++i)
                  {
                    int v54 = (unsigned __int16 *)(v96 + 2 * (v88 * (int)(v108 << v87) + (int)(i << v97)));
                    unsigned int v55 = *v54;
                    uint64_t v56 = 2 * i;
                    if (v95 != 3 && (int)(v56 | 1) < v93) {
                      unsigned int v55 = (v55 + v54[1] + 1) >> 1;
                    }
                    uint64_t v57 = 0;
                    uint64_t v58 = v108 * v86 + v56;
                    do
                    {
                      uint64_t v59 = v57;
                      uint64_t v60 = v114;
                      if (v57) {
                        uint64_t v60 = v112;
                      }
                      int v61 = *(unsigned __int16 *)(v60 + 2 * v85 * v79 * v71 + 2 * v52 + 2 * (v108 * v85 + i));
                      if (v119[v57])
                      {
                        unsigned int v62 = v55;
                        if (!v16[9])
                        {
                          int v63 = ((int)(v16[v57 + 49] * v55 + v16[v57 + 47] * v61) >> 6) + 4 * v16[v57 + 51];
                          if (v63 >= 1023) {
                            int v63 = 1023;
                          }
                          unsigned int v62 = v63 & ~(v63 >> 31);
                        }
                        ++v57;
                        size_t v13 = v13 & 0xFFFFFFFF00000000 | v104;
                        uint64_t result = sub_224B04D20(v118, (int)v59 + 1, v13, i, v108, v106, v102);
                        unint64_t v64 = (unint64_t)v62 >> 2;
                        if (v64 == 255) {
                          int v65 = *(unsigned __int8 *)(a1 + (v57 << 8) + 36171);
                        }
                        else {
                          int v65 = *(unsigned __int8 *)(a1 + (v57 << 8) + 35916 + v64)
                        }
                              + ((int)((*(unsigned __int8 *)(a1 + (v57 << 8) + 35916 + v64 + 1)
                                      - *(unsigned __int8 *)(a1 + (v57 << 8) + 35916 + v64))
                                     * (v62 & 3)
                                     + 2) >> 2);
                        int v16 = v109;
                        int v66 = v109[22];
                        int v67 = 1 << (v66 - 1);
                        if (!v66) {
                          int v67 = 0;
                        }
                        int v68 = ((v67 + v65 * (int)result) >> v66) + v61;
                        __int16 v69 = v99;
                        if (v68 < v99) {
                          __int16 v69 = v68;
                        }
                        if (v68 <= v110) {
                          LOWORD(v61) = v110;
                        }
                        else {
                          LOWORD(v61) = v69;
                        }
                      }
                      else
                      {
                        ++v57;
                      }
                      *(_WORD *)(v117 + 2 * (v58 + v59)) = (_WORD)v61 << 6;
                    }
                    while (!v59);
                  }
                }
                ++v108;
                uint64_t v6 = v90;
              }
              while (v108 != v89);
            }
            uint64_t v47 = v83 + 1;
          }
          while (v83 + 1 != v82);
        }
      }
      v78 += v74;
      ++v79;
      v77 += v73;
    }
    while (v79 != v75);
  }
  return result;
}

uint64_t sub_224B05828(uint64_t a1, uint64_t a2, CVPixelBufferRef pixelBuffer, uint64_t a4)
{
  uint64_t v7 = a2;
  int v8 = *(int **)(a2 + 8);
  int v9 = *(_DWORD *)(a2 + 60);
  int v65 = *(_DWORD *)(a2 + 56);
  int v10 = *(_DWORD *)(a2 + 64);
  int v77 = v10 == 1;
  int v83 = v10;
  int v85 = v10 != 3;
  int v108 = v85;
  int v109 = v77;
  uint64_t v80 = *(void *)(a2 + 40);
  uint64_t v75 = *(void *)(a2 + 48);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  size_t v76 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  uint64_t result = (uint64_t)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  size_t v13 = v8;
  if (v8[54])
  {
    int v82 = 235;
    if (*(_DWORD *)(*(void *)v7 + 24)) {
      int v14 = 240;
    }
    else {
      int v14 = 235;
    }
    int v87 = v14;
    int v96 = 16;
  }
  else
  {
    int v96 = 0;
    int v87 = 255;
    int v82 = 255;
  }
  char v15 = *(_DWORD *)(v7 + 68) - 8;
  int v107 = -(128 << v15);
  int v106 = (256 << v15) + ~(128 << v15);
  BOOL v16 = v8[10] > 0 || v8[9] != 0;
  v105[0] = v16;
  BOOL v17 = v8[11] > 0 || v8[9] != 0;
  v105[1] = v17;
  v104[0] = &v108;
  v104[1] = &v109;
  v104[2] = (int *)a1;
  v104[3] = &v107;
  v104[4] = &v106;
  if (v9 >= 1)
  {
    uint64_t v67 = 0;
    uint64_t v73 = 0;
    int v66 = &BaseAddressOfPlane[BytesPerRowOfPlane * (a4 >> 32) + (int)a4];
    int v18 = (v65 + 31) >> 5;
    int v19 = (v9 + 31) >> 5;
    uint64_t v68 = 0x20u >> v85;
    size_t v62 = result + v76 * (SHIDWORD(a4) >> v77) + 2 * ((int)a4 >> v85);
    uint64_t v63 = 0x20u >> v77;
    if (v18 <= 1) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v18;
    }
    uint64_t v70 = v20;
    if (v19 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v19;
    }
    uint64_t v64 = v21;
    int v95 = v8;
    uint64_t v74 = v7;
    do
    {
      if (v65 >= 1)
      {
        int v99 = 0;
        uint64_t v22 = 0;
        uint64_t v23 = *(void *)(v7 + 16);
        uint64_t v69 = v23 + 32 * v73 * v80;
        int v72 = 32 * v73;
        uint64_t v97 = v23 + v67;
        signed int v93 = v66;
        do
        {
          LODWORD(v24) = *(_DWORD *)(v7 + 60) - v72;
          uint64_t v91 = v22;
          if (v22 != 0 && v13[53] != 0) {
            int v25 = 2;
          }
          else {
            int v25 = 0;
          }
          if (v73 != 0 && v13[53] != 0) {
            int v26 = 2;
          }
          else {
            int v26 = 0;
          }
          if ((int)v24 >= 1)
          {
            uint64_t v27 = 0;
            if ((int)v24 >= 32) {
              uint64_t v24 = 32;
            }
            else {
              uint64_t v24 = v24;
            }
            uint64_t v102 = v24;
            int v28 = *(_DWORD *)(v74 + 56);
            uint64_t v29 = v93;
            int v101 = v28 - 32 * v22;
            uint64_t v30 = *(unsigned int *)(*(void *)(a1 + 36688) + 4 * (*(void *)(a1 + 36712) * (int)v73 + (int)v22));
            int v31 = v28 + v99;
            if (v31 >= 32) {
              int v31 = 32;
            }
            if (v31 <= 1) {
              uint64_t v32 = 1;
            }
            else {
              uint64_t v32 = v31;
            }
            uint64_t v33 = v97;
            do
            {
              if (v101 >= 1)
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  unsigned int v35 = *(unsigned __int8 *)(v33 + i);
                  if (v13[1] >= 1)
                  {
                    unint64_t v4 = v4 & 0xFFFFFFFF00000000 | v30;
                    uint64_t result = sub_224B04D20(v104, 0, v4, i, v27, v25, v26);
                    size_t v13 = v95;
                    int v36 = v95[22];
                    int v37 = 1 << (v36 - 1);
                    if (!v36) {
                      int v37 = 0;
                    }
                    int v38 = ((int)(v37 + result * *(unsigned __int8 *)(a1 + 35916 + v35)) >> v36) + v35;
                    char v39 = v82;
                    if (v38 < v82) {
                      char v39 = v38;
                    }
                    if (v38 <= v96) {
                      LOBYTE(v35) = v96;
                    }
                    else {
                      LOBYTE(v35) = v39;
                    }
                  }
                  v29[i] = v35;
                }
              }
              ++v27;
              v29 += BytesPerRowOfPlane;
              v33 += v80;
            }
            while (v27 != v102);
          }
          uint64_t v22 = v91 + 1;
          v99 -= 32;
          v93 += 32;
          v97 += 32;
          uint64_t v7 = v74;
        }
        while (v91 + 1 != v70);
        if (v83)
        {
          uint64_t v40 = 0;
          uint64_t v100 = *(void *)(v74 + 24);
          uint64_t v98 = *(void *)(v74 + 32);
          do
          {
            int v41 = *(_DWORD *)(v7 + 60);
            int v42 = *(_DWORD *)(v7 + 56) - 32 * v40;
            if (v42 >= 32) {
              int v42 = 32;
            }
            signed int v81 = v42;
            int v43 = v41 - v72;
            if (v41 - v72 >= 32) {
              int v43 = 32;
            }
            uint64_t v71 = v40;
            unsigned int v44 = 2u >> v85;
            if (v40 == 0 || v13[53] == 0) {
              unsigned int v44 = 0;
            }
            int v92 = v44;
            unsigned int v45 = 2u >> v77;
            if (v73 == 0 || v13[53] == 0) {
              unsigned int v45 = 0;
            }
            int v90 = v45;
            uint64_t v78 = ((v43 + v77) >> v77);
            if ((v43 + v77) >> v77 >= 1)
            {
              uint64_t v94 = 0;
              uint64_t v46 = v40 * v68;
              uint64_t v103 = v62 + v76 * v73 * v63 + 2 * v40 * v68;
              uint64_t v84 = v69 + 32 * v40;
              uint64_t v86 = ((v81 + v85) >> v85);
              uint64_t v89 = *(unsigned int *)(*(void *)(a1 + 36688) + 4 * (*(void *)(a1 + 36712) * (int)v73 + (int)v40));
              do
              {
                if ((int)v86 >= 1)
                {
                  for (uint64_t j = 0; j != v86; ++j)
                  {
                    unsigned int v48 = (unsigned __int8 *)(v84 + v80 * (int)(v94 << v77) + (int)(j << v85));
                    unsigned int v49 = *v48;
                    uint64_t v50 = 2 * j;
                    if (v83 != 3 && (int)(v50 | 1) < v81) {
                      unsigned int v49 = (v49 + v48[1] + 1) >> 1;
                    }
                    uint64_t v51 = 0;
                    size_t v52 = v94 * v76 + v50;
                    do
                    {
                      uint64_t v53 = v51;
                      uint64_t v54 = v100;
                      if (v51) {
                        uint64_t v54 = v98;
                      }
                      int v55 = *(unsigned __int8 *)(v54 + v75 * v73 * v63 + v46 + v94 * v75 + j);
                      if (v105[v51])
                      {
                        unsigned int v56 = v49;
                        if (!v13[9])
                        {
                          int v57 = v13[v51 + 51] + ((int)(v13[v51 + 49] * v49 + v13[v51 + 47] * v55) >> 6);
                          if (v57 >= 255) {
                            int v57 = 255;
                          }
                          unsigned int v56 = v57 & ~(v57 >> 31);
                        }
                        ++v51;
                        unint64_t v4 = v4 & 0xFFFFFFFF00000000 | v89;
                        uint64_t result = sub_224B04D20(v104, (int)v53 + 1, v4, j, v94, v92, v90);
                        size_t v13 = v95;
                        int v58 = v95[22];
                        int v59 = 1 << (v58 - 1);
                        if (!v58) {
                          int v59 = 0;
                        }
                        int v60 = ((int)(v59 + result * *(unsigned __int8 *)(a1 + (v51 << 8) + v56 + 35916)) >> v58) + v55;
                        char v61 = v87;
                        if (v60 < v87) {
                          char v61 = v60;
                        }
                        if (v60 <= v96) {
                          LOBYTE(v55) = v96;
                        }
                        else {
                          LOBYTE(v55) = v61;
                        }
                      }
                      else
                      {
                        ++v51;
                      }
                      *(unsigned char *)(v103 + v52 + v53) = v55;
                    }
                    while (!v53);
                  }
                }
                ++v94;
              }
              while (v94 != v78);
            }
            uint64_t v40 = v71 + 1;
            uint64_t v7 = v74;
          }
          while (v71 + 1 != v70);
        }
      }
      v66 += 32 * BytesPerRowOfPlane;
      v67 += 32 * v80;
      ++v73;
    }
    while (v73 != v64);
  }
  return result;
}

uint64_t sub_224B05FD4(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  if (a4 >= 1)
  {
    int v5 = 0;
    uint64_t v6 = -a2;
    uint64_t v7 = 4 * a2;
    uint64_t v8 = -4 * a2;
    do
    {
      if (a3 >= 1)
      {
        uint64_t v9 = 0;
        unsigned int v10 = (9472 * (_WORD)v5 - 19968) & 0xFF00 ^ a5 ^ (105 - 83 * v5);
        uint64_t v11 = result + v8;
        do
        {
          *(_DWORD *)(result + v9) = 0;
          unsigned int v10 = (v10 >> 1) & 0xFFFF7FFF | ((((v10 ^ (v10 >> 3) ^ (v10 >> 12)) ^ (v10 >> 1)) & 1) << 15);
          *(unsigned char *)(result + v9) = BYTE1(v10);
          if (v9)
          {
            uint64_t v12 = result + v9;
            *(unsigned char *)(result + v9 + 1) = *(unsigned char *)(result + v9 - 4);
            if (v5)
            {
              *(unsigned char *)(v12 + 2) = *(unsigned char *)(v11 + v9);
              *(unsigned char *)(v12 + 3) = *(unsigned char *)(v11 + v9 - 4);
            }
          }
          else if (v5)
          {
            *(unsigned char *)(result + 2) = *(unsigned char *)(result + 4 * v6);
          }
          v9 += 4;
        }
        while (4 * a3 != v9);
      }
      result += v7;
      ++v5;
    }
    while (v5 != a4);
  }
  return result;
}

double sub_224B060B0(unsigned char *a1, _OWORD *a2, int a3)
{
  if (a1[10] >= 0xEu) {
    int v3 = 14;
  }
  else {
    int v3 = a1[10];
  }
  unint64_t v4 = a1 + 11;
  int v5 = a1 + 25;
  if (a3 && (a1[4] & 2) == 0)
  {
    if (a3 != 1)
    {
      if (a1[60] >= 0xAu) {
        int v3 = 10;
      }
      else {
        int v3 = a1[60];
      }
      if (a1[60])
      {
        unint64_t v4 = a1 + 61;
        int v5 = a1 + 71;
        if (v3) {
          goto LABEL_13;
        }
      }
LABEL_42:
      double result = 0.0;
      a2[14] = 0u;
      a2[15] = 0u;
      a2[12] = 0u;
      a2[13] = 0u;
      a2[10] = 0u;
      a2[11] = 0u;
      a2[8] = 0u;
      a2[9] = 0u;
      a2[6] = 0u;
      a2[7] = 0u;
      a2[4] = 0u;
      a2[5] = 0u;
      a2[2] = 0u;
      a2[3] = 0u;
      *a2 = 0u;
      a2[1] = 0u;
      return result;
    }
    if (a1[39] >= 0xAu) {
      int v3 = 10;
    }
    else {
      int v3 = a1[39];
    }
    if (!a1[39]) {
      goto LABEL_42;
    }
    unint64_t v4 = a1 + 40;
    int v5 = a1 + 50;
  }
  if (!v3) {
    goto LABEL_42;
  }
LABEL_13:
  unsigned int v6 = *v4;
  if (*v4)
  {
    uint64_t v7 = a2;
    uint64_t v8 = *v4;
    do
    {
      *v7++ = *v5;
      --v8;
    }
    while (v8);
  }
  uint64_t v9 = (v3 - 1);
  if (v3 < 2)
  {
    unsigned int v13 = v6;
  }
  else
  {
    uint64_t v10 = 0;
    int64x2_t v11 = vdupq_n_s64(2uLL);
    do
    {
      uint64_t v12 = v10 + 1;
      unsigned int v13 = v4[v10 + 1];
      LODWORD(v14) = 256 - v6;
      if ((int)(v13 - v6) < (int)(256 - v6)) {
        LODWORD(v14) = v13 - v6;
      }
      if ((int)(v13 - v6) >= 1 && v14 != 0)
      {
        int v16 = v5[v10];
        int v17 = (((int)v14 >> 1) + 0x10000) / (int)v14;
        if ((int)v14 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v14;
        }
        uint64x2_t v18 = (uint64x2_t)vdupq_n_s64(v14 - 1);
        uint64_t v19 = (v14 + 1) & 0xFFFFFFFE;
        uint64_t v20 = (char *)a2 + v6 + 1;
        int v21 = v17 * (v5[v12] - v16);
        int v22 = 0x8000;
        int64x2_t v23 = (int64x2_t)xmmword_224B15990;
        do
        {
          int32x2_t v24 = vmovn_s64((int64x2_t)vcgeq_u64(v18, (uint64x2_t)v23));
          if (v24.i8[0]) {
            *(v20 - 1) = v16 + BYTE2(v22);
          }
          if (v24.i8[4]) {
            *uint64_t v20 = v16 + ((v21 + v22) >> 16);
          }
          int64x2_t v23 = vaddq_s64(v23, v11);
          v20 += 2;
          v22 += 2 * v21;
          v19 -= 2;
        }
        while (v19);
      }
      uint64_t v10 = v12;
      unsigned int v6 = v13;
    }
    while (v12 != v9);
  }
  memset((char *)a2 + v13, v5[v9], 256 - v13);
  return result;
}

uint64_t sub_224B06260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  unsigned int v4 = *(_DWORD *)(a1 + 4);
  int v5 = (v4 >> 17) & 1;
  unsigned int v6 = (long long *)(a2 + 1494);
  do
  {
    uint64_t v7 = (_OWORD *)(a3 + v3);
    long long v8 = *v6;
    long long v9 = v6[1];
    long long v10 = v6[3];
    v7[2] = v6[2];
    v7[3] = v10;
    *uint64_t v7 = v8;
    v7[1] = v9;
    long long v11 = v6[4];
    long long v12 = v6[5];
    long long v13 = v6[7];
    v7[6] = v6[6];
    v7[7] = v13;
    v7[4] = v11;
    v7[5] = v12;
    v3 += 128;
    unsigned int v6 = (long long *)((char *)v6 + 164);
  }
  while (v3 != 0x2000);
  uint64_t v14 = 0;
  uint64_t v15 = 1476;
  if (v5) {
    uint64_t v15 = 984;
  }
  int v17 = HIWORD(v4) & 1;
  BOOL v16 = v17 == 0;
  LODWORD(v18) = 0x40u >> v17;
  LODWORD(v19) = 0x40u >> v5;
  uint64_t v20 = 18;
  if (!v16) {
    uint64_t v20 = 12;
  }
  int v21 = (_WORD *)(a3 + 0x2000);
  if (v18 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v18;
  }
  if (v19 <= 1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v19;
  }
  uint64_t v22 = v15 + a2 + v20;
  int64x2_t v23 = (__int16 *)(v22 + 11972);
  int32x2_t v24 = (unsigned __int16 *)(v22 + 23944);
  do
  {
    int v25 = v24;
    int v26 = v21;
    uint64_t v27 = v23;
    uint64_t v28 = v18;
    do
    {
      __int16 v29 = *v27++;
      *int v26 = v29;
      unsigned int v31 = *v25++;
      uint64_t result = v31;
      v26[1] = v31;
      v26 += 2;
      --v28;
    }
    while (v28);
    ++v14;
    v23 += 82;
    v21 += 128;
    v24 += 82;
  }
  while (v14 != v19);
  return result;
}

uint64_t sub_224B0634C(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(unsigned int *)(result + 4);
  int v4 = (unsigned __int16)v3 >> 13;
  int v5 = *(unsigned __int8 *)(result + 39);
  unsigned int v6 = ((v3 >> 8) & 3) - v4;
  int v7 = *(unsigned __int8 *)(result + 60);
  unsigned int v8 = v6 + 4;
  unint64_t v108 = v3 & 0x10000;
  uint64_t v9 = 44;
  if ((v3 & 0x10000) == 0) {
    uint64_t v9 = 82;
  }
  uint64_t v110 = v9;
  int v10 = *(unsigned __int16 *)(result + 8);
  unint64_t v107 = v3 & 0x20000;
  uint64_t v11 = 38;
  if ((v3 & 0x20000) == 0) {
    uint64_t v11 = 73;
  }
  uint64_t v112 = v11;
  int v123 = -(128 << v4);
  int v122 = (256 << v4) + ~(128 << v4);
  char v12 = v3 >> 6;
  char v121 = (v3 >> 6) + 6;
  uint64_t v13 = (v3 >> 4) & 3;
  int v126 = *(unsigned __int8 *)(result + 10);
  if (*(unsigned char *)(result + 10))
  {
    int v14 = 0;
    if (v6 == -4) {
      int v15 = 0;
    }
    else {
      int v15 = 1 << (v6 + 3);
    }
    uint64_t v16 = a2 - 166 * ((v3 >> 4) & 3) + 498;
    int v17 = 4;
    uint64_t v18 = 3;
    unsigned int v19 = *(unsigned __int16 *)(result + 8);
    do
    {
      if (v18 >= v14)
      {
        uint64_t v20 = v14;
        uint64_t v21 = a2 + 164 * v14;
        do
        {
          for (uint64_t i = 0; i != 164; i += 2)
          {
            unsigned int v19 = (v19 >> 1) & 0xFFFF7FFF | ((((v19 ^ (v19 >> 3) ^ (v19 >> 12)) ^ (v19 >> 1)) & 1) << 15);
            *(_WORD *)(v21 + i) = (v15 + word_224B28F0A[(unsigned __int16)v19 >> 5]) >> v8;
          }
          ++v20;
          v21 += 164;
        }
        while (v17 != v20);
        int v14 = v17;
      }
      uint64_t v23 = v16;
      for (uint64_t j = 3; j != 79; ++j)
      {
        LODWORD(v25) = 0;
        int v26 = 0;
        uint64_t v27 = (__int16 *)v23;
        uint64_t v28 = -(int)v13;
        do
        {
          uint64_t v29 = v28;
          if (v28 | -(int)v13)
          {
            uint64_t v25 = (int)v25;
            uint64_t v30 = v27;
            uint64_t v31 = -(int)v13;
            do
            {
              int v32 = *v30++;
              v26 += v32 * *(char *)(result + 81 + v25++);
              if (v31 >= v13) {
                break;
              }
              ++v31;
            }
            while (v31 | v29);
          }
          uint64_t v28 = v29 + 1;
          v27 += 82;
        }
        while (v29);
        uint64_t v33 = a2 + 164 * v18;
        int v34 = ((v26 + (32 << v12)) >> v121) + *(__int16 *)(v33 + 2 * j);
        __int16 v35 = v122;
        if (v34 < v122) {
          __int16 v35 = ((v26 + (32 << v12)) >> v121) + *(_WORD *)(v33 + 2 * j);
        }
        if (v34 <= v123) {
          __int16 v36 = v123;
        }
        else {
          __int16 v36 = v35;
        }
        *(_WORD *)(v33 + 2 * j) = v36;
        v23 += 2;
      }
      ++v18;
      ++v17;
      v16 += 164;
    }
    while (v18 != 73);
    if (a3)
    {
      uint64_t v37 = 0;
      uint64_t v38 = a2 + 1494;
      uint64_t v39 = a3;
      do
      {
        for (uint64_t k = 0; k != 128; k += 2)
          *(_WORD *)(v39 + k) = *(_WORD *)(v38 + k);
        ++v37;
        v39 += 128;
        v38 += 164;
      }
      while (v37 != 64);
    }
  }
  if (v5)
  {
    int v41 = 1;
    if (v7) {
      goto LABEL_41;
    }
  }
  else
  {
    int v41 = (*(_DWORD *)(result + 4) >> 1) & 1;
    if (v7) {
      goto LABEL_41;
    }
  }
  if ((*(_DWORD *)(result + 4) & 2) == 0)
  {
    int v42 = 0;
    goto LABEL_42;
  }
LABEL_41:
  int v42 = 2;
LABEL_42:
  if (v42 | v41)
  {
    uint64_t v43 = 0;
    unsigned int v44 = v10 ^ 0xB524;
    unsigned int v45 = v10 ^ 0x49D8;
    unint64_t v46 = v3;
    int v47 = v3 & 2;
    BOOL v48 = (v5 | v47) == 0;
    BOOL v49 = (v7 | v47) == 0;
    int v50 = 1 << (v6 + 3);
    if (v8) {
      int v51 = v50;
    }
    else {
      int v51 = 0;
    }
    uint64_t v52 = 41;
    if (!v108) {
      uint64_t v52 = 79;
    }
    uint64_t v118 = v52;
    int v117 = 32 << v12;
    int v53 = 1 << (BYTE2(v108) + (v107 >> 17) - 1);
    if (!((v108 >> 16) + (v107 >> 17))) {
      int v53 = 0;
    }
    int v125 = v53;
    uint64_t v54 = -(int)v13;
    uint64_t v55 = (2 * v13) | 1u;
    unint64_t v111 = v107 >> 17;
    uint64_t v56 = a2 - 166 * ((v46 >> 4) & 3);
    uint64_t v57 = v56 + 24442;
    uint64_t v58 = v56 + 12470;
    uint64_t v59 = 4;
    uint64_t v60 = 3;
    do
    {
      int v114 = v59;
      if (v60 >= (int)v43)
      {
        uint64_t v61 = (int)v43;
        uint64_t v62 = a2 + 23944 + 164 * (int)v43;
        uint64_t v63 = a2 + 11972 + 164 * (int)v43;
        do
        {
          uint64_t v64 = (_WORD *)v63;
          int v65 = (_WORD *)v62;
          uint64_t v66 = v110;
          do
          {
            if (!v48)
            {
              unsigned int v44 = (v44 >> 1) & 0xFFFF7FFF | ((((v44 ^ (v44 >> 3) ^ (v44 >> 12)) ^ (v44 >> 1)) & 1) << 15);
              *uint64_t v64 = (v51 + word_224B28F0A[(unsigned __int16)v44 >> 5]) >> v8;
            }
            if (!v49)
            {
              unsigned int v45 = (v45 >> 1) & 0xFFFF7FFF | ((((v45 ^ (v45 >> 3) ^ (v45 >> 12)) ^ (v45 >> 1)) & 1) << 15);
              *int v65 = (v51 + word_224B28F0A[(unsigned __int16)v45 >> 5]) >> v8;
            }
            ++v65;
            ++v64;
            --v66;
          }
          while (v66);
          ++v61;
          v62 += 164;
          v63 += 164;
        }
        while (v59 != v61);
        uint64_t v113 = v59;
      }
      else
      {
        uint64_t v113 = v43;
      }
      uint64_t v119 = a2 + 164 * ((((int)v60 - 3) << v111) + 3);
      uint64_t v120 = v60;
      uint64_t v115 = v58;
      uint64_t v116 = v57;
      uint64_t v67 = v58;
      uint64_t v68 = v57;
      for (uint64_t m = 3; m != v118; ++m)
      {
        int v70 = 0;
        int v71 = 0;
        int v72 = 0;
        uint64_t v73 = v67;
        uint64_t v74 = v68;
        uint64_t v75 = v54;
        do
        {
          uint64_t v76 = 0;
          uint64_t v77 = v75;
          int v78 = v70;
          uint64_t v79 = result + v70;
          v70 += v55;
          while (1)
          {
            int v80 = *(char *)(v79 + v76 + 105);
            int v81 = *(char *)(v79 + v76 + 130);
            if (!((v54 + v76) | v77)) {
              break;
            }
            v72 += *(__int16 *)(v73 + 2 * v76) * v80;
            v71 += *(__int16 *)(v74 + 2 * v76++) * v81;
            if (v55 == v76) {
              goto LABEL_74;
            }
          }
          int v70 = v78 + v76;
          if (v126)
          {
            uint64_t v82 = 0;
            int v83 = 0;
            uint64_t v84 = (__int16 *)(v119 + 2 * ((((int)m - 3) << SBYTE2(v108)) + 3));
            do
            {
              int v85 = v84;
              uint64_t v86 = (v108 >> 16) + 1;
              do
              {
                int v87 = *v85++;
                v83 += v87;
                --v86;
              }
              while (v86);
              ++v82;
              v84 += 82;
            }
            while (v82 != (v107 >> 17) + 1);
            int v88 = (v83 + v125) >> (BYTE2(v108) + (v107 >> 17));
            v72 += v88 * v80;
            v71 += v88 * v81;
          }
LABEL_74:
          uint64_t v75 = v77 + 1;
          v74 += 164;
          v73 += 164;
        }
        while (v77);
        uint64_t v89 = a2 + 164 * v120 + 2 * m;
        int v90 = ((v72 + v117) >> v121) + *(__int16 *)(v89 + 11972);
        if (v90 >= v122) {
          __int16 v91 = v122;
        }
        else {
          __int16 v91 = ((v72 + v117) >> v121) + *(_WORD *)(v89 + 11972);
        }
        if (v90 <= v123) {
          __int16 v92 = v123;
        }
        else {
          __int16 v92 = v91;
        }
        *(_WORD *)(v89 + 11972) = v92;
        int v93 = ((v71 + v117) >> v121) + *(__int16 *)(v89 + 23944);
        if (v93 >= v122) {
          __int16 v94 = v122;
        }
        else {
          __int16 v94 = ((v71 + v117) >> v121) + *(_WORD *)(v89 + 23944);
        }
        if (v93 <= v123) {
          __int16 v95 = v123;
        }
        else {
          __int16 v95 = v94;
        }
        *(_WORD *)(v89 + 23944) = v95;
        v68 += 2;
        v67 += 2;
      }
      uint64_t v60 = v120 + 1;
      uint64_t v59 = (v114 + 1);
      uint64_t v57 = v116 + 164;
      uint64_t v58 = v115 + 164;
      uint64_t v43 = v113;
    }
    while (v120 + 1 != v112);
    uint64_t result = a3;
    if (a3)
    {
      uint64_t v96 = 0;
      if (v107) {
        uint64_t v97 = 984;
      }
      else {
        uint64_t v97 = 1476;
      }
      if (v108) {
        uint64_t v98 = 12;
      }
      else {
        uint64_t v98 = 18;
      }
      unsigned int v99 = 0x40u >> v111;
      if (0x40u >> SBYTE2(v108) <= 1) {
        unsigned int v100 = 1;
      }
      else {
        unsigned int v100 = 0x40u >> SBYTE2(v108);
      }
      if (v99 <= 1) {
        uint64_t v101 = 1;
      }
      else {
        uint64_t v101 = v99;
      }
      uint64_t v102 = v97 + v98 + a2;
      uint64_t v103 = v102 + 23944;
      uint64_t v104 = v102 + 11972;
      do
      {
        uint64_t v105 = 0;
        do
        {
          uint64_t v106 = result + v105;
          *(_WORD *)(v106 + 0x2000) = *(_WORD *)(v104 + v105);
          *(_WORD *)(v106 + 0x4000) = *(_WORD *)(v103 + v105);
          v105 += 2;
        }
        while (2 * v100 != v105);
        ++v96;
        result += 128;
        v103 += 164;
        v104 += 164;
      }
      while (v96 != v101);
    }
  }
  return result;
}

void sub_224B06A50(uint64_t a1)
{
  uint64_t v2 = a1 + 37096;
  if (*(void *)(a1 + 24))
  {
    while (!sub_224B06B98(a1))
      ;
    if (*(void *)(v2 + 8) && *(void *)v2)
    {
      unint64_t v3 = *(std::__shared_weak_count **)(v2 + 16);
      v6[0] = *(uint64_t **)(v2 + 8);
      v6[1] = (uint64_t *)v3;
      if (v3) {
        atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      sub_224B07314(a1, v6);
      if (v3) {
        sub_224B06B24(v3);
      }
    }
    int v4 = *(std::__shared_weak_count **)(v2 + 16);
    *(_OWORD *)(a1 + 37104) = 0u;
    if (v4) {
      sub_224B06B24(v4);
    }
  }
  while (*(void *)v2)
  {
    v5[0] = 0;
    v5[1] = 0;
    sub_224B07314(a1, v5);
  }
}

void sub_224B06B0C(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_224B06B24(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_224B06B24(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_224B06B98(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v2 = (char *)operator new(0x128uLL);
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *(void *)uint64_t v2 = &unk_26D7D5F30;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *(_OWORD *)(v2 + 184) = 0u;
  *(_OWORD *)(v2 + 200) = 0u;
  *(_OWORD *)(v2 + 216) = 0u;
  *(_OWORD *)(v2 + 232) = 0u;
  *(_OWORD *)(v2 + 248) = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  *(_OWORD *)(v2 + 280) = 0u;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3)
  {
    uint64_t v6 = 4294967274;
    goto LABEL_10;
  }
  int v4 = *(_DWORD *)(v3 + 63088);
  *(_DWORD *)(v3 + 63088) = 1;
  uint64_t v5 = sub_224AF7598(v3);
  if ((v5 & 0x80000000) != 0)
  {
    uint64_t v6 = v5;
    goto LABEL_8;
  }
  uint64_t v6 = *(unsigned int *)(v3 + 63152);
  if (!v6)
  {
    sub_224AF7650(v3);
    if (v7)
    {
      uint64_t v6 = sub_224AF7774();
      if ((v6 & 0x80000000) == 0) {
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v6 = 4294967261;
      if (*(_DWORD *)(v3 + 8) < 2u || !v4) {
        goto LABEL_87;
      }
      int v59 = 0;
      int v8 = 0;
      uint64_t v60 = (pthread_mutex_t *)(v3 + 896);
      uint64_t v58 = a1;
      while (1)
      {
        unsigned int v9 = *(_DWORD *)(v3 + 864);
        uint64_t v10 = *(void *)v3;
        pthread_mutex_lock(v60);
        uint64_t v11 = v10 + 5712 * v9;
        if (*(int *)(v11 + 3124) >= 1)
        {
          char v12 = (int *)(v11 + 3124);
          uint64_t v13 = v10 + 5712 * v9;
          int v14 = (pthread_cond_t *)(v13 + 5424);
          int v15 = (pthread_mutex_t **)(v13 + 5472);
          do
            pthread_cond_wait(v14, *v15);
          while (*v12 > 0);
        }
        uint64_t v16 = *(void *)(v3 + 856);
        uint64_t v17 = v16 + 296 * v9;
        if (*(void *)(v17 + 16) || (unsigned int v18 = atomic_load((unsigned int *)(v10 + 5712 * v9 + 5564))) != 0)
        {
          unsigned int v19 = (unsigned int *)(v3 + 1008);
          unsigned int v20 = atomic_load((unsigned int *)(v3 + 1008));
          if (v20 + 1 >= *(_DWORD *)(v3 + 8)) {
            atomic_store(0, v19);
          }
          else {
            atomic_fetch_add((atomic_uint *volatile)v19, 1u);
          }
          atomic_compare_exchange_strong((atomic_uint *volatile)(v3 + 1016), &v20, 0xFFFFFFFF);
          unsigned int v21 = *(_DWORD *)(v3 + 1012);
          unsigned int v22 = *(_DWORD *)(v3 + 8);
          int v59 = 1;
          if (v21 && v21 < v22)
          {
            *(_DWORD *)(v3 + 1012) = v21 - 1;
            int v59 = 1;
          }
        }
        else
        {
          if (v59)
          {
            pthread_mutex_unlock(v60);
LABEL_42:
            sub_224AF7650(v3);
            if (!v31) {
              goto LABEL_9;
            }
LABEL_43:
            uint64_t v6 = sub_224AF7774();
            goto LABEL_47;
          }
          int v59 = 0;
          unsigned int v22 = *(_DWORD *)(v3 + 8);
        }
        int v23 = *(_DWORD *)(v3 + 864);
        int v24 = v23 + 1 == v22 ? 0 : v23 + 1;
        *(_DWORD *)(v3 + 864) = v24;
        pthread_mutex_unlock(v60);
        uint64_t v25 = v10 + 5712 * v9;
        uint64_t v6 = *(unsigned int *)(v25 + 5556);
        if (v6) {
          break;
        }
        if (*(void *)(v17 + 16))
        {
          uint64_t v26 = v16 + 296 * v9;
          uint64_t v27 = (void *)(v26 + 288);
          if ((*(_DWORD *)(v26 + 272) || *(_DWORD *)(v3 + 63076)) && *(_DWORD *)(*(void *)(v26 + 288) + 4) != -2)
          {
            uint64_t v28 = (void *)(v26 + 272);
            sub_224AFAD00((void *)(v3 + 248), (void *)(v16 + 296 * v9));
            *(void *)(v3 + 520) = *v28;
            *(void *)(v3 + 536) = *v27;
            uint64_t v29 = v16 + 296 * v9;
            *(_DWORD *)(v3 + 528) = *(_DWORD *)(v29 + 280);
            *(_DWORD *)(v3 + 63096) |= *(_DWORD *)(v29 + 280) & 3;
          }
          sub_224AFAD94(v16 + 296 * v9);
          *uint64_t v27 = 0;
          sub_224AF7650(v3);
          if (v30) {
            goto LABEL_43;
          }
        }
        if (++v8 >= *(_DWORD *)(v3 + 8)) {
          goto LABEL_42;
        }
      }
      *(_DWORD *)(v25 + 5556) = 0;
      sub_224AF722C((uint64_t *)(v3 + 63144));
      long long v32 = *(_OWORD *)(v17 + 72);
      long long v33 = *(_OWORD *)(v17 + 88);
      *(_OWORD *)(v3 + 63136) = *(_OWORD *)(v17 + 104);
      *(_OWORD *)(v3 + 63120) = v33;
      *(_OWORD *)(v3 + 63104) = v32;
      uint64_t v34 = *(void *)(v3 + 63144);
      if (v34) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v34 + 16), 1u, memory_order_relaxed);
      }
      sub_224AFAD94(v16 + 296 * v9);
      *(void *)(v16 + 296 * v9 + 288) = 0;
LABEL_47:
      a1 = v58;
      if ((v6 & 0x80000000) == 0) {
        goto LABEL_48;
      }
    }
LABEL_8:
    if (v6 == -35)
    {
LABEL_9:
      uint64_t v6 = 4294967261;
      goto LABEL_87;
    }
LABEL_10:
    fprintf((FILE *)*MEMORY[0x263EF8348], "Error %d decoding frame\n", v6);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v65) = v6;
      _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error %d decoding frame", buf, 8u);
    }
    goto LABEL_87;
  }
  *(_DWORD *)(v3 + 63152) = 0;
  if ((v6 & 0x80000000) != 0) {
    goto LABEL_8;
  }
LABEL_48:
  uint64_t v35 = a1 + 37088;
  __int16 v36 = (const void **)*((void *)v2 + 16);
  uint64_t v37 = *((char *)v36 + 30);
  uint64_t v38 = *((void *)v2 + 3);
  if ((int)v37 >= *(unsigned __int8 *)(v38 + 34)) {
    uint64_t v37 = 0;
  }
  char v39 = *(unsigned char *)(v38 + 10 * v37 + 41);
  unsigned int v40 = 31 - __clz(v39 & 0xF);
  if ((v39 & 0xF) != 0) {
    unsigned int v41 = v40;
  }
  else {
    unsigned int v41 = 0;
  }
  int v42 = *(unsigned __int8 *)(*((void *)v2 + 4) + 250);
  int v43 = *((unsigned __int8 *)v36 + 29);
  int v44 = (char)v43;
  BOOL v46 = (v43 & 0x80u) == 0 && v42 == v43;
  uint64_t v47 = a1 + 37080;
  uint64_t v48 = *(void *)v35;
  if (*(void *)v35 == a1 + 37080) {
    goto LABEL_81;
  }
  while (*(const void **)(v48 + 16) != *v36)
  {
    uint64_t v48 = *(void *)(v48 + 8);
    if (v48 == v47) {
      goto LABEL_81;
    }
  }
  if (v48 == v47)
  {
LABEL_81:
    if (v44 < 0 || v41 == v44)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "Got a picture for a VTFrame we've already emitted (%p)\n", *v36);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v54 = *v36;
        *(_DWORD *)buf = 134217984;
        int v65 = v54;
        _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Got a picture for a VTFrame we've already emitted (%p)", buf, 0xCu);
      }
      uint64_t v6 = 4294954387;
      goto LABEL_87;
    }
  }
  else
  {
    if (!*(void *)(a1 + 37096))
    {
LABEL_78:
      fwrite("Pulled frame but can't find the corresponding VTVideoDecoderFrame\n", 0x42uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Pulled frame but can't find the corresponding VTVideoDecoderFrame", buf, 2u);
      }
      uint64_t v6 = 4294954385;
      goto LABEL_87;
    }
    BOOL v49 = &_os_log_internal;
    while (*(const void **)(*(void *)v35 + 16) != *v36)
    {
      if (*(void *)(a1 + 37104))
      {
        int v50 = *(std::__shared_weak_count **)(a1 + 37112);
        v63[0] = *(uint64_t **)(a1 + 37104);
        v63[1] = (uint64_t *)v50;
        if (v50) {
          atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        sub_224B07314(a1, v63);
        if (v50) {
          sub_224B06B24(v50);
        }
        int v51 = *(std::__shared_weak_count **)(a1 + 37112);
        *(void *)(a1 + 37104) = 0;
        *(void *)(a1 + 37112) = 0;
        if (v51) {
          sub_224B06B24(v51);
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "Expecting frame %p, got %p\n", *(const void **)(*(void *)v35 + 16), *v36);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          uint64_t v52 = *(const void **)(*(void *)v35 + 16);
          int v53 = *v36;
          *(_DWORD *)buf = 134218240;
          int v65 = v52;
          __int16 v66 = 2048;
          uint64_t v67 = v53;
          _os_log_impl(&dword_224A74000, v49, OS_LOG_TYPE_ERROR, "Expecting frame %p, got %p", buf, 0x16u);
        }
        v62[0] = 0;
        v62[1] = 0;
        sub_224B07314(a1, v62);
      }
      if (!*(void *)(a1 + 37096)) {
        goto LABEL_78;
      }
    }
    int v56 = v41 == v42 || v46;
    if (v56 != 1)
    {
      uint64_t v6 = 0;
      uint64_t v57 = *(char **)(a1 + 37112);
      *(void *)(a1 + 37104) = v2 + 24;
      *(void *)(a1 + 37112) = v2;
      uint64_t v2 = v57;
      if (!v57) {
        return v6;
      }
      goto LABEL_87;
    }
    v61[0] = (uint64_t *)(v2 + 24);
    v61[1] = (uint64_t *)v2;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v2 + 1, 1uLL, memory_order_relaxed);
    sub_224B07314(a1, v61);
    sub_224B06B24((std::__shared_weak_count *)v2);
  }
  uint64_t v6 = 0;
LABEL_87:
  sub_224B06B24((std::__shared_weak_count *)v2);
  return v6;
}

void sub_224B072E0(_Unwind_Exception *a1)
{
  sub_224B06B24(v1);
  sub_224B06B24(v1);
  _Unwind_Resume(a1);
}

void sub_224B07314(uint64_t a1, uint64_t **a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v25 = a1;
  int v26 = 0;
  uint64_t v2 = *a2;
  if (!*a2) {
    goto LABEL_5;
  }
  uint64_t v4 = a1 + 37000;
  uint64_t v5 = (uint64_t *)v2[13];
  uint64_t v6 = *(const void **)(*(void *)(a1 + 37088) + 16);
  if (v6 != (const void *)*v5)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Expecting %p, got %p\n", v6, (const void *)*v5);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(v4 + 88) + 16);
      int v8 = (const void *)*v5;
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v29 = 2048;
      int v30 = v8;
      _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Expecting %p, got %p", buf, 0x16u);
    }
LABEL_5:
    sub_224B07668(&v25);
    return;
  }
  int v10 = *((_DWORD *)v5 + 6);
  uint64_t v11 = v2[33];
  *(void *)buf = 0;
  if (*(void *)a1 && !*(unsigned char *)(v11 + 24))
  {
    std::mutex::lock((std::mutex *)(a1 + 36936));
    if (*(unsigned char *)(v4 + 40) && sub_224B0E7A8(a1 + 37000, v2)
      || (*(_OWORD *)uint64_t v4 = *(_OWORD *)(v2 + 7),
          uint64_t v14 = *v2,
          *(unsigned char *)(v4 + 16) = *(unsigned char *)(*v2 + 33) != 0,
          *(unsigned char *)(v4 + 17) = *(unsigned char *)(v14 + 421) != 0,
          (int PixelBuffer = sub_224B07E7C((int32x2_t *)a1)) == 0))
    {
      PixelBufferPool = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool();
      int PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(0, PixelBufferPool, (CVPixelBufferRef *)buf);
    }
    else
    {
      fwrite("Failed to create buffer pools\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v27 = 0;
        _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create buffer pools", v27, 2u);
      }
    }
    std::mutex::unlock((std::mutex *)(a1 + 36936));
    uint64_t v12 = *(void *)buf;
    uint64_t v2 = *a2;
  }
  else
  {
    uint64_t v12 = 0;
    int PixelBuffer = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = sub_224B077B8;
  block[3] = &unk_26D7D5F90;
  block[4] = a1;
  block[5] = v12;
  uint64_t v16 = (std::__shared_weak_count *)a2[1];
  block[6] = v2;
  unsigned int v21 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unsigned int v22 = v5;
  int v23 = v10 & 1;
  int v24 = PixelBuffer;
  if (v10)
  {
    dispatch_group_wait(*(dispatch_group_t *)(v4 + 56), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_group_async(*(dispatch_group_t *)(v4 + 56), *(dispatch_queue_t *)(v4 + 48), block);
  }
  else
  {
    dispatch_sync(*(dispatch_queue_t *)(v4 + 48), block);
  }
  uint64_t v17 = *(uint64_t **)(v4 + 88);
  uint64_t v18 = *v17;
  *(void *)(v18 + 8) = v17[1];
  *(void *)v17[1] = v18;
  --*(void *)(v4 + 96);
  operator delete(v17);
  unsigned int v19 = *(std::__shared_weak_count **)(v4 + 112);
  *(_OWORD *)(a1 + 37104) = 0u;
  if (v19) {
    sub_224B06B24(v19);
  }
  if (v21) {
    sub_224B06B24(v21);
  }
}

void sub_224B07648(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_224B07668(uint64_t *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  uint64_t v2 = *a1 + 37088;
  fprintf((FILE *)*MEMORY[0x263EF8348], "Failed to pull picture for frame %p, dropping\n", *(const void **)(*(void *)v2 + 16));
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(*(void *)v2 + 16);
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to pull picture for frame %p, dropping", buf, 0xCu);
  }
  if (*(void *)(v1 + 8)) {
    VTTileDecoderSessionEmitDecodedTile();
  }
  else {
    VTDecoderSessionEmitDecodedFrame();
  }
  uint64_t v4 = *(void ***)v2;
  uint64_t v5 = **(void **)v2;
  *(void *)(v5 + 8) = *(void *)(*(void *)v2 + 8);
  *v4[1] = v5;
  --*(void *)(v2 + 8);
  operator delete(v4);
}

const void **sub_224B077B8(void *a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  CFTypeRef v40 = v2;
  if (!*(void *)(v3 + 8))
  {
    uint64_t v13 = (int32x2_t *)a1[6];
    int32x2_t v14 = v13[33];
    if (*(unsigned char *)(*(void *)&v14 + 24))
    {
      if (!*(unsigned char *)(*(void *)&v14 + 25)
        && !sub_224B035C0(v3 + 32, v13, **(CVPixelBufferRef **)&v14))
      {
        *(unsigned char *)(*(void *)&v14 + 25) = 1;
      }
      if (v40) {
        CFRelease(v40);
      }
      CVPixelBufferRef v32 = **(CVPixelBufferRef **)&v14;
      CFTypeRef v40 = v32;
      if (v32) {
        CFRetain(v32);
      }
    }
    else if (v2)
    {
      sub_224B035C0(v3 + 32, v13, (CVPixelBufferRef)v2);
    }
    if (!*(unsigned char *)(*(void *)&v14 + 24)) {
      goto LABEL_45;
    }
    if (*(unsigned char *)(*(void *)&v14 + 27))
    {
      CVPixelBufferLockFlags v34 = *(void *)(*(void *)&v14 + 32);
      if (v34 == 1)
      {
LABEL_45:
        VTDecoderSessionEmitDecodedFrame();
        return sub_224AAEFC4(&v40);
      }
      CVPixelBufferUnlockBaseAddress(**(CVPixelBufferRef **)&v14, v34);
    }
    *(void *)(*(void *)&v14 + 32) = 1;
    CVPixelBufferLockBaseAddress(**(CVPixelBufferRef **)&v14, 1uLL);
    *(unsigned char *)(*(void *)&v14 + 27) = 1;
    goto LABEL_45;
  }
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(*(CMVideoFormatDescriptionRef *)(v3 + 16));
  uint64_t v5 = (int32x2_t *)a1[6];
  uint64_t v6 = a1[8];
  uint64_t v7 = *(__CVBuffer **)(v6 + 8);
  unsigned int v8 = v5[8].u32[0];
  __int32 v9 = v5[8].i32[1];
  BOOL v10 = v8 <= 3 && (v9 - 14) >= 0xFFFFFFFA;
  if (v10
    && ((CMVideoDimensions v15 = Dimensions,
         uint64_t v16 = *(void *)(v6 + 16),
         int v17 = *(unsigned __int8 *)(v6 + 28),
         int32x2_t v39 = v5[33],
         OSType v18 = CVPixelBufferGetPixelFormatType(v7),
         v18 == *(_DWORD *)&a800l800l010l01[24 * v8 + 8 * ((v9 - 8) >> 1)])
     || v18 == *(_DWORD *)&a800l800l010l01[24 * v8 + 4 + 8 * ((v9 - 8) >> 1)]))
  {
    size_t Width = CVPixelBufferGetWidth(v7);
    size_t Height = CVPixelBufferGetHeight(v7);
    size_t extraColumnsOnRight = 0;
    size_t extraColumnsOnLeft = 0;
    extraRowsOnBottouint64_t m = 0;
    size_t extraRowsOnTop = 0;
    CVPixelBufferGetExtendedPixels(v7, &extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
    if (extraColumnsOnLeft | extraRowsOnTop)
    {
      fwrite("Extended pixels top/left not supported\n", 0x27uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Extended pixels top/left not supported", buf, 2u);
      }
    }
    else
    {
      uint64_t v38 = v3 + 32;
      uint64_t v21 = v5[7].i32[0];
      if (v21 + (int)v16 <= extraColumnsOnRight + Width
        && (uint64_t v33 = v5[7].i32[1], v33 + (v16 >> 32) <= extraRowsOnBottom + Height)
        && __PAIR64__(v33, v21) == v15)
      {
        if (*(unsigned char *)(*(void *)&v39 + 26)) {
          sub_224B04184(v3 + 72, v5, v7, v16);
        }
        else {
          sub_224B03858(v38, (uint64_t)v5, v7, v16);
        }
      }
      else if (v17)
      {
        unsigned int v22 = (VTSessionRef *)(v3 + 56);
        if (*(void *)(v3 + 56) || !VTPixelTransferSessionCreate(0, (VTPixelTransferSessionRef *)(v3 + 56)))
        {
          v56.origin.x = (double)(int)v16;
          v56.origin.y = (double)SHIDWORD(v16);
          v56.size.width = (double)v15.width;
          v56.size.height = (double)v15.height;
          DictionaryRepresentatiouint64_t n = CGRectCreateDictionaryRepresentation(v56);
          VTSessionSetProperty(*v22, (CFStringRef)*MEMORY[0x263F1E9D8], DictionaryRepresentation);
          VTSessionSetProperty(*v22, (CFStringRef)*MEMORY[0x263F1EA18], (CFTypeRef)*MEMORY[0x263EFFB38]);
          CFTypeRef cf = 0;
          size_t v23 = v5[7].i32[0];
          size_t v24 = v5[7].i32[1];
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v7);
          CVPixelBufferCreate(0, v23, v24, PixelFormatType, 0, (CVPixelBufferRef *)&cf);
          uint64_t v26 = 0;
          uint64_t v27 = (__CVBuffer *)cf;
          uint64_t v28 = *MEMORY[0x263F03FC0];
          *(void *)buf = *MEMORY[0x263F03ED8];
          uint64_t v48 = v28;
          uint64_t v29 = *MEMORY[0x263F03E38];
          size_t v49 = *MEMORY[0x263F04020];
          *(void *)int v50 = v29;
          do
          {
            CFStringRef v30 = *(const __CFString **)&buf[v26];
            CFTypeRef v31 = CVBufferCopyAttachment(v7, v30, 0);
            if (v31)
            {
              CVBufferSetAttachment(v27, v30, v31, kCVAttachmentMode_ShouldPropagate);
              CFRelease(v31);
            }
            v26 += 8;
          }
          while (v26 != 32);
          if (!sub_224B03858(v38, (uint64_t)v5, (CVPixelBufferRef)cf, 0)) {
            VTPixelTransferSessionTransferImage((VTPixelTransferSessionRef)*v22, (CVPixelBufferRef)cf, v7);
          }
          sub_224AAEFC4(&cf);
          sub_224A75878((const void **)&DictionaryRepresentation);
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "Copying tile of size %dx%d to imagebuffer of size %zux%zu at offset %dx%d is outside bounds\n", v21, v5[7].i32[1], Width, Height, v16, HIDWORD(v16));
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          __int32 v35 = v5[7].i32[0];
          __int32 v36 = v5[7].i32[1];
          *(_DWORD *)buf = 67110400;
          *(_DWORD *)&uint8_t buf[4] = v35;
          LOWORD(v48) = 1024;
          *(_DWORD *)((char *)&v48 + 2) = v36;
          HIWORD(v48) = 2048;
          size_t v49 = Width;
          *(_WORD *)int v50 = 2048;
          *(void *)&_OWORD v50[2] = Height;
          __int16 v51 = 1024;
          int v52 = v16;
          __int16 v53 = 1024;
          int v54 = HIDWORD(v16);
          _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Copying tile of size %dx%d to imagebuffer of size %zux%zu at offset %dx%d is outside bounds", buf, 0x2Eu);
        }
      }
    }
  }
  else
  {
    uint64_t v11 = (FILE *)*MEMORY[0x263EF8348];
    OSType v12 = CVPixelBufferGetPixelFormatType(v7);
    fprintf(v11, "Copy to pixelformat %d not supported\n", v12);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = CVPixelBufferGetPixelFormatType(v7);
      _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Copy to pixelformat %d not supported", buf, 8u);
    }
  }
  VTTileDecoderSessionEmitDecodedTile();
  return sub_224AAEFC4(&v40);
}

void sub_224B07E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, const void *);
  uint64_t v13 = va_arg(va1, void);
  sub_224A75878((const void **)va1);
  sub_224AAEFC4((const void **)va);
  _Unwind_Resume(a1);
}

void sub_224B07E50(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    sub_224B06B24(v1);
  }
}

uint64_t sub_224B07E60(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(result + 56) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t sub_224B07E7C(int32x2_t *a1)
{
  values[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 4625;
  uint64_t v3 = (CFTypeRef *)&a1[4628];
  uint64_t v5 = (CFTypeRef *)&a1[4629];
  uint64_t v4 = (const void *)a1[4629];
  if (v4)
  {
    CFRelease(v4);
    CFTypeRef *v5 = 0;
  }
  if (*v3)
  {
    CFRelease(*v3);
    CFTypeRef v6 = *v5;
    *uint64_t v3 = *v5;
    if (v6) {
      CFRetain(v6);
    }
  }
  else
  {
    *uint64_t v3 = 0;
  }
  v2[5].i8[0] = 0;
  __int32 v7 = v2[1].i32[0];
  __int32 v8 = v2[1].i32[1];
  int v106 = v7 == 1;
  int v107 = v7 != 3;
  char v9 = v8 != 8;
  int32x2_t v115 = *v2;
  BOOL v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  uint64_t v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  CFMutableDictionaryRef theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableDictionaryRef pixelBufferAttributes = CFDictionaryCreateMutable(0, 0, v10, v11);
  int v12 = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  unsigned int v13 = v2[1].u32[0];
  unint64_t v108 = v3;
  __int32 v105 = v7;
  if (v13 <= 3)
  {
    __int32 v14 = v2[1].i32[1];
    if ((v14 - 14) >= 0xFFFFFFFA) {
      int v12 = *(_DWORD *)&a800l800l010l01[24 * v13 + 8 * ((v14 - 8) >> 1) + 4 * v2[2].u8[0]];
    }
  }
  *(_DWORD *)valuePtr = v12;
  CFNumberRef v15 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  key = (void *)*MEMORY[0x263F04180];
  if (v15)
  {
    CFDictionaryAddValue(theDict, key, v15);
    CFRelease(v15);
  }
  *(_DWORD *)valuePtr = 64;
  CFNumberRef v16 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  unint64_t v111 = (void *)*MEMORY[0x263F04198];
  if (v16)
  {
    CFDictionaryAddValue(theDict, v111, v16);
    CFRelease(v16);
  }
  *(_DWORD *)valuePtr = 64;
  CFNumberRef v17 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  uint64_t v110 = (void *)*MEMORY[0x263F04078];
  if (v17)
  {
    CFDictionaryAddValue(theDict, v110, v17);
    CFRelease(v17);
  }
  v18.i32[1] = 1;
  v19.i32[1] = 1;
  v20.i32[1] = v115.i32[1];
  v20.i32[0] = v115.i32[0] - 1;
  v18.i32[0] = 0x40u >> v9;
  v19.i32[0] = -(0x40u >> v9);
  int32x2_t v114 = vsub_s32((int32x2_t)(*(void *)&vadd_s32(v115, (int32x2_t)0x7F0000007FLL) & 0xFFFFFF80FFFFFF80), v115);
  int32x2_t v116 = vsub_s32((int32x2_t)vand_s8((int8x8_t)vadd_s32(v20, v18), v19), v115);
  if (v8 == 8 || *(void *)&a1[1])
  {
    int v119 = 0;
    *(void *)valuePtr = CFNumberCreate(0, kCFNumberSInt32Type, &v119);
    values[0] = *(void **)valuePtr;
    CFMutableDictionaryRef v118 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x263EFFF70]);
    CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x263F040A8], v118);
    int32x2_t v116 = vmax_s32(v116, v114);
    sub_224B08F74((const void **)&v118);
    sub_224B08FA8((const void **)valuePtr);
  }
  if (*(void *)a1 || v2[2].i8[1])
  {
    if (qword_268095B00 != -1) {
      dispatch_once(&qword_268095B00, &unk_26D7D5F60);
    }
    if (byte_268095B08)
    {
      *(void *)valuePtr = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      uint64_t v21 = (const void *)*MEMORY[0x263F04130];
      CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x263F04130], *(const void **)valuePtr);
      CFDictionaryAddValue(pixelBufferAttributes, v21, *(const void **)valuePtr);
      CFDictionaryAddValue(Mutable, v21, *(const void **)valuePtr);
      sub_224B08FDC((const void **)valuePtr);
    }
  }
  if (v116.i32[0] <= 32) {
    int v22 = 32;
  }
  else {
    int v22 = v116.i32[0];
  }
  if (v2[2].i8[1]) {
    int v23 = v22;
  }
  else {
    int v23 = v116.i32[0];
  }
  size_t v24 = theDict;
  *(_DWORD *)valuePtr = v23;
  CFNumberRef v25 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  uint64_t v112 = (void *)*MEMORY[0x263F040F8];
  if (v25)
  {
    CFDictionaryAddValue(v24, v112, v25);
    CFRelease(v25);
  }
  uint64_t v26 = theDict;
  *(_DWORD *)valuePtr = v116.i32[1];
  CFNumberRef v27 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  int v117 = (const void *)*MEMORY[0x263F040D8];
  if (v27)
  {
    CFDictionaryAddValue(v26, v117, v27);
    CFRelease(v27);
  }
  if (*a1)
  {
    uint64_t v28 = theDict;
    *(_DWORD *)valuePtr = v2->i32[0];
    CFNumberRef v29 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    int v109 = (void *)*MEMORY[0x263F04240];
    if (v29)
    {
      CFDictionaryAddValue(v28, v109, v29);
      CFRelease(v29);
    }
    CFStringRef v30 = theDict;
    *(_DWORD *)valuePtr = v2->i32[1];
    CFNumberRef v31 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v31)
    {
      CFDictionaryAddValue(v30, (const void *)*MEMORY[0x263F04118], v31);
      CFRelease(v31);
    }
    if (v2[1].i32[1] == 10)
    {
      CVPixelBufferRef v32 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      int v33 = 0;
      *(void *)valuePtr = v32;
      uint64_t v34 = v2[1].u32[0];
      int v35 = v2[1].i32[1];
      if (v34 <= 3 && (v35 - 14) >= 0xFFFFFFFA) {
        int v33 = dword_224B29FAC[6 * v34 + 2 * ((v35 - 8) >> 1) + v2[2].u8[0]];
      }
      int v36 = 0;
      uint64_t v37 = v5;
      if (v34 <= 3 && v35 >= 10) {
        int v36 = *(_DWORD *)&a800l800l010l01[16 * v34 + 96 + 8 * (v35 > 0xA) + 4 * v2[2].u8[0]];
      }
      char v38 = v2[2].i8[1];
      if (sub_224B03564(v38, v33))
      {
        LODWORD(v118) = v33;
        CFNumberRef v39 = CFNumberCreate(0, kCFNumberSInt32Type, &v118);
        if (v39)
        {
          CFArrayAppendValue(v32, v39);
          CFRelease(v39);
        }
        char v38 = v2[2].i8[1];
      }
      int v40 = sub_224B03564(v38, v36);
      uint64_t v5 = v37;
      if (v40)
      {
        unsigned int v41 = *(__CFArray **)valuePtr;
        LODWORD(v118) = v36;
        CFNumberRef v42 = CFNumberCreate(0, kCFNumberSInt32Type, &v118);
        if (v42)
        {
          CFArrayAppendValue(v41, v42);
          CFRelease(v42);
        }
        int v43 = v2->i32[0] % 48;
        if (v43)
        {
          int v44 = 48 - v43;
          unsigned int v45 = theDict;
          if (48 - v43 <= v23) {
            int v44 = v23;
          }
          LODWORD(v118) = v44;
          CFNumberRef v46 = CFNumberCreate(0, kCFNumberSInt32Type, &v118);
          if (v46)
          {
            CFDictionarySetValue(v45, v112, v46);
            CFRelease(v46);
          }
        }
      }
      uint64_t v47 = *(__CFArray **)valuePtr;
      LODWORD(v118) = v12;
      CFNumberRef v48 = CFNumberCreate(0, kCFNumberSInt32Type, &v118);
      if (v48)
      {
        CFArrayAppendValue(v47, v48);
        CFRelease(v48);
      }
      CFDictionarySetValue(theDict, key, *(const void **)valuePtr);
      sub_224B09010((const void **)valuePtr);
    }
    uint64_t v49 = VTDecoderSessionSetPixelBufferAttributes();
    if (v49)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)valuePtr = 138412290;
        *(void *)&valuePtr[4] = theDict;
        _os_log_error_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VTDecoderSessionSetPixelBufferAttributes failed for: %@", valuePtr, 0xCu);
      }
      goto LABEL_139;
    }
  }
  else
  {
    if (!*(void *)&a1[1])
    {
      fwrite("No active session!\n", 0x13uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)valuePtr = 0;
        _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "No active session!", valuePtr, 2u);
      }
      uint64_t v49 = 4294954393;
      goto LABEL_139;
    }
    int v50 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFMutableDictionaryRef v118 = v50;
    *(_DWORD *)valuePtr = 0xFFFF;
    CFNumberRef v51 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v51)
    {
      CFDictionaryAddValue(v50, (const void *)*MEMORY[0x263F1ECB0], v51);
      CFRelease(v51);
    }
    int v52 = v118;
    *(_DWORD *)valuePtr = 0xFFFF;
    CFNumberRef v53 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v53)
    {
      CFDictionaryAddValue(v52, (const void *)*MEMORY[0x263F1ECB8], v53);
      CFRelease(v53);
    }
    int v54 = v118;
    *(_DWORD *)valuePtr = 1;
    CFNumberRef v55 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v55)
    {
      CFDictionaryAddValue(v54, (const void *)*MEMORY[0x263F1ECD0], v55);
      CFRelease(v55);
    }
    CGRect v56 = v118;
    *(_DWORD *)valuePtr = 1;
    CFNumberRef v57 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v57)
    {
      CFDictionaryAddValue(v56, (const void *)*MEMORY[0x263F1ECD8], v57);
      CFRelease(v57);
    }
    uint64_t v58 = v118;
    *(_DWORD *)valuePtr = 1;
    CFNumberRef v59 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v59)
    {
      CFDictionaryAddValue(v58, (const void *)*MEMORY[0x263F1ECF0], v59);
      CFRelease(v59);
    }
    uint64_t v60 = v118;
    *(_DWORD *)valuePtr = 1;
    CFNumberRef v61 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v61)
    {
      CFDictionaryAddValue(v60, (const void *)*MEMORY[0x263F1ECE8], v61);
      CFRelease(v61);
    }
    uint64_t v62 = v118;
    *(_DWORD *)valuePtr = 0x7FFFFFFF;
    CFNumberRef v63 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v63)
    {
      CFDictionaryAddValue(v62, (const void *)*MEMORY[0x263F1ECA8], v63);
      CFRelease(v63);
    }
    uint64_t v64 = v118;
    *(_DWORD *)valuePtr = 0x7FFFFFFF;
    CFNumberRef v65 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v65)
    {
      CFDictionaryAddValue(v64, (const void *)*MEMORY[0x263F1EC98], v65);
      CFRelease(v65);
    }
    __int16 v66 = v118;
    *(void *)valuePtr = 0x7FFFFFFFFFFFFFFFLL;
    CFNumberRef v67 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
    if (v67)
    {
      CFDictionaryAddValue(v66, (const void *)*MEMORY[0x263F1ECA0], v67);
      CFRelease(v67);
    }
    uint64_t v68 = v118;
    *(_DWORD *)valuePtr = 64;
    CFNumberRef v69 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v69)
    {
      CFDictionaryAddValue(v68, (const void *)*MEMORY[0x263F1ECE0], v69);
      CFRelease(v69);
    }
    CFDictionaryAddValue(v118, (const void *)*MEMORY[0x263F1EC90], (const void *)*MEMORY[0x263EFFB38]);
    if (!v2[5].i8[1])
    {
      uint64_t v49 = VTTileDecoderSessionSetTileDecodeRequirements();
      if (v49)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)valuePtr = 138412546;
          *(void *)&valuePtr[4] = theDict;
          __int16 v124 = 2112;
          CFMutableDictionaryRef v125 = v118;
          _os_log_error_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "VTTileDecoderSessionSetTileDecodeRequirements failed for: (%@ %@)", valuePtr, 0x16u);
        }
        sub_224B08FDC((const void **)&v118);
        goto LABEL_139;
      }
    }
    sub_224B08FDC((const void **)&v118);
    int v109 = (void *)*MEMORY[0x263F04240];
  }
  if (v8 == 8) {
    int v70 = 1278226488;
  }
  else {
    int v70 = 1278226742;
  }
  int v71 = pixelBufferAttributes;
  *(_DWORD *)valuePtr = v2->i32[0];
  CFNumberRef v72 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v72)
  {
    CFDictionaryAddValue(v71, v109, v72);
    CFRelease(v72);
  }
  uint64_t v73 = pixelBufferAttributes;
  *(_DWORD *)valuePtr = v2->i32[1];
  CFNumberRef v74 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  uint64_t v75 = (const void *)*MEMORY[0x263F04118];
  if (v74)
  {
    CFDictionaryAddValue(v73, (const void *)*MEMORY[0x263F04118], v74);
    CFRelease(v74);
  }
  uint64_t v76 = pixelBufferAttributes;
  *(_DWORD *)valuePtr = v70;
  CFNumberRef v77 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v77)
  {
    CFDictionaryAddValue(v76, key, v77);
    CFRelease(v77);
  }
  int v78 = pixelBufferAttributes;
  *(_DWORD *)valuePtr = 64;
  CFNumberRef v79 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v79)
  {
    CFDictionaryAddValue(v78, v111, v79);
    CFRelease(v79);
  }
  int v80 = pixelBufferAttributes;
  *(_DWORD *)valuePtr = 64;
  CFNumberRef v81 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v81)
  {
    CFDictionaryAddValue(v80, v110, v81);
    CFRelease(v81);
  }
  uint64_t v82 = pixelBufferAttributes;
  *(_DWORD *)valuePtr = v114.i32[0];
  CFNumberRef v83 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v83)
  {
    CFDictionaryAddValue(v82, v112, v83);
    CFRelease(v83);
  }
  uint64_t v84 = pixelBufferAttributes;
  *(_DWORD *)valuePtr = v114.i32[1];
  CFNumberRef v85 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v85)
  {
    CFDictionaryAddValue(v84, v117, v85);
    CFRelease(v85);
  }
  CFDictionaryRef v86 = pixelBufferAttributes;
  if (*v108)
  {
    CFRelease(*v108);
    *unint64_t v108 = 0;
  }
  uint64_t v49 = CVPixelBufferPoolCreate(0, 0, v86, (CVPixelBufferPoolRef *)v108);
  if (v49)
  {
    fwrite("Failed to create luma DPB pool\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_139;
    }
    *(_WORD *)valuePtr = 0;
    int v87 = &_os_log_internal;
    int v88 = "Failed to create luma DPB pool";
LABEL_110:
    _os_log_impl(&dword_224A74000, v87, OS_LOG_TYPE_ERROR, v88, valuePtr, 2u);
    goto LABEL_139;
  }
  if (!v105) {
    goto LABEL_134;
  }
  uint64_t v89 = Mutable;
  *(_DWORD *)valuePtr = (v2->i32[0] + v107) >> v107;
  CFNumberRef v90 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v90)
  {
    CFDictionaryAddValue(v89, v109, v90);
    CFRelease(v90);
  }
  __int16 v91 = Mutable;
  *(_DWORD *)valuePtr = (v2->i32[1] + v106) >> v106;
  CFNumberRef v92 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v92)
  {
    CFDictionaryAddValue(v91, v75, v92);
    CFRelease(v92);
  }
  int v93 = Mutable;
  *(_DWORD *)valuePtr = v70;
  CFNumberRef v94 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v94)
  {
    CFDictionaryAddValue(v93, key, v94);
    CFRelease(v94);
  }
  __int16 v95 = Mutable;
  *(_DWORD *)valuePtr = 64;
  CFNumberRef v96 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v96)
  {
    CFDictionaryAddValue(v95, v111, v96);
    CFRelease(v96);
  }
  uint64_t v97 = Mutable;
  *(_DWORD *)valuePtr = 64;
  CFNumberRef v98 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v98)
  {
    CFDictionaryAddValue(v97, v110, v98);
    CFRelease(v98);
  }
  unsigned int v99 = Mutable;
  *(_DWORD *)valuePtr = v114.i32[0] >> v107;
  CFNumberRef v100 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v100)
  {
    CFDictionaryAddValue(v99, v112, v100);
    CFRelease(v100);
  }
  uint64_t v101 = Mutable;
  *(_DWORD *)valuePtr = v114.i32[1] >> v106;
  CFNumberRef v102 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
  if (v102)
  {
    CFDictionaryAddValue(v101, v117, v102);
    CFRelease(v102);
  }
  CFDictionaryRef v103 = Mutable;
  if (*v5)
  {
    CFRelease(*v5);
    CFTypeRef *v5 = 0;
  }
  uint64_t v49 = CVPixelBufferPoolCreate(0, 0, v103, (CVPixelBufferPoolRef *)v5);
  if (!v49)
  {
LABEL_134:
    uint64_t v49 = 0;
    v2[5].i8[0] = 1;
    goto LABEL_139;
  }
  fwrite("Failed to create chroma DPB pool\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)valuePtr = 0;
    int v87 = &_os_log_internal;
    int v88 = "Failed to create chroma DPB pool";
    goto LABEL_110;
  }
LABEL_139:
  sub_224B08FDC((const void **)&Mutable);
  sub_224B08FDC((const void **)&pixelBufferAttributes);
  sub_224B08FDC((const void **)&theDict);
  return v49;
}

void sub_224B08EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,const void *a24,const void *a25,const void *a26)
{
}

const void **sub_224B08F74(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_224B08FA8(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_224B08FDC(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_224B09010(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_224B09044()
{
  uint64_t v0 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  uint64_t v1 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  value = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRef pixelBufferAttributes = CFDictionaryCreateMutable(0, 0, v0, v1);
  CFDictionarySetValue(pixelBufferAttributes, (const void *)*MEMORY[0x263F04130], value);
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v2 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x80uLL, 0x80uLL, 0x4C303038u, pixelBufferAttributes, &pixelBufferOut);
  if (pixelBufferOut)
  {
    CFRelease(pixelBufferOut);
    BOOL v3 = pixelBufferOut != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  if (v2) {
    BOOL v3 = 0;
  }
  byte_268095B08 = v3;
  sub_224B08FDC((const void **)&pixelBufferAttributes);
  return sub_224B08FDC((const void **)&value);
}

void sub_224B0912C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, const void *);
  sub_224B08FDC((const void **)va);
  sub_224B08FDC((const void **)va1);
  _Unwind_Resume(a1);
}

double sub_224B09158(uint64_t a1)
{
  return sub_224AFAD94(a1 + 24);
}

void sub_224B09160(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D7D5F30;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A61D8D0);
}

void sub_224B091B4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D7D5F30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t sub_224B091D4(void *a1)
{
  uint64_t result = a1[33];
  a1[33] = 0;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  if (result)
  {
    sub_224B0E818(result);
    JUMPOUT(0x22A61D8D0);
  }
  return result;
}

uint64_t sub_224B0922C(uint64_t *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2 + 37000;
  uint64_t v5 = (std::mutex *)(a2 + 36936);
  std::mutex::lock((std::mutex *)(a2 + 36936));
  if (*(unsigned char *)(v4 + 40) && sub_224B0E7A8(a2 + 37000, a1)
    || (*(_OWORD *)uint64_t v4 = *(_OWORD *)(a1 + 7),
        uint64_t v6 = *a1,
        *(unsigned char *)(v4 + 16) = *(unsigned char *)(*a1 + 33) != 0,
        *(unsigned char *)(v4 + 17) = *(unsigned char *)(v6 + 421) != 0,
        uint64_t v7 = sub_224B07E7C((int32x2_t *)a2),
        !v7))
  {
    operator new();
  }
  fwrite("Failed to create buffer pools\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create buffer pools", buf, 2u);
  }
  std::mutex::unlock(v5);
  return v7;
}

void sub_224B09720(_Unwind_Exception *a1)
{
  uint64_t v4 = sub_224B0E818(v2);
  MEMORY[0x22A61D8D0](v4, 0x1020C4061E6B045);
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

const void **sub_224B09770()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)keys = 0u;
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)values = 0u;
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v1 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRef v5 = v1;
  if (v1)
  {
    uint64_t v2 = (void *)*MEMORY[0x263F1E758];
    keys[0] = *(void **)MEMORY[0x263F1E798];
    keys[1] = v2;
    values[0] = v1;
    values[1] = v1;
    *(void *)&long long v13 = *MEMORY[0x263F1E7A0];
    *(void *)&long long v7 = v1;
    qword_26AAA7570 = (uint64_t)CFDictionaryCreate(v0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  else
  {
    fwrite("CFDictionaryCreate failed\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "CFDictionaryCreate failed", v4, 2u);
    }
  }
  return sub_224A75878((const void **)&v5);
}

void sub_224B098E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_224A75878((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_224B098FC(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 37000;
  *(unsigned char *)(a1 + 37016) = *(void *)a1 == 0;
  Extensiouint64_t n = (const __CFBoolean *)CMFormatDescriptionGetExtension(*(CMFormatDescriptionRef *)(a1 + 16), (CFStringRef)*MEMORY[0x263F00E68]);
  if (Extension)
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(Extension)) {
      *(unsigned char *)(v2 + 16) = CFBooleanGetValue(Extension) != 0;
    }
  }
  *(CMVideoDimensions *)uint64_t v2 = CMVideoFormatDescriptionGetDimensions(*(CMVideoFormatDescriptionRef *)(a1 + 16));
  CFDataRef v5 = sub_224B09CAC(*(const opaqueCMFormatDescription **)(a1 + 16));
  if (!v5)
  {
    fwrite("No av1C found\n", 0xEuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return 4294954387;
    }
    *(_WORD *)buf = 0;
    long long v10 = &_os_log_internal;
    uint64_t v11 = "No av1C found";
LABEL_13:
    uint32_t v12 = 2;
    goto LABEL_14;
  }
  CFDataRef v6 = v5;
  BytePtr = CFDataGetBytePtr(v5);
  unint64_t Length = CFDataGetLength(v6);
  unint64_t v9 = Length;
  if (Length <= 3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "av1C too small (%zu bytes)\n", Length);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v24 = v9;
      long long v10 = &_os_log_internal;
      uint64_t v11 = "av1C too small (%zu bytes)";
      uint32_t v12 = 12;
LABEL_14:
      _os_log_impl(&dword_224A74000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
    }
    return 4294954387;
  }
  int v13 = *(char *)BytePtr;
  if ((v13 & 0x80000000) == 0)
  {
    fwrite("av1C marker invalid\n", 0x14uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return 4294954387;
    }
    *(_WORD *)buf = 0;
    long long v10 = &_os_log_internal;
    uint64_t v11 = "av1C marker invalid";
    goto LABEL_13;
  }
  if ((v13 & 0x7F) != 1)
  {
    fwrite("Unsupported av1C version\n", 0x19uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v17 = &_os_log_internal;
      uint64_t v18 = "Unsupported av1C version";
      uint32_t v19 = 2;
      goto LABEL_22;
    }
    return 4294954386;
  }
  unsigned int v15 = BytePtr[1];
  if (v15 >= 0x60)
  {
    unsigned int v16 = v15 >> 5;
    fprintf((FILE *)*MEMORY[0x263EF8348], "Unsupported profile %d\n", v15 >> 5);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v16;
      uint64_t v17 = &_os_log_internal;
      uint64_t v18 = "Unsupported profile %d";
      uint32_t v19 = 8;
LABEL_22:
      _os_log_impl(&dword_224A74000, v17, OS_LOG_TYPE_ERROR, v18, buf, v19);
      return 4294954386;
    }
    return 4294954386;
  }
  UInt8 v20 = BytePtr[2];
  if ((v20 & 0x40) != 0) {
    int v21 = 10;
  }
  else {
    int v21 = 8;
  }
  if ((BytePtr[2] & 0x20) != 0) {
    int v21 = 12;
  }
  *(_DWORD *)(v2 + 12) = v21;
  if ((v20 & 0x10) != 0)
  {
    *(_DWORD *)(v2 + 8) = 0;
  }
  else
  {
    if ((v20 & 4) != 0)
    {
      int v22 = 1;
    }
    else if ((v20 & 8) != 0)
    {
      int v22 = 2;
    }
    else
    {
      int v22 = 3;
    }
    *(_DWORD *)(v2 + 8) = v22;
  }
  if (Length >= 5 && !sub_224ACCD84(buf, (unsigned __int8 *)BytePtr + 4, Length - 4))
  {
    if (!Extension) {
      *(unsigned char *)(v2 + 16) = v25 != 0;
    }
    *(unsigned char *)(v2 + 17) = v26 != 0;
  }
  return sub_224B07E7C((int32x2_t *)a1);
}

CFDictionaryRef sub_224B09CAC(const opaqueCMFormatDescription *a1)
{
  CFDictionaryRef result = (const __CFDictionary *)CMFormatDescriptionGetExtension(a1, (CFStringRef)*MEMORY[0x263F00E90]);
  if (result)
  {
    CFDictionaryRef v2 = result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v2))
    {
      CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(v2, @"av1C");
      if (result)
      {
        CFDictionaryRef v4 = result;
        CFTypeID v5 = CFArrayGetTypeID();
        if (v5 != CFGetTypeID(v4)
          || (result = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, 0), (CFDictionaryRef v4 = result) != 0))
        {
          CFTypeID v6 = CFDataGetTypeID();
          if (v6 == CFGetTypeID(v4)) {
            return v4;
          }
          else {
            return 0;
          }
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

const void **sub_224B09D5C(const void **a1, const void **a2)
{
  CFDictionaryRef v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = *a2;
  *a2 = 0;
  return a1;
}

uint64_t sub_224B09DA0(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1 + 37048;
  *(void *)(a1 + 37048) = dispatch_queue_create("com.apple.av1decoder.emit", 0);
  dispatch_group_t v5 = dispatch_group_create();
  *(void *)(v4 + 8) = v5;
  if (*(void *)v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    fwrite("Error allocating dispatch queue\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error allocating dispatch queue", (uint8_t *)&v9, 2u);
    }
    return 4294954392;
  }
  else
  {
    long long v16 = 0u;
    long long v12 = 0u;
    long long v11 = 0u;
    long long v9 = xmmword_224B159F0;
    uint64_t v13 = 0;
    long long v14 = sub_224B11AD8;
    uint64_t v10 = 0x100000000;
    long long v15 = xmmword_224B15A00;
    int v8 = *(_DWORD *)(v4 + 16);
    if (!v8)
    {
      sub_224B0343C();
      int v8 = dword_26AA96DA0;
      *(_DWORD *)(v4 + 16) = dword_26AA96DA0;
    }
    DWORD1(v9) = v8;
    HIDWORD(v9) = 0;
    if ((a2 & 1) == 0) {
      DWORD2(v9) = 1;
    }
    if (*(unsigned char *)(v4 + 21)) {
      LODWORD(v9) = 17;
    }
    *((void *)&v11 + 1) = a1;
    *(void *)&long long v12 = sub_224B0922C;
    *((void *)&v12 + 1) = sub_224B091D4;
    return sub_224B13194((uint64_t *)(a1 + 24), (unsigned int *)&v9);
  }
}

uint64_t sub_224B09F4C(uint64_t a1, opaqueCMSampleBuffer *a2, uint64_t **a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  BOOL v6 = (uint64_t *)(a1 + 37080);
  long long v7 = *a3;
  int v8 = operator new(0x18uLL);
  uint64_t v9 = *v7;
  v8[1] = v6;
  v8[2] = v9;
  uint64_t v10 = *v6;
  *int v8 = *v6;
  *(void *)(v10 + 8) = v8;
  *BOOL v6 = (uint64_t)v8;
  ++v6[2];
  DataBuffer = CMSampleBufferGetDataBuffer(a2);
  if (DataBuffer)
  {
    long long v12 = DataBuffer;
    size_t totalLengthOut = 0;
    size_t lengthAtOffsetOut = 0;
    dataPointerOut = 0;
    uint64_t DataPointer = CMBlockBufferGetDataPointer(DataBuffer, 0, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut);
    if (!DataPointer)
    {
      CMBlockBufferRef blockBufferOut = 0;
      if (lengthAtOffsetOut < totalLengthOut)
      {
        uint64_t DataPointer = CMBlockBufferCreateContiguous(0, v12, 0, 0, 0, totalLengthOut, 2u, &blockBufferOut);
        if (DataPointer) {
          goto LABEL_40;
        }
        uint64_t DataPointer = CMBlockBufferGetDataPointer(blockBufferOut, 0, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut);
        if (DataPointer) {
          goto LABEL_40;
        }
        if (lengthAtOffsetOut < totalLengthOut)
        {
          uint64_t DataPointer = 4294954392;
LABEL_40:
          sub_224B0A478((const void **)&blockBufferOut);
          return DataPointer;
        }
        long long v12 = blockBufferOut;
      }
      CFNumberRef v31 = 0;
      long long v29 = 0u;
      long long v30 = 0u;
      *(_OWORD *)buf = 0u;
      long long v28 = 0u;
      CFRetain(v12);
      size_t v14 = totalLengthOut;
      uint64_t DataPointer = 4294967274;
      if ((totalLengthOut & 0x8000000000000000) == 0)
      {
        long long v15 = dataPointerOut;
        if (dataPointerOut)
        {
          long long v16 = malloc_type_malloc(0x28uLL, 0x10C0040DB5B76A7uLL);
          if (v16)
          {
            *long long v16 = 0;
            v16[1] = v15;
            v16[2] = 0x100000001;
            v16[3] = sub_224B0A500;
            v16[4] = v12;
            *(void *)buf = v15;
            *(void *)&uint8_t buf[8] = v14;
            *(void *)&long long v29 = 0;
            CFNumberRef v31 = 0;
            *(void *)&long long v28 = v16;
            *((void *)&v28 + 1) = 0x8000000000000000;
            *((void *)&v29 + 1) = -1;
            long long v30 = v14;
            uint64_t v17 = *a3;
            uint64_t v18 = (atomic_uint *)malloc_type_malloc(0x28uLL, 0x10C0040DB5B76A7uLL);
            if (!v18)
            {
              *a3 = 0;
              fprintf((FILE *)*MEMORY[0x263EF8348], "Wrapping frame info struct failed with %d\n", -12);
              uint64_t DataPointer = 4294967284;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)int v36 = 67109120;
                int v37 = -12;
                _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Wrapping frame info struct failed with %d", v36, 8u);
                uint64_t DataPointer = 4294967284;
              }
              goto LABEL_39;
            }
            *(void *)uint64_t v18 = 0;
            *((void *)v18 + 1) = v17;
            *((void *)v18 + 2) = 0x100000001;
            *((void *)v18 + 3) = sub_224B0A4AC;
            *((void *)v18 + 4) = v17;
            *((void *)&v30 + 1) = v17;
            CFNumberRef v31 = v18;
            *a3 = 0;
            uint64_t v19 = *(void *)&buf[8];
            if (!*(void *)&buf[8])
            {
LABEL_34:
              uint64_t DataPointer = 0;
              goto LABEL_39;
            }
            while (1)
            {
              uint64_t v20 = *(void *)(a1 + 24);
              if (!v20) {
                break;
              }
              if (*(void *)buf)
              {
                if (v19 < 1) {
                  break;
                }
                *(_DWORD *)(v20 + 63088) = 0;
              }
              if (*(void *)(v20 + 176)) {
                goto LABEL_31;
              }
              if ((void)v28) {
                atomic_fetch_add_explicit((atomic_uint *volatile)(v28 + 16), 1u, memory_order_relaxed);
              }
              if (v31) {
                atomic_fetch_add_explicit(v31 + 4, 1u, memory_order_relaxed);
              }
              long long v21 = v30;
              *(_OWORD *)(v20 + 208) = v29;
              *(_OWORD *)(v20 + 224) = v21;
              *(void *)(v20 + 240) = v31;
              long long v22 = v28;
              *(_OWORD *)(v20 + 176) = *(_OWORD *)buf;
              *(_OWORD *)(v20 + 192) = v22;
              uint64_t DataPointer = sub_224AF7598(v20);
              if (!DataPointer)
              {
                sub_224AC7180((uint64_t)buf);
                goto LABEL_31;
              }
LABEL_29:
              if ((DataPointer & 0x80000000) != 0 && DataPointer != -35)
              {
                fprintf((FILE *)*MEMORY[0x263EF8348], "Sending data failed with %d\n", DataPointer);
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_39;
                }
                *(_DWORD *)int v36 = 67109120;
                int v37 = DataPointer;
                unint64_t v24 = &_os_log_internal;
                char v25 = "Sending data failed with %d";
                goto LABEL_38;
              }
LABEL_31:
              uint64_t v23 = sub_224B06B98(a1);
              uint64_t DataPointer = v23;
              if (v23 != -35 && v23)
              {
                fprintf((FILE *)*MEMORY[0x263EF8348], "Error %d pulling picture\n", v23);
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_39;
                }
                *(_DWORD *)int v36 = 67109120;
                int v37 = DataPointer;
                unint64_t v24 = &_os_log_internal;
                char v25 = "Error %d pulling picture";
LABEL_38:
                _os_log_impl(&dword_224A74000, v24, OS_LOG_TYPE_ERROR, v25, v36, 8u);
                goto LABEL_39;
              }
              uint64_t v19 = *(void *)&buf[8];
              if (!*(void *)&buf[8]) {
                goto LABEL_34;
              }
            }
            uint64_t DataPointer = 4294967274;
            goto LABEL_29;
          }
          uint64_t DataPointer = 4294967284;
        }
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "Wrapping data failed with %d\n", DataPointer);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v36 = 67109120;
        int v37 = DataPointer;
        unint64_t v24 = &_os_log_internal;
        char v25 = "Wrapping data failed with %d";
        goto LABEL_38;
      }
LABEL_39:
      sub_224AC7180((uint64_t)buf);
      goto LABEL_40;
    }
  }
  else
  {
    fwrite("No data buffer in sample buffer!\n\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "No data buffer in sample buffer!\n", buf, 2u);
    }
    return 4294954394;
  }
  return DataPointer;
}

void sub_224B0A444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  sub_224B0A478((const void **)va);
  _Unwind_Resume(a1);
}

const void **sub_224B0A478(const void **a1)
{
  CFDictionaryRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_224B0A4AC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_224AAEFC4((const void **)(a2 + 8));
    JUMPOUT(0x22A61D8D0);
  }
}

void sub_224B0A500(int a1, CFTypeRef cf)
{
}

uint64_t sub_224B0A508(uint64_t a1, CMAttachmentBearerRef target, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFBooleanRef v6 = (const __CFBoolean *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x263F01058], 0);
  if (v6)
  {
    CFBooleanRef v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v7))
      {
        sub_224B06A50(a1);
        sub_224AF729C(*(void *)(a1 + 24));
      }
    }
  }
  unsigned int v24 = 0;
  int valuePtr = -1;
  int v23 = 0;
  CFNumberRef v9 = (const __CFNumber *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x263F12448], 0);
  if (v9)
  {
    CFNumberRef v10 = v9;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFNumberGetTypeID()) {
      CFNumberGetValue(v10, kCFNumberSInt32Type, &valuePtr);
    }
  }
  CFNumberRef v12 = (const __CFNumber *)CMGetAttachment(target, @"IncompleteSample", 0);
  if (v12)
  {
    CFNumberRef v13 = v12;
    CFTypeID v14 = CFGetTypeID(v12);
    if (v14 == CFNumberGetTypeID()) {
      CFNumberGetValue(v13, kCFNumberSInt32Type, &v23);
    }
  }
  CFNumberRef v15 = (const __CFNumber *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x263F12450], 0);
  CFNumberRef v16 = v15;
  if (v15)
  {
    CFTypeID v17 = CFGetTypeID(v15);
    if (v17 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v16, kCFNumberSInt32Type, &v24);
      LODWORD(v16) = v24;
    }
    else
    {
      LODWORD(v16) = 0;
    }
  }
  uint64_t v18 = (_DWORD *)(a1 + 37072);
  if (v16 == *(_DWORD *)(a1 + 37072)) {
    goto LABEL_19;
  }
  sub_224B06A50(a1);
  LODWORD(v16) = v24;
  if (v24 <= 0x1F)
  {
    uint64_t v19 = *(void *)(a1 + 24);
    uint64_t v20 = (_DWORD *)(v19 + 63052);
    if (*(_DWORD *)(v19 + 63052) != v24)
    {
      sub_224AF729C(v19);
      *uint64_t v20 = v16;
      LODWORD(v16) = v24;
    }
LABEL_19:
    uint64_t result = 0;
    *uint64_t v18 = v16;
    long long v22 = (unsigned char *)*a3;
    v22[28] = v23 != 0;
    v22[29] = valuePtr;
    v22[30] = (_BYTE)v16;
    return result;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "Invalid operating point %d\n", v24);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v27 = v24;
    _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Invalid operating point %d", buf, 8u);
  }
  return 4294967274;
}

uint64_t *sub_224B0A790(uint64_t *result)
{
  uint64_t v1 = *result;
  *uint64_t result = 0;
  if (v1)
  {
    sub_224AAEFC4((const void **)(v1 + 8));
    JUMPOUT(0x22A61D8D0);
  }
  return result;
}

double sub_224B0A7F0(unsigned char *a1, _OWORD *a2, int a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a1[10] >= 0xEu) {
    int v3 = 14;
  }
  else {
    int v3 = a1[10];
  }
  uint64_t v4 = a1 + 11;
  dispatch_group_t v5 = a1 + 25;
  if (a3 && (a1[4] & 2) == 0)
  {
    if (a3 != 1)
    {
      if (a1[60] >= 0xAu) {
        int v3 = 10;
      }
      else {
        int v3 = a1[60];
      }
      uint64_t v4 = a1 + 61;
      dispatch_group_t v5 = a1 + 71;
      if (v3) {
        goto LABEL_12;
      }
LABEL_38:
      *(void *)&long long v29 = 0;
      a2[14] = 0u;
      a2[15] = 0u;
      a2[12] = 0u;
      a2[13] = 0u;
      a2[10] = 0u;
      a2[11] = 0u;
      a2[8] = 0u;
      a2[9] = 0u;
      a2[6] = 0u;
      a2[7] = 0u;
      a2[4] = 0u;
      a2[5] = 0u;
      a2[2] = 0u;
      a2[3] = 0u;
      *a2 = 0u;
      a2[1] = 0u;
      return *(double *)&v29;
    }
    if (a1[39] >= 0xAu) {
      int v3 = 10;
    }
    else {
      int v3 = a1[39];
    }
    uint64_t v4 = a1 + 40;
    dispatch_group_t v5 = a1 + 50;
  }
  if (!v3) {
    goto LABEL_38;
  }
LABEL_12:
  unsigned int v6 = *v4;
  if (*v4)
  {
    int8x16_t v7 = vld1q_dup_s8(v5);
    CFTypeID v8 = (int8x16_t *)v33;
    uint64_t v9 = *v4;
    do
    {
      *CFTypeID v8 = v7;
      CFTypeID v8 = (int8x16_t *)((char *)v8 + 1);
      --v9;
    }
    while (v9);
  }
  uint64_t v10 = (v3 - 1);
  if (v3 < 2)
  {
    unsigned int v14 = v6;
  }
  else
  {
    uint64_t v11 = 0;
    v12.i64[0] = 0x800000008;
    v12.i64[1] = 0x800000008;
    do
    {
      uint64_t v13 = v11 + 1;
      unsigned int v14 = v4[v11 + 1];
      int v15 = 256 - v6;
      if ((int)(v14 - v6) < (int)(256 - v6)) {
        int v15 = v14 - v6;
      }
      if ((int)(v14 - v6) >= 1 && v15 != 0)
      {
        uint64_t v17 = 0;
        unsigned int v18 = v5[v11];
        int32x4_t v19 = vdupq_n_s32((v5[v13] - v18) * (((v15 >> 1) + 0x10000) / v15));
        int16x8_t v20 = vdupq_n_s16(v18);
        long long v21 = &v33[v6];
        int32x4_t v22 = (int32x4_t)xmmword_224B159E0;
        int32x4_t v23 = (int32x4_t)xmmword_224B159D0;
        do
        {
          *(int8x8_t *)&v21[v17] = vmovn_s16(vaddq_s16(vraddhn_high_s32(vraddhn_s32(vmulq_s32(v22, v19), (int32x4_t)0), vmulq_s32(v23, v19), (int32x4_t)0), v20));
          int32x4_t v22 = vaddq_s32(v22, v12);
          int32x4_t v23 = vaddq_s32(v23, v12);
          v17 += 8;
        }
        while (v17 < v15);
      }
      uint64_t v11 = v13;
      unsigned int v6 = v14;
    }
    while (v13 != v10);
  }
  unsigned int v24 = &v5[v10];
  int8x16_t v25 = vld1q_dup_s8(v24);
  for (uint64_t i = v14; i != 256; ++i)
    *(int8x16_t *)&v33[i] = v25;
  unint64_t v27 = 0;
  do
  {
    uint64_t v28 = &a2[v27];
    long long v29 = *(_OWORD *)&v33[v27 * 16];
    long long v30 = *(_OWORD *)&v33[v27 * 16 + 16];
    *uint64_t v28 = v29;
    v28[1] = v30;
    BOOL v31 = v27 >= 14;
    v27 += 2;
  }
  while (!v31);
  return *(double *)&v29;
}

uint64_t sub_224B0AA1C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  int v4 = *(_DWORD *)(result + 4);
  uint64_t v5 = 12;
  if ((v4 & 0x10000) == 0) {
    uint64_t v5 = 18;
  }
  BOOL v6 = (v4 & 0x20000) == 0;
  uint64_t v7 = 984;
  if (v6) {
    uint64_t v7 = 1476;
  }
  uint64_t v8 = v7 + v5 + a2;
  uint64_t v9 = v8 + 23944;
  uint64_t v10 = v8 + 11972;
  uint64_t v11 = (__int16 *)(a3 + 0x2000);
  do
  {
    uint64_t v12 = 0;
    unint64_t v13 = -8;
    do
    {
      *(_OWORD *)(a3 + v12) = *(_OWORD *)(a2 + v12 + 1494);
      v14.val[0] = *(int16x8_t *)(v10 + v12);
      v14.val[1] = *(int16x8_t *)(v9 + v12);
      vst2q_s16(v11, v14);
      v11 += 16;
      v13 += 8;
      v12 += 16;
    }
    while (v13 < 0x38);
    a3 += v12;
    ++v3;
    v9 += 164;
    v10 += 164;
    a2 += 164;
  }
  while (v3 != 64);
  return result;
}

uint64_t sub_224B0AAB4(uint64_t result, uint64_t a2, _OWORD *a3)
{
  unsigned int v4 = *(_DWORD *)(result + 4);
  int v5 = (v4 >> 1) & 1;
  if (*(unsigned char *)(result + 39)) {
    int v5 = 1;
  }
  int v6 = *(_DWORD *)(result + 4) & 2;
  if (*(unsigned char *)(result + 60)) {
    int v6 = 2;
  }
  int v7 = (unsigned __int16)v4 >> 13;
  int v8 = ((v4 >> 8) & 3) - v7;
  char v9 = v8 + 4;
  if ((v4 & 0x10000) != 0) {
    uint64_t v10 = 44;
  }
  else {
    uint64_t v10 = 82;
  }
  unsigned int v11 = *(unsigned __int16 *)(result + 8);
  unsigned int v12 = v11 ^ 0xB524;
  unsigned int v13 = v11 ^ 0x49D8;
  signed int v14 = -(128 << v7);
  signed int v15 = (256 << v7) + ~(128 << v7);
  int v16 = v4 >> 6;
  int8x16_t v17 = *(int8x16_t *)(result + 105);
  int16x8_t v18 = vmovl_s8(*(int8x8_t *)v17.i8);
  v107.val[0] = (int8x16_t)vmovl_high_s8(v17);
  v107.val[1] = (int8x16_t)vmovl_s8(*(int8x8_t *)(result + 121));
  int16x8_t v19 = v18;
  v19.i16[7] = 0;
  unint64_t v20 = 0xFFFF1B1A19181716;
  int16x8_t v21 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)v18.i8, (int8x16_t)xmmword_224B15A10);
  int16x8_t v22 = (int16x8_t)vqtbl2q_s8(v107, (int8x16_t)xmmword_224B15A20);
  int16x4_t v23 = (int16x4_t)vextq_s8(v107.val[1], (int8x16_t)0, 0xAuLL).u64[0];
  int8x16_t v24 = *(int8x16_t *)(result + 130);
  int16x8_t v25 = vmovl_s8(*(int8x8_t *)v24.i8);
  v108.val[0] = (int8x16_t)vmovl_high_s8(v24);
  v108.val[1] = (int8x16_t)vmovl_s8(*(int8x8_t *)(result + 146));
  int16x8_t v26 = v25;
  v26.i16[7] = 0;
  int16x8_t v27 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)v25.i8, (int8x16_t)xmmword_224B15A10);
  int16x8_t v28 = (int16x8_t)vqtbl2q_s8(v108, (int8x16_t)xmmword_224B15A20);
  v29.i64[0] = vextq_s8(v108.val[1], (int8x16_t)0, 0xAuLL).u64[0];
  if (*(unsigned char *)(result + 10))
  {
    LODWORD(v30) = 0;
    char v31 = v16 + 6;
    v109.val[1] = (int8x16_t)vmovl_s8(*(int8x8_t *)(result + 97));
    int16x4_t v32 = (int16x4_t)vextq_s8(v109.val[1], (int8x16_t)0, 0xAuLL).u64[0];
    int16x4_t v33 = vdup_n_s16(*(char *)(result + 129));
    v33.i16[1] = *(char *)(result + 154);
    v29.i64[1] = v29.i64[0];
    int8x16_t v34 = *(int8x16_t *)(result + 81);
    v109.val[0] = (int8x16_t)vmovl_high_s8(v34);
    int16x8_t v35 = (int16x8_t)vqtbl2q_s8(v109, (int8x16_t)xmmword_224B15A20);
    int16x8_t v36 = vmovl_s8(*(int8x8_t *)v34.i8);
    int16x8_t v37 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)v36.i8, (int8x16_t)xmmword_224B15A10);
    int16x8_t v38 = v36;
    v38.i16[7] = 0;
    int v39 = 1 << (v8 + 3);
    if (v8 == -4) {
      int v39 = 0;
    }
    uint64_t result = (32 << v16);
    uint64_t v40 = a2 + 11972;
    int32x4_t v41 = vdupq_n_s32(-6 - v16);
    uint64_t v42 = a2 + 23944;
    int16x4_t v43 = vdup_n_s16(v15);
    int16x4_t v44 = vdup_n_s16(v14);
    uint64_t v45 = a2 + 24442;
    uint64_t v46 = a2 + 12470;
    uint64_t v47 = a2 + 12300;
    __int32 v105 = a3 - 48;
    int v48 = 4;
    unint64_t v49 = 3;
    uint64_t v101 = a2 + 23944;
    uint64_t v102 = a2 + 11972;
    uint64_t v50 = a2;
    do
    {
      if ((uint64_t)v49 >= (int)v30)
      {
        uint64_t v30 = (int)v30;
        uint64_t v51 = v101 + 164 * (int)v30;
        uint64_t v52 = v102 + 164 * (int)v30;
        uint64_t v53 = a2 + 164 * (int)v30;
        do
        {
          for (uint64_t i = 0; i != 164; i += 2)
          {
            unsigned int v11 = (v11 >> 1) & 0xFFFF7FFF | ((((v11 ^ (v11 >> 3) ^ (v11 >> 12)) ^ (v11 >> 1)) & 1) << 15);
            *(_WORD *)(v53 + i) = (v39 + word_224B28F0A[(unsigned __int16)v11 >> 5]) >> v9;
            if (v5)
            {
              unsigned int v12 = (v12 >> 1) & 0xFFFF7FFF | ((((v12 ^ (v12 >> 3) ^ (v12 >> 12)) ^ (v12 >> 1)) & 1) << 15);
              *(_WORD *)(v52 + i) = (v39 + word_224B28F0A[(unsigned __int16)v12 >> 5]) >> v9;
            }
            if (v6)
            {
              unsigned int v13 = (v13 >> 1) & 0xFFFF7FFF | ((((v13 ^ (v13 >> 3) ^ (v13 >> 12)) ^ (v13 >> 1)) & 1) << 15);
              *(_WORD *)(v51 + i) = (v39 + word_224B28F0A[(unsigned __int16)v13 >> 5]) >> v9;
            }
          }
          ++v30;
          v51 += 164;
          v52 += 164;
          v53 += 164;
        }
        while (v48 != v30);
        LODWORD(v30) = v48;
      }
      uint64_t v55 = 0;
      CGRect v56 = (void *)(a2 + 164 * v49);
      int16x4_t v57 = *(int16x4_t *)v56;
      v58.i64[0] = *(void *)((char *)v56 + 11972);
      v58.i64[1] = v56[2993];
      do
      {
        CFNumberRef v59 = (int16x4_t *)(v50 + v55);
        int v60 = ((vaddvq_s32(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)(v50 + v55), *(int16x4_t *)v36.i8), *(int16x8_t *)(v50 + v55), v38), *(int16x4_t *)(v50 + v55 + 164), *(int16x4_t *)v37.i8), *(int16x8_t *)(v50 + v55 + 164), v37), *(int16x4_t *)(v50 + v55 + 328), *(int16x4_t *)v35.i8), *(int16x8_t *)(v50 + v55 + 328), v35), v57, v32))
              + (int)result) >> v31)
            + *(__int16 *)(v50 + v55 + 498);
        if (v60 >= v15) {
          unsigned int v61 = v15;
        }
        else {
          unsigned int v61 = v60;
        }
        if (v60 <= v14) {
          unsigned int v62 = v14;
        }
        else {
          unsigned int v62 = v61;
        }
        v59[62].i16[1] = v62;
        int32x4_t v63 = vpaddq_s32(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)(v40 + v55), *(int16x4_t *)v18.i8), *(int16x8_t *)(v40 + v55), v19), *(int16x4_t *)(v40 + v55 + 164), *(int16x4_t *)v21.i8), *(int16x8_t *)(v40 + v55 + 164), v21), *(int16x4_t *)(v47 + v55), *(int16x4_t *)v22.i8), *(int16x8_t *)(v47 + v55), v22), *(int16x4_t *)v58.i8, v23),
                vmlal_high_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)(v42 + v55), *(int16x4_t *)v25.i8), *(int16x8_t *)(v42 + v55), v26), *(int16x4_t *)(v47 + v55 + 11808), *(int16x4_t *)v27.i8), *(int16x8_t *)(v47 + v55 + 11808), v27), v59[3034], *(int16x4_t *)v28.i8), *(int16x8_t *)v59[3034].i8, v28), v58, v29));
        *(int16x4_t *)&long long v3 = vmax_s16(vmin_s16(vqadd_s16(vqmovn_s32(vrshlq_s32(vmlal_s16(vpaddq_s32(v63, v63), vdup_n_s16(v62), v33), v41)), vzip1_s16(*(int16x4_t *)(v46 + v55), *(int16x4_t *)(v45 + v55))), v43), v44);
        int16x4_t v57 = (int16x4_t)vext_s8((int8x8_t)v57, (int8x8_t)v57, 2uLL);
        v57.i16[2] = v62;
        *(_WORD *)(v46 + v55) = v3;
        *(_WORD *)(v45 + v55) = WORD1(v3);
        int16x8_t v58 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)(&v3 - 1), (int8x16_t)xmmword_224B15A30);
        v55 += 2;
      }
      while (v55 != 152);
      if (a3 && v49 >= 9)
      {
        unint64_t v64 = -16;
        CFNumberRef v65 = v105;
        uint64_t v66 = v50;
        do
        {
          *CFNumberRef v65 = *(_OWORD *)(v66 + 510);
          v65[1] = *(_OWORD *)(v66 + 526);
          v65[512] = *(_OWORD *)(v66 + 12482);
          v65[513] = *(_OWORD *)(v66 + 12498);
          v65[1024] = *(_OWORD *)(v66 + 24454);
          v65[1025] = *(_OWORD *)(v66 + 24470);
          v64 += 16;
          v66 += 32;
          v65 += 2;
        }
        while (v64 < 0x30);
      }
      ++v49;
      ++v48;
      v45 += 164;
      v46 += 164;
      v50 += 164;
      v42 += 164;
      v47 += 164;
      v40 += 164;
      v105 += 8;
    }
    while (v49 != 73);
  }
  else if (*(unsigned __int8 *)(result + 60) | *(unsigned __int8 *)(result + 39))
  {
    int v67 = 0;
    uint64_t v68 = a2;
    CFNumberRef v69 = (long long *)(a2 + 24470);
    int v70 = (_OWORD *)(a2 + 12482);
    LODWORD(result) = 1 << (v8 + 3);
    if (v8 == -4) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = result;
    }
    uint64_t v71 = a2 + 11972;
    int32x4_t v72 = vdupq_n_s32(-6 - v16);
    int16x4_t v73 = vdup_n_s16(v15);
    int16x4_t v74 = vdup_n_s16(v14);
    uint64_t v75 = a2 + 23944;
    uint64_t v76 = a2 + 24442;
    uint64_t v77 = a2 + 12470;
    uint64_t v78 = a2 + 12300;
    int v79 = 4;
    unint64_t v80 = 3;
    CFNumberRef v81 = a3;
    uint64_t v106 = a2 + 23944;
    uint64_t v82 = a2 + 11972;
    do
    {
      if ((uint64_t)v80 >= v67)
      {
        uint64_t v85 = v67;
        CFDictionaryRef v86 = (_WORD *)(v106 + 164 * v67);
        int v87 = (_WORD *)(v82 + 164 * (int)v85);
        do
        {
          int v88 = v87;
          uint64_t v89 = v86;
          uint64_t v90 = v10;
          do
          {
            if (v5)
            {
              unsigned int v12 = (v12 >> 1) & 0xFFFF7FFF | ((((v12 ^ (v12 >> 3) ^ (v12 >> 12)) ^ (v12 >> 1)) & 1) << 15);
              *int v88 = ((int)result + word_224B28F0A[(unsigned __int16)v12 >> 5]) >> v9;
            }
            if (v6)
            {
              unsigned int v13 = (v13 >> 1) & 0xFFFF7FFF | ((((v13 ^ (v13 >> 3) ^ (v13 >> 12)) ^ (v13 >> 1)) & 1) << 15);
              *uint64_t v89 = ((int)result + word_224B28F0A[(unsigned __int16)v13 >> 5]) >> v9;
            }
            ++v89;
            ++v88;
            --v90;
          }
          while (v90);
          ++v85;
          v86 += 82;
          v87 += 82;
        }
        while (v79 != v85);
        int v67 = v79;
        uint64_t v84 = a3;
        uint64_t v83 = a2;
      }
      else
      {
        uint64_t v84 = a3;
        uint64_t v83 = a2;
      }
      uint64_t v91 = 0;
      uint64_t v92 = v83 + 164 * v80;
      v93.i64[0] = *(void *)(v92 + 11972);
      v93.i64[1] = *(void *)(v92 + 23944);
      do
      {
        int32x4_t v94 = vpaddq_s32(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)(v71 + v91), *(int16x4_t *)v18.i8), *(int16x8_t *)(v71 + v91), v19), *(int16x4_t *)(v71 + v91 + 164), *(int16x4_t *)v21.i8), *(int16x8_t *)(v71 + v91 + 164), v21), *(int16x4_t *)(v78 + v91), *(int16x4_t *)v22.i8), *(int16x8_t *)(v78 + v91), v22), *(int16x4_t *)v93.i8, v23),
                vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)(v75 + v91), *(int16x4_t *)v25.i8), *(int16x8_t *)(v75 + v91), v26), *(int16x4_t *)(v78 + v91 + 11808), *(int16x4_t *)v27.i8), *(int16x8_t *)(v78 + v91 + 11808), v27), *(int16x4_t *)(v68 + v91 + 24272), *(int16x4_t *)v28.i8), *(int16x8_t *)(v68 + v91 + 24272), v28), (int16x4_t)*(_OWORD *)&vextq_s8(v93, v93, 8uLL), *(int16x4_t *)v29.i8));
        int16x4_t v95 = vmax_s16(vmin_s16(vqadd_s16(vqmovn_s32(vrshlq_s32(vpaddq_s32(v94, v94), v72)), vzip1_s16(*(int16x4_t *)(v77 + v91), *(int16x4_t *)(v76 + v91))), v73), v74);
        *(_WORD *)(v77 + v91) = v95.i16[0];
        *(_WORD *)(v76 + v91) = v95.i16[1];
        int8x16_t v93 = vqtbl2q_s8(*(int8x16x2_t *)(&v20 - 3), (int8x16_t)xmmword_224B15A30);
        v91 += 2;
      }
      while (v91 != 152);
      if (v84 && v80 >= 9)
      {
        unint64_t v96 = -16;
        uint64_t v97 = v69;
        CFNumberRef v98 = v81;
        unsigned int v99 = v70;
        do
        {
          v98[464] = *v99;
          v98[465] = v99[1];
          v98[976] = *(v97 - 1);
          v96 += 16;
          long long v100 = *v97;
          v97 += 2;
          v98[977] = v100;
          v99 += 2;
          v98 += 2;
        }
        while (v96 < 0x30);
      }
      ++v80;
      ++v79;
      v76 += 164;
      v77 += 164;
      v68 += 164;
      v71 += 164;
      v75 += 164;
      v78 += 164;
      int v70 = (_OWORD *)((char *)v70 + 164);
      v81 += 8;
      CFNumberRef v69 = (long long *)((char *)v69 + 164);
    }
    while (v80 != 73);
  }
  return result;
}

uint64_t sub_224B0B20C(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v4 = *(unsigned __int8 *)(result + 39);
  unsigned int v5 = *(_DWORD *)(result + 4);
  int v6 = *(unsigned __int8 *)(result + 60);
  int v7 = (unsigned __int16)v5 >> 13;
  int v8 = ((v5 >> 8) & 3) - v7;
  int v9 = v8 + 4;
  uint64_t v10 = 44;
  if ((v5 & 0x10000) == 0) {
    uint64_t v10 = 82;
  }
  int v11 = *(unsigned __int16 *)(result + 8);
  unsigned int v12 = v5 & 0x20000;
  if ((v5 & 0x20000) != 0) {
    unint64_t v13 = 6;
  }
  else {
    unint64_t v13 = 9;
  }
  signed int v14 = -(128 << v7);
  signed int v15 = (256 << v7) + ~(128 << v7);
  int v16 = v5 >> 6;
  int v17 = *(unsigned __int8 *)(result + 10);
  int8x16_t v18 = *(int8x16_t *)(result + 105);
  int8x8_t v19 = *(int8x8_t *)(result + 121);
  int8x16_t v20 = *(int8x16_t *)(result + 130);
  int8x8_t v21 = *(int8x8_t *)(result + 146);
  __int16 v22 = *(char *)(result + 154);
  unsigned int v23 = *(char *)(result + 129);
  if (*(unsigned char *)(result + 10))
  {
    __int16 v116 = *(char *)(result + 154);
    int v24 = 0;
    v118.val[1] = (int8x16_t)vmovl_s8(*(int8x8_t *)(result + 97));
    int16x4_t v25 = (int16x4_t)vextq_s8(v118.val[1], (int8x16_t)0, 0xAuLL).u64[0];
    int8x16_t v26 = *(int8x16_t *)(result + 81);
    v118.val[0] = (int8x16_t)vmovl_high_s8(v26);
    int16x8_t v27 = (int16x8_t)vqtbl2q_s8(v118, (int8x16_t)xmmword_224B15A20);
    int16x8_t v28 = vmovl_s8(*(int8x8_t *)v26.i8);
    int16x8_t v29 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)v28.i8, (int8x16_t)xmmword_224B15A10);
    int16x8_t v30 = v28;
    int v31 = 1 << (v8 + 3);
    if (v8 == -4) {
      int v32 = 0;
    }
    else {
      int v32 = 1 << (v8 + 3);
    }
    uint64_t v33 = a3 - 768;
    int v34 = 4;
    v30.i16[7] = 0;
    unint64_t v35 = 3;
    uint64_t v36 = a2;
    unsigned int v37 = *(unsigned __int16 *)(result + 8);
    do
    {
      if ((uint64_t)v35 >= v24)
      {
        uint64_t v38 = v24;
        uint64_t v39 = a2 + 164 * v24;
        do
        {
          for (uint64_t i = 0; i != 164; i += 2)
          {
            unsigned int v37 = (v37 >> 1) & 0xFFFF7FFF | (((v37 ^ (v37 >> 3) ^ (v37 >> 12) ^ (v37 >> 1)) & 1) << 15);
            *(_WORD *)(v39 + i) = (v32 + word_224B28F0A[(unsigned __int16)v37 >> 5]) >> v9;
          }
          ++v38;
          v39 += 164;
        }
        while (v34 != v38);
        int v24 = v34;
      }
      uint64_t v41 = 0;
      int16x4_t v42 = *(int16x4_t *)(a2 + 164 * v35);
      do
      {
        int v43 = ((vaddvq_s32(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)(v36 + v41), *(int16x4_t *)v28.i8), *(int16x8_t *)(v36 + v41), v30), *(int16x4_t *)(v36 + v41 + 164), *(int16x4_t *)v29.i8), *(int16x8_t *)(v36 + v41 + 164), v29), *(int16x4_t *)(v36 + v41 + 328), *(int16x4_t *)v27.i8), *(int16x8_t *)(v36 + v41 + 328), v27), v42, v25))
              + (32 << v16)) >> (v16 + 6))
            + *(__int16 *)(v36 + v41 + 498);
        if (v43 >= v15) {
          __int16 v44 = v15;
        }
        else {
          __int16 v44 = v43;
        }
        if (v43 <= v14) {
          __int16 v45 = v14;
        }
        else {
          __int16 v45 = v44;
        }
        *(_WORD *)(v36 + v41 + 498) = v45;
        int16x4_t v42 = (int16x4_t)vext_s8((int8x8_t)v42, (int8x8_t)v42, 2uLL);
        v42.i16[2] = v45;
        v41 += 2;
      }
      while (v41 != 152);
      if (a3 && v35 >= 9)
      {
        uint64_t v46 = 0;
        unint64_t v47 = -16;
        do
        {
          int v48 = (_OWORD *)(v33 + v46);
          *int v48 = *(_OWORD *)(v36 + v46 + 510);
          v48[1] = *(_OWORD *)(v36 + v46 + 526);
          v47 += 16;
          v46 += 32;
        }
        while (v47 < 0x30);
      }
      ++v35;
      ++v34;
      v36 += 164;
      v33 += 128;
    }
    while (v35 != 73);
    __int16 v22 = v116;
  }
  else
  {
    if (!(v6 | v4)) {
      return result;
    }
    int v31 = 1 << (v8 + 3);
  }
  uint64_t v49 = 0;
  unsigned int v50 = v11 ^ 0xB524;
  unsigned int v51 = v11 ^ 0x49D8;
  int16x8_t v52 = vmovl_s8(*(int8x8_t *)v18.i8);
  v119.val[0] = (int8x16_t)vmovl_high_s8(v18);
  v119.val[1] = (int8x16_t)vmovl_s8(v19);
  int16x8_t v53 = v52;
  v53.i16[7] = 0;
  int16x8_t v54 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)v52.i8, (int8x16_t)xmmword_224B15A10);
  int16x8_t v55 = (int16x8_t)vqtbl2q_s8(v119, (int8x16_t)xmmword_224B15A20);
  int16x4_t v56 = (int16x4_t)vextq_s8(v119.val[1], (int8x16_t)0, 0xAuLL).u64[0];
  int16x8_t v57 = vmovl_s8(*(int8x8_t *)v20.i8);
  v120.val[0] = (int8x16_t)vmovl_high_s8(v20);
  v120.val[1] = (int8x16_t)vmovl_s8(v21);
  int16x8_t v58 = v57;
  v58.i16[7] = 0;
  int16x8_t v59 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)v57.i8, (int8x16_t)xmmword_224B15A10);
  int16x8_t v60 = (int16x8_t)vqtbl2q_s8(v120, (int8x16_t)xmmword_224B15A20);
  v61.i64[0] = vextq_s8(v120.val[1], (int8x16_t)0, 0xAuLL).u64[0];
  v61.i64[1] = v61.i64[0];
  int16x4_t v62 = vdup_n_s16(v23);
  v62.i16[1] = v22;
  int v63 = v4 | v5 & 2;
  uint64_t v64 = 38;
  if (!v12) {
    uint64_t v64 = 73;
  }
  uint64_t result = v63 == 0;
  BOOL v65 = (v6 | v5 & 2) == 0;
  int32x4_t v66 = vdupq_n_s32(-6 - v16);
  int16x4_t v67 = vdup_n_s16(v15);
  if (v9) {
    int v68 = v31;
  }
  else {
    int v68 = 0;
  }
  int16x4_t v69 = vdup_n_s16(v14);
  uint64_t v111 = v64;
  uint64_t v70 = 4;
  uint64_t v71 = 3;
  uint64_t v72 = 24442;
  uint64_t v73 = 12470;
  uint64_t v74 = 24272;
  uint64_t v75 = 12300;
  uint64_t v76 = 23944;
  uint64_t v77 = 11972;
  do
  {
    uint64_t v117 = v74;
    if (v71 >= (int)v49)
    {
      uint64_t v78 = v73;
      uint64_t v49 = (int)v49;
      uint64_t v79 = a2 + 23944 + 164 * (int)v49;
      uint64_t v80 = a2 + 11972 + 164 * (int)v49;
      do
      {
        CFNumberRef v81 = (_WORD *)v80;
        uint64_t v82 = (_WORD *)v79;
        uint64_t v83 = v10;
        do
        {
          if ((result & 1) == 0)
          {
            unsigned int v50 = (v50 >> 1) & 0xFFFF7FFF | ((((v50 ^ (v50 >> 3) ^ (v50 >> 12)) ^ (v50 >> 1)) & 1) << 15);
            *CFNumberRef v81 = (v68 + word_224B28F0A[(unsigned __int16)v50 >> 5]) >> v9;
          }
          if (!v65)
          {
            unsigned int v51 = (v51 >> 1) & 0xFFFF7FFF | ((((v51 ^ (v51 >> 3) ^ (v51 >> 12)) ^ (v51 >> 1)) & 1) << 15);
            *uint64_t v82 = (v68 + word_224B28F0A[(unsigned __int16)v51 >> 5]) >> v9;
          }
          ++v82;
          ++v81;
          --v83;
        }
        while (v83);
        ++v49;
        v79 += 164;
        v80 += 164;
      }
      while (v70 != v49);
      uint64_t v113 = v70;
      uint64_t v73 = v78;
      uint64_t v74 = v117;
    }
    else
    {
      uint64_t v113 = v49;
    }
    uint64_t v84 = a2 + 164 * v71;
    v87.i64[0] = *(void *)(v84 + 11972);
    uint64_t v85 = *(void *)(v84 + 23944);
    LODWORD(v84) = (v71 - 3) << (v12 >> 17);
    uint64_t v86 = 164 * ((int)v84 + 4) + 6;
    v87.i64[1] = v85;
    uint64_t v88 = 164 * ((int)v84 + 3) + 6;
    uint64_t v89 = v75;
    uint64_t v90 = v76;
    uint64_t v91 = v77;
    uint64_t v114 = v73;
    uint64_t v115 = v72;
    uint64_t v92 = v72;
    uint64_t v93 = 38;
    do
    {
      int16x8_t v94 = *(int16x8_t *)(a2 + v89 + 11808);
      int16x8_t v95 = *(int16x8_t *)(a2 + v74);
      int32x4_t v96 = vpaddq_s32(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)(a2 + v91), *(int16x4_t *)v52.i8), *(int16x8_t *)(a2 + v91), v53), *(int16x4_t *)(a2 + v91 + 164), *(int16x4_t *)v54.i8), *(int16x8_t *)(a2 + v91 + 164), v54), *(int16x4_t *)(a2 + v89), *(int16x4_t *)v55.i8), *(int16x8_t *)(a2 + v89), v55), *(int16x4_t *)v87.i8, v56),
              vmlal_high_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)(a2 + v90), *(int16x4_t *)v57.i8), *(int16x8_t *)(a2 + v90), v58), *(int16x4_t *)v94.i8, *(int16x4_t *)v59.i8), v94, v59), *(int16x4_t *)v95.i8, *(int16x4_t *)v60.i8), v95, v60), v87, v61));
      int32x4_t v97 = vpaddq_s32(v96, v96);
      if (v17)
      {
        v94.i32[0] = *(_DWORD *)(a2 + v88);
        if (v12)
        {
          v95.i32[0] = *(_DWORD *)(a2 + v86);
          int16x4_t v100 = (int16x4_t)vdup_lane_s32((int32x2_t)vadd_s16(*(int16x4_t *)v95.i8, *(int16x4_t *)v94.i8), 0);
          int16x4_t v99 = vrshr_n_s16(vpadd_s16(v100, v100), 2uLL);
        }
        else
        {
          int16x4_t v98 = (int16x4_t)vdup_lane_s32(*(int32x2_t *)v94.i8, 0);
          int16x4_t v99 = vrshr_n_s16(vpadd_s16(v98, v98), 1uLL);
        }
        int32x4_t v97 = vmlal_lane_s16(v97, v62, v99, 0);
      }
      uint64_t v101 = (_WORD *)(a2 + v92);
      *(int16x4_t *)&long long v3 = vmax_s16(vmin_s16(vqadd_s16(vqmovn_s32(vrshlq_s32(v97, v66)), vzip1_s16(*(int16x4_t *)(a2 + v73), *(int16x4_t *)(a2 + v92))), v67), v69);
      *(_WORD *)(a2 + v73) = v3;
      v92 += 2;
      *uint64_t v101 = WORD1(v3);
      v73 += 2;
      v86 += 4;
      v88 += 4;
      v74 += 2;
      int16x8_t v87 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)(&v3 - 1), (int8x16_t)xmmword_224B15A30);
      v91 += 2;
      v90 += 2;
      v89 += 2;
      --v93;
    }
    while (v93);
    if (a3 && v71 >= v13)
    {
      uint64_t v102 = 0;
      uint64_t v103 = a3 + ((uint64_t)((int)v71 - (int)v13) << 7);
      uint64_t v104 = v103 + 0x2000;
      uint64_t v105 = v103 + 0x4000;
      char v106 = 1;
      do
      {
        uint64_t v107 = a2 + 164 * v71;
        uint64_t v108 = 2 * v102;
        *(_OWORD *)(v104 + v108) = *(_OWORD *)(v107 + 11972 + (v108 | 0xC));
        uint64_t v109 = v108 | 0x10;
        *(_OWORD *)(v104 + v109) = *(_OWORD *)(v107 + 11972 + (v108 | 0x1C));
        char v110 = v106;
        *(_OWORD *)(v105 + v108) = *(_OWORD *)(v107 + 23944 + (v108 | 0xC));
        *(_OWORD *)(v105 + v109) = *(_OWORD *)(v107 + 23944 + (v108 | 0x1C));
        uint64_t v102 = 16;
        char v106 = 0;
      }
      while ((v110 & 1) != 0);
    }
    ++v71;
    uint64_t v70 = (v70 + 1);
    uint64_t v72 = v115 + 164;
    uint64_t v73 = v114 + 164;
    uint64_t v74 = v117 + 164;
    v77 += 164;
    v76 += 164;
    v75 += 164;
    uint64_t v49 = v113;
  }
  while (v71 != v111);
  return result;
}

uint64_t sub_224B0B864(uint64_t result, uint64_t a2, _OWORD *a3)
{
  unsigned int v4 = *(_DWORD *)(result + 4);
  int v5 = (v4 >> 1) & 1;
  if (*(unsigned char *)(result + 39)) {
    int v5 = 1;
  }
  int v6 = *(_DWORD *)(result + 4) & 2;
  if (*(unsigned char *)(result + 60)) {
    int v6 = 2;
  }
  int v7 = (unsigned __int16)v4 >> 13;
  int v8 = ((v4 >> 8) & 3) - v7;
  int v9 = v8 + 4;
  if ((v4 & 0x10000) != 0) {
    uint64_t v10 = 44;
  }
  else {
    uint64_t v10 = 82;
  }
  unsigned int v11 = *(unsigned __int16 *)(result + 8);
  unsigned int v12 = v11 ^ 0xB524;
  unsigned int v13 = v11 ^ 0x49D8;
  unsigned int v14 = -(128 << v7);
  unsigned int v15 = (256 << v7) + ~(128 << v7);
  int32x4_t v16 = vdupq_n_s32(-6 - (v4 >> 6));
  int8x16_t v17 = *(int8x16_t *)(result + 105);
  int16x8_t v18 = vmovl_s8(*(int8x8_t *)v17.i8);
  int16x8_t v19 = vmovl_high_s8(v17);
  int8x16_t v20 = *(int8x16_t *)(result + 130);
  int16x8_t v21 = vmovl_s8(*(int8x8_t *)v20.i8);
  int16x8_t v22 = vmovl_high_s8(v20);
  int16x4_t v23 = (int16x4_t)vzip2_s32(*(int32x2_t *)v19.i8, *(int32x2_t *)v22.i8);
  uint64_t v132 = a3;
  if (*(unsigned char *)(result + 10))
  {
    uint64_t v24 = 0;
    int8x16_t v25 = *(int8x16_t *)(result + 81);
    int v26 = 1 << (v8 + 3);
    int16x8_t v27 = vmovl_s8(*(int8x8_t *)v25.i8);
    int8x16_t v28 = (int8x16_t)vmovl_high_s8(v25);
    int16x4_t v29 = (int16x4_t)vextq_s8(v28, v28, 4uLL).u64[0];
    if (v8 == -4) {
      int v26 = 0;
    }
    int16x4_t v30 = vdup_n_s16(v15);
    uint64_t v31 = a2 + 11972;
    uint64_t v32 = a2 + 23944;
    uint64_t v33 = a2 + 498;
    int16x4_t v34 = vdup_n_s16(v14);
    uint64_t result = a2 + 24442;
    uint64_t v35 = a2 + 12470;
    uint64_t v36 = a3 - 48;
    uint64_t v37 = 4;
    unint64_t v38 = 3;
    uint64_t v39 = a2;
    do
    {
      if ((uint64_t)v38 >= (int)v24)
      {
        uint64_t v40 = (int)v24;
        uint64_t v41 = v32 + 164 * (int)v24;
        uint64_t v42 = v31 + 164 * (int)v24;
        uint64_t v43 = a2 + 164 * (int)v40;
        do
        {
          for (uint64_t i = 0; i != 164; i += 2)
          {
            unsigned int v11 = (v11 >> 1) & 0xFFFF7FFF | ((((v11 ^ (v11 >> 3) ^ (v11 >> 12)) ^ (v11 >> 1)) & 1) << 15);
            *(_WORD *)(v43 + i) = (v26 + word_224B28F0A[(unsigned __int16)v11 >> 5]) >> v9;
            if (v5)
            {
              unsigned int v12 = (v12 >> 1) & 0xFFFF7FFF | ((((v12 ^ (v12 >> 3) ^ (v12 >> 12)) ^ (v12 >> 1)) & 1) << 15);
              *(_WORD *)(v42 + i) = (v26 + word_224B28F0A[(unsigned __int16)v12 >> 5]) >> v9;
            }
            if (v6)
            {
              unsigned int v13 = (v13 >> 1) & 0xFFFF7FFF | ((((v13 ^ (v13 >> 3) ^ (v13 >> 12)) ^ (v13 >> 1)) & 1) << 15);
              *(_WORD *)(v41 + i) = (v26 + word_224B28F0A[(unsigned __int16)v13 >> 5]) >> v9;
            }
          }
          ++v40;
          v41 += 164;
          v42 += 164;
          v43 += 164;
        }
        while (v37 != v40);
        uint64_t v133 = v37;
      }
      else
      {
        uint64_t v133 = v24;
      }
      uint64_t v45 = a2 + 164 * v38;
      v46.i64[0] = *(void *)(v45 + 2);
      v49.i64[0] = *(void *)(v45 + 11974);
      unint64_t v47 = v38 - 2;
      unint64_t v48 = v38 - 1;
      v49.i32[1] = *(_DWORD *)(v45 + 23946);
      uint64_t v50 = v35;
      uint64_t v51 = result;
      uint64_t v134 = v33;
      uint64_t v52 = v33;
      unint64_t v53 = 3;
      do
      {
        uint64_t v54 = 0;
        uint64_t v55 = 2 * (v53 - 2);
        v137.val[0] = *(int8x16_t *)(a2 + 164 * v47 + v55);
        v137.val[1] = *(int8x16_t *)(a2 + 164 * v48 + v55);
        int16x8_t v56 = (int16x8_t)vqtbl2q_s8(v137, (int8x16_t)xmmword_224B15A40);
        int16x8_t v57 = (int16x8_t)vqtbl2q_s8(v137, (int8x16_t)xmmword_224B15A50);
        int16x8_t v58 = (int16x8_t)vqtbl2q_s8(v137, (int8x16_t)xmmword_224B15A60);
        int16x8_t v59 = (int16x8_t)vqtbl2q_s8(v137, (int8x16_t)xmmword_224B15A70);
        int32x4_t v60 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v56.i8, *(int16x4_t *)v27.i8, 1), *(int16x4_t *)v137.val[0].i8, *(int16x4_t *)v27.i8, 0), *(int16x4_t *)v57.i8, *(int16x4_t *)v27.i8, 2), *(int16x4_t *)v58.i8, *(int16x4_t *)v27.i8, 3), *(int16x4_t *)v59.i8,
                          v27,
                          4),
                        *(int16x4_t *)v137.val[1].i8,
                        v27,
                        5),
                      v56,
                      v27,
                      6),
                    v57,
                    v27,
                    7),
                  v58,
                  *(int16x4_t *)v28.i8,
                  0),
                v59,
                *(int16x4_t *)v28.i8,
                1);
        do
        {
          int32x4_t v61 = vmull_s16(*(int16x4_t *)v46.i8, v29);
          int16x4_t v62 = (const __int16 *)(v52 + v54);
          int16x4_t v63 = vld1_dup_s16(v62);
          *(int16x4_t *)v61.uint64_t i8 = vmax_s16(vmin_s16(vqadd_s16(vqmovn_s32(vrshlq_s32(vaddq_s32(vpaddq_s32(v61, v61), v60), v16)), v63), v30), v34);
          *(_WORD *)(v52 + v54) = v61.i16[0];
          v46.i64[1] = v61.i64[0];
          *(int8x8_t *)v46.uint64_t i8 = vqtbl1_s8(v46, (int8x8_t)151520002);
          int32x4_t v60 = (int32x4_t)vextq_s8((int8x16_t)v60, (int8x16_t)v60, 4uLL);
          v54 += 2;
        }
        while (v54 != 8);
        uint64_t v64 = 0;
        v138.val[0] = *(int8x16_t *)(v31 + 164 * v47 + v55);
        v138.val[1] = *(int8x16_t *)(v31 + 164 * v48 + v55);
        int16x8_t v65 = (int16x8_t)vqtbl2q_s8(v138, (int8x16_t)xmmword_224B15A40);
        int16x8_t v66 = (int16x8_t)vqtbl2q_s8(v138, (int8x16_t)xmmword_224B15A50);
        int16x8_t v67 = (int16x8_t)vqtbl2q_s8(v138, (int8x16_t)xmmword_224B15A60);
        int16x8_t v68 = (int16x8_t)vqtbl2q_s8(v138, (int8x16_t)xmmword_224B15A70);
        int32x4_t v69 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v65.i8, *(int16x4_t *)v18.i8, 1), *(int16x4_t *)v138.val[0].i8, *(int16x4_t *)v18.i8, 0), *(int16x4_t *)v66.i8, *(int16x4_t *)v18.i8, 2), *(int16x4_t *)v67.i8, *(int16x4_t *)v18.i8, 3), *(int16x4_t *)v68.i8,
                          v18,
                          4),
                        *(int16x4_t *)v138.val[1].i8,
                        v18,
                        5),
                      v65,
                      v18,
                      6),
                    v66,
                    v18,
                    7),
                  v67,
                  *(int16x4_t *)v19.i8,
                  0),
                v68,
                *(int16x4_t *)v19.i8,
                1);
        v138.val[0] = *(int8x16_t *)(v32 + 164 * v47 + v55);
        v138.val[1] = *(int8x16_t *)(v32 + 164 * v48 + v55);
        int16x8_t v70 = (int16x8_t)vqtbl2q_s8(v138, (int8x16_t)xmmword_224B15A40);
        int16x8_t v71 = (int16x8_t)vqtbl2q_s8(v138, (int8x16_t)xmmword_224B15A50);
        int16x8_t v72 = (int16x8_t)vqtbl2q_s8(v138, (int8x16_t)xmmword_224B15A60);
        int16x8_t v73 = (int16x8_t)vqtbl2q_s8(v138, (int8x16_t)xmmword_224B15A70);
        int32x4_t v74 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v70.i8, *(int16x4_t *)v21.i8, 1), *(int16x4_t *)v138.val[0].i8, *(int16x4_t *)v21.i8, 0), *(int16x4_t *)v71.i8, *(int16x4_t *)v21.i8, 2), *(int16x4_t *)v72.i8, *(int16x4_t *)v21.i8, 3), *(int16x4_t *)v73.i8,
                          v21,
                          4),
                        *(int16x4_t *)v138.val[1].i8,
                        v21,
                        5),
                      v70,
                      v21,
                      6),
                    v71,
                    v21,
                    7),
                  v72,
                  *(int16x4_t *)v22.i8,
                  0),
                v73,
                *(int16x4_t *)v22.i8,
                1);
        v138.val[0].i64[0] = *(void *)(a2 + 164 * v38 + 2 * v53);
        int32x4_t v75 = vmlal_laneq_s16(v69, *(int16x4_t *)v138.val[0].i8, v19, 4);
        int32x4_t v76 = vmlal_laneq_s16(v74, *(int16x4_t *)v138.val[0].i8, v22, 4);
        int8x16_t v77 = (int8x16_t)vzip2q_s32(v75, v76);
        int32x4_t v78 = vzip1q_s32(v75, v76);
        do
        {
          int32x4_t v79 = vmull_s16(*(int16x4_t *)v49.i8, v23);
          uint64_t v80 = (const __int16 *)(v50 + v64);
          int16x4_t v81 = vld1_dup_s16(v80);
          v81.i16[1] = *(_WORD *)(v51 + v64);
          *(int16x4_t *)v79.uint64_t i8 = vmax_s16(vmin_s16(vqadd_s16(vqmovn_s32(vrshlq_s32(vaddq_s32(vpaddq_s32(v79, v79), v78), v16)), v81), v30), v34);
          *(_WORD *)(v50 + v64) = v79.i16[0];
          *(_WORD *)(v51 + v64) = v79.i16[1];
          v49.i64[1] = v79.i64[0];
          *(int8x8_t *)v49.uint64_t i8 = vqtbl1_s8(v49, (int8x8_t)0xB0A070609080302);
          int32x4_t v78 = (int32x4_t)vextq_s8((int8x16_t)v78, v77, 8uLL);
          int8x16_t v77 = vextq_s8(v77, v77, 8uLL);
          v64 += 2;
        }
        while (v64 != 8);
        v52 += 8;
        v51 += 8;
        v50 += 8;
        BOOL v82 = v53 >= 0x4B;
        v53 += 4;
      }
      while (!v82);
      if (a3 && v38 >= 9)
      {
        unint64_t v83 = -16;
        uint64_t v84 = v36;
        uint64_t v85 = v39;
        do
        {
          *uint64_t v84 = *(_OWORD *)(v85 + 510);
          v84[1] = *(_OWORD *)(v85 + 526);
          v84[512] = *(_OWORD *)(v85 + 12482);
          v84[513] = *(_OWORD *)(v85 + 12498);
          v84[1024] = *(_OWORD *)(v85 + 24454);
          v84[1025] = *(_OWORD *)(v85 + 24470);
          v83 += 16;
          v85 += 32;
          v84 += 2;
        }
        while (v83 < 0x30);
      }
      ++v38;
      uint64_t v37 = (v37 + 1);
      uint64_t v33 = v134 + 164;
      result += 164;
      v35 += 164;
      v39 += 164;
      v36 += 8;
      uint64_t v24 = v133;
    }
    while (v38 != 73);
  }
  else if (*(unsigned __int8 *)(result + 39) | *(unsigned __int8 *)(result + 60))
  {
    uint64_t v86 = 0;
    int16x8_t v87 = (long long *)(a2 + 24470);
    uint64_t v88 = (_OWORD *)(a2 + 12482);
    int v89 = 1 << (v8 + 3);
    if (!v9) {
      int v89 = 0;
    }
    uint64_t v90 = a2 + 11972;
    uint64_t result = a2 + 23944;
    int16x4_t v91 = vdup_n_s16(v15);
    int16x4_t v92 = vdup_n_s16(v14);
    uint64_t v93 = a2 + 24442;
    uint64_t v94 = a2 + 12470;
    uint64_t v95 = 4;
    unint64_t v96 = 3;
    do
    {
      if ((uint64_t)v96 >= (int)v86)
      {
        uint64_t v97 = (int)v86;
        int16x4_t v98 = (_WORD *)(result + 164 * (int)v86);
        int16x4_t v99 = (_WORD *)(v90 + 164 * (int)v86);
        do
        {
          int16x4_t v100 = v99;
          uint64_t v101 = v98;
          uint64_t v102 = v10;
          do
          {
            if (v5)
            {
              unsigned int v12 = (v12 >> 1) & 0xFFFF7FFF | ((((v12 ^ (v12 >> 3) ^ (v12 >> 12)) ^ (v12 >> 1)) & 1) << 15);
              *int16x4_t v100 = (v89 + word_224B28F0A[(unsigned __int16)v12 >> 5]) >> v9;
            }
            if (v6)
            {
              unsigned int v13 = (v13 >> 1) & 0xFFFF7FFF | ((((v13 ^ (v13 >> 3) ^ (v13 >> 12)) ^ (v13 >> 1)) & 1) << 15);
              *uint64_t v101 = (v89 + word_224B28F0A[(unsigned __int16)v13 >> 5]) >> v9;
            }
            ++v101;
            ++v100;
            --v102;
          }
          while (v102);
          ++v97;
          v98 += 82;
          v99 += 82;
        }
        while (v95 != v97);
        uint64_t v135 = v95;
      }
      else
      {
        uint64_t v135 = v86;
      }
      uint64_t v103 = a2 + 164 * v96;
      v105.i64[0] = *(void *)(v103 + 11974);
      unint64_t v104 = v96 - 2;
      v105.i32[1] = *(_DWORD *)(v103 + 23946);
      unint64_t v106 = v96 - 1;
      uint64_t v107 = v94;
      uint64_t v108 = v93;
      unint64_t v109 = 3;
      do
      {
        uint64_t v110 = 0;
        uint64_t v111 = 2 * v109 - 4;
        v136.val[0] = *(int8x16_t *)(v90 + 164 * v104 + v111);
        v136.val[1] = *(int8x16_t *)(v90 + 164 * v106 + v111);
        int16x8_t v112 = (int16x8_t)vqtbl2q_s8(v136, (int8x16_t)xmmword_224B15A40);
        int16x8_t v113 = (int16x8_t)vqtbl2q_s8(v136, (int8x16_t)xmmword_224B15A50);
        int16x8_t v114 = (int16x8_t)vqtbl2q_s8(v136, (int8x16_t)xmmword_224B15A60);
        int16x8_t v115 = (int16x8_t)vqtbl2q_s8(v136, (int8x16_t)xmmword_224B15A70);
        int32x4_t v116 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v112.i8, *(int16x4_t *)v18.i8, 1), *(int16x4_t *)v136.val[0].i8, *(int16x4_t *)v18.i8, 0), *(int16x4_t *)v113.i8, *(int16x4_t *)v18.i8, 2), *(int16x4_t *)v114.i8, *(int16x4_t *)v18.i8, 3), *(int16x4_t *)v115.i8,
                           v18,
                           4),
                         *(int16x4_t *)v136.val[1].i8,
                         v18,
                         5),
                       v112,
                       v18,
                       6),
                     v113,
                     v18,
                     7),
                   v114,
                   *(int16x4_t *)v19.i8,
                   0),
                 v115,
                 *(int16x4_t *)v19.i8,
                 1);
        v136.val[0] = *(int8x16_t *)(result + 164 * v104 + v111);
        v136.val[1] = *(int8x16_t *)(result + 164 * v106 + v111);
        int16x8_t v117 = (int16x8_t)vqtbl2q_s8(v136, (int8x16_t)xmmword_224B15A40);
        int16x8_t v118 = (int16x8_t)vqtbl2q_s8(v136, (int8x16_t)xmmword_224B15A50);
        int16x8_t v119 = (int16x8_t)vqtbl2q_s8(v136, (int8x16_t)xmmword_224B15A60);
        int16x8_t v120 = (int16x8_t)vqtbl2q_s8(v136, (int8x16_t)xmmword_224B15A70);
        int32x4_t v121 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v117.i8, *(int16x4_t *)v21.i8, 1), *(int16x4_t *)v136.val[0].i8, *(int16x4_t *)v21.i8, 0), *(int16x4_t *)v118.i8, *(int16x4_t *)v21.i8, 2), *(int16x4_t *)v119.i8, *(int16x4_t *)v21.i8, 3), *(int16x4_t *)v120.i8,
                           v21,
                           4),
                         *(int16x4_t *)v136.val[1].i8,
                         v21,
                         5),
                       v117,
                       v21,
                       6),
                     v118,
                     v21,
                     7),
                   v119,
                   *(int16x4_t *)v22.i8,
                   0),
                 v120,
                 *(int16x4_t *)v22.i8,
                 1);
        int8x16_t v122 = (int8x16_t)vzip2q_s32(v116, v121);
        int32x4_t v123 = vzip1q_s32(v116, v121);
        do
        {
          int32x4_t v124 = vmull_s16(*(int16x4_t *)v105.i8, v23);
          CFMutableDictionaryRef v125 = (const __int16 *)(v107 + v110);
          int16x4_t v126 = vld1_dup_s16(v125);
          v126.i16[1] = *(_WORD *)(v108 + v110);
          *(int16x4_t *)v124.uint64_t i8 = vmax_s16(vmin_s16(vqadd_s16(vqmovn_s32(vrshlq_s32(vaddq_s32(vpaddq_s32(v124, v124), v123), v16)), v126), v91), v92);
          *(_WORD *)(v107 + v110) = v124.i16[0];
          *(_WORD *)(v108 + v110) = v124.i16[1];
          v105.i64[1] = v124.i64[0];
          *(int8x8_t *)v105.uint64_t i8 = vqtbl1_s8(v105, (int8x8_t)0xB0A070609080302);
          int32x4_t v123 = (int32x4_t)vextq_s8((int8x16_t)v123, v122, 8uLL);
          int8x16_t v122 = vextq_s8(v122, v122, 8uLL);
          v110 += 2;
        }
        while (v110 != 8);
        v108 += 8;
        v107 += 8;
        BOOL v82 = v109 >= 0x4B;
        v109 += 4;
      }
      while (!v82);
      if (v132 && v96 >= 9)
      {
        unint64_t v127 = -16;
        int v128 = v87;
        int v129 = a3;
        int v130 = v88;
        do
        {
          v129[464] = *v130;
          v129[465] = v130[1];
          v129[976] = *(v128 - 1);
          v127 += 16;
          long long v131 = *v128;
          v128 += 2;
          v129[977] = v131;
          v130 += 2;
          v129 += 2;
        }
        while (v127 < 0x30);
      }
      ++v96;
      uint64_t v95 = (v95 + 1);
      v93 += 164;
      v94 += 164;
      uint64_t v88 = (_OWORD *)((char *)v88 + 164);
      a3 += 8;
      int16x8_t v87 = (long long *)((char *)v87 + 164);
      uint64_t v86 = v135;
    }
    while (v96 != 73);
  }
  return result;
}

uint64_t sub_224B0C090(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(unsigned __int8 *)(result + 39);
  unsigned int v4 = *(_DWORD *)(result + 4);
  int v5 = *(unsigned __int8 *)(result + 60);
  int v6 = (unsigned __int16)v4 >> 13;
  int v7 = ((v4 >> 8) & 3) - v6;
  int v8 = v7 + 4;
  uint64_t v9 = 44;
  if ((v4 & 0x10000) == 0) {
    uint64_t v9 = 82;
  }
  uint64_t v124 = v9;
  unsigned int v10 = *(unsigned __int16 *)(result + 8);
  unsigned int v11 = -(128 << v6);
  unsigned int v12 = v4 & 0x20000;
  if ((v4 & 0x20000) != 0) {
    uint64_t v13 = 6;
  }
  else {
    uint64_t v13 = 9;
  }
  unint64_t v126 = v13;
  unsigned int v14 = (256 << v6) + ~(128 << v6);
  int32x4_t v15 = vdupq_n_s32(-6 - (v4 >> 6));
  uint64_t v16 = 38;
  if ((v4 & 0x20000) == 0) {
    uint64_t v16 = 73;
  }
  uint64_t v125 = v16;
  int v17 = *(unsigned __int8 *)(result + 10);
  int8x16_t v18 = *(int8x16_t *)(result + 105);
  int8x16_t v19 = *(int8x16_t *)(result + 130);
  int8x16_t v20 = (int8x16_t *)&unk_224B15000;
  if (*(unsigned char *)(result + 10))
  {
    int v21 = 0;
    int16x8_t v22 = (_OWORD *)(a2 + 510);
    int8x16_t v23 = *(int8x16_t *)(result + 81);
    int16x8_t v24 = vmovl_s8(*(int8x8_t *)v23.i8);
    int8x16_t v25 = (int8x16_t)vmovl_high_s8(v23);
    int16x4_t v26 = (int16x4_t)vextq_s8(v25, v25, 4uLL).u64[0];
    int v27 = 1 << (v7 + 3);
    if (v7 == -4) {
      int v28 = 0;
    }
    else {
      int v28 = 1 << (v7 + 3);
    }
    int16x4_t v29 = vdup_n_s16(v14);
    int16x4_t v30 = vdup_n_s16(v11);
    uint64_t v31 = a2 + 498;
    uint64_t v32 = (_OWORD *)(a3 - 768);
    int v33 = 4;
    unint64_t v34 = 3;
    unsigned int v35 = v10;
    do
    {
      if ((uint64_t)v34 >= v21)
      {
        uint64_t v36 = v21;
        uint64_t v37 = a2 + 164 * v21;
        do
        {
          for (uint64_t i = 0; i != 164; i += 2)
          {
            unsigned int v35 = (v35 >> 1) & 0xFFFF7FFF | ((((v35 ^ (v35 >> 3) ^ (v35 >> 12)) ^ (v35 >> 1)) & 1) << 15);
            *(_WORD *)(v37 + i) = (v28 + word_224B28F0A[(unsigned __int16)v35 >> 5]) >> v8;
          }
          ++v36;
          v37 += 164;
        }
        while (v33 != v36);
        int v21 = v33;
      }
      v39.i64[0] = *(void *)(a2 + 164 * v34 + 2);
      uint64_t v40 = v31;
      unint64_t v41 = 3;
      do
      {
        uint64_t v42 = 0;
        uint64_t v43 = 2 * v41 - 4;
        v131.val[0] = *(int8x16_t *)(a2 + 164 * (v34 - 2) + v43);
        v131.val[1] = *(int8x16_t *)(a2 + 164 * (v34 - 1) + v43);
        int16x8_t v44 = (int16x8_t)vqtbl2q_s8(v131, (int8x16_t)xmmword_224B15A40);
        int16x8_t v45 = (int16x8_t)vqtbl2q_s8(v131, (int8x16_t)xmmword_224B15A50);
        int16x8_t v46 = (int16x8_t)vqtbl2q_s8(v131, (int8x16_t)xmmword_224B15A60);
        int16x8_t v47 = (int16x8_t)vqtbl2q_s8(v131, (int8x16_t)xmmword_224B15A70);
        int32x4_t v48 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v44.i8, *(int16x4_t *)v24.i8, 1), *(int16x4_t *)v131.val[0].i8, *(int16x4_t *)v24.i8, 0), *(int16x4_t *)v45.i8, *(int16x4_t *)v24.i8, 2), *(int16x4_t *)v46.i8, *(int16x4_t *)v24.i8, 3), *(int16x4_t *)v47.i8,
                          v24,
                          4),
                        *(int16x4_t *)v131.val[1].i8,
                        v24,
                        5),
                      v44,
                      v24,
                      6),
                    v45,
                    v24,
                    7),
                  v46,
                  *(int16x4_t *)v25.i8,
                  0),
                v47,
                *(int16x4_t *)v25.i8,
                1);
        do
        {
          int32x4_t v49 = vmull_s16(*(int16x4_t *)v39.i8, v26);
          uint64_t v50 = (const __int16 *)(v40 + v42);
          int16x4_t v51 = vld1_dup_s16(v50);
          *(int16x4_t *)v49.uint64_t i8 = vmax_s16(vmin_s16(vqadd_s16(vqmovn_s32(vrshlq_s32(vaddq_s32(vpaddq_s32(v49, v49), v48), v15)), v51), v29), v30);
          *(_WORD *)(v40 + v42) = v49.i16[0];
          v39.i64[1] = v49.i64[0];
          *(int8x8_t *)v39.uint64_t i8 = vqtbl1_s8(v39, (int8x8_t)151520002);
          int32x4_t v48 = (int32x4_t)vextq_s8((int8x16_t)v48, (int8x16_t)v48, 4uLL);
          v42 += 2;
        }
        while (v42 != 8);
        v40 += 8;
        BOOL v52 = v41 >= 0x4B;
        v41 += 4;
      }
      while (!v52);
      if (a3 && v34 >= 9)
      {
        unint64_t v53 = -16;
        uint64_t v54 = v32;
        uint64_t v55 = v22;
        do
        {
          *uint64_t v54 = *v55;
          v54[1] = v55[1];
          v53 += 16;
          v55 += 2;
          v54 += 2;
        }
        while (v53 < 0x30);
      }
      ++v34;
      ++v33;
      v31 += 164;
      int16x8_t v22 = (_OWORD *)((char *)v22 + 164);
      v32 += 8;
    }
    while (v34 != 73);
    int8x16_t v20 = (int8x16_t *)&unk_224B15000;
  }
  else
  {
    if (!(v3 | v5)) {
      return result;
    }
    int v27 = 1 << (v7 + 3);
    int16x4_t v29 = vdup_n_s16(v14);
    int16x4_t v30 = vdup_n_s16(v11);
  }
  uint64_t v56 = 0;
  int16x8_t v57 = (_WORD *)(a2 + 24442);
  int16x8_t v58 = (__int16 *)(a2 + 12470);
  unsigned int v59 = v10 ^ 0xB524;
  uint64_t result = v10 ^ 0x49D8;
  int16x8_t v60 = vmovl_s8(*(int8x8_t *)v18.i8);
  int16x8_t v61 = vmovl_high_s8(v18);
  int16x8_t v62 = vmovl_s8(*(int8x8_t *)v19.i8);
  int16x8_t v63 = vmovl_high_s8(v19);
  int16x4_t v64 = (int16x4_t)vzip2_s32(*(int32x2_t *)v61.i8, *(int32x2_t *)v63.i8);
  BOOL v65 = (v3 | v4 & 2) == 0;
  BOOL v66 = (v5 | v4 & 2) == 0;
  if (v8) {
    int v67 = v27;
  }
  else {
    int v67 = 0;
  }
  uint64_t v68 = a2 + 11972;
  uint64_t v69 = a2 + 23944;
  uint64_t v70 = 3;
  int8x16_t v71 = v20[166];
  uint64_t v72 = 4;
  do
  {
    if (v70 >= (int)v56)
    {
      uint64_t v73 = (int)v56;
      int32x4_t v74 = (_WORD *)(v69 + 164 * (int)v56);
      int32x4_t v75 = (_WORD *)(v68 + 164 * (int)v73);
      do
      {
        int32x4_t v76 = v75;
        int8x16_t v77 = v74;
        uint64_t v78 = v124;
        do
        {
          if (!v65)
          {
            unsigned int v59 = (v59 >> 1) & 0xFFFF7FFF | ((((v59 ^ (v59 >> 3) ^ (v59 >> 12)) ^ (v59 >> 1)) & 1) << 15);
            *int32x4_t v76 = (v67 + word_224B28F0A[(unsigned __int16)v59 >> 5]) >> v8;
          }
          if (!v66)
          {
            uint64_t result = (result >> 1) & 0xFFFF7FFF | ((((result ^ (result >> 3) ^ (result >> 12)) ^ (result >> 1)) & 1) << 15);
            *int8x16_t v77 = (v67 + word_224B28F0A[(unsigned __int16)result >> 5]) >> v8;
          }
          ++v77;
          ++v76;
          --v78;
        }
        while (v78);
        ++v73;
        v74 += 82;
        v75 += 82;
      }
      while (v72 != v73);
      uint64_t v128 = v72;
    }
    else
    {
      uint64_t v128 = v56;
    }
    uint64_t v79 = a2 + 164 * v70;
    v80.i64[0] = *(void *)(v79 + 11974);
    v80.i32[1] = *(_DWORD *)(v79 + 23946);
    uint64_t v81 = v70 - 2;
    uint64_t v82 = v70 - 1;
    uint64_t v83 = ((int)v70 - 3) << (v12 >> 17);
    uint64_t v84 = v83 + 3;
    uint64_t v85 = v83 + 4;
    LODWORD(v86) = 38;
    int v129 = v58;
    int v130 = v57;
    int16x8_t v87 = v57;
    unint64_t v88 = 3;
    do
    {
      uint64_t v89 = 2 * v88 - 4;
      v132.val[0] = *(int8x16_t *)(v68 + 164 * v81 + v89);
      v132.val[1] = *(int8x16_t *)(v68 + 164 * v82 + v89);
      int v90 = v86 - 4;
      int16x8_t v91 = (int16x8_t)vqtbl2q_s8(v132, (int8x16_t)xmmword_224B15A40);
      int16x8_t v92 = (int16x8_t)vqtbl2q_s8(v132, (int8x16_t)xmmword_224B15A50);
      int16x8_t v93 = (int16x8_t)vqtbl2q_s8(v132, v71);
      int16x8_t v94 = (int16x8_t)vqtbl2q_s8(v132, (int8x16_t)xmmword_224B15A70);
      int32x4_t v95 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v91.i8, *(int16x4_t *)v60.i8, 1), *(int16x4_t *)v132.val[0].i8, *(int16x4_t *)v60.i8, 0), *(int16x4_t *)v92.i8, *(int16x4_t *)v60.i8, 2), *(int16x4_t *)v93.i8, *(int16x4_t *)v60.i8, 3), *(int16x4_t *)v94.i8,
                        v60,
                        4),
                      *(int16x4_t *)v132.val[1].i8,
                      v60,
                      5),
                    v91,
                    v60,
                    6),
                  v92,
                  v60,
                  7),
                v93,
                *(int16x4_t *)v61.i8,
                0),
              v94,
              *(int16x4_t *)v61.i8,
              1);
      long long v96 = *(_OWORD *)(v69 + 164 * v81 + v89);
      if ((int)v86 >= 4) {
        uint64_t v86 = 4;
      }
      else {
        uint64_t v86 = v86;
      }
      long long v97 = *(_OWORD *)(v69 + 164 * v82 + v89);
      int16x8_t v98 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)&v96, (int8x16_t)xmmword_224B15A40);
      int16x8_t v99 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)&v96, (int8x16_t)xmmword_224B15A50);
      int16x8_t v100 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)&v96, v71);
      int16x8_t v101 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)&v96, (int8x16_t)xmmword_224B15A70);
      int32x4_t v102 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmlal_high_laneq_s16(vmlal_high_laneq_s16(vmlal_laneq_s16(vmlal_laneq_s16(vmlal_lane_s16(vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v98.i8, *(int16x4_t *)v62.i8, 1), *(int16x4_t *)&v96, *(int16x4_t *)v62.i8, 0), *(int16x4_t *)v99.i8, *(int16x4_t *)v62.i8, 2), *(int16x4_t *)v100.i8, *(int16x4_t *)v62.i8, 3), *(int16x4_t *)v101.i8,
                         v62,
                         4),
                       *(int16x4_t *)&v97,
                       v62,
                       5),
                     v98,
                     v62,
                     6),
                   v99,
                   v62,
                   7),
                 v100,
                 *(int16x4_t *)v63.i8,
                 0),
               v101,
               *(int16x4_t *)v63.i8,
               1);
      if (v17)
      {
        uint64_t v103 = 2 * (2 * v88 - 3);
        int16x8_t v104 = *(int16x8_t *)(a2 + 164 * v84 + v103);
        if (v12)
        {
          int16x8_t v106 = vaddq_s16(*(int16x8_t *)(a2 + 164 * v85 + v103), v104);
          int16x4_t v105 = (int16x4_t)vrshrq_n_s16(vpaddq_s16(v106, v106), 2uLL).u64[0];
        }
        else
        {
          int16x4_t v105 = (int16x4_t)vrshrq_n_s16(vpaddq_s16(v104, v104), 1uLL).u64[0];
        }
        int32x4_t v95 = vmlal_laneq_s16(v95, v105, v61, 4);
        int32x4_t v102 = vmlal_laneq_s16(v102, v105, v63, 4);
      }
      int8x16_t v107 = (int8x16_t)vzip2q_s32(v95, v102);
      int32x4_t v108 = vzip1q_s32(v95, v102);
      unint64_t v109 = v58;
      uint64_t v110 = v87;
      uint64_t v111 = v58;
      int16x8_t v112 = v87;
      do
      {
        int32x4_t v113 = vmull_s16(*(int16x4_t *)v80.i8, v64);
        int16x4_t v114 = vld1_dup_s16(v111++);
        v114.i16[1] = *v112++;
        *(int16x4_t *)v113.uint64_t i8 = vmax_s16(vmin_s16(vqadd_s16(vqmovn_s32(vrshlq_s32(vaddq_s32(vpaddq_s32(v113, v113), v108), v15)), v114), v29), v30);
        *unint64_t v109 = v113.i16[0];
        *uint64_t v110 = v113.i16[1];
        v80.i64[1] = v113.i64[0];
        *(int8x8_t *)v80.uint64_t i8 = vqtbl1_s8(v80, (int8x8_t)0xB0A070609080302);
        int32x4_t v108 = (int32x4_t)vextq_s8((int8x16_t)v108, v107, 8uLL);
        int8x16_t v107 = vextq_s8(v107, v107, 8uLL);
        unint64_t v109 = (__int16 *)v111;
        uint64_t v110 = v112;
        --v86;
      }
      while (v86);
      v87 += 4;
      v58 += 4;
      LODWORD(v86) = v90;
      BOOL v52 = v88 >= 0x25;
      v88 += 4;
    }
    while (!v52);
    if (a3 && v70 >= v126)
    {
      uint64_t v115 = 0;
      uint64_t v116 = a3 + ((uint64_t)((int)v70 - (int)v126) << 7);
      uint64_t v117 = v116 + 0x2000;
      uint64_t v118 = v116 + 0x4000;
      char v119 = 1;
      do
      {
        uint64_t v120 = a2 + 164 * v70;
        uint64_t v121 = 2 * v115;
        *(_OWORD *)(v117 + v121) = *(_OWORD *)(v120 + 11972 + (v121 | 0xC));
        uint64_t v122 = v121 | 0x10;
        *(_OWORD *)(v117 + v122) = *(_OWORD *)(v120 + 11972 + (v121 | 0x1C));
        char v123 = v119;
        *(_OWORD *)(v118 + v121) = *(_OWORD *)(v120 + 23944 + (v121 | 0xC));
        *(_OWORD *)(v118 + v122) = *(_OWORD *)(v120 + 23944 + (v121 | 0x1C));
        uint64_t v115 = 16;
        char v119 = 0;
      }
      while ((v123 & 1) != 0);
    }
    ++v70;
    uint64_t v72 = (v72 + 1);
    int16x8_t v57 = v130 + 82;
    int16x8_t v58 = v129 + 82;
    uint64_t v56 = v128;
  }
  while (v70 != v125);
  return result;
}

uint64_t sub_224B0C754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  LODWORD(v4) = 0;
  v125[78] = *MEMORY[0x263EF8340];
  int v5 = (_OWORD *)(a2 + 348);
  int v123 = *(unsigned __int8 *)(a1 + 39);
  unsigned int v6 = *(_DWORD *)(a1 + 4);
  int v7 = *(unsigned __int8 *)(a1 + 60);
  int v8 = (unsigned __int16)v6 >> 13;
  int v9 = ((v6 >> 8) & 3) - v8;
  char v11 = v9 + 4;
  BOOL v10 = v9 == -4;
  unsigned int v12 = *(unsigned __int16 *)(a1 + 8) ^ 0xB524;
  int v13 = -(128 << v8);
  int v14 = (256 << v8) + ~(128 << v8);
  char v15 = (v6 >> 6) + 6;
  int8x8_t v16 = *(int8x8_t *)(a1 + 81);
  int16x4_t v17 = (int16x4_t)vmovl_s8(v16).u64[0];
  int v18 = v16.i8[3];
  int v19 = 1 << (v9 + 3);
  if (v10) {
    int v19 = 0;
  }
  int v20 = 32 << (v6 >> 6);
  uint64_t v21 = a2 + 498;
  int16x8_t v22 = (_OWORD *)(a2 + 510);
  int8x16_t v23 = (_OWORD *)(a3 - 768);
  unsigned int v24 = *(unsigned __int16 *)(a1 + 8);
  int v25 = 4;
  unint64_t v26 = 3;
  unsigned int v27 = v24;
  do
  {
    if ((uint64_t)v26 >= (int)v4)
    {
      uint64_t v4 = (int)v4;
      uint64_t v28 = a2 + 164 * (int)v4;
      do
      {
        for (uint64_t i = 0; i != 164; i += 2)
        {
          unsigned int v27 = (v27 >> 1) & 0xFFFF7FFF | (((v27 ^ (v27 >> 3) ^ (v27 >> 12) ^ (v27 >> 1)) & 1) << 15);
          *(_WORD *)(v28 + i) = (v19 + word_224B28F0A[(unsigned __int16)v27 >> 5]) >> v11;
        }
        ++v4;
        v28 += 164;
      }
      while (v25 != v4);
      LODWORD(v4) = v25;
    }
    int16x8_t v30 = *(int16x8_t *)(a2 + 164 * v26 - 160);
    unint64_t v31 = -5;
    uint64_t v32 = (int8x16_t *)v5;
    int v33 = (int32x4_t *)v125;
    do
    {
      int8x16_t v34 = *v32++;
      int16x8_t v35 = (int16x8_t)vextq_s8((int8x16_t)v30, v34, 2uLL);
      int16x8_t v36 = (int16x8_t)vextq_s8((int8x16_t)v30, v34, 4uLL);
      v33[-1] = vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v35.i8, v17, 1), *(int16x4_t *)v30.i8, v17, 0), *(int16x4_t *)v36.i8, v17, 2);
      *int v33 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmull_high_lane_s16(v35, v17, 1), v30, v17, 0), v36, v17, 2);
      v31 += 8;
      v33 += 2;
      int16x8_t v30 = (int16x8_t)v34;
    }
    while (v31 < 0x47);
    uint64_t v37 = 0;
    int v38 = *(__int16 *)(a2 + 164 * v26 + 4);
    do
    {
      int v39 = ((v20 + v38 * v18 + v124[v37]) >> v15) + *(__int16 *)(v21 + 2 * v37);
      if (v39 >= v14) {
        int v38 = v14;
      }
      else {
        int v38 = ((v20 + v38 * v18 + v124[v37]) >> v15) + *(__int16 *)(v21 + 2 * v37);
      }
      if (v39 <= v13) {
        int v38 = v13;
      }
      *(_WORD *)(v21 + 2 * v37++) = v38;
    }
    while (v37 != 76);
    if (a3 && v26 >= 9)
    {
      unint64_t v40 = -16;
      unint64_t v41 = v23;
      uint64_t v42 = v22;
      do
      {
        *unint64_t v41 = *v42;
        v41[1] = v42[1];
        v40 += 16;
        v42 += 2;
        v41 += 2;
      }
      while (v40 < 0x30);
    }
    ++v26;
    ++v25;
    int v5 = (_OWORD *)((char *)v5 + 164);
    v21 += 164;
    int16x8_t v22 = (_OWORD *)((char *)v22 + 164);
    v23 += 8;
  }
  while (v26 != 73);
  uint64_t v43 = 0;
  int v44 = v123 | v6 & 2;
  int v45 = v7 | v6 & 2;
  unsigned int v46 = v24 ^ 0x49D8;
  if ((v6 & 0x10000) != 0) {
    uint64_t v47 = 44;
  }
  else {
    uint64_t v47 = 82;
  }
  unint64_t v48 = *(unsigned int *)(a1 + 4);
  int v49 = v48 & 0x10000;
  unsigned int v50 = v48 & 0x20000;
  uint64_t v51 = 38;
  if ((v48 & 0x20000) == 0) {
    uint64_t v51 = 73;
  }
  uint64_t v114 = v51;
  if ((v48 & 0x20000) != 0) {
    uint64_t v52 = 6;
  }
  else {
    uint64_t v52 = 9;
  }
  int v53 = *(unsigned __int8 *)(a1 + 10);
  int8x8_t v54 = *(int8x8_t *)(a1 + 105);
  int16x8_t v55 = vmovl_s8(v54);
  int8x8_t v56 = *(int8x8_t *)(a1 + 130);
  uint64_t result = v54.i8[3];
  int v58 = v56.i8[3];
  int16x8_t v59 = vmovl_s8(v56);
  BOOL v60 = v44 == 0;
  BOOL v61 = v45 == 0;
  if (v49) {
    unint64_t v62 = 41;
  }
  else {
    unint64_t v62 = 79;
  }
  int v121 = v48 & 0x10000;
  uint64_t v122 = (v48 >> 16) & 1;
  unint64_t v113 = 0x40uLL >> (BYTE2(v48) & 1);
  uint64_t v63 = 12;
  if (!v49) {
    uint64_t v63 = 18;
  }
  unint64_t v112 = v52;
  int16x4_t v64 = (_OWORD *)(a2 + v63);
  int v65 = 192 - (v52 << 6);
  uint64_t v66 = 4;
  uint64_t v67 = 3;
  uint64_t v68 = a2;
  uint64_t v115 = v47;
  do
  {
    uint64_t v118 = v64;
    unint64_t v120 = v67;
    if (v67 >= (int)v43)
    {
      uint64_t v69 = (int)v43;
      uint64_t v70 = a2 + 23944 + 164 * (int)v43;
      uint64_t v71 = a2 + 11972 + 164 * (int)v43;
      do
      {
        uint64_t v72 = (_WORD *)v71;
        uint64_t v73 = (_WORD *)v70;
        uint64_t v74 = v47;
        do
        {
          if (!v60)
          {
            unsigned int v12 = (v12 >> 1) & 0xFFFF7FFF | ((((v12 ^ (v12 >> 3) ^ (v12 >> 12)) ^ (v12 >> 1)) & 1) << 15);
            *uint64_t v72 = (v19 + word_224B28F0A[(unsigned __int16)v12 >> 5]) >> v11;
          }
          if (!v61)
          {
            unsigned int v46 = (v46 >> 1) & 0xFFFF7FFF | ((((v46 ^ (v46 >> 3) ^ (v46 >> 12)) ^ (v46 >> 1)) & 1) << 15);
            *uint64_t v73 = (v19 + word_224B28F0A[(unsigned __int16)v46 >> 5]) >> v11;
          }
          ++v73;
          ++v72;
          --v74;
        }
        while (v74);
        ++v69;
        v70 += 164;
        v71 += 164;
      }
      while (v66 != v69);
      uint64_t v116 = v66;
      uint64_t v67 = v120;
    }
    else
    {
      uint64_t v116 = v43;
    }
    int v117 = v65;
    int32x4_t v75 = (_OWORD *)(a3 + 8208 + 2 * v65);
    uint64_t v76 = a2 + 164 * v67;
    int8x16_t v77 = *(int8x16_t *)(v76 + 11812);
    int8x16_t v78 = *(int8x16_t *)(v76 + 23784);
    uint64_t v79 = ((int)v67 - 3) << (v50 >> 17);
    uint64_t v80 = v79 + 3;
    uint64_t v81 = v79 + 4;
    uint64_t v82 = (int32x4_t *)v124;
    uint64_t v83 = v68;
    for (unint64_t j = 3; j < v62; j += 8)
    {
      int16x8_t v85 = (int16x8_t)v77;
      int16x8_t v86 = (int16x8_t)v78;
      int8x16_t v77 = *(int8x16_t *)(v83 + 12320);
      int16x8_t v87 = (int16x8_t)vextq_s8((int8x16_t)v85, v77, 2uLL);
      int16x8_t v88 = (int16x8_t)vextq_s8((int8x16_t)v85, v77, 4uLL);
      int32x4_t v89 = vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v87.i8, *(int16x4_t *)v55.i8, 1), *(int16x4_t *)v85.i8, *(int16x4_t *)v55.i8, 0), *(int16x4_t *)v88.i8, *(int16x4_t *)v55.i8, 2);
      int32x4_t v90 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmull_high_lane_s16(v87, *(int16x4_t *)v55.i8, 1), v85, *(int16x4_t *)v55.i8, 0), v88, *(int16x4_t *)v55.i8, 2);
      int8x16_t v78 = *(int8x16_t *)(v83 + 24292);
      int16x8_t v91 = (int16x8_t)vextq_s8((int8x16_t)v86, v78, 2uLL);
      int16x8_t v92 = (int16x8_t)vextq_s8((int8x16_t)v86, v78, 4uLL);
      int32x4_t v93 = vmlal_lane_s16(vmlal_lane_s16(vmull_lane_s16(*(int16x4_t *)v91.i8, *(int16x4_t *)v59.i8, 1), *(int16x4_t *)v86.i8, *(int16x4_t *)v59.i8, 0), *(int16x4_t *)v92.i8, *(int16x4_t *)v59.i8, 2);
      int32x4_t v94 = vmlal_high_lane_s16(vmlal_high_lane_s16(vmull_high_lane_s16(v91, *(int16x4_t *)v59.i8, 1), v86, *(int16x4_t *)v59.i8, 0), v92, *(int16x4_t *)v59.i8, 2);
      if (v53)
      {
        uint64_t v95 = ((int)j - 3) << v122;
        uint64_t v96 = 2 * (v95 + 3);
        int16x8_t v97 = *(int16x8_t *)(a2 + 164 * v80 + v96);
        if (v50)
        {
          int16x8_t v97 = vrshrq_n_s16(vpaddq_s16(vaddq_s16(*(int16x8_t *)(a2 + 164 * v81 + v96), v97), vaddq_s16(*(int16x8_t *)(a2 + 164 * v81 + 2 * v95 + 22), *(int16x8_t *)(a2 + 164 * v80 + 2 * v95 + 22))), 2uLL);
        }
        else if (v121)
        {
          int16x8_t v97 = vrshrq_n_s16(vpaddq_s16(v97, *(int16x8_t *)(a2 + 164 * v80 + 2 * v95 + 22)), 1uLL);
        }
        int32x4_t v89 = vmlal_laneq_s16(v89, *(int16x4_t *)v97.i8, v55, 4);
        int32x4_t v90 = vmlal_high_laneq_s16(v90, v97, v55, 4);
        int32x4_t v93 = vmlal_laneq_s16(v93, *(int16x4_t *)v97.i8, v59, 4);
        int32x4_t v94 = vmlal_high_laneq_s16(v94, v97, v59, 4);
      }
      *uint64_t v82 = v89;
      v82[1] = v90;
      v82[20] = v93;
      v82[21] = v94;
      v83 += 16;
      v82 += 2;
    }
    uint64_t v98 = a2 + 164 * v120;
    int v99 = *(__int16 *)(v98 + 11976);
    int v100 = *(__int16 *)(v98 + 23948);
    int16x8_t v101 = v124;
    uint64_t v102 = 12470;
    uint64_t v103 = 24442;
    unint64_t v104 = v62 - 3;
    do
    {
      int v106 = ((v20 + v99 * (int)result + *v101) >> v15) + *(__int16 *)(v68 + v102);
      if (v106 >= v14) {
        int v107 = v14;
      }
      else {
        int v107 = v106;
      }
      if (v106 <= v13) {
        int v99 = v13;
      }
      else {
        int v99 = v107;
      }
      int v105 = v101[80];
      int v108 = ((v20 + v100 * v58 + v105) >> v15) + *(__int16 *)(v68 + v103);
      if (v108 >= v14) {
        int v109 = v14;
      }
      else {
        int v109 = ((v20 + v100 * v58 + v105) >> v15) + *(__int16 *)(v68 + v103);
      }
      if (v108 <= v13) {
        int v100 = v13;
      }
      else {
        int v100 = v109;
      }
      *(_WORD *)(v68 + v102) = v99;
      *(_WORD *)(v68 + v103) = v100;
      v103 += 2;
      v102 += 2;
      ++v101;
      --v104;
    }
    while (v104);
    if (a3 && v120 >= v112)
    {
      unint64_t v110 = 0;
      uint64_t v111 = v118;
      do
      {
        *(v75 - 1) = v111[779];
        *int32x4_t v75 = v111[780];
        v75[511] = *(_OWORD *)((char *)v111 + 24436);
        v75[512] = *(_OWORD *)((char *)v111 + 24452);
        v110 += 16;
        v111 += 2;
        v75 += 2;
      }
      while (v110 < v113);
    }
    uint64_t v67 = v120 + 1;
    uint64_t v66 = (v66 + 1);
    v68 += 164;
    int16x4_t v64 = (_OWORD *)((char *)v118 + 164);
    int v65 = v117 + 64;
    uint64_t v47 = v115;
    uint64_t v43 = v116;
  }
  while (v120 + 1 != v114);
  return result;
}

uint64_t sub_224B0CDF0(uint64_t result, uint64_t a2, int16x8_t *a3, double a4, int16x4_t a5, int16x4_t a6)
{
  unsigned int v6 = *(_DWORD *)(result + 4);
  int v7 = (v6 >> 1) & 1;
  if (*(unsigned char *)(result + 39)) {
    int v7 = 1;
  }
  int v8 = *(_DWORD *)(result + 4) & 2;
  if (*(unsigned char *)(result + 60)) {
    int v8 = 2;
  }
  int v9 = (unsigned __int16)v6 >> 13;
  int v10 = ((v6 >> 8) & 3) - v9;
  int v11 = v10 + 4;
  if ((v6 & 0x10000) != 0) {
    uint64_t v12 = 44;
  }
  else {
    uint64_t v12 = 82;
  }
  unsigned int v13 = *(unsigned __int16 *)(result + 8);
  unsigned int v14 = v13 ^ 0xB524;
  unsigned int v15 = v13 ^ 0x49D8;
  unsigned int v16 = -(128 << v9);
  unsigned int v17 = (256 << v9) + ~(128 << v9);
  if (*(unsigned char *)(result + 10))
  {
    uint64_t v18 = 0;
    LODWORD(v19) = 0;
    int32x4_t v20 = vdupq_n_s32(-6 - (v6 >> 6));
    a5.i32[0] = *(char *)(result + 130);
    a6.i32[0] = *(char *)(result + 105);
    int v21 = 1 << (v10 + 3);
    if (v10 == -4) {
      int v21 = 0;
    }
    int16x8_t v22 = vdupq_n_s16(v17);
    int16x8_t v23 = vdupq_n_s16(v16);
    LODWORD(result) = 10;
    uint64_t v24 = a2;
    int v25 = a3;
    do
    {
      if (v18 + 9 >= (int)v19)
      {
        uint64_t v19 = (int)v19;
        uint64_t v26 = a2 + 23944 + 164 * (int)v19;
        uint64_t v27 = a2 + 11972 + 164 * (int)v19;
        uint64_t v28 = a2 + 164 * (int)v19;
        do
        {
          for (uint64_t i = 0; i != 164; i += 2)
          {
            unsigned int v13 = (v13 >> 1) & 0xFFFF7FFF | ((((v13 ^ (v13 >> 3) ^ (v13 >> 12)) ^ (v13 >> 1)) & 1) << 15);
            *(_WORD *)(v28 + i) = (v21 + word_224B28F0A[(unsigned __int16)v13 >> 5]) >> v11;
            if (v7)
            {
              unsigned int v14 = (v14 >> 1) & 0xFFFF7FFF | ((((v14 ^ (v14 >> 3) ^ (v14 >> 12)) ^ (v14 >> 1)) & 1) << 15);
              *(_WORD *)(v27 + i) = (v21 + word_224B28F0A[(unsigned __int16)v14 >> 5]) >> v11;
            }
            if (v8)
            {
              unsigned int v15 = (v15 >> 1) & 0xFFFF7FFF | ((((v15 ^ (v15 >> 3) ^ (v15 >> 12)) ^ (v15 >> 1)) & 1) << 15);
              *(_WORD *)(v26 + i) = (v21 + word_224B28F0A[(unsigned __int16)v15 >> 5]) >> v11;
            }
          }
          ++v19;
          v26 += 164;
          v27 += 164;
          v28 += 164;
        }
        while (result != v19);
        LODWORD(v19) = result;
      }
      unint64_t v30 = -8;
      uint64_t v31 = v24;
      uint64_t v32 = v25;
      do
      {
        int16x8_t v33 = vmaxq_s16(vminq_s16(*(int16x8_t *)(v31 + 1494), v22), v23);
        *(int16x8_t *)(v31 + 1494) = v33;
        int16x8_t v34 = vmaxq_s16(vminq_s16(vqaddq_s16(*(int16x8_t *)(v31 + 13466), vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v33.i8, a6, 0), v20)), vrshlq_s32(vmull_high_lane_s16(v33, a6, 0), v20))), v22), v23);
        int16x8_t v35 = vmaxq_s16(vminq_s16(vqaddq_s16(*(int16x8_t *)(v31 + 25438), vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v33.i8, a5, 0), v20)), vrshlq_s32(vmull_high_lane_s16(v33, a5, 0), v20))), v22), v23);
        *(int16x8_t *)(v31 + 13466) = v34;
        *(int16x8_t *)(v31 + 25438) = v35;
        if (a3)
        {
          v32[512] = v34;
          v32[1024] = v35;
          *uint64_t v32 = v33;
        }
        v30 += 8;
        ++v32;
        v31 += 16;
      }
      while (v30 < 0x38);
      ++v18;
      uint64_t result = (result + 1);
      v25 += 8;
      v24 += 164;
    }
    while (v18 != 64);
  }
  else if (*(unsigned __int8 *)(result + 39) | *(unsigned __int8 *)(result + 60))
  {
    uint64_t v36 = 0;
    LODWORD(v37) = 0;
    int v38 = (int16x8_t *)(a2 + 25438);
    int v39 = (int16x8_t *)(a2 + 13466);
    int v40 = 1 << (v10 + 3);
    int16x8_t v41 = vdupq_n_s16(v17);
    if (!v11) {
      int v40 = 0;
    }
    int16x8_t v42 = vdupq_n_s16(v16);
    uint64_t result = a2 + 23944;
    uint64_t v43 = a2 + 11972;
    int v44 = a3 + 512;
    int v45 = 10;
    do
    {
      if (v36 + 9 >= (int)v37)
      {
        uint64_t v37 = (int)v37;
        unsigned int v46 = (_WORD *)(result + 164 * (int)v37);
        uint64_t v47 = (_WORD *)(v43 + 164 * (int)v37);
        do
        {
          unint64_t v48 = v47;
          int v49 = v46;
          uint64_t v50 = v12;
          do
          {
            if (v7)
            {
              unsigned int v14 = (v14 >> 1) & 0xFFFF7FFF | ((((v14 ^ (v14 >> 3) ^ (v14 >> 12)) ^ (v14 >> 1)) & 1) << 15);
              *unint64_t v48 = (v40 + word_224B28F0A[(unsigned __int16)v14 >> 5]) >> v11;
            }
            if (v8)
            {
              unsigned int v15 = (v15 >> 1) & 0xFFFF7FFF | ((((v15 ^ (v15 >> 3) ^ (v15 >> 12)) ^ (v15 >> 1)) & 1) << 15);
              *int v49 = (v40 + word_224B28F0A[(unsigned __int16)v15 >> 5]) >> v11;
            }
            ++v49;
            ++v48;
            --v50;
          }
          while (v50);
          ++v37;
          v46 += 82;
          v47 += 82;
        }
        while (v45 != v37);
        LODWORD(v37) = v45;
      }
      unint64_t v51 = -8;
      uint64_t v52 = v39;
      int v53 = v38;
      int8x8_t v54 = v44;
      do
      {
        int16x8_t v55 = vmaxq_s16(vminq_s16(*v52, v41), v42);
        int16x8_t v56 = vmaxq_s16(vminq_s16(*v53, v41), v42);
        *uint64_t v52 = v55;
        *int v53 = v56;
        if (a3)
        {
          *int8x8_t v54 = v55;
          v54[512] = v56;
        }
        v51 += 8;
        ++v54;
        ++v53;
        ++v52;
      }
      while (v51 < 0x38);
      ++v36;
      ++v45;
      v44 += 8;
      int v38 = (int16x8_t *)((char *)v38 + 164);
      int v39 = (int16x8_t *)((char *)v39 + 164);
    }
    while (v36 != 64);
  }
  return result;
}

uint64_t sub_224B0D210(uint64_t a1, uint64_t a2, __n128 *a3, double a4, double a5, double a6, __n128 a7, int16x4_t a8)
{
  unsigned int v8 = *(_DWORD *)(a1 + 4);
  int v9 = (unsigned __int16)v8 >> 13;
  int v10 = *(unsigned __int8 *)(a1 + 39);
  int v11 = *(unsigned __int8 *)(a1 + 60);
  int v12 = ((v8 >> 8) & 3) - v9;
  int v13 = v12 + 4;
  if ((v8 & 0x10000) != 0) {
    uint64_t v14 = 44;
  }
  else {
    uint64_t v14 = 82;
  }
  unsigned int v15 = *(unsigned __int16 *)(a1 + 8);
  unsigned int v16 = v8 & 0x20000;
  if ((v8 & 0x20000) != 0) {
    uint64_t v17 = 6;
  }
  else {
    uint64_t v17 = 9;
  }
  unsigned int v18 = -(128 << v9);
  unsigned int v19 = (256 << v9) + ~(128 << v9);
  int v20 = *(unsigned __int8 *)(a1 + 10);
  unsigned __int32 v21 = *(char *)(a1 + 105);
  uint64_t result = *(char *)(a1 + 130);
  if (v20)
  {
    uint64_t v23 = 0;
    LODWORD(v24) = 0;
    int v25 = 1 << (v12 + 3);
    if (v12 == -4) {
      int v26 = 0;
    }
    else {
      int v26 = 1 << (v12 + 3);
    }
    int16x8_t v27 = vdupq_n_s16(v19);
    uint64_t v28 = a3 + 1;
    int16x8_t v29 = vdupq_n_s16(v18);
    unint64_t v30 = (int16x8_t *)(a2 + 1510);
    int v31 = 10;
    unsigned int v32 = v15;
    do
    {
      if (v23 + 9 >= (int)v24)
      {
        uint64_t v24 = (int)v24;
        uint64_t v33 = a2 + 164 * (int)v24;
        do
        {
          for (uint64_t i = 0; i != 164; i += 2)
          {
            unsigned int v32 = (v32 >> 1) & 0xFFFF7FFF | ((((v32 ^ (v32 >> 3) ^ (v32 >> 12)) ^ (v32 >> 1)) & 1) << 15);
            *(_WORD *)(v33 + i) = (v26 + word_224B28F0A[(unsigned __int16)v32 >> 5]) >> v13;
          }
          ++v24;
          v33 += 164;
        }
        while (v31 != v24);
        LODWORD(v24) = v31;
      }
      unint64_t v35 = -16;
      uint64_t v36 = v30;
      uint64_t v37 = v28;
      do
      {
        int16x8_t v38 = vmaxq_s16(vminq_s16(v36[-1], v27), v29);
        a7 = (__n128)vmaxq_s16(vminq_s16(*v36, v27), v29);
        v36[-1] = v38;
        *uint64_t v36 = (int16x8_t)a7;
        if (a3)
        {
          v37[-1] = (__n128)v38;
          *uint64_t v37 = a7;
        }
        v35 += 16;
        v37 += 2;
        v36 += 2;
      }
      while (v35 < 0x30);
      ++v23;
      ++v31;
      v28 += 8;
      unint64_t v30 = (int16x8_t *)((char *)v30 + 164);
    }
    while (v23 != 64);
  }
  else
  {
    if (!(v10 | v11)) {
      return result;
    }
    int v25 = 1 << (v12 + 3);
    int16x8_t v27 = vdupq_n_s16(v19);
    int16x8_t v29 = vdupq_n_s16(v18);
  }
  uint64_t v39 = 0;
  int v40 = 0;
  unsigned int v41 = v15 ^ 0xB524;
  unsigned int v42 = v15 ^ 0x49D8;
  int32x4_t v43 = vdupq_n_s32(-6 - (v8 >> 6));
  a7.n128_u32[0] = v21;
  a8.i32[0] = result;
  int v44 = v8 & 2;
  int v45 = v11 | v44;
  LODWORD(v46) = 0x40u >> (v16 >> 17);
  uint64_t result = (v10 | v44) == 0;
  BOOL v47 = v45 == 0;
  if (v13) {
    int v48 = v25;
  }
  else {
    int v48 = 0;
  }
  if (v46 <= 1) {
    uint64_t v46 = 1;
  }
  else {
    uint64_t v46 = v46;
  }
  int v49 = v17;
  do
  {
    ++v49;
    uint64_t v50 = v39 + v17;
    if (v39 + v17 >= v40)
    {
      uint64_t v51 = v40;
      uint64_t v52 = a2 + 23944 + 164 * v40;
      uint64_t v53 = a2 + 11972 + 164 * v40;
      do
      {
        int8x8_t v54 = (_WORD *)v53;
        int16x8_t v55 = (_WORD *)v52;
        uint64_t v56 = v14;
        do
        {
          if ((result & 1) == 0)
          {
            unsigned int v41 = (v41 >> 1) & 0xFFFF7FFF | ((((v41 ^ (v41 >> 3) ^ (v41 >> 12)) ^ (v41 >> 1)) & 1) << 15);
            *int8x8_t v54 = (v48 + word_224B28F0A[(unsigned __int16)v41 >> 5]) >> v13;
          }
          if (!v47)
          {
            unsigned int v42 = (v42 >> 1) & 0xFFFF7FFF | ((((v42 ^ (v42 >> 3) ^ (v42 >> 12)) ^ (v42 >> 1)) & 1) << 15);
            *int16x8_t v55 = (v48 + word_224B28F0A[(unsigned __int16)v42 >> 5]) >> v13;
          }
          ++v55;
          ++v54;
          --v56;
        }
        while (v56);
        ++v51;
        v52 += 164;
        v53 += 164;
      }
      while (v50 + 1 != v51);
      int v40 = v49;
    }
    uint64_t v57 = a2 + 164 * v50;
    uint64_t v58 = (int)(v39 << (v16 >> 17));
    uint64_t v59 = v58 + 9;
    uint64_t v60 = v58 + 10;
    int16x8_t v61 = *(int16x8_t *)(v57 + 11984);
    int16x8_t v62 = *(int16x8_t *)(v57 + 23956);
    if (v20)
    {
      int16x8_t v63 = *(int16x8_t *)(a2 + 164 * v59 + 18);
      if (v16) {
        int16x8_t v64 = vrshrq_n_s16(vpaddq_s16(vaddq_s16(*(int16x8_t *)(a2 + 164 * v60 + 18), v63), vaddq_s16(*(int16x8_t *)(a2 + 164 * v60 + 34), *(int16x8_t *)(a2 + 164 * v59 + 34))), 2uLL);
      }
      else {
        int16x8_t v64 = vrshrq_n_s16(vpaddq_s16(v63, *(int16x8_t *)(a2 + 164 * v59 + 34)), 1uLL);
      }
      int16x8_t v61 = vqaddq_s16(v61, vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v64.i8, (int16x4_t)a7.n128_u64[0], 0), v43)), vrshlq_s32(vmull_high_lane_s16(v64, (int16x4_t)a7.n128_u64[0], 0), v43)));
      int16x8_t v62 = vqaddq_s16(v62, vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v64.i8, a8, 0), v43)), vrshlq_s32(vmull_high_lane_s16(v64, a8, 0), v43)));
    }
    int16x8_t v65 = vmaxq_s16(vminq_s16(v61, v27), v29);
    int16x8_t v66 = vmaxq_s16(vminq_s16(v62, v27), v29);
    *(int16x8_t *)(v57 + 11984) = v65;
    *(int16x8_t *)(v57 + 23956) = v66;
    if (a3)
    {
      uint64_t v67 = (int16x8_t *)&a3[8 * v39];
      v67[512] = v65;
      v67[1024] = v66;
    }
    uint64_t v68 = a2 + 164 * v50;
    int16x8_t v69 = *(int16x8_t *)(v68 + 12000);
    int16x8_t v70 = *(int16x8_t *)(v68 + 23972);
    if (v20)
    {
      int16x8_t v71 = *(int16x8_t *)(a2 + 164 * v59 + 50);
      if (v16) {
        int16x8_t v72 = vrshrq_n_s16(vpaddq_s16(vaddq_s16(*(int16x8_t *)(a2 + 164 * v60 + 50), v71), vaddq_s16(*(int16x8_t *)(a2 + 164 * v60 + 66), *(int16x8_t *)(a2 + 164 * v59 + 66))), 2uLL);
      }
      else {
        int16x8_t v72 = vrshrq_n_s16(vpaddq_s16(v71, *(int16x8_t *)(a2 + 164 * v59 + 66)), 1uLL);
      }
      int16x8_t v69 = vqaddq_s16(v69, vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v72.i8, (int16x4_t)a7.n128_u64[0], 0), v43)), vrshlq_s32(vmull_high_lane_s16(v72, (int16x4_t)a7.n128_u64[0], 0), v43)));
      int16x8_t v70 = vqaddq_s16(v70, vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v72.i8, a8, 0), v43)), vrshlq_s32(vmull_high_lane_s16(v72, a8, 0), v43)));
    }
    int16x8_t v73 = vmaxq_s16(vminq_s16(v69, v27), v29);
    int16x8_t v74 = vmaxq_s16(vminq_s16(v70, v27), v29);
    *(int16x8_t *)(v68 + 12000) = v73;
    *(int16x8_t *)(v68 + 23972) = v74;
    uint64_t v75 = v39 << 7;
    if (a3)
    {
      uint64_t v76 = (int16x8_t *)((char *)a3 + (v75 | 0x10));
      v76[512] = v73;
      v76[1024] = v74;
    }
    uint64_t v77 = a2 + 164 * v50;
    int16x8_t v78 = *(int16x8_t *)(v77 + 12016);
    int16x8_t v79 = *(int16x8_t *)(v77 + 23988);
    if (v20)
    {
      int16x8_t v80 = *(int16x8_t *)(a2 + 164 * v59 + 82);
      if (v16) {
        int16x8_t v81 = vrshrq_n_s16(vpaddq_s16(vaddq_s16(*(int16x8_t *)(a2 + 164 * v60 + 82), v80), vaddq_s16(*(int16x8_t *)(a2 + 164 * v60 + 98), *(int16x8_t *)(a2 + 164 * v59 + 98))), 2uLL);
      }
      else {
        int16x8_t v81 = vrshrq_n_s16(vpaddq_s16(v80, *(int16x8_t *)(a2 + 164 * v59 + 98)), 1uLL);
      }
      int16x8_t v78 = vqaddq_s16(v78, vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v81.i8, (int16x4_t)a7.n128_u64[0], 0), v43)), vrshlq_s32(vmull_high_lane_s16(v81, (int16x4_t)a7.n128_u64[0], 0), v43)));
      int16x8_t v79 = vqaddq_s16(v79, vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v81.i8, a8, 0), v43)), vrshlq_s32(vmull_high_lane_s16(v81, a8, 0), v43)));
    }
    int16x8_t v82 = vmaxq_s16(vminq_s16(v78, v27), v29);
    int16x8_t v83 = vmaxq_s16(vminq_s16(v79, v27), v29);
    *(int16x8_t *)(v77 + 12016) = v82;
    *(int16x8_t *)(v77 + 23988) = v83;
    if (a3)
    {
      uint64_t v84 = (int16x8_t *)((char *)a3 + (v75 | 0x20));
      v84[512] = v82;
      v84[1024] = v83;
    }
    uint64_t v85 = a2 + 164 * v50;
    int16x8_t v86 = *(int16x8_t *)(v85 + 12032);
    int16x8_t v87 = *(int16x8_t *)(v85 + 24004);
    if (v20)
    {
      int16x8_t v88 = *(int16x8_t *)(a2 + 164 * v59 + 114);
      if (v16) {
        int16x8_t v89 = vrshrq_n_s16(vpaddq_s16(vaddq_s16(*(int16x8_t *)(a2 + 164 * v60 + 114), v88), vaddq_s16(*(int16x8_t *)(a2 + 164 * v60 + 130), *(int16x8_t *)(a2 + 164 * v59 + 130))), 2uLL);
      }
      else {
        int16x8_t v89 = vrshrq_n_s16(vpaddq_s16(v88, *(int16x8_t *)(a2 + 164 * v59 + 130)), 1uLL);
      }
      int16x8_t v86 = vqaddq_s16(v86, vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v89.i8, (int16x4_t)a7.n128_u64[0], 0), v43)), vrshlq_s32(vmull_high_lane_s16(v89, (int16x4_t)a7.n128_u64[0], 0), v43)));
      int16x8_t v87 = vqaddq_s16(v87, vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_lane_s16(*(int16x4_t *)v89.i8, a8, 0), v43)), vrshlq_s32(vmull_high_lane_s16(v89, a8, 0), v43)));
    }
    int16x8_t v90 = vmaxq_s16(vminq_s16(v86, v27), v29);
    int16x8_t v91 = vmaxq_s16(vminq_s16(v87, v27), v29);
    *(int16x8_t *)(v85 + 12032) = v90;
    *(int16x8_t *)(v85 + 24004) = v91;
    if (a3)
    {
      int16x8_t v92 = (int16x8_t *)((char *)a3 + (v75 | 0x30));
      v92[512] = v90;
      v92[1024] = v91;
    }
    ++v39;
  }
  while (v39 != v46);
  return result;
}

uint64_t sub_224B0D85C(uint64_t a1, CVPixelBufferRef pixelBuffer)
{
  uint64_t v4 = *(unsigned int *)(a1 + 60);
  uint64_t v5 = *(int *)(a1 + 56);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  uint64_t v7 = *(void *)(a1 + 16);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  if ((int)v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((int)v5 >= 1)
      {
        uint64_t v10 = 0;
        int v11 = (int32x4_t *)&BaseAddressOfPlane[BytesPerRowOfPlane * i];
        int v12 = (_OWORD *)(v7 + 32 + *(void *)(a1 + 40) * i);
        do
        {
          int8x16x2_t v34 = *(int8x16x2_t *)((unsigned char *)v12 - 1);
          long long v13 = *v12;
          v12 += 3;
          long long v14 = v13;
          *int v11 = vsliq_n_s32(vsliq_n_s32((int32x4_t)vqtbl2q_s8(v34, (int8x16_t)xmmword_224B15A80), (int32x4_t)vqtbl2q_s8(v34, (int8x16_t)xmmword_224B15A90), 0xAuLL), (int32x4_t)vqtbl2q_s8(v34, (int8x16_t)xmmword_224B15AA0), 0x14uLL);
          v11[1] = vsliq_n_s32(vsliq_n_s32((int32x4_t)vqtbl2q_s8(*(int8x16x2_t *)((char *)&v34 + 16), (int8x16_t)xmmword_224B15AB0), (int32x4_t)vqtbl2q_s8(*(int8x16x2_t *)((char *)&v34 + 16), (int8x16_t)xmmword_224B15AC0), 0xAuLL), (int32x4_t)vqtbl2q_s8(*(int8x16x2_t *)((char *)&v34 + 16), (int8x16_t)xmmword_224B15AD0), 0x14uLL);
          v11 += 2;
          v10 += 24;
        }
        while (v10 < v5);
      }
    }
  }
  int v15 = *(_DWORD *)(a1 + 64);
  if (v15)
  {
    uint64_t v16 = *(void *)(a1 + 24);
    uint64_t v17 = *(void *)(a1 + 32);
    unint64_t v18 = *(void *)(a1 + 48);
    unsigned int v19 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
    size_t v20 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
    int v21 = v15 == 1 ? v4 + 1 : v4;
    uint64_t v22 = (v21 >> (v15 == 1));
    if ((int)v22 >= 1)
    {
      uint64_t v23 = 0;
      if (v15 == 3) {
        int v24 = v5;
      }
      else {
        int v24 = v5 + 1;
      }
      uint64_t v25 = v24 >> (v15 != 3);
      uint64_t v26 = 2 * (v18 >> 1);
      do
      {
        if ((int)v25 >= 1)
        {
          uint64_t v27 = 0;
          uint64_t v28 = 0;
          int16x8_t v29 = (int32x4_t *)&v19[v20 * v23];
          do
          {
            v33.val[0] = *(int8x16_t *)(v16 + v27);
            int8x16_t v30 = *(int8x16_t *)(v16 + v27 + 16);
            v35.val[0] = *(int8x16_t *)(v16 + v27 + 32);
            v33.val[1] = *(int8x16_t *)(v17 + v27);
            int8x16_t v31 = *(int8x16_t *)(v17 + v27 + 16);
            v35.val[1] = *(int8x16_t *)(v17 + v27 + 32);
            v36.val[0] = vextq_s8(v33.val[0], v30, 0xCuLL);
            v36.val[1] = vextq_s8(v33.val[1], v31, 0xCuLL);
            v37.val[0] = vextq_s8(v30, v35.val[0], 8uLL);
            v37.val[1] = vextq_s8(v31, v35.val[1], 8uLL);
            *int16x8_t v29 = vsliq_n_s32(vsliq_n_s32((int32x4_t)vqtbl2q_s8(v33, (int8x16_t)xmmword_224B15AE0), (int32x4_t)vqtbl2q_s8(v33, (int8x16_t)xmmword_224B15AF0), 0xAuLL), (int32x4_t)vqtbl2q_s8(v33, (int8x16_t)xmmword_224B15B00), 0x14uLL);
            v29[1] = vsliq_n_s32(vsliq_n_s32((int32x4_t)vqtbl2q_s8(v36, (int8x16_t)xmmword_224B15AE0), (int32x4_t)vqtbl2q_s8(v36, (int8x16_t)xmmword_224B15AF0), 0xAuLL), (int32x4_t)vqtbl2q_s8(v36, (int8x16_t)xmmword_224B15B00), 0x14uLL);
            v29[2] = vsliq_n_s32(vsliq_n_s32((int32x4_t)vqtbl2q_s8(v37, (int8x16_t)xmmword_224B15AE0), (int32x4_t)vqtbl2q_s8(v37, (int8x16_t)xmmword_224B15AF0), 0xAuLL), (int32x4_t)vqtbl2q_s8(v37, (int8x16_t)xmmword_224B15B00), 0x14uLL);
            v29[3] = vsliq_n_s32(vsliq_n_s32((int32x4_t)vqtbl2q_s8(v35, (int8x16_t)xmmword_224B15B10), (int32x4_t)vqtbl2q_s8(v35, (int8x16_t)xmmword_224B15B20), 0xAuLL), (int32x4_t)vqtbl2q_s8(v35, (int8x16_t)xmmword_224B15B30), 0x14uLL);
            v28 += 24;
            v27 += 48;
            v29 += 4;
          }
          while (v28 < v25);
        }
        ++v23;
        v16 += v26;
        v17 += v26;
      }
      while (v23 != v22);
    }
  }
  return 0;
}

uint64_t sub_224B0DAB8(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  int v6 = *(_DWORD *)(a1 + 68);
  if (v6 == 12)
  {
    int v45 = *(_DWORD *)(a1 + 60);
    uint64_t v46 = *(int *)(a1 + 56);
    if (!*(unsigned char *)(*(void *)(a1 + 264) + 24))
    {
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
      uint64_t v48 = *(void *)(a1 + 16);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
      if (v45 >= 1)
      {
        int v50 = 0;
        uint64_t v51 = &BaseAddressOfPlane[2 * (BytesPerRowOfPlane >> 1) * (a3 >> 32) + 2 * (int)a3];
        uint64_t v52 = 2 * (*(uint64_t *)(a1 + 40) >> 1);
        do
        {
          if ((int)v46 >= 1)
          {
            uint64_t v53 = 0;
            for (uint64_t i = 0; i < v46; i += 32)
            {
              int16x8_t v55 = *(int16x8_t *)(v48 + v53 + 32);
              int16x8_t v56 = *(int16x8_t *)(v48 + v53 + 48);
              uint64_t v57 = (int16x8_t *)&v51[v53];
              int16x8_t v58 = vshlq_n_s16(*(int16x8_t *)(v48 + v53 + 16), 4uLL);
              *uint64_t v57 = vshlq_n_s16(*(int16x8_t *)(v48 + v53), 4uLL);
              v57[1] = v58;
              v57[2] = vshlq_n_s16(v55, 4uLL);
              v57[3] = vshlq_n_s16(v56, 4uLL);
              v53 += 64;
            }
          }
          ++v50;
          v48 += v52;
          v51 += 2 * (BytesPerRowOfPlane >> 1);
        }
        while (v50 != v45);
      }
    }
    int v59 = *(_DWORD *)(a1 + 64);
    if (v59)
    {
      uint64_t v60 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
      uint64_t v61 = *(void *)(a1 + 24);
      uint64_t v62 = *(void *)(a1 + 32);
      size_t v63 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
      char v64 = v59 == 1;
      int v65 = v59 == 1 ? v45 + 1 : v45;
      int v66 = v65 >> v64;
      if (v66 >= 1)
      {
        int v67 = 0;
        size_t v68 = v63 >> 1;
        int v69 = SHIDWORD(a3) >> v64;
        char v70 = v59 != 3;
        if (v59 == 3) {
          int v71 = v46;
        }
        else {
          int v71 = v46 + 1;
        }
        size_t v72 = v68 * v69 + 2 * ((int)a3 >> v70);
        uint64_t v73 = v71 >> v70;
        uint64_t v74 = 2 * (*(uint64_t *)(a1 + 48) >> 1);
        uint64_t v75 = (uint64_t)v60 + 2 * v72 + 32;
        uint64_t v76 = 2 * v68;
        do
        {
          if ((int)v73 >= 1)
          {
            uint64_t v77 = 0;
            uint64_t v78 = 0;
            int16x8_t v79 = (__int16 *)v75;
            do
            {
              int16x8_t v80 = *(int16x8_t *)(v61 + v77 + 16);
              v87.val[0] = vshlq_n_s16(*(int16x8_t *)(v61 + v77), 4uLL);
              int16x8_t v81 = *(int16x8_t *)(v62 + v77 + 16);
              v87.val[1] = vshlq_n_s16(*(int16x8_t *)(v62 + v77), 4uLL);
              int16x8_t v82 = v79 - 16;
              vst2q_s16(v82, v87);
              v85.val[0] = vshlq_n_s16(v80, 4uLL);
              v85.val[1] = vshlq_n_s16(v81, 4uLL);
              vst2q_s16(v79, v85);
              v78 += 16;
              v77 += 32;
              v79 += 32;
            }
            while (v78 < v73);
          }
          ++v67;
          v61 += v74;
          v75 += v76;
          v62 += v74;
        }
        while (v67 != v66);
      }
    }
    return 0;
  }
  if (v6 == 10)
  {
    int v7 = *(_DWORD *)(a1 + 60);
    uint64_t v8 = *(int *)(a1 + 56);
    if (!*(unsigned char *)(*(void *)(a1 + 264) + 24))
    {
      int v9 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
      uint64_t v10 = *(void *)(a1 + 16);
      size_t v11 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
      if (v7 >= 1)
      {
        int v12 = 0;
        long long v13 = &v9[2 * (v11 >> 1) * (a3 >> 32) + 2 * (int)a3];
        uint64_t v14 = 2 * (*(uint64_t *)(a1 + 40) >> 1);
        do
        {
          if ((int)v8 >= 1)
          {
            uint64_t v15 = 0;
            for (uint64_t j = 0; j < v8; j += 32)
            {
              int16x8_t v17 = *(int16x8_t *)(v10 + v15 + 32);
              int16x8_t v18 = *(int16x8_t *)(v10 + v15 + 48);
              unsigned int v19 = (int16x8_t *)&v13[v15];
              int16x8_t v20 = vshlq_n_s16(*(int16x8_t *)(v10 + v15 + 16), 6uLL);
              *unsigned int v19 = vshlq_n_s16(*(int16x8_t *)(v10 + v15), 6uLL);
              v19[1] = v20;
              v19[2] = vshlq_n_s16(v17, 6uLL);
              v19[3] = vshlq_n_s16(v18, 6uLL);
              v15 += 64;
            }
          }
          ++v12;
          v10 += v14;
          v13 += 2 * (v11 >> 1);
        }
        while (v12 != v7);
      }
    }
    int v21 = *(_DWORD *)(a1 + 64);
    if (v21)
    {
      uint64_t v22 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
      uint64_t v23 = *(void *)(a1 + 24);
      uint64_t v24 = *(void *)(a1 + 32);
      size_t v25 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
      char v26 = v21 == 1;
      int v27 = v21 == 1 ? v7 + 1 : v7;
      int v28 = v27 >> v26;
      if (v28 >= 1)
      {
        int v29 = 0;
        size_t v30 = v25 >> 1;
        int v31 = SHIDWORD(a3) >> v26;
        char v32 = v21 != 3;
        if (v21 == 3) {
          int v33 = v8;
        }
        else {
          int v33 = v8 + 1;
        }
        size_t v34 = v30 * v31 + 2 * ((int)a3 >> v32);
        uint64_t v35 = v33 >> v32;
        uint64_t v36 = 2 * (*(uint64_t *)(a1 + 48) >> 1);
        uint64_t v37 = (uint64_t)v22 + 2 * v34 + 32;
        uint64_t v38 = 2 * v30;
        do
        {
          if ((int)v35 >= 1)
          {
            uint64_t v39 = 0;
            uint64_t v40 = 0;
            unsigned int v41 = (__int16 *)v37;
            do
            {
              int16x8_t v42 = *(int16x8_t *)(v23 + v39 + 16);
              v86.val[0] = vshlq_n_s16(*(int16x8_t *)(v23 + v39), 6uLL);
              int16x8_t v43 = *(int16x8_t *)(v24 + v39 + 16);
              v86.val[1] = vshlq_n_s16(*(int16x8_t *)(v24 + v39), 6uLL);
              int v44 = v41 - 16;
              vst2q_s16(v44, v86);
              v84.val[0] = vshlq_n_s16(v42, 6uLL);
              v84.val[1] = vshlq_n_s16(v43, 6uLL);
              vst2q_s16(v41, v84);
              v40 += 16;
              v39 += 32;
              v41 += 32;
            }
            while (v40 < v35);
          }
          ++v29;
          v23 += v36;
          v37 += v38;
          v24 += v36;
        }
        while (v29 != v28);
      }
    }
    return 0;
  }
  return 4294954391;
}

uint64_t sub_224B0DE9C(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  int v6 = *(_DWORD *)(a1 + 60);
  size_t v7 = *(int *)(a1 + 56);
  if (!*(unsigned char *)(*(void *)(a1 + 264) + 24))
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    int v9 = *(char **)(a1 + 16);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
    if (v6 >= 1)
    {
      size_t v11 = BytesPerRowOfPlane;
      uint64_t v12 = *(void *)(a1 + 40);
      long long v13 = &BaseAddressOfPlane[BytesPerRowOfPlane * (a3 >> 32) + (int)a3];
      int v14 = v6;
      do
      {
        memcpy(v13, v9, v7);
        v13 += v11;
        v9 += v12;
        --v14;
      }
      while (v14);
    }
  }
  int v15 = *(_DWORD *)(a1 + 64);
  if (v15)
  {
    uint64_t v16 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
    uint64_t v17 = *(void *)(a1 + 24);
    uint64_t v18 = *(void *)(a1 + 32);
    size_t v19 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
    char v20 = v15 == 1;
    int v21 = v15 == 1 ? v6 + 1 : v6;
    int v22 = v21 >> v20;
    if (v22 >= 1)
    {
      int v23 = 0;
      uint64_t v24 = *(void *)(a1 + 48);
      int v25 = SHIDWORD(a3) >> v20;
      char v26 = v15 != 3;
      if (v15 == 3) {
        int v27 = v7;
      }
      else {
        int v27 = v7 + 1;
      }
      int v28 = v27 >> v26;
      size_t v29 = v19 * v25 + 2 * ((int)a3 >> v26);
      uint64_t v30 = v28;
      uint64_t v31 = (uint64_t)v16 + v29 + 32;
      do
      {
        if ((int)v30 >= 1)
        {
          char v32 = (char *)v31;
          uint64_t v33 = 16;
          do
          {
            v37.val[0] = *(int8x16_t *)(v17 + v33 - 16);
            v38.val[0] = *(int8x16_t *)(v17 + v33);
            v37.val[1] = *(int8x16_t *)(v18 + v33 - 16);
            v38.val[1] = *(int8x16_t *)(v18 + v33);
            size_t v34 = v32 - 32;
            vst2q_s8(v34, v37);
            vst2q_s8(v32, v38);
            uint64_t v35 = v33 + 16;
            v33 += 32;
            v32 += 64;
          }
          while (v35 < v30);
        }
        v17 += v24;
        v18 += v24;
        ++v23;
        v31 += v19;
      }
      while (v23 != v22);
    }
  }
  return 0;
}

uint64_t sub_224B0E038(int a1)
{
  uint64_t v1 = 8;
  if (a1 > 1278226487)
  {
    if (a1 <= 1886680623)
    {
      if (a1 <= 1885745711)
      {
        if (a1 <= 1882468911)
        {
          if (a1 == 1278226488) {
            return v1;
          }
          if (a1 == 1278226736) {
            return 10;
          }
          int v4 = 1278226738;
LABEL_71:
          if (a1 == v4) {
            return 12;
          }
          return 0;
        }
        if (a1 == 1882468912 || a1 == 1882468914) {
          return 10;
        }
        int v5 = 1882469428;
        goto LABEL_76;
      }
      if (a1 <= 1886676527)
      {
        if (a1 == 1885745712 || a1 == 1885745714) {
          return 10;
        }
        int v5 = 1885746228;
        goto LABEL_76;
      }
      unsigned __int16 v8 = -26160;
    }
    else
    {
      if (a1 > 1953903153)
      {
        if (a1 > 2016687155)
        {
          if (a1 > 2019963441)
          {
            if (a1 == 2019963956) {
              return 10;
            }
            unsigned __int16 v7 = 12850;
          }
          else
          {
            if (a1 == 2016687156) {
              return 10;
            }
            unsigned __int16 v7 = 12848;
          }
          int v5 = v7 | 0x78660000;
        }
        else
        {
          if (a1 <= 2016686639)
          {
            if (a1 == 1953903154) {
              return 12;
            }
            unsigned __int16 v3 = 13364;
LABEL_70:
            int v4 = v3 | 0x74760000;
            goto LABEL_71;
          }
          if (a1 == 2016686640) {
            return 10;
          }
          int v5 = 2016686642;
        }
LABEL_76:
        if (a1 == v5) {
          return 10;
        }
        return 0;
      }
      if (a1 > 1952854575)
      {
        if (a1 <= 1952855091)
        {
          if (a1 == 1952854576) {
            return 12;
          }
          int v4 = 1952854578;
          goto LABEL_71;
        }
        if (a1 == 1952855092) {
          return 12;
        }
        unsigned __int16 v3 = 12848;
        goto LABEL_70;
      }
      unsigned __int16 v8 = -30256;
    }
    unsigned int v9 = v8 | 0x8F8B0000;
    goto LABEL_58;
  }
  if (a1 <= 645166639)
  {
    if (a1 <= 642527287)
    {
      if (((a1 - 641230384) > 4 || ((1 << (a1 - 48)) & 0x15) == 0)
        && ((a1 - 641234480) > 4 || ((1 << (a1 - 48)) & 0x15) == 0))
      {
        return 0;
      }
      return v1;
    }
    if (a1 <= 645162543)
    {
      if (a1 == 642527288) {
        return v1;
      }
      if (a1 == 642527536) {
        return 10;
      }
      int v4 = 642527538;
      goto LABEL_71;
    }
    unsigned int v9 = -645162544;
LABEL_58:
    unsigned int v10 = a1 + v9;
    if (v10 > 4 || ((1 << v10) & 0x15) == 0) {
      return 0;
    }
    return 12;
  }
  if (a1 <= 645428783)
  {
    if ((a1 - 645166640) > 4 || ((1 << (a1 - 48)) & 0x15) == 0)
    {
      if ((a1 - 645424688) > 4 || ((1 << (a1 - 48)) & 0x15) == 0) {
        return 0;
      }
      return 10;
    }
    return 12;
  }
  if (a1 <= 875704437)
  {
    if ((a1 - 645428784) > 4 || ((1 << (a1 - 48)) & 0x15) == 0)
    {
      unsigned __int16 v6 = 12390;
      goto LABEL_63;
    }
    return 10;
  }
  if (a1 > 875704949)
  {
    if (a1 == 875704950 || a1 == 875836518) {
      return v1;
    }
    int v2 = 875836534;
    goto LABEL_64;
  }
  if (a1 == 875704438) {
    return v1;
  }
  unsigned __int16 v6 = 12902;
LABEL_63:
  int v2 = v6 | 0x34320000;
LABEL_64:
  if (a1 != v2) {
    return 0;
  }
  return v1;
}

uint64_t sub_224B0E430(int a1)
{
  uint64_t result = 1;
  if (a1 > 1885746227)
  {
    if (((a1 - 1886676528) > 4 || ((1 << (a1 - 48)) & 0x15) == 0)
      && ((a1 - 1886680624) > 4 || ((1 << (a1 - 48)) & 0x15) == 0))
    {
      unsigned __int16 v3 = 13364;
      goto LABEL_10;
    }
  }
  else
  {
    if (a1 <= 1882469427)
    {
      if (a1 == 1882468912) {
        return result;
      }
      int v4 = 1882468914;
      goto LABEL_15;
    }
    if (a1 != 1882469428 && a1 != 1885745712)
    {
      unsigned __int16 v3 = 12850;
LABEL_10:
      int v4 = v3 | 0x70660000;
LABEL_15:
      if (a1 != v4) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_224B0E50C(int a1)
{
  uint64_t result = 1;
  if (a1 > 645166639)
  {
    if (((a1 - 645166640) > 4 || ((1 << (a1 - 48)) & 0x15) == 0)
      && ((a1 - 645424688) > 4 || ((1 << (a1 - 48)) & 0x15) == 0))
    {
      int v3 = -645428784;
LABEL_8:
      unsigned int v4 = a1 + v3;
      if (v4 <= 4 && ((1 << v4) & 0x15) != 0) {
        return result;
      }
      return 0;
    }
  }
  else
  {
    if (a1 <= 642527535)
    {
      if ((a1 - 641230384) <= 4 && ((1 << (a1 - 48)) & 0x15) != 0) {
        return result;
      }
      int v3 = -641234480;
      goto LABEL_8;
    }
    if (((a1 - 645162544) > 4 || ((1 << (a1 - 48)) & 0x15) == 0) && a1 != 642527536 && a1 != 642527538) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_224B0E640(int a1)
{
  uint64_t result = 1;
  if (a1 > 1882469427)
  {
    if (a1 > 1952855091)
    {
      if (a1 > 2016687155)
      {
        if (a1 == 2016687156) {
          return result;
        }
        int v3 = 2019963956;
      }
      else
      {
        if (a1 == 1952855092) {
          return result;
        }
        int v3 = 1953903668;
      }
    }
    else if (a1 > 1886676531)
    {
      if (a1 == 1886676532) {
        return result;
      }
      int v3 = 1886680628;
    }
    else
    {
      if (a1 == 1882469428) {
        return result;
      }
      int v3 = 1885746228;
    }
  }
  else if (a1 > 645424691)
  {
    if (a1 > 875836517)
    {
      if (a1 == 875836518) {
        return result;
      }
      int v3 = 875836534;
    }
    else
    {
      if (a1 == 645424692) {
        return result;
      }
      int v3 = 645428788;
    }
  }
  else if (a1 > 645162547)
  {
    if (a1 == 645162548) {
      return result;
    }
    int v3 = 645166644;
  }
  else
  {
    if (a1 == 641230388) {
      return result;
    }
    int v3 = 641234484;
  }
  if (a1 != v3) {
    return 0;
  }
  return result;
}

BOOL sub_224B0E7A8(uint64_t a1, _DWORD *a2)
{
  return *(_DWORD *)a1 == a2[14]
      && *(_DWORD *)(a1 + 4) == a2[15]
      && *(_DWORD *)(a1 + 8) == a2[16]
      && *(_DWORD *)(a1 + 12) == a2[17]
      && *(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(*(void *)a2 + 33)
      && *(unsigned __int8 *)(a1 + 17) == *(unsigned __int8 *)(*(void *)a2 + 421);
}

uint64_t sub_224B0E818(uint64_t a1)
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (*(unsigned char *)(a1 + i + 27))
    {
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 8 * i), *(void *)(a1 + 8 * i + 32));
      *(unsigned char *)(a1 + i + 27) = 0;
    }
  }
  for (uint64_t j = 16; j != -8; j -= 8)
    sub_224AAEFC4((const void **)(a1 + j));
  return a1;
}

void *sub_224B0E890(void *result)
{
  result[16] = sub_224AB9AAC;
  *uint64_t result = sub_224AB9A64;
  result[9] = sub_224AB9A20;
  result[2] = sub_224AB99D0;
  result[1] = sub_224AB9980;
  result[3] = sub_224AB993C;
  result[7] = sub_224AB98EC;
  result[8] = sub_224AB989C;
  result[5] = sub_224AB984C;
  result[4] = sub_224AB97FC;
  result[6] = sub_224AB97B8;
  result[11] = sub_224AB9768;
  result[10] = sub_224AB9718;
  result[15] = sub_224AB96C8;
  result[14] = sub_224AB9678;
  result[13] = sub_224AB9628;
  result[12] = sub_224AB95D8;
  result[85] = sub_224AB9584;
  result[94] = sub_224AB9534;
  result[87] = sub_224AB94E4;
  result[86] = sub_224AB9494;
  result[88] = sub_224AB9444;
  result[92] = sub_224AB93F4;
  result[93] = sub_224AB93A4;
  result[90] = sub_224AB9354;
  result[89] = sub_224AB9304;
  result[91] = sub_224AB92B4;
  result[96] = sub_224AB9264;
  result[95] = sub_224AB9214;
  result[100] = sub_224AB91C4;
  result[99] = sub_224AB9174;
  result[98] = sub_224AB9124;
  result[97] = sub_224AB90D4;
  result[221] = sub_224AB9080;
  result[230] = sub_224AB9030;
  result[223] = sub_224AB8FE0;
  result[222] = sub_224AB8F90;
  result[224] = sub_224AB8F40;
  result[228] = sub_224AB8EF0;
  result[229] = sub_224AB8EA0;
  result[226] = sub_224AB8E50;
  result[225] = sub_224AB8E00;
  result[227] = sub_224AB8DB0;
  result[232] = sub_224AB8D60;
  result[231] = sub_224AB8D10;
  result[236] = sub_224AB8CC0;
  result[235] = sub_224AB8C70;
  result[234] = sub_224AB8C20;
  result[233] = sub_224AB8BD0;
  result[102] = sub_224AB8B7C;
  result[111] = sub_224AB8B2C;
  result[104] = sub_224AB8ADC;
  result[103] = sub_224AB8A8C;
  result[105] = sub_224AB8A3C;
  result[109] = sub_224AB89EC;
  result[110] = sub_224AB899C;
  result[107] = sub_224AB894C;
  result[106] = sub_224AB88FC;
  result[108] = sub_224AB88AC;
  result[113] = sub_224AB885C;
  result[112] = sub_224AB880C;
  result[117] = sub_224AB87BC;
  result[116] = sub_224AB876C;
  result[115] = sub_224AB871C;
  result[114] = sub_224AB86CC;
  result[17] = sub_224AB8684;
  result[26] = sub_224AB8640;
  result[19] = sub_224AB85F0;
  result[18] = sub_224AB85A0;
  result[20] = sub_224AB855C;
  result[24] = sub_224AB850C;
  result[25] = sub_224AB84BC;
  result[22] = sub_224AB846C;
  result[21] = sub_224AB841C;
  result[23] = sub_224AB83D8;
  result[28] = sub_224AB8388;
  result[27] = sub_224AB8338;
  result[32] = sub_224AB82E8;
  result[31] = sub_224AB8298;
  result[30] = sub_224AB8248;
  result[29] = sub_224AB81F8;
  result[119] = sub_224AB81A4;
  result[128] = sub_224AB8154;
  result[121] = sub_224AB8104;
  result[120] = sub_224AB80B4;
  result[122] = sub_224AB8064;
  result[126] = sub_224AB8014;
  result[127] = sub_224AB7FC4;
  result[124] = sub_224AB7F74;
  result[123] = sub_224AB7F24;
  result[125] = sub_224AB7ED4;
  result[130] = sub_224AB7E84;
  result[129] = sub_224AB7E34;
  result[134] = sub_224AB7DE4;
  result[133] = sub_224AB7D94;
  result[132] = sub_224AB7D44;
  result[131] = sub_224AB7CF4;
  result[255] = sub_224AB7CA0;
  result[264] = sub_224AB7C50;
  result[238] = sub_224AB7BFC;
  result[247] = sub_224AB7BAC;
  result[240] = sub_224AB7B5C;
  result[239] = sub_224AB7B0C;
  result[241] = sub_224AB7ABC;
  result[245] = sub_224AB7A6C;
  result[246] = sub_224AB7A1C;
  result[243] = sub_224AB79CC;
  result[242] = sub_224AB797C;
  result[244] = sub_224AB792C;
  result[249] = sub_224AB78DC;
  result[248] = sub_224AB788C;
  result[253] = sub_224AB783C;
  result[252] = sub_224AB77EC;
  result[251] = sub_224AB779C;
  result[250] = sub_224AB774C;
  result[136] = sub_224AB76F8;
  result[145] = sub_224AB76A8;
  result[138] = sub_224AB7658;
  result[137] = sub_224AB7608;
  result[139] = sub_224AB75B8;
  result[143] = sub_224AB7568;
  result[144] = sub_224AB7518;
  result[141] = sub_224AB74C8;
  result[140] = sub_224AB7478;
  result[142] = sub_224AB7428;
  result[147] = sub_224AB73D8;
  result[146] = sub_224AB7388;
  result[151] = sub_224AB7338;
  result[150] = sub_224AB72E8;
  result[149] = sub_224AB7298;
  result[148] = sub_224AB7248;
  result[34] = sub_224AB7200;
  result[43] = sub_224AB71BC;
  result[36] = sub_224AB716C;
  result[35] = sub_224AB711C;
  result[37] = sub_224AB70D8;
  result[41] = sub_224AB7088;
  result[42] = sub_224AB7038;
  result[39] = sub_224AB6FE8;
  result[38] = sub_224AB6F98;
  result[40] = sub_224AB6F54;
  result[45] = sub_224AB6F04;
  result[44] = sub_224AB6EB4;
  result[153] = sub_224AB6E60;
  result[162] = sub_224AB6E10;
  result[289] = sub_224AB6DBC;
  result[272] = sub_224AB6D68;
  result[281] = sub_224AB6D18;
  result[170] = sub_224AB6CC4;
  result[179] = sub_224AB6C74;
  result[51] = sub_224AB6C2C;
  result[60] = sub_224AB6BE8;
  result[187] = sub_224AB6B94;
  result[306] = sub_224AB6B40;
  result[204] = sub_224AB6AEC;
  result[68] = sub_224AB67C4;
  if (dword_26AACE160)
  {
    result[16] = sub_224A78928;
    *uint64_t result = sub_224A78A48;
    result[9] = sub_224A78A90;
    result[1] = sub_224A78AA0;
    result[4] = sub_224A78AB0;
    result[11] = sub_224A78AC0;
    result[2] = sub_224A78AD0;
    result[3] = sub_224A78AE0;
    result[8] = sub_224A78AF0;
    result[5] = sub_224A78B00;
    result[7] = sub_224A78B10;
    result[6] = sub_224A78B20;
    result[10] = sub_224A78B30;
    result[13] = sub_224A78B40;
    result[15] = sub_224A78B50;
    result[12] = sub_224A78B60;
    result[14] = sub_224A78B70;
    result[85] = sub_224A79848;
    result[94] = sub_224A79884;
    result[86] = sub_224A79894;
    result[89] = sub_224A798A4;
    result[96] = sub_224A798B4;
    result[87] = sub_224A798C4;
    result[88] = sub_224A798D4;
    result[93] = sub_224A798E4;
    result[90] = sub_224A798F4;
    result[92] = sub_224A79904;
    result[91] = sub_224A79914;
    result[95] = sub_224A79924;
    result[98] = sub_224A79934;
    result[100] = sub_224A79944;
    result[97] = sub_224A79954;
    result[99] = sub_224A79964;
    result[221] = sub_224A7BE78;
    result[230] = sub_224A7BEB4;
    result[222] = sub_224A7BEC0;
    result[225] = sub_224A7BED0;
    result[232] = sub_224A7BEE0;
    result[223] = sub_224A7BEF0;
    result[224] = sub_224A7BF00;
    result[229] = sub_224A7BF10;
    result[226] = sub_224A7BF20;
    result[228] = sub_224A7BF30;
    result[227] = sub_224A7BF40;
    result[231] = sub_224A7BF50;
    result[234] = sub_224A7BF5C;
    result[236] = sub_224A7BF6C;
    result[233] = sub_224A7BF7C;
    result[235] = sub_224A7BF88;
    result[102] = sub_224A79974;
    result[111] = sub_224A799B0;
    result[103] = sub_224A799C0;
    result[106] = sub_224A799D0;
    result[113] = sub_224A799E0;
    result[104] = sub_224A799F0;
    result[105] = sub_224A79A00;
    result[110] = sub_224A79A10;
    result[107] = sub_224A79A20;
    result[109] = sub_224A79A30;
    result[108] = sub_224A79A40;
    result[112] = sub_224A79A50;
    result[115] = sub_224A79A60;
    result[117] = sub_224A79A70;
    result[114] = sub_224A79A80;
    result[116] = sub_224A79A90;
    result[17] = sub_224A7954C;
    result[26] = sub_224A79588;
    result[18] = sub_224A79594;
    result[21] = sub_224A795A4;
    result[28] = sub_224A795B4;
    result[19] = sub_224A795C4;
    result[20] = sub_224A795D4;
    result[25] = sub_224A795E4;
    result[22] = sub_224A795F4;
    result[24] = sub_224A79604;
    result[23] = sub_224A79614;
    result[27] = sub_224A79624;
    result[30] = sub_224A79630;
    result[32] = sub_224A79640;
    result[29] = sub_224A79650;
    result[31] = sub_224A7965C;
    result[119] = sub_224A7CA14;
    result[128] = sub_224A7CA54;
    result[120] = sub_224A7CA60;
    result[123] = sub_224A7CA70;
    result[130] = sub_224A7CA80;
    result[121] = sub_224A7CA90;
    result[122] = sub_224A7CAA0;
    result[127] = sub_224A7CAB0;
    result[124] = sub_224A7CAC0;
    result[126] = sub_224A7CAD0;
    result[125] = sub_224A7CAE0;
    result[129] = sub_224A7CAF0;
    result[132] = sub_224A7CAFC;
    result[134] = sub_224A7CB0C;
    result[131] = sub_224A7CB1C;
    result[133] = sub_224A7CB28;
    result[255] = sub_224A7EBAC;
    result[264] = sub_224A7E5B4;
    result[238] = sub_224A7BF94;
    result[247] = sub_224A7BFCC;
    result[239] = sub_224A7BFD4;
    result[242] = sub_224A7BFE0;
    result[249] = sub_224A7BFEC;
    result[240] = sub_224A7BFF8;
    result[241] = sub_224A7C004;
    result[246] = sub_224A7C010;
    result[243] = sub_224A7C01C;
    result[245] = sub_224A7C028;
    result[244] = sub_224A7C034;
    result[248] = sub_224A7C040;
    result[251] = sub_224A7C048;
    result[253] = sub_224A7C054;
    result[250] = sub_224A7C060;
    result[252] = sub_224A7C068;
    result[136] = sub_224A7CB34;
    result[145] = sub_224A7CB70;
    result[137] = sub_224A7CB78;
    result[140] = sub_224A7CB84;
    result[147] = sub_224A7CB90;
    result[138] = sub_224A7CB9C;
    result[139] = sub_224A7CBA8;
    result[144] = sub_224A7CBB4;
    result[141] = sub_224A7CBC0;
    result[143] = sub_224A7CBCC;
    result[142] = sub_224A7CBD8;
    result[146] = sub_224A7CBE4;
    result[149] = sub_224A7CBEC;
    result[151] = sub_224A7CBF8;
    result[148] = sub_224A7CC04;
    result[150] = sub_224A7CC0C;
    result[34] = sub_224A7B730;
    result[43] = sub_224A7B770;
    result[35] = sub_224A7B780;
    result[38] = sub_224A7B794;
    result[45] = sub_224A7B7A8;
    result[36] = sub_224A7B7BC;
    result[37] = sub_224A7B7D0;
    result[42] = sub_224A7B7E4;
    result[39] = sub_224A7B7F8;
    result[41] = sub_224A7B80C;
    result[40] = sub_224A7B820;
    result[44] = sub_224A7B834;
    result[153] = sub_224A7E9D4;
    result[162] = sub_224A7E13C;
    result[289] = sub_224A804F8;
    result[272] = sub_224A7ED14;
    result[281] = sub_224A7E744;
    result[170] = sub_224A7EADC;
    result[179] = sub_224A7E368;
    result[51] = sub_224A7E8B4;
    result[60] = sub_224A7DFA0;
    result[187] = sub_224A8029C;
    result[306] = sub_224A803D4;
    result[204] = sub_224A80100;
    result[68] = sub_224A7FF48;
  }
  return result;
}

void *sub_224B0FC20(void *result)
{
  *uint64_t result = sub_224ABC0AC;
  result[1] = sub_224ABC09C;
  result[2] = sub_224ABC08C;
  result[3] = sub_224ABBDB4;
  result[4] = sub_224ABB620;
  result[5] = sub_224ABB5D8;
  result[6] = sub_224ABB590;
  result[7] = sub_224ABAAC4;
  if (dword_26AACE160)
  {
    *uint64_t result = sub_224A8E9FC;
    result[1] = sub_224A8EE98;
    result[2] = sub_224A8F0E8;
    result[3] = sub_224A8EBEC;
    result[4] = sub_224ABA8C0;
    result[5] = sub_224ABA670;
    result[6] = sub_224ABA420;
    result[7] = sub_224ABA1D4;
  }
  return result;
}

void *sub_224B0FD30(void *result)
{
  *uint64_t result = sub_224AC98B4;
  result[10] = sub_224AC9888;
  result[20] = sub_224AC9880;
  result[30] = sub_224AC9858;
  result[1] = sub_224AC9830;
  result[11] = sub_224AC9800;
  result[21] = sub_224AC97F8;
  result[31] = sub_224AC97CC;
  result[2] = sub_224AC97A4;
  result[12] = sub_224AC9774;
  result[22] = sub_224AC976C;
  result[32] = sub_224AC9740;
  result[3] = sub_224AC9718;
  result[13] = sub_224AC96E8;
  result[23] = sub_224AC96E0;
  result[33] = sub_224AC96B4;
  result[4] = sub_224AC968C;
  result[14] = sub_224AC965C;
  result[24] = sub_224AC9654;
  result[34] = sub_224AC9628;
  result[5] = sub_224AC9600;
  result[15] = sub_224AC95D0;
  result[25] = sub_224AC95C8;
  result[35] = sub_224AC959C;
  result[6] = sub_224AC9574;
  result[16] = sub_224AC9544;
  result[26] = sub_224AC953C;
  result[36] = sub_224AC9510;
  result[7] = sub_224AC94E8;
  result[17] = sub_224AC94B8;
  result[27] = sub_224AC94B0;
  result[37] = sub_224AC9484;
  result[8] = sub_224AC9060;
  result[18] = sub_224AC8D0C;
  result[28] = sub_224AC8934;
  result[38] = sub_224AC8604;
  result[9] = sub_224AC8364;
  result[19] = sub_224AC81FC;
  result[29] = sub_224AC7FA8;
  result[39] = sub_224AC7E4C;
  result[40] = sub_224AC7DEC;
  result[41] = sub_224AC7D80;
  result[42] = sub_224AC7D08;
  result[46] = sub_224AC7CA8;
  result[47] = sub_224AC7C34;
  result[48] = sub_224AC7BC4;
  result[43] = sub_224AC7BA0;
  result[44] = sub_224AC7B78;
  result[45] = sub_224AC79F8;
  result[49] = sub_224AC77D0;
  result[50] = sub_224AC75B4;
  result[51] = sub_224AC73BC;
  result[52] = sub_224AC71F4;
  if (dword_26AACE160)
  {
    *uint64_t result = sub_224A95A64;
    result[1] = sub_224A95A70;
    result[2] = sub_224A944D4;
    result[6] = sub_224A95A88;
    result[7] = sub_224A95A7C;
    result[8] = sub_224A944E0;
    result[3] = sub_224A944F8;
    result[4] = sub_224A94504;
    result[5] = sub_224A944EC;
    result[9] = sub_224A96E84;
    result[20] = sub_224A984F4;
    result[21] = sub_224A98500;
    result[22] = sub_224A973FC;
    result[26] = sub_224A98518;
    result[27] = sub_224A9850C;
    result[28] = sub_224A97408;
    result[23] = sub_224A97420;
    result[24] = sub_224A9742C;
    result[25] = sub_224A97414;
    result[29] = sub_224A99494;
    result[40] = sub_224A924E0;
    result[41] = sub_224A928C4;
    result[42] = sub_224A92E94;
    result[46] = sub_224A93C8C;
    result[48] = sub_224A93E1C;
    result[47] = sub_224A94024;
    result[43] = sub_224A9363C;
    result[44] = sub_224A93848;
    result[45] = sub_224A93A6C;
    result[49] = sub_224A9994C;
    result[50] = sub_224A99AF8;
    result[51] = sub_224A99CA4;
  }
  return result;
}

uint64_t sub_224B10290()
{
  MEMORY[0x270FA5388]();
  uint64_t v0 = 0;
  *(void *)&v45[12292] = *MEMORY[0x263EF8340];
  do
  {
    uint64_t v1 = &v44[v0];
    *((_DWORD *)v1 + 1030) = 0;
    *((void *)v1 + 514) = 0;
    *((_OWORD *)v1 + 256) = 0uLL;
    *(void *)&v44[v0 + 4124] = 0x403E392B15070200;
    memset(&v44[v0 + 4132], 64, 28);
    v0 += 64;
  }
  while (v0 != 4096);
  uint64_t v2 = 0;
  int v3 = v45;
  int v4 = 48;
  unsigned int v5 = -2;
  do
  {
    if (v4 >= 5) {
      bzero(v3 + 4, (v4 - 4));
    }
    if (v4 <= 4) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = v4;
    }
    unsigned __int16 v7 = &v3[v6];
    int v8 = 64 - v4;
    if (64 - v4 >= 8) {
      int v8 = 8;
    }
    memcpy(v7, (char *)&unk_224B175EA + ((4 - v4) & ~((4 - v4) >> 31)) + 8, v8);
    if (v4 >= 60)
    {
      unsigned int v10 = v3 + 68;
      int v9 = v4 - 1;
      goto LABEL_15;
    }
    memset(&v3[v4 + 8], 64, (60 - v4));
    int v9 = v4 - 1;
    if (v4 >= 6)
    {
      unsigned int v10 = &v45[(v2 | 0x40) + 4];
LABEL_15:
      bzero(v10, (v4 - 5));
      goto LABEL_17;
    }
    unsigned int v10 = v3 + 68;
LABEL_17:
    if (v9 <= 4) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = v9;
    }
    uint64_t v12 = &v10[v11 - 4];
    int v13 = 65 - v4;
    if (65 - v4 >= 8) {
      int v13 = 8;
    }
    memcpy(v12, (char *)&unk_224B175EA + ((5 - v4) & ~((5 - v4) >> 31)), v13);
    if (v4 <= 60) {
      memset(&v10[v9 + 4], 64, (61 - v4));
    }
    v2 += 128;
    v3 += 128;
    v5 += 2;
    int v4 = v9;
  }
  while (v5 < 0x3E);
  uint64_t v14 = 0;
  uint64_t v15 = 12288;
  do
  {
    uint64_t v16 = v15;
    for (uint64_t i = 0x2000; i != 12288; i += 64)
      v44[v14 + i] = v44[v16++];
    ++v14;
    v15 += 64;
  }
  while (v14 != 64);
  uint64_t v18 = 0;
  uint64_t v19 = 4096;
  do
  {
    uint64_t v20 = 0;
    uint64_t v21 = v19;
    do
    {
      v44[v18 + v20] = v44[v21];
      v20 += 64;
      ++v21;
    }
    while (v20 != 4096);
    ++v18;
    v19 += 64;
  }
  while (v18 != 64);
  uint64_t v22 = 0;
  int v23 = 0;
  uint64_t v24 = 16447;
  do
  {
    uint64_t v25 = 0;
    uint64_t v26 = v24;
    do
      v44[v26--] = v44[v22 + 12288 + v25++];
    while (v25 != 64);
    ++v23;
    v22 += 64;
    v24 += 64;
  }
  while (v23 != 64);
  uint64_t v27 = 0;
  int v28 = 0;
  uint64_t v29 = 20543;
  do
  {
    uint64_t v30 = 0;
    uint64_t v31 = v29;
    do
      v44[v31--] = v44[v27 + 0x2000 + v30++];
    while (v30 != 64);
    ++v28;
    v27 += 64;
    v29 += 64;
  }
  while (v28 != 64);
  sub_224B109AC(0x20uLL, 32, 0, (uint64_t)v44, (uint64_t)&unk_224B17602, (unsigned __int8 *)&unk_26AAAC100, (uint64_t)&unk_26AAAC100 + 50176, (uint64_t)&unk_26AAC4900, 31739);
  sub_224B109AC(0x20uLL, 16, 1u, (uint64_t)v44, (uint64_t)&unk_224B17632, byte_26AAB0100, (uint64_t)&unk_26AABC500, (uint64_t)&unk_26AAC6900, 31723);
  sub_224B109AC(0x20uLL, 8, 2u, (uint64_t)v44, (uint64_t)&unk_224B17632, &byte_26AAB0100[0x2000], (uint64_t)&unk_26AABE500, (uint64_t)&unk_26AAC7900, 27627);
  sub_224B109AC(0x10uLL, 32, 4u, (uint64_t)v44, (uint64_t)&unk_224B17662, &byte_26AAB0100[12288], (uint64_t)&unk_26AABF500, (uint64_t)&unk_26AAC8100, 31723);
  sub_224B109AC(0x10uLL, 16, 5u, (uint64_t)v44, (uint64_t)&unk_224B17602, &byte_26AAB0100[20480], (uint64_t)&unk_26AAC1500, (uint64_t)&unk_26AAC9100, 31739);
  sub_224B109AC(0x10uLL, 8, 6u, (uint64_t)v44, (uint64_t)&unk_224B17632, &byte_26AAB0100[24576], (uint64_t)&unk_26AAC2500, (uint64_t)&unk_26AAC9900, 31723);
  sub_224B109AC(8uLL, 32, 8u, (uint64_t)v44, (uint64_t)&unk_224B17662, (unsigned __int8 *)&unk_26AAAC100 + 43008, (uint64_t)&unk_26AAC2D00, (uint64_t)&unk_26AAC9D00, 31467);
  sub_224B109AC(8uLL, 16, 9u, (uint64_t)v44, (uint64_t)&unk_224B17662, (unsigned __int8 *)&unk_26AAAC100 + 47104, (uint64_t)&unk_26AAC3D00, (uint64_t)&unk_26AACA500, 31723);
  sub_224B109AC(8uLL, 8, 0xAu, (uint64_t)v44, (uint64_t)&unk_224B17602, byte_26AAB8100, (uint64_t)&unk_26AAC4500, (uint64_t)&unk_26AACA900, 31739);
  memset(&unk_26AACAB00, 32, 0x400uLL);
  for (uint64_t j = 0; j != 2376; j += 792)
  {
    uint64_t v33 = (_WORD *)((char *)&unk_26AAAB780 + j);
    v33[392] = 15984;
    v33[356] = 15984;
    v33[248] = 15984;
    v33[212] = 15984;
    v33[176] = 15984;
    v33[68] = 15984;
    v33[32] = 15984;
  }
  sub_224B10CD4((uint64_t)&unk_26AACAF00, 0x20uLL, 0x20u, 1u);
  sub_224B10CD4((uint64_t)&unk_26AACBB00, 0x10uLL, 0x20u, 1u);
  sub_224B10CD4((uint64_t)&unk_26AACAF00 + 4608, 0x10uLL, 0x10u, 2u);
  sub_224B10CD4((uint64_t)&unk_26AACAF00 + 5376, 8uLL, 0x20u, 1u);
  sub_224B10CD4((uint64_t)&unk_26AACAF00 + 6144, 8uLL, 0x10u, 2u);
  sub_224B10CD4((uint64_t)&unk_26AACAF00 + 6528, 8uLL, 8u, 4u);
  sub_224B10CD4((uint64_t)&unk_26AACAF00 + 6720, 4uLL, 0x10u, 2u);
  sub_224B10CD4((uint64_t)&unk_26AACAF00 + 6912, 4uLL, 8u, 4u);
  sub_224B10CD4((uint64_t)&unk_26AACAF00 + 7008, 4uLL, 4u, 8u);
  int v34 = 0;
  int v35 = 0;
  int v36 = 0;
  int v37 = 0;
  int v38 = 0;
  int v39 = 0;
  uint64_t v40 = 0;
  uint64_t result = 16976;
  do
  {
    int16x8_t v42 = (_WORD *)((char *)&unk_26AAAB780 + v40);
    v42[33] = v39 + 16112;
    v42[429] = v38 + 16496;
    v42[825] = v37 + 16688;
    v42[69] = v39 + 16112;
    v42[465] = v37 + 16688;
    v42[861] = v37 + 16688;
    v42[177] = v38 + 16496;
    v42[573] = v37 + 16784;
    v42[969] = v36 + 16880;
    v42[213] = v37 + 16688;
    v42[609] = v36 + 16880;
    v42[1005] = v35 + 16928;
    v42[249] = v37 + 16688;
    v42[645] = v35 + 16928;
    v42[1041] = v35 + 16928;
    v42[357] = v36 + 16880;
    v42[753] = v35 + 16952;
    __int16 v43 = v40 + 16988;
    v40 += 2;
    v42[1149] = v34 + 16976;
    v39 += 128;
    v38 += 64;
    v42[393] = v35 + 16928;
    v37 += 32;
    v36 += 16;
    v42[789] = v34 + 16976;
    v35 += 8;
    v34 += 4;
    v42[1185] = v43;
  }
  while (v40 != 6);
  return result;
}

uint64_t sub_224B109AC(size_t __n, int a2, unsigned int a3, uint64_t a4, uint64_t a5, unsigned __int8 *__dst, uint64_t a7, uint64_t a8, int a9)
{
  unsigned int v12 = __n;
  uint64_t v13 = 0;
  uint64_t v46 = (a2 * __n) >> 1;
  uint64_t v47 = (a2 * __n);
  int v53 = 16 * v46;
  uint64_t v45 = (a2 * __n) >> 2;
  int v43 = 8 * a2;
  int v44 = 16 * v45;
  size_t v15 = __n;
  uint64_t v16 = (char *)&unk_26AAAB780 + 72 * a3;
  uint64_t v52 = v16 + 792;
  int16x8_t v42 = v16;
  unsigned int v41 = v16 + 1584;
  uint64_t v17 = __n >> 1;
  if (a2 <= 1) {
    int v18 = 1;
  }
  else {
    int v18 = a2;
  }
  unsigned int v48 = __n;
  do
  {
    uint64_t v19 = (char *)(a4
                 + ((unint64_t)*(unsigned __int8 *)(a5 + 3 * v13) << 12)
                 + (int)(2080
                       - (((v43 * *(unsigned __int8 *)(a5 + 3 * v13 + 2)) & 0x7FFFFFC0)
                        + ((*(unsigned __int8 *)(a5 + 3 * v13 + 1) * v12) >> 3))));
    uint64_t v51 = a8;
    uint64_t v55 = a7;
    unsigned int v54 = a9;
    if (a9)
    {
      int v22 = 0;
      int v23 = __dst;
      do
      {
        uint64_t v24 = 0;
        do
        {
          v23[v24] = 64 - v19[v24];
          ++v24;
        }
        while (v15 != v24);
        v19 += 64;
        v23 += v15;
        ++v22;
      }
      while (v22 != a2);
    }
    else
    {
      int v20 = a2;
      uint64_t v21 = (char *)__dst;
      do
      {
        memcpy(v21, v19, v15);
        v19 += 64;
        v21 += v15;
        --v20;
      }
      while (v20);
    }
    int v25 = 0;
    int v26 = v54 & 1;
    unsigned int v27 = (__dst - &unk_26AAAB780) >> 3;
    int v28 = &v42[2 * v13];
    *((_WORD *)v28 + 16) = v27;
    *(_WORD *)int v28 = v27;
    uint64_t v29 = v55 + (v26 * v53);
    uint64_t v30 = __dst;
    do
    {
      uint64_t v31 = 0;
      size_t v32 = 0;
      do
      {
        *(unsigned char *)(v29 + v31) = (v30[v32] + v30[v32 + 1] + 1) >> 1;
        v32 += 2;
        ++v31;
      }
      while (v32 < v15);
      v30 += v15;
      v29 += v17;
      ++v25;
    }
    while (v25 != v18);
    int v33 = 0;
    *(_WORD *)&v52[2 * v13] = (v55 + v26 * v53 - &unk_26AAAB780) >> 3;
    uint64_t v34 = v55 + !(v54 & 1) * v53;
    uint64_t v35 = (uint64_t)__dst;
    do
    {
      uint64_t v36 = 0;
      size_t v37 = 0;
      do
      {
        *(unsigned char *)(v34 + v36) = (__dst[v37] + __dst[v37 + 1]) >> 1;
        v37 += 2;
        ++v36;
      }
      while (v37 < v15);
      __dst += v15;
      v34 += v17;
      ++v33;
    }
    while (v33 != v18);
    *(_WORD *)&v52[2 * v13 + 32] = (v55 + !(v54 & 1) * v53 - &unk_26AAAB780) >> 3;
    uint64_t v38 = v35;
    unsigned int v12 = v48;
    int v39 = &v41[2 * v13];
    *(_WORD *)int v39 = sub_224B10DA0((unsigned char *)(v51 + (v26 * v44)), v35, 0, v48, a2, 1);
    uint64_t result = sub_224B10DA0((unsigned char *)(v51 + !(v54 & 1) * v44), v38, 1, v48, a2, 1);
    *((_WORD *)v39 + 16) = result;
    a9 = v54 >> 1;
    __dst = (unsigned __int8 *)(v38 + v47);
    a7 = v55 + v46;
    a8 = v51 + v45;
    ++v13;
  }
  while (v13 != 16);
  return result;
}

void *sub_224B10CD4(uint64_t a1, size_t __len, unsigned int a3, unsigned int a4)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  size_t v8 = __len;
  uint64_t v9 = a3 * __len;
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a1 + v9 + v9;
  uint64_t v12 = a4;
  uint64_t v13 = a3;
  do
  {
    uint64_t result = memset((void *)(a1 + v7), byte_224B17692[v6 * v12], v8);
    uint64_t v15 = 0;
    uint64_t v16 = byte_224B17692;
    do
    {
      if ((int)v15 >= (int)v6) {
        int v17 = v6;
      }
      else {
        int v17 = v15;
      }
      *(unsigned char *)(v11 + v15) = byte_224B17692[v17 * a4];
      *(unsigned char *)(v10 + v15++) = *v16;
      v16 += v12;
    }
    while (v8 != v15);
    ++v6;
    v7 += v8;
    v10 += v8;
    v11 += v8;
  }
  while (v6 != v13);
  return result;
}

uint64_t sub_224B10DA0(unsigned char *a1, uint64_t a2, int a3, unsigned int a4, int a5, int a6)
{
  int v6 = 0;
  int v7 = a6 + 1;
  size_t v8 = a1;
  do
  {
    uint64_t v9 = v8;
    uint64_t v10 = 1;
    do
    {
      int v11 = *(unsigned __int8 *)(a2 + v10 - 1) + *(unsigned __int8 *)(a2 + v10) + 1;
      if (a6) {
        v11 += *(unsigned __int8 *)(a2 + a4 + v10 - 1) + *(unsigned __int8 *)(a2 + a4 + v10) + 1;
      }
      *v9++ = (v11 - a3) >> v7;
      unint64_t v12 = v10 + 1;
      v10 += 2;
    }
    while (v12 < a4);
    a2 += a4 << a6;
    v8 += a4 >> 1;
    v6 += v7;
  }
  while (v6 < a5);
  return (unsigned __int16)((a1 - &unk_26AAAB780) >> 3);
}

void *sub_224B10E38(void *result)
{
  *uint64_t result = sub_224AE4A4C;
  result[10] = sub_224AE4A1C;
  result[20] = sub_224AE49F4;
  result[30] = sub_224AE49C8;
  result[1] = sub_224AE499C;
  result[11] = sub_224AE4968;
  result[21] = sub_224AE4940;
  result[31] = sub_224AE4910;
  result[2] = sub_224AE48E4;
  result[12] = sub_224AE48B0;
  result[22] = sub_224AE4888;
  result[32] = sub_224AE4858;
  result[3] = sub_224AE482C;
  result[13] = sub_224AE47F8;
  result[23] = sub_224AE47D0;
  result[33] = sub_224AE47A0;
  result[4] = sub_224AE4774;
  result[14] = sub_224AE4740;
  result[24] = sub_224AE4718;
  result[34] = sub_224AE46E8;
  result[5] = sub_224AE46BC;
  result[15] = sub_224AE4688;
  result[25] = sub_224AE4660;
  result[35] = sub_224AE4630;
  result[6] = sub_224AE4604;
  result[16] = sub_224AE45D0;
  result[26] = sub_224AE45A8;
  result[36] = sub_224AE4578;
  result[7] = sub_224AE454C;
  result[17] = sub_224AE4518;
  result[27] = sub_224AE44F0;
  result[37] = sub_224AE44C0;
  result[8] = sub_224AE4018;
  result[18] = sub_224AE3C30;
  result[28] = sub_224AE37B0;
  result[38] = sub_224AE3424;
  result[9] = sub_224AE3104;
  result[19] = sub_224AE2F54;
  result[29] = sub_224AE2C94;
  result[39] = sub_224AE2B0C;
  result[40] = sub_224AE2A90;
  result[41] = sub_224AE2A0C;
  result[42] = sub_224AE2974;
  result[46] = sub_224AE290C;
  result[47] = sub_224AE2894;
  result[48] = sub_224AE2820;
  result[43] = sub_224AE27F4;
  result[44] = sub_224AE27C4;
  result[45] = sub_224AE2618;
  result[49] = sub_224AE23C8;
  result[50] = sub_224AE2190;
  result[51] = sub_224AE1F38;
  result[52] = sub_224AE1D9C;
  if (dword_26AACE160)
  {
    *uint64_t result = sub_224AA3BA0;
    result[1] = sub_224AA3BAC;
    result[2] = sub_224AA2830;
    result[6] = sub_224AA3BC4;
    result[7] = sub_224AA3BB8;
    result[8] = sub_224AA283C;
    result[3] = sub_224AA2854;
    result[4] = sub_224AA2860;
    result[5] = sub_224AA2848;
    result[9] = sub_224AA4DB8;
    result[20] = sub_224AA6328;
    result[21] = sub_224AA6334;
    result[22] = sub_224AA53E8;
    result[26] = sub_224AA634C;
    result[27] = sub_224AA6340;
    result[28] = sub_224AA53F4;
    result[23] = sub_224AA540C;
    result[24] = sub_224AA5418;
    result[25] = sub_224AA5400;
    result[29] = sub_224AA7130;
    result[40] = sub_224A9FB3C;
    result[41] = sub_224A9FF28;
    result[42] = sub_224AA0870;
    result[46] = sub_224AA1E80;
    result[48] = sub_224AA202C;
    result[47] = sub_224AA2270;
    result[43] = sub_224AA1410;
    result[44] = sub_224AA177C;
    result[45] = sub_224AA1B00;
    result[49] = sub_224AA7740;
    result[50] = sub_224AA7924;
    result[51] = sub_224AA7AF8;
  }
  return result;
}

uint64_t sub_224B11398(pthread_mutex_t **a1)
{
  uint64_t v2 = (pthread_mutex_t *)malloc_type_malloc(0x50uLL, 0x1020040D51851D7uLL);
  int v3 = v2;
  if (v2)
  {
    uint64_t result = pthread_mutex_init(v2, 0);
    if (!result)
    {
      v3[1].__sig = 0;
      *(void *)v3[1].__opaque = 1;
      goto LABEL_6;
    }
    free(v3);
    int v3 = 0;
  }
  uint64_t result = 4294967284;
LABEL_6:
  *a1 = v3;
  return result;
}

void sub_224B11410(uint64_t a1)
{
  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)a1);
    uint64_t v2 = *(void *)(a1 + 64);
    int v3 = *(_DWORD *)(a1 + 72) - 1;
    *(void *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 72) = v3;
    *(_DWORD *)(a1 + 76) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    while (v2)
    {
      int v4 = *(void **)v2;
      uint64_t v2 = *(void *)(v2 + 8);
      free(v4);
    }
    if (!v3)
    {
      pthread_mutex_destroy((pthread_mutex_t *)a1);
      free((void *)a1);
    }
  }
}

uint64_t sub_224B114A0()
{
  int v7 = 0;
  size_t v6 = 4;
  int v0 = sysctlbyname("hw.optional.arm.FEAT_DotProd", &v7, &v6, 0, 0);
  if (v7) {
    BOOL v1 = v0 == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1) {
    unsigned int v2 = 3;
  }
  else {
    unsigned int v2 = 1;
  }
  int v7 = 0;
  size_t v6 = 4;
  int v3 = sysctlbyname("hw.optional.arm.FEAT_I8MM", &v7, &v6, 0, 0);
  if (v7) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return v2 | 4;
  }
  else {
    return v2;
  }
}

void *sub_224B11538(void *result)
{
  *uint64_t result = sub_224AE6BC8;
  result[5] = sub_224AE6BB8;
  result[4] = sub_224AE6B78;
  result[3] = sub_224AE6AC0;
  result[2] = sub_224AE6A58;
  result[1] = sub_224AE69F0;
  result[12] = sub_224AE6964;
  result[9] = sub_224AE68B4;
  result[10] = sub_224AE6834;
  result[11] = sub_224AE67BC;
  result[6] = sub_224AE65B4;
  result[7] = sub_224AE62E4;
  result[8] = sub_224AE5ECC;
  result[13] = sub_224AE5D5C;
  result[14] = sub_224AE5D30;
  result[15] = sub_224AE5D08;
  result[16] = sub_224AE5AA4;
  result[17] = sub_224AE59A0;
  result[22] = sub_224AE5990;
  result[21] = sub_224AE5950;
  result[20] = sub_224AE5898;
  result[23] = sub_224AE583C;
  if (dword_26AACE160)
  {
    *uint64_t result = sub_224A80DE4;
    result[5] = sub_224A808A0;
    result[4] = sub_224A80B40;
    result[3] = sub_224A80C7C;
    result[2] = sub_224A80A3C;
    result[1] = sub_224A8096C;
    result[12] = sub_224A81090;
    result[9] = sub_224A812F0;
    result[10] = sub_224A81564;
    result[11] = sub_224A81734;
    result[6] = sub_224AE56A8;
    result[7] = sub_224AE53B8;
    result[8] = sub_224AE50F0;
    result[13] = sub_224A8331C;
    result[17] = sub_224A839E8;
    result[22] = sub_224A83720;
    result[21] = sub_224A838C4;
    result[20] = sub_224A8394C;
    result[14] = sub_224A83B94;
    result[15] = sub_224A83FA4;
    result[16] = sub_224A8426C;
    result[23] = sub_224A8353C;
  }
  return result;
}

void *sub_224B11808(void *result)
{
  *uint64_t result = sub_224AE8680;
  result[5] = sub_224AE8664;
  result[4] = sub_224AE8620;
  result[3] = sub_224AE8588;
  result[2] = sub_224AE8538;
  result[1] = sub_224AE84CC;
  result[12] = sub_224AE8440;
  result[9] = sub_224AE838C;
  result[10] = sub_224AE830C;
  result[11] = sub_224AE8290;
  result[6] = sub_224AE8080;
  result[7] = sub_224AE7DA8;
  result[8] = sub_224AE797C;
  result[13] = sub_224AE7808;
  result[14] = sub_224AE77DC;
  result[15] = sub_224AE77B4;
  result[16] = sub_224AE7550;
  result[17] = sub_224AE743C;
  result[22] = sub_224AE7424;
  result[21] = sub_224AE73E4;
  result[20] = sub_224AE7328;
  result[23] = sub_224AE72C4;
  if (dword_26AACE160)
  {
    *uint64_t result = sub_224AA9750;
    result[5] = sub_224AA9124;
    result[4] = sub_224AA9444;
    result[3] = sub_224AA95B0;
    result[2] = sub_224AA9300;
    result[1] = sub_224AA9218;
    result[12] = sub_224AA9A4C;
    result[9] = sub_224AA9BFC;
    result[10] = sub_224AA9ECC;
    result[11] = sub_224AAA064;
    result[6] = sub_224AE712C;
    result[7] = sub_224AE6E2C;
    result[8] = sub_224AE6C30;
    result[13] = sub_224AAC3C0;
    result[17] = sub_224AACA2C;
    result[22] = sub_224AAC6D4;
    result[21] = sub_224AAC8E8;
    result[20] = sub_224AAC980;
    result[14] = sub_224AACBF8;
    result[15] = sub_224AAD044;
    result[16] = sub_224AAD374;
    result[23] = sub_224AAC3D0;
  }
  return result;
}

uint64_t sub_224B11AD8(uint64_t a1, const char *a2, va_list a3)
{
  return vfprintf((FILE *)*MEMORY[0x263EF8348], a2, a3);
}

uint64_t sub_224B11AE8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)(result + 63168)) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t *))(result + 63168))(*(void *)(result + 63160), a2, &a9);
  }
  return result;
}

void *sub_224B11B28(void *result, int a2)
{
  result[16] = sub_224AEBAF0;
  *uint64_t result = sub_224AEBAA8;
  result[9] = sub_224AEBA64;
  result[2] = sub_224AEBA14;
  result[1] = sub_224AEB9C4;
  result[3] = sub_224AEB980;
  result[7] = sub_224AEB930;
  result[8] = sub_224AEB8E0;
  result[5] = sub_224AEB890;
  result[4] = sub_224AEB840;
  result[6] = sub_224AEB7FC;
  result[11] = sub_224AEB7AC;
  result[10] = sub_224AEB75C;
  result[15] = sub_224AEB70C;
  result[14] = sub_224AEB6BC;
  result[13] = sub_224AEB66C;
  result[12] = sub_224AEB61C;
  result[85] = sub_224AEB5C8;
  result[94] = sub_224AEB578;
  result[87] = sub_224AEB528;
  result[86] = sub_224AEB4D8;
  result[88] = sub_224AEB488;
  result[92] = sub_224AEB438;
  result[93] = sub_224AEB3E8;
  result[90] = sub_224AEB398;
  result[89] = sub_224AEB348;
  result[91] = sub_224AEB2F8;
  result[96] = sub_224AEB2A8;
  result[95] = sub_224AEB258;
  result[100] = sub_224AEB208;
  result[99] = sub_224AEB1B8;
  result[98] = sub_224AEB168;
  result[97] = sub_224AEB118;
  result[221] = sub_224AEB0C4;
  result[230] = sub_224AEB074;
  result[223] = sub_224AEB024;
  result[222] = sub_224AEAFD4;
  result[224] = sub_224AEAF84;
  result[228] = sub_224AEAF34;
  result[229] = sub_224AEAEE4;
  result[226] = sub_224AEAE94;
  result[225] = sub_224AEAE44;
  result[227] = sub_224AEADF4;
  result[232] = sub_224AEADA4;
  result[231] = sub_224AEAD54;
  result[236] = sub_224AEAD04;
  result[235] = sub_224AEACB4;
  result[234] = sub_224AEAC64;
  result[233] = sub_224AEAC14;
  result[102] = sub_224AEABC0;
  result[111] = sub_224AEAB70;
  result[104] = sub_224AEAB20;
  result[103] = sub_224AEAAD0;
  result[105] = sub_224AEAA80;
  result[109] = sub_224AEAA30;
  result[110] = sub_224AEA9E0;
  result[107] = sub_224AEA990;
  result[106] = sub_224AEA940;
  result[108] = sub_224AEA8F0;
  result[113] = sub_224AEA8A0;
  result[112] = sub_224AEA850;
  result[117] = sub_224AEA800;
  result[116] = sub_224AEA7B0;
  result[115] = sub_224AEA760;
  result[114] = sub_224AEA710;
  result[17] = sub_224AEA6C8;
  result[26] = sub_224AEA684;
  result[19] = sub_224AEA634;
  result[18] = sub_224AEA5E4;
  result[20] = sub_224AEA5A0;
  result[24] = sub_224AEA550;
  result[25] = sub_224AEA500;
  result[22] = sub_224AEA4B0;
  result[21] = sub_224AEA460;
  result[23] = sub_224AEA41C;
  result[28] = sub_224AEA3CC;
  result[27] = sub_224AEA37C;
  result[32] = sub_224AEA32C;
  result[31] = sub_224AEA2DC;
  result[30] = sub_224AEA28C;
  result[29] = sub_224AEA23C;
  result[119] = sub_224AEA1E8;
  result[128] = sub_224AEA198;
  result[121] = sub_224AEA148;
  result[120] = sub_224AEA0F8;
  result[122] = sub_224AEA0A8;
  result[126] = sub_224AEA058;
  result[127] = sub_224AEA008;
  result[124] = sub_224AE9FB8;
  result[123] = sub_224AE9F68;
  result[125] = sub_224AE9F18;
  result[130] = sub_224AE9EC8;
  result[129] = sub_224AE9E78;
  result[134] = sub_224AE9E28;
  result[133] = sub_224AE9DD8;
  result[132] = sub_224AE9D88;
  result[131] = sub_224AE9D38;
  result[255] = sub_224AE9CE4;
  result[264] = sub_224AE9C94;
  result[238] = sub_224AE9C40;
  result[247] = sub_224AE9BF0;
  result[240] = sub_224AE9BA0;
  result[239] = sub_224AE9B50;
  result[241] = sub_224AE9B00;
  result[245] = sub_224AE9AB0;
  result[246] = sub_224AE9A60;
  result[243] = sub_224AE9A10;
  result[242] = sub_224AE99C0;
  result[244] = sub_224AE9970;
  result[249] = sub_224AE9920;
  result[248] = sub_224AE98D0;
  result[253] = sub_224AE9880;
  result[252] = sub_224AE9830;
  result[251] = sub_224AE97E0;
  result[250] = sub_224AE9790;
  result[136] = sub_224AE973C;
  result[145] = sub_224AE96EC;
  result[138] = sub_224AE969C;
  result[137] = sub_224AE964C;
  result[139] = sub_224AE95FC;
  result[143] = sub_224AE95AC;
  result[144] = sub_224AE955C;
  result[141] = sub_224AE950C;
  result[140] = sub_224AE94BC;
  result[142] = sub_224AE946C;
  result[147] = sub_224AE941C;
  result[146] = sub_224AE93CC;
  result[151] = sub_224AE937C;
  result[150] = sub_224AE932C;
  result[149] = sub_224AE92DC;
  result[148] = sub_224AE928C;
  result[34] = sub_224AE9244;
  result[43] = sub_224AE9200;
  result[36] = sub_224AE91B0;
  result[35] = sub_224AE9160;
  result[37] = sub_224AE911C;
  result[41] = sub_224AE90CC;
  result[42] = sub_224AE907C;
  result[39] = sub_224AE902C;
  result[38] = sub_224AE8FDC;
  result[40] = sub_224AE8F98;
  result[45] = sub_224AE8F48;
  result[44] = sub_224AE8EF8;
  result[153] = sub_224AE8EA4;
  result[162] = sub_224AE8E54;
  result[289] = sub_224AE8E00;
  result[272] = sub_224AE8DAC;
  result[281] = sub_224AE8D5C;
  result[170] = sub_224AE8D08;
  result[179] = sub_224AE8CB8;
  result[51] = sub_224AE8C70;
  result[60] = sub_224AE8C2C;
  result[187] = sub_224AE8BD8;
  result[306] = sub_224AE8B84;
  result[204] = sub_224AE8B30;
  result[68] = sub_224AE87D4;
  if (dword_26AACE160)
  {
    result[16] = sub_224A86168;
    if (a2 == 10)
    {
      *uint64_t result = sub_224A862AC;
      result[9] = sub_224A86304;
      result[1] = sub_224A86318;
      result[4] = sub_224A8632C;
      result[11] = sub_224A86340;
      result[2] = sub_224A86354;
      result[3] = sub_224A86368;
      result[8] = sub_224A8637C;
      result[5] = sub_224A86390;
      result[7] = sub_224A863A4;
      result[6] = sub_224A863B8;
      result[10] = sub_224A863CC;
      result[13] = sub_224A863E0;
      result[15] = sub_224A863F4;
      result[12] = sub_224A86408;
      result[14] = sub_224A8641C;
      result[85] = sub_224A86ECC;
      result[94] = sub_224A86F18;
      result[86] = sub_224A86F30;
      result[89] = sub_224A86F48;
      result[96] = sub_224A86F60;
      result[87] = sub_224A86F78;
      result[88] = sub_224A86F90;
      result[93] = sub_224A86FA8;
      result[90] = sub_224A86FC0;
      result[92] = sub_224A86FD8;
      result[91] = sub_224A86FF0;
      result[95] = sub_224A87008;
      result[98] = sub_224A87020;
      result[100] = sub_224A87038;
      result[97] = sub_224A87050;
      result[99] = sub_224A87068;
      result[221] = sub_224A888F0;
      result[230] = sub_224A88938;
      result[222] = sub_224A88950;
      result[225] = sub_224A88968;
      result[232] = sub_224A88980;
      result[223] = sub_224A88998;
      result[224] = sub_224A889B0;
      result[229] = sub_224A889C8;
      result[226] = sub_224A889E0;
      result[228] = sub_224A889F8;
      result[227] = sub_224A88A10;
      result[231] = sub_224A88A28;
      result[234] = sub_224A88A40;
      result[236] = sub_224A88A58;
      result[233] = sub_224A88A70;
      result[235] = sub_224A88A88;
      result[102] = sub_224A87080;
      result[111] = sub_224A870C8;
      result[103] = sub_224A870DC;
      result[106] = sub_224A870F0;
      result[113] = sub_224A87104;
      result[104] = sub_224A87118;
      result[105] = sub_224A8712C;
      result[110] = sub_224A87140;
      result[107] = sub_224A87154;
      result[109] = sub_224A87168;
      result[108] = sub_224A8717C;
      result[112] = sub_224A87190;
      result[115] = sub_224A871A4;
      result[117] = sub_224A871B8;
      result[114] = sub_224A871CC;
      result[116] = sub_224A871E0;
      result[17] = sub_224A86A78;
      result[26] = sub_224A86AC0;
      result[18] = sub_224A86AD8;
      result[21] = sub_224A86AF0;
      result[28] = sub_224A86B08;
      result[19] = sub_224A86B20;
      result[20] = sub_224A86B38;
      result[25] = sub_224A86B50;
      result[22] = sub_224A86B68;
      result[24] = sub_224A86B80;
      result[23] = sub_224A86B98;
      result[27] = sub_224A86BB0;
      result[30] = sub_224A86BC8;
      result[32] = sub_224A86BE0;
      result[29] = sub_224A86BF8;
      result[31] = sub_224A86C10;
      result[119] = sub_224A89500;
      result[128] = sub_224A8954C;
      result[120] = sub_224A89564;
      result[123] = sub_224A8957C;
      result[130] = sub_224A89594;
      result[121] = sub_224A895AC;
      result[122] = sub_224A895C4;
      result[127] = sub_224A895DC;
      result[124] = sub_224A895F4;
      result[126] = sub_224A8960C;
      result[125] = sub_224A89624;
      result[129] = sub_224A8963C;
      result[132] = sub_224A89654;
      result[134] = sub_224A8966C;
      result[131] = sub_224A89684;
      result[133] = sub_224A8969C;
      result[255] = sub_224A8BA48;
      result[264] = sub_224A8B280;
      result[238] = sub_224A88AA0;
      result[247] = sub_224A88AE0;
      result[239] = sub_224A88AF0;
      result[242] = sub_224A88B00;
      result[249] = sub_224A88B10;
      result[240] = sub_224A88B20;
      result[241] = sub_224A88B30;
      result[246] = sub_224A88B40;
      result[243] = sub_224A88B50;
      result[245] = sub_224A88B60;
      result[244] = sub_224A88B70;
      result[248] = sub_224A88B80;
      result[251] = sub_224A88B90;
      result[253] = sub_224A88BA0;
      result[250] = sub_224A88BB0;
      result[252] = sub_224A88BC0;
      result[136] = sub_224A896B4;
      result[145] = sub_224A89704;
      result[137] = sub_224A89720;
      result[140] = sub_224A8973C;
      result[147] = sub_224A89758;
      result[138] = sub_224A89774;
      result[139] = sub_224A89790;
      result[144] = sub_224A897AC;
      result[141] = sub_224A897C8;
      result[143] = sub_224A897E4;
      result[142] = sub_224A89800;
      result[146] = sub_224A8981C;
      result[149] = sub_224A89838;
      result[151] = sub_224A89854;
      result[148] = sub_224A89870;
      result[150] = sub_224A8988C;
      result[34] = sub_224A882EC;
      result[43] = sub_224A88334;
      result[35] = sub_224A8834C;
      result[38] = sub_224A88364;
      result[45] = sub_224A8837C;
      result[36] = sub_224A88394;
      result[37] = sub_224A883AC;
      result[42] = sub_224A883C4;
      result[39] = sub_224A883DC;
      result[41] = sub_224A883F4;
      result[40] = sub_224A8840C;
      result[44] = sub_224A88424;
      result[153] = sub_224A8B794;
      result[162] = sub_224A8AC58;
      result[289] = sub_224A8D634;
      result[272] = sub_224A8BB70;
      result[281] = sub_224A8B438;
      result[170] = sub_224A8B918;
      result[179] = sub_224A8AF4C;
      result[51] = sub_224A8B5F0;
      result[60] = sub_224A8AA74;
      result[187] = sub_224A8D2D4;
      result[306] = sub_224A8D494;
      result[204] = sub_224A8D084;
      result[68] = sub_224A8CE18;
    }
  }
  return result;
}

uint64_t sub_224B12EC0()
{
  BOOL v1 = &unk_26AACE1A0;
  unsigned int v2 = &unk_26AACE1E0;
  int v3 = &unk_26AACE2E0;
  BOOL v4 = &unk_26AACE6E0;
  sub_224B12F48((uint64_t)&unk_26AACE190, 0, (uint64_t)&v1, 1, 0);
  BOOL v1 = 0;
  unsigned int v2 = &unk_26AACEEF0;
  int v3 = &unk_26AACEF30;
  BOOL v4 = &unk_26AACF030;
  return sub_224B12F48((uint64_t)&unk_26AACEEE0, 1u, (uint64_t)&v1, 1, 0);
}

uint64_t sub_224B12F48(uint64_t a1, unsigned int a2, uint64_t a3, int a4, int a5)
{
  if (a4) {
    char v10 = 7;
  }
  else {
    char v10 = 0;
  }
  if (a5) {
    char v11 = 56;
  }
  else {
    char v11 = 0;
  }
  uint64_t result = sub_224B130B4(a1, a2, v11 | v10);
  if (a2 == 3)
  {
    for (uint64_t i = 8; i != 16; i += 2)
    {
      uint64_t v14 = *(unsigned char **)(a3 + 24);
      if (i == 10 && a4 == 0 || i == 14) {
        char v17 = 0;
      }
      else {
        char v17 = 7;
      }
      BOOL v18 = i != 12 || a5 == 0;
      *(void *)(a3 + 24) = v14 + 8;
      *(_WORD *)(a1 + i) = (_WORD)v14 - a1;
      if (!v18 || i == 8) {
        char v20 = 56;
      }
      else {
        char v20 = 0;
      }
      *uint64_t v14 = v17 | v20;
      v14[1] = v17 | 0x38;
      v14[3] = v20 | 7;
      v14[2] = (v17 | v20) & 0x3C;
      v14[4] = (v17 | v20) & 0xF7;
      v14[5] = v17 | 0x10;
      v14[6] = v17 | v20 | 1;
      v14[7] = (v17 | v20) & 0x34;
    }
  }
  else
  {
    for (uint64_t j = 8; j != 16; j += 2)
    {
      uint64_t v22 = *(void *)(a3 + 8 * a2);
      *(void *)(a3 + 8 * a2) = v22 + 16;
      *(_WORD *)(a1 + j) = v22 - a1;
      uint64_t result = sub_224B12F48();
    }
  }
  return result;
}

uint64_t sub_224B130B4(uint64_t result, int a2, char a3)
{
  *(unsigned char *)uint64_t result = a3;
  *(unsigned char *)(result + 1) = a3 | 0x38;
  *(unsigned char *)(result + 3) = a3 | 7;
  *(unsigned char *)(result + 2) = a3 & 0x38;
  *(unsigned char *)(result + 4) = a3 & 7;
  *(_WORD *)(result + 5) = 1848;
  if (a2 == 3)
  {
    *(unsigned char *)(result + 5) = a3 & 4 | 0x38;
    *(unsigned char *)(result + 6) = a3 & 0x30 | 7;
  }
  return result;
}

uint64_t sub_224B13104(uint64_t result, uint64_t a2, int *a3, int *a4)
{
  int v7 = *(_DWORD *)(a2 + 4);
  if (!v7)
  {
    uint64_t result = sub_224B143E8(result);
    int v7 = (int)result >= 256 ? 256 : result;
    if (v7 <= 1) {
      int v7 = 1;
    }
  }
  *a3 = v7;
  unsigned int v8 = *(_DWORD *)(a2 + 8);
  if (v8)
  {
    if (v8 < v7) {
      int v7 = *(_DWORD *)(a2 + 8);
    }
  }
  else if (v7 > 0x31)
  {
    int v7 = 8;
  }
  else
  {
    int v7 = byte_224B19528[v7 - 1];
  }
  *a4 = v7;
  return result;
}

uint64_t sub_224B13194(uint64_t *a1, unsigned int *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  pthread_once(&stru_26AA96D90, (void (*)(void))sub_224B13C34);
  uint64_t v4 = 4294967274;
  if (a1
    && a2
    && a2[1] <= 0x100
    && a2[2] <= 0x100
    && *((void *)a2 + 5)
    && *((void *)a2 + 6)
    && a2[4] <= 0x1F
    && a2[21] <= 3)
  {
    memset(&v35, 0, sizeof(v35));
    if (pthread_attr_init(&v35)) {
      return 4294967284;
    }
    pthread_attr_setstacksize(&v35, 0x100000uLL);
    memptr = 0;
    if (malloc_type_posix_memalign(&memptr, 0x40uLL, 0xF700uLL, 0xE584FBEuLL)) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = memptr;
    }
    *a1 = (uint64_t)v5;
    if (v5)
    {
      bzero(v5, 0xF700uLL);
      long long v7 = *((_OWORD *)a2 + 2);
      v5[7880] = *((void *)a2 + 6);
      *((_OWORD *)v5 + 3939) = v7;
      *(_OWORD *)(v5 + 7895) = *(_OWORD *)(a2 + 14);
      v5[7881] = *(void *)(a2 + 3);
      *((_DWORD *)v5 + 15765) = a2[5];
      *((_DWORD *)v5 + 15767) = a2[6];
      *((_OWORD *)v5 + 3942) = *(_OWORD *)(a2 + 18);
      v5[7893] = 0;
      *(_OWORD *)(v5 + 7891) = 0u;
      *(_OWORD *)(v5 + 7889) = 0u;
      v5[7888] = 0x8000000000000000;
      v5[7890] = -1;
      if (!sub_224B11398((pthread_mutex_t **)v5 + 9)
        && !sub_224B11398((pthread_mutex_t **)v5 + 12)
        && !sub_224B11398((pthread_mutex_t **)v5 + 6240)
        && !sub_224B11398((pthread_mutex_t **)v5 + 6241)
        && !sub_224B11398((pthread_mutex_t **)v5 + 7898)
        && !sub_224B11398((pthread_mutex_t **)v5 + 6586))
      {
        unsigned int v8 = (void (*)(uint64_t, uint64_t))v5[7880];
        size_t v32 = (uint64_t (**)(uint64_t, int, int, int, int, int))(v5 + 7875);
        if ((uint64_t (*)(uint64_t, uint64_t))v5[7879] == sub_224AFA814)
        {
          if (v8 != sub_224AFA904 || v5[7878] || sub_224B11398((pthread_mutex_t **)v5 + 7897)) {
            goto LABEL_30;
          }
          v5[7878] = v5[7897];
        }
        else if (v8 == sub_224AFA904)
        {
          goto LABEL_30;
        }
        v5[106] = v5 + 105;
        *((_DWORD *)v5 + 210) = 0;
        uint64_t v9 = (unsigned int *)(v5 + 1);
        int v33 = v5 + 3;
        sub_224B13104((uint64_t)v5, (uint64_t)a2, (int *)v5 + 6, (int *)v5 + 2);
        size_t v10 = 5712 * *((unsigned int *)v5 + 2);
        memptr = 0;
        char v11 = malloc_type_posix_memalign(&memptr, 0x20uLL, v10, 0xE584FBEuLL) ? 0 : memptr;
        void *v5 = v11;
        if (v11)
        {
          bzero(v11, 5712 * *((unsigned int *)v5 + 2));
          size_t v12 = 258752 * *((unsigned int *)v5 + 6);
          memptr = 0;
          uint64_t v13 = malloc_type_posix_memalign(&memptr, 0x40uLL, v12, 0xE584FBEuLL) ? 0 : memptr;
          v5[2] = v13;
          if (v13)
          {
            bzero(v13, 258752 * *v33);
            if (*v33 <= 1u)
            {
              unsigned int v16 = *v9;
            }
            else
            {
              uint64_t v14 = (pthread_mutex_t *)(v5 + 112);
              if (pthread_mutex_init((pthread_mutex_t *)v5 + 14, 0)) {
                goto LABEL_30;
              }
              uint64_t v15 = (pthread_cond_t *)(v5 + 120);
              if (pthread_cond_init((pthread_cond_t *)v5 + 20, 0)) {
                goto LABEL_73;
              }
              if (pthread_cond_init((pthread_cond_t *)(v5 + 129), 0)) {
                goto LABEL_72;
              }
              unsigned int v16 = *((_DWORD *)v5 + 2);
              *((_DWORD *)v5 + 253) = v16;
              v5[127] = 0xFFFFFFFFLL;
              *((_DWORD *)v5 + 12464) = 1;
            }
            if (v16 >= 2)
            {
              size_t v17 = 296 * v16;
              BOOL v18 = malloc_type_malloc(v17, 0xEDC67742uLL);
              v5[107] = v18;
              if (!v18) {
                goto LABEL_30;
              }
              bzero(v18, v17);
              unsigned int v16 = *v9;
            }
            if (v16)
            {
              unint64_t v19 = 0;
              uint64_t v20 = 5608;
              do
              {
                uint64_t v21 = *v5;
                if (*((_DWORD *)v5 + 6) >= 2u)
                {
                  if (pthread_mutex_init((pthread_mutex_t *)(v21 + v20 - 248), 0)) {
                    goto LABEL_30;
                  }
                  if (pthread_cond_init((pthread_cond_t *)(v21 + v20 - 184), 0))
                  {
                    uint64_t v14 = (pthread_mutex_t *)(v21 + v20 - 248);
                    goto LABEL_73;
                  }
                  uint64_t v22 = v21 + v20;
                  if (pthread_mutex_init((pthread_mutex_t *)(v21 + v20), 0))
                  {
                    uint64_t v15 = (pthread_cond_t *)(v22 - 184);
                    uint64_t v14 = (pthread_mutex_t *)(v22 - 248);
                    goto LABEL_72;
                  }
                }
                *(void *)(v21 + v20 - 2352) = v5;
                *(void *)(v21 + v20 - 136) = v5 + 112;
                *(_DWORD *)(v21 + v20 - 968) = -1;
                int v23 = (_OWORD *)(v21 + v20 - 1384);
                *int v23 = 0u;
                v23[1] = 0u;
                ++v19;
                v20 += 5712;
              }
              while (v19 < *((unsigned int *)v5 + 2));
            }
            dispatch_group_t v24 = dispatch_group_create();
            v5[4] = v24;
            if (v24)
            {
              dispatch_queue_global_t global_queue = dispatch_get_global_queue(*a2, 0);
              v5[5] = global_queue;
              if (global_queue)
              {
                if (*v33)
                {
                  uint64_t v26 = 0;
                  for (unint64_t i = 0; i < v31; ++i)
                  {
                    uint64_t v28 = v5[2];
                    uint64_t v29 = v28 + v26;
                    uint64_t v30 = *v5;
                    *(void *)(v29 + 258696) = v5 + 112;
                    *(void *)uint64_t v29 = v5;
                    *(void *)(v29 + 8) = v30;
                    bzero((void *)(v28 + v26 + 1024), 0x1000uLL);
                    unint64_t v31 = *((unsigned int *)v5 + 6);
                    if (v31 >= 2)
                    {
                      if (pthread_mutex_init((pthread_mutex_t *)(v29 + 258624), 0)) {
                        goto LABEL_30;
                      }
                      if (pthread_cond_init((pthread_cond_t *)(v28 + v26 + 258576), 0))
                      {
                        uint64_t v14 = (pthread_mutex_t *)(v28 + v26 + 258624);
                        goto LABEL_73;
                      }
                      if (!v5[4]
                        && pthread_create((pthread_t *)(v29 + 258568), &v35, (void *(__cdecl *)(void *))sub_224AFC5B0, (void *)(v28 + v26)))
                      {
                        uint64_t v15 = (pthread_cond_t *)(v28 + v26 + 258576);
                        uint64_t v14 = (pthread_mutex_t *)(v28 + v26 + 258624);
LABEL_72:
                        pthread_cond_destroy(v15);
LABEL_73:
                        pthread_mutex_destroy(v14);
                        goto LABEL_30;
                      }
                      *(_DWORD *)(v28 + v26 + 258688) = 1;
                      unint64_t v31 = *v33;
                    }
                    v26 += 258752;
                  }
                }
                v5[7874] = sub_224AFB8E8;
                *size_t v32 = sub_224ABDF28;
                v5[7876] = sub_224ABDCA0;
                v5[7877] = sub_224ABDC5C;
                uint64_t v4 = 0;
                if (dword_26AACE160)
                {
                  v32[1] = (uint64_t (*)(uint64_t, int, int, int, int, int))sub_224A8069C;
                  v32[2] = (uint64_t (*)(uint64_t, int, int, int, int, int))sub_224A80608;
                }
                goto LABEL_16;
              }
            }
          }
        }
      }
LABEL_30:
      sub_224B13814(a1, 0);
    }
    uint64_t v4 = 4294967284;
LABEL_16:
    pthread_attr_destroy(&v35);
  }
  return v4;
}

void sub_224B13814(uint64_t *a1, int a2)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if (a2) {
      sub_224AF729C(*a1);
    }
    uint64_t v4 = *(void **)(v2 + 16);
    if (v4)
    {
      if (*(_DWORD *)(v2 + 49856))
      {
        pthread_mutex_lock((pthread_mutex_t *)(v2 + 896));
        uint64_t v5 = *(unsigned int *)(v2 + 24);
        if (v5)
        {
          size_t v6 = (_DWORD *)(*(void *)(v2 + 16) + 258716);
          do
          {
            if (!*(v6 - 7)) {
              break;
            }
            *size_t v6 = 1;
            v6 += 64688;
            --v5;
          }
          while (v5);
        }
        pthread_cond_broadcast((pthread_cond_t *)(v2 + 960));
        pthread_mutex_unlock((pthread_mutex_t *)(v2 + 896));
        long long v7 = *(NSObject **)(v2 + 32);
        if (v7) {
          dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
        }
        if (*(_DWORD *)(v2 + 24))
        {
          unint64_t v8 = 0;
          uint64_t v9 = 258688;
          do
          {
            uint64_t v10 = *(void *)(v2 + 16);
            if (!*(_DWORD *)(v10 + v9)) {
              break;
            }
            if (!*(void *)(v2 + 32)) {
              pthread_join(*(pthread_t *)(v10 + v9 - 120), 0);
            }
            uint64_t v11 = v10 + v9;
            pthread_cond_destroy((pthread_cond_t *)(v11 - 112));
            pthread_mutex_destroy((pthread_mutex_t *)(v11 - 64));
            ++v8;
            v9 += 258752;
          }
          while (v8 < *(unsigned int *)(v2 + 24));
        }
        pthread_cond_destroy((pthread_cond_t *)(v2 + 1032));
        pthread_cond_destroy((pthread_cond_t *)(v2 + 960));
        pthread_mutex_destroy((pthread_mutex_t *)(v2 + 896));
        uint64_t v4 = *(void **)(v2 + 16);
      }
      free(v4);
    }
    size_t v12 = *(NSObject **)(v2 + 32);
    if (v12) {
      dispatch_release(v12);
    }
    uint64_t v13 = *(char **)v2;
    if (*(void *)v2)
    {
      uint64_t v14 = -1;
      uint64_t v15 = 3112;
      do
      {
        unint64_t v16 = *(unsigned int *)(v2 + 8);
        if (++v14 >= v16) {
          break;
        }
        if (v16 >= 2)
        {
          free(*(void **)&v13[v15 + 2576]);
          free(*(void **)&v13[v15 + 1248]);
          free(*(void **)&v13[v15 + 1256]);
          free(*(void **)&v13[v15 + 1272]);
          free(*(void **)&v13[v15 + 1280]);
          free(*(void **)&v13[v15 + 1312]);
          free(*(void **)&v13[v15 + 1264]);
        }
        if (*(_DWORD *)(v2 + 24) >= 2u)
        {
          pthread_mutex_destroy((pthread_mutex_t *)&v13[v15 + 2496]);
          pthread_cond_destroy((pthread_cond_t *)&v13[v15 + 2312]);
          pthread_mutex_destroy((pthread_mutex_t *)&v13[v15 + 2248]);
        }
        size_t v17 = &v13[v15];
        free(*(void **)&v13[v15 + 1232]);
        free(*(void **)&v13[v15 + 2368]);
        free(*(void **)&v13[v15 + 2376]);
        free(*(void **)&v13[v15 + 152]);
        free(*(void **)&v13[v15 + 296]);
        free(*(void **)&v13[v15 + 920]);
        free(*(void **)&v13[v15]);
        free(*(void **)&v13[v15 + 1328]);
        free(*(void **)&v13[v15 + 1320]);
        free(*(void **)&v13[v15 + 1336]);
        free(*(void **)&v13[v15 + 2048]);
        free(*(void **)&v13[v15 + 2176]);
        BOOL v18 = *(void **)&v13[v15 + 1128];
        if (v18)
        {
          free(v18);
          *((void *)v17 + 141) = 0;
        }
        unint64_t v19 = (void *)*((void *)v17 + 139);
        if (v19)
        {
          free(v19);
          *((void *)v17 + 139) = 0;
        }
        uint64_t v20 = (void **)&v13[v15];
        free(v20[258]);
        free(v20[259]);
        uint64_t v13 = *(char **)v2;
        v15 += 5712;
      }
      while (*(void *)v2);
    }
    free(v13);
    unint64_t v21 = *(unsigned int *)(v2 + 8);
    if (v21 > 1 && *(void *)(v2 + 856))
    {
      unint64_t v22 = 0;
      uint64_t v23 = 288;
      do
      {
        uint64_t v24 = *(void *)(v2 + 856);
        if (*(void *)(v24 + v23 - 280))
        {
          sub_224AFAD94(v24 + v23 - 288);
          *(void *)(v24 + v23) = 0;
          unint64_t v21 = *(unsigned int *)(v2 + 8);
        }
        ++v22;
        v23 += 296;
      }
      while (v22 < v21);
      free(*(void **)(v2 + 856));
    }
    if (*(int *)(v2 + 60) >= 1)
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      do
      {
        sub_224AC7180(*(void *)(v2 + 48) + v25);
        ++v26;
        v25 += 80;
      }
      while (v26 < *(int *)(v2 + 60));
    }
    free(*(void **)(v2 + 48));
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = v2 + 52696;
    do
    {
      uint64_t v30 = (void *)(v2 + 52704 + v28);
      *uint64_t v30 = 0;
      v30[1] = 0;
      sub_224AF722C((uint64_t *)(v29 + v28));
      uint64_t v31 = v29 + v27;
      if (*(void *)(v29 + v27 - 2752))
      {
        sub_224AFAD94(v31 - 2760);
        *(void *)(v31 - 2472) = 0;
      }
      sub_224AF722C((uint64_t *)(v31 - 2456));
      sub_224AF722C((uint64_t *)(v31 - 2464));
      v28 += 24;
      v27 += 344;
    }
    while (v28 != 192);
    sub_224AF722C((uint64_t *)(v2 + 80));
    sub_224AF722C((uint64_t *)(v2 + 104));
    sub_224AF722C((uint64_t *)(v2 + 136));
    sub_224AF722C((uint64_t *)(v2 + 120));
    sub_224AF722C((uint64_t *)(v2 + 152));
    sub_224B11410(*(void *)(v2 + 72));
    sub_224B11410(*(void *)(v2 + 96));
    sub_224B11410(*(void *)(v2 + 49920));
    sub_224B11410(*(void *)(v2 + 49928));
    sub_224B11410(*(void *)(v2 + 52688));
    sub_224B11410(*(void *)(v2 + 63176));
    sub_224B11410(*(void *)(v2 + 63184));
    if (*a1)
    {
      free((void *)*a1);
      *a1 = 0;
    }
  }
}

char *sub_224B13C34()
{
  dword_26AACE160 = sub_224B114A0();
  sub_224B10290();
  sub_224B12EC0();

  return sub_224B13C6C();
}

char *sub_224B13C6C()
{
  uint64_t v0 = 0;
  int16x8x2_t v86 = (char *)&unk_26AA9BD83;
  int16x8x2_t v87 = (char *)&unk_26AA9BD21;
  int16x8x2_t v85 = (char *)&unk_224B21281;
  int16x8x2_t v84 = (char *)&unk_26AA9BD41;
  int16x8_t v82 = (char *)&unk_26AA98100;
  int16x8_t v83 = (char *)&unk_224B21280;
  int16x8_t v80 = (char *)&unk_26AAA95C0;
  int16x8_t v81 = (char *)&unk_26AAA4F80;
  uint64_t v78 = (char *)&unk_26AACD240;
  int16x8_t v79 = (char *)&unk_26AAA4080;
  uint64_t v76 = (char *)&unk_26AACCAC0;
  uint64_t v77 = (char *)&unk_26AAA3540;
  uint64_t v74 = (char *)&unk_26AAAB3C0;
  uint64_t v75 = (char *)&unk_26AAA3CC0;
  uint64_t v73 = (char *)&unk_26AA9BD20;
  BOOL v1 = (char *)&unk_224B21260;
  do
  {
    uint64_t v2 = 0;
    char v3 = 1;
    int v71 = v1;
    uint64_t v72 = v0;
    do
    {
      unint64_t v4 = 0;
      uint64_t v5 = (char *)&unk_26AAAB3C0 + 64 * v0 + 32 * v2;
      size_t v6 = (void *)((char *)&unk_26AA96E00 + 304 * v0 + 152 * v2);
      v6[5] = v5;
      v6[6] = (char *)&unk_26AAA3CC0 + 64 * v0 + 32 * v2;
      long long v7 = (char *)&unk_26AACCAC0 + 128 * v0 + 64 * v2;
      v6[13] = v7;
      v6[14] = (char *)&unk_26AAA3540 + 128 * v0 + 64 * v2;
      unint64_t v8 = (char *)&unk_26AACD240 + 256 * v0 + 128 * v2;
      v6[7] = v8;
      v6[8] = (char *)&unk_26AAA4080 + 256 * v0 + 128 * v2;
      uint64_t v9 = (char *)&unk_26AAA95C0 + 512 * v0 + 256 * v2;
      v6[15] = v9;
      v6[16] = (char *)&unk_26AAA4F80 + 512 * v0 + 256 * v2;
      v6[10] = (char *)&unk_26AA98100 + 1024 * v0 + 512 * v2;
      uint64_t v10 = (char *)&unk_26AAA93C0 + 32 * v0 + 16 * v2;
      uint64_t v11 = (char *)&unk_26AAA6DA0 + 128 * v0 + 64 * v2;
      *size_t v6 = v10;
      v6[1] = v11;
      size_t v12 = (char *)&unk_26AAA75A0 + 512 * v0 + 256 * v2;
      uint64_t v13 = (char *)&unk_26AA9BD20 + 2048 * v0 + 1024 * v2;
      v6[2] = v12;
      v6[3] = v13;
      v6[9] = (char *)&unk_224B21260 + 1024 * v0 + 512 * v2;
      int16x8_t v89 = v6 + 9;
      char v91 = v3;
      uint64_t v88 = v2 << 10;
      uint64_t v14 = (char *)&unk_224B24E60 + 1056 * v0 + 528 * v2;
      unint64_t v90 = (unint64_t)v13;
      uint64_t result = v13;
      uint64_t v92 = v2;
      unint64_t v16 = &v87[1024 * v2];
      do
      {
        unint64_t v93 = v4 + 1;
        int32x4_t v94 = result;
        size_t v17 = v14;
        memcpy(result, v14, v4 + 1);
        if (v4 <= 0x1E)
        {
          uint64_t v18 = 0;
          unint64_t v19 = &v17[v4];
          do
          {
            uint64_t v20 = &v19[v4 + v18];
            char v21 = v20[1];
            unint64_t v19 = v20 + 1;
            v16[v18++] = v21;
          }
          while (v4 + v18 != 31);
        }
        uint64_t result = v94 + 32;
        uint64_t v14 = &v17[v93];
        v16 += 33;
        ++v4;
      }
      while (v93 != 32);
      unint64_t v22 = 0;
      uint64_t v23 = &v86[v88];
      do
      {
        for (uint64_t i = 0; i != 32; i += 8)
          *v10++ = v23[i];
        v23 += 256;
        BOOL v25 = v22 >= 0x18;
        v22 += 8;
      }
      while (!v25);
      unint64_t v26 = 0;
      uint64_t v27 = v92 << 9;
      uint64_t v28 = &v85[512 * v92];
      do
      {
        for (uint64_t j = 0; j != 32; j += 4)
          *v5++ = v28[j];
        v28 += 128;
        BOOL v25 = v26 >= 0xC;
        v26 += 4;
      }
      while (!v25);
      unint64_t v30 = 0;
      uint64_t v31 = &v84[v88];
      do
      {
        for (uint64_t k = 0; k != 32; k += 4)
          *v11++ = v31[k];
        v31 += 128;
        BOOL v25 = v30 >= 0x1C;
        v30 += 4;
      }
      while (!v25);
      unint64_t v33 = 0;
      uint64_t v34 = &v83[v27];
      do
      {
        for (uint64_t m = 0; m != 32; m += 2)
          *v7++ = v34[m];
        v34 += 128;
        BOOL v25 = v33 >= 0xC;
        v33 += 4;
      }
      while (!v25);
      unint64_t v36 = 0;
      size_t v37 = &v71[v27];
      do
      {
        for (uint64_t n = 0; n != 32; n += 2)
          *v8++ = v37[n];
        v37 += 64;
        BOOL v25 = v36 >= 0xE;
        v36 += 2;
      }
      while (!v25);
      unint64_t v39 = 0;
      uint64_t v40 = &v73[v88];
      do
      {
        for (iuint64_t i = 0; ii != 32; ii += 2)
          *v12++ = v40[ii];
        v40 += 64;
        BOOL v25 = v39 >= 0x1E;
        v39 += 2;
      }
      while (!v25);
      unint64_t v42 = 0;
      int v43 = &v71[v27];
      do
      {
        for (juint64_t j = 0; jj != 32; ++jj)
          v9[jj] = v43[jj];
        v9 += 32;
        v43 += 64;
        BOOL v25 = v42 >= 0xE;
        v42 += 2;
      }
      while (!v25);
      uint64_t v45 = 0;
      uint64_t v46 = &v74[32 * v92];
      uint64_t v47 = &v75[32 * v92];
      do
      {
        uint64_t v48 = 0;
        int v49 = v47;
        do
        {
          *int v49 = v46[v48];
          v49 += 4;
          ++v48;
        }
        while (v48 != 8);
        ++v45;
        v46 += 8;
        ++v47;
      }
      while (v45 != 4);
      uint64_t v50 = 0;
      uint64_t v51 = &v76[64 * v92];
      uint64_t v52 = &v77[64 * v92];
      do
      {
        uint64_t v53 = 0;
        unsigned int v54 = v52;
        do
        {
          *unsigned int v54 = v51[v53];
          v54 += 4;
          ++v53;
        }
        while (v53 != 16);
        ++v50;
        v51 += 16;
        ++v52;
      }
      while (v50 != 4);
      uint64_t v55 = 0;
      int16x8_t v56 = &v78[128 * v92];
      uint64_t v57 = &v79[128 * v92];
      do
      {
        uint64_t v58 = 0;
        int v59 = v57;
        do
        {
          *int v59 = v56[v58];
          v59 += 8;
          ++v58;
        }
        while (v58 != 16);
        ++v55;
        v56 += 16;
        ++v57;
      }
      while (v55 != 8);
      uint64_t v60 = 0;
      uint64_t v61 = &v80[256 * v92];
      uint64_t v62 = &v81[256 * v92];
      do
      {
        uint64_t v63 = 0;
        char v64 = v62;
        do
        {
          *char v64 = v61[v63];
          v64 += 8;
          ++v63;
        }
        while (v63 != 32);
        ++v60;
        v61 += 32;
        ++v62;
      }
      while (v60 != 8);
      uint64_t v65 = 0;
      int v66 = &v71[v27];
      int v67 = &v82[v27];
      do
      {
        uint64_t v68 = 0;
        int v69 = v67;
        do
        {
          *int v69 = v66[v68];
          v69 += 16;
          ++v68;
        }
        while (v68 != 32);
        ++v65;
        v66 += 32;
        ++v67;
      }
      while (v65 != 16);
      char v3 = 0;
      uint64_t v0 = v72;
      char v70 = (char *)&unk_26AA96E00 + 304 * v72 + 152 * v92;
      *((void *)v70 + 4) = v90;
      *(int64x2_t *)(v70 + 88) = vdupq_n_s64(v90);
      *(_OWORD *)(v70 + 136) = *v89;
      uint64_t v2 = 1;
    }
    while ((v91 & 1) != 0);
    uint64_t v0 = v72 + 1;
    v86 += 2048;
    v87 += 2048;
    v84 += 2048;
    v85 += 1024;
    v83 += 1024;
    BOOL v1 = v71 + 1024;
    v73 += 2048;
    v74 += 64;
    v75 += 64;
    v76 += 128;
    v77 += 128;
    v78 += 256;
    v79 += 256;
    v80 += 512;
    v81 += 512;
    v82 += 1024;
  }
  while (v72 != 14);
  return result;
}

void *sub_224B142D8(void *result)
{
  *uint64_t result = sub_224AFA6B0;
  result[1] = sub_224AFA6A4;
  result[2] = sub_224AFA698;
  result[3] = sub_224AFA3F0;
  result[4] = sub_224AF9CB8;
  result[5] = sub_224AF9C78;
  result[6] = sub_224AF9C38;
  result[7] = sub_224AF9230;
  if (dword_26AACE160)
  {
    *uint64_t result = sub_224A9BA9C;
    result[1] = sub_224A9BF6C;
    result[2] = sub_224A9C1C0;
    result[3] = sub_224A9BC98;
    result[4] = sub_224AF9030;
    result[5] = sub_224AF8DF0;
    result[6] = sub_224AF8BB0;
    result[7] = sub_224AF8974;
  }
  return result;
}

uint64_t sub_224B143E8(uint64_t a1)
{
  unsigned int v10 = 0;
  size_t v9 = 4;
  if (!sysctlbyname("hw.logicalcpu", &v10, &v9, 0, 0)) {
    return v10;
  }
  sub_224B11AE8(a1, (uint64_t)"Unable to detect thread count, defaulting to single-threaded mode\n", v2, v3, v4, v5, v6, v7, v9);
  return 1;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
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

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE79F8](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A30](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x270EE7AF0](desc, extensionKey);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x270EE7C18](sbuf);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FC0](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0E0](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0F0](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA110](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x270EE8230]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x270F06698]();
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x270F066B8]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x270F066C0]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x270F06800]();
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
}

uint64_t VTTileDecoderSessionEmitDecodedTile()
{
  return MEMORY[0x270F06848]();
}

uint64_t VTTileDecoderSessionSetTileDecodeRequirements()
{
  return MEMORY[0x270F06850]();
}

uint64_t VTVideoDecoderGetCMBaseObject()
{
  return MEMORY[0x270F06870]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x270F06878]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
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

void std::terminate(void)
{
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

void operator delete()
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

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
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

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA70](a1, a2, a3);
}