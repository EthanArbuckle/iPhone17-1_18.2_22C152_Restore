void sub_19E2EA570(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  sub_19E13A9BC(a1);
}

void sub_19E2EA598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
  {
    operator delete(__p);
    if (!v14)
    {
LABEL_3:
      *(void *)(a10 + 8) = a11;
      operator delete(a11);
      _Unwind_Resume(a1);
    }
  }
  else if (!v14)
  {
    goto LABEL_3;
  }
  operator delete(v14);
  *(void *)(a10 + 8) = a11;
  operator delete(a11);
  _Unwind_Resume(a1);
}

double sub_19E2EA5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = *(const void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int64_t v8 = v6 - *(void *)a2;
  if (v6 == *(void *)a2)
  {
    v10 = 0;
    v9 = 0;
  }
  else
  {
    if (v8 < 0) {
      sub_19E13D694();
    }
    v9 = (char *)operator new(v6 - *(void *)a2);
    v10 = &v9[8 * (v8 >> 3)];
    memcpy(v9, v7, v8);
  }
  int v11 = *(_DWORD *)(a2 + 24);
  vDSP_vdivD(*(const double **)(a1 + 24), 1, (const double *)v9, 1, (double *)v9, 1, v11);
  int64_t v12 = v10 - v9;
  if (v12)
  {
    if (v12 < 0) {
      sub_19E13D694();
    }
    v13 = (char *)operator new(v12);
    v14 = &v13[8 * (v12 >> 3)];
    memcpy(v13, v9, v12);
    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
    v14 = 0;
    v13 = 0;
    if (v9) {
LABEL_8:
    }
      operator delete(v9);
  }
  v16 = *(const void **)a3;
  uint64_t v15 = *(void *)(a3 + 8);
  int64_t v17 = v15 - *(void *)a3;
  if (v15 == *(void *)a3)
  {
    v19 = 0;
    v18 = 0;
  }
  else
  {
    if (v17 < 0) {
      sub_19E13D694();
    }
    v18 = (char *)operator new(v15 - *(void *)a3);
    v19 = &v18[8 * (v17 >> 3)];
    memcpy(v18, v16, v17);
  }
  vDSP_vdivD(*(const double **)(a1 + 24), 1, (const double *)v18, 1, (double *)v18, 1, *(int *)(a3 + 24));
  if (v19 == v18)
  {
    v20 = 0;
    if (v18) {
LABEL_18:
    }
      operator delete(v18);
  }
  else
  {
    if (v19 - v18 < 0) {
      sub_19E13D694();
    }
    v20 = operator new(v19 - v18);
    memcpy(v20, v18, v19 - v18);
    if (v18) {
      goto LABEL_18;
    }
  }
  uint64_t v21 = v14 - v13;
  if (v14 == v13)
  {
    v23 = 0;
    v22 = 0;
  }
  else
  {
    if (v21 < 0) {
      sub_19E13D694();
    }
    v22 = (char *)operator new(v14 - v13);
    v23 = &v22[8 * (v21 >> 3)];
    memcpy(v22, v13, v14 - v13);
  }
  vDSP_vsubD((const double *)v20, 1, (const double *)v22, 1, (double *)v22, 1, v11);
  size_t v24 = v23 - v22;
  if (v23 == v22)
  {
    v25 = 0;
  }
  else
  {
    if ((v24 & 0x8000000000000000) != 0) {
      sub_19E13D694();
    }
    v25 = operator new(v23 - v22);
    memcpy(v25, v22, v24);
  }
  cblas_dnrm2_NEWLAPACK();
  double v27 = v26;
  if (v25) {
    operator delete(v25);
  }
  if (v22) {
    operator delete(v22);
  }
  if (v20) {
    operator delete(v20);
  }
  if (v13) {
    operator delete(v13);
  }
  return v27 * 2.23606798;
}

void sub_19E2EA938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (v25) {
    operator delete(v25);
  }
  if (v26) {
    operator delete(v26);
  }
  if (v24) {
    operator delete(v24);
  }
  if (v23) {
    operator delete(v23);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E2EAA14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  if (a26) {
    JUMPOUT(0x19E2EAA08);
  }
  JUMPOUT(0x19E2EAA0CLL);
}

uint64_t sub_19E2EAA28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  v13 = 0;
  v14 = 0;
  uint64_t v15 = 0;
  sub_19E246830(&v13, *a3, a3[1], 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 4));
  __p = 0;
  int64_t v17 = 0;
  uint64_t v18 = 0;
  sub_19E246A1C(&__p, a3[3], a3[4], 0xCCCCCCCCCCCCCCCDLL * ((a3[4] - a3[3]) >> 3));
  sub_19E2EABC4((void *)a1, a2, (uint64_t *)&v13);
  uint64_t v6 = (void **)__p;
  if (__p)
  {
    v7 = v17;
    int64_t v8 = __p;
    if (v17 != __p)
    {
      do
      {
        if (*((char *)v7 - 17) < 0) {
          operator delete(*(v7 - 5));
        }
        v7 -= 5;
      }
      while (v7 != v6);
      int64_t v8 = __p;
    }
    int64_t v17 = v6;
    operator delete(v8);
  }
  v9 = (void **)v13;
  if (v13)
  {
    v10 = v14;
    int v11 = v13;
    if (v14 != v13)
    {
      do
      {
        if (*((char *)v10 - 25) < 0) {
          operator delete(*(v10 - 6));
        }
        v10 -= 6;
      }
      while (v10 != v9);
      int v11 = v13;
    }
    v14 = v9;
    operator delete(v11);
  }
  *(void *)a1 = &unk_1EF0A82E8;
  *(_DWORD *)(a1 + 64) = 5;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 72) = 0;
  return a1;
}

void sub_19E2EAB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_19E2EABA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    sub_19E32FAD8((uint64_t)&a9, a9);
  }
  _Unwind_Resume(exception_object);
}

void *sub_19E2EABC4(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = &unk_1EF0A8438;
  a1[1] = a2;
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = 0;
  sub_19E246830(a1 + 2, *a3, a3[1], 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 4));
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  sub_19E246A1C(a1 + 5, a3[3], a3[4], 0xCCCCCCCCCCCCCCCDLL * ((a3[4] - a3[3]) >> 3));
  return a1;
}

void sub_19E2EAC64(_Unwind_Exception *exception_object)
{
  if (*v2) {
    sub_19E32FD88(v1, *v2);
  }
  _Unwind_Resume(exception_object);
}

void *sub_19E2EAC84(void *a1)
{
  *a1 = &unk_1EF0A82E8;
  v2 = (char **)a1[9];
  if (v2)
  {
    v3 = (char **)a1[10];
    v4 = v2;
    if (v3 != v2)
    {
      do
        v3 = sub_19E2470C8(v3 - 13);
      while (v3 != v2);
      v4 = (char **)a1[9];
    }
    a1[10] = v2;
    operator delete(v4);
  }

  return sub_19E2EB338(a1);
}

void sub_19E2EAD0C(void *a1)
{
  *a1 = &unk_1EF0A82E8;
  v2 = (char **)a1[9];
  if (v2)
  {
    v3 = (char **)a1[10];
    v4 = v2;
    if (v3 != v2)
    {
      do
        v3 = sub_19E2470C8(v3 - 13);
      while (v3 != v2);
      v4 = (char **)a1[9];
    }
    a1[10] = v2;
    operator delete(v4);
  }
  v5 = sub_19E2EB338(a1);

  operator delete(v5);
}

void sub_19E2EAD98(uint64_t a1@<X0>, uint64_t **a2@<X1>, uint64_t a3@<X8>)
{
  sub_19E2EB410(a1);
  uint64_t v6 = *(void *)(a1 + 72);
  if (v6 == *(void *)(a1 + 80))
  {
    uint64_t v39 = a3;
    sub_19E29CB00(a2, &v52);
    sub_19E2EB708(a2, (uint64_t)v49);
    v7 = v50;
    if (v50 != v51)
    {
      do
      {
        uint64_t v8 = *(void *)((char *)v7 + 28);
        sub_19E291E68(v48, &v52[12 * (int)v8]);
        if (SHIDWORD(v8) >= 1)
        {
          int v9 = 0;
          unsigned int v10 = HIDWORD(v8) & ~(v8 >> 63);
          do
          {
            sub_19E2EB848(a1, (uint64_t *)v48, (uint64_t **)&__A);
            sub_19E2460A4((char **)v48, (uint64_t)&__A);
            sub_19E15A064((uint64_t)v47, v47[1]);
            sub_19E15A064((uint64_t)v46, v46[1]);
            int v11 = (char *)__p;
            if (__p)
            {
              int64_t v12 = v45;
              v13 = __p;
              if (v45 != __p)
              {
                do
                {
                  v14 = (void *)*((void *)v12 - 4);
                  if (v14)
                  {
                    *((void *)v12 - 3) = v14;
                    operator delete(v14);
                  }
                  if (*(v12 - 33) < 0) {
                    operator delete(*((void **)v12 - 7));
                  }
                  v12 -= 56;
                }
                while (v12 != v11);
                v13 = __p;
              }
              v45 = v11;
              operator delete(v13);
            }
            uint64_t v15 = __A;
            if (*(double *)&__A != 0.0)
            {
              v16 = v43;
              int64_t v17 = __A;
              if (v43 != __A)
              {
                do
                {
                  uint64_t v18 = (void *)*((void *)v16 - 4);
                  if (v18)
                  {
                    *((void *)v16 - 3) = v18;
                    operator delete(v18);
                  }
                  if (*((char *)v16 - 33) < 0) {
                    operator delete(*((void **)v16 - 7));
                  }
                  v16 -= 7;
                }
                while (v16 != v15);
                int64_t v17 = __A;
              }
              v43 = v15;
              operator delete(v17);
            }
            v41 = 0;
            uint64_t v19 = *(void *)(a1 + 8);
            sub_19E29CE6C((long long **)v48, (uint64_t)v40);
            uint64_t v20 = *(void *)(v19 + 8);
            if (*(_DWORD *)(v20 + 120))
            {
              sub_19E2EA324(*(void *)(v19 + 8), (uint64_t)v40, (uint64_t)&__A);
              __C[0] = 0.0;
              vDSP_dotprD(__A, 1, *(const double **)(v20 + 256), 1, __C, (int)__p);
              double v21 = __C[0];
              __C[0] = 0.0;
              vDSP_meanvD(*(const double **)(v20 + 288), 1, __C, *(int *)(v20 + 312));
              double v22 = __C[0];
              sub_19E2EBD20(v20, (uint64_t)v40, (uint64_t)&__A);
              double v24 = v23;
              double v25 = *(double *)(v20 + 16);
              if (*(double *)&__A != 0.0)
              {
                v43 = __A;
                operator delete(__A);
              }
              double v26 = v22 + v21;
              double v27 = v25 + v24;
            }
            else
            {
              *(double *)&__A = 0.0;
              vDSP_meanvD(*(const double **)(v20 + 288), 1, (double *)&__A, *(int *)(v20 + 312));
              double v26 = *(double *)&__A;
              double v27 = sub_19E2EBC44(v20, (uint64_t)v40);
            }
            double v28 = sqrt(v27);
            if (v28 < 0.00000001 || (int v29 = *(_DWORD *)(*(void *)(v19 + 8) + 120), v29 <= 0))
            {
              double v30 = (*(double (**)(uint64_t))(*(void *)v19 + 8))(v19);
            }
            else
            {
              if (*(_DWORD *)(v19 + 56) != v29) {
                (*(void (**)(uint64_t))(*(void *)v19 + 16))(v19);
              }
              (**(void (***)(uint64_t, double, double))v19)(v19, v26, v28);
            }
            v31 = *(uint64_t **)&v30;
            if (v40[0])
            {
              v40[1] = v40[0];
              operator delete(v40[0]);
            }
            v41 = v31;
            sub_19E29D218((int *)(a1 + 64), (uint64_t *)v48, &v41);
            ++v9;
          }
          while (v10 != v9);
        }
        sub_19E2470C8((char **)v48);
        v32 = (void *)v7[1];
        if (v32)
        {
          do
          {
            v33 = (void **)v32;
            v32 = (void *)*v32;
          }
          while (v32);
        }
        else
        {
          do
          {
            v33 = (void **)v7[2];
            BOOL v34 = *v33 == v7;
            v7 = v33;
          }
          while (!v34);
        }
        v7 = v33;
      }
      while (v33 != v51);
    }
    v35 = *(uint64_t **)(a1 + 72);
    sub_19E291E68((uint64_t **)v39, v35);
    *(void *)(v39 + 96) = v35[12];
    sub_19E29D74C(*(char ***)(a1 + 72), *(void *)(a1 + 80), (uint64_t)v48, 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(*(void *)(a1 + 80) - *(void *)(a1 + 72)) >> 3));
    *(void *)(a1 + 80) = sub_19E2470C8((char **)(*(void *)(a1 + 80) - 104));
    sub_19E13C56C((uint64_t)&v50, v51[0]);
    v36 = (char **)v52;
    if (v52)
    {
      v37 = v53;
      v38 = v52;
      if (v53 != (char **)v52)
      {
        do
          v37 = sub_19E2470C8(v37 - 12);
        while (v37 != v36);
        v38 = v52;
      }
      v53 = v36;
      operator delete(v38);
    }
  }
  else
  {
    sub_19E291E68((uint64_t **)a3, *(uint64_t **)(a1 + 72));
    *(void *)(a3 + 96) = *(void *)(v6 + 96);
    sub_19E29D74C(*(char ***)(a1 + 72), *(void *)(a1 + 80), (uint64_t)v48, 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(*(void *)(a1 + 80) - *(void *)(a1 + 72)) >> 3));
    *(void *)(a1 + 80) = sub_19E2470C8((char **)(*(void *)(a1 + 80) - 104));
  }
}

void sub_19E2EB254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  sub_19E2470C8(v28);
  sub_19E13C56C(a10, *(void **)(v29 - 184));
  sub_19E2462FC((void **)(v29 - 168));
  _Unwind_Resume(a1);
}

void sub_19E2EB2EC(char *a1@<X8>)
{
  a1[23] = 17;
  strcpy(a1, "genetic_optimizer");
}

void sub_19E2EB310(char *a1@<X8>)
{
  a1[23] = 21;
  strcpy(a1, "acquisition_optimizer");
}

void *sub_19E2EB338(void *a1)
{
  *a1 = &unk_1EF0A8438;
  uint64_t v2 = a1[5];
  if (v2)
  {
    uint64_t v3 = a1[6];
    v4 = (void *)a1[5];
    if (v3 != v2)
    {
      do
      {
        if (*(char *)(v3 - 17) < 0) {
          operator delete(*(void **)(v3 - 40));
        }
        v3 -= 40;
      }
      while (v3 != v2);
      v4 = (void *)a1[5];
    }
    a1[6] = v2;
    operator delete(v4);
  }
  uint64_t v5 = a1[2];
  if (v5)
  {
    uint64_t v6 = a1[3];
    v7 = (void *)a1[2];
    if (v6 != v5)
    {
      do
      {
        if (*(char *)(v6 - 25) < 0) {
          operator delete(*(void **)(v6 - 48));
        }
        v6 -= 48;
      }
      while (v6 != v5);
      v7 = (void *)a1[2];
    }
    a1[3] = v5;
    operator delete(v7);
  }
  return a1;
}

void sub_19E2EB410(uint64_t a1)
{
  int v18 = 5;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v19 = 0;
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v2 = (uint64_t *)(a1 + 72);
  if (v3 == *(void *)(a1 + 80))
  {
    int64_t v12 = 0;
    *(_DWORD *)(a1 + 64) = 5;
    if ((int *)(a1 + 64) == &v18) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  do
  {
    sub_19E291E68(v17, (uint64_t *)v3);
    v17[12] = *(uint64_t **)(v3 + 96);
    sub_19E29D74C(*(char ***)(a1 + 72), *(void *)(a1 + 80), (uint64_t)__p, 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(*(void *)(a1 + 80) - *(void *)(a1 + 72)) >> 3));
    *(void *)(a1 + 80) = sub_19E2470C8((char **)(*(void *)(a1 + 80) - 104));
    v16 = 0;
    uint64_t v4 = *(void *)(a1 + 8);
    sub_19E29CE6C((long long **)v17, (uint64_t)__p);
    v5.n128_f64[0] = sub_19E2EBB38(*(void *)(v4 + 8), (uint64_t)__p);
    double v7 = sqrt(v6);
    if (v7 < 0.00000001 || (int v8 = *(_DWORD *)(*(void *)(v4 + 8) + 120), v8 <= 0))
    {
      double v10 = (*(double (**)(uint64_t, __n128))(*(void *)v4 + 8))(v4, v5);
    }
    else
    {
      double v9 = v5.n128_f64[0];
      if (*(_DWORD *)(v4 + 56) != v8) {
        (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
      }
      (**(void (***)(uint64_t, double, double))v4)(v4, v9, v7);
    }
    *(double *)&int v11 = v10;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v16 = v11;
    if (*(double *)&v11 > (*(double (**)(void))(**(void **)(a1 + 8) + 8))(*(void *)(a1 + 8))) {
      sub_19E29D218(&v18, (uint64_t *)v17, &v16);
    }
    sub_19E2470C8((char **)v17);
    uint64_t v3 = *(void *)(a1 + 72);
  }
  while (v3 != *(void *)(a1 + 80));
  int64_t v12 = v19;
  *(_DWORD *)(a1 + 64) = v18;
  if ((int *)(a1 + 64) != &v18)
  {
LABEL_17:
    sub_19E29D4FC(v2, v12, v20, 0x4EC4EC4EC4EC4EC5 * (v20 - v12));
    int64_t v12 = v19;
  }
LABEL_18:
  if (v12)
  {
    v13 = (char **)v20;
    v14 = v12;
    if (v20 != v12)
    {
      do
        v13 = sub_19E2470C8(v13 - 13);
      while (v13 != (char **)v12);
      v14 = v19;
    }
    uint64_t v20 = v12;
    operator delete(v14);
  }
}

void sub_19E2EB6A4(_Unwind_Exception *a1)
{
  sub_19E29C7AC(v1 - 120);
  _Unwind_Resume(a1);
}

void sub_19E2EB6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_19E2470C8((char **)va);
  sub_19E29C7AC(v7 - 120);
  _Unwind_Resume(a1);
}

void sub_19E2EB6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char *a15)
{
  if (__p) {
    operator delete(__p);
  }
  sub_19E2470C8(&a15);
  sub_19E29C7AC(v15 - 120);
  _Unwind_Resume(a1);
}

void sub_19E2EB708(uint64_t **a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 8) = a2 + 16;
  *(void *)(a2 + 24) = 0;
  sub_19E29DC58(a1, __p);
  sub_19E2459C8(v7, (uint64_t *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  uint64_t v3 = 50;
  do
  {
    int v5 = sub_19E29E07C((uint64_t)v9, (uint64_t)v7, v9);
    uint64_t v4 = sub_19E29DD48((int *)a2, &v5);
    ++*(_DWORD *)v4;
    --v3;
  }
  while (v3);
  if (v9[0])
  {
    v9[1] = v9[0];
    operator delete(v9[0]);
  }
  std::random_device::~random_device(&v8);
}

void sub_19E2EB7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, char a14)
{
  if (__p)
  {
    operator delete(__p);
    sub_19E13C56C(v14, *v15);
    _Unwind_Resume(a1);
  }
  sub_19E13C56C(v14, *v15);
  _Unwind_Resume(a1);
}

void sub_19E2EB848(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t **a3@<X8>)
{
  sub_19E291E68(a3, a2);
  sub_19E29E298((long long **)a2, (uint64_t)v8);
  sub_19E2EB9D8(a1, (uint64_t *)v8, v9);
  sub_19E29E624((uint64_t)a2, (uint64_t)v6);
  sub_19E2EBA88(a1, (uint64_t *)v6, __p);
  sub_19E29E900((uint64_t *)a3, (uint64_t *)v9);
  sub_19E29EAC0((uint64_t)a3, (uint64_t *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  if (*(void *)&v9[0])
  {
    *((void *)&v9[0] + 1) = *(void *)&v9[0];
    operator delete(*(void **)&v9[0]);
  }
  if (v8[0])
  {
    v8[1] = v8[0];
    operator delete(v8[0]);
  }
}

void sub_19E2EB918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p)
  {
    operator delete(__p);
    uint64_t v21 = *(void **)(v19 - 64);
    if (!v21)
    {
LABEL_3:
      double v22 = a17;
      if (!a17) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v21 = *(void **)(v19 - 64);
    if (!v21) {
      goto LABEL_3;
    }
  }
  *(void *)(v19 - 56) = v21;
  operator delete(v21);
  double v22 = a17;
  if (!a17)
  {
LABEL_4:
    sub_19E2470C8(v18);
    _Unwind_Resume(a1);
  }
LABEL_7:
  operator delete(v22);
  sub_19E2470C8(v18);
  _Unwind_Resume(a1);
}

double sub_19E2EB9D8@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  int v5 = (uint64_t *)(a1 + 16);
  if (sub_19E244298((uint64_t *)(a1 + 16)))
  {
    sub_19E244360(v5, (uint64_t *)v7);
    sub_19E310AEC(a2, (uint64_t)v7, (uint64_t)a3);
    if (__p)
    {
      double v9 = __p;
      operator delete(__p);
    }
    if (v7[0])
    {
      v7[1] = v7[0];
      operator delete(v7[0]);
    }
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_19E2EBA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

double sub_19E2EBA88@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5 = a1 + 16;
  if (sub_19E244DC4(a1 + 16))
  {
    sub_19E244E8C(v5, (uint64_t *)v7);
    sub_19E311780(a2, (uint64_t *)v7, (uint64_t)a3);
    if (__p)
    {
      double v9 = __p;
      operator delete(__p);
    }
    if (v7[0])
    {
      v7[1] = v7[0];
      operator delete(v7[0]);
    }
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_19E2EBB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

double sub_19E2EBB38(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 120))
  {
    sub_19E2EA324(a1, a2, (uint64_t)__A);
    double __C = 0.0;
    vDSP_dotprD(__A[0], 1, *(const double **)(a1 + 256), 1, &__C, (int)__N);
    double v4 = __C;
    double __C = 0.0;
    vDSP_meanvD(*(const double **)(a1 + 288), 1, &__C, *(int *)(a1 + 312));
    double v5 = __C;
    sub_19E2EBD20(a1, a2, (uint64_t)__A);
    if (__A[0])
    {
      __A[1] = __A[0];
      operator delete(__A[0]);
    }
    return v5 + v4;
  }
  else
  {
    double v6 = sub_19E2EA240(a1, a2);
    sub_19E2EBC44(a1, a2);
  }
  return v6;
}

void sub_19E2EBC24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double sub_19E2EBC44(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 120))
  {
    sub_19E2EA324(a1, a2, (uint64_t)__p);
    sub_19E2EBD20(a1, a2, (uint64_t)__p);
    double v5 = v4;
    double v6 = *(double *)(a1 + 16);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    return v6 + v5;
  }
  else
  {
    double v8 = sub_19E2EA5E4(a1 + 8, a2, a2);
    double v9 = *(double *)(a1 + 24);
    return *(double *)(a1 + 16) + exp(-v8) * v9 * (v8 + 1.0 + v10);
  }
}

void sub_19E2EBD04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E2EBD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_19E29F880(a1 + 192, (uint64_t)__p);
  uint64_t v6 = *(unsigned int *)(a1 + 216);
  if ((int)v6 >= 1)
  {
    uint64_t v7 = 0;
    int v8 = *(_DWORD *)(a1 + 220);
    int v9 = v24;
    int v10 = 1;
    int v11 = -1;
    int64_t v12 = __p[0];
    do
    {
      if (v8 <= v10) {
        int v13 = v10;
      }
      else {
        int v13 = v8;
      }
      int v14 = v7 + 1;
      if ((int)v7 + 1 >= v8) {
        goto LABEL_3;
      }
      unsigned int v15 = 0;
      int v16 = v13 + v11;
      uint64_t v17 = (int)v7 * (uint64_t)v9;
      if ((v13 + v11) < 4)
      {
        int v18 = v7 + 1;
      }
      else
      {
        int v18 = v7 + 1;
        if (v13 - (int)v7 + v10 - 2 >= v10)
        {
          int v19 = 0;
          unsigned int v15 = v16 & 0xFFFFFFFC;
          int v18 = v14 + (v16 & 0xFFFFFFFC);
          do
          {
            uint64_t v20 = &v12[v17 + v10 + v19];
            _OWORD *v20 = 0uLL;
            v20[1] = 0uLL;
            v19 += 4;
          }
          while ((v16 & 0xFFFFFFFC) != v19);
          if (v16 == v15) {
            goto LABEL_3;
          }
        }
      }
      unsigned int v21 = v13 - v15;
      do
      {
        v12[v17 + v18] = 0;
        int v18 = ++v15 + v14;
        --v21;
      }
      while (v10 != v21);
LABEL_3:
      ++v7;
      ++v10;
      --v11;
    }
    while (v7 != v6);
  }
  sub_19E29F6FC((uint64_t)__p, a3, (uint64_t)__B);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  double v22 = sub_19E2EA5E4(a1 + 8, a2, a2);
  __p[0] = 0;
  vDSP_dotprD(__B[0], 1, __B[0], 1, (double *)__p, (int)__N);
  if (__B[0])
  {
    __B[1] = __B[0];
    operator delete(__B[0]);
  }
  exp(-v22);
}

void sub_19E2EBEF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E2EBF28(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  BOOL v34 = 0;
  v35 = 0;
  uint64_t v36 = 0;
  sub_19E246830(&v34, *a3, a3[1], 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 4));
  __p = 0;
  v38 = 0;
  uint64_t v39 = 0;
  sub_19E246A1C(&__p, a3[3], a3[4], 0xCCCCCCCCCCCCCCCDLL * ((a3[4] - a3[3]) >> 3));
  sub_19E2EABC4((void *)a1, a2, (uint64_t *)&v34);
  int v8 = (void **)__p;
  if (__p)
  {
    int v9 = v38;
    int v10 = __p;
    if (v38 != __p)
    {
      do
      {
        if (*((char *)v9 - 17) < 0) {
          operator delete(*(v9 - 5));
        }
        v9 -= 5;
      }
      while (v9 != v8);
      int v10 = __p;
    }
    v38 = v8;
    operator delete(v10);
  }
  int v11 = (void **)v34;
  if (v34)
  {
    int64_t v12 = v35;
    int v13 = v34;
    if (v35 != v34)
    {
      do
      {
        if (*((char *)v12 - 25) < 0) {
          operator delete(*(v12 - 6));
        }
        v12 -= 6;
      }
      while (v12 != v11);
      int v13 = v34;
    }
    v35 = v11;
    operator delete(v13);
  }
  *(void *)a1 = &unk_1EF0A8108;
  unsigned int v14 = sub_19E244298(a3);
  sub_19E2A099C(a1 + 64, v14);
  sub_19E299010(a1 + 184);
  sub_19E244360(a3, (uint64_t *)v32);
  sub_19E2A16E8(a1 + 64, (uint64_t *)v32);
  sub_19E2A1818(a1 + 64, (uint64_t *)v33);
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  if (v32[0])
  {
    v32[1] = v32[0];
    operator delete(v32[0]);
  }
  if ((a4 & 0xFF00000000) != 0)
  {
    uint64_t v15 = 0;
    *(_DWORD *)(a1 + 7776) = a4;
    uint64_t v16 = 1;
    unsigned int v17 = a4;
    do
    {
      int v18 = 1812433253 * (v17 ^ (v17 >> 30));
      unsigned int v17 = v18 + v16;
      *(_DWORD *)(a1 + 7780 + 4 * v15) = v15 + v18 + 1;
      ++v16;
      ++v15;
    }
    while (v15 != 623);
    *(void *)(a1 + 10272) = 0;
    *(_DWORD *)(a1 + 184) = a4;
    uint64_t v19 = 1;
    uint64_t v20 = 47;
    unsigned int v21 = a4;
    do
    {
      int v22 = 1812433253 * (v21 ^ (v21 >> 30));
      unsigned int v21 = v22 + v19;
      *(_DWORD *)(a1 + 4 * v20) = v20 + v22 - 46;
      ++v19;
      ++v20;
    }
    while (v20 != 670);
    uint64_t v23 = 0;
    *(void *)(a1 + 2680) = 0;
    *(_DWORD *)(a1 + 2712) = a4;
    uint64_t v24 = 1;
    unsigned int v25 = a4;
    do
    {
      int v26 = 1812433253 * (v25 ^ (v25 >> 30));
      unsigned int v25 = v26 + v24;
      *(_DWORD *)(a1 + 2716 + 4 * v23) = v23 + v26 + 1;
      ++v24;
      ++v23;
    }
    while (v23 != 623);
    uint64_t v27 = 0;
    *(void *)(a1 + 5208) = 0;
    *(_DWORD *)(a1 + 5232) = a4;
    uint64_t v28 = 1;
    unsigned int v29 = a4;
    do
    {
      int v30 = 1812433253 * (v29 ^ (v29 >> 30));
      unsigned int v29 = v30 + v28;
      *(_DWORD *)(a1 + 5236 + 4 * v27) = v27 + v30 + 1;
      ++v28;
      ++v27;
    }
    while (v27 != 623);
    *(void *)(a1 + 7728) = 0;
    sub_19E312C64();
  }
  return a1;
}

void sub_19E2EC20C(_Unwind_Exception *a1)
{
  sub_19E2A0A3C(v2);
  sub_19E2EB338(v1);
  _Unwind_Resume(a1);
}

void sub_19E2EC278(_Unwind_Exception *a1)
{
  sub_19E2EB338(v1);
  _Unwind_Resume(a1);
}

void sub_19E2EC290(uint64_t a1)
{
  uint64_t v1 = sub_19E2EC7D8(a1);

  operator delete(v1);
}

void sub_19E2EC2B8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v12 = 0u;
  memset(v11, 0, sizeof(v11));
  *(void *)&long long v12 = (char *)&v12 + 8;
  v15[0] = 0;
  v15[1] = 0;
  uint64_t v13 = 0;
  unsigned int v14 = v15;
  double v4 = (*(double (**)(void))(**(void **)(a1 + 8) + 8))(*(void *)(a1 + 8));
  sub_19E291E68((uint64_t **)a2, (uint64_t *)v11);
  *(double *)(a2 + 96) = v4;
  sub_19E2470C8((char **)v11);
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v16 = 0;
  sub_19E246830(&v16, *(void *)(a1 + 16), *(void *)(a1 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 4));
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  sub_19E246A1C(&v19, *(void *)(a1 + 40), *(void *)(a1 + 48), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 40)) >> 3));
  sub_19E2459CC((uint64_t *)&v16, a1 + 184, 5, (char **)&v22);
  double v5 = v19;
  if (v19)
  {
    uint64_t v6 = v20;
    uint64_t v7 = v19;
    if (v20 != v19)
    {
      do
      {
        if (*((char *)v6 - 17) < 0) {
          operator delete(*(v6 - 5));
        }
        v6 -= 5;
      }
      while (v6 != v5);
      uint64_t v7 = v19;
    }
    uint64_t v20 = v5;
    operator delete(v7);
  }
  uint64_t v8 = (uint64_t)v16;
  if (v16)
  {
    uint64_t v9 = v17;
    int v10 = v16;
    if ((void *)v17 != v16)
    {
      do
      {
        if (*(char *)(v9 - 25) < 0) {
          operator delete(*(void **)(v9 - 48));
        }
        v9 -= 48;
      }
      while (v9 != v8);
      int v10 = v16;
    }
    uint64_t v17 = v8;
    operator delete(v10);
  }
  sub_19E2EC8B0(a1, v22);
}

void sub_19E2EC700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v8 = va_arg(va1, char *);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  sub_19E2470C8((char **)va1);
  sub_19E2470C8((char **)va);
  sub_19E2462FC((void **)(v6 - 112));
  sub_19E2470C8(v5);
  _Unwind_Resume(a1);
}

void sub_19E2EC7B8(char *a1@<X8>)
{
  a1[23] = 16;
  strcpy(a1, "direct_optimizer");
}

void *sub_19E2EC7D8(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0A8108;
  std::random_device::~random_device((std::random_device *)(a1 + 10280));
  std::random_device::~random_device((std::random_device *)(a1 + 7736));
  std::random_device::~random_device((std::random_device *)(a1 + 5216));
  std::random_device::~random_device((std::random_device *)(a1 + 2688));
  *(void *)(a1 + 64) = &unk_1EF0A7F70;
  sub_19E311F9C(*(void *)(a1 + 72));
  uint64_t v2 = *(void **)(a1 + 128);
  if (v2)
  {
    *(void *)(a1 + 136) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 104);
  if (v3)
  {
    *(void *)(a1 + 112) = v3;
    operator delete(v3);
  }
  double v4 = *(void **)(a1 + 80);
  if (v4)
  {
    *(void *)(a1 + 88) = v4;
    operator delete(v4);
  }

  return sub_19E2EB338((void *)a1);
}

void sub_19E2EC8B0(uint64_t a1, long long **a2)
{
  v4[0] = a1;
  v4[1] = a2;
  uint64_t v2 = a1 + 64;
  sub_19E29E298(a2, (uint64_t)&__p);
  sub_19E2ECC80(v2, (uint64_t)v4, (uint64_t)&__p);
}

void sub_19E2ECBA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (a13)
  {
    operator delete(a13);
    uint64_t v24 = __p;
    if (!__p)
    {
LABEL_4:
      sub_19E2470C8((char **)&a21);
      unsigned int v25 = *(void **)(v22 - 128);
      if (v25)
      {
        *(void *)(v22 - 120) = v25;
        operator delete(v25);
      }
      _Unwind_Resume(a1);
    }
  }
  else
  {
    uint64_t v24 = __p;
    if (!__p) {
      goto LABEL_4;
    }
  }
  operator delete(v24);
  goto LABEL_4;
}

void sub_19E2ECC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 112)) {
    (**(void (***)(uint64_t, void))a1)(a1, *(unsigned int *)(a3 + 24));
  }
  operator new();
}

void sub_19E2ED114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  __cxa_free_exception(v15);
  if (a2 != 3)
  {
    if (a2 == 2)
    {
      uint64_t v19 = __cxa_begin_catch(a1);
      (*(void (**)(void *))(*(void *)v19 + 16))(v19);
      sub_19E29FAE8(v14, (uint64_t)&a13);
      if (a13)
      {
        a14 = (uint64_t)a13;
        operator delete(a13);
      }
      __cxa_end_catch();
LABEL_13:
      JUMPOUT(0x19E2ECEFCLL);
    }
    if (a2 != 1)
    {
      if (__p) {
        operator delete(__p);
      }
      _Unwind_Resume(a1);
    }
  }
  uint64_t v18 = __cxa_begin_catch(a1);
  (*(void (**)(void *))(*(void *)v18 + 16))(v18);
  __cxa_end_catch();
  goto LABEL_13;
}

void sub_19E2ED264(uint64_t **a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = *a1;
  double v5 = a1[1];
  unint64_t v7 = (char *)v5 - (char *)*a1;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  __p = 0;
  int v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if (!(v7 >> 3))
  {
    uint64_t v8 = 0;
    __p = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    int v20 = v7 >> 3;
    if (v6 == v5) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  if (((v7 >> 3) & 0x80000000) != 0) {
    sub_19E13D694();
  }
  uint64_t v8 = operator new((uint64_t)(v7 << 29) >> 29);
  bzero(v8, (uint64_t)(v7 << 29) >> 29);
  __p = v8;
  uint64_t v18 = (char *)v8 + ((uint64_t)(v7 << 29) >> 29);
  uint64_t v19 = (char *)v8 + 8 * (int)((uint64_t)v7 >> 3);
  int v20 = v7 >> 3;
  if (v6 != v5)
  {
LABEL_6:
    uint64_t v9 = 0;
    if (v7 - 8 < 0x18) {
      goto LABEL_11;
    }
    if ((unint64_t)((char *)v8 - (char *)v6) < 0x20) {
      goto LABEL_11;
    }
    unint64_t v10 = ((v7 - 8) >> 3) + 1;
    uint64_t v9 = v10 & 0x3FFFFFFFFFFFFFFCLL;
    uint64_t v11 = v8 + 1;
    uint64_t v12 = (long long *)(v6 + 2);
    uint64_t v13 = v10 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v14 = *v12;
      *(v11 - 1) = *(v12 - 1);
      *uint64_t v11 = v14;
      v11 += 2;
      v12 += 2;
      v13 -= 4;
    }
    while (v13);
    v6 += v10 & 0x3FFFFFFFFFFFFFFCLL;
    if (v10 != v9)
    {
LABEL_11:
      uint64_t v15 = (void *)v8 + v9;
      do
      {
        uint64_t v16 = *v6++;
        *v15++ = v16;
      }
      while (v6 != v5);
    }
  }
LABEL_13:
  if (*a2 == a2[1])
  {
    sub_19E2ED438(a3, (uint64_t)&__p);
    if (__p)
    {
      uint64_t v18 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    sub_19E2ED438(a3, (uint64_t)&__p);
    __break(1u);
  }
}

void sub_19E2ED3FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E2ED41C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  sub_19E13A9BC(a1);
}

uint64_t sub_19E2ED438(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*a1 + 8);
  sub_19E29E624(a1[1], (uint64_t)v25);
  uint64_t v4 = v26;
  uint64_t v28 = 0;
  unsigned int v29 = 0;
  uint64_t v27 = 0;
  if (!v26)
  {
    int v30 = 0;
    goto LABEL_11;
  }
  if ((v26 & 0x80000000) != 0) {
    sub_19E13D694();
  }
  double v5 = (float64x2_t *)operator new(8 * (int)v26);
  uint64_t v27 = v5;
  unsigned int v29 = (char *)&v5->f64[(int)v4];
  bzero(v5, 8 * (int)v4);
  uint64_t v28 = (char *)&v5->f64[(int)v4];
  int v30 = v4;
  uint64_t v6 = (char *)v25[0];
  if (v4 < 8)
  {
    uint64_t v7 = 0;
LABEL_9:
    uint64_t v16 = v4 - v7;
    uint64_t v17 = v7 << 32;
    do
    {
      *(double *)((char *)v5->f64 + (v17 >> 29)) = (double)*(int *)&v6[v17 >> 30];
      v17 += 0x100000000;
      --v16;
    }
    while (v16);
    goto LABEL_11;
  }
  uint64_t v7 = v4 & 0xFFFFFFF8;
  uint64_t v8 = v5 + 2;
  uint64_t v9 = (char *)v25[0] + 16;
  uint64_t v10 = v7;
  do
  {
    long long v11 = *((_OWORD *)v9 - 1);
    v12.i64[0] = (int)v11;
    v12.i64[1] = SDWORD1(v11);
    float64x2_t v13 = vcvtq_f64_s64(v12);
    v12.i64[0] = SDWORD2(v11);
    v12.i64[1] = SHIDWORD(v11);
    float64x2_t v14 = vcvtq_f64_s64(v12);
    v12.i64[0] = (int)*(_OWORD *)v9;
    v12.i64[1] = (int)HIDWORD(*(void *)v9);
    float64x2_t v15 = vcvtq_f64_s64(v12);
    v12.i64[0] = (int)*((void *)v9 + 1);
    v12.i64[1] = (int)HIDWORD(*(_OWORD *)v9);
    v8[-2] = v13;
    v8[-1] = v14;
    *uint64_t v8 = v15;
    v8[1] = vcvtq_f64_s64(v12);
    v8 += 4;
    v9 += 32;
    v10 -= 8;
  }
  while (v10);
  if (v7 != v4) {
    goto LABEL_9;
  }
LABEL_11:
  sub_19E29FF68(a2, (uint64_t)&v27, (uint64_t)__p);
  double v18 = sub_19E2EBB38(*(void *)(v3 + 8), (uint64_t)__p);
  double v20 = sqrt(v19);
  if (v20 < 0.00000001 || (int v21 = *(_DWORD *)(*(void *)(v3 + 8) + 120), v21 <= 0))
  {
    double v22 = (*(double (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  else
  {
    if (*(_DWORD *)(v3 + 56) != v21) {
      (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
    (**(void (***)(uint64_t, double, double))v3)(v3, v18, v20);
  }
  double v23 = v22;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v27)
  {
    uint64_t v28 = (char *)v27;
    operator delete(v27);
  }
  if (v25[0])
  {
    v25[1] = v25[0];
    operator delete(v25[0]);
  }
  return *(void *)&v23;
}

void sub_19E2ED684(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p)
  {
    operator delete(__p);
    double v19 = a9;
    if (!a9) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    double v19 = a9;
    if (!a9) {
      goto LABEL_3;
    }
  }
  operator delete(v19);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E2ED704(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0A8678;
  uint64_t v2 = *(char ***)(a1 + 10696);
  if (v2)
  {
    uint64_t v3 = *(char ***)(a1 + 10704);
    uint64_t v4 = v2;
    if (v3 != v2)
    {
      do
        uint64_t v3 = sub_19E2470C8(v3 - 12);
      while (v3 != v2);
      uint64_t v4 = *(char ***)(a1 + 10696);
    }
    *(void *)(a1 + 10704) = v2;
    operator delete(v4);
  }
  std::random_device::~random_device((std::random_device *)(a1 + 10688));
  std::random_device::~random_device((std::random_device *)(a1 + 8144));
  std::random_device::~random_device((std::random_device *)(a1 + 5624));
  std::random_device::~random_device((std::random_device *)(a1 + 3096));
  uint64_t v5 = *(void *)(a1 + 584);
  *(void *)(a1 + 584) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(void *)(a1 + 504) = &unk_1EF0A7DE0;
  uint64_t v6 = *(void **)(a1 + 520);
  if (v6)
  {
    *(void *)(a1 + 528) = v6;
    operator delete(v6);
  }
  sub_19E2BEE60((void *)(a1 + 176));
  uint64_t v7 = *(void *)(a1 + 152);
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 160);
    uint64_t v9 = *(void **)(a1 + 152);
    if (v8 != v7)
    {
      uint64_t v10 = *(void *)(a1 + 160);
      do
      {
        int64x2_t v12 = *(void **)(v10 - 56);
        v10 -= 56;
        long long v11 = v12;
        if (v12)
        {
          *(void *)(v8 - 48) = v11;
          operator delete(v11);
        }
        uint64_t v8 = v10;
      }
      while (v10 != v7);
      uint64_t v9 = *(void **)(a1 + 152);
    }
    *(void *)(a1 + 160) = v7;
    operator delete(v9);
  }
  *(void *)a1 = &unk_1EF0A8318;
  sub_19E2934EC(a1 + 32);
  float64x2_t v13 = *(char ***)(a1 + 8);
  if (v13)
  {
    float64x2_t v14 = *(char ***)(a1 + 16);
    float64x2_t v15 = *(void **)(a1 + 8);
    if (v14 != v13)
    {
      do
        float64x2_t v14 = sub_19E2470C8(v14 - 13);
      while (v14 != v13);
      float64x2_t v15 = *(void **)(a1 + 8);
    }
    *(void *)(a1 + 16) = v13;
    operator delete(v15);
  }
  return a1;
}

void sub_19E2ED8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 96);
  int v6 = *(_DWORD *)(a1 + 120);
  int v7 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 120) = v6 + 1;
  *(_DWORD *)(a1 + 124) = v7;
  unint64_t v8 = v7 * (v6 + 1);
  unint64_t v9 = (*(void *)(a1 + 104) - v4) >> 3;
  if (v8 <= v9)
  {
    if (v8 < v9) {
      *(void *)(a1 + 104) = v4 + 8 * v8;
    }
  }
  else
  {
    sub_19E2482DC(a1 + 96, v8 - v9);
    int v6 = *(_DWORD *)(a1 + 120) - 1;
  }
  sub_19E29FAE8(a2, (uint64_t)__p);
  uint64_t v10 = *(int *)(a1 + 124);
  long long v11 = (char *)__p[0];
  if (!v10)
  {
    if (!__p[0]) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v12 = (int)v10 * (uint64_t)v6;
  uint64_t v13 = *v5;
  if (v10 >= 8 && (uint64_t v14 = 8 * v12 + v13, v14 - (unint64_t)__p[0] >= 0x20))
  {
    unint64_t v15 = v10 & 0xFFFFFFFFFFFFFFFCLL;
    double v20 = (long long *)((char *)__p[0] + 16);
    int v21 = (_OWORD *)(v14 + 16);
    unint64_t v22 = v10 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      long long v23 = *v20;
      *(v21 - 1) = *(v20 - 1);
      *int v21 = v23;
      v20 += 2;
      v21 += 2;
      v22 -= 4;
    }
    while (v22);
    if (v15 == v10) {
      goto LABEL_17;
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  uint64_t v16 = v10 - v15;
  uint64_t v17 = (void *)(v13 + 8 * (v15 + v12));
  double v18 = &v11[8 * v15];
  do
  {
    uint64_t v19 = *(void *)v18;
    v18 += 8;
    *v17++ = v19;
    --v16;
  }
  while (v16);
LABEL_17:
  __p[1] = v11;
  operator delete(v11);
LABEL_18:
  sub_19E2ED9FC(a1, 1, 1);
}

void sub_19E2ED9FC(uint64_t a1, int a2, int a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)(a1 + 128);
    uint64_t v4 = *(void *)(a1 + 128);
    int v6 = *(_DWORD *)(a1 + 120);
    *(_DWORD *)(a1 + 152) = v6;
    unint64_t v7 = (*(void *)(a1 + 136) - v4) >> 3;
    uint64_t v35 = v6;
    if (v6 <= v7)
    {
      if (v6 < v7) {
        *(void *)(a1 + 136) = v4 + 8 * v6;
      }
    }
    else
    {
      sub_19E2482DC(a1 + 128, v6 - v7);
      int v6 = *(_DWORD *)(a1 + 120);
      uint64_t v35 = v6;
    }
    if (v6)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = *(void *)(a1 + 96);
        signed int v11 = *(_DWORD *)(a1 + 124);
        double __C = 0;
        v41 = 0;
        uint64_t v42 = 0;
        if (v11) {
          break;
        }
        uint64_t v12 = 0;
        v37 = 0;
        uint64_t v38 = 0;
        __p = 0;
        unsigned int v39 = 0;
LABEL_26:
        double __C = 0;
        vDSP_meanvD(*(const double **)(a1 + 288), 1, (double *)&__C, *(int *)(a1 + 312));
        *(void *)(*v5 + 8 * v9) = __C;
        if (__p)
        {
          v37 = __p;
          operator delete(__p);
        }
        if (v12) {
          operator delete(v12);
        }
        ++v9;
        v8 += 8;
        if (v9 == v35) {
          goto LABEL_34;
        }
      }
      if (v11 < 0) {
        sub_19E13D694();
      }
      uint64_t v12 = operator new(8 * v11);
      bzero(v12, 8 * v11);
      if (v11 >= 8 && (unint64_t)v12 - v10 - 8 * v9 * v11 >= 0x20)
      {
        unint64_t v13 = v11 & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v28 = (long long *)(v10 + v8 * v11 + 16);
        unsigned int v29 = v12 + 1;
        unint64_t v30 = v13;
        do
        {
          long long v31 = *v28;
          *(v29 - 1) = *(v28 - 1);
          *unsigned int v29 = v31;
          v28 += 2;
          v29 += 2;
          v30 -= 4;
        }
        while (v30);
        if (v13 == v11)
        {
LABEL_16:
          __p = 0;
          v37 = 0;
          uint64_t v38 = 0;
          unsigned int v39 = v11;
          sub_19E2482DC((uint64_t)&__p, v11);
          uint64_t v19 = v39;
          if ((int)v39 >= 1)
          {
            uint64_t v20 = 0;
            int v21 = (char *)__p;
            if (v39 < 4) {
              goto LABEL_22;
            }
            if ((unint64_t)((unsigned char *)__p - (unsigned char *)v12) < 0x20) {
              goto LABEL_22;
            }
            unint64_t v22 = 0;
            uint64_t v20 = v39 & 0xFFFFFFFC;
            uint64_t v23 = (8 * v39) & 0x7FFFFFFE0;
            do
            {
              long long v24 = v12[v22 / 0x10 + 1];
              unsigned int v25 = &v21[v22];
              *(_OWORD *)unsigned int v25 = v12[v22 / 0x10];
              *((_OWORD *)v25 + 1) = v24;
              v22 += 32;
            }
            while (v23 != v22);
            if (v20 != v19)
            {
LABEL_22:
              uint64_t v26 = v19 - v20;
              uint64_t v27 = v20 << 32;
              do
              {
                *(void *)&v21[v27 >> 29] = *(void *)((char *)v12 + (v27 >> 29));
                v27 += 0x100000000;
                --v26;
              }
              while (v26);
            }
          }
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v13 = 0;
      }
      unint64_t v14 = v11 - v13;
      uint64_t v15 = 8 * v13;
      uint64_t v16 = (void *)v12 + v13;
      uint64_t v17 = (uint64_t *)(v10 + v15 + v8 * v11);
      do
      {
        uint64_t v18 = *v17++;
        *v16++ = v18;
        --v14;
      }
      while (v14);
      goto LABEL_16;
    }
  }
LABEL_34:
  sub_19E2EDD7C(a1 + 8, (uint64_t *)(a1 + 96), (uint64_t)&__C);
  if ((char **)(a1 + 160) != &__C) {
    sub_19E1E5B9C((void *)(a1 + 160), __C, v41, (v41 - __C) >> 3);
  }
  v32 = __C;
  *(void *)(a1 + 184) = v43;
  if (v32)
  {
    v41 = v32;
    operator delete(v32);
  }
  sub_19E2A4E4C(a1 + 160, (uint64_t)&__C);
  if ((char **)(a1 + 192) != &__C) {
    sub_19E1E5B9C((void *)(a1 + 192), __C, v41, (v41 - __C) >> 3);
  }
  v33 = __C;
  *(void *)(a1 + 216) = v43;
  if (v33)
  {
    v41 = v33;
    operator delete(v33);
  }
  sub_19E2EE24C(a1);
  if (a3) {
    sub_19E2EE470((int32x2_t *)a1);
  }
}

void sub_19E2EDD18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E2EDD7C(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *((unsigned int *)a2 + 6);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  if (!v4)
  {
    unint64_t v7 = 0;
    *(_DWORD *)(a3 + 24) = 0;
    *(_DWORD *)(a3 + 28) = 0;
LABEL_41:
    uint64_t v42 = (int)v4;
    if (v4) {
      goto LABEL_42;
    }
    return;
  }
  size_t v6 = 8 * (v4 * v4);
  unint64_t v7 = (char *)operator new(v6);
  *(void *)a3 = v7;
  *(void *)(a3 + 16) = &v7[v6];
  bzero(v7, v6);
  *(void *)(a3 + 8) = &v7[v6];
  *(_DWORD *)(a3 + 24) = v4;
  *(_DWORD *)(a3 + 28) = v4;
  if ((int)v4 <= 0) {
    goto LABEL_41;
  }
  uint64_t v52 = 0;
  uint64_t v8 = 0;
  uint64_t v55 = 1;
  uint64_t v48 = v4;
  uint64_t v50 = a1;
  do
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v49 = 8 * v8;
    uint64_t v54 = (int)v8 * v4;
    uint64_t v51 = v8;
    do
    {
      uint64_t v11 = *a2;
      signed int v12 = *((_DWORD *)a2 + 7);
      __p = 0;
      v61 = 0;
      v62 = 0;
      if (v12)
      {
        if (v12 < 0) {
          sub_19E13D694();
        }
        unint64_t v13 = v7;
        size_t v14 = 8 * v12;
        uint64_t v15 = operator new(v14);
        bzero(v15, v14);
        if (v12 < 8 || (unint64_t)v15 - v11 - v49 * v12 < 0x20)
        {
          unint64_t v16 = 0;
          goto LABEL_12;
        }
        unint64_t v16 = v12 & 0xFFFFFFFFFFFFFFFCLL;
        BOOL v34 = (long long *)(v11 + v52 * v12 + 16);
        uint64_t v35 = v15 + 1;
        unint64_t v36 = v16;
        do
        {
          long long v37 = *v34;
          *(v35 - 1) = *(v34 - 1);
          _OWORD *v35 = v37;
          v34 += 2;
          v35 += 2;
          v36 -= 4;
        }
        while (v36);
        if (v16 != v12)
        {
LABEL_12:
          unint64_t v17 = v12 - v16;
          uint64_t v18 = 8 * v16;
          uint64_t v19 = (void *)v15 + v16;
          uint64_t v20 = (uint64_t *)(v11 + v18 + v52 * v12);
          do
          {
            uint64_t v21 = *v20++;
            *v19++ = v21;
            --v17;
          }
          while (v17);
        }
        v56 = 0;
        v57 = 0;
        signed int v59 = 0;
        v58 = 0;
        v56 = operator new(8 * v12);
        v57 = (char *)v56 + v14;
        v58 = (char *)v56 + 8 * v12;
        signed int v59 = v12;
        memcpy(v56, v15, 8 * v12);
        unint64_t v22 = operator new(8 * v12);
        bzero(v22, 8 * v12);
        if (v12 < 8 || (unint64_t)v22 - v11 - 8 * v10 * v12 < 0x20)
        {
          unint64_t v23 = 0;
          goto LABEL_17;
        }
        unint64_t v23 = v12 & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v38 = (long long *)(v11 + v9 * v12 + 16);
        unsigned int v39 = v22 + 1;
        unint64_t v40 = v23;
        do
        {
          long long v41 = *v38;
          *(v39 - 1) = *(v38 - 1);
          *unsigned int v39 = v41;
          v38 += 2;
          v39 += 2;
          v40 -= 4;
        }
        while (v40);
        if (v23 != v12)
        {
LABEL_17:
          unint64_t v24 = v12 - v23;
          uint64_t v25 = 8 * v23;
          uint64_t v26 = (void *)v22 + v23;
          uint64_t v27 = (uint64_t *)(v11 + v25 + v9 * v12);
          do
          {
            uint64_t v28 = *v27++;
            *v26++ = v28;
            --v24;
          }
          while (v24);
        }
        __p = 0;
        v61 = 0;
        signed int v63 = 0;
        v62 = 0;
        uint64_t v29 = (int)v10;
        __p = operator new(8 * v12);
        v61 = (char *)__p + v14;
        v62 = (char *)__p + 8 * v12;
        signed int v63 = v12;
        memcpy(__p, v22, 8 * v12);
        unint64_t v7 = v13;
        a1 = v50;
        uint64_t v8 = v51;
        goto LABEL_21;
      }
      uint64_t v15 = 0;
      unint64_t v22 = 0;
      v57 = 0;
      v58 = 0;
      v56 = 0;
      signed int v59 = 0;
      uint64_t v29 = (int)v10;
      __p = 0;
      v61 = 0;
      signed int v63 = 0;
      v62 = 0;
LABEL_21:
      double v30 = sub_19E2EA5E4(a1, (uint64_t)&v56, (uint64_t)&__p);
      double v31 = *(double *)(a1 + 16);
      double v33 = (v30 + 1.0 + v32) * (exp(-v30) * v31);
      if (v8 == v10) {
        double v33 = v33 + *(double *)(a1 + 8) + 1.0e-10;
      }
      *(double *)&v7[8 * v29 + 8 * v54] = v33;
      if (__p)
      {
        v61 = (char *)__p;
        operator delete(__p);
      }
      if (v22) {
        operator delete(v22);
      }
      if (v56)
      {
        v57 = (char *)v56;
        operator delete(v56);
      }
      if (v15) {
        operator delete(v15);
      }
      ++v10;
      v9 += 8;
    }
    while (v10 != v55);
    ++v8;
    ++v55;
    v52 += 8;
    uint64_t v4 = v48;
  }
  while (v8 != v48);
  uint64_t v42 = v48;
LABEL_42:
  if (v42 != 1)
  {
    uint64_t v43 = 0;
    uint64_t v44 = 8 * v42;
    v45 = v7;
    do
    {
      if (v43)
      {
        uint64_t v46 = 0;
        v47 = v45;
        do
        {
          void *v47 = *(void *)&v7[8 * v46++];
          v47 = (void *)((char *)v47 + v44);
        }
        while (v43 != v46);
      }
      ++v43;
      ++v45;
      v7 += v44;
    }
    while (v43 != v42);
  }
}

void sub_19E2EE1B0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p) {
    operator delete(__p);
  }
  sub_19E13A9BC(a1);
}

void sub_19E2EE1D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p)
  {
    operator delete(__p);
    if (!v25)
    {
LABEL_3:
      uint64_t v28 = a18;
      if (!a18) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if (!v25)
  {
    goto LABEL_3;
  }
  operator delete(v25);
  uint64_t v28 = a18;
  if (!a18)
  {
LABEL_4:
    if (!v23) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  operator delete(v28);
  if (!v23)
  {
LABEL_5:
    *(void *)(v26 + 8) = v24;
    operator delete(v24);
    _Unwind_Resume(a1);
  }
LABEL_9:
  operator delete(v23);
  *(void *)(v26 + 8) = v24;
  operator delete(v24);
  _Unwind_Resume(a1);
}

void sub_19E2EE24C(uint64_t a1)
{
  sub_19E29F880(a1 + 192, (uint64_t)v22);
  uint64_t v2 = *(unsigned int *)(a1 + 216);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = 0;
    int v4 = *(_DWORD *)(a1 + 220);
    int v5 = v23;
    int v6 = 1;
    int v7 = -1;
    uint64_t v8 = v22[0];
    do
    {
      if (v4 <= v6) {
        int v9 = v6;
      }
      else {
        int v9 = v4;
      }
      int v10 = v3 + 1;
      if ((int)v3 + 1 >= v4) {
        goto LABEL_3;
      }
      unsigned int v11 = 0;
      int v12 = v9 + v7;
      uint64_t v13 = (int)v3 * (uint64_t)v5;
      if ((v9 + v7) < 4)
      {
        int v14 = v3 + 1;
      }
      else
      {
        int v14 = v3 + 1;
        if (v9 - (int)v3 + v6 - 2 >= v6)
        {
          int v15 = 0;
          unsigned int v11 = v12 & 0xFFFFFFFC;
          int v14 = v10 + (v12 & 0xFFFFFFFC);
          do
          {
            unint64_t v16 = &v8[v13 + v6 + v15];
            _OWORD *v16 = 0uLL;
            v16[1] = 0uLL;
            v15 += 4;
          }
          while ((v12 & 0xFFFFFFFC) != v15);
          if (v12 == v11) {
            goto LABEL_3;
          }
        }
      }
      unsigned int v17 = v9 - v11;
      do
      {
        v8[v13 + v14] = 0;
        int v14 = ++v11 + v10;
        --v17;
      }
      while (v6 != v17);
LABEL_3:
      ++v3;
      ++v6;
      --v7;
    }
    while (v3 != v2);
  }
  sub_19E2EE6D8(a1, (uint64_t)v18);
  sub_19E29F6FC((uint64_t)v22, (uint64_t)v18, (uint64_t)&__p);
  if ((void **)(a1 + 256) != &__p) {
    sub_19E1E5B9C((void *)(a1 + 256), (char *)__p, v20, (v20 - (unsigned char *)__p) >> 3);
  }
  *(_DWORD *)(a1 + 280) = v21;
  if (__p)
  {
    uint64_t v20 = (char *)__p;
    operator delete(__p);
  }
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }
  sub_19E29FC64((uint64_t)v22, &__p);
  sub_19E2A58A8((uint64_t)&__p, a1 + 256);
  if (__p)
  {
    uint64_t v20 = (char *)__p;
    operator delete(__p);
  }
  if (v22[0])
  {
    v22[1] = v22[0];
    operator delete(v22[0]);
  }
}

void sub_19E2EE40C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a9) {
    operator delete(a9);
  }
  if (a17) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E2EE470(int32x2_t *a1)
{
  uint64_t v2 = a1[15].u32[0];
  sub_19E242424(v2, v2, (uint64_t)&__p);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = v29.i32[1] + 1;
    int v4 = __p;
    if (v2 == 1)
    {
      uint64_t v5 = 0;
LABEL_7:
      uint64_t v8 = v2 - v5;
      uint64_t v9 = v5 << 32;
      do
      {
        v4[(v9 >> 32) * v3] = 0x3FF0000000000000;
        v9 += 0x100000000;
        --v8;
      }
      while (v8);
      goto LABEL_9;
    }
    uint64_t v6 = 0;
    uint64_t v5 = v2 & 0xFFFFFFFE;
    uint64_t v7 = v5;
    do
    {
      v4[(v6 >> 32) * v3] = 0x3FF0000000000000;
      v4[((v6 >> 32) | 1) * v3] = 0x3FF0000000000000;
      v6 += 0x200000000;
      v7 -= 2;
    }
    while (v7);
    if (v5 != v2) {
      goto LABEL_7;
    }
  }
LABEL_9:
  if (&a1[28] != (int32x2_t *)&__p) {
    sub_19E1E5B9C(&a1[28], (char *)__p, v28, (v28 - (unsigned char *)__p) >> 3);
  }
  int v10 = (char *)__p;
  a1[31] = v29;
  if (v10)
  {
    uint64_t v28 = v10;
    operator delete(v10);
  }
  sub_19E29F880((uint64_t)&a1[24], (uint64_t)&__p);
  uint64_t v11 = a1[27].u32[0];
  if ((int)v11 >= 1)
  {
    uint64_t v12 = 0;
    int v13 = a1[27].i32[1];
    __int32 v14 = v29.i32[1];
    int v15 = 1;
    int v16 = -1;
    unsigned int v17 = __p;
    do
    {
      if (v13 <= v15) {
        int v18 = v15;
      }
      else {
        int v18 = v13;
      }
      int v19 = v12 + 1;
      if ((int)v12 + 1 >= v13) {
        goto LABEL_15;
      }
      unsigned int v20 = 0;
      int v21 = v18 + v16;
      uint64_t v22 = (int)v12 * (uint64_t)v14;
      if ((v18 + v16) < 4)
      {
        int v23 = v12 + 1;
      }
      else
      {
        int v23 = v12 + 1;
        if (v18 - (int)v12 + v15 - 2 >= v15)
        {
          int v24 = 0;
          unsigned int v20 = v21 & 0xFFFFFFFC;
          int v23 = v19 + (v21 & 0xFFFFFFFC);
          do
          {
            uint64_t v25 = &v17[v22 + v15 + v24];
            _OWORD *v25 = 0uLL;
            v25[1] = 0uLL;
            v24 += 4;
          }
          while ((v21 & 0xFFFFFFFC) != v24);
          if (v21 == v20) {
            goto LABEL_15;
          }
        }
      }
      unsigned int v26 = v18 - v20;
      do
      {
        v17[v22 + v23] = 0;
        int v23 = ++v20 + v19;
        --v26;
      }
      while (v15 != v26);
LABEL_15:
      ++v12;
      ++v15;
      --v16;
    }
    while (v12 != v11);
  }
  sub_19E2A59C0((uint64_t)&__p, a1 + 28);
  if (__p)
  {
    uint64_t v28 = (char *)__p;
    operator delete(__p);
  }
  sub_19E29FC64((uint64_t)&a1[24], &__p);
  sub_19E2A59C0((uint64_t)&__p, a1 + 28);
  if (__p)
  {
    uint64_t v28 = (char *)__p;
    operator delete(__p);
  }
}

void sub_19E2EE6B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E2EE6D8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  signed int v4 = *(_DWORD *)(a1 + 312);
  uint64_t v5 = 8 * v4;
  if (v4)
  {
    if (v4 < 0) {
      sub_19E13D694();
    }
    uint64_t v6 = (char *)operator new(8 * v4);
    bzero(v6, 8 * v4);
    unint64_t v7 = 0;
    uint64_t v8 = &v6[v5];
    uint64_t v9 = *(void *)(a1 + 288);
    if (v4 < 4) {
      goto LABEL_48;
    }
    if ((unint64_t)&v6[-v9] < 0x20) {
      goto LABEL_48;
    }
    uint64_t v10 = 0;
    unint64_t v7 = v4 & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v11 = v7;
    do
    {
      long long v12 = *(_OWORD *)(v9 + v10 + 16);
      int v13 = &v6[v10];
      *(_OWORD *)int v13 = *(_OWORD *)(v9 + v10);
      *((_OWORD *)v13 + 1) = v12;
      v10 += 32;
      v11 -= 4;
    }
    while (v11);
    if (v7 != v4)
    {
LABEL_48:
      do
      {
        *(void *)&v6[8 * v7] = *(void *)(v9 + 8 * v7);
        ++v7;
      }
      while (v4 != v7);
    }
    uint64_t v14 = *(int *)(a1 + 152);
    if (v14) {
      goto LABEL_10;
    }
LABEL_19:
    int v15 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  uint64_t v14 = *(int *)(a1 + 152);
  if (!v14) {
    goto LABEL_19;
  }
LABEL_10:
  if ((v14 & 0x80000000) != 0) {
    sub_19E13D694();
  }
  int v15 = (char *)operator new(8 * v14);
  bzero(v15, 8 * v14);
  unint64_t v16 = 0;
  uint64_t v17 = *(void *)(a1 + 128);
  if (v14 < 4) {
    goto LABEL_49;
  }
  if ((unint64_t)&v15[-v17] < 0x20) {
    goto LABEL_49;
  }
  uint64_t v18 = 0;
  unint64_t v16 = v14 & 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v19 = v14 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    long long v20 = *(_OWORD *)(v17 + v18 + 16);
    int v21 = &v15[v18];
    *(_OWORD *)int v21 = *(_OWORD *)(v17 + v18);
    *((_OWORD *)v21 + 1) = v20;
    v18 += 32;
    v19 -= 4;
  }
  while (v19);
  if (v16 != v14)
  {
LABEL_49:
    do
    {
      *(void *)&v15[8 * v16] = *(void *)(v17 + 8 * v16);
      ++v16;
    }
    while (v14 != v16);
  }
LABEL_20:
  vDSP_vsubD((const double *)v15, 1, (const double *)v6, 1, (double *)v6, 1, v4);
  if (v8 != v6)
  {
    if (v8 - v6 < 0) {
      sub_19E13D694();
    }
    uint64_t v22 = (char *)operator new(v8 - v6);
    memcpy(v22, v6, v8 - v6);
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(void *)a2 = 0;
    if (!v4)
    {
      *(_DWORD *)(a2 + 24) = 0;
      operator delete(v22);
      if (!v15) {
        goto LABEL_35;
      }
LABEL_34:
      operator delete(v15);
      goto LABEL_35;
    }
LABEL_26:
    if (v4 < 0) {
      sub_19E13D694();
    }
    int v23 = (char *)operator new(8 * v4);
    *(void *)a2 = v23;
    *(void *)(a2 + 16) = &v23[8 * v4];
    bzero(v23, 8 * v4);
    *(void *)(a2 + 8) = &v23[v5];
    *(_DWORD *)(a2 + 24) = v4;
    if (v4 >= 4)
    {
      uint64_t v25 = 0;
      unint64_t v24 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v26 = v24;
      do
      {
        long long v27 = *(_OWORD *)&v22[v25 + 16];
        uint64_t v28 = &v23[v25];
        *(_OWORD *)uint64_t v28 = *(_OWORD *)&v22[v25];
        *((_OWORD *)v28 + 1) = v27;
        v25 += 32;
        v26 -= 4;
      }
      while (v26);
      if (v24 == v4)
      {
LABEL_33:
        operator delete(v22);
        if (!v15) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }
    else
    {
      unint64_t v24 = 0;
    }
    do
    {
      *(void *)&v23[8 * v24] = *(void *)&v22[8 * v24];
      ++v24;
    }
    while (v4 != v24);
    goto LABEL_33;
  }
  uint64_t v22 = 0;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  if (v4) {
    goto LABEL_26;
  }
  *(_DWORD *)(a2 + 24) = 0;
  if (v15) {
    goto LABEL_34;
  }
LABEL_35:
  if (v6)
  {
    operator delete(v6);
  }
}

void sub_19E2EEA10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (v19)
  {
    operator delete(v19);
    if (!v18) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if (!v18)
  {
    goto LABEL_3;
  }
  operator delete(v18);
  _Unwind_Resume(exception_object);
}

void sub_19E2EEA74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  if (a9) {
    operator delete(a9);
  }
  sub_19E13A9BC(a1);
}

void sub_19E2EEA88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a13) {
    JUMPOUT(0x19E2EEA98);
  }
  JUMPOUT(0x19E2EEA9CLL);
}

void sub_19E2EEAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = a2;
  sub_19E2A099C((uint64_t)&v31, *(_DWORD *)(a2 + 8) + 1);
  sub_19E248FE0((uint64_t)v29, *(_DWORD *)(a2 + 8) + 1);
  uint64_t v3 = (char *)v29[0];
  *(void *)v29[0] = 0xC01E000000000000;
  signed int v4 = (char *)__p[0];
  *(void *)__p[0] = 0x401E000000000000;
  uint64_t v5 = *(unsigned int *)(a2 + 56);
  if ((int)v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 1;
    if (v5 < 6) {
      goto LABEL_7;
    }
    if ((unint64_t)(v4 - v3) < 0x20) {
      goto LABEL_7;
    }
    uint64_t v6 = v5 & 0x7FFFFFFC;
    uint64_t v7 = v5 & 0xFFFFFFFC | 1;
    uint64_t v8 = v4 + 24;
    uint64_t v9 = v3 + 24;
    __asm
    {
      FMOV            V0.2D, #-10.0
      FMOV            V1.2D, #10.0
    }
    uint64_t v16 = v5 & 0xFFFFFFFC;
    do
    {
      *(v9 - 1) = _Q0;
      _OWORD *v9 = _Q0;
      *(v8 - 1) = _Q1;
      *uint64_t v8 = _Q1;
      v8 += 2;
      v9 += 2;
      v16 -= 4;
    }
    while (v16);
    if (v6 != v5)
    {
LABEL_7:
      uint64_t v17 = v5 - v6;
      uint64_t v18 = &v4[8 * v7];
      unint64_t v19 = &v3[8 * v7];
      do
      {
        *(void *)unint64_t v19 = 0xC024000000000000;
        v19 += 8;
        *(void *)uint64_t v18 = 0x4024000000000000;
        v18 += 8;
        --v17;
      }
      while (v17);
    }
  }
  sub_19E2A16E8((uint64_t)&v31, (uint64_t *)v29);
  sub_19E2A1818((uint64_t)&v31, (uint64_t *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v29[0])
  {
    v29[1] = v29[0];
    operator delete(v29[0]);
  }
  int v21 = *(unsigned char **)(a2 + 64);
  long long v20 = *(unsigned char **)(a2 + 72);
  uint64_t v25 = 0;
  unint64_t v26 = 0;
  long long v27 = 0;
  int64_t v22 = v20 - v21;
  if (v20 != v21)
  {
    if (v22 < 0) {
      sub_19E13D694();
    }
    int v23 = (char *)operator new(v20 - v21);
    unint64_t v24 = &v23[8 * (v22 >> 3)];
    uint64_t v25 = v23;
    long long v27 = v24;
    memcpy(v23, v21, v22);
    unint64_t v26 = v24;
  }
  int v28 = *(_DWORD *)(a2 + 88);
  sub_19E2EEE48((uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v25);
}

void sub_19E2EEDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  if (__p)
  {
    operator delete(__p);
    sub_19E2A0A3C(&a29);
    _Unwind_Resume(a1);
  }
  sub_19E2A0A3C(&a29);
  _Unwind_Resume(a1);
}

void sub_19E2EEE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
}

void sub_19E2EEE48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 112)) {
    (**(void (***)(uint64_t, void))a1)(a1, *(unsigned int *)(a3 + 24));
  }
  operator new();
}

void sub_19E2EF2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  __cxa_free_exception(v15);
  if (a2 != 3)
  {
    if (a2 == 2)
    {
      unint64_t v19 = __cxa_begin_catch(a1);
      (*(void (**)(void *))(*(void *)v19 + 16))(v19);
      sub_19E29FAE8(v14, (uint64_t)&a13);
      if (a13)
      {
        a14 = (uint64_t)a13;
        operator delete(a13);
      }
      __cxa_end_catch();
LABEL_13:
      JUMPOUT(0x19E2EF0C4);
    }
    if (a2 != 1)
    {
      if (__p) {
        operator delete(__p);
      }
      _Unwind_Resume(a1);
    }
  }
  uint64_t v18 = __cxa_begin_catch(a1);
  (*(void (**)(void *))(*(void *)v18 + 16))(v18);
  __cxa_end_catch();
  goto LABEL_13;
}

double sub_19E2EF42C(uint64_t **a1, uint64_t *a2, int **a3)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  unint64_t v7 = (char *)v5 - (char *)*a1;
  long long v41 = 0;
  uint64_t v42 = 0;
  unint64_t v40 = 0;
  int v43 = 0;
  double v33 = 0.0;
  __p = 0;
  uint64_t v35 = 0;
  if (!(v7 >> 3))
  {
    uint64_t v8 = 0;
    unint64_t v40 = 0;
    long long v41 = 0;
    uint64_t v42 = 0;
    int v43 = v7 >> 3;
    if (v6 == v5) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  if (((v7 >> 3) & 0x80000000) != 0) {
    sub_19E13D694();
  }
  uint64_t v8 = operator new((uint64_t)(v7 << 29) >> 29);
  bzero(v8, (uint64_t)(v7 << 29) >> 29);
  unint64_t v40 = v8;
  long long v41 = (char *)v8 + ((uint64_t)(v7 << 29) >> 29);
  uint64_t v42 = (char *)v8 + 8 * (int)((uint64_t)v7 >> 3);
  int v43 = v7 >> 3;
  if (v6 != v5)
  {
LABEL_6:
    uint64_t v9 = 0;
    if (v7 - 8 < 0x18) {
      goto LABEL_11;
    }
    if ((unint64_t)((char *)v8 - (char *)v6) < 0x20) {
      goto LABEL_11;
    }
    unint64_t v10 = ((v7 - 8) >> 3) + 1;
    uint64_t v9 = v10 & 0x3FFFFFFFFFFFFFFCLL;
    unint64_t v11 = v8 + 1;
    long long v12 = (long long *)(v6 + 2);
    uint64_t v13 = v10 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v14 = *v12;
      *(v11 - 1) = *(v12 - 1);
      *unint64_t v11 = v14;
      v11 += 2;
      v12 += 2;
      v13 -= 4;
    }
    while (v13);
    v6 += v10 & 0x3FFFFFFFFFFFFFFCLL;
    if (v10 != v9)
    {
LABEL_11:
      int v15 = (void *)v8 + v9;
      do
      {
        uint64_t v16 = *v6++;
        *v15++ = v16;
      }
      while (v6 != v5);
    }
  }
LABEL_13:
  if (*a2 == a2[1])
  {
    sub_19E2EF724(a3, (uint64_t)&v40, 0, (uint64_t)&v33);
    double v17 = v33;
    if (v36)
    {
      uint64_t v31 = __p;
      if (__p)
      {
        uint64_t v35 = __p;
        goto LABEL_31;
      }
    }
  }
  else
  {
    LOBYTE(v37[0]) = 0;
    char v39 = 0;
    sub_19E2EF724(a3, (uint64_t)&v40, 1, (uint64_t)&v33);
    double v17 = v33;
    sub_19E2A7CB8((uint64_t)v37, (uint64_t)&__p);
    if (v36 && __p)
    {
      uint64_t v35 = __p;
      operator delete(__p);
    }
    uint64_t v18 = v38;
    if (v38)
    {
      unint64_t v19 = 0;
      uint64_t v20 = v37[0];
      uint64_t v21 = *a2;
      if (v38 < 4) {
        goto LABEL_23;
      }
      if ((unint64_t)(v21 - v37[0]) < 0x20) {
        goto LABEL_23;
      }
      unint64_t v19 = v38 & 0xFFFFFFFFFFFFFFFCLL;
      int64_t v22 = (long long *)(v37[0] + 16);
      int v23 = (_OWORD *)(v21 + 16);
      unint64_t v24 = v19;
      do
      {
        long long v25 = *v22;
        *(v23 - 1) = *(v22 - 1);
        _OWORD *v23 = v25;
        v22 += 2;
        v23 += 2;
        v24 -= 4;
      }
      while (v24);
      if (v19 != v18)
      {
LABEL_23:
        uint64_t v26 = v18 - v19;
        uint64_t v27 = 8 * v19;
        int v28 = (void *)(v21 + 8 * v19);
        int32x2_t v29 = (uint64_t *)(v20 + v27);
        do
        {
          uint64_t v30 = *v29++;
          *v28++ = v30;
          --v26;
        }
        while (v26);
      }
    }
    if (v39)
    {
      uint64_t v31 = (void *)v37[0];
      if (v37[0])
      {
        v37[1] = v37[0];
LABEL_31:
        operator delete(v31);
      }
    }
  }
  if (v40)
  {
    long long v41 = (char *)v40;
    operator delete(v40);
  }
  return v17;
}

void sub_19E2EF6AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,void *__p,uint64_t a22)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E2EF708(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  sub_19E13A9BC(a1);
}

void *sub_19E2EF724@<X0>(int **a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  sub_19E2F08C8((uint64_t)&v31, *a1);
  if (v35 != (void *)a2) {
    sub_19E1E5B9C(v35, *(char **)a2, *(char **)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  }
  int v36 = *(_DWORD *)(a2 + 24);
  unint64_t v7 = *(char **)a2;
  long double v33 = exp(*(double *)v7 + *(double *)v7);
  unint64_t v8 = v32;
  if (v32)
  {
    uint64_t v9 = v34;
    if (v32 < 4 || (unint64_t)(v34 - v7 - 8) < 0x10)
    {
      unint64_t v10 = 0;
LABEL_7:
      unint64_t v11 = (double *)&v7[8 * v10 + 8];
      long long v12 = (long double *)&v9[8 * v10];
      unint64_t v13 = v8 - v10;
      do
      {
        long double v14 = *v11++;
        *v12++ = exp(v14);
        --v13;
      }
      while (v13);
      goto LABEL_9;
    }
    unint64_t v10 = v32 & 0xFFFFFFFFFFFFFFFELL;
    int64_t v22 = (long long *)(v7 + 8);
    unint64_t v23 = v32 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v24 = v34;
    do
    {
      long long v25 = *v22++;
      long double v27 = exp(*((long double *)&v25 + 1));
      *(double *)&long long v26 = exp(*(long double *)&v25);
      *((long double *)&v26 + 1) = v27;
      *(_OWORD *)unint64_t v24 = v26;
      v24 += 16;
      v23 -= 2;
    }
    while (v23);
    if (v8 != v10) {
      goto LABEL_7;
    }
  }
LABEL_9:
  sub_19E2ED9FC((uint64_t)&v31, 0, a3);
  double v15 = sub_19E2EF9A0((uint64_t)&v31);
  double v16 = v15;
  if (a3)
  {
    sub_19E2EFBD0((uint64_t)&v31, (uint64_t)&v28);
    *(void *)(a4 + 8) = 0;
    *(double *)a4 = v16;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = 0;
    double v17 = v28;
    int64_t v18 = v29 - v28;
    if (v29 != v28)
    {
      if (v18 < 0) {
        sub_19E13D694();
      }
      unint64_t v19 = (char *)operator new(v29 - v28);
      *(void *)(a4 + 8) = v19;
      uint64_t v20 = &v19[8 * (v18 >> 3)];
      *(void *)(a4 + 24) = v20;
      memcpy(v19, v17, v18);
      *(void *)(a4 + 16) = v20;
    }
    *(_DWORD *)(a4 + 32) = v30;
    *(unsigned char *)(a4 + 40) = 1;
    if (v17)
    {
      int32x2_t v29 = v17;
      operator delete(v17);
    }
  }
  else
  {
    *(double *)a4 = v15;
    *(unsigned char *)(a4 + 8) = 0;
    *(unsigned char *)(a4 + 40) = 0;
  }
  return sub_19E2BEE60(&v31);
}

void sub_19E2EF918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  sub_19E2BEE60((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19E2EF92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v21 = *v19;
  if (*v19)
  {
    *(void *)(v18 + 16) = v21;
    operator delete(v21);
    int64_t v22 = __p;
    if (!__p)
    {
LABEL_3:
      sub_19E2BEE60(&a18);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    int64_t v22 = __p;
    if (!__p) {
      goto LABEL_3;
    }
  }
  operator delete(v22);
  sub_19E2BEE60(&a18);
  _Unwind_Resume(a1);
}

void sub_19E2EF978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  sub_19E2BEE60((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19E2EF98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  sub_19E2BEE60((uint64_t *)va);
  _Unwind_Resume(a1);
}

double sub_19E2EF9A0(uint64_t a1)
{
  sub_19E2EE6D8(a1, (uint64_t)&__A);
  __C[0] = 0;
  vDSP_dotprD(__A, 1, *(const double **)(a1 + 256), 1, (double *)__C, (int)__N);
  uint64_t v2 = __C[0];
  if (__A)
  {
    double v17 = __A;
    operator delete(__A);
  }
  uint64_t v3 = *(int *)(a1 + 220);
  if ((int)v3 >= *(_DWORD *)(a1 + 216)) {
    int v4 = *(_DWORD *)(a1 + 216);
  }
  else {
    int v4 = *(_DWORD *)(a1 + 220);
  }
  __A = 0;
  double v17 = 0;
  uint64_t v18 = 0;
  if (v4)
  {
    if (v4 < 0) {
      sub_19E13D694();
    }
    uint64_t v5 = operator new(8 * v4);
    bzero(v5, 8 * v4);
    uint64_t v6 = 0;
    unint64_t v7 = *(void **)(a1 + 192);
    do
    {
      *((void *)v5 + v6++) = *v7;
      v7 += v3 + 1;
    }
    while (v4 != v6);
    __p = operator new(8 * v4);
    unint64_t v11 = (char *)__p + 8 * v4;
    long long v12 = v11;
    int v13 = v4;
    memcpy(__p, v5, 8 * v4);
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v11 = 0;
    long long v12 = 0;
    __p = 0;
    int v13 = 0;
  }
  sub_19E2A7AC4((uint64_t)&__p, (uint64_t)__C);
  __A = 0;
  vDSP_sveD((const double *)__C[0], 1, (double *)&__A, (int)v15);
  unint64_t v8 = __A;
  if (__C[0])
  {
    __C[1] = __C[0];
    operator delete(__C[0]);
  }
  if (__p)
  {
    unint64_t v11 = (char *)__p;
    operator delete(__p);
  }
  if (v5) {
    operator delete(v5);
  }
  return (double)*(int *)(a1 + 120) * -0.918938533 - (*(double *)&v8 - *(double *)&v2 * -0.5);
}

void sub_19E2EFB48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (__p)
  {
    operator delete(__p);
    uint64_t v20 = a9;
    if (!a9)
    {
LABEL_3:
      if (!v18) {
LABEL_8:
      }
        _Unwind_Resume(exception_object);
LABEL_7:
      operator delete(v18);
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v20 = a9;
    if (!a9) {
      goto LABEL_3;
    }
  }
  operator delete(v20);
  if (!v18) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void sub_19E2EFBB4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  sub_19E13A9BC(a1);
}

void sub_19E2EFBD0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v121 = 0;
  v122 = 0;
  v123 = 0;
  uint64_t v3 = *(unsigned char **)(a1 + 224);
  uint64_t v2 = *(unsigned char **)(a1 + 232);
  int64_t v4 = v2 - v3;
  if (v2 != v3)
  {
    if (v4 < 0) {
      sub_19E13D694();
    }
    uint64_t v5 = (double *)operator new(v2 - v3);
    uint64_t v6 = &v5[v4 >> 3];
    v121 = v5;
    v123 = v6;
    memcpy(v5, v3, v4);
    v122 = v6;
  }
  unint64_t v7 = *(unsigned char **)(a1 + 256);
  unint64_t v124 = *(void *)(a1 + 248);
  v106 = 0;
  v107 = 0;
  v105 = 0;
  unint64_t v8 = *(unsigned char **)(a1 + 264);
  int64_t v9 = v8 - v7;
  if (v8 != v7)
  {
    if (v9 < 0) {
      sub_19E13D694();
    }
    unint64_t v10 = (char *)operator new(v8 - v7);
    unint64_t v11 = &v10[8 * (v9 >> 3)];
    v105 = v10;
    v107 = v11;
    memcpy(v10, v7, v9);
    v106 = v11;
  }
  int v108 = *(_DWORD *)(a1 + 280);
  sub_19E29FAE8(a1 + 256, (uint64_t)&v101);
  sub_19E2A7BA8((uint64_t)&v105, (uint64_t)&v101, (uint64_t)&__p);
  v113 = 0;
  v114 = 0;
  v115 = 0;
  long long v12 = __p;
  int64_t v13 = v110 - (unsigned char *)__p;
  if (v110 == __p)
  {
    vDSP_Length v15 = 0;
    long double v14 = 0;
  }
  else
  {
    if (v13 < 0) {
      sub_19E13D694();
    }
    long double v14 = (char *)operator new(v110 - (unsigned char *)__p);
    vDSP_Length v15 = &v14[8 * (v13 >> 3)];
    v113 = v14;
    v115 = v15;
    memcpy(v14, v12, v13);
    v114 = v15;
  }
  unint64_t v16 = v112;
  unint64_t v116 = v112;
  unint64_t v17 = HIDWORD(v112);
  vDSP_Length v18 = HIDWORD(v112) * (int)v112;
  vDSP_vsubD(v121, 1, (const double *)v14, 1, (double *)v14, 1, v18);
  v117 = 0;
  v118 = 0;
  v119 = 0;
  int64_t v19 = v15 - v14;
  if (!v19)
  {
    uint64_t v20 = 0;
    unint64_t v120 = v16;
    v126 = 0;
    v127 = 0;
    v125 = 0;
    if (v18) {
      goto LABEL_14;
    }
LABEL_18:
    int64_t v22 = 0;
    uint64_t v21 = 0;
    unint64_t v128 = __PAIR64__(v17, v16);
    goto LABEL_23;
  }
  if (v19 < 0) {
    sub_19E13D694();
  }
  uint64_t v20 = (char *)operator new(v19);
  v117 = v20;
  v119 = &v20[8 * (v19 >> 3)];
  memcpy(v20, v14, v19);
  v118 = &v20[8 * (v19 >> 3)];
  unint64_t v120 = v16;
  v126 = 0;
  v127 = 0;
  v125 = 0;
  if (!v18) {
    goto LABEL_18;
  }
LABEL_14:
  if ((v18 & 0x80000000) != 0) {
    sub_19E13D694();
  }
  uint64_t v21 = (char *)operator new(8 * v18);
  v125 = v21;
  v127 = &v21[8 * v18];
  bzero(v21, 8 * v18);
  int64_t v22 = &v21[8 * v18];
  unint64_t v128 = __PAIR64__(v17, v16);
  if (v18 < 4)
  {
    for (unint64_t i = 0; i != v18; ++i)
LABEL_22:
      *(void *)&v21[8 * i] = *(void *)&v20[8 * i];
    goto LABEL_23;
  }
  uint64_t v24 = 0;
  unint64_t i = v18 & 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v25 = v18 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    long long v26 = *(_OWORD *)&v20[v24 + 16];
    long double v27 = &v21[v24];
    *(_OWORD *)long double v27 = *(_OWORD *)&v20[v24];
    *((_OWORD *)v27 + 1) = v26;
    v24 += 32;
    v25 -= 4;
  }
  while (v25);
  if (i != v18) {
    goto LABEL_22;
  }
LABEL_23:
  sub_19E1E5B9C(&v121, v21, v22, (v22 - v21) >> 3);
  unint64_t v124 = v128;
  if (v21)
  {
    v126 = v21;
    operator delete(v21);
  }
  if (v20)
  {
    v118 = v20;
    operator delete(v20);
  }
  if (v14)
  {
    v114 = v14;
    operator delete(v14);
  }
  if (__p)
  {
    v110 = __p;
    operator delete(__p);
  }
  if (v101)
  {
    v102 = (char *)v101;
    operator delete(v101);
  }
  if (v105)
  {
    v106 = v105;
    operator delete(v105);
  }
  int v28 = *(_DWORD *)(a1 + 8);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  vDSP_Length v98 = v28 + 1;
  if (v28 == -1)
  {
    *(_DWORD *)(a2 + 24) = 0;
    uint64_t v96 = *(int *)(a1 + 120);
    if (!v96) {
      goto LABEL_125;
    }
    goto LABEL_40;
  }
  if (v28 <= -2) {
    sub_19E13D694();
  }
  int32x2_t v29 = (char *)operator new(8 * v98);
  *(void *)a2 = v29;
  *(void *)(a2 + 8) = &v29[8 * v98];
  *(void *)(a2 + 16) = &v29[8 * v28 + 8];
  *(_DWORD *)(a2 + 24) = v28 + 1;
  bzero(v29, 8 * v98);
  uint64_t v96 = *(int *)(a1 + 120);
  if (v96)
  {
LABEL_40:
    uint64_t v97 = 0;
    for (unint64_t j = 0; j != v96; ++j)
    {
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      do
      {
        uint64_t v33 = *(void *)(a1 + 96);
        uint64_t v34 = *(unsigned int *)(a1 + 124);
        v125 = 0;
        v126 = 0;
        v127 = 0;
        if (!v34)
        {
          uint64_t v35 = 0;
          v110 = 0;
          v111 = 0;
          __p = 0;
          LODWORD(v112) = 0;
LABEL_72:
          uint64_t v52 = 0;
          v102 = 0;
          v103 = 0;
          v101 = 0;
          int v104 = 0;
          goto LABEL_76;
        }
        if ((v34 & 0x80000000) != 0) {
          sub_19E13D694();
        }
        uint64_t v35 = operator new(8 * (int)v34);
        bzero(v35, 8 * (int)v34);
        if (v34 < 8 || (unint64_t)v35 - v33 - 8 * j * (int)v34 < 0x20)
        {
          unint64_t v36 = 0;
LABEL_49:
          unint64_t v37 = (int)v34 - v36;
          uint64_t v38 = 8 * v36;
          char v39 = (void *)v35 + v36;
          unint64_t v40 = (uint64_t *)(v33 + v38 + v97 * (int)v34);
          do
          {
            uint64_t v41 = *v40++;
            *v39++ = v41;
            --v37;
          }
          while (v37);
          goto LABEL_51;
        }
        unint64_t v36 = (int)v34 & 0xFFFFFFFFFFFFFFFCLL;
        v88 = (long long *)(v33 + v97 * (int)v34 + 16);
        v89 = v35 + 1;
        unint64_t v90 = v36;
        do
        {
          long long v91 = *v88;
          *(v89 - 1) = *(v88 - 1);
          _OWORD *v89 = v91;
          v88 += 2;
          v89 += 2;
          v90 -= 4;
        }
        while (v90);
        if (v36 != (int)v34) {
          goto LABEL_49;
        }
LABEL_51:
        __p = 0;
        v110 = 0;
        v111 = 0;
        LODWORD(v112) = v34;
        uint64_t v42 = operator new(8 * (int)v34);
        bzero(v42, 8 * (int)v34);
        __p = v42;
        v110 = (char *)v42 + 8 * (int)v34;
        v111 = v110;
        if ((v34 - 6) >= 0x7FFFFFFB)
        {
          uint64_t v43 = 0;
LABEL_58:
          uint64_t v48 = v34 - v43;
          uint64_t v49 = v43 << 32;
          do
          {
            *(void *)((char *)v42 + (v49 >> 29)) = *(void *)((char *)v35 + (v49 >> 29));
            v49 += 0x100000000;
            --v48;
          }
          while (v48);
          goto LABEL_60;
        }
        uint64_t v43 = v34 & 0xFFFFFFFC;
        uint64_t v44 = v42 + 1;
        v45 = v35 + 1;
        uint64_t v46 = v43;
        do
        {
          long long v47 = *v45;
          *(v44 - 1) = *(v45 - 1);
          *uint64_t v44 = v47;
          v44 += 2;
          v45 += 2;
          v46 -= 4;
        }
        while (v46);
        if (v43 != v34) {
          goto LABEL_58;
        }
LABEL_60:
        uint64_t v50 = *(void *)(a1 + 96);
        uint64_t v51 = *(unsigned int *)(a1 + 124);
        v125 = 0;
        v126 = 0;
        v127 = 0;
        if (!v51) {
          goto LABEL_72;
        }
        if ((v51 & 0x80000000) != 0) {
          sub_19E13D694();
        }
        uint64_t v52 = operator new(8 * (int)v51);
        bzero(v52, 8 * (int)v51);
        if (v51 < 8 || (unint64_t)v52 - v50 - 8 * v32 * (int)v51 < 0x20)
        {
          unint64_t v53 = 0;
LABEL_65:
          unint64_t v54 = (int)v51 - v53;
          uint64_t v55 = 8 * v53;
          v56 = (void *)v52 + v53;
          v57 = (uint64_t *)(v50 + v55 + v31 * (int)v51);
          do
          {
            uint64_t v58 = *v57++;
            *v56++ = v58;
            --v54;
          }
          while (v54);
          goto LABEL_67;
        }
        unint64_t v53 = (int)v51 & 0xFFFFFFFFFFFFFFFCLL;
        v92 = (long long *)(v50 + v31 * (int)v51 + 16);
        v93 = v52 + 1;
        unint64_t v94 = v53;
        do
        {
          long long v95 = *v92;
          *(v93 - 1) = *(v92 - 1);
          _OWORD *v93 = v95;
          v92 += 2;
          v93 += 2;
          v94 -= 4;
        }
        while (v94);
        if (v53 != (int)v51) {
          goto LABEL_65;
        }
LABEL_67:
        v101 = 0;
        v102 = 0;
        v103 = 0;
        int v104 = v51;
        signed int v59 = (char *)operator new(8 * (int)v51);
        bzero(v59, 8 * (int)v51);
        v101 = v59;
        v102 = &v59[8 * (int)v51];
        v103 = v102;
        if ((v51 - 6) >= 0x7FFFFFFB)
        {
          uint64_t v61 = 0;
LABEL_74:
          uint64_t v64 = v51 - v61;
          uint64_t v65 = v61 << 32;
          do
          {
            *(void *)&v59[v65 >> 29] = *(void *)((char *)v52 + (v65 >> 29));
            v65 += 0x100000000;
            --v64;
          }
          while (v64);
          goto LABEL_76;
        }
        unint64_t v60 = 0;
        uint64_t v61 = v51 & 0xFFFFFFFC;
        do
        {
          long long v62 = v52[v60 / 0x10 + 1];
          signed int v63 = &v59[v60];
          *(_OWORD *)signed int v63 = v52[v60 / 0x10];
          *((_OWORD *)v63 + 1) = v62;
          v60 += 32;
        }
        while (((8 * v51) & 0x7FFFFFFE0) != v60);
        if (v61 != v51) {
          goto LABEL_74;
        }
LABEL_76:
        sub_19E2F0E00(a1 + 8, (uint64_t)&__p, (const double **)&v101, (uint64_t)&v117);
        if (v101)
        {
          v102 = (char *)v101;
          operator delete(v101);
        }
        if (v52) {
          operator delete(v52);
        }
        if (__p)
        {
          v110 = __p;
          operator delete(__p);
        }
        if (v35) {
          operator delete(v35);
        }
        if (j == v32)
        {
          uint64_t v66 = SHIDWORD(v124);
          v67 = v121;
          v68 = v117;
          int64_t v69 = v118 - v117;
          if (v118 == v117)
          {
            v71 = 0;
            v70 = 0;
          }
          else
          {
            if (v69 < 0) {
              sub_19E13D694();
            }
            v70 = (char *)operator new(v118 - v117);
            v71 = &v70[8 * (v69 >> 3)];
            memcpy(v70, v68, v69);
          }
          v77 = &v67[j + j * v66];
          int v78 = v120;
          vDSP_vsmulD((const double *)v70, 1, v77, (double *)v70, 1, (int)v120);
          int64_t v79 = v71 - v70;
          if (v79)
          {
            if (v79 < 0) {
              sub_19E13D694();
            }
            v80 = (char *)operator new(v79);
            v81 = &v80[8 * (v79 >> 3)];
            memcpy(v80, v70, v79);
          }
          else
          {
            v81 = 0;
            v80 = 0;
          }
          __p = (void *)0x3FE0000000000000;
          vDSP_vsmulD((const double *)v80, 1, (const double *)&__p, (double *)v80, 1, v78);
          v125 = 0;
          v126 = 0;
          v127 = 0;
          int64_t v86 = v81 - v80;
          if (v81 == v80)
          {
            v87 = 0;
          }
          else
          {
            if (v86 < 0) {
              sub_19E13D694();
            }
            v87 = (char *)operator new(v81 - v80);
            v125 = v87;
            v127 = &v87[8 * (v86 >> 3)];
            memcpy(v87, v80, v86);
            v126 = &v87[8 * (v86 >> 3)];
          }
          LODWORD(v128) = v78;
          vDSP_vaddD(*(const double **)a2, 1, (const double *)v87, 1, *(double **)a2, 1, v98);
          if (v87) {
            operator delete(v87);
          }
          if (v80) {
            operator delete(v80);
          }
          if (v70) {
            goto LABEL_114;
          }
        }
        else
        {
          uint64_t v72 = SHIDWORD(v124);
          v73 = v121;
          v74 = v117;
          int64_t v75 = v118 - v117;
          if (v118 == v117)
          {
            v76 = 0;
            v70 = 0;
          }
          else
          {
            if (v75 < 0) {
              sub_19E13D694();
            }
            v70 = (char *)operator new(v118 - v117);
            v76 = &v70[8 * (v75 >> 3)];
            memcpy(v70, v74, v75);
          }
          v82 = &v73[v32 + j * v72];
          int v83 = v120;
          vDSP_vsmulD((const double *)v70, 1, v82, (double *)v70, 1, (int)v120);
          v125 = 0;
          v126 = 0;
          v127 = 0;
          uint64_t v84 = v76 - v70;
          if (v76 == v70)
          {
            v85 = 0;
          }
          else
          {
            if (v84 < 0) {
              sub_19E13D694();
            }
            v85 = (char *)operator new(v76 - v70);
            v125 = v85;
            v127 = &v85[8 * (v84 >> 3)];
            memcpy(v85, v70, v76 - v70);
            v126 = &v85[8 * (v84 >> 3)];
          }
          LODWORD(v128) = v83;
          vDSP_vaddD(*(const double **)a2, 1, (const double *)v85, 1, *(double **)a2, 1, v98);
          if (v85) {
            operator delete(v85);
          }
          if (v70) {
LABEL_114:
          }
            operator delete(v70);
        }
        if (v117)
        {
          v118 = v117;
          operator delete(v117);
        }
        ++v32;
        v31 += 8;
      }
      while (v32 <= j);
      v97 += 8;
    }
  }
LABEL_125:
  if (v121)
  {
    v122 = v121;
    operator delete(v121);
  }
}

void sub_19E2F0620(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  vDSP_Length v15 = *(void **)a14;
  if (*(void *)a14)
  {
    *(void *)(a14 + 8) = v15;
    operator delete(v15);
  }
  sub_19E13A9BC(a1);
}

void sub_19E2F0644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37)
{
  if (v39) {
    operator delete(v39);
  }
  if (v38)
  {
    *(void *)(v40 - 176) = v38;
    operator delete(v38);
  }
  if (v37)
  {
    *(void *)(v40 - 208) = v37;
    operator delete(v37);
  }
  if (__p)
  {
    operator delete(__p);
    uint64_t v42 = a28;
    if (!a28)
    {
LABEL_9:
      uint64_t v43 = a32;
      if (!a32)
      {
LABEL_14:
        uint64_t v44 = *(void **)(v40 - 152);
        if (v44)
        {
          *(void *)(v40 - 144) = v44;
          operator delete(v44);
        }
        _Unwind_Resume(exception_object);
      }
LABEL_13:
      operator delete(v43);
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v42 = a28;
    if (!a28) {
      goto LABEL_9;
    }
  }
  operator delete(v42);
  uint64_t v43 = a32;
  if (!a32) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

void sub_19E2F0878(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37)
{
  if (__p)
  {
    operator delete(__p);
    if (!v38)
    {
LABEL_3:
      char v39 = a36;
      if (!a36) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if (!v38)
  {
    goto LABEL_3;
  }
  operator delete(v38);
  char v39 = a36;
  if (!a36)
  {
LABEL_4:
    if (v37) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
LABEL_8:
  operator delete(v39);
  if (v37) {
LABEL_12:
  }
    JUMPOUT(0x19E2F0824);
LABEL_13:
  JUMPOUT(0x19E2F0828);
}

uint64_t sub_19E2F08C8(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v4;
  sub_19E2F0CD4(a1 + 8, (uint64_t)(a2 + 2));
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  uint64_t v6 = (unsigned char *)*((void *)a2 + 12);
  uint64_t v5 = (unsigned char *)*((void *)a2 + 13);
  int64_t v7 = v5 - v6;
  if (v5 != v6)
  {
    if (v7 < 0) {
      sub_19E13D694();
    }
    unint64_t v8 = (char *)operator new(v5 - v6);
    *(void *)(a1 + 96) = v8;
    *(void *)(a1 + 104) = v8;
    int64_t v9 = &v8[8 * (v7 >> 3)];
    *(void *)(a1 + 112) = v9;
    memcpy(v8, v6, v7);
    *(void *)(a1 + 104) = v9;
  }
  uint64_t v10 = *((void *)a2 + 15);
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 120) = v10;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  long long v12 = (unsigned char *)*((void *)a2 + 16);
  unint64_t v11 = (unsigned char *)*((void *)a2 + 17);
  int64_t v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0) {
      sub_19E13D694();
    }
    long double v14 = (char *)operator new(v11 - v12);
    *(void *)(a1 + 128) = v14;
    *(void *)(a1 + 136) = v14;
    vDSP_Length v15 = &v14[8 * (v13 >> 3)];
    *(void *)(a1 + 144) = v15;
    memcpy(v14, v12, v13);
    *(void *)(a1 + 136) = v15;
  }
  int v16 = a2[38];
  *(void *)(a1 + 160) = 0;
  *(_DWORD *)(a1 + 152) = v16;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  vDSP_Length v18 = (unsigned char *)*((void *)a2 + 20);
  unint64_t v17 = (unsigned char *)*((void *)a2 + 21);
  int64_t v19 = v17 - v18;
  if (v17 != v18)
  {
    if (v19 < 0) {
      sub_19E13D694();
    }
    uint64_t v20 = (char *)operator new(v17 - v18);
    *(void *)(a1 + 160) = v20;
    *(void *)(a1 + 168) = v20;
    uint64_t v21 = &v20[8 * (v19 >> 3)];
    *(void *)(a1 + 176) = v21;
    memcpy(v20, v18, v19);
    *(void *)(a1 + 168) = v21;
  }
  uint64_t v22 = *((void *)a2 + 23);
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 184) = v22;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = 0;
  uint64_t v24 = (unsigned char *)*((void *)a2 + 24);
  unint64_t v23 = (unsigned char *)*((void *)a2 + 25);
  int64_t v25 = v23 - v24;
  if (v23 != v24)
  {
    if (v25 < 0) {
      sub_19E13D694();
    }
    long long v26 = (char *)operator new(v23 - v24);
    *(void *)(a1 + 192) = v26;
    *(void *)(a1 + 200) = v26;
    long double v27 = &v26[8 * (v25 >> 3)];
    *(void *)(a1 + 208) = v27;
    memcpy(v26, v24, v25);
    *(void *)(a1 + 200) = v27;
  }
  uint64_t v28 = *((void *)a2 + 27);
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 216) = v28;
  *(void *)(a1 + 232) = 0;
  *(void *)(a1 + 240) = 0;
  int v30 = (unsigned char *)*((void *)a2 + 28);
  int32x2_t v29 = (unsigned char *)*((void *)a2 + 29);
  int64_t v31 = v29 - v30;
  if (v29 != v30)
  {
    if (v31 < 0) {
      sub_19E13D694();
    }
    unint64_t v32 = (char *)operator new(v29 - v30);
    *(void *)(a1 + 224) = v32;
    *(void *)(a1 + 232) = v32;
    uint64_t v33 = &v32[8 * (v31 >> 3)];
    *(void *)(a1 + 240) = v33;
    memcpy(v32, v30, v31);
    *(void *)(a1 + 232) = v33;
  }
  *(void *)(a1 + 248) = *((void *)a2 + 31);
  *(void *)(a1 + 256) = 0;
  *(void *)(a1 + 264) = 0;
  *(void *)(a1 + 272) = 0;
  uint64_t v35 = (unsigned char *)*((void *)a2 + 32);
  uint64_t v34 = (unsigned char *)*((void *)a2 + 33);
  int64_t v36 = v34 - v35;
  if (v34 != v35)
  {
    if (v36 < 0) {
      sub_19E13D694();
    }
    uint64_t v37 = (char *)operator new(v34 - v35);
    *(void *)(a1 + 256) = v37;
    *(void *)(a1 + 264) = v37;
    uint64_t v38 = &v37[8 * (v36 >> 3)];
    *(void *)(a1 + 272) = v38;
    memcpy(v37, v35, v36);
    *(void *)(a1 + 264) = v38;
  }
  *(_DWORD *)(a1 + 280) = a2[70];
  *(void *)(a1 + 296) = 0;
  *(void *)(a1 + 304) = 0;
  *(void *)(a1 + 288) = 0;
  uint64_t v40 = (unsigned char *)*((void *)a2 + 36);
  char v39 = (unsigned char *)*((void *)a2 + 37);
  int64_t v41 = v39 - v40;
  if (v39 != v40)
  {
    if (v41 < 0) {
      sub_19E13D694();
    }
    uint64_t v42 = (char *)operator new(v39 - v40);
    *(void *)(a1 + 288) = v42;
    *(void *)(a1 + 296) = v42;
    uint64_t v43 = &v42[8 * (v41 >> 3)];
    *(void *)(a1 + 304) = v43;
    memcpy(v42, v40, v41);
    *(void *)(a1 + 296) = v43;
  }
  *(_DWORD *)(a1 + 312) = a2[78];
  return a1;
}

void sub_19E2F0BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, void *a10)
{
  vDSP_Length v18 = *v16;
  if (*v16)
  {
    v10[37] = v18;
    operator delete(v18);
    int64_t v19 = *a9;
    if (!*a9)
    {
LABEL_3:
      uint64_t v20 = *v15;
      if (!*v15) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int64_t v19 = *a9;
    if (!*a9) {
      goto LABEL_3;
    }
  }
  v10[33] = v19;
  operator delete(v19);
  uint64_t v20 = *v15;
  if (!*v15)
  {
LABEL_4:
    uint64_t v21 = *v14;
    if (!*v14) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  v10[29] = v20;
  operator delete(v20);
  uint64_t v21 = *v14;
  if (!*v14)
  {
LABEL_5:
    uint64_t v22 = *v13;
    if (!*v13) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  v10[25] = v21;
  operator delete(v21);
  uint64_t v22 = *v13;
  if (!*v13)
  {
LABEL_6:
    unint64_t v23 = *v12;
    if (!*v12) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  v10[21] = v22;
  operator delete(v22);
  unint64_t v23 = *v12;
  if (!*v12)
  {
LABEL_7:
    uint64_t v24 = *v11;
    if (!*v11) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10[17] = v23;
  operator delete(v23);
  uint64_t v24 = *v11;
  if (!*v11)
  {
LABEL_8:
    sub_19E2BADC4(a10);
    _Unwind_Resume(a1);
  }
LABEL_15:
  v10[13] = v24;
  operator delete(v24);
  sub_19E2BADC4(a10);
  _Unwind_Resume(a1);
}

uint64_t sub_19E2F0CD4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  uint64_t v6 = *(unsigned char **)(a2 + 24);
  uint64_t v5 = *(unsigned char **)(a2 + 32);
  int64_t v7 = v5 - v6;
  if (v5 != v6)
  {
    if (v7 < 0) {
      sub_19E13D694();
    }
    unint64_t v8 = (char *)operator new(v5 - v6);
    *(void *)(a1 + 24) = v8;
    *(void *)(a1 + 32) = v8;
    int64_t v9 = &v8[8 * (v7 >> 3)];
    *(void *)(a1 + 40) = v9;
    memcpy(v8, v6, v7);
    *(void *)(a1 + 32) = v9;
  }
  int v10 = *(_DWORD *)(a2 + 48);
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 48) = v10;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  long long v12 = *(unsigned char **)(a2 + 56);
  unint64_t v11 = *(unsigned char **)(a2 + 64);
  int64_t v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0) {
      sub_19E13D694();
    }
    long double v14 = (char *)operator new(v11 - v12);
    *(void *)(a1 + 56) = v14;
    *(void *)(a1 + 64) = v14;
    vDSP_Length v15 = &v14[8 * (v13 >> 3)];
    *(void *)(a1 + 72) = v15;
    memcpy(v14, v12, v13);
    *(void *)(a1 + 64) = v15;
  }
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  return a1;
}

void sub_19E2F0DCC(_Unwind_Exception *exception_object)
{
  uint64_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 64) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E2F0E00(uint64_t a1@<X0>, uint64_t a2@<X1>, const double **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = 0;
  int64_t v9 = 0;
  int v10 = 0;
  int v11 = *(_DWORD *)a1;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)a4 = 0;
  *(_DWORD *)(a4 + 24) = 0;
  v57 = 0;
  uint64_t v58 = 0;
  signed int v59 = 0;
  int v12 = v11 + 1;
  if (v11 != -1)
  {
    if (v11 <= -2) {
      sub_19E13D694();
    }
    int v10 = (double *)operator new(8 * v12);
    uint64_t v8 = (uint64_t)&v10[v11 + 1];
    bzero(v10, 8 * v12);
    int64_t v9 = &v10[v12];
  }
  *(void *)a4 = v10;
  *(void *)(a4 + 8) = v9;
  *(void *)(a4 + 16) = v8;
  *(_DWORD *)(a4 + 24) = v12;
  double v13 = sub_19E2EA5E4(a1, a2, (uint64_t)a3);
  double v15 = v14;
  double v16 = exp(-v13);
  double v17 = v13 + 1.0;
  double *v10 = v16 * *(double *)(a1 + 16) * (v17 + v15 + v17 + v15);
  int64_t v19 = *(const void **)a2;
  uint64_t v18 = *(void *)(a2 + 8);
  int64_t v20 = v18 - *(void *)a2;
  if (v18 == *(void *)a2)
  {
    uint64_t v22 = 0;
    uint64_t v21 = 0;
  }
  else
  {
    if (v20 < 0) {
      sub_19E13D694();
    }
    uint64_t v21 = (char *)operator new(v18 - *(void *)a2);
    uint64_t v22 = &v21[8 * (v20 >> 3)];
    memcpy(v21, v19, v20);
  }
  int v23 = *(_DWORD *)(a2 + 24);
  vDSP_vsubD(*a3, 1, (const double *)v21, 1, (double *)v21, 1, v23);
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  unint64_t v53 = 0;
  uint64_t v24 = v22 - v21;
  if (v22 != v21)
  {
    if (v24 < 0) {
      sub_19E13D694();
    }
    int64_t v25 = (char *)operator new(v22 - v21);
    long long v26 = &v25[8 * (v24 >> 3)];
    uint64_t v51 = v25;
    unint64_t v53 = v26;
    memcpy(v25, v21, v22 - v21);
    uint64_t v52 = v26;
  }
  int v54 = v23;
  sub_19E2C2AC8((uint64_t)&v51, (uint64_t)__p);
  signed int v27 = v56;
  uint64_t v58 = 0;
  signed int v59 = 0;
  v57 = 0;
  if (v56)
  {
    if (v56 < 0) {
      sub_19E13D694();
    }
    uint64_t v28 = (float64x2_t *)operator new(8 * v56);
    v57 = v28;
    signed int v59 = (char *)&v28->f64[v27];
    bzero(v28, 8 * v27);
    unint64_t v29 = 0;
    uint64_t v58 = (float64x2_t *)((char *)v28 + 8 * v27);
    signed int v60 = v27;
    int v30 = __p[0];
    if (v27 < 4) {
      goto LABEL_46;
    }
    if ((unint64_t)((char *)v28 - (char *)__p[0]) < 0x20) {
      goto LABEL_46;
    }
    unint64_t v31 = 0;
    unint64_t v29 = v27 & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v32 = v29;
    do
    {
      long long v33 = *(_OWORD *)&v30[v31 / 8 + 2];
      f64 = (_OWORD *)v28[v31 / 0x10].f64;
      _OWORD *f64 = *(_OWORD *)&v30[v31 / 8];
      f64[1] = v33;
      v31 += 32;
      v32 -= 4;
    }
    while (v32);
    if (v29 != v27)
    {
LABEL_46:
      do
      {
        *(void *)&v28->f64[v29] = v30[v29];
        ++v29;
      }
      while (v27 != v29);
    }
  }
  else
  {
    uint64_t v28 = 0;
    signed int v60 = 0;
    int v30 = __p[0];
    if (!__p[0]) {
      goto LABEL_22;
    }
  }
  __p[1] = v30;
  operator delete(v30);
LABEL_22:
  if (v51)
  {
    uint64_t v52 = v51;
    operator delete(v51);
  }
  if (v21) {
    operator delete(v21);
  }
  uint64_t v35 = *(int *)(a1 + 48);
  if (v35)
  {
    int64_t v36 = *(float64x2_t **)(a1 + 24);
    double v37 = v16 * 1.66666667 * (v17 * *(double *)(a1 + 16));
    if (v35 >= 6)
    {
      unint64_t v38 = 0;
      if ((unint64_t)((char *)(v10 + 1) - (char *)v36) >= 0x20
        && (unint64_t)((char *)(v10 + 1) - (char *)v28) >= 0x20)
      {
        unint64_t v38 = v35 & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v46 = (float64x2_t *)(v10 + 3);
        long long v47 = v36 + 1;
        uint64_t v48 = v28 + 1;
        unint64_t v49 = v35 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          float64x2_t v50 = vdivq_f64(vmulq_n_f64(*v48, v37), vmulq_f64(*v47, *v47));
          v46[-1] = vdivq_f64(vmulq_n_f64(v48[-1], v37), vmulq_f64(v47[-1], v47[-1]));
          *uint64_t v46 = v50;
          v46 += 2;
          v47 += 2;
          v48 += 2;
          v49 -= 4;
        }
        while (v49);
        if (v38 == v35) {
          goto LABEL_39;
        }
      }
    }
    else
    {
      unint64_t v38 = 0;
    }
    char v39 = &v10[v38 + 1];
    uint64_t v40 = &v28->f64[v38];
    int64_t v41 = &v36->f64[v38];
    uint64_t v42 = v35 - v38;
    do
    {
      double v43 = *v41++;
      double v44 = v43;
      double v45 = *v40++;
      *v39++ = v37 * v45 / (v44 * v44);
      --v42;
    }
    while (v42);
LABEL_39:
    uint64_t v58 = v28;
    operator delete(v28);
    return;
  }
  if (v28) {
    goto LABEL_39;
  }
}

void sub_19E2F11E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22)
{
  if (__p) {
    operator delete(__p);
  }
  if (v23) {
    operator delete(v23);
  }
  *(void *)(v24 + 8) = v22;
  operator delete(v22);
  _Unwind_Resume(a1);
}

void sub_19E2F1250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a9) {
    JUMPOUT(0x19E2F123CLL);
  }
  JUMPOUT(0x19E2F1230);
}

BOOL sub_19E2F1260(uint64_t a1, int *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Early stopping already requested.");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  int v3 = *(_DWORD *)(a1 + 12);
  if (v3 == -1) {
    return 0;
  }
  int v6 = *a2;
  uint64_t v5 = (uint64_t)(a2 + 2);
  if (v6 == 1 || *(double *)(a1 + 120) < *((double *)a2 + 13) - *(double *)(a1 + 16))
  {
    sub_19E29AB9C(a1 + 24, v5);
    *(void *)(a1 + 120) = *((void *)a2 + 13);
    *(_DWORD *)(a1 + 128) = 0;
    *(unsigned char *)(a1 + 8) = 0;
    return 0;
  }
  else
  {
    int v8 = *(_DWORD *)(a1 + 128);
    *(_DWORD *)(a1 + 128) = v8 + 1;
    BOOL v9 = v8 >= v3;
    *(unsigned char *)(a1 + 8) = v9;
    return v9;
  }
}

void sub_19E2F1354(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19E2F1368(uint64_t a1)
{
  return a1;
}

void sub_19E2F1394(id *a1)
{
  operator delete(a1);
}

void *sub_19E2F13D0(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  void *v2 = &unk_1EF0ABBA8;
  v2[1] = MEMORY[0x19F3BC450](*(void *)(a1 + 8));
  *((_DWORD *)v2 + 4) = *(_DWORD *)(a1 + 16);
  return v2;
}

uint64_t sub_19E2F1430(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EF0ABBA8;
  uint64_t result = MEMORY[0x19F3BC450](*(void *)(a1 + 8));
  *(void *)(a2 + 8) = result;
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  return result;
}

void sub_19E2F1484(uint64_t a1)
{
}

void sub_19E2F148C(id *a1)
{
  operator delete(a1);
}

uint64_t sub_19E2F14C8(uint64_t a1, uint64_t *a2)
{
  return sub_19E2F155C((uint64_t *)(a1 + 8), a2);
}

uint64_t sub_19E2F14D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000019E35485ELL) {
    return a1 + 8;
  }
  if (((v3 & 0x800000019E35485ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000019E35485ELL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000019E35485ELL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 8;
  }
  return 0;
}

void *sub_19E2F1550()
{
  return &unk_1EF0A3DA0;
}

uint64_t sub_19E2F155C(uint64_t *a1, uint64_t *a2)
{
  int v10 = *(_DWORD *)a2;
  sub_19E291E68(v11, a2 + 1);
  v11[12] = (uint64_t *)a2[13];
  sub_19E291E68(v12, a2 + 14);
  double v13 = *((double *)a2 + 26);
  sub_19E291E68(v8, (uint64_t *)v12);
  sub_19E28B734((uint64_t)v8, &v9);
  sub_19E2470C8((char **)v8);
  v4.n128_f64[0] = v13;
  if (*((_DWORD *)a1 + 2) == 1) {
    v4.n128_f64[0] = -v13;
  }
  uint64_t v5 = *a1;
  CFDictionaryRef v6 = v9;
  (*(void (**)(__n128))(v5 + 16))(v4);
  if (v6) {
    CFRelease(v6);
  }
  sub_19E2470C8((char **)v12);
  sub_19E2470C8((char **)v11);
  return 0;
}

void sub_19E2F1658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_19E1551E8((const void **)va);
  sub_19E2470C8(v16);
  sub_19E2470C8(v15);
  _Unwind_Resume(a1);
}

void sub_19E2F167C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_19E2470C8((char **)va);
  sub_19E2470C8(v4);
  sub_19E2470C8(v3);
  _Unwind_Resume(a1);
}

void *sub_19E2F16A0(void *result, void *a2)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (a2 != result)
  {
    uint64_t v3 = result;
    __n128 v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_19E2F192C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_19E13A9BC(a1);
}

_DWORD *sub_19E2F1940(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  *(void *)uint64_t result = &unk_1EF0ABC00;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t sub_19E2F198C(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1EF0ABC00;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t sub_19E2F19BC(uint64_t a1, uint64_t a2)
{
  sub_19E291E68(v7, (uint64_t *)(a2 + 8));
  double v8 = *(double *)(a2 + 104);
  __n128 v4 = sub_19E291E68(&v9, (uint64_t *)(a2 + 112));
  double v5 = *(double *)(a2 + 208);
  double v10 = v5;
  if (*(_DWORD *)(a1 + 8) == 1)
  {
    double v8 = -v8;
    double v10 = -v5;
  }
  sub_19E2470C8((char **)v4);
  sub_19E2470C8((char **)v7);
  return 0;
}

uint64_t sub_19E2F1A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000019E3548E5) {
    return a1 + 8;
  }
  if (((v3 & 0x800000019E3548E5 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000019E3548E5)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000019E3548E5 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 8;
  }
  return 0;
}

void *sub_19E2F1ADC()
{
  return &unk_1EF0A4620;
}

void sub_19E2F1AE8(const __CFDictionary *a1@<X0>, const UInt8 *a2@<X1>, void **a3@<X2>, uint64_t a4@<X8>)
{
  CFStringRef v6 = (const __CFString *)sub_19E29445C(a1, a2);
  if (v6)
  {
    CFStringRef v7 = v6;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v7))
    {
      a3 = __p;
      sub_19E15CF70(v7, __p);
      char v11 = 1;
      if (v10 < 0)
      {
        sub_19E13C2D0((unsigned char *)a4, __p[0], (unint64_t)__p[1]);
        goto LABEL_8;
      }
      goto LABEL_6;
    }
  }
  LOBYTE(__p[0]) = 0;
  char v11 = 0;
  if ((*((char *)a3 + 23) & 0x80000000) == 0)
  {
LABEL_6:
    *(_OWORD *)a4 = *(_OWORD *)a3;
    *(void *)(a4 + 16) = a3[2];
    goto LABEL_8;
  }
  sub_19E13C2D0((unsigned char *)a4, *a3, (unint64_t)a3[1]);
LABEL_8:
  if (v11)
  {
    if (v10 < 0) {
      operator delete(__p[0]);
    }
  }
}

uint64_t sub_19E2F1BC0(uint64_t a1)
{
  return a1;
}

void sub_19E2F1BEC(id *a1)
{
  operator delete(a1);
}

void *sub_19E2F1C28(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  void *v2 = &unk_1EF0ABB50;
  v2[1] = MEMORY[0x19F3BC450](*(void *)(a1 + 8));
  *((_DWORD *)v2 + 4) = *(_DWORD *)(a1 + 16);
  return v2;
}

uint64_t sub_19E2F1C88(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EF0ABB50;
  uint64_t result = MEMORY[0x19F3BC450](*(void *)(a1 + 8));
  *(void *)(a2 + 8) = result;
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  return result;
}

void sub_19E2F1CDC(uint64_t a1)
{
}

void sub_19E2F1CE4(id *a1)
{
  operator delete(a1);
}

void sub_19E2F1D20(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_19E2F1D28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000019E35498ELL) {
    return a1 + 8;
  }
  if (((v3 & 0x800000019E35498ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000019E35498ELL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000019E35498ELL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 8;
  }
  return 0;
}

void *sub_19E2F1DA8()
{
  return &unk_1EF0A3D90;
}

void sub_19E2F1DB4(uint64_t a1, uint64_t *a2)
{
  sub_19E291E68(v4, a2);
  sub_19E28B734((uint64_t)v4, &v5);
  sub_19E2470C8((char **)v4);
  CFDictionaryRef v3 = v5;
  (*(void (**)(void))(*(void *)a1 + 16))();
  if (v3) {
    CFRelease(v3);
  }
}

void sub_19E2F1E3C(_Unwind_Exception *a1)
{
  sub_19E1551E8((const void **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_19E2F1E50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E2470C8((char **)va);
  _Unwind_Resume(a1);
}

void sub_19E2F1E64(uint64_t a1@<X0>, CFDictionaryRef *a2@<X8>)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  CFIndex v4 = strlen(v3);
  if (!v3)
  {
    char v10 = 0;
    CFDictionaryRef v5 = (const void *)*MEMORY[0x1E4F1D170];
    if (!*MEMORY[0x1E4F1D170]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  CFDictionaryRef v3 = (const char *)CFStringCreateWithBytes(0, (const UInt8 *)v3, v4, 0x8000100u, 0);
  char v10 = v3;
  if (!v3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  CFDictionaryRef v5 = (const void *)*MEMORY[0x1E4F1D170];
  if (*MEMORY[0x1E4F1D170]) {
LABEL_6:
  }
    CFRetain(v5);
LABEL_7:
  sub_19E1592DC(&cf, v5);
  CFTypeRef v6 = cf;
  if (cf) {
    CFRetain(cf);
  }
  CFTypeRef v11 = v6;
  if (v3) {
    CFRetain(v3);
  }
  CFTypeRef v12 = v3;
  v8[0] = &v11;
  v8[1] = 1;
  *a2 = sub_19E159394((uint64_t)v8);
  if (v12) {
    CFRelease(v12);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
}

void sub_19E2F1FF8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19E2F200C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16, int a17, __int16 a18, char a19, char a20)
{
  if (a2) {
    sub_19E13A9BC(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E2F206C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_19E2F209C(uint64_t a1)
{
  return *(void *)a1;
}

void sub_19E2F2228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F223C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F23A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  if (v12) {
    operator delete(v12);
  }

  _Unwind_Resume(a1);
}

void sub_19E2F2B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F2EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F300C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F3020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F3030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F3198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F334C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F3474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F3488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F354C(_Unwind_Exception *a1)
{
  CFIndex v4 = v3;

  _Unwind_Resume(a1);
}

void sub_19E2F3568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F3578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F3588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F3598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2F3824(uint64_t a1, unsigned int a2)
{
  bzero(**(void ***)(a1 + 40), 4 * (int)(*(_DWORD *)(a1 + 20) * a2));
  if (!a2) {
    return;
  }
  if ((a2 & 0x80000000) != 0) {
    sub_19E13D694();
  }
  CFIndex v4 = (char *)operator new(4 * (int)a2);
  bzero(v4, 4 * (int)a2);
  uint64_t v5 = *(unsigned int *)(a1 + 20);
  int v6 = *(_DWORD *)(a1 + 20);
  uint64_t v84 = *(void *)(a1 + 56);
  uint64_t v77 = v5;
  __asm { FMOV            V0.4S, #1.0 }
  float32x4_t v75 = _Q0;
  unsigned int v73 = v6;
  uint64_t v74 = 0;
  uint64_t v72 = a2;
  uint64_t v81 = 4 * (int)v5;
  for (uint64_t i = 0; i != v72; ++i)
  {
    if (v6 >= 1)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = *(unsigned int *)(a1 + 16);
      uint64_t v14 = (int)v13;
      uint64_t v15 = **(void **)(a1 + 48);
      uint64_t v83 = i * (int)v13;
      uint64_t v80 = 4 * v13;
      uint64_t v79 = 4 * v83 + 4 * v13;
      uint64_t v16 = 4 * (int)v13;
      uint64_t v87 = v13;
      uint64_t v78 = v13 & 0xFFFFFFF8;
      uint64_t v76 = v74 * (int)v13;
      uint64_t v17 = 16;
      uint64_t v85 = v16;
      do
      {
        uint64_t v18 = i * (int)v5 + v12;
        if ((int)v14 >= 1)
        {
          uint64_t v19 = **(void **)(a1 + 24);
          uint64_t v20 = **(void **)(a1 + 32);
          uint64_t v21 = **(void **)(a1 + 40);
          uint64_t v22 = (__int32 *)(v21 + 4 * v18);
          _Q0.i32[0] = *v22;
          if (v14 >= 8)
          {
            uint64_t v23 = 0;
            unint64_t v33 = v21 + v81 * i + 4 * v12 + 4;
            BOOL v35 = (unint64_t)v22 < v20 + v80 + v16 * v12 && v20 + v16 * v12 < v33;
            if ((v19 + 4 * v83 >= v33 || (unint64_t)v22 >= v19 + v79) && !v35)
            {
              float32x4_t v37 = 0uLL;
              float32x4_t v38 = (float32x4_t)*v22;
              char v39 = (float32x4_t *)(v19 + v76 + 16);
              uint64_t v40 = (float32x4_t *)(v20 + v17);
              uint64_t v41 = v78;
              do
              {
                float32x4_t v38 = vmlaq_f32(v38, v40[-1], v39[-1]);
                float32x4_t v37 = vmlaq_f32(v37, *v40, *v39);
                v39 += 2;
                v40 += 2;
                v41 -= 8;
              }
              while (v41);
              float32x4_t v42 = vaddq_f32(v37, v38);
              _Q0 = vpaddq_f32(v42, v42);
              _Q0.f32[0] = vaddv_f32(*(float32x2_t *)_Q0.f32);
              __int32 *v22 = _Q0.i32[0];
              uint64_t v23 = v78;
              if (v78 == v87) {
                goto LABEL_14;
              }
            }
          }
          else
          {
            uint64_t v23 = 0;
          }
          uint64_t v24 = (float *)(v20 + 4 * (v23 + v11));
          int64_t v25 = (float *)(v19 + 4 * (v83 + v23));
          uint64_t v26 = v87 - v23;
          do
          {
            float v27 = *v25++;
            float v28 = v27;
            float v29 = *v24++;
            _Q0.f32[0] = _Q0.f32[0] + (float)(v29 * v28);
            __int32 *v22 = _Q0.i32[0];
            --v26;
          }
          while (v26);
        }
LABEL_14:
        if (v15) {
          *(float *)(**(void **)(a1 + 40) + 4 * v18) = *(float *)(**(void **)(a1 + 40) + 4 * v18)
        }
                                                       + *(float *)(v15 + 4 * v12);
        switch(v84)
        {
          case 1:
            double v43 = *(uint64_t **)(a1 + 40);
            uint64_t v44 = *v43;
            uint64_t v45 = 4 * v18;
            _Q0.f32[0] = expf(-*(float *)(*v43 + 4 * v18));
            uint64_t v16 = v85;
            _Q0.f32[0] = 1.0 / (float)(_Q0.f32[0] + 1.0);
            goto LABEL_36;
          case 2:
            uint64_t v46 = *(uint64_t **)(a1 + 40);
            uint64_t v44 = *v46;
            uint64_t v45 = 4 * v18;
            _Q0.f32[0] = tanhf(*(float *)(*v46 + 4 * v18));
            uint64_t v16 = v85;
LABEL_36:
            *(_DWORD *)(v44 + v45) = _Q0.i32[0];
            break;
          case 4:
          case 7:
            int v30 = *(uint64_t **)(a1 + 40);
            uint64_t v31 = *v30;
            uint64_t v32 = 4 * v18;
            _Q0.f32[0] = expf(*(float *)(*v30 + 4 * v18));
            uint64_t v16 = v85;
            *(_DWORD *)(v31 + v32) = _Q0.i32[0];
            *(float *)&v4[4 * i] = *(float *)&v4[4 * i] + _Q0.f32[0];
            break;
          case 5:
            *(float *)(**(void **)(a1 + 40) + 4 * v18) = fmaxf(*(float *)(**(void **)(a1 + 40) + 4 * v18), 0.0);
            break;
          default:
            break;
        }
        ++v12;
        v17 += v16;
        v11 += v14;
      }
      while (v12 != v5);
    }
    int v6 = v5;
    uint64_t v47 = 4 * (int)v5;
    if ((v84 == 4 || v84 == 7) && (int)v5 >= 1)
    {
      uint64_t v48 = **(float32x4_t ***)(a1 + 40);
      if (v84 == 7)
      {
        uint64_t v49 = 0;
        float64x2_t v50 = **(float32x4_t ***)(a1 + 40);
        while (1)
        {
          if (v73 >= 4)
          {
            uint64_t v52 = &v4[4 * v49];
            if ((char *)v48 + v47 * v49 >= v52 + 4 || v52 >= (char *)v48 + v77 * 4 + v47 * v49)
            {
              _Q0.i32[0] = *(_DWORD *)&v4[4 * v49];
              LODWORD(v86) = vdivq_f32(v75, _Q0).u32[0];
              uint64_t v54 = v5 & 0xFFFFFFFC;
              uint64_t v55 = v50;
              do
              {
                float32x4_t v91 = vmulq_n_f32(*v55, v86);
                float v88 = logf(v91.f32[1]);
                v56.f32[0] = logf(v91.f32[0]);
                v56.f32[1] = v88;
                float32x4_t v89 = v56;
                float v57 = logf(v91.f32[2]);
                float32x4_t v58 = v89;
                v58.f32[2] = v57;
                float32x4_t v90 = v58;
                _Q0.f32[0] = logf(v91.f32[3]);
                float32x4_t v59 = v90;
                v59.i32[3] = _Q0.i32[0];
                *v55++ = v59;
                v54 -= 4;
              }
              while (v54);
              uint64_t v51 = v5 & 0xFFFFFFFC;
              if (v51 == v5) {
                goto LABEL_42;
              }
            }
            else
            {
              uint64_t v51 = 0;
            }
          }
          else
          {
            uint64_t v51 = 0;
          }
          do
          {
            v50->f32[v51] = logf(v50->f32[v51] / *(float *)&v4[4 * v49]);
            ++v51;
          }
          while (v5 != v51);
LABEL_42:
          ++v49;
          uint64_t v47 = 4 * (int)v5;
          float64x2_t v50 = (float32x4_t *)((char *)v50 + v81);
          if (v49 == v72) {
            goto LABEL_4;
          }
        }
      }
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      long long v62 = v48 + 1;
      do
      {
        if (v5 >= 8
          && ((signed int v63 = (const float *)&v4[4 * v61], (char *)v48 + v81 * v61 < (char *)(v63 + 1))
            ? (BOOL v64 = v63 >= (const float *)((char *)&v48->f32[v77] + v81 * v61))
            : (BOOL v64 = 1),
              v64))
        {
          float32x4_t v65 = vld1q_dup_f32(v63);
          _Q0 = vdivq_f32(v75, v65);
          uint64_t v66 = v5 & 0xFFFFFFF8;
          v67 = v62;
          do
          {
            float32x4_t v68 = vmulq_f32(*v67, _Q0);
            v67[-1] = vmulq_f32(v67[-1], _Q0);
            float32x4_t *v67 = v68;
            v67 += 2;
            v66 -= 8;
          }
          while (v66);
          uint64_t v69 = v5 & 0xFFFFFFF8;
          if (v69 == v5) {
            goto LABEL_56;
          }
        }
        else
        {
          uint64_t v69 = 0;
        }
        v70 = &v48->f32[v69 + v60];
        uint64_t v71 = v5 - v69;
        do
        {
          float *v70 = *v70 / *(float *)&v4[4 * v61];
          ++v70;
          --v71;
        }
        while (v71);
LABEL_56:
        ++v61;
        long long v62 = (float32x4_t *)((char *)v62 + v81);
        v60 += (int)v5;
      }
      while (v61 != v72);
    }
LABEL_4:
    v74 += 4;
  }

  operator delete(v4);
}

void sub_19E2F3E24(_Unwind_Exception *exception_object)
{
  CFDictionaryRef v3 = *(void **)(v1 - 128);
  if (v3)
  {
    *(void *)(v1 - 120) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E2F3E5C(uint64_t a1, unsigned int a2)
{
  bzero(**(void ***)(a1 + 40), *(int *)(a1 + 20) * (uint64_t)(int)a2);
  if (!a2) {
    return;
  }
  if ((a2 & 0x80000000) != 0) {
    sub_19E13D694();
  }
  CFIndex v4 = (char *)operator new((int)a2);
  v164 = v4;
  bzero(v4, (int)a2);
  uint64_t v6 = 0;
  uint64_t v7 = a2;
  unsigned int v8 = *(_DWORD *)(a1 + 20);
  __asm { FMOV            V0.4S, #1.0 }
  float32x4_t v136 = _Q0;
  uint64_t v137 = a2;
  do
  {
    if ((int)v8 >= 1)
    {
      uint64_t v12 = 0;
      while (1)
      {
        int v13 = v12 + v8 * v6;
        uint64_t v14 = *(unsigned int *)(a1 + 16);
        if ((int)v14 >= 1) {
          break;
        }
LABEL_14:
        uint64_t v27 = **(void **)(a1 + 48);
        if (v27)
        {
          float v28 = *(float *)(v27 + 4 * v12);
          uint64_t v29 = **(void **)(a1 + 40);
          uint64_t v30 = 4 * v13;
          v5.i32[0] = *(_DWORD *)(v29 + v30);
          *(float *)(v29 + v30) = v5.f32[0] + v28;
        }
        switch(*(void *)(a1 + 56))
        {
          case 1:
            unint64_t v53 = *(uint64_t **)(a1 + 40);
            uint64_t v54 = *v53;
            uint64_t v55 = 4 * v13;
            float v56 = 1.0 / (float)(expf(-*(float *)(*v53 + v55)) + 1.0);
            goto LABEL_38;
          case 2:
            float v57 = *(uint64_t **)(a1 + 40);
            uint64_t v54 = *v57;
            uint64_t v55 = 4 * v13;
            float v56 = tanhf(*(float *)(*v57 + v55));
LABEL_38:
            *(float *)(v54 + v55) = v56;
            break;
          case 4:
          case 7:
            uint64_t v31 = *(uint64_t **)(a1 + 40);
            uint64_t v32 = *v31;
            uint64_t v33 = 4 * v13;
            float v34 = expf(*(float *)(*v31 + v33));
            *(float *)(v32 + v33) = v34;
            v5.i8[0] = v4[v6];
            v5.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v5.f32)).u64[0];
            v5.f32[0] = (float)v5.i32[0];
            v4[v6] = (int)(float)(v34 + v5.f32[0]);
            unsigned int v8 = *(_DWORD *)(a1 + 20);
            break;
          case 5:
            *(float *)(**(void **)(a1 + 40) + 4 * v13) = fmaxf(*(float *)(**(void **)(a1 + 40) + 4 * v13), 0.0);
            break;
          default:
            break;
        }
        if (++v12 >= (int)v8) {
          goto LABEL_44;
        }
      }
      uint64_t v15 = **(void **)(a1 + 24);
      uint64_t v16 = **(void **)(a1 + 32);
      uint64_t v17 = **(void **)(a1 + 40);
      uint64_t v18 = (float *)(v17 + 4 * v13);
      float v19 = *v18;
      if (v14 >= 8)
      {
        uint64_t v20 = 0;
        uint64_t v35 = (int)v14 * (int)v6;
        uint64_t v36 = (int)v14 * (int)v12;
        unint64_t v37 = v17 + 4 * v13 + 4;
        unint64_t v38 = v15 + v35;
        unint64_t v39 = v15 + v35 + v14;
        BOOL v41 = (unint64_t)v18 < v16 + v36 + v14 && v16 + v36 < v37;
        BOOL v42 = v38 >= v37 || (unint64_t)v18 >= v39;
        if (v42 && !v41)
        {
          if (v14 >= 0x10)
          {
            uint64_t v20 = v14 & 0x7FFFFFF0;
            float32x4_t v58 = 0uLL;
            float32x4_t v59 = (float32x4_t)*(unsigned int *)v18;
            uint64_t v60 = (int8x16_t *)(v15 + (int)v6 * (int)v14);
            uint64_t v61 = (int8x16_t *)(v16 + (int)v14 * (int)v12);
            uint64_t v62 = v14 & 0xFFFFFFF0;
            float32x4_t v63 = 0uLL;
            float32x4_t v64 = 0uLL;
            do
            {
              int8x16_t v65 = *v60++;
              int16x8_t v66 = vmovl_s8(*(int8x8_t *)v65.i8);
              int16x8_t v67 = vmovl_high_s8(v65);
              int8x16_t v68 = *v61++;
              int16x8_t v69 = vmovl_s8(*(int8x8_t *)v68.i8);
              int16x8_t v70 = vmovl_high_s8(v68);
              float32x4_t v64 = vaddq_f32(v64, vcvtq_f32_s32(vmull_high_s16(v70, v67)));
              float32x4_t v63 = vaddq_f32(v63, vcvtq_f32_s32(vmull_s16(*(int16x4_t *)v70.i8, *(int16x4_t *)v67.i8)));
              float32x4_t v58 = vaddq_f32(v58, vcvtq_f32_s32(vmull_high_s16(v69, v66)));
              float32x4_t v59 = vaddq_f32(v59, vcvtq_f32_s32(vmull_s16(*(int16x4_t *)v69.i8, *(int16x4_t *)v66.i8)));
              v62 -= 16;
            }
            while (v62);
            float32x4_t v5 = vaddq_f32(v58, v64);
            float32x4_t v71 = vaddq_f32(vaddq_f32(v59, v63), v5);
            float v19 = vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v71, v71));
            float *v18 = v19;
            if (v20 == v14) {
              goto LABEL_14;
            }
            if ((v14 & 8) == 0) {
              goto LABEL_12;
            }
          }
          else
          {
            uint64_t v20 = 0;
          }
          uint64_t v43 = v20;
          uint64_t v20 = v14 & 0xFFFFFFF8;
          float32x4_t v5 = 0uLL;
          float32x4_t v44 = (float32x4_t)LODWORD(v19);
          uint64_t v45 = (int8x8_t *)(v15 + v43 + (int)v6 * (int)v14);
          uint64_t v46 = (int8x8_t *)(v16 + v43 + (int)v14 * (int)v12);
          uint64_t v47 = v43 - v20;
          do
          {
            int8x8_t v48 = *v45++;
            int16x8_t v49 = vmovl_s8(v48);
            int8x8_t v50 = *v46++;
            int16x8_t v51 = vmovl_s8(v50);
            float32x4_t v5 = vaddq_f32(v5, vcvtq_f32_s32(vmull_high_s16(v51, v49)));
            float32x4_t v44 = vaddq_f32(v44, vcvtq_f32_s32(vmull_s16(*(int16x4_t *)v51.i8, *(int16x4_t *)v49.i8)));
            v47 += 8;
          }
          while (v47);
          float32x4_t v52 = vaddq_f32(v44, v5);
          float v19 = vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v52, v52));
          float *v18 = v19;
          if (v20 == v14) {
            goto LABEL_14;
          }
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
LABEL_12:
      uint64_t v21 = (char *)(v16 + v20 + (int)v14 * (int)v12);
      uint64_t v22 = (char *)(v15 + v20 + (int)v6 * (int)v14);
      uint64_t v23 = v14 - v20;
      do
      {
        int v25 = *v22++;
        int v24 = v25;
        int v26 = *v21++;
        v5.f32[0] = (float)(v26 * v24);
        float v19 = v19 + v5.f32[0];
        float *v18 = v19;
        --v23;
      }
      while (v23);
      goto LABEL_14;
    }
LABEL_44:
    uint64_t v72 = *(void *)(a1 + 56);
    if (v72 == 4 || v72 == 7)
    {
      CFIndex v4 = v164;
      if ((int)v8 >= 1)
      {
        uint64_t v74 = **(float32x4_t ***)(a1 + 40);
        uint64_t v75 = 4 * v8;
        uint64_t v76 = v8 & 0xFFFFFFF8;
        if (v72 == 7)
        {
          uint64_t v77 = 0;
          uint64_t v134 = -v76;
          uint64_t v135 = **(void **)(a1 + 40);
          while (1)
          {
            uint64_t v78 = &v4[v77];
            if (v8 >= 8)
            {
              if (v135 + v75 * v77 >= (unint64_t)(v78 + 1) || (unint64_t)v78 >= v135 + v75 + v75 * v77)
              {
                if (v8 < 0x10)
                {
                  uint64_t v81 = 0;
LABEL_62:
                  float32x4_t v142 = vdivq_f32(v136, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16(vdup_n_s16(*(unsigned __int8 *)v78), 8uLL), 8uLL))));
                  uint64_t v82 = 4 * v81;
                  uint64_t v83 = v134 + v81;
                  do
                  {
                    uint64_t v84 = (float32x4_t *)((char *)v74 + v82);
                    float32x4_t v144 = vmulq_f32(*(float32x4_t *)((char *)v74 + v82 + 16), v142);
                    float32x4_t v151 = vmulq_f32(*(float32x4_t *)((char *)v74 + v82), v142);
                    float v156 = logf(v144.f32[1]);
                    v85.f32[0] = logf(v144.f32[0]);
                    v85.f32[1] = v156;
                    float32x4_t v157 = v85;
                    float v86 = logf(v144.f32[2]);
                    float32x4_t v87 = v157;
                    v87.f32[2] = v86;
                    float32x4_t v158 = v87;
                    float v88 = logf(v144.f32[3]);
                    float32x4_t v89 = v158;
                    v89.f32[3] = v88;
                    float32x4_t v159 = v89;
                    v144.i32[0] = logf(v151.f32[1]);
                    v90.f32[0] = logf(v151.f32[0]);
                    v90.i32[1] = v144.i32[0];
                    float32x4_t v145 = v90;
                    float v91 = logf(v151.f32[2]);
                    float32x4_t v92 = v145;
                    v92.f32[2] = v91;
                    float32x4_t v146 = v92;
                    float v93 = logf(v151.f32[3]);
                    float32x4_t v5 = v146;
                    v5.f32[3] = v93;
                    *uint64_t v84 = v5;
                    v84[1] = v159;
                    v82 += 32;
                    v83 += 8;
                  }
                  while (v83);
                  uint64_t v79 = v8 & 0xFFFFFFF8;
                  CFIndex v4 = v164;
                  if (v79 == v8) {
                    goto LABEL_52;
                  }
                  goto LABEL_65;
                }
                int16x4_t v94 = (int16x4_t)vld1_dup_s8(v78);
                float32x4_t v138 = vdivq_f32(v136, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16(v94, 8uLL), 8uLL))));
                uint64_t v95 = v8 & 0xFFFFFFF0;
                uint64_t v96 = v74;
                do
                {
                  float32x4_t v139 = vmulq_f32(v96[1], v138);
                  float32x4_t v143 = vmulq_f32(*v96, v138);
                  float32x4_t v147 = vmulq_f32(v96[2], v138);
                  float32x4_t v152 = vmulq_f32(v96[3], v138);
                  float v160 = logf(v152.f32[1]);
                  v97.f32[0] = logf(v152.f32[0]);
                  v97.f32[1] = v160;
                  float32x4_t v161 = v97;
                  float v98 = logf(v152.f32[2]);
                  float32x4_t v99 = v161;
                  v99.f32[2] = v98;
                  float32x4_t v162 = v99;
                  float v100 = logf(v152.f32[3]);
                  float32x4_t v101 = v162;
                  v101.f32[3] = v100;
                  float32x4_t v163 = v101;
                  v152.i32[0] = logf(v147.f32[1]);
                  v102.f32[0] = logf(v147.f32[0]);
                  v102.i32[1] = v152.i32[0];
                  float32x4_t v153 = v102;
                  float v103 = logf(v147.f32[2]);
                  float32x4_t v104 = v153;
                  v104.f32[2] = v103;
                  float32x4_t v154 = v104;
                  float v105 = logf(v147.f32[3]);
                  float32x4_t v106 = v154;
                  v106.f32[3] = v105;
                  float32x4_t v155 = v106;
                  v147.i32[0] = logf(v139.f32[1]);
                  v107.f32[0] = logf(v139.f32[0]);
                  v107.i32[1] = v147.i32[0];
                  float32x4_t v148 = v107;
                  float v108 = logf(v139.f32[2]);
                  float32x4_t v109 = v148;
                  v109.f32[2] = v108;
                  float32x4_t v149 = v109;
                  float v110 = logf(v139.f32[3]);
                  float32x4_t v111 = v149;
                  v111.f32[3] = v110;
                  float32x4_t v150 = v111;
                  v139.i32[0] = logf(v143.f32[1]);
                  v112.f32[0] = logf(v143.f32[0]);
                  v112.i32[1] = v139.i32[0];
                  float32x4_t v140 = v112;
                  float v113 = logf(v143.f32[2]);
                  float32x4_t v114 = v140;
                  v114.f32[2] = v113;
                  float32x4_t v141 = v114;
                  float v115 = logf(v143.f32[3]);
                  float32x4_t v5 = v141;
                  v5.f32[3] = v115;
                  *uint64_t v96 = v5;
                  v96[1] = v150;
                  v5.i64[0] = v155.i64[0];
                  v96[2] = v155;
                  v96[3] = v163;
                  v96 += 4;
                  v95 -= 16;
                }
                while (v95);
                CFIndex v4 = v164;
                if ((v8 & 0xFFFFFFF0) == (unint64_t)v8) {
                  goto LABEL_52;
                }
                uint64_t v79 = v8 & 0xFFFFFFF0;
                uint64_t v81 = v79;
                if ((v8 & 8) != 0) {
                  goto LABEL_62;
                }
              }
              else
              {
                uint64_t v79 = 0;
              }
            }
            else
            {
              uint64_t v79 = 0;
            }
            do
            {
LABEL_65:
              v5.i8[0] = *v78;
              v74->f32[v79] = logf(v74->f32[v79]/ (float)vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v5.f32)).i32[0]);
              ++v79;
            }
            while (v8 != v79);
LABEL_52:
            ++v77;
            uint64_t v7 = v137;
            uint64_t v75 = 4 * v8;
            uint64_t v74 = (float32x4_t *)((char *)v74 + v75);
            if (v77 == v137) {
              goto LABEL_4;
            }
          }
        }
        uint64_t v116 = 0;
        v117 = **(float32x4_t ***)(a1 + 40);
        do
        {
          v118 = &v164[v116];
          if (v8 >= 8)
          {
            if ((char *)v74 + v75 * v116 >= v118 + 1 || v118 >= (const char *)v74 + v75 + v75 * v116)
            {
              if (v8 < 0x10)
              {
                uint64_t v121 = 0;
LABEL_83:
                float32x4_t v122 = vdivq_f32(v136, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16(vdup_n_s16(*(unsigned __int8 *)v118), 8uLL), 8uLL))));
                uint64_t v123 = 4 * v121;
                uint64_t v124 = v121 - v76;
                do
                {
                  v125 = (float32x4_t *)((char *)v117 + v123);
                  float32x4_t v126 = vmulq_f32(*(float32x4_t *)((char *)v117 + v123 + 16), v122);
                  float32x4_t v5 = vmulq_f32(*(float32x4_t *)((char *)v117 + v123), v122);
                  float32x4_t *v125 = v5;
                  v125[1] = v126;
                  v123 += 32;
                  v124 += 8;
                }
                while (v124);
                uint64_t v119 = v8 & 0xFFFFFFF8;
                if (v76 == v8) {
                  goto LABEL_73;
                }
                goto LABEL_86;
              }
              int16x4_t v127 = (int16x4_t)vld1_dup_s8(v118);
              float32x4_t v128 = vdivq_f32(v136, vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16(v127, 8uLL), 8uLL))));
              uint64_t v129 = v8 & 0xFFFFFFF0;
              v130 = v117;
              do
              {
                float32x4_t v131 = vmulq_f32(v130[3], v128);
                float32x4_t v132 = vmulq_f32(v130[2], v128);
                float32x4_t v133 = vmulq_f32(v130[1], v128);
                float32x4_t v5 = vmulq_f32(*v130, v128);
                float32x4_t *v130 = v5;
                v130[1] = v133;
                v130[2] = v132;
                v130[3] = v131;
                v130 += 4;
                v129 -= 16;
              }
              while (v129);
              if ((v8 & 0xFFFFFFF0) == (unint64_t)v8) {
                goto LABEL_73;
              }
              uint64_t v121 = v8 & 0xFFFFFFF0;
              uint64_t v119 = v121;
              if ((v8 & 8) != 0) {
                goto LABEL_83;
              }
            }
            else
            {
              uint64_t v119 = 0;
            }
          }
          else
          {
            uint64_t v119 = 0;
          }
          do
          {
LABEL_86:
            v5.i8[0] = *v118;
            v5.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v5.f32)).u64[0];
            v5.f32[0] = (float)v5.i32[0];
            v117->f32[v119] = v117->f32[v119] / v5.f32[0];
            ++v119;
          }
          while (v8 != v119);
LABEL_73:
          ++v116;
          v117 = (float32x4_t *)((char *)v117 + 4 * v8);
        }
        while (v116 != v7);
      }
    }
LABEL_4:
    ++v6;
  }
  while (v6 != v7);
  if (v164)
  {
    operator delete(v164);
  }
}

void sub_19E2F4798(_Unwind_Exception *exception_object)
{
  CFDictionaryRef v3 = *(void **)(v1 - 128);
  if (v3)
  {
    *(void *)(v1 - 120) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E2F47D0(uint64_t a1, uint64_t a2, uint64_t a3, void *__src)
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v130 = *(void *)(a2 + 16);
  }
  sub_19E25BD4C(a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v130) < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_1EF0AB288;
  *(void *)(a1 + 1016) = __src[7];
  float32x4_t v126 = (char **)(a1 + 1048);
  int16x4_t v127 = (char **)(a1 + 1024);
  uint64_t v124 = (void **)(a1 + 1104);
  v125 = (void **)(a1 + 1080);
  *(_OWORD *)(a1 + 1056) = 0u;
  *(_OWORD *)(a1 + 1040) = 0u;
  *(_OWORD *)(a1 + 1024) = 0u;
  *(_OWORD *)(a1 + 1096) = 0u;
  *(_OWORD *)(a1 + 1112) = 0u;
  *(_OWORD *)(a1 + 1080) = 0u;
  uint64_t v7 = *((int *)__src + 32);
  int v131 = 1;
  int64x2_t v132 = vdupq_n_s64(1uLL);
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  uint64_t v133 = v7;
  sub_19E13C5C0(a1 + 16, &v131, (int *)&v136);
  uint64_t v8 = *((int *)__src + 64);
  int v131 = 9;
  int64x2_t v132 = vdupq_n_s64(1uLL);
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  uint64_t v133 = v8;
  sub_19E13C5C0(a1 + 40, &v131, (int *)&v136);
  LODWORD(v9) = *((_DWORD *)__src + 80);
  *(_DWORD *)(a1 + 1072) = v9;
  if ((int)v9 >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      float v12 = *(float *)(__src[71] + 4 * v10);
      int v13 = (int)(*(float *)(__src[70] + 4 * v10) + 0.5);
      uint64_t v14 = *(int **)(a1 + 1088);
      unint64_t v15 = *(void *)(a1 + 1096);
      if ((unint64_t)v14 < v15)
      {
        int *v14 = v13;
        uint64_t v16 = (uint64_t)(v14 + 1);
        goto LABEL_31;
      }
      uint64_t v17 = (int *)*v125;
      uint64_t v18 = (char *)v14 - (unsigned char *)*v125;
      uint64_t v19 = v18 >> 2;
      unint64_t v20 = (v18 >> 2) + 1;
      if (v20 >> 62) {
        sub_19E13D694();
      }
      uint64_t v21 = v15 - (void)v17;
      if (v21 >> 1 > v20) {
        unint64_t v20 = v21 >> 1;
      }
      unint64_t v22 = (unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v20;
      if (v22) {
        break;
      }
      uint64_t v23 = 0;
      int v24 = (int *)(4 * v19);
      *(_DWORD *)(4 * v19) = v13;
      uint64_t v16 = 4 * v19 + 4;
      if (v14 != v17) {
        goto LABEL_23;
      }
LABEL_29:
      *(void *)(a1 + 1080) = v24;
      *(void *)(a1 + 1088) = v16;
      *(void *)(a1 + 1096) = &v23[4 * v22];
      if (v17) {
        operator delete(v17);
      }
LABEL_31:
      *(void *)(a1 + 1088) = v16;
      int v34 = (int)(v12 + 0.5);
      uint64_t v35 = *(int **)(a1 + 1112);
      unint64_t v36 = *(void *)(a1 + 1120);
      if ((unint64_t)v35 >= v36)
      {
        unint64_t v37 = (int *)*v124;
        uint64_t v38 = (char *)v35 - (unsigned char *)*v124;
        uint64_t v39 = v38 >> 2;
        unint64_t v40 = (v38 >> 2) + 1;
        if (v40 >> 62) {
          sub_19E13D694();
        }
        uint64_t v41 = v36 - (void)v37;
        if (v41 >> 1 > v40) {
          unint64_t v40 = v41 >> 1;
        }
        if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v42 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v42 = v40;
        }
        if (v42)
        {
          if (v42 >> 62) {
            sub_19E13C418();
          }
          uint64_t v43 = operator new(4 * v42);
          float32x4_t v44 = (int *)&v43[4 * v39];
          *float32x4_t v44 = v34;
          uint64_t v11 = (uint64_t)(v44 + 1);
          if (v35 == v37) {
            goto LABEL_49;
          }
LABEL_43:
          unint64_t v45 = (char *)(v35 - 1) - (char *)v37;
          if (v45 < 0x2C) {
            goto LABEL_135;
          }
          if ((unint64_t)((char *)v35 - &v43[v38]) < 0x20) {
            goto LABEL_135;
          }
          uint64_t v46 = (v45 >> 2) + 1;
          uint64_t v47 = 4 * (v46 & 0x7FFFFFFFFFFFFFF8);
          int8x8_t v48 = &v35[v47 / 0xFFFFFFFFFFFFFFFCLL];
          float32x4_t v44 = (int *)((char *)v44 - v47);
          int16x8_t v49 = &v43[4 * v39 - 16];
          int8x8_t v50 = v35 - 4;
          uint64_t v51 = v46 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v52 = *(_OWORD *)v50;
            *(v49 - 1) = *((_OWORD *)v50 - 1);
            *int16x8_t v49 = v52;
            v49 -= 2;
            v50 -= 8;
            v51 -= 8;
          }
          while (v51);
          uint64_t v35 = v48;
          if (v46 != (v46 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_135:
            do
            {
              int v53 = *--v35;
              *--float32x4_t v44 = v53;
            }
            while (v35 != v37);
          }
        }
        else
        {
          uint64_t v43 = 0;
          float32x4_t v44 = (int *)(4 * v39);
          *(_DWORD *)(4 * v39) = v34;
          uint64_t v11 = 4 * v39 + 4;
          if (v35 != v37) {
            goto LABEL_43;
          }
        }
LABEL_49:
        *(void *)(a1 + 1104) = v44;
        *(void *)(a1 + 1112) = v11;
        *(void *)(a1 + 1120) = &v43[4 * v42];
        if (v37) {
          operator delete(v37);
        }
        goto LABEL_9;
      }
      int *v35 = v34;
      uint64_t v11 = (uint64_t)(v35 + 1);
LABEL_9:
      *(void *)(a1 + 1112) = v11;
      ++v10;
      uint64_t v9 = *(int *)(a1 + 1072);
      if (v10 >= v9) {
        goto LABEL_51;
      }
    }
    if (v22 >> 62) {
      sub_19E13C418();
    }
    uint64_t v23 = operator new(4 * v22);
    int v24 = (int *)&v23[4 * v19];
    *int v24 = v13;
    uint64_t v16 = (uint64_t)(v24 + 1);
    if (v14 == v17) {
      goto LABEL_29;
    }
LABEL_23:
    unint64_t v25 = (char *)(v14 - 1) - (char *)v17;
    if (v25 < 0x2C) {
      goto LABEL_136;
    }
    if ((unint64_t)((char *)v14 - &v23[v18]) < 0x20) {
      goto LABEL_136;
    }
    uint64_t v26 = (v25 >> 2) + 1;
    uint64_t v27 = 4 * (v26 & 0x7FFFFFFFFFFFFFF8);
    float v28 = &v14[v27 / 0xFFFFFFFFFFFFFFFCLL];
    int v24 = (int *)((char *)v24 - v27);
    uint64_t v29 = &v23[4 * v19 - 16];
    uint64_t v30 = v14 - 4;
    uint64_t v31 = v26 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      long long v32 = *(_OWORD *)v30;
      *(v29 - 1) = *((_OWORD *)v30 - 1);
      *uint64_t v29 = v32;
      v29 -= 2;
      v30 -= 8;
      v31 -= 8;
    }
    while (v31);
    uint64_t v14 = v28;
    if (v26 != (v26 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_136:
      do
      {
        int v33 = *--v14;
        *--int v24 = v33;
      }
      while (v14 != v17);
    }
    goto LABEL_29;
  }
LABEL_51:
  **(_DWORD **)(a1 + 1104) = v9 + **(_DWORD **)(a1 + 1104) - 1;
  uint64_t v54 = __src[56];
  uint64_t v55 = *(char **)(a1 + 1032);
  unint64_t v56 = *(void *)(a1 + 1040);
  if ((unint64_t)v55 < v56)
  {
    *(void *)uint64_t v55 = v54;
    uint64_t v57 = (uint64_t)(v55 + 8);
    goto LABEL_73;
  }
  float32x4_t v58 = *v127;
  uint64_t v59 = v55 - *v127;
  uint64_t v60 = v59 >> 3;
  unint64_t v61 = (v59 >> 3) + 1;
  if (v61 >> 61) {
    sub_19E13D694();
  }
  uint64_t v62 = v56 - (void)v58;
  if (v62 >> 2 > v61) {
    unint64_t v61 = v62 >> 2;
  }
  if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v63 = v61;
  }
  if (!v63)
  {
    float32x4_t v64 = 0;
    int8x16_t v65 = (void *)(8 * v60);
    int16x8_t v66 = 0;
    *(void *)(8 * v60) = v54;
    uint64_t v57 = 8 * v60 + 8;
    int16x8_t v67 = (char *)(v55 - v58);
    if (v55 != v58) {
      goto LABEL_62;
    }
LABEL_71:
    *(void *)(a1 + 1024) = v65;
    *(void *)(a1 + 1032) = v57;
    *(void *)(a1 + 1040) = v66;
    if (!v55) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
  if (v63 >> 61) {
    sub_19E13C418();
  }
  float32x4_t v64 = operator new(8 * v63);
  int8x16_t v65 = &v64[8 * v60];
  int16x8_t v66 = &v64[8 * v63];
  *int8x16_t v65 = v54;
  uint64_t v57 = (uint64_t)(v65 + 1);
  int16x8_t v67 = (char *)(v55 - v58);
  if (v55 == v58) {
    goto LABEL_71;
  }
LABEL_62:
  unint64_t v68 = (unint64_t)(v67 - 8);
  if (v68 < 0x58) {
    goto LABEL_137;
  }
  if ((unint64_t)(v55 - v64 - v59) < 0x20) {
    goto LABEL_137;
  }
  uint64_t v69 = (v68 >> 3) + 1;
  uint64_t v70 = 8 * (v69 & 0x3FFFFFFFFFFFFFFCLL);
  float32x4_t v71 = &v55[-v70];
  int8x16_t v65 = (void *)((char *)v65 - v70);
  uint64_t v72 = &v64[8 * v60 - 16];
  unsigned int v73 = v55 - 16;
  uint64_t v74 = v69 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v75 = *(_OWORD *)v73;
    *(v72 - 1) = *((_OWORD *)v73 - 1);
    *uint64_t v72 = v75;
    v72 -= 2;
    v73 -= 32;
    v74 -= 4;
  }
  while (v74);
  uint64_t v55 = v71;
  if (v69 != (v69 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_137:
    do
    {
      uint64_t v76 = *((void *)v55 - 1);
      v55 -= 8;
      *--int8x16_t v65 = v76;
    }
    while (v55 != v58);
  }
  uint64_t v55 = *v127;
  *(void *)(a1 + 1024) = v65;
  *(void *)(a1 + 1032) = v57;
  *(void *)(a1 + 1040) = v66;
  if (v55) {
LABEL_72:
  }
    operator delete(v55);
LABEL_73:
  *(void *)(a1 + 1032) = v57;
  if (*(int *)(a1 + 1072) >= 2)
  {
    uint64_t v77 = 1;
    float32x4_t v128 = __src;
    do
    {
      uint64_t v79 = (char *)&__src[v77];
      uint64_t v80 = *((void *)v79 + 56);
      uint64_t v81 = *(char **)(a1 + 1032);
      unint64_t v82 = *(void *)(a1 + 1040);
      if ((unint64_t)v81 < v82)
      {
        *(void *)uint64_t v81 = v80;
        uint64_t v83 = (uint64_t)(v81 + 8);
        goto LABEL_100;
      }
      uint64_t v84 = *v127;
      uint64_t v85 = v81 - *v127;
      uint64_t v86 = v85 >> 3;
      unint64_t v87 = (v85 >> 3) + 1;
      if (v87 >> 61) {
        sub_19E13D694();
      }
      uint64_t v88 = v82 - (void)v84;
      if (v88 >> 2 > v87) {
        unint64_t v87 = v88 >> 2;
      }
      if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v89 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v89 = v87;
      }
      if (v89)
      {
        if (v89 >> 61) {
          sub_19E13C418();
        }
        float32x4_t v90 = operator new(8 * v89);
        float v91 = &v90[8 * v86];
        *float v91 = v80;
        uint64_t v83 = (uint64_t)(v91 + 1);
        if (v81 != v84)
        {
LABEL_88:
          unint64_t v92 = v81 - 8 - v84;
          if (v92 < 0x58)
          {
            __src = v128;
            goto LABEL_97;
          }
          unint64_t v93 = v81 - &v90[v85];
          __src = v128;
          if (v93 < 0x20) {
            goto LABEL_138;
          }
          uint64_t v94 = (v92 >> 3) + 1;
          uint64_t v95 = 8 * (v94 & 0x3FFFFFFFFFFFFFFCLL);
          uint64_t v96 = &v81[-v95];
          float v91 = (void *)((char *)v91 - v95);
          float32x4_t v97 = &v90[8 * v86 - 16];
          float v98 = v81 - 16;
          uint64_t v99 = v94 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v100 = *(_OWORD *)v98;
            *(v97 - 1) = *((_OWORD *)v98 - 1);
            *float32x4_t v97 = v100;
            v97 -= 2;
            v98 -= 32;
            v99 -= 4;
          }
          while (v99);
          uint64_t v81 = v96;
          if (v94 != (v94 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_138:
            do
            {
LABEL_97:
              uint64_t v101 = *((void *)v81 - 1);
              v81 -= 8;
              *--float v91 = v101;
            }
            while (v81 != v84);
          }
          uint64_t v81 = *v127;
          *(void *)(a1 + 1024) = v91;
          *(void *)(a1 + 1032) = v83;
          *(void *)(a1 + 1040) = &v90[8 * v89];
          if (!v81) {
            goto LABEL_100;
          }
LABEL_99:
          operator delete(v81);
          goto LABEL_100;
        }
      }
      else
      {
        float32x4_t v90 = 0;
        float v91 = (void *)(8 * v86);
        *(void *)(8 * v86) = v80;
        uint64_t v83 = 8 * v86 + 8;
        if (v81 != v84) {
          goto LABEL_88;
        }
      }
      __src = v128;
      *(void *)(a1 + 1024) = v91;
      *(void *)(a1 + 1032) = v83;
      *(void *)(a1 + 1040) = &v90[8 * v89];
      if (v81) {
        goto LABEL_99;
      }
LABEL_100:
      *(void *)(a1 + 1032) = v83;
      uint64_t v102 = *((void *)v79 + 71);
      float v103 = *(char **)(a1 + 1056);
      unint64_t v104 = *(void *)(a1 + 1064);
      if ((unint64_t)v103 < v104)
      {
        *(void *)float v103 = v102;
        uint64_t v78 = (uint64_t)(v103 + 8);
        goto LABEL_76;
      }
      float v105 = *v126;
      uint64_t v106 = v103 - *v126;
      uint64_t v107 = v106 >> 3;
      unint64_t v108 = (v106 >> 3) + 1;
      if (v108 >> 61) {
        sub_19E13D694();
      }
      uint64_t v109 = v104 - (void)v105;
      if (v109 >> 2 > v108) {
        unint64_t v108 = v109 >> 2;
      }
      if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v110 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v110 = v108;
      }
      if (v110)
      {
        if (v110 >> 61) {
          sub_19E13C418();
        }
        float32x4_t v111 = operator new(8 * v110);
        float32x4_t v112 = &v111[8 * v107];
        *float32x4_t v112 = v102;
        uint64_t v78 = (uint64_t)(v112 + 1);
        if (v103 == v105)
        {
LABEL_113:
          __src = v128;
          *(void *)(a1 + 1048) = v112;
          *(void *)(a1 + 1056) = v78;
          *(void *)(a1 + 1064) = &v111[8 * v110];
          if (!v103) {
            goto LABEL_76;
          }
LABEL_121:
          operator delete(v103);
          goto LABEL_76;
        }
      }
      else
      {
        float32x4_t v111 = 0;
        float32x4_t v112 = (void *)(8 * v107);
        *(void *)(8 * v107) = v102;
        uint64_t v78 = 8 * v107 + 8;
        if (v103 == v105) {
          goto LABEL_113;
        }
      }
      unint64_t v113 = v103 - 8 - v105;
      if (v113 < 0x58)
      {
        __src = v128;
        do
        {
LABEL_119:
          uint64_t v122 = *((void *)v103 - 1);
          v103 -= 8;
          *--float32x4_t v112 = v122;
        }
        while (v103 != v105);
        goto LABEL_120;
      }
      unint64_t v114 = v103 - &v111[v106];
      __src = v128;
      if (v114 < 0x20) {
        goto LABEL_119;
      }
      uint64_t v115 = (v113 >> 3) + 1;
      uint64_t v116 = 8 * (v115 & 0x3FFFFFFFFFFFFFFCLL);
      v117 = &v103[-v116];
      float32x4_t v112 = (void *)((char *)v112 - v116);
      v118 = &v111[8 * v107 - 16];
      uint64_t v119 = (long long *)(v103 - 16);
      uint64_t v120 = v115 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v121 = *v119;
        *(v118 - 1) = *(v119 - 1);
        _OWORD *v118 = v121;
        v118 -= 2;
        v119 -= 2;
        v120 -= 4;
      }
      while (v120);
      float v103 = v117;
      if (v115 != (v115 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_119;
      }
LABEL_120:
      float v103 = *v126;
      *(void *)(a1 + 1048) = v112;
      *(void *)(a1 + 1056) = v78;
      *(void *)(a1 + 1064) = &v111[8 * v110];
      if (v103) {
        goto LABEL_121;
      }
LABEL_76:
      *(void *)(a1 + 1056) = v78;
      ++v77;
    }
    while (v77 < *(int *)(a1 + 1072));
  }
  return a1;
}

void sub_19E2F5104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, void **a11, void **a12, void **a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  unint64_t v22 = *a10;
  if (*a10)
  {
    v20[139] = v22;
    operator delete(v22);
    uint64_t v23 = *a11;
    if (!*a11)
    {
LABEL_3:
      int v24 = *a12;
      if (!*a12) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v23 = *a11;
    if (!*a11) {
      goto LABEL_3;
    }
  }
  v20[136] = v23;
  operator delete(v23);
  int v24 = *a12;
  if (!*a12)
  {
LABEL_4:
    unint64_t v25 = *a13;
    if (!*a13) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  v20[132] = v24;
  operator delete(v24);
  unint64_t v25 = *a13;
  if (!*a13)
  {
LABEL_5:
    sub_19E25BF30((uint64_t)v20);
    _Unwind_Resume(a1);
  }
LABEL_9:
  v20[129] = v25;
  operator delete(v25);
  sub_19E25BF30((uint64_t)v20);
  _Unwind_Resume(a1);
}

uint64_t sub_19E2F51E4(void *a1, uint64_t a2)
{
  CFIndex v4 = (void *)a1[20];
  float32x4_t v5 = (void *)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      (*(void (**)(void))(*(void *)*v4 + 8))(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    uint64_t v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        uint64_t v9 = (uint64_t *)v6[1];
        operator delete(v6);
        uint64_t v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  uint64_t v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 24);

  return v10(a2, a1);
}

int64x2_t sub_19E2F52EC(uint64_t a1, int a2)
{
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
  uint64_t v7 = (uint64_t **)(a1 + 48);
  uint64_t v6 = *(char **)(a1 + 48);
  uint64_t v8 = *(int *)(a1 + 568);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a2) {
          break;
        }
        uint64_t v6 = *(char **)v9;
        uint64_t v7 = (uint64_t **)v9;
        if (!*(void *)v9) {
          goto LABEL_8;
        }
      }
      if (v10 >= a2) {
        break;
      }
      uint64_t v6 = (char *)*((void *)v9 + 1);
      if (!v6)
      {
        uint64_t v7 = (uint64_t **)(v9 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v9 = (char *)(a1 + 48);
LABEL_8:
    uint64_t v11 = v9;
    uint64_t v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a2;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((void *)v9 + 9) = 0;
    *(void *)uint64_t v9 = 0;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = v11;
    unsigned char *v7 = (uint64_t *)v9;
    uint64_t v12 = **(void **)(a1 + 40);
    int v13 = (uint64_t *)v9;
    if (v12)
    {
      *(void *)(a1 + 40) = v12;
      int v13 = *v7;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 48), v13);
    ++*(void *)(a1 + 56);
  }
  int64x2_t result = vdupq_n_s64(1uLL);
  *(int64x2_t *)(v9 + 40) = result;
  *((void *)v9 + 7) = v8;
  *((void *)v9 + 8) = v4;
  *((void *)v9 + 9) = v5;
  return result;
}

uint64_t sub_19E2F543C(uint64_t a1, uint64_t a2, uint64_t a3, void *__src)
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v130 = *(void *)(a2 + 16);
  }
  sub_19E25E2E0(a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v130) < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_1EF0AB118;
  *(void *)(a1 + 1016) = __src[7];
  float32x4_t v126 = (char **)(a1 + 1048);
  int16x4_t v127 = (char **)(a1 + 1024);
  uint64_t v124 = (void **)(a1 + 1104);
  v125 = (void **)(a1 + 1080);
  *(_OWORD *)(a1 + 1056) = 0u;
  *(_OWORD *)(a1 + 1040) = 0u;
  *(_OWORD *)(a1 + 1024) = 0u;
  *(_OWORD *)(a1 + 1096) = 0u;
  *(_OWORD *)(a1 + 1112) = 0u;
  *(_OWORD *)(a1 + 1080) = 0u;
  uint64_t v7 = *((int *)__src + 32);
  int v131 = 1;
  int64x2_t v132 = vdupq_n_s64(1uLL);
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  uint64_t v133 = v7;
  sub_19E13C5C0(a1 + 16, &v131, (int *)&v136);
  uint64_t v8 = *((int *)__src + 64);
  int v131 = 9;
  int64x2_t v132 = vdupq_n_s64(1uLL);
  uint64_t v134 = 0;
  uint64_t v135 = 0;
  uint64_t v133 = v8;
  sub_19E13C5C0(a1 + 40, &v131, (int *)&v136);
  LODWORD(v9) = *((_DWORD *)__src + 80);
  *(_DWORD *)(a1 + 1072) = v9;
  if ((int)v9 >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      float v12 = *(float *)(__src[71] + 4 * v10);
      int v13 = (int)(*(float *)(__src[70] + 4 * v10) + 0.5);
      uint64_t v14 = *(int **)(a1 + 1088);
      unint64_t v15 = *(void *)(a1 + 1096);
      if ((unint64_t)v14 < v15)
      {
        int *v14 = v13;
        uint64_t v16 = (uint64_t)(v14 + 1);
        goto LABEL_31;
      }
      uint64_t v17 = (int *)*v125;
      uint64_t v18 = (char *)v14 - (unsigned char *)*v125;
      uint64_t v19 = v18 >> 2;
      unint64_t v20 = (v18 >> 2) + 1;
      if (v20 >> 62) {
        sub_19E13D694();
      }
      uint64_t v21 = v15 - (void)v17;
      if (v21 >> 1 > v20) {
        unint64_t v20 = v21 >> 1;
      }
      unint64_t v22 = (unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v20;
      if (v22) {
        break;
      }
      uint64_t v23 = 0;
      int v24 = (int *)(4 * v19);
      *(_DWORD *)(4 * v19) = v13;
      uint64_t v16 = 4 * v19 + 4;
      if (v14 != v17) {
        goto LABEL_23;
      }
LABEL_29:
      *(void *)(a1 + 1080) = v24;
      *(void *)(a1 + 1088) = v16;
      *(void *)(a1 + 1096) = &v23[4 * v22];
      if (v17) {
        operator delete(v17);
      }
LABEL_31:
      *(void *)(a1 + 1088) = v16;
      int v34 = (int)(v12 + 0.5);
      uint64_t v35 = *(int **)(a1 + 1112);
      unint64_t v36 = *(void *)(a1 + 1120);
      if ((unint64_t)v35 >= v36)
      {
        unint64_t v37 = (int *)*v124;
        uint64_t v38 = (char *)v35 - (unsigned char *)*v124;
        uint64_t v39 = v38 >> 2;
        unint64_t v40 = (v38 >> 2) + 1;
        if (v40 >> 62) {
          sub_19E13D694();
        }
        uint64_t v41 = v36 - (void)v37;
        if (v41 >> 1 > v40) {
          unint64_t v40 = v41 >> 1;
        }
        if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v42 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v42 = v40;
        }
        if (v42)
        {
          if (v42 >> 62) {
            sub_19E13C418();
          }
          uint64_t v43 = operator new(4 * v42);
          float32x4_t v44 = (int *)&v43[4 * v39];
          *float32x4_t v44 = v34;
          uint64_t v11 = (uint64_t)(v44 + 1);
          if (v35 == v37) {
            goto LABEL_49;
          }
LABEL_43:
          unint64_t v45 = (char *)(v35 - 1) - (char *)v37;
          if (v45 < 0x2C) {
            goto LABEL_135;
          }
          if ((unint64_t)((char *)v35 - &v43[v38]) < 0x20) {
            goto LABEL_135;
          }
          uint64_t v46 = (v45 >> 2) + 1;
          uint64_t v47 = 4 * (v46 & 0x7FFFFFFFFFFFFFF8);
          int8x8_t v48 = &v35[v47 / 0xFFFFFFFFFFFFFFFCLL];
          float32x4_t v44 = (int *)((char *)v44 - v47);
          int16x8_t v49 = &v43[4 * v39 - 16];
          int8x8_t v50 = v35 - 4;
          uint64_t v51 = v46 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v52 = *(_OWORD *)v50;
            *(v49 - 1) = *((_OWORD *)v50 - 1);
            *int16x8_t v49 = v52;
            v49 -= 2;
            v50 -= 8;
            v51 -= 8;
          }
          while (v51);
          uint64_t v35 = v48;
          if (v46 != (v46 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_135:
            do
            {
              int v53 = *--v35;
              *--float32x4_t v44 = v53;
            }
            while (v35 != v37);
          }
        }
        else
        {
          uint64_t v43 = 0;
          float32x4_t v44 = (int *)(4 * v39);
          *(_DWORD *)(4 * v39) = v34;
          uint64_t v11 = 4 * v39 + 4;
          if (v35 != v37) {
            goto LABEL_43;
          }
        }
LABEL_49:
        *(void *)(a1 + 1104) = v44;
        *(void *)(a1 + 1112) = v11;
        *(void *)(a1 + 1120) = &v43[4 * v42];
        if (v37) {
          operator delete(v37);
        }
        goto LABEL_9;
      }
      int *v35 = v34;
      uint64_t v11 = (uint64_t)(v35 + 1);
LABEL_9:
      *(void *)(a1 + 1112) = v11;
      ++v10;
      uint64_t v9 = *(int *)(a1 + 1072);
      if (v10 >= v9) {
        goto LABEL_51;
      }
    }
    if (v22 >> 62) {
      sub_19E13C418();
    }
    uint64_t v23 = operator new(4 * v22);
    int v24 = (int *)&v23[4 * v19];
    *int v24 = v13;
    uint64_t v16 = (uint64_t)(v24 + 1);
    if (v14 == v17) {
      goto LABEL_29;
    }
LABEL_23:
    unint64_t v25 = (char *)(v14 - 1) - (char *)v17;
    if (v25 < 0x2C) {
      goto LABEL_136;
    }
    if ((unint64_t)((char *)v14 - &v23[v18]) < 0x20) {
      goto LABEL_136;
    }
    uint64_t v26 = (v25 >> 2) + 1;
    uint64_t v27 = 4 * (v26 & 0x7FFFFFFFFFFFFFF8);
    float v28 = &v14[v27 / 0xFFFFFFFFFFFFFFFCLL];
    int v24 = (int *)((char *)v24 - v27);
    uint64_t v29 = &v23[4 * v19 - 16];
    uint64_t v30 = v14 - 4;
    uint64_t v31 = v26 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      long long v32 = *(_OWORD *)v30;
      *(v29 - 1) = *((_OWORD *)v30 - 1);
      *uint64_t v29 = v32;
      v29 -= 2;
      v30 -= 8;
      v31 -= 8;
    }
    while (v31);
    uint64_t v14 = v28;
    if (v26 != (v26 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_136:
      do
      {
        int v33 = *--v14;
        *--int v24 = v33;
      }
      while (v14 != v17);
    }
    goto LABEL_29;
  }
LABEL_51:
  **(_DWORD **)(a1 + 1104) = v9 + **(_DWORD **)(a1 + 1104) - 1;
  uint64_t v54 = __src[56];
  uint64_t v55 = *(char **)(a1 + 1032);
  unint64_t v56 = *(void *)(a1 + 1040);
  if ((unint64_t)v55 < v56)
  {
    *(void *)uint64_t v55 = v54;
    uint64_t v57 = (uint64_t)(v55 + 8);
    goto LABEL_73;
  }
  float32x4_t v58 = *v127;
  uint64_t v59 = v55 - *v127;
  uint64_t v60 = v59 >> 3;
  unint64_t v61 = (v59 >> 3) + 1;
  if (v61 >> 61) {
    sub_19E13D694();
  }
  uint64_t v62 = v56 - (void)v58;
  if (v62 >> 2 > v61) {
    unint64_t v61 = v62 >> 2;
  }
  if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v63 = v61;
  }
  if (!v63)
  {
    float32x4_t v64 = 0;
    int8x16_t v65 = (void *)(8 * v60);
    int16x8_t v66 = 0;
    *(void *)(8 * v60) = v54;
    uint64_t v57 = 8 * v60 + 8;
    int16x8_t v67 = (char *)(v55 - v58);
    if (v55 != v58) {
      goto LABEL_62;
    }
LABEL_71:
    *(void *)(a1 + 1024) = v65;
    *(void *)(a1 + 1032) = v57;
    *(void *)(a1 + 1040) = v66;
    if (!v55) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
  if (v63 >> 61) {
    sub_19E13C418();
  }
  float32x4_t v64 = operator new(8 * v63);
  int8x16_t v65 = &v64[8 * v60];
  int16x8_t v66 = &v64[8 * v63];
  *int8x16_t v65 = v54;
  uint64_t v57 = (uint64_t)(v65 + 1);
  int16x8_t v67 = (char *)(v55 - v58);
  if (v55 == v58) {
    goto LABEL_71;
  }
LABEL_62:
  unint64_t v68 = (unint64_t)(v67 - 8);
  if (v68 < 0x58) {
    goto LABEL_137;
  }
  if ((unint64_t)(v55 - v64 - v59) < 0x20) {
    goto LABEL_137;
  }
  uint64_t v69 = (v68 >> 3) + 1;
  uint64_t v70 = 8 * (v69 & 0x3FFFFFFFFFFFFFFCLL);
  float32x4_t v71 = &v55[-v70];
  int8x16_t v65 = (void *)((char *)v65 - v70);
  uint64_t v72 = &v64[8 * v60 - 16];
  unsigned int v73 = v55 - 16;
  uint64_t v74 = v69 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v75 = *(_OWORD *)v73;
    *(v72 - 1) = *((_OWORD *)v73 - 1);
    *uint64_t v72 = v75;
    v72 -= 2;
    v73 -= 32;
    v74 -= 4;
  }
  while (v74);
  uint64_t v55 = v71;
  if (v69 != (v69 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_137:
    do
    {
      uint64_t v76 = *((void *)v55 - 1);
      v55 -= 8;
      *--int8x16_t v65 = v76;
    }
    while (v55 != v58);
  }
  uint64_t v55 = *v127;
  *(void *)(a1 + 1024) = v65;
  *(void *)(a1 + 1032) = v57;
  *(void *)(a1 + 1040) = v66;
  if (v55) {
LABEL_72:
  }
    operator delete(v55);
LABEL_73:
  *(void *)(a1 + 1032) = v57;
  if (*(int *)(a1 + 1072) >= 2)
  {
    uint64_t v77 = 1;
    float32x4_t v128 = __src;
    do
    {
      uint64_t v79 = (char *)&__src[v77];
      uint64_t v80 = *((void *)v79 + 56);
      uint64_t v81 = *(char **)(a1 + 1032);
      unint64_t v82 = *(void *)(a1 + 1040);
      if ((unint64_t)v81 < v82)
      {
        *(void *)uint64_t v81 = v80;
        uint64_t v83 = (uint64_t)(v81 + 8);
        goto LABEL_100;
      }
      uint64_t v84 = *v127;
      uint64_t v85 = v81 - *v127;
      uint64_t v86 = v85 >> 3;
      unint64_t v87 = (v85 >> 3) + 1;
      if (v87 >> 61) {
        sub_19E13D694();
      }
      uint64_t v88 = v82 - (void)v84;
      if (v88 >> 2 > v87) {
        unint64_t v87 = v88 >> 2;
      }
      if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v89 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v89 = v87;
      }
      if (v89)
      {
        if (v89 >> 61) {
          sub_19E13C418();
        }
        float32x4_t v90 = operator new(8 * v89);
        float v91 = &v90[8 * v86];
        *float v91 = v80;
        uint64_t v83 = (uint64_t)(v91 + 1);
        if (v81 != v84)
        {
LABEL_88:
          unint64_t v92 = v81 - 8 - v84;
          if (v92 < 0x58)
          {
            __src = v128;
            goto LABEL_97;
          }
          unint64_t v93 = v81 - &v90[v85];
          __src = v128;
          if (v93 < 0x20) {
            goto LABEL_138;
          }
          uint64_t v94 = (v92 >> 3) + 1;
          uint64_t v95 = 8 * (v94 & 0x3FFFFFFFFFFFFFFCLL);
          uint64_t v96 = &v81[-v95];
          float v91 = (void *)((char *)v91 - v95);
          float32x4_t v97 = &v90[8 * v86 - 16];
          float v98 = v81 - 16;
          uint64_t v99 = v94 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v100 = *(_OWORD *)v98;
            *(v97 - 1) = *((_OWORD *)v98 - 1);
            *float32x4_t v97 = v100;
            v97 -= 2;
            v98 -= 32;
            v99 -= 4;
          }
          while (v99);
          uint64_t v81 = v96;
          if (v94 != (v94 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_138:
            do
            {
LABEL_97:
              uint64_t v101 = *((void *)v81 - 1);
              v81 -= 8;
              *--float v91 = v101;
            }
            while (v81 != v84);
          }
          uint64_t v81 = *v127;
          *(void *)(a1 + 1024) = v91;
          *(void *)(a1 + 1032) = v83;
          *(void *)(a1 + 1040) = &v90[8 * v89];
          if (!v81) {
            goto LABEL_100;
          }
LABEL_99:
          operator delete(v81);
          goto LABEL_100;
        }
      }
      else
      {
        float32x4_t v90 = 0;
        float v91 = (void *)(8 * v86);
        *(void *)(8 * v86) = v80;
        uint64_t v83 = 8 * v86 + 8;
        if (v81 != v84) {
          goto LABEL_88;
        }
      }
      __src = v128;
      *(void *)(a1 + 1024) = v91;
      *(void *)(a1 + 1032) = v83;
      *(void *)(a1 + 1040) = &v90[8 * v89];
      if (v81) {
        goto LABEL_99;
      }
LABEL_100:
      *(void *)(a1 + 1032) = v83;
      uint64_t v102 = *((void *)v79 + 71);
      float v103 = *(char **)(a1 + 1056);
      unint64_t v104 = *(void *)(a1 + 1064);
      if ((unint64_t)v103 < v104)
      {
        *(void *)float v103 = v102;
        uint64_t v78 = (uint64_t)(v103 + 8);
        goto LABEL_76;
      }
      float v105 = *v126;
      uint64_t v106 = v103 - *v126;
      uint64_t v107 = v106 >> 3;
      unint64_t v108 = (v106 >> 3) + 1;
      if (v108 >> 61) {
        sub_19E13D694();
      }
      uint64_t v109 = v104 - (void)v105;
      if (v109 >> 2 > v108) {
        unint64_t v108 = v109 >> 2;
      }
      if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v110 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v110 = v108;
      }
      if (v110)
      {
        if (v110 >> 61) {
          sub_19E13C418();
        }
        float32x4_t v111 = operator new(8 * v110);
        float32x4_t v112 = &v111[8 * v107];
        *float32x4_t v112 = v102;
        uint64_t v78 = (uint64_t)(v112 + 1);
        if (v103 == v105)
        {
LABEL_113:
          __src = v128;
          *(void *)(a1 + 1048) = v112;
          *(void *)(a1 + 1056) = v78;
          *(void *)(a1 + 1064) = &v111[8 * v110];
          if (!v103) {
            goto LABEL_76;
          }
LABEL_121:
          operator delete(v103);
          goto LABEL_76;
        }
      }
      else
      {
        float32x4_t v111 = 0;
        float32x4_t v112 = (void *)(8 * v107);
        *(void *)(8 * v107) = v102;
        uint64_t v78 = 8 * v107 + 8;
        if (v103 == v105) {
          goto LABEL_113;
        }
      }
      unint64_t v113 = v103 - 8 - v105;
      if (v113 < 0x58)
      {
        __src = v128;
        do
        {
LABEL_119:
          uint64_t v122 = *((void *)v103 - 1);
          v103 -= 8;
          *--float32x4_t v112 = v122;
        }
        while (v103 != v105);
        goto LABEL_120;
      }
      unint64_t v114 = v103 - &v111[v106];
      __src = v128;
      if (v114 < 0x20) {
        goto LABEL_119;
      }
      uint64_t v115 = (v113 >> 3) + 1;
      uint64_t v116 = 8 * (v115 & 0x3FFFFFFFFFFFFFFCLL);
      v117 = &v103[-v116];
      float32x4_t v112 = (void *)((char *)v112 - v116);
      v118 = &v111[8 * v107 - 16];
      uint64_t v119 = (long long *)(v103 - 16);
      uint64_t v120 = v115 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v121 = *v119;
        *(v118 - 1) = *(v119 - 1);
        _OWORD *v118 = v121;
        v118 -= 2;
        v119 -= 2;
        v120 -= 4;
      }
      while (v120);
      float v103 = v117;
      if (v115 != (v115 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_119;
      }
LABEL_120:
      float v103 = *v126;
      *(void *)(a1 + 1048) = v112;
      *(void *)(a1 + 1056) = v78;
      *(void *)(a1 + 1064) = &v111[8 * v110];
      if (v103) {
        goto LABEL_121;
      }
LABEL_76:
      *(void *)(a1 + 1056) = v78;
      ++v77;
    }
    while (v77 < *(int *)(a1 + 1072));
  }
  return a1;
}

void sub_19E2F5D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, void **a11, void **a12, void **a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  unint64_t v22 = *a10;
  if (*a10)
  {
    v20[139] = v22;
    operator delete(v22);
    uint64_t v23 = *a11;
    if (!*a11)
    {
LABEL_3:
      int v24 = *a12;
      if (!*a12) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v23 = *a11;
    if (!*a11) {
      goto LABEL_3;
    }
  }
  v20[136] = v23;
  operator delete(v23);
  int v24 = *a12;
  if (!*a12)
  {
LABEL_4:
    unint64_t v25 = *a13;
    if (!*a13) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  v20[132] = v24;
  operator delete(v24);
  unint64_t v25 = *a13;
  if (!*a13)
  {
LABEL_5:
    sub_19E25E4C4((uint64_t)v20);
    _Unwind_Resume(a1);
  }
LABEL_9:
  v20[129] = v25;
  operator delete(v25);
  sub_19E25E4C4((uint64_t)v20);
  _Unwind_Resume(a1);
}

uint64_t sub_19E2F5E50(void *a1, uint64_t a2)
{
  int v4 = (void *)a1[20];
  int v5 = (void *)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      (*(void (**)(void))(*(void *)*v4 + 8))(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    uint64_t v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        uint64_t v9 = (uint64_t *)v6[1];
        operator delete(v6);
        uint64_t v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  uint64_t v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 128);

  return v10(a2, a1);
}

int64x2_t sub_19E2F5F58(uint64_t a1, int a2)
{
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
  uint64_t v7 = (uint64_t **)(a1 + 48);
  uint64_t v6 = *(char **)(a1 + 48);
  uint64_t v8 = *(int *)(a1 + 568);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a2) {
          break;
        }
        uint64_t v6 = *(char **)v9;
        uint64_t v7 = (uint64_t **)v9;
        if (!*(void *)v9) {
          goto LABEL_8;
        }
      }
      if (v10 >= a2) {
        break;
      }
      uint64_t v6 = (char *)*((void *)v9 + 1);
      if (!v6)
      {
        uint64_t v7 = (uint64_t **)(v9 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v9 = (char *)(a1 + 48);
LABEL_8:
    uint64_t v11 = v9;
    uint64_t v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a2;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((void *)v9 + 9) = 0;
    *(void *)uint64_t v9 = 0;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = v11;
    unsigned char *v7 = (uint64_t *)v9;
    uint64_t v12 = **(void **)(a1 + 40);
    int v13 = (uint64_t *)v9;
    if (v12)
    {
      *(void *)(a1 + 40) = v12;
      int v13 = *v7;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 48), v13);
    ++*(void *)(a1 + 56);
  }
  int64x2_t result = vdupq_n_s64(1uLL);
  *(int64x2_t *)(v9 + 40) = result;
  *((void *)v9 + 7) = v8;
  *((void *)v9 + 8) = v4;
  *((void *)v9 + 9) = v5;
  return result;
}

uint64_t sub_19E2F60A8(void *a1)
{
  *a1 = &unk_1EF0AB288;
  uint64_t v2 = (void *)a1[138];
  if (v2)
  {
    a1[139] = v2;
    operator delete(v2);
  }
  CFDictionaryRef v3 = (void *)a1[135];
  if (v3)
  {
    a1[136] = v3;
    operator delete(v3);
  }
  int v4 = (void *)a1[131];
  if (v4)
  {
    a1[132] = v4;
    operator delete(v4);
  }
  int v5 = (void *)a1[128];
  if (v5)
  {
    a1[129] = v5;
    operator delete(v5);
  }

  return sub_19E25BF30((uint64_t)a1);
}

void sub_19E2F6138(void *a1)
{
  *a1 = &unk_1EF0AB288;
  uint64_t v2 = (void *)a1[138];
  if (v2)
  {
    a1[139] = v2;
    operator delete(v2);
  }
  CFDictionaryRef v3 = (void *)a1[135];
  if (v3)
  {
    a1[136] = v3;
    operator delete(v3);
  }
  int v4 = (void *)a1[131];
  if (v4)
  {
    a1[132] = v4;
    operator delete(v4);
  }
  int v5 = (void *)a1[128];
  if (v5)
  {
    a1[129] = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)sub_19E25BF30((uint64_t)a1);

  operator delete(v6);
}

uint64_t sub_19E2F61CC(void *a1)
{
  *a1 = &unk_1EF0AB118;
  uint64_t v2 = (void *)a1[138];
  if (v2)
  {
    a1[139] = v2;
    operator delete(v2);
  }
  CFDictionaryRef v3 = (void *)a1[135];
  if (v3)
  {
    a1[136] = v3;
    operator delete(v3);
  }
  int v4 = (void *)a1[131];
  if (v4)
  {
    a1[132] = v4;
    operator delete(v4);
  }
  int v5 = (void *)a1[128];
  if (v5)
  {
    a1[129] = v5;
    operator delete(v5);
  }

  return sub_19E25E4C4((uint64_t)a1);
}

void sub_19E2F625C(void *a1)
{
  *a1 = &unk_1EF0AB118;
  uint64_t v2 = (void *)a1[138];
  if (v2)
  {
    a1[139] = v2;
    operator delete(v2);
  }
  CFDictionaryRef v3 = (void *)a1[135];
  if (v3)
  {
    a1[136] = v3;
    operator delete(v3);
  }
  int v4 = (void *)a1[131];
  if (v4)
  {
    a1[132] = v4;
    operator delete(v4);
  }
  int v5 = (void *)a1[128];
  if (v5)
  {
    a1[129] = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)sub_19E25E4C4((uint64_t)a1);

  operator delete(v6);
}

uint64_t sub_19E2F62F0()
{
  return 32;
}

uint64_t sub_19E2F62F8()
{
  return 16;
}

uint64_t sub_19E2F6300()
{
  return 8;
}

float sub_19E2F6308()
{
  return 0.039062;
}

float sub_19E2F6314()
{
  return 0.00015259;
}

void sub_19E2F6320(int a1)
{
  exception = __cxa_allocate_exception(4uLL);
  _DWORD *exception = a1;
  __cxa_throw(exception, MEMORY[0x1E4FBA3A8], 0);
}

uint64_t sub_19E2F6350(uint64_t a1)
{
  unsigned int v12 = 0;
  sub_19E1C3534((uint64_t)v8);
  int v2 = *(char *)(a1 + 23);
  if (v2 >= 0) {
    uint64_t v3 = a1;
  }
  else {
    uint64_t v3 = *(void *)a1;
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  sub_19E13DB94(v9, v3, v4);
  MEMORY[0x19F3BB980](v8, &v12);
  uint64_t v5 = v12;
  v8[0] = *MEMORY[0x1E4FBA408];
  uint64_t v6 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v8 + *(void *)(v8[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v9[0] = v6;
  v9[1] = MEMORY[0x1E4FBA470] + 16;
  if (v10 < 0) {
    operator delete((void *)v9[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x19F3BBB40](&v11);
  return v5;
}

void sub_19E2F64E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

float sub_19E2F64F4(uint64_t a1)
{
  float v12 = 0.0;
  sub_19E1C3534((uint64_t)v8);
  int v2 = *(char *)(a1 + 23);
  if (v2 >= 0) {
    uint64_t v3 = a1;
  }
  else {
    uint64_t v3 = *(void *)a1;
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  sub_19E13DB94(v9, v3, v4);
  MEMORY[0x19F3BB970](v8, &v12);
  float v5 = v12;
  v8[0] = *MEMORY[0x1E4FBA408];
  uint64_t v6 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v8 + *(void *)(v8[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v9[0] = v6;
  v9[1] = MEMORY[0x1E4FBA470] + 16;
  if (v10 < 0) {
    operator delete((void *)v9[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x19F3BBB40](&v11);
  return v5;
}

void sub_19E2F6684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

size_t sub_19E2F6698(FILE *__stream, int a2, void *__ptr)
{
  return fread(__ptr, 4uLL, 1uLL, __stream);
}

size_t sub_19E2F66AC(FILE *__stream, uint64_t a2, uint64_t a3)
{
  int __ptr = -1;
  fread(&__ptr, 4uLL, 1uLL, __stream);
  size_t v5 = __ptr;
  std::string::resize((std::string *)a3, __ptr, 0);
  if (*(char *)(a3 + 23) >= 0) {
    uint64_t v6 = (void *)a3;
  }
  else {
    uint64_t v6 = *(void **)a3;
  }

  return fread(v6, v5, 1uLL, __stream);
}

size_t sub_19E2F673C(FILE *__stream, _DWORD *a2, char a3)
{
  char __ptr = a3;
  size_t result = fwrite(&__ptr, 1uLL, 1uLL, __stream);
  ++*a2;
  return result;
}

size_t sub_19E2F6788(FILE *__stream, _DWORD *a2, int a3)
{
  int __ptr = a3;
  size_t result = fwrite(&__ptr, 4uLL, 1uLL, __stream);
  *a2 += 4;
  return result;
}

size_t sub_19E2F67D4(size_t __stream, _DWORD *a2, char a3, int a4)
{
  if (a4 >= 1)
  {
    uint64_t v11 = v4;
    uint64_t v12 = v5;
    int v6 = a4;
    uint64_t v9 = (FILE *)__stream;
    do
    {
      char __ptr = a3;
      __stream = fwrite(&__ptr, 1uLL, 1uLL, v9);
      ++*a2;
      --v6;
    }
    while (v6);
  }
  return __stream;
}

size_t sub_19E2F6848(FILE *__stream, _DWORD *a2, int *a3)
{
  int __ptr = *a3;
  size_t result = fwrite(&__ptr, 4uLL, 1uLL, __stream);
  *a2 += 4;
  return result;
}

size_t sub_19E2F6898(FILE *__stream, _DWORD *a2, void *__ptr, uint64_t a4, int a5)
{
  uint64_t v7 = a5;
  size_t result = fwrite(__ptr, 4uLL, a5, __stream);
  if (result != v7) {
    sub_19E2F6320(9);
  }
  *a2 += 4 * a5;
  return result;
}

size_t sub_19E2F68F8(FILE *__stream, _DWORD *a2, float *a3, _WORD *__ptr, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v7 = __ptr;
    uint64_t v8 = a5;
    do
    {
      float v10 = *a3;
      if (*a3 <= -5.0)
      {
        LOWORD(v9) = -32767;
      }
      else if (v10 < 5.0 && (int v9 = llroundf(v10 * 6553.6), v9 < 0x8000))
      {
        if (v9 <= -32767) {
          LOWORD(v9) = -32767;
        }
      }
      else
      {
        LOWORD(v9) = 0x7FFF;
      }
      *v7++ = v9;
      ++a3;
      --v8;
    }
    while (v8);
  }
  size_t result = fwrite(__ptr, 2uLL, a5, __stream);
  if (result != a5) {
    sub_19E2F6320(9);
  }
  *a2 += 2 * a5;
  return result;
}

size_t sub_19E2F69D4(FILE *__stream, _DWORD *a2, float *a3, unsigned char *__ptr, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v7 = __ptr;
    uint64_t v8 = a5;
    do
    {
      float v10 = *a3;
      if (*a3 <= -5.0)
      {
        LOBYTE(v9) = -127;
      }
      else if (v10 < 5.0 && (int v9 = llroundf(v10 * 25.6), v9 <= 127))
      {
        if (v9 <= -127) {
          LOBYTE(v9) = -127;
        }
      }
      else
      {
        LOBYTE(v9) = 127;
      }
      *v7++ = v9;
      ++a3;
      --v8;
    }
    while (v8);
  }
  size_t result = fwrite(__ptr, 1uLL, a5, __stream);
  if (result != a5) {
    sub_19E2F6320(9);
  }
  *a2 += a5;
  return result;
}

size_t sub_19E2F6AB0(FILE *__stream, _DWORD *a2, unint64_t a3, int8x16_t *__ptr, unsigned int a5, double a6, double a7, double a8, double a9, double a10, int8x16_t a11, double a12, int8x16_t a13)
{
  if ((int)a5 >= 1)
  {
    if (a5 >= 8 && (a3 + a5 <= (unint64_t)__ptr || (unint64_t)__ptr + 4 * a5 <= a3))
    {
      uint64_t v15 = a5 & 0xFFFFFFF8;
      unint64_t v22 = (unsigned __int32 *)(a3 + 4);
      uint64_t v23 = __ptr + 1;
      float32x4_t v24 = (float32x4_t)vdupq_n_s32(0x3D200000u);
      __asm
      {
        FMOV            V3.4S, #-5.0
        FMOV            V4.4S, #5.0
      }
      uint64_t v31 = v15;
      do
      {
        a11.i32[0] = *(v22 - 1);
        a13.i32[0] = *v22;
        int16x4_t v32 = (int16x4_t)vmovl_u8(*(uint8x8_t *)a11.i8).u64[0];
        int16x4_t v33 = vshr_n_s16(vshl_n_s16(v32, 8uLL), 8uLL);
        int16x4_t v34 = (int16x4_t)vmovl_u8(*(uint8x8_t *)a13.i8).u64[0];
        int16x4_t v35 = vshr_n_s16(vshl_n_s16(v34, 8uLL), 8uLL);
        a13 = (int8x16_t)vmovl_s16(vceq_s16(v34, (int16x4_t)0x7F007F007F007FLL));
        a11 = vbslq_s8((int8x16_t)vmovl_s16(vceq_s16(v32, (int16x4_t)0x7F007F007F007FLL)), _Q4, vbslq_s8((int8x16_t)vmovl_s16(vcgt_s16(v33, (int16x4_t)0x7E007E007E007ELL)), (int8x16_t)vmulq_f32(vcvtq_f32_s32(vmovl_s16(v33)), v24), _Q3));
        v23[-1] = a11;
        int8x16_t *v23 = vbslq_s8(a13, _Q4, vbslq_s8((int8x16_t)vmovl_s16(vcgt_s16(v35, (int16x4_t)0x7E007E007E007ELL)), (int8x16_t)vmulq_f32(vcvtq_f32_s32(vmovl_s16(v35)), v24), _Q3));
        v22 += 2;
        v23 += 2;
        v31 -= 8;
      }
      while (v31);
      if (v15 == a5) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v16 = (char *)(a3 + v15);
    uint64_t v17 = a5 - v15;
    uint64_t v18 = (float *)&__ptr->i32[v15];
    do
    {
      int v20 = *v16++;
      int v19 = v20;
      float v21 = -5.0;
      if (v20 >= -126)
      {
        float v21 = 5.0;
        if (v19 != 127) {
          float v21 = (float)v19 * 0.039062;
        }
      }
      *v18++ = v21;
      --v17;
    }
    while (v17);
  }
LABEL_14:
  size_t result = fwrite(__ptr, 4uLL, (int)a5, __stream);
  if (result != a5) {
    sub_19E2F6320(9);
  }
  *a2 += 4 * a5;
  return result;
}

size_t sub_19E2F6C3C(FILE *__stream, _DWORD *a2, int16x4_t *a3, int8x16_t *__ptr, int a5)
{
  if (a5 >= 1)
  {
    if (a5 >= 8)
    {
      uint64_t v7 = a5 & 0xFFFFFFF8;
      uint64_t v8 = a3 + 1;
      int v9 = __ptr + 1;
      int16x4_t v10 = vdup_n_s16(0x8001u);
      float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x39200000u);
      __asm
      {
        FMOV            V3.4S, #-5.0
        FMOV            V4.4S, #5.0
      }
      uint64_t v18 = v7;
      do
      {
        int8x16_t v19 = vbslq_s8((int8x16_t)vmovl_s16(vceq_s16(*v8, (int16x4_t)0x8000800080008000)), _Q4, vbslq_s8((int8x16_t)vmovl_s16(vcgt_s16(*v8, v10)), (int8x16_t)vmulq_f32(vcvtq_f32_s32(vmovl_s16(*v8)), v11), _Q3));
        v9[-1] = vbslq_s8((int8x16_t)vmovl_s16(vceq_s16(v8[-1], (int16x4_t)0x8000800080008000)), _Q4, vbslq_s8((int8x16_t)vmovl_s16(vcgt_s16(v8[-1], v10)), (int8x16_t)vmulq_f32(vcvtq_f32_s32(vmovl_s16(v8[-1])), v11), _Q3));
        int8x16_t *v9 = v19;
        v8 += 2;
        v9 += 2;
        v18 -= 8;
      }
      while (v18);
      if (v7 == a5) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v21 = a5 - v7;
    unint64_t v22 = (float *)&__ptr->i32[v7];
    uint64_t v23 = (__int16 *)a3 + v7;
    do
    {
      int v25 = *v23++;
      int v24 = v25;
      float v26 = -5.0;
      if (v25 >= -32766)
      {
        float v26 = 5.0;
        if (v24 != 0x7FFF) {
          float v26 = (float)v24 * 0.00015259;
        }
      }
      *v22++ = v26;
      --v21;
    }
    while (v21);
  }
LABEL_7:
  size_t result = fwrite(__ptr, 4uLL, a5, __stream);
  if (result != a5) {
    sub_19E2F6320(9);
  }
  *a2 += 4 * a5;
  return result;
}

uint64_t sub_19E2F6DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)a1 = &unk_1EF0AA920;
  *(void *)(a1 + 8) = a2;
  sub_19E26B7FC(a1 + 16, a3);
  uint64_t v16 = *(void *)(a4 + 24);
  if (!v16) {
    goto LABEL_4;
  }
  if (v16 != a4)
  {
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 16))(v16);
LABEL_4:
    *(void *)(a1 + 160) = v16;
    goto LABEL_6;
  }
  *(void *)(a1 + 160) = a1 + 136;
  (*(void (**)(void, uint64_t))(**(void **)(a4 + 24) + 24))(*(void *)(a4 + 24), a1 + 136);
LABEL_6:
  uint64_t v17 = *(void *)(a5 + 24);
  if (v17)
  {
    if (v17 == a5)
    {
      *(void *)(a1 + 192) = a1 + 168;
      (*(void (**)(void))(**(void **)(a5 + 24) + 24))(*(void *)(a5 + 24));
      goto LABEL_11;
    }
    uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 16))(v17);
  }
  *(void *)(a1 + 192) = v17;
LABEL_11:
  *(void *)(a1 + 200) = a6;
  *(void *)(a1 + 208) = a7;
  *(void *)(a1 + 216) = a8;
  *(_DWORD *)(a1 + 224) = *(_DWORD *)a9;
  long long v18 = *(_OWORD *)(a9 + 8);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a9 + 24);
  *(_OWORD *)(a1 + 232) = v18;
  *(void *)(a1 + 264) = *(void *)(a9 + 40);
  *(_DWORD *)(a1 + 272) = *(_DWORD *)a10;
  *(void *)(a1 + 280) = *(void *)(a10 + 8);
  *(void *)(a1 + 288) = *(void *)(a10 + 16);
  return a1;
}

void sub_19E2F6F44(_Unwind_Exception *a1)
{
  sub_19E2F6F7C(v3);
  sub_19E15A064(v2, *(char **)(v1 + 24));
  _Unwind_Resume(a1);
}

void sub_19E2F6F64(_Unwind_Exception *a1)
{
  sub_19E15A064(v2, *(char **)(v1 + 24));
  _Unwind_Resume(a1);
}

void *sub_19E2F6F7C(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

void sub_19E2F700C(uint64_t a1, int a2)
{
  *(_OWORD *)out = 0u;
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
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *(_OWORD *)in = 0u;
  long long v16 = 0u;
  memset(v14, 0, sizeof(v14));
  sub_19E2F7180(a1, a2, (uint64_t)v14);
  memset(v13, 0, sizeof(v13));
  uint64_t v4 = (void *)MEMORY[0x19F3BB0E0](v14, v13);
  int v39 = a2;
  uint64_t v5 = *(void *)(a1 + 160);
  if (!v5
    || ((*(void (**)(uint64_t *__return_ptr))(*(void *)v5 + 48))(&v8),
        int v39 = a2,
        (uint64_t v6 = *(void *)(a1 + 192)) == 0))
  {
    sub_19E2A8074();
  }
  size_t v7 = (int)v9 * (int)v10 * (int)v11 * (int)v12 / (unint64_t)a2;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v6 + 48))(&v8);
  BNNSFilterApplyBatch(v4, a2, in[1], v7, out[1], (int)v9 * (int)v10 * (int)v11 * (int)v12 / (unint64_t)a2);
  if (v4) {
    BNNSFilterDestroy(v4);
  }
}

double sub_19E2F7180@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(_OWORD *)(a3 + 480) = 0u;
  *(_OWORD *)(a3 + 496) = 0u;
  *(_OWORD *)(a3 + 448) = 0u;
  *(_OWORD *)(a3 + 464) = 0u;
  *(_OWORD *)(a3 + 416) = 0u;
  *(_OWORD *)(a3 + 432) = 0u;
  *(_OWORD *)(a3 + 384) = 0u;
  *(_OWORD *)(a3 + 400) = 0u;
  *(_OWORD *)(a3 + 352) = 0u;
  *(_OWORD *)(a3 + 368) = 0u;
  *(_OWORD *)(a3 + 320) = 0u;
  *(_OWORD *)(a3 + 336) = 0u;
  *(_OWORD *)(a3 + 288) = 0u;
  *(_OWORD *)(a3 + 304) = 0u;
  *(_OWORD *)(a3 + 256) = 0u;
  *(_OWORD *)(a3 + 272) = 0u;
  *(_OWORD *)(a3 + 224) = 0u;
  *(_OWORD *)(a3 + 240) = 0u;
  *(_OWORD *)(a3 + 192) = 0u;
  *(_OWORD *)(a3 + 208) = 0u;
  *(_OWORD *)(a3 + 160) = 0u;
  *(_OWORD *)(a3 + 176) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_OWORD *)(a3 + 144) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  int v27 = a2;
  uint64_t v4 = *(void *)(a1 + 160);
  if (!v4) {
    goto LABEL_11;
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v4 + 48))(&v23);
  int v27 = v23;
  long long v28 = v24;
  long long v29 = v25;
  uint64_t v7 = v26;
  uint64_t v30 = v26;
  uint64_t v26 = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_OWORD *)(a3 + 144) = 0u;
  *(_OWORD *)(a3 + 160) = 0u;
  *(void *)(a3 + 136) = v7;
  *(_DWORD *)(a3 + 144) = 65568;
  *(_DWORD *)(a3 + 164) = 1065353216;
  *(void *)(a3 + 72) = sub_19E2F77D0(&v27, 0);
  *(void *)(a3 + 8) = v28;
  *(void *)(a3 + 80) = sub_19E2F77D0(&v27, 1);
  *(void *)(a3 + 16) = *((void *)&v28 + 1);
  *(void *)(a3 + 88) = sub_19E2F77D0(&v27, 2);
  *(void *)(a3 + 24) = v29;
  *(_DWORD *)(a3 + 4) = 196608;
  int v8 = *(_DWORD *)(a1 + 224);
  long long v28 = *(_OWORD *)(a1 + 232);
  long long v29 = *(_OWORD *)(a1 + 248);
  uint64_t v9 = *(void *)(a1 + 264);
  int v27 = v8;
  uint64_t v30 = v9;
  *(_OWORD *)(a3 + 304) = 0u;
  *(_OWORD *)(a3 + 320) = 0u;
  *(_OWORD *)(a3 + 336) = 0u;
  *(_OWORD *)(a3 + 176) = 0u;
  *(_OWORD *)(a3 + 192) = 0u;
  *(_OWORD *)(a3 + 208) = 0u;
  *(_OWORD *)(a3 + 224) = 0u;
  *(_OWORD *)(a3 + 240) = 0u;
  *(_OWORD *)(a3 + 256) = 0u;
  *(_OWORD *)(a3 + 272) = 0u;
  *(_OWORD *)(a3 + 288) = 0u;
  *(void *)(a3 + 312) = v9;
  *(_DWORD *)(a3 + 320) = 65568;
  *(_DWORD *)(a3 + 340) = 1065353216;
  *(void *)(a3 + 248) = sub_19E2F77D0(&v27, 0);
  *(void *)(a3 + 184) = v28;
  *(void *)(a3 + 256) = sub_19E2F77D0(&v27, 1);
  *(void *)(a3 + 192) = *((void *)&v28 + 1);
  *(void *)(a3 + 264) = sub_19E2F77D0(&v27, 2);
  *(void *)(a3 + 200) = v29;
  *(void *)(a3 + 272) = sub_19E2F77D0(&v27, 3);
  *(void *)(a3 + 208) = *((void *)&v29 + 1);
  *(void *)(a3 + 328) = 0;
  *(_DWORD *)(a3 + 180) = 0x40000;
  int v27 = a2;
  uint64_t v10 = *(void *)(a1 + 192);
  if (!v10) {
LABEL_11:
  }
    sub_19E2A8074();
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v10 + 48))(&v19);
  int v27 = v19;
  long long v28 = v20;
  long long v29 = v21;
  uint64_t v11 = v22;
  uint64_t v30 = v22;
  uint64_t v22 = 0;
  *(_OWORD *)(a3 + 352) = 0u;
  *(_OWORD *)(a3 + 368) = 0u;
  *(_OWORD *)(a3 + 384) = 0u;
  *(_OWORD *)(a3 + 400) = 0u;
  *(_OWORD *)(a3 + 416) = 0u;
  *(_OWORD *)(a3 + 432) = 0u;
  *(_OWORD *)(a3 + 448) = 0u;
  *(_OWORD *)(a3 + 464) = 0u;
  *(_OWORD *)(a3 + 480) = 0u;
  *(_OWORD *)(a3 + 496) = 0u;
  *(_OWORD *)(a3 + 512) = 0u;
  *(void *)(a3 + 488) = v11;
  *(_DWORD *)(a3 + 496) = 65568;
  *(_DWORD *)(a3 + 516) = 1065353216;
  *(void *)(a3 + 424) = sub_19E2F77D0(&v27, 0);
  *(void *)(a3 + 360) = v28;
  *(void *)(a3 + 432) = sub_19E2F77D0(&v27, 1);
  *(void *)(a3 + 368) = *((void *)&v28 + 1);
  *(void *)(a3 + 440) = sub_19E2F77D0(&v27, 2);
  *(void *)(a3 + 376) = v29;
  *(_DWORD *)(a3 + 356) = 196608;
  uint64_t v12 = *(void *)(a1 + 280);
  uint64_t v13 = *(void *)(a1 + 288);
  *(_OWORD *)(a3 + 656) = 0u;
  *(_OWORD *)(a3 + 672) = 0u;
  *(_OWORD *)(a3 + 688) = 0u;
  *(_OWORD *)(a3 + 528) = 0u;
  *(_OWORD *)(a3 + 544) = 0u;
  *(_OWORD *)(a3 + 560) = 0u;
  *(_OWORD *)(a3 + 576) = 0u;
  *(_OWORD *)(a3 + 592) = 0u;
  *(_OWORD *)(a3 + 608) = 0u;
  *(_OWORD *)(a3 + 624) = 0u;
  *(_OWORD *)(a3 + 640) = 0u;
  *(void *)(a3 + 664) = v13;
  *(_DWORD *)(a3 + 672) = 65568;
  *(_DWORD *)(a3 + 692) = 1065353216;
  *(void *)(a3 + 600) = 1;
  *(void *)(a3 + 536) = v12;
  uint64_t v14 = (_OWORD *)(a3 + 704);
  uint64_t v15 = *(void *)(a1 + 200) - 1;
  *(_DWORD *)(a3 + 532) = 0x10000;
  switch(v15)
  {
    case 0:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      _OWORD *v14 = 0uLL;
      int v16 = 3;
      goto LABEL_9;
    case 1:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      _OWORD *v14 = 0uLL;
      int v16 = 4;
      goto LABEL_9;
    case 3:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      _OWORD *v14 = 0uLL;
      int v16 = 11;
      goto LABEL_9;
    case 4:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      _OWORD *v14 = 0uLL;
      int v16 = 1;
LABEL_9:
      *(_DWORD *)uint64_t v14 = v16;
      break;
    default:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      _OWORD *v14 = 0uLL;
      break;
  }
  *(void *)(a3 + 752) = sub_19E254934(a1 + 16, 0);
  *(void *)(a3 + 760) = sub_19E254934(a1 + 16, 1);
  long long v17 = *(_OWORD *)(a1 + 208);
  *(int64x2_t *)(a3 + 768) = vdupq_n_s64(1uLL);
  *(_OWORD *)(a3 + 784) = v17;
  double result = 0.0;
  *(_OWORD *)(a3 + 800) = 0u;
  *(_OWORD *)(a3 + 816) = 0u;
  *(void *)(a3 + 832) = 0;
  return result;
}

uint64_t sub_19E2F7580(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0AA920;
  uint64_t v2 = a1 + 168;
  uint64_t v3 = *(void *)(a1 + 192);
  if (v3 != v2)
  {
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    }
    uint64_t v4 = a1 + 136;
    uint64_t v5 = *(void *)(a1 + 160);
    if (v5 != a1 + 136) {
      goto LABEL_5;
    }
LABEL_8:
    (*(void (**)(uint64_t))(*(void *)v4 + 32))(v4);
    goto LABEL_9;
  }
  (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  uint64_t v4 = a1 + 136;
  uint64_t v5 = *(void *)(a1 + 160);
  if (v5 == a1 + 136) {
    goto LABEL_8;
  }
LABEL_5:
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
  }
LABEL_9:
  sub_19E15A064(a1 + 16, *(char **)(a1 + 24));
  return a1;
}

void sub_19E2F76A0(char *a1)
{
  *(void *)a1 = &unk_1EF0AA920;
  uint64_t v2 = a1 + 168;
  uint64_t v3 = (char *)*((void *)a1 + 24);
  if (v3 != v2)
  {
    if (v3) {
      (*(void (**)(char *))(*(void *)v3 + 40))(v3);
    }
    uint64_t v4 = a1 + 136;
    uint64_t v5 = (char *)*((void *)a1 + 20);
    if (v5 != a1 + 136) {
      goto LABEL_5;
    }
LABEL_8:
    (*(void (**)(char *))(*(void *)v4 + 32))(v4);
    goto LABEL_9;
  }
  (*(void (**)(char *))(*(void *)v2 + 32))(v2);
  uint64_t v4 = a1 + 136;
  uint64_t v5 = (char *)*((void *)a1 + 20);
  if (v5 == a1 + 136) {
    goto LABEL_8;
  }
LABEL_5:
  if (v5) {
    (*(void (**)(char *))(*(void *)v5 + 40))(v5);
  }
LABEL_9:
  sub_19E15A064((uint64_t)(a1 + 16), *((char **)a1 + 3));

  operator delete(a1);
}

uint64_t sub_19E2F77D0(_DWORD *a1, uint64_t a2)
{
  if (!*a1)
  {
    if (a2 != 3)
    {
      uint64_t v3 = a2 + 1;
      goto LABEL_7;
    }
    return 1;
  }
  if (!a2) {
    return 1;
  }
  uint64_t v3 = a2 - 1;
LABEL_7:
  uint64_t v5 = sub_19E2F77D0(a1, v3);
  if ((int)v3 < 0) {
    unint64_t v6 = (int)v3 + 4;
  }
  else {
    unint64_t v6 = v3;
  }
  if (v6 >= 4) {
    sub_19E13DF40("array::at");
  }
  return *(void *)&a1[2 * v6 + 2] * v5;
}

uint64_t sub_19E2F7860(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  *(void *)a1 = &unk_1EF0A8D30;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 20) = a4;
  *(void *)(a1 + 24) = a5;
  *(void *)(a1 + 32) = a6;
  *(void *)(a1 + 40) = a7;
  *(void *)(a1 + 48) = a8;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = a9;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  uint64_t v13 = *(const void **)a10;
  uint64_t v12 = *(void *)(a10 + 8);
  int64_t v14 = v12 - *(void *)a10;
  if (v12 != *(void *)a10)
  {
    if (v14 < 0) {
      sub_19E13D694();
    }
    uint64_t v15 = (char *)operator new(v12 - (void)v13);
    *(void *)(a1 + 64) = v15;
    *(void *)(a1 + 72) = v15;
    int v16 = &v15[4 * (v14 >> 2)];
    *(void *)(a1 + 80) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 72) = v16;
  }
  *(unsigned char *)(a1 + 88) = a11;
  *(void *)a1 = &unk_1EF0A9D08;
  return a1;
}

void sub_19E2F7930(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 72) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E2F794C(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 56);
  if (v1 <= 9 && ((0x237u >> v1) & 1) != 0)
  {
    bzero(v2, 0x20uLL);
    v2[0] = 1;
    return BNNSDirectApplyFullyConnectedBatch();
  }
  return result;
}

uint64_t sub_19E2F7B8C(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  *(void *)a1 = &unk_1EF0A8D08;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 20) = a4;
  *(void *)(a1 + 24) = a5;
  *(void *)(a1 + 32) = a6;
  *(void *)(a1 + 40) = a7;
  *(void *)(a1 + 48) = a8;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = a9;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  uint64_t v13 = *(const void **)a10;
  uint64_t v12 = *(void *)(a10 + 8);
  int64_t v14 = v12 - *(void *)a10;
  if (v12 != *(void *)a10)
  {
    if (v14 < 0) {
      sub_19E13D694();
    }
    uint64_t v15 = (char *)operator new(v12 - (void)v13);
    *(void *)(a1 + 64) = v15;
    *(void *)(a1 + 72) = v15;
    int v16 = &v15[4 * (v14 >> 2)];
    *(void *)(a1 + 80) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 72) = v16;
  }
  *(unsigned char *)(a1 + 88) = a11;
  *(void *)a1 = &unk_1EF0A9CE0;
  return a1;
}

void sub_19E2F7C5C(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 72) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E2F7C78(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 56);
  if (v1 <= 9 && ((0x237u >> v1) & 1) != 0)
  {
    bzero(v2, 0x20uLL);
    v2[0] = 1;
    return BNNSDirectApplyFullyConnectedBatch();
  }
  return result;
}

void *sub_19E2F7EC4(void *a1)
{
  *a1 = &unk_1EF0A8D30;
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_19E2F7F14(void *__p)
{
  void *__p = &unk_1EF0A8D30;
  uint64_t v2 = (void *)__p[8];
  if (v2)
  {
    __p[9] = v2;
    operator delete(v2);
  }

  operator delete(__p);
}

void *sub_19E2F7F74(void *a1)
{
  *a1 = &unk_1EF0A8D08;
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_19E2F7FC4(void *__p)
{
  void *__p = &unk_1EF0A8D08;
  uint64_t v2 = (void *)__p[8];
  if (v2)
  {
    __p[9] = v2;
    operator delete(v2);
  }

  operator delete(__p);
}

void sub_19E2F8458()
{
}

void sub_19E2F8510(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E2F8524()
{
}

void sub_19E2F85D8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E2F85EC()
{
}

void sub_19E2F86BC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E2F86D0()
{
}

void sub_19E2F8748(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E2F875C()
{
}

void sub_19E2F8820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  operator delete(v13);
  _Unwind_Resume(a1);
}

void sub_19E2F8844()
{
}

void sub_19E2F8900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  operator delete(v11);
  _Unwind_Resume(a1);
}

void sub_19E2F8924()
{
}

void sub_19E2F89DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  operator delete(v11);
  _Unwind_Resume(a1);
}

void sub_19E2F8A00()
{
}

void sub_19E2F8AE4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E2F8AF8()
{
}

void sub_19E2F8BB4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E2F8BC8()
{
}

void sub_19E2F8C7C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19E2F8C98(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0AB6D8;
  uint64_t v2 = a1 + 168;
  uint64_t v3 = *(void *)(a1 + 192);
  if (v3 != v2)
  {
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    }
    uint64_t v4 = a1 + 136;
    uint64_t v5 = *(void *)(a1 + 160);
    if (v5 != a1 + 136) {
      goto LABEL_5;
    }
LABEL_8:
    (*(void (**)(uint64_t))(*(void *)v4 + 32))(v4);
    goto LABEL_9;
  }
  (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  uint64_t v4 = a1 + 136;
  uint64_t v5 = *(void *)(a1 + 160);
  if (v5 == a1 + 136) {
    goto LABEL_8;
  }
LABEL_5:
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
  }
LABEL_9:
  sub_19E15A064(a1 + 16, *(char **)(a1 + 24));
  return a1;
}

void sub_19E2F8DB8(char *a1)
{
  *(void *)a1 = &unk_1EF0AB6D8;
  uint64_t v2 = a1 + 168;
  uint64_t v3 = (char *)*((void *)a1 + 24);
  if (v3 != v2)
  {
    if (v3) {
      (*(void (**)(char *))(*(void *)v3 + 40))(v3);
    }
    uint64_t v4 = a1 + 136;
    uint64_t v5 = (char *)*((void *)a1 + 20);
    if (v5 != a1 + 136) {
      goto LABEL_5;
    }
LABEL_8:
    (*(void (**)(char *))(*(void *)v4 + 32))(v4);
    goto LABEL_9;
  }
  (*(void (**)(char *))(*(void *)v2 + 32))(v2);
  uint64_t v4 = a1 + 136;
  uint64_t v5 = (char *)*((void *)a1 + 20);
  if (v5 == a1 + 136) {
    goto LABEL_8;
  }
LABEL_5:
  if (v5) {
    (*(void (**)(char *))(*(void *)v5 + 40))(v5);
  }
LABEL_9:
  sub_19E15A064((uint64_t)(a1 + 16), *((char **)a1 + 3));

  operator delete(a1);
}

void sub_19E2F9EB4(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, ...)
{
  va_start(va, a17);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_19E2FA1A8(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 48), (const void *)(a2 + 48), 0x2C0uLL);
}

void sub_19E2FA1BC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  float32x4_t v64 = a1;
  uint64_t v9 = (uint64_t *)sub_19E32C110(v5, *(void *)(a1[7] + 8) + 48);
  if (*v9)
  {
    uint64_t v10 = (void *)a1[4];
    uint64_t v11 = (void *)a1[5];
    uint64_t v62 = v10[1];
    if (v11)
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v12 = objc_msgSend_weights(v11, v6, v7, v8);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v65, (uint64_t)v71, 16);
      if (v17)
      {
        uint64_t v18 = *(void *)v66;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v66 != v18) {
              objc_enumerationMutation(v12);
            }
            long long v20 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            long long v21 = objc_msgSend_name(v20, v14, v15, v16, v62);
            int isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v5, v23);

            if (isEqualToString)
            {
              long long v25 = objc_msgSend_index(v20, v14, v15, v16);
              uint64_t v62 = objc_msgSend_unsignedIntegerValue(v25, v26, v27, v28);

              goto LABEL_13;
            }
          }
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v65, (uint64_t)v71, 16);
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      uint64_t v10 = (void *)v64[4];
    }
    if (objc_msgSend_weightDataFormat(v10, v6, v7, v8, v62) == 1)
    {
      long long v35 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v29, v30, v31);
      if (a2)
      {
        uint64_t v37 = 0;
        do
        {
          LODWORD(v36) = *(_DWORD *)(*v9 + 4 * v37);
          long long v38 = objc_msgSend_numberWithFloat_(NSNumber, v32, v33, v34, v36);
          objc_msgSend_addObject_(v35, v39, (uint64_t)v38, v40);

          ++v37;
        }
        while (a2 != v37);
      }
      uint64_t v41 = [MontrealNNModelWeight alloc];
      float32x4_t v44 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v42, v63, v43);
      v70[0] = &unk_1EF0B3478;
      uint64_t v47 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v45, a2, v46);
      v70[1] = v47;
      int16x8_t v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)v70, 2);
      uint64_t v51 = objc_msgSend_initWithName_index_dimension_weightValues_(v41, v50, (uint64_t)v5, (uint64_t)v44, v49, v35);
    }
    else
    {
      long long v35 = objc_msgSend_dataFromWeights_length_((void *)v64[4], v29, *v9, a2);
      long long v52 = [MontrealNNModelWeight alloc];
      float32x4_t v44 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v53, v63, v54);
      v69[0] = &unk_1EF0B3478;
      uint64_t v47 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v55, a2, v56);
      v69[1] = v47;
      int16x8_t v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v57, (uint64_t)v69, 2);
      uint64_t v51 = objc_msgSend_initWithName_index_dimension_weightData_(v52, v58, (uint64_t)v5, (uint64_t)v44, v49, v35);
    }
    uint64_t v59 = (void *)v51;

    objc_msgSend_addObject_((void *)v64[6], v60, (uint64_t)v59, v61);
    ++*(void *)(v64[4] + 8);
  }
}

void sub_19E2FA50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FA638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FA650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FA728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FA750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FA76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FA784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FA798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FA8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FA914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MontrealNNGenerateModel;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_19E2FAABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FACDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FACEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAEF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  sub_19E263820((const void **)va);
  _Unwind_Resume(a1);
}

void sub_19E2FAF2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAF44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAF58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAF7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAF8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAFA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAFB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FAFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int64_t v14 = v12;

  _Unwind_Resume(a1);
}

void sub_19E2FB2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int64_t v14 = v12;

  _Unwind_Resume(a1);
}

void sub_19E2FB5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FB934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_19E2FB9F4(void *a1, uint64_t a2, uint64_t a3, void *__src)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
  }
  sub_19E25BD4C((uint64_t)a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_1EF0AA7B0;
  a1[127] = __src[56];
  LODWORD(v7) = *((_DWORD *)__src + 32);
  if ((int)v7 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v7;
  }
  int v12 = 1;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v14 = v7;
  int64x2_t v15 = v13;
  sub_19E13C5C0((uint64_t)(a1 + 2), &v12, (int *)&v16);
  uint64_t v8 = *((int *)__src + 64);
  int v12 = 9;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  int64x2_t v15 = 0uLL;
  uint64_t v14 = v8;
  sub_19E13C5C0((uint64_t)(a1 + 5), &v12, (int *)&v16);
  return a1;
}

void sub_19E2FBB40(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E2FBB54(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E2FBB68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E2FBB84(void *a1, uint64_t a2)
{
  uint64_t v4 = (void **)a1[20];
  id v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      operator delete(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    unint64_t v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        uint64_t v9 = (uint64_t *)v6[1];
        operator delete(v6);
        unint64_t v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  uint64_t v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 64);

  return v10(a2, a1);
}

uint64_t *sub_19E2FBC6C(uint64_t a1, int a2)
{
  if ((*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1) < 1)
  {
    LODWORD(v10) = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
    double result = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
    int64x2_t v13 = (uint64_t **)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v9 = *(int *)(a1 + 568);
    uint64_t v10 = (int)v10;
    uint64_t v11 = (int)result;
    if (!v19)
    {
      uint64_t v14 = (uint64_t *)(a1 + 48);
LABEL_20:
      long long v21 = (char *)operator new(0x50uLL);
      uint64_t v17 = (uint64_t *)v21;
      *((_DWORD *)v21 + 8) = a2;
      *(_OWORD *)(v21 + 40) = 0u;
      *(_OWORD *)(v21 + 56) = 0u;
      *((void *)v21 + 9) = 0;
      *(void *)long long v21 = 0;
      *((void *)v21 + 1) = 0;
      *((void *)v21 + 2) = v14;
      void *v13 = (uint64_t *)v21;
      uint64_t v22 = **(void **)(a1 + 40);
      if (!v22)
      {
        uint64_t v8 = 1;
        uint64_t v14 = (uint64_t *)v21;
        goto LABEL_23;
      }
      *(void *)(a1 + 40) = v22;
      uint64_t v8 = 1;
      goto LABEL_22;
    }
    uint64_t v8 = 1;
    while (1)
    {
      while (1)
      {
        uint64_t v14 = (uint64_t *)v19;
        int v20 = *(_DWORD *)(v19 + 32);
        if (v20 <= a2) {
          break;
        }
        uint64_t v19 = *v14;
        int64x2_t v13 = (uint64_t **)v14;
        if (!*v14) {
          goto LABEL_20;
        }
      }
      if (v20 >= a2) {
        break;
      }
      uint64_t v19 = v14[1];
      if (!v19)
      {
        int64x2_t v13 = (uint64_t **)(v14 + 1);
        goto LABEL_20;
      }
    }
  }
  else
  {
    int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
    int v5 = *(_DWORD *)(a1 + 568);
    LODWORD(v9) = v5 / (*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
    int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
    double result = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
    uint64_t v8 = v4;
    uint64_t v9 = (int)v9;
    uint64_t v10 = v6;
    uint64_t v11 = (int)result;
    int64x2_t v13 = (uint64_t **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 48);
    if (!v12)
    {
      uint64_t v14 = (uint64_t *)(a1 + 48);
LABEL_9:
      uint64_t v16 = (char *)operator new(0x50uLL);
      uint64_t v17 = (uint64_t *)v16;
      *((_DWORD *)v16 + 8) = a2;
      *(_OWORD *)(v16 + 40) = 0u;
      *(_OWORD *)(v16 + 56) = 0u;
      *((void *)v16 + 9) = 0;
      *(void *)uint64_t v16 = 0;
      *((void *)v16 + 1) = 0;
      *((void *)v16 + 2) = v14;
      void *v13 = (uint64_t *)v16;
      uint64_t v18 = **(void **)(a1 + 40);
      if (!v18)
      {
        uint64_t v14 = (uint64_t *)v16;
LABEL_23:
        double result = sub_19E13C8A0(*(uint64_t **)(a1 + 48), v17);
        ++*(void *)(a1 + 56);
        goto LABEL_24;
      }
      *(void *)(a1 + 40) = v18;
LABEL_22:
      uint64_t v14 = v17;
      uint64_t v17 = *v13;
      goto LABEL_23;
    }
    while (1)
    {
      while (1)
      {
        uint64_t v14 = (uint64_t *)v12;
        int v15 = *(_DWORD *)(v12 + 32);
        if (v15 <= a2) {
          break;
        }
        uint64_t v12 = *v14;
        int64x2_t v13 = (uint64_t **)v14;
        if (!*v14) {
          goto LABEL_9;
        }
      }
      if (v15 >= a2) {
        break;
      }
      uint64_t v12 = v14[1];
      if (!v12)
      {
        int64x2_t v13 = (uint64_t **)(v14 + 1);
        goto LABEL_9;
      }
    }
  }
LABEL_24:
  v14[5] = v8;
  v14[6] = 1;
  v14[7] = v9;
  _OWORD v14[8] = v10;
  v14[9] = v11;
  return result;
}

void *sub_19E2FBF50(void *a1, uint64_t a2, uint64_t a3, void *__src)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
  }
  sub_19E25E2E0((uint64_t)a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_1EF0AA640;
  a1[127] = __src[56];
  LODWORD(v7) = *((_DWORD *)__src + 32);
  if ((int)v7 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v7;
  }
  int v12 = 1;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v14 = v7;
  int64x2_t v15 = v13;
  sub_19E13C5C0((uint64_t)(a1 + 2), &v12, (int *)&v16);
  uint64_t v8 = *((int *)__src + 64);
  int v12 = 9;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  int64x2_t v15 = 0uLL;
  uint64_t v14 = v8;
  sub_19E13C5C0((uint64_t)(a1 + 5), &v12, (int *)&v16);
  return a1;
}

void sub_19E2FC09C(_Unwind_Exception *a1)
{
  sub_19E25E4C4(v1);
  _Unwind_Resume(a1);
}

void sub_19E2FC0B0(_Unwind_Exception *a1)
{
  sub_19E25E4C4(v1);
  _Unwind_Resume(a1);
}

void sub_19E2FC0C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E2FC0E0(void *a1, uint64_t a2)
{
  int v4 = (void **)a1[20];
  int v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      operator delete(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    int v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        uint64_t v9 = (uint64_t *)v6[1];
        operator delete(v6);
        int v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  uint64_t v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 168);

  return v10(a2, a1);
}

uint64_t *sub_19E2FC1C8(uint64_t a1, int a2)
{
  if ((*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1) < 1)
  {
    LODWORD(v10) = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
    double result = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
    int64x2_t v13 = (uint64_t **)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v9 = *(int *)(a1 + 568);
    uint64_t v10 = (int)v10;
    uint64_t v11 = (int)result;
    if (!v19)
    {
      uint64_t v14 = (uint64_t *)(a1 + 48);
LABEL_20:
      long long v21 = (char *)operator new(0x50uLL);
      uint64_t v17 = (uint64_t *)v21;
      *((_DWORD *)v21 + 8) = a2;
      *(_OWORD *)(v21 + 40) = 0u;
      *(_OWORD *)(v21 + 56) = 0u;
      *((void *)v21 + 9) = 0;
      *(void *)long long v21 = 0;
      *((void *)v21 + 1) = 0;
      *((void *)v21 + 2) = v14;
      void *v13 = (uint64_t *)v21;
      uint64_t v22 = **(void **)(a1 + 40);
      if (!v22)
      {
        uint64_t v8 = 1;
        uint64_t v14 = (uint64_t *)v21;
        goto LABEL_23;
      }
      *(void *)(a1 + 40) = v22;
      uint64_t v8 = 1;
      goto LABEL_22;
    }
    uint64_t v8 = 1;
    while (1)
    {
      while (1)
      {
        uint64_t v14 = (uint64_t *)v19;
        int v20 = *(_DWORD *)(v19 + 32);
        if (v20 <= a2) {
          break;
        }
        uint64_t v19 = *v14;
        int64x2_t v13 = (uint64_t **)v14;
        if (!*v14) {
          goto LABEL_20;
        }
      }
      if (v20 >= a2) {
        break;
      }
      uint64_t v19 = v14[1];
      if (!v19)
      {
        int64x2_t v13 = (uint64_t **)(v14 + 1);
        goto LABEL_20;
      }
    }
  }
  else
  {
    int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
    int v5 = *(_DWORD *)(a1 + 568);
    LODWORD(v9) = v5 / (*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
    int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
    double result = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
    uint64_t v8 = v4;
    uint64_t v9 = (int)v9;
    uint64_t v10 = v6;
    uint64_t v11 = (int)result;
    int64x2_t v13 = (uint64_t **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 48);
    if (!v12)
    {
      uint64_t v14 = (uint64_t *)(a1 + 48);
LABEL_9:
      uint64_t v16 = (char *)operator new(0x50uLL);
      uint64_t v17 = (uint64_t *)v16;
      *((_DWORD *)v16 + 8) = a2;
      *(_OWORD *)(v16 + 40) = 0u;
      *(_OWORD *)(v16 + 56) = 0u;
      *((void *)v16 + 9) = 0;
      *(void *)uint64_t v16 = 0;
      *((void *)v16 + 1) = 0;
      *((void *)v16 + 2) = v14;
      void *v13 = (uint64_t *)v16;
      uint64_t v18 = **(void **)(a1 + 40);
      if (!v18)
      {
        uint64_t v14 = (uint64_t *)v16;
LABEL_23:
        double result = sub_19E13C8A0(*(uint64_t **)(a1 + 48), v17);
        ++*(void *)(a1 + 56);
        goto LABEL_24;
      }
      *(void *)(a1 + 40) = v18;
LABEL_22:
      uint64_t v14 = v17;
      uint64_t v17 = *v13;
      goto LABEL_23;
    }
    while (1)
    {
      while (1)
      {
        uint64_t v14 = (uint64_t *)v12;
        int v15 = *(_DWORD *)(v12 + 32);
        if (v15 <= a2) {
          break;
        }
        uint64_t v12 = *v14;
        int64x2_t v13 = (uint64_t **)v14;
        if (!*v14) {
          goto LABEL_9;
        }
      }
      if (v15 >= a2) {
        break;
      }
      uint64_t v12 = v14[1];
      if (!v12)
      {
        int64x2_t v13 = (uint64_t **)(v14 + 1);
        goto LABEL_9;
      }
    }
  }
LABEL_24:
  v14[5] = v8;
  v14[6] = 1;
  v14[7] = v9;
  _OWORD v14[8] = v10;
  v14[9] = v11;
  return result;
}

void sub_19E2FC4B0(uint64_t a1)
{
  uint64_t v1 = (void *)sub_19E25BF30(a1);

  operator delete(v1);
}

void sub_19E2FC4DC(uint64_t a1)
{
  uint64_t v1 = (void *)sub_19E25E4C4(a1);

  operator delete(v1);
}

void sub_19E2FC5D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FC760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FC8CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FC980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FC99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FCCF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_19E2FCFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FD01C()
{
}

void sub_19E2FD02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FD258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FD290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FD594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E2FD6E4(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  *(void *)double result = &unk_1EF0A7BB0;
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_19E2FD714(uint64_t a1, unsigned int a2, uint64_t (*a3)(uint64_t, uint64_t, void), uint64_t a4)
{
  *(void *)a1 = &unk_1EF0A4EA8;
  *(_DWORD *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  int v6 = (unsigned int *)(a1 + 16);
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 137) = 0u;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = a4;
  if (!a2
    && ((v16 = 0, v15 = 4, int v12 = sysctlbyname("hw.activecpu", &v16, &v15, 0, 0), v16 <= 1) ? (a2 = 1) : (a2 = v16),
        v12)
    || a2 == 1)
  {
    *(void *)(a1 + 160) = a3(0, a1, *(void *)(a1 + 168));
    LODWORD(v7) = 1;
  }
  else
  {
    uint64_t v7 = a2;
    if (sub_19E329E14(v6, a2, 0, 8u, 0))
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "tpThreadInit error");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    uint64_t v8 = 0;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v10 = *(void *)(a1 + 24) + v8;
      *(_DWORD *)(v10 + 136) = 0;
      *(void *)(v10 + 152) = sub_19E2FD8B4;
      uint64_t v11 = *(void **)(v10 + 144);
      *uint64_t v11 = a3(i, a1, *(void *)(a1 + 168));
      v8 += 184;
    }
  }
  *(_DWORD *)(a1 + 8) = v7;
  return a1;
}

void sub_19E2FD8A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19E2FD8B4(void *a1)
{
  return 0;
}

uint64_t sub_19E2FD8F8(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0A4EA8;
  unint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2)
  {
    if (v2 == 1)
    {
      uint64_t v3 = *(void *)(a1 + 160);
      if (v3)
      {
        (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
        return a1;
      }
    }
    else
    {
      unint64_t v5 = 0;
      uint64_t v6 = 144;
      do
      {
        uint64_t v7 = *(void **)(*(void *)(a1 + 24) + v6);
        if (*v7)
        {
          (*(void (**)(void))(*(void *)*v7 + 8))(*v7);
          unint64_t v2 = *(unsigned int *)(a1 + 8);
        }
        void *v7 = 0;
        ++v5;
        v6 += 184;
      }
      while (v5 < v2);
      if (!*(unsigned char *)(a1 + 152)) {
        sub_19E32A154((unsigned int *)(a1 + 16));
      }
    }
  }
  return a1;
}

void sub_19E2FDA04(unsigned int *__p)
{
  *(void *)__p = &unk_1EF0A4EA8;
  unint64_t v2 = __p[2];
  if (v2)
  {
    if (v2 == 1)
    {
      uint64_t v3 = *((void *)__p + 20);
      if (v3)
      {
        (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
        int v4 = __p;
        goto LABEL_6;
      }
    }
    else
    {
      unint64_t v5 = 0;
      uint64_t v6 = 144;
      do
      {
        uint64_t v7 = *(void **)(*((void *)__p + 3) + v6);
        if (*v7)
        {
          (*(void (**)(void))(*(void *)*v7 + 8))(*v7);
          unint64_t v2 = __p[2];
        }
        void *v7 = 0;
        ++v5;
        v6 += 184;
      }
      while (v5 < v2);
      if (!*((unsigned char *)__p + 152)) {
        sub_19E32A154(__p + 4);
      }
    }
  }
  int v4 = __p;

LABEL_6:
  operator delete(v4);
}

uint64_t sub_19E2FDB30(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2) {
    return 0;
  }
  if (v2 == 1) {
    return *(void *)(a1 + 160);
  }
  return **(void **)(*(void *)(a1 + 24) + 184 * a2 + 144);
}

uint64_t sub_19E2FDB70(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a1 + 8);
  uint64_t v5 = v4;
  if (a2)
  {
    uint64_t v5 = a2;
    if (v4 < a2) {
      return 2;
    }
  }
  if (!v4) {
    return 3;
  }
  if (v4 == 1)
  {
    (*(void (**)(void, uint64_t))(**(void **)(a1 + 160) + 16))(*(void *)(a1 + 160), v5);
    return 0;
  }
  else
  {
    uint64_t result = sub_19E32A2A0(a1 + 16, v5);
    if (result || (uint64_t result = sub_19E32A3F4(a1 + 16), result)) {
      *(unsigned char *)(a1 + 152) = 1;
    }
  }
  return result;
}

void sub_19E2FDD8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FE0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FE174(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_19E2FE2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FE504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FE610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FE620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_19E2FE644(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unsigned int v4 = (void *)MEMORY[0x1E4F1CA48];
  id v36 = v3;
  uint64_t v8 = objc_msgSend_count(v3, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = v36;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v12);
        }
        int v20 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v21 = *(void *)(a1 + 8);
        uint64_t v22 = objc_msgSend_name(*(void **)(*((void *)&v37 + 1) + 8 * i), v14, v15, v16);
        long long v25 = objc_msgSend_predicateWithFormat_(v20, v23, v21, v24, v22);

        uint64_t v28 = objc_msgSend_filteredSetUsingPredicate_(*(void **)a1, v26, (uint64_t)v25, v27);
        long long v32 = objc_msgSend_anyObject(v28, v29, v30, v31);

        if (v32) {
          objc_msgSend_addObject_(v11, v33, (uint64_t)v32, v34);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v17);
  }

  return v11;
}

void sub_19E2FE7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FEAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19E2FED5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_19E2FEDD0(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v5 = objc_msgSend_mutableCopy(v1, v2, v3, v4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v1;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_dimension(v14, v8, v9, v10, (void)v25);
        BOOL v19 = objc_msgSend_count(v15, v16, v17, v18) == 0;

        if (v19) {
          objc_msgSend_removeObject_(v5, v8, (uint64_t)v14, v10);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v11);
  }

  uint64_t v23 = objc_msgSend_copy(v5, v20, v21, v22);

  return v23;
}

void sub_19E2FEF34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FF270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FF5AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E2FF7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E2FF810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E2FF93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FF984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FF998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FFBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FFD7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E2FFF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_19E3001B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E300250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E300368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E3003CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E300430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E300494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E30057C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E30059C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E30068C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E3006AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E300768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E300784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E300840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E30085C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E300A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E300BB4(uint64_t a1, uint64_t a2, uint64_t a3, void *__src)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
  }
  sub_19E25BD4C(a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_1EF0AA4A8;
  *(void *)(a1 + 1016) = __src[7];
  *(void *)(a1 + 1024) = __src[56];
  *(void *)(a1 + 1032) = __src[72];
  *(_WORD *)(a1 + 1056) = 0;
  *(unsigned char *)(a1 + 1058) = 0;
  *(_DWORD *)(a1 + 1088) = 0;
  *(void *)(a1 + 1072) = 0;
  *(void *)(a1 + 1080) = 0;
  *(void *)(a1 + 1064) = 0;
  uint64_t v7 = *((int *)__src + 32);
  int v12 = 1;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = v7;
  sub_19E13C5C0(a1 + 16, &v12, (int *)&v17);
  uint64_t v8 = *((int *)__src + 64);
  int v12 = 9;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = v8;
  sub_19E13C5C0(a1 + 40, &v12, (int *)&v17);
  *(_DWORD *)(a1 + 1088) = *((_DWORD *)__src + 96);
  return a1;
}

void sub_19E300D28(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void **)(v1 + 1064);
  if (v3)
  {
    *(void *)(v1 + 1072) = v3;
    operator delete(v3);
  }
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E300D54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E300D74(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)a1[20];
  uint64_t v5 = (void *)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      (*(void (**)(void))(*(void *)*v4 + 8))(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    id v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        uint64_t v9 = (uint64_t *)v6[1];
        operator delete(v6);
        id v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  uint64_t v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 16);

  return v10(a2, a1);
}

int64x2_t sub_19E300E7C(uint64_t a1, int a2)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1) != 2)
  {
    if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1))
    {
      if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1) != 13) {
        return result;
      }
      int v14 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
      int v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
      uint64_t v17 = (uint64_t **)(a1 + 48);
      uint64_t v16 = *(char **)(a1 + 48);
      uint64_t v18 = *(int *)(a1 + 568);
      uint64_t v19 = v14;
      uint64_t v20 = v15;
      if (v16)
      {
        while (1)
        {
          while (1)
          {
            uint64_t v21 = v16;
            int v22 = *((_DWORD *)v16 + 8);
            if (v22 <= a2) {
              break;
            }
            uint64_t v16 = *(char **)v21;
            uint64_t v17 = (uint64_t **)v21;
            if (!*(void *)v21) {
              goto LABEL_32;
            }
          }
          if (v22 >= a2) {
            break;
          }
          uint64_t v16 = (char *)*((void *)v21 + 1);
          if (!v16) {
            goto LABEL_31;
          }
        }
LABEL_35:
        int64x2_t result = vdupq_n_s64(1uLL);
        *(int64x2_t *)(v21 + 40) = result;
        *((void *)v21 + 7) = v18;
        *((void *)v21 + 8) = v19;
        *((void *)v21 + 9) = v20;
        return result;
      }
    }
    else
    {
      if (*(void *)(*(void *)(a1 + 16) + 40) != 1)
      {
        int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
        int v24 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
        int v25 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
        uint64_t v26 = *(void *)(a1 + 16);
        *(int64x2_t *)(v26 + 40) = vdupq_n_s64(1uLL);
        *(void *)(v26 + 56) = v23;
        *(void *)(v26 + 64) = v24;
        *(void *)(v26 + 72) = v25;
      }
      int v27 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
      int v28 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
      uint64_t v17 = (uint64_t **)(a1 + 48);
      long long v29 = *(char **)(a1 + 48);
      uint64_t v18 = *(int *)(a1 + 568);
      uint64_t v19 = v27;
      uint64_t v20 = v28;
      if (v29)
      {
        while (1)
        {
          while (1)
          {
            uint64_t v21 = v29;
            int v30 = *((_DWORD *)v29 + 8);
            if (v30 <= a2) {
              break;
            }
            long long v29 = *(char **)v21;
            uint64_t v17 = (uint64_t **)v21;
            if (!*(void *)v21) {
              goto LABEL_32;
            }
          }
          if (v30 >= a2) {
            goto LABEL_35;
          }
          long long v29 = (char *)*((void *)v21 + 1);
          if (!v29)
          {
LABEL_31:
            uint64_t v17 = (uint64_t **)(v21 + 8);
            goto LABEL_32;
          }
        }
      }
    }
    uint64_t v21 = (char *)v17;
LABEL_32:
    uint64_t v31 = v21;
    uint64_t v21 = (char *)operator new(0x50uLL);
    *((_DWORD *)v21 + 8) = a2;
    *(_OWORD *)(v21 + 40) = 0u;
    *(_OWORD *)(v21 + 56) = 0u;
    *((void *)v21 + 9) = 0;
    *(void *)uint64_t v21 = 0;
    *((void *)v21 + 1) = 0;
    *((void *)v21 + 2) = v31;
    *uint64_t v17 = (uint64_t *)v21;
    uint64_t v32 = **(void **)(a1 + 40);
    uint64_t v33 = (uint64_t *)v21;
    if (v32)
    {
      *(void *)(a1 + 40) = v32;
      uint64_t v33 = *v17;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 48), v33);
    ++*(void *)(a1 + 56);
    goto LABEL_35;
  }
  uint64_t v5 = (uint64_t **)(a1 + 48);
  uint64_t v4 = *(char **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 16) + 40;
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = v4;
        int v8 = *((_DWORD *)v4 + 8);
        if (v8 <= a2) {
          break;
        }
        uint64_t v4 = *(char **)v7;
        uint64_t v5 = (uint64_t **)v7;
        if (!*(void *)v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      uint64_t v4 = (char *)*((void *)v7 + 1);
      if (!v4)
      {
        uint64_t v5 = (uint64_t **)(v7 + 8);
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v7 = (char *)(a1 + 48);
LABEL_9:
    uint64_t v9 = v7;
    uint64_t v7 = (char *)operator new(0x50uLL);
    *((_DWORD *)v7 + 8) = a2;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *((void *)v7 + 9) = 0;
    *(void *)uint64_t v7 = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = v9;
    void *v5 = (uint64_t *)v7;
    uint64_t v10 = **(void **)(a1 + 40);
    uint64_t v11 = (uint64_t *)v7;
    if (v10)
    {
      *(void *)(a1 + 40) = v10;
      uint64_t v11 = *v5;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 48), v11);
    ++*(void *)(a1 + 56);
  }
  int64x2_t result = *(int64x2_t *)v6;
  long long v13 = *(_OWORD *)(v6 + 16);
  *((void *)v7 + 9) = *(void *)(v6 + 32);
  *(_OWORD *)(v7 + 56) = v13;
  *(int64x2_t *)(v7 + 40) = result;
  return result;
}

void sub_19E301284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_19E25D504(a1, a2, a3);

  sub_19E3012BC(a1);
}

void sub_19E3012BC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1057))
  {
    unsigned int v2 = sub_19E25DA90(a1, 9);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 168))(&v66, a1, 9);
    void *v2 = (uint64_t *)((char *)*v2 - 4 * (int)v66 * v67 * v68 * v69 * v70);
    int v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
    uint64_t v57 = (v3 - 1);
    if (v3 >= 1)
    {
      uint64_t v60 = 4 * (v3 - 1);
      uint64_t v61 = 0;
      uint64_t v58 = v3;
      uint64_t v59 = (v3 - 1);
      while (1)
      {
        int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 9);
        int v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
        int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
        uint64_t v65 = (v6 - 1);
        if (v6 >= 1) {
          break;
        }
LABEL_4:
        --v59;
        v60 -= 4;
        if (++v61 == v58) {
          goto LABEL_55;
        }
      }
      uint64_t v7 = 0;
      uint64_t v8 = v4;
      uint64_t v9 = v5;
      uint64_t v10 = v59 * v4 * v5;
      uint64_t v63 = (v61 - v57) * v8 * v5;
      uint64_t v11 = v6;
      uint64_t v64 = v10 - 1;
      uint64_t v62 = v60 * v8 * v9;
      uint64_t v12 = (v6 - 1);
      uint64_t v13 = 4 * v12;
      while (1)
      {
        int v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 9);
        if (*(unsigned char *)(a1 + 1057))
        {
          uint64_t v15 = *(void *)(a1 + 1064);
          if (*(unsigned char *)(a1 + 1056)) {
            uint64_t v16 = *(void *)(v15 + 8);
          }
          else {
            uint64_t v16 = (*(void *)(a1 + 1072) - v15) >> 3;
          }
        }
        else
        {
          LODWORD(v16) = *(_DWORD *)(a1 + 568);
        }
        uint64_t v17 = v14;
        uint64_t v18 = v12 * v14;
        uint64_t v19 = v18 + v10;
        uint64_t v20 = (int)v16;
        uint64_t v21 = *(uint64_t **)(a1 + 1072);
        int v22 = *(uint64_t **)(a1 + 1064);
        if (!*(unsigned char *)(a1 + 1056))
        {
          uint64_t v38 = (char *)v21 - (char *)v22;
          if (v21 != v22)
          {
            if (v38 >= 1)
            {
              unint64_t v39 = (unint64_t)v38 >> 3;
              long long v40 = *v2;
              uint64_t v41 = v22 - 1;
              uint64_t v42 = (int *)*v2 + v10 + v39 + v12 * v20 - 1;
              do
              {
                int v43 = *v42--;
                *((_DWORD *)v40 + v41[v39] + v19) = v43;
                BOOL v32 = v39-- > 1;
              }
              while (v32);
            }
            if ((*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 9) >= 1)
            {
              uint64_t v44 = 0;
              unint64_t v45 = 0;
              uint64_t v46 = v62 + v13 * v17;
              do
              {
                uint64_t v47 = *(void *)(a1 + 1064);
                if (v45 < (*(void *)(a1 + 1072) - v47) >> 3 && v44 == *(void *)(v47 + 8 * v45)) {
                  ++v45;
                }
                else {
                  *(_DWORD *)((char *)*v2 + 4 * v44 + v46) = 0;
                }
                ++v44;
              }
              while (v44 < (*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 9));
            }
          }
          goto LABEL_7;
        }
        if ((char *)v21 - (char *)v22 == 16) {
          break;
        }
LABEL_7:
        --v12;
        ++v7;
        v13 -= 4;
        if (v7 == v11) {
          goto LABEL_4;
        }
      }
      uint64_t v23 = *v22;
      uint64_t v24 = v22[1];
      uint64_t v25 = *v22 + v19;
      uint64_t v26 = v25 + v24;
      if (v24 >= 1)
      {
        uint64_t v27 = v24 + v10 + v12 * v20;
        int v28 = *v2;
        uint64_t v29 = v64 + v24 + v23 + v18;
        if (v29 >= v25) {
          uint64_t v30 = v25;
        }
        else {
          uint64_t v30 = v64 + v24 + v23 + v18;
        }
        unint64_t v31 = v10 + v24 + v23 + v18 - v30;
        if (v31 >= 0x30
          && ((char *)v28 + 4 * v26 + -4 * (v29 - v30) - 4 <= (char *)v28 + 4 * v26 - 4
            ? (BOOL v32 = (char *)v28 + 4 * v27 + -4 * (v29 - v30) - 4 > (char *)v28 + 4 * v27 - 4)
            : (BOOL v32 = 1),
              !v32 ? (BOOL v33 = (unint64_t)(v29 - v30) >> 62 == 0) : (BOOL v33 = 0),
              v33))
        {
          uint64_t v34 = v25 + v24;
          if ((unint64_t)(4 * v27 - 4 * v26) >= 0x20)
          {
            uint64_t v34 = v26 - (v31 & 0xFFFFFFFFFFFFFFF8);
            v27 -= v31 & 0xFFFFFFFFFFFFFFF8;
            uint64_t v48 = v10 + v24;
            uint64_t v49 = v10 + v24 + v23 + v18;
            uint64_t v50 = v64 + v24 + v23 + v18;
            if (v50 >= v10 + v23 + v18) {
              uint64_t v50 = v10 + v23 + v18;
            }
            unint64_t v51 = (v49 - v50) & 0xFFFFFFFFFFFFFFF8;
            long long v52 = (long long *)((char *)v28 + 4 * v48 + 4 * v12 * v20 - 16);
            int v53 = (_OWORD *)((char *)v28 + 4 * v49 - 16);
            do
            {
              long long v54 = *v52;
              *(v53 - 1) = *(v52 - 1);
              *int v53 = v54;
              v52 -= 2;
              v53 -= 2;
              v51 -= 8;
            }
            while (v51);
            if (v31 == (v31 & 0xFFFFFFFFFFFFFFF8)) {
              goto LABEL_30;
            }
          }
        }
        else
        {
          uint64_t v34 = v25 + v24;
        }
        long long v35 = (char *)v28 - 4;
        uint64_t v36 = 4 * v27;
        do
        {
          *(_DWORD *)&v35[4 * v34] = *(_DWORD *)&v35[v36];
          v36 -= 4;
          --v34;
        }
        while (v34 > v25);
      }
LABEL_30:
      if (v23 >= 1)
      {
        uint64_t v37 = v10 + 1 + v18;
        if (v25 > v37) {
          uint64_t v37 = v25;
        }
        bzero((char *)*v2 + 4 * v19, 4 * (v63 + v37 + (v7 - v65) * v17));
      }
      while (v26 < v19 + (*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 9))
        *((_DWORD *)*v2 + v26++) = 0;
      goto LABEL_7;
    }
LABEL_55:
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 168))(&v66, a1, 9);
    void *v2 = (uint64_t *)((char *)*v2 + 4 * (int)v66 * v67 * v68 * v69 * v70);
    *(void *)(a1 + 1072) = *(void *)(a1 + 1064);
    if (!*(unsigned char *)(a1 + 1056))
    {
      uint64_t v55 = *(void **)(a1 + 1040);
      if (v55) {
        operator delete[](v55);
      }
      uint64_t v56 = *(void **)(a1 + 1048);
      if (v56) {
        operator delete[](v56);
      }
    }
    *(_WORD *)(a1 + 1056) = 0;
    *(unsigned char *)(a1 + 1058) = 1;
  }
}

uint64_t sub_19E3018D0(uint64_t a1, char **a2, char a3)
{
  uint64_t v7 = *(void *)*a2;
  uint64_t v6 = *((void *)*a2 + 1);
  if (v6 >= 1)
  {
    BOOL v8 = v6 + v7 > (*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 9);
    uint64_t v10 = *a2;
    uint64_t v9 = a2[1];
    if (a3) {
      goto LABEL_3;
    }
LABEL_12:
    if (v9 != v10)
    {
      while ((*(void *)v10 & 0x8000000000000000) == 0)
      {
        uint64_t v12 = *(void *)v10;
        if (v12 >= (*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 9)) {
          break;
        }
        v10 += 8;
        if (v10 == v9) {
          goto LABEL_16;
        }
      }
    }
LABEL_19:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid rangeOrIndices for partial output. ");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  BOOL v8 = 1;
  uint64_t v10 = *a2;
  uint64_t v9 = a2[1];
  if ((a3 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_3:
  if (v9 - v10 != 16 || v7 < 0) {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_19;
  }
LABEL_16:
  if ((char **)(a1 + 1064) != a2) {
    sub_19E1E5B9C((void *)(a1 + 1064), *a2, a2[1], (a2[1] - *a2) >> 3);
  }
  *(unsigned char *)(a1 + 1056) = a3;
  sub_19E301A50(a1);
  *(_WORD *)(a1 + 1057) = 257;
  return 1;
}

void sub_19E301A3C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19E301A50(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 1056))
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
    operator new[]();
  }
  uint64_t v2 = **(void **)(a1 + 1064);
  uint64_t v3 = *(void *)(a1 + 1024);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
  *(void *)(a1 + 1040) = v3 + 4 * v2 * (int)result;
  *(void *)(a1 + 1048) = *(void *)(a1 + 1032) + 4 * v2;
  return result;
}

uint64_t sub_19E301C8C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 1057)) {
    return *(unsigned int *)(a1 + 568);
  }
  uint64_t v1 = *(void *)(a1 + 1064);
  if (*(unsigned char *)(a1 + 1056)) {
    return *(void *)(v1 + 8);
  }
  else {
    return (*(void *)(a1 + 1072) - v1) >> 3;
  }
}

BOOL sub_19E301CC0(uint64_t **a1, void *a2, int a3)
{
  if ((a3 - 8) < 0xFFFFFFF9)
  {
    if ((a3 - 12) >= 0xFFFFFFFD)
    {
      memset(v28, 0, 512);
      ((void (*)(_OWORD *__return_ptr, uint64_t **))(*a1)[19])(v28, a1);
      if (!((uint64_t (*)(uint64_t **))(*a1)[13])(a1) && (*((unsigned char *)a1 + 1058) || *((unsigned char *)a1 + 1057)))
      {
        *((unsigned char *)a1 + 1058) = 0;
        return 1;
      }
    }
    return 0;
  }
  if (((uint64_t (*)(uint64_t **))(*a1)[13])(a1) != 2) {
    return 0;
  }
  uint64_t v7 = a1 + 3;
  uint64_t v6 = (char *)a1[3];
  BOOL v8 = a1 + 3;
  uint64_t v9 = (char *)(a1 + 3);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a3) {
          break;
        }
        uint64_t v6 = *(char **)v9;
        BOOL v8 = (uint64_t **)v9;
        if (!*(void *)v9) {
          goto LABEL_15;
        }
      }
      if (v10 >= a3) {
        break;
      }
      uint64_t v6 = (char *)*((void *)v9 + 1);
      if (!v6)
      {
        BOOL v8 = (uint64_t **)(v9 + 8);
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    uint64_t v11 = v9;
    uint64_t v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a3;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((void *)v9 + 9) = 0;
    *(void *)uint64_t v9 = 0;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = v11;
    *BOOL v8 = (uint64_t *)v9;
    uint64_t v12 = (uint64_t *)*a1[2];
    uint64_t v13 = (uint64_t *)v9;
    if (v12)
    {
      a1[2] = v12;
      uint64_t v13 = *v8;
    }
    sub_19E13C8A0(a1[3], v13);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  if (*((void *)v9 + 5) != *a2) {
    return 1;
  }
  int v14 = *v7;
  uint64_t v15 = a1 + 3;
  uint64_t v16 = (char *)(a1 + 3);
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v16 = (char *)v14;
        int v17 = *((_DWORD *)v14 + 8);
        if (v17 <= a3) {
          break;
        }
        int v14 = *(uint64_t **)v16;
        uint64_t v15 = (uint64_t **)v16;
        if (!*(void *)v16) {
          goto LABEL_26;
        }
      }
      if (v17 >= a3) {
        break;
      }
      int v14 = (uint64_t *)*((void *)v16 + 1);
      if (!v14)
      {
        uint64_t v15 = (uint64_t **)(v16 + 8);
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    uint64_t v18 = v16;
    uint64_t v16 = (char *)operator new(0x50uLL);
    *((_DWORD *)v16 + 8) = a3;
    *(_OWORD *)(v16 + 40) = 0u;
    *(_OWORD *)(v16 + 56) = 0u;
    *((void *)v16 + 9) = 0;
    *(void *)uint64_t v16 = 0;
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 2) = v18;
    *uint64_t v15 = (uint64_t *)v16;
    uint64_t v19 = (uint64_t *)*a1[2];
    uint64_t v20 = (uint64_t *)v16;
    if (v19)
    {
      a1[2] = v19;
      uint64_t v20 = *v15;
    }
    sub_19E13C8A0(a1[3], v20);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  if (*((void *)v16 + 6) != a2[1]) {
    return 1;
  }
  uint64_t v21 = *v7;
  int v22 = (char *)(a1 + 3);
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        int v22 = (char *)v21;
        int v24 = *((_DWORD *)v21 + 8);
        if (v24 <= a3) {
          break;
        }
        uint64_t v21 = *(uint64_t **)v22;
        uint64_t v7 = (uint64_t **)v22;
        if (!*(void *)v22) {
          goto LABEL_38;
        }
      }
      if (v24 >= a3) {
        break;
      }
      uint64_t v21 = (uint64_t *)*((void *)v22 + 1);
      if (!v21)
      {
        uint64_t v7 = (uint64_t **)(v22 + 8);
        goto LABEL_38;
      }
    }
  }
  else
  {
LABEL_38:
    uint64_t v25 = v22;
    int v22 = (char *)operator new(0x50uLL);
    *((_DWORD *)v22 + 8) = a3;
    *(_OWORD *)(v22 + 40) = 0u;
    *(_OWORD *)(v22 + 56) = 0u;
    *((void *)v22 + 9) = 0;
    *(void *)int v22 = 0;
    *((void *)v22 + 1) = 0;
    *((void *)v22 + 2) = v25;
    char *v7 = (uint64_t *)v22;
    uint64_t v26 = (uint64_t *)*a1[2];
    uint64_t v27 = (uint64_t *)v22;
    if (v26)
    {
      a1[2] = v26;
      uint64_t v27 = *v7;
    }
    sub_19E13C8A0(a1[3], v27);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  return *((void *)v22 + 7) != a2[2];
}

uint64_t sub_19E302018(uint64_t a1, uint64_t a2, uint64_t a3, void *__src)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
  }
  sub_19E25E2E0(a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  *(void *)a1 = &unk_1EF0AA338;
  *(void *)(a1 + 1016) = __src[7];
  *(void *)(a1 + 1024) = __src[56];
  *(void *)(a1 + 1032) = __src[72];
  *(_WORD *)(a1 + 1056) = 0;
  *(unsigned char *)(a1 + 1058) = 0;
  *(_DWORD *)(a1 + 1088) = 0;
  *(void *)(a1 + 1072) = 0;
  *(void *)(a1 + 1080) = 0;
  *(void *)(a1 + 1064) = 0;
  uint64_t v7 = *((int *)__src + 32);
  int v12 = 1;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = v7;
  sub_19E13C5C0(a1 + 16, &v12, (int *)&v17);
  uint64_t v8 = *((int *)__src + 64);
  int v12 = 9;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = v8;
  sub_19E13C5C0(a1 + 40, &v12, (int *)&v17);
  *(_DWORD *)(a1 + 1088) = *((_DWORD *)__src + 96);
  return a1;
}

void sub_19E30218C(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void **)(v1 + 1064);
  if (v3)
  {
    *(void *)(v1 + 1072) = v3;
    operator delete(v3);
  }
  sub_19E25E4C4(v1);
  _Unwind_Resume(a1);
}

void sub_19E3021B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E3021D8(void *a1, uint64_t a2)
{
  int v4 = (void *)a1[20];
  int v5 = (void *)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      (*(void (**)(void))(*(void *)*v4 + 8))(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    uint64_t v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        uint64_t v9 = (uint64_t *)v6[1];
        operator delete(v6);
        uint64_t v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  int v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 120);

  return v10(a2, a1);
}

int64x2_t sub_19E3022E0(uint64_t a1, int a2)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1) != 2)
  {
    if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1))
    {
      if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1) != 13) {
        return result;
      }
      int v14 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
      int v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
      uint64_t v17 = (uint64_t **)(a1 + 48);
      uint64_t v16 = *(char **)(a1 + 48);
      uint64_t v18 = *(int *)(a1 + 568);
      uint64_t v19 = v14;
      uint64_t v20 = v15;
      if (v16)
      {
        while (1)
        {
          while (1)
          {
            uint64_t v21 = v16;
            int v22 = *((_DWORD *)v16 + 8);
            if (v22 <= a2) {
              break;
            }
            uint64_t v16 = *(char **)v21;
            uint64_t v17 = (uint64_t **)v21;
            if (!*(void *)v21) {
              goto LABEL_32;
            }
          }
          if (v22 >= a2) {
            break;
          }
          uint64_t v16 = (char *)*((void *)v21 + 1);
          if (!v16) {
            goto LABEL_31;
          }
        }
LABEL_35:
        int64x2_t result = vdupq_n_s64(1uLL);
        *(int64x2_t *)(v21 + 40) = result;
        *((void *)v21 + 7) = v18;
        *((void *)v21 + 8) = v19;
        *((void *)v21 + 9) = v20;
        return result;
      }
    }
    else
    {
      if (*(void *)(*(void *)(a1 + 16) + 40) != 1)
      {
        int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
        int v24 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
        int v25 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
        uint64_t v26 = *(void *)(a1 + 16);
        *(int64x2_t *)(v26 + 40) = vdupq_n_s64(1uLL);
        *(void *)(v26 + 56) = v23;
        *(void *)(v26 + 64) = v24;
        *(void *)(v26 + 72) = v25;
      }
      int v27 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
      int v28 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
      uint64_t v17 = (uint64_t **)(a1 + 48);
      uint64_t v29 = *(char **)(a1 + 48);
      uint64_t v18 = *(int *)(a1 + 568);
      uint64_t v19 = v27;
      uint64_t v20 = v28;
      if (v29)
      {
        while (1)
        {
          while (1)
          {
            uint64_t v21 = v29;
            int v30 = *((_DWORD *)v29 + 8);
            if (v30 <= a2) {
              break;
            }
            uint64_t v29 = *(char **)v21;
            uint64_t v17 = (uint64_t **)v21;
            if (!*(void *)v21) {
              goto LABEL_32;
            }
          }
          if (v30 >= a2) {
            goto LABEL_35;
          }
          uint64_t v29 = (char *)*((void *)v21 + 1);
          if (!v29)
          {
LABEL_31:
            uint64_t v17 = (uint64_t **)(v21 + 8);
            goto LABEL_32;
          }
        }
      }
    }
    uint64_t v21 = (char *)v17;
LABEL_32:
    unint64_t v31 = v21;
    uint64_t v21 = (char *)operator new(0x50uLL);
    *((_DWORD *)v21 + 8) = a2;
    *(_OWORD *)(v21 + 40) = 0u;
    *(_OWORD *)(v21 + 56) = 0u;
    *((void *)v21 + 9) = 0;
    *(void *)uint64_t v21 = 0;
    *((void *)v21 + 1) = 0;
    *((void *)v21 + 2) = v31;
    *uint64_t v17 = (uint64_t *)v21;
    uint64_t v32 = **(void **)(a1 + 40);
    BOOL v33 = (uint64_t *)v21;
    if (v32)
    {
      *(void *)(a1 + 40) = v32;
      BOOL v33 = *v17;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 48), v33);
    ++*(void *)(a1 + 56);
    goto LABEL_35;
  }
  int v5 = (uint64_t **)(a1 + 48);
  int v4 = *(char **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 16) + 40;
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = v4;
        int v8 = *((_DWORD *)v4 + 8);
        if (v8 <= a2) {
          break;
        }
        int v4 = *(char **)v7;
        int v5 = (uint64_t **)v7;
        if (!*(void *)v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      int v4 = (char *)*((void *)v7 + 1);
      if (!v4)
      {
        int v5 = (uint64_t **)(v7 + 8);
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v7 = (char *)(a1 + 48);
LABEL_9:
    uint64_t v9 = v7;
    uint64_t v7 = (char *)operator new(0x50uLL);
    *((_DWORD *)v7 + 8) = a2;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *((void *)v7 + 9) = 0;
    *(void *)uint64_t v7 = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = v9;
    void *v5 = (uint64_t *)v7;
    uint64_t v10 = **(void **)(a1 + 40);
    uint64_t v11 = (uint64_t *)v7;
    if (v10)
    {
      *(void *)(a1 + 40) = v10;
      uint64_t v11 = *v5;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 48), v11);
    ++*(void *)(a1 + 56);
  }
  int64x2_t result = *(int64x2_t *)v6;
  long long v13 = *(_OWORD *)(v6 + 16);
  *((void *)v7 + 9) = *(void *)(v6 + 32);
  *(_OWORD *)(v7 + 56) = v13;
  *(int64x2_t *)(v7 + 40) = result;
  return result;
}

void sub_19E3026E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_19E25F920(a1, a2, a3);

  sub_19E3012BC(a1);
}

uint64_t sub_19E302720(uint64_t a1, char **a2, char a3)
{
  uint64_t v7 = *(void *)*a2;
  uint64_t v6 = *((void *)*a2 + 1);
  if (v6 >= 1)
  {
    BOOL v8 = v6 + v7 > (*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 9);
    uint64_t v10 = *a2;
    uint64_t v9 = a2[1];
    if (a3) {
      goto LABEL_3;
    }
LABEL_12:
    if (v9 != v10)
    {
      while ((*(void *)v10 & 0x8000000000000000) == 0)
      {
        uint64_t v12 = *(void *)v10;
        if (v12 >= (*(int (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 9)) {
          break;
        }
        v10 += 8;
        if (v10 == v9) {
          goto LABEL_16;
        }
      }
    }
LABEL_19:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid rangeOrIndices for partial output. ");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  BOOL v8 = 1;
  uint64_t v10 = *a2;
  uint64_t v9 = a2[1];
  if ((a3 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_3:
  if (v9 - v10 != 16 || v7 < 0) {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_19;
  }
LABEL_16:
  if ((char **)(a1 + 1064) != a2) {
    sub_19E1E5B9C((void *)(a1 + 1064), *a2, a2[1], (a2[1] - *a2) >> 3);
  }
  *(unsigned char *)(a1 + 1056) = a3;
  sub_19E3028A0(a1);
  *(_WORD *)(a1 + 1057) = 257;
  return 1;
}

void sub_19E30288C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19E3028A0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 1056))
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
    operator new[]();
  }
  uint64_t v2 = **(void **)(a1 + 1064);
  uint64_t v3 = *(void *)(a1 + 1024);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, 1);
  *(void *)(a1 + 1040) = v3 + v2 * (int)result;
  *(void *)(a1 + 1048) = *(void *)(a1 + 1032) + 4 * v2;
  return result;
}

BOOL sub_19E302AC0(uint64_t **a1, void *a2, int a3)
{
  if ((a3 - 8) < 0xFFFFFFF9)
  {
    if ((a3 - 12) >= 0xFFFFFFFD)
    {
      memset(v28, 0, 512);
      ((void (*)(_OWORD *__return_ptr, uint64_t **))(*a1)[19])(v28, a1);
      if (!((uint64_t (*)(uint64_t **))(*a1)[13])(a1) && (*((unsigned char *)a1 + 1058) || *((unsigned char *)a1 + 1057)))
      {
        *((unsigned char *)a1 + 1058) = 0;
        return 1;
      }
    }
    return 0;
  }
  if (((uint64_t (*)(uint64_t **))(*a1)[13])(a1) != 2) {
    return 0;
  }
  uint64_t v7 = a1 + 3;
  uint64_t v6 = (char *)a1[3];
  BOOL v8 = a1 + 3;
  uint64_t v9 = (char *)(a1 + 3);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v9 = v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a3) {
          break;
        }
        uint64_t v6 = *(char **)v9;
        BOOL v8 = (uint64_t **)v9;
        if (!*(void *)v9) {
          goto LABEL_15;
        }
      }
      if (v10 >= a3) {
        break;
      }
      uint64_t v6 = (char *)*((void *)v9 + 1);
      if (!v6)
      {
        BOOL v8 = (uint64_t **)(v9 + 8);
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    uint64_t v11 = v9;
    uint64_t v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a3;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((void *)v9 + 9) = 0;
    *(void *)uint64_t v9 = 0;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = v11;
    *BOOL v8 = (uint64_t *)v9;
    uint64_t v12 = (uint64_t *)*a1[2];
    long long v13 = (uint64_t *)v9;
    if (v12)
    {
      a1[2] = v12;
      long long v13 = *v8;
    }
    sub_19E13C8A0(a1[3], v13);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  if (*((void *)v9 + 5) != *a2) {
    return 1;
  }
  int v14 = *v7;
  int v15 = a1 + 3;
  uint64_t v16 = (char *)(a1 + 3);
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v16 = (char *)v14;
        int v17 = *((_DWORD *)v14 + 8);
        if (v17 <= a3) {
          break;
        }
        int v14 = *(uint64_t **)v16;
        int v15 = (uint64_t **)v16;
        if (!*(void *)v16) {
          goto LABEL_26;
        }
      }
      if (v17 >= a3) {
        break;
      }
      int v14 = (uint64_t *)*((void *)v16 + 1);
      if (!v14)
      {
        int v15 = (uint64_t **)(v16 + 8);
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    uint64_t v18 = v16;
    uint64_t v16 = (char *)operator new(0x50uLL);
    *((_DWORD *)v16 + 8) = a3;
    *(_OWORD *)(v16 + 40) = 0u;
    *(_OWORD *)(v16 + 56) = 0u;
    *((void *)v16 + 9) = 0;
    *(void *)uint64_t v16 = 0;
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 2) = v18;
    *int v15 = (uint64_t *)v16;
    uint64_t v19 = (uint64_t *)*a1[2];
    uint64_t v20 = (uint64_t *)v16;
    if (v19)
    {
      a1[2] = v19;
      uint64_t v20 = *v15;
    }
    sub_19E13C8A0(a1[3], v20);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  if (*((void *)v16 + 6) != a2[1]) {
    return 1;
  }
  uint64_t v21 = *v7;
  int v22 = (char *)(a1 + 3);
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        int v22 = (char *)v21;
        int v24 = *((_DWORD *)v21 + 8);
        if (v24 <= a3) {
          break;
        }
        uint64_t v21 = *(uint64_t **)v22;
        uint64_t v7 = (uint64_t **)v22;
        if (!*(void *)v22) {
          goto LABEL_38;
        }
      }
      if (v24 >= a3) {
        break;
      }
      uint64_t v21 = (uint64_t *)*((void *)v22 + 1);
      if (!v21)
      {
        uint64_t v7 = (uint64_t **)(v22 + 8);
        goto LABEL_38;
      }
    }
  }
  else
  {
LABEL_38:
    int v25 = v22;
    int v22 = (char *)operator new(0x50uLL);
    *((_DWORD *)v22 + 8) = a3;
    *(_OWORD *)(v22 + 40) = 0u;
    *(_OWORD *)(v22 + 56) = 0u;
    *((void *)v22 + 9) = 0;
    *(void *)int v22 = 0;
    *((void *)v22 + 1) = 0;
    *((void *)v22 + 2) = v25;
    char *v7 = (uint64_t *)v22;
    uint64_t v26 = (uint64_t *)*a1[2];
    int v27 = (uint64_t *)v22;
    if (v26)
    {
      a1[2] = v26;
      int v27 = *v7;
    }
    sub_19E13C8A0(a1[3], v27);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  return *((void *)v22 + 7) != a2[2];
}

uint64_t sub_19E302E18(void *a1)
{
  *a1 = &unk_1EF0AA4A8;
  uint64_t v2 = (void *)a1[133];
  if (v2)
  {
    a1[134] = v2;
    operator delete(v2);
  }

  return sub_19E25BF30((uint64_t)a1);
}

void sub_19E302E78(void *a1)
{
  *a1 = &unk_1EF0AA4A8;
  uint64_t v2 = (void *)a1[133];
  if (v2)
  {
    a1[134] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)sub_19E25BF30((uint64_t)a1);

  operator delete(v3);
}

uint64_t sub_19E302EDC(void *a1)
{
  *a1 = &unk_1EF0AA338;
  uint64_t v2 = (void *)a1[133];
  if (v2)
  {
    a1[134] = v2;
    operator delete(v2);
  }

  return sub_19E25E4C4((uint64_t)a1);
}

void sub_19E302F3C(void *a1)
{
  *a1 = &unk_1EF0AA338;
  uint64_t v2 = (void *)a1[133];
  if (v2)
  {
    a1[134] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)sub_19E25E4C4((uint64_t)a1);

  operator delete(v3);
}

vImage_Error sub_19E302FA0(void *a1, void *a2, vImagePixelCount a3)
{
  dest.data = a2;
  dest.height = 1;
  dest.width = a3;
  dest.rowBytes = 2 * a3;
  v4.data = a1;
  v4.height = 1;
  v4.width = a3;
  v4.rowBytes = 4 * a3;
  return vImageConvert_PlanarFtoPlanar16F(&v4, &dest, 0);
}

vImage_Error sub_19E302FE8(void *a1, void *a2, vImagePixelCount a3)
{
  src.data = a1;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 2 * a3;
  v4.data = a2;
  v4.height = 1;
  v4.width = a3;
  v4.rowBytes = 4 * a3;
  return vImageConvert_Planar16FtoPlanarF(&src, &v4, 0);
}

float *sub_19E303030(float *result, unsigned char *a2, uint64_t a3, float a4)
{
  for (; a3; --a3)
  {
    float v5 = *result;
    if (*result <= (float)-a4)
    {
      LOBYTE(v4) = -127;
    }
    else if (v5 < a4 && (int v4 = llroundf((float)(v5 * 128.0) * (float)(1.0 / a4)), v4 <= 127))
    {
      if (v4 <= -127) {
        LOBYTE(v4) = -127;
      }
    }
    else
    {
      LOBYTE(v4) = 127;
    }
    *a2++ = v4;
    ++result;
  }
  return result;
}

uint64_t sub_19E3030A0(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0A6D00;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 8), 0);
  return a1;
}

uint64_t sub_19E3030E8(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0A6D00;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  return a1;
}

void sub_19E303130(char *a1)
{
  *(void *)a1 = &unk_1EF0A6D00;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));

  operator delete(a1);
}

uint64_t sub_19E303188(uint64_t a1)
{
  return pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
}

uint64_t sub_19E303190(uint64_t a1)
{
  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
}

void sub_19E3033CC(_Unwind_Exception *a1)
{
  uint64_t v9 = v7;

  _Unwind_Resume(a1);
}

void sub_19E303550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v14 = v13;

  _Unwind_Resume(a1);
}

void sub_19E303580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E3035F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E303638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)a1 = &unk_1EF0AB6D8;
  *(void *)(a1 + 8) = a2;
  sub_19E26B7FC(a1 + 16, a3);
  uint64_t v15 = *(void *)(a4 + 24);
  if (!v15) {
    goto LABEL_4;
  }
  if (v15 != a4)
  {
    uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 16))(v15);
LABEL_4:
    *(void *)(a1 + 160) = v15;
    goto LABEL_6;
  }
  *(void *)(a1 + 160) = a1 + 136;
  (*(void (**)(void, uint64_t))(**(void **)(a4 + 24) + 24))(*(void *)(a4 + 24), a1 + 136);
LABEL_6:
  uint64_t v16 = *(void *)(a5 + 24);
  if (v16)
  {
    if (v16 == a5)
    {
      *(void *)(a1 + 192) = a1 + 168;
      (*(void (**)(void))(**(void **)(a5 + 24) + 24))(*(void *)(a5 + 24));
      goto LABEL_11;
    }
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 16))(v16);
  }
  *(void *)(a1 + 192) = v16;
LABEL_11:
  *(void *)(a1 + 200) = a6;
  *(void *)(a1 + 208) = a7;
  *(void *)(a1 + 216) = a8;
  *(_DWORD *)(a1 + 224) = *(_DWORD *)a9;
  *(void *)(a1 + 232) = *(void *)(a9 + 8);
  *(void *)(a1 + 240) = *(void *)(a9 + 16);
  *(_DWORD *)(a1 + 248) = 0;
  return a1;
}

void sub_19E3037B8(_Unwind_Exception *a1)
{
  sub_19E2F6F7C(v3);
  sub_19E15A064(v2, *(char **)(v1 + 24));
  _Unwind_Resume(a1);
}

void sub_19E3037D8(_Unwind_Exception *a1)
{
  sub_19E15A064(v2, *(char **)(v1 + 24));
  _Unwind_Resume(a1);
}

void sub_19E3037F0(uint64_t a1, int a2)
{
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
  *(_OWORD *)out = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *(_OWORD *)in = 0u;
  long long v16 = 0u;
  memset(v14, 0, sizeof(v14));
  sub_19E303964(a1, a2, (uint64_t)v14);
  memset(v13, 0, sizeof(v13));
  int v4 = (void *)MEMORY[0x19F3BB100](v14, v13);
  int v39 = a2;
  uint64_t v5 = *(void *)(a1 + 160);
  if (!v5
    || ((*(void (**)(uint64_t *__return_ptr))(*(void *)v5 + 48))(&v8),
        int v39 = a2,
        (uint64_t v6 = *(void *)(a1 + 192)) == 0))
  {
    sub_19E2A8074();
  }
  size_t v7 = (int)v9 * (int)v10 * (int)v11 * (int)v12 / (unint64_t)a2;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v6 + 48))(&v8);
  BNNSFilterApplyBatch(v4, a2, in[1], v7, out[1], (int)v9 * (int)v10 * (int)v11 * (int)v12 / (unint64_t)a2);
  if (v4) {
    BNNSFilterDestroy(v4);
  }
}

double sub_19E303964@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v29 = a2;
  uint64_t v4 = *(void *)(a1 + 160);
  if (!v4) {
    goto LABEL_11;
  }
  (*(void (**)(void *__return_ptr))(*(void *)v4 + 48))(v28);
  uint64_t v26 = v28[5];
  uint64_t v7 = sub_19E2F77D0(v28, 0);
  uint64_t v24 = v28[1];
  uint64_t v25 = v7;
  uint64_t v23 = sub_19E2F77D0(v28, 1);
  uint64_t v8 = v28[2];
  uint64_t v9 = sub_19E2F77D0(v28, 2);
  uint64_t v10 = v28[3];
  int v29 = a2;
  uint64_t v11 = *(void *)(a1 + 192);
  if (!v11) {
LABEL_11:
  }
    sub_19E2A8074();
  (*(void (**)(void *__return_ptr))(*(void *)v11 + 48))(v27);
  uint64_t v12 = v27[5];
  uint64_t v13 = sub_19E2F77D0(v27, 0);
  uint64_t v14 = v27[1];
  uint64_t v15 = sub_19E2F77D0(v27, 1);
  uint64_t v16 = v27[2];
  uint64_t v17 = sub_19E2F77D0(v27, 2);
  uint64_t v18 = v27[3];
  *(void *)a3 = 0x3000000000000;
  *(void *)(a3 + 8) = v24;
  *(void *)(a3 + 16) = v8;
  *(void *)(a3 + 24) = v10;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(void *)(a3 + 64) = 0;
  *(void *)(a3 + 72) = v25;
  *(void *)(a3 + 80) = v23;
  *(void *)(a3 + 88) = v9;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(void *)(a3 + 128) = 0;
  *(void *)(a3 + 136) = v26;
  *(_DWORD *)(a3 + 144) = 65568;
  *(void *)(a3 + 156) = 0;
  *(void *)(a3 + 148) = 0;
  *(void *)(a3 + 176) = 0x3000000000000;
  *(_DWORD *)(a3 + 164) = 1065353216;
  *(void *)(a3 + 168) = 0;
  *(void *)(a3 + 184) = v14;
  *(void *)(a3 + 192) = v16;
  *(void *)(a3 + 200) = v18;
  *(_OWORD *)(a3 + 208) = 0u;
  *(_OWORD *)(a3 + 224) = 0u;
  *(void *)(a3 + 240) = 0;
  *(void *)(a3 + 248) = v13;
  *(void *)(a3 + 256) = v15;
  *(void *)(a3 + 264) = v17;
  *(_OWORD *)(a3 + 272) = 0u;
  *(_OWORD *)(a3 + 288) = 0u;
  *(void *)(a3 + 304) = 0;
  *(void *)(a3 + 312) = v12;
  *(_DWORD *)(a3 + 320) = 65568;
  *(void *)(a3 + 332) = 0;
  *(void *)(a3 + 324) = 0;
  *(_DWORD *)(a3 + 340) = 1065353216;
  long long v19 = (_OWORD *)(a3 + 528);
  *(void *)(a3 + 520) = 0;
  *(_OWORD *)(a3 + 344) = 0u;
  *(_OWORD *)(a3 + 360) = 0u;
  *(_OWORD *)(a3 + 376) = 0u;
  *(_OWORD *)(a3 + 392) = 0u;
  *(_OWORD *)(a3 + 408) = 0u;
  *(_OWORD *)(a3 + 424) = 0u;
  *(_OWORD *)(a3 + 440) = 0u;
  *(_OWORD *)(a3 + 456) = 0u;
  *(_OWORD *)(a3 + 472) = 0u;
  uint64_t v20 = *(void *)(a1 + 200) - 1;
  *(_OWORD *)(a3 + 488) = 0u;
  *(_OWORD *)(a3 + 504) = 0u;
  switch(v20)
  {
    case 0:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      _OWORD *v19 = 0uLL;
      int v21 = 3;
      goto LABEL_9;
    case 1:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      _OWORD *v19 = 0uLL;
      int v21 = 4;
      goto LABEL_9;
    case 3:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      _OWORD *v19 = 0uLL;
      int v21 = 11;
      goto LABEL_9;
    case 4:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      _OWORD *v19 = 0uLL;
      int v21 = 1;
LABEL_9:
      *(_DWORD *)long long v19 = v21;
      break;
    default:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      _OWORD *v19 = 0uLL;
      break;
  }
  *(_DWORD *)(a3 + 576) = *(_DWORD *)(a1 + 248);
  *(void *)(a3 + 584) = sub_19E254720(a1 + 16, 0);
  *(void *)(a3 + 592) = sub_19E254720(a1 + 16, 1);
  *(void *)(a3 + 600) = sub_19E254934(a1 + 16, 0);
  *(void *)(a3 + 608) = sub_19E254934(a1 + 16, 1);
  *(void *)(a3 + 616) = sub_19E303C6C(a1 + 16, 0);
  *(void *)(a3 + 624) = sub_19E303C6C(a1 + 16, 1);
  *(_OWORD *)(a3 + 632) = *(_OWORD *)(a1 + 208);
  double result = 0.0;
  *(_OWORD *)(a3 + 648) = 0u;
  *(_OWORD *)(a3 + 664) = 0u;
  return result;
}

uint64_t sub_19E303C6C(uint64_t a1, int a2)
{
  char v16 = 14;
  strcpy((char *)__s1, "dilationStride");
  uint64_t v2 = *(uint64_t ***)(a1 + 8);
  if (!v2) {
LABEL_20:
  }
    sub_19E13DF40("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      int v4 = *((char *)v2 + 55);
      if (v4 >= 0) {
        unint64_t v5 = *((unsigned __int8 *)v2 + 55);
      }
      else {
        unint64_t v5 = (unint64_t)v2[5];
      }
      if (v4 >= 0) {
        uint64_t v6 = (uint64_t *)(v2 + 4);
      }
      else {
        uint64_t v6 = v2[4];
      }
      if (v5 >= 0xE) {
        size_t v7 = 14;
      }
      else {
        size_t v7 = v5;
      }
      int v8 = memcmp(__s1, v6, v7);
      BOOL v9 = v8 < 0;
      if (!v8) {
        BOOL v9 = v5 > 0xE;
      }
      if (!v9) {
        break;
      }
      uint64_t v2 = (uint64_t **)*v2;
      if (!v2) {
        goto LABEL_20;
      }
    }
    int v10 = memcmp(v6, __s1, v7);
    BOOL v11 = v5 < 0xE;
    if (v10) {
      BOOL v11 = v10 < 0;
    }
    if (!v11) {
      break;
    }
    uint64_t v2 = (uint64_t **)v2[1];
    if (!v2) {
      goto LABEL_20;
    }
  }
  int v17 = a2;
  uint64_t v12 = *((unsigned int *)v2 + 18);
  if (v12 == -1) {
    sub_19E254898();
  }
  uint64_t v18 = &v17;
  uint64_t v13 = ((uint64_t (*)(int **, uint64_t **))*(&off_1EF0AC110 + v12))(&v18, v2 + 7);
  if (v16 < 0) {
    operator delete(__s1[0]);
  }
  return v13;
}

void sub_19E303DCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_19E303DE8(void *a1, uint64_t a2, uint64_t a3, int32x2_t *__src)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v17 = *(void *)(a2 + 16);
  }
  sub_19E25BD4C((uint64_t)a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_1EF0A9038;
  int32x2_t v7 = __src[32];
  LODWORD(v8) = __src[17].i32[0];
  if ((int)v8 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v8;
  }
  int v9 = __src[33].i32[0];
  uint64_t v10 = __src[33].i32[1];
  int v18 = 1;
  int32x2_t v11 = vmax_s32(__src[16], (int32x2_t)0x100000001);
  *(void *)&long long v12 = v11.u32[0];
  *((void *)&v12 + 1) = v11.u32[1];
  long long v19 = v12;
  uint64_t v20 = v8;
  sub_19E13C5C0((uint64_t)(a1 + 2), &v18, (int *)&v22);
  int32x2_t v13 = vmax_s32(v7, (int32x2_t)0x100000001);
  int v18 = 9;
  *(void *)&long long v12 = v13.u32[0];
  *((void *)&v12 + 1) = v13.u32[1];
  long long v19 = v12;
  if (v9 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v9;
  }
  uint64_t v20 = v14;
  uint64_t v21 = v10;
  sub_19E13C5C0((uint64_t)(a1 + 5), &v18, (int *)&v22);
  return a1;
}

void sub_19E303F4C(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E303F60(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E303F74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E303F94(void *a1)
{
  uint64_t v2 = *sub_19E25DA90((uint64_t)a1, 9);
  uint64_t v3 = sub_19E25D8B0((uint64_t)a1, 1);
  memcpy(v2, *v3, 4* *(_DWORD *)(a1[2] + 40)* *(_DWORD *)(a1[2] + 48)* *(_DWORD *)(a1[2] + 56)* *(_DWORD *)(a1[2] + 64)* *(_DWORD *)(a1[2] + 72));
  int v4 = *(uint64_t (**)(void *))(*a1 + 32);

  return v4(a1);
}

double sub_19E304038(void *a1, int a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[5];
  long long v32 = *(_OWORD *)(v4 + 40);
  uint64_t v33 = *(void *)(v4 + 56);
  uint64_t v5 = *(void *)(v4 + 72);
  int v6 = (*(uint64_t (**)(void *))(*a1 + 224))(a1);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  memset(v15, 0, sizeof(v15));
  (*(void (**)(_OWORD *__return_ptr, void *))(*a1 + 152))(v15, a1);
  if (HIDWORD(v16))
  {
    uint64_t v8 = a1 + 6;
    uint64_t v7 = a1[6];
    if (v7) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v5 = (*(int (**)(void *, uint64_t))(*a1 + 216))(a1, 1);
  uint64_t v8 = a1 + 6;
  uint64_t v7 = a1[6];
  if (!v7)
  {
LABEL_5:
    int v9 = v8;
    goto LABEL_12;
  }
  do
  {
LABEL_7:
    while (1)
    {
      int v9 = (void *)v7;
      int v10 = *(_DWORD *)(v7 + 32);
      if (v10 <= a2) {
        break;
      }
      uint64_t v7 = *v9;
      uint64_t v8 = v9;
      if (!*v9) {
        goto LABEL_12;
      }
    }
    if (v10 >= a2)
    {
      int32x2_t v13 = (char *)v9;
      goto LABEL_15;
    }
    uint64_t v7 = v9[1];
  }
  while (v7);
  uint64_t v8 = v9 + 1;
LABEL_12:
  int32x2_t v13 = (char *)operator new(0x50uLL);
  *((_DWORD *)v13 + 8) = a2;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 56) = 0u;
  *((void *)v13 + 9) = 0;
  *(void *)int32x2_t v13 = 0;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = v9;
  *uint64_t v8 = v13;
  uint64_t v11 = *(void *)a1[5];
  long long v12 = (uint64_t *)v13;
  if (v11)
  {
    a1[5] = v11;
    long long v12 = (uint64_t *)*v8;
  }
  sub_19E13C8A0((uint64_t *)a1[6], v12);
  ++a1[7];
LABEL_15:
  double result = *(double *)&v32;
  *(_OWORD *)(v13 + 40) = v32;
  *((void *)v13 + 7) = v33;
  *((void *)v13 + 8) = v6;
  *((void *)v13 + 9) = v5;
  return result;
}

void *sub_19E30425C(void *a1, uint64_t a2, uint64_t a3, int32x2_t *__src)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v17 = *(void *)(a2 + 16);
  }
  sub_19E25E2E0((uint64_t)a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_1EF0A8EC8;
  int32x2_t v7 = __src[32];
  LODWORD(v8) = __src[17].i32[0];
  if ((int)v8 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v8;
  }
  int v9 = __src[33].i32[0];
  uint64_t v10 = __src[33].i32[1];
  int v18 = 1;
  int32x2_t v11 = vmax_s32(__src[16], (int32x2_t)0x100000001);
  *(void *)&long long v12 = v11.u32[0];
  *((void *)&v12 + 1) = v11.u32[1];
  long long v19 = v12;
  uint64_t v20 = v8;
  sub_19E13C5C0((uint64_t)(a1 + 2), &v18, (int *)&v22);
  int32x2_t v13 = vmax_s32(v7, (int32x2_t)0x100000001);
  int v18 = 9;
  *(void *)&long long v12 = v13.u32[0];
  *((void *)&v12 + 1) = v13.u32[1];
  long long v19 = v12;
  if (v9 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v9;
  }
  uint64_t v20 = v14;
  uint64_t v21 = v10;
  sub_19E13C5C0((uint64_t)(a1 + 5), &v18, (int *)&v22);
  return a1;
}

void sub_19E3043C0(_Unwind_Exception *a1)
{
  sub_19E25E4C4(v1);
  _Unwind_Resume(a1);
}

void sub_19E3043D4(_Unwind_Exception *a1)
{
  sub_19E25E4C4(v1);
  _Unwind_Resume(a1);
}

void sub_19E3043E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E304408(void *a1)
{
  uint64_t v2 = *sub_19E25DA90((uint64_t)a1, 9);
  uint64_t v3 = sub_19E25D8B0((uint64_t)a1, 1);
  memcpy(v2, *v3, *(_DWORD *)(a1[2] + 40)* *(_DWORD *)(a1[2] + 48)* *(_DWORD *)(a1[2] + 56)* *(_DWORD *)(a1[2] + 64)* *(_DWORD *)(a1[2] + 72));
  uint64_t v4 = *(uint64_t (**)(void *))(*a1 + 32);

  return v4(a1);
}

double sub_19E3044AC(void *a1, int a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[5];
  long long v32 = *(_OWORD *)(v4 + 40);
  uint64_t v33 = *(void *)(v4 + 56);
  uint64_t v5 = *(void *)(v4 + 72);
  int v6 = (*(uint64_t (**)(void *))(*a1 + 224))(a1);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  memset(v15, 0, sizeof(v15));
  (*(void (**)(_OWORD *__return_ptr, void *))(*a1 + 152))(v15, a1);
  if (HIDWORD(v16))
  {
    uint64_t v8 = a1 + 6;
    uint64_t v7 = a1[6];
    if (v7) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v5 = (*(int (**)(void *, uint64_t))(*a1 + 216))(a1, 1);
  uint64_t v8 = a1 + 6;
  uint64_t v7 = a1[6];
  if (!v7)
  {
LABEL_5:
    int v9 = v8;
    goto LABEL_12;
  }
  do
  {
LABEL_7:
    while (1)
    {
      int v9 = (void *)v7;
      int v10 = *(_DWORD *)(v7 + 32);
      if (v10 <= a2) {
        break;
      }
      uint64_t v7 = *v9;
      uint64_t v8 = v9;
      if (!*v9) {
        goto LABEL_12;
      }
    }
    if (v10 >= a2)
    {
      int32x2_t v13 = (char *)v9;
      goto LABEL_15;
    }
    uint64_t v7 = v9[1];
  }
  while (v7);
  uint64_t v8 = v9 + 1;
LABEL_12:
  int32x2_t v13 = (char *)operator new(0x50uLL);
  *((_DWORD *)v13 + 8) = a2;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 56) = 0u;
  *((void *)v13 + 9) = 0;
  *(void *)int32x2_t v13 = 0;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = v9;
  *uint64_t v8 = v13;
  uint64_t v11 = *(void *)a1[5];
  long long v12 = (uint64_t *)v13;
  if (v11)
  {
    a1[5] = v11;
    long long v12 = (uint64_t *)*v8;
  }
  sub_19E13C8A0((uint64_t *)a1[6], v12);
  ++a1[7];
LABEL_15:
  double result = *(double *)&v32;
  *(_OWORD *)(v13 + 40) = v32;
  *((void *)v13 + 7) = v33;
  *((void *)v13 + 8) = v6;
  *((void *)v13 + 9) = v5;
  return result;
}

void sub_19E3046D4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_19E25BF30(a1);

  operator delete(v1);
}

void sub_19E304700(uint64_t a1)
{
  uint64_t v1 = (void *)sub_19E25E4C4(a1);

  operator delete(v1);
}

void sub_19E304728(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0A9D30;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = a1 + 16;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = a1 + 40;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  operator new();
}

void sub_19E304810(_Unwind_Exception *a1)
{
  sub_19E15A064(v2, *v4);
  sub_19E15A064(v1, *v3);
  _Unwind_Resume(a1);
}

void sub_19E304834(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0A9D30;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = a1 + 16;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = a1 + 40;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  operator new();
}

void sub_19E30491C(_Unwind_Exception *a1)
{
  sub_19E15A064(v2, *v4);
  sub_19E15A064(v1, *v3);
  _Unwind_Resume(a1);
}

uint64_t sub_19E304940(uint64_t a1)
{
  *(void *)a1 = &unk_1EF0A9D30;
  sub_19E15A064(a1 + 224, *(char **)(a1 + 232));
  uint64_t v2 = *(void *)(a1 + 216);
  *(void *)(a1 + 216) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  sub_19E30D00C(a1 + 192, *(void *)(a1 + 200));
  sub_19E15A064(a1 + 168, *(char **)(a1 + 176));
  sub_19E30CF18(a1 + 144, *(char **)(a1 + 152));
  uint64_t v3 = *(void *)(a1 + 120);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 128);
    uint64_t v5 = *(void **)(a1 + 120);
    if (v4 != v3)
    {
      do
      {
        if (*(char *)(v4 - 1) < 0) {
          operator delete(*(void **)(v4 - 24));
        }
        v4 -= 24;
      }
      while (v4 != v3);
      uint64_t v5 = *(void **)(a1 + 120);
    }
    *(void *)(a1 + 128) = v3;
    operator delete(v5);
  }
  sub_19E30CE64(a1 + 96, *(char **)(a1 + 104));
  sub_19E30CDE0(a1 + 72, *(void **)(a1 + 80));
  int v6 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0;
  if (v6) {
    operator delete(v6);
  }
  sub_19E15A064(a1 + 32, *(char **)(a1 + 40));
  sub_19E15A064(a1 + 8, *(char **)(a1 + 16));
  return a1;
}

void sub_19E304A70(uint64_t a1)
{
  uint64_t v1 = (void *)sub_19E304940(a1);

  operator delete(v1);
}

void *sub_19E304A98(void *result, const void ***a2, const void ***a3)
{
  uint64_t v4 = result;
  uint64_t v5 = *a2;
  int v6 = a2[1];
  if (*a2 != v6)
  {
    do
    {
      double result = sub_19E159B70((uint64_t **)v4 + 1, v4 + 2, v5, (uint64_t)v5);
      v5 += 3;
    }
    while (v5 != v6);
  }
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  if (*a3 != v8)
  {
    int v9 = (uint64_t **)(v4 + 4);
    int v10 = v4 + 5;
    do
    {
      double result = sub_19E159B70(v9, v10, v7, (uint64_t)v7);
      v7 += 3;
    }
    while (v7 != v8);
  }
  return result;
}

uint64_t sub_19E304B34(uint64_t a1, uint64_t a2)
{
  sub_19E304C24(a1, a2, (uint64_t)__p);
  uint64_t v8 = __p;
  uint64_t v8 = (void **)(sub_19E30D0E0((uint64_t **)(a1 + 144), (const void **)__p, (uint64_t)&unk_19E351150, (long long **)&v8)[7]
               + 24);
  uint64_t v3 = sub_19E26CE00((uint64_t **)(a1 + 96), (const void **)v8, (uint64_t)&unk_19E351150, (long long **)&v8);
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(*v3[7] + 72))(v3[7], 1);
  uint64_t v5 = result;
  if (v7 < 0)
  {
    operator delete(__p[0]);
    return v5;
  }
  return result;
}

void sub_19E304C08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E304C24(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v6 = *(char *)(a2 + 23);
  if ((v6 & 0x80000000) == 0)
  {
    std::string __p = *(std::string *)a2;
    uint64_t v7 = a1 + 8;
    if (*(void *)(a1 + 24) != 1 || v6 != 0) {
      goto LABEL_14;
    }
LABEL_13:
    std::string::operator=(&__p, (const std::string *)(*(void *)v7 + 32));
    goto LABEL_14;
  }
  sub_19E13C2D0(&__p, *(void **)a2, *(void *)(a2 + 8));
  uint64_t v7 = a1 + 8;
  if (*(char *)(a2 + 23) < 0)
  {
    if (*(void *)(a1 + 24) == 1 && *(void *)(a2 + 8) == 0) {
      goto LABEL_13;
    }
  }
  else if (*(void *)(a1 + 24) == 1 && *(unsigned char *)(a2 + 23) == 0)
  {
    goto LABEL_13;
  }
LABEL_14:
  if (sub_19E254CCC(v7, (uint64_t)&__p))
  {
    *(std::string *)a3 = __p;
    return;
  }
  int v10 = sub_19E26EDD8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_19E32FF50(v10);
    *(unsigned char *)(a3 + 23) = 0;
    *(unsigned char *)a3 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_19;
    }
  }
  else
  {
    *(unsigned char *)(a3 + 23) = 0;
    *(unsigned char *)a3 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
LABEL_19:
    }
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_19E304D6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E304D90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __p;
  sub_19E304F28(a1, a2, (uint64_t)__p);
  uint64_t v6 = *(void *)(a1 + 176);
  uint64_t v4 = a1 + 176;
  uint64_t v5 = v6;
  if (!v6) {
    goto LABEL_41;
  }
  uint64_t v7 = (uint64_t **)(v4 - 8);
  if ((v31 & 0x80u) == 0) {
    size_t v8 = v31;
  }
  else {
    size_t v8 = (size_t)__p[1];
  }
  if ((v31 & 0x80u) != 0) {
    uint64_t v3 = (void **)__p[0];
  }
  uint64_t v9 = v4;
  do
  {
    int v10 = *(char *)(v5 + 55);
    if (v10 >= 0) {
      size_t v11 = *(unsigned __int8 *)(v5 + 55);
    }
    else {
      size_t v11 = *(void *)(v5 + 40);
    }
    if (v10 >= 0) {
      long long v12 = (const void *)(v5 + 32);
    }
    else {
      long long v12 = *(const void **)(v5 + 32);
    }
    if (v8 >= v11) {
      size_t v13 = v11;
    }
    else {
      size_t v13 = v8;
    }
    int v14 = memcmp(v12, v3, v13);
    BOOL v15 = v11 < v8;
    if (v14) {
      BOOL v15 = v14 < 0;
    }
    BOOL v16 = !v15;
    if (v15) {
      long long v17 = (uint64_t *)(v5 + 8);
    }
    else {
      long long v17 = (uint64_t *)v5;
    }
    if (v16) {
      uint64_t v9 = v5;
    }
    uint64_t v5 = *v17;
  }
  while (*v17);
  if (v9 == v4) {
    goto LABEL_41;
  }
  uint64_t v20 = *(void *)(v9 + 32);
  uint64_t v19 = v9 + 32;
  uint64_t v18 = v20;
  int v21 = *(char *)(v19 + 23);
  size_t v22 = v21 >= 0 ? *(unsigned __int8 *)(v19 + 23) : *(void *)(v19 + 8);
  long long v23 = (const void *)(v21 >= 0 ? v19 : v18);
  size_t v24 = v22 >= v8 ? v8 : v22;
  int v25 = memcmp(v3, v23, v24);
  BOOL v26 = v8 >= v22;
  if (v25) {
    BOOL v26 = v25 >= 0;
  }
  if (v26)
  {
    long long v32 = __p;
    long long v27 = sub_19E2538E8(v7, (const void **)__p, (uint64_t)&unk_19E351150, (long long **)&v32);
    uint64_t v28 = (*((_DWORD *)v27 + 14) * *((_DWORD *)v27 + 16) * *((_DWORD *)v27 + 18));
    if ((char)v31 < 0) {
      goto LABEL_42;
    }
  }
  else
  {
LABEL_41:
    uint64_t v28 = 0;
    if ((char)v31 < 0) {
LABEL_42:
    }
      operator delete(__p[0]);
  }
  return v28;
}

void sub_19E304F0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E304F28(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v6 = *(char *)(a2 + 23);
  if ((v6 & 0x80000000) == 0)
  {
    std::string __p = *(std::string *)a2;
    uint64_t v7 = a1 + 32;
    if (*(void *)(a1 + 48) != 1 || v6 != 0) {
      goto LABEL_14;
    }
LABEL_13:
    std::string::operator=(&__p, (const std::string *)(*(void *)v7 + 32));
    goto LABEL_14;
  }
  sub_19E13C2D0(&__p, *(void **)a2, *(void *)(a2 + 8));
  uint64_t v7 = a1 + 32;
  if (*(char *)(a2 + 23) < 0)
  {
    if (*(void *)(a1 + 48) == 1 && *(void *)(a2 + 8) == 0) {
      goto LABEL_13;
    }
  }
  else if (*(void *)(a1 + 48) == 1 && *(unsigned char *)(a2 + 23) == 0)
  {
    goto LABEL_13;
  }
LABEL_14:
  if (sub_19E254CCC(v7, (uint64_t)&__p))
  {
    *(std::string *)a3 = __p;
    return;
  }
  int v10 = sub_19E26EDD8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_19E32FF94();
    *(unsigned char *)(a3 + 23) = 0;
    *(unsigned char *)a3 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_19;
    }
  }
  else
  {
    *(unsigned char *)(a3 + 23) = 0;
    *(unsigned char *)a3 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
LABEL_19:
    }
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_19E305074(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E305098(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_19E304C24(a1, a2, (uint64_t)v11);
  char v5 = v12;
  if ((v12 & 0x80000000) == 0)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_6:
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    if ((v5 & 0x80) == 0) {
      return;
    }
    goto LABEL_13;
  }
  if (!v11[1]) {
    goto LABEL_6;
  }
LABEL_3:
  size_t v13 = v11;
  uint64_t v6 = sub_19E30D0E0((uint64_t **)(a1 + 144), (const void **)v11, (uint64_t)&unk_19E351150, (long long **)&v13)[7];
  if (*(char *)(v6 + 47) < 0)
  {
    sub_19E13C2D0(__p, *(void **)(v6 + 24), *(void *)(v6 + 32));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)(v6 + 24);
    uint64_t v10 = *(void *)(v6 + 40);
  }
  size_t v13 = v11;
  uint64_t v7 = *(unsigned int *)(sub_19E30D0E0((uint64_t **)(a1 + 144), (const void **)v11, (uint64_t)&unk_19E351150, (long long **)&v13)[7]+ 52);
  size_t v13 = __p;
  size_t v8 = sub_19E26CE00((uint64_t **)(a1 + 96), (const void **)__p, (uint64_t)&unk_19E351150, (long long **)&v13);
  (*(void (**)(uint64_t *, uint64_t))(*v8[7] + 160))(v8[7], v7);
  if ((SHIBYTE(v10) & 0x80000000) == 0)
  {
    if ((v12 & 0x80) == 0) {
      return;
    }
LABEL_13:
    operator delete(v11[0]);
    return;
  }
  operator delete(__p[0]);
  if (v12 < 0) {
    goto LABEL_13;
  }
}

void sub_19E30520C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if ((a20 & 0x80000000) == 0) {
    _Unwind_Resume(exception_object);
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E305258(uint64_t a1, uint64_t a2)
{
  sub_19E304F28(a1, a2, (uint64_t)__p);
  uint64_t v3 = (uint64_t **)(a1 + 192);
  if (sub_19E254CCC((uint64_t)v3, (uint64_t)__p))
  {
    size_t v8 = __p;
    uint64_t v4 = sub_19E30D39C(v3, (const void **)__p, (uint64_t)&unk_19E351150, (long long **)&v8)[7][1];
    if (v7 < 0) {
      goto LABEL_6;
    }
    return v4;
  }
  uint64_t v4 = 0;
  if ((v7 & 0x80000000) == 0) {
    return v4;
  }
LABEL_6:
  operator delete(__p[0]);
  return v4;
}

void sub_19E305300(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E30531C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_19E304F28(a1, a2, (uint64_t)__p);
  char v5 = (uint64_t **)(a1 + 168);
  if (sub_19E254CCC((uint64_t)v5, (uint64_t)__p))
  {
    uint64_t v10 = __p;
    uint64_t v6 = sub_19E2538E8(v5, (const void **)__p, (uint64_t)&unk_19E351150, (long long **)&v10);
    long long v7 = *(_OWORD *)(v6 + 9);
    *(_OWORD *)a3 = *(_OWORD *)(v6 + 7);
    *(_OWORD *)(a3 + 16) = v7;
    *(void *)(a3 + 32) = v6[11];
    if (v9 < 0) {
      goto LABEL_6;
    }
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    if (v9 < 0) {
LABEL_6:
    }
      operator delete(__p[0]);
  }
}

void sub_19E3053D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFArray *sub_19E3053F0(uint64_t a1)
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  if (*(int *)(a1 + 56) >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = (void *)(a1 + 104);
    do
    {
      if (qword_1E9457D20 != -1) {
        dispatch_once(&qword_1E9457D20, &unk_1EF0AC020);
      }
      Instance = (void *)_CFRuntimeCreateInstance();
      Instance[3] = 0;
      Instance[2] = Instance + 3;
      Instance[6] = 0;
      Instance[4] = 0;
      Instance[5] = Instance + 6;
      Instance[8] = 0;
      Instance[9] = 0;
      Instance[7] = 0;
      uint64_t v6 = *(void **)(a1 + 96);
      if (v6 != v4)
      {
        do
        {
          (*(void (**)(void, void *, uint64_t))(*(void *)v6[7] + 288))(v6[7], Instance, v3);
          long long v7 = (void *)v6[1];
          if (v7)
          {
            do
            {
              size_t v8 = v7;
              long long v7 = (void *)*v7;
            }
            while (v7);
          }
          else
          {
            do
            {
              size_t v8 = (void *)v6[2];
              BOOL v9 = *v8 == (void)v6;
              uint64_t v6 = v8;
            }
            while (!v9);
          }
          uint64_t v6 = v8;
        }
        while (v8 != v4);
      }
      CFArrayAppendValue(Mutable, Instance);
      CFRelease(Instance);
      uint64_t v3 = (v3 + 1);
    }
    while ((int)v3 < *(_DWORD *)(a1 + 56));
  }
  return Mutable;
}

uint64_t *sub_19E305584(uint64_t a1, uint64_t a2, void **a3)
{
  if (*(void *)(a2 + 8) == 250) {
    uint64_t v6 = 250;
  }
  else {
    uint64_t v6 = 0;
  }
  long long v7 = *(void **)(a1 + 80);
  if (!v7) {
    goto LABEL_14;
  }
  size_t v8 = (void *)(a1 + 80);
  do
  {
    uint64_t v9 = v7[4];
    BOOL v10 = v9 < v6;
    if (v9 >= v6) {
      size_t v11 = v7;
    }
    else {
      size_t v11 = v7 + 1;
    }
    if (!v10) {
      size_t v8 = v7;
    }
    long long v7 = (void *)*v11;
  }
  while (*v11);
  if (v8 == (void *)(a1 + 80) || v6 < v8[4]) {
LABEL_14:
  }
    operator new();
  switch(*(void *)a2)
  {
    case 0:
    case 2:
    case 0xDLL:
      uint64_t v22 = *(void *)(a2 + 32);
      if (v22 == 2) {
        operator new();
      }
      if (!v22) {
        operator new();
      }
      return result;
    case 1:
      operator new();
    case 3:
    case 0xELL:
    case 0xFLL:
    case 0x10:
    case 0x19:
    case 0x1CLL:
      operator new();
    case 4:
      uint64_t v23 = *(void *)(a2 + 32);
      if (v23 == 2) {
        sub_19E306858();
      }
      if (!v23) {
        sub_19E3067D8();
      }
      return result;
    case 5:
    case 6:
    case 9:
    case 0xALL:
      uint64_t v21 = *(void *)(a2 + 32);
      if (v21 == 2) {
        operator new();
      }
      if (!v21) {
        operator new();
      }
      return result;
    case 0xBLL:
      operator new();
    case 0xCLL:
      operator new();
    case 0x11:
      operator new();
    case 0x12:
      operator new();
    case 0x13:
      operator new();
    case 0x14:
      operator new();
    case 0x15:
      operator new();
    case 0x16:
      uint64_t v24 = *(void *)(a2 + 32);
      if (v24 == 2) {
        sub_19E306B58();
      }
      if (!v24) {
        sub_19E306AD8();
      }
      return result;
    case 0x17:
      uint64_t v25 = *(void *)(a2 + 32);
      if (v25 == 2) {
        sub_19E306958();
      }
      if (!v25) {
        sub_19E3068D8();
      }
      return result;
    case 0x18:
      uint64_t v28 = *(void *)(a2 + 32);
      if (v28 == 2) {
        sub_19E306C58();
      }
      if (!v28) {
        sub_19E306BD8();
      }
      return result;
    case 0x1ALL:
      uint64_t v26 = *(void *)(a2 + 32);
      if (v26 == 2) {
        sub_19E306A58();
      }
      if (!v26) {
        sub_19E3069D8();
      }
      return result;
    case 0x1BLL:
      uint64_t v27 = *(void *)(a2 + 32);
      if (v27 == 2) {
        sub_19E3066D8();
      }
      if (!v27) {
        sub_19E3065D8();
      }
      return result;
    default:
      __p[0] = a3;
      long long v29 = sub_19E26CE00((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19E351150, (long long **)__p);
      long long v30 = v29[7];
      v29[7] = 0;
      if (v30) {
        (*(void (**)(uint64_t *))(*v30 + 8))(v30);
      }
      break;
  }
  __p[0] = a3;
  if (sub_19E26CE00((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19E351150, (long long **)__p)[7])
  {
    __p[0] = a3;
    char v12 = sub_19E26CE00((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19E351150, (long long **)__p);
    (*(void (**)(uint64_t *, uint64_t))(*v12[7] + 136))(v12[7], v6);
    __p[0] = a3;
    size_t v13 = sub_19E26CE00((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19E351150, (long long **)__p)[7];
    int v14 = operator new(0x40uLL);
    __p[1] = v14 + 4;
    long long v32 = v14 + 4;
    long long v15 = *(_OWORD *)(a2 + 400);
    _OWORD *v14 = *(_OWORD *)(a2 + 384);
    v14[1] = v15;
    long long v16 = *(_OWORD *)(a2 + 432);
    v14[2] = *(_OWORD *)(a2 + 416);
    v14[3] = v16;
    __p[0] = v14;
    (*(void (**)(uint64_t *, void **))(*v13 + 144))(v13, __p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  unint64_t v17 = *(void *)(a1 + 128);
  if (v17 >= *(void *)(a1 + 136))
  {
    uint64_t v19 = sub_19E13D6AC((char **)(a1 + 120), (uint64_t)a3);
  }
  else
  {
    if (*((char *)a3 + 23) < 0)
    {
      sub_19E13C2D0(*(unsigned char **)(a1 + 128), *a3, (unint64_t)a3[1]);
    }
    else
    {
      long long v18 = *(_OWORD *)a3;
      *(void *)(v17 + 16) = a3[2];
      *(_OWORD *)unint64_t v17 = v18;
    }
    uint64_t v19 = (char *)(v17 + 24);
    *(void *)(a1 + 128) = v17 + 24;
  }
  *(void *)(a1 + 128) = v19;
  return sub_19E140890((uint64_t **)(a1 + 224), (const void **)a3, (uint64_t)a3);
}

void sub_19E3062BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a10)
  {
    sub_19E33000C();
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E3065D8()
{
}

void sub_19E3066A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E3066B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  operator delete(v14);
  _Unwind_Resume(a1);
}

void sub_19E3066D8()
{
}

void sub_19E3067A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E3067B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  operator delete(v14);
  _Unwind_Resume(a1);
}

void sub_19E3067D8()
{
}

void sub_19E306844(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E306858()
{
}

void sub_19E3068C4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E3068D8()
{
}

void sub_19E306944(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E306958()
{
}

void sub_19E3069C4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E3069D8()
{
}

void sub_19E306A44(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E306A58()
{
}

void sub_19E306AC4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E306AD8()
{
}

void sub_19E306B44(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E306B58()
{
}

void sub_19E306BC4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E306BD8()
{
}

void sub_19E306C44(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E306C58()
{
}

void sub_19E306CC4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19E306CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(a1 + 248) = a5;
  sub_19E304C24(a1, a3, (uint64_t)__p);
  uint64_t v8 = sub_19E254CCC(a1 + 144, (uint64_t)__p);
  if (v8)
  {
    uint64_t v9 = (std::__shared_weak_count *)operator new(0x30uLL);
    v9->__shared_owners_ = 0;
    v9->__shared_weak_owners_ = 0;
    v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF0ABE88;
    uint64_t v35 = sub_19E26D02C((uint64_t)&v9[1], a2);
    long long v36 = v9;
    v29[0] = __p;
    BOOL v10 = sub_19E30D0E0((uint64_t **)(a1 + 144), (const void **)__p, (uint64_t)&unk_19E351150, (long long **)v29);
    uint64_t v11 = v10[7];
    uint64_t v12 = v10[8];
    if (v11 == v12) {
      goto LABEL_40;
    }
    size_t v13 = (uint64_t **)(a1 + 96);
    int v14 = (uint64_t **)(a1 + 224);
    do
    {
      v29[0] = (void *)(v11 + 24);
      long long v15 = sub_19E26CE00(v13, (const void **)(v11 + 24), (uint64_t)&unk_19E351150, (long long **)v29)[7];
      uint64_t v33 = v35;
      uint64_t v34 = v36;
      if (v36) {
        atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(uint64_t *, uint64_t *, void))(*v15 + 264))(v15, &v33, *(unsigned int *)(v11 + 52));
      long long v16 = v34;
      if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
      int v39 = (long long *)(v11 + 24);
      unint64_t v17 = sub_19E26CE00(v13, (const void **)(v11 + 24), (uint64_t)&unk_19E351150, &v39);
      (*(void (**)(void **__return_ptr))(*v17[7] + 160))(v29);
      if (v29[0] != *(void **)a4
        || v29[1] != *(void **)(a4 + 8)
        || v30 != *(void *)(a4 + 16)
        || v31 != *(void *)(a4 + 24)
        || v32 != *(void *)(a4 + 32))
      {
        v29[0] = (void *)(v11 + 24);
        uint64_t v22 = sub_19E26CE00(v13, (const void **)(v11 + 24), (uint64_t)&unk_19E351150, (long long **)v29);
        if ((*(unsigned int (**)(uint64_t *, uint64_t, void))(*v22[7] + 304))(v22[7], a4, *(unsigned int *)(v11 + 52)))
        {
          sub_19E140890(v14, (const void **)(v11 + 24), v11 + 24);
        }
      }
      v29[0] = (void *)(v11 + 24);
      uint64_t v23 = sub_19E26CE00(v13, (const void **)(v11 + 24), (uint64_t)&unk_19E351150, (long long **)v29)[7];
      long long v24 = *(_OWORD *)(a4 + 16);
      v27[0] = *(_OWORD *)a4;
      v27[1] = v24;
      uint64_t v28 = *(void *)(a4 + 32);
      (*(void (**)(uint64_t *, _OWORD *, void, void))(*v23 + 176))(v23, v27, *(unsigned int *)(v11 + 52), 0);
      v11 += 56;
    }
    while (v11 != v12);
    uint64_t v9 = v36;
    if (v36)
    {
LABEL_40:
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    uint64_t v8 = v8;
    if (v38 < 0) {
      goto LABEL_33;
    }
    return v8;
  }
  sub_19E307138((uint64_t)__p, " has not been connected to any node in the network.");
  uint64_t v25 = sub_19E26EDD8();
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    if ((SHIBYTE(v30) & 0x80000000) == 0) {
      goto LABEL_32;
    }
LABEL_36:
    operator delete(v29[0]);
    if ((v38 & 0x80000000) == 0) {
      return v8;
    }
    goto LABEL_33;
  }
  sub_19E32F738();
  if (SHIBYTE(v30) < 0) {
    goto LABEL_36;
  }
LABEL_32:
  if (v38 < 0) {
LABEL_33:
  }
    operator delete(__p[0]);
  return v8;
}

void sub_19E307098(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a21 < 0)
  {
    operator delete(__p);
    if ((a33 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a33 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a28);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E307138(uint64_t a1, const char *a2)
{
  sub_19E13D8EC((uint64_t)v9);
  int v4 = *(char *)(a1 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(void *)a1;
  }
  if (v4 >= 0) {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  sub_19E13DB94(v9, v5, v6);
  size_t v7 = strlen(a2);
  sub_19E13DB94(v9, (uint64_t)a2, v7);
  std::stringbuf::str();
  v9[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v9 + *(void *)(v9[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v9[1] = MEMORY[0x1E4FBA470] + 16;
  if (v10 < 0) {
    operator delete((void *)v9[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x19F3BBB40](&v11);
}

void sub_19E30729C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E13DA90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19E3072B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E13DA90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_19E3072C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v16 = a5;
  int v17 = a3;
  if (sub_19E254CCC(a1 + 8, a2))
  {
    sub_19E30745C(a1, (long long *)a2, a4, a5);
  }
  else if (sub_19E254CCC(a1 + 32, a4))
  {
    sub_19E3075B4(a1, (long long *)a2, a3, (long long *)a4);
  }
  else
  {
    *(void *)&long long __dst = a2;
    char v10 = sub_19E30D0E0((uint64_t **)(a1 + 144), (const void **)a2, (uint64_t)&unk_19E351150, (long long **)&__dst);
    uint64_t v11 = v10;
    unint64_t v12 = v10[8];
    if (v12 >= v10[9])
    {
      size_t v13 = sub_19E30D688((void **)v10 + 7, (long long *)a2, (long long *)a4, &v17, &v16);
    }
    else
    {
      if (*(char *)(a2 + 23) < 0)
      {
        sub_19E13C2D0(&__dst, *(void **)a2, *(void *)(a2 + 8));
      }
      else
      {
        long long __dst = *(_OWORD *)a2;
        uint64_t v21 = *(void *)(a2 + 16);
      }
      if (*(char *)(a4 + 23) < 0)
      {
        sub_19E13C2D0(&v18, *(void **)a4, *(void *)(a4 + 8));
      }
      else
      {
        long long v18 = *(_OWORD *)a4;
        uint64_t v19 = *(void *)(a4 + 16);
      }
      long long v14 = __dst;
      *(void *)(v12 + 16) = v21;
      *(_OWORD *)unint64_t v12 = v14;
      *(_OWORD *)(v12 + 24) = v18;
      *(void *)(v12 + 40) = v19;
      *(_DWORD *)(v12 + 48) = a3;
      *(_DWORD *)(v12 + 52) = a5;
      size_t v13 = (char *)(v12 + 56);
      v11[8] = v12 + 56;
    }
    v11[8] = (uint64_t)v13;
  }
  return 1;
}

void sub_19E30742C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
  {
    operator delete(__p);
    *(void *)(v20 + 64) = v21;
    _Unwind_Resume(exception_object);
  }
  *(void *)(v20 + 64) = v21;
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E30745C(uint64_t a1, long long *a2, uint64_t a3, int a4)
{
  int v15 = a4;
  *(void *)&long long __dst = a2;
  size_t v7 = sub_19E30D0E0((uint64_t **)(a1 + 144), (const void **)a2, (uint64_t)&unk_19E351150, (long long **)&__dst);
  int v8 = sub_19E252E58("None");
  int v14 = v8;
  unint64_t v9 = v7[8];
  if (v9 >= v7[9])
  {
    uint64_t v11 = sub_19E30D9C0((void **)v7 + 7, a2, (long long *)a3, &v14, &v15);
  }
  else
  {
    int v10 = v8;
    if (*((char *)a2 + 23) < 0)
    {
      sub_19E13C2D0(&__dst, *(void **)a2, *((void *)a2 + 1));
    }
    else
    {
      long long __dst = *a2;
      uint64_t v19 = *((void *)a2 + 2);
    }
    if (*(char *)(a3 + 23) < 0)
    {
      sub_19E13C2D0(&v16, *(void **)a3, *(void *)(a3 + 8));
    }
    else
    {
      long long v16 = *(_OWORD *)a3;
      uint64_t v17 = *(void *)(a3 + 16);
    }
    long long v12 = __dst;
    *(void *)(v9 + 16) = v19;
    *(_OWORD *)unint64_t v9 = v12;
    *(_OWORD *)(v9 + 24) = v16;
    *(void *)(v9 + 40) = v17;
    *(_DWORD *)(v9 + 48) = v10;
    *(_DWORD *)(v9 + 52) = a4;
    uint64_t v11 = (char *)(v9 + 56);
    v7[8] = v9 + 56;
  }
  v7[8] = (uint64_t)v11;
  return 1;
}

void sub_19E307584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
  {
    operator delete(__p);
    *(void *)(v20 + 64) = v21;
    _Unwind_Resume(exception_object);
  }
  *(void *)(v20 + 64) = v21;
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E3075B4(uint64_t a1, long long *a2, int a3, long long *a4)
{
  int v41 = a3;
  uint64_t v8 = a1 + 104;
  uint64_t v9 = *(void *)(a1 + 104);
  if (!v9) {
    goto LABEL_40;
  }
  int v10 = *((char *)a2 + 23);
  size_t v11 = v10 >= 0 ? *((unsigned __int8 *)a2 + 23) : *((void *)a2 + 1);
  long long v12 = v10 >= 0 ? a2 : *(long long **)a2;
  uint64_t v13 = a1 + 104;
  do
  {
    int v14 = *(char *)(v9 + 55);
    if (v14 >= 0) {
      size_t v15 = *(unsigned __int8 *)(v9 + 55);
    }
    else {
      size_t v15 = *(void *)(v9 + 40);
    }
    if (v14 >= 0) {
      long long v16 = (const void *)(v9 + 32);
    }
    else {
      long long v16 = *(const void **)(v9 + 32);
    }
    if (v11 >= v15) {
      size_t v17 = v15;
    }
    else {
      size_t v17 = v11;
    }
    int v18 = memcmp(v16, v12, v17);
    BOOL v19 = v15 < v11;
    if (v18) {
      BOOL v19 = v18 < 0;
    }
    BOOL v20 = !v19;
    if (v19) {
      uint64_t v21 = (uint64_t *)(v9 + 8);
    }
    else {
      uint64_t v21 = (uint64_t *)v9;
    }
    if (v20) {
      uint64_t v13 = v9;
    }
    uint64_t v9 = *v21;
  }
  while (*v21);
  if (v13 == v8) {
    goto LABEL_40;
  }
  int v22 = *(char *)(v13 + 55);
  if (v22 >= 0) {
    size_t v23 = *(unsigned __int8 *)(v13 + 55);
  }
  else {
    size_t v23 = *(void *)(v13 + 40);
  }
  if (v22 >= 0) {
    long long v24 = (const void *)(v13 + 32);
  }
  else {
    long long v24 = *(const void **)(v13 + 32);
  }
  if (v23 >= v11) {
    size_t v25 = v11;
  }
  else {
    size_t v25 = v23;
  }
  int v26 = memcmp(v12, v24, v25);
  BOOL v27 = v11 < v23;
  if (v26) {
    BOOL v27 = v26 < 0;
  }
  if (v27) {
LABEL_40:
  }
    uint64_t v13 = v8;
  (*(void (**)(long long *__return_ptr))(**(void **)(v13 + 56) + 168))(&__dst);
  *(void *)&long long v42 = a4;
  uint64_t v28 = sub_19E2538E8((uint64_t **)(a1 + 168), (const void **)a4, (uint64_t)&unk_19E351150, (long long **)&v42);
  long long v29 = v39;
  *(_OWORD *)(v28 + 7) = __dst;
  *(_OWORD *)(v28 + 9) = v29;
  v28[11] = v40;
  *(void *)&long long __dst = a2;
  uint64_t v30 = sub_19E30D0E0((uint64_t **)(a1 + 144), (const void **)a2, (uint64_t)&unk_19E351150, (long long **)&__dst);
  int v31 = sub_19E252E58("None");
  int v37 = v31;
  unint64_t v32 = v30[8];
  if (v32 >= v30[9])
  {
    uint64_t v34 = sub_19E30DC74((void **)v30 + 7, a2, a4, &v41, &v37);
  }
  else
  {
    int v33 = v31;
    if (*((char *)a2 + 23) < 0)
    {
      sub_19E13C2D0(&__dst, *(void **)a2, *((void *)a2 + 1));
    }
    else
    {
      long long __dst = *a2;
      *(void *)&long long v39 = *((void *)a2 + 2);
    }
    if (*((char *)a4 + 23) < 0)
    {
      sub_19E13C2D0(&v42, *(void **)a4, *((void *)a4 + 1));
    }
    else
    {
      long long v42 = *a4;
      uint64_t v43 = *((void *)a4 + 2);
    }
    long long v35 = __dst;
    *(void *)(v32 + 16) = v39;
    *(_OWORD *)unint64_t v32 = v35;
    *(_OWORD *)(v32 + 24) = v42;
    *(void *)(v32 + 40) = v43;
    *(_DWORD *)(v32 + 48) = a3;
    *(_DWORD *)(v32 + 52) = v33;
    uint64_t v34 = (char *)(v32 + 56);
    v30[8] = v32 + 56;
  }
  v30[8] = (uint64_t)v34;
  return 1;
}

void sub_19E307834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    *(void *)(v16 + 64) = v17;
    _Unwind_Resume(exception_object);
  }
  *(void *)(v16 + 64) = v17;
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E307864(uint64_t a1)
{
  uint64_t v1 = *(long long **)(a1 + 120);
  v266 = *(long long **)(a1 + 128);
  if (v1 != v266)
  {
    uint64_t v3 = (uint64_t **)(a1 + 96);
    v265 = (uint64_t **)(a1 + 144);
    v277 = (uint64_t **)(a1 + 104);
    v271 = (char **)(a1 + 176);
    v272 = (char **)(a1 + 232);
    v273 = v3;
    uint64_t v275 = a1;
    while (1)
    {
      v267 = v1;
      if (*((char *)v1 + 23) < 0)
      {
        sub_19E13C2D0(&__dst, *(void **)v1, *((void *)v1 + 1));
        uint64_t v3 = v273;
      }
      else
      {
        long long v4 = *v1;
        uint64_t v290 = *((void *)v1 + 2);
        long long __dst = v4;
      }
      *(void *)&long long v284 = &__dst;
      uint64_t v5 = sub_19E26CE00(v3, (const void **)&__dst, (uint64_t)&unk_19E351150, (long long **)&v284);
      *(void *)&long long v284 = &__dst;
      v270 = sub_19E30D0E0(v265, (const void **)&__dst, (uint64_t)&unk_19E351150, (long long **)&v284);
      (*(void (**)(unsigned int **__return_ptr))(*v5[7] + 24))(&v287);
      uint64_t v6 = v287;
      v269 = v288;
      if (v287 != v288) {
        break;
      }
LABEL_454:
      if (v6)
      {
        v288 = v6;
        operator delete(v6);
      }
      if (SHIBYTE(v290) < 0) {
        operator delete((void *)__dst);
      }
      uint64_t v1 = (long long *)((char *)v267 + 24);
      uint64_t v3 = v273;
      if ((long long *)((char *)v267 + 24) == v266) {
        return 1;
      }
    }
    v268 = v5;
LABEL_10:
    (*(void (**)(uint64_t *, void))(*v5[7] + 192))(v5[7], *v6);
    (*(void (**)(long long *__return_ptr))(*v5[7] + 168))(&v284);
    v276 = v6;
    uint64_t v8 = v270[7];
    uint64_t v7 = v270[8];
    for (i = v7; ; uint64_t v7 = i)
    {
      if (v8 == v7)
      {
        uint64_t v6 = v276 + 1;
        uint64_t v5 = v268;
        if (v276 + 1 == v269)
        {
          uint64_t v6 = v287;
          goto LABEL_454;
        }
        goto LABEL_10;
      }
      uint64_t v10 = *(unsigned int *)(v8 + 48);
      if (v10 == *v276)
      {
        if (!*(_DWORD *)(v8 + 52))
        {
          unint64_t v32 = v277;
          int v33 = *v277;
          uint64_t v34 = v277;
          if (*v277)
          {
            int v35 = *(char *)(v8 + 23);
            if (v35 >= 0) {
              size_t v36 = *(unsigned __int8 *)(v8 + 23);
            }
            else {
              size_t v36 = *(void *)(v8 + 8);
            }
            if (v35 >= 0) {
              int v37 = (const void *)v8;
            }
            else {
              int v37 = *(const void **)v8;
            }
            while (1)
            {
              while (1)
              {
                unint64_t v32 = (uint64_t **)v33;
                long long v40 = (const void *)v33[4];
                char v38 = v33 + 4;
                long long v39 = v40;
                int v41 = *((char *)v38 + 23);
                if (v41 >= 0) {
                  size_t v42 = *((unsigned __int8 *)v38 + 23);
                }
                else {
                  size_t v42 = v38[1];
                }
                if (v41 >= 0) {
                  uint64_t v43 = v38;
                }
                else {
                  uint64_t v43 = v39;
                }
                if (v42 >= v36) {
                  size_t v44 = v36;
                }
                else {
                  size_t v44 = v42;
                }
                int v45 = memcmp(v37, v43, v44);
                BOOL v46 = v36 < v42;
                if (v45) {
                  BOOL v46 = v45 < 0;
                }
                if (!v46) {
                  break;
                }
                int v33 = *v32;
                uint64_t v34 = v32;
                if (!*v32) {
                  goto LABEL_72;
                }
              }
              int v47 = memcmp(v43, v37, v44);
              BOOL v48 = v42 < v36;
              if (v47) {
                BOOL v48 = v47 < 0;
              }
              if (!v48) {
                break;
              }
              int v33 = v32[1];
              if (!v33)
              {
                uint64_t v34 = v32 + 1;
                goto LABEL_72;
              }
            }
            uint64_t v50 = v32;
            uint64_t v49 = v275;
          }
          else
          {
LABEL_72:
            uint64_t v49 = v275;
            uint64_t v50 = operator new(0x40uLL);
            unint64_t v51 = v50 + 4;
            if (*(char *)(v8 + 23) < 0)
            {
              sub_19E13C2D0(v51, *(void **)v8, *(void *)(v8 + 8));
            }
            else
            {
              long long v52 = *(_OWORD *)v8;
              v50[6] = *(void *)(v8 + 16);
              *(_OWORD *)unint64_t v51 = v52;
            }
            v50[7] = 0;
            *uint64_t v50 = 0;
            v50[1] = 0;
            v50[2] = v32;
            *uint64_t v34 = v50;
            uint64_t v66 = (uint64_t *)**v273;
            int v67 = v50;
            if (v66)
            {
              *v273 = v66;
              int v67 = *v34;
            }
            int v68 = *v277;
            BOOL v80 = v67 == *v277;
            *((unsigned char *)v67 + 24) = v80;
            if (!v80)
            {
              do
              {
                uint64_t v69 = v67[2];
                if (*(unsigned char *)(v69 + 24)) {
                  break;
                }
                int v70 = *(uint64_t **)(v69 + 16);
                uint64_t v71 = *v70;
                if (*v70 == v69)
                {
                  uint64_t v74 = v70[1];
                  if (!v74 || (v75 = *(unsigned __int8 *)(v74 + 24), uint64_t v72 = (unsigned char *)(v74 + 24), v75))
                  {
                    if (*(uint64_t **)v69 == v67)
                    {
                      *(unsigned char *)(v69 + 24) = 1;
                      *((unsigned char *)v70 + 24) = 0;
                      uint64_t v78 = *(void *)(v69 + 8);
                      uint64_t *v70 = v78;
                      if (v78) {
                        goto LABEL_113;
                      }
                    }
                    else
                    {
                      uint64_t v76 = *(uint64_t **)(v69 + 8);
                      uint64_t v77 = *v76;
                      *(void *)(v69 + 8) = *v76;
                      if (v77)
                      {
                        *(void *)(v77 + 16) = v69;
                        int v70 = *(uint64_t **)(v69 + 16);
                      }
                      v76[2] = (uint64_t)v70;
                      *(void *)(*(void *)(v69 + 16) + 8 * (**(void **)(v69 + 16) != v69)) = v76;
                      uint64_t *v76 = v69;
                      *(void *)(v69 + 16) = v76;
                      int v70 = (uint64_t *)v76[2];
                      uint64_t v69 = *v70;
                      *((unsigned char *)v76 + 24) = 1;
                      *((unsigned char *)v70 + 24) = 0;
                      uint64_t v78 = *(void *)(v69 + 8);
                      uint64_t *v70 = v78;
                      if (v78) {
LABEL_113:
                      }
                        *(void *)(v78 + 16) = v70;
                    }
                    *(void *)(v69 + 16) = v70[2];
                    *(void *)(v70[2] + 8 * (*(void *)v70[2] != (void)v70)) = v69;
                    *(void *)(v69 + 8) = v70;
LABEL_241:
                    void v70[2] = v69;
                    break;
                  }
                }
                else if (!v71 || (v73 = *(unsigned __int8 *)(v71 + 24), uint64_t v72 = (unsigned char *)(v71 + 24), v73))
                {
                  if (*(uint64_t **)v69 == v67)
                  {
                    uint64_t v260 = v67[1];
                    *(void *)uint64_t v69 = v260;
                    if (v260)
                    {
                      *(void *)(v260 + 16) = v69;
                      int v70 = *(uint64_t **)(v69 + 16);
                    }
                    v67[2] = (uint64_t)v70;
                    *(void *)(*(void *)(v69 + 16) + 8 * (**(void **)(v69 + 16) != v69)) = v67;
                    v67[1] = v69;
                    *(void *)(v69 + 16) = v67;
                    int v70 = (uint64_t *)v67[2];
                    *((unsigned char *)v67 + 24) = 1;
                    *((unsigned char *)v70 + 24) = 0;
                    uint64_t v69 = v70[1];
                    float32x4_t v151 = *(uint64_t **)v69;
                    v70[1] = *(void *)v69;
                    if (v151) {
LABEL_239:
                    }
                      v151[2] = (uint64_t)v70;
                  }
                  else
                  {
                    *(unsigned char *)(v69 + 24) = 1;
                    *((unsigned char *)v70 + 24) = 0;
                    uint64_t v69 = v70[1];
                    float32x4_t v151 = *(uint64_t **)v69;
                    v70[1] = *(void *)v69;
                    if (v151) {
                      goto LABEL_239;
                    }
                  }
                  *(void *)(v69 + 16) = v70[2];
                  *(void *)(v70[2] + 8 * (*(void *)v70[2] != (void)v70)) = v69;
                  *(void *)uint64_t v69 = v70;
                  goto LABEL_241;
                }
                *(unsigned char *)(v69 + 24) = 1;
                int v67 = v70;
                *((unsigned char *)v70 + 24) = v70 == v68;
                *uint64_t v72 = 1;
              }
              while (v70 != v68);
            }
            ++*(void *)(v275 + 112);
            uint64_t v10 = *(unsigned int *)(v8 + 48);
          }
          if (!(*(unsigned int (**)(void, long long *, uint64_t))(*(void *)v50[7] + 304))(v50[7], &v284, v10))goto LABEL_363; {
          sub_19E3091DC("recompiling ", v8, "for ");
          }
          float32x4_t v152 = v272;
          float32x4_t v153 = *v272;
          float32x4_t v154 = v272;
          if (*v272)
          {
            int v155 = *(char *)(v8 + 23);
            size_t v156 = v155 >= 0 ? *(unsigned __int8 *)(v8 + 23) : *(void *)(v8 + 8);
            float32x4_t v157 = v155 >= 0 ? (const void *)v8 : *(const void **)v8;
            while (1)
            {
              while (1)
              {
                float32x4_t v152 = (char **)v153;
                float v160 = (const void *)*((void *)v153 + 4);
                float32x4_t v158 = v153 + 32;
                float32x4_t v159 = v160;
                int v161 = *((char *)v158 + 23);
                if (v161 >= 0) {
                  size_t v162 = *((unsigned __int8 *)v158 + 23);
                }
                else {
                  size_t v162 = v158[1];
                }
                if (v161 >= 0) {
                  float32x4_t v163 = v158;
                }
                else {
                  float32x4_t v163 = v159;
                }
                if (v162 >= v156) {
                  size_t v164 = v156;
                }
                else {
                  size_t v164 = v162;
                }
                int v165 = memcmp(v157, v163, v164);
                BOOL v166 = v156 < v162;
                if (v165) {
                  BOOL v166 = v165 < 0;
                }
                if (!v166) {
                  break;
                }
                float32x4_t v153 = *v152;
                float32x4_t v154 = v152;
                if (!*v152) {
                  goto LABEL_269;
                }
              }
              int v167 = memcmp(v163, v157, v164);
              BOOL v168 = v162 < v156;
              if (v167) {
                BOOL v168 = v167 < 0;
              }
              if (!v168) {
                break;
              }
              float32x4_t v153 = v152[1];
              if (!v153)
              {
                float32x4_t v154 = v152 + 1;
                goto LABEL_269;
              }
            }
          }
          else
          {
LABEL_269:
            v169 = (char *)operator new(0x38uLL);
            v170 = v169 + 32;
            if (*(char *)(v8 + 23) < 0)
            {
              sub_19E13C2D0(v170, *(void **)v8, *(void *)(v8 + 8));
            }
            else
            {
              long long v171 = *(_OWORD *)v8;
              *((void *)v169 + 6) = *(void *)(v8 + 16);
              *(_OWORD *)v170 = v171;
            }
            *(void *)v169 = 0;
            *((void *)v169 + 1) = 0;
            *((void *)v169 + 2) = v152;
            *float32x4_t v154 = v169;
            uint64_t v172 = **(void **)(v49 + 224);
            if (v172)
            {
              *(void *)(v49 + 224) = v172;
              v169 = *v154;
            }
            v173 = *v272;
            BOOL v80 = v169 == *v272;
            v169[24] = v80;
            if (!v80)
            {
              do
              {
                uint64_t v174 = *((void *)v169 + 2);
                if (*(unsigned char *)(v174 + 24)) {
                  break;
                }
                v175 = *(char **)(v174 + 16);
                uint64_t v176 = *(void *)v175;
                if (*(void *)v175 == v174)
                {
                  uint64_t v179 = *((void *)v175 + 1);
                  if (!v179 || (int v180 = *(unsigned __int8 *)(v179 + 24), v177 = (unsigned char *)(v179 + 24), v180))
                  {
                    if (*(char **)v174 == v169)
                    {
                      *(unsigned char *)(v174 + 24) = 1;
                      v175[24] = 0;
                      uint64_t v183 = *(void *)(v174 + 8);
                      *(void *)v175 = v183;
                      if (v183) {
                        goto LABEL_289;
                      }
                    }
                    else
                    {
                      v181 = *(uint64_t **)(v174 + 8);
                      uint64_t v182 = *v181;
                      *(void *)(v174 + 8) = *v181;
                      if (v182)
                      {
                        *(void *)(v182 + 16) = v174;
                        v175 = *(char **)(v174 + 16);
                      }
                      v181[2] = (uint64_t)v175;
                      *(void *)(*(void *)(v174 + 16) + 8 * (**(void **)(v174 + 16) != v174)) = v181;
                      uint64_t *v181 = v174;
                      *(void *)(v174 + 16) = v181;
                      v175 = (char *)v181[2];
                      uint64_t v174 = *(void *)v175;
                      *((unsigned char *)v181 + 24) = 1;
                      v175[24] = 0;
                      uint64_t v183 = *(void *)(v174 + 8);
                      *(void *)v175 = v183;
                      if (v183) {
LABEL_289:
                      }
                        *(void *)(v183 + 16) = v175;
                    }
                    *(void *)(v174 + 16) = *((void *)v175 + 2);
                    *(void *)(*((void *)v175 + 2) + 8 * (**((void **)v175 + 2) != (void)v175)) = v174;
                    *(void *)(v174 + 8) = v175;
LABEL_360:
                    *((void *)v175 + 2) = v174;
                    break;
                  }
                }
                else if (!v176 || (int v178 = *(unsigned __int8 *)(v176 + 24), v177 = (unsigned char *)(v176 + 24), v178))
                {
                  if (*(char **)v174 == v169)
                  {
                    uint64_t v263 = *((void *)v169 + 1);
                    *(void *)uint64_t v174 = v263;
                    if (v263)
                    {
                      *(void *)(v263 + 16) = v174;
                      v175 = *(char **)(v174 + 16);
                    }
                    *((void *)v169 + 2) = v175;
                    *(void *)(*(void *)(v174 + 16) + 8 * (**(void **)(v174 + 16) != v174)) = v169;
                    *((void *)v169 + 1) = v174;
                    *(void *)(v174 + 16) = v169;
                    v175 = (char *)*((void *)v169 + 2);
                    v169[24] = 1;
                    v175[24] = 0;
                    uint64_t v174 = *((void *)v175 + 1);
                    v222 = *(char **)v174;
                    *((void *)v175 + 1) = *(void *)v174;
                    if (v222) {
LABEL_358:
                    }
                      *((void *)v222 + 2) = v175;
                  }
                  else
                  {
                    *(unsigned char *)(v174 + 24) = 1;
                    v175[24] = 0;
                    uint64_t v174 = *((void *)v175 + 1);
                    v222 = *(char **)v174;
                    *((void *)v175 + 1) = *(void *)v174;
                    if (v222) {
                      goto LABEL_358;
                    }
                  }
                  *(void *)(v174 + 16) = *((void *)v175 + 2);
                  *(void *)(*((void *)v175 + 2) + 8 * (**((void **)v175 + 2) != (void)v175)) = v174;
                  *(void *)uint64_t v174 = v175;
                  goto LABEL_360;
                }
                *(unsigned char *)(v174 + 24) = 1;
                v169 = v175;
                v175[24] = v175 == v173;
                unsigned char *v177 = 1;
              }
              while (v175 != v173);
            }
            ++*(void *)(v49 + 240);
          }
          if (SHIBYTE(v281) < 0)
          {
            operator delete(__p[0]);
            v223 = (void *)(v8 + 24);
            v224 = v271;
            v225 = *v271;
            v226 = v271;
            if (*v271) {
              goto LABEL_364;
            }
          }
          else
          {
LABEL_363:
            v223 = (void *)(v8 + 24);
            v224 = v271;
            v225 = *v271;
            v226 = v271;
            if (*v271)
            {
LABEL_364:
              int v227 = *(char *)(v8 + 47);
              if (v227 >= 0) {
                size_t v228 = *(unsigned __int8 *)(v8 + 47);
              }
              else {
                size_t v228 = *(void *)(v8 + 32);
              }
              if (v227 >= 0) {
                v229 = v223;
              }
              else {
                v229 = *(const void **)(v8 + 24);
              }
              while (1)
              {
                while (1)
                {
                  v224 = (char **)v225;
                  v232 = (const void *)*((void *)v225 + 4);
                  v230 = v225 + 32;
                  v231 = v232;
                  int v233 = *((char *)v230 + 23);
                  if (v233 >= 0) {
                    size_t v234 = *((unsigned __int8 *)v230 + 23);
                  }
                  else {
                    size_t v234 = v230[1];
                  }
                  if (v233 >= 0) {
                    v235 = v230;
                  }
                  else {
                    v235 = v231;
                  }
                  if (v234 >= v228) {
                    size_t v236 = v228;
                  }
                  else {
                    size_t v236 = v234;
                  }
                  int v237 = memcmp(v229, v235, v236);
                  BOOL v238 = v228 < v234;
                  if (v237) {
                    BOOL v238 = v237 < 0;
                  }
                  if (!v238) {
                    break;
                  }
                  v225 = *v224;
                  v226 = v224;
                  if (!*v224) {
                    goto LABEL_390;
                  }
                }
                int v239 = memcmp(v235, v229, v236);
                BOOL v240 = v234 < v228;
                if (v239) {
                  BOOL v240 = v239 < 0;
                }
                if (!v240) {
                  break;
                }
                v225 = v224[1];
                if (!v225)
                {
                  v226 = v224 + 1;
                  goto LABEL_390;
                }
              }
              v241 = (char *)v224;
              goto LABEL_418;
            }
          }
LABEL_390:
          v241 = (char *)operator new(0x60uLL);
          v242 = v241 + 32;
          if (*(char *)(v8 + 47) < 0)
          {
            sub_19E13C2D0(v242, *(void **)(v8 + 24), *(void *)(v8 + 32));
          }
          else
          {
            long long v243 = *(_OWORD *)v223;
            *((void *)v241 + 6) = v223[2];
            *(_OWORD *)v242 = v243;
          }
          *((void *)v241 + 11) = 0;
          *(_OWORD *)(v241 + 72) = 0u;
          *(_OWORD *)(v241 + 56) = 0u;
          *(void *)v241 = 0;
          *((void *)v241 + 1) = 0;
          *((void *)v241 + 2) = v224;
          *v226 = v241;
          uint64_t v244 = **(void **)(v275 + 168);
          v245 = v241;
          if (v244)
          {
            *(void *)(v275 + 168) = v244;
            v245 = *v226;
          }
          v246 = *v271;
          BOOL v80 = v245 == *v271;
          v245[24] = v80;
          if (!v80)
          {
            do
            {
              uint64_t v247 = *((void *)v245 + 2);
              if (*(unsigned char *)(v247 + 24)) {
                break;
              }
              v248 = *(char **)(v247 + 16);
              uint64_t v249 = *(void *)v248;
              if (*(void *)v248 == v247)
              {
                uint64_t v252 = *((void *)v248 + 1);
                if (!v252 || (int v253 = *(unsigned __int8 *)(v252 + 24), v250 = (unsigned char *)(v252 + 24), v253))
                {
                  if (*(char **)v247 == v245)
                  {
                    *(unsigned char *)(v247 + 24) = 1;
                    v248[24] = 0;
                    uint64_t v256 = *(void *)(v247 + 8);
                    *(void *)v248 = v256;
                    if (v256) {
                      goto LABEL_410;
                    }
                  }
                  else
                  {
                    v254 = *(uint64_t **)(v247 + 8);
                    uint64_t v255 = *v254;
                    *(void *)(v247 + 8) = *v254;
                    if (v255)
                    {
                      *(void *)(v255 + 16) = v247;
                      v248 = *(char **)(v247 + 16);
                    }
                    v254[2] = (uint64_t)v248;
                    *(void *)(*(void *)(v247 + 16) + 8 * (**(void **)(v247 + 16) != v247)) = v254;
                    uint64_t *v254 = v247;
                    *(void *)(v247 + 16) = v254;
                    v248 = (char *)v254[2];
                    uint64_t v247 = *(void *)v248;
                    *((unsigned char *)v254 + 24) = 1;
                    v248[24] = 0;
                    uint64_t v256 = *(void *)(v247 + 8);
                    *(void *)v248 = v256;
                    if (v256) {
LABEL_410:
                    }
                      *(void *)(v256 + 16) = v248;
                  }
                  *(void *)(v247 + 16) = *((void *)v248 + 2);
                  *(void *)(*((void *)v248 + 2) + 8 * (**((void **)v248 + 2) != (void)v248)) = v247;
                  *(void *)(v247 + 8) = v248;
LABEL_416:
                  *((void *)v248 + 2) = v247;
                  break;
                }
              }
              else if (!v249 || (int v251 = *(unsigned __int8 *)(v249 + 24), v250 = (unsigned char *)(v249 + 24), v251))
              {
                if (*(char **)v247 == v245)
                {
                  uint64_t v261 = *((void *)v245 + 1);
                  *(void *)uint64_t v247 = v261;
                  if (v261)
                  {
                    *(void *)(v261 + 16) = v247;
                    v248 = *(char **)(v247 + 16);
                  }
                  *((void *)v245 + 2) = v248;
                  *(void *)(*(void *)(v247 + 16) + 8 * (**(void **)(v247 + 16) != v247)) = v245;
                  *((void *)v245 + 1) = v247;
                  *(void *)(v247 + 16) = v245;
                  v248 = (char *)*((void *)v245 + 2);
                  v245[24] = 1;
                  v248[24] = 0;
                  uint64_t v247 = *((void *)v248 + 1);
                  v257 = *(char **)v247;
                  *((void *)v248 + 1) = *(void *)v247;
                  if (v257) {
LABEL_414:
                  }
                    *((void *)v257 + 2) = v248;
                }
                else
                {
                  *(unsigned char *)(v247 + 24) = 1;
                  v248[24] = 0;
                  uint64_t v247 = *((void *)v248 + 1);
                  v257 = *(char **)v247;
                  *((void *)v248 + 1) = *(void *)v247;
                  if (v257) {
                    goto LABEL_414;
                  }
                }
                *(void *)(v247 + 16) = *((void *)v248 + 2);
                *(void *)(*((void *)v248 + 2) + 8 * (**((void **)v248 + 2) != (void)v248)) = v247;
                *(void *)uint64_t v247 = v248;
                goto LABEL_416;
              }
              *(unsigned char *)(v247 + 24) = 1;
              v245 = v248;
              v248[24] = v248 == v246;
              unsigned char *v250 = 1;
            }
            while (v248 != v246);
          }
          ++*(void *)(v275 + 184);
LABEL_418:
          long long v258 = v285;
          *(_OWORD *)(v241 + 56) = v284;
          *(_OWORD *)(v241 + 72) = v258;
          *((void *)v241 + 11) = v286;
          goto LABEL_16;
        }
        size_t v11 = (long long *)(v8 + 24);
        long long v12 = v277;
        uint64_t v13 = *v277;
        int v14 = v277;
        if (*v277)
        {
          int v15 = *(char *)(v8 + 47);
          if (v15 >= 0) {
            size_t v16 = *(unsigned __int8 *)(v8 + 47);
          }
          else {
            size_t v16 = *(void *)(v8 + 32);
          }
          if (v15 >= 0) {
            uint64_t v17 = (const void *)(v8 + 24);
          }
          else {
            uint64_t v17 = *(const void **)(v8 + 24);
          }
          while (1)
          {
            while (1)
            {
              long long v12 = (uint64_t **)v13;
              BOOL v20 = (const void *)v13[4];
              int v18 = v13 + 4;
              BOOL v19 = v20;
              int v21 = *((char *)v18 + 23);
              if (v21 >= 0) {
                size_t v22 = *((unsigned __int8 *)v18 + 23);
              }
              else {
                size_t v22 = v18[1];
              }
              if (v21 >= 0) {
                size_t v23 = v18;
              }
              else {
                size_t v23 = v19;
              }
              if (v22 >= v16) {
                size_t v24 = v16;
              }
              else {
                size_t v24 = v22;
              }
              int v25 = memcmp(v17, v23, v24);
              BOOL v26 = v16 < v22;
              if (v25) {
                BOOL v26 = v25 < 0;
              }
              if (!v26) {
                break;
              }
              uint64_t v13 = *v12;
              int v14 = v12;
              if (!*v12) {
                goto LABEL_45;
              }
            }
            int v27 = memcmp(v23, v17, v24);
            BOOL v28 = v22 < v16;
            if (v27) {
              BOOL v28 = v27 < 0;
            }
            if (!v28) {
              break;
            }
            uint64_t v13 = v12[1];
            if (!v13)
            {
              int v14 = v12 + 1;
              goto LABEL_45;
            }
          }
          long long v29 = v12;
        }
        else
        {
LABEL_45:
          long long v29 = operator new(0x40uLL);
          uint64_t v30 = v29 + 4;
          if (*(char *)(v8 + 47) < 0)
          {
            sub_19E13C2D0(v30, *(void **)(v8 + 24), *(void *)(v8 + 32));
          }
          else
          {
            long long v31 = *v11;
            v29[6] = *(void *)(v8 + 40);
            *(_OWORD *)uint64_t v30 = v31;
          }
          v29[7] = 0;
          *long long v29 = 0;
          v29[1] = 0;
          v29[2] = v12;
          void *v14 = v29;
          int v53 = (uint64_t *)**v273;
          long long v54 = v29;
          if (v53)
          {
            *v273 = v53;
            long long v54 = *v14;
          }
          uint64_t v55 = *v277;
          BOOL v80 = v54 == *v277;
          *((unsigned char *)v54 + 24) = v80;
          if (!v80)
          {
            do
            {
              uint64_t v56 = v54[2];
              if (*(unsigned char *)(v56 + 24)) {
                break;
              }
              uint64_t v57 = *(uint64_t **)(v56 + 16);
              uint64_t v58 = *v57;
              if (*v57 == v56)
              {
                uint64_t v61 = v57[1];
                if (!v61 || (v62 = *(unsigned __int8 *)(v61 + 24), uint64_t v59 = (unsigned char *)(v61 + 24), v62))
                {
                  if (*(uint64_t **)v56 == v54)
                  {
                    *(unsigned char *)(v56 + 24) = 1;
                    *((unsigned char *)v57 + 24) = 0;
                    uint64_t v65 = *(void *)(v56 + 8);
                    uint64_t *v57 = v65;
                    if (v65) {
                      goto LABEL_92;
                    }
                  }
                  else
                  {
                    uint64_t v63 = *(uint64_t **)(v56 + 8);
                    uint64_t v64 = *v63;
                    *(void *)(v56 + 8) = *v63;
                    if (v64)
                    {
                      *(void *)(v64 + 16) = v56;
                      uint64_t v57 = *(uint64_t **)(v56 + 16);
                    }
                    v63[2] = (uint64_t)v57;
                    *(void *)(*(void *)(v56 + 16) + 8 * (**(void **)(v56 + 16) != v56)) = v63;
                    *uint64_t v63 = v56;
                    *(void *)(v56 + 16) = v63;
                    uint64_t v57 = (uint64_t *)v63[2];
                    uint64_t v56 = *v57;
                    *((unsigned char *)v63 + 24) = 1;
                    *((unsigned char *)v57 + 24) = 0;
                    uint64_t v65 = *(void *)(v56 + 8);
                    uint64_t *v57 = v65;
                    if (v65) {
LABEL_92:
                    }
                      *(void *)(v65 + 16) = v57;
                  }
                  *(void *)(v56 + 16) = v57[2];
                  *(void *)(v57[2] + 8 * (*(void *)v57[2] != (void)v57)) = v56;
                  *(void *)(v56 + 8) = v57;
LABEL_119:
                  v57[2] = v56;
                  break;
                }
              }
              else if (!v58 || (v60 = *(unsigned __int8 *)(v58 + 24), uint64_t v59 = (unsigned char *)(v58 + 24), v60))
              {
                if (*(uint64_t **)v56 == v54)
                {
                  uint64_t v184 = v54[1];
                  *(void *)uint64_t v56 = v184;
                  if (v184)
                  {
                    *(void *)(v184 + 16) = v56;
                    uint64_t v57 = *(uint64_t **)(v56 + 16);
                  }
                  v54[2] = (uint64_t)v57;
                  *(void *)(*(void *)(v56 + 16) + 8 * (**(void **)(v56 + 16) != v56)) = v54;
                  v54[1] = v56;
                  *(void *)(v56 + 16) = v54;
                  uint64_t v57 = (uint64_t *)v54[2];
                  *((unsigned char *)v54 + 24) = 1;
                  *((unsigned char *)v57 + 24) = 0;
                  uint64_t v56 = v57[1];
                  uint64_t v79 = *(uint64_t **)v56;
                  v57[1] = *(void *)v56;
                  if (v79) {
LABEL_117:
                  }
                    v79[2] = (uint64_t)v57;
                }
                else
                {
                  *(unsigned char *)(v56 + 24) = 1;
                  *((unsigned char *)v57 + 24) = 0;
                  uint64_t v56 = v57[1];
                  uint64_t v79 = *(uint64_t **)v56;
                  v57[1] = *(void *)v56;
                  if (v79) {
                    goto LABEL_117;
                  }
                }
                *(void *)(v56 + 16) = v57[2];
                *(void *)(v57[2] + 8 * (*(void *)v57[2] != (void)v57)) = v56;
                *(void *)uint64_t v56 = v57;
                goto LABEL_119;
              }
              *(unsigned char *)(v56 + 24) = 1;
              long long v54 = v57;
              *((unsigned char *)v57 + 24) = v57 == v55;
              *uint64_t v59 = 1;
            }
            while (v57 != v55);
          }
          ++*(void *)(v275 + 112);
        }
        (*(void (**)(void **__return_ptr))(*(void *)v29[7] + 160))(__p);
        BOOL v80 = __p[0] == (void *)v284 && __p[1] == *((void **)&v284 + 1);
        if (!v80 || v281 != (void)v285 || v282 != *((void *)&v285 + 1) || v283 != v286)
        {
          uint64_t v84 = v277;
          uint64_t v85 = *v277;
          uint64_t v86 = v277;
          if (*v277)
          {
            int v87 = *(char *)(v8 + 47);
            if (v87 >= 0) {
              size_t v88 = *(unsigned __int8 *)(v8 + 47);
            }
            else {
              size_t v88 = *(void *)(v8 + 32);
            }
            if (v87 >= 0) {
              unint64_t v89 = (const void *)(v8 + 24);
            }
            else {
              unint64_t v89 = *(const void **)(v8 + 24);
            }
            while (1)
            {
              while (1)
              {
                uint64_t v84 = (uint64_t **)v85;
                unint64_t v92 = (const void *)v85[4];
                float32x4_t v90 = v85 + 4;
                float v91 = v92;
                int v93 = *((char *)v90 + 23);
                if (v93 >= 0) {
                  size_t v94 = *((unsigned __int8 *)v90 + 23);
                }
                else {
                  size_t v94 = v90[1];
                }
                if (v93 >= 0) {
                  uint64_t v95 = v90;
                }
                else {
                  uint64_t v95 = v91;
                }
                if (v94 >= v88) {
                  size_t v96 = v88;
                }
                else {
                  size_t v96 = v94;
                }
                int v97 = memcmp(v89, v95, v96);
                BOOL v98 = v88 < v94;
                if (v97) {
                  BOOL v98 = v97 < 0;
                }
                if (!v98) {
                  break;
                }
                uint64_t v85 = *v84;
                uint64_t v86 = v84;
                if (!*v84) {
                  goto LABEL_159;
                }
              }
              int v99 = memcmp(v95, v89, v96);
              BOOL v100 = v94 < v88;
              if (v99) {
                BOOL v100 = v99 < 0;
              }
              if (!v100) {
                break;
              }
              uint64_t v85 = v84[1];
              if (!v85)
              {
                uint64_t v86 = v84 + 1;
                goto LABEL_159;
              }
            }
            uint64_t v102 = v84;
            uint64_t v101 = v275;
          }
          else
          {
LABEL_159:
            uint64_t v101 = v275;
            uint64_t v102 = operator new(0x40uLL);
            float v103 = v102 + 4;
            if (*(char *)(v8 + 47) < 0)
            {
              sub_19E13C2D0(v103, *(void **)(v8 + 24), *(void *)(v8 + 32));
            }
            else
            {
              long long v104 = *v11;
              v102[6] = *(void *)(v8 + 40);
              *(_OWORD *)float v103 = v104;
            }
            v102[7] = 0;
            void *v102 = 0;
            v102[1] = 0;
            v102[2] = v84;
            *uint64_t v86 = v102;
            float v105 = (uint64_t *)**v273;
            uint64_t v106 = v102;
            if (v105)
            {
              *v273 = v105;
              uint64_t v106 = *v86;
            }
            uint64_t v107 = *v277;
            BOOL v80 = v106 == *v277;
            *((unsigned char *)v106 + 24) = v80;
            if (!v80)
            {
              do
              {
                uint64_t v108 = v106[2];
                if (*(unsigned char *)(v108 + 24)) {
                  break;
                }
                uint64_t v109 = *(uint64_t **)(v108 + 16);
                uint64_t v110 = *v109;
                if (*v109 == v108)
                {
                  uint64_t v113 = v109[1];
                  if (!v113 || (v114 = *(unsigned __int8 *)(v113 + 24), float32x4_t v111 = (unsigned char *)(v113 + 24), v114))
                  {
                    if (*(uint64_t **)v108 == v106)
                    {
                      *(unsigned char *)(v108 + 24) = 1;
                      *((unsigned char *)v109 + 24) = 0;
                      uint64_t v117 = *(void *)(v108 + 8);
                      *uint64_t v109 = v117;
                      if (v117) {
                        goto LABEL_179;
                      }
                    }
                    else
                    {
                      uint64_t v115 = *(uint64_t **)(v108 + 8);
                      uint64_t v116 = *v115;
                      *(void *)(v108 + 8) = *v115;
                      if (v116)
                      {
                        *(void *)(v116 + 16) = v108;
                        uint64_t v109 = *(uint64_t **)(v108 + 16);
                      }
                      v115[2] = (uint64_t)v109;
                      *(void *)(*(void *)(v108 + 16) + 8 * (**(void **)(v108 + 16) != v108)) = v115;
                      uint64_t *v115 = v108;
                      *(void *)(v108 + 16) = v115;
                      uint64_t v109 = (uint64_t *)v115[2];
                      uint64_t v108 = *v109;
                      *((unsigned char *)v115 + 24) = 1;
                      *((unsigned char *)v109 + 24) = 0;
                      uint64_t v117 = *(void *)(v108 + 8);
                      *uint64_t v109 = v117;
                      if (v117) {
LABEL_179:
                      }
                        *(void *)(v117 + 16) = v109;
                    }
                    *(void *)(v108 + 16) = v109[2];
                    *(void *)(v109[2] + 8 * (*(void *)v109[2] != (void)v109)) = v108;
                    *(void *)(v108 + 8) = v109;
LABEL_187:
                    v109[2] = v108;
                    break;
                  }
                }
                else if (!v110 || (int v112 = *(unsigned __int8 *)(v110 + 24), v111 = (unsigned char *)(v110 + 24), v112))
                {
                  if (*(uint64_t **)v108 == v106)
                  {
                    uint64_t v259 = v106[1];
                    *(void *)uint64_t v108 = v259;
                    if (v259)
                    {
                      *(void *)(v259 + 16) = v108;
                      uint64_t v109 = *(uint64_t **)(v108 + 16);
                    }
                    v106[2] = (uint64_t)v109;
                    *(void *)(*(void *)(v108 + 16) + 8 * (**(void **)(v108 + 16) != v108)) = v106;
                    v106[1] = v108;
                    *(void *)(v108 + 16) = v106;
                    uint64_t v109 = (uint64_t *)v106[2];
                    *((unsigned char *)v106 + 24) = 1;
                    *((unsigned char *)v109 + 24) = 0;
                    uint64_t v108 = v109[1];
                    v118 = *(uint64_t **)v108;
                    v109[1] = *(void *)v108;
                    if (v118) {
LABEL_185:
                    }
                      v118[2] = (uint64_t)v109;
                  }
                  else
                  {
                    *(unsigned char *)(v108 + 24) = 1;
                    *((unsigned char *)v109 + 24) = 0;
                    uint64_t v108 = v109[1];
                    v118 = *(uint64_t **)v108;
                    v109[1] = *(void *)v108;
                    if (v118) {
                      goto LABEL_185;
                    }
                  }
                  *(void *)(v108 + 16) = v109[2];
                  *(void *)(v109[2] + 8 * (*(void *)v109[2] != (void)v109)) = v108;
                  *(void *)uint64_t v108 = v109;
                  goto LABEL_187;
                }
                *(unsigned char *)(v108 + 24) = 1;
                uint64_t v106 = v109;
                *((unsigned char *)v109 + 24) = v109 == v107;
                unsigned char *v111 = 1;
              }
              while (v109 != v107);
            }
            ++*(void *)(v275 + 112);
          }
          if ((*(unsigned int (**)(void, long long *, void))(*(void *)v102[7] + 304))(v102[7], &v284, *(unsigned int *)(v8 + 52)))
          {
            uint64_t v119 = v272;
            uint64_t v120 = *v272;
            long long v121 = v272;
            if (*v272)
            {
              int v122 = *(char *)(v8 + 47);
              if (v122 >= 0) {
                size_t v123 = *(unsigned __int8 *)(v8 + 47);
              }
              else {
                size_t v123 = *(void *)(v8 + 32);
              }
              if (v122 >= 0) {
                uint64_t v124 = (const void *)(v8 + 24);
              }
              else {
                uint64_t v124 = *(const void **)(v8 + 24);
              }
              while (1)
              {
                while (1)
                {
                  uint64_t v119 = (char **)v120;
                  int16x4_t v127 = (const void *)*((void *)v120 + 4);
                  v125 = v120 + 32;
                  float32x4_t v126 = v127;
                  int v128 = *((char *)v125 + 23);
                  if (v128 >= 0) {
                    size_t v129 = *((unsigned __int8 *)v125 + 23);
                  }
                  else {
                    size_t v129 = v125[1];
                  }
                  if (v128 >= 0) {
                    uint64_t v130 = v125;
                  }
                  else {
                    uint64_t v130 = v126;
                  }
                  if (v129 >= v123) {
                    size_t v131 = v123;
                  }
                  else {
                    size_t v131 = v129;
                  }
                  int v132 = memcmp(v124, v130, v131);
                  BOOL v133 = v123 < v129;
                  if (v132) {
                    BOOL v133 = v132 < 0;
                  }
                  if (!v133) {
                    break;
                  }
                  uint64_t v120 = *v119;
                  long long v121 = v119;
                  if (!*v119) {
                    goto LABEL_215;
                  }
                }
                int v134 = memcmp(v130, v124, v131);
                BOOL v135 = v129 < v123;
                if (v134) {
                  BOOL v135 = v134 < 0;
                }
                if (!v135) {
                  break;
                }
                uint64_t v120 = v119[1];
                if (!v120)
                {
                  long long v121 = v119 + 1;
                  goto LABEL_215;
                }
              }
            }
            else
            {
LABEL_215:
              uint64_t v136 = (char *)operator new(0x38uLL);
              uint64_t v137 = v136 + 32;
              if (*(char *)(v8 + 47) < 0)
              {
                sub_19E13C2D0(v137, *(void **)(v8 + 24), *(void *)(v8 + 32));
              }
              else
              {
                long long v138 = *v11;
                *((void *)v136 + 6) = *(void *)(v8 + 40);
                *(_OWORD *)uint64_t v137 = v138;
              }
              *(void *)uint64_t v136 = 0;
              *((void *)v136 + 1) = 0;
              *((void *)v136 + 2) = v119;
              double *v121 = v136;
              uint64_t v139 = **(void **)(v101 + 224);
              if (v139)
              {
                *(void *)(v101 + 224) = v139;
                uint64_t v136 = *v121;
              }
              float32x4_t v140 = *v272;
              BOOL v80 = v136 == *v272;
              v136[24] = v80;
              if (!v80)
              {
                do
                {
                  uint64_t v141 = *((void *)v136 + 2);
                  if (*(unsigned char *)(v141 + 24)) {
                    break;
                  }
                  float32x4_t v142 = *(char **)(v141 + 16);
                  uint64_t v143 = *(void *)v142;
                  if (*(void *)v142 == v141)
                  {
                    uint64_t v146 = *((void *)v142 + 1);
                    if (!v146 || (v147 = *(unsigned __int8 *)(v146 + 24), float32x4_t v144 = (unsigned char *)(v146 + 24), v147))
                    {
                      if (*(char **)v141 == v136)
                      {
                        *(unsigned char *)(v141 + 24) = 1;
                        v142[24] = 0;
                        uint64_t v150 = *(void *)(v141 + 8);
                        *(void *)float32x4_t v142 = v150;
                        if (v150) {
                          goto LABEL_235;
                        }
                      }
                      else
                      {
                        float32x4_t v148 = *(uint64_t **)(v141 + 8);
                        uint64_t v149 = *v148;
                        *(void *)(v141 + 8) = *v148;
                        if (v149)
                        {
                          *(void *)(v149 + 16) = v141;
                          float32x4_t v142 = *(char **)(v141 + 16);
                        }
                        v148[2] = (uint64_t)v142;
                        *(void *)(*(void *)(v141 + 16) + 8 * (**(void **)(v141 + 16) != v141)) = v148;
                        *float32x4_t v148 = v141;
                        *(void *)(v141 + 16) = v148;
                        float32x4_t v142 = (char *)v148[2];
                        uint64_t v141 = *(void *)v142;
                        *((unsigned char *)v148 + 24) = 1;
                        v142[24] = 0;
                        uint64_t v150 = *(void *)(v141 + 8);
                        *(void *)float32x4_t v142 = v150;
                        if (v150) {
LABEL_235:
                        }
                          *(void *)(v150 + 16) = v142;
                      }
                      *(void *)(v141 + 16) = *((void *)v142 + 2);
                      *(void *)(*((void *)v142 + 2) + 8 * (**((void **)v142 + 2) != (void)v142)) = v141;
                      *(void *)(v141 + 8) = v142;
LABEL_299:
                      *((void *)v142 + 2) = v141;
                      break;
                    }
                  }
                  else if (!v143 || (v145 = *(unsigned __int8 *)(v143 + 24), float32x4_t v144 = (unsigned char *)(v143 + 24), v145))
                  {
                    if (*(char **)v141 == v136)
                    {
                      uint64_t v262 = *((void *)v136 + 1);
                      *(void *)uint64_t v141 = v262;
                      if (v262)
                      {
                        *(void *)(v262 + 16) = v141;
                        float32x4_t v142 = *(char **)(v141 + 16);
                      }
                      *((void *)v136 + 2) = v142;
                      *(void *)(*(void *)(v141 + 16) + 8 * (**(void **)(v141 + 16) != v141)) = v136;
                      *((void *)v136 + 1) = v141;
                      *(void *)(v141 + 16) = v136;
                      float32x4_t v142 = (char *)*((void *)v136 + 2);
                      v136[24] = 1;
                      v142[24] = 0;
                      uint64_t v141 = *((void *)v142 + 1);
                      v185 = *(char **)v141;
                      *((void *)v142 + 1) = *(void *)v141;
                      if (v185) {
LABEL_297:
                      }
                        *((void *)v185 + 2) = v142;
                    }
                    else
                    {
                      *(unsigned char *)(v141 + 24) = 1;
                      v142[24] = 0;
                      uint64_t v141 = *((void *)v142 + 1);
                      v185 = *(char **)v141;
                      *((void *)v142 + 1) = *(void *)v141;
                      if (v185) {
                        goto LABEL_297;
                      }
                    }
                    *(void *)(v141 + 16) = *((void *)v142 + 2);
                    *(void *)(*((void *)v142 + 2) + 8 * (**((void **)v142 + 2) != (void)v142)) = v141;
                    *(void *)uint64_t v141 = v142;
                    goto LABEL_299;
                  }
                  *(unsigned char *)(v141 + 24) = 1;
                  uint64_t v136 = v142;
                  v142[24] = v142 == v140;
                  *float32x4_t v144 = 1;
                }
                while (v142 != v140);
              }
              ++*(void *)(v101 + 240);
            }
          }
        }
        v186 = v277;
        v187 = *v277;
        v188 = v277;
        if (*v277)
        {
          int v189 = *(char *)(v8 + 47);
          if (v189 >= 0) {
            size_t v190 = *(unsigned __int8 *)(v8 + 47);
          }
          else {
            size_t v190 = *(void *)(v8 + 32);
          }
          if (v189 >= 0) {
            v191 = (const void *)(v8 + 24);
          }
          else {
            v191 = *(const void **)(v8 + 24);
          }
          while (1)
          {
            while (1)
            {
              v186 = (uint64_t **)v187;
              v194 = (const void *)v187[4];
              v192 = v187 + 4;
              v193 = v194;
              int v195 = *((char *)v192 + 23);
              if (v195 >= 0) {
                size_t v196 = *((unsigned __int8 *)v192 + 23);
              }
              else {
                size_t v196 = v192[1];
              }
              if (v195 >= 0) {
                v197 = v192;
              }
              else {
                v197 = v193;
              }
              if (v196 >= v190) {
                size_t v198 = v190;
              }
              else {
                size_t v198 = v196;
              }
              int v199 = memcmp(v191, v197, v198);
              BOOL v200 = v190 < v196;
              if (v199) {
                BOOL v200 = v199 < 0;
              }
              if (!v200) {
                break;
              }
              v187 = *v186;
              v188 = v186;
              if (!*v186) {
                goto LABEL_326;
              }
            }
            int v201 = memcmp(v197, v191, v198);
            BOOL v202 = v196 < v190;
            if (v201) {
              BOOL v202 = v201 < 0;
            }
            if (!v202) {
              break;
            }
            v187 = v186[1];
            if (!v187)
            {
              v188 = v186 + 1;
              goto LABEL_326;
            }
          }
          v204 = v186;
          uint64_t v203 = v275;
        }
        else
        {
LABEL_326:
          uint64_t v203 = v275;
          v204 = operator new(0x40uLL);
          v205 = v204 + 4;
          if (*(char *)(v8 + 47) < 0)
          {
            sub_19E13C2D0(v205, *(void **)(v8 + 24), *(void *)(v8 + 32));
          }
          else
          {
            long long v206 = *v11;
            v204[6] = *(void *)(v8 + 40);
            *(_OWORD *)v205 = v206;
          }
          v204[7] = 0;
          void *v204 = 0;
          v204[1] = 0;
          v204[2] = v186;
          *v188 = v204;
          v207 = (uint64_t *)**v273;
          v208 = v204;
          if (v207)
          {
            *v273 = v207;
            v208 = *v188;
          }
          v209 = *v277;
          BOOL v80 = v208 == *v277;
          *((unsigned char *)v208 + 24) = v80;
          if (!v80)
          {
            do
            {
              uint64_t v210 = v208[2];
              if (*(unsigned char *)(v210 + 24)) {
                break;
              }
              v211 = *(uint64_t **)(v210 + 16);
              uint64_t v212 = *v211;
              if (*v211 == v210)
              {
                uint64_t v215 = v211[1];
                if (!v215 || (int v216 = *(unsigned __int8 *)(v215 + 24), v213 = (unsigned char *)(v215 + 24), v216))
                {
                  if (*(uint64_t **)v210 == v208)
                  {
                    *(unsigned char *)(v210 + 24) = 1;
                    *((unsigned char *)v211 + 24) = 0;
                    uint64_t v219 = *(void *)(v210 + 8);
                    uint64_t *v211 = v219;
                    if (v219) {
                      goto LABEL_346;
                    }
                  }
                  else
                  {
                    v217 = *(uint64_t **)(v210 + 8);
                    uint64_t v218 = *v217;
                    *(void *)(v210 + 8) = *v217;
                    if (v218)
                    {
                      *(void *)(v218 + 16) = v210;
                      v211 = *(uint64_t **)(v210 + 16);
                    }
                    v217[2] = (uint64_t)v211;
                    *(void *)(*(void *)(v210 + 16) + 8 * (**(void **)(v210 + 16) != v210)) = v217;
                    uint64_t *v217 = v210;
                    *(void *)(v210 + 16) = v217;
                    v211 = (uint64_t *)v217[2];
                    uint64_t v210 = *v211;
                    *((unsigned char *)v217 + 24) = 1;
                    *((unsigned char *)v211 + 24) = 0;
                    uint64_t v219 = *(void *)(v210 + 8);
                    uint64_t *v211 = v219;
                    if (v219) {
LABEL_346:
                    }
                      *(void *)(v219 + 16) = v211;
                  }
                  *(void *)(v210 + 16) = v211[2];
                  *(void *)(v211[2] + 8 * (*(void *)v211[2] != (void)v211)) = v210;
                  *(void *)(v210 + 8) = v211;
LABEL_13:
                  v211[2] = v210;
                  break;
                }
              }
              else if (!v212 || (int v214 = *(unsigned __int8 *)(v212 + 24), v213 = (unsigned char *)(v212 + 24), v214))
              {
                if (*(uint64_t **)v210 == v208)
                {
                  uint64_t v221 = v208[1];
                  *(void *)uint64_t v210 = v221;
                  if (v221)
                  {
                    *(void *)(v221 + 16) = v210;
                    v211 = *(uint64_t **)(v210 + 16);
                  }
                  v208[2] = (uint64_t)v211;
                  *(void *)(*(void *)(v210 + 16) + 8 * (**(void **)(v210 + 16) != v210)) = v208;
                  v208[1] = v210;
                  *(void *)(v210 + 16) = v208;
                  v211 = (uint64_t *)v208[2];
                  *((unsigned char *)v208 + 24) = 1;
                  *((unsigned char *)v211 + 24) = 0;
                  uint64_t v210 = v211[1];
                  v220 = *(uint64_t **)v210;
                  v211[1] = *(void *)v210;
                  if (!v220) {
                    goto LABEL_12;
                  }
                }
                else
                {
                  *(unsigned char *)(v210 + 24) = 1;
                  *((unsigned char *)v211 + 24) = 0;
                  uint64_t v210 = v211[1];
                  v220 = *(uint64_t **)v210;
                  v211[1] = *(void *)v210;
                  if (!v220) {
                    goto LABEL_12;
                  }
                }
                v220[2] = (uint64_t)v211;
LABEL_12:
                *(void *)(v210 + 16) = v211[2];
                *(void *)(v211[2] + 8 * (*(void *)v211[2] != (void)v211)) = v210;
                *(void *)uint64_t v210 = v211;
                goto LABEL_13;
              }
              *(unsigned char *)(v210 + 24) = 1;
              v208 = v211;
              *((unsigned char *)v211 + 24) = v211 == v209;
              unsigned char *v213 = 1;
            }
            while (v211 != v209);
          }
          ++*(void *)(v275 + 112);
        }
        uint64_t v9 = v204[7];
        v278[0] = v284;
        v278[1] = v285;
        uint64_t v279 = v286;
        (*(void (**)(uint64_t, _OWORD *, void, void))(*(void *)v9 + 176))(v9, v278, *(unsigned int *)(v8 + 52), *(unsigned __int8 *)(v203 + 248));
      }
LABEL_16:
      v8 += 56;
    }
  }
  return 1;
}

void sub_19E3090E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 89) < 0)
  {
    operator delete(*(void **)(v33 - 112));
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E3091DC(const char *a1, uint64_t a2, const char *a3)
{
  sub_19E13D8EC((uint64_t)v12);
  size_t v6 = strlen(a1);
  sub_19E13DB94(v12, (uint64_t)a1, v6);
  int v7 = *(char *)(a2 + 23);
  if (v7 >= 0) {
    uint64_t v8 = a2;
  }
  else {
    uint64_t v8 = *(void *)a2;
  }
  if (v7 >= 0) {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  sub_19E13DB94(v12, v8, v9);
  size_t v10 = strlen(a3);
  sub_19E13DB94(v12, (uint64_t)a3, v10);
  std::ostream::operator<<();
  std::stringbuf::str();
  v12[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v12 + *(void *)(v12[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v12[1] = MEMORY[0x1E4FBA470] + 16;
  if (v13 < 0) {
    operator delete((void *)v12[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x19F3BBB40](&v14);
}

void sub_19E309374(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E13DA90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19E309388(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E13DA90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_19E30939C(uint64_t a1, uint64_t a2)
{
  sub_19E307864(a1);
  uint64_t v54 = a1;
  uint64_t v3 = *(const void ***)(a1 + 96);
  int v53 = (uint64_t **)(a1 + 96);
  uint64_t v55 = (const void ***)(a1 + 104);
  if (v3 != (const void **)(a1 + 104))
  {
    long long v4 = (uint64_t *)(a1 + 232);
    uint64_t v5 = *(void *)(a1 + 232);
    if (v5)
    {
LABEL_5:
      int v6 = *((char *)v3 + 55);
      if (v6 >= 0) {
        size_t v7 = *((unsigned __int8 *)v3 + 55);
      }
      else {
        size_t v7 = (size_t)v3[5];
      }
      if (v6 >= 0) {
        uint64_t v8 = v3 + 4;
      }
      else {
        uint64_t v8 = v3[4];
      }
      uint64_t v9 = (uint64_t *)(a1 + 232);
      do
      {
        int v10 = *(char *)(v5 + 55);
        if (v10 >= 0) {
          size_t v11 = *(unsigned __int8 *)(v5 + 55);
        }
        else {
          size_t v11 = *(void *)(v5 + 40);
        }
        if (v10 >= 0) {
          long long v12 = (const void *)(v5 + 32);
        }
        else {
          long long v12 = *(const void **)(v5 + 32);
        }
        if (v7 >= v11) {
          size_t v13 = v11;
        }
        else {
          size_t v13 = v7;
        }
        int v14 = memcmp(v12, v8, v13);
        BOOL v15 = v11 < v7;
        if (v14) {
          BOOL v15 = v14 < 0;
        }
        BOOL v16 = !v15;
        if (v15) {
          uint64_t v17 = (uint64_t *)(v5 + 8);
        }
        else {
          uint64_t v17 = (uint64_t *)v5;
        }
        if (v16) {
          uint64_t v9 = (uint64_t *)v5;
        }
        uint64_t v5 = *v17;
      }
      while (*v17);
      if (v9 != v4)
      {
        BOOL v20 = (const void *)v9[4];
        BOOL v19 = v9 + 4;
        int v18 = v20;
        int v21 = *((char *)v19 + 23);
        if (v21 >= 0) {
          size_t v22 = *((unsigned __int8 *)v19 + 23);
        }
        else {
          size_t v22 = v19[1];
        }
        if (v21 >= 0) {
          size_t v23 = v19;
        }
        else {
          size_t v23 = v18;
        }
        if (v22 >= v7) {
          size_t v24 = v7;
        }
        else {
          size_t v24 = v22;
        }
        int v25 = memcmp(v8, v23, v24);
        BOOL v26 = v7 >= v22;
        if (v25) {
          BOOL v26 = v25 >= 0;
        }
        if (v26)
        {
          p_dst = (long long *)(v3 + 4);
          int v27 = sub_19E26CE00(v53, v3 + 4, (uint64_t)&unk_19E351150, &p_dst);
          sub_19E30A27C(a1, (uint64_t)v27[7]);
        }
      }
      while (1)
      {
        BOOL v28 = (const void **)v3[1];
        if (v28)
        {
          do
          {
            long long v29 = (const void ***)v28;
            BOOL v28 = (const void **)*v28;
          }
          while (v28);
        }
        else
        {
          do
          {
            long long v29 = (const void ***)v3[2];
            BOOL v16 = *v29 == v3;
            uint64_t v3 = (const void **)v29;
          }
          while (!v16);
        }
        if (v29 == v55) {
          break;
        }
        uint64_t v5 = *v4;
        uint64_t v3 = (const void **)v29;
        if (*v4) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      do
      {
        int v47 = (const void **)v3[1];
        if (v47)
        {
          do
          {
            BOOL v48 = (const void ***)v47;
            int v47 = (const void **)*v47;
          }
          while (v47);
        }
        else
        {
          do
          {
            BOOL v48 = (const void ***)v3[2];
            BOOL v16 = *v48 == v3;
            uint64_t v3 = (const void **)v48;
          }
          while (!v16);
        }
        uint64_t v3 = (const void **)v48;
      }
      while (v48 != v55);
    }
  }
  sub_19E15A064(a1 + 224, *(char **)(a1 + 232));
  *(void *)(a1 + 224) = a1 + 232;
  *(void *)(a1 + 232) = 0;
  uint64_t v30 = *(void *)(a1 + 200);
  *(void *)(a1 + 240) = 0;
  sub_19E30D00C(a1 + 192, v30);
  *(void *)(a1 + 192) = a1 + 200;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = 0;
  long long v31 = *(long long **)(a1 + 120);
  uint64_t v50 = *(long long **)(a1 + 128);
  if (v31 != v50)
  {
    do
    {
      long long v52 = v31;
      if (*((char *)v31 + 23) < 0)
      {
        sub_19E13C2D0(&__dst, *(void **)v31, *((void *)v31 + 1));
      }
      else
      {
        long long v32 = *v31;
        uint64_t v64 = *((void *)v31 + 2);
        long long __dst = v32;
      }
      p_dst = &__dst;
      uint64_t v33 = sub_19E26CE00(v53, (const void **)&__dst, (uint64_t)&unk_19E351150, &p_dst);
      p_dst = &__dst;
      sub_19E30D0E0((uint64_t **)(v54 + 144), (const void **)&__dst, (uint64_t)&unk_19E351150, &p_dst);
      (*(void (**)(void **__return_ptr))(*v33[7] + 24))(&v61);
      if (v61 != v62)
      {
        (*(void (**)(long long **__return_ptr))(*v33[7] + 168))(&p_dst);
        int v34 = (*(uint64_t (**)(uint64_t *))(*v33[7] + 88))(v33[7]);
        int v35 = (int)p_dst;
        int v36 = v57;
        int v38 = v58;
        int v37 = v59;
        int v39 = v60;
        uint64_t v40 = *(void *)(v54 + 64);
        int v41 = operator new(0x30uLL);
        v41[1] = 0;
        v41[2] = 0;
        void *v41 = &unk_1EF0ABE88;
        sub_19E26CFE4((uint64_t)(v41 + 3), v34 * v36 * v35 * v38 * v37 * v39, v40);
      }
      if (v61)
      {
        int v62 = v61;
        operator delete(v61);
      }
      size_t v42 = v33[7];
      uint64_t v43 = (*(uint64_t (**)(uint64_t *))(*v42 + 224))(v42);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*v42 + 280))(v42, a2, v43);
      size_t v44 = v33[7];
      uint64_t v45 = (*(uint64_t (**)(uint64_t *, uint64_t))(*v44 + 216))(v44, 1);
      uint64_t v46 = (*(uint64_t (**)(uint64_t *))(*v33[7] + 224))(v33[7]);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*v44 + 256))(v44, v45, v46);
      if (SHIBYTE(v64) < 0) {
        operator delete((void *)__dst);
      }
      long long v31 = (long long *)((char *)v52 + 24);
    }
    while ((long long *)((char *)v52 + 24) != v50);
  }
  (*(void (**)(long long **__return_ptr))(**(void **)(*(void *)(v54 + 96) + 56) + 160))(&p_dst);
  *(_DWORD *)(v54 + 56) = v59;
  return 1;
}

void sub_19E30A154(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,char a27)
{
  if ((*(char *)(v27 - 89) & 0x80000000) == 0) {
    _Unwind_Resume(exception_object);
  }
  operator delete(*(void **)(v27 - 112));
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E30A27C(uint64_t a1, uint64_t a2)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a2 + 128))(a2) != 2)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 128))(a2);
    uint64_t v5 = v4;
    size_t v7 = (uint64_t **)(a1 + 80);
    int v6 = *(uint64_t **)(a1 + 80);
    if (v6)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v8 = (uint64_t **)v6;
          uint64_t v9 = v6[4];
          if (v4 >= v9) {
            break;
          }
          int v6 = *v8;
          size_t v7 = v8;
          if (!*v8) {
            goto LABEL_9;
          }
        }
        if (v9 >= v4) {
          break;
        }
        int v6 = v8[1];
        if (!v6)
        {
          size_t v7 = v8 + 1;
          goto LABEL_9;
        }
      }
    }
    else
    {
      uint64_t v8 = (uint64_t **)(a1 + 80);
LABEL_9:
      int v10 = (uint64_t *)v8;
      uint64_t v8 = (uint64_t **)operator new(0x30uLL);
      v8[4] = (uint64_t *)v5;
      v8[5] = 0;
      *uint64_t v8 = 0;
      v8[1] = 0;
      void v8[2] = v10;
      uint64_t *v7 = (uint64_t *)v8;
      uint64_t v11 = **(void **)(a1 + 72);
      long long v12 = (uint64_t *)v8;
      if (v11)
      {
        *(void *)(a1 + 72) = v11;
        long long v12 = *v7;
      }
      sub_19E13C8A0(*(uint64_t **)(a1 + 80), v12);
      ++*(void *)(a1 + 88);
    }
    (*(void (**)(uint64_t, uint64_t *))(*(void *)a2 + 248))(a2, v8[5]);
  }
  return 1;
}

uint64_t sub_19E30A3CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  uint64_t result = *(void *)(a1 + 216);
  *(void *)(a1 + 216) = v3;
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_19E30A40C()
{
}

void sub_19E30A424(int a1, int a2, void *__p)
{
  if (__p) {
    operator delete[](__p);
  }
}

void sub_19E30A434(uint64_t a1, int a2)
{
  uint64_t v4 = (void *)(a1 + 200);
  sub_19E30D00C(a1 + 192, *(void *)(a1 + 200));
  *(v4 - 1) = v4;
  void *v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (void *)*(v4 - 13);
  int v6 = v4 - 12;
  if (v5 != v6)
  {
    int v7 = 0;
    do
    {
      int v8 = (*(uint64_t (**)(void))(*(void *)v5[7] + 40))(v5[7]);
      uint64_t v9 = (void *)v5[1];
      if (v9)
      {
        do
        {
          int v10 = v9;
          uint64_t v9 = (void *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          int v10 = (void *)v5[2];
          BOOL v11 = *v10 == (void)v5;
          uint64_t v5 = v10;
        }
        while (!v11);
      }
      v7 += v8;
      uint64_t v5 = v10;
    }
    while (v10 != v6);
    long long v12 = *(void **)(a1 + 96);
    int v13 = 1000 * a2;
    if (v12 != v6 && v7 > v13)
    {
      do
      {
        int v15 = (*(uint64_t (**)(void))(*(void *)v12[7] + 40))(v12[7]);
        (*(void (**)(void))(*(void *)v12[7] + 32))(v12[7]);
        BOOL v16 = (void *)v12[1];
        uint64_t v17 = v12;
        if (v16)
        {
          do
          {
            long long v12 = v16;
            BOOL v16 = (void *)*v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            long long v12 = (void *)v17[2];
            BOOL v11 = *v12 == (void)v17;
            uint64_t v17 = v12;
          }
          while (!v11);
        }
        if (v12 == v6) {
          break;
        }
        v7 -= v15;
      }
      while (v7 > v13);
    }
  }
}

void sub_19E30A5CC(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v4 = *(void **)(a1 + 144);
  uint64_t v33 = (void *)(a1 + 152);
  if (v4 != (void *)(a1 + 152))
  {
    while (1)
    {
      int v7 = (long long *)v4[7];
      int v6 = (long long *)v4[8];
      int v34 = v6;
      if (v7 != v6) {
        break;
      }
LABEL_5:
      int v8 = (void *)v4[1];
      if (v8)
      {
        do
        {
          uint64_t v9 = v8;
          int v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          uint64_t v9 = (void *)v4[2];
          BOOL v10 = *v9 == (void)v4;
          uint64_t v4 = v9;
        }
        while (!v10);
      }
      uint64_t v4 = v9;
      if (v9 == v33) {
        return;
      }
    }
    while (1)
    {
      uint64_t v11 = *((unsigned __int8 *)v7 + 47);
      if ((v11 & 0x80u) == 0) {
        uint64_t v12 = *((unsigned __int8 *)v7 + 47);
      }
      else {
        uint64_t v12 = *((void *)v7 + 4);
      }
      uint64_t v13 = *(unsigned __int8 *)(a2 + 23);
      int v14 = (char)v13;
      if ((v13 & 0x80u) != 0) {
        uint64_t v13 = *(void *)(a2 + 8);
      }
      if (v12 != v13) {
        goto LABEL_12;
      }
      int v15 = v14 >= 0 ? (unsigned __int8 *)a2 : *(unsigned __int8 **)a2;
      if ((v11 & 0x80) == 0) {
        break;
      }
      if (!memcmp(*((const void **)v7 + 3), v15, *((void *)v7 + 4))) {
        goto LABEL_27;
      }
LABEL_12:
      int v7 = (long long *)((char *)v7 + 56);
      if (v7 == v6) {
        goto LABEL_5;
      }
    }
    if (*((unsigned char *)v7 + 47))
    {
      uint64_t v16 = 0;
      while (*((unsigned __int8 *)v7 + v16 + 24) == v15[v16])
      {
        if (v11 == ++v16) {
          goto LABEL_27;
        }
      }
      goto LABEL_12;
    }
LABEL_27:
    if (*((_DWORD *)v7 + 13) <= 8u) {
      int v17 = *((_DWORD *)v7 + 13);
    }
    else {
      int v17 = 0;
    }
    if (*((char *)v7 + 23) < 0)
    {
      sub_19E13C2D0(__p, *(void **)v7, *((void *)v7 + 1));
    }
    else
    {
      long long v18 = *v7;
      int v36 = (void *)*((void *)v7 + 2);
      *(_OWORD *)std::string __p = v18;
    }
    int v37 = v17;
    BOOL v20 = (void **)a3[1];
    unint64_t v19 = (unint64_t)a3[2];
    if ((unint64_t)v20 >= v19)
    {
      size_t v23 = (void **)*a3;
      uint64_t v24 = (char *)v20 - *a3;
      unint64_t v25 = (v24 >> 5) + 1;
      if (v25 >> 59) {
        sub_19E13D694();
      }
      uint64_t v26 = v19 - (void)v23;
      if (v26 >> 4 > v25) {
        unint64_t v25 = v26 >> 4;
      }
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v27 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v27 = v25;
      }
      if (v27 >> 59) {
        sub_19E13C418();
      }
      BOOL v28 = (char *)operator new(32 * v27);
      long long v29 = &v28[32 * (v24 >> 5)];
      *(_OWORD *)long long v29 = *(_OWORD *)__p;
      *((void *)v29 + 2) = v36;
      uint64_t v30 = &v28[32 * v27];
      __p[1] = 0;
      int v36 = 0;
      __p[0] = 0;
      *(_DWORD *)&v28[v24 + 24] = v17;
      size_t v22 = v29 + 32;
      if (v20 == v23)
      {
        *a3 = v29;
        a3[1] = v22;
        a3[2] = v30;
      }
      else
      {
        do
        {
          long long v31 = *((_OWORD *)v20 - 2);
          *((void *)v29 - 2) = *(v20 - 2);
          *((_OWORD *)v29 - 2) = v31;
          *(v20 - 3) = 0;
          *(v20 - 2) = 0;
          *(v20 - 4) = 0;
          *((_DWORD *)v29 - 2) = *((_DWORD *)v20 - 2);
          v29 -= 32;
          v20 -= 4;
        }
        while (v20 != v23);
        BOOL v20 = (void **)*a3;
        long long v32 = (void **)a3[1];
        *a3 = v29;
        a3[1] = v22;
        a3[2] = v30;
        while (v32 != v20)
        {
          if (*((char *)v32 - 9) < 0) {
            operator delete(*(v32 - 4));
          }
          v32 -= 4;
        }
      }
      int v6 = v34;
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      long long v21 = *(_OWORD *)__p;
      v20[2] = v36;
      *(_OWORD *)BOOL v20 = v21;
      __p[1] = 0;
      int v36 = 0;
      __p[0] = 0;
      *((_DWORD *)v20 + 6) = v37;
      size_t v22 = (char *)(v20 + 4);
    }
    a3[1] = v22;
    if (SHIBYTE(v36) < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_12;
  }
}

void sub_19E30A898(_Unwind_Exception *a1)
{
  sub_19E279FEC(v1);
  _Unwind_Resume(a1);
}

void sub_19E30A8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  sub_19E279FEC(v16);
  _Unwind_Resume(a1);
}

void sub_19E30A8D4(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v4 = *(void **)(a1 + 144);
  long long v32 = (void *)(a1 + 152);
  if (v4 != (void *)(a1 + 152))
  {
    while (1)
    {
      uint64_t v7 = v4[7];
      uint64_t v6 = v4[8];
      uint64_t v33 = v6;
      if (v7 != v6) {
        break;
      }
LABEL_5:
      int v8 = (void *)v4[1];
      if (v8)
      {
        do
        {
          uint64_t v9 = v8;
          int v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          uint64_t v9 = (void *)v4[2];
          BOOL v10 = *v9 == (void)v4;
          uint64_t v4 = v9;
        }
        while (!v10);
      }
      uint64_t v4 = v9;
      if (v9 == v32) {
        return;
      }
    }
    while (1)
    {
      uint64_t v11 = *(unsigned __int8 *)(v7 + 23);
      if ((v11 & 0x80u) == 0) {
        uint64_t v12 = *(unsigned __int8 *)(v7 + 23);
      }
      else {
        uint64_t v12 = *(void *)(v7 + 8);
      }
      uint64_t v13 = *(unsigned __int8 *)(a2 + 23);
      int v14 = (char)v13;
      if ((v13 & 0x80u) != 0) {
        uint64_t v13 = *(void *)(a2 + 8);
      }
      if (v12 != v13) {
        goto LABEL_12;
      }
      int v15 = v14 >= 0 ? (unsigned __int8 *)a2 : *(unsigned __int8 **)a2;
      if ((v11 & 0x80) == 0) {
        break;
      }
      if (!memcmp(*(const void **)v7, v15, *(void *)(v7 + 8))) {
        goto LABEL_27;
      }
LABEL_12:
      v7 += 56;
      if (v7 == v6) {
        goto LABEL_5;
      }
    }
    if (*(unsigned char *)(v7 + 23))
    {
      uint64_t v16 = 0;
      while (*(unsigned __int8 *)(v7 + v16) == v15[v16])
      {
        if (v11 == ++v16) {
          goto LABEL_27;
        }
      }
      goto LABEL_12;
    }
LABEL_27:
    if (*(char *)(v7 + 47) < 0)
    {
      sub_19E13C2D0(__p, *(void **)(v7 + 24), *(void *)(v7 + 32));
    }
    else
    {
      *(_OWORD *)std::string __p = *(_OWORD *)(v7 + 24);
      int v35 = *(void **)(v7 + 40);
    }
    int v17 = *(_DWORD *)(v7 + 48);
    int v36 = v17;
    unint64_t v19 = (void **)a3[1];
    unint64_t v18 = (unint64_t)a3[2];
    if ((unint64_t)v19 >= v18)
    {
      size_t v22 = (void **)*a3;
      uint64_t v23 = (char *)v19 - *a3;
      unint64_t v24 = (v23 >> 5) + 1;
      if (v24 >> 59) {
        sub_19E13D694();
      }
      uint64_t v25 = v18 - (void)v22;
      if (v25 >> 4 > v24) {
        unint64_t v24 = v25 >> 4;
      }
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v26 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v26 = v24;
      }
      if (v26 >> 59) {
        sub_19E13C418();
      }
      unint64_t v27 = (char *)operator new(32 * v26);
      BOOL v28 = &v27[32 * (v23 >> 5)];
      *(_OWORD *)BOOL v28 = *(_OWORD *)__p;
      *((void *)v28 + 2) = v35;
      long long v29 = &v27[32 * v26];
      __p[1] = 0;
      int v35 = 0;
      __p[0] = 0;
      *(_DWORD *)&v27[v23 + 24] = v17;
      long long v21 = v28 + 32;
      if (v19 == v22)
      {
        *a3 = v28;
        a3[1] = v21;
        a3[2] = v29;
      }
      else
      {
        do
        {
          long long v30 = *((_OWORD *)v19 - 2);
          *((void *)v28 - 2) = *(v19 - 2);
          *((_OWORD *)v28 - 2) = v30;
          *(v19 - 3) = 0;
          *(v19 - 2) = 0;
          *(v19 - 4) = 0;
          *((_DWORD *)v28 - 2) = *((_DWORD *)v19 - 2);
          v28 -= 32;
          v19 -= 4;
        }
        while (v19 != v22);
        unint64_t v19 = (void **)*a3;
        long long v31 = (void **)a3[1];
        *a3 = v28;
        a3[1] = v21;
        a3[2] = v29;
        while (v31 != v19)
        {
          if (*((char *)v31 - 9) < 0) {
            operator delete(*(v31 - 4));
          }
          v31 -= 4;
        }
      }
      uint64_t v6 = v33;
      if (v19) {
        operator delete(v19);
      }
    }
    else
    {
      long long v20 = *(_OWORD *)__p;
      v19[2] = v35;
      *(_OWORD *)unint64_t v19 = v20;
      __p[1] = 0;
      int v35 = 0;
      __p[0] = 0;
      *((_DWORD *)v19 + 6) = v36;
      long long v21 = (char *)(v19 + 4);
    }
    a3[1] = v21;
    if (SHIBYTE(v35) < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_12;
  }
}

void sub_19E30AB98(_Unwind_Exception *a1)
{
  sub_19E279FEC(v1);
  _Unwind_Resume(a1);
}

void sub_19E30ABAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  sub_19E279FEC(v16);
  _Unwind_Resume(a1);
}

uint64_t sub_19E30ABD4(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  uint64_t v3 = *(void **)(a1 + 144);
  uint64_t v4 = (void *)(a1 + 152);
  if (v3 != (void *)(a1 + 152))
  {
    char v5 = *((unsigned char *)a3 + 23);
    if (v5 >= 0) {
      uint64_t v6 = (unsigned __int8 *)*((unsigned __int8 *)a3 + 23);
    }
    else {
      uint64_t v6 = a3[1];
    }
    if (v5 >= 0) {
      uint64_t v7 = (unsigned __int8 *)a3;
    }
    else {
      uint64_t v7 = *a3;
    }
    char v8 = *((unsigned char *)a2 + 23);
    if (v8 >= 0) {
      uint64_t v9 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
    }
    else {
      uint64_t v9 = a2[1];
    }
    if (v8 >= 0) {
      BOOL v10 = (unsigned __int8 *)a2;
    }
    else {
      BOOL v10 = *a2;
    }
    do
    {
      uint64_t v11 = v3[7];
      uint64_t v12 = v3[8];
      while (v11 != v12)
      {
        uint64_t v13 = *(unsigned __int8 *)(v11 + 47);
        if ((v13 & 0x80u) == 0) {
          int v14 = (unsigned __int8 *)*(unsigned __int8 *)(v11 + 47);
        }
        else {
          int v14 = *(unsigned __int8 **)(v11 + 32);
        }
        if (v14 != v6) {
          goto LABEL_16;
        }
        if ((v13 & 0x80) != 0)
        {
          if (memcmp(*(const void **)(v11 + 24), v7, *(void *)(v11 + 32))) {
            goto LABEL_16;
          }
        }
        else if (*(unsigned char *)(v11 + 47))
        {
          uint64_t v15 = 0;
          while (*(unsigned __int8 *)(v11 + v15 + 24) == v7[v15])
          {
            if (v13 == ++v15) {
              goto LABEL_29;
            }
          }
          goto LABEL_16;
        }
LABEL_29:
        uint64_t v16 = *(unsigned __int8 *)(v11 + 23);
        if ((v16 & 0x80u) == 0) {
          int v17 = (unsigned __int8 *)*(unsigned __int8 *)(v11 + 23);
        }
        else {
          int v17 = *(unsigned __int8 **)(v11 + 8);
        }
        if (v17 == v9)
        {
          if ((v16 & 0x80) != 0)
          {
            if (!memcmp(*(const void **)v11, v10, *(void *)(v11 + 8))) {
              return *(unsigned int *)(v11 + 48);
            }
          }
          else
          {
            if (!*(unsigned char *)(v11 + 23)) {
              return *(unsigned int *)(v11 + 48);
            }
            uint64_t v18 = 0;
            while (*(unsigned __int8 *)(v11 + v18) == v10[v18])
            {
              if (v16 == ++v18) {
                return *(unsigned int *)(v11 + 48);
              }
            }
          }
        }
LABEL_16:
        v11 += 56;
      }
      unint64_t v19 = (void *)v3[1];
      if (v19)
      {
        do
        {
          long long v20 = v19;
          unint64_t v19 = (void *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          long long v20 = (void *)v3[2];
          BOOL v21 = *v20 == (void)v3;
          uint64_t v3 = v20;
        }
        while (!v21);
      }
      uint64_t v3 = v20;
    }
    while (v20 != v4);
  }
  return 9;
}

uint64_t sub_19E30AD68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 104;
  uint64_t v4 = *(void *)(a1 + 104);
  if (!v4) {
    goto LABEL_43;
  }
  int v5 = *(char *)(a2 + 23);
  size_t v6 = v5 >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(void *)(a2 + 8);
  uint64_t v7 = v5 >= 0 ? (const void *)a2 : *(const void **)a2;
  uint64_t v8 = a1 + 104;
  do
  {
    int v9 = *(char *)(v4 + 55);
    if (v9 >= 0) {
      size_t v10 = *(unsigned __int8 *)(v4 + 55);
    }
    else {
      size_t v10 = *(void *)(v4 + 40);
    }
    if (v9 >= 0) {
      uint64_t v11 = (const void *)(v4 + 32);
    }
    else {
      uint64_t v11 = *(const void **)(v4 + 32);
    }
    if (v6 >= v10) {
      size_t v12 = v10;
    }
    else {
      size_t v12 = v6;
    }
    int v13 = memcmp(v11, v7, v12);
    BOOL v14 = v10 < v6;
    if (v13) {
      BOOL v14 = v13 < 0;
    }
    BOOL v15 = !v14;
    if (v14) {
      uint64_t v16 = (uint64_t *)(v4 + 8);
    }
    else {
      uint64_t v16 = (uint64_t *)v4;
    }
    if (v15) {
      uint64_t v8 = v4;
    }
    uint64_t v4 = *v16;
  }
  while (*v16);
  if (v8 == v3) {
    goto LABEL_43;
  }
  int v17 = *(char *)(v8 + 55);
  if (v17 >= 0) {
    size_t v18 = *(unsigned __int8 *)(v8 + 55);
  }
  else {
    size_t v18 = *(void *)(v8 + 40);
  }
  if (v17 >= 0) {
    unint64_t v19 = (const void *)(v8 + 32);
  }
  else {
    unint64_t v19 = *(const void **)(v8 + 32);
  }
  if (v18 >= v6) {
    size_t v20 = v6;
  }
  else {
    size_t v20 = v18;
  }
  int v21 = memcmp(v7, v19, v20);
  BOOL v22 = v6 >= v18;
  if (v21) {
    BOOL v22 = v21 >= 0;
  }
  if (!v22)
  {
LABEL_43:
    sub_19E30AF44("Invalid node name: ", a2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    unint64_t v26 = exception;
    if (v29 >= 0) {
      unint64_t v27 = (const char *)&v28;
    }
    else {
      unint64_t v27 = v28;
    }
    std::runtime_error::runtime_error(exception, v27);
    __cxa_throw(v26, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v23 = *(uint64_t (**)(void))(**(void **)(v8 + 56) + 152);

  return v23();
}

void sub_19E30AF18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E30AF44(const char *a1, uint64_t a2)
{
  sub_19E13D8EC((uint64_t)v9);
  size_t v4 = strlen(a1);
  sub_19E13DB94(v9, (uint64_t)a1, v4);
  int v5 = *(char *)(a2 + 23);
  if (v5 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *(void *)a2;
  }
  if (v5 >= 0) {
    uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  sub_19E13DB94(v9, v6, v7);
  std::stringbuf::str();
  v9[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v9 + *(void *)(v9[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v9[1] = MEMORY[0x1E4FBA470] + 16;
  if (v10 < 0) {
    operator delete((void *)v9[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x19F3BBB40](&v11);
}

void sub_19E30B0A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E13DA90((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19E30B0BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E13DA90((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_19E30B0D0(uint64_t a1, uint64_t *a2, const void ***a3, uint64_t a4, uint64_t a5, int a6)
{
  if (a6) {
    operator new();
  }
  uint64_t v11 = *(uint64_t **)(a1 + 216);
  if (!v11
    || (uint64_t v12 = *v11,
        !__dynamic_cast(v11, (const struct __class_type_info *)&unk_1EF0A4B30, (const struct __class_type_info *)&unk_1EF0A49B0, 0)))
  {
    operator new();
  }
  if (*((char *)a2 + 23) < 0) {
    a2 = (uint64_t *)*a2;
  }
  v22[0] = 0;
  v22[1] = 0;
  int v21 = v22;
  BOOL v15 = *a3;
  int v13 = a3 + 1;
  BOOL v14 = v15;
  if (v15 != (const void **)v13)
  {
    do
    {
      sub_19E254AAC((uint64_t **)&v21, (uint64_t *)v22, v14 + 4, (uint64_t)(v14 + 4));
      uint64_t v16 = (const void **)v14[1];
      if (v16)
      {
        do
        {
          int v17 = (const void ***)v16;
          uint64_t v16 = (const void **)*v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          int v17 = (const void ***)v14[2];
          BOOL v18 = *v17 == v14;
          BOOL v14 = (const void **)v17;
        }
        while (!v18);
      }
      BOOL v14 = (const void **)v17;
    }
    while (v17 != v13);
    uint64_t v12 = *v11;
  }
  uint64_t v20 = (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, char ***, uint64_t, uint64_t))(v12 + 24))(v11, a2, a1, &v21, a4, a5);
  sub_19E15A064((uint64_t)&v21, v22[0]);
  return v20;
}

void sub_19E30B438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char *a11)
{
}

void sub_19E30B450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, char *a14)
{
  sub_19E15A064((uint64_t)&a13, a14);
  (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  _Unwind_Resume(a1);
}

uint64_t sub_19E30B528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = *(char *)(a2 + 23);
  if (v8 < 0)
  {
    sub_19E13C2D0(&__p, *(void **)a2, *(void *)(a2 + 8));
    if (*(char *)(a2 + 23) < 0)
    {
      if (*(void *)(a2 + 8)) {
        goto LABEL_9;
      }
    }
    else if (*(unsigned char *)(a2 + 23))
    {
      goto LABEL_9;
    }
  }
  else
  {
    std::string __p = *(std::string *)a2;
    if ((_BYTE)v8) {
      goto LABEL_9;
    }
  }
  uint64_t v9 = *(void *)(a1 + 128);
  if (*(void *)(a1 + 120) != v9) {
    std::string::operator=(&__p, (const std::string *)(v9 - 24));
  }
LABEL_9:
  uint64_t v10 = *(void *)(a1 + 104);
  if (!v10) {
    goto LABEL_52;
  }
  std::string::size_type v11 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
      ? HIBYTE(__p.__r_.__value_.__r.__words[2])
      : __p.__r_.__value_.__l.__size_;
  uint64_t v12 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
      ? &__p
      : (std::string *)__p.__r_.__value_.__r.__words[0];
  uint64_t v13 = a1 + 104;
  do
  {
    int v14 = *(char *)(v10 + 55);
    if (v14 >= 0) {
      size_t v15 = *(unsigned __int8 *)(v10 + 55);
    }
    else {
      size_t v15 = *(void *)(v10 + 40);
    }
    if (v14 >= 0) {
      uint64_t v16 = (const void *)(v10 + 32);
    }
    else {
      uint64_t v16 = *(const void **)(v10 + 32);
    }
    if (v11 >= v15) {
      size_t v17 = v15;
    }
    else {
      size_t v17 = v11;
    }
    int v18 = memcmp(v16, v12, v17);
    BOOL v19 = v15 < v11;
    if (v18) {
      BOOL v19 = v18 < 0;
    }
    BOOL v20 = !v19;
    if (v19) {
      int v21 = (uint64_t *)(v10 + 8);
    }
    else {
      int v21 = (uint64_t *)v10;
    }
    if (v20) {
      uint64_t v13 = v10;
    }
    uint64_t v10 = *v21;
  }
  while (*v21);
  if (v13 == a1 + 104) {
    goto LABEL_52;
  }
  int v22 = *(char *)(v13 + 55);
  if (v22 >= 0) {
    size_t v23 = *(unsigned __int8 *)(v13 + 55);
  }
  else {
    size_t v23 = *(void *)(v13 + 40);
  }
  if (v22 >= 0) {
    unint64_t v24 = (const void *)(v13 + 32);
  }
  else {
    unint64_t v24 = *(const void **)(v13 + 32);
  }
  if (v23 >= v11) {
    size_t v25 = v11;
  }
  else {
    size_t v25 = v23;
  }
  int v26 = memcmp(v12, v24, v25);
  BOOL v27 = v11 < v23;
  if (v26) {
    BOOL v27 = v26 < 0;
  }
  if (v27 || (*(uint64_t (**)(void))(**(void **)(v13 + 56) + 104))(*(void *)(v13 + 56)))
  {
LABEL_52:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid nodeName for partial output. ");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  sub_19E140890((uint64_t **)(a1 + 224), (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
  uint64_t v28 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(v13 + 56) + 296))(*(void *)(v13 + 56), a3, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v28;
}

void sub_19E30B780(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E30B7B4(uint64_t a1, unsigned __int8 **a2, char *a3)
{
  std::operator+<char>();
  uint64_t v6 = std::string::append((std::string *)v49, "_");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  *(void *)&v80[16] = *((void *)&v6->__r_.__value_.__l + 2);
  *(_OWORD *)BOOL v80 = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  int v8 = a3[23];
  if (v8 >= 0) {
    uint64_t v9 = a3;
  }
  else {
    uint64_t v9 = *(const std::string::value_type **)a3;
  }
  if (v8 >= 0) {
    std::string::size_type v10 = a3[23];
  }
  else {
    std::string::size_type v10 = *((void *)a3 + 1);
  }
  std::string::size_type v11 = std::string::append((std::string *)v80, v9, v10);
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if ((v80[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)v80);
    if ((v49[23] & 0x80000000) == 0)
    {
LABEL_9:
      uint64_t v14 = *(void *)(a1 + 120);
      uint64_t v13 = *(void *)(a1 + 128);
      *(void *)long long v31 = a1;
      if (v14 != v13) {
        goto LABEL_10;
      }
      goto LABEL_48;
    }
  }
  else if ((v49[23] & 0x80000000) == 0)
  {
    goto LABEL_9;
  }
  operator delete(*(void **)v49);
  uint64_t v14 = *(void *)(a1 + 120);
  uint64_t v13 = *(void *)(a1 + 128);
  *(void *)long long v31 = a1;
  if (v14 != v13)
  {
LABEL_10:
    char v15 = *((unsigned char *)a2 + 23);
    if (v15 >= 0) {
      uint64_t v16 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
    }
    else {
      uint64_t v16 = a2[1];
    }
    if (v15 >= 0) {
      size_t v17 = (unsigned __int8 *)a2;
    }
    else {
      size_t v17 = *a2;
    }
    uint64_t v18 = v14;
    do
    {
      uint64_t v19 = *(unsigned __int8 *)(v18 + 23);
      if ((v19 & 0x80u) == 0) {
        BOOL v20 = (unsigned __int8 *)*(unsigned __int8 *)(v18 + 23);
      }
      else {
        BOOL v20 = *(unsigned __int8 **)(v18 + 8);
      }
      if (v20 == v16)
      {
        if ((v19 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v18, v17, *(void *)(v18 + 8))) {
            goto LABEL_28;
          }
        }
        else
        {
          if (!*(unsigned char *)(v18 + 23)) {
            goto LABEL_28;
          }
          uint64_t v21 = 0;
          while (*(unsigned __int8 *)(v18 + v21) == v17[v21])
          {
            if (v19 == ++v21) {
              goto LABEL_28;
            }
          }
        }
      }
      v18 += 24;
    }
    while (v18 != v13);
    uint64_t v18 = v13;
LABEL_28:
    char v22 = a3[23];
    if (v22 >= 0) {
      uint64_t v23 = a3[23];
    }
    else {
      uint64_t v23 = *((void *)a3 + 1);
    }
    if (v22 < 0) {
      a3 = *(char **)a3;
    }
    do
    {
      uint64_t v24 = *(unsigned __int8 *)(v14 + 23);
      if ((v24 & 0x80u) == 0) {
        uint64_t v25 = *(unsigned __int8 *)(v14 + 23);
      }
      else {
        uint64_t v25 = *(void *)(v14 + 8);
      }
      if (v25 == v23)
      {
        if ((v24 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v14, a3, *(void *)(v14 + 8))) {
            goto LABEL_49;
          }
        }
        else
        {
          if (!*(unsigned char *)(v14 + 23)) {
            goto LABEL_49;
          }
          uint64_t v26 = 0;
          while (*(unsigned __int8 *)(v14 + v26) == a3[v26])
          {
            if (v24 == ++v26) {
              goto LABEL_49;
            }
          }
        }
      }
      v14 += 24;
    }
    while (v14 != v13);
    uint64_t v14 = v13;
LABEL_49:
    long long v110 = 0u;
    long long v109 = 0u;
    long long v108 = 0u;
    long long v107 = 0u;
    long long v106 = 0u;
    long long v105 = 0u;
    long long v104 = 0u;
    long long v103 = 0u;
    long long v102 = 0u;
    long long v101 = 0u;
    long long v100 = 0u;
    long long v99 = 0u;
    long long v98 = 0u;
    long long v97 = 0u;
    long long v96 = 0u;
    long long v95 = 0u;
    long long v94 = 0u;
    long long v93 = 0u;
    long long v92 = 0u;
    long long v91 = 0u;
    long long v90 = 0u;
    long long v89 = 0u;
    long long v88 = 0u;
    long long v87 = 0u;
    long long v86 = 0u;
    long long v85 = 0u;
    long long v84 = 0u;
    long long v83 = 0u;
    long long v82 = 0u;
    long long v81 = 0u;
    memset(v80, 0, sizeof(v80));
    *(void *)uint64_t v49 = v18;
    BOOL v27 = sub_19E26CE00((uint64_t **)(*(void *)v31 + 96), (const void **)v18, (uint64_t)&unk_19E351150, (long long **)v49);
    (*(void (**)(unsigned char *__return_ptr))(*v27[7] + 152))(v80);
    long long v79 = 0u;
    long long v78 = 0u;
    long long v77 = 0u;
    long long v76 = 0u;
    long long v75 = 0u;
    long long v74 = 0u;
    long long v73 = 0u;
    long long v72 = 0u;
    long long v71 = 0u;
    long long v70 = 0u;
    long long v69 = 0u;
    long long v68 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    long long v55 = 0u;
    long long v54 = 0u;
    long long v53 = 0u;
    long long v52 = 0u;
    long long v51 = 0u;
    long long v50 = 0u;
    memset(v49, 0, sizeof(v49));
    v32[0] = (long long *)v14;
    uint64_t v28 = sub_19E26CE00((uint64_t **)(*(void *)v31 + 96), (const void **)v14, (uint64_t)&unk_19E351150, v32);
    (*(void (**)(unsigned char *__return_ptr))(*v28[7] + 152))(v49);
    bzero(v32, 0x2C0uLL);
    v32[1] = (long long *)2;
    memset(&v32[4], 0, 24);
    long long v37 = v91;
    long long v38 = v92;
    long long v39 = v93;
    long long v40 = v94;
    long long v33 = v87;
    long long v34 = v88;
    long long v35 = v89;
    long long v36 = v90;
    long long v48 = v71;
    long long v47 = v70;
    long long v46 = v69;
    long long v45 = v68;
    long long v44 = v67;
    long long v42 = v65;
    long long v43 = v66;
    long long v41 = v64;
    if (*(void *)v80 != 11)
    {
      int v29 = v33;
      LODWORD(v33) = DWORD2(v33);
      DWORD2(v33) = v29;
    }
    if (*(void *)v49 != 11)
    {
      int v30 = v41;
      LODWORD(v41) = DWORD2(v41);
      DWORD2(v41) = v30;
    }
    operator new();
  }
LABEL_48:
  uint64_t v18 = v14;
  goto LABEL_49;
}

void sub_19E30CB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (*(char *)(v27 - 105) < 0) {
    operator delete(*(void **)(v27 - 128));
  }
  *(void *)(v26 + 64) = v25;
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v27 - 169) < 0) {
    operator delete(*(void **)(v27 - 192));
  }
  _Unwind_Resume(a1);
}

uint64_t sub_19E30CD50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 216) + 32))();
}

uint64_t sub_19E30CD78(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 216);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

uint64_t sub_19E30CDA8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 216);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

uint64_t sub_19E30CDD8()
{
  return 0;
}

void sub_19E30CDE0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_19E30CDE0(a1, *a2);
    sub_19E30CDE0(a1, a2[1]);
    uint64_t v4 = a2[5];
    a2[5] = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    operator delete(a2);
  }
}

void sub_19E30CE64(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_19E30CE64(a1, *(void *)a2);
    sub_19E30CE64(a1, *((void *)a2 + 1));
    uint64_t v4 = *((void *)a2 + 7);
    *((void *)a2 + 7) = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    if (a2[55] < 0)
    {
      operator delete(*((void **)a2 + 4));
      int v5 = a2;
    }
    else
    {
      int v5 = a2;
    }
    operator delete(v5);
  }
}

void sub_19E30CF18(uint64_t a1, char *a2)
{
  if (!a2) {
    return;
  }
  sub_19E30CF18(a1, *(void *)a2);
  sub_19E30CF18(a1, *((void *)a2 + 1));
  uint64_t v4 = *((void *)a2 + 7);
  if (v4)
  {
    uint64_t v5 = *((void *)a2 + 8);
    uint64_t v6 = (void *)*((void *)a2 + 7);
    if (v5 == v4)
    {
LABEL_13:
      *((void *)a2 + 8) = v4;
      operator delete(v6);
      goto LABEL_14;
    }
    while (1)
    {
      if (*(char *)(v5 - 9) < 0)
      {
        operator delete(*(void **)(v5 - 32));
        if (*(char *)(v5 - 33) < 0) {
LABEL_10:
        }
          operator delete(*(void **)(v5 - 56));
      }
      else if (*(char *)(v5 - 33) < 0)
      {
        goto LABEL_10;
      }
      v5 -= 56;
      if (v5 == v4)
      {
        uint64_t v6 = (void *)*((void *)a2 + 7);
        goto LABEL_13;
      }
    }
  }
LABEL_14:
  if (a2[55] < 0)
  {
    operator delete(*((void **)a2 + 4));
    long long v7 = a2;
  }
  else
  {
    long long v7 = a2;
  }
  operator delete(v7);
}

void sub_19E30D00C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_19E30D00C(a1, *(void *)a2);
    sub_19E30D00C(a1, *(void *)(a2 + 8));
    uint64_t v4 = *(std::__shared_weak_count **)(a2 + 64);
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      if ((*(char *)(a2 + 55) & 0x80000000) == 0)
      {
LABEL_5:
        uint64_t v5 = (void *)a2;
LABEL_7:
        operator delete(v5);
        return;
      }
    }
    else if ((*(char *)(a2 + 55) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(*(void **)(a2 + 32));
    uint64_t v5 = (void *)a2;
    goto LABEL_7;
  }
}

uint64_t *sub_19E30D0E0(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = a1[1];
  long long v7 = a1 + 1;
  int v8 = a1 + 1;
  if (v6)
  {
    int v9 = *((char *)a2 + 23);
    if (v9 >= 0) {
      size_t v10 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v10 = (size_t)a2[1];
    }
    if (v9 >= 0) {
      std::string::size_type v11 = a2;
    }
    else {
      std::string::size_type v11 = *a2;
    }
    while (1)
    {
      while (1)
      {
        int v8 = (uint64_t **)v6;
        uint64_t v14 = (const void *)v6[4];
        long long v12 = v6 + 4;
        uint64_t v13 = v14;
        int v15 = *((char *)v12 + 23);
        if (v15 >= 0) {
          size_t v16 = *((unsigned __int8 *)v12 + 23);
        }
        else {
          size_t v16 = v12[1];
        }
        if (v15 >= 0) {
          size_t v17 = v12;
        }
        else {
          size_t v17 = v13;
        }
        if (v16 >= v10) {
          size_t v18 = v10;
        }
        else {
          size_t v18 = v16;
        }
        int v19 = memcmp(v11, v17, v18);
        BOOL v20 = v10 < v16;
        if (v19) {
          BOOL v20 = v19 < 0;
        }
        if (!v20) {
          break;
        }
        uint64_t v6 = *v8;
        long long v7 = v8;
        if (!*v8) {
          goto LABEL_26;
        }
      }
      int v21 = memcmp(v17, v11, v18);
      BOOL v22 = v16 < v10;
      if (v21) {
        BOOL v22 = v21 < 0;
      }
      if (!v22) {
        break;
      }
      uint64_t v6 = v8[1];
      if (!v6)
      {
        long long v7 = v8 + 1;
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    uint64_t v23 = (uint64_t *)operator new(0x50uLL);
    int v29 = v23;
    uint64_t v24 = v23 + 4;
    uint64_t v25 = *a4;
    if (*((char *)*a4 + 23) < 0)
    {
      sub_19E13C2D0(v24, *(void **)v25, *((void *)v25 + 1));
    }
    else
    {
      long long v26 = *v25;
      v23[6] = *((void *)v25 + 2);
      *(_OWORD *)uint64_t v24 = v26;
    }
    v23[7] = 0;
    v23[8] = 0;
    v23[9] = 0;
    uint64_t *v23 = 0;
    v23[1] = 0;
    v23[2] = (uint64_t)v8;
    char *v7 = v23;
    uint64_t v27 = (uint64_t *)**a1;
    if (v27)
    {
      *a1 = v27;
      uint64_t v23 = *v7;
    }
    sub_19E13C8A0(a1[1], v23);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    return v29;
  }
  return (uint64_t *)v8;
}

void sub_19E30D290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_19E30D2AC(v10, v11);
  _Unwind_Resume(a1);
}

void sub_19E30D2AC(uint64_t a1, char *__p)
{
  if (!*(unsigned char *)(a1 + 8))
  {
    if (!__p) {
      return;
    }
    goto LABEL_12;
  }
  uint64_t v3 = *((void *)__p + 7);
  if (v3)
  {
    uint64_t v4 = *((void *)__p + 8);
    uint64_t v5 = (void *)*((void *)__p + 7);
    if (v4 == v3)
    {
LABEL_16:
      *((void *)__p + 8) = v3;
      operator delete(v5);
      goto LABEL_17;
    }
    while (1)
    {
      if (*(char *)(v4 - 9) < 0)
      {
        operator delete(*(void **)(v4 - 32));
        if (*(char *)(v4 - 33) < 0) {
LABEL_10:
        }
          operator delete(*(void **)(v4 - 56));
      }
      else if (*(char *)(v4 - 33) < 0)
      {
        goto LABEL_10;
      }
      v4 -= 56;
      if (v4 == v3)
      {
        uint64_t v5 = (void *)*((void *)__p + 7);
        goto LABEL_16;
      }
    }
  }
LABEL_17:
  if ((__p[55] & 0x80000000) == 0)
  {
LABEL_12:
    uint64_t v6 = __p;
    goto LABEL_14;
  }
  operator delete(*((void **)__p + 4));
  uint64_t v6 = __p;

LABEL_14:
  operator delete(v6);
}

uint64_t **sub_19E30D39C(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  long long v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    int v8 = *((char *)a2 + 23);
    if (v8 >= 0) {
      size_t v9 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v9 = (size_t)a2[1];
    }
    if (v8 >= 0) {
      uint64_t v10 = a2;
    }
    else {
      uint64_t v10 = *a2;
    }
    while (1)
    {
      while (1)
      {
        std::string::size_type v11 = (uint64_t **)v6;
        uint64_t v14 = (const void *)v6[4];
        long long v12 = v6 + 4;
        uint64_t v13 = v14;
        int v15 = *((char *)v12 + 23);
        if (v15 >= 0) {
          size_t v16 = *((unsigned __int8 *)v12 + 23);
        }
        else {
          size_t v16 = v12[1];
        }
        if (v15 >= 0) {
          size_t v17 = v12;
        }
        else {
          size_t v17 = v13;
        }
        if (v16 >= v9) {
          size_t v18 = v9;
        }
        else {
          size_t v18 = v16;
        }
        int v19 = memcmp(v10, v17, v18);
        BOOL v20 = v9 < v16;
        if (v19) {
          BOOL v20 = v19 < 0;
        }
        if (!v20) {
          break;
        }
        uint64_t v6 = *v11;
        long long v7 = v11;
        if (!*v11) {
          goto LABEL_27;
        }
      }
      int v21 = memcmp(v17, v10, v18);
      BOOL v22 = v16 < v9;
      if (v21) {
        BOOL v22 = v21 < 0;
      }
      if (!v22) {
        return v11;
      }
      uint64_t v6 = v11[1];
      if (!v6)
      {
        long long v7 = v11 + 1;
        goto LABEL_27;
      }
    }
  }
  else
  {
    std::string::size_type v11 = a1 + 1;
LABEL_27:
    uint64_t v23 = operator new(0x48uLL);
    uint64_t v24 = v23 + 4;
    uint64_t v25 = *a4;
    if (*((char *)*a4 + 23) < 0)
    {
      sub_19E13C2D0(v24, *(void **)v25, *((void *)v25 + 1));
    }
    else
    {
      long long v26 = *v25;
      v23[6] = *((void *)v25 + 2);
      *(_OWORD *)uint64_t v24 = v26;
    }
    v23[7] = 0;
    v23[8] = 0;
    void *v23 = 0;
    v23[1] = 0;
    v23[2] = v11;
    char *v7 = v23;
    uint64_t v27 = (uint64_t *)**a1;
    uint64_t v28 = v23;
    if (v27)
    {
      *a1 = v27;
      uint64_t v28 = *v7;
    }
    sub_19E13C8A0(a1[1], v28);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return (uint64_t **)v23;
}

void sub_19E30D528(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19E30D53C()
{
  qword_1E9457D28 = 0;
  unk_1E9457D30 = "MontrealNeuralNetworkState";
  qword_1E9457D38 = 0;
  unk_1E9457D40 = 0;
  qword_1E9457D48 = (uint64_t)sub_19E1403B0;
  unk_1E9457D50 = 0u;
  unk_1E9457D60 = 0u;
  uint64_t result = _CFRuntimeRegisterClass();
  qword_1E9457D88 = result;
  return result;
}

void sub_19E30D598(uint64_t a1)
{
  uint64_t v1 = (void *)sub_19E25BF30(a1);

  operator delete(v1);
}

void sub_19E30D5C4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_19E25BF30(a1);

  operator delete(v1);
}

void sub_19E30D5F0(uint64_t a1)
{
  uint64_t v1 = (void *)sub_19E25E4C4(a1);

  operator delete(v1);
}

void sub_19E30D618(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF0ABE88;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_19E30D638(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF0ABE88;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t sub_19E30D67C(uint64_t a1)
{
  return sub_19E26CFA0(a1 + 24);
}

char *sub_19E30D688(void **a1, long long *a2, long long *a3, int *a4, int *a5)
{
  uint64_t v6 = (unsigned char *)a1[1] - (unsigned char *)*a1;
  unint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492) {
    sub_19E13D694();
  }
  if (0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v7) {
    unint64_t v7 = 0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)) >= 0x249249249249249) {
    unint64_t v12 = 0x492492492492492;
  }
  else {
    unint64_t v12 = v7;
  }
  if (v12)
  {
    if (v12 > 0x492492492492492) {
      sub_19E13C418();
    }
    uint64_t v13 = (char *)operator new(56 * v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = &v13[8 * (v6 >> 3)];
  int v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19E13C2D0(&__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long __dst = *a2;
    uint64_t v32 = *((void *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19E13C2D0(&v29, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v29 = *a3;
    uint64_t v30 = *((void *)a3 + 2);
  }
  int v16 = *a4;
  int v17 = *a5;
  *(_OWORD *)uint64_t v14 = __dst;
  *((void *)v14 + 2) = v32;
  size_t v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((void *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  int v19 = v14 + 56;
  uint64_t v28 = v14 + 56;
  int v21 = (char *)*a1;
  BOOL v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    uint64_t v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      long long v22 = *(_OWORD *)(v20 - 56);
      *((void *)v14 - 5) = *((void *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((void *)v20 - 6) = 0;
      *((void *)v20 - 5) = 0;
      *((void *)v20 - 7) = 0;
      long long v23 = *((_OWORD *)v20 - 2);
      *((void *)v14 - 2) = *((void *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((void *)v20 - 3) = 0;
      *((void *)v20 - 2) = 0;
      *((void *)v20 - 4) = 0;
      *((void *)v14 - 1) = *((void *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    uint64_t v24 = (char *)*a1;
    BOOL v20 = (char *)a1[1];
    int v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    uint64_t v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0) {
LABEL_28:
        }
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      BOOL v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        BOOL v20 = v24;
        break;
      }
    }
  }
  if (v20) {
    operator delete(v20);
  }
  return v19;
}

void sub_19E30D904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19E30D93C((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19E30D93C((uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_19E30D93C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 56;
    if (*(char *)(i - 9) < 0)
    {
      operator delete(*(void **)(i - 32));
      if ((*(char *)(i - 33) & 0x80000000) == 0) {
        continue;
      }
    }
    else if ((*(char *)(i - 33) & 0x80000000) == 0)
    {
      continue;
    }
    operator delete(*(void **)(i - 56));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char *sub_19E30D9C0(void **a1, long long *a2, long long *a3, int *a4, int *a5)
{
  uint64_t v6 = (unsigned char *)a1[1] - (unsigned char *)*a1;
  unint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492) {
    sub_19E13D694();
  }
  if (0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v7) {
    unint64_t v7 = 0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)) >= 0x249249249249249) {
    unint64_t v12 = 0x492492492492492;
  }
  else {
    unint64_t v12 = v7;
  }
  if (v12)
  {
    if (v12 > 0x492492492492492) {
      sub_19E13C418();
    }
    uint64_t v13 = (char *)operator new(56 * v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = &v13[8 * (v6 >> 3)];
  int v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19E13C2D0(&__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long __dst = *a2;
    uint64_t v32 = *((void *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19E13C2D0(&v29, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v29 = *a3;
    uint64_t v30 = *((void *)a3 + 2);
  }
  int v16 = *a4;
  int v17 = *a5;
  *(_OWORD *)uint64_t v14 = __dst;
  *((void *)v14 + 2) = v32;
  size_t v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((void *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  int v19 = v14 + 56;
  uint64_t v28 = v14 + 56;
  int v21 = (char *)*a1;
  BOOL v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    uint64_t v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      long long v22 = *(_OWORD *)(v20 - 56);
      *((void *)v14 - 5) = *((void *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((void *)v20 - 6) = 0;
      *((void *)v20 - 5) = 0;
      *((void *)v20 - 7) = 0;
      long long v23 = *((_OWORD *)v20 - 2);
      *((void *)v14 - 2) = *((void *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((void *)v20 - 3) = 0;
      *((void *)v20 - 2) = 0;
      *((void *)v20 - 4) = 0;
      *((void *)v14 - 1) = *((void *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    uint64_t v24 = (char *)*a1;
    BOOL v20 = (char *)a1[1];
    int v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    uint64_t v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0) {
LABEL_28:
        }
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      BOOL v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        BOOL v20 = v24;
        break;
      }
    }
  }
  if (v20) {
    operator delete(v20);
  }
  return v19;
}

void sub_19E30DC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19E30D93C((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19E30D93C((uint64_t)&a10);
  _Unwind_Resume(a1);
}

char *sub_19E30DC74(void **a1, long long *a2, long long *a3, int *a4, int *a5)
{
  uint64_t v6 = (unsigned char *)a1[1] - (unsigned char *)*a1;
  unint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492) {
    sub_19E13D694();
  }
  if (0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v7) {
    unint64_t v7 = 0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)) >= 0x249249249249249) {
    unint64_t v12 = 0x492492492492492;
  }
  else {
    unint64_t v12 = v7;
  }
  if (v12)
  {
    if (v12 > 0x492492492492492) {
      sub_19E13C418();
    }
    uint64_t v13 = (char *)operator new(56 * v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = &v13[8 * (v6 >> 3)];
  int v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19E13C2D0(&__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long __dst = *a2;
    uint64_t v32 = *((void *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19E13C2D0(&v29, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v29 = *a3;
    uint64_t v30 = *((void *)a3 + 2);
  }
  int v16 = *a4;
  int v17 = *a5;
  *(_OWORD *)uint64_t v14 = __dst;
  *((void *)v14 + 2) = v32;
  size_t v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((void *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  int v19 = v14 + 56;
  uint64_t v28 = v14 + 56;
  int v21 = (char *)*a1;
  BOOL v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    uint64_t v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      long long v22 = *(_OWORD *)(v20 - 56);
      *((void *)v14 - 5) = *((void *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((void *)v20 - 6) = 0;
      *((void *)v20 - 5) = 0;
      *((void *)v20 - 7) = 0;
      long long v23 = *((_OWORD *)v20 - 2);
      *((void *)v14 - 2) = *((void *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((void *)v20 - 3) = 0;
      *((void *)v20 - 2) = 0;
      *((void *)v20 - 4) = 0;
      *((void *)v14 - 1) = *((void *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    uint64_t v24 = (char *)*a1;
    BOOL v20 = (char *)a1[1];
    int v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    uint64_t v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0) {
LABEL_28:
        }
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      BOOL v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        BOOL v20 = v24;
        break;
      }
    }
  }
  if (v20) {
    operator delete(v20);
  }
  return v19;
}

void sub_19E30DEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19E30D93C((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19E30D93C((uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t *sub_19E30DF28(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_10;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (!v2)
  {
    int v5 = 1;
    uint64_t v6 = (uint64_t **)v3[2];
    unint64_t v7 = *v6;
    if (*v6 == v3) {
      goto LABEL_6;
    }
LABEL_11:
    v6[1] = (uint64_t *)v2;
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
LABEL_10:
  int v5 = 0;
  *(void *)(v2 + 16) = v3[2];
  uint64_t v6 = (uint64_t **)v3[2];
  unint64_t v7 = *v6;
  if (*v6 != v3) {
    goto LABEL_11;
  }
LABEL_6:
  *uint64_t v6 = (uint64_t *)v2;
  if (v3 != result)
  {
    unint64_t v7 = v6[1];
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
LABEL_12:
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
    goto LABEL_16;
  }
  unint64_t v7 = 0;
  uint64_t result = (uint64_t *)v2;
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2) {
    goto LABEL_12;
  }
LABEL_16:
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v14 = (uint64_t **)v7[2];
    if (*v14 == v7) {
      break;
    }
    if (*((unsigned char *)v7 + 24))
    {
      int v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }
    else
    {
      *((unsigned char *)v7 + 24) = 1;
      *((unsigned char *)v14 + 24) = 0;
      int v17 = v14[1];
      size_t v18 = (uint64_t *)*v17;
      v14[1] = (uint64_t *)*v17;
      if (v18) {
        v18[2] = (uint64_t)v14;
      }
      v17[2] = (uint64_t)v14[2];
      v14[2][*v14[2] != (void)v14] = (uint64_t)v17;
      *int v17 = (uint64_t)v14;
      v14[2] = v17;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      unint64_t v7 = *(uint64_t **)(*v7 + 8);
      int v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }
    if (!*((unsigned char *)v15 + 24))
    {
      int v19 = (uint64_t *)v7[1];
      if (!v19) {
        goto LABEL_64;
      }
LABEL_63:
      if (*((unsigned char *)v19 + 24))
      {
LABEL_64:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v23 = v15[1];
        uint64_t *v7 = v23;
        if (v23) {
          *(void *)(v23 + 16) = v7;
        }
        void v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        int v19 = v7;
      }
      else
      {
        int v15 = v7;
      }
      uint64_t v27 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v27 + 24);
      *(unsigned char *)(v27 + 24) = 1;
      *((unsigned char *)v19 + 24) = 1;
      uint64_t v28 = *(uint64_t **)(v27 + 8);
      uint64_t v29 = *v28;
      *(void *)(v27 + 8) = *v28;
      if (v29) {
        *(void *)(v29 + 16) = v27;
      }
      v28[2] = *(void *)(v27 + 16);
      *(void *)(*(void *)(v27 + 16) + 8 * (**(void **)(v27 + 16) != v27)) = v28;
      *uint64_t v28 = v27;
      *(void *)(v27 + 16) = v28;
      return result;
    }
LABEL_38:
    int v19 = (uint64_t *)v7[1];
    if (v19 && !*((unsigned char *)v19 + 24)) {
      goto LABEL_63;
    }
    *((unsigned char *)v7 + 24) = 0;
    unint64_t v12 = (uint64_t *)v7[2];
    if (v12 == result)
    {
      unint64_t v12 = result;
LABEL_61:
      *((unsigned char *)v12 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v12 + 24)) {
      goto LABEL_61;
    }
LABEL_24:
    unint64_t v7 = *(uint64_t **)(v12[2] + 8 * (*(void *)v12[2] == (void)v12));
  }
  if (*((unsigned char *)v7 + 24))
  {
    int v16 = (void *)*v7;
    if (!*v7) {
      goto LABEL_49;
    }
LABEL_48:
    if (!*((unsigned char *)v16 + 24)) {
      goto LABEL_67;
    }
  }
  else
  {
    *((unsigned char *)v7 + 24) = 1;
    *((unsigned char *)v14 + 24) = 0;
    BOOL v20 = (uint64_t *)v7[1];
    char *v14 = v20;
    if (v20) {
      v20[2] = (uint64_t)v14;
    }
    v7[2] = (uint64_t)v14[2];
    v14[2][*v14[2] != (void)v14] = (uint64_t)v7;
    v7[1] = (uint64_t)v14;
    v14[2] = v7;
    if (result == (uint64_t *)v14) {
      uint64_t result = v7;
    }
    unint64_t v7 = *v14;
    int v16 = (void *)**v14;
    if (v16) {
      goto LABEL_48;
    }
  }
LABEL_49:
  int v21 = (uint64_t *)v7[1];
  if (!v21 || *((unsigned char *)v21 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    unint64_t v12 = (uint64_t *)v7[2];
    if (*((unsigned char *)v12 + 24)) {
      BOOL v13 = v12 == result;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      goto LABEL_61;
    }
    goto LABEL_24;
  }
  if (v16 && !*((unsigned char *)v16 + 24))
  {
LABEL_67:
    int v21 = v7;
  }
  else
  {
    *((unsigned char *)v21 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v22 = *v21;
    v7[1] = *v21;
    if (v22) {
      *(void *)(v22 + 16) = v7;
    }
    v21[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v21;
    *int v21 = (uint64_t)v7;
    v7[2] = (uint64_t)v21;
    int v16 = v7;
  }
  uint64_t v24 = (uint64_t *)v21[2];
  *((unsigned char *)v21 + 24) = *((unsigned char *)v24 + 24);
  *((unsigned char *)v24 + 24) = 1;
  *((unsigned char *)v16 + 24) = 1;
  uint64_t v25 = *v24;
  uint64_t v26 = *(void *)(*v24 + 8);
  *uint64_t v24 = v26;
  if (v26) {
    *(void *)(v26 + 16) = v24;
  }
  *(void *)(v25 + 16) = v24[2];
  *(void *)(v24[2] + 8 * (*(void *)v24[2] != (void)v24)) = v25;
  *(void *)(v25 + 8) = v24;
  v24[2] = v25;
  return result;
}

char *sub_19E30E2EC(void **a1, long long *a2, long long *a3, int *a4, int *a5)
{
  uint64_t v6 = (unsigned char *)a1[1] - (unsigned char *)*a1;
  unint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492) {
    sub_19E13D694();
  }
  if (0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v7) {
    unint64_t v7 = 0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)) >= 0x249249249249249) {
    unint64_t v12 = 0x492492492492492;
  }
  else {
    unint64_t v12 = v7;
  }
  if (v12)
  {
    if (v12 > 0x492492492492492) {
      sub_19E13C418();
    }
    BOOL v13 = (char *)operator new(56 * v12);
  }
  else
  {
    BOOL v13 = 0;
  }
  uint64_t v14 = &v13[8 * (v6 >> 3)];
  int v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19E13C2D0(&__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long __dst = *a2;
    uint64_t v32 = *((void *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19E13C2D0(&v29, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v29 = *a3;
    uint64_t v30 = *((void *)a3 + 2);
  }
  int v16 = *a4;
  int v17 = *a5;
  *(_OWORD *)uint64_t v14 = __dst;
  *((void *)v14 + 2) = v32;
  size_t v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((void *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  int v19 = v14 + 56;
  uint64_t v28 = v14 + 56;
  int v21 = (char *)*a1;
  BOOL v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    uint64_t v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      long long v22 = *(_OWORD *)(v20 - 56);
      *((void *)v14 - 5) = *((void *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((void *)v20 - 6) = 0;
      *((void *)v20 - 5) = 0;
      *((void *)v20 - 7) = 0;
      long long v23 = *((_OWORD *)v20 - 2);
      *((void *)v14 - 2) = *((void *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((void *)v20 - 3) = 0;
      *((void *)v20 - 2) = 0;
      *((void *)v20 - 4) = 0;
      *((void *)v14 - 1) = *((void *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    uint64_t v24 = (char *)*a1;
    BOOL v20 = (char *)a1[1];
    int v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    uint64_t v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0) {
LABEL_28:
        }
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      BOOL v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        BOOL v20 = v24;
        break;
      }
    }
  }
  if (v20) {
    operator delete(v20);
  }
  return v19;
}

void sub_19E30E568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19E30D93C((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19E30D93C((uint64_t)&a10);
  _Unwind_Resume(a1);
}

char *sub_19E30E5A0(void **a1, long long *a2, long long *a3, int *a4, int *a5)
{
  uint64_t v6 = (unsigned char *)a1[1] - (unsigned char *)*a1;
  unint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492) {
    sub_19E13D694();
  }
  if (0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v7) {
    unint64_t v7 = 0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)) >= 0x249249249249249) {
    unint64_t v12 = 0x492492492492492;
  }
  else {
    unint64_t v12 = v7;
  }
  if (v12)
  {
    if (v12 > 0x492492492492492) {
      sub_19E13C418();
    }
    BOOL v13 = (char *)operator new(56 * v12);
  }
  else
  {
    BOOL v13 = 0;
  }
  uint64_t v14 = &v13[8 * (v6 >> 3)];
  int v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19E13C2D0(&__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long __dst = *a2;
    uint64_t v32 = *((void *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19E13C2D0(&v29, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v29 = *a3;
    uint64_t v30 = *((void *)a3 + 2);
  }
  int v16 = *a4;
  int v17 = *a5;
  *(_OWORD *)uint64_t v14 = __dst;
  *((void *)v14 + 2) = v32;
  size_t v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((void *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  int v19 = v14 + 56;
  uint64_t v28 = v14 + 56;
  int v21 = (char *)*a1;
  BOOL v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    uint64_t v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      long long v22 = *(_OWORD *)(v20 - 56);
      *((void *)v14 - 5) = *((void *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((void *)v20 - 6) = 0;
      *((void *)v20 - 5) = 0;
      *((void *)v20 - 7) = 0;
      long long v23 = *((_OWORD *)v20 - 2);
      *((void *)v14 - 2) = *((void *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((void *)v20 - 3) = 0;
      *((void *)v20 - 2) = 0;
      *((void *)v20 - 4) = 0;
      *((void *)v14 - 1) = *((void *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    uint64_t v24 = (char *)*a1;
    BOOL v20 = (char *)a1[1];
    int v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    uint64_t v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0) {
LABEL_28:
        }
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      BOOL v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        BOOL v20 = v24;
        break;
      }
    }
  }
  if (v20) {
    operator delete(v20);
  }
  return v19;
}

void sub_19E30E81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19E30D93C((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19E30D93C((uint64_t)&a10);
  _Unwind_Resume(a1);
}

void *sub_19E30E854(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  if (v3)
  {
    do
    {
      uint64_t v4 = v3;
      uint64_t v3 = (void *)*v3;
    }
    while (v3);
  }
  else
  {
    int v5 = (void *)a2;
    do
    {
      uint64_t v4 = (void *)v5[2];
      BOOL v6 = *v4 == (void)v5;
      int v5 = v4;
    }
    while (!v6);
  }
  if (*a1 == a2) {
    *a1 = v4;
  }
  unint64_t v7 = (uint64_t *)a1[1];
  --a1[2];
  sub_19E30DF28(v7, (uint64_t *)a2);
  uint64_t v8 = *(void *)(a2 + 56);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 64);
    uint64_t v10 = *(void **)(a2 + 56);
    if (v9 == v8)
    {
LABEL_19:
      *(void *)(a2 + 64) = v8;
      operator delete(v10);
      goto LABEL_20;
    }
    while (1)
    {
      if (*(char *)(v9 - 9) < 0)
      {
        operator delete(*(void **)(v9 - 32));
        if (*(char *)(v9 - 33) < 0) {
LABEL_17:
        }
          operator delete(*(void **)(v9 - 56));
      }
      else if (*(char *)(v9 - 33) < 0)
      {
        goto LABEL_17;
      }
      v9 -= 56;
      if (v9 == v8)
      {
        uint64_t v10 = *(void **)(a2 + 56);
        goto LABEL_19;
      }
    }
  }
LABEL_20:
  if (*(char *)(a2 + 55) < 0) {
    operator delete(*(void **)(a2 + 32));
  }
  operator delete((void *)a2);
  return v4;
}

void sub_19E30ECE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19E30EDC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E30EEA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E30EEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E30EEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E30F044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E30F058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E30F138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E30F14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E30F2F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (v11) {
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E30F368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E30F3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E30F3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E30F5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

__n128 sub_19E30F6BC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *sub_19E30F818(void *a1, uint64_t a2, uint64_t a3, int *__src)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v14 = *(void *)(a2 + 16);
  }
  sub_19E25BD4C((uint64_t)a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_1EF0A9698;
  uint64_t v7 = __src[32];
  uint64_t v8 = __src[36];
  uint64_t v9 = __src[40];
  uint64_t v10 = __src[64];
  uint64_t v11 = __src[68];
  int v15 = 1;
  int64x2_t v16 = vdupq_n_s64(1uLL);
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = v7;
  int v20 = 2;
  int64x2_t v21 = v16;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v22 = v8;
  int v25 = 3;
  int64x2_t v26 = v16;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = v9;
  sub_19E13C5C0((uint64_t)(a1 + 2), &v15, (int *)&v30);
  int v15 = 9;
  int64x2_t v16 = vdupq_n_s64(1uLL);
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = v10;
  int v20 = 10;
  int64x2_t v21 = v16;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v22 = v11;
  sub_19E13C5C0((uint64_t)(a1 + 5), &v15, &v25);
  return a1;
}

void sub_19E30F998(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E30F9AC(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E30F9C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_19E30F9DC(uint64_t *result, int a2)
{
  uint64_t v3 = result;
  int v5 = (uint64_t **)(result + 3);
  uint64_t v4 = (int *)result[3];
  BOOL v6 = (uint64_t **)(result + 3);
  uint64_t v7 = (char *)(result + 3);
  if (v4)
  {
    uint64_t v8 = (int *)result[3];
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (char *)v8;
        int v9 = v8[8];
        if (v9 < 3) {
          break;
        }
        uint64_t v8 = *(int **)v7;
        BOOL v6 = (uint64_t **)v7;
        if (!*(void *)v7) {
          goto LABEL_8;
        }
      }
      if (v9 == 2) {
        break;
      }
      uint64_t v8 = (int *)*((void *)v7 + 1);
      if (!v8)
      {
        BOOL v6 = (uint64_t **)(v7 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    uint64_t v10 = v7;
    uint64_t v7 = (char *)operator new(0x50uLL);
    *((_DWORD *)v7 + 8) = 2;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *((void *)v7 + 9) = 0;
    *(void *)uint64_t v7 = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = v10;
    *BOOL v6 = (uint64_t *)v7;
    uint64_t v11 = *(void *)v3[2];
    unint64_t v12 = (uint64_t *)v7;
    if (v11)
    {
      v3[2] = v11;
      unint64_t v12 = *v6;
    }
    __n128 result = sub_19E13C8A0((uint64_t *)v3[3], v12);
    uint64_t v4 = (int *)v3[3];
    ++v3[4];
  }
  uint64_t v13 = *((void *)v7 + 7);
  uint64_t v14 = *((void *)v7 + 9);
  int v15 = (char *)v5;
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        int v15 = (char *)v4;
        int v16 = v4[8];
        if (v16 < 2) {
          break;
        }
        uint64_t v4 = *(int **)v15;
        int v5 = (uint64_t **)v15;
        if (!*(void *)v15) {
          goto LABEL_18;
        }
      }
      if (v16 == 1) {
        break;
      }
      uint64_t v4 = (int *)*((void *)v15 + 1);
      if (!v4)
      {
        int v5 = (uint64_t **)(v15 + 8);
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    uint64_t v17 = v15;
    int v15 = (char *)operator new(0x50uLL);
    *((_DWORD *)v15 + 8) = 1;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    *((void *)v15 + 9) = 0;
    *(void *)int v15 = 0;
    *((void *)v15 + 1) = 0;
    *((void *)v15 + 2) = v17;
    void *v5 = (uint64_t *)v15;
    uint64_t v18 = *(void *)v3[2];
    uint64_t v19 = (uint64_t *)v15;
    if (v18)
    {
      v3[2] = v18;
      uint64_t v19 = *v5;
    }
    __n128 result = sub_19E13C8A0((uint64_t *)v3[3], v19);
    ++v3[4];
  }
  uint64_t v20 = *((void *)v15 + 8);
  uint64_t v21 = *((void *)v15 + 9);
  uint64_t v23 = (uint64_t **)(v3 + 6);
  uint64_t v22 = (char *)v3[6];
  if (v22)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v24 = v22;
        int v25 = *((_DWORD *)v22 + 8);
        if (v25 <= a2) {
          break;
        }
        uint64_t v22 = *(char **)v24;
        uint64_t v23 = (uint64_t **)v24;
        if (!*(void *)v24) {
          goto LABEL_28;
        }
      }
      if (v25 >= a2) {
        break;
      }
      uint64_t v22 = (char *)*((void *)v24 + 1);
      if (!v22)
      {
        uint64_t v23 = (uint64_t **)(v24 + 8);
        goto LABEL_28;
      }
    }
  }
  else
  {
    uint64_t v24 = (char *)(v3 + 6);
LABEL_28:
    int64x2_t v26 = v24;
    uint64_t v24 = (char *)operator new(0x50uLL);
    *((_DWORD *)v24 + 8) = a2;
    *(_OWORD *)(v24 + 40) = 0u;
    *(_OWORD *)(v24 + 56) = 0u;
    *((void *)v24 + 9) = 0;
    *(void *)uint64_t v24 = 0;
    *((void *)v24 + 1) = 0;
    *((void *)v24 + 2) = v26;
    void *v23 = (uint64_t *)v24;
    uint64_t v27 = *(void *)v3[5];
    uint64_t v28 = (uint64_t *)v24;
    if (v27)
    {
      v3[5] = v27;
      uint64_t v28 = *v23;
    }
    __n128 result = sub_19E13C8A0((uint64_t *)v3[6], v28);
    ++v3[7];
  }
  int64x2_t v29 = vdupq_n_s64(1uLL);
  if (a2 == 10) {
    uint64_t v30 = v14;
  }
  else {
    uint64_t v30 = v21;
  }
  *(int64x2_t *)(v24 + 40) = v29;
  if (a2 == 10) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = v13;
  }
  *((void *)v24 + 7) = v31;
  *((void *)v24 + 8) = v20;
  *((void *)v24 + 9) = v30;
  return result;
}

BOOL sub_19E30FC30(uint64_t a1, void *a2, int a3)
{
  if ((a3 - 8) < 0xFFFFFFF9) {
    return 0;
  }
  uint64_t v8 = (uint64_t **)(a1 + 24);
  uint64_t v7 = *(char **)(a1 + 24);
  if (v7)
  {
    while (1)
    {
      while (1)
      {
        int v9 = v7;
        int v10 = *((_DWORD *)v7 + 8);
        if (v10 <= a3) {
          break;
        }
        uint64_t v7 = *(char **)v9;
        uint64_t v8 = (uint64_t **)v9;
        if (!*(void *)v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= a3) {
        break;
      }
      uint64_t v7 = (char *)*((void *)v9 + 1);
      if (!v7)
      {
        uint64_t v8 = (uint64_t **)(v9 + 8);
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v9 = (char *)(a1 + 24);
LABEL_10:
    uint64_t v11 = v9;
    int v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a3;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((void *)v9 + 9) = 0;
    *(void *)int v9 = 0;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = v11;
    *uint64_t v8 = (uint64_t *)v9;
    uint64_t v12 = **(void **)(a1 + 16);
    uint64_t v13 = (uint64_t *)v9;
    if (v12)
    {
      *(void *)(a1 + 16) = v12;
      uint64_t v13 = *v8;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 24), v13);
    ++*(void *)(a1 + 32);
  }
  return *((void *)v9 + 5) != *a2
      || *((void *)v9 + 6) != a2[1]
      || *((void *)v9 + 7) != a2[2]
      || *((void *)v9 + 8) != a2[3]
      || *((void *)v9 + 9) != a2[4];
}

void sub_19E30FD50(uint64_t a1)
{
  uint64_t v1 = (void *)sub_19E25BF30(a1);

  operator delete(v1);
}

void *sub_19E30FD78(void *a1, uint64_t a2, uint64_t a3, void *__src)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
  }
  sub_19E25BD4C((uint64_t)a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_1EF0A9978;
  a1[127] = __src[56];
  LODWORD(v7) = *((_DWORD *)__src + 32);
  if ((int)v7 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v7;
  }
  int v12 = 1;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v14 = v7;
  int64x2_t v15 = v13;
  sub_19E13C5C0((uint64_t)(a1 + 2), &v12, (int *)&v16);
  uint64_t v8 = *((int *)__src + 64);
  int v12 = 9;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  int64x2_t v15 = 0uLL;
  uint64_t v14 = v8;
  sub_19E13C5C0((uint64_t)(a1 + 5), &v12, (int *)&v16);
  return a1;
}

void sub_19E30FEC4(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E30FED8(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E30FEEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E30FF08(void *a1, uint64_t a2)
{
  uint64_t v4 = (void **)a1[20];
  int v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      operator delete(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    BOOL v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        int v9 = (uint64_t *)v6[1];
        operator delete(v6);
        BOOL v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  int v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 48);

  return v10(a2, a1);
}

int64x2_t sub_19E30FFF0(uint64_t a1, int a2)
{
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
  uint64_t v7 = (uint64_t **)(a1 + 48);
  BOOL v6 = *(char **)(a1 + 48);
  uint64_t v8 = *(int *)(a1 + 568);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        int v9 = v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a2) {
          break;
        }
        BOOL v6 = *(char **)v9;
        uint64_t v7 = (uint64_t **)v9;
        if (!*(void *)v9) {
          goto LABEL_8;
        }
      }
      if (v10 >= a2) {
        break;
      }
      BOOL v6 = (char *)*((void *)v9 + 1);
      if (!v6)
      {
        uint64_t v7 = (uint64_t **)(v9 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    int v9 = (char *)(a1 + 48);
LABEL_8:
    uint64_t v11 = v9;
    int v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a2;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((void *)v9 + 9) = 0;
    *(void *)int v9 = 0;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = v11;
    char *v7 = (uint64_t *)v9;
    uint64_t v12 = **(void **)(a1 + 40);
    int64x2_t v13 = (uint64_t *)v9;
    if (v12)
    {
      *(void *)(a1 + 40) = v12;
      int64x2_t v13 = *v7;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 48), v13);
    ++*(void *)(a1 + 56);
  }
  int64x2_t result = vdupq_n_s64(1uLL);
  *(int64x2_t *)(v9 + 40) = result;
  *((void *)v9 + 7) = v8;
  *((void *)v9 + 8) = v4;
  *((void *)v9 + 9) = v5;
  return result;
}

void *sub_19E310140(void *a1, uint64_t a2, uint64_t a3, void *__src)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v11 = *(void *)(a2 + 16);
  }
  sub_19E25E2E0((uint64_t)a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_1EF0A9808;
  a1[127] = __src[56];
  LODWORD(v7) = *((_DWORD *)__src + 32);
  if ((int)v7 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v7;
  }
  int v12 = 1;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  uint64_t v14 = v7;
  int64x2_t v15 = v13;
  sub_19E13C5C0((uint64_t)(a1 + 2), &v12, (int *)&v16);
  uint64_t v8 = *((int *)__src + 64);
  int v12 = 9;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  int64x2_t v15 = 0uLL;
  uint64_t v14 = v8;
  sub_19E13C5C0((uint64_t)(a1 + 5), &v12, (int *)&v16);
  return a1;
}

void sub_19E31028C(_Unwind_Exception *a1)
{
  sub_19E25E4C4(v1);
  _Unwind_Resume(a1);
}

void sub_19E3102A0(_Unwind_Exception *a1)
{
  sub_19E25E4C4(v1);
  _Unwind_Resume(a1);
}

void sub_19E3102B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E3102D0(void *a1, uint64_t a2)
{
  int v4 = (void **)a1[20];
  int v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      operator delete(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    BOOL v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        int v9 = (uint64_t *)v6[1];
        operator delete(v6);
        BOOL v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  int v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 152);

  return v10(a2, a1);
}

int64x2_t sub_19E3103B8(uint64_t a1, int a2)
{
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 1);
  uint64_t v7 = (uint64_t **)(a1 + 48);
  BOOL v6 = *(char **)(a1 + 48);
  uint64_t v8 = *(int *)(a1 + 568);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        int v9 = v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a2) {
          break;
        }
        BOOL v6 = *(char **)v9;
        uint64_t v7 = (uint64_t **)v9;
        if (!*(void *)v9) {
          goto LABEL_8;
        }
      }
      if (v10 >= a2) {
        break;
      }
      BOOL v6 = (char *)*((void *)v9 + 1);
      if (!v6)
      {
        uint64_t v7 = (uint64_t **)(v9 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    int v9 = (char *)(a1 + 48);
LABEL_8:
    uint64_t v11 = v9;
    int v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a2;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((void *)v9 + 9) = 0;
    *(void *)int v9 = 0;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = v11;
    char *v7 = (uint64_t *)v9;
    uint64_t v12 = **(void **)(a1 + 40);
    int64x2_t v13 = (uint64_t *)v9;
    if (v12)
    {
      *(void *)(a1 + 40) = v12;
      int64x2_t v13 = *v7;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 48), v13);
    ++*(void *)(a1 + 56);
  }
  int64x2_t result = vdupq_n_s64(1uLL);
  *(int64x2_t *)(v9 + 40) = result;
  *((void *)v9 + 7) = v8;
  *((void *)v9 + 8) = v4;
  *((void *)v9 + 9) = v5;
  return result;
}

void sub_19E310508(void *a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = a1;
    uint64_t Count = objc_msgSend_readCount(v8, v2, v3, v4);
    objc_msgSend_setReadCount_(v8, v6, Count + 1, v7);
  }
}

void sub_19E310588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31059C(void *a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = a1;
    uint64_t Count = objc_msgSend_readCount(v8, v2, v3, v4);
    objc_msgSend_setReadCount_(v8, v6, Count - 1, v7);
  }
}

void sub_19E31061C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E310630(void *a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    return objc_msgSend_setReadCount_(a1, v3, 0, v4);
  }
  return result;
}

void sub_19E310690(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1, v2, (uint64_t)&v9, (uint64_t)v13, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend_incrementReadCount(*(void **)(*((void *)&v9 + 1) + 8 * v8++), v3, v4, v5, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1, v3, (uint64_t)&v9, (uint64_t)v13, 16);
    }
    while (v6);
  }
}

void sub_19E310780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E3107A4(uint64_t a1)
{
  size_t v1 = 4 * a1;
  uint64_t v2 = malloc_type_malloc(4 * a1, 0xD4C96417uLL);

  bzero(v2, v1);
}

void *sub_19E3107E8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_19E30F818(a1, a2, a3, (int *)a4);
  *uint64_t result = &unk_1EF0AA948;
  result[128] = *(void *)(a4 + 576);
  *((_DWORD *)result + 264) = *(_DWORD *)(a4 + 320);
  uint64_t v6 = *(void *)(a4 + 448);
  if ((*(unsigned char *)(a4 + 120) & 0x40) != 0)
  {
    result[127] = v6;
    uint64_t v7 = *(void *)(a4 + 456);
  }
  else
  {
    result[129] = v6;
    result[130] = *(void *)(a4 + 456);
    uint64_t v7 = *(void *)(a4 + 464);
  }
  result[131] = v7;
  return result;
}

uint64_t sub_19E310878(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)a1[20];
  uint64_t v5 = (void *)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      (*(void (**)(void))(*(void *)*v4 + 8))(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    uint64_t v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        long long v9 = (uint64_t *)v6[1];
        operator delete(v6);
        uint64_t v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  long long v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 96);

  return v10(a2, a1);
}

uint64_t sub_19E310980(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(uint64_t (**)(void *, uint64_t))(*a1 + 216))(a1, 2);
  sub_19E25D6DC((uint64_t)a1);
  (*(void (**)(void *, uint64_t, uint64_t))(*a1 + 312))(a1, a3, v5);
  unint64_t v6 = a1[21] - a1[20];
  if ((int)(v6 >> 3) >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v6 & 0x7FFFFFFF8;
    do
    {
      (*(void (**)(void, uint64_t))(**(void **)(a1[20] + v7) + 16))(*(void *)(a1[20] + v7), a3);
      v7 += 8;
    }
    while (v8 != v7);
  }
  sub_19E25D738((uint64_t)a1, a3);
  long long v9 = *(uint64_t (**)(void *))(*a1 + 32);

  return v9(a1);
}

void sub_19E310AC4(uint64_t a1)
{
  size_t v1 = (void *)sub_19E25BF30(a1);

  operator delete(v1);
}

void sub_19E310AEC(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  signed int v5 = *((_DWORD *)a1 + 6);
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v48 = 0;
  if (v5)
  {
    if (v5 < 0) {
      sub_19E13D694();
    }
    uint64_t v7 = (char *)operator new(8 * v5);
    bzero(v7, 8 * v5);
    unint64_t v8 = 0;
    long long v9 = &v7[8 * v5];
    uint64_t v10 = *a1;
    if (v5 < 4) {
      goto LABEL_47;
    }
    if ((unint64_t)&v7[-v10] < 0x20) {
      goto LABEL_47;
    }
    uint64_t v11 = 0;
    unint64_t v8 = v5 & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v12 = v8;
    do
    {
      long long v13 = *(_OWORD *)(v10 + v11 + 16);
      uint64_t v14 = &v7[v11];
      *(_OWORD *)uint64_t v14 = *(_OWORD *)(v10 + v11);
      *((_OWORD *)v14 + 1) = v13;
      v11 += 32;
      v12 -= 4;
    }
    while (v12);
    if (v8 != v5)
    {
LABEL_47:
      do
      {
        *(void *)&v7[8 * v8] = *(void *)(v10 + 8 * v8);
        ++v8;
      }
      while (v5 != v8);
    }
  }
  else
  {
    long long v9 = 0;
    uint64_t v7 = 0;
  }
  sub_19E310EC0(a2, (uint64_t)&v42);
  long long v36 = 0;
  long long v37 = 0;
  long long v35 = 0;
  int64_t v15 = v9 - v7;
  if (v9 != v7)
  {
    if (v15 < 0) {
      sub_19E13D694();
    }
    uint64_t v16 = (char *)operator new(v9 - v7);
    long long v35 = v16;
    long long v37 = &v16[8 * (v15 >> 3)];
    memcpy(v16, v7, v15);
    long long v36 = v37;
    signed int v38 = v5;
    uint64_t v32 = 0;
    long long v33 = 0;
    uint64_t v31 = 0;
    uint64_t v17 = v42;
    int64_t v18 = v43 - (unsigned char *)v42;
    if (v43 != v42) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v19 = 0;
    goto LABEL_18;
  }
  uint64_t v16 = 0;
  signed int v38 = v5;
  uint64_t v32 = 0;
  long long v33 = 0;
  uint64_t v31 = 0;
  uint64_t v17 = v42;
  int64_t v18 = v43 - (unsigned char *)v42;
  if (v43 == v42) {
    goto LABEL_17;
  }
LABEL_14:
  if (v18 < 0) {
    sub_19E13D694();
  }
  uint64_t v19 = (double *)operator new(v18);
  uint64_t v31 = v19;
  long long v33 = &v19[v18 >> 3];
  memcpy(v19, v17, v18);
  uint64_t v32 = v33;
LABEL_18:
  int v34 = v44;
  uint64_t v28 = 0;
  int64x2_t v29 = 0;
  uint64_t v27 = 0;
  uint64_t v20 = __p;
  int64_t v21 = v46 - (unsigned char *)__p;
  if (v46 == __p)
  {
    uint64_t v22 = 0;
  }
  else
  {
    if (v21 < 0) {
      sub_19E13D694();
    }
    uint64_t v22 = (char *)operator new(v46 - (unsigned char *)__p);
    uint64_t v27 = v22;
    int64x2_t v29 = &v22[8 * (v21 >> 3)];
    memcpy(v22, v20, v21);
    uint64_t v28 = v29;
  }
  int v30 = v47;
  sub_19E311008((uint64_t)&v35, (const double **)&v31, (uint64_t)&v27, (uint64_t)&v39);
  if (v22)
  {
    uint64_t v28 = v22;
    operator delete(v22);
  }
  if (v19)
  {
    uint64_t v32 = v19;
    operator delete(v19);
  }
  if (v16)
  {
    long long v36 = v16;
    operator delete(v16);
  }
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  uint64_t v23 = v39;
  int64_t v24 = v40 - v39;
  if (v40 != v39)
  {
    if (v24 < 0) {
      sub_19E13D694();
    }
    int v25 = (char *)operator new(v40 - v39);
    *(void *)a3 = v25;
    int64x2_t v26 = &v25[8 * (v24 >> 3)];
    *(void *)(a3 + 16) = v26;
    memcpy(v25, v23, v24);
    *(void *)(a3 + 8) = v26;
  }
  *(_DWORD *)(a3 + 24) = v41;
  if (v23)
  {
    long long v40 = v23;
    operator delete(v23);
  }
  if (__p)
  {
    long long v46 = __p;
    operator delete(__p);
  }
  if (v42)
  {
    long long v43 = v42;
    operator delete(v42);
  }
  if (v7) {
    operator delete(v7);
  }
}

void sub_19E310DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  int64x2_t v29 = v28;
  if (v29) {
    operator delete(v29);
  }
  if (v27) {
    operator delete(v27);
  }
  if (v26) {
    operator delete(v26);
  }
  sub_19E242654((uint64_t)&a25);
  if (v25) {
    operator delete(v25);
  }
  _Unwind_Resume(a1);
}

void sub_19E310EA4(void *a1)
{
  uint64_t v3 = *(void **)(v1 - 112);
  if (v3)
  {
    *(void *)(v1 - 104) = v3;
    operator delete(v3);
  }
  sub_19E13A9BC(a1);
}

void sub_19E310EC0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  signed int v5 = *(const void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  int64_t v6 = v4 - *(void *)a1;
  if (v4 != *(void *)a1)
  {
    if (v6 < 0) {
      sub_19E13D694();
    }
    uint64_t v7 = (char *)operator new(v4 - *(void *)a1);
    unint64_t v8 = &v7[8 * (v6 >> 3)];
    int64_t v18 = v7;
    uint64_t v20 = v8;
    memcpy(v7, v5, v6);
    uint64_t v19 = v8;
  }
  int v21 = *(_DWORD *)(a1 + 24);
  int64_t v15 = 0;
  uint64_t v16 = 0;
  std::string __p = 0;
  uint64_t v10 = *(unsigned char **)(a1 + 32);
  long long v9 = *(unsigned char **)(a1 + 40);
  int64_t v11 = v9 - v10;
  if (v9 != v10)
  {
    if (v11 < 0) {
      sub_19E13D694();
    }
    unint64_t v12 = (char *)operator new(v9 - v10);
    long long v13 = &v12[8 * (v11 >> 3)];
    std::string __p = v12;
    uint64_t v16 = v13;
    memcpy(v12, v10, v11);
    int64_t v15 = v13;
  }
  int v17 = *(_DWORD *)(a1 + 56);
  sub_19E248EBC(a2, (uint64_t)&v18, (uint64_t)&__p);
  if (__p)
  {
    int64_t v15 = __p;
    operator delete(__p);
  }
  if (v18)
  {
    uint64_t v19 = v18;
    operator delete(v18);
  }
}

void sub_19E310FD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E311008(uint64_t a1@<X0>, const double **a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  long long v75 = 0;
  long long v76 = 0;
  long long v74 = 0;
  long long v9 = *(float64x2_t **)a3;
  uint64_t v8 = *(void *)(a3 + 8);
  int64_t v10 = v8 - *(void *)a3;
  if (v8 == *(void *)a3)
  {
    unint64_t v12 = 0;
    int64_t v11 = 0;
  }
  else
  {
    if (v10 < 0) {
      sub_19E13D694();
    }
    int64_t v11 = (char *)operator new(v8 - *(void *)a3);
    unint64_t v12 = &v11[8 * (v10 >> 3)];
    long long v74 = v11;
    long long v76 = v12;
    memcpy(v11, v9, v10);
    long long v75 = v12;
  }
  long long v61 = a2;
  long long v62 = (float64x2_t **)a3;
  signed int v13 = *(_DWORD *)(a3 + 24);
  signed int v77 = v13;
  vDSP_vsubD(*a2, 1, (const double *)v11, 1, (double *)v11, 1, v13);
  long long v78 = 0;
  long long v79 = 0;
  BOOL v80 = 0;
  int64_t v14 = v12 - v11;
  if (v12 == v11)
  {
    uint64_t v16 = 0;
    int64_t v15 = 0;
  }
  else
  {
    if (v14 < 0) {
      sub_19E13D694();
    }
    int64_t v15 = (char *)operator new(v12 - v11);
    uint64_t v16 = &v15[8 * (v14 >> 3)];
    long long v78 = v15;
    BOOL v80 = v16;
    memcpy(v15, v11, v14);
    long long v79 = v16;
  }
  signed int v81 = v13;
  double __B = 10.0;
  vDSP_vsdivD((const double *)v15, 1, &__B, (double *)v15, 1, v13);
  long long v67 = 0;
  long long v68 = 0;
  long long v69 = 0;
  int64_t v17 = v16 - v15;
  if (v16 != v15)
  {
    if (v17 < 0) {
      sub_19E13D694();
    }
    int64_t v18 = (char *)operator new(v16 - v15);
    long long v67 = v18;
    long long v69 = &v18[8 * (v17 >> 3)];
    memcpy(v18, v15, v17);
    long long v68 = &v18[8 * (v17 >> 3)];
    signed int v70 = v13;
    long long v83 = 0;
    long long v84 = 0;
    long long v82 = 0;
    if (!v13)
    {
      uint64_t v19 = 0;
      signed int v85 = 0;
      long long v68 = v18;
      operator delete(v18);
      if (!v15) {
        goto LABEL_24;
      }
LABEL_23:
      long long v79 = v15;
      operator delete(v15);
      goto LABEL_24;
    }
LABEL_15:
    if (v13 < 0) {
      sub_19E13D694();
    }
    uint64_t v19 = (char *)operator new(8 * v13);
    long long v82 = v19;
    long long v84 = &v19[8 * v13];
    bzero(v19, 8 * v13);
    long long v83 = &v19[8 * v13];
    signed int v85 = v13;
    if (v13 >= 4)
    {
      uint64_t v21 = 0;
      unint64_t v20 = v13 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v22 = v20;
      do
      {
        long long v23 = *(_OWORD *)&v18[v21 + 16];
        int64_t v24 = &v19[v21];
        *(_OWORD *)int64_t v24 = *(_OWORD *)&v18[v21];
        *((_OWORD *)v24 + 1) = v23;
        v21 += 32;
        v22 -= 4;
      }
      while (v22);
      if (v20 == v13)
      {
LABEL_22:
        long long v68 = v18;
        operator delete(v18);
        if (!v15) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v20 = 0;
    }
    do
    {
      *(void *)&v19[8 * v20] = *(void *)&v18[8 * v20];
      ++v20;
    }
    while (v13 != v20);
    goto LABEL_22;
  }
  int64_t v18 = 0;
  signed int v70 = v13;
  long long v83 = 0;
  long long v84 = 0;
  long long v82 = 0;
  if (v13) {
    goto LABEL_15;
  }
  uint64_t v19 = 0;
  signed int v85 = 0;
  if (v15) {
    goto LABEL_23;
  }
LABEL_24:
  if (v11)
  {
    long long v75 = v11;
    operator delete(v11);
  }
  uint64_t v25 = *(int *)(a1 + 24);
  long long v67 = 0;
  long long v68 = 0;
  long long v69 = 0;
  if (v25)
  {
    if ((v25 & 0x80000000) != 0) {
      sub_19E13D694();
    }
    size_t v26 = 8 * v25;
    uint64_t v27 = operator new(8 * v25);
    bzero(v27, v26);
  }
  else
  {
    uint64_t v27 = 0;
  }
  bzero(&v67, 0x9F0uLL);
  sub_19E246588((uint64_t)&v67);
  long long v72 = xmmword_19E351810;
  char v73 = 0;
  uint64_t v28 = *(unsigned int *)(a1 + 24);
  if ((int)v28 >= 1)
  {
    int64x2_t v29 = (double *)v27;
    int v30 = (uint64_t *)v19;
    do
    {
      uint64_t v31 = *v30;
      *(void *)&long long v72 = 0;
      *((void *)&v72 + 1) = v31;
      char v73 = 0;
      *v29++ = sub_19E24880C((uint64_t)&v72, (uint64_t)&v67, (double *)&v72);
      ++v30;
      --v28;
    }
    while (v28);
  }
  long long v33 = *(const void **)a1;
  uint64_t v32 = *(void *)(a1 + 8);
  int64_t v34 = v32 - *(void *)a1;
  if (v32 == *(void *)a1)
  {
    long long v36 = 0;
    long long v35 = 0;
  }
  else
  {
    if (v34 < 0) {
      sub_19E13D694();
    }
    long long v35 = (char *)operator new(v32 - *(void *)a1);
    long long v36 = &v35[8 * (v34 >> 3)];
    memcpy(v35, v33, v34);
  }
  signed int v37 = *(_DWORD *)(a1 + 24);
  vDSP_vaddD((const double *)v35, 1, (const double *)v27, 1, (double *)v35, 1, v37);
  double __B = 0.0;
  long long v64 = 0;
  long long v65 = 0;
  int64_t v38 = v36 - v35;
  if (v36 != v35)
  {
    if (v38 < 0) {
      sub_19E13D694();
    }
    long long v39 = (char *)operator new(v36 - v35);
    *(void *)&double __B = v39;
    long long v65 = &v39[8 * (v38 >> 3)];
    memcpy(v39, v35, v38);
    long long v64 = &v39[8 * (v38 >> 3)];
    signed int v66 = v37;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
    *(void *)a4 = 0;
    if (!v37)
    {
      long long v40 = 0;
      *(_DWORD *)(a4 + 24) = 0;
      long long v64 = v39;
      operator delete(v39);
      if (!v35) {
        goto LABEL_52;
      }
LABEL_51:
      operator delete(v35);
      goto LABEL_52;
    }
LABEL_43:
    if (v37 < 0) {
      sub_19E13D694();
    }
    long long v40 = (float64x2_t *)operator new(8 * v37);
    *(void *)a4 = v40;
    *(void *)(a4 + 16) = (char *)v40 + 8 * v37;
    bzero(v40, 8 * v37);
    *(void *)(a4 + 8) = (char *)v40 + 8 * v37;
    *(_DWORD *)(a4 + 24) = v37;
    if (v37 >= 4)
    {
      uint64_t v42 = 0;
      unint64_t v41 = v37 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v43 = v41;
      do
      {
        long long v44 = *(_OWORD *)&v39[v42 * 16 + 16];
        f64 = (_OWORD *)v40[v42].f64;
        _OWORD *f64 = *(_OWORD *)&v39[v42 * 16];
        f64[1] = v44;
        v42 += 2;
        v43 -= 4;
      }
      while (v43);
      if (v41 == v37)
      {
LABEL_50:
        long long v64 = v39;
        operator delete(v39);
        if (!v35) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
    }
    else
    {
      unint64_t v41 = 0;
    }
    do
    {
      v40->f64[v41] = *(float64_t *)&v39[8 * v41];
      ++v41;
    }
    while (v37 != v41);
    goto LABEL_50;
  }
  long long v39 = 0;
  signed int v66 = v37;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)a4 = 0;
  if (v37) {
    goto LABEL_43;
  }
  long long v40 = 0;
  *(_DWORD *)(a4 + 24) = 0;
  if (v35) {
    goto LABEL_51;
  }
LABEL_52:
  uint64_t v46 = *(unsigned int *)(a1 + 24);
  if ((int)v46 < 1) {
    goto LABEL_57;
  }
  int v47 = (float64x2_t *)*v61;
  uint64_t v48 = *v62;
  if (v46 < 6)
  {
    uint64_t v49 = 0;
LABEL_55:
    uint64_t v50 = v46 - v49;
    uint64_t v51 = v49 << 32;
    do
    {
      *(double *)((char *)v40->f64 + (v51 >> 29)) = fmax(fmin(*(double *)((char *)v48->f64 + (v51 >> 29)), *(double *)((char *)v40->f64 + (v51 >> 29))), *(double *)((char *)v47->f64 + (v51 >> 29)));
      v51 += 0x100000000;
      --v50;
    }
    while (v50);
    goto LABEL_57;
  }
  uint64_t v49 = 0;
  long long v52 = (float64x2_t *)((char *)v40 + 8 * v46);
  BOOL v54 = v40 < (float64x2_t *)&v48->f64[v46] && v48 < v52;
  if (v47 < v52 && v40 < (float64x2_t *)&v47->f64[v46]) {
    goto LABEL_55;
  }
  if (v54) {
    goto LABEL_55;
  }
  uint64_t v49 = v46 & 0x7FFFFFFC;
  long long v56 = v48 + 1;
  long long v57 = v47 + 1;
  long long v58 = v40 + 1;
  uint64_t v59 = v46 & 0xFFFFFFFC;
  do
  {
    float64x2_t v60 = vmaxnmq_f64(vminnmq_f64(*v56, *v58), *v57);
    v58[-1] = vmaxnmq_f64(vminnmq_f64(v56[-1], v58[-1]), v57[-1]);
    float64x2_t *v58 = v60;
    v56 += 2;
    v57 += 2;
    v58 += 2;
    v59 -= 4;
  }
  while (v59);
  if (v49 != v46) {
    goto LABEL_55;
  }
LABEL_57:
  std::random_device::~random_device(&v71);
  if (v27) {
    operator delete(v27);
  }
  if (v19)
  {
    long long v83 = v19;
    operator delete(v19);
  }
}

void sub_19E311658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  if (v23) {
    operator delete(v23);
  }
  std::random_device::~random_device((std::random_device *)&STACK[0xA20]);
  if (v22) {
    operator delete(v22);
  }
  if (v21)
  {
    *(void *)(v24 - 112) = v21;
    operator delete(v21);
  }
  _Unwind_Resume(a1);
}

void sub_19E311780(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *((unsigned int *)a1 + 6);
  std::random_device v71 = 0;
  long long v72 = 0;
  signed int v70 = 0;
  if (!v5)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    int v73 = 0;
    goto LABEL_11;
  }
  if ((v5 & 0x80000000) != 0) {
    sub_19E13D694();
  }
  uint64_t v7 = (char *)operator new(8 * (int)v5);
  signed int v70 = v7;
  long long v72 = &v7[8 * (int)v5];
  bzero(v7, 8 * (int)v5);
  uint64_t v8 = v72;
  std::random_device v71 = v72;
  int v73 = v5;
  uint64_t v9 = *a1;
  if (v5 < 8)
  {
    uint64_t v10 = 0;
LABEL_9:
    uint64_t v19 = v5 - v10;
    uint64_t v20 = v10 << 32;
    do
    {
      *(double *)&v7[v20 >> 29] = (double)*(int *)(v9 + (v20 >> 30));
      v20 += 0x100000000;
      --v19;
    }
    while (v19);
    goto LABEL_11;
  }
  uint64_t v11 = 0;
  uint64_t v10 = v5 & 0xFFFFFFF8;
  uint64_t v12 = v9 + 16;
  do
  {
    long long v13 = *(_OWORD *)(v12 - 16);
    v14.i64[0] = (int)v13;
    v14.i64[1] = SDWORD1(v13);
    float64x2_t v15 = vcvtq_f64_s64(v14);
    v14.i64[0] = SDWORD2(v13);
    v14.i64[1] = SHIDWORD(v13);
    float64x2_t v16 = vcvtq_f64_s64(v14);
    v14.i64[0] = (int)*(_OWORD *)v12;
    v14.i64[1] = (int)HIDWORD(*(void *)v12);
    float64x2_t v17 = vcvtq_f64_s64(v14);
    v14.i64[0] = (int)*(void *)(v12 + 8);
    v14.i64[1] = (int)HIDWORD(*(_OWORD *)v12);
    int64_t v18 = (float64x2_t *)&v7[v11];
    float64x2_t *v18 = v15;
    v18[1] = v16;
    v18[2] = v17;
    v18[3] = vcvtq_f64_s64(v14);
    v11 += 64;
    v12 += 32;
  }
  while (((8 * v5) & 0x7FFFFFFC0) != v11);
  if (v10 != v5) {
    goto LABEL_9;
  }
LABEL_11:
  sub_19E311D20(a2, (uint64_t)&v64);
  uint64_t v59 = 0;
  float64x2_t v60 = 0;
  long long v58 = 0;
  int64_t v21 = v8 - v7;
  if (v8 != v7)
  {
    if (v21 < 0) {
      sub_19E13D694();
    }
    unint64_t v22 = (char *)operator new(v8 - v7);
    long long v58 = v22;
    float64x2_t v60 = &v22[8 * (v21 >> 3)];
    memcpy(v22, v7, v21);
    uint64_t v59 = v60;
    int v61 = v5;
    long long v55 = 0;
    long long v56 = 0;
    BOOL v54 = 0;
    long long v23 = v64;
    int64_t v24 = v65 - (unsigned char *)v64;
    if (v65 != v64) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v25 = 0;
    goto LABEL_18;
  }
  unint64_t v22 = 0;
  int v61 = v5;
  long long v55 = 0;
  long long v56 = 0;
  BOOL v54 = 0;
  long long v23 = v64;
  int64_t v24 = v65 - (unsigned char *)v64;
  if (v65 == v64) {
    goto LABEL_17;
  }
LABEL_14:
  if (v24 < 0) {
    sub_19E13D694();
  }
  uint64_t v25 = (double *)operator new(v24);
  BOOL v54 = v25;
  long long v56 = &v25[v24 >> 3];
  memcpy(v25, v23, v24);
  long long v55 = v56;
LABEL_18:
  int v57 = v66;
  uint64_t v51 = 0;
  long long v52 = 0;
  uint64_t v50 = 0;
  size_t v26 = v67;
  int64_t v27 = v68 - (unsigned char *)v67;
  if (v68 == v67)
  {
    uint64_t v28 = 0;
  }
  else
  {
    if (v27 < 0) {
      sub_19E13D694();
    }
    uint64_t v28 = (char *)operator new(v68 - (unsigned char *)v67);
    uint64_t v50 = v28;
    long long v52 = &v28[8 * (v27 >> 3)];
    memcpy(v28, v26, v27);
    uint64_t v51 = v52;
  }
  int v53 = v69;
  sub_19E311008((uint64_t)&v58, (const double **)&v54, (uint64_t)&v50, (uint64_t)__p);
  if (v28)
  {
    uint64_t v51 = v28;
    operator delete(v28);
  }
  if (v25)
  {
    long long v55 = v25;
    operator delete(v25);
  }
  if (v22)
  {
    uint64_t v59 = v22;
    operator delete(v22);
  }
  uint64_t v29 = v63;
  if (v63)
  {
    if ((v63 & 0x80000000) != 0) {
      sub_19E13D694();
    }
    int v30 = (float64x2_t *)operator new(8 * (int)v63);
    bzero(v30, 8 * (int)v29);
    uint64_t v31 = 0;
    uint64_t v32 = (char *)__p[0];
    if (v29 < 8) {
      goto LABEL_35;
    }
    if ((unint64_t)((char *)v30 - (char *)__p[0]) < 0x20) {
      goto LABEL_35;
    }
    uint64_t v31 = v29 & 0xFFFFFFFC;
    long long v33 = v30 + 1;
    int64_t v34 = (float64x2_t *)((char *)__p[0] + 16);
    uint64_t v35 = v31;
    do
    {
      float64x2_t v36 = vrndaq_f64(*v34);
      v33[-1] = vrndaq_f64(v34[-1]);
      float64x2_t *v33 = v36;
      v33 += 2;
      v34 += 2;
      v35 -= 4;
    }
    while (v35);
    if (v31 != v29)
    {
LABEL_35:
      uint64_t v37 = v29 - v31;
      uint64_t v38 = v31 << 32;
      do
      {
        *(double *)((char *)v30->f64 + (v38 >> 29)) = round(*(double *)&v32[v38 >> 29]);
        v38 += 0x100000000;
        --v37;
      }
      while (v37);
    }
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    long long v39 = (char *)operator new(4 * (int)v29);
    *(void *)a3 = v39;
    *(void *)(a3 + 16) = &v39[4 * (int)v29];
    bzero(v39, 4 * (int)v29);
    *(void *)(a3 + 8) = &v39[4 * (int)v29];
    *(_DWORD *)(a3 + 24) = v29;
    if (v29 < 8 == v29 < 0x80000001)
    {
      uint64_t v41 = 0;
    }
    else
    {
      uint64_t v40 = 0;
      uint64_t v41 = v29 & 0xFFFFFFF8;
      uint64_t v42 = v41;
      do
      {
        unint64_t v43 = (float64x2_t *)((char *)v30 + (v40 >> 29));
        int32x4_t v44 = vuzp1q_s32((int32x4_t)vcvtq_s64_f64(*v43), (int32x4_t)vcvtq_s64_f64(v43[1]));
        int32x4_t v45 = vuzp1q_s32((int32x4_t)vcvtq_s64_f64(v43[2]), (int32x4_t)vcvtq_s64_f64(v43[3]));
        uint64_t v46 = (int32x4_t *)&v39[v40 >> 30];
        *uint64_t v46 = v44;
        v46[1] = v45;
        v40 += 0x800000000;
        v42 -= 8;
      }
      while (v42);
      if (v41 == v29)
      {
LABEL_47:
        operator delete(v30);
        int v47 = __p[0];
        if (!__p[0]) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }
    }
    uint64_t v48 = v29 - v41;
    uint64_t v49 = v41 << 32;
    do
    {
      *(_DWORD *)&v39[v49 >> 30] = (int)*(double *)((char *)v30->f64 + (v49 >> 29));
      v49 += 0x100000000;
      --v48;
    }
    while (v48);
    goto LABEL_47;
  }
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 24) = 0;
  *(void *)(a3 + 16) = 0;
  int v47 = __p[0];
  if (__p[0])
  {
LABEL_48:
    __p[1] = v47;
    operator delete(v47);
  }
LABEL_49:
  if (v67)
  {
    long long v68 = v67;
    operator delete(v67);
  }
  if (v64)
  {
    long long v65 = v64;
    operator delete(v64);
  }
  if (v7) {
    operator delete(v7);
  }
}

void sub_19E311C54(void *a1)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  sub_19E13A9BC(a1);
}

void sub_19E311D20(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *((unsigned int *)a1 + 6);
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  float64x2_t v36 = 0;
  if (!v4)
  {
    int v39 = 0;
    goto LABEL_11;
  }
  if ((v4 & 0x80000000) != 0) {
    sub_19E13D694();
  }
  uint64_t v5 = (float64x2_t *)operator new(8 * (int)v4);
  float64x2_t v36 = v5;
  uint64_t v38 = (char *)&v5->f64[(int)v4];
  bzero(v5, 8 * (int)v4);
  uint64_t v37 = v38;
  int v39 = v4;
  uint64_t v6 = *a1;
  if (v4 < 8)
  {
    uint64_t v7 = 0;
LABEL_9:
    uint64_t v16 = v4 - v7;
    uint64_t v17 = v7 << 32;
    do
    {
      *(double *)((char *)v5->f64 + (v17 >> 29)) = (double)*(int *)(v6 + (v17 >> 30));
      v17 += 0x100000000;
      --v16;
    }
    while (v16);
    goto LABEL_11;
  }
  uint64_t v7 = v4 & 0xFFFFFFF8;
  uint64_t v8 = v5 + 2;
  uint64_t v9 = v6 + 16;
  uint64_t v10 = v7;
  do
  {
    long long v11 = *(_OWORD *)(v9 - 16);
    v12.i64[0] = (int)v11;
    v12.i64[1] = SDWORD1(v11);
    float64x2_t v13 = vcvtq_f64_s64(v12);
    v12.i64[0] = SDWORD2(v11);
    v12.i64[1] = SHIDWORD(v11);
    float64x2_t v14 = vcvtq_f64_s64(v12);
    v12.i64[0] = (int)*(_OWORD *)v9;
    v12.i64[1] = (int)HIDWORD(*(void *)v9);
    float64x2_t v15 = vcvtq_f64_s64(v12);
    v12.i64[0] = (int)*(void *)(v9 + 8);
    v12.i64[1] = (int)HIDWORD(*(_OWORD *)v9);
    v8[-2] = v13;
    v8[-1] = v14;
    *uint64_t v8 = v15;
    v8[1] = vcvtq_f64_s64(v12);
    v8 += 4;
    v9 += 32;
    v10 -= 8;
  }
  while (v10);
  if (v7 != v4) {
    goto LABEL_9;
  }
LABEL_11:
  uint64_t v18 = *((unsigned int *)a1 + 14);
  long long v33 = 0;
  int64_t v34 = 0;
  std::string __p = 0;
  if (!v18)
  {
    int v35 = 0;
    goto LABEL_21;
  }
  if ((v18 & 0x80000000) != 0) {
    sub_19E13D694();
  }
  uint64_t v19 = (float64x2_t *)operator new(8 * (int)v18);
  std::string __p = v19;
  int64_t v34 = (char *)&v19->f64[(int)v18];
  bzero(v19, 8 * (int)v18);
  long long v33 = v34;
  int v35 = v18;
  uint64_t v20 = a1[4];
  if (v18 < 8)
  {
    uint64_t v21 = 0;
LABEL_19:
    uint64_t v30 = v18 - v21;
    uint64_t v31 = v21 << 32;
    do
    {
      *(double *)((char *)v19->f64 + (v31 >> 29)) = (double)*(int *)(v20 + (v31 >> 30));
      v31 += 0x100000000;
      --v30;
    }
    while (v30);
    goto LABEL_21;
  }
  uint64_t v21 = v18 & 0xFFFFFFF8;
  unint64_t v22 = v19 + 2;
  uint64_t v23 = v20 + 16;
  uint64_t v24 = v21;
  do
  {
    long long v25 = *(_OWORD *)(v23 - 16);
    v26.i64[0] = (int)v25;
    v26.i64[1] = SDWORD1(v25);
    float64x2_t v27 = vcvtq_f64_s64(v26);
    v26.i64[0] = SDWORD2(v25);
    v26.i64[1] = SHIDWORD(v25);
    float64x2_t v28 = vcvtq_f64_s64(v26);
    v26.i64[0] = (int)*(_OWORD *)v23;
    v26.i64[1] = (int)HIDWORD(*(void *)v23);
    float64x2_t v29 = vcvtq_f64_s64(v26);
    v26.i64[0] = (int)*(void *)(v23 + 8);
    v26.i64[1] = (int)HIDWORD(*(_OWORD *)v23);
    v22[-2] = v27;
    v22[-1] = v28;
    float64x2_t *v22 = v29;
    v22[1] = vcvtq_f64_s64(v26);
    v22 += 4;
    v23 += 32;
    v24 -= 8;
  }
  while (v24);
  if (v21 != v18) {
    goto LABEL_19;
  }
LABEL_21:
  sub_19E248EBC(a2, (uint64_t)&v36, (uint64_t)&__p);
  if (__p)
  {
    long long v33 = __p;
    operator delete(__p);
  }
  if (v36)
  {
    uint64_t v37 = v36;
    operator delete(v36);
  }
}

void sub_19E311F6C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  sub_19E13A9BC(a1);
}

void sub_19E311F9C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void (**)(void))(a1 + 88);
    if (v2)
    {
      v2(*(void *)(a1 + 16));
      if (*(_DWORD *)(a1 + 56))
      {
        unint64_t v3 = 0;
        uint64_t v4 = 32;
        do
        {
          v2(*(void *)(*(void *)(a1 + 64) + v4));
          ++v3;
          v4 += 48;
        }
        while (v3 < *(unsigned int *)(a1 + 56));
      }
      if (*(_DWORD *)(a1 + 72))
      {
        unint64_t v5 = 0;
        uint64_t v6 = 32;
        do
        {
          v2(*(void *)(*(void *)(a1 + 80) + v6));
          ++v5;
          v6 += 48;
        }
        while (v5 < *(unsigned int *)(a1 + 72));
      }
    }
    if (*(_DWORD *)(a1 + 56))
    {
      unint64_t v7 = 0;
      uint64_t v8 = 40;
      do
      {
        free(*(void **)(*(void *)(a1 + 64) + v8));
        ++v7;
        v8 += 48;
      }
      while (v7 < *(unsigned int *)(a1 + 56));
    }
    if (*(_DWORD *)(a1 + 72))
    {
      unint64_t v9 = 0;
      uint64_t v10 = 40;
      do
      {
        free(*(void **)(*(void *)(a1 + 80) + v10));
        ++v9;
        v10 += 48;
      }
      while (v9 < *(unsigned int *)(a1 + 72));
    }
    free(*(void **)(a1 + 40));
    free(*(void **)(a1 + 48));
    free(*(void **)(a1 + 136));
    free(*(void **)(a1 + 144));
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 80));
    sub_19E311F9C(*(void *)(a1 + 184));
    free(*(void **)(a1 + 200));
    free(*(void **)(a1 + 216));
    free(*(void **)(a1 + 224));
    free((void *)a1);
  }
}

uint64_t sub_19E312100(unsigned int a1, unsigned int a2)
{
  if (a1 > 0x2B) {
    return 0;
  }
  uint64_t v4 = (char *)malloc_type_malloc(0xE8uLL, 0x10B00408DE4A9E8uLL);
  uint64_t v5 = (uint64_t)v4;
  if (!v4) {
    return v5;
  }
  *(_DWORD *)uint64_t v4 = a1;
  *((_DWORD *)v4 + 1) = a2;
  *(_OWORD *)(v4 + 40) = 0u;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 0;
  *((void *)v4 + 1) = 0;
  *((_DWORD *)v4 + 8) = 0;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *((void *)v4 + 13) = 0xFFF0000000000000;
  *((_DWORD *)v4 + 52) = 0;
  *((void *)v4 + 25) = 0;
  *((_OWORD *)v4 + 7) = 0u;
  *((_OWORD *)v4 + 8) = 0u;
  *((_OWORD *)v4 + 9) = 0u;
  *(_OWORD *)(v4 + 156) = 0u;
  *((void *)v4 + 22) = 0;
  *((void *)v4 + 23) = 0;
  *((_DWORD *)v4 + 48) = 0;
  *((void *)v4 + 27) = 0;
  *((void *)v4 + 28) = 0;
  if (!a2) {
    return v5;
  }
  uint64_t v6 = malloc_type_calloc(a2, 8uLL, 0x100004000313F17uLL);
  *(void *)(v5 + 40) = v6;
  if (!v6
    || (unint64_t v7 = malloc_type_calloc(a2, 8uLL, 0x100004000313F17uLL), (*(void *)(v5 + 48) = v7) == 0)
    || (uint64_t v8 = malloc_type_calloc(a2, 8uLL, 0x100004000313F17uLL), (*(void *)(v5 + 136) = v8) == 0))
  {
    sub_19E311F9C(v5);
    return 0;
  }
  free(*(void **)(v5 + 224));
  *(void *)(v5 + 224) = 0;
  if (*(_DWORD *)(v5 + 4))
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = *(void *)(v5 + 48);
      *(void *)(*(void *)(v5 + 40) + 8 * v9) = 0xFFF0000000000000;
      double v11 = *(double *)(v10 + 8 * v9);
      if (v11 > -INFINITY && sub_19E2390AC(v11)) {
        *(void *)(*(void *)(v5 + 40) + 8 * v9) = *(void *)(*(void *)(v5 + 48) + 8 * v9);
      }
      ++v9;
    }
    while (v9 < *(unsigned int *)(v5 + 4));
    free(*(void **)(v5 + 224));
    *(void *)(v5 + 224) = 0;
    if (*(_DWORD *)(v5 + 4)) {
      goto LABEL_17;
    }
LABEL_24:
    uint64_t v16 = 0;
    goto LABEL_25;
  }
  free(0);
  *(void *)(v5 + 224) = 0;
  if (!*(_DWORD *)(v5 + 4)) {
    goto LABEL_24;
  }
LABEL_17:
  unint64_t v13 = 0;
  do
  {
    uint64_t v14 = *(void *)(v5 + 40);
    *(void *)(*(void *)(v5 + 48) + 8 * v13) = 0x7FF0000000000000;
    double v15 = *(double *)(v14 + 8 * v13);
    if (v15 < INFINITY && sub_19E2390AC(v15)) {
      *(void *)(*(void *)(v5 + 48) + 8 * v13) = *(void *)(*(void *)(v5 + 40) + 8 * v13);
    }
    ++v13;
  }
  while (v13 < *(unsigned int *)(v5 + 4));
  uint64_t v16 = *(void **)(v5 + 224);
LABEL_25:
  free(v16);
  *(void *)(v5 + 224) = 0;
  uint64_t v17 = *(unsigned int *)(v5 + 4);
  if (!v17) {
    return v5;
  }
  bzero(*(void **)(v5 + 136), 8 * v17);
  return v5;
}

uint64_t sub_19E312340(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (char *)malloc_type_malloc(0xE8uLL, 0x10B00408DE4A9E8uLL);
  uint64_t v3 = (uint64_t)v2;
  long long v4 = *(_OWORD *)(a1 + 96);
  long long v5 = *(_OWORD *)(a1 + 112);
  long long v6 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v2 + 8) = *(_OWORD *)(a1 + 128);
  long long v7 = *(_OWORD *)(a1 + 80);
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v2 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v2 + 5) = v7;
  *((_OWORD *)v2 + 2) = v9;
  *((_OWORD *)v2 + 3) = v8;
  uint64_t v10 = *(void *)(a1 + 208);
  long long v11 = *(_OWORD *)(a1 + 160);
  long long v12 = *(_OWORD *)(a1 + 176);
  long long v13 = *(_OWORD *)(a1 + 192);
  *((_OWORD *)v2 + 9) = v6;
  *((_OWORD *)v2 + 11) = v12;
  *((_OWORD *)v2 + 12) = v13;
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)a1;
  *((_OWORD *)v2 + 1) = v14;
  *((_OWORD *)v2 + 6) = v4;
  *((_OWORD *)v2 + 7) = v5;
  *((_OWORD *)v2 + 10) = v11;
  *((void *)v2 + 25) = 0;
  *((void *)v2 + 26) = v10;
  *((void *)v2 + 17) = 0;
  double v15 = (void **)(v2 + 136);
  *((void *)v2 + 5) = 0;
  uint64_t v16 = (void **)(v2 + 40);
  *((void *)v2 + 10) = 0;
  *((void *)v2 + 8) = 0;
  *((_DWORD *)v2 + 19) = 0;
  *((_DWORD *)v2 + 15) = 0;
  *((void *)v2 + 6) = 0;
  *((void *)v2 + 18) = 0;
  *((void *)v2 + 22) = 0;
  *((void *)v2 + 23) = 0;
  *((void *)v2 + 27) = 0;
  *((void *)v2 + 28) = 0;
  uint64_t v17 = (uint64_t (*)(void))*((void *)v2 + 12);
  if (v17)
  {
    if (*((void *)v2 + 2))
    {
      uint64_t v18 = v17();
      *(void *)(v3 + 16) = v18;
      if (!v18) {
        goto LABEL_65;
      }
    }
  }
  uint64_t v19 = *(unsigned int *)(a1 + 4);
  if (v19)
  {
    void *v16 = malloc_type_malloc(8 * v19, 0x100004000313F17uLL);
    if (!*(void *)(a1 + 40)) {
      goto LABEL_65;
    }
    *(void *)(v3 + 48) = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
    if (!*(void *)(a1 + 48)) {
      goto LABEL_65;
    }
    *double v15 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
    if (!*(void *)(a1 + 136)) {
      goto LABEL_65;
    }
    if (*(void *)(a1 + 144))
    {
      uint64_t v20 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
      *(void *)(v3 + 144) = v20;
      uint64_t v21 = *(const void **)(a1 + 144);
      if (!v21) {
        goto LABEL_65;
      }
      memcpy(v20, v21, 8 * *(unsigned int *)(a1 + 4));
    }
    memcpy(*(void **)(v3 + 40), *(const void **)(a1 + 40), 8 * *(unsigned int *)(a1 + 4));
    memcpy(*(void **)(v3 + 48), *(const void **)(a1 + 48), 8 * *(unsigned int *)(a1 + 4));
    memcpy(*(void **)(v3 + 136), *(const void **)(a1 + 136), 8 * *(unsigned int *)(a1 + 4));
  }
  uint64_t v22 = *(unsigned int *)(a1 + 56);
  if (v22)
  {
    *(_DWORD *)(v3 + 60) = v22;
    uint64_t v23 = malloc_type_malloc(48 * v22, 0x1080040FAB287DEuLL);
    *(void *)(v3 + 64) = v23;
    if (!v23) {
      goto LABEL_65;
    }
    memcpy(v23, *(const void **)(a1 + 64), 48 * *(unsigned int *)(a1 + 56));
    unint64_t v24 = *(unsigned int *)(a1 + 56);
    if (v24)
    {
      uint64_t v25 = *(void *)(v3 + 64);
      if (v24 == 1)
      {
        uint64_t v26 = 0;
      }
      else
      {
        uint64_t v26 = v24 & 0xFFFFFFFE;
        float64x2_t v27 = (void *)(v25 + 88);
        uint64_t v28 = v26;
        do
        {
          *(v27 - 6) = 0;
          *float64x2_t v27 = 0;
          v27 += 12;
          v28 -= 2;
        }
        while (v28);
        if (v26 == v24) {
          goto LABEL_23;
        }
      }
      float64x2_t v29 = (void *)(v25 + 48 * v26 + 40);
      uint64_t v30 = v24 - v26;
      do
      {
        *float64x2_t v29 = 0;
        v29 += 6;
        --v30;
      }
      while (v30);
LABEL_23:
      if (v17)
      {
        unint64_t v31 = 0;
        uint64_t v32 = *(void *)(v3 + 64);
        uint64_t v33 = 32;
        do
        {
          if (*(void *)(v32 + v33))
          {
            uint64_t v34 = v17();
            uint64_t v32 = *(void *)(v3 + 64);
            *(void *)(v32 + v33) = v34;
            if (!v34) {
              goto LABEL_65;
            }
            unint64_t v24 = *(unsigned int *)(a1 + 56);
          }
          ++v31;
          v33 += 48;
        }
        while (v31 < v24);
      }
      if (v24)
      {
        uint64_t v35 = 0;
        for (unint64_t i = 0; i < v24; ++i)
        {
          if (*(void *)(*(void *)(a1 + 64) + v35 + 40))
          {
            uint64_t v37 = malloc_type_malloc(8 * *(unsigned int *)(*(void *)(v3 + 64) + v35), 0x100004000313F17uLL);
            uint64_t v38 = *(void *)(v3 + 64);
            *(void *)(v38 + v35 + 40) = v37;
            if (!v37) {
              goto LABEL_65;
            }
            memcpy(v37, *(const void **)(*(void *)(a1 + 64) + v35 + 40), 8 * *(unsigned int *)(v38 + v35));
            unint64_t v24 = *(unsigned int *)(a1 + 56);
          }
          v35 += 48;
        }
      }
    }
  }
  uint64_t v39 = *(unsigned int *)(a1 + 72);
  if (!v39) {
    goto LABEL_59;
  }
  *(_DWORD *)(v3 + 76) = v39;
  uint64_t v40 = malloc_type_malloc(48 * v39, 0x1080040FAB287DEuLL);
  *(void *)(v3 + 80) = v40;
  if (v40)
  {
    memcpy(v40, *(const void **)(a1 + 80), 48 * *(unsigned int *)(a1 + 72));
    unint64_t v41 = *(unsigned int *)(a1 + 72);
    if (!v41) {
      goto LABEL_59;
    }
    uint64_t v42 = *(void *)(v3 + 80);
    if (v41 == 1)
    {
      uint64_t v43 = 0;
    }
    else
    {
      uint64_t v43 = v41 & 0xFFFFFFFE;
      int32x4_t v44 = (void *)(v42 + 88);
      uint64_t v45 = v43;
      do
      {
        *(v44 - 6) = 0;
        *int32x4_t v44 = 0;
        v44 += 12;
        v45 -= 2;
      }
      while (v45);
      if (v43 == v41) {
        goto LABEL_45;
      }
    }
    uint64_t v46 = (void *)(v42 + 48 * v43 + 40);
    uint64_t v47 = v41 - v43;
    do
    {
      *uint64_t v46 = 0;
      v46 += 6;
      --v47;
    }
    while (v47);
LABEL_45:
    if (v17)
    {
      unint64_t v48 = 0;
      uint64_t v49 = *(void *)(v3 + 80);
      uint64_t v50 = 32;
      do
      {
        if (*(void *)(v49 + v50))
        {
          uint64_t v51 = v17();
          uint64_t v49 = *(void *)(v3 + 80);
          *(void *)(v49 + v50) = v51;
          if (!v51) {
            goto LABEL_65;
          }
          unint64_t v41 = *(unsigned int *)(a1 + 72);
        }
        ++v48;
        v50 += 48;
      }
      while (v48 < v41);
    }
    if (v41)
    {
      uint64_t v52 = 0;
      for (unint64_t j = 0; j < v41; ++j)
      {
        if (*(void *)(*(void *)(a1 + 80) + v52 + 40))
        {
          BOOL v54 = malloc_type_malloc(8 * *(unsigned int *)(*(void *)(v3 + 80) + v52), 0x100004000313F17uLL);
          uint64_t v55 = *(void *)(v3 + 80);
          *(void *)(v55 + v52 + 40) = v54;
          if (!v54) {
            goto LABEL_65;
          }
          memcpy(v54, *(const void **)(*(void *)(a1 + 80) + v52 + 40), 8 * *(unsigned int *)(v55 + v52));
          unint64_t v41 = *(unsigned int *)(a1 + 72);
        }
        v52 += 48;
      }
    }
LABEL_59:
    if (!*(void *)(a1 + 184) || (uint64_t v56 = sub_19E312340(), (*(void *)(v3 + 184) = v56) != 0))
    {
      if (!*(void *)(a1 + 200)) {
        return v3;
      }
      int v57 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
      *(void *)(v3 + 200) = v57;
      if (v57)
      {
        memcpy(v57, *(const void **)(a1 + 200), 8 * *(unsigned int *)(a1 + 4));
        return v3;
      }
    }
  }
LABEL_65:
  *(void *)(v3 + 88) = 0;
  sub_19E311F9C(v3);
  return 0;
}

void sub_19E312858(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 224));
    *(void *)(a1 + 224) = 0;
  }
}

uint64_t sub_19E31288C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 4294967294;
  }
  free(*(void **)(a1 + 224));
  *(void *)(a1 + 224) = 0;
  long long v6 = *(void (**)(void))(a1 + 88);
  if (v6) {
    v6(*(void *)(a1 + 16));
  }
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1;
  if (sub_19E23906C(*(double *)(a1 + 104)) && *(double *)(a1 + 104) < 0.0) {
    *(void *)(a1 + 104) = 0x7FF0000000000000;
  }
  return 1;
}

uint64_t sub_19E312928(uint64_t a1, const void *a2)
{
  if (!a1) {
    return 4294967294;
  }
  free(*(void **)(a1 + 224));
  *(void *)(a1 + 224) = 0;
  uint64_t v4 = *(unsigned int *)(a1 + 4);
  if (*(_DWORD *)(a1 + 4)) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    uint64_t result = 4294967294;
  }
  else {
    uint64_t result = 1;
  }
  if (v4) {
    BOOL v7 = a2 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    memcpy(*(void **)(a1 + 40), a2, 8 * v4);
    if (*(_DWORD *)(a1 + 4))
    {
      unint64_t v8 = 0;
      do
      {
        double v9 = *(double *)(*(void *)(a1 + 40) + 8 * v8);
        double v10 = *(double *)(*(void *)(a1 + 48) + 8 * v8);
        if (v9 < v10 && sub_19E2390AC(v10 - v9)) {
          *(void *)(*(void *)(a1 + 40) + 8 * v8) = *(void *)(*(void *)(a1 + 48) + 8 * v8);
        }
        ++v8;
      }
      while (v8 < *(unsigned int *)(a1 + 4));
    }
    return 1;
  }
  return result;
}

char *sub_19E3129F8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = sub_19E238FB0(*(void **)(a1 + 224), a2, &a9);
  *(void *)(a1 + 224) = result;
  return result;
}

uint64_t sub_19E312A38(uint64_t a1, const void *a2)
{
  if (!a1) {
    return 4294967294;
  }
  free(*(void **)(a1 + 224));
  *(void *)(a1 + 224) = 0;
  uint64_t v4 = *(unsigned int *)(a1 + 4);
  if (*(_DWORD *)(a1 + 4)) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    uint64_t result = 4294967294;
  }
  else {
    uint64_t result = 1;
  }
  if (v4) {
    BOOL v7 = a2 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    memcpy(*(void **)(a1 + 48), a2, 8 * v4);
    if (*(_DWORD *)(a1 + 4))
    {
      unint64_t v8 = 0;
      do
      {
        double v9 = *(double *)(*(void *)(a1 + 40) + 8 * v8);
        double v10 = *(double *)(*(void *)(a1 + 48) + 8 * v8);
        if (v9 < v10 && sub_19E2390AC(v10 - v9)) {
          *(void *)(*(void *)(a1 + 48) + 8 * v8) = *(void *)(*(void *)(a1 + 40) + 8 * v8);
        }
        ++v8;
      }
      while (v8 < *(unsigned int *)(a1 + 4));
    }
    return 1;
  }
  return result;
}

uint64_t sub_19E312B08(uint64_t a1, double a2)
{
  if (!a1) {
    return 4294967294;
  }
  free(*(void **)(a1 + 224));
  *(void *)(a1 + 224) = 0;
  *(double *)(a1 + 112) = a2;
  return 1;
}

uint64_t sub_19E312B58(uint64_t a1, double a2)
{
  if (!a1) {
    return 4294967294;
  }
  free(*(void **)(a1 + 224));
  *(void *)(a1 + 224) = 0;
  *(double *)(a1 + 128) = a2;
  return 1;
}

uint64_t sub_19E312BA8(uint64_t a1, int a2)
{
  if (!a1) {
    return 4294967294;
  }
  free(*(void **)(a1 + 224));
  *(void *)(a1 + 224) = 0;
  *(_DWORD *)(a1 + 152) = a2;
  return 1;
}

uint64_t sub_19E312BF0(uint64_t a1, int a2)
{
  while (a1)
  {
    free(*(void **)(a1 + 224));
    *(void *)(a1 + 224) = 0;
    *(_DWORD *)(a1 + 168) = a2;
    a1 = *(void *)(a1 + 176);
    if (!a1) {
      return 1;
    }
  }
  return 4294967294;
}

uint64_t sub_19E312C44(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t sub_19E312C4C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 88) = a2;
    *(void *)(result + 96) = a3;
  }
  return result;
}

uint64_t sub_19E312C58(uint64_t a1)
{
  return *(void *)(a1 + 224);
}

int *sub_19E312C64()
{
  if (qword_1E9459408 == -1)
  {
    v0 = pthread_getspecific(qword_1E9459410);
    if (v0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_1E9459408, &unk_1EF0AC040);
  v0 = pthread_getspecific(qword_1E9459410);
  if (!v0)
  {
LABEL_3:
    v0 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    pthread_setspecific(qword_1E9459410, v0);
    _DWORD *v0 = 0;
  }
LABEL_4:
  _DWORD *v0 = 1;

  return sub_19E313C80();
}

int *sub_19E312D24()
{
  sub_19E24ACD4();
  getpid();
  if (qword_1E9459408 == -1)
  {
    v0 = pthread_getspecific(qword_1E9459410);
    if (v0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_1E9459408, &unk_1EF0AC040);
  v0 = pthread_getspecific(qword_1E9459410);
  if (!v0)
  {
LABEL_3:
    v0 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    pthread_setspecific(qword_1E9459410, v0);
    _DWORD *v0 = 0;
  }
LABEL_4:
  _DWORD *v0 = 1;

  return sub_19E313C80();
}

int *sub_19E312DF8()
{
  if (qword_1E9459408 == -1)
  {
    uint64_t result = (int *)pthread_getspecific(qword_1E9459410);
    if (result) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_1E9459408, &unk_1EF0AC040);
    uint64_t result = (int *)pthread_getspecific(qword_1E9459410);
    if (result)
    {
LABEL_3:
      if (*result) {
        return result;
      }
      goto LABEL_7;
    }
  }
  uint64_t v1 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  pthread_setspecific(qword_1E9459410, v1);
  *uint64_t v1 = 0;
LABEL_7:

  return sub_19E312D24();
}

uint64_t sub_19E312EA8()
{
  return pthread_key_create((pthread_key_t *)&qword_1E9459410, MEMORY[0x1E4F14838]);
}

void sub_19E312EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    sub_19E312EE0(a1, v4);
  }
  else if (*(void *)(a1 + 152))
  {
    sub_19E3135E4(a1, 0, a3, a4);
  }
  else
  {
    sub_19E313878(a1, 0, a3, a4);
  }
}

void sub_19E312EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  sub_19E2374CC();
  size_t v156 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v3, v4, v5);
  long long v6 = [MontrealNNModelNetwork alloc];
  float32x4_t v158 = objc_msgSend_initWithModelContainer_tensors_(v6, v7, a2, (uint64_t)v156);
  long long v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  double v15 = objc_msgSend_nodes(v158, v12, v13, v14);
  uint64_t v17 = 0;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v190, (uint64_t)v194, 16);
  if (v19)
  {
    uint64_t v20 = *(void *)v191;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v191 != v20) {
          objc_enumerationMutation(v15);
        }
        uint64_t v22 = objc_msgSend_layerWithMontrealNode_modelContainer_(MLPLayer, v18, *(void *)(*((void *)&v190 + 1) + 8 * i), a2);

        uint64_t v17 = (void *)v22;
        if (v22) {
          objc_msgSend_addObject_(v11, v18, v22, v23);
        }
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v190, (uint64_t)v194, 16);
    }
    while (v19);
  }

  float64x2_t v27 = objc_msgSend_inputs(v158, v24, v25, v26);
  float32x4_t v157 = objc_msgSend_firstObject(v27, v28, v29, v30);

  uint64_t v34 = objc_msgSend_dimension(v157, v31, v32, v33);
  BOOL v38 = objc_msgSend_count(v34, v35, v36, v37) == 3;

  if (v38)
  {
    uint64_t v42 = objc_msgSend_dimension(v157, v39, v40, v41);
    uint64_t v45 = objc_msgSend_objectAtIndex_(v42, v43, 0, v44);
    *(void *)(a1 + 120) = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48);

    uint64_t v52 = objc_msgSend_dimension(v157, v49, v50, v51);
    uint64_t v55 = objc_msgSend_objectAtIndex_(v52, v53, 1, v54);
    *(void *)(a1 + 128) = objc_msgSend_unsignedIntegerValue(v55, v56, v57, v58);

    long long v62 = objc_msgSend_dimension(v157, v59, v60, v61);
    long long v65 = objc_msgSend_objectAtIndex_(v62, v63, 2, v64);
    *(void *)(a1 + 136) = objc_msgSend_unsignedIntegerValue(v65, v66, v67, v68);
  }
  else
  {
    long long v72 = objc_msgSend_dimension(v157, v39, v40, v41);
    BOOL v76 = objc_msgSend_count(v72, v73, v74, v75) == 2;

    if (v76)
    {
      BOOL v80 = objc_msgSend_dimension(v157, v77, v78, v79);
      long long v83 = objc_msgSend_objectAtIndex_(v80, v81, 0, v82);
      *(void *)(a1 + 120) = objc_msgSend_unsignedIntegerValue(v83, v84, v85, v86);

      *(void *)(a1 + 128) = 1;
      long long v90 = objc_msgSend_dimension(v157, v87, v88, v89);
      long long v93 = objc_msgSend_objectAtIndex_(v90, v91, 1, v92);
      *(void *)(a1 + 136) = objc_msgSend_unsignedIntegerValue(v93, v94, v95, v96);
    }
    else
    {
      long long v97 = objc_msgSend_dimension(v157, v77, v78, v79);
      BOOL v101 = (unint64_t)objc_msgSend_count(v97, v98, v99, v100) < 2;

      if (!v101)
      {
        objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v102, *MEMORY[0x1E4F1C3B8], @"Input dimension not handled", 0);
        id v153 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v153);
      }
      *(int64x2_t *)(a1 + 120) = vdupq_n_s64(1uLL);
      *(void *)(a1 + 136) = objc_msgSend_tensorSize(v157, v102, v103, v104);
    }
  }
  long long v105 = objc_msgSend_nodes(v158, v69, v70, v71);
  long long v109 = objc_msgSend_lastObject(v105, v106, v107, v108);
  uint64_t v113 = objc_msgSend_outputs(v109, v110, v111, v112);
  int v155 = objc_msgSend_firstObject(v113, v114, v115, v116);

  *(void *)(a1 + 144) = objc_msgSend_tensorSize(v155, v117, v118, v119);
  if (objc_msgSend_layerType(v17, v120, v121, v122) == 6)
  {
    long long v188 = 0u;
    long long v189 = 0u;
    long long v186 = 0u;
    long long v187 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v161 = 0u;
    memset(v160, 0, sizeof(v160));
    float32x4_t v126 = objc_msgSend_nodes(v158, v123, v124, v125);
    uint64_t v130 = objc_msgSend_lastObject(v126, v127, v128, v129);
    BOOL v133 = v130;
    if (v130) {
      objc_msgSend_parameters_(v130, v131, a2, v132);
    }
    else {
      bzero(v160, 0x2C0uLL);
    }

    if (*((void *)&v161 + 1) == 4)
    {
      int v134 = [MLPLossLayer alloc];
      long long v138 = objc_msgSend_lastObject(v11, v135, v136, v137);
      float32x4_t v140 = objc_msgSend_initWithName_previousLayer_neuronType_neuronParams_(v134, v139, @"last_softmax", (uint64_t)v138, 0, 0);

      objc_msgSend_addObject_(v11, v141, (uint64_t)v140, v142);
    }
  }
  uint64_t v143 = *(void *)(a1 + 120);
  uint64_t v144 = *(void *)(a1 + 128);
  uint64_t v154 = *(void *)(a1 + 136);
  uint64_t v145 = *(void *)(a1 + 96);
  uint64_t v146 = *(void *)(a1 + 104);
  uint64_t v148 = *(void *)(a1 + 176);
  uint64_t v147 = *(void *)(a1 + 184);
  uint64_t v149 = objc_msgSend_optimizerParams(v158, v123, v124, v125);
  uint64_t v151 = objc_msgSend_networkWithLayers_inputLength_inputHeight_inputChannels_batchSize_lossBatchSize_options_deviceHandler_optimizerParams_(MLPNetwork, v150, (uint64_t)v11, v143, v144, v154, v145, v146, v148, v147, v149);
  float32x4_t v152 = *(void **)a1;
  *(void *)a1 = v151;
}

void sub_19E313440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_19E3135E4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, a4);
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [MLPEmbeddingLayer alloc];
  BOOL v7 = objc_msgSend_initWithName_inputLength_vocabSize_embeddingDimension_(v5, v6, @"embedding", 1, *(void *)(a1 + 152), *(void *)(a1 + 160));
  objc_msgSend_addObject_(v37, v8, (uint64_t)v7, v9);
  uint64_t v10 = [MLPLSTMLayer alloc];
  id v12 = (id)objc_msgSend_initWithName_inputSize_outputSize_weightAttributes_(v10, v11, @"lstm_1", *(void *)(a1 + 160), *(void *)(a1 + 160), 32);

  objc_msgSend_addObject_(v37, v13, (uint64_t)v12, v14);
  double v15 = [MLPLSTMLayer alloc];
  id v17 = (id)objc_msgSend_initWithName_inputSize_outputSize_weightAttributes_(v15, v16, @"lstm_2", *(void *)(a1 + 160), *(void *)(a1 + 160), 32);

  objc_msgSend_addObject_(v37, v18, (uint64_t)v17, v19);
  uint64_t v20 = [MLPDenseLayer alloc];
  id v22 = (id)objc_msgSend_initWithName_numInputs_numOutputs_neuronType_neuronParams_(v20, v21, @"dense", *(void *)(a1 + 160), *(void *)(a1 + 144), 0, 0);

  objc_msgSend_addObject_(v37, v23, (uint64_t)v22, v24);
  uint64_t v25 = [MLPLossLayer alloc];
  id v27 = (id)objc_msgSend_initWithName_previousLayer_neuronType_neuronParams_(v25, v26, @"loss", (uint64_t)v22, 0, 0);

  objc_msgSend_addObject_(v37, v28, (uint64_t)v27, v29);
  uint64_t v33 = objc_msgSend_copy(v37, v30, v31, v32);
  uint64_t v35 = objc_msgSend_networkWithLayers_inputLength_inputHeight_inputChannels_batchSize_lossBatchSize_options_deviceHandler_optimizerParams_(MLPNetwork, v34, (uint64_t)v33, 1, 1, 1, *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 176), *(void *)(a1 + 184), 0);
  uint64_t v36 = *(void **)a1;
  *(void *)a1 = v35;
}

void sub_19E3137E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E313800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E313844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E31385C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E313878(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, a4);
  id v62 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [MLPDropoutLayer alloc];
  LODWORD(v6) = 1045220557;
  unint64_t v8 = objc_msgSend_initWithName_inputLength_inputChannels_dropoutRatio_(v5, v7, @"dropout_1", *(void *)(a1 + 120), *(void *)(a1 + 136), v6);
  objc_msgSend_addObject_(v62, v9, (uint64_t)v8, v10);
  long long v11 = [MLPConvolutionLayer alloc];
  int v59 = 1;
  id v13 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_outputChannels_neuronType_neuronParams_(v11, v12, @"conv_0", (uint64_t)v8, 1, 1, 1, 256, v59, &unk_1EF0B3650);

  objc_msgSend_addObject_(v62, v14, (uint64_t)v13, v15);
  uint64_t v16 = [MLPConvolutionLayer alloc];
  LODWORD(v60) = 1;
  id v18 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_outputChannels_neuronType_neuronParams_(v16, v17, @"conv_1", (uint64_t)v13, 5, 1, 1, 128, v60, &unk_1EF0B3668);

  objc_msgSend_addObject_(v62, v19, (uint64_t)v18, v20);
  uint64_t v21 = [MLPPoolingLayer alloc];
  id v23 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_(v21, v22, @"pool_1", (uint64_t)v18, 5, 1, 5);

  objc_msgSend_addObject_(v62, v24, (uint64_t)v23, v25);
  uint64_t v26 = [MLPConvolutionLayer alloc];
  LODWORD(v61) = 1;
  id v28 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_outputChannels_neuronType_neuronParams_(v26, v27, @"conv_2", (uint64_t)v23, 5, 1, 1, 64, v61, &unk_1EF0B3680);

  objc_msgSend_addObject_(v62, v29, (uint64_t)v28, v30);
  uint64_t v31 = [MLPPoolingLayer alloc];
  id v33 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_(v31, v32, @"pool_2", (uint64_t)v28, 5, 1, 5);

  objc_msgSend_addObject_(v62, v34, (uint64_t)v33, v35);
  uint64_t v36 = [MLPDropoutLayer alloc];
  LODWORD(v37) = 0.5;
  id v39 = (id)objc_msgSend_initWithName_previousLayer_dropoutRatio_(v36, v38, @"dropout_2", (uint64_t)v33, v37);

  objc_msgSend_addObject_(v62, v40, (uint64_t)v39, v41);
  uint64_t v42 = [MLPDenseLayer alloc];
  id v44 = (id)objc_msgSend_initWithName_previousLayer_numOutputs_neuronType_neuronParams_(v42, v43, @"dense_2", (uint64_t)v39, *(void *)(a1 + 144), 0, 0);

  objc_msgSend_addObject_(v62, v45, (uint64_t)v44, v46);
  uint64_t v47 = [MLPLossLayer alloc];
  id v49 = (id)objc_msgSend_initWithName_previousLayer_neuronType_neuronParams_(v47, v48, @"loss", (uint64_t)v44, 0, 0);

  objc_msgSend_addObject_(v62, v50, (uint64_t)v49, v51);
  uint64_t v55 = objc_msgSend_copy(v62, v52, v53, v54);
  uint64_t v57 = objc_msgSend_networkWithLayers_inputLength_inputHeight_inputChannels_batchSize_lossBatchSize_options_deviceHandler_optimizerParams_(MLPNetwork, v56, (uint64_t)v55, *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 176), *(void *)(a1 + 184), 0);
  uint64_t v58 = *(void **)a1;
  *(void *)a1 = v57;
}

void sub_19E313BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E313BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E313C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E313C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

int *sub_19E313C80()
{
  v0 = (_DWORD *)off_1EC304440();
  _DWORD *v0 = v1;
  uint64_t result = (int *)off_1EC304458();
  int v5 = 1;
  *uint64_t result = 1;
  do
  {
    *(_DWORD *)(v3 + 4 * v5) = v5 + 1812433253 * (*(_DWORD *)(v4 + 4 * v5) ^ (*(_DWORD *)(v4 + 4 * v5) >> 30));
    int v6 = *result;
    int v5 = *result + 1;
    *uint64_t result = v5;
  }
  while (v6 < 623);
  return result;
}

uint64_t sub_19E313CFC(unsigned int a1)
{
  return sub_19E313D28() % a1;
}

uint64_t sub_19E313D28()
{
  if (*(int *)off_1EC304458() <= 623)
  {
    v0 = (int *)off_1EC304440();
  }
  else
  {
    v0 = (int *)off_1EC304440();
    if (v2 == 625)
    {
      int *v0 = 5489;
      int v3 = 1;
      *int v1 = 1;
      do
      {
        v0[v3] = v3 + 1812433253 * (v0[v3 - 1] ^ (v0[v3 - 1] >> 30));
        int v4 = *v1;
        int v3 = *v1 + 1;
        *int v1 = v3;
      }
      while (v4 < 623);
    }
    uint64_t v5 = 0;
    int v6 = *v0;
    do
    {
      BOOL v7 = (unsigned int *)&v0[v5];
      unsigned int v8 = v6 & 0x80000000;
      int v9 = v0[v5 + 1];
      int v6 = v0[v5 + 2];
      unsigned int v10 = dword_19E354DAC[v9 & 1] ^ v0[v5 + 397] ^ ((v9 & 0x7FFFFFFE | v8) >> 1);
      unsigned int v11 = dword_19E354DAC[v6 & 1] ^ v0[v5 + 398] ^ ((v6 & 0x7FFFFFFE | v9 & 0x80000000) >> 1);
      unsigned int *v7 = v10;
      v7[1] = v11;
      v5 += 2;
    }
    while (v5 != 226);
    uint64_t v12 = 0;
    int v13 = v0[227];
    v0[226] = dword_19E354DAC[v13 & 1] ^ v0[623] ^ ((v13 & 0x7FFFFFFE | v6 & 0x80000000) >> 1);
    int v14 = v13;
    do
    {
      unsigned int v15 = v14 & 0x80000000;
      int v14 = v0[v12 + 228];
      v0[v12 + 227] = dword_19E354DAC[v14 & 1] ^ v0[v12] ^ ((v14 & 0x7FFFFFFE | v15) >> 1);
      ++v12;
    }
    while (v12 != 396);
    int v16 = 0;
    v0[623] = dword_19E354DAC[*v0 & 1] ^ v0[396] ^ ((*v0 & 0x7FFFFFFE | v0[623] & 0x80000000) >> 1);
  }
  *int v1 = v16 + 1;
  int v17 = v0[v16] ^ (v0[v16] >> 11);
  unsigned int v18 = (((v17 << 7) & 0x9D2C5680 ^ v17) << 15) & 0xEFC60000 ^ (v17 << 7) & 0x9D2C5680 ^ v17;
  return v18 ^ (v18 >> 18);
}

void sub_19E314000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31411C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E3141F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E3142D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  unsigned int v15 = v14;

  _Unwind_Resume(a1);
}

void sub_19E31457C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  int v14 = v13;

  _Unwind_Resume(a1);
}

void sub_19E3145A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E31469C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E3146B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E314920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E314A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_19E314C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E314F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E315478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  if (v35) {
    operator delete(v35);
  }
  sub_19E13DA90((uint64_t)&a33);

  _Unwind_Resume(a1);
}

uint64_t sub_19E315574(uint64_t a1, int a2)
{
  uint64_t v4 = MEMORY[0x1E4FBA498] + 64;
  *(void *)(a1 + 112) = MEMORY[0x1E4FBA498] + 64;
  uint64_t v5 = *(void *)(MEMORY[0x1E4FBA418] + 16);
  uint64_t v6 = *(void *)(MEMORY[0x1E4FBA418] + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + *(void *)(v6 - 24)) = v5;
  BOOL v7 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v7, (void *)(a1 + 8));
  uint64_t v8 = MEMORY[0x1E4FBA498] + 24;
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *(void *)a1 = v8;
  *(void *)(a1 + 112) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = a2 | 0x10;
  return a1;
}

void sub_19E3156F0(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x19F3BBB40](v1);
  _Unwind_Resume(a1);
}

void sub_19E315998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E315AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E3162C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19E316610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_19E316620(void ***a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v49 = [MLPModelLSTMDataSource alloc];
  uint64_t v10 = objc_msgSend_inputSize(**a1, v7, v8, v9);
  uint64_t v14 = objc_msgSend_outputSize(**a1, v11, v12, v13);
  uint64_t v18 = objc_msgSend_initialWeights_0(**a1, v15, v16, v17);
  uint64_t v22 = objc_msgSend_initialWeights_1(**a1, v19, v20, v21);
  uint64_t v26 = objc_msgSend_initialBias_0(**a1, v23, v24, v25);
  uint64_t v30 = objc_msgSend_initialBias_1(**a1, v27, v28, v29);
  uint64_t v34 = objc_msgSend_weightAttributes(**a1, v31, v32, v33);
  BOOL v38 = objc_msgSend_network(**a1, v35, v36, v37);
  uint64_t v42 = objc_msgSend_deviceHandler(v38, v39, v40, v41);
  id v44 = (void *)v42;
  LODWORD(v45) = 1045220557;
  LODWORD(v46) = 1.0;
  if (a3 == 4) {
    *(float *)&double v46 = 0.5;
  }
  else {
    *(float *)&double v45 = 1.0;
  }
  uint64_t v47 = objc_msgSend_initWithColumns_rows_lstmInputSize_lstmOutputSize_weightID_neuronType_neuronA_neuronB_initialWeights_0_initialWeights_1_bias_0_bias_1_weightAttributes_deviceHandler_(v49, v43, a4, a5, v10, v14, a2, a3, v45, v46, v18, v22, v26, v30, v34, v42);

  return v47;
}

void sub_19E316778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31678C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_19E31679C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4))
  {
    uint64_t v8 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v10 = objc_msgSend_filter(*(void **)(a1 + 40), v5, v6, v7);
    objc_msgSend_createWeightMatrices_(v10, v11, *(void *)(a1 + 32), v12);

    uint64_t v8 = *(void **)(a1 + 32);
  }
  return v8;
}

void sub_19E316818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_19E316828(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_objectAtIndexedSubscript_(a2, (const char *)a2, a3, a4);
  objc_msgSend_data(v5, v6, v7, v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_contents(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_data(v5, v14, v15, v16);
  size_t v21 = objc_msgSend_length(v17, v18, v19, v20);
  bzero(v13, v21);

  uint64_t v25 = objc_msgSend_network(*(void **)(a1 + 32), v22, v23, v24);
  uint64_t v29 = objc_msgSend_deviceHandler(v25, v26, v27, v28);
  uint64_t v32 = objc_msgSend_matrixToVector_(v29, v30, (uint64_t)v5, v31);

  return v32;
}

void sub_19E3168F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E316914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31692C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31693C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E316950(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

id sub_19E316968(uint64_t a1)
{
  int v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return v3;
}

void sub_19E3169D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E316B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E316B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E316B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E316B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E316DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E317174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  size_t v21 = v18;

  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_19E317400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E317418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E317720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19E317C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *__p,void *a22,void *a23)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_19E317E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E318960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19E318BE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_filter(**(void ***)a1, v7, v8, v9);
  uint64_t v11 = **(void **)(a1 + 8);
  uint64_t v15 = objc_msgSend_weights(**(void ***)a1, v12, v13, v14);
  uint64_t v19 = objc_msgSend_unsignedIntegerValue(v5, v16, v17, v18);
  memset(v34, 0, sizeof(v34));
  objc_msgSend_encodeCopyWeightsToCommandBuffer_weights_matrixId_matrix_copyFromWeightsToMatrix_matrixOffset_(v10, v20, v11, (uint64_t)v15, v19, v6, 1, v34);

  uint64_t v24 = objc_msgSend_network(**(void ***)a1, v21, v22, v23);
  uint64_t v28 = objc_msgSend_deviceHandler(v24, v25, v26, v27);
  uint64_t v32 = objc_msgSend_data(v6, v29, v30, v31);
  objc_msgSend_importDataFromGPU_cmdBuf_(v28, v33, (uint64_t)v32, **(void **)(a1 + 8));
}

void sub_19E318CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E318D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E319A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E319DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31A124(const char *a1@<X0>, uint64_t a2@<X8>)
{
  if (!a1)
  {
    *(unsigned char *)(a2 + 23) = 0;
    *(unsigned char *)a2 = 0;
    return;
  }
  size_t v4 = strlen(a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_19E13C370();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    p_dst = (long long *)operator new(v7 + 1);
    *((void *)&__dst + 1) = v5;
    int64_t v12 = v8 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    HIBYTE(v12) = v4;
    p_dst = &__dst;
    if (!v4) {
      goto LABEL_12;
    }
  }
  memcpy(p_dst, a1, v5);
LABEL_12:
  *((unsigned char *)p_dst + v5) = 0;
  uint64_t v9 = HIBYTE(v12);
  int v10 = SHIBYTE(v12);
  if (v12 < 0) {
    uint64_t v9 = *((void *)&__dst + 1);
  }
  if (v9)
  {
    *(_OWORD *)a2 = __dst;
    *(void *)(a2 + 16) = v12;
  }
  else
  {
    *(unsigned char *)(a2 + 23) = 0;
    *(unsigned char *)a2 = 0;
    if (v10 < 0) {
      operator delete((void *)__dst);
    }
  }
}

const __CFString *sub_19E31A250@<X0>(const __CFString *result@<X0>, unsigned char *a2@<X8>)
{
  if (result)
  {
    CFIndex Length = CFStringGetLength(result);
    CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    operator new[]();
  }
  a2[23] = 0;
  *a2 = 0;
  return result;
}

void sub_19E31A370(_Unwind_Exception *a1)
{
  operator delete[](v1);
  _Unwind_Resume(a1);
}

void sub_19E31A384(unint64_t a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X2>, float32x4_t *a4@<X3>, float32x4_t *a5@<X4>, void *a6@<X8>)
{
  id v44 = 0;
  double v45 = 0;
  double v46 = 0;
  if (!a1)
  {
    std::string __p = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    goto LABEL_11;
  }
  if (a1 >> 62) {
    sub_19E13D694();
  }
  uint64_t v12 = 4 * a1;
  uint64_t v13 = (float32x4_t *)operator new(4 * a1);
  id v44 = v13;
  double v46 = &v13->i8[4 * a1];
  bzero(v13, 4 * a1);
  double v45 = (char *)v13 + v12;
  uint64_t v14 = (float32x4_t *)operator new(4 * a1);
  std::string __p = v14;
  uint64_t v43 = &v14->i8[4 * a1];
  bzero(v14, 4 * a1);
  uint64_t v42 = (char *)v14 + v12;
  if (a1 < 4)
  {
    unint64_t v15 = 0;
LABEL_9:
    uint64_t v31 = 0;
    uint64_t v32 = &v14->i8[4 * v15];
    uint64_t v33 = &v13->i8[4 * v15];
    uint64_t v34 = &a4->i8[4 * v15];
    uint64_t v35 = &a3->i8[4 * v15];
    uint64_t v36 = &a5->i8[4 * v15];
    uint64_t v37 = &a2->i8[4 * v15];
    unint64_t v38 = a1 - v15;
    do
    {
      uint64_t v39 = 4 * v31;
      float v40 = *(float *)&v37[4 * v31] / sqrtf(*(float *)&v36[4 * v31] + 0.00001);
      *(float *)&v33[v39] = v40;
      *(float *)&v32[v39] = *(float *)&v35[4 * v31] - (float)(*(float *)&v34[4 * v31] * v40);
      ++v31;
    }
    while (v38 != v31);
    goto LABEL_11;
  }
  unint64_t v15 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3727C5ACu);
  unint64_t v17 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v18 = v14;
  uint64_t v19 = a4;
  uint64_t v20 = a3;
  size_t v21 = v13;
  uint64_t v22 = a5;
  uint64_t v23 = a2;
  do
  {
    float32x4_t v24 = *v23++;
    float32x4_t v25 = v24;
    float32x4_t v26 = *v22++;
    float32x4_t v27 = vdivq_f32(v25, vsqrtq_f32(vaddq_f32(v26, v16)));
    *v21++ = v27;
    float32x4_t v28 = *v20++;
    float32x4_t v29 = v28;
    float32x4_t v30 = *v19++;
    *v18++ = vmlsq_f32(v29, v30, v27);
    v17 -= 4;
  }
  while (v17);
  if (v15 != a1) {
    goto LABEL_9;
  }
LABEL_11:
  sub_19E31A5A4(a6, (uint64_t)&v44, (uint64_t)&__p);
  if (__p)
  {
    uint64_t v42 = (char *)__p;
    operator delete(__p);
  }
  if (v44)
  {
    double v45 = (char *)v44;
    operator delete(v44);
  }
}

void sub_19E31A56C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_19E31A5A4(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  id v6 = *(const void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  int64_t v7 = v5 - *(void *)a2;
  if (v5 != *(void *)a2)
  {
    if (v7 < 0) {
      sub_19E13D694();
    }
    uint64_t v8 = (char *)operator new(v5 - *(void *)a2);
    *a1 = v8;
    a1[1] = v8;
    uint64_t v9 = &v8[4 * (v7 >> 2)];
    a1[2] = v9;
    memcpy(v8, v6, v7);
    a1[1] = v9;
  }
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  int v10 = *(const void **)a3;
  int64_t v11 = *(void *)(a3 + 8) - *(void *)a3;
  if (v11)
  {
    if (v11 < 0) {
      sub_19E13D694();
    }
    uint64_t v12 = (char *)operator new(v11);
    a1[3] = v12;
    a1[4] = v12;
    uint64_t v13 = &v12[4 * (v11 >> 2)];
    a1[5] = v13;
    memcpy(v12, v10, v11);
    a1[4] = v13;
  }
  return a1;
}

void sub_19E31A678(_Unwind_Exception *exception_object)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v4;
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

double MRLInitLayerParameters(uint64_t a1)
{
  *(void *)a1 = 0x100000000;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 13) = 0;
  *(void *)(a1 + 24) = 0x100000000;
  *(unsigned char *)(a1 + 32) = 1;
  *(_DWORD *)(a1 + 36) = 32;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 240) = 32;
  *(unsigned char *)(a1 + 244) = 0;
  *(unsigned char *)(a1 + 376) = 0;
  *(_DWORD *)(a1 + 380) = 32;
  *(unsigned char *)(a1 + 384) = 0;
  *(void *)(a1 + 448) = 0;
  *(void *)(a1 + 456) = 0;
  *(void *)(a1 + 440) = 0;
  *(_WORD *)(a1 + 464) = 0;
  *(_DWORD *)(a1 + 468) = 1112014848;
  *(_WORD *)(a1 + 472) = 0;
  *(void *)(a1 + 484) = 0;
  *(void *)(a1 + 476) = 0;
  return result;
}

uint64_t sub_19E31A72C(double *a1, double *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  if (*a1 > *a2) {
    return 1;
  }
  double v3 = a1[1];
  double v4 = a2[1];
  if (v3 < v4) {
    return 0xFFFFFFFFLL;
  }
  if (v3 > v4) {
    return 1;
  }
  double v5 = a1[2];
  double v6 = a2[2];
  if (v5 < v6) {
    return 0xFFFFFFFFLL;
  }
  if (v5 <= v6) {
    return ((unint64_t)((char *)a1 - (char *)a2) >> 3);
  }
  return 1;
}

uint64_t sub_19E31A7A4(unsigned int a1, double (*a2)(void, const void *, void, uint64_t), uint64_t a3, float64x2_t *a4, float64x2_t *a5, void *a6, void **a7, double *a8, double a9, int a10)
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  long long v153 = 0u;
  long long v154 = 0u;
  *(_OWORD *)ptr = 0u;
  double v142 = a9;
  int v143 = a10 % 3;
  int v144 = a10 / 3 % 3;
  uint64_t v145 = (a10 / 9 % 3);
  uint64_t v146 = (double *)a4;
  uint64_t v147 = (double *)a5;
  uint64_t v148 = a8;
  uint64_t v149 = a2;
  int v14 = 2 * a1;
  unsigned int v140 = a1;
  int v141 = 2 * a1 + 3;
  uint64_t v150 = a3;
  __dst[0] = (void *)0x7FF0000000000000;
  __dst[1] = a6;
  DWORD2(v154) = 0;
  unint64_t v15 = &v153;
  v151[1] = 0;
  sub_19E14E5FC((uint64_t)&v153, (uint64_t)sub_19E31A72C);
  v151[0] = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
  if (!v151[0]
    || (v151[1] = malloc_type_malloc(4 * (int)a1, 0x100004052888210uLL)) == 0
    || (LODWORD(ptr[1]) = 128, (ptr[0] = malloc_type_malloc(0x400uLL, 0x80040B8603338uLL)) == 0)
    || (float32x4_t v16 = (double *)malloc_type_malloc(8 * v141, 0x100004000313F17uLL)) == 0)
  {
LABEL_166:
    uint64_t v74 = 4294967293;
    goto LABEL_167;
  }
  unint64_t v17 = v16;
  if ((int)a1 < 1)
  {
    float32x4_t v27 = v16 + 3;
    double v29 = 0.0;
    if (v143) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  if (a1 < 0xC)
  {
    uint64_t v18 = 0;
LABEL_8:
    uint64_t v19 = &v17[v18 + 3 + a1];
    uint64_t v20 = &v17[v18 + 3];
    size_t v21 = &a5->f64[v18];
    uint64_t v22 = &a4->f64[v18];
    uint64_t v23 = a1 - v18;
    do
    {
      *v20++ = (*v21 + *v22) * 0.5;
      double v24 = *v21++;
      double v25 = v24;
      double v26 = *v22++;
      *v19++ = v25 - v26;
      --v23;
    }
    while (v23);
    goto LABEL_10;
  }
  uint64_t v18 = 0;
  float32x4_t v30 = (char *)(v16 + 3);
  unint64_t v31 = (unint64_t)&v16[a1 + 3];
  uint64_t v32 = a1 + 3;
  uint64_t v33 = &v16[v32];
  uint64_t v34 = (char *)&v16[a1 + v32];
  unint64_t v35 = (unint64_t)&a4->f64[a1];
  uint64_t v36 = &a5->f64[a1];
  BOOL v38 = (unint64_t)(v17 + 3) < v35 && v31 > (unint64_t)a4;
  BOOL v40 = v30 < (char *)v36 && v31 > (unint64_t)a5;
  BOOL v42 = (unint64_t)v33 < v35 && v34 > (char *)a4;
  BOOL v44 = v33 < v36 && v34 > (char *)a5;
  if ((unint64_t)v33 < v31 && v30 < v34) {
    goto LABEL_8;
  }
  if (v38) {
    goto LABEL_8;
  }
  if (v40) {
    goto LABEL_8;
  }
  if (v42) {
    goto LABEL_8;
  }
  if (v44) {
    goto LABEL_8;
  }
  uint64_t v18 = a1 & 0xFFFFFFFE;
  double v46 = (float64x2_t *)(v17 + 3);
  __asm { FMOV            V0.2D, #0.5 }
  uint64_t v50 = v18;
  uint64_t v51 = a5;
  uint64_t v52 = a4;
  do
  {
    float64x2_t v53 = *v52++;
    float64x2_t v54 = v53;
    float64x2_t v55 = *v51++;
    *double v46 = vmulq_f64(vaddq_f64(v55, v54), _Q0);
    *(float64x2_t *)((char *)v46++ + 8 * a1) = vsubq_f64(v55, v54);
    v50 -= 2;
  }
  while (v50);
  if (v18 != a1) {
    goto LABEL_8;
  }
LABEL_10:
  float32x4_t v27 = v17 + 3;
  if (!v143)
  {
    if (a1 >= 4)
    {
      uint64_t v56 = a1 & 0xFFFFFFFC;
      uint64_t v64 = (float64x2_t *)&v17[(int)a1 + 5];
      float64x2_t v65 = 0uLL;
      uint64_t v66 = v56;
      float64x2_t v67 = 0uLL;
      do
      {
        float64x2_t v65 = vmlaq_f64(v65, v64[-1], v64[-1]);
        float64x2_t v67 = vmlaq_f64(v67, *v64, *v64);
        v64 += 2;
        v66 -= 4;
      }
      while (v66);
      double v29 = vaddvq_f64(vaddq_f64(v67, v65));
      if (v56 == a1) {
        goto LABEL_65;
      }
    }
    else
    {
      uint64_t v56 = 0;
      double v29 = 0.0;
    }
    uint64_t v68 = a1 - v56;
    int v69 = &v17[v56 + 3 + (int)a1];
    do
    {
      double v70 = *v69++;
      double v29 = v29 + v70 * v70;
      --v68;
    }
    while (v68);
LABEL_65:
    double v29 = sqrt(v29);
    goto LABEL_66;
  }
  if (a1 < 4)
  {
    uint64_t v28 = 0;
    double v29 = 0.0;
LABEL_57:
    uint64_t v61 = a1 - v28;
    id v62 = &v17[v28 + 3 + (int)a1];
    do
    {
      double v63 = *v62++;
      double v29 = fmax(v63, v29);
      --v61;
    }
    while (v61);
    goto LABEL_66;
  }
  uint64_t v28 = a1 & 0xFFFFFFFC;
  uint64_t v57 = (float64x2_t *)&v17[(int)a1 + 5];
  float64x2_t v58 = 0uLL;
  uint64_t v59 = v28;
  float64x2_t v60 = 0uLL;
  do
  {
    float64x2_t v58 = vmaxnmq_f64(v57[-1], v58);
    float64x2_t v60 = vmaxnmq_f64(*v57, v60);
    v57 += 2;
    v59 -= 4;
  }
  while (v59);
  double v29 = vmaxnmvq_f64(vmaxnmq_f64(v58, v60));
  if (v28 != a1) {
    goto LABEL_57;
  }
LABEL_66:
  float v71 = v29 * 0.5;
  *unint64_t v17 = v71;
  double v72 = v149(v140, v27, 0, v150);
  if (v72 < *(double *)__dst)
  {
    __dst[0] = *(void **)&v72;
    memcpy(__dst[1], v27, 8 * (int)v140);
  }
  ++**((_DWORD **)v148 + 7);
  v17[1] = v72;
  int v73 = DWORD2(v154)++;
  v17[2] = (double)v73;
  if (!sub_19E14E7B0((uint64_t)&v153, (uint64_t)v17))
  {
    free(v17);
    uint64_t v74 = 4294967293;
    goto LABEL_167;
  }
  uint64_t v74 = sub_19E31B24C(v17, (int *)&v140);
  if (v74 == 1)
  {
    uint64_t v137 = a7;
    while (1)
    {
      uint64_t v139 = (int)v140;
      uint64_t v75 = __dst[0];
      double v76 = v142;
      int v77 = (int)ptr[1];
      if (SLODWORD(ptr[1]) >= (int)v154)
      {
        uint64_t v78 = ptr[0];
        int v79 = v145;
        uint64_t v80 = sub_19E14E730((uint64_t)v15);
        if (!v80) {
          goto LABEL_157;
        }
      }
      else
      {
        LODWORD(ptr[1]) += v154;
        uint64_t v78 = malloc_type_realloc(ptr[0], 8 * ((int)v154 + v77), 0x80040B8603338uLL);
        ptr[0] = v78;
        if (!v78) {
          goto LABEL_166;
        }
        int v79 = v145;
        uint64_t v80 = sub_19E14E730((uint64_t)v15);
        if (!v80) {
          goto LABEL_157;
        }
      }
      signed int v81 = (void *)v80;
      uint64_t v82 = sub_19E14EC28((uint64_t)v15);
      long long v83 = (double *)v81[3];
      double v84 = *v83;
      double v85 = v83[1];
      double v86 = **(double **)(v82 + 24);
      if (v79 == 1) {
        break;
      }
      uint64_t v87 = 0;
      while (1)
      {
        v78[v87] = v83;
        uint64_t v88 = sub_19E14E760(v81);
        if (!v88) {
          break;
        }
        signed int v81 = v88;
        long long v83 = (double *)v88[3];
        if (*v83 != v84) {
          break;
        }
        ++v87;
        if (v83[1] != v85) {
          goto LABEL_85;
        }
      }
      LODWORD(v87) = v87 + 1;
LABEL_85:
      if (v84 != v86) {
        goto LABEL_86;
      }
LABEL_118:
      if ((int)v87 >= 1)
      {
        int v110 = 1;
        long long v138 = v15;
LABEL_120:
        int v111 = 0;
        int v112 = 0;
        while (1)
        {
          int v114 = v112;
          unsigned int v115 = (v112 & (v112 >> 31)) - 1;
          uint64_t v116 = (double *)v78[v112];
          while (1)
          {
            int v117 = v114;
            if (v114 < 1) {
              break;
            }
            if (*(double *)v78[--v114] != *v116)
            {
              unsigned int v115 = v114;
              break;
            }
          }
          if ((int)v87 <= v112 + 1) {
            int v118 = v112 + 1;
          }
          else {
            int v118 = v87;
          }
          int v113 = v118 - 1;
          uint64_t v119 = v112;
          while (1)
          {
            uint64_t v120 = v119 + 1;
            if (v119 + 1 >= v87) {
              break;
            }
            double v121 = *(double *)v78[++v119];
            if (v121 != *v116)
            {
              int v113 = v120 - 1;
              int v118 = v120;
              break;
            }
          }
          double v122 = v116[1];
          if (v117 < 1)
          {
            double v123 = -INFINITY;
            if (v120 < v87)
            {
LABEL_136:
              double v124 = *v116;
              double v125 = (v122 - *(double *)(v78[v118] + 8)) / (*v116 - *(double *)v78[v118]);
              if (v118 == v87) {
                goto LABEL_141;
              }
              goto LABEL_140;
            }
          }
          else
          {
            double v123 = (v122 - *(double *)(v78[v115] + 8)) / (*v116 - *(double *)v78[v115]);
            if (v120 < v87) {
              goto LABEL_136;
            }
          }
          double v124 = *v116;
          double v125 = -INFINITY;
          if (v118 == v87) {
            goto LABEL_141;
          }
LABEL_140:
          if (v122 - fmax(v123, v125) * v124 <= *(double *)__dst - fabs(*(double *)__dst) * v76)
          {
LABEL_141:
            uint64_t v126 = sub_19E31B24C(v116, (int *)&v140);
            if (v126 != 1)
            {
              uint64_t v74 = v126;
              a7 = v137;
              unint64_t v15 = v138;
              goto LABEL_167;
            }
            if (v110)
            {
              uint64_t v127 = v140;
              if ((int)v140 < 1)
              {
LABEL_149:
                int v110 = 1;
              }
              else
              {
                uint64_t v128 = (double *)(v78[v112] + 8 * v139 + 24);
                uint64_t v129 = v147;
                uint64_t v130 = (double *)*((void *)v148 + 5);
                size_t v131 = v146;
                while (*v128 <= *v130 || *v128 <= (*v129 - *v131) * v148[4])
                {
                  ++v131;
                  ++v129;
                  ++v130;
                  ++v128;
                  if (!--v127) {
                    goto LABEL_149;
                  }
                }
                int v110 = 0;
              }
            }
            int v111 = 1;
          }
          if (v145 != 1)
          {
            if (v145 == 2) {
              int v113 = sub_19E313CFC(v118 - v112) + v112;
            }
            else {
              int v113 = v112;
            }
          }
          int v112 = v113 + 1;
          if (v113 + 1 >= (int)v87)
          {
            if (!v111)
            {
              _ZF = v76 == 0.0;
              double v76 = 0.0;
              unint64_t v15 = v138;
              if (_ZF) {
                break;
              }
              goto LABEL_120;
            }
            a7 = v137;
            unint64_t v15 = v138;
            if (!v110) {
              goto LABEL_161;
            }
            uint64_t v74 = 4;
            goto LABEL_167;
          }
        }
      }
LABEL_157:
      uint64_t v132 = sub_19E14EC28((uint64_t)v15);
      double v133 = **(double **)(v132 + 24);
      do
      {
        uint64_t v134 = v132;
        uint64_t v132 = (uint64_t)sub_19E14EC58((void *)v132);
      }
      while (v132 && **(double **)(v132 + 24) == v133);
      uint64_t v135 = sub_19E31B24C(*(double **)(v134 + 24), (int *)&v140);
      a7 = v137;
      if (v135 != 1)
      {
        uint64_t v74 = v135;
        goto LABEL_167;
      }
LABEL_161:
      if (*(double *)__dst < *(double *)&v75)
      {
        uint64_t v74 = 3;
        if (sub_19E238E50(v148, *(double *)__dst, *(double *)&v75)) {
          goto LABEL_167;
        }
      }
    }
    *uint64_t v78 = v83;
    LODWORD(v87) = 1;
    if (v84 == v86) {
      goto LABEL_118;
    }
LABEL_86:
    double v156 = v86 * 1.0;
    unint64_t v157 = 0xFFF0000000000000;
    uint64_t v89 = (void *)sub_19E14EB80((uint64_t)v15, (uint64_t)&v156);
    double v90 = *(double *)(v89[3] + 8);
    double v156 = v84 * 1.0;
    unint64_t v157 = 0xFFF0000000000000;
    for (uint64_t i = (void *)sub_19E14EB80((uint64_t)v15, (uint64_t)&v156); i != v89; uint64_t i = sub_19E14E760(i))
    {
      long long v93 = (double *)i[3];
      double v94 = *v93;
      double v95 = v93[1];
      if (v95 <= v85 + (*v93 - v84) * (v90 - v85) * (1.0 / (v86 - v84)))
      {
        if (v87 && (uint64_t v96 = (double *)v78[(int)v87 - 1], v94 == *v96))
        {
          if (v95 <= v96[1])
          {
            if (v79 != 1)
            {
              uint64_t v107 = (int)v87;
              LODWORD(v87) = v87 + 1;
              v78[v107] = v93;
            }
          }
          else
          {
            double v156 = v94 * 1.0;
            unint64_t v157 = 0xFFF0000000000000;
            long long v97 = (void *)sub_19E14EB80((uint64_t)v15, (uint64_t)&v156);
            uint64_t i = sub_19E14EC58(v97);
          }
        }
        else
        {
          unsigned int v98 = v87 - 2;
          int v99 = v87;
          if ((int)v87 >= 1) {
            int v100 = 1;
          }
          else {
            int v100 = v87;
          }
LABEL_99:
          if (v99 < 2)
          {
            int v92 = v100;
          }
          else
          {
            int v92 = v99;
            uint64_t v101 = v98;
            long long v102 = (double *)v78[--v99];
            while (v101 * 8)
            {
              uint64_t v103 = (double *)v78[v101];
              double v104 = v103[1];
              double v105 = v102[1];
              --v101;
              _ZF = *v103 == *v102 && v104 == v105;
              if (!_ZF)
              {
                --v98;
                if ((v104 - v105) * (v94 - *v103) + (v95 - v104) * (*v102 - *v103) < 0.0) {
                  goto LABEL_99;
                }
                break;
              }
            }
          }
          LODWORD(v87) = v92 + 1;
          v78[v92] = v93;
        }
      }
    }
    if (v79 == 1)
    {
      v78[(int)v87] = v89[3];
      LODWORD(v87) = v87 + 1;
    }
    else
    {
      uint64_t v87 = (int)v87;
      uint64_t v108 = (double *)v89[3];
      while (1)
      {
        v78[v87] = v108;
        long long v109 = sub_19E14E760(v89);
        if (!v109) {
          break;
        }
        uint64_t v89 = v109;
        uint64_t v108 = (double *)v109[3];
        if (*v108 != v86) {
          break;
        }
        ++v87;
        if (v108[1] != v90) {
          goto LABEL_118;
        }
      }
      LODWORD(v87) = v87 + 1;
    }
    goto LABEL_118;
  }
LABEL_167:
  sub_19E14E668((uint64_t)v15);
  free(ptr[0]);
  free(v151[1]);
  free(v151[0]);
  *a7 = __dst[0];
  return v74;
}

uint64_t sub_19E31B24C(double *a1, int *a2)
{
  double v3 = a1;
  uint64_t v4 = *a2;
  size_t v5 = *a2;
  double v6 = a1 + 3;
  int64_t v7 = &a1[v4 + 3];
  double v8 = *v7;
  if ((int)v4 <= 1)
  {
    int v10 = 0;
    if ((int)v5 >= 1) {
      goto LABEL_7;
    }
LABEL_10:
    unsigned int v15 = 0;
    goto LABEL_18;
  }
  uint64_t v9 = 0;
  int v10 = 0;
  double v11 = *v7;
  do
  {
    double v12 = a1[v4 + 4 + v9];
    double v8 = fmax(v12, v11);
    ++v9;
    if (v12 > v11) {
      int v10 = v9;
    }
    double v11 = v8;
  }
  while (v5 - 1 != v9);
  if ((int)v5 < 1) {
    goto LABEL_10;
  }
LABEL_7:
  double v13 = v8 * 0.05;
  if (v4 >= 8)
  {
    float64x2_t v16 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v8, 0);
    float64x2_t v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v13, 0);
    uint64_t v14 = v5 & 0xFFFFFFF8;
    uint64_t v18 = (float64x2_t *)&a1[v4 + 7];
    int32x4_t v19 = 0uLL;
    uint64_t v20 = v14;
    int32x4_t v21 = 0uLL;
    do
    {
      float64x2_t v23 = v18[-2];
      float64x2_t v22 = v18[-1];
      float64x2_t v25 = *v18;
      float64x2_t v24 = v18[1];
      v18 += 4;
      int32x4_t v19 = vsubq_s32(v19, vuzp1q_s32((int32x4_t)vcgeq_f64(v17, vsubq_f64(v16, v23)), (int32x4_t)vcgeq_f64(v17, vsubq_f64(v16, v22))));
      int32x4_t v21 = vsubq_s32(v21, vuzp1q_s32((int32x4_t)vcgeq_f64(v17, vsubq_f64(v16, v25)), (int32x4_t)vcgeq_f64(v17, vsubq_f64(v16, v24))));
      v20 -= 8;
    }
    while (v20);
    unsigned int v15 = vaddvq_s32(vaddq_s32(v21, v19));
    if (v14 == v5) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v14 = 0;
    unsigned int v15 = 0;
  }
  double v26 = &a1[v14 + 3 + v4];
  size_t v27 = v5 - v14;
  do
  {
    double v28 = *v26++;
    if (v8 - v28 <= v13) {
      ++v15;
    }
    --v27;
  }
  while (v27);
LABEL_18:
  uint64_t v29 = a2[1];
  int v30 = a2[5];
  double v128 = v8;
  if (v30 != 1)
  {
    if (!v30)
    {
      if (v15 != v5) {
        goto LABEL_56;
      }
      goto LABEL_21;
    }
    if (v15 >= 2 && v30 == 2)
    {
      int v10 = sub_19E313CFC(v15);
      if ((int)v5 >= 1)
      {
        for (uint64_t i = 0; v5 != i; ++i)
        {
          if (v128 - v7[i] <= v128 * 0.05)
          {
            if (!v10)
            {
              int v10 = i;
              break;
            }
            --v10;
          }
        }
      }
    }
LABEL_56:
    uint64_t v48 = (_UNKNOWN **)sub_19E14EB04((uint64_t)(a2 + 26), (uint64_t)v3);
    if (!v48) {
      return 0xFFFFFFFFLL;
    }
    v7[v10] = v7[v10] * 0.333333333;
    if (a2[4])
    {
      if ((int)v5 < 1)
      {
        double v50 = 0.0;
        goto LABEL_78;
      }
      if (v5 >= 4)
      {
        size_t v49 = v5 & 0x7FFFFFFC;
        float64x2_t v53 = (float64x2_t *)&v3[v4 + 5];
        float64x2_t v54 = 0uLL;
        uint64_t v55 = v5 & 0xFFFFFFFC;
        float64x2_t v56 = 0uLL;
        do
        {
          float64x2_t v54 = vmaxnmq_f64(v53[-1], v54);
          float64x2_t v56 = vmaxnmq_f64(*v53, v56);
          v53 += 2;
          v55 -= 4;
        }
        while (v55);
        double v50 = vmaxnmvq_f64(vmaxnmq_f64(v54, v56));
        if (v49 == v5)
        {
LABEL_78:
          float v67 = v50 * 0.5;
          *double v3 = v67;
          int v68 = a2[32];
          a2[32] = v68 + 1;
          v3[2] = (double)v68;
          sub_19E14F1E4((uint64_t)(a2 + 26), v48);
          size_t v69 = 8 * v29;
          double v70 = (double *)malloc_type_malloc(8 * v29, 0x100004000313F17uLL);
          if (v70)
          {
            float v71 = v70;
            memcpy(v70, v3, v69);
            v71[v10 + 3] = v71[v10 + 3] - v7[v10];
            double v72 = (*((double (**)(void, double *, void, void))a2 + 7))(*a2, v71 + 3, 0, *((void *)a2 + 8));
            if (v72 < *((double *)a2 + 11))
            {
              *((double *)a2 + 11) = v72;
              memcpy(*((void **)a2 + 12), v71 + 3, 8 * *a2);
            }
            uint64_t v73 = *((void *)a2 + 6);
            ++**(_DWORD **)(v73 + 56);
            v71[1] = v72;
            if (sub_19E238F90(v73)) {
              goto LABEL_82;
            }
            uint64_t v74 = *((void *)a2 + 6);
            if (*((double *)a2 + 11) < *(double *)(v74 + 8)) {
              goto LABEL_84;
            }
            if (sub_19E238F1C(v74)) {
              goto LABEL_86;
            }
            if (sub_19E238F44(*((void *)a2 + 6))) {
              goto LABEL_123;
            }
            int v114 = a2[32];
            a2[32] = v114 + 1;
            v71[2] = (double)v114;
            if (!sub_19E14E7B0((uint64_t)(a2 + 26), (uint64_t)v71)) {
              goto LABEL_135;
            }
            unsigned int v115 = (double *)malloc_type_malloc(v69, 0x100004000313F17uLL);
            if (v115)
            {
              float v71 = v115;
              memcpy(v115, v3, v69);
              v71[v10 + 3] = v71[v10 + 3] + v7[v10];
              double v116 = (*((double (**)(void, double *, void, void))a2 + 7))(*a2, v71 + 3, 0, *((void *)a2 + 8));
              if (v116 < *((double *)a2 + 11))
              {
                *((double *)a2 + 11) = v116;
                memcpy(*((void **)a2 + 12), v71 + 3, 8 * *a2);
              }
              uint64_t v117 = *((void *)a2 + 6);
              ++**(_DWORD **)(v117 + 56);
              v71[1] = v116;
              if (sub_19E238F90(v117))
              {
LABEL_82:
                uint64_t v47 = 4294967291;
LABEL_136:
                free(v71);
                return v47;
              }
              uint64_t v118 = *((void *)a2 + 6);
              if (*((double *)a2 + 11) < *(double *)(v118 + 8))
              {
LABEL_84:
                uint64_t v47 = 2;
                goto LABEL_136;
              }
              if (sub_19E238F1C(v118))
              {
LABEL_86:
                uint64_t v47 = 5;
                goto LABEL_136;
              }
              if (sub_19E238F44(*((void *)a2 + 6)))
              {
LABEL_123:
                uint64_t v47 = 6;
                goto LABEL_136;
              }
              int v119 = a2[32];
              a2[32] = v119 + 1;
              v71[2] = (double)v119;
              if (sub_19E14E7B0((uint64_t)(a2 + 26), (uint64_t)v71)) {
                return 1;
              }
LABEL_135:
              uint64_t v47 = 4294967293;
              goto LABEL_136;
            }
          }
          return 4294967293;
        }
      }
      else
      {
        size_t v49 = 0;
        double v50 = 0.0;
      }
      size_t v57 = v5 - v49;
      float64x2_t v58 = &v3[v49 + 3 + v4];
      do
      {
        double v59 = *v58++;
        double v50 = fmax(v59, v50);
        --v57;
      }
      while (v57);
      goto LABEL_78;
    }
    if ((int)v5 < 1)
    {
      double v52 = 0.0;
    }
    else
    {
      if (v5 >= 4)
      {
        size_t v51 = v5 & 0x7FFFFFFC;
        float64x2_t v60 = (float64x2_t *)&v3[v4 + 5];
        float64x2_t v61 = 0uLL;
        uint64_t v62 = v5 & 0xFFFFFFFC;
        float64x2_t v63 = 0uLL;
        do
        {
          float64x2_t v61 = vmlaq_f64(v61, v60[-1], v60[-1]);
          float64x2_t v63 = vmlaq_f64(v63, *v60, *v60);
          v60 += 2;
          v62 -= 4;
        }
        while (v62);
        double v52 = vaddvq_f64(vaddq_f64(v63, v61));
        if (v51 == v5) {
          goto LABEL_77;
        }
      }
      else
      {
        size_t v51 = 0;
        double v52 = 0.0;
      }
      size_t v64 = v5 - v51;
      float64x2_t v65 = &v3[v51 + 3 + v4];
      do
      {
        double v66 = *v65++;
        double v52 = v52 + v66 * v66;
        --v64;
      }
      while (v64);
    }
LABEL_77:
    double v50 = sqrt(v52);
    goto LABEL_78;
  }
LABEL_21:
  uint64_t v129 = (uint64_t)&a1[v4 + 3];
  unint64_t v31 = (int32x4_t *)*((void *)a2 + 10);
  uint64_t v126 = (void *)*((void *)a2 + 9);
  if ((int)v5 <= 0) {
    goto LABEL_91;
  }
  uint64_t v122 = a2[1];
  double v32 = v8 * 0.05;
  int64x2_t v124 = vdupq_n_s64(0x7FF0000000000000uLL);
  uint64_t v33 = *a2;
  uint64_t v34 = *((void *)a2 + 9);
  unint64_t v35 = a1 + 3;
  while (1)
  {
    while (1)
    {
      double v36 = v35[v4];
      if (v8 - v36 <= v32) {
        break;
      }
      *(int64x2_t *)uint64_t v34 = v124;
      v34 += 16;
      ++v35;
      if (!--v33) {
        goto LABEL_38;
      }
    }
    double v37 = *v35;
    double *v35 = *v35 + v36 * -0.333333333;
    double v38 = (*((double (**)(void, const void *, void, void))a2 + 7))(*a2, v6, 0, *((void *)a2 + 8));
    if (v38 < *((double *)a2 + 11))
    {
      *((double *)a2 + 11) = v38;
      memcpy(*((void **)a2 + 12), v6, 8 * *a2);
    }
    uint64_t v39 = *((void *)a2 + 6);
    ++**(_DWORD **)(v39 + 56);
    *(double *)uint64_t v34 = v38;
    if (sub_19E238F90(v39)) {
      return 4294967291;
    }
    uint64_t v40 = *((void *)a2 + 6);
    if (*((double *)a2 + 11) < *(double *)(v40 + 8)) {
      return 2;
    }
    if (sub_19E238F1C(v40)) {
      return 5;
    }
    if (sub_19E238F44(*((void *)a2 + 6))) {
      return 6;
    }
    double *v35 = v37 + v35[v4] * 0.333333333;
    double v41 = (*((double (**)(void, const void *, void, void))a2 + 7))(*a2, v6, 0, *((void *)a2 + 8));
    if (v41 < *((double *)a2 + 11))
    {
      *((double *)a2 + 11) = v41;
      memcpy(*((void **)a2 + 12), v6, 8 * *a2);
    }
    uint64_t v42 = *((void *)a2 + 6);
    ++**(_DWORD **)(v42 + 56);
    *(double *)(v34 + 8) = v41;
    if (sub_19E238F90(v42)) {
      return 4294967291;
    }
    uint64_t v43 = *((void *)a2 + 6);
    if (*((double *)a2 + 11) < *(double *)(v43 + 8)) {
      return 2;
    }
    if (sub_19E238F1C(v43)) {
      return 5;
    }
    if (sub_19E238F44(*((void *)a2 + 6))) {
      return 6;
    }
    *v35++ = v37;
    double v8 = v128;
    v34 += 16;
    if (!--v33)
    {
LABEL_38:
      if (v5 < 8)
      {
        size_t v44 = 0;
        double v3 = a1;
        uint64_t v29 = v122;
        goto LABEL_90;
      }
      size_t v44 = v5 & 0x7FFFFFF8;
      int32x4_t v75 = (int32x4_t)xmmword_19E351190;
      double v76 = v31 + 1;
      v77.i64[0] = 0x400000004;
      v77.i64[1] = 0x400000004;
      v78.i64[0] = 0x800000008;
      v78.i64[1] = 0x800000008;
      uint64_t v79 = v5 & 0xFFFFFFF8;
      double v3 = a1;
      uint64_t v29 = v122;
      do
      {
        v76[-1] = v75;
        int32x4_t *v76 = vaddq_s32(v75, v77);
        int32x4_t v75 = vaddq_s32(v75, v78);
        v76 += 2;
        v79 -= 8;
      }
      while (v79);
      for (; v5 != v44; ++v44)
LABEL_90:
        v31->i32[v44] = v44;
LABEL_91:
      j__qsort_r(v31, v5, 4uLL, v126, (int (__cdecl *)(void *, const void *, const void *))sub_19E31C42C);
      uint64_t v80 = sub_19E14EB04((uint64_t)(a2 + 26), (uint64_t)v3);
      if (v80)
      {
        if (v15)
        {
          signed int v81 = (_UNKNOWN **)v80;
          uint64_t v82 = 0;
          long long v83 = v3;
          size_t v84 = 8 * v29;
          uint64_t v123 = v5 & 0xFFFFFFFC;
          uint64_t v125 = v15;
          double v85 = &v83[v4];
          double v121 = (float64x2_t *)(v85 + 5);
          double v86 = v85 + 3;
          while (1)
          {
            uint64_t v87 = 8 * v31->i32[v82];
            *(double *)(v129 + v87) = *(double *)(v129 + v87) * 0.333333333;
            if (!a2[4]) {
              break;
            }
            if ((int)v5 < 1)
            {
              double v89 = 0.0;
            }
            else
            {
              if (v5 >= 4)
              {
                float64x2_t v92 = 0uLL;
                double v94 = v121;
                uint64_t v93 = v5 & 0xFFFFFFFC;
                float64x2_t v95 = 0uLL;
                do
                {
                  float64x2_t v92 = vmaxnmq_f64(v94[-1], v92);
                  float64x2_t v95 = vmaxnmq_f64(*v94, v95);
                  v94 += 2;
                  v93 -= 4;
                }
                while (v93);
                double v89 = vmaxnmvq_f64(vmaxnmq_f64(v92, v95));
                uint64_t v88 = v5 & 0xFFFFFFFC;
                if (v5 == v123) {
                  goto LABEL_115;
                }
              }
              else
              {
                uint64_t v88 = 0;
                double v89 = 0.0;
              }
              size_t v96 = v5 - v88;
              long long v97 = &v86[v88];
              do
              {
                double v98 = *v97++;
                double v89 = fmax(v98, v89);
                --v96;
              }
              while (v96);
            }
LABEL_115:
            float v106 = v89 * 0.5;
            *a1 = v106;
            int v107 = a2[32];
            a2[32] = v107 + 1;
            a1[2] = (double)v107;
            signed int v81 = sub_19E14F1E4((uint64_t)(a2 + 26), v81);
            uint64_t v108 = (double *)malloc_type_malloc(v84, 0x100004000313F17uLL);
            if (!v108) {
              return 4294967293;
            }
            float v71 = v108;
            memcpy(v108, a1, v84);
            uint64_t v109 = v31->i32[v82];
            v71[v109 + 3] = v71[v109 + 3] - *(double *)(v129 + 8 * v109);
            uint64_t v110 = *((void *)v126 + 2 * v109);
            LODWORD(v109) = a2[32];
            a2[32] = v109 + 1;
            *((void *)v71 + 1) = v110;
            v71[2] = (double)(int)v109;
            if (!sub_19E14E7B0((uint64_t)(a2 + 26), (uint64_t)v71)) {
              goto LABEL_135;
            }
            int v111 = (double *)malloc_type_malloc(v84, 0x100004000313F17uLL);
            if (!v111) {
              return 4294967293;
            }
            float v71 = v111;
            memcpy(v111, a1, v84);
            uint64_t v112 = v31->i32[v82];
            v71[v112 + 3] = v71[v112 + 3] + *(double *)(v129 + 8 * v112);
            uint64_t v113 = *((void *)v126 + 2 * v112 + 1);
            LODWORD(v112) = a2[32];
            a2[32] = v112 + 1;
            *((void *)v71 + 1) = v113;
            v71[2] = (double)(int)v112;
            if (!sub_19E14E7B0((uint64_t)(a2 + 26), (uint64_t)v71)) {
              goto LABEL_135;
            }
            ++v82;
            uint64_t v47 = 1;
            if (v82 == v125) {
              return v47;
            }
          }
          if ((int)v5 < 1)
          {
            double v91 = 0.0;
          }
          else
          {
            if (v5 < 4)
            {
              uint64_t v90 = 0;
              double v91 = 0.0;
              goto LABEL_112;
            }
            float64x2_t v99 = 0uLL;
            uint64_t v101 = v121;
            uint64_t v100 = v5 & 0xFFFFFFFC;
            float64x2_t v102 = 0uLL;
            do
            {
              float64x2_t v99 = vmlaq_f64(v99, v101[-1], v101[-1]);
              float64x2_t v102 = vmlaq_f64(v102, *v101, *v101);
              v101 += 2;
              v100 -= 4;
            }
            while (v100);
            double v91 = vaddvq_f64(vaddq_f64(v102, v99));
            uint64_t v90 = v5 & 0xFFFFFFFC;
            if (v5 != v123)
            {
LABEL_112:
              size_t v103 = v5 - v90;
              double v104 = &v86[v90];
              do
              {
                double v105 = *v104++;
                double v91 = v91 + v105 * v105;
                --v103;
              }
              while (v103);
            }
          }
          double v89 = sqrt(v91);
          goto LABEL_115;
        }
        return 1;
      }
      return 0xFFFFFFFFLL;
    }
  }
}

uint64_t sub_19E31BD2C(uint64_t a1, uint64_t a2, float64x2_t *a3, uint64_t a4)
{
  if (!a1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, float64x2_t *, void))a4)(a1, *(void *)(a4 + 16), a3, *(void *)(a4 + 8));
    if (!a3) {
      return result;
    }
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(a4 + 24);
  uint64_t v8 = *(void *)(a4 + 32);
  uint64_t v10 = *(void *)(a4 + 16);
  if (a1 < 6)
  {
    uint64_t v11 = 0;
    do
    {
LABEL_4:
      *(double *)(v10 + 8 * v11) = *(double *)(v9 + 8 * v11)
                                 + (*(double *)(v8 + 8 * v11) - *(double *)(v9 + 8 * v11)) * *(double *)(a2 + 8 * v11);
      ++v11;
    }
    while (a1 != v11);
    goto LABEL_5;
  }
  uint64_t v11 = 0;
  if ((unint64_t)(v10 - v9) < 0x20) {
    goto LABEL_4;
  }
  if ((unint64_t)(v10 - a2) < 0x20) {
    goto LABEL_4;
  }
  if ((unint64_t)(v10 - v8) < 0x20) {
    goto LABEL_4;
  }
  uint64_t v16 = 0;
  uint64_t v11 = a1 & 0xFFFFFFFC;
  uint64_t v17 = (8 * a1) & 0x7FFFFFFE0;
  do
  {
    float64x2_t v18 = vmlaq_f64(*(float64x2_t *)(v9 + 16 + v16), vsubq_f64(*(float64x2_t *)(v8 + 16 + v16), *(float64x2_t *)(v9 + 16 + v16)), *(float64x2_t *)(a2 + 16 + v16));
    int32x4_t v19 = (float64x2_t *)(v10 + v16);
    float64x2_t *v19 = vmlaq_f64(*(float64x2_t *)(v9 + v16), vsubq_f64(*(float64x2_t *)(v8 + v16), *(float64x2_t *)(v9 + v16)), *(float64x2_t *)(a2 + v16));
    v19[1] = v18;
    v16 += 32;
  }
  while (v17 != v16);
  if (v11 != a1) {
    goto LABEL_4;
  }
LABEL_5:
  uint64_t result = (*(uint64_t (**)(uint64_t))a4)(a1);
  if (!a3) {
    return result;
  }
LABEL_8:
  if (!a1) {
    return result;
  }
  double v13 = *(float64x2_t **)(a4 + 24);
  uint64_t v14 = *(float64x2_t **)(a4 + 32);
  if (a1 < 8)
  {
    uint64_t v15 = 0;
LABEL_32:
    uint64_t v29 = &v14->f64[v15];
    int v30 = &v13->f64[v15];
    unint64_t v31 = &a3->f64[v15];
    uint64_t v32 = a1 - v15;
    do
    {
      double v33 = *v29++;
      double v34 = v33;
      double v35 = *v30++;
      double *v31 = *v31 * (v34 - v35);
      ++v31;
      --v32;
    }
    while (v32);
    return result;
  }
  uint64_t v15 = 0;
  uint64_t v20 = (float64x2_t *)((char *)a3 + 8 * a1);
  BOOL v22 = (float64x2_t *)&v13->f64[a1] > a3 && v13 < v20;
  if (v14 < v20 && (float64x2_t *)&v14->f64[a1] > a3) {
    goto LABEL_32;
  }
  if (v22) {
    goto LABEL_32;
  }
  uint64_t v15 = a1 & 0xFFFFFFFC;
  float64x2_t v24 = v14 + 1;
  float64x2_t v25 = v13 + 1;
  double v26 = a3 + 1;
  uint64_t v27 = v15;
  do
  {
    float64x2_t v28 = vmulq_f64(*v26, vsubq_f64(*v24, *v25));
    v26[-1] = vmulq_f64(v26[-1], vsubq_f64(v24[-1], v25[-1]));
    *double v26 = v28;
    v24 += 2;
    v25 += 2;
    v26 += 2;
    v27 -= 4;
  }
  while (v27);
  if (v15 != a1) {
    goto LABEL_32;
  }
  return result;
}

uint64_t sub_19E31BF30(signed int a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, float64x2_t *a6, void **a7, uint64_t a8, double a9, int a10)
{
  v126[0] = a2;
  v126[1] = a3;
  unint64_t v128 = a4;
  unint64_t v129 = a5;
  uint64_t v17 = (float64x2_t *)malloc_type_malloc(32 * a1, 0x5F90338DuLL);
  uint64_t v127 = v17;
  if (v17)
  {
    int v18 = a10;
    if (a1 <= 0)
    {
      uint64_t v26 = *(void *)(a8 + 40);
      *(void *)(a8 + 40) = (char *)v17 + 24 * a1;
      uint64_t v25 = sub_19E31A7A4(a1, (double (*)(void, const void *, void, uint64_t))sub_19E31BD2C, (uint64_t)v126, (float64x2_t *)((char *)v17 + 8 * a1), &v17[a1], a6, a7, (double *)a8, a9, a10);
      *(void *)(a8 + 40) = v26;
      goto LABEL_157;
    }
    uint64_t v19 = (2 * a1);
    unint64_t v20 = *(void *)(a8 + 40);
    uint64_t v21 = 3 * a1;
    uint64_t v22 = a1;
    uint64_t v23 = 8 * a1;
    if (a1 < 0x1A)
    {
      uint64_t v24 = 0;
      goto LABEL_137;
    }
    uint64_t v125 = a7;
    uint64_t v24 = 0;
    uint64_t v27 = (char *)a6 + v23;
    float64x2_t v28 = (char *)&v17->f64[a1];
    unint64_t v29 = (unint64_t)&v28[v23];
    int v30 = (char *)&v17->f64[v19];
    unint64_t v31 = (unint64_t)&v17->f64[v19 + (unint64_t)v23 / 8];
    uint64_t v32 = (char *)v17 + 24 * a1;
    unint64_t v33 = (unint64_t)v17 + 24 * a1 + v23;
    unint64_t v34 = a4 + v23;
    unint64_t v35 = a5 + v23;
    unint64_t v36 = v20 + v23;
    BOOL v38 = v31 > (unint64_t)a6 && v30 < v27;
    BOOL v124 = v38;
    BOOL v40 = v33 > (unint64_t)a6 && v32 < v27;
    BOOL v123 = v40;
    BOOL v42 = v34 > (unint64_t)a6 && (unint64_t)v27 > a4;
    BOOL v122 = v42;
    BOOL v44 = v35 > (unint64_t)a6 && (unint64_t)v27 > a5;
    BOOL v121 = v44;
    BOOL v46 = v36 > (unint64_t)a6 && v20 < (unint64_t)v27;
    BOOL v120 = v46;
    BOOL v48 = (unint64_t)v28 < v31 && (unint64_t)v30 < v29;
    BOOL v50 = (unint64_t)v28 < v33 && (unint64_t)v32 < v29;
    BOOL v52 = (unint64_t)v28 < v34 && v29 > a4;
    BOOL v54 = (unint64_t)v28 < v35 && v29 > a5;
    BOOL v56 = (unint64_t)v28 < v36 && v20 < v29;
    BOOL v58 = (unint64_t)v30 < v33 && (unint64_t)v32 < v31;
    BOOL v60 = (unint64_t)v30 < v34 && v31 > a4;
    BOOL v62 = (unint64_t)v30 < v35 && v31 > a5;
    BOOL v64 = (unint64_t)v30 < v36 && v20 < v31;
    BOOL v66 = (unint64_t)v32 < v34 && v33 > a4;
    BOOL v68 = (unint64_t)v32 < v35 && v33 > a5;
    BOOL v70 = (unint64_t)v32 < v36 && v20 < v33;
    BOOL v71 = v28 < v27 && v29 > (unint64_t)a6;
    if (v71 || v124 || v123 || v122 || v121 || v120 || v48 || v50)
    {
      uint64_t v22 = a1;
      uint64_t v21 = 3 * a1;
      a7 = v125;
      int v18 = a10;
      uint64_t v19 = (2 * a1);
      goto LABEL_137;
    }
    uint64_t v19 = (2 * a1);
    if (!v52)
    {
      int v18 = a10;
      if (v54)
      {
        uint64_t v22 = a1;
        uint64_t v21 = 3 * a1;
      }
      else
      {
        uint64_t v21 = 3 * a1;
        if (!v56 && !v58 && !v60 && !v62 && !v64)
        {
          a7 = v125;
          if (v66)
          {
            uint64_t v22 = a1;
          }
          else
          {
            uint64_t v22 = a1;
            if (!v68 && !v70)
            {
              double v72 = (void *)&v17->f64[a1];
              uint64_t v24 = a1 & 0xFFFFFFFE;
              __asm { FMOV            V0.2D, #1.0 }
              uint64_t v77 = v24;
              int32x4_t v78 = *(float64x2_t **)(a8 + 40);
              uint64_t v79 = (float64x2_t *)a5;
              uint64_t v80 = (float64x2_t *)a4;
              signed int v81 = a6;
              uint64_t v82 = (_OWORD *)&v17->f64[2 * a1];
              long long v83 = (float64x2_t *)((char *)v17 + 24 * a1);
              do
              {
                float64x2_t v84 = *v80++;
                float64x2_t v85 = v84;
                float64x2_t v86 = vsubq_f64(*v81, v84);
                float64x2_t v87 = *v79++;
                float64x2_t v88 = vsubq_f64(v87, v85);
                *v81++ = vdivq_f64(v86, v88);
                *double v72 = 0;
                v72[1] = 0;
                v72 += 2;
                *v82++ = _Q0;
                float64x2_t v89 = *v78++;
                *v83++ = vdivq_f64(v89, v88);
                v77 -= 2;
              }
              while (v77);
              if (v24 == a1) {
                goto LABEL_139;
              }
            }
          }
LABEL_137:
          uint64_t v90 = 0;
          double v91 = (char *)&v17->f64[v24 + v21];
          uint64_t v92 = v24 + v19;
          uint64_t v93 = v24 + a1;
          unint64_t v94 = v20 + 8 * v24;
          unint64_t v95 = a5 + 8 * v24;
          unint64_t v96 = a4 + 8 * v24;
          long long v97 = (char *)&a6->f64[v24];
          uint64_t v98 = v22 - v24;
          float64x2_t v99 = (char *)&v17->f64[v92];
          uint64_t v100 = (char *)&v17->f64[v93];
          do
          {
            uint64_t v101 = 8 * v90;
            *(double *)&v97[v101] = (*(double *)&v97[8 * v90] - *(double *)(v96 + 8 * v90))
                                  / (*(double *)(v95 + 8 * v90) - *(double *)(v96 + 8 * v90));
            *(void *)&v100[v101] = 0;
            *(void *)&v99[v101] = 0x3FF0000000000000;
            *(double *)&v91[v101] = *(double *)(v94 + 8 * v90)
                                  / (*(double *)(v95 + 8 * v90) - *(double *)(v96 + 8 * v90));
            ++v90;
          }
          while (v98 != v90);
LABEL_139:
          *(void *)(a8 + 40) = (char *)v17 + 8 * v21;
          uint64_t v25 = sub_19E31A7A4(a1, (double (*)(void, const void *, void, uint64_t))sub_19E31BD2C, (uint64_t)v126, (float64x2_t *)((char *)v17 + 8 * a1), (float64x2_t *)((char *)v17 + 8 * v19), a6, a7, (double *)a8, a9, v18);
          *(void *)(a8 + 40) = v20;
          if (a1 >= 6)
          {
            uint64_t v102 = 0;
            size_t v103 = (char *)a6 + v23;
            BOOL v105 = a5 + v23 > (unint64_t)a6 && (unint64_t)v103 > a5;
            if (((unint64_t)v103 <= a4 || a4 + v23 <= (unint64_t)a6) && !v105)
            {
              uint64_t v102 = v22 & 0x7FFFFFFC;
              int v107 = (float64x2_t *)(a4 + 16);
              uint64_t v108 = a6 + 1;
              uint64_t v109 = (float64x2_t *)(a5 + 16);
              uint64_t v110 = v22 & 0xFFFFFFFC;
              do
              {
                float64x2_t v111 = vmlaq_f64(*v107, vsubq_f64(*v109, *v107), *v108);
                v108[-1] = vmlaq_f64(v107[-1], vsubq_f64(v109[-1], v107[-1]), v108[-1]);
                *uint64_t v108 = v111;
                v107 += 2;
                v108 += 2;
                v109 += 2;
                v110 -= 4;
              }
              while (v110);
              if (v102 == v22) {
                goto LABEL_157;
              }
            }
          }
          else
          {
            uint64_t v102 = 0;
          }
          uint64_t v112 = (double *)(a5 + 8 * v102);
          uint64_t v113 = &a6->f64[v102];
          int v114 = (double *)(a4 + 8 * v102);
          uint64_t v115 = v22 - v102;
          do
          {
            double v116 = *v114++;
            double v117 = v116;
            double v118 = *v112++;
            double *v113 = v117 + (v118 - v117) * *v113;
            ++v113;
            --v115;
          }
          while (v115);
LABEL_157:
          free(v127);
          return v25;
        }
        uint64_t v22 = a1;
      }
      a7 = v125;
      goto LABEL_137;
    }
    uint64_t v22 = a1;
    uint64_t v21 = 3 * a1;
    a7 = v125;
    int v18 = a10;
    goto LABEL_137;
  }
  return 4294967293;
}

uint64_t sub_19E31C42C(uint64_t a1, int *a2, int *a3)
{
  double v3 = fmin(*(double *)(a1 + 16 * *a2), *(double *)(a1 + 16 * *a2 + 8));
  double v4 = fmin(*(double *)(a1 + 16 * *a3), *(double *)(a1 + 16 * *a3 + 8));
  if (v3 < v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v3 > v4;
  }
}

void sub_19E31C4F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31C5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31C768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31C790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31CAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CB64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CBB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CBCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CBE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E31CD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31CE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31CE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31CE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31CEA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31CFE0(_Unwind_Exception *a1)
{
  double v6 = v4;

  _Unwind_Resume(a1);
}

void sub_19E31D004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31D028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31D0F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31D548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *__p,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,void *a31,void *a32,uint64_t a33,void *a34,void *a35,void *a36)
{
  operator delete(__p);
  _Block_object_dispose((const void *)(v39 - 120), 8);

  _Unwind_Resume(a1);
}

void sub_19E31D6E0(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  id v46 = a4;
  id v9 = a5;
  if (a3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F35628]);
    uint64_t v47 = objc_msgSend_initWithDevice_count_(v10, v11, *(void *)(a1 + 32), a3);
    double v12 = (void *)MEMORY[0x1E4F35640];
    uint64_t v16 = objc_msgSend_rows(*(void **)(a1 + 40), v13, v14, v15);
    uint64_t v20 = objc_msgSend_columns(*(void **)(a1 + 40), v17, v18, v19);
    uint64_t v24 = objc_msgSend_rowBytes(*(void **)(a1 + 40), v21, v22, v23);
    uint64_t v28 = objc_msgSend_dataType(*(void **)(a1 + 40), v25, v26, v27);
    unint64_t v31 = objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(v12, v29, v16, v20, v24, v28);
    if (*(void *)(a1 + 104) >= (unint64_t)(*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) + a2))
    {
      uint64_t v32 = 0;
      do
      {
        id v33 = objc_alloc(MEMORY[0x1E4F35618]);
        unint64_t v35 = objc_msgSend_initWithBuffer_descriptor_(v33, v34, *(void *)(a1 + 48), (uint64_t)v31);
        uint64_t v39 = objc_msgSend_labels(*(void **)(a1 + 56), v36, v37, v38);
        double v41 = objc_msgSend_subarrayWithRange_(v39, v40, *(unsigned int *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), a2);

        LOBYTE(v45) = *(unsigned char *)(a1 + 112);
        BOOL v44 = objc_msgSend_seqTrainingForward_subMatrix_reductionSumResults_alphaVec_labels_rowOffset_computeNRows_computeLossGradient_(*(void **)(a1 + 64), v42, *(void *)(a1 + 72), (uint64_t)v35, v9, *(void *)(a1 + 80), v41, *(unsigned int *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), a2, v45);
        if (*(unsigned char *)(a1 + 112)) {
          objc_msgSend_setCopyOperationAtIndex_sourceMatrix_destinationMatrix_offsets_(v47, v43, v32, (uint64_t)v44, *(void *)(a1 + 88), 0, *(unsigned int *)(*(void *)(*(void *)(a1 + 96) + 8) + 24));
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) += a2;
        ++v32;
      }
      while (*(void *)(a1 + 104) >= (unint64_t)(*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)
                                                        + a2));
    }
    objc_msgSend_encodeToCommandBuffer_copyDescriptor_(v46, v30, *(void *)(a1 + 72), (uint64_t)v47);
  }
}

void sub_19E31D8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19E31E034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28)
{
  if (a28) {
    operator delete(a28);
  }

  _Unwind_Resume(a1);
}

void sub_19E31E480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31E4AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31E59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31E68C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31E6C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_19E31E934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)a1 = &unk_1EF0A94D8;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a4;
  *(void *)(a1 + 24) = a5;
  *(void *)(a1 + 32) = a6;
  *(_WORD *)(a1 + 44) = 0;
  __n128 result = *(__n128 *)a3;
  long long v7 = *(_OWORD *)(a3 + 16);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a3 + 32);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v7;
  *(void *)a1 = &unk_1EF0A9DF8;
  return result;
}

void sub_19E31E98C(uint64_t a1, int a2)
{
  uint64_t v2 = **(void **)(a1 + 24);
  if (v2) {
    BOOL v3 = a2 < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    int v6 = 0;
    long long v7 = (float *)(**(void **)(a1 + 32) + 4 * *(int *)(a1 + 56));
    uint64_t v8 = (const float *)(v2 + 4 * *(int *)(a1 + 52));
    id v9 = (const float *)(**(void **)(a1 + 16) + 4 * *(int *)(a1 + 48));
    id v10 = (const float *)(a1 + 40);
    do
    {
      int v14 = *(_DWORD *)(a1 + 72);
      if (v14 == 2)
      {
        if (*(unsigned char *)(a1 + 44))
        {
          vDSP_vsmul(v9, 1, v10, v7, 1, *(int *)(a1 + 76));
        }
        else if (*(int *)(a1 + 80) < 2)
        {
          vDSP_vmul(v9, 1, v8, 1, v7, 1, *(int *)(a1 + 76));
        }
        else
        {
          uint64_t v17 = 0;
          uint64_t v18 = v8;
          do
          {
            vDSP_vsmul(&v9[*(_DWORD *)(a1 + 76) * (int)v17], 1, v18, &v7[*(_DWORD *)(a1 + 76) * (int)v17], 1, *(int *)(a1 + 76));
            ++v17;
            ++v18;
          }
          while (v17 < *(int *)(a1 + 80));
        }
        goto LABEL_10;
      }
      if (v14 == 1)
      {
        if (!*(unsigned char *)(a1 + 44))
        {
          vDSP_vsub(v8, 1, v9, 1, v7, 1, *(int *)(a1 + 76));
          goto LABEL_10;
        }
        float __B = -*(float *)(a1 + 40);
        vDSP_Length v11 = *(int *)(a1 + 76);
        p_B = &__B;
        double v13 = v9;
      }
      else
      {
        if (v14) {
          goto LABEL_10;
        }
        if (!*(unsigned char *)(a1 + 44))
        {
          if (*(int *)(a1 + 80) < 2)
          {
            vDSP_vadd(v9, 1, v8, 1, v7, 1, *(int *)(a1 + 76));
          }
          else
          {
            uint64_t v15 = 0;
            uint64_t v16 = v8;
            do
            {
              vDSP_vsadd(&v9[*(_DWORD *)(a1 + 76) * (int)v15], 1, v16, &v7[*(_DWORD *)(a1 + 76) * (int)v15], 1, *(int *)(a1 + 76));
              ++v15;
              ++v16;
            }
            while (v15 < *(int *)(a1 + 80));
          }
          goto LABEL_10;
        }
        vDSP_Length v11 = *(int *)(a1 + 76);
        double v13 = v9;
        p_B = v10;
      }
      vDSP_vsadd(v13, 1, p_B, v7, 1, v11);
LABEL_10:
      v9 += *(int *)(a1 + 60);
      v8 += *(int *)(a1 + 64);
      v7 += *(int *)(a1 + 68);
      ++v6;
    }
    while (v6 != a2);
  }
}

void sub_19E31EBDC(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = v2;
  if (v2) {
    CFRetain(v2);
  }
  sub_19E2935E8(&theArray, v3);

  CFArrayRef v4 = theArray;
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFIndex v6 = Count;
    CFArrayRef v7 = theArray;
    if (theArray)
    {
      CFIndex v8 = CFArrayGetCount(theArray);
      if (!v6)
      {
LABEL_15:
        if (theArray) {
          CFRelease(theArray);
        }
        goto LABEL_17;
      }
    }
    else
    {
      CFIndex v8 = 0;
      if (!Count) {
        goto LABEL_15;
      }
    }
    if (v4 == v7)
    {
      unint64_t v10 = 0;
      do
      {
        if (v8 == v10) {
          break;
        }
        sub_19E321504(v4, v10++);
      }
      while (v6 != v10);
    }
    else
    {
      unint64_t v9 = 0;
      do
        sub_19E321504(v4, v9++);
      while (v6 != v9);
    }
    goto LABEL_15;
  }
LABEL_17:
}

void sub_19E31ECDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31ECF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E265838((const void **)va);

  _Unwind_Resume(a1);
}

void sub_19E31ED08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E265838((const void **)va);

  _Unwind_Resume(a1);
}

void sub_19E31ED20(void *a1, uint64_t a2)
{
  id v3 = a1;
  CFArrayRef v7 = v3;
  switch(*(void *)a2)
  {
    case 0:
    case 2:
    case 3:
    case 4:
    case 5:
    case 9:
    case 0xDLL:
    case 0xELL:
    case 0x10:
    case 0x17:
      unint64_t v8 = 0;
      for (uint64_t i = (_DWORD *)(a2 + 128); ; i += 4)
      {
        unint64_t v10 = objc_msgSend_inputsWithDimensions(v7, v4, v5, v6);
        unint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);

        if (v8 >= v14) {
          break;
        }
        uint64_t v18 = objc_msgSend_inputsWithDimensions(v7, v15, v16, v17);
        uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, v8, v20);

        *uint64_t i = objc_msgSend_tensorSize(v21, v22, v23, v24);
        ++v8;
      }
      unint64_t v25 = 0;
      for (unint64_t j = (_DWORD *)(a2 + 256); ; j += 4)
      {
        uint64_t v27 = objc_msgSend_outputsWithDimensions(v7, v15, v16, v17);
        unint64_t v31 = objc_msgSend_count(v27, v28, v29, v30);

        if (v25 >= v31) {
          break;
        }
        unint64_t v35 = objc_msgSend_outputsWithDimensions(v7, v32, v33, v34);
        uint64_t v38 = objc_msgSend_objectAtIndexedSubscript_(v35, v36, v25, v37);

        *unint64_t j = objc_msgSend_tensorSize(v38, v39, v40, v41);
        ++v25;
      }
      break;
    case 1:
      uint64_t v80 = objc_msgSend_inputsWithDimensions(v3, v4, v5, v6);
      long long v83 = objc_msgSend_objectAtIndex_(v80, v81, 0, v82);
      objc_msgSend_dimension(v83, v84, v85, v86);
      id v87 = (id)objc_claimAutoreleasedReturnValue();
      float64x2_t v88 = v87;
      if (v87) {
        CFRetain(v87);
      }
      sub_19E2935E8(&v112, v88);

      if (!v112)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      if (CFArrayGetCount(v112) == 2)
      {
        if (!v112)
        {
          uint64_t v108 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v108, "Could not construct");
          __cxa_throw(v108, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        int v89 = sub_19E3215D0(v112, 0);
        if (!v112)
        {
          uint64_t v110 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v110, "Could not construct");
          __cxa_throw(v110, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        *(_DWORD *)(a2 + 128) = sub_19E3215D0(v112, 1uLL) * v89;
      }
      else
      {
        if (!v112)
        {
          uint64_t v109 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v109, "Could not construct");
          __cxa_throw(v109, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        CFIndex Count = CFArrayGetCount(v112);
        if (Count)
        {
          unint64_t v94 = 0;
          uint64_t v95 = a2 + 128;
          do
          {
            if (!v112)
            {
              long long v97 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(v97, "Could not construct");
              __cxa_throw(v97, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
            }
            *(_DWORD *)(v95 + 4 * v94) = sub_19E3215D0(v112, v94);
            ++v94;
          }
          while (Count != v94);
        }
      }
      if (v112) {
        CFRelease(v112);
      }
      break;
    case 6:
    case 0xALL:
      float64x2_t v63 = objc_msgSend_inputsWithDimensions(v3, v4, v5, v6);
      BOOL v66 = objc_msgSend_objectAtIndex_(v63, v64, 0, v65);
      *(_DWORD *)(a2 + 128) = objc_msgSend_tensorSize(v66, v67, v68, v69);

      uint64_t v73 = objc_msgSend_outputsWithDimensions(v7, v70, v71, v72);
      double v76 = objc_msgSend_objectAtIndex_(v73, v74, 0, v75);
      *(_DWORD *)(a2 + 256) = (unint64_t)objc_msgSend_tensorSize(v76, v77, v78, v79) >> 1;

      break;
    case 0xBLL:
    case 0xCLL:
      BOOL v42 = objc_msgSend_outputsWithDimensions(v3, v4, v5, v6);
      uint64_t v45 = objc_msgSend_objectAtIndex_(v42, v43, 0, v44);
      objc_msgSend_dimension(v45, v46, v47, v48);
      id v49 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v50 = v49;
      if (v49) {
        CFRetain(v49);
      }
      sub_19E2935E8(&v112, v50);

      BOOL v54 = objc_msgSend_inputsWithDimensions(v7, v51, v52, v53);
      size_t v57 = objc_msgSend_objectAtIndex_(v54, v55, 0, v56);
      objc_msgSend_dimension(v57, v58, v59, v60);
      id v61 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v62 = v61;
      if (v61) {
        CFRetain(v61);
      }
      sub_19E2935E8(&theArray, v62);

      if (!theArray)
      {
        uint64_t v98 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v98, "Could not construct");
        __cxa_throw(v98, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      if (CFArrayGetCount(theArray) == 2)
      {
        if (!theArray)
        {
          uint64_t v101 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v101, "Could not construct");
          __cxa_throw(v101, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        *(_DWORD *)(a2 + 128) = sub_19E3215D0(theArray, 0);
        *(_DWORD *)(a2 + 132) = 1;
        if (!theArray)
        {
          size_t v103 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v103, "Could not construct");
          __cxa_throw(v103, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        *(_DWORD *)(a2 + 136) = sub_19E3215D0(theArray, 1uLL);
      }
      else
      {
        if (!theArray)
        {
          uint64_t v102 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v102, "Could not construct");
          __cxa_throw(v102, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        CFIndex v90 = CFArrayGetCount(theArray);
        if (v90)
        {
          for (unint64_t k = 0; k != v90; ++k)
          {
            if (!theArray)
            {
              unint64_t v96 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(v96, "Could not construct");
              __cxa_throw(v96, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
            }
            *(_DWORD *)(a2 + 128 + 4 * k) = sub_19E3215D0(theArray, k);
          }
        }
      }
      if (!v112)
      {
        float64x2_t v99 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v99, "Could not construct");
        __cxa_throw(v99, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      if (CFArrayGetCount(v112) == 3)
      {
        if (!v112)
        {
          double v104 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v104, "Could not construct");
          __cxa_throw(v104, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        int v92 = sub_19E3215D0(v112, 2uLL);
      }
      else
      {
        if (!v112)
        {
          BOOL v105 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v105, "Could not construct");
          __cxa_throw(v105, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        if (CFArrayGetCount(v112) != 2)
        {
          float v106 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v106, "Expected oututDims to have size 3 or 2.");
          __cxa_throw(v106, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        if (!v112)
        {
          int v107 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v107, "Could not construct");
          __cxa_throw(v107, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        int v92 = sub_19E3215D0(v112, 1uLL);
      }
      *(_DWORD *)(a2 + 256) = v92;
      if (theArray) {
        CFRelease(theArray);
      }
      if (v112) {
        CFRelease(v112);
      }
      break;
    default:
      break;
  }
}

void sub_19E31F4CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  __cxa_free_exception(v11);
  sub_19E265838(&a10);

  _Unwind_Resume(a1);
}

void sub_19E31F724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  sub_19E265838(&a9);
  sub_19E265838(&a10);

  _Unwind_Resume(a1);
}

void sub_19E31F744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F7C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F7D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E31F85C(BOOL *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*a1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  id v4 = v3;
  v21.__r_.__value_.__r.__words[0] = objc_msgSend_UTF8String(v4, v5, v6, v7);
  if (!sub_19E32169C(*a1, (const char **)&v21.__r_.__value_.__l.__data_))
  {
    unint64_t v9 = sub_19E26EDD8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = v4;
      uint64_t v14 = objc_msgSend_UTF8String(v10, v11, v12, v13);
      sub_19E330040(v14, buf, v9);
    }

    uint64_t v15 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    id v16 = v4;
    uint64_t v20 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
    sub_19E2927EC("dict does not have key: ", &v20);
    std::runtime_error::runtime_error(v15, &v21);
    __cxa_throw(v15, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
}

void sub_19E31F9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0)
    {
LABEL_6:

      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v16);
  goto LABEL_6;
}

void sub_19E31FA2C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v135 = (uint64_t)a3;
  bzero(a3, 0x2C0uLL);
  uint64_t v134 = v5;
  unint64_t v9 = objc_msgSend_nodeStr(v5, v6, v7, v8);
  *a3 = sub_19E32B318(v9);

  for (uint64_t i = 7; ; ++i)
  {
    uint64_t v14 = objc_msgSend_activations(v134, v10, v11, v12);
    unint64_t v18 = objc_msgSend_count(v14, v15, v16, v17);

    if (i - 7 >= v18) {
      break;
    }
    uint64_t v22 = objc_msgSend_activations(v134, v19, v20, v21);
    unint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v22, v23, i - 7, v24);

    a3[i] = sub_19E32B850(v25);
  }
  uint64_t v26 = objc_msgSend_properties(v134, v19, v20, v21);
  a3[15] = sub_19E32C0BC(v26, v27, v28, v29);

  uint64_t v33 = objc_msgSend_properties(v134, v30, v31, v32);
  a3[6] = sub_19E32BB18(v33, v34, v35, v36);

  uint64_t v40 = objc_msgSend_properties(v134, v37, v38, v39);
  a3[4] = sub_19E32BF14(v40, v41, v42, v43);

  uint64_t v47 = objc_msgSend_properties(v134, v44, v45, v46);
  a3[5] = sub_19E32BFE8(v47, v48, v49, v50);

  a3[2] = 0;
  a3[3] = 0;
  objc_msgSend_properties(v134, v51, v52, v53);
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v55 = v54;
  if (v54) {
    CFRetain(v54);
  }
  sub_19E159840(&v143, v55);

  double v142 = &v143;
  uint64_t v56 = *a3;
  if (v56 == sub_19E3202F0("LSTM"))
  {
    uint64_t v60 = objc_msgSend_properties(v134, v57, v58, v59);
    float64x2_t v63 = objc_msgSend_objectForKeyedSubscript_(v60, v61, (uint64_t)off_1E9457FC8, v62);

    BOOL v66 = objc_msgSend_exMRL_numberForKey_(v63, v64, (uint64_t)off_1E9457FE8, v65);
    *((_DWORD *)a3 + 80) = objc_msgSend_unsignedIntegerValue(v66, v67, v68, v69);

    uint64_t v72 = objc_msgSend_exMRL_numberForKey_(v63, v70, (uint64_t)off_1E9457FF0, v71);
    objc_msgSend_floatValue(v72, v73, v74, v75);
    *((_DWORD *)a3 + 108) = v76;

    uint64_t v79 = objc_msgSend_exMRL_numberForKey_(v63, v77, (uint64_t)off_1E9457FF8, v78);
    objc_msgSend_floatValue(v79, v80, v81, v82);
    *((_DWORD *)a3 + 109) = v83;
  }
  else
  {
    uint64_t v84 = *a3;
    if (v84 == sub_19E3202F0("Embedding") || (uint64_t v85 = *a3, v85 == sub_19E3202F0("EmbeddingLegacy")))
    {
      sub_19E3208AC((CFArrayRef *)&cf, &v142, off_1E9457FB8);
      if (!cf)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      *((_DWORD *)a3 + 80) = sub_19E3215D0((const __CFArray *)cf, 0);
      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      uint64_t v111 = *a3;
      uint64_t v112 = sub_19E3202F0("Pooling");
      uint64_t v113 = *a3;
      uint64_t v114 = sub_19E3202F0("Convolution");
      if (v111 == v112 || v113 == v114)
      {
        sub_19E3208AC((CFArrayRef *)&cf, &v142, off_1E9457FD0);
        if (!cf)
        {
          uint64_t v130 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v130, "Could not construct");
          __cxa_throw(v130, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        *(_DWORD *)(v135 + 320) = sub_19E3215D0((const __CFArray *)cf, 0);
        if (!cf)
        {
          size_t v131 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v131, "Could not construct");
          __cxa_throw(v131, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        *(_DWORD *)(v135 + 324) = sub_19E3215D0((const __CFArray *)cf, 1uLL);
        sub_19E3208AC((CFArrayRef *)&v140, &v142, off_1E9457FD8);
        if (!v140)
        {
          uint64_t v132 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v132, "Could not construct");
          __cxa_throw(v132, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        *(_DWORD *)(v135 + 328) = sub_19E3215D0((const __CFArray *)v140, 0);
        if (!v140)
        {
          double v133 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v133, "Could not construct");
          __cxa_throw(v133, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        *(_DWORD *)(v135 + 332) = sub_19E3215D0((const __CFArray *)v140, 1uLL);
        if (v140) {
          CFRelease(v140);
        }
        if (cf) {
          CFRelease(cf);
        }
      }
      else if (*(void *)v135 == 2 && *(void *)(v135 + 56) == 6)
      {
        double v118 = objc_msgSend_properties(v134, v115, v116, v117);
        BOOL v121 = objc_msgSend_objectForKeyedSubscript_(v118, v119, (uint64_t)off_1E9457FC8, v120);

        BOOL v124 = objc_msgSend_objectForKeyedSubscript_(v121, v122, (uint64_t)off_1E9457FE0, v123);
        objc_msgSend_floatValue(v124, v125, v126, v127);
        *(_DWORD *)(v135 + 384) = v128;
      }
    }
  }
  sub_19E31ED20(v134, v135);
  if (a2)
  {
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    int v89 = objc_msgSend_weights(v134, v86, v87, v88);
    uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v136, (uint64_t)v144, 16);
    if (v94)
    {
      uint64_t v95 = *(void *)v137;
      do
      {
        for (uint64_t j = 0; j != v94; ++j)
        {
          if (*(void *)v137 != v95) {
            objc_enumerationMutation(v89);
          }
          long long v97 = *(void **)(*((void *)&v136 + 1) + 8 * j);
          uint64_t v98 = (uint64_t (*)(uint64_t, uint64_t))off_1E9459420;
          float64x2_t v99 = objc_msgSend_index(v97, v91, v92, v93);
          uint64_t v103 = objc_msgSend_unsignedIntegerValue(v99, v100, v101, v102);
          CFDataRef v104 = (const __CFData *)v98(a2, v103);

          if (v104)
          {
            BOOL v105 = objc_msgSend_name(v97, v91, v92, v93);
            float v106 = (void *)sub_19E32C110(v105, v135);

            if (v106)
            {
              void *v106 = CFDataGetBytePtr(v104);
              uint64_t v110 = objc_msgSend_dimension(v97, v107, v108, v109);
              sub_19E31EBDC((uint64_t)v110, v110);
            }
            CFRelease(v104);
          }
        }
        uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v91, (uint64_t)&v136, (uint64_t)v144, 16);
      }
      while (v94);
    }
  }
  if (v143) {
    CFRelease(v143);
  }
}

void sub_19E32013C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, const void *a19, const void *a20,uint64_t a21,const void *a22)
{
  __cxa_free_exception(v22);
  sub_19E265838(&a19);
  sub_19E265838(&a20);
  sub_19E1551E8(&a22);

  _Unwind_Resume(a1);
}

uint64_t sub_19E3202F0(const char *a1)
{
  uint64_t v31 = a1;
  size_t v2 = strlen(a1);
  if (v2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_19E13C370();
  }
  size_t v3 = v2;
  if (v2 >= 0x17)
  {
    uint64_t v10 = (v2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v2 | 7) != 0x17) {
      uint64_t v10 = v2 | 7;
    }
    uint64_t v11 = v10 + 1;
    p_dst = (long long *)operator new(v10 + 1);
    *((void *)&__dst + 1) = v3;
    unint64_t v30 = v11 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    HIBYTE(v30) = v2;
    p_dst = &__dst;
    if (!v2)
    {
      LOBYTE(__dst) = 0;
      unsigned __int8 v5 = HIBYTE(v30);
      if ((SHIBYTE(v30) & 0x80000000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_16;
    }
  }
  memcpy(p_dst, a1, v3);
  *((unsigned char *)p_dst + v3) = 0;
  unsigned __int8 v5 = HIBYTE(v30);
  if ((SHIBYTE(v30) & 0x80000000) == 0)
  {
LABEL_5:
    int v6 = v5;
    int v7 = v5 - 9;
    uint64_t v8 = &__dst;
    switch(v7)
    {
      case 0:
        goto LABEL_76;
      case 1:
        if ((void)__dst != 0x6974617669746341 || WORD4(__dst) != 28271) {
          goto LABEL_80;
        }
        goto LABEL_88;
      case 2:
LABEL_58:
        if ((void)__dst == 0x74756C6F766E6F43 && *(void *)((char *)&__dst + 3) == 0x6E6F6974756C6F76) {
          goto LABEL_63;
        }
        break;
      case 4:
LABEL_64:
        if ((void)__dst == 0x6E657461636E6F43 && *(void *)((char *)&__dst + 5) == 0x6E6F6974616E6574) {
          goto LABEL_69;
        }
        break;
      case 6:
LABEL_70:
        if ((void)__dst == 0x6E69646465626D45 && *(void *)((char *)&__dst + 7) == 0x79636167654C676ELL) {
          goto LABEL_89;
        }
        break;
      case 9:
        if ((void)__dst != 0x726F4E6863746142
          || *((void *)&__dst + 1) != 0x6974617A696C616DLL
          || (unsigned __int16)v30 != 28271)
        {
          uint64_t v8 = &__dst;
          switch(v7)
          {
            case 0:
              goto LABEL_76;
            case 2:
              goto LABEL_58;
            case 4:
              goto LABEL_64;
            case 6:
              goto LABEL_70;
            default:
              goto LABEL_80;
          }
        }
        goto LABEL_87;
      default:
        goto LABEL_80;
    }
    if (v6 == 9)
    {
      uint64_t v8 = &__dst;
LABEL_76:
      if (*(void *)v8 == 0x6E69646465626D45 && *((unsigned char *)v8 + 8) == 103)
      {
        uint64_t v22 = 23;
        goto LABEL_96;
      }
      goto LABEL_80;
    }
    goto LABEL_80;
  }
LABEL_16:
  uint64_t v12 = *((void *)&__dst + 1);
  if (*((void *)&__dst + 1) == 10 && *(void *)__dst == 0x6974617669746341 && *(_WORD *)(__dst + 8) == 28271)
  {
LABEL_88:
    uint64_t v22 = 2;
    goto LABEL_96;
  }
  if (*((void *)&__dst + 1) == 18)
  {
    if (*(void *)__dst == 0x726F4E6863746142
      && *(void *)(__dst + 8) == 0x6974617A696C616DLL
      && *(_WORD *)(__dst + 16) == 28271)
    {
LABEL_87:
      uint64_t v22 = 1;
      goto LABEL_96;
    }
    uint64_t v12 = *((void *)&__dst + 1);
  }
  if (v12 == 11)
  {
    if (*(void *)__dst == 0x74756C6F766E6F43 && *(void *)(__dst + 3) == 0x6E6F6974756C6F76)
    {
LABEL_63:
      uint64_t v22 = 11;
      goto LABEL_96;
    }
    uint64_t v12 = *((void *)&__dst + 1);
  }
  if (v12 == 13)
  {
    if (*(void *)__dst == 0x6E657461636E6F43 && *(void *)(__dst + 5) == 0x6E6F6974616E6574)
    {
LABEL_69:
      uint64_t v22 = 3;
      goto LABEL_96;
    }
    uint64_t v12 = *((void *)&__dst + 1);
  }
  if (v12 == 15)
  {
    if (*(void *)__dst == 0x6E69646465626D45 && *(void *)(__dst + 7) == 0x79636167654C676ELL)
    {
LABEL_89:
      uint64_t v22 = 4;
      goto LABEL_96;
    }
    uint64_t v12 = *((void *)&__dst + 1);
  }
  if (v12 == 9)
  {
    uint64_t v8 = (long long *)__dst;
    goto LABEL_76;
  }
LABEL_80:
  if (sub_19E292704(&__dst, "FullConnection"))
  {
    uint64_t v22 = 0;
  }
  else if (sub_19E292704(&__dst, "LSTM"))
  {
    uint64_t v22 = 5;
  }
  else if (sub_19E292704(&__dst, "LSTMBidirectional"))
  {
    uint64_t v22 = 6;
  }
  else if (sub_19E292704(&__dst, "GRU"))
  {
    uint64_t v22 = 9;
  }
  else if (sub_19E292704(&__dst, "GRUBidirectional"))
  {
    uint64_t v22 = 10;
  }
  else
  {
    if (!sub_19E292704(&__dst, "Pooling"))
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      sub_19E2927EC("Unexpected NodeType: ", &v31);
      std::logic_error::logic_error(exception, &v28);
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
      __cxa_throw(exception, (struct type_info *)off_1E599CD18, MEMORY[0x1E4FBA1E8]);
    }
    uint64_t v22 = 12;
  }
LABEL_96:
  if (SHIBYTE(v30) < 0) {
    operator delete((void *)__dst);
  }
  return v22;
}

void sub_19E320820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v22 & 1) == 0)
    {
LABEL_6:
      if (a21 < 0) {
        operator delete(a16);
      }
      _Unwind_Resume(a1);
    }
  }
  else if (!v22)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v21);
  goto LABEL_6;
}

void sub_19E3208AC(CFArrayRef *a1, CFTypeRef **a2, void *a3)
{
  id v5 = a3;
  CFTypeRef v6 = **a2;
  if (v6) {
    CFRetain(**a2);
  }
  CFTypeRef v32 = v6;
  sub_19E31F85C((BOOL *)&v32, off_1E9457FC8);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v10 = (const __CFDictionary **)*a2;
  if (!*v10)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  CFTypeRef v28 = (CFTypeRef)objc_msgSend_UTF8String(off_1E9457FC8, v7, v8, v9);
  sub_19E320C78(*v10, (const char **)&v28, &cf);
  CFTypeRef v11 = cf;
  if (cf) {
    CFRetain(cf);
  }
  CFTypeRef v30 = v11;
  sub_19E31F85C((BOOL *)&v30, v5);
  if (v11) {
    CFRelease(v11);
  }
  if (!cf)
  {
    int v22 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v22, "Could not construct");
    __cxa_throw(v22, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  id v12 = v5;
  v27[0] = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
  sub_19E320E40((const __CFDictionary *)cf, v27, (uint64_t)&v28);
  if (v29)
  {
    CFTypeRef v16 = v28;
    if (v28) {
      CFRetain(v28);
    }
    CFTypeRef v25 = v16;
    sub_19E31F85C((BOOL *)&v25, @"dim");
    if (v16) {
      CFRelease(v16);
    }
    if (!v28)
    {
      uint64_t v23 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v23, "Could not construct");
      __cxa_throw(v23, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    sub_19E321350((const __CFDictionary *)v28, "dim", a1);
    if (!v29) {
      goto LABEL_23;
    }
LABEL_21:
    if (v28) {
      CFRelease(v28);
    }
    goto LABEL_23;
  }
  if (!cf)
  {
    uint64_t v24 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v24, "Could not construct");
    __cxa_throw(v24, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  id v17 = v12;
  v27[0] = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
  int v26 = sub_19E320ED0((const __CFDictionary *)cf, v27);
  v27[0] = (const char *)&v26;
  v27[1] = (const char *)1;
  *a1 = sub_19E320F74((uint64_t)v27);
  if (v29) {
    goto LABEL_21;
  }
LABEL_23:
  if (cf) {
    CFRelease(cf);
  }
}

void sub_19E320B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  sub_19E320C3C((uint64_t)va);
  sub_19E1551E8((const void **)va1);

  _Unwind_Resume(a1);
}

void sub_19E320C20()
{
}

void sub_19E320C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E320C3C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    size_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

void *sub_19E320C78@<X0>(const __CFDictionary *a1@<X0>, const char **a2@<X1>, void *a3@<X8>)
{
  id v4 = sub_19E320D0C(a1, a2);
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19E294048(exception);
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  id v5 = v4;
  CFRetain(v4);

  return sub_19E159840(a3, v5);
}

void sub_19E320CF4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const void *sub_19E320D0C(const __CFDictionary *a1, const char **a2)
{
  id v4 = (const UInt8 *)*a2;
  CFIndex v5 = strlen(*a2);
  if (!v4)
  {
    if (a1) {
      goto LABEL_4;
    }
LABEL_7:
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v4 = (const UInt8 *)CFStringCreateWithBytes(0, v4, v5, 0x8000100u, 0);
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (!a1) {
    goto LABEL_7;
  }
LABEL_4:
  Value = CFDictionaryGetValue(a1, v4);
  if (v4) {
LABEL_8:
  }
    CFRelease(v4);
LABEL_9:
  if (a1) {
    return Value;
  }
  else {
    return 0;
  }
}

void sub_19E320E40(const __CFDictionary *a1@<X0>, const char **a2@<X1>, uint64_t a3@<X8>)
{
  id v4 = sub_19E320D0C(a1, a2);
  if (v4)
  {
    CFIndex v5 = v4;
    CFRetain(v4);
    CFTypeID v6 = CFGetTypeID(v5);
    if (v6 == CFDictionaryGetTypeID())
    {
      *(void *)a3 = v5;
      *(unsigned char *)(a3 + 8) = 1;
      return;
    }
    CFRelease(v5);
  }
  *(unsigned char *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 0;
}

uint64_t sub_19E320ED0(const __CFDictionary *a1, const char **a2)
{
  size_t v2 = sub_19E320D0C(a1, a2);
  if (!v2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19E294048(exception);
    goto LABEL_6;
  }
  uint64_t result = sub_19E15C808((uint64_t)v2);
  if ((result & 0xFF00000000) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19E15A3B4(exception);
LABEL_6:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  return result;
}

void sub_19E320F4C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19E320F60(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

CFArrayRef sub_19E320F74(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  std::string __p = 0;
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  sub_19E15BEB0((uint64_t)&__p, v2);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    id v4 = *(int **)a1;
    CFIndex v5 = v15;
    uint64_t v6 = 4 * v3;
    do
    {
      if ((unint64_t)v5 >= v16) {
        CFIndex v5 = sub_19E3210A4((CFNumberRef **)&__p, v4);
      }
      else {
        sub_19E321298((uint64_t)&v16, v5++, v4);
      }
      uint64_t v15 = v5;
      ++v4;
      v6 -= 4;
    }
    while (v6);
  }
  CFArrayRef v7 = sub_19E15C03C((char **)&__p);
  uint64_t v8 = (CFNumberRef *)__p;
  if (__p)
  {
    uint64_t v9 = v15;
    uint64_t v10 = __p;
    if (v15 != __p)
    {
      do
      {
        id v12 = *--v9;
        uint64_t v11 = v12;
        if (v12) {
          CFRelease(v11);
        }
      }
      while (v9 != v8);
      uint64_t v10 = __p;
    }
    uint64_t v15 = v8;
    operator delete(v10);
  }
  return v7;
}

void sub_19E321070(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E15C1D8((void **)va);
  _Unwind_Resume(a1);
}

void sub_19E32108C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E15C1D8((void **)va);
  _Unwind_Resume(a1);
}

CFNumberRef *sub_19E3210A4(CFNumberRef **a1, int *a2)
{
  uint64_t v3 = a1[1] - *a1;
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) >> 61) {
    sub_19E13D694();
  }
  uint64_t v6 = (char *)a1[2] - (char *)*a1;
  if (v6 >> 2 > v4) {
    unint64_t v4 = v6 >> 2;
  }
  if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v7 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v7 = v4;
  }
  if (v7)
  {
    if (v7 >> 61) {
      sub_19E13C418();
    }
    uint64_t v8 = (char *)operator new(8 * v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  CFTypeRef v28 = (CFNumberRef *)&v8[8 * v3];
  char v29 = (CFNumberRef *)&v8[8 * v7];
  sub_19E321298((uint64_t)(a1 + 2), v28, a2);
  uint64_t v9 = v28;
  uint64_t v10 = v28 + 1;
  uint64_t v11 = *a1;
  id v12 = a1[1];
  if (v12 == *a1)
  {
    *a1 = v28;
    a1[1] = v10;
    a1[2] = v29;
  }
  else
  {
    unint64_t v13 = (char *)v12 - (char *)*a1 - 8;
    if (v13 < 0x58) {
      goto LABEL_18;
    }
    unint64_t v14 = ((char *)v11 - (char *)v12 + 7) & 0xFFFFFFFFFFFFFFF8;
    if ((CFNumberRef *)((char *)v28 + v14) < v12 && (CFNumberRef *)((char *)v12 + v14) < v28) {
      goto LABEL_18;
    }
    uint64_t v15 = (v13 >> 3) + 1;
    uint64_t v16 = 8 * (v15 & 0x3FFFFFFFFFFFFFFCLL);
    id v17 = &v28[v16 / 0xFFFFFFFFFFFFFFF8];
    unint64_t v18 = &v12[v16 / 0xFFFFFFFFFFFFFFF8];
    uint64_t v19 = v12 - 2;
    uint64_t v20 = v28 - 2;
    uint64_t v21 = v15 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v22 = *(_OWORD *)v19;
      *((_OWORD *)v20 - 1) = *((_OWORD *)v19 - 1);
      *(_OWORD *)uint64_t v20 = v22;
      *((_OWORD *)v19 - 1) = 0uLL;
      *(_OWORD *)uint64_t v19 = 0uLL;
      v19 -= 4;
      v20 -= 4;
      v21 -= 4;
    }
    while (v21);
    uint64_t v9 = v17;
    id v12 = v18;
    if (v15 != (v15 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_18:
      id v17 = v9;
      do
      {
        CFNumberRef v23 = *--v12;
        *--id v17 = v23;
        *id v12 = 0;
      }
      while (v12 != v11);
    }
    uint64_t v24 = *a1;
    id v12 = a1[1];
    *a1 = v17;
    a1[1] = v10;
    a1[2] = v29;
    if (v12 != v24)
    {
      do
      {
        int v26 = *--v12;
        CFTypeRef v25 = v26;
        if (v26) {
          CFRelease(v25);
        }
      }
      while (v12 != v24);
      id v12 = v24;
    }
  }
  if (v12) {
    operator delete(v12);
  }
  return v28 + 1;
}

void sub_19E321280(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E15C248((uint64_t)va);
  _Unwind_Resume(a1);
}

CFNumberRef sub_19E321298(uint64_t a1, CFNumberRef *a2, int *a3)
{
  int valuePtr = *a3;
  CFNumberRef result = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *a2 = result;
  if (!result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  return result;
}

void sub_19E321324(_Unwind_Exception *exception_object)
{
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_19E321350@<X0>(const __CFDictionary *a1@<X0>, char *a2@<X1>, void *a3@<X8>)
{
  unint64_t v4 = sub_19E3213E4(a1, a2);
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19E294048(exception);
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  CFIndex v5 = v4;
  CFRetain(v4);

  return sub_19E2935E8(a3, v5);
}

void sub_19E3213CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const void *sub_19E3213E4(const __CFDictionary *a1, char *__s)
{
  CFIndex v5 = strlen(__s);
  CFStringRef v6 = CFStringCreateWithBytes(0, (const UInt8 *)__s, v5, 0x8000100u, 0);
  if (!v6)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (a1) {
    Value = CFDictionaryGetValue(a1, v6);
  }
  CFRelease(v6);
  if (a1) {
    return Value;
  }
  else {
    return 0;
  }
}

unint64_t sub_19E321504(const __CFArray *a1, unint64_t a2)
{
  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2)) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19E294048(exception);
    goto LABEL_8;
  }
  unint64_t result = sub_19E15D140((unint64_t)ValueAtIndex);
  if (!v6)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19E15A3B4(exception);
LABEL_8:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  return result;
}

void sub_19E3215A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19E3215BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19E3215D0(const __CFArray *a1, unint64_t a2)
{
  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2)) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19E294048(exception);
    goto LABEL_8;
  }
  uint64_t result = sub_19E15C808((uint64_t)ValueAtIndex);
  if ((result & 0xFF00000000) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19E15A3B4(exception);
LABEL_8:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  return result;
}

void sub_19E32166C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19E321688(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL sub_19E32169C(BOOL a1, const char **a2)
{
  uint64_t v3 = (const UInt8 *)*a2;
  CFIndex v4 = strlen(*a2);
  if (v3)
  {
    uint64_t v3 = (const UInt8 *)CFStringCreateWithBytes(0, v3, v4, 0x8000100u, 0);
    if (!v3)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (!a1)
    {
LABEL_4:
      if (!v3) {
        return a1;
      }
      goto LABEL_8;
    }
  }
  else if (!a1)
  {
    goto LABEL_4;
  }
  a1 = CFDictionaryContainsKey((CFDictionaryRef)a1, v3) != 0;
  if (v3) {
LABEL_8:
  }
    CFRelease(v3);
  return a1;
}

void sub_19E32176C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19E321784(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_19E154194((const void **)va);
  _Unwind_Resume(a1);
}

void *sub_19E321798(void *a1, uint64_t a2, uint64_t a3, void *__src)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19E13C2D0(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v17 = *(void *)(a2 + 16);
  }
  sub_19E25BD4C((uint64_t)a1, (long long *)__p, a3, __src);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  *a1 = &unk_1EF0AADE8;
  a1[127] = __src[56];
  a1[128] = __src[72];
  a1[129] = __src[57];
  a1[130] = __src[58];
  int v7 = *((_DWORD *)__src + 32);
  int v8 = *((_DWORD *)__src + 33);
  int v9 = *((_DWORD *)__src + 34);
  BOOL v10 = v9 * v8 <= 1;
  if (v9 * v8 <= 1) {
    int v11 = 1;
  }
  else {
    int v11 = *((_DWORD *)__src + 32);
  }
  if (v9 * v8 <= 1) {
    int v8 = 1;
  }
  if (!v10) {
    int v7 = *((_DWORD *)__src + 34);
  }
  uint64_t v12 = v11;
  uint64_t v13 = v8;
  uint64_t v14 = v7;
  int v18 = 1;
  uint64_t v19 = v11;
  uint64_t v20 = v8;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = v7;
  sub_19E13C5C0((uint64_t)(a1 + 2), &v18, (int *)&v24);
  int v18 = 9;
  uint64_t v19 = v12;
  uint64_t v20 = v13;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = v14;
  sub_19E13C5C0((uint64_t)(a1 + 5), &v18, (int *)&v24);
  return a1;
}

void sub_19E321910(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E321924(_Unwind_Exception *a1)
{
  sub_19E25BF30(v1);
  _Unwind_Resume(a1);
}

void sub_19E321938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19E321954(void *a1, uint64_t a2)
{
  CFIndex v4 = (void **)a1[20];
  CFIndex v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31]) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  do
  {
    if (*v4) {
      operator delete(*v4);
    }
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    uint64_t v7 = a1[29];
    char v6 = (uint64_t *)a1[30];
    uint64_t v8 = *v6;
    *(void *)(v8 + 8) = *(void *)(v7 + 8);
    **(void **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        int v9 = (uint64_t *)v6[1];
        operator delete(v6);
        char v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
LABEL_10:
  BOOL v10 = *(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 72);

  return v10(a2, a1);
}

__n128 sub_19E321A3C(uint64_t a1, int a2)
{
  CFIndex v5 = (uint64_t **)(a1 + 48);
  CFIndex v4 = *(char **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = v4;
        int v8 = *((_DWORD *)v4 + 8);
        if (v8 <= a2) {
          break;
        }
        CFIndex v4 = *(char **)v7;
        CFIndex v5 = (uint64_t **)v7;
        if (!*(void *)v7) {
          goto LABEL_8;
        }
      }
      if (v8 >= a2) {
        break;
      }
      CFIndex v4 = (char *)*((void *)v7 + 1);
      if (!v4)
      {
        CFIndex v5 = (uint64_t **)(v7 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v7 = (char *)(a1 + 48);
LABEL_8:
    int v9 = v7;
    uint64_t v7 = (char *)operator new(0x50uLL);
    *((_DWORD *)v7 + 8) = a2;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *((void *)v7 + 9) = 0;
    *(void *)uint64_t v7 = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = v9;
    const void *v5 = (uint64_t *)v7;
    uint64_t v10 = **(void **)(a1 + 40);
    int v11 = (uint64_t *)v7;
    if (v10)
    {
      *(void *)(a1 + 40) = v10;
      int v11 = *v5;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 48), v11);
    ++*(void *)(a1 + 56);
  }
  __n128 result = *(__n128 *)(v6 + 40);
  long long v13 = *(_OWORD *)(v6 + 56);
  *((void *)v7 + 9) = *(void *)(v6 + 72);
  *(_OWORD *)(v7 + 56) = v13;
  *(__n128 *)(v7 + 40) = result;
  return result;
}

BOOL sub_19E321B28(uint64_t a1, void *a2, int a3)
{
  if ((a3 - 8) < 0xFFFFFFF9) {
    return 0;
  }
  int v8 = (uint64_t **)(a1 + 24);
  uint64_t v7 = *(char **)(a1 + 24);
  int v9 = (uint64_t **)(a1 + 24);
  uint64_t v10 = (char *)(a1 + 24);
  if (v7)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v7;
        int v11 = *((_DWORD *)v7 + 8);
        if (v11 <= a3) {
          break;
        }
        uint64_t v7 = *(char **)v10;
        int v9 = (uint64_t **)v10;
        if (!*(void *)v10) {
          goto LABEL_10;
        }
      }
      if (v11 >= a3) {
        break;
      }
      uint64_t v7 = (char *)*((void *)v10 + 1);
      if (!v7)
      {
        int v9 = (uint64_t **)(v10 + 8);
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    uint64_t v12 = v10;
    uint64_t v10 = (char *)operator new(0x50uLL);
    *((_DWORD *)v10 + 8) = a3;
    *(_OWORD *)(v10 + 40) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    *((void *)v10 + 9) = 0;
    *(void *)uint64_t v10 = 0;
    *((void *)v10 + 1) = 0;
    *((void *)v10 + 2) = v12;
    char *v9 = (uint64_t *)v10;
    uint64_t v13 = **(void **)(a1 + 16);
    uint64_t v14 = (uint64_t *)v10;
    if (v13)
    {
      *(void *)(a1 + 16) = v13;
      uint64_t v14 = *v9;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 24), v14);
    ++*(void *)(a1 + 32);
  }
  if (*((void *)v10 + 5) != *a2) {
    return 1;
  }
  uint64_t v15 = *v8;
  uint64_t v16 = v8;
  uint64_t v17 = (char *)v8;
  if (*v8)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v17 = (char *)v15;
        int v18 = *((_DWORD *)v15 + 8);
        if (v18 <= a3) {
          break;
        }
        uint64_t v15 = *(uint64_t **)v17;
        uint64_t v16 = (uint64_t **)v17;
        if (!*(void *)v17) {
          goto LABEL_21;
        }
      }
      if (v18 >= a3) {
        break;
      }
      uint64_t v15 = (uint64_t *)*((void *)v17 + 1);
      if (!v15)
      {
        uint64_t v16 = (uint64_t **)(v17 + 8);
        goto LABEL_21;
      }
    }
  }
  else
  {
LABEL_21:
    uint64_t v19 = v17;
    uint64_t v17 = (char *)operator new(0x50uLL);
    *((_DWORD *)v17 + 8) = a3;
    *(_OWORD *)(v17 + 40) = 0u;
    *(_OWORD *)(v17 + 56) = 0u;
    *((void *)v17 + 9) = 0;
    *(void *)uint64_t v17 = 0;
    *((void *)v17 + 1) = 0;
    *((void *)v17 + 2) = v19;
    void *v16 = (uint64_t *)v17;
    uint64_t v20 = **(void **)(a1 + 16);
    uint64_t v21 = (uint64_t *)v17;
    if (v20)
    {
      *(void *)(a1 + 16) = v20;
      uint64_t v21 = *v16;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 24), v21);
    ++*(void *)(a1 + 32);
  }
  if (*((void *)v17 + 6) != a2[1]) {
    return 1;
  }
  uint64_t v22 = *v8;
  uint64_t v23 = (char *)v8;
  if (*v8)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v23 = (char *)v22;
        int v24 = *((_DWORD *)v22 + 8);
        if (v24 <= a3) {
          break;
        }
        uint64_t v22 = *(uint64_t **)v23;
        int v8 = (uint64_t **)v23;
        if (!*(void *)v23) {
          goto LABEL_32;
        }
      }
      if (v24 >= a3) {
        break;
      }
      uint64_t v22 = (uint64_t *)*((void *)v23 + 1);
      if (!v22)
      {
        int v8 = (uint64_t **)(v23 + 8);
        goto LABEL_32;
      }
    }
  }
  else
  {
LABEL_32:
    CFTypeRef v25 = v23;
    uint64_t v23 = (char *)operator new(0x50uLL);
    *((_DWORD *)v23 + 8) = a3;
    *(_OWORD *)(v23 + 40) = 0u;
    *(_OWORD *)(v23 + 56) = 0u;
    *((void *)v23 + 9) = 0;
    *(void *)uint64_t v23 = 0;
    *((void *)v23 + 1) = 0;
    *((void *)v23 + 2) = v25;
    *int v8 = (uint64_t *)v23;
    uint64_t v26 = **(void **)(a1 + 16);
    uint64_t v27 = (uint64_t *)v23;
    if (v26)
    {
      *(void *)(a1 + 16) = v26;
      uint64_t v27 = *v8;
    }
    sub_19E13C8A0(*(uint64_t **)(a1 + 24), v27);
    ++*(void *)(a1 + 32);
  }
  return *((void *)v23 + 7) != a2[2];
}

uint64_t sub_19E321D8C(uint64_t a1, uint64_t a2, long long *a3, long long *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  *(void *)a1 = &unk_1EF0A9488;
  *(void *)(a1 + 8) = a2;
  long long v11 = *a3;
  long long v12 = a3[1];
  *(void *)(a1 + 48) = *((void *)a3 + 4);
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = v12;
  long long v13 = *a4;
  long long v14 = a4[1];
  uint64_t v15 = *((void *)a4 + 4);
  *(void *)(a1 + 128) = 0;
  *(_OWORD *)(a1 + 72) = v14;
  *(_OWORD *)(a1 + 56) = v13;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = a5;
  *(void *)(a1 + 104) = a6;
  *(void *)(a1 + 112) = a7;
  *(void *)(a1 + 120) = a8;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  uint64_t v17 = *(const void **)a9;
  uint64_t v16 = *(void *)(a9 + 8);
  int64_t v18 = v16 - *(void *)a9;
  if (v16 != *(void *)a9)
  {
    if (v18 < 0) {
      sub_19E13D694();
    }
    uint64_t v19 = (char *)operator new(v16 - (void)v17);
    *(void *)(a1 + 128) = v19;
    *(void *)(a1 + 136) = v19;
    uint64_t v20 = &v19[4 * (v18 >> 2)];
    *(void *)(a1 + 144) = v20;
    memcpy(v19, v17, v18);
    *(void *)(a1 + 136) = v20;
  }
  *(unsigned char *)(a1 + 152) = a10;
  return a1;
}

void sub_19E321E5C(_Unwind_Exception *exception_object)
{
  CFIndex v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 136) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E321E78(uint64_t a1)
{
  if (*(void *)(a1 + 48) * *(void *)(a1 + 40))
  {
    unint64_t v2 = 0;
    uint64_t v3 = **(char ***)(a1 + 112);
    CFIndex v4 = **(char ***)(a1 + 104);
    CFIndex v5 = **(char ***)(a1 + 96);
    uint64_t v21 = 4 * *(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 24) * *(_DWORD *)(a1 + 72);
    do
    {
      uint64_t v7 = *(void *)(a1 + 120);
      if ((unint64_t)(v7 - 1) > 8) {
        BNNSActivationFunction v8 = BNNSActivationFunctionIdentity;
      }
      else {
        BNNSActivationFunction v8 = dword_19E354E38[v7 - 1];
      }
      bzero(&filter_params, 0x20uLL);
      filter_params.flags = 1;
      size_t v10 = *(void *)(a1 + 64);
      size_t v9 = *(void *)(a1 + 72);
      if (*(unsigned char *)(a1 + 152)) {
        size_t v11 = *(void *)(a1 + 64);
      }
      else {
        size_t v11 = *(void *)(a1 + 72);
      }
      if (*(unsigned char *)(a1 + 152))
      {
        size_t v10 = *(void *)(a1 + 72);
        BNNSDataLayout v12 = BNNSDataLayoutColumnMajorMatrix;
      }
      else
      {
        BNNSDataLayout v12 = BNNSDataLayoutRowMajorMatrix;
      }
      uint64_t v13 = *(void *)(a1 + 128);
      unint64_t v14 = *(void *)(a1 + 136) - v13;
      uint64_t v15 = 0;
      float v16 = 1.0;
      if (v14 < 5)
      {
        float v17 = 1.0;
      }
      else
      {
        float v17 = *(float *)v13;
        float v16 = *(float *)(v13 + 4);
        if (v14 >= 0xD) {
          uint64_t v15 = *(void *)(v13 + 8);
        }
      }
      size_t v18 = *(void *)(a1 + 32);
      layer_params.i_desc.flags = BNNSNDArrayFlagBackpropSet;
      layer_params.i_desc.size[0] = v18;
      layer_params.i_desc.layout = BNNSDataLayoutVector;
      memset(&layer_params.i_desc.size[1], 0, 56);
      layer_params.i_desc.stride[0] = 1;
      memset(&layer_params.i_desc.stride[1], 0, 64);
      layer_params.i_desc.data_type = BNNSDataTypeFloat32;
      *(_OWORD *)(&layer_params.i_desc.data_type + 1) = 0uLL;
      layer_params.i_desc.data_scale = v17;
      *(void *)&layer_params.i_desc.data_bias = 0;
      layer_params.w_desc.flags = BNNSNDArrayFlagBackpropSet;
      layer_params.w_desc.layout = v12;
      layer_params.w_desc.size[0] = v10;
      layer_params.w_desc.size[1] = v11;
      memset(&layer_params.w_desc.size[2], 0, 48);
      memset(&layer_params.w_desc.stride[1], 0, 56);
      layer_params.w_desc.stride[0] = 1;
      layer_params.w_desc.data = v4;
      layer_params.w_desc.data_type = BNNSDataTypeFloat32;
      *(_OWORD *)(&layer_params.w_desc.data_type + 1) = 0uLL;
      layer_params.w_desc.data_scale = v16;
      *(void *)&layer_params.w_desc.data_bias = 0;
      *(void *)&layer_params.o_desc.flags = 0x1000000000000;
      memset(&layer_params.o_desc.size[1], 0, 56);
      layer_params.o_desc.size[0] = v9;
      layer_params.o_desc.stride[0] = 1;
      memset(&layer_params.o_desc.stride[1], 0, 64);
      layer_params.o_desc.data_type = BNNSDataTypeFloat32;
      *(_OWORD *)(&layer_params.o_desc.data_type + 1) = 0uLL;
      layer_params.o_desc.data_scale = 1.0;
      *(void *)&layer_params.o_desc.data_bias = 0;
      *(void *)&layer_params.bias.flags = 0x1000000000000;
      memset(layer_params.bias.size, 0, 136);
      layer_params.bias.data_type = BNNSDataTypeFloat32;
      *(_OWORD *)(&layer_params.bias.data_type + 1) = 0uLL;
      layer_params.bias.data_scale = 1.0;
      *(void *)&layer_params.bias.data_bias = 0;
      layer_params.activation.function = v8;
      *(void *)&layer_params.activation.alpha = v15;
      memset(&layer_params.activation.iscale, 0, 36);
      uint64_t v19 = BNNSFilterCreateLayerFullyConnected(&layer_params, &filter_params);
      uint64_t v20 = v19;
      if (v19) {
        BNNSFilterApplyBatch(v19, *(void *)(a1 + 24), v5, *(void *)(a1 + 32), v3, *(void *)(a1 + 72));
      }
      BNNSFilterDestroy(v20);
      if (*(void *)(a1 + 88) == 1) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = *(_DWORD *)(a1 + 56) * *(_DWORD *)(a1 + 64) * *(_DWORD *)(a1 + 72);
      }
      v5 += 4 * *(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 24) * *(_DWORD *)(a1 + 32);
      v4 += 4 * v6;
      ++v2;
      v3 += v21;
    }
    while (*(void *)(a1 + 48) * *(void *)(a1 + 40) > v2);
  }
}

void *sub_19E32218C(void *a1)
{
  *a1 = &unk_1EF0A9488;
  unint64_t v2 = (void *)a1[16];
  if (v2)
  {
    a1[17] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_19E3221DC(void *__p)
{
  void *__p = &unk_1EF0A9488;
  unint64_t v2 = (void *)__p[16];
  if (v2)
  {
    __p[17] = v2;
    operator delete(v2);
  }

  operator delete(__p);
}

void sub_19E32223C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v8 = a4;
  *a7 = 0;
  a7[1] = 0;
  a7[2] = 0;
  std::string __p = 0;
  long long v161 = 0;
  uint64_t v162 = 0;
  uint64_t v12 = (2 * a6);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void **, void, uint64_t, double))(*(void *)a1 + 48))(a1, a5, a6, a4, a4, &__p, 0, v12, 0.0);
  uint64_t v155 = a2;
  uint64_t v156 = v8;
  unsigned int v157 = v12;
  if (__p)
  {
    long long v161 = __p;
    operator delete(__p);
    uint64_t v15 = a7 + 1;
    unint64_t v14 = (char *)a7[1];
    unint64_t v16 = a7[2];
    float32x4_t v159 = a7 + 2;
    if ((unint64_t)v14 < v16)
    {
      *(void *)unint64_t v14 = v13;
      uint64_t v17 = (uint64_t)(v14 + 8);
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t v14 = 0;
    unint64_t v16 = 0;
    uint64_t v15 = a7 + 1;
    float32x4_t v159 = a7 + 2;
  }
  size_t v18 = (char *)*a7;
  uint64_t v19 = (uint64_t)&v14[-*a7];
  uint64_t v20 = v19 >> 3;
  unint64_t v21 = (v19 >> 3) + 1;
  if (v21 >> 61) {
    goto LABEL_144;
  }
  uint64_t v22 = v16 - (void)v18;
  if (v22 >> 2 > v21) {
    unint64_t v21 = v22 >> 2;
  }
  if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v23 = v21;
  }
  if (v23)
  {
    if (v23 >> 61) {
      goto LABEL_145;
    }
    int v24 = operator new(8 * v23);
    CFTypeRef v25 = (uint64_t *)&v24[8 * v20];
    uint64_t v26 = &v24[8 * v23];
    uint64_t *v25 = v13;
    uint64_t v17 = (uint64_t)(v25 + 1);
    uint64_t v27 = (char *)(v14 - v18);
    if (v14 != v18)
    {
LABEL_14:
      unint64_t v28 = (unint64_t)(v27 - 8);
      if (v28 >= 0x58 && (unint64_t)(v14 - v24 - v19) >= 0x20)
      {
        uint64_t v149 = (v28 >> 3) + 1;
        uint64_t v150 = 8 * (v149 & 0x3FFFFFFFFFFFFFFCLL);
        char v29 = &v14[-v150];
        CFTypeRef v25 = (uint64_t *)((char *)v25 - v150);
        uint64_t v151 = &v24[8 * v20 - 16];
        float32x4_t v152 = v14 - 16;
        uint64_t v153 = v149 & 0x3FFFFFFFFFFFFFFCLL;
        uint64_t v8 = v156;
        do
        {
          long long v154 = *(_OWORD *)v152;
          *(v151 - 1) = *((_OWORD *)v152 - 1);
          *uint64_t v151 = v154;
          v151 -= 2;
          v152 -= 32;
          v153 -= 4;
        }
        while (v153);
        uint64_t v12 = v157;
        if (v149 == (v149 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_18:
          unint64_t v14 = (char *)*a7;
          *a7 = v25;
          a7[1] = v17;
          a7[2] = v26;
          if (!v14) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
      }
      else
      {
        char v29 = v14;
        uint64_t v8 = v156;
        uint64_t v12 = v157;
      }
      do
      {
        uint64_t v30 = *((void *)v29 - 1);
        v29 -= 8;
        *--CFTypeRef v25 = v30;
      }
      while (v29 != v18);
      goto LABEL_18;
    }
  }
  else
  {
    int v24 = 0;
    CFTypeRef v25 = (uint64_t *)(8 * v20);
    uint64_t v26 = 0;
    *(void *)(8 * v20) = v13;
    uint64_t v17 = 8 * v20 + 8;
    uint64_t v27 = (char *)(v14 - v18);
    if (v14 != v18) {
      goto LABEL_14;
    }
  }
  uint64_t v8 = v156;
  uint64_t v12 = v157;
  *a7 = v25;
  a7[1] = v17;
  a7[2] = v26;
  if (v14) {
LABEL_19:
  }
    operator delete(v14);
LABEL_20:
  *uint64_t v15 = v17;
  std::string __p = 0;
  long long v161 = 0;
  uint64_t v162 = 0;
  uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void **, uint64_t, uint64_t, double))(*(void *)a1 + 48))(a1, 1, a6, v8, v8, &__p, a6, v12, 0.0);
  if (__p)
  {
    long long v161 = __p;
    operator delete(__p);
  }
  CFTypeRef v32 = (char *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *(void *)CFTypeRef v32 = v31;
    uint64_t v33 = (uint64_t)(v32 + 8);
    goto LABEL_48;
  }
  uint64_t v34 = (char *)*a7;
  uint64_t v35 = (uint64_t)&v32[-*a7];
  uint64_t v36 = v35 >> 3;
  unint64_t v37 = (v35 >> 3) + 1;
  if (v37 >> 61) {
    goto LABEL_144;
  }
  uint64_t v38 = *v159 - (void)v34;
  if (v38 >> 2 > v37) {
    unint64_t v37 = v38 >> 2;
  }
  if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v39 = v37;
  }
  if (v39)
  {
    if (v39 >> 61) {
      goto LABEL_145;
    }
    uint64_t v40 = operator new(8 * v39);
    uint64_t v41 = (uint64_t *)&v40[8 * v36];
    uint64_t v42 = &v40[8 * v39];
    uint64_t *v41 = v31;
    uint64_t v33 = (uint64_t)(v41 + 1);
    uint64_t v43 = (char *)(v32 - v34);
    if (v32 != v34)
    {
LABEL_33:
      unint64_t v44 = (unint64_t)(v43 - 8);
      if (v44 >= 0x58)
      {
        unint64_t v45 = v32 - v40 - v35;
        uint64_t v8 = v156;
        if (v45 >= 0x20)
        {
          uint64_t v46 = (v44 >> 3) + 1;
          uint64_t v47 = 8 * (v46 & 0x3FFFFFFFFFFFFFFCLL);
          uint64_t v48 = &v32[-v47];
          uint64_t v41 = (uint64_t *)((char *)v41 - v47);
          uint64_t v49 = &v40[8 * v36 - 16];
          uint64_t v50 = v32 - 16;
          uint64_t v51 = v46 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v52 = *(_OWORD *)v50;
            *(v49 - 1) = *((_OWORD *)v50 - 1);
            *uint64_t v49 = v52;
            v49 -= 2;
            v50 -= 32;
            v51 -= 4;
          }
          while (v51);
          CFTypeRef v32 = v48;
          if (v46 == (v46 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_46:
            CFTypeRef v32 = (char *)*a7;
            *a7 = v41;
            a7[1] = v33;
            a7[2] = v42;
            LODWORD(v12) = v157;
            if (!v32) {
              goto LABEL_48;
            }
            goto LABEL_47;
          }
        }
      }
      else
      {
        uint64_t v8 = v156;
      }
      do
      {
        uint64_t v53 = *((void *)v32 - 1);
        v32 -= 8;
        *--uint64_t v41 = v53;
      }
      while (v32 != v34);
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v40 = 0;
    uint64_t v41 = (uint64_t *)(8 * v36);
    uint64_t v42 = 0;
    *(void *)(8 * v36) = v31;
    uint64_t v33 = 8 * v36 + 8;
    uint64_t v43 = (char *)(v32 - v34);
    if (v32 != v34) {
      goto LABEL_33;
    }
  }
  uint64_t v8 = v156;
  *a7 = v41;
  a7[1] = v33;
  a7[2] = v42;
  LODWORD(v12) = v157;
  if (v32) {
LABEL_47:
  }
    operator delete(v32);
LABEL_48:
  *uint64_t v15 = v33;
  sub_19E251738(&__p, 2, a6, 0, a6, 0, a6, v12, a6);
  uint64_t v54 = (*(uint64_t (**)(uint64_t, void **, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 16))(a1, &__p, v155, v8, a3);
  uint64_t v55 = v54;
  uint64_t v56 = (char *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *(void *)uint64_t v56 = v54;
    uint64_t v57 = (uint64_t)(v56 + 8);
    goto LABEL_71;
  }
  uint64_t v58 = (char *)*a7;
  uint64_t v59 = (uint64_t)&v56[-*a7];
  uint64_t v60 = v59 >> 3;
  unint64_t v61 = (v59 >> 3) + 1;
  if (v61 >> 61) {
    goto LABEL_144;
  }
  uint64_t v62 = *v159 - (void)v58;
  if (v62 >> 2 > v61) {
    unint64_t v61 = v62 >> 2;
  }
  if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v63 = v61;
  }
  if (v63)
  {
    if (v63 >> 61) {
      goto LABEL_145;
    }
    BOOL v64 = operator new(8 * v63);
    uint64_t v65 = (uint64_t *)&v64[8 * v60];
    BOOL v66 = &v64[8 * v63];
    *uint64_t v65 = v55;
    uint64_t v57 = (uint64_t)(v65 + 1);
    float v67 = (char *)(v56 - v58);
    if (v56 != v58)
    {
LABEL_59:
      unint64_t v68 = (unint64_t)(v67 - 8);
      if (v68 >= 0x58)
      {
        unint64_t v69 = v56 - v64 - v59;
        uint64_t v8 = v156;
        if (v69 >= 0x20)
        {
          uint64_t v70 = (v68 >> 3) + 1;
          uint64_t v71 = 8 * (v70 & 0x3FFFFFFFFFFFFFFCLL);
          uint64_t v72 = &v56[-v71];
          uint64_t v65 = (uint64_t *)((char *)v65 - v71);
          uint64_t v73 = &v64[8 * v60 - 16];
          uint64_t v74 = v56 - 16;
          uint64_t v75 = v70 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v76 = *(_OWORD *)v74;
            *(v73 - 1) = *((_OWORD *)v74 - 1);
            _OWORD *v73 = v76;
            v73 -= 2;
            v74 -= 32;
            v75 -= 4;
          }
          while (v75);
          uint64_t v56 = v72;
          if (v70 == (v70 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_69:
            uint64_t v56 = (char *)*a7;
            *a7 = v65;
            a7[1] = v57;
            a7[2] = v66;
            LODWORD(v12) = v157;
            if (!v56) {
              goto LABEL_71;
            }
            goto LABEL_70;
          }
        }
      }
      else
      {
        uint64_t v8 = v156;
      }
      do
      {
        uint64_t v77 = *((void *)v56 - 1);
        v56 -= 8;
        *--uint64_t v65 = v77;
      }
      while (v56 != v58);
      goto LABEL_69;
    }
  }
  else
  {
    BOOL v64 = 0;
    uint64_t v65 = (uint64_t *)(8 * v60);
    BOOL v66 = 0;
    *(void *)(8 * v60) = v55;
    uint64_t v57 = 8 * v60 + 8;
    float v67 = (char *)(v56 - v58);
    if (v56 != v58) {
      goto LABEL_59;
    }
  }
  uint64_t v8 = v156;
  *a7 = v65;
  a7[1] = v57;
  a7[2] = v66;
  LODWORD(v12) = v157;
  if (v56) {
LABEL_70:
  }
    operator delete(v56);
LABEL_71:
  *uint64_t v15 = v57;
  sub_19E251738(&__p, 0, a6, 0, 0, 0, a6, v12, a6);
  uint64_t v78 = (*(uint64_t (**)(uint64_t, void **, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 16))(a1, &__p, a3, v8, a3);
  uint64_t v79 = v78;
  uint64_t v80 = (char *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *(void *)uint64_t v80 = v78;
    uint64_t v81 = (uint64_t)(v80 + 8);
    goto LABEL_94;
  }
  uint64_t v82 = (char *)*a7;
  uint64_t v83 = (uint64_t)&v80[-*a7];
  uint64_t v84 = v83 >> 3;
  unint64_t v85 = (v83 >> 3) + 1;
  if (v85 >> 61) {
    goto LABEL_144;
  }
  uint64_t v86 = *v159 - (void)v82;
  if (v86 >> 2 > v85) {
    unint64_t v85 = v86 >> 2;
  }
  if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v87 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v87 = v85;
  }
  if (v87)
  {
    if (v87 >> 61) {
      goto LABEL_145;
    }
    uint64_t v88 = operator new(8 * v87);
    int v89 = (uint64_t *)&v88[8 * v84];
    CFIndex v90 = &v88[8 * v87];
    uint64_t *v89 = v79;
    uint64_t v81 = (uint64_t)(v89 + 1);
    double v91 = (char *)(v80 - v82);
    if (v80 != v82)
    {
LABEL_82:
      unint64_t v92 = (unint64_t)(v91 - 8);
      if (v92 >= 0x58)
      {
        unint64_t v93 = v80 - v88 - v83;
        uint64_t v8 = v156;
        if (v93 >= 0x20)
        {
          uint64_t v94 = (v92 >> 3) + 1;
          uint64_t v95 = 8 * (v94 & 0x3FFFFFFFFFFFFFFCLL);
          unint64_t v96 = &v80[-v95];
          int v89 = (uint64_t *)((char *)v89 - v95);
          long long v97 = &v88[8 * v84 - 16];
          uint64_t v98 = v80 - 16;
          uint64_t v99 = v94 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v100 = *(_OWORD *)v98;
            *(v97 - 1) = *((_OWORD *)v98 - 1);
            *long long v97 = v100;
            v97 -= 2;
            v98 -= 32;
            v99 -= 4;
          }
          while (v99);
          uint64_t v80 = v96;
          if (v94 == (v94 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_92:
            uint64_t v80 = (char *)*a7;
            *a7 = v89;
            a7[1] = v81;
            a7[2] = v90;
            LODWORD(v12) = v157;
            if (!v80) {
              goto LABEL_94;
            }
            goto LABEL_93;
          }
        }
      }
      else
      {
        uint64_t v8 = v156;
      }
      do
      {
        uint64_t v101 = *((void *)v80 - 1);
        v80 -= 8;
        *--int v89 = v101;
      }
      while (v80 != v82);
      goto LABEL_92;
    }
  }
  else
  {
    uint64_t v88 = 0;
    int v89 = (uint64_t *)(8 * v84);
    CFIndex v90 = 0;
    *(void *)(8 * v84) = v79;
    uint64_t v81 = 8 * v84 + 8;
    double v91 = (char *)(v80 - v82);
    if (v80 != v82) {
      goto LABEL_82;
    }
  }
  uint64_t v8 = v156;
  *a7 = v89;
  a7[1] = v81;
  a7[2] = v90;
  LODWORD(v12) = v157;
  if (v80) {
LABEL_93:
  }
    operator delete(v80);
LABEL_94:
  *uint64_t v15 = v81;
  sub_19E251738(&__p, 2, a6, 0, a6, 0, v12, v12, v12);
  uint64_t v102 = (*(uint64_t (**)(uint64_t, void **, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 16))(a1, &__p, v8, v8, v8);
  uint64_t v103 = v102;
  CFDataRef v104 = (char *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *(void *)CFDataRef v104 = v102;
    uint64_t v105 = (uint64_t)(v104 + 8);
    goto LABEL_117;
  }
  float v106 = (char *)*a7;
  uint64_t v107 = (uint64_t)&v104[-*a7];
  uint64_t v108 = v107 >> 3;
  unint64_t v109 = (v107 >> 3) + 1;
  if (v109 >> 61) {
    goto LABEL_144;
  }
  uint64_t v110 = *v159 - (void)v106;
  if (v110 >> 2 > v109) {
    unint64_t v109 = v110 >> 2;
  }
  if ((unint64_t)v110 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v111 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v111 = v109;
  }
  if (v111)
  {
    if (v111 >> 61) {
      goto LABEL_145;
    }
    uint64_t v112 = operator new(8 * v111);
    uint64_t v113 = (uint64_t *)&v112[8 * v108];
    uint64_t v114 = &v112[8 * v111];
    uint64_t *v113 = v103;
    uint64_t v105 = (uint64_t)(v113 + 1);
    uint64_t v115 = (char *)(v104 - v106);
    if (v104 != v106)
    {
LABEL_105:
      unint64_t v116 = (unint64_t)(v115 - 8);
      if (v116 >= 0x58)
      {
        unint64_t v117 = v104 - v112 - v107;
        uint64_t v8 = v156;
        if (v117 >= 0x20)
        {
          uint64_t v118 = (v116 >> 3) + 1;
          uint64_t v119 = 8 * (v118 & 0x3FFFFFFFFFFFFFFCLL);
          uint64_t v120 = &v104[-v119];
          uint64_t v113 = (uint64_t *)((char *)v113 - v119);
          BOOL v121 = &v112[8 * v108 - 16];
          BOOL v122 = v104 - 16;
          uint64_t v123 = v118 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v124 = *(_OWORD *)v122;
            *(v121 - 1) = *((_OWORD *)v122 - 1);
            _OWORD *v121 = v124;
            v121 -= 2;
            v122 -= 32;
            v123 -= 4;
          }
          while (v123);
          CFDataRef v104 = v120;
          if (v118 == (v118 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_115:
            CFDataRef v104 = (char *)*a7;
            *a7 = v113;
            a7[1] = v105;
            a7[2] = v114;
            LODWORD(v12) = v157;
            if (!v104) {
              goto LABEL_117;
            }
            goto LABEL_116;
          }
        }
      }
      else
      {
        uint64_t v8 = v156;
      }
      do
      {
        uint64_t v125 = *((void *)v104 - 1);
        v104 -= 8;
        *--uint64_t v113 = v125;
      }
      while (v104 != v106);
      goto LABEL_115;
    }
  }
  else
  {
    uint64_t v112 = 0;
    uint64_t v113 = (uint64_t *)(8 * v108);
    uint64_t v114 = 0;
    *(void *)(8 * v108) = v103;
    uint64_t v105 = 8 * v108 + 8;
    uint64_t v115 = (char *)(v104 - v106);
    if (v104 != v106) {
      goto LABEL_105;
    }
  }
  uint64_t v8 = v156;
  *a7 = v113;
  a7[1] = v105;
  a7[2] = v114;
  LODWORD(v12) = v157;
  if (v104) {
LABEL_116:
  }
    operator delete(v104);
LABEL_117:
  *uint64_t v15 = v105;
  sub_19E251738(&__p, 1, a6, 0, 0, 0, a6, v12, a6);
  uint64_t v126 = (*(uint64_t (**)(uint64_t, void **, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 16))(a1, &__p, a3, v8, a3);
  uint64_t v127 = v126;
  int v128 = (uint64_t *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *int v128 = v126;
    uint64_t v129 = (uint64_t)(v128 + 1);
    goto LABEL_130;
  }
  uint64_t v130 = (char *)*a7;
  uint64_t v131 = (uint64_t)v128 - *a7;
  uint64_t v132 = v131 >> 3;
  unint64_t v133 = (v131 >> 3) + 1;
  if (v133 >> 61) {
LABEL_144:
  }
    sub_19E13D694();
  uint64_t v134 = *v159 - (void)v130;
  if (v134 >> 2 > v133) {
    unint64_t v133 = v134 >> 2;
  }
  if ((unint64_t)v134 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v135 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v135 = v133;
  }
  if (v135)
  {
    if (!(v135 >> 61))
    {
      long long v136 = operator new(8 * v135);
      long long v137 = (uint64_t *)&v136[8 * v132];
      long long v138 = &v136[8 * v135];
      *long long v137 = v127;
      uint64_t v129 = (uint64_t)(v137 + 1);
      long long v139 = (char *)((char *)v128 - v130);
      if (v128 == (uint64_t *)v130) {
        goto LABEL_128;
      }
      goto LABEL_132;
    }
LABEL_145:
    sub_19E13C418();
  }
  long long v136 = 0;
  long long v137 = (uint64_t *)(8 * v132);
  long long v138 = 0;
  *(void *)(8 * v132) = v127;
  uint64_t v129 = 8 * v132 + 8;
  long long v139 = (char *)((char *)v128 - v130);
  if (v128 == (uint64_t *)v130)
  {
LABEL_128:
    *a7 = v137;
    a7[1] = v129;
    a7[2] = v138;
    if (!v128) {
      goto LABEL_130;
    }
LABEL_129:
    operator delete(v128);
    goto LABEL_130;
  }
LABEL_132:
  unint64_t v140 = (unint64_t)(v139 - 8);
  if (v140 < 0x58) {
    goto LABEL_148;
  }
  if ((unint64_t)((char *)v128 - v136 - v131) < 0x20) {
    goto LABEL_148;
  }
  uint64_t v141 = (v140 >> 3) + 1;
  uint64_t v142 = 8 * (v141 & 0x3FFFFFFFFFFFFFFCLL);
  CFTypeRef v143 = &v128[v142 / 0xFFFFFFFFFFFFFFF8];
  long long v137 = (uint64_t *)((char *)v137 - v142);
  int v144 = &v136[8 * v132 - 16];
  uint64_t v145 = v128 - 2;
  uint64_t v146 = v141 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v147 = *(_OWORD *)v145;
    *(v144 - 1) = *((_OWORD *)v145 - 1);
    *int v144 = v147;
    v144 -= 2;
    v145 -= 4;
    v146 -= 4;
  }
  while (v146);
  int v128 = v143;
  if (v141 != (v141 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_148:
    do
    {
      uint64_t v148 = *--v128;
      *--long long v137 = v148;
    }
    while (v128 != (uint64_t *)v130);
  }
  int v128 = (uint64_t *)*a7;
  *a7 = v137;
  a7[1] = v129;
  a7[2] = v138;
  if (v128) {
    goto LABEL_129;
  }
LABEL_130:
  *uint64_t v15 = v129;
}

void sub_19E322D40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
  {
    operator delete(__p);
    uint64_t v19 = *(void **)v17;
    if (!*(void *)v17) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    uint64_t v19 = *(void **)v17;
    if (!*(void *)v17) {
      goto LABEL_3;
    }
  }
  *(void *)(v17 + 8) = v19;
  operator delete(v19);
  _Unwind_Resume(exception_object);
}

void sub_19E322DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104))(a2);
  uint64_t v5 = *(void *)a2;
  if (!v4)
  {
    unsigned int v13 = ((*(unsigned int (**)(uint64_t))(v5 + 120))(a2) >> 2) & 1;
    uint64_t v14 = *(void *)(a1 + 8);
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 72))(a2, 1);
    uint64_t v16 = sub_19E301C8C(a2);
    uint64_t v17 = sub_19E25D8B0(a2, 1);
    if (*(unsigned char *)(a2 + 1057)) {
      uint64_t v18 = a2 + 1040;
    }
    else {
      uint64_t v18 = a2 + 1024;
    }
    uint64_t v19 = sub_19E25DA90(a2, 9);
    if (*(unsigned char *)(a2 + 1057)) {
      uint64_t v20 = a2 + 1048;
    }
    else {
      uint64_t v20 = a2 + 1032;
    }
    uint64_t v21 = *(void *)(a2 + 1016);
    std::string __p = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    char v35 = v13;
    uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t, uint64_t **, uint64_t, uint64_t, void **, char))(*(void *)v14 + 56))(v14, v15, v16, v17, v18, v19, v20, v21, &__p, v35);
    goto LABEL_11;
  }
  if ((*(uint64_t (**)(uint64_t))(v5 + 104))(a2) == 2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v7 = *(void *)(a2 + 1016);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 80))(a2, 9);
    size_t v9 = sub_19E25D8B0(a2, 1);
    size_t v10 = sub_19E25DA90(a2, 9);
    std::string __p = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 80))(a2, 9);
    uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t **, void **, void, uint64_t, float))(*(void *)v6 + 48))(v6, v7, v8, v9, v10, &__p, 0, v11, *(float *)(a2 + 1088));
LABEL_11:
    uint64_t v22 = v12;
    if (__p)
    {
      uint64_t v38 = (uint64_t *)__p;
      operator delete(__p);
    }
    sub_19E25E104((void *)a2, v22);
    return;
  }
  if ((*(uint64_t (**)(uint64_t))(*(void *)a2 + 104))(a2) == 13)
  {
    uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 72))(a2, 1);
    int v24 = sub_19E25E288((void *)a2, 8 * (int)v23);
    uint64_t v25 = *(void *)(a1 + 8);
    uint64_t v26 = sub_19E25D8B0(a2, 1);
    if (*(unsigned char *)(a2 + 1057)) {
      uint64_t v27 = a2 + 1040;
    }
    else {
      uint64_t v27 = a2 + 1024;
    }
    if (*(unsigned char *)(a2 + 1057)) {
      uint64_t v28 = a2 + 1048;
    }
    else {
      uint64_t v28 = a2 + 1032;
    }
    std::string __p = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    char v36 = 0;
    uint64_t v29 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t **, uint64_t, char *, uint64_t, void, void **, char))(*(void *)v25 + 56))(v25, v23, (2 * v23), v26, v27, v24, v28, 0, &__p, v36);
    if (__p)
    {
      uint64_t v38 = (uint64_t *)__p;
      operator delete(__p);
    }
    sub_19E25E104((void *)a2, v29);
    uint64_t v30 = *(void *)(a1 + 8);
    uint64_t v31 = sub_19E25D8B0(a2, 1);
    CFTypeRef v32 = sub_19E25DA90(a2, 9);
    sub_19E32223C(v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v24, *(void *)(a2 + 1016), v23, &__p);
    uint64_t v33 = (uint64_t *)__p;
    uint64_t v34 = v38;
    if (__p != v38)
    {
      do
        sub_19E25E104((void *)a2, *v33++);
      while (v33 != v34);
      uint64_t v33 = (uint64_t *)__p;
    }
    if (v33)
    {
      uint64_t v38 = v33;
      operator delete(v33);
    }
  }
}

void sub_19E3231D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E3231F8(uint64_t a1, int *a2)
{
  char v29 = (*(uint64_t (**)(int *))(*(void *)a2 + 120))(a2);
  char v36 = 0;
  unint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v3 = (unsigned char *)*((void *)a2 + 138);
  uint64_t v4 = (unsigned char *)*((void *)a2 + 139);
  int64_t v5 = v4 - v3;
  if (v4 == v3)
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v8 = (unsigned char *)*((void *)a2 + 135);
    unsigned int v13 = (unsigned char *)*((void *)a2 + 136);
    size_t v10 = v13 - v8;
    if (v13 != v8) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v11 = 0;
    uint64_t v12 = v6;
    if (v6 == v7) {
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  if (v5 < 0) {
    sub_19E13D694();
  }
  uint64_t v6 = (unsigned int *)operator new(v4 - v3);
  uint64_t v7 = &v6[v5 >> 2];
  char v36 = v6;
  uint64_t v38 = v7;
  memcpy(v6, v3, v5);
  unint64_t v37 = v7;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v8 = (unsigned char *)*((void *)a2 + 135);
  size_t v9 = (unsigned char *)*((void *)a2 + 136);
  size_t v10 = v9 - v8;
  if (v9 == v8) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v10 & 0x8000000000000000) != 0) {
    sub_19E13D694();
  }
  uint64_t v11 = operator new(v10);
  uint64_t v33 = v11;
  memcpy(v11, v8, v10);
  uint64_t v12 = v6;
  if (v6 != v7)
  {
LABEL_9:
    uint64_t v14 = v6 + 1;
    uint64_t v12 = v6;
    if (v6 + 1 != v7)
    {
      signed int v15 = *v6;
      uint64_t v12 = v6;
      uint64_t v16 = v6 + 1;
      do
      {
        signed int v18 = *v16++;
        signed int v17 = v18;
        BOOL v19 = v15 < v18;
        if (v15 <= v18) {
          signed int v15 = v17;
        }
        if (v19) {
          uint64_t v12 = v14;
        }
        uint64_t v14 = v16;
      }
      while (v16 != v7);
    }
  }
LABEL_16:
  unsigned int v20 = *v12;
  sub_19E25E288(a2, 4 * *v11);
  uint64_t v28 = sub_19E25E288(a2, 4 * *v6);
  sub_19E25E288(a2, 4 * v20);
  if (a2[268] >= 1)
  {
    uint64_t v21 = *(void *)(a1 + 8);
    uint64_t v22 = (*(uint64_t (**)(int *, uint64_t))(*(void *)a2 + 72))(a2, 1);
    uint64_t v23 = *v6;
    int v24 = sub_19E25D8B0((uint64_t)a2, 1);
    uint64_t v25 = *((void *)a2 + 128);
    uint64_t v26 = *((void *)a2 + 127);
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v32 = 0;
    uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t, char *, void *, uint64_t, void **, BOOL))(*(void *)v21 + 56))(v21, v22, v23, v24, v25, v28, (void *)a2 + 38, v26, __p, (v29 & 4) != 0);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    sub_19E25E104(a2, v27);
    operator new();
  }
  operator delete(v11);
  operator delete(v6);
}

void sub_19E323834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  operator delete(__p);
  if (v25) {
    operator delete(v25);
  }
  _Unwind_Resume(a1);
}

void sub_19E3238C8(uint64_t a1, uint64_t a2)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a2 + 104))(a2) != 2)
  {
    int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 72))(a2, 1);
    sub_19E25E288((void *)a2, 4 * v9);
    int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 72))(a2, 1);
    sub_19E25E288((void *)a2, v10);
    operator new();
  }
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 1016);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 80))(a2, 9);
  uint64_t v7 = sub_19E25D8B0(a2, 1);
  std::string __p = 0;
  unsigned int v13 = 0;
  uint64_t v14 = 0;
  uint64_t v8 = sub_19E25DA90(a2, 9);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t **, void **, void, void, float))(*(void *)v4 + 48))(v4, v5, v6, v7, v8, &__p, 0, 0, *(float *)(a2 + 1088));
  if (__p)
  {
    unsigned int v13 = __p;
    operator delete(__p);
  }
  sub_19E25E104((void *)a2, v11);
}

void sub_19E323E08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E323E3C(uint64_t a1, void *a2)
{
  int v3 = (*(uint64_t (**)(void *, uint64_t))(*a2 + 72))(a2, 1);
  sub_19E25E288(a2, v3);
  (*(void (**)(void *))(*a2 + 120))(a2);
  uint64_t v4 = (unsigned char *)a2[138];
  uint64_t v5 = (unsigned char *)a2[139];
  int64_t v6 = v5 - v4;
  if (v5 == v4)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    if (v6 < 0) {
      sub_19E13D694();
    }
    uint64_t v7 = (int *)operator new(v5 - v4);
    uint64_t v8 = &v7[v6 >> 2];
    memcpy(v7, v4, v6);
  }
  int v9 = (unsigned char *)a2[135];
  int v10 = (unsigned char *)a2[136];
  size_t v11 = v10 - v9;
  if (v10 == v9)
  {
    uint64_t v12 = 0;
    unsigned int v13 = v7;
    if (v7 == v8) {
      goto LABEL_17;
    }
  }
  else
  {
    if ((v11 & 0x8000000000000000) != 0) {
      sub_19E13D694();
    }
    uint64_t v12 = operator new(v10 - v9);
    memcpy(v12, v9, v11);
    unsigned int v13 = v7;
    if (v7 == v8)
    {
LABEL_17:
      int v20 = *v13;
      sub_19E25E288(a2, 4 * *v12);
      sub_19E25E288(a2, 4 * *v12);
      sub_19E25E288(a2, *v12);
      sub_19E25E288(a2, 4 * *v7);
      sub_19E25E288(a2, 4 * v20);
      operator new();
    }
  }
  uint64_t v14 = v7 + 1;
  unsigned int v13 = v7;
  if (v7 + 1 != v8)
  {
    int v15 = *v7;
    unsigned int v13 = v7;
    uint64_t v16 = v7 + 1;
    do
    {
      int v18 = *v16++;
      int v17 = v18;
      BOOL v19 = v15 < v18;
      if (v15 <= v18) {
        int v15 = v17;
      }
      if (v19) {
        unsigned int v13 = v14;
      }
      uint64_t v14 = v16;
    }
    while (v16 != v8);
  }
  goto LABEL_17;
}

void sub_19E32461C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26)
{
  operator delete(v27);
  operator delete(v28);
  if (v26) {
    operator delete(v26);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_19E324704(uint64_t a1, _DWORD *a2)
{
  int v3 = a2[318];
  int v4 = (*(uint64_t (**)(_DWORD *))(*(void *)a2 + 88))(a2);
  sub_19E25E288(a2, 4 * v3 * v4);
  int v5 = a2[318];
  int v6 = (*(uint64_t (**)(_DWORD *))(*(void *)a2 + 88))(a2);
  sub_19E25E288(a2, 4 * v5 * v6);
  uint64_t result = (*(uint64_t (**)(_DWORD *))(*(void *)a2 + 120))(a2);
  if ((result & 0x20) == 0)
  {
    uint64_t v8 = (*(uint64_t (**)(_DWORD *))(*(void *)a2 + 112))(a2);
    uint64_t v9 = *(void *)a2;
    if (v8 == 1)
    {
      int v10 = (*(uint64_t (**)(_DWORD *, uint64_t))(v9 + 80))(a2, 9);
      sub_19E25E288(a2, 4 * v10);
      operator new();
    }
    int v11 = (*(uint64_t (**)(_DWORD *, uint64_t))(v9 + 72))(a2, 1);
    sub_19E25E288(a2, v11);
    int v12 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a2 + 72))(a2, 1);
    sub_19E25E288(a2, 4 * v12);
    operator new();
  }
  return result;
}

void sub_19E3255DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E325638(uint64_t a1, _DWORD *a2)
{
  int v4 = a2[318];
  int v5 = (*(uint64_t (**)(_DWORD *))(*(void *)a2 + 88))(a2);
  int v6 = sub_19E25E288(a2, 4 * v4 * v5);
  if (((*(uint64_t (**)(_DWORD *))(*(void *)a2 + 120))(a2) & 0x20) != 0)
  {
    int v10 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a2 + 80))(a2, 9);
    int v11 = (*(uint64_t (**)(_DWORD *))(*(void *)a2 + 88))(a2);
    int v12 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a2 + 56))(a2, 1);
    sub_19E25E288(a2, v12 + v11 * v10);
    operator new();
  }
  int v7 = a2[318];
  int v8 = (*(uint64_t (**)(_DWORD *))(*(void *)a2 + 88))(a2);
  uint64_t v9 = sub_19E25E288(a2, 4 * v7 * v8);
  if ((*(uint64_t (**)(_DWORD *))(*(void *)a2 + 112))(a2) == 1) {
    operator new();
  }
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a2 + 72))(a2, 1);
  uint64_t v15 = (4 * a2[318]);
  uint64_t v16 = sub_19E25D8B0((uint64_t)a2, 1);
  uint64_t v17 = *((void *)a2 + 127);
  uint64_t v18 = *((void *)a2 + 130);
  std::string __p = 0;
  uint64_t v86 = 0;
  unint64_t v87 = 0;
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t, char *, uint64_t, void, void **, _BYTE))(*(void *)v13 + 56))(v13, v14, v15, v16, v17, v6, v18, 0, &__p, 0);
  if (__p)
  {
    uint64_t v86 = __p;
    operator delete(__p);
  }
  sub_19E25E104(a2, v19);
  uint64_t v20 = *(void *)(a1 + 8);
  uint64_t v21 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a2 + 80))(a2, 9);
  uint64_t v22 = (4 * a2[318]);
  uint64_t v23 = *((void *)a2 + 133);
  uint64_t v24 = *((void *)a2 + 136);
  std::string __p = 0;
  uint64_t v86 = 0;
  unint64_t v87 = 0;
  LOBYTE(v83) = 0;
  uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, char *, uint64_t, void, void **, int))(*(void *)v20 + 56))(v20, v21, v22, a2 + 322, v23, v9, v24, 0, &__p, v83);
  if (__p)
  {
    uint64_t v86 = __p;
    operator delete(__p);
  }
  sub_19E25E104(a2, v25);
  uint64_t v26 = *(void *)(a1 + 8);
  sub_19E251738(&__p, 0, 4 * a2[318], 0, 0, 0, 4 * a2[318], 4 * a2[318], 4 * a2[318]);
  uint64_t v27 = (*(uint64_t (**)(uint64_t, void **, char *, char *, char *))(*(void *)v26 + 16))(v26, &__p, v6, v9, v6);
  sub_19E25E104(a2, v27);
  char v28 = (*(uint64_t (**)(_DWORD *))(*(void *)a2 + 120))(a2);
  int v29 = a2[318];
  char v30 = ((*(uint64_t (**)(_DWORD *))(*(void *)a2 + 120))(a2) & 0x10) == 0;
  uint64_t v31 = a2[318];
  uint64_t v32 = *(void *)(a1 + 8);
  uint64_t v33 = *((void *)a2 + 165);
  std::string __p = 0;
  uint64_t v86 = 0;
  unint64_t v87 = 0;
  uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, void, void, double))(*(void *)v32 + 48))(v32, v33, v31, v6, v6, &__p, 0, (4 * v31), 0.0);
  uint64_t v35 = (v29 << ((v28 & 0x10) != 0));
  if (__p)
  {
    uint64_t v86 = __p;
    operator delete(__p);
  }
  sub_19E25E104(a2, v34);
  uint64_t v36 = *(void *)(a1 + 8);
  uint64_t v37 = *((void *)a2 + 167);
  uint64_t v38 = a2[318];
  std::string __p = 0;
  uint64_t v86 = 0;
  unint64_t v87 = 0;
  uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, uint64_t, void, double))(*(void *)v36 + 48))(v36, v37, v38, v6, v6, &__p, v35, (4 * v31), 0.0);
  int v40 = v31 << v30;
  if (__p)
  {
    uint64_t v86 = __p;
    operator delete(__p);
  }
  sub_19E25E104(a2, v39);
  uint64_t v41 = *(void *)(a1 + 8);
  uint64_t v42 = *((void *)a2 + 166);
  uint64_t v43 = a2[318];
  std::string __p = 0;
  uint64_t v86 = 0;
  unint64_t v87 = 0;
  uint64_t v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, void, void, double))(*(void *)v41 + 48))(v41, v42, v43, v6, v6, &__p, (v31 << v30), (4 * v31), 0.0);
  if (__p)
  {
    uint64_t v86 = __p;
    operator delete(__p);
  }
  sub_19E25E104(a2, v44);
  uint64_t v45 = *(void *)(a1 + 8);
  uint64_t v46 = *((void *)a2 + 168);
  uint64_t v47 = a2[318];
  std::string __p = 0;
  uint64_t v86 = 0;
  unint64_t v87 = 0;
  uint64_t v48 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, void, void, double))(*(void *)v45 + 48))(v45, v46, v47, v6, v6, &__p, (3 * v31), (4 * v31), 0.0);
  if (__p)
  {
    uint64_t v86 = __p;
    operator delete(__p);
  }
  sub_19E25E104(a2, v48);
  uint64_t v49 = *(void *)(a1 + 8);
  sub_19E251738(&__p, 2, a2[318], 0, v40, 0, 4 * v31, 4 * v31, 4 * v31);
  uint64_t v50 = (*(uint64_t (**)(uint64_t, void **, char *, char *, char *))(*(void *)v49 + 16))(v49, &__p, v6, v6, v6);
  sub_19E25E104(a2, v50);
  uint64_t v51 = *(void *)(a1 + 8);
  sub_19E251738(&__p, 2, a2[318], v35, 0, v35, 4 * v31, v31, 4 * v31);
  uint64_t v52 = (*(uint64_t (**)(uint64_t, void **, char *, _DWORD *, char *))(*(void *)v51 + 16))(v51, &__p, v6, a2 + 324, v6);
  sub_19E25E104(a2, v52);
  uint64_t v53 = *(void *)(a1 + 8);
  sub_19E251738(&__p, 0, a2[318], 0, v35, 0, 4 * v31, 4 * v31, v31);
  uint64_t v54 = (*(uint64_t (**)(uint64_t, void **, char *, char *, _DWORD *))(*(void *)v53 + 16))(v53, &__p, v6, v6, a2 + 324);
  sub_19E25E104(a2, v54);
  uint64_t v55 = *(void *)(a1 + 8);
  if (*((void *)a2 + 157))
  {
    uint64_t v56 = a2[318];
    uint64_t v57 = operator new(8uLL);
    std::string __p = v57;
    void *v57 = *(void *)(a2 + 73);
    uint64_t v86 = v57 + 1;
    unint64_t v87 = v57 + 1;
    uint64_t v58 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, _DWORD *, void **, void, void, double))(*(void *)v55 + 48))(v55, 9, v56, a2 + 324, a2 + 324, &__p, 0, 0, 0.0);
    if (__p)
    {
      uint64_t v86 = __p;
      operator delete(__p);
    }
    sub_19E25E104(a2, v58);
    int v59 = a2[318];
    int v60 = (*(uint64_t (**)(_DWORD *))(*(void *)a2 + 88))(a2);
    unint64_t v61 = sub_19E25E288(a2, v60 * v59);
    uint64_t v62 = *(void *)(a1 + 8);
    uint64_t v63 = *((void *)a2 + 169);
    uint64_t v64 = a2[318];
    std::string __p = 0;
    uint64_t v86 = 0;
    unint64_t v87 = 0;
    uint64_t v65 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, char *, void **, void, void, double))(*(void *)v62 + 48))(v62, v63, v64, a2 + 324, v61, &__p, 0, 0, 0.0);
    if (__p)
    {
      uint64_t v86 = __p;
      operator delete(__p);
    }
    sub_19E25E104(a2, v65);
    uint64_t v66 = *(void *)(a1 + 8);
    sub_19E251738(&__p, 2, a2[318], 3 * v31, 0, 0, 4 * v31, v31, v31);
    uint64_t v67 = (*(uint64_t (**)(uint64_t, void **, char *, char *, char *))(*(void *)v66 + 16))(v66, &__p, v6, v61, v61);
    sub_19E25E104(a2, v67);
    uint64_t v68 = *(void *)(a1 + 8);
    uint64_t v69 = a2[318];
    uint64_t v70 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a2 + 80))(a2, 9);
    uint64_t v71 = operator new(0x10uLL);
    uint64_t v86 = v71 + 2;
    unint64_t v87 = v71 + 2;
    __asm { FMOV            V0.2S, #1.0 }
    uint64_t v77 = *(void *)(a2 + 73);
    void *v71 = _D0;
    v71[1] = v77;
    std::string __p = v71;
    LOBYTE(v84) = 0;
    uint64_t v78 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, _DWORD *, _DWORD *, _DWORD *, uint64_t, void **, int))(*(void *)v68 + 56))(v68, v69, v70, v61, a2 + 314, a2 + 322, a2 + 76, 9, &__p, v84);
    if (__p)
    {
      uint64_t v86 = __p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t v79 = *((void *)a2 + 169);
    uint64_t v80 = a2[318];
    std::string __p = 0;
    uint64_t v86 = 0;
    unint64_t v87 = 0;
    uint64_t v81 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, _DWORD *, void **, void, void, double))(*(void *)v55 + 48))(v55, v79, v80, a2 + 324, a2 + 322, &__p, 0, 0, 0.0);
    if (__p)
    {
      uint64_t v86 = __p;
      operator delete(__p);
    }
    sub_19E25E104(a2, v81);
    uint64_t v82 = *(void *)(a1 + 8);
    sub_19E251738(&__p, 2, a2[318], 3 * v31, 0, 0, 4 * v31, v31, v31);
    uint64_t v78 = (*(uint64_t (**)(uint64_t, void **, char *, _DWORD *, _DWORD *))(*(void *)v82 + 16))(v82, &__p, v6, a2 + 322, a2 + 322);
  }
  sub_19E25E104(a2, v78);
}

void sub_19E32650C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19E32656C(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 8);
  v20[0] = &unk_1EF0ABD08;
  v20[1] = a2;
  uint64_t v21 = v20;
  v18[0] = &unk_1EF0ABD60;
  v18[1] = a2;
  uint64_t v19 = v18;
  uint64_t v4 = *(void *)(a2 + 1208);
  unint64_t v5 = sub_19E26B3C8(a2 + 1040);
  unint64_t v6 = sub_19E26B3C8(a2 + 1080);
  int v14 = *(_DWORD *)(a2 + 1136);
  long long v7 = *(_OWORD *)(a2 + 1160);
  long long v15 = *(_OWORD *)(a2 + 1144);
  long long v16 = v7;
  uint64_t v17 = *(void *)(a2 + 1176);
  int v11 = *(_DWORD *)(a2 + 1184);
  uint64_t v8 = *(void *)(a2 + 1200);
  uint64_t v12 = *(void *)(a2 + 1192);
  uint64_t v13 = v8;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, void *, void *, uint64_t, unint64_t, unint64_t, int *, int *))(*(void *)v3 + 72))(v3, a2 + 1016, v20, v18, v4, v5, v6, &v14, &v11);
  if (v19 != v18)
  {
    if (v19) {
      (*(void (**)(void))(*v19 + 40))();
    }
    int v10 = v21;
    if (v21 != v20) {
      goto LABEL_5;
    }
LABEL_8:
    (*(void (**)(void *))(v20[0] + 32))(v20);
    goto LABEL_9;
  }
  (*(void (**)(void *))(v18[0] + 32))(v18);
  int v10 = v21;
  if (v21 == v20) {
    goto LABEL_8;
  }
LABEL_5:
  if (v10) {
    (*(void (**)(void *))(*v10 + 40))(v10);
  }
LABEL_9:
  sub_19E25E104((void *)a2, v9);
}

void sub_19E3267A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_19E2F6F7C((uint64_t *)va);
  sub_19E2F6F7C((void *)(v12 - 88));
  _Unwind_Resume(a1);
}

void sub_19E3267BC(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 8);
  v15[0] = &unk_1EF0ABC58;
  v15[1] = a2;
  long long v16 = v15;
  v13[0] = &unk_1EF0ABCB0;
  v13[1] = a2;
  int v14 = v13;
  uint64_t v4 = *(void *)(a2 + 1160);
  unint64_t v5 = sub_19E26B3C8(a2 + 1040);
  unint64_t v6 = sub_19E26B3C8(a2 + 1080);
  int v10 = *(_DWORD *)(a2 + 1136);
  uint64_t v7 = *(void *)(a2 + 1152);
  uint64_t v11 = *(void *)(a2 + 1144);
  uint64_t v12 = v7;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, void *, void *, uint64_t, unint64_t, unint64_t, int *))(*(void *)v3 + 80))(v3, a2 + 1016, v15, v13, v4, v5, v6, &v10);
  if (v14 != v13)
  {
    if (v14) {
      (*(void (**)(void))(*v14 + 40))();
    }
    uint64_t v9 = v16;
    if (v16 != v15) {
      goto LABEL_5;
    }
LABEL_8:
    (*(void (**)(void *))(v15[0] + 32))(v15);
    goto LABEL_9;
  }
  (*(void (**)(void *))(v13[0] + 32))(v13);
  uint64_t v9 = v16;
  if (v16 == v15) {
    goto LABEL_8;
  }
LABEL_5:
  if (v9) {
    (*(void (**)(void *))(*v9 + 40))(v9);
  }
LABEL_9:
  sub_19E25E104((void *)a2, v8);
}

void sub_19E3269C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  sub_19E2F6F7C((uint64_t *)va);
  sub_19E2F6F7C((uint64_t *)va1);
  _Unwind_Resume(a1);
}

void sub_19E3269E4()
{
}

void sub_19E326B24(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E326B38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned char **)(a2 + 1072);
  uint64_t v4 = *(unsigned char **)(a2 + 1080);
  size_t v5 = v4 - v3;
  if (v4 == v3)
  {
    unint64_t v6 = 0;
  }
  else
  {
    if ((v5 & 0x8000000000000000) != 0) {
      sub_19E13D694();
    }
    unint64_t v6 = operator new(v4 - v3);
    memcpy(v6, v3, v5);
  }
  sub_19E25E288((void *)a2, 4 * *v6);
  operator delete(v6);
  int v7 = *(_DWORD *)(a2 + 1064);
  uint64_t v8 = *(unsigned char **)(a2 + 1072);
  uint64_t v9 = *(unsigned char **)(a2 + 1080);
  size_t v10 = v9 - v8;
  if (v9 == v8)
  {
    uint64_t v11 = 0;
  }
  else
  {
    if ((v10 & 0x8000000000000000) != 0) {
      sub_19E13D694();
    }
    uint64_t v11 = operator new(v9 - v8);
    memcpy(v11, v8, v10);
  }
  uint64_t v12 = *(unsigned char **)(a2 + 1096);
  uint64_t v13 = *(unsigned char **)(a2 + 1104);
  size_t v14 = v13 - v12;
  if (v13 == v12)
  {
    long long v15 = 0;
    if (v7 < 1) {
      goto LABEL_15;
    }
LABEL_14:
    operator new();
  }
  if ((v14 & 0x8000000000000000) != 0) {
    sub_19E13D694();
  }
  long long v15 = operator new(v13 - v12);
  memcpy(v15, v12, v14);
  if (v7 >= 1) {
    goto LABEL_14;
  }
LABEL_15:
  if (v15) {
    operator delete(v15);
  }
  if (v11) {
    operator delete(v11);
  }
}

void sub_19E326EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, void *a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  operator delete(v21);
  _Unwind_Resume(a1);
}

void sub_19E326F9C(uint64_t a1, void *a2)
{
  if ((*(int (**)(void *, uint64_t))(*a2 + 72))(a2, 1) >= 2)
  {
    int v3 = (*(uint64_t (**)(void *, uint64_t))(*a2 + 64))(a2, 9);
    sub_19E25E288(a2, v3);
    operator new();
  }
  operator new();
}

void sub_19E327324(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E327338(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E32734C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E327360(uint64_t a1, void *a2)
{
  int v3 = (*(uint64_t (**)(void *, uint64_t))(*a2 + 64))(a2, 9);
  sub_19E25E288(a2, v3);
  (*(void (**)(void *, uint64_t))(*a2 + 80))(a2, 9);
  (*(void (**)(void *, uint64_t))(*a2 + 72))(a2, 1);
  operator new();
}

void sub_19E32753C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E327550(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E327564(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned char **)(a2 + 1072);
  uint64_t v4 = *(unsigned char **)(a2 + 1080);
  size_t v5 = v4 - v3;
  if (v4 == v3)
  {
    unint64_t v6 = 0;
  }
  else
  {
    if ((v5 & 0x8000000000000000) != 0) {
      sub_19E13D694();
    }
    unint64_t v6 = operator new(v4 - v3);
    memcpy(v6, v3, v5);
  }
  sub_19E25E288((void *)a2, *v6);
  operator delete(v6);
  int v7 = *(_DWORD *)(a2 + 1064);
  uint64_t v8 = *(unsigned char **)(a2 + 1072);
  uint64_t v9 = *(unsigned char **)(a2 + 1080);
  size_t v10 = v9 - v8;
  if (v9 == v8)
  {
    uint64_t v11 = 0;
  }
  else
  {
    if ((v10 & 0x8000000000000000) != 0) {
      sub_19E13D694();
    }
    uint64_t v11 = operator new(v9 - v8);
    memcpy(v11, v8, v10);
  }
  uint64_t v12 = *(unsigned char **)(a2 + 1096);
  uint64_t v13 = *(unsigned char **)(a2 + 1104);
  size_t v14 = v13 - v12;
  if (v13 == v12)
  {
    long long v15 = 0;
    if (v7 < 1) {
      goto LABEL_15;
    }
LABEL_14:
    operator new();
  }
  if ((v14 & 0x8000000000000000) != 0) {
    sub_19E13D694();
  }
  long long v15 = operator new(v13 - v12);
  memcpy(v15, v12, v14);
  if (v7 >= 1) {
    goto LABEL_14;
  }
LABEL_15:
  if (v15) {
    operator delete(v15);
  }
  if (v11) {
    operator delete(v11);
  }
}

void sub_19E3279E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  operator delete(v23);
  _Unwind_Resume(a1);
}

uint64_t sub_19E327A88(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(*a2 + 72))(a2, 1);
  if ((int)result <= 1)
  {
    (*(void (**)(void *, uint64_t))(*a2 + 80))(a2, 9);
    (*(void (**)(void *, uint64_t))(*a2 + 72))(a2, 1);
    int v4 = (*(uint64_t (**)(void *, uint64_t))(*a2 + 64))(a2, 9);
    sub_19E25E288(a2, v4);
    operator new();
  }
  return result;
}

void sub_19E327CAC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E327CC0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19E327CD8(void *a1)
{
  uint64_t v1 = sub_19E254DDC(a1);

  operator delete(v1);
}

void sub_19E327D08(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 16);
  if (v4 == 1)
  {
    float __B = (float)(*(float *)(a1 + 40) - *(float *)(a1 + 44)) * -0.0039062;
    vDSP_vflt8(**(const char ***)(a1 + 24), 1, **(float ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vsmul(**(const float ***)(a1 + 32), 1, &__B, **(float ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
  }
  else if (!v4)
  {
    float __B = -256.0 / (float)(*(float *)(a1 + 40) - *(float *)(a1 + 44));
    float __C = 127.1;
    float v5 = -127.1;
    vDSP_vsmul(**(const float ***)(a1 + 24), 1, &__B, **(float ***)(a1 + 48), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vclip(**(const float ***)(a1 + 48), 1, &v5, &__C, **(float ***)(a1 + 48), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vfixr8(**(const float ***)(a1 + 48), 1, **(char ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
  }
}

_DWORD *sub_19E327E5C(_DWORD *result, int a2)
{
  if (a2 >= 1)
  {
    unint64_t v2 = result;
    int v3 = result[7];
    if (v3 >= 1)
    {
      for (int i = 0; i != a2; ++i)
      {
        if (v3 >= 1)
        {
          uint64_t v6 = 0;
          do
          {
            uint64_t result = memmove((void *)(**((void **)v2 + 5) + v2[6] * ((int)v6 + i * v3)), (const void *)(**((void **)v2 + 4)+ v2[6] * (int)(*(float *)(**((void **)v2 + 2) + 4 * (v6 + i * v3)) + 0.5)), (int)v2[6]);
            int v3 = v2[7];
            ++v6;
          }
          while ((int)v6 < v3);
        }
      }
    }
  }
  return result;
}

void sub_19E327F30(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 16);
  if (v4 == 1)
  {
    float __B = (float)(*(float *)(a1 + 40) - *(float *)(a1 + 44)) * -0.0039062;
    vDSP_vflt8(**(const char ***)(a1 + 24), 1, **(float ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vsmul(**(const float ***)(a1 + 32), 1, &__B, **(float ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
  }
  else if (!v4)
  {
    float __B = -256.0 / (float)(*(float *)(a1 + 40) - *(float *)(a1 + 44));
    float __C = 127.1;
    float v5 = -127.1;
    vDSP_vsmul(**(const float ***)(a1 + 24), 1, &__B, **(float ***)(a1 + 48), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vclip(**(const float ***)(a1 + 48), 1, &v5, &__C, **(float ***)(a1 + 48), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vfixr8(**(const float ***)(a1 + 48), 1, **(char ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
  }
}

_DWORD *sub_19E328084(_DWORD *result, int a2)
{
  if (a2 >= 1)
  {
    unint64_t v2 = result;
    int v3 = result[7];
    if (v3 >= 1)
    {
      for (int i = 0; i != a2; ++i)
      {
        if (v3 >= 1)
        {
          uint64_t v6 = 0;
          do
          {
            uint64_t result = memmove((void *)(**((void **)v2 + 5) + 4 * v2[6] * ((int)v6 + i * v3)), (const void *)(**((void **)v2 + 4)+ 4 * v2[6] * (int)(*(float *)(**((void **)v2 + 2) + 4 * (v6 + i * v3)) + 0.5)), 4 * (int)v2[6]);
            int v3 = v2[7];
            ++v6;
          }
          while ((int)v6 < v3);
        }
      }
    }
  }
  return result;
}

void *sub_19E32815C(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EF0ABD08;
  result[1] = v3;
  return result;
}

uint64_t sub_19E3281A4(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF0ABD08;
  a2[1] = v2;
  return result;
}

double sub_19E3281D0@<D0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)&double result = sub_19E2543E8(*(void *)(a1 + 8), *a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_19E3281DC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_0") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_0"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  }
  return 0;
}

void *sub_19E32824C()
{
  return &unk_1EF0A4E78;
}

void *sub_19E328260(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_1EF0ABD60;
  result[1] = v3;
  return result;
}

uint64_t sub_19E3282A8(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF0ABD60;
  a2[1] = v2;
  return result;
}

double sub_19E3282D4@<D0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)&double result = sub_19E254444(*(void *)(a1 + 8), *a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_19E3282E0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_1") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_1"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  }
  return 0;
}

void *sub_19E328350()
{
  return &unk_1EF0A4E88;
}

void *sub_19E328364(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_1EF0ABC58;
  result[1] = v3;
  return result;
}

uint64_t sub_19E3283AC(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF0ABC58;
  a2[1] = v2;
  return result;
}

double sub_19E3283D8@<D0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)&double result = sub_19E2543E8(*(void *)(a1 + 8), *a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_19E3283E4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_0") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_0"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  }
  return 0;
}

void *sub_19E328454()
{
  return &unk_1EF0A4E58;
}

void *sub_19E328468(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = &unk_1EF0ABCB0;
  result[1] = v3;
  return result;
}

uint64_t sub_19E3284B0(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF0ABCB0;
  a2[1] = v2;
  return result;
}

double sub_19E3284DC@<D0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)&double result = sub_19E254444(*(void *)(a1 + 8), *a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_19E3284E8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_1") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_1"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  }
  return 0;
}

void *sub_19E328558()
{
  return &unk_1EF0A4E68;
}

void sub_19E3286CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E3286E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E3286F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19)
{
  objc_destroyWeak(v24);
  objc_destroyWeak((id *)(v25 - 88));

  _Unwind_Resume(a1);
}

void sub_19E328C84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend_computeLoss_(WeakRetained, v2, *(void *)(a1 + 32), v3);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 64));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_19E328CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E328E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E328E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E329254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19E329398(uint64_t a1, void *a2)
{
  id v83 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  for (unint64_t i = 0; ; ++i)
  {
    int v7 = objc_msgSend_lossLabels(*(void **)(a1 + 32), v3, v4, v5);
    unint64_t v11 = objc_msgSend_count(v7, v8, v9, v10);

    if (i >= v11) {
      break;
    }
    uint64_t v12 = *(void **)(a1 + 40);
    if (!v12) {
      continue;
    }
    objc_msgSend_data(v12, v3, v4, v5);
    id v13 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_contents(v13, v14, v15, v16);
    uint64_t v21 = objc_msgSend_rowBytes(*(void **)(a1 + 40), v18, v19, v20);

    uint64_t v25 = objc_msgSend_outputChannels(*(void **)(a1 + 48), v22, v23, v24);
    uint64_t v29 = v25;
    int v84 = 0;
    if (v25)
    {
      if (v25 < 0) {
        sub_19E13D694();
      }
      uint64_t v30 = 4 * v25;
      int v84 = operator new(4 * v25);
      memcpy(v84, (const void *)(v17 + v21 * i), 4 * v29);
      uint64_t v31 = (float *)operator new(4 * v29);
      memcpy(v31, v84, 4 * v29);
      uint64_t v32 = v31;
      if (v29 != 1)
      {
        uint64_t v33 = v31 + 1;
        float v34 = *v31;
        uint64_t v35 = v30 - 4;
        uint64_t v32 = v31;
        uint64_t v36 = v31 + 1;
        do
        {
          float v37 = *v36++;
          BOOL v38 = v34 < v37;
          float v34 = fmaxf(v34, v37);
          if (v38) {
            uint64_t v32 = v33;
          }
          uint64_t v33 = v36;
          v35 -= 4;
        }
        while (v35);
      }
      unint64_t v39 = (unint64_t)((char *)v32 - (char *)v31) >> 2;
      operator delete(v31);
    }
    else
    {
      LODWORD(v39) = 0;
    }
    uint64_t v40 = *(void *)(a1 + 56);
    uint64_t v41 = objc_msgSend_labels(*(void **)(a1 + 32), v26, v27, v28);
    uint64_t v44 = objc_msgSend_objectAtIndexedSubscript_(v41, v42, i, v43);
    unsigned int v48 = objc_msgSend_unsignedIntegerValue(v44, v45, v46, v47);
    unsigned int v49 = v48;
    uint64_t v50 = (uint64_t **)(v40 + 8);
    v40 += 8;
    uint64_t v53 = *(void *)(v40 + 8);
    uint64_t v52 = (void *)(v40 + 8);
    uint64_t v51 = v53;
    if (v53)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v54 = (void *)v51;
          unsigned int v55 = *(_DWORD *)(v51 + 32);
          if (v55 <= v48) {
            break;
          }
          uint64_t v51 = *v54;
          uint64_t v52 = v54;
          if (!*v54) {
            goto LABEL_21;
          }
        }
        if (v55 >= v48) {
          break;
        }
        uint64_t v51 = v54[1];
        if (!v51)
        {
          uint64_t v52 = v54 + 1;
          goto LABEL_21;
        }
      }
      uint64_t v56 = (char *)v54;
      uint64_t v61 = v54[6];
      int v60 = v54 + 6;
      uint64_t v59 = v61;
      if (v61) {
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v54 = v52;
LABEL_21:
      uint64_t v56 = (char *)operator new(0x40uLL);
      *((_DWORD *)v56 + 8) = v49;
      *((void *)v56 + 7) = 0;
      *((void *)v56 + 6) = 0;
      *((void *)v56 + 5) = v56 + 48;
      *(void *)uint64_t v56 = 0;
      *((void *)v56 + 1) = 0;
      *((void *)v56 + 2) = v54;
      void *v52 = v56;
      uint64_t v57 = (uint64_t *)**v50;
      uint64_t v58 = (uint64_t *)v56;
      if (v57)
      {
        *uint64_t v50 = v57;
        uint64_t v58 = (uint64_t *)*v52;
      }
      sub_19E13C8A0(v50[1], v58);
      v50[2] = (uint64_t *)((char *)v50[2] + 1);
      int v60 = v56 + 48;
      uint64_t v59 = *((void *)v56 + 6);
      if (v59)
      {
        while (1)
        {
LABEL_28:
          while (1)
          {
            uint64_t v62 = (void *)v59;
            unsigned int v63 = *(_DWORD *)(v59 + 28);
            if (v63 <= v39) {
              break;
            }
            uint64_t v59 = *v62;
            int v60 = v62;
            if (!*v62) {
              goto LABEL_32;
            }
          }
          if (v63 >= v39) {
            break;
          }
          uint64_t v59 = v62[1];
          if (!v59)
          {
            int v60 = v62 + 1;
            goto LABEL_32;
          }
        }
        uint64_t v64 = v62;
        goto LABEL_36;
      }
    }
    uint64_t v62 = v60;
LABEL_32:
    uint64_t v64 = operator new(0x28uLL);
    v64[7] = v39;
    v64[8] = 0;
    *(void *)uint64_t v64 = 0;
    *((void *)v64 + 1) = 0;
    *((void *)v64 + 2) = v62;
    *int v60 = v64;
    uint64_t v65 = **((void **)v56 + 5);
    uint64_t v66 = (uint64_t *)v64;
    if (v65)
    {
      *((void *)v56 + 5) = v65;
      uint64_t v66 = (uint64_t *)*v60;
    }
    sub_19E13C8A0(*((uint64_t **)v56 + 6), v66);
    ++*((void *)v56 + 7);
LABEL_36:

    ++v64[8];
    uint64_t v70 = objc_msgSend_labels(*(void **)(a1 + 32), v67, v68, v69);
    uint64_t v73 = objc_msgSend_objectAtIndexedSubscript_(v70, v71, i, v72);
    uint64_t v77 = objc_msgSend_unsignedIntegerValue(v73, v74, v75, v76);
    *(float *)(*(void *)(a1 + 56) + 32) = *(float *)(*(void *)(a1 + 56) + 32) + log2f(*((float *)v84 + v77));

    operator delete(v84);
  }
  objc_msgSend_computeLoss_(WeakRetained, v3, *(void *)(a1 + 32), v5);
  *(float *)(*(void *)(a1 + 56) + 36) = *(float *)(*(void *)(a1 + 56) + 36)
                                          + (float)(v81
                                                  * (float)(unint64_t)objc_msgSend_batchSize(*(void **)(a1 + 64), v78, v79, v80));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

void sub_19E329760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  _Unwind_Resume(a1);
}

void sub_19E329778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, id a11, void *__p, uint64_t a13)
{
  if (__p)
  {
    operator delete(__p);

    _Unwind_Resume(a1);
  }

  _Unwind_Resume(a1);
}

void sub_19E329BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  _Unwind_Resume(a1);
}

__n128 sub_19E329D30(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_19E329D54(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

char *sub_19E329D6C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_data(*(void **)(a1 + 32), a2, a3, a4);
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (char *)objc_msgSend_contents(v5, v6, v7, v8);
  objc_msgSend_rowBytes(*(void **)(a1 + 32), v10, v11, v12);

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  size_t v14 = *(void **)(v13 + 48);
  uint64_t v18 = objc_msgSend_rows(*(void **)(a1 + 32), v15, v16, v17);
  uint64_t v22 = objc_msgSend_columns(*(void **)(a1 + 32), v19, v20, v21) * v18;

  return sub_19E15A5A4((unint64_t *)(v13 + 48), v14, v9, &v9[4 * v22], v22);
}

void sub_19E329E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E329E14(unsigned int *a1, unsigned int a2, int a3, unsigned int a4, int a5)
{
  *a1 = a2;
  *(_OWORD *)(a1 + 1) = 0u;
  id v5 = a1 + 1;
  *(_OWORD *)(a1 + 5) = 0u;
  *(_OWORD *)(a1 + 9) = 0u;
  *(_OWORD *)(a1 + 13) = 0u;
  *(_OWORD *)(a1 + 17) = 0u;
  *(_OWORD *)(a1 + 21) = 0u;
  *(_OWORD *)(a1 + 25) = 0u;
  *(_OWORD *)(a1 + 29) = 0u;
  a1[33] = 0;
  if (!a2) {
    return 0;
  }
  uint64_t v9 = (pthread_cond_t *)(a1 + 20);
  a1[1] = a3 + a2;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 4), 0);
  pthread_cond_init(v9, 0);
  size_t v10 = 184 * a1[1];
  uint64_t v11 = malloc_type_malloc(v10, 0xF4558A7uLL);
  *((void *)a1 + 1) = v11;
  if (v11)
  {
    bzero(v11, v10);
    if (*v5)
    {
      unint64_t v12 = 0;
      size_t v13 = a4;
      uint64_t v14 = 176;
      uint64_t v15 = "***tpThreadInit: Error initializing mutex";
      while (1)
      {
        uint64_t v17 = *((void *)a1 + 1);
        uint64_t v18 = v17 + v14;
        uint64_t v19 = malloc_type_malloc(v13, 0x8D357E3BuLL);
        *(void *)(v17 + v14 - 32) = v19;
        if (!v19) {
          goto LABEL_13;
        }
        bzero(v19, v13);
        *(_DWORD *)(v18 - 176) = 0;
        *(_DWORD *)(v18 - 48) = v12;
        if (v12 < *a1)
        {
          if (pthread_mutex_init((pthread_mutex_t *)(v17 + v14 - 168), 0)) {
            goto LABEL_15;
          }
          if (pthread_cond_init((pthread_cond_t *)(v17 + v14 - 104), 0))
          {
            uint64_t v15 = "***tpThreadInit: Error initializing pthreadCond";
            goto LABEL_15;
          }
          if (pthread_create((pthread_t *)(v17 + v14 - 56), 0, (void *(__cdecl *)(void *))sub_19E329FF8, (void *)(v18 - 176)))
          {
            uint64_t v15 = "***tpThreadInit: Error starting up server thread";
LABEL_15:
            puts(v15);
            free(*((void **)a1 + 1));
            *((void *)a1 + 1) = 0;
            return 3;
          }
        }
        uint64_t v16 = (void *)(v17 + v14);
        *((_DWORD *)v16 - 2) = a5;
        void *v16 = a1;
        ++v12;
        v14 += 184;
        if (v12 >= a1[1]) {
          return 0;
        }
      }
    }
    return 0;
  }
LABEL_13:
  puts("***tpThreadInit: malloc failure");
  return 1;
}

uint64_t sub_19E329FF8(uint64_t a1)
{
  kern_return_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  integer_t policy_info;

  if (*(unsigned char *)(a1 + 168))
  {
    policy_info = *(_DWORD *)(a1 + 128) + 1;
    thread_act_t v2 = MEMORY[0x19F3BC0B0]();
    uint64_t v3 = thread_policy_set(v2, 4u, &policy_info, 1u);
    if (v3) {
      printf("setThreadAffinity: thread_policy_set returned %d\n", v3);
    }
  }
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 8)))
  {
LABEL_17:
    puts("***tpThread: Error acquiring lock; aborting.");
    pthread_exit(0);
  }
  while (1)
  {
    while (!*(_DWORD *)a1)
    {
      uint64_t v7 = pthread_cond_wait((pthread_cond_t *)(a1 + 72), (pthread_mutex_t *)(a1 + 8));
      if (v7)
      {
        printf("***tpThread: Error waiting on condition; error %d; aborting.\n", v7);
        pthread_exit(0);
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    if (*(_DWORD *)(a1 + 136) == 1) {
      return 0;
    }
    *(_DWORD *)(a1 + 160) = (*(uint64_t (**)(void))(a1 + 152))(*(void *)(a1 + 144));
    uint64_t v4 = *(void *)(a1 + 176);
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 16));
    *(_DWORD *)a1 = 0;
    id v5 = *(_DWORD *)(v4 + 128);
    if (v5)
    {
      uint64_t v6 = v5 - 1;
      *(_DWORD *)(v4 + 128) = v6;
      if (!v6) {
        goto LABEL_15;
      }
    }
    else
    {
      puts("***tpThread: internal error, actThreads = 0");
      if (!*(_DWORD *)(v4 + 128)) {
LABEL_15:
      }
        pthread_cond_signal((pthread_cond_t *)(v4 + 80));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 16));
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 8))) {
      goto LABEL_17;
    }
  }
}

unsigned int *sub_19E32A154(unsigned int *result)
{
  if (*result)
  {
    uint64_t v1 = result;
    if (!result[1]) {
      goto LABEL_8;
    }
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *((void *)v1 + 1);
      if (v3 < *v1)
      {
        id v5 = (_DWORD *)(v4 + v2);
        pthread_mutex_lock((pthread_mutex_t *)(v4 + v2 + 8));
        v5[34] = 1;
        _DWORD *v5 = 1;
        pthread_cond_signal((pthread_cond_t *)(v4 + v2 + 72));
        pthread_mutex_unlock((pthread_mutex_t *)(v4 + v2 + 8));
      }
      free(*(void **)(v4 + v2 + 144));
      *(void *)(v4 + v2 + 144) = 0;
      ++v3;
      v2 += 184;
    }
    while (v3 < v1[1]);
    if (*v1)
    {
LABEL_8:
      unint64_t v6 = 0;
      uint64_t v7 = 120;
      do
      {
        uint64_t v8 = *((void *)v1 + 1);
        size_t v13 = 0;
        pthread_join(*(pthread_t *)(v8 + v7), &v13);
        ++v6;
        unint64_t v9 = *v1;
        v7 += 184;
      }
      while (v6 < v9);
      if (v9)
      {
        unint64_t v10 = 0;
        uint64_t v11 = 72;
        do
        {
          unint64_t v12 = (pthread_cond_t *)(*((void *)v1 + 1) + v11);
          pthread_mutex_destroy((pthread_mutex_t *)&v12[-2].__opaque[24]);
          pthread_cond_destroy(v12);
          ++v10;
          v11 += 184;
        }
        while (v10 < *v1);
      }
    }
    free(*((void **)v1 + 1));
    *((void *)v1 + 1) = 0;
    pthread_mutex_destroy((pthread_mutex_t *)(v1 + 4));
    return (unsigned int *)pthread_cond_destroy((pthread_cond_t *)(v1 + 20));
  }
  return result;
}

uint64_t sub_19E32A2A0(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 < a2)
  {
    uint64_t v2 = "tpThreadDispatch: illegal numThreads";
LABEL_5:
    puts(v2);
    return 2;
  }
  if (*(_DWORD *)(a1 + 128))
  {
    uint64_t v2 = "tpThreadDispatch with threads still active";
    goto LABEL_5;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = 160;
  uint64_t v7 = a2;
  while (1)
  {
    uint64_t v8 = *(void *)(a1 + 8);
    uint64_t v9 = v8 + v6;
    *(_DWORD *)(v8 + v6) = 3;
    if (pthread_mutex_lock((pthread_mutex_t *)(v8 + v6 - 152)))
    {
      unint64_t v10 = "tpThreadDispatch: mutex error";
      goto LABEL_17;
    }
    if (*(_DWORD *)(v9 - 160))
    {
      printf("tpThreadDispatch: thread %u not idle\n", v5);
      return 3;
    }
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
    *(int32x2_t *)(a1 + 128) = vadd_s32(*(int32x2_t *)(a1 + 128), (int32x2_t)0x100000001);
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
    *(_DWORD *)(v9 - 160) = 1;
    if (pthread_cond_signal((pthread_cond_t *)(v8 + v6 - 88))) {
      break;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v8 + v6 - 152));
    uint64_t result = 0;
    ++v5;
    v6 += 184;
    if (v7 == v5) {
      return result;
    }
  }
  unint64_t v10 = "tpThreadDispatch: pthread_cond_signal error";
LABEL_17:
  puts(v10);
  return 3;
}

uint64_t sub_19E32A3F4(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  while (*(_DWORD *)(a1 + 128))
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), v2);
  uint64_t v3 = *(unsigned int *)(a1 + 132);
  if (v3)
  {
    uint64_t v4 = (unsigned int *)(*(void *)(a1 + 8) + 160);
    while (1)
    {
      unsigned int v6 = *v4;
      v4 += 46;
      uint64_t v5 = v6;
      if (v6) {
        break;
      }
      if (!--v3) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t v5 = 0;
  }
  *(_DWORD *)(a1 + 132) = 0;
  pthread_mutex_unlock(v2);
  return v5;
}

uint64_t sub_19E32A47C(uint64_t a1, float64x2_t *a2, void **a3)
{
  sub_19E312858(a1);
  if (!a1 || !a3 || (uint64_t v12 = *(void *)(a1 + 8)) == 0)
  {
    sub_19E3129F8(a1, "NULL args to nlopt_optimize", v6, v7, v8, v9, v10, v11, v200);
    return 4294967294;
  }
  uint64_t v216 = 0;
  uint64_t v217 = 0;
  uint64_t v218 = 0;
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  int v15 = *(_DWORD *)(a1 + 32);
  if (v15)
  {
    uint64_t v217 = *(void *)(a1 + 24);
    uint64_t v218 = v13;
    uint64_t v216 = v12;
    *(void *)(a1 + 8) = sub_19E32B00C;
    *(void *)(a1 + 16) = &v216;
    if (v14) {
      *(void *)(a1 + 24) = sub_19E32B0A8;
    }
    *(double *)(a1 + 104) = -*(double *)(a1 + 104);
    *(_DWORD *)(a1 + 32) = 0;
  }
  uint64_t v16 = *(unsigned int *)(a1 + 4);
  if (v16)
  {
    uint64_t v17 = *(float64x2_t **)(a1 + 40);
    uint64_t v18 = *(float64x2_t **)(a1 + 48);
    if (v16 >= 8)
    {
      uint64_t v19 = v16 & 0xFFFFFFF8;
      uint64_t v22 = v17 + 2;
      uint64_t v23 = v18 + 2;
      int32x4_t v24 = 0uLL;
      uint64_t v25 = v19;
      int32x4_t v26 = 0uLL;
      do
      {
        float64x2_t v27 = v22[-2];
        float64x2_t v28 = v22[-1];
        float64x2_t v29 = *v22;
        float64x2_t v30 = v22[1];
        v22 += 4;
        float64x2_t v31 = v23[-2];
        float64x2_t v32 = v23[-1];
        float64x2_t v33 = *v23;
        float64x2_t v34 = v23[1];
        v23 += 4;
        int32x4_t v24 = vsubq_s32(v24, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v27, v31), (int32x4_t)vceqq_f64(v28, v32))));
        int32x4_t v26 = vsubq_s32(v26, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v29, v33), (int32x4_t)vceqq_f64(v30, v34))));
        v25 -= 8;
      }
      while (v25);
      int v20 = vaddvq_s32(vaddq_s32(v26, v24));
      if (v19 == v16) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v19 = 0;
      int v20 = 0;
    }
    uint64_t v35 = v16 - v19;
    uint64_t v36 = v19;
    float v37 = &v18->f64[v36];
    BOOL v38 = &v17->f64[v36];
    do
    {
      double v39 = *v38++;
      double v40 = v39;
      double v41 = *v37++;
      if (v40 != v41) {
        ++v20;
      }
      --v35;
    }
    while (v35);
  }
  else
  {
    int v20 = 0;
  }
LABEL_20:
  uint64_t v42 = a1;
  if (v20 == v16) {
    goto LABEL_21;
  }
  BOOL v58 = *(_DWORD *)a1 > 0x2Bu || ((1 << *(_DWORD *)a1) & 0xC0C3E0813FFLL) == 0;
  uint64_t v42 = a1;
  if (v58) {
    goto LABEL_21;
  }
  uint64_t v59 = *(void *)(a1 + 96);
  *(void *)(a1 + 96) = 0;
  uint64_t v60 = sub_19E312340(a1);
  *(void *)(a1 + 96) = v59;
  if (!v60)
  {
LABEL_144:
    sub_19E3129F8(a1, "failure allocating elim_opt", v61, v62, v63, v64, v65, v66, v200);
    uint64_t v21 = 4294967293;
    goto LABEL_145;
  }
  uint64_t v42 = v60;
  uint64_t v67 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
  uint64_t v68 = v67;
  uint64_t v69 = *(unsigned int *)(a1 + 4);
  if (v69 && !v67)
  {
LABEL_143:
    sub_19E311F9C(v42);
    goto LABEL_144;
  }
  if ((*(_DWORD *)a1 & 0xFFFFFFFE) == 8)
  {
    uint64_t v70 = malloc_type_malloc(8 * v69, 0x100004000313F17uLL);
    LODWORD(v69) = *(_DWORD *)(a1 + 4);
    if (v69 && !v70) {
      goto LABEL_142;
    }
  }
  else
  {
    uint64_t v70 = 0;
  }
  uint64_t v120 = *(float64x2_t **)(a1 + 40);
  uint64_t v119 = *(float64x2_t **)(a1 + 48);
  uint64_t v201 = v12;
  uint64_t v202 = v13;
  if (v69)
  {
    uint64_t v121 = v69;
    if (v69 < 8)
    {
      uint64_t v122 = 0;
      int v123 = 0;
      goto LABEL_86;
    }
    uint64_t v122 = v69 & 0xFFFFFFF8;
    long long v124 = v120 + 2;
    uint64_t v125 = v119 + 2;
    int32x4_t v126 = 0uLL;
    uint64_t v127 = v121 & 0xFFFFFFF8;
    int32x4_t v128 = 0uLL;
    do
    {
      float64x2_t v129 = v124[-2];
      float64x2_t v130 = v124[-1];
      float64x2_t v131 = *v124;
      float64x2_t v132 = v124[1];
      v124 += 4;
      float64x2_t v133 = v125[-2];
      float64x2_t v134 = v125[-1];
      float64x2_t v135 = *v125;
      float64x2_t v136 = v125[1];
      v125 += 4;
      int32x4_t v126 = vsubq_s32(v126, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v129, v133), (int32x4_t)vceqq_f64(v130, v134))));
      int32x4_t v128 = vsubq_s32(v128, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v131, v135), (int32x4_t)vceqq_f64(v132, v136))));
      v127 -= 8;
    }
    while (v127);
    int v123 = vaddvq_s32(vaddq_s32(v128, v126));
    if (v122 != v121)
    {
LABEL_86:
      uint64_t v137 = v121 - v122;
      uint64_t v138 = v122;
      long long v139 = &v119->f64[v122];
      unint64_t v140 = &v120->f64[v138];
      do
      {
        double v141 = *v140++;
        double v142 = v141;
        double v143 = *v139++;
        if (v142 != v143) {
          ++v123;
        }
        --v137;
      }
      while (v137);
    }
  }
  else
  {
    int v123 = 0;
  }
  *(_DWORD *)(v42 + 4) = v123;
  uint64_t v144 = *(unsigned int *)(a1 + 4);
  uint64_t v145 = *(void *)(v42 + 40);
  if (v144) {
    BOOL v146 = v145 == 0;
  }
  else {
    BOOL v146 = 1;
  }
  if (!v146)
  {
    unsigned int v189 = 0;
    long long v190 = (double *)v120;
    long long v191 = (double *)v119;
    uint64_t v192 = *(unsigned int *)(a1 + 4);
    long long v193 = *(void **)(v42 + 40);
    do
    {
      if (*v190 != *v191) {
        *(void *)(v145 + 8 * v189++) = *v193;
      }
      ++v193;
      ++v191;
      ++v190;
      --v192;
    }
    while (v192);
  }
  if (v144)
  {
    uint64_t v147 = *(void *)(v42 + 48);
    if (v147)
    {
      unsigned int v148 = 0;
      uint64_t v149 = (double *)v120;
      uint64_t v150 = (double *)v119;
      uint64_t v151 = v144;
      float32x4_t v152 = *(void **)(v42 + 48);
      do
      {
        if (*v149 != *v150) {
          *(void *)(v147 + 8 * v148++) = *v152;
        }
        ++v152;
        ++v150;
        ++v149;
        --v151;
      }
      while (v151);
    }
  }
  if (v144)
  {
    uint64_t v153 = *(void *)(v42 + 136);
    if (v153)
    {
      unsigned int v154 = 0;
      uint64_t v155 = (double *)v120;
      uint64_t v156 = (double *)v119;
      uint64_t v157 = v144;
      uint64_t v158 = *(void **)(v42 + 136);
      do
      {
        if (*v155 != *v156) {
          *(void *)(v153 + 8 * v154++) = *v158;
        }
        ++v158;
        ++v156;
        ++v155;
        --v157;
      }
      while (v157);
    }
  }
  int v206 = v15;
  uint64_t v208 = v14;
  if (v144)
  {
    uint64_t v159 = *(void *)(v42 + 200);
    if (v159)
    {
      unsigned int v160 = 0;
      long long v161 = (double *)v120;
      uint64_t v162 = (double *)v119;
      uint64_t v163 = v144;
      long long v164 = *(void **)(v42 + 200);
      do
      {
        if (*v161 != *v162) {
          *(void *)(v159 + 8 * v160++) = *v164;
        }
        ++v164;
        ++v162;
        ++v161;
        --v163;
      }
      while (v163);
    }
  }
  long long v165 = v119;
  v204 = v70;
  *(void *)(v42 + 88) = 0;
  *(void *)(v42 + 96) = 0;
  *(void *)(v42 + 8) = sub_19E32B138;
  uint64_t v167 = *(void *)(a1 + 8);
  uint64_t v166 = *(void *)(a1 + 16);
  long long v168 = malloc_type_malloc(0x40uLL, 0x10C00407EB6F510uLL);
  if (!v168)
  {
    v194 = (void *)(v42 + 16);
    uint64_t v14 = v208;
    int v15 = v206;
    uint64_t v13 = v202;
LABEL_141:
    uint64_t v12 = v201;
    uint64_t v70 = v204;
    void *v194 = 0;
LABEL_142:
    free(v70);
    free(v68);
    goto LABEL_143;
  }
  *long long v168 = v167;
  v168[1] = 0;
  v168[2] = v166;
  *((_DWORD *)v168 + 6) = v144;
  v168[6] = v120;
  v168[7] = v165;
  v168[4] = v68;
  v168[5] = v204;
  *(void *)(v42 + 16) = v168;
  if (*(_DWORD *)(a1 + 56))
  {
    uint64_t v169 = 0;
    unint64_t v170 = 0;
    uint64_t v171 = *(void *)(v42 + 64);
    while (1)
    {
      v172.i64[0] = (uint64_t)sub_19E32B138;
      v172.i64[1] = (uint64_t)sub_19E32B254;
      *(int8x16_t *)(v171 + v169 + 8) = vbicq_s8(v172, (int8x16_t)vceqzq_s64(*(int64x2_t *)(v171 + v169 + 8)));
      uint64_t v173 = *(void *)(a1 + 64) + v169;
      uint64_t v174 = *(void *)(v173 + 32);
      int v175 = *(_DWORD *)(a1 + 4);
      long long v210 = *(_OWORD *)(v173 + 8);
      long long v214 = *(_OWORD *)(a1 + 40);
      long long v176 = malloc_type_malloc(0x40uLL, 0x10C00407EB6F510uLL);
      if (!v176) {
        break;
      }
      *(_OWORD *)long long v176 = v210;
      v176[2] = v174;
      *((_DWORD *)v176 + 6) = v175;
      *((_OWORD *)v176 + 3) = v214;
      v176[4] = v68;
      v176[5] = 0;
      uint64_t v171 = *(void *)(v42 + 64);
      *(void *)(v171 + v169 + 32) = v176;
      ++v170;
      v169 += 48;
      if (v170 >= *(unsigned int *)(a1 + 56)) {
        goto LABEL_118;
      }
    }
    uint64_t v195 = *(void *)(v42 + 64);
    goto LABEL_140;
  }
LABEL_118:
  if (*(_DWORD *)(a1 + 72))
  {
    uint64_t v169 = 0;
    unint64_t v177 = 0;
    uint64_t v178 = *(void *)(v42 + 80);
    while (1)
    {
      v179.i64[0] = (uint64_t)sub_19E32B138;
      v179.i64[1] = (uint64_t)sub_19E32B254;
      *(int8x16_t *)(v178 + v169 + 8) = vbicq_s8(v179, (int8x16_t)vceqzq_s64(*(int64x2_t *)(v178 + v169 + 8)));
      uint64_t v180 = *(void *)(a1 + 80) + v169;
      uint64_t v181 = *(void *)(v180 + 32);
      int v182 = *(_DWORD *)(a1 + 4);
      long long v211 = *(_OWORD *)(v180 + 8);
      long long v215 = *(_OWORD *)(a1 + 40);
      long long v183 = malloc_type_malloc(0x40uLL, 0x10C00407EB6F510uLL);
      if (!v183) {
        break;
      }
      *(_OWORD *)long long v183 = v211;
      v183[2] = v181;
      *((_DWORD *)v183 + 6) = v182;
      *((_OWORD *)v183 + 3) = v215;
      v183[4] = v68;
      v183[5] = 0;
      uint64_t v178 = *(void *)(v42 + 80);
      *(void *)(v178 + v169 + 32) = v183;
      ++v177;
      v169 += 48;
      if (v177 >= *(unsigned int *)(a1 + 72)) {
        goto LABEL_122;
      }
    }
    uint64_t v195 = *(void *)(v42 + 80);
LABEL_140:
    v194 = (void *)(v195 + v169 + 32);
    uint64_t v13 = v202;
    uint64_t v14 = v208;
    int v15 = v206;
    goto LABEL_141;
  }
LABEL_122:
  uint64_t v12 = v201;
  uint64_t v13 = v202;
  uint64_t v14 = v208;
  int v15 = v206;
  if (a2)
  {
    uint64_t v184 = *(unsigned int *)(a1 + 4);
    if (v184)
    {
      int v185 = 0;
      long long v186 = *(double **)(a1 + 40);
      long long v187 = *(double **)(a1 + 48);
      long long v188 = (float64_t *)a2;
      do
      {
        if (*v186 != *v187) {
          a2->f64[v185++] = *v188;
        }
        ++v188;
        ++v187;
        ++v186;
        --v184;
      }
      while (v184);
    }
  }
  *(void *)(a1 + 176) = v42;
LABEL_21:
  if (!a2 || !*(void *)(v42 + 8) || *(_DWORD *)(v42 + 32))
  {
    sub_19E3129F8(v42, "NULL args to nlopt_optimize_", v6, v7, v8, v9, v10, v11, v200);
    uint64_t v21 = 4294967294;
    if (v42 == a1) {
      goto LABEL_145;
    }
LABEL_25:
    uint64_t v212 = a3;
    uint64_t v43 = v14;
    uint64_t v44 = v12;
    uint64_t v45 = v13;
    int v46 = v15;
    free(*(void **)(*(void *)(v42 + 16) + 32));
    free(*(void **)(*(void *)(v42 + 16) + 40));
    free(*(void **)(v42 + 16));
    *(void *)(v42 + 16) = 0;
    if (*(_DWORD *)(v42 + 56))
    {
      unint64_t v47 = 0;
      uint64_t v48 = *(void *)(v42 + 64);
      uint64_t v49 = 32;
      do
      {
        free(*(void **)(v48 + v49));
        uint64_t v48 = *(void *)(v42 + 64);
        *(void *)(v48 + v49) = 0;
        ++v47;
        v49 += 48;
      }
      while (v47 < *(unsigned int *)(v42 + 56));
    }
    if (*(_DWORD *)(v42 + 72))
    {
      unint64_t v50 = 0;
      uint64_t v51 = *(void *)(v42 + 80);
      uint64_t v52 = 32;
      do
      {
        free(*(void **)(v51 + v52));
        uint64_t v51 = *(void *)(v42 + 80);
        *(void *)(v51 + v52) = 0;
        ++v50;
        v52 += 48;
      }
      while (v50 < *(unsigned int *)(v42 + 72));
    }
    sub_19E311F9C(v42);
    int v15 = v46;
    uint64_t v13 = v45;
    uint64_t v12 = v44;
    uint64_t v14 = v43;
    a3 = v212;
    if (!a2) {
      goto LABEL_60;
    }
    uint64_t v53 = *(unsigned int *)(a1 + 4);
    if (!v53) {
      goto LABEL_60;
    }
    uint64_t v54 = *(float64x2_t **)(a1 + 40);
    unsigned int v55 = *(double **)(a1 + 48);
    if (v53 >= 8)
    {
      uint64_t v56 = v53 & 0xFFFFFFF8;
      uint64_t v71 = v54 + 2;
      uint64_t v72 = (float64x2_t *)(v55 + 4);
      int32x4_t v73 = 0uLL;
      uint64_t v74 = v56;
      int32x4_t v75 = 0uLL;
      do
      {
        float64x2_t v76 = v71[-2];
        float64x2_t v77 = v71[-1];
        float64x2_t v78 = *v71;
        float64x2_t v79 = v71[1];
        v71 += 4;
        float64x2_t v80 = v72[-2];
        float64x2_t v81 = v72[-1];
        float64x2_t v82 = *v72;
        float64x2_t v83 = v72[1];
        v72 += 4;
        int32x4_t v73 = vsubq_s32(v73, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v76, v80), (int32x4_t)vceqq_f64(v77, v81))));
        int32x4_t v75 = vsubq_s32(v75, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v78, v82), (int32x4_t)vceqq_f64(v79, v83))));
        v74 -= 8;
      }
      while (v74);
      int v57 = vaddvq_s32(vaddq_s32(v75, v73));
      if (v56 == v53)
      {
LABEL_53:
        uint64_t v91 = (v53 - 1);
        if (v91)
        {
          int v92 = v57 - 1;
          do
          {
            double v93 = v54->f64[v91];
            if (v93 != v55[v91]) {
              double v93 = a2->f64[v92--];
            }
            a2->f64[v91--] = v93;
          }
          while (v91);
        }
        if (v54->f64[0] == *v55) {
          a2->f64[0] = v54->f64[0];
        }
LABEL_60:
        *(void *)(a1 + 176) = 0;
        goto LABEL_145;
      }
    }
    else
    {
      uint64_t v56 = 0;
      int v57 = 0;
    }
    uint64_t v84 = v53 - v56;
    uint64_t v85 = v56;
    uint64_t v86 = &v55[v56];
    unint64_t v87 = &v54->f64[v85];
    do
    {
      double v88 = *v87++;
      double v89 = v88;
      double v90 = *v86++;
      if (v89 != v90) {
        ++v57;
      }
      --v84;
    }
    while (v84);
    goto LABEL_53;
  }
  uint64_t v94 = v12;
  sub_19E312BF0(v42, 0);
  *(void *)(v42 + 176) = 0;
  uint64_t v95 = *(unsigned int *)(v42 + 4);
  unint64_t v96 = *(double (**)(void, float64x2_t *, void, void))(v42 + 8);
  if (!v95)
  {
    *(double *)a3 = v96(0, a2, 0, *(void *)(v42 + 16));
    uint64_t v21 = 1;
    goto LABEL_136;
  }
  uint64_t v207 = v14;
  uint64_t v209 = *(void *)(v42 + 16);
  int v205 = v15;
  long long v97 = *(float64x2_t **)(v42 + 40);
  uint64_t v98 = *(float64x2_t **)(v42 + 48);
  unsigned int v213 = *(_DWORD *)v42;
  uint64_t v220 = 0;
  memset(v219, 0, sizeof(v219));
  *a3 = (void *)0x7FF0000000000000;
  sub_19E312DF8();
  for (uint64_t i = 0; i != v95; ++i)
  {
    double v106 = v97->f64[i];
    double v107 = v98->f64[i];
    double v108 = a2->f64[i];
    if (v106 > v107 || v108 < v106 || v108 > v107)
    {
      sub_19E3129F8(v42, "bounds %d fail %g <= %g <= %g", v99, v100, v101, v102, v103, v104, i);
      goto LABEL_132;
    }
  }
  uint64_t v203 = v96;
  *(_DWORD *)(v42 + 156) = 0;
  LODWORD(v219[0]) = v95;
  *(_OWORD *)((char *)v219 + 8) = *(_OWORD *)(v42 + 104);
  *(_OWORD *)((char *)&v219[1] + 8) = *(_OWORD *)(v42 + 120);
  *(_OWORD *)((char *)&v219[2] + 8) = *(_OWORD *)(v42 + 136);
  *((void *)&v219[3] + 1) = v42 + 156;
  LODWORD(v220) = *(_DWORD *)(v42 + 152);
  uint64_t v221 = *(void *)(v42 + 160);
  double v222 = sub_19E24AB40();
  uint64_t v223 = v42 + 168;
  uint64_t v224 = v42 + 224;
  if (v213 < 3)
  {
    uint64_t v197 = 0;
    while (!sub_19E23906C(v98->f64[v197] - v97->f64[v197]))
    {
      if (v95 == ++v197)
      {
        if (v213) {
          int v198 = 3;
        }
        else {
          int v198 = 0;
        }
        if (v213) {
          int v199 = 10;
        }
        else {
          int v199 = 0;
        }
        if (v213 == 2) {
          int v198 = 6;
        }
        uint64_t v118 = sub_19E31BF30(v95, (uint64_t)v203, v209, (unint64_t)v97, (unint64_t)v98, a2, a3, (uint64_t)v219, 0.0, v198 + v199);
LABEL_160:
        uint64_t v21 = v118;
        goto LABEL_133;
      }
    }
  }
  else
  {
    if (v213 - 3 > 2) {
      goto LABEL_132;
    }
    uint64_t v111 = 0;
    while (!sub_19E23906C(v98->f64[v111] - v97->f64[v111]))
    {
      if (v95 == ++v111)
      {
        uint64_t v118 = sub_19E31A7A4(v95, (double (*)(void, const void *, void, uint64_t))v203, v209, v97, v98, a2, a3, (double *)v219, 0.0, 13);
        goto LABEL_160;
      }
    }
  }
  sub_19E3129F8(v42, "finite domain required for global algorithm", v112, v113, v114, v115, v116, v117, v200);
LABEL_132:
  uint64_t v21 = 4294967294;
LABEL_133:
  uint64_t v14 = v207;
  int v15 = v205;
LABEL_136:
  uint64_t v12 = v94;
  if (v42 != a1) {
    goto LABEL_25;
  }
LABEL_145:
  if (v15)
  {
    *(_DWORD *)(a1 + 32) = v15;
    *(double *)(a1 + 104) = -*(double *)(a1 + 104);
    *(void *)(a1 + 8) = v12;
    *(void *)(a1 + 16) = v13;
    *(void *)(a1 + 24) = v14;
    *(double *)a3 = -*(double *)a3;
  }
  return v21;
}

double sub_19E32B00C(uint64_t a1, uint64_t a2, float64x2_t *a3, uint64_t a4)
{
  unsigned int v5 = a1;
  (*(void (**)(uint64_t, uint64_t, float64x2_t *, void))a4)(a1, a2, a3, *(void *)(a4 + 16));
  if (a3 && v5)
  {
    if (v5 < 4)
    {
      uint64_t v7 = 0;
LABEL_8:
      uint64_t v11 = &a3->f64[v7];
      uint64_t v12 = v5 - v7;
      do
      {
        *uint64_t v11 = -*v11;
        ++v11;
        --v12;
      }
      while (v12);
      return -v6;
    }
    uint64_t v7 = v5 & 0xFFFFFFFC;
    uint64_t v8 = a3 + 1;
    uint64_t v9 = v7;
    do
    {
      float64x2_t v10 = vnegq_f64(*v8);
      v8[-1] = vnegq_f64(v8[-1]);
      *uint64_t v8 = v10;
      v8 += 2;
      v9 -= 4;
    }
    while (v9);
    if (v7 != v5) {
      goto LABEL_8;
    }
  }
  return -v6;
}

float64_t sub_19E32B0A8(uint64_t a1, uint64_t a2, uint64_t a3, float64x2_t *a4, uint64_t a5)
{
  unsigned int v6 = a1;
  (*(void (**)(uint64_t, uint64_t, uint64_t, float64x2_t *, void))(a5 + 8))(a1, a2, a3, a4, *(void *)(a5 + 16));
  if (v6)
  {
    if (v6 < 4)
    {
      uint64_t v8 = 0;
LABEL_7:
      uint64_t v12 = &a4->f64[v8];
      uint64_t v13 = v6 - v8;
      do
      {
        v7.f64[0] = -*v12;
        *v12++ = v7.f64[0];
        --v13;
      }
      while (v13);
      return v7.f64[0];
    }
    uint64_t v8 = v6 & 0xFFFFFFFC;
    uint64_t v9 = a4 + 1;
    uint64_t v10 = v8;
    do
    {
      float64x2_t v7 = vnegq_f64(v9[-1]);
      float64x2_t v11 = vnegq_f64(*v9);
      v9[-1] = v7;
      float64x2_t *v9 = v11;
      v9 += 2;
      v10 -= 4;
    }
    while (v10);
    if (v8 != v6) {
      goto LABEL_7;
    }
  }
  return v7.f64[0];
}

uint64_t sub_19E32B138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 32);
  uint64_t v8 = *(void *)(a4 + 48);
  uint64_t v9 = *(void *)(a4 + 56);
  uint64_t v10 = *(unsigned int *)(a4 + 24);
  if (v10)
  {
    unsigned int v11 = 0;
    uint64_t v12 = *(unsigned int *)(a4 + 24);
    uint64_t v13 = *(double **)(a4 + 56);
    uint64_t v14 = *(double **)(a4 + 48);
    int v15 = *(double **)(a4 + 32);
    do
    {
      double v16 = *v14;
      if (*v14 != *v13) {
        double v16 = *(double *)(a2 + 8 * v11++);
      }
      *v15++ = v16;
      ++v14;
      ++v13;
      --v12;
    }
    while (v12);
  }
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))a4;
  if (a3)
  {
    uint64_t result = v17(v10, v7, *(void *)(a4 + 40), *(void *)(a4 + 16));
    if (v10)
    {
      uint64_t v19 = 0;
      unsigned int v20 = 0;
      do
      {
        if (*(double *)(v8 + v19) != *(double *)(v9 + v19)) {
          *(void *)(a3 + 8 * v20++) = *(void *)(*(void *)(a4 + 40) + v19);
        }
        v19 += 8;
      }
      while (8 * v10 != v19);
    }
  }
  else
  {
    uint64_t v21 = *(void *)(a4 + 16);
    return v17(v10, v7, 0, v21);
  }
  return result;
}

uint64_t sub_19E32B254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (*(_DWORD *)(a6 + 24))
  {
    unsigned int v6 = 0;
    uint64_t v7 = *(double **)(a6 + 48);
    uint64_t v8 = *(double **)(a6 + 56);
    uint64_t v9 = *(unsigned int *)(a6 + 24);
    uint64_t v10 = *(double **)(a6 + 32);
    do
    {
      double v11 = *v7;
      if (*v7 != *v8) {
        double v11 = *(double *)(a4 + 8 * v6++);
      }
      *v10++ = v11;
      ++v7;
      ++v8;
      --v9;
    }
    while (v9);
  }
  return (*(uint64_t (**)(void))(a6 + 8))();
}

__CFString *sub_19E32B2B4(unint64_t a1)
{
  if (a1 <= 0x1B && ((0xFFF7E7Fu >> a1) & 1) != 0)
  {
    uint64_t v2 = *off_1E599D538[a1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

uint64_t sub_19E32B318(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_isEqualToString_(v1, v2, (uint64_t)off_1E9458000, v3))
  {

    return 0;
  }
  else if (objc_msgSend_isEqualToString_(v1, v4, (uint64_t)off_1E9458008, v5))
  {

    return 1;
  }
  else if (objc_msgSend_isEqualToString_(v1, v7, (uint64_t)off_1E9458010, v8))
  {

    return 2;
  }
  else if (objc_msgSend_isEqualToString_(v1, v9, (uint64_t)off_1E9458018, v10))
  {

    return 3;
  }
  else if (objc_msgSend_isEqualToString_(v1, v11, (uint64_t)off_1E9458020, v12))
  {

    return 23;
  }
  else if (objc_msgSend_isEqualToString_(v1, v13, (uint64_t)off_1E9458028, v14))
  {

    return 4;
  }
  else if (objc_msgSend_isEqualToString_(v1, v15, (uint64_t)off_1E9458030, v16))
  {

    return 5;
  }
  else if (objc_msgSend_isEqualToString_(v1, v17, (uint64_t)off_1E9458038, v18))
  {

    return 6;
  }
  else if (objc_msgSend_isEqualToString_(v1, v19, (uint64_t)off_1E9458040, v20))
  {

    return 9;
  }
  else if (objc_msgSend_isEqualToString_(v1, v21, (uint64_t)off_1E9458048, v22))
  {

    return 10;
  }
  else if (objc_msgSend_isEqualToString_(v1, v23, (uint64_t)off_1E9458050, v24))
  {

    return 11;
  }
  else if (objc_msgSend_isEqualToString_(v1, v25, (uint64_t)off_1E9458058, v26))
  {

    return 12;
  }
  else if (objc_msgSend_isEqualToString_(v1, v27, (uint64_t)off_1E9458088, v28))
  {

    return 13;
  }
  else if (objc_msgSend_isEqualToString_(v1, v29, (uint64_t)off_1E9458090, v30))
  {

    return 16;
  }
  else if (objc_msgSend_isEqualToString_(v1, v31, (uint64_t)off_1E9458098, v32))
  {

    return 14;
  }
  else if (objc_msgSend_isEqualToString_(v1, v33, (uint64_t)off_1E94580A0, v34))
  {

    return 17;
  }
  else if (objc_msgSend_isEqualToString_(v1, v35, (uint64_t)off_1E94580A8, v36))
  {

    return 18;
  }
  else if (objc_msgSend_isEqualToString_(v1, v37, (uint64_t)off_1E94580B0, v38))
  {

    return 19;
  }
  else if (objc_msgSend_isEqualToString_(v1, v39, (uint64_t)off_1E94580B8, v40))
  {

    return 20;
  }
  else if (objc_msgSend_isEqualToString_(v1, v41, (uint64_t)off_1E94580C0, v42))
  {

    return 21;
  }
  else if (objc_msgSend_isEqualToString_(v1, v43, (uint64_t)off_1E94580C8, v44))
  {

    return 22;
  }
  else if (objc_msgSend_isEqualToString_(v1, v45, (uint64_t)off_1E94580D0, v46))
  {

    return 24;
  }
  else if (objc_msgSend_isEqualToString_(v1, v47, (uint64_t)off_1E94580D8, v48))
  {

    return 25;
  }
  else if (objc_msgSend_isEqualToString_(v1, v49, (uint64_t)off_1E94580E0, v50))
  {

    return 26;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v1, v51, (uint64_t)off_1E94580E8, v52)) {
      uint64_t v53 = 27;
    }
    else {
      uint64_t v53 = -1;
    }

    return v53;
  }
}

void sub_19E32B7E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_19E32B7F0(unint64_t a1)
{
  if (a1 <= 0xC && ((0x1DFFu >> a1) & 1) != 0)
  {
    uint64_t v2 = *off_1E599D618[a1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

uint64_t sub_19E32B850(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_isEqualToString_(v1, v2, (uint64_t)off_1E94580F0, v3))
  {

    return 0;
  }
  else if (objc_msgSend_isEqualToString_(v1, v4, (uint64_t)off_1E94580F8, v5))
  {

    return 1;
  }
  else if (objc_msgSend_isEqualToString_(v1, v7, (uint64_t)off_1E9458100, v8))
  {

    return 8;
  }
  else if (objc_msgSend_isEqualToString_(v1, v9, (uint64_t)off_1E9458108, v10))
  {

    return 2;
  }
  else if (objc_msgSend_isEqualToString_(v1, v11, (uint64_t)off_1E9458110, v12))
  {

    return 3;
  }
  else if (objc_msgSend_isEqualToString_(v1, v13, (uint64_t)off_1E9458118, v14))
  {

    return 4;
  }
  else if (objc_msgSend_isEqualToString_(v1, v15, (uint64_t)off_1E9458120, v16))
  {

    return 5;
  }
  else if (objc_msgSend_isEqualToString_(v1, v17, (uint64_t)off_1E9458128, v18))
  {

    return 6;
  }
  else if (objc_msgSend_isEqualToString_(v1, v19, (uint64_t)off_1E9458130, v20))
  {

    return 7;
  }
  else if (objc_msgSend_isEqualToString_(v1, v21, (uint64_t)off_1E9458138, v22))
  {

    return 10;
  }
  else if (objc_msgSend_isEqualToString_(v1, v23, (uint64_t)off_1E9458140, v24))
  {

    return 11;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v1, v25, (uint64_t)off_1E9458148, v26)) {
      uint64_t v27 = 12;
    }
    else {
      uint64_t v27 = -1;
    }

    return v27;
  }
}

void sub_19E32BAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_19E32BAB8(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = &off_1E9458150;
LABEL_5:
    uint64_t v3 = *v2;
    return v3;
  }
  if (a1 == 1)
  {
    uint64_t v2 = &off_1E9458158;
    goto LABEL_5;
  }
  uint64_t v3 = 0;
  return v3;
}

uint64_t sub_19E32BB18(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_exMRL_stringForKey_(a1, a2, (uint64_t)off_1E9457F90, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v4, v5, (uint64_t)off_1E9458150, v6))
  {

    return 0;
  }
  else
  {
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v4, v7, (uint64_t)off_1E9458158, v8);

    return isEqualToString;
  }
}

void sub_19E32BBA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_19E32BBB8(unint64_t a1)
{
  if (a1 > 2)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = *off_1E599D680[a1];
  }
  return v2;
}

uint64_t sub_19E32BC0C(void *a1)
{
  id v1 = a1;
  int v4 = objc_msgSend_containsObject_(v1, v2, (uint64_t)off_1E9458178, v3);
  int v7 = objc_msgSend_containsObject_(v1, v5, (uint64_t)off_1E9458180, v6);
  int v10 = objc_msgSend_containsObject_(v1, v8, (uint64_t)off_1E9458188, v9);
  int v13 = objc_msgSend_containsObject_(v1, v11, (uint64_t)off_1E9458190, v12);
  int v16 = objc_msgSend_containsObject_(v1, v14, (uint64_t)off_1E9458198, v15);
  int v19 = objc_msgSend_containsObject_(v1, v17, (uint64_t)off_1E94581A0, v18);
  int v22 = objc_msgSend_containsObject_(v1, v20, (uint64_t)off_1E94581A8, v21);
  int v25 = objc_msgSend_containsObject_(v1, v23, (uint64_t)off_1E94581B0, v24);
  int v28 = objc_msgSend_containsObject_(v1, v26, (uint64_t)off_1E94581B8, v27);
  int v31 = objc_msgSend_containsObject_(v1, v29, (uint64_t)off_1E94581C0, v30);
  uint64_t v32 = 2;
  if (!v4) {
    uint64_t v32 = 0;
  }
  if (v7) {
    v32 |= 4uLL;
  }
  if (v10) {
    v32 |= 0x10uLL;
  }
  if (v13) {
    v32 |= 0x20uLL;
  }
  if (v19 | v16) {
    uint64_t v33 = v32 | 0x40;
  }
  else {
    uint64_t v33 = v32;
  }
  if (v22) {
    v33 |= 0x200uLL;
  }
  if (v25) {
    v33 |= 0x400uLL;
  }
  if (v28) {
    v33 |= 0x80uLL;
  }
  if (v31) {
    uint64_t v34 = v33 | 0x100;
  }
  else {
    uint64_t v34 = v33;
  }

  return v34;
}

void sub_19E32BDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_19E32BDC0(__int16 a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, a4);
  uint64_t v9 = v5;
  if ((a1 & 2) != 0) {
    objc_msgSend_addObject_(v5, v6, (uint64_t)off_1E9458178, v8);
  }
  if ((a1 & 4) != 0) {
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1E9458180, v8);
  }
  if ((a1 & 0x10) != 0) {
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1E9458188, v8);
  }
  if ((a1 & 0x20) != 0) {
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1E9458190, v8);
  }
  if ((a1 & 0x40) != 0)
  {
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1E9458198, v8);
    objc_msgSend_addObject_(v9, v10, (uint64_t)off_1E94581A0, v11);
  }
  if ((a1 & 0x200) != 0) {
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1E94581A8, v8);
  }
  if ((a1 & 0x400) != 0) {
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1E94581B0, v8);
  }
  if ((a1 & 0x80) != 0) {
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1E94581B8, v8);
  }
  if ((a1 & 0x100) != 0) {
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1E94581C0, v8);
  }
  uint64_t v12 = objc_msgSend_copy(v9, v6, v7, v8);

  return v12;
}

void sub_19E32BF04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E32BF14(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_exMRL_stringForKey_(a1, a2, (uint64_t)off_1E9457FA8, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v4, v5, (uint64_t)off_1E9458170, v6))
  {

    return 2;
  }
  else if (objc_msgSend_isEqualToString_(v4, v7, (uint64_t)off_1E9458168, v8))
  {

    return 1;
  }
  else
  {
    objc_msgSend_isEqualToString_(v4, v10, (uint64_t)off_1E9458160, v11);

    return 0;
  }
}

void sub_19E32BFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E32BFE8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_exMRL_stringForKey_(a1, a2, (uint64_t)off_1E9457F98, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v4, v5, (uint64_t)off_1E9458170, v6))
  {

    return 2;
  }
  else if (objc_msgSend_isEqualToString_(v4, v7, (uint64_t)off_1E9458168, v8))
  {

    return 1;
  }
  else
  {
    objc_msgSend_isEqualToString_(v4, v10, (uint64_t)off_1E9458160, v11);

    return 0;
  }
}

void sub_19E32C0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E32C0BC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4 = objc_msgSend_exMRL_arrayForKey_(a1, a2, (uint64_t)off_1E9457FA0, a4);
  uint64_t v5 = sub_19E32BC0C(v4);

  return v5;
}

void sub_19E32C100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E32C110(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (objc_msgSend_isEqualToString_(v3, v4, (uint64_t)off_1E94581E8, v5))
  {

    return a2 + 448;
  }
  if (objc_msgSend_isEqualToString_(v3, v6, (uint64_t)off_1E94581F0, v7))
  {

    return a2 + 576;
  }
  if (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)off_1E94581F8, v10)) {
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)off_1E9458200, v12))
  {

    return a2 + 584;
  }
  if (objc_msgSend_isEqualToString_(v3, v13, (uint64_t)off_1E9458208, v14)) {
    goto LABEL_10;
  }
  if (objc_msgSend_isEqualToString_(v3, v15, (uint64_t)off_1E9458210, v16))
  {

    return a2 + 592;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, (uint64_t)off_1E9458218, v18))
  {

    return a2 + 472;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, (uint64_t)off_1E9458220, v20))
  {

    return a2 + 600;
  }
  else if (objc_msgSend_isEqualToString_(v3, v21, (uint64_t)off_1E9458228, v22))
  {

    return a2 + 480;
  }
  else if (objc_msgSend_isEqualToString_(v3, v23, (uint64_t)off_1E9458230, v24))
  {

    return a2 + 488;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v3, v25, (uint64_t)off_1E9458240, v26))
    {
LABEL_6:

      return a2 + 456;
    }
    if (objc_msgSend_isEqualToString_(v3, v27, (uint64_t)off_1E9458248, v28))
    {
LABEL_10:

      return a2 + 464;
    }
    if (objc_msgSend_isEqualToString_(v3, v29, (uint64_t)off_1E9458238, v30)) {
      uint64_t v31 = a2 + 496;
    }
    else {
      uint64_t v31 = 0;
    }

    return v31;
  }
}

void sub_19E32C39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32C3D0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_19E32C3D0(a1, *a2);
    sub_19E32C3D0(a1, a2[1]);
    sub_19E13C56C((uint64_t)(a2 + 5), (void *)a2[6]);
    operator delete(a2);
  }
}

void sub_19E32C560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32C580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32C698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32C7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32C88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32CC6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32CDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32CDC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_19E32CDD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_network(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_deviceHandler(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_numInputs(*(void **)(a1 + 32), v10, v11, v12);
  uint64_t v17 = objc_msgSend_numOutputs(*(void **)(a1 + 32), v14, v15, v16);
  int v19 = objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v9, v18, v13, v17, 0, 0, 0.0);

  uint64_t v23 = objc_msgSend_network(*(void **)(a1 + 32), v20, v21, v22);
  uint64_t v27 = objc_msgSend_deviceHandler(v23, v24, v25, v26);
  uint64_t v30 = objc_msgSend_matrixToVector_(v27, v28, (uint64_t)v19, v29);

  return v30;
}

void sub_19E32CEA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32CECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32CEDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_19E32CEF0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_network(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_deviceHandler(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_numOutputs(*(void **)(a1 + 32), v10, v11, v12);
  uint64_t v15 = objc_msgSend_biasVectorWithLength_stdDev_values_(v9, v14, v13, 0, 0.0);

  return v15;
}

void sub_19E32CF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32CF84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32D184(_Unwind_Exception *a1)
{
  uint64_t v8 = v6;

  _Unwind_Resume(a1);
}

void sub_19E32D234()
{
  JUMPOUT(0x19E32D23CLL);
}

void sub_19E32D3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32D610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32DA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32DD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32DF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32DF3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32DF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19E32E414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19E32E594(uint64_t a1, void *a2)
{
  id v61 = a2;
  uint64_t v6 = objc_msgSend_weights(*(void **)(a1 + 32), v3, v4, v5);

  if (v6)
  {
    uint64_t v10 = objc_msgSend_weights(*(void **)(a1 + 32), v7, v8, v9);
    objc_msgSend_data(v10, v11, v12, v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_contents(v14, v15, v16, v17);

    uint64_t v19 = *(void *)(a1 + 40);
    if (v19)
    {
      unint64_t v20 = *(void *)(a1 + 48);
      if (v20)
      {
        uint64_t v21 = *(void *)(a1 + 56);
        uint64_t v22 = *(void *)(a1 + 64);
        if (v20 > 7)
        {
          if (v19 == 1)
          {
            if ((unint64_t)(v21 - v18) >= 0x20)
            {
              unint64_t v25 = v20 & 0xFFFFFFFFFFFFFFF8;
              uint64_t v31 = (_OWORD *)(v21 + 16);
              uint64_t v32 = (long long *)(v18 + 16);
              unint64_t v33 = v20 & 0xFFFFFFFFFFFFFFF8;
              do
              {
                long long v34 = *v32;
                *(v31 - 1) = *(v32 - 1);
                _OWORD *v31 = v34;
                v31 += 2;
                v32 += 2;
                v33 -= 8;
              }
              while (v33);
              if (v20 == v25) {
                goto LABEL_27;
              }
            }
            else
            {
              unint64_t v25 = 0;
            }
            unint64_t v35 = v20 - v25;
            uint64_t v36 = (_DWORD *)(v21 + 4 * v25);
            float v37 = (int *)(v18 + 4 * v25);
            do
            {
              int v38 = *v37++;
              *v36++ = v38;
              --v35;
            }
            while (v35);
            goto LABEL_27;
          }
          for (uint64_t i = 0; i != v19; ++i)
          {
            unint64_t v27 = v20;
            uint64_t v28 = (int *)v18;
            uint64_t v29 = (_DWORD *)v21;
            do
            {
              int v30 = *v28++;
              *uint64_t v29 = v30;
              v29 += v19;
              --v27;
            }
            while (v27);
            v21 += 4;
            v18 += v22;
          }
        }
        else
        {
          uint64_t v23 = 0;
          uint64_t v24 = (_DWORD *)(v18 + 12);
          uint64_t v7 = (const char *)(v21 + 4 * v19);
          do
          {
            *(_DWORD *)(v21 + 4 * v23) = *(v24 - 3);
            if (v20 != 1)
            {
              *(_DWORD *)&v7[4 * v23] = *(v24 - 2);
              if (v20 != 2)
              {
                *(_DWORD *)(v21 + 8 * v19 + 4 * v23) = *(v24 - 1);
                if (v20 != 3)
                {
                  *(_DWORD *)(v21 + 12 * v19 + 4 * v23) = *v24;
                  if (v20 != 4)
                  {
                    *(_DWORD *)(v21 + 16 * v19 + 4 * v23) = v24[1];
                    if (v20 != 5)
                    {
                      *(_DWORD *)(v21 + 20 * v19 + 4 * v23) = v24[2];
                      if (v20 != 6) {
                        *(_DWORD *)(v21 + 24 * v19 + 4 * v23) = v24[3];
                      }
                    }
                  }
                }
              }
            }
            ++v23;
            uint64_t v24 = (_DWORD *)((char *)v24 + v22);
          }
          while (v19 != v23);
        }
      }
    }
  }
LABEL_27:
  double v39 = objc_msgSend_biasVector(*(void **)(a1 + 32), v7, v8, v9);

  if (v39)
  {
    uint64_t v43 = objc_msgSend_biasVector(*(void **)(a1 + 32), v40, v41, v42);
    objc_msgSend_data(v43, v44, v45, v46);
    id v47 = objc_claimAutoreleasedReturnValue();
    uint64_t v51 = objc_msgSend_contents(v47, v48, v49, v50);

    for (unint64_t j = 0; ; ++j)
    {
      uint64_t v56 = objc_msgSend_biasVector(*(void **)(a1 + 32), v52, v53, v54);
      unint64_t v60 = objc_msgSend_length(v56, v57, v58, v59);

      if (v60 <= j) {
        break;
      }
      *(_DWORD *)(*(void *)(a1 + 72) + 4 * j) = *(_DWORD *)(v51 + 4 * j);
    }
  }
}

void sub_19E32E834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32E850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32E868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32E87C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32E898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32E8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32E8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32E8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19E32E8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_19E32EA30()
{
  sub_19E15D4D4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19E32EA64(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_19E138000, log, OS_LOG_TYPE_ERROR, "Unable to append the state", buf, 2u);
}

void sub_19E32EAA4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_19E138000, log, OS_LOG_TYPE_ERROR, "Incremental state should have same shape as the past appended states", v1, 2u);
}

void sub_19E32EAE8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_19E138000, log, OS_LOG_TYPE_ERROR, "Incremental state should have sequence length of 1", v1, 2u);
}

void sub_19E32EB2C(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_19E32EB40(void **a1, void **a2, void **a3)
{
  uint64_t v5 = (void **)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((char *)v5 - 1) < 0) {
        operator delete(*(v5 - 3));
      }
      v5 -= 3;
    }
    while (v5 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

void sub_19E32EBBC(void **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2) {
    operator delete(v2);
  }
}

void sub_19E32EBD4(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    uint64_t v8 = v5;
    do
    {
      uint64_t v10 = (void *)*((void *)v8 - 3);
      v8 -= 24;
      uint64_t v9 = v10;
      if (v10)
      {
        *((void *)v5 - 2) = v9;
        operator delete(v9);
      }
      uint64_t v5 = v8;
    }
    while (v8 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

void sub_19E32EC4C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5 = (char *)*a1;
  if (*a1)
  {
    uint64_t v7 = *(char **)(a3 + 56);
    uint64_t v8 = *a1;
    if (v7 != v5)
    {
      uint64_t v9 = *(char **)(a3 + 56);
      do
      {
        uint64_t v11 = (void *)*((void *)v9 - 3);
        v9 -= 24;
        uint64_t v10 = v11;
        if (v11)
        {
          *((void *)v7 - 2) = v10;
          operator delete(v10);
        }
        uint64_t v7 = v9;
      }
      while (v9 != v5);
      uint64_t v8 = *a1;
    }
    *(void *)(a3 + 56) = v5;
    operator delete(v8);
  }
  uint64_t v12 = *a2;
  if (*a2)
  {
    *(void *)(a3 + 32) = v12;
    operator delete(v12);
  }
}

void sub_19E32ECF8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_19E249224(a1, a2);
  if (!v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
    do
    {
      uint64_t v11 = (char *)*(v9 - 3);
      v9 -= 3;
      uint64_t v10 = v11;
      if (v11)
      {
        uint64_t v12 = (char *)*(v4 - 2);
        uint64_t v13 = v10;
        if (v12 != v10)
        {
          do
          {
            id v14 = (void *)*((void *)v12 - 4);
            if (v14)
            {
              *((void *)v12 - 3) = v14;
              operator delete(v14);
            }
            if (*(v12 - 33) < 0) {
              operator delete(*((void **)v12 - 7));
            }
            v12 -= 56;
          }
          while (v12 != v10);
          uint64_t v13 = *v9;
        }
        *(v4 - 2) = v10;
        operator delete(v13);
      }
      uint64_t v4 = v9;
    }
    while (v9 != v2);
    uint64_t v5 = *v8;
  }
  *id v3 = v2;

  operator delete(v5);
}

void sub_19E32EDB0()
{
  sub_19E249200();
  uint64_t v4 = *v3;
  uint64_t v6 = v5;
  if (v4 != v5)
  {
    char v7 = v2;
    do
      uint64_t v4 = sub_19E2470C8(v4 - 12);
    while (v4 != v0);
    uint64_t v6 = *v7;
  }
  *id v1 = v0;
  operator delete(v6);
}

void sub_19E32EE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_19E24920C(a1, a2);
  if (!v6)
  {
    do
    {
      if (*(char *)(v4 - 25) < 0) {
        operator delete(*(void **)(v4 - 48));
      }
      v4 -= 48;
    }
    while (v4 != v2);
    uint64_t v5 = *(void **)v3;
  }
  *(void *)(v3 + 8) = v2;
  operator delete(v5);
}

void sub_19E32EE60()
{
  sub_19E249200();
  do
  {
    uint64_t v2 = *(void **)(v1 - 32);
    if (v2)
    {
      *(void *)(v1 - 24) = v2;
      operator delete(v2);
    }
    if (*(char *)(v1 - 33) < 0) {
      operator delete(*(void **)(v1 - 56));
    }
    v1 -= 56;
  }
  while (v1 != v0);
}

void sub_19E32EEAC(void **a1)
{
  if (*((char *)a1 + 23) < 0) {
    sub_19E2491F8(a1);
  }
}

void sub_19E32EEBC()
{
  sub_19E249200();
  do
  {
    uint64_t v2 = *(void **)(v1 + 24);
    if (v2)
    {
      *(void *)(v1 + 32) = v2;
      operator delete(v2);
    }
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 56;
  }
  while (v1 != v0);
}

void sub_19E32EF08()
{
  sub_19E15D4D4();
  (*(void (**)(void))(v0 + 16))();
  sub_19E2500E0(&dword_19E138000, v1, v2, "Unable to create Espresso E5 Stream: %s", v3, v4, v5, v6, 2u);
}

void sub_19E32EFA0()
{
  sub_19E2500D4();
  sub_19E2500A0(&dword_19E138000, v0, v1, "Unable to create Espresso E5 Stream", v2, v3, v4, v5, v6);
}

uint64_t sub_19E32EFD4()
{
  sub_19E15D4D4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19E32F008()
{
  sub_19E15D4D4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19E32F03C(NSObject *a1)
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl(&dword_19E138000, a1, OS_LOG_TYPE_ERROR, "Unable to clean Espresso stream", v2, 2u);
  }
  __cxa_end_catch();
}

void sub_19E32F0A0()
{
  sub_19E2500D4();
  sub_19E2500A0(&dword_19E138000, v0, v1, "Model is not loaded or has been cleared", v2, v3, v4, v5, v6);
}

void sub_19E32F0D4(char *a1, uint64_t *a2, NSObject *a3)
{
  if (*a1 >= 0) {
    LODWORD(v3) = a2;
  }
  else {
    uint64_t v3 = *a2;
  }
  LODWORD(v4) = 136315138;
  HIDWORD(v4) = v3;
  sub_19E250080(&dword_19E138000, (uint64_t)a2, a3, "Input %s has already been set", v4);
}

void sub_19E32F150()
{
  sub_19E2500C8(*MEMORY[0x1E4F143B8]);
  sub_19E2500BC();
  sub_19E250080(&dword_19E138000, v0, v1, "Logic error, unexpected state input name: %s", v2);
}

void sub_19E32F1C0()
{
  sub_19E2500C8(*MEMORY[0x1E4F143B8]);
  sub_19E2500BC();
  sub_19E250080(&dword_19E138000, v0, v1, "Inconsistent state sizes for: %s", v2);
}

void sub_19E32F230()
{
  sub_19E2500C8(*MEMORY[0x1E4F143B8]);
  sub_19E2500BC();
  sub_19E250080(&dword_19E138000, v0, v1, "Invalid state size for: %s", v2);
}

void sub_19E32F2A0()
{
  sub_19E2500C8(*MEMORY[0x1E4F143B8]);
  sub_19E2500BC();
  sub_19E250080(&dword_19E138000, v0, v1, "Invalid state shape for: %s", v2);
}

void sub_19E32F310()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  sub_19E2500BC();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_19E138000, v1, OS_LOG_TYPE_ERROR, "Number of states (%zu) isn't a multiple of batch size (%d)", v2, 0x12u);
}

void sub_19E32F398(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 5;
  _os_log_error_impl(&dword_19E138000, a2, OS_LOG_TYPE_ERROR, "Cannot convert rank %lu TensorDescriptor to rank %lu FixedShape", (uint8_t *)&v2, 0x16u);
}

void sub_19E32F420()
{
  sub_19E2500D4();
  sub_19E2500A0(&dword_19E138000, v0, v1, "E5RT::ExecutionStream is null", v2, v3, v4, v5, v6);
}

void sub_19E32F454()
{
  sub_19E15D4D4();
  (*(void (**)(void))(v0 + 16))();
  sub_19E2500E0(&dword_19E138000, v1, v2, "Unable to exceute Espresso network. Error: %s", v3, v4, v5, v6, 2u);
}

void sub_19E32F4EC()
{
  sub_19E2500D4();
  sub_19E2500A0(&dword_19E138000, v0, v1, "Unable to execute Espresso network", v2, v3, v4, v5, v6);
}

void sub_19E32F520(NSObject *a1, uint64_t *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = (uint64_t *)*a2;
    }
    int v5 = 136315138;
    uint8_t v6 = v4;
    _os_log_error_impl(&dword_19E138000, a1, OS_LOG_TYPE_ERROR, "%s not found in state", (uint8_t *)&v5, 0xCu);
  }
  __cxa_end_catch();
}

void sub_19E32F5D4(NSObject *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    if (*((char *)a2 + 23) >= 0) {
      uint8_t v6 = a2;
    }
    else {
      uint8_t v6 = (uint64_t *)*a2;
    }
    int v7 = 136315138;
    uint64_t v8 = v6;
    _os_log_error_impl(&dword_19E138000, a1, OS_LOG_TYPE_ERROR, "%s not found in state", (uint8_t *)&v7, 0xCu);
  }
  *(void *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  __cxa_end_catch();
}

void sub_19E32F6A0(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = (uint64_t *)*a1;
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19E138000, a2, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v3, 0xCu);
}

void sub_19E32F738()
{
  sub_19E260448(*MEMORY[0x1E4F143B8]);
  int v2 = 136315138;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_19E138000, v1, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
}

void sub_19E32F7B0(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_19E32F7D4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_19E138000, log, OS_LOG_TYPE_ERROR, "Params specified that weights are being shared with Adaptive Embedding Layer. However, weights don't match.", buf, 2u);
}

void sub_19E32F814(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_19E138000, a2, OS_LOG_TYPE_ERROR, "Unsupported Engine type %d.", (uint8_t *)v3, 8u);
}

void sub_19E32F890(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_19E138000, a2, OS_LOG_TYPE_ERROR, "Cannot create context, Caught exception: %s", (uint8_t *)&v4, 0xCu);
}

void sub_19E32F93C(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_19E32F998(uint64_t a1)
{
  os_log_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_19E32FA14(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_19E32FAD8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_19E24920C(a1, a2);
  if (!v6)
  {
    do
    {
      if (*(char *)(v4 - 25) < 0) {
        operator delete(*(void **)(v4 - 48));
      }
      sub_19E2F2060();
    }
    while (!v6);
    uint64_t v5 = *(void **)v3;
  }
  *(void *)(v3 + 8) = v2;
  operator delete(v5);
}

void sub_19E32FB28()
{
  sub_19E249200();
  uint64_t v4 = (void **)*v3;
  char v6 = v5;
  if (v4 != v5)
  {
    int v7 = v2;
    do
    {
      if (*((char *)v4 - 25) < 0) {
        operator delete(*(v4 - 6));
      }
      sub_19E2F2084();
    }
    while (!v8);
    char v6 = *v7;
  }
  *os_log_t v1 = v0;
  operator delete(v6);
}

uint64_t sub_19E32FB88()
{
  sub_19E15D4D4();
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_19E32FBBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 32))();
}

uint64_t sub_19E32FBE0(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

void sub_19E32FC0C(uint64_t a1)
{
  uint64_t v3 = sub_19E2F209C(a1);
  if (!v6)
  {
    int v7 = v4;
    do
      uint64_t v3 = (uint64_t)sub_19E2470C8((char **)(v3 - 96));
    while (v3 != v1);
    uint64_t v5 = *v7;
  }
  void *v2 = v1;

  operator delete(v5);
}

void sub_19E32FC68(void **a1)
{
  uint64_t v3 = (char **)*a1;
  if (*a1)
  {
    sub_19E249200();
    uint64_t v5 = *(char ***)(v4 + 96);
    char v6 = v3;
    if (v5 != v3)
    {
      do
        uint64_t v5 = sub_19E2470C8(v5 - 12);
      while (v5 != v3);
      char v6 = *v2;
    }
    *(void *)(v1 + 96) = v3;
    operator delete(v6);
  }
}

void sub_19E32FCE4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_19E24920C(a1, a2);
  if (!v6)
  {
    do
    {
      if (*(char *)(v4 - 25) < 0) {
        operator delete(*(void **)(v4 - 48));
      }
      sub_19E2F2060();
    }
    while (!v6);
    uint64_t v5 = *(void **)v3;
  }
  *(void *)(v3 + 8) = v2;

  operator delete(v5);
}

void sub_19E32FD40()
{
  sub_19E249200();
  do
  {
    uint64_t v1 = *(void **)(v0 + 24);
    if (v1)
    {
      *(void *)(v0 + 32) = v1;
      operator delete(v1);
    }
    if (*(char *)(v0 + 23) < 0) {
      operator delete(*(void **)v0);
    }
    sub_19E2F20B4();
  }
  while (!v2);
}

void sub_19E32FD88(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_19E2F206C(a1, a2);
  if (!v7)
  {
    char v8 = v6;
    do
    {
      if (*(char *)(v4 - 25) < 0) {
        operator delete(*(void **)(v4 - 48));
      }
      sub_19E2F2084();
    }
    while (!v7);
    uint64_t v5 = *v8;
  }
  *(void *)(v3 + 24) = v2;

  operator delete(v5);
}

void sub_19E32FDE8(uint64_t a1)
{
  uint64_t v3 = sub_19E2F209C(a1);
  if (!v6)
  {
    char v7 = v4;
    do
      uint64_t v3 = (uint64_t)sub_19E2470C8((char **)(v3 - 104));
    while (v3 != v1);
    uint64_t v5 = *v7;
  }
  void *v2 = v1;

  operator delete(v5);
}

void sub_19E32FE44(void *a1)
{
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[2];
  if (v4)
  {
    a1[3] = v4;
    operator delete(v4);
  }
}

void sub_19E32FEAC(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  if (v5)
  {
    *(void *)(a3 + 40) = v5;
    operator delete(v5);
  }
  char v6 = *a2;
  if (*a2)
  {
    *(void *)(a3 + 16) = v6;
    operator delete(v6);
  }
}

void sub_19E32FF08()
{
  sub_19E249200();
  do
  {
    uint64_t v1 = *(void **)(v0 - 32);
    if (v1)
    {
      *(void *)(v0 - 24) = v1;
      operator delete(v1);
    }
    if (*(char *)(v0 - 33) < 0) {
      operator delete(*(void **)(v0 - 56));
    }
    sub_19E2F2090();
  }
  while (!v2);
}

void sub_19E32FF50(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19E138000, log, OS_LOG_TYPE_ERROR, "Unrecognized input name.", v1, 2u);
}

void sub_19E32FF94()
{
  sub_19E260448(*MEMORY[0x1E4F143B8]);
  int v2 = 136315138;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_19E138000, v1, OS_LOG_TYPE_ERROR, "Unrecognized output name: %s", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_19E33000C()
{
  sub_19E15D4D4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_19E330040(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_19E138000, log, OS_LOG_TYPE_ERROR, "dict does not have key: %s", buf, 0xCu);
}

uint64_t BNNSDirectApplyFullyConnectedBatch()
{
  return MEMORY[0x1F40D0FC0]();
}

int BNNSFilterApply(void *filter, const void *in, void *out)
{
  return MEMORY[0x1F40D0FF8](filter, in, out);
}

int BNNSFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride)
{
  return MEMORY[0x1F40D1018](filter, batch_size, in, in_stride, out, out_stride);
}

void *__cdecl BNNSFilterCreateFullyConnectedLayer(const BNNSVectorDescriptor *in_desc, const BNNSVectorDescriptor *out_desc, const BNNSFullyConnectedLayerParameters *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1048](in_desc, out_desc, layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerConvolution(const BNNSLayerParametersConvolution *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1090](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerFullyConnected(const BNNSLayerParametersFullyConnected *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10A8](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerPooling(const BNNSLayerParametersPooling *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10E8](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateVectorActivationLayer(const BNNSVectorDescriptor *in_desc, const BNNSVectorDescriptor *out_desc, const BNNSActivation *activation, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1128](in_desc, out_desc, activation, filter_params);
}

void BNNSFilterDestroy(void *filter)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
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

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
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

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
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

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCopyFragment(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8760](anURL, charactersToLeaveEscaped);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

NSUInteger MPSImageBatchIncrementReadCount(MPSImageBatch *batch, NSInteger amount)
{
  return MEMORY[0x1F40EDE88](batch, amount);
}

NSUInteger MPSStateBatchIncrementReadCount(MPSStateBatch *batch, NSInteger amount)
{
  return MEMORY[0x1F40EDEA0](batch, amount);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
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

uint64_t E5RT::E5Compiler::GetCompiler(E5RT::E5Compiler *this)
{
  return MEMORY[0x1F4117D28](this);
}

uint64_t E5RT::E5Compiler::Compile()
{
  return MEMORY[0x1F4117D40]();
}

uint64_t E5RT::BufferObject::GetDataSpan(E5RT::BufferObject *this)
{
  return MEMORY[0x1F4117D50](this);
}

uint64_t E5RT::ProgramLibrary::GetExportedFunctions(E5RT::ProgramLibrary *this)
{
  return MEMORY[0x1F4117D68](this);
}

uint64_t E5RT::ExecutionStream::ResetStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1F4117D80](this);
}

uint64_t E5RT::ExecutionStream::EncodeOperation()
{
  return MEMORY[0x1F4117D88]();
}

uint64_t E5RT::ExecutionStream::ExecuteStreamSync(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1F4117D90](this);
}

uint64_t E5RT::ExecutionStream::CreateExecutionStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1F4117D98](this);
}

uint64_t E5RT::E5CompilerOptions::SetMilEntryPoints()
{
  return MEMORY[0x1F4117DA8]();
}

uint64_t E5RT::E5CompilerOptions::SetPreferredCpuBackend()
{
  return MEMORY[0x1F4117DC0]();
}

uint64_t E5RT::E5CompilerOptions::SetComputeDeviceTypesAllowed()
{
  return MEMORY[0x1F4117DC8]();
}

uint64_t E5RT::E5CompilerOptions::Create(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x1F4117DD8](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPortRef()
{
  return MEMORY[0x1F4117E00]();
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPortRef()
{
  return MEMORY[0x1F4117E08]();
}

uint64_t E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp()
{
  return MEMORY[0x1F4117E18]();
}

{
  return MEMORY[0x1F4117E20]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::SetOperationName()
{
  return MEMORY[0x1F4117E28]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::Create()
{
  return MEMORY[0x1F4117E30]();
}

uint64_t E5RT::IOPort::BindMemoryObject()
{
  return MEMORY[0x1F4117E40]();
}

uint64_t Espresso::kern_alloc(Espresso *this)
{
  return MEMORY[0x1F4117E58](this);
}

uint64_t Espresso::kern_dealloc(Espresso *this, void *a2)
{
  return MEMORY[0x1F4117E70](this, a2);
}

void Espresso::blob_rtti_root::~blob_rtti_root(Espresso::blob_rtti_root *this)
{
}

uint64_t Espresso::sequential_builder::add_kernel()
{
  return MEMORY[0x1F4117EA0]();
}

uint64_t Espresso::sequential_builder::add_kernel_dbg()
{
  return MEMORY[0x1F4117EA8]();
}

uint64_t Espresso::sequential_builder::build_from_shapes()
{
  return MEMORY[0x1F4117EB0]();
}

uint64_t Espresso::sequential_builder::add_shape_from_kernel()
{
  return MEMORY[0x1F4117EB8]();
}

uint64_t Espresso::sequential_builder::sequential_builder()
{
  return MEMORY[0x1F4117EC0]();
}

uint64_t Espresso::abstract_engine_factory::shared(Espresso::abstract_engine_factory *this)
{
  return MEMORY[0x1F4117ED8](this);
}

uint64_t Espresso::espresso_os_log_subsystem(Espresso *this, const char *a2)
{
  return MEMORY[0x1F4117EE0](this, a2);
}

uint64_t Espresso::dump_network_binserializer()
{
  return MEMORY[0x1F4117EE8]();
}

uint64_t E5RT::TensorDescriptor::AllocateMemory()
{
  return MEMORY[0x1F4117F30]();
}

uint64_t E5RT::TensorDescriptor::GetNumElements(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1F4117F38](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorShape(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1F4117F40](this);
}

uint64_t E5RT::OperandDescriptor::TensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x1F4117F68](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1F4117F88](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1F4117F90](this);
}

uint64_t E5RT::IOPort::GetPortDescriptorRef(E5RT::IOPort *this)
{
  return MEMORY[0x1F4117FA0](this);
}

uint64_t Espresso::abstract_engine_factory::make_kernel_priv()
{
  return MEMORY[0x1F4117FC0]();
}

uint64_t Espresso::abstract_engine_factory::engine_for_platform()
{
  return MEMORY[0x1F4117FC8]();
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1F417E350](this);
}

int std::string::compare(const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E398](this, __pos1, __n1, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

{
  return MEMORY[0x1F417E998]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E450](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1F417E4D0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4C0](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1F417E4D8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4C8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1F417E4E0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

{
  MEMORY[0x1F417E4F0](this);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1F417E728]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1F417E730]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1F417E740]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1F417E748]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1F417E768]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1F417E780]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x1F417E788]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1F417E7C0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1F417E7D8]();
}

{
  return MEMORY[0x1F417E7E0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1F417E840]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E890]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A8]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1F417E908](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1F417E918](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1F417EBE0](__str, __idx, *(void *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

uint64_t std::__sort<std::__less<long,long> &,long *>()
{
  return MEMORY[0x1F417EC60]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1F417EC90]();
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
  return MEMORY[0x1F417EE40]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::exception::~exception(std::exception *this)
{
}

{
  MEMORY[0x1F417EEF0](this);
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
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

void __cxa_bad_cast(void)
{
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

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1F417EF70](a1);
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x1F40C9BC8](a1);
}

uint64_t __isinfd()
{
  return MEMORY[0x1F40C9C08]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t c_network_get_input_names()
{
  return MEMORY[0x1F4117FD8]();
}

uint64_t c_network_get_output_names()
{
  return MEMORY[0x1F4117FF0]();
}

uint64_t cblas_dnrm2_NEWLAPACK()
{
  return MEMORY[0x1F40D1590]();
}

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x1F40D1628]();
}

uint64_t cblas_sgemv_NEWLAPACK()
{
  return MEMORY[0x1F40D1648]();
}

uint64_t cblas_sger_NEWLAPACK()
{
  return MEMORY[0x1F40D1660]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t dgesv_NEWLAPACK()
{
  return MEMORY[0x1F40D1718]();
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dpotrf_NEWLAPACK()
{
  return MEMORY[0x1F40D1780]();
}

long double erf(long double __x)
{
  MEMORY[0x1F40CBF50](__x);
  return result;
}

long double erfc(long double __x)
{
  MEMORY[0x1F40CBF58](__x);
  return result;
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x1F4118628]();
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

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x1F4118748]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x1F4118770]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x1F4118788]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x1F4118798]();
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

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1F41187F8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x1F4118838]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1F4118858]();
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

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC198](__buf, __size, __mode);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getpagesize(void)
{
  return MEMORY[0x1F40CC480]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
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

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
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

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE38](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE80](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
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

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
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

void pthread_exit(void *a1)
{
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
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

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

float tanhf(float a1)
{
  MEMORY[0x1F40CE438](a1);
  return result;
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_measqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_mmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_mtrans(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}

void vDSP_mtransD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}

void vDSP_rmsqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_rmsqvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vdivD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfixr8(const float *__A, vDSP_Stride __IA, char *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vflt8(const char *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsaddD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmsa(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsqD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25B0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2648](src, dest, *(void *)&flags);
}

vFloat vexpf(vFloat a1)
{
  uint64_t v1 = MEMORY[0x1F40D2E28](a1.i64[0], a1.i64[1]);
  result.i64[1] = v2;
  result.i64[0] = v1;
  return result;
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

void vvexp(double *a1, const double *a2, const int *a3)
{
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
}

void vvlog(double *a1, const double *a2, const int *a3)
{
}

void vvtanhf(float *a1, const float *a2, const int *a3)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}