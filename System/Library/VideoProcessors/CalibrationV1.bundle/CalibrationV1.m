float *sub_262E6C854(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9)
{
  float *v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  float *v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  unsigned char *v37;
  unsigned int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  __int16 *v63;
  uint64_t v64;
  char v65;
  __int16 v66;
  char v67;
  int v68;
  unsigned int v69;
  uint64_t v70;
  int v71;
  int *v72;
  int v73;
  int v74;
  int v75;
  __int16 *v76;
  int v77;
  int v78;
  __int16 *v79;
  int v80;
  __int16 *v81;
  char v82;
  __int16 v83;
  char v84;
  BOOL v85;
  __int16 *v86;
  __int16 *v87;
  int v88;
  char v89;
  __int16 v90;
  char v91;
  int v92;
  __int16 *v93;
  int v94;
  char v95;
  __int16 v96;
  char v97;
  int v99;
  int v100;
  int v101;
  int v102;
  _DWORD v104[6];
  uint64_t v105;

  v105 = *MEMORY[0x263EF8340];
  v17 = (float *)malloc_type_malloc(0x18uLL, 0x10200405AF6BDC9uLL);
  if (a2 < 0) {
    sub_262E87C34();
  }
  if (a3 < 0) {
    sub_262E87C60();
  }
  if (a4 < 0) {
    sub_262E87C8C();
  }
  if (a5 < 0) {
    sub_262E87CB8();
  }
  if (a6 < 0) {
    sub_262E87CE4();
  }
  if (a7 < 0) {
    sub_262E87D10();
  }
  v18 = a2 * a1;
  v19 = (a2 * a1 / 100);
  v20 = a3 * a1;
  v21 = a3 * a1 / 100;
  v104[0] = v19;
  v104[1] = v21;
  v22 = a4 * a1;
  v23 = a4 * a1 / 100;
  v24 = a5 * a1;
  v25 = a5 * a1 / 100;
  v104[2] = v23;
  v104[3] = v25;
  v26 = a6 * a1;
  v27 = a6 * a1 / 100;
  v28 = a7 * a1;
  v29 = a7 * a1 / 100;
  v104[4] = v27;
  v104[5] = v29;
  v30 = v21 + v19 + v23 + v25;
  if ((v30 + v27 + v29 < 0) ^ __OFADD__(v30, v27 + v29) | (v30 + v27 + v29 == 0)) {
    sub_262E87D3C();
  }
  v31 = v17;
  v101 = v24;
  v102 = v22;
  v99 = v28;
  v100 = v26;
  *((_DWORD *)v17 + 2) = v30 + v27 + v29;
  v32 = v30 + v27 + v29;
  *(void *)v17 = malloc_type_malloc(3 * v32, 0x100004033FC2DF1uLL);
  *((_DWORD *)v31 + 3) = a8;
  if (v18 < 100)
  {
    v38 = 0;
    v36 = v32;
  }
  else
  {
    v33 = 0;
    v34 = 0;
    v35 = 1;
    v36 = v32;
    do
    {
      if (v34 >= *((int *)v31 + 2)) {
        sub_262E87D68();
      }
      ++v34;
      v37 = (unsigned char *)(*(void *)v31 + v35);
      *(v37 - 1) = 0;
      *v37 = v33 / (int)v19;
      v37[1] = -1;
      v35 += 3;
      v33 += 255;
    }
    while (v19 != v34);
    v38 = v18 / 100;
  }
  if (v20 >= 100)
  {
    v39 = 0;
    v40 = 0;
    v41 = v38;
    v42 = 3 * v38;
    do
    {
      if (v41 + v40 >= *((int *)v31 + 2)) {
        sub_262E87D68();
      }
      v43 = *(void *)v31 + v42;
      *(_WORD *)v43 = -256;
      *(unsigned char *)(v43 + 2) = ~(v39 / v21);
      v42 += 3;
      ++v40;
      v39 += 255;
    }
    while (v21 != v40);
    v38 = v41 + v40;
  }
  if (v102 >= 100)
  {
    v44 = 0;
    v45 = 0;
    v46 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v45)) {
        sub_262E87D68();
      }
      v47 = *(void *)v31 + v46;
      *(unsigned char *)v47 = v44 / v23;
      *(_WORD *)(v47 + 1) = 255;
      ++v45;
      v46 += 3;
      v44 += 255;
    }
    while (v23 != v45);
    v38 += v45;
  }
  if (v101 >= 100)
  {
    v48 = 0;
    v49 = 0;
    v50 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v49)) {
        sub_262E87D68();
      }
      v51 = *(void *)v31 + v50;
      *(unsigned char *)v51 = -1;
      *(_WORD *)(v51 + 1) = ~(v48 / v25);
      ++v49;
      v50 += 3;
      v48 += 255;
    }
    while (v25 != v49);
    v38 += v49;
  }
  if (v100 >= 100)
  {
    v52 = 0;
    v53 = 0;
    v54 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v53)) {
        sub_262E87D68();
      }
      v55 = *(void *)v31 + v54;
      *(_WORD *)v55 = 255;
      *(unsigned char *)(v55 + 2) = v52 / v27;
      ++v53;
      v54 += 3;
      v52 += 255;
    }
    while (v27 != v53);
    v38 += v53;
  }
  if (v99 >= 100)
  {
    v56 = 0;
    v57 = 0;
    v58 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v57)) {
        sub_262E87D68();
      }
      v59 = *(void *)v31 + v58;
      *(unsigned char *)v59 = ~(v56 / v29);
      *(_WORD *)(v59 + 1) = -256;
      ++v57;
      v58 += 3;
      v56 += 255;
    }
    while (v29 != v57);
  }
  if (a8 < 0 && v36 > 1)
  {
    v60 = 0;
    v61 = v36 >> 1;
    v62 = v19 + v21 + v23 + v25 + v27 + v29 - 1;
    do
    {
      v63 = (__int16 *)(*(void *)v31 + v60);
      v64 = *(void *)v31 + 3 * v62;
      v65 = *((unsigned char *)v63 + 2);
      v66 = *v63;
      v67 = *(unsigned char *)(v64 + 2);
      *v63 = *(_WORD *)v64;
      *((unsigned char *)v63 + 2) = v67;
      *(_WORD *)v64 = v66;
      *(unsigned char *)(v64 + 2) = v65;
      --v62;
      v60 += 3;
      --v61;
    }
    while (v61);
  }
  if (a8 >= 0) {
    v68 = a8;
  }
  else {
    v68 = -a8;
  }
  v69 = v68 - 1;
  LODWORD(v70) = 6 - v68;
  if (a8 >= 0) {
    v70 = v69;
  }
  else {
    v70 = v70;
  }
  if ((int)v70 >= 1)
  {
    v71 = 0;
    v72 = v104;
    do
    {
      v73 = v71;
      v75 = *v72++;
      v74 = v75;
      v71 += v75;
      --v70;
    }
    while (v70);
    if (v71 > 0)
    {
      v76 = *(__int16 **)v31;
      v77 = v36 - 1;
      if (v71 != 1)
      {
        v78 = 0;
        v79 = (__int16 *)((char *)v76 + 3 * (v71 - 1));
        v80 = v73 + v74 - 2;
        v81 = *(__int16 **)v31;
        do
        {
          v82 = *((unsigned char *)v81 + 2);
          v83 = *v81;
          v84 = *((unsigned char *)v79 + 2);
          *v81 = *v79;
          *((unsigned char *)v81 + 2) = v84;
          *v79 = v83;
          *((unsigned char *)v79 + 2) = v82;
          v81 = (__int16 *)((char *)v81 + 3);
          v79 = (__int16 *)((char *)v79 - 3);
          v85 = ++v78 < v80--;
        }
        while (v85);
      }
      if (v71 < v77)
      {
        v86 = (__int16 *)((char *)v76 + 3 * v77);
        v87 = (__int16 *)((char *)v76 + 3 * v71);
        v88 = v19 + v21 + v23 + v25 + v27 + v29 - 2;
        do
        {
          v89 = *((unsigned char *)v87 + 2);
          v90 = *v87;
          v91 = *((unsigned char *)v86 + 2);
          *v87 = *v86;
          *((unsigned char *)v87 + 2) = v91;
          *v86 = v90;
          *((unsigned char *)v86 + 2) = v89;
          v87 = (__int16 *)((char *)v87 + 3);
          v86 = (__int16 *)((char *)v86 - 3);
          v85 = ++v71 < v88--;
        }
        while (v85);
      }
      if (v36 >= 2)
      {
        v92 = 0;
        v93 = (__int16 *)((char *)v76 + 3 * (v36 - 1));
        v94 = v19 + v21 + v23 + v25 + v27 + v29 - 2;
        do
        {
          v95 = *((unsigned char *)v76 + 2);
          v96 = *v76;
          v97 = *((unsigned char *)v93 + 2);
          *v76 = *v93;
          *((unsigned char *)v76 + 2) = v97;
          *v93 = v96;
          *((unsigned char *)v93 + 2) = v95;
          v76 = (__int16 *)((char *)v76 + 3);
          v93 = (__int16 *)((char *)v93 - 3);
          v85 = ++v92 < v94--;
        }
        while (v85);
      }
    }
  }
  v31[4] = a9;
  return v31;
}

void sub_262E6CE84(void ***a1)
{
  if (a1)
  {
    free(**a1);
    free(*a1);
    *a1 = 0;
  }
}

uint64_t sub_262E6CEC4(uint64_t a1, int a2, float a3, double a4, double a5, float a6)
{
  if (a3 < 0.0 || a3 > 1.0) {
    sub_262E87D94();
  }
  int v7 = *(_DWORD *)(a1 + 8);
  float v8 = *(float *)(a1 + 16);
  if (v8 != 0.0)
  {
    float v9 = v8 / 6.28318531;
    a3 = v9 + a3;
    float v10 = 1.0;
    if (a3 < 0.0)
    {
LABEL_9:
      a3 = a3 + v10;
      goto LABEL_10;
    }
    if (a3 > 1.0)
    {
      float v10 = -1.0;
      goto LABEL_9;
    }
  }
LABEL_10:
  float v11 = a3 * (float)(v7 - 1);
  int v12 = (int)v11;
  int v13 = ((int)v11 + 1) % v7;
  *(float *)&unsigned int v14 = (float)(int)v11;
  float v15 = v11 - *(float *)&v14;
  LOBYTE(v14) = *(unsigned char *)(*(void *)a1 + 3 * v12 + a2);
  LOBYTE(a6) = *(unsigned char *)(*(void *)a1 + 3 * v13 + a2);
  return (int)(float)((float)((float)(v15 * (float)((float)LODWORD(a6) / 255.0))
                                          + (float)((float)(1.0 - v15) * (float)((float)v14 / 255.0)))
                                  * 255.0);
}

uint64_t sub_262E6CFAC(uint64_t result, int a2, int a3, float *a4, int a5, int a6, uint64_t a7, int a8, double a9, double a10, double a11, float a12, int a13)
{
  if (a3 >= 1)
  {
    int v13 = a4;
    uint64_t v14 = result;
    uint64_t v15 = 0;
    uint64_t v16 = a6;
    float v17 = 1.1755e-38;
    float v18 = 3.4028e38;
    v19 = a4;
    uint64_t v20 = a2;
    do
    {
      uint64_t v21 = a2;
      v22 = v19;
      if (a2 >= 1)
      {
        do
        {
          *(float *)&a10 = *v22;
          if (*v22 < v18) {
            float v18 = *v22;
          }
          if (*(float *)&a10 > v17) {
            float v17 = *v22;
          }
          v22 = (float *)((char *)v22 + a6);
          --v21;
        }
        while (v21);
      }
      ++v15;
      v19 = (float *)((char *)v19 + a5);
    }
    while (v15 != a3);
    uint64_t v23 = 0;
    float v24 = v17 - v18;
    uint64_t v35 = a8;
    v25 = (unsigned char *)(a7 + 1);
    uint64_t v36 = a3;
    uint64_t v37 = a5;
    do
    {
      v26 = v13;
      v27 = v25;
      if (a2 >= 1)
      {
        do
        {
          float v28 = fmaxf(fminf((float)(*v26 - v18) / v24, 1.0), 0.0);
          *(v27 - 1) = sub_262E6CEC4(v14, 0, v28, a10, a11, a12);
          unsigned char *v27 = sub_262E6CEC4(v14, 1, v28, v29, v30, v31);
          result = sub_262E6CEC4(v14, 2, v28, v32, v33, v34);
          v27[1] = result;
          v27[2] = -1;
          v27 += a13;
          v26 = (float *)((char *)v26 + v16);
          --v20;
        }
        while (v20);
      }
      ++v23;
      uint64_t v20 = a2;
      v25 += v35;
      int v13 = (float *)((char *)v13 + v37);
    }
    while (v23 != v36);
  }
  return result;
}

FILE *sub_262E6D3FC(const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v7 = objc_msgSend_stringWithFormat_(NSString, a2, @"%s", a4, a5, a6, a1);
  int v13 = objc_msgSend_stringByDeletingLastPathComponent(v7, v8, v9, v10, v11, v12);
  v19 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v14, v15, v16, v17, v18);
  id v26 = 0;
  char DirectoryAtPath_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v19, v20, (uint64_t)v13, 1, 0, (uint64_t)&v26);
  id v22 = v26;
  uint64_t v23 = v22;
  if (DirectoryAtPath_withIntermediateDirectories_attributes_error)
  {
    float v24 = fopen(a1, "wb");
  }
  else
  {
    NSLog(&cfstr_FailedToCreate.isa, v13, v22);
    float v24 = 0;
  }

  return v24;
}

FILE *sub_262E6D988(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6)
{
  v6 = (unsigned char *)a4;
  unsigned int v7 = a3;
  int v8 = (int)a2;
  result = sub_262E6D3FC(a5, a2, a3, a4, (uint64_t)a5, a6);
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = malloc_type_malloc(3 * a1, 0x208AAB68uLL);
    if (v12)
    {
      int v13 = v12;
      fprintf(v11, "P6 %u %u 255\n", a1, v8);
      if (v8)
      {
        for (int i = 0; i != v8; ++i)
        {
          unsigned int v15 = a1;
          uint64_t v16 = v13;
          for (j = v6; v15; --v15)
          {
            *uint64_t v16 = *j;
            v16[1] = j[1];
            v16[2] = j[2];
            j += 4;
            v16 += 3;
          }
          fwrite(v13, 3uLL, a1, v11);
          v6 += v7;
        }
      }
      free(v13);
    }
    return (FILE *)fclose(v11);
  }
  return result;
}

uint64_t sub_262E71D0C(uint64_t result, unsigned int a2, _DWORD *a3, _DWORD *a4, unsigned int a5, unsigned int a6)
{
  if ((a5 | result | a2))
  {
    int v6 = 1;
  }
  else
  {
    int v6 = 1;
    unsigned int v7 = result;
    do
    {
      char v8 = a5;
      a5 >>= 1;
      result = v7 >> 1;
      char v9 = a2;
      a2 >>= 1;
      v6 *= 2;
      if ((v8 & 2) != 0) {
        break;
      }
      if ((v7 & 2) != 0) {
        break;
      }
      v7 >>= 1;
    }
    while ((v9 & 2) == 0);
  }
  if ((a6 | result))
  {
    int v10 = 1;
  }
  else
  {
    int v10 = 1;
    unsigned int v11 = a6;
    unsigned int v12 = result;
    do
    {
      a6 = v11 >> 1;
      result = v12 >> 1;
      v10 *= 2;
      char v13 = v11 | v12;
      v11 >>= 1;
      v12 >>= 1;
    }
    while ((v13 & 2) == 0);
  }
  if (a2 >= result) {
    unsigned int v14 = result;
  }
  else {
    unsigned int v14 = a2;
  }
  if (v14)
  {
    if (v14 + 1 > 2) {
      int v15 = v14 + 1;
    }
    else {
      int v15 = 2;
    }
    unsigned int v16 = 1;
    int v17 = 1;
    int v18 = 1;
    do
    {
      if (!(a5 % v16))
      {
        int v19 = 1;
        for (unsigned int i = a6; ; i /= 7u)
        {
          while (1)
          {
            while (1)
            {
              while ((i & 1) == 0 && 2 * v16 * v19 <= result)
              {
                i >>= 1;
                v19 *= 2;
              }
              if (i != 3 * (i / 3) || 3 * v16 * v19 > result) {
                break;
              }
              v19 *= 3;
              i /= 3u;
            }
            if (i != 5 * (i / 5) || 5 * v16 * v19 > result) {
              break;
            }
            v19 *= 5;
            i /= 5u;
          }
          if (i % 7 || 7 * v16 * v19 > result) {
            break;
          }
          v19 *= 7;
        }
        unsigned int v24 = v17 * v18;
        if (v19 * v16 >= v17 * v18) {
          int v18 = v16;
        }
        if (v19 * v16 >= v24) {
          int v17 = v19;
        }
      }
      ++v16;
    }
    while (v16 != v15);
  }
  else
  {
    int v18 = 1;
    int v17 = 1;
  }
  *a3 = v18 * v6;
  *a4 = v17 * v10;
  return result;
}

double *sub_262E71EF8(uint64_t a1, uint64_t a2, int a3, double *a4, double *a5, uint64_t a6, double *a7, uint64_t a8)
{
  if (!a1 || !a2 || a3 <= 0 || !a4 || !a5 || !a6 || !a7 || !a8) {
    return (double *)FigDebugAssert3();
  }
  double v190 = 0.0;
  long long v189 = 0u;
  long long v188 = 0u;
  long long v187 = 0u;
  long long v186 = 0u;
  long long v185 = 0u;
  long long v184 = 0u;
  long long v183 = 0u;
  long long v182 = 0u;
  long long v181 = 0u;
  long long v180 = 0u;
  long long v179 = 0u;
  long long v178 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  long long v15 = *(_OWORD *)(a6 + 144);
  v172[8] = *(_OWORD *)(a6 + 128);
  v172[9] = v15;
  v172[10] = *(_OWORD *)(a6 + 160);
  uint64_t v173 = *(void *)(a6 + 176);
  long long v16 = *(_OWORD *)(a6 + 80);
  v172[4] = *(_OWORD *)(a6 + 64);
  v172[5] = v16;
  long long v17 = *(_OWORD *)(a6 + 112);
  v172[6] = *(_OWORD *)(a6 + 96);
  v172[7] = v17;
  long long v18 = *(_OWORD *)(a6 + 16);
  float64x2_t v171 = 0u;
  v172[0] = *(_OWORD *)a6;
  long long v19 = *(_OWORD *)(a6 + 32);
  long long v20 = *(_OWORD *)(a6 + 48);
  v172[1] = v18;
  v172[2] = v19;
  v172[3] = v20;
  result = sub_262E82A44((double *)v172, 1, (uint64_t)&v174);
  double v22 = a4[1] * *a4;
  double v163 = a4[12];
  double v149 = a4[4] + v22 * v163;
  double v162 = a4[13];
  double v23 = a4[5] + v22 * v162;
  double v161 = a4[14];
  double v24 = a4[6] + v22 * v161;
  double v160 = a4[15];
  double v25 = a4[7] + v22 * v160;
  double v159 = a4[16];
  double v26 = a4[8] + v22 * v159;
  double v158 = a4[17];
  double v27 = a4[9] + v22 * v158;
  double v157 = a4[18];
  double v28 = a4[10] + v22 * v157;
  double v156 = a4[19];
  double v29 = a4[11] + v22 * v156;
  double v30 = a5[1] * *a5;
  double v155 = a5[12];
  double v142 = a5[4] + v30 * v155;
  double v154 = a5[13];
  double v153 = a5[14];
  double v152 = a5[15];
  double v151 = a5[16];
  double v150 = a5[17];
  double v135 = a5[19];
  double v136 = a5[18];
  double v139 = a5[7] + v30 * v152;
  double v140 = a5[6] + v30 * v153;
  double v147 = v25;
  double v132 = v25 * 6.0;
  double v146 = v26;
  double v137 = a5[9] + v30 * v150;
  double v138 = a5[8] + v30 * v151;
  double v131 = v26 * 8.0;
  double v145 = v27;
  double v130 = v27 * 10.0;
  double v144 = v28;
  double v133 = a5[11] + v30 * v135;
  double v134 = a5[10] + v30 * v136;
  double v129 = v28 * 12.0;
  double v143 = v29;
  double v128 = v29 * 14.0;
  uint64_t v31 = a3;
  double v32 = (double *)(a1 + 8);
  double v33 = (double *)(a2 + 8);
  double v164 = *a4;
  double v127 = -(v164 * v164);
  double v170 = *a5;
  double v148 = v23;
  double v125 = v23 + v23;
  double v126 = -(v170 * v170);
  double v141 = a5[5] + v30 * v154;
  double v169 = a4[2];
  double v124 = -v169;
  double v168 = a4[3];
  double v167 = a5[2];
  double v122 = -v167;
  double v123 = -v168;
  double v166 = a5[3];
  double v121 = -v166;
  double v34 = 0.0;
  double v35 = 0.0;
  double v36 = 0.0;
  double v37 = 0.0;
  double v38 = 0.0;
  double v39 = 0.0;
  double v40 = 0.0;
  double v41 = 0.0;
  double v42 = 0.0;
  do
  {
    double v165 = v42;
    double v43 = *(v32 - 1);
    double v44 = *(v33 - 1);
    double v45 = *v32 - v168;
    double v46 = sqrt(v45 * v45 + (v43 - v169) * (v43 - v169));
    double v47 = v164 * v46;
    double v48 = *v33 - v166;
    double v49 = v170 * sqrt(v48 * v48 + (v44 - v167) * (v44 - v167));
    double v50 = v47 * (v47 * v47);
    double v51 = v47 * (v47 * v50);
    double v52 = v47 * (v47 * v51);
    double v53 = v47 * (v47 * v52);
    double v54 = v47 * (v47 * v53);
    double v55 = v47 * (v47 * v54);
    double v56 = v49 * (v49 * v49);
    double v57 = v149
        + v148 * (v47 * v47)
        + v24 * (v47 * v50)
        + v147 * (v47 * v51)
        + v146 * (v47 * v52)
        + v145 * (v47 * v53)
        + v144 * (v47 * v54)
        + v143 * (v47 * v55);
    double v58 = v127 * (v43 - v169) / (v164 * v46);
    double v59 = v163
        + v162 * (v47 * v47)
        + v161 * (v47 * v50)
        + v160 * (v47 * v51)
        + v159 * (v47 * v52)
        + v158 * (v47 * v53)
        + v157 * (v47 * v54)
        + v156 * (v47 * v55);
    double v60 = v127 * v45 / (v164 * v46);
    double v61 = v49 * (v49 * v56);
    double v62 = v24 * 4.0 * v50 + v125 * (v164 * v46) + v132 * v51 + v131 * v52;
    double v63 = v49 * (v49 * v61);
    double v64 = v62 + v130 * v53 + v129 * v54 + v128 * v55;
    double v65 = v49 * (v49 * v63);
    double v66 = v49 * (v49 * v65);
    double v67 = v49 * (v49 * v66);
    double v68 = v142
        + v141 * (v49 * v49)
        + v140 * (v49 * v56)
        + v139 * (v49 * v61)
        + v138 * (v49 * v63)
        + v137 * (v49 * v65)
        + v134 * (v49 * v66)
        + v133 * (v49 * v67);
    double v69 = v155
        + v154 * (v49 * v49)
        + v153 * (v49 * v56)
        + v152 * (v49 * v61)
        + v151 * (v49 * v63)
        + v150 * (v49 * v65)
        + v136 * (v49 * v66)
        + v135 * (v49 * v67);
    double v70 = v126 * v48 / v49;
    double v71 = v140 * 4.0 * v56 + (v141 + v141) * v49 + v139 * 6.0 * v61;
    double v72 = 1.0 / (v57 / 100.0 + 1.0);
    double v73 = 1.0 - v72;
    double v74 = v71 + v138 * 8.0 * v63 + v137 * 10.0 * v65 + v134 * 12.0 * v66 + v133 * 14.0 * v67;
    double v75 = v169 * (1.0 - v72) + v72 * v43;
    double v76 = v168 * (1.0 - v72) + v72 * *v32;
    double v77 = 1.0 / (v68 / 100.0 + 1.0);
    double v78 = v58 * v64;
    double v79 = v60 * v64;
    double v80 = v126 * (v44 - v167) / v49 * v74;
    double v81 = 1.0 - v77;
    double v82 = -100.0 / ((v57 + 100.0) * (v57 + 100.0));
    double v83 = v164 * v59 * v82;
    double v84 = v78 * v82;
    double v85 = v79 * v82;
    double v86 = v167 * (1.0 - v77) + v77 * v44;
    double v87 = v170 * v69;
    double v88 = -100.0 / ((v68 + 100.0) * (v68 + 100.0));
    double v89 = v166 * (1.0 - v77) + v77 * *v33;
    double v90 = v87 * v88;
    double v91 = v80 * v88;
    double v92 = v70 * v74 * v88;
    double v93 = v83 * v124 + v83 * v43;
    double v94 = v73 + v124 * v84 + v84 * v43;
    double v95 = v85 * v124 + v85 * v43;
    double v96 = v73 + v123 * v85 + v85 * *v32;
    double v97 = v90 * v122 + v90 * v44;
    double v98 = v90 * v121 + v90 * *v33;
    double v99 = v81 + v122 * v91 + v91 * v44;
    double v100 = v91 * v121 + v91 * *v33;
    double v101 = *(double *)&v177 + *((double *)&v175 + 1) * v89 + v86 * *(double *)&v174;
    double v102 = *((double *)&v177 + 1) + *(double *)&v176 * v89 + v86 * *((double *)&v174 + 1);
    double v103 = (v83 * v123 + v83 * *v32) * v102 + v101 * v93;
    double v104 = (v84 * v123 + v84 * *v32) * v102 + v101 * v94;
    double v105 = *(double *)&v175 + *((double *)&v174 + 1) * v76 + *(double *)&v174 * v75;
    double v106 = *((double *)&v176 + 1) + *(double *)&v176 * v76 + *((double *)&v175 + 1) * v75;
    double v107 = v96 * v102 + v101 * v95;
    double v108 = *(double *)&v178 + *((double *)&v177 + 1) * v76 + *(double *)&v177 * v75 + v89 * v106 + v86 * v105;
    double v109 = *(double *)&v182 * v76 + *((double *)&v181 + 1) * v75;
    double v110 = v98 * v106 + v97 * v105;
    double v111 = v100 * v106 + v99 * v105;
    double v112 = *((double *)&v183 + 1) * v76 + *(double *)&v183 * v75;
    double v113 = *(double *)&v185 * v76 + *((double *)&v184 + 1) * v75;
    double v114 = (v81 + v121 * v92 + v92 * *v33) * v106 + (v92 * v122 + v92 * v44) * v105;
    double v115 = *((double *)&v186 + 1) * v76 + *(double *)&v186 * v75;
    double v116 = v76 * *(double *)&v188 + *((double *)&v187 + 1) * v75;
    double v117 = v76 * *((double *)&v189 + 1) + *(double *)&v189 * v75;
    v118.f64[0] = *(double *)&v181 + v76 * *((double *)&v180 + 1) + *(double *)&v180 * v75;
    v118.f64[1] = v103;
    double v119 = sqrt(v108 * v108 + 0.00000337320636);
    double v120 = v108 / v119;
    double v34 = v34 + v119;
    double v35 = v35
        + (*((double *)&v185 + 1) + v113 + v89 * (*(double *)&v184 + v112) + v86 * (*((double *)&v182 + 1) + v109))
        * v120;
    double v36 = v36 + (*((double *)&v179 + 1) + *(double *)&v179 * v89 + v86 * *((double *)&v178 + 1)) * v120;
    double v37 = v37 + v120 * (v89 * (*((double *)&v188 + 1) + v116) + v86 * (*(double *)&v187 + v115) + v190 + v117);
    float64x2_t v171 = vaddq_f64(v171, vmulq_n_f64(v118, v120));
    double v38 = v38 + v104 * v120;
    double v39 = v39 + v107 * v120;
    double v40 = v40 + v110 * v120;
    double v41 = v41 + v111 * v120;
    double v42 = v165 + v114 * v120;
    v32 += 2;
    v33 += 2;
    --v31;
  }
  while (v31);
  *a7 = v34 / (double)a3;
  *(double *)a8 = v35 / (double)a3;
  *(double *)(a8 + 8) = v36 / (double)a3;
  *(double *)(a8 + 16) = v37 / (double)a3;
  *(float64x2_t *)(a8 + 24) = vdivq_f64(v171, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a3), 0));
  *(double *)(a8 + 40) = v38 / (double)a3;
  *(double *)(a8 + 48) = v39 / (double)a3;
  *(double *)(a8 + 56) = v40 / (double)a3;
  *(double *)(a8 + 64) = v41 / (double)a3;
  *(double *)(a8 + 72) = v42 / (double)a3;
  return result;
}

double *sub_262E72AC4(uint64_t a1, uint64_t a2, int a3, double *a4, double *a5, uint64_t a6, double *a7)
{
  if (!a1 || !a2 || a3 <= 0 || !a4 || !a5 || !a6 || !a7) {
    return (double *)FigDebugAssert3();
  }
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
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
  long long v13 = *(_OWORD *)(a6 + 144);
  v43[8] = *(_OWORD *)(a6 + 128);
  v43[9] = v13;
  v43[10] = *(_OWORD *)(a6 + 160);
  uint64_t v44 = *(void *)(a6 + 176);
  long long v14 = *(_OWORD *)(a6 + 80);
  v43[4] = *(_OWORD *)(a6 + 64);
  v43[5] = v14;
  long long v15 = *(_OWORD *)(a6 + 112);
  v43[6] = *(_OWORD *)(a6 + 96);
  v43[7] = v15;
  long long v16 = *(_OWORD *)(a6 + 16);
  v43[0] = *(_OWORD *)a6;
  v43[1] = v16;
  long long v17 = *(_OWORD *)(a6 + 48);
  v43[2] = *(_OWORD *)(a6 + 32);
  v43[3] = v17;
  result = sub_262E82A44((double *)v43, 0, (uint64_t)&v45);
  double v19 = a4[2];
  double v20 = a4[3];
  double v21 = a5[2];
  double v22 = a5[3];
  double v23 = a5[1];
  uint64_t v25 = a3;
  double v26 = (double *)(a1 + 8);
  double v27 = (double *)(a2 + 8);
  double v28 = 0.0;
  do
  {
    double v29 = *(v26 - 1);
    double v30 = *(v27 - 1);
    double v31 = *a4 * sqrt((*v26 - v20) * (*v26 - v20) + (v29 - v19) * (v29 - v19));
    double v32 = v31 * (v31 * (v31 * v31));
    double v33 = v31 * (v31 * v32);
    double v34 = *a5 * sqrt((*v27 - v22) * (*v27 - v22) + (v30 - v21) * (v30 - v21));
    double v24 = a4[1] * *a4;
    double v35 = a4[4]
        + v24 * a4[12]
        + (a4[5] + v24 * a4[13]) * (v31 * v31)
        + (a4[6] + v24 * a4[14]) * v32
        + (a4[7] + v24 * a4[15]) * v33
        + (a4[8] + v24 * a4[16]) * (v31 * (v31 * v33))
        + (a4[9] + v24 * a4[17]) * (v31 * (v31 * (v31 * (v31 * v33))))
        + (a4[10] + v24 * a4[18]) * (v31 * (v31 * (v31 * (v31 * (v31 * (v31 * v33))))))
        + (a4[11] + v24 * a4[19]) * (v31 * (v31 * (v31 * (v31 * (v31 * (v31 * (v31 * (v31 * v33))))))));
    double v36 = v34 * (v34 * (v34 * v34));
    double v37 = a5[4] + v23 * *a5 * a5[12] + (a5[5] + v23 * *a5 * a5[13]) * (v34 * v34) + (a5[6] + v23 * *a5 * a5[14]) * v36;
    double v38 = v34 * (v34 * v36);
    double v39 = 1.0 / (v35 / 100.0 + 1.0);
    double v40 = 1.0
        / ((v37
          + (a5[7] + v23 * *a5 * a5[15]) * v38
          + (a5[8] + v23 * *a5 * a5[16]) * (v34 * (v34 * v38))
          + (a5[9] + v23 * *a5 * a5[17]) * (v34 * (v34 * (v34 * (v34 * v38))))
          + (a5[10] + v23 * *a5 * a5[18]) * (v34 * (v34 * (v34 * (v34 * (v34 * (v34 * v38))))))
          + (a5[11] + v23 * *a5 * a5[19]) * (v34 * (v34 * (v34 * (v34 * (v34 * (v34 * (v34 * (v34 * v38)))))))))
         / 100.0
         + 1.0);
    double v41 = v20 * (1.0 - v39) + v39 * *v26;
    double v42 = *(double *)&v49
        + *((double *)&v48 + 1) * v41
        + *(double *)&v48 * (v19 * (1.0 - v39) + v39 * v29)
        + (v22 * (1.0 - v40) + v40 * *v27)
        * (*((double *)&v47 + 1) + *(double *)&v47 * v41 + *((double *)&v46 + 1) * (v19 * (1.0 - v39) + v39 * v29))
        + (v21 * (1.0 - v40) + v40 * v30)
        * (*(double *)&v46 + *((double *)&v45 + 1) * v41 + *(double *)&v45 * (v19 * (1.0 - v39) + v39 * v29));
    double v28 = v28 + sqrt(v42 * v42 + 0.00000337320636);
    v26 += 2;
    v27 += 2;
    --v25;
  }
  while (v25);
  *a7 = v28 / (double)a3;
  return result;
}

uint64_t sub_262E73A24()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E73A58(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262E740D0()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E74104(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262E7478C()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E747C0(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t sub_262E74F50()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void sub_262E74F84(uint64_t a1, void *a2)
{
  id v17 = a2;
  if (objc_msgSend_status(v17, v2, v3, v4, v5, v6) == 4)
  {
    objc_msgSend_GPUEndTime(v17, v7, v8, v9, v10, v11);
    objc_msgSend_GPUStartTime(v17, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend_status(v17, v7, v8, v9, v10, v11);
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

void sub_262E76B08(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, double a8)
{
  uint64_t v16 = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
  if (v16 && (sub_262E82CB0(a1, a2, a3, a4, v16), a3 >= 1))
  {
    int v17 = 0;
    long long v18 = (void *)(a2 + 8);
    double v19 = (void *)(a1 + 8);
    double v20 = v16;
    uint64_t v21 = a3;
    do
    {
      if (*v20 < a8)
      {
        int v22 = 2 * v17;
        *(void *)(a5 + 8 * v22) = *(v19 - 1);
        uint64_t v23 = (16 * v17) | 8;
        *(void *)(a5 + v23) = *v19;
        *(void *)(a6 + 8 * v22) = *(v18 - 1);
        *(void *)(a6 + v23) = *v18;
        ++v17;
      }
      ++v20;
      v18 += 2;
      v19 += 2;
      --v21;
    }
    while (v21);
  }
  else
  {
    int v17 = 0;
  }
  *a7 = v17;

  free(v16);
}

uint64_t sub_262E76EFC(void *a1, const char *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v7 = sub_262E77848(a1, a2, (uint64_t)a3, a4, a5, a6);
  uint64_t v13 = v7;
  if (v7)
  {
    objc_msgSend_floatValue(v7, v8, v9, v10, v11, v12);
    uint64_t v14 = 0;
    *a3 = v15;
  }
  else
  {
    uint64_t v14 = 4294954516;
  }

  return v14;
}

uint64_t sub_262E77438(void *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v7 = sub_262E77848(a1, a2, (uint64_t)a3, a4, a5, a6);
  uint64_t v13 = v7;
  if (v7)
  {
    objc_msgSend_doubleValue(v7, v8, v9, v10, v11, v12);
    uint64_t v14 = 0;
    *a3 = v15;
  }
  else
  {
    uint64_t v14 = 4294954516;
  }

  return v14;
}

uint64_t sub_262E77490(void *a1, const char *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v7 = sub_262E77848(a1, a2, (uint64_t)a3, a4, a5, a6);
  uint64_t v13 = v7;
  if (v7)
  {
    uint64_t v14 = 0;
    *a3 = objc_msgSend_integerValue(v7, v8, v9, v10, v11, v12);
  }
  else
  {
    uint64_t v14 = 4294954516;
  }

  return v14;
}

id sub_262E77848(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = objc_msgSend_valueForKey_(a1, a2, (uint64_t)a2, a4, a5, a6);
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      if ((int)objc_msgSend_count(v7, v8, v9, v10, v11, v12) < 1)
      {
        int v17 = 0;
        uint64_t v6 = v7;
      }
      else
      {
        uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, 0, v14, v15, v16);

        int v17 = v6;
      }
    }
    else
    {
      int v17 = v6;
    }
  }
  else
  {
    int v17 = 0;
  }
  id v18 = v17;

  return v18;
}

double sub_262E7790C(double *a1, double *a2, double a3)
{
  double v3 = a1[1];
  double v4 = a1[2];
  double v5 = a1[3];
  double v6 = a1[4];
  double v7 = a1[5];
  double v8 = a1[6];
  double v9 = a1[7];
  double v10 = a1[10];
  double v11 = a1[11];
  double v12 = a1[14];
  double v13 = a1[15];
  double v14 = a1[17];
  double v15 = v3 * v8 - v5 * v12;
  double v16 = v3 * v10 - v7 * v12;
  double v17 = v3 * v9 - v5 * v13;
  double v18 = v3 * v11 - v7 * v13;
  double v19 = v6 * v9 + v8 * v4;
  double v20 = -(*a1 * v3);
  double v21 = v6 * v13 + v12 * v4 + *a1 * a1[16];
  double v22 = *a1 * (v5 * v14 - v3 * a1[9]) / a3 + v20 * a1[8] - v3 * v19 + v5 * v21;
  double v23 = *a1 * (v7 * v14 - v3 * a1[13]) / a3 + v20 * a1[12] - v3 * (v6 * v11 + v10 * v4) + v7 * v21;
  double v24 = *a1 * v14;
  *a2 = v15;
  a2[1] = v17;
  a2[2] = v22;
  a2[3] = v16;
  a2[4] = v18;
  a2[5] = v23;
  double result = v24 / a3 + v21;
  a2[6] = -v12;
  a2[7] = -v13;
  a2[8] = result;
  return result;
}

double sub_262E794D0(uint64_t *a1, double a2, double a3, double a4, double a5, int32x4_t a6)
{
  v6.i64[0] = *a1;
  a6.i64[0] = a1[4];
  v6.i64[1] = a1[2];
  *(void *)&double result = vuzp1q_s32(v6, a6).u64[0];
  return result;
}

__n128 sub_262E797A0(__n128 *a1, __n128 *a2)
{
  __n128 v2 = a2[6];
  __n128 v9 = a2[7];
  __n128 v10 = a2[8];
  __n128 v11 = a2[9];
  __n128 v3 = a2[2];
  __n128 v6 = a2[3];
  __n128 v7 = a2[4];
  __n128 v8 = a2[5];
  __n128 v4 = a1[1];
  *a2 = *a1;
  a2[1] = v4;
  a2[2] = v3;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v2;
  a2[7] = v9;
  __n128 result = v10;
  a2[8] = v10;
  a2[9] = v11;
  return result;
}

void sub_262E7BFC4(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, double *a5@<X4>, uint64_t a6@<X8>)
{
  v63[9] = *(double *)MEMORY[0x263EF8340];
  long long v8 = *(_OWORD *)(a4 + 144);
  long long v9 = *(_OWORD *)(a4 + 160);
  long long v10 = *(_OWORD *)(a4 + 112);
  long long v57 = *(_OWORD *)(a4 + 128);
  long long v58 = v8;
  long long v59 = v9;
  long long v11 = *(_OWORD *)(a4 + 80);
  long long v12 = *(_OWORD *)(a4 + 96);
  long long v13 = *(_OWORD *)(a4 + 48);
  long long v53 = *(_OWORD *)(a4 + 64);
  long long v54 = v11;
  uint64_t v60 = *(void *)(a4 + 176);
  long long v55 = v12;
  long long v56 = v10;
  long long v14 = *(_OWORD *)(a4 + 16);
  v50[0] = *(_OWORD *)a4;
  v50[1] = v14;
  long long v51 = *(_OWORD *)(a4 + 32);
  long long v52 = v13;
  double v15 = *(double *)(a4 + 40);
  int v16 = (int)a5[7];
  if (v16 < 0)
  {
    double v27 = *(double *)(a4 + 40);
  }
  else
  {
    double v18 = a5[13];
    double v48 = a5[12];
    double v49 = a5[11];
    double v19 = a5[8];
    double v47 = a5[9];
    int v20 = -v16;
    uint64_t v21 = a3;
    double v22 = (double *)(a2 + 8);
    double v23 = (double *)(a1 + 8);
    double v24 = 1.79769313e308;
    double v25 = *(double *)(a4 + 40);
    double v26 = 1.79769313e308;
    do
    {
      double v27 = v15 + (double)v20;
      *((double *)&v51 + 1) = v27;
      sub_262E7790C((double *)v50, v63, 1.79769313e308);
      sub_262E7790C((double *)v50, v62, v47);
      sub_262E7790C((double *)v50, v61, v19);
      if (a3 < 1)
      {
        int v30 = 0;
        int v29 = 0;
        int v28 = 0;
      }
      else
      {
        int v28 = 0;
        int v29 = 0;
        int v30 = 0;
        uint64_t v31 = v21;
        double v32 = v23;
        double v33 = v22;
        do
        {
          double v34 = *(v32 - 1);
          double v35 = *v33;
          v33 += 2;
          double v36 = (v63[5] + *v32 * v63[4] + v63[3] * v34) / (v63[8] + *v32 * v63[7] + v63[6] * v34);
          double v37 = (v62[5] + *v32 * v62[4] + v62[3] * v34) / (v62[8] + *v32 * v62[7] + v62[6] * v34);
          BOOL v38 = v36 < v37;
          v30 += (v35 >= v36) ^ v38;
          v29 += v38 ^ (v35 < v37);
          v28 += v38 ^ (v35 < (v61[5] + *v32 * v61[4] + v61[3] * v34) / (v61[8] + *v32 * v61[7] + v61[6] * v34));
          v32 += 2;
          --v31;
        }
        while (v31);
      }
      double v39 = v18 * (double)(v28 - v29) + (double)v30 * v49 + (double)v29 * v48;
      if (v39 >= v24)
      {
        if (v39 == v24)
        {
          double v40 = v15 - v27;
          if (v15 - v27 < 0.0) {
            double v40 = -(v15 - v27);
          }
          if (v40 >= v26) {
            double v27 = v25;
          }
          else {
            double v26 = v40;
          }
        }
        else
        {
          double v27 = v25;
        }
        double v39 = v24;
      }
      else if (v15 - v27 >= 0.0)
      {
        double v26 = v15 - v27;
      }
      else
      {
        double v26 = -(v15 - v27);
      }
      double v24 = v39;
      double v25 = v27;
    }
    while (v20++ != v16);
  }
  long long v42 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(a6 + 128) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(a6 + 144) = v42;
  *(_OWORD *)(a6 + 160) = *(_OWORD *)(a4 + 160);
  *(void *)(a6 + 176) = *(void *)(a4 + 176);
  long long v43 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(a6 + 64) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(a6 + 80) = v43;
  long long v44 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(a6 + 96) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(a6 + 112) = v44;
  long long v45 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)a6 = *(_OWORD *)a4;
  *(_OWORD *)(a6 + 16) = v45;
  long long v46 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(a6 + 32) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(a6 + 48) = v46;
  *(double *)(a6 + 40) = v27;
}

double sub_262E7C2D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, double *a7, double *a8)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  long long v9 = *(_OWORD *)a4;
  long long v10 = *(_OWORD *)(a4 + 16);
  long long v11 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(a6 + 32) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(a6 + 48) = v11;
  *(_OWORD *)a6 = v9;
  *(_OWORD *)(a6 + 16) = v10;
  long long v12 = *(_OWORD *)(a4 + 64);
  long long v13 = *(_OWORD *)(a4 + 80);
  long long v14 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(a6 + 96) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(a6 + 112) = v14;
  *(_OWORD *)(a6 + 64) = v12;
  *(_OWORD *)(a6 + 80) = v13;
  float32x4_t v15 = *(float32x4_t *)(a4 + 128);
  long long v16 = *(_OWORD *)(a4 + 144);
  long long v17 = *(_OWORD *)(a4 + 160);
  *(void *)(a6 + 176) = *(void *)(a4 + 176);
  *(_OWORD *)(a6 + 144) = v16;
  *(_OWORD *)(a6 + 160) = v17;
  *(float32x4_t *)(a6 + 128) = v15;
  *a7 = 0.0;
  *a8 = 0.0;
  if (a3 >= 1)
  {
    *(double *)v15.i64 = fabs(*(double *)(a5 + 48)) + fabs(*(double *)(a5 + 56));
    if (*(double *)v15.i64 >= 0.1)
    {
      double v75 = a7;
      double v76 = a8;
      double v77 = &v74;
      uint64_t v23 = vcvtms_u32_f32((float)(*(float *)(a5 + 128) * (float)a3) * 0.01) + 1;
      MEMORY[0x270FA5388](0);
      double v25 = (char *)&v74 - v24;
      float32x4_t v93 = 0u;
      float32x4_t v94 = 0u;
      float32x4_t v91 = 0u;
      float32x4_t v92 = 0u;
      float32x4_t v89 = 0u;
      float32x4_t v90 = 0u;
      float32x4_t v87 = 0u;
      float32x4_t v88 = 0u;
      float32x4_t v85 = 0u;
      float32x4_t v86 = 0u;
      float32x4_t v83 = 0u;
      float32x4_t v84 = 0u;
      float32x4_t v82 = 0uLL;
      if (!sub_262E811F0(a4, &v92, &v89, &v86, &v83, &v82))
      {
        uint64_t v27 = 0;
        unsigned int v28 = 0;
        unsigned int v29 = 0;
        unsigned int v30 = 0;
        *(float32x2_t *)v15.f32 = vabs_f32(*(float32x2_t *)v82.f32);
        *(int32x2_t *)v26.i8 = vdup_lane_s32(*(int32x2_t *)v15.f32, 1);
        *(int8x8_t *)v15.f32 = vmvn_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v26.i8));
        uint64_t v31 = v15.i8[0] & 1;
        BOOL v32 = (v15.i8[0] & 1) == 0;
        v15.i32[0] = *(_DWORD *)((unint64_t)&v82 & 0xFFFFFFFFFFFFFFFBLL | (4 * v31));
        v26.i32[0] = 1.0;
        v33.i64[0] = 0x8000000080000000;
        v33.i64[1] = 0x8000000080000000;
        v15.i64[0] = vbslq_s8(v33, v26, (int8x16_t)v15).u64[0];
        float32x4_t v34 = v86;
        float32x4_t v35 = v87;
        float32x4_t v36 = v88;
        float32x4_t v37 = v83;
        float32x4_t v38 = v84;
        float32x4_t v39 = v85;
        float v40 = *(float *)(a5 + 132);
        float v41 = -3.4028e38;
        long long v42 = (float *)((unint64_t)&v81 & 0xFFFFFFFFFFFFFFFBLL | (4 * v32));
        long long v43 = (float *)((unint64_t)&v80 | (4 * v32));
        long long v44 = v76;
        do
        {
          float v45 = *(double *)(a1 + 16 * v27);
          uint64_t v46 = (16 * v27) | 8;
          float v47 = *(double *)(a1 + v46);
          float v48 = *(double *)(a2 + 16 * v27);
          float v49 = *(double *)(a2 + v46);
          float32x4_t v50 = vaddq_f32(v36, vmlaq_n_f32(vmulq_n_f32(v34, v45), v35, v47));
          float32x4_t v51 = vdivq_f32(v50, (float32x4_t)vdupq_laneq_s32((int32x4_t)v50, 2));
          float32x4_t v52 = vaddq_f32(v39, vmlaq_n_f32(vmulq_n_f32(v37, v48), v38, v49));
          float32x4_t v81 = vdivq_f32(v52, (float32x4_t)vdupq_laneq_s32((int32x4_t)v52, 2));
          float v53 = *(float *)((unint64_t)&v81 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v31 & 1)));
          float32x4_t v80 = v51;
          if (vabds_f32(*v42, *v43) <= v40)
          {
            float v54 = v15.f32[0] * (float)(v53 - *(float *)((unint64_t)&v80 | (4 * v31)));
            if (v54 < 0.0)
            {
              ++v28;
              if (v29 >= v23)
              {
                if (v54 < v41)
                {
                  *(float *)&v25[4 * v30] = v54;
                  if (v23)
                  {
                    for (uint64_t i = 0; i != v23; ++i)
                    {
                      if (*(float *)&v25[4 * i] > v54)
                      {
                        float v54 = *(float *)&v25[4 * i];
                        unsigned int v30 = i;
                      }
                    }
                  }
                  float v41 = v54;
                }
              }
              else
              {
                *(float *)&v25[4 * v29] = v54;
                if (v54 > v41)
                {
                  float v41 = v54;
                  unsigned int v30 = v29;
                }
                ++v29;
              }
            }
          }
          ++v27;
        }
        while (v27 != a3);
        *long long v44 = (double)v28 / (double)a3;
        if (v29 >= v23)
        {
          float v56 = *(double *)a4 / *(double *)(a4 + 8);
          float v57 = *(double *)(a5 + 48);
          float v58 = *(double *)(a5 + 56);
          float v59 = v56 * v58;
          float v60 = -v41;
          if (v41 > -0.0) {
            float v60 = 0.0;
          }
          float v61 = v59 + v57;
          if (v60 >= (float)(v59 + v57)) {
            float v62 = v59 + v57;
          }
          else {
            float v62 = v60;
          }
          float v63 = v57 / v61;
          float v64 = *(double *)(a4 + 16);
          float v65 = *(double *)(a4 + 32);
          float v66 = *(double *)(a4 + 24);
          float v67 = *(double *)(a4 + 40);
          float32x4_t v68 = vaddq_f32(v88, vmlaq_n_f32(vmulq_n_f32(v86, v64), v87, v65));
          float32x4_t v69 = vaddq_f32(v85, vmlaq_n_f32(vmulq_n_f32(v83, v66), v84, v67));
          float32x4_t v78 = 0u;
          *(float *)((unint64_t)&v78 | (4 * v31)) = v15.f32[0] * (float)(v63 * v62);
          float32x4_t v70 = vaddq_f32(v78, vdivq_f32(v68, (float32x4_t)vdupq_laneq_s32((int32x4_t)v68, 2)));
          float32x4_t v79 = v78;
          *(float *)((unint64_t)&v79 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v31 & 1))) = v62
                                                                                      * (float)(v15.f32[0]
                                                                                              * (float)(1.0 - v63));
          float32x4_t v15 = vsubq_f32(vdivq_f32(v69, (float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2)), v79);
          int32x4_t v71 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v92, v70.f32[0]), v93, *(float32x2_t *)v70.f32, 1), v94, v70, 2);
          int32x4_t v72 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v89, v15.f32[0]), v90, *(float32x2_t *)v15.f32, 1), v91, v15, 2);
          *(float32x2_t *)v71.i8 = vdiv_f32(*(float32x2_t *)v71.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v71, 2));
          *(float32x2_t *)v15.f32 = vdiv_f32(*(float32x2_t *)v72.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v72, 2));
          *(float64x2_t *)(a6 + 16) = vcvtq_f64_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v71.i8, *(int32x2_t *)v15.f32));
          *(float64x2_t *)(a6 + 32) = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)v71.i8, *(int32x2_t *)v15.f32));
          *(double *)v15.i64 = v62;
          *double v75 = v62;
        }
      }
    }
  }
  return *(double *)v15.i64;
}

uint64_t sub_262E7C72C(unsigned int a1, void ***a2)
{
  memset(v3, 0, sizeof(v3));
  return sub_262E7C7A0(a1, v3, a2);
}

uint64_t sub_262E7C7A0(unsigned int a1, const void *a2, void ***a3)
{
  if ((int)a1 > 0 && a2 && a3)
  {
    __n128 v6 = (void **)malloc_type_calloc(1uLL, 0xB88uLL, 0x108004012BBBC92uLL);
    if (!v6) {
      goto LABEL_15;
    }
    __n128 v7 = malloc_type_malloc(16 * a1, 0x100004000313F17uLL);
    v6[362] = v7;
    if (!v7) {
      goto LABEL_15;
    }
    long long v8 = malloc_type_malloc(16 * a1, 0x100004000313F17uLL);
    v6[363] = v8;
    if (!v8) {
      goto LABEL_15;
    }
    long long v9 = malloc_type_malloc(16 * a1, 0x100004000313F17uLL);
    v6[364] = v9;
    if (!v9) {
      goto LABEL_15;
    }
    long long v10 = malloc_type_malloc(16 * a1, 0x100004000313F17uLL);
    v6[365] = v10;
    if (!v10) {
      goto LABEL_15;
    }
    long long v11 = malloc_type_malloc(16 * a1, 0x100004000313F17uLL);
    v6[366] = v11;
    if (v11
      && (long long v12 = malloc_type_malloc(16 * a1, 0x100004000313F17uLL), (v6[367] = v12) != 0)
      && (long long v13 = malloc_type_malloc(8 * a1, 0x100004000313F17uLL), (v6[368] = v13) != 0))
    {
      *(_DWORD *)__n128 v6 = a1;
      memcpy(v6 + 1, a2, 0x200uLL);
      uint64_t v14 = 0;
      *a3 = v6;
      __n128 v6 = 0;
    }
    else
    {
LABEL_15:
      FigDebugAssert3();
      uint64_t v14 = 4294954510;
    }
  }
  else
  {
    FigDebugAssert3();
    __n128 v6 = 0;
    uint64_t v14 = 4294954516;
  }
  sub_262E7CC58(v6);
  return v14;
}

void sub_262E7CC58(void **a1)
{
  if (a1)
  {
    free(a1[362]);
    free(a1[363]);
    free(a1[364]);
    free(a1[365]);
    free(a1[366]);
    free(a1[367]);
    free(a1[368]);
    free(a1);
  }
}

uint64_t sub_262E7CCCC(uint64_t a1, const void *a2)
{
  if (a1 && a2)
  {
    memcpy((void *)(a1 + 8), a2, 0x200uLL);
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return 4294954516;
  }
}

void sub_262E7CD94(uint64_t a1@<X0>, void *a2@<X8>)
{
  bzero(a2, 0x748uLL);
  if (a1)
  {
    memcpy(a2, (const void *)(a1 + 520), 0x748uLL);
  }
}

uint64_t sub_262E7CDF0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, long long *a5, uint64_t a6, uint64_t a7)
{
  if (!a1) {
    goto LABEL_55;
  }
  if (!a2) {
    goto LABEL_55;
  }
  if (!a3) {
    goto LABEL_55;
  }
  if (a4 <= 0) {
    goto LABEL_55;
  }
  if (*(_DWORD *)a1 < a4) {
    goto LABEL_55;
  }
  if (!a5) {
    goto LABEL_55;
  }
  if (!a6) {
    goto LABEL_55;
  }
  if (!a7) {
    goto LABEL_55;
  }
  if (fabs(*(double *)(a7 + 168)) <= 0.00001) {
    goto LABEL_55;
  }
  if (fabs(*(double *)(a7 + 176)) <= 0.00001) {
    goto LABEL_55;
  }
  double v146 = *(double *)a5;
  if (fabs(*(double *)a5) <= 0.00000001) {
    goto LABEL_55;
  }
  double v145 = *(double *)a6;
  if (fabs(*(double *)a6) <= 0.00000001) {
    goto LABEL_55;
  }
  float64x2_t v144 = *(float64x2_t *)((char *)a5 + 8);
  double v14 = *((double *)a5 + 3);
  long long v15 = a5[5];
  long long v16 = a5[7];
  long long v238 = a5[6];
  long long v239 = v16;
  long long v17 = a5[7];
  long long v18 = a5[9];
  long long v240 = a5[8];
  long long v241 = v18;
  long long v19 = a5[3];
  long long v234 = a5[2];
  long long v235 = v19;
  long long v20 = a5[5];
  long long v22 = a5[2];
  long long v21 = a5[3];
  long long v236 = a5[4];
  long long v237 = v20;
  float64x2_t v142 = *(float64x2_t *)(a6 + 8);
  double v143 = *(double *)(a6 + 24);
  long long v24 = *(_OWORD *)(a6 + 112);
  long long v23 = *(_OWORD *)(a6 + 128);
  long long v25 = v23;
  long long v233 = *(_OWORD *)(a6 + 144);
  long long v232 = v23;
  long long v26 = *(_OWORD *)(a6 + 96);
  long long v27 = *(_OWORD *)(a6 + 80);
  long long v231 = *(_OWORD *)(a6 + 112);
  long long v230 = v26;
  long long v29 = *(_OWORD *)(a6 + 48);
  long long v28 = *(_OWORD *)(a6 + 64);
  long long v30 = v28;
  long long v229 = *(_OWORD *)(a6 + 80);
  long long v228 = v28;
  long long v31 = *(_OWORD *)(a6 + 32);
  long long v32 = v31;
  long long v227 = *(_OWORD *)(a6 + 48);
  long long v226 = v31;
  long long v33 = *(_OWORD *)a7;
  long long v34 = *(_OWORD *)(a7 + 16);
  long long v225 = *(_OWORD *)(a7 + 32);
  long long v35 = *(_OWORD *)a7;
  long long v224 = *(_OWORD *)(a7 + 16);
  long long v223 = v33;
  double v36 = *(double *)(a7 + 56);
  double v150 = *(double *)(a7 + 48);
  float64x2_t v38 = *(float64x2_t *)(a7 + 128);
  long long v37 = *(_OWORD *)(a7 + 144);
  long long v39 = v37;
  long long v221 = *(_OWORD *)(a7 + 160);
  long long v220 = v37;
  long long v40 = *a5;
  *(_OWORD *)&v211[16] = a5[1];
  *(_OWORD *)v211 = v40;
  float64x2_t v149 = *(float64x2_t *)(a7 + 64);
  long long v215 = v15;
  long long v214 = v236;
  double v41 = *(double *)(a7 + 80);
  double v42 = *(double *)(a7 + 88);
  long long v213 = v21;
  long long v212 = v22;
  long long v219 = a5[9];
  long long v218 = v240;
  long long v217 = v17;
  long long v216 = v238;
  float64x2_t v43 = *(float64x2_t *)(a7 + 96);
  long long v207 = v26;
  long long v208 = v24;
  long long v44 = *(_OWORD *)(a6 + 144);
  long long v209 = v25;
  long long v210 = v44;
  double v45 = *(double *)(a7 + 112);
  double v46 = *(double *)(a7 + 120);
  long long v203 = v32;
  long long v204 = v29;
  long long v205 = v30;
  long long v206 = v27;
  long long v47 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)v202 = *(_OWORD *)a6;
  *(_OWORD *)&v202[16] = v47;
  float64x2_t v147 = v43;
  float64x2_t v148 = *(float64x2_t *)(a7 + 128);
  double v222 = *(double *)(a7 + 176);
  float64x2_t v198 = v38;
  long long v199 = v39;
  long long v200 = *(_OWORD *)(a7 + 160);
  double v201 = *(double *)(a7 + 176);
  long long v48 = *(_OWORD *)(a7 + 80);
  float64x2_t v194 = *(float64x2_t *)(a7 + 64);
  long long v195 = v48;
  long long v49 = *(_OWORD *)(a7 + 112);
  float64x2_t v196 = *(float64x2_t *)(a7 + 96);
  long long v197 = v49;
  long long v190 = v35;
  long long v191 = v34;
  long long v50 = *(_OWORD *)(a7 + 48);
  float v51 = *(float *)(a1 + 152);
  long long v192 = *(_OWORD *)(a7 + 32);
  long long v193 = v50;
  if (v51 > 0.0 && *(unsigned char *)(a1 + 2384)) {
    sub_262E7E448(a1, (uint64_t)v211, (uint64_t)v202, (double *)&v190, v51);
  }
  uint64_t v52 = sub_262E7EAB0(a1, a2, a3, a4, (double *)v211, (double *)v202, (uint64_t)&v190);
  if (v52)
  {
    uint64_t v114 = v52;
    goto LABEL_54;
  }
  if (fabs(*((double *)&v200 + 1)) <= 0.00001
    || fabs(v201) <= 0.00001
    || fabs(*(double *)v211) <= 0.00000001
    || fabs(*(double *)v202) <= 0.00000001)
  {
LABEL_55:
    FigDebugAssert3();
    return 4294954516;
  }
  double v132 = v14;
  double v137 = v36;
  if (!*(unsigned char *)(a1 + 1868))
  {
    FigDebugAssert3();
    int v99 = *(unsigned __int8 *)(a1 + 2384);
LABEL_37:
    long long v190 = v223;
    long long v191 = v224;
    long long v192 = v225;
    *(double *)&long long v193 = v150;
    *((double *)&v193 + 1) = v137;
    float64x2_t v194 = v149;
    *(double *)&long long v195 = v41;
    *((double *)&v195 + 1) = v42;
    float64x2_t v196 = v147;
    *(double *)&long long v197 = v45;
    *((double *)&v197 + 1) = v46;
    double v201 = v222;
    long long v200 = v221;
    float64x2_t v198 = v148;
    long long v199 = v220;
    *(float64x2_t *)&v211[8] = v144;
    *(double *)v211 = v146;
    *(double *)&v211[24] = v132;
    long long v219 = v241;
    long long v218 = v240;
    long long v217 = v239;
    long long v216 = v238;
    long long v215 = v237;
    long long v214 = v236;
    long long v213 = v235;
    long long v212 = v234;
    *(float64x2_t *)&v202[8] = v142;
    *(double *)v202 = v145;
    *(double *)&v202[24] = v143;
    long long v206 = v229;
    long long v205 = v228;
    long long v204 = v227;
    long long v203 = v226;
    long long v210 = v233;
    long long v209 = v232;
    long long v208 = v231;
    long long v207 = v230;
    if (!v99) {
      goto LABEL_39;
    }
    uint64_t v113 = sub_262E7E448(a1, (uint64_t)v211, (uint64_t)v202, (double *)&v190, 1.0);
    if (!v113) {
      goto LABEL_39;
    }
    uint64_t v114 = v113;
LABEL_54:
    FigDebugAssert3();
    return v114;
  }
  double v138 = *(double *)v211;
  double v140 = *(double *)v202;
  double v189 = 0.0;
  long long v188 = 0u;
  long long v187 = 0u;
  long long v186 = 0u;
  long long v185 = 0u;
  long long v184 = 0u;
  long long v183 = 0u;
  long long v182 = 0u;
  long long v181 = 0u;
  long long v180 = 0u;
  long long v179 = 0u;
  long long v178 = 0u;
  long long v317 = (__int128)v198;
  long long v318 = v199;
  long long v319 = v200;
  double v320 = v201;
  long long v313 = (__int128)v194;
  long long v314 = v195;
  long long v315 = (__int128)v196;
  long long v316 = v197;
  long long v309 = v190;
  long long v310 = v191;
  long long v311 = v192;
  long long v312 = v193;
  sub_262E7F1C8(&v309, (uint64_t)v176);
  long long v297 = v223;
  long long v298 = v224;
  long long v299 = v225;
  *(double *)&long long v300 = v150;
  *((double *)&v300 + 1) = v36;
  long long v301 = (__int128)v149;
  *(double *)&long long v302 = v41;
  *((double *)&v302 + 1) = v42;
  long long v303 = (__int128)v147;
  *(double *)&long long v304 = v45;
  *((double *)&v304 + 1) = v46;
  double v308 = v222;
  long long v307 = v221;
  long long v305 = (__int128)v148;
  long long v306 = v220;
  sub_262E7F1C8(&v297, (uint64_t)&v309);
  uint64_t v53 = 0;
  char v54 = 1;
  do
  {
    char v55 = v54;
    float v56 = (double *)&v309 + v53;
    *float v56 = -*v56;
    v56[2] = -v56[2];
    v56[4] = -v56[4];
    uint64_t v53 = 1;
    char v54 = 0;
  }
  while ((v55 & 1) != 0);
  uint64_t v57 = 0;
  long long v305 = v317;
  long long v306 = v318;
  long long v307 = v319;
  double v308 = v320;
  long long v301 = v313;
  long long v302 = v314;
  long long v303 = v315;
  long long v304 = v316;
  long long v297 = v309;
  long long v298 = v310;
  long long v299 = v311;
  long long v300 = v312;
  long long v317 = v176[8];
  long long v318 = v176[9];
  long long v319 = v176[10];
  double v320 = v177;
  long long v313 = v176[4];
  long long v314 = v176[5];
  long long v315 = v176[6];
  long long v316 = v176[7];
  long long v309 = v176[0];
  long long v310 = v176[1];
  char v58 = 1;
  long long v311 = v176[2];
  long long v312 = v176[3];
  do
  {
    char v59 = v58;
    float v60 = (double *)&v297 + v57;
    float v61 = (double *)&v309 + v57;
    *float v61 = *v60 + *v61;
    v61[2] = v60[2] + v61[2];
    v61[4] = v60[4] + v61[4];
    uint64_t v57 = 1;
    char v58 = 0;
  }
  while ((v59 & 1) != 0);
  long long v186 = v317;
  long long v187 = v318;
  long long v188 = v319;
  long long v182 = v313;
  long long v183 = v314;
  long long v184 = v315;
  long long v185 = v316;
  long long v178 = v309;
  long long v179 = v310;
  float64x2_t v62 = vsubq_f64(vmulq_n_f64(*(float64x2_t *)&v211[8], v138), vmulq_n_f64(v144, v146));
  double v63 = v138 * *(double *)&v211[24] - v146 * v14;
  long long v180 = v311;
  long long v181 = v312;
  double v189 = v320;
  float64x2_t v64 = vsubq_f64(vmulq_n_f64(*(float64x2_t *)&v202[8], v140), vmulq_n_f64(v142, v145));
  double v65 = v140 * *(double *)&v202[24] - v145 * v143;
  float v66 = (long long *)(a1 + 2392);
  if (*(unsigned char *)(a1 + 2384))
  {
    float64x2_t v139 = v62;
    float64x2_t v141 = v64;
    long long v67 = *(_OWORD *)(a1 + 2536);
    long long v68 = *(_OWORD *)(a1 + 2504);
    long long v160 = *(_OWORD *)(a1 + 2520);
    long long v161 = v67;
    long long v69 = *(_OWORD *)(a1 + 2536);
    long long v162 = *(_OWORD *)(a1 + 2552);
    long long v70 = *(_OWORD *)(a1 + 2472);
    long long v71 = *(_OWORD *)(a1 + 2440);
    long long v156 = *(_OWORD *)(a1 + 2456);
    long long v157 = v70;
    long long v72 = *(_OWORD *)(a1 + 2472);
    long long v73 = *(_OWORD *)(a1 + 2504);
    long long v158 = *(_OWORD *)(a1 + 2488);
    long long v159 = v73;
    long long v74 = *(_OWORD *)(a1 + 2408);
    v153[0] = *v66;
    v153[1] = v74;
    long long v75 = *(_OWORD *)(a1 + 2440);
    long long v77 = *v66;
    long long v76 = *(_OWORD *)(a1 + 2408);
    long long v154 = *(_OWORD *)(a1 + 2424);
    long long v155 = v75;
    v151[8] = v186;
    v151[9] = v187;
    v151[10] = v188;
    v151[4] = v182;
    v151[5] = v183;
    v151[6] = v184;
    v151[7] = v185;
    v151[0] = v178;
    v151[1] = v179;
    v151[2] = v180;
    v151[3] = v181;
    long long v317 = v160;
    long long v318 = v69;
    long long v319 = *(_OWORD *)(a1 + 2552);
    long long v313 = v156;
    long long v314 = v72;
    long long v315 = v158;
    long long v316 = v68;
    long long v309 = v77;
    long long v310 = v76;
    long long v311 = v154;
    long long v312 = v71;
    long long v305 = v186;
    long long v306 = v187;
    long long v307 = v188;
    long long v301 = v182;
    long long v302 = v183;
    uint64_t v163 = *(void *)(a1 + 2568);
    double v152 = v189;
    double v320 = *(double *)(a1 + 2568);
    long long v303 = v184;
    long long v304 = v185;
    float v78 = *(float *)(a1 + 148);
    double v79 = *(float *)(a1 + 144);
    long long v297 = v178;
    long long v298 = v179;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    uint64_t v175 = 0;
    double v308 = v189;
    long long v299 = v180;
    long long v300 = v181;
    sub_262E8204C(&v309, &v297, (uint64_t)&v164, v79);
    double v320 = 0.0;
    long long v319 = 0u;
    long long v318 = 0u;
    long long v317 = 0u;
    long long v316 = 0u;
    long long v315 = 0u;
    long long v314 = 0u;
    long long v313 = 0u;
    long long v312 = 0u;
    long long v311 = 0u;
    long long v310 = 0u;
    long long v309 = 0u;
    double v308 = 0.0;
    long long v307 = 0u;
    long long v306 = 0u;
    long long v305 = 0u;
    long long v304 = 0u;
    long long v303 = 0u;
    long long v302 = 0u;
    long long v301 = 0u;
    long long v300 = 0u;
    long long v299 = 0u;
    long long v298 = 0u;
    long long v297 = 0u;
    uint64_t v296 = 0;
    long long v295 = 0u;
    long long v294 = 0u;
    long long v293 = 0u;
    long long v292 = 0u;
    long long v291 = 0u;
    long long v290 = 0u;
    long long v289 = 0u;
    long long v288 = 0u;
    long long v287 = 0u;
    long long v286 = 0u;
    long long v285 = 0u;
    v80.f32[0] = v150;
    __n128 v284 = 0u;
    int8x16_t v283 = 0u;
    v321.columns[1].f32[0] = v137;
    float v81 = v41;
    int8x16_t v282 = 0u;
    int8x16_t v281 = 0u;
    float v82 = v42;
    float v83 = v45;
    v280.columns[1] = 0;
    v280.columns[0] = 0;
    float v84 = v46;
    int32x4_t v85 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)&v149.f64[0], v149), (int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)&v148.f64[0], v148));
    v279.columns[1] = 0;
    v279.columns[0] = 0;
    int32x4_t v86 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)&v147.f64[0], v147), (int32x4_t)0);
    v80.f32[1] = v81;
    v80.f32[2] = v83;
    v321.columns[2] = (simd_float3)vzip1q_s32(v85, v86);
    v321.columns[1].f32[1] = v82;
    float32x4_t v87 = (float32x4_t)vzip2q_s32(v85, v86);
    v321.columns[1].f32[2] = v84;
    int8x16_t v135 = (int8x16_t)v321.columns[1];
    int8x16_t v136 = (int8x16_t)v80;
    v321.columns[0] = v80;
    __n128 v133 = (__n128)v87;
    int8x16_t v134 = (int8x16_t)v321.columns[2];
    if (sub_262E7F314((uint64_t)&v281, &v280, (int32x2_t *)&v279, v321, v87)) {
      goto LABEL_57;
    }
    if (sub_262E7F7A0(v153, (uint64_t)&v309, v281, v282, v283, v284, (float32x2_t)v280.columns[0], (float32x2_t)v280.columns[1], (float32x2_t)v279.columns[0], (float32x2_t)v279.columns[1]))goto LABEL_57; {
    if (sub_262E7F7A0(v151, (uint64_t)&v297, v281, v282, v283, v284, (float32x2_t)v280.columns[0], (float32x2_t)v280.columns[1], (float32x2_t)v279.columns[0], (float32x2_t)v279.columns[1]))goto LABEL_57;
    }
    uint64_t v278 = 0;
    long long v277 = 0u;
    long long v276 = 0u;
    long long v275 = 0u;
    long long v274 = 0u;
    long long v273 = 0u;
    long long v272 = 0u;
    long long v271 = 0u;
    long long v270 = 0u;
    long long v269 = 0u;
    memset(v268, 0, sizeof(v268));
    long long v264 = v317;
    long long v265 = v318;
    long long v266 = v319;
    double v267 = v320;
    long long v260 = v313;
    long long v261 = v314;
    long long v262 = v315;
    long long v263 = v316;
    long long v256 = v309;
    long long v257 = v310;
    long long v258 = v311;
    long long v259 = v312;
    long long v252 = v305;
    long long v253 = v306;
    long long v254 = v307;
    double v255 = v308;
    long long v248 = v301;
    long long v249 = v302;
    long long v250 = v303;
    long long v251 = v304;
    long long v244 = v297;
    long long v245 = v298;
    long long v246 = v299;
    long long v247 = v300;
    sub_262E8204C(&v256, &v244, (uint64_t)v268, v79);
    long long v256 = 0u;
    long long v257 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    long long v260 = 0u;
    long long v261 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    long long v264 = 0u;
    long long v265 = 0u;
    long long v266 = 0u;
    double v267 = 0.0;
    long long v252 = v317;
    long long v253 = v318;
    long long v254 = v319;
    double v255 = v320;
    long long v248 = v313;
    long long v249 = v314;
    long long v250 = v315;
    long long v251 = v316;
    long long v244 = v309;
    long long v245 = v310;
    long long v246 = v311;
    long long v247 = v312;
    v242[8] = v305;
    v242[9] = v306;
    v242[10] = v307;
    double v243 = v308;
    v242[4] = v301;
    v242[5] = v302;
    v242[6] = v303;
    v242[7] = v304;
    v242[0] = v297;
    v242[1] = v298;
    v242[2] = v299;
    v242[3] = v300;
    sub_262E8204C(&v244, v242, (uint64_t)&v256, v78);
    long long v269 = v258;
    simd_float2x2 v88 = __invert_f2(v280);
    simd_float2x2 v89 = __invert_f2(v279);
    if (sub_262E7F7A0(v268, (uint64_t)&v285, v136, v135, v134, v133, (float32x2_t)v88.columns[0], (float32x2_t)v88.columns[1], (float32x2_t)v89.columns[0], (float32x2_t)v89.columns[1]))
    {
LABEL_57:
      FigDebugAssert3();
    }
    else
    {
      long long v165 = v286;
      long long v166 = v287;
    }
    long long v90 = v173;
    *(_OWORD *)(a1 + 2520) = v172;
    *(_OWORD *)(a1 + 2536) = v90;
    *(_OWORD *)(a1 + 2552) = v174;
    *(void *)(a1 + 2568) = v175;
    long long v91 = v169;
    *(_OWORD *)(a1 + 2456) = v168;
    *(_OWORD *)(a1 + 2472) = v91;
    long long v92 = v171;
    *(_OWORD *)(a1 + 2488) = v170;
    *(_OWORD *)(a1 + 2504) = v92;
    long long v93 = v165;
    *float v66 = v164;
    *(_OWORD *)(a1 + 2408) = v93;
    long long v94 = v167;
    *(_OWORD *)(a1 + 2424) = v166;
    *(_OWORD *)(a1 + 2440) = v94;
    float v95 = *(float *)(a1 + 144);
    double v96 = 1.0 - v95;
    double v97 = v63 * v96 + *(double *)(a1 + 2600) * v95;
    *(float64x2_t *)(a1 + 2584) = vaddq_f64(vmulq_n_f64(v139, v96), vmulq_n_f64(*(float64x2_t *)(a1 + 2584), v95));
    *(double *)(a1 + 2600) = v97;
    double v98 = v65 * v96 + *(double *)(a1 + 2760) * v95;
    *(float64x2_t *)(a1 + 2744) = vaddq_f64(vmulq_n_f64(v141, v96), vmulq_n_f64(*(float64x2_t *)(a1 + 2744), v95));
    *(double *)(a1 + 2760) = v98;
    int v99 = *(unsigned __int8 *)(a1 + 2384);
    if (!*(unsigned char *)(a1 + 2384)) {
      goto LABEL_39;
    }
  }
  else
  {
    long long v100 = v187;
    *(_OWORD *)(a1 + 2520) = v186;
    *(_OWORD *)(a1 + 2536) = v100;
    *(_OWORD *)(a1 + 2552) = v188;
    *(double *)(a1 + 2568) = v189;
    long long v101 = v183;
    *(_OWORD *)(a1 + 2456) = v182;
    *(_OWORD *)(a1 + 2472) = v101;
    long long v102 = v185;
    *(_OWORD *)(a1 + 2488) = v184;
    *(_OWORD *)(a1 + 2504) = v102;
    long long v103 = v179;
    *float v66 = v178;
    *(_OWORD *)(a1 + 2408) = v103;
    long long v104 = v181;
    *(_OWORD *)(a1 + 2424) = v180;
    *(_OWORD *)(a1 + 2440) = v104;
    *(void *)(a1 + 2576) = 0x3FF0000000000000;
    *(float64x2_t *)(a1 + 2584) = v62;
    *(double *)(a1 + 2600) = v63;
    long long v105 = v217;
    *(_OWORD *)(a1 + 2672) = v216;
    *(_OWORD *)(a1 + 2688) = v105;
    long long v106 = v219;
    *(_OWORD *)(a1 + 2704) = v218;
    *(_OWORD *)(a1 + 2720) = v106;
    long long v107 = v213;
    *(_OWORD *)(a1 + 2608) = v212;
    *(_OWORD *)(a1 + 2624) = v107;
    long long v108 = v215;
    *(_OWORD *)(a1 + 2640) = v214;
    *(_OWORD *)(a1 + 2656) = v108;
    *(void *)(a1 + 2736) = 0x3FF0000000000000;
    *(float64x2_t *)(a1 + 2744) = v64;
    *(double *)(a1 + 2760) = v65;
    long long v109 = v208;
    *(_OWORD *)(a1 + 2832) = v207;
    *(_OWORD *)(a1 + 2848) = v109;
    long long v110 = v210;
    *(_OWORD *)(a1 + 2864) = v209;
    *(_OWORD *)(a1 + 2880) = v110;
    long long v111 = v204;
    *(_OWORD *)(a1 + 2768) = v203;
    *(_OWORD *)(a1 + 2784) = v111;
    long long v112 = v206;
    *(_OWORD *)(a1 + 2800) = v205;
    *(_OWORD *)(a1 + 2816) = v112;
    int v99 = 1;
    *(unsigned char *)(a1 + 2384) = 1;
    float v95 = *(float *)(a1 + 144);
  }
  if (v95 == 0.0 && *(float *)(a1 + 148) > 0.0) {
    goto LABEL_37;
  }
LABEL_39:
  uint64_t v114 = 0;
  *(double *)(a7 + 176) = v201;
  long long v115 = v197;
  *(float64x2_t *)(a7 + 96) = v196;
  *(_OWORD *)(a7 + 112) = v115;
  long long v116 = v195;
  *(float64x2_t *)(a7 + 64) = v194;
  *(_OWORD *)(a7 + 80) = v116;
  long long v117 = v200;
  float64x2_t v118 = v198;
  *(_OWORD *)(a7 + 144) = v199;
  *(_OWORD *)(a7 + 160) = v117;
  *(float64x2_t *)(a7 + 128) = v118;
  long long v119 = v191;
  *(_OWORD *)a7 = v190;
  *(_OWORD *)(a7 + 16) = v119;
  long long v120 = v193;
  *(_OWORD *)(a7 + 32) = v192;
  *(_OWORD *)(a7 + 48) = v120;
  long long v121 = *(_OWORD *)&v211[16];
  *a5 = *(_OWORD *)v211;
  a5[1] = v121;
  long long v122 = v215;
  a5[4] = v214;
  a5[5] = v122;
  long long v123 = v213;
  a5[2] = v212;
  a5[3] = v123;
  long long v124 = v219;
  a5[8] = v218;
  a5[9] = v124;
  long long v125 = v217;
  a5[6] = v216;
  a5[7] = v125;
  long long v126 = *(_OWORD *)&v202[16];
  *(_OWORD *)a6 = *(_OWORD *)v202;
  *(_OWORD *)(a6 + 16) = v126;
  long long v127 = v206;
  *(_OWORD *)(a6 + 64) = v205;
  *(_OWORD *)(a6 + 80) = v127;
  long long v128 = v204;
  *(_OWORD *)(a6 + 32) = v203;
  *(_OWORD *)(a6 + 48) = v128;
  long long v129 = v210;
  *(_OWORD *)(a6 + 128) = v209;
  *(_OWORD *)(a6 + 144) = v129;
  long long v130 = v208;
  *(_OWORD *)(a6 + 96) = v207;
  *(_OWORD *)(a6 + 112) = v130;
  return v114;
}

uint64_t sub_262E7E448(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, double a5)
{
  if (a1
    && *(unsigned char *)(a1 + 2384)
    && a2
    && a3
    && a4
    && fabs(a4[21]) > 0.00001
    && fabs(a4[22]) > 0.00001
    && fabs(*(double *)a2) > 0.00000001
    && fabs(*(double *)a3) > 0.00000001)
  {
    uint64_t v5 = 0;
    long long v6 = *(_OWORD *)(a1 + 2536);
    long long v47 = *(_OWORD *)(a1 + 2520);
    long long v48 = v6;
    long long v49 = *(_OWORD *)(a1 + 2552);
    uint64_t v50 = *(void *)(a1 + 2568);
    long long v7 = *(_OWORD *)(a1 + 2472);
    long long v43 = *(_OWORD *)(a1 + 2456);
    long long v44 = v7;
    long long v8 = *(_OWORD *)(a1 + 2504);
    long long v45 = *(_OWORD *)(a1 + 2488);
    long long v46 = v8;
    long long v9 = *(_OWORD *)(a1 + 2408);
    long long v39 = *(_OWORD *)(a1 + 2392);
    long long v40 = v9;
    long long v10 = *(_OWORD *)(a1 + 2440);
    char v11 = 1;
    long long v41 = *(_OWORD *)(a1 + 2424);
    long long v42 = v10;
    do
    {
      char v12 = v11;
      double v13 = a4[v5 + 21];
      long long v67 = v41;
      long long v68 = v42;
      long long v71 = v45;
      long long v72 = v46;
      long long v69 = v43;
      long long v70 = v44;
      uint64_t v76 = v50;
      long long v74 = v48;
      long long v75 = v49;
      long long v73 = v47;
      long long v65 = v39;
      long long v66 = v40;
      double v14 = (double *)&v65 + v5;
      double v15 = v14[21] / v13;
      *double v14 = *v14 * v15;
      *((double *)&v66 + v5) = v15 * *((double *)&v66 + v5);
      *((double *)&v67 + v5) = v15 * *((double *)&v67 + v5);
      v14[21] = v13;
      long long v47 = v73;
      long long v48 = v74;
      long long v49 = v75;
      uint64_t v50 = v76;
      long long v43 = v69;
      long long v44 = v70;
      long long v45 = v71;
      long long v46 = v72;
      long long v39 = v65;
      long long v40 = v66;
      long long v41 = v67;
      long long v42 = v68;
      uint64_t v5 = 1;
      char v11 = 0;
    }
    while ((v12 & 1) != 0);
    uint64_t v16 = 0;
    long long v59 = v47;
    long long v60 = v48;
    long long v61 = v49;
    uint64_t v62 = v50;
    long long v55 = v43;
    long long v56 = v44;
    long long v57 = v45;
    long long v58 = v46;
    long long v51 = v39;
    long long v52 = v40;
    char v17 = 1;
    long long v53 = v41;
    long long v54 = v42;
    do
    {
      char v18 = v17;
      long long v19 = (double *)&v51 + v16;
      double *v19 = *v19 * a5;
      v19[2] = v19[2] * a5;
      v19[4] = v19[4] * a5;
      uint64_t v16 = 1;
      char v17 = 0;
    }
    while ((v18 & 1) != 0);
    uint64_t v20 = 0;
    v63[8] = v59;
    v63[9] = v60;
    double v63[10] = v61;
    uint64_t v64 = v62;
    v63[4] = v55;
    v63[5] = v56;
    v63[6] = v57;
    v63[7] = v58;
    v63[0] = v51;
    v63[1] = v52;
    v63[2] = v53;
    v63[3] = v54;
    long long v21 = *((_OWORD *)a4 + 9);
    long long v47 = *((_OWORD *)a4 + 8);
    long long v48 = v21;
    long long v49 = *((_OWORD *)a4 + 10);
    uint64_t v50 = *((void *)a4 + 22);
    long long v22 = *((_OWORD *)a4 + 5);
    long long v43 = *((_OWORD *)a4 + 4);
    long long v44 = v22;
    long long v23 = *((_OWORD *)a4 + 7);
    long long v45 = *((_OWORD *)a4 + 6);
    long long v46 = v23;
    long long v24 = *((_OWORD *)a4 + 1);
    long long v39 = *(_OWORD *)a4;
    long long v40 = v24;
    long long v25 = *((_OWORD *)a4 + 3);
    char v26 = 1;
    long long v41 = *((_OWORD *)a4 + 2);
    long long v42 = v25;
    do
    {
      char v27 = v26;
      long long v28 = (double *)v63 + v20;
      long long v29 = (double *)&v39 + v20;
      *long long v29 = *v28 + *v29;
      v29[2] = v28[2] + v29[2];
      v29[4] = v28[4] + v29[4];
      uint64_t v20 = 1;
      char v26 = 0;
    }
    while ((v27 & 1) != 0);
    uint64_t v30 = 0;
    uint64_t v76 = v50;
    *((void *)a4 + 22) = v50;
    long long v73 = v47;
    long long v74 = v48;
    long long v75 = v49;
    long long v69 = v43;
    long long v70 = v44;
    long long v71 = v45;
    long long v72 = v46;
    long long v65 = v39;
    long long v66 = v40;
    long long v67 = v41;
    long long v68 = v42;
    long long v31 = v48;
    *((_OWORD *)a4 + 8) = v47;
    *((_OWORD *)a4 + 9) = v31;
    *((_OWORD *)a4 + 10) = v75;
    long long v32 = v70;
    *((_OWORD *)a4 + 4) = v69;
    *((_OWORD *)a4 + 5) = v32;
    long long v33 = v72;
    *((_OWORD *)a4 + 6) = v71;
    *((_OWORD *)a4 + 7) = v33;
    long long v34 = v66;
    *(_OWORD *)a4 = v65;
    *((_OWORD *)a4 + 1) = v34;
    long long v35 = v68;
    *((_OWORD *)a4 + 2) = v67;
    *((_OWORD *)a4 + 3) = v35;
    double v36 = *(double *)(a1 + 2576) / *(double *)a2;
    *(double *)&long long v35 = *(double *)(a1 + 2600) * v36 * a5 + *(double *)(a2 + 24);
    *(float64x2_t *)(a2 + 8) = vaddq_f64(*(float64x2_t *)(a2 + 8), vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 2584), v36), a5));
    *(void *)(a2 + 24) = v35;
    double v37 = *(double *)(a1 + 2736) / *(double *)a3;
    *(double *)&long long v35 = *(double *)(a1 + 2760) * v37 * a5 + *(double *)(a3 + 24);
    *(float64x2_t *)(a3 + 8) = vaddq_f64(*(float64x2_t *)(a3 + 8), vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 2744), v37), a5));
    *(void *)(a3 + 24) = v35;
  }
  else
  {
    FigDebugAssert3();
    return 4294954516;
  }
  return v30;
}

uint64_t sub_262E7EAB0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, double *a5, double *a6, uint64_t a7)
{
  if (!a1 || !a2 || !a3 || a4 <= 0 || *(_DWORD *)a1 < a4 || !a5 || !a6 || !a7)
  {
    FigDebugAssert3();
    return 4294954516;
  }
  uint64_t v94 = 0;
  memset(v93, 0, sizeof(v93));
  int8x16_t v69 = 0u;
  int8x16_t v70 = 0u;
  int8x16_t v71 = 0u;
  __n128 v72 = 0u;
  float32x2_t v67 = 0;
  float32x2_t v68 = 0;
  float32x2_t v65 = 0;
  float32x2_t v66 = 0;
  float64x2_t v14 = *(float64x2_t *)(a7 + 48);
  *(float32x2_t *)&v14.f64[0] = vcvt_f32_f64(v14);
  float64x2_t v15 = *(float64x2_t *)(a7 + 80);
  *(float32x2_t *)&v15.f64[0] = vcvt_f32_f64(v15);
  float64x2_t v16 = *(float64x2_t *)(a7 + 112);
  *(float32x2_t *)&v16.f64[0] = vcvt_f32_f64(v16);
  int32x4_t v17 = vzip1q_s32((int32x4_t)v14, (int32x4_t)v16);
  int32x4_t v18 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)(a7 + 64), *(float64x2_t *)(a7 + 64)), (int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)(a7 + 128), *(float64x2_t *)(a7 + 128)));
  int32x4_t v19 = vzip2q_s32((int32x4_t)vcvt_hight_f32_f64(*(int32x2_t *)(a7 + 96), *(float64x2_t *)(a7 + 96)), (int32x4_t)0);
  v95.columns[0] = (simd_float3)vzip1q_s32(v17, (int32x4_t)v15);
  v95.columns[2] = (simd_float3)vzip1q_s32(v18, v19);
  v95.columns[1] = (simd_float3)vzip2q_s32(v17, vdupq_lane_s32(*(int32x2_t *)&v15.f64[0], 1));
  int8x16_t v63 = (int8x16_t)v95.columns[0];
  int8x16_t v64 = (int8x16_t)v95.columns[2];
  int8x16_t v61 = (int8x16_t)v95.columns[1];
  __n128 v62 = (__n128)vzip2q_s32(v18, v19);
  uint64_t v20 = sub_262E7F314((uint64_t)&v69, &v67, (int32x2_t *)&v65, v95, (float32x4_t)v62);
  if (v20)
  {
    uint64_t v41 = v20;
    goto LABEL_23;
  }
  uint64_t v21 = sub_262E7F7A0((long long *)a7, (uint64_t)v93, v69, v70, v71, v72, v67, v68, v65, v66);
  if (v21)
  {
    uint64_t v41 = v21;
    goto LABEL_23;
  }
  long long v22 = *((_OWORD *)a5 + 6);
  long long v23 = *((_OWORD *)a5 + 8);
  long long v24 = *((_OWORD *)a5 + 9);
  long long v90 = *((_OWORD *)a5 + 7);
  long long v91 = v23;
  long long v92 = v24;
  long long v25 = *((_OWORD *)a5 + 2);
  long long v26 = *((_OWORD *)a5 + 4);
  long long v27 = *((_OWORD *)a5 + 5);
  long long v86 = *((_OWORD *)a5 + 3);
  long long v87 = v26;
  long long v88 = v27;
  long long v89 = v22;
  float64x2_t v28 = *(float64x2_t *)(a5 + 2);
  long long v83 = *(_OWORD *)a5;
  float64x2_t v84 = v28;
  *(float *)&long long v22 = a5[2];
  *(float *)v28.f64 = a5[3];
  float64x2_t v84 = vcvtq_f64_f32(vmla_n_f32(vmul_n_f32(v67, *(float *)&v22), v68, *(float *)v28.f64));
  long long v85 = v25;
  long long v29 = *((_OWORD *)a6 + 6);
  long long v30 = *((_OWORD *)a6 + 8);
  long long v31 = *((_OWORD *)a6 + 9);
  long long v80 = *((_OWORD *)a6 + 7);
  long long v81 = v30;
  long long v82 = v31;
  long long v32 = *((_OWORD *)a6 + 2);
  long long v33 = *((_OWORD *)a6 + 4);
  long long v34 = *((_OWORD *)a6 + 5);
  long long v76 = *((_OWORD *)a6 + 3);
  long long v77 = v33;
  long long v78 = v34;
  long long v79 = v29;
  float64x2_t v35 = *(float64x2_t *)(a6 + 2);
  long long v73 = *(_OWORD *)a6;
  float64x2_t v74 = v35;
  *(float *)&long long v29 = a6[2];
  *(float *)&long long v30 = a6[3];
  float64x2_t v74 = vcvtq_f64_f32(vmla_n_f32(vmul_n_f32(v65, *(float *)&v29), v66, *(float *)&v30));
  long long v75 = v32;
  uint64_t v36 = sub_262E7F934(a2, a4, *(float64x2_t **)(a1 + 2896), v67, v68);
  if (v36)
  {
    uint64_t v41 = v36;
    goto LABEL_23;
  }
  uint64_t v37 = sub_262E7F934(a3, a4, *(float64x2_t **)(a1 + 2904), v65, v66);
  if (v37)
  {
    uint64_t v41 = v37;
    goto LABEL_23;
  }
  uint64_t v38 = sub_262E7FA2C(a1, *(void *)(a1 + 2896), *(void *)(a1 + 2904), a4, (double *)&v83, (double *)&v73, (uint64_t)v93);
  if (v38)
  {
    uint64_t v41 = v38;
    goto LABEL_23;
  }
  v96.columns[0] = (simd_float2)v67;
  v96.columns[1] = (simd_float2)v68;
  simd_float2x2 v39 = __invert_f2(v96);
  v97.columns[0] = (simd_float2)v65;
  v97.columns[1] = (simd_float2)v66;
  simd_float2x2 v40 = __invert_f2(v97);
  uint64_t v41 = sub_262E7F7A0(v93, a7, v63, v61, v64, v62, (float32x2_t)v39.columns[0], (float32x2_t)v39.columns[1], (float32x2_t)v40.columns[0], (float32x2_t)v40.columns[1]);
  if (v41)
  {
LABEL_23:
    FigDebugAssert3();
    return v41;
  }
  v98.columns[0] = (simd_float2)v67;
  v98.columns[1] = (simd_float2)v68;
  simd_float2x2 v42 = __invert_f2(v98);
  long long v43 = v89;
  long long v44 = v91;
  long long v45 = v92;
  *((_OWORD *)a5 + 7) = v90;
  *((_OWORD *)a5 + 8) = v44;
  *((_OWORD *)a5 + 9) = v45;
  long long v46 = v85;
  long long v47 = v87;
  long long v48 = v88;
  *((_OWORD *)a5 + 3) = v86;
  *((_OWORD *)a5 + 4) = v47;
  *((_OWORD *)a5 + 5) = v48;
  *((_OWORD *)a5 + 6) = v43;
  float64x2_t v49 = v84;
  *(_OWORD *)a5 = v83;
  *((float64x2_t *)a5 + 1) = v49;
  *(float *)&long long v43 = v84.f64[0];
  float32x2_t v50 = vmul_n_f32((float32x2_t)v42.columns[0], *(float *)&v43);
  *(float *)&long long v43 = v84.f64[1];
  *((float64x2_t *)a5 + 1) = vcvtq_f64_f32(vmla_n_f32(v50, (float32x2_t)v42.columns[1], *(float *)&v43));
  *((_OWORD *)a5 + 2) = v46;
  v99.columns[0] = (simd_float2)v65;
  v99.columns[1] = (simd_float2)v66;
  simd_float2x2 v51 = __invert_f2(v99);
  long long v52 = v79;
  long long v53 = v81;
  long long v54 = v82;
  *((_OWORD *)a6 + 7) = v80;
  *((_OWORD *)a6 + 8) = v53;
  *((_OWORD *)a6 + 9) = v54;
  long long v55 = v75;
  long long v56 = v77;
  long long v57 = v78;
  *((_OWORD *)a6 + 3) = v76;
  *((_OWORD *)a6 + 4) = v56;
  *((_OWORD *)a6 + 5) = v57;
  *((_OWORD *)a6 + 6) = v52;
  float64x2_t v58 = v74;
  *(_OWORD *)a6 = v73;
  *((float64x2_t *)a6 + 1) = v58;
  *(float *)&long long v52 = v74.f64[0];
  float32x2_t v59 = vmul_n_f32((float32x2_t)v51.columns[0], *(float *)&v52);
  *(float *)&long long v52 = v74.f64[1];
  *((float64x2_t *)a6 + 1) = vcvtq_f64_f32(vmla_n_f32(v59, (float32x2_t)v51.columns[1], *(float *)&v52));
  *((_OWORD *)a6 + 2) = v55;
  return v41;
}

__n128 sub_262E7F1C8@<Q0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v4 = v3;
    long long v5 = a1[3];
    long long v25 = a1[2];
    long long v26 = v5;
    long long v6 = a1[7];
    long long v29 = a1[6];
    long long v30 = v6;
    long long v7 = a1[5];
    long long v27 = a1[4];
    long long v28 = v7;
    uint64_t v34 = *((void *)a1 + 22);
    long long v8 = a1[10];
    long long v9 = a1[8];
    long long v32 = a1[9];
    long long v33 = v8;
    long long v31 = v9;
    long long v10 = a1[1];
    long long v23 = *a1;
    long long v24 = v10;
    char v11 = (char *)&v23 + 8 * v2;
    *(void *)&long long v10 = *((void *)v11 + 21);
    *(double *)char v11 = *(double *)&v10 * *(double *)v11;
    *((double *)&v24 + v2) = *(double *)&v10 * *((double *)&v24 + v2);
    *((double *)&v25 + v2) = *(double *)&v10 * *((double *)&v25 + v2);
    *((void *)v11 + 21) = 0x3FF0000000000000;
    long long v43 = v31;
    long long v44 = v32;
    long long v45 = v33;
    uint64_t v46 = v34;
    long long v39 = v27;
    long long v40 = v28;
    long long v41 = v29;
    long long v42 = v30;
    long long v35 = v23;
    long long v36 = v24;
    long long v37 = v25;
    long long v38 = v26;
    long long v12 = v32;
    a1[8] = v31;
    a1[9] = v12;
    a1[10] = v45;
    *((void *)a1 + 22) = v46;
    long long v13 = v40;
    a1[4] = v39;
    a1[5] = v13;
    long long v14 = v42;
    a1[6] = v41;
    a1[7] = v14;
    long long v15 = v36;
    *a1 = v35;
    a1[1] = v15;
    long long v16 = v38;
    uint64_t v2 = 1;
    a1[2] = v37;
    a1[3] = v16;
    char v3 = 0;
  }
  while ((v4 & 1) != 0);
  long long v17 = a1[9];
  *(_OWORD *)(a2 + 128) = a1[8];
  *(_OWORD *)(a2 + 144) = v17;
  *(_OWORD *)(a2 + 160) = a1[10];
  *(void *)(a2 + 176) = *((void *)a1 + 22);
  long long v18 = a1[5];
  *(_OWORD *)(a2 + 64) = a1[4];
  *(_OWORD *)(a2 + 80) = v18;
  long long v19 = a1[7];
  *(_OWORD *)(a2 + 96) = a1[6];
  *(_OWORD *)(a2 + 112) = v19;
  long long v20 = a1[1];
  *(_OWORD *)a2 = *a1;
  *(_OWORD *)(a2 + 16) = v20;
  __n128 result = (__n128)a1[2];
  long long v22 = a1[3];
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v22;
  return result;
}

uint64_t sub_262E7F314(uint64_t a1, void *a2, int32x2_t *a3, simd_float3x3 a4, float32x4_t a5)
{
  if (!a1) {
    goto LABEL_28;
  }
  if (!a2) {
    goto LABEL_28;
  }
  if (!a3) {
    goto LABEL_28;
  }
  simd_float3x3 v52 = a4;
  a4.columns[0].i32[3] = 0;
  a4.columns[1].i32[3] = 0;
  a4.columns[2].i32[3] = 0;
  simd_float3x3 v61 = __invert_f3(a4);
  float32x4_t v8 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v61.columns[0], a5.f32[0]), (float32x4_t)v61.columns[1], *(float32x2_t *)a5.f32, 1), (float32x4_t)v61.columns[2], a5, 2);
  float v9 = sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v8, v8)));
  if (v9 <= 0.0) {
    goto LABEL_28;
  }
  unint64_t v10 = vnegq_f32(v8).u64[0];
  float v11 = fabsf(*((float *)&v10 + 1));
  float v12 = fabsf(*(float *)&v10);
  if (v11 >= v12 && *((float *)&v10 + 1) >= 0.0)
  {
    *(float *)&uint64_t v13 = *((float *)&v10 + 1) / v9;
    float v14 = (float)-*(float *)&v10 / v9;
LABEL_11:
    float v15 = -v14;
    LODWORD(v16) = v13;
    goto LABEL_12;
  }
  if (v11 >= v12 && *((float *)&v10 + 1) < 0.0)
  {
    *(float *)&uint64_t v13 = (float)-*((float *)&v10 + 1) / v9;
    float v14 = *(float *)&v10 / v9;
    goto LABEL_11;
  }
  if (v12 <= v11 || *(float *)&v10 < 0.0)
  {
    uint64_t result = 4294954516;
    if (v12 <= v11 || *(float *)&v10 >= 0.0) {
      return result;
    }
    *(float *)&uint64_t v13 = *((float *)&v10 + 1) / v9;
    float v14 = (float)-*(float *)&v10 / v9;
  }
  else
  {
    *(float *)&uint64_t v13 = (float)-*((float *)&v10 + 1) / v9;
    float v14 = *(float *)&v10 / v9;
  }
  float v16 = -*(float *)&v13;
  float v15 = v14;
LABEL_12:
  *((float *)&v13 + 1) = v15;
  unint64_t v17 = __PAIR64__(LODWORD(v16), LODWORD(v14));
  uint64_t v51 = v13;
  float v49 = v14;
  unint64_t v50 = __PAIR64__(LODWORD(v16), LODWORD(v14));
  simd_float2x2 v18 = __invert_f2(*(simd_float2x2 *)&v13);
  uint64_t v19 = 0;
  float32x2x2_t v26 = (float32x2x2_t)vzip1q_s32((int32x4_t)__PAIR64__(v18.columns[1].u32[0], v18.columns[0].u32[0]), (int32x4_t)0);
  float32x2x2_t v20 = (float32x2x2_t)vzip2q_s32((int32x4_t)__PAIR64__(v18.columns[1].u32[0], v18.columns[0].u32[0]), (int32x4_t)xmmword_262E89A60);
  int32x4_t v21 = vzip1q_s32((int32x4_t)__PAIR64__(v18.columns[1].u32[1], v18.columns[0].u32[1]), (int32x4_t)0);
  long long v22 = (float *)v54;
  vst2_f32(v22, v26);
  v22 += 4;
  *(int32x4_t *)long long v22 = vzip2q_s32((int32x4_t)v26, v21);
  int32x4_t v23 = vzip2q_s32((int32x4_t)__PAIR64__(v18.columns[1].u32[1], v18.columns[0].u32[1]), (int32x4_t)xmmword_262E89AA0);
  long long v24 = (float *)&v55;
  vst2_f32(v24, v20);
  int32x4_t v56 = vzip2q_s32((int32x4_t)v20, v23);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  int32x4_t v60 = 0u;
  v25.i64[1] = v52.columns[2].i64[1];
  v26.val[1] = (float32x2_t)v52.columns[1].i64[1];
  do
  {
    float32x4_t v27 = (float32x4_t)v54[v19];
    *(long long *)((char *)&v57 + v19 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v52.columns[0], v27.f32[0]), (float32x4_t)v52.columns[1], *(float32x2_t *)v27.f32, 1), (float32x4_t)v52.columns[2], v27, 2), a5, v27, 3);
    ++v19;
  }
  while (v19 != 4);
  _V2.S[1] = DWORD1(v57);
  _S0 = DWORD1(v57);
  __asm { FMLA            S1, S0, V2.S[1] }
  v27.f32[0] = sqrtf(_S1);
  if (v27.f32[0] <= 0.0)
  {
LABEL_28:
    FigDebugAssert3();
    return 4294954516;
  }
  uint64_t v35 = 0;
  *(float32x2_t *)v25.i8 = vdiv_f32(*(float32x2_t *)&v57, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.f32, 0));
  unsigned int v36 = v49 > 0.0;
  if (fabsf(*(float *)&v25.i32[1]) <= fabsf(*(float *)v25.i32)) {
    unsigned int v36 = 0;
  }
  int8x8_t v37 = (int8x8_t)vrev64_s32(*(int32x2_t *)v25.i8);
  v38.i32[0] = v37.i32[0];
  *(float *)&v38.i32[1] = -*(float *)v25.i32;
  *(float *)v37.i32 = -*(float *)&v25.i32[1];
  v26.val[0] = (float32x2_t)vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v36), 0x1FuLL)), v38, v37);
  int8x16_t v39 = (int8x16_t)vzip1q_s32(v25, (int32x4_t)v26);
  int32x2_t v40 = vzip1_s32(*(int32x2_t *)v25.i8, (int32x2_t)v26.val[0]);
  int32x4_t v41 = vzip1q_s32(v25, (int32x4_t)0);
  v25.i64[1] = (uint64_t)v26.val[0];
  float32x4_t v42 = (float32x4_t)vuzp1q_s32(v25, v25);
  v42.i32[2] = 0;
  float32x4_t v43 = (float32x4_t)vzip2q_s32(v41, vdupq_lane_s32((int32x2_t)v26.val[0], 1));
  v54[0] = v57;
  v54[1] = v58;
  long long v55 = v59;
  int32x4_t v56 = v60;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  int32x4_t v60 = 0u;
  do
  {
    *(long long *)((char *)&v57 + v35 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, COERCE_FLOAT(v54[v35])), v43, *(float32x2_t *)&v54[v35], 1), (float32x4_t)xmmword_262E89A60, (float32x4_t)v54[v35], 2);
    ++v35;
  }
  while (v35 != 4);
  uint64_t result = 0;
  uint64_t v45 = v57;
  long long v46 = v58;
  long long v47 = v59;
  int32x4_t v48 = v60;
  *(_DWORD *)(a1 + 8) = DWORD2(v57);
  *(_DWORD *)(a1 + 24) = DWORD2(v46);
  *(_DWORD *)(a1 + 40) = DWORD2(v47);
  *(_DWORD *)(a1 + 56) = v48.i32[2];
  *(void *)a1 = v45;
  *(_DWORD *)(a1 + 12) = 0;
  *(void *)(a1 + 16) = v46;
  *(_DWORD *)(a1 + 28) = 0;
  *(void *)(a1 + 32) = v47;
  *(_DWORD *)(a1 + 44) = 0;
  *(void *)(a1 + 48) = v48.i64[0];
  *(_DWORD *)(a1 + 60) = 0;
  *a2 = v51;
  a2[1] = v50;
  *a3 = v40;
  a3[1] = (int32x2_t)vextq_s8(v39, v39, 8uLL).u64[0];
  return result;
}

uint64_t sub_262E7F7A0(long long *a1, uint64_t a2, int8x16_t a3, int8x16_t a4, int8x16_t a5, __n128 a6, float32x2_t a7, float32x2_t a8, float32x2_t a9, float32x2_t a10)
{
  if (a1 && a2)
  {
    uint64_t result = 0;
    long long v12 = *a1;
    long long v13 = a1[1];
    long long v14 = a1[3];
    *(_OWORD *)(a2 + 32) = a1[2];
    *(_OWORD *)(a2 + 48) = v14;
    *(_OWORD *)a2 = v12;
    *(_OWORD *)(a2 + 16) = v13;
    long long v15 = a1[4];
    long long v16 = a1[5];
    long long v17 = a1[7];
    *(_OWORD *)(a2 + 96) = a1[6];
    *(_OWORD *)(a2 + 112) = v17;
    *(_OWORD *)(a2 + 64) = v15;
    *(_OWORD *)(a2 + 80) = v16;
    long long v18 = a1[8];
    long long v19 = a1[9];
    long long v20 = a1[10];
    *(void *)(a2 + 176) = *((void *)a1 + 22);
    *(_OWORD *)(a2 + 144) = v19;
    *(_OWORD *)(a2 + 160) = v20;
    *(_OWORD *)(a2 + 128) = v18;
    *(float *)&long long v18 = *((double *)a1 + 2);
    *(float *)&long long v20 = *((double *)a1 + 4);
    int32x2_t v21 = (int32x2_t)vmla_n_f32(vmul_n_f32(a7, *(float *)&v18), a8, *(float *)&v20);
    float v22 = *((double *)a1 + 3);
    *(float *)&long long v18 = *((double *)a1 + 5);
    int32x2_t v23 = (int32x2_t)vmla_n_f32(vmul_n_f32(a9, v22), a10, *(float *)&v18);
    *(float64x2_t *)(a2 + 16) = vcvtq_f64_f32((float32x2_t)vzip1_s32(v21, v23));
    *(float64x2_t *)(a2 + 32) = vcvtq_f64_f32((float32x2_t)vzip2_s32(v21, v23));
    *(double *)(a2 + 48) = *(float *)a3.i32;
    *(double *)(a2 + 56) = *(float *)a4.i32;
    *(double *)(a2 + 64) = *(float *)a5.i32;
    *(float64x2_t *)(a2 + 72) = vcvtq_f64_f32((float32x2_t)__PAIR64__(a3.u32[1], a6.n128_u32[0]));
    *(float64x2_t *)(a2 + 88) = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)a4.i8, *(int32x2_t *)a5.i8));
    *(float64x2_t *)(a2 + 104) = vcvtq_f64_f32((float32x2_t)vext_s8((int8x8_t)a6.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8(a3, a3, 8uLL), 4uLL));
    *(float64x2_t *)(a2 + 120) = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a4, a4, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a5, a5, 8uLL)));
    *(double *)(a2 + 136) = a6.n128_f32[2];
  }
  else
  {
    FigDebugAssert3();
    return 4294954516;
  }
  return result;
}

uint64_t sub_262E7F934(uint64_t a1, int a2, float64x2_t *a3, float32x2_t a4, float32x2_t a5)
{
  if (a1 && a3)
  {
    if (a2 >= 1)
    {
      uint64_t v5 = a2;
      long long v6 = (double *)(a1 + 8);
      do
      {
        float v7 = *(v6 - 1);
        float v8 = *v6;
        *a3++ = vcvtq_f64_f32(vmla_n_f32(vmul_n_f32(a4, v7), a5, v8));
        v6 += 2;
        --v5;
      }
      while (v5);
    }
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return 4294954516;
  }
}

uint64_t sub_262E7FA2C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, double *a5, double *a6, uint64_t a7)
{
  if (!a1 || !a2 || !a3 || a4 <= 0 || *(_DWORD *)a1 < a4 || !a5 || !a6 || !a7)
  {
    FigDebugAssert3();
    return 4294954516;
  }
  bzero((void *)(a1 + 520), 0x748uLL);
  uint64_t v14 = sub_262E80F58(a2, a4, a5, *(void *)(a1 + 2912));
  if (v14)
  {
    uint64_t v67 = v14;
    goto LABEL_29;
  }
  uint64_t v15 = sub_262E80F58(a3, a4, a6, *(void *)(a1 + 2920));
  if (v15)
  {
    uint64_t v67 = v15;
    goto LABEL_29;
  }
  sub_262E801E4(*(void *)(a1 + 2912), *(void *)(a1 + 2920), a4, (long long *)a7, a1 + 8, a1 + 520, (uint64_t)v102);
  long long v16 = v102[9];
  *(_OWORD *)(a7 + 128) = v102[8];
  *(_OWORD *)(a7 + 144) = v16;
  *(_OWORD *)(a7 + 160) = v102[10];
  *(void *)(a7 + 176) = v103;
  long long v17 = v102[5];
  *(_OWORD *)(a7 + 64) = v102[4];
  *(_OWORD *)(a7 + 80) = v17;
  long long v18 = v102[7];
  *(_OWORD *)(a7 + 96) = v102[6];
  *(_OWORD *)(a7 + 112) = v18;
  long long v19 = v102[1];
  *(_OWORD *)a7 = v102[0];
  *(_OWORD *)(a7 + 16) = v19;
  long long v20 = v102[3];
  *(_OWORD *)(a7 + 32) = v102[2];
  *(_OWORD *)(a7 + 48) = v20;
  if (!*(unsigned char *)(a1 + 400))
  {
    long long v95 = 0u;
    long long v96 = 0u;
    memset(v97, 0, sizeof(v97));
    unsigned long long v98 = 0u;
    unsigned long long v99 = 0u;
    *(void *)&long long v100 = 0;
    unint64_t v39 = *(void *)(a1 + 24);
    *((void *)&v95 + 1) = *(void *)(a1 + 16);
    *(void *)&long long v96 = v39;
    unint64_t v40 = *(void *)(a1 + 40);
    *((void *)&v96 + 1) = *(void *)(a1 + 32);
    *(void *)&v97[0] = v40;
    *(_OWORD *)((char *)v97 + 8) = *(_OWORD *)(a1 + 48);
    *((void *)&v97[1] + 1) = *(void *)(a1 + 64);
    unsigned long long v98 = __PAIR128__(*((unint64_t *)&v96 + 1), v39);
    unsigned long long v99 = __PAIR128__(*((unint64_t *)&v97[0] + 1), v40);
    LODWORD(v100) = *(_DWORD *)(a1 + 88);
    *((void *)&v100 + 1) = *(void *)(a1 + 128);
    uint64_t v101 = 0x3E800000064;
    LOWORD(v95) = 257;
    long long v41 = *((_OWORD *)a5 + 1);
    *(_OWORD *)(a1 + 1528) = *(_OWORD *)a5;
    *(_OWORD *)(a1 + 1544) = v41;
    long long v42 = *((_OWORD *)a5 + 2);
    long long v43 = *((_OWORD *)a5 + 3);
    long long v44 = *((_OWORD *)a5 + 4);
    *(_OWORD *)(a1 + 1608) = *((_OWORD *)a5 + 5);
    *(_OWORD *)(a1 + 1592) = v44;
    *(_OWORD *)(a1 + 1576) = v43;
    *(_OWORD *)(a1 + 1560) = v42;
    long long v45 = *((_OWORD *)a5 + 6);
    long long v46 = *((_OWORD *)a5 + 7);
    long long v47 = *((_OWORD *)a5 + 8);
    *(_OWORD *)(a1 + 1672) = *((_OWORD *)a5 + 9);
    *(_OWORD *)(a1 + 1656) = v47;
    *(_OWORD *)(a1 + 1640) = v46;
    *(_OWORD *)(a1 + 1624) = v45;
    long long v48 = *(_OWORD *)a6;
    *(_OWORD *)(a1 + 1704) = *((_OWORD *)a6 + 1);
    *(_OWORD *)(a1 + 1688) = v48;
    long long v49 = *((_OWORD *)a6 + 2);
    long long v50 = *((_OWORD *)a6 + 3);
    long long v51 = *((_OWORD *)a6 + 4);
    *(_OWORD *)(a1 + 1768) = *((_OWORD *)a6 + 5);
    *(_OWORD *)(a1 + 1752) = v51;
    *(_OWORD *)(a1 + 1736) = v50;
    *(_OWORD *)(a1 + 1720) = v49;
    long long v52 = *((_OWORD *)a6 + 6);
    long long v53 = *((_OWORD *)a6 + 7);
    long long v54 = *((_OWORD *)a6 + 8);
    *(_OWORD *)(a1 + 1832) = *((_OWORD *)a6 + 9);
    *(_OWORD *)(a1 + 1816) = v54;
    *(_OWORD *)(a1 + 1800) = v53;
    *(_OWORD *)(a1 + 1784) = v52;
LABEL_15:
    sub_262E82CB0(*(void *)(a1 + 2912), *(void *)(a1 + 2920), a4, a7, *(double **)(a1 + 2944));
    signed int v55 = 0;
    int32x4_t v56 = *(double **)(a1 + 2944);
    double v57 = *((double *)&v95 + 1);
    long long v58 = (void *)(a3 + 8);
    long long v59 = (void *)(a2 + 8);
    uint64_t v60 = a4;
    do
    {
      if (*v56 < v57)
      {
        uint64_t v61 = *(void *)(a1 + 2928);
        int v62 = 2 * v55;
        *(void *)(v61 + 8 * v62) = *(v59 - 1);
        uint64_t v63 = (16 * v55) | 8;
        *(void *)(v61 + v63) = *v59;
        uint64_t v64 = *(void *)(a1 + 2936);
        *(void *)(v64 + 8 * v62) = *(v58 - 1);
        *(void *)(v64 + v63) = *v58;
        ++v55;
      }
      ++v56;
      v58 += 2;
      v59 += 2;
      --v60;
    }
    while (v60);
    *(_DWORD *)(a1 + 1848) = v55;
    if (v55 < (int)v100) {
      return 0;
    }
    *(unsigned char *)(a1 + 1852) = 1;
    uint64_t v93 = 0;
    uint64_t v94 = 0;
    uint64_t v92 = 0;
    uint64_t v65 = sub_262E83D70(*(void *)(a1 + 2928), *(void *)(a1 + 2936), v55, a5, a6, (double *)a7, (uint64_t)&v95, (uint64_t)&v92);
    if (!v65)
    {
      uint64_t v66 = v94;
      *(void *)(a1 + 1856) = v93;
      *(_DWORD *)(a1 + 1864) = v92;
      *(unsigned char *)(a1 + 1868) = BYTE4(v92);
      *(void *)(a1 + 1872) = v66;
      goto LABEL_22;
    }
    uint64_t v67 = v65;
LABEL_29:
    FigDebugAssert3();
    return v67;
  }
  unsigned long long v21 = *(_OWORD *)(a1 + 480);
  unsigned long long v98 = *(_OWORD *)(a1 + 464);
  unsigned long long v99 = v21;
  long long v100 = *(_OWORD *)(a1 + 496);
  uint64_t v101 = *(void *)(a1 + 512);
  long long v22 = *(_OWORD *)(a1 + 416);
  long long v95 = *(_OWORD *)(a1 + 400);
  long long v96 = v22;
  long long v23 = *(_OWORD *)(a1 + 448);
  v97[0] = *(_OWORD *)(a1 + 432);
  v97[1] = v23;
  int v24 = BYTE1(v95);
  long long v25 = *((_OWORD *)a5 + 1);
  *(_OWORD *)(a1 + 1528) = *(_OWORD *)a5;
  *(_OWORD *)(a1 + 1544) = v25;
  long long v26 = *((_OWORD *)a5 + 2);
  long long v27 = *((_OWORD *)a5 + 3);
  long long v28 = *((_OWORD *)a5 + 4);
  *(_OWORD *)(a1 + 1608) = *((_OWORD *)a5 + 5);
  *(_OWORD *)(a1 + 1592) = v28;
  *(_OWORD *)(a1 + 1576) = v27;
  *(_OWORD *)(a1 + 1560) = v26;
  long long v29 = *((_OWORD *)a5 + 6);
  long long v30 = *((_OWORD *)a5 + 7);
  long long v31 = *((_OWORD *)a5 + 8);
  *(_OWORD *)(a1 + 1672) = *((_OWORD *)a5 + 9);
  *(_OWORD *)(a1 + 1656) = v31;
  *(_OWORD *)(a1 + 1640) = v30;
  *(_OWORD *)(a1 + 1624) = v29;
  long long v32 = *(_OWORD *)a6;
  *(_OWORD *)(a1 + 1704) = *((_OWORD *)a6 + 1);
  *(_OWORD *)(a1 + 1688) = v32;
  long long v33 = *((_OWORD *)a6 + 2);
  long long v34 = *((_OWORD *)a6 + 3);
  long long v35 = *((_OWORD *)a6 + 4);
  *(_OWORD *)(a1 + 1768) = *((_OWORD *)a6 + 5);
  *(_OWORD *)(a1 + 1752) = v35;
  *(_OWORD *)(a1 + 1736) = v34;
  *(_OWORD *)(a1 + 1720) = v33;
  long long v36 = *((_OWORD *)a6 + 6);
  long long v37 = *((_OWORD *)a6 + 7);
  long long v38 = *((_OWORD *)a6 + 8);
  *(_OWORD *)(a1 + 1832) = *((_OWORD *)a6 + 9);
  *(_OWORD *)(a1 + 1816) = v38;
  *(_OWORD *)(a1 + 1800) = v37;
  *(_OWORD *)(a1 + 1784) = v36;
  if (v24) {
    goto LABEL_15;
  }
  *(unsigned char *)(a1 + 1868) = 1;
  *(unsigned char *)(a1 + 1852) = 1;
LABEL_22:
  uint64_t v67 = 0;
  long long v68 = *(_OWORD *)a7;
  long long v69 = *(_OWORD *)(a7 + 16);
  long long v70 = *(_OWORD *)(a7 + 32);
  *(_OWORD *)(a1 + 1928) = *(_OWORD *)(a7 + 48);
  *(_OWORD *)(a1 + 1912) = v70;
  *(_OWORD *)(a1 + 1896) = v69;
  *(_OWORD *)(a1 + 1880) = v68;
  long long v71 = *(_OWORD *)(a7 + 64);
  long long v72 = *(_OWORD *)(a7 + 80);
  long long v73 = *(_OWORD *)(a7 + 96);
  *(_OWORD *)(a1 + 1992) = *(_OWORD *)(a7 + 112);
  *(_OWORD *)(a1 + 1976) = v73;
  *(_OWORD *)(a1 + 1960) = v72;
  *(_OWORD *)(a1 + 1944) = v71;
  long long v74 = *(_OWORD *)(a7 + 128);
  long long v75 = *(_OWORD *)(a7 + 144);
  long long v76 = *(_OWORD *)(a7 + 160);
  *(void *)(a1 + 2056) = *(void *)(a7 + 176);
  *(_OWORD *)(a1 + 2040) = v76;
  *(_OWORD *)(a1 + 2024) = v75;
  *(_OWORD *)(a1 + 2008) = v74;
  long long v77 = *(_OWORD *)a5;
  *(_OWORD *)(a1 + 2080) = *((_OWORD *)a5 + 1);
  *(_OWORD *)(a1 + 2064) = v77;
  long long v78 = *((_OWORD *)a5 + 2);
  long long v79 = *((_OWORD *)a5 + 3);
  long long v80 = *((_OWORD *)a5 + 4);
  *(_OWORD *)(a1 + 2144) = *((_OWORD *)a5 + 5);
  *(_OWORD *)(a1 + 2128) = v80;
  *(_OWORD *)(a1 + 2112) = v79;
  *(_OWORD *)(a1 + 2096) = v78;
  long long v81 = *((_OWORD *)a5 + 6);
  long long v82 = *((_OWORD *)a5 + 7);
  long long v83 = *((_OWORD *)a5 + 8);
  *(_OWORD *)(a1 + 2208) = *((_OWORD *)a5 + 9);
  *(_OWORD *)(a1 + 2192) = v83;
  *(_OWORD *)(a1 + 2176) = v82;
  *(_OWORD *)(a1 + 2160) = v81;
  long long v84 = *(_OWORD *)a6;
  *(_OWORD *)(a1 + 2240) = *((_OWORD *)a6 + 1);
  *(_OWORD *)(a1 + 2224) = v84;
  long long v85 = *((_OWORD *)a6 + 2);
  long long v86 = *((_OWORD *)a6 + 3);
  long long v87 = *((_OWORD *)a6 + 4);
  *(_OWORD *)(a1 + 2304) = *((_OWORD *)a6 + 5);
  *(_OWORD *)(a1 + 2288) = v87;
  *(_OWORD *)(a1 + 2272) = v86;
  *(_OWORD *)(a1 + 2256) = v85;
  long long v88 = *((_OWORD *)a6 + 6);
  long long v89 = *((_OWORD *)a6 + 7);
  long long v90 = *((_OWORD *)a6 + 8);
  *(_OWORD *)(a1 + 2368) = *((_OWORD *)a6 + 9);
  *(_OWORD *)(a1 + 2352) = v90;
  *(_OWORD *)(a1 + 2336) = v89;
  *(_OWORD *)(a1 + 2320) = v88;
  return v67;
}

void sub_262E801E4(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, long long *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v206 = *MEMORY[0x263EF8340];
  memset(&v205[24], 0, 187);
  memset(&v205[12], 0, 186);
  char v204 = 0;
  __int16 v203 = 0;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  uint64_t v202 = 0;
  memset(v205, 0, 187);
  char v190 = 0;
  __int16 v189 = 0;
  uint64_t v188 = 0;
  long long v187 = 0u;
  long long v186 = 0u;
  long long v185 = 0u;
  long long v184 = 0u;
  long long v183 = 0u;
  long long v182 = 0u;
  long long v181 = 0u;
  long long v180 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  long long v177 = 0u;
  bzero(__src, 0x358uLL);
  *(void *)(a7 + 176) = 0;
  *(_OWORD *)(a7 + 144) = 0u;
  *(_OWORD *)(a7 + 160) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)a7 = 0u;
  if (*(unsigned char *)(a5 + 152))
  {
    long long v12 = *(_OWORD *)(a5 + 248);
    unsigned long long v172 = *(_OWORD *)(a5 + 232);
    long long v173 = v12;
    long long v13 = *(_OWORD *)(a5 + 216);
    uint64_t v174 = *(void *)(a5 + 264);
    long long v14 = *(_OWORD *)(a5 + 168);
    long long v168 = *(_OWORD *)(a5 + 152);
    long long v169 = v14;
    long long v15 = *(_OWORD *)(a5 + 200);
    v170[0] = *(_OWORD *)(a5 + 184);
    v170[1] = v15;
    long long v171 = v13;
    int v16 = v12;
  }
  else
  {
    double v17 = *(double *)a5;
    long long v168 = 0uLL;
    long long v169 = 0uLL;
    memset(v170, 0, sizeof(v170));
    long long v171 = 0uLL;
    unsigned long long v172 = 0uLL;
    *(void *)&long long v173 = 0;
    uint64_t v18 = *(void *)(a5 + 16);
    uint64_t v19 = *(void *)(a5 + 24);
    *((double *)&v168 + 1) = v17;
    *(void *)&long long v169 = v18;
    unint64_t v20 = *(void *)(a5 + 32);
    *((void *)&v169 + 1) = v19;
    *(void *)&v170[0] = v20;
    *(_OWORD *)((char *)v170 + 8) = *(_OWORD *)(a5 + 40);
    *((void *)&v170[1] + 1) = *(void *)(a5 + 56);
    *(void *)&long long v171 = v18;
    *((void *)&v171 + 1) = v19;
    unsigned long long v172 = __PAIR128__(*((unint64_t *)&v170[0] + 1), v20);
    int v16 = *(_DWORD *)(a5 + 80);
    LODWORD(v173) = v16;
    *((void *)&v173 + 1) = *(void *)(a5 + 120);
    uint64_t v174 = 0x3E800000032;
    LOWORD(v168) = 257;
  }
  long long v22 = a4[8];
  long long v21 = a4[9];
  long long v23 = a4[7];
  *(_OWORD *)(a7 + 128) = v22;
  *(_OWORD *)(a7 + 144) = v21;
  long long v24 = a4[9];
  *(_OWORD *)(a7 + 160) = a4[10];
  long long v26 = a4[4];
  long long v25 = a4[5];
  long long v27 = a4[3];
  *(_OWORD *)(a7 + 64) = v26;
  *(_OWORD *)(a7 + 80) = v25;
  long long v28 = a4[5];
  long long v30 = a4[6];
  long long v29 = a4[7];
  *(_OWORD *)(a7 + 96) = v30;
  *(_OWORD *)(a7 + 112) = v29;
  long long v31 = a4[1];
  *(_OWORD *)a7 = *a4;
  *(_OWORD *)(a7 + 16) = v31;
  long long v32 = a4[3];
  long long v34 = *a4;
  long long v33 = a4[1];
  long long v35 = a4[2];
  *(_OWORD *)(a7 + 32) = v35;
  *(_OWORD *)(a7 + 48) = v32;
  *(_OWORD *)((char *)&v205[32] + 3) = v22;
  *(_OWORD *)((char *)&v205[33] + 3) = v24;
  *(_OWORD *)((char *)&v205[34] + 3) = a4[10];
  *(_OWORD *)((char *)&v205[28] + 3) = v26;
  *(_OWORD *)((char *)&v205[29] + 3) = v28;
  *(_OWORD *)((char *)&v205[30] + 3) = v30;
  *(_OWORD *)((char *)&v205[31] + 3) = v23;
  *(_OWORD *)((char *)&v205[24] + 3) = v34;
  *(_OWORD *)((char *)&v205[25] + 3) = v33;
  *(_OWORD *)((char *)&v205[26] + 3) = v35;
  uint64_t v175 = 0;
  *(void *)(a7 + 176) = *((void *)a4 + 22);
  uint64_t v36 = *((void *)a4 + 22);
  *(_OWORD *)((char *)&v205[27] + 3) = v27;
  double v37 = 0.0;
  *(void *)((char *)&v205[35] + 3) = v36;
  if (v16 > a3)
  {
    double v138 = 0;
    double v140 = 0;
    long long v70 = 0;
    char v102 = 0;
    uint64_t v132 = 0;
    uint64_t v133 = 0;
    char v103 = 0;
    int v136 = 0;
    char v104 = 0;
    char v130 = 0;
    int v131 = 0;
    double v137 = 0;
    uint64_t v56 = 0;
    uint64_t v55 = 0;
    double v78 = 0.0;
    uint64_t v95 = 0;
LABEL_31:
    uint64_t v96 = 0;
    goto LABEL_24;
  }
  size_t v38 = 16 * a3;
  HIDWORD(v175) = 0;
  double v137 = (double *)malloc_type_malloc(v38, 0x100004000313F17uLL);
  double v138 = (double *)malloc_type_malloc(v38, 0x100004000313F17uLL);
  sub_262E76B08(a1, a2, a3, a7, (uint64_t)v137, (uint64_t)v138, (_DWORD *)&v175 + 1, *((double *)&v168 + 1));
  HIDWORD(v133) = HIDWORD(v175);
  if (SHIDWORD(v175) < (int)v173)
  {
    double v140 = 0;
    long long v70 = 0;
    char v103 = 0;
    LOBYTE(v133) = 0;
    uint64_t v132 = 0;
    int v136 = 0;
    char v104 = 0;
    char v130 = 0;
    int v131 = 0;
    uint64_t v56 = 0;
    uint64_t v55 = 0;
    double v78 = 0.0;
    uint64_t v95 = 0;
    uint64_t v96 = 0;
    char v102 = 1;
    goto LABEL_24;
  }
  if (*(unsigned char *)(a5 + 112))
  {
    sub_262E80D68(v137, v138, SHIDWORD(v175), a7, (uint64_t)&v156);
    long long v39 = v165;
    *(_OWORD *)(a7 + 128) = v164;
    *(_OWORD *)(a7 + 144) = v39;
    *(_OWORD *)(a7 + 160) = v166;
    long long v40 = v161;
    *(_OWORD *)(a7 + 64) = v160;
    *(_OWORD *)(a7 + 80) = v40;
    long long v41 = v163;
    *(_OWORD *)(a7 + 96) = v162;
    *(_OWORD *)(a7 + 112) = v41;
    long long v42 = v157;
    *(_OWORD *)a7 = v156;
    *(_OWORD *)(a7 + 16) = v42;
    long long v43 = v159;
    *(_OWORD *)(a7 + 32) = v158;
    *(_OWORD *)(a7 + 48) = v43;
    long long v44 = *(_OWORD *)(a7 + 144);
    *(_OWORD *)((char *)&v205[20] + 2) = *(_OWORD *)(a7 + 128);
    *(_OWORD *)((char *)&v205[21] + 2) = v44;
    *(_OWORD *)((char *)&v205[22] + 2) = *(_OWORD *)(a7 + 160);
    long long v45 = *(_OWORD *)(a7 + 80);
    *(_OWORD *)((char *)&v205[16] + 2) = *(_OWORD *)(a7 + 64);
    *(_OWORD *)((char *)&v205[17] + 2) = v45;
    long long v46 = *(_OWORD *)(a7 + 112);
    *(_OWORD *)((char *)&v205[18] + 2) = *(_OWORD *)(a7 + 96);
    *(_OWORD *)((char *)&v205[19] + 2) = v46;
    long long v47 = *(_OWORD *)(a7 + 16);
    *(_OWORD *)((char *)&v205[12] + 2) = *(_OWORD *)a7;
    *(_OWORD *)((char *)&v205[13] + 2) = v47;
    long long v48 = *(_OWORD *)(a7 + 48);
    *(_OWORD *)((char *)&v205[14] + 2) = *(_OWORD *)(a7 + 32);
    uint64_t v49 = v167;
    *(void *)(a7 + 176) = v167;
    *(void *)((char *)&v205[23] + 2) = v49;
    LOBYTE(v133) = 1;
    *(_OWORD *)((char *)&v205[15] + 2) = v48;
  }
  else
  {
    LOBYTE(v133) = 0;
  }
  uint64_t v153 = 0;
  uint64_t v154 = 0;
  uint64_t v155 = 0;
  if (BYTE1(v168))
  {
    sub_262E83B00((uint64_t)v137, (uint64_t)v138, HIDWORD(v175), a7, (uint64_t)&v168, (uint64_t)&v153, (uint64_t)&v156);
    long long v50 = v165;
    *(_OWORD *)(a7 + 128) = v164;
    *(_OWORD *)(a7 + 144) = v50;
    *(_OWORD *)(a7 + 160) = v166;
    *(void *)(a7 + 176) = v167;
    long long v51 = v161;
    *(_OWORD *)(a7 + 64) = v160;
    *(_OWORD *)(a7 + 80) = v51;
    long long v52 = v163;
    *(_OWORD *)(a7 + 96) = v162;
    *(_OWORD *)(a7 + 112) = v52;
    long long v53 = v157;
    *(_OWORD *)a7 = v156;
    *(_OWORD *)(a7 + 16) = v53;
    long long v54 = v159;
    *(_OWORD *)(a7 + 32) = v158;
    *(_OWORD *)(a7 + 48) = v54;
    LOBYTE(v132) = BYTE4(v153);
    HIDWORD(v132) = v153;
    uint64_t v56 = v154;
    uint64_t v55 = v155;
  }
  else
  {
    uint64_t v132 = 1;
    BYTE4(v153) = 1;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
  }
  int v134 = a3;
  long long v57 = *(_OWORD *)(a7 + 144);
  long long v199 = *(_OWORD *)(a7 + 128);
  long long v200 = v57;
  long long v201 = *(_OWORD *)(a7 + 160);
  long long v58 = *(_OWORD *)(a7 + 80);
  long long v195 = *(_OWORD *)(a7 + 64);
  long long v196 = v58;
  long long v59 = *(_OWORD *)(a7 + 112);
  long long v197 = *(_OWORD *)(a7 + 96);
  long long v198 = v59;
  long long v60 = *(_OWORD *)(a7 + 16);
  long long v191 = *(_OWORD *)a7;
  long long v192 = v60;
  long long v61 = *(_OWORD *)(a7 + 48);
  long long v193 = *(_OWORD *)(a7 + 32);
  uint64_t v202 = *(void *)(a7 + 176);
  long long v194 = v61;
  if (*(unsigned char *)(a5 + 272))
  {
    unsigned long long v62 = *(_OWORD *)(a5 + 352);
    long long v151 = *(_OWORD *)(a5 + 368);
    unsigned long long v149 = *(_OWORD *)(a5 + 336);
    unsigned long long v150 = v62;
    uint64_t v152 = *(void *)(a5 + 384);
    long long v63 = *(_OWORD *)(a5 + 288);
    long long v146 = *(_OWORD *)(a5 + 272);
    long long v147 = v63;
    long long v64 = *(_OWORD *)(a5 + 320);
    v148[0] = *(_OWORD *)(a5 + 304);
    v148[1] = v64;
    double v65 = *((double *)&v146 + 1);
    int v66 = v151;
  }
  else
  {
    long long v146 = 0u;
    long long v147 = 0u;
    memset(v148, 0, sizeof(v148));
    unsigned long long v149 = 0u;
    unsigned long long v150 = 0u;
    *(void *)&long long v151 = 0;
    double v65 = *(double *)(a5 + 8);
    unint64_t v67 = *(void *)(a5 + 16);
    *((double *)&v146 + 1) = v65;
    *(void *)&long long v147 = v67;
    unint64_t v68 = *(void *)(a5 + 32);
    *((void *)&v147 + 1) = *(void *)(a5 + 24);
    *(void *)&v148[0] = v68;
    *(_OWORD *)((char *)v148 + 8) = *(_OWORD *)(a5 + 40);
    *((void *)&v148[1] + 1) = *(void *)(a5 + 56);
    unsigned long long v149 = __PAIR128__(*((unint64_t *)&v147 + 1), v67);
    unsigned long long v150 = __PAIR128__(*((unint64_t *)&v148[0] + 1), v68);
    int v66 = *(_DWORD *)(a5 + 80);
    LODWORD(v151) = v66;
    *((void *)&v151 + 1) = *(void *)(a5 + 120);
    uint64_t v152 = 0x3E800000032;
    LOWORD(v146) = 257;
  }
  long long v69 = malloc_type_malloc(v38, 0x100004000313F17uLL);
  long long v70 = malloc_type_malloc(v38, 0x100004000313F17uLL);
  LODWORD(v175) = 0;
  uint64_t v71 = a2;
  double v140 = v69;
  sub_262E76B08(a1, v71, v134, a7, (uint64_t)v69, (uint64_t)v70, &v175, v65);
  int v136 = v175;
  if ((int)v175 < v66)
  {
    char v104 = 0;
    char v130 = 0;
    int v131 = 0;
    char v102 = 1;
    double v78 = 0.0;
    uint64_t v95 = 0;
    char v103 = 1;
    uint64_t v96 = 0;
    a3 = v134;
    goto LABEL_24;
  }
  unint64_t v144 = 0xBFF0000000000000;
  unint64_t v145 = 0xBFF0000000000000;
  a3 = v134;
  if (*(float *)(a5 + 128) <= 0.0)
  {
    sub_262E7BFC4((uint64_t)v69, (uint64_t)v70, v175, a7, (double *)a5, (uint64_t)&v156);
    long long v79 = v165;
    *(_OWORD *)(a7 + 128) = v164;
    *(_OWORD *)(a7 + 144) = v79;
    *(_OWORD *)(a7 + 160) = v166;
    uint64_t v80 = v167;
    long long v81 = v161;
    *(_OWORD *)(a7 + 64) = v160;
    *(_OWORD *)(a7 + 80) = v81;
    long long v82 = v163;
    *(_OWORD *)(a7 + 96) = v162;
    *(_OWORD *)(a7 + 112) = v82;
    long long v83 = v157;
    *(_OWORD *)a7 = v156;
    *(_OWORD *)(a7 + 16) = v83;
    long long v84 = v159;
    *(_OWORD *)(a7 + 32) = v158;
    *(_OWORD *)(a7 + 48) = v84;
    double v78 = -1.0;
    double v37 = -1.0;
    *(void *)(a7 + 176) = v80;
    goto LABEL_20;
  }
  uint64_t v167 = 0;
  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v156 = 0u;
  sub_262E7C2D4((uint64_t)v69, (uint64_t)v70, v175, a7, a5, (uint64_t)&v156, (double *)&v145, (double *)&v144);
  if (v72)
  {
    FigDebugAssert3();
    char v130 = 0;
    int v131 = 0;
    char v102 = 1;
    char v103 = 1;
    double v78 = 0.0;
    uint64_t v95 = 0;
    char v104 = 1;
    goto LABEL_31;
  }
  long long v73 = v165;
  *(_OWORD *)(a7 + 128) = v164;
  *(_OWORD *)(a7 + 144) = v73;
  *(_OWORD *)(a7 + 160) = v166;
  *(void *)(a7 + 176) = v167;
  long long v74 = v161;
  *(_OWORD *)(a7 + 64) = v160;
  *(_OWORD *)(a7 + 80) = v74;
  long long v75 = v163;
  *(_OWORD *)(a7 + 96) = v162;
  *(_OWORD *)(a7 + 112) = v75;
  long long v76 = v157;
  *(_OWORD *)a7 = v156;
  *(_OWORD *)(a7 + 16) = v76;
  long long v77 = v159;
  *(_OWORD *)(a7 + 32) = v158;
  *(_OWORD *)(a7 + 48) = v77;
  double v78 = *(double *)&v144;
  double v37 = *(double *)&v145;
LABEL_20:
  long long v85 = *(_OWORD *)(a7 + 144);
  *(_OWORD *)((char *)&v205[8] + 3) = *(_OWORD *)(a7 + 128);
  *(_OWORD *)((char *)&v205[9] + 3) = v85;
  *(_OWORD *)((char *)&v205[10] + 3) = *(_OWORD *)(a7 + 160);
  long long v86 = *(_OWORD *)(a7 + 80);
  *(_OWORD *)((char *)&v205[4] + 3) = *(_OWORD *)(a7 + 64);
  *(_OWORD *)((char *)&v205[5] + 3) = v86;
  long long v87 = *(_OWORD *)(a7 + 112);
  *(_OWORD *)((char *)&v205[6] + 3) = *(_OWORD *)(a7 + 96);
  *(_OWORD *)((char *)&v205[7] + 3) = v87;
  long long v88 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)((char *)v205 + 3) = *(_OWORD *)a7;
  *(_OWORD *)((char *)&v205[1] + 3) = v88;
  long long v89 = *(_OWORD *)(a7 + 48);
  *(_OWORD *)((char *)&v205[2] + 3) = *(_OWORD *)(a7 + 32);
  *(void *)((char *)&v205[11] + 3) = *(void *)(a7 + 176);
  *(_OWORD *)((char *)&v205[3] + 3) = v89;
  uint64_t v141 = 0;
  uint64_t v142 = 0;
  uint64_t v143 = 0;
  if (BYTE1(v146))
  {
    sub_262E83B00((uint64_t)v69, (uint64_t)v70, v175, a7, (uint64_t)&v146, (uint64_t)&v141, (uint64_t)&v156);
    long long v90 = v165;
    *(_OWORD *)(a7 + 128) = v164;
    *(_OWORD *)(a7 + 144) = v90;
    *(_OWORD *)(a7 + 160) = v166;
    *(void *)(a7 + 176) = v167;
    long long v91 = v161;
    *(_OWORD *)(a7 + 64) = v160;
    *(_OWORD *)(a7 + 80) = v91;
    long long v92 = v163;
    *(_OWORD *)(a7 + 96) = v162;
    *(_OWORD *)(a7 + 112) = v92;
    long long v93 = v157;
    *(_OWORD *)a7 = v156;
    *(_OWORD *)(a7 + 16) = v93;
    long long v94 = v159;
    *(_OWORD *)(a7 + 32) = v158;
    *(_OWORD *)(a7 + 48) = v94;
    char v130 = BYTE4(v141);
    int v131 = v141;
    uint64_t v95 = v142;
    uint64_t v96 = v143;
  }
  else
  {
    char v130 = 1;
    int v131 = 0;
    uint64_t v96 = 0;
    uint64_t v95 = 0;
  }
  long long v97 = *(_OWORD *)(a7 + 144);
  long long v185 = *(_OWORD *)(a7 + 128);
  long long v186 = v97;
  long long v187 = *(_OWORD *)(a7 + 160);
  long long v98 = *(_OWORD *)(a7 + 80);
  long long v181 = *(_OWORD *)(a7 + 64);
  long long v182 = v98;
  long long v99 = *(_OWORD *)(a7 + 112);
  long long v183 = *(_OWORD *)(a7 + 96);
  long long v184 = v99;
  long long v100 = *(_OWORD *)(a7 + 16);
  long long v177 = *(_OWORD *)a7;
  long long v178 = v100;
  long long v101 = *(_OWORD *)(a7 + 48);
  long long v179 = *(_OWORD *)(a7 + 32);
  uint64_t v188 = *(void *)(a7 + 176);
  char v102 = 1;
  char v103 = 1;
  char v104 = 1;
  long long v180 = v101;
LABEL_24:
  free(v137);
  free(v138);
  free(v140);
  free(v70);
  if (a6)
  {
    long long v105 = v205[33];
    *(_OWORD *)(a6 + 133) = v205[32];
    *(_OWORD *)(a6 + 149) = v105;
    *(_OWORD *)(a6 + 165) = v205[34];
    *(_OWORD *)(a6 + 176) = *(_OWORD *)((char *)&v205[34] + 11);
    long long v106 = v205[29];
    *(_OWORD *)(a6 + 69) = v205[28];
    *(_OWORD *)(a6 + 85) = v106;
    long long v107 = v205[31];
    *(_OWORD *)(a6 + 101) = v205[30];
    *(_OWORD *)(a6 + 117) = v107;
    long long v108 = v205[25];
    *(_OWORD *)(a6 + 5) = v205[24];
    *(_OWORD *)(a6 + 21) = v108;
    long long v109 = v205[27];
    *(_OWORD *)(a6 + 37) = v205[26];
    *(_OWORD *)(a6 + 53) = v109;
    long long v110 = v205[21];
    *(_OWORD *)(a6 + 326) = v205[20];
    *(_OWORD *)(a6 + 342) = v110;
    *(_OWORD *)(a6 + 358) = v205[22];
    *(_OWORD *)(a6 + 368) = *(_OWORD *)((char *)&v205[22] + 10);
    long long v111 = v205[17];
    *(_OWORD *)(a6 + 262) = v205[16];
    *(_OWORD *)(a6 + 278) = v111;
    long long v112 = v205[19];
    *(_OWORD *)(a6 + 294) = v205[18];
    *(_OWORD *)(a6 + 310) = v112;
    long long v113 = v205[13];
    *(_OWORD *)(a6 + 198) = v205[12];
    *(_OWORD *)(a6 + 214) = v113;
    long long v114 = v205[15];
    *(_OWORD *)(a6 + 230) = v205[14];
    *(_DWORD *)a6 = a3;
    *(unsigned char *)(a6 + 4) = v102;
    *(_DWORD *)(a6 + 192) = HIDWORD(v133);
    *(unsigned char *)(a6 + 196) = v103;
    *(unsigned char *)(a6 + 197) = v133;
    *(_OWORD *)(a6 + 246) = v114;
    *(void *)(a6 + 384) = v56;
    *(_DWORD *)(a6 + 392) = HIDWORD(v132);
    *(unsigned char *)(a6 + 396) = v132;
    *(_WORD *)(a6 + 397) = v203;
    *(unsigned char *)(a6 + 399) = v204;
    *(void *)(a6 + 400) = v55;
    long long v115 = v200;
    *(_OWORD *)(a6 + 536) = v199;
    *(_OWORD *)(a6 + 552) = v115;
    *(_OWORD *)(a6 + 568) = v201;
    *(void *)(a6 + 584) = v202;
    long long v116 = v196;
    *(_OWORD *)(a6 + 472) = v195;
    *(_OWORD *)(a6 + 488) = v116;
    long long v117 = v198;
    *(_OWORD *)(a6 + 504) = v197;
    *(_OWORD *)(a6 + 520) = v117;
    long long v118 = v192;
    *(_OWORD *)(a6 + 408) = v191;
    *(_OWORD *)(a6 + 424) = v118;
    long long v119 = v194;
    *(_OWORD *)(a6 + 440) = v193;
    *(_OWORD *)(a6 + 456) = v119;
    *(_DWORD *)(a6 + 592) = v136;
    *(unsigned char *)(a6 + 596) = v104;
    long long v120 = v205[9];
    *(_OWORD *)(a6 + 725) = v205[8];
    *(_OWORD *)(a6 + 741) = v120;
    *(_OWORD *)(a6 + 757) = v205[10];
    *(_OWORD *)(a6 + 768) = *(_OWORD *)((char *)&v205[10] + 11);
    long long v121 = v205[5];
    *(_OWORD *)(a6 + 661) = v205[4];
    *(_OWORD *)(a6 + 677) = v121;
    long long v122 = v205[7];
    *(_OWORD *)(a6 + 693) = v205[6];
    *(_OWORD *)(a6 + 709) = v122;
    long long v123 = v205[1];
    *(_OWORD *)(a6 + 597) = v205[0];
    *(_OWORD *)(a6 + 613) = v123;
    long long v124 = v205[3];
    *(_OWORD *)(a6 + 629) = v205[2];
    *(_OWORD *)(a6 + 645) = v124;
    *(double *)(a6 + 784) = v37;
    *(double *)(a6 + 792) = v78;
    *(void *)(a6 + 800) = v95;
    *(_DWORD *)(a6 + 808) = v131;
    *(unsigned char *)(a6 + 812) = v130;
    *(_WORD *)(a6 + 813) = v189;
    *(unsigned char *)(a6 + 815) = v190;
    *(void *)(a6 + 816) = v96;
    long long v125 = v186;
    *(_OWORD *)(a6 + 952) = v185;
    *(_OWORD *)(a6 + 968) = v125;
    *(_OWORD *)(a6 + 984) = v187;
    *(void *)(a6 + 1000) = v188;
    long long v126 = v182;
    *(_OWORD *)(a6 + 888) = v181;
    *(_OWORD *)(a6 + 904) = v126;
    long long v127 = v184;
    *(_OWORD *)(a6 + 920) = v183;
    *(_OWORD *)(a6 + 936) = v127;
    long long v128 = v178;
    *(_OWORD *)(a6 + 824) = v177;
    *(_OWORD *)(a6 + 840) = v128;
    long long v129 = v180;
    *(_OWORD *)(a6 + 856) = v179;
    *(_OWORD *)(a6 + 872) = v129;
    memcpy((void *)(a6 + 1008), __src, 0x358uLL);
  }
}

double *sub_262E80D68@<X0>(double *result@<X0>, double *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  long long v5 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(a5 + 128) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(a5 + 144) = v5;
  *(_OWORD *)(a5 + 160) = *(_OWORD *)(a4 + 160);
  *(void *)(a5 + 176) = *(void *)(a4 + 176);
  long long v6 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(a5 + 64) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(a5 + 80) = v6;
  long long v7 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(a5 + 96) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(a5 + 112) = v7;
  long long v8 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)a5 = *(_OWORD *)a4;
  *(_OWORD *)(a5 + 16) = v8;
  long long v9 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(a5 + 32) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(a5 + 48) = v9;
  if (a3 < 1)
  {
    double v14 = 0.0;
    double v13 = 0.0;
    double v12 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    uint64_t v10 = a3;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    do
    {
      double v15 = *result;
      result += 2;
      double v16 = v15;
      double v17 = *a2;
      a2 += 2;
      double v14 = v14 + v16 * v17;
      double v11 = v11 + v16;
      double v12 = v12 + v17;
      double v13 = v13 + v17 * v17;
      --v10;
    }
    while (v10);
  }
  double v18 = v13 * (double)a3 - v12 * v12;
  if (v18 <= 0.0) {
    return (double *)FigDebugAssert3();
  }
  double v19 = ((double)a3 * v14 - v11 * v12) / v18;
  if (v19 <= 0.0) {
    return (double *)FigDebugAssert3();
  }
  double v20 = *(double *)(a4 + 8);
  double v22 = *(double *)(a4 + 16);
  double v21 = *(double *)(a4 + 24);
  double v23 = *(double *)(a4 + 64);
  double v24 = *(double *)(a4 + 128);
  *(double *)(a5 + 8) = *(double *)a4 / v19;
  if (v24 <= 0.0) {
    return (double *)FigDebugAssert3();
  }
  *(double *)(a5 + 24) = v21 - (v21 - v20 * (v23 / v24)) + (v22 - (v13 * v11 - v14 * v12) / v18) / v19;
  return result;
}

uint64_t sub_262E80F58(uint64_t a1, int a2, double *a3, uint64_t a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1 && a2 > 0 && a3 && a4)
  {
    unint64_t v4 = 0;
    memset(v8, 0, sizeof(v8));
    double v5 = *a3;
    float64x2_t v6 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[1] * *a3), 0);
    do
    {
      v8[v4 / 2] = vmlaq_f64(*(float64x2_t *)&a3[v4 + 4], *(float64x2_t *)&a3[v4 + 12], v6);
      v4 += 2;
    }
    while (v4 != 8);
    sub_262E8112C(a1, a2, (double *)v8, a4, a3[2], a3[3], v5);
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return 4294954516;
  }
}

uint64_t sub_262E8112C(uint64_t result, int a2, double *a3, uint64_t a4, double a5, double a6, double a7)
{
  if (a2 >= 1)
  {
    double v7 = *a3;
    double v8 = a3[1];
    double v9 = a3[2];
    double v10 = a3[3];
    double v11 = a3[4];
    double v12 = a3[5];
    uint64_t v13 = a2;
    double v14 = (double *)(a4 + 8);
    double v15 = (double *)(result + 8);
    double v16 = a3[6];
    double v17 = a3[7];
    do
    {
      double v18 = *(v15 - 1) - a5;
      double v19 = *v15 - a6;
      double v20 = sqrt(v19 * v19 + v18 * v18);
      double v21 = v20 * a7 * (v20 * a7);
      double v22 = v21 * (v21 * v21);
      double v23 = (v7
           + v8 * v21
           + v9 * (v21 * v21)
           + v10 * v22
           + v11 * (v21 * v21 * (v21 * v21))
           + v12 * (v21 * v21 * v22)
           + v16 * (v22 * v22)
           + v17 * (v21 * v21 * (v21 * v21) * v22))
          / 100.0
          + 1.0;
      if (v23 <= 0.0) {
        double v24 = 1.0;
      }
      else {
        double v24 = 1.0 / v23;
      }
      *(v14 - 1) = v18 * v24 + a5;
      *double v14 = v19 * v24 + a6;
      v14 += 2;
      v15 += 2;
      --v13;
    }
    while (v13);
  }
  return result;
}

uint64_t sub_262E811F0(uint64_t a1, float32x4_t *a2, float32x4_t *a3, float32x4_t *a4, float32x4_t *a5, float32x4_t *a6)
{
  if (!a1) {
    goto LABEL_55;
  }
  if (!a2) {
    goto LABEL_55;
  }
  if (!a3) {
    goto LABEL_55;
  }
  if (!a4) {
    goto LABEL_55;
  }
  float32x4_t v127 = 0u;
  float32x4_t v128 = 0u;
  float32x4_t v125 = 0u;
  float32x4_t v126 = 0u;
  float32x4_t v123 = 0u;
  float32x4_t v124 = 0u;
  int32x4_t v120 = 0u;
  int32x4_t v121 = 0u;
  int32x4_t v122 = 0u;
  float32x4_t v117 = 0u;
  float32x4_t v118 = 0u;
  float32x4_t v119 = 0u;
  float32x4_t v114 = 0u;
  float32x4_t v115 = 0u;
  float32x4_t v116 = 0u;
  v113.i32[2] = 0;
  v113.i64[0] = 0;
  uint64_t result = sub_262E81BC4(a1, (uint64_t)&v126, (uint64_t)&v123, (uint64_t)&v120, &v113, (uint64_t)&v117, (uint64_t)&v114);
  float32x4_t v12 = (float32x4_t)v120;
  float32x4_t v13 = (float32x4_t)v121;
  float32x4_t v14 = (float32x4_t)v122;
  int32x4_t v15 = vzip1q_s32(v120, v122);
  int32x4_t v16 = vzip1q_s32(v121, (int32x4_t)0);
  float32x4_t v17 = (float32x4_t)vtrn2q_s32(v120, v121);
  v17.i32[2] = v122.i32[1];
  float32x4_t v18 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(v15, v16), v113.f32[0]), v17, *(float32x2_t *)v113.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(v120, v122), vdupq_laneq_s32(v121, 2)), v113, 2);
  int32x4_t v19 = (int32x4_t)vmulq_f32(v18, v18);
  v19.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v19, 2), vadd_f32(*(float32x2_t *)v19.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v19.i8, 1))).u32[0];
  *(float32x2_t *)v17.f32 = vrsqrte_f32((float32x2_t)v19.u32[0]);
  *(float32x2_t *)v17.f32 = vmul_f32(*(float32x2_t *)v17.f32, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(*(float32x2_t *)v17.f32, *(float32x2_t *)v17.f32)));
  float32x4_t v20 = vmulq_n_f32(vnegq_f32(v18), vmul_f32(*(float32x2_t *)v17.f32, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(*(float32x2_t *)v17.f32, *(float32x2_t *)v17.f32))).f32[0]);
  float32x4_t v21 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL);
  float32x4_t v22 = vmlaq_f32(vmulq_f32(v21, (float32x4_t)xmmword_262E89AB0), (float32x4_t)xmmword_262E89AC0, v20);
  float32x4_t v23 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v22, (int32x4_t)v22), (int8x16_t)v22, 0xCuLL);
  int32x4_t v24 = (int32x4_t)vmulq_f32(v22, v22);
  v24.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v24.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v24, 2), *(float32x2_t *)v24.i8)).u32[0];
  float32x2_t v25 = vrsqrte_f32((float32x2_t)v24.u32[0]);
  float32x2_t v26 = vmul_f32(v25, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(v25, v25)));
  float32x4_t v27 = vmulq_n_f32(v23, vmul_f32(v26, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(v26, v26))).f32[0]);
  float32x4_t v28 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v27, (int32x4_t)v27), (int8x16_t)v27, 0xCuLL), vnegq_f32(v20)), v27, v21);
  float32x4_t v29 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v28, (int32x4_t)v28), (int8x16_t)v28, 0xCuLL);
  int32x4_t v30 = (int32x4_t)vmulq_f32(v28, v28);
  int8x16_t v31 = (int8x16_t)vdupq_laneq_s32(v30, 2);
  v30.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v30.i8, 1), vadd_f32(*(float32x2_t *)v31.i8, *(float32x2_t *)v30.i8)).u32[0];
  *(float32x2_t *)v31.i8 = vrsqrte_f32((float32x2_t)v30.u32[0]);
  *(float32x2_t *)v31.i8 = vmul_f32(*(float32x2_t *)v31.i8, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(*(float32x2_t *)v31.i8, *(float32x2_t *)v31.i8)));
  float32x4_t v32 = vmulq_n_f32(v29, vmul_f32(*(float32x2_t *)v31.i8, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(*(float32x2_t *)v31.i8, *(float32x2_t *)v31.i8))).f32[0]);
  v31.i32[0] = 1.0;
  v33.i64[0] = 0x8000000080000000;
  v33.i64[1] = 0x8000000080000000;
  int32x4_t v34 = (int32x4_t)vmulq_n_f32(v20, *(float *)vbslq_s8(v33, v31, (int8x16_t)v20).i32);
  v20.i32[0] = v27.i32[1];
  int8x16_t v35 = vbslq_s8(v33, v31, (int8x16_t)v20);
  int32x4_t v36 = (int32x4_t)vmulq_n_f32(v27, *(float *)v35.i32);
  v35.i32[0] = v32.i32[2];
  int32x4_t v37 = (int32x4_t)vmulq_n_f32(v32, *(float *)vbslq_s8(v33, v31, v35).i32);
  int32x4_t v38 = vzip1q_s32(v34, v37);
  int32x4_t v39 = vzip1q_s32(v36, (int32x4_t)0);
  float32x4_t v40 = (float32x4_t)vtrn2q_s32(v34, v36);
  v40.i32[2] = v37.i32[1];
  float32x4_t v41 = vaddq_f32((float32x4_t)vzip1q_s32(vzip2q_s32(v34, v37), vdupq_laneq_s32(v36, 2)), vmlaq_f32(vmulq_f32((float32x4_t)vzip1q_s32(v38, v39), (float32x4_t)0), (float32x4_t)0, v40));
  if (v41.f32[2] <= 0.0) {
    goto LABEL_55;
  }
  uint64_t v42 = 0;
  float32x4_t v43 = (float32x4_t)vzip1q_s32(v120, v121);
  v43.i32[2] = v122.i32[0];
  float32x4_t v44 = (float32x4_t)vzip2q_s32(v15, v16);
  float32x4_t v45 = (float32x4_t)vzip2q_s32(v120, v121);
  v45.i32[2] = v122.i32[2];
  float32x4_t v46 = (float32x4_t)vzip1q_s32(v34, v36);
  v46.i32[2] = v37.i32[0];
  float32x4_t v47 = (float32x4_t)vzip2q_s32(v38, v39);
  float32x4_t v48 = (float32x4_t)vzip2q_s32(v34, v36);
  v48.i32[2] = v37.i32[2];
  int32x4_t v49 = vzip1q_s32((int32x4_t)v46, (int32x4_t)v48);
  int32x4_t v50 = vzip1q_s32((int32x4_t)v47, (int32x4_t)0);
  int32x4_t v51 = vdupq_lane_s32(*(int32x2_t *)v37.i8, 1);
  float32x4_t v52 = (float32x4_t)vzip2q_s32(v49, v50);
  float32x4_t v53 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2);
  int32x4_t v54 = (int32x4_t)vdivq_f32(v41, v53);
  v53.f32[0] = -*(float *)v54.i32;
  int32x4_t v55 = vdupq_lane_s32(*(int32x2_t *)v53.f32, 0);
  __asm { FMOV            V29.4S, #1.0 }
  v60.i64[1] = _Q29.i64[1];
  v60.i64[0] = v54.i64[0];
  float32x4_t v61 = v117;
  float32x4_t v62 = v118;
  float32x4_t v63 = v119;
  float32x4_t v129 = v117;
  float32x4_t v130 = v118;
  float32x4_t v131 = v119;
  float32x4_t v132 = 0uLL;
  float32x4_t v133 = 0uLL;
  float32x4_t v134 = 0uLL;
  do
  {
    *(float32x4_t *)((char *)&v132 + v42 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_262E89AC0, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v42 * 4))), (float32x4_t)xmmword_262E89AD0, *(float32x2_t *)&v129.f32[v42], 1), v60, *(float32x4_t *)((char *)&v129 + v42 * 4), 2);
    v42 += 4;
  }
  while (v42 != 12);
  uint64_t v64 = 0;
  float32x4_t v65 = (float32x4_t)vzip1q_s32(v49, v50);
  float32x4_t v66 = (float32x4_t)vzip2q_s32((int32x4_t)v46, vuzp1q_s32((int32x4_t)v46, v51));
  v66.i32[2] = v48.i32[2];
  int32x4_t v67 = vzip2q_s32(v55, _Q29);
  float32x4_t v129 = v132;
  float32x4_t v130 = v133;
  float32x4_t v131 = v134;
  float32x4_t v132 = 0u;
  float32x4_t v133 = 0u;
  float32x4_t v134 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v132 + v64 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v65, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v64 * 4))), v52, *(float32x2_t *)&v129.f32[v64], 1), v66, *(float32x4_t *)((char *)&v129 + v64 * 4), 2);
    v64 += 4;
  }
  while (v64 != 12);
  uint64_t v68 = 0;
  float32x4_t v70 = v132;
  float32x4_t v69 = v133;
  float32x4_t v71 = v134;
  float32x4_t v72 = v126;
  float32x4_t v73 = v127;
  float32x4_t v74 = v128;
  float32x4_t v129 = v132;
  float32x4_t v130 = v133;
  float32x4_t v131 = v134;
  float32x4_t v132 = 0u;
  float32x4_t v133 = 0u;
  float32x4_t v134 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v132 + v68 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v68 * 4))), v73, *(float32x2_t *)&v129.f32[v68], 1), v74, *(float32x4_t *)((char *)&v129 + v68 * 4), 2);
    v68 += 4;
  }
  while (v68 != 12);
  uint64_t v75 = 0;
  float32x4_t v77 = v132;
  float32x4_t v76 = v133;
  float32x4_t v78 = v134;
  float32x4_t v129 = v70;
  float32x4_t v130 = v69;
  float32x4_t v131 = v71;
  float32x4_t v132 = 0u;
  float32x4_t v133 = 0u;
  float32x4_t v134 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v132 + v75 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v75 * 4))), v13, *(float32x2_t *)&v129.f32[v75], 1), v14, *(float32x4_t *)((char *)&v129 + v75 * 4), 2);
    v75 += 4;
  }
  while (v75 != 12);
  uint64_t v79 = 0;
  float32x4_t v80 = v76;
  v80.i32[3] = 0;
  *(float *)v54.i32 = -*(float *)&v54.i32[1];
  float32x4_t v81 = (float32x4_t)vzip1q_s32(v67, v54);
  float32x4_t v82 = v123;
  float32x4_t v83 = v124;
  float32x4_t v84 = v125;
  float32x4_t v129 = v132;
  float32x4_t v130 = v133;
  float32x4_t v131 = v134;
  float32x4_t v132 = 0u;
  float32x4_t v133 = 0u;
  float32x4_t v134 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v132 + v79 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v82, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v79 * 4))), v83, *(float32x2_t *)&v129.f32[v79], 1), v84, *(float32x4_t *)((char *)&v129 + v79 * 4), 2);
    v79 += 4;
  }
  while (v79 != 12);
  uint64_t v85 = 0;
  float32x4_t v86 = v77;
  v86.i32[3] = 0;
  float32x4_t v87 = v132;
  float32x4_t v88 = v133;
  float32x4_t v89 = v134;
  float32x4_t v129 = v61;
  float32x4_t v130 = v62;
  float32x4_t v131 = v63;
  float32x4_t v132 = 0u;
  float32x4_t v133 = 0u;
  float32x4_t v134 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v132 + v85 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v85 * 4))), v47, *(float32x2_t *)&v129.f32[v85], 1), v48, *(float32x4_t *)((char *)&v129 + v85 * 4), 2);
    v85 += 4;
  }
  while (v85 != 12);
  uint64_t v90 = 0;
  float32x4_t v91 = v78;
  v91.i32[3] = 0;
  float32x4_t v92 = v88;
  v92.i32[3] = 0;
  float32x4_t v129 = v132;
  float32x4_t v130 = v133;
  float32x4_t v131 = v134;
  float32x4_t v132 = 0u;
  float32x4_t v133 = 0u;
  float32x4_t v134 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v132 + v90 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_262E89AC0, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v90 * 4))), (float32x4_t)xmmword_262E89AD0, *(float32x2_t *)&v129.f32[v90], 1), v81, *(float32x4_t *)((char *)&v129 + v90 * 4), 2);
    v90 += 4;
  }
  while (v90 != 12);
  uint64_t v93 = 0;
  float32x4_t v94 = v87;
  v94.i32[3] = 0;
  float32x4_t v129 = v132;
  float32x4_t v130 = v133;
  float32x4_t v131 = v134;
  float32x4_t v132 = 0u;
  float32x4_t v133 = 0u;
  float32x4_t v134 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v132 + v93 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v93 * 4))), v73, *(float32x2_t *)&v129.f32[v93], 1), v74, *(float32x4_t *)((char *)&v129 + v93 * 4), 2);
    v93 += 4;
  }
  while (v93 != 12);
  float32x4_t v95 = vaddq_f32(v78, vmlaq_f32(vmulq_f32(v77, (float32x4_t)0), (float32x4_t)0, v76));
  if (v95.f32[2] <= 0.01 || v95.f32[2] >= 100.0) {
    goto LABEL_55;
  }
  float32x4_t v97 = vaddq_f32(v89, vmlaq_f32(vmulq_f32(v87, (float32x4_t)0), (float32x4_t)0, v88));
  if (v97.f32[2] <= 0.01 || v97.f32[2] >= 100.0) {
    goto LABEL_55;
  }
  float32x4_t v99 = v132;
  float32x4_t v100 = v133;
  float32x4_t v101 = v134;
  float32x4_t v102 = vaddq_f32(v134, vmlaq_f32(vmulq_f32(v132, (float32x4_t)0), (float32x4_t)0, v133));
  if (v102.f32[2] <= 0.01 || v102.f32[2] >= 100.0) {
    goto LABEL_55;
  }
  if (a5)
  {
    uint64_t v104 = 0;
    float32x4_t v129 = v114;
    float32x4_t v130 = v115;
    float32x4_t v131 = v116;
    float32x4_t v132 = 0u;
    float32x4_t v133 = 0u;
    float32x4_t v134 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v132 + v104 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v104 * 4))), v44, *(float32x2_t *)&v129.f32[v104], 1), v45, *(float32x4_t *)((char *)&v129 + v104 * 4), 2);
      v104 += 4;
    }
    while (v104 != 12);
    uint64_t v105 = 0;
    float32x4_t v129 = v132;
    float32x4_t v130 = v133;
    float32x4_t v131 = v134;
    float32x4_t v132 = 0u;
    float32x4_t v133 = 0u;
    float32x4_t v134 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v132 + v105 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v105 * 4))), v47, *(float32x2_t *)&v129.f32[v105], 1), v48, *(float32x4_t *)((char *)&v129 + v105 * 4), 2);
      v105 += 4;
    }
    while (v105 != 12);
    uint64_t v106 = 0;
    float32x4_t v129 = v132;
    float32x4_t v130 = v133;
    float32x4_t v131 = v134;
    float32x4_t v132 = 0u;
    float32x4_t v133 = 0u;
    float32x4_t v134 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v132 + v106 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_262E89AC0, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v106 * 4))), (float32x4_t)xmmword_262E89AD0, *(float32x2_t *)&v129.f32[v106], 1), v81, *(float32x4_t *)((char *)&v129 + v106 * 4), 2);
      v106 += 4;
    }
    while (v106 != 12);
    uint64_t v107 = 0;
    float32x4_t v129 = v132;
    float32x4_t v130 = v133;
    float32x4_t v131 = v134;
    float32x4_t v132 = 0u;
    float32x4_t v133 = 0u;
    float32x4_t v134 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v132 + v107 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(_OWORD *)((char *)&v129 + v107 * 4))), v73, *(float32x2_t *)&v129.f32[v107], 1), v74, *(float32x4_t *)((char *)&v129 + v107 * 4), 2);
      v107 += 4;
    }
    while (v107 != 12);
    float32x4_t v109 = v132;
    float32x4_t v108 = v133;
    float32x4_t v110 = v134;
    float32x4_t v111 = vaddq_f32(v134, vmlaq_f32(vmulq_f32(v132, (float32x4_t)0), (float32x4_t)0, v133));
    if (v111.f32[2] <= 0.01 || v111.f32[2] >= 100.0)
    {
LABEL_55:
      FigDebugAssert3();
      return 4294954516;
    }
    v110.i32[3] = 0;
    v108.i32[3] = 0;
    v109.i32[3] = 0;
    *a5 = v109;
    a5[1] = v108;
    a5[2] = v110;
  }
  v89.i32[3] = 0;
  v99.i32[3] = 0;
  v100.i32[3] = 0;
  v101.i32[3] = 0;
  *a2 = v86;
  a2[1] = v80;
  a2[2] = v91;
  *a3 = v94;
  a3[1] = v92;
  a3[2] = v89;
  *a4 = v99;
  a4[1] = v100;
  a4[2] = v101;
  if (a6) {
    *a6 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, v18.f32[0]), v47, *(float32x2_t *)v18.f32, 1), v48, v18, 2);
  }
  return result;
}

uint64_t sub_262E81BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float32x4_t *a5, uint64_t a6, uint64_t a7)
{
  if (!a1)
  {
    FigDebugAssert3();
    return 4294954516;
  }
  if (a2)
  {
    *(float *)&unsigned int v7 = *(double *)a1;
    *(float *)&uint64_t v8 = *(double *)(a1 + 16);
    LODWORD(v9) = 0;
    HIDWORD(v9) = v7;
    float v10 = *(double *)(a1 + 32);
    *((float *)&v8 + 1) = v10;
    *(_DWORD *)(a2 + 8) = 0;
    *(void *)a2 = v7;
    *(_DWORD *)(a2 + 24) = 0;
    *(void *)(a2 + 16) = v9;
    *(_DWORD *)(a2 + 40) = 1065353216;
    *(void *)(a2 + 32) = v8;
  }
  if (a3)
  {
    *(float *)&unsigned int v11 = *(double *)(a1 + 8);
    *(float *)&uint64_t v12 = *(double *)(a1 + 24);
    LODWORD(v13) = 0;
    HIDWORD(v13) = v11;
    float v14 = *(double *)(a1 + 40);
    *((float *)&v12 + 1) = v14;
    *(_DWORD *)(a3 + 8) = 0;
    *(void *)a3 = v11;
    *(_DWORD *)(a3 + 24) = 0;
    *(void *)(a3 + 16) = v13;
    *(_DWORD *)(a3 + 40) = 1065353216;
    *(void *)(a3 + 32) = v12;
  }
  if (a4)
  {
    uint64_t v15 = 0;
    float32x4_t v24 = *(float32x4_t *)(a1 + 48);
    int32x2_t v16 = (int32x2_t)vcvt_f32_f64((float64x2_t)v24);
    v24.f32[0] = *(double *)(a1 + 64);
    float64x2_t v17 = *(float64x2_t *)(a1 + 80);
    float32_t v18 = *(double *)(a1 + 96);
    float64x2_t v19 = *(float64x2_t *)(a1 + 112);
    *(float32x2_t *)&v19.f64[0] = vcvt_f32_f64(v19);
    float32_t v20 = *(double *)(a1 + 128);
    *(int32x2_t *)v21.i8 = vzip2_s32(v16, *(int32x2_t *)&v19.f64[0]);
    v21.i64[1] = v21.i64[0];
    float32x4_t v22 = (float32x4_t)vuzp1q_s32((int32x4_t)vcvt_hight_f32_f64(v16, v17), (int32x4_t)v19);
    v24.f32[1] = v18;
    float32x4_t v23 = (float32x4_t)vzip2q_s32(v21, vdupq_lane_s32((int32x2_t)vcvt_f32_f64(v17), 1));
    v24.f32[2] = v20;
    long long v44 = xmmword_262E89AE0;
    long long v45 = xmmword_262E89AF0;
    long long v46 = xmmword_262E89A60;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    do
    {
      *(long long *)((char *)&v47 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(long long *)((char *)&v44 + v15))), v23, *(float32x2_t *)((char *)&v44 + v15), 1), v24, *(float32x4_t *)((char *)&v44 + v15), 2);
      v15 += 16;
    }
    while (v15 != 48);
    uint64_t v25 = 0;
    long long v44 = v47;
    long long v45 = v48;
    long long v46 = v49;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    do
    {
      *(long long *)((char *)&v47 + v25) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_262E89AE0, COERCE_FLOAT(*(long long *)((char *)&v44 + v25))), (float32x4_t)xmmword_262E89AF0, *(float32x2_t *)((char *)&v44 + v25), 1), (float32x4_t)xmmword_262E89A60, *(float32x4_t *)((char *)&v44 + v25), 2);
      v25 += 16;
    }
    while (v25 != 48);
    uint64_t v26 = v47;
    long long v27 = v48;
    long long v28 = v49;
    *(_DWORD *)(a4 + 8) = DWORD2(v47);
    *(_DWORD *)(a4 + 24) = DWORD2(v27);
    *(void *)a4 = v26;
    *(void *)(a4 + 16) = v27;
    *(_DWORD *)(a4 + 40) = DWORD2(v28);
    *(void *)(a4 + 32) = v28;
  }
  if (a5)
  {
    float v29 = *(double *)(a1 + 72);
    float v30 = *(double *)(a1 + 104);
    float v31 = *(double *)(a1 + 136);
    *a5 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_262E89AE0, v29), (float32x4_t)xmmword_262E89AF0, v30), (float32x4_t)xmmword_262E89A60, v31);
  }
  if (a6)
  {
    float v32 = *(double *)a1;
    if (v32 <= 0.0) {
      goto LABEL_23;
    }
    float v33 = *(double *)(a1 + 32);
    float v34 = *(double *)(a1 + 16);
    *(float *)&uint64_t v35 = (float)-v34 / v32;
    LODWORD(v36) = 0;
    *((float *)&v36 + 1) = 1.0 / v32;
    *((float *)&v35 + 1) = (float)-v33 / v32;
    *(_DWORD *)(a6 + 8) = 0;
    *(void *)a6 = COERCE_UNSIGNED_INT(1.0 / v32);
    *(_DWORD *)(a6 + 24) = 0;
    *(void *)(a6 + 16) = v36;
    *(_DWORD *)(a6 + 40) = 1065353216;
    *(void *)(a6 + 32) = v35;
  }
  if (!a7) {
    return 0;
  }
  float v37 = *(double *)(a1 + 8);
  if (v37 <= 0.0)
  {
LABEL_23:
    FigDebugAssert3();
    uint64_t v38 = 4294954516;
    FigDebugAssert3();
    return v38;
  }
  uint64_t v38 = 0;
  float v39 = *(double *)(a1 + 40);
  float v40 = *(double *)(a1 + 24);
  *(float *)&uint64_t v41 = (float)-v40 / v37;
  LODWORD(v42) = 0;
  *((float *)&v42 + 1) = 1.0 / v37;
  *((float *)&v41 + 1) = (float)-v39 / v37;
  *(_DWORD *)(a7 + 40) = 1065353216;
  *(_DWORD *)(a7 + 8) = 0;
  *(void *)a7 = COERCE_UNSIGNED_INT(1.0 / v37);
  *(_DWORD *)(a7 + 24) = 0;
  *(void *)(a7 + 16) = v42;
  *(void *)(a7 + 32) = v41;
  return v38;
}

double sub_262E8204C@<D0>(long long *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v4 = 0;
  long long v5 = a1[9];
  long long v62 = a1[8];
  long long v63 = v5;
  long long v64 = a1[10];
  uint64_t v65 = *((void *)a1 + 22);
  long long v6 = a1[5];
  long long v58 = a1[4];
  long long v59 = v6;
  long long v7 = a1[7];
  long long v60 = a1[6];
  long long v61 = v7;
  long long v8 = a1[1];
  long long v54 = *a1;
  long long v55 = v8;
  long long v9 = a1[3];
  char v10 = 1;
  long long v56 = a1[2];
  long long v57 = v9;
  do
  {
    char v11 = v10;
    uint64_t v12 = (double *)&v54 + v4;
    *uint64_t v12 = *v12 * a4;
    v12[2] = v12[2] * a4;
    v12[4] = v12[4] * a4;
    uint64_t v4 = 1;
    char v10 = 0;
  }
  while ((v11 & 1) != 0);
  uint64_t v13 = 0;
  long long v74 = v62;
  long long v75 = v63;
  long long v76 = v64;
  uint64_t v77 = v65;
  long long v70 = v58;
  long long v71 = v59;
  long long v72 = v60;
  long long v73 = v61;
  long long v66 = v54;
  long long v67 = v55;
  long long v68 = v56;
  long long v69 = v57;
  long long v14 = v63;
  a1[8] = v62;
  a1[9] = v14;
  a1[10] = v76;
  *((void *)a1 + 22) = v77;
  long long v15 = v71;
  a1[4] = v70;
  a1[5] = v15;
  long long v16 = v73;
  a1[6] = v72;
  a1[7] = v16;
  long long v17 = v67;
  *a1 = v66;
  a1[1] = v17;
  long long v18 = v69;
  a1[2] = v68;
  a1[3] = v18;
  double v19 = 1.0 - a4;
  long long v20 = a2[9];
  long long v62 = a2[8];
  long long v63 = v20;
  long long v64 = a2[10];
  uint64_t v65 = *((void *)a2 + 22);
  long long v21 = a2[5];
  long long v58 = a2[4];
  long long v59 = v21;
  long long v22 = a2[7];
  long long v60 = a2[6];
  long long v61 = v22;
  long long v23 = a2[1];
  long long v54 = *a2;
  long long v55 = v23;
  long long v24 = a2[3];
  char v25 = 1;
  long long v56 = a2[2];
  long long v57 = v24;
  do
  {
    char v26 = v25;
    long long v27 = (double *)&v54 + v13;
    double *v27 = v19 * *v27;
    v27[2] = v19 * v27[2];
    v27[4] = v19 * v27[4];
    uint64_t v13 = 1;
    char v25 = 0;
  }
  while ((v26 & 1) != 0);
  uint64_t v28 = 0;
  long long v74 = v62;
  long long v75 = v63;
  long long v76 = v64;
  uint64_t v77 = v65;
  long long v70 = v58;
  long long v71 = v59;
  long long v72 = v60;
  long long v73 = v61;
  long long v66 = v54;
  long long v67 = v55;
  long long v68 = v56;
  long long v69 = v57;
  long long v29 = v63;
  a2[8] = v62;
  a2[9] = v29;
  a2[10] = v76;
  *((void *)a2 + 22) = v77;
  long long v30 = v71;
  a2[4] = v70;
  a2[5] = v30;
  long long v31 = v73;
  a2[6] = v72;
  a2[7] = v31;
  long long v32 = v67;
  *a2 = v66;
  a2[1] = v32;
  long long v33 = v69;
  a2[2] = v68;
  a2[3] = v33;
  long long v34 = a1[9];
  long long v74 = a1[8];
  long long v75 = v34;
  long long v76 = a1[10];
  uint64_t v77 = *((void *)a1 + 22);
  long long v35 = a1[5];
  long long v70 = a1[4];
  long long v71 = v35;
  long long v36 = a1[7];
  long long v72 = a1[6];
  long long v73 = v36;
  long long v37 = a1[1];
  long long v66 = *a1;
  long long v67 = v37;
  long long v38 = a1[3];
  long long v68 = a1[2];
  long long v69 = v38;
  long long v39 = a2[9];
  long long v62 = a2[8];
  long long v63 = v39;
  long long v64 = a2[10];
  uint64_t v65 = *((void *)a2 + 22);
  long long v40 = a2[5];
  long long v58 = a2[4];
  long long v59 = v40;
  long long v41 = a2[7];
  long long v60 = a2[6];
  long long v61 = v41;
  long long v42 = a2[1];
  long long v54 = *a2;
  long long v55 = v42;
  long long v43 = a2[3];
  char v44 = 1;
  long long v56 = a2[2];
  long long v57 = v43;
  do
  {
    char v45 = v44;
    long long v46 = (double *)&v54 + v28;
    long long v47 = (double *)&v66 + v28;
    *long long v47 = *v46 + *v47;
    v47[2] = v46[2] + v47[2];
    v47[4] = v46[4] + v47[4];
    uint64_t v28 = 1;
    char v44 = 0;
  }
  while ((v45 & 1) != 0);
  long long v48 = v75;
  *(_OWORD *)(a3 + 128) = v74;
  *(_OWORD *)(a3 + 144) = v48;
  *(_OWORD *)(a3 + 160) = v76;
  *(void *)(a3 + 176) = v77;
  long long v49 = v71;
  *(_OWORD *)(a3 + 64) = v70;
  *(_OWORD *)(a3 + 80) = v49;
  long long v50 = v73;
  *(_OWORD *)(a3 + 96) = v72;
  *(_OWORD *)(a3 + 112) = v50;
  long long v51 = v67;
  *(_OWORD *)a3 = v66;
  *(_OWORD *)(a3 + 16) = v51;
  double result = *(double *)&v68;
  long long v53 = v69;
  *(_OWORD *)(a3 + 32) = v68;
  *(_OWORD *)(a3 + 48) = v53;
  return result;
}

double sub_262E82758(void *a1, uint64_t a2, double *a3)
{
  if (a1 && a2 && a3)
  {
    long long v5 = NSString;
    id v6 = a1;
    objc_msgSend_stringWithUTF8String_(v5, v7, a2, v8, v9, v10);
    int Float32IfPresent = FigCFDictionaryGetFloat32IfPresent();

    if (Float32IfPresent)
    {
      double result = 0.0;
      *a3 = 0.0;
    }
  }
  return result;
}

float sub_262E827F4(void *a1, uint64_t a2, _DWORD *a3)
{
  if (a1 && a2 && a3)
  {
    long long v5 = NSString;
    id v6 = a1;
    objc_msgSend_stringWithUTF8String_(v5, v7, a2, v8, v9, v10);
    int Float32IfPresent = FigCFDictionaryGetFloat32IfPresent();

    if (Float32IfPresent)
    {
      float result = 0.0;
      *a3 = 0;
    }
  }
  return result;
}

double *sub_262E82A44@<X0>(double *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(_OWORD *)(a3 + 248) = 0u;
  *(_OWORD *)(a3 + 232) = 0u;
  *(_OWORD *)(a3 + 216) = 0u;
  *(_OWORD *)(a3 + 200) = 0u;
  *(_OWORD *)(a3 + 184) = 0u;
  *(_OWORD *)(a3 + 168) = 0u;
  *(_OWORD *)(a3 + 152) = 0u;
  *(_OWORD *)(a3 + 136) = 0u;
  *(_OWORD *)(a3 + 120) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  double v4 = *result;
  double v3 = result[1];
  double v6 = result[2];
  double v5 = result[3];
  double v8 = result[4];
  double v7 = result[5];
  double v9 = -1.0 / *result;
  double v10 = v6 / *result;
  double v11 = v8 / *result;
  double v12 = -1.0 / v3;
  double v13 = v5 / v3;
  double v14 = v7 / v3;
  double v15 = result[6];
  double v16 = result[7];
  double v17 = result[10];
  double v18 = result[11];
  double v19 = result[14];
  double v20 = result[15];
  double v22 = result[8];
  double v21 = result[9];
  double v23 = result[12];
  double v24 = result[13];
  double v25 = result[16];
  double v26 = result[17];
  double v27 = v24 * v19 - v26 * v17;
  double v28 = v24 * v20 - v26 * v18;
  double v29 = v24 * v25 - v26 * v23;
  double v30 = v26 * v15 - v21 * v19;
  double v31 = v26 * v16 - v21 * v20;
  double v32 = v26 * v22 - v21 * v25;
  double v33 = v21 * v17 - v24 * v15;
  double v34 = v21 * v18 - v24 * v16;
  double v35 = v21 * v23 - v24 * v22;
  double v36 = v9 * v27;
  double v37 = v9 * v30;
  double v38 = v9 * v33;
  double v39 = v9 * v28;
  double v40 = v9 * v31;
  double v41 = v9 * v34;
  double v42 = v29 + v11 * v28 + v10 * v27;
  double v43 = v32 + v11 * v31 + v10 * v30;
  *(double *)a3 = -1.0 / v3 * v36;
  *(double *)(a3 + 8) = -1.0 / v3 * v39;
  *(double *)(a3 + 16) = -1.0 / v3 * v42;
  *(double *)(a3 + 24) = -1.0 / v3 * v37;
  *(double *)(a3 + 32) = -1.0 / v3 * v40;
  *(double *)(a3 + 40) = -1.0 / v3 * v43;
  *(double *)(a3 + 48) = v38 + v7 / v3 * v37 + v36 * (v5 / v3);
  *(double *)(a3 + 56) = v41 + v7 / v3 * v40 + v39 * (v5 / v3);
  *(double *)(a3 + 64) = v35 + v11 * v34 + v10 * v33 + v7 / v3 * v43 + v42 * (v5 / v3);
  if (a2)
  {
    double v44 = v12 * v27;
    double v45 = v12 * v28;
    double v46 = v12 * v30;
    double v47 = v12 * v31;
    double v48 = v33 + v14 * v30 + v13 * v27;
    double v49 = v34 + v14 * v31 + v13 * v28;
    double v50 = 1.0 / v4;
    double v51 = v4 * v4;
    double v52 = 1.0 / v51;
    double v53 = -v6 / v51;
    double v54 = -v8 / v51;
    double v55 = 1.0 / v3;
    double v56 = v3 * v3;
    *(double *)(a3 + 72) = v50 * v44;
    *(double *)(a3 + 80) = v50 * v46;
    *(double *)(a3 + 120) = v52 * v44;
    *(double *)(a3 + 128) = v52 * v45;
    *(double *)(a3 + 136) = v54 * v45 + v44 * v53;
    *(double *)(a3 + 144) = v52 * v46;
    *(double *)(a3 + 152) = v52 * v47;
    *(double *)(a3 + 160) = v54 * v47 + v46 * v53;
    double v57 = -v7 / v56;
    *(double *)(a3 + 168) = v52 * v48;
    *(double *)(a3 + 176) = v52 * v49;
    *(double *)(a3 + 88) = v50 * v48;
    *(double *)(a3 + 96) = v55 * v36;
    *(double *)(a3 + 104) = v55 * v39;
    *(double *)(a3 + 112) = v55 * v42;
    *(double *)(a3 + 184) = v54 * v49 + v48 * v53;
    *(double *)(a3 + 192) = 1.0 / v56 * v36;
    *(double *)(a3 + 200) = 1.0 / v56 * v39;
    *(double *)(a3 + 208) = 1.0 / v56 * v42;
    *(double *)(a3 + 216) = 1.0 / v56 * v37;
    *(double *)(a3 + 224) = 1.0 / v56 * v40;
    double v58 = 1.0 / v56 * v43;
    double v59 = -v5 / v56;
    *(double *)(a3 + 232) = v58;
    *(double *)(a3 + 240) = v57 * v37 + v36 * v59;
    *(double *)(a3 + 248) = v57 * v40 + v39 * v59;
    *(double *)(a3 + 256) = v57 * v43 + v42 * v59;
  }
  return result;
}

double *sub_262E82CB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, double *a5)
{
  uint64_t v45 = 0;
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
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v9 = *(_OWORD *)(a4 + 144);
  v27[8] = *(_OWORD *)(a4 + 128);
  v27[9] = v9;
  v27[10] = *(_OWORD *)(a4 + 160);
  uint64_t v28 = *(void *)(a4 + 176);
  long long v10 = *(_OWORD *)(a4 + 80);
  v27[4] = *(_OWORD *)(a4 + 64);
  v27[5] = v10;
  long long v11 = *(_OWORD *)(a4 + 112);
  v27[6] = *(_OWORD *)(a4 + 96);
  v27[7] = v11;
  long long v12 = *(_OWORD *)(a4 + 16);
  v27[0] = *(_OWORD *)a4;
  v27[1] = v12;
  long long v13 = *(_OWORD *)(a4 + 48);
  v27[2] = *(_OWORD *)(a4 + 32);
  v27[3] = v13;
  float result = sub_262E82A44((double *)v27, 0, (uint64_t)&v29);
  if (a3 >= 1)
  {
    long long v15 = v29;
    long long v16 = v30;
    long long v17 = v31;
    long long v18 = v32;
    uint64_t v19 = a3;
    double v20 = *(double *)&v33;
    double v21 = (double *)(a2 + 8);
    double v22 = (double *)(a1 + 8);
    do
    {
      double v23 = *(v22 - 1);
      double v24 = *(double *)&v16 + *((double *)&v15 + 1) * *v22 + *(double *)&v15 * v23;
      double v25 = *((double *)&v17 + 1) + *(double *)&v17 * *v22 + *((double *)&v16 + 1) * v23;
      double v26 = v20 + *((double *)&v18 + 1) * *v22 + *(double *)&v18 * v23 + *v21 * v25 + v24 * *(v21 - 1);
      *a5++ = sqrt(v26 * v26 / (v25 * v25 + v24 * v24) + 0.00155346992);
      v21 += 2;
      v22 += 2;
      --v19;
    }
    while (v19);
  }
  return result;
}

double sub_262E82DF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, double *a5)
{
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v9 = *(_OWORD *)(a4 + 144);
  v23[8] = *(_OWORD *)(a4 + 128);
  v23[9] = v9;
  v23[10] = *(_OWORD *)(a4 + 160);
  uint64_t v24 = *(void *)(a4 + 176);
  long long v10 = *(_OWORD *)(a4 + 80);
  v23[4] = *(_OWORD *)(a4 + 64);
  v23[5] = v10;
  long long v11 = *(_OWORD *)(a4 + 112);
  v23[6] = *(_OWORD *)(a4 + 96);
  v23[7] = v11;
  long long v12 = *(_OWORD *)(a4 + 16);
  v23[0] = *(_OWORD *)a4;
  v23[1] = v12;
  long long v13 = *(_OWORD *)(a4 + 48);
  v23[2] = *(_OWORD *)(a4 + 32);
  v23[3] = v13;
  sub_262E82A44((double *)v23, 0, (uint64_t)&v25);
  if (a3 < 1)
  {
    double v17 = 0.0;
  }
  else
  {
    uint64_t v14 = a3;
    long long v15 = (double *)(a2 + 8);
    long long v16 = (double *)(a1 + 8);
    double v17 = 0.0;
    do
    {
      double v18 = *(v16 - 1);
      double v19 = *(double *)&v26 + *((double *)&v25 + 1) * *v16 + *(double *)&v25 * v18;
      double v20 = *((double *)&v27 + 1) + *(double *)&v27 * *v16 + *((double *)&v26 + 1) * v18;
      double v21 = *(double *)&v29 + *((double *)&v28 + 1) * *v16 + *(double *)&v28 * v18 + *v15 * v20 + v19 * *(v15 - 1);
      double v17 = v17 + sqrt(v21 * v21 / (v20 * v20 + v19 * v19) + 0.00155346992);
      v15 += 2;
      v16 += 2;
      --v14;
    }
    while (v14);
  }
  double result = v17 / (double)a3;
  *a5 = result;
  return result;
}

double sub_262E82F58(uint64_t a1, uint64_t a2, int a3, uint64_t a4, double *a5, float64x2_t *a6)
{
  double v65 = 0.0;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
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
  long long v11 = *(_OWORD *)(a4 + 144);
  v47[8] = *(_OWORD *)(a4 + 128);
  v47[9] = v11;
  v47[10] = *(_OWORD *)(a4 + 160);
  uint64_t v48 = *(void *)(a4 + 176);
  long long v12 = *(_OWORD *)(a4 + 80);
  v47[4] = *(_OWORD *)(a4 + 64);
  v47[5] = v12;
  long long v13 = *(_OWORD *)(a4 + 112);
  v47[6] = *(_OWORD *)(a4 + 96);
  v47[7] = v13;
  long long v14 = *(_OWORD *)(a4 + 16);
  v47[0] = *(_OWORD *)a4;
  v47[1] = v14;
  long long v15 = *(_OWORD *)(a4 + 48);
  v47[2] = *(_OWORD *)(a4 + 32);
  v47[3] = v15;
  sub_262E82A44((double *)v47, 1, (uint64_t)&v49);
  if (a3 < 1)
  {
    double v22 = 0.0;
    double v21 = 0.0;
    double v20 = 0.0;
    float64x2_t v19 = 0uLL;
  }
  else
  {
    uint64_t v16 = a3;
    double v17 = (double *)(a2 + 8);
    double v18 = (double *)(a1 + 8);
    float64x2_t v19 = 0uLL;
    double v20 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
    do
    {
      double v23 = *(v18 - 1);
      double v24 = *(v17 - 1);
      double v25 = *(double *)&v50 + *v18 * *((double *)&v49 + 1) + *(double *)&v49 * v23;
      double v26 = *((double *)&v51 + 1) + *v18 * *(double *)&v51 + *((double *)&v50 + 1) * v23;
      double v27 = *v18 * *((double *)&v55 + 1) + *(double *)&v55 * v23;
      double v28 = *((double *)&v57 + 1) + *v18 * *(double *)&v57 + *((double *)&v56 + 1) * v23;
      double v29 = *(double *)&v59 + *v18 * *((double *)&v58 + 1) + *(double *)&v58 * v23;
      double v30 = *v17 * v26 + v25 * v24 + *(double *)&v53 + *v18 * *((double *)&v52 + 1) + *(double *)&v52 * v23;
      double v31 = *(double *)&v62 + *v18 * *((double *)&v61 + 1) + *(double *)&v61 * v23;
      double v32 = *v17 * v29 + v24 * v28 + *((double *)&v60 + 1) + *v18 * *(double *)&v60 + *((double *)&v59 + 1) * v23;
      double v33 = *((double *)&v63 + 1) + *v18 * *(double *)&v63 + *((double *)&v62 + 1) * v23;
      double v34 = *v17 * *(double *)&v54 + v24 * *((double *)&v53 + 1);
      double v35 = *v17 * v33 + v24 * v31 + v65 + *v18 * *((double *)&v64 + 1) + *(double *)&v64 * v23;
      double v36 = v26 * v26 + v25 * v25;
      double v37 = v26 * v29 + v25 * v28;
      double v38 = v30 * v30 / v36;
      double v39 = v30 / v36;
      double v40 = v26 * v33 + v25 * v31;
      v41.f64[0] = *((double *)&v54 + 1) + v34 - v39 * (v26 * *(double *)&v54 + v25 * *((double *)&v53 + 1));
      v41.f64[1] = *(double *)&v56 + v27;
      double v42 = v32 - v39 * v37;
      double v43 = v35 - v39 * v40;
      double v44 = sqrt(v38 + 0.00155346992);
      double v45 = v39 / v44;
      double v20 = v20 + v44;
      float64x2_t v19 = vaddq_f64(v19, vmulq_n_f64(v41, v45));
      double v21 = v21 + v45 * v42;
      double v22 = v22 + v45 * v43;
      v17 += 2;
      v18 += 2;
      --v16;
    }
    while (v16);
  }
  *a5 = v20 / (double)a3;
  *a6 = vdivq_f64(v19, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a3), 0));
  double result = v21 / (double)a3;
  a6[1].f64[0] = result;
  a6[1].f64[1] = v22 / (double)a3;
  return result;
}

void *sub_262E83290(void (*a1)(void, void, void, void), void (*a2)(void, void, void), uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, double *a8, void *a9, uint64_t a10)
{
  uint64_t v10 = a10;
  v108[9] = *MEMORY[0x263EF8340];
  char v91 = 0;
  __int16 v90 = 0;
  memset(v106, 0, sizeof(v106));
  long long v11 = (double *)&unk_262E89B18;
  memset(&__src[2], 0, 48);
  if (a8) {
    long long v11 = a8;
  }
  memset(__src, 0, 32);
  if (a5 >= 11 || a5 <= 0 || (uint64_t v12 = *((unsigned int *)v11 + 2), (int)v12 >= 11) || (int)v12 <= 0)
  {
    FigDebugAssert3();
    int v73 = 0;
    BOOL v74 = 0;
    double v21 = 0.0;
    double v82 = 0.0;
  }
  else
  {
    uint64_t v15 = 0;
    int v80 = *((_DWORD *)v11 + 14);
    int v86 = *((_DWORD *)v11 + 18);
    double v16 = *v11;
    double v17 = v11[2];
    double v18 = v11[3];
    double v77 = v11[4];
    double v78 = v11[6];
    double v81 = v11[5];
    do
    {
      double v19 = *(double *)(a4 + v15);
      if (v19 >= *(double *)(a7 + v15)) {
        double v19 = *(double *)(a7 + v15);
      }
      if (v19 <= *(double *)(a6 + v15)) {
        double v19 = *(double *)(a6 + v15);
      }
      *(double *)((char *)v106 + v15) = v19;
      v15 += 8;
    }
    while (8 * a5 != v15);
    double v92 = 0.0;
    double v20 = v11[8];
    a1(v106, a3, &v92, v104);
    double v21 = v92;
    __memcpy_chk();
    for (uint64_t i = 0; i != v12; ++i)
      *(double *)&v102[i] = v21;
    if (v80 < 1)
    {
      int v73 = 0;
      double v82 = v21;
    }
    else
    {
      int v84 = 0;
      uint64_t v23 = 8 * a5;
      double v76 = v21;
      double v82 = v21;
      int v24 = a5;
      while (1)
      {
        unint64_t v25 = 0;
        double v89 = 0.0;
        do
        {
          *(double *)&v108[v25 / 8 - 1] = *(double *)((char *)v106 + v25) - *(double *)&v104[v25];
          v25 += 8;
        }
        while (v23 != v25);
        unint64_t v26 = 0;
        do
        {
          double v27 = *(double *)&v108[v26 / 8 - 1];
          if (v27 >= *(double *)(a7 + v26)) {
            double v27 = *(double *)(a7 + v26);
          }
          if (v27 <= *(double *)(a6 + v26)) {
            double v27 = *(double *)(a6 + v26);
          }
          *(double *)&v108[v26 / 8 - 1] = v27;
          v26 += 8;
        }
        while (v23 != v26);
        unint64_t v28 = 0;
        do
        {
          *(double *)&v108[v28 / 8 - 1] = *(double *)&v108[v28 / 8 - 1] - *(double *)((char *)v106 + v28);
          v28 += 8;
        }
        while (v23 != v28);
        unint64_t v29 = 0;
        do
        {
          double v30 = *(double *)&v108[v29 / 8 - 1];
          if (v30 < 0.0) {
            double v30 = -v30;
          }
          *(double *)&v108[v29 / 8 - 1] = v30;
          v29 += 8;
        }
        while (v23 != v29);
        double v31 = v107;
        if (v24 >= 2)
        {
          double v32 = (double *)v108;
          uint64_t v33 = a5 - 1;
          do
          {
            double v34 = *v32++;
            double v35 = v34;
            if (v34 > v31) {
              double v31 = v35;
            }
            --v33;
          }
          while (v33);
        }
        if (v31 <= v78) {
          break;
        }
        uint64_t v36 = 0;
        do
        {
          *(double *)&v99[v36 + 72] = v20 * *(double *)&v104[v36];
          v36 += 8;
        }
        while (v23 != v36);
        uint64_t v37 = 0;
        do
        {
          *(double *)&v99[v37 + 72] = *(double *)((char *)v106 + v37) - *(double *)&v99[v37 + 72];
          v37 += 8;
        }
        while (v23 != v37);
        uint64_t v38 = 0;
        do
        {
          double v39 = *(double *)&v99[v38 + 72];
          if (v39 >= *(double *)(a7 + v38)) {
            double v39 = *(double *)(a7 + v38);
          }
          if (v39 <= *(double *)(a6 + v38)) {
            double v39 = *(double *)(a6 + v38);
          }
          *(double *)&v99[v38 + 72] = v39;
          v38 += 8;
        }
        while (v23 != v38);
        uint64_t v40 = 0;
        do
        {
          *(double *)&v99[v40 + 72] = *(double *)&v99[v40 + 72] - *(double *)((char *)v106 + v40);
          v40 += 8;
        }
        while (v23 != v40);
        double v41 = *(double *)v102;
        if ((int)v12 >= 2)
        {
          double v42 = (double *)&v103;
          uint64_t v43 = v12 - 1;
          do
          {
            double v44 = *v42++;
            double v45 = v44;
            if (v44 > v41) {
              double v41 = v45;
            }
            --v43;
          }
          while (v43);
        }
        uint64_t v46 = 0;
        do
        {
          *(double *)&v99[v46 - 8] = *(double *)&v104[v46] * *(double *)&v99[v46 + 72];
          v46 += 8;
        }
        while (v23 != v46);
        double v47 = v98;
        if (v24 > 1)
        {
          uint64_t v48 = (double *)v99;
          uint64_t v49 = a5 - 1;
          do
          {
            double v50 = *v48++;
            double v47 = v47 + v50;
            --v49;
          }
          while (v49);
        }
        if (v86 < 1)
        {
          double v52 = 1.0;
        }
        else
        {
          int v51 = 0;
          double v52 = 1.0;
          do
          {
            unint64_t v53 = 0;
            double v88 = 0.0;
            do
            {
              *(double *)&v108[v53 / 8 - 1] = v52 * *(double *)&v99[v53 + 72];
              v53 += 8;
            }
            while (v23 != v53);
            unint64_t v54 = 0;
            do
            {
              *(double *)&v93[v54] = *(double *)((char *)v106 + v54) + *(double *)&v108[v54 / 8 - 1];
              v54 += 8;
            }
            while (v23 != v54);
            a2(v93, a3, &v88);
            if (v88 <= v41 + v16 * v52 * v47) {
              break;
            }
            double v55 = v47 * (v52 * v52 * -0.5) / (v88 - v92 - v52 * v47);
            BOOL v56 = v55 > v18 * v52 || v17 > v55;
            double v52 = v56 ? v52 * 0.5 : v47 * (v52 * v52 * -0.5) / (v88 - v92 - v52 * v47);
            ++v51;
          }
          while (v51 != v86);
        }
        uint64_t v57 = 0;
        do
        {
          *(double *)&v101[v57] = v52 * *(double *)&v99[v57 + 72];
          v57 += 8;
        }
        while (v23 != v57);
        uint64_t v58 = 0;
        do
        {
          *(double *)&v101[v58] = *(double *)&v101[v58] + *(double *)((char *)v106 + v58);
          v58 += 8;
        }
        while (v23 != v58);
        a1(v101, a3, &v89, v100);
        uint64_t v59 = 0;
        do
        {
          *(double *)&v97[v59 + 152] = *(double *)&v101[v59] - *(double *)((char *)v106 + v59);
          v59 += 8;
        }
        while (v23 != v59);
        uint64_t v60 = 0;
        do
        {
          *(double *)&v97[v60 + 72] = *(double *)&v100[v60] - *(double *)&v104[v60];
          v60 += 8;
        }
        while (v23 != v60);
        unint64_t v61 = 0;
        do
        {
          *(double *)&v94[v61 / 8] = *(double *)&v97[v61 + 152] * *(double *)&v97[v61 + 72];
          v61 += 8;
        }
        while (v23 != v61);
        double v62 = *(double *)v94;
        if (a5 >= 2)
        {
          long long v63 = (double *)&v95;
          uint64_t v64 = a5 - 1;
          do
          {
            double v65 = *v63++;
            double v62 = v62 + v65;
            --v64;
          }
          while (v64);
        }
        double v20 = v81;
        if (v62 > 0.0)
        {
          uint64_t v66 = 0;
          do
          {
            *(double *)&v97[v66 - 8] = *(double *)&v97[v66 + 152] * *(double *)&v97[v66 + 152];
            v66 += 8;
          }
          while (v23 != v66);
          double v67 = v96;
          if (a5 >= 2)
          {
            long long v68 = (double *)v97;
            uint64_t v69 = a5 - 1;
            do
            {
              double v70 = *v68++;
              double v67 = v67 + v70;
              --v69;
            }
            while (v69);
          }
          double v71 = v67 / v62;
          if (v71 >= v81) {
            double v71 = v81;
          }
          if (v77 <= v71) {
            double v20 = v71;
          }
          else {
            double v20 = v77;
          }
        }
        __memcpy_chk();
        double v72 = v89;
        double v92 = v89;
        __memcpy_chk();
        *(double *)&v102[++v84 % (int)v12] = v72;
        if (v72 < v82)
        {
          __memcpy_chk();
          double v82 = v72;
        }
        int v24 = a5;
        if (v84 == v80)
        {
          int v73 = v80;
          uint64_t v10 = a10;
          double v21 = v76;
          goto LABEL_105;
        }
      }
      uint64_t v10 = a10;
      double v21 = v76;
      int v73 = v84;
    }
LABEL_105:
    BOOL v74 = v73 < v80;
  }
  double result = memcpy(a9, __src, 8 * a5);
  if (v10)
  {
    *(_DWORD *)uint64_t v10 = v73;
    *(unsigned char *)(v10 + 4) = v74;
    *(_WORD *)(v10 + 5) = v90;
    *(unsigned char *)(v10 + 7) = v91;
    *(double *)(v10 + 8) = v21;
    *(double *)(v10 + 16) = v82;
  }
  return result;
}

__n128 sub_262E83B00@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v9 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(a7 + 128) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(a7 + 144) = v9;
  *(_OWORD *)(a7 + 160) = *(_OWORD *)(a4 + 160);
  *(void *)(a7 + 176) = *(void *)(a4 + 176);
  long long v10 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(a7 + 64) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(a7 + 80) = v10;
  long long v11 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(a7 + 96) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(a7 + 112) = v11;
  long long v12 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)a7 = *(_OWORD *)a4;
  *(_OWORD *)(a7 + 16) = v12;
  long long v13 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(a7 + 32) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(a7 + 48) = v13;
  *(void *)&long long v13 = *(void *)(a4 + 24);
  v29[0] = *(double *)(a4 + 16);
  *(void *)&v29[1] = v13;
  double v14 = *(double *)(a4 + 8);
  double v30 = *(double *)a4;
  double v31 = v14;
  double v15 = *(double *)(a5 + 32);
  double v16 = *(double *)(a5 + 40);
  v28[0] = v29[0] - v15;
  v28[1] = *(double *)&v13 - v16;
  double v17 = *(double *)(a5 + 16);
  double v18 = *(double *)(a5 + 24);
  v28[2] = v30 - v17;
  v28[3] = v14 - v18;
  v27[0] = v29[0] + v15;
  v27[1] = *(double *)&v13 + v16;
  v27[2] = v30 + v17;
  v27[3] = v14 + v18;
  long long v25 = 0u;
  v24[0] = a1;
  v24[1] = a2;
  v24[2] = a3;
  v24[3] = a4;
  long long v22 = unk_262E89B98;
  long long v23 = xmmword_262E89BA8;
  v21[1] = unk_262E89B78;
  v21[2] = xmmword_262E89B88;
  v21[0] = xmmword_262E89B68;
  *(void *)&long long v22 = *(void *)(a5 + 104);
  int v19 = *(_DWORD *)(a5 + 116);
  DWORD2(v22) = *(_DWORD *)(a5 + 112);
  DWORD2(v23) = v19;
  sub_262E83290((void (*)(void, void, void, void))sub_262E83C7C, (void (*)(void, void, void))sub_262E83CF8, (uint64_t)v24, (uint64_t)v29, 4, (uint64_t)v28, (uint64_t)v27, (double *)v21, v26, a6);
  *(unsigned char *)(a6 + 4) = 1;
  __n128 result = (__n128)v26[0];
  *(_OWORD *)a7 = v26[1];
  *(__n128 *)(a7 + 16) = result;
  return result;
}

double sub_262E83C7C(long long *a1, uint64_t a2, double *a3, float64x2_t *a4)
{
  double v4 = *(long long **)(a2 + 24);
  long long v5 = v4[2];
  long long v6 = v4[3];
  long long v7 = v4[1];
  long long v16 = *v4;
  long long v17 = v7;
  long long v18 = v5;
  long long v19 = v6;
  long long v8 = v4[4];
  long long v9 = v4[5];
  long long v10 = v4[7];
  long long v22 = v4[6];
  long long v23 = v10;
  long long v20 = v8;
  long long v21 = v9;
  long long v11 = v4[8];
  long long v12 = v4[9];
  long long v13 = v4[10];
  uint64_t v27 = *((void *)v4 + 22);
  long long v25 = v12;
  long long v26 = v13;
  long long v24 = v11;
  long long v14 = *a1;
  long long v16 = a1[1];
  long long v17 = v14;
  return sub_262E82F58(*(void *)a2, *(void *)(a2 + 8), *(_DWORD *)(a2 + 16), (uint64_t)&v16, a3, a4);
}

double sub_262E83CF8(long long *a1, uint64_t a2, double *a3)
{
  double v3 = *(long long **)(a2 + 24);
  long long v4 = v3[2];
  long long v5 = v3[3];
  long long v6 = v3[1];
  long long v15 = *v3;
  long long v16 = v6;
  long long v17 = v4;
  long long v18 = v5;
  long long v7 = v3[4];
  long long v8 = v3[5];
  long long v9 = v3[7];
  long long v21 = v3[6];
  long long v22 = v9;
  long long v19 = v7;
  long long v20 = v8;
  long long v10 = v3[8];
  long long v11 = v3[9];
  long long v12 = v3[10];
  uint64_t v26 = *((void *)v3 + 22);
  long long v24 = v11;
  long long v25 = v12;
  long long v23 = v10;
  long long v13 = *a1;
  long long v15 = a1[1];
  long long v16 = v13;
  return sub_262E82DF8(*(void *)a2, *(void *)(a2 + 8), *(_DWORD *)(a2 + 16), (uint64_t)&v15, a3);
}

uint64_t sub_262E83D70(uint64_t a1, uint64_t a2, unsigned int a3, double *a4, double *a5, double *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  double v12 = a6[1];
  double v13 = a6[2];
  double v14 = a6[3];
  v44[0] = *a6;
  v44[1] = v13;
  v44[2] = v12;
  v44[3] = v14;
  double v15 = a4[2];
  double v45 = a4[1];
  double v46 = v15;
  double v16 = a5[1];
  double v17 = a5[2];
  double v47 = a4[3];
  double v48 = v16;
  double v18 = a5[3];
  double v49 = v17;
  double v50 = v18;
  double v19 = *(double *)(a7 + 16);
  double v20 = *(double *)(a7 + 24);
  double v21 = *(double *)(a7 + 32);
  double v22 = *(double *)(a7 + 40);
  v43[0] = v44[0] - v19;
  v43[1] = v13 - v21;
  v43[2] = v12 - v20;
  v43[3] = v14 - v22;
  double v23 = *(double *)(a7 + 64);
  double v24 = *(double *)(a7 + 72);
  double v25 = *(double *)(a7 + 80);
  double v26 = *(double *)(a7 + 88);
  v43[4] = v45 - v23;
  v43[5] = v15 - v25;
  v43[6] = v47 - v25;
  v43[7] = v16 - v24;
  v43[8] = v17 - v26;
  v43[9] = v18 - v26;
  v42[0] = v44[0] + v19;
  v42[1] = v13 + v21;
  v42[2] = v12 + v20;
  v42[3] = v14 + v22;
  v42[4] = v45 + v23;
  v42[5] = v15 + v25;
  v42[6] = v25 + v47;
  v42[7] = v16 + v24;
  v42[8] = v17 + v26;
  v42[9] = v26 + v18;
  v34[0] = a1;
  v34[1] = a2;
  v34[3] = a6;
  v34[2] = a3;
  v34[4] = a4;
  v34[5] = a5;
  long long v32 = unk_262E89B98;
  long long v33 = xmmword_262E89BA8;
  v31[1] = unk_262E89B78;
  v31[2] = xmmword_262E89B88;
  v31[0] = xmmword_262E89B68;
  *(void *)&long long v32 = *(void *)(a7 + 104);
  int v27 = *(_DWORD *)(a7 + 116);
  DWORD2(v32) = *(_DWORD *)(a7 + 112);
  DWORD2(v33) = v27;
  sub_262E83290((void (*)(void, void, void, void))sub_262E83F64, (void (*)(void, void, void))sub_262E8407C, (uint64_t)v34, (uint64_t)v44, 10, (uint64_t)v43, (uint64_t)v42, (double *)v31, &v35, a8);
  *(unsigned char *)(a8 + 4) = 1;
  uint64_t v28 = v37;
  *(void *)a6 = v35;
  *(int8x16_t *)(a6 + 1) = vextq_s8(v36, v36, 8uLL);
  *((void *)a6 + 3) = v28;
  *(_OWORD *)(a4 + 1) = v38;
  uint64_t v29 = v41;
  *((void *)a4 + 3) = v39;
  *(_OWORD *)(a5 + 1) = v40;
  *((void *)a5 + 3) = v29;
  return 0;
}

double *sub_262E83F64(uint64_t a1, uint64_t a2, double *a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a2 + 24);
  long long v5 = *(_OWORD **)(a2 + 32);
  long long v6 = *(_OWORD **)(a2 + 40);
  long long v7 = *(_OWORD *)(v4 + 32);
  long long v8 = *(_OWORD *)(v4 + 48);
  long long v9 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)double v49 = *(_OWORD *)v4;
  *(_OWORD *)&v49[16] = v9;
  long long v50 = v7;
  long long v51 = v8;
  long long v10 = *(_OWORD *)(v4 + 64);
  long long v11 = *(_OWORD *)(v4 + 80);
  long long v12 = *(_OWORD *)(v4 + 112);
  long long v54 = *(_OWORD *)(v4 + 96);
  long long v55 = v12;
  long long v52 = v10;
  long long v53 = v11;
  long long v13 = *(_OWORD *)(v4 + 128);
  long long v14 = *(_OWORD *)(v4 + 144);
  long long v15 = *(_OWORD *)(v4 + 160);
  uint64_t v59 = *(void *)(v4 + 176);
  long long v57 = v14;
  long long v58 = v15;
  long long v56 = v13;
  *(void *)&long long v13 = *(void *)a1;
  *(int8x16_t *)&v49[8] = vextq_s8(*(int8x16_t *)(a1 + 8), *(int8x16_t *)(a1 + 8), 8uLL);
  *(void *)&long long v14 = *(void *)(a1 + 24);
  *(void *)double v49 = v13;
  *(void *)&v49[24] = v14;
  long long v16 = v5[1];
  *(_OWORD *)long long v40 = *v5;
  *(_OWORD *)&v40[16] = v16;
  long long v18 = v5[8];
  long long v17 = v5[9];
  long long v19 = v5[7];
  long long v45 = v5[6];
  long long v46 = v19;
  long long v47 = v18;
  long long v48 = v17;
  long long v21 = v5[4];
  long long v20 = v5[5];
  long long v22 = v5[3];
  long long v41 = v5[2];
  long long v42 = v22;
  long long v43 = v21;
  long long v44 = v20;
  *(_OWORD *)&v40[8] = *(_OWORD *)(a1 + 32);
  *(void *)&v40[24] = *(void *)(a1 + 48);
  long long v23 = v6[1];
  *(_OWORD *)double v31 = *v6;
  *(_OWORD *)&v31[16] = v23;
  long long v25 = v6[8];
  long long v24 = v6[9];
  long long v26 = v6[7];
  long long v36 = v6[6];
  long long v37 = v26;
  long long v38 = v25;
  long long v39 = v24;
  long long v28 = v6[4];
  long long v27 = v6[5];
  long long v29 = v6[3];
  long long v32 = v6[2];
  long long v33 = v29;
  long long v34 = v28;
  long long v35 = v27;
  *(_OWORD *)&v31[8] = *(_OWORD *)(a1 + 56);
  *(void *)&v31[24] = *(void *)(a1 + 72);
  return sub_262E71EF8(*(void *)a2, *(void *)(a2 + 8), *(_DWORD *)(a2 + 16), (double *)v40, (double *)v31, (uint64_t)v49, a3, a4);
}

double *sub_262E8407C(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(_OWORD **)(a2 + 32);
  long long v5 = *(_OWORD **)(a2 + 40);
  long long v6 = *(_OWORD *)(v3 + 32);
  long long v7 = *(_OWORD *)(v3 + 48);
  long long v8 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)long long v48 = *(_OWORD *)v3;
  *(_OWORD *)&v48[16] = v8;
  long long v49 = v6;
  long long v50 = v7;
  long long v9 = *(_OWORD *)(v3 + 64);
  long long v10 = *(_OWORD *)(v3 + 80);
  long long v11 = *(_OWORD *)(v3 + 112);
  long long v53 = *(_OWORD *)(v3 + 96);
  long long v54 = v11;
  long long v51 = v9;
  long long v52 = v10;
  long long v12 = *(_OWORD *)(v3 + 128);
  long long v13 = *(_OWORD *)(v3 + 144);
  long long v14 = *(_OWORD *)(v3 + 160);
  uint64_t v58 = *(void *)(v3 + 176);
  long long v56 = v13;
  long long v57 = v14;
  long long v55 = v12;
  *(void *)&long long v12 = *(void *)a1;
  *(int8x16_t *)&v48[8] = vextq_s8(*(int8x16_t *)(a1 + 8), *(int8x16_t *)(a1 + 8), 8uLL);
  *(void *)&long long v13 = *(void *)(a1 + 24);
  *(void *)long long v48 = v12;
  *(void *)&v48[24] = v13;
  long long v15 = v4[1];
  *(_OWORD *)long long v39 = *v4;
  *(_OWORD *)&v39[16] = v15;
  long long v17 = v4[8];
  long long v16 = v4[9];
  long long v18 = v4[7];
  long long v44 = v4[6];
  long long v45 = v18;
  long long v46 = v17;
  long long v47 = v16;
  long long v20 = v4[4];
  long long v19 = v4[5];
  long long v21 = v4[3];
  long long v40 = v4[2];
  long long v41 = v21;
  long long v42 = v20;
  long long v43 = v19;
  *(_OWORD *)&v39[8] = *(_OWORD *)(a1 + 32);
  *(void *)&v39[24] = *(void *)(a1 + 48);
  long long v22 = v5[1];
  *(_OWORD *)double v30 = *v5;
  *(_OWORD *)&v30[16] = v22;
  long long v24 = v5[8];
  long long v23 = v5[9];
  long long v25 = v5[7];
  long long v35 = v5[6];
  long long v36 = v25;
  long long v37 = v24;
  long long v38 = v23;
  long long v27 = v5[4];
  long long v26 = v5[5];
  long long v28 = v5[3];
  long long v31 = v5[2];
  long long v32 = v28;
  long long v33 = v27;
  long long v34 = v26;
  *(_OWORD *)&v30[8] = *(_OWORD *)(a1 + 56);
  *(void *)&v30[24] = *(void *)(a1 + 72);
  return sub_262E72AC4(*(void *)a2, *(void *)(a2 + 8), *(_DWORD *)(a2 + 16), (double *)v39, (double *)v30, (uint64_t)v48, a3);
}

uint64_t sub_262E84F88(CVPixelBufferRef *a1, int a2, int a3, int a4)
{
  if (a1)
  {
    long long v7 = *a1;
    if (v7)
    {
      if (CVPixelBufferGetWidth(v7) == a2
        && CVPixelBufferGetHeight(*a1) == a3
        && CVPixelBufferGetPixelFormatType(*a1) == a4)
      {
        return 1;
      }
      if (*a1)
      {
        CFRelease(*a1);
        *a1 = 0;
      }
    }
    uint64_t PixelBuffer = CreatePixelBuffer();
    *a1 = (CVPixelBufferRef)PixelBuffer;
    if (PixelBuffer) {
      return 1;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

uint64_t sub_262E86298(float64x2_t *a1, double *a2, uint64_t a3, float a4, float a5)
{
  int v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  if (a1 && a2 && a3)
  {
    *(float32x2_t *)&long long v29 = vcvt_f32_f64(a1[1]);
    BYTE12(v34) = 1;
    *((void *)&v29 + 1) = __PAIR64__(LODWORD(a5), LODWORD(a4));
    double v5 = a1->f64[0];
    double v6 = a1->f64[1];
    float v7 = a1->f64[0];
    *(float *)&long long v30 = v7;
    *(double *)&uint64_t v8 = v5 * v6;
    float64x2_t v9 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[1] * *a2), 0);
    float64x2_t v10 = (float64x2_t)vdupq_lane_s64(v8, 0);
    long long v11 = (float64x2_t *)(a2 + 12);
    long long v12 = a1 + 6;
    for (uint64_t i = 32; i != 64; i += 8)
    {
      float64x2_t v14 = v11[-4];
      float64x2_t v15 = *v11++;
      long long v16 = (float32x2_t *)((char *)&v25 + i);
      v16[-4] = vcvt_f32_f64(vmlaq_f64(v14, v15, v9));
      float64x2_t v17 = v12[-4];
      float64x2_t v18 = *v12++;
      *long long v16 = vcvt_f32_f64(vmlaq_f64(v17, v18, v10));
    }
    uint64_t result = 0;
    *(_DWORD *)(a3 + 160) = v35;
    long long v20 = v34;
    *(_OWORD *)(a3 + 128) = v33;
    *(_OWORD *)(a3 + 144) = v20;
    long long v21 = v30;
    *(_OWORD *)(a3 + 64) = v29;
    *(_OWORD *)(a3 + 80) = v21;
    long long v22 = v32;
    *(_OWORD *)(a3 + 96) = v31;
    *(_OWORD *)(a3 + 112) = v22;
    long long v23 = v26;
    *(_OWORD *)a3 = v25;
    *(_OWORD *)(a3 + 16) = v23;
    long long v24 = v28;
    *(_OWORD *)(a3 + 32) = v27;
    *(_OWORD *)(a3 + 48) = v24;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  return result;
}

void sub_262E87C34()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 83, "rangeBC >= 0");
}

void sub_262E87C60()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 84, "rangeCG >= 0");
}

void sub_262E87C8C()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 85, "rangeGY >= 0");
}

void sub_262E87CB8()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 86, "rangeYR >= 0");
}

void sub_262E87CE4()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 87, "rangeRM >= 0");
}

void sub_262E87D10()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 88, "rangeMB >= 0");
}

void sub_262E87D3C()
{
}

void sub_262E87D68()
{
  __assert_rtn("setColorsWheelComponent_", "FigColorsWheel.c", 75, "(k >= 0) && (k < ColorsWheelContext_countColorsTransitions(ctx))");
}

void sub_262E87D94()
{
  __assert_rtn("ColorsWheelContext_computeColorComponent", "FigColorsWheel.c", 159, "(v >= 0.f) && (v <= 1.f)");
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x270EE7160](dict, point);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
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

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t CreatePixelBuffer()
{
  return MEMORY[0x270F12DB8]();
}

uint64_t FigCFDictionaryGetFloat32IfPresent()
{
  return MEMORY[0x270EE8060]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x270EE8068]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x270EE8178]();
}

uint64_t FigMotionComputeAverageSpherePosition()
{
  return MEMORY[0x270F12D38]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x270EE8378]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t WritePixelBufferToFile()
{
  return MEMORY[0x270F12E00]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  MEMORY[0x270ED7E10]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  result.columns[1] = v2;
  result.columns[0] = v1;
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x270EE84C8]();
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

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}