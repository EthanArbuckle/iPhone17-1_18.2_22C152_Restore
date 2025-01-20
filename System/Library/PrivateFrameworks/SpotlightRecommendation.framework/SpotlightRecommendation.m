void sub_25E364948(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_25E3670D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t CLSHInfer::CLSHInfer(uint64_t result, int *a2)
{
  *(void *)(result + 152) = 0;
  *(void *)(result + 144) = a2;
  *(void *)(result + 160) = 0;
  *(_DWORD *)(result + 168) = 16;
  v2 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v2 < 9u)
  {
    LODWORD(v3) = 0;
  }
  else
  {
    uint64_t v3 = v2[4];
    if (v3) {
      LODWORD(v3) = *(int *)((char *)a2 + v3);
    }
  }
  *(_DWORD *)(result + 8) = v3;
  v4 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v4 < 7u)
  {
    LODWORD(v5) = 0;
  }
  else
  {
    uint64_t v5 = v4[3];
    if (v5) {
      LODWORD(v5) = *(int *)((char *)a2 + v5);
    }
  }
  *(_DWORD *)(result + 12) = v5;
  v6 = (unsigned __int16 *)((char *)a2 - *a2);
  unsigned int v7 = *v6;
  v8 = (unsigned int *)((char *)a2 + v6[2] + *(unsigned int *)((char *)a2 + v6[2]));
  *(void *)(result + 48) = *v8;
  *(void *)(result + 136) = v8 + 1;
  if (v7 < 0x19)
  {
    *(void *)(result + 120) = 4;
    *(void *)(result + 128) = 4;
    if (v7 < 0xB)
    {
      *(void *)(result + 56) = 0;
LABEL_39:
      *(void *)(result + 64) = 0;
LABEL_40:
      *(void *)(result + 72) = 0;
LABEL_41:
      *(void *)(result + 80) = 0;
LABEL_42:
      *(void *)(result + 88) = 0;
LABEL_43:
      uint64_t v17 = 0;
      *(void *)(result + 96) = 0;
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v9 = v6[12];
    if (v6[12]) {
      v9 += (uint64_t)a2 + *(unsigned int *)((char *)a2 + v9);
    }
    *(void *)(result + 120) = v9 + 4;
    if (v7 < 0x1B)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = v6[13];
      if (v6[13]) {
        v10 += (uint64_t)a2 + *(unsigned int *)((char *)a2 + v10);
      }
    }
    *(void *)(result + 128) = v10 + 4;
  }
  uint64_t v11 = v6[5];
  if (v6[5]) {
    uint64_t v11 = *(void *)((char *)a2 + v11);
  }
  *(void *)(result + 56) = v11;
  if (v7 < 0xD) {
    goto LABEL_39;
  }
  uint64_t v12 = v6[6];
  if (v6[6]) {
    uint64_t v12 = *(void *)((char *)a2 + v12);
  }
  *(void *)(result + 64) = v12;
  if (v7 < 0xF) {
    goto LABEL_40;
  }
  uint64_t v13 = v6[7];
  if (v6[7]) {
    uint64_t v13 = *(void *)((char *)a2 + v13);
  }
  *(void *)(result + 72) = v13;
  if (v7 < 0x11) {
    goto LABEL_41;
  }
  uint64_t v14 = v6[8];
  if (v6[8]) {
    uint64_t v14 = *(void *)((char *)a2 + v14);
  }
  *(void *)(result + 80) = v14;
  if (v7 < 0x13) {
    goto LABEL_42;
  }
  uint64_t v15 = v6[9];
  if (v6[9]) {
    uint64_t v15 = *(void *)((char *)a2 + v15);
  }
  *(void *)(result + 88) = v15;
  if (v7 < 0x15) {
    goto LABEL_43;
  }
  uint64_t v16 = v6[10];
  if (v6[10]) {
    uint64_t v16 = *(void *)((char *)a2 + v16);
  }
  *(void *)(result + 96) = v16;
  if (v7 < 0x17)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = v6[11];
    if (v17) {
      uint64_t v17 = *(void *)((char *)a2 + v17);
    }
  }
LABEL_44:
  *(void *)(result + 104) = v17;
  *(void *)result = 0x800000003;
  *(unsigned char *)(result + 16) = 0;
  *(void *)(result + 20) = 0x4E2000000002;
  *(_OWORD *)(result + 28) = xmmword_25E3746A0;
  uint64_t v18 = *a2;
  uint64_t v19 = -v18;
  v20 = (unsigned __int16 *)((char *)a2 - v18);
  unsigned int v21 = *v20;
  if (v21 < 0x23)
  {
    LODWORD(v22) = 0;
  }
  else
  {
    v22 = (int *)v20[17];
    if (!v22) {
      goto LABEL_112;
    }
    v23 = (int *)((char *)v22 + (void)a2 + *(unsigned int *)((char *)v22 + (void)a2));
    v24 = (unsigned __int16 *)((char *)v23 - *v23);
    if (*v24 >= 5u && (uint64_t v25 = v24[2]) != 0) {
      int v26 = *(int *)((char *)v23 + v25);
    }
    else {
      int v26 = 3;
    }
    *(_DWORD *)result = v26;
    v27 = (unsigned __int16 *)((char *)a2 - *a2);
    if (*v27 < 0x23u)
    {
      v28 = 0;
    }
    else
    {
      v28 = (int *)v27[17];
      if (v28) {
        v28 = (int *)((char *)v28 + (void)a2 + *(unsigned int *)((char *)v28 + (void)a2));
      }
    }
    v29 = (unsigned __int16 *)((char *)v28 - *v28);
    if (*v29 >= 7u && (uint64_t v30 = v29[3]) != 0) {
      int v31 = *(int *)((char *)v28 + v30);
    }
    else {
      int v31 = 8;
    }
    *(_DWORD *)(result + 4) = v31;
    v32 = (unsigned __int16 *)((char *)a2 - *a2);
    unsigned int v33 = *v32;
    if (v33 < 0x23)
    {
      v22 = 0;
    }
    else
    {
      v22 = (int *)v32[17];
      if (v32[17]) {
        v22 = (int *)((char *)v22 + (void)a2 + *(unsigned int *)((char *)v22 + (void)a2));
      }
    }
    v34 = (unsigned __int16 *)((char *)v22 - *v22);
    LODWORD(v22) = *v34 >= 0x17u && (uint64_t v35 = v34[11]) != 0 && *((unsigned __int8 *)v22 + v35) != 0;
    *(unsigned char *)(result + 16) = (_BYTE)v22;
    if (v33 < 0x23)
    {
      v36 = 0;
    }
    else
    {
      v36 = (int *)v32[17];
      if (v36) {
        v36 = (int *)((char *)v36 + (void)a2 + *(unsigned int *)((char *)v36 + (void)a2));
      }
    }
    v37 = (unsigned __int16 *)((char *)v36 - *v36);
    if (*v37 >= 9u && (uint64_t v38 = v37[4]) != 0) {
      int v39 = *(int *)((char *)v36 + v38);
    }
    else {
      int v39 = 2;
    }
    *(_DWORD *)(result + 20) = v39;
    v40 = (unsigned __int16 *)((char *)a2 - *a2);
    if (*v40 < 0x23u)
    {
      v41 = 0;
    }
    else
    {
      v41 = (int *)v40[17];
      if (v41) {
        v41 = (int *)((char *)v41 + (void)a2 + *(unsigned int *)((char *)v41 + (void)a2));
      }
    }
    v42 = (unsigned __int16 *)((char *)v41 - *v41);
    if (*v42 >= 0xBu && (uint64_t v43 = v42[5]) != 0) {
      uint64_t v44 = *(void *)((char *)v41 + v43);
    }
    else {
      LODWORD(v44) = 20000;
    }
    v45 = 0;
    *(_DWORD *)(result + 24) = v44;
    uint64_t v46 = *a2;
    v47 = (char *)a2 - v46;
    unsigned int v21 = *(unsigned __int16 *)((char *)a2 - v46);
    if (v21 >= 0x23)
    {
      v45 = (int *)*((unsigned __int16 *)v47 + 17);
      if (*((_WORD *)v47 + 17)) {
        v45 = (int *)((char *)v45 + (void)a2 + *(unsigned int *)((char *)v45 + (void)a2));
      }
    }
    v48 = (unsigned __int16 *)((char *)v45 - *v45);
    float v49 = 10.0;
    if (*v48 >= 0xDu)
    {
      uint64_t v50 = v48[6];
      if (v50) {
        float v49 = *(float *)((char *)v45 + v50);
      }
    }
    *(float *)(result + 28) = v49;
    if (v21 < 0x23)
    {
      v51 = 0;
    }
    else
    {
      v51 = (int *)*((unsigned __int16 *)v47 + 17);
      if (*((_WORD *)v47 + 17)) {
        v51 = (int *)((char *)v51 + (void)a2 + *(unsigned int *)((char *)v51 + (void)a2));
      }
    }
    v52 = (unsigned __int16 *)((char *)v51 - *v51);
    float v53 = 10.0;
    if (*v52 >= 0xFu)
    {
      uint64_t v54 = v52[7];
      if (v54) {
        float v53 = *(float *)((char *)v51 + v54);
      }
    }
    *(float *)(result + 32) = v53;
    if (v21 < 0x23)
    {
      v55 = 0;
    }
    else
    {
      v55 = (int *)*((unsigned __int16 *)v47 + 17);
      if (*((_WORD *)v47 + 17)) {
        v55 = (int *)((char *)v55 + (void)a2 + *(unsigned int *)((char *)v55 + (void)a2));
      }
    }
    v56 = (unsigned __int16 *)((char *)v55 - *v55);
    float v57 = 1.0;
    if (*v56 >= 0x13u)
    {
      uint64_t v58 = v56[9];
      if (v58) {
        float v57 = *(float *)((char *)v55 + v58);
      }
    }
    *(float *)(result + 36) = v57;
    if (v21 < 0x23)
    {
      v59 = 0;
    }
    else
    {
      v59 = (int *)*((unsigned __int16 *)v47 + 17);
      if (v59) {
        v59 = (int *)((char *)v59 + (void)a2 + *(unsigned int *)((char *)v59 + (void)a2));
      }
    }
    uint64_t v19 = -v46;
    v60 = (unsigned __int16 *)((char *)v59 - *v59);
    int v61 = 0;
    if (*v60 >= 0x15u)
    {
      uint64_t v62 = v60[10];
      if (v62) {
        int v61 = *(int *)((char *)v59 + v62);
      }
    }
    *(_DWORD *)(result + 40) = v61;
  }
  if (v21 < 0x1D)
  {
    v63 = 0;
    goto LABEL_131;
  }
LABEL_112:
  v63 = (char *)*(unsigned __int16 *)((char *)a2 + v19 + 28);
  if (*(_WORD *)((char *)a2 + v19 + 28))
  {
    v64 = &v63[(void)a2 + *(unsigned int *)&v63[(void)a2]];
    v65 = &v64[*(unsigned __int16 *)&v64[-*(int *)v64 + 8]];
    *(_DWORD *)result = *(_DWORD *)&v65[*(unsigned int *)v65];
    v66 = (unsigned __int16 *)((char *)a2 - *a2);
    if (*v66 < 0x1Du)
    {
      v67 = 0;
    }
    else
    {
      v67 = (int *)v66[14];
      if (v67) {
        v67 = (int *)((char *)v67 + (void)a2 + *(unsigned int *)((char *)v67 + (void)a2));
      }
    }
    v68 = (unsigned __int16 *)((char *)v67 - *v67);
    if (*v68 >= 5u && (uint64_t v69 = v68[2]) != 0) {
      int v70 = *(int *)((char *)v67 + v69);
    }
    else {
      int v70 = 0;
    }
    *(_DWORD *)(result + 4) = v70;
    v71 = (unsigned __int16 *)((char *)a2 - *a2);
    if (*v71 < 0x1Du)
    {
      v72 = 0;
    }
    else
    {
      v72 = (int *)v71[14];
      if (v72) {
        v72 = (int *)((char *)v72 + (void)a2 + *(unsigned int *)((char *)v72 + (void)a2));
      }
    }
    v73 = (unsigned __int16 *)((char *)v72 - *v72);
    if (*v73 >= 7u && (uint64_t v74 = v73[3]) != 0) {
      v75 = (char *)v72 + v74 + *(unsigned int *)((char *)v72 + v74);
    }
    else {
      v75 = 0;
    }
    v63 = v75 + 4;
  }
LABEL_131:
  *(void *)(result + 112) = v63;
  if (v22) {
    LODWORD(v5) = v5 + 2;
  }
  *(_DWORD *)(result + 8) = v5;
  v76 = (unsigned __int16 *)((char *)a2 - *a2);
  unsigned int v77 = *v76;
  if (v77 >= 0x27)
  {
    if (v76[19])
    {
      v78 = (char *)a2 + v76[19] + *(unsigned int *)((char *)a2 + v76[19]);
      *(void *)(result + 152) = &v78[*((unsigned int *)v78 + 1) + 4];
    }
    if (v77 >= 0x29)
    {
      if (v76[20])
      {
        v79 = (char *)a2 + v76[20] + *(unsigned int *)((char *)a2 + v76[20]);
        *(void *)(result + 160) = &v79[*((unsigned int *)v79 + 1) + 4];
      }
    }
  }
  return result;
}

void CLSHInfer::search_lsh_flatbuffer(int *a1@<X0>, const float *a2@<X1>, std::vector<int> *a3@<X8>)
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  uint64_t v6 = MEMORY[0x270FA5388]();
  __Y = (float *)((char *)&v115 - v9);
  a3->__begin_ = 0;
  a3->__end_ = 0;
  a3->__end_cap_.__value_ = 0;
  if (*(void *)(v6 + 144))
  {
    bzero((char *)&v115 - v9, 4 * v8);
    v120 = 0;
    v121 = 0;
    unint64_t v122 = 0;
    std::vector<int>::reserve(a3, a1[6]);
    int v11 = *a1;
    uint64_t v12 = a1[1];
    v116 = a3;
    if ((int)v12 >= 17 && v11 == 1)
    {
      uint64_t v13 = 0;
      uint64_t v14 = a1;
      uint64_t v15 = *((void *)a1 + 14);
      v118 = &v122;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          float v17 = -cblas_sdot(v14[2], a2, 1, (const float *)(v15 + 4 * v14[2] * (int)i), 1);
          uint64_t v18 = v121;
          if ((unint64_t)v121 >= v122)
          {
            v20 = v120;
            unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((v121 - v120) >> 2);
            unint64_t v22 = v21 + 1;
            if (v21 + 1 > 0x1555555555555555) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * ((uint64_t)(v122 - (void)v120) >> 2) > v22) {
              unint64_t v22 = 0x5555555555555556 * ((uint64_t)(v122 - (void)v120) >> 2);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v122 - (void)v120) >> 2) >= 0xAAAAAAAAAAAAAAALL) {
              unint64_t v23 = 0x1555555555555555;
            }
            else {
              unint64_t v23 = v22;
            }
            if (v23)
            {
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::pair<int,int>>>>((uint64_t)v118, v23);
              v20 = v120;
              uint64_t v18 = v121;
            }
            else
            {
              v24 = 0;
            }
            uint64_t v25 = &v24[12 * v21];
            *(float *)uint64_t v25 = v17;
            *((_DWORD *)v25 + 1) = i;
            *((_DWORD *)v25 + 2) = v13;
            int v26 = v25;
            if (v18 != v20)
            {
              do
              {
                uint64_t v27 = *(void *)(v18 - 12);
                v18 -= 12;
                int v28 = *((_DWORD *)v18 + 2);
                *(void *)(v26 - 12) = v27;
                v26 -= 12;
                *((_DWORD *)v26 + 2) = v28;
              }
              while (v18 != v20);
              v20 = v120;
            }
            uint64_t v19 = v25 + 12;
            v120 = v26;
            v121 = v25 + 12;
            unint64_t v122 = (unint64_t)&v24[12 * v23];
            if (v20) {
              operator delete(v20);
            }
          }
          else
          {
            *(float *)v121 = v17;
            uint64_t v19 = v18 + 12;
            *((_DWORD *)v18 + 1) = i;
            *((_DWORD *)v18 + 2) = v13;
          }
          v121 = v19;
        }
        ++v13;
      }
      while (v13 < *v14);
    }
    else
    {
      cblas_sgemv(CblasRowMajor, CblasNoTrans, v11 * v12, a1[2], *((const float *)a1 + 9), *((const float **)a1 + 14), a1[2], a2, 1, *((const float *)a1 + 10), __Y, 1);
      uint64_t v14 = a1;
      int v30 = *a1;
      if (*a1 >= 1)
      {
        unint64_t v31 = 0;
        uint64_t v32 = 0;
        v117 = __Y;
        v118 = &v122;
        do
        {
          uint64_t v33 = v14[1];
          if ((int)v33 >= 1)
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (__Y[(int)v33 * (int)v31 + j] >= 0.0) {
                v32 |= 1 << j;
              }
              else {
                v32 &= ~(1 << j);
              }
            }
          }
          uint64_t v35 = (int *)*((void *)v14 + 18);
          v36 = (unsigned __int16 *)((char *)v35 - *v35);
          if (*v36 >= 0x1Du && (uint64_t v37 = v36[14]) != 0) {
            uint64_t v38 = (int *)((char *)v35 + v37 + *(unsigned int *)((char *)v35 + v37));
          }
          else {
            uint64_t v38 = 0;
          }
          int v39 = (unsigned __int16 *)((char *)v38 - *v38);
          if (*v39 >= 9u && (uint64_t v40 = v39[4]) != 0) {
            v41 = (unsigned int *)((char *)v38 + v40 + *(unsigned int *)((char *)v38 + v40));
          }
          else {
            v41 = 0;
          }
          if (v31 >= *v41) {
            __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
          }
          v42 = (int *)((char *)&v41[v31 + 1] + v41[v31 + 1]);
          uint64_t v43 = (unsigned int *)((char *)v42 + *(unsigned __int16 *)((char *)v42 - *v42 + 6));
          uint64_t v44 = *(unsigned int *)((char *)v43 + *v43);
          if ((int)v44 >= 1)
          {
            for (unint64_t k = 0; k != v44; ++k)
            {
              uint64_t v46 = (unsigned __int16 *)((char *)v42 - *v42);
              if (*v46 < 5u)
              {
                v47 = 0;
              }
              else
              {
                v47 = (unsigned int *)v46[2];
                if (v47) {
                  v47 = (unsigned int *)((char *)v47 + (void)v42 + *(unsigned int *)((char *)v47 + (void)v42));
                }
              }
              if (k >= *v47) {
                __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
              }
              v29.i32[0] = v47[k + 1] ^ v32;
              int8x8_t v29 = vcnt_s8(v29);
              v29.i16[0] = vaddlv_u8((uint8x8_t)v29);
              *(_DWORD *)v123 = v29.i32[0];
              *(void *)&v123[4] = (v31 << 32) | k;
              *(void *)v119 = *(void *)v123;
              *(_DWORD *)&v119[8] = v31;
              float v48 = (float)v29.i32[0];
              uint64_t v49 = *(void *)&v119[4];
              uint64_t v50 = v121;
              if ((unint64_t)v121 >= v122)
              {
                unint64_t v52 = 0xAAAAAAAAAAAAAAABLL * ((v121 - v120) >> 2);
                unint64_t v53 = v52 + 1;
                if (v52 + 1 > 0x1555555555555555) {
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                }
                if (0x5555555555555556 * ((uint64_t)(v122 - (void)v120) >> 2) > v53) {
                  unint64_t v53 = 0x5555555555555556 * ((uint64_t)(v122 - (void)v120) >> 2);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v122 - (void)v120) >> 2) >= 0xAAAAAAAAAAAAAAALL) {
                  unint64_t v54 = 0x1555555555555555;
                }
                else {
                  unint64_t v54 = v53;
                }
                if (v54) {
                  v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::pair<int,int>>>>((uint64_t)v118, v54);
                }
                else {
                  v55 = 0;
                }
                v56 = &v55[12 * v52];
                *(float *)v56 = v48;
                *(void *)(v56 + 4) = v49;
                uint64_t v58 = v120;
                float v57 = v121;
                v59 = v56;
                if (v121 != v120)
                {
                  do
                  {
                    uint64_t v60 = *(void *)(v57 - 12);
                    v57 -= 12;
                    int v61 = *((_DWORD *)v57 + 2);
                    *(void *)(v59 - 12) = v60;
                    v59 -= 12;
                    *((_DWORD *)v59 + 2) = v61;
                  }
                  while (v57 != v58);
                  float v57 = v120;
                }
                v51 = v56 + 12;
                v120 = v59;
                v121 = v56 + 12;
                unint64_t v122 = (unint64_t)&v55[12 * v54];
                if (v57) {
                  operator delete(v57);
                }
              }
              else
              {
                *(float *)v121 = v48;
                *(void *)(v50 + 4) = v49;
                v51 = v50 + 12;
              }
              v121 = v51;
            }
            int v30 = *v14;
            __Y = v117;
          }
          ++v31;
        }
        while ((uint64_t)v31 < v30);
      }
    }
    unint64_t v62 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v121 - v120) >> 2));
    if (v121 == v120) {
      uint64_t v63 = 0;
    }
    else {
      uint64_t v63 = v62;
    }
    v64 = v116;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,false>((int *)v120, v121, (uint64_t)v123, v63, 1);
    v65 = v14;
    v66 = v120;
    if (v121 != v120)
    {
      unint64_t v67 = 0;
      while (1)
      {
        v68 = (int *)*((void *)v65 + 18);
        uint64_t v69 = (unsigned __int16 *)((char *)v68 - *v68);
        if (*v69 >= 0x1Du && (uint64_t v70 = v69[14]) != 0) {
          v71 = (int *)((char *)v68 + v70 + *(unsigned int *)((char *)v68 + v70));
        }
        else {
          v71 = 0;
        }
        v72 = (unsigned __int16 *)((char *)v71 - *v71);
        if (*v72 >= 9u && (uint64_t v73 = v72[4]) != 0) {
          uint64_t v74 = (int *)((char *)v71 + v73 + *(unsigned int *)((char *)v71 + v73));
        }
        else {
          uint64_t v74 = 0;
        }
        v75 = &v66[12 * v67];
        uint64_t v76 = *((unsigned int *)v75 + 2);
        if (*v74 <= v76) {
          __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
        }
        unsigned int v77 = (_DWORD *)((char *)&v74[v76 + 1] + v74[v76 + 1]);
        v78 = (unsigned __int16 *)((char *)v77 - *v77);
        unsigned int v79 = *v78;
        if (v79 < 7)
        {
          v80 = 0;
        }
        else
        {
          v80 = (_DWORD *)v78[3];
          if (v78[3]) {
            v80 = (_DWORD *)((char *)v80 + (void)v77 + *(unsigned int *)((char *)v80 + (void)v77));
          }
        }
        uint64_t v81 = *((unsigned int *)v75 + 1);
        if (*v80 <= v81) {
          break;
        }
        v82 = &v80[v81];
        uint64_t v83 = v81;
        v84 = (_DWORD *)((char *)v82 + v82[1] + 4);
        v85 = (unsigned int *)((char *)v84 + *(unsigned __int16 *)((char *)v84 - *v84 + 4));
        uint64_t v86 = *(int *)((char *)v85 + *v85);
        uint64_t v87 = (char *)v64->__end_ - (char *)v64->__begin_;
        unint64_t v88 = v86 + (v87 >> 2);
        unint64_t v89 = v65[6];
        if (v88 >= v89)
        {
          if (v79 < 7)
          {
            v91 = 0;
          }
          else
          {
            v91 = (_DWORD *)v78[3];
            if (v78[3]) {
              v91 = (_DWORD *)((char *)v91 + (void)v77 + *(unsigned int *)((char *)v91 + (void)v77));
            }
          }
          if (*v91 <= v81) {
            __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
          }
          v102 = (_DWORD *)((char *)&v91[v83 + 1] + v91[v83 + 1]);
          v103 = (unsigned __int16 *)((char *)v102 - *v102);
          if (*v103 >= 5u && (uint64_t v104 = v103[2]) != 0) {
            v105 = (char *)v102 + v104 + *(unsigned int *)((char *)v102 + v104);
          }
          else {
            v105 = 0;
          }
          if (v79 >= 7 && (uint64_t v106 = v78[3]) != 0) {
            v107 = (int *)((char *)v77 + v106 + *(unsigned int *)((char *)v77 + v106));
          }
          else {
            v107 = 0;
          }
          if (*v107 <= v81) {
            __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
          }
          v108 = (_DWORD *)((char *)&v107[v83 + 1] + v107[v83 + 1]);
          v109 = (unsigned __int16 *)((char *)v108 - *v108);
          if (*v109 >= 5u && (uint64_t v110 = v109[2]) != 0) {
            v111 = (char *)v108 + v110 + *(unsigned int *)((char *)v108 + v110);
          }
          else {
            v111 = 0;
          }
          v112 = v105 + 4;
          uint64_t v113 = (uint64_t)&v111[4 * (v89 - ((unint64_t)v87 >> 2)) + 4];
          *(void *)v123 = v64;
          while (v112 != (_DWORD *)v113)
          {
            *(_DWORD *)v119 = *v112;
            std::back_insert_iterator<std::vector<int>>::operator=[abi:ne180100]((uint64_t *)v123, v119);
            ++v112;
          }
        }
        else
        {
          if (v79 < 7)
          {
            v90 = 0;
          }
          else
          {
            v90 = (_DWORD *)v78[3];
            if (v78[3]) {
              v90 = (_DWORD *)((char *)v90 + (void)v77 + *(unsigned int *)((char *)v90 + (void)v77));
            }
          }
          if (*v90 <= v81) {
            break;
          }
          v92 = (_DWORD *)((char *)&v90[v83 + 1] + v90[v83 + 1]);
          v93 = (unsigned __int16 *)((char *)v92 - *v92);
          if (*v93 >= 5u && (uint64_t v94 = v93[2]) != 0) {
            v95 = (char *)v92 + v94 + *(unsigned int *)((char *)v92 + v94);
          }
          else {
            v95 = 0;
          }
          if (v79 >= 7 && (uint64_t v96 = v78[3]) != 0) {
            v97 = (int *)((char *)v77 + v96 + *(unsigned int *)((char *)v77 + v96));
          }
          else {
            v97 = 0;
          }
          if (*v97 <= v81) {
            break;
          }
          v98 = v95 + 4;
          v99 = (_DWORD *)((char *)&v97[v83 + 1] + v97[v83 + 1]);
          v100 = (unsigned int *)((char *)v99 + *(unsigned __int16 *)((char *)v99 - *v99 + 4));
          uint64_t v101 = (uint64_t)&v100[*(unsigned int *)((char *)v100 + *v100) + 1] + *v100;
          *(void *)v123 = v64;
          while (v98 != (_DWORD *)v101)
          {
            *(_DWORD *)v119 = *v98;
            std::back_insert_iterator<std::vector<int>>::operator=[abi:ne180100]((uint64_t *)v123, v119);
            ++v98;
          }
        }
        if (v88 < v89)
        {
          ++v67;
          v66 = v120;
          if (0xAAAAAAAAAAAAAAABLL * ((v121 - v120) >> 2) > v67) {
            continue;
          }
        }
        goto LABEL_129;
      }
      __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
    }
LABEL_129:
    if (*v65 >= 2)
    {
      v123[0] = 0;
      std::__sort<std::__less<int,int> &,int *>();
      v114 = std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<int *>,std::__wrap_iter<int *>,std::__equal_to &>(v64->__begin_, v64->__end_);
      std::vector<int>::resize(v64, v114 - v64->__begin_);
    }
    if (v120)
    {
      v121 = v120;
      operator delete(v120);
    }
  }
  else
  {
    *unsigned int v7 = 2;
  }
}

void sub_25E36A938(_Unwind_Exception *exception_object)
{
  v4 = *(void **)(v2 - 144);
  if (v4)
  {
    *(void *)(v2 - 136) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (char *)this->__end_ - (char *)this->__begin_;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)p_end_cap, __n);
    unsigned int v7 = (int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v9 = (int *)&v6[4 * v8];
    std::vector<int>::pointer begin = this->__begin_;
    end = this->__end_;
    uint64_t v12 = v7;
    if (end != this->__begin_)
    {
      uint64_t v12 = v7;
      do
      {
        int v13 = *--end;
        *--uint64_t v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

void CLSHInfer::search(uint64_t a1, const float *a2, int a3, void *a4, _DWORD *a5)
{
  CLSHInfer::search_lsh_flatbuffer((int *)a1, a2, &__p);
  std::vector<int>::pointer begin = __p.__begin_;
  if (*a5) {
    goto LABEL_20;
  }
  unint64_t v11 = (unint64_t)((char *)__p.__end_ - (char *)__p.__begin_) >> 2;
  int v12 = *(_DWORD *)(a1 + 24);
  if (v12 >= (int)v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = *(int **)(a1 + 144);
  uint64_t v15 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v15 >= 0x1Fu && (uint64_t v16 = v15[15]) != 0) {
    float v17 = (char *)v14 + v16 + *(unsigned int *)((char *)v14 + v16);
  }
  else {
    float v17 = 0;
  }
  memset(&__p, 0, sizeof(__p));
  std::vector<long long>::vector(&__p, (int)v13);
  if ((int)v13 >= 1)
  {
    std::vector<int>::pointer v18 = __p.__begin_;
    uint64_t v19 = v13;
    std::vector<int>::pointer v20 = begin;
    do
    {
      uint64_t v21 = *v20++;
      *(void *)std::vector<int>::pointer v18 = *(void *)&v17[8 * v21 + 4];
      v18 += 2;
      --v19;
    }
    while (v19);
  }
  int v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  CLSHInfer::rerank((uint64_t)&__p, v13, a3, *(_DWORD *)(a1 + 168), (uint64_t)a2, (uint64_t)a5, (uint64_t)&v26);
  unint64_t v22 = v26;
  unint64_t v23 = v27 - v26;
  unint64_t v24 = (unint64_t)(v27 - v26) >> 4;
  bzero(a4, 8 * a3);
  if ((int)v24 < 1)
  {
    if (!v22) {
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v25 = (v23 >> 4) + 1;
    do
    {
      *((void *)a4 + (v25 - 2)) = *(void *)&v22[16 * (v25 - 2) + 8];
      --v25;
    }
    while (v25 > 1);
  }
  uint64_t v27 = v22;
  operator delete(v22);
LABEL_18:
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
LABEL_20:
  if (begin) {
    operator delete(begin);
  }
}

void sub_25E36AC10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (v13) {
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void CLSHInfer::rerank(uint64_t a1@<X1>, int a2@<W2>, int a3@<W3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  v15[3] = a1;
  v15[4] = a5;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3 >= a2) {
    a4 = 1;
  }
  if (a3 >= a2) {
    uint64_t v11 = a2;
  }
  else {
    uint64_t v11 = a3;
  }
  uint64_t v16 = v11;
  *(void *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = 0;
  std::vector<std::pair<float,long long>>::reserve((void **)a7, a4 * (int)v11);
  MEMORY[0x270FA5388]();
  bzero((char *)v15 - v12, v13);
  memset(&v21, 0, sizeof(v21));
  pthread_attr_init(&v21);
  pthread_attr_setstacksize(&v21, 0x2800uLL);
  std::vector<int>::pointer v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  if (a4 >= 1 && a2 >= 1)
  {
    v15[0] = a7;
    v15[1] = a6;
    v15[2] = &v20;
    pthread_t v17 = 0;
    operator new();
  }
  unint64_t v14 = (int)v16;
  if (v16) {
    std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>,std::__wrap_iter<std::pair<float,long long>*>>(*(void *)a7, *(void *)a7 + 16 * (int)v16, *(void *)(a7 + 8), (uint64_t)&v17);
  }
  std::vector<std::pair<float,long long>>::resize(a7, v14);
  if (v18)
  {
    uint64_t v19 = v18;
    operator delete(v18);
  }
}

void sub_25E36AFD8(_Unwind_Exception *exception_object)
{
  *(void *)(v2 - 240) = v1;
  v4 = *(void **)(v2 - 184);
  if (v4)
  {
    *(void *)(v2 - 176) = v4;
    operator delete(v4);
  }
  int64_t v5 = **(void ***)(v2 - 240);
  if (v5)
  {
    *(void *)(*(void *)(v2 - 240) + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void CLSHInfer::search(uint64_t a1, uint64_t *a2, int a3, int a4, void *a5, _DWORD *a6)
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *(int *)(a1 + 8);
  MEMORY[0x270FA5388]();
  unint64_t v14 = (char *)v22 - ((v13 + 15) & 0x7FFFFFFF0);
  bzero(v14, v13);
  bzero(v14, 4 * v12);
  if (a3 < 1) {
    goto LABEL_10;
  }
  int v15 = 0;
  uint64_t v16 = a3;
  do
  {
    uint64_t v18 = *a2++;
    uint64_t v17 = v18;
    if (CLSHInfer::check_vocab_id_present((CLSHInfer *)a1, v18))
    {
      CLSHInfer::emb_lookup_accumulate((CLSHInfer *)a1, v17, (float *)v14);
      ++v15;
    }
    --v16;
  }
  while (v16);
  if (v15)
  {
    float v19 = 1.0 / (double)v15;
    cblas_sscal(*(_DWORD *)(a1 + 12), v19, (float *)v14, 1);
    if (*(unsigned char *)(a1 + 16))
    {
      float v20 = cblas_snrm2(*(_DWORD *)(a1 + 12), (const float *)v14, 1);
      cblas_sscal(*(_DWORD *)(a1 + 12), 1.0 / *(float *)(a1 + 28), (float *)v14, 1);
      pthread_attr_t v21 = &v14[4 * *(int *)(a1 + 12)];
      *(float *)pthread_attr_t v21 = sqrtf(1.0 - (float)((float)(v20 * v20) / (float)(*(float *)(a1 + 28) * *(float *)(a1 + 28))));
      *((_DWORD *)v21 + 1) = 0;
    }
    CLSHInfer::search(a1, (const float *)v14, a4, a5, a6);
  }
  else
  {
LABEL_10:
    *a5 = -1;
    *a6 = 4;
  }
}

BOOL CLSHInfer::check_vocab_id_present(CLSHInfer *this, uint64_t a2)
{
  uint64_t v2 = (int *)*((void *)this + 18);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = (unsigned __int16 *)((char *)v2 - *v2);
  if (*v3 < 0x1Fu) {
    return 1;
  }
  uint64_t v4 = v3[15];
  if (!v3[15]) {
    return 1;
  }
  unint64_t v5 = *((void *)this + 7);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (void *)((char *)v2 + v4 + *(unsigned int *)((char *)v2 + v4) + 4);
  unsigned int v7 = &v6[v5];
  do
  {
    unint64_t v8 = v5 >> 1;
    uint64_t v9 = &v6[v5 >> 1];
    uint64_t v11 = *v9;
    uint64_t v10 = v9 + 1;
    v5 += ~(v5 >> 1);
    if (v11 >= a2) {
      unint64_t v5 = v8;
    }
    else {
      uint64_t v6 = v10;
    }
  }
  while (v5);
  return v6 != v7 && *v6 <= a2;
}

float CLSHInfer::emb_lookup_accumulate(CLSHInfer *this, uint64_t a2, float *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  unsigned int v7 = (float *)((char *)v11 - ((v6 + 15) & 0x7FFFFFFF0));
  bzero(v7, v6);
  CLSHInfer::emb_lookup(this, a2, v7);
  uint64_t v9 = *((unsigned int *)this + 3);
  if ((int)v9 >= 1)
  {
    do
    {
      float v10 = *v7++;
      float result = v10 + *a3;
      *a3++ = result;
      --v9;
    }
    while (v9);
  }
  return result;
}

void CLSHInfer::rerank_heap(int *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, int a4@<W3>, const float *a5@<X4>, _DWORD *a6@<X5>, char **a7@<X8>)
{
  uint64_t v43 = a6;
  uint64_t v47 = *MEMORY[0x263EF8340];
  *a7 = 0;
  a7[1] = 0;
  a7[2] = 0;
  unint64_t v42 = a4;
  std::vector<std::pair<float,long long>>::reserve((void **)a7, a4);
  MEMORY[0x270FA5388]();
  unint64_t v14 = (char *)&v38 - ((v13 + 15) & 0x7FFFFFFF0);
  bzero(v14, v13);
  if (a2 != a3)
  {
    uint64_t v38 = a4 - 1;
    int v39 = a1;
    uint64_t v40 = a3;
    v41 = a7 + 2;
    do
    {
      uint64_t v15 = *a2;
      CLSHInfer::emb_lookup((CLSHInfer *)a1, *a2, (float *)v14);
      if (*v43) {
        break;
      }
      uint64_t v16 = v14;
      float v17 = cblas_sdot(a1[2], a5, 1, (const float *)v14, 1);
      float v18 = v17;
      float v20 = (float *)*a7;
      float v19 = a7[1];
      uint64_t v21 = v19 - *a7;
      uint64_t v22 = v21 >> 4;
      if (v21 >> 4 >= v42)
      {
        float v24 = *v20;
        if (*v20 < v17)
        {
          if (v21 >= 17)
          {
            uint64_t v25 = *((void *)v20 + 1);
            std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>((uint64_t)*a7, (uint64_t)&v45, (unint64_t)v21 >> 4);
            if (v19 - 16 == v26)
            {
              *(float *)int v26 = v24;
              *((void *)v26 + 1) = v25;
            }
            else
            {
              *(_DWORD *)int v26 = *((_DWORD *)v19 - 4);
              *((void *)v26 + 1) = *((void *)v19 - 1);
              *((float *)v19 - 4) = v24;
              *((void *)v19 - 1) = v25;
              std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>((uint64_t)v20, (uint64_t)(v26 + 16), (uint64_t)&v45, (v26 + 16 - (char *)v20) >> 4);
            }
          }
          uint64_t v35 = *a7;
          uint64_t v36 = (uint64_t)a7[1];
          uint64_t v37 = (uint64_t)&(*a7)[16 * v38];
          *(float *)uint64_t v37 = v18;
          *(void *)(v37 + 8) = v15;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>((uint64_t)v35, v36, (uint64_t)&v46, (v36 - (uint64_t)v35) >> 4);
        }
      }
      else
      {
        if ((unint64_t)v19 >= *v41)
        {
          unint64_t v27 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 60) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v28 = *v41 - (void)v20;
          if (v28 >> 3 > v27) {
            unint64_t v27 = v28 >> 3;
          }
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v27;
          }
          if (v29) {
            int v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>((uint64_t)v41, v29);
          }
          else {
            int v30 = 0;
          }
          unint64_t v31 = &v30[16 * v22];
          *(void *)unint64_t v31 = LODWORD(v18);
          *((void *)v31 + 1) = v15;
          uint64_t v33 = *a7;
          uint64_t v32 = a7[1];
          v34 = v31;
          if (v32 != *a7)
          {
            do
            {
              *((_OWORD *)v34 - 1) = *((_OWORD *)v32 - 1);
              v34 -= 16;
              v32 -= 16;
            }
            while (v32 != v33);
            uint64_t v32 = *a7;
          }
          uint64_t v23 = (uint64_t)(v31 + 16);
          *a7 = v34;
          a7[1] = v31 + 16;
          a7[2] = &v30[16 * v29];
          a3 = v40;
          if (v32) {
            operator delete(v32);
          }
        }
        else
        {
          *(void *)float v19 = LODWORD(v17);
          *((void *)v19 + 1) = v15;
          uint64_t v23 = (uint64_t)(v19 + 16);
          a3 = v40;
        }
        a1 = v39;
        a7[1] = (char *)v23;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>((uint64_t)*a7, v23, (uint64_t)&v44, (v23 - (uint64_t)*a7) >> 4);
      }
      ++a2;
      unint64_t v14 = v16;
    }
    while (a2 != a3);
  }
}

void sub_25E36B648(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::pair<float,long long>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    size_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(v3, a2);
    unsigned int v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    uint64_t v9 = &v6[16 * v8];
    uint64_t v11 = (char *)*a1;
    float v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      float v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void CLSHInfer::emb_lookup(CLSHInfer *this, uint64_t a2, float *__X)
{
  int v5 = *((_DWORD *)this + 3);
  if (v5 >= 1)
  {
    int v7 = 0;
    uint64_t v8 = *((void *)this + 9);
    do
    {
      uint64_t v9 = *(void *)(*((void *)this + 15) + 8 * v7);
      uint64_t v10 = *((void *)this + 6) - v8 + 1;
      uint64_t v11 = (*((void *)this + 10) * (*((void *)this + 8) + a2 + v9)
           + (*((void *)this + 8) + a2) * v9 * *((void *)this + 11)
           + *((void *)this + 12))
          * *((void *)this + 13)
          % v10;
      memcpy(&__X[v7], (const void *)(*((void *)this + 17) + 4 * (int)(((v11 >> 63) & v10) + v11)), 4 * v8);
      uint64_t v8 = *((void *)this + 9);
      v7 += v8;
      int v5 = *((_DWORD *)this + 3);
    }
    while (v7 < v5);
  }
  if (*((unsigned char *)this + 16))
  {
    float v12 = cblas_snrm2(v5, __X, 1);
    cblas_sscal(*((_DWORD *)this + 3), 1.0 / *((float *)this + 8), __X, 1);
    size_t v13 = &__X[*((int *)this + 3)];
    *size_t v13 = 0.0;
    v13[1] = sqrtf(1.0 - (float)((float)(v12 * v12) / (float)(*((float *)this + 8) * *((float *)this + 8))));
  }
}

void CLSHInfer::rerank(int *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, const float *a5@<X4>, _DWORD *a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v32 = a4;
  uint64_t v10 = a2;
  uint64_t v34 = *MEMORY[0x263EF8340];
  *(void *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = 0;
  std::vector<std::pair<float,long long>>::reserve((void **)a7, a3 - a2);
  MEMORY[0x270FA5388]();
  unint64_t v14 = (char *)&v32 - ((v13 + 15) & 0x7FFFFFFF0);
  bzero(v14, v13);
  if (v10 == a3)
  {
    uint64_t v20 = *(void *)(a7 + 8);
LABEL_23:
    int v30 = v32;
    unint64_t v31 = *(void *)a7 + 16 * (int)v32;
    if (v31 != v20) {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(*(void *)a7, v31, v20);
    }
    std::vector<std::pair<float,long long>>::resize(a7, v30);
  }
  else
  {
    uint64_t v33 = a7 + 16;
    while (1)
    {
      uint64_t v15 = *v10;
      CLSHInfer::emb_lookup((CLSHInfer *)a1, *v10, (float *)v14);
      if (*a6) {
        break;
      }
      float v16 = cblas_sdot(a1[2], a5, 1, (const float *)v14, 1);
      uint64_t v17 = LODWORD(v16);
      float v19 = *(void **)(a7 + 8);
      unint64_t v18 = *(void *)(a7 + 16);
      if ((unint64_t)v19 >= v18)
      {
        uint64_t v21 = ((uint64_t)v19 - *(void *)a7) >> 4;
        unint64_t v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 60) {
          std::vector<int>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v23 = v18 - *(void *)a7;
        if (v23 >> 3 > v22) {
          unint64_t v22 = v23 >> 3;
        }
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v24 = v22;
        }
        if (v24) {
          uint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(v33, v24);
        }
        else {
          uint64_t v25 = 0;
        }
        int v26 = &v25[16 * v21];
        *(void *)int v26 = v17;
        *((void *)v26 + 1) = v15;
        uint64_t v28 = *(char **)a7;
        unint64_t v27 = *(char **)(a7 + 8);
        unint64_t v29 = v26;
        if (v27 != *(char **)a7)
        {
          do
          {
            *((_OWORD *)v29 - 1) = *((_OWORD *)v27 - 1);
            v29 -= 16;
            v27 -= 16;
          }
          while (v27 != v28);
          unint64_t v27 = *(char **)a7;
        }
        uint64_t v20 = (uint64_t)(v26 + 16);
        *(void *)a7 = v29;
        *(void *)(a7 + 8) = v26 + 16;
        *(void *)(a7 + 16) = &v25[16 * v24];
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        void *v19 = LODWORD(v16);
        v19[1] = v15;
        uint64_t v20 = (uint64_t)(v19 + 2);
      }
      *(void *)(a7 + 8) = v20;
      if (++v10 == a3) {
        goto LABEL_23;
      }
    }
  }
}

void sub_25E36BA78(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::pair<float,long long>>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }
  else
  {
    std::vector<std::pair<float,long long>>::__append((void **)a1, a2 - v2);
  }
}

uint64_t CLSHInfer::get_consolidated_params@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 32) = 0;
  *(_DWORD *)a4 = a3;
  *(void *)(a4 + 12) = 0;
  uint64_t v4 = (_DWORD *)(a4 + 12);
  *(void *)(a4 + 20) = 0;
  *(void *)(a4 + 40) = 0;
  *(void *)(a4 + 4) = 0x100000008;
  int v5 = *(int **)(result + 152);
  if (v5)
  {
    size_t v6 = (unsigned __int16 *)((char *)v5 - *v5);
    unsigned int v7 = *v6;
    if (v7 < 9)
    {
      *(_DWORD *)a4 = 100;
      if (v7 < 7) {
        goto LABEL_11;
      }
    }
    else
    {
      if (v6[4]) {
        int v8 = *(int *)((char *)v5 + v6[4]);
      }
      else {
        int v8 = 100;
      }
      *(_DWORD *)a4 = v8;
    }
    uint64_t v9 = v6[3];
    if (v9)
    {
      int v10 = *(int *)((char *)v5 + v9);
LABEL_12:
      _DWORD *v4 = v10;
      goto LABEL_13;
    }
LABEL_11:
    int v10 = 0;
    goto LABEL_12;
  }
LABEL_13:
  if (a2)
  {
    int v11 = *(_DWORD *)(a2 + 4);
    if (v11 >= 1) {
      *(_DWORD *)(a4 + 4) = v11;
    }
    if ((*(_DWORD *)a2 & 0x80000000) == 0) {
      *(_DWORD *)a4 = *(_DWORD *)a2;
    }
    int v12 = *(_DWORD *)(a2 + 12);
    if ((v12 & 0x80000000) == 0) {
      _DWORD *v4 = v12;
    }
    int v13 = *(_DWORD *)(a2 + 8);
    if ((v13 & 0x80000000) == 0) {
      *(_DWORD *)(a4 + 8) = v13;
    }
    int v14 = *(_DWORD *)(a2 + 44);
    if ((v14 & 0x80000000) == 0) {
      *(_DWORD *)(a4 + 44) = v14;
    }
    int v15 = *(_DWORD *)(a2 + 24);
    if (v15 >= 1)
    {
      uint64_t v16 = *(void *)(a2 + 16);
      if (v16)
      {
        *(_DWORD *)(a4 + 24) = v15;
        *(void *)(a4 + 16) = v16;
      }
    }
    int v17 = *(_DWORD *)(a2 + 40);
    if (v17 >= 1)
    {
      uint64_t v18 = *(void *)(a2 + 32);
      if (v18)
      {
        *(_DWORD *)(a4 + 40) = v17;
        *(void *)(a4 + 32) = v18;
      }
    }
  }
  return result;
}

uint64_t CLSHInfer::retrieve_top_genre_recommendations(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int *a5)
{
  if (!a5) {
    return 7;
  }
  *a5 = 0;
  if (!a2) {
    return 7;
  }
  unsigned int v7 = *(int **)(a1 + 152);
  if (!v7) {
    return 10;
  }
  int v8 = (unsigned __int16 *)((char *)v7 - *v7);
  if (*v8 < 5u) {
    return 10;
  }
  uint64_t v9 = v8[2];
  if (!v9) {
    return 10;
  }
  int v10 = (int *)((char *)v7 + v9 + *(unsigned int *)((char *)v7 + v9));
  int v11 = (unsigned __int16 *)((char *)v10 - *v10);
  if (*v11 < 5u || !v11[2]) {
    return 10;
  }
  int v78 = *(_DWORD *)(a2 + 44);
  v83[0] = 0;
  v83[1] = 0;
  uint64_t v84 = 0;
  unint64_t v14 = *(void *)(a2 + 32);
  if (v14)
  {
    size_t v15 = *(unsigned int *)(a2 + 40);
    if ((int)v15 < 1)
    {
      LOBYTE(v14) = 0;
    }
    else
    {
      std::string::basic_string[abi:ne180100](__dst, *(void **)(a2 + 32), v15);
      uint64_t v93 = 0;
      long long v91 = 0u;
      memset(v92, 0, sizeof(v92));
      *(_OWORD *)std::vector<int> __p = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      *(_OWORD *)__s1 = 0u;
      long long v86 = 0u;
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)__s1);
      if ((v80 & 0x80u) == 0) {
        uint64_t v16 = __dst;
      }
      else {
        uint64_t v16 = (void **)__dst[0];
      }
      if ((v80 & 0x80u) == 0) {
        unint64_t v17 = v80;
      }
      else {
        unint64_t v17 = (unint64_t)__dst[1];
      }
      if (v17)
      {
        uint64_t v18 = MEMORY[0x263EF8318];
        while (1)
        {
          unsigned int v19 = *(char *)v16;
          if ((v19 & 0x80000000) == 0) {
            break;
          }
          if (__maskrune(*(char *)v16, 0x8000uLL)) {
            goto LABEL_24;
          }
          if (__maskrune(v19, 0x1000uLL)) {
            goto LABEL_26;
          }
LABEL_27:
          uint64_t v16 = (void **)((char *)v16 + 1);
          if (!--v17) {
            goto LABEL_28;
          }
        }
        int v20 = *(_DWORD *)(v18 + 4 * v19 + 60);
        if ((v20 & 0x8000) == 0)
        {
          if ((v20 & 0x1000) == 0 && (v20 & 0x400) == 0) {
            goto LABEL_27;
          }
LABEL_26:
          v94[0] = v19;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__s1, (uint64_t)v94, 1);
          goto LABEL_27;
        }
LABEL_24:
        v94[0] = __tolower(v19);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__s1, (uint64_t)v94, 1);
        goto LABEL_27;
      }
LABEL_28:
      std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&__s1[1], &v81);
      __s1[0] = *(void **)MEMORY[0x263F8C2C8];
      *(void **)((char *)__s1 + *((void *)__s1[0] - 3)) = *(void **)(MEMORY[0x263F8C2C8] + 24);
      __s1[1] = (void *)(MEMORY[0x263F8C318] + 16);
      if (SHIBYTE(v90) < 0) {
        operator delete(__p[1]);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x2611D4280](v92);
      if (SHIBYTE(v84) < 0) {
        operator delete(v83[0]);
      }
      *(_OWORD *)uint64_t v83 = v81;
      uint64_t v84 = v82;
      HIBYTE(v82) = 0;
      LOBYTE(v81) = 0;
      if ((char)v80 < 0) {
        operator delete(__dst[0]);
      }
      LOBYTE(v14) = HIBYTE(v84);
      if (SHIBYTE(v84) < 0)
      {
        LODWORD(v21) = v83[1];
        if (v83[1])
        {
          unint64_t v22 = (void **)v83[0];
          goto LABEL_125;
        }
      }
      else if (HIBYTE(v84))
      {
        LODWORD(v21) = HIBYTE(v84);
        unint64_t v22 = v83;
LABEL_125:
        uint64_t v24 = 0;
        if (v22 && (v21 & 0x80000000) == 0)
        {
          if ((int)v21 >= 1000) {
            uint64_t v21 = 1000;
          }
          else {
            uint64_t v21 = v21;
          }
          if (v21)
          {
            int v75 = -2128831035;
            do
            {
              int v76 = *(char *)v22;
              unint64_t v22 = (void **)((char *)v22 + 1);
              int v75 = 16777619 * (v75 ^ v76);
              --v21;
            }
            while (v21);
            uint64_t v24 = v75 & 0x7FFFFFFF;
          }
          else
          {
            uint64_t v24 = 18652613;
          }
        }
        goto LABEL_41;
      }
    }
  }
  uint64_t v24 = 0;
LABEL_41:
  uint64_t v25 = *(int **)(a1 + 152);
  int v26 = (unsigned __int16 *)((char *)v25 - *v25);
  if (*v26 >= 5u && (uint64_t v27 = v26[2]) != 0) {
    uint64_t v28 = (int *)((char *)v25 + v27 + *(unsigned int *)((char *)v25 + v27));
  }
  else {
    uint64_t v28 = 0;
  }
  unint64_t v29 = (unsigned __int16 *)((char *)v28 - *v28);
  if (*v29 >= 5u && (uint64_t v30 = v29[2]) != 0) {
    unint64_t v31 = (unsigned int *)((char *)v28 + v30 + *(unsigned int *)((char *)v28 + v30));
  }
  else {
    unint64_t v31 = 0;
  }
  uint64_t v33 = v31 + 1;
  uint64_t v32 = *v31;
  if (!v32)
  {
LABEL_102:
    unint64_t v14 = v14;
    if ((v14 & 0x80u) != 0) {
      unint64_t v14 = (unint64_t)v83[1];
    }
    if (!v14)
    {
      uint64_t v58 = *v31;
      if (v58)
      {
        uint64_t v35 = 0;
        uint64_t v59 = 4 * v58;
        do
        {
          uint64_t v60 = v31[1];
          int v61 = (char *)v31 + v60 - *(int *)((char *)v31 + v60 + 4);
          if (*((unsigned __int16 *)v61 + 2) < 7u
            || (uint64_t v62 = *((unsigned __int16 *)v61 + 5)) == 0
            || !*(unsigned int *)((char *)v31 + v60 + v62 + 4))
          {
            uint64_t v35 = (int *)((char *)v31 + v60 + 4);
          }
          ++v31;
          v59 -= 4;
        }
        while (v59);
        if (v35) {
          goto LABEL_113;
        }
      }
    }
    goto LABEL_120;
  }
  uint64_t v34 = &v33[v32];
  while (1)
  {
    uint64_t v35 = (int *)((char *)v33 + *v33);
    uint64_t v36 = v83[1];
    if (v84 >= 0) {
      uint64_t v36 = (void *)HIBYTE(v84);
    }
    uint64_t v37 = (unsigned __int16 *)((char *)v35 - *v35);
    unsigned int v38 = *v37;
    if (v36)
    {
      if (v38 >= 7)
      {
        uint64_t v39 = v37[3];
        if (v37[3]) {
          LODWORD(v39) = *(int *)((char *)v35 + v39);
        }
      }
      else
      {
        LODWORD(v39) = 0;
      }
      BOOL v40 = v24 == (int)v39;
    }
    else
    {
      if (v38 >= 7)
      {
        uint64_t v41 = v37[3];
        if (v37[3]) {
          LODWORD(v41) = *(int *)((char *)v35 + v41);
        }
      }
      else
      {
        LODWORD(v41) = 0;
      }
      BOOL v40 = v41 == v78;
    }
    int v42 = v40;
    if (v38 < 5 || (uint64_t v43 = v37[2]) == 0)
    {
      if (v42) {
        goto LABEL_113;
      }
      goto LABEL_93;
    }
    std::string::basic_string[abi:ne180100](__s1, (char *)v35 + v43 + *(unsigned int *)((char *)v35 + v43) + 4, *(unsigned int *)((char *)v35 + v43 + *(unsigned int *)((char *)v35 + v43)));
    if ((SBYTE7(v86) & 0x80u) == 0) {
      char v44 = (void *)BYTE7(v86);
    }
    else {
      char v44 = __s1[1];
    }
    char v45 = (void *)HIBYTE(v84);
    if (v84 < 0) {
      char v45 = v83[1];
    }
    if (v44 != v45)
    {
      BOOL v55 = 0;
      goto LABEL_90;
    }
    char v46 = v84 >= 0 ? v83 : (void **)v83[0];
    if ((BYTE7(v86) & 0x80) == 0) {
      break;
    }
    float v57 = __s1[0];
    int v77 = memcmp(__s1[0], v46, (size_t)__s1[1]);
    operator delete(v57);
    if (v77) {
      int v56 = v42;
    }
    else {
      int v56 = 1;
    }
    if (v56) {
      goto LABEL_99;
    }
LABEL_93:
    if (++v33 == v34)
    {
      LOBYTE(v14) = HIBYTE(v84);
      goto LABEL_102;
    }
  }
  if (!BYTE7(v86)) {
    goto LABEL_113;
  }
  uint64_t v47 = BYTE7(v86) - 1;
  float v48 = __s1;
  do
  {
    int v50 = *(unsigned __int8 *)v48;
    float v48 = (void **)((char *)v48 + 1);
    int v49 = v50;
    int v52 = *(unsigned __int8 *)v46;
    char v46 = (void **)((char *)v46 + 1);
    int v51 = v52;
    BOOL v54 = v47-- != 0;
    BOOL v55 = v49 == v51;
  }
  while (v49 == v51 && v54);
LABEL_90:
  if ((BYTE7(v86) & 0x80) != 0) {
    operator delete(__s1[0]);
  }
  int v56 = v55 | v42;
  if (((v55 | v42) & 1) == 0) {
    goto LABEL_93;
  }
LABEL_99:
  if (!v56) {
    uint64_t v35 = 0;
  }
LABEL_113:
  uint64_t v63 = (unsigned int *)((char *)v35 + *(unsigned __int16 *)((char *)v35 - *v35 + 8));
  v64 = (unsigned int *)((char *)v63 + *v63);
  unsigned int v67 = *v64;
  v65 = (uint64_t *)(v64 + 1);
  uint64_t v66 = v67;
  if (v67)
  {
    uint64_t v68 = 8 * v66;
    uint64_t v69 = *a5;
    if ((int)v69 <= a4) {
      int v70 = a4;
    }
    else {
      int v70 = *a5;
    }
    uint64_t v71 = v70 - v69;
    v72 = (void *)(a3 + 8 * v69);
    int v73 = v69 + 1;
    do
    {
      if (!v71) {
        break;
      }
      uint64_t v74 = *v65++;
      *v72++ = v74;
      *a5 = v73;
      --v71;
      ++v73;
      v68 -= 8;
    }
    while (v68);
  }
LABEL_120:
  if (SHIBYTE(v84) < 0) {
    operator delete(v83[0]);
  }
  return 0;
}

void sub_25E36C234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,char a27)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(a1);
}

uint64_t fnv_1a_31(char *a1, int a2)
{
  uint64_t v2 = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    if (a2 >= 1000) {
      uint64_t v3 = 1000;
    }
    else {
      uint64_t v3 = a2;
    }
    if (v3)
    {
      int v4 = -2128831035;
      do
      {
        int v5 = *a1++;
        int v4 = 16777619 * (v4 ^ v5);
        --v3;
      }
      while (v3);
      return v4 & 0x7FFFFFFF;
    }
    else
    {
      return 18652613;
    }
  }
  return v2;
}

uint64_t worker(threadParam *a1)
{
  return 0;
}

double threadParam::work(threadParam *this)
{
  CLSHInfer::rerank(*((int **)this + 4), (uint64_t *)(**(void **)this + 8 * *((int *)this + 2)), (uint64_t *)(**(void **)this + 8 * *((int *)this + 3)), *((unsigned int *)this + 4), *((const float **)this + 3), (_DWORD *)this + 10, (uint64_t)&v4);
  uint64_t v2 = (void *)*((void *)this + 6);
  if (v2)
  {
    *((void *)this + 7) = v2;
    operator delete(v2);
  }
  double result = *(double *)&v4;
  *((_OWORD *)this + 3) = v4;
  *((void *)this + 8) = v5;
  return result;
}

uint64_t query_lsh_flatbuffer(uint64_t *a1, int a2, int a3, void *a4, unsigned int *a5, int a6)
{
  int v11 = (int *)((char *)a5 + *a5);
  int v12 = (unsigned __int16 *)((char *)v11 - *v11);
  if (*v12 >= 0xDu && (uint64_t v13 = v12[6]) != 0) {
    unint64_t v14 = (char *)v11 + v13 + *(unsigned int *)((char *)v11 + v13);
  }
  else {
    unint64_t v14 = 0;
  }
  long long v19 = 0u;
  size_t v15 = (int *)&v14[*((unsigned int *)v14 + 1) + 4];
  memset(v18, 0, sizeof(v18));
  CLSHInfer::CLSHInfer((uint64_t)v18, v15);
  DWORD2(v19) = a6;
  unsigned int v17 = 0;
  CLSHInfer::search((uint64_t)v18, a1, a2, a3, a4, &v17);
  return v17;
}

uint64_t retrieval_flatbuffer(uint64_t *a1, int a2, int a3, uint64_t *a4, unsigned int *a5, uint64_t a6, uint64_t a7)
{
  if (!a7) {
    return 7;
  }
  LODWORD(v13) = 0;
  *(void *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  unint64_t v14 = (int *)((char *)a5 + *a5);
  size_t v15 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v15 >= 5u)
  {
    uint64_t v13 = v15[2];
    if (v15[2]) {
      uint64_t v13 = *(void *)((char *)v14 + v13);
    }
  }
  *(_DWORD *)(a7 + 16) = v13;
  uint64_t v16 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v16 < 7u)
  {
    LODWORD(v17) = 0;
  }
  else
  {
    uint64_t v17 = v16[3];
    if (v17) {
      uint64_t v17 = *(void *)((char *)v14 + v17);
    }
  }
  *(_DWORD *)(a7 + 20) = v17;
  uint64_t v18 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v18 < 9u)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    uint64_t v19 = v18[4];
    if (v19) {
      uint64_t v19 = *(void *)((char *)v14 + v19);
    }
  }
  *(_DWORD *)(a7 + 24) = v19;
  long long v57 = 0u;
  memset(v56, 0, sizeof(v56));
  int v20 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v20 >= 0xDu && (uint64_t v21 = v20[6]) != 0) {
    unint64_t v22 = (char *)v14 + v21 + *(unsigned int *)((char *)v14 + v21);
  }
  else {
    unint64_t v22 = 0;
  }
  CLSHInfer::CLSHInfer((uint64_t)v56, (int *)&v22[*((unsigned int *)v22 + 1) + 4]);
  DWORD2(v57) = 8;
  memset(v55, 0, sizeof(v55));
  CLSHInfer::get_consolidated_params((uint64_t)v56, a6, a3, (uint64_t)v55);
  int v23 = v55[0];
  if (HIDWORD(v55[0]) + LODWORD(v55[0]) > a3) {
    return 7;
  }
  int v54 = 0;
  if (SLODWORD(v55[0]) >= 1)
  {
    CLSHInfer::search((uint64_t)v56, a1, a2, v55[0], a4, &v54);
    if (v54)
    {
      int v23 = 0;
      *(_DWORD *)(a7 + 8) = v54;
    }
    else
    {
      int v23 = v55[0];
    }
  }
  *(_DWORD *)(a7 + 4) = v23;
  if (SHIDWORD(v55[0]) >= 1) {
    *(_DWORD *)(a7 + 12) = CLSHInfer::retrieve_top_genre_recommendations((uint64_t)v56, (uint64_t)v55, (uint64_t)&a4[v23], SHIDWORD(v55[0]), (int *)a7);
  }
  if (a2 >= 1 && DWORD2(v55[0]) == 1)
  {
    if ((void)v57)
    {
      unint64_t v25 = *(unsigned int *)(a7 + 4);
      if ((int)v25 >= 1)
      {
        __Y = 0;
        int v52 = 0;
        uint64_t v53 = 0;
        std::vector<float>::vector(&__Y, a2 << 8);
        float v48 = 0;
        int v49 = 0;
        uint64_t v50 = 0;
        std::vector<float>::vector(&v48, (int)(v25 << 8));
        char v45 = 0;
        char v46 = 0;
        uint64_t v47 = 0;
        std::vector<float>::vector(&v45, v25);
        uint64_t v26 = 0;
        do
        {
          CLSHInfer::emb_lookup((CLSHInfer *)v56, a1[v26], &__Y[HIDWORD(v56[0]) * (int)v26]);
          ++v26;
        }
        while (a2 != v26);
        for (uint64_t i = 0; i != v25; ++i)
          CLSHInfer::emb_lookup((CLSHInfer *)v56, a4[i], (float *)v48 + HIDWORD(v56[0]) * (int)i);
        std::vector<int> __p = (void *)0x10000000032;
        LODWORD(v42) = 128;
        HIDWORD(v42) = a2;
        *(_DWORD *)uint64_t v43 = v25;
        *(void *)&v43[4] = 0x400000100;
        int v44 = 2;
        reranker::Reranker<float>::forward_fb((uint64_t)&__p, __Y, (const float *)v48, (float *)v45, (int *)v57);
        std::vector<int> __p = 0;
        int v42 = 0;
        *(void *)uint64_t v43 = 0;
        std::vector<std::pair<float,long long>>::vector(&__p, v25);
        unint64_t v28 = 0;
        unint64_t v29 = (int *)v45;
        uint64_t v30 = (float *)__p;
        uint64_t v31 = 16 * v25;
        uint64_t v32 = a4;
        do
        {
          int v33 = *v29++;
          int v34 = v33;
          uint64_t v35 = *v32++;
          uint64_t v36 = &v30[v28 / 4];
          *(_DWORD *)uint64_t v36 = v34;
          *((void *)v36 + 1) = v35;
          v28 += 16;
        }
        while (v31 != v28);
        unint64_t v37 = 126 - 2 * __clz(((char *)v42 - (char *)v30) >> 4);
        if (v42 == v30) {
          uint64_t v38 = 0;
        }
        else {
          uint64_t v38 = v37;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,false>((uint64_t)v30, v42, (uint64_t)&v58, v38, 1);
        unint64_t v39 = 0;
        BOOL v40 = (float *)__p;
        do
        {
          *a4++ = *(void *)&v40[v39 / 4 + 2];
          v39 += 16;
        }
        while (v31 != v39);
        int v42 = v40;
        operator delete(v40);
        if (v45)
        {
          char v46 = v45;
          operator delete(v45);
        }
        if (v48)
        {
          int v49 = v48;
          operator delete(v48);
        }
        if (__Y)
        {
          int v52 = __Y;
          operator delete(__Y);
        }
      }
    }
  }
  if (*(_DWORD *)(a7 + 8) && *(_DWORD *)(a7 + 12)) {
    return 11;
  }
  else {
    return 0;
  }
}

void sub_25E36C820(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a16) {
    operator delete(a16);
  }
  if (a19) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

void reranker::Reranker<float>::forward_fb(uint64_t a1, float *__Y, const float *a3, float *a4, int *a5)
{
  uint64_t v9 = (unsigned __int16 *)((char *)a5 - *a5);
  if (*v9 < 9u)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = v9[4];
    if (v10) {
      v10 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v10);
    }
  }
  cblas_saxpy(*(_DWORD *)(a1 + 12) * *(_DWORD *)(a1 + 4), 1.0, (const float *)(v10 + 4 * (*(_DWORD *)a1 - *(_DWORD *)(a1 + 12)) * *(_DWORD *)(a1 + 4) + 4), 1, __Y, 1);
  int v11 = (unsigned __int16 *)((char *)a5 - *a5);
  unsigned int v12 = *v11;
  char v45 = a3;
  if (v12 < 0x53)
  {
    if (v12 < 0x4F)
    {
      BOOL v40 = 0;
      uint64_t v41 = 4;
      uint64_t v21 = 4;
      uint64_t v22 = 4;
      uint64_t v19 = 4;
      uint64_t v44 = 4;
      uint64_t v15 = 4;
      uint64_t v17 = 4;
      uint64_t v43 = 4;
      uint64_t v16 = 4;
      goto LABEL_45;
    }
    uint64_t v16 = 4;
    uint64_t v43 = 4;
    uint64_t v17 = 4;
    uint64_t v15 = 4;
    uint64_t v44 = 4;
    goto LABEL_36;
  }
  uint64_t v13 = v11[41];
  if (v11[41]) {
    v13 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v13);
  }
  uint64_t v44 = v13 + 4;
  if (v12 < 0x59)
  {
    uint64_t v15 = 4;
    if (v12 >= 0x55) {
      goto LABEL_15;
    }
    uint64_t v15 = 4;
    uint64_t v16 = 4;
    uint64_t v43 = 4;
    uint64_t v17 = 4;
LABEL_36:
    uint64_t v19 = 4;
    goto LABEL_37;
  }
  uint64_t v14 = v11[44];
  if (v11[44]) {
    v14 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v14);
  }
  uint64_t v15 = v14 + 4;
LABEL_15:
  uint64_t v18 = v11[42];
  if (v11[42]) {
    v18 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v18);
  }
  uint64_t v19 = v18 + 4;
  if (v12 < 0x5B)
  {
    uint64_t v17 = 4;
    if (v12 >= 0x57) {
      goto LABEL_23;
    }
    uint64_t v17 = 4;
    uint64_t v16 = 4;
    uint64_t v43 = 4;
LABEL_37:
    uint64_t v22 = 4;
    goto LABEL_38;
  }
  uint64_t v20 = v11[45];
  if (v11[45]) {
    v20 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v20);
  }
  uint64_t v17 = v20 + 4;
LABEL_23:
  uint64_t v23 = v11[43];
  if (v11[43]) {
    v23 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v23);
  }
  uint64_t v22 = v23 + 4;
  if (v12 < 0x5D)
  {
    uint64_t v16 = 4;
    uint64_t v43 = 4;
  }
  else
  {
    uint64_t v24 = v11[46];
    if (v11[46]) {
      v24 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v24);
    }
    uint64_t v43 = v24 + 4;
    if (v12 >= 0x5F)
    {
      uint64_t v25 = v11[47];
      if (v11[47]) {
        v25 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v25);
      }
      uint64_t v21 = v25 + 4;
      if (v12 < 0x61)
      {
        uint64_t v26 = 0;
      }
      else
      {
        uint64_t v26 = v11[48];
        if (v11[48]) {
          v26 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v26);
        }
      }
      uint64_t v16 = v26 + 4;
      goto LABEL_39;
    }
    uint64_t v16 = 4;
  }
LABEL_38:
  uint64_t v21 = 4;
LABEL_39:
  uint64_t v27 = v11[39];
  if (v11[39]) {
    v27 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v27);
  }
  uint64_t v41 = v27 + 4;
  if (v12 >= 0x51 && (uint64_t v28 = v11[40]) != 0) {
    BOOL v40 = (const float *)((char *)a5 + v28 + *(unsigned int *)((char *)a5 + v28));
  }
  else {
    BOOL v40 = 0;
  }
LABEL_45:
  int v54 = 0;
  BOOL v55 = 0;
  uint64_t v56 = 0;
  std::vector<float>::vector(&v54, *(int *)(a1 + 4) * (uint64_t)*(int *)(a1 + 16));
  unint64_t v29 = v54;
  unint64_t v30 = *(unsigned int *)(a1 + 12) | ((unint64_t)*(unsigned int *)(a1 + 24) << 32);
  __C = (float *)(*(unsigned int *)(a1 + 4) | ((unint64_t)*(unsigned int *)(a1 + 16) << 32));
  int v52 = (float *)v30;
  reranker::MultiHeadAttention<float>::forward((int *)&__C, v45, __Y, __Y, v54, (const float *)v44, (const float *)v15, (const float *)v19, (float *)v17, (const float *)v22, (const float *)v43, (const float *)v21, (const float *)v16);
  __C = 0;
  int v52 = 0;
  uint64_t v53 = 0;
  std::vector<float>::vector(&__C, *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 16));
  uint64_t v31 = (unsigned __int16 *)((char *)a5 - *a5);
  unsigned int v32 = *v31;
  if (v32 < 0xB)
  {
    uint64_t v35 = 0;
    uint64_t v34 = 4;
  }
  else
  {
    uint64_t v33 = v31[5];
    if (v31[5]) {
      v33 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v33);
    }
    uint64_t v34 = v33 + 4;
    if (v32 < 0xD)
    {
      uint64_t v35 = 0;
    }
    else
    {
      uint64_t v35 = v31[6];
      if (v35) {
        v35 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v35);
      }
    }
  }
  int v36 = *(_DWORD *)(a1 + 16);
  std::vector<int> __p = *(void **)(a1 + 4);
  LODWORD(v49) = v36;
  reranker::Linear::forward((reranker::Linear *)&__p, v29, __C, (const float *)v34, (const float *)(v35 + 4));
  std::vector<int> __p = 0;
  int v49 = 0;
  uint64_t v50 = 0;
  std::vector<float>::vector(&__p, *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 16));
  uint64_t v37 = *(void *)(a1 + 20);
  unint64_t v46 = *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned int *)(a1 + 16) << 32);
  uint64_t v47 = v37;
  reranker::EncoderLayer<float>::forward((unsigned int *)&v46, __C, (float *)__p, a5, 0);
  uint64_t v38 = *(void *)(a1 + 20);
  unint64_t v46 = *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned int *)(a1 + 16) << 32);
  uint64_t v47 = v38;
  reranker::EncoderLayer<float>::forward((unsigned int *)&v46, (const float *)__p, __C, a5, 1);
  int v39 = *(_DWORD *)(a1 + 16);
  unint64_t v46 = *(unsigned int *)(a1 + 8) | 0x100000000;
  LODWORD(v47) = v39;
  reranker::Linear::forward((reranker::Linear *)&v46, __C, a4, (const float *)v41, v40 + 1);
  if (__p)
  {
    int v49 = __p;
    operator delete(__p);
  }
  if (__C)
  {
    int v52 = __C;
    operator delete(__C);
  }
  if (v54)
  {
    BOOL v55 = v54;
    operator delete(v54);
  }
}

void sub_25E36CD3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,void *a26,uint64_t a27)
{
  if (__p) {
    operator delete(__p);
  }
  if (a26) {
    operator delete(a26);
  }
  unint64_t v29 = *(void **)(v27 - 112);
  if (v29)
  {
    *(void *)(v27 - 104) = v29;
    operator delete(v29);
  }
  _Unwind_Resume(exception_object);
}

uint64_t verify_model_from_container_flatbuffer(unsigned int *a1, unint64_t a2)
{
  uint64_t result = 2;
  if (a1 && a2 >= 0xC)
  {
    v8[0] = a1;
    v8[1] = a2;
    long long v9 = xmmword_25E3746B0;
    uint64_t v10 = 0;
    uint64_t v11 = 1;
    if (a2 >= 0x7FFFFFFF) {
      verify_model_from_container_flatbuffer_cold_1();
    }
    if (flatbuffers::Verifier::VerifyBufferFromStart<HashML::ModelContainer>((flatbuffers::Verifier *)v8, "HMFB", 0))
    {
      long long v4 = (int *)((char *)a1 + *a1);
      uint64_t v5 = (unsigned __int16 *)((char *)v4 - *v4);
      if (*v5 < 0xDu || !v5[6]) {
        return 9;
      }
      uint64_t v6 = v5[5];
      if (v5[5]) {
        uint64_t v6 = *(void *)((char *)v4 + v6);
      }
      if (v6 == *(int *)((char *)v4 + v5[6] + *(unsigned int *)((char *)v4 + v5[6])))
      {
        if (v5[2] && *(void *)((char *)v4 + v5[2]) == 1 && (uint64_t v7 = v5[3]) != 0 && *(uint64_t *)((char *)v4 + v7) > 0) {
          return 0;
        }
        else {
          return 8;
        }
      }
      else
      {
        return 9;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t verify_and_load_flatbuffer_from_file(const char *a1, unsigned int **a2, off_t *a3)
{
  uint64_t result = flatbuffer_from_file(a1, a2, a3);
  if (!result)
  {
    uint64_t v6 = *a2;
    unint64_t v7 = *a3;
    return verify_model_from_container_flatbuffer(v6, v7);
  }
  return result;
}

uint64_t flatbuffer_from_file(const char *a1, void *a2, off_t *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(&v12, 0, sizeof(v12));
  stat(a1, &v12);
  if ((v12.st_mode & 0xF000) == 0xA000)
  {
    bzero(&v13, 0x400uLL);
    ssize_t v6 = readlink(a1, (char *)&v13, 0x3FFuLL);
    if (v6 < 0) {
      return 1;
    }
    *((unsigned char *)&v13.st_dev + v6) = 0;
    unint64_t v7 = &v13;
  }
  else
  {
    unint64_t v7 = (stat *)a1;
  }
  int v8 = open((const char *)v7, 0);
  int v9 = v8;
  if (v8 < 0) {
    return 5;
  }
  memset(&v13, 0, sizeof(v13));
  if (fstat(v8, &v13) < 0) {
    return 5;
  }
  uint64_t v10 = mmap(0, v13.st_size, 1, 1, v9, 0);
  uint64_t result = 0;
  *a2 = v10;
  *a3 = v13.st_size;
  return result;
}

uint64_t query_lsh_flatbuffer_from_file(uint64_t *a1, int a2, int a3, void *a4, const char *a5, int a6)
{
  size_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t result = verify_and_load_flatbuffer_from_file(a5, &v19, (off_t *)&v18);
  unsigned int v20 = result;
  if (!result)
  {
    stat v12 = (int *)((char *)v19 + *v19);
    long long v17 = 0u;
    memset(v16, 0, sizeof(v16));
    stat v13 = (unsigned __int16 *)((char *)v12 - *v12);
    if (*v13 >= 0xDu && (uint64_t v14 = v13[6]) != 0) {
      uint64_t v15 = (char *)v12 + v14 + *(unsigned int *)((char *)v12 + v14);
    }
    else {
      uint64_t v15 = 0;
    }
    CLSHInfer::CLSHInfer((uint64_t)v16, (int *)&v15[*((unsigned int *)v15 + 1) + 4]);
    DWORD2(v17) = a6;
    CLSHInfer::search((uint64_t)v16, a1, a2, a3, a4, &v20);
    munmap(v19, v18);
    return v20;
  }
  return result;
}

uint64_t retrieval_flatbuffer_from_file(uint64_t *a1, int a2, int a3, uint64_t *a4, const char *a5, uint64_t a6, uint64_t a7)
{
  if (!a7) {
    return 7;
  }
  size_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v13 = verify_and_load_flatbuffer_from_file(a5, &v26, (off_t *)&v25);
  if (v13)
  {
    uint64_t v14 = v13;
    *(void *)(a7 + 16) = 0;
    *(_DWORD *)(a7 + 24) = 0;
    if ((v13 & 0xFFFFFFFE) == 8)
    {
      uint64_t v15 = (int *)((char *)v26 + *v26);
      uint64_t v16 = (unsigned __int16 *)((char *)v15 - *v15);
      if (*v16 < 5u)
      {
        LODWORD(v17) = 0;
      }
      else
      {
        uint64_t v17 = v16[2];
        if (v17) {
          LODWORD(v17) = *(int *)((char *)v15 + v17);
        }
      }
      *(_DWORD *)(a7 + 16) = v17;
      uint64_t v19 = (unsigned __int16 *)((char *)v15 - *v15);
      if (*v19 < 7u)
      {
        LODWORD(v20) = 0;
      }
      else
      {
        uint64_t v20 = v19[3];
        if (v20) {
          LODWORD(v20) = *(int *)((char *)v15 + v20);
        }
      }
      *(_DWORD *)(a7 + 20) = v20;
      uint64_t v21 = (unsigned __int16 *)((char *)v15 - *v15);
      if (*v21 >= 9u && (uint64_t v22 = v21[4]) != 0) {
        int v23 = *(int *)((char *)v15 + v22);
      }
      else {
        int v23 = 0;
      }
      *(_DWORD *)(a7 + 24) = v23;
    }
  }
  else
  {
    size_t v18 = v26;
    uint64_t v14 = retrieval_flatbuffer(a1, a2, a3, a4, v26, a6, a7);
    munmap(v18, v25);
  }
  return v14;
}

uint64_t emb_query_lsh_flatbuffer(const float *a1, int a2, void *a3, unsigned int *a4)
{
  unint64_t v7 = (int *)((char *)a4 + *a4);
  int v8 = (unsigned __int16 *)((char *)v7 - *v7);
  if (*v8 >= 0xDu && (uint64_t v9 = v8[6]) != 0) {
    uint64_t v10 = (char *)v7 + v9 + *(unsigned int *)((char *)v7 + v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (int *)&v10[*((unsigned int *)v10 + 1) + 4];
  memset(v14, 0, sizeof(v14));
  CLSHInfer::CLSHInfer((uint64_t)v14, v11);
  unsigned int v13 = 0;
  CLSHInfer::search((uint64_t)v14, a1, a2, a3, &v13);
  return v13;
}

uint64_t emb_query_lsh_flatbuffer_from_file(const float *a1, int a2, void *a3, const char *a4)
{
  size_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t result = verify_and_load_flatbuffer_from_file(a4, &v14, (off_t *)&v13);
  unsigned int v15 = result;
  if (!result)
  {
    int v8 = (int *)((char *)v14 + *v14);
    memset(v12, 0, sizeof(v12));
    uint64_t v9 = (unsigned __int16 *)((char *)v8 - *v8);
    if (*v9 >= 0xDu && (uint64_t v10 = v9[6]) != 0) {
      uint64_t v11 = (char *)v8 + v10 + *(unsigned int *)((char *)v8 + v10);
    }
    else {
      uint64_t v11 = 0;
    }
    CLSHInfer::CLSHInfer((uint64_t)v12, (int *)&v11[*((unsigned int *)v11 + 1) + 4]);
    CLSHInfer::search((uint64_t)v12, a1, a2, a3, &v15);
    munmap(v14, v13);
    return v15;
  }
  return result;
}

uint64_t emb_lookup_flatbuffer(uint64_t *a1, int a2, char *a3, unsigned int *a4, int a5)
{
  LODWORD(v7) = a2;
  uint64_t v9 = *a4;
  memset(v16, 0, sizeof(v16));
  CLSHInfer::CLSHInfer((uint64_t)v16, (int *)((char *)a4 + v9));
  uint64_t v10 = SHIDWORD(v16[0]);
  if (a5)
  {
    bzero(a3, 4 * SHIDWORD(v16[0]));
    if ((int)v7 >= 1)
    {
      uint64_t v11 = v7;
      do
      {
        uint64_t v12 = *a1++;
        CLSHInfer::emb_lookup_accumulate((CLSHInfer *)v16, v12, (float *)a3);
        --v11;
      }
      while (v11);
    }
    if (a5 == 2)
    {
      float v13 = 1.0 / (double)(int)v7;
      cblas_sscal(v10, v13, (float *)a3, 1);
    }
  }
  else if ((int)v7 >= 1)
  {
    uint64_t v7 = v7;
    do
    {
      uint64_t v14 = *a1++;
      CLSHInfer::emb_lookup((CLSHInfer *)v16, v14, (float *)a3);
      a3 += 4 * v10;
      --v7;
    }
    while (v7);
  }
  return 0;
}

uint64_t emb_lookup_flatbuffer_from_file(uint64_t *a1, int a2, char *a3, const char *a4, int a5)
{
  LODWORD(v7) = a2;
  size_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v9 = verify_and_load_flatbuffer_from_file(a4, &v22, (off_t *)&v21);
  if (!v9)
  {
    uint64_t v10 = (int *)((char *)v22 + *v22);
    memset(v20, 0, sizeof(v20));
    uint64_t v11 = (unsigned __int16 *)((char *)v10 - *v10);
    if (*v11 >= 0xDu && (uint64_t v12 = v11[6]) != 0) {
      float v13 = (char *)v10 + v12 + *(unsigned int *)((char *)v10 + v12);
    }
    else {
      float v13 = 0;
    }
    CLSHInfer::CLSHInfer((uint64_t)v20, (int *)&v13[*((unsigned int *)v13 + 1) + 4]);
    uint64_t v14 = SHIDWORD(v20[0]);
    if (a5)
    {
      bzero(a3, 4 * SHIDWORD(v20[0]));
      if ((int)v7 >= 1)
      {
        uint64_t v15 = v7;
        do
        {
          uint64_t v16 = *a1++;
          CLSHInfer::emb_lookup_accumulate((CLSHInfer *)v20, v16, (float *)a3);
          --v15;
        }
        while (v15);
      }
      if (a5 == 2)
      {
        float v17 = 1.0 / (double)(int)v7;
        cblas_sscal(v14, v17, (float *)a3, 1);
      }
    }
    else if ((int)v7 >= 1)
    {
      uint64_t v7 = v7;
      do
      {
        uint64_t v18 = *a1++;
        CLSHInfer::emb_lookup((CLSHInfer *)v20, v18, (float *)a3);
        a3 += 4 * v14;
        --v7;
      }
      while (v7);
    }
    munmap(v22, v21);
  }
  return v9;
}

uint64_t fnv_1a_64(char *a1, int a2)
{
  uint64_t result = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    uint64_t result = 0xCBF29CE484222325;
    if (a2 >= 1000) {
      uint64_t v4 = 1000;
    }
    else {
      uint64_t v4 = a2;
    }
    if (v4)
    {
      do
      {
        uint64_t v5 = *a1++;
        uint64_t result = 0x100000001B3 * (result ^ v5);
        --v4;
      }
      while (v4);
    }
  }
  return result;
}

void __clang_call_terminate(void *a1)
{
}

void std::vector<int>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265522B48, MEMORY[0x263F8C060]);
}

void sub_25E36D75C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::pair<int,int>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(12 * a2);
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,false>(int *a1, char *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  uint64_t v10 = (int *)(a2 - 12);
  uint64_t v11 = a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = a2 - (char *)v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((a2 - (char *)v11) >> 2);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          unsigned __int8 v28 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v10, (uint64_t)v11);
          if (v28 != 129 && (char)v28 < 0)
          {
            int v29 = *v11;
            *uint64_t v11 = *((_DWORD *)a2 - 3);
            *((_DWORD *)a2 - 3) = v29;
            int v30 = v11[1];
            v11[1] = *((_DWORD *)a2 - 2);
            *((_DWORD *)a2 - 2) = v30;
            int v31 = v11[2];
            void v11[2] = *((_DWORD *)a2 - 1);
            *((_DWORD *)a2 - 1) = v31;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v11, v11 + 3, v10);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v11, v11 + 3, v11 + 6, v10);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v11, v11 + 3, v11 + 6, v11 + 9, v10);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 287) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != (int *)a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,std::pair<float,std::pair<int,int>> *>((char *)v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    float v17 = &v11[3 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x601)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v11, &v11[3 * (v15 >> 1)], v10);
      uint64_t v18 = v10;
      uint64_t v19 = &v11[3 * v16];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v11 + 3, v19 - 3, (int *)a2 - 6);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v11 + 6, &v11[3 * v16 + 3], (int *)a2 - 9);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v19 - 3, v17, &v11[3 * v16 + 3]);
      int v20 = *v11;
      *uint64_t v11 = *v17;
      *float v17 = v20;
      uint64_t v21 = *(void *)(v11 + 1);
      *(void *)(v11 + 1) = *(void *)(v19 + 1);
      *(void *)(v19 + 1) = v21;
      uint64_t v10 = v18;
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(&v11[3 * (v15 >> 1)], v11, v10);
    }
    if ((a5 & 1) == 0)
    {
      unsigned __int8 v22 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)(v11 - 3), (uint64_t)v11);
      if (v22 == 129 || ((char)v22 & 0x80000000) == 0)
      {
        uint64_t v11 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,std::pair<int,int>> *,std::__less<void,void> &>(v11, (int *)a2);
        goto LABEL_18;
      }
    }
    v24.n128_f32[0] = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,std::pair<int,int>> *,std::__less<void,void> &>(v11, (unint64_t)a2);
    size_t v25 = v23;
    if ((v26 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v27 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v11, v23);
    uint64_t v11 = v25 + 3;
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v25 + 3, (int *)a2))
    {
      a4 = -v13;
      a2 = (char *)v25;
      if (v27) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v27)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,false>(a1, v25, a3, -v13, a5 & 1, v24);
      uint64_t v11 = v25 + 3;
LABEL_18:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)v11, (uint64_t)a2);
  }
  else
  {
    std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)v11, (uint64_t)a2);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v17 = v2;
    uint64_t v18 = v3;
    char v5 = (_DWORD *)result;
    uint64_t v6 = result + 12;
    if (result + 12 != a2)
    {
      uint64_t v7 = 0;
      uint64_t v8 = result;
      do
      {
        uint64_t v9 = v8;
        uint64_t v8 = v6;
        uint64_t result = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(v6, v9);
        if (result != 129 && (char)result < 0)
        {
          uint64_t v15 = *(void *)v8;
          int v16 = *(_DWORD *)(v8 + 8);
          uint64_t v10 = v7;
          while (1)
          {
            uint64_t v11 = (_DWORD *)((char *)v5 + v10);
            v11[3] = *(_DWORD *)((char *)v5 + v10);
            int v12 = *(_DWORD *)((char *)v5 + v10 + 8);
            v11[4] = *(_DWORD *)((char *)v5 + v10 + 4);
            v11[5] = v12;
            if (!v10) {
              break;
            }
            v10 -= 12;
            uint64_t result = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v15, (uint64_t)v5 + v10);
            if (result == 129 || ((char)result & 0x80000000) == 0)
            {
              uint64_t v13 = (_DWORD *)((char *)v5 + v10 + 12);
              goto LABEL_12;
            }
          }
          uint64_t v13 = v5;
LABEL_12:
          *uint64_t v13 = v15;
          int v14 = v16;
          v13[1] = HIDWORD(v15);
          v13[2] = v14;
        }
        uint64_t v6 = v8 + 12;
        v7 += 12;
      }
      while (v8 + 12 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v14 = v2;
    uint64_t v15 = v3;
    uint64_t v5 = result;
    uint64_t v6 = result + 12;
    if (result + 12 != a2)
    {
      uint64_t v7 = (_DWORD *)(result - 12);
      do
      {
        uint64_t v8 = v5;
        uint64_t v5 = v6;
        uint64_t result = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(v6, v8);
        if (result != 129 && (char)result < 0)
        {
          uint64_t v12 = *(void *)v5;
          int v13 = *(_DWORD *)(v5 + 8);
          uint64_t v9 = v7;
          do
          {
            v9[6] = v9[3];
            int v10 = v9[5];
            v9[7] = v9[4];
            v9[8] = v10;
            uint64_t result = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v12, (uint64_t)v9);
            v9 -= 3;
          }
          while (result != 129 && (char)result < 0);
          v9[6] = v12;
          int v11 = v13;
          v9[7] = HIDWORD(v12);
          v9[8] = v11;
        }
        uint64_t v6 = v5 + 12;
        v7 += 3;
      }
      while (v5 + 12 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(int *a1, int *a2, int *a3)
{
  unsigned __int8 v6 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a2, (uint64_t)a1);
  unsigned __int8 v7 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a3, (uint64_t)a2);
  BOOL v9 = v7 != 129 && (v7 & 0x80u) != 0;
  if (v6 == 129 || ((char)v6 & 0x80000000) == 0)
  {
    if (v9)
    {
      int v15 = *a2;
      *a2 = *a3;
      *a3 = v15;
      int v16 = a2[1];
      a2[1] = a3[1];
      a3[1] = v16;
      int v13 = a2 + 2;
      int v17 = a2[2];
      a2[2] = a3[2];
      a3[2] = v17;
      unsigned __int8 v18 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a2, (uint64_t)a1);
      uint64_t result = 1;
      if (v18 != 129 && (char)v18 < 0)
      {
        int v19 = *a1;
        *a1 = *a2;
        *a2 = v19;
        int v20 = a1[1];
        a1[1] = a2[1];
        a2[1] = v20;
        int v10 = a1 + 2;
LABEL_18:
        uint64_t result = 2;
        goto LABEL_19;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    int v10 = a1 + 2;
    int v11 = *a1;
    if (v9)
    {
      *a1 = *a3;
      *a3 = v11;
      int v12 = a1[1];
      a1[1] = a3[1];
      a3[1] = v12;
      int v13 = a3 + 2;
      uint64_t result = 1;
LABEL_19:
      int v26 = *v10;
      *int v10 = *v13;
      *int v13 = v26;
      return result;
    }
    *a1 = *a2;
    *a2 = v11;
    int v21 = a1[1];
    a1[1] = a2[1];
    a2[1] = v21;
    int v10 = a2 + 2;
    int v22 = a1[2];
    a1[2] = a2[2];
    a2[2] = v22;
    unsigned __int8 v23 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a3, (uint64_t)a2);
    uint64_t result = 1;
    if (v23 != 129 && (char)v23 < 0)
    {
      int v24 = *a2;
      *a2 = *a3;
      *a3 = v24;
      int v25 = a2[1];
      a2[1] = a3[1];
      a3[1] = v25;
      int v13 = a3 + 2;
      goto LABEL_18;
    }
  }
  return result;
}

int *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,std::pair<int,int>> *,std::__less<void,void> &>(int *a1, int *a2)
{
  uint64_t v2 = a2;
  uint64_t v16 = *(void *)a1;
  int v17 = a1[2];
  unsigned __int8 v4 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)(a2 - 3));
  if (v4 == 129 || ((char)v4 & 0x80000000) == 0)
  {
    unint64_t v7 = (unint64_t)(a1 + 3);
    do
    {
      uint64_t v5 = (int *)v7;
      if (v7 >= (unint64_t)v2) {
        break;
      }
      unsigned __int8 v8 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, v7);
      unint64_t v7 = (unint64_t)(v5 + 3);
    }
    while (v8 == 129 || ((char)v8 & 0x80000000) == 0);
  }
  else
  {
    uint64_t v5 = a1;
    do
    {
      do
      {
        v5 += 3;
        unsigned __int8 v6 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)v5);
      }
      while (v6 == 129);
    }
    while (((char)v6 & 0x80000000) == 0);
  }
  if (v5 < v2)
  {
    do
    {
      v2 -= 3;
      unsigned __int8 v9 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)v2);
    }
    while (v9 != 129 && (char)v9 < 0);
  }
  while (v5 < v2)
  {
    int v10 = *v5;
    *uint64_t v5 = *v2;
    int *v2 = v10;
    int v11 = v5[1];
    v5[1] = v2[1];
    v2[1] = v11;
    int v12 = v5[2];
    v5[2] = v2[2];
    v2[2] = v12;
    do
    {
      do
      {
        v5 += 3;
        unsigned __int8 v13 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)v5);
      }
      while (v13 == 129);
    }
    while (((char)v13 & 0x80000000) == 0);
    do
    {
      v2 -= 3;
      unsigned __int8 v14 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)v2);
    }
    while (v14 != 129 && (char)v14 < 0);
  }
  if (v5 - 3 != a1)
  {
    *a1 = *(v5 - 3);
    a1[1] = *(v5 - 2);
    a1[2] = *(v5 - 1);
  }
  *(void *)(v5 - 3) = v16;
  *(v5 - 1) = v17;
  return v5;
}

float std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,std::pair<int,int>> *,std::__less<void,void> &>(int *a1, unint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v17 = *(void *)a1;
  int v18 = a1[2];
  do
  {
    v4 += 3;
    unsigned __int8 v5 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&a1[v4], (uint64_t)&v17);
  }
  while (v5 != 129 && (char)v5 < 0);
  unint64_t v6 = (unint64_t)&a1[v4];
  if (v4 == 3)
  {
    while (v6 < a2)
    {
      a2 -= 12;
      unsigned __int8 v8 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(a2, (uint64_t)&v17);
      if (v8 != 129 && (char)v8 < 0) {
        break;
      }
    }
  }
  else
  {
    do
    {
      do
      {
        a2 -= 12;
        unsigned __int8 v7 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(a2, (uint64_t)&v17);
      }
      while (v7 == 129);
    }
    while (((char)v7 & 0x80000000) == 0);
  }
  if (v6 >= a2)
  {
    int v10 = &a1[v4];
  }
  else
  {
    unsigned __int8 v9 = (int *)a2;
    int v10 = &a1[v4];
    do
    {
      int v11 = *v10;
      *int v10 = *v9;
      int *v9 = v11;
      int v12 = v10[1];
      v10[1] = v9[1];
      v9[1] = v12;
      int v13 = v10[2];
      v10[2] = v9[2];
      v9[2] = v13;
      do
      {
        v10 += 3;
        unsigned __int8 v14 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v10, (uint64_t)&v17);
      }
      while (v14 != 129 && (char)v14 < 0);
      do
      {
        do
        {
          v9 -= 3;
          unsigned __int8 v15 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v9, (uint64_t)&v17);
        }
        while (v15 == 129);
      }
      while (((char)v15 & 0x80000000) == 0);
    }
    while (v10 < v9);
  }
  if (v10 - 3 != a1)
  {
    *a1 = *(v10 - 3);
    a1[1] = *(v10 - 2);
    a1[2] = *(v10 - 1);
  }
  float result = *(float *)&v17;
  *(void *)(v10 - 3) = v17;
  *(v10 - 1) = v18;
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(int *a1, int *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      unsigned __int8 v6 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)(a2 - 3), (uint64_t)a1);
      BOOL result = 1;
      if (v6 != 129 && (char)v6 < 0)
      {
        int v7 = *a1;
        *a1 = *(a2 - 3);
        *(a2 - 3) = v7;
        int v8 = a1[1];
        a1[1] = *(a2 - 2);
        *(a2 - 2) = v8;
        int v9 = a1[2];
        a1[2] = *(a2 - 1);
        *(a2 - 1) = v9;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a1 + 3, a2 - 3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a1 + 3, a1 + 6, a2 - 3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a1 + 3, a1 + 6, a1 + 9, a2 - 3);
      return 1;
    default:
      uint64_t v10 = (uint64_t)(a1 + 6);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a1 + 3, a1 + 6);
      uint64_t v11 = (uint64_t)(a1 + 9);
      if (a1 + 9 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    unsigned __int8 v14 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(v11, v10);
    if (v14 != 129 && (char)v14 < 0)
    {
      uint64_t v21 = *(void *)v11;
      int v22 = *(_DWORD *)(v11 + 8);
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = (int *)((char *)a1 + v15);
        v16[9] = *(int *)((char *)a1 + v15 + 24);
        int v17 = *(int *)((char *)a1 + v15 + 32);
        _OWORD v16[10] = *(int *)((char *)a1 + v15 + 28);
        _OWORD v16[11] = v17;
        if (v15 == -24) {
          break;
        }
        unsigned __int8 v18 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v21, (uint64_t)(v16 + 3));
        v15 -= 12;
        if (v18 == 129 || ((char)v18 & 0x80000000) == 0)
        {
          int v19 = (int *)((char *)a1 + v15 + 36);
          goto LABEL_15;
        }
      }
      int v19 = a1;
LABEL_15:
      int *v19 = v21;
      int v20 = v22;
      v19[1] = HIDWORD(v21);
      v19[2] = v20;
      if (++v13 == 8) {
        return v11 + 12 == (void)a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 12;
    v11 += 12;
    if ((int *)v11 == a2) {
      return 1;
    }
  }
}

uint64_t std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(uint64_t a1, uint64_t a2)
{
  if (*(float *)a1 == *(float *)a2) {
    LODWORD(v2) = 0;
  }
  else {
    LODWORD(v2) = -127;
  }
  if (*(float *)a1 > *(float *)a2) {
    LODWORD(v2) = 1;
  }
  if (*(float *)a1 < *(float *)a2) {
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v2 = v2;
  }
  if (!v2)
  {
    int v3 = *(_DWORD *)(a1 + 4);
    int v4 = *(_DWORD *)(a2 + 4);
    BOOL v5 = v3 == v4;
    if (v3 < v4) {
      char v6 = -1;
    }
    else {
      char v6 = 1;
    }
    if (v5)
    {
      int v7 = *(_DWORD *)(a1 + 8);
      int v8 = *(_DWORD *)(a2 + 8);
      BOOL v9 = v7 == v8;
      if (v7 < v8) {
        char v6 = -1;
      }
      else {
        char v6 = 1;
      }
      if (v9) {
        char v6 = 0;
      }
    }
    if (v6) {
      return (v6 >> 7) | 1u;
    }
    else {
      return 0;
    }
  }
  return v2;
}

float std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(int *a1, int *a2, int *a3, int *a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a2, a3);
  unsigned __int8 v8 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a4, (uint64_t)a3);
  if (v8 != 129 && (char)v8 < 0)
  {
    int v10 = *a3;
    *a3 = *a4;
    *a4 = v10;
    int v11 = a3[1];
    a3[1] = a4[1];
    a4[1] = v11;
    int v12 = a3[2];
    a3[2] = a4[2];
    a4[2] = v12;
    unsigned __int8 v13 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a3, (uint64_t)a2);
    if (v13 != 129 && (char)v13 < 0)
    {
      int v14 = *a2;
      *a2 = *a3;
      *a3 = v14;
      int v15 = a2[1];
      a2[1] = a3[1];
      a3[1] = v15;
      int v16 = a2[2];
      a2[2] = a3[2];
      a3[2] = v16;
      unsigned __int8 v17 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a2, (uint64_t)a1);
      if (v17 != 129 && (char)v17 < 0)
      {
        float result = *(float *)a1;
        *a1 = *a2;
        *(float *)a2 = result;
        int v18 = a1[1];
        a1[1] = a2[1];
        a2[1] = v18;
        int v19 = a1[2];
        a1[2] = a2[2];
        a2[2] = v19;
      }
    }
  }
  return result;
}

float std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(int *a1, int *a2, int *a3, int *a4, int *a5)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a2, a3, a4);
  unsigned __int8 v10 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a5, (uint64_t)a4);
  if (v10 != 129 && (char)v10 < 0)
  {
    int v12 = *a4;
    *a4 = *a5;
    *a5 = v12;
    int v13 = a4[1];
    a4[1] = a5[1];
    a5[1] = v13;
    int v14 = a4[2];
    a4[2] = a5[2];
    a5[2] = v14;
    unsigned __int8 v15 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a4, (uint64_t)a3);
    if (v15 != 129 && (char)v15 < 0)
    {
      int v16 = *a3;
      *a3 = *a4;
      *a4 = v16;
      int v17 = a3[1];
      a3[1] = a4[1];
      a4[1] = v17;
      int v18 = a3[2];
      a3[2] = a4[2];
      a4[2] = v18;
      unsigned __int8 v19 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a3, (uint64_t)a2);
      if (v19 != 129 && (char)v19 < 0)
      {
        int v20 = *a2;
        *a2 = *a3;
        *a3 = v20;
        int v21 = a2[1];
        a2[1] = a3[1];
        a3[1] = v21;
        int v22 = a2[2];
        a2[2] = a3[2];
        a3[2] = v22;
        unsigned __int8 v23 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a2, (uint64_t)a1);
        if (v23 != 129 && (char)v23 < 0)
        {
          float result = *(float *)a1;
          *a1 = *a2;
          *(float *)a2 = result;
          int v24 = a1[1];
          a1[1] = a2[1];
          a2[1] = v24;
          int v25 = a1[2];
          a1[2] = a2[2];
          a2[2] = v25;
        }
      }
    }
  }
  return result;
}

char *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,std::pair<float,std::pair<int,int>> *>(char *a1, char *a2, char *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) / 12;
    if (a2 - a1 >= 13)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = (uint64_t)&a1[12 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)a1, a4, v9, v12);
        v12 -= 12;
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      int v14 = a2;
      do
      {
        unsigned __int8 v15 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v14, (uint64_t)a1);
        if (v15 != 129 && (char)v15 < 0)
        {
          int v16 = *(_DWORD *)v14;
          *(_DWORD *)int v14 = *(_DWORD *)a1;
          *(_DWORD *)a1 = v16;
          int v17 = *((_DWORD *)v14 + 1);
          *((_DWORD *)v14 + 1) = *((_DWORD *)a1 + 1);
          *((_DWORD *)a1 + 1) = v17;
          int v18 = *((_DWORD *)v14 + 2);
          *((_DWORD *)v14 + 2) = *((_DWORD *)a1 + 2);
          *((_DWORD *)a1 + 2) = v18;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)a1, a4, v9, (uint64_t)a1);
        }
        v14 += 12;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 13)
    {
      int64_t v19 = v8 / 0xCuLL;
      int v20 = a2 - 12;
      do
      {
        int v21 = *(_DWORD *)a1;
        int v23 = *((_DWORD *)a1 + 1);
        int v22 = *((_DWORD *)a1 + 2);
        int v24 = (char *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a4, v19);
        if (v20 == v24)
        {
          *(_DWORD *)int v24 = v21;
          *((_DWORD *)v24 + 1) = v23;
          *((_DWORD *)v24 + 2) = v22;
        }
        else
        {
          *(_DWORD *)int v24 = *(_DWORD *)v20;
          *((_DWORD *)v24 + 1) = *((_DWORD *)v20 + 1);
          *((_DWORD *)v24 + 2) = *((_DWORD *)v20 + 2);
          *(_DWORD *)int v20 = v21;
          *((_DWORD *)v20 + 1) = v23;
          *((_DWORD *)v20 + 2) = v22;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)a1, (uint64_t)(v24 + 12), a4, 0xAAAAAAAAAAAAAAABLL * ((v24 + 12 - a1) >> 2));
        }
        v20 -= 12;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

float std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v23 = v4;
    uint64_t v24 = v5;
    uint64_t v7 = a4;
    uint64_t v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((a4 - a1) >> 2)))
    {
      uint64_t v11 = (0x5555555555555556 * ((a4 - a1) >> 2)) | 1;
      uint64_t v12 = (_DWORD *)(a1 + 12 * v11);
      uint64_t v13 = 0x5555555555555556 * ((a4 - a1) >> 2) + 2;
      if (v13 < a3)
      {
        unsigned __int8 v14 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(a1 + 12 * v11, (uint64_t)(v12 + 3));
        if (v14 != 129 && (v14 & 0x80u) != 0)
        {
          v12 += 3;
          uint64_t v11 = v13;
        }
      }
      unsigned __int8 v15 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v12, v7);
      if (v15 == 129 || ((char)v15 & 0x80000000) == 0)
      {
        uint64_t v21 = *(void *)v7;
        int v22 = *(_DWORD *)(v7 + 8);
        while (1)
        {
          int v17 = v12;
          *(_DWORD *)uint64_t v7 = *v12;
          *(_DWORD *)(v7 + 4) = v12[1];
          *(_DWORD *)(v7 + 8) = v12[2];
          if (v9 < v11) {
            break;
          }
          uint64_t v18 = (2 * v11) | 1;
          uint64_t v12 = (_DWORD *)(a1 + 12 * v18);
          uint64_t v11 = 2 * v11 + 2;
          if (v11 >= a3)
          {
            uint64_t v11 = v18;
          }
          else
          {
            unsigned __int8 v19 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(a1 + 12 * v18, (uint64_t)(v12 + 3));
            if (v19 != 129 && (v19 & 0x80u) != 0) {
              v12 += 3;
            }
            else {
              uint64_t v11 = v18;
            }
          }
          unsigned __int8 v20 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v12, (uint64_t)&v21);
          uint64_t v7 = (uint64_t)v17;
          if (v20 != 129)
          {
            uint64_t v7 = (uint64_t)v17;
            if ((char)v20 < 0) {
              break;
            }
          }
        }
        float result = *(float *)&v21;
        *(void *)int v17 = v21;
        v17[2] = v22;
      }
    }
  }
  return result;
}

_DWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = a3 - 2;
  if (a3 < 2) {
    uint64_t v6 = a3 - 1;
  }
  uint64_t v7 = v6 >> 1;
  do
  {
    uint64_t v8 = &a1[3 * v5 + 3];
    uint64_t v9 = (2 * v5) | 1;
    uint64_t v10 = 2 * v5 + 2;
    if (v10 < a3)
    {
      unsigned __int8 v11 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&a1[3 * v5 + 3], (uint64_t)&a1[3 * v5 + 6]);
      if (v11 != 129 && (v11 & 0x80u) != 0)
      {
        v8 += 3;
        uint64_t v9 = v10;
      }
    }
    *a1 = *v8;
    a1[1] = v8[1];
    a1[2] = v8[2];
    a1 = v8;
    uint64_t v5 = v9;
  }
  while (v9 <= v7);
  return v8;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v15 = v4;
    uint64_t v16 = v5;
    unint64_t v7 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v8 = (_DWORD *)(a1 + 12 * v7);
    uint64_t v9 = (_DWORD *)(a2 - 12);
    unsigned __int8 v10 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v8, a2 - 12);
    if (v10 != 129 && (char)v10 < 0)
    {
      *(void *)unsigned __int8 v14 = *(void *)v9;
      *(_DWORD *)&v14[8] = v9[2];
      do
      {
        uint64_t v12 = v8;
        _DWORD *v9 = *v8;
        v9[1] = v8[1];
        v9[2] = v8[2];
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (_DWORD *)(a1 + 12 * v7);
        unsigned __int8 v13 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v8, (uint64_t)v14);
        if (v13 == 129) {
          break;
        }
        uint64_t v9 = v12;
      }
      while ((char)v13 < 0);
      *uint64_t v12 = *(_DWORD *)v14;
      double result = *(double *)&v14[4];
      *(void *)(v12 + 1) = *(void *)&v14[4];
    }
  }
  return result;
}

uint64_t *std::back_insert_iterator<std::vector<int>>::operator=[abi:ne180100](uint64_t *a1, _DWORD *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(_DWORD **)(*a1 + 8);
  uint64_t v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    uint64_t v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = *v6 - (void)v8;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      unsigned __int8 v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v6, v12);
      uint64_t v8 = *(_DWORD **)v4;
      uint64_t v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
    unsigned __int8 v14 = &v13[4 * v9];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)unsigned __int8 v14 = *a2;
    unint64_t v7 = v14 + 4;
    while (v5 != v8)
    {
      int v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *uint64_t v5 = *a2;
    unint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

int *std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<int *>,std::__wrap_iter<int *>,std::__equal_to &>(int *a1, int *a2)
{
  double result = a2;
  if (a1 != a2)
  {
    uint64_t v4 = a1 + 1;
    do
    {
      if (v4 == a2) {
        return a2;
      }
      int v5 = *(v4 - 1);
      int v6 = *v4++;
    }
    while (v5 != v6);
    unint64_t v7 = v4 - 2;
    while (v4 != a2)
    {
      int v8 = v5;
      int v5 = *v4;
      if (v8 != *v4)
      {
        v7[1] = v5;
        ++v7;
      }
      ++v4;
    }
    return v7 + 1;
  }
  return result;
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  int v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<int>::pointer begin = this->__begin_;
    uint64_t v9 = (char *)end - (char *)this->__begin_;
    unint64_t v10 = __n + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unsigned __int8 v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)p_end_cap, v13);
      std::vector<int>::pointer begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
    uint64_t v15 = &v14[4 * v11];
    int v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    int v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      int v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void *std::vector<long long>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long long>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_25E36F124(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<long long>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    unint64_t v4 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v5 = result + 16 * v4;
    uint64_t v6 = a2 - 16;
    float v7 = *(float *)(a2 - 16);
    float v8 = *(float *)v5;
    if (*(float *)v5 == v7) {
      int v9 = 0;
    }
    else {
      int v9 = -127;
    }
    if (*(float *)v5 > v7) {
      int v9 = 1;
    }
    if (*(float *)v5 < v7) {
      int v9 = -1;
    }
    if (v9
      || ((uint64_t v10 = *(void *)(v5 + 8), v11 = *(void *)(a2 - 8), v12 = v10 == v11, v10 < v11)
        ? (LOBYTE(v9) = -1)
        : (LOBYTE(v9) = 1),
          !v12))
    {
      if ((char)v9 >= 1)
      {
        uint64_t v13 = *(void *)(a2 - 8);
        do
        {
          uint64_t v14 = v5;
          *(float *)uint64_t v6 = v8;
          *(void *)(v6 + 8) = *(void *)(v5 + 8);
          if (!v4) {
            break;
          }
          unint64_t v4 = (v4 - 1) >> 1;
          uint64_t v5 = result + 16 * v4;
          float v8 = *(float *)v5;
          if (*(float *)v5 == v7) {
            int v15 = 0;
          }
          else {
            int v15 = -127;
          }
          if (*(float *)v5 > v7) {
            int v15 = 1;
          }
          if (*(float *)v5 < v7) {
            int v15 = -1;
          }
          if (!v15)
          {
            uint64_t v16 = *(void *)(v5 + 8);
            BOOL v17 = v16 == v13;
            LOBYTE(v15) = v16 < v13 ? -1 : 1;
            if (v17) {
              break;
            }
          }
          int v18 = (char)v15;
          uint64_t v6 = v14;
        }
        while (v18 > 0);
        *(float *)uint64_t v14 = v7;
        *(void *)(v14 + 8) = v13;
      }
    }
  }
  return result;
}

float std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = a1;
    uint64_t v7 = v3 + 1;
    a1 += 16 * (v3 + 1);
    uint64_t v8 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    if (v8 + 2 < a3)
    {
      float v9 = *(float *)(a1 + 16);
      if (*(float *)a1 == v9) {
        int v10 = 0;
      }
      else {
        int v10 = -127;
      }
      if (*(float *)a1 > v9) {
        int v10 = 1;
      }
      if (*(float *)a1 < v9) {
        int v10 = -1;
      }
      if (v10
        || ((uint64_t v11 = *(void *)(v6 + 16 * v7 + 8), v12 = *(void *)(a1 + 24), v13 = v11 == v12, v11 < v12)
          ? (LOBYTE(v10) = -1)
          : (LOBYTE(v10) = 1),
            !v13))
      {
        if ((char)v10 > 0)
        {
          a1 += 16;
          uint64_t v3 = v8 + 2;
        }
      }
    }
    float result = *(float *)a1;
    *(_DWORD *)uint64_t v6 = *(_DWORD *)a1;
    *(void *)(v6 + 8) = *(void *)(a1 + 8);
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a3 != a2)
  {
    v91[11] = v3;
    v91[12] = v4;
    uint64_t v5 = a3;
    uint64_t v7 = result;
    while (1)
    {
      unint64_t v8 = (v5 - v7) >> 4;
      if (v8 < 2) {
        return result;
      }
      if (v8 == 3) {
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v7, v7 + 16, v5 - 16);
      }
      if (v8 == 2)
      {
        float v83 = *(float *)(v5 - 16);
        float v84 = *(float *)v7;
        if (v83 == *(float *)v7) {
          int v85 = 0;
        }
        else {
          int v85 = -127;
        }
        if (v83 > *(float *)v7) {
          int v85 = 1;
        }
        if (v83 < *(float *)v7) {
          int v85 = -1;
        }
        if (v85
          || ((uint64_t v86 = *(void *)(v5 - 8), v87 = *(void *)(v7 + 8), v88 = v86 == v87, v86 < v87)
            ? (LOBYTE(v85) = -1)
            : (LOBYTE(v85) = 1),
              !v88))
        {
          if ((char)v85 >= 1)
          {
            *(float *)uint64_t v7 = v83;
            *(float *)(v5 - 16) = v84;
            uint64_t v89 = *(void *)(v7 + 8);
            *(void *)(v7 + 8) = *(void *)(v5 - 8);
            *(void *)(v5 - 8) = v89;
          }
        }
        return result;
      }
      if (v5 - v7 <= 127) {
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v7, v5);
      }
      float v9 = (float *)(v7 + 16 * (v8 >> 1));
      int v10 = (float *)(v5 - 16);
      float result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v7, (uint64_t)v9, v5 - 16);
      int v11 = result;
      long long v90 = (float *)(v5 - 16);
      v91[0] = (float *)v7;
      if (*(float *)v7 == *v9) {
        int v12 = 0;
      }
      else {
        int v12 = -127;
      }
      if (*(float *)v7 > *v9) {
        int v12 = 1;
      }
      if (*(float *)v7 < *v9) {
        int v12 = -1;
      }
      if (v12
        || ((uint64_t v13 = *(void *)(v7 + 8), v14 = *((void *)v9 + 1), v15 = v13 == v14, v13 < v14)
          ? (LOBYTE(v12) = -1)
          : (LOBYTE(v12) = 1),
            !v15))
      {
        if ((char)v12 > 0) {
          break;
        }
      }
      float result = std::__nth_element_find_guard[abi:ne180100]<std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v91, &v90, (uint64_t)v9);
      uint64_t v16 = v91[0];
      if (result)
      {
        int v10 = v90;
        int v17 = *(_DWORD *)v91[0];
        *v91[0] = *v90;
        *(_DWORD *)int v10 = v17;
        uint64_t v18 = *((void *)v16 + 1);
        *((void *)v16 + 1) = *((void *)v10 + 1);
        *((void *)v10 + 1) = v18;
        ++v11;
        goto LABEL_23;
      }
      int v42 = v91[0] + 4;
      float v49 = *(float *)v7;
      int v50 = *(_DWORD *)v10;
      if (*(float *)v7 == *v10) {
        int v51 = 0;
      }
      else {
        int v51 = -127;
      }
      if (*(float *)v7 > *v10) {
        int v51 = 1;
      }
      if (*(float *)v7 < *v10) {
        int v51 = -1;
      }
      if (!v51
        && ((v52 = *(void *)(v7 + 8), uint64_t v53 = *(void *)(v5 - 8), v54 = v52 == v53, v52 < v53)
          ? (LOBYTE(v51) = -1)
          : (LOBYTE(v51) = 1),
            v54)
        || (char)v51 <= 0)
      {
        while (v42 != v10)
        {
          float v55 = *v42;
          if (v49 == *v42) {
            int v56 = 0;
          }
          else {
            int v56 = -127;
          }
          if (v49 > *v42) {
            int v56 = 1;
          }
          if (v49 < *v42) {
            int v56 = -1;
          }
          if (v56
            || ((uint64_t v57 = *(void *)(v7 + 8), v58 = *((void *)v42 + 1), v59 = v57 == v58, v57 < v58)
              ? (LOBYTE(v56) = -1)
              : (LOBYTE(v56) = 1),
                !v59))
          {
            if ((char)v56 >= 1)
            {
              *(_DWORD *)int v42 = v50;
              *(float *)(v5 - 16) = v55;
              uint64_t v60 = *((void *)v42 + 1);
              *((void *)v42 + 1) = *(void *)(v5 - 8);
              *(void *)(v5 - 8) = v60;
              v42 += 4;
              goto LABEL_130;
            }
          }
          v42 += 4;
          v91[0] = v42;
        }
        return result;
      }
LABEL_130:
      if (v42 == v10) {
        return result;
      }
      while (1)
      {
        float v62 = *(float *)v7;
        while (1)
        {
          float v63 = *v42;
          if (v62 == *v42) {
            int v64 = 0;
          }
          else {
            int v64 = -127;
          }
          if (v62 > *v42) {
            int v64 = 1;
          }
          if (v62 < *v42) {
            int v64 = -1;
          }
          if (v64
            || ((v65 = *(void *)(v7 + 8), v66 = *((void *)v42 + 1), BOOL v67 = v65 == v66, v65 < v66)
              ? (LOBYTE(v64) = -1)
              : (LOBYTE(v64) = 1),
                !v67))
          {
            if ((char)v64 >= 1) {
              break;
            }
          }
          v42 += 4;
          v91[0] = v42;
        }
        uint64_t v68 = v10 - 4;
        do
        {
          int v10 = v68;
          float v69 = *v68;
          BOOL v70 = v62 < *v68;
          BOOL v71 = v62 <= *v68;
          if (v62 == *v68) {
            int v72 = 0;
          }
          else {
            int v72 = -127;
          }
          if (!v71) {
            int v72 = 1;
          }
          if (v70) {
            int v72 = -1;
          }
          if (!v72)
          {
            uint64_t v73 = *(void *)(v7 + 8);
            uint64_t v74 = *((void *)v10 + 1);
            BOOL v75 = v73 == v74;
            LOBYTE(v72) = v73 < v74 ? -1 : 1;
            if (v75) {
              break;
            }
          }
          int v76 = (char)v72;
          uint64_t v68 = v10 - 4;
        }
        while (v76 > 0);
        if (v42 >= v10) {
          break;
        }
        float *v42 = v69;
        *int v10 = v63;
        uint64_t v61 = *((void *)v42 + 1);
        *((void *)v42 + 1) = *((void *)v10 + 1);
        *((void *)v10 + 1) = v61;
        v42 += 4;
        v91[0] = v42;
      }
      if ((unint64_t)v42 > a2) {
        return result;
      }
LABEL_165:
      uint64_t v7 = (uint64_t)v42;
      if (v5 == a2) {
        return result;
      }
    }
    uint64_t v16 = (float *)v7;
LABEL_23:
    unsigned __int8 v19 = v16 + 4;
    if (v19 >= v10)
    {
      uint64_t v21 = (uint64_t)v19;
    }
    else
    {
      uint64_t i = v19;
      while (1)
      {
        uint64_t v21 = (uint64_t)i;
        float v22 = *v9;
        for (uint64_t i = v19 + 4; ; i += 4)
        {
          float v23 = *v19;
          if (*v19 == v22) {
            int v24 = 0;
          }
          else {
            int v24 = -127;
          }
          if (*v19 > v22) {
            int v24 = 1;
          }
          if (*v19 < v22) {
            int v24 = -1;
          }
          if (!v24)
          {
            uint64_t v25 = *((void *)v19 + 1);
            uint64_t v26 = *((void *)v9 + 1);
            BOOL v27 = v25 == v26;
            LOBYTE(v24) = v25 < v26 ? -1 : 1;
            if (v27) {
              break;
            }
          }
          if ((char)v24 <= 0) {
            break;
          }
          uint64_t v21 = (uint64_t)(v19 + 4);
          v91[0] = v19 + 4;
          v19 += 4;
        }
        do
        {
          unsigned __int8 v28 = v10 - 4;
          float v29 = *(v10 - 4);
          if (v29 == v22) {
            int v30 = 0;
          }
          else {
            int v30 = -127;
          }
          if (v29 > v22) {
            int v30 = 1;
          }
          if (v29 < v22) {
            int v30 = -1;
          }
          if (!v30)
          {
            uint64_t v31 = *((void *)v10 - 1);
            uint64_t v32 = *((void *)v9 + 1);
            BOOL v33 = v31 == v32;
            LOBYTE(v30) = v31 < v32 ? -1 : 1;
            if (v33) {
              LOBYTE(v30) = 0;
            }
          }
          v10 -= 4;
        }
        while ((char)v30 < 1);
        long long v90 = v28;
        if (v19 >= v28) {
          break;
        }
        float *v19 = v29;
        float *v28 = v23;
        uint64_t v34 = *((void *)v19 + 1);
        *((void *)v19 + 1) = *((void *)v28 + 1);
        *((void *)v28 + 1) = v34;
        ++v11;
        int v10 = v90;
        if (v19 == v9) {
          float v9 = v90;
        }
        v19 += 4;
        v91[0] = v19;
      }
    }
    if (v19 != v9)
    {
      float v35 = *v19;
      if (*v9 == *v19) {
        int v36 = 0;
      }
      else {
        int v36 = -127;
      }
      if (*v9 > *v19) {
        int v36 = 1;
      }
      if (*v9 < *v19) {
        int v36 = -1;
      }
      if (v36
        || ((v37 = *((void *)v9 + 1), uint64_t v38 = *((void *)v19 + 1), v39 = v37 == v38, v37 < v38)
          ? (LOBYTE(v36) = -1)
          : (LOBYTE(v36) = 1),
            !v39))
      {
        if ((char)v36 >= 1)
        {
          float *v19 = *v9;
          float *v9 = v35;
          uint64_t v40 = *((void *)v19 + 1);
          *((void *)v19 + 1) = *((void *)v9 + 1);
          *((void *)v9 + 1) = v40;
          ++v11;
        }
      }
    }
    if (v19 == (float *)a2) {
      return result;
    }
    if (!v11)
    {
      if ((unint64_t)v19 <= a2)
      {
        if (v21 + 16 == v5) {
          return result;
        }
        for (uint64_t j = (float *)(v21 + 24); ; j += 4)
        {
          int v78 = j - 2;
          float v79 = *(j - 2);
          float v80 = *(j - 6);
          if (v79 == v80) {
            int v81 = 0;
          }
          else {
            int v81 = -127;
          }
          if (v79 > v80) {
            int v81 = 1;
          }
          if (v79 < v80) {
            int v81 = -1;
          }
          if (v81
            || ((uint64_t v82 = *((void *)j - 2), *(void *)j < v82) ? (LOBYTE(v81) = -1) : (LOBYTE(v81) = 1),
                *(void *)j != v82))
          {
            if ((char)v81 > 0) {
              break;
            }
          }
          if (v78 + 4 == (float *)v5) {
            return result;
          }
        }
      }
      else
      {
        if ((float *)(v7 + 16) == v19) {
          return result;
        }
        for (unint64_t k = (float *)(v7 + 24); ; k += 4)
        {
          uint64_t v44 = k - 2;
          float v45 = *(k - 2);
          float v46 = *(k - 6);
          if (v45 == v46) {
            int v47 = 0;
          }
          else {
            int v47 = -127;
          }
          if (v45 > v46) {
            int v47 = 1;
          }
          if (v45 < v46) {
            int v47 = -1;
          }
          if (v47
            || ((uint64_t v48 = *((void *)k - 2), *(void *)k < v48) ? (LOBYTE(v47) = -1) : (LOBYTE(v47) = 1),
                *(void *)k != v48))
          {
            if ((char)v47 > 0) {
              break;
            }
          }
          if (v44 + 4 == v19) {
            return result;
          }
        }
      }
    }
    BOOL v41 = (unint64_t)v19 > a2;
    int v42 = v19 + 4;
    if (v41) {
      uint64_t v5 = v21;
    }
    if (v41) {
      int v42 = (float *)v7;
    }
    goto LABEL_165;
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3 = *(float *)a2;
  float v4 = *(float *)a1;
  if (*(float *)a2 == *(float *)a1) {
    int v5 = 0;
  }
  else {
    int v5 = -127;
  }
  if (*(float *)a2 > *(float *)a1) {
    int v5 = 1;
  }
  if (*(float *)a2 < *(float *)a1) {
    int v5 = -1;
  }
  if (!v5
    && ((v6 = *(void *)(a2 + 8), uint64_t v7 = *(void *)(a1 + 8), v8 = v6 == v7, v6 < v7)
      ? (LOBYTE(v5) = -1)
      : (LOBYTE(v5) = 1),
        v8)
    || (char)v5 <= 0)
  {
    if (*(float *)a3 == v3) {
      int v14 = 0;
    }
    else {
      int v14 = -127;
    }
    if (*(float *)a3 > v3) {
      int v14 = 1;
    }
    if (*(float *)a3 < v3) {
      int v14 = -1;
    }
    if (!v14)
    {
      uint64_t v15 = *(void *)(a3 + 8);
      uint64_t v16 = *(void *)(a2 + 8);
      BOOL v17 = v15 == v16;
      LOBYTE(v14) = v15 < v16 ? -1 : 1;
      if (v17) {
        return 0;
      }
    }
    if ((char)v14 < 1) {
      return 0;
    }
    *(_DWORD *)a2 = *(_DWORD *)a3;
    *(float *)a3 = v3;
    uint64_t v18 = *(void *)(a2 + 8);
    *(void *)(a2 + 8) = *(void *)(a3 + 8);
    *(void *)(a3 + 8) = v18;
    float v19 = *(float *)a1;
    if (*(float *)a2 == *(float *)a1) {
      int v20 = 0;
    }
    else {
      int v20 = -127;
    }
    if (*(float *)a2 > *(float *)a1) {
      int v20 = 1;
    }
    if (*(float *)a2 < *(float *)a1) {
      int v20 = -1;
    }
    if (!v20)
    {
      uint64_t v21 = *(void *)(a2 + 8);
      uint64_t v22 = *(void *)(a1 + 8);
      BOOL v23 = v21 == v22;
      LOBYTE(v20) = v21 < v22 ? -1 : 1;
      if (v23) {
        return 1;
      }
    }
    if ((char)v20 < 1) {
      return 1;
    }
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(float *)a2 = v19;
    uint64_t v24 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a2 + 8) = v24;
    return 2;
  }
  if (*(float *)a3 == v3) {
    int v9 = 0;
  }
  else {
    int v9 = -127;
  }
  if (*(float *)a3 > v3) {
    int v9 = 1;
  }
  if (*(float *)a3 < v3) {
    int v9 = -1;
  }
  if (!v9)
  {
    uint64_t v10 = *(void *)(a3 + 8);
    uint64_t v11 = *(void *)(a2 + 8);
    BOOL v12 = v10 == v11;
    LOBYTE(v9) = v10 < v11 ? -1 : 1;
    if (v12)
    {
LABEL_57:
      *(float *)a1 = v3;
      *(float *)a2 = v4;
      uint64_t v26 = *(void *)(a1 + 8);
      *(void *)(a1 + 8) = v10;
      *(void *)(a2 + 8) = v26;
      if (*(float *)a3 == v4) {
        int v27 = 0;
      }
      else {
        int v27 = -127;
      }
      if (*(float *)a3 > v4) {
        int v27 = 1;
      }
      if (*(float *)a3 < v4) {
        int v27 = -1;
      }
      if (!v27)
      {
        uint64_t v28 = *(void *)(a3 + 8);
        BOOL v29 = v28 == v26;
        LOBYTE(v27) = v28 < v26 ? -1 : 1;
        if (v29) {
          return 1;
        }
      }
      if ((char)v27 < 1) {
        return 1;
      }
      *(_DWORD *)a2 = *(_DWORD *)a3;
      *(float *)a3 = v4;
      *(void *)(a2 + 8) = *(void *)(a3 + 8);
      *(void *)(a3 + 8) = v26;
      return 2;
    }
  }
  if ((char)v9 <= 0)
  {
    uint64_t v10 = *(void *)(a2 + 8);
    goto LABEL_57;
  }
  *(_DWORD *)a1 = *(_DWORD *)a3;
  *(float *)a3 = v4;
  uint64_t v13 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a3 + 8);
  *(void *)(a3 + 8) = v13;
  return 1;
}

uint64_t std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, uint64_t a2)
{
  uint64_t v2 = a2 - 16;
  if (a2 - 16 != result)
  {
    uint64_t v4 = result;
    uint64_t v5 = result;
    do
    {
      float result = std::__min_element[abi:ne180100]<std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>,std::__wrap_iter<std::pair<float,long long>*>>(v4, a2);
      if (v5 != result)
      {
        int v6 = *(_DWORD *)v5;
        *(_DWORD *)uint64_t v5 = *(_DWORD *)result;
        *(_DWORD *)float result = v6;
        uint64_t v7 = *(void *)(v5 + 8);
        *(void *)(v5 + 8) = *(void *)(result + 8);
        *(void *)(result + 8) = v7;
      }
      v5 += 16;
      v4 += 16;
    }
    while (v5 != v2);
  }
  return result;
}

BOOL std::__nth_element_find_guard[abi:ne180100]<std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(float **a1, float **a2, uint64_t a3)
{
  float v3 = *a2 - 4;
  do
  {
    uint64_t v4 = v3;
    *a2 = v3;
    if (v3 == *a1) {
      break;
    }
    if (*v3 == *(float *)a3) {
      int v5 = 0;
    }
    else {
      int v5 = -127;
    }
    if (*v4 > *(float *)a3) {
      int v5 = 1;
    }
    if (*v4 < *(float *)a3) {
      int v5 = -1;
    }
    if (!v5)
    {
      uint64_t v6 = *((void *)v4 + 1);
      uint64_t v7 = *(void *)(a3 + 8);
      BOOL v8 = v6 == v7;
      if (v6 < v7) {
        LOBYTE(v5) = -1;
      }
      else {
        LOBYTE(v5) = 1;
      }
      if (v8) {
        LOBYTE(v5) = 0;
      }
    }
    int v9 = (char)v5;
    float v3 = v4 - 4;
  }
  while (v9 < 1);
  return v4 != *a1;
}

uint64_t std::__min_element[abi:ne180100]<std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    for (uint64_t i = result + 16; i != a2; i += 16)
    {
      if (*(float *)i == *(float *)result) {
        int v3 = 0;
      }
      else {
        int v3 = -127;
      }
      if (*(float *)i > *(float *)result) {
        int v3 = 1;
      }
      if (*(float *)i < *(float *)result) {
        int v3 = -1;
      }
      if (!v3)
      {
        uint64_t v4 = *(void *)(i + 8);
        uint64_t v5 = *(void *)(result + 8);
        BOOL v6 = v4 == v5;
        LOBYTE(v3) = v4 < v5 ? -1 : 1;
        if (v6) {
          continue;
        }
      }
      if ((char)v3 > 0) {
        float result = i;
      }
    }
  }
  return result;
}

void std::vector<std::pair<float,long long>>::__append(void **a1, unint64_t a2)
{
  BOOL v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void **)(v4 - 8);
  if (a2 <= (v6 - (unsigned char *)v7) >> 4)
  {
    if (a2)
    {
      int v14 = &v7[2 * a2];
      do
      {
        *(_DWORD *)uint64_t v7 = 0;
        v7[1] = 0;
        v7 += 2;
      }
      while (v7 != v14);
      uint64_t v7 = v14;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = (char *)v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v15 = &v13[16 * v10];
    uint64_t v16 = &v15[16 * a2];
    BOOL v17 = v15;
    do
    {
      *(_DWORD *)BOOL v17 = 0;
      *((void *)v17 + 1) = 0;
      v17 += 16;
    }
    while (v17 != v16);
    uint64_t v18 = &v13[16 * v12];
    int v20 = (char *)*a1;
    float v19 = (char *)a1[1];
    if (v19 != *a1)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v19 - 1);
        v15 -= 16;
        v19 -= 16;
      }
      while (v19 != v20);
      float v19 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v16;
    a1[2] = v18;
    if (v19)
    {
      operator delete(v19);
    }
  }
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    BOOL v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    BOOL v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

_OWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::pair<float,long long> *>,std::__wrap_iter<std::pair<float,long long> *>,std::back_insert_iterator<std::vector<std::pair<float,long long>>>,0>(_OWORD *a1, _OWORD *a2, void **a3)
{
  int v3 = a1;
  BOOL v6 = a3;
  if (a1 == a2) {
    return a1;
  }
  uint64_t v4 = a2;
  do
    std::back_insert_iterator<std::vector<std::pair<float,long long>>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

void ***std::back_insert_iterator<std::vector<std::pair<float,long long>>>::operator=[abi:ne180100](void ***a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (*a1)[1];
  BOOL v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    uint64_t v11 = ((char *)v5 - (unsigned char *)*v4) >> 4;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = v8 - (void)*v4;
    if (v13 >> 3 > v12) {
      unint64_t v12 = v13 >> 3;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14) {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(v7, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = &v15[16 * v11];
    BOOL v17 = &v15[16 * v14];
    *(_OWORD *)uint64_t v16 = *a2;
    uint64_t v10 = v16 + 16;
    float v19 = (char *)*v4;
    uint64_t v18 = (char *)v4[1];
    if (v18 != *v4)
    {
      do
      {
        *((_OWORD *)v16 - 1) = *((_OWORD *)v18 - 1);
        v16 -= 16;
        v18 -= 16;
      }
      while (v18 != v19);
      uint64_t v18 = (char *)*v4;
    }
    _OWORD *v4 = v16;
    v4[1] = v10;
    v4[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    *uint64_t v5 = *a2;
    uint64_t v10 = v5 + 1;
  }
  v4[1] = v10;
  return a1;
}

uint64_t std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) >> 4;
    if (a2 - a1 >= 17)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = a1 + 16 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a4, v9, v12);
        v12 -= 16;
        --v11;
      }
      while (v11);
    }
    if (a2 == a3)
    {
      a3 = a2;
    }
    else
    {
      uint64_t v13 = a2;
      do
      {
        float v14 = *(float *)v13;
        if (*(float *)v13 == *(float *)a1) {
          int v15 = 0;
        }
        else {
          int v15 = -127;
        }
        if (*(float *)v13 > *(float *)a1) {
          int v15 = 1;
        }
        if (*(float *)v13 < *(float *)a1) {
          int v15 = -1;
        }
        if (v15
          || ((uint64_t v16 = *(void *)(v13 + 8), v17 = *(void *)(a1 + 8), v18 = v16 == v17, v16 < v17)
            ? (LOBYTE(v15) = -1)
            : (LOBYTE(v15) = 1),
              !v18))
        {
          if ((char)v15 >= 1)
          {
            *(_DWORD *)uint64_t v13 = *(_DWORD *)a1;
            *(float *)a1 = v14;
            uint64_t v19 = *(void *)(v13 + 8);
            *(void *)(v13 + 8) = *(void *)(a1 + 8);
            *(void *)(a1 + 8) = v19;
            std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a4, v9, a1);
          }
        }
        v13 += 16;
      }
      while (v13 != a3);
    }
    if (v8 >= 17)
    {
      uint64_t v20 = (unint64_t)v8 >> 4;
      uint64_t v21 = a2 - 16;
      do
      {
        float v22 = *(float *)a1;
        uint64_t v23 = *(void *)(a1 + 8);
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a4, v20);
        if (v21 == v24)
        {
          *(float *)uint64_t v24 = v22;
          *(void *)(v24 + 8) = v23;
        }
        else
        {
          *(_DWORD *)uint64_t v24 = *(_DWORD *)v21;
          *(void *)(v24 + 8) = *(void *)(v21 + 8);
          *(float *)uint64_t v21 = v22;
          *(void *)(v21 + 8) = v23;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, v24 + 16, a4, (v24 + 16 - a1) >> 4);
        }
        v21 -= 16;
      }
      while (v20-- > 2);
    }
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= (a4 - result) >> 4)
    {
      uint64_t v6 = v4 >> 3;
      uint64_t v7 = (v4 >> 3) | 1;
      uint64_t v8 = result + 16 * v7;
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        float v10 = *(float *)(v8 + 16);
        if (*(float *)v8 == v10) {
          int v11 = 0;
        }
        else {
          int v11 = -127;
        }
        if (*(float *)v8 > v10) {
          int v11 = 1;
        }
        if (*(float *)v8 < v10) {
          int v11 = -1;
        }
        if (v11
          || ((uint64_t v12 = *(void *)(result + 16 * v7 + 8), v13 = *(void *)(v8 + 24), v14 = v12 == v13, v12 < v13)
            ? (LOBYTE(v11) = -1)
            : (LOBYTE(v11) = 1),
              !v14))
        {
          if ((char)v11 > 0)
          {
            v8 += 16;
            uint64_t v7 = v9;
          }
        }
      }
      float v15 = *(float *)v8;
      float v16 = *(float *)a4;
      if (*(float *)v8 == *(float *)a4) {
        int v17 = 0;
      }
      else {
        int v17 = -127;
      }
      if (*(float *)v8 > *(float *)a4) {
        int v17 = 1;
      }
      if (*(float *)v8 < *(float *)a4) {
        int v18 = -1;
      }
      else {
        int v18 = v17;
      }
      if (v18
        || ((uint64_t v19 = *(void *)(v8 + 8), v20 = *(void *)(a4 + 8), v21 = v19 == v20, v19 < v20)
          ? (LOBYTE(v18) = -1)
          : (LOBYTE(v18) = 1),
            !v21))
      {
        if ((char)v18 > 0) {
          return result;
        }
        uint64_t v19 = *(void *)(a4 + 8);
      }
      do
      {
        uint64_t v22 = a4;
        a4 = v8;
        *(float *)uint64_t v22 = v15;
        *(void *)(v22 + 8) = *(void *)(v8 + 8);
        if (v5 < v7) {
          break;
        }
        uint64_t v23 = (2 * v7) | 1;
        uint64_t v8 = result + 16 * v23;
        uint64_t v24 = 2 * v7 + 2;
        if (v24 >= a3)
        {
          uint64_t v7 = (2 * v7) | 1;
        }
        else
        {
          float v25 = *(float *)(v8 + 16);
          if (*(float *)v8 == v25) {
            int v26 = 0;
          }
          else {
            int v26 = -127;
          }
          if (*(float *)v8 > v25) {
            int v26 = 1;
          }
          if (*(float *)v8 < v25) {
            int v27 = -1;
          }
          else {
            int v27 = v26;
          }
          if (v27
            || ((uint64_t v28 = *(void *)(result + 16 * v23 + 8),
                 uint64_t v29 = *(void *)(v8 + 24),
                 uint64_t v7 = v23,
                 BOOL v30 = v28 == v29,
                 v28 < v29)
              ? (LOBYTE(v27) = -1)
              : (LOBYTE(v27) = 1),
                !v30))
          {
            if ((char)v27 <= 0)
            {
              uint64_t v7 = v23;
            }
            else
            {
              v8 += 16;
              uint64_t v7 = v24;
            }
          }
        }
        float v15 = *(float *)v8;
        if (*(float *)v8 == v16) {
          int v31 = 0;
        }
        else {
          int v31 = -127;
        }
        if (*(float *)v8 > v16) {
          int v31 = 1;
        }
        if (*(float *)v8 < v16) {
          int v31 = -1;
        }
        if (!v31)
        {
          uint64_t v32 = *(void *)(v8 + 8);
          BOOL v33 = v32 == v19;
          if (v32 < v19) {
            LOBYTE(v31) = -1;
          }
          else {
            LOBYTE(v31) = 1;
          }
          if (v33) {
            LOBYTE(v31) = 0;
          }
        }
      }
      while ((char)v31 < 1);
      *(float *)a4 = v16;
      *(void *)(a4 + 8) = v19;
    }
  }
  return result;
}

void *std::vector<float>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_25E37032C(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  float result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::vector<std::pair<float,long long>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::pair<float,long long>>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = a1[1];
    uint64_t v5 = v4 + 16 * a2;
    do
    {
      *(_DWORD *)uint64_t v4 = 0;
      *(void *)(v4 + 8) = 0;
      v4 += 16;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

void sub_25E3703E8(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<float,long long>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  float result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,false>(uint64_t result, float *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10 = result;
LABEL_2:
  uint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    uint64_t v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (uint64_t)a2 - v11;
    unint64_t v15 = ((uint64_t)a2 - v11) >> 4;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          float v28 = *(a2 - 4);
          float v29 = *(float *)v11;
          if (v28 == *(float *)v11) {
            int v30 = 0;
          }
          else {
            int v30 = -127;
          }
          if (v28 > *(float *)v11) {
            int v30 = 1;
          }
          if (v28 < *(float *)v11) {
            int v30 = -1;
          }
          if (v30
            || ((uint64_t v31 = *((void *)a2 - 1), v32 = *(void *)(v11 + 8), v33 = v31 == v32, v31 < v32)
              ? (LOBYTE(v30) = -1)
              : (LOBYTE(v30) = 1),
                !v33))
          {
            if ((char)v30 >= 1)
            {
              *(float *)uint64_t v11 = v28;
              *(a2 - 4) = v29;
              uint64_t v34 = *(void *)(v11 + 8);
              *(void *)(v11 + 8) = *((void *)a2 - 1);
              *((void *)a2 - 1) = v34;
            }
          }
          break;
        case 3uLL:
          float result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v11, v11 + 16, (uint64_t)(a2 - 4));
          break;
        case 4uLL:
          float result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v11, v11 + 16, v11 + 32, (uint64_t)(a2 - 4));
          break;
        case 5uLL:
          float result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v11, v11 + 16, v11 + 32, v11 + 48, (uint64_t)(a2 - 4));
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 383) {
      break;
    }
    if (v13 == 1)
    {
      if ((float *)v11 != a2)
      {
        return std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,std::pair<float,long long>*>(v11, (uint64_t)a2, (uint64_t)a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = v11 + 16 * (v15 >> 1);
    if ((unint64_t)v14 >= 0x801)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v11, v11 + 16 * (v15 >> 1), (uint64_t)(a2 - 4));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v11 + 16, v17 - 16, (uint64_t)(a2 - 8));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v11 + 32, v11 + 16 + 16 * v16, (uint64_t)(a2 - 12));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v17 - 16, v17, v11 + 16 + 16 * v16);
      float v18 = *(float *)v11;
      *(_DWORD *)uint64_t v11 = *(_DWORD *)v17;
      *(float *)uint64_t v17 = v18;
      uint64_t v19 = *(void *)(v11 + 8);
      *(void *)(v11 + 8) = *(void *)(v17 + 8);
      *(void *)(v17 + 8) = v19;
      if (a5) {
        goto LABEL_26;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v11 + 16 * (v15 >> 1), v11, (uint64_t)(a2 - 4));
      if (a5) {
        goto LABEL_26;
      }
    }
    float v20 = *(float *)(v11 - 16);
    if (v20 == *(float *)v11) {
      int v21 = 0;
    }
    else {
      int v21 = -127;
    }
    if (v20 > *(float *)v11) {
      int v21 = 1;
    }
    if (v20 < *(float *)v11) {
      int v21 = -1;
    }
    if (!v21
      && ((uint64_t v22 = *(void *)(v11 - 8), v23 = *(void *)(v11 + 8), v24 = v22 == v23, v22 < v23)
        ? (LOBYTE(v21) = -1)
        : (LOBYTE(v21) = 1),
          v24)
      || (char)v21 <= 0)
    {
      float result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,long long> *,std::greater<std::pair<float,long long>> &>(v11, a2);
      uint64_t v11 = result;
      goto LABEL_31;
    }
LABEL_26:
    unint64_t v25 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,long long> *,std::greater<std::pair<float,long long>> &>(v11, a2);
    if ((v26 & 1) == 0) {
      goto LABEL_29;
    }
    BOOL v27 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v11, v25);
    uint64_t v11 = v25 + 16;
    float result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v25 + 16, (uint64_t)a2);
    if (result)
    {
      a4 = -v13;
      a2 = (float *)v25;
      if (v27) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v27)
    {
LABEL_29:
      float result = std::__introsort<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,false>(v10, v25, a3, -v13, a5 & 1);
      uint64_t v11 = v25 + 16;
LABEL_31:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v11, (uint64_t)a2);
  }
  else
  {
    return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v11, (uint64_t)a2);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 16;
    if (result + 16 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      do
      {
        uint64_t v5 = v4;
        uint64_t v4 = v2;
        float v6 = *(float *)(v5 + 16);
        float v7 = *(float *)v5;
        if (v6 == *(float *)v5) {
          int v8 = 0;
        }
        else {
          int v8 = -127;
        }
        if (v6 > *(float *)v5) {
          int v8 = 1;
        }
        if (v6 < *(float *)v5) {
          int v8 = -1;
        }
        if (v8
          || ((v9 = *(void *)(v5 + 24), uint64_t v10 = *(void *)(v5 + 8), v11 = v9 == v10, v9 < v10)
            ? (LOBYTE(v8) = -1)
            : (LOBYTE(v8) = 1),
              !v11))
        {
          if ((char)v8 >= 1)
          {
            uint64_t v12 = *(void *)(v5 + 24);
            uint64_t v13 = v3;
            while (1)
            {
              uint64_t v14 = v5;
              uint64_t v15 = result + v13;
              *(float *)(v15 + 16) = v7;
              *(void *)(v15 + 24) = *(void *)(result + v13 + 8);
              if (!v13)
              {
                uint64_t v14 = result;
                goto LABEL_36;
              }
              float v7 = *(float *)(v15 - 16);
              if (v6 == v7) {
                int v16 = 0;
              }
              else {
                int v16 = -127;
              }
              if (v6 > v7) {
                int v16 = 1;
              }
              int v17 = v6 < v7 ? -1 : v16;
              if (!v17)
              {
                uint64_t v18 = *(void *)(result + v13 - 8);
                BOOL v19 = v12 == v18;
                LOBYTE(v17) = v12 < v18 ? -1 : 1;
                if (v19) {
                  break;
                }
              }
              uint64_t v5 = v14 - 16;
              v13 -= 16;
              if ((char)v17 <= 0) {
                goto LABEL_36;
              }
            }
            uint64_t v14 = result + v13;
LABEL_36:
            *(float *)uint64_t v14 = v6;
            *(void *)(v14 + 8) = v12;
          }
        }
        uint64_t v2 = v4 + 16;
        v3 += 16;
      }
      while (v4 + 16 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 16;
    if (result + 16 != a2)
    {
      uint64_t v3 = (float *)(result + 8);
      do
      {
        uint64_t v4 = result;
        float result = v2;
        float v5 = *(float *)(v4 + 16);
        float v6 = *(float *)v4;
        if (v5 == *(float *)v4) {
          int v7 = 0;
        }
        else {
          int v7 = -127;
        }
        if (v5 > *(float *)v4) {
          int v7 = 1;
        }
        if (v5 < *(float *)v4) {
          int v7 = -1;
        }
        if (v7
          || ((v8 = *(void *)(v4 + 24), v9 = *(void *)(v4 + 8), BOOL v10 = v8 == v9, v8 < v9)
            ? (LOBYTE(v7) = -1)
            : (LOBYTE(v7) = 1),
              !v10))
        {
          if ((char)v7 >= 1)
          {
            uint64_t v11 = *(void *)(v4 + 24);
            uint64_t v12 = v3;
            do
            {
              uint64_t v13 = v12;
              v12[2] = v6;
              *((void *)v12 + 2) = *(void *)v12;
              float v6 = *(v12 - 6);
              if (v5 == v6) {
                int v14 = 0;
              }
              else {
                int v14 = -127;
              }
              if (v5 > v6) {
                int v14 = 1;
              }
              if (v5 < v6) {
                int v14 = -1;
              }
              if (!v14)
              {
                uint64_t v15 = *((void *)v13 - 2);
                BOOL v16 = v11 == v15;
                LOBYTE(v14) = v11 < v15 ? -1 : 1;
                if (v16) {
                  break;
                }
              }
              int v17 = (char)v14;
              uint64_t v12 = v13 - 4;
            }
            while (v17 > 0);
            *(v13 - 2) = v5;
            *(void *)uint64_t v13 = v11;
          }
        }
        uint64_t v2 = result + 16;
        v3 += 4;
      }
      while (result + 16 != a2);
    }
  }
  return result;
}

float *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,long long> *,std::greater<std::pair<float,long long>> &>(uint64_t a1, float *a2)
{
  float v2 = *(float *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  float v4 = *(a2 - 4);
  if (*(float *)a1 == v4) {
    int v5 = 0;
  }
  else {
    int v5 = -127;
  }
  if (*(float *)a1 > v4) {
    int v5 = 1;
  }
  if (*(float *)a1 < v4) {
    int v5 = -1;
  }
  if (!v5 && ((v6 = *((void *)a2 - 1), BOOL v7 = v3 == v6, v3 < v6) ? (LOBYTE(v5) = -1) : (LOBYTE(v5) = 1), v7)
    || (char)v5 < 1)
  {
    int v17 = (float *)(a1 + 16);
    do
    {
      uint64_t v9 = v17;
      if (v17 >= a2) {
        break;
      }
      if (v2 == *v17) {
        int v18 = 0;
      }
      else {
        int v18 = -127;
      }
      if (v2 > *v9) {
        int v18 = 1;
      }
      if (v2 < *v9) {
        int v18 = -1;
      }
      if (!v18)
      {
        uint64_t v19 = *((void *)v9 + 1);
        BOOL v20 = v3 == v19;
        LOBYTE(v18) = v3 < v19 ? -1 : 1;
        if (v20) {
          LOBYTE(v18) = 0;
        }
      }
      int v21 = (char)v18;
      int v17 = v9 + 4;
    }
    while (v21 < 1);
  }
  else
  {
    uint64_t v8 = (float *)a1;
    uint64_t v9 = (float *)a1;
    do
    {
      float v10 = v9[4];
      v9 += 4;
      BOOL v11 = v2 < v10;
      BOOL v12 = v2 <= v10;
      if (v2 == v10) {
        int v13 = 0;
      }
      else {
        int v13 = -127;
      }
      if (!v12) {
        int v13 = 1;
      }
      if (v11) {
        int v13 = -1;
      }
      if (!v13)
      {
        uint64_t v14 = *((void *)v8 + 3);
        BOOL v15 = v3 == v14;
        if (v3 < v14) {
          char v16 = -1;
        }
        else {
          char v16 = 1;
        }
        if (v15) {
          LOBYTE(v13) = 0;
        }
        else {
          LOBYTE(v13) = v16;
        }
      }
      uint64_t v8 = v9;
    }
    while ((char)v13 <= 0);
  }
  if (v9 < a2)
  {
    uint64_t v22 = a2 - 4;
    do
    {
      a2 = v22;
      BOOL v23 = v2 < *v22;
      BOOL v24 = v2 <= *v22;
      if (v2 == *v22) {
        int v25 = 0;
      }
      else {
        int v25 = -127;
      }
      if (!v24) {
        int v25 = 1;
      }
      if (v23) {
        int v25 = -1;
      }
      if (!v25)
      {
        uint64_t v26 = *((void *)a2 + 1);
        BOOL v27 = v3 == v26;
        LOBYTE(v25) = v3 < v26 ? -1 : 1;
        if (v27) {
          break;
        }
      }
      int v28 = (char)v25;
      uint64_t v22 = a2 - 4;
    }
    while (v28 > 0);
  }
  if (v9 < a2)
  {
    float v29 = *v9;
    float v30 = *a2;
    do
    {
      float *v9 = v30;
      *a2 = v29;
      uint64_t v31 = *((void *)v9 + 1);
      *((void *)v9 + 1) = *((void *)a2 + 1);
      *((void *)a2 + 1) = v31;
      uint64_t v32 = v9;
      do
      {
        float v33 = v9[4];
        v9 += 4;
        float v29 = v33;
        BOOL v34 = v2 < v33;
        BOOL v35 = v2 <= v33;
        if (v2 == v33) {
          int v36 = 0;
        }
        else {
          int v36 = -127;
        }
        if (!v35) {
          int v36 = 1;
        }
        if (v34) {
          int v36 = -1;
        }
        if (!v36)
        {
          uint64_t v37 = *((void *)v32 + 3);
          BOOL v38 = v3 == v37;
          if (v3 < v37) {
            char v39 = -1;
          }
          else {
            char v39 = 1;
          }
          if (v38) {
            LOBYTE(v36) = 0;
          }
          else {
            LOBYTE(v36) = v39;
          }
        }
        uint64_t v32 = v9;
      }
      while ((char)v36 < 1);
      uint64_t v40 = a2 - 4;
      do
      {
        a2 = v40;
        float v30 = *v40;
        BOOL v41 = v2 < *v40;
        BOOL v42 = v2 <= *v40;
        if (v2 == *v40) {
          int v43 = 0;
        }
        else {
          int v43 = -127;
        }
        if (!v42) {
          int v43 = 1;
        }
        if (v41) {
          int v43 = -1;
        }
        if (!v43)
        {
          uint64_t v44 = *((void *)a2 + 1);
          BOOL v45 = v3 == v44;
          LOBYTE(v43) = v3 < v44 ? -1 : 1;
          if (v45) {
            break;
          }
        }
        int v46 = (char)v43;
        uint64_t v40 = a2 - 4;
      }
      while (v46 > 0);
    }
    while (v9 < a2);
  }
  if (v9 - 4 != (float *)a1)
  {
    *(float *)a1 = *(v9 - 4);
    *(void *)(a1 + 8) = *((void *)v9 - 1);
  }
  *(v9 - 4) = v2;
  *((void *)v9 - 1) = v3;
  return v9;
}

unint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,long long> *,std::greater<std::pair<float,long long>> &>(uint64_t a1, float *a2)
{
  uint64_t v2 = 0;
  float v3 = *(float *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  do
  {
    uint64_t v5 = v2;
    uint64_t v6 = a1 + v2;
    float v7 = *(float *)(v6 + 16);
    if (v7 == v3) {
      int v8 = 0;
    }
    else {
      int v8 = -127;
    }
    if (v7 > v3) {
      int v8 = 1;
    }
    if (v7 < v3) {
      int v8 = -1;
    }
    if (!v8)
    {
      uint64_t v9 = *(void *)(v6 + 24);
      LOBYTE(v8) = v9 < v4 ? -1 : 1;
      if (v9 == v4) {
        break;
      }
    }
    uint64_t v2 = v5 + 16;
  }
  while ((char)v8 > 0);
  unint64_t v10 = a1 + v5 + 16;
  if (v5)
  {
    BOOL v11 = a2;
    do
    {
      float v12 = *(v11 - 4);
      v11 -= 4;
      BOOL v13 = v12 < v3;
      BOOL v14 = v12 <= v3;
      if (v12 == v3) {
        int v15 = 0;
      }
      else {
        int v15 = -127;
      }
      if (!v14) {
        int v15 = 1;
      }
      if (v13) {
        int v15 = -1;
      }
      if (!v15)
      {
        uint64_t v16 = *((void *)a2 - 1);
        BOOL v17 = v16 == v4;
        LOBYTE(v15) = v16 < v4 ? -1 : 1;
        if (v17) {
          LOBYTE(v15) = 0;
        }
      }
      a2 = v11;
    }
    while ((char)v15 < 1);
  }
  else
  {
    while (v10 < (unint64_t)a2)
    {
      BOOL v11 = a2 - 4;
      float v18 = *(a2 - 4);
      if (v18 == v3) {
        int v19 = 0;
      }
      else {
        int v19 = -127;
      }
      if (v18 > v3) {
        int v19 = 1;
      }
      if (v18 < v3) {
        int v19 = -1;
      }
      if (!v19)
      {
        uint64_t v20 = *((void *)a2 - 1);
        BOOL v21 = v20 == v4;
        LOBYTE(v19) = v20 < v4 ? -1 : 1;
        if (v21) {
          LOBYTE(v19) = 0;
        }
      }
      a2 -= 4;
      if ((char)v19 > 0) {
        goto LABEL_49;
      }
    }
    BOOL v11 = a2;
  }
LABEL_49:
  if (v10 >= (unint64_t)v11)
  {
    unint64_t v24 = v10;
  }
  else
  {
    float v22 = *v11;
    BOOL v23 = v11;
    unint64_t v24 = v10;
    do
    {
      *(float *)unint64_t v24 = v22;
      float *v23 = v7;
      uint64_t v25 = *(void *)(v24 + 8);
      *(void *)(v24 + 8) = *((void *)v23 + 1);
      *((void *)v23 + 1) = v25;
      uint64_t v26 = (float *)(v24 + 16);
      do
      {
        unint64_t v24 = (unint64_t)v26;
        float v7 = *v26;
        BOOL v27 = *v26 < v3;
        BOOL v28 = *v26 <= v3;
        if (*v26 == v3) {
          int v29 = 0;
        }
        else {
          int v29 = -127;
        }
        if (!v28) {
          int v29 = 1;
        }
        if (v27) {
          int v29 = -1;
        }
        if (!v29)
        {
          uint64_t v30 = *(void *)(v24 + 8);
          BOOL v31 = v30 == v4;
          LOBYTE(v29) = v30 < v4 ? -1 : 1;
          if (v31) {
            break;
          }
        }
        int v32 = (char)v29;
        uint64_t v26 = (float *)(v24 + 16);
      }
      while (v32 > 0);
      float v33 = v23;
      do
      {
        float v34 = *(v33 - 4);
        v33 -= 4;
        float v22 = v34;
        BOOL v35 = v34 < v3;
        BOOL v36 = v34 <= v3;
        if (v34 == v3) {
          int v37 = 0;
        }
        else {
          int v37 = -127;
        }
        if (!v36) {
          int v37 = 1;
        }
        if (v35) {
          int v37 = -1;
        }
        if (!v37)
        {
          uint64_t v38 = *((void *)v23 - 1);
          BOOL v39 = v38 == v4;
          if (v38 < v4) {
            char v40 = -1;
          }
          else {
            char v40 = 1;
          }
          if (v39) {
            LOBYTE(v37) = 0;
          }
          else {
            LOBYTE(v37) = v40;
          }
        }
        BOOL v23 = v33;
      }
      while ((char)v37 < 1);
      BOOL v23 = v33;
    }
    while (v24 < (unint64_t)v33);
  }
  if (v24 - 16 != a1)
  {
    *(_DWORD *)a1 = *(_DWORD *)(v24 - 16);
    *(void *)(a1 + 8) = *(void *)(v24 - 8);
  }
  *(float *)(v24 - 16) = v3;
  *(void *)(v24 - 8) = v4;
  return v24 - 16;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 4;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      float v6 = *(float *)(a2 - 16);
      float v7 = *(float *)a1;
      if (v6 == *(float *)a1) {
        int v8 = 0;
      }
      else {
        int v8 = -127;
      }
      if (v6 > *(float *)a1) {
        int v8 = 1;
      }
      if (v6 < *(float *)a1) {
        int v8 = -1;
      }
      if (v8
        || ((v9 = *(void *)(a2 - 8), uint64_t v10 = *(void *)(a1 + 8), v11 = v9 == v10, v9 < v10)
          ? (LOBYTE(v8) = -1)
          : (LOBYTE(v8) = 1),
            !v11))
      {
        if ((char)v8 >= 1)
        {
          *(float *)a1 = v6;
          *(float *)(a2 - 16) = v7;
          uint64_t v12 = *(void *)(a1 + 8);
          *(void *)(a1 + 8) = *(void *)(a2 - 8);
          *(void *)(a2 - 8) = v12;
        }
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a1 + 16, a2 - 16);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a1 + 16, a1 + 32, a2 - 16);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a1 + 16, a1 + 32, a1 + 48, a2 - 16);
      return 1;
    default:
      uint64_t v13 = a1 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a1 + 16, a1 + 32);
      uint64_t v14 = a1 + 48;
      if (a1 + 48 == a2) {
        return 1;
      }
      uint64_t v15 = 0;
      int v16 = 0;
      break;
  }
  while (1)
  {
    float v17 = *(float *)v14;
    float v18 = *(float *)v13;
    if (*(float *)v14 == *(float *)v13) {
      int v19 = 0;
    }
    else {
      int v19 = -127;
    }
    if (*(float *)v14 > *(float *)v13) {
      int v19 = 1;
    }
    if (*(float *)v14 < *(float *)v13) {
      int v19 = -1;
    }
    if (v19
      || ((v20 = *(void *)(v14 + 8), uint64_t v21 = *(void *)(v13 + 8), v22 = v20 == v21, v20 < v21)
        ? (LOBYTE(v19) = -1)
        : (LOBYTE(v19) = 1),
          !v22))
    {
      if ((char)v19 >= 1)
      {
        uint64_t v23 = *(void *)(v14 + 8);
        uint64_t v24 = v15;
        while (1)
        {
          uint64_t v25 = a1 + v24;
          *(float *)(v25 + 48) = v18;
          *(void *)(v25 + 56) = *(void *)(a1 + v24 + 40);
          if (v24 == -32)
          {
            uint64_t v26 = a1;
            goto LABEL_49;
          }
          uint64_t v26 = v13;
          float v18 = *(float *)(v25 + 16);
          if (v17 == v18) {
            int v27 = 0;
          }
          else {
            int v27 = -127;
          }
          if (v17 > v18) {
            int v27 = 1;
          }
          if (v17 < v18) {
            int v27 = -1;
          }
          if (!v27)
          {
            uint64_t v28 = *(void *)(a1 + v24 + 24);
            BOOL v29 = v23 == v28;
            LOBYTE(v27) = v23 < v28 ? -1 : 1;
            if (v29) {
              break;
            }
          }
          v13 -= 16;
          v24 -= 16;
          if ((char)v27 <= 0) {
            goto LABEL_49;
          }
        }
        uint64_t v26 = a1 + v24 + 32;
LABEL_49:
        *(float *)uint64_t v26 = v17;
        *(void *)(v26 + 8) = v23;
        if (++v16 == 8) {
          return v14 + 16 == a2;
        }
      }
    }
    uint64_t v13 = v14;
    v15 += 16;
    v14 += 16;
    if (v14 == a2) {
      return 1;
    }
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a2, a3);
  float v9 = *(float *)a3;
  if (*(float *)a4 == *(float *)a3) {
    int v10 = 0;
  }
  else {
    int v10 = -127;
  }
  if (*(float *)a4 > *(float *)a3) {
    int v10 = 1;
  }
  if (*(float *)a4 < *(float *)a3) {
    int v10 = -1;
  }
  if (v10
    || ((uint64_t v11 = *(void *)(a4 + 8), v12 = *(void *)(a3 + 8), v13 = v11 == v12, v11 < v12)
      ? (LOBYTE(v10) = -1)
      : (LOBYTE(v10) = 1),
        !v13))
  {
    if ((char)v10 >= 1)
    {
      *(_DWORD *)a3 = *(_DWORD *)a4;
      *(float *)a4 = v9;
      uint64_t v14 = *(void *)(a3 + 8);
      *(void *)(a3 + 8) = *(void *)(a4 + 8);
      *(void *)(a4 + 8) = v14;
      float v15 = *(float *)a2;
      if (*(float *)a3 == *(float *)a2) {
        int v16 = 0;
      }
      else {
        int v16 = -127;
      }
      if (*(float *)a3 > *(float *)a2) {
        int v16 = 1;
      }
      if (*(float *)a3 < *(float *)a2) {
        int v16 = -1;
      }
      if (v16
        || ((uint64_t v17 = *(void *)(a3 + 8), v18 = *(void *)(a2 + 8), v19 = v17 == v18, v17 < v18)
          ? (LOBYTE(v16) = -1)
          : (LOBYTE(v16) = 1),
            !v19))
      {
        if ((char)v16 >= 1)
        {
          *(_DWORD *)a2 = *(_DWORD *)a3;
          *(float *)a3 = v15;
          uint64_t v20 = *(void *)(a2 + 8);
          *(void *)(a2 + 8) = *(void *)(a3 + 8);
          *(void *)(a3 + 8) = v20;
          float v21 = *(float *)a1;
          if (*(float *)a2 == *(float *)a1) {
            int v22 = 0;
          }
          else {
            int v22 = -127;
          }
          if (*(float *)a2 > *(float *)a1) {
            int v22 = 1;
          }
          if (*(float *)a2 < *(float *)a1) {
            int v22 = -1;
          }
          if (v22
            || ((v23 = *(void *)(a2 + 8), v24 = *(void *)(a1 + 8), BOOL v25 = v23 == v24, v23 < v24)
              ? (LOBYTE(v22) = -1)
              : (LOBYTE(v22) = 1),
                !v25))
          {
            if ((char)v22 >= 1)
            {
              *(_DWORD *)a1 = *(_DWORD *)a2;
              *(float *)a2 = v21;
              uint64_t v26 = *(void *)(a1 + 8);
              *(void *)(a1 + 8) = *(void *)(a2 + 8);
              *(void *)(a2 + 8) = v26;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a2, a3, a4);
  float v11 = *(float *)a4;
  if (*(float *)a5 == *(float *)a4) {
    int v12 = 0;
  }
  else {
    int v12 = -127;
  }
  if (*(float *)a5 > *(float *)a4) {
    int v12 = 1;
  }
  if (*(float *)a5 < *(float *)a4) {
    int v12 = -1;
  }
  if (v12
    || ((uint64_t v13 = *(void *)(a5 + 8), v14 = *(void *)(a4 + 8), v15 = v13 == v14, v13 < v14)
      ? (LOBYTE(v12) = -1)
      : (LOBYTE(v12) = 1),
        !v15))
  {
    if ((char)v12 >= 1)
    {
      *(_DWORD *)a4 = *(_DWORD *)a5;
      *(float *)a5 = v11;
      uint64_t v16 = *(void *)(a4 + 8);
      *(void *)(a4 + 8) = *(void *)(a5 + 8);
      *(void *)(a5 + 8) = v16;
      float v17 = *(float *)a3;
      if (*(float *)a4 == *(float *)a3) {
        int v18 = 0;
      }
      else {
        int v18 = -127;
      }
      if (*(float *)a4 > *(float *)a3) {
        int v18 = 1;
      }
      if (*(float *)a4 < *(float *)a3) {
        int v18 = -1;
      }
      if (v18
        || ((uint64_t v19 = *(void *)(a4 + 8), v20 = *(void *)(a3 + 8), v21 = v19 == v20, v19 < v20)
          ? (LOBYTE(v18) = -1)
          : (LOBYTE(v18) = 1),
            !v21))
      {
        if ((char)v18 >= 1)
        {
          *(_DWORD *)a3 = *(_DWORD *)a4;
          *(float *)a4 = v17;
          uint64_t v22 = *(void *)(a3 + 8);
          *(void *)(a3 + 8) = *(void *)(a4 + 8);
          *(void *)(a4 + 8) = v22;
          float v23 = *(float *)a2;
          if (*(float *)a3 == *(float *)a2) {
            int v24 = 0;
          }
          else {
            int v24 = -127;
          }
          if (*(float *)a3 > *(float *)a2) {
            int v24 = 1;
          }
          if (*(float *)a3 < *(float *)a2) {
            int v24 = -1;
          }
          if (v24
            || ((uint64_t v25 = *(void *)(a3 + 8), v26 = *(void *)(a2 + 8), v27 = v25 == v26, v25 < v26)
              ? (LOBYTE(v24) = -1)
              : (LOBYTE(v24) = 1),
                !v27))
          {
            if ((char)v24 >= 1)
            {
              *(_DWORD *)a2 = *(_DWORD *)a3;
              *(float *)a3 = v23;
              uint64_t v28 = *(void *)(a2 + 8);
              *(void *)(a2 + 8) = *(void *)(a3 + 8);
              *(void *)(a3 + 8) = v28;
              float v29 = *(float *)a1;
              if (*(float *)a2 == *(float *)a1) {
                int v30 = 0;
              }
              else {
                int v30 = -127;
              }
              if (*(float *)a2 > *(float *)a1) {
                int v30 = 1;
              }
              if (*(float *)a2 < *(float *)a1) {
                int v30 = -1;
              }
              if (v30
                || ((uint64_t v31 = *(void *)(a2 + 8), v32 = *(void *)(a1 + 8), v33 = v31 == v32, v31 < v32)
                  ? (LOBYTE(v30) = -1)
                  : (LOBYTE(v30) = 1),
                    !v33))
              {
                if ((char)v30 >= 1)
                {
                  *(_DWORD *)a1 = *(_DWORD *)a2;
                  *(float *)a2 = v29;
                  uint64_t v34 = *(void *)(a1 + 8);
                  *(void *)(a1 + 8) = *(void *)(a2 + 8);
                  *(void *)(a2 + 8) = v34;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,std::pair<float,long long>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) >> 4;
    if (a2 - a1 >= 17)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = a1 + 16 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a4, v9, v12);
        v12 -= 16;
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = a2;
    if (a2 != a3)
    {
      uint64_t v14 = a2;
      do
      {
        float v15 = *(float *)v14;
        if (*(float *)v14 == *(float *)a1) {
          int v16 = 0;
        }
        else {
          int v16 = -127;
        }
        if (*(float *)v14 > *(float *)a1) {
          int v16 = 1;
        }
        if (*(float *)v14 < *(float *)a1) {
          int v16 = -1;
        }
        if (v16
          || ((uint64_t v17 = *(void *)(v14 + 8), v18 = *(void *)(a1 + 8), v19 = v17 == v18, v17 < v18)
            ? (LOBYTE(v16) = -1)
            : (LOBYTE(v16) = 1),
              !v19))
        {
          if ((char)v16 >= 1)
          {
            *(_DWORD *)uint64_t v14 = *(_DWORD *)a1;
            *(float *)a1 = v15;
            uint64_t v20 = *(void *)(v14 + 8);
            *(void *)(v14 + 8) = *(void *)(a1 + 8);
            *(void *)(a1 + 8) = v20;
            std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a4, v9, a1);
          }
        }
        v14 += 16;
      }
      while (v14 != a3);
      uint64_t v13 = a3;
    }
    if (v8 >= 17)
    {
      uint64_t v21 = (unint64_t)v8 >> 4;
      uint64_t v22 = a2 - 16;
      do
      {
        float v23 = *(float *)a1;
        uint64_t v24 = *(void *)(a1 + 8);
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a4, v21);
        if (v22 == v25)
        {
          *(float *)uint64_t v25 = v23;
          *(void *)(v25 + 8) = v24;
        }
        else
        {
          *(_DWORD *)uint64_t v25 = *(_DWORD *)v22;
          *(void *)(v25 + 8) = *(void *)(v22 + 8);
          *(float *)uint64_t v22 = v23;
          *(void *)(v22 + 8) = v24;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, v25 + 16, a4, (v25 + 16 - a1) >> 4);
        }
        v22 -= 16;
      }
      while (v21-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= (a4 - result) >> 4)
    {
      uint64_t v6 = v4 >> 3;
      uint64_t v7 = (v4 >> 3) + 1;
      uint64_t v8 = result + 16 * v7;
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        float v10 = *(float *)(v8 + 16);
        if (*(float *)v8 == v10) {
          int v11 = 0;
        }
        else {
          int v11 = -127;
        }
        if (*(float *)v8 > v10) {
          int v11 = 1;
        }
        if (*(float *)v8 < v10) {
          int v11 = -1;
        }
        if (v11
          || ((uint64_t v12 = *(void *)(result + 16 * v7 + 8), v13 = *(void *)(v8 + 24), v14 = v12 == v13, v12 < v13)
            ? (LOBYTE(v11) = -1)
            : (LOBYTE(v11) = 1),
              !v14))
        {
          if ((char)v11 > 0)
          {
            v8 += 16;
            uint64_t v7 = v9;
          }
        }
      }
      float v15 = *(float *)v8;
      float v16 = *(float *)a4;
      if (*(float *)v8 == *(float *)a4) {
        int v17 = 0;
      }
      else {
        int v17 = -127;
      }
      if (*(float *)v8 > *(float *)a4) {
        int v17 = 1;
      }
      if (*(float *)v8 < *(float *)a4) {
        int v18 = -1;
      }
      else {
        int v18 = v17;
      }
      if (v18
        || ((uint64_t v19 = *(void *)(v8 + 8), v20 = *(void *)(a4 + 8), v21 = v19 == v20, v19 < v20)
          ? (LOBYTE(v18) = -1)
          : (LOBYTE(v18) = 1),
            !v21))
      {
        if ((char)v18 > 0) {
          return result;
        }
        uint64_t v19 = *(void *)(a4 + 8);
      }
      do
      {
        uint64_t v22 = v8;
        *(float *)a4 = v15;
        *(void *)(a4 + 8) = *(void *)(v8 + 8);
        if (v5 < v7) {
          break;
        }
        uint64_t v23 = (2 * v7) | 1;
        uint64_t v8 = result + 16 * v23;
        uint64_t v24 = 2 * v7 + 2;
        if (v24 >= a3)
        {
          uint64_t v7 = (2 * v7) | 1;
        }
        else
        {
          float v25 = *(float *)(v8 + 16);
          if (*(float *)v8 == v25) {
            int v26 = 0;
          }
          else {
            int v26 = -127;
          }
          if (*(float *)v8 > v25) {
            int v26 = 1;
          }
          if (*(float *)v8 < v25) {
            int v27 = -1;
          }
          else {
            int v27 = v26;
          }
          if (v27
            || ((uint64_t v28 = *(void *)(result + 16 * v23 + 8),
                 uint64_t v29 = *(void *)(v8 + 24),
                 uint64_t v7 = v23,
                 BOOL v30 = v28 == v29,
                 v28 < v29)
              ? (LOBYTE(v27) = -1)
              : (LOBYTE(v27) = 1),
                !v30))
          {
            if ((char)v27 <= 0)
            {
              uint64_t v7 = v23;
            }
            else
            {
              v8 += 16;
              uint64_t v7 = v24;
            }
          }
        }
        float v15 = *(float *)v8;
        if (*(float *)v8 == v16) {
          int v31 = 0;
        }
        else {
          int v31 = -127;
        }
        if (*(float *)v8 > v16) {
          int v31 = 1;
        }
        if (*(float *)v8 < v16) {
          int v31 = -1;
        }
        if (!v31)
        {
          uint64_t v32 = *(void *)(v8 + 8);
          BOOL v33 = v32 == v19;
          if (v32 < v19) {
            LOBYTE(v31) = -1;
          }
          else {
            LOBYTE(v31) = 1;
          }
          if (v33) {
            LOBYTE(v31) = 0;
          }
        }
        a4 = v22;
      }
      while ((char)v31 < 1);
      *(float *)uint64_t v22 = v16;
      *(void *)(v22 + 8) = v19;
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyBufferFromStart<HashML::ModelContainer>(flatbuffers::Verifier *this, const char *a2, unint64_t a3)
{
  if (a2 && (*((void *)this + 1) < 8uLL || strncmp((const char *)(*(void *)this + a3 + 4), a2, 4uLL))) {
    return 0;
  }
  unsigned int v5 = flatbuffers::Verifier::VerifyOffset(this, a3);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (HashML::ModelContainer *)(*(void *)this + a3 + v5);
  return HashML::ModelContainer::Verify(v6, this);
}

uint64_t flatbuffers::Verifier::VerifyOffset(flatbuffers::Verifier *this, unint64_t a2)
{
  if ((a2 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v2 = *((void *)this + 1);
  if (v2 < 5 || v2 - 4 < a2) {
    return 0;
  }
  uint64_t v4 = *(unsigned int *)(*(void *)this + a2);
  if ((int)v4 < 1) {
    return 0;
  }
  if (v2 - 1 >= v4 + a2) {
    return v4;
  }
  return 0;
}

BOOL HashML::ModelContainer::Verify(HashML::ModelContainer *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    unsigned int v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5) {
      goto LABEL_18;
    }
    if (!v5[2]
      || (result = 0, unint64_t v7 = *((void *)a2 + 1), v7 >= 9) && v7 - 8 >= (unint64_t)this + v5[2] - *(void *)a2)
    {
      if (v6 < 7
        || (!v5[3]
         || (result = 0, unint64_t v8 = *((void *)a2 + 1), v8 >= 9)
         && v8 - 8 >= (unint64_t)this + v5[3] - *(void *)a2)
        && (v6 < 9
         || (!v5[4]
          || (result = 0, unint64_t v9 = *((void *)a2 + 1), v9 >= 9)
          && v9 - 8 >= (unint64_t)this + v5[4] - *(void *)a2)
         && (v6 < 0xB
          || (uint64_t v10 = v5[5]) == 0
          || (result = 0, unint64_t v11 = *((void *)a2 + 1), v11 >= 9)
          && v11 - 8 >= (unint64_t)this + v10 - *(void *)a2)))
      {
LABEL_18:
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
        if (result)
        {
          uint64_t v12 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v12 < 0xDu
            || (uint64_t v13 = v12[6]) == 0
            || (BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v13 + *(unsigned int *)((char *)this + v13), 1uLL, 0)))
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Table::VerifyOffset(flatbuffers::Table *this, const flatbuffers::Verifier *a2, unsigned int a3)
{
  float v3 = (unsigned __int16 *)((char *)this - *(int *)this);
  return *v3 <= a3
      || (uint64_t v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || flatbuffers::Verifier::VerifyOffset(a2, (unint64_t)this + v4 - *(void *)a2) != 0;
}

BOOL flatbuffers::Verifier::VerifyTableStart(flatbuffers::Verifier *this, const unsigned __int8 *a2)
{
  uint64_t v2 = *(void *)this;
  unint64_t v3 = (unint64_t)&a2[-*(void *)this];
  if ((v3 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v4 = *((void *)this + 1);
  BOOL v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *(int *)a2;
  unsigned int v7 = *((_DWORD *)this + 5);
  unsigned int v8 = *((_DWORD *)this + 4) + 1;
  *((_DWORD *)this + 4) = v8;
  unsigned int v9 = *((_DWORD *)this + 6) + 1;
  *((_DWORD *)this + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)this + 7)) {
    return 0;
  }
  unint64_t v10 = v3 - v6;
  if (v10)
  {
    uint64_t v11 = 0;
    if (*((unsigned char *)this + 40) || v4 - 2 < v10) {
      return v11;
    }
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  unint64_t v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  BOOL v5 = v4 >= v12;
  unint64_t v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL flatbuffers::Verifier::VerifyVectorOrString(flatbuffers::Verifier *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4)
{
  unint64_t v4 = (unint64_t)&a2[-*(void *)this];
  if ((v4 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v5 = *((void *)this + 1);
  if (v5 < 5 || v5 - 4 < v4) {
    return 0;
  }
  unint64_t v7 = *(unsigned int *)a2;
  if (0x7FFFFFFF / a3 <= v7) {
    return 0;
  }
  unint64_t v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    unint64_t v5 = *((void *)this + 1);
  }
  BOOL v9 = v5 > v8;
  unint64_t v10 = v5 - v8;
  return v9 && v10 >= v4;
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  unint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_25E371C3C(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x2611D4280](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2611D4280](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0;
  v13[1] = 0;
  MEMORY[0x2611D41E0](v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x2611D41F0](v13);
  return a1;
}

void sub_25E371EA8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x2611D41F0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x25E371E88);
}

void sub_25E371EFC(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v18 = 0;
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(v18) < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_25E372084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((unsigned char *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 88) = v3;
    }
    return *(void *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void reranker::MultiHeadAttention<float>::forward(int *a1, const float *a2, const float *a3, const float *a4, float *a5, const float *a6, const float *a7, const float *a8, float *a9, const float *a10, const float *a11, const float *a12, const float *a13)
{
  int v45 = a1[3];
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  int v44 = *a1;
  std::vector<float>::vector(&v73, a1[1] * (uint64_t)*a1);
  uint64_t v20 = v73;
  BOOL v70 = 0;
  BOOL v71 = 0;
  uint64_t v72 = 0;
  std::vector<float>::vector(&v70, (*a1 * *a1));
  BOOL v21 = v70;
  BOOL v67 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  std::vector<float>::vector(&v67, a1[2] * (uint64_t)*a1);
  uint64_t v22 = v67;
  int v23 = a1[1];
  int v64 = (void *)(*a1 | ((unint64_t)*a1 << 32));
  LODWORD(v65) = v23;
  reranker::Linear::forward((reranker::Linear *)&v64, a2, v20, a6, a7);
  int v24 = a1[2];
  int v64 = (void *)(*a1 | ((unint64_t)*a1 << 32));
  LODWORD(v65) = v24;
  reranker::Linear::forward((reranker::Linear *)&v64, a3, v21, a8, a9);
  int v25 = a1[2];
  int v64 = (void *)(*a1 | ((unint64_t)*a1 << 32));
  LODWORD(v65) = v25;
  reranker::Linear::forward((reranker::Linear *)&v64, a4, v22, a10, a11);
  int v64 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  std::vector<float>::vector(&v64, a1[1] * *a1 / a1[3]);
  int v26 = (float *)v64;
  uint64_t v61 = 0;
  float v62 = 0;
  uint64_t v63 = 0;
  std::vector<float>::vector(&v61, *a1 * *a1 / a1[3]);
  __B = (float *)v61;
  uint64_t v58 = 0;
  BOOL v59 = 0;
  uint64_t v60 = 0;
  std::vector<float>::vector(&v58, a1[2] * *a1 / a1[3]);
  uint64_t v28 = (float *)v58;
  float v55 = 0;
  int v56 = 0;
  uint64_t v57 = 0;
  std::vector<float>::vector(&v55, a1[2] * (uint64_t)a1[1]);
  __C = (float *)v55;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  std::vector<float>::vector(&v52, *a1 * a1[1] / a1[3]);
  BOOL v30 = (float *)v52;
  std::vector<int> __p = 0;
  int v50 = 0;
  uint64_t v51 = 0;
  std::vector<float>::vector(&__p, *a1 * (uint64_t)a1[1]);
  int v31 = a1[3];
  int v32 = a1[1];
  if (v31 >= 1)
  {
    uint64_t v33 = 0;
    float v34 = 1.0 / sqrt((float)v44 / (double)v45);
    do
    {
      cblas_scopy(v32 * *a1 / v31, &v73[v33], v31, v26, 1);
      cblas_scopy(a1[2] * *a1 / a1[3], &v70[v33], a1[3], __B, 1);
      cblas_scopy(a1[2] * *a1 / a1[3], &v67[v33], a1[3], v28, 1);
      cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasTrans, a1[1], a1[2], *a1 / a1[3], v34, v26, *a1 / a1[3], __B, *a1 / a1[3], 0.0, __C, a1[2]);
      unint64_t v47 = *(void *)(a1 + 1);
      Softmax::forward((Softmax *)&v47, __C);
      cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, a1[1], *a1 / a1[3], a1[2], 1.0, __C, a1[2], v28, *a1 / a1[3], 0.0, v30, *a1 / a1[3]);
      int v32 = a1[1];
      int v31 = a1[3];
      if (v32 >= 1)
      {
        int v35 = 0;
        int v36 = *a1;
        int v37 = *a1 / v31;
        uint64_t v38 = __p;
        int v39 = v37 * v33;
        do
        {
          if (v37 >= 1)
          {
            char v40 = &v30[v36 * v35 / v31];
            uint64_t v41 = (v36 / v31);
            int v42 = v39;
            do
            {
              int v43 = *(_DWORD *)v40++;
              v38[v42++] = v43;
              --v41;
            }
            while (v41);
          }
          ++v35;
          v39 += v36;
        }
        while (v35 != v32);
      }
      ++v33;
    }
    while (v33 < v31);
    int v32 = a1[1];
  }
  unint64_t v47 = *a1 | ((unint64_t)*a1 << 32);
  int v48 = v32;
  reranker::Linear::forward((reranker::Linear *)&v47, (const float *)__p, a5, a12, a13);
  if (__p)
  {
    int v50 = __p;
    operator delete(__p);
  }
  if (v52)
  {
    uint64_t v53 = v52;
    operator delete(v52);
  }
  if (v55)
  {
    int v56 = v55;
    operator delete(v55);
  }
  if (v58)
  {
    BOOL v59 = v58;
    operator delete(v58);
  }
  if (v61)
  {
    float v62 = v61;
    operator delete(v61);
  }
  if (v64)
  {
    uint64_t v65 = v64;
    operator delete(v64);
  }
  if (v67)
  {
    uint64_t v68 = v67;
    operator delete(v67);
  }
  if (v70)
  {
    BOOL v71 = v70;
    operator delete(v70);
  }
  if (v73)
  {
    uint64_t v74 = v73;
    operator delete(v73);
  }
}

void sub_25E3726B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35)
{
  if (__p) {
    operator delete(__p);
  }
  if (a22) {
    operator delete(a22);
  }
  if (a25) {
    operator delete(a25);
  }
  if (a28) {
    operator delete(a28);
  }
  if (a31) {
    operator delete(a31);
  }
  if (a34) {
    operator delete(a34);
  }
  int v37 = *(void **)(v35 - 176);
  if (v37)
  {
    *(void *)(v35 - 168) = v37;
    operator delete(v37);
  }
  uint64_t v38 = *(void **)(v35 - 152);
  if (v38)
  {
    *(void *)(v35 - 144) = v38;
    operator delete(v38);
  }
  int v39 = *(void **)(v35 - 128);
  if (v39)
  {
    *(void *)(v35 - 120) = v39;
    operator delete(v39);
  }
  _Unwind_Resume(exception_object);
}

void reranker::Linear::forward(reranker::Linear *this, const float *__A, float *__C, const float *__B, const float *a5)
{
  cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, *((_DWORD *)this + 2), *((_DWORD *)this + 1), *(_DWORD *)this, 1.0, __A, *(_DWORD *)this, __B, *((_DWORD *)this + 1), 0.0, __C, *((_DWORD *)this + 1));
  if (*((int *)this + 2) >= 1)
  {
    int v8 = 0;
    do
      cblas_saxpy(*((_DWORD *)this + 1), 1.0, a5, 1, &__C[*((_DWORD *)this + 1) * v8++], 1);
    while (v8 < *((_DWORD *)this + 2));
  }
}

void reranker::EncoderLayer<float>::forward(unsigned int *a1, const float *a2, float *a3, int *a4, int a5)
{
  if (a5 == 1)
  {
    uint64_t v13 = (unsigned __int16 *)((char *)a4 - *a4);
    unsigned int v14 = *v13;
    if (v14 >= 0x2F)
    {
      uint64_t v15 = v13[23];
      if (v13[23]) {
        v15 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v15);
      }
      uint64_t v10 = v15 + 4;
      uint64_t v82 = v15 + 4;
      if (v14 < 0x35)
      {
        if (v14 < 0x31) {
          goto LABEL_34;
        }
        uint64_t v12 = 4;
      }
      else
      {
        uint64_t v16 = v13[26];
        if (v13[26]) {
          v16 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v16);
        }
        uint64_t v12 = v16 + 4;
      }
      uint64_t v26 = v13[24];
      if (v13[24]) {
        v26 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v26);
      }
      uint64_t v23 = v26 + 4;
      if (v14 < 0x37)
      {
        if (v14 < 0x33) {
          goto LABEL_62;
        }
        uint64_t v22 = 4;
      }
      else
      {
        uint64_t v27 = v13[27];
        if (v13[27]) {
          v27 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v27);
        }
        uint64_t v22 = v27 + 4;
      }
      uint64_t v33 = v13[25];
      if (v13[25]) {
        v33 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v33);
      }
      uint64_t v29 = v33 + 4;
      uint64_t v81 = v33 + 4;
      if (v14 >= 0x39)
      {
        uint64_t v34 = v13[28];
        if (v13[28]) {
          v34 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v34);
        }
        uint64_t v17 = v34 + 4;
        if (v14 < 0x4B)
        {
          uint64_t v18 = 4;
          if (v14 < 0x3B) {
            goto LABEL_67;
          }
          uint64_t v19 = 4;
        }
        else
        {
          uint64_t v35 = v13[37];
          if (v13[37]) {
            v35 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v35);
          }
          uint64_t v18 = v35 + 4;
          if (v14 < 0x4D)
          {
            uint64_t v36 = 0;
          }
          else
          {
            uint64_t v36 = v13[38];
            if (v13[38]) {
              v36 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v36);
            }
          }
          uint64_t v19 = v36 + 4;
        }
        uint64_t v46 = v13[29];
        if (v13[29]) {
          v46 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v46);
        }
        uint64_t v79 = v46 + 4;
        if (v14 >= 0x3D)
        {
          uint64_t v47 = v13[30];
          if (v13[30]) {
            v47 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v47);
          }
          uint64_t v78 = v47 + 4;
          if (v14 >= 0x3F)
          {
            uint64_t v48 = v13[31];
            if (v13[31]) {
              v48 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v48);
            }
            uint64_t v77 = v48 + 4;
            if (v14 >= 0x41)
            {
              uint64_t v49 = v13[32];
              if (v13[32]) {
                v49 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v49);
              }
              uint64_t v76 = v49 + 4;
              if (v14 >= 0x43)
              {
                uint64_t v50 = v13[33];
                if (v13[33]) {
                  v50 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v50);
                }
                uint64_t v20 = v50 + 4;
                if (v14 >= 0x45)
                {
                  uint64_t v51 = v13[34];
                  if (v13[34]) {
                    v51 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v51);
                  }
                  uint64_t v21 = v51 + 4;
                  if (v14 >= 0x47)
                  {
                    uint64_t v52 = v13[35];
                    if (v13[35]) {
                      v52 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v52);
                    }
                    uint64_t v44 = v52 + 4;
                    if (v14 < 0x49) {
                      goto LABEL_146;
                    }
                    unsigned int v45 = v13[36];
                    if (!v45) {
                      goto LABEL_146;
                    }
LABEL_117:
                    uint64_t v81 = v29;
                    uint64_t v82 = v10;
                    uint64_t v74 = v44;
                    uint64_t v75 = (char *)a4 + v45 + *(int *)((char *)a4 + v45);
                    goto LABEL_125;
                  }
                  goto LABEL_145;
                }
                goto LABEL_144;
              }
              goto LABEL_143;
            }
            goto LABEL_142;
          }
          goto LABEL_141;
        }
        goto LABEL_118;
      }
LABEL_61:
      uint64_t v75 = 0;
      uint64_t v17 = 4;
      uint64_t v18 = 4;
      uint64_t v19 = 4;
      uint64_t v79 = 4;
LABEL_119:
      uint64_t v78 = 4;
LABEL_120:
      uint64_t v77 = 4;
LABEL_121:
      uint64_t v76 = 4;
LABEL_122:
      uint64_t v20 = 4;
LABEL_123:
      uint64_t v21 = 4;
LABEL_124:
      uint64_t v74 = 4;
      goto LABEL_125;
    }
LABEL_17:
    uint64_t v81 = 4;
    uint64_t v17 = 4;
    uint64_t v18 = 4;
    uint64_t v19 = 4;
    uint64_t v79 = 4;
    uint64_t v78 = 4;
    uint64_t v77 = 4;
    uint64_t v75 = 0;
    uint64_t v76 = 4;
    uint64_t v20 = 4;
    uint64_t v21 = 4;
    uint64_t v74 = 4;
    uint64_t v22 = 4;
    uint64_t v23 = 4;
    uint64_t v12 = 4;
    uint64_t v82 = 4;
    goto LABEL_125;
  }
  if (a5) {
    exit(1);
  }
  uint64_t v7 = (unsigned __int16 *)((char *)a4 - *a4);
  unsigned int v8 = *v7;
  if (v8 < 0xF) {
    goto LABEL_17;
  }
  uint64_t v9 = v7[7];
  if (v7[7]) {
    v9 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v9);
  }
  uint64_t v10 = v9 + 4;
  uint64_t v82 = v9 + 4;
  if (v8 < 0x15)
  {
    if (v8 >= 0x11)
    {
      uint64_t v12 = 4;
      goto LABEL_20;
    }
LABEL_34:
    uint64_t v81 = 4;
    uint64_t v17 = 4;
    uint64_t v18 = 4;
    uint64_t v19 = 4;
    uint64_t v79 = 4;
    uint64_t v78 = 4;
    uint64_t v77 = 4;
    uint64_t v75 = 0;
    uint64_t v76 = 4;
    uint64_t v20 = 4;
    uint64_t v21 = 4;
    uint64_t v74 = 4;
    uint64_t v22 = 4;
    uint64_t v23 = 4;
    uint64_t v12 = 4;
    goto LABEL_125;
  }
  uint64_t v11 = v7[10];
  if (v7[10]) {
    v11 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v11);
  }
  uint64_t v12 = v11 + 4;
LABEL_20:
  uint64_t v24 = v7[8];
  if (v7[8]) {
    v24 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v24);
  }
  uint64_t v23 = v24 + 4;
  if (v8 < 0x17)
  {
    if (v8 >= 0x13)
    {
      uint64_t v22 = 4;
      goto LABEL_37;
    }
LABEL_62:
    uint64_t v81 = 4;
    uint64_t v17 = 4;
    uint64_t v18 = 4;
    uint64_t v19 = 4;
    uint64_t v79 = 4;
    uint64_t v78 = 4;
    uint64_t v77 = 4;
    uint64_t v75 = 0;
    uint64_t v76 = 4;
    uint64_t v20 = 4;
    uint64_t v21 = 4;
    uint64_t v74 = 4;
    uint64_t v22 = 4;
    goto LABEL_125;
  }
  uint64_t v25 = v7[11];
  if (v7[11]) {
    v25 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v25);
  }
  uint64_t v22 = v25 + 4;
LABEL_37:
  uint64_t v28 = v7[9];
  if (v7[9]) {
    v28 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v28);
  }
  uint64_t v29 = v28 + 4;
  uint64_t v81 = v28 + 4;
  if (v8 < 0x19) {
    goto LABEL_61;
  }
  uint64_t v30 = v7[12];
  if (v7[12]) {
    v30 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v30);
  }
  uint64_t v17 = v30 + 4;
  if (v8 < 0x2B)
  {
    uint64_t v18 = 4;
    if (v8 >= 0x1B)
    {
      uint64_t v19 = 4;
      goto LABEL_70;
    }
LABEL_67:
    uint64_t v19 = 4;
    uint64_t v79 = 4;
    uint64_t v78 = 4;
    uint64_t v77 = 4;
    uint64_t v75 = 0;
    uint64_t v76 = 4;
    uint64_t v20 = 4;
    uint64_t v21 = 4;
    uint64_t v74 = 4;
    uint64_t v18 = 4;
    goto LABEL_125;
  }
  uint64_t v31 = v7[21];
  if (v7[21]) {
    v31 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v31);
  }
  uint64_t v18 = v31 + 4;
  if (v8 < 0x2D)
  {
    uint64_t v32 = 0;
  }
  else
  {
    uint64_t v32 = v7[22];
    if (v7[22]) {
      v32 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v32);
    }
  }
  uint64_t v19 = v32 + 4;
LABEL_70:
  uint64_t v37 = v7[13];
  if (v7[13]) {
    v37 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v37);
  }
  uint64_t v79 = v37 + 4;
  if (v8 < 0x1D)
  {
LABEL_118:
    uint64_t v75 = 0;
    goto LABEL_119;
  }
  uint64_t v38 = v7[14];
  if (v7[14]) {
    v38 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v38);
  }
  uint64_t v78 = v38 + 4;
  if (v8 < 0x1F)
  {
LABEL_141:
    uint64_t v75 = 0;
    goto LABEL_120;
  }
  uint64_t v39 = v7[15];
  if (v7[15]) {
    v39 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v39);
  }
  uint64_t v77 = v39 + 4;
  if (v8 < 0x21)
  {
LABEL_142:
    uint64_t v75 = 0;
    goto LABEL_121;
  }
  uint64_t v40 = v7[16];
  if (v7[16]) {
    v40 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v40);
  }
  uint64_t v76 = v40 + 4;
  if (v8 < 0x23)
  {
LABEL_143:
    uint64_t v75 = 0;
    goto LABEL_122;
  }
  uint64_t v41 = v7[17];
  if (v7[17]) {
    v41 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v41);
  }
  uint64_t v20 = v41 + 4;
  if (v8 < 0x25)
  {
LABEL_144:
    uint64_t v75 = 0;
    goto LABEL_123;
  }
  uint64_t v42 = v7[18];
  if (v7[18]) {
    v42 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v42);
  }
  uint64_t v21 = v42 + 4;
  if (v8 < 0x27)
  {
LABEL_145:
    uint64_t v75 = 0;
    goto LABEL_124;
  }
  uint64_t v43 = v7[19];
  if (v7[19]) {
    v43 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v43);
  }
  uint64_t v44 = v43 + 4;
  if (v8 >= 0x29)
  {
    unsigned int v45 = v7[20];
    if (v45) {
      goto LABEL_117;
    }
  }
LABEL_146:
  uint64_t v74 = v44;
  uint64_t v75 = 0;
LABEL_125:
  BOOL v88 = 0;
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  std::vector<float>::vector(&v88, (int)a1[1] * (uint64_t)(int)*a1);
  uint64_t v53 = a1[1];
  uint64_t v54 = (void *)(*a1 | (unint64_t)(v53 << 32));
  unint64_t v55 = v53 | ((unint64_t)a1[3] << 32);
  std::vector<int> __p = v54;
  unint64_t v86 = v55;
  reranker::MultiHeadAttention<float>::forward((int *)&__p, a2, a2, a2, v88, (const float *)v82, (const float *)v12, (const float *)v23, (float *)v22, (const float *)v81, (const float *)v17, (const float *)v18, (const float *)v19);
  uint64_t v57 = *a1;
  uint64_t v56 = a1[1];
  uint64_t v58 = (v57 * v56);
  BOOL v59 = v88;
  if ((int)v58 >= 1)
  {
    uint64_t v60 = v88;
    do
    {
      float v61 = *a2++;
      float *v60 = v61 + *v60;
      ++v60;
      --v58;
    }
    while (v58);
  }
  std::vector<int> __p = (void *)(v57 | (v56 << 32));
  LayerNorm<float>::forward((unsigned int *)&__p, v59, v20, v21);
  std::vector<int> __p = 0;
  unint64_t v86 = 0;
  uint64_t v87 = 0;
  std::vector<float>::vector(&__p, (int)a1[1] * (uint64_t)(int)a1[2]);
  int v62 = a1[1];
  unint64_t v83 = *a1 | ((unint64_t)a1[2] << 32);
  int v84 = v62;
  reranker::Linear::forward((reranker::Linear *)&v83, v88, (float *)__p, (const float *)v79, (const float *)v78);
  int v64 = a1[1];
  uint64_t v63 = a1[2];
  uint64_t v65 = (const float *)__p;
  uint64_t v66 = (v64 * v63);
  if ((int)v66 >= 1)
  {
    BOOL v67 = (float *)__p;
    do
    {
      if (*v67 < 0.0) {
        float *v67 = 0.0;
      }
      ++v67;
      --v66;
    }
    while (v66);
  }
  unint64_t v83 = v63 | ((unint64_t)*a1 << 32);
  int v84 = v64;
  reranker::Linear::forward((reranker::Linear *)&v83, v65, a3, (const float *)v77, (const float *)v76);
  uint64_t v69 = *a1;
  uint64_t v68 = a1[1];
  uint64_t v70 = (v69 * v68);
  if ((int)v70 >= 1)
  {
    BOOL v71 = v88;
    uint64_t v72 = a3;
    do
    {
      float v73 = *v71++;
      float *v72 = v73 + *v72;
      ++v72;
      --v70;
    }
    while (v70);
  }
  unint64_t v83 = v69 | (v68 << 32);
  LayerNorm<float>::forward((unsigned int *)&v83, a3, v74, (uint64_t)(v75 + 4));
  if (__p)
  {
    unint64_t v86 = (unint64_t)__p;
    operator delete(__p);
  }
  if (v88)
  {
    uint64_t v89 = v88;
    operator delete(v88);
  }
}

void sub_25E37309C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  if (__p) {
    operator delete(__p);
  }
  uint64_t v29 = *(void **)(v27 - 112);
  if (v29)
  {
    *(void *)(v27 - 104) = v29;
    operator delete(v29);
  }
  _Unwind_Resume(exception_object);
}

void Softmax::forward(Softmax *this, float *a2)
{
  uint64_t v2 = *(unsigned int *)this;
  if ((int)v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *((unsigned int *)this + 1);
    uint64_t v6 = 4 * v5;
    do
    {
      if ((int)v5 >= 1)
      {
        float v7 = 0.0;
        uint64_t v8 = v5;
        uint64_t v9 = a2;
        do
        {
          float v10 = *v9++;
          float v11 = v10;
          if (v7 < v10) {
            float v7 = v11;
          }
          --v8;
        }
        while (v8);
        unint64_t v12 = 0;
        float v13 = 0.0;
        do
        {
          float v14 = expf(a2[v12 / 4] - v7);
          a2[v12 / 4] = v14;
          float v13 = v13 + v14;
          v12 += 4;
        }
        while (v6 != v12);
        unint64_t v15 = 0;
        do
        {
          a2[v15 / 4] = a2[v15 / 4] / v13;
          v15 += 4;
        }
        while (v6 != v15);
      }
      ++v4;
      a2 += (int)v5;
    }
    while (v4 != v2);
  }
}

unsigned int *LayerNorm<float>::forward(unsigned int *result, float *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = result[1];
  if ((int)v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *result;
    float v7 = (float)(int)v6;
    do
    {
      if ((int)v6 < 1)
      {
        float v11 = 0.0;
        float v8 = 0.0;
      }
      else
      {
        float v8 = 0.0;
        uint64_t v9 = v6;
        float v10 = a2;
        float v11 = 0.0;
        do
        {
          float v12 = *v10++;
          float v11 = v11 + v12;
          float v8 = v8 + (float)(v12 * v12);
          --v9;
        }
        while (v9);
      }
      if ((int)v6 >= 1)
      {
        uint64_t v13 = 0;
        float v14 = v11 / v7;
        float v15 = sqrt((float)((float)(v8 / v7) - (float)(v14 * v14)) + 0.00001);
        do
        {
          a2[v13] = *(float *)(a4 + v13 * 4) + (float)((float)((float)(a2[v13] - v14) / v15) * *(float *)(a3 + v13 * 4));
          ++v13;
        }
        while (v6 != v13);
      }
      ++v5;
      a2 += (int)v6;
    }
    while (v5 != v4);
  }
  return result;
}

void verify_model_from_container_flatbuffer_cold_1()
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return MEMORY[0x270F98BE8]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
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

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void cblas_saxpy(const int __N, const float __alpha, const float *__X, const int __incX, float *__Y, const int __incY)
{
}

void cblas_scopy(const int __N, const float *__X, const int __incX, float *__Y, const int __incY)
{
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  MEMORY[0x270EDE420](*(void *)&__N, __X, *(void *)&__incX, __Y, *(void *)&__incY);
  return result;
}

void cblas_sgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const float __alpha, const float *__A, const int __lda, const float *__B, const int __ldb, const float __beta, float *__C, const int __ldc)
{
}

void cblas_sgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const float __alpha, const float *__A, const int __lda, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  MEMORY[0x270EDE478](*(void *)&__N, __X, *(void *)&__incX);
  return result;
}

void cblas_sscal(const int __N, const float __alpha, float *__X, const int __incX)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

uint64_t logForCSLogCategoryRecs()
{
  return MEMORY[0x270EE8658]();
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x270EDAE40](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
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